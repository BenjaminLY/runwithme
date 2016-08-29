class UsersController < ApplicationController
  before_action :set_user, only: [ :profile, :edit ,:update, :destroy ]
  skip_after_action :verify_authorized
  def search
    @users = User.order(:first_name)
    @users = @users.where("first_name like ?", "%#{params[:term]}%") if params[:term]
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @users.map(&:name) }
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
