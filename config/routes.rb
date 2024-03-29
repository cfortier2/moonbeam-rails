Rails.application.routes.draw do
  root "dashboard#index"

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  get "/auth/github/callback", to: "sessions#create"

  get "/queue/join", to: "build_queue#join", as: "join_queue"
  get "/queue/jump", to: "build_queue#jump", as: "jump_queue"

  get "/pulls", to: "pulls#index"
  post "/pulls/merge", to: "pulls#merge", as: "merge_pull_request"

  get "/deploy", to: "deploys#new"

  # Catch-all redirect
  get "*path", to: "dashboard#index"
end
