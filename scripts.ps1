# ——————————————-
# Function Name: p
# Test if a computer is online (quick ping replacement)
# ——————————————-
function p {
    param($computername)
    return (test-connection $computername -count 1 -quiet)
    }