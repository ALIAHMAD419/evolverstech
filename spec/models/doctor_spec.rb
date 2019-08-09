require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'associations' do
    it {is_expected.to belong_to(:department).optional}
    it {is_expected.to have_many(:stays)}
    it {is_expected.to have_many(:appointments)}
    it {is_expected.to have_many(:patients)}
  end
  describe 'validations' do
    it { should validate_presence_of(:department_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:spec) }
    it { should validate_presence_of(:hours) }
    it { should validate_presence_of(:fees) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
  describe 'columns' do
    it { is_expected.to have_db_column(:department_id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:spec).of_type(:string) }
    it { is_expected.to have_db_column(:hours).of_type(:datetime) }
    it { is_expected.to have_db_column(:fees).of_type(:integer) }
  end
end
