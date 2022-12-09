class TableKalori {
  final String name;
  final int kalori;

  TableKalori({required this.name, required this.kalori});

  factory TableKalori.fromjson(Map<String, dynamic> json) =>
      TableKalori(name: json['name'], kalori: json['kalori']);
}

List<TableKalori> carbohydrates = [
  TableKalori(name: "Roti Tawar Putih (1 helai/slice)", kalori: 85),
  TableKalori(name: "Roti Tawar Gandum (1 helai/slice)", kalori: 81),
  TableKalori(name: "Nasi Putih (matang, 100gr)", kalori: 130),
  TableKalori(name: "Nasi Coklat (matang, 100gr)", kalori: 111),
  TableKalori(name: "Nasi Merah (matang, 100gr)", kalori: 110),
  TableKalori(name: "Kentang (mentah, 100gr)", kalori: 77),
  TableKalori(name: "Ubi (mentah, 100gr)", kalori: 86),
  TableKalori(name: "Bakmi (matang, 100gr)", kalori: 138),
  TableKalori(name: "Bihun (matang, 100gr)", kalori: 108),
  TableKalori(name: "Jagung (mentah, 100gr)", kalori: 366),
];

List<TableKalori> protein = [
  TableKalori(name: "Dada ayam tanpa kulit (mentah, 100gr)", kalori: 120),
  TableKalori(name: "Daging Kambing (mentah, 100gr)", kalori: 109),
  TableKalori(name: "Tenderloin (mentah, 100gr)", kalori: 151),
  TableKalori(name: "Pork loin (mentah, 100gr)", kalori: 198),
  TableKalori(name: "Tahu (mentah, 100gr)", kalori: 76),
  TableKalori(name: "Tempe (mentah, 100gr)", kalori: 192),
  TableKalori(name: "Salmon (mentah, 100gr)", kalori: 208),
  TableKalori(name: "Tuna (mentah, 100gr)", kalori: 144),
  TableKalori(name: "Nila (mentah, 100gr)", kalori: 96),
  TableKalori(name: "Lele (mentah, 100gr)", kalori: 119),
  TableKalori(name: "Bandeng (mentah, 100gr)", kalori: 148),
  TableKalori(name: "Belut (mentah, 100gr)", kalori: 184),
  TableKalori(name: "Cumi-cumi (mentah, 100gr)", kalori: 92),
  TableKalori(name: "Udang (mentah, 100gr)", kalori: 84),
];

List<TableKalori> vegetables = [
  TableKalori(name: "Tauge (mentah, 100gr)", kalori: 30),
  TableKalori(name: "Wortel (mentah, 100gr)", kalori: 41),
  TableKalori(name: "Bayam (mentah, 100gr)", kalori: 23),
  TableKalori(name: "Kol (mentah, 100gr)", kalori: 25),
  TableKalori(name: "Brokoli (mentah, 100gr)", kalori: 34),
  TableKalori(name: "Timun (mentah, 100gr)", kalori: 15),
  TableKalori(name: "Tomat (mentah, 100gr)", kalori: 18),
  TableKalori(name: "Kangkung (mentah, 100gr)", kalori: 19),
  TableKalori(name: "Selada (mentah, 100gr)", kalori: 15),
  TableKalori(name: "Terong (mentah, 100gr)", kalori: 25),
  TableKalori(name: "Sawi (mentah, 100gr)", kalori: 13),
  TableKalori(name: "Kacang Panjang (mentah, 100gr)", kalori: 47),
  TableKalori(name: "Buncis (mentah, 100gr)", kalori: 31),
  TableKalori(name: "Asparagus (mentah, 100gr)", kalori: 20),
  TableKalori(name: "Lobak (mentah, 100gr)", kalori: 22),
  TableKalori(name: "Jagung muda (mentah, 100gr)", kalori: 42),
  TableKalori(name: "Daun Singkong (mentah, 100gr)", kalori: 38),
];

List<TableKalori> fruits = [
  TableKalori(name: "Apel (mentah, 100gr)", kalori: 52),
  TableKalori(name: "Mangga (mentah, 100gr)", kalori: 60),
  TableKalori(name: "Jeruk (mentah, 100gr)", kalori: 57),
  TableKalori(name: "Pisang (mentah, 100gr)", kalori: 89),
  TableKalori(name: "Semangka (mentah, 100gr)", kalori: 30),
  TableKalori(name: "Pir (mentah, 100gr)", kalori: 57),
  TableKalori(name: "Strawberry (mentah, 100gr)", kalori: 32),
  TableKalori(name: "Buah naga (mentah, 100gr)", kalori: 49),
  TableKalori(name: "Pepaya (mentah, 100gr)", kalori: 43),
  TableKalori(name: "Durian (mentah, 100gr)", kalori: 147),
  TableKalori(name: "Anggur (mentah, 100gr)", kalori: 67),
  TableKalori(name: "Nanas (mentah, 100gr)", kalori: 50),
  TableKalori(name: "Rambutan (mentah, 100gr)", kalori: 82),
  TableKalori(name: "Alpukat (mentah, 100gr)", kalori: 160),
  TableKalori(name: "Nangka (mentah, 100gr)", kalori: 95),
  TableKalori(name: "Manggis (mentah, 100gr)", kalori: 73),
];