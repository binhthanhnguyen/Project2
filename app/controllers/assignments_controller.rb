class AssignmentsController < ApplicationController
	def index
		@internship_recruitments = current_user.internship_recruitments
		
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
