const card = () => {
  Payjp.setPublickey("");

  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("card-number"),
      exp_mouth: formData.get("card-exp-month"),
      exp_year: formData.get("card-exp-year"),
      cvc: formData.get("card-cvc"),
    };

    Payjp.createToken(card, (status, response) => {
      if(status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type='hidden'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("chatge-form").onsubmit();
    });
  });
};
window.addEventListener("load", pay);