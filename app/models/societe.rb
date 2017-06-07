class Societe < ActiveRecord::Base
  has_many :abonnements
end