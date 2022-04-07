module ApplicationHelper
    
    
    def gravatar_for(user, options = {size: 80})
        if user.user_email == nil
            return
        end
        email_address = user.user_email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(image_src, alt: user.username, class: "rounde shadow mx-auto d-block mt-2")
    end
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
  
    def logged_in?
        !!current_user
    end
    
end