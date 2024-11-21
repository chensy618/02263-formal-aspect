structure ELEMENT =
    struct
        type Elem_ = .t;
        
    end;
    
open ELEMENT;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
();
RSL.print_error_count();
R_coverage.save_marked();
