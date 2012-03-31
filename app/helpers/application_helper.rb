module ApplicationHelper
  def flash_class(level)
	  case level
		  when :notice then 'info'
		  when :error then 'error'
		  when :alert then 'warning'
	  end
  end

  def body_id(body_id)
  	content_for(:body_id, body_id)
  end

  def body_class(body_class)
  	content_for(:body_class, body_class)
  end

  def current_user()
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
