import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/app_global/app_global.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/theme/theme_constantes.dart';

import '../../../domain/entities/app_message/app_message.dart';
import '../../../domain/entities/failure/failure.dart';

class AppToast extends StatefulWidget {
  final int secondsDuration;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  const AppToast({
    required this.secondsDuration,
    required this.scaffoldMessengerKey,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AppToastState createState() => _AppToastState();
}

class _AppToastState extends State<AppToast> {
  bool _show = false;
  Failure? _failure;
  AppMessage? _message;
  int _count = 0;
  Timer _timer = Timer(const Duration(seconds: 0), () {});

  bool get _canRenderWidget => _show && (_failure != null || _message != null);

  @override
  void initState() {
    super.initState();
    _listenFailures();
    _listenAppMessages();
  }

  void _clearState() {
    setState(() {
      _timer = Timer(const Duration(seconds: 0), () {});
      _count = 0;
      _show = false;
    });
  }

  @override
  void didUpdateWidget(covariant AppToast oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_show && mounted) {
      _timer.cancel();
      _clearState();
    }
  }

  void _onTimer(Timer timer) {
    if (mounted) {
      if (_count >= widget.secondsDuration) {
        _timer.cancel();
        setState(() {
          _show = false;
        });
      } else {
        setState(() {
          _count++;
        });
      }
    }
  }

  void _initializeFailureState(Failure failure) {
    setState(() {
      _count = 0;
      _show = true;
      _failure = failure;
      _message = null;
    });
  }

  void _initializeMessageState(AppMessage message) {
    setState(() {
      _count = 0;
      _show = true;
      _failure = null;
      _message = message;
    });
  }

  void _clearFailureState() {
    _timer = Timer(const Duration(seconds: 0), () {});
    setState(() {
      _failure = null;
    });
  }

  void _listenFailures() {
    AppGlobal.instance.streamError.stream.listen((Failure? failure) {
      if (failure != null) {
        _timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
        _initializeFailureState(failure);
      } else {
        _clearFailureState();
      }
    });
  }

  void _listenAppMessages() {
    AppGlobal.instance.streamMessage.stream.listen((AppMessage message) {
      _timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
      _initializeMessageState(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    final BuildContext? appContext =
        widget.scaffoldMessengerKey.currentState?.context;
    return _canRenderWidget && appContext != null
        ? Container(
            width: MediaQuery.of(appContext).size.width -
                ThemeConstants.halfPadding,
            margin: EdgeInsets.only(
              top: MediaQuery.of(appContext).padding.top +
                  ThemeConstants.minPadding,
              left: ThemeConstants.minPadding,
              right: ThemeConstants.minPadding,
            ),
            padding: const EdgeInsets.all(ThemeConstants.padding),
            decoration: BoxDecoration(
              color: _backgroundColor(appContext),
              borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                _makeText(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
              ),
            ),
          )
        : const SizedBox();
  }

  Color _backgroundColor(BuildContext appContext) => _message == null
      ? Theme.of(appContext).colorScheme.error
      : _message!.type.backgroundColor;

  String _makeText() {
    if (_message?.message != null) {
      return _message!.message;
    }

    return _failure!.message ?? '';
  }
}
