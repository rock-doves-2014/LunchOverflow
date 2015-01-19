Rails.application.routes.draw do
  root 'posts#index'
  resources :users

  # there is a concept of a singular resource
  # which might make sense here.
  resources :sessions, :only => [:create, :new, :destroy]

  # Ehm...this is kinda confusing to me.  That `only` up above implies to me
  # that there's only one action, create, but here you are telling me that
  # there are acutally two more....is this an error or....which..huh?
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'

  resources :posts do
    resources :comments
    # Something fishy about this......but we'll see more once we look at the
    # models.
    get '/comments/new(/:parent_id)', to: 'comments#new', as: :new_comment
    member do
      put 'upvote', to: 'posts#upvote'
      put 'downvote', to: 'posts#downvote'
    end
  end

  resources :comments do
    member do
      # Only put...hm....seems like you are creating a new one of these....it
      # would seem to me that the right verb is POST?
      put 'upvote', to: 'comments#upvote'
      put 'downvote', to: 'comments#downvote'
    end
  end

  # Why isn't this in with the posts resources?
  get 'tagged', to: 'posts#tagged'
end
