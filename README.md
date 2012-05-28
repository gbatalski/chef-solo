# chef-solo

Dieses Mini-Projekt beherbergt einige simple Anweisungen für die Installation 
und Verwendung von chef-solo auf einem sauberen Ubuntu/Debian server (z.B. AWS EC2 Instanz). 

Da chef-solo aus dem APT-Repository gleich einige server Komponenten mitbringt, 
ist seine Verwendung in unserem Fall problematisch.

https://github.com/pjungwir/illuminatedcomputing-chef-solo

Für ubuntu auf ec2 könnte noch das update von mirrors interessant sein:

```bash
# replace old mirrors with new s3 based for ubuntu
    sudo sed -i.dist 's,archive.ubuntu.com,archive.ubuntu.com.s3.amazonaws.com,g' /etc/apt/sources.list  \
      && sudo apt-get update
```


## chef-solo installation ubuntu/debian 


 
```bash
sudo apt-get install -y git
git clone git://github.com/gbatalski/chef-solo.git
cd chef-solo
chmod +x install.sh
./install.sh
```

## How it works

1. sudo Rechte sind notwendig
1. Ubuntu ab 11.10 (bei älteren eventuell install.sh anpassen)
1. Das Repo git://github.com/gbatalski/cookbooks.git wird in das Verzeichnis des ausführenden Benutzers entpakt. 
1. Die Cookbooks befinden sich danach in dem Verzeichnis ~/chef-solo/cookbooks
1. Data bags befinden sich in dem Verzeichnis ~/chef-solo/data-bags
1. Datei solo.rb enthält einige Pfade und dient als Konfiguration für den chef-solo Aufruf.  
1. Die Rezeptliste zum Ausführen bezieht chef-solo aus einer json Datei. Diese ist vor dem jeweiligen Aufruf wie etwa im Beispiel solo.json auszufüllen. Natürlich sollen alle Abhängigkeiten erfüllt werden, sprich die Cookbooks und Rezepte mit ihren Abhängigkeiten müssen vorliegen.

Die Installation von Opscode Cookbooks erfolgt in das Verzeichnis orig-cookbooks mittels knife:

```bash
cd ~/chef-solo   
sudo knife cookbook site install COOKBOOK -c solo.rb
```

Die Ausführung würde dann wie folgt aussehen:

```bash
cd ~/chef-solo   
sudo chef-solo -c solo.rb -j solo.json
```
