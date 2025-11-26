class StoryLevelsController < ApplicationController
  before_action :authenticate_user!

  def map
    @story_levels = StoryLevel.all.order(:id)
    @completed_level_ids = current_user.fights.where(status: 'completed').pluck(:story_level_id).uniq
    @current_level = find_current_level
    @accessible_level_ids = calculate_accessible_levels
  end

  private

  def calculate_accessible_levels
    # Generate an array that has the first level that is always accessible plus all completed levels so far
    accessible = []
    @story_levels.each do |story_level|
      accessible << story_level.id if can_access_level?(story_level)
    end
    accessible
  end

  def find_current_level
    # Find the first level that hasn't been completed yet and is accessible
    @story_levels.each do |story_level|
      is_completed = @completed_level_ids.include?(story_level.id)
      return story_level if can_access_level?(story_level) && !is_completed
    end

    # If all levels complete, return last level
    @story_levels.last
  end

  def can_access_level?(story_level)
    # First level is always accessible
    return true if story_level == @story_levels.first

    # Check if previous level is completed
    previous_level = @story_levels.find { |sl| sl.id == story_level.id - 1 }
    return false unless previous_level

    @completed_level_ids.include?(previous_level.id)
  end
end
