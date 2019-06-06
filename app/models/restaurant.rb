class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :events,
             :foreign_key => "venue_id",
             :dependent => :nullify

  has_many   :ratings,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
