class List < ApplicationRecord
  validates_presence_of :todo, :date, :description
end
