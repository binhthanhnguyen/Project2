class EvaluationsController < ApplicationController

	def new
		@assignment = Assignment.find params[:assignment_id]

		@evaluation = @assignment.build_evaluation
		7.times do |n|
			@evaluation.evaluation_criteria.build criterion_id: n+1
		end

	end

	def create
		@assignment = Assignment.find params[:assignment_id]

		@evaluation = @assignment.build_evaluation evaluation_params
		7.times do |n|
			@evaluation.evaluation_criteria.build criterion_id: n+1
		end
		if @evaluation.save
			flash[:success] = "Evaluated successfully."
			redirect_to [@assignment, @evaluation]
		else
			flash[:error] = "Can not evaluated"
			render :new
		end

	end


	def show
		@assignment = Assignment.find params[:assignment_id]
		@evaluation = Evaluation.find params[:id]
	end

	private

	def evaluation_params
		params.require(:evaluation).permit :assignment_id, :user_id,
											evaluation_criteria_attributes: [:id, :criterion_id, :point, :comment] 

	end
end
