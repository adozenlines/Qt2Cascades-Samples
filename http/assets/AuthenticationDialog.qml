/****************************************************************************
 **
 ** Portions Copyright (C) 2012 Research In Motion Limited.
 ** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
 ** All rights reserved.
 ** Contact: Research In Motion Ltd. (http://www.rim.com/company/contact/)
 ** Contact: Nokia Corporation (qt-info@nokia.com)
 **
 ** This file is part of the examples of the BB10 Platform and is derived
 ** from a similar file that is part of the Qt Toolkit.
 **
 ** You may use this file under the terms of the BSD license as follows:
 **
 ** "Redistribution and use in source and binary forms, with or without
 ** modification, are permitted provided that the following conditions are
 ** met:
 **   * Redistributions of source code must retain the above copyright
 **     notice, this list of conditions and the following disclaimer.
 **   * Redistributions in binary form must reproduce the above copyright
 **     notice, this list of conditions and the following disclaimer in
 **     the documentation and/or other materials provided with the
 **     distribution.
 **   * Neither the name of Research In Motion, nor the name of Nokia
 **     Corporation and its Subsidiary(-ies), nor the names of its
 **     contributors may be used to endorse or promote products
 **     derived from this software without specific prior written
 **     permission.
 **
 ** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 ** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 ** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 ** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 ** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 ** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 ** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 ** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 ** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 ** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 ** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
 **
 ****************************************************************************/


import bb.cascades 1.0

// Container grouping all visual nodes for the authentication dialog
Container {
    leftPadding: 20
    topPadding: 20
    rightPadding: 20
    bottomPadding: 20

    background: Color.White

    // A standard Label
    Label {
        horizontalAlignment: HorizontalAlignment.Center

        text: qsTr ("You need a username and a password to access this site")
        textStyle {
            base: SystemDefaults.TextStyles.BodyText
            color: Color.Black
        }
    }

    // The site Label's
    Label {
        topMargin: 100
        text: qsTr ("Site: %1").arg(_authDialog.site)
        textStyle {
            base: SystemDefaults.TextStyles.BodyText
            color: Color.Black
        }
    }

    // Container grouping the user input
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        topMargin: 50

        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }

        // A standard Label
        Label {
            verticalAlignment: VerticalAlignment.Center

            text: qsTr ("User:")
            textStyle {
                base: SystemDefaults.TextStyles.BodyText
                color: Color.Black
            }
        }

        // A standard TextField
        TextField {
            id: userEdit

            verticalAlignment: VerticalAlignment.Center

            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }

            text: _authDialog.user
        }
    }

    // Container grouping the password input
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        topMargin: 10

        // A standard Label
        Label {
            verticalAlignment: VerticalAlignment.Center

            text: qsTr ("Password:")
            textStyle {
                base: SystemDefaults.TextStyles.BodyText
                color: Color.Black
            }
        }

        // A standard TextField
        TextField {
            id: passwordEdit

            verticalAlignment: VerticalAlignment.Center

            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }

            text: _authDialog.password
        }
    }

    // Container grouping the control Button's
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        topMargin: 50

        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }

        // A standard Button
        Button {
            rightMargin: 20

            text: qsTr ("OK")

            // Send authentication on click
            onClicked: _authDialog.continueAuthentication (userEdit.text, passwordEdit.text)
        }

        // A standard Button
        Button {
            text: qsTr ("Cancel")

            // Terminate authentication on click
            onClicked: _authDialog.cancel ()
        }
    }
}
