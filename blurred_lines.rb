class BlurredLines
  THRESHOLD = 1000

  attr_accessor :image

  # param image - String: string of image location
  def initialize(image)
    @image = image
  end

  def variance_of_laplacian
    variance = CvMat.load(image, CV_LOAD_IMAGE_GRAYSCALE).to_32f.laplace.avg_sdv[1][0] ** 2
    puts "#{image}: #{variance}"
    variance
  end

  # param threshold - Integer: can and should be changed based on variance threshold for your dataset.
  def blurry?(threshold = THRESHOLD)
    variance_of_laplacian < threshold
  end
end
