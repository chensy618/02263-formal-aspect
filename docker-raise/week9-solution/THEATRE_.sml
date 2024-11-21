structure RT_Bool = RT_Bool;

structure THEATRE =
    struct
        type Database_ = .t;
        
        type Reservations_ = .t;
        
        type Status_ = .t;
        
        type Performance_ = .t;
        
        type Person_ = .t;
        
        type Seat_ = .t;
        
        fun free_seats'3EF_ (p'45E_, t'461_) = (R_coverage.cancel(RT_Text.fromLit "./THEATRE.rsl", (11, 27)); if not(.R_mem (p'45E_, t'461_)) then raise RSL.RSL_exception ("./THEATRE.rsl:11:90: Precondition of free_seats" ^ .toString (p'45E_, t'461_) ^ " not satisfied") else (.R_compms (fn (s'46D_:.t) => s'46D_) (fn (s'46D_:.t) => .equ (((((t'461_) (p'45E_))) (s'46D_)), free'269_)) (((t'461_) (p'45E_)))));
        
        fun mk_reservation'51B_ (id'58E_, s'592_, p'595_, t'598_) = (R_coverage.cancel(RT_Text.fromLit "./THEATRE.rsl", (14, 39)); if not((.R_mem (p'595_, t'598_)) andalso (R_coverage.cancel(RT_Text.fromLit "./THEATRE.rsl", (15, 29)); .R_mem (s'592_, ((free_seats'3EF_) (p'595_, t'598_))))) then raise RSL.RSL_exception ("./THEATRE.rsl:15:13: Precondition of mk_reservation" ^ .toString (id'58E_, s'592_, p'595_, t'598_) ^ " not satisfied") else .R_override (t'598_, .R_fromList ([(p'595_, .R_override (((t'598_) (p'595_)), .R_fromList ([(s'592_, ((reserved_by'270_) (id'58E_)))])))])));
        
    end;
    
open THEATRE;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./THEATRE.rsl", (15, 29), (16, 6));
R_coverage.mark(RT_Text.fromLit "./THEATRE.rsl", (14, 39), (16, 6));
R_coverage.mark(RT_Text.fromLit "./THEATRE.rsl", (11, 27), (12, 2)));
RSL.print_error_count();
R_coverage.save_marked();
