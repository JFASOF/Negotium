import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamanisinde/model/kullanici.dart';
import 'package:zamanisinde/routes.dart';
import 'package:zamanisinde/screen/isVeren_screens/profil.dart';
import 'package:zamanisinde/services/auth.dart';

// import 'package:main/services/auth.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  bool _showProfile = false;
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Kullanici>(context);
    if (_showProfile) {
      return Profile();
    }
    return new Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 17.0, 15.0, 17.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 15.0),
                InkWell(
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://source.unsplash.com/random/100x100'),
                        )),
                  ),
                ),
                SizedBox(width: 22.0),
                Spacer(),
                Column(children: <Widget>[
                  SizedBox(
                    width: 140.0,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        user.isim + " " + user.sIsim,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 23.0,
                            color: Colors.grey.shade900),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 105.0,
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          user.sehir + ", " + user.bolge,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontStyle: FontStyle.italic,
                              fontSize: 22.0,
                              color: Colors.grey.shade800),
                        )),
                  ),
                ]),
                Spacer(flex: 2),
                IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.grey.shade700,
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.5,
            indent: 10.0,
            endIndent: 10.0,
          ),
          Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Hesap Ayarları',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800),
                    ),
                  ])),
          infoCard("Kişisel Bilgiler", Icons.account_circle, () {
            setState(() {
              _showProfile = true;
            });
          }),
          infoCard("Ödeme Bilgileri", Icons.attach_money, () {
            Yonlendirici.sailor.navigate("/construction");
          }),
          infoCard("Bildirimler", Icons.notifications, () {
            Yonlendirici.sailor.navigate("/construction");
          }),
          Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Text(
                      'Çalışan Bilgileri',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800),
                    ),
                  ])),
          infoCard("Referanslar", Icons.attach_file, () {
            Yonlendirici.sailor.navigate("/construction");
          }),
          infoCard("Geçmiş İşler", Icons.group, () {
            Yonlendirici.sailor.navigate("/construction");
          }),
          Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Text(
                      'Yasal',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800),
                    ),
                  ])),
          infoCard("Şartlar ve koşullar", Icons.assignment, () {
            Yonlendirici.sailor.navigate("/construction");
          }),
          infoCard("Çıkış Yap", Icons.exit_to_app, () => _auth.signOut()),
          Padding(
            padding: EdgeInsets.fromLTRB(25.0, 7.0, 25.0, 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Negotium © 2021',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 5.0)
              ],
            ),
          ),
        ],
      ),
    );
  }

// cards
  Widget infoCard(String info, IconData icon, Function callback) {
    return Column(
      children: <Widget>[
        Card(
            elevation: 0.0,
            margin: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
            child: InkWell(
              onTap: () {
                callback();
              },
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          info,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Icon(icon)
                      ],
                    ),
                  ],
                ),
              ),
            )),
        Divider(
          color: Colors.grey.shade500,
          indent: 20.0,
          endIndent: 20.0,
        )
      ],
    );
  }
}
