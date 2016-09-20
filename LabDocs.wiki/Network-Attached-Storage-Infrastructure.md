### Description

This page provides a basic overview of the two Synology servers in the Roberts Lab ([Eagle](#eagle) and [Owl](#owl)), including:
* [backup strategies for Eagle](#eagle_backup)
* [backup strategies for Owl](#owl_backup)
* [top-level directory listings and descriptions for Eagle](#eagle_directories)
* [top-level directory listings and descriptions for Owl](#owl_directories)

---

Name: [Eagle](http://eagle.fish.washington.edu) <a name="eagle"></a>

Model(s): [DS413](https://www.synology.com/en-us/support/download/DS413)

\#HDDs: 4

Capacity: 8.05TB

Redundancy: Synology Hybrid RAID (SHR)

Backup service(s): <a name="eagle_backup"></a>

* All files - Real-time backup to UW Google Drive via Synology Cloud Sync app

---
Name: [Owl](http://owl.fish.washington.edu) <a name="owl"></a>

Model(s): [DS1812+](https://www.synology.com/en-us/support/download/DS1812+), [DX513](https://www.synology.com/en-us/products/DX513)

\#HDDs: DS1812+ = 8, DX513 = 5

Capacity: Total = 50.69TB, DS1812+ = 29.12TB, DX513 = 36.4TB

Redundancy: Synology Hybrid RAID (SHR)

Backup service(s): <a name="owl_backup"></a>

* [`web`](#owl_web) - Real-time backup to UW Google Drive via Synology Cloud Sync app
* [`web/nightingales`](#nightingales) - Weekly backup to Amazon Glacier via Synology Glacier app

---
#### Directory Structure on Eagle <a name="eagle_directories"></a>

`Archive`

* armina
* ballyhoo
* CLC_flatfile
* CLC Software Downloads
* filefish
* fish.washington.edugenefish
* NGS Raw Data
* notebooks
* sanger_sequencing
* site_sucker
* sr320_labnotebook_060113.enex
* sr320_labnotebook_060113ev.enex
* WikiArchive_sitesucker_060112.zip
* Wiki Backups
* Wiki_sitesucker_010213
* Wikispaces_webdav

`backup`

* Bay3_backup
* boot_images
* Software
* storage_analyzer_logs

`homes`

`music`

`photo`

* [oly_measurements_20151030](http://eagle.fish.washington.edu/photo/#!Albums/album_6f6c795f6d6561737572656d656e74735f3230313531303330)
* [oly_measurements_20151115](http://eagle.fish.washington.edu/photo/#!Albums/album_6f6c795f6d6561737572656d656e74735f3230313531313135)
* [Olympia Oyster Deployments](http://eagle.fish.washington.edu/photo/#!Albums/album_4f6c796d706961204f7973746572204465706c6f796d656e7473)
* [Taxa_SVG_Images](http://eagle.fish.washington.edu/photo/#!Albums/album_546178615f5356475f496d61676573)

`video`

`web`

* [andy](http://http://eagle.fish.washington.edu/andy)
* [aqua_pag](http://http://eagle.fish.washington.edu/aqua_pag)
* [Arabidopsis](http://http://eagle.fish.washington.edu/Arabidopsis)
* [astrangia](http://http://eagle.fish.washington.edu/astrangia)
* [bivalvia](http://http://eagle.fish.washington.edu/bivalvia)
* [claire](http://http://eagle.fish.washington.edu/claire)
* [cnidarian](http://http://eagle.fish.washington.edu/cnidarian)
* [dermochelys](http://http://eagle.fish.washington.edu/dermochelys)
* [doug](http://http://eagle.fish.washington.edu/doug)
* [emma](http://http://eagle.fish.washington.edu/emma)
* favicon.ico
* [fish310](http://http://eagle.fish.washington.edu/fish310)
* [fish441](http://http://eagle.fish.washington.edu/fish4410)
* [fish546](http://http://eagle.fish.washington.edu/fish546)
* [Geoduck](http://http://eagle.fish.washington.edu/Geoduck)
* [graduation](http://http://eagle.fish.washington.edu/graduation)
* [Ichthyophonus](http://http://eagle.fish.washington.edu/Ichthyophonus)
* index.html
* [jake](http://http://eagle.fish.washington.edu/jake)
* [LabDocuments](http://http://eagle.fish.washington.edu/LabDocuments)
* [lilmax](http://http://eagle.fish.washington.edu/lilmax)
* [lmv](http://http://eagle.fish.washington.edu/lmv)
* [louisa](http://http://eagle.fish.washington.edu/louisa)
* [mac](http://http://eagle.fish.washington.edu/mac)
* [MediaWiki](http://http://eagle.fish.washington.edu/MediaWiki)
* [Mollusk](http://http://eagle.fish.washington.edu/Mollusk)
* [nudibranchs](http://http://eagle.fish.washington.edu/nudibranchs)
* [olson](http://http://eagle.fish.washington.edu/olson)
* [owl](http://http://eagle.fish.washington.edu/owl)
* [oyster](http://http://eagle.fish.washington.edu/oyster)
* phpMyAdmin
* [QPX_genome](http://http://eagle.fish.washington.edu/QPX_genome)
* [salmonid](http://http://eagle.fish.washington.edu/salmonid)
* [scaphapoda](http://http://eagle.fish.washington.edu/scaphapoda)
* [seminar](http://http://eagle.fish.washington.edu/seminar)
* style.css
* [trilobite](http://http://eagle.fish.washington.edu/trilobite)
* [whale](http://http://eagle.fish.washington.edu/whale)


`web` directory on Eagle

<img src="http://eagle.fish.washington.edu/cnidarian/skitch/Space_Gremlin_1D789EFE.png" alt="Space_Gremlin_1D789EFE.png" width="50%"/>

---
#### Directory Structure on Owl <a name="owl_directories"></a>

`homes`

`NetBackup`

`photo`

`QuinnLab`

`web`<a name="owl_web"></a>

* [Athaliana](http://owl.fish.washington.edu/nightingales/)
* [btea](http://owl.fish.washington.edu/btea)
* [cicese](http://owl.fish.washington.edu/cicese)
* dlf
* [eimd](http://owl.fish.washington.edu/eimd)
* [halfshell](http://owl.fish.washington.edu/halfshell)
* index.html
* index.php
* [lilmax](http://owl.fish.washington.edu/lilmax)
* [nightingales](http://owl.fish.washington.edu/nightingales/) <a name="nightingales"></a>
* [O_lurida_genome_assemblies_BGI](http://owl.fish.washington.edu/O_lurida_genome_assemblies_BGI)
* [P_generosa_genome_assemblies_BGI](http://owl.fish.washington.edu/P_generosa_genome_assemblies_BGI)
* [scaphapoda](http://owl.fish.washington.edu/scaphapoda)
* [symbiodinium](http://owl.fish.washington.edu/symbiodinium)
* testing
* [web_images](http://owl.fish.washington.edu/web_images)
* [wetgenes](http://owl.fish.washington.edu/wetgenes)
* [whale](http://owl.fish.washington.edu/whale)

### Active Use




### Backup
(validation)

