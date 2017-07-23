module Swap

open FStar.IO

val swap_add_sub : r1:ref int -> r2:ref int -> St unit
let swap_add_sub r1 r2 =
  r1 := !r1 + !r2;
  r2 := !r1 - !r2;
  r1 := !r1 - !r2

let main =
  let r1 = alloc 1 in
  let r2 = alloc 2 in
  swap_add_sub r1 r2;
  print_string ("r1=" ^ string_of_int !r1 ^ "; " ^
                "r2=" ^ string_of_int !r2 ^ "\n")
