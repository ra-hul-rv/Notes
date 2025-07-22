// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:notes/domain/model/note.dart' as _i5;
import 'package:notes/presentation/feature/home/home.dart' as _i1;
import 'package:notes/presentation/feature/notes/notes.dart' as _i2;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.NotePage]
class NoteRoute extends _i3.PageRouteInfo<NoteRouteArgs> {
  NoteRoute({_i4.Key? key, _i5.Note? note, List<_i3.PageRouteInfo>? children})
    : super(
        NoteRoute.name,
        args: NoteRouteArgs(key: key, note: note),
        initialChildren: children,
      );

  static const String name = 'NoteRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoteRouteArgs>(
        orElse: () => const NoteRouteArgs(),
      );
      return _i2.NotePage(key: args.key, note: args.note);
    },
  );
}

class NoteRouteArgs {
  const NoteRouteArgs({this.key, this.note});

  final _i4.Key? key;

  final _i5.Note? note;

  @override
  String toString() {
    return 'NoteRouteArgs{key: $key, note: $note}';
  }
}
