class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def cards_in_catgory(category)
    temp = []
    @cards.each{|card|
    if card.category == category
      temp << card
    end
    }
    return temp
  end


end
