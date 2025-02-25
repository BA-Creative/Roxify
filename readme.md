# Summary :raised_hands:
This repo provides you with a convinient way to initialise a Shopify Dawn project, with some basic files ready to go. 

# Features
- Latest major version of [Shopify Down Theme](https://github.com/Shopify/dawn.git)
- Pre-defined `.shopifyignore` file
- Pre-defined `.gitignore` file
- Tailwind CSS v4. [Documentation](https://tailwindcss.com/docs/)
- jQuery v3. [Documentation](https://api.jquery.com/)
- Underscore.js v1.13.7. [Documentation](https://underscorejs.org/)
- Automatic asset files injection (CSS & JS)
- Pre-configured CLI commands via `npm run ...`

# Installation
This project can be downloaded by running the following command in the Terminal
```
bash <(curl -s https://raw.githubusercontent.com/BA-Creative/Roxify/main/init.sh)
```
Additionally, you may want to specify theme version you intend to download
```
bash <(curl -s https://raw.githubusercontent.com/BA-Creative/Roxify/main/init.sh) -s v15
```

# CLI Commands
After the installation, these command will be available to you
- `npm run init` - Install project dependencies, inject asset files to layout/theme.liquid, and initialise a Git repo
- `npm run connect` - Test connection to Shopify store
- `npm run dev` - Create Shopify local development
- `npm run scss` - Run SCSS watch (sources/scss to assets)
- `npm run tw:watch` - Run Tailwind watch (/sources/css/tw.css to /assets/tw.css)
- `npm run tw:build` - Run Tailwind minify (/sources/css/tw.css to /assets/tw.min.css)