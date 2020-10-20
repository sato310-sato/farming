
# Farming
<img width="700" alt="TOP" src="https://user-images.githubusercontent.com/70623574/96463125-5741f480-1261-11eb-8984-86cbf35455b9.png">

<img width="200" alt="new" src="https://user-images.githubusercontent.com/70623574/96463134-590bb800-1261-11eb-8944-9e0155e674c2.png"><img width="200" alt="session" src="https://user-images.githubusercontent.com/70623574/96463137-5ad57b80-1261-11eb-9eea-1df65d17a909.png">

## アプリケーション概要

農業に携わる方々がコミュニケーションを図るためのSNSです。農作業の人手を募集する際にも活用できます。

## URL
https://farming-2020.herokuapp.com/

## 使用技術
* ruby 2.6.5
* Ruby on Rails 6.0
* MySQL 5.6.47

使用予定
* RSpec
* AWS
   * S3

## テスト用アカウント：　

Basic認証        
      ID:admin
password:2222

## 利用方法
  ユーザー登録後は農作物の成果物などについての呟きを投稿する事ができます。また農作業の際の人手募集にも活用できます。

## 目指した問題解決
 　現在、農業人口が現象傾向にあります。自分自身、幼い頃から実家の農業の手伝いをして参りましたが、農業に関わる方とコミュニケーションをとるには自分の住んでいる地域、主に自分の生活範囲となってしまいがちです。
 <br><br>
  　そこで同世代の方を見つけたり、出荷しているものが同じといった、農業の仲間を見つける事ができ、気軽にコミュニケーションをとれる場所があれば良いのではないかと考えました。特に若者世代はSNSでのコミュニケーションが主流となっており、地域以外の方々にも成果物を発表でき農業に関する発言ができるSNSがあればコミュニケーションの場が広がっていきます。
 <br><br>
 　そして、農作業で人手が足りない時、親戚や知人に連絡をとり日程を調整するのには手間がかかります。人手募集機能を活用する事で人手調整に時間をさく時間を短縮でき、お手伝いに来てくださった方と交流する事で農業体験の機会となったり、交流の幅が広がっていくのではないかと思い、人手を募集に関する項目を投稿機能に追加したいと思いました。

## 洗い出した要件
* ユーザー登録、ログイン機能(devise認証)
* Tweet投稿機能
  * 画像投稿
* Tweet削除機能
* Tweet編集機能
* 検索機能
* コメント機能

## 実装した機能についてのGIFと説明
devise認証

## 実装予定の機能
* Tweet投稿機能
* Tweet削除機能
* Tweet編集機能
* Tweet検索機能
* コメント機能
* メッセージ送信機能
* 投稿記事に対するお気に入り追加機能
* いいね機能


## データベース設計

<img width="700" alt="スクリーンショット 2020-10-19 23 23 18" src="https://user-images.githubusercontent.com/70623574/96463902-2e6e2f00-1262-11eb-876b-87ba5f30d03c.png">



### users テーブル

| Column      | Type   | Options     |
| ------------| ------ | ----------- |
| name        | string | null: false |
| email       | string | null: false |
| password    | string | null: false |

### Association

- has_many :tweets
- has_many :comments

### tweets テーブル

| Column      | Type       | Options                        |
| ------------| -----------| -------------------------------|
| title       | string     | null: false                    |
| text        | string     | null: false                    |
| category_id | integer    | null: false                    |
| content_id  | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments

### comments テーブル

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet

