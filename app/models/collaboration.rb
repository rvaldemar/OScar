class Collaboration < ApplicationRecord
  belongs_to :user
  belongs_to :repo

    include PgSearch

    pg_search_scope :global_search,
    associated_against: {
      user: [ [:name, 'C'] ],
      repo: [ [:name, 'A'], [:description, 'B'] ],
    },
    using: {
      tsearch: { prefix: true }
    }

end
