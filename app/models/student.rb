class Student < ApplicationRecord
  VALID_MAJORS = ["Computer Engineering BS", 
                  "Computer Information Systems BS", 
                  "Computer Science BS",
                  "Cybersecurity BS",
                  "Data Science and Machine Learning BS" ]
  has_one_attached :profile_picture
  validates :first_name, :last_name, :major, :graduation_date, presence: true
  validates :school_email, format: {with: /[A-Za-z0-9]+@msudenver\.edu/, message: "Must be a valid msudenver.edu email"}, uniqueness: true, presence: true
  validates :major, inclusion: { in: VALID_MAJORS, message:"%{value} is not a valid major" }
end
