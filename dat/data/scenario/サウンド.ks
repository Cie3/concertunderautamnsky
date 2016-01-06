[bgmopt gvolume=80]

[macro name=文化祭準備の曲]
[if exp="f.進捗 < 20"]
[BGM 曲=文化祭準備01.ogg 音量=60]
[elsif exp="f.進捗 < 40"]
[BGM 曲=文化祭準備04.ogg 音量=60]
[elsif exp="f.進捗 < 70"]
[BGM 曲=文化祭準備05.ogg 音量=60]
[elsif exp="f.進捗 < 100"]
[BGM 曲=文化祭準備06.ogg 音量=60]
[else]
[BGM 曲=文化祭準備07.ogg 音量=60]
[endif]
[endmacro]


[macro name=カラス.ogg]
[SE 音=カラス.ogg 音量=50 buf=2]
[endmacro]

[macro name=ぺらり.ogg]
[SE 音=ぺらり.ogg 音量=50 buf=2]
[endmacro]

[macro name=選択肢.ogg]
[SE 音=選択肢.ogg 音量=60 buf=2]
[endmacro]

[macro name=選択.ogg]
[SE 音=選択.ogg 音量=50 buf=1]
[endmacro]

[macro name=クリア.ogg]
[SE 音=クリア.ogg 音量="&50"]
[endmacro]

[macro name=手に入れた.ogg]
[SE 音=手に入れた.ogg 音量=45 buf=1]
[endmacro]

[macro name=倒れる音.ogg]
[SE 音=倒れる音.ogg 音量="&50 + (int)mp.音量" buf=2]
[endmacro]

[macro name=チュンチュン.ogg]
[SE 音=チュンチュン.ogg ループ=0 音量=50]
[endmacro]

[macro name=ガーン.ogg]
[SE 音=ガーン.ogg 音量=50 buf=2]
[endmacro]

[macro name=チャイム.ogg]
[SE 音=チャイムR.ogg buf=2 音量=40]
[endmacro]

[macro name=チャイム２.ogg]
[SE 音=チャイム2R.ogg buf=2 音量=40]
[endmacro]

[macro name=しみわたる.ogg]
[SE 音=しみわたる.ogg 音量=80]
[endmacro]

[macro name=キラキラリ.ogg]
[SE 音=キラキラリ.ogg 音量=80]
[endmacro]



[macro name=いい話だなあ.ogg]
[BGM ループ 曲=いい話だなあ.ogg 音量="&70 + (int)mp.音量"]
[endmacro]

[macro name=空虚.ogg]
[BGM 曲=空虚.ogg ループ=0 音量="&50 + (int)mp.音量"]
[endmacro]

[macro name=希望.ogg]
[BGM 曲=希望.ogg ループ=0 音量="&60 + (int)mp.音量"]
[endmacro]

[macro name=タイトル.ogg]
[BGM 曲=タイトル.ogg ループ=0 音量="&65 + (int)mp.音量"]
[endmacro]

[macro name=操作説明.ogg]
[BGM 曲=操作説明.ogg 音量="&50"]
[endmacro]

[macro name=やらかした.ogg]
[BGM 曲=やらかした.ogg 音量=50]
[endmacro]

[macro name=平穏.ogg]
[BGM 曲=平穏.ogg 音量=70]
[endmacro]

[macro name=日常.ogg]
[BGM 曲=日常.ogg 音量=55]
[endmacro]

[macro name=お気楽.ogg]
[BGM 曲=お気楽.ogg 音量=55]
[endmacro]

[macro name=恋愛.ogg]
[BGM 曲=恋愛.ogg ループ=0 音量=55]
[endmacro]

[macro name=喧嘩.ogg]
[BGM 曲=喧嘩.ogg 音量=70]
[endmacro]

[macro name=ゲームオーバー.ogg]
[BGM 曲=ゲームオーバー.ogg ループ=0 音量=55]
[endmacro]

[macro name=圧倒的進捗.ogg]
[BGM 曲=圧倒的進捗 音量=60]
[endmacro]

[macro name=文化祭発表.ogg]
[BGM 曲=文化祭発表.ogg 音量=75]
[endmacro]

[macro name=悲しみ.ogg]
[BGM 曲=悲しみ.ogg 音量=60]
[endmacro]

[macro name=夕暮れ.ogg]
[BGM 曲=夕暮れ.ogg 音量=55]
[endmacro]

[macro name=自宅朝.ogg]
[BGM 曲=自宅朝.ogg 音量=55]
[endmacro]

[macro name=自宅夜.ogg]
[BGM 曲=自宅夜.ogg 音量=70]
[endmacro]

[macro name=破局.ogg]
[BGM 曲=破局.ogg 音量=55]
[endmacro]

[macro name=破局後.ogg]
[BGM 曲=破局後.ogg ループ=0 音量=55]
[endmacro]

[macro name=眠れ.ogg]
[BGM 曲=眠れ.ogg ループ=0 音量=50]
[endmacro]

[macro name=ワクワク.ogg]
[BGM 曲=ワクワク.ogg 音量=60]
[endmacro]

[macro name=悔い改めよ.ogg]
[BGM 曲=悔い改めよ.ogg ループ=0 音量=55]
[endmacro]

[macro name=狂気の教室.ogg]
[BGM 曲=狂気の教室.ogg 音量=55]
[endmacro]

[macro name=カズキ.ogg]
[BGM 曲=カズキ.ogg 音量=55 ループ=0]
[endmacro]

[macro name=怒り.ogg]
[BGM 曲=怒り.ogg 音量=65]
[endmacro]

[macro name=憂鬱.ogg]
[BGM 曲=憂鬱.ogg 音量=55]
[endmacro]

;[jump target="*サウンドテストx"]
[jump target="*サウンドテストx"]

*サウンドテスト
[日常.ogg]
[wait time=5000]
[自宅朝.ogg]
[wait time=5000]
[悲しみ.ogg]
[wait time=5000]
[いい話だなあ.ogg]
[wait time=5000]
[ワクワク.ogg]
[wait time=5000]
[カズキ.ogg]
[wait time=5000]
[ゲームオーバー.ogg]
[wait time=5000]
[悔い改めよ.ogg]
[wait time=5000]
[タイトル.ogg]
[wait time=5000]
[やらかした.ogg]
[wait time=5000]
[狂気の教室.ogg]
[wait time=5000]
[空虚.ogg]
[wait time=5000]
[希望.ogg]
[wait time=5000]
[喧嘩.ogg]
[wait time=5000]
[自宅夜.ogg]
[wait time=5000]
[操作説明.ogg]
[wait time=5000]
[怒り.ogg]
[wait time=5000]
[お気楽.ogg]
[wait time=5000]
[破局.ogg]
[wait time=5000]
[破局後.ogg]
[wait time=5000]
[文化祭準備の曲]
[wait time=5000]
[平穏.ogg]
[wait time=5000]
[圧倒的進捗.ogg]
[wait time=5000]
[文化祭発表.ogg]
[wait time=5000]
[眠れ.ogg]
[wait time=5000]
[憂鬱.ogg]1
[wait time=5000]
[夕暮れ.ogg]
[wait time=5000]
[恋愛.ogg]
[wait time=5000]

*サウンドテストx
[return]
