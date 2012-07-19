class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.includes(:comments).find(params[:id])
  end

end
