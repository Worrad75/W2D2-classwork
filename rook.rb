class Rook < Piece

  include Slideable
  protected 

  def move_dirs
    horizontal_dirs
  end
end