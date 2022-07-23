Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://localhost:4000", "https://127.0.0.1:4000"

    resource "https://127.0.0.1:3000",
      headers: :any,
      methods: [:get, :post]
  end
end
