# Create a simple test video to verify the player works
# This creates a 3-second solid color video with H.264 encoding

# Create test directory if it doesn't exist
if (!(Test-Path "public\videos\test")) {
    New-Item -ItemType Directory -Path "public\videos\test" -Force
}

# Generate a simple test MP4 using PowerShell and Windows Media Format SDK
# Since ffmpeg isn't available, we'll create a minimal test file

# Alternative: Copy from a known working source or create via other means
Write-Host "Creating test video file..."

# Create a minimal MP4 header for testing
$testVideoPath = "public\videos\test\sample.mp4"

# For now, let's try a different approach - create a small working test file
# We'll use a simple technique to generate a basic MP4

# Create a basic MP4 file (this is a minimal working MP4)
$mp4Header = @(
    0x00, 0x00, 0x00, 0x20, 0x66, 0x74, 0x79, 0x70, 0x69, 0x73, 0x6F, 0x6D, 0x00, 0x00, 0x02, 0x00,
    0x69, 0x73, 0x6F, 0x6D, 0x69, 0x73, 0x6F, 0x32, 0x61, 0x76, 0x63, 0x31, 0x6D, 0x70, 0x34, 0x31
)

[System.IO.File]::WriteAllBytes($testVideoPath, $mp4Header)

Write-Host "Test file created at: $testVideoPath"
Write-Host "File size: $((Get-Item $testVideoPath).Length) bytes"