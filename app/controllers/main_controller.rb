class MainController < ApplicationController
  def index
    @title = "Bienvenue sur Deeveadee";
    @content = "Site de location de DVD !";
    @lastdvd = Dvd.last;
  end

  def dvd
    @title = "Nos DVD"
    @cats = Categorie.all
    @page = params[:page]
    @dvds = Dvd.page(@page).per(12)

  end

  def dvdbycat
    @cat = Categorie.find(params[:id])
    @dvds = @cat.dvds
  end
end
