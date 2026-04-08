import 'package:aos/features/auth/presentation/widgets/access_denied_widget.dart';
import 'package:flutter/cupertino.dart';

class AccessValidationScreen extends StatelessWidget {
  final bool hasAccess;

  const AccessValidationScreen({required this.hasAccess});

  @override
  Widget build(BuildContext context) {
    return hasAccess
        ? Center(child: Text("Access Granted"))
        : AccessDeniedWidget();
  }
}