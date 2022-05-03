class ApiDbRecord < ApplicationRecord
  self.abstract_class = true
  connects_to database: { writing: :api_db, reading: :api_db }
end
