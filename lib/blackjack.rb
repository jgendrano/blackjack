require "pry"
require_relative 'deck'
require_relative 'card'
require_relative 'hand'



deck = Deck.new
deck.build_deck
player_hand = Hand.new
dealer_hand = Hand.new

puts "Welcome to Blackjack!"

2.times do
  print "Player was dealt: "
  player_hand.add_card(deck.deal)
end
puts ""
puts "Player score: #{player_hand.score}"
puts ""
if player_hand.score < 21
  puts "Hit or stand (H/S): "
  input = gets.chomp

  while input.downcase != "s" do
    print "Player was dealt: "
    player_hand.add_card(deck.deal)
    puts "Player score: #{player_hand.score}"
    if player_hand.score < 21
      puts ""
      puts "Hit or stand (H/S): "
      input = gets.chomp
      puts ""
    elsif player_hand.score == 21
      break
    else
      puts "Player busts!"

      break
    end
  end
end

puts ""
2.times do
  print "Dealer was dealt: "
  dealer_hand.add_card(deck.deal)

end
puts "Dealer score: #{dealer_hand.score}"

while dealer_hand.score < 17 do
  puts ""
  puts "Dealer hits."
  print "Dealer was dealt: "
  dealer_hand.add_card(deck.deal)
  puts "Dealer score: #{dealer_hand.score}"
  puts "Dealer busts!" if dealer_hand.score > 21
end
puts ""
puts "Player score: #{player_hand.score}"
puts "Dealer score: #{dealer_hand.score}"
player_hand.compare_score(dealer_hand)
