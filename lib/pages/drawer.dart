import 'package:flutter/material.dart';
import '../widgets/link_text_span.dart';

class MyDrawerHeader extends StatefulWidget {
  _MyDrawerHeaderState createState() => new _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return new Drawer();
  }
}

class MyDrawer extends StatefulWidget {


  _MyDrawerState createState() => new _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  /// open import local screen
  void openImportLocalScreen() {
    Navigator.pushNamed(context, 'importLocal');
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle aboutTextStyle = themeData.textTheme.body2;
    final TextStyle linkStyle =
        themeData.textTheme.body2.copyWith(color: themeData.accentColor);

    /// import local books
    final Widget importBooksItem = new ListTile(
      leading: new Container(
          margin: const EdgeInsets.only(left: 8.0),
          child: new Icon(Icons.system_update_alt)),
      title: const Text('本地导入'),
      onTap: openImportLocalScreen,
    );

    /// about light
    final Widget aboutItem = new AboutListTile(
      icon: new Container(
          margin: const EdgeInsets.only(left: 8.0),
          child: const Icon(Icons.info)),
      applicationIcon: new Container(
        height: 85.0,
        width: 70.0,
        decoration: new BoxDecoration(
            image: new DecorationImage(
                fit: BoxFit.fitHeight,
                repeat: ImageRepeat.noRepeat,
                image: new AssetImage('assets/images/logo.png'))),
      ),
      applicationName: 'Light',
      applicationVersion: 'V0.0.1 2018.5.1',
      applicationLegalese: '© 2018 Yotaku',
      aboutBoxChildren: <Widget>[
        new RichText(
            text: new TextSpan(children: <TextSpan>[
          new TextSpan(style: aboutTextStyle, text: 'Light是一个开源的轻小说阅读APP。'),
          new TextSpan(style: aboutTextStyle, text: '点击查看'),
          new LinkTextSpan(
              url: 'https://github.com/creatint/light',
              style: linkStyle,
              text: '源码'),
        ]))
      ],
    );

    final List<Widget> allDrawerItems = <Widget>[];

    allDrawerItems.add(importBooksItem);
    allDrawerItems.add(aboutItem);

    return new Drawer(
        child: new ListView(primary: false, children: allDrawerItems));
  }
}