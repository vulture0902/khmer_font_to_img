require 'rmagick'
require "csv"
include Magick

  csv = CSV.read("config/list_font.csv")

  def font_gen(font_number, number, path, csv)

    str_tmp = ["០","១","២","៣","៤","៥","៦","៧","៨","៩"]
    font_path = "#{Dir.pwd}/font/#{csv[font_number - 1][0]}"
    img_tmp = Image.new(100,100) { self.background_color = "black" }
    img_text = Draw.new
    img_text.annotate(img_tmp, 0, 0, 10, 80, str_tmp[number]) do #(draw, width, height, x, y, text)
      self.fill = 'white'
      self.pointsize = 100
      self.font = font_path
    end

    img_tmp2 = img_tmp.trim
    img_tmp3 = img_tmp2.border(10,10, '#000000')
    x = img_tmp3.inspect.split(' ')[1].split('x')[0]
    y = img_tmp3.inspect.split(' ')[1].split('x')[1]

    x_new = 0
    y_new = 0

    if (x.to_i < y.to_i)
      x_new = (y.to_i - x.to_i) / 2
      y_new = 0
    else
      x_new = 0
      y_new = (x.to_i - y.to_i) / 2
    end  

    img_tmp4 = img_tmp3.border(x_new, y_new, '#000000')
    img_tmp5 = img_tmp4.resize(28,28)
    img_tmp5.write("#{path}#{number}.png")

  end

  1.upto(219) do |font_number|
    path = "output/#{format("%04d", font_number)}/"
    Dir.mkdir(path) unless File.exists?(path)

    0.upto(9) do |number|
      font_gen(font_number, number, path, csv)
    end
  end

