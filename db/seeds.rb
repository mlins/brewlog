hops = Crack::XML.parse(
  File.open(
    File.join(Rails.root, 'db', 'seeds', 'hops.xml')
  ).read
)

hops["HOPS"]["HOP"].each do |hop_xml|
  hop_attributes = {}
  hop_xml.each do |k,v|
    if k == "TYPE"
      hop_attributes.merge!({"description" => v.strip})
    else
      if v
        hop_attributes.merge!({k.downcase => v.strip})
      end
    end
  end

  hop = Hop.new
  hop.attributes = hop_attributes.reject{|k,v| !hop.attributes.keys.member?(k.to_s) }
  hop.master = true
  hop.save!
end

fermentables = Crack::XML.parse(
  File.open(
    File.join(Rails.root, 'db', 'seeds', 'fermentables.xml')
  ).read
)

fermentables["FERMENTABLES"]["FERMENTABLE"].each do |fermentable_xml|
  fermentable_attributes = {}
  fermentable_xml.each do |k,v|
    if k == "TYPE"
      fermentable_attributes.merge!({"description" => v.strip})
    elsif k == "IBU_GAL_PER_LB"
      fermentable_attributes.merge!({"ibu" => v.strip})
    elsif k == "COARSE_FINE_DIFF"
      fermentable_attributes.merge!({"coarse_fine_difference" => v.strip})
    elsif k == "RECOMMEND_MASH"
      if v.strip == "TRUE"
        fermentable_attributes.merge!({"recommended_mash" => true})
      else
        fermentable_attributes.merge!({"recommended_mash" => false})
      end
    elsif k == "ADD_AFTER_BOIL"
      if v.strip == "TRUE"
        fermentable_attributes.merge!({"add_after_boil" => true})
      else
        fermentable_attributes.merge!({"add_after_boil" => false})
      end
    else
      if v
        fermentable_attributes.merge!({k.downcase => v.strip})
      end
    end
  end

  fermentable = Fermentable.new
  fermentable.attributes = fermentable_attributes.reject{|k,v| !fermentable.attributes.keys.member?(k.to_s) }
  fermentable.master = true
  fermentable.save!
end

yeasts = Crack::XML.parse(
  File.open(
    File.join(Rails.root, 'db', 'seeds', 'yeasts.xml')
  ).read
)

yeasts["YEASTS"]["YEAST"].each do |yeast_xml|
  yeast_attributes = {}
  yeast_xml.each do |k,v|
    if k == "TYPE"
      yeast_attributes.merge!({"description" => v.strip})
    elsif k == "ATTENUATION"
      yeast_attributes.merge!({"min_attenuation" => v.strip})
      yeast_attributes.merge!({"max_attenuation" => v.strip})
    else
      if v
        yeast_attributes.merge!({k.downcase => v.strip})
      end
    end
  end

  yeast = Yeast.new
  yeast.attributes = yeast_attributes.reject{|k,v| !yeast.attributes.keys.member?(k.to_s) }
  yeast.master = true
  yeast.save!
end

user = User.create!(:email => "mattlins@gmail.com", :password => "password", :password_confirmation => "password")
user.confirm!
