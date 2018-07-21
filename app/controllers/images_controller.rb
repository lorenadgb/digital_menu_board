class ImagesController < ApplicationController
  before_action :set_screen

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @screen.save
    redirect_to @screen
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @screen.save
    redirect_to @screen
  end

  private

  def set_screen
    @screen = Screen.find(params[:screen_id])
  end

  def add_more_images(new_images)
    images = @screen.images
    images += new_images
    @screen.images = images
  end

  def remove_image_at_index(index)
    remain_images = @screen.images
    deleted_image = remain_images.delete_at(index)
    deleted_image.remove!
    @screen.images = remain_images
    @screen.save
  end

  def images_params
    params.require(:screen).permit({images: []})
  end
end
