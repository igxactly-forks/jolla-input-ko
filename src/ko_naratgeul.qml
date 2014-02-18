// Copyright (C) 2014 Park Shinjo.
// Based on en.qml

import QtQuick 2.0
import Sailfish.Silica 1.0 as Silica
import "ko_common"
import ".."

KeyboardLayout {
    id: main
    portraitMode: true
    width: geometry.keyboardWidthPortrait
    height: 4 * geometry. keyHeightPortrait
    
    type: "korean"
    
    KoNaratgeulInputHandler {
        id: koNaratgeulInputHandler
    }
    
    Component.onCompleted: init()
    
    Connections {
        target: keyboard
        onInputHandlerChanged: handlerChanged()
    }
    
    function init() {
        // force onInputHandlerChanged signal by
        // making sure that the input handler was not
        // previously pasteInputHandler
        if (keyboard.allowLayoutChanges) {
            var oldHandler = keyboard.inputHandler
            keyboard.inputHandler = xt9Handler.item
            oldHandler.active = false
            keyboard.inputHandler.active = true
        }
    }
    
    function handlerChanged() {
        if (keyboard.allowLayoutChanges && keyboard.inputHandler == pasteInputHandler &&
                canvas.layoutRow.layout != null && canvas.layoutRow.layout.type == type) {
            var oldHandler = keyboard.inputHandler
            keyboard.inputHandler = koNaratgeulInputHandler
            oldHandler.active = false
            koNaratgeulInputHandler.active = true
        }
    }
    
    KeyboardRow {
        CharacterKey {
            width: main.width / 5
            height: geometry.keyHeightPortrait
            enabled: Silica.Clipboard.hasText
            opacity: enabled ? (pressed ? 0.6 : 1.0)
                             : 0.3
            key: Qt.Key_Paste
            
            Image {
                anchors.centerIn: parent
                source: "image://theme/icon-m-clipboard?"
                        + (parent.pressed ? Silica.Theme.highlightColor : Silica.Theme.primaryColor)
            }
        }
        CharacterKey {
            caption: "ㄱ"; captionShifted: "1"; symView: "("; symView2: "{"; 
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        CharacterKey {
            caption: "ㄴ"; captionShifted: "2"; symView: ")"; symView2: "}"
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        CharacterKey {
            caption: "ㅏㅓ"; captionShifted: "3"; symView: "!"; symView2: "$"
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        SymbolKey {
            caption: keyboard.inSymView ? "한글" : "기호" // symbols/hangul
            width: main.width / 5
            height: geometry.keyHeightPortrait
            separator: false
        }
    }

    KeyboardRow {
        ContextAwareCommaKey {
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        CharacterKey {
            caption: "ㄹ"; captionShifted: "4"; symView: "<"; symView2: "["
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        CharacterKey {
            caption: "ㅁ"; captionShifted: "5"; symView: ">"; symView2: "]"
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        CharacterKey {
            caption: "ㅗㅜ"; captionShifted: "6"; symView: "?"; symView2: "₩"
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        SpacebarKey {
            width: main.width / 5
            height: geometry.keyHeightPortrait
            separator: false
        }
    }

    KeyboardRow {
        CharacterKey {
            caption: "."; captionShifted: "."; symView: "."; symView2: "."
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        CharacterKey {
            caption: "ㅅ"; captionShifted: "7"; symView: "#"; symView2: "^"
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        CharacterKey {
            caption: "ㅇ"; captionShifted: "8"; symView: "+"; symView2: "="
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        CharacterKey {
            caption: "ㅣ"; captionShifted: "9"; symView: "-"; symView2: "_"
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        BackspaceKey {
            width: main.width / 5
            height: geometry.keyHeightPortrait
            separator: false
        }
    }

    KeyboardRow {
        ShiftKey {
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        CharacterKey {
            caption: "획추가"; captionShifted: "*"; symView: "@"; symView2: "\""
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        CharacterKey {
            caption: "ㅡ"; captionShifted: "0"; symView: "&"; symView2: "~" 
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        CharacterKey { 
            caption: "쌍자음"; captionShifted: "#"; symView: ":"; symView2: ";"
            width: main.width / 5
            height: geometry.keyHeightPortrait
        }
        EnterKey {
            width: main.width / 5
            height: geometry.keyHeightPortrait
            separator: false
        }
    }

}