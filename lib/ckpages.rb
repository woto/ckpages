require "ckpages/engine"
require "jquery-rails"
require "turbolinks"
require "bootstrap-sass"
require "simple_form"

module Ckpages
  mattr_accessor :suppress_exceptions
  mattr_accessor :name
  mattr_accessor :password
end
