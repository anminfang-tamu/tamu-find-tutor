module ApplicationHelper
    
    
    def gravatar_for(user, options = {size: 80})
        email_address = user.user_email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(image_src, alt: user.username, class: "rounde shadow mx-auto d-block")
    end
    
end