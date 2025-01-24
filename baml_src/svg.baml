class SVG {
  svg string
}

class Animation {
  scenes Scene[]
}

class Scene {
  layout string
  elements Element[]
}

class Element {
  description string @description("a description of the element, type of object, image, icon, text content, etc")
  position string @description("where the element is positioned in the scene")
  style string? @description("the style of the element, color, font, size, etc")
}

template_string PrintAnimation(animation: Animation) #"
  <animation>

  {% for scene in animation.scenes %}
  <scene>
    <layout>{{ scene.layout }}</layout>
    {% for element in scene.elements %}
    <element position="{{ element.position }}" style="{{ element.style }}">{{ element.description }}</element>
    {% endfor %}
  </scene>
  {% endfor %}
  </animation>
"#

template_string Prompt(animation: Animation) ##"
    {{ _.role("system") }}
    You are a helpful assistant. You generate 
    animated svgs based on a user prompt

    all elments in a scene should fade in together

    when rendering changes, and fading out
    elements that are no longer in the scene,
    dont fade out any elements that are still in the scene


    here is an example of a very simple output svg


    INPUT: 

<animation>
  <scene>
    <layout>dark blue background</layout>
    <element>A white box with the word agent inside. Rounded corners.</element>
 </scene>
 <scene>
    <layout>dark blue background</layout>
    <element>A white box with the word agent inside. Rounded corners.</element>
    <element>text to the right of the agent box "thinking..."</element>
 </scene>
 <scene>
    <layout>dark blue background</layout>
    <element>A white box with the word agent inside. Rounded corners.</element>
    <element>text to the right of the agent box "thinking..."</element>
    <element>text under the thinking text "we need to respond to inbound messages"</element>
 </scene>
</animation>

    OUTPUT:

<svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 526.9322280883789 123.92578125" width="1053.8644561767578" height="247.8515625">
  <!-- svg-source:excalidraw -->
  
  <defs>
    <style class="style-fonts">
      @font-face {
        font-family: "Virgil";
        src: url("https://unpkg.com/@excalidraw/excalidraw@0.15.2/dist/excalidraw-assets/Virgil.woff2");
      }
      @font-face {
        font-family: "Cascadia";
        src: url("https://unpkg.com/@excalidraw/excalidraw@0.15.2/dist/excalidraw-assets/Cascadia.woff2");
      }
    </style>
  <path id="pathForText1"/><path id="pathForText2"/></defs>
  <rect x="0" y="0" width="526.9322280883789" height="123.92578125" fill="#ffffff"/><g stroke-linecap="round" transform="translate(30 30.53125) rotate(0 76.900390625 31.697265625)"><path d="M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 " stroke="#1971c2" stroke-width="1" fill="none" opacity="0"><animate attributeName="d" from="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 25.84, 153.8 35.83, 153.8 47.55 M153.8 15.85 C153.8 27.02, 153.8 38.19, 153.8 47.55 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M137.95 63.39 C110.7 63.39, 83.46 63.39, 15.85 63.39 M137.95 63.39 C101.43 63.39, 64.91 63.39, 15.85 63.39 M15.85 63.39 C5.28 63.39, 0 58.11, 0 47.55 M15.85 63.39 C5.28 63.39, 0 58.11, 0 47.55 M0 47.55 C0 38.17, 0 28.8, 0 15.85 M0 47.55 C0 36.47, 0 25.4, 0 15.85 M0 15.85 C0 15.85, 0 15.85, 0 15.85 M0 15.85 C0 15.85, 0 15.85, 0 15.85 " to="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 25.84, 153.8 35.83, 153.8 47.55 M153.8 15.85 C153.8 27.02, 153.8 38.19, 153.8 47.55 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M137.95 63.39 C110.7 63.39, 83.46 63.39, 15.85 63.39 M137.95 63.39 C101.43 63.39, 64.91 63.39, 15.85 63.39 M15.85 63.39 C5.28 63.39, 0 58.11, 0 47.55 M15.85 63.39 C5.28 63.39, 0 58.11, 0 47.55 M0 47.55 C0 38.17, 0 28.8, 0 15.85 M0 47.55 C0 36.47, 0 25.4, 0 15.85 M0 15.85 C0 5.28, 5.28 0, 15.85 0 M0 15.85 C0 5.28, 5.28 0, 15.85 0" begin="1437.5ms" dur="62.5ms" fill="freeze"/><animate attributeName="d" from="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 25.84, 153.8 35.83, 153.8 47.55 M153.8 15.85 C153.8 27.02, 153.8 38.19, 153.8 47.55 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M137.95 63.39 C110.7 63.39, 83.46 63.39, 15.85 63.39 M137.95 63.39 C101.43 63.39, 64.91 63.39, 15.85 63.39 M15.85 63.39 C5.28 63.39, 0 58.11, 0 47.55 M15.85 63.39 C5.28 63.39, 0 58.11, 0 47.55 M0 47.55 C0 47.55, 0 47.55, 0 47.55 M0 47.55 C0 47.55, 0 47.55, 0 47.55 M0 47.55 C0 47.55, 0 47.55, 0 47.55 M0 47.55 C0 47.55, 0 47.55, 0 47.55 " to="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 25.84, 153.8 35.83, 153.8 47.55 M153.8 15.85 C153.8 27.02, 153.8 38.19, 153.8 47.55 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M137.95 63.39 C110.7 63.39, 83.46 63.39, 15.85 63.39 M137.95 63.39 C101.43 63.39, 64.91 63.39, 15.85 63.39 M15.85 63.39 C5.28 63.39, 0 58.11, 0 47.55 M15.85 63.39 C5.28 63.39, 0 58.11, 0 47.55 M0 47.55 C0 38.17, 0 28.8, 0 15.85 M0 47.55 C0 36.47, 0 25.4, 0 15.85 M0 15.85 C0 15.85, 0 15.85, 0 15.85 M0 15.85 C0 15.85, 0 15.85, 0 15.85 " begin="1375ms" dur="62.5ms" fill="freeze"/><animate attributeName="d" from="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 25.84, 153.8 35.83, 153.8 47.55 M153.8 15.85 C153.8 27.02, 153.8 38.19, 153.8 47.55 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M137.95 63.39 C110.7 63.39, 83.46 63.39, 15.85 63.39 M137.95 63.39 C101.43 63.39, 64.91 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 " to="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 25.84, 153.8 35.83, 153.8 47.55 M153.8 15.85 C153.8 27.02, 153.8 38.19, 153.8 47.55 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M137.95 63.39 C110.7 63.39, 83.46 63.39, 15.85 63.39 M137.95 63.39 C101.43 63.39, 64.91 63.39, 15.85 63.39 M15.85 63.39 C5.28 63.39, 0 58.11, 0 47.55 M15.85 63.39 C5.28 63.39, 0 58.11, 0 47.55 M0 47.55 C0 47.55, 0 47.55, 0 47.55 M0 47.55 C0 47.55, 0 47.55, 0 47.55 M0 47.55 C0 47.55, 0 47.55, 0 47.55 M0 47.55 C0 47.55, 0 47.55, 0 47.55 " begin="1312.5ms" dur="62.5ms" fill="freeze"/><animate attributeName="d" from="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 25.84, 153.8 35.83, 153.8 47.55 M153.8 15.85 C153.8 27.02, 153.8 38.19, 153.8 47.55 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 " to="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 25.84, 153.8 35.83, 153.8 47.55 M153.8 15.85 C153.8 27.02, 153.8 38.19, 153.8 47.55 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M137.95 63.39 C110.7 63.39, 83.46 63.39, 15.85 63.39 M137.95 63.39 C101.43 63.39, 64.91 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 M15.85 63.39 C15.85 63.39, 15.85 63.39, 15.85 63.39 " begin="1250ms" dur="62.5ms" fill="freeze"/><animate attributeName="d" from="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 25.84, 153.8 35.83, 153.8 47.55 M153.8 15.85 C153.8 27.02, 153.8 38.19, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 " to="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 25.84, 153.8 35.83, 153.8 47.55 M153.8 15.85 C153.8 27.02, 153.8 38.19, 153.8 47.55 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M153.8 47.55 C153.8 58.11, 148.52 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 M137.95 63.39 C137.95 63.39, 137.95 63.39, 137.95 63.39 " begin="1187.5ms" dur="62.5ms" fill="freeze"/><animate attributeName="d" from="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 " to="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 25.84, 153.8 35.83, 153.8 47.55 M153.8 15.85 C153.8 27.02, 153.8 38.19, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 M153.8 47.55 C153.8 47.55, 153.8 47.55, 153.8 47.55 " begin="1125ms" dur="62.5ms" fill="freeze"/><animate attributeName="d" from="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 " to="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M137.95 0 C148.52 0, 153.8 5.28, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 M153.8 15.85 C153.8 15.85, 153.8 15.85, 153.8 15.85 " begin="1062.5ms" dur="62.5ms" fill="freeze"/><animate attributeName="d" from="M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 M15.85 0 C15.85 0, 15.85 0, 15.85 0 " to="M15.85 0 C50.75 0, 85.65 0, 137.95 0 M15.85 0 C61.34 0, 106.83 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 M137.95 0 C137.95 0, 137.95 0, 137.95 0 " begin="1000ms" dur="62.5ms" fill="freeze"/><animate attributeName="opacity" from="1" to="1" begin="1000ms" dur="500ms" fill="freeze"/></path></g><g transform="translate(89.576171875 52.228515625) rotate(0 17.32421875 10)"><text x="17.32421875" y="0" font-family="Excalifont, Segoe UI Emoji" font-size="16px" fill="#1971c2" text-anchor="middle" style="white-space: pre;" direction="ltr" dominant-baseline="text-before-edge" opacity="0.0">agent<animate attributeName="opacity" from="0.0" to="1.0" begin="1500ms" dur="500ms" fill="freeze"/></text></g><g transform="translate(232.45703125 30) rotate(0 32.66796875 10)"><text x="0" y="0" font-family="Excalifont, Segoe UI Emoji" font-size="16px" fill="#1971c2" text-anchor="start" style="white-space: pre;" direction="ltr" dominant-baseline="text-before-edge" opacity="0.0"> thinking...<animate attributeName="opacity" from="0.0" to="1.0" begin="2000ms" dur="500ms" fill="freeze"/></text></g><g transform="translate(235.6509780883789 59.13671875) rotate(0 130.640625 10)"><text x="0" y="0" font-family="Excalifont, Segoe UI Emoji" font-size="16px" fill="#1971c2" text-anchor="start" style="white-space: pre;" direction="ltr" dominant-baseline="text-before-edge" opacity="0.0"> we need to respond to inbound messages<animate attributeName="opacity" from="0.0" to="1.0" begin="2500ms" dur="500ms" fill="freeze"/></text></g></svg>

    {{ _.role("user") }}
     
     Here's the animation to create

     {{PrintAnimation(animation)}}
