// jushoFujiChanger.swift

// 宛名職人V26からは
// 姓、名、敬称、連名、連名敬称、自宅〒、自宅住所1、自宅住所2、自宅住所3形式で UTF8 CSVで書き出す

// ./jushoChanger jusho26-utf8.csv >jusho26x.csv
// nkf -sLw jushoFuji.csv > jushoSJIS.csv
// jushoSJIS.csvをキタムラＨＰ https://netservice.fujifilm.jp/postcard/kitamura/photo/letters/ から入って「住所マスタ作成」から「宛名データを取り込む」を選ぶ

import Cocoa

let args = CommandLine.arguments.dropFirst()

guard let file = args.first, !file.isEmpty else
{
    print("ERROR: please input filename")
    exit(1)
}

let fileName: String = "./" + file
// print("filename: \(fileName)")
print("宛名区分,郵便番号,住所1,住所2,住所3,姓1,名1,敬称1,姓2,名2,敬称2,姓3,名3,敬称3,姓4,名4,敬称4,姓5,名5,敬称5,姓6,名6,敬称6,会社名,部署1,部署2,役職,御中,印刷フラグ,グループ名")

// 姓、名、敬称、連名、連名敬称、自宅〒、自宅住所1、自宅住所2、自宅住所3形式で UTF8 CSVで書き出されている (SJISではうまくいかなかったため)

if let text = try? String(contentsOfFile: fileName, encoding: String.Encoding.utf8)
{
    text.enumerateLines { (line, stop) in
        let item = line.components(separatedBy: ",")
        var sub = item[3].components(separatedBy: "/")          // 連名
        sub.append("")  // 連名がないときに備えて４個ほど""アイテムを追加
        sub.append("")
        sub.append("")
        sub.append("")
        
        var subkei = item[4].components(separatedBy: "/")       // 連名敬称
        subkei.append("")   // 連名がないときに備えて４個ほど""アイテムを追加
        subkei.append("")
        subkei.append("")
        subkei.append("")
        print("個人,\(item[5]),\(item[6]),\(item[7]),\(item[8]),\(item[0]),\(item[1]),\(item[2]),,\(sub[0]),\(subkei[0]),,\(sub[1]),\(subkei[1]),,\(sub[2]),\(subkei[2]),,\(sub[3]),\(subkei[3]),,,,,,,,,,")
    }
}

exit(0)
