<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use App\Http\Middleware\AdminMiddleware; // Import AdminMiddleware

// Configure the Laravel application
return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php', // Load web routes
        commands: __DIR__ . '/../routes/console.php', // Load console commands
        health: '/up' // Optional health check route
    )
    ->withMiddleware(function (Middleware $middleware) {
        // Register global middleware here if necessary
         
    })
    ->withExceptions(function (Exceptions $exceptions) {
        // Configure exception handling if needed
    })
    ->create();
