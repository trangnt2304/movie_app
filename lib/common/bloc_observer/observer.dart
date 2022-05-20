import 'package:bloc/bloc.dart';

class Observer extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    print('${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('${bloc.runtimeType} ${event.runtimeType}');
    super.onEvent(bloc, event);
  }
}