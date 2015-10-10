Rails.application.routes.draw do

  root 'welcome#index'


  post '/errors', to: 'errors#create'

end
