import { BamlImage } from "@boundaryml/baml/native";
import { b, Animation, Scene, Element, SVG } from "./baml_client";
import { JSDOM } from "jsdom";

const scene1: Animation = {
  scenes: [
    {
      layout: "dark blue background",
      elements: [
        {
          description:
            "A white box with the word agent inside. Rounded corners.",
          position: "middle left",
          style: "rounded corners",
        },
      ],
    },
    {
      layout: "dark blue background",
      elements: [
        {
          description:
            "A white box with the word agent inside. Rounded corners.",
          position: "middle left",
          style: "rounded corners",
        },
        {
          description: 'text to the right of the agent box "thinking..."',
          position: "middle right",
          style: "bold",
        },
      ],
    },
    {
      layout: "dark blue background",
      elements: [
        {
          description:
            "A white box with the word agent inside. Rounded corners.",
          position: "middle left",
          style: "rounded corners",
        },
        {
          description: 'text to the right of the agent box "thinking..."',
          position: "middle right",
          style: "bold",
        },
        {
          description: 'text "we need to respond to inbound messages"',
          position: "below the other text",
          style: "bold",
        },
      ],
    },
  ],
};

const images = [
  {
    path: "./test-images/agent-0.png",
  },
  {
    path: "./test-images/agent-1.png",
  },
  {
    path: "./test-images/agent-2.png",
  },
  // {
  //   path: "./test-images/agent-warmup.png",
  // },
];

async function validateAndFixSVG(output: SVG): Promise<string> {
  let workingCopy = output;
  let attempts = 0;
  const maxAttempts = 3;
  let lastError = "";

  while (attempts < maxAttempts) {
    try {
      const dom = new JSDOM();
      const parser = new dom.window.DOMParser();
      const doc = parser.parseFromString(output.svg, "image/svg+xml");
      const parserErrors = doc.getElementsByTagName("parsererror");

      if (parserErrors.length > 0) {
        const errorMessage = parserErrors[0].textContent || "Invalid SVG";
        console.log(
          `Attempt ${
            attempts + 1
          }/${maxAttempts}: SVG validation error found, attempting to fix...`,
          errorMessage
        );
        lastError = errorMessage;
        const fixed = await b.FixSVGR1(workingCopy, errorMessage);
        workingCopy = fixed; // Update output for next attempt if needed
      } else {
        return workingCopy.svg; // Valid SVG found, return immediately
      }
    } catch (error) {
      console.error(
        `Attempt ${attempts + 1}/${maxAttempts}: Error validating SVG:`,
        error
      );
      lastError = error.message;
      const fixed = await b.FixSVGR1(workingCopy, error.message);
      workingCopy = fixed; // Update output for next attempt if needed
    }

    attempts++;
  }

  // If we've exhausted all attempts, return the last attempted fix
  console.warn(
    `Failed to validate SVG after ${maxAttempts} attempts. Last error: ${lastError}`
  );
  return output.svg;
}

const main = async () => {
  const fromJson = process.argv.includes("--from-json");
  let animation: Animation;

  if (fromJson) {
    console.log("Reading animation from animation.json");
    const fs = require("fs").promises;
    const jsonData = await fs.readFile("animation.json", "utf-8");
    animation = JSON.parse(jsonData);
  } else {
    animation = { scenes: [] };
    for (const image of images) {
      console.log("processing image", image.path);
      const fs = require("fs").promises;
      const imageData = await fs.readFile(image.path);
      const base64Data = imageData.toString("base64");
      const scene = await b.PictureToScene(
        BamlImage.fromBase64("image/png", base64Data),
        animation
      );
      console.log("extracted scene", JSON.stringify(scene, null, 2));
      animation.scenes.push(scene);
    }
    const fs = require("fs").promises;
    await fs.writeFile("animation.json", JSON.stringify(animation, null, 2));
  }

  console.log(`rendering animation with ${animation.scenes.length} scenes`);
  const output = await b.RenderAnimationStructuredR1(animation);
  const validSvg = await validateAndFixSVG(output);
  await fs.writeFile("output.svg", validSvg);
  console.log("wrote to output.svg");
};

main();
