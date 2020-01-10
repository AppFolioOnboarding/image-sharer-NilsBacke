# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rubocop:disable LineLength
URLS = [
  { url: 'https://www.medicalnewstoday.com/content/images/articles/322/322868/golden-retriever-puppy.jpg' },
  { url: 'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg' },
  { url: 'https://vetstreet.brightspotcdn.com/dims4/default/54186d0/2147483647/thumbnail/590x420/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F40%2F58%2F3bc5c01c4cdb8a0581681831faa9%2Fgreat-dane-shaking-paw-thinkstockphotos-522650067-590.jpg' },
  { url: 'https://images2.minutemediacdn.com/image/upload/c_crop,h_1192,w_2122,x_0,y_74/f_auto,q_auto,w_1100/v1575329078/shape/mentalfloss/609640-gettyimages-802480150.jpg' },
  { url: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/golden-retriever-dog-royalty-free-image-505534037-1565105327.jpg' },
  { url: 'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/slideshows/surprises_about_dogs_and_cats_slideshow/1800x1200_surprises_about_dogs_and_cats_slideshow.jpg' },
  { url: 'https://www.guidedogs.org/wp-content/uploads/2019/11/website-donate-mobile.jpg' },
  { url: 'https://static.scientificamerican.com/blogs/cache/file/BB6F1FE0-4FDE-4E6E-A986664CE30602E4_source.jpg' },
  { url: 'https://www.nationalgeographic.com/content/dam/animals/thumbs/rights-exempt/mammals/d/domestic-dog_thumb.jpg' },
  { url: 'https://www.medicalnewstoday.com/content/images/articles/326/326253/corgi-and-terrier-running.jpg' },
  { url: 'https://nevadahumanesociety.org/wp-content/uploads/2018/08/NHS-Slider-03-1024x731.jpg' },
  { url: 'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half/public/field_blog_entry_images/2018-02/vicious_dog_0.png' },
  { url: 'https://a57.foxnews.com/static.foxnews.com/foxnews.com/content/uploads/2019/12/931/524/malnourished-dog-1-AP.jpg' },
  { url: 'https://peopledotcom.files.wordpress.com/2019/12/fuller-house-dog-1.jpg' },
  { url: 'https://i.ytimg.com/vi/7NYaGOyJiCY/maxresdefault.jpg' },
  { url: 'https://www.incimages.com/uploaded_files/image/970x450/getty_824538424_404148.jpg' },
  { url: 'https://imgix.bustle.com/uploads/shutterstock/2019/7/19/64344225-0e9f-4264-97c5-853887fe60b4-shutterstock-1142800043.jpg' },
  { url: 'https://api.time.com/wp-content/uploads/2019/11/narwhal-dog-tail-2.jpg' },
  { url: 'https://static01.nyt.com/images/2019/12/17/multimedia/17OBS-frozenpuppy2/17OBS-frozenpuppy2-articleLarge-v2.jpg' },
  { url: 'https://content.fortune.com/wp-content/uploads/2019/01/boo.jpg' }
].freeze
# rubocop:enable LineLength

Image.create(URLS)
