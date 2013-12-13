# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131207071744) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "bases_packs_relations", :force => true do |t|
    t.integer  "product_pack_id",  :null => false
    t.integer  "product_basis_id", :null => false
    t.integer  "weight",           :null => false
    t.float    "price",            :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "bases_packs_relations", ["product_basis_id"], :name => "index_bases_packs_relations_on_product_basis_id"
  add_index "bases_packs_relations", ["product_pack_id"], :name => "index_bases_packs_relations_on_product_pack_id"

  create_table "content_pages", :force => true do |t|
    t.string   "title"
    t.string   "slug",                             :null => false
    t.string   "ancestry"
    t.boolean  "immortal"
    t.integer  "behavior_type", :default => 0,     :null => false
    t.integer  "rct_page_id"
    t.string   "rct_lnk"
    t.text     "body"
    t.string   "description"
    t.string   "keywords"
    t.integer  "prior",         :default => 10,    :null => false
    t.boolean  "hided",         :default => false, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "content_pages", ["ancestry"], :name => "index_content_pages_on_ancestry"
  add_index "content_pages", ["hided"], :name => "index_content_pages_on_hided"
  add_index "content_pages", ["prior"], :name => "index_content_pages_on_prior"
  add_index "content_pages", ["slug"], :name => "index_content_pages_on_slug"

  create_table "info_product_circles", :force => true do |t|
    t.string  "title",                       :null => false
    t.string  "url",                         :null => false
    t.integer "prodcode", :default => 0,     :null => false
    t.integer "prior",    :default => 10,    :null => false
    t.boolean "hided",    :default => false, :null => false
  end

  add_index "info_product_circles", ["hided"], :name => "index_info_product_circles_on_hided"
  add_index "info_product_circles", ["prior"], :name => "index_info_product_circles_on_prior"

  create_table "ingridients_packs_relations", :force => true do |t|
    t.integer  "product_pack_id",       :null => false
    t.integer  "product_ingridient_id", :null => false
    t.integer  "weight",                :null => false
    t.float    "price",                 :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "ingridients_packs_relations", ["product_ingridient_id"], :name => "index_ingridients_packs_relations_on_product_ingridient_id"
  add_index "ingridients_packs_relations", ["product_pack_id"], :name => "index_ingridients_packs_relations_on_product_pack_id"

  create_table "main_nav_items", :force => true do |t|
    t.string   "title"
    t.string   "ancestry"
    t.integer  "url_type",    :default => 0,     :null => false
    t.integer  "url_page_id"
    t.string   "url_text"
    t.integer  "prior",       :default => 10,    :null => false
    t.boolean  "hided",       :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "main_nav_items", ["hided"], :name => "index_main_nav_items_on_hided"
  add_index "main_nav_items", ["prior"], :name => "index_main_nav_items_on_prior"
  add_index "main_nav_items", ["url_page_id"], :name => "index_main_nav_items_on_url_page_id"

  create_table "product_bases", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "image"
    t.text     "descr"
    t.text     "composition"
    t.text     "nutr_val"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "product_categories", :force => true do |t|
    t.string  "name_one"
    t.string  "name_few"
    t.string  "name_many"
    t.string  "name_other"
    t.string  "slug",          :null => false
    t.string  "icon"
    t.boolean "construct_off"
  end

  add_index "product_categories", ["slug"], :name => "index_product_categories_on_slug", :unique => true

  create_table "product_ingridient_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "product_ingridients", :force => true do |t|
    t.integer  "type_id",    :null => false
    t.string   "name",       :null => false
    t.string   "image"
    t.text     "descr"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "product_ingridients", ["type_id"], :name => "index_product_ingridients_on_type_id"

  create_table "product_ingridients_products", :id => false, :force => true do |t|
    t.integer "product_ingridient_id", :null => false
    t.integer "product_id",            :null => false
  end

  add_index "product_ingridients_products", ["product_id"], :name => "index_product_ingridients_products_on_product_id"
  add_index "product_ingridients_products", ["product_ingridient_id"], :name => "index_product_ingridients_products_on_product_ingridient_id"

  create_table "product_packs", :force => true do |t|
    t.integer  "category_id", :null => false
    t.string   "name",        :null => false
    t.string   "image"
    t.integer  "capacity",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "product_packs", ["capacity"], :name => "index_product_packs_on_capacity"
  add_index "product_packs", ["category_id"], :name => "index_product_packs_on_category_id"

  create_table "products", :force => true do |t|
    t.boolean  "pcba"
    t.boolean  "plain"
    t.string   "name"
    t.string   "article"
    t.string   "image"
    t.float    "price",       :null => false
    t.integer  "weight"
    t.integer  "category_id"
    t.integer  "pack_id"
    t.integer  "basis_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "products", ["basis_id"], :name => "index_products_on_basis_id"
  add_index "products", ["category_id"], :name => "index_products_on_category_id"
  add_index "products", ["pack_id"], :name => "index_products_on_pack_id"
  add_index "products", ["pcba"], :name => "index_products_on_pcba"
  add_index "products", ["plain"], :name => "index_products_on_plain"

  create_table "site_settings", :force => true do |t|
    t.string   "ident",                         :null => false
    t.string   "name"
    t.string   "descr"
    t.integer  "val_type"
    t.text     "set_val"
    t.boolean  "hided",      :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "site_settings", ["hided"], :name => "index_site_settings_on_hided"
  add_index "site_settings", ["ident"], :name => "index_site_settings_on_ident"

  create_table "slides", :force => true do |t|
    t.string   "title",                             :null => false
    t.string   "subtitle"
    t.string   "image"
    t.text     "descr"
    t.string   "btn_text"
    t.string   "btn_link"
    t.integer  "backg"
    t.boolean  "image_at_right"
    t.boolean  "custom"
    t.integer  "prior",          :default => 10,    :null => false
    t.boolean  "hided",          :default => false, :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "slides", ["hided"], :name => "index_slides_on_hided"
  add_index "slides", ["prior"], :name => "index_slides_on_prior"

  create_table "social_links", :force => true do |t|
    t.integer  "social_type",                    :null => false
    t.string   "url",                            :null => false
    t.integer  "prior",       :default => 10,    :null => false
    t.boolean  "hided",       :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "social_links", ["hided"], :name => "index_social_links_on_hided"
  add_index "social_links", ["prior"], :name => "index_social_links_on_prior"

  create_table "static_images", :force => true do |t|
    t.string   "image",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
