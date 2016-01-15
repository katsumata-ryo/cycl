# tutyo: Under Construcsion

作成開始: 2015-12-30

<img src="https://circleci.com/gh/annp-jp/tucho.svg?style=shield&circle-token=9d72be9de4bb9913de5520a95cdd544f50aec2e2" alt="circle ci shield">

## Overview

TUCHOは個人的にあったら便利を詰め込んだ家計簿WEBサービスです。

具体的には

* 給料日を設定してその日を基準として一ヶ月回したい
* 一括で12ヶ月電気代とか登録したい
* カテゴリーごとに予算を設定して、どれくらい使っているか知りたい
* 今月のクレジットカードの引き落としでビクビクしたくない(予測値がみたい)
* 年単位でどういうお金の使い方をしたか見たい

に対応する予定です

## Now

支払いを登録してその内容を集計するところまで完了。

## Environment

* ruby 2.3.0
* rails 4.2.5
* postgres
* サーバ
    * heroku => VPSへ移行予定
* deploy/ci
    * circle ci

## Author

Ryo Katsumata
