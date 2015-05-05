module Ckpages
  class Engine < ::Rails::Engine
    isolate_namespace Ckpages
    initializer "static assets" do |app|
        app.middleware.insert_before(::Rack::Sendfile, ::ActionDispatch::Static, "#{root}/public")
    end
  end
end
