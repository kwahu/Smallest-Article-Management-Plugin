class Article < ActiveRecord::Base
  
  validates_presence_of :path_name, :content, :menu_name
  validates_size_of :description, :maximum => 255
  validates_size_of :keywords, :maximum => 255
  validates_uniqueness_of :path_name
  
  acts_as_nested_set
  
  def before_save
    if self.header_name.empty?
      self.header_name = self.menu_name
    end
    
    if self.titlebar_name.empty?
      self.titlebar_name = self.menu_name
    end
  end
  
  def to_param
    path_name
  end 
  
  def short_content(size = 80)
    text = content.split(' ')[0..size].join(' ')
    text = text + "..." unless content.size < 800
    text
  end  
  
  def short_content_without_html
    short_content.gsub(/<\/?[^>]*>/, "") rescue "Brak opisu"
  end
  
  protected
  
  def validate
    errors.add(:path_name, " should not contain any spaces") if path_name.include? " "
    errors.add(:path_name, " should not contain any slashes") if path_name.include? "\\"
  end

  
end
