class Image
  def initialize(width, height, pixels)
    @width = width
    @height = height
    @pixels = pixels
  end

  def display
    @pixels.each_slice(@width).map { |pixel| pixel }
  end

  def flood_fill(x, y, post_color, pre_color)
    @pixels[pixel_index(x, y)] = post_color
    flood_fill(x+1, y, post_color, pre_color) if @pixels[pixel_index(x+1, y)] == pre_color
    flood_fill(x-1, y, post_color, pre_color) if @pixels[pixel_index(x-1, y)] == pre_color
    flood_fill(x, y+1, post_color, pre_color) if @pixels[pixel_index(x, y+1)] == pre_color
    flood_fill(x, y-1, post_color, pre_color) if @pixels[pixel_index(x, y-1)] == pre_color
  end

  private

  def pixel_index(x, y)
    index = @width * (y - 1) + x - 1
  end

end

