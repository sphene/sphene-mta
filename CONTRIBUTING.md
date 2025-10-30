# Contributing

Sphene is a complex project written in Lua for Multi Theft Auto. This document outlines our expectations oon your contributions and best practices. Information on how to setup and run Sphene is also available.

## How to setup Sphene

**Multi Theft Auto version 1.7 is required!**  
Recommended release: https://nightly.multitheftauto.com/mtasa-1.7-untested-25556-20250911.exe

**This document assumes that you have already installed Docker and are familiar on how to use it.**  
**Building Sphene interface requires NodeJS and NPM. We recommend the latest available LTS version.**  
**On Windows, we expect you to use Git Bash or WSL2.**

### Building Sphene interface
```bash
./build.sh
```

### Configuring Sphene
Under the `/sphene` folder, copy `.env.example` and name it `.env`. This file configures Sphene's behavior. Each setting is documented within the file.

### Adding game data

#### Adding to sphene-api (SKIP_API_LOAD = 0)
If SKIP_API_LOAD is set to 0 in .env.example, which is the default behavior. You will have to add your game data files to `sphene-api`. Locate your `GTA San Andreas` installation folder and copy the following folders:
- anim
- data
- models
- text

Copy them to:  
`sphene-api/storage/cdn/data/game/san_andreas`

#### Adding to local cache (SKIP_API_LOAD = 1)
If SKIP_API_LOAD is set to 1 in .env.example, which is the default behavior. You will have to add your game data files to your local MTA resources cache. No call to `sphene-api` will be made in this scenario. This allows for faster reloading of Sphene.

Locate your `GTA San Andreas` installation folder and copy the following folders:
- anim
- data
- models
- text

Copy them to:  
`<MTA installation path>/mods/deathmatch/resources/sphene/data/game/san_andreas`

## How to run Sphene

**This document assumes that you have already installed Docker and are familiar on how to use it.**  

Simple run:  
```bash
docker compose up -d
```

You can then join your, now started, local server. You do not need to login or setup ACL for this development server. You automatically have access to admin rights. This is **NOT** meant for **production**.

## Code quality

When developing for Sphene, adhere to a similar style to the existing code. A few things to note:
- Do not add logic within opcodes themselves. Instead create and call the necessary functions from the applicable game classes.
- Do not modify our simplistic class structure. It's created for readability, but also speed. We do not accept the complex class systems that are out there.
- Make sure the linter reports no errors and warnings. PRs will not be merged if any are found.

Make sure your PRs clearly state the changes that were made, and any explanations where applicable. Ideally a corresponding issue is created beforehand.