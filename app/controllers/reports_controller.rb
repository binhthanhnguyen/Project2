class ReportsController < ApplicationController
	def index
      @reports = Report.all
   end
   
   def new
      @report = current_user.reports.build
   end
   
   def create
      @report = current_user.reports.build report_params
      
      if @report.save
         redirect_to reports_path, notice: "The report #{@report.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @report = Report.find(params[:id])
      @report.destroy
      redirect_to reports_path, notice:  "The report #{@report.name} has been deleted."
   end
   
   private
      def report_params
      params.require(:report).permit(:name, :attachment, :user_id, :content)
   end
end
