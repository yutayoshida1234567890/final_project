class Rating < ApplicationRecord
  # Direct associations

  belongs_to :restaurant,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
