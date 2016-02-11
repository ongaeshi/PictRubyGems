# # hit_and_blow
#
# ## Description
# Hit & Blow Game.
# Please enter 4-digit number.

def main
  Popup.msg "Hit & Blow"

  game = HitAndBlow.new

  loop do
    msg = []
    msg.push "Stage #{game.stage}"
    msg.push "????"
    msg.push game.history.join("\n") if game.history.length > 0 
    msg.push "Please enter 4-digit number."
    input = Popup.input(msg.join("\n"))

    hit, blow = game.check(input)
    
    if hit == 4
      puts <<EOF
You win!
#{game.history.join("\n")}      
EOF
      break
    end
  end
end

class HitAndBlow
  attr_reader :stage
  attr_reader :history
  
  def initialize
    @correct = generate_number
    @stage = 1
    @history = []
  end

  def check(answer_str)
    # Convert answer
    answer = answer_str.split("")[0..3].map { |i| i.to_i }

    # Calculate hit & blow
    hit = 0
    (0..3).each { |i| hit += 1 if answer[i] == @correct[i] }

    blow = answer.reduce(0) { |t, e| @correct.include?(e) ? t + 1 : t } - hit

    # Record history
    @history.push "#{@stage}: #{answer_str} [hit:#{hit} blow:#{blow}]"
    @stage += 1

    # Return value
    [hit, blow]
  end

  def generate_number
    list = (0..9).to_a
    (0..3).map { list.delete_at(rand(list.size-1)) }
  end
end
