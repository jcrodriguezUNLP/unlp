// package creadorDeClases;

public class Sangria {
    // constructores
        public Sangria() {}
    //

    // metodos
        public static String sangria( int cantSangrias ) {
            String sangria = "    " ;

            String texto = "" ;

            for( int i = 0 ; i < cantSangrias ; i++ ) {
                texto += sangria ;
            }

            return texto ;
        }
    //
}