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
      ?auto_9489 - OBJ
      ?auto_9488 - LOCATION
    )
    :vars
    (
      ?auto_9490 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9490 ?auto_9488 ) ( IN-TRUCK ?auto_9489 ?auto_9490 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_9489 ?auto_9490 ?auto_9488 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9501 - OBJ
      ?auto_9500 - LOCATION
    )
    :vars
    (
      ?auto_9502 - TRUCK
      ?auto_9503 - LOCATION
      ?auto_9504 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9501 ?auto_9502 ) ( TRUCK-AT ?auto_9502 ?auto_9503 ) ( IN-CITY ?auto_9503 ?auto_9504 ) ( IN-CITY ?auto_9500 ?auto_9504 ) ( not ( = ?auto_9500 ?auto_9503 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9502 ?auto_9503 ?auto_9500 ?auto_9504 )
      ( DELIVER-1PKG ?auto_9501 ?auto_9500 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9519 - OBJ
      ?auto_9518 - LOCATION
    )
    :vars
    (
      ?auto_9520 - TRUCK
      ?auto_9522 - LOCATION
      ?auto_9521 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9520 ?auto_9522 ) ( IN-CITY ?auto_9522 ?auto_9521 ) ( IN-CITY ?auto_9518 ?auto_9521 ) ( not ( = ?auto_9518 ?auto_9522 ) ) ( OBJ-AT ?auto_9519 ?auto_9522 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9519 ?auto_9520 ?auto_9522 )
      ( DELIVER-1PKG ?auto_9519 ?auto_9518 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9537 - OBJ
      ?auto_9536 - LOCATION
    )
    :vars
    (
      ?auto_9538 - LOCATION
      ?auto_9539 - CITY
      ?auto_9540 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9538 ?auto_9539 ) ( IN-CITY ?auto_9536 ?auto_9539 ) ( not ( = ?auto_9536 ?auto_9538 ) ) ( OBJ-AT ?auto_9537 ?auto_9538 ) ( TRUCK-AT ?auto_9540 ?auto_9536 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9540 ?auto_9536 ?auto_9538 ?auto_9539 )
      ( DELIVER-1PKG ?auto_9537 ?auto_9536 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9597 - OBJ
      ?auto_9598 - OBJ
      ?auto_9596 - LOCATION
    )
    :vars
    (
      ?auto_9599 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9599 ?auto_9596 ) ( IN-TRUCK ?auto_9598 ?auto_9599 ) ( OBJ-AT ?auto_9597 ?auto_9596 ) ( not ( = ?auto_9597 ?auto_9598 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9598 ?auto_9596 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9601 - OBJ
      ?auto_9602 - OBJ
      ?auto_9600 - LOCATION
    )
    :vars
    (
      ?auto_9603 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9603 ?auto_9600 ) ( IN-TRUCK ?auto_9601 ?auto_9603 ) ( OBJ-AT ?auto_9602 ?auto_9600 ) ( not ( = ?auto_9601 ?auto_9602 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9601 ?auto_9600 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9609 - OBJ
      ?auto_9610 - OBJ
      ?auto_9611 - OBJ
      ?auto_9608 - LOCATION
    )
    :vars
    (
      ?auto_9612 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9612 ?auto_9608 ) ( IN-TRUCK ?auto_9611 ?auto_9612 ) ( OBJ-AT ?auto_9609 ?auto_9608 ) ( OBJ-AT ?auto_9610 ?auto_9608 ) ( not ( = ?auto_9609 ?auto_9610 ) ) ( not ( = ?auto_9609 ?auto_9611 ) ) ( not ( = ?auto_9610 ?auto_9611 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9611 ?auto_9608 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9614 - OBJ
      ?auto_9615 - OBJ
      ?auto_9616 - OBJ
      ?auto_9613 - LOCATION
    )
    :vars
    (
      ?auto_9617 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9617 ?auto_9613 ) ( IN-TRUCK ?auto_9615 ?auto_9617 ) ( OBJ-AT ?auto_9614 ?auto_9613 ) ( OBJ-AT ?auto_9616 ?auto_9613 ) ( not ( = ?auto_9614 ?auto_9615 ) ) ( not ( = ?auto_9614 ?auto_9616 ) ) ( not ( = ?auto_9615 ?auto_9616 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9615 ?auto_9613 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9624 - OBJ
      ?auto_9625 - OBJ
      ?auto_9626 - OBJ
      ?auto_9623 - LOCATION
    )
    :vars
    (
      ?auto_9627 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9627 ?auto_9623 ) ( IN-TRUCK ?auto_9624 ?auto_9627 ) ( OBJ-AT ?auto_9625 ?auto_9623 ) ( OBJ-AT ?auto_9626 ?auto_9623 ) ( not ( = ?auto_9624 ?auto_9625 ) ) ( not ( = ?auto_9624 ?auto_9626 ) ) ( not ( = ?auto_9625 ?auto_9626 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9624 ?auto_9623 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9649 - OBJ
      ?auto_9650 - OBJ
      ?auto_9648 - LOCATION
    )
    :vars
    (
      ?auto_9653 - TRUCK
      ?auto_9652 - LOCATION
      ?auto_9651 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9650 ?auto_9653 ) ( TRUCK-AT ?auto_9653 ?auto_9652 ) ( IN-CITY ?auto_9652 ?auto_9651 ) ( IN-CITY ?auto_9648 ?auto_9651 ) ( not ( = ?auto_9648 ?auto_9652 ) ) ( OBJ-AT ?auto_9649 ?auto_9648 ) ( not ( = ?auto_9649 ?auto_9650 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9650 ?auto_9648 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9655 - OBJ
      ?auto_9656 - OBJ
      ?auto_9654 - LOCATION
    )
    :vars
    (
      ?auto_9658 - TRUCK
      ?auto_9657 - LOCATION
      ?auto_9659 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9655 ?auto_9658 ) ( TRUCK-AT ?auto_9658 ?auto_9657 ) ( IN-CITY ?auto_9657 ?auto_9659 ) ( IN-CITY ?auto_9654 ?auto_9659 ) ( not ( = ?auto_9654 ?auto_9657 ) ) ( OBJ-AT ?auto_9656 ?auto_9654 ) ( not ( = ?auto_9656 ?auto_9655 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9656 ?auto_9655 ?auto_9654 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9668 - OBJ
      ?auto_9669 - OBJ
      ?auto_9670 - OBJ
      ?auto_9667 - LOCATION
    )
    :vars
    (
      ?auto_9672 - TRUCK
      ?auto_9671 - LOCATION
      ?auto_9673 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9670 ?auto_9672 ) ( TRUCK-AT ?auto_9672 ?auto_9671 ) ( IN-CITY ?auto_9671 ?auto_9673 ) ( IN-CITY ?auto_9667 ?auto_9673 ) ( not ( = ?auto_9667 ?auto_9671 ) ) ( OBJ-AT ?auto_9669 ?auto_9667 ) ( not ( = ?auto_9669 ?auto_9670 ) ) ( OBJ-AT ?auto_9668 ?auto_9667 ) ( not ( = ?auto_9668 ?auto_9669 ) ) ( not ( = ?auto_9668 ?auto_9670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9669 ?auto_9670 ?auto_9667 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9675 - OBJ
      ?auto_9676 - OBJ
      ?auto_9677 - OBJ
      ?auto_9674 - LOCATION
    )
    :vars
    (
      ?auto_9679 - TRUCK
      ?auto_9678 - LOCATION
      ?auto_9680 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9676 ?auto_9679 ) ( TRUCK-AT ?auto_9679 ?auto_9678 ) ( IN-CITY ?auto_9678 ?auto_9680 ) ( IN-CITY ?auto_9674 ?auto_9680 ) ( not ( = ?auto_9674 ?auto_9678 ) ) ( OBJ-AT ?auto_9677 ?auto_9674 ) ( not ( = ?auto_9677 ?auto_9676 ) ) ( OBJ-AT ?auto_9675 ?auto_9674 ) ( not ( = ?auto_9675 ?auto_9676 ) ) ( not ( = ?auto_9675 ?auto_9677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9677 ?auto_9676 ?auto_9674 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9689 - OBJ
      ?auto_9690 - OBJ
      ?auto_9691 - OBJ
      ?auto_9688 - LOCATION
    )
    :vars
    (
      ?auto_9693 - TRUCK
      ?auto_9692 - LOCATION
      ?auto_9694 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9689 ?auto_9693 ) ( TRUCK-AT ?auto_9693 ?auto_9692 ) ( IN-CITY ?auto_9692 ?auto_9694 ) ( IN-CITY ?auto_9688 ?auto_9694 ) ( not ( = ?auto_9688 ?auto_9692 ) ) ( OBJ-AT ?auto_9691 ?auto_9688 ) ( not ( = ?auto_9691 ?auto_9689 ) ) ( OBJ-AT ?auto_9690 ?auto_9688 ) ( not ( = ?auto_9689 ?auto_9690 ) ) ( not ( = ?auto_9690 ?auto_9691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9691 ?auto_9689 ?auto_9688 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9718 - OBJ
      ?auto_9717 - LOCATION
    )
    :vars
    (
      ?auto_9720 - TRUCK
      ?auto_9719 - LOCATION
      ?auto_9721 - CITY
      ?auto_9722 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9720 ?auto_9719 ) ( IN-CITY ?auto_9719 ?auto_9721 ) ( IN-CITY ?auto_9717 ?auto_9721 ) ( not ( = ?auto_9717 ?auto_9719 ) ) ( OBJ-AT ?auto_9722 ?auto_9717 ) ( not ( = ?auto_9722 ?auto_9718 ) ) ( OBJ-AT ?auto_9718 ?auto_9719 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9718 ?auto_9720 ?auto_9719 )
      ( DELIVER-2PKG ?auto_9722 ?auto_9718 ?auto_9717 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9724 - OBJ
      ?auto_9725 - OBJ
      ?auto_9723 - LOCATION
    )
    :vars
    (
      ?auto_9727 - TRUCK
      ?auto_9726 - LOCATION
      ?auto_9728 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9727 ?auto_9726 ) ( IN-CITY ?auto_9726 ?auto_9728 ) ( IN-CITY ?auto_9723 ?auto_9728 ) ( not ( = ?auto_9723 ?auto_9726 ) ) ( OBJ-AT ?auto_9724 ?auto_9723 ) ( not ( = ?auto_9724 ?auto_9725 ) ) ( OBJ-AT ?auto_9725 ?auto_9726 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9725 ?auto_9723 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9730 - OBJ
      ?auto_9731 - OBJ
      ?auto_9729 - LOCATION
    )
    :vars
    (
      ?auto_9734 - TRUCK
      ?auto_9732 - LOCATION
      ?auto_9733 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9734 ?auto_9732 ) ( IN-CITY ?auto_9732 ?auto_9733 ) ( IN-CITY ?auto_9729 ?auto_9733 ) ( not ( = ?auto_9729 ?auto_9732 ) ) ( OBJ-AT ?auto_9731 ?auto_9729 ) ( not ( = ?auto_9731 ?auto_9730 ) ) ( OBJ-AT ?auto_9730 ?auto_9732 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9731 ?auto_9730 ?auto_9729 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9743 - OBJ
      ?auto_9744 - OBJ
      ?auto_9745 - OBJ
      ?auto_9742 - LOCATION
    )
    :vars
    (
      ?auto_9748 - TRUCK
      ?auto_9746 - LOCATION
      ?auto_9747 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9748 ?auto_9746 ) ( IN-CITY ?auto_9746 ?auto_9747 ) ( IN-CITY ?auto_9742 ?auto_9747 ) ( not ( = ?auto_9742 ?auto_9746 ) ) ( OBJ-AT ?auto_9744 ?auto_9742 ) ( not ( = ?auto_9744 ?auto_9745 ) ) ( OBJ-AT ?auto_9745 ?auto_9746 ) ( OBJ-AT ?auto_9743 ?auto_9742 ) ( not ( = ?auto_9743 ?auto_9744 ) ) ( not ( = ?auto_9743 ?auto_9745 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9744 ?auto_9745 ?auto_9742 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9750 - OBJ
      ?auto_9751 - OBJ
      ?auto_9752 - OBJ
      ?auto_9749 - LOCATION
    )
    :vars
    (
      ?auto_9755 - TRUCK
      ?auto_9753 - LOCATION
      ?auto_9754 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9755 ?auto_9753 ) ( IN-CITY ?auto_9753 ?auto_9754 ) ( IN-CITY ?auto_9749 ?auto_9754 ) ( not ( = ?auto_9749 ?auto_9753 ) ) ( OBJ-AT ?auto_9750 ?auto_9749 ) ( not ( = ?auto_9750 ?auto_9751 ) ) ( OBJ-AT ?auto_9751 ?auto_9753 ) ( OBJ-AT ?auto_9752 ?auto_9749 ) ( not ( = ?auto_9750 ?auto_9752 ) ) ( not ( = ?auto_9751 ?auto_9752 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9750 ?auto_9751 ?auto_9749 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9764 - OBJ
      ?auto_9765 - OBJ
      ?auto_9766 - OBJ
      ?auto_9763 - LOCATION
    )
    :vars
    (
      ?auto_9769 - TRUCK
      ?auto_9767 - LOCATION
      ?auto_9768 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9769 ?auto_9767 ) ( IN-CITY ?auto_9767 ?auto_9768 ) ( IN-CITY ?auto_9763 ?auto_9768 ) ( not ( = ?auto_9763 ?auto_9767 ) ) ( OBJ-AT ?auto_9765 ?auto_9763 ) ( not ( = ?auto_9765 ?auto_9764 ) ) ( OBJ-AT ?auto_9764 ?auto_9767 ) ( OBJ-AT ?auto_9766 ?auto_9763 ) ( not ( = ?auto_9764 ?auto_9766 ) ) ( not ( = ?auto_9765 ?auto_9766 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9765 ?auto_9764 ?auto_9763 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9793 - OBJ
      ?auto_9792 - LOCATION
    )
    :vars
    (
      ?auto_9794 - LOCATION
      ?auto_9795 - CITY
      ?auto_9796 - OBJ
      ?auto_9797 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9794 ?auto_9795 ) ( IN-CITY ?auto_9792 ?auto_9795 ) ( not ( = ?auto_9792 ?auto_9794 ) ) ( OBJ-AT ?auto_9796 ?auto_9792 ) ( not ( = ?auto_9796 ?auto_9793 ) ) ( OBJ-AT ?auto_9793 ?auto_9794 ) ( TRUCK-AT ?auto_9797 ?auto_9792 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9797 ?auto_9792 ?auto_9794 ?auto_9795 )
      ( DELIVER-2PKG ?auto_9796 ?auto_9793 ?auto_9792 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9799 - OBJ
      ?auto_9800 - OBJ
      ?auto_9798 - LOCATION
    )
    :vars
    (
      ?auto_9801 - LOCATION
      ?auto_9803 - CITY
      ?auto_9802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9801 ?auto_9803 ) ( IN-CITY ?auto_9798 ?auto_9803 ) ( not ( = ?auto_9798 ?auto_9801 ) ) ( OBJ-AT ?auto_9799 ?auto_9798 ) ( not ( = ?auto_9799 ?auto_9800 ) ) ( OBJ-AT ?auto_9800 ?auto_9801 ) ( TRUCK-AT ?auto_9802 ?auto_9798 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9800 ?auto_9798 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9805 - OBJ
      ?auto_9806 - OBJ
      ?auto_9804 - LOCATION
    )
    :vars
    (
      ?auto_9809 - LOCATION
      ?auto_9808 - CITY
      ?auto_9807 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9809 ?auto_9808 ) ( IN-CITY ?auto_9804 ?auto_9808 ) ( not ( = ?auto_9804 ?auto_9809 ) ) ( OBJ-AT ?auto_9806 ?auto_9804 ) ( not ( = ?auto_9806 ?auto_9805 ) ) ( OBJ-AT ?auto_9805 ?auto_9809 ) ( TRUCK-AT ?auto_9807 ?auto_9804 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9806 ?auto_9805 ?auto_9804 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9818 - OBJ
      ?auto_9819 - OBJ
      ?auto_9820 - OBJ
      ?auto_9817 - LOCATION
    )
    :vars
    (
      ?auto_9823 - LOCATION
      ?auto_9822 - CITY
      ?auto_9821 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9823 ?auto_9822 ) ( IN-CITY ?auto_9817 ?auto_9822 ) ( not ( = ?auto_9817 ?auto_9823 ) ) ( OBJ-AT ?auto_9818 ?auto_9817 ) ( not ( = ?auto_9818 ?auto_9820 ) ) ( OBJ-AT ?auto_9820 ?auto_9823 ) ( TRUCK-AT ?auto_9821 ?auto_9817 ) ( OBJ-AT ?auto_9819 ?auto_9817 ) ( not ( = ?auto_9818 ?auto_9819 ) ) ( not ( = ?auto_9819 ?auto_9820 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9818 ?auto_9820 ?auto_9817 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9825 - OBJ
      ?auto_9826 - OBJ
      ?auto_9827 - OBJ
      ?auto_9824 - LOCATION
    )
    :vars
    (
      ?auto_9830 - LOCATION
      ?auto_9829 - CITY
      ?auto_9828 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9830 ?auto_9829 ) ( IN-CITY ?auto_9824 ?auto_9829 ) ( not ( = ?auto_9824 ?auto_9830 ) ) ( OBJ-AT ?auto_9827 ?auto_9824 ) ( not ( = ?auto_9827 ?auto_9826 ) ) ( OBJ-AT ?auto_9826 ?auto_9830 ) ( TRUCK-AT ?auto_9828 ?auto_9824 ) ( OBJ-AT ?auto_9825 ?auto_9824 ) ( not ( = ?auto_9825 ?auto_9826 ) ) ( not ( = ?auto_9825 ?auto_9827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9827 ?auto_9826 ?auto_9824 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9839 - OBJ
      ?auto_9840 - OBJ
      ?auto_9841 - OBJ
      ?auto_9838 - LOCATION
    )
    :vars
    (
      ?auto_9844 - LOCATION
      ?auto_9843 - CITY
      ?auto_9842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9844 ?auto_9843 ) ( IN-CITY ?auto_9838 ?auto_9843 ) ( not ( = ?auto_9838 ?auto_9844 ) ) ( OBJ-AT ?auto_9841 ?auto_9838 ) ( not ( = ?auto_9841 ?auto_9839 ) ) ( OBJ-AT ?auto_9839 ?auto_9844 ) ( TRUCK-AT ?auto_9842 ?auto_9838 ) ( OBJ-AT ?auto_9840 ?auto_9838 ) ( not ( = ?auto_9839 ?auto_9840 ) ) ( not ( = ?auto_9840 ?auto_9841 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9841 ?auto_9839 ?auto_9838 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9868 - OBJ
      ?auto_9867 - LOCATION
    )
    :vars
    (
      ?auto_9872 - LOCATION
      ?auto_9871 - CITY
      ?auto_9870 - OBJ
      ?auto_9869 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9872 ?auto_9871 ) ( IN-CITY ?auto_9867 ?auto_9871 ) ( not ( = ?auto_9867 ?auto_9872 ) ) ( not ( = ?auto_9870 ?auto_9868 ) ) ( OBJ-AT ?auto_9868 ?auto_9872 ) ( TRUCK-AT ?auto_9869 ?auto_9867 ) ( IN-TRUCK ?auto_9870 ?auto_9869 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9870 ?auto_9867 )
      ( DELIVER-2PKG ?auto_9870 ?auto_9868 ?auto_9867 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9874 - OBJ
      ?auto_9875 - OBJ
      ?auto_9873 - LOCATION
    )
    :vars
    (
      ?auto_9876 - LOCATION
      ?auto_9877 - CITY
      ?auto_9878 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9876 ?auto_9877 ) ( IN-CITY ?auto_9873 ?auto_9877 ) ( not ( = ?auto_9873 ?auto_9876 ) ) ( not ( = ?auto_9874 ?auto_9875 ) ) ( OBJ-AT ?auto_9875 ?auto_9876 ) ( TRUCK-AT ?auto_9878 ?auto_9873 ) ( IN-TRUCK ?auto_9874 ?auto_9878 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9875 ?auto_9873 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9880 - OBJ
      ?auto_9881 - OBJ
      ?auto_9879 - LOCATION
    )
    :vars
    (
      ?auto_9884 - LOCATION
      ?auto_9883 - CITY
      ?auto_9882 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9884 ?auto_9883 ) ( IN-CITY ?auto_9879 ?auto_9883 ) ( not ( = ?auto_9879 ?auto_9884 ) ) ( not ( = ?auto_9881 ?auto_9880 ) ) ( OBJ-AT ?auto_9880 ?auto_9884 ) ( TRUCK-AT ?auto_9882 ?auto_9879 ) ( IN-TRUCK ?auto_9881 ?auto_9882 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9881 ?auto_9880 ?auto_9879 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9943 - OBJ
      ?auto_9942 - LOCATION
    )
    :vars
    (
      ?auto_9946 - LOCATION
      ?auto_9945 - CITY
      ?auto_9947 - OBJ
      ?auto_9944 - TRUCK
      ?auto_9948 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9946 ?auto_9945 ) ( IN-CITY ?auto_9942 ?auto_9945 ) ( not ( = ?auto_9942 ?auto_9946 ) ) ( not ( = ?auto_9947 ?auto_9943 ) ) ( OBJ-AT ?auto_9943 ?auto_9946 ) ( IN-TRUCK ?auto_9947 ?auto_9944 ) ( TRUCK-AT ?auto_9944 ?auto_9948 ) ( IN-CITY ?auto_9948 ?auto_9945 ) ( not ( = ?auto_9942 ?auto_9948 ) ) ( not ( = ?auto_9946 ?auto_9948 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9944 ?auto_9948 ?auto_9942 ?auto_9945 )
      ( DELIVER-2PKG ?auto_9947 ?auto_9943 ?auto_9942 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9950 - OBJ
      ?auto_9951 - OBJ
      ?auto_9949 - LOCATION
    )
    :vars
    (
      ?auto_9953 - LOCATION
      ?auto_9952 - CITY
      ?auto_9954 - TRUCK
      ?auto_9955 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9953 ?auto_9952 ) ( IN-CITY ?auto_9949 ?auto_9952 ) ( not ( = ?auto_9949 ?auto_9953 ) ) ( not ( = ?auto_9950 ?auto_9951 ) ) ( OBJ-AT ?auto_9951 ?auto_9953 ) ( IN-TRUCK ?auto_9950 ?auto_9954 ) ( TRUCK-AT ?auto_9954 ?auto_9955 ) ( IN-CITY ?auto_9955 ?auto_9952 ) ( not ( = ?auto_9949 ?auto_9955 ) ) ( not ( = ?auto_9953 ?auto_9955 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9951 ?auto_9949 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9957 - OBJ
      ?auto_9958 - OBJ
      ?auto_9956 - LOCATION
    )
    :vars
    (
      ?auto_9961 - LOCATION
      ?auto_9962 - CITY
      ?auto_9960 - TRUCK
      ?auto_9959 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9961 ?auto_9962 ) ( IN-CITY ?auto_9956 ?auto_9962 ) ( not ( = ?auto_9956 ?auto_9961 ) ) ( not ( = ?auto_9958 ?auto_9957 ) ) ( OBJ-AT ?auto_9957 ?auto_9961 ) ( IN-TRUCK ?auto_9958 ?auto_9960 ) ( TRUCK-AT ?auto_9960 ?auto_9959 ) ( IN-CITY ?auto_9959 ?auto_9962 ) ( not ( = ?auto_9956 ?auto_9959 ) ) ( not ( = ?auto_9961 ?auto_9959 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9958 ?auto_9957 ?auto_9956 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10029 - OBJ
      ?auto_10028 - LOCATION
    )
    :vars
    (
      ?auto_10033 - LOCATION
      ?auto_10034 - CITY
      ?auto_10031 - OBJ
      ?auto_10032 - TRUCK
      ?auto_10030 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10033 ?auto_10034 ) ( IN-CITY ?auto_10028 ?auto_10034 ) ( not ( = ?auto_10028 ?auto_10033 ) ) ( not ( = ?auto_10031 ?auto_10029 ) ) ( OBJ-AT ?auto_10029 ?auto_10033 ) ( TRUCK-AT ?auto_10032 ?auto_10030 ) ( IN-CITY ?auto_10030 ?auto_10034 ) ( not ( = ?auto_10028 ?auto_10030 ) ) ( not ( = ?auto_10033 ?auto_10030 ) ) ( OBJ-AT ?auto_10031 ?auto_10030 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10031 ?auto_10032 ?auto_10030 )
      ( DELIVER-2PKG ?auto_10031 ?auto_10029 ?auto_10028 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10036 - OBJ
      ?auto_10037 - OBJ
      ?auto_10035 - LOCATION
    )
    :vars
    (
      ?auto_10038 - LOCATION
      ?auto_10039 - CITY
      ?auto_10040 - TRUCK
      ?auto_10041 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10038 ?auto_10039 ) ( IN-CITY ?auto_10035 ?auto_10039 ) ( not ( = ?auto_10035 ?auto_10038 ) ) ( not ( = ?auto_10036 ?auto_10037 ) ) ( OBJ-AT ?auto_10037 ?auto_10038 ) ( TRUCK-AT ?auto_10040 ?auto_10041 ) ( IN-CITY ?auto_10041 ?auto_10039 ) ( not ( = ?auto_10035 ?auto_10041 ) ) ( not ( = ?auto_10038 ?auto_10041 ) ) ( OBJ-AT ?auto_10036 ?auto_10041 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10037 ?auto_10035 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10043 - OBJ
      ?auto_10044 - OBJ
      ?auto_10042 - LOCATION
    )
    :vars
    (
      ?auto_10047 - LOCATION
      ?auto_10048 - CITY
      ?auto_10045 - TRUCK
      ?auto_10046 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10047 ?auto_10048 ) ( IN-CITY ?auto_10042 ?auto_10048 ) ( not ( = ?auto_10042 ?auto_10047 ) ) ( not ( = ?auto_10044 ?auto_10043 ) ) ( OBJ-AT ?auto_10043 ?auto_10047 ) ( TRUCK-AT ?auto_10045 ?auto_10046 ) ( IN-CITY ?auto_10046 ?auto_10048 ) ( not ( = ?auto_10042 ?auto_10046 ) ) ( not ( = ?auto_10047 ?auto_10046 ) ) ( OBJ-AT ?auto_10044 ?auto_10046 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10044 ?auto_10043 ?auto_10042 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10417 - OBJ
      ?auto_10418 - OBJ
      ?auto_10419 - OBJ
      ?auto_10416 - LOCATION
    )
    :vars
    (
      ?auto_10422 - TRUCK
      ?auto_10420 - LOCATION
      ?auto_10421 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10419 ?auto_10422 ) ( TRUCK-AT ?auto_10422 ?auto_10420 ) ( IN-CITY ?auto_10420 ?auto_10421 ) ( IN-CITY ?auto_10416 ?auto_10421 ) ( not ( = ?auto_10416 ?auto_10420 ) ) ( OBJ-AT ?auto_10417 ?auto_10416 ) ( not ( = ?auto_10417 ?auto_10419 ) ) ( OBJ-AT ?auto_10418 ?auto_10416 ) ( not ( = ?auto_10417 ?auto_10418 ) ) ( not ( = ?auto_10418 ?auto_10419 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10417 ?auto_10419 ?auto_10416 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10428 - OBJ
      ?auto_10429 - OBJ
      ?auto_10430 - OBJ
      ?auto_10427 - LOCATION
    )
    :vars
    (
      ?auto_10433 - TRUCK
      ?auto_10431 - LOCATION
      ?auto_10432 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10429 ?auto_10433 ) ( TRUCK-AT ?auto_10433 ?auto_10431 ) ( IN-CITY ?auto_10431 ?auto_10432 ) ( IN-CITY ?auto_10427 ?auto_10432 ) ( not ( = ?auto_10427 ?auto_10431 ) ) ( OBJ-AT ?auto_10428 ?auto_10427 ) ( not ( = ?auto_10428 ?auto_10429 ) ) ( OBJ-AT ?auto_10430 ?auto_10427 ) ( not ( = ?auto_10428 ?auto_10430 ) ) ( not ( = ?auto_10429 ?auto_10430 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10428 ?auto_10429 ?auto_10427 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10450 - OBJ
      ?auto_10451 - OBJ
      ?auto_10452 - OBJ
      ?auto_10449 - LOCATION
    )
    :vars
    (
      ?auto_10456 - TRUCK
      ?auto_10453 - LOCATION
      ?auto_10454 - CITY
      ?auto_10455 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10452 ?auto_10456 ) ( TRUCK-AT ?auto_10456 ?auto_10453 ) ( IN-CITY ?auto_10453 ?auto_10454 ) ( IN-CITY ?auto_10449 ?auto_10454 ) ( not ( = ?auto_10449 ?auto_10453 ) ) ( OBJ-AT ?auto_10455 ?auto_10449 ) ( not ( = ?auto_10455 ?auto_10452 ) ) ( OBJ-AT ?auto_10450 ?auto_10449 ) ( OBJ-AT ?auto_10451 ?auto_10449 ) ( not ( = ?auto_10450 ?auto_10451 ) ) ( not ( = ?auto_10450 ?auto_10452 ) ) ( not ( = ?auto_10450 ?auto_10455 ) ) ( not ( = ?auto_10451 ?auto_10452 ) ) ( not ( = ?auto_10451 ?auto_10455 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10455 ?auto_10452 ?auto_10449 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10462 - OBJ
      ?auto_10463 - OBJ
      ?auto_10464 - OBJ
      ?auto_10461 - LOCATION
    )
    :vars
    (
      ?auto_10468 - TRUCK
      ?auto_10465 - LOCATION
      ?auto_10466 - CITY
      ?auto_10467 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10463 ?auto_10468 ) ( TRUCK-AT ?auto_10468 ?auto_10465 ) ( IN-CITY ?auto_10465 ?auto_10466 ) ( IN-CITY ?auto_10461 ?auto_10466 ) ( not ( = ?auto_10461 ?auto_10465 ) ) ( OBJ-AT ?auto_10467 ?auto_10461 ) ( not ( = ?auto_10467 ?auto_10463 ) ) ( OBJ-AT ?auto_10462 ?auto_10461 ) ( OBJ-AT ?auto_10464 ?auto_10461 ) ( not ( = ?auto_10462 ?auto_10463 ) ) ( not ( = ?auto_10462 ?auto_10464 ) ) ( not ( = ?auto_10462 ?auto_10467 ) ) ( not ( = ?auto_10463 ?auto_10464 ) ) ( not ( = ?auto_10464 ?auto_10467 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10467 ?auto_10463 ?auto_10461 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10500 - OBJ
      ?auto_10501 - OBJ
      ?auto_10502 - OBJ
      ?auto_10499 - LOCATION
    )
    :vars
    (
      ?auto_10506 - TRUCK
      ?auto_10503 - LOCATION
      ?auto_10504 - CITY
      ?auto_10505 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10500 ?auto_10506 ) ( TRUCK-AT ?auto_10506 ?auto_10503 ) ( IN-CITY ?auto_10503 ?auto_10504 ) ( IN-CITY ?auto_10499 ?auto_10504 ) ( not ( = ?auto_10499 ?auto_10503 ) ) ( OBJ-AT ?auto_10505 ?auto_10499 ) ( not ( = ?auto_10505 ?auto_10500 ) ) ( OBJ-AT ?auto_10501 ?auto_10499 ) ( OBJ-AT ?auto_10502 ?auto_10499 ) ( not ( = ?auto_10500 ?auto_10501 ) ) ( not ( = ?auto_10500 ?auto_10502 ) ) ( not ( = ?auto_10501 ?auto_10502 ) ) ( not ( = ?auto_10501 ?auto_10505 ) ) ( not ( = ?auto_10502 ?auto_10505 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10505 ?auto_10500 ?auto_10499 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10570 - OBJ
      ?auto_10571 - OBJ
      ?auto_10572 - OBJ
      ?auto_10569 - LOCATION
    )
    :vars
    (
      ?auto_10573 - TRUCK
      ?auto_10574 - LOCATION
      ?auto_10575 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10573 ?auto_10574 ) ( IN-CITY ?auto_10574 ?auto_10575 ) ( IN-CITY ?auto_10569 ?auto_10575 ) ( not ( = ?auto_10569 ?auto_10574 ) ) ( OBJ-AT ?auto_10570 ?auto_10569 ) ( not ( = ?auto_10570 ?auto_10572 ) ) ( OBJ-AT ?auto_10572 ?auto_10574 ) ( OBJ-AT ?auto_10571 ?auto_10569 ) ( not ( = ?auto_10570 ?auto_10571 ) ) ( not ( = ?auto_10571 ?auto_10572 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10570 ?auto_10572 ?auto_10569 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10581 - OBJ
      ?auto_10582 - OBJ
      ?auto_10583 - OBJ
      ?auto_10580 - LOCATION
    )
    :vars
    (
      ?auto_10584 - TRUCK
      ?auto_10585 - LOCATION
      ?auto_10586 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10584 ?auto_10585 ) ( IN-CITY ?auto_10585 ?auto_10586 ) ( IN-CITY ?auto_10580 ?auto_10586 ) ( not ( = ?auto_10580 ?auto_10585 ) ) ( OBJ-AT ?auto_10583 ?auto_10580 ) ( not ( = ?auto_10583 ?auto_10582 ) ) ( OBJ-AT ?auto_10582 ?auto_10585 ) ( OBJ-AT ?auto_10581 ?auto_10580 ) ( not ( = ?auto_10581 ?auto_10582 ) ) ( not ( = ?auto_10581 ?auto_10583 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10583 ?auto_10582 ?auto_10580 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10603 - OBJ
      ?auto_10604 - OBJ
      ?auto_10605 - OBJ
      ?auto_10602 - LOCATION
    )
    :vars
    (
      ?auto_10606 - TRUCK
      ?auto_10607 - LOCATION
      ?auto_10609 - CITY
      ?auto_10608 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10606 ?auto_10607 ) ( IN-CITY ?auto_10607 ?auto_10609 ) ( IN-CITY ?auto_10602 ?auto_10609 ) ( not ( = ?auto_10602 ?auto_10607 ) ) ( OBJ-AT ?auto_10608 ?auto_10602 ) ( not ( = ?auto_10608 ?auto_10605 ) ) ( OBJ-AT ?auto_10605 ?auto_10607 ) ( OBJ-AT ?auto_10603 ?auto_10602 ) ( OBJ-AT ?auto_10604 ?auto_10602 ) ( not ( = ?auto_10603 ?auto_10604 ) ) ( not ( = ?auto_10603 ?auto_10605 ) ) ( not ( = ?auto_10603 ?auto_10608 ) ) ( not ( = ?auto_10604 ?auto_10605 ) ) ( not ( = ?auto_10604 ?auto_10608 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10608 ?auto_10605 ?auto_10602 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10615 - OBJ
      ?auto_10616 - OBJ
      ?auto_10617 - OBJ
      ?auto_10614 - LOCATION
    )
    :vars
    (
      ?auto_10618 - TRUCK
      ?auto_10619 - LOCATION
      ?auto_10621 - CITY
      ?auto_10620 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10618 ?auto_10619 ) ( IN-CITY ?auto_10619 ?auto_10621 ) ( IN-CITY ?auto_10614 ?auto_10621 ) ( not ( = ?auto_10614 ?auto_10619 ) ) ( OBJ-AT ?auto_10620 ?auto_10614 ) ( not ( = ?auto_10620 ?auto_10616 ) ) ( OBJ-AT ?auto_10616 ?auto_10619 ) ( OBJ-AT ?auto_10615 ?auto_10614 ) ( OBJ-AT ?auto_10617 ?auto_10614 ) ( not ( = ?auto_10615 ?auto_10616 ) ) ( not ( = ?auto_10615 ?auto_10617 ) ) ( not ( = ?auto_10615 ?auto_10620 ) ) ( not ( = ?auto_10616 ?auto_10617 ) ) ( not ( = ?auto_10617 ?auto_10620 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10620 ?auto_10616 ?auto_10614 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10631 - OBJ
      ?auto_10632 - OBJ
      ?auto_10633 - OBJ
      ?auto_10630 - LOCATION
    )
    :vars
    (
      ?auto_10634 - TRUCK
      ?auto_10635 - LOCATION
      ?auto_10636 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10634 ?auto_10635 ) ( IN-CITY ?auto_10635 ?auto_10636 ) ( IN-CITY ?auto_10630 ?auto_10636 ) ( not ( = ?auto_10630 ?auto_10635 ) ) ( OBJ-AT ?auto_10633 ?auto_10630 ) ( not ( = ?auto_10633 ?auto_10631 ) ) ( OBJ-AT ?auto_10631 ?auto_10635 ) ( OBJ-AT ?auto_10632 ?auto_10630 ) ( not ( = ?auto_10631 ?auto_10632 ) ) ( not ( = ?auto_10632 ?auto_10633 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10633 ?auto_10631 ?auto_10630 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10653 - OBJ
      ?auto_10654 - OBJ
      ?auto_10655 - OBJ
      ?auto_10652 - LOCATION
    )
    :vars
    (
      ?auto_10656 - TRUCK
      ?auto_10657 - LOCATION
      ?auto_10659 - CITY
      ?auto_10658 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10656 ?auto_10657 ) ( IN-CITY ?auto_10657 ?auto_10659 ) ( IN-CITY ?auto_10652 ?auto_10659 ) ( not ( = ?auto_10652 ?auto_10657 ) ) ( OBJ-AT ?auto_10658 ?auto_10652 ) ( not ( = ?auto_10658 ?auto_10653 ) ) ( OBJ-AT ?auto_10653 ?auto_10657 ) ( OBJ-AT ?auto_10654 ?auto_10652 ) ( OBJ-AT ?auto_10655 ?auto_10652 ) ( not ( = ?auto_10653 ?auto_10654 ) ) ( not ( = ?auto_10653 ?auto_10655 ) ) ( not ( = ?auto_10654 ?auto_10655 ) ) ( not ( = ?auto_10654 ?auto_10658 ) ) ( not ( = ?auto_10655 ?auto_10658 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10658 ?auto_10653 ?auto_10652 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10723 - OBJ
      ?auto_10724 - OBJ
      ?auto_10725 - OBJ
      ?auto_10722 - LOCATION
    )
    :vars
    (
      ?auto_10726 - LOCATION
      ?auto_10727 - CITY
      ?auto_10728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10726 ?auto_10727 ) ( IN-CITY ?auto_10722 ?auto_10727 ) ( not ( = ?auto_10722 ?auto_10726 ) ) ( OBJ-AT ?auto_10724 ?auto_10722 ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( OBJ-AT ?auto_10725 ?auto_10726 ) ( TRUCK-AT ?auto_10728 ?auto_10722 ) ( OBJ-AT ?auto_10723 ?auto_10722 ) ( not ( = ?auto_10723 ?auto_10724 ) ) ( not ( = ?auto_10723 ?auto_10725 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10724 ?auto_10725 ?auto_10722 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10734 - OBJ
      ?auto_10735 - OBJ
      ?auto_10736 - OBJ
      ?auto_10733 - LOCATION
    )
    :vars
    (
      ?auto_10737 - LOCATION
      ?auto_10738 - CITY
      ?auto_10739 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10737 ?auto_10738 ) ( IN-CITY ?auto_10733 ?auto_10738 ) ( not ( = ?auto_10733 ?auto_10737 ) ) ( OBJ-AT ?auto_10734 ?auto_10733 ) ( not ( = ?auto_10734 ?auto_10735 ) ) ( OBJ-AT ?auto_10735 ?auto_10737 ) ( TRUCK-AT ?auto_10739 ?auto_10733 ) ( OBJ-AT ?auto_10736 ?auto_10733 ) ( not ( = ?auto_10734 ?auto_10736 ) ) ( not ( = ?auto_10735 ?auto_10736 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10734 ?auto_10735 ?auto_10733 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10756 - OBJ
      ?auto_10757 - OBJ
      ?auto_10758 - OBJ
      ?auto_10755 - LOCATION
    )
    :vars
    (
      ?auto_10759 - LOCATION
      ?auto_10760 - CITY
      ?auto_10762 - OBJ
      ?auto_10761 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10759 ?auto_10760 ) ( IN-CITY ?auto_10755 ?auto_10760 ) ( not ( = ?auto_10755 ?auto_10759 ) ) ( OBJ-AT ?auto_10762 ?auto_10755 ) ( not ( = ?auto_10762 ?auto_10758 ) ) ( OBJ-AT ?auto_10758 ?auto_10759 ) ( TRUCK-AT ?auto_10761 ?auto_10755 ) ( OBJ-AT ?auto_10756 ?auto_10755 ) ( OBJ-AT ?auto_10757 ?auto_10755 ) ( not ( = ?auto_10756 ?auto_10757 ) ) ( not ( = ?auto_10756 ?auto_10758 ) ) ( not ( = ?auto_10756 ?auto_10762 ) ) ( not ( = ?auto_10757 ?auto_10758 ) ) ( not ( = ?auto_10757 ?auto_10762 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10762 ?auto_10758 ?auto_10755 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10768 - OBJ
      ?auto_10769 - OBJ
      ?auto_10770 - OBJ
      ?auto_10767 - LOCATION
    )
    :vars
    (
      ?auto_10771 - LOCATION
      ?auto_10772 - CITY
      ?auto_10774 - OBJ
      ?auto_10773 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10771 ?auto_10772 ) ( IN-CITY ?auto_10767 ?auto_10772 ) ( not ( = ?auto_10767 ?auto_10771 ) ) ( OBJ-AT ?auto_10774 ?auto_10767 ) ( not ( = ?auto_10774 ?auto_10769 ) ) ( OBJ-AT ?auto_10769 ?auto_10771 ) ( TRUCK-AT ?auto_10773 ?auto_10767 ) ( OBJ-AT ?auto_10768 ?auto_10767 ) ( OBJ-AT ?auto_10770 ?auto_10767 ) ( not ( = ?auto_10768 ?auto_10769 ) ) ( not ( = ?auto_10768 ?auto_10770 ) ) ( not ( = ?auto_10768 ?auto_10774 ) ) ( not ( = ?auto_10769 ?auto_10770 ) ) ( not ( = ?auto_10770 ?auto_10774 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10774 ?auto_10769 ?auto_10767 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10784 - OBJ
      ?auto_10785 - OBJ
      ?auto_10786 - OBJ
      ?auto_10783 - LOCATION
    )
    :vars
    (
      ?auto_10787 - LOCATION
      ?auto_10788 - CITY
      ?auto_10789 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10787 ?auto_10788 ) ( IN-CITY ?auto_10783 ?auto_10788 ) ( not ( = ?auto_10783 ?auto_10787 ) ) ( OBJ-AT ?auto_10785 ?auto_10783 ) ( not ( = ?auto_10785 ?auto_10784 ) ) ( OBJ-AT ?auto_10784 ?auto_10787 ) ( TRUCK-AT ?auto_10789 ?auto_10783 ) ( OBJ-AT ?auto_10786 ?auto_10783 ) ( not ( = ?auto_10784 ?auto_10786 ) ) ( not ( = ?auto_10785 ?auto_10786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10785 ?auto_10784 ?auto_10783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10806 - OBJ
      ?auto_10807 - OBJ
      ?auto_10808 - OBJ
      ?auto_10805 - LOCATION
    )
    :vars
    (
      ?auto_10809 - LOCATION
      ?auto_10810 - CITY
      ?auto_10812 - OBJ
      ?auto_10811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10809 ?auto_10810 ) ( IN-CITY ?auto_10805 ?auto_10810 ) ( not ( = ?auto_10805 ?auto_10809 ) ) ( OBJ-AT ?auto_10812 ?auto_10805 ) ( not ( = ?auto_10812 ?auto_10806 ) ) ( OBJ-AT ?auto_10806 ?auto_10809 ) ( TRUCK-AT ?auto_10811 ?auto_10805 ) ( OBJ-AT ?auto_10807 ?auto_10805 ) ( OBJ-AT ?auto_10808 ?auto_10805 ) ( not ( = ?auto_10806 ?auto_10807 ) ) ( not ( = ?auto_10806 ?auto_10808 ) ) ( not ( = ?auto_10807 ?auto_10808 ) ) ( not ( = ?auto_10807 ?auto_10812 ) ) ( not ( = ?auto_10808 ?auto_10812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10812 ?auto_10806 ?auto_10805 ) )
  )

)

