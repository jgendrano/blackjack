require "pry"
require_relative '../../lib/blackjack'
require_relative '../../lib/deck'
require_relative '../../lib/card'
require_relative '../../lib/hand'

 describe Deck do
  let(:deck) { Deck.new }

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end
  end

  it "creates unique cards" do
    expect(deck.cards.uniq.size).to eq 52
  end

  it "shuffles deck aftering being built" do
    expect(deck.cards.shuffle).to_not eq deck.cards
  end

  describe "#deal" do
    it "takes a card out of the deck array and returns it" do
      expect(deck.cards.pop.class).to eq(Card)
      expect(deck.cards.uniq.size).to eq 51
    end
  end
end

describe Card do
  let(:card) { Card.new("3", "♠") }
  let(:card_1) { Card.new("K", "♦") }
  let(:card_2) { Card.new("Q", "♣") }
  let(:card_3) { Card.new("J", "♠") }
  let(:card_4) { Card.new("A", "♥") }

  describe "#new" do
    it "is an instance of the Card class" do
      expect(card.class).to eq(Card)
    end
  end

  describe "#initialize" do
    it "shows the rank and suit of the card" do
      expect(card.rank).to eq("3")
      expect(card.suit).to eq("♠")
      expect(card_1.rank).to eq("K")
      expect(card_1.suit).to eq("♦")
    end
  end

  describe "#is_ace?" do
    it "checks to see if a card is an ace" do
      expect(card.is_ace?).to eq false
      expect(card_1.is_ace?).to eq false
      expect(card_2.is_ace?).to eq false
      expect(card_3.is_ace?).to eq false
      expect(card_4.is_ace?).to eq true
    end
  end

  describe "#is_face?" do
    it "checks to see if a card is a face card" do
      expect(card.is_face?).to eq false
      expect(card_1.is_face?).to eq true
      expect(card_2.is_face?).to eq true
      expect(card_3.is_face?).to eq true
      expect(card_4.is_face?).to eq false
    end
  end
end

describe Hand do
  let(:hand_initialize) { Hand.new }
  let(:hand) { Hand.new(:card) }
  let(:scoringHand) { Hand.new(Card.new("A", "♥")) }
  let(:opponentHand) { Hand.new(Card.new("K", "♥")) }


  describe "#new" do
    it "is an instance of the Hand class" do
      expect(hand_initialize.class).to eq(Hand)
    end
  end

  describe "#initialize" do
    it "checks to see if the initialize method creates an empty array" do
      expect(hand_initialize.current_hand).to eq []
    end
  end

  describe "#add_card" do
    it "adds a card to the hand" do
      expect(hand_initialize.add_card(:card_1)).to eq [:card_1]
      expect(hand_initialize.add_card(:card_2)).to eq [ :card_1, :card_2]
    end
  end

  describe "#score" do
    it "tests the score of a blackjack hand" do

      scoringHand.add_card(Card.new("A", "♥"))

      expect(scoringHand.score).to eq 11

      scoringHand.add_card(Card.new("5", "♠"))
      expect(scoringHand.score).to eq 16

      scoringHand.add_card(Card.new("J", "♠"))
      expect(scoringHand.score).to_not eq 26
      expect(scoringHand.score).to eq 16

      scoringHand.add_card(Card.new("A", "♥"))
      expect(scoringHand.score).to_not eq 37
      expect(scoringHand.score).to_not eq 27
      expect(scoringHand.score).to eq 17

    end
  end
  describe "#compare_score" do
    it "tests to see if the Dealer & Player tie" do
      expect(scoringHand.compare_score(scoringHand)).to eq "Dealer and Player tie"
    end
    it "tests to see if Player wins" do
      scoringHand.add_card(Card.new("J", "♠"))
      opponentHand.add_card(Card.new("8", "♥"))
      expect(scoringHand.compare_score(opponentHand)).to eq "Player wins"
    end
    it "tests to see if Dealer wins" do
      scoringHand.add_card(Card.new("7", "♠"))
      opponentHand.add_card(Card.new("9", "♥"))
      expect(scoringHand.compare_score(opponentHand)).to eq "Dealer wins"
    end
  end

  # describe blackjack do
  #   it "creates a new deck of cards" do
  #
  # end

end
