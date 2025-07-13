import 'package:dartz/dartz.dart';
import 'package:techmed/Core/error/failures.dart';
import 'package:techmed/features/Prescription/data/models/prescription_details/prescription_details.dart';
import 'package:techmed/features/Prescription/data/models/prescriptions_model/prescriptions_model.dart';

abstract class PrescriptionRepository {
  Future<Either<Failures, PrescriptionsModel>> getPrescriptions();
  Future<Either<Failures, PrescriptionDetails>> getSinglePrescription(int id);
}
