# README

# アプリケーション概要

## アプリ名
oncetime
## 本番環境URL
https://oncetime-35435.herokuapp.com/

basic認証 id: itiapotami  <br>  password: chorrpy

### 概要
**旅行での一期一会を多くの人へ**
一人で旅行をする際の不安の解消や旅先での出会いを楽しんでもらう事を目的としたゲストハウスの予約と宿泊者同士の交流ができるサービスです
一人で旅行をする際の主な不安要因として宿泊地周辺の情報の不足、治安の悪い土地での事件に巻き込まれる可能性もあります。これらの問題を解消するために当サービスでは予約した宿に宿泊したことのあるユーザーや宿泊予定のユーザー同士でのチャットでの交流が行えます。

## 制作背景
バックパッカーをしていた際に知り合ったバックパッカーの方々の多くが事件に合いそうになった経験がある事、また自身も事件に巻き込まれた経験がきっかけで当サービスの作成を企画。
コロナウイルスの影響で現在は海外出国数は減っているがそれ以前は年々出国者数は増加傾向にあった。それに起因するかのように外務省の調べでは海外での邦人援護件数も増加している。
これらの事実を踏まえ当サービスで宿泊地周辺の治安等様々な情報の共有や観光する際のメンバーの募集などができることで旅行者がより安全に旅行を楽しめたらと思い制作した。

<img width="993" alt="日本人海外出国者数" src="https://user-images.githubusercontent.com/81914211/130200863-af34d900-cd0c-4e72-888c-f9cda8e36167.png">

<img width="1124" alt="日本人援護件数" src="https://user-images.githubusercontent.com/81914211/130201013-024b2f50-7446-42c5-a024-f8ad63b07169.png">

参考 :https://www.anzen.mofa.go.jp/anzen_info/pdf/2019.pdf
参考 :https://www.jtb.or.jp/wp-content/uploads/2019/10/nenpo2019_1-3.pdf


## 機能一部紹介

# トップページ

<img width="1436" alt="4b2063c55b659ff1709d3058cb1a9f91" src="https://user-images.githubusercontent.com/81914211/132121715-fed9fabb-78f3-4b20-bd4a-97bcd1628358.png">




# 宿泊施設の投稿

https://user-images.githubusercontent.com/81914211/130209853-9fe87a5f-f3c1-404d-9f30-f1c1e76bbff0.mp4

# チャット機能

https://user-images.githubusercontent.com/81914211/132121485-24bad994-4049-47de-af93-e2d28b2cc8a0.mp4


## 機能一覧
- ユーザー登録、ログイン機能(devise)
- ユーザー編集機能
  - アイコン画像投稿機能
- 施設管理ユーザー登録、ログイン機能(devise)
- 宿泊施設投稿機能
  - 画像投稿機能
- 宿泊施設編集機能
- 宿泊部屋の投稿機能
- 宿泊予約機能
- チャット機能
  - Actioncableによる非同期通信
- 一部レスポンシブデザイン対応

- 検索機能は今後実装予定


使用言語・技術
- Ruby2.6.5
- Ruby on Rails 6.0.0
- Mysql 5.6
- AWS
  - S3
  - EC2
- Docker/Docker-compose


# テーブル設計

## users テーブル

| Column               | Type   | Options                  |
| -------------------- | ------ | ------------------------ |
| nickname             | string | null: false              |
| email                | string | null: false  unique:true |
| encrypted_password   | string | null: false              |
| image                | string | null: false              |

### Association
- has_many :reservations
- has_many :chat_messages

## owners テーブル

| Column               | Type   | Options                  |
| -------------------- | ------ | ------------------------ |
| nickname             | string | null: false              |
| email                | string | null: false  unique:true |
| encrypted_password   | string | null: false              |
| last_name            | string | null: false              |
| first_name           | string | null: false              |
| last_kana            | string | null: false              |
| first_kana           | string | null: false              |
| phone_number         | string | bull: false              |

### Association
-has_many :hotels
-has_many :rooms

## hotels テーブル

| Column               | Type   | Options                  |
| -------------------- | ------ | ------------------------ |
| hotel_name           | string | null: false              |
| description          | string | null: false  unique:true |
| encrypted_password   | string | null: false              |
| last_name            | string | null: false              |
| first_name           | string | null: false              |
| last_kana            | string | null: false              |
| first_kana           | string | null: false              |
| phone_number         | string | bull: false              |

### Association
- belongs_to :prefecture
- belongs_to :owner
- has_many   :rooms
- has_one    :chat_room
- has_one_attached :image

## rooms テーブル

| Column               | Type        | Options                  |
| -------------------- | ------      | -------------------------|
| room_name            | string      | null: false              |
| capacity             | string      | null: false              |
| price                | string      | null: false              |
| hotel                | references  | foreign_key: true        |

### Association

- belongs_to :owner
- belongs_to :hotel
- has_many :reservations
- has_many :room_facilities
- has_many :facilities, through: :room_facilities, dependent: :destroy
- has_one_attached :image


## facilities テーブル

| Column               | Type        | Options                  |
| -------------------- | ------      | -------------------------|
| name                 | string      | null: false              |

### Association

- has_many :room_facilities
- has_many :rooms, through: :room_facilities, dependent: :destroy

## room_facilities テーブル

| Column               | Type        | Options                  |
| -------------------- | ------      | -------------------------|
| room                 | references  | foreign_key: true        |
| facility             | references  | foreign_key: true        |

### Association

- belongs_to :room
- belongs_to :facility

## reservations テーブル

| Column               | Type   | Options                  |
| -------------------- | ------ | ------------------------ |
| start_date           | string | null: false              |
| end_date             | string | null: false  unique:true |
| person               | string | null: false              |
| last_name            | string | null: false              |
| first_name           | string | null: false              |
| last_kana            | string | null: false              |
| first_kana           | string | null: false              |
| phone_number         | string | null: false              |
| room                 |        | foreign_key: true        |
| user                 |        | foreign_key: true        |

### Association

- belongs_to :user
- belongs_to :room

## chat_rooms テーブル

| Column               | Type   | Options                  |
| -------------------- | ------ | ------------------------ |
| hotel                |        | foreign_key: true              |

### Association

- belongs_to :hotel
- has_many :chat_messages

## chat_messages テーブル

| Column               | Type   | Options                  |
| -------------------- | ------ | ------------------------ |
| chat_room            |        | foreign_key: true        |
| user                 |        | foreign_key: true        |
| content              | text   |                          |

### Association

- belongs_to :user
- belongs_to :chat_room


## 今後の改善点
- スマホでアクセスするユーザーのための全ページのレスポンシブ化
- さらなる機能の追加(宿泊施設の地図の表示等)

