window.addEventListener('load',function(){

    if ( localStorage.getItem('Main') == null ) {
        setMain('BA')
    }

    var botonA = document.querySelector("#BA");

    botonA.addEventListener( 'click', function(){
        if ( localStorage.getItem('Main') == '1' ){
            setAlt('BA')
        } else {
            setMain('BA')
        }
    });

});

function setMain( buttonID ) {
    localStorage.setItem('Main', '1');
    window.location.reload();
}

function setAlt( buttonID ) {
    localStorage.setItem('Main', '0');
    window.location.reload();
}