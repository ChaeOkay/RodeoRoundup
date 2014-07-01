class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_1, :address_2, :city, :state, :zip, :phone
end
