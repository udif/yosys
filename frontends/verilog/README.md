Goal: Add support for typedefs and structs (and hence typedef struct) to Yosys (under the -sv flag).
====================================================================================================

This file lives in my branch to document the work progress.
Once we are done it will be gone forever and won't contaminate the Verilog frontend directory further.

Project stages:
---------------

1. ~~Update Lexer (verilog_lexer.l) to recognize 'typedef', 'struct', 'packed', 'unpacked' keywords.
   New tokens, TOK_TYPEEF, TOK_STRUCT, etc.~~ DONE  
2. ~~Update Parser (verilog_parser.y) to correctly parse the syntax and to fail with syntax errors when incorrect syntax is used.~~ DONE  
   Unsupported construct might be optionally failed with a more descriptive message.
   It looks like the correct place  for declaration would be the module_body_stmt as well as behavioral_stmt.
   In other words, on any place we find a wire_decl
   The usage can be handled by the wire_type rule
3. Extend the AST types (../ast/ast.h) and generate the new AST tree constructs in the parser.
   Implement AST_TYPEDEF and/or AST_STRUCT.
4. Extend the AST front end to recognized the extended AST types and generate the correct RTLIL constructs.
   When accessing structures, the AST parser should then do the same stuff done by AST CONCAT_LIST and concat_list rule in verilog_parser.y

Optionally:
1. Add support for $bits(), etc.
2. Add support for multidimentional packed arrays (unpacked arrays already supported)

Need to update hierarchical_id to handle struct hierarchy.
