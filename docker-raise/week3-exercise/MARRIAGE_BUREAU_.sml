structure RT_Bool = RT_Bool;

structure MARRIAGE_BUREAU =
    struct
        type Woman_ = .t;
        
        type Man_ = .t;
        
        type Database_ = .t;
        
        fun is_married_w'3F5_ (w'466_, (women'46A_, men'471_, marriages'476_)) = (R_coverage.cancel(RT_Text.fromLit "./MARRIAGE_BUREAU.rsl", (12, 17)); (((RSL.C_not .R_mem) (w'466_, women'46A_))) andalso (R_coverage.cancel(RT_Text.fromLit "./MARRIAGE_BUREAU.rsl", (12, 36)); ()));
        
    end;
    
open MARRIAGE_BUREAU;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
(R_coverage.mark(RT_Text.fromLit "./MARRIAGE_BUREAU.rsl", (12, 36), (13, 3));
R_coverage.mark(RT_Text.fromLit "./MARRIAGE_BUREAU.rsl", (12, 17), (13, 3)));
RSL.print_error_count();
R_coverage.save_marked();
