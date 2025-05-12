import 'package:hadith/controller/counter_ctrl.dart';
import 'package:hadith/service/shared.dart';

Future<void> startProgram() async {
  final isFirstInstall = await Shared.runOnlyOnFirstInstall();
  if (isFirstInstall) {
    CounterCtrl().saveAzkarInShred();
  }
}
