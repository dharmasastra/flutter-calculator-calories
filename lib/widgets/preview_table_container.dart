import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:kalori/constants.dart';
import 'package:kalori/models/table_model.dart';

class TablePreviewContainer extends StatelessWidget {
  TablePreviewContainer(
      {Key? key, required this.total, required this.selectedTableCalories})
      : super(key: key);

  final int total;
  final List<TableKalori> selectedTableCalories;

  List<String> columns = ['Nama Bahan (100g)', "Kalori"];

  @override
  Widget build(BuildContext context) {
    return Container(
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
              minWidth: 400,
              headingTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
        ],
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