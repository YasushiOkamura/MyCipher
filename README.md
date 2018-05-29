# My Cipher
Designed by Yoshiura

# Environment
ruby 2.3.3

# Algorithm
<img href="https://www.codecogs.com/eqnedit.php?latex=M&space;\in&space;0,1,\&space;C&space;\in&space;\mathcal{N}&space;\\&space;C&space;=&space;E(M)&space;=&space;M&space;&plus;&space;K&space;*&space;R&space;\\&space;M&space;=&space;D(C)&space;=&space;C&space;\mod&space;K&space;\mod2" target="_blank"><img src="https://latex.codecogs.com/gif.latex?M&space;\in&space;0,1,\&space;C&space;\in&space;\mathcal{N}&space;\\&space;C&space;=&space;E(M)&space;=&space;M&space;&plus;&space;K&space;*&space;R&space;\\&space;M&space;=&space;D(C)&space;=&space;C&space;\mod&space;K&space;\mod2" title="M \in 0,1,\ C \in \mathcal{N} \\ C = E(M) = M + K * R \\ M = D(C) = C \mod K \mod2" /></a>

# Usage

```ruby
cipher =  MyCipher.new(bit_length, secret_key, secret_key) # 鍵が２つあるのはいつか公開鍵になるかもしれないので一応

# 平文
a = 10
b = 5

# 暗号化 暗号文は配列 bit_length = 8[bit]
c1 = cipher.encrypt(a)
=> [308, 1554, 1645, 4417, 5398, 4291, 1345, 1897] 
c2 = cipher.encrypt(b)
=> [973, 420, 3094, 5824, 6384, 2171, 3402, 4327]

# 暗号文での計算たち

# 等号判定
c3 = cipher.c_equal?(c1, c2)
[36849990111486836334907197600000, 271868233933242509485656333600000, 17102270716882031449614029184000, 9704099300730617939494964472000, 10368572104414170797539494705600, 13235491425642149454763410966528, 29897375235521161633452686822400, 159968231351362235045404899187020000]
cipher.decrypt(c3)
=> 0 # (復号して1だったら等しい)

# 暗号文のbit反転(びみょう)
c4 = cipher.c_not(c1)
=> [4096, 5342, 5433, 8205, 9186, 8079, 5133, 5685]
cipher.decrypt(c4)
=> 245

# 暗号文のand計算
c5 = cipher.c_and(c1, c2)
=> [299684, 652680, 5089630, 25724608, 34460832, 9315761, 4575690, 8208319]
cipher.decrypt(c5)
=> 0

# 暗号文のxor計算
c6 = cipher.c_xor(c1, c2)
=> [1281, 1974, 4739, 10241, 11782, 6462, 4747, 6224]
cipher.decrypt(c6)
=> 15


cipher.decrypt(c1)
=> 10
cipher.decrypt(c2)
=> 5

```
