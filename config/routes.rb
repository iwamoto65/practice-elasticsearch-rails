Rails.application.routes.draw do
  get '/', to: 'homes#index', as: 'home'

  get 'articles', to: 'articles#index'

  resources 'article_drafts', except: %i[show] do
    post 'apploval', on: :member
  end
end
