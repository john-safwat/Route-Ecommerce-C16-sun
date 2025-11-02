import 'package:flutter/cupertino.dart';

extension WhiteSpace on num {
  Widget get spaceVertical => SizedBox(height: toDouble());

  Widget get spaceHorizontal => SizedBox(width: toDouble());

  Widget get space => SizedBox(height: toDouble(), width: toDouble());
}
