# -*- coding: utf-8 -*-

require 'active_support/concern'
require 'active_record/errors'

require File.expand_path(File.join('..', 'spec_helper'), File.dirname(__FILE__))
require 'readonlyable'

class DummyClass
  include Readonlyable
end

describe Readonlyable do
  let(:obj) { DummyClass.new }

  describe "included instance" do
    subject { obj }

    it "has readonly?" do
      expect(subject.respond_to?(:readonly?)).to be_true
    end

    it "has before_destroy" do
      expect(subject.respond_to?(:before_destroy)).to be_true
    end
  end

  describe "included class" do
    subject { DummyClass }

    it "has delete" do
      expect(subject.respond_to?(:delete)).to be_true
    end

    it "has delete_all" do
      expect(subject.respond_to?(:delete_all)).to be_true
    end
  end

  describe "#readonly?" do
    subject { obj }

    it "常に true を返すこと" do
      expect(subject.readonly?).to be_true
    end
  end

  describe "#before_destroy" do
    subject { obj }
    it "例外 ActiveRecord::ReadOnlyRecord が発生すること" do
      expect {
        subject.before_destroy
      }.to raise_error(ActiveRecord::ReadOnlyRecord)
    end
  end

  describe "delete" do
    subject { DummyClass }
    it "例外 ActiveRecord::ReadOnlyRecord が発生すること" do
      expect {
        subject.delete(0)
      }.to raise_error(ActiveRecord::ReadOnlyRecord)
    end
  end

  describe "delete_all" do
    subject { DummyClass }
    it "例外 ActiveRecord::ReadOnlyRecord が発生すること" do
      expect {
        subject.delete_all("")
      }.to raise_error(ActiveRecord::ReadOnlyRecord)
    end
  end
end

