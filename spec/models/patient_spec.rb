require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'associations' do
    # it {is_expected.to belong_to(:ward)}
    it {is_expected.to have_many(:stays)}
    it {is_expected.to have_many(:appointments)}
    it {is_expected.to have_many(:doctors)}
  end
  describe 'validations' do
    it { should validate_presence_of(:department_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:dis) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:address) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
  describe 'columns' do
    it { is_expected.to have_db_column(:department_id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:age).of_type(:string) }
    it { is_expected.to have_db_column(:weight).of_type(:string) }
    it { is_expected.to have_db_column(:dis).of_type(:string) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
    it { is_expected.to have_db_column(:address).of_type(:text) }
  end
end
