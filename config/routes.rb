Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/news' => 'news#index'
    get '/spotify_authorize' => 'spotify#authorize'
    get '/callback' => 'spotify#callback'
  end
end
