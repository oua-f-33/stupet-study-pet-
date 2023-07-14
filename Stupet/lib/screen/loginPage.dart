import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stupet/screen/homePage.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/registerPage.dart';
import 'package:stupet/screen/splashScreen.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();

  final firebaseAuth = FirebaseAuth.instance;
  bool isChecked = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  Future<UserCredential> _signInWithGoogle() async {
    // Google ile giriş yapma işlemi
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
    await firebaseAuth.signInWithCredential(credential);
    return userCredential;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(

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
                padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 0),
                child: Form(
                  key: formkey,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, right: 0, left: 0),
                    child: Column(
                      children: [
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "E-mail kısmı boş bırakılmaz";
                                    } else {}
                                  },
                                  onSaved: (value) {
                                    email = value!;
                                  },
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Lütfen şifrenizi giriniz";
                                    } else {}
                                  },
                                  onSaved: (value) {
                                    password = value!;
                                  },
                                  obscureText: true,
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
                                padding: const EdgeInsets.fromLTRB(80, 16, 16, 16),
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
                        Padding(padding: EdgeInsets.only(top: 20)),
                        TextButton(
                          onPressed: signIn,
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,


                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorTheme().khmerCurry,),
                            child: Center(
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
                        Padding(padding: EdgeInsets.only(top: 25)),
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
                                      5.0, 8.0, 14.0, 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _signInWithGoogle().then((UserCredential userCredential) {
                                        // Giriş başarılı, kullanıcıyı ana sayfaya yönlendirin veya gerekli işlemleri yapın.
                                      }).catchError((e) {
                                        print(e.message);
                                      });
                                    },
                                    child: Text('Google İle Giriş Yap'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      5.0, 8.0, 14.0, 8.0),
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
                                      0.0, 0.0, 40.0, 8.0),
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
              )
            ],
          ),
        ),
      ),
    );
  }




  void signIn() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      try {
        final userResult = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
        print(userResult.user!.email);
      } catch (e) {
        print(e.toString());
      }
    } else {}
  }

  Container topImageContainer(double height, String topImage) {
    return Container(
      height: height * .25,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(topImage),
        ),
      ),
    );
  }

  Widget customSizedBox() => SizedBox(
    height: 20,
  );

  Widget customText(String text, Color color) => Text(
    text,
    style: TextStyle(color: color),
  );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}
