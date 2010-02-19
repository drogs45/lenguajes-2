import java.lang.System;

class YYtoken {
	public int line;
	public int colu;
	public String tipo;
	public String valor;

	YYtoken (int l, int c, String t, String v){
		line = l;
		colu = c;
		tipo = t;
		valor = v;
	}
	
	public String toString(){
		return "Token at line "+Integer.toString(line)+" at column "+Integer.toString(colu)+" kind "+tipo+" value "+valor;

	}
/*	public static void main (String[] argv) {
		YYtoken p = new YYtoken(Integer.parseInt(argv[0]),Integer.parseInt(argv[1]),argv[2],argv[3]);
		System.out.println(p.toString());

	}
*/
}
