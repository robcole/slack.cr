struct Slack::Api::Team < Slack::Api::BaseModel
  property avatar_base_url : String,
    domain : String,
    email_domain : String,
    icon : JSON::Any,
    id : String,
    is_verified : Bool,
    name : String,
    url : String

  def self.from_json(json : String | IO)
    keyed_json_object(json, find_key: "team")
  end
end
