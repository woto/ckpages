module Ckpages
  class ApplicationController < ActionController::Base
    http_basic_authenticate_with name: Ckpages.login, password: Ckpages.password
  end
end