"##


function RenderAnimation(animation: Animation) -> string {
  client O1
  prompt ##"
     {{Prompt(animation)}}
     {{ ctx.output_format }}

  "##
}

function RenderAnimationStructured(animation: Animation) -> SVG {
  client O1
  prompt #"
     {{Prompt(animation)}}
     {{ ctx.output_format }}

  "#
}

test ThreeElements {
  functions [RenderAnimation]
  args {
    animation {
        scenes [
            {
                layout "dark blue background"
                elements [
                  {
                    description "white box with rounded corners containing text 'agent'"
                    position "center"
                    style "rounded"
                  }
                ]
            }
            {
                layout "dark blue background"
                elements [
                    {
                        description "white box with rounded corners containing text 'agent'"
                        position "center"
                        style "rounded"
                    }
                    {
                        description "text saying 'thinking...'"
                        position "right of agent"
                        style "normal"
                    }
                ]
            }
            {
                layout "dark blue background"
                elements [
                    {
                        description "white box with rounded corners containing text 'agent'"
                        position "center"
                        style "rounded"
                    }
                    {
                        description "text saying 'thinking...'"
                        position "right of agent"
                        style "normal"
                    }
                    {
                        description "text saying 'we need to respond to inbound messages'"
                        position "below thinking"
                        style "normal"
                    }
                ]
            }
        ]
    }
  }
}


