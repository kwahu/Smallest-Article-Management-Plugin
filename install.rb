require 'fileutils'
FileUtils.cp "#{File.dirname(__FILE__)}/db/migrate/001_create_articles.rb", "#{File.dirname(__FILE__)}/../../../db/migrate/001_create_articles.rb"
FileUtils.cp "#{File.dirname(__FILE__)}/db/migrate/002_create_article_images.rb", "#{File.dirname(__FILE__)}/../../../db/migrate/002_create_article_images.rb"
FileUtils.cp "#{File.dirname(__FILE__)}/config/articles_tinymce_config.js", "#{File.dirname(__FILE__)}/../../../public/javascripts/articles_tinymce_config.js"
FileUtils.cp_r "#{File.dirname(__FILE__)}/config/articles_tiny_mce", "#{File.dirname(__FILE__)}/../../../public/javascripts/articles_tiny_mce"

def gsub_file(relative_destination, regexp, *args, &block)
  path =  "#{File.dirname(__FILE__)}/../../../config/routes.rb"
  content = File.read(path).gsub(regexp, *args, &block)
  File.open(path, 'wb') { |file| file.write(content) }
end        

sentinel = 'ActionController::Routing::Routes.draw do |map|' 
gsub_file('config/routes.rb', /(#{Regexp.escape(sentinel)})/mi) do |match|
  "#{match}\n map.routes_from_plugin :articles_plugin \n"
end