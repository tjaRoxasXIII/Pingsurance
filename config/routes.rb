Rails.application.routes.draw do
  resources :leads
  post 'notifications/notify' => 'notifications#notify'

  root 'leads#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
