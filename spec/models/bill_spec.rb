require 'rails_helper'

RSpec.describe Bill, type: :model do
  describe 'associations' do
    it {is_expected.to belong_to(:stay).optional}
  end
  describe 'validations' do
    it { should validate_presence_of(:stay_id) }
    it { should validate_presence_of(:bill) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
  describe 'columns' do
    it { is_expected.to have_db_column(:stay_id).of_type(:integer) }
    it { is_expected.to have_db_column(:bill).of_type(:integer) }
  end
end
