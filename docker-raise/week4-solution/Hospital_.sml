structure RT_Bool = RT_Bool;

structure Hospital =
    struct
        type WardId_ = .t;
        
        type PersonNr_ = .t;
        
        type Record_ = .t;
        
        type Patient_ = .t;
        
        type Nurse_ = .t;
        
        type Doctor_ = .t;
        
        type Hospital_ = .t;
        
        type Hospital'_ = .t;
        
        fun is_wff'83D_ h'8A8_ = (R_coverage.cancel(RT_Text.fromLit "./Hospital.rsl", (23, 11)); let
            val mk_Hospital''5EF_(dm'918_, nm'91C_, pm'920_, ws'924_) = ((h'8A8_):.t)
        in
            (.equ (.R_inter (.R_dom(dm'918_), .R_dom(nm'91C_)), .R_fromList [])) andalso (R_coverage.cancel(RT_Text.fromLit "./Hospital.rsl", (25, 13)); (.equ (.R_inter (.R_dom(dm'918_), .R_dom(pm'920_)), .R_fromList [])) andalso (R_coverage.cancel(RT_Text.fromLit "./Hospital.rsl", (26, 13)); (.equ (.R_inter (.R_dom(pm'920_), .R_dom(nm'91C_)), .R_fromList [])) andalso (R_coverage.cancel(RT_Text.fromLit "./Hospital.rsl", (27, 13)); .R_subs (.R_union (.R_union (.R_ran(dm'918_), .R_ran(nm'91C_)), ), ws'924_))))
        end);
        
        fun RSL_is_Hospital'528_ h'52B_ = (((is_wff'83D_) (h'52B_)));
        
        fun doctors'FA9_ (w'1015_, h'1018_) = (R_coverage.cancel(RT_Text.fromLit "./Hospital.rsl", (42, 11)); if not(((RSL_is_Hospital'528_) (h'1018_))) then raise RSL.RSL_exception ("./Hospital.rsl:40:9: Argument of doctors" ^ .toString (w'1015_, h'1018_) ^ " not in subtype") else if not(.R_mem (w'1015_, ((wards'713_) (h'1018_)))) then raise RSL.RSL_exception ("./Hospital.rsl:43:15: Precondition of doctors" ^ .toString (w'1015_, h'1018_) ^ " not satisfied") else (.R_compms (fn (d'1079_:.t) => d'1079_) (fn (d'1079_:.t) => .equ (((((doctors'5E7_) (h'1018_))) (d'1079_)), w'1015_)) (((doctors'5E7_) (h'1018_)))));
        
        fun is_in'C89_ (pid'CF3_, h'CF8_) = (R_coverage.cancel(RT_Text.fromLit "./Hospital.rsl", (33, 26)); if not(((RSL_is_Hospital'528_) (h'CF8_))) then raise RSL.RSL_exception ("./Hospital.rsl:32:9: Argument of is_in" ^ .toString (pid'CF3_, h'CF8_) ^ " not in subtype") else .R_mem (pid'CF3_, ((patients'6AF_) (h'CF8_))));
        
        fun discharge'DB5_ (pid'E23_, h'E28_) = (R_coverage.cancel(RT_Text.fromLit "./Hospital.rsl", (37, 11)); if not(((RSL_is_Hospital'528_) (h'E28_))) then raise RSL.RSL_exception ("./Hospital.rsl:35:9: Argument of discharge" ^ .toString (pid'E23_, h'E28_) ^ " not in subtype") else if not(((is_in'C89_) (pid'E23_, h'E28_))) then raise RSL.RSL_exception ("./Hospital.rsl:38:15: Precondition of discharge" ^ .toString (pid'E23_, h'E28_) ^ " not satisfied") else let val RSL_res_'DB5_ = ((mk_Hospital''5EF_) (((doctors'5E7_) (h'E28_)), ((nurses'64B_) (h'E28_)), .R_restrBySet (((patients'6AF_) (h'E28_)), .R_fromList ([pid'E23_])), ((wards'713_) (h'E28_)))) in if not(((RSL_is_Hospital'528_) (RSL_res_'DB5_))) then raise RSL.RSL_exception ("./Hospital.rsl:35:9: Result " ^ .toString RSL_res_'DB5_ ^ " of discharge" ^ .toString (pid'E23_, h'E28_) ^ " not in subtype") else RSL_res_'DB5_ end);
        
    end;
    
open Hospital;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./Hospital.rsl", (37, 11), (38, 28));
R_coverage.mark(RT_Text.fromLit "./Hospital.rsl", (33, 26), (33, 50));
R_coverage.mark(RT_Text.fromLit "./Hospital.rsl", (42, 11), (44, 7));
R_coverage.mark(RT_Text.fromLit "./Hospital.rsl", (27, 13), (30, 13));
R_coverage.mark(RT_Text.fromLit "./Hospital.rsl", (26, 13), (30, 13));
R_coverage.mark(RT_Text.fromLit "./Hospital.rsl", (25, 13), (30, 13));
R_coverage.mark(RT_Text.fromLit "./Hospital.rsl", (23, 11), (30, 14)));
RSL.print_error_count();
R_coverage.save_marked();
