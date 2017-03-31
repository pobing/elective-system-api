class Teacher < ApplicationRecord
  has_and_belongs_to_many :students
  has_many :courses, dependent: :destroy

  PER_PAGE = 20
end
