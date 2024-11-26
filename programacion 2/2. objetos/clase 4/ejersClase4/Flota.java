public class Flota {
    private Micro[] micros;
    private int cantidad;
    private int CAPACIDAD = 15;

    // Constructor para crear una flota vacía
    public Flota() {
        micros = new Micro[CAPACIDAD];
        cantidad = 0;
    }

    // getters
    public Micro[] getMicros() {
        return micros;
    }

    // setters
    public void setMicros(Micro[] micros) {
        this.micros = micros;
    }

    // métodos
    // Método para verificar si la flota está completa
    public boolean flotaCompleta() {
        return (cantidad == CAPACIDAD);
    }

    public boolean flotaVacia() {
        return (cantidad == 0);
    }

    // Método para agregar un micro a la flota
    public void agregarMicro(Micro micro) {
        if (!flotaCompleta()) {
            micros[cantidad] = micro;
            cantidad++;
            System.out.println("Micro agregado correctamente.");
        } else {
            System.out.println("Error: la flota está completa, no se pueden agregar más micros.");
        }
    }

    // Método para eliminar un micro por su patente
    public void eliminarMicroPorPatente(String patente) {
        boolean encontrado = false;
        for (int i = 0; i < cantidad; i++) {
            if (micros[i].getPatente().equals(patente)) {
                micros[i] = micros[cantidad - 1]; // Reemplaza el micro eliminado por el último
                micros[cantidad - 1] = null;      // Elimina el último micro
                cantidad--;
                encontrado = true;
                System.out.println("Micro con patente " + patente + " eliminado.");
                break;
            }
        }
        if (!encontrado) {
            System.out.println("Error: no se encontró un micro con la patente " + patente + ".");
        }
    }

    // Método para buscar un micro por su destino
    public Micro buscarMicroPorDestino(String destino) {
        for (int i = 0; i < cantidad; i++) {
            if (micros[i].getDestino().equals(destino)) {
                return micros[i]; // Retorna el micro encontrado
            }
        }
        return null; // No se encontró el micro
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Flota de Micros:\n");
        for (int i = 0; i < cantidad; i++) {
            sb.append(micros[i].toString()).append("\n");
        }
        return sb.toString();
    }
}
