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
  def getPresentations(assignment_id)
    @presentations = Presentation.where(assignment_id: assignment_id)
    return @presentations
  end

  def getPresentationComment(assignment_id,assignment_author)
    return PathComment.where(assignment_id: assignment_id, assignment_author: assignment_author, present:true)
  end
end
