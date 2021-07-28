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

ActiveRecord::Schema.define(version: 2021_07_28_014226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addtns", force: :cascade do |t|
    t.string "desc"
    t.float "amount"
    t.integer "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "spv"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admins_on_username", unique: true
  end

  create_table "anisatts", force: :cascade do |t|
    t.integer "course_id"
    t.integer "tchdetail_id"
    t.boolean "att"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "anisprog_id"
  end

  create_table "anisfeeds", force: :cascade do |t|
    t.integer "rate"
    t.string "bad"
    t.string "good"
    t.integer "course_id"
    t.integer "tchdetail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "anisprogs", force: :cascade do |t|
    t.string "name"
    t.string "lec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.time "start"
    t.time "end"
  end

  create_table "applvs", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "taska_id"
    t.date "start"
    t.date "end"
    t.string "tchdesc"
    t.string "tskdesc"
    t.string "stat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
    t.float "tot"
  end

  create_table "artks", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "headl"
    t.string "bodl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pic"
  end

  create_table "ates", force: :cascade do |t|
    t.string "hr"
    t.string "tin"
    t.string "ear"
    t.string "resp"
    t.string "ovc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ekid_id"
    t.boolean "stat"
    t.integer "teacher_id"
  end

  create_table "chkls", force: :cascade do |t|
    t.text "gmtr"
    t.text "fmtr"
    t.text "adbh"
    t.text "splg"
    t.text "cogn"
    t.text "audl"
    t.text "prvb"
    t.text "rcel"
    t.string "rslc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ekid_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "classroom_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taska_id"
    t.string "description"
    t.float "base_fee"
  end

  create_table "cntps", force: :cascade do |t|
    t.string "title"
    t.time "start"
    t.time "end"
    t.string "lec"
    t.string "ctn"
    t.integer "proge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dt"
    t.boolean "fbc"
  end

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start"
    t.date "end"
    t.index ["collection_id"], name: "index_colleges_on_collection_id", unique: true
    t.index ["name"], name: "index_colleges_on_name", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "college_id"
    t.float "base_fee"
    t.string "description"
    t.date "start"
    t.date "end"
  end

  create_table "ddks", force: :cascade do |t|
    t.string "conum"
    t.string "coname"
    t.integer "perse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "regby"
    t.string "addr"
    t.string "posk"
    t.string "state"
    t.string "email"
    t.string "ph"
    t.string "mpemb"
    t.string "mpeng"
    t.string "mpend"
    t.string "mpert"
    t.string "mfiz"
    t.string "mmen"
    t.string "mpelb"
    t.integer "stafct"
    t.integer "tchct"
    t.integer "okuct"
    t.string "premdt"
    t.string "mdl"
    t.date "dtreg"
    t.string "regyr"
    t.string "stat"
    t.string "statrs"
    t.string "agtp"
  end

  create_table "ekids", force: :cascade do |t|
    t.string "name"
    t.string "ic"
    t.string "gdr"
    t.date "dob"
    t.string "addr"
    t.string "mph"
    t.string "fname"
    t.string "fage"
    t.string "fph"
    t.string "femail"
    t.string "fedu"
    t.string "fwork"
    t.string "fworktp"
    t.string "mname"
    t.string "mage"
    t.string "memail"
    t.string "medu"
    t.string "mwork"
    t.string "mworktp"
    t.string "phist"
    t.string "phisttp"
    t.string "pinc"
    t.string "ref"
    t.string "refloc"
    t.string "prbtp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sib"
    t.string "prbot"
    t.string "dun"
    t.string "mmph"
    t.string "stat"
    t.string "prefloc"
    t.string "admloc"
    t.integer "sce_id"
    t.integer "parent_id"
    t.integer "perse_id"
    t.string "tp"
    t.integer "ekid_id"
    t.string "okunum"
    t.string "birthplc"
    t.string "relign"
    t.string "race"
    t.string "reltn"
    t.string "allg"
    t.string "diet"
    t.string "fic"
    t.string "mic"
    t.string "frace"
    t.string "mrace"
    t.string "frelign"
    t.string "mrelign"
  end

  create_table "ekrps", force: :cascade do |t|
    t.datetime "dt"
    t.integer "ekid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "name"
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taska_id"
    t.integer "month"
    t.integer "year"
    t.string "kind"
    t.date "dt"
    t.string "coname"
    t.string "catg"
  end

  create_table "extras", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "taska_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fbproges", force: :cascade do |t|
    t.integer "rate"
    t.integer "perse_id"
    t.integer "proge_id"
    t.text "ctnr"
    t.string "cmt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "fbc"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "rating"
    t.string "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taska_id"
    t.integer "classroom_id"
    t.integer "course_id"
    t.integer "anisprog_id"
    t.integer "anisfeed_id"
  end

  create_table "fotos", force: :cascade do |t|
    t.string "picture"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tchdetail_id"
    t.string "foto_name"
    t.integer "kid_id"
    t.integer "taska_id"
    t.integer "expense_id"
    t.integer "ptns_mmb_id"
    t.integer "applv_id"
    t.integer "payment_id"
    t.integer "parpaym_id"
    t.integer "ekid_id"
  end

  create_table "kid_bills", force: :cascade do |t|
    t.integer "kid_id"
    t.integer "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "classroom_id"
    t.text "extra"
  end

  create_table "kid_extras", force: :cascade do |t|
    t.integer "kid_id"
    t.integer "extra_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kids", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ic_1"
    t.string "ic_2"
    t.string "ic_3"
    t.date "dob"
    t.string "birth_place"
    t.string "arr_infam"
    t.string "allergy"
    t.string "fav_food"
    t.string "hobby"
    t.string "panel_clinic"
    t.string "mother_name"
    t.string "mother_phone"
    t.string "mother_job"
    t.string "mother_job_address"
    t.string "father_name"
    t.string "father_phone"
    t.string "father_job"
    t.string "father_job_address"
    t.string "income"
    t.string "alt_phone"
    t.date "date_enter"
    t.integer "taska_id"
    t.integer "classroom_id"
    t.string "gender"
    t.string "ph_1"
    t.string "ph_2"
  end

  create_table "kidtsks", force: :cascade do |t|
    t.integer "kid_id"
    t.integer "taska_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "otes", force: :cascade do |t|
    t.string "sens"
    t.string "beob"
    t.string "cog"
    t.string "gmtr"
    t.string "fmtr"
    t.string "ovc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ekid_id"
    t.boolean "stat"
    t.integer "teacher_id"
  end

  create_table "otkids", force: :cascade do |t|
    t.integer "kid_id"
    t.integer "payment_id"
    t.float "amt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descotk"
  end

  create_table "owner_colleges", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "tp"
    t.string "loc"
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
    t.index ["username"], name: "index_owners_on_username", unique: true
  end

  create_table "parents", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_parents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true
    t.index ["username"], name: "index_parents_on_username", unique: true
  end

  create_table "parpayms", force: :cascade do |t|
    t.string "kind"
    t.float "amt"
    t.integer "payment_id"
    t.date "upd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mtd"
  end

  create_table "payinfos", force: :cascade do |t|
    t.float "amt"
    t.float "alwnc"
    t.float "epf"
    t.integer "teacher_id"
    t.integer "taska_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "epfa"
    t.float "socs"
    t.float "socsa"
    t.float "sip"
    t.float "sipa"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bill_month"
    t.integer "bill_year"
    t.string "bill_id"
    t.string "description"
    t.string "state"
    t.boolean "paid"
    t.integer "kid_id"
    t.float "amount"
    t.integer "parent_id"
    t.integer "taska_id"
    t.integer "course_id"
    t.integer "teacher_id"
    t.string "name"
    t.boolean "reminder"
    t.float "discount"
    t.string "mtd"
    t.string "cltid"
  end

  create_table "payslips", force: :cascade do |t|
    t.integer "mth"
    t.integer "year"
    t.float "amt"
    t.float "alwnc"
    t.float "epf"
    t.float "addtn"
    t.string "desc"
    t.integer "teacher_id"
    t.integer "taska_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "epfa"
    t.float "amtepfa"
    t.string "psl_id"
    t.float "socs"
    t.float "socsa"
    t.float "dedc"
    t.string "descdc"
    t.float "sip"
    t.float "sipa"
    t.integer "notf"
  end

  create_table "perproges", force: :cascade do |t|
    t.integer "perse_id"
    t.integer "proge_id"
    t.string "stat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perses", force: :cascade do |t|
    t.string "name"
    t.string "ic"
    t.string "ph"
    t.string "inc"
    t.string "gdr"
    t.string "dun"
    t.string "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "add"
    t.string "race"
    t.string "backg"
    t.string "backgo"
    t.string "kdoku"
    t.string "kdiag"
    t.string "email"
    t.text "stdoku"
  end

  create_table "pkids", force: :cascade do |t|
    t.text "devkid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "addfo"
    t.text "health"
    t.text "birth"
    t.text "grow"
    t.text "physpch"
    t.text "agr"
    t.integer "ekid_id"
  end

  create_table "prgfds", force: :cascade do |t|
    t.integer "rate"
    t.string "good"
    t.string "bad"
    t.integer "perse_id"
    t.integer "proge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prntdetails", force: :cascade do |t|
    t.string "name"
    t.string "ic_1"
    t.string "ic_2"
    t.string "ic_3"
    t.string "phone_1"
    t.string "phone_2"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "states"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
  end

  create_table "proges", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "venue"
    t.time "start"
    t.time "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "acv"
    t.string "tp"
    t.date "daten"
  end

  create_table "ptes", force: :cascade do |t|
    t.string "gmtr"
    t.string "mov"
    t.string "endr"
    t.string "ovc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ekid_id"
    t.boolean "stat"
    t.integer "teacher_id"
  end

  create_table "ptns_mmbs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dob"
    t.string "ic1"
    t.string "ic2"
    t.string "ic3"
    t.string "icf"
    t.string "ph1"
    t.string "ph2"
    t.string "mmb"
    t.string "edu"
    t.string "add1"
    t.string "add2"
    t.string "city"
    t.string "state"
    t.string "postcode"
    t.string "ts_name"
    t.string "ts_add1"
    t.string "ts_add2"
    t.string "ts_city"
    t.string "ts_state"
    t.string "ts_postcode"
    t.string "ts_status"
    t.string "ts_owner"
    t.string "ts_job"
    t.string "ts_ph1"
    t.string "ts_ph2"
    t.string "email"
    t.date "expire"
    t.string "mmbid"
    t.string "tp"
  end

  create_table "ptnssps", force: :cascade do |t|
    t.string "name"
    t.string "strgh"
    t.string "wkns"
    t.string "opp"
    t.string "thr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qsas", force: :cascade do |t|
    t.string "ques"
    t.string "ans"
    t.string "stat"
    t.string "email"
    t.string "name"
    t.string "ph"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rflts", force: :cascade do |t|
    t.string "ovc"
    t.integer "ekid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "rped"
    t.boolean "rcp"
    t.boolean "rntn"
    t.boolean "rent"
    t.boolean "roph"
    t.boolean "rot"
    t.boolean "rst"
    t.string "roth"
    t.string "osens"
    t.string "obeob"
    t.string "ocog"
    t.string "ogmtr"
    t.string "ofmtr"
    t.string "pgmtr"
    t.string "pmov"
    t.string "pendr"
    t.string "spre"
    t.string "srec"
    t.string "sexpr"
    t.string "ahr"
    t.string "atin"
    t.string "aear"
    t.string "aresp"
    t.integer "owner_id"
  end

  create_table "sces", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.string "venue"
    t.string "loc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "curr"
  end

  create_table "siblings", force: :cascade do |t|
    t.bigint "kid_id"
    t.bigint "beradik_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beradik_id"], name: "index_siblings_on_beradik_id"
    t.index ["kid_id"], name: "index_siblings_on_kid_id"
  end

  create_table "skids", force: :cascade do |t|
    t.string "dely"
    t.string "delydesc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phy"
    t.string "cog"
    t.string "comm"
    t.string "soc"
    t.string "adap"
    t.string "reflt"
    t.string "otnt"
    t.integer "ekid_id"
    t.string "diag"
    t.string "summ"
    t.string "assr"
    t.string "obs"
    t.string "refc"
    t.string "frmo"
    t.string "scp"
    t.string "cmt"
    t.string "ovc"
    t.boolean "stat"
    t.integer "owner_id"
  end

  create_table "stes", force: :cascade do |t|
    t.string "pre"
    t.string "rec"
    t.string "expr"
    t.string "ovc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ekid_id"
    t.boolean "stat"
    t.integer "teacher_id"
  end

  create_table "taska_admins", force: :cascade do |t|
    t.integer "taska_id"
    t.integer "admin_id"
  end

  create_table "taska_teachers", force: :cascade do |t|
    t.integer "taska_id"
    t.integer "teacher_id"
    t.boolean "stat"
  end

  create_table "taskas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "phone_1"
    t.string "phone_2"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "states"
    t.string "postcode"
    t.string "supervisor"
    t.string "bank_name"
    t.string "acc_no"
    t.string "acc_name"
    t.string "ssm_no"
    t.string "collection_id"
    t.string "name"
    t.string "plan"
    t.string "bank_status"
    t.string "billplz_reg"
    t.datetime "expire"
    t.float "booking"
    t.string "subdomain"
    t.float "discount"
    t.string "collection_id2"
    t.index ["subdomain"], name: "index_taskas_on_subdomain", unique: true
  end

  create_table "tchdetail_colleges", force: :cascade do |t|
    t.integer "tchdetail_id"
    t.integer "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tchdetails", force: :cascade do |t|
    t.string "name"
    t.string "ic_1"
    t.string "ic_2"
    t.string "ic_3"
    t.string "phone_1"
    t.string "phone_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "marital"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "states"
    t.string "postcode"
    t.string "education"
    t.integer "teacher_id"
    t.string "ts_name"
    t.string "ts_address_1"
    t.string "ts_address_2"
    t.string "ts_city"
    t.string "ts_states"
    t.string "ts_postcode"
    t.string "ts_owner_name"
    t.string "ts_phone_1"
    t.string "ts_phone_2"
    t.integer "college_id"
    t.string "category"
    t.string "dun"
    t.string "jkm"
    t.string "post"
    t.string "anis"
    t.string "income"
    t.date "dob"
    t.string "gender"
    t.string "email"
    t.integer "owner_id"
  end

  create_table "tchlvs", force: :cascade do |t|
    t.string "name"
    t.float "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taska_id"
    t.integer "teacher_id"
    t.integer "tsklv_id"
  end

  create_table "teacher_colleges", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_courses", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "tp"
    t.string "loc"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
    t.index ["username"], name: "index_teachers_on_username", unique: true
  end

  create_table "teachers_classrooms", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "classroom_id"
  end

  create_table "tskbills", force: :cascade do |t|
    t.float "real"
    t.float "disc"
    t.integer "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tsklvs", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "day"
    t.integer "taska_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
