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
  
 field_decl:        ( TYPE ID (VIRGULA TYPE ID )*  PONT_V |  TYPE ID  CL INT_LITERAL CR (VIRGULA ID CL INT_LITERAL CR )* PONT_V );

 
 method_decl:       (TYPE | VOID)  ID PL ( PR block |  TYPE ID ( VIRGULA TYPE ID)* PR block );


 block:             LCURLY  (var_decl)* (statement)* RCURLY ;


 var_decl:          TYPE ID (VIRGULA ID)* PONT_V ; 
	
 
 statement:       location (IGUAL_OP|ASSING_OP | SMAIS) expr PONT_V
		
 		|  method_call PONT_V

		|  IF PL expr PR block CL ELSE block CR
		
		| FOR PL ID IGUAL_OP expr PONT_V  expr PONT_V block PR
	
		| RETURN  CL expr CR PONT_V

		| BREAK PONT_V

		| CONTINUE PONT_V
	
		| block ;
	


 method_call:     method_name  PL (  PR  |  ( expr (VIRGULA expr)* ) PR )

		| CALLOUT PL STRING_LITERAL ( PR | VIRGULA callout_arg (VIRGULA callout_arg)*  PR ) ;





 method_name: 	  ID ;


 location: 	   ID 

		|  ID CL expr CR ;


 expr: 		    location
		|   method_call
		|   literal
                |   expr (BIN_OP|SMENOS |SMAIS) expr
		|   SMENOS  expr
		|   SAFIRMA expr
		|   PL expr PR ;

 

callout_arg: expr | STRING_LITERAL ;
 
literal:  CHAR_LITERAL | BOOL_LITERAL | INT_LITERAL;














