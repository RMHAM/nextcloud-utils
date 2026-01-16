#!/bin/bash

# Target value for unlimited memory limit
NEW_MEMORY_LIMIT="-1" 

echo "🔍 Searching for php.ini files in /etc/ and setting memory_limit to ${NEW_MEMORY_LIMIT}..."
echo "---"

# 1. FIND AND MODIFY: Use find to locate all php.ini files in /etc and execute sed on each one.
find /etc -type f -name 'php.ini' -exec sudo sed -i \
  -e 's/^[[:space:]]*;*memory_limit[[:space:]]*=.*$/memory_limit = '"${NEW_MEMORY_LIMIT}"'/' {} \;

echo "✅ Configuration changes applied."
echo "---"

# 2. VERIFY CHANGES: 
#    - Find the files again and use -print0 to handle spaces in filenames safely.
#    - Use xargs -0 to pass the list of files to grep.
echo "📝 Verifying new memory_limit setting (${NEW_MEMORY_LIMIT}) in modified files:"

sudo find /etc -type f -name 'php.ini' -print0 | xargs -0 grep "memory_limit = ${NEW_MEMORY_LIMIT}"

echo ""
echo "---"
echo "🔄 **REMEMBER TO RESTART:** You must restart your PHP handler (e.g., Apache or PHP-FPM) for changes to take effect."
echo "Example restart commands:"
echo "  sudo systemctl restart apache2"
echo "  sudo systemctl restart phpX.Y-fpm (replace X.Y with your PHP version, e.g., 8.2)"
