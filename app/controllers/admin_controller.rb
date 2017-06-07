class AdminController < ApplicationController
  include ActionController::UrlFor
  include Rails.application.routes.url_helpers
  def index
    @title = "Administration"
  end

  def client
    @title = "Clients"
    @clients = Client.all
  end

  def addclient
    Client.create abonnement_id:0, email: "#{params[:email]}", mdp: "#{params[:password]}", nom: "#{params[:nom]}", prenom: "#{params[:prenom]}"
    redirect_to action: "client"
  end

  # Fonction de suppression qui prend en paramètre une table/classe et une id
  def remove
    params[:classe].capitalize.constantize.find(params[:id]).destroy
    redirect_to action: "#{params[:classe]}"
  end
end
