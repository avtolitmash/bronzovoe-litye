#coding:utf-8
class Article < ActiveRecord::Base
  
  attr_accessible :body, :slug, :title, :parent_id, :lft, :rgt, :depth
  before_save :set_slug
  validates :title, presence: true
  extend FriendlyId
  friendly_id :slug, use: :history
  has_many :comments, as: :commentable
  acts_as_nested_set
  accepts_nested_attributes_for :comments

  private
    
    def set_slug
      self.slug = Russian.translit(self.title).mb_chars.downcase.gsub(/[^0-9а-яa-z]+/, ' ').strip.gsub(' ', '-').to_s
    end

end
