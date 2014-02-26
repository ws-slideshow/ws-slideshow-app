angular.module('wsss.test', [

])

.factory('MockFactory', [
  '$log'
  (
    $log
  ) ->

    xmlData: ->
      '''
      <?xml version='1.0' encoding='UTF-8' standalone='yes'?>
      <!--******************************************************************

      Erstellt mit dem WS-Slideshow Konfigurator v.2.1
      http://www.ws-slideshow.com/de/configurator.php

      *********************************************************************-->
      <slideshow configurator="2.1">
        <preferences sec="4" startViewID="1" autoStart="false" hideBar="false" preventFullScreen="false" themeColor="0x00C8FA" bgColor="0x000000" bgAlpha="100" height="600" width="800" slideEffect="random" saveSlide="false" thumbSize="60" thumbsBgColor="0x000000" thumbsBorderColor="0x00CCFF" soundAutoPlay="false" soundPath="" descriptionAlign="top" descriptionBgColor="0x000000" descriptionBgAlpha="40" albumDescriptionTxtColor="0xFFFFFF" albumDescriptionTxtHoverColor="0x000000" albumDescriptionBgColor="0xFFFFFF"/>
        <albums random="false">
          <album slidePath="slides/album1/" thumbPath="thumbs/album1/">
            <description><![CDATA[Album 1]]></description>
            <slides>
              <slide name="0.jpg" thumbName="thumb_0.jpg"><![CDATA[First slide image]]></slide>
              <slide name="1.jpg" thumbName="thumb_1.jpg"/>
              <slide name="2.jpg" thumbName="thumb_2.jpg"/>
            </slides>
          </album>
          <album slidePath="slides/album2/" thumbPath="slides/album2/">
            <description><![CDATA[Album 2]]></description>
            <slides>
              <slide name="3.png" thumbName="thumb_3.jpg"/>
              <slide name="4.jpg" thumbName="thumb_4.jpg"/>
              <slide name="5.jpg" thumbName="thumb_5.jpg"/>
              <slide name="6.jpg" thumbName="thumb_6.jpg"/>
              <slide name="7.jpg" thumbName="thumb_7.jpg"/>
            </slides>
          </album>
        </albums>
      </slideshow>
      '''


    getJSONData: ->
      preferences:
        sec: 4
        startViewID: 1
        autoStart: false
        hideBar: true
        preventFullScreen: false
        themeColor: "0x00C8FA"
        bgColor: "0x000000"
        bgAlpha: 100
        height: 600
        width: 800
        slideEffect: "random"
        saveSlide: false
        thumbSize: 60
        iconWidth: 48
        iconHeight: 40
        thumbsBgColor: "0x000000"
        thumbsBorderColor: "0x00CCFF"
        soundAutoPlay: false
        soundPath: ""
        descriptionAlign: "top"
        descriptionBgColor: "0x000000"
        descriptionBgAlpha: 40
        albumDescriptionTxtColor: "0xFFFFFF"
        albumDescriptionTxtHoverColor: "0x000000"
        albumDescriptionBgColor: "0xFFFFFF"
      albums: [
        {
          slidePath: "slides/amrum/"
          thumbPath: "slides/amrum/"
          description: "Amrum - North Sea (Germany) // Amrum - Nordsee"
          slides: [
            {
              name: "18.jpg"
              thumbName: "thumb_18.jpg"
            }
            {
              name: "0.jpg"
              thumbName: "thumb_0.jpg"
            }
            {
              name: "1.jpg"
              thumbName: "thumb_1.jpg"
            }
            {
              name: "2.jpg"
              thumbName: "thumb_2.jpg"
            }
          ]
        }
        {
          slidePath: "slides/amrum/"
          thumbPath: "slides/amrum/"
          description: "Damp - Baltic Sea (Germany) // Damp - Ostsee"
          slides: [
            {
              name: "8.jpg"
              thumbName: "thumb_8.jpg"
              description: "Damp - Baltic Sea (Germany) // Damp - Ostsee"
            }
            {
              name: "9.jpg"
              thumbName: "thumb_9.jpg"
            }
            {
              name: "2.jpg"
              thumbName: "thumb_2.jpg"
            }
            {
              name: "3.jpg"
              thumbName: "thumb_3.jpg"
            }
            {
              name: "4.jpg"
              thumbName: "thumb_4.jpg"
            }
          ]
        }
      ]

])