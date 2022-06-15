// Unmap ctrl-j to avoid key conflict with browser switch tab
api.unmap('<Ctrl-j>')

// Remap pin tab
api.map('gp', '<Alt-p>')

// Edit current URL
api.map(';u', ';U')

// Remap open link
api.map('F', 'C');

// Remap search google
api.map('w', 'og');
api.unmap('og');

// Remap open from history
api.map('e', 'oh');
api.unmap('oh')

// Remap open from bookmark
api.map('l', 'b');
api.unmap('b');

// Remap and unmap all search
api.vmap('sg', 'sgg');
api.unmap('sg');
api.unmap('sb');
api.unmap('sd');
api.unmap('sh');
api.unmap('ss');
api.unmap('sw');
api.unmap('se');
api.unmap('sy');

// Map most frequent access sites
api.mapkey('snf', 'open netflix', goto('https://netflix.com'));
api.mapkey('sgh', 'open github', goto('https://github.com'));
api.mapkey('stc', 'open tracau', goto('https://tracau.vn'));
api.mapkey('syt', 'open youtube', goto('https://youtube.com'));
api.mapkey('sfb', 'open facebook', goto('https://facebook.com'));
api.mapkey('stw', 'open twitter', goto('https://twitter.com'));
api.mapkey('stl', 'open google translate', goto('https://translate.google.com'));
api.mapkey('scb', 'open cambridge', goto('https://dictionary.cambridge.org'));
api.mapkey('ssc', 'open soundcloud', goto('https://soundcloud.com'));
api.mapkey('sis', 'open instagram', goto('https://instagram.com'));
api.mapkey('sgm', 'open google map', goto('https://map.google.com'));
api.mapkey('sm0', 'open mail 0', goto('https://mail.google.com/mail/u/0/#inbox'));
api.mapkey('sm1', 'open mail 1', goto('https://mail.google.com/mail/u/1/#inbox'));
api.mapkey('sm2', 'open mail 2', goto('https://mail.google.com/mail/u/2/#inbox'));
api.mapkey('sm3', 'open mail 3', goto('https://mail.google.com/mail/u/3/#inbox'));
api.mapkey('slh', 'open localhost', goto('localhost'));
api.mapkey('sl3', 'open localhost:3000', goto('http://localhost:3000'));
api.mapkey('sl8', 'open localhost:8080', goto('http://localhost:8080'));
api.mapkey('sl9', 'open localhost:9000', goto('http://localhost:9000'));
api.mapkey('sd0', 'open google drive 0', goto('https://drive.google.com/drive/u/0/my-drive'));
api.mapkey('sd1', 'open google drive 1', goto('https://drive.google.com/drive/u/1/my-drive'));
api.mapkey('sd2', 'open google drive 2', goto('https://drive.google.com/drive/u/2/my-drive'));
api.mapkey('sd3', 'open google drive 3', goto('https://drive.google.com/drive/u/3/my-drive'));
api.mapkey('sc0', 'open google calendar 0', goto('https://calendar.google.com/calendar/b/0/r'));
api.mapkey('sc1', 'open google calendar 1', goto('https://calendar.google.com/calendar/b/1/r'));
api.mapkey('sc2', 'open google calendar 2', goto('https://calendar.google.com/calendar/b/2/r'));
api.mapkey('sc3', 'open google calendar 3', goto('https://calendar.google.com/calendar/b/3/r'));
api.mapkey('sp0', 'open google photo 0', goto('https://photos.google.com/u/0'));
api.mapkey('sp1', 'open google photo 1', goto('https://photos.google.com/u/1'));
api.mapkey('sp2', 'open google photo 2', goto('https://photos.google.com/u/2'));
api.mapkey('sp3', 'open google photo 3', goto('https://photos.google.com/u/3'));

function goto(site) {
    return () => window.open(site);
}

settings.historyMUOrder = false;
settings.omnibarPosition = "middle";
api.Hints.characters = "asdfjklwecxoiumn";

