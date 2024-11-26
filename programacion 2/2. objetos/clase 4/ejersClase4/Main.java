import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int opcion = 0;

        do {
            // Mostrar el menú
            System.out.println("\nMENU PRINCIPAL:");
            System.out.println("1. Triángulo");
            System.out.println("2. Entrenador");
            System.out.println("3. Micro");
            System.out.println("4. Flota");
            System.out.println("5. Salir");
            System.out.print("Seleccione una opción: ");
            opcion = in.nextInt();
            in.nextLine(); // Consumir el salto de línea

            switch (opcion) {
                case 1:
                    // Triángulo
                    System.out.println("\nTRIANGULO");
                    Triangulo triangulo = new Triangulo(1, 1, Math.sqrt(2), "verde", "rojo");
                    System.out.println("Área del triángulo: " + triangulo.calcularArea());
                    break;

                case 2:
                    // Entrenador
                    System.out.println("\nENTRENADOR");
                    System.out.print("Ingrese Nombre: ");
                    String nombre = in.nextLine();

                    System.out.print("Ingrese Sueldo Básico: ");
                    double sueldoBasico = in.nextDouble();

                    System.out.print("Ingrese Cantidad de Campeonatos Ganados: ");
                    int cantCampeonatosGanados = in.nextInt();
                    in.nextLine(); // Consumir el salto de línea

                    Entrenador entrenador = new Entrenador();
                    entrenador.setNombre(nombre);
                    entrenador.setSueldoBasico(sueldoBasico);
                    entrenador.setCantCampeonatosGanados(cantCampeonatosGanados);

                    System.out.println(entrenador.toString());
                    break;

                case 3:
                    // Micro
                    System.out.println("\nMICRO");
                    System.out.print("Ingrese Patente: ");
                    String patente = in.nextLine();

                    System.out.print("Ingrese Destino: ");
                    String destino = in.nextLine();

                    System.out.print("Ingrese Hora de Salida: ");
                    String horaSalida = in.nextLine();

                    Micro micro = new Micro(patente, destino, horaSalida);

                    int pasajero = 1;
                    int asiento = 0;

                    while (!micro.microLleno() && asiento != -1) {
                        System.out.print("\nPasajero N°" + pasajero + ", asiento: ");
                        asiento = in.nextInt();
                        in.nextLine(); // Consumir el salto de línea

                        if (asiento != -1) {
                            if (!micro.existeAsiento(asiento)) {
                                System.out.println("Asiento inexistente. Primer asiento disponible: " + micro.numeroPrimerAsientoLibre());
                            } else if (micro.asientoLibre(asiento)) {
                                micro.ocuparAsiento(asiento);
                                System.out.println("Reservó el asiento N°" + asiento);
                                pasajero++;
                            } else {
                                System.out.println("Asiento no disponible. Primer asiento disponible: " + micro.numeroPrimerAsientoLibre());
                            }
                        }
                    }
                    System.out.println(micro.toString());
                    break;

                case 4:
                    // Flota
                    Flota flota = new Flota();
                    System.out.println("\nFLOTA");
                    patente = "";
                    destino = "";
                    horaSalida = "";
                    int opcionFlota = 0;

                    do {
                        System.out.println("\nMENU FLOTA:");
                        System.out.println("1. Agregar Micro");
                        System.out.println("2. Eliminar Micro");
                        System.out.println("3. Buscar Micro por Destino");
                        System.out.println("4. Volver al menú principal");
                        System.out.print("Seleccione una opción: ");
                        opcionFlota = in.nextInt();
                        in.nextLine(); // Consumir el salto de línea

                        switch (opcionFlota) {
                            case 1:
                                // Agregar Micro
                                if (!flota.flotaCompleta()) {
                                    System.out.print("Ingrese la patente del micro (o 'ZZZ000' para terminar): ");
                                    patente = in.nextLine();

                                    if (!patente.equals("ZZZ000")) {
                                        System.out.print("Ingrese el destino del micro: ");
                                        destino = in.nextLine();

                                        System.out.print("Ingrese la hora de salida del micro: ");
                                        horaSalida = in.nextLine();

                                        // Método agregarMicro modificado a void
                                        flota.agregarMicro(new Micro(patente, destino, horaSalida));
                                        System.out.println("Micro agregado.");
                                    }
                                } else {
                                    System.out.println("La flota está completa. No se pueden agregar más micros.");
                                }
                                break;

                            case 2:
                                // Eliminar Micro
                                if (!flota.flotaVacia()) {
                                    System.out.print("Ingrese la patente del micro a eliminar: ");
                                    patente = in.nextLine();

                                    // Método eliminarMicroPorPatente modificado a void
                                    flota.eliminarMicroPorPatente(patente);
                                    System.out.println("Micro con patente " + patente + " eliminado.");
                                } else {
                                    System.out.println("La flota está vacía. No se pueden eliminar micros.");
                                }
                                break;

                            case 3:
                                // Buscar Micro por destino
                                if (!flota.flotaVacia()) {
                                    System.out.print("Ingrese el destino del micro a buscar: ");
                                    destino = in.nextLine();

                                    Micro microEncontrado = flota.buscarMicroPorDestino(destino);

                                    if (microEncontrado != null) {
                                        System.out.println("Micro encontrado: Patente: " + microEncontrado.getPatente() +
                                                ", Hora de Salida: " + microEncontrado.getHoraSalida());
                                    } else {
                                        System.out.println("No se encontró un micro que vaya a " + destino + ".");
                                    }
                                } else {
                                    System.out.println("La flota está vacía.");
                                }
                                break;

                            case 4:
                                System.out.println("Volviendo al menú principal...");
                                break;

                            default:
                                System.out.println("Opción no válida. Intente nuevamente.");
                                break;
                        }
                    } while (opcionFlota != 4);
                    break;

                case 5:
                    System.out.println("Saliendo...");
                    break;

                default:
                    System.out.println("Opción no válida. Intente nuevamente.");
                    break;
            }

        } while (opcion != 5);

        in.close(); // Cerrar el Scanner
    }
}
