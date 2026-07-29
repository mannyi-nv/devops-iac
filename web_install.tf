locals {
  windows_user_data = <<-EOF
    <powershell>
    $ErrorActionPreference = "Stop"
    Install-WindowsFeature Web-Server -IncludeManagementTools
    Set-Content -Path C:\inetpub\wwwroot\index.html -Value "<h1>Hello from Windows IIS</h1>"
    </powershell>
  EOF

  linux_user_data = <<-EOF
    #!/bin/bash
    DEBIAN_FRONTEND=noninteractive
    apt-get update -y
    apt-get install -y apache2
    systemctl enable apache2
    systemctl start apache2
    echo "<h1>Hello from Linux Apache</h1>" > /var/www/html/index.html
  EOF
}
