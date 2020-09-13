<h1 align="center">Welcome to react-native-sketch-signature 👋</h1>
<p align="center">
  <img src="https://img.shields.io/npm/v/react-native-sketch-signature.svg?orange=blue" />
  <a href="https://www.npmjs.com/package/react-native-sketch-signature">
    <img alt="downloads" src="https://img.shields.io/npm/dm/react-native-sketch-signature.svg?color=blue" target="_blank" />
  </a>
  <a href="https://github.com/LFMAKER/react-native-sketch-signature/blob/master/LICENSE">
    <img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-yellow.svg" target="_blank" />
  </a>
</p>

## About this

React Native library for capturing signature

User would sign on the app and when you press the save button it returns the base64 encoded png


This library is a modification of https://github.com/RepairShopr/react-native-signature-capture
-Unfortunately I had the need to modify things that would not be accepted in a pull-request, so if you want to use the core library use the one from the link mentioned.

### Preview
| IOS  |  Android |
| ------------ | ------------ |
| <img src="http://i.giphy.com/3oEduIyWb48Ws3bSuc.gif" />  |<img src="http://i.giphy.com/xT0GUKJFFkdDv25FNC.gif" />   |  |

### Install

NPM:
```sh
npm install react-native-sketch-signature --save
```
YARN:
```sh
yarn add react-native-sketch-signature 
```


## Usage

Then you can use SignatureCapture component in your react-native's App, like this:

```javascript
...
import React, {Component} from 'react';
import SignatureCapture from 'react-native-sketch-signature';

class CustomComponent extends Component {

  ...
  render() {
    return (
      <SignatureCapture
        {...someProps}
      />
    );
  }
}
```

### Properties :fa-cog:

| Name  |  Description |
| ------------ | ------------ |
|saveImageFileInExtStorage   | Make this props true, if you want to save the image file in external storage. Default is false. Warning: Image file will be visible in gallery or any other image browsing app  |
| showBorder  | If this props is made to false, it will hide the dashed border (the border is shown on iOS only).  |
| showNativeButtons  |  If this props is made to true, it will display the native buttons "Save" and "Reset". |
| showTitleLabel  | If this props is made to true, it will display the "x\_ \_ \_ \_ \_ \_ \_ \_ \_ \_ \_" placeholder indicating where to sign.  |
| viewMode  |"portrait" or "landscape" change the screen orientation based on boolean value   |
|maxSize   | sets the max size of the image maintains aspect ratio, default is 500  |
| backgroundColor  | Sets the background color of the component. Defaults to white. May be 'transparent'.  |
| strokeColor  | Sets the color of the signature. Defaults to black. |


### Methods :fa-hand-o-right:

| Name  |  Description |
| ------------ | ------------ |
|saveImage   | when called it will save the image and returns the base 64 encoded string on onSaveEvent() callback  |
| resetImage()  | when called it will clear the image on the canvas  |


### Callback Props  :fa-repeat:

| Name  |  Description |
| ------------ | ------------ |
|onSaveEvent   | Triggered when saveImage() is called, which return Base64 Encoded String and image file path. |
| onDragEvent  | Triggered when user marks his signature on the canvas. This will not be called when the user does not perform any action on canvas.  |


### Old Example - Soon an example with functional component

```javascript

var React = require("react");
var ReactNative = require("react-native");

var { Component } = React;

var { AppRegistry, StyleSheet, Text, View, TouchableHighlight } = ReactNative;

import SignatureCapture from "react-native-sketch-signature";

class RNSignatureExample extends Component {
  render() {
    return (
      <View style={{ flex: 1, flexDirection: "column" }}>
        <Text style={{ alignItems: "center", justifyContent: "center" }}>
          Signature Capture Extended{" "}
        </Text>
        <SignatureCapture
          style={[{ flex: 1 }, styles.signature]}
          ref="sign"
          onSaveEvent={this._onSaveEvent}
          onDragEvent={this._onDragEvent}
          saveImageFileInExtStorage={false}
          showNativeButtons={false}
          showTitleLabel={false}
          backgroundColor="#ff00ff"
          strokeColor="#ffffff"
          viewMode={"portrait"}
        />

        <View style={{ flex: 1, flexDirection: "row" }}>
          <TouchableHighlight
            style={styles.buttonStyle}
            onPress={() => {
              this.saveSign();
            }}
          >
            <Text>Save</Text>
          </TouchableHighlight>

          <TouchableHighlight
            style={styles.buttonStyle}
            onPress={() => {
              this.resetSign();
            }}
          >
            <Text>Reset</Text>
          </TouchableHighlight>
        </View>
      </View>
    );
  }

  saveSign() {
    this.refs["sign"].saveImage();
  }

  resetSign() {
    this.refs["sign"].resetImage();
  }

  _onSaveEvent(result) {
    //result.encoded - for the base64 encoded png
    //result.pathName - for the file path name
    console.log(result);
  }
  _onDragEvent() {
    // This callback will be called when the user enters signature
    console.log("dragged");
  }
}

const styles = StyleSheet.create({
  signature: {
    flex: 1,
    borderColor: "#000033",
    borderWidth: 1,
  },
  buttonStyle: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    height: 50,
    backgroundColor: "#eeeeee",
    margin: 10,
  },
});

AppRegistry.registerComponent("RNSignatureExample", () => RNSignatureExample);
```

---

Library used:
https://github.com/RepairShopr/react-native-signature-capture

https://github.com/jharwig/PPSSignatureView

https://github.com/gcacace/android-signaturepad
# react-native-sketch-signature
