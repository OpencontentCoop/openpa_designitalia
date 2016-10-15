<?php /*

[SemanticClassGroup_classificazione]
Classes[]=tipo_commissione
Classes[]=tipo_competenza_ordinanze
Classes[]=tipo_corso
Classes[]=tipo_dato
Classes[]=tipo_di_oggetto_rinvenuto
Classes[]=tipo_esito
Classes[]=tipo_eventi
Classes[]=tipo_formato
Classes[]=tipo_iniziative
Classes[]=tipo_interrogazione
Classes[]=tipo_licenza
Classes[]=tipo_luogo
Classes[]=tipo_pubblicazione
Classes[]=tipo_risposta
Classes[]=tipo_ristorante
Classes[]=tipo_servizio_ristoranti
Classes[]=tipo_struttura
Classes[]=tipo_telefono
Classes[]=tipologia_di_struttura_ricettiva
Classes[]=materiale_didattico
Classes[]=area_regolamento
Classes[]=argomento
Classes[]=argomento_stampa
Classes[]=categoria_associazioni
Classes[]=eventodellavita
Classes[]=fase
Classes[]=frequenza_aggiornamento
Classes[]=io_sono
Classes[]=legislatura
Classes[]=lista_elettorale
Classes[]=macroargomento
Classes[]=macroeventodellavita
Classes[]=maggioranza_minoranza
Classes[]=materia
Classes[]=posizione
Classes[]=posti_disponibili
Classes[]=sottomateria

[SemanticClassGroupVars_classificazione_tipo_competenza_ordinanze]
SubFieldIdentifier=competenza_relazione

[SemanticClassGroupVars_classificazione_tipo_corso]
SubFieldIdentifier=tematica_corso

[SemanticClassGroupVars_classificazione_tipo_dato]
SubFieldIdentifier=tipologia

[SemanticClassGroupVars_classificazione_tipo_esito]
SubFieldIdentifier=esito_mozione

[SemanticClassGroupVars_classificazione_tipo_eventi]
SubFieldIdentifier=tipo_evento

[SemanticClassGroupVars_classificazione_tipo_iniziative]
SubFieldIdentifier=tipo_evento

[SemanticClassGroupVars_classificazione_tipo_formato]
SubFieldIdentifier=formato

[SemanticClassGroupVars_classificazione_tipo_interrogazione]
SubFieldIdentifier=tipointerrogazione

[SemanticClassGroupVars_classificazione_tipo_licenza]
SubFieldIdentifier=licenza

[SemanticClassGroupVars_classificazione_tipo_servizio_ristoranti]
SubFieldIdentifier=servizi_offerti

[SemanticClassGroupVars_classificazione_tipologia_di_struttura_ricettiva]
SubFieldIdentifier=tipologia_hotel

[SemanticClassGroupVars_classificazione_materiale_didattico]
SubFieldIdentifier=dispense

[SemanticClassGroupVars_classificazione_area_regolamento]
SubFieldIdentifier=area

[SemanticClassGroupVars_classificazione_argomento_stampa]
SubFieldIdentifier=argomento_articolo

[SemanticClassGroupVars_classificazione_categoria_associazioni]
SubFieldIdentifier=categoria

[SemanticClassGroupVars_classificazione_eventodellavita]
SubFieldIdentifier=evento_vita
FacetHash[raw(meta_class_name_ms)]=Tipologia di contenuto
FacetHash[argomento.name]=Argomento

[SemanticClassGroupVars_classificazione_macroeventodellavita]
SubFieldIdentifier=evento_vita
FacetHash[raw(meta_class_name_ms)]=Tipologia di contenuto
FacetHash[argomento.name]=Argomento
FacetHash[evento_vita.name]=Evento della vita

[SemanticClassGroupVars_classificazione_macroargomento]
SubFieldIdentifier=argomento.main_parent_node_id
FacetHash[raw(meta_class_name_ms)]=Tipologia di contenuto
FacetHash[argomento.name]=Argomento
FacetHash[evento_vita.name]=Evento della vita

[SemanticClassGroupVars_classificazione_io_sono]
SubFieldIdentifier=evento_vita
FacetHash[raw(meta_class_name_ms)]=Tipologia di contenuto
FacetHash[argomento.name]=Argomento
FacetHash[evento_vita.name]=Evento della vita

[SemanticClassGroupVars_classificazione_sottomateria]
SubFieldIdentifier=materia

[DisplayBlocks]
oggetti_correlati[]
oggetti_correlati[]=organo_competente
oggetti_correlati[]=competenza
oggetti_correlati[]=organo_politico
oggetti_correlati[]=responsabile
oggetti_correlati[]=area
oggetti_correlati[]=servizio
oggetti_correlati[]=incarico
oggetti_correlati[]=ufficio
oggetti_correlati[]=struttura
oggetti_correlati[]=argomento
oggetti_correlati[]=progetto
oggetti_correlati[]=finalita
oggetti_correlati[]=ambito
oggetti_correlati[]=procedimento

## questi in realtà sono attributi con il nome di classi
oggetti_classificazione[]
oggetti_classificazione[]=organo_competente
oggetti_classificazione[]=organo_politico
oggetti_classificazione[]=circoscrizione
#oggetti_classificazione[]=responsabile
oggetti_classificazione[]=servizio
oggetti_classificazione[]=incarico
oggetti_classificazione[]=ufficio
oggetti_classificazione[]=struttura
oggetti_classificazione[]=altra_struttura
oggetti_classificazione[]=area
oggetti_classificazione[]=argomento
oggetti_classificazione[]=macroargomento
oggetti_classificazione[]=evento_vita
oggetti_classificazione[]=competenza
oggetti_classificazione[]=lista_elettorale
oggetti_classificazione[]=gruppo_politico
oggetti_classificazione[]=maggioranza_minoranza
oggetti_classificazione[]=legislatura
oggetti_classificazione[]=interroganti
oggetti_classificazione[]=internoesterno
#oggetti_classificazione[]=tipo_risposta
oggetti_classificazione[]=progetto
#oggetti_classificazione[]=tipo_evento
oggetti_classificazione[]=ambito
oggetti_classificazione[]=finalita
oggetti_classificazione[]=area_interesse
oggetti_classificazione[]=area_interesse_sottoarea
oggetti_classificazione[]=tipo_associazione
oggetti_classificazione[]=fonte


[GestioneAttributi]
attributi_da_escludere[]=event/geo

[SideMenu]

IdentificatoriMenu_trasparenza[]
IdentificatoriMenu_trasparenza[]=pagina_trasparenza

SideMenuContextRootClasses[]
SideMenuContextRootClasses[]=trasparenza
SideMenuContextRootClasses[]=area_tematica

*/ ?>
