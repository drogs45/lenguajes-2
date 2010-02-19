import java_cup.runtime.Symbol;

%%
%class Lexer
%line
%column
%char
%cup

ALPHA=[A-Za-z]
DIGIT=[0-9]
NONNEWLINE_WHITE_SPACE_CHAR=[\ \t\b\012]
WHITE_SPACE_CHAR=[\n\ \t\b\012]
STRING_TEXT=(\\\"|[^\n\"]|\\{WHITE_SPACE_CHAR}+\\)*
COMMENT_TEXT=([^/*\n]|[^*\n]"/"[^*\n]|[^/\n]"*"[^/\n]|"*"[^/\n]|"/"[^*\n])*

%%

<YYINITIAL> "main" 		{return (new Symbol(sym.MAIN);}
<YYINITIAL> "=" 			{return (new Symbol(sym.IGUAL);}
<YYINITIAL> "if" 			{return (new Symbol(sym.IF);}
<YYINITIAL> "elseif" 	{return (new Symbol(sym.ELSEIF);}
<YYINITIAL> "else" 		{return (new Symbol(sym.ELSE);}
<YYINITIAL> "switch" 	{return (new Symbol(sym.SWITCH);}
<YYINITIAL> "case" 		{return (new Symbol(sym.CASE);}
<YYINITIAL> "default" {return (new Symbol(sym.DEFAULT);}
<YYINITIAL> "foreach" {return (new Symbol(sym.FOREACH);}
<YYINITIAL> "do" 			{return (new Symbol(sym.DO);}
<YYINITIAL> "==" 			{return (new Symbol(sym.IGUALIGUAL);}
<YYINITIAL> "{" 			{return (new Symbol(sym.LCORCHETE);}
<YYINITIAL> "}" 			{return (new Symbol(sym.RCORCHETE);}
<YYINITIAL> "proc" 		{return (new Symbol(sym.PROC);}
<YYINITIAL> "return"	{return (new Symbol(sym.RETURN);}
<YYINITIAL> "void" 		{return (new Symbol(sym.VOID);}
<YYINITIAL> "String" 	{return (new Symbol(sym.STRING);}
<YYINITIAL> "Int" 		{return (new Symbol(sym.INT);}
<YYINITIAL> "Char" 		{return (new Symbol(sym.CHAR);}
<YYINITIAL> "Bool" 		{return (new Symbol(sym.BOOL);}
<YYINITIAL> "Float" 	{return (new Symbol(sym.FLOAT);}
<YYINITIAL> "(" 			{return (new Symbol(sym.LPARENTESIS);}
<YYINITIAL> ")" 			{return (new Symbol(sym.RPARENTESIS);}
<YYINITIAL> "<"		 		{return (new Symbol(sym.MENOR);}
<YYINITIAL> "<=" 			{return (new Symbol(sym.MENORIGUAL);}
<YYINITIAL>	">" 			{return (new Symbol(sym.MAYOR);}
<YYINITIAL> ">=" 			{return (new Symbol(sym.MAYORIGUAL);}
<YYINITIAL> "!=" 			{return (new Symbol(sym.DIFERENTE);}
<YYINITIAL> "&&" 			{return (new Symbol(sym.II);}
<YYINITIAL> "&" 			{return (new Symbol(sym.I);}
<YYINITIAL> "||" 			{return (new Symbol(sym.OO);}
<YYINITIAL> "|" 			{return (new Symbol(sym.O);}
<YYINITIAL> "!" 			{return (new Symbol(sym.NEGACION);}
<YYINITIAL> "true" 		{return (new Symbol(sym.TRUE);}
<YYINITIAL> "false" 	{return (new Symbol(sym.FALSE);}
<YYINITIAL> "[" 			{return (new Symbol(sym.LLLAVE);}
<YYINITIAL> "]" 			{return (new Symbol(sym.RLLAVE);}
<YYINITIAL> "sub" 		{return (new Symbol(sym.SUB);}
<YYINITIAL> "break" 	{return (new Symbol(sym.BREAK);}
<YYINITIAL> ";" 			{return (new Symbol(sym.PYC);}
<YYINITIAL> "," 			{return (new Symbol(sym.COMA);}
<YYINITIAL> ":" 			{return (new Symbol(sym.DOSPUNTOS);}
<YYINITIAL> "=" 			{return (new Symbol(sym.IGUAL);}
<YYINITIAL> "+" 			{return (new Symbol(sym.PLUS);}
<YYINITIAL> "-" 			{return (new Symbol(sym.MINUS);}
<YYINITIAL> "*" 			{return (new Symbol(sym.);}
<YYINITIAL> "/" 			{return (new Symbol(sym.);}
<YYINITIAL> "div" 		{return (new Symbol(sym.DIVIDE);}
<YYINITIAL> "mod" 		{return (new Symbol(sym.MOD);}
<YYINITIAL> "++" 			{return (new Symbol(sym.MASMAS);}
<YYINITIAL> "+=" 			{return (new Symbol(sym.MASIGUAL);}
<YYINITIAL> "--" 			{return (new Symbol(sym.MENOSMENOS);}
<YYINITIAL> "-=" 			{return (new Symbol(sym.MENOSIGUAL);}
<YYINITIAL> "." 			{return (new Symbol(sym.PUNTO);}
<YYINITIAL> \"{STRING_TEXT}\" {return (new Symbol(sym.);}
<YYINITIAL> "ref" 		{return (new Symbol(sym.REF);}
<YYINITIAL> {DIGIT}+	{return (new Symbol(sym.ENTERO);}
<YYINITIAL> "in"      {return (new Symbol(sym.IN));}
<YYINITIAL> {ALPHA}({ALPHA}|{DIGIT}|_)*		{return (new Symbol(yyline,yycolumn,"iden" ,yytext()));}
<YYINITIAL> {NONNEWLINE_WHITE_SPACE_CHAR} {}
<YYINITIAL> .					{System.out.println("No se reconocio "+yytext());}
