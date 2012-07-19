class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :parent_articles

  private

    def parent_articles
      @parent_articles = Article.where(depth: 0)
    end

end
