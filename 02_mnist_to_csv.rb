require "csv"
require 'opencv'
include OpenCV

mnist_file_name = "mnist_khmer_v1.csv"

CSV.open(mnist_file_name, 'w') do |line|
  1.upto(219) do |font_number|
    0.upto(9) do |label_number|

      file_path = "output/#{format("%04d", font_number)}/#{label_number}.png"
      image = CvMat.load(file_path, CV_LOAD_IMAGE_COLOR)
      gray = image.BGR2GRAY

      cnt = 1
      matrix = [label_number]
      gray.each_row do |row|
        0.upto(27) do |num|
          matrix << row[num][0].to_i
        end
        cnt = cnt + 1
      end

      line << matrix
    end
  end
end

