import 'dart:async';
import 'dart:io';

void main() {
  String string = """
   const app = varcro();
   function varcro() {
      return 3;
   }
  """;
  new File('file.js').writeAsString(string);
}
