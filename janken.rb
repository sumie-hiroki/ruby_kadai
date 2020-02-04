class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    p "[0]:グー¥n[1]:チョキ¥n[2]:パー"
    player_hand = gets.to_i
    # p input.chomp!
    # player_hand.class
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemy_hand = rand(3)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    jankens = ["グー","チョキ","パー"]
    # puts "あなたの手:#{jankens[player_hand]}, 相手の手:#{jankens[enemy_hand]}"
    a = (player_hand - enemy_hand + 3)%3
    if a == 0
      puts "あいこで"
      return next_game = true
    elsif player_hand > 2 || player_hand < 0
      puts "正しい数字を入力して下さい。"
      return next_game = true
    elsif a == 2
    puts "相手の手:#{jankens[enemy_hand]}あなたの勝ちです"
      return next_game = false
    else
      puts "あなたの負けです"
      return next_game = false
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

next_game = true
while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end
