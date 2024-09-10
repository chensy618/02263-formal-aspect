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
    
structure COMPLEX_EX =
    struct
        type Complex_ = RT_x_1.t;
        
        fun f'521_ (fc'588_, fd'58B_) = (R_coverage.cancel(RT_Text.fromLit "./COMPLEX_eX.rsl", (14, 27)); (RT_Real.R_add (fc'588_, RT_Real.fromLit "1.0"), RT_Real.R_add (fd'58B_, RT_Real.fromLit "1.0")));
        
        val zero'265_ = (RT_Real.fromLit "0.0", RT_Real.fromLit "0.0");
        
        fun multi'459_ ((a'4C4_, b'4C6_), (c'4CA_, d'4CC_)) = (R_coverage.cancel(RT_Text.fromLit "./COMPLEX_eX.rsl", (12, 35)); (RT_Real.R_sub (RT_Real.R_mul (a'4C4_, c'4CA_), RT_Real.R_mul (b'4C6_, d'4CC_)), RT_Real.R_add (RT_Real.R_mul (a'4C4_, d'4CC_), RT_Real.R_mul (b'4C6_, c'4CA_))));
        
        ;
        
        fun add'391_ ((a'3FA_, b'3FC_), (c'400_, d'402_)) = (R_coverage.cancel(RT_Text.fromLit "./COMPLEX_eX.rsl", (10, 33)); (RT_Real.R_add (a'3FA_, c'400_), RT_Real.R_add (b'3FC_, d'402_)));
        
    end;
    
open COMPLEX_EX;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./COMPLEX_eX.rsl", (10, 33), (10, 42));
R_coverage.mark(RT_Text.fromLit "./COMPLEX_eX.rsl", (12, 35), (12, 52));
R_coverage.mark(RT_Text.fromLit "./COMPLEX_eX.rsl", (14, 27), (15, 3)));
RSL.print_error_count();
R_coverage.save_marked();
