import classes.* ;

import javax.swing.JFrame         ;
import javax.swing.SwingUtilities ;

public class App {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            JFrame window = new JFrame() ;

            window.setDefaultCloseOperation ( JFrame.EXIT_ON_CLOSE ) ;
            window.setResizable             (false       ) ;
            window.setTitle                 ("2D Adventure"  ) ;

            GamePanel gamePanel = new GamePanel() ;

            window.add( gamePanel ) ;
            
            window.pack() ;

            window.setLocationRelativeTo (null ) ;
            window.setVisible            (true ) ;

            gamePanel.startGameThread() ;
        }) ;
    }
}
