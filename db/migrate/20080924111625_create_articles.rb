class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.integer :user_id
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :language_id
      t.string :path_name
      t.string :menu_name
      t.string :header_name
      t.string :titlebar_name
      t.string :description
      t.string :keywords
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
