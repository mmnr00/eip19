

Perse.where(dob: nil).each do |prs|
yr = prs.ic[0..1]
mth = prs.ic[2..3]
dy = prs.ic[4..5]

yrint = yr.to_i
if yrint <= 22
 yrf = "20"
else
 yrf = "19"
end

prs.dob = "#{yrf}#{yr}-#{mth}-#{dy}"
prs.save
end