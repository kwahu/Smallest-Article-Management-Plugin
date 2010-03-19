class ArticleImageCategory < ActiveRecord::Base
  
  acts_as_tree :order => :name
  
  has_many :images, :class_name => 'ArticleImage', :dependent => :destroy

  def self.root
    ArticleImageCategory.find(:all, :conditions => ["parent_id = 0"])
  end
  
  def safe_destroy
    if self.children.size == 0 and self.images.size == 0
      self.destroy 
      true
    else
      false
    end
  end
  
end
