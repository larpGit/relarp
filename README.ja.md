<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://www.larpwright.eu/assets/rl-logo_wh.png">
  <source media="(prefers-color-scheme: light)" srcset="https://www.larpwright.eu/assets/rl-logo_bl.png">
  <img align="right" alt="Larpwright Logo." src="https://www.larpwright.eu/assets/rl-logo_bl.png">
</picture>

# reLarp
[![en](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![de](https://img.shields.io/badge/lang-de-green.svg)](README.de.md)
[![ja](https://img.shields.io/badge/lang-ja-red.svg)](README.ja.md)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/larpgit/relarp?color=lightgrey&label=version&logo=github)](https://github.com/larpGit/relarp/releases/latest)

このツールは，[LARP](https://nordiclarp.org/wiki/Larp)（ライブ・アクション・ロールプレイ）後の振り返り段階において，可視化と評価の手順として使用することができます（re-view, re-flection > reLarp）．本ツールは，[内藤哲雄氏](https://pacanalysis.jimdofree.com/)が開発したPAC（Personal Attitude Construct）分析にインスピレーションを得て開発された混合法による評価手法です．｢PAC分析は，心理学，社会学，語学教育，カウンセリングなど，今日日本のさまざまな分野で用いられており，綿密なインタビューと統計的なクラスタリングや視覚化を組み合わせて，個人の経験を明らかにしています．ここでいう視覚化とは，インタビュー対象者が自分の体験を表現するために選んだキーワードのつながりを表す樹形図のことです．このアプローチの視覚性は，参加者の内省の基礎を提供し，その内省を他の人にも伝えることができるため，学習目的での主な利点につながる｣ (Kamm [2019](https://doi.org/10.1007/978-981-13-8039-6_36)；原稿は英語）．<br/>
高度に構造化されたディブリーフ戦略として，LARP体験用に調整したPAC分析変法を用いて，LARPのデザイン評価を支援し，さらに重要なのは，参加者が自分の体験を意味づけ，学びを可視化するプロセスを支援する方法としています．<br/>
本Shinyアプリは，そのプロセスを効率化しています：参加者は個別に感想を入力することができ，プロセス全体がガイドされています．最後に，参加者は生成されたすべての出力（デンドログラム，マトリックス）をファシリテーターに送信することができます． <br/>
使用可能なテストバージョンは，https://b-ok.shinyapps.io/reLarp/ で入手できます．<br/>
hinyapps.ioのテストバージョンを使用する場合は，関連のある[データ保護と個人情報に関する免責事項](https://www.larpwright.eu/relarp/#data_privacy)を読み，ご了承ください．

## 手順概要
**①　連想刺激文**<br/>
個人インタビューまたは集団討論を始めるため，参加者は最初に，次の連想刺激文を口頭及び書面で提示します．「安心から脱出ゲーム」 ([デザイン・ドキュメント](https://www.b-ok.de/vsc_larp/)) という教育LARPを例として挙げる，パラドックスのジレンマとの関わりを促進しようとするので，このジレンマの経験を感想の焦点に置きました．言語に関係なく，提示は以下のフォーマットのように従う（パラフレーズ）:
> 「安心からの脱出ゲーム」の三つシナリオのジレンマに直面する経験を思い出してください．その経験の説明であなたにとって大切な，思い浮かぶキーワードやイメージを自由に書いてください．キーワードやイメージは，できるだけ単語で，書いてください．

**②　自由連想語(文)**<br/>
上記の連想刺激文に従って，参加者が思いつくままイメージと単語を記入します．

**③　重要度順への並べ替え**<br/>
項目の想起順が経験を説明する重要度と異なる可能性があるため，項目を重要度順に並べ替えてもらいます．

**④　イメージ・評価**<br/>
その後の解析のために，各連想項目の単独のイメージが直感的にプラス（＋），マイナス（－），どちらともいえない（〜）のいずれに該当するかに答えてもらいます．

**⑤　類似度の評定(内包的意味)**<br/>
その後の議論と分析に備えるため，重要度順に項目を2つずつ選び，直感的なイメージで，参加者は各ペアがどの程度類似しているかについて，「1：非常に近い」から「7：非常に遠い」までの7段階尺度で評定します．評定は全ての組み合わせについて一回ずつ行います．参加者は下記のとおりの説明を受けます：
> あなたが記入したキーワードやイメージの各ペアの類似性を（下記の尺度に従って）評定してください．そして，あなたのイメージでどれくらい似ているかについて評定してください．辞書的な意味で類似性を評定しないでください．

**⑥　クラスター分析**<br/>
連想項目間の類似度の評定から得た類似度行列にウォード法でクラスター分析し，デンドログラムを析出します．クラスターというのは，類似のまとまりです．学習のために必要な意味構造化に関係があり，のちのディブリーフィングのために重要なステップです．
項目間の距離の分析も意味がありますが，PAC分析におけるデンドログラムは，参加者の体験の構造的意味を探るために活用されます．

**⑦　デンドログラムに基づく解釈**<br/>
この重要なステップでは，各クラスターの意味，クラスター間やクラスター内の関係性を説明するよう，参加者に求めます．そのため，参加者はいくつかの項目について詳しく説明してもらえます．多くの場合，参加者はステップ4での評価も説明します．このプロセス全体は，参加者の当該経験（ジレンマ）に対する全体的なイメージを探り，内省を助けるためのものです．もちろん，このステップでは，LARP主催者による質問やコメントが含まれることもあります．

**⑧　共同解釈**<br/>
続いて，主催者はデンドログラムの解釈を参加者とすぐに共有してもよいし，デブリーフィングプロセスの最後まで待ち，その時点で自分の考えを伝えても可能です．重要なのは，対話の中で解釈を行う場合，主催者は自分の解釈を参加者に押し付けたり，望ましい結論に導く「レールロード」は控えるべきだということです．目的は，解釈を共有することで，参加者から何らかの反応を得ることです．このプロセスには、両者の協力と相互作用が必要です．

プロセスの詳細や分析例については，下記の参考文献をご覧ください．<br/>
- Kamm, Björn-Ole. [2017](https://www.b-ok.de/download/Kamm_2017_TranslatingResearchIntoLarp.pdf). “Translating Research into Larp: Village, Shelter, Comfort.” In *LARP: Silberhochzeit. Aufsatzsammlung zum MittelPunkt 2017*, edited by Rafael Bienia and Gerke Schlickmann, 31–60. Braunschweig: Zauberfeder Verlag.<br/>
- Kamm, Björn-Ole. [2019](https://doi.org/10.1007/978-981-13-8039-6_36). “Experience Design for Understanding Social Withdrawal: Employing a Live-Action Role-Play (LARP) to Learn About and Empathize with Hikikomori in Japan.” In *Neo-Simulation and Gaming toward Active Learning*, edited by Ryoju Hamada, Songsri Soranastaporn, Hidehiko Kanegae, et al., 387–96. Singapore: Springer.<br/>
- カム ビョーン=オーレ. [2019](https://doi.org/10.32191/jjos.13.1_32). ｢ライブ・アクション・ロールプレイ(LARP)という意識向上を目的とした シリアス・ゲーミング方法:「ひきこもり」についての LARP を例に」『作業科学研究』 13巻1号，32–44頁.

## アプリの設定・使用方法
コードをダウンロードし，shiny serverにコピーしてください.<br/>
[app.R](app.R)で，メールサーバーのホスト名を自分の情報に置き換えて（ファシリテーターにメールを送信できるようにするため），SMTP認証情報を[.Renviron](.Renviron)ファイルに保存してください.<br/>
アプリのリンクを参加者に共有してください.

## 翻訳
現在，本アプリは英語，ドイツ語，日本語で利用可能です（[shiny.i18n](https://github.com/Appsilon/shiny.i18n)による言語切り替え機能もあります）．www-folderにあるtranslation.jsonを利用して，自由に翻訳を追加してください．<br/><br/>

## 著作権について
Copyright &copy; 2023, [Björn-Ole Kamm](https://www.b-ok.de)

reLarpはフリーソフトウェアです．Free Software Foundationによって発行されたGNU General Public Licenseのバージョン3，またはそれ以降のバージョンの条件のもとで，reLarpを再配布したり，変更することができます．

reLarpは有用であることを期待して配布されますが，いかなる保証もありません（商品性または特定目的への適合性の暗黙の保証もありません）．詳しくはGNU一般公衆利用許諾書をご覧ください．

reLarpと一緒にGNU一般公衆利用許諾書のコピーを受け取っているはずです．そうでない場合は，https://www.gnu.org/licenses/ を参照してください．

## 謝辞
本アプリ開発は，（[日本学術振興会](https://www.jsps.go.jp/english/)の助成付き）科研費プロジェクト｢[疑似共在性を用いての文化越境的学習：自分と違う文化と生活世界の実際体験方法](https://kaken.nii.ac.jp/en/grant/KAKENHI-PROJECT-19KT0028/)｣の一環です．
