class BlogsController < ApplicationController
before_action :set_blog, only: [:show, :edit, :update, :destroy]
before_action :current_notifications

  def index
    @blogs = Blog.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end

  def new
   @blog = Blog.new
  end

  def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
      NoticeMailer.sendmail_blog(@blog).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    binding.pry
    @blog.update(blogs_params)
    redirect_to blogs_path, notice: "ブログを更新しました！"
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end

  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end

    # idをキーとして値を取得するメソッド
    def set_blog
      @blog = Blog.find(params[:id])
    end

    before_action :current_notifications, if: :signed_in?
    def current_notifications
      @notifications_count = Notification.where(user_id: current_user.id).where(read: false).count
    end

end
