class Piece

  attr_accessor :color

  def initialize(start_pos, color)
    @position = start_pos
    @in_play = true
    @color = color
  end

  def position=(pos)
    @position = pos
  end
end