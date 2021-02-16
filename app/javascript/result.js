function result () {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener("keyup", () => {
    const price = itemPrice.value;
    const procedure = price * 0.1;
    const profitTotal = price - price * 0.1;
    addTaxPrice.innerHTML = parseInt(procedure, 10).toLocaleString();
    profit.innerHTML = Math.ceil(profitTotal, 10).toLocaleString();
  });
}

window.addEventListener('load', result)