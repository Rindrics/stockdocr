 # stockdocr
[![Travis build status](https://travis-ci.com/akikirinrin/stockdocr.svg?branch=master)](https://travis-ci.com/akikirinrin/stockdocr)

## 何ができるようになるか

### 数値展開を利用した報告書執筆
#### Rmarkdown中のテキスト
<img width="970" alt="image" src="https://user-images.githubusercontent.com/14845847/69840348-93154980-129e-11ea-835b-42ae3327c8b8.png">

#### knit後
<img width="581" alt="image" src="https://user-images.githubusercontent.com/14845847/69840440-e091b680-129e-11ea-8ba0-03bb31b72d12.png">

### draftモードを利用した校閲
`draft = TRUE/FALSE`で draftモードをトグル

<table border="0" cellspacing="0" cellpadding="30">
 <tr>
  <td><img width="310" alt="image" src="https://user-images.githubusercontent.com/14845847/69840625-8b09d980-129f-11ea-92a4-08c976d0e8a9.png">
  </td>
  <td><img width="302" alt="image" src="https://user-images.githubusercontent.com/14845847/69840990-d4a6f400-12a0-11ea-898e-62686e9c6403.png">
  </td>
 </tr>
</table>

<table border="1" cellspacing="0" cellpadding="1">
 <tr>
  <td><img width="400" alt="image" src="https://user-images.githubusercontent.com/14845847/69840867-6bbf7c00-12a0-11ea-9d49-aea71b35b83d.png">
  </td>
  <td>
   <img width="400" alt="image" src="https://user-images.githubusercontent.com/14845847/69840963-b7722580-12a0-11ea-94e2-0d148850abca.png">
</td>
  </tr>
</table>

### ポイント
自動生成はさせないが整合性を確認したい部分は`checkme()`関数中に記述することで、draftモード時に黄色でハイライトされる
（本当は徐々に関数化してゆくべきなので暫定措置）

## インストール
R起動後
```
devtools::install_github("akikirinrin/stockdocr")
```

## 使い方
### インタラクティブな動作
[frasyrパッケージのvpa関数](https://github.com/ichimomo/frasyr/blob/master/R/rvpa.r#L493-L494)の出力（ここでは`res_vpa`）と年を`ssb()`関数に与えてみる

<img width="415" alt="image" src="https://user-images.githubusercontent.com/14845847/69841359-2f8d1b00-12a2-11ea-817b-87256aa95e3d.png">

### 報告書への活用
Rmarkdownファイル中で、インライン記法(バッククォート)を用いて文章とともに記述
```
`r ssb(res_vpa, year = yr_newest_catch, unit = "kton", draft = params$draft)`トンとなった
```
報告書サンプルは[こちら](https://github.com/akikirinrin/stockdocr/blob/master/vignettes/main.Rmd)

- [開発者向けページ](https://github.com/akikirinrin/stockdocr/wiki/%E9%96%8B%E7%99%BA%E8%80%85%E5%90%91%E3%81%91%E3%83%9A%E3%83%BC%E3%82%B8)
