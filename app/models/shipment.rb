class Shipment < ApplicationRecord
  belongs_to :pig_house
  belongs_to :destination
end
