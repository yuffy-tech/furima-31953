class ItemForm
    include ActiveModel::Model
    attr_accessor :hoge,:fuga...
  
  #空の投稿を保存できない
  validates :price, presence: true

    def save
      # 各テーブルにデータを保存する処理を書く
    end
  end