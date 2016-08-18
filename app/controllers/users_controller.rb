class UsersController < ApplicationController
  before_action :set_user, only: [ :profile, :edit ,:update ]

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

  private
  def set_user
    @user = current_user
  end

  def user_params
   params.require(:user).permit(:last_name, :first_name, :email, :job_title, :run_level, :expectation, :description, :photo)

  end
end
