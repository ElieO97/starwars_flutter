import 'package:flutter/material.dart';
import 'package:star_wars_flutter/ui/home/home_screen.dart';
import 'package:star_wars_flutter/ui/router/ui_pages.dart';

class StarWarsRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final List<Page> _pages = <Page>[];

  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final bool didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    _pages.remove(route.settings);
    notifyListeners();

    return true;
  }

  void _removePage(Page page) {
    if (page != null) {
      _pages.remove(page);
    }
    notifyListeners();
  }

  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration pageData) {
    _pages.clear();
    addPage(pageData);
    return Future.value(null);
  }

  MaterialPage<dynamic> _createPage(
      Widget child, PageConfiguration pageConfig) {
    return MaterialPage<dynamic>(
        child: child,
        key: Key(pageConfig.key) as LocalKey,
        name: pageConfig.path,
        arguments: pageConfig);
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    print('_addPageData called before = ${_pages.length}');
    _pages.add(
      _createPage(child, pageConfig),
    );
    print('_addPageData called after = ${_pages.length}');
  }

  void addPage(PageConfiguration pageConfig) {
    final bool shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfig.uiPage;

    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.Movies:
          _addPageData(const HomeScreen(), MoviesPageConfig);
          break;

        default:
          break;
      }

      notifyListeners();
    }
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
    notifyListeners();
  }

  void replaceAll(PageConfiguration newRoute) {
    setNewRoutePath(newRoute);
  }

  void push(PageConfiguration newRoute) {
    addPage(newRoute);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    print('pushWidget called');
    _addPageData(child, newRoute);
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: List.of(_pages),
    );
  }
}
