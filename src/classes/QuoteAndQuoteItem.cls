global class QuoteAndQuoteItem {

	
	webservice static void createQuoteWithLines(Quote qt, List<QuoteLineItem> qtis){
		Quote newQuote = qt;
        List<QuoteLineItem>items = new List<QuoteLineItem>();
        for(QuoteLineItem item: qtis){
            item.QuoteId = qt.id;
            items.add(item);
        }
        insert newQuote;
        insert items;
	}
}