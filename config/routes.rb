class Constraint
  def matches?(request)
    path = request.original_fullpath.clone
    path[0] = ''
    @page = Ckpages::Page.where(:path => CGI::unescape(path))
    @page.present?
  end
end

Rails.application.routes.draw do
  resources :uploads
  get "*path", controller: 'ckpages/public', action: :show, :constraints => Constraint.new, format: false

  ## TODO Доработать.
  #if Rails.application.config_for('application/common')['suppress_exceptions']
  #  get "*error", :to => "application#render_404", format: false
  #end

end

Ckpages::Engine.routes.draw do
  resources :uploads
  resources :pages
end
