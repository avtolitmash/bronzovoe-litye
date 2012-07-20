class ArticlesController < ApplicationController
  
  def index
    redirect_to Article.includes(:comments).where(parent_id: nil).first
  end

  def show
    @article = Article.includes(:comments).find(params[:id])
  end

end
