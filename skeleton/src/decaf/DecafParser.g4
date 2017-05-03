parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;

	
}
		

program:  Class Program '{' (field_decl)* (method_decl)* '}' EOF;


field_decl:         (type) ('{' (id) | (id) '[' (int_literal) ']' '}')+ ','  ';' ;

method_decl:      '{' (type) | (void) '}' (id) '('  '[' ('{' (type) (id) '}')+ ',' ']' ')' (block) ;

block:            '{' (var_decl)* (statement)* '}' ;

var_decl:          'int' | 'boolean' ;

statement:        (location) (assign_op) (expr) ';'
		| (method_call) ';'

		| 'if' '(' (exp) ')' (block) '[' 'else' (block) ']'
		
		| 'for' (id) '=' (expr) ',' (expr) (block)
	
		| 'return' '[' (expr) ']' ';'

		| 'continue' ';'
	
		| (block) ;
	

assign_op:	  '='
		| '+='
	
		| '-=' ;

method_call:      (method_name) '(' '['(expr)+ ',' ']' ')' 
		| (callout) '(' (string_literal) '[' (callout_arg)+ ',' ']' ')' ;

location: 	  (id)

		| (id) '[' (expr) ']' ;

expr: 		  (location)
		| (method_call)
		| (literal)
		| '-'(expr)
		| '!'(expr)
		| '(' (expr) ')' ;

callout_arg: (expr) | (string_literal) ;

bin_op: (arith_op) | (rel_op) | (eq_op) | (cond_op) ;














