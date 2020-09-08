function price(){
  const PriceForm = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
    PriceForm.addEventListener("keyup",() =>{
      const value = PriceForm.value;
      let fee = value * 0.1
      let gains = value - fee
      add_tax.PriceContent = fee;
      profit.PriceContent = gains
    });
}
window.addEventListener("load", price);

