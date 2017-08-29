class PagesController < ApplicationController
  # エラーメッセージを格納するグローバル変数
  $errors = []

  def index
    @pages = Page.all.sort.reverse
    @page = Page.new
  end

  def create
    @page = Page.new(pages_params)
    if @page.save
      flash[:success] = "ページを登録しました！"
    else
      flash[:danger] = "ページを登録できませんでした。"
      $errors = @page.errors.full_messages
      set_errors
    end
    redirect_to root_path
  end

  def destroy
    @page = Page.find_by(id: params[:id])
    if @page.destroy
      flash[:success] = "ページを削除しました！"
    else
      flash[:danger] = "Picture の削除に失敗しました"
      $errors = @page.errors.full_messages
      set_errors
    end
    redirect_to root_path
  end


  private

  def pages_params
    params.require(:page).permit(:url)
  end

  # エラーメッセージがあれば格納する
  def set_errors
    unless $errors.empty?
      @errors = $errors
      $errors = []
    end
  end

end
