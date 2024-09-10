structure RT_Real = RT_Real;

structure RT_x_1 =
    struct
        type t = RT_Real.t * RT_Real.t;
        
        fun equ (x:t, y:t) = RT_Real.equ(#1 x, #1 y) andalso 
                             RT_Real.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_Real.toString(#1 x )) ^ "," ^
                             (RT_Real.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_Real.typeToString ()) ^ " >< " ^
                              (RT_Real.typeToString ()) ^
                              ")";
    end;
    
structure RT_x_2 =
    struct
        type t = RT_x_1.t * RT_x_1.t;
        
        fun equ (x:t, y:t) = RT_x_1.equ(#1 x, #1 y) andalso 
                             RT_x_1.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_x_1.toString(#1 x )) ^ "," ^
                             (RT_x_1.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_x_1.typeToString ()) ^ " >< " ^
                              (RT_x_1.typeToString ()) ^
                              ")";
    end;
    
structure SYSTEM_OF_COORDINATES =
    struct
        type Position_ = RT_x_1.t;
        
        fun distance'2C3_ ((x1'331_, y1'334_), (x2'339_, y2'33C_)) = (R_coverage.cancel(RT_Text.fromLit "SYSTEM_OF_COORDINATES.rsl", (9, 9)); RT_Real.R_exp ((RT_Real.R_add (RT_Real.R_exp ((RT_Real.R_sub (x2'339_, x1'331_)), RT_Real.fromLit "2.0"), RT_Real.R_exp ((RT_Real.R_sub (y2'33C_, y1'334_)), RT_Real.fromLit "2.0"))), RT_Real.fromLit "0.5"));
        
        val origin'25F_ = (RT_Real.fromLit "0.0", RT_Real.fromLit "0.0");
        
    end;
    
open SYSTEM_OF_COORDINATES;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "SYSTEM_OF_COORDINATES.rsl", (9, 9), (10, 5)));
RSL.print_error_count();
R_coverage.save_marked();
