module Ckpages
  class Engine < ::Rails::Engine
    isolate_namespace Ckpages
    initializer "static assets" do |app|
      app.middleware.insert_before(::Rack::Sendfile, ::ActionDispatch::Static, "#{root}/public")
    end
    initializer 'suppress_exceptions' do |app|
      if Ckpages.suppress_exceptions
        Rails.application.config.exceptions_app = lambda do |env|
          path = env['ORIGINAL_FULLPATH']
          @page = Ckpages::Page.where(:path => CGI::unescape(path))
          if @page.present?
            Ckpages::PublicController.action(:show).call(env)
          else
            Ckpages::Public404Controller.action(:show).call(env)
          end
        end
      end
    end
  end
end
