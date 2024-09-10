structure RT_Nat = RT_Nat;

structure RT_s_1 = RT_Set(structure Elem = RT_Nat);

structure SET_EX =
    struct
        type Record_ = RT_s_1.t;
        
        val Odd_number'265_ = RT_s_1.R_fromList ([RT_Int.fromLit "1", RT_Int.fromLit "3", RT_Int.fromLit "5", RT_Int.fromLit "7", RT_Int.fromLit "9"]);
        
    end;
    
open SET_EX;

RSL.print_load_errs();
RSL.set_time();
R_coverage.init();
();
RSL.print_error_count();
R_coverage.save_marked();
