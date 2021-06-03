# README

# アプリ名 oncetime

## アプリケーション概要

## URL
https://oncetime-35435.herokuapp.com/

### コンセプト
**旅行での一期一会を多くの人へ**
一人旅が好きな人や旅行は好きだけど一人旅は不安だし旅先での感動や楽しさはやっぱり誰かと共有したいという方をターゲットに制作中

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

| 課題                                             | 解決策                                             |
| ----------------------------------------------- | ------------------------------------------------- |
| 一人旅をしてみたいけれど不安<br>旅先での感動を共有したい | 宿泊予定の人とチャット等で交流できれば不安を解消できるのでは|
| 初めていく地域は情報不足になりがち                    | 過去の宿泊者達が周辺施設の情報などを残せれば情報が増えていく|

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
