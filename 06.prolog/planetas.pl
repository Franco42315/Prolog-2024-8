% Predicados monarios

% Características de Marte
planeta(marte).
presencia_calotas_poleares(marte).
presencia_de_agua_congelada(marte).
atmosfera_delgada(marte).
presencia_de_montanias(marte).
rojizo(marte).

% Características de Júpiter
planeta(jupiter).
gigante_gaseoso(jupiter).
presencia_de_grandes_manchas_rojas(jupiter).
anillos(jupiter, no_tiene).
mayor_numero_lunas(jupiter).
composicion_hidrogeno_helio(jupiter).

% Características de Saturno
planeta(saturno).
anillos(saturno, presentes).
gigante_gaseoso(saturno).
composicion_hidrogeno_helio(saturno).
menor_densidad(saturno).
masa_elevada(saturno).

% Características de Urano
planeta(urano).
gigante_hielo(urano).
inclinacion_eje(urano, 98_grados).
presencia_de_anillos(urano, tenues).
composicion_hidrogeno_helio_agua_hielo_metalicos(urano).

% Características de Neptuno
planeta(neptuno).
gigante_hielo(neptuno).
presencia_grandes_vientos(neptuno).
atmosfera_activa(neptuno).
presencia_de_anillos(neptuno, tenues).
composicion_hidrogeno_helio_agua_hielo_metano(neptuno).

% Características del Sol
estrella(el_sol).
tipo_espectral(el_sol, g2v).
composicion_quimica(el_sol, principalmente_hidrogeno_helio).
temperatura_superficie(el_sol, 5500_grados_celsius).
edad_aproximada(el_sol, 4.6_mil_millones_anios).
rotacion(el_sol, aproximadamente_25_dias).

% Características de nuestra Luna (satélite de la Tierra)
satelite(nuestra_luna).
orbita(nuestra_luna, tierra).
diametro(nuestra_luna, 3474_km).
periodo_orbital(nuestra_luna, 27.3_dias).
presencia_de_crateres(nuestra_luna).
presencia_de_mares_lunares(nuestra_luna).

% Características de Fobos (satélite de Marte)
satelite(fobos).
orbita(fobos, marte).
diametro(fobos, 22_km).
periodo_orbital(fobos, 7.6_horas).
forma_irregular(fobos).
proximidad_extrema_a_marte(fobos).

% Características de Deimos (satélite de Marte)
satelite(deimos).
orbita(deimos, marte).
diametro(deimos, 12_km).
periodo_orbital(deimos, 30.3_horas).
orbita_retrógrada(deimos).
forma_irregular(deimos).

% Características de Ganímedes (satélite de Júpiter)
satelite(ganimedes).
orbita(ganimedes, jupiter).
diametro(ganimedes, 5262_km).
periodo_orbital(ganimedes, 7.2_dias).
presencia_de_un_oceano_subsuperficial(ganimedes).
superficie_con_crateres_y_lisas(ganimedes).

% Características de Calisto (satélite de Júpiter)
satelite(calisto).
orbita(calisto, jupiter).
diametro(calisto, 4821_km).
periodo_orbital(calisto, 16.7_dias).
superficie_muy_craterizada(calisto).
posible_presencia_de_agua_en_su_interior(calisto).

% Características de Io (satélite de Júpiter)
satelite(io).
orbita(io, jupiter).
diametro(io, 3637_km).
periodo_orbital(io, 1.8_dias).
actividad_volcanica_intensa(io).
presencia_de_lagos_de_lava(io).

% Características de Europa (satélite de Júpiter)
satelite(europa).
orbita(europa, jupiter).
diametro(europa, 3122_km).
periodo_orbital(europa, 3.5_dias).
posible_presencia_de_oceanos_subsuperficiales(europa).
superficie_con_grietas_y_placas(europa).

% Características de Titán (satélite de Saturno)
satelite(titan).
orbita(titan, saturno).
diametro(titan, 5150_km).
periodo_orbital(titan, 15.9_dias).
atmosfera_gruesa(titan).
presencia_de_lagos_y_mares_de_hidrocarburos(titan).

% Características de Rea (satélite de Saturno)
satelite(rea).
orbita(rea, saturno).
diametro(rea, 1528_km).
periodo_orbital(rea, 4.5_dias).
superficie_con_crateres(rea).
posible_presencia_de_un_oceano_subsuperficial(rea).

% Características de Encelado (satélite de Saturno)
satelite(encelado).
orbita(encelado, saturno).
diametro(encelado, 504_km).
periodo_orbital(encelado, 1.4_dias).
geiseres_de_agua(encelado).
posible_presencia_de_oceanos_subsuperficiales(encelado).

% Características de Mimas (satélite de Saturno)
satelite(mimas).
orbita(mimas, saturno).
diametro(mimas, 396_km).
periodo_orbital(mimas, 0.9_dias).
gran_crater_en_forma_de_ojo(mimas).
orbita_casi_resonante_con_titan(mimas).

% Características de Titania (satélite de Urano)
satelite(titania).
orbita(titania, urano).
diametro(titania, 1578_km).
periodo_orbital(titania, 8.7_dias).
superficie_con_crateres_y_valles(titania).
posible_presencia_de_un_oceano_subsuperficial(titania).

% Características de Oberon (satélite de Urano)
satelite(oberon).
orbita(oberon, urano).
diametro(oberon, 1523_km).
periodo_orbital(oberon, 13.5_dias).
superficie_con_crateres_y_llanuras(oberon).
posible_presencia_de_un_oceano_subsuperficial(oberon).

% Características de Umbriel (satélite de Urano)
satelite(umbriel).
orbita(umbriel, urano).
diametro(umbriel, 1169_km).
periodo_orbital(umbriel, 4.1_dias).
superficie_con_crateres_y_grandes_llanuras(umbriel).
posible_presencia_de_un_oceano_subsuperficial(umbriel).

% Características de Tritón (satélite de Neptuno)
satelite(triton).
orbita(triton, neptuno).
diametro(triton, 2706_km).
periodo_orbital(triton, -5.9_dias).
atmosfera_tenue_de_nitrogeno(triton).
geiseres_de_nitrogeno(triton).

% Características de Nereida (satélite de Neptuno)
satelite(nereida).
orbita(nereida, neptuno).
diametro(nereida, 340_km).
periodo_orbital(nereida, 360_dias).
forma_irregular(nereida).
orbita_retrograda(nereida).

% Características de Proteo (satélite de Neptuno)
satelite(proteo).
orbita(proteo, neptuno).
diametro(proteo, 420_km).
periodo_orbital(proteo, 1.1_dias).
superficie_con_crateres(proteo).
posible_presencia_de_un_oceano_subsuperficial(proteo).


% Características del meteorito Allende
meteorito(meteorito_allende).
composicion_quimica(meteorito_allende, condrita_carbonacea).
origen(meteorito_allende, asteroide).
caida(meteorito_allende, mexico).
ano_caída(meteorito_allende, 1969).
estudio_cientifico(meteorito_allende, ampliamente_estudiado).

% Características del meteorito Tunguska
meteorito(meteorito_tunguska).
composicion_quimica(meteorito_tunguska, desconocida).
origen(meteorito_tunguska, desconocido).
caida(meteorito_tunguska, siberia).
ano_caída(meteorito_tunguska, 1908).
estudio_cientifico(meteorito_tunguska, fenomeno_poco_comprendido).

% Características del meteorito Chelyabinsk
meteorito(meteorito_chelyabinsk).
composicion_quimica(meteorito_chelyabinsk, condrita).
origen(meteorito_chelyabinsk, asteroide).
caida(meteorito_chelyabinsk, rusia).
ano_caída(meteorito_chelyabinsk, 2013).
estudio_cientifico(meteorito_chelyabinsk, ampliamente_estudiado).

% Características del meteorito Campo del Cielo
meteorito(meteorito_campo_del_cielo).
composicion_quimica(meteorito_campo_del_cielo, hierro).
origen(meteorito_campo_del_cielo, asteroide).
caida(meteorito_campo_del_cielo, argentina).
ano_caída(meteorito_campo_del_cielo, miles_de_años_atrás).
estudio_cientifico(meteorito_campo_del_cielo, objeto_de_numerosos_estudios).

% Características del meteorito Canyon Diablo
meteorito(meteorito_canyon_diablo).
composicion_quimica(meteorito_canyon_diablo, hierro_niquel).
origen(meteorito_canyon_diablo, asteroide).
caida(meteorito_canyon_diablo, arizona).
ano_caída(meteorito_canyon_diablo, hace_unos_50000_años).
estudio_cientifico(meteorito_canyon_diablo, ampliamente_estudiado).


% Características del cometa Halley
cometa(cometa_halley).
periodo_orbital(cometa_halley, 76_anios).
nucleo(cometa_halley, aproximadamente_15_km_de_diametro).
brillantez(cometa_halley, visible_a_simple_vista).
cola(cometa_halley, larga_y_distinta).
descubierto(cometa_halley, registrado_por_primera_vez_en_240_ac).

