# app/controllers/story_levels_controller.rb
class StoryLevelsController < ApplicationController
  before_action :authenticate_user!

  def map
    @story_levels = StoryLevel.all
    @completed_level_ids = current_user.fights.where(status: 'completed').pluck(:story_level_id)
    @accessible_level_id = @completed_level_ids.last + 1
  end
end
