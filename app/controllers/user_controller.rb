class UserController < ApplicationController
  include ActionController::UrlFor
  include Rails.application.routes.url_helpers

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

  def create
    @title = "Création de compte"
    if params[:nom] != nil && params[:password] != nil
       Client.create email: "#{params[:nom]}", mdp: params[:password]
       redirect_to action: "index"

      # redirect_to root_path
    end

  end
end
