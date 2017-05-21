class AssignmentsController < ApplicationController
	def index
		@internship_recruitments = current_user.internship_recruitments


		@evaluation = Evaluation.new
		7.times do |n|
			@evaluation.evaluation_criteria.build criterion_id: n+1
		end
		
	end

	def update
		@assignment = Assignment.find params[:id]
		if @assignment.update_attributes assignment_params
			flash[:success] = "Assignment updated successfully."
			redirect_to assignments_path
		end
	end


	private
	def assignment_params
		params.require(:assignment).permit :start_date, :end_date, :mentor_id
	end
end
