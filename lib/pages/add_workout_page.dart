import 'package:flutter/material.dart';

class AddWorkoutPage extends StatelessWidget {
  const AddWorkoutPage({super.key});

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
  int? selectedSetCount;
  int? selectedRepCount;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$selectedExercise x $selectedSetCount x $selectedRepCount"),
          Dropdown(
            controller: exerciceController,
            requestFocusOnTap: true,
            label: 'Exercise',
            onSelected: (dynamic exercise) {
              setState(() {
                selectedExercise = exercise;
              });
            },
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
            child: Dropdown(
              label: "Sets",
              onSelected: (dynamic setCount) {
                setState(() {
                  selectedSetCount = setCount;
                });
              },
              dropdownMenuEntries: List.generate(6, (index) {
                int value = index + 1;
                return DropdownMenuEntry<int>(
                  value: value,
                  label: value.toString(),
                );
              }),
            ),
          ),
          Dropdown(
            label: "Reps",
            onSelected: (dynamic repCount) {
              setState(() {
                selectedRepCount = repCount;
              });
            },
            dropdownMenuEntries: List.generate(30, (index) {
              int value = index + 1;
              return DropdownMenuEntry<int>(
                value: value,
                label: value.toString(),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class Dropdown extends StatelessWidget {
  final String label;
  final List<DropdownMenuEntry> dropdownMenuEntries;
  final void Function(dynamic) onSelected;
  final bool? requestFocusOnTap;
  final TextEditingController? controller;

  const Dropdown({
    required this.label,
    required this.dropdownMenuEntries,
    required this.onSelected,
    this.controller,
    this.requestFocusOnTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry> styledEntries = List.generate(
      dropdownMenuEntries.length,
      (index) {
        DropdownMenuEntry _entry = dropdownMenuEntries[index];
        return DropdownMenuEntry(
          value: _entry.value,
          label: _entry.label,
          style: MenuItemButton.styleFrom(
            backgroundColor: Color(0xff1e1e2e),
            foregroundColor: Color(0xffcdd6f4),
          ),
        );
      },
    );

    return DropdownMenu(
      label: Text(label),
      requestFocusOnTap: requestFocusOnTap,
      dropdownMenuEntries: styledEntries,
      onSelected: onSelected,
      controller: controller,
      /*------------UNCHANGEABLE VALUES------------------*/
      enableFilter: true,
      textStyle: TextStyle(
        color: Color(0xffcdd6f4),
      ),
      trailingIcon: Icon(Icons.fitness_center),
      selectedTrailingIcon: RotatedBox(
        quarterTurns: 1,
        child: Icon(Icons.fitness_center),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(Color(0xffcdd6f4)),
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
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff6750a4),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
