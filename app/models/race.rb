class Race < ApplicationRecord
  belongs_to :held
  belongs_to :course

  scope :q, -> name { where("match (name) against ('#{name}')") }
end
