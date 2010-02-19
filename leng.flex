import java.lang.System;
import java.io.FileReader;
import java.io.BufferedReader;
class Yytoken {
	public int line;
	public int colu;
	public String tipo;
	public String valor;

	Yytoken (int l, int c, String t, String v){
		line = l;
		colu = c;
		tipo = t;
		valor = v;
	}
	public String toString(){
		return "Token at line "+Integer.toString(line)+" at column "+Integer.toString(colu)+" "+tipo+" value "+valor;

	}
}

%%
%class Lexer
%line
%column
%char

%{  
	public static void main(String argv[]) throws java.io.IOException {
		BufferedReader fr = new BufferedReader(new FileReader(argv[0]));
		Lexer yy = new Lexer(fr);
		Yytoken t;
		while ((t = yy.yylex()) != null)
	    System.out.println(t);
	}
%}

ALPHA=[A-Za-z]
DIGIT=[0-9]
NONNEWLINE_WHITE_SPACE_CHAR=[\ \t\b\012]
WHITE_SPACE_CHAR=[\n\ \t\b\012]
STRING_TEXT=(\\\"|[^\n\"]|\\{WHITE_SPACE_CHAR}+\\)*
COMMENT_TEXT=([^/*\n]|[^*\n]"/"[^*\n]|[^/\n]"*"[^/\n]|"*"[^/\n]|"/"[^*\n])*

%%

<YYINITIAL> "var" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "main" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "=" 			{return (new Yytoken(yyline,yycolumn,"asig" ,yytext()));}
<YYINITIAL> "if" 			{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "elseif" 	{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "else" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "switch" 	{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "case" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "default" {return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "foreach" {return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "do" 			{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "==" 			{return (new Yytoken(yyline,yycolumn,"comp" ,yytext()));}
<YYINITIAL> "{" 			{return (new Yytoken(yyline,yycolumn,"Allave" ,yytext()));}
<YYINITIAL> "}" 			{return (new Yytoken(yyline,yycolumn,"Cllave" ,yytext()));}
<YYINITIAL> "proc" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "return"	{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "void" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "String" 	{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "Int" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "Char" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "Bool" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "Float" 	{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "(" 			{return (new Yytoken(yyline,yycolumn,"Aparen" ,yytext()));}
<YYINITIAL> ")" 			{return (new Yytoken(yyline,yycolumn,"Cparen" ,yytext()));}
<YYINITIAL> "<"		 		{return (new Yytoken(yyline,yycolumn,"menor" ,yytext()));}
<YYINITIAL> "<=" 			{return (new Yytoken(yyline,yycolumn,"menorI" ,yytext()));}
<YYINITIAL>	">" 			{return (new Yytoken(yyline,yycolumn,"mayor" ,yytext()));}
<YYINITIAL> ">=" 			{return (new Yytoken(yyline,yycolumn,"mayorI" ,yytext()));}
<YYINITIAL> "!=" 			{return (new Yytoken(yyline,yycolumn,"dist" ,yytext()));}
<YYINITIAL> "main" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "&&" 			{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "&" 			{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "||" 			{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "|" 			{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "!" 			{return (new Yytoken(yyline,yycolumn,"nega" ,yytext()));}
<YYINITIAL> "true" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "false" 	{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "[" 			{return (new Yytoken(yyline,yycolumn,"Acorc" ,yytext()));}
<YYINITIAL> "]" 			{return (new Yytoken(yyline,yycolumn,"Ccorc" ,yytext()));}
<YYINITIAL> "sub" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "break" 	{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> ";" 			{return (new Yytoken(yyline,yycolumn,"puntco" ,yytext()));}
<YYINITIAL> "," 			{return (new Yytoken(yyline,yycolumn,"coma" ,yytext()));}
<YYINITIAL> ":" 			{return (new Yytoken(yyline,yycolumn,"dospun" ,yytext()));}
<YYINITIAL> "=" 			{return (new Yytoken(yyline,yycolumn,"asig" ,yytext()));}
<YYINITIAL> "+" 			{return (new Yytoken(yyline,yycolumn,"suma" ,yytext()));}
<YYINITIAL> "-" 			{return (new Yytoken(yyline,yycolumn,"resta" ,yytext()));}
<YYINITIAL> "*" 			{return (new Yytoken(yyline,yycolumn,"multi" ,yytext()));}
<YYINITIAL> "/" 			{return (new Yytoken(yyline,yycolumn,"div" ,yytext()));}
<YYINITIAL> "div" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "mod" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "++" 			{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "+=" 			{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "--" 			{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "-=" 			{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> "." 			{return (new Yytoken(yyline,yycolumn,"punto" ,yytext()));}
<YYINITIAL> \"{STRING_TEXT}\" {return (new Yytoken(yyline,yycolumn,"string_text" ,yytext()));}
<YYINITIAL> "ref" 		{return (new Yytoken(yyline,yycolumn,yytext() ,yytext()));}
<YYINITIAL> {DIGIT}+	{return (new Yytoken(yyline,yycolumn,"num",yytext()));}
<YYINITIAL> "in"      {return (new Yytoken(yyline,yycolumn,"in" ,yytext()));}
<YYINITIAL> {ALPHA}({ALPHA}|{DIGIT}|_)*		{return (new Yytoken(yyline,yycolumn,"iden" ,yytext()));}
<YYINITIAL> {NONNEWLINE_WHITE_SPACE_CHAR} {}
<YYINITIAL> .					{System.out.println("No se reconocio "+yytext());}
