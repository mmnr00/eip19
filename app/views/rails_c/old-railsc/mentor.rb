Ekid.where(stat:"NEW",admloc:"sha").order('created_at ASC').first(20).each do |ek|
ek.stat = "MENTOR"
ek.admloc = "srd"
ek.save
end

Ekid.where(stat:"MENTOR",admloc:"srd").each do |ek|
ek.stat = "MENTOR"
ek.admloc = "sha"
ek.save
end


