package ch.bbw.pr;

import java.util.HashMap;

/**
 * @author Matteo Bosshard
 * @version 16.04.2025
 */
public class Formatter {
    static private String[] format_parts = {"City Code: ", "Parkhaus-Code: ", "Parkdeck: ", "Parkplatz: ", "Mietstart: ", "Mietende: "};

    static private HashMap<String, String> cityCodes = new HashMap<>();
    static private HashMap<String, String> parkCodes = new HashMap<>();

    static {
        cityCodes.put("WINT", "Winterthur");
        cityCodes.put("ZURH", "Zürich");
        cityCodes.put("BRLN", "Berlin");
        cityCodes.put("WIEN", "Wien");

        parkCodes.put("HB", "Hauptbahnhof");
        parkCodes.put("NO", "Nord");
        parkCodes.put("EA", "Ost");
        parkCodes.put("SO", "Süd");
        parkCodes.put("WE", "West");
        parkCodes.put("RB", "Rosenberg");
        parkCodes.put("NW", "Neuwiesen");
        parkCodes.put("TK", "Technikum");
    }

    static public String format(String barcode) {
        String result = barcode + "\n";
        String[] split = barcode.split("-");

        for (int i = 0; i < 6; i++) {
            StringBuilder builder = new StringBuilder();
            builder.append(format_parts[i]);
            builder.append(split[i]);

            if (i == 0) {
                builder.append(" (");
                builder.append(cityCodes.get(split[0]));
                builder.append(")");
            }
            if (i == 1) {
                builder.append(" (");
                builder.append(parkCodes.get(split[1]));
                builder.append(")");
            }

            builder.append("\n");
            result += builder.toString();
        }

        return result;
    }
}
