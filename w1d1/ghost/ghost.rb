class Ghost
  attr_reader :dictionary

  def initialize(players, dictionary)
    @fragment = ""
    @dictionary = dictionary
    @players = players
  end

  def play_round

  end

  def current_player

  end

  def previous_player

  end

  def next_player!
    @previous_player = @current_player

  end

  def take_turn(player)
    guess = player.guess
    retry until valid_play?(guess)
    @fragment += guess
  end
  
  def valid_play?
    
  end
  

  def pick_random_word

  end

  def play
    
  end

  def run
    play_round
  end

  def display_standings

  end

end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    gets.chomp
  end

  def alert_invalid_guess

  end

end

if __FILE__ == $PROGRAM_NAME
  game = Ghost.new
  game.play
end