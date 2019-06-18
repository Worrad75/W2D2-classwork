class Queen < Piece

  include Slideable
  protected 

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end