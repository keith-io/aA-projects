# PHASE 2
def convert_to_int(str)
  begin
  Integer(str)
  rescue ArgumentError
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message
    "COFFEEEEEEEEE ::throws chair::"
  end
end

class NotAFruitError < StandardError
  def message
    "That's not a fruit. We can't be friends."
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == 'coffee'
    raise CoffeeError
  else
    raise NotAFruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => c
    puts c.message 
    retry
  rescue NotAFruitError => f
    puts f.message
  end
end  

class AnonymousFriendError < StandardError
  def message
    "Wait... you don't know your best friend's name?"
  end
end

class UnknownPasttimeError < StandardError
  def message
    "Wait... you don't know your best friend's hobby?"
  end
end

class NewFriendError < StandardError
  def message
    "Woah... slow down, you don't know me like that"
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise AnonymousFriendError if name.length < 1
    raise UnknownPasttimeError if fav_pastime.length < 1
    raise NewFriendError if yrs_known < 5
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


