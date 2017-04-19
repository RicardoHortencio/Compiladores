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

LCURLY : '{';
RCURLY : '}';

ID  :   ('a'..'z' | 'A'..'Z'|'_') ('a'..'z' | 'A'..'Z'|'_' | '0'..'9')*;

WS_ : (' ' | '\n' ) -> skip;    // tratando caracter em si 

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|~'\'') '\'';

STRING : '"'(ESC|~('"' | '\''))* '"';

HEXLITERAL: '0x' [0-9a-fA-F]+;

NUMBER: ('0'..'9')+;

OPERADOR: ('-'| '+' | '*'| '/' | '<' | '>' | '<=' | '>='| '&&' | '!=' );

fragment
ESC :  '\\' ('n'|'\"'|'\\'|'t' | '\'');


