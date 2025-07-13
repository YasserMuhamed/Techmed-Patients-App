import 'package:dartz/dartz.dart';
import 'package:techmed/Core/error/failures.dart';
import 'package:techmed/features/medication/data/model/medication_details_response/medication_details_response.dart';
import 'package:techmed/features/medication/data/model/medications_response/medications_response.dart';
import 'package:techmed/features/medication/data/model/medicines_model/medicines_model.dart';
import 'package:techmed/features/medication/data/model/create_medication_request.dart';

abstract class MedicationRepo {
  Future<Either<Failures, MedicationsResponse>> getMedications();
  Future<Either<Failures, MedicinesModel>> getAllMedicines();
  Future<Either<Failures, MedicationDetailsResponse>> getSingleMedication(
    int medicationId,
  );
  Future<Either<Failures, dynamic>> deleteMedication(int medicationId);
  Future<Either<Failures, dynamic>> createMedication(
    CreateMedicationRequest medicationData,
  );

}
