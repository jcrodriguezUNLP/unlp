package classes;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JPanel;

public class GamePanel extends JPanel implements Runnable {

    // Game parameters
    final int originalTileSize = 16;
    final int scale = 3;
    final int tileSize = originalTileSize * scale;
    final int maxScreenCol = 16;
    final int maxScreenRow = 12;
    final int screenWidth = tileSize * maxScreenCol;
    final int screenHeight = tileSize * maxScreenRow;

    KeyHandler keyHandler = new KeyHandler();
    Thread gameThread;
    Player player;
    List<Block> blocks;

    // Game loop timing variables
    long NANOSEC = 1000000000L; // 1 second in nanoseconds
    double deltaTime = 0; // Time between updates
    double tAccumulator = 0;
    double tSlice = 1.0 / 60.0; // 60 ticks per second

    public GamePanel() {
        this.setPreferredSize(new Dimension(screenWidth, screenHeight));
        this.setBackground(Color.black);
        this.setDoubleBuffered(true);
        this.addKeyListener(keyHandler);
        this.setFocusable(true);

        player = new Player(100, 100, tileSize, tileSize, 200);

        blocks = new ArrayList<>();
        blocks.add(new Block(200 , 200 , tileSize     , tileSize     , Color.red    ));
        blocks.add(new Block(400 , 300 , tileSize * 2 , tileSize     , Color.blue   ));
        blocks.add(new Block(50  , 600 , tileSize * 2 , tileSize * 2 , Color.yellow ));
    }

    public void startGameThread() {
        gameThread = new Thread(this);
        gameThread.start();
    }

    @Override
    public void run() {
        long lastTime = System.nanoTime();
        long currentTime ;

        while (gameThread != null) {
            currentTime = System.nanoTime();
            deltaTime = (currentTime - lastTime) / (double) NANOSEC;
            lastTime = currentTime;
            tAccumulator += deltaTime;

            while (tAccumulator > tSlice) {
                update();
                tAccumulator -= tSlice;
            }
            repaint();

            // Sleep to maintain a steady frame rate
            try {
                Thread.sleep(10); // Adjust as necessary
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public void update() {
        player.update(keyHandler, blocks, deltaTime);
    }

    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);

        Graphics2D g2 = (Graphics2D) g;

        for (Block block : blocks) {
            int blockScreenX = block.getX() - player.getWorldX() + (screenWidth / 2 - tileSize / 2);
            int blockScreenY = block.getY() - player.getWorldY() + (screenHeight / 2 - tileSize / 2);

            if (blockScreenX + block.getWidth() > 0 && blockScreenX < screenWidth &&
                blockScreenY + block.getHeight() > 0 && blockScreenY < screenHeight) {
                block.draw(g2, blockScreenX, blockScreenY);
            }
        }

        g2.setColor(Color.white);
        g2.fillRect((screenWidth / 2 - tileSize / 2), (screenHeight / 2 - tileSize / 2), tileSize, tileSize);

        g2.dispose();
    }
}
