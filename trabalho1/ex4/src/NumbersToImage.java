/**
 * Created by Utilizador on 04/04/2017.
 */

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;

public class NumbersToImage {
    private static int MAX_OF_LETTERS = 26;
    private static int MAX_OF_NUMBERS = 10;
    private static Random rand = new Random();
    private static Color[] color = {Color.GREEN,
            Color.RED, Color.ORANGE,
            Color.BLACK, Color.GRAY,
            Color.BLUE, Color.CYAN,
            Color.MAGENTA};

    public static void main(String[] args) {
        codeCardGenerato("codeCard");
    }

    public static void codeCardGenerato(String fileName) {

        int N = rand.nextInt(MAX_OF_NUMBERS) + 1;
        int Mrnd = rand.nextInt(MAX_OF_LETTERS);
        char M = (char) ('A' + Mrnd);

        // first line
        String text = "";
        for (int i = 1; i <= N; i++)
            text += "   " + i;
        text += " " + '\n';

        BufferedImage img = new BufferedImage(1, 1, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = img.createGraphics();

        Font font = new Font("Consolas", Font.LAYOUT_LEFT_TO_RIGHT, 20);
        g2d.setFont(font);

        FontMetrics fm = g2d.getFontMetrics();
        int width = (int) (fm.stringWidth(text)); // largura
        int height = (int) (fm.getAscent() * (Mrnd + 2.5)); // altura

        img = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        g2d = img.createGraphics();
        g2d.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2d.setRenderingHint(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_COLOR_RENDER_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_DITHERING, RenderingHints.VALUE_DITHER_ENABLE);
        g2d.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS, RenderingHints.VALUE_FRACTIONALMETRICS_ON);
        g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g2d.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_PURE);
        g2d.setFont(font);
        FontMetrics fms = g2d.getFontMetrics();

        int colorIdx = rand.nextInt(color.length);
        g2d.setColor(color[colorIdx]);
        g2d.drawString(text, 0, fms.getAscent());

        char letter = 'A';
        int idx = 1;
        while (letter <= M) {
            text = "" + letter;
            for (int i = 0; i < N; i++){
                int nr = rand.nextInt(999 - 1) + 1;
                if (nr < 10) text += "   " + nr;
                else if (nr < 99) text += "  " + nr;
                else text += " " + nr;
            }
            text += '\n';
            colorIdx = rand.nextInt(color.length);
            g2d.setColor(color[colorIdx]);
            g2d.drawString(text, 0, fms.getAscent() + fm.getAscent() * idx++);
            letter++;
        }
        g2d.setPaint ( new Color(0f,0f,1f,.10f ) );
        g2d.fillRect ( 0, 0, width, height );
        g2d.dispose();
        try {
            // save the image
            ImageIO.write(img, "png", new File(fileName+".png"));
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

}