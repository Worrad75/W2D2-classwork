require 'byebug'
require_relative 'singleton'
require_relative 'piece'

class Board

  attr_accessor :rows

  def initialize
    @sentinel = NullPiece.instance

    @rows = Array.new(8) { Array.new(8, @sentinel) }
    @rows.each_with_index do |row, i|
      row.each_with_index do |col, i2|
        if i < 2
          @rows[i][i2] = Piece.new([i, i2], :white)
        elsif i > 5
          @rows[i][i2] = Piece.new([i, i2], :black)
        # else
        #   NullPiece.instance
        end
      end
    end
  end

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @rows[x][y] = value
  end

  def move_piece(start_pos, end_pos) #   start_pos = [1, 2]

    start_piece = self[start_pos]
    end_piece = self[end_pos]

    if valid_pos?(start_pos) && end_piece.color != start_piece.color
      #if rows.get_piece(start_piece).has_legal_move?(end_piece) == true
      
      start_piece.position = end_pos #assigning piece instance a new position

      add_piece(start_piece, end_pos) 

      add_piece(@sentinel, start_pos) #pull Null val at original pos
      
    end

  end

  def valid_pos?(pos)
    return true if self[pos] != @sentinel #&& end_piece.color != start_piece.color
    false
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end
  
  def move_piece!(color, start_pos, end_pos)
  end
end

# test = Board.new

# test.rows.each do |arr|
#   puts arr
#   puts "======"
# end
# puts '\n\n\n\n'

# test.move_piece([1,1], [2,3])

# puts '\n\n\n\n'
# test.rows.each do |arr|
#   puts arr
#   puts "======"
# end