class Assignment < ApplicationRecord
  belongs_to :internship_assignment
  belongs_to :mentor, class_name: "User"
  belongs_to :student, class_name: "User"
  has_one :evaluation
  validates_presence_of :evaluation
end
