# jushoFujiChanger
- atena26からは姓、名、敬称、連名、連名敬称、自宅〒、自宅住所1、自宅住所2、自宅住所3形式で UTF8 CSVで書き出したものをキタムラ宛名形式に変更（ただしUTF8)
- swift　+　visual studio codeで作成されました

#使用例
- ./jushoChanger jusho26-utf8.csv >jusho26x.csv     # UTF8を読み込み
- nkf -sLw jushoFuji.csv > jushoSJIS.csv            # SJIS+CRLFで書き出し  nkfは brew install nkfでインストールしてね
