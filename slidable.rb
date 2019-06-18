module Slideable
  private
    HORIZONTAL_DIRS = [ [0, -1], [0, 1], [-1, 0], [1, 0] ]
    DIAGONAL_DIRS = [ [1,-1], [-1,-1], [[1,1], [-1,1] ]
  
  public

    def horizontal_dirs
      HORIZONTAL_DIRS
    end

    def diagonal_dirs
      DIAGONAL_DIRS
    end

    def moves
      valid_moves = []
      move_dirs.each do |move| # [1,-1]
        x = move[0]
        y = move[1]
        valid_moves << grow_unblocked_moves_in_dir(dx, dy)
      end
      valid_moves
    end

  private

    def grow_unblocked_moves_in_dir(dx, dy)
      extra_array = []
      cp = self.pos[dx, dy]
      while Board.valid_pos?(cp)
        if cp.color == :nil #if its a nillpiece
          extra_array << cp
          cp[0] += dx
          cp[1] += dy
        elsif cp.color != self.color
          extra_array << cp
          break
        else # its our piece
          break
        end  
      end
      
      extra_array
    end
end