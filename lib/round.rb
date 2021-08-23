class Round
  attr_reader :deck, :turns

    def initialize(deck)
      @deck = deck
      @turns = []
    end

    #index of current card same as length of @turns
    def current_card
      @deck.cards[@turns.length]
    end

    # refactor more DRY?
    def take_turn(guess)
      #create new Turn object
      turn = new Turn(guess, self.current_card)
      # store in array
      @turns << turn
      # return the turn
      return turn
    end


    def number_correct
      @turns.count{|turn| turn.correct?}
    end

    # refactor more DRY?
    def number_correct_by_category(category)
      @turns.count{|turn| (turn.card.category == category) && turn.correct?}
    end

    def percent_correct
      (self.number_correct / @turns.length) * 100
    end

    def percent_correct_by_category(category)
      (self.number_correct_by_category(category) / @turns.length) * 100
    end


end
