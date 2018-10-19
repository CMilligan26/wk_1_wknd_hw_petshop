def pet_shop_name(pet_shop_info)
  return pet_shop_info[:name]
end

def total_cash(pet_shop_info)
  return pet_shop_info[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop_info, cash)
  pet_shop_info[:admin][:total_cash] += cash
end

def pets_sold(pet_shop_info)
  return pet_shop_info[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop_info, number_sold)
  pet_shop_info[:admin][:pets_sold] += number_sold
end

def stock_count(pet_shop_info)
  return pet_shop_info[:pets].length
end

def pets_by_breed(pet_shop_info, breed)
  store_breeds = Array.new
  for pets in pet_shop_info[:pets]
    store_breeds.push(pets) if pets[:breed] == breed
  end
  return store_breeds
end

def find_pet_by_name(pet_shop_info, pet_name)
  for pets in pet_shop_info[:pets]
    return pets if pets[:name] == pet_name
  end
  return nil
end

def remove_pet_by_name(pet_shop_info, pet_name)
  for pets in pet_shop_info[:pets]
    pet_shop_info[:pets].delete(pets) if pets[:name] == pet_name
  end
end

def add_pet_to_stock(pet_shop_info, pet_to_add)
  pet_shop_info[:pets].push(pet_to_add)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  customer[:pets].count
end

def add_pet_to_customer(customer, pet_to_add)
  customer[:pets].push(pet_to_add)
end

def customer_can_afford_pet(customer, potential_pet)
  if customer[:cash] < potential_pet[:price]
    return false
  end
  return true
end

def sell_pet_to_customer(pet_shop_info, pet_sold, customer)
  if pet_sold != nil and customer_can_afford_pet(customer, pet_sold) == true
    customer[:pets].push(pet_sold)
    pet_shop_info[:admin][:pets_sold] += 1
    customer[:cash] -= pet_sold[:price]
    pet_shop_info[:admin][:total_cash] += pet_sold[:price]
  end
end
