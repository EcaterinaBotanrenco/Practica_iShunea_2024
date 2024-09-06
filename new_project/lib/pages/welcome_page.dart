import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_project/cubit/app_cubit.dart';
import 'package:flutter_project/misc/colors.dart';
import 'package:flutter_project/widgets/app_large_text.dart';
import 'package:flutter_project/widgets/app_text.dart';
import 'package:flutter_project/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            // first parameter context and second parameter is index
            //we want to scroll up and down
            return Container(
              width: double.maxFinite, // max width and height
              height: double.maxFinite,
              decoration: BoxDecoration(
                // decoration sets the background
                image: DecorationImage(
                    // ignore: prefer_interpolation_to_compose_strings
                    image: AssetImage("img/" + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: index == 1
                    ? const Text("Second")
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppLargeText(
                                text: "Trips",
                              ),
                              const AppText(
                                text: "Mountain",
                                size: 30,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                width: 250,
                                child: AppText(
                                  color: AppColors.textColor1,
                                  text:
                                      "Mountain Hikes gives you an incredible sense of freedom along with endurance tests",
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AppCubits>(context)
                                      .getData(); // we can run any method from the state usisng the block provider
                                },
                                child: ResponsiveButton(
                                  width: 120,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: List.generate(
                                3,
                                (indexDots) => Container(
                                      margin: const EdgeInsets.only(bottom: 4),
                                      width: 8,
                                      height: index == indexDots ? 25 : 8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: index == indexDots? AppColors.mainColor
                                            : AppColors.mainColor
                                                .withOpacity(0.3),
                                      ),
                                    )),
                          )
                        ],
                      ),
              ),
            );
          }),
    );
  }
}

// Definim o stare de bază pentru aplicație
abstract class AppState {}

class InitialState extends AppState {}

class LoadedState extends AppState {
  final List<dynamic> data;
  LoadedState(this.data);
}

class ErrorState extends AppState {
  final String message;
  ErrorState(this.message);
}

// Cubit-ul responsabil de gestionarea stării
class AppCubits extends Cubit<AppState> {
  AppCubits() : super(InitialState());

  // Metoda care va fi apelată pentru a încărca datele
  void getData() async {
    try {
      // Simulează obținerea de date (poți înlocui cu un apel API real)
      await Future.delayed(const Duration(seconds: 2));

      // Aici, vom seta niște date false, poți înlocui cu datele reale
      List<dynamic> trips = [
        {"name": "Trip 1", "location": "Mountain 1"},
        {"name": "Trip 2", "location": "Mountain 2"},
        {"name": "Trip 3", "location": "Mountain 3"},
      ];

      // Emiterea stării cu datele încărcate
      emit(LoadedState(trips));
    } catch (e) {
      // În cazul unei erori, emiterea unei stări de eroare
      emit(ErrorState("Failed to load data"));
    }
  }
}
