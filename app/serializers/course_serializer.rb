class CourseSerializer < ActiveModel::Serializer
  attributes :id, :racecourse_id, :coursetype_id, :course_length, :created_at, :updated_at

  has_many :races
end
