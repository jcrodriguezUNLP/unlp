// package creadorDeClases;

import java.util.ArrayList;
import java.util.List;

class Clase {
    private String nombre ;
    private boolean esAbstracta ;
    private Clase claseBase ;
    private List<Variable> variablesPropias ;
    private List<MetodoAbstracto> metodosAbstractos ;

    // Constructores
        public Clase() {
            this.variablesPropias = new ArrayList<>();
            this.metodosAbstractos = new ArrayList<>();
        }

        public Clase( String nombre , boolean esAbstracta , Clase claseBase , List<Variable> variablesPropias , List<MetodoAbstracto> metodosAbstractos ) {
            this.nombre = nombre ;
            this.esAbstracta = esAbstracta ;
            this.claseBase = claseBase ;
            this.variablesPropias = variablesPropias ;
            this.metodosAbstractos = metodosAbstractos ;
        }
    //

    // Getters
        public String getNombre() { return nombre ; }

        public boolean getEsAbstracta() { return esAbstracta ; }

        public Clase getClaseBase() { return claseBase ; }

        public List<Variable> getVariablesPropias() {
            return variablesPropias ;
        }

        public List<MetodoAbstracto> getMetodosAbstractos() {
            return metodosAbstractos ;
        }

        public List<Variable> getVariablesHeredadas() {
            List<Variable> variablesHeredadas = new ArrayList<>() ;
            if( claseBase != null ) {
                variablesHeredadas.addAll( claseBase.getVariablesHeredadas() ) ;
                variablesHeredadas.addAll( claseBase.getVariablesPropias() ) ;
            }
            return variablesHeredadas ;
        }

        public List<MetodoAbstracto> getMetodosAbstractosHeredados() {
            List<MetodoAbstracto> metodosAbstractosHeredados = new ArrayList<>() ;
            if( claseBase != null ) {
                metodosAbstractosHeredados.addAll( claseBase.getMetodosAbstractosHeredados() ) ;
                metodosAbstractosHeredados.addAll( claseBase.getMetodosAbstractos() ) ;
            }
            return metodosAbstractosHeredados ;
        }
    //

