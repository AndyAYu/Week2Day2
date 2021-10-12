class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5 
  end  

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |el, idx|
      if el == char
      indices << idx
      end
    end
    indices
  end

  def fill_indices(char,indices)
    indices.each do |indic|
      @guess_word[indic] = char
    end
    @guess_word
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts 'that has already been attempted'
      return false
    end

    @attempted_chars << char

    matches = get_matching_indices(char)
    if matches.empty?
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, matches)
    end
    true
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    char = gets.chomp.to_s
    try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else
      return false
    end
  end
end
