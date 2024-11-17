Rails.application.routes.draw do


  root to: "public/homes#top"

  # 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

scope module: :public do
  resources :users, only: %i[show edit update] do
    collection do
      get "/mypage" => "users#mypage"
    end
  end
end

end
