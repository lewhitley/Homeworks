document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const handlePlaceInput = e =>{
    e.preventDefault();
    const placeInput = document.querySelector(".favorite-input");
    const place = placeInput.value;
    placeInput.value = "";

    const newLi = document.createElement("li");
    newLi.textContent = place;

    const placeList = document.getElementById("sf-places");
    placeList.appendChild(newLi);
  };

  const button = document.querySelector(".favorite-submit");
  button.addEventListener("click", handlePlaceInput);

  // adding new photos

  const handleToggle = e => {
    const photoForm = document.querySelector(".photo-form-container");
    if (photoForm.className === "photo-form-container hidden") {
      photoForm.className = "photo-form-container";
    } else {
      photoForm.className = "photo-form-container hidden";
    }
  };

  const toggle = document.querySelector(".photo-show-button");
  toggle.addEventListener("click", handleToggle);

  const handlePhoto = e => {
    e.preventDefault();
    const photoInput = document.querySelector(".photo-url-input");
    const photoUrl = photoInput.value;
    photoInput.value = "";

    const newImg = document.createElement("img");
    newImg.src = photoUrl;
    const newPhoto = document.createElement("li");
    newPhoto.appendChild(newImg);
    const imageList = document.querySelector(".dog-photos");
    imageList.appendChild(newPhoto);
  };

  const dogButton = document.querySelector(".photo-url-submit");
  dogButton.addEventListener("click", handlePhoto);

});
