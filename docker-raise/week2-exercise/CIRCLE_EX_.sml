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
    
structure RT_Bool = RT_Bool;

structure RT_x_3 =
    struct
        type t = RT_Real.t * RT_x_1.t;
        
        fun equ (x:t, y:t) = RT_Real.equ(#1 x, #1 y) andalso 
                             RT_x_1.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_Real.toString(#1 x )) ^ "," ^
                             (RT_x_1.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_Real.typeToString ()) ^ " >< " ^
                              (RT_x_1.typeToString ()) ^
                              ")";
    end;
    
structure RT_x_4 =
    struct
        type t = RT_x_3.t * RT_x_1.t;
        
        fun equ (x:t, y:t) = RT_x_3.equ(#1 x, #1 y) andalso 
                             RT_x_1.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_x_3.toString(#1 x )) ^ "," ^
                             (RT_x_1.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_x_3.typeToString ()) ^ " >< " ^
                              (RT_x_1.typeToString ()) ^
                              ")";
    end;
    
structure CIRCLE_EX =
    struct
        type Position_ = RT_x_1.t;
        
        fun distance'89F_ ((x1'90D_, y1'910_), (x2'915_, y2'918_)) = (R_coverage.cancel(RT_Text.fromLit "./SYSTEM_OF_COORDINATES.rsl", (9, 9)); RT_Real.R_exp ((RT_Real.R_add (RT_Real.R_exp ((RT_Real.R_sub (x2'915_, x1'90D_)), RT_Real.fromLit "2.0"), RT_Real.R_exp ((RT_Real.R_sub (y2'918_, y1'910_)), RT_Real.fromLit "2.0"))), RT_Real.fromLit "0.5"));
        
        val origin'83B_ = (RT_Real.fromLit "0.0", RT_Real.fromLit "0.0");
        
        type Radius_ = RT_Real.t;
        
        type Circle_ = RT_x_3.t;
        
        ;
        
        fun RSL_is_Radius'26D_ r'26F_ = (RT_Real.R_ge (r'26F_, RT_Real.fromLit "0.0"));
        
        val circle'459_ = let val z__'469_ = (RT_Real.fromLit "3.0", origin'83B_) in if not(let
            val (x3_'0_, x4_'0_) = ((z__'469_):RT_x_3.t)
        in
            ((RSL_is_Radius'26D_) (x3_'0_))
        end) then (RSL.add_load_err("./CIRCLE_EX.rsl:11:29: Value " ^ RT_x_3.toString(z__'469_) ^ " of circle not in subtype"); z__'469_) else z__'469_ end;
        
        fun on_circle'391_ ((r'400_, p'402_), pos'405_) = (R_coverage.cancel(RT_Text.fromLit "./CIRCLE_EX.rsl", (10, 37)); if not(((RSL_is_Radius'26D_) (r'400_))) then raise RSL.RSL_exception ("./CIRCLE_EX.rsl:9:13: Argument of on_circle" ^ RT_x_4.toString ((r'400_, p'402_), pos'405_) ^ " not in subtype") else RT_Real.equ (((distance'89F_) (p'402_, pos'405_)), r'400_));
        
    end;
    
open CIRCLE_EX;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./CIRCLE_EX.rsl", (10, 37), (10, 56));
R_coverage.mark(RT_Text.fromLit "./SYSTEM_OF_COORDINATES.rsl", (9, 9), (10, 5)));
RSL.print_error_count();
R_coverage.save_marked();
