Sweetmix::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # TODO : remove next two lines after update to activeadmin 0.6.1
  # This is fix of ActiveAdmin routes bug when AA rewrite root
  root :to => 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  # content pages
  get '*page_path' => 'content_pages#show'

  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
