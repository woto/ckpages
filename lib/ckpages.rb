require "ckpages/engine"
require "jquery-rails"
require "turbolinks"
require "bootstrap-sass"
require "simple_form"
require "kaminari"

module Ckpages
  mattr_accessor :suppress_exceptions
  mattr_accessor :login
  mattr_accessor :password
end
