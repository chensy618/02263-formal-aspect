structure RT_Int = RT_Int;

structure RT_x_1 =
    struct
        type t = RT_Int.t * RT_Int.t;
        
        fun equ (x:t, y:t) = RT_Int.equ(#1 x, #1 y) andalso 
                             RT_Int.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_Int.toString(#1 x )) ^ "," ^
                             (RT_Int.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_Int.typeToString ()) ^ " >< " ^
                              (RT_Int.typeToString ()) ^
                              ")";
    end;
    
structure RT_Bool = RT_Bool;

structure FUNCTIONS_EX =
    struct
        type number_ = RT_Int.t;
        
        ;
        
        fun max'265_ (n1'2CD_, n2'2D0_) = (R_coverage.cancel(RT_Text.fromLit "./FUNCTIONS_EX.rsl", (7, 27)); if RT_Int.R_gt (n1'2CD_, n2'2D0_) then (R_coverage.cancel(RT_Text.fromLit "./FUNCTIONS_EX.rsl", (7, 43)); n1'2CD_) else (R_coverage.cancel(RT_Text.fromLit "./FUNCTIONS_EX.rsl", (7, 51)); n2'2D0_));
        
        ;
        
    end;
    
open FUNCTIONS_EX;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./FUNCTIONS_EX.rsl", (7, 51), (7, 54));
R_coverage.mark(RT_Text.fromLit "./FUNCTIONS_EX.rsl", (7, 43), (7, 49));
R_coverage.mark(RT_Text.fromLit "./FUNCTIONS_EX.rsl", (7, 27), (7, 57)));
RSL.print_error_count();
R_coverage.save_marked();
