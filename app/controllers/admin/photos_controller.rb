class Admin::PhotosController < ApplicationController
  def destroy
    photo = Photo.find(params[:id])
    page = photo.page
    photo.destroy
    redirect_to admin_page_path(page)
  end
end
