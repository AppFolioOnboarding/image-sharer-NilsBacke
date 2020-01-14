class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def index
    @tags = ActsAsTaggableOn::Tag.all
    @tag = selected_tag_params || 'None'

    @images = Image.order(created_at: :desc)
    @images = @images.tagged_with(@tag) unless @tag == 'None'
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end

  def selected_tag_params
    params.require(:selected_tag).require(:tag_name)
  rescue ActionController::ParameterMissing
    nil
  end
end
