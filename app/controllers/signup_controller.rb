class SignupController < ApplicationController
  protect_from_forgery


    def step1
      @user = User.new
      @user.build_user_profile
    end

    def step2
      session[:nickname] = user_params[:user_profile_attributes]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
      session[:last_name] = user_params[:last_name]
      session[:last_name_kana] = user_params[:last_name_kana]
      session[:first_name] = user_params[:first_name]
      session[:first_name_kana] = user_params[:first_name_kana]
      session[:birth_day] = user_params[:birth_day]
      @user = User.new
    end

    def step3
      session[:phone_number] = user_params[:phone_number]
      @user = User.new
      @user.build_user_address
    end

    def step4
      session[:phone_number] = user_params[:phone_number]
    end

  def new
    @user = User.new
    @user.build_user_profile
  end
#########################テスト用#######################################################
  def create
    params[:birth_day] = birth_day_join
    @user = User.new(user_params)
    @user.build_user_profile(user_params[:user_profile_attributes])
    binding.pry
  if @user.save
    binding.pry
    sign_in(User.find(@user.id), scope: :user) unless user_signed_in?
    redirect_to root_path
    # 下記は今後セッション使う場合に必要な為残してます。
    # session[:id] = @user.id
    # redirect_to auto_login_signup_index_path(user_id: @user.id)
  else
    redirect_to root_path
  end
end

def birth_day_join
  date = params[:birth_day]
  if date["birth_day(1i)"].empty? || date["birth_day(2i)"].empty? || date["birth_day(3i)"].empty?
    return
  end
  # a = Date.new date["birth_day(1i)"].to_i,date["birth_day(2i)"].to_i,date["birth_day(3i)"].to_i
  params[:birth_day] = "#{date["birth_day(1i)"].to_i}-#{date["birth_day(2i)"].to_i}-#{date["birth_day(3i)"].to_i}"
end

#########################テスト用ここまで#######################################################


  # def create
  #   binding.pry
  #     @user = User.new(
  #       email: session[:email],
  #       password: session[:password],
  #       password_confirmation: session[:password_confirmation],
  #       last_name: session[:last_name],
  #       last_name_kana: session[:last_name_kana],
  #       first_name: session[:first_name],
  #       first_name_kana: session[:first_name_kana],
  #       phone_number: session[:phone_number],
  #       birth_day: session[:birth_day]
  #       )
  #     # binding.pry
  #     @user.build_user_profile(user_params[:user_profile_attributes])
  #     # binding.pry
  #     @user.build_user_address(user_params[:user_address_attributes])
  #     # binding.pry
  #   if @user.save
  #     # binding.pry
  #     sign_in(User.find(@user.id), scope: :user) unless user_signed_in?
  #     redirect_to root_path
  #     # 下記は今後セッション使う場合に必要な為残してます。
  #     # session[:id] = @user.id
  #     # redirect_to auto_login_signup_index_path(user_id: @user.id)
  #   else
  #     redirect_to root_path
  #   end
  # end

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
      user_profile_attributes: [:id, :nickname],
      # user_address_attributes: [:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :prefecture, :city, :house_number, :building_name]
    )
    params.permit(:birth_day)
    binding.pry
  end

end
