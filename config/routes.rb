resources :articles,:as => 'article'



namespace :admin do |admin|
  admin.resources :articles   
  admin.resources :article_images
  admin.resources :article_image_categories
end