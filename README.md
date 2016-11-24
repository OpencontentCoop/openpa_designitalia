# Openpa design Italia

Design per Openpa conforme alle linee guida per i siti web della PA (http://design.italia.it/)

# Come creare un nuovo tema

1. Duplicare la cartella di un tema esistente (no base) e rinominarla (evitare caratteri stani)
2. Modifciare l'index.css del tema appaena creato, sostituire .nome_tema_copiato con .nome_nuovo_tema
3. Eseguire npm run build --openpa_designitalia:theme="nome_nuovo_tema" oppure npm run watch --openpa_designitalia:theme="nome_nuovo_tema" (in caso di sviluppo)
4. Modificare GeneralSettings:theme in openpa.ini con nome_nuovo_tema
5. Svuotare le cache
6. Incrociare le dita
7. Ricaricare la pagina
