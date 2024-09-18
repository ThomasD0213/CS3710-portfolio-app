class Student < ApplicationRecord
  validates :school_email, uniqueness: true
end