test FadeInOut {
  functions [RenderAnimation]
  args {
    animation {
        scenes [
            {
                layout "dark blue background"
                elements [
                    {
                        description "white box with rounded corners containing text 'agent'"
                        position "center"
                        style "rounded"
                    }
                ]
            }
            {
                layout "dark blue background" 
                elements [
                    {
                        description "white box with rounded corners containing text 'agent'"
                        position "center"
                        style "rounded"
                    }
                    {
                        description "text saying 'thinking...'"
                        position "right of agent"
                        style "normal"
                    }
                ]
            }
            {
                layout "dark blue background"
                elements [
                    {
                        description "white box with rounded corners containing text 'agent'"
                        position "center"
                        style "rounded"
                    }
                    {
                        description "text saying 'thinking...'"
                        position "right of agent"
                        style "normal"
                    }
                    {
                        description "text saying 'we need to respond to inbound messages'"
                        position "below thinking"
                        style "normal"
                    }
                ]
            }
            {
                layout "dark indigo background"
                elements [
                    {
                        description "white box with rounded corners containing text 'agent'"
                        position "center"
                        style "rounded"
                    }
                    {
                        description "text saying 'thinking...'"
                        position "right of agent"
                        style "normal"
                    }
                    {
                        description "text saying 'we need to respond to inbound messages'"
                        position "below thinking"
                        style "normal"
                    }
                    {
                        description "text saying 'hello from o1'"
                        position "below we need to respond to inbound messages"
                        style "normal"
                    }
                ]
            }
            {
                layout "dark indigo background"
                elements [
                    {
                        description "text saying 'hello from o1'"
                        position "below we need to respond to inbound messages"
                        style "normal"
                    }
                ]
            }
        ]
    }
  }
}


function PictureToScene(picture: image, currentAnimation: Animation) -> Scene {
  client GPT4o
  prompt #"
    {{ _.role("system") }}

    you are an expert at extracting scenes from images.

    You will be given previous scenes extracted from similar images,
    if there are repeat elements across scenes, try to
    use the same element across scenes (maybe will small changes to position like "animate-up")


    EXAMPLE if the previous scene starts with

 .  {
      layout "dark background digital display"
      elements [
        {
          description "Profile icon with abstract design"
          position "left side"
          style "multicolored with pastel shades"
        }
        {
          description "Text: 'Agent'"
          position "center-left"
          style "white font, medium size"
        }
        {
          description "Text: '7am — Initiate hourly tasks'"
          position "middle"
          style "light gray font, small size"
        }

    Then the next scene should probably start with

    {
      layout "dark background digital display"
      elements [
        {
          description "Profile icon with abstract design"
          position "left side"
          style "multicolored with pastel shades"
        }
        {
          description "Text: 'Agent'"
          position "center-left"
          style "white font, medium size"
        }
        {
          description "Text: '7am — Initiate hourly tasks'"
          position "middle"
          style "light gray font, small size"
        }

    but only if the new scene actually contains those elements
    
    

    {{ _.role("user") }}

    Here are the previous scenes extracted

    {{ PrintAnimation(currentAnimation) }}

    Extract from this image:

    {{ picture }}

    {{ ctx.output_format}}
    "#

}

test TestExtractScene {
  functions [PictureToScene]
  args {
    picture {
      file "../test-images/agent-warmup.png"
    }
  }
}


test TestExtractSceneWithPrevious {
  functions [PictureToScene]
  args {
    picture {
      file "../test-images/agent-warmup.png"
    }
    previous_scenes [
    {
      layout "dark background digital display"
      elements [
        {
          description "Profile icon with abstract design"
          position "left side"
          style "multicolored with pastel shades"
        }
        {
          description "Text: 'Agent'"
          position "center-left"
          style "white font, medium size"
        }
        {
          description "Text: '7am — Initiate hourly tasks'"
          position "middle"
          style "light gray font, small size"
        }
        {
          description "Speech bubble icon"
          position "middle left"
          style "monochrome, small size"
        }
        {
          description "Text: 'I need to check emails to see which ones need responses'"
          position "middle"
          style "white font, medium size"
        }
        {
          description "Clock icon"
          position "right edge"
          style "monochrome, small size"
        }
        {
          description "Cloud icon"
          position "right edge"
          style "monochrome, small size below clock icon"
        }
      ]
    }
    ]
  }
}


function FixSVG(svg: SVG, error: string) -> SVG {
  client O1
  prompt #"
    {{ _.role("system") }}

    you are an expert at fixing SVGs

    {{ _.role("user") }}


    Here is the error:

    {{ error }}

    Here is the SVG:

    {{ svg }}

    Can you please fix the SVG based on the error? Think deeply about it.

    {{ ctx.output_format }}
  "#
}