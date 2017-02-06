class Player
  attr_reader :name
  attr_accessor :cards, :trump_suit

  def initialize(name)
    @trump_suit = nil
  end

  def fill_hand(deck)
  end

  def take(new_cards)
  end

  # To simplify game logic, assume that the attacker will always
  # choose to attack with their lowest value card not of the trump suit.
  # If the player only has cards matching the trump suit, then choose
  # from these the card with the lowest value.
  # In real-life gameplay, this is usually the best attaking strategy,
  # as you want to save your high-value cards for defense.
  def attack
  end

  # See README (Each turn #2) for instructions on how to choose defending card.
  # Return nil if no winning move is possible.
  def defend(attacking_card)
  end

  # Helper method which returns the lowest card in an array card_subset
  # which is higher than the min value (if given)
  def lowest_card(card_subset, min = nil)
  end

  # Helper method which returns a subset of the player's cards
  # that match the trump suit. Hint: use Array#select
  def trump_cards
  end

  # Helper method which returns a subset of the player's cards
  # that don't match the trump suit. Hint: use Array#reject
  def non_trump_cards
  end

  # Called during Game#take_turn to print player's cards
  # to the command line. No need to modify this method.
  def print_cards
    output = "#{@name}'s cards: "
    str_arr = @cards.map { |card| card.to_s }
    cards_str = str_arr.join(", ")
    output.concat(cards_str)
  end
end
