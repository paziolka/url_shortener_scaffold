describe RedirectService do
  subject(:service) { described_class.new(link: 'fds') }

  let!(:url) { create(:url, link: 'fds', original: 'www.google.com') }

  describe '#call' do
    context 'when url is present' do
      it 'returns truthy value (an instance of Url class)' do
        expect(service.call).to be_truthy
      end

      it 'increment visits number' do
        expect { service.call }.to change { url.reload.visits }.by(1)
      end
    end

    context 'when url is blank' do
      subject(:service) { described_class.new(link: 'abc') }

      it 'returns false' do
        expect(service.call).to eq(false)
      end

      it 'does not increment visits number' do
        expect { service.call }.to change(url, :visits).by(0)
      end
    end
  end

  describe '#redirect_url' do
    # TODO: add contexts for present or absent scheme

    it 'returns original url for link' do
      expect(service.redirect_url).to eq('http://www.google.com')
    end
  end
end
