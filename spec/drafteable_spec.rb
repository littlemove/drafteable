require 'active_record'
require 'drafteable'

require 'fileutils'

describe Drafteable do

  before :all do
    setup_db
    @no_draft_field_model = DummyModel.new
    @drafteable_ready_model = DummyReadyModel.new
  end

  describe 'without draft field' do

    it { @no_draft_field_model.should respond_to(:published?) }

    it 'should raise Exception' do
      lambda {
        @no_draft_field_model.published?.should raise_exception(Exception, 'There is no draft field. Did you forget to run migrations?')
      }
    end

  end


  describe 'with draft field' do

    it 'should not raise Exception' do
      lambda { @drafteable_ready_model.published?.should_not raise_exception() }
    end

    it { @drafteable_ready_model.published?.should be(true) }

    it { @drafteable_ready_model.draft?.should be(false) }

    context 'set to draft' do
      it 'should change to draft' do
        @drafteable_ready_model.draft!
        @drafteable_ready_model.draft?.should be(true)
      end
    end

    context 'set to published' do
      it 'should change to published' do
        @drafteable_ready_model.publish!
        @drafteable_ready_model.published?.should be(true)
      end
    end
  end

  after :all do
    teardown_db
  end

end

private

def setup_db
  db_dir = 'spec/db'
  FileUtils.mkdir(db_dir) unless File.exists?(db_dir)
  ActiveRecord::Base.establish_connection(
                                          adapter: 'sqlite3',
                                          database: 'spec/db/development.sqlite3'
                                          )

  ActiveRecord::Migration.verbose = false

  CreateDummyModels.migrate(:up)
end

def teardown_db
  FileUtils.rm('spec/db/development.sqlite3')
end

class CreateDummyModels < ActiveRecord::Migration
  def change
    create_table :dummy_models do |t|
      t.string :name

      t.timestamps
    end

    create_table :dummy_ready_models do |t|
      t.string :name
      t.boolean :draft, default: false

      t.timestamps
    end
  end
end

class DummyModel < ActiveRecord::Base
  acts_as_drafteable
end

class DummyReadyModel < ActiveRecord::Base
  acts_as_drafteable
end
