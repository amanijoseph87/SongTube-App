import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songtube/internal/languages.dart';
import 'package:songtube/internal/nativeMethods.dart';
import 'package:songtube/provider/app_provider.dart';

class DownloadFixDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      title: Text(
        Languages.of(context).labelAndroid11Detected,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1.color,
        ),
      ),
      content: Text(
        Languages.of(context).labelAndroid11DetectedJustification,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1.color,
        ),
      ),
      actions: [
        FlatButton(
          child: Text(
            "Allow",
            style: TextStyle(
              color: Theme.of(context).accentColor
            ),
          ),
          onPressed: () {
            NativeMethod.requestAllFilesPermission();
            Provider.of<AppDataProvider>(context, listen: false).showDownloadFixDialog = false;
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text(
            "Not Now",
            style: TextStyle(
              color: Theme.of(context).accentColor
            ),
          ),
          onPressed: () => Navigator.pop(context)
        )
      ],
    );
  }
}