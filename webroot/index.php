<?php
$phpVersion = phpversion();
?>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Silly Development - Nginx</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
        }
    </script>
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex items-center justify-center">

    <div class="bg-gray-800 rounded-xl shadow-xl p-8 max-w-xl w-full text-center">
        <h1 class="text-3xl font-bold text-white mb-4">Webserver Correctly Installed</h1>
        <p class="text-lg text-gray-300 mb-6">Your current PHP version is:</p>
        <div class="bg-blue-600 text-white text-xl py-2 px-4 rounded mb-6 inline-block">
            <?php echo $phpVersion; ?>
        </div>
        <div class="text-green-400 text-lg font-semibold mb-6">
            Webserver correctly installed and running!
        </div>
        <footer class="text-sm text-gray-400">
            Powered by <a href="https://sillydev.co.uk" target="_blank" class="text-blue-400 hover:underline">Silly Development</a>
        </footer>
    </div>

</body>
</html>
