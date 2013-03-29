require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Untappd < OmniAuth::Strategies::OAuth
      option :name, 'untappd'

      option :client_options, {
          :site => 'http://untappd.com',
          :authorize_path => '/oauth/authenticate',
          :request_token_path => '/oauth/request_token'
      }

      uid { raw_info['user']['uid'] }

      info do
        {
            'uid' => raw_info['user']['id'],
            'username' => raw_info['user']['user_name'],
            'url' => raw_info['user']['untappd_url']
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/v4/user/info').body)
      end
    end
  end
end
