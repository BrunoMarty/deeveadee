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
    @dvds = Dvd.page(@page).per(6)

  end

  def dvdbycat
    @cat = Categorie.find(params[:id])
    @dvds = @cat.dvds
  end

  def dvd
    @dvd = Dvd.find(params[:id])
    notes = @dvd.notes
    @moyenne = 0
    notes.each do |note|
      @moyenne += note.note
    end
    if notes.count > 0
    @moyenne = @moyenne / notes.count
    end
    @note = nil
    if session[:userid] != nil
      @note = Note.where("client_id = '"+session[:userid].to_s+"' AND dvd_id = '"+params[:id].to_s+"'").first
    end
    @comments = @dvd.remarques
  end

  def addcomment
    Remarque.create dvd_id: params[:dvd], commentaires: "#{params[:comment]}"
    redirect_to action: "dvd", id: "#{params[:dvd]}"
  end

  def addnote
    Note.create dvd_id: params[:dvd], client_id: session[:userid],note: params[:note]
    redirect_to action: "dvd", id: "#{params[:dvd]}"
  end
end
