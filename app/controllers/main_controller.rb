class MainController < ApplicationController
  include ActionController::UrlFor
  include Rails.application.routes.url_helpers

  # Page d'accueil
  def index
    @title = "Bienvenue sur Deeveadee"
    @content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quis ipsum justo. Mauris sed est nisi. Quisque sodales velit id dolor vehicula, sit amet consectetur est laoreet. Etiam et felis non velit facilisis aliquet. Vestibulum eget varius tellus, vel vestibulum diam. Nunc et massa diam. Etiam lacinia nisl at eros fermentum, at dignissim purus laoreet. Praesent tempus dui non purus tempus sagittis. Duis tempor vulputate nunc, sit amet finibus quam tincidunt non. Mauris tempus molestie tellus, id cursus libero mollis non. Sed eget urna et nunc dictum dapibus. Etiam posuere nec purus eu varius. Integer feugiat, leo vehicula dapibus pulvinar, tellus ipsum tempus mauris, eu semper sapien velit a dolor. Praesent efficitur ipsum orci, iaculis placerat lectus porta at."
    @lastdvds = Dvd.last(3)
    @abos = Abonnement.all
  end

  # Liste de toutes les DVD
  def dvds
    @title = "Nos DVD"
    @cats = Categorie.all
    @page = params[:page]
    @dvds = Dvd.page(@page).per(6)
    @top = Notesmoyenne.first(3)
  end

  # Liste des Dvds d'une catégorie
  def dvdbycat
    cat = Categorie.find(params[:id])
    @title = "Film de type :" + cat.nom.to_s
    @cats = Categorie.all
    @dvds = cat.dvds
    @top = @dvds.order('consultations desc').first(3)
  end

  # Détail d'un DVD
  def dvd
    @dvd = Dvd.find(params[:id])
    @dvd.consultations += 1
    @dvd.save
    notes = @dvd.notes
    @moyenne = 0
    notes.each do |note|
      @moyenne += note.note
    end
    if notes.count > 0
    @moyenne = @moyenne / notes.count
    end
    @note = 0
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
