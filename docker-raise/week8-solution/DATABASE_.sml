structure DATABASE =
    struct
        type Key_ = .t;
        
        type Data_ = .t;
        
        ;
        
        
        ;
        
        ;
        
        ;
        
        ;
        
    end;
    
open DATABASE;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
();
RSL.print_error_count();
R_coverage.save_marked();
