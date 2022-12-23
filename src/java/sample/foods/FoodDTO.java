package sample.foods;

/**
 *
 * @author MagnusJS
 */
public class FoodDTO {
    private String id;
    private String name;
    private String description;
    private String image;
    private float price;
    private int cookingTime;
    private boolean status;
    private int quantity;
   
    public FoodDTO() {
    }
    
//    public FoodDTO(String id, String name, String description, float price, int cookingTime, boolean status) {
//        this.id = id;
//        this.name = name;
//        this.description = description;
//        this.price = price;
//        this.cookingTime = cookingTime;
//        this.status = status;
//    }
 
    public FoodDTO(String id, String name, String description, float price, int cookingTime, boolean status, String image) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.cookingTime = cookingTime;
        this.status = status;
        this.image = image;
    }
    
    public FoodDTO(String id, String name, float price, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getCookingTime() {
        return cookingTime;
    }

    public void setCookingTime(int cookingTime) {
        this.cookingTime = cookingTime;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }    
}
