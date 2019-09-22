Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#We can still do things to the nested resources that we do to a non-nested resource,
#like limit them to only certain actions.
# In this case, we only want to nest :show and :index under :authors.
    resources :authors, only: [:show] do
      # nested resource for posts
      resources :posts, only: [:show, :index]
    end

 #we still have our regular resourced :posts routes because we still want to let people 
 #see all posts, create and edit posts, and so on outside of the context of an author.
    resources :posts, only: [:index, :show, :new, :create, :edit, :update]

    root 'posts#index'

end
