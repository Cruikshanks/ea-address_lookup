#
# Example of how me might define an Adaptor for
# https://github.com/alphagov/locate-api
#
module EA
  module AddressLookup
    module Adapters
      module LocateApi
        module_function

        def url
          Rails.configuration.dcs_locate_api_url
        end

        def find_by_postcode(post_code)
          result = RestClient::Request.execute(method: :get,
                                               url: url,
                                               proxy: false,
                                               params: { postcode: post_code })
          JSON.parse(result)
        end
      end
    end
  end
end
