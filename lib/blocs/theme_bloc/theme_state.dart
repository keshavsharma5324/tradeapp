part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    required ThemeMode themeMode,
  }) = _ThemeState;

  const ThemeState._();

  factory ThemeState.initial() => const ThemeState(themeMode: ThemeMode.system);
  
  @override
  // TODO: implement themeMode
  ThemeMode get themeMode => throw UnimplementedError();
}
