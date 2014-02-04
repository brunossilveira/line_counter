# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

# Branches Routes
get 'branches/new', :to => 'branches#new'
post 'branches/append', :to => 'branches#append'
post 'branches', :to => 'branches#create'