
import net.sf.clipsrules.jni.*;

public class getResults {
	
	private Environment clips;
	
	clips = new Environment();
	clips.loadFromResource("programa.clp");
	
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
}
