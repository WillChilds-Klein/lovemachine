module Format
  def first_name(email)
    name = email[/[^@]+/]
    name.split(".").first.capitalize
  end

  def last_name(email)
    name = email[/[^@]+/]
    name.split(".").last.split("-").map {|n| n.capitalize }.join("-")
  end

  def full_name(email)
    [self.first_name(email),self.last_name(email)].join(" ")
  end

  def yale_email(string)
    if string.include? "@yale.edu" then
      return string
    else
      return string+"@yale.edu"
    end
  end
end