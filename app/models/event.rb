class Event < ApplicationRecord
  # Direct associations

  has_many   :participants,
             :dependent => :destroy

  belongs_to :venue,
             :required => false,
             :class_name => "Restaurant"

  # Indirect associations

  # Validations

end
