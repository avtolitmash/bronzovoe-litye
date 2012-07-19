class Comment < ActiveRecord::Base

  @ip_regex = /^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/

  attr_accessible :body, :ip, :commentable
  validates_presence_of :body, :commentable_id, :commentable_type
  validates :ip, presence: true, format: { with: @ip_regex } 
  belongs_to :commentable, polymorphic: true

end
