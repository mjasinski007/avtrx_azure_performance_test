Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))



choco install -y notepadplusplus 
choco install -y googlechrome
choco install -y unzip
#choco install -y ntttcp --ignore-checksums
choco install -y javaruntime

#Set-Variable HOME "C:\Users\tfadmin"


New-item -Path "$HOME\tools\" -ItemType Directory

curl https://github.com/microsoft/ntttcp/releases/download/v5.39/ntttcp.exe -OutFile 'C:\Users\tfadmin\tools\ntttcp.exe'
curl https://github.com/microsoft/latte/releases/download/v1.0.0/latte.exe -OutFile 'C:\Users\tfadmin\tools\latte.exe'
curl https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/xjperf/jperf-2.0.2.zip -Outfile 'C:\Users\tfadmin\tools\jperf-2.0.2.zip'
curl https://iperf.fr/download/windows/iperf-3.1.3-win64.zip -Outfile 'C:\Users\tfadmin\tools\iperf3.zip'
curl https://github.com/demirten/twamp-gui/releases/download/v1.0.8/TwampGui-1.0.8.msi -Outfile 'C:\Users\tfadmin\tools\TwampGui-1.0.8.msi'

# Disable Firewall
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False

# Unzip Files
cd .\tools\
unzip.exe iperf3.zip
unzip.exe jperf-2.0.2.zip

# Install TwampGui
Start-Process msiexec.exe -Wait -ArgumentList '/I C:\Users\tfadmin\tools\TwampGui-1.0.8.msi /quiet'




# New-item -Path "C:\tools\" -ItemType Directory

# curl https://github.com/microsoft/ntttcp/releases/download/v5.39/ntttcp.exe -OutFile 'C:\tools\ntttcp.exe'
# curl https://github.com/microsoft/latte/releases/download/v1.0.0/latte.exe -OutFile 'C:\tools\latte.exe'
# curl https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/xjperf/jperf-2.0.2.zip -Outfile 'C:\tools\jperf-2.0.2.zip'
# curl https://iperf.fr/download/windows/iperf-3.1.3-win64.zip -Outfile 'C:\tools\iperf3.zip'


# or 

#exract to same folder 
#$tmp | Expand-Archive -DestinationPath $PSScriptRoot -Force
# remove temporary file
#$tmp | Remove-Item



# # Allow Ping
# netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow

# ## NTTCP Firewall Settings
# netsh advfirewall firewall add rule program=C:\tools\ntttcp.exe name="__NTTTCP_IN" protocol=Any dir=in action=allow enable=yes profile=any
# netsh advfirewall firewall add rule program=C:\tools\ntttcp.exe name="__NTTTCP_OUT" protocol=Any dir=OUT action=allow enable=yes profile=any


# ## Latte Firewall Settings
# netsh advfirewall firewall add rule program=C:\tools\latte.exe name="__LATTE_IN" protocol=any dir=in action=allow enable=yes profile=ANY
# netsh advfirewall firewall add rule program=C:\tools\latte.exe name="__LATTE_OUT" protocol=any dir=out action=allow enable=yes profile=ANY






# NTTCP Firewall Settings
#netsh advfirewall firewall add rule program=C:\Users\tfadmin\tools\ntttcp.exe name="__NTTTCP_IN" protocol=Any dir=in action=allow enable=yes profile=any
#netsh advfirewall firewall add rule program=C:\Users\tfadmin\tools\ntttcp.exe name="__NTTTCP_OUT" protocol=Any dir=OUT action=allow enable=yes profile=any

#Allow Ping
#netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol="icmpv4:8,any" dir=in action=allow

# Latte Firewall Settings
#netsh advfirewall firewall add rule program=C:\Users\tfadmin\tools\latte.exe name="__Latte_IN" protocol=any dir=in action=allow enable=yes profile=ANY
#netsh advfirewall firewall add rule program=C:\Users\tfadmin\tools\latte.exe name="__Latte_OUT" protocol=any dir=out action=allow enable=yes profile=ANY



# # Download Java
# Invoke-WebRequest https://api.adoptopenjdk.net/v3/installer/latest/11/ga/windows/x64/jdk/hotspot/normal/adoptopenjdk?project=jdk -Outfile C:\Users\tfadmin\tools\openjd11.msi

# Start-Process -Wait -FilePath msiexec -ArgumentList /i, "C:\Users\tfadmin\tools\openjd11.msi", "ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome", 'INSTALLDIR="C:\Program Files\Java"', /quiet -Verb RunAs

# Start-Process -Wait -FilePath msiexec -ArgumentList /i, "C:\Users\tfadmin\tools\openjd11.msi", "ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome", "INSTALLDIR='C:\Program Files\Java'", /quiet

