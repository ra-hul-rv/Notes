import 'package:auto_route/auto_route.dart';
import 'package:notes/app/router/router.gr.dart';
import 'package:notes/presentation/feature/home/home.dart';
import 'package:notes/presentation/feature/notes/notes.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, path: HomePage.path),
        AutoRoute(page: NoteRoute.page, path: NotePage.path),
      ];
}