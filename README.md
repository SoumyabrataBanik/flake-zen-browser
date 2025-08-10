# Zen Browser Nix Flake

[![Nix Flake Check](https://github.com/SoumyabrataBanik/flake-zen-browser/actions/workflows/check.yml/badge.svg)](https://github.com/SoumyabrataBanik/flake-zen-browser/actions/workflows/check.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Nix Flake for packaging the latest binary release of the Zen Browser, ensuring hardware acceleration and proper video codec support works out of the box on NixOS.

This project was created to provide a complete and robust package for the Zen Browser after encountering issues with video playback (specifically YouTube livestreams) in other available solutions. This flake solves those issues by ensuring all necessary graphics and media libraries are correctly linked.

**CURRENT VERSION: 1.14.11b**

***

## Table of Contents

- [Prerequisites](#prerequisites)
- [Quick Start: Installation on NixOS](#quick-start-installation-on-nixos)
  - [Step 1: Add the Flake as an Input](#step-1-add-the-flake-as-an-input)
  - [Step 2: Apply the Overlay](#step-2-apply-the-overlay)
  - [Step 3: Install the Package](#step-3-install-the-package)
- [Building and Running Locally](#building-and-running-locally)
- [Architecture](#architecture)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

This guide assumes you are using a Flake-based NixOS configuration. If you are new to NixOS or Flakes, please refer to the [official NixOS documentation](https://nixos.org/manual/nixos/stable/#ch-flakes) for setup instructions.

## Quick Start: Installation on NixOS

Integrating this package into your system is a three-step process: declaring the flake as a dependency, making the package available to your system, and finally, installing it.

### Step 1: Add the Flake as an Input

First, you need to tell your system's `flake.nix` (typically located at `/etc/nixos/flake.nix` or in your user's dotfiles repository) about this repository.

Add the following block to the `inputs` section of your `flake.nix`:

```nix
# /etc/nixos/flake.nix or ~/.dotfiles/flake.nix
{
  inputs = {
    # ... your other inputs like nixpkgs, home-manager, etc.
    
    # Add this input for the Zen Browser package
    zen-browser = {
      url = "github:SoumyabrataBanik/flake-zen-browser";
      # This line ensures the package is built with the same dependencies
      # as the rest of your system, preventing conflicts.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Make sure to add `zen-browser` to the function arguments here!
  outputs = { self, nixpkgs, home-manager, zen-browser, ... }@inputs: {
    # ...
  };
}
```

### Step 2: Apply the Overlay

An overlay is the cleanest way to make a custom package available throughout your system, just like any official package from nixpkgs.

Add the following inline module to your nixosConfigurations definition. This makes the package available under the name zen.

```nix
# /etc/nixos/flake.nix or ~/.dotfiles/flake.nix
{
  # ...
  outputs = { self, nixpkgs, home-manager, zen-browser, ... }@inputs: {
    nixosConfigurations.your-hostname = nixpkgs.lib.nixosSystem {
      # ... your existing system configuration ...
      modules = [
        ./configuration.nix
        # ... other modules ...

        # === Add this inline module for the overlay ===
        ({ pkgs, ... }: {
          nixpkgs.overlays = [
            (final: prev: {
              # This creates a new package named `zen` in your system's package set.
              zen = zen-browser.packages.${prev.system}.zen-browser;
            })
          ];
        })
      ];
    };
  };
}
```

### Step 3: Install the Package

Now that pkgs.zen is available, you can install it like any other package. The recommended method for a user application like a browser is to use Home-Manager.

##### Using Home-Manager (Recommended)

In your home.nix or related Home-Manager file, add zen to your home.packages list.

```nix
# e.g., ~/.dotfiles/home/packages.nix
{ pkgs, ... }:
{
  # ... other home-manager settings ...

  home.packages = with pkgs; [
    # ... your other packages ...
    
    # Add your magnificent creation!
    zen
  ];
}
```

##### Using System-Wide Configuration (Alternative)

Alternatively, you can install it for all users on the system by adding it to environment.systemPackages in your configuration.nix.

```nix
# e.g., /etc/nixos/configuration.nix or ~/.dotfiles/configuration.nix
{ pkgs, ... }:
{
  # ... other system settings ...
  
  environment.systemPackages = with pkgs; [
    # ... your other system packages ...

    zen
  ];
}
```

##### Applying the changes

Finally, apply your new configuration from the root of your flake repository:

```bash
sudo nixos-rebuild switch --flake .#your-hostname
```

**Once the rebuild is complete, Zen Browser will be installed and available in your application launcher and as the zen command in your terminal.**

## Building and Running Locally

If you want to test the package without installing it on your system, you can build it directly from a local clone of this repository.

1. **Clone the Repository:**

```bash
git clone https://github.com/SoumyabrataBanik/flake-zen-browser.git
cd flake-zen-browser
```

2. **Build the package:**

This command will build the derivation and create a ./result symlink in your current directory pointing to the package in the Nix store.

```bash
nix build
```

3. **Run the browser:**

Execute the binary from the result link to test it.

```bash
./result/bin/zen
```

## Architecture

This flake is structured to be easily maintainable and extensible:

- **flake.nix:** The main entrypoint. It orchestrates the build process for all supported architectures.
- **releases.nix:** A centralized data file containing the URLs and SHA256 hashes for the latest release binaries for each architecture. To update the package to a new version, this is the primary file to edit.
- **zen-browser.nix:** A generic build template that takes the source binary and applies all necessary wrappers, hooks, and patches to make it run correctly on NixOS.

## Contributing

Contributions are welcome! If you find an issue or have a suggestion for improvement, please feel free to open an issue or submit a pull request.

When updating to a new version, please remember to update the version string and the source information in releases.nix.

## LICENSCE

This project is licensed under the MIT License.
