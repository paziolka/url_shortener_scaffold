describe Url do
  describe '.to_csv' do
    # TODO: configure fixtures and put it there
    let(:csv) do
      "original,link,visits\nwww.google.com,fds,1\nwww.facebook.com,abc,3\n"
    end

    before do
      create(:url, link: 'fds', original: 'www.google.com', visits: 1)
      create(:url, link: 'abc', original: 'www.facebook.com', visits: 3)
    end

    it 'returns a name for a CSV to be downloaded from index view' do
      expect(Url.to_csv).to eq(csv)
    end
  end

  describe '.csv_filename' do
    it 'returns a name for a CSV to be downloaded from index view' do
      expect(Url.csv_filename).to include("urls-#{Time.zone.today}")
    end
  end
end
