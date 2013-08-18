# == Schema Information
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  key        :string(255)     not null
#  slug       :string(255)     not null
#  title      :string(255)
#  grade      :integer         default(1), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


Tag = WorldDb::Models::Tag

