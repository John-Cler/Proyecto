import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "Iniciar Sesión",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                Image.asset(
                  "lib/assets/logo.png",
                  width: 210,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 19, 24, 170).withOpacity(.3)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "Username",
                    ),
                  ),
                ), //Fin de container de user
                //Inicio de container de password
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple.withOpacity(.3)),
                  child: TextFormField(
                    obscureText:
                        isVisible, //Activa la visualizacion del password
                    decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: Icon(isVisible
                                ? Icons.visibility
                                : Icons.visibility_off))),
                  ),
                ),
                //Button de login para ingresar al sistema
                const SizedBox(height: 10),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Iniciar sesión",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                //Button de iniciar sesion con google
                const SizedBox(height: 10),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 192, 20, 7)),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Continuar con Google",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
