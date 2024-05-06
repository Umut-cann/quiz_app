
import 'package:translator_plus/translator_plus.dart';
class ceviri {
  final translator = GoogleTranslator();

  Future<String> deneme(String input) async {
    final Translation translation = await translator.translate(input, to: 'tr');
    return translation.toString();
  }
}