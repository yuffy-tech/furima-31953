window.addEventListener('load', () => {
    console.log("OK");
    const torihiki = document.getElementById("item-price");
    console.log(torihiki)
    torihiki.addEventListener("input", () => {
      console.log("イベント発火");
      const inputValue = torihiki.value;

      const addTaxDom = document.getElementById("add-tax-price")
      addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
      console.log(addTaxDom);

      const profitNumber = document.getElementById("profit")
      const value_result = Math.floor(inputValue * 0.1);
      console.log(value_result)
      profitNumber.innerHTML = inputValue - value_result;
      console.log(profitNumber);




   })
  });

