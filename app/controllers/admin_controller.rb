class AdminController < ApplicationController
  include ActionController::UrlFor
  include Rails.application.routes.url_helpers
  def index
    @title = "Administration"
  end

  # Fonctions d'affichage des tables, possible de faire qu'une seule fonction mais comment ?
  def client
    @title = "Clients"
    @clients = Client.all
  end

  def categorie
    @title = "Categories"
    @categories = Categorie.all
  end

  def societe
    @title = "Sociétés"
    @societes = Societe.all
  end

  def acteur
    @title = "Acteurs"
    @acteurs = Acteur.all
  end

  def dvd
    @title = "DVD"
    @dvds = Dvd.all
    @acteurs = Acteur.all
    @categorie = Categorie.all
  end

  # Fonctions d'ajouter dans les tables, possible de faire qu'une seule fonction mais comment ?
  def addclient
    Client.create abonnement_id:0, email: "#{params[:email]}", mdp: "#{params[:password]}", nom: "#{params[:nom]}", prenom: "#{params[:prenom]}"
    redirect_to action: "client"
  end

  def addcategorie
    Categorie.create nom: params[:nom]
    redirect_to action: "categorie"
  end

  def addsociete
    Societe.create nom: params[:nom], rue: params[:rue], ville: params[:ville], directeur: params[:directeur]
    redirect_to action: "societe"
  end

  def addacteur
    Acteur.create nom: params[:nom], prenom: params[:prenom], age: params[:date],sexe: params[:sexe]
    redirect_to action: "acteur"
  end

  def adddvd
    Dvd.create titre: params[:titre],
               auteur: params[:auteur],
               acteur_id: params[:acteur],
               role: params[:role],
               annee: params[:annee],
               categorie_id: params[:categorie],
               dateAchat: params[:date],
               nombre: params[:nombre],
               societe_id: params[:societe]
    redirect_to action: "dvd"
  end



  # Fonction magique qui peut supprimer tout et n'importe quoi !
  def remove
    params[:classe].capitalize.constantize.find(params[:id]).destroy
    redirect_to action: "#{params[:classe]}"
  end

  def autocompletecat
    @cats = Categorie.where("nom LIKE '%"+params[:data]+"%'").first(5)
    render :json => @cats.to_json
  end

  def autocompleteact
    @acts = Acteur.where("nom LIKE '%"+params[:data]+"%'").first(5)
    render :json => @acts.to_json
  end

  def autocompletesoc
    @acts = Societe.where("nom LIKE '%"+params[:data]+"%'").first(5)
    render :json => @acts.to_json
  end
end
