Rails.application.routes.draw do

  root "requests#new"

  get "/requests" => "requests#index"
  get "/requests/new" => "requests#new", as: :new_request
  post "/requests" => "requests#create"
  get "/requests/:id" => "requests#show", as: :request
  get "/requests/:id/edit" => "requests#edit", as: :edit_request
  patch "/requests/:id" => "requests#update"
  delete "/requests/:id" => "requests#destroy"

end
