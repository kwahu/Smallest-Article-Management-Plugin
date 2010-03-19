class Admin::ArticleImagesController < Admin::AdminController
 
  def create
    @article_image = ArticleImage.create(params[:article_image])

    index( @article_image.article_image_category_id )
    render :action=>'index'
  end
  
  def destroy
    img = ArticleImage.find(params[:id]).destroy
    
    render :update do |page|
      page.remove "thumb_#{img.id}"
    end
  end
  
  def index(scid = params[:scid])
    @image_categories = ArticleImageCategory.root
    @selected_category =  ArticleImageCategory.find( scid || params[:selected_category_id] || ArticleImageCategory.root.first.id )
    @category = ArticleImageCategory.new
    @images = @selected_category.images
    @image = ArticleImage.new
  end
  
end