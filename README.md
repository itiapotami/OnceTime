# README

# アプリ名 once time

## アプリケーション概要
一人旅の不安を解消するアプリ
## URL
https://oncetime-35435.herokuapp.com/

basic認証 id: itiapotami  <br>  password: chorrpy

### コンセプト
**旅行での一期一会を多くの人へ**
一人旅が好きな人や,「旅行は好きだけど一人旅は不安」「旅先での感動や楽しさを誰かと共有したい」という方をターゲットに制作中。一人旅の満足感と一人旅に挑戦できる人を増やすことを目指しています。

## 実装機能（予定も含む）
- ユーザー管理機能
- 施設管理ユーザー機能
- ホテル投稿機能
- 部屋の投稿機能

以下実装予定
- 予約機能
- 宿泊者同士の交流機能
- 情報ノート機能

## なぜこれらの機能を実装するのか
一人旅に興味があるが踏み切れない人が抱える課題
| 課題                                             | 解決策                                             |
| ----------------------------------------------- | ------------------------------------------------- |
| 一人旅をしてみたいけれど不安<br><br>旅先での感動を他者と共有したいが一人旅だとできない | 同じ施設に宿泊する予定の人と、宿泊前にやり取りできるチャット機能を実装。事前に交流できるようにすることで、一人旅への心理的不安の解消を狙った。|
| 初めていく地域は情報不足になりがち                    | 過去の宿泊者達が施設周辺の情報などを残せるように投稿機能を実装|

# テーブル設計

## users テーブル

| Column               | Type   | Options                  |
| -------------------- | ------ | ------------------------ |
| nickname             | string | null: false              |
| email                | string | null: false  unique:true |
| encrypted_password   | string | null: false              |


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

## rooms テーブル

| Column               | Type        | Options                  |
| -------------------- | ------      | -------------------------|
| room_name            | string      | null: false              |
| capacity             | string      | null: false              |
| price                | string      | null: false              |
| hotel                | references  | foreign_key: true        |


## facilities テーブル

| Column               | Type        | Options                  |
| -------------------- | ------      | -------------------------|
| name                 | string      | null: false              |

## room_facilities テーブル

| Column               | Type        | Options                  |
| -------------------- | ------      | -------------------------|
| room                 | references  | foreign_key: true        |
| facility             | references  | foreign_key: true        |
