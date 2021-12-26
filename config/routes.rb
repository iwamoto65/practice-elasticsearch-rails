Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'homes#index', as: 'home'
  resources 'articles'
  resources 'article_drafts' do
    post 'apploval', on: :member
  end
end
