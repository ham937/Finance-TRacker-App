class Stock < ApplicationRecord
  has_many :user_stocks, dependent: :destroy
  has_many :users, through: :user_stocks
  validates :name, :ticker, presence: true
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: 'pk_17764d149d20450aba91b2b86ab75288',

      endpoint: 'https://cloud.iexapis.com/v1')

    begin

    new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, lastprice: client.price(ticker_symbol))
  rescue => exception
    return nil
  end
  end
  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
  end
