Rails.application.routes.draw do
  
  resources :books do
    resources :reviews
  end

  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
end
