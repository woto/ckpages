module Ckpages
  class Engine < ::Rails::Engine
    isolate_namespace Ckpages
    initializer "static assets" do |app|
      app.middleware.insert_before(::Rack::Sendfile, ::ActionDispatch::Static, "#{root}/public")
    end

    #config.to_prepare do
    #  Rails.application.routes.draw do
    #    get "*error", controller: "ckpages/public404", action: :show, format: false
    #  end
    #end

    #initializer 'routes' do |app|
    #  Rails.application.routes.draw do
    #    get "*error", controller: "ckpages/public404", action: :show, format: false
    #  end
    #end

    #initializer "myinitializer", :after => "add_builtin_route" do |app|
    #  app.routes_reloader.paths.delete_if{ |path| path.include?("NAME_OF_GEM_GOES_HERE") }
    #end

    #initializer 'suppress_exceptions' do |app|
    #  if Ckpages.suppress_exceptions
    #    Rails.application.config.exceptions_app = lambda do |env|
    #      path = env['ORIGINAL_FULLPATH']
    #      @page = Ckpages::Page.where(:path => CGI::unescape(path))
    #      if @page.present?
    #        Ckpages::PublicController.action(:show).call(env)
    #      else
    #        Ckpages::Public404Controller.action(:show).call(env)
    #      end
    #    end
    #  end
    #end
  end
end
