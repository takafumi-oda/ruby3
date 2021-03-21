$coin = 100 #残りコインの初期値
$point = 0 #ポイントの初期値

def slot_machine1 #スロットの１列目
  $num0 = rand(8)
  $num3 = rand(8) 
  $num6 = rand(8) 
  puts "|#{$num0}|||"
  puts "|#{$num3}|||"
  puts "|#{$num6}|||"
  puts "------------------------------------------"
end

def slot_machine2 #スロットの２列目
  $num1 = rand(8) 
  $num4 = rand(8) 
  $num7 = rand(8) 
  puts "|#{$num0}|#{$num1}||"
  puts "|#{$num3}|#{$num4}||"
  puts "|#{$num6}|#{$num7}||"
  puts "------------------------------------------"
end

def slot_machine3 #スロットの３列目
  $num2 = rand(8) 
  $num5 = rand(8) 
  $num8 = rand(8) 

  puts "|#{$num0}|#{$num1}|#{$num2}|"
  puts "|#{$num3}|#{$num4}|#{$num5}|"
  puts "|#{$num6}|#{$num7}|#{$num8}|"
  puts "------------------------------------------"
end

def judgement #あたり、はずれの判定
  if $num0==$num1 && $num0==$num2 || $num3==$num4 && $num3==$num5 || $num6==$num7 && $num6==$num8 || \
     $num0==$num3 && $num0==$num6 || $num1==$num4 && $num1==$num7 || $num2==$num5 && $num2==$num8 || \
     $num0==$num4 && $num0==$num8 || $num2==$num4 && $num2==$num6  
     puts "あたり！"
     $point += $bet_coin*10
     puts "#{$bet_coin*10}ポイント獲得しました！"
  else
     puts "はずれ"
  end
end

while $coin > 0
  puts "------------------------------------------"
  puts "残りのコイン数：#{$coin}"
  puts "獲得ポイント数：#{$point}"
  puts "コインを何枚入れますか？スロットをやめるときは０を入力してください。"
  $bet_coin = gets.to_i
  while $bet_coin > $coin
    puts "------------------------------------------"
    puts "残りコインが足りません。再度、コインの枚数を入力してください。"
    $bet_coin = gets.to_i
  end
  if $bet_coin == 0
    puts "------------------------------------------"
    puts "スロットを終了しました。"
    break
  else
    $coin -= $bet_coin
    puts "------------------------------------------"
    puts "Enterキーを押してスロットを止めてね！"
    stop = gets #スロットを止める
    slot_machine1
    stop = gets #スロットを止める
    slot_machine2
    stop = gets #スロットを止める
    slot_machine3
    judgement
  end
  
  if $coin == 0
    puts "------------------------------------------"
    puts "コインがなくなりました。スロットを終了します。"
    break
  end
end
puts "最終獲得ポイント数：#{$point}"
