require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display

  attr_reader :board, :cursor

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |col, i2|
        if col.color == :white
          print 'P1 '.colorize(:green)
        elsif col.color == :black
          print 'P2 '.colorize(:yellow)
        else
          print '   '.colorize(:yellow)
        end
      end
      puts
    end
  end
  #   puts "This is blue".colorize(:blue)
  #   puts @cursor.cursor_pos.to_s.colorize(:blue)
  # end
end

a =Display.new
a.render