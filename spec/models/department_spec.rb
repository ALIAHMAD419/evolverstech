require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'associations' do
    it {is_expected.to have_many(:doctors)}
    # it {is_expected.to have_many(:patients)}
    it {is_expected.to have_many(:wards)}
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
  describe 'columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end
end
