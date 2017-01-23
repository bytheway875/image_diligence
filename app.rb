require './blurred_lines'

require 'rtesseract'
require 'byebug'
require "awesome_print"
require 'openCV'
include OpenCV

# dog images
puts "----------------------------------------------------------"
puts "Dog image sample results"
puts "----------------------------------------------------------"
puts "image_001 is blurry?: #{BlurredLines.new("images/image_001.png").blurry?}"
puts "image_002 is blurry?: #{BlurredLines.new("images/image_002.png").blurry?}"
puts "image_003 is blurry?: #{BlurredLines.new("images/image_003.png").blurry?}"
puts "image_004 is blurry?: #{BlurredLines.new("images/image_004.png").blurry?}"
puts "image_005 is blurry?: #{BlurredLines.new("images/image_005.png").blurry?}"
puts "image_006 is blurry?: #{BlurredLines.new("images/image_006.png").blurry?}"
puts "image_007 is blurry?: #{BlurredLines.new("images/image_007.png").blurry?}"
puts "image_008 is blurry?: #{BlurredLines.new("images/image_008.png").blurry?}"
puts "image_009 is blurry?: #{BlurredLines.new("images/image_009.png").blurry?}"
puts "image_010 is blurry?: #{BlurredLines.new("images/image_010.png").blurry?}"
puts "image_011 is blurry?: #{BlurredLines.new("images/image_011.png").blurry?}"
puts "image_012 is blurry?: #{BlurredLines.new("images/image_012.png").blurry?}"
puts "----------------------------------------------------------"

# my uploads
puts "----------------------------------------------------------"
puts "Text-based image results"
puts "img_5540 is blurry?: #{BlurredLines.new("images/IMG_5540.jpg").blurry?}"
puts "img_5541 is blurry?: #{BlurredLines.new("images/IMG_5541.jpg").blurry?}"
puts "sample.png is blurry?: #{BlurredLines.new("images/sample.png").blurry?}"
puts "blurry_pdf is blurry?: #{BlurredLines.new("images/blurrypdf.png").blurry?}"
puts "blurred-text is blurry?:  #{BlurredLines.new("images/blurred-text.png").blurry?}"
puts "clear_text is blurry?:  #{BlurredLines.new("images/clear_text.png").blurry?}"
puts "not_blurry is blurry?:  #{BlurredLines.new("images/not_blurry.png").blurry?}"
puts "really_blurry is blurry?:  #{BlurredLines.new("images/really_blurry.png").blurry?}"
puts "very_blurry is blurry?:  #{BlurredLines.new("images/very_blurry.png").blurry?}"
puts "----------------------------------------------------------"


RTesseract.configure do |config|
  config.processor = "mini_magick"
end

# Tesseract OCR
puts RTesseract.new("images/resume.png").to_s
puts "----------------------------------------------------------"

puts RTesseract::Box.new('images/resume.png').words

# Output of my phone number
# {:word=>"B32", :x_start=>90, :y_start=>468, :x_end=>122, :y_end=>483}
# {:word=>"465", :x_start=>128, :y_start=>468, :x_end=>161, :y_end=>483}
# {:word=>"8840", :x_start=>168, :y_start=>468, :x_end=>212, :y_end=>483}
