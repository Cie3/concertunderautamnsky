[if exp="!testplay"]
	[jump target="*23面談" cond="f.日==23"]
	[jump target="*22アドバイス" cond="f.日==22"]
[endif]

[場面転換]
[if exp=f.昼休み]
	[背景 画像=廊下]
	[BGM 曲=05日常.ogg 音量=50 ループ]
[else]
	[背景 画像=廊下夕方]
	[BGM 曲=夕暮れ.ogg 音量=50 ループ]
[endif]
[枠]
[表情 画像=前原先生]

[macro name=前原先生なにしてる]
[nowait]
[if exp=f.昼休み]前原先生が職員室に戻るところだ。[else]前原先生がプリントを印刷している。[endif]
[endnowait]
[endmacro]

[eval exp="var 種がある = 0;"]
*種開始

*前原先生はテニス部顧問
[足跡デバッグ 名前=前原先生はテニス部顧問]
[jump target="*前原先生はテニス部顧問2" cond="!足跡('前原先生はテニス部顧問') || 足跡('女子テニス部員の不満')"]
[eval exp="種がある = 1" cond="findSeed('前原先生はテニス部顧問') >= 0"]
[前原先生なにしてる]
[種分岐 ア=前原先生はテニス部顧問 イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*前原先生はテニス部顧問2"][endif]
*本文
よし、前原先生に貫井さんの悩みについて[n]
何か知っているか聞いてみよう。[next]
[モノローグ終了]

[自分]
あの、前原先生……[next]
[人物消去]
[表情左 画像= 前原先生]
[人物右 画像= 女子生徒ア  名前= 女子生徒]
すいません！[n]
マリ、先生のところに来ましたか？[next]

[人物左 画像= 前原先生しゃべる 名前=前原先生]
いや……来ていないが。[next]
[表情左 画像= 前原先生]

[人物右 画像= 女子生徒ア  名前= 女子生徒]
じゃあ、また忘れてるんだ……[next]

[人物左 画像= 前原先生しゃべる 名前=前原先生]
もしかしてグラウンド利用願いの書類のことかい？[next]
[表情左 画像= 前原先生]

[人物右 画像= 女子生徒ア  名前= 女子生徒]
そうです！[n]
明日までに顧問の先生の判子をもらって提出しないと[n]
いけないのに……[next]

[人物左 画像= 前原先生しゃべる 名前=前原先生]
そうか……今日の放課後は国語科研究室にいるから[n]
早めに来るように貫井に伝えてくれるか？[next]
[表情左 画像= 前原先生]

[人物右 画像= 女子生徒ア  名前= 女子生徒]
わかりました！[next]

[人物全消去]
[人物 画像= 前原先生しゃべる 名前=前原先生]
すまなかったね、[姓]。[n]
それで話は何かな？[next]
[表情 画像= 前原先生]

[自分]
あの、今のって貫井さんの話、ですよね……？[n]
貫井さんが何かしたんですか？[next]

[人物 画像= 前原先生しゃべる  名前= 前原先生]
どうやら部長として提出する書類を忘れているみたいでね。[n]
これまでにも何度かそんなことがあったんだ。[next]
[表情 画像= 前原先生目閉じ]
私からも少し注意することもあるんだけど[n]
貫井は部長としての責任感が強いから[n]
あまり強く言うと傷つけてしまいそうでね……[next]
[表情 画像= 前原先生]

[自分]
あんなに一生懸命なのに書類を忘れるなんて[n]
イメージが湧かないんですけど……[next]

[人物 画像=  前原先生しゃべる 名前= 前原先生]
テニス部員たちが求めている部長と[n]
貫井が努力してなろうとしているものが違うことが[n]
問題なんだろうなぁ。[next]

部員達は物事をはっきり決断してくれることを[n]
貫井に期待している。[next]

さっきのグラウンド利用願いの書類も[n]
部長が翌月の練習日を決めて、[n]
グラウンドを使いたいという希望を出すものなんだ。[next]
[表情 画像= 前原先生目閉じ]
おそらく貫井は練習日をどこにするか自分で決められずに[n]
迷っているうちに日にちが過ぎてしまったんだろう。[next]

でも、貫井は、部員に不満があることはわかっているんだけど[n]
それをテニスが上手くなれば解決されると思っている。[next]

[自分]
だからあんなに頑張ってるのにうまくいかないんだ……[next]

[人物 画像= 前原先生しゃべる  名前= 前原先生]
おそらく今日の放課後、判子をもらいに来るだろうから[n]
少し話をしてみようとは思っているよ。[next]
[表情 画像= 前原先生目閉じ]
でも、いつも注意した次の週に部活を見に行くと[n]
練習量を増やしていてね……[n]
そういうことじゃ、ないんだよなぁ。[next]
[表情 画像= 前原先生]

[モノローグ]
貫井さんが困っている理由がわかった気がする。[n]
もしかしたら悩みを解決できるかもしれない。[next]
[モノローグ終了]

[自分]
俺、ちょっと貫井さんと話をしたいと思います。[next]

[人物 画像= 前原先生しゃべる  名前= 前原先生]
そうか、ありがとう。[next]

それで[姓]、君の話はもういいのかい？[next]
[表情 画像= 前原先生]

[自分]
はい、大丈夫です、失礼します。[next]

[人物 画像= 前原先生  名前= 前原先生]
そうか、じゃあまた何かあったらおいで。[next]

[人物消去]


[種入手 名前=女子テニス部員の不満 詳細=女子テニス部員たちはマリの決断力の無さに不満なようだ]
[足跡 名前=女子テニス部員の不満]
[モノローグ]
貫井さんがどうして部活でうまくいかないのか分かったけど[n]
どうやって伝えたらいいだろう……[next]
[モノローグ終了]

[return]
*前原先生はテニス部顧問2

*前原先生のアドバイス１
[足跡デバッグ 名前=前原先生のアドバイス１]
[jump target="*前原先生のアドバイス１x" cond="!足跡('前原先生のアドバイス１') || 足跡('前原先生のアドバイス２')"]
[eval exp="種がある = 1" cond="findSeed('前原先生のアドバイス１') >= 0"]
[前原先生なにしてる]
[種分岐 ア=前原先生のアドバイス１ イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*前原先生のアドバイス１x"][endif]
*本文
[モノローグ終了]
[自分]
この前、先生の言っていた[n]
「文化祭準備の招集と参加」についてですが……[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
ああ、そうか。[n]
じゃあ、説明しようか。[next]

君が実行委員になってから、３人で少し準備をしたと思うんだが、[n]
どうも進みが遅い気がしないか？[next]
[表情 画像=前原先生]

[自分]
そうですね……[n]
普通に頑張っても 5％ くらいしか進まないし、[n]
当日までに間に合うのか、って感じです。[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
文化祭準備が取れる時間は、当日までに[n]
全部で [font color=&色：強化]13回[resetfont] しかない。[next]
[表情 画像=前原先生目閉じ]
単純に考えて、5％×13回で 65％ という計算になるよな。[n]
誰かの手を借りないと、絶対に間に合うわけがないんだ。[next]

[自分]
なるほど、それで招集する必要があるんですね。[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
その日だけお願いして、ちょっと手伝ってもらうこともできるけどね、[n]
できれば、きちんと参加してもらった方がいいよ。[next]

参加している人は、急に集められた人と比べて[n]
[font color=&色：強化]２倍以上[resetfont] ガンガン作業ができるからね。[next]
[表情 画像=前原先生目閉じ]
一生懸命おねがいして参加してもらっても[n]
正直割に合わない人、っていうのもいるかもしれないけどね……[n]
まあ、そのあたりは、君の好みの問題だなあ。[next]
[人物 画像=前原先生しゃべる 名前=前原先生]
と、今回のアドバイスはこれくらいにしよう。[n]
次に来た時は、道を間違えた時の対処についてでも話そうか。[next]
[表情 画像=前原先生]

[自分]
ありがとうございました。[next]

[種入手 名前=前原先生のアドバイス２ 詳細=道を間違えた時の対処について教えてくれるらしい 期限=20]
[足跡 名前=前原先生のアドバイス２]
[return]
*前原先生のアドバイス１x

*前原先生のアドバイス２
[足跡デバッグ 名前=前原先生のアドバイス２]
[jump target="*前原先生のアドバイス２x" cond="!足跡('前原先生のアドバイス２') || 足跡('前原先生のアドバイス３')"]
[eval exp="種がある = 1" cond="findSeed('前原先生のアドバイス２') >= 0"]
[前原先生なにしてる]
[種分岐 ア=前原先生のアドバイス２ イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*前原先生のアドバイス２x"][endif]
*本文
[モノローグ終了]
[自分]
この前、先生の言っていた[n]
「道を間違えた時の対処」についてですが……[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
ああ、そうか。[n]
じゃあ、説明しようか。[next]

人と関われば関わるほど、人生の糧になるし、喜びもたくさんある。[next]
[表情 画像=前原先生目閉じ]
しかし、うまくいかず、傷つき、傷つけてしまうことも増えるだろう。[next]
[表情 画像=前原先生]

[自分]
はい。[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
「ああ間違えてしまった、出来ることならやり直したい」[n]
そう思ってしまうこともあるかもしれないけどね……[next]
[表情 画像=前原先生目閉じ]
間違えてしまった選択にだって、[n]
きちんと意味があるんだってこと、忘れないでほしい。[next]

その苦しみも、きっと明日への布石だと信じて[n]
毎日を生きてもらいたいと私は願っているよ、[姓]。[next]
[表情 画像=前原先生しゃべる]
いやなことがあれば、次の日には、いいことがある。[next]
[表情 画像=前原先生]

[自分]
……道を間違っても、やり直すなってことですか？[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
ああ、いや、[n]
「意味もなく体力を無駄づかいしてしまった……」[n]
そんなときは、遠慮せずに、左下のボタンを押しなさい。[next]
[表情 画像=前原先生目閉じ]
あとは、大切な決断をする前には、きちんと [font color=&色：強化]記録[resetfont] をとっておくこと。[next]
[表情 画像=前原先生しゃべる]
[姓]の頑張りを見てくれていた誰かが（そう、あなたが）[n]
きっと役立ててくれるだろう。[next]
[表情 画像=前原先生]

[自分]
先生、どこを見てしゃべっているんですか

[人物 画像=前原先生しゃべる 名前=前原先生]
おっと、話が長くなってしまったね。[n]
次に来たときは、年甲斐もなく、恋愛のアドバイスでもしようか。[next]
[表情 画像=前原先生]

[自分]
恋愛……ですか……？[n]
ありがとうございました。[next]

[種入手 名前=前原先生のアドバイス３ 詳細=恋愛について教えてくれるらしい 期限=20]
[足跡 名前=前原先生のアドバイス３]
[return]
*前原先生のアドバイス２x

*前原先生のアドバイス３
[足跡デバッグ 名前=前原先生のアドバイス３]
[jump target="*前原先生のアドバイス３x" cond="!足跡('前原先生のアドバイス３') || 足跡('前原先生のアドバイス４')"]
[eval exp="種がある = 1" cond="findSeed('前原先生のアドバイス３') >= 0"]
[前原先生なにしてる]
[種分岐 ア=前原先生のアドバイス３ イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*前原先生のアドバイス３x"][endif]
*本文
[モノローグ終了]
[自分]
この前、先生の言っていた[n]
「恋愛のこと」についてですが……[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
ああ、そうか。[n]
じゃあ、説明しようか。[next]

私の見たところ、[姓]に思いを寄せる可能性のある女の子は[n]
たった２人しかいない。[next]
[表情 画像=前原先生]

[自分]
いや、２人もいれば十分じゃないですか！？[next]

[人物 画像=前原先生目閉じ 名前=前原先生]
それが……この学校には欲張りがいるもので、[n]
「せめて６人くらいは」とか「男の子もほしい」とか[n]
そういう声を聞くこともあるから、念のためにな……[next]
[表情 画像=前原先生しゃべる]
ところで[姓]、[n]
女の子から好かれるには、どうすればいいと思う？[next]
[表情 画像=前原先生]

[自分]
え、急にそんなこと言われても……[n]
一緒にいる時間が長いほうがいいとか、ですか？[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
なかなか良い線をついているね。[next]

できれば、放課後は一緒にいられるように[n]
自分の予定をチェックしておくといい。[next]
[表情 画像=前原先生目閉じ]
そして、かなり大切なことだが……[next]
[表情 画像=前原先生しゃべる]
一緒にいる時間を、決して無駄にはしないことだよ。[next]
[表情 画像=前原先生]

[自分]
「決して」って、そんなにシビアなんですか？[next]

[人物 画像=前原先生目閉じ 名前=前原先生]
考えてもみなさい。[next]
[表情 画像=前原先生しゃべる]
君のような、クラスとのつながりが希薄な一般生徒が[n]
文化祭までのたった２ヵ月で、女の子の心を射抜くために[n]
無駄にできる時間なんて、あるわけないだろう。[next]
[表情 画像=前原先生]

[自分]
ひょっとして、この時間も……無駄なんですか？[next]

というか、もう無理なんですか？[next]

[人物 画像=前原先生目閉じ 名前=前原先生]
３回も私の所に足を運んだということは、かなり厳しいだろう……[next]
[表情 画像=前原先生しゃべる]
実は２人とも無理じゃないんだけどね。[next]

女の子を本気で追いかけるなら[n]
悲しいことだが、文化祭をあきらめる覚悟が必要だろう。[next]
[表情 画像=前原先生目閉じ]
そこまでして、得る価値のある経験なのか[n]
よく考えてみるといいかもしれないね、[姓]。[next]
[表情 画像=前原先生]

[自分]
覚悟はしても、あきらめる必要はないと思います。[n]
俺は、うまくやってみせます。[next]

[人物 画像=前原先生目閉じ 名前=前原先生]
……うん、そうか。[n]
それでいい。[next]
[表情 画像=前原先生しゃべる]
次で最後にしようか。[n]
私の知っていることを、もうちょっとだけ話そう……[next]

[種入手 名前=前原先生のアドバイス４ 詳細=一体何を教えてくれるのだろう…… 期限=20]
[足跡 名前=前原先生のアドバイス４]
[return]
*前原先生のアドバイス３x

*前原先生のアドバイス４
[足跡デバッグ 名前=前原先生のアドバイス４]
[jump target="*前原先生のアドバイス４x" cond="!足跡('前原先生のアドバイス４') || 足跡('前原先生のアドバイス終')"]
[eval exp="種がある = 1" cond="findSeed('前原先生のアドバイス４') >= 0"]
[前原先生なにしてる]
[種分岐 ア=前原先生のアドバイス４ イ=何か他の話題は…… 体力=&シナリオ消費]
[if exp=イ][jump target="*前原先生のアドバイス４x"][endif]
*本文
[モノローグ終了]
[自分]
この前、言っていた[n]
「先生の知っていること」についてですが……[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
ああ、そうか。[n]
じゃあ、説明しようか。[next]
[表情 画像=前原先生目閉じ]
まずは、勉強と成績について話そう。[next]
[表情 画像=前原先生しゃべる]
[姓]は赤点に怯える毎日を過ごしてないかな？[n]
自分の成績がいまどれくらいなのか、いつ試験が来るのか……と。[next]
[表情 画像=前原先生]

[自分]
たしかに、家で試験勉強すれば点数は分かりますけど[n]
正直、帰ったら早く寝たいですね……[next]

勉強しないとどんどん成績が落ちてるような気がするのは[n]
気のせいではないんですよね……？[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
そう、勉強しなければどんどん成績は落ちるんだよ。[n]
しかし本当は「１日ごとに点数は [font color=&色：強化][emb exp="-睡眠学力低下"]点[resetfont] 下がる」これが正しい。[next]
[表情 画像=前原先生目閉じ]
試験はたいていは６日後にやってくるから、[n]
勉強しなかったら、次の試験では [font color=&色：強化][emb exp="睡眠学力低下 * -6"]点[resetfont] 下がっているわけだな。[next]
[表情 画像=前原先生しゃべる]
授業で頑張ると [font color=&色：強化][emb exp="授業２上昇"]点[resetfont] の上昇、[n]
適当に聞き流すと [font color=&色：強化][emb exp="授業１上昇割合"]％[resetfont] の上昇だ。[next]

[emb exp="授業１上昇割合"]％ ということは、いま、[姓]の成績が [emb exp="f.学力"]点 だから[n]
次の授業で適当に聞き流すと [emb exp="(int)(授業１上昇割合 * f.学力 / 100)"]点 上がるんだ。[next]
[表情 画像=前原先生]

[自分]
今さりげなく、大事なこと言いましたよね。[n]
というか、なんでそんなに詳しいんですか？[n]
おかしくないですか？[next]

[表情 画像=前原先生目閉じ]
伊達に教師を４０年やってるわけじゃないんだ。[next]
[表情 画像=前原先生しゃべる]
そうだ、この前も話したけど、体力について補足しよう。[next]

体力は全部使い切った場合 30％ 回復するけど、[n]
50％ 残していても、たったの 15％ しか回復しない。[n]
できるだけその日のうちに使い切った方が得なんだね。[next]
[表情 画像=前原先生]

[自分]
確かに、貯めても貯めても貯まらない気がしていました。[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
それと、生命力を削ると、実はその分だけ回復量が減るんだよ。[n]
ひどいときは本来よりも 8％ くらい減ってしまうこともある。[next]

できるだけ生命力を削らないように注意しないといけない……が[n]
実は、いくつか例外がある。[next]
[表情 画像=前原先生]

[自分]
例外というと……文化祭直前の追込みですか？[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
そう。[n]
文化祭の後のことはどうでもいいから、[n]
最後に体力を使い切ってしまおう、という戦略だ。[next]
[表情 画像=前原先生目閉じ]
教師としては、この手の努力のしかたは[n]
決して勧められるものではないのだけどね……[next]
[表情 画像=前原先生しゃべる]
それともう一つ、教えようか迷ったが……[next]

[BGM停止 時間=3000]
[自分]
え？ そこまで言ったら教えてくださいよ。[next]

[人物 画像=前原先生目閉じ 名前=前原先生]
キーワードは……[next]

[自分]
キーワードは……？[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
[SE 音=しみわたる 音量=80]
「プラナリア」[n]
これ以上は言わない。[next]
[表情 画像=前原先生]

[自分]
あ、はい。[next]

[人物 画像=前原先生目閉じ 名前=前原先生]
プラナリアの再生力が一体どこに由来しているのか[n]
現代の科学で解明されているわけじゃない。[next]

あの、ゾッとする程の活力を秘めた液体の裏側で、[n]
何か不吉な代償が支払われていなければ良いのだが……[next]

[自分]
不吉な代償……[n]
そんなこと、本当にあるんですかね……[next]

[人物 画像=前原先生しゃべる 名前=前原先生]
さて、私の話はこれくらいにしよう。[n]
随分と長話になってしまったからね。[next]

最後に、話を聞いてくれた褒美に……[next]
[表情 画像=前原先生目閉じ]
いや、帰ってからのお楽しみだ。[next]
[if exp="f.学力 < 75"][eval exp="f.成績チート = 1"][endif]
[eval exp="f.学力 = 95"]
[eval exp="f.試験の点数 = Math.max(f.試験の点数, 95)"]
[足跡 名前=前原先生のアドバイス終]
[実績解除 名前=実績１８：前原先生？]
[return]
*前原先生のアドバイス４x

*雑談
[eval exp="var 他の話題 = 種がある ? '何か他の話題は……' : ''"]
[前原先生なにしてる]
[三択 ア=雑談する イ=&他の話題]
[if exp=イ]
	[jump target="*雑談2"]
[endif]
;------------------------------雑談始まり
[モノローグ終了]
[人物 画像=前原先生しゃべる 名前=前原先生]
ん？ [姓]、何か用かな。[next]
[表情 画像=前原先生]
[自分]
いや、特に用というわけじゃないんですけど……[next]

先生は、来年どうするんですか？[next]
[人物 画像=前原先生しゃべる 名前=前原先生]
来年はどうもしないよ。[n]
……えっと、定年の話をしてるのかな？[next]
[自分]
あ、はい。[next]
[表情 画像=前原先生目閉じ]
安心しなさい。私は君たちと一緒に卒業する。[n]
来年はまだここで担任をしているよ。[next]
[表情 画像=前原先生]
[自分]
え、そうだったんですか。[n]
てっきり今年で定年だと思ってました。[next]
[人物 画像=前原先生しゃべる 名前=前原先生]
まあ、定年とは言っても、担任を持たなくなるだけで[n]
国語の授業はしばらくは続けるだろうね……[next]

人生は何かを成す為には短い、というのは、[n]
ローマ帝国、人生30年の時代の格言ではあるけれど……[next]
[表情 画像=前原先生目閉じ]
私が80歳まで、あと20年もの間生きられるとして、[n]
一体何人の若者が巣立つのを目にできるのかと考えると……[next]

望みがある限りは、人生を長いと感じることは無いのだろうな。[next]
[表情 画像=前原先生]
[自分]
は、はあ……[next]
[人物 画像=前原先生しゃべる 名前=前原先生]
まあ、君は若いから今ひとつピンと来ないかもしれないけど、[n]
何かを成し遂げようと苦労しているうちに、今の生活なんて[n]
あっという間に終わってしまうものだよ。[next]

……でも、あっという間に終わるような、[n]
目的と望みをもった高校生活を送れたら、[n]
それは幸せな事なんじゃないかな、[姓]。[next]
[表情 画像=前原先生]
[モノローグ]
俺はあと [emb exp="f.日"]日で、一体何を成し遂げられるんだろう。[next]
[モノローグ終了]
;------------------------------雑談終了
[return]
*雑談2

[jump target="*種開始"]

*23面談

[枠]
;[枠]……セリフ枠を出す
[モノローグ]
;[自分]……自分のセリフを書くとき
学期はじめのいつもの面談だ。[n]
特に成績が悪いわけでもないし、問題を起こした覚えもない。[n]
すぐに終わるだろうな。[next]
;[n]……改行、[next]……改ページ
[モノローグ終了]
[自分]
失礼しまーす。[next]

[背景 画像=本棚]
[人物 画像= 前原先生しゃべる  名前= 担任の前原]
;[人物 画像= A  名前= B]画像として「A.png」を使用、名前欄に「B」を表示
お、[姓]だな、入ってくれ。[next]

[表情 画像= 前原先生]
まずは成績だが……まあ、概ね問題ないだろう。[n]
少し物理が芳しくないみたいだが、[n]
一つぐらい誰だって苦手な科目はあるよな。[next]

[自分]
そうですね……頑張ります、はい。[next]

[人物 画像= 前原先生目閉じ  名前= 前原先生]
あとは……少し気になっていることがあるんだが……[next]
[表情 画像= 前原先生]

[自分]
なんですか？[next]

[人物 画像= 前原先生  名前= 担任の前原]
[姓]、きみは休み時間[n]
ずっと隣のクラスで過ごしているみたいだね。[next]
;全角３０文字までしか入りません

[自分]
ああ、そうですね……仲の良い友達がいるので。[next]

[人物 画像= 前原先生目閉じ  名前= 担任の前原]
必ずしもクラスメイトと、とても仲良くなる必要はないよ。[n]
大切な友達がいるのならそれでいい。[n]
でもクラスでの関係も私は大切にしてほしいんだ。[next]
[表情 画像= 前原先生]

[自分]
はあ……[next]

[人物 画像= 前原先生しゃべる  名前= 担任の前原]
そう言われても、もう一学期過ごしてしまったし[n]
今さらどうしたら、と思うよな。[next]
[人物 画像= 前原先生  名前= 担任の前原]

[自分]
……まあ、そうですね。[next]

[人物 画像= 前原先生しゃべる  名前= 担任の前原]
明日のＨＲ、文化祭のクラス出し物とクラス実行委員を決める。[n]
そこで実行委員に立候補してみないか？[next]
[表情 画像= 前原先生]

[自分]
えっ！ 俺ですか！？ 俺、全然クラスにいないし、[n]
そのことはさっきも先生が言ったじゃないですか。[next]

[人物 画像= 前原先生目閉じ  名前= 担任の前原]
いやぁ、実は実行委員のことはなんとなく[n]
個人面談でみんなに聞いているんだが[n]
積極的にやりたい、という人が少なくてね……[next]

[表情 画像= 前原先生しゃべる]
勿論、本当にやりたくないならやらなくていいんだ。[n]
文化祭実行委員というきっかけもあるから、[n]
ということだけ伝えておきたかっただけだよ。[next]
[表情 画像= 前原先生  名前= 担任の前原]

[無限種入手  名前= 俺が立候補！？ 詳細= 前原先生に文化祭のクラス委員に立候補しないかって言われたけど…… 期限= 1]
;[モノローグ]……システムメッセージを表示するときに暗転する
;[モノローグ終了]……暗転から戻る

[return]


*22アドバイス

[枠]
[人物 画像=前原先生しゃべる 名前=担任の前原]
お、[姓]じゃないか。ちょうどいいところに来てくれたね。[next]

面談の時に話し忘れたんだが、[n]
「疲れと回復」のことについてちょっとした話があるんだ。[next]
[表情 画像=前原先生]

[自分]
疲れと回復、ですか……はい。[next]

[人物 画像=前原先生目閉じ 名前=担任の前原]
二学期も色々と忙しいだろうから気を付けてほしいんだが……[next]

[人物 画像=前原先生 名前=担任の前原]
自分の体力と相談すること、これが大切だ。[n]
限界を超えて頑張りすぎてしまうと[n]
夜にしっかり休んでも回復できないことがある。[next]

[人物 画像=前原先生しゃべる 名前=担任の前原]
かといって、ずっと休んでいればどんどん元気になる[n]
……なんてことはない。[n]
頑張らなかった分の体力は捨てているみたいなもんだな。[next]

[表情 画像=前原先生目閉じ]
疲れすぎても元気すぎても回復は遅い。[n]
何事も、中庸が大事というわけだ。[next]
[表情 画像=前原先生]

[自分]
ちょうどよく頑張るといい、ってことですね。[next]

[人物 画像=前原先生しゃべる 名前=担任の前原]
まあ、そういうことだ。[n]
最近疲れやすくなったな、と思ったら[n]
[font color="&色：強化"]休日に準備をしないで休む[resetfont]、というのもひとつの選択だよ。[next]

なにか困ったことがあったら、また相談しにきなさい。[next]

次に来た時は、文化祭準備の招集と参加についてでも話そうか。[next]
[種入手 名前=前原先生のアドバイス１ 詳細=文化祭準備の招集と参加について教えてくれるらしい 期限=20]
[足跡 名前=前原先生のアドバイス１]
[人物消去]
[枠消去]

[return]

