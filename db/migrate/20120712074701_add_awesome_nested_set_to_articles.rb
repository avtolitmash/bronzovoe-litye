class AddAwesomeNestedSetToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :parent_id, :integer
    add_column :articles, :lft, :integer
    add_column :articles, :rgt, :integer
    add_column :articles, :depth, :integer
  end
end
