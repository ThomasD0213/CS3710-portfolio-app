class Student < ApplicationRecord
  has_one_attached :profile_picture
  validates :first_name, :last_name, :major, :graduation_date, presence: true
  validates :school_email, format: {with: /[A-Za-z0-9]+@msudenver\.edu/, message: "Must be a valid msudenver.edu email"}, uniqueness: true, presence: true
end
