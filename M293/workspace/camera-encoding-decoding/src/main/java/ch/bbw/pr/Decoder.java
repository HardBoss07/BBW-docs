package ch.bbw.pr;

/**
 * @author Matteo Bosshard
 * @version 16.04.2025
 */
public class Decoder {

   static public String decode(String barcode) {
      //implement decoding here.
      if (barcode == null || !validate(barcode)) {
         return "INVALID BARCODE";
      }
      String[] splitted = barcode.split("-");
      String result = "";
      for (String s : splitted) {
         result += s + "\n";
      }

      return result;
   }

   static public boolean validate(String barcode) {
      String[] splitted = barcode.split("-");

      if (splitted.length != 6) {
         return false;
      }

      for (int i = 0; i < 2; i++) {
         if (!splitted[i].matches("[a-zA-Z]+")) {
            return false;
         }
      }

      for (int i = 2; i < 6; i++) {
         if (!splitted[i].matches("\\d+")) {
            return false;
         }
      }

      return true;
   }
}
