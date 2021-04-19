import 'package:flutter/material.dart';

const String myUsername = "Denise";
const String myPassword = "123456";

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  String textFieldString = "";
  String textFieldPassword = "";

  bool loginSuccess = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      );

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(
        title: Text("Social Hackathon"),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Popup"),
                      content: Text("Testo di prova"),
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Chiudi"),
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      );

  Widget _buildBody(BuildContext context) => Align(
        alignment: Alignment.lerp(Alignment.topCenter, Alignment.center, 0.25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLoginForm(context),
            SizedBox(
              height: 16,
            ),
            _buildButtons(context),
          ],
        ),
      );

  Widget _buildLoginForm(BuildContext context) => Container(
        padding: EdgeInsets.all(16),
        width: 240,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: loginSuccess,
                child: Text("Login effettuato!"),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                labelText: "Username",
                //errorText: "Inserisci email",
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  textFieldString = text;
                });
              },
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Almeno 8 caratteri",
                labelText: "Password",
                //errorText: "Inserisci email",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: (text) {
                setState(() {
                  textFieldPassword = text;
                });
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border: Border.all(color: Colors.red),
            gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 2),
                blurRadius: 8,
              ),
            ]),
      );

  Widget _buildButtons(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {},
            child: Text("SignUp"),
          ),
          SizedBox(
            width: 32,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                loginSuccess = myUsername == textFieldString &&
                    myPassword == textFieldPassword;
              });
            },
            child: Text("Login"),
          ),
        ],
      );

}