require 'rails_helper'

RSpec.describe Ward, type: :model do
  describe 'associations' do
    it {is_expected.to belong_to(:department).optional}
    # it {is_expected.to have_many(:patients)}
    it {is_expected.to have_many(:staffs)}
    it {is_expected.to have_many(:stays)}
    it {is_expected.to have_many(:beds)}
  end
  describe 'validations' do
    it { should validate_presence_of(:department_id) }
    it { should validate_presence_of(:wards_name) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
  describe 'columns' do
    it { is_expected.to have_db_column(:department_id).of_type(:integer) }
    it { is_expected.to have_db_column(:wards_name).of_type(:string) }
  end
end
