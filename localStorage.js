window.addEventListener('load',function(){

    if ( localStorage.getItem('SFW') == null ) {
        setSFW('BA')
    }

    var botonA = document.querySelector("#BA");

    botonA.addEventListener( 'click', function(){
        if ( localStorage.getItem('SFW') == '1' ){
            setNSFW('BA')
        } else {
            setSFW('BA')
        }
    });

});

function setSFW( buttonID ) {
    localStorage.setItem('SFW', '1');
    document.getElementById( buttonID ).textContent = 'SFW';
}

function setNSFW( buttonID ) {
    localStorage.setItem('SFW', '0');
    document.getElementById( buttonID ).textContent = 'NSFW';
}