% Características del cometa Hale-Bopp
cometa(cometa_hale_bopp).
periodo_orbital(cometa_hale_bopp, aproximadamente_2500_anios).
nucleo(cometa_hale_bopp, alrededor_de_40_km_de_diametro).
brillantez(cometa_hale_bopp, muy_brillante).
cola(cometa_hale_bopp, larga_y_espectacular).
descubierto(cometa_hale_bopp, descubierto_en_1995_por_Alan_Hale_y_Thomas_Bopp).

% Características del cometa Hyakutake
cometa(cometa_hyakutake).
periodo_orbital(cometa_hyakutake, aproximadamente_8000_anios).
nucleo(cometa_hyakutake, aproximadamente_3_km_de_diametro).
brillantez(cometa_hyakutake, visible_a_simple_vista).
cola(cometa_hyakutake, larga_y_delgada).
descubierto(cometa_hyakutake, descubierto_en_1996_por_Yuji_Hyakutake).

% Características del cometa 67P/Churyumov-Gerasimenko
cometa(cometa_67p_churyumov_gerasimenko).
periodo_orbital(cometa_67p_churyumov_gerasimenko, aproximadamente_6_anios).
nucleo(cometa_67p_churyumov_gerasimenko, alrededor_de_4_km_de_diametro).
brillantez(cometa_67p_churyumov_gerasimenko, variable).
cola(cometa_67p_churyumov_gerasimenko, larga_y_curvada).
descubierto(cometa_67p_churyumov_gerasimenko, descubierto_en_1969_por_Klim_Churyumov_y_Svetlana_Gerasimenko).

% Características del cometa Lovejoy (C/2011 W3)
cometa(cometa_lovejoy).
periodo_orbital(cometa_lovejoy, desconocido).
nucleo(cometa_lovejoy, alrededor_de_0.5_km_de_diametro).
brillantez(cometa_lovejoy, visible_a_simple_vista).
cola(cometa_lovejoy, larga_y_espectacular).
descubierto(cometa_lovejoy, descubierto_en_2011_por_Terry_Lovejoy).


% Características del asteroide Ceres
asteroide(ceres).
composicion_quimica(ceres, roca_hielo).
diametro(ceres, 940_km).
orbita(ceres, cinturon_principal_de_asteroides).
descubierto(ceres, descubierto_en_1801_por_Giuseppe_Piazzi).
clasificacion(ceres, planeta_enano).

% Características del asteroide Vesta
asteroide(vesta).
composicion_quimica(vesta, roca_metalica).
diametro(vesta, 525_km).
orbita(vesta, cinturon_principal_de_asteroides).
descubierto(vesta, descubierto_en_1807_por_Heinrich_Wilhelm_Olbers).

% Características del asteroide Eros
asteroide(eros).
composicion_quimica(eros, silicatos_y_metales).
diametro(eros, 16_km).
orbita(eros, cinturon_principal_de_asteroides).
descubierto(eros, descubierto_en_1898_por_Gustav_Witt).

% Características del asteroide Gaspra
asteroide(gaspra).
composicion_quimica(gaspra, silicatos).
diametro(gaspra, 19_km).
orbita(gaspra, cinturon_principal_de_asteroides).
descubierto(gaspra, descubierto_en_1916_por_Grigory_Neujmin).

% Características del asteroide Ida
asteroide(ida).
composicion_quimica(ida, silicatos_y_metales).
diametro(ida, 15_km).
orbita(ida, cinturon_principal_de_asteroides).
descubierto(ida, descubierto_en_1884_por_Johann_Palisa).


% Predicados binarios
luna(tierra, nuestra_luna).
luna(marte, fobos).
luna(marte, deimos).
luna(jupiter, ganimedes).
luna(jupiter, calisto).
luna(jupiter, io).
luna(jupiter, europa).
luna(saturno, titan).
luna(saturno, rea).
luna(saturno, encelado).
luna(saturno, mimas).
luna(urano, titania).
luna(urano, oberon).
luna(urano, umbriel).
luna(neptuno, triton).
luna(neptuno, nereida).
luna(neptuno, proteo).

estrella_central(el_sol).

causo_danio(meteorito_chelyabinsk, rusia, 2013).
causo_danio(meteorito_canyon_diablo, arizona, 50000).

orbita_cometa(cometa_halley, tierra).
orbita_cometa(cometa_hale_bopp, tierra).
orbita_cometa(cometa_hyakutake, tierra).
orbita_cometa(cometa_67p_churyumov_gerasimenko, tierra).
orbita_cometa(cometa_lovejoy, tierra).

visitado_por_sonda(eros, near_shoemaker, 2001).
visitado_por_sonda(gaspra, galileo, 1991).
visitado_por_sonda(ida, galileo, 1993).

