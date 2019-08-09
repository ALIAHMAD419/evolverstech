require 'rails_helper'

RSpec.describe Stay, type: :model do
  describe 'associations' do
    it {is_expected.to belong_to(:patient).optional}
    it {is_expected.to belong_to(:doctor).optional}
    it {is_expected.to belong_to(:ward).optional}
    it {is_expected.to have_one(:bill)}
  end
   describe 'validations' do
    it { should validate_presence_of(:patient_id) }
    it { should validate_presence_of(:doctor_id) }
    it { should validate_presence_of(:ward_id) }
    it { should validate_presence_of(:a_time) }
    it { should validate_presence_of(:d_time) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
  describe 'columns' do
    it { is_expected.to have_db_column(:patient_id).of_type(:integer) }
    it { is_expected.to have_db_column(:doctor_id).of_type(:integer) }
    it { is_expected.to have_db_column(:ward_id).of_type(:integer) }
    it { is_expected.to have_db_column(:a_time).of_type(:datetime) }
    it { is_expected.to have_db_column(:d_time).of_type(:datetime) }
  end
end
