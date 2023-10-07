Foto.where.not(kdan_id: nil).count
Foto.where.not(kdan_id: nil).delete_all
Kdan.all.count
Kdan.all.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('kdans')
