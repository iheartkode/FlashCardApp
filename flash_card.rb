# Module for encapsulation
module Flashcards
  #Application class
  class Application
    def initialize
      @decks = []
    end
# An append method
    def << deck
      @decks << deck
    end

    def play
      display_decks
      puts "Pick a deck"
      deck = get_deck
      deck.play
    end

    def display_decks
      @decks.each { |deck| puts deck.name }
    end

    def get_deck
      name = gets.chomp
      @decks.detect { |deck| deck.name == name }
    end
  end

  # Card class
  class Card
    attr_accessor :front, :back

    def initialize (front, back)
      @front = front
      @back = back
    end

    def correct?(guess)
      guess == @back
    end

    def play
      print "#{front} > "
      guess = gets.chomp
      if correct? guess
        puts "Correct"
      else
        puts "Incorrect. The answer was #{back}."
      end
    end
  end

  # Deck class
  class Deck
    attr_reader :name, :cards

    def initialize(name)
      @name = name
      @cards = []
    end

    def << card
      @cards << card
    end

    def play
      shuffle
      @cards.each(&:play)
    end

    def shuffle
      @cards.shuffle!
    end
  end
end

#Create a new deck
deck = Flashcards::Deck.new("Addition")

# Addition Cards
addition1 = Flashcards::Card.new("1+1", "2")
addition2 = Flashcards::Card.new("1+2", "3")
addition3 = Flashcards::Card.new("1+3", "4")
addition4 = Flashcards::Card.new("1+4", "5")
# Append the card to the deck
deck << addition1
deck << addition2
deck << addition3
deck << addition4

#Instantiate the application
app = Flashcards::Application.new
app << deck
app.play
