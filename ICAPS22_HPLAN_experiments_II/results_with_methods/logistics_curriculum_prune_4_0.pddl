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
      ?auto_1584 - OBJ
      ?auto_1583 - LOCATION
    )
    :vars
    (
      ?auto_1586 - LOCATION
      ?auto_1587 - CITY
      ?auto_1585 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1586 ?auto_1587 ) ( IN-CITY ?auto_1583 ?auto_1587 ) ( not ( = ?auto_1583 ?auto_1586 ) ) ( OBJ-AT ?auto_1584 ?auto_1586 ) ( TRUCK-AT ?auto_1585 ?auto_1583 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1585 ?auto_1583 ?auto_1586 ?auto_1587 )
      ( !LOAD-TRUCK ?auto_1584 ?auto_1585 ?auto_1586 )
      ( !DRIVE-TRUCK ?auto_1585 ?auto_1586 ?auto_1583 ?auto_1587 )
      ( !UNLOAD-TRUCK ?auto_1584 ?auto_1585 ?auto_1583 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1605 - OBJ
      ?auto_1606 - OBJ
      ?auto_1604 - LOCATION
    )
    :vars
    (
      ?auto_1609 - LOCATION
      ?auto_1608 - CITY
      ?auto_1610 - LOCATION
      ?auto_1607 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1609 ?auto_1608 ) ( IN-CITY ?auto_1604 ?auto_1608 ) ( not ( = ?auto_1604 ?auto_1609 ) ) ( OBJ-AT ?auto_1606 ?auto_1609 ) ( IN-CITY ?auto_1610 ?auto_1608 ) ( not ( = ?auto_1604 ?auto_1610 ) ) ( OBJ-AT ?auto_1605 ?auto_1610 ) ( TRUCK-AT ?auto_1607 ?auto_1604 ) ( not ( = ?auto_1605 ?auto_1606 ) ) ( not ( = ?auto_1609 ?auto_1610 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1605 ?auto_1604 )
      ( DELIVER-1PKG ?auto_1606 ?auto_1604 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1715 - OBJ
      ?auto_1716 - OBJ
      ?auto_1717 - OBJ
      ?auto_1714 - LOCATION
    )
    :vars
    (
      ?auto_1720 - LOCATION
      ?auto_1718 - CITY
      ?auto_1721 - LOCATION
      ?auto_1719 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1720 ?auto_1718 ) ( IN-CITY ?auto_1714 ?auto_1718 ) ( not ( = ?auto_1714 ?auto_1720 ) ) ( OBJ-AT ?auto_1717 ?auto_1720 ) ( OBJ-AT ?auto_1716 ?auto_1720 ) ( IN-CITY ?auto_1721 ?auto_1718 ) ( not ( = ?auto_1714 ?auto_1721 ) ) ( OBJ-AT ?auto_1715 ?auto_1721 ) ( TRUCK-AT ?auto_1719 ?auto_1714 ) ( not ( = ?auto_1715 ?auto_1716 ) ) ( not ( = ?auto_1720 ?auto_1721 ) ) ( not ( = ?auto_1715 ?auto_1717 ) ) ( not ( = ?auto_1716 ?auto_1717 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1715 ?auto_1716 ?auto_1714 )
      ( DELIVER-1PKG ?auto_1717 ?auto_1714 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1745 - OBJ
      ?auto_1746 - OBJ
      ?auto_1747 - OBJ
      ?auto_1744 - LOCATION
    )
    :vars
    (
      ?auto_1748 - LOCATION
      ?auto_1751 - CITY
      ?auto_1750 - LOCATION
      ?auto_1749 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1748 ?auto_1751 ) ( IN-CITY ?auto_1744 ?auto_1751 ) ( not ( = ?auto_1744 ?auto_1748 ) ) ( OBJ-AT ?auto_1747 ?auto_1748 ) ( OBJ-AT ?auto_1745 ?auto_1748 ) ( IN-CITY ?auto_1750 ?auto_1751 ) ( not ( = ?auto_1744 ?auto_1750 ) ) ( OBJ-AT ?auto_1746 ?auto_1750 ) ( TRUCK-AT ?auto_1749 ?auto_1744 ) ( not ( = ?auto_1746 ?auto_1745 ) ) ( not ( = ?auto_1748 ?auto_1750 ) ) ( not ( = ?auto_1746 ?auto_1747 ) ) ( not ( = ?auto_1745 ?auto_1747 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1746 ?auto_1745 ?auto_1747 ?auto_1744 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1762 - OBJ
      ?auto_1763 - OBJ
      ?auto_1764 - OBJ
      ?auto_1761 - LOCATION
    )
    :vars
    (
      ?auto_1768 - LOCATION
      ?auto_1766 - CITY
      ?auto_1767 - LOCATION
      ?auto_1765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1768 ?auto_1766 ) ( IN-CITY ?auto_1761 ?auto_1766 ) ( not ( = ?auto_1761 ?auto_1768 ) ) ( OBJ-AT ?auto_1763 ?auto_1768 ) ( OBJ-AT ?auto_1762 ?auto_1768 ) ( IN-CITY ?auto_1767 ?auto_1766 ) ( not ( = ?auto_1761 ?auto_1767 ) ) ( OBJ-AT ?auto_1764 ?auto_1767 ) ( TRUCK-AT ?auto_1765 ?auto_1761 ) ( not ( = ?auto_1764 ?auto_1762 ) ) ( not ( = ?auto_1768 ?auto_1767 ) ) ( not ( = ?auto_1764 ?auto_1763 ) ) ( not ( = ?auto_1762 ?auto_1763 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1762 ?auto_1764 ?auto_1763 ?auto_1761 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2844 - OBJ
      ?auto_2845 - OBJ
      ?auto_2846 - OBJ
      ?auto_2847 - OBJ
      ?auto_2843 - LOCATION
    )
    :vars
    (
      ?auto_2850 - LOCATION
      ?auto_2849 - CITY
      ?auto_2852 - LOCATION
      ?auto_2851 - LOCATION
      ?auto_2848 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2850 ?auto_2849 ) ( IN-CITY ?auto_2843 ?auto_2849 ) ( not ( = ?auto_2843 ?auto_2850 ) ) ( OBJ-AT ?auto_2847 ?auto_2850 ) ( IN-CITY ?auto_2852 ?auto_2849 ) ( not ( = ?auto_2843 ?auto_2852 ) ) ( OBJ-AT ?auto_2846 ?auto_2852 ) ( OBJ-AT ?auto_2845 ?auto_2852 ) ( IN-CITY ?auto_2851 ?auto_2849 ) ( not ( = ?auto_2843 ?auto_2851 ) ) ( OBJ-AT ?auto_2844 ?auto_2851 ) ( TRUCK-AT ?auto_2848 ?auto_2843 ) ( not ( = ?auto_2844 ?auto_2845 ) ) ( not ( = ?auto_2852 ?auto_2851 ) ) ( not ( = ?auto_2844 ?auto_2846 ) ) ( not ( = ?auto_2845 ?auto_2846 ) ) ( not ( = ?auto_2844 ?auto_2847 ) ) ( not ( = ?auto_2845 ?auto_2847 ) ) ( not ( = ?auto_2846 ?auto_2847 ) ) ( not ( = ?auto_2850 ?auto_2852 ) ) ( not ( = ?auto_2850 ?auto_2851 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2845 ?auto_2844 ?auto_2846 ?auto_2843 )
      ( DELIVER-1PKG ?auto_2847 ?auto_2843 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2876 - OBJ
      ?auto_2877 - OBJ
      ?auto_2878 - OBJ
      ?auto_2879 - OBJ
      ?auto_2875 - LOCATION
    )
    :vars
    (
      ?auto_2884 - LOCATION
      ?auto_2882 - CITY
      ?auto_2883 - LOCATION
      ?auto_2880 - LOCATION
      ?auto_2881 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2884 ?auto_2882 ) ( IN-CITY ?auto_2875 ?auto_2882 ) ( not ( = ?auto_2875 ?auto_2884 ) ) ( OBJ-AT ?auto_2878 ?auto_2884 ) ( IN-CITY ?auto_2883 ?auto_2882 ) ( not ( = ?auto_2875 ?auto_2883 ) ) ( OBJ-AT ?auto_2879 ?auto_2883 ) ( OBJ-AT ?auto_2877 ?auto_2883 ) ( IN-CITY ?auto_2880 ?auto_2882 ) ( not ( = ?auto_2875 ?auto_2880 ) ) ( OBJ-AT ?auto_2876 ?auto_2880 ) ( TRUCK-AT ?auto_2881 ?auto_2875 ) ( not ( = ?auto_2876 ?auto_2877 ) ) ( not ( = ?auto_2883 ?auto_2880 ) ) ( not ( = ?auto_2876 ?auto_2879 ) ) ( not ( = ?auto_2877 ?auto_2879 ) ) ( not ( = ?auto_2876 ?auto_2878 ) ) ( not ( = ?auto_2877 ?auto_2878 ) ) ( not ( = ?auto_2879 ?auto_2878 ) ) ( not ( = ?auto_2884 ?auto_2883 ) ) ( not ( = ?auto_2884 ?auto_2880 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2876 ?auto_2877 ?auto_2879 ?auto_2878 ?auto_2875 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3030 - OBJ
      ?auto_3031 - OBJ
      ?auto_3032 - OBJ
      ?auto_3033 - OBJ
      ?auto_3029 - LOCATION
    )
    :vars
    (
      ?auto_3038 - LOCATION
      ?auto_3035 - CITY
      ?auto_3034 - LOCATION
      ?auto_3037 - LOCATION
      ?auto_3036 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3038 ?auto_3035 ) ( IN-CITY ?auto_3029 ?auto_3035 ) ( not ( = ?auto_3029 ?auto_3038 ) ) ( OBJ-AT ?auto_3031 ?auto_3038 ) ( IN-CITY ?auto_3034 ?auto_3035 ) ( not ( = ?auto_3029 ?auto_3034 ) ) ( OBJ-AT ?auto_3033 ?auto_3034 ) ( OBJ-AT ?auto_3032 ?auto_3034 ) ( IN-CITY ?auto_3037 ?auto_3035 ) ( not ( = ?auto_3029 ?auto_3037 ) ) ( OBJ-AT ?auto_3030 ?auto_3037 ) ( TRUCK-AT ?auto_3036 ?auto_3029 ) ( not ( = ?auto_3030 ?auto_3032 ) ) ( not ( = ?auto_3034 ?auto_3037 ) ) ( not ( = ?auto_3030 ?auto_3033 ) ) ( not ( = ?auto_3032 ?auto_3033 ) ) ( not ( = ?auto_3030 ?auto_3031 ) ) ( not ( = ?auto_3032 ?auto_3031 ) ) ( not ( = ?auto_3033 ?auto_3031 ) ) ( not ( = ?auto_3038 ?auto_3034 ) ) ( not ( = ?auto_3038 ?auto_3037 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3030 ?auto_3032 ?auto_3031 ?auto_3033 ?auto_3029 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3157 - OBJ
      ?auto_3158 - OBJ
      ?auto_3159 - OBJ
      ?auto_3160 - OBJ
      ?auto_3156 - LOCATION
    )
    :vars
    (
      ?auto_3165 - LOCATION
      ?auto_3162 - CITY
      ?auto_3161 - LOCATION
      ?auto_3164 - LOCATION
      ?auto_3163 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3165 ?auto_3162 ) ( IN-CITY ?auto_3156 ?auto_3162 ) ( not ( = ?auto_3156 ?auto_3165 ) ) ( OBJ-AT ?auto_3160 ?auto_3165 ) ( IN-CITY ?auto_3161 ?auto_3162 ) ( not ( = ?auto_3156 ?auto_3161 ) ) ( OBJ-AT ?auto_3159 ?auto_3161 ) ( OBJ-AT ?auto_3157 ?auto_3161 ) ( IN-CITY ?auto_3164 ?auto_3162 ) ( not ( = ?auto_3156 ?auto_3164 ) ) ( OBJ-AT ?auto_3158 ?auto_3164 ) ( TRUCK-AT ?auto_3163 ?auto_3156 ) ( not ( = ?auto_3158 ?auto_3157 ) ) ( not ( = ?auto_3161 ?auto_3164 ) ) ( not ( = ?auto_3158 ?auto_3159 ) ) ( not ( = ?auto_3157 ?auto_3159 ) ) ( not ( = ?auto_3158 ?auto_3160 ) ) ( not ( = ?auto_3157 ?auto_3160 ) ) ( not ( = ?auto_3159 ?auto_3160 ) ) ( not ( = ?auto_3165 ?auto_3161 ) ) ( not ( = ?auto_3165 ?auto_3164 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3158 ?auto_3157 ?auto_3160 ?auto_3159 ?auto_3156 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3189 - OBJ
      ?auto_3190 - OBJ
      ?auto_3191 - OBJ
      ?auto_3192 - OBJ
      ?auto_3188 - LOCATION
    )
    :vars
    (
      ?auto_3197 - LOCATION
      ?auto_3194 - CITY
      ?auto_3193 - LOCATION
      ?auto_3196 - LOCATION
      ?auto_3195 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3197 ?auto_3194 ) ( IN-CITY ?auto_3188 ?auto_3194 ) ( not ( = ?auto_3188 ?auto_3197 ) ) ( OBJ-AT ?auto_3191 ?auto_3197 ) ( IN-CITY ?auto_3193 ?auto_3194 ) ( not ( = ?auto_3188 ?auto_3193 ) ) ( OBJ-AT ?auto_3192 ?auto_3193 ) ( OBJ-AT ?auto_3189 ?auto_3193 ) ( IN-CITY ?auto_3196 ?auto_3194 ) ( not ( = ?auto_3188 ?auto_3196 ) ) ( OBJ-AT ?auto_3190 ?auto_3196 ) ( TRUCK-AT ?auto_3195 ?auto_3188 ) ( not ( = ?auto_3190 ?auto_3189 ) ) ( not ( = ?auto_3193 ?auto_3196 ) ) ( not ( = ?auto_3190 ?auto_3192 ) ) ( not ( = ?auto_3189 ?auto_3192 ) ) ( not ( = ?auto_3190 ?auto_3191 ) ) ( not ( = ?auto_3189 ?auto_3191 ) ) ( not ( = ?auto_3192 ?auto_3191 ) ) ( not ( = ?auto_3197 ?auto_3193 ) ) ( not ( = ?auto_3197 ?auto_3196 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3190 ?auto_3189 ?auto_3191 ?auto_3192 ?auto_3188 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3290 - OBJ
      ?auto_3291 - OBJ
      ?auto_3292 - OBJ
      ?auto_3293 - OBJ
      ?auto_3289 - LOCATION
    )
    :vars
    (
      ?auto_3298 - LOCATION
      ?auto_3295 - CITY
      ?auto_3294 - LOCATION
      ?auto_3297 - LOCATION
      ?auto_3296 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3298 ?auto_3295 ) ( IN-CITY ?auto_3289 ?auto_3295 ) ( not ( = ?auto_3289 ?auto_3298 ) ) ( OBJ-AT ?auto_3293 ?auto_3298 ) ( IN-CITY ?auto_3294 ?auto_3295 ) ( not ( = ?auto_3289 ?auto_3294 ) ) ( OBJ-AT ?auto_3291 ?auto_3294 ) ( OBJ-AT ?auto_3290 ?auto_3294 ) ( IN-CITY ?auto_3297 ?auto_3295 ) ( not ( = ?auto_3289 ?auto_3297 ) ) ( OBJ-AT ?auto_3292 ?auto_3297 ) ( TRUCK-AT ?auto_3296 ?auto_3289 ) ( not ( = ?auto_3292 ?auto_3290 ) ) ( not ( = ?auto_3294 ?auto_3297 ) ) ( not ( = ?auto_3292 ?auto_3291 ) ) ( not ( = ?auto_3290 ?auto_3291 ) ) ( not ( = ?auto_3292 ?auto_3293 ) ) ( not ( = ?auto_3290 ?auto_3293 ) ) ( not ( = ?auto_3291 ?auto_3293 ) ) ( not ( = ?auto_3298 ?auto_3294 ) ) ( not ( = ?auto_3298 ?auto_3297 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3292 ?auto_3290 ?auto_3293 ?auto_3291 ?auto_3289 ) )
  )

)

