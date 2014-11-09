# == Schema Information
#
# Table name: usages
#
#  id         :integer         not null, primary key
#  country_id :integer         not null
#  lang_id    :integer         not null
#  official   :boolean         default(TRUE), not null
#  minor      :boolean         default(FALSE), not null
#  percent    :float
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

Usage = WorldDb::Model::Usage

