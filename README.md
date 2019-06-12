# README

# CODOMO Scheduler

## 概要
シンプルに家族内のスケジュール管理を行う
終えたスケジュールには思い出の写真を投稿して家族内で共有しよう

## コンセプト
シンプルなスケジュール管理アプリ

## バージョン
Ruby 2.6.2
Rails 5.2.3

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] パスワード再設定機能
- [ ] スケジュール投稿機能
  - [ ] タイトルと記事内容、開始時刻と終了時刻は必須
- [ ] スケジュール編集機能
- [ ] スケジュール削除機能
  - [ ] スケジュール編集とスケジュール削除は投稿者のみ実行可能
- [ ] スケジュールへのフォト投稿機能
  - [ ] フォトは複数投稿が可能
  - [ ] フォトへのコメント投稿が可能


- [ ] チーム機能
  - [ ] チームの作成や、チームメンバーへのオーナー権限付与などを実行可能に
- [ ] チームメンバー招待機能
  - [ ] チームメンバーを招待し、スケジュールやフォト投稿など実行可能メンバーを増やすことが可能

## カタログ設計
https://docs.google.com/spreadsheets/d/e/2PACX-1vRt58KFkx1iPWne4aAYJeDGmJbFSBwco40XBCfLpvKzk7SW-T7kjOJHuBAkUBzwf8mNifSNaWkU1_4w/pubhtml?gid=1770486883&single=true

## テーブル定義（ER図）
https://docs.google.com/spreadsheets/d/e/2PACX-1vRt58KFkx1iPWne4aAYJeDGmJbFSBwco40XBCfLpvKzk7SW-T7kjOJHuBAkUBzwf8mNifSNaWkU1_4w/pubhtml?gid=1920110074&single=true
または
https://cacoo.com/diagrams/t1MvaORY9js3cS8l/298A7

## テーブル一覧
https://docs.google.com/spreadsheets/d/e/2PACX-1vRt58KFkx1iPWne4aAYJeDGmJbFSBwco40XBCfLpvKzk7SW-T7kjOJHuBAkUBzwf8mNifSNaWkU1_4w/pubhtml?gid=1661276896&single=true



## 画面遷移図
https://docs.google.com/spreadsheets/d/e/2PACX-1vRt58KFkx1iPWne4aAYJeDGmJbFSBwco40XBCfLpvKzk7SW-T7kjOJHuBAkUBzwf8mNifSNaWkU1_4w/pubhtml?gid=1730952680&single=true
または
https://cacoo.com/diagrams/qWL3vTy0LPcJ7M2O/252FA


## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/e/2PACX-1vRt58KFkx1iPWne4aAYJeDGmJbFSBwco40XBCfLpvKzk7SW-T7kjOJHuBAkUBzwf8mNifSNaWkU1_4w/pubhtml?gid=1795820625&single=true
または
https://cacoo.com/diagrams/gWs8ltM39GqSr4TR/E1770

## 全ドキュメント
https://docs.google.com/spreadsheets/d/e/2PACX-1vRt58KFkx1iPWne4aAYJeDGmJbFSBwco40XBCfLpvKzk7SW-T7kjOJHuBAkUBzwf8mNifSNaWkU1_4w/pubhtml


## 使用予定Gem
* 'fullcalendar-rails'
* 'momentjs-rails'
* ‘devise’
* 'jquery-rails', '4.3.3'
* 'counter_culture', '~> 1.8'
* 'carrierwave'
* 'mini_magick'