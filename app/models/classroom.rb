# == Schema Information
#
# Table name: classrooms
#
#  id          :integer          not null, primary key
#  course_name :string
#  semester    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Classroom < ActiveRecord::Base
  has_many :classroom_students
  has_many :students, through: :classroom_students
  validates :semester, presence: true
  validates :course_name, presence: true

  def oldest_student
    students.where("birthday is not null").order("birthday asc").first
  end
end