Rails.application.routes.draw do
  get "shipments/new"
  get "shipments/index"
  get "introductions/new"
  get "employees/new"
  get "sessions/new"
  post "sessions" => "sessions#create"
  delete "sessions" => "sessions#destroy" #ログアウト時の


  #ゲストログイン用
  post "guest_login" => "sessions#guest_login", as: "guest_login"


  get "home/index" #get ページを表示するときに使うリクエスト
  post "employees" => "employees#create"

  get "welcome/index"
  root "welcome#index" #ログイン前の画面をURLで表示できるように


  get "pig_houses/new" 
  post "pig_houses" => "pig_houses#create" #post 入力したデータを送るときに使うリクエスト pig_houses#create データを受け取って登録する処理


  get "pig_houses" => "pig_houses#index"
  delete "pig_houses/:id" => "pig_houses#destroy", as: "delete_pig_house"



  #豚舎編集画面へのルートを追加
  get "pig_houses/:id/edit" => "pig_houses#edit", as: "edit_pig_house" 


  #登録済みの豚舎情報を編集するとき
  patch "pig_houses/:id" => "pig_houses#update", as: "pig_house"


  # 出荷先登録画面
  get "destinations/new" => "destinations#new"

  # 出荷先登録処理
  post "destinations" => "destinations#create"

  # 出荷先一覧画面
  get "destinations" => "destinations#index"
  delete "destinations/:id" => "destinations#destroy", as: "destination"

  # 出荷先編集画面
  get "destinations/:id/edit" => "destinations#edit", as: "edit_destination"

  # 出荷先の編集内容を保存
  patch "destinations/:id" => "destinations#update", as: "update_destination"


  #導入入力
 get "introductions/new" => "introductions#new" 
 post "introductions" => "introductions#create" 
 get "introductions" => "introductions#index"
 delete "introductions/:id" => "introductions#destroy", as: "delete_introduction"
 
  # 出荷入力画面
  get "shipments/new" => "shipments#new"
  # 出荷登録処理
  post "shipments" => "shipments#create"
  # 出荷一覧画面
  get "shipments" => "shipments#index"

 delete "shipments/:id" => "shipments#destroy", as: "delete_shipment"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
