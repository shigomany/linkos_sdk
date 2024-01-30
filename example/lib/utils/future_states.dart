sealed class FutureStates<T> {
  final T? value;

  const factory FutureStates.initial() = InitialFutureState;

  const factory FutureStates.pending() = PendingFutureState;

  const factory FutureStates.success({required T value}) = SuccessFutureState;

  const factory FutureStates.failure() = FailureFutureState;

  const FutureStates._(this.value);
}

final class InitialFutureState<T> extends FutureStates<T> {
  const InitialFutureState() : super._(null);
}

final class PendingFutureState<T> extends FutureStates<T> {
  const PendingFutureState() : super._(null);
}

final class SuccessFutureState<T> extends FutureStates<T> {
  const SuccessFutureState({required T value}) : super._(value);
}

final class FailureFutureState<T> extends FutureStates<T> {
  const FailureFutureState() : super._(null);
}
