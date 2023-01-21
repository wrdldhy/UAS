import 'package:flutter/material.dart';

class UserProp extends StatelessWidget {
  const UserProp({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(text)
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Layout Flutter',
        home: Scaffold(
          body: Stack(
            children: [
              Container(
                // height: 60,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/purple.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(7.0),
                      topLeft: Radius.circular(7.0),
                    ),
                    color: Colors.blue),
              ),
              Container(
                margin: const EdgeInsets.only(top: 195, left: 40, right: 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(255, 16, 32, 83),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                height: 245,
                child: Container(
                  padding: const EdgeInsets.all(20),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 110, left: 40, right: 40),
                  child: Center(
                    child: Column(children: const <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/images/bear.jpg'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Wirda Alidhiya Asni',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'NPM : 43A87006190309',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Jurusan : Teknik Informatika',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Kelas : S1/TI/7A/Pagi',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      )
                    ]),
                  )),
            ],
          ),
        ));
  }
}
