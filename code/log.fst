module Log

open FStar.Heap
open FStar.List.Tot

(* global log of integers *)
val log : ref (list int)
let log = alloc []

val add_to_log : e:int -> ST unit
  (requires (fun h0 -> True))
  (ensures (fun h0 _ h1 ->
        mem e (sel h1 log) (* p1: new element added *)
    /\ (forall x. mem x (sel h0 log) ==> mem x (sel h1 log))
                            (* p2: all old elements preserved *)
  ))
let add_to_log e =
  log := (e :: !log)

let main =
  add_to_log 1;
  let log1 = !log in
  assert (mem 1 log1); (* proved by p1 *)
  add_to_log 2;
  let log2 = !log in
  assert (mem 2 log2  (* proved by p1 *)
       /\ mem 1 log2) (* proved by p2! *)
