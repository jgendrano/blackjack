class Hand
  attr_accessor :current_hand, :initial_card

  def initialize(*initial_card)
    @current_hand = []
  end

  def add_card(added_card)
    @current_hand << added_card
  end

  def score
    score = 0
    has_ace = false
    @current_hand.each do |card|
        if card.is_face?
          score += 10
        elsif card.is_ace?
            if score <= 10
              score += 11
              has_ace = true
            else
              score += 1
            end
        else
          score += card.rank.to_i
        end

        if score > 21 && has_ace == true
          score -=10
        end
    end
    return score
  end

  def compare_score(opponent)
    if (score > 21 && opponent.score > 21) || (score == opponent.score)
      puts "Dealer and Player tie!"
    elsif ((score > opponent.score) && score <= 21) || (score <= 21 && opponent.score > 21)
      puts "Player wins!"
    else
      puts "Dealer wins!"
    end
  end
end
