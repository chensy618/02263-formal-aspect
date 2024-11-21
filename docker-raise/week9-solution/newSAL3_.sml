structure RT_Int = RT_Int;

structure RT_Bool = RT_Bool;

structure RT_u_InfixOp__2 =
    struct
        datatype t = plus_
                   | minus_
                   | int_eq_
                   | and_
                   | or_
                   | bool_eq_;
                   
        
        fun equ (plus_, plus_) = true
          | equ (minus_, minus_) = true
          | equ (int_eq_, int_eq_) = true
          | equ (and_, and_) = true
          | equ (or_, or_) = true
          | equ (bool_eq_, bool_eq_) = true
          | equ (_, _) = false;
        
        fun toString  (plus_) = "plus"
          | toString  (minus_) = "minus"
          | toString  (int_eq_) = "int_eq"
          | toString  (and_) = "and"
          | toString  (or_) = "or"
          | toString  (bool_eq_) = "bool_eq";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "InfixOp";
    end;
    
structure RT_u_PrefixOp__4 =
    struct
        datatype t = minus_
                   | not_;
                   
        
        fun equ (minus_, minus_) = true
          | equ (not_, not_) = true
          | equ (_, _) = false;
        
        fun toString  (minus_) = "minus"
          | toString  (not_) = "not";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "PrefixOp";
    end;
    
structure RT_Text = RT_Text;

structure RT_u_Tp__7 =
    struct
        datatype t = integer_
                   | boolean_;
                   
        
        fun equ (integer_, integer_) = true
          | equ (boolean_, boolean_) = true
          | equ (_, _) = false;
        
        fun toString  (integer_) = "integer"
          | toString  (boolean_) = "boolean";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "Tp";
    end;
    
structure RT_m_8 = RT_Map(structure DomainElem = RT_Text structure RangeElem = RT_u_Tp__7);

