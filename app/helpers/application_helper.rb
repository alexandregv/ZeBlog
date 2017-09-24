module ApplicationHelper

    def page_title(separator = " | ")
      ['ZeBlog', content_for(:title)].compact.join(separator)
    end
    
    def page_heading(title)
      content_for(:title){ title }
      # content_tag(:h1, title)
    end
    
    def no_turbolinks
        content_for(:turbolinks){ "data-turbolinks=false" }
    end

end
