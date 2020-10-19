if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_currency-client', domain: '_currency-api'
  else
    Rails.application.config.session_store :cookie_store, key: '_currency-client'
  end