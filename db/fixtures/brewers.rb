Brewer.seed(:name, :password) do |s|
	s.name = "admin"
	s.password = "nusdrunk"
	s.inviter_name = "admin"
	s.home_base = Place.find(1)
end