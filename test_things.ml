open OUnit2;;


(*
  | `Assoc obj  -> print_assoc outc obj
  | `List l     -> print_list outc l
  | `String s   -> printf "\"%s\"" s
  | `Int i      -> printf "%d" i
  | `Float x    -> printf "%f" x
  | `Bool true  -> output_string outc "true"
  | `Bool false -> output_string outc "false"
  | `Null       -> output_string outc "null"
*)

let k_assert_parsed code_str parsed_ast = function test_ctxt ->
        assert_equal
            (Ktest.parse_with_error (Lexing.from_string code_str))
            parsed_ast

(* Name the test cases and group them together *)
let suite =
    "suite">:::
    [
        "empty">:: k_assert_parsed
            "()"
            (Some (`Expression []))
        ;

        "empty with one space">:: k_assert_parsed
            "( )"
            (Some (`Expression []))
        ;

        "single">:: k_assert_parsed
            "(a)"
            (Some (`Expression [`Avalue]))
        ;

        "single with space to right">:: k_assert_parsed
            "(a )"
            (Some (`Expression [`Avalue]))
        ;

        "single with space to left">:: k_assert_parsed
            "( a)"
            (Some (`Expression [`Avalue]))
        ;

        "two">:: k_assert_parsed
            "(a a)"
            (Some (`Expression [`Avalue; `Avalue]))

        ;

        "three">:: k_assert_parsed
            "(a a a)"
            (Some (`Expression [`Avalue; `Avalue; `Avalue]))

        ;
]
;;

let () =
  run_test_tt_main suite
;;
