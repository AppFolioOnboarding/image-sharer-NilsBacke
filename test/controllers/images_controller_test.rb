require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_assigns_image_in_new
    image = Image.new
    get new_image_path
    assert_response :ok
    assert_nil assigns(:image).url
    assert_nil image.url
  end

  def test_assigns_image_in_create
    image = Image.new(url: 'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg')
    post images_path, params: { image: { url: 'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg' } }
    assert_equal assigns(:image).url, image.url
  end

  def test_assigns_image_in_show
    image = Image.create(url: 'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg')
    get image_path(image.id)
    assert_response :ok
    assert_equal assigns(:image).id, image.id
    image.destroy!
  end

  def test_assigns_images_in_index
    get :image_path
    assert_not_nil assigns(:images)
    assert_empty assigns(:images)
  end
end
