module Fun

open FStar.Mul

let foo x y = (let z = y + 1 in z - y)

let rec factorial n = 
  if n = 0 then 1 else n * (factorial (n - 1))

(* type list = | Nil  : list *)
(*             | Cons : int -> list -> list *)

let rec map f x = match x with
                  | Nil        -> Nil
                  | Cons hd tl -> Cons (f hd) (map f tl)

let xs = map (fun x -> x + 42) (Cons 1 (Cons 2 (Cons 3 Nil)))

open FStar.List.Tot

let incr x = x + 1

let bar xs = fold_right (+) (map incr xs) 0

val foreach: list 'a -> ('a -> unit) -> unit
let rec foreach x f = match x with
  | [] -> ()
  | a::tl -> f a; foreach tl f

let bar' =
let sum = alloc 0 in
foreach xs (fun x ->
  sum := !sum + 1
)

open FStar.IO

let main = print_string "Hello F*"

