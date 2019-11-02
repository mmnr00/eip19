ekid=Ekid.where(stat: "CONFIRM", admloc:"sha")

ekid.each do |ek|
ek.stat = "CONF"
ek.sce_id = 11
ek.save
end
