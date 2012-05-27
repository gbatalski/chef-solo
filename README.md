# chef-solo

## chef-solo installation ubuntu/debian 


Dieses Mini-Projekt beherbergt einige simple Anweisungen für die Installation 
und Verwendung von chef-solo auf einem sauberen Ubuntu/Debian server (z.B. AWS EC2 Instanz). 

Da chef-solo aus dem APT-Repository gleich einige server Komponenten mitbringt, 
ist seine Verwendung in unserem Fall problematisch.
 
```bash
git clone git://github.com/gbatalski/chef-solo.git
cd chef-solo
chmod +x install.sh
sudo ./install.sh
```

## How it works

1. sudo Rechte sind notwendig
1. Ubuntu ab 11.10 (bei älteren eventuell install.sh anpassen)
1. Das Repo git://github.com/gbatalski/cookbooks.git wird in das Verzeichnis des ausführenden Benutzers entpakt. 
1. Die Cookbooks befinden sich danach in dem Verzeichnis ~/cookbooks
1. Databages befinden sich in dem Verzeichnis ~/data-bags
1. Datei solo.rb enthält einige Pfade und dient als Konfiguration für den chef-solo Aufruf.  
1. Die Rezeptliste zum Ausführen bezieht chef-solo aus einer json Datei. Diese ist vor dem jeweiligen Aufruf wie etwa im Beispiel solo.json auszufüllen. Natürlich sollen alle Abhängigkeiten erfüllt werden, sprich die Cookbooks und Rezepte mit ihren Abhängigkeiten müssen vorliegen.


Der Aufruf würde dann wie folgt aussehen.

```bash
cd ~/   
chef-solo -c solo.rb -j solo.json
```
