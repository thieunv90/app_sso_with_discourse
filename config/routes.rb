Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'discourse/sso' => 'discourse_sso#sso'
  root 'home#index'
end
