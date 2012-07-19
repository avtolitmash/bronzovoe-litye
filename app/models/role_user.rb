class RoleUser < ActiveRecord::Base
  attr_accessible :role_id, :user_id
  belongs_to :user
  belongs_to :role
  validates_presence_of :user, :role
end
