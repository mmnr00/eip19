arr = []
Perse.all.each do |prs|
if !($dun_list.include? prs.dun)
arr << prs.dun unless arr.include? prs.dun
end
end

b={"Kajang  "=>"Kajang", 
"Jeram "=>"Jeram", 
"Bukit Antarabangsa "=>"Bukit Antarabangsa", 
"Subang Jaya "=>"Subang Jaya", 
"Kota Anggerik "=>"Kota Anggerik", 
"Kota Damansara  "=>"Kota Damansara", 
"Taman Templer "=>"Taman Templer", 
"Hulu Bernam "=>"Hulu Bernam", 
"Pandamaran  "=>"Pandamaran", 
"Sementa "=>"Sementa", 
"Pelabuhan Klang "=>"Pelabuhan Klang", 
"Seri Kembangan  "=>"Seri Kembangan", 
"Bukit Gasing  "=>"Bukit Gasing", 
"Kampung Tunku "=>"Kampung Tunku", 
"Dengkil "=>"Dengkil", 
"Sungai Panjang "=>"Sungai Panjang", 
"Rawang "=>"Rawang", 
"Bandar Baru Klang "=>"Bandar Baru Klang", 
"Kota Kemuning "=>"Kota Kemuning", 
"Meru  "=>"Meru", 
"Batang Kali "=>"Batang Kali", 
"Gombak Setia  "=>"Gombak Setia", 
"Bandar Utama  "=>"Bandar Utama"}

b.each do |k,v|
Perse.where(dun: k).each do |prs|
prs.dun = v 
prs.save
end
end

