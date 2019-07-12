window.addEventListener('load',function(){
    var button1 = document.querySelector("#B1");
    var button2 = document.querySelector("#B2");

    button1.addEventListener('click', function(){
        show('frame1a');
        hide('frame1b');
        togON('B1');
        togOFF('B2');
    });

    button2.addEventListener('click', function(){
        hide('frame1a');
        show('frame1b');
        togON('B2');
        togOFF('B1');
    });
});

function show( show1 ) { document.getElementsByClassName(show1)[0].style.display="block"; }
function hide( hide1 ) { document.getElementsByClassName(hide1)[0].style.display="none"; }
function togON( tog ) { document.getElementById(tog).style.backgroundColor="var(--gray1)"; }
function togOFF( tog ) { document.getElementById(tog).style.backgroundColor="var(--white1)"; }