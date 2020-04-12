Rails.application.routes.draw do

  scope :api do
    resources :goals do
      resources :objectives
    end
  end

  get '/api/goals/:id/toggle', to: 'goals#toggle'
  resources :objectives, only: [:destroy]

  patch '/api/objectives/:id', to: 'objectives#toggle'

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end

end

# original routes and here below
# resources :objectives
# resources :goals

# let's talk scope
# when using scope without any options and only a scope name, it will just change the resources path.
# my routes are now scoped (api) and nested (objectives within goals): 
# /api/goals/:goal_id/objectives(.:format) -- goal_objectives_path 

# to see all routes: http://localhost:3000/rails/info/routes (so my brain can stop trying to remember)