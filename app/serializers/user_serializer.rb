class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :first_name, :last_name, :phone, :home_church, :residence, :city, :date_of_birth, :membership_number, :created_at
end
