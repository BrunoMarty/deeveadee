class UserController < ApplicationController
  include ActionController::UrlFor
  include Rails.application.routes.url_helpers
  # Fonction pour la connexion
  def index
    @title = "Connexion"
    if params[:nom] != nil && params[:password] != nil
      @test = params[:nom]
      account = Client.where("email = '"+params[:nom]+"' AND mdp = '"+params[:password]+"'").first
        if defined? session[:useremail]
          session[:useremail] = account.email
          session[:userid] = account.id
        end
    end
  end

  # Création de compte utilisateur
  def create
    @title = "Création de compte"
    if params[:nom] != nil && params[:password] != nil
       Client.create email: "#{params[:nom]}", mdp: params[:password], abonnement_id:0
       redirect_to action: "index"

      # redirect_to root_path
    end
  end

  def disconnect
    session[:useremail] = nil
    session[:userid] = nil
    redirect_to action: "index"
  end

  def account
    @title = "Mon Compte"
    @abos = Abonnement.all
    @client = Client.find(session[:userid])
    @emprunts = @client.emprunts
  end

  def updateaccount
    client = Client.find(session[:userid])
    client.nom = params[:nom]
    client.prenom = params[:prenom]
    client.email = params[:email]
    if params[:password].length != 0
    client.mdp = params[:password]
    end
    if params[:abo] == 0
      client.abonnement_id = nil
    else
      client.abonnement_id = params[:abo]
    end
    client.save
    redirect_to action: "account"
  end
end
