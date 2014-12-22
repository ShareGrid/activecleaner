# encoding: utf-8
require 'spec_helper'

describe ActiveCleaner::Utf8mb3Cleaner do

  let(:cleaner) { ActiveCleaner::Utf8mb3Cleaner.new(:title) }

  describe "#clean_value" do

    it "doesn't touch legit value" do
      expect(cleaner.clean_value("A good title!")).to eq("A good title!")
    end

    it "cleans emoticons" do
      emoticons = "😀😁😂😃😄😅😆😇😈😉😊😋😌😍😎😏😐😑😒😓😔😕😖😗😘😙😚😛😜😝😞😟😠😡😢😣😤😥😦😧😨😩😪😫😬😭😮😯😰😱😲😳😴😵😶😷😸😹😺😻😼😽😾😿🙀🙁🙂🙅🙆🙇🙈🙉🙊🙋🙌🙍🙎🙏"
      expect(cleaner.clean_value("A good #{emoticons} title!")).to eq("A good  title!")
    end

    it "kepts accentued chars" do
      expect(cleaner.clean_value("L'Inouï Goûter À Manger.")).to eq("L'Inouï Goûter À Manger.")
    end

    it "kepts japanese chars" do
      expect(cleaner.clean_value("ginkō is written as 銀行")).to eq("ginkō is written as 銀行")
    end

  end

end