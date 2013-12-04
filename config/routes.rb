Sweetmix::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # TODO : remove next two lines after update to activeadmin 0.6.1
  # This is fix of ActiveAdmin routes bug when AA rewrite root
  root :to => 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  # -------------

  get 'sweets/shop' => 'staticuses#basis'                     # basis.html
  get 'sweets/constructor/next' => 'staticuses#create_edited' # create_edited.html
  get 'sweets/constructor' => 'staticuses#create_edited_pack' # create_edited_pack.html

  # get 'support/questions' => 'staticuses#questions' # questions.html

  # get 'about/comments' => 'staticuses#comments'       # comments.html
  # get 'about/partners' => 'staticuses#partners'       # partners.html
  # get 'about/vacancy' => 'staticuses#vacancy'         # vacancy.html
  # get 'about/certificate' => 'staticuses#certificate' # certificate.html
  # get 'about/contacts' => 'staticuses#contacts'       # contacts.html

  # get 'info/delivery' => 'staticuses#delivery' # delivery.html

  get 'checkout' => 'staticuses#checkout' # checkout.html
  get 'basket' => 'staticuses#basket'     # basket.html

  # -------------

  post 'feedbacks/call-me' => 'feedbacks#call_me', as: "call_me_feedback"

  # content pages
  match '*page_path' => 'content_pages#show'

  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
