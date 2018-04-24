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

#ステータス初期データ
Status.create(:status_name => '受付中')
Status.create(:status_name => '商品準備中')
Status.create(:status_name => '出荷準備中')
Status.create(:status_name => '出荷済')
Status.create(:status_name => '取消し')

#支払い方法初期データ
Payment.create(:payment_name => 'カード決済')
Payment.create(:payment_name => 'カード決済')
Payment.create(:payment_name => '代金引換')

#管理ユーザ初期データ
Admin.first_or_create(:email => 'test@test.com', :password => 'password')

#開発用利用者データ
User.create(:last_name => '山田',:first_name => '太郎',:last_kana => 'ヤマダ',:first_kana => 'タロウ',:postal_code => '123-4567',:address => 'テスト住所', :tell => '123-4567-8901', :email =>'test2@test.com',:password=>'password')
User.create(:last_name => '鈴木',:first_name => '花子',:last_kana => 'スズキ',:first_kana => 'ハナコ',:postal_code => '123-4567',:address => 'テスト住所', :tell => '123-4567-8901', :email =>'test3@test.com',:password=>'password')
User.create(:last_name => '佐藤',:first_name => '大介',:last_kana => 'サトウ',:first_kana => 'ダイスケ',:postal_code => '123-4567',:address => 'テスト住所', :tell => '123-4567-8901', :email =>'test4@test.com',:password=>'password')

#開発用商品データ
Item.create(:artist => 'testArtist1', :title_name => 'testAlbam1',:label => 'testLabel1',:price => 1980,:stock => 10,:image_id => 'test.jpg',:admin_id => 1,:genre_id =>1)
Item.create(:artist => 'testArtist2', :title_name => 'testAlbam2',:label => 'testLabel2',:price => 1980,:stock => 10,:image_id => 'test.jpg',:admin_id => 1,:genre_id =>2)
Item.create(:artist => 'testArtist3', :title_name => 'testAlbam3',:label => 'testLabel1',:price => 1980,:stock => 10,:image_id => 'test.jpg',:admin_id => 1,:genre_id =>2)
Item.create(:artist => 'testArtist3', :title_name => 'testAlbam4',:label => 'testLabel2',:price => 1980,:stock => 10,:image_id => 'test.jpg',:admin_id => 1,:genre_id =>1)
Item.create(:artist => 'testArtist4', :title_name => 'testAlbam5',:label => 'testLabel2',:price => 1980,:stock => 10,:image_id => 'test.jpg',:admin_id => 1,:genre_id =>1)

CdItem.create(:item_id =>1,:cd_title => 'testCDtitle1')
CdItem.create(:item_id =>1,:cd_title => 'testCDtitle2')
CdItem.create(:item_id =>2,:cd_title => 'testCDtitle3')
CdItem.create(:item_id =>3,:cd_title => 'testCDtitle4')
CdItem.create(:item_id =>4,:cd_title => 'testCDtitle5')
CdItem.create(:item_id =>5,:cd_title => 'testCDtitle5')

Song.create(:song_title => 'testSong1',:cd_item_id => 1, :song_number => 1)
Song.create(:song_title => 'testSong2',:cd_item_id => 1, :song_number => 2)
Song.create(:song_title => 'testSong3',:cd_item_id => 2, :song_number => 1)
Song.create(:song_title => 'testSong4',:cd_item_id => 3, :song_number => 1)
Song.create(:song_title => 'testSong5',:cd_item_id => 3, :song_number => 2)
Song.create(:song_title => 'testSong6',:cd_item_id => 4, :song_number => 1)
Song.create(:song_title => 'testSong7',:cd_item_id => 5, :song_number => 1)
Song.create(:song_title => 'testSong8',:cd_item_id => 5, :song_number => 2)
Song.create(:song_title => 'testSong9',:cd_item_id => 5, :song_number => 3)


Status.create(:status_name => '送付済み')
Payment.create(:payment_name => '現金払い')

#開発用購入履歴
OrderHistory.create(:user_id => 1,:status_id=>4,:buy_day => '2018-01-01',:payment_id => 1,:summary_count => 2,:summary_price =>3960,:destination => 'テスト住所')
OrderHistoryItem.create(:item_id => 1,:order_history_id => 1,:price => 1980,:artist => 'testArtist1',:title_name => 'testAlbam1')
OrderHistoryItem.create(:item_id => 2,:order_history_id => 1,:price => 1980,:artist => 'testArtist2',:title_name => 'testAlbam2')
OrderHistory.create(:user_id => 2,:status_id=>4,:buy_day => '2018-01-10',:payment_id => 2,:summary_count => 1,:summary_price =>1980,:destination => 'テスト住所')
OrderHistoryItem.create(:item_id => 1,:order_history_id => 2,:price => 1980,:artist => 'testArtist1',:title_name => 'testAlbam1')
OrderHistory.create(:user_id => 1,:status_id=>4,:buy_day => '2018-03-10',:payment_id => 1,:summary_count => 1,:summary_price =>1980,:destination => 'テスト住所')
OrderHistoryItem.create(:item_id => 3,:order_history_id => 3,:price => 1980,:artist => 'testArtist3',:title_name => 'testAlbam3')
OrderHistory.create(:user_id => 3,:status_id=>4,:buy_day => '2018-03-27',:payment_id => 1,:summary_count => 3,:summary_price =>5940,:destination => 'テスト住所')
OrderHistoryItem.create(:item_id => 1,:order_history_id => 4,:price => 1980,:artist => 'testArtist1',:title_name => 'testAlbam1')
OrderHistoryItem.create(:item_id => 2,:order_history_id => 4,:price => 1980,:artist => 'testArtist2',:title_name => 'testAlbam2')
OrderHistoryItem.create(:item_id => 3,:order_history_id => 4,:price => 1980,:artist => 'testArtist3',:title_name => 'testAlbam3')
OrderHistory.create(:user_id => 3,:status_id=>4,:buy_day => '2018-04-10',:payment_id => 1,:summary_count => 1,:summary_price =>1980,:destination => 'テスト住所')
OrderHistoryItem.create(:item_id => 1,:order_history_id => 5,:price => 1980,:artist => 'testArtist1',:title_name => 'testAlbam1')
OrderHistory.create(:user_id => 2,:status_id=>4,:buy_day => '2018-04-10',:payment_id => 1,:summary_count => 2,:summary_price =>3960,:destination => 'テスト住所')
OrderHistoryItem.create(:item_id => 4,:order_history_id => 6,:price => 1980,:artist => 'testArtist4',:title_name => 'testAlbam4')
OrderHistoryItem.create(:item_id => 5,:order_history_id => 6,:price => 1980,:artist => 'testArtist5',:title_name => 'testAlbam5')
OrderHistory.create(:user_id => 1,:status_id=>4,:buy_day => '2018-04-11',:payment_id => 1,:summary_count => 1,:summary_price =>1980,:destination => 'テスト住所')
OrderHistoryItem.create(:item_id => 4,:order_history_id => 7,:price => 1980,:artist => 'testArtist4',:title_name => 'testAlbam4')
OrderHistory.create(:user_id => 3,:status_id=>4,:buy_day => '2018-04-15',:payment_id => 1,:summary_count => 3,:summary_price =>5940,:destination => 'テスト住所')
OrderHistoryItem.create(:item_id => 4,:order_history_id => 8,:price => 1980,:artist => 'testArtist4',:title_name => 'testAlbam4')

