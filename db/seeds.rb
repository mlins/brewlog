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
      hop_attributes.merge!({k.downcase => v.strip})
    end
  end

  hop = Hop.new
  hop.attributes = hop_attributes.reject{|k,v| !hop.attributes.keys.member?(k.to_s) }
  hop.save
end
