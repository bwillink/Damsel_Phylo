#########################################################################################
#                                  Make map in fig. 2                                   #
#########################################################################################

#Make a shapefile for each country for which state data is recorded

#Australia
mapshaper ../data/raw/adm_map/states_simple.shp -dissolve 'NAME_1' copy-fields='OBJECTID','ID_0','ISO','NAME_0','ENGTYPE_1','HASC_1','ID_1','NAME_1','Shape_Area','Shape_Length','TYPE_1' -filter 'OBJECTID > 184' -filter 'OBJECTID < 196' -o ../data/processed/adm_map/AUS.shp

#Brazil
mapshaper ../data/raw/adm_map/states_simple.shp -dissolve 'NAME_1' copy-fields='OBJECTID','ID_0','ISO','NAME_0','ENGTYPE_1','HASC_1','ID_1','NAME_1','Shape_Area','Shape_Length','TYPE_1' -filter 'OBJECTID > 360' -filter 'OBJECTID < 388' -o ../data/processed/adm_map/BRA.shp

#Canada
mapshaper ../data/raw/adm_map/states_simple.shp -dissolve 'NAME_1' copy-fields='OBJECTID','ID_0','ISO','NAME_0','ENGTYPE_1','HASC_1','ID_1','NAME_1','Shape_Area','Shape_Length','TYPE_1' -filter 'OBJECTID > 489' -filter 'OBJECTID < 505' -o ../data/processed/adm_map/CAN.shp

#China
mapshaper ../data/raw/adm_map/states_simple.shp -dissolve 'NAME_1' copy-fields='OBJECTID','ID_0','ISO','NAME_0','ENGTYPE_1','HASC_1','ID_1','NAME_1','Shape_Area','Shape_Length','TYPE_1' -filter 'OBJECTID > 589' -filter 'OBJECTID < 621' -o ../data/processed/adm_map/CHN.shp

#India
mapshaper ../data/raw/adm_map/states_simple.shp -dissolve 'NAME_1' copy-fields='OBJECTID','ID_0','ISO','NAME_0','ENGTYPE_1','HASC_1','ID_1','NAME_1','Shape_Area','Shape_Length','TYPE_1' -filter 'OBJECTID > 1180' -filter 'OBJECTID < 1218' -o ../data/processed/adm_map/IND.shp

#Indonesia
mapshaper ../data/raw/adm_map/states_simple.shp -dissolve 'NAME_1' copy-fields='OBJECTID','ID_0','ISO','NAME_0','ENGTYPE_1','HASC_1','ID_1','NAME_1','Shape_Area','Shape_Length','TYPE_1' -filter 'OBJECTID > 1217' -filter 'OBJECTID < 1252' -o ../data/processed/adm_map/IDN.shp

#Malaysia
 mapshaper ../data/raw/adm_map/states_simple.shp -dissolve 'NAME_1' copy-fields='OBJECTID','ID_0','ISO','NAME_0','ENGTYPE_1','HASC_1','ID_1','NAME_1','Shape_Area','Shape_Length','TYPE_1' -filter 'OBJECTID > 1750' -filter 'OBJECTID < 1767' -o ../data/processed/adm_map/MYS.shp

#Russia
mapshaper ../data/raw/adm_map/states_simple.shp -dissolve 'NAME_1' copy-fields='OBJECTID','ID_0','ISO','NAME_0','ENGTYPE_1','HASC_1','ID_1','NAME_1','Shape_Area','Shape_Length','TYPE_1' -filter 'OBJECTID > 2528' -filter 'OBJECTID < 2614' -o ../data/processed/adm_map/RUS.shp

#USA
mapshaper ../data/raw/adm_map/states_simple.shp -dissolve 'NAME_1' copy-fields='OBJECTID','ID_0','ISO','NAME_0','ENGTYPE_1','HASC_1','ID_1','NAME_1','Shape_Area','Shape_Length','TYPE_1' -filter 'ID_0 == 244' -o ../data/processed/adm_map/USA.shp

#Merge all layers

mapshaper -i ../data/processed/adm_map/countries.shp ../data/processed/adm_map/AUS.shp \
                                               ../data/processed/adm_map/BRA.shp \
                                               ../data/processed/adm_map/CAN.shp \
                                               ../data/processed/adm_map/CHN.shp \
                                               ../data/processed/adm_map/IND.shp \
                                               ../data/processed/adm_map/IDN.shp \
                                               ../data/processed/adm_map/MYS.shp \
                                               ../data/processed/adm_map/RUS.shp \
                                               ../data/processed/adm_map/USA.shp \
                                               combine-files -merge-layers -o ../data/processed/adm_map/merged.shp

#Make into geojson object and define ID field
mapshaper -i ../data/processed/adm_map/merged.shp -o ../data/processed/adm_map/merged.geo.json format=geojson id-field='OBJECTID'

# add ../data/raw/adm_map/adm_to_area.csv as a new column on merg.dbf (libreoffice calc)
