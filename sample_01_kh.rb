require 'rubygems'
require 'rmagick'
include Magick

str_tmp = ["០","១","២","៣","៤","៥","៦","៧","៨","៩"]

0.upto(9) do |number|

  img_00 = Image.new(100,100) { self.background_color = "white" }

  img_text = Draw.new
  img_text.annotate(img_00, 0,0,22,80, str_tmp[number]) do
    self.fill = 'black'
    self.pointsize = 100
    #self.font = '/home/ubuntu/workspace/lesson-rmagick/font/Moul.ttf'
    self.font = '/home/ubuntu/workspace/lesson-rmagick/font/KhmerOSBassac.ttf'
  end

  number_inc = number + 1
  img_00.write("_output/output_#{number_inc}.jpg")

end