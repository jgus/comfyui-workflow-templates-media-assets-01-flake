{
  description = "Media assets bundle 01 for ComfyUI workflow templates";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-lib = {
      url = "github:jgus/flake-lib/v1";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-lib }:
    flake-lib.lib.mkLeafFlake {
      inherit nixpkgs flake-utils;
      source = { type = "pypi"; pname = "comfyui_workflow_templates_media_assets_01"; format = "sdist"; };
      package = {
        attr = "comfyui-workflow-templates-media-assets-01";
        description = "Media assets bundle 01 for ComfyUI workflow templates";
        extra = { pythonImportsCheck = [ "comfyui_workflow_templates_media_assets_01" ]; };
      };
      pin = import ./pin.nix;
    };
}
