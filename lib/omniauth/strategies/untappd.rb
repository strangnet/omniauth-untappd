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

      uid { raw_info['user']['uid'] }

      info do
        {
            :id => raw_info['user']['id'],
            :username => raw_info['user']['user_name'],
            :name => "#{raw_info['user']['first_name']} #{raw_info['user']['last_name']}",
            :urls => {
                'website' => raw_info['user']['url'],
                'untappd' => raw_info['user']['untappd_url']
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

      def auth_hash
        OmniAuth::Utils.deep_merge(super, client_params.merge({:code => 'code'}))
      end

      def raw_info
        access_token.options[:mode] = :query

        @raw_info ||= MultiJson.decode(access_token.get('http://api.untappd.com/v4/user/info').body)
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
