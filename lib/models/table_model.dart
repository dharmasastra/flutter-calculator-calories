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
  TableKalori(name: "Pork Loin", kalori: 198),
  TableKalori(name: "Pork RIB", kalori: 211),
  TableKalori(name: "Pork Belly", kalori: 518),
  TableKalori(name: "Bayam", kalori: 23),
  TableKalori(name: "Sawi Putih", kalori: 9),
  TableKalori(name: "Tauge Kedelai", kalori: 76),
  TableKalori(name: "Rebung", kalori: 25),
  TableKalori(name: "Kol", kalori: 23),
  TableKalori(name: "Wortel", kalori: 41),
  TableKalori(name: "Brokoli", kalori: 34),
  TableKalori(name: "Terong", kalori: 25),
];
