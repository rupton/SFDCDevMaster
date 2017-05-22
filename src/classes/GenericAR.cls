public class GenericAR{
	public GenericAR() {
		Account a = [select id from account limit 1][0];
	}
}