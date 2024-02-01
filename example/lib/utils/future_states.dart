sealed class FutureStates<T> {
  const factory FutureStates.initial() = InitialFutureState;

  const factory FutureStates.pending() = PendingFutureState;

  const factory FutureStates.success({required T value}) = SuccessFutureState;

  const factory FutureStates.failure({required Object error}) =
      FailureFutureState;

  const FutureStates._();
}

final class InitialFutureState<T> extends FutureStates<T> {
  const InitialFutureState() : super._();
}

final class PendingFutureState<T> extends FutureStates<T> {
  const PendingFutureState() : super._();
}

final class SuccessFutureState<T> extends FutureStates<T> {
  final T value;

  const SuccessFutureState({required this.value}) : super._();
}

final class FailureFutureState<T> extends FutureStates<T> {
  final Object error;

  const FailureFutureState({required this.error}) : super._();
}
