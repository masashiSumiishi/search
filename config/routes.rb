Rails.application.routes.draw do
  get "/tweets/search" => 'tweets#search'
  root to:'tweets#search'
end
