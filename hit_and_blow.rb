# # hit_and_blow
#
# ## Description
# Hit & Blow Game.
# Please enter 4-digit number.

def main
  Popup.msg "Hit & Blow"

  game = HitAndBlow.new

  stage = 0
  history = ["????"]

  loop do
    stage += 1
    
    msg = <<EOF
Stage #{stage}
#{history.join "\n"}
Please enter 4-digit number.
EOF

    input = Popup.input(msg.chomp)

    hit, blow = game.check(input)
    
    history.push "#{stage}: #{input} [hit:#{hit} blow:#{blow}]"

    if hit == 4
      puts "You win!"
      puts history.join("\n")
      break
    end
  end
end

class HitAndBlow
  def initialize
    @correct = generate_number
  end

  def check(answer_str)
    answer = answer_str.split("")[0..3].map { |i| i.to_i }

    hit = 0
    (0..3).each { |i| hit += 1 if answer[i] == @correct[i] }

    blow = answer.reduce(0) { |t, e| @correct.include?(e) ? t + 1 : t } - hit

    [hit, blow]
  end

  def generate_number
    list = (0..9).to_a
    (0..3).map { list.delete_at(rand(list.size-1)) }
  end
end
