require 'spec_helper'

describe UnisenderRails::Client do

  it 'should get invalid key error' do
    answer = UnisenderRails::Client.new("123abcd123").getLists
    answer['error'].should_not be_nil
    answer['code'].should == 'invalid_api_key'
  end

  specify{ test_client.get_lists.should == test_client.getLists}

end
