package classes;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;

public class Block {
    private final int x, y, width, height; // Hacer los atributos finales si no cambian
    private final Color color;

    public Block(int x, int y, int width, int height, Color color) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.color = color;
    }

    /**
     * Obtiene los límites del bloque como un objeto Rectangle.
     * @return Rectangle que representa los límites del bloque.
     */
    public Rectangle getBounds() {
        return new Rectangle(x, y, width, height);
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public int getWidth() {
        return width;
    }

    public int getHeight() {
        return height;
    }

    /**
     * Dibuja el bloque en la pantalla.
     * @param g El contexto gráfico.
     * @param screenX La posición X en la pantalla.
     * @param screenY La posición Y en la pantalla.
     */
    public void draw(Graphics g, int screenX, int screenY) {
        g.setColor(color);
        g.fillRect(screenX, screenY, width, height);
    }
}
