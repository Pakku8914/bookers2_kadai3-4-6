class Relationship < ApplicationRecord
  # class_name: "User"でUserモデルを参照
  # belongs_to :user　と指定すると、どっちがどっちのuserかわからなくなる
  # follower, followedで分ける
  # しかし、そのままだとfollower, followedテーブルを探しに行くので、
  # class_name: "User"とすることで、userテーブルからデータを取ってくるようにする。
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
