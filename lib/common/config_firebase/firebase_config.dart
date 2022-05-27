
import 'package:firebase_core/firebase_core.dart';

class FireBaseConFig {
  FireBaseConFig._init();
  static final FireBaseConFig instance = FireBaseConFig._init();

  Future<FirebaseApp> initFireBase() {
    return Firebase.initializeApp();
  }
}
