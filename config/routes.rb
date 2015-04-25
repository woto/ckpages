class Constraint
  def matches?(request)
    path = request.original_fullpath.clone
    path[0] = ''
    @page = Ckpages::Page.where(:path => CGI::unescape(path))
    @page.present?
  end
end

Rails.application.routes.draw do
  get "*path", controller: 'ckpages/public', action: :show, :constraints => Constraint.new, format: false
end

Ckpages::Engine.routes.draw do
  resources :pages
end
