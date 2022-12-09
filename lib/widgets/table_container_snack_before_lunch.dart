import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:kalori/constants.dart';
import 'package:kalori/models/table_model.dart';

typedef _BoolTableContainer(
  bool isTableCalories,
  bool isPreviewTable,
  bool isTableBreakfast,
  bool isTableLunch,
  bool isTableDinner,
  bool isTableSnackBeforeLunch,
  bool isTableSnackBeforeDinner,
);

typedef _SelectedTableCalories(
  List<TableKalori> selectedTableCalories,
);

typedef _TotalCalories(
  int total,
);

class TableContainerSnackBeforeLunch extends StatefulWidget {
  const TableContainerSnackBeforeLunch({
    Key? key,
    required this.calories,
    required this.boolTableContainer,
    required this.selectedTableCalories,
    required this.total,
  }) : super(key: key);

  final double calories;
  final _BoolTableContainer boolTableContainer;
  final _SelectedTableCalories selectedTableCalories;
  final _TotalCalories total;

  @override
  State<TableContainerSnackBeforeLunch> createState() =>
      _TableContainerSnackBeforeLunchState();
}

class _TableContainerSnackBeforeLunchState
    extends State<TableContainerSnackBeforeLunch> {
  final List<TableKalori> _selectedTableCalories = [];
  bool isTableCalories = false;
  bool isButtonDisable = false;
  bool isPreviewTable = false;
  bool _isTableBreakfast = false;
  bool _isTableLunch = false;
  bool _isTableDinner = false;
  bool _isTableSnackBeforeLunch = false;
  bool _isTableSnackBeforeDinner = false;
  int total = 0;
  final columns = ['Nama Bahan ', "Kalori"];

  @override
  Widget build(BuildContext context) {
    total = _selectedTableCalories.fold<int>(
      0,
      ((prev, curr) {
        return prev + curr.kalori;
      }),
    );
    if (total > widget.calories) {
      isButtonDisable = true;
    } else {
      isButtonDisable = false;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Menu Snack Siang",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: textColor),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            tableCategories("Sayur - Sayuran", vegetables, columns),
            const SizedBox(
              width: 10,
            ),
            tableCategories("Buah - Buahan", fruits, columns),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Container(
                height: 500,
                width: 400,
                color: secondaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Kalori yang dipilih ",
                        style: const TextStyle(
                          fontSize: 16,
                          color: textColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  '$total / ${widget.calories.toStringAsFixed(0)}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(text: ' kkal'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: isButtonDisable ? Colors.red : null,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: buttonColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: isButtonDisable
                            ? null
                            : () => setState(() {
                                  isPreviewTable = false;
                                  isTableCalories = true;
                                  _isTableBreakfast = false;
                                  _isTableLunch = true;
                                  _isTableDinner = false;
                                  _isTableSnackBeforeLunch = false;
                                  _isTableSnackBeforeDinner = false;

                                  widget.boolTableContainer(
                                    isTableCalories,
                                    isPreviewTable,
                                    _isTableBreakfast,
                                    _isTableLunch,
                                    _isTableDinner,
                                    _isTableSnackBeforeLunch,
                                    _isTableSnackBeforeDinner,
                                  );
                                  widget.selectedTableCalories(
                                      _selectedTableCalories);
                                  widget.total(total);
                                }),
                        child: const Text(
                          "Pilih Makan Siang",
                          style: TextStyle(
                            fontSize: 14,
                            color: textButtonColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    if (isButtonDisable) ...{
                      const Text(
                          "Makanan yang dipilih melebihi jumlah kalori harian"),
                    },
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }

  Column tableCategories(
      String title, List<TableKalori> dataTable, List<String> colums) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: secondaryColor,
            border: Border.all(
              color: buttonColor,
            ),
          ),
          width: 400,
          height: 500,
          child: DataTable2(
            columnSpacing: defaultPadding,
            horizontalMargin: defaultPadding,
            dataRowHeight: 60,
            headingTextStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            columns: getColumns(columns),
            rows: getRows(dataTable),
          ),
        ),
      ],
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
          selected: _selectedTableCalories.contains(calories),
          onSelectChanged: (isSelected) => setState(() {
            final isAdding = isSelected != null && isSelected;
            isAdding
                ? _selectedTableCalories.add(calories)
                : _selectedTableCalories.remove(calories);
          }),
          cells: [
            DataCell(
              SizedBox(
                width: 100,
                child: Text(
                  calories.name,
                  style: const TextStyle(fontSize: 13, color: textColor),
                ),
              ),
            ),
            DataCell(
              SizedBox(
                width: 50,
                child: Text(
                  '${calories.kalori}',
                  style: const TextStyle(fontSize: 13, color: textColor),
                ),
              ),
            )
          ],
        ),
      )
      .toList();
}
