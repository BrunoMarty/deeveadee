class Dvd < ActiveRecord::Base

  has_many :remarques
  has_many :notes

  belongs_to :categorie
  belongs_to :societe
  belongs_to :acteur

end