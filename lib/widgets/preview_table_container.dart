import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:kalori/constants.dart';
import 'package:kalori/models/table_model.dart';

class TablePreviewContainer extends StatefulWidget {
  TablePreviewContainer(
      {Key? key,
      required this.totalBreakfast,
      required this.totalLunch,
      required this.totalDinner,
      required this.totalSnackBeforeLunch,
      required this.totalSnackBeforeDinner,
      required this.selectedTableCaloriesBreakfast,
      required this.selectedTableCaloriesLunch,
      required this.selectedTableCaloriesDinner,
      required this.selectedTableCaloriesSnackBeforeLunch,
      required this.selectedTableCaloriesSnackBeforeDinner})
      : super(key: key);

  final int totalBreakfast;
  final int totalLunch;
  final int totalDinner;
  final int totalSnackBeforeLunch;
  final int totalSnackBeforeDinner;
  List<TableKalori> selectedTableCaloriesBreakfast = [];
  List<TableKalori> selectedTableCaloriesLunch = [];
  List<TableKalori> selectedTableCaloriesDinner = [];
  List<TableKalori> selectedTableCaloriesSnackBeforeLunch = [];
  List<TableKalori> selectedTableCaloriesSnackBeforeDinner = [];

  @override
  State<TablePreviewContainer> createState() => _TablePreviewContainerState();
}

class _TablePreviewContainerState extends State<TablePreviewContainer> {
  List<String> columns = ['Nama Bahan', "Kalori"];

  @override
  Widget build(BuildContext context) {
    final int totalKalori = widget.totalBreakfast + widget.totalSnackBeforeLunch + widget.totalLunch + widget.totalSnackBeforeDinner + widget.totalDinner;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            tableCategories(
              "Menu Sarapan",
              widget.selectedTableCaloriesBreakfast,
              widget.totalBreakfast,
            ),
            const SizedBox(
              width: 11,
            ),
            tableCategories(
              "Menu Snack Siang",
              widget.selectedTableCaloriesSnackBeforeLunch,
              widget.totalSnackBeforeLunch,
            ),
            const SizedBox(
              width: 11,
            ),
            tableCategories(
              "Menu Makan Siang",
              widget.selectedTableCaloriesLunch,
              widget.totalLunch,
            ),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            tableCategories(
              "Menu Snack Sore",
              widget.selectedTableCaloriesSnackBeforeDinner,
              widget.totalSnackBeforeDinner,
            ),
            const SizedBox(
              width: 11,
            ),
            tableCategories(
              "Menu Makan Malam",
              widget.selectedTableCaloriesDinner,
              widget.totalDinner,
            ),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Container(
          height: 200,
          width: double.infinity,
          color: secondaryColor,
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              text: "Total Kalori sesuai menu yang di pilih ",
              style: const TextStyle(
                fontSize: 18,
                color: textColor,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: totalKalori.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: ' kkal'),
              ],
            ),
          ),
        )
      ],
    );
  }

  Column tableCategories(String title, List<TableKalori> dataTable, int total) {
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
          width: 435,
          height: 550,
          child: Column(
            children: [
              SizedBox(
                width: 435,
                height: 500,
                child: DataTable2(
                  columnSpacing: defaultPadding,
                  horizontalMargin: defaultPadding,
                  dataRowHeight: 60,
                  headingTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13),
                  columns: getColumns(columns),
                  rows: getRowSelected(dataTable),
                ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Container(
                width: 435,
                padding: const EdgeInsets.only(right: 110),
                // alignment: Alignment.centerLeft,
                child: Text(
                  "Total Kalori: $total",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
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
