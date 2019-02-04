$(function () {
    var txt1 = '<span id="button"><img src="../Images/fullscreen (1).png" id="imageFullScreen" alt="Full Screen" /></span>';
    $("#FullScreenContainer").prepend(txt1);
});

$(document).ready(function () {
    $('#button').click(function (e) {

        $('#FullScreenContainer').toggleClass('fullscreen');

        AdjustSize();

    });
});

function OnInit(s, e) {
    AdjustSize();
    document.getElementById("gridContainer").style.visibility = "";

}
function OnEndCallback(s, e) {
    AdjustSize();

}
function OnControlsInitialized(s, e) {
    ASPxClientUtils.AttachEventToElement(window, "resize", function (evt) {
        AdjustSize();
    });
}




function AdjustSize() {

    var height = document.documentElement.clientHeight - $('#gridView').position().top;
    grid.SetHeight(height);

}