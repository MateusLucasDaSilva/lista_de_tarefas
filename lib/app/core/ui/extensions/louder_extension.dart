import 'package:flutter/material.dart';

extension LoaderStatefulExtension on StatefulWidget {
  showLoader(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}

extension LoaderStatelessExtension on StatelessWidget {
  showLoader(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
