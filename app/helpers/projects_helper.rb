module ProjectsHelper

  def show_edit
    if current_user
      if (@project.user_id == current_user.id) or (current_user.admin?)
        link_to "(edit)", edit_project_path(@project)
      end
    end
  end

  def show_delete
    if current_user
      if (@project.user_id == current_user.id) or (current_user.admin?)
        link_to "(delete)", destroy_project_path(@project)
      end
    end
  end

end
