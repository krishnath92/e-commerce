const slider = document.querySelector('.slider');
const buttonRight = document.querySelector('.sliderRight');
const buttonLeft = document.querySelector('.sliderLeft');
const body = document.querySelector('body');

let articleNum = imgNum;

let i = 0;

const miniPicsDiv = document.querySelector('.miniPics');
for (let img = 0; img < articleNum; img++) {
    const nbr = img.toString();
    const imgCreate = document.createElement('img');
    imgCreate.setAttribute('id','imgMini' + nbr);
    miniPicsDiv.appendChild(imgCreate);    
}

const img = document.createElement('img');
img.src = './images/slider/' + article + '/img0.jpg';
slider.appendChild(img);

buttonRight.addEventListener('click', () => {
    i++
    if(i < articleNum){
        const nbr = i.toString();
        img.src = './images/slider/' + article + '/img' + nbr + '.jpg';
    } else {
        i = 0;
        const nbr = i.toString();
        img.src = './images/slider/' + article + '/img' + nbr + '.jpg';
    }
})
buttonLeft.addEventListener('click', () => {
    i--
    if(i >= 0){
        if(i < articleNum){
            const nbr = i.toString();
            img.src = './images/slider/' + article + '/img' + nbr + '.jpg';
        } 
    } else {
        i = articleNum - 1;
        const nbr = i.toString();
        img.src = './images/slider/' + article + '/img' + nbr + '.jpg';
    }
})

window.onload = function() {
    for (let d = 1; d <= articleNum; d++) {
        let nb = d - 1;
        const nbrnb = nb.toString();
        const nbr = d.toString();
    
        const miniPic = document.querySelector('.miniPics img:nth-child(' + nbr + ')');
    
        miniPic.src = './images/slider/' + article + '/img' + nbrnb + '.jpg';
        
        miniPic.addEventListener('click', () => {img.src = './images/slider/' + article + '/img' + nbrnb + '.jpg';i = nb;});
    }
}
