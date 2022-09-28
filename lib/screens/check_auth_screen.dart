import 'package:flutter/material.dart';
import 'package:productos_app/screens/home_screen.dart';
import 'package:productos_app/screens/login_screen.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

class CheckAutnScreen extends StatelessWidget {
  const CheckAutnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: authService.readToken(),
            builder: (BuildContext contex, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData) return Text('Espere');

              if (snapshot.data == '') {
                Future.microtask(() {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      //el pageBuirder resive lao 3 animaciones en este caso no queremos animaciones
                      pageBuilder: (_, __, ___) => LoginScreen(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                });
              }else{
                Future.microtask(() {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      //el pageBuirder resive lao 3 animaciones en este caso no queremos animaciones
                      pageBuilder: (_, __, ___) => HomeScreen(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                });
              }


              return Container();
            }),
      ),
    );
  }
}
