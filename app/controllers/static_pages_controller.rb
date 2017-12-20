class StaticPagesController < ApplicationController

  def index
    @static_pages = StaticPage.all
  end

  def new
    @static_page = StaticPage.new
  end

  def create
    @static_page = StaticPage.create(static_page_params)
    if @static_page
      redirect_to static_page_path(@static_page)
    end
  end

  def show
      @static_page = StaticPage.find_by!(permalink: params[:id])
  end

  def edit
    @static_page = StaticPage.find_by!(permalink: params[:id])
  end

  def update
    @static_page = StaticPage.find_by!(permalink: params[:id])
    @static_page.update(static_page_params)
    flash[:success] = "Your page was successfully updated!"
    redirect_to static_page_path(@static_page)
  end

  def destroy
    @static_page = StaticPage.find_by!(permalink: params[:id])
    @static_page.destroy
    flash[:success] = "Your page was successfully deleted!"
    redirect_to root_path
  end
end
