class Public::UsersController < ApplicationController

  # findで記述すると以下になる
  def show
    @user = User.find(params[:id])
  end

  #find_byを使うと以下のようになる
  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集に成功しました！"
      redirect_to mypage_users_path
    else
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end

  def mypage
    user = current_user
    @user = User.find(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image)
  end


end
