function price(){
  const prices = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  prices.addEventListener("keyup",() =>{
    const value = prices.value;
    let fee = value * 0.1
    let gains = value - fee
    add_tax.textContent = fee;
    profit.textContent = gains
  });
}
window.addEventListener("load", price);


// function price (){
//   const prices = document.getElementById("item-price");
//   prices.addEventListener("input", () => {
//     console.log('input ok')
//   });
// }
// window.addEventListener("load", price);
