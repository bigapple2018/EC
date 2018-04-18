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

#開発用商品データ
Item.create(:artist => 'testArtist1', :title_name => 'testAlbam1',:label => 'testLabel1',:price => 1980,:stock => 10,:image_id => 'test.jpg',:admin_id => 1,:genre_id =>1)
Item.create(:artist => 'testArtist2', :title_name => 'testAlbam2',:label => 'testLabel2',:price => 1980,:stock => 10,:image_id => 'test.jpg',:admin_id => 1,:genre_id =>2)
Item.create(:artist => 'testArtist3', :title_name => 'testAlbam3',:label => 'testLabel1',:price => 1980,:stock => 10,:image_id => 'test.jpg',:admin_id => 1,:genre_id =>2)
Item.create(:artist => 'testArtist3', :title_name => 'testAlbam4',:label => 'testLabel2',:price => 1980,:stock => 10,:image_id => 'test.jpg',:admin_id => 1,:genre_id =>1)
Item.create(:artist => 'testArtist4', :title_name => 'testAlbam5',:label => 'testLabel2',:price => 1980,:stock => 10,:image_id => 'test.jpg',:admin_id => 1,:genre_id =>1)

CdItem.create(:item_id =>1,:cd_title => 'testCDtitle1')
CdItem.create(:item_id =>2,:cd_title => 'testCDtitle2')
CdItem.create(:item_id =>3,:cd_title => 'testCDtitle3')
CdItem.create(:item_id =>4,:cd_title => 'testCDtitle4')
CdItem.create(:item_id =>5,:cd_title => 'testCDtitle5')

Song.create(:song_title => 'testSong1',:cd_item_id => 1)
Song.create(:song_title => 'testSong2',:cd_item_id => 1)
Song.create(:song_title => 'testSong2',:cd_item_id => 1)
Song.create(:song_title => 'testSong3',:cd_item_id => 2)
Song.create(:song_title => 'testSong4',:cd_item_id => 3)
Song.create(:song_title => 'testSong5',:cd_item_id => 3)
Song.create(:song_title => 'testSong6',:cd_item_id => 4)
Song.create(:song_title => 'testSong7',:cd_item_id => 5)
Song.create(:song_title => 'testSong8',:cd_item_id => 5)
Song.create(:song_title => 'testSong9',:cd_item_id => 5)
