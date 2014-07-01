class MemberSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :full_name

  def full_name
    "#{object.first_name.capitalize} #{object.last_name.capitalize}"
  end
end
