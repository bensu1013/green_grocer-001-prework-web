def consolidate_cart(cart:[])
  grocery = Hash.new
  cart.each {|item|
    item.each {|name, hash|
      item_count = 0
      if grocery.has_key?(name) == false
        hash_count = {count: 1}
        grocery[name] = hash.merge(hash_count)
      else
        grocery[name][:count] += 1
      end
      }
    }
  grocery
end

def apply_coupons(cart:[], coupons:[])
  h = cart
  coupons.each {|coup|
    if cart.has_key?(coup[:item])
      if h.has_key?(coup[:item] + " W/COUPON")
        if (cart[coup[:item]][:count] >= coup[:num])
          h[coup[:item] + " W/COUPON"][:count] += 1
          cart[coup[:item]][:count] -= coup[:num]
        end
      else
        if (cart[coup[:item]][:count] >= coup[:num])
          cart[coup[:item]][:count] -= coup[:num]
          apply_coup = Hash.new
          apply_coup[coup[:item] + " W/COUPON"] = {:price => coup[:cost], :clearance => cart[coup[:item]][:clearance], :count => 1}
          h.merge(apply_coup)
        end
      end
    end
    }
  h
end

def apply_clearance(cart:[])
  cart.each {|item|
    if item[:clearance] == true
      item[:price] -= item[:price] / 5
    end
    }
  cart
end

def checkout(cart: [], coupons: [])
  # code here
end