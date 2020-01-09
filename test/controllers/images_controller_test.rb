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
    Image.destroy_all
    get images_path
    assert_response :ok
    assert_not_nil assigns(:images)
    assert_empty assigns(:images)
  end

  def test_assigns_nonempty_images_in_index
    Image.destroy_all
    create_images
    get images_path
    assert_response :ok
    assert_not_nil assigns(:images)
    assert_not_empty assigns(:images)

    assert_equal Image.all.length, assigns(:images).length
  end

  def test_images_are_sorted
    Image.destroy_all
    create_images
    get images_path
    assert_response :ok

    assigns(:images).each_cons(2) do |imgpair|
      assert imgpair[0].created_at >= imgpair[1].created_at
    end
  end

  private

  def create_images
    urls = ['https://www.medicalnewstoday.com/content/images/articles/322/322868/golden-retriever-puppy.jpg',
            'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg',
            'https://vetstreet.brightspotcdn.com/dims4/default/54186d0/2147483647/thumbnail/590x420/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F40%2F58%2F3bc5c01c4cdb8a0581681831faa9%2Fgreat-dane-shaking-paw-thinkstockphotos-522650067-590.jpg',
            'https://images2.minutemediacdn.com/image/upload/c_crop,h_1192,w_2122,x_0,y_74/f_auto,q_auto,w_1100/v1575329078/shape/mentalfloss/609640-gettyimages-802480150.jpg']
    urls.each do |url|
      Image.create(url: url)
    end
  end
end
