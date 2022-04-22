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
      ?auto_9521 - TRUCK
      ?auto_9520 - LOCATION
      ?auto_9522 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9521 ?auto_9520 ) ( IN-CITY ?auto_9520 ?auto_9522 ) ( IN-CITY ?auto_9518 ?auto_9522 ) ( not ( = ?auto_9518 ?auto_9520 ) ) ( OBJ-AT ?auto_9519 ?auto_9520 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9519 ?auto_9521 ?auto_9520 )
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
      ?auto_9540 - LOCATION
      ?auto_9539 - CITY
      ?auto_9538 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9540 ?auto_9539 ) ( IN-CITY ?auto_9536 ?auto_9539 ) ( not ( = ?auto_9536 ?auto_9540 ) ) ( OBJ-AT ?auto_9537 ?auto_9540 ) ( TRUCK-AT ?auto_9538 ?auto_9536 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9538 ?auto_9536 ?auto_9540 ?auto_9539 )
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
      ?auto_9651 - LOCATION
      ?auto_9652 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_9650 ?auto_9653 ) ( TRUCK-AT ?auto_9653 ?auto_9651 ) ( IN-CITY ?auto_9651 ?auto_9652 ) ( IN-CITY ?auto_9648 ?auto_9652 ) ( not ( = ?auto_9648 ?auto_9651 ) ) ( OBJ-AT ?auto_9649 ?auto_9648 ) ( not ( = ?auto_9649 ?auto_9650 ) ) )
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
    ( and ( IN-TRUCK ?auto_9670 ?auto_9672 ) ( TRUCK-AT ?auto_9672 ?auto_9671 ) ( IN-CITY ?auto_9671 ?auto_9673 ) ( IN-CITY ?auto_9667 ?auto_9673 ) ( not ( = ?auto_9667 ?auto_9671 ) ) ( OBJ-AT ?auto_9668 ?auto_9667 ) ( not ( = ?auto_9668 ?auto_9670 ) ) ( OBJ-AT ?auto_9669 ?auto_9667 ) ( not ( = ?auto_9668 ?auto_9669 ) ) ( not ( = ?auto_9669 ?auto_9670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9668 ?auto_9670 ?auto_9667 ) )
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
    ( and ( IN-TRUCK ?auto_9676 ?auto_9679 ) ( TRUCK-AT ?auto_9679 ?auto_9678 ) ( IN-CITY ?auto_9678 ?auto_9680 ) ( IN-CITY ?auto_9674 ?auto_9680 ) ( not ( = ?auto_9674 ?auto_9678 ) ) ( OBJ-AT ?auto_9675 ?auto_9674 ) ( not ( = ?auto_9675 ?auto_9676 ) ) ( OBJ-AT ?auto_9677 ?auto_9674 ) ( not ( = ?auto_9675 ?auto_9677 ) ) ( not ( = ?auto_9676 ?auto_9677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9675 ?auto_9676 ?auto_9674 ) )
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
    ( and ( IN-TRUCK ?auto_9689 ?auto_9693 ) ( TRUCK-AT ?auto_9693 ?auto_9692 ) ( IN-CITY ?auto_9692 ?auto_9694 ) ( IN-CITY ?auto_9688 ?auto_9694 ) ( not ( = ?auto_9688 ?auto_9692 ) ) ( OBJ-AT ?auto_9690 ?auto_9688 ) ( not ( = ?auto_9690 ?auto_9689 ) ) ( OBJ-AT ?auto_9691 ?auto_9688 ) ( not ( = ?auto_9689 ?auto_9691 ) ) ( not ( = ?auto_9690 ?auto_9691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9690 ?auto_9689 ?auto_9688 ) )
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
      ?auto_9726 - TRUCK
      ?auto_9728 - LOCATION
      ?auto_9727 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9726 ?auto_9728 ) ( IN-CITY ?auto_9728 ?auto_9727 ) ( IN-CITY ?auto_9723 ?auto_9727 ) ( not ( = ?auto_9723 ?auto_9728 ) ) ( OBJ-AT ?auto_9724 ?auto_9723 ) ( not ( = ?auto_9724 ?auto_9725 ) ) ( OBJ-AT ?auto_9725 ?auto_9728 ) )
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
      ?auto_9733 - TRUCK
      ?auto_9734 - LOCATION
      ?auto_9732 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9733 ?auto_9734 ) ( IN-CITY ?auto_9734 ?auto_9732 ) ( IN-CITY ?auto_9729 ?auto_9732 ) ( not ( = ?auto_9729 ?auto_9734 ) ) ( OBJ-AT ?auto_9731 ?auto_9729 ) ( not ( = ?auto_9731 ?auto_9730 ) ) ( OBJ-AT ?auto_9730 ?auto_9734 ) )
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
      ?auto_9747 - TRUCK
      ?auto_9748 - LOCATION
      ?auto_9746 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9747 ?auto_9748 ) ( IN-CITY ?auto_9748 ?auto_9746 ) ( IN-CITY ?auto_9742 ?auto_9746 ) ( not ( = ?auto_9742 ?auto_9748 ) ) ( OBJ-AT ?auto_9744 ?auto_9742 ) ( not ( = ?auto_9744 ?auto_9745 ) ) ( OBJ-AT ?auto_9745 ?auto_9748 ) ( OBJ-AT ?auto_9743 ?auto_9742 ) ( not ( = ?auto_9743 ?auto_9744 ) ) ( not ( = ?auto_9743 ?auto_9745 ) ) )
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
      ?auto_9754 - TRUCK
      ?auto_9755 - LOCATION
      ?auto_9753 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9754 ?auto_9755 ) ( IN-CITY ?auto_9755 ?auto_9753 ) ( IN-CITY ?auto_9749 ?auto_9753 ) ( not ( = ?auto_9749 ?auto_9755 ) ) ( OBJ-AT ?auto_9752 ?auto_9749 ) ( not ( = ?auto_9752 ?auto_9751 ) ) ( OBJ-AT ?auto_9751 ?auto_9755 ) ( OBJ-AT ?auto_9750 ?auto_9749 ) ( not ( = ?auto_9750 ?auto_9751 ) ) ( not ( = ?auto_9750 ?auto_9752 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9752 ?auto_9751 ?auto_9749 ) )
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
      ?auto_9768 - TRUCK
      ?auto_9769 - LOCATION
      ?auto_9767 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_9768 ?auto_9769 ) ( IN-CITY ?auto_9769 ?auto_9767 ) ( IN-CITY ?auto_9763 ?auto_9767 ) ( not ( = ?auto_9763 ?auto_9769 ) ) ( OBJ-AT ?auto_9766 ?auto_9763 ) ( not ( = ?auto_9766 ?auto_9764 ) ) ( OBJ-AT ?auto_9764 ?auto_9769 ) ( OBJ-AT ?auto_9765 ?auto_9763 ) ( not ( = ?auto_9764 ?auto_9765 ) ) ( not ( = ?auto_9765 ?auto_9766 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9766 ?auto_9764 ?auto_9763 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9793 - OBJ
      ?auto_9792 - LOCATION
    )
    :vars
    (
      ?auto_9796 - LOCATION
      ?auto_9794 - CITY
      ?auto_9797 - OBJ
      ?auto_9795 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9796 ?auto_9794 ) ( IN-CITY ?auto_9792 ?auto_9794 ) ( not ( = ?auto_9792 ?auto_9796 ) ) ( OBJ-AT ?auto_9797 ?auto_9792 ) ( not ( = ?auto_9797 ?auto_9793 ) ) ( OBJ-AT ?auto_9793 ?auto_9796 ) ( TRUCK-AT ?auto_9795 ?auto_9792 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9795 ?auto_9792 ?auto_9796 ?auto_9794 )
      ( DELIVER-2PKG ?auto_9797 ?auto_9793 ?auto_9792 ) )
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
      ?auto_9802 - LOCATION
      ?auto_9801 - CITY
      ?auto_9803 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9802 ?auto_9801 ) ( IN-CITY ?auto_9798 ?auto_9801 ) ( not ( = ?auto_9798 ?auto_9802 ) ) ( OBJ-AT ?auto_9799 ?auto_9798 ) ( not ( = ?auto_9799 ?auto_9800 ) ) ( OBJ-AT ?auto_9800 ?auto_9802 ) ( TRUCK-AT ?auto_9803 ?auto_9798 ) )
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
      ?auto_9808 - LOCATION
      ?auto_9809 - CITY
      ?auto_9807 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9808 ?auto_9809 ) ( IN-CITY ?auto_9804 ?auto_9809 ) ( not ( = ?auto_9804 ?auto_9808 ) ) ( OBJ-AT ?auto_9806 ?auto_9804 ) ( not ( = ?auto_9806 ?auto_9805 ) ) ( OBJ-AT ?auto_9805 ?auto_9808 ) ( TRUCK-AT ?auto_9807 ?auto_9804 ) )
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
      ?auto_9822 - LOCATION
      ?auto_9823 - CITY
      ?auto_9821 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9822 ?auto_9823 ) ( IN-CITY ?auto_9817 ?auto_9823 ) ( not ( = ?auto_9817 ?auto_9822 ) ) ( OBJ-AT ?auto_9818 ?auto_9817 ) ( not ( = ?auto_9818 ?auto_9820 ) ) ( OBJ-AT ?auto_9820 ?auto_9822 ) ( TRUCK-AT ?auto_9821 ?auto_9817 ) ( OBJ-AT ?auto_9819 ?auto_9817 ) ( not ( = ?auto_9818 ?auto_9819 ) ) ( not ( = ?auto_9819 ?auto_9820 ) ) )
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
      ?auto_9829 - LOCATION
      ?auto_9830 - CITY
      ?auto_9828 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9829 ?auto_9830 ) ( IN-CITY ?auto_9824 ?auto_9830 ) ( not ( = ?auto_9824 ?auto_9829 ) ) ( OBJ-AT ?auto_9827 ?auto_9824 ) ( not ( = ?auto_9827 ?auto_9826 ) ) ( OBJ-AT ?auto_9826 ?auto_9829 ) ( TRUCK-AT ?auto_9828 ?auto_9824 ) ( OBJ-AT ?auto_9825 ?auto_9824 ) ( not ( = ?auto_9825 ?auto_9826 ) ) ( not ( = ?auto_9825 ?auto_9827 ) ) )
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
      ?auto_9843 - LOCATION
      ?auto_9844 - CITY
      ?auto_9842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9843 ?auto_9844 ) ( IN-CITY ?auto_9838 ?auto_9844 ) ( not ( = ?auto_9838 ?auto_9843 ) ) ( OBJ-AT ?auto_9841 ?auto_9838 ) ( not ( = ?auto_9841 ?auto_9839 ) ) ( OBJ-AT ?auto_9839 ?auto_9843 ) ( TRUCK-AT ?auto_9842 ?auto_9838 ) ( OBJ-AT ?auto_9840 ?auto_9838 ) ( not ( = ?auto_9839 ?auto_9840 ) ) ( not ( = ?auto_9840 ?auto_9841 ) ) )
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
      ?auto_9870 - LOCATION
      ?auto_9872 - CITY
      ?auto_9871 - OBJ
      ?auto_9869 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9870 ?auto_9872 ) ( IN-CITY ?auto_9867 ?auto_9872 ) ( not ( = ?auto_9867 ?auto_9870 ) ) ( not ( = ?auto_9871 ?auto_9868 ) ) ( OBJ-AT ?auto_9868 ?auto_9870 ) ( TRUCK-AT ?auto_9869 ?auto_9867 ) ( IN-TRUCK ?auto_9871 ?auto_9869 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9871 ?auto_9867 )
      ( DELIVER-2PKG ?auto_9871 ?auto_9868 ?auto_9867 ) )
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
      ?auto_9878 - LOCATION
      ?auto_9876 - CITY
      ?auto_9877 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9878 ?auto_9876 ) ( IN-CITY ?auto_9873 ?auto_9876 ) ( not ( = ?auto_9873 ?auto_9878 ) ) ( not ( = ?auto_9874 ?auto_9875 ) ) ( OBJ-AT ?auto_9875 ?auto_9878 ) ( TRUCK-AT ?auto_9877 ?auto_9873 ) ( IN-TRUCK ?auto_9874 ?auto_9877 ) )
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
      ?auto_9883 - LOCATION
      ?auto_9882 - CITY
      ?auto_9884 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9883 ?auto_9882 ) ( IN-CITY ?auto_9879 ?auto_9882 ) ( not ( = ?auto_9879 ?auto_9883 ) ) ( not ( = ?auto_9881 ?auto_9880 ) ) ( OBJ-AT ?auto_9880 ?auto_9883 ) ( TRUCK-AT ?auto_9884 ?auto_9879 ) ( IN-TRUCK ?auto_9881 ?auto_9884 ) )
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
      ?auto_9944 - CITY
      ?auto_9945 - OBJ
      ?auto_9947 - TRUCK
      ?auto_9948 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9946 ?auto_9944 ) ( IN-CITY ?auto_9942 ?auto_9944 ) ( not ( = ?auto_9942 ?auto_9946 ) ) ( not ( = ?auto_9945 ?auto_9943 ) ) ( OBJ-AT ?auto_9943 ?auto_9946 ) ( IN-TRUCK ?auto_9945 ?auto_9947 ) ( TRUCK-AT ?auto_9947 ?auto_9948 ) ( IN-CITY ?auto_9948 ?auto_9944 ) ( not ( = ?auto_9942 ?auto_9948 ) ) ( not ( = ?auto_9946 ?auto_9948 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9947 ?auto_9948 ?auto_9942 ?auto_9944 )
      ( DELIVER-2PKG ?auto_9945 ?auto_9943 ?auto_9942 ) )
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
      ?auto_9955 - LOCATION
      ?auto_9953 - CITY
      ?auto_9952 - TRUCK
      ?auto_9954 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9955 ?auto_9953 ) ( IN-CITY ?auto_9949 ?auto_9953 ) ( not ( = ?auto_9949 ?auto_9955 ) ) ( not ( = ?auto_9950 ?auto_9951 ) ) ( OBJ-AT ?auto_9951 ?auto_9955 ) ( IN-TRUCK ?auto_9950 ?auto_9952 ) ( TRUCK-AT ?auto_9952 ?auto_9954 ) ( IN-CITY ?auto_9954 ?auto_9953 ) ( not ( = ?auto_9949 ?auto_9954 ) ) ( not ( = ?auto_9955 ?auto_9954 ) ) )
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
      ?auto_9959 - LOCATION
      ?auto_9961 - CITY
      ?auto_9962 - TRUCK
      ?auto_9960 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9959 ?auto_9961 ) ( IN-CITY ?auto_9956 ?auto_9961 ) ( not ( = ?auto_9956 ?auto_9959 ) ) ( not ( = ?auto_9958 ?auto_9957 ) ) ( OBJ-AT ?auto_9957 ?auto_9959 ) ( IN-TRUCK ?auto_9958 ?auto_9962 ) ( TRUCK-AT ?auto_9962 ?auto_9960 ) ( IN-CITY ?auto_9960 ?auto_9961 ) ( not ( = ?auto_9956 ?auto_9960 ) ) ( not ( = ?auto_9959 ?auto_9960 ) ) )
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
      ?auto_10030 - LOCATION
      ?auto_10032 - CITY
      ?auto_10034 - OBJ
      ?auto_10033 - TRUCK
      ?auto_10031 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10030 ?auto_10032 ) ( IN-CITY ?auto_10028 ?auto_10032 ) ( not ( = ?auto_10028 ?auto_10030 ) ) ( not ( = ?auto_10034 ?auto_10029 ) ) ( OBJ-AT ?auto_10029 ?auto_10030 ) ( TRUCK-AT ?auto_10033 ?auto_10031 ) ( IN-CITY ?auto_10031 ?auto_10032 ) ( not ( = ?auto_10028 ?auto_10031 ) ) ( not ( = ?auto_10030 ?auto_10031 ) ) ( OBJ-AT ?auto_10034 ?auto_10031 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10034 ?auto_10033 ?auto_10031 )
      ( DELIVER-2PKG ?auto_10034 ?auto_10029 ?auto_10028 ) )
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
      ?auto_10041 - TRUCK
      ?auto_10040 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10038 ?auto_10039 ) ( IN-CITY ?auto_10035 ?auto_10039 ) ( not ( = ?auto_10035 ?auto_10038 ) ) ( not ( = ?auto_10036 ?auto_10037 ) ) ( OBJ-AT ?auto_10037 ?auto_10038 ) ( TRUCK-AT ?auto_10041 ?auto_10040 ) ( IN-CITY ?auto_10040 ?auto_10039 ) ( not ( = ?auto_10035 ?auto_10040 ) ) ( not ( = ?auto_10038 ?auto_10040 ) ) ( OBJ-AT ?auto_10036 ?auto_10040 ) )
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
      ?auto_10046 - LOCATION
      ?auto_10045 - CITY
      ?auto_10048 - TRUCK
      ?auto_10047 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10046 ?auto_10045 ) ( IN-CITY ?auto_10042 ?auto_10045 ) ( not ( = ?auto_10042 ?auto_10046 ) ) ( not ( = ?auto_10044 ?auto_10043 ) ) ( OBJ-AT ?auto_10043 ?auto_10046 ) ( TRUCK-AT ?auto_10048 ?auto_10047 ) ( IN-CITY ?auto_10047 ?auto_10045 ) ( not ( = ?auto_10042 ?auto_10047 ) ) ( not ( = ?auto_10046 ?auto_10047 ) ) ( OBJ-AT ?auto_10044 ?auto_10047 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10044 ?auto_10043 ?auto_10042 ) )
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
      ?auto_10432 - LOCATION
      ?auto_10431 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10429 ?auto_10433 ) ( TRUCK-AT ?auto_10433 ?auto_10432 ) ( IN-CITY ?auto_10432 ?auto_10431 ) ( IN-CITY ?auto_10427 ?auto_10431 ) ( not ( = ?auto_10427 ?auto_10432 ) ) ( OBJ-AT ?auto_10430 ?auto_10427 ) ( not ( = ?auto_10430 ?auto_10429 ) ) ( OBJ-AT ?auto_10428 ?auto_10427 ) ( not ( = ?auto_10428 ?auto_10429 ) ) ( not ( = ?auto_10428 ?auto_10430 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10430 ?auto_10429 ?auto_10427 ) )
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
      ?auto_10455 - TRUCK
      ?auto_10454 - LOCATION
      ?auto_10453 - CITY
      ?auto_10456 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10452 ?auto_10455 ) ( TRUCK-AT ?auto_10455 ?auto_10454 ) ( IN-CITY ?auto_10454 ?auto_10453 ) ( IN-CITY ?auto_10449 ?auto_10453 ) ( not ( = ?auto_10449 ?auto_10454 ) ) ( OBJ-AT ?auto_10456 ?auto_10449 ) ( not ( = ?auto_10456 ?auto_10452 ) ) ( OBJ-AT ?auto_10450 ?auto_10449 ) ( OBJ-AT ?auto_10451 ?auto_10449 ) ( not ( = ?auto_10450 ?auto_10451 ) ) ( not ( = ?auto_10450 ?auto_10452 ) ) ( not ( = ?auto_10450 ?auto_10456 ) ) ( not ( = ?auto_10451 ?auto_10452 ) ) ( not ( = ?auto_10451 ?auto_10456 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10456 ?auto_10452 ?auto_10449 ) )
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
      ?auto_10467 - TRUCK
      ?auto_10466 - LOCATION
      ?auto_10465 - CITY
      ?auto_10468 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10463 ?auto_10467 ) ( TRUCK-AT ?auto_10467 ?auto_10466 ) ( IN-CITY ?auto_10466 ?auto_10465 ) ( IN-CITY ?auto_10461 ?auto_10465 ) ( not ( = ?auto_10461 ?auto_10466 ) ) ( OBJ-AT ?auto_10468 ?auto_10461 ) ( not ( = ?auto_10468 ?auto_10463 ) ) ( OBJ-AT ?auto_10462 ?auto_10461 ) ( OBJ-AT ?auto_10464 ?auto_10461 ) ( not ( = ?auto_10462 ?auto_10463 ) ) ( not ( = ?auto_10462 ?auto_10464 ) ) ( not ( = ?auto_10462 ?auto_10468 ) ) ( not ( = ?auto_10463 ?auto_10464 ) ) ( not ( = ?auto_10464 ?auto_10468 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10468 ?auto_10463 ?auto_10461 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10478 - OBJ
      ?auto_10479 - OBJ
      ?auto_10480 - OBJ
      ?auto_10477 - LOCATION
    )
    :vars
    (
      ?auto_10483 - TRUCK
      ?auto_10482 - LOCATION
      ?auto_10481 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10478 ?auto_10483 ) ( TRUCK-AT ?auto_10483 ?auto_10482 ) ( IN-CITY ?auto_10482 ?auto_10481 ) ( IN-CITY ?auto_10477 ?auto_10481 ) ( not ( = ?auto_10477 ?auto_10482 ) ) ( OBJ-AT ?auto_10480 ?auto_10477 ) ( not ( = ?auto_10480 ?auto_10478 ) ) ( OBJ-AT ?auto_10479 ?auto_10477 ) ( not ( = ?auto_10478 ?auto_10479 ) ) ( not ( = ?auto_10479 ?auto_10480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10480 ?auto_10478 ?auto_10477 ) )
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
      ?auto_10505 - TRUCK
      ?auto_10504 - LOCATION
      ?auto_10503 - CITY
      ?auto_10506 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10500 ?auto_10505 ) ( TRUCK-AT ?auto_10505 ?auto_10504 ) ( IN-CITY ?auto_10504 ?auto_10503 ) ( IN-CITY ?auto_10499 ?auto_10503 ) ( not ( = ?auto_10499 ?auto_10504 ) ) ( OBJ-AT ?auto_10506 ?auto_10499 ) ( not ( = ?auto_10506 ?auto_10500 ) ) ( OBJ-AT ?auto_10501 ?auto_10499 ) ( OBJ-AT ?auto_10502 ?auto_10499 ) ( not ( = ?auto_10500 ?auto_10501 ) ) ( not ( = ?auto_10500 ?auto_10502 ) ) ( not ( = ?auto_10501 ?auto_10502 ) ) ( not ( = ?auto_10501 ?auto_10506 ) ) ( not ( = ?auto_10502 ?auto_10506 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10506 ?auto_10500 ?auto_10499 ) )
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
      ?auto_10574 - TRUCK
      ?auto_10575 - LOCATION
      ?auto_10573 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10574 ?auto_10575 ) ( IN-CITY ?auto_10575 ?auto_10573 ) ( IN-CITY ?auto_10569 ?auto_10573 ) ( not ( = ?auto_10569 ?auto_10575 ) ) ( OBJ-AT ?auto_10570 ?auto_10569 ) ( not ( = ?auto_10570 ?auto_10572 ) ) ( OBJ-AT ?auto_10572 ?auto_10575 ) ( OBJ-AT ?auto_10571 ?auto_10569 ) ( not ( = ?auto_10570 ?auto_10571 ) ) ( not ( = ?auto_10571 ?auto_10572 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10570 ?auto_10572 ?auto_10569 ) )
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
      ?auto_10607 - TRUCK
      ?auto_10609 - LOCATION
      ?auto_10606 - CITY
      ?auto_10608 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10607 ?auto_10609 ) ( IN-CITY ?auto_10609 ?auto_10606 ) ( IN-CITY ?auto_10602 ?auto_10606 ) ( not ( = ?auto_10602 ?auto_10609 ) ) ( OBJ-AT ?auto_10608 ?auto_10602 ) ( not ( = ?auto_10608 ?auto_10605 ) ) ( OBJ-AT ?auto_10605 ?auto_10609 ) ( OBJ-AT ?auto_10603 ?auto_10602 ) ( OBJ-AT ?auto_10604 ?auto_10602 ) ( not ( = ?auto_10603 ?auto_10604 ) ) ( not ( = ?auto_10603 ?auto_10605 ) ) ( not ( = ?auto_10603 ?auto_10608 ) ) ( not ( = ?auto_10604 ?auto_10605 ) ) ( not ( = ?auto_10604 ?auto_10608 ) ) )
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
      ?auto_10619 - TRUCK
      ?auto_10621 - LOCATION
      ?auto_10618 - CITY
      ?auto_10620 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10619 ?auto_10621 ) ( IN-CITY ?auto_10621 ?auto_10618 ) ( IN-CITY ?auto_10614 ?auto_10618 ) ( not ( = ?auto_10614 ?auto_10621 ) ) ( OBJ-AT ?auto_10620 ?auto_10614 ) ( not ( = ?auto_10620 ?auto_10616 ) ) ( OBJ-AT ?auto_10616 ?auto_10621 ) ( OBJ-AT ?auto_10615 ?auto_10614 ) ( OBJ-AT ?auto_10617 ?auto_10614 ) ( not ( = ?auto_10615 ?auto_10616 ) ) ( not ( = ?auto_10615 ?auto_10617 ) ) ( not ( = ?auto_10615 ?auto_10620 ) ) ( not ( = ?auto_10616 ?auto_10617 ) ) ( not ( = ?auto_10617 ?auto_10620 ) ) )
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
      ?auto_10635 - TRUCK
      ?auto_10636 - LOCATION
      ?auto_10634 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10635 ?auto_10636 ) ( IN-CITY ?auto_10636 ?auto_10634 ) ( IN-CITY ?auto_10630 ?auto_10634 ) ( not ( = ?auto_10630 ?auto_10636 ) ) ( OBJ-AT ?auto_10632 ?auto_10630 ) ( not ( = ?auto_10632 ?auto_10631 ) ) ( OBJ-AT ?auto_10631 ?auto_10636 ) ( OBJ-AT ?auto_10633 ?auto_10630 ) ( not ( = ?auto_10631 ?auto_10633 ) ) ( not ( = ?auto_10632 ?auto_10633 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10632 ?auto_10631 ?auto_10630 ) )
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
      ?auto_10657 - TRUCK
      ?auto_10659 - LOCATION
      ?auto_10656 - CITY
      ?auto_10658 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10657 ?auto_10659 ) ( IN-CITY ?auto_10659 ?auto_10656 ) ( IN-CITY ?auto_10652 ?auto_10656 ) ( not ( = ?auto_10652 ?auto_10659 ) ) ( OBJ-AT ?auto_10658 ?auto_10652 ) ( not ( = ?auto_10658 ?auto_10653 ) ) ( OBJ-AT ?auto_10653 ?auto_10659 ) ( OBJ-AT ?auto_10654 ?auto_10652 ) ( OBJ-AT ?auto_10655 ?auto_10652 ) ( not ( = ?auto_10653 ?auto_10654 ) ) ( not ( = ?auto_10653 ?auto_10655 ) ) ( not ( = ?auto_10654 ?auto_10655 ) ) ( not ( = ?auto_10654 ?auto_10658 ) ) ( not ( = ?auto_10655 ?auto_10658 ) ) )
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
      ?auto_10727 - LOCATION
      ?auto_10728 - CITY
      ?auto_10726 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10727 ?auto_10728 ) ( IN-CITY ?auto_10722 ?auto_10728 ) ( not ( = ?auto_10722 ?auto_10727 ) ) ( OBJ-AT ?auto_10724 ?auto_10722 ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( OBJ-AT ?auto_10725 ?auto_10727 ) ( TRUCK-AT ?auto_10726 ?auto_10722 ) ( OBJ-AT ?auto_10723 ?auto_10722 ) ( not ( = ?auto_10723 ?auto_10724 ) ) ( not ( = ?auto_10723 ?auto_10725 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10724 ?auto_10725 ?auto_10722 ) )
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
      ?auto_10760 - LOCATION
      ?auto_10761 - CITY
      ?auto_10762 - OBJ
      ?auto_10759 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10760 ?auto_10761 ) ( IN-CITY ?auto_10755 ?auto_10761 ) ( not ( = ?auto_10755 ?auto_10760 ) ) ( OBJ-AT ?auto_10762 ?auto_10755 ) ( not ( = ?auto_10762 ?auto_10758 ) ) ( OBJ-AT ?auto_10758 ?auto_10760 ) ( TRUCK-AT ?auto_10759 ?auto_10755 ) ( OBJ-AT ?auto_10756 ?auto_10755 ) ( OBJ-AT ?auto_10757 ?auto_10755 ) ( not ( = ?auto_10756 ?auto_10757 ) ) ( not ( = ?auto_10756 ?auto_10758 ) ) ( not ( = ?auto_10756 ?auto_10762 ) ) ( not ( = ?auto_10757 ?auto_10758 ) ) ( not ( = ?auto_10757 ?auto_10762 ) ) )
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
      ?auto_10772 - LOCATION
      ?auto_10773 - CITY
      ?auto_10774 - OBJ
      ?auto_10771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10772 ?auto_10773 ) ( IN-CITY ?auto_10767 ?auto_10773 ) ( not ( = ?auto_10767 ?auto_10772 ) ) ( OBJ-AT ?auto_10774 ?auto_10767 ) ( not ( = ?auto_10774 ?auto_10769 ) ) ( OBJ-AT ?auto_10769 ?auto_10772 ) ( TRUCK-AT ?auto_10771 ?auto_10767 ) ( OBJ-AT ?auto_10768 ?auto_10767 ) ( OBJ-AT ?auto_10770 ?auto_10767 ) ( not ( = ?auto_10768 ?auto_10769 ) ) ( not ( = ?auto_10768 ?auto_10770 ) ) ( not ( = ?auto_10768 ?auto_10774 ) ) ( not ( = ?auto_10769 ?auto_10770 ) ) ( not ( = ?auto_10770 ?auto_10774 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10774 ?auto_10769 ?auto_10767 ) )
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
      ?auto_10810 - LOCATION
      ?auto_10811 - CITY
      ?auto_10812 - OBJ
      ?auto_10809 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10810 ?auto_10811 ) ( IN-CITY ?auto_10805 ?auto_10811 ) ( not ( = ?auto_10805 ?auto_10810 ) ) ( OBJ-AT ?auto_10812 ?auto_10805 ) ( not ( = ?auto_10812 ?auto_10806 ) ) ( OBJ-AT ?auto_10806 ?auto_10810 ) ( TRUCK-AT ?auto_10809 ?auto_10805 ) ( OBJ-AT ?auto_10807 ?auto_10805 ) ( OBJ-AT ?auto_10808 ?auto_10805 ) ( not ( = ?auto_10806 ?auto_10807 ) ) ( not ( = ?auto_10806 ?auto_10808 ) ) ( not ( = ?auto_10807 ?auto_10808 ) ) ( not ( = ?auto_10807 ?auto_10812 ) ) ( not ( = ?auto_10808 ?auto_10812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10812 ?auto_10806 ?auto_10805 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10947 - OBJ
      ?auto_10948 - OBJ
      ?auto_10949 - OBJ
      ?auto_10946 - LOCATION
    )
    :vars
    (
      ?auto_10952 - LOCATION
      ?auto_10951 - CITY
      ?auto_10950 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10952 ?auto_10951 ) ( IN-CITY ?auto_10946 ?auto_10951 ) ( not ( = ?auto_10946 ?auto_10952 ) ) ( OBJ-AT ?auto_10948 ?auto_10946 ) ( not ( = ?auto_10948 ?auto_10947 ) ) ( OBJ-AT ?auto_10947 ?auto_10952 ) ( TRUCK-AT ?auto_10950 ?auto_10946 ) ( OBJ-AT ?auto_10949 ?auto_10946 ) ( not ( = ?auto_10947 ?auto_10949 ) ) ( not ( = ?auto_10948 ?auto_10949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10948 ?auto_10947 ?auto_10946 ) )
  )

)

