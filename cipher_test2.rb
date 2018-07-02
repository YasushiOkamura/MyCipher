require './my_cipher.rb'

key_length = 128
bit_length = 4
max = 2**bit_length
key = Random.new.rand(2**(key_length - 1)..2**key_length)

cipher = MyCipher.new(bit_length, key, key, key * Random.new.rand(2**(key_length - 1)..2**key_length))
c = 0
#max.times do |i|
  #max.times do |j|
  15.times do |depth|
    start_time = Time.now
    i = 5
    j = 3
    c1 = []
    c2 = []
    c3 = cipher.encrypt(0)
    #depth = 8
    (depth + 1).times do |n|
      c1 << cipher.encrypt(i)
      c2 << cipher.encrypt(j)
      c3 = cipher.c_add(c3, cipher.c_add(c1[n], c2[n]))
    end

    m3 = cipher.decrypt(c3)
    # if (i + j) * depth != m3
      c += 1
      # p c3
      # puts "#{depth}(#{i} + #{j}) = #{m3}"
      # puts

    # end
    puts "#{depth + 1}(#{i} + #{j}) = #{m3}"
    p "加算回数 #{depth + 1} 処理時間 #{Time.now - start_time}s"
  end
#end

p c
