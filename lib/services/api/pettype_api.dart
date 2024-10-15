import '../../models/api/pettype_model.dart';
import '../../models/api/token_model.dart';

class PettypeApi {
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get a pet type by Pet Type ID
  Future<PetTypeModel> getPetTypeByPetTypeId(
      int petTypeId, TokenModel token) async {
    // Call the API to get a pet type by ID
    return PetTypeModel(
      petTypeId: 1,
      petType: 'Dog',
    );
  }

  // Get a pet type by Pet Type
  Future<PetTypeModel> getPetTypeByPetType(
      String petType, TokenModel token) async {
    // Call the API to get a pet type by name
    return PetTypeModel(
      petTypeId: 1,
      petType: 'Dog',
    );
  }

  // ! ----------------------------------------------------------------------------------------------------------
  // ! Admin Only
  // ! ----------------------------------------------------------------------------------------------------------
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Post
  // ? ----------------------------------------------------------------------------------------------------------
  // Create a new pet type
  Future<bool> createPetType(PetTypeModel petType, TokenModel token) async {
    // Call the API to create a new pet type
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get all pet types
  Future<List<PetTypeModel>> getAllPetTypes(TokenModel token) async {
    // Call the API to get all pet types
    return [
      PetTypeModel(
        petTypeId: 1,
        petType: 'Dog',
      ),
    ];
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Put
  // ? ----------------------------------------------------------------------------------------------------------
  // Update a pet type
  Future<bool> updatePetType(PetTypeModel petType, TokenModel token) async {
    // Call the API to update a pet type
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Delete
  // ? ----------------------------------------------------------------------------------------------------------
  // Delete a pet type by Pet Type ID
  Future<bool> deletePetTypeByPetTypeId(int petTypeId, TokenModel token) async {
    // Call the API to delete a pet type by ID
    return true;
  }

  // Delete a pet type by Pet Type
  Future<bool> deletePetTypeByPetType(String petType, TokenModel token) async {
    // Call the API to delete a pet type by name
    return true;
  }
}
