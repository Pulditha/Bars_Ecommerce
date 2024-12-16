import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    server: {
        host: 'localhost', // Allow access via localhost
        port: 5173,        // Match the default Vite dev server port
        watch: {
            usePolling: true, // Use polling to detect file changes (useful in some environments)
        },
    },
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true, // Automatically refresh the browser on changes
        }),
    ],
});
