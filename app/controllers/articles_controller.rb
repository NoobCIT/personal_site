class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :create, :destroy, :update]

  def index
    @articles = Article.order('created_at DESC').page(params[:page]).per_page(5)
    @user = current_user
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "You successfully created the article!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "Your article was successfully deleted!"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash[:success] = "Your article was successfully updated!"
    redirect_to article_path(@article)
  end
end
