# what the cookie going to be structured like
if Rails.env == "prod"
  Rails.application.config.session_store :cookie_store, key: "_arkestro_app", domain: "arkestro-challenge.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_arkestro_app"
end

ActiveModelSerializers.config.key_transform = :camel_lower
