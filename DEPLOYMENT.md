# Deployment Guide

## Environment Variables Setup

This application uses environment variables to securely manage sensitive configuration like API keys.

### For GoDaddy Shared Hosting (Current Deployment)

1. **Create .env file locally:**

    ```bash
    # In your project root (same level as package.json)
    GOOGLE_MAPS_API_KEY=your-actual-google-maps-api-key-here
    ```

2. **Build and deploy:**

    ```bash
    # Locally, run:
    npm run build:prod

    # Then upload ONLY the dist/ folder contents to your public_html directory
    # The .env file stays local - never upload it to the server
    ```

### Environment Variables Used

-   `GOOGLE_MAPS_API_KEY` - Your Google Maps API key for map functionality

### Build Process

The build process automatically:

1. Reads environment variables from `.env` file
2. Injects them into `environment.prod.ts`
3. Builds the application with the injected values

### Security Notes

-   The `.env` file is gitignored and never committed to the repository
-   API keys are only present in the built files, not in source code
-   Development uses placeholder values that don't work in production

### Troubleshooting

If maps aren't loading:

1. Verify `.env` file exists on server with correct API key
2. Check that the API key has the necessary permissions
3. Ensure the API key is enabled for your domain
