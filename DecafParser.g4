 parser grammar DecafParser;

  @header {
  package decaf;
 }

 options
 {

  language=Java;
  tokenVocab=DecafLexer;

	
 }		

 program:  TK_CLASS LCURLY (field_decl)* (method_decl)* RCURLY EOF ;   

 method_decl:       (type | VOID)  ID PL (( PR block ) | (type ID ( VIRGULA type ID)* PR block ));
		  
 field_decl:        ( (ID (VIRGULA ID) ) | ( ID CL INT_LITERAL CR (VIRGULA ID CL INT_LITERAL CR ) ))* ;

 block:             LCURLY (var_decl)+ (statement)+ RCURLY ;

 var_decl:          type (ID (VIRGULA ID))* ;
	
 type:           TYPES ;


 statement:        location ASSING_OP expr 
		
 		|  method_call 

		|  IF PL expr PR block CL ELSE block CR
		
		| FOR  PL ID IGUAL_OP expr PONT_V  expr PONT_V block PR
	
		| RETURN CL expr CR 

		| BREAK

		| CONTINUE 
	
		| block ;
	


 method_call:     method_name  PL (  (PR)  | ( (expr ( VIRGULA expr) )* PR )

		| CALLOUT PL STRING_LITERAL ( (PR) | (( VIRGULA (callout_arg (VIRGULA callout_arg) )* )PR) ) ;


 method_name: 	  ID ;


 location: 	   ID 

		|  ID CL expr CR ;


 expr: 		    location
		|   method_call
		|   literal
                |   expr BIN_OP expr
		|   SMENOS  expr
		|   SAFIRMA expr
		|  PL expr PR ;

 callout_arg: expr | STRING_LITERAL ;

 
 literal: ID ;













