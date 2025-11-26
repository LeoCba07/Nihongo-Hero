class FightsController < ApplicationController
  def show
    @fight = Fight.find(params[:id])
  end

  def create
    enemy = Enemy.all.sample

    # HALEY: I've whipped this bad create method up to get to the fight screen so I can work on it.
    @fight = Fight.create(
      status: 'active',
      user: current_user,
      enemy: enemy,
      player_hitpoints: current_user.hitpoints,
      enemy_hitpoints: enemy.hitpoints,
      story_level_id: 1
    )

    if @fight.save
      redirect_to fight_path(@fight)
    else
      flash[:alert] = @fight.errors.full_messages.join(", ")
      redirect_to map_path
    end
  end

  private

  def fight_params
  end
end
