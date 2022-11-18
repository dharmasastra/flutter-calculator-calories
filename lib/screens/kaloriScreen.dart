import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:kalori/constants.dart';
import 'package:kalori/models/table_model.dart';
import 'package:kalori/widgets/calories_container.dart';
import 'package:kalori/widgets/form_kalori.dart';

class KaloriScreen extends StatefulWidget {
  const KaloriScreen({Key? key}) : super(key: key);

  @override
  State<KaloriScreen> createState() => _KaloriScreenState();
}

class _KaloriScreenState extends State<KaloriScreen> {
  int _calories = 0;
  bool isTableCalories = false;
  bool isButtonDisable = true;
  bool isPreviewTable = false;
  final columns = ['Nama Bahan (100g)', "Kalori"];
  List<TableKalori> selectedTableCalories = [];

  @override
  Widget build(BuildContext context) {
    final total = selectedTableCalories.fold<num>(
      0,
      ((prev, curr) {
        return prev + curr.kalori;
      }),
    );
    if (total > _calories) {
      isButtonDisable = false;
    } else {
      isButtonDisable = true;
    }
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
                  calories: (calories) {
                    setState(() {
                      _calories = calories;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                if (isTableCalories) ...{
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            border: Border.all(
                              color: buttonColor,
                            )),
                        width: 450,
                        height: 600,
                        child: DataTable2(
                          columnSpacing: defaultPadding,
                          horizontalMargin: defaultPadding,
                          dataRowHeight: 60,
                          headingTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          columns: getColumns(columns),
                          rows: getRows(data),
                        ),
                      ),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Container(
                        height: 600,
                        width: 500,
                        color: secondaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kalori $total / $_calories',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            SizedBox(
                              width: 200,
                              height: 45,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      isButtonDisable ? null : Colors.red,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: buttonColor),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: isButtonDisable
                                    ? () => setState(() {
                                          isPreviewTable = true;
                                          isTableCalories = false;
                                        })
                                    : null,
                                child: const Text(
                                  "Lihat Makanan",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: textButtonColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                } else if (isPreviewTable) ...{
                  Container(
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        border: Border.all(
                          color: buttonColor,
                        )),
                    width: 450,
                    height: 600,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 450,
                          height: 500,
                          child: DataTable2(
                            columnSpacing: defaultPadding,
                            horizontalMargin: defaultPadding,
                            dataRowHeight: 60,
                            minWidth: 600,
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            columns: getColumns(columns),
                            rows: getRowSelected(selectedTableCalories),
                          ),
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        Container(
                          width: 450,
                          padding: const EdgeInsets.only(right: 110),
                          // alignment: Alignment.centerLeft,
                          child: Text(
                            "Total Kalori: $total",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                } else ...{
                  CaloriesContainer(
                    calories: _calories,
                    tableCaoriesBool: (bool tableCalories) {
                      setState(() {
                        isTableCalories = tableCalories;
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

  List<DataColumn> getColumns(List<String> columns) => columns
      .map(
        (String column) => DataColumn(
          label: Text(column),
        ),
      )
      .toList();

  List<DataRow> getRows(List<TableKalori> tableCalories) => tableCalories
      .map(
        (TableKalori calories) => DataRow(
          selected: selectedTableCalories.contains(calories),
          onSelectChanged: (isSelected) => setState(() {
            final isAdding = isSelected != null && isSelected;
            isAdding
                ? selectedTableCalories.add(calories)
                : selectedTableCalories.remove(calories);
          }),
          cells: [
            DataCell(
              SizedBox(
                width: 100,
                child: Text(calories.name),
              ),
            ),
            DataCell(
              SizedBox(
                width: 50,
                child: Text('${calories.kalori}'),
              ),
            )
          ],
        ),
      )
      .toList();

  List<DataRow> getRowSelected(List<TableKalori> tableCalories) => tableCalories
      .map(
        (TableKalori calories) => DataRow(
          cells: [
            DataCell(
              SizedBox(
                width: 100,
                child: Text(calories.name),
              ),
            ),
            DataCell(
              SizedBox(
                width: 50,
                child: Text('${calories.kalori}'),
              ),
            )
          ],
        ),
      )
      .toList();
}
