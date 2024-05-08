function ConvertToCSV($inputFile, $outputFile) {
    # Read input
    $lines = Get-Content -Path $inputFile

    # Initialize array for data
    $data = @()

    # Split each line into words, add to $data
    foreach ($line in $lines) {
        # Split by whitespace
        $words = $line -split '\s+'
        foreach ($word in $words) {
            # Add word as single-item array
            $data += ,@($word)
        }
    }

    # Flatten the nested arrays in $data
    $flattenedData = foreach ($row in $data) {
        # Join the elements of each row with commas
        $row -join ','
    }

    # Write data to CSV
    $flattenedData | Out-File -FilePath $outputFile -Encoding UTF8
}

#results
$inputFile = "input.txt"
$outputFile = "output.csv"
ConvertToCSV $inputFile $outputFile
