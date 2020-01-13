class Image < ApplicationRecord
  acts_as_taggable
  validate :url_valid
  validates :url, presence: true

  private

  def url_valid
    return if url_valid_uri && url_valid_extension

    errors.add(:url, 'is not a valid image url')
  end

  def url_valid_uri
    url =~ URI::DEFAULT_PARSER.make_regexp
  end

  def url_valid_extension
    url.end_with?('jpg', 'jpeg', 'png')
  end
end
