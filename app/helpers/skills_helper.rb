module SkillsHelper
	def get_answer_by_phase phase
		case phase
		when 1
			"git init"
		when 2
			"git log"
		when 3
			"git merge --fast-forwarding"
		else
			"" 
		end
	end
end
