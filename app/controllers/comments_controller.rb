#coding:utf-8
class CommentsController < ApplicationController

  before_filter :find_commentable

  def create
    Comment.transaction do
      @commentable = find_commentable
      params[:comment][:ip] = request.remote_ip
      @comment = @commentable.comments.build(params[:comment])
      if @comment.save
        flash[:notice] = 'Комментарий успешно добавлен'
      else
        flash[:error] = @comment.errors.full_messages.collect{|label, error| "#{label} #{error}"}
      end
      redirect_to @commentable, anchor: "comment-#{@comment.id}"
    end
  end

  private

    def find_commentable
      params.each{ |name, value| return $1.classify.constantize.find(value) if name =~ /(.+)_id$/ }
      nil
    end

end
