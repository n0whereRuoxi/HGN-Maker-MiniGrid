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
      ?auto_1600 - OBJ
      ?auto_1599 - LOCATION
    )
    :vars
    (
      ?auto_1602 - LOCATION
      ?auto_1603 - CITY
      ?auto_1601 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1602 ?auto_1603 ) ( IN-CITY ?auto_1599 ?auto_1603 ) ( not ( = ?auto_1599 ?auto_1602 ) ) ( OBJ-AT ?auto_1600 ?auto_1602 ) ( TRUCK-AT ?auto_1601 ?auto_1599 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1601 ?auto_1599 ?auto_1602 ?auto_1603 )
      ( !LOAD-TRUCK ?auto_1600 ?auto_1601 ?auto_1602 )
      ( !DRIVE-TRUCK ?auto_1601 ?auto_1602 ?auto_1599 ?auto_1603 )
      ( !UNLOAD-TRUCK ?auto_1600 ?auto_1601 ?auto_1599 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1621 - OBJ
      ?auto_1622 - OBJ
      ?auto_1620 - LOCATION
    )
    :vars
    (
      ?auto_1623 - LOCATION
      ?auto_1624 - CITY
      ?auto_1626 - LOCATION
      ?auto_1625 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1623 ?auto_1624 ) ( IN-CITY ?auto_1620 ?auto_1624 ) ( not ( = ?auto_1620 ?auto_1623 ) ) ( OBJ-AT ?auto_1622 ?auto_1623 ) ( IN-CITY ?auto_1626 ?auto_1624 ) ( not ( = ?auto_1620 ?auto_1626 ) ) ( OBJ-AT ?auto_1621 ?auto_1626 ) ( TRUCK-AT ?auto_1625 ?auto_1620 ) ( not ( = ?auto_1621 ?auto_1622 ) ) ( not ( = ?auto_1623 ?auto_1626 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1621 ?auto_1620 )
      ( DELIVER-1PKG ?auto_1622 ?auto_1620 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1732 - OBJ
      ?auto_1733 - OBJ
      ?auto_1734 - OBJ
      ?auto_1731 - LOCATION
    )
    :vars
    (
      ?auto_1735 - LOCATION
      ?auto_1737 - CITY
      ?auto_1738 - LOCATION
      ?auto_1739 - LOCATION
      ?auto_1736 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1735 ?auto_1737 ) ( IN-CITY ?auto_1731 ?auto_1737 ) ( not ( = ?auto_1731 ?auto_1735 ) ) ( OBJ-AT ?auto_1734 ?auto_1735 ) ( IN-CITY ?auto_1738 ?auto_1737 ) ( not ( = ?auto_1731 ?auto_1738 ) ) ( OBJ-AT ?auto_1733 ?auto_1738 ) ( IN-CITY ?auto_1739 ?auto_1737 ) ( not ( = ?auto_1731 ?auto_1739 ) ) ( OBJ-AT ?auto_1732 ?auto_1739 ) ( TRUCK-AT ?auto_1736 ?auto_1731 ) ( not ( = ?auto_1732 ?auto_1733 ) ) ( not ( = ?auto_1738 ?auto_1739 ) ) ( not ( = ?auto_1732 ?auto_1734 ) ) ( not ( = ?auto_1733 ?auto_1734 ) ) ( not ( = ?auto_1735 ?auto_1738 ) ) ( not ( = ?auto_1735 ?auto_1739 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1732 ?auto_1733 ?auto_1731 )
      ( DELIVER-1PKG ?auto_1734 ?auto_1731 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2866 - OBJ
      ?auto_2867 - OBJ
      ?auto_2868 - OBJ
      ?auto_2869 - OBJ
      ?auto_2865 - LOCATION
    )
    :vars
    (
      ?auto_2872 - LOCATION
      ?auto_2871 - CITY
      ?auto_2874 - LOCATION
      ?auto_2873 - LOCATION
      ?auto_2870 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2872 ?auto_2871 ) ( IN-CITY ?auto_2865 ?auto_2871 ) ( not ( = ?auto_2865 ?auto_2872 ) ) ( OBJ-AT ?auto_2869 ?auto_2872 ) ( OBJ-AT ?auto_2868 ?auto_2872 ) ( IN-CITY ?auto_2874 ?auto_2871 ) ( not ( = ?auto_2865 ?auto_2874 ) ) ( OBJ-AT ?auto_2867 ?auto_2874 ) ( IN-CITY ?auto_2873 ?auto_2871 ) ( not ( = ?auto_2865 ?auto_2873 ) ) ( OBJ-AT ?auto_2866 ?auto_2873 ) ( TRUCK-AT ?auto_2870 ?auto_2865 ) ( not ( = ?auto_2866 ?auto_2867 ) ) ( not ( = ?auto_2874 ?auto_2873 ) ) ( not ( = ?auto_2866 ?auto_2868 ) ) ( not ( = ?auto_2867 ?auto_2868 ) ) ( not ( = ?auto_2872 ?auto_2874 ) ) ( not ( = ?auto_2872 ?auto_2873 ) ) ( not ( = ?auto_2866 ?auto_2869 ) ) ( not ( = ?auto_2867 ?auto_2869 ) ) ( not ( = ?auto_2868 ?auto_2869 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2866 ?auto_2867 ?auto_2868 ?auto_2865 )
      ( DELIVER-1PKG ?auto_2869 ?auto_2865 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2925 - OBJ
      ?auto_2926 - OBJ
      ?auto_2927 - OBJ
      ?auto_2928 - OBJ
      ?auto_2924 - LOCATION
    )
    :vars
    (
      ?auto_2931 - LOCATION
      ?auto_2930 - CITY
      ?auto_2929 - LOCATION
      ?auto_2933 - LOCATION
      ?auto_2932 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2931 ?auto_2930 ) ( IN-CITY ?auto_2924 ?auto_2930 ) ( not ( = ?auto_2924 ?auto_2931 ) ) ( OBJ-AT ?auto_2928 ?auto_2931 ) ( OBJ-AT ?auto_2926 ?auto_2931 ) ( IN-CITY ?auto_2929 ?auto_2930 ) ( not ( = ?auto_2924 ?auto_2929 ) ) ( OBJ-AT ?auto_2927 ?auto_2929 ) ( IN-CITY ?auto_2933 ?auto_2930 ) ( not ( = ?auto_2924 ?auto_2933 ) ) ( OBJ-AT ?auto_2925 ?auto_2933 ) ( TRUCK-AT ?auto_2932 ?auto_2924 ) ( not ( = ?auto_2925 ?auto_2927 ) ) ( not ( = ?auto_2929 ?auto_2933 ) ) ( not ( = ?auto_2925 ?auto_2926 ) ) ( not ( = ?auto_2927 ?auto_2926 ) ) ( not ( = ?auto_2931 ?auto_2929 ) ) ( not ( = ?auto_2931 ?auto_2933 ) ) ( not ( = ?auto_2925 ?auto_2928 ) ) ( not ( = ?auto_2927 ?auto_2928 ) ) ( not ( = ?auto_2926 ?auto_2928 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2925 ?auto_2927 ?auto_2926 ?auto_2928 ?auto_2924 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2957 - OBJ
      ?auto_2958 - OBJ
      ?auto_2959 - OBJ
      ?auto_2960 - OBJ
      ?auto_2956 - LOCATION
    )
    :vars
    (
      ?auto_2964 - LOCATION
      ?auto_2965 - CITY
      ?auto_2962 - LOCATION
      ?auto_2963 - LOCATION
      ?auto_2961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2964 ?auto_2965 ) ( IN-CITY ?auto_2956 ?auto_2965 ) ( not ( = ?auto_2956 ?auto_2964 ) ) ( OBJ-AT ?auto_2959 ?auto_2964 ) ( OBJ-AT ?auto_2958 ?auto_2964 ) ( IN-CITY ?auto_2962 ?auto_2965 ) ( not ( = ?auto_2956 ?auto_2962 ) ) ( OBJ-AT ?auto_2960 ?auto_2962 ) ( IN-CITY ?auto_2963 ?auto_2965 ) ( not ( = ?auto_2956 ?auto_2963 ) ) ( OBJ-AT ?auto_2957 ?auto_2963 ) ( TRUCK-AT ?auto_2961 ?auto_2956 ) ( not ( = ?auto_2957 ?auto_2960 ) ) ( not ( = ?auto_2962 ?auto_2963 ) ) ( not ( = ?auto_2957 ?auto_2958 ) ) ( not ( = ?auto_2960 ?auto_2958 ) ) ( not ( = ?auto_2964 ?auto_2962 ) ) ( not ( = ?auto_2964 ?auto_2963 ) ) ( not ( = ?auto_2957 ?auto_2959 ) ) ( not ( = ?auto_2960 ?auto_2959 ) ) ( not ( = ?auto_2958 ?auto_2959 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2957 ?auto_2958 ?auto_2960 ?auto_2959 ?auto_2956 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3546 - OBJ
      ?auto_3547 - OBJ
      ?auto_3548 - OBJ
      ?auto_3549 - OBJ
      ?auto_3545 - LOCATION
    )
    :vars
    (
      ?auto_3553 - LOCATION
      ?auto_3554 - CITY
      ?auto_3551 - LOCATION
      ?auto_3552 - LOCATION
      ?auto_3550 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3553 ?auto_3554 ) ( IN-CITY ?auto_3545 ?auto_3554 ) ( not ( = ?auto_3545 ?auto_3553 ) ) ( OBJ-AT ?auto_3549 ?auto_3553 ) ( OBJ-AT ?auto_3546 ?auto_3553 ) ( IN-CITY ?auto_3551 ?auto_3554 ) ( not ( = ?auto_3545 ?auto_3551 ) ) ( OBJ-AT ?auto_3548 ?auto_3551 ) ( IN-CITY ?auto_3552 ?auto_3554 ) ( not ( = ?auto_3545 ?auto_3552 ) ) ( OBJ-AT ?auto_3547 ?auto_3552 ) ( TRUCK-AT ?auto_3550 ?auto_3545 ) ( not ( = ?auto_3547 ?auto_3548 ) ) ( not ( = ?auto_3551 ?auto_3552 ) ) ( not ( = ?auto_3547 ?auto_3546 ) ) ( not ( = ?auto_3548 ?auto_3546 ) ) ( not ( = ?auto_3553 ?auto_3551 ) ) ( not ( = ?auto_3553 ?auto_3552 ) ) ( not ( = ?auto_3547 ?auto_3549 ) ) ( not ( = ?auto_3548 ?auto_3549 ) ) ( not ( = ?auto_3546 ?auto_3549 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3547 ?auto_3546 ?auto_3548 ?auto_3549 ?auto_3545 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3578 - OBJ
      ?auto_3579 - OBJ
      ?auto_3580 - OBJ
      ?auto_3581 - OBJ
      ?auto_3577 - LOCATION
    )
    :vars
    (
      ?auto_3585 - LOCATION
      ?auto_3586 - CITY
      ?auto_3583 - LOCATION
      ?auto_3584 - LOCATION
      ?auto_3582 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3585 ?auto_3586 ) ( IN-CITY ?auto_3577 ?auto_3586 ) ( not ( = ?auto_3577 ?auto_3585 ) ) ( OBJ-AT ?auto_3580 ?auto_3585 ) ( OBJ-AT ?auto_3578 ?auto_3585 ) ( IN-CITY ?auto_3583 ?auto_3586 ) ( not ( = ?auto_3577 ?auto_3583 ) ) ( OBJ-AT ?auto_3581 ?auto_3583 ) ( IN-CITY ?auto_3584 ?auto_3586 ) ( not ( = ?auto_3577 ?auto_3584 ) ) ( OBJ-AT ?auto_3579 ?auto_3584 ) ( TRUCK-AT ?auto_3582 ?auto_3577 ) ( not ( = ?auto_3579 ?auto_3581 ) ) ( not ( = ?auto_3583 ?auto_3584 ) ) ( not ( = ?auto_3579 ?auto_3578 ) ) ( not ( = ?auto_3581 ?auto_3578 ) ) ( not ( = ?auto_3585 ?auto_3583 ) ) ( not ( = ?auto_3585 ?auto_3584 ) ) ( not ( = ?auto_3579 ?auto_3580 ) ) ( not ( = ?auto_3581 ?auto_3580 ) ) ( not ( = ?auto_3578 ?auto_3580 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3579 ?auto_3578 ?auto_3581 ?auto_3580 ?auto_3577 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3766 - OBJ
      ?auto_3767 - OBJ
      ?auto_3768 - OBJ
      ?auto_3769 - OBJ
      ?auto_3765 - LOCATION
    )
    :vars
    (
      ?auto_3773 - LOCATION
      ?auto_3774 - CITY
      ?auto_3771 - LOCATION
      ?auto_3772 - LOCATION
      ?auto_3770 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3773 ?auto_3774 ) ( IN-CITY ?auto_3765 ?auto_3774 ) ( not ( = ?auto_3765 ?auto_3773 ) ) ( OBJ-AT ?auto_3767 ?auto_3773 ) ( OBJ-AT ?auto_3766 ?auto_3773 ) ( IN-CITY ?auto_3771 ?auto_3774 ) ( not ( = ?auto_3765 ?auto_3771 ) ) ( OBJ-AT ?auto_3769 ?auto_3771 ) ( IN-CITY ?auto_3772 ?auto_3774 ) ( not ( = ?auto_3765 ?auto_3772 ) ) ( OBJ-AT ?auto_3768 ?auto_3772 ) ( TRUCK-AT ?auto_3770 ?auto_3765 ) ( not ( = ?auto_3768 ?auto_3769 ) ) ( not ( = ?auto_3771 ?auto_3772 ) ) ( not ( = ?auto_3768 ?auto_3766 ) ) ( not ( = ?auto_3769 ?auto_3766 ) ) ( not ( = ?auto_3773 ?auto_3771 ) ) ( not ( = ?auto_3773 ?auto_3772 ) ) ( not ( = ?auto_3768 ?auto_3767 ) ) ( not ( = ?auto_3769 ?auto_3767 ) ) ( not ( = ?auto_3766 ?auto_3767 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3768 ?auto_3766 ?auto_3769 ?auto_3767 ?auto_3765 ) )
  )

)

