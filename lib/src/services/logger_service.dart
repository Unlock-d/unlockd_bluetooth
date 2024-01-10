import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:unlockd_bluetooth/src/domain/file_reader_domain.dart';

Either<EXCEPTION, VALUE>
    logException<EXCEPTION extends FileHandlingException, VALUE>(
  Either<EXCEPTION, VALUE> either,
) =>
        either.match<Either<EXCEPTION, VALUE>>(
          (l) => Either.left(l)..mapLeft(_logException),
          Either.right,
        );

FileHandlingException _logException(FileHandlingException o) {
  debugPrintStack(stackTrace: o.stackTrace, label: o.cause.toString());
  return o;
}