settings.theme = `
.sk_theme input {
    font-family: "Fira Code";
}
// .sk_theme .url {
//     font-size: 8px;
// }
#sk_omnibarSearchResult li div.url {
    font-weight: normal;
}
.sk_theme .omnibar_timestamp {
    // font-size: 9px;
    font-weight: bold;
}
// #sk_omnibarSearchArea input {
//     font-size: 10px;
// }
.sk_theme .omnibar_visitcount {
    // font-size: 9px;
    font-weight: bold;
}
body {
    font-family: "Fira Code", Consolas, "Liberation Mono", Menlo, Courier, monospace;
    // font-size: 10px;
}
kbd {
    font: 11px "Fira Code", Consolas, "Liberation Mono", Menlo, Courier, monospace;
}
// #sk_omnibarSearchArea .prompt, #sk_omnibarSearchArea .resultPage {
//     font-size: 10px;
// }
.sk_theme {
    background: #000000;
    color: #50fa7b;
}
.sk_theme tbody {
    color: #50fa7b;
}
.sk_theme input {
    color: #50fa7b;
}
.sk_theme .url {
    color: #6272a4;
}
#sk_omnibarSearchResult>ul>li {
    background: #000000;
}
#sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #000000;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #000000;
}
.sk_theme .annotation {
    color: #6272a4;
}
.sk_theme .focused {
    background: #44475a !important;
}
.sk_theme kbd {
    background: #000000;
    color: #50fa7b;
}
.sk_theme .frame {
    background: #8178DE9E;
}
.sk_theme .omnibar_highlight {
    color: #8be9fd;
}
.sk_theme .omnibar_folder {
    color: #ff79c6;
}
.sk_theme .omnibar_timestamp {
    color: #bd93f9;
}
.sk_theme .omnibar_visitcount {
    color: #f1fa8c;
}

.sk_theme .prompt, .sk_theme .resultPage {
    color: #50fab7;
}
.sk_theme .feature_name {
    color: #ff5555;
}
.sk_omnibar_middle #sk_omnibarSearchArea {
    border-bottom: 1px solid #000000;
}
#sk_status {
    border: 1px solid #000000;
}
#sk_richKeystroke {
    background: #000000;
    box-shadow: 0px 2px 10px rgba(40, 42, 54, 0.8);
}
#sk_richKeystroke kbd>.candidates {
    color: #ff5555;
}
#sk_keystroke {
    background-color: #000000;
    color: #f8f8f2;
}
kbd {
    border: solid 1px #f8f8f2;
    border-bottom-color: #f8f8f2;
    box-shadow: inset 0 -1px 0 #f8f8f2;
}
#sk_frame {
    border: 4px solid #ff5555;
    background: #8178DE9E;
    box-shadow: 0px 0px 10px #DA3C0DCC;
}
#sk_banner {
    border: 1px solid #000000;
    background: rgb(68, 71, 90);
}
div.sk_tabs_bg {
    background: #000000;
}
div.sk_tab {
    background: #000000;
}
div.sk_tab_title {
    color: #50fa7b;
}
div.sk_tab_url {
    color: #8be9fd;
}
div.sk_tab_hint {
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f1fa8c), color-stop(100%,#ffb86c));
    color: #000000;
    border: solid 1px #000000;
}
#sk_bubble {
    border: 1px solid #000000;
    color: #50fa7b;
    background-color: #000000;
}
#sk_bubble * {
    color: #000000 !important;
}
div.sk_arrow[dir=down]>div:nth-of-type(1) {
    border-top: 12px solid #f8f8f2;
}
div.sk_arrow[dir=up]>div:nth-of-type(1) {
    border-bottom: 12px solid #f8f8f2;
}
div.sk_arrow[dir=down]>div:nth-of-type(2) {
    border-top: 10px solid #f8f8f2;
}
div.sk_arrow[dir=up]>div:nth-of-type(2) {
    border-bottom: 10px solid #f8f8f2;
}
#sk_omnibar {
    width: 60%;
    left: 20%;
}

#sk_editor {
    background: #000000 !important;
    color: #15A95C;
}
.ace_gutter {
    background: #000000 !important;
}
.ace_gutter-cell {
    background: #000000 !important;
}
.ace_cursor {
    color: #ffffff !important;
}

}`;
