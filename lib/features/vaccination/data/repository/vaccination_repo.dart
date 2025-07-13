import 'package:dartz/dartz.dart';
import 'package:techmed/Core/error/failures.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_model/vaccination_model.dart';
import 'package:techmed/features/vaccination/data/models/vaccination_details/vaccination_details.dart';
import 'package:techmed/features/vaccination/data/models/create_vaccination_request.dart';

abstract class VaccinationRepo {
  Future<Either<Failures, VaccinationModel>> getVaccinations();
  Future<Either<Failures, VaccinationDetails>> getSingleVaccination(
    int vaccinationId,
  );
  Future<Either<Failures, dynamic>> deleteVaccination(int vaccinationId);
  Future<Either<Failures, dynamic>> createVaccination(
    CreateVaccinationRequest vaccinationData,
  );
}
