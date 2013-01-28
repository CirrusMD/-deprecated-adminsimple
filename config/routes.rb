Adminsimple::Engine.routes.draw do

  # Dashboard route
  root to: 'adminsimple/dashboard#index'

  # Settings route
  match 'settings' => 'adminsimple/settings#index'

  # Styleguide route
  match 'styleguide(/:action)' => 'adminsimple/styleguide#show', as: :styleguide

  # Devise routing
  devise_for Adminsimple.configuration.devise_model.to_s.pluralize.to_sym,
    path: '',
    skip: [:registrations, :confirmations],
    skip_helpers: true,
    module: :devise,
    controllers: {
      sessions: 'adminsimple/devise/sessions',
      passwords: 'adminsimple/devise/passwords',
      #registrations: 'adminsimple/devise/registrations',
    }
  devise_scope Adminsimple.configuration.devise_model do
    resource :registration,
      only: [:edit, :update],
      path: 'profile',
      controller: 'adminsimple/devise/registrations',
      as: :registration
  end

end
