module Flashcards
  #Application class
  class Application
    def initialize
      @decks = []
    end

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
      puts "#{front} > "
      guess = gets.chomp
      if correct? guess
        puts "Correct"
      else
        puts "Incorrect. The answer was #{back}."
      end
    end
  end
  #Multiple Answer Class
  class MultipleAnswerCard < Card
    def correct?(guess)
      answers = @back.split(",")
      answers.any? { |answer| answer == guess }
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

#Create a card that has multiple answers
card = Flashcards::MultipleAnswerCard.new("Violin", "baoirin, virroin")

#Create a a new deck
deck = Flashcards::Deck.new("Japanese")
# Append the card to the deck
deck << card
#Create another deck
deck2 = Flashcards::Deck.new("Russian")

#Instantiate the application
app = Flashcards::Application.new
app << deck
app << deck2
app.play
