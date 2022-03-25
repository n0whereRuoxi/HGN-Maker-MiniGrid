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
      ?auto_4621 - OBJ
      ?auto_4620 - LOCATION
    )
    :vars
    (
      ?auto_4623 - LOCATION
      ?auto_4624 - CITY
      ?auto_4622 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4623 ?auto_4624 ) ( IN-CITY ?auto_4620 ?auto_4624 ) ( not ( = ?auto_4620 ?auto_4623 ) ) ( OBJ-AT ?auto_4621 ?auto_4623 ) ( TRUCK-AT ?auto_4622 ?auto_4620 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4622 ?auto_4620 ?auto_4623 ?auto_4624 )
      ( !LOAD-TRUCK ?auto_4621 ?auto_4622 ?auto_4623 )
      ( !DRIVE-TRUCK ?auto_4622 ?auto_4623 ?auto_4620 ?auto_4624 )
      ( !UNLOAD-TRUCK ?auto_4621 ?auto_4622 ?auto_4620 )
      ( DELIVER-1PKG-VERIFY ?auto_4621 ?auto_4620 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4642 - OBJ
      ?auto_4643 - OBJ
      ?auto_4641 - LOCATION
    )
    :vars
    (
      ?auto_4646 - LOCATION
      ?auto_4644 - CITY
      ?auto_4645 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4646 ?auto_4644 ) ( IN-CITY ?auto_4641 ?auto_4644 ) ( not ( = ?auto_4641 ?auto_4646 ) ) ( OBJ-AT ?auto_4643 ?auto_4646 ) ( OBJ-AT ?auto_4642 ?auto_4646 ) ( TRUCK-AT ?auto_4645 ?auto_4641 ) ( not ( = ?auto_4642 ?auto_4643 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4642 ?auto_4641 )
      ( DELIVER-1PKG ?auto_4643 ?auto_4641 )
      ( DELIVER-2PKG-VERIFY ?auto_4642 ?auto_4643 ?auto_4641 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4750 - OBJ
      ?auto_4751 - OBJ
      ?auto_4752 - OBJ
      ?auto_4749 - LOCATION
    )
    :vars
    (
      ?auto_4755 - LOCATION
      ?auto_4754 - CITY
      ?auto_4756 - LOCATION
      ?auto_4753 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4755 ?auto_4754 ) ( IN-CITY ?auto_4749 ?auto_4754 ) ( not ( = ?auto_4749 ?auto_4755 ) ) ( OBJ-AT ?auto_4752 ?auto_4755 ) ( IN-CITY ?auto_4756 ?auto_4754 ) ( not ( = ?auto_4749 ?auto_4756 ) ) ( OBJ-AT ?auto_4751 ?auto_4756 ) ( OBJ-AT ?auto_4750 ?auto_4756 ) ( TRUCK-AT ?auto_4753 ?auto_4749 ) ( not ( = ?auto_4750 ?auto_4751 ) ) ( not ( = ?auto_4750 ?auto_4752 ) ) ( not ( = ?auto_4751 ?auto_4752 ) ) ( not ( = ?auto_4755 ?auto_4756 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4750 ?auto_4751 ?auto_4749 )
      ( DELIVER-1PKG ?auto_4752 ?auto_4749 )
      ( DELIVER-3PKG-VERIFY ?auto_4750 ?auto_4751 ?auto_4752 ?auto_4749 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4767 - OBJ
      ?auto_4768 - OBJ
      ?auto_4769 - OBJ
      ?auto_4766 - LOCATION
    )
    :vars
    (
      ?auto_4770 - LOCATION
      ?auto_4773 - CITY
      ?auto_4771 - LOCATION
      ?auto_4772 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4770 ?auto_4773 ) ( IN-CITY ?auto_4766 ?auto_4773 ) ( not ( = ?auto_4766 ?auto_4770 ) ) ( OBJ-AT ?auto_4768 ?auto_4770 ) ( IN-CITY ?auto_4771 ?auto_4773 ) ( not ( = ?auto_4766 ?auto_4771 ) ) ( OBJ-AT ?auto_4769 ?auto_4771 ) ( OBJ-AT ?auto_4767 ?auto_4771 ) ( TRUCK-AT ?auto_4772 ?auto_4766 ) ( not ( = ?auto_4767 ?auto_4769 ) ) ( not ( = ?auto_4767 ?auto_4768 ) ) ( not ( = ?auto_4769 ?auto_4768 ) ) ( not ( = ?auto_4770 ?auto_4771 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4767 ?auto_4769 ?auto_4768 ?auto_4766 )
      ( DELIVER-3PKG-VERIFY ?auto_4767 ?auto_4768 ?auto_4769 ?auto_4766 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4828 - OBJ
      ?auto_4829 - OBJ
      ?auto_4830 - OBJ
      ?auto_4827 - LOCATION
    )
    :vars
    (
      ?auto_4832 - LOCATION
      ?auto_4834 - CITY
      ?auto_4833 - LOCATION
      ?auto_4831 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4832 ?auto_4834 ) ( IN-CITY ?auto_4827 ?auto_4834 ) ( not ( = ?auto_4827 ?auto_4832 ) ) ( OBJ-AT ?auto_4828 ?auto_4832 ) ( IN-CITY ?auto_4833 ?auto_4834 ) ( not ( = ?auto_4827 ?auto_4833 ) ) ( OBJ-AT ?auto_4830 ?auto_4833 ) ( OBJ-AT ?auto_4829 ?auto_4833 ) ( TRUCK-AT ?auto_4831 ?auto_4827 ) ( not ( = ?auto_4829 ?auto_4830 ) ) ( not ( = ?auto_4829 ?auto_4828 ) ) ( not ( = ?auto_4830 ?auto_4828 ) ) ( not ( = ?auto_4832 ?auto_4833 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4829 ?auto_4828 ?auto_4830 ?auto_4827 )
      ( DELIVER-3PKG-VERIFY ?auto_4828 ?auto_4829 ?auto_4830 ?auto_4827 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5870 - OBJ
      ?auto_5871 - OBJ
      ?auto_5872 - OBJ
      ?auto_5873 - OBJ
      ?auto_5869 - LOCATION
    )
    :vars
    (
      ?auto_5874 - LOCATION
      ?auto_5875 - CITY
      ?auto_5877 - LOCATION
      ?auto_5876 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5874 ?auto_5875 ) ( IN-CITY ?auto_5869 ?auto_5875 ) ( not ( = ?auto_5869 ?auto_5874 ) ) ( OBJ-AT ?auto_5873 ?auto_5874 ) ( IN-CITY ?auto_5877 ?auto_5875 ) ( not ( = ?auto_5869 ?auto_5877 ) ) ( OBJ-AT ?auto_5872 ?auto_5877 ) ( OBJ-AT ?auto_5871 ?auto_5874 ) ( OBJ-AT ?auto_5870 ?auto_5874 ) ( TRUCK-AT ?auto_5876 ?auto_5869 ) ( not ( = ?auto_5870 ?auto_5871 ) ) ( not ( = ?auto_5870 ?auto_5872 ) ) ( not ( = ?auto_5871 ?auto_5872 ) ) ( not ( = ?auto_5877 ?auto_5874 ) ) ( not ( = ?auto_5870 ?auto_5873 ) ) ( not ( = ?auto_5871 ?auto_5873 ) ) ( not ( = ?auto_5872 ?auto_5873 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5870 ?auto_5872 ?auto_5871 ?auto_5869 )
      ( DELIVER-1PKG ?auto_5873 ?auto_5869 )
      ( DELIVER-4PKG-VERIFY ?auto_5870 ?auto_5871 ?auto_5872 ?auto_5873 ?auto_5869 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5899 - OBJ
      ?auto_5900 - OBJ
      ?auto_5901 - OBJ
      ?auto_5902 - OBJ
      ?auto_5898 - LOCATION
    )
    :vars
    (
      ?auto_5905 - LOCATION
      ?auto_5903 - CITY
      ?auto_5906 - LOCATION
      ?auto_5904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5905 ?auto_5903 ) ( IN-CITY ?auto_5898 ?auto_5903 ) ( not ( = ?auto_5898 ?auto_5905 ) ) ( OBJ-AT ?auto_5901 ?auto_5905 ) ( IN-CITY ?auto_5906 ?auto_5903 ) ( not ( = ?auto_5898 ?auto_5906 ) ) ( OBJ-AT ?auto_5902 ?auto_5906 ) ( OBJ-AT ?auto_5900 ?auto_5905 ) ( OBJ-AT ?auto_5899 ?auto_5905 ) ( TRUCK-AT ?auto_5904 ?auto_5898 ) ( not ( = ?auto_5899 ?auto_5900 ) ) ( not ( = ?auto_5899 ?auto_5902 ) ) ( not ( = ?auto_5900 ?auto_5902 ) ) ( not ( = ?auto_5906 ?auto_5905 ) ) ( not ( = ?auto_5899 ?auto_5901 ) ) ( not ( = ?auto_5900 ?auto_5901 ) ) ( not ( = ?auto_5902 ?auto_5901 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_5899 ?auto_5900 ?auto_5902 ?auto_5901 ?auto_5898 )
      ( DELIVER-4PKG-VERIFY ?auto_5899 ?auto_5900 ?auto_5901 ?auto_5902 ?auto_5898 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5928 - OBJ
      ?auto_5929 - OBJ
      ?auto_5930 - OBJ
      ?auto_5931 - OBJ
      ?auto_5927 - LOCATION
    )
    :vars
    (
      ?auto_5935 - LOCATION
      ?auto_5932 - CITY
      ?auto_5933 - LOCATION
      ?auto_5934 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5935 ?auto_5932 ) ( IN-CITY ?auto_5927 ?auto_5932 ) ( not ( = ?auto_5927 ?auto_5935 ) ) ( OBJ-AT ?auto_5931 ?auto_5935 ) ( IN-CITY ?auto_5933 ?auto_5932 ) ( not ( = ?auto_5927 ?auto_5933 ) ) ( OBJ-AT ?auto_5929 ?auto_5933 ) ( OBJ-AT ?auto_5930 ?auto_5935 ) ( OBJ-AT ?auto_5928 ?auto_5935 ) ( TRUCK-AT ?auto_5934 ?auto_5927 ) ( not ( = ?auto_5928 ?auto_5930 ) ) ( not ( = ?auto_5928 ?auto_5929 ) ) ( not ( = ?auto_5930 ?auto_5929 ) ) ( not ( = ?auto_5933 ?auto_5935 ) ) ( not ( = ?auto_5928 ?auto_5931 ) ) ( not ( = ?auto_5930 ?auto_5931 ) ) ( not ( = ?auto_5929 ?auto_5931 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_5928 ?auto_5930 ?auto_5931 ?auto_5929 ?auto_5927 )
      ( DELIVER-4PKG-VERIFY ?auto_5928 ?auto_5929 ?auto_5930 ?auto_5931 ?auto_5927 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6493 - OBJ
      ?auto_6494 - OBJ
      ?auto_6495 - OBJ
      ?auto_6496 - OBJ
      ?auto_6492 - LOCATION
    )
    :vars
    (
      ?auto_6500 - LOCATION
      ?auto_6497 - CITY
      ?auto_6498 - LOCATION
      ?auto_6499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6500 ?auto_6497 ) ( IN-CITY ?auto_6492 ?auto_6497 ) ( not ( = ?auto_6492 ?auto_6500 ) ) ( OBJ-AT ?auto_6496 ?auto_6500 ) ( IN-CITY ?auto_6498 ?auto_6497 ) ( not ( = ?auto_6492 ?auto_6498 ) ) ( OBJ-AT ?auto_6493 ?auto_6498 ) ( OBJ-AT ?auto_6495 ?auto_6500 ) ( OBJ-AT ?auto_6494 ?auto_6500 ) ( TRUCK-AT ?auto_6499 ?auto_6492 ) ( not ( = ?auto_6494 ?auto_6495 ) ) ( not ( = ?auto_6494 ?auto_6493 ) ) ( not ( = ?auto_6495 ?auto_6493 ) ) ( not ( = ?auto_6498 ?auto_6500 ) ) ( not ( = ?auto_6494 ?auto_6496 ) ) ( not ( = ?auto_6495 ?auto_6496 ) ) ( not ( = ?auto_6493 ?auto_6496 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6494 ?auto_6495 ?auto_6496 ?auto_6493 ?auto_6492 )
      ( DELIVER-4PKG-VERIFY ?auto_6493 ?auto_6494 ?auto_6495 ?auto_6496 ?auto_6492 ) )
  )

)

