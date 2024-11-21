structure RT_Bool = RT_Bool;

structure RT_Unit = RT_Unit;

structure LIBRARY =
    struct
        type Book_ = .t;
        
        type Person_ = .t;
        
        type Library1_ = .t;
        
        type Library_ = .t;
        
        ;
        
        fun is_wf'581_ b'5EB_ = (R_coverage.cancel(RT_Text.fromLit "./LIBRARY.rsl", (16, 11)); (.R_subs (.R_dom(((borrowed'3F3_) (b'5EB_))), ((books'32B_) (b'5EB_)))) andalso (R_coverage.cancel(RT_Text.fromLit "./LIBRARY.rsl", (17, 11)); .R_subs (.R_ran(((borrowed'3F3_) (b'5EB_))), ((borrowers'38F_) (b'5EB_)))));
        
        fun RSL_is_Library'45F_ b'462_ = (((is_wf'581_) (b'462_)));
        
        fun borrow_book'C25_ (b'C95_, p'C98_) = (R_coverage.cancel(RT_Text.fromLit "./LIBRARY.rsl", (33, 15)); if not((((owns'8A1_) (b'C95_))) andalso (R_coverage.cancel(RT_Text.fromLit "./LIBRARY.rsl", (36, 26)); (not (((is_borrowed'9CD_) (b'C95_)))) andalso (R_coverage.cancel(RT_Text.fromLit "./LIBRARY.rsl", (36, 46)); ((borrower'AF9_) (p'C98_))))) then raise RSL.RSL_exception ("./LIBRARY.rsl:36:15: Precondition of borrow_book" ^ .toString (b'C95_, p'C98_) ^ " not satisfied") else let val z__'D55_ = ((mk_Library1'331_) (((books'32B_) (!lib_)), ((borrowers'38F_) (!lib_)), .R_union (((borrowed'3F3_) (!lib_)), .R_fromList ([(b'C95_, p'C98_)])))) in if not(((RSL_is_Library'45F_) (z__'D55_))) then raise RSL.RSL_exception ("./LIBRARY.rsl:34:13: Value " ^ .toString(z__'D55_) ^ " of lib not in subtype") else lib_ := z__'D55_ end)
        and borrower'AF9_ p'B66_ = (R_coverage.cancel(RT_Text.fromLit "./LIBRARY.rsl", (29, 24)); .R_mem (p'B66_, ((borrowers'38F_) (!lib_))))
        and is_borrowed'9CD_ b'A3D_ = (R_coverage.cancel(RT_Text.fromLit "./LIBRARY.rsl", (26, 27)); if not(((owns'8A1_) (b'A3D_))) then raise RSL.RSL_exception ("./LIBRARY.rsl:26:56: Precondition of is_borrowed" ^ "(" ^ .toString b'A3D_ ^ ")" ^ " not satisfied") else .R_mem (b'A3D_, ((borrowed'3F3_) (!lib_))))
        and owns'8A1_ b'90A_ = (R_coverage.cancel(RT_Text.fromLit "./LIBRARY.rsl", (23, 20)); .R_mem (b'90A_, ((books'32B_) (!lib_))))
        
    end;
    
open LIBRARY;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./LIBRARY.rsl", (23, 20), (23, 37));
R_coverage.mark(RT_Text.fromLit "./LIBRARY.rsl", (26, 27), (26, 63));
R_coverage.mark(RT_Text.fromLit "./LIBRARY.rsl", (29, 24), (29, 45));
R_coverage.mark(RT_Text.fromLit "./LIBRARY.rsl", (36, 46), (36, 57));
R_coverage.mark(RT_Text.fromLit "./LIBRARY.rsl", (36, 26), (36, 57));
R_coverage.mark(RT_Text.fromLit "./LIBRARY.rsl", (33, 15), (36, 57));
R_coverage.mark(RT_Text.fromLit "./LIBRARY.rsl", (17, 11), (19, 14));
R_coverage.mark(RT_Text.fromLit "./LIBRARY.rsl", (16, 11), (19, 14)));
RSL.print_error_count();
R_coverage.save_marked();
