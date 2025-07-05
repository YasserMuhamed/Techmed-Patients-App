import 'package:equatable/equatable.dart';

import 'doctor.dart';

class Data extends Equatable {
  final List<Doctor>? doctors;
  final int? total;
  final int? page;
  final int? limit;
  final int? totalPages;

  const Data({
    this.doctors,
    this.total,
    this.page,
    this.limit,
    this.totalPages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    doctors:
        (json['doctors'] as List<dynamic>?)
            ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
            .toList(),
    total: json['total'] as int?,
    page: json['page'] as int?,
    limit: json['limit'] as int?,
    totalPages: json['totalPages'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'doctors': doctors?.map((e) => e.toJson()).toList(),
    'total': total,
    'page': page,
    'limit': limit,
    'totalPages': totalPages,
  };

  @override
  List<Object?> get props => [doctors, total, page, limit, totalPages];
}
