# == Schema Information
#
# Table name: top_ups
#
#  id         :integer          not null, primary key
#  amount     :decimal(10, )
#  name       :string(255)
#  bank       :string(255)
#  approved   :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TopUp < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :amount, :bank

  def approve
    if !self.approved
      self.approved = true
      self.save
      self.user.credit += self.amount
      self.user.save
      return true
    else
      return false
    end
  end

  def self.bank_list
    [
      'Bank Central Asia (BCA)',
      'Bank Mandiri',
      'Bank Negara Indonesia (BNI)',
      'Bank Rakyat Indonesia (BRI)',
      'Anglomas International Bank',
      'BCA Syariah',
      'BII Syariah',
      'Bangkok Bank',
      'Bank ANZ Indonesia',
      'Bank Agris',
      'Bank Agroniaga',
      'Bank Andara',
      'Bank Artha Graha International',
      'Bank Artos Indonesia',
      'Bank BJB (Bandung)',
      'Bank BJB Syariah',
      'Bank BNI Syariah',
      'Bank BNP Paribas Indonesia',
      'Bank BPD Aceh (Banda Aceh)',
      'Bank BPD Aceh Syaria',
      'Bank BPD Bali (Denpasar)',
      'Bank BPD DIY (Yogyakarta)',
      'Bank BRI Syariah',
      'Bank BTN Syariah',
      'Bank Bengkulu (Bengkulu)',
      'Bank Bisnis Internasional',
      'Bank Bukopin',
      'Bank Bumi Arta',
      'Bank Capital Indonesia',
      'Bank Chinatrust Indonesia',
      'Bank Commonwealth',
      'Bank DBS Indonesia',
      'Bank DKI (Jakarta)',
      'Bank DKI Syariah',
      'Bank Danamon Indonesia',
      'Bank Danamon Syariah',
      'Bank Dipo International',
      'Bank Ekonomi Raharja',
      'Bank Fama International',
      'Bank Ganesha',
      'Bank Hana',
      'Bank Harda International',
      'Bank ICB Bumiputra',
      'Bank ICBC Indonesia',
      'Bank Ina Perdana',
      'Bank Index Selindo',
      'Bank International Indonesia (BII)',
      'Bank J Trust Indonesia',
      'Bank Jambi (Jambi)',
      'Bank Jasa Jakarta',
      'Bank Jateng (Semarang)',
      'Bank Jatim (Surabaya)',
      'Bank KEB Indonesia',
      'Bank Kalbar (Pontianak)',
      'Bank Kalbar Syariah',
      'Bank Kalsel (Banjarmasin)',
      'Bank Kalsel Syariah',
      'Bank Kalteng (Palangka Raya)',
      'Bank Kaltim (Samarinda)',
      'Bank Kesejahteraan Ekonomi',
      'Bank Lampung (Bandar Lampung)',
      'Bank Liman International',
      'Bank Maluku (Ambon)',
      'Bank Maspion',
      'Bank Mayapada',
      'Bank Maybank Indonesia',
      'Bank Maybank Syariah Indonesia',
      'Bank Mayora',
      'Bank Mega',
      'Bank Mega Syariah',
      'Bank Mestika Dharma',
      'Bank Metro Express',
      'Bank Mitraniaga',
      'Bank Mizuho Indonesia',
      'Bank Muamalat Indonesia',
      'Bank Multi Arta Sentosa',
      'Bank NTB (Mataram)',
      'Bank NTB Syariah',
      'Bank NTT (Kupang)',
      'Bank Nagari (Padang)',
      'Bank Nationalnobu',
      'Bank Nusantara Parahayangan',
      'Bank OCBC NISP',
      'Bank Papua (Jayapura)',
      'Bank Perkreditan Rakyat (BPR KS)',
      'Bank Permata',
      'Bank Permata Syariah',
      'Bank Pundi Indonesia',
      'Bank QNB Kesawan',
      'Bank Rabobank International Indonesia',
      'Bank Resona Perdania',
      'Bank Riau Kepri (Pekanbaru)',
      'Bank Riau Kepri Syariah',
      'Bank Royal Indonesia',
      'Bank SBI Indonesia',
      'Bank Sahabat Purba Danarta',
      'Bank Sinar Harapan Bali',
      'Bank Sinarmas',
      'Bank Sulsel (Makassar)',
      'Bank Sulteng (Palu)',
      'Bank Sultra (Kendari)',
      'Bank Sulut (Manado)',
      'Bank Sumitomo Mitsui Indonesia',
      'Bank Sumsel Babel (Palembang)',
      'Bank Sumsel Babel Syariah',
      'Bank Sumut (Medan)',
      'Bank Sumut Syariah',
      'Bank Syariah Bukopin',
      'Bank Syariah Mandiri',
      'Bank Tabungan Negara (BTN)',
      'Bank Tabungan Pensiunan Nasional',
      'Bank UOB Indonesia',
      'Bank Victoria International',
      'Bank Victoria Syariah',
      'Bank Windu Kentjana International',
      'Bank Woori Indonesia',
      'Bank Yudha Bhakti',
      'Bank of America',
      'Bank of China',
      'Bank of India Indonesia',
      'CIMB Niaga Syariah',
      'Centrama Nasional Bank',
      'Citibank',
      'Deutsche Bank',
      'HSBC',
      'HSBC Amanah',
      'JPMorgan Chase',
      'OCBC NISP Syariah',
      'Panin Bank',
      'Panin Bank Syariah',
      'Prima Master Bank',
      'Royal Bank of Scotland',
      'Standard Chartered',
      'The Bank of Tokyo Mitsubishi UFJ'
    ]
  end
end
