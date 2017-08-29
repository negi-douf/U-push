class PagesController < ApplicationController

  def index
    @pages = Page.all.sort.reverse
    @page = Page.new
  end

  def create
    @page = Page.new(pages_params)
    @page.save
    redirect_to root_path
  end

  def destroy
    @page = Page.find_by(id: params[:id])
  end


  private

  def pages_params
    params.require(:page).permit(:url)
  end

end
