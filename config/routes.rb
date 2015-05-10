Rails.application.routes.draw do

  class Constraint
    def matches?(request)
      path = request.original_fullpath.clone
      @page = Ckpages::Page.where(:path => CGI::unescape(path))
      @page.present?
    end
  end

  get "*path", controller: 'ckpages/public', action: :show, constraints: Constraint.new, format: false

  if Ckpages.suppress_exceptions
    get "*path", controller: "ckpages/public404", action: :show, format: false
  end

end

Ckpages::Engine.routes.draw do
  resources :uploads
  resources :pages
end
