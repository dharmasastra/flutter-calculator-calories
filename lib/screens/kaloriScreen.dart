import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:kalori/constants.dart';
import 'package:kalori/models/table_model.dart';
import 'package:kalori/widgets/calories_container.dart';
import 'package:kalori/widgets/form_kalori.dart';
import 'package:kalori/widgets/preview_table_container.dart';
import 'package:kalori/widgets/table_container_breakfast.dart';
import 'package:kalori/widgets/table_container_dinner.dart';
import 'package:kalori/widgets/table_container_lunch.dart';
import 'package:kalori/widgets/table_container_snack_before_dinner.dart';
import 'package:kalori/widgets/table_container_snack_before_lunch.dart';

class KaloriScreen extends StatefulWidget {
  const KaloriScreen({Key? key}) : super(key: key);

  @override
  State<KaloriScreen> createState() => _KaloriScreenState();
}

class _KaloriScreenState extends State<KaloriScreen> {
  double _calories = 0;
  double _caloriesIdeal = 0;
  double _bbi = 0;
  double _breakfast = 0;
  double _snack = 0;
  double _lunch = 0;
  double _dinner = 0;
  int _totalBreakfast = 0;
  int _totalLunch = 0;
  int _totalDinner = 0;
  int _totalSnackBeforeLunch = 0;
  int _totalSnackBeforeDinner = 0;
  bool _isTableCalories = false;
  bool _isTableBreakfast = true;
  bool _isTableLunch = false;
  bool _isTableDinner = false;
  bool _isTableSnackBeforeLunch = false;
  bool _isTableSnackBeforeDinner = false;
  bool _isPreviewTable = false;
  List<TableKalori> _selectedTableCaloriesBreakfast = [];
  List<TableKalori> _selectedTableCaloriesLunch = [];
  List<TableKalori> _selectedTableCaloriesDinner = [];
  List<TableKalori> _selectedTableCaloriesSnackBeforeLunch = [];
  List<TableKalori> _selectedTableCaloriesSnackBeforeDinner = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.18,
              vertical: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Calculator Calories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 100,
                ),
                FormCalories(
                  calories: (calories, caloriesIdeal, bbi) {
                    setState(() {
                      _calories = calories;
                      _caloriesIdeal = caloriesIdeal;
                      _bbi = bbi;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                if (_isTableCalories) ...{
                  if (_isTableBreakfast) ...{
                    TableContainerBreakfast(
                      calories: _breakfast,
                      selectedTableCalories:
                          (List<TableKalori> selectedTableCalories) {
                        setState(() {
                          _selectedTableCaloriesBreakfast =
                              selectedTableCalories;
                        });
                      },
                      total: (int total) {
                        setState(() {
                          _totalBreakfast = total;
                        });
                      },
                      boolTableContainer: (bool isTableCalories,
                          bool isPreviewTable,
                          bool isTableBreakfast,
                          bool isTableLunch,
                          bool isTableDinner,
                          bool isTableSnackBeforeLunch,
                          bool isTableSnackBeforeDinner) {
                        setState(() {
                          _isTableCalories = isTableCalories;
                          _isPreviewTable = isPreviewTable;
                          _isTableBreakfast = isTableBreakfast;
                          _isTableLunch = isTableLunch;
                          _isTableDinner = isTableDinner;
                          _isTableSnackBeforeLunch = isTableSnackBeforeLunch;
                          _isTableSnackBeforeDinner = isTableSnackBeforeDinner;
                        });
                      },
                    ),
                  } else if (_isTableSnackBeforeLunch) ...{
                    TableContainerSnackBeforeLunch(
                      calories: _snack,
                      selectedTableCalories:
                          (List<TableKalori> selectedTableCalories) {
                        setState(() {
                          _selectedTableCaloriesSnackBeforeLunch =
                              selectedTableCalories;
                        });
                      },
                      total: (int total) {
                        setState(() {
                          _totalSnackBeforeLunch = total;
                        });
                      },
                      boolTableContainer: (bool isTableCalories,
                          bool isPreviewTable,
                          bool isTableBreakfast,
                          bool isTableLunch,
                          bool isTableDinner,
                          bool isTableSnackBeforeLunch,
                          bool isTableSnackBeforeDinner) {
                        setState(() {
                          _isTableCalories = isTableCalories;
                          _isPreviewTable = isPreviewTable;
                          _isTableBreakfast = isTableBreakfast;
                          _isTableLunch = isTableLunch;
                          _isTableDinner = isTableDinner;
                          _isTableSnackBeforeLunch = isTableSnackBeforeLunch;
                          _isTableSnackBeforeDinner = isTableSnackBeforeDinner;
                        });
                      },
                    ),
                  } else if (_isTableLunch) ...{
                    TableContainerLunch(
                      calories: _lunch,
                      selectedTableCalories:
                          (List<TableKalori> selectedTableCalories) {
                        setState(() {
                          _selectedTableCaloriesLunch = selectedTableCalories;
                        });
                      },
                      total: (int total) {
                        setState(() {
                          _totalLunch = total;
                        });
                      },
                      boolTableContainer: (bool isTableCalories,
                          bool isPreviewTable,
                          bool isTableBreakfast,
                          bool isTableLunch,
                          bool isTableDinner,
                          bool isTableSnackBeforeLunch,
                          bool isTableSnackBeforeDinner) {
                        setState(() {
                          _isTableCalories = isTableCalories;
                          _isPreviewTable = isPreviewTable;
                          _isTableBreakfast = isTableBreakfast;
                          _isTableLunch = isTableLunch;
                          _isTableDinner = isTableDinner;
                          _isTableSnackBeforeLunch = isTableSnackBeforeLunch;
                          _isTableSnackBeforeDinner = isTableSnackBeforeDinner;
                        });
                      },
                    ),
                  } else if (_isTableSnackBeforeDinner) ...{
                    TableContainerSnackBeforeDinner(
                      calories: _snack,
                      selectedTableCalories:
                          (List<TableKalori> selectedTableCalories) {
                        setState(() {
                          _selectedTableCaloriesSnackBeforeDinner =
                              selectedTableCalories;
                        });
                      },
                      total: (int total) {
                        setState(() {
                          _totalSnackBeforeDinner = total;
                        });
                      },
                      boolTableContainer: (bool isTableCalories,
                          bool isPreviewTable,
                          bool isTableBreakfast,
                          bool isTableLunch,
                          bool isTableDinner,
                          bool isTableSnackBeforeLunch,
                          bool isTableSnackBeforeDinner) {
                        setState(() {
                          _isTableCalories = isTableCalories;
                          _isPreviewTable = isPreviewTable;
                          _isTableBreakfast = isTableBreakfast;
                          _isTableLunch = isTableLunch;
                          _isTableDinner = isTableDinner;
                          _isTableSnackBeforeLunch = isTableSnackBeforeLunch;
                          _isTableSnackBeforeDinner = isTableSnackBeforeDinner;
                        });
                      },
                    ),
                  } else if (_isTableDinner) ...{
                    TableContainerDinner(
                      calories: _dinner,
                      selectedTableCalories:
                          (List<TableKalori> selectedTableCalories) {
                        setState(() {
                          _selectedTableCaloriesDinner = selectedTableCalories;
                        });
                      },
                      total: (int total) {
                        setState(() {
                          _totalDinner = total;
                        });
                      },
                      boolTableContainer: (bool isTableCalories,
                          bool isPreviewTable,
                          bool isTableBreakfast,
                          bool isTableLunch,
                          bool isTableDinner,
                          bool isTableSnackBeforeLunch,
                          bool isTableSnackBeforeDinner) {
                        setState(() {
                          _isTableCalories = isTableCalories;
                          _isPreviewTable = isPreviewTable;
                          _isTableBreakfast = isTableBreakfast;
                          _isTableLunch = isTableLunch;
                          _isTableDinner = isTableDinner;
                          _isTableSnackBeforeLunch = isTableSnackBeforeLunch;
                          _isTableSnackBeforeDinner = isTableSnackBeforeDinner;
                        });
                      },
                    ),
                  }
                } else if (_isPreviewTable) ...{
                  TablePreviewContainer(
                    selectedTableCaloriesBreakfast:
                        _selectedTableCaloriesBreakfast,
                    selectedTableCaloriesDinner: _selectedTableCaloriesLunch,
                    selectedTableCaloriesLunch: _selectedTableCaloriesDinner,
                    totalBreakfast: _totalBreakfast,
                    totalLunch: _totalLunch,
                    totalDinner: _totalDinner,
                    totalSnackBeforeLunch: _totalSnackBeforeLunch,
                    totalSnackBeforeDinner: _totalSnackBeforeDinner,
                    selectedTableCaloriesSnackBeforeDinner:
                        _selectedTableCaloriesSnackBeforeDinner,
                    selectedTableCaloriesSnackBeforeLunch:
                        _selectedTableCaloriesSnackBeforeLunch,
                  )
                } else ...{
                  CaloriesContainer(
                    calories: _calories,
                    caloriesIdeal: _caloriesIdeal,
                    bbi: _bbi,
                    tableCaloriesBool: (bool tableCalories) {
                      setState(() {
                        _isTableCalories = tableCalories;
                      });
                    },
                    foodTime: (double breakfast, double snack, double lunch,
                        double dinner) {
                      setState(() {
                        _breakfast = breakfast;
                        _snack = snack;
                        _lunch = lunch;
                        _dinner = dinner;
                      });
                    },
                  ),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
