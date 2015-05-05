require_dependency "ckpages/application_controller"

module Ckpages
  class AscendantController < ::ApplicationController
    before_action :set_page, only: [:show]

    def show
      if @page.redirect_url?
        redirect_to @page.redirect_url, status: 301
      end
    end

    private
      def set_page
        path = request.original_fullpath
        path[0] = ''
        @page = Page.where(:path => CGI::unescape(path)).first
      end
  end
end
