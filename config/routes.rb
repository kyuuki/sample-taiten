Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_page#root"
  # root to: "static_page#root"  # 上記はこれの省略形

  #
  # ログイン
  #
  scope "/users" do
    get "log_in", to: "sessions#new"
    post "log_in", to: "sessions#create"
    get "log_out", to: "sessions#delete"
  end

  # https://github.com/fgrehm/letter_opener_web
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
