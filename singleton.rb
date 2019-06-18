require 'singleton'

class NullPiece

  attr_reader :color

  include Singleton
  def initialize
    @color = :nil
  end

end