require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 36 playing cards.
  def self.all_cards
  end

  def initialize(cards = Deck.all_cards)
  end

  # Returns the number of cards in the deck.
  def count
  end

  def reveal_trump_suit
    # Returns the suit of the last card in the deck
  end

  def take_one
  end
end
