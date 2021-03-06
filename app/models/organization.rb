class Organization < ActiveRecord::Base
  belongs_to :member

  validates :address_1, presence: true
  validates :city,      presence: true
  validates :name,      presence: true, uniqueness: true
  validates :phone,     presence: true
  validates :state,     presence: true
  validates :zip,       presence: true
end
