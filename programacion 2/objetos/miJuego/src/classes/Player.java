package classes;

import java.util.List;

public class Player extends Entity {

    public Player(int worldX, int worldY, int width, int height, double velocidad) {
        super(worldX, worldY, width, height, velocidad);
    }

    @Override
    public void update(KeyHandler keyHandler, List<Block> blocks, double deltaTime) {
        updatePosition(keyHandler, blocks, deltaTime);
    }

    /**
     * Calcula la posición X del jugador en la pantalla.
     * @param screenWidth El ancho de la pantalla.
     * @return La posición X en la pantalla.
     */
    public int getScreenX(int screenWidth) {
        return screenWidth / 2 - width / 2; // Corregido para centrar al jugador en la pantalla
    }

    /**
     * Calcula la posición Y del jugador en la pantalla.
     * @param screenHeight El alto de la pantalla.
     * @return La posición Y en la pantalla.
     */
    public int getScreenY(int screenHeight) {
        return screenHeight / 2 - height / 2; // Corregido para centrar al jugador en la pantalla
    }
}
