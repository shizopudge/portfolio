import 'package:dartz/dartz.dart';

import '../failure/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
