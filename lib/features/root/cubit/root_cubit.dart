import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/failure/failure.dart';
import '../../../core/utils/popup.dart';

part 'root_cubit.freezed.dart';
part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit({required Popup popup})
      : _popup = popup,
        super(const RootState.common());

  final Popup _popup;

  Future<void> launchUrl(String url) async => await _popup.launchUrl(url).then(
        (res) => res.fold(
          (failure) => _emitFailure(failure),
          (r) => null,
        ),
      );

  void _emitFailure(Failure failure) {
    emit(RootState.failure(failure));
    emit(const RootState.common());
  }
}
