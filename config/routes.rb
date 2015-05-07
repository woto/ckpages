Rails.application.routes.draw do
  #get "*path", controller: 'ckpages/public', action: :show

  #if Ckpages.suppress_exceptions
  #  get "*error", controller: "ckpages/public404", action: :show, format: false
  #end

end

Ckpages::Engine.routes.draw do
  resources :uploads
  resources :pages
end
