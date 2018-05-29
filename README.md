# My Cipher
produced by Yoshiura

# algorithm
```math
M \ 0, 1
C 

C = E(M) = M + K * R
M = D(C) = C mod K mod2
```
# Usage

```ruby
cipher =  MyCipher.new(32, secret_key, secret_key)
```
