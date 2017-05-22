public class jquery_minhack{
public Opportunity theOpp {get;set;}
	public List<PricebookEntry> allStandardProducts {get;set;} 
	public List<Products> allProducts {get;set;}

	public boolean showResults {get;set;}

	public List<Products> selectedProducts {get;set;}
	public List<OpportunityLineItem> allProductsToAdd {get;set;}

	public jquery_minhack(ApexPages.StandardController std){
		theOpp = (Opportunity) std.getRecord();

		allProducts = new List<Products>();
		selectedProducts = new List<Products>();
		allProductsToAdd = new List<OpportunityLineItem>();

		showResults = false;
		allStandardProducts = [select Name, Id, Product2.ProductCode, UnitPrice from PricebookEntry where Pricebook2.Name = 'Standard'];
		createProductList();
	}

	/* creates a table with checkboxes for all standard products */
	public void createProductList(){
		for(PricebookEntry product : allStandardProducts) {
			allProducts.add(new Products(false, product, 0, product.UnitPrice));
		}
	}

	/* add selected products to list to define quantity/price */
	public void addProduct(){
		selectedProducts.clear();

		for(Products product : allProducts){
			if(product.selected == true){
				selectedProducts.add(product);
			}
		}

		showResults = true;
	}

	/* link products to opportunity */
	public pageReference createLineItems(){
		for(Products product : selectedProducts){
			OpportunityLineItem oli = new OpportunityLineItem(
				Quantity = product.quantity,
				UnitPrice = product.SalesPrice,
				OpportunityId = theOpp.Id,
				PricebookEntryId = product.prod.Id
			);

			allProductsToAdd.add(oli);
		}

		insert allProductsToAdd;
		return new PageReference('/apex/jquery_minihack?id='+theOpp.Id).setRedirect(true);
	}

	/* wrapper class for all standard products table */
	public class Products {
		public boolean selected {get;set;}
		public PricebookEntry prod {get;set;}
		public Integer quantity {get;set;}
		public Decimal SalesPrice {get;set;}

		public Products(boolean checkbox, PricebookEntry pricebookentry, Integer product_quantity, Decimal product_salesprice){
			selected = checkbox;
			prod = pricebookentry;
			quantity = product_quantity;
			SalesPrice = product_salesprice;
		}
	}
}