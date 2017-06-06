class MainController < ApplicationController
  include ActionController::UrlFor
  include Rails.application.routes.url_helpers

  def index
    @title = "Bienvenue sur Deeveadee";
    @content = "Site de location de DVD !";
    @lastdvd = Dvd.last;
  end

  def dvds
    @title = "Nos DVD"
    @cats = Categorie.all
    @page = params[:page]
    @dvds = Dvd.page(@page).per(12)

  end

  def dvdbycat
    @cat = Categorie.find(params[:id])
    @dvds = @cat.dvds
  end

  def dvd
    @dvd = Dvd.find(params[:id])
    @comments = @dvd.remarques
  end

  def addcomment
    Remarque.create dvd_id: params[:dvd], commentaires: "#{params[:comment]}"
    redirect_to action: "dvd", id: "#{params[:dvd]}"
  end
end
