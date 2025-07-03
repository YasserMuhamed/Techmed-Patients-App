import 'package:dartz/dartz.dart';
import 'package:techmed/Core/error/failures.dart';
import 'package:techmed/Features/Medication/data/model/medications_response/medications_response.dart';
import 'package:techmed/Features/Medication/data/model/prescriptions_response/prescriptions_response.dart';

abstract class MedicationRepo {
  Future<Either<Failures, MedicationsResponse>> getMedications();
  Future<Either<Failures, PrescriptionsResponse>> getPrescriptions();
}
