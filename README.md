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
