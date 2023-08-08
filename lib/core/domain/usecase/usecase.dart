import 'package:equatable/equatable.dart';

import '../../constants/type_defs.dart';

abstract interface class UseCase<T, Params> {
  FutureEither<T> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
