class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts ["数字を入力してください","0: グー","1: チョキ","2: パー"]
    player_input_number = gets.to_i

    if player_input_number != 0 && player_input_number != 1 && player_input_number != 2
     puts ["######################################","Warning!!:0〜2の数字を入力してください","######################################"]
     retry_player = Player.new
     retry_player.hand
    else
     return player_input_number
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemy_input_number = Random.rand(0..2)
    return enemy_input_number
  end
end

class Janken
  def pon(player_number, enemy_number)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる

   case enemy_number
    when 2
     enemy_hand = "パー"
    when 1
     enemy_hand = "チョキ"
    when 0
     enemy_hand = "グー"
    else
    return "意図しない数値が入ってます。class Enemyの設定を見直してください。"
   end

   janken_result = (player_number - enemy_number + 3) % 3

    if janken_result == 2
        puts ["相手の手：", "#{enemy_hand}"]
        win = Win.new
        win.winner_call
        
    elsif janken_result == 1
        puts ["相手の手：", "#{enemy_hand}"]
        lose = Lose.new
        lose.loser_call

    else
        puts ["***********************","　　あーいこーで・・・　　","***********************"]
        player = Player.new
        enemy = Enemy.new
        janken = Janken.new
        janken.pon(player.hand, enemy.hand)

    end

  end
end

class Win
   def winner_call
    puts ["♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪","　　　　Fever!!　　　　","♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪"]
   end
end

class Lose
   def loser_call
    puts ["***************","　　負けた・・・　　","***************"]
   end
end


puts ["**************************","　　じゃーんけーん・・・　　","**************************"]

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
    




