require './my_cipher.rb'

bit_length = 8
roop_num = 4
random = Random.new

roop_num.times do |i|  
  key = 193# random.rand(2..127)
  roop_num.times do |j|
    cipher = MyCipher.new(bit_length, key, key)
    a = random.rand(256)
    b = random.rand(256)
    c1 = cipher.encrypt(a)
    c2 = cipher.encrypt(b)
    c3 = cipher.c_equal?(c1, c2)
    c4 = cipher.c_not(c1)
    c5 = cipher.c_and(c1, c2)
    c6 = cipher.c_xor(c1, c2)
    m1 = cipher.decrypt(c1)
    m2 = cipher.decrypt(c2)
    m3 = cipher.decrypt(c3)
    m4 = cipher.decrypt(c4)
    m5 = cipher.decrypt(c5)
    m6 = cipher.decrypt(c6)
    puts "#{m1} == #{m2}, m1:#{m1} m2:#{m2}  m1&m2:#{m5}, m1&m2:#{m1 & m2}, key: #{key}" if m3 == 1
    if(m5 != m1 & m2)
      puts "m1:#{m1} m2:#{m2}  m1&m2:#{m5}, m1&m2:#{m1 & m2}, key: #{key}"
    end
    if(m6 != m1 ^ m2)
      puts "m1:#{m1} m2:#{m2}  m1|m2:#{m6}, m1&m2:#{m1 ^ m2}, key: #{key}"
    end
    #puts "#{m1} != #{m2}, m1:#{m1} m2:#{m2}  m1&m2:#{m5}, m1&m2:#{m1 & m2}, key: #{key}" if m3 == 0
    #puts "#{m1} == #{m2}, m1:#{m1} m2:#{m2}  m1&m2:#{m5}, m1&m2:#{m1 & m2}, key: #{key}" if m3 == 1
    #puts ""
    # おかしい組み合わせのときに出力したい
=begin
    if(a != m1 || b != m2)
      puts "invalid decrypt  values m1:#{m1}, a:#{a}, m2:#{m2}, b:#{b}, key:#{key}"
    end
=end
=begin
    if(m3.zero? && (m1 == m2))
      puts "#{m1} != #{m2}, m1:#{m1} m2:#{m2} \t ~m1:#{m4}, m1&m2:#{m5}, m1^m2:#{m6}, key: #{key}" if m3 == 0
    elsif(m3 == 1 && (m1 != m2))
      puts "#{m1} == #{m2}, m1:#{m1} m2:#{m2} \t ~m1:#{m4}, m1&m2:#{m5}, m1^m2:#{m6}, key: #{key}" if m3 == 1
    else
      #puts "put true  values m1:#{m1}, m2:#{m2}, key:#{key}"
    end
=end
  end
end

__END__
# 発表内容(15分)
- FHEの実装デモ
- 原理説明
- 等号判定のデモ
- データベースの今後
- 最終発表の目標
