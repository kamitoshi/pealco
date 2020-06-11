# PeAlco

## サイト概要

今日は家で飲みたいな、、、  
でも、何飲もうかな？何をつまみにしようかな？そんな時のちょっとした手助けに！
みんながやっている飲み合わせ、食べ合わせを掲載！！  
チャット機能を通して飲み友達を作ることも。  
カレンダーを使って、オンライン飲み会のスケジュール管理も。

<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vSBIGTnGa0wmUCfVnVsjDHbFPuHVVAt7fUVfvkjw_bZ1_UOwHvNIUw542ast5ytlRpGzVA27KeUUSol/embed?start=true&loop=true&delayms=3000" frameborder="0" width="480" height="299" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

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

development

```
pry-rails
capistrano
capistrano-rails
capistrano3-puma
capistrano-rbenv
```

test

```
capybara
rspec-rails
factory_bot_rails
rails-controller-testing
```

production

```
mysql2
fog-aws
```

### DB 設計

https://docs.google.com/spreadsheets/d/1yB89FM5LkVpAXCz93_89tM6FoUcdYKMOkgxHI1HF2Ck/edit?usp=sharing

### ER 図

https://drive.google.com/file/d/1CC_JC1pluBLzqBDcvyZRPxN_pUw95ot-/view?usp=sharing

### UIflow

https://drive.google.com/file/d/1KiXrOEsvuSKcR969o9VBr1iuJ_eyJlm6/view?usp=sharing

### 機能一覧

https://docs.google.com/spreadsheets/d/1I5vdTHqn5IiwmtPpze67i_Ql-SUrbg2H38qOsVX21Dk/edit?usp=sharing
