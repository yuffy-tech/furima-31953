const pay = () => {
    Payjp.setPublicKey("pk_test_9313a7113db8b7033d787911");
    const form = document.getElementById("charge-form");
    form.addEventListener("submit", (e) => {
      e.preventDefault();
  
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);
  
      const card = {
        number: formData.get("item_form[number]"),
        cvc: formData.get("item_form[cvc]"),
        exp_month: formData.get("item_form[number_manth]"),
        exp_year: `20${formData.get("item_form[number_year]")}`,
      };
      console.log(card)
  
      Payjp.createToken(card, (status, response) => {

        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden"> `;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
  
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
  
        document.getElementById("charge-form").submit();
      });
    });
  };
  
  window.addEventListener("load", pay);