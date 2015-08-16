require_dependency "ckpages/application_controller"

module Ckpages
  class PluginUploadsController < ApplicationController
    def index
      @plugin_upload = Upload.new
    end

    def create
      @plugin_upload = Upload.new(plugin_upload_params)
      @plugin_upload.save!
      render action: :index
    end

    private

    def plugin_upload_params
      params.require(:upload).permit!
    end

  end
end
