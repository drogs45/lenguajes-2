import java.util.*;

class AST {
  AST() {
    System.out.println("Creando Arbol Sintactico");
  }

 /* public boolean check() {
    return false;
  }*/

  public int run() {
    return 0;
  }
}

 class ASTUnario extends AST {
  public AST term1; 
  ASTUnario(AST t){
    super(); 
    term1 = t;
  }
}

 class ASTBinario extends AST {
  public AST term1; 
  public AST term2; 
  ASTBinario(AST t, AST t2){ 
    super();
    term1 = t; 
    term2 = t2;
  }
}

 class ASTTernario extends AST {
  public AST term1; 
  public AST term2; 
  public AST term3; 
  ASTTernario(AST t, AST t2, AST t3){
    super(); 
    term1 = t; 
    term2 = t2;
    term3 = t3;
  }
}

 class ASTMultiple extends AST {
  public Vector<AST> term;

  ASTMultiple(Vector<AST> t) {
    super(); 
    term = t;
  }

  ASTMultiple(AST t) {
    super();
    term = new Vector<AST>();
    term.add(t); 
  }

  ASTMultiple() {
    super(); 
    term = new Vector<AST>();
  }

  void insertaHijo(AST h) {
    term.add(h);
  }
}

//Enteros
class ASTSuma extends ASTBinario {

  ASTSuma(AST t, AST t2){
    super(t, t2); 
  }

   public int run() {
    int t1 =  this.term1.run();
    int t2 =  this.term2.run();
    return t1 + t2;
  }
}

class ASTResta extends ASTBinario {

  ASTResta(AST t, AST t2){
    super(t, t2); 
  }

   public int run() {
    int t1 =  this.term1.run();
    int t2 =  this.term2.run();
    return t1 - t2;
  }
}

class ASTMult extends ASTBinario {

  ASTMult(AST t, AST t2){
    super(t, t2); 
  }

   public int run() {
    int t1 =  this.term1.run();
    int t2 =  this.term2.run();
    return t1 * t2;
  }
}

class ASTDiv extends ASTBinario {

  ASTDiv(AST t, AST t2){
    super(t, t2); 
  }

   public int run() {
    int t1 =  this.term1.run();
    int t2 =  this.term2.run();
    return t1 / t2;
  }
}

class ASTResUnario extends ASTBinario {

  ASTResUnario (AST t, AST t2){
    super(t, t2); 
  }

   public int run() {
    int t1 =  this.term1.run();
    return -t1;
  }
}

class ASTBool extends ASTBinario {
  ASTBool(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTConj extends ASTBool {
  ASTConj(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTDisy extends ASTBool {
  ASTDisy(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTConjC extends ASTBool {
  ASTConjC(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTDisyC extends ASTBool {
  ASTDisyC(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTNeg extends ASTUnario {
  ASTNeg(AST t){
    super(t); 
  } 
}

class ASTLess extends ASTBool {
  ASTLess(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTLeq extends ASTBool {
  ASTLeq(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTGreat extends ASTBool {
  ASTGreat(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTGeq extends ASTBool {
  ASTGeq(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTEqual extends ASTBool {
  ASTEqual(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTDif extends ASTBool {
  ASTDif(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTProc extends ASTMultiple {
  public NameTable tabla;

  ASTProc(AST tipo, AST parametros,AST instrucciones){
    super();
    term.add(tipo);
    term.add(parametros);
    term.add(instrucciones);
  }
}

class ASTReturnUnario extends ASTUnario {
  ASTReturnUnario(AST t){
    super(t); 
  } 
}

class ASTReturn extends AST {
  ASTReturn(){
    super(); 
  } 
}

class ASTAsigArray extends ASTTernario {
  ASTAsigArray(AST t, AST t2, AST t3){
    super(t, t2, t3); 
  } 
}

class ASTAsig extends ASTBinario {
  ASTAsig(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTIf extends ASTBinario {
  ASTIf(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTWhile extends ASTUnario {
  ASTWhile(AST t){
    super(t); 
  } 
}

class ASTForHeader extends ASTTernario {
  ASTForHeader(AST t, AST t2, AST t3){
    super(t, t2, t3); 
  } 
}

class ASTFor extends ASTBinario {
  ASTFor(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTForEachHeader extends ASTTernario {
  ASTForEachHeader(AST t, AST t2, AST t3){
    super(t, t2, t3); 
  } 
}

class ASTForEach extends ASTBinario {
  ASTForEach(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTExpBool extends ASTUnario {
  ASTExpBool(AST t){
    super(t); 
  } 
}

class ASTMASMAS extends ASTUnario {
  ASTMASMAS(AST t){
    super(t); 
  } 
}

class ASTMENOSMENOS extends ASTUnario {
  ASTMENOSMENOS(AST t){
    super(t); 
  } 
}

class ASTMASIGUAL extends ASTBinario {
  ASTMASIGUAL(AST t, AST t2){
    super(t, t2); 
  } 
}

class ASTMENOSIGUAL extends ASTBinario {
  ASTMENOSIGUAL(AST t, AST t2){
    super(t, t2); 
  } 
}



class SymTable {
  HashTable table;

  public SymTable () {
  table = new Hashtable();
  }

  public HashTable getTable(){
    return table;
  }

  void insert(String str, Sym s1){
    table.put(str, s1);
  }

  Object find(String str){
    return table.get(str); 
  }

  void merge(SymTable st1, SymTable st2){
    st1.getTable().putAll(st2.getTable()); 
  }
}
