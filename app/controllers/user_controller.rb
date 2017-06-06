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
       Client.create email: "#{params[:nom]}", mdp: params[:password]
       redirect_to action: "index"

      # redirect_to root_path
    end
  end

  def disconnect
    session[:useremail] = nil
    session[:userid] = nil
    redirect_to action: "index"
  end
end
