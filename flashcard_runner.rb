require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

  # instantiate cards, deck, round
  def start
    card_1 = Card.new("What is 5 + 5?", "10", :STEM)
    card_2 = Card.new("What is Rachel's favorite animal?", "not panda", "Turing Staff".to_sym)
    card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff".to_sym)
    card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture".to_sym)
    deck = Deck.new([card_1, card_2, card_3, card_4])
    Round.new(deck)
  end

new_round = start()
#binding.pry
puts "Welcome! You're playing with #{new_round.deck.count} cards."
puts "-------------------------------------------------"

  #loop thru cards
  while new_round.turns.length < new_round.deck.count do
  puts "This is card number #{new_round.turns.length + 1} out of #{new_round.deck.count}."
  puts "Question: #{new_round.current_card.question}"
  guess = gets.chomp #use chomp to remove \n
  turn = new_round.take_turn(guess)
  puts turn.feedback
  end

  #output results
  puts "****** Game over! ******"
  puts "You had #{new_round.number_correct} correct guesses out of #{new_round.deck.count} for a total score of #{new_round.percent_correct}%."

  new_round.turns.each do |turn|
    puts "#{turn.card.category} - #{new_round.percent_correct_by_category(turn.card.category)}"
  end
