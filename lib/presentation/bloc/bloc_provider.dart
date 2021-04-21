//code taken from https://www.didierboelens.com/2018/12/reactive-programming---streams---bloc---practical-use-cases/#1-bloc-provider-and-inheritedwidget
import 'package:flutter/material.dart';

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  const BlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
  }) : super(key: key);

  final Widget child;
  final T bloc;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T? of<T extends BlocBase>(BuildContext context) {
    final widgetElement = context
        .getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>();
    if (widgetElement != null) {
      final _BlocProviderInherited<T> provider =
          widgetElement.widget as _BlocProviderInherited<T>;
      return provider.bloc;
    } else {
      return null;
    }
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    print('bloc provider disposing ${widget.bloc}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  const _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
