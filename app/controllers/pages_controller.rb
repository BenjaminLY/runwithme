class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_before_action :set_current_user_activities, only: :home
  skip_after_action :verify_authorized, only: [ :home ]

  def home
  end
end
