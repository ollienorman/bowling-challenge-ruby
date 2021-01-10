class Scorecard

  attr_reader :pins_knocked, :frame_scores, :strikes_spares, :frame, :roll

  def initialize
    @pins_knocked = []
    @frame_scores = []
    @strikes_spares = {}
    @frame = 0
    @roll = 0
  end

  def input_roll
    puts "Please enter your roll result for frame #{@frame + 1}, roll #{roll + 1}:"
    result = gets.chomp.to_i
    @pins_knocked << [] unless @pins_knocked[@frame]
    @pins_knocked[@frame] << result
    @roll += 1
    if roll > 1 || @pins_knocked[@frame] == 10
      calculate_frame
      @frame += 1 
      @roll = 0
    end
  end

  def calculate_frame
    @frame_scores << @pins_knocked[@frame].sum
  end
end