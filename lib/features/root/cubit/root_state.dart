part of 'root_cubit.dart';

@freezed
class RootState with _$RootState {
  const factory RootState.common() = _Common;
  const factory RootState.failure(Failure failure) = _Error;
}
