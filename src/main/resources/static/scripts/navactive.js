window.onload = function(e) {
    updateNavbarLinkHighlighted();
}

var path;
var active;
var newActiveItemId;

function updateNavbarLinkHighlighted(){
    active = document.querySelector(".active");
    if (active != null) {
        removeActive();
    }
    highlightNew();
}

function removeActive(){
    active.classList.remove("active");
}

function highlightNew() {
    path = location.pathname.substring(1);

    newActiveItemId = pathMatches(/index|^\s*$/) ? "nav-home" :
    pathMatches(/login/) ? "nav-login" :
    pathMatches(/register/) ? "nav-register" :
    pathMatches(/books|borrows/) ? "nav-library" :
    pathMatches(/profile|editprofile|editinfo|changepassword/) ? "nav-profile" :
    pathMatches(/admin/) ? "nav-admin" : "";

    var element = document.getElementById(newActiveItemId);
    if (element != null) {
        element.classList.add("active");
    }
}

function pathMatches(regex) {
    if (path.match(regex)) {
        return true;
    }
    return false;
}