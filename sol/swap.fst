module Swap

open FStar.IO

val swap : #a:Type -> r1:ref a -> r2:ref a -> St unit
let swap (#a:Type) r1 r2 =
  let tmp = !r1 in
  r1 := !r2;
  r2 := tmp

let main =
  let r1 = alloc 1 in
  let r2 = alloc 2 in
  swap r1 r2;
  print_string ("r1=" ^ string_of_int !r1 ^ "; " ^
                "r2=" ^ string_of_int !r2 ^ "\n")
