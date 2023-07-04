import 'package:bootcamp/color/color_theme.dart';
import 'package:bootcamp/screen/homePage.dart';
import 'package:bootcamp/screen/loginPage.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
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
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/google.png',
                        width: 100.0,
                        // height: 240.0,
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
                                hintText: "Parolayı tekrar girin",
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
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(8.0),
                      color: ColorTheme().buttonColor,
                      elevation: 0.0,
                      child: MaterialButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        minWidth: MediaQuery.of(context).size.width,
                        child: Text(
                          "Üye Ol",
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
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: Text(
                                    "Google ile üye ol",
                                    style: TextStyle(
                                        fontSize: 16, color: ColorTheme().grey),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: Text(
                                    'Üye olmadan giriş yap',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16, color: ColorTheme().grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: Material(
                                      child: MaterialButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage()),
                                            );
                                          },
                                          child: Image.asset(
                                            "assets/google.png",
                                            width: 45,
                                          ))),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: Material(
                                      child: MaterialButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage()),
                                            );
                                          },
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 45,
                                            color: ColorTheme().buttonColor,
                                          ))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: ColorTheme().border,
                    height: 50,
                  ),
                  Expanded(
                    child: Column(children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Text(
                                  "Zaten hesabınız var mı?",
                                  style: TextStyle(
                                      fontSize: 15, color: ColorTheme().grey),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                    );
                                  },
                                  child: Text(
                                    'Giriş yap',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: ColorTheme().darkBlue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
