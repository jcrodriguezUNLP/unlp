package classes ;

import java.awt.event.KeyListener ;
import java.awt.event.KeyEvent    ;

public class KeyHandler implements KeyListener {
    public boolean upPressed, downPressed, leftPressed, rightPressed;

    // @Override
    // public void keyTyped(KeyEvent e) {
    //     // No se necesita implementar este método para este caso
    // }

    @Override
    public void keyPressed(KeyEvent e) {
        int code = e.getKeyCode();

        switch (code) {
            case KeyEvent.VK_W -> {
                upPressed = true;
                System.out.println("Tecla W presionada"); // Agrega mensajes de depuración para verificar entradas de teclado
            }
            case KeyEvent.VK_A -> {
                leftPressed = true;
                System.out.println("Tecla A presionada");
            }
            case KeyEvent.VK_S -> {
                downPressed = true;
                System.out.println("Tecla S presionada");
            }
            case KeyEvent.VK_D -> {
                rightPressed = true;
                System.out.println("Tecla D presionada");
            }
        }
    }

    @Override
    public void keyReleased(KeyEvent e) {
        int code = e.getKeyCode();

        switch (code) {
            case KeyEvent.VK_W -> {
                upPressed = false;
                System.out.println("Tecla W liberada");
            }
            case KeyEvent.VK_A -> {
                leftPressed = false;
                System.out.println("Tecla A liberada");
            }
            case KeyEvent.VK_S -> {
                downPressed = false;
                System.out.println("Tecla S liberada");
            }
            case KeyEvent.VK_D -> {
                rightPressed = false;
                System.out.println("Tecla D liberada");
            }
        }
    }
}
