describe CreateUrlForm do
  subject(:form) { described_class.new(params) }

  context 'when original attribute is present' do
    let(:params) { { original: 'www.google.com' } }

    it 'is valid' do
      expect(form.valid?).to eq(true)
    end

    it 'overwrites attributes' do
      expect(form.attributes[:visits]).to eq(0)
    end
  end

  context 'when original attribute is missing' do
    let(:params) { { original: '' } }

    it 'is valid' do
      expect(form.valid?).to eq(false)
      expect(form.errors.full_messages).to include('Original can\'t be blank')
    end

    it 'overwrites attributes' do
      expect(form.attributes[:visits]).to eq(0)
    end
  end
end
