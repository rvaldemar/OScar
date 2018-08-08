class Repo < ApplicationRecord
  belongs_to :user

  has_many :collaborations
end
