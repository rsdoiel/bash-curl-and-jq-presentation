(function (document, window) {
    'use strict';
    var start = document.getElementById('start-slide'),
        prev = document.getElementById('prev-slide'),
        next = document.getElementById('next-slide');


document.onkeydown = function(e) {
    switch (e.keyCode) {
        /* case 32: */
        case 37:
            // Previous: left arrow
            prev.click();
            break;
        case 39:
            // Next: right arrow
            next.click();
            break;
        case 72:
        case 83:
            // Home/Start: h, s
            start.click();
            break;
    }
};
}(document, window));

