git checkout 1wip
git add -A
git commit -m "eip"
git push

git checkout master_e
git merge 1wip
git push

git checkout prod_e
git merge master_e
git push

git diff HEAD master_e
git diff HEAD 1wip
git checkout 1wip

heroku maintenance:on --app eip19-prod
dropdb eip-bcup1 -U MustakhimRehan
heroku pg:pull DATABASE_URL eip-bcup1 --app eip19-prod

git push prod-heroku prod_e:master
#heroku run rake db:migrate --app eip19-prod
heroku restart --app eip19-prod
heroku maintenance:off --app eip19-prod

disc = (24.0/28.0).to_f

Taska.find([55,56]).each do |t|
t.discount=disc
t.save
end

