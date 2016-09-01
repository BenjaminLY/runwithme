class UsersController < ApplicationController
  before_action :set_user, only: [ :profile, :edit ,:update, :destroy ]

  skip_after_action :verify_authorized

  def random
    @users = User.where(run_level: current_user.run_level).where.not(id: current_user.id)
    @random_user = @users.sample
    respond_to do |format|
      format.html
      format.js
    end
  end

  def profile
  end

  def edit
  end

  def update
    @user = User.find(current_user)
    if @user.update_attributes(user_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    else
      render 'profile'
    end
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
   params.require(:user).permit(:last_name, :first_name, :email, :job_title, :run_level, :expectation, :description, :photo)

  end
end
