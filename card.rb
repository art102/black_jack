class Card
  def initialize(lear, face)
    @lear = lear
    @face = face
  end

  def value
    return @face if @face.is_a?(Integer)
    @face.eql?('A') ? 11 : 10
  end

  def display
    "#{@face}#{@lear}"
  end
end
