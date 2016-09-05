# rails g model Stock ticker:string name:string last_price:decimal
class Stock < ActiveRecord::Base

  def self.new_from_lookup(symbol)
    lookup_stock = StockQuote::Stock.quote(symbol)
    return nil unless lookup_stock.name

    # uzycie new tutaj to jak wywolanie Stock.new -- utworzenie istancji
    new_stock = new(ticker: lookup_stock.symbol, name: lookup_stock.name)
    new_stock.last_price = new_stock.price #to wywolanie metody instancji price z ponizej
    new_stock
  end

  def self.find_by_ticker(symbol)
    where(ticker: symbol).first
    # to wywolanie metody where odziedziczonej z ActiveRecord::Base
    # np.: (some_stock.where({|x| x > 1})
  end

  def price
    closing_price = StockQuote::Stock.quote(ticker).close
    return "#{closing_price} (Closing)" if closing_price

    opening_price = StockQuote::Stock.quote(ticker).open
    return "#{opening_price} (Opening)" if opening_price
    'Unavailable'
  end

end
