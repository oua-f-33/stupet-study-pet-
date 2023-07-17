import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stupet/screen/homePage.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/registerPage.dart';
import 'package:stupet/screen/splashScreen.dart';
import 'package:stupet/screen/withoutRegister.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  late String email, password;
  final formkey = GlobalKey<FormState>();

  final firebaseAuth = FirebaseAuth.instance;
  bool isChecked = false;
  String _errorMessage = '';
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Form(
                  key: formkey,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, right: 0, left: 0),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
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
                                  controller: _usernameController,
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
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  obscureText: _obscureText,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Lütfen şifrenizi giriniz";
                                    } else {}
                                  },
                                  onSaved: (value) {
                                    password = value!;
                                  },
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                        child: Icon(
                                          _obscureText ? Icons.visibility : Icons.visibility_off,
                                        ),
                                      ),
                                      hintText: "Parola",
                                      icon: Icon(Icons.lock_outline),
                                      border: InputBorder.none),
                                ),

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
                                padding:
                                    const EdgeInsets.fromLTRB(80, 16, 16, 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap:
                                          () {}, //şifremi unuttum işlemi için
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
                              color: ColorTheme().khmerCurry,
                            ),
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
                        Text(
                          _errorMessage,
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
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
                                                      WithoutRegister()),
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
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Text(
                                  "Hesabınız yok mu?",
                                  style: TextStyle(
                                      fontSize: 16, color: ColorTheme().grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
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
                                        fontSize: 16,
                                        color: ColorTheme().darkBlue),
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

    try {
      final UserCredential userCredential =
      await firebaseAuth.signInWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text,
      );

      // Giriş başarılı, kullanıcıyı ana ekrana yönlendirin veya işlemleri yapın.
      print('Giriş başarılı!');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        setState(() {
          _errorMessage = 'Geçersiz kullanıcı adı veya şifre.';
        });
      } else {
        setState(() {
          _errorMessage = 'Giriş yapılırken bir hata oluştu.';
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
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

