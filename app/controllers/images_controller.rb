class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def index
    @tags = ActsAsTaggableOn::Tag.all
    # @tag = @tags[0]
    @images = Image.order(created_at: :desc)
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
end
