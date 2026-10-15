class Destination < ApplicationRecord
  validates :name, presence: { message: "出荷先を入力してください" }
  validates :name, uniqueness: { message: "出荷先はすでに登録されています" }
end