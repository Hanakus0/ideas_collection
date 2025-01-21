FactoryBot.define do
  # 適切な入力内容での投稿
  factory :post do
    association :user
    association :post_genre

    post_uid { SecureRandom.alphanumeric }
    title { "title" }
    content { "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!\"#$%&'()*+,-./:;<=>?@[\]^_`{|}~ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんゔゕゖァアィイゥウェエォオカガキギクグケゲコゴサザシジスズセゼソゾタダチヂッツヅテデトドナニヌネノハバパヒビピフブプヘベペホボポマミムメモャヤュユョヨラリルレロヮワヰヱヲンヴヵヶヷヸヹヺ｡｢｣､･ｦｧｨｩｪｫｬｭｮｯｰｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜﾝﾞﾟ０１２３４５６７８９ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ！＂＃＄％＆＇（）＊＋，－．／：；＜＝＞？＠［＼］＾＿｀｛｜｝～艸艹𣑴𦹧𣏖𦳬𦶆𣿥𣡶榢𦲸𤃲𦻒港蒑𤄼沶𦬂𦶔𣗦溪𣝅濏激𦺓荦𣏘𣳈槴𣎾𤁟𦿏𧅫𣺵蕱𣡺𦽦𣞊榼𦻷蒃菎𦿋杲𣓛𧅴蘰氹𣜑栤𣙽𧃟𣼣𦸩𦵩藘𦹥檚枭莪𦾫𣑪芄𤂱𣴣𣼕汀茅𣔝𣐗𣴯枽𧁾𣿮" }
    images { [] }
    draft_flg { 0 }
  end

  # 適切な投稿2
  factory :post2, class: Post do
    association :user
    association :post_genre

    post_uid { SecureRandom.alphanumeric }
    title { "タイトルだよ" }
    content { "コンテンツだよ" }
    images { [] }
    draft_flg { 0 }
  end

  # 適切な投稿3
  factory :post3, class: Post do
    association :user
    association :post_genre

    post_uid { SecureRandom.alphanumeric }
    title { "最も新しい投稿" }
    content { "最も新しい投稿" }
    images { [] }
    draft_flg { 0 }
  end

  # 適切な投稿 (下書き)
  factory :draft_post, class: Post do
    association :user
    association :post_genre

    post_uid { SecureRandom.alphanumeric }
    title { "下書きの投稿" }
    content { "下書きの投稿ですよ" }
    images { [] }
    draft_flg { 1 }
  end

  # タイトルが無い不適切な入力内容での投稿
  factory :no_title_post, class: Post do
    association :user
    association :post_genre

    post_uid { SecureRandom.alphanumeric }
    title { "" }
    content { "no_title_post" }
    images { [] }
    draft_flg { 0 }
  end

  # 本文が無い不適切な入力内容での投稿
  factory :no_content_post, class: Post do
    association :user
    association :post_genre

    post_uid { SecureRandom.alphanumeric }
    title { "no_content_post" }
    content { "" }
    images { [] }
    draft_flg { 0 }
  end
end
