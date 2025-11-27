class FightQuestionsController < ApplicationController

  def index
    @fight = Fight.find(params[:id])
    @fight_questions = @fight.fight_questions
  end


  private

  def question_params
    params.require(:question).permit(:difficulty, :anwers)
  end

  def create
    #Create a question when picking one of the attack options on the fight screen. Get the fight from the params
    @fight_question = FightQuestion.new(fight: Fight.find(params[:fight_id]))
    #Assign a random question to the @fight_question
    used_question_ids = FightQuestion.pluck(:question_id).uniq
    @fight_question = Question.where.not(id: used_question_ids).where(type: params[:type]).sample
  end
end
