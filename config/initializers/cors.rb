# whitelist certain domains

# insert a middleware to intercept request
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

  # somewhere deployed on heroku, yet to be configured
  allow do
    origins "https://arkestro-web-7a8267c2e828.herokuapp.com"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
end