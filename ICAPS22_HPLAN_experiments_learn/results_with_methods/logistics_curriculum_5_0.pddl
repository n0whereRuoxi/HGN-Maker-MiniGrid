( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17895 - OBJ
      ?auto_17894 - LOCATION
    )
    :vars
    (
      ?auto_17897 - LOCATION
      ?auto_17898 - CITY
      ?auto_17896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17897 ?auto_17898 ) ( IN-CITY ?auto_17894 ?auto_17898 ) ( not ( = ?auto_17894 ?auto_17897 ) ) ( OBJ-AT ?auto_17895 ?auto_17897 ) ( TRUCK-AT ?auto_17896 ?auto_17894 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17896 ?auto_17894 ?auto_17897 ?auto_17898 )
      ( !LOAD-TRUCK ?auto_17895 ?auto_17896 ?auto_17897 )
      ( !DRIVE-TRUCK ?auto_17896 ?auto_17897 ?auto_17894 ?auto_17898 )
      ( !UNLOAD-TRUCK ?auto_17895 ?auto_17896 ?auto_17894 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17902 - OBJ
      ?auto_17901 - LOCATION
    )
    :vars
    (
      ?auto_17904 - LOCATION
      ?auto_17905 - CITY
      ?auto_17903 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17904 ?auto_17905 ) ( IN-CITY ?auto_17901 ?auto_17905 ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( OBJ-AT ?auto_17902 ?auto_17904 ) ( TRUCK-AT ?auto_17903 ?auto_17901 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17903 ?auto_17901 ?auto_17904 ?auto_17905 )
      ( !LOAD-TRUCK ?auto_17902 ?auto_17903 ?auto_17904 )
      ( !DRIVE-TRUCK ?auto_17903 ?auto_17904 ?auto_17901 ?auto_17905 )
      ( !UNLOAD-TRUCK ?auto_17902 ?auto_17903 ?auto_17901 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17916 - OBJ
      ?auto_17917 - OBJ
      ?auto_17915 - LOCATION
    )
    :vars
    (
      ?auto_17920 - LOCATION
      ?auto_17918 - CITY
      ?auto_17921 - LOCATION
      ?auto_17919 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17920 ?auto_17918 ) ( IN-CITY ?auto_17915 ?auto_17918 ) ( not ( = ?auto_17915 ?auto_17920 ) ) ( OBJ-AT ?auto_17917 ?auto_17920 ) ( IN-CITY ?auto_17921 ?auto_17918 ) ( not ( = ?auto_17915 ?auto_17921 ) ) ( OBJ-AT ?auto_17916 ?auto_17921 ) ( TRUCK-AT ?auto_17919 ?auto_17915 ) ( not ( = ?auto_17916 ?auto_17917 ) ) ( not ( = ?auto_17920 ?auto_17921 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17916 ?auto_17915 )
      ( DELIVER-1PKG ?auto_17917 ?auto_17915 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17923 - OBJ
      ?auto_17924 - OBJ
      ?auto_17922 - LOCATION
    )
    :vars
    (
      ?auto_17927 - LOCATION
      ?auto_17928 - CITY
      ?auto_17925 - LOCATION
      ?auto_17926 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17927 ?auto_17928 ) ( IN-CITY ?auto_17922 ?auto_17928 ) ( not ( = ?auto_17922 ?auto_17927 ) ) ( OBJ-AT ?auto_17923 ?auto_17927 ) ( IN-CITY ?auto_17925 ?auto_17928 ) ( not ( = ?auto_17922 ?auto_17925 ) ) ( OBJ-AT ?auto_17924 ?auto_17925 ) ( TRUCK-AT ?auto_17926 ?auto_17922 ) ( not ( = ?auto_17924 ?auto_17923 ) ) ( not ( = ?auto_17927 ?auto_17925 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17924 ?auto_17923 ?auto_17922 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17940 - OBJ
      ?auto_17939 - LOCATION
    )
    :vars
    (
      ?auto_17942 - LOCATION
      ?auto_17943 - CITY
      ?auto_17941 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17942 ?auto_17943 ) ( IN-CITY ?auto_17939 ?auto_17943 ) ( not ( = ?auto_17939 ?auto_17942 ) ) ( OBJ-AT ?auto_17940 ?auto_17942 ) ( TRUCK-AT ?auto_17941 ?auto_17939 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17941 ?auto_17939 ?auto_17942 ?auto_17943 )
      ( !LOAD-TRUCK ?auto_17940 ?auto_17941 ?auto_17942 )
      ( !DRIVE-TRUCK ?auto_17941 ?auto_17942 ?auto_17939 ?auto_17943 )
      ( !UNLOAD-TRUCK ?auto_17940 ?auto_17941 ?auto_17939 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18031 - OBJ
      ?auto_18032 - OBJ
      ?auto_18033 - OBJ
      ?auto_18030 - LOCATION
    )
    :vars
    (
      ?auto_18034 - LOCATION
      ?auto_18035 - CITY
      ?auto_18038 - LOCATION
      ?auto_18037 - LOCATION
      ?auto_18036 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18034 ?auto_18035 ) ( IN-CITY ?auto_18030 ?auto_18035 ) ( not ( = ?auto_18030 ?auto_18034 ) ) ( OBJ-AT ?auto_18033 ?auto_18034 ) ( IN-CITY ?auto_18038 ?auto_18035 ) ( not ( = ?auto_18030 ?auto_18038 ) ) ( OBJ-AT ?auto_18032 ?auto_18038 ) ( IN-CITY ?auto_18037 ?auto_18035 ) ( not ( = ?auto_18030 ?auto_18037 ) ) ( OBJ-AT ?auto_18031 ?auto_18037 ) ( TRUCK-AT ?auto_18036 ?auto_18030 ) ( not ( = ?auto_18031 ?auto_18032 ) ) ( not ( = ?auto_18038 ?auto_18037 ) ) ( not ( = ?auto_18031 ?auto_18033 ) ) ( not ( = ?auto_18032 ?auto_18033 ) ) ( not ( = ?auto_18034 ?auto_18038 ) ) ( not ( = ?auto_18034 ?auto_18037 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18032 ?auto_18031 ?auto_18030 )
      ( DELIVER-1PKG ?auto_18033 ?auto_18030 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18050 - OBJ
      ?auto_18051 - OBJ
      ?auto_18052 - OBJ
      ?auto_18049 - LOCATION
    )
    :vars
    (
      ?auto_18056 - LOCATION
      ?auto_18054 - CITY
      ?auto_18055 - LOCATION
      ?auto_18053 - LOCATION
      ?auto_18057 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18056 ?auto_18054 ) ( IN-CITY ?auto_18049 ?auto_18054 ) ( not ( = ?auto_18049 ?auto_18056 ) ) ( OBJ-AT ?auto_18051 ?auto_18056 ) ( IN-CITY ?auto_18055 ?auto_18054 ) ( not ( = ?auto_18049 ?auto_18055 ) ) ( OBJ-AT ?auto_18052 ?auto_18055 ) ( IN-CITY ?auto_18053 ?auto_18054 ) ( not ( = ?auto_18049 ?auto_18053 ) ) ( OBJ-AT ?auto_18050 ?auto_18053 ) ( TRUCK-AT ?auto_18057 ?auto_18049 ) ( not ( = ?auto_18050 ?auto_18052 ) ) ( not ( = ?auto_18055 ?auto_18053 ) ) ( not ( = ?auto_18050 ?auto_18051 ) ) ( not ( = ?auto_18052 ?auto_18051 ) ) ( not ( = ?auto_18056 ?auto_18055 ) ) ( not ( = ?auto_18056 ?auto_18053 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_18050 ?auto_18052 ?auto_18051 ?auto_18049 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18069 - OBJ
      ?auto_18070 - OBJ
      ?auto_18071 - OBJ
      ?auto_18068 - LOCATION
    )
    :vars
    (
      ?auto_18074 - LOCATION
      ?auto_18073 - CITY
      ?auto_18076 - LOCATION
      ?auto_18075 - LOCATION
      ?auto_18072 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18074 ?auto_18073 ) ( IN-CITY ?auto_18068 ?auto_18073 ) ( not ( = ?auto_18068 ?auto_18074 ) ) ( OBJ-AT ?auto_18071 ?auto_18074 ) ( IN-CITY ?auto_18076 ?auto_18073 ) ( not ( = ?auto_18068 ?auto_18076 ) ) ( OBJ-AT ?auto_18069 ?auto_18076 ) ( IN-CITY ?auto_18075 ?auto_18073 ) ( not ( = ?auto_18068 ?auto_18075 ) ) ( OBJ-AT ?auto_18070 ?auto_18075 ) ( TRUCK-AT ?auto_18072 ?auto_18068 ) ( not ( = ?auto_18070 ?auto_18069 ) ) ( not ( = ?auto_18076 ?auto_18075 ) ) ( not ( = ?auto_18070 ?auto_18071 ) ) ( not ( = ?auto_18069 ?auto_18071 ) ) ( not ( = ?auto_18074 ?auto_18076 ) ) ( not ( = ?auto_18074 ?auto_18075 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_18070 ?auto_18071 ?auto_18069 ?auto_18068 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18088 - OBJ
      ?auto_18089 - OBJ
      ?auto_18090 - OBJ
      ?auto_18087 - LOCATION
    )
    :vars
    (
      ?auto_18093 - LOCATION
      ?auto_18092 - CITY
      ?auto_18095 - LOCATION
      ?auto_18094 - LOCATION
      ?auto_18091 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18093 ?auto_18092 ) ( IN-CITY ?auto_18087 ?auto_18092 ) ( not ( = ?auto_18087 ?auto_18093 ) ) ( OBJ-AT ?auto_18089 ?auto_18093 ) ( IN-CITY ?auto_18095 ?auto_18092 ) ( not ( = ?auto_18087 ?auto_18095 ) ) ( OBJ-AT ?auto_18088 ?auto_18095 ) ( IN-CITY ?auto_18094 ?auto_18092 ) ( not ( = ?auto_18087 ?auto_18094 ) ) ( OBJ-AT ?auto_18090 ?auto_18094 ) ( TRUCK-AT ?auto_18091 ?auto_18087 ) ( not ( = ?auto_18090 ?auto_18088 ) ) ( not ( = ?auto_18095 ?auto_18094 ) ) ( not ( = ?auto_18090 ?auto_18089 ) ) ( not ( = ?auto_18088 ?auto_18089 ) ) ( not ( = ?auto_18093 ?auto_18095 ) ) ( not ( = ?auto_18093 ?auto_18094 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_18090 ?auto_18089 ?auto_18088 ?auto_18087 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18127 - OBJ
      ?auto_18128 - OBJ
      ?auto_18129 - OBJ
      ?auto_18126 - LOCATION
    )
    :vars
    (
      ?auto_18132 - LOCATION
      ?auto_18131 - CITY
      ?auto_18134 - LOCATION
      ?auto_18133 - LOCATION
      ?auto_18130 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18132 ?auto_18131 ) ( IN-CITY ?auto_18126 ?auto_18131 ) ( not ( = ?auto_18126 ?auto_18132 ) ) ( OBJ-AT ?auto_18127 ?auto_18132 ) ( IN-CITY ?auto_18134 ?auto_18131 ) ( not ( = ?auto_18126 ?auto_18134 ) ) ( OBJ-AT ?auto_18129 ?auto_18134 ) ( IN-CITY ?auto_18133 ?auto_18131 ) ( not ( = ?auto_18126 ?auto_18133 ) ) ( OBJ-AT ?auto_18128 ?auto_18133 ) ( TRUCK-AT ?auto_18130 ?auto_18126 ) ( not ( = ?auto_18128 ?auto_18129 ) ) ( not ( = ?auto_18134 ?auto_18133 ) ) ( not ( = ?auto_18128 ?auto_18127 ) ) ( not ( = ?auto_18129 ?auto_18127 ) ) ( not ( = ?auto_18132 ?auto_18134 ) ) ( not ( = ?auto_18132 ?auto_18133 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_18128 ?auto_18127 ?auto_18129 ?auto_18126 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18146 - OBJ
      ?auto_18147 - OBJ
      ?auto_18148 - OBJ
      ?auto_18145 - LOCATION
    )
    :vars
    (
      ?auto_18151 - LOCATION
      ?auto_18150 - CITY
      ?auto_18153 - LOCATION
      ?auto_18152 - LOCATION
      ?auto_18149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18151 ?auto_18150 ) ( IN-CITY ?auto_18145 ?auto_18150 ) ( not ( = ?auto_18145 ?auto_18151 ) ) ( OBJ-AT ?auto_18146 ?auto_18151 ) ( IN-CITY ?auto_18153 ?auto_18150 ) ( not ( = ?auto_18145 ?auto_18153 ) ) ( OBJ-AT ?auto_18147 ?auto_18153 ) ( IN-CITY ?auto_18152 ?auto_18150 ) ( not ( = ?auto_18145 ?auto_18152 ) ) ( OBJ-AT ?auto_18148 ?auto_18152 ) ( TRUCK-AT ?auto_18149 ?auto_18145 ) ( not ( = ?auto_18148 ?auto_18147 ) ) ( not ( = ?auto_18153 ?auto_18152 ) ) ( not ( = ?auto_18148 ?auto_18146 ) ) ( not ( = ?auto_18147 ?auto_18146 ) ) ( not ( = ?auto_18151 ?auto_18153 ) ) ( not ( = ?auto_18151 ?auto_18152 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_18148 ?auto_18146 ?auto_18147 ?auto_18145 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_18208 - OBJ
      ?auto_18207 - LOCATION
    )
    :vars
    (
      ?auto_18210 - LOCATION
      ?auto_18211 - CITY
      ?auto_18209 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18210 ?auto_18211 ) ( IN-CITY ?auto_18207 ?auto_18211 ) ( not ( = ?auto_18207 ?auto_18210 ) ) ( OBJ-AT ?auto_18208 ?auto_18210 ) ( TRUCK-AT ?auto_18209 ?auto_18207 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_18209 ?auto_18207 ?auto_18210 ?auto_18211 )
      ( !LOAD-TRUCK ?auto_18208 ?auto_18209 ?auto_18210 )
      ( !DRIVE-TRUCK ?auto_18209 ?auto_18210 ?auto_18207 ?auto_18211 )
      ( !UNLOAD-TRUCK ?auto_18208 ?auto_18209 ?auto_18207 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19190 - OBJ
      ?auto_19191 - OBJ
      ?auto_19192 - OBJ
      ?auto_19193 - OBJ
      ?auto_19189 - LOCATION
    )
    :vars
    (
      ?auto_19196 - LOCATION
      ?auto_19195 - CITY
      ?auto_19197 - LOCATION
      ?auto_19198 - LOCATION
      ?auto_19194 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19196 ?auto_19195 ) ( IN-CITY ?auto_19189 ?auto_19195 ) ( not ( = ?auto_19189 ?auto_19196 ) ) ( OBJ-AT ?auto_19193 ?auto_19196 ) ( IN-CITY ?auto_19197 ?auto_19195 ) ( not ( = ?auto_19189 ?auto_19197 ) ) ( OBJ-AT ?auto_19192 ?auto_19197 ) ( OBJ-AT ?auto_19191 ?auto_19196 ) ( IN-CITY ?auto_19198 ?auto_19195 ) ( not ( = ?auto_19189 ?auto_19198 ) ) ( OBJ-AT ?auto_19190 ?auto_19198 ) ( TRUCK-AT ?auto_19194 ?auto_19189 ) ( not ( = ?auto_19190 ?auto_19191 ) ) ( not ( = ?auto_19196 ?auto_19198 ) ) ( not ( = ?auto_19190 ?auto_19192 ) ) ( not ( = ?auto_19191 ?auto_19192 ) ) ( not ( = ?auto_19197 ?auto_19196 ) ) ( not ( = ?auto_19197 ?auto_19198 ) ) ( not ( = ?auto_19190 ?auto_19193 ) ) ( not ( = ?auto_19191 ?auto_19193 ) ) ( not ( = ?auto_19192 ?auto_19193 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_19190 ?auto_19192 ?auto_19191 ?auto_19189 )
      ( DELIVER-1PKG ?auto_19193 ?auto_19189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19222 - OBJ
      ?auto_19223 - OBJ
      ?auto_19224 - OBJ
      ?auto_19225 - OBJ
      ?auto_19221 - LOCATION
    )
    :vars
    (
      ?auto_19229 - LOCATION
      ?auto_19226 - CITY
      ?auto_19230 - LOCATION
      ?auto_19227 - LOCATION
      ?auto_19228 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19229 ?auto_19226 ) ( IN-CITY ?auto_19221 ?auto_19226 ) ( not ( = ?auto_19221 ?auto_19229 ) ) ( OBJ-AT ?auto_19224 ?auto_19229 ) ( IN-CITY ?auto_19230 ?auto_19226 ) ( not ( = ?auto_19221 ?auto_19230 ) ) ( OBJ-AT ?auto_19225 ?auto_19230 ) ( OBJ-AT ?auto_19223 ?auto_19229 ) ( IN-CITY ?auto_19227 ?auto_19226 ) ( not ( = ?auto_19221 ?auto_19227 ) ) ( OBJ-AT ?auto_19222 ?auto_19227 ) ( TRUCK-AT ?auto_19228 ?auto_19221 ) ( not ( = ?auto_19222 ?auto_19223 ) ) ( not ( = ?auto_19229 ?auto_19227 ) ) ( not ( = ?auto_19222 ?auto_19225 ) ) ( not ( = ?auto_19223 ?auto_19225 ) ) ( not ( = ?auto_19230 ?auto_19229 ) ) ( not ( = ?auto_19230 ?auto_19227 ) ) ( not ( = ?auto_19222 ?auto_19224 ) ) ( not ( = ?auto_19223 ?auto_19224 ) ) ( not ( = ?auto_19225 ?auto_19224 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19222 ?auto_19223 ?auto_19225 ?auto_19224 ?auto_19221 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19254 - OBJ
      ?auto_19255 - OBJ
      ?auto_19256 - OBJ
      ?auto_19257 - OBJ
      ?auto_19253 - LOCATION
    )
    :vars
    (
      ?auto_19261 - LOCATION
      ?auto_19262 - CITY
      ?auto_19260 - LOCATION
      ?auto_19258 - LOCATION
      ?auto_19259 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19261 ?auto_19262 ) ( IN-CITY ?auto_19253 ?auto_19262 ) ( not ( = ?auto_19253 ?auto_19261 ) ) ( OBJ-AT ?auto_19257 ?auto_19261 ) ( IN-CITY ?auto_19260 ?auto_19262 ) ( not ( = ?auto_19253 ?auto_19260 ) ) ( OBJ-AT ?auto_19255 ?auto_19260 ) ( OBJ-AT ?auto_19256 ?auto_19261 ) ( IN-CITY ?auto_19258 ?auto_19262 ) ( not ( = ?auto_19253 ?auto_19258 ) ) ( OBJ-AT ?auto_19254 ?auto_19258 ) ( TRUCK-AT ?auto_19259 ?auto_19253 ) ( not ( = ?auto_19254 ?auto_19256 ) ) ( not ( = ?auto_19261 ?auto_19258 ) ) ( not ( = ?auto_19254 ?auto_19255 ) ) ( not ( = ?auto_19256 ?auto_19255 ) ) ( not ( = ?auto_19260 ?auto_19261 ) ) ( not ( = ?auto_19260 ?auto_19258 ) ) ( not ( = ?auto_19254 ?auto_19257 ) ) ( not ( = ?auto_19256 ?auto_19257 ) ) ( not ( = ?auto_19255 ?auto_19257 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19254 ?auto_19256 ?auto_19257 ?auto_19255 ?auto_19253 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19286 - OBJ
      ?auto_19287 - OBJ
      ?auto_19288 - OBJ
      ?auto_19289 - OBJ
      ?auto_19285 - LOCATION
    )
    :vars
    (
      ?auto_19293 - LOCATION
      ?auto_19294 - CITY
      ?auto_19292 - LOCATION
      ?auto_19290 - LOCATION
      ?auto_19291 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19293 ?auto_19294 ) ( IN-CITY ?auto_19285 ?auto_19294 ) ( not ( = ?auto_19285 ?auto_19293 ) ) ( OBJ-AT ?auto_19288 ?auto_19293 ) ( IN-CITY ?auto_19292 ?auto_19294 ) ( not ( = ?auto_19285 ?auto_19292 ) ) ( OBJ-AT ?auto_19287 ?auto_19292 ) ( OBJ-AT ?auto_19289 ?auto_19293 ) ( IN-CITY ?auto_19290 ?auto_19294 ) ( not ( = ?auto_19285 ?auto_19290 ) ) ( OBJ-AT ?auto_19286 ?auto_19290 ) ( TRUCK-AT ?auto_19291 ?auto_19285 ) ( not ( = ?auto_19286 ?auto_19289 ) ) ( not ( = ?auto_19293 ?auto_19290 ) ) ( not ( = ?auto_19286 ?auto_19287 ) ) ( not ( = ?auto_19289 ?auto_19287 ) ) ( not ( = ?auto_19292 ?auto_19293 ) ) ( not ( = ?auto_19292 ?auto_19290 ) ) ( not ( = ?auto_19286 ?auto_19288 ) ) ( not ( = ?auto_19289 ?auto_19288 ) ) ( not ( = ?auto_19287 ?auto_19288 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19286 ?auto_19289 ?auto_19288 ?auto_19287 ?auto_19285 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19386 - OBJ
      ?auto_19387 - OBJ
      ?auto_19388 - OBJ
      ?auto_19389 - OBJ
      ?auto_19385 - LOCATION
    )
    :vars
    (
      ?auto_19393 - LOCATION
      ?auto_19394 - CITY
      ?auto_19392 - LOCATION
      ?auto_19390 - LOCATION
      ?auto_19391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19393 ?auto_19394 ) ( IN-CITY ?auto_19385 ?auto_19394 ) ( not ( = ?auto_19385 ?auto_19393 ) ) ( OBJ-AT ?auto_19387 ?auto_19393 ) ( IN-CITY ?auto_19392 ?auto_19394 ) ( not ( = ?auto_19385 ?auto_19392 ) ) ( OBJ-AT ?auto_19389 ?auto_19392 ) ( OBJ-AT ?auto_19388 ?auto_19393 ) ( IN-CITY ?auto_19390 ?auto_19394 ) ( not ( = ?auto_19385 ?auto_19390 ) ) ( OBJ-AT ?auto_19386 ?auto_19390 ) ( TRUCK-AT ?auto_19391 ?auto_19385 ) ( not ( = ?auto_19386 ?auto_19388 ) ) ( not ( = ?auto_19393 ?auto_19390 ) ) ( not ( = ?auto_19386 ?auto_19389 ) ) ( not ( = ?auto_19388 ?auto_19389 ) ) ( not ( = ?auto_19392 ?auto_19393 ) ) ( not ( = ?auto_19392 ?auto_19390 ) ) ( not ( = ?auto_19386 ?auto_19387 ) ) ( not ( = ?auto_19388 ?auto_19387 ) ) ( not ( = ?auto_19389 ?auto_19387 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19386 ?auto_19388 ?auto_19387 ?auto_19389 ?auto_19385 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19418 - OBJ
      ?auto_19419 - OBJ
      ?auto_19420 - OBJ
      ?auto_19421 - OBJ
      ?auto_19417 - LOCATION
    )
    :vars
    (
      ?auto_19425 - LOCATION
      ?auto_19426 - CITY
      ?auto_19424 - LOCATION
      ?auto_19422 - LOCATION
      ?auto_19423 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19425 ?auto_19426 ) ( IN-CITY ?auto_19417 ?auto_19426 ) ( not ( = ?auto_19417 ?auto_19425 ) ) ( OBJ-AT ?auto_19419 ?auto_19425 ) ( IN-CITY ?auto_19424 ?auto_19426 ) ( not ( = ?auto_19417 ?auto_19424 ) ) ( OBJ-AT ?auto_19420 ?auto_19424 ) ( OBJ-AT ?auto_19421 ?auto_19425 ) ( IN-CITY ?auto_19422 ?auto_19426 ) ( not ( = ?auto_19417 ?auto_19422 ) ) ( OBJ-AT ?auto_19418 ?auto_19422 ) ( TRUCK-AT ?auto_19423 ?auto_19417 ) ( not ( = ?auto_19418 ?auto_19421 ) ) ( not ( = ?auto_19425 ?auto_19422 ) ) ( not ( = ?auto_19418 ?auto_19420 ) ) ( not ( = ?auto_19421 ?auto_19420 ) ) ( not ( = ?auto_19424 ?auto_19425 ) ) ( not ( = ?auto_19424 ?auto_19422 ) ) ( not ( = ?auto_19418 ?auto_19419 ) ) ( not ( = ?auto_19421 ?auto_19419 ) ) ( not ( = ?auto_19420 ?auto_19419 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19418 ?auto_19421 ?auto_19419 ?auto_19420 ?auto_19417 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19518 - OBJ
      ?auto_19519 - OBJ
      ?auto_19520 - OBJ
      ?auto_19521 - OBJ
      ?auto_19517 - LOCATION
    )
    :vars
    (
      ?auto_19525 - LOCATION
      ?auto_19526 - CITY
      ?auto_19524 - LOCATION
      ?auto_19522 - LOCATION
      ?auto_19523 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19525 ?auto_19526 ) ( IN-CITY ?auto_19517 ?auto_19526 ) ( not ( = ?auto_19517 ?auto_19525 ) ) ( OBJ-AT ?auto_19521 ?auto_19525 ) ( IN-CITY ?auto_19524 ?auto_19526 ) ( not ( = ?auto_19517 ?auto_19524 ) ) ( OBJ-AT ?auto_19520 ?auto_19524 ) ( OBJ-AT ?auto_19518 ?auto_19525 ) ( IN-CITY ?auto_19522 ?auto_19526 ) ( not ( = ?auto_19517 ?auto_19522 ) ) ( OBJ-AT ?auto_19519 ?auto_19522 ) ( TRUCK-AT ?auto_19523 ?auto_19517 ) ( not ( = ?auto_19519 ?auto_19518 ) ) ( not ( = ?auto_19525 ?auto_19522 ) ) ( not ( = ?auto_19519 ?auto_19520 ) ) ( not ( = ?auto_19518 ?auto_19520 ) ) ( not ( = ?auto_19524 ?auto_19525 ) ) ( not ( = ?auto_19524 ?auto_19522 ) ) ( not ( = ?auto_19519 ?auto_19521 ) ) ( not ( = ?auto_19518 ?auto_19521 ) ) ( not ( = ?auto_19520 ?auto_19521 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19519 ?auto_19518 ?auto_19521 ?auto_19520 ?auto_19517 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19550 - OBJ
      ?auto_19551 - OBJ
      ?auto_19552 - OBJ
      ?auto_19553 - OBJ
      ?auto_19549 - LOCATION
    )
    :vars
    (
      ?auto_19557 - LOCATION
      ?auto_19558 - CITY
      ?auto_19556 - LOCATION
      ?auto_19554 - LOCATION
      ?auto_19555 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19557 ?auto_19558 ) ( IN-CITY ?auto_19549 ?auto_19558 ) ( not ( = ?auto_19549 ?auto_19557 ) ) ( OBJ-AT ?auto_19552 ?auto_19557 ) ( IN-CITY ?auto_19556 ?auto_19558 ) ( not ( = ?auto_19549 ?auto_19556 ) ) ( OBJ-AT ?auto_19553 ?auto_19556 ) ( OBJ-AT ?auto_19550 ?auto_19557 ) ( IN-CITY ?auto_19554 ?auto_19558 ) ( not ( = ?auto_19549 ?auto_19554 ) ) ( OBJ-AT ?auto_19551 ?auto_19554 ) ( TRUCK-AT ?auto_19555 ?auto_19549 ) ( not ( = ?auto_19551 ?auto_19550 ) ) ( not ( = ?auto_19557 ?auto_19554 ) ) ( not ( = ?auto_19551 ?auto_19553 ) ) ( not ( = ?auto_19550 ?auto_19553 ) ) ( not ( = ?auto_19556 ?auto_19557 ) ) ( not ( = ?auto_19556 ?auto_19554 ) ) ( not ( = ?auto_19551 ?auto_19552 ) ) ( not ( = ?auto_19550 ?auto_19552 ) ) ( not ( = ?auto_19553 ?auto_19552 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19551 ?auto_19550 ?auto_19552 ?auto_19553 ?auto_19549 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19651 - OBJ
      ?auto_19652 - OBJ
      ?auto_19653 - OBJ
      ?auto_19654 - OBJ
      ?auto_19650 - LOCATION
    )
    :vars
    (
      ?auto_19658 - LOCATION
      ?auto_19659 - CITY
      ?auto_19657 - LOCATION
      ?auto_19655 - LOCATION
      ?auto_19656 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19658 ?auto_19659 ) ( IN-CITY ?auto_19650 ?auto_19659 ) ( not ( = ?auto_19650 ?auto_19658 ) ) ( OBJ-AT ?auto_19654 ?auto_19658 ) ( IN-CITY ?auto_19657 ?auto_19659 ) ( not ( = ?auto_19650 ?auto_19657 ) ) ( OBJ-AT ?auto_19652 ?auto_19657 ) ( OBJ-AT ?auto_19651 ?auto_19658 ) ( IN-CITY ?auto_19655 ?auto_19659 ) ( not ( = ?auto_19650 ?auto_19655 ) ) ( OBJ-AT ?auto_19653 ?auto_19655 ) ( TRUCK-AT ?auto_19656 ?auto_19650 ) ( not ( = ?auto_19653 ?auto_19651 ) ) ( not ( = ?auto_19658 ?auto_19655 ) ) ( not ( = ?auto_19653 ?auto_19652 ) ) ( not ( = ?auto_19651 ?auto_19652 ) ) ( not ( = ?auto_19657 ?auto_19658 ) ) ( not ( = ?auto_19657 ?auto_19655 ) ) ( not ( = ?auto_19653 ?auto_19654 ) ) ( not ( = ?auto_19651 ?auto_19654 ) ) ( not ( = ?auto_19652 ?auto_19654 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19653 ?auto_19651 ?auto_19654 ?auto_19652 ?auto_19650 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19683 - OBJ
      ?auto_19684 - OBJ
      ?auto_19685 - OBJ
      ?auto_19686 - OBJ
      ?auto_19682 - LOCATION
    )
    :vars
    (
      ?auto_19690 - LOCATION
      ?auto_19691 - CITY
      ?auto_19689 - LOCATION
      ?auto_19687 - LOCATION
      ?auto_19688 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19690 ?auto_19691 ) ( IN-CITY ?auto_19682 ?auto_19691 ) ( not ( = ?auto_19682 ?auto_19690 ) ) ( OBJ-AT ?auto_19685 ?auto_19690 ) ( IN-CITY ?auto_19689 ?auto_19691 ) ( not ( = ?auto_19682 ?auto_19689 ) ) ( OBJ-AT ?auto_19684 ?auto_19689 ) ( OBJ-AT ?auto_19683 ?auto_19690 ) ( IN-CITY ?auto_19687 ?auto_19691 ) ( not ( = ?auto_19682 ?auto_19687 ) ) ( OBJ-AT ?auto_19686 ?auto_19687 ) ( TRUCK-AT ?auto_19688 ?auto_19682 ) ( not ( = ?auto_19686 ?auto_19683 ) ) ( not ( = ?auto_19690 ?auto_19687 ) ) ( not ( = ?auto_19686 ?auto_19684 ) ) ( not ( = ?auto_19683 ?auto_19684 ) ) ( not ( = ?auto_19689 ?auto_19690 ) ) ( not ( = ?auto_19689 ?auto_19687 ) ) ( not ( = ?auto_19686 ?auto_19685 ) ) ( not ( = ?auto_19683 ?auto_19685 ) ) ( not ( = ?auto_19684 ?auto_19685 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19686 ?auto_19683 ?auto_19685 ?auto_19684 ?auto_19682 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19748 - OBJ
      ?auto_19749 - OBJ
      ?auto_19750 - OBJ
      ?auto_19751 - OBJ
      ?auto_19747 - LOCATION
    )
    :vars
    (
      ?auto_19755 - LOCATION
      ?auto_19756 - CITY
      ?auto_19754 - LOCATION
      ?auto_19752 - LOCATION
      ?auto_19753 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19755 ?auto_19756 ) ( IN-CITY ?auto_19747 ?auto_19756 ) ( not ( = ?auto_19747 ?auto_19755 ) ) ( OBJ-AT ?auto_19749 ?auto_19755 ) ( IN-CITY ?auto_19754 ?auto_19756 ) ( not ( = ?auto_19747 ?auto_19754 ) ) ( OBJ-AT ?auto_19751 ?auto_19754 ) ( OBJ-AT ?auto_19748 ?auto_19755 ) ( IN-CITY ?auto_19752 ?auto_19756 ) ( not ( = ?auto_19747 ?auto_19752 ) ) ( OBJ-AT ?auto_19750 ?auto_19752 ) ( TRUCK-AT ?auto_19753 ?auto_19747 ) ( not ( = ?auto_19750 ?auto_19748 ) ) ( not ( = ?auto_19755 ?auto_19752 ) ) ( not ( = ?auto_19750 ?auto_19751 ) ) ( not ( = ?auto_19748 ?auto_19751 ) ) ( not ( = ?auto_19754 ?auto_19755 ) ) ( not ( = ?auto_19754 ?auto_19752 ) ) ( not ( = ?auto_19750 ?auto_19749 ) ) ( not ( = ?auto_19748 ?auto_19749 ) ) ( not ( = ?auto_19751 ?auto_19749 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19750 ?auto_19748 ?auto_19749 ?auto_19751 ?auto_19747 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19815 - OBJ
      ?auto_19816 - OBJ
      ?auto_19817 - OBJ
      ?auto_19818 - OBJ
      ?auto_19814 - LOCATION
    )
    :vars
    (
      ?auto_19822 - LOCATION
      ?auto_19823 - CITY
      ?auto_19821 - LOCATION
      ?auto_19819 - LOCATION
      ?auto_19820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19822 ?auto_19823 ) ( IN-CITY ?auto_19814 ?auto_19823 ) ( not ( = ?auto_19814 ?auto_19822 ) ) ( OBJ-AT ?auto_19816 ?auto_19822 ) ( IN-CITY ?auto_19821 ?auto_19823 ) ( not ( = ?auto_19814 ?auto_19821 ) ) ( OBJ-AT ?auto_19817 ?auto_19821 ) ( OBJ-AT ?auto_19815 ?auto_19822 ) ( IN-CITY ?auto_19819 ?auto_19823 ) ( not ( = ?auto_19814 ?auto_19819 ) ) ( OBJ-AT ?auto_19818 ?auto_19819 ) ( TRUCK-AT ?auto_19820 ?auto_19814 ) ( not ( = ?auto_19818 ?auto_19815 ) ) ( not ( = ?auto_19822 ?auto_19819 ) ) ( not ( = ?auto_19818 ?auto_19817 ) ) ( not ( = ?auto_19815 ?auto_19817 ) ) ( not ( = ?auto_19821 ?auto_19822 ) ) ( not ( = ?auto_19821 ?auto_19819 ) ) ( not ( = ?auto_19818 ?auto_19816 ) ) ( not ( = ?auto_19815 ?auto_19816 ) ) ( not ( = ?auto_19817 ?auto_19816 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19818 ?auto_19815 ?auto_19816 ?auto_19817 ?auto_19814 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19915 - OBJ
      ?auto_19916 - OBJ
      ?auto_19917 - OBJ
      ?auto_19918 - OBJ
      ?auto_19914 - LOCATION
    )
    :vars
    (
      ?auto_19922 - LOCATION
      ?auto_19923 - CITY
      ?auto_19921 - LOCATION
      ?auto_19919 - LOCATION
      ?auto_19920 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19922 ?auto_19923 ) ( IN-CITY ?auto_19914 ?auto_19923 ) ( not ( = ?auto_19914 ?auto_19922 ) ) ( OBJ-AT ?auto_19918 ?auto_19922 ) ( IN-CITY ?auto_19921 ?auto_19923 ) ( not ( = ?auto_19914 ?auto_19921 ) ) ( OBJ-AT ?auto_19915 ?auto_19921 ) ( OBJ-AT ?auto_19917 ?auto_19922 ) ( IN-CITY ?auto_19919 ?auto_19923 ) ( not ( = ?auto_19914 ?auto_19919 ) ) ( OBJ-AT ?auto_19916 ?auto_19919 ) ( TRUCK-AT ?auto_19920 ?auto_19914 ) ( not ( = ?auto_19916 ?auto_19917 ) ) ( not ( = ?auto_19922 ?auto_19919 ) ) ( not ( = ?auto_19916 ?auto_19915 ) ) ( not ( = ?auto_19917 ?auto_19915 ) ) ( not ( = ?auto_19921 ?auto_19922 ) ) ( not ( = ?auto_19921 ?auto_19919 ) ) ( not ( = ?auto_19916 ?auto_19918 ) ) ( not ( = ?auto_19917 ?auto_19918 ) ) ( not ( = ?auto_19915 ?auto_19918 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19916 ?auto_19917 ?auto_19918 ?auto_19915 ?auto_19914 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19947 - OBJ
      ?auto_19948 - OBJ
      ?auto_19949 - OBJ
      ?auto_19950 - OBJ
      ?auto_19946 - LOCATION
    )
    :vars
    (
      ?auto_19954 - LOCATION
      ?auto_19955 - CITY
      ?auto_19953 - LOCATION
      ?auto_19951 - LOCATION
      ?auto_19952 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19954 ?auto_19955 ) ( IN-CITY ?auto_19946 ?auto_19955 ) ( not ( = ?auto_19946 ?auto_19954 ) ) ( OBJ-AT ?auto_19949 ?auto_19954 ) ( IN-CITY ?auto_19953 ?auto_19955 ) ( not ( = ?auto_19946 ?auto_19953 ) ) ( OBJ-AT ?auto_19947 ?auto_19953 ) ( OBJ-AT ?auto_19950 ?auto_19954 ) ( IN-CITY ?auto_19951 ?auto_19955 ) ( not ( = ?auto_19946 ?auto_19951 ) ) ( OBJ-AT ?auto_19948 ?auto_19951 ) ( TRUCK-AT ?auto_19952 ?auto_19946 ) ( not ( = ?auto_19948 ?auto_19950 ) ) ( not ( = ?auto_19954 ?auto_19951 ) ) ( not ( = ?auto_19948 ?auto_19947 ) ) ( not ( = ?auto_19950 ?auto_19947 ) ) ( not ( = ?auto_19953 ?auto_19954 ) ) ( not ( = ?auto_19953 ?auto_19951 ) ) ( not ( = ?auto_19948 ?auto_19949 ) ) ( not ( = ?auto_19950 ?auto_19949 ) ) ( not ( = ?auto_19947 ?auto_19949 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19948 ?auto_19950 ?auto_19949 ?auto_19947 ?auto_19946 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19979 - OBJ
      ?auto_19980 - OBJ
      ?auto_19981 - OBJ
      ?auto_19982 - OBJ
      ?auto_19978 - LOCATION
    )
    :vars
    (
      ?auto_19986 - LOCATION
      ?auto_19987 - CITY
      ?auto_19985 - LOCATION
      ?auto_19983 - LOCATION
      ?auto_19984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19986 ?auto_19987 ) ( IN-CITY ?auto_19978 ?auto_19987 ) ( not ( = ?auto_19978 ?auto_19986 ) ) ( OBJ-AT ?auto_19982 ?auto_19986 ) ( IN-CITY ?auto_19985 ?auto_19987 ) ( not ( = ?auto_19978 ?auto_19985 ) ) ( OBJ-AT ?auto_19979 ?auto_19985 ) ( OBJ-AT ?auto_19980 ?auto_19986 ) ( IN-CITY ?auto_19983 ?auto_19987 ) ( not ( = ?auto_19978 ?auto_19983 ) ) ( OBJ-AT ?auto_19981 ?auto_19983 ) ( TRUCK-AT ?auto_19984 ?auto_19978 ) ( not ( = ?auto_19981 ?auto_19980 ) ) ( not ( = ?auto_19986 ?auto_19983 ) ) ( not ( = ?auto_19981 ?auto_19979 ) ) ( not ( = ?auto_19980 ?auto_19979 ) ) ( not ( = ?auto_19985 ?auto_19986 ) ) ( not ( = ?auto_19985 ?auto_19983 ) ) ( not ( = ?auto_19981 ?auto_19982 ) ) ( not ( = ?auto_19980 ?auto_19982 ) ) ( not ( = ?auto_19979 ?auto_19982 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19981 ?auto_19980 ?auto_19982 ?auto_19979 ?auto_19978 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20011 - OBJ
      ?auto_20012 - OBJ
      ?auto_20013 - OBJ
      ?auto_20014 - OBJ
      ?auto_20010 - LOCATION
    )
    :vars
    (
      ?auto_20018 - LOCATION
      ?auto_20019 - CITY
      ?auto_20017 - LOCATION
      ?auto_20015 - LOCATION
      ?auto_20016 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_20018 ?auto_20019 ) ( IN-CITY ?auto_20010 ?auto_20019 ) ( not ( = ?auto_20010 ?auto_20018 ) ) ( OBJ-AT ?auto_20013 ?auto_20018 ) ( IN-CITY ?auto_20017 ?auto_20019 ) ( not ( = ?auto_20010 ?auto_20017 ) ) ( OBJ-AT ?auto_20011 ?auto_20017 ) ( OBJ-AT ?auto_20012 ?auto_20018 ) ( IN-CITY ?auto_20015 ?auto_20019 ) ( not ( = ?auto_20010 ?auto_20015 ) ) ( OBJ-AT ?auto_20014 ?auto_20015 ) ( TRUCK-AT ?auto_20016 ?auto_20010 ) ( not ( = ?auto_20014 ?auto_20012 ) ) ( not ( = ?auto_20018 ?auto_20015 ) ) ( not ( = ?auto_20014 ?auto_20011 ) ) ( not ( = ?auto_20012 ?auto_20011 ) ) ( not ( = ?auto_20017 ?auto_20018 ) ) ( not ( = ?auto_20017 ?auto_20015 ) ) ( not ( = ?auto_20014 ?auto_20013 ) ) ( not ( = ?auto_20012 ?auto_20013 ) ) ( not ( = ?auto_20011 ?auto_20013 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_20014 ?auto_20012 ?auto_20013 ?auto_20011 ?auto_20010 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20145 - OBJ
      ?auto_20146 - OBJ
      ?auto_20147 - OBJ
      ?auto_20148 - OBJ
      ?auto_20144 - LOCATION
    )
    :vars
    (
      ?auto_20152 - LOCATION
      ?auto_20153 - CITY
      ?auto_20151 - LOCATION
      ?auto_20149 - LOCATION
      ?auto_20150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_20152 ?auto_20153 ) ( IN-CITY ?auto_20144 ?auto_20153 ) ( not ( = ?auto_20144 ?auto_20152 ) ) ( OBJ-AT ?auto_20146 ?auto_20152 ) ( IN-CITY ?auto_20151 ?auto_20153 ) ( not ( = ?auto_20144 ?auto_20151 ) ) ( OBJ-AT ?auto_20145 ?auto_20151 ) ( OBJ-AT ?auto_20148 ?auto_20152 ) ( IN-CITY ?auto_20149 ?auto_20153 ) ( not ( = ?auto_20144 ?auto_20149 ) ) ( OBJ-AT ?auto_20147 ?auto_20149 ) ( TRUCK-AT ?auto_20150 ?auto_20144 ) ( not ( = ?auto_20147 ?auto_20148 ) ) ( not ( = ?auto_20152 ?auto_20149 ) ) ( not ( = ?auto_20147 ?auto_20145 ) ) ( not ( = ?auto_20148 ?auto_20145 ) ) ( not ( = ?auto_20151 ?auto_20152 ) ) ( not ( = ?auto_20151 ?auto_20149 ) ) ( not ( = ?auto_20147 ?auto_20146 ) ) ( not ( = ?auto_20148 ?auto_20146 ) ) ( not ( = ?auto_20145 ?auto_20146 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_20147 ?auto_20148 ?auto_20146 ?auto_20145 ?auto_20144 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20177 - OBJ
      ?auto_20178 - OBJ
      ?auto_20179 - OBJ
      ?auto_20180 - OBJ
      ?auto_20176 - LOCATION
    )
    :vars
    (
      ?auto_20184 - LOCATION
      ?auto_20185 - CITY
      ?auto_20183 - LOCATION
      ?auto_20181 - LOCATION
      ?auto_20182 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_20184 ?auto_20185 ) ( IN-CITY ?auto_20176 ?auto_20185 ) ( not ( = ?auto_20176 ?auto_20184 ) ) ( OBJ-AT ?auto_20178 ?auto_20184 ) ( IN-CITY ?auto_20183 ?auto_20185 ) ( not ( = ?auto_20176 ?auto_20183 ) ) ( OBJ-AT ?auto_20177 ?auto_20183 ) ( OBJ-AT ?auto_20179 ?auto_20184 ) ( IN-CITY ?auto_20181 ?auto_20185 ) ( not ( = ?auto_20176 ?auto_20181 ) ) ( OBJ-AT ?auto_20180 ?auto_20181 ) ( TRUCK-AT ?auto_20182 ?auto_20176 ) ( not ( = ?auto_20180 ?auto_20179 ) ) ( not ( = ?auto_20184 ?auto_20181 ) ) ( not ( = ?auto_20180 ?auto_20177 ) ) ( not ( = ?auto_20179 ?auto_20177 ) ) ( not ( = ?auto_20183 ?auto_20184 ) ) ( not ( = ?auto_20183 ?auto_20181 ) ) ( not ( = ?auto_20180 ?auto_20178 ) ) ( not ( = ?auto_20179 ?auto_20178 ) ) ( not ( = ?auto_20177 ?auto_20178 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_20180 ?auto_20179 ?auto_20178 ?auto_20177 ?auto_20176 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20380 - OBJ
      ?auto_20381 - OBJ
      ?auto_20382 - OBJ
      ?auto_20383 - OBJ
      ?auto_20379 - LOCATION
    )
    :vars
    (
      ?auto_20387 - LOCATION
      ?auto_20388 - CITY
      ?auto_20386 - LOCATION
      ?auto_20384 - LOCATION
      ?auto_20385 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_20387 ?auto_20388 ) ( IN-CITY ?auto_20379 ?auto_20388 ) ( not ( = ?auto_20379 ?auto_20387 ) ) ( OBJ-AT ?auto_20380 ?auto_20387 ) ( IN-CITY ?auto_20386 ?auto_20388 ) ( not ( = ?auto_20379 ?auto_20386 ) ) ( OBJ-AT ?auto_20383 ?auto_20386 ) ( OBJ-AT ?auto_20382 ?auto_20387 ) ( IN-CITY ?auto_20384 ?auto_20388 ) ( not ( = ?auto_20379 ?auto_20384 ) ) ( OBJ-AT ?auto_20381 ?auto_20384 ) ( TRUCK-AT ?auto_20385 ?auto_20379 ) ( not ( = ?auto_20381 ?auto_20382 ) ) ( not ( = ?auto_20387 ?auto_20384 ) ) ( not ( = ?auto_20381 ?auto_20383 ) ) ( not ( = ?auto_20382 ?auto_20383 ) ) ( not ( = ?auto_20386 ?auto_20387 ) ) ( not ( = ?auto_20386 ?auto_20384 ) ) ( not ( = ?auto_20381 ?auto_20380 ) ) ( not ( = ?auto_20382 ?auto_20380 ) ) ( not ( = ?auto_20383 ?auto_20380 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_20381 ?auto_20382 ?auto_20380 ?auto_20383 ?auto_20379 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20412 - OBJ
      ?auto_20413 - OBJ
      ?auto_20414 - OBJ
      ?auto_20415 - OBJ
      ?auto_20411 - LOCATION
    )
    :vars
    (
      ?auto_20419 - LOCATION
      ?auto_20420 - CITY
      ?auto_20418 - LOCATION
      ?auto_20416 - LOCATION
      ?auto_20417 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_20419 ?auto_20420 ) ( IN-CITY ?auto_20411 ?auto_20420 ) ( not ( = ?auto_20411 ?auto_20419 ) ) ( OBJ-AT ?auto_20412 ?auto_20419 ) ( IN-CITY ?auto_20418 ?auto_20420 ) ( not ( = ?auto_20411 ?auto_20418 ) ) ( OBJ-AT ?auto_20414 ?auto_20418 ) ( OBJ-AT ?auto_20415 ?auto_20419 ) ( IN-CITY ?auto_20416 ?auto_20420 ) ( not ( = ?auto_20411 ?auto_20416 ) ) ( OBJ-AT ?auto_20413 ?auto_20416 ) ( TRUCK-AT ?auto_20417 ?auto_20411 ) ( not ( = ?auto_20413 ?auto_20415 ) ) ( not ( = ?auto_20419 ?auto_20416 ) ) ( not ( = ?auto_20413 ?auto_20414 ) ) ( not ( = ?auto_20415 ?auto_20414 ) ) ( not ( = ?auto_20418 ?auto_20419 ) ) ( not ( = ?auto_20418 ?auto_20416 ) ) ( not ( = ?auto_20413 ?auto_20412 ) ) ( not ( = ?auto_20415 ?auto_20412 ) ) ( not ( = ?auto_20414 ?auto_20412 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_20413 ?auto_20415 ?auto_20412 ?auto_20414 ?auto_20411 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20512 - OBJ
      ?auto_20513 - OBJ
      ?auto_20514 - OBJ
      ?auto_20515 - OBJ
      ?auto_20511 - LOCATION
    )
    :vars
    (
      ?auto_20519 - LOCATION
      ?auto_20520 - CITY
      ?auto_20518 - LOCATION
      ?auto_20516 - LOCATION
      ?auto_20517 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_20519 ?auto_20520 ) ( IN-CITY ?auto_20511 ?auto_20520 ) ( not ( = ?auto_20511 ?auto_20519 ) ) ( OBJ-AT ?auto_20512 ?auto_20519 ) ( IN-CITY ?auto_20518 ?auto_20520 ) ( not ( = ?auto_20511 ?auto_20518 ) ) ( OBJ-AT ?auto_20515 ?auto_20518 ) ( OBJ-AT ?auto_20513 ?auto_20519 ) ( IN-CITY ?auto_20516 ?auto_20520 ) ( not ( = ?auto_20511 ?auto_20516 ) ) ( OBJ-AT ?auto_20514 ?auto_20516 ) ( TRUCK-AT ?auto_20517 ?auto_20511 ) ( not ( = ?auto_20514 ?auto_20513 ) ) ( not ( = ?auto_20519 ?auto_20516 ) ) ( not ( = ?auto_20514 ?auto_20515 ) ) ( not ( = ?auto_20513 ?auto_20515 ) ) ( not ( = ?auto_20518 ?auto_20519 ) ) ( not ( = ?auto_20518 ?auto_20516 ) ) ( not ( = ?auto_20514 ?auto_20512 ) ) ( not ( = ?auto_20513 ?auto_20512 ) ) ( not ( = ?auto_20515 ?auto_20512 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_20514 ?auto_20513 ?auto_20512 ?auto_20515 ?auto_20511 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20579 - OBJ
      ?auto_20580 - OBJ
      ?auto_20581 - OBJ
      ?auto_20582 - OBJ
      ?auto_20578 - LOCATION
    )
    :vars
    (
      ?auto_20586 - LOCATION
      ?auto_20587 - CITY
      ?auto_20585 - LOCATION
      ?auto_20583 - LOCATION
      ?auto_20584 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_20586 ?auto_20587 ) ( IN-CITY ?auto_20578 ?auto_20587 ) ( not ( = ?auto_20578 ?auto_20586 ) ) ( OBJ-AT ?auto_20579 ?auto_20586 ) ( IN-CITY ?auto_20585 ?auto_20587 ) ( not ( = ?auto_20578 ?auto_20585 ) ) ( OBJ-AT ?auto_20581 ?auto_20585 ) ( OBJ-AT ?auto_20580 ?auto_20586 ) ( IN-CITY ?auto_20583 ?auto_20587 ) ( not ( = ?auto_20578 ?auto_20583 ) ) ( OBJ-AT ?auto_20582 ?auto_20583 ) ( TRUCK-AT ?auto_20584 ?auto_20578 ) ( not ( = ?auto_20582 ?auto_20580 ) ) ( not ( = ?auto_20586 ?auto_20583 ) ) ( not ( = ?auto_20582 ?auto_20581 ) ) ( not ( = ?auto_20580 ?auto_20581 ) ) ( not ( = ?auto_20585 ?auto_20586 ) ) ( not ( = ?auto_20585 ?auto_20583 ) ) ( not ( = ?auto_20582 ?auto_20579 ) ) ( not ( = ?auto_20580 ?auto_20579 ) ) ( not ( = ?auto_20581 ?auto_20579 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_20582 ?auto_20580 ?auto_20579 ?auto_20581 ?auto_20578 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20679 - OBJ
      ?auto_20680 - OBJ
      ?auto_20681 - OBJ
      ?auto_20682 - OBJ
      ?auto_20678 - LOCATION
    )
    :vars
    (
      ?auto_20686 - LOCATION
      ?auto_20687 - CITY
      ?auto_20685 - LOCATION
      ?auto_20683 - LOCATION
      ?auto_20684 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_20686 ?auto_20687 ) ( IN-CITY ?auto_20678 ?auto_20687 ) ( not ( = ?auto_20678 ?auto_20686 ) ) ( OBJ-AT ?auto_20679 ?auto_20686 ) ( IN-CITY ?auto_20685 ?auto_20687 ) ( not ( = ?auto_20678 ?auto_20685 ) ) ( OBJ-AT ?auto_20680 ?auto_20685 ) ( OBJ-AT ?auto_20682 ?auto_20686 ) ( IN-CITY ?auto_20683 ?auto_20687 ) ( not ( = ?auto_20678 ?auto_20683 ) ) ( OBJ-AT ?auto_20681 ?auto_20683 ) ( TRUCK-AT ?auto_20684 ?auto_20678 ) ( not ( = ?auto_20681 ?auto_20682 ) ) ( not ( = ?auto_20686 ?auto_20683 ) ) ( not ( = ?auto_20681 ?auto_20680 ) ) ( not ( = ?auto_20682 ?auto_20680 ) ) ( not ( = ?auto_20685 ?auto_20686 ) ) ( not ( = ?auto_20685 ?auto_20683 ) ) ( not ( = ?auto_20681 ?auto_20679 ) ) ( not ( = ?auto_20682 ?auto_20679 ) ) ( not ( = ?auto_20680 ?auto_20679 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_20681 ?auto_20682 ?auto_20679 ?auto_20680 ?auto_20678 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20711 - OBJ
      ?auto_20712 - OBJ
      ?auto_20713 - OBJ
      ?auto_20714 - OBJ
      ?auto_20710 - LOCATION
    )
    :vars
    (
      ?auto_20718 - LOCATION
      ?auto_20719 - CITY
      ?auto_20717 - LOCATION
      ?auto_20715 - LOCATION
      ?auto_20716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_20718 ?auto_20719 ) ( IN-CITY ?auto_20710 ?auto_20719 ) ( not ( = ?auto_20710 ?auto_20718 ) ) ( OBJ-AT ?auto_20711 ?auto_20718 ) ( IN-CITY ?auto_20717 ?auto_20719 ) ( not ( = ?auto_20710 ?auto_20717 ) ) ( OBJ-AT ?auto_20712 ?auto_20717 ) ( OBJ-AT ?auto_20713 ?auto_20718 ) ( IN-CITY ?auto_20715 ?auto_20719 ) ( not ( = ?auto_20710 ?auto_20715 ) ) ( OBJ-AT ?auto_20714 ?auto_20715 ) ( TRUCK-AT ?auto_20716 ?auto_20710 ) ( not ( = ?auto_20714 ?auto_20713 ) ) ( not ( = ?auto_20718 ?auto_20715 ) ) ( not ( = ?auto_20714 ?auto_20712 ) ) ( not ( = ?auto_20713 ?auto_20712 ) ) ( not ( = ?auto_20717 ?auto_20718 ) ) ( not ( = ?auto_20717 ?auto_20715 ) ) ( not ( = ?auto_20714 ?auto_20711 ) ) ( not ( = ?auto_20713 ?auto_20711 ) ) ( not ( = ?auto_20712 ?auto_20711 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_20714 ?auto_20713 ?auto_20711 ?auto_20712 ?auto_20710 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_21035 - OBJ
      ?auto_21034 - LOCATION
    )
    :vars
    (
      ?auto_21037 - LOCATION
      ?auto_21038 - CITY
      ?auto_21036 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_21037 ?auto_21038 ) ( IN-CITY ?auto_21034 ?auto_21038 ) ( not ( = ?auto_21034 ?auto_21037 ) ) ( OBJ-AT ?auto_21035 ?auto_21037 ) ( TRUCK-AT ?auto_21036 ?auto_21034 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_21036 ?auto_21034 ?auto_21037 ?auto_21038 )
      ( !LOAD-TRUCK ?auto_21035 ?auto_21036 ?auto_21037 )
      ( !DRIVE-TRUCK ?auto_21036 ?auto_21037 ?auto_21034 ?auto_21038 )
      ( !UNLOAD-TRUCK ?auto_21035 ?auto_21036 ?auto_21034 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34690 - OBJ
      ?auto_34691 - OBJ
      ?auto_34692 - OBJ
      ?auto_34693 - OBJ
      ?auto_34694 - OBJ
      ?auto_34689 - LOCATION
    )
    :vars
    (
      ?auto_34695 - LOCATION
      ?auto_34697 - CITY
      ?auto_34699 - LOCATION
      ?auto_34698 - LOCATION
      ?auto_34696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34695 ?auto_34697 ) ( IN-CITY ?auto_34689 ?auto_34697 ) ( not ( = ?auto_34689 ?auto_34695 ) ) ( OBJ-AT ?auto_34694 ?auto_34695 ) ( OBJ-AT ?auto_34693 ?auto_34695 ) ( IN-CITY ?auto_34699 ?auto_34697 ) ( not ( = ?auto_34689 ?auto_34699 ) ) ( OBJ-AT ?auto_34692 ?auto_34699 ) ( OBJ-AT ?auto_34691 ?auto_34695 ) ( IN-CITY ?auto_34698 ?auto_34697 ) ( not ( = ?auto_34689 ?auto_34698 ) ) ( OBJ-AT ?auto_34690 ?auto_34698 ) ( TRUCK-AT ?auto_34696 ?auto_34689 ) ( not ( = ?auto_34690 ?auto_34691 ) ) ( not ( = ?auto_34695 ?auto_34698 ) ) ( not ( = ?auto_34690 ?auto_34692 ) ) ( not ( = ?auto_34691 ?auto_34692 ) ) ( not ( = ?auto_34699 ?auto_34695 ) ) ( not ( = ?auto_34699 ?auto_34698 ) ) ( not ( = ?auto_34690 ?auto_34693 ) ) ( not ( = ?auto_34691 ?auto_34693 ) ) ( not ( = ?auto_34692 ?auto_34693 ) ) ( not ( = ?auto_34690 ?auto_34694 ) ) ( not ( = ?auto_34691 ?auto_34694 ) ) ( not ( = ?auto_34692 ?auto_34694 ) ) ( not ( = ?auto_34693 ?auto_34694 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_34690 ?auto_34691 ?auto_34693 ?auto_34692 ?auto_34689 )
      ( DELIVER-1PKG ?auto_34694 ?auto_34689 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34737 - OBJ
      ?auto_34738 - OBJ
      ?auto_34739 - OBJ
      ?auto_34740 - OBJ
      ?auto_34741 - OBJ
      ?auto_34736 - LOCATION
    )
    :vars
    (
      ?auto_34743 - LOCATION
      ?auto_34742 - CITY
      ?auto_34744 - LOCATION
      ?auto_34746 - LOCATION
      ?auto_34745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34743 ?auto_34742 ) ( IN-CITY ?auto_34736 ?auto_34742 ) ( not ( = ?auto_34736 ?auto_34743 ) ) ( OBJ-AT ?auto_34740 ?auto_34743 ) ( OBJ-AT ?auto_34741 ?auto_34743 ) ( IN-CITY ?auto_34744 ?auto_34742 ) ( not ( = ?auto_34736 ?auto_34744 ) ) ( OBJ-AT ?auto_34739 ?auto_34744 ) ( OBJ-AT ?auto_34738 ?auto_34743 ) ( IN-CITY ?auto_34746 ?auto_34742 ) ( not ( = ?auto_34736 ?auto_34746 ) ) ( OBJ-AT ?auto_34737 ?auto_34746 ) ( TRUCK-AT ?auto_34745 ?auto_34736 ) ( not ( = ?auto_34737 ?auto_34738 ) ) ( not ( = ?auto_34743 ?auto_34746 ) ) ( not ( = ?auto_34737 ?auto_34739 ) ) ( not ( = ?auto_34738 ?auto_34739 ) ) ( not ( = ?auto_34744 ?auto_34743 ) ) ( not ( = ?auto_34744 ?auto_34746 ) ) ( not ( = ?auto_34737 ?auto_34741 ) ) ( not ( = ?auto_34738 ?auto_34741 ) ) ( not ( = ?auto_34739 ?auto_34741 ) ) ( not ( = ?auto_34737 ?auto_34740 ) ) ( not ( = ?auto_34738 ?auto_34740 ) ) ( not ( = ?auto_34739 ?auto_34740 ) ) ( not ( = ?auto_34741 ?auto_34740 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34737 ?auto_34738 ?auto_34739 ?auto_34741 ?auto_34740 ?auto_34736 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34784 - OBJ
      ?auto_34785 - OBJ
      ?auto_34786 - OBJ
      ?auto_34787 - OBJ
      ?auto_34788 - OBJ
      ?auto_34783 - LOCATION
    )
    :vars
    (
      ?auto_34792 - LOCATION
      ?auto_34790 - CITY
      ?auto_34791 - LOCATION
      ?auto_34793 - LOCATION
      ?auto_34789 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34792 ?auto_34790 ) ( IN-CITY ?auto_34783 ?auto_34790 ) ( not ( = ?auto_34783 ?auto_34792 ) ) ( OBJ-AT ?auto_34788 ?auto_34792 ) ( OBJ-AT ?auto_34786 ?auto_34792 ) ( IN-CITY ?auto_34791 ?auto_34790 ) ( not ( = ?auto_34783 ?auto_34791 ) ) ( OBJ-AT ?auto_34787 ?auto_34791 ) ( OBJ-AT ?auto_34785 ?auto_34792 ) ( IN-CITY ?auto_34793 ?auto_34790 ) ( not ( = ?auto_34783 ?auto_34793 ) ) ( OBJ-AT ?auto_34784 ?auto_34793 ) ( TRUCK-AT ?auto_34789 ?auto_34783 ) ( not ( = ?auto_34784 ?auto_34785 ) ) ( not ( = ?auto_34792 ?auto_34793 ) ) ( not ( = ?auto_34784 ?auto_34787 ) ) ( not ( = ?auto_34785 ?auto_34787 ) ) ( not ( = ?auto_34791 ?auto_34792 ) ) ( not ( = ?auto_34791 ?auto_34793 ) ) ( not ( = ?auto_34784 ?auto_34786 ) ) ( not ( = ?auto_34785 ?auto_34786 ) ) ( not ( = ?auto_34787 ?auto_34786 ) ) ( not ( = ?auto_34784 ?auto_34788 ) ) ( not ( = ?auto_34785 ?auto_34788 ) ) ( not ( = ?auto_34787 ?auto_34788 ) ) ( not ( = ?auto_34786 ?auto_34788 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34784 ?auto_34785 ?auto_34787 ?auto_34788 ?auto_34786 ?auto_34783 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34831 - OBJ
      ?auto_34832 - OBJ
      ?auto_34833 - OBJ
      ?auto_34834 - OBJ
      ?auto_34835 - OBJ
      ?auto_34830 - LOCATION
    )
    :vars
    (
      ?auto_34839 - LOCATION
      ?auto_34837 - CITY
      ?auto_34838 - LOCATION
      ?auto_34840 - LOCATION
      ?auto_34836 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34839 ?auto_34837 ) ( IN-CITY ?auto_34830 ?auto_34837 ) ( not ( = ?auto_34830 ?auto_34839 ) ) ( OBJ-AT ?auto_34834 ?auto_34839 ) ( OBJ-AT ?auto_34833 ?auto_34839 ) ( IN-CITY ?auto_34838 ?auto_34837 ) ( not ( = ?auto_34830 ?auto_34838 ) ) ( OBJ-AT ?auto_34835 ?auto_34838 ) ( OBJ-AT ?auto_34832 ?auto_34839 ) ( IN-CITY ?auto_34840 ?auto_34837 ) ( not ( = ?auto_34830 ?auto_34840 ) ) ( OBJ-AT ?auto_34831 ?auto_34840 ) ( TRUCK-AT ?auto_34836 ?auto_34830 ) ( not ( = ?auto_34831 ?auto_34832 ) ) ( not ( = ?auto_34839 ?auto_34840 ) ) ( not ( = ?auto_34831 ?auto_34835 ) ) ( not ( = ?auto_34832 ?auto_34835 ) ) ( not ( = ?auto_34838 ?auto_34839 ) ) ( not ( = ?auto_34838 ?auto_34840 ) ) ( not ( = ?auto_34831 ?auto_34833 ) ) ( not ( = ?auto_34832 ?auto_34833 ) ) ( not ( = ?auto_34835 ?auto_34833 ) ) ( not ( = ?auto_34831 ?auto_34834 ) ) ( not ( = ?auto_34832 ?auto_34834 ) ) ( not ( = ?auto_34835 ?auto_34834 ) ) ( not ( = ?auto_34833 ?auto_34834 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34831 ?auto_34832 ?auto_34835 ?auto_34834 ?auto_34833 ?auto_34830 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35028 - OBJ
      ?auto_35029 - OBJ
      ?auto_35030 - OBJ
      ?auto_35031 - OBJ
      ?auto_35032 - OBJ
      ?auto_35027 - LOCATION
    )
    :vars
    (
      ?auto_35036 - LOCATION
      ?auto_35034 - CITY
      ?auto_35035 - LOCATION
      ?auto_35037 - LOCATION
      ?auto_35033 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35036 ?auto_35034 ) ( IN-CITY ?auto_35027 ?auto_35034 ) ( not ( = ?auto_35027 ?auto_35036 ) ) ( OBJ-AT ?auto_35030 ?auto_35036 ) ( OBJ-AT ?auto_35032 ?auto_35036 ) ( IN-CITY ?auto_35035 ?auto_35034 ) ( not ( = ?auto_35027 ?auto_35035 ) ) ( OBJ-AT ?auto_35031 ?auto_35035 ) ( OBJ-AT ?auto_35029 ?auto_35036 ) ( IN-CITY ?auto_35037 ?auto_35034 ) ( not ( = ?auto_35027 ?auto_35037 ) ) ( OBJ-AT ?auto_35028 ?auto_35037 ) ( TRUCK-AT ?auto_35033 ?auto_35027 ) ( not ( = ?auto_35028 ?auto_35029 ) ) ( not ( = ?auto_35036 ?auto_35037 ) ) ( not ( = ?auto_35028 ?auto_35031 ) ) ( not ( = ?auto_35029 ?auto_35031 ) ) ( not ( = ?auto_35035 ?auto_35036 ) ) ( not ( = ?auto_35035 ?auto_35037 ) ) ( not ( = ?auto_35028 ?auto_35032 ) ) ( not ( = ?auto_35029 ?auto_35032 ) ) ( not ( = ?auto_35031 ?auto_35032 ) ) ( not ( = ?auto_35028 ?auto_35030 ) ) ( not ( = ?auto_35029 ?auto_35030 ) ) ( not ( = ?auto_35031 ?auto_35030 ) ) ( not ( = ?auto_35032 ?auto_35030 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35028 ?auto_35029 ?auto_35031 ?auto_35030 ?auto_35032 ?auto_35027 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35075 - OBJ
      ?auto_35076 - OBJ
      ?auto_35077 - OBJ
      ?auto_35078 - OBJ
      ?auto_35079 - OBJ
      ?auto_35074 - LOCATION
    )
    :vars
    (
      ?auto_35083 - LOCATION
      ?auto_35081 - CITY
      ?auto_35082 - LOCATION
      ?auto_35084 - LOCATION
      ?auto_35080 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35083 ?auto_35081 ) ( IN-CITY ?auto_35074 ?auto_35081 ) ( not ( = ?auto_35074 ?auto_35083 ) ) ( OBJ-AT ?auto_35077 ?auto_35083 ) ( OBJ-AT ?auto_35078 ?auto_35083 ) ( IN-CITY ?auto_35082 ?auto_35081 ) ( not ( = ?auto_35074 ?auto_35082 ) ) ( OBJ-AT ?auto_35079 ?auto_35082 ) ( OBJ-AT ?auto_35076 ?auto_35083 ) ( IN-CITY ?auto_35084 ?auto_35081 ) ( not ( = ?auto_35074 ?auto_35084 ) ) ( OBJ-AT ?auto_35075 ?auto_35084 ) ( TRUCK-AT ?auto_35080 ?auto_35074 ) ( not ( = ?auto_35075 ?auto_35076 ) ) ( not ( = ?auto_35083 ?auto_35084 ) ) ( not ( = ?auto_35075 ?auto_35079 ) ) ( not ( = ?auto_35076 ?auto_35079 ) ) ( not ( = ?auto_35082 ?auto_35083 ) ) ( not ( = ?auto_35082 ?auto_35084 ) ) ( not ( = ?auto_35075 ?auto_35078 ) ) ( not ( = ?auto_35076 ?auto_35078 ) ) ( not ( = ?auto_35079 ?auto_35078 ) ) ( not ( = ?auto_35075 ?auto_35077 ) ) ( not ( = ?auto_35076 ?auto_35077 ) ) ( not ( = ?auto_35079 ?auto_35077 ) ) ( not ( = ?auto_35078 ?auto_35077 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35075 ?auto_35076 ?auto_35079 ?auto_35077 ?auto_35078 ?auto_35074 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35322 - OBJ
      ?auto_35323 - OBJ
      ?auto_35324 - OBJ
      ?auto_35325 - OBJ
      ?auto_35326 - OBJ
      ?auto_35321 - LOCATION
    )
    :vars
    (
      ?auto_35330 - LOCATION
      ?auto_35328 - CITY
      ?auto_35329 - LOCATION
      ?auto_35331 - LOCATION
      ?auto_35327 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35330 ?auto_35328 ) ( IN-CITY ?auto_35321 ?auto_35328 ) ( not ( = ?auto_35321 ?auto_35330 ) ) ( OBJ-AT ?auto_35326 ?auto_35330 ) ( OBJ-AT ?auto_35325 ?auto_35330 ) ( IN-CITY ?auto_35329 ?auto_35328 ) ( not ( = ?auto_35321 ?auto_35329 ) ) ( OBJ-AT ?auto_35323 ?auto_35329 ) ( OBJ-AT ?auto_35324 ?auto_35330 ) ( IN-CITY ?auto_35331 ?auto_35328 ) ( not ( = ?auto_35321 ?auto_35331 ) ) ( OBJ-AT ?auto_35322 ?auto_35331 ) ( TRUCK-AT ?auto_35327 ?auto_35321 ) ( not ( = ?auto_35322 ?auto_35324 ) ) ( not ( = ?auto_35330 ?auto_35331 ) ) ( not ( = ?auto_35322 ?auto_35323 ) ) ( not ( = ?auto_35324 ?auto_35323 ) ) ( not ( = ?auto_35329 ?auto_35330 ) ) ( not ( = ?auto_35329 ?auto_35331 ) ) ( not ( = ?auto_35322 ?auto_35325 ) ) ( not ( = ?auto_35324 ?auto_35325 ) ) ( not ( = ?auto_35323 ?auto_35325 ) ) ( not ( = ?auto_35322 ?auto_35326 ) ) ( not ( = ?auto_35324 ?auto_35326 ) ) ( not ( = ?auto_35323 ?auto_35326 ) ) ( not ( = ?auto_35325 ?auto_35326 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35322 ?auto_35324 ?auto_35323 ?auto_35326 ?auto_35325 ?auto_35321 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35369 - OBJ
      ?auto_35370 - OBJ
      ?auto_35371 - OBJ
      ?auto_35372 - OBJ
      ?auto_35373 - OBJ
      ?auto_35368 - LOCATION
    )
    :vars
    (
      ?auto_35377 - LOCATION
      ?auto_35375 - CITY
      ?auto_35376 - LOCATION
      ?auto_35378 - LOCATION
      ?auto_35374 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35377 ?auto_35375 ) ( IN-CITY ?auto_35368 ?auto_35375 ) ( not ( = ?auto_35368 ?auto_35377 ) ) ( OBJ-AT ?auto_35372 ?auto_35377 ) ( OBJ-AT ?auto_35373 ?auto_35377 ) ( IN-CITY ?auto_35376 ?auto_35375 ) ( not ( = ?auto_35368 ?auto_35376 ) ) ( OBJ-AT ?auto_35370 ?auto_35376 ) ( OBJ-AT ?auto_35371 ?auto_35377 ) ( IN-CITY ?auto_35378 ?auto_35375 ) ( not ( = ?auto_35368 ?auto_35378 ) ) ( OBJ-AT ?auto_35369 ?auto_35378 ) ( TRUCK-AT ?auto_35374 ?auto_35368 ) ( not ( = ?auto_35369 ?auto_35371 ) ) ( not ( = ?auto_35377 ?auto_35378 ) ) ( not ( = ?auto_35369 ?auto_35370 ) ) ( not ( = ?auto_35371 ?auto_35370 ) ) ( not ( = ?auto_35376 ?auto_35377 ) ) ( not ( = ?auto_35376 ?auto_35378 ) ) ( not ( = ?auto_35369 ?auto_35373 ) ) ( not ( = ?auto_35371 ?auto_35373 ) ) ( not ( = ?auto_35370 ?auto_35373 ) ) ( not ( = ?auto_35369 ?auto_35372 ) ) ( not ( = ?auto_35371 ?auto_35372 ) ) ( not ( = ?auto_35370 ?auto_35372 ) ) ( not ( = ?auto_35373 ?auto_35372 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35369 ?auto_35371 ?auto_35370 ?auto_35372 ?auto_35373 ?auto_35368 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35517 - OBJ
      ?auto_35518 - OBJ
      ?auto_35519 - OBJ
      ?auto_35520 - OBJ
      ?auto_35521 - OBJ
      ?auto_35516 - LOCATION
    )
    :vars
    (
      ?auto_35525 - LOCATION
      ?auto_35523 - CITY
      ?auto_35524 - LOCATION
      ?auto_35526 - LOCATION
      ?auto_35522 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35525 ?auto_35523 ) ( IN-CITY ?auto_35516 ?auto_35523 ) ( not ( = ?auto_35516 ?auto_35525 ) ) ( OBJ-AT ?auto_35521 ?auto_35525 ) ( OBJ-AT ?auto_35519 ?auto_35525 ) ( IN-CITY ?auto_35524 ?auto_35523 ) ( not ( = ?auto_35516 ?auto_35524 ) ) ( OBJ-AT ?auto_35518 ?auto_35524 ) ( OBJ-AT ?auto_35520 ?auto_35525 ) ( IN-CITY ?auto_35526 ?auto_35523 ) ( not ( = ?auto_35516 ?auto_35526 ) ) ( OBJ-AT ?auto_35517 ?auto_35526 ) ( TRUCK-AT ?auto_35522 ?auto_35516 ) ( not ( = ?auto_35517 ?auto_35520 ) ) ( not ( = ?auto_35525 ?auto_35526 ) ) ( not ( = ?auto_35517 ?auto_35518 ) ) ( not ( = ?auto_35520 ?auto_35518 ) ) ( not ( = ?auto_35524 ?auto_35525 ) ) ( not ( = ?auto_35524 ?auto_35526 ) ) ( not ( = ?auto_35517 ?auto_35519 ) ) ( not ( = ?auto_35520 ?auto_35519 ) ) ( not ( = ?auto_35518 ?auto_35519 ) ) ( not ( = ?auto_35517 ?auto_35521 ) ) ( not ( = ?auto_35520 ?auto_35521 ) ) ( not ( = ?auto_35518 ?auto_35521 ) ) ( not ( = ?auto_35519 ?auto_35521 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35517 ?auto_35520 ?auto_35518 ?auto_35521 ?auto_35519 ?auto_35516 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35564 - OBJ
      ?auto_35565 - OBJ
      ?auto_35566 - OBJ
      ?auto_35567 - OBJ
      ?auto_35568 - OBJ
      ?auto_35563 - LOCATION
    )
    :vars
    (
      ?auto_35572 - LOCATION
      ?auto_35570 - CITY
      ?auto_35571 - LOCATION
      ?auto_35573 - LOCATION
      ?auto_35569 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35572 ?auto_35570 ) ( IN-CITY ?auto_35563 ?auto_35570 ) ( not ( = ?auto_35563 ?auto_35572 ) ) ( OBJ-AT ?auto_35567 ?auto_35572 ) ( OBJ-AT ?auto_35566 ?auto_35572 ) ( IN-CITY ?auto_35571 ?auto_35570 ) ( not ( = ?auto_35563 ?auto_35571 ) ) ( OBJ-AT ?auto_35565 ?auto_35571 ) ( OBJ-AT ?auto_35568 ?auto_35572 ) ( IN-CITY ?auto_35573 ?auto_35570 ) ( not ( = ?auto_35563 ?auto_35573 ) ) ( OBJ-AT ?auto_35564 ?auto_35573 ) ( TRUCK-AT ?auto_35569 ?auto_35563 ) ( not ( = ?auto_35564 ?auto_35568 ) ) ( not ( = ?auto_35572 ?auto_35573 ) ) ( not ( = ?auto_35564 ?auto_35565 ) ) ( not ( = ?auto_35568 ?auto_35565 ) ) ( not ( = ?auto_35571 ?auto_35572 ) ) ( not ( = ?auto_35571 ?auto_35573 ) ) ( not ( = ?auto_35564 ?auto_35566 ) ) ( not ( = ?auto_35568 ?auto_35566 ) ) ( not ( = ?auto_35565 ?auto_35566 ) ) ( not ( = ?auto_35564 ?auto_35567 ) ) ( not ( = ?auto_35568 ?auto_35567 ) ) ( not ( = ?auto_35565 ?auto_35567 ) ) ( not ( = ?auto_35566 ?auto_35567 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35564 ?auto_35568 ?auto_35565 ?auto_35567 ?auto_35566 ?auto_35563 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35710 - OBJ
      ?auto_35711 - OBJ
      ?auto_35712 - OBJ
      ?auto_35713 - OBJ
      ?auto_35714 - OBJ
      ?auto_35709 - LOCATION
    )
    :vars
    (
      ?auto_35718 - LOCATION
      ?auto_35716 - CITY
      ?auto_35717 - LOCATION
      ?auto_35719 - LOCATION
      ?auto_35715 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35718 ?auto_35716 ) ( IN-CITY ?auto_35709 ?auto_35716 ) ( not ( = ?auto_35709 ?auto_35718 ) ) ( OBJ-AT ?auto_35712 ?auto_35718 ) ( OBJ-AT ?auto_35714 ?auto_35718 ) ( IN-CITY ?auto_35717 ?auto_35716 ) ( not ( = ?auto_35709 ?auto_35717 ) ) ( OBJ-AT ?auto_35711 ?auto_35717 ) ( OBJ-AT ?auto_35713 ?auto_35718 ) ( IN-CITY ?auto_35719 ?auto_35716 ) ( not ( = ?auto_35709 ?auto_35719 ) ) ( OBJ-AT ?auto_35710 ?auto_35719 ) ( TRUCK-AT ?auto_35715 ?auto_35709 ) ( not ( = ?auto_35710 ?auto_35713 ) ) ( not ( = ?auto_35718 ?auto_35719 ) ) ( not ( = ?auto_35710 ?auto_35711 ) ) ( not ( = ?auto_35713 ?auto_35711 ) ) ( not ( = ?auto_35717 ?auto_35718 ) ) ( not ( = ?auto_35717 ?auto_35719 ) ) ( not ( = ?auto_35710 ?auto_35714 ) ) ( not ( = ?auto_35713 ?auto_35714 ) ) ( not ( = ?auto_35711 ?auto_35714 ) ) ( not ( = ?auto_35710 ?auto_35712 ) ) ( not ( = ?auto_35713 ?auto_35712 ) ) ( not ( = ?auto_35711 ?auto_35712 ) ) ( not ( = ?auto_35714 ?auto_35712 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35710 ?auto_35713 ?auto_35711 ?auto_35712 ?auto_35714 ?auto_35709 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35808 - OBJ
      ?auto_35809 - OBJ
      ?auto_35810 - OBJ
      ?auto_35811 - OBJ
      ?auto_35812 - OBJ
      ?auto_35807 - LOCATION
    )
    :vars
    (
      ?auto_35816 - LOCATION
      ?auto_35814 - CITY
      ?auto_35815 - LOCATION
      ?auto_35817 - LOCATION
      ?auto_35813 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35816 ?auto_35814 ) ( IN-CITY ?auto_35807 ?auto_35814 ) ( not ( = ?auto_35807 ?auto_35816 ) ) ( OBJ-AT ?auto_35810 ?auto_35816 ) ( OBJ-AT ?auto_35811 ?auto_35816 ) ( IN-CITY ?auto_35815 ?auto_35814 ) ( not ( = ?auto_35807 ?auto_35815 ) ) ( OBJ-AT ?auto_35809 ?auto_35815 ) ( OBJ-AT ?auto_35812 ?auto_35816 ) ( IN-CITY ?auto_35817 ?auto_35814 ) ( not ( = ?auto_35807 ?auto_35817 ) ) ( OBJ-AT ?auto_35808 ?auto_35817 ) ( TRUCK-AT ?auto_35813 ?auto_35807 ) ( not ( = ?auto_35808 ?auto_35812 ) ) ( not ( = ?auto_35816 ?auto_35817 ) ) ( not ( = ?auto_35808 ?auto_35809 ) ) ( not ( = ?auto_35812 ?auto_35809 ) ) ( not ( = ?auto_35815 ?auto_35816 ) ) ( not ( = ?auto_35815 ?auto_35817 ) ) ( not ( = ?auto_35808 ?auto_35811 ) ) ( not ( = ?auto_35812 ?auto_35811 ) ) ( not ( = ?auto_35809 ?auto_35811 ) ) ( not ( = ?auto_35808 ?auto_35810 ) ) ( not ( = ?auto_35812 ?auto_35810 ) ) ( not ( = ?auto_35809 ?auto_35810 ) ) ( not ( = ?auto_35811 ?auto_35810 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35808 ?auto_35812 ?auto_35809 ?auto_35810 ?auto_35811 ?auto_35807 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36055 - OBJ
      ?auto_36056 - OBJ
      ?auto_36057 - OBJ
      ?auto_36058 - OBJ
      ?auto_36059 - OBJ
      ?auto_36054 - LOCATION
    )
    :vars
    (
      ?auto_36063 - LOCATION
      ?auto_36061 - CITY
      ?auto_36062 - LOCATION
      ?auto_36064 - LOCATION
      ?auto_36060 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36063 ?auto_36061 ) ( IN-CITY ?auto_36054 ?auto_36061 ) ( not ( = ?auto_36054 ?auto_36063 ) ) ( OBJ-AT ?auto_36059 ?auto_36063 ) ( OBJ-AT ?auto_36056 ?auto_36063 ) ( IN-CITY ?auto_36062 ?auto_36061 ) ( not ( = ?auto_36054 ?auto_36062 ) ) ( OBJ-AT ?auto_36058 ?auto_36062 ) ( OBJ-AT ?auto_36057 ?auto_36063 ) ( IN-CITY ?auto_36064 ?auto_36061 ) ( not ( = ?auto_36054 ?auto_36064 ) ) ( OBJ-AT ?auto_36055 ?auto_36064 ) ( TRUCK-AT ?auto_36060 ?auto_36054 ) ( not ( = ?auto_36055 ?auto_36057 ) ) ( not ( = ?auto_36063 ?auto_36064 ) ) ( not ( = ?auto_36055 ?auto_36058 ) ) ( not ( = ?auto_36057 ?auto_36058 ) ) ( not ( = ?auto_36062 ?auto_36063 ) ) ( not ( = ?auto_36062 ?auto_36064 ) ) ( not ( = ?auto_36055 ?auto_36056 ) ) ( not ( = ?auto_36057 ?auto_36056 ) ) ( not ( = ?auto_36058 ?auto_36056 ) ) ( not ( = ?auto_36055 ?auto_36059 ) ) ( not ( = ?auto_36057 ?auto_36059 ) ) ( not ( = ?auto_36058 ?auto_36059 ) ) ( not ( = ?auto_36056 ?auto_36059 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36055 ?auto_36057 ?auto_36058 ?auto_36059 ?auto_36056 ?auto_36054 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36102 - OBJ
      ?auto_36103 - OBJ
      ?auto_36104 - OBJ
      ?auto_36105 - OBJ
      ?auto_36106 - OBJ
      ?auto_36101 - LOCATION
    )
    :vars
    (
      ?auto_36110 - LOCATION
      ?auto_36108 - CITY
      ?auto_36109 - LOCATION
      ?auto_36111 - LOCATION
      ?auto_36107 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36110 ?auto_36108 ) ( IN-CITY ?auto_36101 ?auto_36108 ) ( not ( = ?auto_36101 ?auto_36110 ) ) ( OBJ-AT ?auto_36105 ?auto_36110 ) ( OBJ-AT ?auto_36103 ?auto_36110 ) ( IN-CITY ?auto_36109 ?auto_36108 ) ( not ( = ?auto_36101 ?auto_36109 ) ) ( OBJ-AT ?auto_36106 ?auto_36109 ) ( OBJ-AT ?auto_36104 ?auto_36110 ) ( IN-CITY ?auto_36111 ?auto_36108 ) ( not ( = ?auto_36101 ?auto_36111 ) ) ( OBJ-AT ?auto_36102 ?auto_36111 ) ( TRUCK-AT ?auto_36107 ?auto_36101 ) ( not ( = ?auto_36102 ?auto_36104 ) ) ( not ( = ?auto_36110 ?auto_36111 ) ) ( not ( = ?auto_36102 ?auto_36106 ) ) ( not ( = ?auto_36104 ?auto_36106 ) ) ( not ( = ?auto_36109 ?auto_36110 ) ) ( not ( = ?auto_36109 ?auto_36111 ) ) ( not ( = ?auto_36102 ?auto_36103 ) ) ( not ( = ?auto_36104 ?auto_36103 ) ) ( not ( = ?auto_36106 ?auto_36103 ) ) ( not ( = ?auto_36102 ?auto_36105 ) ) ( not ( = ?auto_36104 ?auto_36105 ) ) ( not ( = ?auto_36106 ?auto_36105 ) ) ( not ( = ?auto_36103 ?auto_36105 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36102 ?auto_36104 ?auto_36106 ?auto_36105 ?auto_36103 ?auto_36101 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36149 - OBJ
      ?auto_36150 - OBJ
      ?auto_36151 - OBJ
      ?auto_36152 - OBJ
      ?auto_36153 - OBJ
      ?auto_36148 - LOCATION
    )
    :vars
    (
      ?auto_36157 - LOCATION
      ?auto_36155 - CITY
      ?auto_36156 - LOCATION
      ?auto_36158 - LOCATION
      ?auto_36154 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36157 ?auto_36155 ) ( IN-CITY ?auto_36148 ?auto_36155 ) ( not ( = ?auto_36148 ?auto_36157 ) ) ( OBJ-AT ?auto_36153 ?auto_36157 ) ( OBJ-AT ?auto_36150 ?auto_36157 ) ( IN-CITY ?auto_36156 ?auto_36155 ) ( not ( = ?auto_36148 ?auto_36156 ) ) ( OBJ-AT ?auto_36151 ?auto_36156 ) ( OBJ-AT ?auto_36152 ?auto_36157 ) ( IN-CITY ?auto_36158 ?auto_36155 ) ( not ( = ?auto_36148 ?auto_36158 ) ) ( OBJ-AT ?auto_36149 ?auto_36158 ) ( TRUCK-AT ?auto_36154 ?auto_36148 ) ( not ( = ?auto_36149 ?auto_36152 ) ) ( not ( = ?auto_36157 ?auto_36158 ) ) ( not ( = ?auto_36149 ?auto_36151 ) ) ( not ( = ?auto_36152 ?auto_36151 ) ) ( not ( = ?auto_36156 ?auto_36157 ) ) ( not ( = ?auto_36156 ?auto_36158 ) ) ( not ( = ?auto_36149 ?auto_36150 ) ) ( not ( = ?auto_36152 ?auto_36150 ) ) ( not ( = ?auto_36151 ?auto_36150 ) ) ( not ( = ?auto_36149 ?auto_36153 ) ) ( not ( = ?auto_36152 ?auto_36153 ) ) ( not ( = ?auto_36151 ?auto_36153 ) ) ( not ( = ?auto_36150 ?auto_36153 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36149 ?auto_36152 ?auto_36151 ?auto_36153 ?auto_36150 ?auto_36148 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36196 - OBJ
      ?auto_36197 - OBJ
      ?auto_36198 - OBJ
      ?auto_36199 - OBJ
      ?auto_36200 - OBJ
      ?auto_36195 - LOCATION
    )
    :vars
    (
      ?auto_36204 - LOCATION
      ?auto_36202 - CITY
      ?auto_36203 - LOCATION
      ?auto_36205 - LOCATION
      ?auto_36201 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36204 ?auto_36202 ) ( IN-CITY ?auto_36195 ?auto_36202 ) ( not ( = ?auto_36195 ?auto_36204 ) ) ( OBJ-AT ?auto_36199 ?auto_36204 ) ( OBJ-AT ?auto_36197 ?auto_36204 ) ( IN-CITY ?auto_36203 ?auto_36202 ) ( not ( = ?auto_36195 ?auto_36203 ) ) ( OBJ-AT ?auto_36198 ?auto_36203 ) ( OBJ-AT ?auto_36200 ?auto_36204 ) ( IN-CITY ?auto_36205 ?auto_36202 ) ( not ( = ?auto_36195 ?auto_36205 ) ) ( OBJ-AT ?auto_36196 ?auto_36205 ) ( TRUCK-AT ?auto_36201 ?auto_36195 ) ( not ( = ?auto_36196 ?auto_36200 ) ) ( not ( = ?auto_36204 ?auto_36205 ) ) ( not ( = ?auto_36196 ?auto_36198 ) ) ( not ( = ?auto_36200 ?auto_36198 ) ) ( not ( = ?auto_36203 ?auto_36204 ) ) ( not ( = ?auto_36203 ?auto_36205 ) ) ( not ( = ?auto_36196 ?auto_36197 ) ) ( not ( = ?auto_36200 ?auto_36197 ) ) ( not ( = ?auto_36198 ?auto_36197 ) ) ( not ( = ?auto_36196 ?auto_36199 ) ) ( not ( = ?auto_36200 ?auto_36199 ) ) ( not ( = ?auto_36198 ?auto_36199 ) ) ( not ( = ?auto_36197 ?auto_36199 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36196 ?auto_36200 ?auto_36198 ?auto_36199 ?auto_36197 ?auto_36195 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36443 - OBJ
      ?auto_36444 - OBJ
      ?auto_36445 - OBJ
      ?auto_36446 - OBJ
      ?auto_36447 - OBJ
      ?auto_36442 - LOCATION
    )
    :vars
    (
      ?auto_36451 - LOCATION
      ?auto_36449 - CITY
      ?auto_36450 - LOCATION
      ?auto_36452 - LOCATION
      ?auto_36448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36451 ?auto_36449 ) ( IN-CITY ?auto_36442 ?auto_36449 ) ( not ( = ?auto_36442 ?auto_36451 ) ) ( OBJ-AT ?auto_36445 ?auto_36451 ) ( OBJ-AT ?auto_36444 ?auto_36451 ) ( IN-CITY ?auto_36450 ?auto_36449 ) ( not ( = ?auto_36442 ?auto_36450 ) ) ( OBJ-AT ?auto_36447 ?auto_36450 ) ( OBJ-AT ?auto_36446 ?auto_36451 ) ( IN-CITY ?auto_36452 ?auto_36449 ) ( not ( = ?auto_36442 ?auto_36452 ) ) ( OBJ-AT ?auto_36443 ?auto_36452 ) ( TRUCK-AT ?auto_36448 ?auto_36442 ) ( not ( = ?auto_36443 ?auto_36446 ) ) ( not ( = ?auto_36451 ?auto_36452 ) ) ( not ( = ?auto_36443 ?auto_36447 ) ) ( not ( = ?auto_36446 ?auto_36447 ) ) ( not ( = ?auto_36450 ?auto_36451 ) ) ( not ( = ?auto_36450 ?auto_36452 ) ) ( not ( = ?auto_36443 ?auto_36444 ) ) ( not ( = ?auto_36446 ?auto_36444 ) ) ( not ( = ?auto_36447 ?auto_36444 ) ) ( not ( = ?auto_36443 ?auto_36445 ) ) ( not ( = ?auto_36446 ?auto_36445 ) ) ( not ( = ?auto_36447 ?auto_36445 ) ) ( not ( = ?auto_36444 ?auto_36445 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36443 ?auto_36446 ?auto_36447 ?auto_36445 ?auto_36444 ?auto_36442 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36490 - OBJ
      ?auto_36491 - OBJ
      ?auto_36492 - OBJ
      ?auto_36493 - OBJ
      ?auto_36494 - OBJ
      ?auto_36489 - LOCATION
    )
    :vars
    (
      ?auto_36498 - LOCATION
      ?auto_36496 - CITY
      ?auto_36497 - LOCATION
      ?auto_36499 - LOCATION
      ?auto_36495 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36498 ?auto_36496 ) ( IN-CITY ?auto_36489 ?auto_36496 ) ( not ( = ?auto_36489 ?auto_36498 ) ) ( OBJ-AT ?auto_36492 ?auto_36498 ) ( OBJ-AT ?auto_36491 ?auto_36498 ) ( IN-CITY ?auto_36497 ?auto_36496 ) ( not ( = ?auto_36489 ?auto_36497 ) ) ( OBJ-AT ?auto_36493 ?auto_36497 ) ( OBJ-AT ?auto_36494 ?auto_36498 ) ( IN-CITY ?auto_36499 ?auto_36496 ) ( not ( = ?auto_36489 ?auto_36499 ) ) ( OBJ-AT ?auto_36490 ?auto_36499 ) ( TRUCK-AT ?auto_36495 ?auto_36489 ) ( not ( = ?auto_36490 ?auto_36494 ) ) ( not ( = ?auto_36498 ?auto_36499 ) ) ( not ( = ?auto_36490 ?auto_36493 ) ) ( not ( = ?auto_36494 ?auto_36493 ) ) ( not ( = ?auto_36497 ?auto_36498 ) ) ( not ( = ?auto_36497 ?auto_36499 ) ) ( not ( = ?auto_36490 ?auto_36491 ) ) ( not ( = ?auto_36494 ?auto_36491 ) ) ( not ( = ?auto_36493 ?auto_36491 ) ) ( not ( = ?auto_36490 ?auto_36492 ) ) ( not ( = ?auto_36494 ?auto_36492 ) ) ( not ( = ?auto_36493 ?auto_36492 ) ) ( not ( = ?auto_36491 ?auto_36492 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36490 ?auto_36494 ?auto_36493 ?auto_36492 ?auto_36491 ?auto_36489 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37148 - OBJ
      ?auto_37149 - OBJ
      ?auto_37150 - OBJ
      ?auto_37151 - OBJ
      ?auto_37152 - OBJ
      ?auto_37147 - LOCATION
    )
    :vars
    (
      ?auto_37156 - LOCATION
      ?auto_37154 - CITY
      ?auto_37155 - LOCATION
      ?auto_37157 - LOCATION
      ?auto_37153 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37156 ?auto_37154 ) ( IN-CITY ?auto_37147 ?auto_37154 ) ( not ( = ?auto_37147 ?auto_37156 ) ) ( OBJ-AT ?auto_37149 ?auto_37156 ) ( OBJ-AT ?auto_37152 ?auto_37156 ) ( IN-CITY ?auto_37155 ?auto_37154 ) ( not ( = ?auto_37147 ?auto_37155 ) ) ( OBJ-AT ?auto_37151 ?auto_37155 ) ( OBJ-AT ?auto_37150 ?auto_37156 ) ( IN-CITY ?auto_37157 ?auto_37154 ) ( not ( = ?auto_37147 ?auto_37157 ) ) ( OBJ-AT ?auto_37148 ?auto_37157 ) ( TRUCK-AT ?auto_37153 ?auto_37147 ) ( not ( = ?auto_37148 ?auto_37150 ) ) ( not ( = ?auto_37156 ?auto_37157 ) ) ( not ( = ?auto_37148 ?auto_37151 ) ) ( not ( = ?auto_37150 ?auto_37151 ) ) ( not ( = ?auto_37155 ?auto_37156 ) ) ( not ( = ?auto_37155 ?auto_37157 ) ) ( not ( = ?auto_37148 ?auto_37152 ) ) ( not ( = ?auto_37150 ?auto_37152 ) ) ( not ( = ?auto_37151 ?auto_37152 ) ) ( not ( = ?auto_37148 ?auto_37149 ) ) ( not ( = ?auto_37150 ?auto_37149 ) ) ( not ( = ?auto_37151 ?auto_37149 ) ) ( not ( = ?auto_37152 ?auto_37149 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37148 ?auto_37150 ?auto_37151 ?auto_37149 ?auto_37152 ?auto_37147 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37195 - OBJ
      ?auto_37196 - OBJ
      ?auto_37197 - OBJ
      ?auto_37198 - OBJ
      ?auto_37199 - OBJ
      ?auto_37194 - LOCATION
    )
    :vars
    (
      ?auto_37203 - LOCATION
      ?auto_37201 - CITY
      ?auto_37202 - LOCATION
      ?auto_37204 - LOCATION
      ?auto_37200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37203 ?auto_37201 ) ( IN-CITY ?auto_37194 ?auto_37201 ) ( not ( = ?auto_37194 ?auto_37203 ) ) ( OBJ-AT ?auto_37196 ?auto_37203 ) ( OBJ-AT ?auto_37198 ?auto_37203 ) ( IN-CITY ?auto_37202 ?auto_37201 ) ( not ( = ?auto_37194 ?auto_37202 ) ) ( OBJ-AT ?auto_37199 ?auto_37202 ) ( OBJ-AT ?auto_37197 ?auto_37203 ) ( IN-CITY ?auto_37204 ?auto_37201 ) ( not ( = ?auto_37194 ?auto_37204 ) ) ( OBJ-AT ?auto_37195 ?auto_37204 ) ( TRUCK-AT ?auto_37200 ?auto_37194 ) ( not ( = ?auto_37195 ?auto_37197 ) ) ( not ( = ?auto_37203 ?auto_37204 ) ) ( not ( = ?auto_37195 ?auto_37199 ) ) ( not ( = ?auto_37197 ?auto_37199 ) ) ( not ( = ?auto_37202 ?auto_37203 ) ) ( not ( = ?auto_37202 ?auto_37204 ) ) ( not ( = ?auto_37195 ?auto_37198 ) ) ( not ( = ?auto_37197 ?auto_37198 ) ) ( not ( = ?auto_37199 ?auto_37198 ) ) ( not ( = ?auto_37195 ?auto_37196 ) ) ( not ( = ?auto_37197 ?auto_37196 ) ) ( not ( = ?auto_37199 ?auto_37196 ) ) ( not ( = ?auto_37198 ?auto_37196 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37195 ?auto_37197 ?auto_37199 ?auto_37196 ?auto_37198 ?auto_37194 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37392 - OBJ
      ?auto_37393 - OBJ
      ?auto_37394 - OBJ
      ?auto_37395 - OBJ
      ?auto_37396 - OBJ
      ?auto_37391 - LOCATION
    )
    :vars
    (
      ?auto_37400 - LOCATION
      ?auto_37398 - CITY
      ?auto_37399 - LOCATION
      ?auto_37401 - LOCATION
      ?auto_37397 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37400 ?auto_37398 ) ( IN-CITY ?auto_37391 ?auto_37398 ) ( not ( = ?auto_37391 ?auto_37400 ) ) ( OBJ-AT ?auto_37393 ?auto_37400 ) ( OBJ-AT ?auto_37396 ?auto_37400 ) ( IN-CITY ?auto_37399 ?auto_37398 ) ( not ( = ?auto_37391 ?auto_37399 ) ) ( OBJ-AT ?auto_37394 ?auto_37399 ) ( OBJ-AT ?auto_37395 ?auto_37400 ) ( IN-CITY ?auto_37401 ?auto_37398 ) ( not ( = ?auto_37391 ?auto_37401 ) ) ( OBJ-AT ?auto_37392 ?auto_37401 ) ( TRUCK-AT ?auto_37397 ?auto_37391 ) ( not ( = ?auto_37392 ?auto_37395 ) ) ( not ( = ?auto_37400 ?auto_37401 ) ) ( not ( = ?auto_37392 ?auto_37394 ) ) ( not ( = ?auto_37395 ?auto_37394 ) ) ( not ( = ?auto_37399 ?auto_37400 ) ) ( not ( = ?auto_37399 ?auto_37401 ) ) ( not ( = ?auto_37392 ?auto_37396 ) ) ( not ( = ?auto_37395 ?auto_37396 ) ) ( not ( = ?auto_37394 ?auto_37396 ) ) ( not ( = ?auto_37392 ?auto_37393 ) ) ( not ( = ?auto_37395 ?auto_37393 ) ) ( not ( = ?auto_37394 ?auto_37393 ) ) ( not ( = ?auto_37396 ?auto_37393 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37392 ?auto_37395 ?auto_37394 ?auto_37393 ?auto_37396 ?auto_37391 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37490 - OBJ
      ?auto_37491 - OBJ
      ?auto_37492 - OBJ
      ?auto_37493 - OBJ
      ?auto_37494 - OBJ
      ?auto_37489 - LOCATION
    )
    :vars
    (
      ?auto_37498 - LOCATION
      ?auto_37496 - CITY
      ?auto_37497 - LOCATION
      ?auto_37499 - LOCATION
      ?auto_37495 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37498 ?auto_37496 ) ( IN-CITY ?auto_37489 ?auto_37496 ) ( not ( = ?auto_37489 ?auto_37498 ) ) ( OBJ-AT ?auto_37491 ?auto_37498 ) ( OBJ-AT ?auto_37493 ?auto_37498 ) ( IN-CITY ?auto_37497 ?auto_37496 ) ( not ( = ?auto_37489 ?auto_37497 ) ) ( OBJ-AT ?auto_37492 ?auto_37497 ) ( OBJ-AT ?auto_37494 ?auto_37498 ) ( IN-CITY ?auto_37499 ?auto_37496 ) ( not ( = ?auto_37489 ?auto_37499 ) ) ( OBJ-AT ?auto_37490 ?auto_37499 ) ( TRUCK-AT ?auto_37495 ?auto_37489 ) ( not ( = ?auto_37490 ?auto_37494 ) ) ( not ( = ?auto_37498 ?auto_37499 ) ) ( not ( = ?auto_37490 ?auto_37492 ) ) ( not ( = ?auto_37494 ?auto_37492 ) ) ( not ( = ?auto_37497 ?auto_37498 ) ) ( not ( = ?auto_37497 ?auto_37499 ) ) ( not ( = ?auto_37490 ?auto_37493 ) ) ( not ( = ?auto_37494 ?auto_37493 ) ) ( not ( = ?auto_37492 ?auto_37493 ) ) ( not ( = ?auto_37490 ?auto_37491 ) ) ( not ( = ?auto_37494 ?auto_37491 ) ) ( not ( = ?auto_37492 ?auto_37491 ) ) ( not ( = ?auto_37493 ?auto_37491 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37490 ?auto_37494 ?auto_37492 ?auto_37491 ?auto_37493 ?auto_37489 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37687 - OBJ
      ?auto_37688 - OBJ
      ?auto_37689 - OBJ
      ?auto_37690 - OBJ
      ?auto_37691 - OBJ
      ?auto_37686 - LOCATION
    )
    :vars
    (
      ?auto_37695 - LOCATION
      ?auto_37693 - CITY
      ?auto_37694 - LOCATION
      ?auto_37696 - LOCATION
      ?auto_37692 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37695 ?auto_37693 ) ( IN-CITY ?auto_37686 ?auto_37693 ) ( not ( = ?auto_37686 ?auto_37695 ) ) ( OBJ-AT ?auto_37688 ?auto_37695 ) ( OBJ-AT ?auto_37689 ?auto_37695 ) ( IN-CITY ?auto_37694 ?auto_37693 ) ( not ( = ?auto_37686 ?auto_37694 ) ) ( OBJ-AT ?auto_37691 ?auto_37694 ) ( OBJ-AT ?auto_37690 ?auto_37695 ) ( IN-CITY ?auto_37696 ?auto_37693 ) ( not ( = ?auto_37686 ?auto_37696 ) ) ( OBJ-AT ?auto_37687 ?auto_37696 ) ( TRUCK-AT ?auto_37692 ?auto_37686 ) ( not ( = ?auto_37687 ?auto_37690 ) ) ( not ( = ?auto_37695 ?auto_37696 ) ) ( not ( = ?auto_37687 ?auto_37691 ) ) ( not ( = ?auto_37690 ?auto_37691 ) ) ( not ( = ?auto_37694 ?auto_37695 ) ) ( not ( = ?auto_37694 ?auto_37696 ) ) ( not ( = ?auto_37687 ?auto_37689 ) ) ( not ( = ?auto_37690 ?auto_37689 ) ) ( not ( = ?auto_37691 ?auto_37689 ) ) ( not ( = ?auto_37687 ?auto_37688 ) ) ( not ( = ?auto_37690 ?auto_37688 ) ) ( not ( = ?auto_37691 ?auto_37688 ) ) ( not ( = ?auto_37689 ?auto_37688 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37687 ?auto_37690 ?auto_37691 ?auto_37688 ?auto_37689 ?auto_37686 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37734 - OBJ
      ?auto_37735 - OBJ
      ?auto_37736 - OBJ
      ?auto_37737 - OBJ
      ?auto_37738 - OBJ
      ?auto_37733 - LOCATION
    )
    :vars
    (
      ?auto_37742 - LOCATION
      ?auto_37740 - CITY
      ?auto_37741 - LOCATION
      ?auto_37743 - LOCATION
      ?auto_37739 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37742 ?auto_37740 ) ( IN-CITY ?auto_37733 ?auto_37740 ) ( not ( = ?auto_37733 ?auto_37742 ) ) ( OBJ-AT ?auto_37735 ?auto_37742 ) ( OBJ-AT ?auto_37736 ?auto_37742 ) ( IN-CITY ?auto_37741 ?auto_37740 ) ( not ( = ?auto_37733 ?auto_37741 ) ) ( OBJ-AT ?auto_37737 ?auto_37741 ) ( OBJ-AT ?auto_37738 ?auto_37742 ) ( IN-CITY ?auto_37743 ?auto_37740 ) ( not ( = ?auto_37733 ?auto_37743 ) ) ( OBJ-AT ?auto_37734 ?auto_37743 ) ( TRUCK-AT ?auto_37739 ?auto_37733 ) ( not ( = ?auto_37734 ?auto_37738 ) ) ( not ( = ?auto_37742 ?auto_37743 ) ) ( not ( = ?auto_37734 ?auto_37737 ) ) ( not ( = ?auto_37738 ?auto_37737 ) ) ( not ( = ?auto_37741 ?auto_37742 ) ) ( not ( = ?auto_37741 ?auto_37743 ) ) ( not ( = ?auto_37734 ?auto_37736 ) ) ( not ( = ?auto_37738 ?auto_37736 ) ) ( not ( = ?auto_37737 ?auto_37736 ) ) ( not ( = ?auto_37734 ?auto_37735 ) ) ( not ( = ?auto_37738 ?auto_37735 ) ) ( not ( = ?auto_37737 ?auto_37735 ) ) ( not ( = ?auto_37736 ?auto_37735 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37734 ?auto_37738 ?auto_37737 ?auto_37735 ?auto_37736 ?auto_37733 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_38492 - OBJ
      ?auto_38493 - OBJ
      ?auto_38494 - OBJ
      ?auto_38495 - OBJ
      ?auto_38496 - OBJ
      ?auto_38491 - LOCATION
    )
    :vars
    (
      ?auto_38500 - LOCATION
      ?auto_38498 - CITY
      ?auto_38499 - LOCATION
      ?auto_38501 - LOCATION
      ?auto_38497 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_38500 ?auto_38498 ) ( IN-CITY ?auto_38491 ?auto_38498 ) ( not ( = ?auto_38491 ?auto_38500 ) ) ( OBJ-AT ?auto_38496 ?auto_38500 ) ( OBJ-AT ?auto_38495 ?auto_38500 ) ( IN-CITY ?auto_38499 ?auto_38498 ) ( not ( = ?auto_38491 ?auto_38499 ) ) ( OBJ-AT ?auto_38494 ?auto_38499 ) ( OBJ-AT ?auto_38492 ?auto_38500 ) ( IN-CITY ?auto_38501 ?auto_38498 ) ( not ( = ?auto_38491 ?auto_38501 ) ) ( OBJ-AT ?auto_38493 ?auto_38501 ) ( TRUCK-AT ?auto_38497 ?auto_38491 ) ( not ( = ?auto_38493 ?auto_38492 ) ) ( not ( = ?auto_38500 ?auto_38501 ) ) ( not ( = ?auto_38493 ?auto_38494 ) ) ( not ( = ?auto_38492 ?auto_38494 ) ) ( not ( = ?auto_38499 ?auto_38500 ) ) ( not ( = ?auto_38499 ?auto_38501 ) ) ( not ( = ?auto_38493 ?auto_38495 ) ) ( not ( = ?auto_38492 ?auto_38495 ) ) ( not ( = ?auto_38494 ?auto_38495 ) ) ( not ( = ?auto_38493 ?auto_38496 ) ) ( not ( = ?auto_38492 ?auto_38496 ) ) ( not ( = ?auto_38494 ?auto_38496 ) ) ( not ( = ?auto_38495 ?auto_38496 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_38493 ?auto_38492 ?auto_38494 ?auto_38496 ?auto_38495 ?auto_38491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_38539 - OBJ
      ?auto_38540 - OBJ
      ?auto_38541 - OBJ
      ?auto_38542 - OBJ
      ?auto_38543 - OBJ
      ?auto_38538 - LOCATION
    )
    :vars
    (
      ?auto_38547 - LOCATION
      ?auto_38545 - CITY
      ?auto_38546 - LOCATION
      ?auto_38548 - LOCATION
      ?auto_38544 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_38547 ?auto_38545 ) ( IN-CITY ?auto_38538 ?auto_38545 ) ( not ( = ?auto_38538 ?auto_38547 ) ) ( OBJ-AT ?auto_38542 ?auto_38547 ) ( OBJ-AT ?auto_38543 ?auto_38547 ) ( IN-CITY ?auto_38546 ?auto_38545 ) ( not ( = ?auto_38538 ?auto_38546 ) ) ( OBJ-AT ?auto_38541 ?auto_38546 ) ( OBJ-AT ?auto_38539 ?auto_38547 ) ( IN-CITY ?auto_38548 ?auto_38545 ) ( not ( = ?auto_38538 ?auto_38548 ) ) ( OBJ-AT ?auto_38540 ?auto_38548 ) ( TRUCK-AT ?auto_38544 ?auto_38538 ) ( not ( = ?auto_38540 ?auto_38539 ) ) ( not ( = ?auto_38547 ?auto_38548 ) ) ( not ( = ?auto_38540 ?auto_38541 ) ) ( not ( = ?auto_38539 ?auto_38541 ) ) ( not ( = ?auto_38546 ?auto_38547 ) ) ( not ( = ?auto_38546 ?auto_38548 ) ) ( not ( = ?auto_38540 ?auto_38543 ) ) ( not ( = ?auto_38539 ?auto_38543 ) ) ( not ( = ?auto_38541 ?auto_38543 ) ) ( not ( = ?auto_38540 ?auto_38542 ) ) ( not ( = ?auto_38539 ?auto_38542 ) ) ( not ( = ?auto_38541 ?auto_38542 ) ) ( not ( = ?auto_38543 ?auto_38542 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_38540 ?auto_38539 ?auto_38541 ?auto_38542 ?auto_38543 ?auto_38538 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_38586 - OBJ
      ?auto_38587 - OBJ
      ?auto_38588 - OBJ
      ?auto_38589 - OBJ
      ?auto_38590 - OBJ
      ?auto_38585 - LOCATION
    )
    :vars
    (
      ?auto_38594 - LOCATION
      ?auto_38592 - CITY
      ?auto_38593 - LOCATION
      ?auto_38595 - LOCATION
      ?auto_38591 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_38594 ?auto_38592 ) ( IN-CITY ?auto_38585 ?auto_38592 ) ( not ( = ?auto_38585 ?auto_38594 ) ) ( OBJ-AT ?auto_38590 ?auto_38594 ) ( OBJ-AT ?auto_38588 ?auto_38594 ) ( IN-CITY ?auto_38593 ?auto_38592 ) ( not ( = ?auto_38585 ?auto_38593 ) ) ( OBJ-AT ?auto_38589 ?auto_38593 ) ( OBJ-AT ?auto_38586 ?auto_38594 ) ( IN-CITY ?auto_38595 ?auto_38592 ) ( not ( = ?auto_38585 ?auto_38595 ) ) ( OBJ-AT ?auto_38587 ?auto_38595 ) ( TRUCK-AT ?auto_38591 ?auto_38585 ) ( not ( = ?auto_38587 ?auto_38586 ) ) ( not ( = ?auto_38594 ?auto_38595 ) ) ( not ( = ?auto_38587 ?auto_38589 ) ) ( not ( = ?auto_38586 ?auto_38589 ) ) ( not ( = ?auto_38593 ?auto_38594 ) ) ( not ( = ?auto_38593 ?auto_38595 ) ) ( not ( = ?auto_38587 ?auto_38588 ) ) ( not ( = ?auto_38586 ?auto_38588 ) ) ( not ( = ?auto_38589 ?auto_38588 ) ) ( not ( = ?auto_38587 ?auto_38590 ) ) ( not ( = ?auto_38586 ?auto_38590 ) ) ( not ( = ?auto_38589 ?auto_38590 ) ) ( not ( = ?auto_38588 ?auto_38590 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_38587 ?auto_38586 ?auto_38589 ?auto_38590 ?auto_38588 ?auto_38585 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_38633 - OBJ
      ?auto_38634 - OBJ
      ?auto_38635 - OBJ
      ?auto_38636 - OBJ
      ?auto_38637 - OBJ
      ?auto_38632 - LOCATION
    )
    :vars
    (
      ?auto_38641 - LOCATION
      ?auto_38639 - CITY
      ?auto_38640 - LOCATION
      ?auto_38642 - LOCATION
      ?auto_38638 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_38641 ?auto_38639 ) ( IN-CITY ?auto_38632 ?auto_38639 ) ( not ( = ?auto_38632 ?auto_38641 ) ) ( OBJ-AT ?auto_38636 ?auto_38641 ) ( OBJ-AT ?auto_38635 ?auto_38641 ) ( IN-CITY ?auto_38640 ?auto_38639 ) ( not ( = ?auto_38632 ?auto_38640 ) ) ( OBJ-AT ?auto_38637 ?auto_38640 ) ( OBJ-AT ?auto_38633 ?auto_38641 ) ( IN-CITY ?auto_38642 ?auto_38639 ) ( not ( = ?auto_38632 ?auto_38642 ) ) ( OBJ-AT ?auto_38634 ?auto_38642 ) ( TRUCK-AT ?auto_38638 ?auto_38632 ) ( not ( = ?auto_38634 ?auto_38633 ) ) ( not ( = ?auto_38641 ?auto_38642 ) ) ( not ( = ?auto_38634 ?auto_38637 ) ) ( not ( = ?auto_38633 ?auto_38637 ) ) ( not ( = ?auto_38640 ?auto_38641 ) ) ( not ( = ?auto_38640 ?auto_38642 ) ) ( not ( = ?auto_38634 ?auto_38635 ) ) ( not ( = ?auto_38633 ?auto_38635 ) ) ( not ( = ?auto_38637 ?auto_38635 ) ) ( not ( = ?auto_38634 ?auto_38636 ) ) ( not ( = ?auto_38633 ?auto_38636 ) ) ( not ( = ?auto_38637 ?auto_38636 ) ) ( not ( = ?auto_38635 ?auto_38636 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_38634 ?auto_38633 ?auto_38637 ?auto_38636 ?auto_38635 ?auto_38632 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_38830 - OBJ
      ?auto_38831 - OBJ
      ?auto_38832 - OBJ
      ?auto_38833 - OBJ
      ?auto_38834 - OBJ
      ?auto_38829 - LOCATION
    )
    :vars
    (
      ?auto_38838 - LOCATION
      ?auto_38836 - CITY
      ?auto_38837 - LOCATION
      ?auto_38839 - LOCATION
      ?auto_38835 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_38838 ?auto_38836 ) ( IN-CITY ?auto_38829 ?auto_38836 ) ( not ( = ?auto_38829 ?auto_38838 ) ) ( OBJ-AT ?auto_38832 ?auto_38838 ) ( OBJ-AT ?auto_38834 ?auto_38838 ) ( IN-CITY ?auto_38837 ?auto_38836 ) ( not ( = ?auto_38829 ?auto_38837 ) ) ( OBJ-AT ?auto_38833 ?auto_38837 ) ( OBJ-AT ?auto_38830 ?auto_38838 ) ( IN-CITY ?auto_38839 ?auto_38836 ) ( not ( = ?auto_38829 ?auto_38839 ) ) ( OBJ-AT ?auto_38831 ?auto_38839 ) ( TRUCK-AT ?auto_38835 ?auto_38829 ) ( not ( = ?auto_38831 ?auto_38830 ) ) ( not ( = ?auto_38838 ?auto_38839 ) ) ( not ( = ?auto_38831 ?auto_38833 ) ) ( not ( = ?auto_38830 ?auto_38833 ) ) ( not ( = ?auto_38837 ?auto_38838 ) ) ( not ( = ?auto_38837 ?auto_38839 ) ) ( not ( = ?auto_38831 ?auto_38834 ) ) ( not ( = ?auto_38830 ?auto_38834 ) ) ( not ( = ?auto_38833 ?auto_38834 ) ) ( not ( = ?auto_38831 ?auto_38832 ) ) ( not ( = ?auto_38830 ?auto_38832 ) ) ( not ( = ?auto_38833 ?auto_38832 ) ) ( not ( = ?auto_38834 ?auto_38832 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_38831 ?auto_38830 ?auto_38833 ?auto_38832 ?auto_38834 ?auto_38829 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_38877 - OBJ
      ?auto_38878 - OBJ
      ?auto_38879 - OBJ
      ?auto_38880 - OBJ
      ?auto_38881 - OBJ
      ?auto_38876 - LOCATION
    )
    :vars
    (
      ?auto_38885 - LOCATION
      ?auto_38883 - CITY
      ?auto_38884 - LOCATION
      ?auto_38886 - LOCATION
      ?auto_38882 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_38885 ?auto_38883 ) ( IN-CITY ?auto_38876 ?auto_38883 ) ( not ( = ?auto_38876 ?auto_38885 ) ) ( OBJ-AT ?auto_38879 ?auto_38885 ) ( OBJ-AT ?auto_38880 ?auto_38885 ) ( IN-CITY ?auto_38884 ?auto_38883 ) ( not ( = ?auto_38876 ?auto_38884 ) ) ( OBJ-AT ?auto_38881 ?auto_38884 ) ( OBJ-AT ?auto_38877 ?auto_38885 ) ( IN-CITY ?auto_38886 ?auto_38883 ) ( not ( = ?auto_38876 ?auto_38886 ) ) ( OBJ-AT ?auto_38878 ?auto_38886 ) ( TRUCK-AT ?auto_38882 ?auto_38876 ) ( not ( = ?auto_38878 ?auto_38877 ) ) ( not ( = ?auto_38885 ?auto_38886 ) ) ( not ( = ?auto_38878 ?auto_38881 ) ) ( not ( = ?auto_38877 ?auto_38881 ) ) ( not ( = ?auto_38884 ?auto_38885 ) ) ( not ( = ?auto_38884 ?auto_38886 ) ) ( not ( = ?auto_38878 ?auto_38880 ) ) ( not ( = ?auto_38877 ?auto_38880 ) ) ( not ( = ?auto_38881 ?auto_38880 ) ) ( not ( = ?auto_38878 ?auto_38879 ) ) ( not ( = ?auto_38877 ?auto_38879 ) ) ( not ( = ?auto_38881 ?auto_38879 ) ) ( not ( = ?auto_38880 ?auto_38879 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_38878 ?auto_38877 ?auto_38881 ?auto_38879 ?auto_38880 ?auto_38876 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39793 - OBJ
      ?auto_39794 - OBJ
      ?auto_39795 - OBJ
      ?auto_39796 - OBJ
      ?auto_39797 - OBJ
      ?auto_39792 - LOCATION
    )
    :vars
    (
      ?auto_39801 - LOCATION
      ?auto_39799 - CITY
      ?auto_39800 - LOCATION
      ?auto_39802 - LOCATION
      ?auto_39798 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39801 ?auto_39799 ) ( IN-CITY ?auto_39792 ?auto_39799 ) ( not ( = ?auto_39792 ?auto_39801 ) ) ( OBJ-AT ?auto_39797 ?auto_39801 ) ( OBJ-AT ?auto_39796 ?auto_39801 ) ( IN-CITY ?auto_39800 ?auto_39799 ) ( not ( = ?auto_39792 ?auto_39800 ) ) ( OBJ-AT ?auto_39794 ?auto_39800 ) ( OBJ-AT ?auto_39793 ?auto_39801 ) ( IN-CITY ?auto_39802 ?auto_39799 ) ( not ( = ?auto_39792 ?auto_39802 ) ) ( OBJ-AT ?auto_39795 ?auto_39802 ) ( TRUCK-AT ?auto_39798 ?auto_39792 ) ( not ( = ?auto_39795 ?auto_39793 ) ) ( not ( = ?auto_39801 ?auto_39802 ) ) ( not ( = ?auto_39795 ?auto_39794 ) ) ( not ( = ?auto_39793 ?auto_39794 ) ) ( not ( = ?auto_39800 ?auto_39801 ) ) ( not ( = ?auto_39800 ?auto_39802 ) ) ( not ( = ?auto_39795 ?auto_39796 ) ) ( not ( = ?auto_39793 ?auto_39796 ) ) ( not ( = ?auto_39794 ?auto_39796 ) ) ( not ( = ?auto_39795 ?auto_39797 ) ) ( not ( = ?auto_39793 ?auto_39797 ) ) ( not ( = ?auto_39794 ?auto_39797 ) ) ( not ( = ?auto_39796 ?auto_39797 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39795 ?auto_39793 ?auto_39794 ?auto_39797 ?auto_39796 ?auto_39792 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39840 - OBJ
      ?auto_39841 - OBJ
      ?auto_39842 - OBJ
      ?auto_39843 - OBJ
      ?auto_39844 - OBJ
      ?auto_39839 - LOCATION
    )
    :vars
    (
      ?auto_39848 - LOCATION
      ?auto_39846 - CITY
      ?auto_39847 - LOCATION
      ?auto_39849 - LOCATION
      ?auto_39845 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39848 ?auto_39846 ) ( IN-CITY ?auto_39839 ?auto_39846 ) ( not ( = ?auto_39839 ?auto_39848 ) ) ( OBJ-AT ?auto_39843 ?auto_39848 ) ( OBJ-AT ?auto_39844 ?auto_39848 ) ( IN-CITY ?auto_39847 ?auto_39846 ) ( not ( = ?auto_39839 ?auto_39847 ) ) ( OBJ-AT ?auto_39841 ?auto_39847 ) ( OBJ-AT ?auto_39840 ?auto_39848 ) ( IN-CITY ?auto_39849 ?auto_39846 ) ( not ( = ?auto_39839 ?auto_39849 ) ) ( OBJ-AT ?auto_39842 ?auto_39849 ) ( TRUCK-AT ?auto_39845 ?auto_39839 ) ( not ( = ?auto_39842 ?auto_39840 ) ) ( not ( = ?auto_39848 ?auto_39849 ) ) ( not ( = ?auto_39842 ?auto_39841 ) ) ( not ( = ?auto_39840 ?auto_39841 ) ) ( not ( = ?auto_39847 ?auto_39848 ) ) ( not ( = ?auto_39847 ?auto_39849 ) ) ( not ( = ?auto_39842 ?auto_39844 ) ) ( not ( = ?auto_39840 ?auto_39844 ) ) ( not ( = ?auto_39841 ?auto_39844 ) ) ( not ( = ?auto_39842 ?auto_39843 ) ) ( not ( = ?auto_39840 ?auto_39843 ) ) ( not ( = ?auto_39841 ?auto_39843 ) ) ( not ( = ?auto_39844 ?auto_39843 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39842 ?auto_39840 ?auto_39841 ?auto_39843 ?auto_39844 ?auto_39839 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40089 - OBJ
      ?auto_40090 - OBJ
      ?auto_40091 - OBJ
      ?auto_40092 - OBJ
      ?auto_40093 - OBJ
      ?auto_40088 - LOCATION
    )
    :vars
    (
      ?auto_40097 - LOCATION
      ?auto_40095 - CITY
      ?auto_40096 - LOCATION
      ?auto_40098 - LOCATION
      ?auto_40094 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40097 ?auto_40095 ) ( IN-CITY ?auto_40088 ?auto_40095 ) ( not ( = ?auto_40088 ?auto_40097 ) ) ( OBJ-AT ?auto_40093 ?auto_40097 ) ( OBJ-AT ?auto_40091 ?auto_40097 ) ( IN-CITY ?auto_40096 ?auto_40095 ) ( not ( = ?auto_40088 ?auto_40096 ) ) ( OBJ-AT ?auto_40090 ?auto_40096 ) ( OBJ-AT ?auto_40089 ?auto_40097 ) ( IN-CITY ?auto_40098 ?auto_40095 ) ( not ( = ?auto_40088 ?auto_40098 ) ) ( OBJ-AT ?auto_40092 ?auto_40098 ) ( TRUCK-AT ?auto_40094 ?auto_40088 ) ( not ( = ?auto_40092 ?auto_40089 ) ) ( not ( = ?auto_40097 ?auto_40098 ) ) ( not ( = ?auto_40092 ?auto_40090 ) ) ( not ( = ?auto_40089 ?auto_40090 ) ) ( not ( = ?auto_40096 ?auto_40097 ) ) ( not ( = ?auto_40096 ?auto_40098 ) ) ( not ( = ?auto_40092 ?auto_40091 ) ) ( not ( = ?auto_40089 ?auto_40091 ) ) ( not ( = ?auto_40090 ?auto_40091 ) ) ( not ( = ?auto_40092 ?auto_40093 ) ) ( not ( = ?auto_40089 ?auto_40093 ) ) ( not ( = ?auto_40090 ?auto_40093 ) ) ( not ( = ?auto_40091 ?auto_40093 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40092 ?auto_40089 ?auto_40090 ?auto_40093 ?auto_40091 ?auto_40088 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40136 - OBJ
      ?auto_40137 - OBJ
      ?auto_40138 - OBJ
      ?auto_40139 - OBJ
      ?auto_40140 - OBJ
      ?auto_40135 - LOCATION
    )
    :vars
    (
      ?auto_40144 - LOCATION
      ?auto_40142 - CITY
      ?auto_40143 - LOCATION
      ?auto_40145 - LOCATION
      ?auto_40141 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40144 ?auto_40142 ) ( IN-CITY ?auto_40135 ?auto_40142 ) ( not ( = ?auto_40135 ?auto_40144 ) ) ( OBJ-AT ?auto_40139 ?auto_40144 ) ( OBJ-AT ?auto_40138 ?auto_40144 ) ( IN-CITY ?auto_40143 ?auto_40142 ) ( not ( = ?auto_40135 ?auto_40143 ) ) ( OBJ-AT ?auto_40137 ?auto_40143 ) ( OBJ-AT ?auto_40136 ?auto_40144 ) ( IN-CITY ?auto_40145 ?auto_40142 ) ( not ( = ?auto_40135 ?auto_40145 ) ) ( OBJ-AT ?auto_40140 ?auto_40145 ) ( TRUCK-AT ?auto_40141 ?auto_40135 ) ( not ( = ?auto_40140 ?auto_40136 ) ) ( not ( = ?auto_40144 ?auto_40145 ) ) ( not ( = ?auto_40140 ?auto_40137 ) ) ( not ( = ?auto_40136 ?auto_40137 ) ) ( not ( = ?auto_40143 ?auto_40144 ) ) ( not ( = ?auto_40143 ?auto_40145 ) ) ( not ( = ?auto_40140 ?auto_40138 ) ) ( not ( = ?auto_40136 ?auto_40138 ) ) ( not ( = ?auto_40137 ?auto_40138 ) ) ( not ( = ?auto_40140 ?auto_40139 ) ) ( not ( = ?auto_40136 ?auto_40139 ) ) ( not ( = ?auto_40137 ?auto_40139 ) ) ( not ( = ?auto_40138 ?auto_40139 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40140 ?auto_40136 ?auto_40137 ?auto_40139 ?auto_40138 ?auto_40135 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40231 - OBJ
      ?auto_40232 - OBJ
      ?auto_40233 - OBJ
      ?auto_40234 - OBJ
      ?auto_40235 - OBJ
      ?auto_40230 - LOCATION
    )
    :vars
    (
      ?auto_40239 - LOCATION
      ?auto_40237 - CITY
      ?auto_40238 - LOCATION
      ?auto_40240 - LOCATION
      ?auto_40236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40239 ?auto_40237 ) ( IN-CITY ?auto_40230 ?auto_40237 ) ( not ( = ?auto_40230 ?auto_40239 ) ) ( OBJ-AT ?auto_40233 ?auto_40239 ) ( OBJ-AT ?auto_40235 ?auto_40239 ) ( IN-CITY ?auto_40238 ?auto_40237 ) ( not ( = ?auto_40230 ?auto_40238 ) ) ( OBJ-AT ?auto_40232 ?auto_40238 ) ( OBJ-AT ?auto_40231 ?auto_40239 ) ( IN-CITY ?auto_40240 ?auto_40237 ) ( not ( = ?auto_40230 ?auto_40240 ) ) ( OBJ-AT ?auto_40234 ?auto_40240 ) ( TRUCK-AT ?auto_40236 ?auto_40230 ) ( not ( = ?auto_40234 ?auto_40231 ) ) ( not ( = ?auto_40239 ?auto_40240 ) ) ( not ( = ?auto_40234 ?auto_40232 ) ) ( not ( = ?auto_40231 ?auto_40232 ) ) ( not ( = ?auto_40238 ?auto_40239 ) ) ( not ( = ?auto_40238 ?auto_40240 ) ) ( not ( = ?auto_40234 ?auto_40235 ) ) ( not ( = ?auto_40231 ?auto_40235 ) ) ( not ( = ?auto_40232 ?auto_40235 ) ) ( not ( = ?auto_40234 ?auto_40233 ) ) ( not ( = ?auto_40231 ?auto_40233 ) ) ( not ( = ?auto_40232 ?auto_40233 ) ) ( not ( = ?auto_40235 ?auto_40233 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40234 ?auto_40231 ?auto_40232 ?auto_40233 ?auto_40235 ?auto_40230 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40380 - OBJ
      ?auto_40381 - OBJ
      ?auto_40382 - OBJ
      ?auto_40383 - OBJ
      ?auto_40384 - OBJ
      ?auto_40379 - LOCATION
    )
    :vars
    (
      ?auto_40388 - LOCATION
      ?auto_40386 - CITY
      ?auto_40387 - LOCATION
      ?auto_40389 - LOCATION
      ?auto_40385 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40388 ?auto_40386 ) ( IN-CITY ?auto_40379 ?auto_40386 ) ( not ( = ?auto_40379 ?auto_40388 ) ) ( OBJ-AT ?auto_40382 ?auto_40388 ) ( OBJ-AT ?auto_40383 ?auto_40388 ) ( IN-CITY ?auto_40387 ?auto_40386 ) ( not ( = ?auto_40379 ?auto_40387 ) ) ( OBJ-AT ?auto_40381 ?auto_40387 ) ( OBJ-AT ?auto_40380 ?auto_40388 ) ( IN-CITY ?auto_40389 ?auto_40386 ) ( not ( = ?auto_40379 ?auto_40389 ) ) ( OBJ-AT ?auto_40384 ?auto_40389 ) ( TRUCK-AT ?auto_40385 ?auto_40379 ) ( not ( = ?auto_40384 ?auto_40380 ) ) ( not ( = ?auto_40388 ?auto_40389 ) ) ( not ( = ?auto_40384 ?auto_40381 ) ) ( not ( = ?auto_40380 ?auto_40381 ) ) ( not ( = ?auto_40387 ?auto_40388 ) ) ( not ( = ?auto_40387 ?auto_40389 ) ) ( not ( = ?auto_40384 ?auto_40383 ) ) ( not ( = ?auto_40380 ?auto_40383 ) ) ( not ( = ?auto_40381 ?auto_40383 ) ) ( not ( = ?auto_40384 ?auto_40382 ) ) ( not ( = ?auto_40380 ?auto_40382 ) ) ( not ( = ?auto_40381 ?auto_40382 ) ) ( not ( = ?auto_40383 ?auto_40382 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40384 ?auto_40380 ?auto_40381 ?auto_40382 ?auto_40383 ?auto_40379 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40526 - OBJ
      ?auto_40527 - OBJ
      ?auto_40528 - OBJ
      ?auto_40529 - OBJ
      ?auto_40530 - OBJ
      ?auto_40525 - LOCATION
    )
    :vars
    (
      ?auto_40534 - LOCATION
      ?auto_40532 - CITY
      ?auto_40533 - LOCATION
      ?auto_40535 - LOCATION
      ?auto_40531 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40534 ?auto_40532 ) ( IN-CITY ?auto_40525 ?auto_40532 ) ( not ( = ?auto_40525 ?auto_40534 ) ) ( OBJ-AT ?auto_40530 ?auto_40534 ) ( OBJ-AT ?auto_40527 ?auto_40534 ) ( IN-CITY ?auto_40533 ?auto_40532 ) ( not ( = ?auto_40525 ?auto_40533 ) ) ( OBJ-AT ?auto_40529 ?auto_40533 ) ( OBJ-AT ?auto_40526 ?auto_40534 ) ( IN-CITY ?auto_40535 ?auto_40532 ) ( not ( = ?auto_40525 ?auto_40535 ) ) ( OBJ-AT ?auto_40528 ?auto_40535 ) ( TRUCK-AT ?auto_40531 ?auto_40525 ) ( not ( = ?auto_40528 ?auto_40526 ) ) ( not ( = ?auto_40534 ?auto_40535 ) ) ( not ( = ?auto_40528 ?auto_40529 ) ) ( not ( = ?auto_40526 ?auto_40529 ) ) ( not ( = ?auto_40533 ?auto_40534 ) ) ( not ( = ?auto_40533 ?auto_40535 ) ) ( not ( = ?auto_40528 ?auto_40527 ) ) ( not ( = ?auto_40526 ?auto_40527 ) ) ( not ( = ?auto_40529 ?auto_40527 ) ) ( not ( = ?auto_40528 ?auto_40530 ) ) ( not ( = ?auto_40526 ?auto_40530 ) ) ( not ( = ?auto_40529 ?auto_40530 ) ) ( not ( = ?auto_40527 ?auto_40530 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40528 ?auto_40526 ?auto_40529 ?auto_40530 ?auto_40527 ?auto_40525 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40573 - OBJ
      ?auto_40574 - OBJ
      ?auto_40575 - OBJ
      ?auto_40576 - OBJ
      ?auto_40577 - OBJ
      ?auto_40572 - LOCATION
    )
    :vars
    (
      ?auto_40581 - LOCATION
      ?auto_40579 - CITY
      ?auto_40580 - LOCATION
      ?auto_40582 - LOCATION
      ?auto_40578 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40581 ?auto_40579 ) ( IN-CITY ?auto_40572 ?auto_40579 ) ( not ( = ?auto_40572 ?auto_40581 ) ) ( OBJ-AT ?auto_40576 ?auto_40581 ) ( OBJ-AT ?auto_40574 ?auto_40581 ) ( IN-CITY ?auto_40580 ?auto_40579 ) ( not ( = ?auto_40572 ?auto_40580 ) ) ( OBJ-AT ?auto_40577 ?auto_40580 ) ( OBJ-AT ?auto_40573 ?auto_40581 ) ( IN-CITY ?auto_40582 ?auto_40579 ) ( not ( = ?auto_40572 ?auto_40582 ) ) ( OBJ-AT ?auto_40575 ?auto_40582 ) ( TRUCK-AT ?auto_40578 ?auto_40572 ) ( not ( = ?auto_40575 ?auto_40573 ) ) ( not ( = ?auto_40581 ?auto_40582 ) ) ( not ( = ?auto_40575 ?auto_40577 ) ) ( not ( = ?auto_40573 ?auto_40577 ) ) ( not ( = ?auto_40580 ?auto_40581 ) ) ( not ( = ?auto_40580 ?auto_40582 ) ) ( not ( = ?auto_40575 ?auto_40574 ) ) ( not ( = ?auto_40573 ?auto_40574 ) ) ( not ( = ?auto_40577 ?auto_40574 ) ) ( not ( = ?auto_40575 ?auto_40576 ) ) ( not ( = ?auto_40573 ?auto_40576 ) ) ( not ( = ?auto_40577 ?auto_40576 ) ) ( not ( = ?auto_40574 ?auto_40576 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40575 ?auto_40573 ?auto_40577 ?auto_40576 ?auto_40574 ?auto_40572 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40721 - OBJ
      ?auto_40722 - OBJ
      ?auto_40723 - OBJ
      ?auto_40724 - OBJ
      ?auto_40725 - OBJ
      ?auto_40720 - LOCATION
    )
    :vars
    (
      ?auto_40729 - LOCATION
      ?auto_40727 - CITY
      ?auto_40728 - LOCATION
      ?auto_40730 - LOCATION
      ?auto_40726 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40729 ?auto_40727 ) ( IN-CITY ?auto_40720 ?auto_40727 ) ( not ( = ?auto_40720 ?auto_40729 ) ) ( OBJ-AT ?auto_40725 ?auto_40729 ) ( OBJ-AT ?auto_40722 ?auto_40729 ) ( IN-CITY ?auto_40728 ?auto_40727 ) ( not ( = ?auto_40720 ?auto_40728 ) ) ( OBJ-AT ?auto_40723 ?auto_40728 ) ( OBJ-AT ?auto_40721 ?auto_40729 ) ( IN-CITY ?auto_40730 ?auto_40727 ) ( not ( = ?auto_40720 ?auto_40730 ) ) ( OBJ-AT ?auto_40724 ?auto_40730 ) ( TRUCK-AT ?auto_40726 ?auto_40720 ) ( not ( = ?auto_40724 ?auto_40721 ) ) ( not ( = ?auto_40729 ?auto_40730 ) ) ( not ( = ?auto_40724 ?auto_40723 ) ) ( not ( = ?auto_40721 ?auto_40723 ) ) ( not ( = ?auto_40728 ?auto_40729 ) ) ( not ( = ?auto_40728 ?auto_40730 ) ) ( not ( = ?auto_40724 ?auto_40722 ) ) ( not ( = ?auto_40721 ?auto_40722 ) ) ( not ( = ?auto_40723 ?auto_40722 ) ) ( not ( = ?auto_40724 ?auto_40725 ) ) ( not ( = ?auto_40721 ?auto_40725 ) ) ( not ( = ?auto_40723 ?auto_40725 ) ) ( not ( = ?auto_40722 ?auto_40725 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40724 ?auto_40721 ?auto_40723 ?auto_40725 ?auto_40722 ?auto_40720 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40768 - OBJ
      ?auto_40769 - OBJ
      ?auto_40770 - OBJ
      ?auto_40771 - OBJ
      ?auto_40772 - OBJ
      ?auto_40767 - LOCATION
    )
    :vars
    (
      ?auto_40776 - LOCATION
      ?auto_40774 - CITY
      ?auto_40775 - LOCATION
      ?auto_40777 - LOCATION
      ?auto_40773 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40776 ?auto_40774 ) ( IN-CITY ?auto_40767 ?auto_40774 ) ( not ( = ?auto_40767 ?auto_40776 ) ) ( OBJ-AT ?auto_40771 ?auto_40776 ) ( OBJ-AT ?auto_40769 ?auto_40776 ) ( IN-CITY ?auto_40775 ?auto_40774 ) ( not ( = ?auto_40767 ?auto_40775 ) ) ( OBJ-AT ?auto_40770 ?auto_40775 ) ( OBJ-AT ?auto_40768 ?auto_40776 ) ( IN-CITY ?auto_40777 ?auto_40774 ) ( not ( = ?auto_40767 ?auto_40777 ) ) ( OBJ-AT ?auto_40772 ?auto_40777 ) ( TRUCK-AT ?auto_40773 ?auto_40767 ) ( not ( = ?auto_40772 ?auto_40768 ) ) ( not ( = ?auto_40776 ?auto_40777 ) ) ( not ( = ?auto_40772 ?auto_40770 ) ) ( not ( = ?auto_40768 ?auto_40770 ) ) ( not ( = ?auto_40775 ?auto_40776 ) ) ( not ( = ?auto_40775 ?auto_40777 ) ) ( not ( = ?auto_40772 ?auto_40769 ) ) ( not ( = ?auto_40768 ?auto_40769 ) ) ( not ( = ?auto_40770 ?auto_40769 ) ) ( not ( = ?auto_40772 ?auto_40771 ) ) ( not ( = ?auto_40768 ?auto_40771 ) ) ( not ( = ?auto_40770 ?auto_40771 ) ) ( not ( = ?auto_40769 ?auto_40771 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40772 ?auto_40768 ?auto_40770 ?auto_40771 ?auto_40769 ?auto_40767 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40964 - OBJ
      ?auto_40965 - OBJ
      ?auto_40966 - OBJ
      ?auto_40967 - OBJ
      ?auto_40968 - OBJ
      ?auto_40963 - LOCATION
    )
    :vars
    (
      ?auto_40972 - LOCATION
      ?auto_40970 - CITY
      ?auto_40971 - LOCATION
      ?auto_40973 - LOCATION
      ?auto_40969 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40972 ?auto_40970 ) ( IN-CITY ?auto_40963 ?auto_40970 ) ( not ( = ?auto_40963 ?auto_40972 ) ) ( OBJ-AT ?auto_40966 ?auto_40972 ) ( OBJ-AT ?auto_40965 ?auto_40972 ) ( IN-CITY ?auto_40971 ?auto_40970 ) ( not ( = ?auto_40963 ?auto_40971 ) ) ( OBJ-AT ?auto_40968 ?auto_40971 ) ( OBJ-AT ?auto_40964 ?auto_40972 ) ( IN-CITY ?auto_40973 ?auto_40970 ) ( not ( = ?auto_40963 ?auto_40973 ) ) ( OBJ-AT ?auto_40967 ?auto_40973 ) ( TRUCK-AT ?auto_40969 ?auto_40963 ) ( not ( = ?auto_40967 ?auto_40964 ) ) ( not ( = ?auto_40972 ?auto_40973 ) ) ( not ( = ?auto_40967 ?auto_40968 ) ) ( not ( = ?auto_40964 ?auto_40968 ) ) ( not ( = ?auto_40971 ?auto_40972 ) ) ( not ( = ?auto_40971 ?auto_40973 ) ) ( not ( = ?auto_40967 ?auto_40965 ) ) ( not ( = ?auto_40964 ?auto_40965 ) ) ( not ( = ?auto_40968 ?auto_40965 ) ) ( not ( = ?auto_40967 ?auto_40966 ) ) ( not ( = ?auto_40964 ?auto_40966 ) ) ( not ( = ?auto_40968 ?auto_40966 ) ) ( not ( = ?auto_40965 ?auto_40966 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40967 ?auto_40964 ?auto_40968 ?auto_40966 ?auto_40965 ?auto_40963 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41062 - OBJ
      ?auto_41063 - OBJ
      ?auto_41064 - OBJ
      ?auto_41065 - OBJ
      ?auto_41066 - OBJ
      ?auto_41061 - LOCATION
    )
    :vars
    (
      ?auto_41070 - LOCATION
      ?auto_41068 - CITY
      ?auto_41069 - LOCATION
      ?auto_41071 - LOCATION
      ?auto_41067 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41070 ?auto_41068 ) ( IN-CITY ?auto_41061 ?auto_41068 ) ( not ( = ?auto_41061 ?auto_41070 ) ) ( OBJ-AT ?auto_41064 ?auto_41070 ) ( OBJ-AT ?auto_41063 ?auto_41070 ) ( IN-CITY ?auto_41069 ?auto_41068 ) ( not ( = ?auto_41061 ?auto_41069 ) ) ( OBJ-AT ?auto_41065 ?auto_41069 ) ( OBJ-AT ?auto_41062 ?auto_41070 ) ( IN-CITY ?auto_41071 ?auto_41068 ) ( not ( = ?auto_41061 ?auto_41071 ) ) ( OBJ-AT ?auto_41066 ?auto_41071 ) ( TRUCK-AT ?auto_41067 ?auto_41061 ) ( not ( = ?auto_41066 ?auto_41062 ) ) ( not ( = ?auto_41070 ?auto_41071 ) ) ( not ( = ?auto_41066 ?auto_41065 ) ) ( not ( = ?auto_41062 ?auto_41065 ) ) ( not ( = ?auto_41069 ?auto_41070 ) ) ( not ( = ?auto_41069 ?auto_41071 ) ) ( not ( = ?auto_41066 ?auto_41063 ) ) ( not ( = ?auto_41062 ?auto_41063 ) ) ( not ( = ?auto_41065 ?auto_41063 ) ) ( not ( = ?auto_41066 ?auto_41064 ) ) ( not ( = ?auto_41062 ?auto_41064 ) ) ( not ( = ?auto_41065 ?auto_41064 ) ) ( not ( = ?auto_41063 ?auto_41064 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41066 ?auto_41062 ?auto_41065 ?auto_41064 ?auto_41063 ?auto_41061 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41409 - OBJ
      ?auto_41410 - OBJ
      ?auto_41411 - OBJ
      ?auto_41412 - OBJ
      ?auto_41413 - OBJ
      ?auto_41408 - LOCATION
    )
    :vars
    (
      ?auto_41417 - LOCATION
      ?auto_41415 - CITY
      ?auto_41416 - LOCATION
      ?auto_41418 - LOCATION
      ?auto_41414 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41417 ?auto_41415 ) ( IN-CITY ?auto_41408 ?auto_41415 ) ( not ( = ?auto_41408 ?auto_41417 ) ) ( OBJ-AT ?auto_41410 ?auto_41417 ) ( OBJ-AT ?auto_41413 ?auto_41417 ) ( IN-CITY ?auto_41416 ?auto_41415 ) ( not ( = ?auto_41408 ?auto_41416 ) ) ( OBJ-AT ?auto_41412 ?auto_41416 ) ( OBJ-AT ?auto_41409 ?auto_41417 ) ( IN-CITY ?auto_41418 ?auto_41415 ) ( not ( = ?auto_41408 ?auto_41418 ) ) ( OBJ-AT ?auto_41411 ?auto_41418 ) ( TRUCK-AT ?auto_41414 ?auto_41408 ) ( not ( = ?auto_41411 ?auto_41409 ) ) ( not ( = ?auto_41417 ?auto_41418 ) ) ( not ( = ?auto_41411 ?auto_41412 ) ) ( not ( = ?auto_41409 ?auto_41412 ) ) ( not ( = ?auto_41416 ?auto_41417 ) ) ( not ( = ?auto_41416 ?auto_41418 ) ) ( not ( = ?auto_41411 ?auto_41413 ) ) ( not ( = ?auto_41409 ?auto_41413 ) ) ( not ( = ?auto_41412 ?auto_41413 ) ) ( not ( = ?auto_41411 ?auto_41410 ) ) ( not ( = ?auto_41409 ?auto_41410 ) ) ( not ( = ?auto_41412 ?auto_41410 ) ) ( not ( = ?auto_41413 ?auto_41410 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41411 ?auto_41409 ?auto_41412 ?auto_41410 ?auto_41413 ?auto_41408 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41456 - OBJ
      ?auto_41457 - OBJ
      ?auto_41458 - OBJ
      ?auto_41459 - OBJ
      ?auto_41460 - OBJ
      ?auto_41455 - LOCATION
    )
    :vars
    (
      ?auto_41464 - LOCATION
      ?auto_41462 - CITY
      ?auto_41463 - LOCATION
      ?auto_41465 - LOCATION
      ?auto_41461 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41464 ?auto_41462 ) ( IN-CITY ?auto_41455 ?auto_41462 ) ( not ( = ?auto_41455 ?auto_41464 ) ) ( OBJ-AT ?auto_41457 ?auto_41464 ) ( OBJ-AT ?auto_41459 ?auto_41464 ) ( IN-CITY ?auto_41463 ?auto_41462 ) ( not ( = ?auto_41455 ?auto_41463 ) ) ( OBJ-AT ?auto_41460 ?auto_41463 ) ( OBJ-AT ?auto_41456 ?auto_41464 ) ( IN-CITY ?auto_41465 ?auto_41462 ) ( not ( = ?auto_41455 ?auto_41465 ) ) ( OBJ-AT ?auto_41458 ?auto_41465 ) ( TRUCK-AT ?auto_41461 ?auto_41455 ) ( not ( = ?auto_41458 ?auto_41456 ) ) ( not ( = ?auto_41464 ?auto_41465 ) ) ( not ( = ?auto_41458 ?auto_41460 ) ) ( not ( = ?auto_41456 ?auto_41460 ) ) ( not ( = ?auto_41463 ?auto_41464 ) ) ( not ( = ?auto_41463 ?auto_41465 ) ) ( not ( = ?auto_41458 ?auto_41459 ) ) ( not ( = ?auto_41456 ?auto_41459 ) ) ( not ( = ?auto_41460 ?auto_41459 ) ) ( not ( = ?auto_41458 ?auto_41457 ) ) ( not ( = ?auto_41456 ?auto_41457 ) ) ( not ( = ?auto_41460 ?auto_41457 ) ) ( not ( = ?auto_41459 ?auto_41457 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41458 ?auto_41456 ?auto_41460 ?auto_41457 ?auto_41459 ?auto_41455 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41913 - OBJ
      ?auto_41914 - OBJ
      ?auto_41915 - OBJ
      ?auto_41916 - OBJ
      ?auto_41917 - OBJ
      ?auto_41912 - LOCATION
    )
    :vars
    (
      ?auto_41921 - LOCATION
      ?auto_41919 - CITY
      ?auto_41920 - LOCATION
      ?auto_41922 - LOCATION
      ?auto_41918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41921 ?auto_41919 ) ( IN-CITY ?auto_41912 ?auto_41919 ) ( not ( = ?auto_41912 ?auto_41921 ) ) ( OBJ-AT ?auto_41914 ?auto_41921 ) ( OBJ-AT ?auto_41917 ?auto_41921 ) ( IN-CITY ?auto_41920 ?auto_41919 ) ( not ( = ?auto_41912 ?auto_41920 ) ) ( OBJ-AT ?auto_41915 ?auto_41920 ) ( OBJ-AT ?auto_41913 ?auto_41921 ) ( IN-CITY ?auto_41922 ?auto_41919 ) ( not ( = ?auto_41912 ?auto_41922 ) ) ( OBJ-AT ?auto_41916 ?auto_41922 ) ( TRUCK-AT ?auto_41918 ?auto_41912 ) ( not ( = ?auto_41916 ?auto_41913 ) ) ( not ( = ?auto_41921 ?auto_41922 ) ) ( not ( = ?auto_41916 ?auto_41915 ) ) ( not ( = ?auto_41913 ?auto_41915 ) ) ( not ( = ?auto_41920 ?auto_41921 ) ) ( not ( = ?auto_41920 ?auto_41922 ) ) ( not ( = ?auto_41916 ?auto_41917 ) ) ( not ( = ?auto_41913 ?auto_41917 ) ) ( not ( = ?auto_41915 ?auto_41917 ) ) ( not ( = ?auto_41916 ?auto_41914 ) ) ( not ( = ?auto_41913 ?auto_41914 ) ) ( not ( = ?auto_41915 ?auto_41914 ) ) ( not ( = ?auto_41917 ?auto_41914 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41916 ?auto_41913 ?auto_41915 ?auto_41914 ?auto_41917 ?auto_41912 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42062 - OBJ
      ?auto_42063 - OBJ
      ?auto_42064 - OBJ
      ?auto_42065 - OBJ
      ?auto_42066 - OBJ
      ?auto_42061 - LOCATION
    )
    :vars
    (
      ?auto_42070 - LOCATION
      ?auto_42068 - CITY
      ?auto_42069 - LOCATION
      ?auto_42071 - LOCATION
      ?auto_42067 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42070 ?auto_42068 ) ( IN-CITY ?auto_42061 ?auto_42068 ) ( not ( = ?auto_42061 ?auto_42070 ) ) ( OBJ-AT ?auto_42063 ?auto_42070 ) ( OBJ-AT ?auto_42065 ?auto_42070 ) ( IN-CITY ?auto_42069 ?auto_42068 ) ( not ( = ?auto_42061 ?auto_42069 ) ) ( OBJ-AT ?auto_42064 ?auto_42069 ) ( OBJ-AT ?auto_42062 ?auto_42070 ) ( IN-CITY ?auto_42071 ?auto_42068 ) ( not ( = ?auto_42061 ?auto_42071 ) ) ( OBJ-AT ?auto_42066 ?auto_42071 ) ( TRUCK-AT ?auto_42067 ?auto_42061 ) ( not ( = ?auto_42066 ?auto_42062 ) ) ( not ( = ?auto_42070 ?auto_42071 ) ) ( not ( = ?auto_42066 ?auto_42064 ) ) ( not ( = ?auto_42062 ?auto_42064 ) ) ( not ( = ?auto_42069 ?auto_42070 ) ) ( not ( = ?auto_42069 ?auto_42071 ) ) ( not ( = ?auto_42066 ?auto_42065 ) ) ( not ( = ?auto_42062 ?auto_42065 ) ) ( not ( = ?auto_42064 ?auto_42065 ) ) ( not ( = ?auto_42066 ?auto_42063 ) ) ( not ( = ?auto_42062 ?auto_42063 ) ) ( not ( = ?auto_42064 ?auto_42063 ) ) ( not ( = ?auto_42065 ?auto_42063 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42066 ?auto_42062 ?auto_42064 ?auto_42063 ?auto_42065 ?auto_42061 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42208 - OBJ
      ?auto_42209 - OBJ
      ?auto_42210 - OBJ
      ?auto_42211 - OBJ
      ?auto_42212 - OBJ
      ?auto_42207 - LOCATION
    )
    :vars
    (
      ?auto_42216 - LOCATION
      ?auto_42214 - CITY
      ?auto_42215 - LOCATION
      ?auto_42217 - LOCATION
      ?auto_42213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42216 ?auto_42214 ) ( IN-CITY ?auto_42207 ?auto_42214 ) ( not ( = ?auto_42207 ?auto_42216 ) ) ( OBJ-AT ?auto_42209 ?auto_42216 ) ( OBJ-AT ?auto_42210 ?auto_42216 ) ( IN-CITY ?auto_42215 ?auto_42214 ) ( not ( = ?auto_42207 ?auto_42215 ) ) ( OBJ-AT ?auto_42212 ?auto_42215 ) ( OBJ-AT ?auto_42208 ?auto_42216 ) ( IN-CITY ?auto_42217 ?auto_42214 ) ( not ( = ?auto_42207 ?auto_42217 ) ) ( OBJ-AT ?auto_42211 ?auto_42217 ) ( TRUCK-AT ?auto_42213 ?auto_42207 ) ( not ( = ?auto_42211 ?auto_42208 ) ) ( not ( = ?auto_42216 ?auto_42217 ) ) ( not ( = ?auto_42211 ?auto_42212 ) ) ( not ( = ?auto_42208 ?auto_42212 ) ) ( not ( = ?auto_42215 ?auto_42216 ) ) ( not ( = ?auto_42215 ?auto_42217 ) ) ( not ( = ?auto_42211 ?auto_42210 ) ) ( not ( = ?auto_42208 ?auto_42210 ) ) ( not ( = ?auto_42212 ?auto_42210 ) ) ( not ( = ?auto_42211 ?auto_42209 ) ) ( not ( = ?auto_42208 ?auto_42209 ) ) ( not ( = ?auto_42212 ?auto_42209 ) ) ( not ( = ?auto_42210 ?auto_42209 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42211 ?auto_42208 ?auto_42212 ?auto_42209 ?auto_42210 ?auto_42207 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42306 - OBJ
      ?auto_42307 - OBJ
      ?auto_42308 - OBJ
      ?auto_42309 - OBJ
      ?auto_42310 - OBJ
      ?auto_42305 - LOCATION
    )
    :vars
    (
      ?auto_42314 - LOCATION
      ?auto_42312 - CITY
      ?auto_42313 - LOCATION
      ?auto_42315 - LOCATION
      ?auto_42311 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42314 ?auto_42312 ) ( IN-CITY ?auto_42305 ?auto_42312 ) ( not ( = ?auto_42305 ?auto_42314 ) ) ( OBJ-AT ?auto_42307 ?auto_42314 ) ( OBJ-AT ?auto_42308 ?auto_42314 ) ( IN-CITY ?auto_42313 ?auto_42312 ) ( not ( = ?auto_42305 ?auto_42313 ) ) ( OBJ-AT ?auto_42309 ?auto_42313 ) ( OBJ-AT ?auto_42306 ?auto_42314 ) ( IN-CITY ?auto_42315 ?auto_42312 ) ( not ( = ?auto_42305 ?auto_42315 ) ) ( OBJ-AT ?auto_42310 ?auto_42315 ) ( TRUCK-AT ?auto_42311 ?auto_42305 ) ( not ( = ?auto_42310 ?auto_42306 ) ) ( not ( = ?auto_42314 ?auto_42315 ) ) ( not ( = ?auto_42310 ?auto_42309 ) ) ( not ( = ?auto_42306 ?auto_42309 ) ) ( not ( = ?auto_42313 ?auto_42314 ) ) ( not ( = ?auto_42313 ?auto_42315 ) ) ( not ( = ?auto_42310 ?auto_42308 ) ) ( not ( = ?auto_42306 ?auto_42308 ) ) ( not ( = ?auto_42309 ?auto_42308 ) ) ( not ( = ?auto_42310 ?auto_42307 ) ) ( not ( = ?auto_42306 ?auto_42307 ) ) ( not ( = ?auto_42309 ?auto_42307 ) ) ( not ( = ?auto_42308 ?auto_42307 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42310 ?auto_42306 ?auto_42309 ?auto_42307 ?auto_42308 ?auto_42305 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42963 - OBJ
      ?auto_42964 - OBJ
      ?auto_42965 - OBJ
      ?auto_42966 - OBJ
      ?auto_42967 - OBJ
      ?auto_42962 - LOCATION
    )
    :vars
    (
      ?auto_42971 - LOCATION
      ?auto_42969 - CITY
      ?auto_42970 - LOCATION
      ?auto_42972 - LOCATION
      ?auto_42968 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42971 ?auto_42969 ) ( IN-CITY ?auto_42962 ?auto_42969 ) ( not ( = ?auto_42962 ?auto_42971 ) ) ( OBJ-AT ?auto_42967 ?auto_42971 ) ( OBJ-AT ?auto_42966 ?auto_42971 ) ( IN-CITY ?auto_42970 ?auto_42969 ) ( not ( = ?auto_42962 ?auto_42970 ) ) ( OBJ-AT ?auto_42963 ?auto_42970 ) ( OBJ-AT ?auto_42965 ?auto_42971 ) ( IN-CITY ?auto_42972 ?auto_42969 ) ( not ( = ?auto_42962 ?auto_42972 ) ) ( OBJ-AT ?auto_42964 ?auto_42972 ) ( TRUCK-AT ?auto_42968 ?auto_42962 ) ( not ( = ?auto_42964 ?auto_42965 ) ) ( not ( = ?auto_42971 ?auto_42972 ) ) ( not ( = ?auto_42964 ?auto_42963 ) ) ( not ( = ?auto_42965 ?auto_42963 ) ) ( not ( = ?auto_42970 ?auto_42971 ) ) ( not ( = ?auto_42970 ?auto_42972 ) ) ( not ( = ?auto_42964 ?auto_42966 ) ) ( not ( = ?auto_42965 ?auto_42966 ) ) ( not ( = ?auto_42963 ?auto_42966 ) ) ( not ( = ?auto_42964 ?auto_42967 ) ) ( not ( = ?auto_42965 ?auto_42967 ) ) ( not ( = ?auto_42963 ?auto_42967 ) ) ( not ( = ?auto_42966 ?auto_42967 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42964 ?auto_42965 ?auto_42963 ?auto_42967 ?auto_42966 ?auto_42962 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43010 - OBJ
      ?auto_43011 - OBJ
      ?auto_43012 - OBJ
      ?auto_43013 - OBJ
      ?auto_43014 - OBJ
      ?auto_43009 - LOCATION
    )
    :vars
    (
      ?auto_43018 - LOCATION
      ?auto_43016 - CITY
      ?auto_43017 - LOCATION
      ?auto_43019 - LOCATION
      ?auto_43015 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43018 ?auto_43016 ) ( IN-CITY ?auto_43009 ?auto_43016 ) ( not ( = ?auto_43009 ?auto_43018 ) ) ( OBJ-AT ?auto_43013 ?auto_43018 ) ( OBJ-AT ?auto_43014 ?auto_43018 ) ( IN-CITY ?auto_43017 ?auto_43016 ) ( not ( = ?auto_43009 ?auto_43017 ) ) ( OBJ-AT ?auto_43010 ?auto_43017 ) ( OBJ-AT ?auto_43012 ?auto_43018 ) ( IN-CITY ?auto_43019 ?auto_43016 ) ( not ( = ?auto_43009 ?auto_43019 ) ) ( OBJ-AT ?auto_43011 ?auto_43019 ) ( TRUCK-AT ?auto_43015 ?auto_43009 ) ( not ( = ?auto_43011 ?auto_43012 ) ) ( not ( = ?auto_43018 ?auto_43019 ) ) ( not ( = ?auto_43011 ?auto_43010 ) ) ( not ( = ?auto_43012 ?auto_43010 ) ) ( not ( = ?auto_43017 ?auto_43018 ) ) ( not ( = ?auto_43017 ?auto_43019 ) ) ( not ( = ?auto_43011 ?auto_43014 ) ) ( not ( = ?auto_43012 ?auto_43014 ) ) ( not ( = ?auto_43010 ?auto_43014 ) ) ( not ( = ?auto_43011 ?auto_43013 ) ) ( not ( = ?auto_43012 ?auto_43013 ) ) ( not ( = ?auto_43010 ?auto_43013 ) ) ( not ( = ?auto_43014 ?auto_43013 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43011 ?auto_43012 ?auto_43010 ?auto_43013 ?auto_43014 ?auto_43009 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43158 - OBJ
      ?auto_43159 - OBJ
      ?auto_43160 - OBJ
      ?auto_43161 - OBJ
      ?auto_43162 - OBJ
      ?auto_43157 - LOCATION
    )
    :vars
    (
      ?auto_43166 - LOCATION
      ?auto_43164 - CITY
      ?auto_43165 - LOCATION
      ?auto_43167 - LOCATION
      ?auto_43163 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43166 ?auto_43164 ) ( IN-CITY ?auto_43157 ?auto_43164 ) ( not ( = ?auto_43157 ?auto_43166 ) ) ( OBJ-AT ?auto_43162 ?auto_43166 ) ( OBJ-AT ?auto_43160 ?auto_43166 ) ( IN-CITY ?auto_43165 ?auto_43164 ) ( not ( = ?auto_43157 ?auto_43165 ) ) ( OBJ-AT ?auto_43158 ?auto_43165 ) ( OBJ-AT ?auto_43161 ?auto_43166 ) ( IN-CITY ?auto_43167 ?auto_43164 ) ( not ( = ?auto_43157 ?auto_43167 ) ) ( OBJ-AT ?auto_43159 ?auto_43167 ) ( TRUCK-AT ?auto_43163 ?auto_43157 ) ( not ( = ?auto_43159 ?auto_43161 ) ) ( not ( = ?auto_43166 ?auto_43167 ) ) ( not ( = ?auto_43159 ?auto_43158 ) ) ( not ( = ?auto_43161 ?auto_43158 ) ) ( not ( = ?auto_43165 ?auto_43166 ) ) ( not ( = ?auto_43165 ?auto_43167 ) ) ( not ( = ?auto_43159 ?auto_43160 ) ) ( not ( = ?auto_43161 ?auto_43160 ) ) ( not ( = ?auto_43158 ?auto_43160 ) ) ( not ( = ?auto_43159 ?auto_43162 ) ) ( not ( = ?auto_43161 ?auto_43162 ) ) ( not ( = ?auto_43158 ?auto_43162 ) ) ( not ( = ?auto_43160 ?auto_43162 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43159 ?auto_43161 ?auto_43158 ?auto_43162 ?auto_43160 ?auto_43157 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43205 - OBJ
      ?auto_43206 - OBJ
      ?auto_43207 - OBJ
      ?auto_43208 - OBJ
      ?auto_43209 - OBJ
      ?auto_43204 - LOCATION
    )
    :vars
    (
      ?auto_43213 - LOCATION
      ?auto_43211 - CITY
      ?auto_43212 - LOCATION
      ?auto_43214 - LOCATION
      ?auto_43210 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43213 ?auto_43211 ) ( IN-CITY ?auto_43204 ?auto_43211 ) ( not ( = ?auto_43204 ?auto_43213 ) ) ( OBJ-AT ?auto_43208 ?auto_43213 ) ( OBJ-AT ?auto_43207 ?auto_43213 ) ( IN-CITY ?auto_43212 ?auto_43211 ) ( not ( = ?auto_43204 ?auto_43212 ) ) ( OBJ-AT ?auto_43205 ?auto_43212 ) ( OBJ-AT ?auto_43209 ?auto_43213 ) ( IN-CITY ?auto_43214 ?auto_43211 ) ( not ( = ?auto_43204 ?auto_43214 ) ) ( OBJ-AT ?auto_43206 ?auto_43214 ) ( TRUCK-AT ?auto_43210 ?auto_43204 ) ( not ( = ?auto_43206 ?auto_43209 ) ) ( not ( = ?auto_43213 ?auto_43214 ) ) ( not ( = ?auto_43206 ?auto_43205 ) ) ( not ( = ?auto_43209 ?auto_43205 ) ) ( not ( = ?auto_43212 ?auto_43213 ) ) ( not ( = ?auto_43212 ?auto_43214 ) ) ( not ( = ?auto_43206 ?auto_43207 ) ) ( not ( = ?auto_43209 ?auto_43207 ) ) ( not ( = ?auto_43205 ?auto_43207 ) ) ( not ( = ?auto_43206 ?auto_43208 ) ) ( not ( = ?auto_43209 ?auto_43208 ) ) ( not ( = ?auto_43205 ?auto_43208 ) ) ( not ( = ?auto_43207 ?auto_43208 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43206 ?auto_43209 ?auto_43205 ?auto_43208 ?auto_43207 ?auto_43204 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43351 - OBJ
      ?auto_43352 - OBJ
      ?auto_43353 - OBJ
      ?auto_43354 - OBJ
      ?auto_43355 - OBJ
      ?auto_43350 - LOCATION
    )
    :vars
    (
      ?auto_43359 - LOCATION
      ?auto_43357 - CITY
      ?auto_43358 - LOCATION
      ?auto_43360 - LOCATION
      ?auto_43356 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43359 ?auto_43357 ) ( IN-CITY ?auto_43350 ?auto_43357 ) ( not ( = ?auto_43350 ?auto_43359 ) ) ( OBJ-AT ?auto_43353 ?auto_43359 ) ( OBJ-AT ?auto_43355 ?auto_43359 ) ( IN-CITY ?auto_43358 ?auto_43357 ) ( not ( = ?auto_43350 ?auto_43358 ) ) ( OBJ-AT ?auto_43351 ?auto_43358 ) ( OBJ-AT ?auto_43354 ?auto_43359 ) ( IN-CITY ?auto_43360 ?auto_43357 ) ( not ( = ?auto_43350 ?auto_43360 ) ) ( OBJ-AT ?auto_43352 ?auto_43360 ) ( TRUCK-AT ?auto_43356 ?auto_43350 ) ( not ( = ?auto_43352 ?auto_43354 ) ) ( not ( = ?auto_43359 ?auto_43360 ) ) ( not ( = ?auto_43352 ?auto_43351 ) ) ( not ( = ?auto_43354 ?auto_43351 ) ) ( not ( = ?auto_43358 ?auto_43359 ) ) ( not ( = ?auto_43358 ?auto_43360 ) ) ( not ( = ?auto_43352 ?auto_43355 ) ) ( not ( = ?auto_43354 ?auto_43355 ) ) ( not ( = ?auto_43351 ?auto_43355 ) ) ( not ( = ?auto_43352 ?auto_43353 ) ) ( not ( = ?auto_43354 ?auto_43353 ) ) ( not ( = ?auto_43351 ?auto_43353 ) ) ( not ( = ?auto_43355 ?auto_43353 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43352 ?auto_43354 ?auto_43351 ?auto_43353 ?auto_43355 ?auto_43350 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43449 - OBJ
      ?auto_43450 - OBJ
      ?auto_43451 - OBJ
      ?auto_43452 - OBJ
      ?auto_43453 - OBJ
      ?auto_43448 - LOCATION
    )
    :vars
    (
      ?auto_43457 - LOCATION
      ?auto_43455 - CITY
      ?auto_43456 - LOCATION
      ?auto_43458 - LOCATION
      ?auto_43454 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43457 ?auto_43455 ) ( IN-CITY ?auto_43448 ?auto_43455 ) ( not ( = ?auto_43448 ?auto_43457 ) ) ( OBJ-AT ?auto_43451 ?auto_43457 ) ( OBJ-AT ?auto_43452 ?auto_43457 ) ( IN-CITY ?auto_43456 ?auto_43455 ) ( not ( = ?auto_43448 ?auto_43456 ) ) ( OBJ-AT ?auto_43449 ?auto_43456 ) ( OBJ-AT ?auto_43453 ?auto_43457 ) ( IN-CITY ?auto_43458 ?auto_43455 ) ( not ( = ?auto_43448 ?auto_43458 ) ) ( OBJ-AT ?auto_43450 ?auto_43458 ) ( TRUCK-AT ?auto_43454 ?auto_43448 ) ( not ( = ?auto_43450 ?auto_43453 ) ) ( not ( = ?auto_43457 ?auto_43458 ) ) ( not ( = ?auto_43450 ?auto_43449 ) ) ( not ( = ?auto_43453 ?auto_43449 ) ) ( not ( = ?auto_43456 ?auto_43457 ) ) ( not ( = ?auto_43456 ?auto_43458 ) ) ( not ( = ?auto_43450 ?auto_43452 ) ) ( not ( = ?auto_43453 ?auto_43452 ) ) ( not ( = ?auto_43449 ?auto_43452 ) ) ( not ( = ?auto_43450 ?auto_43451 ) ) ( not ( = ?auto_43453 ?auto_43451 ) ) ( not ( = ?auto_43449 ?auto_43451 ) ) ( not ( = ?auto_43452 ?auto_43451 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43450 ?auto_43453 ?auto_43449 ?auto_43451 ?auto_43452 ?auto_43448 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43595 - OBJ
      ?auto_43596 - OBJ
      ?auto_43597 - OBJ
      ?auto_43598 - OBJ
      ?auto_43599 - OBJ
      ?auto_43594 - LOCATION
    )
    :vars
    (
      ?auto_43603 - LOCATION
      ?auto_43601 - CITY
      ?auto_43602 - LOCATION
      ?auto_43604 - LOCATION
      ?auto_43600 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43603 ?auto_43601 ) ( IN-CITY ?auto_43594 ?auto_43601 ) ( not ( = ?auto_43594 ?auto_43603 ) ) ( OBJ-AT ?auto_43599 ?auto_43603 ) ( OBJ-AT ?auto_43598 ?auto_43603 ) ( IN-CITY ?auto_43602 ?auto_43601 ) ( not ( = ?auto_43594 ?auto_43602 ) ) ( OBJ-AT ?auto_43595 ?auto_43602 ) ( OBJ-AT ?auto_43596 ?auto_43603 ) ( IN-CITY ?auto_43604 ?auto_43601 ) ( not ( = ?auto_43594 ?auto_43604 ) ) ( OBJ-AT ?auto_43597 ?auto_43604 ) ( TRUCK-AT ?auto_43600 ?auto_43594 ) ( not ( = ?auto_43597 ?auto_43596 ) ) ( not ( = ?auto_43603 ?auto_43604 ) ) ( not ( = ?auto_43597 ?auto_43595 ) ) ( not ( = ?auto_43596 ?auto_43595 ) ) ( not ( = ?auto_43602 ?auto_43603 ) ) ( not ( = ?auto_43602 ?auto_43604 ) ) ( not ( = ?auto_43597 ?auto_43598 ) ) ( not ( = ?auto_43596 ?auto_43598 ) ) ( not ( = ?auto_43595 ?auto_43598 ) ) ( not ( = ?auto_43597 ?auto_43599 ) ) ( not ( = ?auto_43596 ?auto_43599 ) ) ( not ( = ?auto_43595 ?auto_43599 ) ) ( not ( = ?auto_43598 ?auto_43599 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43597 ?auto_43596 ?auto_43595 ?auto_43599 ?auto_43598 ?auto_43594 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43642 - OBJ
      ?auto_43643 - OBJ
      ?auto_43644 - OBJ
      ?auto_43645 - OBJ
      ?auto_43646 - OBJ
      ?auto_43641 - LOCATION
    )
    :vars
    (
      ?auto_43650 - LOCATION
      ?auto_43648 - CITY
      ?auto_43649 - LOCATION
      ?auto_43651 - LOCATION
      ?auto_43647 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43650 ?auto_43648 ) ( IN-CITY ?auto_43641 ?auto_43648 ) ( not ( = ?auto_43641 ?auto_43650 ) ) ( OBJ-AT ?auto_43645 ?auto_43650 ) ( OBJ-AT ?auto_43646 ?auto_43650 ) ( IN-CITY ?auto_43649 ?auto_43648 ) ( not ( = ?auto_43641 ?auto_43649 ) ) ( OBJ-AT ?auto_43642 ?auto_43649 ) ( OBJ-AT ?auto_43643 ?auto_43650 ) ( IN-CITY ?auto_43651 ?auto_43648 ) ( not ( = ?auto_43641 ?auto_43651 ) ) ( OBJ-AT ?auto_43644 ?auto_43651 ) ( TRUCK-AT ?auto_43647 ?auto_43641 ) ( not ( = ?auto_43644 ?auto_43643 ) ) ( not ( = ?auto_43650 ?auto_43651 ) ) ( not ( = ?auto_43644 ?auto_43642 ) ) ( not ( = ?auto_43643 ?auto_43642 ) ) ( not ( = ?auto_43649 ?auto_43650 ) ) ( not ( = ?auto_43649 ?auto_43651 ) ) ( not ( = ?auto_43644 ?auto_43646 ) ) ( not ( = ?auto_43643 ?auto_43646 ) ) ( not ( = ?auto_43642 ?auto_43646 ) ) ( not ( = ?auto_43644 ?auto_43645 ) ) ( not ( = ?auto_43643 ?auto_43645 ) ) ( not ( = ?auto_43642 ?auto_43645 ) ) ( not ( = ?auto_43646 ?auto_43645 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43644 ?auto_43643 ?auto_43642 ?auto_43645 ?auto_43646 ?auto_43641 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43891 - OBJ
      ?auto_43892 - OBJ
      ?auto_43893 - OBJ
      ?auto_43894 - OBJ
      ?auto_43895 - OBJ
      ?auto_43890 - LOCATION
    )
    :vars
    (
      ?auto_43899 - LOCATION
      ?auto_43897 - CITY
      ?auto_43898 - LOCATION
      ?auto_43900 - LOCATION
      ?auto_43896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43899 ?auto_43897 ) ( IN-CITY ?auto_43890 ?auto_43897 ) ( not ( = ?auto_43890 ?auto_43899 ) ) ( OBJ-AT ?auto_43895 ?auto_43899 ) ( OBJ-AT ?auto_43893 ?auto_43899 ) ( IN-CITY ?auto_43898 ?auto_43897 ) ( not ( = ?auto_43890 ?auto_43898 ) ) ( OBJ-AT ?auto_43891 ?auto_43898 ) ( OBJ-AT ?auto_43892 ?auto_43899 ) ( IN-CITY ?auto_43900 ?auto_43897 ) ( not ( = ?auto_43890 ?auto_43900 ) ) ( OBJ-AT ?auto_43894 ?auto_43900 ) ( TRUCK-AT ?auto_43896 ?auto_43890 ) ( not ( = ?auto_43894 ?auto_43892 ) ) ( not ( = ?auto_43899 ?auto_43900 ) ) ( not ( = ?auto_43894 ?auto_43891 ) ) ( not ( = ?auto_43892 ?auto_43891 ) ) ( not ( = ?auto_43898 ?auto_43899 ) ) ( not ( = ?auto_43898 ?auto_43900 ) ) ( not ( = ?auto_43894 ?auto_43893 ) ) ( not ( = ?auto_43892 ?auto_43893 ) ) ( not ( = ?auto_43891 ?auto_43893 ) ) ( not ( = ?auto_43894 ?auto_43895 ) ) ( not ( = ?auto_43892 ?auto_43895 ) ) ( not ( = ?auto_43891 ?auto_43895 ) ) ( not ( = ?auto_43893 ?auto_43895 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43894 ?auto_43892 ?auto_43891 ?auto_43895 ?auto_43893 ?auto_43890 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43938 - OBJ
      ?auto_43939 - OBJ
      ?auto_43940 - OBJ
      ?auto_43941 - OBJ
      ?auto_43942 - OBJ
      ?auto_43937 - LOCATION
    )
    :vars
    (
      ?auto_43946 - LOCATION
      ?auto_43944 - CITY
      ?auto_43945 - LOCATION
      ?auto_43947 - LOCATION
      ?auto_43943 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43946 ?auto_43944 ) ( IN-CITY ?auto_43937 ?auto_43944 ) ( not ( = ?auto_43937 ?auto_43946 ) ) ( OBJ-AT ?auto_43941 ?auto_43946 ) ( OBJ-AT ?auto_43940 ?auto_43946 ) ( IN-CITY ?auto_43945 ?auto_43944 ) ( not ( = ?auto_43937 ?auto_43945 ) ) ( OBJ-AT ?auto_43938 ?auto_43945 ) ( OBJ-AT ?auto_43939 ?auto_43946 ) ( IN-CITY ?auto_43947 ?auto_43944 ) ( not ( = ?auto_43937 ?auto_43947 ) ) ( OBJ-AT ?auto_43942 ?auto_43947 ) ( TRUCK-AT ?auto_43943 ?auto_43937 ) ( not ( = ?auto_43942 ?auto_43939 ) ) ( not ( = ?auto_43946 ?auto_43947 ) ) ( not ( = ?auto_43942 ?auto_43938 ) ) ( not ( = ?auto_43939 ?auto_43938 ) ) ( not ( = ?auto_43945 ?auto_43946 ) ) ( not ( = ?auto_43945 ?auto_43947 ) ) ( not ( = ?auto_43942 ?auto_43940 ) ) ( not ( = ?auto_43939 ?auto_43940 ) ) ( not ( = ?auto_43938 ?auto_43940 ) ) ( not ( = ?auto_43942 ?auto_43941 ) ) ( not ( = ?auto_43939 ?auto_43941 ) ) ( not ( = ?auto_43938 ?auto_43941 ) ) ( not ( = ?auto_43940 ?auto_43941 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43942 ?auto_43939 ?auto_43938 ?auto_43941 ?auto_43940 ?auto_43937 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44033 - OBJ
      ?auto_44034 - OBJ
      ?auto_44035 - OBJ
      ?auto_44036 - OBJ
      ?auto_44037 - OBJ
      ?auto_44032 - LOCATION
    )
    :vars
    (
      ?auto_44041 - LOCATION
      ?auto_44039 - CITY
      ?auto_44040 - LOCATION
      ?auto_44042 - LOCATION
      ?auto_44038 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44041 ?auto_44039 ) ( IN-CITY ?auto_44032 ?auto_44039 ) ( not ( = ?auto_44032 ?auto_44041 ) ) ( OBJ-AT ?auto_44035 ?auto_44041 ) ( OBJ-AT ?auto_44037 ?auto_44041 ) ( IN-CITY ?auto_44040 ?auto_44039 ) ( not ( = ?auto_44032 ?auto_44040 ) ) ( OBJ-AT ?auto_44033 ?auto_44040 ) ( OBJ-AT ?auto_44034 ?auto_44041 ) ( IN-CITY ?auto_44042 ?auto_44039 ) ( not ( = ?auto_44032 ?auto_44042 ) ) ( OBJ-AT ?auto_44036 ?auto_44042 ) ( TRUCK-AT ?auto_44038 ?auto_44032 ) ( not ( = ?auto_44036 ?auto_44034 ) ) ( not ( = ?auto_44041 ?auto_44042 ) ) ( not ( = ?auto_44036 ?auto_44033 ) ) ( not ( = ?auto_44034 ?auto_44033 ) ) ( not ( = ?auto_44040 ?auto_44041 ) ) ( not ( = ?auto_44040 ?auto_44042 ) ) ( not ( = ?auto_44036 ?auto_44037 ) ) ( not ( = ?auto_44034 ?auto_44037 ) ) ( not ( = ?auto_44033 ?auto_44037 ) ) ( not ( = ?auto_44036 ?auto_44035 ) ) ( not ( = ?auto_44034 ?auto_44035 ) ) ( not ( = ?auto_44033 ?auto_44035 ) ) ( not ( = ?auto_44037 ?auto_44035 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44036 ?auto_44034 ?auto_44033 ?auto_44035 ?auto_44037 ?auto_44032 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44182 - OBJ
      ?auto_44183 - OBJ
      ?auto_44184 - OBJ
      ?auto_44185 - OBJ
      ?auto_44186 - OBJ
      ?auto_44181 - LOCATION
    )
    :vars
    (
      ?auto_44190 - LOCATION
      ?auto_44188 - CITY
      ?auto_44189 - LOCATION
      ?auto_44191 - LOCATION
      ?auto_44187 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44190 ?auto_44188 ) ( IN-CITY ?auto_44181 ?auto_44188 ) ( not ( = ?auto_44181 ?auto_44190 ) ) ( OBJ-AT ?auto_44184 ?auto_44190 ) ( OBJ-AT ?auto_44185 ?auto_44190 ) ( IN-CITY ?auto_44189 ?auto_44188 ) ( not ( = ?auto_44181 ?auto_44189 ) ) ( OBJ-AT ?auto_44182 ?auto_44189 ) ( OBJ-AT ?auto_44183 ?auto_44190 ) ( IN-CITY ?auto_44191 ?auto_44188 ) ( not ( = ?auto_44181 ?auto_44191 ) ) ( OBJ-AT ?auto_44186 ?auto_44191 ) ( TRUCK-AT ?auto_44187 ?auto_44181 ) ( not ( = ?auto_44186 ?auto_44183 ) ) ( not ( = ?auto_44190 ?auto_44191 ) ) ( not ( = ?auto_44186 ?auto_44182 ) ) ( not ( = ?auto_44183 ?auto_44182 ) ) ( not ( = ?auto_44189 ?auto_44190 ) ) ( not ( = ?auto_44189 ?auto_44191 ) ) ( not ( = ?auto_44186 ?auto_44185 ) ) ( not ( = ?auto_44183 ?auto_44185 ) ) ( not ( = ?auto_44182 ?auto_44185 ) ) ( not ( = ?auto_44186 ?auto_44184 ) ) ( not ( = ?auto_44183 ?auto_44184 ) ) ( not ( = ?auto_44182 ?auto_44184 ) ) ( not ( = ?auto_44185 ?auto_44184 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44186 ?auto_44183 ?auto_44182 ?auto_44184 ?auto_44185 ?auto_44181 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45098 - OBJ
      ?auto_45099 - OBJ
      ?auto_45100 - OBJ
      ?auto_45101 - OBJ
      ?auto_45102 - OBJ
      ?auto_45097 - LOCATION
    )
    :vars
    (
      ?auto_45106 - LOCATION
      ?auto_45104 - CITY
      ?auto_45105 - LOCATION
      ?auto_45107 - LOCATION
      ?auto_45103 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45106 ?auto_45104 ) ( IN-CITY ?auto_45097 ?auto_45104 ) ( not ( = ?auto_45097 ?auto_45106 ) ) ( OBJ-AT ?auto_45102 ?auto_45106 ) ( OBJ-AT ?auto_45099 ?auto_45106 ) ( IN-CITY ?auto_45105 ?auto_45104 ) ( not ( = ?auto_45097 ?auto_45105 ) ) ( OBJ-AT ?auto_45098 ?auto_45105 ) ( OBJ-AT ?auto_45101 ?auto_45106 ) ( IN-CITY ?auto_45107 ?auto_45104 ) ( not ( = ?auto_45097 ?auto_45107 ) ) ( OBJ-AT ?auto_45100 ?auto_45107 ) ( TRUCK-AT ?auto_45103 ?auto_45097 ) ( not ( = ?auto_45100 ?auto_45101 ) ) ( not ( = ?auto_45106 ?auto_45107 ) ) ( not ( = ?auto_45100 ?auto_45098 ) ) ( not ( = ?auto_45101 ?auto_45098 ) ) ( not ( = ?auto_45105 ?auto_45106 ) ) ( not ( = ?auto_45105 ?auto_45107 ) ) ( not ( = ?auto_45100 ?auto_45099 ) ) ( not ( = ?auto_45101 ?auto_45099 ) ) ( not ( = ?auto_45098 ?auto_45099 ) ) ( not ( = ?auto_45100 ?auto_45102 ) ) ( not ( = ?auto_45101 ?auto_45102 ) ) ( not ( = ?auto_45098 ?auto_45102 ) ) ( not ( = ?auto_45099 ?auto_45102 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45100 ?auto_45101 ?auto_45098 ?auto_45102 ?auto_45099 ?auto_45097 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45145 - OBJ
      ?auto_45146 - OBJ
      ?auto_45147 - OBJ
      ?auto_45148 - OBJ
      ?auto_45149 - OBJ
      ?auto_45144 - LOCATION
    )
    :vars
    (
      ?auto_45153 - LOCATION
      ?auto_45151 - CITY
      ?auto_45152 - LOCATION
      ?auto_45154 - LOCATION
      ?auto_45150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45153 ?auto_45151 ) ( IN-CITY ?auto_45144 ?auto_45151 ) ( not ( = ?auto_45144 ?auto_45153 ) ) ( OBJ-AT ?auto_45148 ?auto_45153 ) ( OBJ-AT ?auto_45146 ?auto_45153 ) ( IN-CITY ?auto_45152 ?auto_45151 ) ( not ( = ?auto_45144 ?auto_45152 ) ) ( OBJ-AT ?auto_45145 ?auto_45152 ) ( OBJ-AT ?auto_45149 ?auto_45153 ) ( IN-CITY ?auto_45154 ?auto_45151 ) ( not ( = ?auto_45144 ?auto_45154 ) ) ( OBJ-AT ?auto_45147 ?auto_45154 ) ( TRUCK-AT ?auto_45150 ?auto_45144 ) ( not ( = ?auto_45147 ?auto_45149 ) ) ( not ( = ?auto_45153 ?auto_45154 ) ) ( not ( = ?auto_45147 ?auto_45145 ) ) ( not ( = ?auto_45149 ?auto_45145 ) ) ( not ( = ?auto_45152 ?auto_45153 ) ) ( not ( = ?auto_45152 ?auto_45154 ) ) ( not ( = ?auto_45147 ?auto_45146 ) ) ( not ( = ?auto_45149 ?auto_45146 ) ) ( not ( = ?auto_45145 ?auto_45146 ) ) ( not ( = ?auto_45147 ?auto_45148 ) ) ( not ( = ?auto_45149 ?auto_45148 ) ) ( not ( = ?auto_45145 ?auto_45148 ) ) ( not ( = ?auto_45146 ?auto_45148 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45147 ?auto_45149 ?auto_45145 ?auto_45148 ?auto_45146 ?auto_45144 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45192 - OBJ
      ?auto_45193 - OBJ
      ?auto_45194 - OBJ
      ?auto_45195 - OBJ
      ?auto_45196 - OBJ
      ?auto_45191 - LOCATION
    )
    :vars
    (
      ?auto_45200 - LOCATION
      ?auto_45198 - CITY
      ?auto_45199 - LOCATION
      ?auto_45201 - LOCATION
      ?auto_45197 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45200 ?auto_45198 ) ( IN-CITY ?auto_45191 ?auto_45198 ) ( not ( = ?auto_45191 ?auto_45200 ) ) ( OBJ-AT ?auto_45196 ?auto_45200 ) ( OBJ-AT ?auto_45193 ?auto_45200 ) ( IN-CITY ?auto_45199 ?auto_45198 ) ( not ( = ?auto_45191 ?auto_45199 ) ) ( OBJ-AT ?auto_45192 ?auto_45199 ) ( OBJ-AT ?auto_45194 ?auto_45200 ) ( IN-CITY ?auto_45201 ?auto_45198 ) ( not ( = ?auto_45191 ?auto_45201 ) ) ( OBJ-AT ?auto_45195 ?auto_45201 ) ( TRUCK-AT ?auto_45197 ?auto_45191 ) ( not ( = ?auto_45195 ?auto_45194 ) ) ( not ( = ?auto_45200 ?auto_45201 ) ) ( not ( = ?auto_45195 ?auto_45192 ) ) ( not ( = ?auto_45194 ?auto_45192 ) ) ( not ( = ?auto_45199 ?auto_45200 ) ) ( not ( = ?auto_45199 ?auto_45201 ) ) ( not ( = ?auto_45195 ?auto_45193 ) ) ( not ( = ?auto_45194 ?auto_45193 ) ) ( not ( = ?auto_45192 ?auto_45193 ) ) ( not ( = ?auto_45195 ?auto_45196 ) ) ( not ( = ?auto_45194 ?auto_45196 ) ) ( not ( = ?auto_45192 ?auto_45196 ) ) ( not ( = ?auto_45193 ?auto_45196 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45195 ?auto_45194 ?auto_45192 ?auto_45196 ?auto_45193 ?auto_45191 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45239 - OBJ
      ?auto_45240 - OBJ
      ?auto_45241 - OBJ
      ?auto_45242 - OBJ
      ?auto_45243 - OBJ
      ?auto_45238 - LOCATION
    )
    :vars
    (
      ?auto_45247 - LOCATION
      ?auto_45245 - CITY
      ?auto_45246 - LOCATION
      ?auto_45248 - LOCATION
      ?auto_45244 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45247 ?auto_45245 ) ( IN-CITY ?auto_45238 ?auto_45245 ) ( not ( = ?auto_45238 ?auto_45247 ) ) ( OBJ-AT ?auto_45242 ?auto_45247 ) ( OBJ-AT ?auto_45240 ?auto_45247 ) ( IN-CITY ?auto_45246 ?auto_45245 ) ( not ( = ?auto_45238 ?auto_45246 ) ) ( OBJ-AT ?auto_45239 ?auto_45246 ) ( OBJ-AT ?auto_45241 ?auto_45247 ) ( IN-CITY ?auto_45248 ?auto_45245 ) ( not ( = ?auto_45238 ?auto_45248 ) ) ( OBJ-AT ?auto_45243 ?auto_45248 ) ( TRUCK-AT ?auto_45244 ?auto_45238 ) ( not ( = ?auto_45243 ?auto_45241 ) ) ( not ( = ?auto_45247 ?auto_45248 ) ) ( not ( = ?auto_45243 ?auto_45239 ) ) ( not ( = ?auto_45241 ?auto_45239 ) ) ( not ( = ?auto_45246 ?auto_45247 ) ) ( not ( = ?auto_45246 ?auto_45248 ) ) ( not ( = ?auto_45243 ?auto_45240 ) ) ( not ( = ?auto_45241 ?auto_45240 ) ) ( not ( = ?auto_45239 ?auto_45240 ) ) ( not ( = ?auto_45243 ?auto_45242 ) ) ( not ( = ?auto_45241 ?auto_45242 ) ) ( not ( = ?auto_45239 ?auto_45242 ) ) ( not ( = ?auto_45240 ?auto_45242 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45243 ?auto_45241 ?auto_45239 ?auto_45242 ?auto_45240 ?auto_45238 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45536 - OBJ
      ?auto_45537 - OBJ
      ?auto_45538 - OBJ
      ?auto_45539 - OBJ
      ?auto_45540 - OBJ
      ?auto_45535 - LOCATION
    )
    :vars
    (
      ?auto_45544 - LOCATION
      ?auto_45542 - CITY
      ?auto_45543 - LOCATION
      ?auto_45545 - LOCATION
      ?auto_45541 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45544 ?auto_45542 ) ( IN-CITY ?auto_45535 ?auto_45542 ) ( not ( = ?auto_45535 ?auto_45544 ) ) ( OBJ-AT ?auto_45538 ?auto_45544 ) ( OBJ-AT ?auto_45537 ?auto_45544 ) ( IN-CITY ?auto_45543 ?auto_45542 ) ( not ( = ?auto_45535 ?auto_45543 ) ) ( OBJ-AT ?auto_45536 ?auto_45543 ) ( OBJ-AT ?auto_45540 ?auto_45544 ) ( IN-CITY ?auto_45545 ?auto_45542 ) ( not ( = ?auto_45535 ?auto_45545 ) ) ( OBJ-AT ?auto_45539 ?auto_45545 ) ( TRUCK-AT ?auto_45541 ?auto_45535 ) ( not ( = ?auto_45539 ?auto_45540 ) ) ( not ( = ?auto_45544 ?auto_45545 ) ) ( not ( = ?auto_45539 ?auto_45536 ) ) ( not ( = ?auto_45540 ?auto_45536 ) ) ( not ( = ?auto_45543 ?auto_45544 ) ) ( not ( = ?auto_45543 ?auto_45545 ) ) ( not ( = ?auto_45539 ?auto_45537 ) ) ( not ( = ?auto_45540 ?auto_45537 ) ) ( not ( = ?auto_45536 ?auto_45537 ) ) ( not ( = ?auto_45539 ?auto_45538 ) ) ( not ( = ?auto_45540 ?auto_45538 ) ) ( not ( = ?auto_45536 ?auto_45538 ) ) ( not ( = ?auto_45537 ?auto_45538 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45539 ?auto_45540 ?auto_45536 ?auto_45538 ?auto_45537 ?auto_45535 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45583 - OBJ
      ?auto_45584 - OBJ
      ?auto_45585 - OBJ
      ?auto_45586 - OBJ
      ?auto_45587 - OBJ
      ?auto_45582 - LOCATION
    )
    :vars
    (
      ?auto_45591 - LOCATION
      ?auto_45589 - CITY
      ?auto_45590 - LOCATION
      ?auto_45592 - LOCATION
      ?auto_45588 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45591 ?auto_45589 ) ( IN-CITY ?auto_45582 ?auto_45589 ) ( not ( = ?auto_45582 ?auto_45591 ) ) ( OBJ-AT ?auto_45585 ?auto_45591 ) ( OBJ-AT ?auto_45584 ?auto_45591 ) ( IN-CITY ?auto_45590 ?auto_45589 ) ( not ( = ?auto_45582 ?auto_45590 ) ) ( OBJ-AT ?auto_45583 ?auto_45590 ) ( OBJ-AT ?auto_45586 ?auto_45591 ) ( IN-CITY ?auto_45592 ?auto_45589 ) ( not ( = ?auto_45582 ?auto_45592 ) ) ( OBJ-AT ?auto_45587 ?auto_45592 ) ( TRUCK-AT ?auto_45588 ?auto_45582 ) ( not ( = ?auto_45587 ?auto_45586 ) ) ( not ( = ?auto_45591 ?auto_45592 ) ) ( not ( = ?auto_45587 ?auto_45583 ) ) ( not ( = ?auto_45586 ?auto_45583 ) ) ( not ( = ?auto_45590 ?auto_45591 ) ) ( not ( = ?auto_45590 ?auto_45592 ) ) ( not ( = ?auto_45587 ?auto_45584 ) ) ( not ( = ?auto_45586 ?auto_45584 ) ) ( not ( = ?auto_45583 ?auto_45584 ) ) ( not ( = ?auto_45587 ?auto_45585 ) ) ( not ( = ?auto_45586 ?auto_45585 ) ) ( not ( = ?auto_45583 ?auto_45585 ) ) ( not ( = ?auto_45584 ?auto_45585 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45587 ?auto_45586 ?auto_45583 ?auto_45585 ?auto_45584 ?auto_45582 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45930 - OBJ
      ?auto_45931 - OBJ
      ?auto_45932 - OBJ
      ?auto_45933 - OBJ
      ?auto_45934 - OBJ
      ?auto_45929 - LOCATION
    )
    :vars
    (
      ?auto_45938 - LOCATION
      ?auto_45936 - CITY
      ?auto_45937 - LOCATION
      ?auto_45939 - LOCATION
      ?auto_45935 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45938 ?auto_45936 ) ( IN-CITY ?auto_45929 ?auto_45936 ) ( not ( = ?auto_45929 ?auto_45938 ) ) ( OBJ-AT ?auto_45931 ?auto_45938 ) ( OBJ-AT ?auto_45934 ?auto_45938 ) ( IN-CITY ?auto_45937 ?auto_45936 ) ( not ( = ?auto_45929 ?auto_45937 ) ) ( OBJ-AT ?auto_45930 ?auto_45937 ) ( OBJ-AT ?auto_45933 ?auto_45938 ) ( IN-CITY ?auto_45939 ?auto_45936 ) ( not ( = ?auto_45929 ?auto_45939 ) ) ( OBJ-AT ?auto_45932 ?auto_45939 ) ( TRUCK-AT ?auto_45935 ?auto_45929 ) ( not ( = ?auto_45932 ?auto_45933 ) ) ( not ( = ?auto_45938 ?auto_45939 ) ) ( not ( = ?auto_45932 ?auto_45930 ) ) ( not ( = ?auto_45933 ?auto_45930 ) ) ( not ( = ?auto_45937 ?auto_45938 ) ) ( not ( = ?auto_45937 ?auto_45939 ) ) ( not ( = ?auto_45932 ?auto_45934 ) ) ( not ( = ?auto_45933 ?auto_45934 ) ) ( not ( = ?auto_45930 ?auto_45934 ) ) ( not ( = ?auto_45932 ?auto_45931 ) ) ( not ( = ?auto_45933 ?auto_45931 ) ) ( not ( = ?auto_45930 ?auto_45931 ) ) ( not ( = ?auto_45934 ?auto_45931 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45932 ?auto_45933 ?auto_45930 ?auto_45931 ?auto_45934 ?auto_45929 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46028 - OBJ
      ?auto_46029 - OBJ
      ?auto_46030 - OBJ
      ?auto_46031 - OBJ
      ?auto_46032 - OBJ
      ?auto_46027 - LOCATION
    )
    :vars
    (
      ?auto_46036 - LOCATION
      ?auto_46034 - CITY
      ?auto_46035 - LOCATION
      ?auto_46037 - LOCATION
      ?auto_46033 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46036 ?auto_46034 ) ( IN-CITY ?auto_46027 ?auto_46034 ) ( not ( = ?auto_46027 ?auto_46036 ) ) ( OBJ-AT ?auto_46029 ?auto_46036 ) ( OBJ-AT ?auto_46031 ?auto_46036 ) ( IN-CITY ?auto_46035 ?auto_46034 ) ( not ( = ?auto_46027 ?auto_46035 ) ) ( OBJ-AT ?auto_46028 ?auto_46035 ) ( OBJ-AT ?auto_46032 ?auto_46036 ) ( IN-CITY ?auto_46037 ?auto_46034 ) ( not ( = ?auto_46027 ?auto_46037 ) ) ( OBJ-AT ?auto_46030 ?auto_46037 ) ( TRUCK-AT ?auto_46033 ?auto_46027 ) ( not ( = ?auto_46030 ?auto_46032 ) ) ( not ( = ?auto_46036 ?auto_46037 ) ) ( not ( = ?auto_46030 ?auto_46028 ) ) ( not ( = ?auto_46032 ?auto_46028 ) ) ( not ( = ?auto_46035 ?auto_46036 ) ) ( not ( = ?auto_46035 ?auto_46037 ) ) ( not ( = ?auto_46030 ?auto_46031 ) ) ( not ( = ?auto_46032 ?auto_46031 ) ) ( not ( = ?auto_46028 ?auto_46031 ) ) ( not ( = ?auto_46030 ?auto_46029 ) ) ( not ( = ?auto_46032 ?auto_46029 ) ) ( not ( = ?auto_46028 ?auto_46029 ) ) ( not ( = ?auto_46031 ?auto_46029 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46030 ?auto_46032 ?auto_46028 ?auto_46029 ?auto_46031 ?auto_46027 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46174 - OBJ
      ?auto_46175 - OBJ
      ?auto_46176 - OBJ
      ?auto_46177 - OBJ
      ?auto_46178 - OBJ
      ?auto_46173 - LOCATION
    )
    :vars
    (
      ?auto_46182 - LOCATION
      ?auto_46180 - CITY
      ?auto_46181 - LOCATION
      ?auto_46183 - LOCATION
      ?auto_46179 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46182 ?auto_46180 ) ( IN-CITY ?auto_46173 ?auto_46180 ) ( not ( = ?auto_46173 ?auto_46182 ) ) ( OBJ-AT ?auto_46175 ?auto_46182 ) ( OBJ-AT ?auto_46178 ?auto_46182 ) ( IN-CITY ?auto_46181 ?auto_46180 ) ( not ( = ?auto_46173 ?auto_46181 ) ) ( OBJ-AT ?auto_46174 ?auto_46181 ) ( OBJ-AT ?auto_46176 ?auto_46182 ) ( IN-CITY ?auto_46183 ?auto_46180 ) ( not ( = ?auto_46173 ?auto_46183 ) ) ( OBJ-AT ?auto_46177 ?auto_46183 ) ( TRUCK-AT ?auto_46179 ?auto_46173 ) ( not ( = ?auto_46177 ?auto_46176 ) ) ( not ( = ?auto_46182 ?auto_46183 ) ) ( not ( = ?auto_46177 ?auto_46174 ) ) ( not ( = ?auto_46176 ?auto_46174 ) ) ( not ( = ?auto_46181 ?auto_46182 ) ) ( not ( = ?auto_46181 ?auto_46183 ) ) ( not ( = ?auto_46177 ?auto_46178 ) ) ( not ( = ?auto_46176 ?auto_46178 ) ) ( not ( = ?auto_46174 ?auto_46178 ) ) ( not ( = ?auto_46177 ?auto_46175 ) ) ( not ( = ?auto_46176 ?auto_46175 ) ) ( not ( = ?auto_46174 ?auto_46175 ) ) ( not ( = ?auto_46178 ?auto_46175 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46177 ?auto_46176 ?auto_46174 ?auto_46175 ?auto_46178 ?auto_46173 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46323 - OBJ
      ?auto_46324 - OBJ
      ?auto_46325 - OBJ
      ?auto_46326 - OBJ
      ?auto_46327 - OBJ
      ?auto_46322 - LOCATION
    )
    :vars
    (
      ?auto_46331 - LOCATION
      ?auto_46329 - CITY
      ?auto_46330 - LOCATION
      ?auto_46332 - LOCATION
      ?auto_46328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46331 ?auto_46329 ) ( IN-CITY ?auto_46322 ?auto_46329 ) ( not ( = ?auto_46322 ?auto_46331 ) ) ( OBJ-AT ?auto_46324 ?auto_46331 ) ( OBJ-AT ?auto_46326 ?auto_46331 ) ( IN-CITY ?auto_46330 ?auto_46329 ) ( not ( = ?auto_46322 ?auto_46330 ) ) ( OBJ-AT ?auto_46323 ?auto_46330 ) ( OBJ-AT ?auto_46325 ?auto_46331 ) ( IN-CITY ?auto_46332 ?auto_46329 ) ( not ( = ?auto_46322 ?auto_46332 ) ) ( OBJ-AT ?auto_46327 ?auto_46332 ) ( TRUCK-AT ?auto_46328 ?auto_46322 ) ( not ( = ?auto_46327 ?auto_46325 ) ) ( not ( = ?auto_46331 ?auto_46332 ) ) ( not ( = ?auto_46327 ?auto_46323 ) ) ( not ( = ?auto_46325 ?auto_46323 ) ) ( not ( = ?auto_46330 ?auto_46331 ) ) ( not ( = ?auto_46330 ?auto_46332 ) ) ( not ( = ?auto_46327 ?auto_46326 ) ) ( not ( = ?auto_46325 ?auto_46326 ) ) ( not ( = ?auto_46323 ?auto_46326 ) ) ( not ( = ?auto_46327 ?auto_46324 ) ) ( not ( = ?auto_46325 ?auto_46324 ) ) ( not ( = ?auto_46323 ?auto_46324 ) ) ( not ( = ?auto_46326 ?auto_46324 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46327 ?auto_46325 ?auto_46323 ?auto_46324 ?auto_46326 ?auto_46322 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46780 - OBJ
      ?auto_46781 - OBJ
      ?auto_46782 - OBJ
      ?auto_46783 - OBJ
      ?auto_46784 - OBJ
      ?auto_46779 - LOCATION
    )
    :vars
    (
      ?auto_46788 - LOCATION
      ?auto_46786 - CITY
      ?auto_46787 - LOCATION
      ?auto_46789 - LOCATION
      ?auto_46785 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46788 ?auto_46786 ) ( IN-CITY ?auto_46779 ?auto_46786 ) ( not ( = ?auto_46779 ?auto_46788 ) ) ( OBJ-AT ?auto_46781 ?auto_46788 ) ( OBJ-AT ?auto_46782 ?auto_46788 ) ( IN-CITY ?auto_46787 ?auto_46786 ) ( not ( = ?auto_46779 ?auto_46787 ) ) ( OBJ-AT ?auto_46780 ?auto_46787 ) ( OBJ-AT ?auto_46784 ?auto_46788 ) ( IN-CITY ?auto_46789 ?auto_46786 ) ( not ( = ?auto_46779 ?auto_46789 ) ) ( OBJ-AT ?auto_46783 ?auto_46789 ) ( TRUCK-AT ?auto_46785 ?auto_46779 ) ( not ( = ?auto_46783 ?auto_46784 ) ) ( not ( = ?auto_46788 ?auto_46789 ) ) ( not ( = ?auto_46783 ?auto_46780 ) ) ( not ( = ?auto_46784 ?auto_46780 ) ) ( not ( = ?auto_46787 ?auto_46788 ) ) ( not ( = ?auto_46787 ?auto_46789 ) ) ( not ( = ?auto_46783 ?auto_46782 ) ) ( not ( = ?auto_46784 ?auto_46782 ) ) ( not ( = ?auto_46780 ?auto_46782 ) ) ( not ( = ?auto_46783 ?auto_46781 ) ) ( not ( = ?auto_46784 ?auto_46781 ) ) ( not ( = ?auto_46780 ?auto_46781 ) ) ( not ( = ?auto_46782 ?auto_46781 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46783 ?auto_46784 ?auto_46780 ?auto_46781 ?auto_46782 ?auto_46779 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46827 - OBJ
      ?auto_46828 - OBJ
      ?auto_46829 - OBJ
      ?auto_46830 - OBJ
      ?auto_46831 - OBJ
      ?auto_46826 - LOCATION
    )
    :vars
    (
      ?auto_46835 - LOCATION
      ?auto_46833 - CITY
      ?auto_46834 - LOCATION
      ?auto_46836 - LOCATION
      ?auto_46832 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46835 ?auto_46833 ) ( IN-CITY ?auto_46826 ?auto_46833 ) ( not ( = ?auto_46826 ?auto_46835 ) ) ( OBJ-AT ?auto_46828 ?auto_46835 ) ( OBJ-AT ?auto_46829 ?auto_46835 ) ( IN-CITY ?auto_46834 ?auto_46833 ) ( not ( = ?auto_46826 ?auto_46834 ) ) ( OBJ-AT ?auto_46827 ?auto_46834 ) ( OBJ-AT ?auto_46830 ?auto_46835 ) ( IN-CITY ?auto_46836 ?auto_46833 ) ( not ( = ?auto_46826 ?auto_46836 ) ) ( OBJ-AT ?auto_46831 ?auto_46836 ) ( TRUCK-AT ?auto_46832 ?auto_46826 ) ( not ( = ?auto_46831 ?auto_46830 ) ) ( not ( = ?auto_46835 ?auto_46836 ) ) ( not ( = ?auto_46831 ?auto_46827 ) ) ( not ( = ?auto_46830 ?auto_46827 ) ) ( not ( = ?auto_46834 ?auto_46835 ) ) ( not ( = ?auto_46834 ?auto_46836 ) ) ( not ( = ?auto_46831 ?auto_46829 ) ) ( not ( = ?auto_46830 ?auto_46829 ) ) ( not ( = ?auto_46827 ?auto_46829 ) ) ( not ( = ?auto_46831 ?auto_46828 ) ) ( not ( = ?auto_46830 ?auto_46828 ) ) ( not ( = ?auto_46827 ?auto_46828 ) ) ( not ( = ?auto_46829 ?auto_46828 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46831 ?auto_46830 ?auto_46827 ?auto_46828 ?auto_46829 ?auto_46826 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47535 - OBJ
      ?auto_47536 - OBJ
      ?auto_47537 - OBJ
      ?auto_47538 - OBJ
      ?auto_47539 - OBJ
      ?auto_47534 - LOCATION
    )
    :vars
    (
      ?auto_47543 - LOCATION
      ?auto_47541 - CITY
      ?auto_47542 - LOCATION
      ?auto_47544 - LOCATION
      ?auto_47540 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47543 ?auto_47541 ) ( IN-CITY ?auto_47534 ?auto_47541 ) ( not ( = ?auto_47534 ?auto_47543 ) ) ( OBJ-AT ?auto_47539 ?auto_47543 ) ( OBJ-AT ?auto_47535 ?auto_47543 ) ( IN-CITY ?auto_47542 ?auto_47541 ) ( not ( = ?auto_47534 ?auto_47542 ) ) ( OBJ-AT ?auto_47538 ?auto_47542 ) ( OBJ-AT ?auto_47537 ?auto_47543 ) ( IN-CITY ?auto_47544 ?auto_47541 ) ( not ( = ?auto_47534 ?auto_47544 ) ) ( OBJ-AT ?auto_47536 ?auto_47544 ) ( TRUCK-AT ?auto_47540 ?auto_47534 ) ( not ( = ?auto_47536 ?auto_47537 ) ) ( not ( = ?auto_47543 ?auto_47544 ) ) ( not ( = ?auto_47536 ?auto_47538 ) ) ( not ( = ?auto_47537 ?auto_47538 ) ) ( not ( = ?auto_47542 ?auto_47543 ) ) ( not ( = ?auto_47542 ?auto_47544 ) ) ( not ( = ?auto_47536 ?auto_47535 ) ) ( not ( = ?auto_47537 ?auto_47535 ) ) ( not ( = ?auto_47538 ?auto_47535 ) ) ( not ( = ?auto_47536 ?auto_47539 ) ) ( not ( = ?auto_47537 ?auto_47539 ) ) ( not ( = ?auto_47538 ?auto_47539 ) ) ( not ( = ?auto_47535 ?auto_47539 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47536 ?auto_47537 ?auto_47538 ?auto_47539 ?auto_47535 ?auto_47534 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47582 - OBJ
      ?auto_47583 - OBJ
      ?auto_47584 - OBJ
      ?auto_47585 - OBJ
      ?auto_47586 - OBJ
      ?auto_47581 - LOCATION
    )
    :vars
    (
      ?auto_47590 - LOCATION
      ?auto_47588 - CITY
      ?auto_47589 - LOCATION
      ?auto_47591 - LOCATION
      ?auto_47587 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47590 ?auto_47588 ) ( IN-CITY ?auto_47581 ?auto_47588 ) ( not ( = ?auto_47581 ?auto_47590 ) ) ( OBJ-AT ?auto_47585 ?auto_47590 ) ( OBJ-AT ?auto_47582 ?auto_47590 ) ( IN-CITY ?auto_47589 ?auto_47588 ) ( not ( = ?auto_47581 ?auto_47589 ) ) ( OBJ-AT ?auto_47586 ?auto_47589 ) ( OBJ-AT ?auto_47584 ?auto_47590 ) ( IN-CITY ?auto_47591 ?auto_47588 ) ( not ( = ?auto_47581 ?auto_47591 ) ) ( OBJ-AT ?auto_47583 ?auto_47591 ) ( TRUCK-AT ?auto_47587 ?auto_47581 ) ( not ( = ?auto_47583 ?auto_47584 ) ) ( not ( = ?auto_47590 ?auto_47591 ) ) ( not ( = ?auto_47583 ?auto_47586 ) ) ( not ( = ?auto_47584 ?auto_47586 ) ) ( not ( = ?auto_47589 ?auto_47590 ) ) ( not ( = ?auto_47589 ?auto_47591 ) ) ( not ( = ?auto_47583 ?auto_47582 ) ) ( not ( = ?auto_47584 ?auto_47582 ) ) ( not ( = ?auto_47586 ?auto_47582 ) ) ( not ( = ?auto_47583 ?auto_47585 ) ) ( not ( = ?auto_47584 ?auto_47585 ) ) ( not ( = ?auto_47586 ?auto_47585 ) ) ( not ( = ?auto_47582 ?auto_47585 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47583 ?auto_47584 ?auto_47586 ?auto_47585 ?auto_47582 ?auto_47581 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47629 - OBJ
      ?auto_47630 - OBJ
      ?auto_47631 - OBJ
      ?auto_47632 - OBJ
      ?auto_47633 - OBJ
      ?auto_47628 - LOCATION
    )
    :vars
    (
      ?auto_47637 - LOCATION
      ?auto_47635 - CITY
      ?auto_47636 - LOCATION
      ?auto_47638 - LOCATION
      ?auto_47634 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47637 ?auto_47635 ) ( IN-CITY ?auto_47628 ?auto_47635 ) ( not ( = ?auto_47628 ?auto_47637 ) ) ( OBJ-AT ?auto_47633 ?auto_47637 ) ( OBJ-AT ?auto_47629 ?auto_47637 ) ( IN-CITY ?auto_47636 ?auto_47635 ) ( not ( = ?auto_47628 ?auto_47636 ) ) ( OBJ-AT ?auto_47631 ?auto_47636 ) ( OBJ-AT ?auto_47632 ?auto_47637 ) ( IN-CITY ?auto_47638 ?auto_47635 ) ( not ( = ?auto_47628 ?auto_47638 ) ) ( OBJ-AT ?auto_47630 ?auto_47638 ) ( TRUCK-AT ?auto_47634 ?auto_47628 ) ( not ( = ?auto_47630 ?auto_47632 ) ) ( not ( = ?auto_47637 ?auto_47638 ) ) ( not ( = ?auto_47630 ?auto_47631 ) ) ( not ( = ?auto_47632 ?auto_47631 ) ) ( not ( = ?auto_47636 ?auto_47637 ) ) ( not ( = ?auto_47636 ?auto_47638 ) ) ( not ( = ?auto_47630 ?auto_47629 ) ) ( not ( = ?auto_47632 ?auto_47629 ) ) ( not ( = ?auto_47631 ?auto_47629 ) ) ( not ( = ?auto_47630 ?auto_47633 ) ) ( not ( = ?auto_47632 ?auto_47633 ) ) ( not ( = ?auto_47631 ?auto_47633 ) ) ( not ( = ?auto_47629 ?auto_47633 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47630 ?auto_47632 ?auto_47631 ?auto_47633 ?auto_47629 ?auto_47628 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47676 - OBJ
      ?auto_47677 - OBJ
      ?auto_47678 - OBJ
      ?auto_47679 - OBJ
      ?auto_47680 - OBJ
      ?auto_47675 - LOCATION
    )
    :vars
    (
      ?auto_47684 - LOCATION
      ?auto_47682 - CITY
      ?auto_47683 - LOCATION
      ?auto_47685 - LOCATION
      ?auto_47681 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47684 ?auto_47682 ) ( IN-CITY ?auto_47675 ?auto_47682 ) ( not ( = ?auto_47675 ?auto_47684 ) ) ( OBJ-AT ?auto_47679 ?auto_47684 ) ( OBJ-AT ?auto_47676 ?auto_47684 ) ( IN-CITY ?auto_47683 ?auto_47682 ) ( not ( = ?auto_47675 ?auto_47683 ) ) ( OBJ-AT ?auto_47678 ?auto_47683 ) ( OBJ-AT ?auto_47680 ?auto_47684 ) ( IN-CITY ?auto_47685 ?auto_47682 ) ( not ( = ?auto_47675 ?auto_47685 ) ) ( OBJ-AT ?auto_47677 ?auto_47685 ) ( TRUCK-AT ?auto_47681 ?auto_47675 ) ( not ( = ?auto_47677 ?auto_47680 ) ) ( not ( = ?auto_47684 ?auto_47685 ) ) ( not ( = ?auto_47677 ?auto_47678 ) ) ( not ( = ?auto_47680 ?auto_47678 ) ) ( not ( = ?auto_47683 ?auto_47684 ) ) ( not ( = ?auto_47683 ?auto_47685 ) ) ( not ( = ?auto_47677 ?auto_47676 ) ) ( not ( = ?auto_47680 ?auto_47676 ) ) ( not ( = ?auto_47678 ?auto_47676 ) ) ( not ( = ?auto_47677 ?auto_47679 ) ) ( not ( = ?auto_47680 ?auto_47679 ) ) ( not ( = ?auto_47678 ?auto_47679 ) ) ( not ( = ?auto_47676 ?auto_47679 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47677 ?auto_47680 ?auto_47678 ?auto_47679 ?auto_47676 ?auto_47675 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47923 - OBJ
      ?auto_47924 - OBJ
      ?auto_47925 - OBJ
      ?auto_47926 - OBJ
      ?auto_47927 - OBJ
      ?auto_47922 - LOCATION
    )
    :vars
    (
      ?auto_47931 - LOCATION
      ?auto_47929 - CITY
      ?auto_47930 - LOCATION
      ?auto_47932 - LOCATION
      ?auto_47928 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47931 ?auto_47929 ) ( IN-CITY ?auto_47922 ?auto_47929 ) ( not ( = ?auto_47922 ?auto_47931 ) ) ( OBJ-AT ?auto_47925 ?auto_47931 ) ( OBJ-AT ?auto_47923 ?auto_47931 ) ( IN-CITY ?auto_47930 ?auto_47929 ) ( not ( = ?auto_47922 ?auto_47930 ) ) ( OBJ-AT ?auto_47927 ?auto_47930 ) ( OBJ-AT ?auto_47926 ?auto_47931 ) ( IN-CITY ?auto_47932 ?auto_47929 ) ( not ( = ?auto_47922 ?auto_47932 ) ) ( OBJ-AT ?auto_47924 ?auto_47932 ) ( TRUCK-AT ?auto_47928 ?auto_47922 ) ( not ( = ?auto_47924 ?auto_47926 ) ) ( not ( = ?auto_47931 ?auto_47932 ) ) ( not ( = ?auto_47924 ?auto_47927 ) ) ( not ( = ?auto_47926 ?auto_47927 ) ) ( not ( = ?auto_47930 ?auto_47931 ) ) ( not ( = ?auto_47930 ?auto_47932 ) ) ( not ( = ?auto_47924 ?auto_47923 ) ) ( not ( = ?auto_47926 ?auto_47923 ) ) ( not ( = ?auto_47927 ?auto_47923 ) ) ( not ( = ?auto_47924 ?auto_47925 ) ) ( not ( = ?auto_47926 ?auto_47925 ) ) ( not ( = ?auto_47927 ?auto_47925 ) ) ( not ( = ?auto_47923 ?auto_47925 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47924 ?auto_47926 ?auto_47927 ?auto_47925 ?auto_47923 ?auto_47922 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47970 - OBJ
      ?auto_47971 - OBJ
      ?auto_47972 - OBJ
      ?auto_47973 - OBJ
      ?auto_47974 - OBJ
      ?auto_47969 - LOCATION
    )
    :vars
    (
      ?auto_47978 - LOCATION
      ?auto_47976 - CITY
      ?auto_47977 - LOCATION
      ?auto_47979 - LOCATION
      ?auto_47975 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47978 ?auto_47976 ) ( IN-CITY ?auto_47969 ?auto_47976 ) ( not ( = ?auto_47969 ?auto_47978 ) ) ( OBJ-AT ?auto_47972 ?auto_47978 ) ( OBJ-AT ?auto_47970 ?auto_47978 ) ( IN-CITY ?auto_47977 ?auto_47976 ) ( not ( = ?auto_47969 ?auto_47977 ) ) ( OBJ-AT ?auto_47973 ?auto_47977 ) ( OBJ-AT ?auto_47974 ?auto_47978 ) ( IN-CITY ?auto_47979 ?auto_47976 ) ( not ( = ?auto_47969 ?auto_47979 ) ) ( OBJ-AT ?auto_47971 ?auto_47979 ) ( TRUCK-AT ?auto_47975 ?auto_47969 ) ( not ( = ?auto_47971 ?auto_47974 ) ) ( not ( = ?auto_47978 ?auto_47979 ) ) ( not ( = ?auto_47971 ?auto_47973 ) ) ( not ( = ?auto_47974 ?auto_47973 ) ) ( not ( = ?auto_47977 ?auto_47978 ) ) ( not ( = ?auto_47977 ?auto_47979 ) ) ( not ( = ?auto_47971 ?auto_47970 ) ) ( not ( = ?auto_47974 ?auto_47970 ) ) ( not ( = ?auto_47973 ?auto_47970 ) ) ( not ( = ?auto_47971 ?auto_47972 ) ) ( not ( = ?auto_47974 ?auto_47972 ) ) ( not ( = ?auto_47973 ?auto_47972 ) ) ( not ( = ?auto_47970 ?auto_47972 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47971 ?auto_47974 ?auto_47973 ?auto_47972 ?auto_47970 ?auto_47969 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48167 - OBJ
      ?auto_48168 - OBJ
      ?auto_48169 - OBJ
      ?auto_48170 - OBJ
      ?auto_48171 - OBJ
      ?auto_48166 - LOCATION
    )
    :vars
    (
      ?auto_48175 - LOCATION
      ?auto_48173 - CITY
      ?auto_48174 - LOCATION
      ?auto_48176 - LOCATION
      ?auto_48172 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48175 ?auto_48173 ) ( IN-CITY ?auto_48166 ?auto_48173 ) ( not ( = ?auto_48166 ?auto_48175 ) ) ( OBJ-AT ?auto_48171 ?auto_48175 ) ( OBJ-AT ?auto_48167 ?auto_48175 ) ( IN-CITY ?auto_48174 ?auto_48173 ) ( not ( = ?auto_48166 ?auto_48174 ) ) ( OBJ-AT ?auto_48170 ?auto_48174 ) ( OBJ-AT ?auto_48168 ?auto_48175 ) ( IN-CITY ?auto_48176 ?auto_48173 ) ( not ( = ?auto_48166 ?auto_48176 ) ) ( OBJ-AT ?auto_48169 ?auto_48176 ) ( TRUCK-AT ?auto_48172 ?auto_48166 ) ( not ( = ?auto_48169 ?auto_48168 ) ) ( not ( = ?auto_48175 ?auto_48176 ) ) ( not ( = ?auto_48169 ?auto_48170 ) ) ( not ( = ?auto_48168 ?auto_48170 ) ) ( not ( = ?auto_48174 ?auto_48175 ) ) ( not ( = ?auto_48174 ?auto_48176 ) ) ( not ( = ?auto_48169 ?auto_48167 ) ) ( not ( = ?auto_48168 ?auto_48167 ) ) ( not ( = ?auto_48170 ?auto_48167 ) ) ( not ( = ?auto_48169 ?auto_48171 ) ) ( not ( = ?auto_48168 ?auto_48171 ) ) ( not ( = ?auto_48170 ?auto_48171 ) ) ( not ( = ?auto_48167 ?auto_48171 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48169 ?auto_48168 ?auto_48170 ?auto_48171 ?auto_48167 ?auto_48166 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48214 - OBJ
      ?auto_48215 - OBJ
      ?auto_48216 - OBJ
      ?auto_48217 - OBJ
      ?auto_48218 - OBJ
      ?auto_48213 - LOCATION
    )
    :vars
    (
      ?auto_48222 - LOCATION
      ?auto_48220 - CITY
      ?auto_48221 - LOCATION
      ?auto_48223 - LOCATION
      ?auto_48219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48222 ?auto_48220 ) ( IN-CITY ?auto_48213 ?auto_48220 ) ( not ( = ?auto_48213 ?auto_48222 ) ) ( OBJ-AT ?auto_48217 ?auto_48222 ) ( OBJ-AT ?auto_48214 ?auto_48222 ) ( IN-CITY ?auto_48221 ?auto_48220 ) ( not ( = ?auto_48213 ?auto_48221 ) ) ( OBJ-AT ?auto_48218 ?auto_48221 ) ( OBJ-AT ?auto_48215 ?auto_48222 ) ( IN-CITY ?auto_48223 ?auto_48220 ) ( not ( = ?auto_48213 ?auto_48223 ) ) ( OBJ-AT ?auto_48216 ?auto_48223 ) ( TRUCK-AT ?auto_48219 ?auto_48213 ) ( not ( = ?auto_48216 ?auto_48215 ) ) ( not ( = ?auto_48222 ?auto_48223 ) ) ( not ( = ?auto_48216 ?auto_48218 ) ) ( not ( = ?auto_48215 ?auto_48218 ) ) ( not ( = ?auto_48221 ?auto_48222 ) ) ( not ( = ?auto_48221 ?auto_48223 ) ) ( not ( = ?auto_48216 ?auto_48214 ) ) ( not ( = ?auto_48215 ?auto_48214 ) ) ( not ( = ?auto_48218 ?auto_48214 ) ) ( not ( = ?auto_48216 ?auto_48217 ) ) ( not ( = ?auto_48215 ?auto_48217 ) ) ( not ( = ?auto_48218 ?auto_48217 ) ) ( not ( = ?auto_48214 ?auto_48217 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48216 ?auto_48215 ?auto_48218 ?auto_48217 ?auto_48214 ?auto_48213 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48362 - OBJ
      ?auto_48363 - OBJ
      ?auto_48364 - OBJ
      ?auto_48365 - OBJ
      ?auto_48366 - OBJ
      ?auto_48361 - LOCATION
    )
    :vars
    (
      ?auto_48370 - LOCATION
      ?auto_48368 - CITY
      ?auto_48369 - LOCATION
      ?auto_48371 - LOCATION
      ?auto_48367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48370 ?auto_48368 ) ( IN-CITY ?auto_48361 ?auto_48368 ) ( not ( = ?auto_48361 ?auto_48370 ) ) ( OBJ-AT ?auto_48366 ?auto_48370 ) ( OBJ-AT ?auto_48362 ?auto_48370 ) ( IN-CITY ?auto_48369 ?auto_48368 ) ( not ( = ?auto_48361 ?auto_48369 ) ) ( OBJ-AT ?auto_48364 ?auto_48369 ) ( OBJ-AT ?auto_48363 ?auto_48370 ) ( IN-CITY ?auto_48371 ?auto_48368 ) ( not ( = ?auto_48361 ?auto_48371 ) ) ( OBJ-AT ?auto_48365 ?auto_48371 ) ( TRUCK-AT ?auto_48367 ?auto_48361 ) ( not ( = ?auto_48365 ?auto_48363 ) ) ( not ( = ?auto_48370 ?auto_48371 ) ) ( not ( = ?auto_48365 ?auto_48364 ) ) ( not ( = ?auto_48363 ?auto_48364 ) ) ( not ( = ?auto_48369 ?auto_48370 ) ) ( not ( = ?auto_48369 ?auto_48371 ) ) ( not ( = ?auto_48365 ?auto_48362 ) ) ( not ( = ?auto_48363 ?auto_48362 ) ) ( not ( = ?auto_48364 ?auto_48362 ) ) ( not ( = ?auto_48365 ?auto_48366 ) ) ( not ( = ?auto_48363 ?auto_48366 ) ) ( not ( = ?auto_48364 ?auto_48366 ) ) ( not ( = ?auto_48362 ?auto_48366 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48365 ?auto_48363 ?auto_48364 ?auto_48366 ?auto_48362 ?auto_48361 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48409 - OBJ
      ?auto_48410 - OBJ
      ?auto_48411 - OBJ
      ?auto_48412 - OBJ
      ?auto_48413 - OBJ
      ?auto_48408 - LOCATION
    )
    :vars
    (
      ?auto_48417 - LOCATION
      ?auto_48415 - CITY
      ?auto_48416 - LOCATION
      ?auto_48418 - LOCATION
      ?auto_48414 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48417 ?auto_48415 ) ( IN-CITY ?auto_48408 ?auto_48415 ) ( not ( = ?auto_48408 ?auto_48417 ) ) ( OBJ-AT ?auto_48412 ?auto_48417 ) ( OBJ-AT ?auto_48409 ?auto_48417 ) ( IN-CITY ?auto_48416 ?auto_48415 ) ( not ( = ?auto_48408 ?auto_48416 ) ) ( OBJ-AT ?auto_48411 ?auto_48416 ) ( OBJ-AT ?auto_48410 ?auto_48417 ) ( IN-CITY ?auto_48418 ?auto_48415 ) ( not ( = ?auto_48408 ?auto_48418 ) ) ( OBJ-AT ?auto_48413 ?auto_48418 ) ( TRUCK-AT ?auto_48414 ?auto_48408 ) ( not ( = ?auto_48413 ?auto_48410 ) ) ( not ( = ?auto_48417 ?auto_48418 ) ) ( not ( = ?auto_48413 ?auto_48411 ) ) ( not ( = ?auto_48410 ?auto_48411 ) ) ( not ( = ?auto_48416 ?auto_48417 ) ) ( not ( = ?auto_48416 ?auto_48418 ) ) ( not ( = ?auto_48413 ?auto_48409 ) ) ( not ( = ?auto_48410 ?auto_48409 ) ) ( not ( = ?auto_48411 ?auto_48409 ) ) ( not ( = ?auto_48413 ?auto_48412 ) ) ( not ( = ?auto_48410 ?auto_48412 ) ) ( not ( = ?auto_48411 ?auto_48412 ) ) ( not ( = ?auto_48409 ?auto_48412 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48413 ?auto_48410 ?auto_48411 ?auto_48412 ?auto_48409 ?auto_48408 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48605 - OBJ
      ?auto_48606 - OBJ
      ?auto_48607 - OBJ
      ?auto_48608 - OBJ
      ?auto_48609 - OBJ
      ?auto_48604 - LOCATION
    )
    :vars
    (
      ?auto_48613 - LOCATION
      ?auto_48611 - CITY
      ?auto_48612 - LOCATION
      ?auto_48614 - LOCATION
      ?auto_48610 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48613 ?auto_48611 ) ( IN-CITY ?auto_48604 ?auto_48611 ) ( not ( = ?auto_48604 ?auto_48613 ) ) ( OBJ-AT ?auto_48607 ?auto_48613 ) ( OBJ-AT ?auto_48605 ?auto_48613 ) ( IN-CITY ?auto_48612 ?auto_48611 ) ( not ( = ?auto_48604 ?auto_48612 ) ) ( OBJ-AT ?auto_48609 ?auto_48612 ) ( OBJ-AT ?auto_48606 ?auto_48613 ) ( IN-CITY ?auto_48614 ?auto_48611 ) ( not ( = ?auto_48604 ?auto_48614 ) ) ( OBJ-AT ?auto_48608 ?auto_48614 ) ( TRUCK-AT ?auto_48610 ?auto_48604 ) ( not ( = ?auto_48608 ?auto_48606 ) ) ( not ( = ?auto_48613 ?auto_48614 ) ) ( not ( = ?auto_48608 ?auto_48609 ) ) ( not ( = ?auto_48606 ?auto_48609 ) ) ( not ( = ?auto_48612 ?auto_48613 ) ) ( not ( = ?auto_48612 ?auto_48614 ) ) ( not ( = ?auto_48608 ?auto_48605 ) ) ( not ( = ?auto_48606 ?auto_48605 ) ) ( not ( = ?auto_48609 ?auto_48605 ) ) ( not ( = ?auto_48608 ?auto_48607 ) ) ( not ( = ?auto_48606 ?auto_48607 ) ) ( not ( = ?auto_48609 ?auto_48607 ) ) ( not ( = ?auto_48605 ?auto_48607 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48608 ?auto_48606 ?auto_48609 ?auto_48607 ?auto_48605 ?auto_48604 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48703 - OBJ
      ?auto_48704 - OBJ
      ?auto_48705 - OBJ
      ?auto_48706 - OBJ
      ?auto_48707 - OBJ
      ?auto_48702 - LOCATION
    )
    :vars
    (
      ?auto_48711 - LOCATION
      ?auto_48709 - CITY
      ?auto_48710 - LOCATION
      ?auto_48712 - LOCATION
      ?auto_48708 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48711 ?auto_48709 ) ( IN-CITY ?auto_48702 ?auto_48709 ) ( not ( = ?auto_48702 ?auto_48711 ) ) ( OBJ-AT ?auto_48705 ?auto_48711 ) ( OBJ-AT ?auto_48703 ?auto_48711 ) ( IN-CITY ?auto_48710 ?auto_48709 ) ( not ( = ?auto_48702 ?auto_48710 ) ) ( OBJ-AT ?auto_48706 ?auto_48710 ) ( OBJ-AT ?auto_48704 ?auto_48711 ) ( IN-CITY ?auto_48712 ?auto_48709 ) ( not ( = ?auto_48702 ?auto_48712 ) ) ( OBJ-AT ?auto_48707 ?auto_48712 ) ( TRUCK-AT ?auto_48708 ?auto_48702 ) ( not ( = ?auto_48707 ?auto_48704 ) ) ( not ( = ?auto_48711 ?auto_48712 ) ) ( not ( = ?auto_48707 ?auto_48706 ) ) ( not ( = ?auto_48704 ?auto_48706 ) ) ( not ( = ?auto_48710 ?auto_48711 ) ) ( not ( = ?auto_48710 ?auto_48712 ) ) ( not ( = ?auto_48707 ?auto_48703 ) ) ( not ( = ?auto_48704 ?auto_48703 ) ) ( not ( = ?auto_48706 ?auto_48703 ) ) ( not ( = ?auto_48707 ?auto_48705 ) ) ( not ( = ?auto_48704 ?auto_48705 ) ) ( not ( = ?auto_48706 ?auto_48705 ) ) ( not ( = ?auto_48703 ?auto_48705 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48707 ?auto_48704 ?auto_48706 ?auto_48705 ?auto_48703 ?auto_48702 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48900 - OBJ
      ?auto_48901 - OBJ
      ?auto_48902 - OBJ
      ?auto_48903 - OBJ
      ?auto_48904 - OBJ
      ?auto_48899 - LOCATION
    )
    :vars
    (
      ?auto_48908 - LOCATION
      ?auto_48906 - CITY
      ?auto_48907 - LOCATION
      ?auto_48909 - LOCATION
      ?auto_48905 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48908 ?auto_48906 ) ( IN-CITY ?auto_48899 ?auto_48906 ) ( not ( = ?auto_48899 ?auto_48908 ) ) ( OBJ-AT ?auto_48904 ?auto_48908 ) ( OBJ-AT ?auto_48900 ?auto_48908 ) ( IN-CITY ?auto_48907 ?auto_48906 ) ( not ( = ?auto_48899 ?auto_48907 ) ) ( OBJ-AT ?auto_48901 ?auto_48907 ) ( OBJ-AT ?auto_48903 ?auto_48908 ) ( IN-CITY ?auto_48909 ?auto_48906 ) ( not ( = ?auto_48899 ?auto_48909 ) ) ( OBJ-AT ?auto_48902 ?auto_48909 ) ( TRUCK-AT ?auto_48905 ?auto_48899 ) ( not ( = ?auto_48902 ?auto_48903 ) ) ( not ( = ?auto_48908 ?auto_48909 ) ) ( not ( = ?auto_48902 ?auto_48901 ) ) ( not ( = ?auto_48903 ?auto_48901 ) ) ( not ( = ?auto_48907 ?auto_48908 ) ) ( not ( = ?auto_48907 ?auto_48909 ) ) ( not ( = ?auto_48902 ?auto_48900 ) ) ( not ( = ?auto_48903 ?auto_48900 ) ) ( not ( = ?auto_48901 ?auto_48900 ) ) ( not ( = ?auto_48902 ?auto_48904 ) ) ( not ( = ?auto_48903 ?auto_48904 ) ) ( not ( = ?auto_48901 ?auto_48904 ) ) ( not ( = ?auto_48900 ?auto_48904 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48902 ?auto_48903 ?auto_48901 ?auto_48904 ?auto_48900 ?auto_48899 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48947 - OBJ
      ?auto_48948 - OBJ
      ?auto_48949 - OBJ
      ?auto_48950 - OBJ
      ?auto_48951 - OBJ
      ?auto_48946 - LOCATION
    )
    :vars
    (
      ?auto_48955 - LOCATION
      ?auto_48953 - CITY
      ?auto_48954 - LOCATION
      ?auto_48956 - LOCATION
      ?auto_48952 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48955 ?auto_48953 ) ( IN-CITY ?auto_48946 ?auto_48953 ) ( not ( = ?auto_48946 ?auto_48955 ) ) ( OBJ-AT ?auto_48950 ?auto_48955 ) ( OBJ-AT ?auto_48947 ?auto_48955 ) ( IN-CITY ?auto_48954 ?auto_48953 ) ( not ( = ?auto_48946 ?auto_48954 ) ) ( OBJ-AT ?auto_48948 ?auto_48954 ) ( OBJ-AT ?auto_48951 ?auto_48955 ) ( IN-CITY ?auto_48956 ?auto_48953 ) ( not ( = ?auto_48946 ?auto_48956 ) ) ( OBJ-AT ?auto_48949 ?auto_48956 ) ( TRUCK-AT ?auto_48952 ?auto_48946 ) ( not ( = ?auto_48949 ?auto_48951 ) ) ( not ( = ?auto_48955 ?auto_48956 ) ) ( not ( = ?auto_48949 ?auto_48948 ) ) ( not ( = ?auto_48951 ?auto_48948 ) ) ( not ( = ?auto_48954 ?auto_48955 ) ) ( not ( = ?auto_48954 ?auto_48956 ) ) ( not ( = ?auto_48949 ?auto_48947 ) ) ( not ( = ?auto_48951 ?auto_48947 ) ) ( not ( = ?auto_48948 ?auto_48947 ) ) ( not ( = ?auto_48949 ?auto_48950 ) ) ( not ( = ?auto_48951 ?auto_48950 ) ) ( not ( = ?auto_48948 ?auto_48950 ) ) ( not ( = ?auto_48947 ?auto_48950 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48949 ?auto_48951 ?auto_48948 ?auto_48950 ?auto_48947 ?auto_48946 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48994 - OBJ
      ?auto_48995 - OBJ
      ?auto_48996 - OBJ
      ?auto_48997 - OBJ
      ?auto_48998 - OBJ
      ?auto_48993 - LOCATION
    )
    :vars
    (
      ?auto_49002 - LOCATION
      ?auto_49000 - CITY
      ?auto_49001 - LOCATION
      ?auto_49003 - LOCATION
      ?auto_48999 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_49002 ?auto_49000 ) ( IN-CITY ?auto_48993 ?auto_49000 ) ( not ( = ?auto_48993 ?auto_49002 ) ) ( OBJ-AT ?auto_48998 ?auto_49002 ) ( OBJ-AT ?auto_48994 ?auto_49002 ) ( IN-CITY ?auto_49001 ?auto_49000 ) ( not ( = ?auto_48993 ?auto_49001 ) ) ( OBJ-AT ?auto_48995 ?auto_49001 ) ( OBJ-AT ?auto_48996 ?auto_49002 ) ( IN-CITY ?auto_49003 ?auto_49000 ) ( not ( = ?auto_48993 ?auto_49003 ) ) ( OBJ-AT ?auto_48997 ?auto_49003 ) ( TRUCK-AT ?auto_48999 ?auto_48993 ) ( not ( = ?auto_48997 ?auto_48996 ) ) ( not ( = ?auto_49002 ?auto_49003 ) ) ( not ( = ?auto_48997 ?auto_48995 ) ) ( not ( = ?auto_48996 ?auto_48995 ) ) ( not ( = ?auto_49001 ?auto_49002 ) ) ( not ( = ?auto_49001 ?auto_49003 ) ) ( not ( = ?auto_48997 ?auto_48994 ) ) ( not ( = ?auto_48996 ?auto_48994 ) ) ( not ( = ?auto_48995 ?auto_48994 ) ) ( not ( = ?auto_48997 ?auto_48998 ) ) ( not ( = ?auto_48996 ?auto_48998 ) ) ( not ( = ?auto_48995 ?auto_48998 ) ) ( not ( = ?auto_48994 ?auto_48998 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48997 ?auto_48996 ?auto_48995 ?auto_48998 ?auto_48994 ?auto_48993 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49041 - OBJ
      ?auto_49042 - OBJ
      ?auto_49043 - OBJ
      ?auto_49044 - OBJ
      ?auto_49045 - OBJ
      ?auto_49040 - LOCATION
    )
    :vars
    (
      ?auto_49049 - LOCATION
      ?auto_49047 - CITY
      ?auto_49048 - LOCATION
      ?auto_49050 - LOCATION
      ?auto_49046 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_49049 ?auto_49047 ) ( IN-CITY ?auto_49040 ?auto_49047 ) ( not ( = ?auto_49040 ?auto_49049 ) ) ( OBJ-AT ?auto_49044 ?auto_49049 ) ( OBJ-AT ?auto_49041 ?auto_49049 ) ( IN-CITY ?auto_49048 ?auto_49047 ) ( not ( = ?auto_49040 ?auto_49048 ) ) ( OBJ-AT ?auto_49042 ?auto_49048 ) ( OBJ-AT ?auto_49043 ?auto_49049 ) ( IN-CITY ?auto_49050 ?auto_49047 ) ( not ( = ?auto_49040 ?auto_49050 ) ) ( OBJ-AT ?auto_49045 ?auto_49050 ) ( TRUCK-AT ?auto_49046 ?auto_49040 ) ( not ( = ?auto_49045 ?auto_49043 ) ) ( not ( = ?auto_49049 ?auto_49050 ) ) ( not ( = ?auto_49045 ?auto_49042 ) ) ( not ( = ?auto_49043 ?auto_49042 ) ) ( not ( = ?auto_49048 ?auto_49049 ) ) ( not ( = ?auto_49048 ?auto_49050 ) ) ( not ( = ?auto_49045 ?auto_49041 ) ) ( not ( = ?auto_49043 ?auto_49041 ) ) ( not ( = ?auto_49042 ?auto_49041 ) ) ( not ( = ?auto_49045 ?auto_49044 ) ) ( not ( = ?auto_49043 ?auto_49044 ) ) ( not ( = ?auto_49042 ?auto_49044 ) ) ( not ( = ?auto_49041 ?auto_49044 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_49045 ?auto_49043 ?auto_49042 ?auto_49044 ?auto_49041 ?auto_49040 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49338 - OBJ
      ?auto_49339 - OBJ
      ?auto_49340 - OBJ
      ?auto_49341 - OBJ
      ?auto_49342 - OBJ
      ?auto_49337 - LOCATION
    )
    :vars
    (
      ?auto_49346 - LOCATION
      ?auto_49344 - CITY
      ?auto_49345 - LOCATION
      ?auto_49347 - LOCATION
      ?auto_49343 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_49346 ?auto_49344 ) ( IN-CITY ?auto_49337 ?auto_49344 ) ( not ( = ?auto_49337 ?auto_49346 ) ) ( OBJ-AT ?auto_49340 ?auto_49346 ) ( OBJ-AT ?auto_49338 ?auto_49346 ) ( IN-CITY ?auto_49345 ?auto_49344 ) ( not ( = ?auto_49337 ?auto_49345 ) ) ( OBJ-AT ?auto_49339 ?auto_49345 ) ( OBJ-AT ?auto_49342 ?auto_49346 ) ( IN-CITY ?auto_49347 ?auto_49344 ) ( not ( = ?auto_49337 ?auto_49347 ) ) ( OBJ-AT ?auto_49341 ?auto_49347 ) ( TRUCK-AT ?auto_49343 ?auto_49337 ) ( not ( = ?auto_49341 ?auto_49342 ) ) ( not ( = ?auto_49346 ?auto_49347 ) ) ( not ( = ?auto_49341 ?auto_49339 ) ) ( not ( = ?auto_49342 ?auto_49339 ) ) ( not ( = ?auto_49345 ?auto_49346 ) ) ( not ( = ?auto_49345 ?auto_49347 ) ) ( not ( = ?auto_49341 ?auto_49338 ) ) ( not ( = ?auto_49342 ?auto_49338 ) ) ( not ( = ?auto_49339 ?auto_49338 ) ) ( not ( = ?auto_49341 ?auto_49340 ) ) ( not ( = ?auto_49342 ?auto_49340 ) ) ( not ( = ?auto_49339 ?auto_49340 ) ) ( not ( = ?auto_49338 ?auto_49340 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_49341 ?auto_49342 ?auto_49339 ?auto_49340 ?auto_49338 ?auto_49337 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49385 - OBJ
      ?auto_49386 - OBJ
      ?auto_49387 - OBJ
      ?auto_49388 - OBJ
      ?auto_49389 - OBJ
      ?auto_49384 - LOCATION
    )
    :vars
    (
      ?auto_49393 - LOCATION
      ?auto_49391 - CITY
      ?auto_49392 - LOCATION
      ?auto_49394 - LOCATION
      ?auto_49390 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_49393 ?auto_49391 ) ( IN-CITY ?auto_49384 ?auto_49391 ) ( not ( = ?auto_49384 ?auto_49393 ) ) ( OBJ-AT ?auto_49387 ?auto_49393 ) ( OBJ-AT ?auto_49385 ?auto_49393 ) ( IN-CITY ?auto_49392 ?auto_49391 ) ( not ( = ?auto_49384 ?auto_49392 ) ) ( OBJ-AT ?auto_49386 ?auto_49392 ) ( OBJ-AT ?auto_49388 ?auto_49393 ) ( IN-CITY ?auto_49394 ?auto_49391 ) ( not ( = ?auto_49384 ?auto_49394 ) ) ( OBJ-AT ?auto_49389 ?auto_49394 ) ( TRUCK-AT ?auto_49390 ?auto_49384 ) ( not ( = ?auto_49389 ?auto_49388 ) ) ( not ( = ?auto_49393 ?auto_49394 ) ) ( not ( = ?auto_49389 ?auto_49386 ) ) ( not ( = ?auto_49388 ?auto_49386 ) ) ( not ( = ?auto_49392 ?auto_49393 ) ) ( not ( = ?auto_49392 ?auto_49394 ) ) ( not ( = ?auto_49389 ?auto_49385 ) ) ( not ( = ?auto_49388 ?auto_49385 ) ) ( not ( = ?auto_49386 ?auto_49385 ) ) ( not ( = ?auto_49389 ?auto_49387 ) ) ( not ( = ?auto_49388 ?auto_49387 ) ) ( not ( = ?auto_49386 ?auto_49387 ) ) ( not ( = ?auto_49385 ?auto_49387 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_49389 ?auto_49388 ?auto_49386 ?auto_49387 ?auto_49385 ?auto_49384 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_50502 - OBJ
      ?auto_50503 - OBJ
      ?auto_50504 - OBJ
      ?auto_50505 - OBJ
      ?auto_50506 - OBJ
      ?auto_50501 - LOCATION
    )
    :vars
    (
      ?auto_50510 - LOCATION
      ?auto_50508 - CITY
      ?auto_50509 - LOCATION
      ?auto_50511 - LOCATION
      ?auto_50507 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_50510 ?auto_50508 ) ( IN-CITY ?auto_50501 ?auto_50508 ) ( not ( = ?auto_50501 ?auto_50510 ) ) ( OBJ-AT ?auto_50503 ?auto_50510 ) ( OBJ-AT ?auto_50502 ?auto_50510 ) ( IN-CITY ?auto_50509 ?auto_50508 ) ( not ( = ?auto_50501 ?auto_50509 ) ) ( OBJ-AT ?auto_50506 ?auto_50509 ) ( OBJ-AT ?auto_50505 ?auto_50510 ) ( IN-CITY ?auto_50511 ?auto_50508 ) ( not ( = ?auto_50501 ?auto_50511 ) ) ( OBJ-AT ?auto_50504 ?auto_50511 ) ( TRUCK-AT ?auto_50507 ?auto_50501 ) ( not ( = ?auto_50504 ?auto_50505 ) ) ( not ( = ?auto_50510 ?auto_50511 ) ) ( not ( = ?auto_50504 ?auto_50506 ) ) ( not ( = ?auto_50505 ?auto_50506 ) ) ( not ( = ?auto_50509 ?auto_50510 ) ) ( not ( = ?auto_50509 ?auto_50511 ) ) ( not ( = ?auto_50504 ?auto_50502 ) ) ( not ( = ?auto_50505 ?auto_50502 ) ) ( not ( = ?auto_50506 ?auto_50502 ) ) ( not ( = ?auto_50504 ?auto_50503 ) ) ( not ( = ?auto_50505 ?auto_50503 ) ) ( not ( = ?auto_50506 ?auto_50503 ) ) ( not ( = ?auto_50502 ?auto_50503 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_50504 ?auto_50505 ?auto_50506 ?auto_50503 ?auto_50502 ?auto_50501 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_50549 - OBJ
      ?auto_50550 - OBJ
      ?auto_50551 - OBJ
      ?auto_50552 - OBJ
      ?auto_50553 - OBJ
      ?auto_50548 - LOCATION
    )
    :vars
    (
      ?auto_50557 - LOCATION
      ?auto_50555 - CITY
      ?auto_50556 - LOCATION
      ?auto_50558 - LOCATION
      ?auto_50554 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_50557 ?auto_50555 ) ( IN-CITY ?auto_50548 ?auto_50555 ) ( not ( = ?auto_50548 ?auto_50557 ) ) ( OBJ-AT ?auto_50550 ?auto_50557 ) ( OBJ-AT ?auto_50549 ?auto_50557 ) ( IN-CITY ?auto_50556 ?auto_50555 ) ( not ( = ?auto_50548 ?auto_50556 ) ) ( OBJ-AT ?auto_50552 ?auto_50556 ) ( OBJ-AT ?auto_50553 ?auto_50557 ) ( IN-CITY ?auto_50558 ?auto_50555 ) ( not ( = ?auto_50548 ?auto_50558 ) ) ( OBJ-AT ?auto_50551 ?auto_50558 ) ( TRUCK-AT ?auto_50554 ?auto_50548 ) ( not ( = ?auto_50551 ?auto_50553 ) ) ( not ( = ?auto_50557 ?auto_50558 ) ) ( not ( = ?auto_50551 ?auto_50552 ) ) ( not ( = ?auto_50553 ?auto_50552 ) ) ( not ( = ?auto_50556 ?auto_50557 ) ) ( not ( = ?auto_50556 ?auto_50558 ) ) ( not ( = ?auto_50551 ?auto_50549 ) ) ( not ( = ?auto_50553 ?auto_50549 ) ) ( not ( = ?auto_50552 ?auto_50549 ) ) ( not ( = ?auto_50551 ?auto_50550 ) ) ( not ( = ?auto_50553 ?auto_50550 ) ) ( not ( = ?auto_50552 ?auto_50550 ) ) ( not ( = ?auto_50549 ?auto_50550 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_50551 ?auto_50553 ?auto_50552 ?auto_50550 ?auto_50549 ?auto_50548 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_50746 - OBJ
      ?auto_50747 - OBJ
      ?auto_50748 - OBJ
      ?auto_50749 - OBJ
      ?auto_50750 - OBJ
      ?auto_50745 - LOCATION
    )
    :vars
    (
      ?auto_50754 - LOCATION
      ?auto_50752 - CITY
      ?auto_50753 - LOCATION
      ?auto_50755 - LOCATION
      ?auto_50751 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_50754 ?auto_50752 ) ( IN-CITY ?auto_50745 ?auto_50752 ) ( not ( = ?auto_50745 ?auto_50754 ) ) ( OBJ-AT ?auto_50747 ?auto_50754 ) ( OBJ-AT ?auto_50746 ?auto_50754 ) ( IN-CITY ?auto_50753 ?auto_50752 ) ( not ( = ?auto_50745 ?auto_50753 ) ) ( OBJ-AT ?auto_50750 ?auto_50753 ) ( OBJ-AT ?auto_50748 ?auto_50754 ) ( IN-CITY ?auto_50755 ?auto_50752 ) ( not ( = ?auto_50745 ?auto_50755 ) ) ( OBJ-AT ?auto_50749 ?auto_50755 ) ( TRUCK-AT ?auto_50751 ?auto_50745 ) ( not ( = ?auto_50749 ?auto_50748 ) ) ( not ( = ?auto_50754 ?auto_50755 ) ) ( not ( = ?auto_50749 ?auto_50750 ) ) ( not ( = ?auto_50748 ?auto_50750 ) ) ( not ( = ?auto_50753 ?auto_50754 ) ) ( not ( = ?auto_50753 ?auto_50755 ) ) ( not ( = ?auto_50749 ?auto_50746 ) ) ( not ( = ?auto_50748 ?auto_50746 ) ) ( not ( = ?auto_50750 ?auto_50746 ) ) ( not ( = ?auto_50749 ?auto_50747 ) ) ( not ( = ?auto_50748 ?auto_50747 ) ) ( not ( = ?auto_50750 ?auto_50747 ) ) ( not ( = ?auto_50746 ?auto_50747 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_50749 ?auto_50748 ?auto_50750 ?auto_50747 ?auto_50746 ?auto_50745 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_50844 - OBJ
      ?auto_50845 - OBJ
      ?auto_50846 - OBJ
      ?auto_50847 - OBJ
      ?auto_50848 - OBJ
      ?auto_50843 - LOCATION
    )
    :vars
    (
      ?auto_50852 - LOCATION
      ?auto_50850 - CITY
      ?auto_50851 - LOCATION
      ?auto_50853 - LOCATION
      ?auto_50849 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_50852 ?auto_50850 ) ( IN-CITY ?auto_50843 ?auto_50850 ) ( not ( = ?auto_50843 ?auto_50852 ) ) ( OBJ-AT ?auto_50845 ?auto_50852 ) ( OBJ-AT ?auto_50844 ?auto_50852 ) ( IN-CITY ?auto_50851 ?auto_50850 ) ( not ( = ?auto_50843 ?auto_50851 ) ) ( OBJ-AT ?auto_50847 ?auto_50851 ) ( OBJ-AT ?auto_50846 ?auto_50852 ) ( IN-CITY ?auto_50853 ?auto_50850 ) ( not ( = ?auto_50843 ?auto_50853 ) ) ( OBJ-AT ?auto_50848 ?auto_50853 ) ( TRUCK-AT ?auto_50849 ?auto_50843 ) ( not ( = ?auto_50848 ?auto_50846 ) ) ( not ( = ?auto_50852 ?auto_50853 ) ) ( not ( = ?auto_50848 ?auto_50847 ) ) ( not ( = ?auto_50846 ?auto_50847 ) ) ( not ( = ?auto_50851 ?auto_50852 ) ) ( not ( = ?auto_50851 ?auto_50853 ) ) ( not ( = ?auto_50848 ?auto_50844 ) ) ( not ( = ?auto_50846 ?auto_50844 ) ) ( not ( = ?auto_50847 ?auto_50844 ) ) ( not ( = ?auto_50848 ?auto_50845 ) ) ( not ( = ?auto_50846 ?auto_50845 ) ) ( not ( = ?auto_50847 ?auto_50845 ) ) ( not ( = ?auto_50844 ?auto_50845 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_50848 ?auto_50846 ?auto_50847 ?auto_50845 ?auto_50844 ?auto_50843 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_51041 - OBJ
      ?auto_51042 - OBJ
      ?auto_51043 - OBJ
      ?auto_51044 - OBJ
      ?auto_51045 - OBJ
      ?auto_51040 - LOCATION
    )
    :vars
    (
      ?auto_51049 - LOCATION
      ?auto_51047 - CITY
      ?auto_51048 - LOCATION
      ?auto_51050 - LOCATION
      ?auto_51046 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_51049 ?auto_51047 ) ( IN-CITY ?auto_51040 ?auto_51047 ) ( not ( = ?auto_51040 ?auto_51049 ) ) ( OBJ-AT ?auto_51042 ?auto_51049 ) ( OBJ-AT ?auto_51041 ?auto_51049 ) ( IN-CITY ?auto_51048 ?auto_51047 ) ( not ( = ?auto_51040 ?auto_51048 ) ) ( OBJ-AT ?auto_51043 ?auto_51048 ) ( OBJ-AT ?auto_51045 ?auto_51049 ) ( IN-CITY ?auto_51050 ?auto_51047 ) ( not ( = ?auto_51040 ?auto_51050 ) ) ( OBJ-AT ?auto_51044 ?auto_51050 ) ( TRUCK-AT ?auto_51046 ?auto_51040 ) ( not ( = ?auto_51044 ?auto_51045 ) ) ( not ( = ?auto_51049 ?auto_51050 ) ) ( not ( = ?auto_51044 ?auto_51043 ) ) ( not ( = ?auto_51045 ?auto_51043 ) ) ( not ( = ?auto_51048 ?auto_51049 ) ) ( not ( = ?auto_51048 ?auto_51050 ) ) ( not ( = ?auto_51044 ?auto_51041 ) ) ( not ( = ?auto_51045 ?auto_51041 ) ) ( not ( = ?auto_51043 ?auto_51041 ) ) ( not ( = ?auto_51044 ?auto_51042 ) ) ( not ( = ?auto_51045 ?auto_51042 ) ) ( not ( = ?auto_51043 ?auto_51042 ) ) ( not ( = ?auto_51041 ?auto_51042 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_51044 ?auto_51045 ?auto_51043 ?auto_51042 ?auto_51041 ?auto_51040 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_51088 - OBJ
      ?auto_51089 - OBJ
      ?auto_51090 - OBJ
      ?auto_51091 - OBJ
      ?auto_51092 - OBJ
      ?auto_51087 - LOCATION
    )
    :vars
    (
      ?auto_51096 - LOCATION
      ?auto_51094 - CITY
      ?auto_51095 - LOCATION
      ?auto_51097 - LOCATION
      ?auto_51093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_51096 ?auto_51094 ) ( IN-CITY ?auto_51087 ?auto_51094 ) ( not ( = ?auto_51087 ?auto_51096 ) ) ( OBJ-AT ?auto_51089 ?auto_51096 ) ( OBJ-AT ?auto_51088 ?auto_51096 ) ( IN-CITY ?auto_51095 ?auto_51094 ) ( not ( = ?auto_51087 ?auto_51095 ) ) ( OBJ-AT ?auto_51090 ?auto_51095 ) ( OBJ-AT ?auto_51091 ?auto_51096 ) ( IN-CITY ?auto_51097 ?auto_51094 ) ( not ( = ?auto_51087 ?auto_51097 ) ) ( OBJ-AT ?auto_51092 ?auto_51097 ) ( TRUCK-AT ?auto_51093 ?auto_51087 ) ( not ( = ?auto_51092 ?auto_51091 ) ) ( not ( = ?auto_51096 ?auto_51097 ) ) ( not ( = ?auto_51092 ?auto_51090 ) ) ( not ( = ?auto_51091 ?auto_51090 ) ) ( not ( = ?auto_51095 ?auto_51096 ) ) ( not ( = ?auto_51095 ?auto_51097 ) ) ( not ( = ?auto_51092 ?auto_51088 ) ) ( not ( = ?auto_51091 ?auto_51088 ) ) ( not ( = ?auto_51090 ?auto_51088 ) ) ( not ( = ?auto_51092 ?auto_51089 ) ) ( not ( = ?auto_51091 ?auto_51089 ) ) ( not ( = ?auto_51090 ?auto_51089 ) ) ( not ( = ?auto_51088 ?auto_51089 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_51092 ?auto_51091 ?auto_51090 ?auto_51089 ?auto_51088 ?auto_51087 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_52467 - OBJ
      ?auto_52468 - OBJ
      ?auto_52469 - OBJ
      ?auto_52470 - OBJ
      ?auto_52471 - OBJ
      ?auto_52466 - LOCATION
    )
    :vars
    (
      ?auto_52475 - LOCATION
      ?auto_52473 - CITY
      ?auto_52474 - LOCATION
      ?auto_52476 - LOCATION
      ?auto_52472 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_52475 ?auto_52473 ) ( IN-CITY ?auto_52466 ?auto_52473 ) ( not ( = ?auto_52466 ?auto_52475 ) ) ( OBJ-AT ?auto_52467 ?auto_52475 ) ( OBJ-AT ?auto_52471 ?auto_52475 ) ( IN-CITY ?auto_52474 ?auto_52473 ) ( not ( = ?auto_52466 ?auto_52474 ) ) ( OBJ-AT ?auto_52470 ?auto_52474 ) ( OBJ-AT ?auto_52469 ?auto_52475 ) ( IN-CITY ?auto_52476 ?auto_52473 ) ( not ( = ?auto_52466 ?auto_52476 ) ) ( OBJ-AT ?auto_52468 ?auto_52476 ) ( TRUCK-AT ?auto_52472 ?auto_52466 ) ( not ( = ?auto_52468 ?auto_52469 ) ) ( not ( = ?auto_52475 ?auto_52476 ) ) ( not ( = ?auto_52468 ?auto_52470 ) ) ( not ( = ?auto_52469 ?auto_52470 ) ) ( not ( = ?auto_52474 ?auto_52475 ) ) ( not ( = ?auto_52474 ?auto_52476 ) ) ( not ( = ?auto_52468 ?auto_52471 ) ) ( not ( = ?auto_52469 ?auto_52471 ) ) ( not ( = ?auto_52470 ?auto_52471 ) ) ( not ( = ?auto_52468 ?auto_52467 ) ) ( not ( = ?auto_52469 ?auto_52467 ) ) ( not ( = ?auto_52470 ?auto_52467 ) ) ( not ( = ?auto_52471 ?auto_52467 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_52468 ?auto_52469 ?auto_52470 ?auto_52467 ?auto_52471 ?auto_52466 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_52514 - OBJ
      ?auto_52515 - OBJ
      ?auto_52516 - OBJ
      ?auto_52517 - OBJ
      ?auto_52518 - OBJ
      ?auto_52513 - LOCATION
    )
    :vars
    (
      ?auto_52522 - LOCATION
      ?auto_52520 - CITY
      ?auto_52521 - LOCATION
      ?auto_52523 - LOCATION
      ?auto_52519 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_52522 ?auto_52520 ) ( IN-CITY ?auto_52513 ?auto_52520 ) ( not ( = ?auto_52513 ?auto_52522 ) ) ( OBJ-AT ?auto_52514 ?auto_52522 ) ( OBJ-AT ?auto_52517 ?auto_52522 ) ( IN-CITY ?auto_52521 ?auto_52520 ) ( not ( = ?auto_52513 ?auto_52521 ) ) ( OBJ-AT ?auto_52518 ?auto_52521 ) ( OBJ-AT ?auto_52516 ?auto_52522 ) ( IN-CITY ?auto_52523 ?auto_52520 ) ( not ( = ?auto_52513 ?auto_52523 ) ) ( OBJ-AT ?auto_52515 ?auto_52523 ) ( TRUCK-AT ?auto_52519 ?auto_52513 ) ( not ( = ?auto_52515 ?auto_52516 ) ) ( not ( = ?auto_52522 ?auto_52523 ) ) ( not ( = ?auto_52515 ?auto_52518 ) ) ( not ( = ?auto_52516 ?auto_52518 ) ) ( not ( = ?auto_52521 ?auto_52522 ) ) ( not ( = ?auto_52521 ?auto_52523 ) ) ( not ( = ?auto_52515 ?auto_52517 ) ) ( not ( = ?auto_52516 ?auto_52517 ) ) ( not ( = ?auto_52518 ?auto_52517 ) ) ( not ( = ?auto_52515 ?auto_52514 ) ) ( not ( = ?auto_52516 ?auto_52514 ) ) ( not ( = ?auto_52518 ?auto_52514 ) ) ( not ( = ?auto_52517 ?auto_52514 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_52515 ?auto_52516 ?auto_52518 ?auto_52514 ?auto_52517 ?auto_52513 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_52711 - OBJ
      ?auto_52712 - OBJ
      ?auto_52713 - OBJ
      ?auto_52714 - OBJ
      ?auto_52715 - OBJ
      ?auto_52710 - LOCATION
    )
    :vars
    (
      ?auto_52719 - LOCATION
      ?auto_52717 - CITY
      ?auto_52718 - LOCATION
      ?auto_52720 - LOCATION
      ?auto_52716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_52719 ?auto_52717 ) ( IN-CITY ?auto_52710 ?auto_52717 ) ( not ( = ?auto_52710 ?auto_52719 ) ) ( OBJ-AT ?auto_52711 ?auto_52719 ) ( OBJ-AT ?auto_52715 ?auto_52719 ) ( IN-CITY ?auto_52718 ?auto_52717 ) ( not ( = ?auto_52710 ?auto_52718 ) ) ( OBJ-AT ?auto_52713 ?auto_52718 ) ( OBJ-AT ?auto_52714 ?auto_52719 ) ( IN-CITY ?auto_52720 ?auto_52717 ) ( not ( = ?auto_52710 ?auto_52720 ) ) ( OBJ-AT ?auto_52712 ?auto_52720 ) ( TRUCK-AT ?auto_52716 ?auto_52710 ) ( not ( = ?auto_52712 ?auto_52714 ) ) ( not ( = ?auto_52719 ?auto_52720 ) ) ( not ( = ?auto_52712 ?auto_52713 ) ) ( not ( = ?auto_52714 ?auto_52713 ) ) ( not ( = ?auto_52718 ?auto_52719 ) ) ( not ( = ?auto_52718 ?auto_52720 ) ) ( not ( = ?auto_52712 ?auto_52715 ) ) ( not ( = ?auto_52714 ?auto_52715 ) ) ( not ( = ?auto_52713 ?auto_52715 ) ) ( not ( = ?auto_52712 ?auto_52711 ) ) ( not ( = ?auto_52714 ?auto_52711 ) ) ( not ( = ?auto_52713 ?auto_52711 ) ) ( not ( = ?auto_52715 ?auto_52711 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_52712 ?auto_52714 ?auto_52713 ?auto_52711 ?auto_52715 ?auto_52710 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_52809 - OBJ
      ?auto_52810 - OBJ
      ?auto_52811 - OBJ
      ?auto_52812 - OBJ
      ?auto_52813 - OBJ
      ?auto_52808 - LOCATION
    )
    :vars
    (
      ?auto_52817 - LOCATION
      ?auto_52815 - CITY
      ?auto_52816 - LOCATION
      ?auto_52818 - LOCATION
      ?auto_52814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_52817 ?auto_52815 ) ( IN-CITY ?auto_52808 ?auto_52815 ) ( not ( = ?auto_52808 ?auto_52817 ) ) ( OBJ-AT ?auto_52809 ?auto_52817 ) ( OBJ-AT ?auto_52812 ?auto_52817 ) ( IN-CITY ?auto_52816 ?auto_52815 ) ( not ( = ?auto_52808 ?auto_52816 ) ) ( OBJ-AT ?auto_52811 ?auto_52816 ) ( OBJ-AT ?auto_52813 ?auto_52817 ) ( IN-CITY ?auto_52818 ?auto_52815 ) ( not ( = ?auto_52808 ?auto_52818 ) ) ( OBJ-AT ?auto_52810 ?auto_52818 ) ( TRUCK-AT ?auto_52814 ?auto_52808 ) ( not ( = ?auto_52810 ?auto_52813 ) ) ( not ( = ?auto_52817 ?auto_52818 ) ) ( not ( = ?auto_52810 ?auto_52811 ) ) ( not ( = ?auto_52813 ?auto_52811 ) ) ( not ( = ?auto_52816 ?auto_52817 ) ) ( not ( = ?auto_52816 ?auto_52818 ) ) ( not ( = ?auto_52810 ?auto_52812 ) ) ( not ( = ?auto_52813 ?auto_52812 ) ) ( not ( = ?auto_52811 ?auto_52812 ) ) ( not ( = ?auto_52810 ?auto_52809 ) ) ( not ( = ?auto_52813 ?auto_52809 ) ) ( not ( = ?auto_52811 ?auto_52809 ) ) ( not ( = ?auto_52812 ?auto_52809 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_52810 ?auto_52813 ?auto_52811 ?auto_52809 ?auto_52812 ?auto_52808 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53006 - OBJ
      ?auto_53007 - OBJ
      ?auto_53008 - OBJ
      ?auto_53009 - OBJ
      ?auto_53010 - OBJ
      ?auto_53005 - LOCATION
    )
    :vars
    (
      ?auto_53014 - LOCATION
      ?auto_53012 - CITY
      ?auto_53013 - LOCATION
      ?auto_53015 - LOCATION
      ?auto_53011 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53014 ?auto_53012 ) ( IN-CITY ?auto_53005 ?auto_53012 ) ( not ( = ?auto_53005 ?auto_53014 ) ) ( OBJ-AT ?auto_53006 ?auto_53014 ) ( OBJ-AT ?auto_53008 ?auto_53014 ) ( IN-CITY ?auto_53013 ?auto_53012 ) ( not ( = ?auto_53005 ?auto_53013 ) ) ( OBJ-AT ?auto_53010 ?auto_53013 ) ( OBJ-AT ?auto_53009 ?auto_53014 ) ( IN-CITY ?auto_53015 ?auto_53012 ) ( not ( = ?auto_53005 ?auto_53015 ) ) ( OBJ-AT ?auto_53007 ?auto_53015 ) ( TRUCK-AT ?auto_53011 ?auto_53005 ) ( not ( = ?auto_53007 ?auto_53009 ) ) ( not ( = ?auto_53014 ?auto_53015 ) ) ( not ( = ?auto_53007 ?auto_53010 ) ) ( not ( = ?auto_53009 ?auto_53010 ) ) ( not ( = ?auto_53013 ?auto_53014 ) ) ( not ( = ?auto_53013 ?auto_53015 ) ) ( not ( = ?auto_53007 ?auto_53008 ) ) ( not ( = ?auto_53009 ?auto_53008 ) ) ( not ( = ?auto_53010 ?auto_53008 ) ) ( not ( = ?auto_53007 ?auto_53006 ) ) ( not ( = ?auto_53009 ?auto_53006 ) ) ( not ( = ?auto_53010 ?auto_53006 ) ) ( not ( = ?auto_53008 ?auto_53006 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53007 ?auto_53009 ?auto_53010 ?auto_53006 ?auto_53008 ?auto_53005 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53053 - OBJ
      ?auto_53054 - OBJ
      ?auto_53055 - OBJ
      ?auto_53056 - OBJ
      ?auto_53057 - OBJ
      ?auto_53052 - LOCATION
    )
    :vars
    (
      ?auto_53061 - LOCATION
      ?auto_53059 - CITY
      ?auto_53060 - LOCATION
      ?auto_53062 - LOCATION
      ?auto_53058 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53061 ?auto_53059 ) ( IN-CITY ?auto_53052 ?auto_53059 ) ( not ( = ?auto_53052 ?auto_53061 ) ) ( OBJ-AT ?auto_53053 ?auto_53061 ) ( OBJ-AT ?auto_53055 ?auto_53061 ) ( IN-CITY ?auto_53060 ?auto_53059 ) ( not ( = ?auto_53052 ?auto_53060 ) ) ( OBJ-AT ?auto_53056 ?auto_53060 ) ( OBJ-AT ?auto_53057 ?auto_53061 ) ( IN-CITY ?auto_53062 ?auto_53059 ) ( not ( = ?auto_53052 ?auto_53062 ) ) ( OBJ-AT ?auto_53054 ?auto_53062 ) ( TRUCK-AT ?auto_53058 ?auto_53052 ) ( not ( = ?auto_53054 ?auto_53057 ) ) ( not ( = ?auto_53061 ?auto_53062 ) ) ( not ( = ?auto_53054 ?auto_53056 ) ) ( not ( = ?auto_53057 ?auto_53056 ) ) ( not ( = ?auto_53060 ?auto_53061 ) ) ( not ( = ?auto_53060 ?auto_53062 ) ) ( not ( = ?auto_53054 ?auto_53055 ) ) ( not ( = ?auto_53057 ?auto_53055 ) ) ( not ( = ?auto_53056 ?auto_53055 ) ) ( not ( = ?auto_53054 ?auto_53053 ) ) ( not ( = ?auto_53057 ?auto_53053 ) ) ( not ( = ?auto_53056 ?auto_53053 ) ) ( not ( = ?auto_53055 ?auto_53053 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53054 ?auto_53057 ?auto_53056 ?auto_53053 ?auto_53055 ?auto_53052 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53711 - OBJ
      ?auto_53712 - OBJ
      ?auto_53713 - OBJ
      ?auto_53714 - OBJ
      ?auto_53715 - OBJ
      ?auto_53710 - LOCATION
    )
    :vars
    (
      ?auto_53719 - LOCATION
      ?auto_53717 - CITY
      ?auto_53718 - LOCATION
      ?auto_53720 - LOCATION
      ?auto_53716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53719 ?auto_53717 ) ( IN-CITY ?auto_53710 ?auto_53717 ) ( not ( = ?auto_53710 ?auto_53719 ) ) ( OBJ-AT ?auto_53711 ?auto_53719 ) ( OBJ-AT ?auto_53715 ?auto_53719 ) ( IN-CITY ?auto_53718 ?auto_53717 ) ( not ( = ?auto_53710 ?auto_53718 ) ) ( OBJ-AT ?auto_53714 ?auto_53718 ) ( OBJ-AT ?auto_53712 ?auto_53719 ) ( IN-CITY ?auto_53720 ?auto_53717 ) ( not ( = ?auto_53710 ?auto_53720 ) ) ( OBJ-AT ?auto_53713 ?auto_53720 ) ( TRUCK-AT ?auto_53716 ?auto_53710 ) ( not ( = ?auto_53713 ?auto_53712 ) ) ( not ( = ?auto_53719 ?auto_53720 ) ) ( not ( = ?auto_53713 ?auto_53714 ) ) ( not ( = ?auto_53712 ?auto_53714 ) ) ( not ( = ?auto_53718 ?auto_53719 ) ) ( not ( = ?auto_53718 ?auto_53720 ) ) ( not ( = ?auto_53713 ?auto_53715 ) ) ( not ( = ?auto_53712 ?auto_53715 ) ) ( not ( = ?auto_53714 ?auto_53715 ) ) ( not ( = ?auto_53713 ?auto_53711 ) ) ( not ( = ?auto_53712 ?auto_53711 ) ) ( not ( = ?auto_53714 ?auto_53711 ) ) ( not ( = ?auto_53715 ?auto_53711 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53713 ?auto_53712 ?auto_53714 ?auto_53711 ?auto_53715 ?auto_53710 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53758 - OBJ
      ?auto_53759 - OBJ
      ?auto_53760 - OBJ
      ?auto_53761 - OBJ
      ?auto_53762 - OBJ
      ?auto_53757 - LOCATION
    )
    :vars
    (
      ?auto_53766 - LOCATION
      ?auto_53764 - CITY
      ?auto_53765 - LOCATION
      ?auto_53767 - LOCATION
      ?auto_53763 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53766 ?auto_53764 ) ( IN-CITY ?auto_53757 ?auto_53764 ) ( not ( = ?auto_53757 ?auto_53766 ) ) ( OBJ-AT ?auto_53758 ?auto_53766 ) ( OBJ-AT ?auto_53761 ?auto_53766 ) ( IN-CITY ?auto_53765 ?auto_53764 ) ( not ( = ?auto_53757 ?auto_53765 ) ) ( OBJ-AT ?auto_53762 ?auto_53765 ) ( OBJ-AT ?auto_53759 ?auto_53766 ) ( IN-CITY ?auto_53767 ?auto_53764 ) ( not ( = ?auto_53757 ?auto_53767 ) ) ( OBJ-AT ?auto_53760 ?auto_53767 ) ( TRUCK-AT ?auto_53763 ?auto_53757 ) ( not ( = ?auto_53760 ?auto_53759 ) ) ( not ( = ?auto_53766 ?auto_53767 ) ) ( not ( = ?auto_53760 ?auto_53762 ) ) ( not ( = ?auto_53759 ?auto_53762 ) ) ( not ( = ?auto_53765 ?auto_53766 ) ) ( not ( = ?auto_53765 ?auto_53767 ) ) ( not ( = ?auto_53760 ?auto_53761 ) ) ( not ( = ?auto_53759 ?auto_53761 ) ) ( not ( = ?auto_53762 ?auto_53761 ) ) ( not ( = ?auto_53760 ?auto_53758 ) ) ( not ( = ?auto_53759 ?auto_53758 ) ) ( not ( = ?auto_53762 ?auto_53758 ) ) ( not ( = ?auto_53761 ?auto_53758 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53760 ?auto_53759 ?auto_53762 ?auto_53758 ?auto_53761 ?auto_53757 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54215 - OBJ
      ?auto_54216 - OBJ
      ?auto_54217 - OBJ
      ?auto_54218 - OBJ
      ?auto_54219 - OBJ
      ?auto_54214 - LOCATION
    )
    :vars
    (
      ?auto_54223 - LOCATION
      ?auto_54221 - CITY
      ?auto_54222 - LOCATION
      ?auto_54224 - LOCATION
      ?auto_54220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54223 ?auto_54221 ) ( IN-CITY ?auto_54214 ?auto_54221 ) ( not ( = ?auto_54214 ?auto_54223 ) ) ( OBJ-AT ?auto_54215 ?auto_54223 ) ( OBJ-AT ?auto_54219 ?auto_54223 ) ( IN-CITY ?auto_54222 ?auto_54221 ) ( not ( = ?auto_54214 ?auto_54222 ) ) ( OBJ-AT ?auto_54217 ?auto_54222 ) ( OBJ-AT ?auto_54216 ?auto_54223 ) ( IN-CITY ?auto_54224 ?auto_54221 ) ( not ( = ?auto_54214 ?auto_54224 ) ) ( OBJ-AT ?auto_54218 ?auto_54224 ) ( TRUCK-AT ?auto_54220 ?auto_54214 ) ( not ( = ?auto_54218 ?auto_54216 ) ) ( not ( = ?auto_54223 ?auto_54224 ) ) ( not ( = ?auto_54218 ?auto_54217 ) ) ( not ( = ?auto_54216 ?auto_54217 ) ) ( not ( = ?auto_54222 ?auto_54223 ) ) ( not ( = ?auto_54222 ?auto_54224 ) ) ( not ( = ?auto_54218 ?auto_54219 ) ) ( not ( = ?auto_54216 ?auto_54219 ) ) ( not ( = ?auto_54217 ?auto_54219 ) ) ( not ( = ?auto_54218 ?auto_54215 ) ) ( not ( = ?auto_54216 ?auto_54215 ) ) ( not ( = ?auto_54217 ?auto_54215 ) ) ( not ( = ?auto_54219 ?auto_54215 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54218 ?auto_54216 ?auto_54217 ?auto_54215 ?auto_54219 ?auto_54214 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54364 - OBJ
      ?auto_54365 - OBJ
      ?auto_54366 - OBJ
      ?auto_54367 - OBJ
      ?auto_54368 - OBJ
      ?auto_54363 - LOCATION
    )
    :vars
    (
      ?auto_54372 - LOCATION
      ?auto_54370 - CITY
      ?auto_54371 - LOCATION
      ?auto_54373 - LOCATION
      ?auto_54369 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54372 ?auto_54370 ) ( IN-CITY ?auto_54363 ?auto_54370 ) ( not ( = ?auto_54363 ?auto_54372 ) ) ( OBJ-AT ?auto_54364 ?auto_54372 ) ( OBJ-AT ?auto_54367 ?auto_54372 ) ( IN-CITY ?auto_54371 ?auto_54370 ) ( not ( = ?auto_54363 ?auto_54371 ) ) ( OBJ-AT ?auto_54366 ?auto_54371 ) ( OBJ-AT ?auto_54365 ?auto_54372 ) ( IN-CITY ?auto_54373 ?auto_54370 ) ( not ( = ?auto_54363 ?auto_54373 ) ) ( OBJ-AT ?auto_54368 ?auto_54373 ) ( TRUCK-AT ?auto_54369 ?auto_54363 ) ( not ( = ?auto_54368 ?auto_54365 ) ) ( not ( = ?auto_54372 ?auto_54373 ) ) ( not ( = ?auto_54368 ?auto_54366 ) ) ( not ( = ?auto_54365 ?auto_54366 ) ) ( not ( = ?auto_54371 ?auto_54372 ) ) ( not ( = ?auto_54371 ?auto_54373 ) ) ( not ( = ?auto_54368 ?auto_54367 ) ) ( not ( = ?auto_54365 ?auto_54367 ) ) ( not ( = ?auto_54366 ?auto_54367 ) ) ( not ( = ?auto_54368 ?auto_54364 ) ) ( not ( = ?auto_54365 ?auto_54364 ) ) ( not ( = ?auto_54366 ?auto_54364 ) ) ( not ( = ?auto_54367 ?auto_54364 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54368 ?auto_54365 ?auto_54366 ?auto_54364 ?auto_54367 ?auto_54363 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54510 - OBJ
      ?auto_54511 - OBJ
      ?auto_54512 - OBJ
      ?auto_54513 - OBJ
      ?auto_54514 - OBJ
      ?auto_54509 - LOCATION
    )
    :vars
    (
      ?auto_54518 - LOCATION
      ?auto_54516 - CITY
      ?auto_54517 - LOCATION
      ?auto_54519 - LOCATION
      ?auto_54515 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54518 ?auto_54516 ) ( IN-CITY ?auto_54509 ?auto_54516 ) ( not ( = ?auto_54509 ?auto_54518 ) ) ( OBJ-AT ?auto_54510 ?auto_54518 ) ( OBJ-AT ?auto_54512 ?auto_54518 ) ( IN-CITY ?auto_54517 ?auto_54516 ) ( not ( = ?auto_54509 ?auto_54517 ) ) ( OBJ-AT ?auto_54514 ?auto_54517 ) ( OBJ-AT ?auto_54511 ?auto_54518 ) ( IN-CITY ?auto_54519 ?auto_54516 ) ( not ( = ?auto_54509 ?auto_54519 ) ) ( OBJ-AT ?auto_54513 ?auto_54519 ) ( TRUCK-AT ?auto_54515 ?auto_54509 ) ( not ( = ?auto_54513 ?auto_54511 ) ) ( not ( = ?auto_54518 ?auto_54519 ) ) ( not ( = ?auto_54513 ?auto_54514 ) ) ( not ( = ?auto_54511 ?auto_54514 ) ) ( not ( = ?auto_54517 ?auto_54518 ) ) ( not ( = ?auto_54517 ?auto_54519 ) ) ( not ( = ?auto_54513 ?auto_54512 ) ) ( not ( = ?auto_54511 ?auto_54512 ) ) ( not ( = ?auto_54514 ?auto_54512 ) ) ( not ( = ?auto_54513 ?auto_54510 ) ) ( not ( = ?auto_54511 ?auto_54510 ) ) ( not ( = ?auto_54514 ?auto_54510 ) ) ( not ( = ?auto_54512 ?auto_54510 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54513 ?auto_54511 ?auto_54514 ?auto_54510 ?auto_54512 ?auto_54509 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54608 - OBJ
      ?auto_54609 - OBJ
      ?auto_54610 - OBJ
      ?auto_54611 - OBJ
      ?auto_54612 - OBJ
      ?auto_54607 - LOCATION
    )
    :vars
    (
      ?auto_54616 - LOCATION
      ?auto_54614 - CITY
      ?auto_54615 - LOCATION
      ?auto_54617 - LOCATION
      ?auto_54613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54616 ?auto_54614 ) ( IN-CITY ?auto_54607 ?auto_54614 ) ( not ( = ?auto_54607 ?auto_54616 ) ) ( OBJ-AT ?auto_54608 ?auto_54616 ) ( OBJ-AT ?auto_54610 ?auto_54616 ) ( IN-CITY ?auto_54615 ?auto_54614 ) ( not ( = ?auto_54607 ?auto_54615 ) ) ( OBJ-AT ?auto_54611 ?auto_54615 ) ( OBJ-AT ?auto_54609 ?auto_54616 ) ( IN-CITY ?auto_54617 ?auto_54614 ) ( not ( = ?auto_54607 ?auto_54617 ) ) ( OBJ-AT ?auto_54612 ?auto_54617 ) ( TRUCK-AT ?auto_54613 ?auto_54607 ) ( not ( = ?auto_54612 ?auto_54609 ) ) ( not ( = ?auto_54616 ?auto_54617 ) ) ( not ( = ?auto_54612 ?auto_54611 ) ) ( not ( = ?auto_54609 ?auto_54611 ) ) ( not ( = ?auto_54615 ?auto_54616 ) ) ( not ( = ?auto_54615 ?auto_54617 ) ) ( not ( = ?auto_54612 ?auto_54610 ) ) ( not ( = ?auto_54609 ?auto_54610 ) ) ( not ( = ?auto_54611 ?auto_54610 ) ) ( not ( = ?auto_54612 ?auto_54608 ) ) ( not ( = ?auto_54609 ?auto_54608 ) ) ( not ( = ?auto_54611 ?auto_54608 ) ) ( not ( = ?auto_54610 ?auto_54608 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54612 ?auto_54609 ?auto_54611 ?auto_54608 ?auto_54610 ?auto_54607 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_55215 - OBJ
      ?auto_55216 - OBJ
      ?auto_55217 - OBJ
      ?auto_55218 - OBJ
      ?auto_55219 - OBJ
      ?auto_55214 - LOCATION
    )
    :vars
    (
      ?auto_55223 - LOCATION
      ?auto_55221 - CITY
      ?auto_55222 - LOCATION
      ?auto_55224 - LOCATION
      ?auto_55220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55223 ?auto_55221 ) ( IN-CITY ?auto_55214 ?auto_55221 ) ( not ( = ?auto_55214 ?auto_55223 ) ) ( OBJ-AT ?auto_55215 ?auto_55223 ) ( OBJ-AT ?auto_55219 ?auto_55223 ) ( IN-CITY ?auto_55222 ?auto_55221 ) ( not ( = ?auto_55214 ?auto_55222 ) ) ( OBJ-AT ?auto_55216 ?auto_55222 ) ( OBJ-AT ?auto_55218 ?auto_55223 ) ( IN-CITY ?auto_55224 ?auto_55221 ) ( not ( = ?auto_55214 ?auto_55224 ) ) ( OBJ-AT ?auto_55217 ?auto_55224 ) ( TRUCK-AT ?auto_55220 ?auto_55214 ) ( not ( = ?auto_55217 ?auto_55218 ) ) ( not ( = ?auto_55223 ?auto_55224 ) ) ( not ( = ?auto_55217 ?auto_55216 ) ) ( not ( = ?auto_55218 ?auto_55216 ) ) ( not ( = ?auto_55222 ?auto_55223 ) ) ( not ( = ?auto_55222 ?auto_55224 ) ) ( not ( = ?auto_55217 ?auto_55219 ) ) ( not ( = ?auto_55218 ?auto_55219 ) ) ( not ( = ?auto_55216 ?auto_55219 ) ) ( not ( = ?auto_55217 ?auto_55215 ) ) ( not ( = ?auto_55218 ?auto_55215 ) ) ( not ( = ?auto_55216 ?auto_55215 ) ) ( not ( = ?auto_55219 ?auto_55215 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_55217 ?auto_55218 ?auto_55216 ?auto_55215 ?auto_55219 ?auto_55214 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_55313 - OBJ
      ?auto_55314 - OBJ
      ?auto_55315 - OBJ
      ?auto_55316 - OBJ
      ?auto_55317 - OBJ
      ?auto_55312 - LOCATION
    )
    :vars
    (
      ?auto_55321 - LOCATION
      ?auto_55319 - CITY
      ?auto_55320 - LOCATION
      ?auto_55322 - LOCATION
      ?auto_55318 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55321 ?auto_55319 ) ( IN-CITY ?auto_55312 ?auto_55319 ) ( not ( = ?auto_55312 ?auto_55321 ) ) ( OBJ-AT ?auto_55313 ?auto_55321 ) ( OBJ-AT ?auto_55316 ?auto_55321 ) ( IN-CITY ?auto_55320 ?auto_55319 ) ( not ( = ?auto_55312 ?auto_55320 ) ) ( OBJ-AT ?auto_55314 ?auto_55320 ) ( OBJ-AT ?auto_55317 ?auto_55321 ) ( IN-CITY ?auto_55322 ?auto_55319 ) ( not ( = ?auto_55312 ?auto_55322 ) ) ( OBJ-AT ?auto_55315 ?auto_55322 ) ( TRUCK-AT ?auto_55318 ?auto_55312 ) ( not ( = ?auto_55315 ?auto_55317 ) ) ( not ( = ?auto_55321 ?auto_55322 ) ) ( not ( = ?auto_55315 ?auto_55314 ) ) ( not ( = ?auto_55317 ?auto_55314 ) ) ( not ( = ?auto_55320 ?auto_55321 ) ) ( not ( = ?auto_55320 ?auto_55322 ) ) ( not ( = ?auto_55315 ?auto_55316 ) ) ( not ( = ?auto_55317 ?auto_55316 ) ) ( not ( = ?auto_55314 ?auto_55316 ) ) ( not ( = ?auto_55315 ?auto_55313 ) ) ( not ( = ?auto_55317 ?auto_55313 ) ) ( not ( = ?auto_55314 ?auto_55313 ) ) ( not ( = ?auto_55316 ?auto_55313 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_55315 ?auto_55317 ?auto_55314 ?auto_55313 ?auto_55316 ?auto_55312 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_55459 - OBJ
      ?auto_55460 - OBJ
      ?auto_55461 - OBJ
      ?auto_55462 - OBJ
      ?auto_55463 - OBJ
      ?auto_55458 - LOCATION
    )
    :vars
    (
      ?auto_55467 - LOCATION
      ?auto_55465 - CITY
      ?auto_55466 - LOCATION
      ?auto_55468 - LOCATION
      ?auto_55464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55467 ?auto_55465 ) ( IN-CITY ?auto_55458 ?auto_55465 ) ( not ( = ?auto_55458 ?auto_55467 ) ) ( OBJ-AT ?auto_55459 ?auto_55467 ) ( OBJ-AT ?auto_55463 ?auto_55467 ) ( IN-CITY ?auto_55466 ?auto_55465 ) ( not ( = ?auto_55458 ?auto_55466 ) ) ( OBJ-AT ?auto_55460 ?auto_55466 ) ( OBJ-AT ?auto_55461 ?auto_55467 ) ( IN-CITY ?auto_55468 ?auto_55465 ) ( not ( = ?auto_55458 ?auto_55468 ) ) ( OBJ-AT ?auto_55462 ?auto_55468 ) ( TRUCK-AT ?auto_55464 ?auto_55458 ) ( not ( = ?auto_55462 ?auto_55461 ) ) ( not ( = ?auto_55467 ?auto_55468 ) ) ( not ( = ?auto_55462 ?auto_55460 ) ) ( not ( = ?auto_55461 ?auto_55460 ) ) ( not ( = ?auto_55466 ?auto_55467 ) ) ( not ( = ?auto_55466 ?auto_55468 ) ) ( not ( = ?auto_55462 ?auto_55463 ) ) ( not ( = ?auto_55461 ?auto_55463 ) ) ( not ( = ?auto_55460 ?auto_55463 ) ) ( not ( = ?auto_55462 ?auto_55459 ) ) ( not ( = ?auto_55461 ?auto_55459 ) ) ( not ( = ?auto_55460 ?auto_55459 ) ) ( not ( = ?auto_55463 ?auto_55459 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_55462 ?auto_55461 ?auto_55460 ?auto_55459 ?auto_55463 ?auto_55458 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_55608 - OBJ
      ?auto_55609 - OBJ
      ?auto_55610 - OBJ
      ?auto_55611 - OBJ
      ?auto_55612 - OBJ
      ?auto_55607 - LOCATION
    )
    :vars
    (
      ?auto_55616 - LOCATION
      ?auto_55614 - CITY
      ?auto_55615 - LOCATION
      ?auto_55617 - LOCATION
      ?auto_55613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55616 ?auto_55614 ) ( IN-CITY ?auto_55607 ?auto_55614 ) ( not ( = ?auto_55607 ?auto_55616 ) ) ( OBJ-AT ?auto_55608 ?auto_55616 ) ( OBJ-AT ?auto_55611 ?auto_55616 ) ( IN-CITY ?auto_55615 ?auto_55614 ) ( not ( = ?auto_55607 ?auto_55615 ) ) ( OBJ-AT ?auto_55609 ?auto_55615 ) ( OBJ-AT ?auto_55610 ?auto_55616 ) ( IN-CITY ?auto_55617 ?auto_55614 ) ( not ( = ?auto_55607 ?auto_55617 ) ) ( OBJ-AT ?auto_55612 ?auto_55617 ) ( TRUCK-AT ?auto_55613 ?auto_55607 ) ( not ( = ?auto_55612 ?auto_55610 ) ) ( not ( = ?auto_55616 ?auto_55617 ) ) ( not ( = ?auto_55612 ?auto_55609 ) ) ( not ( = ?auto_55610 ?auto_55609 ) ) ( not ( = ?auto_55615 ?auto_55616 ) ) ( not ( = ?auto_55615 ?auto_55617 ) ) ( not ( = ?auto_55612 ?auto_55611 ) ) ( not ( = ?auto_55610 ?auto_55611 ) ) ( not ( = ?auto_55609 ?auto_55611 ) ) ( not ( = ?auto_55612 ?auto_55608 ) ) ( not ( = ?auto_55610 ?auto_55608 ) ) ( not ( = ?auto_55609 ?auto_55608 ) ) ( not ( = ?auto_55611 ?auto_55608 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_55612 ?auto_55610 ?auto_55609 ?auto_55608 ?auto_55611 ?auto_55607 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56065 - OBJ
      ?auto_56066 - OBJ
      ?auto_56067 - OBJ
      ?auto_56068 - OBJ
      ?auto_56069 - OBJ
      ?auto_56064 - LOCATION
    )
    :vars
    (
      ?auto_56073 - LOCATION
      ?auto_56071 - CITY
      ?auto_56072 - LOCATION
      ?auto_56074 - LOCATION
      ?auto_56070 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56073 ?auto_56071 ) ( IN-CITY ?auto_56064 ?auto_56071 ) ( not ( = ?auto_56064 ?auto_56073 ) ) ( OBJ-AT ?auto_56065 ?auto_56073 ) ( OBJ-AT ?auto_56067 ?auto_56073 ) ( IN-CITY ?auto_56072 ?auto_56071 ) ( not ( = ?auto_56064 ?auto_56072 ) ) ( OBJ-AT ?auto_56066 ?auto_56072 ) ( OBJ-AT ?auto_56069 ?auto_56073 ) ( IN-CITY ?auto_56074 ?auto_56071 ) ( not ( = ?auto_56064 ?auto_56074 ) ) ( OBJ-AT ?auto_56068 ?auto_56074 ) ( TRUCK-AT ?auto_56070 ?auto_56064 ) ( not ( = ?auto_56068 ?auto_56069 ) ) ( not ( = ?auto_56073 ?auto_56074 ) ) ( not ( = ?auto_56068 ?auto_56066 ) ) ( not ( = ?auto_56069 ?auto_56066 ) ) ( not ( = ?auto_56072 ?auto_56073 ) ) ( not ( = ?auto_56072 ?auto_56074 ) ) ( not ( = ?auto_56068 ?auto_56067 ) ) ( not ( = ?auto_56069 ?auto_56067 ) ) ( not ( = ?auto_56066 ?auto_56067 ) ) ( not ( = ?auto_56068 ?auto_56065 ) ) ( not ( = ?auto_56069 ?auto_56065 ) ) ( not ( = ?auto_56066 ?auto_56065 ) ) ( not ( = ?auto_56067 ?auto_56065 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56068 ?auto_56069 ?auto_56066 ?auto_56065 ?auto_56067 ?auto_56064 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56112 - OBJ
      ?auto_56113 - OBJ
      ?auto_56114 - OBJ
      ?auto_56115 - OBJ
      ?auto_56116 - OBJ
      ?auto_56111 - LOCATION
    )
    :vars
    (
      ?auto_56120 - LOCATION
      ?auto_56118 - CITY
      ?auto_56119 - LOCATION
      ?auto_56121 - LOCATION
      ?auto_56117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56120 ?auto_56118 ) ( IN-CITY ?auto_56111 ?auto_56118 ) ( not ( = ?auto_56111 ?auto_56120 ) ) ( OBJ-AT ?auto_56112 ?auto_56120 ) ( OBJ-AT ?auto_56114 ?auto_56120 ) ( IN-CITY ?auto_56119 ?auto_56118 ) ( not ( = ?auto_56111 ?auto_56119 ) ) ( OBJ-AT ?auto_56113 ?auto_56119 ) ( OBJ-AT ?auto_56115 ?auto_56120 ) ( IN-CITY ?auto_56121 ?auto_56118 ) ( not ( = ?auto_56111 ?auto_56121 ) ) ( OBJ-AT ?auto_56116 ?auto_56121 ) ( TRUCK-AT ?auto_56117 ?auto_56111 ) ( not ( = ?auto_56116 ?auto_56115 ) ) ( not ( = ?auto_56120 ?auto_56121 ) ) ( not ( = ?auto_56116 ?auto_56113 ) ) ( not ( = ?auto_56115 ?auto_56113 ) ) ( not ( = ?auto_56119 ?auto_56120 ) ) ( not ( = ?auto_56119 ?auto_56121 ) ) ( not ( = ?auto_56116 ?auto_56114 ) ) ( not ( = ?auto_56115 ?auto_56114 ) ) ( not ( = ?auto_56113 ?auto_56114 ) ) ( not ( = ?auto_56116 ?auto_56112 ) ) ( not ( = ?auto_56115 ?auto_56112 ) ) ( not ( = ?auto_56113 ?auto_56112 ) ) ( not ( = ?auto_56114 ?auto_56112 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56116 ?auto_56115 ?auto_56113 ?auto_56112 ?auto_56114 ?auto_56111 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56770 - OBJ
      ?auto_56771 - OBJ
      ?auto_56772 - OBJ
      ?auto_56773 - OBJ
      ?auto_56774 - OBJ
      ?auto_56769 - LOCATION
    )
    :vars
    (
      ?auto_56778 - LOCATION
      ?auto_56776 - CITY
      ?auto_56777 - LOCATION
      ?auto_56779 - LOCATION
      ?auto_56775 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56778 ?auto_56776 ) ( IN-CITY ?auto_56769 ?auto_56776 ) ( not ( = ?auto_56769 ?auto_56778 ) ) ( OBJ-AT ?auto_56770 ?auto_56778 ) ( OBJ-AT ?auto_56771 ?auto_56778 ) ( IN-CITY ?auto_56777 ?auto_56776 ) ( not ( = ?auto_56769 ?auto_56777 ) ) ( OBJ-AT ?auto_56774 ?auto_56777 ) ( OBJ-AT ?auto_56773 ?auto_56778 ) ( IN-CITY ?auto_56779 ?auto_56776 ) ( not ( = ?auto_56769 ?auto_56779 ) ) ( OBJ-AT ?auto_56772 ?auto_56779 ) ( TRUCK-AT ?auto_56775 ?auto_56769 ) ( not ( = ?auto_56772 ?auto_56773 ) ) ( not ( = ?auto_56778 ?auto_56779 ) ) ( not ( = ?auto_56772 ?auto_56774 ) ) ( not ( = ?auto_56773 ?auto_56774 ) ) ( not ( = ?auto_56777 ?auto_56778 ) ) ( not ( = ?auto_56777 ?auto_56779 ) ) ( not ( = ?auto_56772 ?auto_56771 ) ) ( not ( = ?auto_56773 ?auto_56771 ) ) ( not ( = ?auto_56774 ?auto_56771 ) ) ( not ( = ?auto_56772 ?auto_56770 ) ) ( not ( = ?auto_56773 ?auto_56770 ) ) ( not ( = ?auto_56774 ?auto_56770 ) ) ( not ( = ?auto_56771 ?auto_56770 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56772 ?auto_56773 ?auto_56774 ?auto_56770 ?auto_56771 ?auto_56769 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56817 - OBJ
      ?auto_56818 - OBJ
      ?auto_56819 - OBJ
      ?auto_56820 - OBJ
      ?auto_56821 - OBJ
      ?auto_56816 - LOCATION
    )
    :vars
    (
      ?auto_56825 - LOCATION
      ?auto_56823 - CITY
      ?auto_56824 - LOCATION
      ?auto_56826 - LOCATION
      ?auto_56822 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56825 ?auto_56823 ) ( IN-CITY ?auto_56816 ?auto_56823 ) ( not ( = ?auto_56816 ?auto_56825 ) ) ( OBJ-AT ?auto_56817 ?auto_56825 ) ( OBJ-AT ?auto_56818 ?auto_56825 ) ( IN-CITY ?auto_56824 ?auto_56823 ) ( not ( = ?auto_56816 ?auto_56824 ) ) ( OBJ-AT ?auto_56820 ?auto_56824 ) ( OBJ-AT ?auto_56821 ?auto_56825 ) ( IN-CITY ?auto_56826 ?auto_56823 ) ( not ( = ?auto_56816 ?auto_56826 ) ) ( OBJ-AT ?auto_56819 ?auto_56826 ) ( TRUCK-AT ?auto_56822 ?auto_56816 ) ( not ( = ?auto_56819 ?auto_56821 ) ) ( not ( = ?auto_56825 ?auto_56826 ) ) ( not ( = ?auto_56819 ?auto_56820 ) ) ( not ( = ?auto_56821 ?auto_56820 ) ) ( not ( = ?auto_56824 ?auto_56825 ) ) ( not ( = ?auto_56824 ?auto_56826 ) ) ( not ( = ?auto_56819 ?auto_56818 ) ) ( not ( = ?auto_56821 ?auto_56818 ) ) ( not ( = ?auto_56820 ?auto_56818 ) ) ( not ( = ?auto_56819 ?auto_56817 ) ) ( not ( = ?auto_56821 ?auto_56817 ) ) ( not ( = ?auto_56820 ?auto_56817 ) ) ( not ( = ?auto_56818 ?auto_56817 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56819 ?auto_56821 ?auto_56820 ?auto_56817 ?auto_56818 ?auto_56816 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_57014 - OBJ
      ?auto_57015 - OBJ
      ?auto_57016 - OBJ
      ?auto_57017 - OBJ
      ?auto_57018 - OBJ
      ?auto_57013 - LOCATION
    )
    :vars
    (
      ?auto_57022 - LOCATION
      ?auto_57020 - CITY
      ?auto_57021 - LOCATION
      ?auto_57023 - LOCATION
      ?auto_57019 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_57022 ?auto_57020 ) ( IN-CITY ?auto_57013 ?auto_57020 ) ( not ( = ?auto_57013 ?auto_57022 ) ) ( OBJ-AT ?auto_57014 ?auto_57022 ) ( OBJ-AT ?auto_57015 ?auto_57022 ) ( IN-CITY ?auto_57021 ?auto_57020 ) ( not ( = ?auto_57013 ?auto_57021 ) ) ( OBJ-AT ?auto_57018 ?auto_57021 ) ( OBJ-AT ?auto_57016 ?auto_57022 ) ( IN-CITY ?auto_57023 ?auto_57020 ) ( not ( = ?auto_57013 ?auto_57023 ) ) ( OBJ-AT ?auto_57017 ?auto_57023 ) ( TRUCK-AT ?auto_57019 ?auto_57013 ) ( not ( = ?auto_57017 ?auto_57016 ) ) ( not ( = ?auto_57022 ?auto_57023 ) ) ( not ( = ?auto_57017 ?auto_57018 ) ) ( not ( = ?auto_57016 ?auto_57018 ) ) ( not ( = ?auto_57021 ?auto_57022 ) ) ( not ( = ?auto_57021 ?auto_57023 ) ) ( not ( = ?auto_57017 ?auto_57015 ) ) ( not ( = ?auto_57016 ?auto_57015 ) ) ( not ( = ?auto_57018 ?auto_57015 ) ) ( not ( = ?auto_57017 ?auto_57014 ) ) ( not ( = ?auto_57016 ?auto_57014 ) ) ( not ( = ?auto_57018 ?auto_57014 ) ) ( not ( = ?auto_57015 ?auto_57014 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_57017 ?auto_57016 ?auto_57018 ?auto_57014 ?auto_57015 ?auto_57013 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_57112 - OBJ
      ?auto_57113 - OBJ
      ?auto_57114 - OBJ
      ?auto_57115 - OBJ
      ?auto_57116 - OBJ
      ?auto_57111 - LOCATION
    )
    :vars
    (
      ?auto_57120 - LOCATION
      ?auto_57118 - CITY
      ?auto_57119 - LOCATION
      ?auto_57121 - LOCATION
      ?auto_57117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_57120 ?auto_57118 ) ( IN-CITY ?auto_57111 ?auto_57118 ) ( not ( = ?auto_57111 ?auto_57120 ) ) ( OBJ-AT ?auto_57112 ?auto_57120 ) ( OBJ-AT ?auto_57113 ?auto_57120 ) ( IN-CITY ?auto_57119 ?auto_57118 ) ( not ( = ?auto_57111 ?auto_57119 ) ) ( OBJ-AT ?auto_57115 ?auto_57119 ) ( OBJ-AT ?auto_57114 ?auto_57120 ) ( IN-CITY ?auto_57121 ?auto_57118 ) ( not ( = ?auto_57111 ?auto_57121 ) ) ( OBJ-AT ?auto_57116 ?auto_57121 ) ( TRUCK-AT ?auto_57117 ?auto_57111 ) ( not ( = ?auto_57116 ?auto_57114 ) ) ( not ( = ?auto_57120 ?auto_57121 ) ) ( not ( = ?auto_57116 ?auto_57115 ) ) ( not ( = ?auto_57114 ?auto_57115 ) ) ( not ( = ?auto_57119 ?auto_57120 ) ) ( not ( = ?auto_57119 ?auto_57121 ) ) ( not ( = ?auto_57116 ?auto_57113 ) ) ( not ( = ?auto_57114 ?auto_57113 ) ) ( not ( = ?auto_57115 ?auto_57113 ) ) ( not ( = ?auto_57116 ?auto_57112 ) ) ( not ( = ?auto_57114 ?auto_57112 ) ) ( not ( = ?auto_57115 ?auto_57112 ) ) ( not ( = ?auto_57113 ?auto_57112 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_57116 ?auto_57114 ?auto_57115 ?auto_57112 ?auto_57113 ?auto_57111 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_57309 - OBJ
      ?auto_57310 - OBJ
      ?auto_57311 - OBJ
      ?auto_57312 - OBJ
      ?auto_57313 - OBJ
      ?auto_57308 - LOCATION
    )
    :vars
    (
      ?auto_57317 - LOCATION
      ?auto_57315 - CITY
      ?auto_57316 - LOCATION
      ?auto_57318 - LOCATION
      ?auto_57314 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_57317 ?auto_57315 ) ( IN-CITY ?auto_57308 ?auto_57315 ) ( not ( = ?auto_57308 ?auto_57317 ) ) ( OBJ-AT ?auto_57309 ?auto_57317 ) ( OBJ-AT ?auto_57310 ?auto_57317 ) ( IN-CITY ?auto_57316 ?auto_57315 ) ( not ( = ?auto_57308 ?auto_57316 ) ) ( OBJ-AT ?auto_57311 ?auto_57316 ) ( OBJ-AT ?auto_57313 ?auto_57317 ) ( IN-CITY ?auto_57318 ?auto_57315 ) ( not ( = ?auto_57308 ?auto_57318 ) ) ( OBJ-AT ?auto_57312 ?auto_57318 ) ( TRUCK-AT ?auto_57314 ?auto_57308 ) ( not ( = ?auto_57312 ?auto_57313 ) ) ( not ( = ?auto_57317 ?auto_57318 ) ) ( not ( = ?auto_57312 ?auto_57311 ) ) ( not ( = ?auto_57313 ?auto_57311 ) ) ( not ( = ?auto_57316 ?auto_57317 ) ) ( not ( = ?auto_57316 ?auto_57318 ) ) ( not ( = ?auto_57312 ?auto_57310 ) ) ( not ( = ?auto_57313 ?auto_57310 ) ) ( not ( = ?auto_57311 ?auto_57310 ) ) ( not ( = ?auto_57312 ?auto_57309 ) ) ( not ( = ?auto_57313 ?auto_57309 ) ) ( not ( = ?auto_57311 ?auto_57309 ) ) ( not ( = ?auto_57310 ?auto_57309 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_57312 ?auto_57313 ?auto_57311 ?auto_57309 ?auto_57310 ?auto_57308 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_57356 - OBJ
      ?auto_57357 - OBJ
      ?auto_57358 - OBJ
      ?auto_57359 - OBJ
      ?auto_57360 - OBJ
      ?auto_57355 - LOCATION
    )
    :vars
    (
      ?auto_57364 - LOCATION
      ?auto_57362 - CITY
      ?auto_57363 - LOCATION
      ?auto_57365 - LOCATION
      ?auto_57361 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_57364 ?auto_57362 ) ( IN-CITY ?auto_57355 ?auto_57362 ) ( not ( = ?auto_57355 ?auto_57364 ) ) ( OBJ-AT ?auto_57356 ?auto_57364 ) ( OBJ-AT ?auto_57357 ?auto_57364 ) ( IN-CITY ?auto_57363 ?auto_57362 ) ( not ( = ?auto_57355 ?auto_57363 ) ) ( OBJ-AT ?auto_57358 ?auto_57363 ) ( OBJ-AT ?auto_57359 ?auto_57364 ) ( IN-CITY ?auto_57365 ?auto_57362 ) ( not ( = ?auto_57355 ?auto_57365 ) ) ( OBJ-AT ?auto_57360 ?auto_57365 ) ( TRUCK-AT ?auto_57361 ?auto_57355 ) ( not ( = ?auto_57360 ?auto_57359 ) ) ( not ( = ?auto_57364 ?auto_57365 ) ) ( not ( = ?auto_57360 ?auto_57358 ) ) ( not ( = ?auto_57359 ?auto_57358 ) ) ( not ( = ?auto_57363 ?auto_57364 ) ) ( not ( = ?auto_57363 ?auto_57365 ) ) ( not ( = ?auto_57360 ?auto_57357 ) ) ( not ( = ?auto_57359 ?auto_57357 ) ) ( not ( = ?auto_57358 ?auto_57357 ) ) ( not ( = ?auto_57360 ?auto_57356 ) ) ( not ( = ?auto_57359 ?auto_57356 ) ) ( not ( = ?auto_57358 ?auto_57356 ) ) ( not ( = ?auto_57357 ?auto_57356 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_57360 ?auto_57359 ?auto_57358 ?auto_57356 ?auto_57357 ?auto_57355 ) )
  )

)

