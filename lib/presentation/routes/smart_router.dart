import 'package:flutter/material.dart';

class SmartRouter {
  final BuildContext _context;

  SmartRouter._internal(this._context);

  factory SmartRouter.of(BuildContext context) =>
      SmartRouter._internal(context);

  Future<void> pushNamed(String route) =>
      Navigator.of(_context).pushNamed(route);

  Future<void> replaceNamed(String route) =>
      Navigator.of(_context).pushReplacementNamed(route);

  Future<void> pushNamedAndRemoveAll(String route) => Navigator.of(_context)
      .pushNamedAndRemoveUntil(route, (_) => false);

  void pop() => Navigator.of(_context).pop();

}
