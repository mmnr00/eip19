ek = Ekid.find(8064)
ek.pkid.destroy
ek.destroy

ek = Ekid.find(7831)
ek.pkid.destroy
ek.destroy

ek = Ekid.find(6683)
ek.pkid.destroy
ek.destroy

Ekid.where(id: [7054,7221,6498,6500,6682,6811]).each do |ek|
ek.pkid.destroy
ek.destroy
end

sam = []
sam1 = []
Ekid.all.each do |ek|
if Ekid.where(name: ek.name).count > 1
sam << ek.id
end
if ek.ic != "NA"
if Ekid.where(ic: ek.ic).count > 1
sam1 << ek.id
end
end
end

sam
sam1

sam.each do |n|
puts Ekid.find(n).name
puts Ekid.find(n).ic
puts Ekid.find(n).sce_id
end

sam1.each do |n|
puts Ekid.find(n).name
puts Ekid.find(n).ic
puts Ekid.find(n).sce_id
end


ek = Ekid.find(8064)
ek.pkid.destroy
ek.destroy

ek = Ekid.find(7831)
ek.pkid.destroy
ek.destroy

ek = Ekid.find(6683)
ek.pkid.destroy
ek.destroy

Ekid.where(id: [7054,7221,6498,6500,6682,6811]).each do |ek|
ek.pkid.destroy
ek.destroy
end



