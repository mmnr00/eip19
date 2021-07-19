Ekid.all.each do |ek|
if ek.pinc == "5,001 to 10,000"
ek.pinc = "5,000 hingga 10,000"
elsif ek.pinc == "<5,000"
ek.pinc = "Kurang dari 5,000"
end
if ek.stat == "REJECTED"
ek.stat = "REJECT"
end
ek.save
end

Ekid.where.not(sce_id: nil).where(stat: "REJECT").each do |ek|

ek.stat = "CONF"
ek.save
end


cnt=0
Ekid.all.each do |ekid|
dob = ekid.dob
age = (Date.today.year*12+Date.today.month) - (dob.year*12+dob.month)
year = age/12
if ekid.pinc == "Lebih dari 10,000" || (year >= 4)
ekid.stat = "REJECT"
cnt += 1
end
ekid.save
end

tp=[]
Ekid.where('pinc LIKE ?', "%10,000%").each do |ek|
#Ekid.all.each do |ek|
inc = ek.pinc
if inc != "Lebih dari 10,000" && inc != "5,000 hingga 10,000"
tp << inc
end
end


tp1=[]
Ekid.where('pinc LIKE ?', "%5,000%").each do |ek|
#Ekid.all.each do |ek|
inc = ek.pinc
if inc != "Kurang dari 5,000" && inc != "5,000 hingga 10,000"
tp1 << inc
end
end
tp
tp1


