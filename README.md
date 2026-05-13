# ublue-gamfam

This repository builds Universal Blue images customised for various use cases. Currently all images are based on Bazzite.

These images are designed for use with [bootc](https://github.com/bootc-dev/bootc).

## Instructions

Watch this video for some background.

[![Video Tutorial](https://img.youtube.com/vi/IxBl11Zmq5w/0.jpg)](https://www.youtube.com/watch?v=IxBl11Zmq5wE)

### Step 0: Install your chosen Universal Blue image normally

Use the downloadable ISO and follow the upstream instructions for getting it installed normally. These images are only designed to be used after installation is complete.

### Step 1: Initialise the repository

Generate a new repo based on [this template](https://github.com/ublue-os/image-template/).

Make sure to enable GitHub Actions, and clone the repo.

To test building an image, run `auto/build`.

### Step 2: Prepare to sign your container images

Cosign should already be installed by default in your Universal Blue environment.

Generate a new Cosign key pair. The signing key will not work if it is password protected, because it'll be used in a headless environment (GitHub Actions).

```shell
COSIGN_PASSWORD="" cosign generate-key-pair
```

> [!WARNING]
> Be careful to *never* accidentally commit `cosign.key` into your git repo. If this key goes out to the public, the security of your repository is compromised.

Next, you need to add the key to GitHub. This makes use of GitHub's secret signing system. Create a new repository secret named `SIGNING_SECRET`, and feed it the contents of `cosign.key`.

Using the CLI:

```shell
gh secret set SIGNING_SECRET < cosign.key
```

### Step 3: Choose your base image

Take a look at the following URL for a list of available Universal Blue images.

https://github.com/orgs/ublue-os/packages

### Step 4: Switch to your image

From your bootc system, run the following command:

```shell
sudo bootc switch ghcr.io/<username>/<image-name>
```

This should queue your image for the next reboot, which you can do immediately after the command finishes.

Congratulations! You have officially set up your custom image!

## Additional resources

If you have questions about this template after following the instructions, try the following spaces:

- [Universal Blue Forums](https://universal-blue.discourse.group/)
- [Universal Blue Discord](https://discord.gg/WEu6BdFEtp)
- [bootc discussion forums](https://github.com/bootc-dev/bootc/discussions) - This is not a Universal Blue managed space, but is an excellent resource if you run into issues with building bootc images.

For additional driver support, ublue maintains a set of scripts and container images available at [ublue-akmod](https://github.com/ublue-os/akmods). These images include the necessary scripts to install multiple kernel drivers within the container (Nvidia, OpenRazer, Framework...). The documentation provides guidance on how to properly integrate these drivers into your container image.

### Community Examples

These are images derived from this template (or similar enough to this template). Reference them when building your image!

- [m2Giles' OS](https://github.com/m2giles/m2os)
- [bOS](https://github.com/bsherman/bos)
- [Homer](https://github.com/bketelsen/homer/)
- [Amy OS](https://github.com/astrovm/amyos)
- [VeneOS](https://github.com/Venefilyn/veneos)
