class Dvd < ActiveRecord::Base
  belongs_to :categorie
  has_many :remarques
end