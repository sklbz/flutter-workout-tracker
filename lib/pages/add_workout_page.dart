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
          child: Column(
            children: [
              ExerciseDropdown(),
              ExerciseDropdown(),
            ],
          ),
        ),
      ),
    );
  }
}

enum ExerciseLabel {
  lowBarSquat("low bar squat"),
  highBarSquat("high bar squat"),
  frontSquat("front squat"),
  benchPress("barbell bench press"),
  dumbbellBenchPress("dumbbell bench press"),
  deadlift("deadlift"),
  sumoDeadlift("sumo deadlift"),
  trapBarDeadlift("trap bar deadlift");

  const ExerciseLabel(this.label);
  final String label;
}

class ExerciseDropdown extends StatefulWidget {
  const ExerciseDropdown({super.key});

  @override
  State<ExerciseDropdown> createState() => _ExerciseDropdownState();
}

class _ExerciseDropdownState extends State<ExerciseDropdown> {
  final TextEditingController exerciceController = TextEditingController();
  ExerciseLabel? selectedExercise;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownMenu<ExerciseLabel>(
            controller: exerciceController,
            enableFilter: true,
            requestFocusOnTap: true,
            label: const Text('Exercise'),
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
            onSelected: (ExerciseLabel? exercise) {
              setState(() {
                selectedExercise = exercise;
              });
            },
            menuStyle: MenuStyle(
              backgroundColor: WidgetStateProperty.all(Color(0xffcdd6f4)),
            ),
            dropdownMenuEntries:
                ExerciseLabel.values.map<DropdownMenuEntry<ExerciseLabel>>(
              (ExerciseLabel exercise) {
                return DropdownMenuEntry<ExerciseLabel>(
                    value: exercise,
                    label: exercise.label,
                    style: MenuItemButton.styleFrom(
                      backgroundColor: Color(0xff1e1e2e),
                      foregroundColor: Color(0xffcdd6f4),
                    ));
              },
            ).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownMenu<int>(
              label: const Text("Sets"),
              dropdownMenuEntries: List.generate(6, (index) {
                int value = index + 1;
                return DropdownMenuEntry<int>(
                  value: value,
                  label: value.toString(),
                );
              }),
            ),
          ),
          DropdownMenu<int>(
            label: const Text("Reps"),
            dropdownMenuEntries: List.generate(30, (index) {
              int value = index + 1;
              return DropdownMenuEntry<int>(
                value: value,
                label: value.toString(),
              );
            }),
          )
        ],
      ),
    );
  }
}
