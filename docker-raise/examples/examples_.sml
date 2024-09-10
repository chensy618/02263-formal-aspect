structure RT_Nat = RT_Nat;

structure RT_l_1 = RT_List(structure Elem = RT_Nat);

structure RT_Bool = RT_Bool;

structure RT_u_Language__2 =
    struct
        datatype t = korean_
                   | japanese_
                   | danish_
                   | french_;
                   
        
        fun equ (korean_, korean_) = true
          | equ (japanese_, japanese_) = true
          | equ (danish_, danish_) = true
          | equ (french_, french_) = true
          | equ (_, _) = false;
        
        fun toString  (korean_) = "korean"
          | toString  (japanese_) = "japanese"
          | toString  (danish_) = "danish"
          | toString  (french_) = "french";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "Language";
    end;
    
structure RT_Text = RT_Text;

structure RT_x_3 =
    struct
        type t = RT_u_Language__2.t * RT_Text.t;
        
        fun equ (x:t, y:t) = RT_u_Language__2.equ(#1 x, #1 y) andalso 
                             RT_Text.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_u_Language__2.toString(#1 x )) ^ "," ^
                             (RT_Text.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_u_Language__2.typeToString ()) ^ " >< " ^
                              (RT_Text.typeToString ()) ^
                              ")";
    end;
    
structure RT_m_4 = RT_Map(structure DomainElem = RT_x_3 structure RangeElem = RT_Text);

structure RT_Real = RT_Real;

structure RT_x_5 =
    struct
        type t = RT_Text.t * RT_Text.t * RT_Real.t;
        
        fun equ (x:t, y:t) = RT_Text.equ(#1 x, #1 y) andalso 
                             RT_Text.equ(#2 x, #2 y) andalso 
                             RT_Real.equ(#3 x, #3 y);
        
        fun toString (x:t) = "(" ^
                             (RT_Text.toString(#1 x )) ^ "," ^
                             (RT_Text.toString(#2 x )) ^ "," ^
                             (RT_Real.toString(#3 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_Text.typeToString ()) ^ " >< " ^
                              (RT_Text.typeToString ()) ^ " >< " ^
                              (RT_Real.typeToString ()) ^
                              ")";
    end;
    
structure RT_u_City__6 =
    struct
        datatype t = mk_City_ of RT_x_5.t;
        
        fun city_name_ (mk_City_ x) = let val (i,_,_) = x in i end;
        fun city_mayor_ (mk_City_ x) = let val (_,i,_) = x in i end;
        fun new_mayor_ (j, mk_City_ x) = let val (i1,_,i2) = x in mk_City_(i1,j,i2) end;
        fun city_population_ (mk_City_ x) = let val (_,_,i) = x in i end;
        
        fun equ (mk_City_ x, mk_City_ y) = RT_x_5.equ (x, y);
        
        fun toString (mk_City_ x) = "mk_City" ^ (RT_x_5.toString (x));
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "City";
    end;
    
structure RT_u_Tree__7 =
    struct
        datatype t = empty_
                   | node_ of (t * RT_Nat.t * t);
                   
        fun left_ (node_ x) = let val (i,_,_) = x in i end
          | left_ (_) = raise RSL.RSL_exception "./examples.rsl:29:28: Destructor left applied to wrong variant";
        fun elem_ (node_ x) = let val (_,i,_) = x in i end
          | elem_ (_) = raise RSL.RSL_exception "./examples.rsl:29:41: Destructor elem applied to wrong variant";
        fun right_ (node_ x) = let val (_,_,i) = x in i end
          | right_ (_) = raise RSL.RSL_exception "./examples.rsl:29:53: Destructor right applied to wrong variant";
        
        fun equ (empty_, empty_) = true
          | equ (node_ x, node_ y) = (equ (#1(x), #1(y)) andalso 
                                      RT_Nat.equ (#2(x), #2(y)) andalso 
                                      equ (#3(x), #3(y)))
          | equ (_, _) = false;
        
        fun toString  (empty_) = "empty"
          | toString  (node_ x) = "node" ^ ("(" ^ ((toString (#1(x))) ^ "," ^ 
                                                   (RT_Nat.toString (#2(x))) ^ "," ^ 
                                                   (toString (#3(x)))) ^ ")");
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "Tree";
    end;
    
structure RT_x_8 =
    struct
        type t = RT_u_Tree__7.t * RT_Nat.t * RT_u_Tree__7.t;
        
        fun equ (x:t, y:t) = RT_u_Tree__7.equ(#1 x, #1 y) andalso 
                             RT_Nat.equ(#2 x, #2 y) andalso 
                             RT_u_Tree__7.equ(#3 x, #3 y);
        
        fun toString (x:t) = "(" ^
                             (RT_u_Tree__7.toString(#1 x )) ^ "," ^
                             (RT_Nat.toString(#2 x )) ^ "," ^
                             (RT_u_Tree__7.toString(#3 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_u_Tree__7.typeToString ()) ^ " >< " ^
                              (RT_Nat.typeToString ()) ^ " >< " ^
                              (RT_u_Tree__7.typeToString ()) ^
                              ")";
    end;
    
structure RT_s_9 = RT_Set(structure Elem = RT_Nat);

structure RT_Unit = RT_Unit;

structure RT_x_10 =
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
    
structure RT_x_11 =
    struct
        type t = RT_m_4.t * RT_u_Language__2.t * RT_Text.t * RT_Text.t;
        
        fun equ (x:t, y:t) = RT_m_4.equ(#1 x, #1 y) andalso 
                             RT_u_Language__2.equ(#2 x, #2 y) andalso 
                             RT_Text.equ(#3 x, #3 y) andalso 
                             RT_Text.equ(#4 x, #4 y);
        
        fun toString (x:t) = "(" ^
                             (RT_m_4.toString(#1 x )) ^ "," ^
                             (RT_u_Language__2.toString(#2 x )) ^ "," ^
                             (RT_Text.toString(#3 x )) ^ "," ^
                             (RT_Text.toString(#4 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_m_4.typeToString ()) ^ " >< " ^
                              (RT_u_Language__2.typeToString ()) ^ " >< " ^
                              (RT_Text.typeToString ()) ^ " >< " ^
                              (RT_Text.typeToString ()) ^
                              ")";
    end;
    
structure RT_l_12 = RT_List(structure Elem = RT_x_10);

structure RT_x_13 =
    struct
        type t = RT_l_1.t * RT_l_1.t * RT_l_12.t;
        
        fun equ (x:t, y:t) = RT_l_1.equ(#1 x, #1 y) andalso 
                             RT_l_1.equ(#2 x, #2 y) andalso 
                             RT_l_12.equ(#3 x, #3 y);
        
        fun toString (x:t) = "(" ^
                             (RT_l_1.toString(#1 x )) ^ "," ^
                             (RT_l_1.toString(#2 x )) ^ "," ^
                             (RT_l_12.toString(#3 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_l_1.typeToString ()) ^ " >< " ^
                              (RT_l_1.typeToString ()) ^ " >< " ^
                              (RT_l_12.typeToString ()) ^
                              ")";
    end;
    
structure RT_x_14 =
    struct
        type t = RT_l_1.t * RT_l_1.t;
        
        fun equ (x:t, y:t) = RT_l_1.equ(#1 x, #1 y) andalso 
                             RT_l_1.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_l_1.toString(#1 x )) ^ "," ^
                             (RT_l_1.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_l_1.typeToString ()) ^ " >< " ^
                              (RT_l_1.typeToString ()) ^
                              ")";
    end;
    
structure RT_f_15 = RT_Fun(structure Param = RT_Nat val arrow = "->" structure Result = RT_Nat);

structure RT_x_16 =
    struct
        type t = RT_f_15.t * RT_l_1.t;
        
        fun equ (x:t, y:t) = RT_f_15.equ(#1 x, #1 y) andalso 
                             RT_l_1.equ(#2 x, #2 y);
        
        fun toString (x:t) = "(" ^
                             (RT_f_15.toString(#1 x )) ^ "," ^
                             (RT_l_1.toString(#2 x )) ^
                             ")";
        
        fun toStringSafe x = toString(x())
          handle RSL.RSL_exception s => (RSL.inc_exception_count(); s);
        
        fun typeToString () = "(" ^
                              (RT_f_15.typeToString ()) ^ " >< " ^
                              (RT_l_1.typeToString ()) ^
                              ")";
    end;
    
structure RT_f_17 = RT_Fun(structure Param = RT_l_1 val arrow = "-~->" structure Result = RT_Nat);

structure RT_f_18 = RT_Fun(structure Param = RT_l_1 val arrow = "->" structure Result = RT_l_1);

structure RT_s_19 = RT_Set(structure Elem = RT_Text);

structure RT_m_20 = RT_Map(structure DomainElem = RT_Text structure RangeElem = RT_Nat);

structure examples =
    struct
        type PhoneNumber_ = RT_l_1.t;
        
        type Language_ = RT_u_Language__2.t;
        
        type TranslationMap_ = RT_m_4.t;
        
        type City_ = RT_u_City__6.t;
        
        type Tree_ = RT_u_Tree__7.t;
        
        type OrderedTree_ = RT_u_Tree__7.t;
        
        fun extract_elems'69E3_ t'6A55_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (273, 9)); (case ((t'6A55_):RT_u_Tree__7.t) of RT_u_Tree__7.empty_ => (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (274, 20)); RT_s_9.R_fromList []) | RT_u_Tree__7.node_(t1'6B7C_, e'6B80_, t2'6B83_) => (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (276, 13)); RT_s_9.R_union (RT_s_9.R_union (RT_s_9.R_fromList ([e'6B80_]), ((extract_elems'69E3_) (t1'6B7C_))), ((extract_elems'69E3_) (t2'6B83_))))));
        
        fun RSL_is_PhoneNumber'529_ phone_number'52C_ = (((RT_l_1.R_all (fn (x_'0_:RT_Nat.t) => RT_Nat.R_ge (x_'0_, RT_Int.fromLit "0")) (phone_number'52C_))) andalso (RT_Nat.equ (RT_l_1.R_length(phone_number'52C_), RT_Int.fromLit "8")));
        
        fun tree_is_ordered'63A3_ t'6417_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (257, 9)); (case ((t'6417_):RT_u_Tree__7.t) of RT_u_Tree__7.empty_ => (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (258, 20)); true) | RT_u_Tree__7.node_(t1'6604_, e'6608_, t2'660B_) => (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (262, 13)); (((RT_s_9.R_all (fn (e1'666A_:RT_Nat.t) => not (RT_Nat.R_ge (e1'666A_, RT_Int.fromLit "0")) orelse (RT_Nat.R_lt (e1'666A_, e'6608_))) (((extract_elems'69E3_) (t1'6604_)))))) andalso (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (263, 13)); (((RT_s_9.R_all (fn (e2'66CE_:RT_Nat.t) => not (RT_Nat.R_ge (e2'66CE_, RT_Int.fromLit "0")) orelse (RT_Nat.R_lt (e'6608_, e2'66CE_))) (((extract_elems'69E3_) (t2'660B_)))))) andalso (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (264, 13)); (((tree_is_ordered'63A3_) (t1'6604_))) andalso (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (264, 36)); ((tree_is_ordered'63A3_) (t2'660B_))))))));
        
        fun RSL_is_OrderedTree'BCD_ t'BD0_ = (((tree_is_ordered'63A3_) (t'BD0_)));
        
        fun map_fun2'539F_ fun'540C_ xs'5411_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (215, 28)); (RT_l_1.R_compll (fn (x'5423_:RT_Nat.t) => ((fun'540C_) (x'5423_))) (fn (x'5423_:RT_Nat.t) => true) (xs'5411_)));
        
        fun sum'4C33_ xs'4C9B_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (197, 9)); if RT_Nat.R_gt (RT_l_1.R_length(xs'4C9B_), RT_Int.fromLit "0") then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (198, 13)); RT_Nat.R_add ((RT_l_1.R_hd(xs'4C9B_)), ((sum'4C33_) (RT_l_1.R_tl(xs'4C9B_))))) else (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (200, 13)); RT_Int.fromLit "0"));
        
        fun composed_fun2'5F57_ xs'5FC9_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (246, 9)); ((((op o) ((op o) ((op o) (sum'4C33_, ((map_fun2'539F_) (fn (x'6092_:RT_Nat.t) => RT_Nat.R_mul (x'6092_, RT_Int.fromLit "13")))), ((map_fun2'539F_) (fn (x'60F6_:RT_Nat.t) => RT_Nat.R_sub (x'60F6_, RT_Int.fromLit "5")))), ((map_fun2'539F_) (fn (x'615A_:RT_Nat.t) => RT_Nat.R_mul (x'615A_, x'615A_)))))) (xs'5FC9_)));
        
        fun map_fun'49DB_ (fun'4A47_, xs'4A4C_) = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (190, 27)); (RT_l_1.R_compll (fn (x'4A5E_:RT_Nat.t) => ((fun'4A47_) (x'4A5E_))) (fn (x'4A5E_:RT_Nat.t) => true) (xs'4A4C_)));
        
        fun add_two_numbers'5147_ x'51BB_ y'51BE_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (209, 32)); RT_Nat.R_add (x'51BB_, y'51BE_));
        
        fun add_forty_two'55F7_ x'5669_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (221, 27)); ((((add_two_numbers'5147_) (RT_Int.fromLit "42"))) (x'5669_)));
        
        fun composed_fun1'5AA7_ x'5B19_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (234, 9)); ((((op o) ((op o) (((add_two_numbers'5147_) (RT_Int.fromLit "13")), ((add_two_numbers'5147_) (RT_Int.fromLit "42"))), ((add_two_numbers'5147_) (RT_Nat.R_neg(RT_Int.fromLit "3")))))) (x'5B19_)));
        
        fun zip2'42D3_ (l1'433C_, l2'4340_) = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (173, 9)); if not(((RT_l_1.R_all (fn (x_'0_:RT_Nat.t) => RT_Nat.R_ge (x_'0_, RT_Int.fromLit "0")) (l1'433C_))) andalso ((RT_l_1.R_all (fn (x_'0_:RT_Nat.t) => RT_Nat.R_ge (x_'0_, RT_Int.fromLit "0")) (l2'4340_)))) then raise RSL.RSL_exception ("./examples.rsl:171:7: Argument of zip2" ^ RT_x_14.toString (l1'433C_, l2'4340_) ^ " not in subtype") else if (RT_Nat.R_gt (RT_l_1.R_length(l1'433C_), RT_Int.fromLit "0")) andalso (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (173, 26)); RT_Nat.R_gt (RT_l_1.R_length(l2'4340_), RT_Int.fromLit "0")) then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (175, 11)); let
            val h1'44CD_ = ((RT_l_1.R_hd(l1'433C_)):RT_Nat.t); 
            val h2'44D9_ = ((RT_l_1.R_hd(l2'4340_)):RT_Nat.t); 
            val t1'44E5_ = ((RT_l_1.R_tl(l1'433C_)):RT_l_1.t); 
            val t2'44F1_ = ((RT_l_1.R_tl(l2'4340_)):RT_l_1.t)
        in
            ((h1'44CD_, h2'44D9_))::(((zip2'42D3_) (t1'44E5_, t2'44F1_)))
        end) else (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (180, 14)); ([]:RT_l_12.t)));
        
        val some_var_: RT_Nat.t ref = ref (RT_Int.fromLit "42");
        fun zip1'3A9F_ (l1'3B08_, l2'3B0C_, result'3B10_) = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (152, 9)); if not(((RT_l_1.R_all (fn (x_'0_:RT_Nat.t) => RT_Nat.R_ge (x_'0_, RT_Int.fromLit "0")) (l1'3B08_))) andalso (((RT_l_1.R_all (fn (x_'0_:RT_Nat.t) => RT_Nat.R_ge (x_'0_, RT_Int.fromLit "0")) (l2'3B0C_))) andalso ((RT_l_12.R_all (fn (x_'0_:RT_x_10.t) => let
            val (x3_'0_, x4_'0_) = ((x_'0_):RT_x_10.t)
        in
            (RT_Nat.R_ge (x3_'0_, RT_Int.fromLit "0")) andalso (RT_Nat.R_ge (x4_'0_, RT_Int.fromLit "0"))
        end) (result'3B10_))))) then raise RSL.RSL_exception ("./examples.rsl:150:7: Argument of zip1" ^ RT_x_13.toString (l1'3B08_, l2'3B0C_, result'3B10_) ^ " not in subtype") else if (RT_Nat.R_gt (RT_l_1.R_length(l1'3B08_), RT_Int.fromLit "0")) andalso (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (152, 26)); RT_Nat.R_gt (RT_l_1.R_length(l2'3B0C_), RT_Int.fromLit "0")) then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (154, 11)); let
            val h1'3C99_ = ((RT_l_1.R_hd(l1'3B08_)):RT_Nat.t); 
            val h2'3CFD_ = ((RT_l_1.R_hd(l2'3B0C_)):RT_Nat.t); 
            val t1'3D61_ = ((RT_l_1.R_tl(l1'3B08_)):RT_l_1.t); 
            val t2'3DC5_ = ((RT_l_1.R_tl(l2'3B0C_)):RT_l_1.t); 
            val result''3E29_ = ((RT_l_12.R_concat (result'3B10_, [(h1'3C99_, h2'3CFD_)])):RT_l_12.t)
        in
            ((zip1'3A9F_) (t1'3D61_, t2'3DC5_, result''3E29_))
        end) else (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (163, 14)); result'3B10_));
        
        val counter_: RT_Nat.t ref = ref (RT_Int.fromLit "0");
        fun fibonacci'3527_ n'3595_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (138, 9)); if not(RT_Nat.R_ge (n'3595_, RT_Int.fromLit "0")) then raise RSL.RSL_exception ("./examples.rsl:136:7: Argument of fibonacci" ^ "(" ^ RT_Nat.toString n'3595_ ^ ")" ^ " not in subtype") else (if RT_Nat.equ (((n'3595_):RT_Nat.t), RT_Int.fromLit "0") then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (139, 16)); RT_Int.fromLit "1") else if RT_Nat.equ (((n'3595_):RT_Nat.t), RT_Int.fromLit "1") then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (140, 16)); RT_Int.fromLit "1") else (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (141, 16)); RT_Nat.R_add (((fibonacci'3527_) (RT_Nat.R_sub (n'3595_, RT_Int.fromLit "1"))), ((fibonacci'3527_) (RT_Nat.R_sub (n'3595_, RT_Int.fromLit "2")))))));
        
        val empty_nat_set'FA7_ = let val z__'FBF_ = RT_s_9.R_fromList [] in if not((RT_s_9.R_all (fn (x_'0_:RT_Nat.t) => RT_Nat.R_ge (x_'0_, RT_Int.fromLit "0")) (z__'FBF_))) then (RSL.add_load_err("./examples.rsl:40:31: Value " ^ RT_s_9.toString(z__'FBF_) ^ " of empty_nat_set not in subtype"); z__'FBF_) else z__'FBF_ end;
        
        fun addTranslationToMap'326B_ (tmap'32E3_, lang'32E9_, word_lang'32EF_, word_eng'32FA_) = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (131, 9)); RT_m_4.R_override (tmap'32E3_, RT_m_4.R_fromList ([((lang'32E9_, word_lang'32EF_), word_eng'32FA_)])));
        
        fun say_hello'119B_ l'1209_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (47, 9)); (if RT_u_Language__2.equ (((l'1209_):RT_u_Language__2.t), RT_u_Language__2.french_) then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (48, 28)); RT_Text.fromLit "salut") else if RT_u_Language__2.equ (((l'1209_):RT_u_Language__2.t), RT_u_Language__2.japanese_) then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (49, 35)); RT_Text.fromLit "konnichiwa") else if RT_u_Language__2.equ (((l'1209_):RT_u_Language__2.t), RT_u_Language__2.danish_) then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (50, 26)); RT_Text.fromLit "hej") else if RT_u_Language__2.equ (((l'1209_):RT_u_Language__2.t), RT_u_Language__2.korean_) then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (51, 30)); RT_Text.fromLit "anyoung") else raise RSL.swap ("./examples.rsl:47:14: Case incomplete for value " ^ RT_u_Language__2.toString(((l'1209_):RT_u_Language__2.t)))));
        
        fun max'29D3_ l'2A3B_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (109, 9)); if not(RT_Nat.R_gt (RT_l_1.R_length(l'2A3B_), RT_Int.fromLit "0")) then raise RSL.RSL_exception ("./examples.rsl:124:11: Precondition of max" ^ "(" ^ RT_l_1.toString l'2A3B_ ^ ")" ^ " not satisfied") else if RT_Nat.R_gt (RT_l_1.R_length(l'2A3B_), RT_Int.fromLit "1") then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (111, 11)); let
            val i1'2BCD_ = ((RT_l_1.R_hd(l'2A3B_)):RT_Nat.t); 
            val i2'2C31_ = ((RT_l_1.R_hd((RT_l_1.R_tl(l'2A3B_)))):RT_Nat.t); 
            val rem'2C95_ = ((RT_l_1.R_tl((RT_l_1.R_tl(l'2A3B_)))):RT_l_1.t)
        in
            if RT_Nat.R_gt (i1'2BCD_, i2'2C31_) then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (117, 17)); ((max'29D3_) ((i1'2BCD_)::(rem'2C95_)))) else (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (119, 17)); ((max'29D3_) ((i2'2C31_)::(rem'2C95_))))
        end) else (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (122, 14)); RT_l_1.R_hd(l'2A3B_)));
        
        fun read_some_var'164B_ () = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (58, 27)); !some_var_);
        
        fun max'264F_ (i1'26B7_, i2'26BB_) = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (100, 9)); if RT_Nat.R_gt (i1'26B7_, i2'26BB_) then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (100, 25)); i1'26B7_) else (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (101, 14)); i2'26BB_));
        
        fun set_some_var'18A3_ n'1914_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (64, 35)); if not(RT_Nat.R_ge (n'1914_, RT_Int.fromLit "0")) then raise RSL.RSL_exception ("./examples.rsl:63:7: Argument of set_some_var" ^ "(" ^ RT_Nat.toString n'1914_ ^ ")" ^ " not in subtype") else some_var_ := (n'1914_));
        
        fun some_partial_function'2393_ n'240D_ = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (92, 35)); if not(RT_Nat.R_ge (n'240D_, RT_Int.fromLit "0")) then raise RSL.RSL_exception ("./examples.rsl:91:7: Argument of some_partial_function" ^ "(" ^ RT_Nat.toString n'240D_ ^ ")" ^ " not in subtype") else if not(RT_Nat.R_gt (n'240D_, RT_Int.fromLit "17")) then raise RSL.RSL_exception ("./examples.rsl:92:46: Precondition of some_partial_function" ^ "(" ^ RT_Nat.toString n'240D_ ^ ")" ^ " not satisfied") else RT_Nat.R_add (n'240D_, RT_Int.fromLit "42"));
        
        fun increment_counter'1AFB_ () = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (71, 17)); (counter_ := (if RT_Nat.equ (!counter_, RT_Int.fromLit "10") then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (71, 41)); RT_Int.fromLit "0") else (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (72, 25)); RT_Nat.R_add (!counter_, RT_Int.fromLit "1"))); ()));
        
        fun dial_phone_num'20D7_ phone_num'214A_ = (if not(((RSL_is_PhoneNumber'529_) (phone_num'214A_))) then raise RSL.RSL_exception ("./examples.rsl:84:7: Argument of dial_phone_num" ^ "(" ^ RT_l_1.toString phone_num'214A_ ^ ")" ^ " not in subtype") else RT_Text.fromLit "hello");
        
        fun decrement_counter'1D53_ () = (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (77, 17)); (let val z__'1E28_ = if RT_Nat.R_gt (!counter_, RT_Int.fromLit "0") then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (77, 40)); RT_Nat.R_sub (!counter_, RT_Int.fromLit "1")) else (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (78, 25)); RT_Int.fromLit "0") in if not(RT_Nat.R_ge (z__'1E28_, RT_Int.fromLit "0")) then raise RSL.RSL_exception ("./examples.rsl:77:20: Value " ^ RT_Nat.toString(z__'1E28_) ^ " of counter not in subtype") else counter_ := z__'1E28_ end; ()));
        
    end;
    
open examples;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./examples.rsl", (78, 25), (78, 27));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (77, 40), (78, 23));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (77, 17), (79, 11));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (72, 25), (72, 37));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (71, 41), (72, 23));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (71, 17), (73, 11));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (92, 35), (92, 52));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (64, 35), (64, 39));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (101, 14), (101, 17));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (100, 25), (101, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (100, 9), (101, 20));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (58, 27), (58, 35));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (119, 17), (120, 13));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (117, 17), (118, 16));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (122, 14), (123, 9));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (111, 11), (122, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (109, 9), (124, 20));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (51, 30), (52, 11));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (50, 26), (50, 26));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (49, 35), (49, 35));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (48, 28), (48, 28));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (47, 9), (52, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (131, 9), (131, 48));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (141, 16), (142, 11));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (140, 16), (140, 17));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (139, 16), (139, 17));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (138, 9), (142, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (152, 26), (153, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (163, 14), (164, 9));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (154, 11), (163, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (152, 9), (164, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (173, 26), (174, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (180, 14), (181, 9));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (175, 11), (180, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (173, 9), (181, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (234, 9), (237, 13));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (221, 27), (221, 49));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (209, 32), (209, 37));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (190, 27), (190, 47));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (246, 9), (250, 14));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (200, 13), (201, 9));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (198, 13), (199, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (197, 9), (201, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (215, 28), (215, 48));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (264, 36), (265, 11));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (264, 13), (265, 11));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (263, 13), (265, 11));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (262, 13), (265, 11));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (258, 20), (258, 24));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (257, 9), (265, 12));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (276, 13), (278, 11));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (274, 20), (274, 22));
R_coverage.mark(RT_Text.fromLit "./examples.rsl", (273, 9), (280, 13)));
(RSL.C_output "[shorthand_record1] " RT_Real.toStringSafe (fn _ => let
    val cph'6EFB_ = ((((RT_u_City__6.mk_City_) (RT_Text.fromLit "Copenhagen", RT_Text.fromLit "Frank Jensen", RT_Real.fromLit "1.2"))):RT_u_City__6.t)
in
    ((RT_u_City__6.city_population_) (cph'6EFB_))
end));

(RSL.C_output "[shorthand_record2] " RT_u_City__6.toStringSafe (fn _ => let
    val cph'727F_ = ((((RT_u_City__6.mk_City_) (RT_Text.fromLit "Copenhagen", RT_Text.fromLit "Frank Jensen", RT_Real.fromLit "1.2"))):RT_u_City__6.t)
in
    ((RT_u_City__6.new_mayor_) (RT_Text.fromLit "John Doe", cph'727F_))
end));

(RSL.C_output "[dial_phone_test] " RT_Text.toStringSafe (fn _ => ((dial_phone_num'20D7_) ([RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3", RT_Int.fromLit "4", RT_Int.fromLit "5", RT_Int.fromLit "6", RT_Int.fromLit "7", RT_Int.fromLit "8"]))));

(RSL.C_output "[dial_phone_test2] " RT_Text.toStringSafe (fn _ => ((dial_phone_num'20D7_) ([RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3", RT_Int.fromLit "4", RT_Int.fromLit "5", RT_Int.fromLit "6", RT_Int.fromLit "7", RT_Int.fromLit "8", RT_Int.fromLit "9"]))));

(RSL.C_output "[partial_fun_test] " RT_Nat.toStringSafe (fn _ => ((some_partial_function'2393_) (RT_Int.fromLit "3"))));

(RSL.C_output "[partial_fun_test2] " RT_Nat.toStringSafe (fn _ => ((some_partial_function'2393_) (RT_Int.fromLit "18"))));

(RSL.C_output "[say_hello_example] " RT_Text.toStringSafe (fn _ => ((say_hello'119B_) (RT_u_Language__2.japanese_))));

(RSL.C_output "[some_list] " RT_l_1.toStringSafe (fn _ => [RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3"]));

(RSL.C_output "[lenght_of_list] " RT_Nat.toStringSafe (fn _ => RT_l_1.R_length([RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3"])));

(RSL.C_output "[cardinality_of_set] " RT_Nat.toStringSafe (fn _ => RT_s_9.R_card(RT_s_9.R_fromList ([RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3"]))));

(RSL.C_output "[some_other_list] " RT_l_1.toStringSafe (fn _ => R'a_List.uptoInt(RT_Int.fromLit "1", RT_Int.fromLit "10")));

(RSL.C_output "[some_list_comprehension] " RT_l_1.toStringSafe (fn _ => (RT_l_1.R_compll (fn (x'7FE3_:RT_Nat.t) => x'7FE3_) (fn (x'7FE3_:RT_Nat.t) => RT_Nat.equ (RT_Nat.R_mod (x'7FE3_, RT_Int.fromLit "2"), RT_Int.fromLit "0")) (R'a_List.uptoInt(RT_Int.fromLit "1", RT_Int.fromLit "10")))));

(RSL.C_output "[some_set_comprehension] " RT_s_9.toStringSafe (fn _ => (RT_s_9.R_compss (fn (x'80A9_:RT_Nat.t) => x'80A9_) (fn (x'80A9_:RT_Nat.t) => (RT_Nat.R_ge (x'80A9_, RT_Int.fromLit "0")) andalso (RT_Nat.equ (RT_Nat.R_mod (x'80A9_, RT_Int.fromLit "2"), RT_Int.fromLit "0"))) (R'a_Set.uptoInt (RT_Int.fromLit "1", RT_Int.fromLit "10")))));

(RSL.C_output "[some_other_set_comprehension] " RT_s_9.toStringSafe (fn _ => (RT_s_9.R_compss (fn (x'817B_:RT_Nat.t) => RT_Nat.R_add (x'817B_, RT_Int.fromLit "1")) (fn (x'817B_:RT_Nat.t) => (RT_Nat.R_ge (x'817B_, RT_Int.fromLit "0")) andalso (RT_Nat.equ (RT_Nat.R_mod (x'817B_, RT_Int.fromLit "2"), RT_Int.fromLit "0"))) (R'a_Set.uptoInt (RT_Int.fromLit "0", RT_Int.fromLit "10")))));

(RSL.C_output "[lang_map] " RT_m_4.toStringSafe (fn _ => let
    val m'82E7_ = ((RT_m_4.R_fromList ([((RT_u_Language__2.japanese_, RT_Text.fromLit "konnichiwa"), RT_Text.fromLit "hi"), ((RT_u_Language__2.danish_, RT_Text.fromLit "hej"), RT_Text.fromLit "hi"), ((RT_u_Language__2.japanese_, RT_Text.fromLit "arigato"), RT_Text.fromLit "thanks")])):RT_m_4.t)
in
    ((addTranslationToMap'326B_) (m'82E7_, RT_u_Language__2.japanese_, RT_Text.fromLit "kawa", RT_Text.fromLit "river"))
end));

(RSL.C_output "[map_domain] " RT_Bool.toStringSafe (fn _ => RT_s_19.equ (RT_m_20.R_dom(RT_m_20.R_fromList ([(RT_Text.fromLit "a", RT_Int.fromLit "1"), (RT_Text.fromLit "b", RT_Int.fromLit "1"), (RT_Text.fromLit "c", RT_Int.fromLit "2")])), RT_s_19.R_fromList ([RT_Text.fromLit "a", RT_Text.fromLit "b", RT_Text.fromLit "c"]))));

(RSL.C_output "[map_range] " RT_Bool.toStringSafe (fn _ => RT_s_9.equ (RT_m_20.R_ran(RT_m_20.R_fromList ([(RT_Text.fromLit "a", RT_Int.fromLit "1"), (RT_Text.fromLit "b", RT_Int.fromLit "1"), (RT_Text.fromLit "c", RT_Int.fromLit "2")])), RT_s_9.R_fromList ([RT_Int.fromLit "1", RT_Int.fromLit "2"]))));

(RSL.C_output "[fibonacci_test] " RT_Nat.toStringSafe (fn _ => ((fibonacci'3527_) (RT_Int.fromLit "12"))));

(RSL.C_output "[let_expression] " RT_Bool.toStringSafe (fn _ => let
    val some_list'8C47_ = (([RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3"]):RT_l_1.t); 
    val head'8CAB_ = ((RT_l_1.R_hd(some_list'8C47_)):RT_Nat.t); 
    val tail'8D0F_ = ((RT_l_1.R_tl(some_list'8C47_)):RT_l_1.t)
in
    (RT_Nat.equ (head'8CAB_, RT_Int.fromLit "1")) andalso (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (364, 11)); RT_l_1.equ (tail'8D0F_, [RT_Int.fromLit "2", RT_Int.fromLit "3"]))
end));

(RSL.C_output "[if_expression] " RT_Nat.toStringSafe (fn _ => if true then (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (377, 22)); RT_Int.fromLit "42") else (R_coverage.cancel(RT_Text.fromLit "./examples.rsl", (377, 30)); RT_Int.fromLit "0")));

(RSL.C_output "[lambda_expression] " RT_Nat.toStringSafe (fn _ => let
    val f'9865_ = ((fn (x'986C_:RT_Nat.t) => RT_Nat.R_add (x'986C_, RT_Int.fromLit "3")):RT_f_15.t)
in
    ((f'9865_) (RT_Int.fromLit "17"))
end));

(RSL.C_output "[concat_lists] " RT_l_1.toStringSafe (fn _ => RT_l_1.R_concat ([RT_Int.fromLit "0", RT_Int.fromLit "1"], [RT_Int.fromLit "2", RT_Int.fromLit "3"])));

(RSL.C_output "[set_difference] " RT_s_9.toStringSafe (fn _ => RT_s_9.R_diff (RT_s_9.R_fromList ([RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3", RT_Int.fromLit "4"]), RT_s_9.R_fromList ([RT_Int.fromLit "2", RT_Int.fromLit "4"]))));

(RSL.C_output "[set_union] " RT_s_9.toStringSafe (fn _ => RT_s_9.R_union (RT_s_9.R_fromList ([RT_Int.fromLit "1", RT_Int.fromLit "2"]), RT_s_9.R_fromList ([RT_Int.fromLit "3", RT_Int.fromLit "4"]))));

(RSL.C_output "[set_union2] " RT_s_9.toStringSafe (fn _ => let
    val empty'9CBC_ = ((empty_nat_set'FA7_):RT_s_9.t)
in
    RT_s_9.R_union (empty'9CBC_, RT_s_9.R_fromList ([RT_Int.fromLit "35", RT_Int.fromLit "42"]))
end));

(RSL.C_output "[list_to_set] " RT_s_9.toStringSafe (fn _ => RT_l_1.R_elems([RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3", RT_Int.fromLit "4", RT_Int.fromLit "5"])));

(RSL.C_output "[zip1_test] " RT_l_12.toStringSafe (fn _ => ((zip1'3A9F_) ([RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3"], [RT_Int.fromLit "4", RT_Int.fromLit "5", RT_Int.fromLit "6"], ([]:RT_l_12.t)))));

(RSL.C_output "[zip2_test] " RT_l_12.toStringSafe (fn _ => ((zip2'42D3_) ([RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3"], [RT_Int.fromLit "4", RT_Int.fromLit "5", RT_Int.fromLit "6"]))));

(RSL.C_output "[all_predicate] " RT_Bool.toStringSafe (fn _ => ((RT_s_9.R_all (fn (x'9FE0_:RT_Nat.t) => not (RT_Nat.R_ge (x'9FE0_, RT_Int.fromLit "0")) orelse (RT_Nat.R_lt (x'9FE0_, RT_Int.fromLit "11"))) (R'a_Set.uptoInt (RT_Int.fromLit "1", RT_Int.fromLit "10"))))));

(RSL.C_output "[exists_predicate] " RT_Bool.toStringSafe (fn _ => ((RT_s_9.R_exists (fn (x'A0AE_:RT_Nat.t) => (RT_Nat.R_ge (x'A0AE_, RT_Int.fromLit "0")) andalso (RT_Nat.R_gt (x'A0AE_, RT_Int.fromLit "4"))) (R'a_Set.uptoInt (RT_Int.fromLit "1", RT_Int.fromLit "5"))))));

(RSL.C_output "[higher_order_function_test] " RT_l_1.toStringSafe (fn _ => ((map_fun'49DB_) (fn (x'A183_:RT_Nat.t) => RT_Nat.R_add (x'A183_, RT_Int.fromLit "2"), [RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3"]))));

(RSL.C_output "[higher_order_function_test2] " RT_Nat.toStringSafe (fn _ => let
    val l'A2EF_ = (([RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "3"]):RT_l_1.t); 
    val l''A353_ = ((((map_fun'49DB_) (fn (x'A363_:RT_Nat.t) => RT_Nat.R_add (x'A363_, RT_Int.fromLit "2"), l'A2EF_))):RT_l_1.t); 
    val l'''A3B7_ = ((((map_fun'49DB_) (fn (x'A3C8_:RT_Nat.t) => RT_Nat.R_mul (x'A3C8_, RT_Int.fromLit "3"), l''A353_))):RT_l_1.t)
in
    ((sum'4C33_) (l'''A3B7_))
end));

(RSL.C_output "[curry_example] " RT_Nat.toStringSafe (fn _ => ((add_forty_two'55F7_) (RT_Int.fromLit "17"))));

(RSL.C_output "[curry_example2] " RT_Nat.toStringSafe (fn _ => let
    val add_three'A995_ = ((((add_two_numbers'5147_) (RT_Int.fromLit "3"))):RT_f_15.t)
in
    ((add_three'A995_) (RT_Int.fromLit "42"))
end));

(RSL.C_output "[curry_example3] " RT_l_1.toStringSafe (fn _ => let
    val l'ACB3_ = (([RT_Int.fromLit "1", RT_Int.fromLit "2", RT_Int.fromLit "2", RT_Int.fromLit "4", RT_Int.fromLit "5", RT_Int.fromLit "6"]):RT_l_1.t); 
    val add_three'AD17_ = ((((add_two_numbers'5147_) (RT_Int.fromLit "3"))):RT_f_15.t)
in
    ((map_fun'49DB_) (add_three'AD17_, l'ACB3_))
end));

(RSL.C_output "[fun_composition_test1] " RT_Nat.toStringSafe (fn _ => ((composed_fun1'5AA7_) (RT_Int.fromLit "42"))));

(RSL.C_output "[fun_composition_test2] " RT_Nat.toStringSafe (fn _ => ((composed_fun2'5F57_) ([RT_Int.fromLit "12", RT_Nat.R_neg(RT_Int.fromLit "2"), RT_Int.fromLit "32", RT_Int.fromLit "42"]))));

(RSL.C_output "[ordered_tree_test] " RT_Bool.toStringSafe (fn _ => let
    val tree'B28F_ = ((((RT_u_Tree__7.node_) (((RT_u_Tree__7.node_) (RT_u_Tree__7.empty_, RT_Int.fromLit "2", RT_u_Tree__7.empty_)), RT_Int.fromLit "5", ((RT_u_Tree__7.node_) (RT_u_Tree__7.empty_, RT_Int.fromLit "9", RT_u_Tree__7.empty_))))):RT_u_Tree__7.t)
in
    ((tree_is_ordered'63A3_) (tree'B28F_))
end));

(RSL.C_output "[ordered_tree_test2] " RT_Bool.toStringSafe (fn _ => let
    val tree'B613_ = ((((RT_u_Tree__7.node_) (((RT_u_Tree__7.node_) (RT_u_Tree__7.empty_, RT_Int.fromLit "7", RT_u_Tree__7.empty_)), RT_Int.fromLit "5", ((RT_u_Tree__7.node_) (RT_u_Tree__7.empty_, RT_Int.fromLit "9", RT_u_Tree__7.empty_))))):RT_u_Tree__7.t)
in
    RT_Bool.equ (((tree_is_ordered'63A3_) (tree'B613_)), false)
end));

RSL.print_error_count();
R_coverage.save_marked();
