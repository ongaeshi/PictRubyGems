# # hit_and_blow
#
# ## Description
# Hit & Blow Game.
# Please enter 4-digit number.

def main
  Popup.msg "Hit & Blow"

  answer = make_answer

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
    user = input.split("")[0..3].map { |i| i.to_i }

    hit, blow = check(user, answer)
    
    history.push "#{stage}: #{input} [hit:#{hit} blow:#{blow}]"

    if hit == 4
      puts "You win!"
      puts history.join("\n")
      break
    end
  end
end

def make_answer
  list = (0..9).to_a
  (0..3).map { list.delete_at(rand(list.size-1)) }
end

def check(user, answer)
  hit = 0
  (0..3).each { |i| hit += 1 if user[i] == answer[i] }

  blow = user.reduce(0) { |t, e| answer.include?(e) ? t + 1 : t } - hit

  [hit, blow]
end
