#!/bin/bash

echo "Running automated application test..."

if [ -f "app/index.html" ]; then
    echo "Test Passed: index.html exists."
else
    echo "Test Failed: index.html not found."
    exit 1
fi

if grep -q "Advanced CI/CD Pipeline" app/index.html; then
    echo "Test Passed: Application content verified."
else
    echo "Test Failed: Expected application content not found."
    exit 1
fi

echo "All automated tests passed successfully."
