Rails.application.routes.draw do
  get "profiles/edit"
  get "profiles/update"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_page#root"
  # root to: "static_page#root"  # 上記はこれの省略形

  scope "/user" do
    #
    # ログイン
    #
    get "log_in", to: "sessions#new"
    post "log_in", to: "sessions#create"
    get "log_out", to: "sessions#delete"

    #
    # パスワードリセット
    #
    get "password_reset", to: "password_resets#new"
    post "password_reset", to: "password_resets#create"
    get "password_reset/new_password/:token", to: "password_resets#new_password", as: "password_reset_new_password"
    post "password_reset/new_password/update", to: "password_resets#new_password_update"
  end

  #
  # ユーザー登録
  #
  get "/users/sign_up", to: "registering_users#new"
  get "/users/confirm/:token", to: "registering_users#confirm", as: "users_confirm"
  resources :registering_users, only: [ :create ]

  #
  # マイページ
  #
  scope "/mypage" do
    resource :profile, only: [ :edit, :update ]
  end

  # https://github.com/fgrehm/letter_opener_web
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
