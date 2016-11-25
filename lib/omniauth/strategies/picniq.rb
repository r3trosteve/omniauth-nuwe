require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Picniq < OmniAuth::Strategies::OAuth2

      option :name, "picniq"

      option :client_options, {
        :site => "http://kangaroo.picniq-platform.c66.me",
        :authorize_url => "http://kangaroo.picniq-platform.c66.me/oauth/authorize",
        :token_url => "http://kangaroo.picniq-platform.c66.me/oauth/token"
      }

      uid { raw_info["user"]["id"] }

      info do
        {
          :last_name => raw_info["user"]["profile"]["last_name"],
          :first_name => raw_info["user"]["profile"]["first_name"],
          :email => raw_info["user"]["email"],
          :sex => raw_info["user"]["profile"]["sex"],
          :birth_date => raw_info["user"]["profile"]["birth_date"],
          :activity => raw_info["user"]["profile"]["activity"]

        }
      end

      def raw_info
        @raw_info ||= access_token.get("/v3/profile.json").parsed
      end
    end
  end
end
