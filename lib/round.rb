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
      turn = Turn.new(guess, self.current_card)
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
      (self.number_correct.to_f / @turns.length.to_f) * 100
    end

    # there MUST be a better way
    def percent_correct_by_category(category)
      (self.number_correct_by_category(category).to_f / @turns.count{|turn| turn.card.category == category}.to_f) * 100
    end


end
