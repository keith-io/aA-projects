class Card 
attr_accessor :state, :face_value

  def initialize(int)
    @face_value = int
    @state = :down
  end

  def reveal
    @state = :up
  end

  def hide
    @state = :down 
  end 

  def to_s
    @face_value
  end

  # def ==(other_card)
  #   other_card.face_value == self.face_value
  # end 

end