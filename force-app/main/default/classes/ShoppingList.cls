public class ShoppingList {
    public String listName { get; set; }
    public List<String> items { get; set; }

    public ShoppingList(String listName) {
        this.listName = listName;
        this.items = new List<String>();
    }

    public void addItem(String itemName) {
        this.items.add(itemName);
    }

    public void printList() {
        System.debug('Shopping list ' + this.listName + ':');
        for (String item : this.items) {
            System.debug(' - ' + item);
        }
    }
}