# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ジャンル初期データ
Genre.create(:genre_name => 'J-Pop')
Genre.create(:genre_name => 'K-Pop')
Genre.create(:genre_name => 'R&B/ソウル')
Genre.create(:genre_name => 'ダンス')
Genre.create(:genre_name => 'Jazz')
Genre.create(:genre_name => 'Rock')
Genre.create(:genre_name => 'クラシック')

#管理ユーザ初期データ
Admin.first_or_create(:email => 'test@test.com', :password => 'password')

Item.create(:artist => 'testArtist', :title_name => 'testAlbam',:label => 'testLabel',:price => 1980,:stock => 10,:image_id => 'test.jpg',:admin_id => 1,:genre_id =>1)
CdItem.create(:item_id =>1,:cd_title => 'testCDtitle')
Song.create(:song_title => 'testSong1',:cd_item_id => 1)
Song.create(:song_title => 'testSong2',:cd_item_id => 1)
