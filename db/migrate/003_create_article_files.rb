class CreateArticleFiles < ActiveRecord::Migration

  def self.up
    create_table :article_file_categories do |t|
      t.integer :parent_id, :default => 0
      t.string :name
    end
    
    create_table :article_files do |t|
      t.integer :common_file_category_id
      t.string :content_type
      t.string :filename     
      t.integer :size
      t.integer :parent_id 
      t.string :thumbnail
      t.integer :width  
      t.integer :height
    end
  end

  def self.down
    drop_table :article_file_categories
    drop_table :article_files
  end
end
