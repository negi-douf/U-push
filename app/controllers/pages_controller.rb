class PagesController < ApplicationController
  before_action :authenticate_user!

  require "open-uri"
  require "digest/sha1"

  def index
    @pages = Page.all.sort.reverse
    @page = Page.new
  end
  
  def create
    @page = Page.new(pages_params)
    @page.user_id = current_user.id
    begin
      @page.last_hash = Digest::SHA1::hexdigest open(@page.url).read
      if @page.save
        flash[:success] = "ページを登録しました！"
      else
        flash[:danger] = "ページを登録できませんでした。"
      end
    rescue => e
      puts("#{e}: #{@page.url}")
      flash[:danger] = "ページにアクセスできませんでした。"
    end
    # もう一度処理をおこなう必要があるため redirect_to
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

  # 更新をチェックする
  # 1日1度呼ばれる
  def self.check
    Page.all.each do |page|
      begin
        now_hash = Digest::SHA1::hexdigest open(page.url).read
        if now_hash != page.last_hash
          puts "The page has updated.: #{page.url}"
          page.last_hash = now_hash
          page.save
          @line_client ||= LineClient.new
          @line_client.push(page)
        else
          puts "The page has not updated.: #{page.url}"
        end
      rescue => e
        puts("#{e}: #{page.url}")
      end
    end
  end

  private

    def pages_params
      params.require(:page).permit(:url)
    end
end
