Rails.application.routes.draw do

  get 'pages/home'

  root "pages#home"  # This will point to PagesController's home action

  get 'seasons/index'

  get 'seasons/show'

  get 'seasons/create'

  get 'seasons/update'

  get 'seasons/destroy'

  get 'contents/index'

  get 'contents/show'

  get 'contents/create'

  get 'contents/update'

  get 'contents/destroy'

  get 'chapters/index'

  get 'chapters/show'

  get 'chapters/create'

  get 'chapters/update'

  get 'chapters/destroy'

  get 'channels/index'

  get 'channels/show'

  get 'channels/create'

  get 'channels/update'

  get 'channels/destroy'

  get 'channel_programs/index'

  get 'channel_programs/show'

  get 'channel_programs/create'

  get 'channel_programs/update'

  get 'channel_programs/destroy'

  get 'apps/:content_name', to: 'apps#index', as: :apps
  get 'apps_show/:app_id', to: 'apps#show', as: :app_show
  get 'apps_update/:app_id', to: 'apps#update', as: :app_update

  get 'apps/show'

  get 'apps/create'

  get 'apps/update'

  get 'apps/destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
