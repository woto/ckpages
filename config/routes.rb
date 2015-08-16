Rails.application.routes.draw do

  class Constraint
    def matches?(request)
      path = request.original_fullpath.clone
      @page = Ckpages::Page.where(:path => CGI::unescape(path))
      @page.present?
    end
  end

  if Ckpages.enabled
    get "*path" => 'ckpages/public#show', constraints: Constraint.new, format: false
    get "*path" => "ckpages/public404#show", format: false
    if Ckpages.root
      root 'ckpages/public#show', constraints: Constraint.new, format: false
      root 'ckpages/public404#show', as: 'root404', format: false
    end
  end

end

Ckpages::Engine.routes.draw do
  resources :uploads
  resources :plugin_uploads
  resources :pages
  resources :parts
end
