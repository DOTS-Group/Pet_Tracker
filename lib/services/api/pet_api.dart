import '../../api/pet_model.dart';
import '../../api/token_model.dart';

class PetApi {
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Post
  // ? ----------------------------------------------------------------------------------------------------------
  // Create a new pet
  Future<bool> createPet(PetModel pet, TokenModel token) async {
    // Call the API to create a new pet
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get a pet by Pet ID
  Future<PetModel> getPetByPetId(int petId, TokenModel token) async {
    // Call the API to get a pet by ID
    return PetModel(
      petName: 'Dog',
      petBirthday: '2021-01-01',
      petType: 1,
      userId: 1,
      petWeight: 1.0,
      isMale: true,
    );
  }

  // Get a pet by User ID
  Future<List<PetModel>> getPetByUserId(int userId, TokenModel token) async {
    // Call the API to get a pet by ID
    return [
      PetModel(
        petName: 'Dog',
        petBirthday: '2021-01-01',
        petType: 1,
        userId: 1,
        petWeight: 1.0,
        isMale: true,
      ),
    ];
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Put
  // ? ----------------------------------------------------------------------------------------------------------
  // Update a pet
  Future<bool> updatePet(PetModel pet, TokenModel token) async {
    // Call the API to update a pet
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Delete
  // ? ----------------------------------------------------------------------------------------------------------
  // Delete a pet by Pet ID
  Future<bool> deletePetByPetId(int petId, TokenModel token) async {
    // Call the API to delete a pet by ID
    return true;
  }

  // ! ----------------------------------------------------------------------------------------------------------
  // ! Admin Only
  // ! ----------------------------------------------------------------------------------------------------------
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get a pet by User ID
  Future<List<PetModel>> getAllPets(TokenModel token) async {
    // Call the API to get a pet by ID
    return [
      PetModel(
        petName: 'Dog',
        petBirthday: '2021-01-01',
        petType: 1,
        userId: 1,
        petWeight: 1.0,
        isMale: true,
      ),
    ];
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Delete
  // ? ----------------------------------------------------------------------------------------------------------
  // Delete a pet by User ID
  Future<bool> deletePetByUserId(int userId, TokenModel token) async {
    // Call the API to delete a pet by ID
    return true;
  }
}
