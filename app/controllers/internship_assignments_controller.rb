class InternshipAssignmentsController < ApplicationController

	def index
		@internship_assignments = InternshipAssignment.all.group_by(&:internship_recruitment)
	end

	def create
		@internship_assignment = InternshipAssignment.new internship_assignment_params
		if @internship_assignment.save
			flash[:success] = "Internship Assignment created successfully."
			redirect_to internship_assignments_path
		else
			render "layout/modal"
		end
	end


	private
		def internship_assignment_params
			params.require(:internship_assignment).permit :internship_recruitment_id, :start_date,
													:end_date, :lecturer_id,
													assignments_attributes:[:id, :student_id, :internship_assignment_id]
		end
end
