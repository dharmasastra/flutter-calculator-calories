class Kalori {
  final int kalori;

  Kalori({required this.kalori});

  factory Kalori.fromjson(Map<String, dynamic> json) {
    return Kalori(kalori: json['kalori']);
  }
}
