require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_images
  end

  def test_new__nil_image
    image = Image.new
    get new_image_path
    assert_response :ok
    assert_nil assigns(:image).url
    assert_nil image.url
  end

  def test_create__valid_image
    image = Image.new(url: 'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg')
    post images_path, params: { image: { url: 'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg' } }
    assert_equal assigns(:image).url, image.url
  end

  def test_show__valid_image
    image = Image.create(url: 'https://i.ytimg.com/vi/MPV2METPeJU/maxresdefault.jpg')
    get image_path(image.id)
    assert_response :ok
    assert_equal assigns(:image).id, image.id
    image.destroy!
  end

  def test_index__empty
    Image.destroy_all
    get images_path
    assert_response :ok
    assert_not_nil assigns(:images)
    assert_empty assigns(:images)
  end

  def test_index__nonempty
    get images_path
    assert_response :ok
    assert_not_nil assigns(:images)
    assert_not_empty assigns(:images)

    assert_equal Image.all.length, assigns(:images).length
  end

  def test_index__sorted_eh
    get images_path
    assert_response :ok

    assigns(:images).each_cons(2) do |imgpair|
      assert imgpair[0].created_at >= imgpair[1].created_at
    end
  end

  def test_index__tag_empty
    ActsAsTaggableOn::Tag.destroy_all
    get images_path
    assert_response :ok
    assert_not_nil assigns(:tags)
    assert_empty assigns(:tags)
  end

  def test_index__tag_nonempty
    get images_path
    assert_response :ok
    assert_not_nil assigns(:tags)
    assert_not_empty assigns(:tags)
  end

  def test_index__filter_by_tag
    get images_path, params: { selected_tag: { tag_name: 'dog' } }
    assert_response :ok
    assert_equal assigns(:tag), 'dog'
    assert_equal assigns(:images).length, 3
    assigns(:images).each { |i| assert i.tag_list.include? 'dog' }

    get images_path, params: { selected_tag: { tag_name: 'mountains' } }
    assert_response :ok
    assert_equal assigns(:tag), 'mountains'
    assert_equal assigns(:images).length, 1
    assigns(:images).each { |i| assert i.tag_list.include? 'mountains' }
  end

  def test_index__filter_by_none
    Image.destroy_all
    create_images
    get images_path, params: { selected_tag: { tag_name: 'None' } }
    assert_response :ok
    assert_equal assigns(:tag), nil
    assert_equal assigns(:images).length, 4
  end

  private

  # rubocop:disable LineLength
  def create_images
    imgs = [
      { tag_list: 'dog, husky', url: 'https://www.medicalnewstoday.com/content/images/articles/322/322868/golden-retriever-puppy.jpg' },
      { tag_list: 'dog, purebread', url: 'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg' },
      { tag_list: 'dog, lab', url: 'https://vetstreet.brightspotcdn.com/dims4/default/54186d0/2147483647/thumbnail/590x420/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F40%2F58%2F3bc5c01c4cdb8a0581681831faa9%2Fgreat-dane-shaking-paw-thinkstockphotos-522650067-590.jpg' },
      { tag_list: 'landscape, mountains', url: 'https://images2.minutemediacdn.com/image/upload/c_crop,h_1192,w_2122,x_0,y_74/f_auto,q_auto,w_1100/v1575329078/shape/mentalfloss/609640-gettyimages-802480150.jpg' }
    ].freeze
    Image.create(imgs)
  end
  # rubocop:enable LineLength
end
