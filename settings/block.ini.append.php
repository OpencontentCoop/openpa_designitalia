<?php /*

[PushToBlock]
ContentClasses[]
ContentClasses[]=frontpage
ContentClasses[]=homepage
ContentClasses[]=area_tematica
RootSubtree=1

[General]
AllowedTypes[]
AllowedTypes[]=Singolo
AllowedTypes[]=Lista
AllowedTypes[]=Lista3
AllowedTypes[]=Eventi
AllowedTypes[]=Iosono
AllowedTypes[]=VideoPlayer
AllowedTypes[]=ContentSearch
AllowedTypes[]=GMapItems
AllowedTypes[]=AreaRiservata
AllowedTypes[]=Meteo
AllowedTypes[]=HTML
AllowedTypes[]=Html3Colonne

[Singolo]
Name=Oggetto singolo
NumberOfValidItems=1
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=singolo_full
ViewList[]=singolo_box_piccolo
ViewList[]=singolo_box
ViewList[]=singolo_banner
ViewList[]=singolo_in_evidenza
ViewName[]
ViewName[singolo_full]=Default
ViewName[singolo_box_piccolo]=Titolo del blocco o dell’oggetto, miniatura e abstract
ViewName[singolo_box]=Panel
ViewName[singolo_banner]=Banner
ViewName[singolo_in_evidenza]=In evidenza

[Lista]
Name=Lista automatica
NumberOfValidItems=1
NumberOfArchivedItems=0
CustomAttributes[]
CustomAttributes[]=node_id
UseBrowseMode[node_id]=true
CustomAttributes[]=limite
CustomAttributes[]=includi_classi
CustomAttributes[]=escludi_classi
CustomAttributes[]=ordinamento
CustomAttributes[]=livello_profondita
CustomAttributes[]=state_id
CustomAttributeNames[]
CustomAttributeNames[livello_profondita]=Livello di profondità nell'alberatura
CustomAttributeNames[limite]=Numero di elementi
CustomAttributeNames[includi_classi]=Tipologie di contenuto da includere
CustomAttributeNames[escludi_classi]=Tipologie di contenuto da escludere (alternativo rispetto al precedente)
CustomAttributeNames[ordinamento]=Ordina per
CustomAttributeNames[state_id]=Stato
CustomAttributeTypes[ordinamento]=select
CustomAttributeTypes[includi_classi]=class_select
CustomAttributeTypes[escludi_classi]=class_select
CustomAttributeSelection_ordinamento[]
CustomAttributeSelection_ordinamento[name]=Titolo
CustomAttributeSelection_ordinamento[pubblicato]=Data di pubblicazione
CustomAttributeSelection_ordinamento[modificato]=Data di ultima modifica
CustomAttributeSelection_ordinamento[priority]=Priorità del nodo
CustomAttributeTypes[state_id]=state_select
ManualAddingOfItems=disabled
ViewList[]
ViewList[]=lista_num
ViewList[]=lista_accordion
ViewList[]=lista_box
ViewList[]=lista_carousel
ViewList[]=lista_in_evidenza
ViewList[]=lista_masonry
ViewList[]=lista_banner
ViewName[]
ViewName[lista_num]=Carousel
ViewName[lista_accordion]=Accordion
ViewName[lista_box]=Elenco
ViewName[lista_carousel]=Slider
ViewName[lista_in_evidenza]=In evidenza
ViewName[lista_masonry]=Masonry
ViewName[lista_banner]=Banner
TTL=3600

[Lista3]
Name=Lista manuale
NumberOfValidItems=15
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=lista_accordion_manual
ViewList[]=lista_box
ViewList[]=lista_box2
ViewList[]=lista_tab
ViewList[]=lista_carousel
ViewList[]=lista_in_evidenza
ViewList[]=lista_masonry
ViewName[]
ViewName[lista_accordion_manual]=Accordion
ViewName[lista_box]=Elenco ultimi 4 figli
ViewName[lista_box2]=Elenco su due colonne
ViewName[lista_tab]=Tabs
ViewName[lista_carousel]=Slider
ViewName[lista_in_evidenza]=In evidenza
ViewName[lista_masonry]=Masonry

[Lista4]
Name=Lista manuale (bc)
NumberOfValidItems=15
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=lista_accordion_manual
ViewList[]=lista_box
ViewList[]=lista_box2
ViewList[]=lista_tab
ViewList[]=lista_in_evidenza
ViewList[]=lista_masonry
ViewName[]
ViewName[lista_accordion_manual]=Accordion
ViewName[lista_box]=Elenco
ViewName[lista_box2]=Elenco su due colonne
ViewName[lista_tab]=Schede (tab)
ViewName[lista_in_evidenza]=In evidenza
ViewName[lista_masonry]=Masonry

[Eventi]
Name=Eventi
NumberOfValidItems=3
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
CustomAttributes[]
CustomAttributes[]=tab_title
CustomAttributeNames[tab_title]=Per il secondo tab - etichetta
CustomAttributes[]=custom_interval
CustomAttributeNames[custom_interval]=Per il secondo tab - periodo di riferimento
CustomAttributeTypes[custom_interval]=select
CustomAttributeSelection_custom_interval[]
CustomAttributeSelection_custom_interval[TOMORROW]=Domani
CustomAttributeSelection_custom_interval[TOMORROW-P1W]=Da domani per una settimana
CustomAttributeSelection_custom_interval[TOMORROW-P2W]=Da domani per due settimane
CustomAttributeSelection_custom_interval[TOMORROW-P1M]=Da domani per un mese
CustomAttributeSelection_custom_interval[TOMORROW-P2M]=Da domani per due mesi
CustomAttributeSelection_custom_interval[TODAY]=Oggi
CustomAttributeSelection_custom_interval[TODAY-P1W]=Da oggi per una settimana
CustomAttributeSelection_custom_interval[TODAY-P2W]=Da oggi per due settimane
CustomAttributeSelection_custom_interval[TODAY-P1M]=Da oggi per un mese
CustomAttributeSelection_custom_interval[TODAY-P2M]=Da oggi per due mesi
CustomAttributes[]=custom_filter
CustomAttributeNames[custom_filter]=Per il secondo tab - filtra solo eventi
CustomAttributeTypes[custom_filter]=select
CustomAttributeSelection_custom_filter[]
CustomAttributeSelection_custom_filter[NULL]=Tutti gli eventi (nessun filtro)
CustomAttributeSelection_custom_filter[SPECIAL]=Eventi speciali
CustomAttributeSelection_custom_filter[MANIFESTAZIONE]=Eventi di tipo manifestazione
CustomAttributeSelection_custom_filter[MANIFESTAZIONE+SPECIAL]=Eventi speciali di tipo manifestazione
ViewList[]
ViewList[]=eventi
ViewList[]=eventi_carousel
ViewList[]=eventi_wide
ViewName[eventi]=Tabs
ViewName[eventi_carousel]=Carousel
ViewName[eventi_wide]=Wide

[Iosono]
Name=Schede Homepage (Io sono, eventi della vita, ecc...)
NumberOfValidItems=5
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=iosono
ViewName[]
ViewName[iosono]=Schede

[VideoPlayer]
Name=Video Player
NumberOfValidItems=1
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=video_flow
ViewName[]
ViewName[video_flow]=Flow Player

[ContentSearch]
Name=Motori di ricerca
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=node_id
UseBrowseMode[node_id]=true
CustomAttributes[]=class
CustomAttributes[]=attribute
ViewList[]
ViewList[]=search_class_and_attributes
ViewList[]=search_free_ajax
ViewName[]
ViewName[search_class_and_attributes]=Cerca per classe e attributi
ViewName[search_free_ajax]=Ricerca libera

[GMapItems]
Name=Mappa
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=parent_node_id
CustomAttributes[]=class
CustomAttributes[]=attribute
CustomAttributes[]=limit
CustomAttributes[]=width
CustomAttributes[]=height
UseBrowseMode[parent_node_id]=true
ViewList[]
ViewList[]=geo_located_content_osm
ViewName[]
ViewName[geo_located_content_osm]=Mappa (OpenStreetMap)

[AreaRiservata]
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=parent_node_id
CustomAttributes[]=testo
CustomAttributes[]=signin
CustomAttributeTypes[testo]=text
CustomAttributeTypes[signin]=checkbox
UseBrowseMode[parent_node_id]=true
ViewList[]
ViewList[]=accesso_area_riservata
ViewName[]
ViewName[accesso_area_riservata]=Accesso area riservata

[HTML]
Name=Codice HTML
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=html
CustomAttributeTypes[html]=text
ViewList[]
ViewList[]=html
ViewName[html]=html

[Html3Colonne]
Name=Codice HTML in 3 colonne
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=htmlCol1
CustomAttributes[]=htmlCol2
CustomAttributes[]=htmlCol3
CustomAttributeTypes[htmlCol1]=text
CustomAttributeTypes[htmlCol2]=text
CustomAttributeTypes[htmlCol3]=text
ViewList[]
ViewList[]=html_3_colonne
ViewName[html_3_colonne]=html



*/ ?>
