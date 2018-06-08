import 'package:flutter/material.dart';

void main() => runApp(new MyApps());

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      title: "Dicoding",
      home: new Page(),
    );
  }
}

class Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PageState();
  }
}

class PageState extends State<Page> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  String kelas = "Menjadi Android Developer Expert";

  void setKelas(String kelas) {
    setState(() {
      this.kelas = kelas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text('Dicoding'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.print),
              onPressed: () {
                scaffoldKey.currentState
                    .showSnackBar(new SnackBar(content: new Text('Print it')));
              },
            ),
            new IconButton(
              icon: new Icon(Icons.vpn_key),
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(
                    new SnackBar(content: new Text('Where the key')));
              },
            )
          ],
        ),
        drawer: new Drawer(
          child: new Column(
            children: <Widget>[
              new Container(
                color: Theme.of(context).primaryColor,
                child: new DrawerHeader(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text("Dicoding Academy",
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              new DrawerItems(
                icon: Icons.book,
                label: "Kelas MADE",
                onClick: () {
                  Navigator.pop(context);
                  setKelas("Menjadi Android Developer Expert");
                },
              ),
              new DrawerItems(
                icon: Icons.book,
                label: "Kelas KADE",
                onClick: () {
                  Navigator.pop(context);
                  setKelas("Kotlin Android Developer Expert");
                },
              ),
              new DrawerItems(
                icon: Icons.book,
                label: "Kelas MGDE",
                onClick: () {
                  Navigator.pop(context);
                  setKelas('Menjadi Game Developer Expert');
                },
              )
            ],
          ),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                'Kamu ikut kelas\n$kelas',
                style: new TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}

class DrawerItems extends StatelessWidget {
  final IconData icon;
  final String label;
  final GestureTapCallback onClick;

  const DrawerItems({this.icon, this.label, this.onClick});

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(label),
      leading: new Icon(icon, color: Theme.of(context).primaryColor),
      onTap: onClick,
    );
  }
}
