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

ActiveRecord::Schema.define(version: 2021_02_20_073211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "etablissement_id"
    t.bigint "matiere_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "telephone"
    t.index ["etablissement_id"], name: "index_authors_on_etablissement_id"
    t.index ["matiere_id"], name: "index_authors_on_matiere_id"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "status", default: 0
    t.bigint "author_id"
    t.bigint "niveau_id"
    t.bigint "seri_id"
    t.bigint "matiere_id"
    t.text "image"
    t.bigint "domaine_id"
    t.index ["author_id"], name: "index_blogs_on_author_id"
    t.index ["domaine_id"], name: "index_blogs_on_domaine_id"
    t.index ["matiere_id"], name: "index_blogs_on_matiere_id"
    t.index ["niveau_id"], name: "index_blogs_on_niveau_id"
    t.index ["seri_id"], name: "index_blogs_on_seri_id"
    t.index ["slug"], name: "index_blogs_on_slug", unique: true
  end

  create_table "centres", force: :cascade do |t|
    t.string "numcentre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "departement_id"
    t.index ["departement_id"], name: "index_centres_on_departement_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departements", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["region_id"], name: "index_departements_on_region_id"
    t.index ["user_id"], name: "index_departements_on_user_id"
  end

  create_table "domaines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "niveau_id"
    t.bigint "filiere_id"
    t.index ["filiere_id"], name: "index_domaines_on_filiere_id"
    t.index ["niveau_id"], name: "index_domaines_on_niveau_id"
  end

  create_table "eleves", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "cni"
    t.string "telephone"
    t.string "numtable"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "epreuves", force: :cascade do |t|
    t.string "sujet"
    t.bigint "matiere_id"
    t.bigint "seri_id"
    t.bigint "niveau_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matiere_id"], name: "index_epreuves_on_matiere_id"
    t.index ["niveau_id"], name: "index_epreuves_on_niveau_id"
    t.index ["seri_id"], name: "index_epreuves_on_seri_id"
  end

  create_table "etablissements", force: :cascade do |t|
    t.string "name"
    t.string "adresse"
    t.bigint "departement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departement_id"], name: "index_etablissements_on_departement_id"
  end

  create_table "exercices", force: :cascade do |t|
    t.text "introduction"
    t.text "developpement"
    t.text "conclusion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "filieres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "niveau_id"
    t.index ["niveau_id"], name: "index_filieres_on_niveau_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "juris", force: :cascade do |t|
    t.string "numjuri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "centre_id"
    t.index ["centre_id"], name: "index_juris_on_centre_id"
  end

  create_table "lecons", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matieres", force: :cascade do |t|
    t.string "name"
    t.bigint "seri_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "niveau_id"
    t.index ["niveau_id"], name: "index_matieres_on_niveau_id"
    t.index ["seri_id"], name: "index_matieres_on_seri_id"
  end

  create_table "niveaus", force: :cascade do |t|
    t.string "name"
    t.string "abbrege"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "body"
    t.text "main_image"
    t.text "thumb_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "profils", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "seris", force: :cascade do |t|
    t.string "name"
    t.bigint "niveau_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["niveau_id"], name: "index_seris_on_niveau_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.integer "percent_utilized"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "badge"
  end

  create_table "students", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "cni"
    t.string "telephone"
    t.string "numtable"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "etablissement_id"
    t.bigint "niveau_id"
    t.bigint "seri_id"
    t.bigint "juri_id"
    t.bigint "centre_id"
    t.index ["centre_id"], name: "index_students_on_centre_id"
    t.index ["etablissement_id"], name: "index_students_on_etablissement_id"
    t.index ["juri_id"], name: "index_students_on_juri_id"
    t.index ["niveau_id"], name: "index_students_on_niveau_id"
    t.index ["seri_id"], name: "index_students_on_seri_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_technologies_on_portfolio_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.bigint "profil_id"
    t.bigint "region_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profil_id"], name: "index_users_on_profil_id"
    t.index ["region_id"], name: "index_users_on_region_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "authors", "etablissements"
  add_foreign_key "authors", "matieres"
  add_foreign_key "authors", "users"
  add_foreign_key "blogs", "authors"
  add_foreign_key "blogs", "domaines"
  add_foreign_key "blogs", "matieres"
  add_foreign_key "blogs", "niveaus"
  add_foreign_key "blogs", "seris"
  add_foreign_key "centres", "departements"
  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "users"
  add_foreign_key "departements", "regions"
  add_foreign_key "departements", "users"
  add_foreign_key "domaines", "filieres"
  add_foreign_key "domaines", "niveaus"
  add_foreign_key "epreuves", "matieres"
  add_foreign_key "epreuves", "niveaus"
  add_foreign_key "epreuves", "seris"
  add_foreign_key "etablissements", "departements"
  add_foreign_key "filieres", "niveaus"
  add_foreign_key "juris", "centres"
  add_foreign_key "matieres", "niveaus"
  add_foreign_key "matieres", "seris"
  add_foreign_key "regions", "countries"
  add_foreign_key "seris", "niveaus"
  add_foreign_key "students", "centres"
  add_foreign_key "students", "etablissements"
  add_foreign_key "students", "juris"
  add_foreign_key "students", "niveaus"
  add_foreign_key "students", "seris"
  add_foreign_key "technologies", "portfolios"
  add_foreign_key "users", "profils"
  add_foreign_key "users", "regions"
end