    public String generarCodigo() {
        StringBuilder codigo = new StringBuilder() ;

        // Definir la clase
        codigo.append( "public " ) ;
        if( esAbstracta ) {
            codigo.append( "abstract " ) ;
        }
        codigo.append( "class " ).append( nombre ) ;
        if( claseBase != null ) {
            codigo.append( " extends " ).append( claseBase.getNombre() ) ;
        }
        codigo.append( " {\n" ) ;

        // Declarar variables propias
        for( Variable var : variablesPropias ) {
            codigo.append( Sangria.sangria( 1 ) + "private " )
                  .append( var.getTipo() )
                  .append( " " )
                  .append( var.getNombre() )
                  .append( " ;\n" ) ;
        }

        // Constructores
            codigo.append( "\n" + Sangria.sangria( 1 ) + "// Constructores" ) ;
            codigo.append( "\n" + Sangria.sangria( 2 ) + "public " ).append( nombre ).append( "() {}" + "\n" ) ;
            codigo.append( "\n" + Sangria.sangria( 2 ) + "public " ).append( nombre ).append( "( " ) ;

            // Constructor con variables heredadas
            for( int i = 0 ; i < getVariablesHeredadas().size() ; i++ ) {
                Variable var = getVariablesHeredadas().get( i ) ;
                codigo.append( var.getTipo() )
                    .append( " " )
                    .append( var.getNombre() ) ;
                    codigo.append( " , " ) ;
            }

            // Constructor con variables propias
            for( int i = 0 ; i < variablesPropias.size() ; i++ ) {
                Variable var = variablesPropias.get( i ) ;
                codigo.append( var.getTipo() )
                    .append( " " )
                    .append( var.getNombre() ) ;
                if( i < variablesPropias.size() - 1 ) {
                    codigo.append( " , " ) ;
                }
            }

            codigo.append( " ) {\n" ) ;

            // Llamada al constructor de la clase base si existe
            if( claseBase != null ) {
                codigo.append( Sangria.sangria( 3 ) + "super( " ) ;
                for( int i = 0 ; i < getVariablesHeredadas().size() ; i++ ) {
                    Variable var = getVariablesHeredadas().get( i ) ;
                    codigo.append( var.getNombre() ) ;
                    if( i < getVariablesHeredadas().size() - 1 ) {
                        codigo.append( " , " ) ;
                    }
                }
                codigo.append( " ) ;" + "\n" ) ;
            }

            // Asignación de las variables propias
            for( Variable var : variablesPropias ) {
                codigo.append( Sangria.sangria( 3 ) + "this." )
                    .append( var.getNombre() )
                    .append( " = " )
                    .append( var.getNombre() )
                    .append( " ;\n" ) ;
            }
            codigo.append( Sangria.sangria( 2 ) + "}" ) ;
            codigo.append( "\n" + Sangria.sangria( 1 ) + "//" + "\n" ) ;
        //

        // getters
            codigo.append( "\n" + Sangria.sangria( 1 ) + "// Getters" ) ;

            for( Variable var : variablesPropias ) {
                codigo.append( "\n" + Sangria.sangria( 2 ) + "public " )
                      .append( var.getTipo() )
                      .append( " get" )
                      .append( Capitalize.capitalize( var.getNombre() ) )
                      .append( "() { return( " )
                      .append( var.getNombre() )
                      .append( " ) ; }" )
                      .append( "\n" ) ;
            }
            codigo.append( Sangria.sangria( 1 ) + "//\n" ) ;

        //

        // setters
            codigo.append( "\n" + Sangria.sangria( 1 ) + "// Setters" ) ;
        
            for( Variable var : variablesPropias ) {
                codigo.append( "\n" + Sangria.sangria( 2 ) + "public void set" )
                      .append( Capitalize.capitalize( var.getNombre() ) )
                      .append( "( " )
                      .append( var.getTipo() )
                      .append( " " )
                      .append( var.getNombre() )
                      .append( " ) { this." )
                      .append( var.getNombre() )
                      .append( " = " )
                      .append( var.getNombre() )
                      .append( " ; }" )
                      .append( "\n" ) ;
            }
        codigo.append( Sangria.sangria( 1 ) + "//\n" ) ;
        //

        // Métodos
            codigo.append( "\n" + Sangria.sangria( 1 ) + "// Métodos" ) ;

            // abstrctos
            for( MetodoAbstracto metodo : getMetodosAbstractosHeredados() ) {
                codigo.append( "\n" + Sangria.sangria( 2 )+ metodo.generarCodigo() )
                      .append( " {" )
                      .append( "\n" )
                      .append( Sangria.sangria( 3 ) )
                      .append( "return(  ) ;" )
                      .append( "\n" )
                      .append( Sangria.sangria( 2 ) )
                      .append( "}" )
                      .append( "\n" ) ;
            }
            
            for( MetodoAbstracto metodo : metodosAbstractos ) {
                codigo.append( "\n" )
                      .append( Sangria.sangria( 2 ) )
                      .append( "abstract " )
                      .append( metodo.generarCodigo() )
                      .append( " ;\n" ) ;
            }

        //
            codigo.append( "\n" + Sangria.sangria( 2 ) + "@Override" ) ;
            codigo.append( "\n" + Sangria.sangria( 2 ) + "public String toString() {" ) ;
            codigo.append( "\n" + Sangria.sangria( 3 ) + "String texto = \"\" ;\n" ) ;
            //
            
            // Agregar toString de la clase base si tiene
        if( claseBase != null ) {
            codigo.append( "\n" + Sangria.sangria(3) + "texto += ( super.toString() ) ;" ) ;
        }

        // Agregar las variables propias
        for( int i = 0 ; i < variablesPropias.size() ; i++ ) {
            Variable var = variablesPropias.get( i ) ;
            codigo.append( "\n" + Sangria.sangria(3) + "texto += ( \"\\n\" + Sangria.sangria( 1 ) + \"" )
            .append( var.getNombre() )
            .append( ": \" + " )
            .append( var.getNombre() + " ) ;" ) ;
        }

        codigo.append( "\n\n" + Sangria.sangria( 3 ) + "return( texto ) ;"  ) ;
        codigo.append( "\n" + Sangria.sangria( 2 ) + "}" ) ;
        codigo.append( "\n" + Sangria.sangria( 1 ) + "//" ) ;
        codigo.append( "\n" + Sangria.sangria( 0 ) + "}\n" ) ;


        return codigo.toString() ;
    }
}
