import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff1e1e2e),
        body: Center(
          child: ExerciceDropdown(),
        ),
      ),
    );
  }
}

enum ExerciceLabel {
  lowBarSquat("low bar squat"),
  highBarSquat("high bar squat"),
  frontSquat("front squat"),
  benchPress("barbell bench press"),
  dumbellBenchPress("dumbell bench press"),
  deadlift("deadlift"),
  sumoDeadlift("sumo deadlift"),
  trapBarDeadlift("trap bar deadlift");

  const ExerciceLabel(this.label);
  final String label;
}

class ExerciceDropdown extends StatefulWidget {
  const ExerciceDropdown({super.key});

  @override
  State<ExerciceDropdown> createState() => _ExerciceDropdownState();
}

class _ExerciceDropdownState extends State<ExerciceDropdown> {
  final TextEditingController exerciceController = TextEditingController();
  ExerciceLabel? selectedExercice;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownMenu<ExerciceLabel>(
            controller: exerciceController,
            enableFilter: true,
            requestFocusOnTap: true,
            label: const Text('Exercice'),
            textStyle: TextStyle(
              color: Color(0xffcdd6f4),
            ),
            trailingIcon: Icon(Icons.fitness_center),
            selectedTrailingIcon: RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.fitness_center),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: false,
              labelStyle: TextStyle(
                color: Color(0xff6750a4),
              ),
              contentPadding: EdgeInsets.all(5.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff6750a4),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff6750a4),
                  width: 1.5,
                ),
              ),
            ),
            onSelected: (ExerciceLabel? exercice) {
              setState(() {
                selectedExercice = exercice;
              });
            },
            menuStyle: MenuStyle(
              backgroundColor: WidgetStateProperty.all(Color(0xffcdd6f4)),
            ),
            dropdownMenuEntries:
                ExerciceLabel.values.map<DropdownMenuEntry<ExerciceLabel>>(
              (ExerciceLabel exercice) {
                return DropdownMenuEntry<ExerciceLabel>(
                    value: exercice,
                    label: exercice.label,
                    style: MenuItemButton.styleFrom(
                      backgroundColor: Color(0xff1e1e2e),
                      foregroundColor: Color(0xffcdd6f4),
                    ));
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
