#!/bin/bash
# Create submission script for UMLT Assignment 3
echo "Creating submission zip for UMLT Assignment 3..."

# Check if all required files exist
required_files=(
    "UMLT_A3_2025.ipynb"
    "best_dnn_bn_model.keras"
    "best_dnn_selu_model.keras"
    "best_dnn_bn_perf_model.keras"
    "best_mobilenet_model.keras"
    "history1"
    "history2"
    "history1_perf"
    "historymb"
    "sign_mnist_train.csv"
    "sign_mnist_test.csv"
    "challenge1.jpg"
)

# Check for missing files
missing_files=()
for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        missing_files+=("$file")
    fi
done

# If files are missing, report and exit
if [ ${#missing_files[@]} -ne 0 ]; then
    echo "ERROR: The following required files are missing:"
    for file in "${missing_files[@]}"; do
        echo "  - $file"
    done
    exit 1
fi

# All files exist, create the zip
echo "All required files found. Creating submission.zip..."

# Remove old submission.zip if it exists
if [ -f "submission.zip" ]; then
    rm submission.zip
    echo "Removed old submission.zip"
fi

# Create the zip file
zip submission.zip "${required_files[@]}"

echo ""
echo "✅ submission.zip created successfully!"
echo "📁 Contents:"
unzip -l submission.zip
echo ""
echo "📤 Ready to upload to Gradescope!"