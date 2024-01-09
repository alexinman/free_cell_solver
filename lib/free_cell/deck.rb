class Deck < Array
  def initialize
    super(52, &Card.method(:new))
  end
end
