require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Untappd < OmniAuth::Strategies::OAuth
      option :name, 'untappd'

      option :client_options, {

      }

      uid { }

      info do
        {

        }
      end
    end
  end
end
