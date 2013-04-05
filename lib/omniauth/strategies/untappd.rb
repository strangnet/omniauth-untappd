require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Untappd < OmniAuth::Strategies::OAuth2
      option :name, 'untappd'

      option :client_options, {
          site: 'https://untappd.com',
          authorize_url: '/oauth/authenticate',
          token_url: '/oauth/authorize',
          token_method: :get
      }

      uid { raw_info['uid'] }

      info do
        {
            :id => raw_info['id'],
            :username => raw_info['user_name'],
            :name => "#{raw_info['first_name']} #{raw_info['last_name']}",
            :urls => {
                'website' => raw_info['url'],
                'untappd' => raw_info['untappd_url']
            }
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def request_phase
        options[:authorize_params] = client_params.merge(options[:authorize_params])
        super
      end

      def callback_phase
        options[:token_params] = token_client_params.merge(options[:token_params])
        super
      end

      #def auth_hash
      #  OmniAuth::Utils.deep_merge(super, client_params.merge({:code => 'code'}))
      #end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = :access_token
        @raw_info ||= access_token.get('http://api.untappd.com/v4/user/info').parsed['response']['user']
      end

      private

      def client_params
        {
            :client_id => options[:client_id],
            :client_secret => options[:client_secret],
            :redirect_url => callback_url,
            :response_type => 'code'
        }
      end

      def token_client_params
        {
            :response_type => 'code',
            :redirect_url => callback_url,
            :parse => :json
        }
      end
    end
  end
end


module OAuth2
  class Client
    # Initializes an AccessToken by making a request to the token endpoint
    #
    # @param [Hash] params a Hash of params for the token endpoint
    # @param [Hash] access_token_opts, to pass to the AccessToken object
    # @return [AccessToken] the initalized AccessToken
    def get_token(params, access_token_opts={})
      opts = {:raise_errors => options[:raise_errors], :parse => params.delete(:parse)}
      if options[:token_method] == :post
        headers = params.delete(:headers)
        opts[:body] = params
        opts[:headers] =  {'Content-Type' => 'application/x-www-form-urlencoded'}
        opts[:headers].merge!(headers) if headers
      else
        opts[:params] = params
      end
      response = request(options[:token_method], token_url, opts)
      parsed_response = response.parsed['response']
      raise Error.new(response) if options[:raise_errors] && !(parsed_response.is_a?(Hash) && parsed_response['access_token'])
      AccessToken.from_hash(self, parsed_response.merge(access_token_opts))
    end
  end
end
