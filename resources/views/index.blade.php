@php
$config = [
    'appName' => config('app.name'),
    'locale' => $locale = app()->getLocale(),
    'locales' => config('app.locales'),
    'githubAuth' => config('services.github.client_id'),
];
@endphp
<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>{{ config('app.name') }}</title>
  <link rel="stylesheet" href="{{ mix('dist/css/app.css') }}">
</head>
<body :style="{ fontFamily }">
  <div id="app"></div>

  {{-- Global configuration object --}}
  <script>
    window.config = @json($config);
    
    var userAgent = window.navigator.userAgent,
      platform = window.navigator.platform,
      macosPlatforms = ['Macintosh', 'MacIntel', 'MacPPC', 'Mac68K'],
      windowsPlatforms = ['Win32', 'Win64', 'Windows', 'WinCE'],
      iosPlatforms = ['iPhone', 'iPad', 'iPod'],
      os = null;

    if (iosPlatforms.indexOf(platform) !== -1) {
      fontFamily = 'Helvetica Neue, Helvetica, Arial, sans-serif';
    } else if (windowsPlatforms.indexOf(platform) !== -1) {
      fontFamily = 'Segoe UI, Segoe, Tahoma, Geneva, sans-serif';
    } else if (/Android/.test(userAgent)) {
      fontFamily = 'RobotoRegular, Droid Sans, sans-serif';
    }
  </script>

  {{-- Load the application scripts --}}
  <script src="{{ mix('dist/js/app.js') }}"></script>
</body>
</html>
