class Abonnement < ActiveRecord::Base
  belongs_to :societe
  has_many :clients
end