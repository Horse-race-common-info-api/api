class RaceSerializer < ActiveModel::Serializer
  attributes :id, :held_id, :course_id, :race_round, :name, :created_at, :updated_at

  belongs_to :held
  belongs_to :course
end
