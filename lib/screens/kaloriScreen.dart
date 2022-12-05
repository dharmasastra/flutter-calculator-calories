import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:kalori/constants.dart';
import 'package:kalori/models/table_model.dart';
import 'package:kalori/widgets/calories_container.dart';
import 'package:kalori/widgets/form_kalori.dart';
import 'package:kalori/widgets/preview_table_container.dart';
import 'package:kalori/widgets/select_table_container.dart';

class KaloriScreen extends StatefulWidget {
  const KaloriScreen({Key? key}) : super(key: key);

  @override
  State<KaloriScreen> createState() => _KaloriScreenState();
}

class _KaloriScreenState extends State<KaloriScreen> {
  double _calories = 0;
  double _caloriesIdeal = 0;
  double _bbi = 0;
  int _total = 0;
  bool _isTableCalories = false;
  bool _isPreviewTable = false;
  List<TableKalori> _selectedTableCalories = [];

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
                  TableContainer(
                    calories: _calories,
                    boolTableContainer:
                        (bool isTableCalories, bool isPreviewTable) {
                      setState(() {
                        _isTableCalories = isTableCalories;
                        _isPreviewTable = isPreviewTable;
                      });
                      // print(isPreviewTable);
                      // print(isTableCalories);
                    },
                    selectedTableCalories:
                        (List<TableKalori> selectedTableCalories) {
                      setState(() {
                        _selectedTableCalories = selectedTableCalories;
                      });
                    },
                    total: (int total) {
                      setState(() {
                        _total = total;
                      });
                    },
                  )
                } else if (_isPreviewTable) ...{
                  TablePreviewContainer(
                    total: _total,
                    selectedTableCalories: _selectedTableCalories,
                  )
                } else ...{
                  CaloriesContainer(
                    calories: _calories,
                    caloriesIdeal: _caloriesIdeal,
                    bbi:  _bbi,
                    tableCaloriesBool: (bool tableCalories) {
                      setState(() {
                        _isTableCalories = tableCalories;
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
