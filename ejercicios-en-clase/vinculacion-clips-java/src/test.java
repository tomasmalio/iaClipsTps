import net.sf.clipsrules.jni.*;

public class test {

	final static Environment clips;
	clips = new Environment();
	clips.loadFromResource("programa.clp");
	
	public static void main(String[] args) {
		
		/**
		 *  Libera la memoria de los hechos
		 */
		clips.reset();
		
		/**
		 * Inicialización de variables para insertar
		 */
		String valor1 = ""; 
		String valor2 = "";

		String evalString = "(assert (hecho (slot 1 " + valor1 + ")(slot 2 " + valor2 + ")))";

		clips.eval(evalString);

		/**
		 * Corre las reglas
		 */
		clips.run();
	}
	
	public String getResults() {
		
		/**
		 *  El find-all-facts me busca todos los hechos
		 */
		String evalstr = "(find-all-facts ((?J resultado_final)) TRUE)";
		MultifieldValue pv = (MultifieldValue) clips.eval(evalstr);
		FactAddressValue fv = (FactAddressValue) pv.get(0);
		String s = null;

		try {
			s = fv.getFactSlot("resultado").toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}

}
