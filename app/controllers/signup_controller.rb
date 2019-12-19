class SignupController < ApplicationController
  protect_from_forgery

  #今後セッションを設定する場合に使う為残しておきます。
    def step1
      @user = User.new
      @user.build_user_profile
    end

  def new
    @user = User.new
    @user.build_user_profile
  end

  def create
      @user = User.new(user_params)
      @user.build_user_profile(user_params[:user_profile_attributes])
    if @user.save
      sign_in(User.find(@user.id), scope: :user) unless user_signed_in?
      redirect_to root_path
      # 下記は今後セッション使う場合に必要な為残してます。
      # session[:id] = @user.id
      # redirect_to auto_login_signup_index_path(user_id: @user.id)
    else
      redirect_to root_path
    end
  end

  #セッション用にこのアクションは残しておく。
    # def auto_login
    #   # sign_in User.find(session[:id]) unless user_signed_in?
    #   # sign_in User.find(params[:user_id]) unless user_signed_in?
    #   # redirect_to user_accounts_path
    # end

  private
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :first_name_kana,
      :last_name,
      :last_name_kana,
      :birth_day,
      :phone_number,
      user_profile_attributes: [:id, :nickname]
    )
  end

end
