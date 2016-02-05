require 'pry'
# require_relative 'deck'
class Card
  attr_reader :rank, :suit
  attr_accessor :new_card

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def is_ace?
    return true if @rank == "A"
    return false
  end

  def is_face?
    return true if @rank == "K"
    return true if @rank == "Q"
    return true if @rank == "J"
    return false
  end

end
