require 'rails_helper'

RSpec.describe Staff, type: :model do
  describe 'associations' do
    it {is_expected.to belong_to(:ward).optional}
  end
  describe 'validations' do
    it { should validate_presence_of(:ward_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:duty) }
    it { should validate_presence_of(:floor) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
  describe 'columns' do
    it { is_expected.to have_db_column(:ward_id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:age).of_type(:string) }
    it { is_expected.to have_db_column(:time).of_type(:datetime) }
    it { is_expected.to have_db_column(:duty).of_type(:string) }
    it { is_expected.to have_db_column(:floor).of_type(:string) }
  end
end
