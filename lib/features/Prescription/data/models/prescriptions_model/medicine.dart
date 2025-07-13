import 'package:equatable/equatable.dart';

class Medicine extends Equatable {
  final int id;
  final int dosageFormId;
  final int inventoryId;
  final int hospitalId;
  final String enName;
  final String arName;
  final String enDescription;
  final String arDescription;
  final String activeIngredients;
  final int totalTablets;
  final String bgColor;
  final String textColor;
  final String notes;
  final String barcode;
  final String image;
  final String concentration;
  final double price;
  final int numberOfTape;
  final int numberOfPillsPerTape;
  final DateTime expirationDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Medicine({
    required this.id,
    required this.dosageFormId,
    required this.inventoryId,
    required this.hospitalId,
    required this.enName,
    required this.arName,
    required this.enDescription,
    required this.arDescription,
    required this.activeIngredients,
    required this.totalTablets,
    required this.bgColor,
    required this.textColor,
    required this.notes,
    required this.barcode,
    required this.image,
    required this.concentration,
    required this.price,
    required this.numberOfTape,
    required this.numberOfPillsPerTape,
    required this.expirationDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'] as int,
      dosageFormId: json['dosageFormId'] as int,
      inventoryId: json['inventoryId'] as int,
      hospitalId: json['hospitalId'] as int,
      enName: json['enName'] as String,
      arName: json['arName'] as String,
      enDescription: json['enDescription'] as String,
      arDescription: json['arDescription'] as String,
      activeIngredients: json['activeIngredients'] as String,
      totalTablets: json['totalTablets'] as int,
      bgColor: json['bgColor'] as String,
      textColor: json['textColor'] as String,
      notes: json['notes'] as String,
      barcode: json['barcode'] as String,
      image: json['image'] as String,
      concentration: json['concentration'] as String,
      price: json['price'] == null ? 0.0 : (json['price'] is int ? (json['price'] as int).toDouble() : json['price'] as double),
      numberOfTape: json['numberOfTape'] as int,
      numberOfPillsPerTape: json['numberOfPillsPerTape'] as int,
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dosageFormId': dosageFormId,
      'inventoryId': inventoryId,
      'hospitalId': hospitalId,
      'enName': enName,
      'arName': arName,
      'enDescription': enDescription,
      'arDescription': arDescription,
      'activeIngredients': activeIngredients,
      'totalTablets': totalTablets,
      'bgColor': bgColor,
      'textColor': textColor,
      'notes': notes,
      'barcode': barcode,
      'image': image,
      'concentration': concentration,
      'price': price,
      'numberOfTape': numberOfTape,
      'numberOfPillsPerTape': numberOfPillsPerTape,
      'expirationDate': expirationDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
    id,
    dosageFormId,
    inventoryId,
    hospitalId,
    enName,
    arName,
    enDescription,
    arDescription,
    activeIngredients,
    totalTablets,
    bgColor,
    textColor,
    notes,
    barcode,
    image,
    concentration,
    price,
    numberOfTape,
    numberOfPillsPerTape,
    expirationDate,
    createdAt,
    updatedAt,
  ];
}
