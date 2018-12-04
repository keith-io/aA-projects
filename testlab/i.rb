class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(color)
    @color = color
    super("Fido")
  end
end
