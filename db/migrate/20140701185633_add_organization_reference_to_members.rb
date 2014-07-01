class AddOrganizationReferenceToMembers < ActiveRecord::Migration
  def change
    add_reference :organizations, :member, index: true
  end
end
