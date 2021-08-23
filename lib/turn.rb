class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

#returns a boolean indicating if the guess matched the answer on the Card
  def correct?
    guess == @card.answer
  end

  def feedback
    if self.correct?
      "Correct!"
    else
      "Incorrect"
    end
  end

end
