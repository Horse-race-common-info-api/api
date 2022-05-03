class HeldSerializer < ActiveModel::Serializer
  attributes :id, :racecourse_id, :held_year, :held_month, :held_day,
             :number_of_times, :number_of_days, :created_at, :updated_at

  has_many :races
end
