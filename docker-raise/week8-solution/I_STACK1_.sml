structure RT_Unit = RT_Unit;

structure RT_Bool = RT_Bool;

structure I_STACK1 =
    struct
        type Elem_ = .t;
        
        fun top'711_ () = (R_coverage.cancel(RT_Text.fromLit "./I_STACK1.rsl", (19, 18)); if not((RSL.C_not .equ) (!st_, ([]:.t))) then raise RSL.RSL_exception ("./I_STACK1.rsl:19:28: Precondition of top" ^ RT_Unit.toString () ^ " not satisfied") else .R_hd(!st_))
        and is_empty'5E5_ () = (R_coverage.cancel(RT_Text.fromLit "./I_STACK1.rsl", (16, 23)); .equ (!st_, ([]:.t)))
        and push'4B9_ e'522_ = (R_coverage.cancel(RT_Text.fromLit "./I_STACK1.rsl", (13, 23)); st_ := ((e'522_)::(!st_)))
        and empty'38D_ () = (R_coverage.cancel(RT_Text.fromLit "./I_STACK1.rsl", (10, 23)); st_ := (([]:.t)))
        
        and pop'83D_ () = (R_coverage.cancel(RT_Text.fromLit "./I_STACK1.rsl", (22, 21)); if not((RSL.C_not .equ) (!st_, ([]:.t))) then raise RSL.RSL_exception ("./I_STACK1.rsl:22:34: Precondition of pop" ^ RT_Unit.toString () ^ " not satisfied") else st_ := (.R_tl(!st_)));
        
    end;
    
open I_STACK1;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./I_STACK1.rsl", (22, 21), (23, 7));
R_coverage.mark(RT_Text.fromLit "./I_STACK1.rsl", (10, 23), (10, 30));
R_coverage.mark(RT_Text.fromLit "./I_STACK1.rsl", (13, 23), (13, 36));
R_coverage.mark(RT_Text.fromLit "./I_STACK1.rsl", (16, 23), (16, 32));
R_coverage.mark(RT_Text.fromLit "./I_STACK1.rsl", (19, 18), (19, 38)));
RSL.print_error_count();
R_coverage.save_marked();
