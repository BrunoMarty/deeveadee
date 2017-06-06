class UserController < ApplicationController
  def index
    @title = "Connexion"
    if params[:nom] != nil && params[:password] != nil
      @test = params[:nom]
      account = Client.where("nom = '"+params[:nom]+"' AND password = '"+params[:password]+"'").first
        if defined? session[:user]
          session[:username] = account.nom
          session[:userid] = account.id
        end
    end
  end
end
