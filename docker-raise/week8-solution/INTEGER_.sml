structure RT_Int = RT_Int;

structure INTEGER =
    struct
        type Elem_ = RT_Int.t;
        
    end;
    
open INTEGER;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
();
RSL.print_error_count();
R_coverage.save_marked();
