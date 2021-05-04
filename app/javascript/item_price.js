window.addEventListener('load', () => {
    const torihiki = document.getElementById("item-price");
    console.log(torihiki)
    torihiki.addEventListener("input", () => {
      const inputValue = torihiki.value;
      const addTaxDom = document.getElementById("add-tax-price")
      addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
      const profitNumber = document.getElementById("profit")
      const value_result = Math.floor(inputValue * 0.1);
      profitNumber.innerHTML = inputValue - value_result;
   })
  });