structure RT_x_9 =
    struct
        type t = RT_u_Tp__7.t * RT_u_Tp__7.t;
        
        fun equ (x:t, y:t) = RT_u_Tp__7.equ(#1 x, #1 y) andalso 
                             RT_u_Tp__7.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_u_Tp__7.toString(#1 x )) ^ "," ^
                             (RT_u_Tp__7.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_u_Tp__7.typeToString ()) ^ " >< " ^
                              (RT_u_Tp__7.typeToString ()) ^
                              ")";
    end;
    
structure RT_s_10 = RT_Set(structure Elem = RT_Text);

structure RT_u_Val__11 =
    struct
        datatype t = mk_Int_ of RT_Int.t
                   | mk_Bool_ of RT_Bool.t;
                   
        fun intg_ (mk_Int_ x) = let val (i) = x in i end
          | intg_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:77:23: Destructor intg applied to wrong variant";
        fun bool_ (mk_Bool_ x) = let val (i) = x in i end
          | bool_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:77:45: Destructor bool applied to wrong variant";
        
        fun equ (mk_Int_ x, mk_Int_ y) = RT_Int.equ (x, y)
          | equ (mk_Bool_ x, mk_Bool_ y) = RT_Bool.equ (x, y)
          | equ (_, _) = false;
        
        fun toString  (mk_Int_ x) = "mk_Int(" ^ (RT_Int.toString (x) ^ ")")
          | toString  (mk_Bool_ x) = "mk_Bool(" ^ (RT_Bool.toString (x) ^ ")");
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "Val";
    end;
    
structure RT_m_12 = RT_Map(structure DomainElem = RT_Text structure RangeElem = RT_u_Val__11);

structure RT_x_13 =
    struct
        type t = RT_u_Val__11.t * RT_u_Val__11.t;
        
        fun equ (x:t, y:t) = RT_u_Val__11.equ(#1 x, #1 y) andalso 
                             RT_u_Val__11.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_u_Val__11.toString(#1 x )) ^ "," ^
                             (RT_u_Val__11.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_u_Val__11.typeToString ()) ^ " >< " ^
                              (RT_u_Val__11.typeToString ()) ^
                              ")";
    end;
    
structure RT_u_Expr__1 =
    struct
        datatype t = mk_IntConst_ of RT_Int.t
                   | mk_BoolConst_ of RT_Bool.t
                   | mk_InfixExpr_ of (t * RT_u_InfixOp__2.t * t)
                   | mk_PrefixExpr_ of (RT_u_PrefixOp__4.t * t)
                   | mk_Id_ of RT_Text.t
                   | mk_Let_ of (RT_Text.t * t * t);
                   
        fun i_ (mk_IntConst_ x) = let val (i) = x in i end
          | i_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:8:23: Destructor i applied to wrong variant";
        fun b_ (mk_BoolConst_ x) = let val (i) = x in i end
          | b_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:9:24: Destructor b applied to wrong variant";
        fun l_ (mk_InfixExpr_ x) = let val (i,_,_) = x in i end
          | l_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:10:24: Destructor l applied to wrong variant";
        fun infixop_ (mk_InfixExpr_ x) = let val (_,i,_) = x in i end
          | infixop_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:10:35: Destructor infixop applied to wrong variant";
        fun r_ (mk_InfixExpr_ x) = let val (_,_,i) = x in i end
          | r_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:10:55: Destructor r applied to wrong variant";
        fun prefixop_ (mk_PrefixExpr_ x) = let val (i,_) = x in i end
          | prefixop_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:11:25: Destructor prefixop applied to wrong variant";
        fun ex_ (mk_PrefixExpr_ x) = let val (_,i) = x in i end
          | ex_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:11:47: Destructor ex applied to wrong variant";
        fun ide_ (mk_Id_ x) = let val (i) = x in i end
          | ide_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:12:17: Destructor ide applied to wrong variant";
        fun lid_ (mk_Let_ x) = let val (i,_,_) = x in i end
          | lid_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:13:18: Destructor lid applied to wrong variant";
        fun fst_ (mk_Let_ x) = let val (_,i,_) = x in i end
          | fst_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:13:37: Destructor fst applied to wrong variant";
        fun snd_ (mk_Let_ x) = let val (_,_,i) = x in i end
          | snd_ (_) = raise RSL.RSL_exception "./newSAL3.rsl:13:50: Destructor snd applied to wrong variant";
        
        fun equ (mk_IntConst_ x, mk_IntConst_ y) = RT_Int.equ (x, y)
          | equ (mk_BoolConst_ x, mk_BoolConst_ y) = RT_Bool.equ (x, y)
          | equ (mk_InfixExpr_ x, mk_InfixExpr_ y) = (equ (#1(x), #1(y)) andalso 
                                                      RT_u_InfixOp__2.equ (#2(x), #2(y)) andalso 
                                                      equ (#3(x), #3(y)))
          | equ (mk_PrefixExpr_ x, mk_PrefixExpr_ y) = (RT_u_PrefixOp__4.equ (#1(x), #1(y)) andalso 
                                                        equ (#2(x), #2(y)))
          | equ (mk_Id_ x, mk_Id_ y) = RT_Text.equ (x, y)
          | equ (mk_Let_ x, mk_Let_ y) = (RT_Text.equ (#1(x), #1(y)) andalso 
                                          equ (#2(x), #2(y)) andalso 
                                          equ (#3(x), #3(y)))
          | equ (_, _) = false;
        
        fun toString  (mk_IntConst_ x) = "mk_IntConst(" ^ (RT_Int.toString (x) ^ ")")
          | toString  (mk_BoolConst_ x) = "mk_BoolConst(" ^ (RT_Bool.toString (x) ^ ")")
          | toString  (mk_InfixExpr_ x) = "mk_InfixExpr" ^ ("(" ^ ((toString (#1(x))) ^ "," ^ 
                                                                   (RT_u_InfixOp__2.toString (#2(x))) ^ "," ^ 
                                                                   (toString (#3(x)))) ^ ")")
          | toString  (mk_PrefixExpr_ x) = "mk_PrefixExpr" ^ ("(" ^ ((RT_u_PrefixOp__4.toString (#1(x))) ^ "," ^ 
                                                                     (toString (#2(x)))) ^ ")")
          | toString  (mk_Id_ x) = "mk_Id(" ^ (RT_Text.toString (x) ^ ")")
          | toString  (mk_Let_ x) = "mk_Let" ^ ("(" ^ ((RT_Text.toString (#1(x))) ^ "," ^ 
                                                       (toString (#2(x))) ^ "," ^ 
                                                       (toString (#3(x)))) ^ ")");
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "Expr";
    end;
    
structure RT_x_3 =
    struct
        type t = RT_u_Expr__1.t * RT_u_InfixOp__2.t * RT_u_Expr__1.t;
        
        fun equ (x:t, y:t) = RT_u_Expr__1.equ(#1 x, #1 y) andalso 
                             RT_u_InfixOp__2.equ(#2 x, #2 y) andalso 
                             RT_u_Expr__1.equ(#3 x, #3 y);
        
        fun toString (x:t) = "(" ^
                             (RT_u_Expr__1.toString(#1 x )) ^ "," ^
                             (RT_u_InfixOp__2.toString(#2 x )) ^ "," ^
                             (RT_u_Expr__1.toString(#3 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_u_Expr__1.typeToString ()) ^ " >< " ^
                              (RT_u_InfixOp__2.typeToString ()) ^ " >< " ^
                              (RT_u_Expr__1.typeToString ()) ^
                              ")";
    end;
    
structure RT_x_5 =
    struct
        type t = RT_u_PrefixOp__4.t * RT_u_Expr__1.t;
        
        fun equ (x:t, y:t) = RT_u_PrefixOp__4.equ(#1 x, #1 y) andalso 
                             RT_u_Expr__1.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_u_PrefixOp__4.toString(#1 x )) ^ "," ^
                             (RT_u_Expr__1.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_u_PrefixOp__4.typeToString ()) ^ " >< " ^
                              (RT_u_Expr__1.typeToString ()) ^
                              ")";
    end;
    
structure RT_x_6 =
    struct
        type t = RT_Text.t * RT_u_Expr__1.t * RT_u_Expr__1.t;
        
        fun equ (x:t, y:t) = RT_Text.equ(#1 x, #1 y) andalso 
                             RT_u_Expr__1.equ(#2 x, #2 y) andalso 
                             RT_u_Expr__1.equ(#3 x, #3 y);
        
        fun toString (x:t) = "(" ^
                             (RT_Text.toString(#1 x )) ^ "," ^
                             (RT_u_Expr__1.toString(#2 x )) ^ "," ^
                             (RT_u_Expr__1.toString(#3 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_Text.typeToString ()) ^ " >< " ^
                              (RT_u_Expr__1.typeToString ()) ^ " >< " ^
                              (RT_u_Expr__1.typeToString ()) ^
                              ")";
    end;
    
structure newSAL3 =
    struct
        type Expr_ = RT_u_Expr__1.t;
        
        type InfixOp_ = RT_u_InfixOp__2.t;
        
        type PrefixOp_ = RT_u_PrefixOp__4.t;
        
        type Identifier_ = RT_Text.t;
        
        type Tp_ = RT_u_Tp__7.t;
        
        type TpDict_ = RT_m_8.t;
        
        type Env_ = RT_m_12.t;
        
        type Val_ = RT_u_Val__11.t;
        
        fun type_of_val'34C5_ c'3535_ = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (137, 11)); (case ((c'3535_):RT_u_Val__11.t) of RT_u_Val__11.mk_Int_(_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (137, 34)); RT_u_Tp__7.integer_) | _ => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (137, 48)); RT_u_Tp__7.boolean_)));
        
        fun is_wff'1201_ e'126C_ td'126F_ = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (48, 11)); (case ((e'126C_):RT_u_Expr__1.t) of RT_u_Expr__1.mk_IntConst_(_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (49, 31)); true) | RT_u_Expr__1.mk_BoolConst_(_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (50, 32)); true) | RT_u_Expr__1.mk_InfixExpr_(e1'1406_, op'140A_, e2'140E_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (52, 15)); (((((is_wff'1201_) (e1'1406_))) (td'126F_))) andalso (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (53, 15)); (((((is_wff'1201_) (e2'140E_))) (td'126F_))) andalso (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (54, 15)); let
            val t1'152B_ = ((((((type_of'969_) (e1'1406_))) (td'126F_))):RT_u_Tp__7.t); 
            val t2'1541_ = ((((((type_of'969_) (e2'140E_))) (td'126F_))):RT_u_Tp__7.t)
        in
            (if RT_u_InfixOp__2.equ (((op'140A_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.plus_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (56, 27)); RT_x_9.equ ((t1'152B_, t2'1541_), (RT_u_Tp__7.integer_, RT_u_Tp__7.integer_))) else if RT_u_InfixOp__2.equ (((op'140A_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.minus_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (57, 28)); RT_x_9.equ ((t1'152B_, t2'1541_), (RT_u_Tp__7.integer_, RT_u_Tp__7.integer_))) else if RT_u_InfixOp__2.equ (((op'140A_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.int_eq_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (58, 29)); RT_x_9.equ ((t1'152B_, t2'1541_), (RT_u_Tp__7.integer_, RT_u_Tp__7.integer_))) else if RT_u_InfixOp__2.equ (((op'140A_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.and_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (59, 26)); RT_x_9.equ ((t1'152B_, t2'1541_), (RT_u_Tp__7.boolean_, RT_u_Tp__7.boolean_))) else if RT_u_InfixOp__2.equ (((op'140A_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.or_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (60, 25)); RT_x_9.equ ((t1'152B_, t2'1541_), (RT_u_Tp__7.boolean_, RT_u_Tp__7.boolean_))) else if RT_u_InfixOp__2.equ (((op'140A_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.bool_eq_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (61, 30)); RT_x_9.equ ((t1'152B_, t2'1541_), (RT_u_Tp__7.boolean_, RT_u_Tp__7.boolean_))) else raise RSL.swap ("./newSAL3.rsl:55:22: Case incomplete for value " ^ RT_u_InfixOp__2.toString(((op'140A_):RT_u_InfixOp__2.t))))
        end))) | RT_u_Expr__1.mk_PrefixExpr_(op'191B_, e1'191F_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (65, 15)); (((((is_wff'1201_) (e1'191F_))) (td'126F_))) andalso (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (66, 15)); let
            val t'19DB_ = ((((((type_of'969_) (e1'191F_))) (td'126F_))):RT_u_Tp__7.t)
        in
            (if RT_u_PrefixOp__4.equ (((op'191B_):RT_u_PrefixOp__4.t), RT_u_PrefixOp__4.minus_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (67, 37)); RT_u_Tp__7.equ (t'19DB_, RT_u_Tp__7.integer_)) else if RT_u_PrefixOp__4.equ (((op'191B_):RT_u_PrefixOp__4.t), RT_u_PrefixOp__4.not_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (67, 57)); RT_u_Tp__7.equ (t'19DB_, RT_u_Tp__7.boolean_)) else raise RSL.swap ("./newSAL3.rsl:67:22: Case incomplete for value " ^ RT_u_PrefixOp__4.toString(((op'191B_):RT_u_PrefixOp__4.t))))
        end)) | RT_u_Expr__1.mk_Id_(id'1B07_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (69, 26)); RT_m_8.R_mem (id'1B07_, td'126F_)) | RT_u_Expr__1.mk_Let_(id'1B6C_, e1'1B70_, e2'1B74_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (71, 15)); (((((is_wff'1201_) (e1'1B70_))) (td'126F_))) andalso (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (71, 33)); ((((is_wff'1201_) (e2'1B74_))) (RT_m_8.R_override (td'126F_, RT_m_8.R_fromList ([(id'1B6C_, ((((type_of'969_) (e1'1B70_))) (td'126F_)))]))))))))
        and type_of'969_ e'9D5_ td'9D8_ = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (26, 11)); if not(((((is_wff'1201_) (e'9D5_))) (td'9D8_))) then raise RSL.RSL_exception ("./newSAL3.rsl:44:15: Precondition of type_of" ^ "(" ^ RT_u_Expr__1.toString e'9D5_ ^ ")" ^ "(" ^ RT_m_8.toString td'9D8_ ^ ")" ^ " not satisfied") else (case ((e'9D5_):RT_u_Expr__1.t) of RT_u_Expr__1.mk_IntConst_(_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (27, 31)); RT_u_Tp__7.integer_) | RT_u_Expr__1.mk_BoolConst_(_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (28, 32)); RT_u_Tp__7.boolean_) | RT_u_Expr__1.mk_InfixExpr_(_, op'B71_, _) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (30, 15)); (if RT_u_InfixOp__2.equ (((op'B71_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.plus_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (31, 25)); RT_u_Tp__7.integer_) else if RT_u_InfixOp__2.equ (((op'B71_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.minus_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (32, 26)); RT_u_Tp__7.integer_) else if RT_u_InfixOp__2.equ (((op'B71_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.int_eq_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (33, 27)); RT_u_Tp__7.boolean_) else if RT_u_InfixOp__2.equ (((op'B71_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.and_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (34, 24)); RT_u_Tp__7.boolean_) else if RT_u_InfixOp__2.equ (((op'B71_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.or_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (35, 23)); RT_u_Tp__7.boolean_) else if RT_u_InfixOp__2.equ (((op'B71_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.bool_eq_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (36, 28)); RT_u_Tp__7.boolean_) else raise RSL.swap ("./newSAL3.rsl:30:20: Case incomplete for value " ^ RT_u_InfixOp__2.toString(((op'B71_):RT_u_InfixOp__2.t))))) | RT_u_Expr__1.mk_PrefixExpr_(op'EF3_, _) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (39, 15)); (if RT_u_PrefixOp__4.equ (((op'EF3_):RT_u_PrefixOp__4.t), RT_u_PrefixOp__4.minus_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (39, 35)); RT_u_Tp__7.integer_) else if RT_u_PrefixOp__4.equ (((op'EF3_):RT_u_PrefixOp__4.t), RT_u_PrefixOp__4.not_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (39, 51)); RT_u_Tp__7.boolean_) else raise RSL.swap ("./newSAL3.rsl:39:20: Case incomplete for value " ^ RT_u_PrefixOp__4.toString(((op'EF3_):RT_u_PrefixOp__4.t))))) | RT_u_Expr__1.mk_Id_(id'FB3_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (40, 26)); ((RT_m_8.R_app(td'9D8_)) (id'FB3_))) | RT_u_Expr__1.mk_Let_(id'1018_, e1'101C_, e2'1020_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (42, 15)); ((((type_of'969_) (e2'1020_))) (RT_m_8.R_override (td'9D8_, RT_m_8.R_fromList ([(id'1018_, ((((type_of'969_) (e1'101C_))) (td'9D8_)))])))))));
        
        fun not'277D_ v'27E5_ = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (102, 19)); ((RT_u_Val__11.mk_Bool_) (not (((RT_u_Val__11.bool_) (v'27E5_))))));
        
        fun add'1F49_ (v1'1FB1_, v2'1FB5_) = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (81, 24)); ((RT_u_Val__11.mk_Int_) (RT_Int.R_add (((RT_u_Val__11.intg_) (v1'1FB1_)), ((RT_u_Val__11.intg_) (v2'1FB5_))))));
        
        fun minus'2651_ v'26BB_ = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (99, 21)); ((RT_u_Val__11.mk_Int_) (RT_Int.R_sub (RT_Int.fromLit "0", ((RT_u_Val__11.intg_) (v'26BB_))))));
        
        fun sub'2075_ (v1'20DD_, v2'20E1_) = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (84, 24)); ((RT_u_Val__11.mk_Int_) (RT_Int.R_sub (((RT_u_Val__11.intg_) (v1'20DD_)), ((RT_u_Val__11.intg_) (v2'20E1_))))));
        
        fun bool_eq'2525_ (v1'2591_, v2'2595_) = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (96, 28)); ((RT_u_Val__11.mk_Bool_) (RT_Bool.equ (((RT_u_Val__11.bool_) (v1'2591_)), ((RT_u_Val__11.bool_) (v2'2595_))))));
        
        fun int_eq'21A1_ (v1'220C_, v2'2210_) = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (87, 27)); ((RT_u_Val__11.mk_Bool_) (RT_Int.equ (((RT_u_Val__11.intg_) (v1'220C_)), ((RT_u_Val__11.intg_) (v2'2210_))))));
        
        fun or'23F9_ (v1'2460_, v2'2464_) = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (93, 23)); ((RT_u_Val__11.mk_Bool_) ((((RT_u_Val__11.bool_) (v1'2460_))) orelse (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (93, 43)); ((RT_u_Val__11.bool_) (v2'2464_))))));
        
        fun and'22CD_ (v1'2335_, v2'2339_) = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (90, 24)); ((RT_u_Val__11.mk_Bool_) ((((RT_u_Val__11.bool_) (v1'2335_))) andalso (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (90, 44)); ((RT_u_Val__11.bool_) (v2'2339_))))));
        
        fun m'2A9D_ e'2B03_ Rslrho'2B06_ = (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (111, 11)); if not(((((is_wff'1201_) (e'2B03_))) ((RT_m_8.R_compmm (fn (id'3424_:RT_Text.t) => (id'3424_, ((type_of_val'34C5_) (((RT_m_12.R_app(Rslrho'2B06_)) (id'3424_)))))) (fn (id'3424_:RT_Text.t) => true) (Rslrho'2B06_))))) then raise RSL.RSL_exception ("./newSAL3.rsl:131:13: Precondition of m" ^ "(" ^ RT_u_Expr__1.toString e'2B03_ ^ ")" ^ "(" ^ RT_m_12.toString Rslrho'2B06_ ^ ")" ^ " not satisfied") else (case ((e'2B03_):RT_u_Expr__1.t) of RT_u_Expr__1.mk_IntConst_(i'2BD9_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (112, 31)); ((RT_u_Val__11.mk_Int_) (i'2BD9_))) | RT_u_Expr__1.mk_BoolConst_(b'2C3E_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (113, 32)); ((RT_u_Val__11.mk_Bool_) (b'2C3E_))) | RT_u_Expr__1.mk_InfixExpr_(e1'2CA2_, op'2CA6_, e2'2CAA_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (115, 15)); (if RT_u_InfixOp__2.equ (((op'2CA6_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.plus_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (116, 25)); ((add'1F49_) (((((m'2A9D_) (e1'2CA2_))) (Rslrho'2B06_)), ((((m'2A9D_) (e2'2CAA_))) (Rslrho'2B06_))))) else if RT_u_InfixOp__2.equ (((op'2CA6_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.minus_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (117, 26)); ((sub'2075_) (((((m'2A9D_) (e1'2CA2_))) (Rslrho'2B06_)), ((((m'2A9D_) (e2'2CAA_))) (Rslrho'2B06_))))) else if RT_u_InfixOp__2.equ (((op'2CA6_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.int_eq_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (118, 27)); ((int_eq'21A1_) (((((m'2A9D_) (e1'2CA2_))) (Rslrho'2B06_)), ((((m'2A9D_) (e2'2CAA_))) (Rslrho'2B06_))))) else if RT_u_InfixOp__2.equ (((op'2CA6_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.and_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (119, 24)); ((and'22CD_) (((((m'2A9D_) (e1'2CA2_))) (Rslrho'2B06_)), ((((m'2A9D_) (e2'2CAA_))) (Rslrho'2B06_))))) else if RT_u_InfixOp__2.equ (((op'2CA6_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.or_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (120, 23)); ((or'23F9_) (((((m'2A9D_) (e1'2CA2_))) (Rslrho'2B06_)), ((((m'2A9D_) (e2'2CAA_))) (Rslrho'2B06_))))) else if RT_u_InfixOp__2.equ (((op'2CA6_):RT_u_InfixOp__2.t), RT_u_InfixOp__2.bool_eq_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (121, 28)); ((bool_eq'2525_) (((((m'2A9D_) (e1'2CA2_))) (Rslrho'2B06_)), ((((m'2A9D_) (e2'2CAA_))) (Rslrho'2B06_))))) else raise RSL.swap ("./newSAL3.rsl:115:20: Case incomplete for value " ^ RT_u_InfixOp__2.toString(((op'2CA6_):RT_u_InfixOp__2.t))))) | RT_u_Expr__1.mk_PrefixExpr_(op'3027_, e1'302B_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (124, 15)); (if RT_u_PrefixOp__4.equ (((op'3027_):RT_u_PrefixOp__4.t), RT_u_PrefixOp__4.minus_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (125, 26)); ((minus'2651_) (((((m'2A9D_) (e1'302B_))) (Rslrho'2B06_))))) else if RT_u_PrefixOp__4.equ (((op'3027_):RT_u_PrefixOp__4.t), RT_u_PrefixOp__4.not_) then (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (125, 53)); ((not'277D_) (((((m'2A9D_) (e1'302B_))) (Rslrho'2B06_))))) else raise RSL.swap ("./newSAL3.rsl:124:20: Case incomplete for value " ^ RT_u_PrefixOp__4.toString(((op'3027_):RT_u_PrefixOp__4.t))))) | RT_u_Expr__1.mk_Id_(id'31AF_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (127, 26)); ((RT_m_12.R_app(Rslrho'2B06_)) (id'31AF_))) | RT_u_Expr__1.mk_Let_(id'3214_, e1'3218_, e2'321C_) => (R_coverage.cancel(RT_Text.fromLit "./newSAL3.rsl", (128, 35)); ((((m'2A9D_) (e2'321C_))) (RT_m_12.R_override (Rslrho'2B06_, RT_m_12.R_fromList ([(id'3214_, ((((m'2A9D_) (e1'3218_))) (Rslrho'2B06_)))])))))));
        
    end;
    
open newSAL3;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (125, 53), (126, 17));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (125, 26), (125, 44));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (121, 28), (122, 17));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (120, 23), (120, 51));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (119, 24), (119, 53));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (118, 27), (118, 59));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (117, 26), (117, 55));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (116, 25), (116, 54));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (128, 35), (129, 13));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (127, 26), (127, 34));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (124, 15), (126, 18));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (115, 15), (122, 18));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (113, 32), (113, 42));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (112, 31), (112, 40));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (111, 11), (133, 86));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (90, 44), (90, 52));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (90, 24), (90, 53));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (93, 43), (93, 51));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (93, 23), (93, 52));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (87, 27), (87, 55));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (96, 28), (96, 56));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (84, 24), (84, 51));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (99, 21), (99, 40));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (81, 24), (81, 51));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (102, 19), (108, 11));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (39, 51), (39, 61));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (39, 35), (39, 42));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (36, 28), (37, 17));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (35, 23), (35, 30));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (34, 24), (34, 31));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (33, 27), (33, 34));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (32, 26), (32, 33));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (31, 25), (31, 32));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (42, 15), (43, 13));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (40, 26), (40, 32));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (39, 15), (39, 62));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (30, 15), (37, 18));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (28, 32), (28, 39));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (27, 31), (27, 38));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (26, 11), (44, 28));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (71, 33), (72, 13));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (67, 57), (67, 71));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (67, 37), (67, 48));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (66, 15), (68, 18));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (61, 30), (62, 19));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (60, 25), (60, 54));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (59, 26), (59, 55));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (58, 29), (58, 58));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (57, 28), (57, 57));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (56, 27), (56, 56));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (54, 15), (63, 18));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (53, 15), (63, 18));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (71, 15), (72, 13));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (69, 26), (69, 40));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (65, 15), (68, 18));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (52, 15), (63, 18));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (50, 32), (50, 36));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (49, 31), (49, 35));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (48, 11), (75, 10));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (137, 48), (137, 58));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (137, 34), (137, 41));
R_coverage.mark(RT_Text.fromLit "./newSAL3.rsl", (137, 11), (138, 7)));
RSL.print_error_count();
R_coverage.save_marked();
