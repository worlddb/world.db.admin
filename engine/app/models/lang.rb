# == Schema Information
#
# Table name: langs
#
#  id         :integer         not null, primary key
#  key        :string(255)     not null
#  title      :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


Lang = WorldDb::Models::Lang
