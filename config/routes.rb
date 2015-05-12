Rails.application.routes.draw do

  class Constraint
    def matches?(request)
      path = request.original_fullpath.clone
      @page = Ckpages::Page.where(:path => CGI::unescape(path))
      @page.present?
    end
  end

  if Ckpages.enabled
    get "*path", controller: 'ckpages/public', action: :show, constraints: Constraint.new, format: false
    get "*path", controller: "ckpages/public404", action: :show, format: false
    root 'ckpages/public#show', constraints: Constraint.new, format: false
    root 'ckpages/public404#show', as: 'root404', format: false
  end

end

Ckpages::Engine.routes.draw do
  resources :uploads
  resources :pages
  resources :parts
end
