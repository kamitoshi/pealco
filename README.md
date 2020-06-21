# PeAlco

### サイト URL
https://pealco.work  
実際にサイトを見たい方は、上記URLよりサイトを開いてください。  
ログインページに『テストログイン』ボタンがあるので、そちらを押していただければログインできます。  

## アプリ説明

ご覧いただきありがとうございます。  
私が、初めて１から作ったポートフォリオで、お酒好きな人のための投稿型コミュニケーションSNSアプリケーションです。  
元々、自分がお酒が好きなこともあり、お酒に関係したアプリを作りたいと思っていたことと、コロナが流行り、オンライン飲み会と称した宅飲みが
流行り始めたことがきっかけで、SNSでお酒が好きな人が集まれるコミュニティを作りたいと思ったことがきっかけで当アプリを作り始めました。
一般的な機能実装しかできていませんが、最低限SNSに必要だと思われる機能をつけ、チャット機能にActionCableを使ったり、検索にRansackを
使うことで今後の機能拡充（検索範囲の拡大）などの仕様変更に対応できるような仕様にしてみました。
実用的というより、自分の勉強用のポートフォリオになってしまった気がします。
今後、今以上に実用性を持たせるため更新していく予定です。  

仕様
https://docs.google.com/presentation/d/e/2PACX1vSBIGTnGa0wmUCfVnVsjDHbFPuHVVAt7fUVfvkjw_bZ1_UOwHvNIUw542ast5ytlRpGzVA27KeUUSol/embed?start=true&loop=true&delayms=3000

## 設計詳細

### 開発環境

```
ruby     ~> 2.5.7
rails    ~> 5.2.4.2
puma     ~> 3.12
Nginx    ~> 1.16.1
```

### gemfile's

共通

```
bootstrap
jquery-rails
devise
kaminari
dotenv-rails
simple-calendar
ransack
rails-i18n
faker
forgery_ja
```

development環境

```
pry-rails
capistrano
capistrano-rails
capistrano3-puma
capistrano-rbenv
```

test環境

```
capybara
rspec-rails
factory_bot_rails
rails-controller-testing
```

production環境

```
mysql2
fog-aws
```

### DB 設計
データベースの設計図です。  
https://docs.google.com/spreadsheets/d/1yB89FM5LkVpAXCz93_89tM6FoUcdYKMOkgxHI1HF2Ck/edit?usp=sharing

### ER 図
データベースのER図です。  
https://drive.google.com/file/d/1CC_JC1pluBLzqBDcvyZRPxN_pUw95ot-/view?usp=sharing

### UIflow
画面遷移のためのUIflowです。  
https://drive.google.com/file/d/1KiXrOEsvuSKcR969o9VBr1iuJ_eyJlm6/view?usp=sharing

### 機能一覧
実装機能一覧です。  
https://docs.google.com/spreadsheets/d/1I5vdTHqn5IiwmtPpze67i_Ql-SUrbg2H38qOsVX21Dk/edit?usp=sharing
