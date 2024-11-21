structure RT_Nat = RT_Nat;

structure RT_Bool = RT_Bool;

structure RT_x_1 =
    struct
        type t = RT_Nat.t * RT_Nat.t;
        
        fun equ (x:t, y:t) = RT_Nat.equ(#1 x, #1 y) andalso 
                             RT_Nat.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_Nat.toString(#1 x )) ^ "," ^
                             (RT_Nat.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_Nat.typeToString ()) ^ " >< " ^
                              (RT_Nat.typeToString ()) ^
                              ")";
    end;
    
structure RT_u_Position'__2 =
    struct
        datatype t = single_ of RT_Nat.t
                   | double_ of RT_x_1.t;
                   
        fun snr_ (single_ x) = let val (i) = x in i end
          | snr_ (_) = raise RSL.RSL_exception "./RAILWAY.rsl:8:18: Destructor snr applied to wrong variant";
        fun snr1_ (double_ x) = let val (i,_) = x in i end
          | snr1_ (_) = raise RSL.RSL_exception "./RAILWAY.rsl:8:44: Destructor snr1 applied to wrong variant";
        fun snr2_ (double_ x) = let val (_,i) = x in i end
          | snr2_ (_) = raise RSL.RSL_exception "./RAILWAY.rsl:8:62: Destructor snr2 applied to wrong variant";
        
        fun equ (single_ x, single_ y) = RT_Nat.equ (x, y)
          | equ (double_ x, double_ y) = RT_x_1.equ (x, y)
          | equ (_, _) = false;
        
        fun toString  (single_ x) = "single(" ^ (RT_Nat.toString (x) ^ ")")
          | toString  (double_ x) = "double" ^ (RT_x_1.toString (x));
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "Position'";
    end;
    
structure RT_u_Direction__3 =
    struct
        datatype t = increasing_
                   | decreasing_;
                   
        
        fun equ (increasing_, increasing_) = true
          | equ (decreasing_, decreasing_) = true
          | equ (_, _) = false;
        
        fun toString  (increasing_) = "increasing"
          | toString  (decreasing_) = "decreasing";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "Direction";
    end;
    
structure RT_s_6 = RT_Set(structure Elem = RT_Nat);

structure RAILWAY =
    struct
        type TrainId_ = .t;
        
        type SectionNr_ = RT_Nat.t;
        
        type Position'_ = RT_u_Position'__2.t;
        
        type Position_ = RT_u_Position'__2.t;
        
        type Direction_ = RT_u_Direction__3.t;
        
        type State_ = .t;
        
        fun sections'B5D_ (Rslsigma'BCA_, t'BD2_) = (R_coverage.cancel(RT_Text.fromLit "./RAILWAY.rsl", (31, 11)); (case ((((position'7D9_) (Rslsigma'BCA_, t'BD2_))):RT_u_Position'__2.t) of RT_u_Position'__2.single_(s'C4A_) => (R_coverage.cancel(RT_Text.fromLit "./RAILWAY.rsl", (31, 52)); RT_s_6.R_fromList ([s'C4A_])) | RT_u_Position'__2.double_(s1'C5C_, s2'C60_) => (R_coverage.cancel(RT_Text.fromLit "./RAILWAY.rsl", (31, 75)); RT_s_6.R_fromList ([s1'C5C_, s2'C60_]))));
        
        fun safe'9CD_ Rslsigma'A36_ = (R_coverage.cancel(RT_Text.fromLit "./RAILWAY.rsl", (27, 11)); ());
        
        fun safe_move'1E1D_ (Rslsigma'1E8B_, t'1E93_) = (R_coverage.cancel(RT_Text.fromLit "./RAILWAY.rsl", (79, 11)); if not(((safe'9CD_) (Rslsigma'1E8B_))) then raise RSL.RSL_exception ("./RAILWAY.rsl:80:15: Precondition of safe_move" ^ .toString (Rslsigma'1E8B_, t'1E93_) ^ " not satisfied") else if ((safe'9CD_) (((move'DB5_) (Rslsigma'1E8B_, t'1E93_)))) then (R_coverage.cancel(RT_Text.fromLit "./RAILWAY.rsl", (79, 41)); ((move'DB5_) (Rslsigma'1E8B_, t'1E93_))) else (R_coverage.cancel(RT_Text.fromLit "./RAILWAY.rsl", (79, 62)); Rslsigma'1E8B_));
        
        fun RSL_is_SectionNr'26D_ n'270_ = ((RT_Nat.R_ge (n'270_, RT_Int.fromLit "0")) andalso (RT_Nat.R_le (n'270_, max'581_)));
        
        ;
        
        fun RSL_is_Position'3F3_ p'3F6_ = ((case ((p'3F6_):RT_u_Position'__2.t) of RT_u_Position'__2.double_(s1'418_, s2'41C_) => (R_coverage.cancel(RT_Text.fromLit "./RAILWAY.rsl", (10, 59)); RT_Nat.equ (s2'41C_, RT_Nat.R_add (s1'418_, RT_Int.fromLit "1"))) | _ => (R_coverage.cancel(RT_Text.fromLit "./RAILWAY.rsl", (10, 77)); true)));
        
        ;
        
        ;
        
        ;
        
        ;
        
    end;
    
open RAILWAY;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./RAILWAY.rsl", (10, 77), (10, 84));
R_coverage.mark(RT_Text.fromLit "./RAILWAY.rsl", (10, 59), (10, 70));
R_coverage.mark(RT_Text.fromLit "./RAILWAY.rsl", (79, 62), (79, 69));
R_coverage.mark(RT_Text.fromLit "./RAILWAY.rsl", (79, 41), (79, 60));
R_coverage.mark(RT_Text.fromLit "./RAILWAY.rsl", (79, 11), (81, 7));
R_coverage.mark(RT_Text.fromLit "./RAILWAY.rsl", (27, 11), (28, 1));
R_coverage.mark(RT_Text.fromLit "./RAILWAY.rsl", (31, 75), (31, 86));
R_coverage.mark(RT_Text.fromLit "./RAILWAY.rsl", (31, 52), (31, 55));
R_coverage.mark(RT_Text.fromLit "./RAILWAY.rsl", (31, 11), (33, 11)));
RSL.print_error_count();
R_coverage.save_marked();
