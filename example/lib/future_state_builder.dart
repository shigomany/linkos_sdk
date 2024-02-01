import 'package:flutter/material.dart';
import 'package:linkos_sdk_example/utils/future_states.dart';

typedef ArgValueGetter<T, K> = T Function(K value);

class FutureStatesBuilder<T> extends StatelessWidget {
  const FutureStatesBuilder({
    required this.source,
    this.initial,
    this.pending,
    this.failure,
    this.success,
    super.key,
  });

  final FutureStates<T> source;

  final ValueGetter<Widget>? initial;

  final ValueGetter<Widget>? pending;

  final ArgValueGetter<Widget, T>? success;

  final ArgValueGetter<Widget, Object>? failure;

  @override
  Widget build(BuildContext context) {
    return switch (source) {
      InitialFutureState() => initial?.call() ?? const SizedBox.shrink(),
      PendingFutureState() => pending?.call() ?? const SizedBox.shrink(),
      SuccessFutureState(value: final successValue) =>
        success?.call(successValue) ?? const SizedBox.shrink(),
      FailureFutureState(error: final error) =>
        failure?.call(error) ?? const SizedBox.shrink(),
    };
  }
}
