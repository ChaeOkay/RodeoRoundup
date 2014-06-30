class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string  :name, null: false, uniqueness: true
      t.string  :address_1, null: false
      t.string  :address_2
      t.string  :city, null: false
      t.string  :state, null: false
      t.string  :zip, null: false
      t.string  :phone, null: false

      t.timestamps
    end
  end
end
