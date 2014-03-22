require 'spec_helper'

describe Player do
  it { should ensure_inclusion_of(:super_power).in_array(Game::SUPER_POWERS) }
end
