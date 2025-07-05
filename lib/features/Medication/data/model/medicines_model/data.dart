import 'package:equatable/equatable.dart';

import 'medicine.dart';

class Data extends Equatable {
  final List<Medicine>? medicine;
  final int? total;
  final int? page;
  final int? limit;
  final int? totalPages;

  const Data({
    this.medicine,
    this.total,
    this.page,
    this.limit,
    this.totalPages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    medicine:
        (json['medicine'] as List<dynamic>?)
            ?.map((e) => Medicine.fromJson(e as Map<String, dynamic>))
            .toList(),
    total: json['total'] as int?,
    page: json['page'] as int?,
    limit: json['limit'] as int?,
    totalPages: json['totalPages'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'medicine': medicine?.map((e) => e.toJson()).toList(),
    'total': total,
    'page': page,
    'limit': limit,
    'totalPages': totalPages,
  };

  @override
  List<Object?> get props => [medicine, total, page, limit, totalPages];
}
