class Repo < ApplicationRecord

  belongs_to :user

  has_many :collaborations
  has_many :users, through: :collaborations

  include PgSearch

  pg_search_scope :global_search,
    against: [[:name, 'A'], [:description, 'B']],
    associated_against: {
      user: [[:name, 'C']]
    },
    using: {
      tsearch: { prefix: true }
  }

end
