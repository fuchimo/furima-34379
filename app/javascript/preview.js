if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  document.addEventListener('DOMContentLoaded', function(){
    const imageList = document.getElementById("image-list");

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob );
      blobImage.setAttribute('class', 'image-file');

      imageElement.appendChild(blobImage);
      imageList.appendChild(imageElement);
    }

    document.getElementById('item-image').addEventListener('change',function(e){
      const imageContent = document.querySelector('img')
      if (imageContent){
        imageContent.remove();
      };

      const imageNow = document.getElementById("image-now");
      if (imageNow){
        imageNow.remove();
      };
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
};