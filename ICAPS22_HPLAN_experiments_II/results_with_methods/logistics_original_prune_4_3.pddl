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

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_134498 - OBJ
      ?auto_134497 - LOCATION
    )
    :vars
    (
      ?auto_134499 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134499 ?auto_134497 ) ( IN-TRUCK ?auto_134498 ?auto_134499 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_134498 ?auto_134499 ?auto_134497 )
      ( DELIVER-1PKG-VERIFY ?auto_134498 ?auto_134497 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_134516 - OBJ
      ?auto_134515 - LOCATION
    )
    :vars
    (
      ?auto_134517 - TRUCK
      ?auto_134518 - LOCATION
      ?auto_134519 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134516 ?auto_134517 ) ( TRUCK-AT ?auto_134517 ?auto_134518 ) ( IN-CITY ?auto_134518 ?auto_134519 ) ( IN-CITY ?auto_134515 ?auto_134519 ) ( not ( = ?auto_134515 ?auto_134518 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_134517 ?auto_134518 ?auto_134515 ?auto_134519 )
      ( DELIVER-1PKG ?auto_134516 ?auto_134515 )
      ( DELIVER-1PKG-VERIFY ?auto_134516 ?auto_134515 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_134542 - OBJ
      ?auto_134541 - LOCATION
    )
    :vars
    (
      ?auto_134543 - TRUCK
      ?auto_134544 - LOCATION
      ?auto_134545 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134543 ?auto_134544 ) ( IN-CITY ?auto_134544 ?auto_134545 ) ( IN-CITY ?auto_134541 ?auto_134545 ) ( not ( = ?auto_134541 ?auto_134544 ) ) ( OBJ-AT ?auto_134542 ?auto_134544 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_134542 ?auto_134543 ?auto_134544 )
      ( DELIVER-1PKG ?auto_134542 ?auto_134541 )
      ( DELIVER-1PKG-VERIFY ?auto_134542 ?auto_134541 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_134568 - OBJ
      ?auto_134567 - LOCATION
    )
    :vars
    (
      ?auto_134569 - LOCATION
      ?auto_134570 - CITY
      ?auto_134571 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134569 ?auto_134570 ) ( IN-CITY ?auto_134567 ?auto_134570 ) ( not ( = ?auto_134567 ?auto_134569 ) ) ( OBJ-AT ?auto_134568 ?auto_134569 ) ( TRUCK-AT ?auto_134571 ?auto_134567 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_134571 ?auto_134567 ?auto_134569 ?auto_134570 )
      ( DELIVER-1PKG ?auto_134568 ?auto_134567 )
      ( DELIVER-1PKG-VERIFY ?auto_134568 ?auto_134567 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_134711 - OBJ
      ?auto_134712 - OBJ
      ?auto_134710 - LOCATION
    )
    :vars
    (
      ?auto_134713 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134713 ?auto_134710 ) ( IN-TRUCK ?auto_134712 ?auto_134713 ) ( OBJ-AT ?auto_134711 ?auto_134710 ) ( not ( = ?auto_134711 ?auto_134712 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134712 ?auto_134710 )
      ( DELIVER-2PKG-VERIFY ?auto_134711 ?auto_134712 ?auto_134710 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_134715 - OBJ
      ?auto_134716 - OBJ
      ?auto_134714 - LOCATION
    )
    :vars
    (
      ?auto_134717 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134717 ?auto_134714 ) ( IN-TRUCK ?auto_134715 ?auto_134717 ) ( OBJ-AT ?auto_134716 ?auto_134714 ) ( not ( = ?auto_134715 ?auto_134716 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134715 ?auto_134714 )
      ( DELIVER-2PKG-VERIFY ?auto_134715 ?auto_134716 ?auto_134714 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134723 - OBJ
      ?auto_134724 - OBJ
      ?auto_134725 - OBJ
      ?auto_134722 - LOCATION
    )
    :vars
    (
      ?auto_134726 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134726 ?auto_134722 ) ( IN-TRUCK ?auto_134725 ?auto_134726 ) ( OBJ-AT ?auto_134723 ?auto_134722 ) ( OBJ-AT ?auto_134724 ?auto_134722 ) ( not ( = ?auto_134723 ?auto_134724 ) ) ( not ( = ?auto_134723 ?auto_134725 ) ) ( not ( = ?auto_134724 ?auto_134725 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134725 ?auto_134722 )
      ( DELIVER-3PKG-VERIFY ?auto_134723 ?auto_134724 ?auto_134725 ?auto_134722 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134728 - OBJ
      ?auto_134729 - OBJ
      ?auto_134730 - OBJ
      ?auto_134727 - LOCATION
    )
    :vars
    (
      ?auto_134731 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134731 ?auto_134727 ) ( IN-TRUCK ?auto_134729 ?auto_134731 ) ( OBJ-AT ?auto_134728 ?auto_134727 ) ( OBJ-AT ?auto_134730 ?auto_134727 ) ( not ( = ?auto_134728 ?auto_134729 ) ) ( not ( = ?auto_134728 ?auto_134730 ) ) ( not ( = ?auto_134729 ?auto_134730 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134729 ?auto_134727 )
      ( DELIVER-3PKG-VERIFY ?auto_134728 ?auto_134729 ?auto_134730 ?auto_134727 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134738 - OBJ
      ?auto_134739 - OBJ
      ?auto_134740 - OBJ
      ?auto_134737 - LOCATION
    )
    :vars
    (
      ?auto_134741 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134741 ?auto_134737 ) ( IN-TRUCK ?auto_134738 ?auto_134741 ) ( OBJ-AT ?auto_134739 ?auto_134737 ) ( OBJ-AT ?auto_134740 ?auto_134737 ) ( not ( = ?auto_134738 ?auto_134739 ) ) ( not ( = ?auto_134738 ?auto_134740 ) ) ( not ( = ?auto_134739 ?auto_134740 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134738 ?auto_134737 )
      ( DELIVER-3PKG-VERIFY ?auto_134738 ?auto_134739 ?auto_134740 ?auto_134737 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134758 - OBJ
      ?auto_134759 - OBJ
      ?auto_134760 - OBJ
      ?auto_134761 - OBJ
      ?auto_134757 - LOCATION
    )
    :vars
    (
      ?auto_134762 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134762 ?auto_134757 ) ( IN-TRUCK ?auto_134761 ?auto_134762 ) ( OBJ-AT ?auto_134758 ?auto_134757 ) ( OBJ-AT ?auto_134759 ?auto_134757 ) ( OBJ-AT ?auto_134760 ?auto_134757 ) ( not ( = ?auto_134758 ?auto_134759 ) ) ( not ( = ?auto_134758 ?auto_134760 ) ) ( not ( = ?auto_134758 ?auto_134761 ) ) ( not ( = ?auto_134759 ?auto_134760 ) ) ( not ( = ?auto_134759 ?auto_134761 ) ) ( not ( = ?auto_134760 ?auto_134761 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134761 ?auto_134757 )
      ( DELIVER-4PKG-VERIFY ?auto_134758 ?auto_134759 ?auto_134760 ?auto_134761 ?auto_134757 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134764 - OBJ
      ?auto_134765 - OBJ
      ?auto_134766 - OBJ
      ?auto_134767 - OBJ
      ?auto_134763 - LOCATION
    )
    :vars
    (
      ?auto_134768 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134768 ?auto_134763 ) ( IN-TRUCK ?auto_134766 ?auto_134768 ) ( OBJ-AT ?auto_134764 ?auto_134763 ) ( OBJ-AT ?auto_134765 ?auto_134763 ) ( OBJ-AT ?auto_134767 ?auto_134763 ) ( not ( = ?auto_134764 ?auto_134765 ) ) ( not ( = ?auto_134764 ?auto_134766 ) ) ( not ( = ?auto_134764 ?auto_134767 ) ) ( not ( = ?auto_134765 ?auto_134766 ) ) ( not ( = ?auto_134765 ?auto_134767 ) ) ( not ( = ?auto_134766 ?auto_134767 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134766 ?auto_134763 )
      ( DELIVER-4PKG-VERIFY ?auto_134764 ?auto_134765 ?auto_134766 ?auto_134767 ?auto_134763 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134776 - OBJ
      ?auto_134777 - OBJ
      ?auto_134778 - OBJ
      ?auto_134779 - OBJ
      ?auto_134775 - LOCATION
    )
    :vars
    (
      ?auto_134780 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134780 ?auto_134775 ) ( IN-TRUCK ?auto_134777 ?auto_134780 ) ( OBJ-AT ?auto_134776 ?auto_134775 ) ( OBJ-AT ?auto_134778 ?auto_134775 ) ( OBJ-AT ?auto_134779 ?auto_134775 ) ( not ( = ?auto_134776 ?auto_134777 ) ) ( not ( = ?auto_134776 ?auto_134778 ) ) ( not ( = ?auto_134776 ?auto_134779 ) ) ( not ( = ?auto_134777 ?auto_134778 ) ) ( not ( = ?auto_134777 ?auto_134779 ) ) ( not ( = ?auto_134778 ?auto_134779 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134777 ?auto_134775 )
      ( DELIVER-4PKG-VERIFY ?auto_134776 ?auto_134777 ?auto_134778 ?auto_134779 ?auto_134775 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134800 - OBJ
      ?auto_134801 - OBJ
      ?auto_134802 - OBJ
      ?auto_134803 - OBJ
      ?auto_134799 - LOCATION
    )
    :vars
    (
      ?auto_134804 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_134804 ?auto_134799 ) ( IN-TRUCK ?auto_134800 ?auto_134804 ) ( OBJ-AT ?auto_134801 ?auto_134799 ) ( OBJ-AT ?auto_134802 ?auto_134799 ) ( OBJ-AT ?auto_134803 ?auto_134799 ) ( not ( = ?auto_134800 ?auto_134801 ) ) ( not ( = ?auto_134800 ?auto_134802 ) ) ( not ( = ?auto_134800 ?auto_134803 ) ) ( not ( = ?auto_134801 ?auto_134802 ) ) ( not ( = ?auto_134801 ?auto_134803 ) ) ( not ( = ?auto_134802 ?auto_134803 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134800 ?auto_134799 )
      ( DELIVER-4PKG-VERIFY ?auto_134800 ?auto_134801 ?auto_134802 ?auto_134803 ?auto_134799 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_134853 - OBJ
      ?auto_134854 - OBJ
      ?auto_134852 - LOCATION
    )
    :vars
    (
      ?auto_134856 - TRUCK
      ?auto_134855 - LOCATION
      ?auto_134857 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134854 ?auto_134856 ) ( TRUCK-AT ?auto_134856 ?auto_134855 ) ( IN-CITY ?auto_134855 ?auto_134857 ) ( IN-CITY ?auto_134852 ?auto_134857 ) ( not ( = ?auto_134852 ?auto_134855 ) ) ( OBJ-AT ?auto_134853 ?auto_134852 ) ( not ( = ?auto_134853 ?auto_134854 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_134854 ?auto_134852 )
      ( DELIVER-2PKG-VERIFY ?auto_134853 ?auto_134854 ?auto_134852 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_134859 - OBJ
      ?auto_134860 - OBJ
      ?auto_134858 - LOCATION
    )
    :vars
    (
      ?auto_134863 - TRUCK
      ?auto_134862 - LOCATION
      ?auto_134861 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134859 ?auto_134863 ) ( TRUCK-AT ?auto_134863 ?auto_134862 ) ( IN-CITY ?auto_134862 ?auto_134861 ) ( IN-CITY ?auto_134858 ?auto_134861 ) ( not ( = ?auto_134858 ?auto_134862 ) ) ( OBJ-AT ?auto_134860 ?auto_134858 ) ( not ( = ?auto_134860 ?auto_134859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134860 ?auto_134859 ?auto_134858 )
      ( DELIVER-2PKG-VERIFY ?auto_134859 ?auto_134860 ?auto_134858 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134872 - OBJ
      ?auto_134873 - OBJ
      ?auto_134874 - OBJ
      ?auto_134871 - LOCATION
    )
    :vars
    (
      ?auto_134877 - TRUCK
      ?auto_134876 - LOCATION
      ?auto_134875 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134874 ?auto_134877 ) ( TRUCK-AT ?auto_134877 ?auto_134876 ) ( IN-CITY ?auto_134876 ?auto_134875 ) ( IN-CITY ?auto_134871 ?auto_134875 ) ( not ( = ?auto_134871 ?auto_134876 ) ) ( OBJ-AT ?auto_134872 ?auto_134871 ) ( not ( = ?auto_134872 ?auto_134874 ) ) ( OBJ-AT ?auto_134873 ?auto_134871 ) ( not ( = ?auto_134872 ?auto_134873 ) ) ( not ( = ?auto_134873 ?auto_134874 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134872 ?auto_134874 ?auto_134871 )
      ( DELIVER-3PKG-VERIFY ?auto_134872 ?auto_134873 ?auto_134874 ?auto_134871 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134879 - OBJ
      ?auto_134880 - OBJ
      ?auto_134881 - OBJ
      ?auto_134878 - LOCATION
    )
    :vars
    (
      ?auto_134884 - TRUCK
      ?auto_134883 - LOCATION
      ?auto_134882 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134880 ?auto_134884 ) ( TRUCK-AT ?auto_134884 ?auto_134883 ) ( IN-CITY ?auto_134883 ?auto_134882 ) ( IN-CITY ?auto_134878 ?auto_134882 ) ( not ( = ?auto_134878 ?auto_134883 ) ) ( OBJ-AT ?auto_134881 ?auto_134878 ) ( not ( = ?auto_134881 ?auto_134880 ) ) ( OBJ-AT ?auto_134879 ?auto_134878 ) ( not ( = ?auto_134879 ?auto_134880 ) ) ( not ( = ?auto_134879 ?auto_134881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134881 ?auto_134880 ?auto_134878 )
      ( DELIVER-3PKG-VERIFY ?auto_134879 ?auto_134880 ?auto_134881 ?auto_134878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_134893 - OBJ
      ?auto_134894 - OBJ
      ?auto_134895 - OBJ
      ?auto_134892 - LOCATION
    )
    :vars
    (
      ?auto_134898 - TRUCK
      ?auto_134897 - LOCATION
      ?auto_134896 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134893 ?auto_134898 ) ( TRUCK-AT ?auto_134898 ?auto_134897 ) ( IN-CITY ?auto_134897 ?auto_134896 ) ( IN-CITY ?auto_134892 ?auto_134896 ) ( not ( = ?auto_134892 ?auto_134897 ) ) ( OBJ-AT ?auto_134894 ?auto_134892 ) ( not ( = ?auto_134894 ?auto_134893 ) ) ( OBJ-AT ?auto_134895 ?auto_134892 ) ( not ( = ?auto_134893 ?auto_134895 ) ) ( not ( = ?auto_134894 ?auto_134895 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134894 ?auto_134893 ?auto_134892 )
      ( DELIVER-3PKG-VERIFY ?auto_134893 ?auto_134894 ?auto_134895 ?auto_134892 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134922 - OBJ
      ?auto_134923 - OBJ
      ?auto_134924 - OBJ
      ?auto_134925 - OBJ
      ?auto_134921 - LOCATION
    )
    :vars
    (
      ?auto_134928 - TRUCK
      ?auto_134927 - LOCATION
      ?auto_134926 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134925 ?auto_134928 ) ( TRUCK-AT ?auto_134928 ?auto_134927 ) ( IN-CITY ?auto_134927 ?auto_134926 ) ( IN-CITY ?auto_134921 ?auto_134926 ) ( not ( = ?auto_134921 ?auto_134927 ) ) ( OBJ-AT ?auto_134924 ?auto_134921 ) ( not ( = ?auto_134924 ?auto_134925 ) ) ( OBJ-AT ?auto_134922 ?auto_134921 ) ( OBJ-AT ?auto_134923 ?auto_134921 ) ( not ( = ?auto_134922 ?auto_134923 ) ) ( not ( = ?auto_134922 ?auto_134924 ) ) ( not ( = ?auto_134922 ?auto_134925 ) ) ( not ( = ?auto_134923 ?auto_134924 ) ) ( not ( = ?auto_134923 ?auto_134925 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134924 ?auto_134925 ?auto_134921 )
      ( DELIVER-4PKG-VERIFY ?auto_134922 ?auto_134923 ?auto_134924 ?auto_134925 ?auto_134921 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134930 - OBJ
      ?auto_134931 - OBJ
      ?auto_134932 - OBJ
      ?auto_134933 - OBJ
      ?auto_134929 - LOCATION
    )
    :vars
    (
      ?auto_134936 - TRUCK
      ?auto_134935 - LOCATION
      ?auto_134934 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134932 ?auto_134936 ) ( TRUCK-AT ?auto_134936 ?auto_134935 ) ( IN-CITY ?auto_134935 ?auto_134934 ) ( IN-CITY ?auto_134929 ?auto_134934 ) ( not ( = ?auto_134929 ?auto_134935 ) ) ( OBJ-AT ?auto_134931 ?auto_134929 ) ( not ( = ?auto_134931 ?auto_134932 ) ) ( OBJ-AT ?auto_134930 ?auto_134929 ) ( OBJ-AT ?auto_134933 ?auto_134929 ) ( not ( = ?auto_134930 ?auto_134931 ) ) ( not ( = ?auto_134930 ?auto_134932 ) ) ( not ( = ?auto_134930 ?auto_134933 ) ) ( not ( = ?auto_134931 ?auto_134933 ) ) ( not ( = ?auto_134932 ?auto_134933 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134931 ?auto_134932 ?auto_134929 )
      ( DELIVER-4PKG-VERIFY ?auto_134930 ?auto_134931 ?auto_134932 ?auto_134933 ?auto_134929 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134946 - OBJ
      ?auto_134947 - OBJ
      ?auto_134948 - OBJ
      ?auto_134949 - OBJ
      ?auto_134945 - LOCATION
    )
    :vars
    (
      ?auto_134952 - TRUCK
      ?auto_134951 - LOCATION
      ?auto_134950 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134947 ?auto_134952 ) ( TRUCK-AT ?auto_134952 ?auto_134951 ) ( IN-CITY ?auto_134951 ?auto_134950 ) ( IN-CITY ?auto_134945 ?auto_134950 ) ( not ( = ?auto_134945 ?auto_134951 ) ) ( OBJ-AT ?auto_134946 ?auto_134945 ) ( not ( = ?auto_134946 ?auto_134947 ) ) ( OBJ-AT ?auto_134948 ?auto_134945 ) ( OBJ-AT ?auto_134949 ?auto_134945 ) ( not ( = ?auto_134946 ?auto_134948 ) ) ( not ( = ?auto_134946 ?auto_134949 ) ) ( not ( = ?auto_134947 ?auto_134948 ) ) ( not ( = ?auto_134947 ?auto_134949 ) ) ( not ( = ?auto_134948 ?auto_134949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134946 ?auto_134947 ?auto_134945 )
      ( DELIVER-4PKG-VERIFY ?auto_134946 ?auto_134947 ?auto_134948 ?auto_134949 ?auto_134945 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_134978 - OBJ
      ?auto_134979 - OBJ
      ?auto_134980 - OBJ
      ?auto_134981 - OBJ
      ?auto_134977 - LOCATION
    )
    :vars
    (
      ?auto_134984 - TRUCK
      ?auto_134983 - LOCATION
      ?auto_134982 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_134978 ?auto_134984 ) ( TRUCK-AT ?auto_134984 ?auto_134983 ) ( IN-CITY ?auto_134983 ?auto_134982 ) ( IN-CITY ?auto_134977 ?auto_134982 ) ( not ( = ?auto_134977 ?auto_134983 ) ) ( OBJ-AT ?auto_134979 ?auto_134977 ) ( not ( = ?auto_134979 ?auto_134978 ) ) ( OBJ-AT ?auto_134980 ?auto_134977 ) ( OBJ-AT ?auto_134981 ?auto_134977 ) ( not ( = ?auto_134978 ?auto_134980 ) ) ( not ( = ?auto_134978 ?auto_134981 ) ) ( not ( = ?auto_134979 ?auto_134980 ) ) ( not ( = ?auto_134979 ?auto_134981 ) ) ( not ( = ?auto_134980 ?auto_134981 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_134979 ?auto_134978 ?auto_134977 )
      ( DELIVER-4PKG-VERIFY ?auto_134978 ?auto_134979 ?auto_134980 ?auto_134981 ?auto_134977 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135043 - OBJ
      ?auto_135042 - LOCATION
    )
    :vars
    (
      ?auto_135046 - TRUCK
      ?auto_135045 - LOCATION
      ?auto_135044 - CITY
      ?auto_135047 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135046 ?auto_135045 ) ( IN-CITY ?auto_135045 ?auto_135044 ) ( IN-CITY ?auto_135042 ?auto_135044 ) ( not ( = ?auto_135042 ?auto_135045 ) ) ( OBJ-AT ?auto_135047 ?auto_135042 ) ( not ( = ?auto_135047 ?auto_135043 ) ) ( OBJ-AT ?auto_135043 ?auto_135045 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_135043 ?auto_135046 ?auto_135045 )
      ( DELIVER-2PKG ?auto_135047 ?auto_135043 ?auto_135042 )
      ( DELIVER-1PKG-VERIFY ?auto_135043 ?auto_135042 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135049 - OBJ
      ?auto_135050 - OBJ
      ?auto_135048 - LOCATION
    )
    :vars
    (
      ?auto_135053 - TRUCK
      ?auto_135052 - LOCATION
      ?auto_135051 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135053 ?auto_135052 ) ( IN-CITY ?auto_135052 ?auto_135051 ) ( IN-CITY ?auto_135048 ?auto_135051 ) ( not ( = ?auto_135048 ?auto_135052 ) ) ( OBJ-AT ?auto_135049 ?auto_135048 ) ( not ( = ?auto_135049 ?auto_135050 ) ) ( OBJ-AT ?auto_135050 ?auto_135052 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135050 ?auto_135048 )
      ( DELIVER-2PKG-VERIFY ?auto_135049 ?auto_135050 ?auto_135048 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135055 - OBJ
      ?auto_135056 - OBJ
      ?auto_135054 - LOCATION
    )
    :vars
    (
      ?auto_135057 - TRUCK
      ?auto_135059 - LOCATION
      ?auto_135058 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135057 ?auto_135059 ) ( IN-CITY ?auto_135059 ?auto_135058 ) ( IN-CITY ?auto_135054 ?auto_135058 ) ( not ( = ?auto_135054 ?auto_135059 ) ) ( OBJ-AT ?auto_135056 ?auto_135054 ) ( not ( = ?auto_135056 ?auto_135055 ) ) ( OBJ-AT ?auto_135055 ?auto_135059 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135056 ?auto_135055 ?auto_135054 )
      ( DELIVER-2PKG-VERIFY ?auto_135055 ?auto_135056 ?auto_135054 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135068 - OBJ
      ?auto_135069 - OBJ
      ?auto_135070 - OBJ
      ?auto_135067 - LOCATION
    )
    :vars
    (
      ?auto_135071 - TRUCK
      ?auto_135073 - LOCATION
      ?auto_135072 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135071 ?auto_135073 ) ( IN-CITY ?auto_135073 ?auto_135072 ) ( IN-CITY ?auto_135067 ?auto_135072 ) ( not ( = ?auto_135067 ?auto_135073 ) ) ( OBJ-AT ?auto_135068 ?auto_135067 ) ( not ( = ?auto_135068 ?auto_135070 ) ) ( OBJ-AT ?auto_135070 ?auto_135073 ) ( OBJ-AT ?auto_135069 ?auto_135067 ) ( not ( = ?auto_135068 ?auto_135069 ) ) ( not ( = ?auto_135069 ?auto_135070 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135068 ?auto_135070 ?auto_135067 )
      ( DELIVER-3PKG-VERIFY ?auto_135068 ?auto_135069 ?auto_135070 ?auto_135067 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135075 - OBJ
      ?auto_135076 - OBJ
      ?auto_135077 - OBJ
      ?auto_135074 - LOCATION
    )
    :vars
    (
      ?auto_135078 - TRUCK
      ?auto_135080 - LOCATION
      ?auto_135079 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135078 ?auto_135080 ) ( IN-CITY ?auto_135080 ?auto_135079 ) ( IN-CITY ?auto_135074 ?auto_135079 ) ( not ( = ?auto_135074 ?auto_135080 ) ) ( OBJ-AT ?auto_135077 ?auto_135074 ) ( not ( = ?auto_135077 ?auto_135076 ) ) ( OBJ-AT ?auto_135076 ?auto_135080 ) ( OBJ-AT ?auto_135075 ?auto_135074 ) ( not ( = ?auto_135075 ?auto_135076 ) ) ( not ( = ?auto_135075 ?auto_135077 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135077 ?auto_135076 ?auto_135074 )
      ( DELIVER-3PKG-VERIFY ?auto_135075 ?auto_135076 ?auto_135077 ?auto_135074 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135089 - OBJ
      ?auto_135090 - OBJ
      ?auto_135091 - OBJ
      ?auto_135088 - LOCATION
    )
    :vars
    (
      ?auto_135092 - TRUCK
      ?auto_135094 - LOCATION
      ?auto_135093 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135092 ?auto_135094 ) ( IN-CITY ?auto_135094 ?auto_135093 ) ( IN-CITY ?auto_135088 ?auto_135093 ) ( not ( = ?auto_135088 ?auto_135094 ) ) ( OBJ-AT ?auto_135091 ?auto_135088 ) ( not ( = ?auto_135091 ?auto_135089 ) ) ( OBJ-AT ?auto_135089 ?auto_135094 ) ( OBJ-AT ?auto_135090 ?auto_135088 ) ( not ( = ?auto_135089 ?auto_135090 ) ) ( not ( = ?auto_135090 ?auto_135091 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135091 ?auto_135089 ?auto_135088 )
      ( DELIVER-3PKG-VERIFY ?auto_135089 ?auto_135090 ?auto_135091 ?auto_135088 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135118 - OBJ
      ?auto_135119 - OBJ
      ?auto_135120 - OBJ
      ?auto_135121 - OBJ
      ?auto_135117 - LOCATION
    )
    :vars
    (
      ?auto_135122 - TRUCK
      ?auto_135124 - LOCATION
      ?auto_135123 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135122 ?auto_135124 ) ( IN-CITY ?auto_135124 ?auto_135123 ) ( IN-CITY ?auto_135117 ?auto_135123 ) ( not ( = ?auto_135117 ?auto_135124 ) ) ( OBJ-AT ?auto_135119 ?auto_135117 ) ( not ( = ?auto_135119 ?auto_135121 ) ) ( OBJ-AT ?auto_135121 ?auto_135124 ) ( OBJ-AT ?auto_135118 ?auto_135117 ) ( OBJ-AT ?auto_135120 ?auto_135117 ) ( not ( = ?auto_135118 ?auto_135119 ) ) ( not ( = ?auto_135118 ?auto_135120 ) ) ( not ( = ?auto_135118 ?auto_135121 ) ) ( not ( = ?auto_135119 ?auto_135120 ) ) ( not ( = ?auto_135120 ?auto_135121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135119 ?auto_135121 ?auto_135117 )
      ( DELIVER-4PKG-VERIFY ?auto_135118 ?auto_135119 ?auto_135120 ?auto_135121 ?auto_135117 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135126 - OBJ
      ?auto_135127 - OBJ
      ?auto_135128 - OBJ
      ?auto_135129 - OBJ
      ?auto_135125 - LOCATION
    )
    :vars
    (
      ?auto_135130 - TRUCK
      ?auto_135132 - LOCATION
      ?auto_135131 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135130 ?auto_135132 ) ( IN-CITY ?auto_135132 ?auto_135131 ) ( IN-CITY ?auto_135125 ?auto_135131 ) ( not ( = ?auto_135125 ?auto_135132 ) ) ( OBJ-AT ?auto_135126 ?auto_135125 ) ( not ( = ?auto_135126 ?auto_135128 ) ) ( OBJ-AT ?auto_135128 ?auto_135132 ) ( OBJ-AT ?auto_135127 ?auto_135125 ) ( OBJ-AT ?auto_135129 ?auto_135125 ) ( not ( = ?auto_135126 ?auto_135127 ) ) ( not ( = ?auto_135126 ?auto_135129 ) ) ( not ( = ?auto_135127 ?auto_135128 ) ) ( not ( = ?auto_135127 ?auto_135129 ) ) ( not ( = ?auto_135128 ?auto_135129 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135126 ?auto_135128 ?auto_135125 )
      ( DELIVER-4PKG-VERIFY ?auto_135126 ?auto_135127 ?auto_135128 ?auto_135129 ?auto_135125 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135142 - OBJ
      ?auto_135143 - OBJ
      ?auto_135144 - OBJ
      ?auto_135145 - OBJ
      ?auto_135141 - LOCATION
    )
    :vars
    (
      ?auto_135146 - TRUCK
      ?auto_135148 - LOCATION
      ?auto_135147 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135146 ?auto_135148 ) ( IN-CITY ?auto_135148 ?auto_135147 ) ( IN-CITY ?auto_135141 ?auto_135147 ) ( not ( = ?auto_135141 ?auto_135148 ) ) ( OBJ-AT ?auto_135145 ?auto_135141 ) ( not ( = ?auto_135145 ?auto_135143 ) ) ( OBJ-AT ?auto_135143 ?auto_135148 ) ( OBJ-AT ?auto_135142 ?auto_135141 ) ( OBJ-AT ?auto_135144 ?auto_135141 ) ( not ( = ?auto_135142 ?auto_135143 ) ) ( not ( = ?auto_135142 ?auto_135144 ) ) ( not ( = ?auto_135142 ?auto_135145 ) ) ( not ( = ?auto_135143 ?auto_135144 ) ) ( not ( = ?auto_135144 ?auto_135145 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135145 ?auto_135143 ?auto_135141 )
      ( DELIVER-4PKG-VERIFY ?auto_135142 ?auto_135143 ?auto_135144 ?auto_135145 ?auto_135141 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135174 - OBJ
      ?auto_135175 - OBJ
      ?auto_135176 - OBJ
      ?auto_135177 - OBJ
      ?auto_135173 - LOCATION
    )
    :vars
    (
      ?auto_135178 - TRUCK
      ?auto_135180 - LOCATION
      ?auto_135179 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135178 ?auto_135180 ) ( IN-CITY ?auto_135180 ?auto_135179 ) ( IN-CITY ?auto_135173 ?auto_135179 ) ( not ( = ?auto_135173 ?auto_135180 ) ) ( OBJ-AT ?auto_135176 ?auto_135173 ) ( not ( = ?auto_135176 ?auto_135174 ) ) ( OBJ-AT ?auto_135174 ?auto_135180 ) ( OBJ-AT ?auto_135175 ?auto_135173 ) ( OBJ-AT ?auto_135177 ?auto_135173 ) ( not ( = ?auto_135174 ?auto_135175 ) ) ( not ( = ?auto_135174 ?auto_135177 ) ) ( not ( = ?auto_135175 ?auto_135176 ) ) ( not ( = ?auto_135175 ?auto_135177 ) ) ( not ( = ?auto_135176 ?auto_135177 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135176 ?auto_135174 ?auto_135173 )
      ( DELIVER-4PKG-VERIFY ?auto_135174 ?auto_135175 ?auto_135176 ?auto_135177 ?auto_135173 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135239 - OBJ
      ?auto_135238 - LOCATION
    )
    :vars
    (
      ?auto_135243 - LOCATION
      ?auto_135242 - CITY
      ?auto_135240 - OBJ
      ?auto_135241 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135243 ?auto_135242 ) ( IN-CITY ?auto_135238 ?auto_135242 ) ( not ( = ?auto_135238 ?auto_135243 ) ) ( OBJ-AT ?auto_135240 ?auto_135238 ) ( not ( = ?auto_135240 ?auto_135239 ) ) ( OBJ-AT ?auto_135239 ?auto_135243 ) ( TRUCK-AT ?auto_135241 ?auto_135238 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135241 ?auto_135238 ?auto_135243 ?auto_135242 )
      ( DELIVER-2PKG ?auto_135240 ?auto_135239 ?auto_135238 )
      ( DELIVER-1PKG-VERIFY ?auto_135239 ?auto_135238 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135245 - OBJ
      ?auto_135246 - OBJ
      ?auto_135244 - LOCATION
    )
    :vars
    (
      ?auto_135249 - LOCATION
      ?auto_135247 - CITY
      ?auto_135248 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135249 ?auto_135247 ) ( IN-CITY ?auto_135244 ?auto_135247 ) ( not ( = ?auto_135244 ?auto_135249 ) ) ( OBJ-AT ?auto_135245 ?auto_135244 ) ( not ( = ?auto_135245 ?auto_135246 ) ) ( OBJ-AT ?auto_135246 ?auto_135249 ) ( TRUCK-AT ?auto_135248 ?auto_135244 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135246 ?auto_135244 )
      ( DELIVER-2PKG-VERIFY ?auto_135245 ?auto_135246 ?auto_135244 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135251 - OBJ
      ?auto_135252 - OBJ
      ?auto_135250 - LOCATION
    )
    :vars
    (
      ?auto_135253 - LOCATION
      ?auto_135254 - CITY
      ?auto_135255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135253 ?auto_135254 ) ( IN-CITY ?auto_135250 ?auto_135254 ) ( not ( = ?auto_135250 ?auto_135253 ) ) ( OBJ-AT ?auto_135252 ?auto_135250 ) ( not ( = ?auto_135252 ?auto_135251 ) ) ( OBJ-AT ?auto_135251 ?auto_135253 ) ( TRUCK-AT ?auto_135255 ?auto_135250 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135252 ?auto_135251 ?auto_135250 )
      ( DELIVER-2PKG-VERIFY ?auto_135251 ?auto_135252 ?auto_135250 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135264 - OBJ
      ?auto_135265 - OBJ
      ?auto_135266 - OBJ
      ?auto_135263 - LOCATION
    )
    :vars
    (
      ?auto_135267 - LOCATION
      ?auto_135268 - CITY
      ?auto_135269 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135267 ?auto_135268 ) ( IN-CITY ?auto_135263 ?auto_135268 ) ( not ( = ?auto_135263 ?auto_135267 ) ) ( OBJ-AT ?auto_135264 ?auto_135263 ) ( not ( = ?auto_135264 ?auto_135266 ) ) ( OBJ-AT ?auto_135266 ?auto_135267 ) ( TRUCK-AT ?auto_135269 ?auto_135263 ) ( OBJ-AT ?auto_135265 ?auto_135263 ) ( not ( = ?auto_135264 ?auto_135265 ) ) ( not ( = ?auto_135265 ?auto_135266 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135264 ?auto_135266 ?auto_135263 )
      ( DELIVER-3PKG-VERIFY ?auto_135264 ?auto_135265 ?auto_135266 ?auto_135263 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135271 - OBJ
      ?auto_135272 - OBJ
      ?auto_135273 - OBJ
      ?auto_135270 - LOCATION
    )
    :vars
    (
      ?auto_135274 - LOCATION
      ?auto_135275 - CITY
      ?auto_135276 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135274 ?auto_135275 ) ( IN-CITY ?auto_135270 ?auto_135275 ) ( not ( = ?auto_135270 ?auto_135274 ) ) ( OBJ-AT ?auto_135273 ?auto_135270 ) ( not ( = ?auto_135273 ?auto_135272 ) ) ( OBJ-AT ?auto_135272 ?auto_135274 ) ( TRUCK-AT ?auto_135276 ?auto_135270 ) ( OBJ-AT ?auto_135271 ?auto_135270 ) ( not ( = ?auto_135271 ?auto_135272 ) ) ( not ( = ?auto_135271 ?auto_135273 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135273 ?auto_135272 ?auto_135270 )
      ( DELIVER-3PKG-VERIFY ?auto_135271 ?auto_135272 ?auto_135273 ?auto_135270 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135285 - OBJ
      ?auto_135286 - OBJ
      ?auto_135287 - OBJ
      ?auto_135284 - LOCATION
    )
    :vars
    (
      ?auto_135288 - LOCATION
      ?auto_135289 - CITY
      ?auto_135290 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135288 ?auto_135289 ) ( IN-CITY ?auto_135284 ?auto_135289 ) ( not ( = ?auto_135284 ?auto_135288 ) ) ( OBJ-AT ?auto_135286 ?auto_135284 ) ( not ( = ?auto_135286 ?auto_135285 ) ) ( OBJ-AT ?auto_135285 ?auto_135288 ) ( TRUCK-AT ?auto_135290 ?auto_135284 ) ( OBJ-AT ?auto_135287 ?auto_135284 ) ( not ( = ?auto_135285 ?auto_135287 ) ) ( not ( = ?auto_135286 ?auto_135287 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135286 ?auto_135285 ?auto_135284 )
      ( DELIVER-3PKG-VERIFY ?auto_135285 ?auto_135286 ?auto_135287 ?auto_135284 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135314 - OBJ
      ?auto_135315 - OBJ
      ?auto_135316 - OBJ
      ?auto_135317 - OBJ
      ?auto_135313 - LOCATION
    )
    :vars
    (
      ?auto_135318 - LOCATION
      ?auto_135319 - CITY
      ?auto_135320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135318 ?auto_135319 ) ( IN-CITY ?auto_135313 ?auto_135319 ) ( not ( = ?auto_135313 ?auto_135318 ) ) ( OBJ-AT ?auto_135315 ?auto_135313 ) ( not ( = ?auto_135315 ?auto_135317 ) ) ( OBJ-AT ?auto_135317 ?auto_135318 ) ( TRUCK-AT ?auto_135320 ?auto_135313 ) ( OBJ-AT ?auto_135314 ?auto_135313 ) ( OBJ-AT ?auto_135316 ?auto_135313 ) ( not ( = ?auto_135314 ?auto_135315 ) ) ( not ( = ?auto_135314 ?auto_135316 ) ) ( not ( = ?auto_135314 ?auto_135317 ) ) ( not ( = ?auto_135315 ?auto_135316 ) ) ( not ( = ?auto_135316 ?auto_135317 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135315 ?auto_135317 ?auto_135313 )
      ( DELIVER-4PKG-VERIFY ?auto_135314 ?auto_135315 ?auto_135316 ?auto_135317 ?auto_135313 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135322 - OBJ
      ?auto_135323 - OBJ
      ?auto_135324 - OBJ
      ?auto_135325 - OBJ
      ?auto_135321 - LOCATION
    )
    :vars
    (
      ?auto_135326 - LOCATION
      ?auto_135327 - CITY
      ?auto_135328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135326 ?auto_135327 ) ( IN-CITY ?auto_135321 ?auto_135327 ) ( not ( = ?auto_135321 ?auto_135326 ) ) ( OBJ-AT ?auto_135322 ?auto_135321 ) ( not ( = ?auto_135322 ?auto_135324 ) ) ( OBJ-AT ?auto_135324 ?auto_135326 ) ( TRUCK-AT ?auto_135328 ?auto_135321 ) ( OBJ-AT ?auto_135323 ?auto_135321 ) ( OBJ-AT ?auto_135325 ?auto_135321 ) ( not ( = ?auto_135322 ?auto_135323 ) ) ( not ( = ?auto_135322 ?auto_135325 ) ) ( not ( = ?auto_135323 ?auto_135324 ) ) ( not ( = ?auto_135323 ?auto_135325 ) ) ( not ( = ?auto_135324 ?auto_135325 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135322 ?auto_135324 ?auto_135321 )
      ( DELIVER-4PKG-VERIFY ?auto_135322 ?auto_135323 ?auto_135324 ?auto_135325 ?auto_135321 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135338 - OBJ
      ?auto_135339 - OBJ
      ?auto_135340 - OBJ
      ?auto_135341 - OBJ
      ?auto_135337 - LOCATION
    )
    :vars
    (
      ?auto_135342 - LOCATION
      ?auto_135343 - CITY
      ?auto_135344 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135342 ?auto_135343 ) ( IN-CITY ?auto_135337 ?auto_135343 ) ( not ( = ?auto_135337 ?auto_135342 ) ) ( OBJ-AT ?auto_135340 ?auto_135337 ) ( not ( = ?auto_135340 ?auto_135339 ) ) ( OBJ-AT ?auto_135339 ?auto_135342 ) ( TRUCK-AT ?auto_135344 ?auto_135337 ) ( OBJ-AT ?auto_135338 ?auto_135337 ) ( OBJ-AT ?auto_135341 ?auto_135337 ) ( not ( = ?auto_135338 ?auto_135339 ) ) ( not ( = ?auto_135338 ?auto_135340 ) ) ( not ( = ?auto_135338 ?auto_135341 ) ) ( not ( = ?auto_135339 ?auto_135341 ) ) ( not ( = ?auto_135340 ?auto_135341 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135340 ?auto_135339 ?auto_135337 )
      ( DELIVER-4PKG-VERIFY ?auto_135338 ?auto_135339 ?auto_135340 ?auto_135341 ?auto_135337 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135370 - OBJ
      ?auto_135371 - OBJ
      ?auto_135372 - OBJ
      ?auto_135373 - OBJ
      ?auto_135369 - LOCATION
    )
    :vars
    (
      ?auto_135374 - LOCATION
      ?auto_135375 - CITY
      ?auto_135376 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135374 ?auto_135375 ) ( IN-CITY ?auto_135369 ?auto_135375 ) ( not ( = ?auto_135369 ?auto_135374 ) ) ( OBJ-AT ?auto_135372 ?auto_135369 ) ( not ( = ?auto_135372 ?auto_135370 ) ) ( OBJ-AT ?auto_135370 ?auto_135374 ) ( TRUCK-AT ?auto_135376 ?auto_135369 ) ( OBJ-AT ?auto_135371 ?auto_135369 ) ( OBJ-AT ?auto_135373 ?auto_135369 ) ( not ( = ?auto_135370 ?auto_135371 ) ) ( not ( = ?auto_135370 ?auto_135373 ) ) ( not ( = ?auto_135371 ?auto_135372 ) ) ( not ( = ?auto_135371 ?auto_135373 ) ) ( not ( = ?auto_135372 ?auto_135373 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135372 ?auto_135370 ?auto_135369 )
      ( DELIVER-4PKG-VERIFY ?auto_135370 ?auto_135371 ?auto_135372 ?auto_135373 ?auto_135369 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135435 - OBJ
      ?auto_135434 - LOCATION
    )
    :vars
    (
      ?auto_135436 - LOCATION
      ?auto_135437 - CITY
      ?auto_135439 - OBJ
      ?auto_135438 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135436 ?auto_135437 ) ( IN-CITY ?auto_135434 ?auto_135437 ) ( not ( = ?auto_135434 ?auto_135436 ) ) ( not ( = ?auto_135439 ?auto_135435 ) ) ( OBJ-AT ?auto_135435 ?auto_135436 ) ( TRUCK-AT ?auto_135438 ?auto_135434 ) ( IN-TRUCK ?auto_135439 ?auto_135438 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135439 ?auto_135434 )
      ( DELIVER-2PKG ?auto_135439 ?auto_135435 ?auto_135434 )
      ( DELIVER-1PKG-VERIFY ?auto_135435 ?auto_135434 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135441 - OBJ
      ?auto_135442 - OBJ
      ?auto_135440 - LOCATION
    )
    :vars
    (
      ?auto_135443 - LOCATION
      ?auto_135444 - CITY
      ?auto_135445 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135443 ?auto_135444 ) ( IN-CITY ?auto_135440 ?auto_135444 ) ( not ( = ?auto_135440 ?auto_135443 ) ) ( not ( = ?auto_135441 ?auto_135442 ) ) ( OBJ-AT ?auto_135442 ?auto_135443 ) ( TRUCK-AT ?auto_135445 ?auto_135440 ) ( IN-TRUCK ?auto_135441 ?auto_135445 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135442 ?auto_135440 )
      ( DELIVER-2PKG-VERIFY ?auto_135441 ?auto_135442 ?auto_135440 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135447 - OBJ
      ?auto_135448 - OBJ
      ?auto_135446 - LOCATION
    )
    :vars
    (
      ?auto_135450 - LOCATION
      ?auto_135451 - CITY
      ?auto_135449 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135450 ?auto_135451 ) ( IN-CITY ?auto_135446 ?auto_135451 ) ( not ( = ?auto_135446 ?auto_135450 ) ) ( not ( = ?auto_135448 ?auto_135447 ) ) ( OBJ-AT ?auto_135447 ?auto_135450 ) ( TRUCK-AT ?auto_135449 ?auto_135446 ) ( IN-TRUCK ?auto_135448 ?auto_135449 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135448 ?auto_135447 ?auto_135446 )
      ( DELIVER-2PKG-VERIFY ?auto_135447 ?auto_135448 ?auto_135446 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135631 - OBJ
      ?auto_135630 - LOCATION
    )
    :vars
    (
      ?auto_135634 - LOCATION
      ?auto_135635 - CITY
      ?auto_135633 - OBJ
      ?auto_135632 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135634 ?auto_135635 ) ( IN-CITY ?auto_135630 ?auto_135635 ) ( not ( = ?auto_135630 ?auto_135634 ) ) ( not ( = ?auto_135633 ?auto_135631 ) ) ( OBJ-AT ?auto_135631 ?auto_135634 ) ( IN-TRUCK ?auto_135633 ?auto_135632 ) ( TRUCK-AT ?auto_135632 ?auto_135634 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135632 ?auto_135634 ?auto_135630 ?auto_135635 )
      ( DELIVER-2PKG ?auto_135633 ?auto_135631 ?auto_135630 )
      ( DELIVER-1PKG-VERIFY ?auto_135631 ?auto_135630 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135637 - OBJ
      ?auto_135638 - OBJ
      ?auto_135636 - LOCATION
    )
    :vars
    (
      ?auto_135639 - LOCATION
      ?auto_135640 - CITY
      ?auto_135641 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135639 ?auto_135640 ) ( IN-CITY ?auto_135636 ?auto_135640 ) ( not ( = ?auto_135636 ?auto_135639 ) ) ( not ( = ?auto_135637 ?auto_135638 ) ) ( OBJ-AT ?auto_135638 ?auto_135639 ) ( IN-TRUCK ?auto_135637 ?auto_135641 ) ( TRUCK-AT ?auto_135641 ?auto_135639 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135638 ?auto_135636 )
      ( DELIVER-2PKG-VERIFY ?auto_135637 ?auto_135638 ?auto_135636 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135643 - OBJ
      ?auto_135644 - OBJ
      ?auto_135642 - LOCATION
    )
    :vars
    (
      ?auto_135647 - LOCATION
      ?auto_135646 - CITY
      ?auto_135645 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135647 ?auto_135646 ) ( IN-CITY ?auto_135642 ?auto_135646 ) ( not ( = ?auto_135642 ?auto_135647 ) ) ( not ( = ?auto_135644 ?auto_135643 ) ) ( OBJ-AT ?auto_135643 ?auto_135647 ) ( IN-TRUCK ?auto_135644 ?auto_135645 ) ( TRUCK-AT ?auto_135645 ?auto_135647 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135644 ?auto_135643 ?auto_135642 )
      ( DELIVER-2PKG-VERIFY ?auto_135643 ?auto_135644 ?auto_135642 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137153 - OBJ
      ?auto_137154 - OBJ
      ?auto_137155 - OBJ
      ?auto_137152 - LOCATION
    )
    :vars
    (
      ?auto_137158 - TRUCK
      ?auto_137157 - LOCATION
      ?auto_137156 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137155 ?auto_137158 ) ( TRUCK-AT ?auto_137158 ?auto_137157 ) ( IN-CITY ?auto_137157 ?auto_137156 ) ( IN-CITY ?auto_137152 ?auto_137156 ) ( not ( = ?auto_137152 ?auto_137157 ) ) ( OBJ-AT ?auto_137154 ?auto_137152 ) ( not ( = ?auto_137154 ?auto_137155 ) ) ( OBJ-AT ?auto_137153 ?auto_137152 ) ( not ( = ?auto_137153 ?auto_137154 ) ) ( not ( = ?auto_137153 ?auto_137155 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137154 ?auto_137155 ?auto_137152 )
      ( DELIVER-3PKG-VERIFY ?auto_137153 ?auto_137154 ?auto_137155 ?auto_137152 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137186 - OBJ
      ?auto_137187 - OBJ
      ?auto_137188 - OBJ
      ?auto_137185 - LOCATION
    )
    :vars
    (
      ?auto_137192 - TRUCK
      ?auto_137191 - LOCATION
      ?auto_137189 - CITY
      ?auto_137190 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137188 ?auto_137192 ) ( TRUCK-AT ?auto_137192 ?auto_137191 ) ( IN-CITY ?auto_137191 ?auto_137189 ) ( IN-CITY ?auto_137185 ?auto_137189 ) ( not ( = ?auto_137185 ?auto_137191 ) ) ( OBJ-AT ?auto_137190 ?auto_137185 ) ( not ( = ?auto_137190 ?auto_137188 ) ) ( OBJ-AT ?auto_137186 ?auto_137185 ) ( OBJ-AT ?auto_137187 ?auto_137185 ) ( not ( = ?auto_137186 ?auto_137187 ) ) ( not ( = ?auto_137186 ?auto_137188 ) ) ( not ( = ?auto_137186 ?auto_137190 ) ) ( not ( = ?auto_137187 ?auto_137188 ) ) ( not ( = ?auto_137187 ?auto_137190 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137190 ?auto_137188 ?auto_137185 )
      ( DELIVER-3PKG-VERIFY ?auto_137186 ?auto_137187 ?auto_137188 ?auto_137185 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137198 - OBJ
      ?auto_137199 - OBJ
      ?auto_137200 - OBJ
      ?auto_137197 - LOCATION
    )
    :vars
    (
      ?auto_137204 - TRUCK
      ?auto_137203 - LOCATION
      ?auto_137201 - CITY
      ?auto_137202 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137199 ?auto_137204 ) ( TRUCK-AT ?auto_137204 ?auto_137203 ) ( IN-CITY ?auto_137203 ?auto_137201 ) ( IN-CITY ?auto_137197 ?auto_137201 ) ( not ( = ?auto_137197 ?auto_137203 ) ) ( OBJ-AT ?auto_137202 ?auto_137197 ) ( not ( = ?auto_137202 ?auto_137199 ) ) ( OBJ-AT ?auto_137198 ?auto_137197 ) ( OBJ-AT ?auto_137200 ?auto_137197 ) ( not ( = ?auto_137198 ?auto_137199 ) ) ( not ( = ?auto_137198 ?auto_137200 ) ) ( not ( = ?auto_137198 ?auto_137202 ) ) ( not ( = ?auto_137199 ?auto_137200 ) ) ( not ( = ?auto_137200 ?auto_137202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137202 ?auto_137199 ?auto_137197 )
      ( DELIVER-3PKG-VERIFY ?auto_137198 ?auto_137199 ?auto_137200 ?auto_137197 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137214 - OBJ
      ?auto_137215 - OBJ
      ?auto_137216 - OBJ
      ?auto_137213 - LOCATION
    )
    :vars
    (
      ?auto_137219 - TRUCK
      ?auto_137218 - LOCATION
      ?auto_137217 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137214 ?auto_137219 ) ( TRUCK-AT ?auto_137219 ?auto_137218 ) ( IN-CITY ?auto_137218 ?auto_137217 ) ( IN-CITY ?auto_137213 ?auto_137217 ) ( not ( = ?auto_137213 ?auto_137218 ) ) ( OBJ-AT ?auto_137216 ?auto_137213 ) ( not ( = ?auto_137216 ?auto_137214 ) ) ( OBJ-AT ?auto_137215 ?auto_137213 ) ( not ( = ?auto_137214 ?auto_137215 ) ) ( not ( = ?auto_137215 ?auto_137216 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137216 ?auto_137214 ?auto_137213 )
      ( DELIVER-3PKG-VERIFY ?auto_137214 ?auto_137215 ?auto_137216 ?auto_137213 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137236 - OBJ
      ?auto_137237 - OBJ
      ?auto_137238 - OBJ
      ?auto_137235 - LOCATION
    )
    :vars
    (
      ?auto_137242 - TRUCK
      ?auto_137241 - LOCATION
      ?auto_137239 - CITY
      ?auto_137240 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137236 ?auto_137242 ) ( TRUCK-AT ?auto_137242 ?auto_137241 ) ( IN-CITY ?auto_137241 ?auto_137239 ) ( IN-CITY ?auto_137235 ?auto_137239 ) ( not ( = ?auto_137235 ?auto_137241 ) ) ( OBJ-AT ?auto_137240 ?auto_137235 ) ( not ( = ?auto_137240 ?auto_137236 ) ) ( OBJ-AT ?auto_137237 ?auto_137235 ) ( OBJ-AT ?auto_137238 ?auto_137235 ) ( not ( = ?auto_137236 ?auto_137237 ) ) ( not ( = ?auto_137236 ?auto_137238 ) ) ( not ( = ?auto_137237 ?auto_137238 ) ) ( not ( = ?auto_137237 ?auto_137240 ) ) ( not ( = ?auto_137238 ?auto_137240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137240 ?auto_137236 ?auto_137235 )
      ( DELIVER-3PKG-VERIFY ?auto_137236 ?auto_137237 ?auto_137238 ?auto_137235 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137283 - OBJ
      ?auto_137284 - OBJ
      ?auto_137285 - OBJ
      ?auto_137286 - OBJ
      ?auto_137282 - LOCATION
    )
    :vars
    (
      ?auto_137289 - TRUCK
      ?auto_137288 - LOCATION
      ?auto_137287 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137286 ?auto_137289 ) ( TRUCK-AT ?auto_137289 ?auto_137288 ) ( IN-CITY ?auto_137288 ?auto_137287 ) ( IN-CITY ?auto_137282 ?auto_137287 ) ( not ( = ?auto_137282 ?auto_137288 ) ) ( OBJ-AT ?auto_137283 ?auto_137282 ) ( not ( = ?auto_137283 ?auto_137286 ) ) ( OBJ-AT ?auto_137284 ?auto_137282 ) ( OBJ-AT ?auto_137285 ?auto_137282 ) ( not ( = ?auto_137283 ?auto_137284 ) ) ( not ( = ?auto_137283 ?auto_137285 ) ) ( not ( = ?auto_137284 ?auto_137285 ) ) ( not ( = ?auto_137284 ?auto_137286 ) ) ( not ( = ?auto_137285 ?auto_137286 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137283 ?auto_137286 ?auto_137282 )
      ( DELIVER-4PKG-VERIFY ?auto_137283 ?auto_137284 ?auto_137285 ?auto_137286 ?auto_137282 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137291 - OBJ
      ?auto_137292 - OBJ
      ?auto_137293 - OBJ
      ?auto_137294 - OBJ
      ?auto_137290 - LOCATION
    )
    :vars
    (
      ?auto_137297 - TRUCK
      ?auto_137296 - LOCATION
      ?auto_137295 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137293 ?auto_137297 ) ( TRUCK-AT ?auto_137297 ?auto_137296 ) ( IN-CITY ?auto_137296 ?auto_137295 ) ( IN-CITY ?auto_137290 ?auto_137295 ) ( not ( = ?auto_137290 ?auto_137296 ) ) ( OBJ-AT ?auto_137294 ?auto_137290 ) ( not ( = ?auto_137294 ?auto_137293 ) ) ( OBJ-AT ?auto_137291 ?auto_137290 ) ( OBJ-AT ?auto_137292 ?auto_137290 ) ( not ( = ?auto_137291 ?auto_137292 ) ) ( not ( = ?auto_137291 ?auto_137293 ) ) ( not ( = ?auto_137291 ?auto_137294 ) ) ( not ( = ?auto_137292 ?auto_137293 ) ) ( not ( = ?auto_137292 ?auto_137294 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137294 ?auto_137293 ?auto_137290 )
      ( DELIVER-4PKG-VERIFY ?auto_137291 ?auto_137292 ?auto_137293 ?auto_137294 ?auto_137290 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137299 - OBJ
      ?auto_137300 - OBJ
      ?auto_137301 - OBJ
      ?auto_137302 - OBJ
      ?auto_137298 - LOCATION
    )
    :vars
    (
      ?auto_137305 - TRUCK
      ?auto_137304 - LOCATION
      ?auto_137303 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137301 ?auto_137305 ) ( TRUCK-AT ?auto_137305 ?auto_137304 ) ( IN-CITY ?auto_137304 ?auto_137303 ) ( IN-CITY ?auto_137298 ?auto_137303 ) ( not ( = ?auto_137298 ?auto_137304 ) ) ( OBJ-AT ?auto_137299 ?auto_137298 ) ( not ( = ?auto_137299 ?auto_137301 ) ) ( OBJ-AT ?auto_137300 ?auto_137298 ) ( OBJ-AT ?auto_137302 ?auto_137298 ) ( not ( = ?auto_137299 ?auto_137300 ) ) ( not ( = ?auto_137299 ?auto_137302 ) ) ( not ( = ?auto_137300 ?auto_137301 ) ) ( not ( = ?auto_137300 ?auto_137302 ) ) ( not ( = ?auto_137301 ?auto_137302 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137299 ?auto_137301 ?auto_137298 )
      ( DELIVER-4PKG-VERIFY ?auto_137299 ?auto_137300 ?auto_137301 ?auto_137302 ?auto_137298 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137355 - OBJ
      ?auto_137356 - OBJ
      ?auto_137357 - OBJ
      ?auto_137358 - OBJ
      ?auto_137354 - LOCATION
    )
    :vars
    (
      ?auto_137361 - TRUCK
      ?auto_137360 - LOCATION
      ?auto_137359 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137356 ?auto_137361 ) ( TRUCK-AT ?auto_137361 ?auto_137360 ) ( IN-CITY ?auto_137360 ?auto_137359 ) ( IN-CITY ?auto_137354 ?auto_137359 ) ( not ( = ?auto_137354 ?auto_137360 ) ) ( OBJ-AT ?auto_137358 ?auto_137354 ) ( not ( = ?auto_137358 ?auto_137356 ) ) ( OBJ-AT ?auto_137355 ?auto_137354 ) ( OBJ-AT ?auto_137357 ?auto_137354 ) ( not ( = ?auto_137355 ?auto_137356 ) ) ( not ( = ?auto_137355 ?auto_137357 ) ) ( not ( = ?auto_137355 ?auto_137358 ) ) ( not ( = ?auto_137356 ?auto_137357 ) ) ( not ( = ?auto_137357 ?auto_137358 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137358 ?auto_137356 ?auto_137354 )
      ( DELIVER-4PKG-VERIFY ?auto_137355 ?auto_137356 ?auto_137357 ?auto_137358 ?auto_137354 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137363 - OBJ
      ?auto_137364 - OBJ
      ?auto_137365 - OBJ
      ?auto_137366 - OBJ
      ?auto_137362 - LOCATION
    )
    :vars
    (
      ?auto_137369 - TRUCK
      ?auto_137368 - LOCATION
      ?auto_137367 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137364 ?auto_137369 ) ( TRUCK-AT ?auto_137369 ?auto_137368 ) ( IN-CITY ?auto_137368 ?auto_137367 ) ( IN-CITY ?auto_137362 ?auto_137367 ) ( not ( = ?auto_137362 ?auto_137368 ) ) ( OBJ-AT ?auto_137365 ?auto_137362 ) ( not ( = ?auto_137365 ?auto_137364 ) ) ( OBJ-AT ?auto_137363 ?auto_137362 ) ( OBJ-AT ?auto_137366 ?auto_137362 ) ( not ( = ?auto_137363 ?auto_137364 ) ) ( not ( = ?auto_137363 ?auto_137365 ) ) ( not ( = ?auto_137363 ?auto_137366 ) ) ( not ( = ?auto_137364 ?auto_137366 ) ) ( not ( = ?auto_137365 ?auto_137366 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137365 ?auto_137364 ?auto_137362 )
      ( DELIVER-4PKG-VERIFY ?auto_137363 ?auto_137364 ?auto_137365 ?auto_137366 ?auto_137362 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137427 - OBJ
      ?auto_137428 - OBJ
      ?auto_137429 - OBJ
      ?auto_137430 - OBJ
      ?auto_137426 - LOCATION
    )
    :vars
    (
      ?auto_137433 - TRUCK
      ?auto_137432 - LOCATION
      ?auto_137431 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137430 ?auto_137433 ) ( TRUCK-AT ?auto_137433 ?auto_137432 ) ( IN-CITY ?auto_137432 ?auto_137431 ) ( IN-CITY ?auto_137426 ?auto_137431 ) ( not ( = ?auto_137426 ?auto_137432 ) ) ( OBJ-AT ?auto_137428 ?auto_137426 ) ( not ( = ?auto_137428 ?auto_137430 ) ) ( OBJ-AT ?auto_137427 ?auto_137426 ) ( OBJ-AT ?auto_137429 ?auto_137426 ) ( not ( = ?auto_137427 ?auto_137428 ) ) ( not ( = ?auto_137427 ?auto_137429 ) ) ( not ( = ?auto_137427 ?auto_137430 ) ) ( not ( = ?auto_137428 ?auto_137429 ) ) ( not ( = ?auto_137429 ?auto_137430 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137428 ?auto_137430 ?auto_137426 )
      ( DELIVER-4PKG-VERIFY ?auto_137427 ?auto_137428 ?auto_137429 ?auto_137430 ?auto_137426 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137475 - OBJ
      ?auto_137476 - OBJ
      ?auto_137477 - OBJ
      ?auto_137478 - OBJ
      ?auto_137474 - LOCATION
    )
    :vars
    (
      ?auto_137482 - TRUCK
      ?auto_137481 - LOCATION
      ?auto_137479 - CITY
      ?auto_137480 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137478 ?auto_137482 ) ( TRUCK-AT ?auto_137482 ?auto_137481 ) ( IN-CITY ?auto_137481 ?auto_137479 ) ( IN-CITY ?auto_137474 ?auto_137479 ) ( not ( = ?auto_137474 ?auto_137481 ) ) ( OBJ-AT ?auto_137480 ?auto_137474 ) ( not ( = ?auto_137480 ?auto_137478 ) ) ( OBJ-AT ?auto_137475 ?auto_137474 ) ( OBJ-AT ?auto_137476 ?auto_137474 ) ( OBJ-AT ?auto_137477 ?auto_137474 ) ( not ( = ?auto_137475 ?auto_137476 ) ) ( not ( = ?auto_137475 ?auto_137477 ) ) ( not ( = ?auto_137475 ?auto_137478 ) ) ( not ( = ?auto_137475 ?auto_137480 ) ) ( not ( = ?auto_137476 ?auto_137477 ) ) ( not ( = ?auto_137476 ?auto_137478 ) ) ( not ( = ?auto_137476 ?auto_137480 ) ) ( not ( = ?auto_137477 ?auto_137478 ) ) ( not ( = ?auto_137477 ?auto_137480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137480 ?auto_137478 ?auto_137474 )
      ( DELIVER-4PKG-VERIFY ?auto_137475 ?auto_137476 ?auto_137477 ?auto_137478 ?auto_137474 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137492 - OBJ
      ?auto_137493 - OBJ
      ?auto_137494 - OBJ
      ?auto_137495 - OBJ
      ?auto_137491 - LOCATION
    )
    :vars
    (
      ?auto_137499 - TRUCK
      ?auto_137498 - LOCATION
      ?auto_137496 - CITY
      ?auto_137497 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137494 ?auto_137499 ) ( TRUCK-AT ?auto_137499 ?auto_137498 ) ( IN-CITY ?auto_137498 ?auto_137496 ) ( IN-CITY ?auto_137491 ?auto_137496 ) ( not ( = ?auto_137491 ?auto_137498 ) ) ( OBJ-AT ?auto_137497 ?auto_137491 ) ( not ( = ?auto_137497 ?auto_137494 ) ) ( OBJ-AT ?auto_137492 ?auto_137491 ) ( OBJ-AT ?auto_137493 ?auto_137491 ) ( OBJ-AT ?auto_137495 ?auto_137491 ) ( not ( = ?auto_137492 ?auto_137493 ) ) ( not ( = ?auto_137492 ?auto_137494 ) ) ( not ( = ?auto_137492 ?auto_137495 ) ) ( not ( = ?auto_137492 ?auto_137497 ) ) ( not ( = ?auto_137493 ?auto_137494 ) ) ( not ( = ?auto_137493 ?auto_137495 ) ) ( not ( = ?auto_137493 ?auto_137497 ) ) ( not ( = ?auto_137494 ?auto_137495 ) ) ( not ( = ?auto_137495 ?auto_137497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137497 ?auto_137494 ?auto_137491 )
      ( DELIVER-4PKG-VERIFY ?auto_137492 ?auto_137493 ?auto_137494 ?auto_137495 ?auto_137491 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137542 - OBJ
      ?auto_137543 - OBJ
      ?auto_137544 - OBJ
      ?auto_137545 - OBJ
      ?auto_137541 - LOCATION
    )
    :vars
    (
      ?auto_137549 - TRUCK
      ?auto_137548 - LOCATION
      ?auto_137546 - CITY
      ?auto_137547 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137543 ?auto_137549 ) ( TRUCK-AT ?auto_137549 ?auto_137548 ) ( IN-CITY ?auto_137548 ?auto_137546 ) ( IN-CITY ?auto_137541 ?auto_137546 ) ( not ( = ?auto_137541 ?auto_137548 ) ) ( OBJ-AT ?auto_137547 ?auto_137541 ) ( not ( = ?auto_137547 ?auto_137543 ) ) ( OBJ-AT ?auto_137542 ?auto_137541 ) ( OBJ-AT ?auto_137544 ?auto_137541 ) ( OBJ-AT ?auto_137545 ?auto_137541 ) ( not ( = ?auto_137542 ?auto_137543 ) ) ( not ( = ?auto_137542 ?auto_137544 ) ) ( not ( = ?auto_137542 ?auto_137545 ) ) ( not ( = ?auto_137542 ?auto_137547 ) ) ( not ( = ?auto_137543 ?auto_137544 ) ) ( not ( = ?auto_137543 ?auto_137545 ) ) ( not ( = ?auto_137544 ?auto_137545 ) ) ( not ( = ?auto_137544 ?auto_137547 ) ) ( not ( = ?auto_137545 ?auto_137547 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137547 ?auto_137543 ?auto_137541 )
      ( DELIVER-4PKG-VERIFY ?auto_137542 ?auto_137543 ?auto_137544 ?auto_137545 ?auto_137541 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137586 - OBJ
      ?auto_137587 - OBJ
      ?auto_137588 - OBJ
      ?auto_137589 - OBJ
      ?auto_137585 - LOCATION
    )
    :vars
    (
      ?auto_137592 - TRUCK
      ?auto_137591 - LOCATION
      ?auto_137590 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137586 ?auto_137592 ) ( TRUCK-AT ?auto_137592 ?auto_137591 ) ( IN-CITY ?auto_137591 ?auto_137590 ) ( IN-CITY ?auto_137585 ?auto_137590 ) ( not ( = ?auto_137585 ?auto_137591 ) ) ( OBJ-AT ?auto_137589 ?auto_137585 ) ( not ( = ?auto_137589 ?auto_137586 ) ) ( OBJ-AT ?auto_137587 ?auto_137585 ) ( OBJ-AT ?auto_137588 ?auto_137585 ) ( not ( = ?auto_137586 ?auto_137587 ) ) ( not ( = ?auto_137586 ?auto_137588 ) ) ( not ( = ?auto_137587 ?auto_137588 ) ) ( not ( = ?auto_137587 ?auto_137589 ) ) ( not ( = ?auto_137588 ?auto_137589 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137589 ?auto_137586 ?auto_137585 )
      ( DELIVER-4PKG-VERIFY ?auto_137586 ?auto_137587 ?auto_137588 ?auto_137589 ?auto_137585 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137594 - OBJ
      ?auto_137595 - OBJ
      ?auto_137596 - OBJ
      ?auto_137597 - OBJ
      ?auto_137593 - LOCATION
    )
    :vars
    (
      ?auto_137600 - TRUCK
      ?auto_137599 - LOCATION
      ?auto_137598 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137594 ?auto_137600 ) ( TRUCK-AT ?auto_137600 ?auto_137599 ) ( IN-CITY ?auto_137599 ?auto_137598 ) ( IN-CITY ?auto_137593 ?auto_137598 ) ( not ( = ?auto_137593 ?auto_137599 ) ) ( OBJ-AT ?auto_137596 ?auto_137593 ) ( not ( = ?auto_137596 ?auto_137594 ) ) ( OBJ-AT ?auto_137595 ?auto_137593 ) ( OBJ-AT ?auto_137597 ?auto_137593 ) ( not ( = ?auto_137594 ?auto_137595 ) ) ( not ( = ?auto_137594 ?auto_137597 ) ) ( not ( = ?auto_137595 ?auto_137596 ) ) ( not ( = ?auto_137595 ?auto_137597 ) ) ( not ( = ?auto_137596 ?auto_137597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137596 ?auto_137594 ?auto_137593 )
      ( DELIVER-4PKG-VERIFY ?auto_137594 ?auto_137595 ?auto_137596 ?auto_137597 ?auto_137593 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137690 - OBJ
      ?auto_137691 - OBJ
      ?auto_137692 - OBJ
      ?auto_137693 - OBJ
      ?auto_137689 - LOCATION
    )
    :vars
    (
      ?auto_137697 - TRUCK
      ?auto_137696 - LOCATION
      ?auto_137694 - CITY
      ?auto_137695 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_137690 ?auto_137697 ) ( TRUCK-AT ?auto_137697 ?auto_137696 ) ( IN-CITY ?auto_137696 ?auto_137694 ) ( IN-CITY ?auto_137689 ?auto_137694 ) ( not ( = ?auto_137689 ?auto_137696 ) ) ( OBJ-AT ?auto_137695 ?auto_137689 ) ( not ( = ?auto_137695 ?auto_137690 ) ) ( OBJ-AT ?auto_137691 ?auto_137689 ) ( OBJ-AT ?auto_137692 ?auto_137689 ) ( OBJ-AT ?auto_137693 ?auto_137689 ) ( not ( = ?auto_137690 ?auto_137691 ) ) ( not ( = ?auto_137690 ?auto_137692 ) ) ( not ( = ?auto_137690 ?auto_137693 ) ) ( not ( = ?auto_137691 ?auto_137692 ) ) ( not ( = ?auto_137691 ?auto_137693 ) ) ( not ( = ?auto_137691 ?auto_137695 ) ) ( not ( = ?auto_137692 ?auto_137693 ) ) ( not ( = ?auto_137692 ?auto_137695 ) ) ( not ( = ?auto_137693 ?auto_137695 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137695 ?auto_137690 ?auto_137689 )
      ( DELIVER-4PKG-VERIFY ?auto_137690 ?auto_137691 ?auto_137692 ?auto_137693 ?auto_137689 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137841 - OBJ
      ?auto_137842 - OBJ
      ?auto_137843 - OBJ
      ?auto_137840 - LOCATION
    )
    :vars
    (
      ?auto_137845 - TRUCK
      ?auto_137846 - LOCATION
      ?auto_137844 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137845 ?auto_137846 ) ( IN-CITY ?auto_137846 ?auto_137844 ) ( IN-CITY ?auto_137840 ?auto_137844 ) ( not ( = ?auto_137840 ?auto_137846 ) ) ( OBJ-AT ?auto_137842 ?auto_137840 ) ( not ( = ?auto_137842 ?auto_137843 ) ) ( OBJ-AT ?auto_137843 ?auto_137846 ) ( OBJ-AT ?auto_137841 ?auto_137840 ) ( not ( = ?auto_137841 ?auto_137842 ) ) ( not ( = ?auto_137841 ?auto_137843 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137842 ?auto_137843 ?auto_137840 )
      ( DELIVER-3PKG-VERIFY ?auto_137841 ?auto_137842 ?auto_137843 ?auto_137840 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137852 - OBJ
      ?auto_137853 - OBJ
      ?auto_137854 - OBJ
      ?auto_137851 - LOCATION
    )
    :vars
    (
      ?auto_137856 - TRUCK
      ?auto_137857 - LOCATION
      ?auto_137855 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137856 ?auto_137857 ) ( IN-CITY ?auto_137857 ?auto_137855 ) ( IN-CITY ?auto_137851 ?auto_137855 ) ( not ( = ?auto_137851 ?auto_137857 ) ) ( OBJ-AT ?auto_137852 ?auto_137851 ) ( not ( = ?auto_137852 ?auto_137853 ) ) ( OBJ-AT ?auto_137853 ?auto_137857 ) ( OBJ-AT ?auto_137854 ?auto_137851 ) ( not ( = ?auto_137852 ?auto_137854 ) ) ( not ( = ?auto_137853 ?auto_137854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137852 ?auto_137853 ?auto_137851 )
      ( DELIVER-3PKG-VERIFY ?auto_137852 ?auto_137853 ?auto_137854 ?auto_137851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137874 - OBJ
      ?auto_137875 - OBJ
      ?auto_137876 - OBJ
      ?auto_137873 - LOCATION
    )
    :vars
    (
      ?auto_137879 - TRUCK
      ?auto_137880 - LOCATION
      ?auto_137877 - CITY
      ?auto_137878 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137879 ?auto_137880 ) ( IN-CITY ?auto_137880 ?auto_137877 ) ( IN-CITY ?auto_137873 ?auto_137877 ) ( not ( = ?auto_137873 ?auto_137880 ) ) ( OBJ-AT ?auto_137878 ?auto_137873 ) ( not ( = ?auto_137878 ?auto_137876 ) ) ( OBJ-AT ?auto_137876 ?auto_137880 ) ( OBJ-AT ?auto_137874 ?auto_137873 ) ( OBJ-AT ?auto_137875 ?auto_137873 ) ( not ( = ?auto_137874 ?auto_137875 ) ) ( not ( = ?auto_137874 ?auto_137876 ) ) ( not ( = ?auto_137874 ?auto_137878 ) ) ( not ( = ?auto_137875 ?auto_137876 ) ) ( not ( = ?auto_137875 ?auto_137878 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137878 ?auto_137876 ?auto_137873 )
      ( DELIVER-3PKG-VERIFY ?auto_137874 ?auto_137875 ?auto_137876 ?auto_137873 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137886 - OBJ
      ?auto_137887 - OBJ
      ?auto_137888 - OBJ
      ?auto_137885 - LOCATION
    )
    :vars
    (
      ?auto_137891 - TRUCK
      ?auto_137892 - LOCATION
      ?auto_137889 - CITY
      ?auto_137890 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137891 ?auto_137892 ) ( IN-CITY ?auto_137892 ?auto_137889 ) ( IN-CITY ?auto_137885 ?auto_137889 ) ( not ( = ?auto_137885 ?auto_137892 ) ) ( OBJ-AT ?auto_137890 ?auto_137885 ) ( not ( = ?auto_137890 ?auto_137887 ) ) ( OBJ-AT ?auto_137887 ?auto_137892 ) ( OBJ-AT ?auto_137886 ?auto_137885 ) ( OBJ-AT ?auto_137888 ?auto_137885 ) ( not ( = ?auto_137886 ?auto_137887 ) ) ( not ( = ?auto_137886 ?auto_137888 ) ) ( not ( = ?auto_137886 ?auto_137890 ) ) ( not ( = ?auto_137887 ?auto_137888 ) ) ( not ( = ?auto_137888 ?auto_137890 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137890 ?auto_137887 ?auto_137885 )
      ( DELIVER-3PKG-VERIFY ?auto_137886 ?auto_137887 ?auto_137888 ?auto_137885 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137924 - OBJ
      ?auto_137925 - OBJ
      ?auto_137926 - OBJ
      ?auto_137923 - LOCATION
    )
    :vars
    (
      ?auto_137929 - TRUCK
      ?auto_137930 - LOCATION
      ?auto_137927 - CITY
      ?auto_137928 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137929 ?auto_137930 ) ( IN-CITY ?auto_137930 ?auto_137927 ) ( IN-CITY ?auto_137923 ?auto_137927 ) ( not ( = ?auto_137923 ?auto_137930 ) ) ( OBJ-AT ?auto_137928 ?auto_137923 ) ( not ( = ?auto_137928 ?auto_137924 ) ) ( OBJ-AT ?auto_137924 ?auto_137930 ) ( OBJ-AT ?auto_137925 ?auto_137923 ) ( OBJ-AT ?auto_137926 ?auto_137923 ) ( not ( = ?auto_137924 ?auto_137925 ) ) ( not ( = ?auto_137924 ?auto_137926 ) ) ( not ( = ?auto_137925 ?auto_137926 ) ) ( not ( = ?auto_137925 ?auto_137928 ) ) ( not ( = ?auto_137926 ?auto_137928 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137928 ?auto_137924 ?auto_137923 )
      ( DELIVER-3PKG-VERIFY ?auto_137924 ?auto_137925 ?auto_137926 ?auto_137923 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137963 - OBJ
      ?auto_137964 - OBJ
      ?auto_137965 - OBJ
      ?auto_137966 - OBJ
      ?auto_137962 - LOCATION
    )
    :vars
    (
      ?auto_137968 - TRUCK
      ?auto_137969 - LOCATION
      ?auto_137967 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_137968 ?auto_137969 ) ( IN-CITY ?auto_137969 ?auto_137967 ) ( IN-CITY ?auto_137962 ?auto_137967 ) ( not ( = ?auto_137962 ?auto_137969 ) ) ( OBJ-AT ?auto_137963 ?auto_137962 ) ( not ( = ?auto_137963 ?auto_137966 ) ) ( OBJ-AT ?auto_137966 ?auto_137969 ) ( OBJ-AT ?auto_137964 ?auto_137962 ) ( OBJ-AT ?auto_137965 ?auto_137962 ) ( not ( = ?auto_137963 ?auto_137964 ) ) ( not ( = ?auto_137963 ?auto_137965 ) ) ( not ( = ?auto_137964 ?auto_137965 ) ) ( not ( = ?auto_137964 ?auto_137966 ) ) ( not ( = ?auto_137965 ?auto_137966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137963 ?auto_137966 ?auto_137962 )
      ( DELIVER-4PKG-VERIFY ?auto_137963 ?auto_137964 ?auto_137965 ?auto_137966 ?auto_137962 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138043 - OBJ
      ?auto_138044 - OBJ
      ?auto_138045 - OBJ
      ?auto_138046 - OBJ
      ?auto_138042 - LOCATION
    )
    :vars
    (
      ?auto_138048 - TRUCK
      ?auto_138049 - LOCATION
      ?auto_138047 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138048 ?auto_138049 ) ( IN-CITY ?auto_138049 ?auto_138047 ) ( IN-CITY ?auto_138042 ?auto_138047 ) ( not ( = ?auto_138042 ?auto_138049 ) ) ( OBJ-AT ?auto_138045 ?auto_138042 ) ( not ( = ?auto_138045 ?auto_138044 ) ) ( OBJ-AT ?auto_138044 ?auto_138049 ) ( OBJ-AT ?auto_138043 ?auto_138042 ) ( OBJ-AT ?auto_138046 ?auto_138042 ) ( not ( = ?auto_138043 ?auto_138044 ) ) ( not ( = ?auto_138043 ?auto_138045 ) ) ( not ( = ?auto_138043 ?auto_138046 ) ) ( not ( = ?auto_138044 ?auto_138046 ) ) ( not ( = ?auto_138045 ?auto_138046 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138045 ?auto_138044 ?auto_138042 )
      ( DELIVER-4PKG-VERIFY ?auto_138043 ?auto_138044 ?auto_138045 ?auto_138046 ?auto_138042 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138051 - OBJ
      ?auto_138052 - OBJ
      ?auto_138053 - OBJ
      ?auto_138054 - OBJ
      ?auto_138050 - LOCATION
    )
    :vars
    (
      ?auto_138056 - TRUCK
      ?auto_138057 - LOCATION
      ?auto_138055 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138056 ?auto_138057 ) ( IN-CITY ?auto_138057 ?auto_138055 ) ( IN-CITY ?auto_138050 ?auto_138055 ) ( not ( = ?auto_138050 ?auto_138057 ) ) ( OBJ-AT ?auto_138051 ?auto_138050 ) ( not ( = ?auto_138051 ?auto_138052 ) ) ( OBJ-AT ?auto_138052 ?auto_138057 ) ( OBJ-AT ?auto_138053 ?auto_138050 ) ( OBJ-AT ?auto_138054 ?auto_138050 ) ( not ( = ?auto_138051 ?auto_138053 ) ) ( not ( = ?auto_138051 ?auto_138054 ) ) ( not ( = ?auto_138052 ?auto_138053 ) ) ( not ( = ?auto_138052 ?auto_138054 ) ) ( not ( = ?auto_138053 ?auto_138054 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138051 ?auto_138052 ?auto_138050 )
      ( DELIVER-4PKG-VERIFY ?auto_138051 ?auto_138052 ?auto_138053 ?auto_138054 ?auto_138050 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138131 - OBJ
      ?auto_138132 - OBJ
      ?auto_138133 - OBJ
      ?auto_138134 - OBJ
      ?auto_138130 - LOCATION
    )
    :vars
    (
      ?auto_138136 - TRUCK
      ?auto_138137 - LOCATION
      ?auto_138135 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138136 ?auto_138137 ) ( IN-CITY ?auto_138137 ?auto_138135 ) ( IN-CITY ?auto_138130 ?auto_138135 ) ( not ( = ?auto_138130 ?auto_138137 ) ) ( OBJ-AT ?auto_138132 ?auto_138130 ) ( not ( = ?auto_138132 ?auto_138133 ) ) ( OBJ-AT ?auto_138133 ?auto_138137 ) ( OBJ-AT ?auto_138131 ?auto_138130 ) ( OBJ-AT ?auto_138134 ?auto_138130 ) ( not ( = ?auto_138131 ?auto_138132 ) ) ( not ( = ?auto_138131 ?auto_138133 ) ) ( not ( = ?auto_138131 ?auto_138134 ) ) ( not ( = ?auto_138132 ?auto_138134 ) ) ( not ( = ?auto_138133 ?auto_138134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138132 ?auto_138133 ?auto_138130 )
      ( DELIVER-4PKG-VERIFY ?auto_138131 ?auto_138132 ?auto_138133 ?auto_138134 ?auto_138130 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138155 - OBJ
      ?auto_138156 - OBJ
      ?auto_138157 - OBJ
      ?auto_138158 - OBJ
      ?auto_138154 - LOCATION
    )
    :vars
    (
      ?auto_138160 - TRUCK
      ?auto_138161 - LOCATION
      ?auto_138159 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138160 ?auto_138161 ) ( IN-CITY ?auto_138161 ?auto_138159 ) ( IN-CITY ?auto_138154 ?auto_138159 ) ( not ( = ?auto_138154 ?auto_138161 ) ) ( OBJ-AT ?auto_138157 ?auto_138154 ) ( not ( = ?auto_138157 ?auto_138158 ) ) ( OBJ-AT ?auto_138158 ?auto_138161 ) ( OBJ-AT ?auto_138155 ?auto_138154 ) ( OBJ-AT ?auto_138156 ?auto_138154 ) ( not ( = ?auto_138155 ?auto_138156 ) ) ( not ( = ?auto_138155 ?auto_138157 ) ) ( not ( = ?auto_138155 ?auto_138158 ) ) ( not ( = ?auto_138156 ?auto_138157 ) ) ( not ( = ?auto_138156 ?auto_138158 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138157 ?auto_138158 ?auto_138154 )
      ( DELIVER-4PKG-VERIFY ?auto_138155 ?auto_138156 ?auto_138157 ?auto_138158 ?auto_138154 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138163 - OBJ
      ?auto_138164 - OBJ
      ?auto_138165 - OBJ
      ?auto_138166 - OBJ
      ?auto_138162 - LOCATION
    )
    :vars
    (
      ?auto_138169 - TRUCK
      ?auto_138170 - LOCATION
      ?auto_138167 - CITY
      ?auto_138168 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138169 ?auto_138170 ) ( IN-CITY ?auto_138170 ?auto_138167 ) ( IN-CITY ?auto_138162 ?auto_138167 ) ( not ( = ?auto_138162 ?auto_138170 ) ) ( OBJ-AT ?auto_138168 ?auto_138162 ) ( not ( = ?auto_138168 ?auto_138166 ) ) ( OBJ-AT ?auto_138166 ?auto_138170 ) ( OBJ-AT ?auto_138163 ?auto_138162 ) ( OBJ-AT ?auto_138164 ?auto_138162 ) ( OBJ-AT ?auto_138165 ?auto_138162 ) ( not ( = ?auto_138163 ?auto_138164 ) ) ( not ( = ?auto_138163 ?auto_138165 ) ) ( not ( = ?auto_138163 ?auto_138166 ) ) ( not ( = ?auto_138163 ?auto_138168 ) ) ( not ( = ?auto_138164 ?auto_138165 ) ) ( not ( = ?auto_138164 ?auto_138166 ) ) ( not ( = ?auto_138164 ?auto_138168 ) ) ( not ( = ?auto_138165 ?auto_138166 ) ) ( not ( = ?auto_138165 ?auto_138168 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138168 ?auto_138166 ?auto_138162 )
      ( DELIVER-4PKG-VERIFY ?auto_138163 ?auto_138164 ?auto_138165 ?auto_138166 ?auto_138162 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138172 - OBJ
      ?auto_138173 - OBJ
      ?auto_138174 - OBJ
      ?auto_138175 - OBJ
      ?auto_138171 - LOCATION
    )
    :vars
    (
      ?auto_138177 - TRUCK
      ?auto_138178 - LOCATION
      ?auto_138176 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138177 ?auto_138178 ) ( IN-CITY ?auto_138178 ?auto_138176 ) ( IN-CITY ?auto_138171 ?auto_138176 ) ( not ( = ?auto_138171 ?auto_138178 ) ) ( OBJ-AT ?auto_138175 ?auto_138171 ) ( not ( = ?auto_138175 ?auto_138174 ) ) ( OBJ-AT ?auto_138174 ?auto_138178 ) ( OBJ-AT ?auto_138172 ?auto_138171 ) ( OBJ-AT ?auto_138173 ?auto_138171 ) ( not ( = ?auto_138172 ?auto_138173 ) ) ( not ( = ?auto_138172 ?auto_138174 ) ) ( not ( = ?auto_138172 ?auto_138175 ) ) ( not ( = ?auto_138173 ?auto_138174 ) ) ( not ( = ?auto_138173 ?auto_138175 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138175 ?auto_138174 ?auto_138171 )
      ( DELIVER-4PKG-VERIFY ?auto_138172 ?auto_138173 ?auto_138174 ?auto_138175 ?auto_138171 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138180 - OBJ
      ?auto_138181 - OBJ
      ?auto_138182 - OBJ
      ?auto_138183 - OBJ
      ?auto_138179 - LOCATION
    )
    :vars
    (
      ?auto_138186 - TRUCK
      ?auto_138187 - LOCATION
      ?auto_138184 - CITY
      ?auto_138185 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138186 ?auto_138187 ) ( IN-CITY ?auto_138187 ?auto_138184 ) ( IN-CITY ?auto_138179 ?auto_138184 ) ( not ( = ?auto_138179 ?auto_138187 ) ) ( OBJ-AT ?auto_138185 ?auto_138179 ) ( not ( = ?auto_138185 ?auto_138182 ) ) ( OBJ-AT ?auto_138182 ?auto_138187 ) ( OBJ-AT ?auto_138180 ?auto_138179 ) ( OBJ-AT ?auto_138181 ?auto_138179 ) ( OBJ-AT ?auto_138183 ?auto_138179 ) ( not ( = ?auto_138180 ?auto_138181 ) ) ( not ( = ?auto_138180 ?auto_138182 ) ) ( not ( = ?auto_138180 ?auto_138183 ) ) ( not ( = ?auto_138180 ?auto_138185 ) ) ( not ( = ?auto_138181 ?auto_138182 ) ) ( not ( = ?auto_138181 ?auto_138183 ) ) ( not ( = ?auto_138181 ?auto_138185 ) ) ( not ( = ?auto_138182 ?auto_138183 ) ) ( not ( = ?auto_138183 ?auto_138185 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138185 ?auto_138182 ?auto_138179 )
      ( DELIVER-4PKG-VERIFY ?auto_138180 ?auto_138181 ?auto_138182 ?auto_138183 ?auto_138179 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138230 - OBJ
      ?auto_138231 - OBJ
      ?auto_138232 - OBJ
      ?auto_138233 - OBJ
      ?auto_138229 - LOCATION
    )
    :vars
    (
      ?auto_138236 - TRUCK
      ?auto_138237 - LOCATION
      ?auto_138234 - CITY
      ?auto_138235 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138236 ?auto_138237 ) ( IN-CITY ?auto_138237 ?auto_138234 ) ( IN-CITY ?auto_138229 ?auto_138234 ) ( not ( = ?auto_138229 ?auto_138237 ) ) ( OBJ-AT ?auto_138235 ?auto_138229 ) ( not ( = ?auto_138235 ?auto_138231 ) ) ( OBJ-AT ?auto_138231 ?auto_138237 ) ( OBJ-AT ?auto_138230 ?auto_138229 ) ( OBJ-AT ?auto_138232 ?auto_138229 ) ( OBJ-AT ?auto_138233 ?auto_138229 ) ( not ( = ?auto_138230 ?auto_138231 ) ) ( not ( = ?auto_138230 ?auto_138232 ) ) ( not ( = ?auto_138230 ?auto_138233 ) ) ( not ( = ?auto_138230 ?auto_138235 ) ) ( not ( = ?auto_138231 ?auto_138232 ) ) ( not ( = ?auto_138231 ?auto_138233 ) ) ( not ( = ?auto_138232 ?auto_138233 ) ) ( not ( = ?auto_138232 ?auto_138235 ) ) ( not ( = ?auto_138233 ?auto_138235 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138235 ?auto_138231 ?auto_138229 )
      ( DELIVER-4PKG-VERIFY ?auto_138230 ?auto_138231 ?auto_138232 ?auto_138233 ?auto_138229 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138282 - OBJ
      ?auto_138283 - OBJ
      ?auto_138284 - OBJ
      ?auto_138285 - OBJ
      ?auto_138281 - LOCATION
    )
    :vars
    (
      ?auto_138287 - TRUCK
      ?auto_138288 - LOCATION
      ?auto_138286 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138287 ?auto_138288 ) ( IN-CITY ?auto_138288 ?auto_138286 ) ( IN-CITY ?auto_138281 ?auto_138286 ) ( not ( = ?auto_138281 ?auto_138288 ) ) ( OBJ-AT ?auto_138283 ?auto_138281 ) ( not ( = ?auto_138283 ?auto_138282 ) ) ( OBJ-AT ?auto_138282 ?auto_138288 ) ( OBJ-AT ?auto_138284 ?auto_138281 ) ( OBJ-AT ?auto_138285 ?auto_138281 ) ( not ( = ?auto_138282 ?auto_138284 ) ) ( not ( = ?auto_138282 ?auto_138285 ) ) ( not ( = ?auto_138283 ?auto_138284 ) ) ( not ( = ?auto_138283 ?auto_138285 ) ) ( not ( = ?auto_138284 ?auto_138285 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138283 ?auto_138282 ?auto_138281 )
      ( DELIVER-4PKG-VERIFY ?auto_138282 ?auto_138283 ?auto_138284 ?auto_138285 ?auto_138281 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138298 - OBJ
      ?auto_138299 - OBJ
      ?auto_138300 - OBJ
      ?auto_138301 - OBJ
      ?auto_138297 - LOCATION
    )
    :vars
    (
      ?auto_138303 - TRUCK
      ?auto_138304 - LOCATION
      ?auto_138302 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138303 ?auto_138304 ) ( IN-CITY ?auto_138304 ?auto_138302 ) ( IN-CITY ?auto_138297 ?auto_138302 ) ( not ( = ?auto_138297 ?auto_138304 ) ) ( OBJ-AT ?auto_138301 ?auto_138297 ) ( not ( = ?auto_138301 ?auto_138298 ) ) ( OBJ-AT ?auto_138298 ?auto_138304 ) ( OBJ-AT ?auto_138299 ?auto_138297 ) ( OBJ-AT ?auto_138300 ?auto_138297 ) ( not ( = ?auto_138298 ?auto_138299 ) ) ( not ( = ?auto_138298 ?auto_138300 ) ) ( not ( = ?auto_138299 ?auto_138300 ) ) ( not ( = ?auto_138299 ?auto_138301 ) ) ( not ( = ?auto_138300 ?auto_138301 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138301 ?auto_138298 ?auto_138297 )
      ( DELIVER-4PKG-VERIFY ?auto_138298 ?auto_138299 ?auto_138300 ?auto_138301 ?auto_138297 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138378 - OBJ
      ?auto_138379 - OBJ
      ?auto_138380 - OBJ
      ?auto_138381 - OBJ
      ?auto_138377 - LOCATION
    )
    :vars
    (
      ?auto_138384 - TRUCK
      ?auto_138385 - LOCATION
      ?auto_138382 - CITY
      ?auto_138383 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138384 ?auto_138385 ) ( IN-CITY ?auto_138385 ?auto_138382 ) ( IN-CITY ?auto_138377 ?auto_138382 ) ( not ( = ?auto_138377 ?auto_138385 ) ) ( OBJ-AT ?auto_138383 ?auto_138377 ) ( not ( = ?auto_138383 ?auto_138378 ) ) ( OBJ-AT ?auto_138378 ?auto_138385 ) ( OBJ-AT ?auto_138379 ?auto_138377 ) ( OBJ-AT ?auto_138380 ?auto_138377 ) ( OBJ-AT ?auto_138381 ?auto_138377 ) ( not ( = ?auto_138378 ?auto_138379 ) ) ( not ( = ?auto_138378 ?auto_138380 ) ) ( not ( = ?auto_138378 ?auto_138381 ) ) ( not ( = ?auto_138379 ?auto_138380 ) ) ( not ( = ?auto_138379 ?auto_138381 ) ) ( not ( = ?auto_138379 ?auto_138383 ) ) ( not ( = ?auto_138380 ?auto_138381 ) ) ( not ( = ?auto_138380 ?auto_138383 ) ) ( not ( = ?auto_138381 ?auto_138383 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138383 ?auto_138378 ?auto_138377 )
      ( DELIVER-4PKG-VERIFY ?auto_138378 ?auto_138379 ?auto_138380 ?auto_138381 ?auto_138377 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138529 - OBJ
      ?auto_138530 - OBJ
      ?auto_138531 - OBJ
      ?auto_138528 - LOCATION
    )
    :vars
    (
      ?auto_138532 - LOCATION
      ?auto_138533 - CITY
      ?auto_138534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138532 ?auto_138533 ) ( IN-CITY ?auto_138528 ?auto_138533 ) ( not ( = ?auto_138528 ?auto_138532 ) ) ( OBJ-AT ?auto_138530 ?auto_138528 ) ( not ( = ?auto_138530 ?auto_138531 ) ) ( OBJ-AT ?auto_138531 ?auto_138532 ) ( TRUCK-AT ?auto_138534 ?auto_138528 ) ( OBJ-AT ?auto_138529 ?auto_138528 ) ( not ( = ?auto_138529 ?auto_138530 ) ) ( not ( = ?auto_138529 ?auto_138531 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138530 ?auto_138531 ?auto_138528 )
      ( DELIVER-3PKG-VERIFY ?auto_138529 ?auto_138530 ?auto_138531 ?auto_138528 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138562 - OBJ
      ?auto_138563 - OBJ
      ?auto_138564 - OBJ
      ?auto_138561 - LOCATION
    )
    :vars
    (
      ?auto_138566 - LOCATION
      ?auto_138567 - CITY
      ?auto_138565 - OBJ
      ?auto_138568 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138566 ?auto_138567 ) ( IN-CITY ?auto_138561 ?auto_138567 ) ( not ( = ?auto_138561 ?auto_138566 ) ) ( OBJ-AT ?auto_138565 ?auto_138561 ) ( not ( = ?auto_138565 ?auto_138564 ) ) ( OBJ-AT ?auto_138564 ?auto_138566 ) ( TRUCK-AT ?auto_138568 ?auto_138561 ) ( OBJ-AT ?auto_138562 ?auto_138561 ) ( OBJ-AT ?auto_138563 ?auto_138561 ) ( not ( = ?auto_138562 ?auto_138563 ) ) ( not ( = ?auto_138562 ?auto_138564 ) ) ( not ( = ?auto_138562 ?auto_138565 ) ) ( not ( = ?auto_138563 ?auto_138564 ) ) ( not ( = ?auto_138563 ?auto_138565 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138565 ?auto_138564 ?auto_138561 )
      ( DELIVER-3PKG-VERIFY ?auto_138562 ?auto_138563 ?auto_138564 ?auto_138561 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138574 - OBJ
      ?auto_138575 - OBJ
      ?auto_138576 - OBJ
      ?auto_138573 - LOCATION
    )
    :vars
    (
      ?auto_138578 - LOCATION
      ?auto_138579 - CITY
      ?auto_138577 - OBJ
      ?auto_138580 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138578 ?auto_138579 ) ( IN-CITY ?auto_138573 ?auto_138579 ) ( not ( = ?auto_138573 ?auto_138578 ) ) ( OBJ-AT ?auto_138577 ?auto_138573 ) ( not ( = ?auto_138577 ?auto_138575 ) ) ( OBJ-AT ?auto_138575 ?auto_138578 ) ( TRUCK-AT ?auto_138580 ?auto_138573 ) ( OBJ-AT ?auto_138574 ?auto_138573 ) ( OBJ-AT ?auto_138576 ?auto_138573 ) ( not ( = ?auto_138574 ?auto_138575 ) ) ( not ( = ?auto_138574 ?auto_138576 ) ) ( not ( = ?auto_138574 ?auto_138577 ) ) ( not ( = ?auto_138575 ?auto_138576 ) ) ( not ( = ?auto_138576 ?auto_138577 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138577 ?auto_138575 ?auto_138573 )
      ( DELIVER-3PKG-VERIFY ?auto_138574 ?auto_138575 ?auto_138576 ?auto_138573 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138590 - OBJ
      ?auto_138591 - OBJ
      ?auto_138592 - OBJ
      ?auto_138589 - LOCATION
    )
    :vars
    (
      ?auto_138593 - LOCATION
      ?auto_138594 - CITY
      ?auto_138595 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138593 ?auto_138594 ) ( IN-CITY ?auto_138589 ?auto_138594 ) ( not ( = ?auto_138589 ?auto_138593 ) ) ( OBJ-AT ?auto_138592 ?auto_138589 ) ( not ( = ?auto_138592 ?auto_138590 ) ) ( OBJ-AT ?auto_138590 ?auto_138593 ) ( TRUCK-AT ?auto_138595 ?auto_138589 ) ( OBJ-AT ?auto_138591 ?auto_138589 ) ( not ( = ?auto_138590 ?auto_138591 ) ) ( not ( = ?auto_138591 ?auto_138592 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138592 ?auto_138590 ?auto_138589 )
      ( DELIVER-3PKG-VERIFY ?auto_138590 ?auto_138591 ?auto_138592 ?auto_138589 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138612 - OBJ
      ?auto_138613 - OBJ
      ?auto_138614 - OBJ
      ?auto_138611 - LOCATION
    )
    :vars
    (
      ?auto_138616 - LOCATION
      ?auto_138617 - CITY
      ?auto_138615 - OBJ
      ?auto_138618 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138616 ?auto_138617 ) ( IN-CITY ?auto_138611 ?auto_138617 ) ( not ( = ?auto_138611 ?auto_138616 ) ) ( OBJ-AT ?auto_138615 ?auto_138611 ) ( not ( = ?auto_138615 ?auto_138612 ) ) ( OBJ-AT ?auto_138612 ?auto_138616 ) ( TRUCK-AT ?auto_138618 ?auto_138611 ) ( OBJ-AT ?auto_138613 ?auto_138611 ) ( OBJ-AT ?auto_138614 ?auto_138611 ) ( not ( = ?auto_138612 ?auto_138613 ) ) ( not ( = ?auto_138612 ?auto_138614 ) ) ( not ( = ?auto_138613 ?auto_138614 ) ) ( not ( = ?auto_138613 ?auto_138615 ) ) ( not ( = ?auto_138614 ?auto_138615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138615 ?auto_138612 ?auto_138611 )
      ( DELIVER-3PKG-VERIFY ?auto_138612 ?auto_138613 ?auto_138614 ?auto_138611 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138659 - OBJ
      ?auto_138660 - OBJ
      ?auto_138661 - OBJ
      ?auto_138662 - OBJ
      ?auto_138658 - LOCATION
    )
    :vars
    (
      ?auto_138663 - LOCATION
      ?auto_138664 - CITY
      ?auto_138665 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138663 ?auto_138664 ) ( IN-CITY ?auto_138658 ?auto_138664 ) ( not ( = ?auto_138658 ?auto_138663 ) ) ( OBJ-AT ?auto_138659 ?auto_138658 ) ( not ( = ?auto_138659 ?auto_138662 ) ) ( OBJ-AT ?auto_138662 ?auto_138663 ) ( TRUCK-AT ?auto_138665 ?auto_138658 ) ( OBJ-AT ?auto_138660 ?auto_138658 ) ( OBJ-AT ?auto_138661 ?auto_138658 ) ( not ( = ?auto_138659 ?auto_138660 ) ) ( not ( = ?auto_138659 ?auto_138661 ) ) ( not ( = ?auto_138660 ?auto_138661 ) ) ( not ( = ?auto_138660 ?auto_138662 ) ) ( not ( = ?auto_138661 ?auto_138662 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138659 ?auto_138662 ?auto_138658 )
      ( DELIVER-4PKG-VERIFY ?auto_138659 ?auto_138660 ?auto_138661 ?auto_138662 ?auto_138658 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138667 - OBJ
      ?auto_138668 - OBJ
      ?auto_138669 - OBJ
      ?auto_138670 - OBJ
      ?auto_138666 - LOCATION
    )
    :vars
    (
      ?auto_138671 - LOCATION
      ?auto_138672 - CITY
      ?auto_138673 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138671 ?auto_138672 ) ( IN-CITY ?auto_138666 ?auto_138672 ) ( not ( = ?auto_138666 ?auto_138671 ) ) ( OBJ-AT ?auto_138670 ?auto_138666 ) ( not ( = ?auto_138670 ?auto_138669 ) ) ( OBJ-AT ?auto_138669 ?auto_138671 ) ( TRUCK-AT ?auto_138673 ?auto_138666 ) ( OBJ-AT ?auto_138667 ?auto_138666 ) ( OBJ-AT ?auto_138668 ?auto_138666 ) ( not ( = ?auto_138667 ?auto_138668 ) ) ( not ( = ?auto_138667 ?auto_138669 ) ) ( not ( = ?auto_138667 ?auto_138670 ) ) ( not ( = ?auto_138668 ?auto_138669 ) ) ( not ( = ?auto_138668 ?auto_138670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138670 ?auto_138669 ?auto_138666 )
      ( DELIVER-4PKG-VERIFY ?auto_138667 ?auto_138668 ?auto_138669 ?auto_138670 ?auto_138666 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138691 - OBJ
      ?auto_138692 - OBJ
      ?auto_138693 - OBJ
      ?auto_138694 - OBJ
      ?auto_138690 - LOCATION
    )
    :vars
    (
      ?auto_138695 - LOCATION
      ?auto_138696 - CITY
      ?auto_138697 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138695 ?auto_138696 ) ( IN-CITY ?auto_138690 ?auto_138696 ) ( not ( = ?auto_138690 ?auto_138695 ) ) ( OBJ-AT ?auto_138693 ?auto_138690 ) ( not ( = ?auto_138693 ?auto_138694 ) ) ( OBJ-AT ?auto_138694 ?auto_138695 ) ( TRUCK-AT ?auto_138697 ?auto_138690 ) ( OBJ-AT ?auto_138691 ?auto_138690 ) ( OBJ-AT ?auto_138692 ?auto_138690 ) ( not ( = ?auto_138691 ?auto_138692 ) ) ( not ( = ?auto_138691 ?auto_138693 ) ) ( not ( = ?auto_138691 ?auto_138694 ) ) ( not ( = ?auto_138692 ?auto_138693 ) ) ( not ( = ?auto_138692 ?auto_138694 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138693 ?auto_138694 ?auto_138690 )
      ( DELIVER-4PKG-VERIFY ?auto_138691 ?auto_138692 ?auto_138693 ?auto_138694 ?auto_138690 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138731 - OBJ
      ?auto_138732 - OBJ
      ?auto_138733 - OBJ
      ?auto_138734 - OBJ
      ?auto_138730 - LOCATION
    )
    :vars
    (
      ?auto_138735 - LOCATION
      ?auto_138736 - CITY
      ?auto_138737 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138735 ?auto_138736 ) ( IN-CITY ?auto_138730 ?auto_138736 ) ( not ( = ?auto_138730 ?auto_138735 ) ) ( OBJ-AT ?auto_138731 ?auto_138730 ) ( not ( = ?auto_138731 ?auto_138732 ) ) ( OBJ-AT ?auto_138732 ?auto_138735 ) ( TRUCK-AT ?auto_138737 ?auto_138730 ) ( OBJ-AT ?auto_138733 ?auto_138730 ) ( OBJ-AT ?auto_138734 ?auto_138730 ) ( not ( = ?auto_138731 ?auto_138733 ) ) ( not ( = ?auto_138731 ?auto_138734 ) ) ( not ( = ?auto_138732 ?auto_138733 ) ) ( not ( = ?auto_138732 ?auto_138734 ) ) ( not ( = ?auto_138733 ?auto_138734 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138731 ?auto_138732 ?auto_138730 )
      ( DELIVER-4PKG-VERIFY ?auto_138731 ?auto_138732 ?auto_138733 ?auto_138734 ?auto_138730 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138755 - OBJ
      ?auto_138756 - OBJ
      ?auto_138757 - OBJ
      ?auto_138758 - OBJ
      ?auto_138754 - LOCATION
    )
    :vars
    (
      ?auto_138759 - LOCATION
      ?auto_138760 - CITY
      ?auto_138761 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138759 ?auto_138760 ) ( IN-CITY ?auto_138754 ?auto_138760 ) ( not ( = ?auto_138754 ?auto_138759 ) ) ( OBJ-AT ?auto_138758 ?auto_138754 ) ( not ( = ?auto_138758 ?auto_138756 ) ) ( OBJ-AT ?auto_138756 ?auto_138759 ) ( TRUCK-AT ?auto_138761 ?auto_138754 ) ( OBJ-AT ?auto_138755 ?auto_138754 ) ( OBJ-AT ?auto_138757 ?auto_138754 ) ( not ( = ?auto_138755 ?auto_138756 ) ) ( not ( = ?auto_138755 ?auto_138757 ) ) ( not ( = ?auto_138755 ?auto_138758 ) ) ( not ( = ?auto_138756 ?auto_138757 ) ) ( not ( = ?auto_138757 ?auto_138758 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138758 ?auto_138756 ?auto_138754 )
      ( DELIVER-4PKG-VERIFY ?auto_138755 ?auto_138756 ?auto_138757 ?auto_138758 ?auto_138754 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138819 - OBJ
      ?auto_138820 - OBJ
      ?auto_138821 - OBJ
      ?auto_138822 - OBJ
      ?auto_138818 - LOCATION
    )
    :vars
    (
      ?auto_138823 - LOCATION
      ?auto_138824 - CITY
      ?auto_138825 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138823 ?auto_138824 ) ( IN-CITY ?auto_138818 ?auto_138824 ) ( not ( = ?auto_138818 ?auto_138823 ) ) ( OBJ-AT ?auto_138820 ?auto_138818 ) ( not ( = ?auto_138820 ?auto_138821 ) ) ( OBJ-AT ?auto_138821 ?auto_138823 ) ( TRUCK-AT ?auto_138825 ?auto_138818 ) ( OBJ-AT ?auto_138819 ?auto_138818 ) ( OBJ-AT ?auto_138822 ?auto_138818 ) ( not ( = ?auto_138819 ?auto_138820 ) ) ( not ( = ?auto_138819 ?auto_138821 ) ) ( not ( = ?auto_138819 ?auto_138822 ) ) ( not ( = ?auto_138820 ?auto_138822 ) ) ( not ( = ?auto_138821 ?auto_138822 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138820 ?auto_138821 ?auto_138818 )
      ( DELIVER-4PKG-VERIFY ?auto_138819 ?auto_138820 ?auto_138821 ?auto_138822 ?auto_138818 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138851 - OBJ
      ?auto_138852 - OBJ
      ?auto_138853 - OBJ
      ?auto_138854 - OBJ
      ?auto_138850 - LOCATION
    )
    :vars
    (
      ?auto_138856 - LOCATION
      ?auto_138857 - CITY
      ?auto_138855 - OBJ
      ?auto_138858 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138856 ?auto_138857 ) ( IN-CITY ?auto_138850 ?auto_138857 ) ( not ( = ?auto_138850 ?auto_138856 ) ) ( OBJ-AT ?auto_138855 ?auto_138850 ) ( not ( = ?auto_138855 ?auto_138854 ) ) ( OBJ-AT ?auto_138854 ?auto_138856 ) ( TRUCK-AT ?auto_138858 ?auto_138850 ) ( OBJ-AT ?auto_138851 ?auto_138850 ) ( OBJ-AT ?auto_138852 ?auto_138850 ) ( OBJ-AT ?auto_138853 ?auto_138850 ) ( not ( = ?auto_138851 ?auto_138852 ) ) ( not ( = ?auto_138851 ?auto_138853 ) ) ( not ( = ?auto_138851 ?auto_138854 ) ) ( not ( = ?auto_138851 ?auto_138855 ) ) ( not ( = ?auto_138852 ?auto_138853 ) ) ( not ( = ?auto_138852 ?auto_138854 ) ) ( not ( = ?auto_138852 ?auto_138855 ) ) ( not ( = ?auto_138853 ?auto_138854 ) ) ( not ( = ?auto_138853 ?auto_138855 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138855 ?auto_138854 ?auto_138850 )
      ( DELIVER-4PKG-VERIFY ?auto_138851 ?auto_138852 ?auto_138853 ?auto_138854 ?auto_138850 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138868 - OBJ
      ?auto_138869 - OBJ
      ?auto_138870 - OBJ
      ?auto_138871 - OBJ
      ?auto_138867 - LOCATION
    )
    :vars
    (
      ?auto_138873 - LOCATION
      ?auto_138874 - CITY
      ?auto_138872 - OBJ
      ?auto_138875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138873 ?auto_138874 ) ( IN-CITY ?auto_138867 ?auto_138874 ) ( not ( = ?auto_138867 ?auto_138873 ) ) ( OBJ-AT ?auto_138872 ?auto_138867 ) ( not ( = ?auto_138872 ?auto_138870 ) ) ( OBJ-AT ?auto_138870 ?auto_138873 ) ( TRUCK-AT ?auto_138875 ?auto_138867 ) ( OBJ-AT ?auto_138868 ?auto_138867 ) ( OBJ-AT ?auto_138869 ?auto_138867 ) ( OBJ-AT ?auto_138871 ?auto_138867 ) ( not ( = ?auto_138868 ?auto_138869 ) ) ( not ( = ?auto_138868 ?auto_138870 ) ) ( not ( = ?auto_138868 ?auto_138871 ) ) ( not ( = ?auto_138868 ?auto_138872 ) ) ( not ( = ?auto_138869 ?auto_138870 ) ) ( not ( = ?auto_138869 ?auto_138871 ) ) ( not ( = ?auto_138869 ?auto_138872 ) ) ( not ( = ?auto_138870 ?auto_138871 ) ) ( not ( = ?auto_138871 ?auto_138872 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138872 ?auto_138870 ?auto_138867 )
      ( DELIVER-4PKG-VERIFY ?auto_138868 ?auto_138869 ?auto_138870 ?auto_138871 ?auto_138867 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138918 - OBJ
      ?auto_138919 - OBJ
      ?auto_138920 - OBJ
      ?auto_138921 - OBJ
      ?auto_138917 - LOCATION
    )
    :vars
    (
      ?auto_138923 - LOCATION
      ?auto_138924 - CITY
      ?auto_138922 - OBJ
      ?auto_138925 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138923 ?auto_138924 ) ( IN-CITY ?auto_138917 ?auto_138924 ) ( not ( = ?auto_138917 ?auto_138923 ) ) ( OBJ-AT ?auto_138922 ?auto_138917 ) ( not ( = ?auto_138922 ?auto_138919 ) ) ( OBJ-AT ?auto_138919 ?auto_138923 ) ( TRUCK-AT ?auto_138925 ?auto_138917 ) ( OBJ-AT ?auto_138918 ?auto_138917 ) ( OBJ-AT ?auto_138920 ?auto_138917 ) ( OBJ-AT ?auto_138921 ?auto_138917 ) ( not ( = ?auto_138918 ?auto_138919 ) ) ( not ( = ?auto_138918 ?auto_138920 ) ) ( not ( = ?auto_138918 ?auto_138921 ) ) ( not ( = ?auto_138918 ?auto_138922 ) ) ( not ( = ?auto_138919 ?auto_138920 ) ) ( not ( = ?auto_138919 ?auto_138921 ) ) ( not ( = ?auto_138920 ?auto_138921 ) ) ( not ( = ?auto_138920 ?auto_138922 ) ) ( not ( = ?auto_138921 ?auto_138922 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138922 ?auto_138919 ?auto_138917 )
      ( DELIVER-4PKG-VERIFY ?auto_138918 ?auto_138919 ?auto_138920 ?auto_138921 ?auto_138917 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138970 - OBJ
      ?auto_138971 - OBJ
      ?auto_138972 - OBJ
      ?auto_138973 - OBJ
      ?auto_138969 - LOCATION
    )
    :vars
    (
      ?auto_138974 - LOCATION
      ?auto_138975 - CITY
      ?auto_138976 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138974 ?auto_138975 ) ( IN-CITY ?auto_138969 ?auto_138975 ) ( not ( = ?auto_138969 ?auto_138974 ) ) ( OBJ-AT ?auto_138971 ?auto_138969 ) ( not ( = ?auto_138971 ?auto_138970 ) ) ( OBJ-AT ?auto_138970 ?auto_138974 ) ( TRUCK-AT ?auto_138976 ?auto_138969 ) ( OBJ-AT ?auto_138972 ?auto_138969 ) ( OBJ-AT ?auto_138973 ?auto_138969 ) ( not ( = ?auto_138970 ?auto_138972 ) ) ( not ( = ?auto_138970 ?auto_138973 ) ) ( not ( = ?auto_138971 ?auto_138972 ) ) ( not ( = ?auto_138971 ?auto_138973 ) ) ( not ( = ?auto_138972 ?auto_138973 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138971 ?auto_138970 ?auto_138969 )
      ( DELIVER-4PKG-VERIFY ?auto_138970 ?auto_138971 ?auto_138972 ?auto_138973 ?auto_138969 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139034 - OBJ
      ?auto_139035 - OBJ
      ?auto_139036 - OBJ
      ?auto_139037 - OBJ
      ?auto_139033 - LOCATION
    )
    :vars
    (
      ?auto_139038 - LOCATION
      ?auto_139039 - CITY
      ?auto_139040 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139038 ?auto_139039 ) ( IN-CITY ?auto_139033 ?auto_139039 ) ( not ( = ?auto_139033 ?auto_139038 ) ) ( OBJ-AT ?auto_139037 ?auto_139033 ) ( not ( = ?auto_139037 ?auto_139034 ) ) ( OBJ-AT ?auto_139034 ?auto_139038 ) ( TRUCK-AT ?auto_139040 ?auto_139033 ) ( OBJ-AT ?auto_139035 ?auto_139033 ) ( OBJ-AT ?auto_139036 ?auto_139033 ) ( not ( = ?auto_139034 ?auto_139035 ) ) ( not ( = ?auto_139034 ?auto_139036 ) ) ( not ( = ?auto_139035 ?auto_139036 ) ) ( not ( = ?auto_139035 ?auto_139037 ) ) ( not ( = ?auto_139036 ?auto_139037 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139037 ?auto_139034 ?auto_139033 )
      ( DELIVER-4PKG-VERIFY ?auto_139034 ?auto_139035 ?auto_139036 ?auto_139037 ?auto_139033 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139066 - OBJ
      ?auto_139067 - OBJ
      ?auto_139068 - OBJ
      ?auto_139069 - OBJ
      ?auto_139065 - LOCATION
    )
    :vars
    (
      ?auto_139071 - LOCATION
      ?auto_139072 - CITY
      ?auto_139070 - OBJ
      ?auto_139073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139071 ?auto_139072 ) ( IN-CITY ?auto_139065 ?auto_139072 ) ( not ( = ?auto_139065 ?auto_139071 ) ) ( OBJ-AT ?auto_139070 ?auto_139065 ) ( not ( = ?auto_139070 ?auto_139066 ) ) ( OBJ-AT ?auto_139066 ?auto_139071 ) ( TRUCK-AT ?auto_139073 ?auto_139065 ) ( OBJ-AT ?auto_139067 ?auto_139065 ) ( OBJ-AT ?auto_139068 ?auto_139065 ) ( OBJ-AT ?auto_139069 ?auto_139065 ) ( not ( = ?auto_139066 ?auto_139067 ) ) ( not ( = ?auto_139066 ?auto_139068 ) ) ( not ( = ?auto_139066 ?auto_139069 ) ) ( not ( = ?auto_139067 ?auto_139068 ) ) ( not ( = ?auto_139067 ?auto_139069 ) ) ( not ( = ?auto_139067 ?auto_139070 ) ) ( not ( = ?auto_139068 ?auto_139069 ) ) ( not ( = ?auto_139068 ?auto_139070 ) ) ( not ( = ?auto_139069 ?auto_139070 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139070 ?auto_139066 ?auto_139065 )
      ( DELIVER-4PKG-VERIFY ?auto_139066 ?auto_139067 ?auto_139068 ?auto_139069 ?auto_139065 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139229 - OBJ
      ?auto_139230 - OBJ
      ?auto_139231 - OBJ
      ?auto_139228 - LOCATION
    )
    :vars
    (
      ?auto_139232 - LOCATION
      ?auto_139233 - CITY
      ?auto_139234 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139232 ?auto_139233 ) ( IN-CITY ?auto_139228 ?auto_139233 ) ( not ( = ?auto_139228 ?auto_139232 ) ) ( OBJ-AT ?auto_139229 ?auto_139228 ) ( not ( = ?auto_139229 ?auto_139230 ) ) ( OBJ-AT ?auto_139230 ?auto_139232 ) ( TRUCK-AT ?auto_139234 ?auto_139228 ) ( OBJ-AT ?auto_139231 ?auto_139228 ) ( not ( = ?auto_139229 ?auto_139231 ) ) ( not ( = ?auto_139230 ?auto_139231 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139229 ?auto_139230 ?auto_139228 )
      ( DELIVER-3PKG-VERIFY ?auto_139229 ?auto_139230 ?auto_139231 ?auto_139228 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147097 - OBJ
      ?auto_147098 - OBJ
      ?auto_147099 - OBJ
      ?auto_147096 - LOCATION
    )
    :vars
    (
      ?auto_147100 - TRUCK
      ?auto_147101 - LOCATION
      ?auto_147102 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_147098 ?auto_147100 ) ( TRUCK-AT ?auto_147100 ?auto_147101 ) ( IN-CITY ?auto_147101 ?auto_147102 ) ( IN-CITY ?auto_147096 ?auto_147102 ) ( not ( = ?auto_147096 ?auto_147101 ) ) ( OBJ-AT ?auto_147097 ?auto_147096 ) ( not ( = ?auto_147097 ?auto_147098 ) ) ( OBJ-AT ?auto_147099 ?auto_147096 ) ( not ( = ?auto_147097 ?auto_147099 ) ) ( not ( = ?auto_147098 ?auto_147099 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_147097 ?auto_147098 ?auto_147096 )
      ( DELIVER-3PKG-VERIFY ?auto_147097 ?auto_147098 ?auto_147099 ?auto_147096 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_153749 - OBJ
      ?auto_153748 - LOCATION
    )
    :vars
    (
      ?auto_153753 - LOCATION
      ?auto_153750 - CITY
      ?auto_153751 - OBJ
      ?auto_153752 - TRUCK
      ?auto_153754 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153753 ?auto_153750 ) ( IN-CITY ?auto_153748 ?auto_153750 ) ( not ( = ?auto_153748 ?auto_153753 ) ) ( OBJ-AT ?auto_153751 ?auto_153748 ) ( not ( = ?auto_153751 ?auto_153749 ) ) ( OBJ-AT ?auto_153749 ?auto_153753 ) ( TRUCK-AT ?auto_153752 ?auto_153754 ) ( IN-CITY ?auto_153754 ?auto_153750 ) ( not ( = ?auto_153748 ?auto_153754 ) ) ( not ( = ?auto_153753 ?auto_153754 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_153752 ?auto_153754 ?auto_153748 ?auto_153750 )
      ( DELIVER-2PKG ?auto_153751 ?auto_153749 ?auto_153748 )
      ( DELIVER-1PKG-VERIFY ?auto_153749 ?auto_153748 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_153756 - OBJ
      ?auto_153757 - OBJ
      ?auto_153755 - LOCATION
    )
    :vars
    (
      ?auto_153760 - LOCATION
      ?auto_153758 - CITY
      ?auto_153759 - TRUCK
      ?auto_153761 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153760 ?auto_153758 ) ( IN-CITY ?auto_153755 ?auto_153758 ) ( not ( = ?auto_153755 ?auto_153760 ) ) ( OBJ-AT ?auto_153756 ?auto_153755 ) ( not ( = ?auto_153756 ?auto_153757 ) ) ( OBJ-AT ?auto_153757 ?auto_153760 ) ( TRUCK-AT ?auto_153759 ?auto_153761 ) ( IN-CITY ?auto_153761 ?auto_153758 ) ( not ( = ?auto_153755 ?auto_153761 ) ) ( not ( = ?auto_153760 ?auto_153761 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_153757 ?auto_153755 )
      ( DELIVER-2PKG-VERIFY ?auto_153756 ?auto_153757 ?auto_153755 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_153774 - OBJ
      ?auto_153775 - OBJ
      ?auto_153773 - LOCATION
    )
    :vars
    (
      ?auto_153778 - LOCATION
      ?auto_153779 - CITY
      ?auto_153776 - TRUCK
      ?auto_153777 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153778 ?auto_153779 ) ( IN-CITY ?auto_153773 ?auto_153779 ) ( not ( = ?auto_153773 ?auto_153778 ) ) ( OBJ-AT ?auto_153775 ?auto_153773 ) ( not ( = ?auto_153775 ?auto_153774 ) ) ( OBJ-AT ?auto_153774 ?auto_153778 ) ( TRUCK-AT ?auto_153776 ?auto_153777 ) ( IN-CITY ?auto_153777 ?auto_153779 ) ( not ( = ?auto_153773 ?auto_153777 ) ) ( not ( = ?auto_153778 ?auto_153777 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153775 ?auto_153774 ?auto_153773 )
      ( DELIVER-2PKG-VERIFY ?auto_153774 ?auto_153775 ?auto_153773 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153800 - OBJ
      ?auto_153801 - OBJ
      ?auto_153802 - OBJ
      ?auto_153799 - LOCATION
    )
    :vars
    (
      ?auto_153805 - LOCATION
      ?auto_153806 - CITY
      ?auto_153803 - TRUCK
      ?auto_153804 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153805 ?auto_153806 ) ( IN-CITY ?auto_153799 ?auto_153806 ) ( not ( = ?auto_153799 ?auto_153805 ) ) ( OBJ-AT ?auto_153801 ?auto_153799 ) ( not ( = ?auto_153801 ?auto_153802 ) ) ( OBJ-AT ?auto_153802 ?auto_153805 ) ( TRUCK-AT ?auto_153803 ?auto_153804 ) ( IN-CITY ?auto_153804 ?auto_153806 ) ( not ( = ?auto_153799 ?auto_153804 ) ) ( not ( = ?auto_153805 ?auto_153804 ) ) ( OBJ-AT ?auto_153800 ?auto_153799 ) ( not ( = ?auto_153800 ?auto_153801 ) ) ( not ( = ?auto_153800 ?auto_153802 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153801 ?auto_153802 ?auto_153799 )
      ( DELIVER-3PKG-VERIFY ?auto_153800 ?auto_153801 ?auto_153802 ?auto_153799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153820 - OBJ
      ?auto_153821 - OBJ
      ?auto_153822 - OBJ
      ?auto_153819 - LOCATION
    )
    :vars
    (
      ?auto_153825 - LOCATION
      ?auto_153826 - CITY
      ?auto_153823 - TRUCK
      ?auto_153824 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153825 ?auto_153826 ) ( IN-CITY ?auto_153819 ?auto_153826 ) ( not ( = ?auto_153819 ?auto_153825 ) ) ( OBJ-AT ?auto_153820 ?auto_153819 ) ( not ( = ?auto_153820 ?auto_153821 ) ) ( OBJ-AT ?auto_153821 ?auto_153825 ) ( TRUCK-AT ?auto_153823 ?auto_153824 ) ( IN-CITY ?auto_153824 ?auto_153826 ) ( not ( = ?auto_153819 ?auto_153824 ) ) ( not ( = ?auto_153825 ?auto_153824 ) ) ( OBJ-AT ?auto_153822 ?auto_153819 ) ( not ( = ?auto_153820 ?auto_153822 ) ) ( not ( = ?auto_153821 ?auto_153822 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153820 ?auto_153821 ?auto_153819 )
      ( DELIVER-3PKG-VERIFY ?auto_153820 ?auto_153821 ?auto_153822 ?auto_153819 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153852 - OBJ
      ?auto_153853 - OBJ
      ?auto_153854 - OBJ
      ?auto_153851 - LOCATION
    )
    :vars
    (
      ?auto_153858 - LOCATION
      ?auto_153859 - CITY
      ?auto_153856 - OBJ
      ?auto_153855 - TRUCK
      ?auto_153857 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153858 ?auto_153859 ) ( IN-CITY ?auto_153851 ?auto_153859 ) ( not ( = ?auto_153851 ?auto_153858 ) ) ( OBJ-AT ?auto_153856 ?auto_153851 ) ( not ( = ?auto_153856 ?auto_153854 ) ) ( OBJ-AT ?auto_153854 ?auto_153858 ) ( TRUCK-AT ?auto_153855 ?auto_153857 ) ( IN-CITY ?auto_153857 ?auto_153859 ) ( not ( = ?auto_153851 ?auto_153857 ) ) ( not ( = ?auto_153858 ?auto_153857 ) ) ( OBJ-AT ?auto_153852 ?auto_153851 ) ( OBJ-AT ?auto_153853 ?auto_153851 ) ( not ( = ?auto_153852 ?auto_153853 ) ) ( not ( = ?auto_153852 ?auto_153854 ) ) ( not ( = ?auto_153852 ?auto_153856 ) ) ( not ( = ?auto_153853 ?auto_153854 ) ) ( not ( = ?auto_153853 ?auto_153856 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153856 ?auto_153854 ?auto_153851 )
      ( DELIVER-3PKG-VERIFY ?auto_153852 ?auto_153853 ?auto_153854 ?auto_153851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153874 - OBJ
      ?auto_153875 - OBJ
      ?auto_153876 - OBJ
      ?auto_153873 - LOCATION
    )
    :vars
    (
      ?auto_153880 - LOCATION
      ?auto_153881 - CITY
      ?auto_153878 - OBJ
      ?auto_153877 - TRUCK
      ?auto_153879 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153880 ?auto_153881 ) ( IN-CITY ?auto_153873 ?auto_153881 ) ( not ( = ?auto_153873 ?auto_153880 ) ) ( OBJ-AT ?auto_153878 ?auto_153873 ) ( not ( = ?auto_153878 ?auto_153875 ) ) ( OBJ-AT ?auto_153875 ?auto_153880 ) ( TRUCK-AT ?auto_153877 ?auto_153879 ) ( IN-CITY ?auto_153879 ?auto_153881 ) ( not ( = ?auto_153873 ?auto_153879 ) ) ( not ( = ?auto_153880 ?auto_153879 ) ) ( OBJ-AT ?auto_153874 ?auto_153873 ) ( OBJ-AT ?auto_153876 ?auto_153873 ) ( not ( = ?auto_153874 ?auto_153875 ) ) ( not ( = ?auto_153874 ?auto_153876 ) ) ( not ( = ?auto_153874 ?auto_153878 ) ) ( not ( = ?auto_153875 ?auto_153876 ) ) ( not ( = ?auto_153876 ?auto_153878 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153878 ?auto_153875 ?auto_153873 )
      ( DELIVER-3PKG-VERIFY ?auto_153874 ?auto_153875 ?auto_153876 ?auto_153873 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153962 - OBJ
      ?auto_153963 - OBJ
      ?auto_153964 - OBJ
      ?auto_153961 - LOCATION
    )
    :vars
    (
      ?auto_153967 - LOCATION
      ?auto_153968 - CITY
      ?auto_153965 - TRUCK
      ?auto_153966 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_153967 ?auto_153968 ) ( IN-CITY ?auto_153961 ?auto_153968 ) ( not ( = ?auto_153961 ?auto_153967 ) ) ( OBJ-AT ?auto_153964 ?auto_153961 ) ( not ( = ?auto_153964 ?auto_153962 ) ) ( OBJ-AT ?auto_153962 ?auto_153967 ) ( TRUCK-AT ?auto_153965 ?auto_153966 ) ( IN-CITY ?auto_153966 ?auto_153968 ) ( not ( = ?auto_153961 ?auto_153966 ) ) ( not ( = ?auto_153967 ?auto_153966 ) ) ( OBJ-AT ?auto_153963 ?auto_153961 ) ( not ( = ?auto_153962 ?auto_153963 ) ) ( not ( = ?auto_153963 ?auto_153964 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153964 ?auto_153962 ?auto_153961 )
      ( DELIVER-3PKG-VERIFY ?auto_153962 ?auto_153963 ?auto_153964 ?auto_153961 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_153994 - OBJ
      ?auto_153995 - OBJ
      ?auto_153996 - OBJ
      ?auto_153993 - LOCATION
    )
    :vars
    (
      ?auto_154000 - LOCATION
      ?auto_154001 - CITY
      ?auto_153998 - OBJ
      ?auto_153997 - TRUCK
      ?auto_153999 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154000 ?auto_154001 ) ( IN-CITY ?auto_153993 ?auto_154001 ) ( not ( = ?auto_153993 ?auto_154000 ) ) ( OBJ-AT ?auto_153998 ?auto_153993 ) ( not ( = ?auto_153998 ?auto_153994 ) ) ( OBJ-AT ?auto_153994 ?auto_154000 ) ( TRUCK-AT ?auto_153997 ?auto_153999 ) ( IN-CITY ?auto_153999 ?auto_154001 ) ( not ( = ?auto_153993 ?auto_153999 ) ) ( not ( = ?auto_154000 ?auto_153999 ) ) ( OBJ-AT ?auto_153995 ?auto_153993 ) ( OBJ-AT ?auto_153996 ?auto_153993 ) ( not ( = ?auto_153994 ?auto_153995 ) ) ( not ( = ?auto_153994 ?auto_153996 ) ) ( not ( = ?auto_153995 ?auto_153996 ) ) ( not ( = ?auto_153995 ?auto_153998 ) ) ( not ( = ?auto_153996 ?auto_153998 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_153998 ?auto_153994 ?auto_153993 )
      ( DELIVER-3PKG-VERIFY ?auto_153994 ?auto_153995 ?auto_153996 ?auto_153993 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154091 - OBJ
      ?auto_154092 - OBJ
      ?auto_154093 - OBJ
      ?auto_154094 - OBJ
      ?auto_154090 - LOCATION
    )
    :vars
    (
      ?auto_154097 - LOCATION
      ?auto_154098 - CITY
      ?auto_154095 - TRUCK
      ?auto_154096 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154097 ?auto_154098 ) ( IN-CITY ?auto_154090 ?auto_154098 ) ( not ( = ?auto_154090 ?auto_154097 ) ) ( OBJ-AT ?auto_154091 ?auto_154090 ) ( not ( = ?auto_154091 ?auto_154094 ) ) ( OBJ-AT ?auto_154094 ?auto_154097 ) ( TRUCK-AT ?auto_154095 ?auto_154096 ) ( IN-CITY ?auto_154096 ?auto_154098 ) ( not ( = ?auto_154090 ?auto_154096 ) ) ( not ( = ?auto_154097 ?auto_154096 ) ) ( OBJ-AT ?auto_154092 ?auto_154090 ) ( OBJ-AT ?auto_154093 ?auto_154090 ) ( not ( = ?auto_154091 ?auto_154092 ) ) ( not ( = ?auto_154091 ?auto_154093 ) ) ( not ( = ?auto_154092 ?auto_154093 ) ) ( not ( = ?auto_154092 ?auto_154094 ) ) ( not ( = ?auto_154093 ?auto_154094 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154091 ?auto_154094 ?auto_154090 )
      ( DELIVER-4PKG-VERIFY ?auto_154091 ?auto_154092 ?auto_154093 ?auto_154094 ?auto_154090 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154118 - OBJ
      ?auto_154119 - OBJ
      ?auto_154120 - OBJ
      ?auto_154121 - OBJ
      ?auto_154117 - LOCATION
    )
    :vars
    (
      ?auto_154124 - LOCATION
      ?auto_154125 - CITY
      ?auto_154122 - TRUCK
      ?auto_154123 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154124 ?auto_154125 ) ( IN-CITY ?auto_154117 ?auto_154125 ) ( not ( = ?auto_154117 ?auto_154124 ) ) ( OBJ-AT ?auto_154118 ?auto_154117 ) ( not ( = ?auto_154118 ?auto_154120 ) ) ( OBJ-AT ?auto_154120 ?auto_154124 ) ( TRUCK-AT ?auto_154122 ?auto_154123 ) ( IN-CITY ?auto_154123 ?auto_154125 ) ( not ( = ?auto_154117 ?auto_154123 ) ) ( not ( = ?auto_154124 ?auto_154123 ) ) ( OBJ-AT ?auto_154119 ?auto_154117 ) ( OBJ-AT ?auto_154121 ?auto_154117 ) ( not ( = ?auto_154118 ?auto_154119 ) ) ( not ( = ?auto_154118 ?auto_154121 ) ) ( not ( = ?auto_154119 ?auto_154120 ) ) ( not ( = ?auto_154119 ?auto_154121 ) ) ( not ( = ?auto_154120 ?auto_154121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154118 ?auto_154120 ?auto_154117 )
      ( DELIVER-4PKG-VERIFY ?auto_154118 ?auto_154119 ?auto_154120 ?auto_154121 ?auto_154117 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154154 - OBJ
      ?auto_154155 - OBJ
      ?auto_154156 - OBJ
      ?auto_154157 - OBJ
      ?auto_154153 - LOCATION
    )
    :vars
    (
      ?auto_154160 - LOCATION
      ?auto_154161 - CITY
      ?auto_154158 - TRUCK
      ?auto_154159 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154160 ?auto_154161 ) ( IN-CITY ?auto_154153 ?auto_154161 ) ( not ( = ?auto_154153 ?auto_154160 ) ) ( OBJ-AT ?auto_154156 ?auto_154153 ) ( not ( = ?auto_154156 ?auto_154157 ) ) ( OBJ-AT ?auto_154157 ?auto_154160 ) ( TRUCK-AT ?auto_154158 ?auto_154159 ) ( IN-CITY ?auto_154159 ?auto_154161 ) ( not ( = ?auto_154153 ?auto_154159 ) ) ( not ( = ?auto_154160 ?auto_154159 ) ) ( OBJ-AT ?auto_154154 ?auto_154153 ) ( OBJ-AT ?auto_154155 ?auto_154153 ) ( not ( = ?auto_154154 ?auto_154155 ) ) ( not ( = ?auto_154154 ?auto_154156 ) ) ( not ( = ?auto_154154 ?auto_154157 ) ) ( not ( = ?auto_154155 ?auto_154156 ) ) ( not ( = ?auto_154155 ?auto_154157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154156 ?auto_154157 ?auto_154153 )
      ( DELIVER-4PKG-VERIFY ?auto_154154 ?auto_154155 ?auto_154156 ?auto_154157 ?auto_154153 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154280 - OBJ
      ?auto_154281 - OBJ
      ?auto_154282 - OBJ
      ?auto_154283 - OBJ
      ?auto_154279 - LOCATION
    )
    :vars
    (
      ?auto_154286 - LOCATION
      ?auto_154287 - CITY
      ?auto_154284 - TRUCK
      ?auto_154285 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154286 ?auto_154287 ) ( IN-CITY ?auto_154279 ?auto_154287 ) ( not ( = ?auto_154279 ?auto_154286 ) ) ( OBJ-AT ?auto_154280 ?auto_154279 ) ( not ( = ?auto_154280 ?auto_154281 ) ) ( OBJ-AT ?auto_154281 ?auto_154286 ) ( TRUCK-AT ?auto_154284 ?auto_154285 ) ( IN-CITY ?auto_154285 ?auto_154287 ) ( not ( = ?auto_154279 ?auto_154285 ) ) ( not ( = ?auto_154286 ?auto_154285 ) ) ( OBJ-AT ?auto_154282 ?auto_154279 ) ( OBJ-AT ?auto_154283 ?auto_154279 ) ( not ( = ?auto_154280 ?auto_154282 ) ) ( not ( = ?auto_154280 ?auto_154283 ) ) ( not ( = ?auto_154281 ?auto_154282 ) ) ( not ( = ?auto_154281 ?auto_154283 ) ) ( not ( = ?auto_154282 ?auto_154283 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154280 ?auto_154281 ?auto_154279 )
      ( DELIVER-4PKG-VERIFY ?auto_154280 ?auto_154281 ?auto_154282 ?auto_154283 ?auto_154279 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154289 - OBJ
      ?auto_154290 - OBJ
      ?auto_154291 - OBJ
      ?auto_154292 - OBJ
      ?auto_154288 - LOCATION
    )
    :vars
    (
      ?auto_154295 - LOCATION
      ?auto_154296 - CITY
      ?auto_154293 - TRUCK
      ?auto_154294 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154295 ?auto_154296 ) ( IN-CITY ?auto_154288 ?auto_154296 ) ( not ( = ?auto_154288 ?auto_154295 ) ) ( OBJ-AT ?auto_154291 ?auto_154288 ) ( not ( = ?auto_154291 ?auto_154290 ) ) ( OBJ-AT ?auto_154290 ?auto_154295 ) ( TRUCK-AT ?auto_154293 ?auto_154294 ) ( IN-CITY ?auto_154294 ?auto_154296 ) ( not ( = ?auto_154288 ?auto_154294 ) ) ( not ( = ?auto_154295 ?auto_154294 ) ) ( OBJ-AT ?auto_154289 ?auto_154288 ) ( OBJ-AT ?auto_154292 ?auto_154288 ) ( not ( = ?auto_154289 ?auto_154290 ) ) ( not ( = ?auto_154289 ?auto_154291 ) ) ( not ( = ?auto_154289 ?auto_154292 ) ) ( not ( = ?auto_154290 ?auto_154292 ) ) ( not ( = ?auto_154291 ?auto_154292 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154291 ?auto_154290 ?auto_154288 )
      ( DELIVER-4PKG-VERIFY ?auto_154289 ?auto_154290 ?auto_154291 ?auto_154292 ?auto_154288 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154316 - OBJ
      ?auto_154317 - OBJ
      ?auto_154318 - OBJ
      ?auto_154319 - OBJ
      ?auto_154315 - LOCATION
    )
    :vars
    (
      ?auto_154322 - LOCATION
      ?auto_154323 - CITY
      ?auto_154320 - TRUCK
      ?auto_154321 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154322 ?auto_154323 ) ( IN-CITY ?auto_154315 ?auto_154323 ) ( not ( = ?auto_154315 ?auto_154322 ) ) ( OBJ-AT ?auto_154319 ?auto_154315 ) ( not ( = ?auto_154319 ?auto_154317 ) ) ( OBJ-AT ?auto_154317 ?auto_154322 ) ( TRUCK-AT ?auto_154320 ?auto_154321 ) ( IN-CITY ?auto_154321 ?auto_154323 ) ( not ( = ?auto_154315 ?auto_154321 ) ) ( not ( = ?auto_154322 ?auto_154321 ) ) ( OBJ-AT ?auto_154316 ?auto_154315 ) ( OBJ-AT ?auto_154318 ?auto_154315 ) ( not ( = ?auto_154316 ?auto_154317 ) ) ( not ( = ?auto_154316 ?auto_154318 ) ) ( not ( = ?auto_154316 ?auto_154319 ) ) ( not ( = ?auto_154317 ?auto_154318 ) ) ( not ( = ?auto_154318 ?auto_154319 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154319 ?auto_154317 ?auto_154315 )
      ( DELIVER-4PKG-VERIFY ?auto_154316 ?auto_154317 ?auto_154318 ?auto_154319 ?auto_154315 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154424 - OBJ
      ?auto_154425 - OBJ
      ?auto_154426 - OBJ
      ?auto_154427 - OBJ
      ?auto_154423 - LOCATION
    )
    :vars
    (
      ?auto_154430 - LOCATION
      ?auto_154431 - CITY
      ?auto_154428 - TRUCK
      ?auto_154429 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154430 ?auto_154431 ) ( IN-CITY ?auto_154423 ?auto_154431 ) ( not ( = ?auto_154423 ?auto_154430 ) ) ( OBJ-AT ?auto_154425 ?auto_154423 ) ( not ( = ?auto_154425 ?auto_154427 ) ) ( OBJ-AT ?auto_154427 ?auto_154430 ) ( TRUCK-AT ?auto_154428 ?auto_154429 ) ( IN-CITY ?auto_154429 ?auto_154431 ) ( not ( = ?auto_154423 ?auto_154429 ) ) ( not ( = ?auto_154430 ?auto_154429 ) ) ( OBJ-AT ?auto_154424 ?auto_154423 ) ( OBJ-AT ?auto_154426 ?auto_154423 ) ( not ( = ?auto_154424 ?auto_154425 ) ) ( not ( = ?auto_154424 ?auto_154426 ) ) ( not ( = ?auto_154424 ?auto_154427 ) ) ( not ( = ?auto_154425 ?auto_154426 ) ) ( not ( = ?auto_154426 ?auto_154427 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154425 ?auto_154427 ?auto_154423 )
      ( DELIVER-4PKG-VERIFY ?auto_154424 ?auto_154425 ?auto_154426 ?auto_154427 ?auto_154423 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154451 - OBJ
      ?auto_154452 - OBJ
      ?auto_154453 - OBJ
      ?auto_154454 - OBJ
      ?auto_154450 - LOCATION
    )
    :vars
    (
      ?auto_154457 - LOCATION
      ?auto_154458 - CITY
      ?auto_154455 - TRUCK
      ?auto_154456 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154457 ?auto_154458 ) ( IN-CITY ?auto_154450 ?auto_154458 ) ( not ( = ?auto_154450 ?auto_154457 ) ) ( OBJ-AT ?auto_154452 ?auto_154450 ) ( not ( = ?auto_154452 ?auto_154453 ) ) ( OBJ-AT ?auto_154453 ?auto_154457 ) ( TRUCK-AT ?auto_154455 ?auto_154456 ) ( IN-CITY ?auto_154456 ?auto_154458 ) ( not ( = ?auto_154450 ?auto_154456 ) ) ( not ( = ?auto_154457 ?auto_154456 ) ) ( OBJ-AT ?auto_154451 ?auto_154450 ) ( OBJ-AT ?auto_154454 ?auto_154450 ) ( not ( = ?auto_154451 ?auto_154452 ) ) ( not ( = ?auto_154451 ?auto_154453 ) ) ( not ( = ?auto_154451 ?auto_154454 ) ) ( not ( = ?auto_154452 ?auto_154454 ) ) ( not ( = ?auto_154453 ?auto_154454 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154452 ?auto_154453 ?auto_154450 )
      ( DELIVER-4PKG-VERIFY ?auto_154451 ?auto_154452 ?auto_154453 ?auto_154454 ?auto_154450 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154496 - OBJ
      ?auto_154497 - OBJ
      ?auto_154498 - OBJ
      ?auto_154499 - OBJ
      ?auto_154495 - LOCATION
    )
    :vars
    (
      ?auto_154503 - LOCATION
      ?auto_154504 - CITY
      ?auto_154501 - OBJ
      ?auto_154500 - TRUCK
      ?auto_154502 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154503 ?auto_154504 ) ( IN-CITY ?auto_154495 ?auto_154504 ) ( not ( = ?auto_154495 ?auto_154503 ) ) ( OBJ-AT ?auto_154501 ?auto_154495 ) ( not ( = ?auto_154501 ?auto_154499 ) ) ( OBJ-AT ?auto_154499 ?auto_154503 ) ( TRUCK-AT ?auto_154500 ?auto_154502 ) ( IN-CITY ?auto_154502 ?auto_154504 ) ( not ( = ?auto_154495 ?auto_154502 ) ) ( not ( = ?auto_154503 ?auto_154502 ) ) ( OBJ-AT ?auto_154496 ?auto_154495 ) ( OBJ-AT ?auto_154497 ?auto_154495 ) ( OBJ-AT ?auto_154498 ?auto_154495 ) ( not ( = ?auto_154496 ?auto_154497 ) ) ( not ( = ?auto_154496 ?auto_154498 ) ) ( not ( = ?auto_154496 ?auto_154499 ) ) ( not ( = ?auto_154496 ?auto_154501 ) ) ( not ( = ?auto_154497 ?auto_154498 ) ) ( not ( = ?auto_154497 ?auto_154499 ) ) ( not ( = ?auto_154497 ?auto_154501 ) ) ( not ( = ?auto_154498 ?auto_154499 ) ) ( not ( = ?auto_154498 ?auto_154501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154501 ?auto_154499 ?auto_154495 )
      ( DELIVER-4PKG-VERIFY ?auto_154496 ?auto_154497 ?auto_154498 ?auto_154499 ?auto_154495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154516 - OBJ
      ?auto_154517 - OBJ
      ?auto_154518 - OBJ
      ?auto_154519 - OBJ
      ?auto_154515 - LOCATION
    )
    :vars
    (
      ?auto_154522 - LOCATION
      ?auto_154523 - CITY
      ?auto_154520 - TRUCK
      ?auto_154521 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154522 ?auto_154523 ) ( IN-CITY ?auto_154515 ?auto_154523 ) ( not ( = ?auto_154515 ?auto_154522 ) ) ( OBJ-AT ?auto_154519 ?auto_154515 ) ( not ( = ?auto_154519 ?auto_154518 ) ) ( OBJ-AT ?auto_154518 ?auto_154522 ) ( TRUCK-AT ?auto_154520 ?auto_154521 ) ( IN-CITY ?auto_154521 ?auto_154523 ) ( not ( = ?auto_154515 ?auto_154521 ) ) ( not ( = ?auto_154522 ?auto_154521 ) ) ( OBJ-AT ?auto_154516 ?auto_154515 ) ( OBJ-AT ?auto_154517 ?auto_154515 ) ( not ( = ?auto_154516 ?auto_154517 ) ) ( not ( = ?auto_154516 ?auto_154518 ) ) ( not ( = ?auto_154516 ?auto_154519 ) ) ( not ( = ?auto_154517 ?auto_154518 ) ) ( not ( = ?auto_154517 ?auto_154519 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154519 ?auto_154518 ?auto_154515 )
      ( DELIVER-4PKG-VERIFY ?auto_154516 ?auto_154517 ?auto_154518 ?auto_154519 ?auto_154515 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154525 - OBJ
      ?auto_154526 - OBJ
      ?auto_154527 - OBJ
      ?auto_154528 - OBJ
      ?auto_154524 - LOCATION
    )
    :vars
    (
      ?auto_154532 - LOCATION
      ?auto_154533 - CITY
      ?auto_154530 - OBJ
      ?auto_154529 - TRUCK
      ?auto_154531 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154532 ?auto_154533 ) ( IN-CITY ?auto_154524 ?auto_154533 ) ( not ( = ?auto_154524 ?auto_154532 ) ) ( OBJ-AT ?auto_154530 ?auto_154524 ) ( not ( = ?auto_154530 ?auto_154527 ) ) ( OBJ-AT ?auto_154527 ?auto_154532 ) ( TRUCK-AT ?auto_154529 ?auto_154531 ) ( IN-CITY ?auto_154531 ?auto_154533 ) ( not ( = ?auto_154524 ?auto_154531 ) ) ( not ( = ?auto_154532 ?auto_154531 ) ) ( OBJ-AT ?auto_154525 ?auto_154524 ) ( OBJ-AT ?auto_154526 ?auto_154524 ) ( OBJ-AT ?auto_154528 ?auto_154524 ) ( not ( = ?auto_154525 ?auto_154526 ) ) ( not ( = ?auto_154525 ?auto_154527 ) ) ( not ( = ?auto_154525 ?auto_154528 ) ) ( not ( = ?auto_154525 ?auto_154530 ) ) ( not ( = ?auto_154526 ?auto_154527 ) ) ( not ( = ?auto_154526 ?auto_154528 ) ) ( not ( = ?auto_154526 ?auto_154530 ) ) ( not ( = ?auto_154527 ?auto_154528 ) ) ( not ( = ?auto_154528 ?auto_154530 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154530 ?auto_154527 ?auto_154524 )
      ( DELIVER-4PKG-VERIFY ?auto_154525 ?auto_154526 ?auto_154527 ?auto_154528 ?auto_154524 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_154668 - OBJ
      ?auto_154669 - OBJ
      ?auto_154670 - OBJ
      ?auto_154671 - OBJ
      ?auto_154667 - LOCATION
    )
    :vars
    (
      ?auto_154675 - LOCATION
      ?auto_154676 - CITY
      ?auto_154673 - OBJ
      ?auto_154672 - TRUCK
      ?auto_154674 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_154675 ?auto_154676 ) ( IN-CITY ?auto_154667 ?auto_154676 ) ( not ( = ?auto_154667 ?auto_154675 ) ) ( OBJ-AT ?auto_154673 ?auto_154667 ) ( not ( = ?auto_154673 ?auto_154669 ) ) ( OBJ-AT ?auto_154669 ?auto_154675 ) ( TRUCK-AT ?auto_154672 ?auto_154674 ) ( IN-CITY ?auto_154674 ?auto_154676 ) ( not ( = ?auto_154667 ?auto_154674 ) ) ( not ( = ?auto_154675 ?auto_154674 ) ) ( OBJ-AT ?auto_154668 ?auto_154667 ) ( OBJ-AT ?auto_154670 ?auto_154667 ) ( OBJ-AT ?auto_154671 ?auto_154667 ) ( not ( = ?auto_154668 ?auto_154669 ) ) ( not ( = ?auto_154668 ?auto_154670 ) ) ( not ( = ?auto_154668 ?auto_154671 ) ) ( not ( = ?auto_154668 ?auto_154673 ) ) ( not ( = ?auto_154669 ?auto_154670 ) ) ( not ( = ?auto_154669 ?auto_154671 ) ) ( not ( = ?auto_154670 ?auto_154671 ) ) ( not ( = ?auto_154670 ?auto_154673 ) ) ( not ( = ?auto_154671 ?auto_154673 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_154673 ?auto_154669 ?auto_154667 )
      ( DELIVER-4PKG-VERIFY ?auto_154668 ?auto_154669 ?auto_154670 ?auto_154671 ?auto_154667 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155128 - OBJ
      ?auto_155129 - OBJ
      ?auto_155130 - OBJ
      ?auto_155131 - OBJ
      ?auto_155127 - LOCATION
    )
    :vars
    (
      ?auto_155134 - LOCATION
      ?auto_155135 - CITY
      ?auto_155132 - TRUCK
      ?auto_155133 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155134 ?auto_155135 ) ( IN-CITY ?auto_155127 ?auto_155135 ) ( not ( = ?auto_155127 ?auto_155134 ) ) ( OBJ-AT ?auto_155130 ?auto_155127 ) ( not ( = ?auto_155130 ?auto_155128 ) ) ( OBJ-AT ?auto_155128 ?auto_155134 ) ( TRUCK-AT ?auto_155132 ?auto_155133 ) ( IN-CITY ?auto_155133 ?auto_155135 ) ( not ( = ?auto_155127 ?auto_155133 ) ) ( not ( = ?auto_155134 ?auto_155133 ) ) ( OBJ-AT ?auto_155129 ?auto_155127 ) ( OBJ-AT ?auto_155131 ?auto_155127 ) ( not ( = ?auto_155128 ?auto_155129 ) ) ( not ( = ?auto_155128 ?auto_155131 ) ) ( not ( = ?auto_155129 ?auto_155130 ) ) ( not ( = ?auto_155129 ?auto_155131 ) ) ( not ( = ?auto_155130 ?auto_155131 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155130 ?auto_155128 ?auto_155127 )
      ( DELIVER-4PKG-VERIFY ?auto_155128 ?auto_155129 ?auto_155130 ?auto_155131 ?auto_155127 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155164 - OBJ
      ?auto_155165 - OBJ
      ?auto_155166 - OBJ
      ?auto_155167 - OBJ
      ?auto_155163 - LOCATION
    )
    :vars
    (
      ?auto_155170 - LOCATION
      ?auto_155171 - CITY
      ?auto_155168 - TRUCK
      ?auto_155169 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155170 ?auto_155171 ) ( IN-CITY ?auto_155163 ?auto_155171 ) ( not ( = ?auto_155163 ?auto_155170 ) ) ( OBJ-AT ?auto_155165 ?auto_155163 ) ( not ( = ?auto_155165 ?auto_155164 ) ) ( OBJ-AT ?auto_155164 ?auto_155170 ) ( TRUCK-AT ?auto_155168 ?auto_155169 ) ( IN-CITY ?auto_155169 ?auto_155171 ) ( not ( = ?auto_155163 ?auto_155169 ) ) ( not ( = ?auto_155170 ?auto_155169 ) ) ( OBJ-AT ?auto_155166 ?auto_155163 ) ( OBJ-AT ?auto_155167 ?auto_155163 ) ( not ( = ?auto_155164 ?auto_155166 ) ) ( not ( = ?auto_155164 ?auto_155167 ) ) ( not ( = ?auto_155165 ?auto_155166 ) ) ( not ( = ?auto_155165 ?auto_155167 ) ) ( not ( = ?auto_155166 ?auto_155167 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155165 ?auto_155164 ?auto_155163 )
      ( DELIVER-4PKG-VERIFY ?auto_155164 ?auto_155165 ?auto_155166 ?auto_155167 ?auto_155163 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155272 - OBJ
      ?auto_155273 - OBJ
      ?auto_155274 - OBJ
      ?auto_155275 - OBJ
      ?auto_155271 - LOCATION
    )
    :vars
    (
      ?auto_155278 - LOCATION
      ?auto_155279 - CITY
      ?auto_155276 - TRUCK
      ?auto_155277 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155278 ?auto_155279 ) ( IN-CITY ?auto_155271 ?auto_155279 ) ( not ( = ?auto_155271 ?auto_155278 ) ) ( OBJ-AT ?auto_155275 ?auto_155271 ) ( not ( = ?auto_155275 ?auto_155272 ) ) ( OBJ-AT ?auto_155272 ?auto_155278 ) ( TRUCK-AT ?auto_155276 ?auto_155277 ) ( IN-CITY ?auto_155277 ?auto_155279 ) ( not ( = ?auto_155271 ?auto_155277 ) ) ( not ( = ?auto_155278 ?auto_155277 ) ) ( OBJ-AT ?auto_155273 ?auto_155271 ) ( OBJ-AT ?auto_155274 ?auto_155271 ) ( not ( = ?auto_155272 ?auto_155273 ) ) ( not ( = ?auto_155272 ?auto_155274 ) ) ( not ( = ?auto_155273 ?auto_155274 ) ) ( not ( = ?auto_155273 ?auto_155275 ) ) ( not ( = ?auto_155274 ?auto_155275 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155275 ?auto_155272 ?auto_155271 )
      ( DELIVER-4PKG-VERIFY ?auto_155272 ?auto_155273 ?auto_155274 ?auto_155275 ?auto_155271 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155317 - OBJ
      ?auto_155318 - OBJ
      ?auto_155319 - OBJ
      ?auto_155320 - OBJ
      ?auto_155316 - LOCATION
    )
    :vars
    (
      ?auto_155324 - LOCATION
      ?auto_155325 - CITY
      ?auto_155322 - OBJ
      ?auto_155321 - TRUCK
      ?auto_155323 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155324 ?auto_155325 ) ( IN-CITY ?auto_155316 ?auto_155325 ) ( not ( = ?auto_155316 ?auto_155324 ) ) ( OBJ-AT ?auto_155322 ?auto_155316 ) ( not ( = ?auto_155322 ?auto_155317 ) ) ( OBJ-AT ?auto_155317 ?auto_155324 ) ( TRUCK-AT ?auto_155321 ?auto_155323 ) ( IN-CITY ?auto_155323 ?auto_155325 ) ( not ( = ?auto_155316 ?auto_155323 ) ) ( not ( = ?auto_155324 ?auto_155323 ) ) ( OBJ-AT ?auto_155318 ?auto_155316 ) ( OBJ-AT ?auto_155319 ?auto_155316 ) ( OBJ-AT ?auto_155320 ?auto_155316 ) ( not ( = ?auto_155317 ?auto_155318 ) ) ( not ( = ?auto_155317 ?auto_155319 ) ) ( not ( = ?auto_155317 ?auto_155320 ) ) ( not ( = ?auto_155318 ?auto_155319 ) ) ( not ( = ?auto_155318 ?auto_155320 ) ) ( not ( = ?auto_155318 ?auto_155322 ) ) ( not ( = ?auto_155319 ?auto_155320 ) ) ( not ( = ?auto_155319 ?auto_155322 ) ) ( not ( = ?auto_155320 ?auto_155322 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155322 ?auto_155317 ?auto_155316 )
      ( DELIVER-4PKG-VERIFY ?auto_155317 ?auto_155318 ?auto_155319 ?auto_155320 ?auto_155316 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155769 - OBJ
      ?auto_155770 - OBJ
      ?auto_155771 - OBJ
      ?auto_155768 - LOCATION
    )
    :vars
    (
      ?auto_155773 - LOCATION
      ?auto_155772 - CITY
      ?auto_155775 - TRUCK
      ?auto_155774 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155773 ?auto_155772 ) ( IN-CITY ?auto_155768 ?auto_155772 ) ( not ( = ?auto_155768 ?auto_155773 ) ) ( OBJ-AT ?auto_155769 ?auto_155768 ) ( not ( = ?auto_155769 ?auto_155771 ) ) ( OBJ-AT ?auto_155771 ?auto_155773 ) ( TRUCK-AT ?auto_155775 ?auto_155774 ) ( IN-CITY ?auto_155774 ?auto_155772 ) ( not ( = ?auto_155768 ?auto_155774 ) ) ( not ( = ?auto_155773 ?auto_155774 ) ) ( OBJ-AT ?auto_155770 ?auto_155768 ) ( not ( = ?auto_155769 ?auto_155770 ) ) ( not ( = ?auto_155770 ?auto_155771 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155769 ?auto_155771 ?auto_155768 )
      ( DELIVER-3PKG-VERIFY ?auto_155769 ?auto_155770 ?auto_155771 ?auto_155768 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155789 - OBJ
      ?auto_155790 - OBJ
      ?auto_155791 - OBJ
      ?auto_155788 - LOCATION
    )
    :vars
    (
      ?auto_155793 - LOCATION
      ?auto_155792 - CITY
      ?auto_155795 - TRUCK
      ?auto_155794 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155793 ?auto_155792 ) ( IN-CITY ?auto_155788 ?auto_155792 ) ( not ( = ?auto_155788 ?auto_155793 ) ) ( OBJ-AT ?auto_155791 ?auto_155788 ) ( not ( = ?auto_155791 ?auto_155790 ) ) ( OBJ-AT ?auto_155790 ?auto_155793 ) ( TRUCK-AT ?auto_155795 ?auto_155794 ) ( IN-CITY ?auto_155794 ?auto_155792 ) ( not ( = ?auto_155788 ?auto_155794 ) ) ( not ( = ?auto_155793 ?auto_155794 ) ) ( OBJ-AT ?auto_155789 ?auto_155788 ) ( not ( = ?auto_155789 ?auto_155790 ) ) ( not ( = ?auto_155789 ?auto_155791 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155791 ?auto_155790 ?auto_155788 )
      ( DELIVER-3PKG-VERIFY ?auto_155789 ?auto_155790 ?auto_155791 ?auto_155788 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155931 - OBJ
      ?auto_155932 - OBJ
      ?auto_155933 - OBJ
      ?auto_155930 - LOCATION
    )
    :vars
    (
      ?auto_155935 - LOCATION
      ?auto_155934 - CITY
      ?auto_155937 - TRUCK
      ?auto_155936 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155935 ?auto_155934 ) ( IN-CITY ?auto_155930 ?auto_155934 ) ( not ( = ?auto_155930 ?auto_155935 ) ) ( OBJ-AT ?auto_155932 ?auto_155930 ) ( not ( = ?auto_155932 ?auto_155931 ) ) ( OBJ-AT ?auto_155931 ?auto_155935 ) ( TRUCK-AT ?auto_155937 ?auto_155936 ) ( IN-CITY ?auto_155936 ?auto_155934 ) ( not ( = ?auto_155930 ?auto_155936 ) ) ( not ( = ?auto_155935 ?auto_155936 ) ) ( OBJ-AT ?auto_155933 ?auto_155930 ) ( not ( = ?auto_155931 ?auto_155933 ) ) ( not ( = ?auto_155932 ?auto_155933 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155932 ?auto_155931 ?auto_155930 )
      ( DELIVER-3PKG-VERIFY ?auto_155931 ?auto_155932 ?auto_155933 ?auto_155930 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_168824 - OBJ
      ?auto_168823 - LOCATION
    )
    :vars
    (
      ?auto_168827 - LOCATION
      ?auto_168828 - CITY
      ?auto_168826 - OBJ
      ?auto_168825 - TRUCK
      ?auto_168829 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_168827 ?auto_168828 ) ( IN-CITY ?auto_168823 ?auto_168828 ) ( not ( = ?auto_168823 ?auto_168827 ) ) ( not ( = ?auto_168826 ?auto_168824 ) ) ( OBJ-AT ?auto_168824 ?auto_168827 ) ( IN-TRUCK ?auto_168826 ?auto_168825 ) ( TRUCK-AT ?auto_168825 ?auto_168829 ) ( IN-CITY ?auto_168829 ?auto_168828 ) ( not ( = ?auto_168823 ?auto_168829 ) ) ( not ( = ?auto_168827 ?auto_168829 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_168825 ?auto_168829 ?auto_168823 ?auto_168828 )
      ( DELIVER-2PKG ?auto_168826 ?auto_168824 ?auto_168823 )
      ( DELIVER-1PKG-VERIFY ?auto_168824 ?auto_168823 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_168831 - OBJ
      ?auto_168832 - OBJ
      ?auto_168830 - LOCATION
    )
    :vars
    (
      ?auto_168835 - LOCATION
      ?auto_168834 - CITY
      ?auto_168836 - TRUCK
      ?auto_168833 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_168835 ?auto_168834 ) ( IN-CITY ?auto_168830 ?auto_168834 ) ( not ( = ?auto_168830 ?auto_168835 ) ) ( not ( = ?auto_168831 ?auto_168832 ) ) ( OBJ-AT ?auto_168832 ?auto_168835 ) ( IN-TRUCK ?auto_168831 ?auto_168836 ) ( TRUCK-AT ?auto_168836 ?auto_168833 ) ( IN-CITY ?auto_168833 ?auto_168834 ) ( not ( = ?auto_168830 ?auto_168833 ) ) ( not ( = ?auto_168835 ?auto_168833 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_168832 ?auto_168830 )
      ( DELIVER-2PKG-VERIFY ?auto_168831 ?auto_168832 ?auto_168830 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_168854 - OBJ
      ?auto_168855 - OBJ
      ?auto_168853 - LOCATION
    )
    :vars
    (
      ?auto_168856 - LOCATION
      ?auto_168858 - CITY
      ?auto_168859 - TRUCK
      ?auto_168857 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_168856 ?auto_168858 ) ( IN-CITY ?auto_168853 ?auto_168858 ) ( not ( = ?auto_168853 ?auto_168856 ) ) ( not ( = ?auto_168855 ?auto_168854 ) ) ( OBJ-AT ?auto_168854 ?auto_168856 ) ( IN-TRUCK ?auto_168855 ?auto_168859 ) ( TRUCK-AT ?auto_168859 ?auto_168857 ) ( IN-CITY ?auto_168857 ?auto_168858 ) ( not ( = ?auto_168853 ?auto_168857 ) ) ( not ( = ?auto_168856 ?auto_168857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_168855 ?auto_168854 ?auto_168853 )
      ( DELIVER-2PKG-VERIFY ?auto_168854 ?auto_168855 ?auto_168853 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_170840 - OBJ
      ?auto_170839 - LOCATION
    )
    :vars
    (
      ?auto_170842 - LOCATION
      ?auto_170844 - CITY
      ?auto_170841 - OBJ
      ?auto_170845 - TRUCK
      ?auto_170843 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_170842 ?auto_170844 ) ( IN-CITY ?auto_170839 ?auto_170844 ) ( not ( = ?auto_170839 ?auto_170842 ) ) ( not ( = ?auto_170841 ?auto_170840 ) ) ( OBJ-AT ?auto_170840 ?auto_170842 ) ( TRUCK-AT ?auto_170845 ?auto_170843 ) ( IN-CITY ?auto_170843 ?auto_170844 ) ( not ( = ?auto_170839 ?auto_170843 ) ) ( not ( = ?auto_170842 ?auto_170843 ) ) ( OBJ-AT ?auto_170841 ?auto_170843 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_170841 ?auto_170845 ?auto_170843 )
      ( DELIVER-2PKG ?auto_170841 ?auto_170840 ?auto_170839 )
      ( DELIVER-1PKG-VERIFY ?auto_170840 ?auto_170839 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_170847 - OBJ
      ?auto_170848 - OBJ
      ?auto_170846 - LOCATION
    )
    :vars
    (
      ?auto_170851 - LOCATION
      ?auto_170852 - CITY
      ?auto_170849 - TRUCK
      ?auto_170850 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_170851 ?auto_170852 ) ( IN-CITY ?auto_170846 ?auto_170852 ) ( not ( = ?auto_170846 ?auto_170851 ) ) ( not ( = ?auto_170847 ?auto_170848 ) ) ( OBJ-AT ?auto_170848 ?auto_170851 ) ( TRUCK-AT ?auto_170849 ?auto_170850 ) ( IN-CITY ?auto_170850 ?auto_170852 ) ( not ( = ?auto_170846 ?auto_170850 ) ) ( not ( = ?auto_170851 ?auto_170850 ) ) ( OBJ-AT ?auto_170847 ?auto_170850 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_170848 ?auto_170846 )
      ( DELIVER-2PKG-VERIFY ?auto_170847 ?auto_170848 ?auto_170846 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_170860 - OBJ
      ?auto_170861 - OBJ
      ?auto_170859 - LOCATION
    )
    :vars
    (
      ?auto_170865 - LOCATION
      ?auto_170864 - CITY
      ?auto_170862 - TRUCK
      ?auto_170863 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_170865 ?auto_170864 ) ( IN-CITY ?auto_170859 ?auto_170864 ) ( not ( = ?auto_170859 ?auto_170865 ) ) ( not ( = ?auto_170861 ?auto_170860 ) ) ( OBJ-AT ?auto_170860 ?auto_170865 ) ( TRUCK-AT ?auto_170862 ?auto_170863 ) ( IN-CITY ?auto_170863 ?auto_170864 ) ( not ( = ?auto_170859 ?auto_170863 ) ) ( not ( = ?auto_170865 ?auto_170863 ) ) ( OBJ-AT ?auto_170861 ?auto_170863 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_170861 ?auto_170860 ?auto_170859 )
      ( DELIVER-2PKG-VERIFY ?auto_170860 ?auto_170861 ?auto_170859 ) )
  )

)

