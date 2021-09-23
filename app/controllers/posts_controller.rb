class PostsController < ApplicationController
    def index
        @posts = Post.all
        @date = Date.current.strftime('%Y年%m月%d日')
        @count = Post.count
    end
    
    def new
        @post = Post.new
        @date = Date.current.strftime('%Y年%m月%d日')
    end
    
    def create
        @post = Post.new(params.require(:post).permit(:title,:start_day,:end_day,:all_day,:post_memo))
        @date = Date.current.strftime('%Y年%m月%d日')
        if@post.save
            flash[:success] = "スケジュールを登録しました"
            redirect_to :posts
        else
            flash[:failure] = "スケジュールを登録できませんでした"
            render"new"
        end
    end
    
    def show
        @post = Post.find(params[:id])
        @date = Date.current.strftime('%Y年%m月%d日')
    end
    
    def edit
        @post = Post.find(params[:id])
        @date = Date.current.strftime('%Y年%m月%d日')
    end
    
    def update
        @post = Post.find(params[:id])
        @date = Date.current.strftime('%Y年%m月%d日')
        if@post.update(params.require(:post).permit(:title,:start_day,:end_day,:all_day,:post_memo))
            flash[:success] = "スケジュールを更新しました"
            redirect_to :posts
        else
            flash[:failure] = "スケジュールを更新できませんでした"
            render"edit"
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:delete] = "スケジュールを削除しました"
        redirect_to :posts
    end
    
  end
