import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController refCodeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _onClear() {
    setState(() {
      _formKey.currentState.reset();
    });
  }

  _onRegister() {
    print(fullNameController.text);
    print(emailController.text);
    print(numberController.text);
    print(countryController.text);
    print(passwordControler.text);
    print(confirmPasswordController.text);
    print(refCodeController.text);
  }

  Widget Title() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Register',
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontSize: 34,
          fontStyle: FontStyle.italic,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget ClearButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: _onClear,
        height: 20,
        minWidth: 40,
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Clear',
          style: TextStyle(
              color: Color(0xFFE83F3F),
              fontSize: 14,
              fontStyle: FontStyle.italic,
              fontFamily: 'Lato'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClearButton(),
            Title(),
            Material(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 48,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        filled: true,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE83F3F),
                          ),
                        ),
                        fillColor: Colors.white,
                        labelText: "Full name",
                        labelStyle: TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontSize: 16,
                          fontFamily: 'Lato',
                        ),
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF3D4A5A),
                        fontSize: 20.0,
                        fontFamily: 'Lato',
                      ),
                      controller: fullNameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu nome!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Email Address",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE83F3F),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontSize: 16,
                          fontFamily: 'Lato',
                        ),
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF3D4A5A),
                        fontSize: 20.0,
                        fontFamily: 'Lato',
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Mobile Number",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE83F3F),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontSize: 16,
                          fontFamily: 'Lato',
                        ),
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF3D4A5A),
                        fontSize: 20.0,
                        fontFamily: 'Lato',
                      ),
                      controller: numberController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu número";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Country",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE83F3F),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontSize: 16,
                          fontFamily: 'Lato',
                        ),
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF3D4A5A),
                        fontSize: 20.0,
                        fontFamily: 'Lato',
                      ),
                      controller: countryController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu país";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Password",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE83F3F),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontSize: 16,
                          fontFamily: 'Lato',
                        ),
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF3D4A5A),
                        fontSize: 20.0,
                        fontFamily: 'Lato',
                      ),
                      controller: passwordControler,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira sua senha";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Confirm Password",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE83F3F),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontSize: 16,
                          fontFamily: 'Lato',
                        ),
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF3D4A5A),
                        fontSize: 20.0,
                        fontFamily: 'Lato',
                      ),
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Confirme sua senha";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Referal code (Optional)",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE83F3F),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontSize: 16,
                          fontFamily: 'Lato',
                        ),
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF3D4A5A),
                        fontSize: 20.0,
                        fontFamily: 'Lato',
                      ),
                      controller: refCodeController,
                    ),
                    SizedBox(
                      height: 20,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: _onRegister,
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Lato',
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      color: Color(0xFFE83F3F),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
