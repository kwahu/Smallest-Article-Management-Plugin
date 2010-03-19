class Admin::ArticleImageCategoriesController < Admin::AdminController
 
  def create
    category = ArticleImageCategory.create(params[:article_image_category])

    redirect_to admin_article_images_url( :scid => category.id )
  end 
  
  def destroy
    category = ArticleImageCategory.find(params[:id])
    
    redirect_to admin_article_images_url(:scid => category.safe_destroy ? category.parent_id : category.id )
  end
  
  def index
    @images = ArticleImageCategory.find(params[:scid]).images
  end

end
