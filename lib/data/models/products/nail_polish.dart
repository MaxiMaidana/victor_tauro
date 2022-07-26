import 'package:equatable/equatable.dart';

class NailPolish extends Equatable {
  final String? id;
  final String? name;
  final String? distributor;
  final String? urlPhoto;
  final String? barcode;
  final double? price;
  final String? colorCod;
  final String? colorName;

  const NailPolish({
    this.id,
    this.name,
    this.distributor,
    this.urlPhoto,
    this.barcode,
    this.price,
    this.colorCod,
    this.colorName,
  }) : super();

  @override
  List<Object?> get props => [];

  NailPolish copyWith({
    String? id,
    String? name,
    String? distributor,
    String? colorCod,
    String? colorName,
    String? urlPhoto,
    String? barcode,
    double? price,
  }) =>
      NailPolish(
        id: id ?? this.id,
        name: name ?? this.name,
        distributor: distributor ?? this.distributor,
        colorCod: colorCod ?? this.colorCod,
        colorName: colorName ?? this.colorName,
        urlPhoto: urlPhoto ?? this.urlPhoto,
        barcode: barcode ?? this.barcode,
        price: price ?? this.price,
      );

  factory NailPolish.fromJson(Map<String, dynamic> json) => NailPolish(
        id: json["id"],
        name: json["name"],
        distributor: json["distributor"],
        colorCod: json["color_cod"],
        colorName: json["color_name"],
        urlPhoto: json["url_photo"],
        barcode: json["barcode"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "distributor": distributor,
        "color_cod": colorCod,
        "color_name": colorName,
        "url_photo": urlPhoto,
        "barcode": barcode,
        "price": price,
      };
}
