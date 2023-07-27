class House < ApplicationRecord
    has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'
end
