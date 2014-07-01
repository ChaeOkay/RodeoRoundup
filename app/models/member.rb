class Member < ActiveRecord::Base
  has_many :organizations, dependent: :destroy

  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :username,    presence: true, uniqueness: true
end
