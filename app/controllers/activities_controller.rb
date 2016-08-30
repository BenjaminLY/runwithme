class ActivitiesController < ApplicationController
  skip_after_action :verify_policy_scoped
  def index
    @activities = PublicActivity::Activity.order("created_at desc")
    # 1) bonne requete en fonction de current_user
    # 2) migration dans table activities :read_at, :datetime
    # 3) marquer les notifs comme lues quand le user est allé sur /activities
    # @activities.where(read_at: nil).each do |activity|
    #   activity.read_at = DateTime.now
    #   activity.save
    # end
    # 4) navbar + application_controller
    # .where(owner_id: current_user.friend_ids, owner_type: "User")
  end
end
