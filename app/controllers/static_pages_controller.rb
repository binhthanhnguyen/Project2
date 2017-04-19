class StaticPagesController < ApplicationController
  
  def home
  	if user_signed_in? and current_user.role? :student
  		@completed = 12.5
  		if (!current_user.curriculum_vitae.nil? )
  			@completed = 37.5;
  		end
  	    
  	    if (current_user.internship_registrations.any?)
  	    	@completed = 62.5;
  	    end

  	end
  end

  def help
  end

  def about
  end
end
