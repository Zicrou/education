module ApplicationHelper
  
	 def login_helper style=''
	 	if current_user.is_a?(GuestUser) 
      (link_to "Login", new_user_session_path, class: style) +
          " ".html_safe +
          (link_to "Sign Up", new_user_registration_path, class: style)
    else
       		link_to "Logout", destroy_user_session_path,method: :delete, class: style
    	end 
	end

	def source_helper(layout_name)
		if session[:source]
    		greeting = "Thanks for visiting us from #{session[:source]} and you are on the #{layout_name} layout"  
    		content_tag(:p, greeting, class:"source-greeting")
     	end 
	end

  def copyright_generator
    @copyright = ZicrouViewTool::Renderer.copyright 'Zicrou SECK', 'All rights reserved'
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
        title: 'Blogs'
      },
      {
        url: portfolios_path,
        title: 'Portfolios'
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
end