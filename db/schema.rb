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

ActiveRecord::Schema.define(version: 20170518120601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atleta", force: :cascade do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.date     "data_nascimento"
    t.string   "sexo"
    t.string   "email"
    t.string   "nacionalidade"
    t.string   "telefone1"
    t.string   "telefone2"
    t.string   "graduacao"
    t.integer  "professors_id"
    t.integer  "modalidades_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "categoria"
  end

  create_table "dailies", force: :cascade do |t|
    t.integer  "atletum_id"
    t.integer  "modalidade_id"
    t.integer  "professor_id"
    t.integer  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["atletum_id"], name: "index_dailies_on_atletum_id", using: :btree
    t.index ["modalidade_id"], name: "index_dailies_on_modalidade_id", using: :btree
    t.index ["professor_id"], name: "index_dailies_on_professor_id", using: :btree
  end

  create_table "front_panels", force: :cascade do |t|
    t.string   "titulo"
    t.string   "conteudo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galeries", force: :cascade do |t|
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "modalidades", force: :cascade do |t|
    t.string   "nome"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "graduacao"
    t.integer  "modalidades_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.integer  "modalidades_id"
    t.integer  "user_type"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
