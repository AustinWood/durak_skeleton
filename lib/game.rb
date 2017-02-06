require_relative 'player'
require_relative 'deck'

class Game
  attr_reader :players, :deck, :turns, :trump_suit

  def initialize(players)
  end

  # No need to modify this method.
  def play
    fill_hands
    set_trump_suit
    puts "The trump suit is #{@trump_suit}"
    select_first_attacker
    take_turn until loser?
    declare_durak
  end

  def fill_hands
  end

  def set_trump_suit
  end

  # Rotate the @players array so that the Player at i = 0
  # is the Player with the lowest card matching the trump suit
  # No need to modify this method.
  def select_first_attacker
    lowest_card_val = nil
    first_attacker_idx = 0
    players.each.with_index do |player, i|
      player.trump_cards.each do |card|
        next unless lowest_card_val.nil? || card.int_val < lowest_card_val
        lowest_card_val = card.int_val
        first_attacker_idx = i
      end
    end
    @players.rotate!(first_attacker_idx)
  end

  # No need to modify this method.
  def take_turn
    @turns += 1
    puts "----------------\n> Turn ##{@turns}"
    players.each { |player| puts player.print_cards }
    attacking_card = attacker.attack
    puts "\n#{attacker.name} attacked with #{attacking_card}"
    defending_card = defender.defend(attacking_card)
    attack_successful = defending_card.nil?
    puts (attack_successful ? "#{defender.name} was unable to defend!" : "#{defender.name} defended with #{defending_card}")
    defender.take([attacking_card]) if attack_successful
    fill_hands
    attack_successful ? @players.rotate!(2) : @players.rotate!(1)
    remove_cardless_players
  end

  def remove_cardless_players
  end

  def attacker
  end

  def defender
  end

  def loser?
  end

  def declare_durak
    puts "----------------"
    puts (@players.count.zero? ? "There was no дурак this game!" : "#{@players.first.name} is the дурак!")
    puts "This game took #{@turns} turns"
  end
end

if __FILE__ == $PROGRAM_NAME
  names = ["Pyotr Ilyich Tchaikovsky", "Yuri Gagarin", "Vladimir Putin", "Mikhail Gorbachev"]
  players = names.map { |name| Player.new(name) }
  game = Game.new(players).play
end
