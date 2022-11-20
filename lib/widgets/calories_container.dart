import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kalori/constants.dart';

typedef _TableCaoriesBool(
  bool tableCalories,
);

class CaloriesContainer extends StatelessWidget {
  CaloriesContainer({
    Key? key,
    required int calories,
    required this.tableCaoriesBool
  })  : _calories = calories,
        super(key: key);

  final int _calories;
  final _TableCaoriesBool tableCaoriesBool;
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

  @override
  Widget build(BuildContext context) {
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
                  child: Text(
                    "Kalori yang diperlukan untuk berat badan sekarang $_calories kalori / hari",
                    style: const TextStyle(
                      fontSize: 18,
                      color: textColor,
                    ),
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
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                        tableCaoriesBool(true);
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
}
