class Admin::PhotosController < ApplicationController
  def destroy
    Photo.find(params[:id]).destroy
  end
end
