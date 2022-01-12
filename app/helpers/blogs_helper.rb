module BlogsHelper
  def choose_new_or_edit
    if %w[new create confirm].include?(action_name)
      confirm_blogs_path
    elsif action_name == "edit"
      blog_path(params[:id])
    end
  end
end
