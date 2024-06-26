Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # if Rails.env.production?
    #   origins 'https://mom-and-baby-help.com'
    # else
    #   origins 'http://localhost:3000'
    # end
    # あとで要修正
    # origins "https://mom-and-baby-help.com", "http://localhost:3000"
    origins '*'

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
