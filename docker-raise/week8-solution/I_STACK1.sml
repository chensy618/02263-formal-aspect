#set CM.Control.verbose false;
CM.autoload "$smlnj/compiler/compiler.cm";
Compiler.Control.Print.signatures := 0;
Compiler.Control.Print.printOpens := false;
SMLofNJ.Internals.GC.messages false;
CM.autoload "C:/RSLtools/raise/sml/rslml.cm";
use "I_STACK1_.sml" handle RSL.RSL_exception s => TextIO.print (s ^ "\n") | RSL.swap s => TextIO.print (s ^ "\n");

