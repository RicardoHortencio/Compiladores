package decaf;

import java.io.*;
//import antlr.Token;

import java.util.Arrays;
import javax.swing.JFrame;
import javax.swing.JPanel;

import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
//import org.antlr.v4.runtime.tree.ParseTreeWalker;
// import org.atlr.v4.runtime.tree.gui.TreeViewer;
import org.antlr.v4.gui.TreeViewer;

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
						case DecafLexer.CHAR_LITERAL:
		        				type = " CHARLITERAL";
		        				break;							
		        									
						case DecafLexer.INT_LITERAL:
							type = " INTLITERAL";
							break;
						case DecafLexer.STRING_LITERAL:
							type = " STRINGLITERAL";
							break;						
						case DecafLexer.BINOP:
							type = "";
							break;
						case DecafLexer.ID:
		        				type = " IDENTIFIER";
		        				break;
											
						case DecafLexer.RESERVWORD:
							type = "";
							break;	
						
						case DecafLexer.BOOL_LITERAL:
							type = " BOOLEANLITERAL";
							break;
						case DecafLexer.SYMBOLS:
							type = "";
							break;
						case DecafLexer.LCURLY:
							type = "";
							break;
						case DecafLexer.RCURLY:
							type = "";
							break;						
	 					case DecafLexer.PL:
							type = "";
							break;
						case DecafLexer.PR:
							type = "";
							break;
						case DecafLexer.CL:
							type = "";
							break;						
	 					case DecafLexer.CR:
							type = "";
							break;
						case DecafLexer.SAFIRMA:
							type = "";
							break;
						case DecafLexer.REL_OP:
							type = "";
							break;						
	 					case DecafLexer.ASSING_OP:
							type = "";
							break;
						case DecafLexer.EQ_OP:
							type = "";
							break;
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
        	} else if (CLI.target == CLI.INTER) { 
	          DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
		  CommonTokenStream tokens = new CommonTokenStream(lexer);
		  DecafParser parser = new DecafParser(tokens);

		// Create Tree View
		// Source: https://stackoverflow.com/questions/23809005/how-to-display
		
		ParseTree tree = parser.program();

		//show AST in console

		System.out.println(tree.toStringTree(parser));
		
		if(CLI.debug) {
		//show AST in GUI
		JFrame frame = new JFrame("Antlr AST");
		JPanel panel = new JPanel();
		TreeViewer viewr = new TreeViewer(Arrays.asList(
		parser.getRuleNames()),tree);
		viewr.setScale(1.5); //scale a litler
		panel.add(viewr);
		frame.add(panel);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(200,200);
		frame.setVisible(true);

	}
	}


        	
        } catch(Exception e) {
        	// print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}

