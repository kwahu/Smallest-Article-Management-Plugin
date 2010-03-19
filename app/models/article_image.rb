class ArticleImage < ActiveRecord::Base
  
  belongs_to :category, :class_name => 'ArticleImageCategory'
  
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 500.kilobytes,
                 :resize_to => '320x200>',
                 :thumbnails => { :thumb => '64x64>' }

  validates_as_attachment

end