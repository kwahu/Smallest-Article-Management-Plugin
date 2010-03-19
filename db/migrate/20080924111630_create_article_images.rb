class CreateArticleImages < ActiveRecord::Migration
  
  def self.up
    create_table :article_images do |t|
      t.integer :parent_id
      t.string :name
      t.belongs_to :article_image_category
      t.string :content_type
      t.string :filename     
      t.integer :size
      t.string :thumbnail
      t.integer :width  
      t.integer :height
    end
    
    create_table :article_image_categories do |t|
      t.integer :parent_id, :default => 0
      t.string :name
    end

    root   = ArticleImageCategory.create!("name" => "images")
    child1 = root.children.create!("name" => "homepage")
    child2 = root.children.create!("name" => "other")
    
  end

  def self.down
    drop_table :article_images
    drop_table :article_image_categories
  end
end
