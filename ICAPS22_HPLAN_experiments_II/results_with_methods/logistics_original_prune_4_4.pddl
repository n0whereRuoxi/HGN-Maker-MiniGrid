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
      ?auto_174553 - OBJ
      ?auto_174552 - LOCATION
    )
    :vars
    (
      ?auto_174554 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174554 ?auto_174552 ) ( IN-TRUCK ?auto_174553 ?auto_174554 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_174553 ?auto_174554 ?auto_174552 )
      ( DELIVER-1PKG-VERIFY ?auto_174553 ?auto_174552 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_174571 - OBJ
      ?auto_174570 - LOCATION
    )
    :vars
    (
      ?auto_174572 - TRUCK
      ?auto_174573 - LOCATION
      ?auto_174574 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174571 ?auto_174572 ) ( TRUCK-AT ?auto_174572 ?auto_174573 ) ( IN-CITY ?auto_174573 ?auto_174574 ) ( IN-CITY ?auto_174570 ?auto_174574 ) ( not ( = ?auto_174570 ?auto_174573 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_174572 ?auto_174573 ?auto_174570 ?auto_174574 )
      ( DELIVER-1PKG ?auto_174571 ?auto_174570 )
      ( DELIVER-1PKG-VERIFY ?auto_174571 ?auto_174570 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_174597 - OBJ
      ?auto_174596 - LOCATION
    )
    :vars
    (
      ?auto_174598 - TRUCK
      ?auto_174600 - LOCATION
      ?auto_174599 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174598 ?auto_174600 ) ( IN-CITY ?auto_174600 ?auto_174599 ) ( IN-CITY ?auto_174596 ?auto_174599 ) ( not ( = ?auto_174596 ?auto_174600 ) ) ( OBJ-AT ?auto_174597 ?auto_174600 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_174597 ?auto_174598 ?auto_174600 )
      ( DELIVER-1PKG ?auto_174597 ?auto_174596 )
      ( DELIVER-1PKG-VERIFY ?auto_174597 ?auto_174596 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_174623 - OBJ
      ?auto_174622 - LOCATION
    )
    :vars
    (
      ?auto_174625 - LOCATION
      ?auto_174626 - CITY
      ?auto_174624 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174625 ?auto_174626 ) ( IN-CITY ?auto_174622 ?auto_174626 ) ( not ( = ?auto_174622 ?auto_174625 ) ) ( OBJ-AT ?auto_174623 ?auto_174625 ) ( TRUCK-AT ?auto_174624 ?auto_174622 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_174624 ?auto_174622 ?auto_174625 ?auto_174626 )
      ( DELIVER-1PKG ?auto_174623 ?auto_174622 )
      ( DELIVER-1PKG-VERIFY ?auto_174623 ?auto_174622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_174766 - OBJ
      ?auto_174767 - OBJ
      ?auto_174765 - LOCATION
    )
    :vars
    (
      ?auto_174768 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174768 ?auto_174765 ) ( IN-TRUCK ?auto_174767 ?auto_174768 ) ( OBJ-AT ?auto_174766 ?auto_174765 ) ( not ( = ?auto_174766 ?auto_174767 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174767 ?auto_174765 )
      ( DELIVER-2PKG-VERIFY ?auto_174766 ?auto_174767 ?auto_174765 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_174770 - OBJ
      ?auto_174771 - OBJ
      ?auto_174769 - LOCATION
    )
    :vars
    (
      ?auto_174772 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174772 ?auto_174769 ) ( IN-TRUCK ?auto_174770 ?auto_174772 ) ( OBJ-AT ?auto_174771 ?auto_174769 ) ( not ( = ?auto_174770 ?auto_174771 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174770 ?auto_174769 )
      ( DELIVER-2PKG-VERIFY ?auto_174770 ?auto_174771 ?auto_174769 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174778 - OBJ
      ?auto_174779 - OBJ
      ?auto_174780 - OBJ
      ?auto_174777 - LOCATION
    )
    :vars
    (
      ?auto_174781 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174781 ?auto_174777 ) ( IN-TRUCK ?auto_174780 ?auto_174781 ) ( OBJ-AT ?auto_174778 ?auto_174777 ) ( OBJ-AT ?auto_174779 ?auto_174777 ) ( not ( = ?auto_174778 ?auto_174779 ) ) ( not ( = ?auto_174778 ?auto_174780 ) ) ( not ( = ?auto_174779 ?auto_174780 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174780 ?auto_174777 )
      ( DELIVER-3PKG-VERIFY ?auto_174778 ?auto_174779 ?auto_174780 ?auto_174777 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174783 - OBJ
      ?auto_174784 - OBJ
      ?auto_174785 - OBJ
      ?auto_174782 - LOCATION
    )
    :vars
    (
      ?auto_174786 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174786 ?auto_174782 ) ( IN-TRUCK ?auto_174784 ?auto_174786 ) ( OBJ-AT ?auto_174783 ?auto_174782 ) ( OBJ-AT ?auto_174785 ?auto_174782 ) ( not ( = ?auto_174783 ?auto_174784 ) ) ( not ( = ?auto_174783 ?auto_174785 ) ) ( not ( = ?auto_174784 ?auto_174785 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174784 ?auto_174782 )
      ( DELIVER-3PKG-VERIFY ?auto_174783 ?auto_174784 ?auto_174785 ?auto_174782 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174793 - OBJ
      ?auto_174794 - OBJ
      ?auto_174795 - OBJ
      ?auto_174792 - LOCATION
    )
    :vars
    (
      ?auto_174796 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174796 ?auto_174792 ) ( IN-TRUCK ?auto_174793 ?auto_174796 ) ( OBJ-AT ?auto_174794 ?auto_174792 ) ( OBJ-AT ?auto_174795 ?auto_174792 ) ( not ( = ?auto_174793 ?auto_174794 ) ) ( not ( = ?auto_174793 ?auto_174795 ) ) ( not ( = ?auto_174794 ?auto_174795 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174793 ?auto_174792 )
      ( DELIVER-3PKG-VERIFY ?auto_174793 ?auto_174794 ?auto_174795 ?auto_174792 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174813 - OBJ
      ?auto_174814 - OBJ
      ?auto_174815 - OBJ
      ?auto_174816 - OBJ
      ?auto_174812 - LOCATION
    )
    :vars
    (
      ?auto_174817 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174817 ?auto_174812 ) ( IN-TRUCK ?auto_174816 ?auto_174817 ) ( OBJ-AT ?auto_174813 ?auto_174812 ) ( OBJ-AT ?auto_174814 ?auto_174812 ) ( OBJ-AT ?auto_174815 ?auto_174812 ) ( not ( = ?auto_174813 ?auto_174814 ) ) ( not ( = ?auto_174813 ?auto_174815 ) ) ( not ( = ?auto_174813 ?auto_174816 ) ) ( not ( = ?auto_174814 ?auto_174815 ) ) ( not ( = ?auto_174814 ?auto_174816 ) ) ( not ( = ?auto_174815 ?auto_174816 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174816 ?auto_174812 )
      ( DELIVER-4PKG-VERIFY ?auto_174813 ?auto_174814 ?auto_174815 ?auto_174816 ?auto_174812 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174819 - OBJ
      ?auto_174820 - OBJ
      ?auto_174821 - OBJ
      ?auto_174822 - OBJ
      ?auto_174818 - LOCATION
    )
    :vars
    (
      ?auto_174823 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174823 ?auto_174818 ) ( IN-TRUCK ?auto_174821 ?auto_174823 ) ( OBJ-AT ?auto_174819 ?auto_174818 ) ( OBJ-AT ?auto_174820 ?auto_174818 ) ( OBJ-AT ?auto_174822 ?auto_174818 ) ( not ( = ?auto_174819 ?auto_174820 ) ) ( not ( = ?auto_174819 ?auto_174821 ) ) ( not ( = ?auto_174819 ?auto_174822 ) ) ( not ( = ?auto_174820 ?auto_174821 ) ) ( not ( = ?auto_174820 ?auto_174822 ) ) ( not ( = ?auto_174821 ?auto_174822 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174821 ?auto_174818 )
      ( DELIVER-4PKG-VERIFY ?auto_174819 ?auto_174820 ?auto_174821 ?auto_174822 ?auto_174818 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174831 - OBJ
      ?auto_174832 - OBJ
      ?auto_174833 - OBJ
      ?auto_174834 - OBJ
      ?auto_174830 - LOCATION
    )
    :vars
    (
      ?auto_174835 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174835 ?auto_174830 ) ( IN-TRUCK ?auto_174832 ?auto_174835 ) ( OBJ-AT ?auto_174831 ?auto_174830 ) ( OBJ-AT ?auto_174833 ?auto_174830 ) ( OBJ-AT ?auto_174834 ?auto_174830 ) ( not ( = ?auto_174831 ?auto_174832 ) ) ( not ( = ?auto_174831 ?auto_174833 ) ) ( not ( = ?auto_174831 ?auto_174834 ) ) ( not ( = ?auto_174832 ?auto_174833 ) ) ( not ( = ?auto_174832 ?auto_174834 ) ) ( not ( = ?auto_174833 ?auto_174834 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174832 ?auto_174830 )
      ( DELIVER-4PKG-VERIFY ?auto_174831 ?auto_174832 ?auto_174833 ?auto_174834 ?auto_174830 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174855 - OBJ
      ?auto_174856 - OBJ
      ?auto_174857 - OBJ
      ?auto_174858 - OBJ
      ?auto_174854 - LOCATION
    )
    :vars
    (
      ?auto_174859 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_174859 ?auto_174854 ) ( IN-TRUCK ?auto_174855 ?auto_174859 ) ( OBJ-AT ?auto_174856 ?auto_174854 ) ( OBJ-AT ?auto_174857 ?auto_174854 ) ( OBJ-AT ?auto_174858 ?auto_174854 ) ( not ( = ?auto_174855 ?auto_174856 ) ) ( not ( = ?auto_174855 ?auto_174857 ) ) ( not ( = ?auto_174855 ?auto_174858 ) ) ( not ( = ?auto_174856 ?auto_174857 ) ) ( not ( = ?auto_174856 ?auto_174858 ) ) ( not ( = ?auto_174857 ?auto_174858 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174855 ?auto_174854 )
      ( DELIVER-4PKG-VERIFY ?auto_174855 ?auto_174856 ?auto_174857 ?auto_174858 ?auto_174854 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_174908 - OBJ
      ?auto_174909 - OBJ
      ?auto_174907 - LOCATION
    )
    :vars
    (
      ?auto_174910 - TRUCK
      ?auto_174911 - LOCATION
      ?auto_174912 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174909 ?auto_174910 ) ( TRUCK-AT ?auto_174910 ?auto_174911 ) ( IN-CITY ?auto_174911 ?auto_174912 ) ( IN-CITY ?auto_174907 ?auto_174912 ) ( not ( = ?auto_174907 ?auto_174911 ) ) ( OBJ-AT ?auto_174908 ?auto_174907 ) ( not ( = ?auto_174908 ?auto_174909 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_174909 ?auto_174907 )
      ( DELIVER-2PKG-VERIFY ?auto_174908 ?auto_174909 ?auto_174907 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_174914 - OBJ
      ?auto_174915 - OBJ
      ?auto_174913 - LOCATION
    )
    :vars
    (
      ?auto_174916 - TRUCK
      ?auto_174917 - LOCATION
      ?auto_174918 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174914 ?auto_174916 ) ( TRUCK-AT ?auto_174916 ?auto_174917 ) ( IN-CITY ?auto_174917 ?auto_174918 ) ( IN-CITY ?auto_174913 ?auto_174918 ) ( not ( = ?auto_174913 ?auto_174917 ) ) ( OBJ-AT ?auto_174915 ?auto_174913 ) ( not ( = ?auto_174915 ?auto_174914 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174915 ?auto_174914 ?auto_174913 )
      ( DELIVER-2PKG-VERIFY ?auto_174914 ?auto_174915 ?auto_174913 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174927 - OBJ
      ?auto_174928 - OBJ
      ?auto_174929 - OBJ
      ?auto_174926 - LOCATION
    )
    :vars
    (
      ?auto_174930 - TRUCK
      ?auto_174931 - LOCATION
      ?auto_174932 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174929 ?auto_174930 ) ( TRUCK-AT ?auto_174930 ?auto_174931 ) ( IN-CITY ?auto_174931 ?auto_174932 ) ( IN-CITY ?auto_174926 ?auto_174932 ) ( not ( = ?auto_174926 ?auto_174931 ) ) ( OBJ-AT ?auto_174927 ?auto_174926 ) ( not ( = ?auto_174927 ?auto_174929 ) ) ( OBJ-AT ?auto_174928 ?auto_174926 ) ( not ( = ?auto_174927 ?auto_174928 ) ) ( not ( = ?auto_174928 ?auto_174929 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174927 ?auto_174929 ?auto_174926 )
      ( DELIVER-3PKG-VERIFY ?auto_174927 ?auto_174928 ?auto_174929 ?auto_174926 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174934 - OBJ
      ?auto_174935 - OBJ
      ?auto_174936 - OBJ
      ?auto_174933 - LOCATION
    )
    :vars
    (
      ?auto_174937 - TRUCK
      ?auto_174938 - LOCATION
      ?auto_174939 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174935 ?auto_174937 ) ( TRUCK-AT ?auto_174937 ?auto_174938 ) ( IN-CITY ?auto_174938 ?auto_174939 ) ( IN-CITY ?auto_174933 ?auto_174939 ) ( not ( = ?auto_174933 ?auto_174938 ) ) ( OBJ-AT ?auto_174936 ?auto_174933 ) ( not ( = ?auto_174936 ?auto_174935 ) ) ( OBJ-AT ?auto_174934 ?auto_174933 ) ( not ( = ?auto_174934 ?auto_174935 ) ) ( not ( = ?auto_174934 ?auto_174936 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174936 ?auto_174935 ?auto_174933 )
      ( DELIVER-3PKG-VERIFY ?auto_174934 ?auto_174935 ?auto_174936 ?auto_174933 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_174948 - OBJ
      ?auto_174949 - OBJ
      ?auto_174950 - OBJ
      ?auto_174947 - LOCATION
    )
    :vars
    (
      ?auto_174951 - TRUCK
      ?auto_174952 - LOCATION
      ?auto_174953 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174948 ?auto_174951 ) ( TRUCK-AT ?auto_174951 ?auto_174952 ) ( IN-CITY ?auto_174952 ?auto_174953 ) ( IN-CITY ?auto_174947 ?auto_174953 ) ( not ( = ?auto_174947 ?auto_174952 ) ) ( OBJ-AT ?auto_174950 ?auto_174947 ) ( not ( = ?auto_174950 ?auto_174948 ) ) ( OBJ-AT ?auto_174949 ?auto_174947 ) ( not ( = ?auto_174948 ?auto_174949 ) ) ( not ( = ?auto_174949 ?auto_174950 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174950 ?auto_174948 ?auto_174947 )
      ( DELIVER-3PKG-VERIFY ?auto_174948 ?auto_174949 ?auto_174950 ?auto_174947 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174977 - OBJ
      ?auto_174978 - OBJ
      ?auto_174979 - OBJ
      ?auto_174980 - OBJ
      ?auto_174976 - LOCATION
    )
    :vars
    (
      ?auto_174981 - TRUCK
      ?auto_174982 - LOCATION
      ?auto_174983 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174980 ?auto_174981 ) ( TRUCK-AT ?auto_174981 ?auto_174982 ) ( IN-CITY ?auto_174982 ?auto_174983 ) ( IN-CITY ?auto_174976 ?auto_174983 ) ( not ( = ?auto_174976 ?auto_174982 ) ) ( OBJ-AT ?auto_174978 ?auto_174976 ) ( not ( = ?auto_174978 ?auto_174980 ) ) ( OBJ-AT ?auto_174977 ?auto_174976 ) ( OBJ-AT ?auto_174979 ?auto_174976 ) ( not ( = ?auto_174977 ?auto_174978 ) ) ( not ( = ?auto_174977 ?auto_174979 ) ) ( not ( = ?auto_174977 ?auto_174980 ) ) ( not ( = ?auto_174978 ?auto_174979 ) ) ( not ( = ?auto_174979 ?auto_174980 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174978 ?auto_174980 ?auto_174976 )
      ( DELIVER-4PKG-VERIFY ?auto_174977 ?auto_174978 ?auto_174979 ?auto_174980 ?auto_174976 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_174985 - OBJ
      ?auto_174986 - OBJ
      ?auto_174987 - OBJ
      ?auto_174988 - OBJ
      ?auto_174984 - LOCATION
    )
    :vars
    (
      ?auto_174989 - TRUCK
      ?auto_174990 - LOCATION
      ?auto_174991 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_174987 ?auto_174989 ) ( TRUCK-AT ?auto_174989 ?auto_174990 ) ( IN-CITY ?auto_174990 ?auto_174991 ) ( IN-CITY ?auto_174984 ?auto_174991 ) ( not ( = ?auto_174984 ?auto_174990 ) ) ( OBJ-AT ?auto_174985 ?auto_174984 ) ( not ( = ?auto_174985 ?auto_174987 ) ) ( OBJ-AT ?auto_174986 ?auto_174984 ) ( OBJ-AT ?auto_174988 ?auto_174984 ) ( not ( = ?auto_174985 ?auto_174986 ) ) ( not ( = ?auto_174985 ?auto_174988 ) ) ( not ( = ?auto_174986 ?auto_174987 ) ) ( not ( = ?auto_174986 ?auto_174988 ) ) ( not ( = ?auto_174987 ?auto_174988 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_174985 ?auto_174987 ?auto_174984 )
      ( DELIVER-4PKG-VERIFY ?auto_174985 ?auto_174986 ?auto_174987 ?auto_174988 ?auto_174984 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175001 - OBJ
      ?auto_175002 - OBJ
      ?auto_175003 - OBJ
      ?auto_175004 - OBJ
      ?auto_175000 - LOCATION
    )
    :vars
    (
      ?auto_175005 - TRUCK
      ?auto_175006 - LOCATION
      ?auto_175007 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175002 ?auto_175005 ) ( TRUCK-AT ?auto_175005 ?auto_175006 ) ( IN-CITY ?auto_175006 ?auto_175007 ) ( IN-CITY ?auto_175000 ?auto_175007 ) ( not ( = ?auto_175000 ?auto_175006 ) ) ( OBJ-AT ?auto_175004 ?auto_175000 ) ( not ( = ?auto_175004 ?auto_175002 ) ) ( OBJ-AT ?auto_175001 ?auto_175000 ) ( OBJ-AT ?auto_175003 ?auto_175000 ) ( not ( = ?auto_175001 ?auto_175002 ) ) ( not ( = ?auto_175001 ?auto_175003 ) ) ( not ( = ?auto_175001 ?auto_175004 ) ) ( not ( = ?auto_175002 ?auto_175003 ) ) ( not ( = ?auto_175003 ?auto_175004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175004 ?auto_175002 ?auto_175000 )
      ( DELIVER-4PKG-VERIFY ?auto_175001 ?auto_175002 ?auto_175003 ?auto_175004 ?auto_175000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175033 - OBJ
      ?auto_175034 - OBJ
      ?auto_175035 - OBJ
      ?auto_175036 - OBJ
      ?auto_175032 - LOCATION
    )
    :vars
    (
      ?auto_175037 - TRUCK
      ?auto_175038 - LOCATION
      ?auto_175039 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175033 ?auto_175037 ) ( TRUCK-AT ?auto_175037 ?auto_175038 ) ( IN-CITY ?auto_175038 ?auto_175039 ) ( IN-CITY ?auto_175032 ?auto_175039 ) ( not ( = ?auto_175032 ?auto_175038 ) ) ( OBJ-AT ?auto_175035 ?auto_175032 ) ( not ( = ?auto_175035 ?auto_175033 ) ) ( OBJ-AT ?auto_175034 ?auto_175032 ) ( OBJ-AT ?auto_175036 ?auto_175032 ) ( not ( = ?auto_175033 ?auto_175034 ) ) ( not ( = ?auto_175033 ?auto_175036 ) ) ( not ( = ?auto_175034 ?auto_175035 ) ) ( not ( = ?auto_175034 ?auto_175036 ) ) ( not ( = ?auto_175035 ?auto_175036 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175035 ?auto_175033 ?auto_175032 )
      ( DELIVER-4PKG-VERIFY ?auto_175033 ?auto_175034 ?auto_175035 ?auto_175036 ?auto_175032 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175098 - OBJ
      ?auto_175097 - LOCATION
    )
    :vars
    (
      ?auto_175099 - TRUCK
      ?auto_175100 - LOCATION
      ?auto_175102 - CITY
      ?auto_175101 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175099 ?auto_175100 ) ( IN-CITY ?auto_175100 ?auto_175102 ) ( IN-CITY ?auto_175097 ?auto_175102 ) ( not ( = ?auto_175097 ?auto_175100 ) ) ( OBJ-AT ?auto_175101 ?auto_175097 ) ( not ( = ?auto_175101 ?auto_175098 ) ) ( OBJ-AT ?auto_175098 ?auto_175100 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_175098 ?auto_175099 ?auto_175100 )
      ( DELIVER-2PKG ?auto_175101 ?auto_175098 ?auto_175097 )
      ( DELIVER-1PKG-VERIFY ?auto_175098 ?auto_175097 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175104 - OBJ
      ?auto_175105 - OBJ
      ?auto_175103 - LOCATION
    )
    :vars
    (
      ?auto_175107 - TRUCK
      ?auto_175108 - LOCATION
      ?auto_175106 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175107 ?auto_175108 ) ( IN-CITY ?auto_175108 ?auto_175106 ) ( IN-CITY ?auto_175103 ?auto_175106 ) ( not ( = ?auto_175103 ?auto_175108 ) ) ( OBJ-AT ?auto_175104 ?auto_175103 ) ( not ( = ?auto_175104 ?auto_175105 ) ) ( OBJ-AT ?auto_175105 ?auto_175108 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175105 ?auto_175103 )
      ( DELIVER-2PKG-VERIFY ?auto_175104 ?auto_175105 ?auto_175103 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175110 - OBJ
      ?auto_175111 - OBJ
      ?auto_175109 - LOCATION
    )
    :vars
    (
      ?auto_175112 - TRUCK
      ?auto_175114 - LOCATION
      ?auto_175113 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175112 ?auto_175114 ) ( IN-CITY ?auto_175114 ?auto_175113 ) ( IN-CITY ?auto_175109 ?auto_175113 ) ( not ( = ?auto_175109 ?auto_175114 ) ) ( OBJ-AT ?auto_175111 ?auto_175109 ) ( not ( = ?auto_175111 ?auto_175110 ) ) ( OBJ-AT ?auto_175110 ?auto_175114 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175111 ?auto_175110 ?auto_175109 )
      ( DELIVER-2PKG-VERIFY ?auto_175110 ?auto_175111 ?auto_175109 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175123 - OBJ
      ?auto_175124 - OBJ
      ?auto_175125 - OBJ
      ?auto_175122 - LOCATION
    )
    :vars
    (
      ?auto_175126 - TRUCK
      ?auto_175128 - LOCATION
      ?auto_175127 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175126 ?auto_175128 ) ( IN-CITY ?auto_175128 ?auto_175127 ) ( IN-CITY ?auto_175122 ?auto_175127 ) ( not ( = ?auto_175122 ?auto_175128 ) ) ( OBJ-AT ?auto_175123 ?auto_175122 ) ( not ( = ?auto_175123 ?auto_175125 ) ) ( OBJ-AT ?auto_175125 ?auto_175128 ) ( OBJ-AT ?auto_175124 ?auto_175122 ) ( not ( = ?auto_175123 ?auto_175124 ) ) ( not ( = ?auto_175124 ?auto_175125 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175123 ?auto_175125 ?auto_175122 )
      ( DELIVER-3PKG-VERIFY ?auto_175123 ?auto_175124 ?auto_175125 ?auto_175122 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175130 - OBJ
      ?auto_175131 - OBJ
      ?auto_175132 - OBJ
      ?auto_175129 - LOCATION
    )
    :vars
    (
      ?auto_175133 - TRUCK
      ?auto_175135 - LOCATION
      ?auto_175134 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175133 ?auto_175135 ) ( IN-CITY ?auto_175135 ?auto_175134 ) ( IN-CITY ?auto_175129 ?auto_175134 ) ( not ( = ?auto_175129 ?auto_175135 ) ) ( OBJ-AT ?auto_175132 ?auto_175129 ) ( not ( = ?auto_175132 ?auto_175131 ) ) ( OBJ-AT ?auto_175131 ?auto_175135 ) ( OBJ-AT ?auto_175130 ?auto_175129 ) ( not ( = ?auto_175130 ?auto_175131 ) ) ( not ( = ?auto_175130 ?auto_175132 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175132 ?auto_175131 ?auto_175129 )
      ( DELIVER-3PKG-VERIFY ?auto_175130 ?auto_175131 ?auto_175132 ?auto_175129 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175144 - OBJ
      ?auto_175145 - OBJ
      ?auto_175146 - OBJ
      ?auto_175143 - LOCATION
    )
    :vars
    (
      ?auto_175147 - TRUCK
      ?auto_175149 - LOCATION
      ?auto_175148 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175147 ?auto_175149 ) ( IN-CITY ?auto_175149 ?auto_175148 ) ( IN-CITY ?auto_175143 ?auto_175148 ) ( not ( = ?auto_175143 ?auto_175149 ) ) ( OBJ-AT ?auto_175146 ?auto_175143 ) ( not ( = ?auto_175146 ?auto_175144 ) ) ( OBJ-AT ?auto_175144 ?auto_175149 ) ( OBJ-AT ?auto_175145 ?auto_175143 ) ( not ( = ?auto_175144 ?auto_175145 ) ) ( not ( = ?auto_175145 ?auto_175146 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175146 ?auto_175144 ?auto_175143 )
      ( DELIVER-3PKG-VERIFY ?auto_175144 ?auto_175145 ?auto_175146 ?auto_175143 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175173 - OBJ
      ?auto_175174 - OBJ
      ?auto_175175 - OBJ
      ?auto_175176 - OBJ
      ?auto_175172 - LOCATION
    )
    :vars
    (
      ?auto_175177 - TRUCK
      ?auto_175179 - LOCATION
      ?auto_175178 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175177 ?auto_175179 ) ( IN-CITY ?auto_175179 ?auto_175178 ) ( IN-CITY ?auto_175172 ?auto_175178 ) ( not ( = ?auto_175172 ?auto_175179 ) ) ( OBJ-AT ?auto_175175 ?auto_175172 ) ( not ( = ?auto_175175 ?auto_175176 ) ) ( OBJ-AT ?auto_175176 ?auto_175179 ) ( OBJ-AT ?auto_175173 ?auto_175172 ) ( OBJ-AT ?auto_175174 ?auto_175172 ) ( not ( = ?auto_175173 ?auto_175174 ) ) ( not ( = ?auto_175173 ?auto_175175 ) ) ( not ( = ?auto_175173 ?auto_175176 ) ) ( not ( = ?auto_175174 ?auto_175175 ) ) ( not ( = ?auto_175174 ?auto_175176 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175175 ?auto_175176 ?auto_175172 )
      ( DELIVER-4PKG-VERIFY ?auto_175173 ?auto_175174 ?auto_175175 ?auto_175176 ?auto_175172 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175181 - OBJ
      ?auto_175182 - OBJ
      ?auto_175183 - OBJ
      ?auto_175184 - OBJ
      ?auto_175180 - LOCATION
    )
    :vars
    (
      ?auto_175185 - TRUCK
      ?auto_175187 - LOCATION
      ?auto_175186 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175185 ?auto_175187 ) ( IN-CITY ?auto_175187 ?auto_175186 ) ( IN-CITY ?auto_175180 ?auto_175186 ) ( not ( = ?auto_175180 ?auto_175187 ) ) ( OBJ-AT ?auto_175184 ?auto_175180 ) ( not ( = ?auto_175184 ?auto_175183 ) ) ( OBJ-AT ?auto_175183 ?auto_175187 ) ( OBJ-AT ?auto_175181 ?auto_175180 ) ( OBJ-AT ?auto_175182 ?auto_175180 ) ( not ( = ?auto_175181 ?auto_175182 ) ) ( not ( = ?auto_175181 ?auto_175183 ) ) ( not ( = ?auto_175181 ?auto_175184 ) ) ( not ( = ?auto_175182 ?auto_175183 ) ) ( not ( = ?auto_175182 ?auto_175184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175184 ?auto_175183 ?auto_175180 )
      ( DELIVER-4PKG-VERIFY ?auto_175181 ?auto_175182 ?auto_175183 ?auto_175184 ?auto_175180 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175197 - OBJ
      ?auto_175198 - OBJ
      ?auto_175199 - OBJ
      ?auto_175200 - OBJ
      ?auto_175196 - LOCATION
    )
    :vars
    (
      ?auto_175201 - TRUCK
      ?auto_175203 - LOCATION
      ?auto_175202 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175201 ?auto_175203 ) ( IN-CITY ?auto_175203 ?auto_175202 ) ( IN-CITY ?auto_175196 ?auto_175202 ) ( not ( = ?auto_175196 ?auto_175203 ) ) ( OBJ-AT ?auto_175200 ?auto_175196 ) ( not ( = ?auto_175200 ?auto_175198 ) ) ( OBJ-AT ?auto_175198 ?auto_175203 ) ( OBJ-AT ?auto_175197 ?auto_175196 ) ( OBJ-AT ?auto_175199 ?auto_175196 ) ( not ( = ?auto_175197 ?auto_175198 ) ) ( not ( = ?auto_175197 ?auto_175199 ) ) ( not ( = ?auto_175197 ?auto_175200 ) ) ( not ( = ?auto_175198 ?auto_175199 ) ) ( not ( = ?auto_175199 ?auto_175200 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175200 ?auto_175198 ?auto_175196 )
      ( DELIVER-4PKG-VERIFY ?auto_175197 ?auto_175198 ?auto_175199 ?auto_175200 ?auto_175196 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175229 - OBJ
      ?auto_175230 - OBJ
      ?auto_175231 - OBJ
      ?auto_175232 - OBJ
      ?auto_175228 - LOCATION
    )
    :vars
    (
      ?auto_175233 - TRUCK
      ?auto_175235 - LOCATION
      ?auto_175234 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175233 ?auto_175235 ) ( IN-CITY ?auto_175235 ?auto_175234 ) ( IN-CITY ?auto_175228 ?auto_175234 ) ( not ( = ?auto_175228 ?auto_175235 ) ) ( OBJ-AT ?auto_175231 ?auto_175228 ) ( not ( = ?auto_175231 ?auto_175229 ) ) ( OBJ-AT ?auto_175229 ?auto_175235 ) ( OBJ-AT ?auto_175230 ?auto_175228 ) ( OBJ-AT ?auto_175232 ?auto_175228 ) ( not ( = ?auto_175229 ?auto_175230 ) ) ( not ( = ?auto_175229 ?auto_175232 ) ) ( not ( = ?auto_175230 ?auto_175231 ) ) ( not ( = ?auto_175230 ?auto_175232 ) ) ( not ( = ?auto_175231 ?auto_175232 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175231 ?auto_175229 ?auto_175228 )
      ( DELIVER-4PKG-VERIFY ?auto_175229 ?auto_175230 ?auto_175231 ?auto_175232 ?auto_175228 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175294 - OBJ
      ?auto_175293 - LOCATION
    )
    :vars
    (
      ?auto_175298 - LOCATION
      ?auto_175296 - CITY
      ?auto_175297 - OBJ
      ?auto_175295 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175298 ?auto_175296 ) ( IN-CITY ?auto_175293 ?auto_175296 ) ( not ( = ?auto_175293 ?auto_175298 ) ) ( OBJ-AT ?auto_175297 ?auto_175293 ) ( not ( = ?auto_175297 ?auto_175294 ) ) ( OBJ-AT ?auto_175294 ?auto_175298 ) ( TRUCK-AT ?auto_175295 ?auto_175293 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_175295 ?auto_175293 ?auto_175298 ?auto_175296 )
      ( DELIVER-2PKG ?auto_175297 ?auto_175294 ?auto_175293 )
      ( DELIVER-1PKG-VERIFY ?auto_175294 ?auto_175293 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175300 - OBJ
      ?auto_175301 - OBJ
      ?auto_175299 - LOCATION
    )
    :vars
    (
      ?auto_175303 - LOCATION
      ?auto_175302 - CITY
      ?auto_175304 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175303 ?auto_175302 ) ( IN-CITY ?auto_175299 ?auto_175302 ) ( not ( = ?auto_175299 ?auto_175303 ) ) ( OBJ-AT ?auto_175300 ?auto_175299 ) ( not ( = ?auto_175300 ?auto_175301 ) ) ( OBJ-AT ?auto_175301 ?auto_175303 ) ( TRUCK-AT ?auto_175304 ?auto_175299 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175301 ?auto_175299 )
      ( DELIVER-2PKG-VERIFY ?auto_175300 ?auto_175301 ?auto_175299 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175306 - OBJ
      ?auto_175307 - OBJ
      ?auto_175305 - LOCATION
    )
    :vars
    (
      ?auto_175309 - LOCATION
      ?auto_175308 - CITY
      ?auto_175310 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175309 ?auto_175308 ) ( IN-CITY ?auto_175305 ?auto_175308 ) ( not ( = ?auto_175305 ?auto_175309 ) ) ( OBJ-AT ?auto_175307 ?auto_175305 ) ( not ( = ?auto_175307 ?auto_175306 ) ) ( OBJ-AT ?auto_175306 ?auto_175309 ) ( TRUCK-AT ?auto_175310 ?auto_175305 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175307 ?auto_175306 ?auto_175305 )
      ( DELIVER-2PKG-VERIFY ?auto_175306 ?auto_175307 ?auto_175305 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175319 - OBJ
      ?auto_175320 - OBJ
      ?auto_175321 - OBJ
      ?auto_175318 - LOCATION
    )
    :vars
    (
      ?auto_175323 - LOCATION
      ?auto_175322 - CITY
      ?auto_175324 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175323 ?auto_175322 ) ( IN-CITY ?auto_175318 ?auto_175322 ) ( not ( = ?auto_175318 ?auto_175323 ) ) ( OBJ-AT ?auto_175320 ?auto_175318 ) ( not ( = ?auto_175320 ?auto_175321 ) ) ( OBJ-AT ?auto_175321 ?auto_175323 ) ( TRUCK-AT ?auto_175324 ?auto_175318 ) ( OBJ-AT ?auto_175319 ?auto_175318 ) ( not ( = ?auto_175319 ?auto_175320 ) ) ( not ( = ?auto_175319 ?auto_175321 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175320 ?auto_175321 ?auto_175318 )
      ( DELIVER-3PKG-VERIFY ?auto_175319 ?auto_175320 ?auto_175321 ?auto_175318 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175326 - OBJ
      ?auto_175327 - OBJ
      ?auto_175328 - OBJ
      ?auto_175325 - LOCATION
    )
    :vars
    (
      ?auto_175330 - LOCATION
      ?auto_175329 - CITY
      ?auto_175331 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175330 ?auto_175329 ) ( IN-CITY ?auto_175325 ?auto_175329 ) ( not ( = ?auto_175325 ?auto_175330 ) ) ( OBJ-AT ?auto_175328 ?auto_175325 ) ( not ( = ?auto_175328 ?auto_175327 ) ) ( OBJ-AT ?auto_175327 ?auto_175330 ) ( TRUCK-AT ?auto_175331 ?auto_175325 ) ( OBJ-AT ?auto_175326 ?auto_175325 ) ( not ( = ?auto_175326 ?auto_175327 ) ) ( not ( = ?auto_175326 ?auto_175328 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175328 ?auto_175327 ?auto_175325 )
      ( DELIVER-3PKG-VERIFY ?auto_175326 ?auto_175327 ?auto_175328 ?auto_175325 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175340 - OBJ
      ?auto_175341 - OBJ
      ?auto_175342 - OBJ
      ?auto_175339 - LOCATION
    )
    :vars
    (
      ?auto_175344 - LOCATION
      ?auto_175343 - CITY
      ?auto_175345 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175344 ?auto_175343 ) ( IN-CITY ?auto_175339 ?auto_175343 ) ( not ( = ?auto_175339 ?auto_175344 ) ) ( OBJ-AT ?auto_175342 ?auto_175339 ) ( not ( = ?auto_175342 ?auto_175340 ) ) ( OBJ-AT ?auto_175340 ?auto_175344 ) ( TRUCK-AT ?auto_175345 ?auto_175339 ) ( OBJ-AT ?auto_175341 ?auto_175339 ) ( not ( = ?auto_175340 ?auto_175341 ) ) ( not ( = ?auto_175341 ?auto_175342 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175342 ?auto_175340 ?auto_175339 )
      ( DELIVER-3PKG-VERIFY ?auto_175340 ?auto_175341 ?auto_175342 ?auto_175339 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175369 - OBJ
      ?auto_175370 - OBJ
      ?auto_175371 - OBJ
      ?auto_175372 - OBJ
      ?auto_175368 - LOCATION
    )
    :vars
    (
      ?auto_175374 - LOCATION
      ?auto_175373 - CITY
      ?auto_175375 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175374 ?auto_175373 ) ( IN-CITY ?auto_175368 ?auto_175373 ) ( not ( = ?auto_175368 ?auto_175374 ) ) ( OBJ-AT ?auto_175369 ?auto_175368 ) ( not ( = ?auto_175369 ?auto_175372 ) ) ( OBJ-AT ?auto_175372 ?auto_175374 ) ( TRUCK-AT ?auto_175375 ?auto_175368 ) ( OBJ-AT ?auto_175370 ?auto_175368 ) ( OBJ-AT ?auto_175371 ?auto_175368 ) ( not ( = ?auto_175369 ?auto_175370 ) ) ( not ( = ?auto_175369 ?auto_175371 ) ) ( not ( = ?auto_175370 ?auto_175371 ) ) ( not ( = ?auto_175370 ?auto_175372 ) ) ( not ( = ?auto_175371 ?auto_175372 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175369 ?auto_175372 ?auto_175368 )
      ( DELIVER-4PKG-VERIFY ?auto_175369 ?auto_175370 ?auto_175371 ?auto_175372 ?auto_175368 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175377 - OBJ
      ?auto_175378 - OBJ
      ?auto_175379 - OBJ
      ?auto_175380 - OBJ
      ?auto_175376 - LOCATION
    )
    :vars
    (
      ?auto_175382 - LOCATION
      ?auto_175381 - CITY
      ?auto_175383 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175382 ?auto_175381 ) ( IN-CITY ?auto_175376 ?auto_175381 ) ( not ( = ?auto_175376 ?auto_175382 ) ) ( OBJ-AT ?auto_175377 ?auto_175376 ) ( not ( = ?auto_175377 ?auto_175379 ) ) ( OBJ-AT ?auto_175379 ?auto_175382 ) ( TRUCK-AT ?auto_175383 ?auto_175376 ) ( OBJ-AT ?auto_175378 ?auto_175376 ) ( OBJ-AT ?auto_175380 ?auto_175376 ) ( not ( = ?auto_175377 ?auto_175378 ) ) ( not ( = ?auto_175377 ?auto_175380 ) ) ( not ( = ?auto_175378 ?auto_175379 ) ) ( not ( = ?auto_175378 ?auto_175380 ) ) ( not ( = ?auto_175379 ?auto_175380 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175377 ?auto_175379 ?auto_175376 )
      ( DELIVER-4PKG-VERIFY ?auto_175377 ?auto_175378 ?auto_175379 ?auto_175380 ?auto_175376 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175393 - OBJ
      ?auto_175394 - OBJ
      ?auto_175395 - OBJ
      ?auto_175396 - OBJ
      ?auto_175392 - LOCATION
    )
    :vars
    (
      ?auto_175398 - LOCATION
      ?auto_175397 - CITY
      ?auto_175399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175398 ?auto_175397 ) ( IN-CITY ?auto_175392 ?auto_175397 ) ( not ( = ?auto_175392 ?auto_175398 ) ) ( OBJ-AT ?auto_175396 ?auto_175392 ) ( not ( = ?auto_175396 ?auto_175394 ) ) ( OBJ-AT ?auto_175394 ?auto_175398 ) ( TRUCK-AT ?auto_175399 ?auto_175392 ) ( OBJ-AT ?auto_175393 ?auto_175392 ) ( OBJ-AT ?auto_175395 ?auto_175392 ) ( not ( = ?auto_175393 ?auto_175394 ) ) ( not ( = ?auto_175393 ?auto_175395 ) ) ( not ( = ?auto_175393 ?auto_175396 ) ) ( not ( = ?auto_175394 ?auto_175395 ) ) ( not ( = ?auto_175395 ?auto_175396 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175396 ?auto_175394 ?auto_175392 )
      ( DELIVER-4PKG-VERIFY ?auto_175393 ?auto_175394 ?auto_175395 ?auto_175396 ?auto_175392 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175425 - OBJ
      ?auto_175426 - OBJ
      ?auto_175427 - OBJ
      ?auto_175428 - OBJ
      ?auto_175424 - LOCATION
    )
    :vars
    (
      ?auto_175430 - LOCATION
      ?auto_175429 - CITY
      ?auto_175431 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175430 ?auto_175429 ) ( IN-CITY ?auto_175424 ?auto_175429 ) ( not ( = ?auto_175424 ?auto_175430 ) ) ( OBJ-AT ?auto_175427 ?auto_175424 ) ( not ( = ?auto_175427 ?auto_175425 ) ) ( OBJ-AT ?auto_175425 ?auto_175430 ) ( TRUCK-AT ?auto_175431 ?auto_175424 ) ( OBJ-AT ?auto_175426 ?auto_175424 ) ( OBJ-AT ?auto_175428 ?auto_175424 ) ( not ( = ?auto_175425 ?auto_175426 ) ) ( not ( = ?auto_175425 ?auto_175428 ) ) ( not ( = ?auto_175426 ?auto_175427 ) ) ( not ( = ?auto_175426 ?auto_175428 ) ) ( not ( = ?auto_175427 ?auto_175428 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175427 ?auto_175425 ?auto_175424 )
      ( DELIVER-4PKG-VERIFY ?auto_175425 ?auto_175426 ?auto_175427 ?auto_175428 ?auto_175424 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175490 - OBJ
      ?auto_175489 - LOCATION
    )
    :vars
    (
      ?auto_175493 - LOCATION
      ?auto_175491 - CITY
      ?auto_175492 - OBJ
      ?auto_175494 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175493 ?auto_175491 ) ( IN-CITY ?auto_175489 ?auto_175491 ) ( not ( = ?auto_175489 ?auto_175493 ) ) ( not ( = ?auto_175492 ?auto_175490 ) ) ( OBJ-AT ?auto_175490 ?auto_175493 ) ( TRUCK-AT ?auto_175494 ?auto_175489 ) ( IN-TRUCK ?auto_175492 ?auto_175494 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175492 ?auto_175489 )
      ( DELIVER-2PKG ?auto_175492 ?auto_175490 ?auto_175489 )
      ( DELIVER-1PKG-VERIFY ?auto_175490 ?auto_175489 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175496 - OBJ
      ?auto_175497 - OBJ
      ?auto_175495 - LOCATION
    )
    :vars
    (
      ?auto_175498 - LOCATION
      ?auto_175500 - CITY
      ?auto_175499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175498 ?auto_175500 ) ( IN-CITY ?auto_175495 ?auto_175500 ) ( not ( = ?auto_175495 ?auto_175498 ) ) ( not ( = ?auto_175496 ?auto_175497 ) ) ( OBJ-AT ?auto_175497 ?auto_175498 ) ( TRUCK-AT ?auto_175499 ?auto_175495 ) ( IN-TRUCK ?auto_175496 ?auto_175499 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175497 ?auto_175495 )
      ( DELIVER-2PKG-VERIFY ?auto_175496 ?auto_175497 ?auto_175495 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175502 - OBJ
      ?auto_175503 - OBJ
      ?auto_175501 - LOCATION
    )
    :vars
    (
      ?auto_175504 - LOCATION
      ?auto_175505 - CITY
      ?auto_175506 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175504 ?auto_175505 ) ( IN-CITY ?auto_175501 ?auto_175505 ) ( not ( = ?auto_175501 ?auto_175504 ) ) ( not ( = ?auto_175503 ?auto_175502 ) ) ( OBJ-AT ?auto_175502 ?auto_175504 ) ( TRUCK-AT ?auto_175506 ?auto_175501 ) ( IN-TRUCK ?auto_175503 ?auto_175506 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175503 ?auto_175502 ?auto_175501 )
      ( DELIVER-2PKG-VERIFY ?auto_175502 ?auto_175503 ?auto_175501 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175686 - OBJ
      ?auto_175685 - LOCATION
    )
    :vars
    (
      ?auto_175688 - LOCATION
      ?auto_175689 - CITY
      ?auto_175687 - OBJ
      ?auto_175690 - TRUCK
      ?auto_175691 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175688 ?auto_175689 ) ( IN-CITY ?auto_175685 ?auto_175689 ) ( not ( = ?auto_175685 ?auto_175688 ) ) ( not ( = ?auto_175687 ?auto_175686 ) ) ( OBJ-AT ?auto_175686 ?auto_175688 ) ( IN-TRUCK ?auto_175687 ?auto_175690 ) ( TRUCK-AT ?auto_175690 ?auto_175691 ) ( IN-CITY ?auto_175691 ?auto_175689 ) ( not ( = ?auto_175685 ?auto_175691 ) ) ( not ( = ?auto_175688 ?auto_175691 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_175690 ?auto_175691 ?auto_175685 ?auto_175689 )
      ( DELIVER-2PKG ?auto_175687 ?auto_175686 ?auto_175685 )
      ( DELIVER-1PKG-VERIFY ?auto_175686 ?auto_175685 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175693 - OBJ
      ?auto_175694 - OBJ
      ?auto_175692 - LOCATION
    )
    :vars
    (
      ?auto_175696 - LOCATION
      ?auto_175697 - CITY
      ?auto_175698 - TRUCK
      ?auto_175695 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175696 ?auto_175697 ) ( IN-CITY ?auto_175692 ?auto_175697 ) ( not ( = ?auto_175692 ?auto_175696 ) ) ( not ( = ?auto_175693 ?auto_175694 ) ) ( OBJ-AT ?auto_175694 ?auto_175696 ) ( IN-TRUCK ?auto_175693 ?auto_175698 ) ( TRUCK-AT ?auto_175698 ?auto_175695 ) ( IN-CITY ?auto_175695 ?auto_175697 ) ( not ( = ?auto_175692 ?auto_175695 ) ) ( not ( = ?auto_175696 ?auto_175695 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175694 ?auto_175692 )
      ( DELIVER-2PKG-VERIFY ?auto_175693 ?auto_175694 ?auto_175692 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175700 - OBJ
      ?auto_175701 - OBJ
      ?auto_175699 - LOCATION
    )
    :vars
    (
      ?auto_175704 - LOCATION
      ?auto_175705 - CITY
      ?auto_175702 - TRUCK
      ?auto_175703 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175704 ?auto_175705 ) ( IN-CITY ?auto_175699 ?auto_175705 ) ( not ( = ?auto_175699 ?auto_175704 ) ) ( not ( = ?auto_175701 ?auto_175700 ) ) ( OBJ-AT ?auto_175700 ?auto_175704 ) ( IN-TRUCK ?auto_175701 ?auto_175702 ) ( TRUCK-AT ?auto_175702 ?auto_175703 ) ( IN-CITY ?auto_175703 ?auto_175705 ) ( not ( = ?auto_175699 ?auto_175703 ) ) ( not ( = ?auto_175704 ?auto_175703 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175701 ?auto_175700 ?auto_175699 )
      ( DELIVER-2PKG-VERIFY ?auto_175700 ?auto_175701 ?auto_175699 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175908 - OBJ
      ?auto_175907 - LOCATION
    )
    :vars
    (
      ?auto_175912 - LOCATION
      ?auto_175913 - CITY
      ?auto_175909 - OBJ
      ?auto_175910 - TRUCK
      ?auto_175911 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175912 ?auto_175913 ) ( IN-CITY ?auto_175907 ?auto_175913 ) ( not ( = ?auto_175907 ?auto_175912 ) ) ( not ( = ?auto_175909 ?auto_175908 ) ) ( OBJ-AT ?auto_175908 ?auto_175912 ) ( TRUCK-AT ?auto_175910 ?auto_175911 ) ( IN-CITY ?auto_175911 ?auto_175913 ) ( not ( = ?auto_175907 ?auto_175911 ) ) ( not ( = ?auto_175912 ?auto_175911 ) ) ( OBJ-AT ?auto_175909 ?auto_175911 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_175909 ?auto_175910 ?auto_175911 )
      ( DELIVER-2PKG ?auto_175909 ?auto_175908 ?auto_175907 )
      ( DELIVER-1PKG-VERIFY ?auto_175908 ?auto_175907 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175915 - OBJ
      ?auto_175916 - OBJ
      ?auto_175914 - LOCATION
    )
    :vars
    (
      ?auto_175918 - LOCATION
      ?auto_175919 - CITY
      ?auto_175920 - TRUCK
      ?auto_175917 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175918 ?auto_175919 ) ( IN-CITY ?auto_175914 ?auto_175919 ) ( not ( = ?auto_175914 ?auto_175918 ) ) ( not ( = ?auto_175915 ?auto_175916 ) ) ( OBJ-AT ?auto_175916 ?auto_175918 ) ( TRUCK-AT ?auto_175920 ?auto_175917 ) ( IN-CITY ?auto_175917 ?auto_175919 ) ( not ( = ?auto_175914 ?auto_175917 ) ) ( not ( = ?auto_175918 ?auto_175917 ) ) ( OBJ-AT ?auto_175915 ?auto_175917 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175916 ?auto_175914 )
      ( DELIVER-2PKG-VERIFY ?auto_175915 ?auto_175916 ?auto_175914 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175922 - OBJ
      ?auto_175923 - OBJ
      ?auto_175921 - LOCATION
    )
    :vars
    (
      ?auto_175927 - LOCATION
      ?auto_175926 - CITY
      ?auto_175925 - TRUCK
      ?auto_175924 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_175927 ?auto_175926 ) ( IN-CITY ?auto_175921 ?auto_175926 ) ( not ( = ?auto_175921 ?auto_175927 ) ) ( not ( = ?auto_175923 ?auto_175922 ) ) ( OBJ-AT ?auto_175922 ?auto_175927 ) ( TRUCK-AT ?auto_175925 ?auto_175924 ) ( IN-CITY ?auto_175924 ?auto_175926 ) ( not ( = ?auto_175921 ?auto_175924 ) ) ( not ( = ?auto_175927 ?auto_175924 ) ) ( OBJ-AT ?auto_175923 ?auto_175924 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175923 ?auto_175922 ?auto_175921 )
      ( DELIVER-2PKG-VERIFY ?auto_175922 ?auto_175923 ?auto_175921 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177267 - OBJ
      ?auto_177268 - OBJ
      ?auto_177269 - OBJ
      ?auto_177266 - LOCATION
    )
    :vars
    (
      ?auto_177272 - TRUCK
      ?auto_177271 - LOCATION
      ?auto_177270 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177269 ?auto_177272 ) ( TRUCK-AT ?auto_177272 ?auto_177271 ) ( IN-CITY ?auto_177271 ?auto_177270 ) ( IN-CITY ?auto_177266 ?auto_177270 ) ( not ( = ?auto_177266 ?auto_177271 ) ) ( OBJ-AT ?auto_177268 ?auto_177266 ) ( not ( = ?auto_177268 ?auto_177269 ) ) ( OBJ-AT ?auto_177267 ?auto_177266 ) ( not ( = ?auto_177267 ?auto_177268 ) ) ( not ( = ?auto_177267 ?auto_177269 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177268 ?auto_177269 ?auto_177266 )
      ( DELIVER-3PKG-VERIFY ?auto_177267 ?auto_177268 ?auto_177269 ?auto_177266 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177300 - OBJ
      ?auto_177301 - OBJ
      ?auto_177302 - OBJ
      ?auto_177299 - LOCATION
    )
    :vars
    (
      ?auto_177306 - TRUCK
      ?auto_177304 - LOCATION
      ?auto_177303 - CITY
      ?auto_177305 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177302 ?auto_177306 ) ( TRUCK-AT ?auto_177306 ?auto_177304 ) ( IN-CITY ?auto_177304 ?auto_177303 ) ( IN-CITY ?auto_177299 ?auto_177303 ) ( not ( = ?auto_177299 ?auto_177304 ) ) ( OBJ-AT ?auto_177305 ?auto_177299 ) ( not ( = ?auto_177305 ?auto_177302 ) ) ( OBJ-AT ?auto_177300 ?auto_177299 ) ( OBJ-AT ?auto_177301 ?auto_177299 ) ( not ( = ?auto_177300 ?auto_177301 ) ) ( not ( = ?auto_177300 ?auto_177302 ) ) ( not ( = ?auto_177300 ?auto_177305 ) ) ( not ( = ?auto_177301 ?auto_177302 ) ) ( not ( = ?auto_177301 ?auto_177305 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177305 ?auto_177302 ?auto_177299 )
      ( DELIVER-3PKG-VERIFY ?auto_177300 ?auto_177301 ?auto_177302 ?auto_177299 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177312 - OBJ
      ?auto_177313 - OBJ
      ?auto_177314 - OBJ
      ?auto_177311 - LOCATION
    )
    :vars
    (
      ?auto_177318 - TRUCK
      ?auto_177316 - LOCATION
      ?auto_177315 - CITY
      ?auto_177317 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177313 ?auto_177318 ) ( TRUCK-AT ?auto_177318 ?auto_177316 ) ( IN-CITY ?auto_177316 ?auto_177315 ) ( IN-CITY ?auto_177311 ?auto_177315 ) ( not ( = ?auto_177311 ?auto_177316 ) ) ( OBJ-AT ?auto_177317 ?auto_177311 ) ( not ( = ?auto_177317 ?auto_177313 ) ) ( OBJ-AT ?auto_177312 ?auto_177311 ) ( OBJ-AT ?auto_177314 ?auto_177311 ) ( not ( = ?auto_177312 ?auto_177313 ) ) ( not ( = ?auto_177312 ?auto_177314 ) ) ( not ( = ?auto_177312 ?auto_177317 ) ) ( not ( = ?auto_177313 ?auto_177314 ) ) ( not ( = ?auto_177314 ?auto_177317 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177317 ?auto_177313 ?auto_177311 )
      ( DELIVER-3PKG-VERIFY ?auto_177312 ?auto_177313 ?auto_177314 ?auto_177311 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177350 - OBJ
      ?auto_177351 - OBJ
      ?auto_177352 - OBJ
      ?auto_177349 - LOCATION
    )
    :vars
    (
      ?auto_177356 - TRUCK
      ?auto_177354 - LOCATION
      ?auto_177353 - CITY
      ?auto_177355 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177350 ?auto_177356 ) ( TRUCK-AT ?auto_177356 ?auto_177354 ) ( IN-CITY ?auto_177354 ?auto_177353 ) ( IN-CITY ?auto_177349 ?auto_177353 ) ( not ( = ?auto_177349 ?auto_177354 ) ) ( OBJ-AT ?auto_177355 ?auto_177349 ) ( not ( = ?auto_177355 ?auto_177350 ) ) ( OBJ-AT ?auto_177351 ?auto_177349 ) ( OBJ-AT ?auto_177352 ?auto_177349 ) ( not ( = ?auto_177350 ?auto_177351 ) ) ( not ( = ?auto_177350 ?auto_177352 ) ) ( not ( = ?auto_177351 ?auto_177352 ) ) ( not ( = ?auto_177351 ?auto_177355 ) ) ( not ( = ?auto_177352 ?auto_177355 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177355 ?auto_177350 ?auto_177349 )
      ( DELIVER-3PKG-VERIFY ?auto_177350 ?auto_177351 ?auto_177352 ?auto_177349 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177397 - OBJ
      ?auto_177398 - OBJ
      ?auto_177399 - OBJ
      ?auto_177400 - OBJ
      ?auto_177396 - LOCATION
    )
    :vars
    (
      ?auto_177403 - TRUCK
      ?auto_177402 - LOCATION
      ?auto_177401 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177400 ?auto_177403 ) ( TRUCK-AT ?auto_177403 ?auto_177402 ) ( IN-CITY ?auto_177402 ?auto_177401 ) ( IN-CITY ?auto_177396 ?auto_177401 ) ( not ( = ?auto_177396 ?auto_177402 ) ) ( OBJ-AT ?auto_177397 ?auto_177396 ) ( not ( = ?auto_177397 ?auto_177400 ) ) ( OBJ-AT ?auto_177398 ?auto_177396 ) ( OBJ-AT ?auto_177399 ?auto_177396 ) ( not ( = ?auto_177397 ?auto_177398 ) ) ( not ( = ?auto_177397 ?auto_177399 ) ) ( not ( = ?auto_177398 ?auto_177399 ) ) ( not ( = ?auto_177398 ?auto_177400 ) ) ( not ( = ?auto_177399 ?auto_177400 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177397 ?auto_177400 ?auto_177396 )
      ( DELIVER-4PKG-VERIFY ?auto_177397 ?auto_177398 ?auto_177399 ?auto_177400 ?auto_177396 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177429 - OBJ
      ?auto_177430 - OBJ
      ?auto_177431 - OBJ
      ?auto_177432 - OBJ
      ?auto_177428 - LOCATION
    )
    :vars
    (
      ?auto_177435 - TRUCK
      ?auto_177434 - LOCATION
      ?auto_177433 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177432 ?auto_177435 ) ( TRUCK-AT ?auto_177435 ?auto_177434 ) ( IN-CITY ?auto_177434 ?auto_177433 ) ( IN-CITY ?auto_177428 ?auto_177433 ) ( not ( = ?auto_177428 ?auto_177434 ) ) ( OBJ-AT ?auto_177431 ?auto_177428 ) ( not ( = ?auto_177431 ?auto_177432 ) ) ( OBJ-AT ?auto_177429 ?auto_177428 ) ( OBJ-AT ?auto_177430 ?auto_177428 ) ( not ( = ?auto_177429 ?auto_177430 ) ) ( not ( = ?auto_177429 ?auto_177431 ) ) ( not ( = ?auto_177429 ?auto_177432 ) ) ( not ( = ?auto_177430 ?auto_177431 ) ) ( not ( = ?auto_177430 ?auto_177432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177431 ?auto_177432 ?auto_177428 )
      ( DELIVER-4PKG-VERIFY ?auto_177429 ?auto_177430 ?auto_177431 ?auto_177432 ?auto_177428 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177477 - OBJ
      ?auto_177478 - OBJ
      ?auto_177479 - OBJ
      ?auto_177480 - OBJ
      ?auto_177476 - LOCATION
    )
    :vars
    (
      ?auto_177483 - TRUCK
      ?auto_177482 - LOCATION
      ?auto_177481 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177478 ?auto_177483 ) ( TRUCK-AT ?auto_177483 ?auto_177482 ) ( IN-CITY ?auto_177482 ?auto_177481 ) ( IN-CITY ?auto_177476 ?auto_177481 ) ( not ( = ?auto_177476 ?auto_177482 ) ) ( OBJ-AT ?auto_177477 ?auto_177476 ) ( not ( = ?auto_177477 ?auto_177478 ) ) ( OBJ-AT ?auto_177479 ?auto_177476 ) ( OBJ-AT ?auto_177480 ?auto_177476 ) ( not ( = ?auto_177477 ?auto_177479 ) ) ( not ( = ?auto_177477 ?auto_177480 ) ) ( not ( = ?auto_177478 ?auto_177479 ) ) ( not ( = ?auto_177478 ?auto_177480 ) ) ( not ( = ?auto_177479 ?auto_177480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177477 ?auto_177478 ?auto_177476 )
      ( DELIVER-4PKG-VERIFY ?auto_177477 ?auto_177478 ?auto_177479 ?auto_177480 ?auto_177476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177557 - OBJ
      ?auto_177558 - OBJ
      ?auto_177559 - OBJ
      ?auto_177560 - OBJ
      ?auto_177556 - LOCATION
    )
    :vars
    (
      ?auto_177563 - TRUCK
      ?auto_177562 - LOCATION
      ?auto_177561 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177559 ?auto_177563 ) ( TRUCK-AT ?auto_177563 ?auto_177562 ) ( IN-CITY ?auto_177562 ?auto_177561 ) ( IN-CITY ?auto_177556 ?auto_177561 ) ( not ( = ?auto_177556 ?auto_177562 ) ) ( OBJ-AT ?auto_177558 ?auto_177556 ) ( not ( = ?auto_177558 ?auto_177559 ) ) ( OBJ-AT ?auto_177557 ?auto_177556 ) ( OBJ-AT ?auto_177560 ?auto_177556 ) ( not ( = ?auto_177557 ?auto_177558 ) ) ( not ( = ?auto_177557 ?auto_177559 ) ) ( not ( = ?auto_177557 ?auto_177560 ) ) ( not ( = ?auto_177558 ?auto_177560 ) ) ( not ( = ?auto_177559 ?auto_177560 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177558 ?auto_177559 ?auto_177556 )
      ( DELIVER-4PKG-VERIFY ?auto_177557 ?auto_177558 ?auto_177559 ?auto_177560 ?auto_177556 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177589 - OBJ
      ?auto_177590 - OBJ
      ?auto_177591 - OBJ
      ?auto_177592 - OBJ
      ?auto_177588 - LOCATION
    )
    :vars
    (
      ?auto_177596 - TRUCK
      ?auto_177594 - LOCATION
      ?auto_177593 - CITY
      ?auto_177595 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177592 ?auto_177596 ) ( TRUCK-AT ?auto_177596 ?auto_177594 ) ( IN-CITY ?auto_177594 ?auto_177593 ) ( IN-CITY ?auto_177588 ?auto_177593 ) ( not ( = ?auto_177588 ?auto_177594 ) ) ( OBJ-AT ?auto_177595 ?auto_177588 ) ( not ( = ?auto_177595 ?auto_177592 ) ) ( OBJ-AT ?auto_177589 ?auto_177588 ) ( OBJ-AT ?auto_177590 ?auto_177588 ) ( OBJ-AT ?auto_177591 ?auto_177588 ) ( not ( = ?auto_177589 ?auto_177590 ) ) ( not ( = ?auto_177589 ?auto_177591 ) ) ( not ( = ?auto_177589 ?auto_177592 ) ) ( not ( = ?auto_177589 ?auto_177595 ) ) ( not ( = ?auto_177590 ?auto_177591 ) ) ( not ( = ?auto_177590 ?auto_177592 ) ) ( not ( = ?auto_177590 ?auto_177595 ) ) ( not ( = ?auto_177591 ?auto_177592 ) ) ( not ( = ?auto_177591 ?auto_177595 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177595 ?auto_177592 ?auto_177588 )
      ( DELIVER-4PKG-VERIFY ?auto_177589 ?auto_177590 ?auto_177591 ?auto_177592 ?auto_177588 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177598 - OBJ
      ?auto_177599 - OBJ
      ?auto_177600 - OBJ
      ?auto_177601 - OBJ
      ?auto_177597 - LOCATION
    )
    :vars
    (
      ?auto_177604 - TRUCK
      ?auto_177603 - LOCATION
      ?auto_177602 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177600 ?auto_177604 ) ( TRUCK-AT ?auto_177604 ?auto_177603 ) ( IN-CITY ?auto_177603 ?auto_177602 ) ( IN-CITY ?auto_177597 ?auto_177602 ) ( not ( = ?auto_177597 ?auto_177603 ) ) ( OBJ-AT ?auto_177601 ?auto_177597 ) ( not ( = ?auto_177601 ?auto_177600 ) ) ( OBJ-AT ?auto_177598 ?auto_177597 ) ( OBJ-AT ?auto_177599 ?auto_177597 ) ( not ( = ?auto_177598 ?auto_177599 ) ) ( not ( = ?auto_177598 ?auto_177600 ) ) ( not ( = ?auto_177598 ?auto_177601 ) ) ( not ( = ?auto_177599 ?auto_177600 ) ) ( not ( = ?auto_177599 ?auto_177601 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177601 ?auto_177600 ?auto_177597 )
      ( DELIVER-4PKG-VERIFY ?auto_177598 ?auto_177599 ?auto_177600 ?auto_177601 ?auto_177597 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177606 - OBJ
      ?auto_177607 - OBJ
      ?auto_177608 - OBJ
      ?auto_177609 - OBJ
      ?auto_177605 - LOCATION
    )
    :vars
    (
      ?auto_177613 - TRUCK
      ?auto_177611 - LOCATION
      ?auto_177610 - CITY
      ?auto_177612 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177608 ?auto_177613 ) ( TRUCK-AT ?auto_177613 ?auto_177611 ) ( IN-CITY ?auto_177611 ?auto_177610 ) ( IN-CITY ?auto_177605 ?auto_177610 ) ( not ( = ?auto_177605 ?auto_177611 ) ) ( OBJ-AT ?auto_177612 ?auto_177605 ) ( not ( = ?auto_177612 ?auto_177608 ) ) ( OBJ-AT ?auto_177606 ?auto_177605 ) ( OBJ-AT ?auto_177607 ?auto_177605 ) ( OBJ-AT ?auto_177609 ?auto_177605 ) ( not ( = ?auto_177606 ?auto_177607 ) ) ( not ( = ?auto_177606 ?auto_177608 ) ) ( not ( = ?auto_177606 ?auto_177609 ) ) ( not ( = ?auto_177606 ?auto_177612 ) ) ( not ( = ?auto_177607 ?auto_177608 ) ) ( not ( = ?auto_177607 ?auto_177609 ) ) ( not ( = ?auto_177607 ?auto_177612 ) ) ( not ( = ?auto_177608 ?auto_177609 ) ) ( not ( = ?auto_177609 ?auto_177612 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177612 ?auto_177608 ?auto_177605 )
      ( DELIVER-4PKG-VERIFY ?auto_177606 ?auto_177607 ?auto_177608 ?auto_177609 ?auto_177605 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177632 - OBJ
      ?auto_177633 - OBJ
      ?auto_177634 - OBJ
      ?auto_177635 - OBJ
      ?auto_177631 - LOCATION
    )
    :vars
    (
      ?auto_177638 - TRUCK
      ?auto_177637 - LOCATION
      ?auto_177636 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177633 ?auto_177638 ) ( TRUCK-AT ?auto_177638 ?auto_177637 ) ( IN-CITY ?auto_177637 ?auto_177636 ) ( IN-CITY ?auto_177631 ?auto_177636 ) ( not ( = ?auto_177631 ?auto_177637 ) ) ( OBJ-AT ?auto_177634 ?auto_177631 ) ( not ( = ?auto_177634 ?auto_177633 ) ) ( OBJ-AT ?auto_177632 ?auto_177631 ) ( OBJ-AT ?auto_177635 ?auto_177631 ) ( not ( = ?auto_177632 ?auto_177633 ) ) ( not ( = ?auto_177632 ?auto_177634 ) ) ( not ( = ?auto_177632 ?auto_177635 ) ) ( not ( = ?auto_177633 ?auto_177635 ) ) ( not ( = ?auto_177634 ?auto_177635 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177634 ?auto_177633 ?auto_177631 )
      ( DELIVER-4PKG-VERIFY ?auto_177632 ?auto_177633 ?auto_177634 ?auto_177635 ?auto_177631 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177656 - OBJ
      ?auto_177657 - OBJ
      ?auto_177658 - OBJ
      ?auto_177659 - OBJ
      ?auto_177655 - LOCATION
    )
    :vars
    (
      ?auto_177663 - TRUCK
      ?auto_177661 - LOCATION
      ?auto_177660 - CITY
      ?auto_177662 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177657 ?auto_177663 ) ( TRUCK-AT ?auto_177663 ?auto_177661 ) ( IN-CITY ?auto_177661 ?auto_177660 ) ( IN-CITY ?auto_177655 ?auto_177660 ) ( not ( = ?auto_177655 ?auto_177661 ) ) ( OBJ-AT ?auto_177662 ?auto_177655 ) ( not ( = ?auto_177662 ?auto_177657 ) ) ( OBJ-AT ?auto_177656 ?auto_177655 ) ( OBJ-AT ?auto_177658 ?auto_177655 ) ( OBJ-AT ?auto_177659 ?auto_177655 ) ( not ( = ?auto_177656 ?auto_177657 ) ) ( not ( = ?auto_177656 ?auto_177658 ) ) ( not ( = ?auto_177656 ?auto_177659 ) ) ( not ( = ?auto_177656 ?auto_177662 ) ) ( not ( = ?auto_177657 ?auto_177658 ) ) ( not ( = ?auto_177657 ?auto_177659 ) ) ( not ( = ?auto_177658 ?auto_177659 ) ) ( not ( = ?auto_177658 ?auto_177662 ) ) ( not ( = ?auto_177659 ?auto_177662 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177662 ?auto_177657 ?auto_177655 )
      ( DELIVER-4PKG-VERIFY ?auto_177656 ?auto_177657 ?auto_177658 ?auto_177659 ?auto_177655 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177700 - OBJ
      ?auto_177701 - OBJ
      ?auto_177702 - OBJ
      ?auto_177703 - OBJ
      ?auto_177699 - LOCATION
    )
    :vars
    (
      ?auto_177706 - TRUCK
      ?auto_177705 - LOCATION
      ?auto_177704 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177700 ?auto_177706 ) ( TRUCK-AT ?auto_177706 ?auto_177705 ) ( IN-CITY ?auto_177705 ?auto_177704 ) ( IN-CITY ?auto_177699 ?auto_177704 ) ( not ( = ?auto_177699 ?auto_177705 ) ) ( OBJ-AT ?auto_177703 ?auto_177699 ) ( not ( = ?auto_177703 ?auto_177700 ) ) ( OBJ-AT ?auto_177701 ?auto_177699 ) ( OBJ-AT ?auto_177702 ?auto_177699 ) ( not ( = ?auto_177700 ?auto_177701 ) ) ( not ( = ?auto_177700 ?auto_177702 ) ) ( not ( = ?auto_177701 ?auto_177702 ) ) ( not ( = ?auto_177701 ?auto_177703 ) ) ( not ( = ?auto_177702 ?auto_177703 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177703 ?auto_177700 ?auto_177699 )
      ( DELIVER-4PKG-VERIFY ?auto_177700 ?auto_177701 ?auto_177702 ?auto_177703 ?auto_177699 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177724 - OBJ
      ?auto_177725 - OBJ
      ?auto_177726 - OBJ
      ?auto_177727 - OBJ
      ?auto_177723 - LOCATION
    )
    :vars
    (
      ?auto_177730 - TRUCK
      ?auto_177729 - LOCATION
      ?auto_177728 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177724 ?auto_177730 ) ( TRUCK-AT ?auto_177730 ?auto_177729 ) ( IN-CITY ?auto_177729 ?auto_177728 ) ( IN-CITY ?auto_177723 ?auto_177728 ) ( not ( = ?auto_177723 ?auto_177729 ) ) ( OBJ-AT ?auto_177725 ?auto_177723 ) ( not ( = ?auto_177725 ?auto_177724 ) ) ( OBJ-AT ?auto_177726 ?auto_177723 ) ( OBJ-AT ?auto_177727 ?auto_177723 ) ( not ( = ?auto_177724 ?auto_177726 ) ) ( not ( = ?auto_177724 ?auto_177727 ) ) ( not ( = ?auto_177725 ?auto_177726 ) ) ( not ( = ?auto_177725 ?auto_177727 ) ) ( not ( = ?auto_177726 ?auto_177727 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177725 ?auto_177724 ?auto_177723 )
      ( DELIVER-4PKG-VERIFY ?auto_177724 ?auto_177725 ?auto_177726 ?auto_177727 ?auto_177723 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177804 - OBJ
      ?auto_177805 - OBJ
      ?auto_177806 - OBJ
      ?auto_177807 - OBJ
      ?auto_177803 - LOCATION
    )
    :vars
    (
      ?auto_177811 - TRUCK
      ?auto_177809 - LOCATION
      ?auto_177808 - CITY
      ?auto_177810 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177804 ?auto_177811 ) ( TRUCK-AT ?auto_177811 ?auto_177809 ) ( IN-CITY ?auto_177809 ?auto_177808 ) ( IN-CITY ?auto_177803 ?auto_177808 ) ( not ( = ?auto_177803 ?auto_177809 ) ) ( OBJ-AT ?auto_177810 ?auto_177803 ) ( not ( = ?auto_177810 ?auto_177804 ) ) ( OBJ-AT ?auto_177805 ?auto_177803 ) ( OBJ-AT ?auto_177806 ?auto_177803 ) ( OBJ-AT ?auto_177807 ?auto_177803 ) ( not ( = ?auto_177804 ?auto_177805 ) ) ( not ( = ?auto_177804 ?auto_177806 ) ) ( not ( = ?auto_177804 ?auto_177807 ) ) ( not ( = ?auto_177805 ?auto_177806 ) ) ( not ( = ?auto_177805 ?auto_177807 ) ) ( not ( = ?auto_177805 ?auto_177810 ) ) ( not ( = ?auto_177806 ?auto_177807 ) ) ( not ( = ?auto_177806 ?auto_177810 ) ) ( not ( = ?auto_177807 ?auto_177810 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177810 ?auto_177804 ?auto_177803 )
      ( DELIVER-4PKG-VERIFY ?auto_177804 ?auto_177805 ?auto_177806 ?auto_177807 ?auto_177803 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177955 - OBJ
      ?auto_177956 - OBJ
      ?auto_177957 - OBJ
      ?auto_177954 - LOCATION
    )
    :vars
    (
      ?auto_177959 - TRUCK
      ?auto_177960 - LOCATION
      ?auto_177958 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177959 ?auto_177960 ) ( IN-CITY ?auto_177960 ?auto_177958 ) ( IN-CITY ?auto_177954 ?auto_177958 ) ( not ( = ?auto_177954 ?auto_177960 ) ) ( OBJ-AT ?auto_177956 ?auto_177954 ) ( not ( = ?auto_177956 ?auto_177957 ) ) ( OBJ-AT ?auto_177957 ?auto_177960 ) ( OBJ-AT ?auto_177955 ?auto_177954 ) ( not ( = ?auto_177955 ?auto_177956 ) ) ( not ( = ?auto_177955 ?auto_177957 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177956 ?auto_177957 ?auto_177954 )
      ( DELIVER-3PKG-VERIFY ?auto_177955 ?auto_177956 ?auto_177957 ?auto_177954 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177988 - OBJ
      ?auto_177989 - OBJ
      ?auto_177990 - OBJ
      ?auto_177987 - LOCATION
    )
    :vars
    (
      ?auto_177993 - TRUCK
      ?auto_177994 - LOCATION
      ?auto_177992 - CITY
      ?auto_177991 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177993 ?auto_177994 ) ( IN-CITY ?auto_177994 ?auto_177992 ) ( IN-CITY ?auto_177987 ?auto_177992 ) ( not ( = ?auto_177987 ?auto_177994 ) ) ( OBJ-AT ?auto_177991 ?auto_177987 ) ( not ( = ?auto_177991 ?auto_177990 ) ) ( OBJ-AT ?auto_177990 ?auto_177994 ) ( OBJ-AT ?auto_177988 ?auto_177987 ) ( OBJ-AT ?auto_177989 ?auto_177987 ) ( not ( = ?auto_177988 ?auto_177989 ) ) ( not ( = ?auto_177988 ?auto_177990 ) ) ( not ( = ?auto_177988 ?auto_177991 ) ) ( not ( = ?auto_177989 ?auto_177990 ) ) ( not ( = ?auto_177989 ?auto_177991 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177991 ?auto_177990 ?auto_177987 )
      ( DELIVER-3PKG-VERIFY ?auto_177988 ?auto_177989 ?auto_177990 ?auto_177987 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178000 - OBJ
      ?auto_178001 - OBJ
      ?auto_178002 - OBJ
      ?auto_177999 - LOCATION
    )
    :vars
    (
      ?auto_178005 - TRUCK
      ?auto_178006 - LOCATION
      ?auto_178004 - CITY
      ?auto_178003 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178005 ?auto_178006 ) ( IN-CITY ?auto_178006 ?auto_178004 ) ( IN-CITY ?auto_177999 ?auto_178004 ) ( not ( = ?auto_177999 ?auto_178006 ) ) ( OBJ-AT ?auto_178003 ?auto_177999 ) ( not ( = ?auto_178003 ?auto_178001 ) ) ( OBJ-AT ?auto_178001 ?auto_178006 ) ( OBJ-AT ?auto_178000 ?auto_177999 ) ( OBJ-AT ?auto_178002 ?auto_177999 ) ( not ( = ?auto_178000 ?auto_178001 ) ) ( not ( = ?auto_178000 ?auto_178002 ) ) ( not ( = ?auto_178000 ?auto_178003 ) ) ( not ( = ?auto_178001 ?auto_178002 ) ) ( not ( = ?auto_178002 ?auto_178003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178003 ?auto_178001 ?auto_177999 )
      ( DELIVER-3PKG-VERIFY ?auto_178000 ?auto_178001 ?auto_178002 ?auto_177999 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178016 - OBJ
      ?auto_178017 - OBJ
      ?auto_178018 - OBJ
      ?auto_178015 - LOCATION
    )
    :vars
    (
      ?auto_178020 - TRUCK
      ?auto_178021 - LOCATION
      ?auto_178019 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178020 ?auto_178021 ) ( IN-CITY ?auto_178021 ?auto_178019 ) ( IN-CITY ?auto_178015 ?auto_178019 ) ( not ( = ?auto_178015 ?auto_178021 ) ) ( OBJ-AT ?auto_178017 ?auto_178015 ) ( not ( = ?auto_178017 ?auto_178016 ) ) ( OBJ-AT ?auto_178016 ?auto_178021 ) ( OBJ-AT ?auto_178018 ?auto_178015 ) ( not ( = ?auto_178016 ?auto_178018 ) ) ( not ( = ?auto_178017 ?auto_178018 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178017 ?auto_178016 ?auto_178015 )
      ( DELIVER-3PKG-VERIFY ?auto_178016 ?auto_178017 ?auto_178018 ?auto_178015 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178038 - OBJ
      ?auto_178039 - OBJ
      ?auto_178040 - OBJ
      ?auto_178037 - LOCATION
    )
    :vars
    (
      ?auto_178043 - TRUCK
      ?auto_178044 - LOCATION
      ?auto_178042 - CITY
      ?auto_178041 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178043 ?auto_178044 ) ( IN-CITY ?auto_178044 ?auto_178042 ) ( IN-CITY ?auto_178037 ?auto_178042 ) ( not ( = ?auto_178037 ?auto_178044 ) ) ( OBJ-AT ?auto_178041 ?auto_178037 ) ( not ( = ?auto_178041 ?auto_178038 ) ) ( OBJ-AT ?auto_178038 ?auto_178044 ) ( OBJ-AT ?auto_178039 ?auto_178037 ) ( OBJ-AT ?auto_178040 ?auto_178037 ) ( not ( = ?auto_178038 ?auto_178039 ) ) ( not ( = ?auto_178038 ?auto_178040 ) ) ( not ( = ?auto_178039 ?auto_178040 ) ) ( not ( = ?auto_178039 ?auto_178041 ) ) ( not ( = ?auto_178040 ?auto_178041 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178041 ?auto_178038 ?auto_178037 )
      ( DELIVER-3PKG-VERIFY ?auto_178038 ?auto_178039 ?auto_178040 ?auto_178037 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178085 - OBJ
      ?auto_178086 - OBJ
      ?auto_178087 - OBJ
      ?auto_178088 - OBJ
      ?auto_178084 - LOCATION
    )
    :vars
    (
      ?auto_178090 - TRUCK
      ?auto_178091 - LOCATION
      ?auto_178089 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178090 ?auto_178091 ) ( IN-CITY ?auto_178091 ?auto_178089 ) ( IN-CITY ?auto_178084 ?auto_178089 ) ( not ( = ?auto_178084 ?auto_178091 ) ) ( OBJ-AT ?auto_178085 ?auto_178084 ) ( not ( = ?auto_178085 ?auto_178088 ) ) ( OBJ-AT ?auto_178088 ?auto_178091 ) ( OBJ-AT ?auto_178086 ?auto_178084 ) ( OBJ-AT ?auto_178087 ?auto_178084 ) ( not ( = ?auto_178085 ?auto_178086 ) ) ( not ( = ?auto_178085 ?auto_178087 ) ) ( not ( = ?auto_178086 ?auto_178087 ) ) ( not ( = ?auto_178086 ?auto_178088 ) ) ( not ( = ?auto_178087 ?auto_178088 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178085 ?auto_178088 ?auto_178084 )
      ( DELIVER-4PKG-VERIFY ?auto_178085 ?auto_178086 ?auto_178087 ?auto_178088 ?auto_178084 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178101 - OBJ
      ?auto_178102 - OBJ
      ?auto_178103 - OBJ
      ?auto_178104 - OBJ
      ?auto_178100 - LOCATION
    )
    :vars
    (
      ?auto_178106 - TRUCK
      ?auto_178107 - LOCATION
      ?auto_178105 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178106 ?auto_178107 ) ( IN-CITY ?auto_178107 ?auto_178105 ) ( IN-CITY ?auto_178100 ?auto_178105 ) ( not ( = ?auto_178100 ?auto_178107 ) ) ( OBJ-AT ?auto_178101 ?auto_178100 ) ( not ( = ?auto_178101 ?auto_178103 ) ) ( OBJ-AT ?auto_178103 ?auto_178107 ) ( OBJ-AT ?auto_178102 ?auto_178100 ) ( OBJ-AT ?auto_178104 ?auto_178100 ) ( not ( = ?auto_178101 ?auto_178102 ) ) ( not ( = ?auto_178101 ?auto_178104 ) ) ( not ( = ?auto_178102 ?auto_178103 ) ) ( not ( = ?auto_178102 ?auto_178104 ) ) ( not ( = ?auto_178103 ?auto_178104 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178101 ?auto_178103 ?auto_178100 )
      ( DELIVER-4PKG-VERIFY ?auto_178101 ?auto_178102 ?auto_178103 ?auto_178104 ?auto_178100 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178165 - OBJ
      ?auto_178166 - OBJ
      ?auto_178167 - OBJ
      ?auto_178168 - OBJ
      ?auto_178164 - LOCATION
    )
    :vars
    (
      ?auto_178170 - TRUCK
      ?auto_178171 - LOCATION
      ?auto_178169 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178170 ?auto_178171 ) ( IN-CITY ?auto_178171 ?auto_178169 ) ( IN-CITY ?auto_178164 ?auto_178169 ) ( not ( = ?auto_178164 ?auto_178171 ) ) ( OBJ-AT ?auto_178165 ?auto_178164 ) ( not ( = ?auto_178165 ?auto_178166 ) ) ( OBJ-AT ?auto_178166 ?auto_178171 ) ( OBJ-AT ?auto_178167 ?auto_178164 ) ( OBJ-AT ?auto_178168 ?auto_178164 ) ( not ( = ?auto_178165 ?auto_178167 ) ) ( not ( = ?auto_178165 ?auto_178168 ) ) ( not ( = ?auto_178166 ?auto_178167 ) ) ( not ( = ?auto_178166 ?auto_178168 ) ) ( not ( = ?auto_178167 ?auto_178168 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178165 ?auto_178166 ?auto_178164 )
      ( DELIVER-4PKG-VERIFY ?auto_178165 ?auto_178166 ?auto_178167 ?auto_178168 ?auto_178164 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178237 - OBJ
      ?auto_178238 - OBJ
      ?auto_178239 - OBJ
      ?auto_178240 - OBJ
      ?auto_178236 - LOCATION
    )
    :vars
    (
      ?auto_178242 - TRUCK
      ?auto_178243 - LOCATION
      ?auto_178241 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178242 ?auto_178243 ) ( IN-CITY ?auto_178243 ?auto_178241 ) ( IN-CITY ?auto_178236 ?auto_178241 ) ( not ( = ?auto_178236 ?auto_178243 ) ) ( OBJ-AT ?auto_178238 ?auto_178236 ) ( not ( = ?auto_178238 ?auto_178240 ) ) ( OBJ-AT ?auto_178240 ?auto_178243 ) ( OBJ-AT ?auto_178237 ?auto_178236 ) ( OBJ-AT ?auto_178239 ?auto_178236 ) ( not ( = ?auto_178237 ?auto_178238 ) ) ( not ( = ?auto_178237 ?auto_178239 ) ) ( not ( = ?auto_178237 ?auto_178240 ) ) ( not ( = ?auto_178238 ?auto_178239 ) ) ( not ( = ?auto_178239 ?auto_178240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178238 ?auto_178240 ?auto_178236 )
      ( DELIVER-4PKG-VERIFY ?auto_178237 ?auto_178238 ?auto_178239 ?auto_178240 ?auto_178236 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178245 - OBJ
      ?auto_178246 - OBJ
      ?auto_178247 - OBJ
      ?auto_178248 - OBJ
      ?auto_178244 - LOCATION
    )
    :vars
    (
      ?auto_178250 - TRUCK
      ?auto_178251 - LOCATION
      ?auto_178249 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178250 ?auto_178251 ) ( IN-CITY ?auto_178251 ?auto_178249 ) ( IN-CITY ?auto_178244 ?auto_178249 ) ( not ( = ?auto_178244 ?auto_178251 ) ) ( OBJ-AT ?auto_178246 ?auto_178244 ) ( not ( = ?auto_178246 ?auto_178247 ) ) ( OBJ-AT ?auto_178247 ?auto_178251 ) ( OBJ-AT ?auto_178245 ?auto_178244 ) ( OBJ-AT ?auto_178248 ?auto_178244 ) ( not ( = ?auto_178245 ?auto_178246 ) ) ( not ( = ?auto_178245 ?auto_178247 ) ) ( not ( = ?auto_178245 ?auto_178248 ) ) ( not ( = ?auto_178246 ?auto_178248 ) ) ( not ( = ?auto_178247 ?auto_178248 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178246 ?auto_178247 ?auto_178244 )
      ( DELIVER-4PKG-VERIFY ?auto_178245 ?auto_178246 ?auto_178247 ?auto_178248 ?auto_178244 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178277 - OBJ
      ?auto_178278 - OBJ
      ?auto_178279 - OBJ
      ?auto_178280 - OBJ
      ?auto_178276 - LOCATION
    )
    :vars
    (
      ?auto_178283 - TRUCK
      ?auto_178284 - LOCATION
      ?auto_178282 - CITY
      ?auto_178281 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178283 ?auto_178284 ) ( IN-CITY ?auto_178284 ?auto_178282 ) ( IN-CITY ?auto_178276 ?auto_178282 ) ( not ( = ?auto_178276 ?auto_178284 ) ) ( OBJ-AT ?auto_178281 ?auto_178276 ) ( not ( = ?auto_178281 ?auto_178280 ) ) ( OBJ-AT ?auto_178280 ?auto_178284 ) ( OBJ-AT ?auto_178277 ?auto_178276 ) ( OBJ-AT ?auto_178278 ?auto_178276 ) ( OBJ-AT ?auto_178279 ?auto_178276 ) ( not ( = ?auto_178277 ?auto_178278 ) ) ( not ( = ?auto_178277 ?auto_178279 ) ) ( not ( = ?auto_178277 ?auto_178280 ) ) ( not ( = ?auto_178277 ?auto_178281 ) ) ( not ( = ?auto_178278 ?auto_178279 ) ) ( not ( = ?auto_178278 ?auto_178280 ) ) ( not ( = ?auto_178278 ?auto_178281 ) ) ( not ( = ?auto_178279 ?auto_178280 ) ) ( not ( = ?auto_178279 ?auto_178281 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178281 ?auto_178280 ?auto_178276 )
      ( DELIVER-4PKG-VERIFY ?auto_178277 ?auto_178278 ?auto_178279 ?auto_178280 ?auto_178276 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178294 - OBJ
      ?auto_178295 - OBJ
      ?auto_178296 - OBJ
      ?auto_178297 - OBJ
      ?auto_178293 - LOCATION
    )
    :vars
    (
      ?auto_178300 - TRUCK
      ?auto_178301 - LOCATION
      ?auto_178299 - CITY
      ?auto_178298 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178300 ?auto_178301 ) ( IN-CITY ?auto_178301 ?auto_178299 ) ( IN-CITY ?auto_178293 ?auto_178299 ) ( not ( = ?auto_178293 ?auto_178301 ) ) ( OBJ-AT ?auto_178298 ?auto_178293 ) ( not ( = ?auto_178298 ?auto_178296 ) ) ( OBJ-AT ?auto_178296 ?auto_178301 ) ( OBJ-AT ?auto_178294 ?auto_178293 ) ( OBJ-AT ?auto_178295 ?auto_178293 ) ( OBJ-AT ?auto_178297 ?auto_178293 ) ( not ( = ?auto_178294 ?auto_178295 ) ) ( not ( = ?auto_178294 ?auto_178296 ) ) ( not ( = ?auto_178294 ?auto_178297 ) ) ( not ( = ?auto_178294 ?auto_178298 ) ) ( not ( = ?auto_178295 ?auto_178296 ) ) ( not ( = ?auto_178295 ?auto_178297 ) ) ( not ( = ?auto_178295 ?auto_178298 ) ) ( not ( = ?auto_178296 ?auto_178297 ) ) ( not ( = ?auto_178297 ?auto_178298 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178298 ?auto_178296 ?auto_178293 )
      ( DELIVER-4PKG-VERIFY ?auto_178294 ?auto_178295 ?auto_178296 ?auto_178297 ?auto_178293 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178312 - OBJ
      ?auto_178313 - OBJ
      ?auto_178314 - OBJ
      ?auto_178315 - OBJ
      ?auto_178311 - LOCATION
    )
    :vars
    (
      ?auto_178317 - TRUCK
      ?auto_178318 - LOCATION
      ?auto_178316 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178317 ?auto_178318 ) ( IN-CITY ?auto_178318 ?auto_178316 ) ( IN-CITY ?auto_178311 ?auto_178316 ) ( not ( = ?auto_178311 ?auto_178318 ) ) ( OBJ-AT ?auto_178314 ?auto_178311 ) ( not ( = ?auto_178314 ?auto_178313 ) ) ( OBJ-AT ?auto_178313 ?auto_178318 ) ( OBJ-AT ?auto_178312 ?auto_178311 ) ( OBJ-AT ?auto_178315 ?auto_178311 ) ( not ( = ?auto_178312 ?auto_178313 ) ) ( not ( = ?auto_178312 ?auto_178314 ) ) ( not ( = ?auto_178312 ?auto_178315 ) ) ( not ( = ?auto_178313 ?auto_178315 ) ) ( not ( = ?auto_178314 ?auto_178315 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178314 ?auto_178313 ?auto_178311 )
      ( DELIVER-4PKG-VERIFY ?auto_178312 ?auto_178313 ?auto_178314 ?auto_178315 ?auto_178311 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178344 - OBJ
      ?auto_178345 - OBJ
      ?auto_178346 - OBJ
      ?auto_178347 - OBJ
      ?auto_178343 - LOCATION
    )
    :vars
    (
      ?auto_178350 - TRUCK
      ?auto_178351 - LOCATION
      ?auto_178349 - CITY
      ?auto_178348 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178350 ?auto_178351 ) ( IN-CITY ?auto_178351 ?auto_178349 ) ( IN-CITY ?auto_178343 ?auto_178349 ) ( not ( = ?auto_178343 ?auto_178351 ) ) ( OBJ-AT ?auto_178348 ?auto_178343 ) ( not ( = ?auto_178348 ?auto_178345 ) ) ( OBJ-AT ?auto_178345 ?auto_178351 ) ( OBJ-AT ?auto_178344 ?auto_178343 ) ( OBJ-AT ?auto_178346 ?auto_178343 ) ( OBJ-AT ?auto_178347 ?auto_178343 ) ( not ( = ?auto_178344 ?auto_178345 ) ) ( not ( = ?auto_178344 ?auto_178346 ) ) ( not ( = ?auto_178344 ?auto_178347 ) ) ( not ( = ?auto_178344 ?auto_178348 ) ) ( not ( = ?auto_178345 ?auto_178346 ) ) ( not ( = ?auto_178345 ?auto_178347 ) ) ( not ( = ?auto_178346 ?auto_178347 ) ) ( not ( = ?auto_178346 ?auto_178348 ) ) ( not ( = ?auto_178347 ?auto_178348 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178348 ?auto_178345 ?auto_178343 )
      ( DELIVER-4PKG-VERIFY ?auto_178344 ?auto_178345 ?auto_178346 ?auto_178347 ?auto_178343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178388 - OBJ
      ?auto_178389 - OBJ
      ?auto_178390 - OBJ
      ?auto_178391 - OBJ
      ?auto_178387 - LOCATION
    )
    :vars
    (
      ?auto_178393 - TRUCK
      ?auto_178394 - LOCATION
      ?auto_178392 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178393 ?auto_178394 ) ( IN-CITY ?auto_178394 ?auto_178392 ) ( IN-CITY ?auto_178387 ?auto_178392 ) ( not ( = ?auto_178387 ?auto_178394 ) ) ( OBJ-AT ?auto_178389 ?auto_178387 ) ( not ( = ?auto_178389 ?auto_178388 ) ) ( OBJ-AT ?auto_178388 ?auto_178394 ) ( OBJ-AT ?auto_178390 ?auto_178387 ) ( OBJ-AT ?auto_178391 ?auto_178387 ) ( not ( = ?auto_178388 ?auto_178390 ) ) ( not ( = ?auto_178388 ?auto_178391 ) ) ( not ( = ?auto_178389 ?auto_178390 ) ) ( not ( = ?auto_178389 ?auto_178391 ) ) ( not ( = ?auto_178390 ?auto_178391 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178389 ?auto_178388 ?auto_178387 )
      ( DELIVER-4PKG-VERIFY ?auto_178388 ?auto_178389 ?auto_178390 ?auto_178391 ?auto_178387 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178412 - OBJ
      ?auto_178413 - OBJ
      ?auto_178414 - OBJ
      ?auto_178415 - OBJ
      ?auto_178411 - LOCATION
    )
    :vars
    (
      ?auto_178417 - TRUCK
      ?auto_178418 - LOCATION
      ?auto_178416 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178417 ?auto_178418 ) ( IN-CITY ?auto_178418 ?auto_178416 ) ( IN-CITY ?auto_178411 ?auto_178416 ) ( not ( = ?auto_178411 ?auto_178418 ) ) ( OBJ-AT ?auto_178415 ?auto_178411 ) ( not ( = ?auto_178415 ?auto_178412 ) ) ( OBJ-AT ?auto_178412 ?auto_178418 ) ( OBJ-AT ?auto_178413 ?auto_178411 ) ( OBJ-AT ?auto_178414 ?auto_178411 ) ( not ( = ?auto_178412 ?auto_178413 ) ) ( not ( = ?auto_178412 ?auto_178414 ) ) ( not ( = ?auto_178413 ?auto_178414 ) ) ( not ( = ?auto_178413 ?auto_178415 ) ) ( not ( = ?auto_178414 ?auto_178415 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178415 ?auto_178412 ?auto_178411 )
      ( DELIVER-4PKG-VERIFY ?auto_178412 ?auto_178413 ?auto_178414 ?auto_178415 ?auto_178411 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178492 - OBJ
      ?auto_178493 - OBJ
      ?auto_178494 - OBJ
      ?auto_178495 - OBJ
      ?auto_178491 - LOCATION
    )
    :vars
    (
      ?auto_178498 - TRUCK
      ?auto_178499 - LOCATION
      ?auto_178497 - CITY
      ?auto_178496 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178498 ?auto_178499 ) ( IN-CITY ?auto_178499 ?auto_178497 ) ( IN-CITY ?auto_178491 ?auto_178497 ) ( not ( = ?auto_178491 ?auto_178499 ) ) ( OBJ-AT ?auto_178496 ?auto_178491 ) ( not ( = ?auto_178496 ?auto_178492 ) ) ( OBJ-AT ?auto_178492 ?auto_178499 ) ( OBJ-AT ?auto_178493 ?auto_178491 ) ( OBJ-AT ?auto_178494 ?auto_178491 ) ( OBJ-AT ?auto_178495 ?auto_178491 ) ( not ( = ?auto_178492 ?auto_178493 ) ) ( not ( = ?auto_178492 ?auto_178494 ) ) ( not ( = ?auto_178492 ?auto_178495 ) ) ( not ( = ?auto_178493 ?auto_178494 ) ) ( not ( = ?auto_178493 ?auto_178495 ) ) ( not ( = ?auto_178493 ?auto_178496 ) ) ( not ( = ?auto_178494 ?auto_178495 ) ) ( not ( = ?auto_178494 ?auto_178496 ) ) ( not ( = ?auto_178495 ?auto_178496 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178496 ?auto_178492 ?auto_178491 )
      ( DELIVER-4PKG-VERIFY ?auto_178492 ?auto_178493 ?auto_178494 ?auto_178495 ?auto_178491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178654 - OBJ
      ?auto_178655 - OBJ
      ?auto_178656 - OBJ
      ?auto_178653 - LOCATION
    )
    :vars
    (
      ?auto_178657 - LOCATION
      ?auto_178658 - CITY
      ?auto_178659 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178657 ?auto_178658 ) ( IN-CITY ?auto_178653 ?auto_178658 ) ( not ( = ?auto_178653 ?auto_178657 ) ) ( OBJ-AT ?auto_178654 ?auto_178653 ) ( not ( = ?auto_178654 ?auto_178655 ) ) ( OBJ-AT ?auto_178655 ?auto_178657 ) ( TRUCK-AT ?auto_178659 ?auto_178653 ) ( OBJ-AT ?auto_178656 ?auto_178653 ) ( not ( = ?auto_178654 ?auto_178656 ) ) ( not ( = ?auto_178655 ?auto_178656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178654 ?auto_178655 ?auto_178653 )
      ( DELIVER-3PKG-VERIFY ?auto_178654 ?auto_178655 ?auto_178656 ?auto_178653 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178676 - OBJ
      ?auto_178677 - OBJ
      ?auto_178678 - OBJ
      ?auto_178675 - LOCATION
    )
    :vars
    (
      ?auto_178680 - LOCATION
      ?auto_178681 - CITY
      ?auto_178679 - OBJ
      ?auto_178682 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178680 ?auto_178681 ) ( IN-CITY ?auto_178675 ?auto_178681 ) ( not ( = ?auto_178675 ?auto_178680 ) ) ( OBJ-AT ?auto_178679 ?auto_178675 ) ( not ( = ?auto_178679 ?auto_178678 ) ) ( OBJ-AT ?auto_178678 ?auto_178680 ) ( TRUCK-AT ?auto_178682 ?auto_178675 ) ( OBJ-AT ?auto_178676 ?auto_178675 ) ( OBJ-AT ?auto_178677 ?auto_178675 ) ( not ( = ?auto_178676 ?auto_178677 ) ) ( not ( = ?auto_178676 ?auto_178678 ) ) ( not ( = ?auto_178676 ?auto_178679 ) ) ( not ( = ?auto_178677 ?auto_178678 ) ) ( not ( = ?auto_178677 ?auto_178679 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178679 ?auto_178678 ?auto_178675 )
      ( DELIVER-3PKG-VERIFY ?auto_178676 ?auto_178677 ?auto_178678 ?auto_178675 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178688 - OBJ
      ?auto_178689 - OBJ
      ?auto_178690 - OBJ
      ?auto_178687 - LOCATION
    )
    :vars
    (
      ?auto_178692 - LOCATION
      ?auto_178693 - CITY
      ?auto_178691 - OBJ
      ?auto_178694 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178692 ?auto_178693 ) ( IN-CITY ?auto_178687 ?auto_178693 ) ( not ( = ?auto_178687 ?auto_178692 ) ) ( OBJ-AT ?auto_178691 ?auto_178687 ) ( not ( = ?auto_178691 ?auto_178689 ) ) ( OBJ-AT ?auto_178689 ?auto_178692 ) ( TRUCK-AT ?auto_178694 ?auto_178687 ) ( OBJ-AT ?auto_178688 ?auto_178687 ) ( OBJ-AT ?auto_178690 ?auto_178687 ) ( not ( = ?auto_178688 ?auto_178689 ) ) ( not ( = ?auto_178688 ?auto_178690 ) ) ( not ( = ?auto_178688 ?auto_178691 ) ) ( not ( = ?auto_178689 ?auto_178690 ) ) ( not ( = ?auto_178690 ?auto_178691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178691 ?auto_178689 ?auto_178687 )
      ( DELIVER-3PKG-VERIFY ?auto_178688 ?auto_178689 ?auto_178690 ?auto_178687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178704 - OBJ
      ?auto_178705 - OBJ
      ?auto_178706 - OBJ
      ?auto_178703 - LOCATION
    )
    :vars
    (
      ?auto_178707 - LOCATION
      ?auto_178708 - CITY
      ?auto_178709 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178707 ?auto_178708 ) ( IN-CITY ?auto_178703 ?auto_178708 ) ( not ( = ?auto_178703 ?auto_178707 ) ) ( OBJ-AT ?auto_178705 ?auto_178703 ) ( not ( = ?auto_178705 ?auto_178704 ) ) ( OBJ-AT ?auto_178704 ?auto_178707 ) ( TRUCK-AT ?auto_178709 ?auto_178703 ) ( OBJ-AT ?auto_178706 ?auto_178703 ) ( not ( = ?auto_178704 ?auto_178706 ) ) ( not ( = ?auto_178705 ?auto_178706 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178705 ?auto_178704 ?auto_178703 )
      ( DELIVER-3PKG-VERIFY ?auto_178704 ?auto_178705 ?auto_178706 ?auto_178703 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178726 - OBJ
      ?auto_178727 - OBJ
      ?auto_178728 - OBJ
      ?auto_178725 - LOCATION
    )
    :vars
    (
      ?auto_178730 - LOCATION
      ?auto_178731 - CITY
      ?auto_178729 - OBJ
      ?auto_178732 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178730 ?auto_178731 ) ( IN-CITY ?auto_178725 ?auto_178731 ) ( not ( = ?auto_178725 ?auto_178730 ) ) ( OBJ-AT ?auto_178729 ?auto_178725 ) ( not ( = ?auto_178729 ?auto_178726 ) ) ( OBJ-AT ?auto_178726 ?auto_178730 ) ( TRUCK-AT ?auto_178732 ?auto_178725 ) ( OBJ-AT ?auto_178727 ?auto_178725 ) ( OBJ-AT ?auto_178728 ?auto_178725 ) ( not ( = ?auto_178726 ?auto_178727 ) ) ( not ( = ?auto_178726 ?auto_178728 ) ) ( not ( = ?auto_178727 ?auto_178728 ) ) ( not ( = ?auto_178727 ?auto_178729 ) ) ( not ( = ?auto_178728 ?auto_178729 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178729 ?auto_178726 ?auto_178725 )
      ( DELIVER-3PKG-VERIFY ?auto_178726 ?auto_178727 ?auto_178728 ?auto_178725 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178765 - OBJ
      ?auto_178766 - OBJ
      ?auto_178767 - OBJ
      ?auto_178768 - OBJ
      ?auto_178764 - LOCATION
    )
    :vars
    (
      ?auto_178769 - LOCATION
      ?auto_178770 - CITY
      ?auto_178771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178769 ?auto_178770 ) ( IN-CITY ?auto_178764 ?auto_178770 ) ( not ( = ?auto_178764 ?auto_178769 ) ) ( OBJ-AT ?auto_178766 ?auto_178764 ) ( not ( = ?auto_178766 ?auto_178768 ) ) ( OBJ-AT ?auto_178768 ?auto_178769 ) ( TRUCK-AT ?auto_178771 ?auto_178764 ) ( OBJ-AT ?auto_178765 ?auto_178764 ) ( OBJ-AT ?auto_178767 ?auto_178764 ) ( not ( = ?auto_178765 ?auto_178766 ) ) ( not ( = ?auto_178765 ?auto_178767 ) ) ( not ( = ?auto_178765 ?auto_178768 ) ) ( not ( = ?auto_178766 ?auto_178767 ) ) ( not ( = ?auto_178767 ?auto_178768 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178766 ?auto_178768 ?auto_178764 )
      ( DELIVER-4PKG-VERIFY ?auto_178765 ?auto_178766 ?auto_178767 ?auto_178768 ?auto_178764 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178805 - OBJ
      ?auto_178806 - OBJ
      ?auto_178807 - OBJ
      ?auto_178808 - OBJ
      ?auto_178804 - LOCATION
    )
    :vars
    (
      ?auto_178809 - LOCATION
      ?auto_178810 - CITY
      ?auto_178811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178809 ?auto_178810 ) ( IN-CITY ?auto_178804 ?auto_178810 ) ( not ( = ?auto_178804 ?auto_178809 ) ) ( OBJ-AT ?auto_178807 ?auto_178804 ) ( not ( = ?auto_178807 ?auto_178808 ) ) ( OBJ-AT ?auto_178808 ?auto_178809 ) ( TRUCK-AT ?auto_178811 ?auto_178804 ) ( OBJ-AT ?auto_178805 ?auto_178804 ) ( OBJ-AT ?auto_178806 ?auto_178804 ) ( not ( = ?auto_178805 ?auto_178806 ) ) ( not ( = ?auto_178805 ?auto_178807 ) ) ( not ( = ?auto_178805 ?auto_178808 ) ) ( not ( = ?auto_178806 ?auto_178807 ) ) ( not ( = ?auto_178806 ?auto_178808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178807 ?auto_178808 ?auto_178804 )
      ( DELIVER-4PKG-VERIFY ?auto_178805 ?auto_178806 ?auto_178807 ?auto_178808 ?auto_178804 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178853 - OBJ
      ?auto_178854 - OBJ
      ?auto_178855 - OBJ
      ?auto_178856 - OBJ
      ?auto_178852 - LOCATION
    )
    :vars
    (
      ?auto_178857 - LOCATION
      ?auto_178858 - CITY
      ?auto_178859 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178857 ?auto_178858 ) ( IN-CITY ?auto_178852 ?auto_178858 ) ( not ( = ?auto_178852 ?auto_178857 ) ) ( OBJ-AT ?auto_178853 ?auto_178852 ) ( not ( = ?auto_178853 ?auto_178854 ) ) ( OBJ-AT ?auto_178854 ?auto_178857 ) ( TRUCK-AT ?auto_178859 ?auto_178852 ) ( OBJ-AT ?auto_178855 ?auto_178852 ) ( OBJ-AT ?auto_178856 ?auto_178852 ) ( not ( = ?auto_178853 ?auto_178855 ) ) ( not ( = ?auto_178853 ?auto_178856 ) ) ( not ( = ?auto_178854 ?auto_178855 ) ) ( not ( = ?auto_178854 ?auto_178856 ) ) ( not ( = ?auto_178855 ?auto_178856 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178853 ?auto_178854 ?auto_178852 )
      ( DELIVER-4PKG-VERIFY ?auto_178853 ?auto_178854 ?auto_178855 ?auto_178856 ?auto_178852 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178933 - OBJ
      ?auto_178934 - OBJ
      ?auto_178935 - OBJ
      ?auto_178936 - OBJ
      ?auto_178932 - LOCATION
    )
    :vars
    (
      ?auto_178937 - LOCATION
      ?auto_178938 - CITY
      ?auto_178939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178937 ?auto_178938 ) ( IN-CITY ?auto_178932 ?auto_178938 ) ( not ( = ?auto_178932 ?auto_178937 ) ) ( OBJ-AT ?auto_178934 ?auto_178932 ) ( not ( = ?auto_178934 ?auto_178935 ) ) ( OBJ-AT ?auto_178935 ?auto_178937 ) ( TRUCK-AT ?auto_178939 ?auto_178932 ) ( OBJ-AT ?auto_178933 ?auto_178932 ) ( OBJ-AT ?auto_178936 ?auto_178932 ) ( not ( = ?auto_178933 ?auto_178934 ) ) ( not ( = ?auto_178933 ?auto_178935 ) ) ( not ( = ?auto_178933 ?auto_178936 ) ) ( not ( = ?auto_178934 ?auto_178936 ) ) ( not ( = ?auto_178935 ?auto_178936 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178934 ?auto_178935 ?auto_178932 )
      ( DELIVER-4PKG-VERIFY ?auto_178933 ?auto_178934 ?auto_178935 ?auto_178936 ?auto_178932 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178965 - OBJ
      ?auto_178966 - OBJ
      ?auto_178967 - OBJ
      ?auto_178968 - OBJ
      ?auto_178964 - LOCATION
    )
    :vars
    (
      ?auto_178970 - LOCATION
      ?auto_178971 - CITY
      ?auto_178969 - OBJ
      ?auto_178972 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178970 ?auto_178971 ) ( IN-CITY ?auto_178964 ?auto_178971 ) ( not ( = ?auto_178964 ?auto_178970 ) ) ( OBJ-AT ?auto_178969 ?auto_178964 ) ( not ( = ?auto_178969 ?auto_178968 ) ) ( OBJ-AT ?auto_178968 ?auto_178970 ) ( TRUCK-AT ?auto_178972 ?auto_178964 ) ( OBJ-AT ?auto_178965 ?auto_178964 ) ( OBJ-AT ?auto_178966 ?auto_178964 ) ( OBJ-AT ?auto_178967 ?auto_178964 ) ( not ( = ?auto_178965 ?auto_178966 ) ) ( not ( = ?auto_178965 ?auto_178967 ) ) ( not ( = ?auto_178965 ?auto_178968 ) ) ( not ( = ?auto_178965 ?auto_178969 ) ) ( not ( = ?auto_178966 ?auto_178967 ) ) ( not ( = ?auto_178966 ?auto_178968 ) ) ( not ( = ?auto_178966 ?auto_178969 ) ) ( not ( = ?auto_178967 ?auto_178968 ) ) ( not ( = ?auto_178967 ?auto_178969 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178969 ?auto_178968 ?auto_178964 )
      ( DELIVER-4PKG-VERIFY ?auto_178965 ?auto_178966 ?auto_178967 ?auto_178968 ?auto_178964 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178974 - OBJ
      ?auto_178975 - OBJ
      ?auto_178976 - OBJ
      ?auto_178977 - OBJ
      ?auto_178973 - LOCATION
    )
    :vars
    (
      ?auto_178978 - LOCATION
      ?auto_178979 - CITY
      ?auto_178980 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178978 ?auto_178979 ) ( IN-CITY ?auto_178973 ?auto_178979 ) ( not ( = ?auto_178973 ?auto_178978 ) ) ( OBJ-AT ?auto_178977 ?auto_178973 ) ( not ( = ?auto_178977 ?auto_178976 ) ) ( OBJ-AT ?auto_178976 ?auto_178978 ) ( TRUCK-AT ?auto_178980 ?auto_178973 ) ( OBJ-AT ?auto_178974 ?auto_178973 ) ( OBJ-AT ?auto_178975 ?auto_178973 ) ( not ( = ?auto_178974 ?auto_178975 ) ) ( not ( = ?auto_178974 ?auto_178976 ) ) ( not ( = ?auto_178974 ?auto_178977 ) ) ( not ( = ?auto_178975 ?auto_178976 ) ) ( not ( = ?auto_178975 ?auto_178977 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178977 ?auto_178976 ?auto_178973 )
      ( DELIVER-4PKG-VERIFY ?auto_178974 ?auto_178975 ?auto_178976 ?auto_178977 ?auto_178973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178982 - OBJ
      ?auto_178983 - OBJ
      ?auto_178984 - OBJ
      ?auto_178985 - OBJ
      ?auto_178981 - LOCATION
    )
    :vars
    (
      ?auto_178987 - LOCATION
      ?auto_178988 - CITY
      ?auto_178986 - OBJ
      ?auto_178989 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178987 ?auto_178988 ) ( IN-CITY ?auto_178981 ?auto_178988 ) ( not ( = ?auto_178981 ?auto_178987 ) ) ( OBJ-AT ?auto_178986 ?auto_178981 ) ( not ( = ?auto_178986 ?auto_178984 ) ) ( OBJ-AT ?auto_178984 ?auto_178987 ) ( TRUCK-AT ?auto_178989 ?auto_178981 ) ( OBJ-AT ?auto_178982 ?auto_178981 ) ( OBJ-AT ?auto_178983 ?auto_178981 ) ( OBJ-AT ?auto_178985 ?auto_178981 ) ( not ( = ?auto_178982 ?auto_178983 ) ) ( not ( = ?auto_178982 ?auto_178984 ) ) ( not ( = ?auto_178982 ?auto_178985 ) ) ( not ( = ?auto_178982 ?auto_178986 ) ) ( not ( = ?auto_178983 ?auto_178984 ) ) ( not ( = ?auto_178983 ?auto_178985 ) ) ( not ( = ?auto_178983 ?auto_178986 ) ) ( not ( = ?auto_178984 ?auto_178985 ) ) ( not ( = ?auto_178985 ?auto_178986 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178986 ?auto_178984 ?auto_178981 )
      ( DELIVER-4PKG-VERIFY ?auto_178982 ?auto_178983 ?auto_178984 ?auto_178985 ?auto_178981 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179000 - OBJ
      ?auto_179001 - OBJ
      ?auto_179002 - OBJ
      ?auto_179003 - OBJ
      ?auto_178999 - LOCATION
    )
    :vars
    (
      ?auto_179004 - LOCATION
      ?auto_179005 - CITY
      ?auto_179006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179004 ?auto_179005 ) ( IN-CITY ?auto_178999 ?auto_179005 ) ( not ( = ?auto_178999 ?auto_179004 ) ) ( OBJ-AT ?auto_179002 ?auto_178999 ) ( not ( = ?auto_179002 ?auto_179001 ) ) ( OBJ-AT ?auto_179001 ?auto_179004 ) ( TRUCK-AT ?auto_179006 ?auto_178999 ) ( OBJ-AT ?auto_179000 ?auto_178999 ) ( OBJ-AT ?auto_179003 ?auto_178999 ) ( not ( = ?auto_179000 ?auto_179001 ) ) ( not ( = ?auto_179000 ?auto_179002 ) ) ( not ( = ?auto_179000 ?auto_179003 ) ) ( not ( = ?auto_179001 ?auto_179003 ) ) ( not ( = ?auto_179002 ?auto_179003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179002 ?auto_179001 ?auto_178999 )
      ( DELIVER-4PKG-VERIFY ?auto_179000 ?auto_179001 ?auto_179002 ?auto_179003 ?auto_178999 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179032 - OBJ
      ?auto_179033 - OBJ
      ?auto_179034 - OBJ
      ?auto_179035 - OBJ
      ?auto_179031 - LOCATION
    )
    :vars
    (
      ?auto_179037 - LOCATION
      ?auto_179038 - CITY
      ?auto_179036 - OBJ
      ?auto_179039 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179037 ?auto_179038 ) ( IN-CITY ?auto_179031 ?auto_179038 ) ( not ( = ?auto_179031 ?auto_179037 ) ) ( OBJ-AT ?auto_179036 ?auto_179031 ) ( not ( = ?auto_179036 ?auto_179033 ) ) ( OBJ-AT ?auto_179033 ?auto_179037 ) ( TRUCK-AT ?auto_179039 ?auto_179031 ) ( OBJ-AT ?auto_179032 ?auto_179031 ) ( OBJ-AT ?auto_179034 ?auto_179031 ) ( OBJ-AT ?auto_179035 ?auto_179031 ) ( not ( = ?auto_179032 ?auto_179033 ) ) ( not ( = ?auto_179032 ?auto_179034 ) ) ( not ( = ?auto_179032 ?auto_179035 ) ) ( not ( = ?auto_179032 ?auto_179036 ) ) ( not ( = ?auto_179033 ?auto_179034 ) ) ( not ( = ?auto_179033 ?auto_179035 ) ) ( not ( = ?auto_179034 ?auto_179035 ) ) ( not ( = ?auto_179034 ?auto_179036 ) ) ( not ( = ?auto_179035 ?auto_179036 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179036 ?auto_179033 ?auto_179031 )
      ( DELIVER-4PKG-VERIFY ?auto_179032 ?auto_179033 ?auto_179034 ?auto_179035 ?auto_179031 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179076 - OBJ
      ?auto_179077 - OBJ
      ?auto_179078 - OBJ
      ?auto_179079 - OBJ
      ?auto_179075 - LOCATION
    )
    :vars
    (
      ?auto_179080 - LOCATION
      ?auto_179081 - CITY
      ?auto_179082 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179080 ?auto_179081 ) ( IN-CITY ?auto_179075 ?auto_179081 ) ( not ( = ?auto_179075 ?auto_179080 ) ) ( OBJ-AT ?auto_179079 ?auto_179075 ) ( not ( = ?auto_179079 ?auto_179076 ) ) ( OBJ-AT ?auto_179076 ?auto_179080 ) ( TRUCK-AT ?auto_179082 ?auto_179075 ) ( OBJ-AT ?auto_179077 ?auto_179075 ) ( OBJ-AT ?auto_179078 ?auto_179075 ) ( not ( = ?auto_179076 ?auto_179077 ) ) ( not ( = ?auto_179076 ?auto_179078 ) ) ( not ( = ?auto_179077 ?auto_179078 ) ) ( not ( = ?auto_179077 ?auto_179079 ) ) ( not ( = ?auto_179078 ?auto_179079 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179079 ?auto_179076 ?auto_179075 )
      ( DELIVER-4PKG-VERIFY ?auto_179076 ?auto_179077 ?auto_179078 ?auto_179079 ?auto_179075 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179108 - OBJ
      ?auto_179109 - OBJ
      ?auto_179110 - OBJ
      ?auto_179111 - OBJ
      ?auto_179107 - LOCATION
    )
    :vars
    (
      ?auto_179112 - LOCATION
      ?auto_179113 - CITY
      ?auto_179114 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179112 ?auto_179113 ) ( IN-CITY ?auto_179107 ?auto_179113 ) ( not ( = ?auto_179107 ?auto_179112 ) ) ( OBJ-AT ?auto_179109 ?auto_179107 ) ( not ( = ?auto_179109 ?auto_179108 ) ) ( OBJ-AT ?auto_179108 ?auto_179112 ) ( TRUCK-AT ?auto_179114 ?auto_179107 ) ( OBJ-AT ?auto_179110 ?auto_179107 ) ( OBJ-AT ?auto_179111 ?auto_179107 ) ( not ( = ?auto_179108 ?auto_179110 ) ) ( not ( = ?auto_179108 ?auto_179111 ) ) ( not ( = ?auto_179109 ?auto_179110 ) ) ( not ( = ?auto_179109 ?auto_179111 ) ) ( not ( = ?auto_179110 ?auto_179111 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179109 ?auto_179108 ?auto_179107 )
      ( DELIVER-4PKG-VERIFY ?auto_179108 ?auto_179109 ?auto_179110 ?auto_179111 ?auto_179107 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179180 - OBJ
      ?auto_179181 - OBJ
      ?auto_179182 - OBJ
      ?auto_179183 - OBJ
      ?auto_179179 - LOCATION
    )
    :vars
    (
      ?auto_179185 - LOCATION
      ?auto_179186 - CITY
      ?auto_179184 - OBJ
      ?auto_179187 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179185 ?auto_179186 ) ( IN-CITY ?auto_179179 ?auto_179186 ) ( not ( = ?auto_179179 ?auto_179185 ) ) ( OBJ-AT ?auto_179184 ?auto_179179 ) ( not ( = ?auto_179184 ?auto_179180 ) ) ( OBJ-AT ?auto_179180 ?auto_179185 ) ( TRUCK-AT ?auto_179187 ?auto_179179 ) ( OBJ-AT ?auto_179181 ?auto_179179 ) ( OBJ-AT ?auto_179182 ?auto_179179 ) ( OBJ-AT ?auto_179183 ?auto_179179 ) ( not ( = ?auto_179180 ?auto_179181 ) ) ( not ( = ?auto_179180 ?auto_179182 ) ) ( not ( = ?auto_179180 ?auto_179183 ) ) ( not ( = ?auto_179181 ?auto_179182 ) ) ( not ( = ?auto_179181 ?auto_179183 ) ) ( not ( = ?auto_179181 ?auto_179184 ) ) ( not ( = ?auto_179182 ?auto_179183 ) ) ( not ( = ?auto_179182 ?auto_179184 ) ) ( not ( = ?auto_179183 ?auto_179184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179184 ?auto_179180 ?auto_179179 )
      ( DELIVER-4PKG-VERIFY ?auto_179180 ?auto_179181 ?auto_179182 ?auto_179183 ?auto_179179 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179329 - OBJ
      ?auto_179330 - OBJ
      ?auto_179331 - OBJ
      ?auto_179328 - LOCATION
    )
    :vars
    (
      ?auto_179332 - LOCATION
      ?auto_179333 - CITY
      ?auto_179334 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179332 ?auto_179333 ) ( IN-CITY ?auto_179328 ?auto_179333 ) ( not ( = ?auto_179328 ?auto_179332 ) ) ( OBJ-AT ?auto_179329 ?auto_179328 ) ( not ( = ?auto_179329 ?auto_179331 ) ) ( OBJ-AT ?auto_179331 ?auto_179332 ) ( TRUCK-AT ?auto_179334 ?auto_179328 ) ( OBJ-AT ?auto_179330 ?auto_179328 ) ( not ( = ?auto_179329 ?auto_179330 ) ) ( not ( = ?auto_179330 ?auto_179331 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179329 ?auto_179331 ?auto_179328 )
      ( DELIVER-3PKG-VERIFY ?auto_179329 ?auto_179330 ?auto_179331 ?auto_179328 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_180004 - OBJ
      ?auto_180003 - LOCATION
    )
    :vars
    (
      ?auto_180005 - LOCATION
      ?auto_180006 - CITY
      ?auto_180008 - OBJ
      ?auto_180007 - TRUCK
      ?auto_180009 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180005 ?auto_180006 ) ( IN-CITY ?auto_180003 ?auto_180006 ) ( not ( = ?auto_180003 ?auto_180005 ) ) ( OBJ-AT ?auto_180008 ?auto_180003 ) ( not ( = ?auto_180008 ?auto_180004 ) ) ( OBJ-AT ?auto_180004 ?auto_180005 ) ( TRUCK-AT ?auto_180007 ?auto_180009 ) ( IN-CITY ?auto_180009 ?auto_180006 ) ( not ( = ?auto_180003 ?auto_180009 ) ) ( not ( = ?auto_180005 ?auto_180009 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_180007 ?auto_180009 ?auto_180003 ?auto_180006 )
      ( DELIVER-2PKG ?auto_180008 ?auto_180004 ?auto_180003 )
      ( DELIVER-1PKG-VERIFY ?auto_180004 ?auto_180003 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_180011 - OBJ
      ?auto_180012 - OBJ
      ?auto_180010 - LOCATION
    )
    :vars
    (
      ?auto_180016 - LOCATION
      ?auto_180015 - CITY
      ?auto_180013 - TRUCK
      ?auto_180014 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180016 ?auto_180015 ) ( IN-CITY ?auto_180010 ?auto_180015 ) ( not ( = ?auto_180010 ?auto_180016 ) ) ( OBJ-AT ?auto_180011 ?auto_180010 ) ( not ( = ?auto_180011 ?auto_180012 ) ) ( OBJ-AT ?auto_180012 ?auto_180016 ) ( TRUCK-AT ?auto_180013 ?auto_180014 ) ( IN-CITY ?auto_180014 ?auto_180015 ) ( not ( = ?auto_180010 ?auto_180014 ) ) ( not ( = ?auto_180016 ?auto_180014 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_180012 ?auto_180010 )
      ( DELIVER-2PKG-VERIFY ?auto_180011 ?auto_180012 ?auto_180010 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_180026 - OBJ
      ?auto_180027 - OBJ
      ?auto_180025 - LOCATION
    )
    :vars
    (
      ?auto_180031 - LOCATION
      ?auto_180028 - CITY
      ?auto_180030 - TRUCK
      ?auto_180029 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180031 ?auto_180028 ) ( IN-CITY ?auto_180025 ?auto_180028 ) ( not ( = ?auto_180025 ?auto_180031 ) ) ( OBJ-AT ?auto_180027 ?auto_180025 ) ( not ( = ?auto_180027 ?auto_180026 ) ) ( OBJ-AT ?auto_180026 ?auto_180031 ) ( TRUCK-AT ?auto_180030 ?auto_180029 ) ( IN-CITY ?auto_180029 ?auto_180028 ) ( not ( = ?auto_180025 ?auto_180029 ) ) ( not ( = ?auto_180031 ?auto_180029 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180027 ?auto_180026 ?auto_180025 )
      ( DELIVER-2PKG-VERIFY ?auto_180026 ?auto_180027 ?auto_180025 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180049 - OBJ
      ?auto_180050 - OBJ
      ?auto_180051 - OBJ
      ?auto_180048 - LOCATION
    )
    :vars
    (
      ?auto_180055 - LOCATION
      ?auto_180052 - CITY
      ?auto_180054 - TRUCK
      ?auto_180053 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180055 ?auto_180052 ) ( IN-CITY ?auto_180048 ?auto_180052 ) ( not ( = ?auto_180048 ?auto_180055 ) ) ( OBJ-AT ?auto_180050 ?auto_180048 ) ( not ( = ?auto_180050 ?auto_180051 ) ) ( OBJ-AT ?auto_180051 ?auto_180055 ) ( TRUCK-AT ?auto_180054 ?auto_180053 ) ( IN-CITY ?auto_180053 ?auto_180052 ) ( not ( = ?auto_180048 ?auto_180053 ) ) ( not ( = ?auto_180055 ?auto_180053 ) ) ( OBJ-AT ?auto_180049 ?auto_180048 ) ( not ( = ?auto_180049 ?auto_180050 ) ) ( not ( = ?auto_180049 ?auto_180051 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180050 ?auto_180051 ?auto_180048 )
      ( DELIVER-3PKG-VERIFY ?auto_180049 ?auto_180050 ?auto_180051 ?auto_180048 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180065 - OBJ
      ?auto_180066 - OBJ
      ?auto_180067 - OBJ
      ?auto_180064 - LOCATION
    )
    :vars
    (
      ?auto_180071 - LOCATION
      ?auto_180068 - CITY
      ?auto_180070 - TRUCK
      ?auto_180069 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180071 ?auto_180068 ) ( IN-CITY ?auto_180064 ?auto_180068 ) ( not ( = ?auto_180064 ?auto_180071 ) ) ( OBJ-AT ?auto_180067 ?auto_180064 ) ( not ( = ?auto_180067 ?auto_180066 ) ) ( OBJ-AT ?auto_180066 ?auto_180071 ) ( TRUCK-AT ?auto_180070 ?auto_180069 ) ( IN-CITY ?auto_180069 ?auto_180068 ) ( not ( = ?auto_180064 ?auto_180069 ) ) ( not ( = ?auto_180071 ?auto_180069 ) ) ( OBJ-AT ?auto_180065 ?auto_180064 ) ( not ( = ?auto_180065 ?auto_180066 ) ) ( not ( = ?auto_180065 ?auto_180067 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180067 ?auto_180066 ?auto_180064 )
      ( DELIVER-3PKG-VERIFY ?auto_180065 ?auto_180066 ?auto_180067 ?auto_180064 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180132 - OBJ
      ?auto_180133 - OBJ
      ?auto_180134 - OBJ
      ?auto_180131 - LOCATION
    )
    :vars
    (
      ?auto_180138 - LOCATION
      ?auto_180135 - CITY
      ?auto_180137 - TRUCK
      ?auto_180136 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180138 ?auto_180135 ) ( IN-CITY ?auto_180131 ?auto_180135 ) ( not ( = ?auto_180131 ?auto_180138 ) ) ( OBJ-AT ?auto_180134 ?auto_180131 ) ( not ( = ?auto_180134 ?auto_180132 ) ) ( OBJ-AT ?auto_180132 ?auto_180138 ) ( TRUCK-AT ?auto_180137 ?auto_180136 ) ( IN-CITY ?auto_180136 ?auto_180135 ) ( not ( = ?auto_180131 ?auto_180136 ) ) ( not ( = ?auto_180138 ?auto_180136 ) ) ( OBJ-AT ?auto_180133 ?auto_180131 ) ( not ( = ?auto_180132 ?auto_180133 ) ) ( not ( = ?auto_180133 ?auto_180134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180134 ?auto_180132 ?auto_180131 )
      ( DELIVER-3PKG-VERIFY ?auto_180132 ?auto_180133 ?auto_180134 ?auto_180131 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180208 - OBJ
      ?auto_180209 - OBJ
      ?auto_180210 - OBJ
      ?auto_180211 - OBJ
      ?auto_180207 - LOCATION
    )
    :vars
    (
      ?auto_180215 - LOCATION
      ?auto_180212 - CITY
      ?auto_180214 - TRUCK
      ?auto_180213 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180215 ?auto_180212 ) ( IN-CITY ?auto_180207 ?auto_180212 ) ( not ( = ?auto_180207 ?auto_180215 ) ) ( OBJ-AT ?auto_180208 ?auto_180207 ) ( not ( = ?auto_180208 ?auto_180211 ) ) ( OBJ-AT ?auto_180211 ?auto_180215 ) ( TRUCK-AT ?auto_180214 ?auto_180213 ) ( IN-CITY ?auto_180213 ?auto_180212 ) ( not ( = ?auto_180207 ?auto_180213 ) ) ( not ( = ?auto_180215 ?auto_180213 ) ) ( OBJ-AT ?auto_180209 ?auto_180207 ) ( OBJ-AT ?auto_180210 ?auto_180207 ) ( not ( = ?auto_180208 ?auto_180209 ) ) ( not ( = ?auto_180208 ?auto_180210 ) ) ( not ( = ?auto_180209 ?auto_180210 ) ) ( not ( = ?auto_180209 ?auto_180211 ) ) ( not ( = ?auto_180210 ?auto_180211 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180208 ?auto_180211 ?auto_180207 )
      ( DELIVER-4PKG-VERIFY ?auto_180208 ?auto_180209 ?auto_180210 ?auto_180211 ?auto_180207 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180226 - OBJ
      ?auto_180227 - OBJ
      ?auto_180228 - OBJ
      ?auto_180229 - OBJ
      ?auto_180225 - LOCATION
    )
    :vars
    (
      ?auto_180233 - LOCATION
      ?auto_180230 - CITY
      ?auto_180232 - TRUCK
      ?auto_180231 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180233 ?auto_180230 ) ( IN-CITY ?auto_180225 ?auto_180230 ) ( not ( = ?auto_180225 ?auto_180233 ) ) ( OBJ-AT ?auto_180226 ?auto_180225 ) ( not ( = ?auto_180226 ?auto_180228 ) ) ( OBJ-AT ?auto_180228 ?auto_180233 ) ( TRUCK-AT ?auto_180232 ?auto_180231 ) ( IN-CITY ?auto_180231 ?auto_180230 ) ( not ( = ?auto_180225 ?auto_180231 ) ) ( not ( = ?auto_180233 ?auto_180231 ) ) ( OBJ-AT ?auto_180227 ?auto_180225 ) ( OBJ-AT ?auto_180229 ?auto_180225 ) ( not ( = ?auto_180226 ?auto_180227 ) ) ( not ( = ?auto_180226 ?auto_180229 ) ) ( not ( = ?auto_180227 ?auto_180228 ) ) ( not ( = ?auto_180227 ?auto_180229 ) ) ( not ( = ?auto_180228 ?auto_180229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180226 ?auto_180228 ?auto_180225 )
      ( DELIVER-4PKG-VERIFY ?auto_180226 ?auto_180227 ?auto_180228 ?auto_180229 ?auto_180225 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180298 - OBJ
      ?auto_180299 - OBJ
      ?auto_180300 - OBJ
      ?auto_180301 - OBJ
      ?auto_180297 - LOCATION
    )
    :vars
    (
      ?auto_180305 - LOCATION
      ?auto_180302 - CITY
      ?auto_180304 - TRUCK
      ?auto_180303 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180305 ?auto_180302 ) ( IN-CITY ?auto_180297 ?auto_180302 ) ( not ( = ?auto_180297 ?auto_180305 ) ) ( OBJ-AT ?auto_180298 ?auto_180297 ) ( not ( = ?auto_180298 ?auto_180299 ) ) ( OBJ-AT ?auto_180299 ?auto_180305 ) ( TRUCK-AT ?auto_180304 ?auto_180303 ) ( IN-CITY ?auto_180303 ?auto_180302 ) ( not ( = ?auto_180297 ?auto_180303 ) ) ( not ( = ?auto_180305 ?auto_180303 ) ) ( OBJ-AT ?auto_180300 ?auto_180297 ) ( OBJ-AT ?auto_180301 ?auto_180297 ) ( not ( = ?auto_180298 ?auto_180300 ) ) ( not ( = ?auto_180298 ?auto_180301 ) ) ( not ( = ?auto_180299 ?auto_180300 ) ) ( not ( = ?auto_180299 ?auto_180301 ) ) ( not ( = ?auto_180300 ?auto_180301 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180298 ?auto_180299 ?auto_180297 )
      ( DELIVER-4PKG-VERIFY ?auto_180298 ?auto_180299 ?auto_180300 ?auto_180301 ?auto_180297 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180557 - OBJ
      ?auto_180558 - OBJ
      ?auto_180559 - OBJ
      ?auto_180560 - OBJ
      ?auto_180556 - LOCATION
    )
    :vars
    (
      ?auto_180564 - LOCATION
      ?auto_180561 - CITY
      ?auto_180563 - TRUCK
      ?auto_180562 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180564 ?auto_180561 ) ( IN-CITY ?auto_180556 ?auto_180561 ) ( not ( = ?auto_180556 ?auto_180564 ) ) ( OBJ-AT ?auto_180559 ?auto_180556 ) ( not ( = ?auto_180559 ?auto_180557 ) ) ( OBJ-AT ?auto_180557 ?auto_180564 ) ( TRUCK-AT ?auto_180563 ?auto_180562 ) ( IN-CITY ?auto_180562 ?auto_180561 ) ( not ( = ?auto_180556 ?auto_180562 ) ) ( not ( = ?auto_180564 ?auto_180562 ) ) ( OBJ-AT ?auto_180558 ?auto_180556 ) ( OBJ-AT ?auto_180560 ?auto_180556 ) ( not ( = ?auto_180557 ?auto_180558 ) ) ( not ( = ?auto_180557 ?auto_180560 ) ) ( not ( = ?auto_180558 ?auto_180559 ) ) ( not ( = ?auto_180558 ?auto_180560 ) ) ( not ( = ?auto_180559 ?auto_180560 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180559 ?auto_180557 ?auto_180556 )
      ( DELIVER-4PKG-VERIFY ?auto_180557 ?auto_180558 ?auto_180559 ?auto_180560 ?auto_180556 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180840 - OBJ
      ?auto_180841 - OBJ
      ?auto_180842 - OBJ
      ?auto_180839 - LOCATION
    )
    :vars
    (
      ?auto_180846 - LOCATION
      ?auto_180845 - CITY
      ?auto_180843 - TRUCK
      ?auto_180844 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180846 ?auto_180845 ) ( IN-CITY ?auto_180839 ?auto_180845 ) ( not ( = ?auto_180839 ?auto_180846 ) ) ( OBJ-AT ?auto_180840 ?auto_180839 ) ( not ( = ?auto_180840 ?auto_180842 ) ) ( OBJ-AT ?auto_180842 ?auto_180846 ) ( TRUCK-AT ?auto_180843 ?auto_180844 ) ( IN-CITY ?auto_180844 ?auto_180845 ) ( not ( = ?auto_180839 ?auto_180844 ) ) ( not ( = ?auto_180846 ?auto_180844 ) ) ( OBJ-AT ?auto_180841 ?auto_180839 ) ( not ( = ?auto_180840 ?auto_180841 ) ) ( not ( = ?auto_180841 ?auto_180842 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180840 ?auto_180842 ?auto_180839 )
      ( DELIVER-3PKG-VERIFY ?auto_180840 ?auto_180841 ?auto_180842 ?auto_180839 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180999 - OBJ
      ?auto_181000 - OBJ
      ?auto_181001 - OBJ
      ?auto_181002 - OBJ
      ?auto_180998 - LOCATION
    )
    :vars
    (
      ?auto_181006 - LOCATION
      ?auto_181005 - CITY
      ?auto_181003 - TRUCK
      ?auto_181004 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181006 ?auto_181005 ) ( IN-CITY ?auto_180998 ?auto_181005 ) ( not ( = ?auto_180998 ?auto_181006 ) ) ( OBJ-AT ?auto_181000 ?auto_180998 ) ( not ( = ?auto_181000 ?auto_181002 ) ) ( OBJ-AT ?auto_181002 ?auto_181006 ) ( TRUCK-AT ?auto_181003 ?auto_181004 ) ( IN-CITY ?auto_181004 ?auto_181005 ) ( not ( = ?auto_180998 ?auto_181004 ) ) ( not ( = ?auto_181006 ?auto_181004 ) ) ( OBJ-AT ?auto_180999 ?auto_180998 ) ( OBJ-AT ?auto_181001 ?auto_180998 ) ( not ( = ?auto_180999 ?auto_181000 ) ) ( not ( = ?auto_180999 ?auto_181001 ) ) ( not ( = ?auto_180999 ?auto_181002 ) ) ( not ( = ?auto_181000 ?auto_181001 ) ) ( not ( = ?auto_181001 ?auto_181002 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181000 ?auto_181002 ?auto_180998 )
      ( DELIVER-4PKG-VERIFY ?auto_180999 ?auto_181000 ?auto_181001 ?auto_181002 ?auto_180998 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181017 - OBJ
      ?auto_181018 - OBJ
      ?auto_181019 - OBJ
      ?auto_181020 - OBJ
      ?auto_181016 - LOCATION
    )
    :vars
    (
      ?auto_181024 - LOCATION
      ?auto_181023 - CITY
      ?auto_181021 - TRUCK
      ?auto_181022 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181024 ?auto_181023 ) ( IN-CITY ?auto_181016 ?auto_181023 ) ( not ( = ?auto_181016 ?auto_181024 ) ) ( OBJ-AT ?auto_181020 ?auto_181016 ) ( not ( = ?auto_181020 ?auto_181019 ) ) ( OBJ-AT ?auto_181019 ?auto_181024 ) ( TRUCK-AT ?auto_181021 ?auto_181022 ) ( IN-CITY ?auto_181022 ?auto_181023 ) ( not ( = ?auto_181016 ?auto_181022 ) ) ( not ( = ?auto_181024 ?auto_181022 ) ) ( OBJ-AT ?auto_181017 ?auto_181016 ) ( OBJ-AT ?auto_181018 ?auto_181016 ) ( not ( = ?auto_181017 ?auto_181018 ) ) ( not ( = ?auto_181017 ?auto_181019 ) ) ( not ( = ?auto_181017 ?auto_181020 ) ) ( not ( = ?auto_181018 ?auto_181019 ) ) ( not ( = ?auto_181018 ?auto_181020 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181020 ?auto_181019 ?auto_181016 )
      ( DELIVER-4PKG-VERIFY ?auto_181017 ?auto_181018 ?auto_181019 ?auto_181020 ?auto_181016 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_187591 - OBJ
      ?auto_187592 - OBJ
      ?auto_187593 - OBJ
      ?auto_187590 - LOCATION
    )
    :vars
    (
      ?auto_187594 - TRUCK
      ?auto_187595 - LOCATION
      ?auto_187596 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_187592 ?auto_187594 ) ( TRUCK-AT ?auto_187594 ?auto_187595 ) ( IN-CITY ?auto_187595 ?auto_187596 ) ( IN-CITY ?auto_187590 ?auto_187596 ) ( not ( = ?auto_187590 ?auto_187595 ) ) ( OBJ-AT ?auto_187591 ?auto_187590 ) ( not ( = ?auto_187591 ?auto_187592 ) ) ( OBJ-AT ?auto_187593 ?auto_187590 ) ( not ( = ?auto_187591 ?auto_187593 ) ) ( not ( = ?auto_187592 ?auto_187593 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187591 ?auto_187592 ?auto_187590 )
      ( DELIVER-3PKG-VERIFY ?auto_187591 ?auto_187592 ?auto_187593 ?auto_187590 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_187693 - OBJ
      ?auto_187694 - OBJ
      ?auto_187695 - OBJ
      ?auto_187692 - LOCATION
    )
    :vars
    (
      ?auto_187696 - TRUCK
      ?auto_187697 - LOCATION
      ?auto_187698 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_187693 ?auto_187696 ) ( TRUCK-AT ?auto_187696 ?auto_187697 ) ( IN-CITY ?auto_187697 ?auto_187698 ) ( IN-CITY ?auto_187692 ?auto_187698 ) ( not ( = ?auto_187692 ?auto_187697 ) ) ( OBJ-AT ?auto_187694 ?auto_187692 ) ( not ( = ?auto_187694 ?auto_187693 ) ) ( OBJ-AT ?auto_187695 ?auto_187692 ) ( not ( = ?auto_187693 ?auto_187695 ) ) ( not ( = ?auto_187694 ?auto_187695 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187694 ?auto_187693 ?auto_187692 )
      ( DELIVER-3PKG-VERIFY ?auto_187693 ?auto_187694 ?auto_187695 ?auto_187692 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194314 - OBJ
      ?auto_194315 - OBJ
      ?auto_194316 - OBJ
      ?auto_194313 - LOCATION
    )
    :vars
    (
      ?auto_194318 - LOCATION
      ?auto_194319 - CITY
      ?auto_194317 - TRUCK
      ?auto_194320 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194318 ?auto_194319 ) ( IN-CITY ?auto_194313 ?auto_194319 ) ( not ( = ?auto_194313 ?auto_194318 ) ) ( OBJ-AT ?auto_194314 ?auto_194313 ) ( not ( = ?auto_194314 ?auto_194315 ) ) ( OBJ-AT ?auto_194315 ?auto_194318 ) ( TRUCK-AT ?auto_194317 ?auto_194320 ) ( IN-CITY ?auto_194320 ?auto_194319 ) ( not ( = ?auto_194313 ?auto_194320 ) ) ( not ( = ?auto_194318 ?auto_194320 ) ) ( OBJ-AT ?auto_194316 ?auto_194313 ) ( not ( = ?auto_194314 ?auto_194316 ) ) ( not ( = ?auto_194315 ?auto_194316 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194314 ?auto_194315 ?auto_194313 )
      ( DELIVER-3PKG-VERIFY ?auto_194314 ?auto_194315 ?auto_194316 ?auto_194313 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194346 - OBJ
      ?auto_194347 - OBJ
      ?auto_194348 - OBJ
      ?auto_194345 - LOCATION
    )
    :vars
    (
      ?auto_194351 - LOCATION
      ?auto_194352 - CITY
      ?auto_194350 - OBJ
      ?auto_194349 - TRUCK
      ?auto_194353 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194351 ?auto_194352 ) ( IN-CITY ?auto_194345 ?auto_194352 ) ( not ( = ?auto_194345 ?auto_194351 ) ) ( OBJ-AT ?auto_194350 ?auto_194345 ) ( not ( = ?auto_194350 ?auto_194348 ) ) ( OBJ-AT ?auto_194348 ?auto_194351 ) ( TRUCK-AT ?auto_194349 ?auto_194353 ) ( IN-CITY ?auto_194353 ?auto_194352 ) ( not ( = ?auto_194345 ?auto_194353 ) ) ( not ( = ?auto_194351 ?auto_194353 ) ) ( OBJ-AT ?auto_194346 ?auto_194345 ) ( OBJ-AT ?auto_194347 ?auto_194345 ) ( not ( = ?auto_194346 ?auto_194347 ) ) ( not ( = ?auto_194346 ?auto_194348 ) ) ( not ( = ?auto_194346 ?auto_194350 ) ) ( not ( = ?auto_194347 ?auto_194348 ) ) ( not ( = ?auto_194347 ?auto_194350 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194350 ?auto_194348 ?auto_194345 )
      ( DELIVER-3PKG-VERIFY ?auto_194346 ?auto_194347 ?auto_194348 ?auto_194345 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194368 - OBJ
      ?auto_194369 - OBJ
      ?auto_194370 - OBJ
      ?auto_194367 - LOCATION
    )
    :vars
    (
      ?auto_194373 - LOCATION
      ?auto_194374 - CITY
      ?auto_194372 - OBJ
      ?auto_194371 - TRUCK
      ?auto_194375 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194373 ?auto_194374 ) ( IN-CITY ?auto_194367 ?auto_194374 ) ( not ( = ?auto_194367 ?auto_194373 ) ) ( OBJ-AT ?auto_194372 ?auto_194367 ) ( not ( = ?auto_194372 ?auto_194369 ) ) ( OBJ-AT ?auto_194369 ?auto_194373 ) ( TRUCK-AT ?auto_194371 ?auto_194375 ) ( IN-CITY ?auto_194375 ?auto_194374 ) ( not ( = ?auto_194367 ?auto_194375 ) ) ( not ( = ?auto_194373 ?auto_194375 ) ) ( OBJ-AT ?auto_194368 ?auto_194367 ) ( OBJ-AT ?auto_194370 ?auto_194367 ) ( not ( = ?auto_194368 ?auto_194369 ) ) ( not ( = ?auto_194368 ?auto_194370 ) ) ( not ( = ?auto_194368 ?auto_194372 ) ) ( not ( = ?auto_194369 ?auto_194370 ) ) ( not ( = ?auto_194370 ?auto_194372 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194372 ?auto_194369 ?auto_194367 )
      ( DELIVER-3PKG-VERIFY ?auto_194368 ?auto_194369 ?auto_194370 ?auto_194367 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194488 - OBJ
      ?auto_194489 - OBJ
      ?auto_194490 - OBJ
      ?auto_194487 - LOCATION
    )
    :vars
    (
      ?auto_194493 - LOCATION
      ?auto_194494 - CITY
      ?auto_194492 - OBJ
      ?auto_194491 - TRUCK
      ?auto_194495 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194493 ?auto_194494 ) ( IN-CITY ?auto_194487 ?auto_194494 ) ( not ( = ?auto_194487 ?auto_194493 ) ) ( OBJ-AT ?auto_194492 ?auto_194487 ) ( not ( = ?auto_194492 ?auto_194488 ) ) ( OBJ-AT ?auto_194488 ?auto_194493 ) ( TRUCK-AT ?auto_194491 ?auto_194495 ) ( IN-CITY ?auto_194495 ?auto_194494 ) ( not ( = ?auto_194487 ?auto_194495 ) ) ( not ( = ?auto_194493 ?auto_194495 ) ) ( OBJ-AT ?auto_194489 ?auto_194487 ) ( OBJ-AT ?auto_194490 ?auto_194487 ) ( not ( = ?auto_194488 ?auto_194489 ) ) ( not ( = ?auto_194488 ?auto_194490 ) ) ( not ( = ?auto_194489 ?auto_194490 ) ) ( not ( = ?auto_194489 ?auto_194492 ) ) ( not ( = ?auto_194490 ?auto_194492 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194492 ?auto_194488 ?auto_194487 )
      ( DELIVER-3PKG-VERIFY ?auto_194488 ?auto_194489 ?auto_194490 ?auto_194487 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194621 - OBJ
      ?auto_194622 - OBJ
      ?auto_194623 - OBJ
      ?auto_194624 - OBJ
      ?auto_194620 - LOCATION
    )
    :vars
    (
      ?auto_194626 - LOCATION
      ?auto_194627 - CITY
      ?auto_194625 - TRUCK
      ?auto_194628 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194626 ?auto_194627 ) ( IN-CITY ?auto_194620 ?auto_194627 ) ( not ( = ?auto_194620 ?auto_194626 ) ) ( OBJ-AT ?auto_194622 ?auto_194620 ) ( not ( = ?auto_194622 ?auto_194623 ) ) ( OBJ-AT ?auto_194623 ?auto_194626 ) ( TRUCK-AT ?auto_194625 ?auto_194628 ) ( IN-CITY ?auto_194628 ?auto_194627 ) ( not ( = ?auto_194620 ?auto_194628 ) ) ( not ( = ?auto_194626 ?auto_194628 ) ) ( OBJ-AT ?auto_194621 ?auto_194620 ) ( OBJ-AT ?auto_194624 ?auto_194620 ) ( not ( = ?auto_194621 ?auto_194622 ) ) ( not ( = ?auto_194621 ?auto_194623 ) ) ( not ( = ?auto_194621 ?auto_194624 ) ) ( not ( = ?auto_194622 ?auto_194624 ) ) ( not ( = ?auto_194623 ?auto_194624 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194622 ?auto_194623 ?auto_194620 )
      ( DELIVER-4PKG-VERIFY ?auto_194621 ?auto_194622 ?auto_194623 ?auto_194624 ?auto_194620 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194648 - OBJ
      ?auto_194649 - OBJ
      ?auto_194650 - OBJ
      ?auto_194651 - OBJ
      ?auto_194647 - LOCATION
    )
    :vars
    (
      ?auto_194653 - LOCATION
      ?auto_194654 - CITY
      ?auto_194652 - TRUCK
      ?auto_194655 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194653 ?auto_194654 ) ( IN-CITY ?auto_194647 ?auto_194654 ) ( not ( = ?auto_194647 ?auto_194653 ) ) ( OBJ-AT ?auto_194650 ?auto_194647 ) ( not ( = ?auto_194650 ?auto_194651 ) ) ( OBJ-AT ?auto_194651 ?auto_194653 ) ( TRUCK-AT ?auto_194652 ?auto_194655 ) ( IN-CITY ?auto_194655 ?auto_194654 ) ( not ( = ?auto_194647 ?auto_194655 ) ) ( not ( = ?auto_194653 ?auto_194655 ) ) ( OBJ-AT ?auto_194648 ?auto_194647 ) ( OBJ-AT ?auto_194649 ?auto_194647 ) ( not ( = ?auto_194648 ?auto_194649 ) ) ( not ( = ?auto_194648 ?auto_194650 ) ) ( not ( = ?auto_194648 ?auto_194651 ) ) ( not ( = ?auto_194649 ?auto_194650 ) ) ( not ( = ?auto_194649 ?auto_194651 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194650 ?auto_194651 ?auto_194647 )
      ( DELIVER-4PKG-VERIFY ?auto_194648 ?auto_194649 ?auto_194650 ?auto_194651 ?auto_194647 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194774 - OBJ
      ?auto_194775 - OBJ
      ?auto_194776 - OBJ
      ?auto_194777 - OBJ
      ?auto_194773 - LOCATION
    )
    :vars
    (
      ?auto_194779 - LOCATION
      ?auto_194780 - CITY
      ?auto_194778 - TRUCK
      ?auto_194781 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194779 ?auto_194780 ) ( IN-CITY ?auto_194773 ?auto_194780 ) ( not ( = ?auto_194773 ?auto_194779 ) ) ( OBJ-AT ?auto_194777 ?auto_194773 ) ( not ( = ?auto_194777 ?auto_194775 ) ) ( OBJ-AT ?auto_194775 ?auto_194779 ) ( TRUCK-AT ?auto_194778 ?auto_194781 ) ( IN-CITY ?auto_194781 ?auto_194780 ) ( not ( = ?auto_194773 ?auto_194781 ) ) ( not ( = ?auto_194779 ?auto_194781 ) ) ( OBJ-AT ?auto_194774 ?auto_194773 ) ( OBJ-AT ?auto_194776 ?auto_194773 ) ( not ( = ?auto_194774 ?auto_194775 ) ) ( not ( = ?auto_194774 ?auto_194776 ) ) ( not ( = ?auto_194774 ?auto_194777 ) ) ( not ( = ?auto_194775 ?auto_194776 ) ) ( not ( = ?auto_194776 ?auto_194777 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194777 ?auto_194775 ?auto_194773 )
      ( DELIVER-4PKG-VERIFY ?auto_194774 ?auto_194775 ?auto_194776 ?auto_194777 ?auto_194773 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194783 - OBJ
      ?auto_194784 - OBJ
      ?auto_194785 - OBJ
      ?auto_194786 - OBJ
      ?auto_194782 - LOCATION
    )
    :vars
    (
      ?auto_194788 - LOCATION
      ?auto_194789 - CITY
      ?auto_194787 - TRUCK
      ?auto_194790 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194788 ?auto_194789 ) ( IN-CITY ?auto_194782 ?auto_194789 ) ( not ( = ?auto_194782 ?auto_194788 ) ) ( OBJ-AT ?auto_194785 ?auto_194782 ) ( not ( = ?auto_194785 ?auto_194784 ) ) ( OBJ-AT ?auto_194784 ?auto_194788 ) ( TRUCK-AT ?auto_194787 ?auto_194790 ) ( IN-CITY ?auto_194790 ?auto_194789 ) ( not ( = ?auto_194782 ?auto_194790 ) ) ( not ( = ?auto_194788 ?auto_194790 ) ) ( OBJ-AT ?auto_194783 ?auto_194782 ) ( OBJ-AT ?auto_194786 ?auto_194782 ) ( not ( = ?auto_194783 ?auto_194784 ) ) ( not ( = ?auto_194783 ?auto_194785 ) ) ( not ( = ?auto_194783 ?auto_194786 ) ) ( not ( = ?auto_194784 ?auto_194786 ) ) ( not ( = ?auto_194785 ?auto_194786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194785 ?auto_194784 ?auto_194782 )
      ( DELIVER-4PKG-VERIFY ?auto_194783 ?auto_194784 ?auto_194785 ?auto_194786 ?auto_194782 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194990 - OBJ
      ?auto_194991 - OBJ
      ?auto_194992 - OBJ
      ?auto_194993 - OBJ
      ?auto_194989 - LOCATION
    )
    :vars
    (
      ?auto_194996 - LOCATION
      ?auto_194997 - CITY
      ?auto_194995 - OBJ
      ?auto_194994 - TRUCK
      ?auto_194998 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_194996 ?auto_194997 ) ( IN-CITY ?auto_194989 ?auto_194997 ) ( not ( = ?auto_194989 ?auto_194996 ) ) ( OBJ-AT ?auto_194995 ?auto_194989 ) ( not ( = ?auto_194995 ?auto_194993 ) ) ( OBJ-AT ?auto_194993 ?auto_194996 ) ( TRUCK-AT ?auto_194994 ?auto_194998 ) ( IN-CITY ?auto_194998 ?auto_194997 ) ( not ( = ?auto_194989 ?auto_194998 ) ) ( not ( = ?auto_194996 ?auto_194998 ) ) ( OBJ-AT ?auto_194990 ?auto_194989 ) ( OBJ-AT ?auto_194991 ?auto_194989 ) ( OBJ-AT ?auto_194992 ?auto_194989 ) ( not ( = ?auto_194990 ?auto_194991 ) ) ( not ( = ?auto_194990 ?auto_194992 ) ) ( not ( = ?auto_194990 ?auto_194993 ) ) ( not ( = ?auto_194990 ?auto_194995 ) ) ( not ( = ?auto_194991 ?auto_194992 ) ) ( not ( = ?auto_194991 ?auto_194993 ) ) ( not ( = ?auto_194991 ?auto_194995 ) ) ( not ( = ?auto_194992 ?auto_194993 ) ) ( not ( = ?auto_194992 ?auto_194995 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194995 ?auto_194993 ?auto_194989 )
      ( DELIVER-4PKG-VERIFY ?auto_194990 ?auto_194991 ?auto_194992 ?auto_194993 ?auto_194989 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195019 - OBJ
      ?auto_195020 - OBJ
      ?auto_195021 - OBJ
      ?auto_195022 - OBJ
      ?auto_195018 - LOCATION
    )
    :vars
    (
      ?auto_195025 - LOCATION
      ?auto_195026 - CITY
      ?auto_195024 - OBJ
      ?auto_195023 - TRUCK
      ?auto_195027 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195025 ?auto_195026 ) ( IN-CITY ?auto_195018 ?auto_195026 ) ( not ( = ?auto_195018 ?auto_195025 ) ) ( OBJ-AT ?auto_195024 ?auto_195018 ) ( not ( = ?auto_195024 ?auto_195021 ) ) ( OBJ-AT ?auto_195021 ?auto_195025 ) ( TRUCK-AT ?auto_195023 ?auto_195027 ) ( IN-CITY ?auto_195027 ?auto_195026 ) ( not ( = ?auto_195018 ?auto_195027 ) ) ( not ( = ?auto_195025 ?auto_195027 ) ) ( OBJ-AT ?auto_195019 ?auto_195018 ) ( OBJ-AT ?auto_195020 ?auto_195018 ) ( OBJ-AT ?auto_195022 ?auto_195018 ) ( not ( = ?auto_195019 ?auto_195020 ) ) ( not ( = ?auto_195019 ?auto_195021 ) ) ( not ( = ?auto_195019 ?auto_195022 ) ) ( not ( = ?auto_195019 ?auto_195024 ) ) ( not ( = ?auto_195020 ?auto_195021 ) ) ( not ( = ?auto_195020 ?auto_195022 ) ) ( not ( = ?auto_195020 ?auto_195024 ) ) ( not ( = ?auto_195021 ?auto_195022 ) ) ( not ( = ?auto_195022 ?auto_195024 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195024 ?auto_195021 ?auto_195018 )
      ( DELIVER-4PKG-VERIFY ?auto_195019 ?auto_195020 ?auto_195021 ?auto_195022 ?auto_195018 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195162 - OBJ
      ?auto_195163 - OBJ
      ?auto_195164 - OBJ
      ?auto_195165 - OBJ
      ?auto_195161 - LOCATION
    )
    :vars
    (
      ?auto_195168 - LOCATION
      ?auto_195169 - CITY
      ?auto_195167 - OBJ
      ?auto_195166 - TRUCK
      ?auto_195170 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195168 ?auto_195169 ) ( IN-CITY ?auto_195161 ?auto_195169 ) ( not ( = ?auto_195161 ?auto_195168 ) ) ( OBJ-AT ?auto_195167 ?auto_195161 ) ( not ( = ?auto_195167 ?auto_195163 ) ) ( OBJ-AT ?auto_195163 ?auto_195168 ) ( TRUCK-AT ?auto_195166 ?auto_195170 ) ( IN-CITY ?auto_195170 ?auto_195169 ) ( not ( = ?auto_195161 ?auto_195170 ) ) ( not ( = ?auto_195168 ?auto_195170 ) ) ( OBJ-AT ?auto_195162 ?auto_195161 ) ( OBJ-AT ?auto_195164 ?auto_195161 ) ( OBJ-AT ?auto_195165 ?auto_195161 ) ( not ( = ?auto_195162 ?auto_195163 ) ) ( not ( = ?auto_195162 ?auto_195164 ) ) ( not ( = ?auto_195162 ?auto_195165 ) ) ( not ( = ?auto_195162 ?auto_195167 ) ) ( not ( = ?auto_195163 ?auto_195164 ) ) ( not ( = ?auto_195163 ?auto_195165 ) ) ( not ( = ?auto_195164 ?auto_195165 ) ) ( not ( = ?auto_195164 ?auto_195167 ) ) ( not ( = ?auto_195165 ?auto_195167 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195167 ?auto_195163 ?auto_195161 )
      ( DELIVER-4PKG-VERIFY ?auto_195162 ?auto_195163 ?auto_195164 ?auto_195165 ?auto_195161 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195658 - OBJ
      ?auto_195659 - OBJ
      ?auto_195660 - OBJ
      ?auto_195661 - OBJ
      ?auto_195657 - LOCATION
    )
    :vars
    (
      ?auto_195663 - LOCATION
      ?auto_195664 - CITY
      ?auto_195662 - TRUCK
      ?auto_195665 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195663 ?auto_195664 ) ( IN-CITY ?auto_195657 ?auto_195664 ) ( not ( = ?auto_195657 ?auto_195663 ) ) ( OBJ-AT ?auto_195659 ?auto_195657 ) ( not ( = ?auto_195659 ?auto_195658 ) ) ( OBJ-AT ?auto_195658 ?auto_195663 ) ( TRUCK-AT ?auto_195662 ?auto_195665 ) ( IN-CITY ?auto_195665 ?auto_195664 ) ( not ( = ?auto_195657 ?auto_195665 ) ) ( not ( = ?auto_195663 ?auto_195665 ) ) ( OBJ-AT ?auto_195660 ?auto_195657 ) ( OBJ-AT ?auto_195661 ?auto_195657 ) ( not ( = ?auto_195658 ?auto_195660 ) ) ( not ( = ?auto_195658 ?auto_195661 ) ) ( not ( = ?auto_195659 ?auto_195660 ) ) ( not ( = ?auto_195659 ?auto_195661 ) ) ( not ( = ?auto_195660 ?auto_195661 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195659 ?auto_195658 ?auto_195657 )
      ( DELIVER-4PKG-VERIFY ?auto_195658 ?auto_195659 ?auto_195660 ?auto_195661 ?auto_195657 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195802 - OBJ
      ?auto_195803 - OBJ
      ?auto_195804 - OBJ
      ?auto_195805 - OBJ
      ?auto_195801 - LOCATION
    )
    :vars
    (
      ?auto_195807 - LOCATION
      ?auto_195808 - CITY
      ?auto_195806 - TRUCK
      ?auto_195809 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195807 ?auto_195808 ) ( IN-CITY ?auto_195801 ?auto_195808 ) ( not ( = ?auto_195801 ?auto_195807 ) ) ( OBJ-AT ?auto_195805 ?auto_195801 ) ( not ( = ?auto_195805 ?auto_195802 ) ) ( OBJ-AT ?auto_195802 ?auto_195807 ) ( TRUCK-AT ?auto_195806 ?auto_195809 ) ( IN-CITY ?auto_195809 ?auto_195808 ) ( not ( = ?auto_195801 ?auto_195809 ) ) ( not ( = ?auto_195807 ?auto_195809 ) ) ( OBJ-AT ?auto_195803 ?auto_195801 ) ( OBJ-AT ?auto_195804 ?auto_195801 ) ( not ( = ?auto_195802 ?auto_195803 ) ) ( not ( = ?auto_195802 ?auto_195804 ) ) ( not ( = ?auto_195803 ?auto_195804 ) ) ( not ( = ?auto_195803 ?auto_195805 ) ) ( not ( = ?auto_195804 ?auto_195805 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195805 ?auto_195802 ?auto_195801 )
      ( DELIVER-4PKG-VERIFY ?auto_195802 ?auto_195803 ?auto_195804 ?auto_195805 ?auto_195801 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195811 - OBJ
      ?auto_195812 - OBJ
      ?auto_195813 - OBJ
      ?auto_195814 - OBJ
      ?auto_195810 - LOCATION
    )
    :vars
    (
      ?auto_195817 - LOCATION
      ?auto_195818 - CITY
      ?auto_195816 - OBJ
      ?auto_195815 - TRUCK
      ?auto_195819 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195817 ?auto_195818 ) ( IN-CITY ?auto_195810 ?auto_195818 ) ( not ( = ?auto_195810 ?auto_195817 ) ) ( OBJ-AT ?auto_195816 ?auto_195810 ) ( not ( = ?auto_195816 ?auto_195811 ) ) ( OBJ-AT ?auto_195811 ?auto_195817 ) ( TRUCK-AT ?auto_195815 ?auto_195819 ) ( IN-CITY ?auto_195819 ?auto_195818 ) ( not ( = ?auto_195810 ?auto_195819 ) ) ( not ( = ?auto_195817 ?auto_195819 ) ) ( OBJ-AT ?auto_195812 ?auto_195810 ) ( OBJ-AT ?auto_195813 ?auto_195810 ) ( OBJ-AT ?auto_195814 ?auto_195810 ) ( not ( = ?auto_195811 ?auto_195812 ) ) ( not ( = ?auto_195811 ?auto_195813 ) ) ( not ( = ?auto_195811 ?auto_195814 ) ) ( not ( = ?auto_195812 ?auto_195813 ) ) ( not ( = ?auto_195812 ?auto_195814 ) ) ( not ( = ?auto_195812 ?auto_195816 ) ) ( not ( = ?auto_195813 ?auto_195814 ) ) ( not ( = ?auto_195813 ?auto_195816 ) ) ( not ( = ?auto_195814 ?auto_195816 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195816 ?auto_195811 ?auto_195810 )
      ( DELIVER-4PKG-VERIFY ?auto_195811 ?auto_195812 ?auto_195813 ?auto_195814 ?auto_195810 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_196425 - OBJ
      ?auto_196426 - OBJ
      ?auto_196427 - OBJ
      ?auto_196424 - LOCATION
    )
    :vars
    (
      ?auto_196431 - LOCATION
      ?auto_196428 - CITY
      ?auto_196429 - TRUCK
      ?auto_196430 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196431 ?auto_196428 ) ( IN-CITY ?auto_196424 ?auto_196428 ) ( not ( = ?auto_196424 ?auto_196431 ) ) ( OBJ-AT ?auto_196426 ?auto_196424 ) ( not ( = ?auto_196426 ?auto_196425 ) ) ( OBJ-AT ?auto_196425 ?auto_196431 ) ( TRUCK-AT ?auto_196429 ?auto_196430 ) ( IN-CITY ?auto_196430 ?auto_196428 ) ( not ( = ?auto_196424 ?auto_196430 ) ) ( not ( = ?auto_196431 ?auto_196430 ) ) ( OBJ-AT ?auto_196427 ?auto_196424 ) ( not ( = ?auto_196425 ?auto_196427 ) ) ( not ( = ?auto_196426 ?auto_196427 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196426 ?auto_196425 ?auto_196424 )
      ( DELIVER-3PKG-VERIFY ?auto_196425 ?auto_196426 ?auto_196427 ?auto_196424 ) )
  )

)

