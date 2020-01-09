require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_cant_save_image_without_url
    image = Image.new
    refute image.valid?
    refute image.save
    image.destroy!
  end

  def test_cant_save_image_with_empty_url
    image = Image.new(url: '')
    refute image.valid?
    refute image.save
    assert_not_empty image.errors
    image.destroy!
  end

  def test_cant_save_image_with_malformed_url
    image = Image.new(url: 'dnausdniuasnd')
    refute image.valid?
    refute image.save
    assert_not_empty image.errors
    image.destroy!
  end

  def test_cant_save_image_with_malformed_url_ending_in_jpg
    image = Image.new(url: 'dnausdniuasnd.jpg')
    refute image.valid?
    refute image.save
    assert_not_empty image.errors
    image.destroy!
  end

  def test_can_save_image_with_url
    image = Image.new(url: 'https://www.medicalnewstoday.com/content/images/articles/322/322868/golden-retriever-puppy.jpg')
    assert image.valid?
    assert image.save
    image.destroy!
  end
end
