 parser grammar DecafParser;

  @header {
  package decaf;
 }

 options
 {

  language=Java;
  tokenVocab=DecafLexer;

	
 }		

 program:  	     CLASS PROGRAM LCURLY (field_decl)* (method_decl)* RCURLY EOF ;
 
  
 field_decl:        ( TYPE ID (VIRGULA TYPE ID )?  PONT_V |  TYPE ID  CL INT_LITERAL CR (VIRGULA ID CL INT_LITERAL CR )? PONT_V );
                 
 
 method_decl:       (TYPE | VOID)  ID PL (TYPE ID ( VIRGULA TYPE ID)*)? PR block ; 
      


 block:             LCURLY  (var_decl)* (statement)* RCURLY ;


 var_decl:          TYPE ID (VIRGULA ID)* PONT_V ; 
	
 
 statement:       location (IGUAL_OP|ASSING_OP ) expr PONT_V
		
 		|  method_call PONT_V

		|  IF PL expr PR block (ELSE block)?
		
		| FOR  ID IGUAL_OP expr VIRGULA expr
	
		| RETURN  (expr)? PONT_V

		| BREAK PONT_V

		| CONTINUE PONT_V
	
		| block ;
	


 method_call:     method_name  PL   ( expr (VIRGULA expr)* )? PR 

		| CALLOUT PL STRING_LITERAL   (VIRGULA callout_arg (VIRGULA callout_arg)*)?  PR ;


 method_name: 	  ID ;


 location: 	   ID 

		|  ID CL expr CR ;


 expr: 		    location
		|   method_call
		|   literal
                |   expr (BINOP|SMENOS) expr
		|   SMENOS  expr
		|   SAFIRMA expr
		|   PL expr PR ;

 

callout_arg: expr | STRING_LITERAL ;
 
literal:  CHAR_LITERAL | BOOL_LITERAL | INT_LITERAL;














