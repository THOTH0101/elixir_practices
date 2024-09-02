fizzBuzz = fn
(0,0,_c) -> "FizzBuzz"
(0,_b,_c) -> "Fizz"
(_a,0,_c) -> "Buzz"
(_a,_b,c) -> c
end

fb_test = fn
(n) -> fizzBuzz.(rem(n,3), rem(n,5), n)
end

IO.puts fb_test.(10)
IO.puts fb_test.(11)
IO.puts fb_test.(12)
IO.puts fb_test.(13)
IO.puts fb_test.(14)
IO.puts fb_test.(15)
IO.puts fb_test.(16)
