Rails.application.config.middleware.insert_before 0, Rack::Cors do

  case ENV.fetch("RAILS_ENV") 
  when "development" then create_cors_headers_for origin_url:   "https://localhost:4000", 
                                                  resource_url: "https://localhost:3000"
  when "production" then  create_cors_headers_for origin_url:   "https://tauest-cli.herokuapp.com", 
                                                  resource_url: "https://tauest-srv.herokuapp.com"
  else
    raise 'problems'
  end    

end
  def create_cors_headers_for(origin_url:, resource_url:)
    allow do
        origins origin_url

        resource resource_url,
          headers: :any,
          methods: [:get, :post]
      end
  end
