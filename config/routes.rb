Rails.application.routes.draw do

  root "homes#top"
  get 'help' => "homes#help"
  
  get 'quest_tasks/:id/complete' => "quest_tasks#complete", as:"complete_task"
  resources :quest_tasks, only:[:show, :update]

  resource :users, only:[:show, :edit, :update, :destroy]
  get "my_page" => "users#mypage"

  get 'quests/clear' => "quests#clear", as:"clear"
  get 'quests/:id/complete' => "quests#complete", as:"complete_quest"
  resources :quests, only:[:new, :create, :show, :update, :destroy]

  resources :boards, only:[:index, :create, :show]

  resources :comments, only:[:create]
  
  resources :notifications, only:[:index]

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
