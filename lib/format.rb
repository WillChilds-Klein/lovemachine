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
    if (string.blank?) || (string.include? "@yale.edu") then
      return string
    else
      return string+"@yale.edu"
    end
  end

  def unfix_email(crush)
    if crush.email then
      crush.email = crush.email.chomp("@yale.edu")
    end
    if crush.crush1 then
        crush.crush1 = crush.crush1.chomp("@yale.edu")
    end
    if crush.crush2 then
        crush.crush2 = crush.crush2.chomp("@yale.edu")
    end
    if crush.crush3 then
        crush.crush3 = crush.crush3.chomp("@yale.edu")
    end
    if crush.crush4 then
        crush.crush4 = crush.crush4.chomp("@yale.edu")
    end
    if crush.crush5 then
        crush.crush5 = crush.crush5.chomp("@yale.edu")
    end
    if crush.crush6 then
        crush.crush6 = crush.crush6.chomp("@yale.edu")
    end
    if crush.crush7 then
        crush.crush7 = crush.crush7.chomp("@yale.edu")
    end
    return crush
  end

end