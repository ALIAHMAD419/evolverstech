require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'associations' do
    it {is_expected.to belong_to(:doctor)}
    it {is_expected.to belong_to(:patient)}
    it {is_expected.to belong_to(:room).optional}
  end

  describe 'validations' do
    it { should validate_presence_of(:doctor_id) }
    it { should validate_presence_of(:patient_id) }
    it { should validate_presence_of(:room_id) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
  describe 'columns' do
    it { is_expected.to have_db_column(:doctor_id).of_type(:integer) }
    it { is_expected.to have_db_column(:patient_id).of_type(:integer) }
    it { is_expected.to have_db_column(:room_id).of_type(:integer) }
    it { is_expected.to have_db_column(:start_time).of_type(:datetime) }
    it { is_expected.to have_db_column(:end_time).of_type(:datetime) }
  end
end
