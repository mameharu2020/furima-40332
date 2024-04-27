class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー' },
    { id: 5, name: 'キッズ' },
    { id: 6, name: '住まい' },
    { id: 7, name: '小物' },
    { id: 8, name: '本' },
    { id: 9, name: '音楽' },
    { id: 10, name: 'ゲーム' },
    { id: 11, name: 'おもちゃ' },
    { id: 12, name: 'ホビー' },
    { id: 13, name: 'グッズ' },
    { id: 14, name: '家電' },
    { id: 15, name: 'スマホ' },
    { id: 16, name: 'カメラ' },
    { id: 17, name: 'スポーツ' },
    { id: 18, name: 'レジャー' },
    { id: 19, name: 'ハンドメイド' },
    { id: 20, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
