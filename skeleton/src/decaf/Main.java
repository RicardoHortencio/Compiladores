package decaf;

import java.io.*;
//import antlr.Token;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import java6035.tools.CLI.*;

class Main {
    public static void main(String[] args) {
        try {
        	CLI.parse (args, new String[0]);

        	InputStream inputStream = args.length == 0 ?
                    System.in : new java.io.FileInputStream(CLI.infile);

        	if (CLI.target == CLI.SCAN)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
        		Token token;
        		boolean done = false;
        		while (!done)
        		{
        			try
        			{
		        		for (token=lexer.nextToken(); token.getType()!=Token.EOF; token=lexer.nextToken())
		        		{
		        			String type = "";
		        			String text = token.getText();

		        			switch (token.getType())
		        			{

						case DecafLexer.PROGRAM:
							type = "";
							break;							
		        			case DecafLexer.ID:
		        				type = " IDENTIFIER";
		        				break;
						case DecafLexer.CHAR_LITERAL:
		        				type = " CHARLITERAL";
		        				break;
						case DecafLexer.HEX_DIGIT:
							type = " INTLITERAL";
							break;
						case DecafLexer.DIGIT:
							type = " INTLITERAL";
							break;
						case DecafLexer.BIN_OP:
							type = "";
							break;
						case DecafLexer.BOOL_LITERAL:
							type = " BOOLEANLITERAL";
							break;
						case DecafLexer.STRING_LITERAL:
							type = " STRINGLITERAL";
							break;
						case DecafLexer.RESERVWORD:
							type = " ";
							break;					

						case DecafLexer.CLASS:
							type = "";
							break;
						case DecafLexer.TYPE:
							type = "";
							break;
						case DecafLexer.CALLOUT:
						        type = "";
							break;
						case DecafLexer.ELSE:
							type = "";
							break;
						case DecafLexer.FOR:
							type = "";
							break;
						case DecafLexer.VOID:	
							type = "";
							break;
						case DecafLexer.IF:
						        type = "";
							break;
						case DecafLexer.RETURN:
							type = "";
							break;
						case DecafLexer.BREAK:
							type = "";
							break;
						case DecafLexer.CONTINUE:
							type = "";
							break;
						case DecafLexer.SYMBOLS:

						case DecafLexer.LCURLY:

						case DecafLexer.RCURLY:
						
	 					case DecafLexer.PL:

						case DecafLexer.PR:

						case DecafLexer.CL:
						
	 					case DecafLexer.CR:

						case DecafLexer.SAFIRMA:

						case DecafLexer.REL_OP:
						
	 					case DecafLexer.ASSING_OP:

						case DecafLexer.EQ_OP:

						case DecafLexer.COND_OP:
							type = "";
							break;


		        			}
		        			System.out.println (token.getLine() + type + " " + text);
		        		}
		        		done = true;
        			} catch(Exception e) {

        	        	// print the error:
        	            System.out.println(CLI.infile+" "+e);
        	            lexer.skip();
        	        } 

				


        		}

        	}
        	else if (CLI.target == CLI.PARSE || CLI.target == CLI.DEFAULT)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
				CommonTokenStream tokens = new CommonTokenStream(lexer);
        		DecafParser parser = new DecafParser(tokens);
                parser.program();
        	}
        	
        } catch(Exception e) {
        	// print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}

