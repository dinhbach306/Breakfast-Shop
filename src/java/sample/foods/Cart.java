package sample.foods;

import java.util.HashMap;
import java.util.Map;


public class Cart {

    private Map<String, FoodDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, FoodDTO> cart) {
        this.cart = cart;
    }

    public Map<String, FoodDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, FoodDTO> cart) {
        this.cart = cart;
    }

    public void add(FoodDTO p) {
        if(this.cart == null) {
            this.cart = new HashMap<String, FoodDTO>();
        }
        
        if(this.cart.containsKey(p.getId())) {
            int currentQuantity = this.cart.get(p.getId()).getQuantity();
            p.setQuantity(currentQuantity + p.getQuantity());
        }
        this.cart.put(p.getId(), p);
    }

    public boolean remove(String id) {
        boolean result = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    result = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public boolean update(FoodDTO p) {
        boolean result = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(p.getId())) {
                    this.cart.replace(p.getId(), p);
                    result = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

}
