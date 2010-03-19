class ArticlesController < ApplicationController
 
  def show
    @article = Article.find_by_path_name(params[:id])
    
    if @article.nil?
      redirect_to(root_url)
    end
  end

end