require_dependency "ckpages/application_controller"

module Ckpages
  class UploadsController < ApplicationController

    def index
      @uploads = Upload.page(params[:page])
    end

    def show
      @upload = Upload.find(params[:id])
    end

    # POST /uploads
    def create
      @upload = Upload.new(upload_params)
      #{"fileName":"image(13).png","uploaded":1,"url":"\/ckfinder\/userfiles\/files\/image(13).png","error":{"number":201,"message":"A file with the same name is already available. The uploaded file was renamed to \"image(13).png\"."}}

      @upload.save

      respond_to do |format|
        format.json {
          render plain: {fileName: @upload.file.filename, uploaded: 1, url: @upload.file.url}.to_json
        } 
      end
    end

    private
      def upload_params
        hack_params
        params.require(:upload).permit(:file)
      end

      # hack parameter (maybe better to change ckeditor 
      # post params according Rails convention)
      def hack_params
        file = params[:upload].clone
        params[:upload] = {file: file}
      end
  end
end
