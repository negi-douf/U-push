class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pages = Page.all.sort.reverse
    @page = Page.new
  end

  def create
    @page = Page.new(pages_params)
    @page.user_id = current_user.id
    if @page.save
      flash[:success] = "ページを登録しました！"
    else
      flash[:danger] = "ページを登録できませんでした。"
    end
    redirect_to root_path
  end

  def destroy
    @page = Page.find_by(id: params[:id])
    if @page.destroy
      flash[:success] = "ページを削除しました！"
    else
      flash[:danger] = "Picture の削除に失敗しました"
    end
    redirect_to root_path
  end

  private

    def pages_params
      params.require(:page).permit(:url)
    end
end
