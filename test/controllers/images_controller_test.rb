require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_assigns_image_in_new
    image = Image.new
    get new_image_path
    assert_nil assigns(:image).url
    assert_nil image.url
    image.destroy!
  end

  def test_assigns_image_in_create
    image = Image.new(url: 'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg')
    post images_path, params: { image: { url: 'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg' } }
    assert_equal assigns(:image).url, image.url
    image.destroy!
  end

  def test_assigns_image_in_show
    image = Image.create(url: 'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg')
    get image_path(image.id)
    assert_equal assigns(:image).id, image.id
    image.destroy!
  end
end
