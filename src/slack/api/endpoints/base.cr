# https://api.slack.com/web
#
# Pass arguments as:
#
# GET querystring parameters
# POST parameters presented as application/x-www-form-urlencoded
# or a mix of both GET and POST parameters
#
# Most write methods allow arguments application/json attributes.
# https://api.slack.com/web#methods_supporting_json
abstract class Slack::Api::Base
  getter token

  def initialize(@token : String)
  end

  abstract def base_url
  abstract def call
  abstract def content_type : ContentTypes

  def headers
    HTTP::Headers{
      "Content-Type"  => content_type.to_s,
      "Authorization" => "Bearer #{token}",
    }
  end
end