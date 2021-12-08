//If you are using string literals, be sure to escape your double quotes!
function showDialog(title, message, width, largerText) {
    //set up the vars
    var dialogTitle = title,
        dialogHTML = message,
        dialogWidth,
        modalBlocker = document.createElement("div"),
        modalBox = document.createElement("div"),
        modalBoxInner = document.createElement("div"),
        modalBoxTitle = document.createElement("h3"),
        modalBoxClose = document.createElement("span");

    if (width) {
        dialogWidth = width;
    }
    else {
        dialogWidth = '800';
    }

    //debug info
    console.log('title', title);
    console.log('message', message);
    console.log('width', width);
    console.log('largerText', largerText);

    

    //Get the document size
    var w = 0; var h = 0;
    if (!window.innerWidth) {
        if (!(document.documentElement.clientWidth == 0)) {
            w = document.documentElement.clientWidth;
            h = document.documentElement.clientHeight;
        } else {
            w = document.body.clientWidth;
            h = document.body.clientHeight;
        }
    } else {
        w = window.innerWidth;
        h = window.innerHeight;
    }

    //Set up the modal blocker
    modalBlocker.setAttribute('Id', '__modalBlocker');
    modalBlocker.style.width = w + 'px';
    modalBlocker.style.height = document.body.scrollHeight + 'px';
    modalBlocker.style.position = 'absolute';
    modalBlocker.style.zIndex = '20000';
    modalBlocker.style.opacity = '.5';
    modalBlocker.style.filter = 'alpha(opacity=50)';
    modalBlocker.style.backgroundColor = '#000';
    modalBlocker.style.top = 0;
    modalBlocker.style.left = 0;

    //set up the modal box...
    modalBox.setAttribute('id', '__modalBox');
    modalBox.style.backgroundColor = '#fff';
    modalBox.style.width = dialogWidth + 'px';
    modalBox.style.zIndex = '20001';
    modalBox.style.position = 'fixed';
    modalBox.style.top = '200px';
    modalBox.style.left = ((w / 2) - (dialogWidth / 2)) + 'px';
    modalBox.style.borderRadius = '4px';
    modalBox.style.boxShadow = '1px 1px 10px #000';

    //...and the inner div
    modalBoxInner.style.position = 'relative';
    modalBoxInner.style.padding = '20px';
    if (largerText) modalBoxInner.style.fontSize = '1.6em';
    modalBoxInner.innerHTML = dialogHTML;


    //set up the close button
    modalBoxClose.innerHTML = 'X';
    modalBoxClose.title = 'Close';
    modalBoxClose.style.fontSize = '12px';
    modalBoxClose.style.backgroundColor = 'rgb(224, 7, 7)';
    modalBoxClose.style.color = '#fff';
    modalBoxClose.style.position = 'absolute';
    modalBoxClose.style.top = '0';
    modalBoxClose.style.right = '10px';
    modalBoxClose.style.display = 'block';
    modalBoxClose.style.width = '26px';
    modalBoxClose.style.padding = '5px';
    modalBoxClose.style.textAlign = 'center';
    modalBoxClose.style.cursor = 'pointer';
    modalBoxClose.style.borderBottomLeftRadius = '4px';
    modalBoxClose.style.borderBottomRightRadius = '4px';
    modalBoxClose.setAttribute('onclick', 'document.body.removeChild(document.getElementById(\'__modalBlocker\'));document.body.removeChild(document.getElementById(\'__modalBox\'));');

    //set up the dialog box title
    modalBoxTitle.innerHTML = dialogTitle;
    modalBoxTitle.style.display = 'block';
    modalBoxTitle.style.fontSize = '1.6em';
    modalBoxTitle.style.color = '#1797c0';
    modalBoxTitle.style.margin = '8px 0 0 8px';

    //Add the close button and the title to the modal box
    modalBox.appendChild(modalBoxClose);
    modalBox.appendChild(modalBoxTitle);
    modalBox.appendChild(modalBoxInner);

    //finally, add the modal box and the modal blocker to the page
    document.body.appendChild(modalBlocker);
    document.body.appendChild(modalBox);
}