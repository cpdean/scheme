%token LEFT_PAREN
%token RIGHT_PAREN
%token A_VALUE
%token EOF

%start <Kaleidoscope.value option> prog

%%
(* part 1 *)
prog:
  | v = value { Some v }
  | EOF       { None   } ;

value:
    | A_VALUE { `Avalue }
    | LEFT_PAREN; vl = list_fields; RIGHT_PAREN { `Expression vl    } ;


list_fields:
    | vl = list(value) { vl } ;
