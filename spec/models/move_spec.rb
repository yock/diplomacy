require 'spec_helper'

describe Move do
  it { should validate_presence_of :request }
  it { should validate_presence_of :turn }
  it { should belong_to :player}
end
