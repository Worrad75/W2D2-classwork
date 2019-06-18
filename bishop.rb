class Bishop < Piece

  include Slideable
  protected 

  def move_dirs
    diagonal_dirs
  end
end