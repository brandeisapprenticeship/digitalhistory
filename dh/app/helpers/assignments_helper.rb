module AssignmentsHelper
	def getSteps(student_id, assignment_id)
    	@step = Step.where(assignment_id: assignment_id, user_id: student_id, document: true).first
    	@steps = Array.new
    	if @step != nil
    		@steps.push(@step)
    		while @step.parent_id != nil
    			@step = Step.find(@step.parent_id)
    			@steps.push(@step)
       		end
    	end
    		@steps.reverse!
    	return @steps
  end
end
