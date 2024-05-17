# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Shelters
shelter1 = Shelter.create!(foster_program: true, name: "Whimsy Whiskers", city: "Denver", rank: 42)
shelter2 = Shelter.create!(foster_program: false, name: "Whimsy Whiskers", city: "Miami", rank: 42)
shelter3 = Shelter.create!(foster_program: true, name: "Meow Wows", city: "New York", rank: 42)

# Pets
pet1 = Pet.create!(name: "Buddy", breed: "Golden Retriever", age: 3, adoptable: true, shelter: shelter1)
pet2 = Pet.create!(name: "Mittens", breed: "Tabby", age: 5, adoptable: false, shelter: shelter2)
pet3 = Pet.create!(name: "Rex", breed: "German Shepherd", age: 2, adoptable: true, shelter: shelter1)

# Veterinary Offices
vet_office1 = VeterinaryOffice.create!(name: "Healthy Paws", max_patient_capacity: 50, boarding_services: true)
vet_office2 = VeterinaryOffice.create!(name: "Animal Care Clinic", max_patient_capacity: 30, boarding_services: false)

# Veterinarians
vet1 = Veterinarian.create!(name: "Dr. Smith", review_rating: 5, on_call: true, veterinary_office: vet_office1)
vet2 = Veterinarian.create!(name: "Dr. Jones", review_rating: 4, on_call: false, veterinary_office: vet_office2)
vet3 = Veterinarian.create!(name: "Dr. Brown", review_rating: 3, on_call: true, veterinary_office: vet_office1)

# Applications
application1 = Application.create!(name: "John Doe", address: "123 Elm St", description: "Looking for a friendly dog", status: "Pending")
application2 = Application.create!(name: "Jane Smith", address: "456 Maple Ave", description: "Interested in a cat", status: "Approved")

# Pet Applications
PetApplication.create!(pet: pet1, application: application1)
PetApplication.create!(pet: pet2, application: application2)
PetApplication.create!(pet: pet3, application: application1)
