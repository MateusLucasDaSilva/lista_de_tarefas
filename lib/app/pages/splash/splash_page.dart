import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/2721/2721299.png'),
              fit: BoxFit.fitWidth),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/home'),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 180, 86, 189),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                        child: Text(
                      'Acessar Lista de tarefas',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
