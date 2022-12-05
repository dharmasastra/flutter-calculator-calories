import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:kalori/constants.dart';
import 'package:kalori/models/table_model.dart';

typedef _BoolTableContainer(bool isTableCalories, bool isPreviewTable);

typedef _SelectedTableCalories(
  List<TableKalori> selectedTableCalories,
);

typedef _TotalCalories(
  int total,
);

class TableContainer extends StatefulWidget {
  TableContainer({
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
  State<TableContainer> createState() => _TableContainerState();
}

class _TableContainerState extends State<TableContainer> {
  List<TableKalori> selectedTableCalories = [];
  bool isTableCalories = false;
  bool isButtonDisable = false;
  bool isPreviewTable = false;
  int total = 0;
  final columns = ['Nama Bahan (100g)', "Kalori"];

  @override
  Widget build(BuildContext context) {
    total = selectedTableCalories.fold<int>(
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: secondaryColor,
            border: Border.all(
              color: buttonColor,
            ),
          ),
          width: 450,
          height: 600,
          child: DataTable2(
            columnSpacing: defaultPadding,
            horizontalMargin: defaultPadding,
            dataRowHeight: 60,
            headingTextStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                'Kalori $total / ${widget.calories.toStringAsFixed(1)}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                            isPreviewTable = true;
                            isTableCalories = false;
                            widget.boolTableContainer(
                                isTableCalories, isPreviewTable);
                          }),
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
              const SizedBox(
                height: defaultPadding,
              ),
              if (isButtonDisable) ...{
                const Text(
                    "Makanan yang dipilih melebihi jumlah kalori harian"),
              },
            ],
          ),
        )
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
          selected: selectedTableCalories.contains(calories),
          onSelectChanged: (isSelected) => setState(() {
            final isAdding = isSelected != null && isSelected;
            isAdding
                ? selectedTableCalories.add(calories)
                : selectedTableCalories.remove(calories);

            widget.selectedTableCalories(selectedTableCalories);
            widget.total(total);
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
}
