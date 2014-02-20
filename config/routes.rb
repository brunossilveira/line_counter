# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

# Line Counter Routes
#get 'counter_repositories', :to => 'counter_repositories#index'
#get 'counter_repositories/new/:project_id', :to => 'counter_repositories#new', :as => 'new_line_counter_repository'
#post 'counter_repositories/new/:project_id', :to => 'counter_repositories#create', :as => 'create_line_counter_repository'
#get 'counter_repositories/:repository_id/edit', :to => 'counter_repositories#edit', :as => 'edit_line_counter_repository'
#delete 'counter_repositories/:repository_id', :to => 'counter_repositories#destroy'
#put 'counter_repositories', :to => 'counter_repositories#update'

resources :counter_repositories

# Branches Routes
get 'branches/new', :to => 'branches#new'
post 'branches/append', :to => 'branches#append'
post 'branches', :to => 'branches#create'
delete 'branches/:issue_id', :to => 'branches#destroy'

