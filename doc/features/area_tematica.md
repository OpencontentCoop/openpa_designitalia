#Area tematica

Sono considerate aree tematiche gli oggetti di classe comprese nell'array ```openpa.ini [AreeTematiche] IdentificatoreAreaTematica```

Un area tematica può:
 * sovrascrivere il logo e il nome del sito se esiste ed è popolato l'attributo __Logo (logo) ezimage__
 * mostare solo il logo senza il nome del sito se esiste ed è popolato l'attributo __Mostra solo il logo in intestazione (only_logo) ezboolean__ 
 * sovrascrivere il menu principale del sito se esiste ed è popolato l'attributo __Link al menu orizzontale (link_al_menu_orizzontale) ezobjectrelationlist__
 * sovrascrivere l'elenco dei contatti nel footer del sito se esiste ed è popolato l'attributo __Contatti (contacts) ezmatrix__ (richiede openpa-ls >= 2.22)
 * sovrascrivere l'elenco dei link nel footer del sito se esiste ed è popolato l'attributo __Link nel footer (link) ezobjectrelationlist__
 * sovrascrivere le note del footer del sito se esiste ed è popolato l'attributo __Note per il footer (note_footer) ezxmlblock__

Note:
 * se viene impostato il logo di area, il nome del sito compare nella barra in alto (vedi /design/designitalia/templates/header/service.tpl) e non viene sovrascritto il logo del footer