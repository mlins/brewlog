module ApplicationHelper
  def nav_link(title, icon, path)
    html_class = "active" if current_page?(path)

    render :partial => "shared/nav_link", :locals => { 
      :title      => title,
      :icon       => icon,
      :path       => path,
      :html_class => html_class
    }
  end

  def nav_dropdown(title, icon, items)
    html_class ="dropdown"
    html_class += " active" if items.any? { |i| current_page?(i[1]) }

    render :partial => "shared/nav_dropdown", :locals => { 
      :title      => title,
      :icon       => icon,
      :items      => items,
      :html_class => html_class
    }
  end  
end
