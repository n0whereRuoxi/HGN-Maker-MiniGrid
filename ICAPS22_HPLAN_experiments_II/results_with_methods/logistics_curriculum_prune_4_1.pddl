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
      ?auto_4599 - OBJ
      ?auto_4598 - LOCATION
    )
    :vars
    (
      ?auto_4601 - LOCATION
      ?auto_4602 - CITY
      ?auto_4600 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4601 ?auto_4602 ) ( IN-CITY ?auto_4598 ?auto_4602 ) ( not ( = ?auto_4598 ?auto_4601 ) ) ( OBJ-AT ?auto_4599 ?auto_4601 ) ( TRUCK-AT ?auto_4600 ?auto_4598 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4600 ?auto_4598 ?auto_4601 ?auto_4602 )
      ( !LOAD-TRUCK ?auto_4599 ?auto_4600 ?auto_4601 )
      ( !DRIVE-TRUCK ?auto_4600 ?auto_4601 ?auto_4598 ?auto_4602 )
      ( !UNLOAD-TRUCK ?auto_4599 ?auto_4600 ?auto_4598 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4620 - OBJ
      ?auto_4621 - OBJ
      ?auto_4619 - LOCATION
    )
    :vars
    (
      ?auto_4623 - LOCATION
      ?auto_4624 - CITY
      ?auto_4622 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4623 ?auto_4624 ) ( IN-CITY ?auto_4619 ?auto_4624 ) ( not ( = ?auto_4619 ?auto_4623 ) ) ( OBJ-AT ?auto_4621 ?auto_4623 ) ( OBJ-AT ?auto_4620 ?auto_4623 ) ( TRUCK-AT ?auto_4622 ?auto_4619 ) ( not ( = ?auto_4620 ?auto_4621 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4620 ?auto_4619 )
      ( DELIVER-1PKG ?auto_4621 ?auto_4619 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4728 - OBJ
      ?auto_4729 - OBJ
      ?auto_4730 - OBJ
      ?auto_4727 - LOCATION
    )
    :vars
    (
      ?auto_4733 - LOCATION
      ?auto_4731 - CITY
      ?auto_4734 - LOCATION
      ?auto_4732 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4733 ?auto_4731 ) ( IN-CITY ?auto_4727 ?auto_4731 ) ( not ( = ?auto_4727 ?auto_4733 ) ) ( OBJ-AT ?auto_4730 ?auto_4733 ) ( IN-CITY ?auto_4734 ?auto_4731 ) ( not ( = ?auto_4727 ?auto_4734 ) ) ( OBJ-AT ?auto_4729 ?auto_4734 ) ( OBJ-AT ?auto_4728 ?auto_4734 ) ( TRUCK-AT ?auto_4732 ?auto_4727 ) ( not ( = ?auto_4728 ?auto_4729 ) ) ( not ( = ?auto_4728 ?auto_4730 ) ) ( not ( = ?auto_4729 ?auto_4730 ) ) ( not ( = ?auto_4733 ?auto_4734 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4728 ?auto_4729 ?auto_4727 )
      ( DELIVER-1PKG ?auto_4730 ?auto_4727 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4745 - OBJ
      ?auto_4746 - OBJ
      ?auto_4747 - OBJ
      ?auto_4744 - LOCATION
    )
    :vars
    (
      ?auto_4748 - LOCATION
      ?auto_4751 - CITY
      ?auto_4750 - LOCATION
      ?auto_4749 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4748 ?auto_4751 ) ( IN-CITY ?auto_4744 ?auto_4751 ) ( not ( = ?auto_4744 ?auto_4748 ) ) ( OBJ-AT ?auto_4746 ?auto_4748 ) ( IN-CITY ?auto_4750 ?auto_4751 ) ( not ( = ?auto_4744 ?auto_4750 ) ) ( OBJ-AT ?auto_4747 ?auto_4750 ) ( OBJ-AT ?auto_4745 ?auto_4750 ) ( TRUCK-AT ?auto_4749 ?auto_4744 ) ( not ( = ?auto_4745 ?auto_4747 ) ) ( not ( = ?auto_4745 ?auto_4746 ) ) ( not ( = ?auto_4747 ?auto_4746 ) ) ( not ( = ?auto_4748 ?auto_4750 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4745 ?auto_4747 ?auto_4746 ?auto_4744 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4806 - OBJ
      ?auto_4807 - OBJ
      ?auto_4808 - OBJ
      ?auto_4805 - LOCATION
    )
    :vars
    (
      ?auto_4809 - LOCATION
      ?auto_4812 - CITY
      ?auto_4811 - LOCATION
      ?auto_4810 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4809 ?auto_4812 ) ( IN-CITY ?auto_4805 ?auto_4812 ) ( not ( = ?auto_4805 ?auto_4809 ) ) ( OBJ-AT ?auto_4806 ?auto_4809 ) ( IN-CITY ?auto_4811 ?auto_4812 ) ( not ( = ?auto_4805 ?auto_4811 ) ) ( OBJ-AT ?auto_4808 ?auto_4811 ) ( OBJ-AT ?auto_4807 ?auto_4811 ) ( TRUCK-AT ?auto_4810 ?auto_4805 ) ( not ( = ?auto_4807 ?auto_4808 ) ) ( not ( = ?auto_4807 ?auto_4806 ) ) ( not ( = ?auto_4808 ?auto_4806 ) ) ( not ( = ?auto_4809 ?auto_4811 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4807 ?auto_4806 ?auto_4808 ?auto_4805 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5857 - OBJ
      ?auto_5858 - OBJ
      ?auto_5859 - OBJ
      ?auto_5860 - OBJ
      ?auto_5856 - LOCATION
    )
    :vars
    (
      ?auto_5863 - LOCATION
      ?auto_5862 - CITY
      ?auto_5864 - LOCATION
      ?auto_5865 - LOCATION
      ?auto_5861 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5863 ?auto_5862 ) ( IN-CITY ?auto_5856 ?auto_5862 ) ( not ( = ?auto_5856 ?auto_5863 ) ) ( OBJ-AT ?auto_5860 ?auto_5863 ) ( IN-CITY ?auto_5864 ?auto_5862 ) ( not ( = ?auto_5856 ?auto_5864 ) ) ( OBJ-AT ?auto_5859 ?auto_5864 ) ( IN-CITY ?auto_5865 ?auto_5862 ) ( not ( = ?auto_5856 ?auto_5865 ) ) ( OBJ-AT ?auto_5858 ?auto_5865 ) ( OBJ-AT ?auto_5857 ?auto_5865 ) ( TRUCK-AT ?auto_5861 ?auto_5856 ) ( not ( = ?auto_5857 ?auto_5858 ) ) ( not ( = ?auto_5857 ?auto_5859 ) ) ( not ( = ?auto_5858 ?auto_5859 ) ) ( not ( = ?auto_5864 ?auto_5865 ) ) ( not ( = ?auto_5857 ?auto_5860 ) ) ( not ( = ?auto_5858 ?auto_5860 ) ) ( not ( = ?auto_5859 ?auto_5860 ) ) ( not ( = ?auto_5863 ?auto_5864 ) ) ( not ( = ?auto_5863 ?auto_5865 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5857 ?auto_5859 ?auto_5858 ?auto_5856 )
      ( DELIVER-1PKG ?auto_5860 ?auto_5856 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5916 - OBJ
      ?auto_5917 - OBJ
      ?auto_5918 - OBJ
      ?auto_5919 - OBJ
      ?auto_5915 - LOCATION
    )
    :vars
    (
      ?auto_5922 - LOCATION
      ?auto_5924 - CITY
      ?auto_5920 - LOCATION
      ?auto_5921 - LOCATION
      ?auto_5923 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5922 ?auto_5924 ) ( IN-CITY ?auto_5915 ?auto_5924 ) ( not ( = ?auto_5915 ?auto_5922 ) ) ( OBJ-AT ?auto_5919 ?auto_5922 ) ( IN-CITY ?auto_5920 ?auto_5924 ) ( not ( = ?auto_5915 ?auto_5920 ) ) ( OBJ-AT ?auto_5917 ?auto_5920 ) ( IN-CITY ?auto_5921 ?auto_5924 ) ( not ( = ?auto_5915 ?auto_5921 ) ) ( OBJ-AT ?auto_5918 ?auto_5921 ) ( OBJ-AT ?auto_5916 ?auto_5921 ) ( TRUCK-AT ?auto_5923 ?auto_5915 ) ( not ( = ?auto_5916 ?auto_5918 ) ) ( not ( = ?auto_5916 ?auto_5917 ) ) ( not ( = ?auto_5918 ?auto_5917 ) ) ( not ( = ?auto_5920 ?auto_5921 ) ) ( not ( = ?auto_5916 ?auto_5919 ) ) ( not ( = ?auto_5918 ?auto_5919 ) ) ( not ( = ?auto_5917 ?auto_5919 ) ) ( not ( = ?auto_5922 ?auto_5920 ) ) ( not ( = ?auto_5922 ?auto_5921 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_5916 ?auto_5918 ?auto_5917 ?auto_5919 ?auto_5915 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5948 - OBJ
      ?auto_5949 - OBJ
      ?auto_5950 - OBJ
      ?auto_5951 - OBJ
      ?auto_5947 - LOCATION
    )
    :vars
    (
      ?auto_5953 - LOCATION
      ?auto_5954 - CITY
      ?auto_5956 - LOCATION
      ?auto_5955 - LOCATION
      ?auto_5952 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5953 ?auto_5954 ) ( IN-CITY ?auto_5947 ?auto_5954 ) ( not ( = ?auto_5947 ?auto_5953 ) ) ( OBJ-AT ?auto_5950 ?auto_5953 ) ( IN-CITY ?auto_5956 ?auto_5954 ) ( not ( = ?auto_5947 ?auto_5956 ) ) ( OBJ-AT ?auto_5949 ?auto_5956 ) ( IN-CITY ?auto_5955 ?auto_5954 ) ( not ( = ?auto_5947 ?auto_5955 ) ) ( OBJ-AT ?auto_5951 ?auto_5955 ) ( OBJ-AT ?auto_5948 ?auto_5955 ) ( TRUCK-AT ?auto_5952 ?auto_5947 ) ( not ( = ?auto_5948 ?auto_5951 ) ) ( not ( = ?auto_5948 ?auto_5949 ) ) ( not ( = ?auto_5951 ?auto_5949 ) ) ( not ( = ?auto_5956 ?auto_5955 ) ) ( not ( = ?auto_5948 ?auto_5950 ) ) ( not ( = ?auto_5951 ?auto_5950 ) ) ( not ( = ?auto_5949 ?auto_5950 ) ) ( not ( = ?auto_5953 ?auto_5956 ) ) ( not ( = ?auto_5953 ?auto_5955 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_5948 ?auto_5949 ?auto_5951 ?auto_5950 ?auto_5947 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6537 - OBJ
      ?auto_6538 - OBJ
      ?auto_6539 - OBJ
      ?auto_6540 - OBJ
      ?auto_6536 - LOCATION
    )
    :vars
    (
      ?auto_6542 - LOCATION
      ?auto_6543 - CITY
      ?auto_6545 - LOCATION
      ?auto_6544 - LOCATION
      ?auto_6541 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6542 ?auto_6543 ) ( IN-CITY ?auto_6536 ?auto_6543 ) ( not ( = ?auto_6536 ?auto_6542 ) ) ( OBJ-AT ?auto_6540 ?auto_6542 ) ( IN-CITY ?auto_6545 ?auto_6543 ) ( not ( = ?auto_6536 ?auto_6545 ) ) ( OBJ-AT ?auto_6537 ?auto_6545 ) ( IN-CITY ?auto_6544 ?auto_6543 ) ( not ( = ?auto_6536 ?auto_6544 ) ) ( OBJ-AT ?auto_6539 ?auto_6544 ) ( OBJ-AT ?auto_6538 ?auto_6544 ) ( TRUCK-AT ?auto_6541 ?auto_6536 ) ( not ( = ?auto_6538 ?auto_6539 ) ) ( not ( = ?auto_6538 ?auto_6537 ) ) ( not ( = ?auto_6539 ?auto_6537 ) ) ( not ( = ?auto_6545 ?auto_6544 ) ) ( not ( = ?auto_6538 ?auto_6540 ) ) ( not ( = ?auto_6539 ?auto_6540 ) ) ( not ( = ?auto_6537 ?auto_6540 ) ) ( not ( = ?auto_6542 ?auto_6545 ) ) ( not ( = ?auto_6542 ?auto_6544 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6538 ?auto_6537 ?auto_6539 ?auto_6540 ?auto_6536 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6569 - OBJ
      ?auto_6570 - OBJ
      ?auto_6571 - OBJ
      ?auto_6572 - OBJ
      ?auto_6568 - LOCATION
    )
    :vars
    (
      ?auto_6574 - LOCATION
      ?auto_6575 - CITY
      ?auto_6577 - LOCATION
      ?auto_6576 - LOCATION
      ?auto_6573 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6574 ?auto_6575 ) ( IN-CITY ?auto_6568 ?auto_6575 ) ( not ( = ?auto_6568 ?auto_6574 ) ) ( OBJ-AT ?auto_6571 ?auto_6574 ) ( IN-CITY ?auto_6577 ?auto_6575 ) ( not ( = ?auto_6568 ?auto_6577 ) ) ( OBJ-AT ?auto_6569 ?auto_6577 ) ( IN-CITY ?auto_6576 ?auto_6575 ) ( not ( = ?auto_6568 ?auto_6576 ) ) ( OBJ-AT ?auto_6572 ?auto_6576 ) ( OBJ-AT ?auto_6570 ?auto_6576 ) ( TRUCK-AT ?auto_6573 ?auto_6568 ) ( not ( = ?auto_6570 ?auto_6572 ) ) ( not ( = ?auto_6570 ?auto_6569 ) ) ( not ( = ?auto_6572 ?auto_6569 ) ) ( not ( = ?auto_6577 ?auto_6576 ) ) ( not ( = ?auto_6570 ?auto_6571 ) ) ( not ( = ?auto_6572 ?auto_6571 ) ) ( not ( = ?auto_6569 ?auto_6571 ) ) ( not ( = ?auto_6574 ?auto_6577 ) ) ( not ( = ?auto_6574 ?auto_6576 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6570 ?auto_6569 ?auto_6572 ?auto_6571 ?auto_6568 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6757 - OBJ
      ?auto_6758 - OBJ
      ?auto_6759 - OBJ
      ?auto_6760 - OBJ
      ?auto_6756 - LOCATION
    )
    :vars
    (
      ?auto_6762 - LOCATION
      ?auto_6763 - CITY
      ?auto_6765 - LOCATION
      ?auto_6764 - LOCATION
      ?auto_6761 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6762 ?auto_6763 ) ( IN-CITY ?auto_6756 ?auto_6763 ) ( not ( = ?auto_6756 ?auto_6762 ) ) ( OBJ-AT ?auto_6758 ?auto_6762 ) ( IN-CITY ?auto_6765 ?auto_6763 ) ( not ( = ?auto_6756 ?auto_6765 ) ) ( OBJ-AT ?auto_6757 ?auto_6765 ) ( IN-CITY ?auto_6764 ?auto_6763 ) ( not ( = ?auto_6756 ?auto_6764 ) ) ( OBJ-AT ?auto_6760 ?auto_6764 ) ( OBJ-AT ?auto_6759 ?auto_6764 ) ( TRUCK-AT ?auto_6761 ?auto_6756 ) ( not ( = ?auto_6759 ?auto_6760 ) ) ( not ( = ?auto_6759 ?auto_6757 ) ) ( not ( = ?auto_6760 ?auto_6757 ) ) ( not ( = ?auto_6765 ?auto_6764 ) ) ( not ( = ?auto_6759 ?auto_6758 ) ) ( not ( = ?auto_6760 ?auto_6758 ) ) ( not ( = ?auto_6757 ?auto_6758 ) ) ( not ( = ?auto_6762 ?auto_6765 ) ) ( not ( = ?auto_6762 ?auto_6764 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6759 ?auto_6757 ?auto_6760 ?auto_6758 ?auto_6756 ) )
  )

)

