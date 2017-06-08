# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170602135019) do

  create_table "acteurs", force: :cascade do |t|
    t.string "nom", limit: 45
    t.string "prenom", limit: 45
    t.date "date"
    t.string "sexe", limit: 45
  end

  create_table "categories", force: :cascade do |t|
    t.text "nom"
  end

  create_table "clients", id: false, force: :cascade do |t|
    t.integer "id", limit: 11, null: false
    t.string "nom", limit: 45, null: false
    t.string "prenom", limit: 45, null: false
    t.string "adresse", limit: 45, null: false
  end

  create_table "dvds", force: :cascade do |t|
    t.string "titre", limit: 45
    t.string "auteur", limit: 45
    t.integer "acteur.html.erb", limit: 11
    t.string "role", limit: 45
    t.integer "année", limit: 11
    t.integer "genre", limit: 11
    t.date "dateAchat"
    t.integer "nombre", limit: 11
    t.integer "consultations", limit: 11
    t.integer "société", limit: 11
  end

  create_table "employes", force: :cascade do |t|
    t.string "nom", limit: 45, null: false
    t.string "prenom", limit: 45, null: false
    t.string "adresse", limit: 45, null: false
  end

  create_table "emprunts", force: :cascade do |t|
    t.integer "dvd", limit: 11, null: false
    t.date "date"
    t.integer "client", limit: 11
    t.integer "duree", limit: 11
  end

  create_table "notes", force: :cascade do |t|
    t.integer "dvd", limit: 11, null: false
    t.integer "note", limit: 11, null: false
  end

  create_table "remarques", id: false, force: :cascade do |t|
    t.integer "id", limit: 11, null: false
    t.integer "dvd", limit: 11, null: false
    t.string "commentaires", limit: 255, null: false
  end

  create_table "societes", force: :cascade do |t|
    t.string "nom", limit: 45
    t.string "rue", limit: 45
    t.string "ville", limit: 45
    t.string "directeur", limit: 45
  end

end
