require "ckpages/engine"
require "jquery-rails"
require "turbolinks"
require "bootstrap-sass"
require "simple_form"
require "kaminari"
require "carrierwave"

module Ckpages
  mattr_accessor :enabled
  mattr_accessor :root
end
