# frozen_string_literal: true

require 'cuid2'

COLISION_TEST_RUN = ENV.fetch('COLISION_TEST_RUN', 1).to_i
CUIDS_PER_RUN = ENV.fetch('CUIDS_PER_RUN', 10).to_i

RSpec.describe Cuid2 do
  it 'has a version number' do
    expect(Cuid2::VERSION).not_to be nil
  end

  it 'should not collide' do
    cuids = []

    COLISION_TEST_RUN.times do
      CUIDS_PER_RUN.times do
        cuids << Cuid2.call
      end
    end

    expect(cuids.uniq.size).to eq(cuids.size)
    expect(cuids.size).to eq(COLISION_TEST_RUN * CUIDS_PER_RUN)
    expect(cuids.uniq.size).to eq(COLISION_TEST_RUN * CUIDS_PER_RUN)
    expect(cuids.uniq.sort).to eq(cuids.sort)
    expect(cuids.sample).to match(/[a-z0-9]{24}/)
  end

  it 'should not have the same first character' do
    cuids = []
    5000.times do
      cuids << Cuid2.call[0]
    end

    expect(cuids.uniq.size).to be > 1
  end
end
