structure RT_Text = RT_Text;

structure RT_s_1 = RT_Set(structure Elem = RT_Text);

structure RT_x_2 =
    struct
        type t = RT_Text.t * RT_s_1.t;
        
        fun equ (x:t, y:t) = RT_Text.equ(#1 x, #1 y) andalso 
                             RT_s_1.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_Text.toString(#1 x )) ^ "," ^
                             (RT_s_1.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_Text.typeToString ()) ^ " >< " ^
                              (RT_s_1.typeToString ()) ^
                              ")";
    end;
    
structure SET_DATABASE =
    struct
        type Database_ = RT_s_1.t;
        
        type Person_ = RT_Text.t;
        
        fun register'25F_ (p'2CC_, db'2CE_) = (R_coverage.cancel(RT_Text.fromLit "./SET_DATABASE.rsl", (7, 26)); RT_s_1.R_union (db'2CE_, RT_s_1.R_fromList ([p'2CC_])));
        
    end;
    
open SET_DATABASE;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./SET_DATABASE.rsl", (7, 26), (8, 13)));
(RSL.C_output "[t1] " RT_s_1.toStringSafe (fn _ => ((register'25F_) (RT_Text.fromLit "Anne", RT_s_1.R_fromList []))));

RSL.print_error_count();
R_coverage.save_marked();
