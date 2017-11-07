CLIPSJNI (Clips Java native Interface)
Descargar la última versión Source Forge del ZIP Clips_jni_xxx.zip

1) Importamos
import net.sf.clipsrules.jni.*;

2) La instacionamos
private Environment clips;

3) Métodos principales para la ejecución del programa

clips = new Environment();
clips.loadFromResource("programa.clp");

// Libera la memoria de los hechos
clips.reset();

String evalString = "(assert (hecho (slot 1 " + valor1 + ")(slot 2 " + valor2 + ")))";

clips.eval(evalString);

// Corre las reglas
clips.run();



============


Obtención de los resultados

// El find-all-facts me busca todos los hechos
String evalstr = "(find-all-facts ((?J resultado_final)) TRUE)";
MultifieldValue pv = (MultifieldValue) clips.eval(evalstr);
FactAddressValue fv = (FactAddressValue) pv.get(0);
String s = null;

try {
	s = fv.getFactSlot("resultado").toString();
} catch (Exception e) {
	e.printStackTrace();
}

