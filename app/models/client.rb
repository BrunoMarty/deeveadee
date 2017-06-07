class Client < ActiveRecord::Base
  belongs_to :abonnement
  has_many :emprunts
end