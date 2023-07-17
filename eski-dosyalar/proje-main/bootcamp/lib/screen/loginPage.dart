import 'package:bootcamp/color/color_theme.dart';
import 'package:bootcamp/screen/homePage.dart';
import 'package:bootcamp/screen/registerPage.dart';
import 'package:bootcamp/screen/splashScreen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Container(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Hoşgeldiniz  👋',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: ColorTheme().black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Image.asset(
                            'assets/logo.png',
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Center(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.withOpacity(0.2),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: ListTile(
                            title: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.withOpacity(0.2),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: ListTile(
                            title: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Parola",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none),
                            ),
                            trailing: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {});
                                }),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Text(
                            "Beni Hatırla",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: ColorTheme().black,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(130, 16, 16, 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {}, //şifremi unuttum işlemi için
                                  child: Text(
                                    "Şifremi unuttum",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: ColorTheme().redAccent,
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: ColorTheme().khmerCurry,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()),
                            );
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Giriş",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          ),
                        ),
                      ),
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: ColorTheme().border,
                        height: 50,
                      )),
                      Text("Ya da"),
                      Expanded(
                          child: Divider(
                        color: ColorTheme().border,
                        height: 50,
                      )),
                    ]),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  14.0, 8.0, 14.0, 8.0),
                              child: Text(
                                "Google ile giriş yap",
                                style: TextStyle(
                                    fontSize: 16, color: ColorTheme().grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  14.0, 8.0, 14.0, 8.0),
                              child: Text(
                                'Üye olmadan giriş yap',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, color: ColorTheme().grey),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  14.0, 8.0, 14.0, 8.0),
                              child: Material(
                                  child: MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SplashScreen()),
                                        );
                                      },
                                      child: Image.asset(
                                        "assets/google.png",
                                        width: 45,
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  14.0, 8.0, 14.0, 8.0),
                              child: Material(
                                  child: MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SplashScreen()),
                                        );
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 45,
                                        color: ColorTheme().khmerCurry,
                                      ))),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: ColorTheme().border,
                      height: 50,
                    ),
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Text(
                              "Hesabınız yok mu?",
                              style: TextStyle(
                                  fontSize: 16, color: ColorTheme().grey),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                );
                              },
                              child: Text(
                                'Hesap Oluşturun',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, color: ColorTheme().darkBlue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
