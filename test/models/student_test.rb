require "test_helper"

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "raises error when saving student without first name" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(last_name: "Test", school_email: "testmail@msudenver.edu", major: "CS", graduation_date: Date.today)
    end
  end
  
  test "raises error when saving student without last name" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "Test", school_email: "testmail@msudenver.edu", major: "CS", graduation_date: Date.today)
    end
  end
  
  test "raises error when saving student without school email" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "test", last_name: "Test", major: "CS", graduation_date: Date.today)
    end
  end
  
  test "raises error when saving student without major" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "test", last_name: "Test", school_email: "testmail@msudenver.edu", graduation_date: Date.today)
    end
  end
  
  test "raises error when saving student without graduation date" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "test", last_name: "Test", school_email: "testmail@msudenver.edu", major: "CS")
    end
  end
  
  test "raises error when saving student with duplicate emails" do
    Student.create!(first_name: "test0", last_name: "Test0", school_email: "testmail@msudenver.edu", major: "CS", graduation_date: Date.today)
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "test", last_name: "Test", school_email: "testmail@msudenver.edu", major: "CS", graduation_date: Date.today)
    end
  end
  
  test "student should be created without issue" do
    assert_no_error_reported do
      Student.create!(first_name: "test0", last_name: "Test0", school_email: "testmail@msudenver.edu", major: "CS", graduation_date: Date.today)
    end
  end
  
  test "raises error when saving student with non msudenver email" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "test", last_name: "Test", school_email: "testmail@example.com", major: "CS", graduation_date: Date.today)
    end
  end
  
end
