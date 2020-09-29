describe CreateUrlService do
  subject(:service) { described_class.new(form: form) }

  describe '#call' do
    context 'when form is valid' do
      let(:form) do
        double(
          valid?: true,
          attributes: { original: 'www.google.com', visits: 0 }
        )
      end

      it 'returns truthy value (an instance of Url class)' do
        expect(service.call).to be_truthy
      end

      it 'creates Url' do
        expect { service.call }.to change(Url, :count).by(1)

        url = Url.last

        expect(url.original).to eq('www.google.com')
        expect(url.visits).to eq(0)
        expect(url.link).not_to be_empty
      end
    end

    context 'when form is invalid' do
      let(:form) { double(valid?: false) }

      it 'returns false' do
        expect(service.call).to eq(false)
      end

      it 'does not create an Url' do
        expect { service.call }.to change(Url, :count).by(0)
      end
    end
  end
end
