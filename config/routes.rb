Rails.application.routes.draw do

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout

  get '/' => 'questions#index'

  get '/questions' => 'questions#index', as: 'questions'
  get '/questions/new' => 'questions#new', as: 'new_question'
  get '/questions/:id' => 'questions#show', as: 'question'
  get '/questions/:id/edit' => 'questions#edit', as: 'edit_question'
  post '/questions' => 'questions#create'
  patch '/questions/:id' => 'questions#update'
  delete '/questions/:id' => 'questions#destroy', as: 'destroy_question'


  get '/questions/:id/answers/new' => 'answers#new'
  get '/answers/:id/edit' => 'answers#edit'
  post '/answers' => 'answers#create'
  patch '/answers/:id' => 'answers#update'
  delete '/answers/:id' => 'answers#destroy'


  get '/users/new' => 'users#new', as: 'new_user'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  get '/users/:id' => 'users#show', as: 'user'
  post '/users' => 'users#create'
  patch '/users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy', as: 'destroy_user'








  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# I need to create the routes for comments
