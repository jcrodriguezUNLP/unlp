package classes;

import java.awt.Rectangle;
import java.util.List;

public abstract class Entity {
    protected int worldX, worldY;  // Posición en el mundo
    protected int width, height;   // Tamaño de la entidad
    protected double velocidad;    // Velocidad en unidades por segundo

    public Entity(int worldX, int worldY, int width, int height, double velocidad) {
        this.worldX = worldX;
        this.worldY = worldY;
        this.width = width;
        this.height = height;
        this.velocidad = velocidad;
    }

    public int getWorldX() {return worldX;}

    public int getWorldY() {return worldY;}

    public int getWidth() {return width;}

    public int getHeight() {return height;}

    // Método para verificar colisión
    public boolean checkCollision(Entity other) {
        return this.worldX < other.worldX + other.width &&
               this.worldX + this.width > other.worldX &&
               this.worldY < other.worldY + other.height &&
               this.worldY + this.height > other.worldY;
    }

    // Método para actualizar la posición
    public void updatePosition(KeyHandler keyHandler, List<Block> blocks, double deltaTime) {
        double dx = 0;
        double dy = 0;

        if (keyHandler.upPressed) dy -= velocidad * deltaTime;
        if (keyHandler.downPressed) dy += velocidad * deltaTime;
        if (keyHandler.leftPressed) dx -= velocidad * deltaTime;
        if (keyHandler.rightPressed) dx += velocidad * deltaTime;

        // Normalizar el vector de movimiento
        double magnitude = Math.sqrt(dx * dx + dy * dy);
        if (magnitude > 0) {
            dx = (dx / magnitude) * velocidad * deltaTime;
            dy = (dy / magnitude) * velocidad * deltaTime;
        }

        // Calcular la nueva posición en el mundo
        int newWorldX = (int) (worldX + dx);
        int newWorldY = (int) (worldY + dy);

        // Verificar colisiones con los bloques
        for (Block block : blocks) {
            if (new Rectangle(newWorldX, newWorldY, width, height)
                .intersects(block.getBounds())) {
                System.out.println("Colisión detectada con bloque en: " + block.getX() + ", " + block.getY()); // Agrega mensajes de depuración para verificar colisiones
                return;  // Detener movimiento si colisiona
            }
        }

        // Si no hay colisión, actualizar la posición
        worldX = newWorldX;
        worldY = newWorldY;
    }

    public abstract void update(KeyHandler keyHandler, List<Block> blocks, double deltaTime);
}
