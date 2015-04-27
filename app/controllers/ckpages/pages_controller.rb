require_dependency "ckpages/application_controller"

module Ckpages
  class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    # GET /pages
    def index
      @pages = Page.order(id: :desc).page(params[:page])
    end

    # GET /pages/1
    def show
    end

    # GET /pages/new
    def new
      @page = Page.new

      if params[:path].present?
        @page.path = CGI::unescape(params[:path])
      end
    end

    # GET /pages/1/edit
    def edit
    end

    # POST /pages
    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to @page, notice: 'Page was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        redirect_to @page, notice: 'Page was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /pages/1
    def destroy
      @page.destroy
      redirect_to pages_url, notice: 'Page was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def page_params
        params.require(:page).permit(:path, :content, :keywords, :description, :title, :robots, :redirect_url, :title1, :url1, :title2, :url2, :title3, :url3, :title4, :url4, :title5, :url5)
      end
  end
end
