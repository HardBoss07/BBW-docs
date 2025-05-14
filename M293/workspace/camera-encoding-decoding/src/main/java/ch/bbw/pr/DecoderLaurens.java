package ch.bbw.pr;

import java.util.HashMap;
/**
 * @author <Laurens Hertzer>
 * @version 01.04.2024
 */

public class DecoderLaurens {
    private static final HashMap<String, String> lehrerMap = new HashMap<>();

    static {
        lehrerMap.put("01", "Herr Mock");
        lehrerMap.put("02", "Herr Veselcic");
        lehrerMap.put("03", "Frau Züllig");
        lehrerMap.put("04", "Frau Német");
        lehrerMap.put("05", "Frau Munoz");
        lehrerMap.put("06", "Frau Solenthaler");
        lehrerMap.put("07", "Frau Haueisen");
        lehrerMap.put("08", "Herr Herrmann");
        lehrerMap.put("09", "Herr Vogel");
        lehrerMap.put("10", "Herr Rutschmann");
        lehrerMap.put("11", "Herr Frei");
    }

    public static String decode(String barcode) {
        if (barcode == null || barcode.length() < 12) {
            return "Ungültiger Barcode.";
        }

        String gebaeudeCode = barcode.substring(0, 2);
        String bodenCode = barcode.substring(2, 3);
        String stockwerkCode = barcode.substring(3, 4);
        String zimmerCode = barcode.substring(4, 6);
        String lehrerCode = barcode.substring(6, 8);
        String zeitCode = barcode.substring(8, 12);

        String gebaeude = switch (gebaeudeCode) {
            case "01" -> "BBW";
            case "10" -> "KBW Gebäude A";
            case "11" -> "KBW Gebäude B";
            default -> "Unbekanntes Gebäude";
        };

        String bodenlage = switch (bodenCode) {
            case "0" -> "Unter dem Boden";
            case "1" -> "Über dem Boden";
            default -> "Unbekannte Bodenlage";
        };

        String stockwerk;
        String zimmer;
        if (stockwerkCode.equals("9")) {
            stockwerk = zimmerCode.substring(0, 1);
            zimmer = zimmerCode.substring(1, 2);
        } else {
            stockwerk = stockwerkCode;
            zimmer = zimmerCode;
        }

        String lehrer = lehrerMap.getOrDefault(lehrerCode, "Unbekannter Lehrer");

        String zeit = formatZeitCode(zeitCode);

        return String.join(".", gebaeude, bodenlage, stockwerk, zimmer, lehrer, zeit);
    }

    private static String formatZeitCode(String code) {
        if (code.length() != 4 && code.length() != 8) return "Ungültige Zeit";

        try {
            if (code.length() == 4) {
                return code.substring(0, 2) + ":" + code.substring(2, 4);
            } else {
                return code.substring(0, 2) + ":" + code.substring(2, 4) + "-" +
                        code.substring(4, 6) + ":" + code.substring(6, 8);
            }
        } catch (Exception e) {
            return "Zeitformatierungsfehler";
        }
    }
}