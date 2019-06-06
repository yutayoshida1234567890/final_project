class Event < ApplicationRecord
  # Direct associations

  belongs_to :venue,
             :required => false,
             :class_name => "Restaurant"

  # Indirect associations

  # Validations

end
