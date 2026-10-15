class PigHouse < ApplicationRecord
  validates :name, presence: { message:  "豚舎名を入力してください" }
  validates :name, uniqueness: { message:  "豚舎名はすでに登録されています" }
end
#uniqueness独自性
