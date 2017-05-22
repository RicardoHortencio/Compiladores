lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
   
  TK_class

 }

 TK_CLASS: 'class Programa';

 LCURLY : '{';       RCURLY : '}'; 

 PL: '(';            PR: ')';

 VIRGULA:  ',';

 CL: '[';
 CR: ']';  

 VOID: 'void'; 

 SYMBOLS: (VIRGULA) | '[' | ']' | '||' | '(' | ')' | (PONT_V) | '\'' ; 

 PONT_V: ';' ;

 BOOL_LITERAL: 'false' | 'true';

 FOR: 'for';  RETURN: 'return';  CONTINUE: 'continue';  IF: 'if'; ELSE: 'else'; BREAK: 'break'; CALLOUT: 'callout';

 BIN_OP:  (ARITH_OP) | (REL_OP) | (EQ_OP) | (COND_OP) ;

 RESERVWORD : (TYPES) | (BREAK) | CALLOUT | 'class'| (CONTINUE) | (ELSE) | (FOR) | (RETURN) | (IF) | (VOID) ;


 ARITH_OP:  (SMENOS) | (SMENOS) | '*' | '/' | '%' | '<<' | '>>' | '>>>' | (ASSING_OP) ;

 SMENOS: '-'; SMAIS: '+';

 SAFIRMA: '!';

 REL_OP: '<' | '>' | '<=' | '>=';

 ASSING_OP: (IGUAL_OP) | '+='| '-=';

 IGUAL_OP: '=';

 EQ_OP:  '==' | '!=' ;

 COND_OP : '&&' | '||'  ;
 
 WS_ : (' ' | '\n' |'\t' ) -> skip;    // tratando caracter em si

 ID: ('a'..'z' | 'A'..'Z'|'_') ('a'..'z' | 'A'..'Z'|'_' | '0'..'9')* ; 

 SL_COMMENT : '//' (~'\n')* '\n' -> skip;

 ALPHA_NUM: (ALPHA) (DIGIT);

 ALPHA: ('a'..'z' | 'A'..'Z'|'_') ('a'..'z' | 'A'..'Z'|'_')*;

 HEX_DIGIT: '0x' [0-9a-fA-F]+;
 
 DIGIT:  ('0'..'9')+; 

 TYPES: 'boolean' | 'int' ;

 INT_LITERAL: (DECIMAL_LITERAL)| (HEX_LITERAL);
 
 DECIMAL_LITERAL: (DIGIT) (DIGIT)* ;
 
 HEX_LITERAL: '0x' (HEX_DIGIT) (HEX_DIGIT)* ;
  
 CHAR_LITERAL: '\'' (ESC|~'\'') '\'';
 
 STRING_LITERAL: '"'(ESC|~('"' | '\''))* '"'; 
 
 CHAR: '\'' (ESC|~'\'') '\'';  	
 
 fragment
 ESC :  '\\' ('n'|'\"'|'\\'|'t' | '\'');







