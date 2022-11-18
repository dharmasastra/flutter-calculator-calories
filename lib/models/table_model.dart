class TableKalori {
  final String name;
  final int kalori;

  TableKalori({required this.name, required this.kalori});

  factory TableKalori.fromjson(Map<String, dynamic> json) =>
      TableKalori(name: json['name'], kalori: json['kalori']);
}

List<TableKalori> data = [
  TableKalori(name: "Ikan Bandeng Segar", kalori: 123),
  TableKalori(name: "Cumi", kalori: 75),
  TableKalori(name: "Nasi Putih ", kalori: 130),
  TableKalori(name: "Kentang", kalori: 77),
  TableKalori(name: "Daging Kambing", kalori: 109),
  TableKalori(name: "Dada Ayam", kalori: 172),
  TableKalori(name: "Ayam Paha Atas", kalori: 221),
  TableKalori(name: "Ayam Paha Bawah", kalori: 214),
  TableKalori(name: "Belut Segar", kalori: 70),
  TableKalori(name: "Ikan Mujahir Segar", kalori: 86),
];
