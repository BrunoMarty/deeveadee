class Societe < ActiveRecord::Base
  has_many :abonnements
  has_many :dvds
end