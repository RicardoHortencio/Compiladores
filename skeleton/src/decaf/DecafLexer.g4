lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

//tokens
//{
   
// TK_class

//}  
 	// ESPAÇOS EM BRANCO  E COMENTARIOS

 WS_ : 			(' ' | '\n' | '\r' | '\t' ) -> skip;


 SL_COMMENT : 		'//' (~'\n')* '\n' -> skip;


 	// PALAVRAS RESERVADAS

 
 PROGRAM: 			 'Program';
 CLASS: 			 'class'; 
 VOID:				 'void'; 
 BOOL_LITERAL:			 'false' | 'true'; 
 FOR:  				 'for';  
 RETURN: 			 'return';  
 CONTINUE: 			 'continue';  
 IF:              		 'if'; 
 ELSE: 				 'else';
 BREAK: 			 'break';
 CALLOUT: 	   	  	 'callout';
 TYPE: 			  	 'boolean' | 'int';

 RESERVWORD : TYPE | BREAK | CALLOUT | CLASS | CONTINUE | ELSE | FOR | RETURN | IF | VOID | BOOL_LITERAL | CLASS | PROGRAM ;

 	// SIMBOLOS 



 PL: 				'(' ;          
 PR: 				')' ;
 LCURLY : 			'{' ;
 RCURLY : 			'}' ; 
 PONT_V: 			';' ;
 VIRGULA:  			',' ;
 CL: 				'[' ;
 CR: 				']' ;  
 
 // OPERADORES

 
 BINOP:  		'<=' | '!=' | '==' | '<' | '>' | '>=' |  '&&' | '||' | '+' | '*' | '/' | '%' ;

 IGUAL_OP: '=';
 SMENOS: '-'; 
 SAFIRMA: '!';

 REL_OP: 		'<' | '>' | '<=' | '>=';
 
 EQ_OP:  		'==' | '!=' ;
 
 COND_OP : 		'&&' | '||'  ;

 ASSING_OP: 		 '/=' | '+='| '-=' | '*='; 

 
//ARITH_OP:  		(SMENOS) | (SMAIS) | '*' | '/' | '%' | ;


 SYMBOLS: 		(VIRGULA) | '[' | ']' | '||' | '(' | ')' | (PONT_V) | '\'' ; 

 

  
 	// IDENTIFIER
  
 ID: ('_' | LETRAS)('_' |  LETRAS | DIGIT)* ;  

 LETRAS: ('a'..'z'  | 'A'..'Z'); 
 
 
	 //  NUMEROS
 

 INT_LITERAL: 			DECIMAL_LITERAL | HEX_LITERAL;

 HEX_LITERAL: 			'0x'(DIGIT | 'a'..'f' | 'A'..'F')+ ;

 DECIMAL_LITERAL: 		DIGIT+;
 
 DIGIT:  ('0'..'9');

 STRING_LITERAL : 		'"'  ( CHAR | ESC )* '"' ;
 CHAR_LITERAL : 		'\'' ( ESC  | CHAR ) '\'' ;
 
 CHAR :	']'..'~' | '#'..'&' | '('..'[' | ' ' | '!'  ;

 ESC : '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\' ) ;
 





