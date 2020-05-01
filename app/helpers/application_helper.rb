module ApplicationHelper
  
	 def login_helper style=''
	 	if current_user.is_a?(GuestUser) 
      (link_to "Se Connecter", new_user_session_path, class: style) +
          " ".html_safe +
          (link_to "S'inscrire", new_user_registration_path, class: style)
    else
       		link_to "Déconnexion", destroy_user_session_path,method: :delete, class: style
    	end 
	end

	def source_helper(styles)
		if session[:source]
    		greeting = "Merci de nous avoir visité en provenance de #{session[:source]}, libre à vous de me contacter #{link_to 'contact me', contact_path} pour une quelconque raison"  
    		content_tag(:div, greeting.html_safe, class: styles)
     	end 
	end

  def copyright_generator
    @copyright = ZicrouViewTool::Renderer.copyright 'SK8Z-¯-CLBK', 'All rights reserved'
    #DevcampViewTool::Renderer.copyright 'Zicrou SECK', 'All rights reserved'
  end
  

  def nav_item
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Cours'
      },
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_item.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "CiiLaaBokk...", sticky: false, time: 8000)
  end

end