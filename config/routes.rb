Rails.application.routes.draw do
  root 'travelers#index'

  devise_for :travelers

  resources :travelers do
    resources :destinations do
      resources :checklists
    end
  end

  get '/:checklist_id/items/:item_id', to: 'items#edit', as: 'edit_item'

  post '/:checklist_id/item', to: 'items#create', as: 'new_item'
  post '/:item_id/complete', to: 'items#complete', as: 'complete_item'

  patch '/items/:item_id', to: 'items#update', as: 'item'

  delete '/:item_id', to: 'items#destroy', as: 'delete_item'


end
