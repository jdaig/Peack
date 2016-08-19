module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    if user.person
      image_tag(gravatar_url, alt: user.person.name, class: "gravatar")
    else
      image_tag(gravatar_url, alt: user.company.name_co, class: "gravatar")
    end
  end
end