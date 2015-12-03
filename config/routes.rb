Rails.application.routes.draw do
  LOCALES = /en|pt\-BR/
  scope ":locale", :locale => LOCALES, :defaults => {:locale=> 'pt-BR'} do

    resources :rooms do
      resources :reviews, :only =>[:create, :update], :module => :rooms
    end
    resources :users

    resource :confirmation, :only => [:show]

    resource :user_sessions, :only => [:create, :new, :destroy]

    get 'users/:id/rooms' =>  'users#rooms', as: :user_rooms

  end

  get '/:locale' => 'home#index', :locale => LOCALES
  root 'home#index'

end
