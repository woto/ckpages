module Ckpages
  class ApplicationController < ActionController::Base
    http_basic_authenticate_with name: Ckpages.name, password: Ckpages.password
  end
end
