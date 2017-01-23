require 'rtesseract'
require 'byebug'
require "awesome_print"
require 'openCV'
include OpenCV

RTesseract.configure do |config|
  config.processor = "mini_magick"
end

THRESHOLD = 1000

def variance_of_laplacian(image)
  variance = CvMat.load(image, CV_LOAD_IMAGE_GRAYSCALE).to_32f.laplace.avg_sdv[1][0] ** 2
  puts "#{image}: #{variance}"
  variance
end

def is_blurry(image, threshold = THRESHOLD)
  if variance_of_laplacian(image) > threshold
    false
  else
    true
  end
end

# dog images
puts "----------------------------------------------------------"
puts "Dog image sample results"
puts "----------------------------------------------------------"
puts "image_001 is blurry?: #{is_blurry("images/image_001.png")}"
puts "image_002 is blurry?: #{is_blurry("images/image_002.png")}"
puts "image_003 is blurry?: #{is_blurry("images/image_003.png")}"
puts "image_004 is blurry?: #{is_blurry("images/image_004.png")}"
puts "image_005 is blurry?: #{is_blurry("images/image_005.png")}"
puts "image_006 is blurry?: #{is_blurry("images/image_006.png")}"
puts "image_007 is blurry?: #{is_blurry("images/image_007.png")}"
puts "image_008 is blurry?: #{is_blurry("images/image_008.png")}"
puts "image_009 is blurry?: #{is_blurry("images/image_009.png")}"
puts "image_010 is blurry?: #{is_blurry("images/image_010.png")}"
puts "image_011 is blurry?: #{is_blurry("images/image_011.png")}"
puts "image_012 is blurry?: #{is_blurry("images/image_012.png")}"
puts "----------------------------------------------------------"

# my uploads
puts "----------------------------------------------------------"
puts "Text-based image results"
puts "img_5540 is blurry?: #{is_blurry("images/IMG_5540.jpg")}"
puts "img_5541 is blurry?: #{is_blurry("images/IMG_5541.jpg")}"
puts "sample.png is blurry?: #{is_blurry("images/sample.png")}"
puts "blurry_pdf is blurry?: #{is_blurry("images/blurrypdf.png")}"
puts "blurred-text is blurry?:  #{is_blurry("images/blurred-text.png")}"
puts "clear_text is blurry?:  #{is_blurry("images/clear_text.png")}"
puts "not_blurry is blurry?:  #{is_blurry("images/not_blurry.png")}"
puts "really_blurry is blurry?:  #{is_blurry("images/really_blurry.png")}"
puts "very_blurry is blurry?:  #{is_blurry("images/very_blurry.png")}"
puts "----------------------------------------------------------"



# Tesseract OCR


puts RTesseract.new("images/resume.png").to_s
puts "----------------------------------------------------------"

puts RTesseract::Box.new('images/resume.png').words

# Output of my phone number
# {:word=>"B32", :x_start=>90, :y_start=>468, :x_end=>122, :y_end=>483}
# {:word=>"465", :x_start=>128, :y_start=>468, :x_end=>161, :y_end=>483}
# {:word=>"8840", :x_start=>168, :y_start=>468, :x_end=>212, :y_end=>483}
