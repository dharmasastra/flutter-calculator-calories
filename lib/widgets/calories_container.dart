import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kalori/constants.dart';
import 'package:kalori/models/menu_model.dart';

typedef _TableCaoriesBool(
  bool tableCalories,
);

class CaloriesContainer extends StatelessWidget {
  CaloriesContainer({
    Key? key,
    required double calories,
    required double caloriesIdeal,
    required double bbi,
    required this.tableCaloriesBool,
  })  : _calories = calories,
        _caloriesIdeal = caloriesIdeal,
        _bbi = bbi,
        super(key: key);

  final double _calories;
  final double _caloriesIdeal;
  final double _bbi;
  final _TableCaoriesBool tableCaloriesBool;

  String html = """
      <div>
        <h3>Tips pola makan yang perlu diperhatikan:</h3>
        <ul>
          <li>Makanlah tetap 3 kali sehari dengan jadwal teratur. Makan pada waktunya akan membuat nafsu makan lebih terkendali. Di antaranya boleh ngemil, pilihlah cemilan buah.</li>
          <li>Pada saat makan, kunyalah makanan sampai halus. Dengan cara ini, porsi yang dimakan lebih sedikit karena perut lebih merasa kenyang.</li>
          <li>Pada saat makan berkonsentrasilah pada makanan jangan sambil membaca koran, meninton televisi. Sehingga Anda sadar akan jumlah makanan yang dimakan.</li>
          <li>Akhirnya, jangan lupa olahraga yang akan membakar kalori.</li>
        </ul>
      </div> """;
  List<String> columns = ['Nama', "Kalori"];
  @override
  Widget build(BuildContext context) {
    double breakfast = _calories * (20 / 100);
    double snack = _calories * (12.5 / 100);
    double lunch = _calories * (30 / 100);
    double dinner = _calories * (25 / 100);

    List<Menu> _data = [
      Menu(name: "Sarapan", kalori: breakfast.toStringAsFixed(0)),
      Menu(name: "Snack", kalori: snack.toStringAsFixed(0)),
      Menu(name: "Makan Siang", kalori: lunch.toStringAsFixed(0)),
      Menu(name: "Snack", kalori: snack.toStringAsFixed(0)),
      Menu(name: "Makan Malam", kalori: dinner.toStringAsFixed(0)),
    ];

    return Container(
      height: 500,
      width: double.infinity,
      color: secondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(-13 / 360),
              child: Image.asset(
                "assets/images/food.png",
              ),
            ),
          ),
          const SizedBox(
            width: defaultPadding,
          ),
          if (_calories != 0) ...{
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 400,
                  child: RichText(
                    text: TextSpan(
                      text:
                          "Kalori yang diperlukan untuk berat badan sekarang ",
                      style: const TextStyle(
                        fontSize: 18,
                        color: textColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: _calories.toStringAsFixed(0),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: ' kalori / hari!'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                 const Text(
                  "Pembagian Waktu Makan Sesuai Kalorinya",
                  style: TextStyle(
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: textColor,
                    ),
                  ),
                  width: 300,
                  height: 200,
                  child: DataTable2(
                    columnSpacing: defaultPadding,
                    horizontalMargin: defaultPadding,
                    dataRowHeight: 28,
                    minWidth: 250,
                    headingTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    columns: getColumns(columns),
                    rows: getRowSelected(_data),
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                SizedBox(
                    width: 400,
                    child: RichText(
                      text: TextSpan(
                        text: "Berat badan idealnya adalah ",
                        style: const TextStyle(
                          fontSize: 18,
                          color: textColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: _bbi.toInt().toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                              text:
                                  ' dan kalori yang dibutuhkan dari berat badan idealnya adalah '),
                          TextSpan(
                            text: _caloriesIdeal.toStringAsFixed(0),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: ' kalori / hari!'),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: defaultPadding,
                ),
                SizedBox(
                  width: 200,
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      tableCaloriesBool(true);
                    },
                    child: const Text(
                      "Pilih Makanan",
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
          } else ...{
            SizedBox(
              width: 400,
              child: Html(
                data: html,
              ),
            ),
          },
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
  List<DataRow> getRowSelected(List<Menu> tableCalories) => tableCalories
      .map(
        (Menu calories) => DataRow(
          cells: [
            DataCell(
              SizedBox(
                width: 150,
                child: Text(calories.name),
              ),
            ),
            DataCell(
              SizedBox(
                width: 50,
                child: Text(calories.kalori),
              ),
            )
          ],
        ),
      )
      .toList();
}
