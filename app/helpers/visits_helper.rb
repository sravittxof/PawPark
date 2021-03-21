module VisitsHelper

    def create_visit_allowed?(visit)
        !visit.dog.has_active_visit? && visit.dog.user == current_user
    end




end
