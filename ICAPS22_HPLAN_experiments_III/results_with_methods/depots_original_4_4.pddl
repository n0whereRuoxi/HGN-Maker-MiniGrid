( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13588 - SURFACE
      ?auto_13589 - SURFACE
    )
    :vars
    (
      ?auto_13590 - HOIST
      ?auto_13591 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13590 ?auto_13591 ) ( SURFACE-AT ?auto_13588 ?auto_13591 ) ( CLEAR ?auto_13588 ) ( LIFTING ?auto_13590 ?auto_13589 ) ( IS-CRATE ?auto_13589 ) ( not ( = ?auto_13588 ?auto_13589 ) ) )
    :subtasks
    ( ( !DROP ?auto_13590 ?auto_13589 ?auto_13588 ?auto_13591 )
      ( MAKE-1CRATE-VERIFY ?auto_13588 ?auto_13589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13592 - SURFACE
      ?auto_13593 - SURFACE
    )
    :vars
    (
      ?auto_13595 - HOIST
      ?auto_13594 - PLACE
      ?auto_13596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13595 ?auto_13594 ) ( SURFACE-AT ?auto_13592 ?auto_13594 ) ( CLEAR ?auto_13592 ) ( IS-CRATE ?auto_13593 ) ( not ( = ?auto_13592 ?auto_13593 ) ) ( TRUCK-AT ?auto_13596 ?auto_13594 ) ( AVAILABLE ?auto_13595 ) ( IN ?auto_13593 ?auto_13596 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13595 ?auto_13593 ?auto_13596 ?auto_13594 )
      ( MAKE-1CRATE ?auto_13592 ?auto_13593 )
      ( MAKE-1CRATE-VERIFY ?auto_13592 ?auto_13593 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13597 - SURFACE
      ?auto_13598 - SURFACE
    )
    :vars
    (
      ?auto_13601 - HOIST
      ?auto_13600 - PLACE
      ?auto_13599 - TRUCK
      ?auto_13602 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13601 ?auto_13600 ) ( SURFACE-AT ?auto_13597 ?auto_13600 ) ( CLEAR ?auto_13597 ) ( IS-CRATE ?auto_13598 ) ( not ( = ?auto_13597 ?auto_13598 ) ) ( AVAILABLE ?auto_13601 ) ( IN ?auto_13598 ?auto_13599 ) ( TRUCK-AT ?auto_13599 ?auto_13602 ) ( not ( = ?auto_13602 ?auto_13600 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13599 ?auto_13602 ?auto_13600 )
      ( MAKE-1CRATE ?auto_13597 ?auto_13598 )
      ( MAKE-1CRATE-VERIFY ?auto_13597 ?auto_13598 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13603 - SURFACE
      ?auto_13604 - SURFACE
    )
    :vars
    (
      ?auto_13608 - HOIST
      ?auto_13606 - PLACE
      ?auto_13607 - TRUCK
      ?auto_13605 - PLACE
      ?auto_13609 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13608 ?auto_13606 ) ( SURFACE-AT ?auto_13603 ?auto_13606 ) ( CLEAR ?auto_13603 ) ( IS-CRATE ?auto_13604 ) ( not ( = ?auto_13603 ?auto_13604 ) ) ( AVAILABLE ?auto_13608 ) ( TRUCK-AT ?auto_13607 ?auto_13605 ) ( not ( = ?auto_13605 ?auto_13606 ) ) ( HOIST-AT ?auto_13609 ?auto_13605 ) ( LIFTING ?auto_13609 ?auto_13604 ) ( not ( = ?auto_13608 ?auto_13609 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13609 ?auto_13604 ?auto_13607 ?auto_13605 )
      ( MAKE-1CRATE ?auto_13603 ?auto_13604 )
      ( MAKE-1CRATE-VERIFY ?auto_13603 ?auto_13604 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13610 - SURFACE
      ?auto_13611 - SURFACE
    )
    :vars
    (
      ?auto_13612 - HOIST
      ?auto_13614 - PLACE
      ?auto_13613 - TRUCK
      ?auto_13616 - PLACE
      ?auto_13615 - HOIST
      ?auto_13617 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13612 ?auto_13614 ) ( SURFACE-AT ?auto_13610 ?auto_13614 ) ( CLEAR ?auto_13610 ) ( IS-CRATE ?auto_13611 ) ( not ( = ?auto_13610 ?auto_13611 ) ) ( AVAILABLE ?auto_13612 ) ( TRUCK-AT ?auto_13613 ?auto_13616 ) ( not ( = ?auto_13616 ?auto_13614 ) ) ( HOIST-AT ?auto_13615 ?auto_13616 ) ( not ( = ?auto_13612 ?auto_13615 ) ) ( AVAILABLE ?auto_13615 ) ( SURFACE-AT ?auto_13611 ?auto_13616 ) ( ON ?auto_13611 ?auto_13617 ) ( CLEAR ?auto_13611 ) ( not ( = ?auto_13610 ?auto_13617 ) ) ( not ( = ?auto_13611 ?auto_13617 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13615 ?auto_13611 ?auto_13617 ?auto_13616 )
      ( MAKE-1CRATE ?auto_13610 ?auto_13611 )
      ( MAKE-1CRATE-VERIFY ?auto_13610 ?auto_13611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13618 - SURFACE
      ?auto_13619 - SURFACE
    )
    :vars
    (
      ?auto_13625 - HOIST
      ?auto_13623 - PLACE
      ?auto_13620 - PLACE
      ?auto_13621 - HOIST
      ?auto_13624 - SURFACE
      ?auto_13622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13625 ?auto_13623 ) ( SURFACE-AT ?auto_13618 ?auto_13623 ) ( CLEAR ?auto_13618 ) ( IS-CRATE ?auto_13619 ) ( not ( = ?auto_13618 ?auto_13619 ) ) ( AVAILABLE ?auto_13625 ) ( not ( = ?auto_13620 ?auto_13623 ) ) ( HOIST-AT ?auto_13621 ?auto_13620 ) ( not ( = ?auto_13625 ?auto_13621 ) ) ( AVAILABLE ?auto_13621 ) ( SURFACE-AT ?auto_13619 ?auto_13620 ) ( ON ?auto_13619 ?auto_13624 ) ( CLEAR ?auto_13619 ) ( not ( = ?auto_13618 ?auto_13624 ) ) ( not ( = ?auto_13619 ?auto_13624 ) ) ( TRUCK-AT ?auto_13622 ?auto_13623 ) )
    :subtasks
    ( ( !DRIVE ?auto_13622 ?auto_13623 ?auto_13620 )
      ( MAKE-1CRATE ?auto_13618 ?auto_13619 )
      ( MAKE-1CRATE-VERIFY ?auto_13618 ?auto_13619 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13631 - SURFACE
      ?auto_13632 - SURFACE
    )
    :vars
    (
      ?auto_13633 - HOIST
      ?auto_13634 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13633 ?auto_13634 ) ( SURFACE-AT ?auto_13631 ?auto_13634 ) ( CLEAR ?auto_13631 ) ( LIFTING ?auto_13633 ?auto_13632 ) ( IS-CRATE ?auto_13632 ) ( not ( = ?auto_13631 ?auto_13632 ) ) )
    :subtasks
    ( ( !DROP ?auto_13633 ?auto_13632 ?auto_13631 ?auto_13634 )
      ( MAKE-1CRATE-VERIFY ?auto_13631 ?auto_13632 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13635 - SURFACE
      ?auto_13636 - SURFACE
      ?auto_13637 - SURFACE
    )
    :vars
    (
      ?auto_13638 - HOIST
      ?auto_13639 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13638 ?auto_13639 ) ( SURFACE-AT ?auto_13636 ?auto_13639 ) ( CLEAR ?auto_13636 ) ( LIFTING ?auto_13638 ?auto_13637 ) ( IS-CRATE ?auto_13637 ) ( not ( = ?auto_13636 ?auto_13637 ) ) ( ON ?auto_13636 ?auto_13635 ) ( not ( = ?auto_13635 ?auto_13636 ) ) ( not ( = ?auto_13635 ?auto_13637 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13636 ?auto_13637 )
      ( MAKE-2CRATE-VERIFY ?auto_13635 ?auto_13636 ?auto_13637 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13640 - SURFACE
      ?auto_13641 - SURFACE
    )
    :vars
    (
      ?auto_13642 - HOIST
      ?auto_13643 - PLACE
      ?auto_13644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13642 ?auto_13643 ) ( SURFACE-AT ?auto_13640 ?auto_13643 ) ( CLEAR ?auto_13640 ) ( IS-CRATE ?auto_13641 ) ( not ( = ?auto_13640 ?auto_13641 ) ) ( TRUCK-AT ?auto_13644 ?auto_13643 ) ( AVAILABLE ?auto_13642 ) ( IN ?auto_13641 ?auto_13644 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13642 ?auto_13641 ?auto_13644 ?auto_13643 )
      ( MAKE-1CRATE ?auto_13640 ?auto_13641 )
      ( MAKE-1CRATE-VERIFY ?auto_13640 ?auto_13641 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13645 - SURFACE
      ?auto_13646 - SURFACE
      ?auto_13647 - SURFACE
    )
    :vars
    (
      ?auto_13648 - HOIST
      ?auto_13650 - PLACE
      ?auto_13649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13648 ?auto_13650 ) ( SURFACE-AT ?auto_13646 ?auto_13650 ) ( CLEAR ?auto_13646 ) ( IS-CRATE ?auto_13647 ) ( not ( = ?auto_13646 ?auto_13647 ) ) ( TRUCK-AT ?auto_13649 ?auto_13650 ) ( AVAILABLE ?auto_13648 ) ( IN ?auto_13647 ?auto_13649 ) ( ON ?auto_13646 ?auto_13645 ) ( not ( = ?auto_13645 ?auto_13646 ) ) ( not ( = ?auto_13645 ?auto_13647 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13646 ?auto_13647 )
      ( MAKE-2CRATE-VERIFY ?auto_13645 ?auto_13646 ?auto_13647 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13651 - SURFACE
      ?auto_13652 - SURFACE
    )
    :vars
    (
      ?auto_13654 - HOIST
      ?auto_13653 - PLACE
      ?auto_13655 - TRUCK
      ?auto_13656 - SURFACE
      ?auto_13657 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13654 ?auto_13653 ) ( SURFACE-AT ?auto_13651 ?auto_13653 ) ( CLEAR ?auto_13651 ) ( IS-CRATE ?auto_13652 ) ( not ( = ?auto_13651 ?auto_13652 ) ) ( AVAILABLE ?auto_13654 ) ( IN ?auto_13652 ?auto_13655 ) ( ON ?auto_13651 ?auto_13656 ) ( not ( = ?auto_13656 ?auto_13651 ) ) ( not ( = ?auto_13656 ?auto_13652 ) ) ( TRUCK-AT ?auto_13655 ?auto_13657 ) ( not ( = ?auto_13657 ?auto_13653 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13655 ?auto_13657 ?auto_13653 )
      ( MAKE-2CRATE ?auto_13656 ?auto_13651 ?auto_13652 )
      ( MAKE-1CRATE-VERIFY ?auto_13651 ?auto_13652 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13658 - SURFACE
      ?auto_13659 - SURFACE
      ?auto_13660 - SURFACE
    )
    :vars
    (
      ?auto_13661 - HOIST
      ?auto_13663 - PLACE
      ?auto_13662 - TRUCK
      ?auto_13664 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13661 ?auto_13663 ) ( SURFACE-AT ?auto_13659 ?auto_13663 ) ( CLEAR ?auto_13659 ) ( IS-CRATE ?auto_13660 ) ( not ( = ?auto_13659 ?auto_13660 ) ) ( AVAILABLE ?auto_13661 ) ( IN ?auto_13660 ?auto_13662 ) ( ON ?auto_13659 ?auto_13658 ) ( not ( = ?auto_13658 ?auto_13659 ) ) ( not ( = ?auto_13658 ?auto_13660 ) ) ( TRUCK-AT ?auto_13662 ?auto_13664 ) ( not ( = ?auto_13664 ?auto_13663 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13659 ?auto_13660 )
      ( MAKE-2CRATE-VERIFY ?auto_13658 ?auto_13659 ?auto_13660 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13665 - SURFACE
      ?auto_13666 - SURFACE
    )
    :vars
    (
      ?auto_13670 - HOIST
      ?auto_13667 - PLACE
      ?auto_13671 - SURFACE
      ?auto_13668 - TRUCK
      ?auto_13669 - PLACE
      ?auto_13672 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13670 ?auto_13667 ) ( SURFACE-AT ?auto_13665 ?auto_13667 ) ( CLEAR ?auto_13665 ) ( IS-CRATE ?auto_13666 ) ( not ( = ?auto_13665 ?auto_13666 ) ) ( AVAILABLE ?auto_13670 ) ( ON ?auto_13665 ?auto_13671 ) ( not ( = ?auto_13671 ?auto_13665 ) ) ( not ( = ?auto_13671 ?auto_13666 ) ) ( TRUCK-AT ?auto_13668 ?auto_13669 ) ( not ( = ?auto_13669 ?auto_13667 ) ) ( HOIST-AT ?auto_13672 ?auto_13669 ) ( LIFTING ?auto_13672 ?auto_13666 ) ( not ( = ?auto_13670 ?auto_13672 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13672 ?auto_13666 ?auto_13668 ?auto_13669 )
      ( MAKE-2CRATE ?auto_13671 ?auto_13665 ?auto_13666 )
      ( MAKE-1CRATE-VERIFY ?auto_13665 ?auto_13666 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13673 - SURFACE
      ?auto_13674 - SURFACE
      ?auto_13675 - SURFACE
    )
    :vars
    (
      ?auto_13680 - HOIST
      ?auto_13679 - PLACE
      ?auto_13676 - TRUCK
      ?auto_13678 - PLACE
      ?auto_13677 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13680 ?auto_13679 ) ( SURFACE-AT ?auto_13674 ?auto_13679 ) ( CLEAR ?auto_13674 ) ( IS-CRATE ?auto_13675 ) ( not ( = ?auto_13674 ?auto_13675 ) ) ( AVAILABLE ?auto_13680 ) ( ON ?auto_13674 ?auto_13673 ) ( not ( = ?auto_13673 ?auto_13674 ) ) ( not ( = ?auto_13673 ?auto_13675 ) ) ( TRUCK-AT ?auto_13676 ?auto_13678 ) ( not ( = ?auto_13678 ?auto_13679 ) ) ( HOIST-AT ?auto_13677 ?auto_13678 ) ( LIFTING ?auto_13677 ?auto_13675 ) ( not ( = ?auto_13680 ?auto_13677 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13674 ?auto_13675 )
      ( MAKE-2CRATE-VERIFY ?auto_13673 ?auto_13674 ?auto_13675 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13681 - SURFACE
      ?auto_13682 - SURFACE
    )
    :vars
    (
      ?auto_13685 - HOIST
      ?auto_13683 - PLACE
      ?auto_13686 - SURFACE
      ?auto_13684 - TRUCK
      ?auto_13688 - PLACE
      ?auto_13687 - HOIST
      ?auto_13689 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13685 ?auto_13683 ) ( SURFACE-AT ?auto_13681 ?auto_13683 ) ( CLEAR ?auto_13681 ) ( IS-CRATE ?auto_13682 ) ( not ( = ?auto_13681 ?auto_13682 ) ) ( AVAILABLE ?auto_13685 ) ( ON ?auto_13681 ?auto_13686 ) ( not ( = ?auto_13686 ?auto_13681 ) ) ( not ( = ?auto_13686 ?auto_13682 ) ) ( TRUCK-AT ?auto_13684 ?auto_13688 ) ( not ( = ?auto_13688 ?auto_13683 ) ) ( HOIST-AT ?auto_13687 ?auto_13688 ) ( not ( = ?auto_13685 ?auto_13687 ) ) ( AVAILABLE ?auto_13687 ) ( SURFACE-AT ?auto_13682 ?auto_13688 ) ( ON ?auto_13682 ?auto_13689 ) ( CLEAR ?auto_13682 ) ( not ( = ?auto_13681 ?auto_13689 ) ) ( not ( = ?auto_13682 ?auto_13689 ) ) ( not ( = ?auto_13686 ?auto_13689 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13687 ?auto_13682 ?auto_13689 ?auto_13688 )
      ( MAKE-2CRATE ?auto_13686 ?auto_13681 ?auto_13682 )
      ( MAKE-1CRATE-VERIFY ?auto_13681 ?auto_13682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13690 - SURFACE
      ?auto_13691 - SURFACE
      ?auto_13692 - SURFACE
    )
    :vars
    (
      ?auto_13693 - HOIST
      ?auto_13696 - PLACE
      ?auto_13697 - TRUCK
      ?auto_13694 - PLACE
      ?auto_13698 - HOIST
      ?auto_13695 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13693 ?auto_13696 ) ( SURFACE-AT ?auto_13691 ?auto_13696 ) ( CLEAR ?auto_13691 ) ( IS-CRATE ?auto_13692 ) ( not ( = ?auto_13691 ?auto_13692 ) ) ( AVAILABLE ?auto_13693 ) ( ON ?auto_13691 ?auto_13690 ) ( not ( = ?auto_13690 ?auto_13691 ) ) ( not ( = ?auto_13690 ?auto_13692 ) ) ( TRUCK-AT ?auto_13697 ?auto_13694 ) ( not ( = ?auto_13694 ?auto_13696 ) ) ( HOIST-AT ?auto_13698 ?auto_13694 ) ( not ( = ?auto_13693 ?auto_13698 ) ) ( AVAILABLE ?auto_13698 ) ( SURFACE-AT ?auto_13692 ?auto_13694 ) ( ON ?auto_13692 ?auto_13695 ) ( CLEAR ?auto_13692 ) ( not ( = ?auto_13691 ?auto_13695 ) ) ( not ( = ?auto_13692 ?auto_13695 ) ) ( not ( = ?auto_13690 ?auto_13695 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13691 ?auto_13692 )
      ( MAKE-2CRATE-VERIFY ?auto_13690 ?auto_13691 ?auto_13692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13699 - SURFACE
      ?auto_13700 - SURFACE
    )
    :vars
    (
      ?auto_13707 - HOIST
      ?auto_13706 - PLACE
      ?auto_13705 - SURFACE
      ?auto_13701 - PLACE
      ?auto_13702 - HOIST
      ?auto_13704 - SURFACE
      ?auto_13703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13707 ?auto_13706 ) ( SURFACE-AT ?auto_13699 ?auto_13706 ) ( CLEAR ?auto_13699 ) ( IS-CRATE ?auto_13700 ) ( not ( = ?auto_13699 ?auto_13700 ) ) ( AVAILABLE ?auto_13707 ) ( ON ?auto_13699 ?auto_13705 ) ( not ( = ?auto_13705 ?auto_13699 ) ) ( not ( = ?auto_13705 ?auto_13700 ) ) ( not ( = ?auto_13701 ?auto_13706 ) ) ( HOIST-AT ?auto_13702 ?auto_13701 ) ( not ( = ?auto_13707 ?auto_13702 ) ) ( AVAILABLE ?auto_13702 ) ( SURFACE-AT ?auto_13700 ?auto_13701 ) ( ON ?auto_13700 ?auto_13704 ) ( CLEAR ?auto_13700 ) ( not ( = ?auto_13699 ?auto_13704 ) ) ( not ( = ?auto_13700 ?auto_13704 ) ) ( not ( = ?auto_13705 ?auto_13704 ) ) ( TRUCK-AT ?auto_13703 ?auto_13706 ) )
    :subtasks
    ( ( !DRIVE ?auto_13703 ?auto_13706 ?auto_13701 )
      ( MAKE-2CRATE ?auto_13705 ?auto_13699 ?auto_13700 )
      ( MAKE-1CRATE-VERIFY ?auto_13699 ?auto_13700 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13708 - SURFACE
      ?auto_13709 - SURFACE
      ?auto_13710 - SURFACE
    )
    :vars
    (
      ?auto_13715 - HOIST
      ?auto_13714 - PLACE
      ?auto_13712 - PLACE
      ?auto_13713 - HOIST
      ?auto_13711 - SURFACE
      ?auto_13716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13715 ?auto_13714 ) ( SURFACE-AT ?auto_13709 ?auto_13714 ) ( CLEAR ?auto_13709 ) ( IS-CRATE ?auto_13710 ) ( not ( = ?auto_13709 ?auto_13710 ) ) ( AVAILABLE ?auto_13715 ) ( ON ?auto_13709 ?auto_13708 ) ( not ( = ?auto_13708 ?auto_13709 ) ) ( not ( = ?auto_13708 ?auto_13710 ) ) ( not ( = ?auto_13712 ?auto_13714 ) ) ( HOIST-AT ?auto_13713 ?auto_13712 ) ( not ( = ?auto_13715 ?auto_13713 ) ) ( AVAILABLE ?auto_13713 ) ( SURFACE-AT ?auto_13710 ?auto_13712 ) ( ON ?auto_13710 ?auto_13711 ) ( CLEAR ?auto_13710 ) ( not ( = ?auto_13709 ?auto_13711 ) ) ( not ( = ?auto_13710 ?auto_13711 ) ) ( not ( = ?auto_13708 ?auto_13711 ) ) ( TRUCK-AT ?auto_13716 ?auto_13714 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13709 ?auto_13710 )
      ( MAKE-2CRATE-VERIFY ?auto_13708 ?auto_13709 ?auto_13710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13717 - SURFACE
      ?auto_13718 - SURFACE
    )
    :vars
    (
      ?auto_13721 - HOIST
      ?auto_13725 - PLACE
      ?auto_13724 - SURFACE
      ?auto_13723 - PLACE
      ?auto_13720 - HOIST
      ?auto_13719 - SURFACE
      ?auto_13722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13721 ?auto_13725 ) ( IS-CRATE ?auto_13718 ) ( not ( = ?auto_13717 ?auto_13718 ) ) ( not ( = ?auto_13724 ?auto_13717 ) ) ( not ( = ?auto_13724 ?auto_13718 ) ) ( not ( = ?auto_13723 ?auto_13725 ) ) ( HOIST-AT ?auto_13720 ?auto_13723 ) ( not ( = ?auto_13721 ?auto_13720 ) ) ( AVAILABLE ?auto_13720 ) ( SURFACE-AT ?auto_13718 ?auto_13723 ) ( ON ?auto_13718 ?auto_13719 ) ( CLEAR ?auto_13718 ) ( not ( = ?auto_13717 ?auto_13719 ) ) ( not ( = ?auto_13718 ?auto_13719 ) ) ( not ( = ?auto_13724 ?auto_13719 ) ) ( TRUCK-AT ?auto_13722 ?auto_13725 ) ( SURFACE-AT ?auto_13724 ?auto_13725 ) ( CLEAR ?auto_13724 ) ( LIFTING ?auto_13721 ?auto_13717 ) ( IS-CRATE ?auto_13717 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13724 ?auto_13717 )
      ( MAKE-2CRATE ?auto_13724 ?auto_13717 ?auto_13718 )
      ( MAKE-1CRATE-VERIFY ?auto_13717 ?auto_13718 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13726 - SURFACE
      ?auto_13727 - SURFACE
      ?auto_13728 - SURFACE
    )
    :vars
    (
      ?auto_13731 - HOIST
      ?auto_13730 - PLACE
      ?auto_13729 - PLACE
      ?auto_13732 - HOIST
      ?auto_13734 - SURFACE
      ?auto_13733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13731 ?auto_13730 ) ( IS-CRATE ?auto_13728 ) ( not ( = ?auto_13727 ?auto_13728 ) ) ( not ( = ?auto_13726 ?auto_13727 ) ) ( not ( = ?auto_13726 ?auto_13728 ) ) ( not ( = ?auto_13729 ?auto_13730 ) ) ( HOIST-AT ?auto_13732 ?auto_13729 ) ( not ( = ?auto_13731 ?auto_13732 ) ) ( AVAILABLE ?auto_13732 ) ( SURFACE-AT ?auto_13728 ?auto_13729 ) ( ON ?auto_13728 ?auto_13734 ) ( CLEAR ?auto_13728 ) ( not ( = ?auto_13727 ?auto_13734 ) ) ( not ( = ?auto_13728 ?auto_13734 ) ) ( not ( = ?auto_13726 ?auto_13734 ) ) ( TRUCK-AT ?auto_13733 ?auto_13730 ) ( SURFACE-AT ?auto_13726 ?auto_13730 ) ( CLEAR ?auto_13726 ) ( LIFTING ?auto_13731 ?auto_13727 ) ( IS-CRATE ?auto_13727 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13727 ?auto_13728 )
      ( MAKE-2CRATE-VERIFY ?auto_13726 ?auto_13727 ?auto_13728 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13735 - SURFACE
      ?auto_13736 - SURFACE
    )
    :vars
    (
      ?auto_13740 - HOIST
      ?auto_13739 - PLACE
      ?auto_13742 - SURFACE
      ?auto_13741 - PLACE
      ?auto_13743 - HOIST
      ?auto_13737 - SURFACE
      ?auto_13738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13740 ?auto_13739 ) ( IS-CRATE ?auto_13736 ) ( not ( = ?auto_13735 ?auto_13736 ) ) ( not ( = ?auto_13742 ?auto_13735 ) ) ( not ( = ?auto_13742 ?auto_13736 ) ) ( not ( = ?auto_13741 ?auto_13739 ) ) ( HOIST-AT ?auto_13743 ?auto_13741 ) ( not ( = ?auto_13740 ?auto_13743 ) ) ( AVAILABLE ?auto_13743 ) ( SURFACE-AT ?auto_13736 ?auto_13741 ) ( ON ?auto_13736 ?auto_13737 ) ( CLEAR ?auto_13736 ) ( not ( = ?auto_13735 ?auto_13737 ) ) ( not ( = ?auto_13736 ?auto_13737 ) ) ( not ( = ?auto_13742 ?auto_13737 ) ) ( TRUCK-AT ?auto_13738 ?auto_13739 ) ( SURFACE-AT ?auto_13742 ?auto_13739 ) ( CLEAR ?auto_13742 ) ( IS-CRATE ?auto_13735 ) ( AVAILABLE ?auto_13740 ) ( IN ?auto_13735 ?auto_13738 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13740 ?auto_13735 ?auto_13738 ?auto_13739 )
      ( MAKE-2CRATE ?auto_13742 ?auto_13735 ?auto_13736 )
      ( MAKE-1CRATE-VERIFY ?auto_13735 ?auto_13736 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13744 - SURFACE
      ?auto_13745 - SURFACE
      ?auto_13746 - SURFACE
    )
    :vars
    (
      ?auto_13752 - HOIST
      ?auto_13747 - PLACE
      ?auto_13750 - PLACE
      ?auto_13751 - HOIST
      ?auto_13748 - SURFACE
      ?auto_13749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13752 ?auto_13747 ) ( IS-CRATE ?auto_13746 ) ( not ( = ?auto_13745 ?auto_13746 ) ) ( not ( = ?auto_13744 ?auto_13745 ) ) ( not ( = ?auto_13744 ?auto_13746 ) ) ( not ( = ?auto_13750 ?auto_13747 ) ) ( HOIST-AT ?auto_13751 ?auto_13750 ) ( not ( = ?auto_13752 ?auto_13751 ) ) ( AVAILABLE ?auto_13751 ) ( SURFACE-AT ?auto_13746 ?auto_13750 ) ( ON ?auto_13746 ?auto_13748 ) ( CLEAR ?auto_13746 ) ( not ( = ?auto_13745 ?auto_13748 ) ) ( not ( = ?auto_13746 ?auto_13748 ) ) ( not ( = ?auto_13744 ?auto_13748 ) ) ( TRUCK-AT ?auto_13749 ?auto_13747 ) ( SURFACE-AT ?auto_13744 ?auto_13747 ) ( CLEAR ?auto_13744 ) ( IS-CRATE ?auto_13745 ) ( AVAILABLE ?auto_13752 ) ( IN ?auto_13745 ?auto_13749 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13745 ?auto_13746 )
      ( MAKE-2CRATE-VERIFY ?auto_13744 ?auto_13745 ?auto_13746 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13753 - SURFACE
      ?auto_13754 - SURFACE
    )
    :vars
    (
      ?auto_13761 - HOIST
      ?auto_13759 - PLACE
      ?auto_13758 - SURFACE
      ?auto_13760 - PLACE
      ?auto_13757 - HOIST
      ?auto_13756 - SURFACE
      ?auto_13755 - TRUCK
      ?auto_13762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13761 ?auto_13759 ) ( IS-CRATE ?auto_13754 ) ( not ( = ?auto_13753 ?auto_13754 ) ) ( not ( = ?auto_13758 ?auto_13753 ) ) ( not ( = ?auto_13758 ?auto_13754 ) ) ( not ( = ?auto_13760 ?auto_13759 ) ) ( HOIST-AT ?auto_13757 ?auto_13760 ) ( not ( = ?auto_13761 ?auto_13757 ) ) ( AVAILABLE ?auto_13757 ) ( SURFACE-AT ?auto_13754 ?auto_13760 ) ( ON ?auto_13754 ?auto_13756 ) ( CLEAR ?auto_13754 ) ( not ( = ?auto_13753 ?auto_13756 ) ) ( not ( = ?auto_13754 ?auto_13756 ) ) ( not ( = ?auto_13758 ?auto_13756 ) ) ( SURFACE-AT ?auto_13758 ?auto_13759 ) ( CLEAR ?auto_13758 ) ( IS-CRATE ?auto_13753 ) ( AVAILABLE ?auto_13761 ) ( IN ?auto_13753 ?auto_13755 ) ( TRUCK-AT ?auto_13755 ?auto_13762 ) ( not ( = ?auto_13762 ?auto_13759 ) ) ( not ( = ?auto_13760 ?auto_13762 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13755 ?auto_13762 ?auto_13759 )
      ( MAKE-2CRATE ?auto_13758 ?auto_13753 ?auto_13754 )
      ( MAKE-1CRATE-VERIFY ?auto_13753 ?auto_13754 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13763 - SURFACE
      ?auto_13764 - SURFACE
      ?auto_13765 - SURFACE
    )
    :vars
    (
      ?auto_13770 - HOIST
      ?auto_13767 - PLACE
      ?auto_13768 - PLACE
      ?auto_13769 - HOIST
      ?auto_13766 - SURFACE
      ?auto_13771 - TRUCK
      ?auto_13772 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13770 ?auto_13767 ) ( IS-CRATE ?auto_13765 ) ( not ( = ?auto_13764 ?auto_13765 ) ) ( not ( = ?auto_13763 ?auto_13764 ) ) ( not ( = ?auto_13763 ?auto_13765 ) ) ( not ( = ?auto_13768 ?auto_13767 ) ) ( HOIST-AT ?auto_13769 ?auto_13768 ) ( not ( = ?auto_13770 ?auto_13769 ) ) ( AVAILABLE ?auto_13769 ) ( SURFACE-AT ?auto_13765 ?auto_13768 ) ( ON ?auto_13765 ?auto_13766 ) ( CLEAR ?auto_13765 ) ( not ( = ?auto_13764 ?auto_13766 ) ) ( not ( = ?auto_13765 ?auto_13766 ) ) ( not ( = ?auto_13763 ?auto_13766 ) ) ( SURFACE-AT ?auto_13763 ?auto_13767 ) ( CLEAR ?auto_13763 ) ( IS-CRATE ?auto_13764 ) ( AVAILABLE ?auto_13770 ) ( IN ?auto_13764 ?auto_13771 ) ( TRUCK-AT ?auto_13771 ?auto_13772 ) ( not ( = ?auto_13772 ?auto_13767 ) ) ( not ( = ?auto_13768 ?auto_13772 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13764 ?auto_13765 )
      ( MAKE-2CRATE-VERIFY ?auto_13763 ?auto_13764 ?auto_13765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13773 - SURFACE
      ?auto_13774 - SURFACE
    )
    :vars
    (
      ?auto_13781 - HOIST
      ?auto_13776 - PLACE
      ?auto_13780 - SURFACE
      ?auto_13778 - PLACE
      ?auto_13775 - HOIST
      ?auto_13779 - SURFACE
      ?auto_13782 - TRUCK
      ?auto_13777 - PLACE
      ?auto_13783 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13781 ?auto_13776 ) ( IS-CRATE ?auto_13774 ) ( not ( = ?auto_13773 ?auto_13774 ) ) ( not ( = ?auto_13780 ?auto_13773 ) ) ( not ( = ?auto_13780 ?auto_13774 ) ) ( not ( = ?auto_13778 ?auto_13776 ) ) ( HOIST-AT ?auto_13775 ?auto_13778 ) ( not ( = ?auto_13781 ?auto_13775 ) ) ( AVAILABLE ?auto_13775 ) ( SURFACE-AT ?auto_13774 ?auto_13778 ) ( ON ?auto_13774 ?auto_13779 ) ( CLEAR ?auto_13774 ) ( not ( = ?auto_13773 ?auto_13779 ) ) ( not ( = ?auto_13774 ?auto_13779 ) ) ( not ( = ?auto_13780 ?auto_13779 ) ) ( SURFACE-AT ?auto_13780 ?auto_13776 ) ( CLEAR ?auto_13780 ) ( IS-CRATE ?auto_13773 ) ( AVAILABLE ?auto_13781 ) ( TRUCK-AT ?auto_13782 ?auto_13777 ) ( not ( = ?auto_13777 ?auto_13776 ) ) ( not ( = ?auto_13778 ?auto_13777 ) ) ( HOIST-AT ?auto_13783 ?auto_13777 ) ( LIFTING ?auto_13783 ?auto_13773 ) ( not ( = ?auto_13781 ?auto_13783 ) ) ( not ( = ?auto_13775 ?auto_13783 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13783 ?auto_13773 ?auto_13782 ?auto_13777 )
      ( MAKE-2CRATE ?auto_13780 ?auto_13773 ?auto_13774 )
      ( MAKE-1CRATE-VERIFY ?auto_13773 ?auto_13774 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13784 - SURFACE
      ?auto_13785 - SURFACE
      ?auto_13786 - SURFACE
    )
    :vars
    (
      ?auto_13791 - HOIST
      ?auto_13793 - PLACE
      ?auto_13787 - PLACE
      ?auto_13794 - HOIST
      ?auto_13790 - SURFACE
      ?auto_13788 - TRUCK
      ?auto_13792 - PLACE
      ?auto_13789 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13791 ?auto_13793 ) ( IS-CRATE ?auto_13786 ) ( not ( = ?auto_13785 ?auto_13786 ) ) ( not ( = ?auto_13784 ?auto_13785 ) ) ( not ( = ?auto_13784 ?auto_13786 ) ) ( not ( = ?auto_13787 ?auto_13793 ) ) ( HOIST-AT ?auto_13794 ?auto_13787 ) ( not ( = ?auto_13791 ?auto_13794 ) ) ( AVAILABLE ?auto_13794 ) ( SURFACE-AT ?auto_13786 ?auto_13787 ) ( ON ?auto_13786 ?auto_13790 ) ( CLEAR ?auto_13786 ) ( not ( = ?auto_13785 ?auto_13790 ) ) ( not ( = ?auto_13786 ?auto_13790 ) ) ( not ( = ?auto_13784 ?auto_13790 ) ) ( SURFACE-AT ?auto_13784 ?auto_13793 ) ( CLEAR ?auto_13784 ) ( IS-CRATE ?auto_13785 ) ( AVAILABLE ?auto_13791 ) ( TRUCK-AT ?auto_13788 ?auto_13792 ) ( not ( = ?auto_13792 ?auto_13793 ) ) ( not ( = ?auto_13787 ?auto_13792 ) ) ( HOIST-AT ?auto_13789 ?auto_13792 ) ( LIFTING ?auto_13789 ?auto_13785 ) ( not ( = ?auto_13791 ?auto_13789 ) ) ( not ( = ?auto_13794 ?auto_13789 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13785 ?auto_13786 )
      ( MAKE-2CRATE-VERIFY ?auto_13784 ?auto_13785 ?auto_13786 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13795 - SURFACE
      ?auto_13796 - SURFACE
    )
    :vars
    (
      ?auto_13799 - HOIST
      ?auto_13804 - PLACE
      ?auto_13800 - SURFACE
      ?auto_13801 - PLACE
      ?auto_13798 - HOIST
      ?auto_13805 - SURFACE
      ?auto_13803 - TRUCK
      ?auto_13797 - PLACE
      ?auto_13802 - HOIST
      ?auto_13806 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13799 ?auto_13804 ) ( IS-CRATE ?auto_13796 ) ( not ( = ?auto_13795 ?auto_13796 ) ) ( not ( = ?auto_13800 ?auto_13795 ) ) ( not ( = ?auto_13800 ?auto_13796 ) ) ( not ( = ?auto_13801 ?auto_13804 ) ) ( HOIST-AT ?auto_13798 ?auto_13801 ) ( not ( = ?auto_13799 ?auto_13798 ) ) ( AVAILABLE ?auto_13798 ) ( SURFACE-AT ?auto_13796 ?auto_13801 ) ( ON ?auto_13796 ?auto_13805 ) ( CLEAR ?auto_13796 ) ( not ( = ?auto_13795 ?auto_13805 ) ) ( not ( = ?auto_13796 ?auto_13805 ) ) ( not ( = ?auto_13800 ?auto_13805 ) ) ( SURFACE-AT ?auto_13800 ?auto_13804 ) ( CLEAR ?auto_13800 ) ( IS-CRATE ?auto_13795 ) ( AVAILABLE ?auto_13799 ) ( TRUCK-AT ?auto_13803 ?auto_13797 ) ( not ( = ?auto_13797 ?auto_13804 ) ) ( not ( = ?auto_13801 ?auto_13797 ) ) ( HOIST-AT ?auto_13802 ?auto_13797 ) ( not ( = ?auto_13799 ?auto_13802 ) ) ( not ( = ?auto_13798 ?auto_13802 ) ) ( AVAILABLE ?auto_13802 ) ( SURFACE-AT ?auto_13795 ?auto_13797 ) ( ON ?auto_13795 ?auto_13806 ) ( CLEAR ?auto_13795 ) ( not ( = ?auto_13795 ?auto_13806 ) ) ( not ( = ?auto_13796 ?auto_13806 ) ) ( not ( = ?auto_13800 ?auto_13806 ) ) ( not ( = ?auto_13805 ?auto_13806 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13802 ?auto_13795 ?auto_13806 ?auto_13797 )
      ( MAKE-2CRATE ?auto_13800 ?auto_13795 ?auto_13796 )
      ( MAKE-1CRATE-VERIFY ?auto_13795 ?auto_13796 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13807 - SURFACE
      ?auto_13808 - SURFACE
      ?auto_13809 - SURFACE
    )
    :vars
    (
      ?auto_13810 - HOIST
      ?auto_13813 - PLACE
      ?auto_13816 - PLACE
      ?auto_13817 - HOIST
      ?auto_13815 - SURFACE
      ?auto_13818 - TRUCK
      ?auto_13812 - PLACE
      ?auto_13814 - HOIST
      ?auto_13811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13810 ?auto_13813 ) ( IS-CRATE ?auto_13809 ) ( not ( = ?auto_13808 ?auto_13809 ) ) ( not ( = ?auto_13807 ?auto_13808 ) ) ( not ( = ?auto_13807 ?auto_13809 ) ) ( not ( = ?auto_13816 ?auto_13813 ) ) ( HOIST-AT ?auto_13817 ?auto_13816 ) ( not ( = ?auto_13810 ?auto_13817 ) ) ( AVAILABLE ?auto_13817 ) ( SURFACE-AT ?auto_13809 ?auto_13816 ) ( ON ?auto_13809 ?auto_13815 ) ( CLEAR ?auto_13809 ) ( not ( = ?auto_13808 ?auto_13815 ) ) ( not ( = ?auto_13809 ?auto_13815 ) ) ( not ( = ?auto_13807 ?auto_13815 ) ) ( SURFACE-AT ?auto_13807 ?auto_13813 ) ( CLEAR ?auto_13807 ) ( IS-CRATE ?auto_13808 ) ( AVAILABLE ?auto_13810 ) ( TRUCK-AT ?auto_13818 ?auto_13812 ) ( not ( = ?auto_13812 ?auto_13813 ) ) ( not ( = ?auto_13816 ?auto_13812 ) ) ( HOIST-AT ?auto_13814 ?auto_13812 ) ( not ( = ?auto_13810 ?auto_13814 ) ) ( not ( = ?auto_13817 ?auto_13814 ) ) ( AVAILABLE ?auto_13814 ) ( SURFACE-AT ?auto_13808 ?auto_13812 ) ( ON ?auto_13808 ?auto_13811 ) ( CLEAR ?auto_13808 ) ( not ( = ?auto_13808 ?auto_13811 ) ) ( not ( = ?auto_13809 ?auto_13811 ) ) ( not ( = ?auto_13807 ?auto_13811 ) ) ( not ( = ?auto_13815 ?auto_13811 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13808 ?auto_13809 )
      ( MAKE-2CRATE-VERIFY ?auto_13807 ?auto_13808 ?auto_13809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13819 - SURFACE
      ?auto_13820 - SURFACE
    )
    :vars
    (
      ?auto_13830 - HOIST
      ?auto_13826 - PLACE
      ?auto_13827 - SURFACE
      ?auto_13821 - PLACE
      ?auto_13825 - HOIST
      ?auto_13822 - SURFACE
      ?auto_13823 - PLACE
      ?auto_13829 - HOIST
      ?auto_13828 - SURFACE
      ?auto_13824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13830 ?auto_13826 ) ( IS-CRATE ?auto_13820 ) ( not ( = ?auto_13819 ?auto_13820 ) ) ( not ( = ?auto_13827 ?auto_13819 ) ) ( not ( = ?auto_13827 ?auto_13820 ) ) ( not ( = ?auto_13821 ?auto_13826 ) ) ( HOIST-AT ?auto_13825 ?auto_13821 ) ( not ( = ?auto_13830 ?auto_13825 ) ) ( AVAILABLE ?auto_13825 ) ( SURFACE-AT ?auto_13820 ?auto_13821 ) ( ON ?auto_13820 ?auto_13822 ) ( CLEAR ?auto_13820 ) ( not ( = ?auto_13819 ?auto_13822 ) ) ( not ( = ?auto_13820 ?auto_13822 ) ) ( not ( = ?auto_13827 ?auto_13822 ) ) ( SURFACE-AT ?auto_13827 ?auto_13826 ) ( CLEAR ?auto_13827 ) ( IS-CRATE ?auto_13819 ) ( AVAILABLE ?auto_13830 ) ( not ( = ?auto_13823 ?auto_13826 ) ) ( not ( = ?auto_13821 ?auto_13823 ) ) ( HOIST-AT ?auto_13829 ?auto_13823 ) ( not ( = ?auto_13830 ?auto_13829 ) ) ( not ( = ?auto_13825 ?auto_13829 ) ) ( AVAILABLE ?auto_13829 ) ( SURFACE-AT ?auto_13819 ?auto_13823 ) ( ON ?auto_13819 ?auto_13828 ) ( CLEAR ?auto_13819 ) ( not ( = ?auto_13819 ?auto_13828 ) ) ( not ( = ?auto_13820 ?auto_13828 ) ) ( not ( = ?auto_13827 ?auto_13828 ) ) ( not ( = ?auto_13822 ?auto_13828 ) ) ( TRUCK-AT ?auto_13824 ?auto_13826 ) )
    :subtasks
    ( ( !DRIVE ?auto_13824 ?auto_13826 ?auto_13823 )
      ( MAKE-2CRATE ?auto_13827 ?auto_13819 ?auto_13820 )
      ( MAKE-1CRATE-VERIFY ?auto_13819 ?auto_13820 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13831 - SURFACE
      ?auto_13832 - SURFACE
      ?auto_13833 - SURFACE
    )
    :vars
    (
      ?auto_13835 - HOIST
      ?auto_13841 - PLACE
      ?auto_13842 - PLACE
      ?auto_13837 - HOIST
      ?auto_13838 - SURFACE
      ?auto_13840 - PLACE
      ?auto_13834 - HOIST
      ?auto_13836 - SURFACE
      ?auto_13839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13835 ?auto_13841 ) ( IS-CRATE ?auto_13833 ) ( not ( = ?auto_13832 ?auto_13833 ) ) ( not ( = ?auto_13831 ?auto_13832 ) ) ( not ( = ?auto_13831 ?auto_13833 ) ) ( not ( = ?auto_13842 ?auto_13841 ) ) ( HOIST-AT ?auto_13837 ?auto_13842 ) ( not ( = ?auto_13835 ?auto_13837 ) ) ( AVAILABLE ?auto_13837 ) ( SURFACE-AT ?auto_13833 ?auto_13842 ) ( ON ?auto_13833 ?auto_13838 ) ( CLEAR ?auto_13833 ) ( not ( = ?auto_13832 ?auto_13838 ) ) ( not ( = ?auto_13833 ?auto_13838 ) ) ( not ( = ?auto_13831 ?auto_13838 ) ) ( SURFACE-AT ?auto_13831 ?auto_13841 ) ( CLEAR ?auto_13831 ) ( IS-CRATE ?auto_13832 ) ( AVAILABLE ?auto_13835 ) ( not ( = ?auto_13840 ?auto_13841 ) ) ( not ( = ?auto_13842 ?auto_13840 ) ) ( HOIST-AT ?auto_13834 ?auto_13840 ) ( not ( = ?auto_13835 ?auto_13834 ) ) ( not ( = ?auto_13837 ?auto_13834 ) ) ( AVAILABLE ?auto_13834 ) ( SURFACE-AT ?auto_13832 ?auto_13840 ) ( ON ?auto_13832 ?auto_13836 ) ( CLEAR ?auto_13832 ) ( not ( = ?auto_13832 ?auto_13836 ) ) ( not ( = ?auto_13833 ?auto_13836 ) ) ( not ( = ?auto_13831 ?auto_13836 ) ) ( not ( = ?auto_13838 ?auto_13836 ) ) ( TRUCK-AT ?auto_13839 ?auto_13841 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13832 ?auto_13833 )
      ( MAKE-2CRATE-VERIFY ?auto_13831 ?auto_13832 ?auto_13833 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13852 - SURFACE
      ?auto_13853 - SURFACE
    )
    :vars
    (
      ?auto_13854 - HOIST
      ?auto_13855 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13854 ?auto_13855 ) ( SURFACE-AT ?auto_13852 ?auto_13855 ) ( CLEAR ?auto_13852 ) ( LIFTING ?auto_13854 ?auto_13853 ) ( IS-CRATE ?auto_13853 ) ( not ( = ?auto_13852 ?auto_13853 ) ) )
    :subtasks
    ( ( !DROP ?auto_13854 ?auto_13853 ?auto_13852 ?auto_13855 )
      ( MAKE-1CRATE-VERIFY ?auto_13852 ?auto_13853 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13856 - SURFACE
      ?auto_13857 - SURFACE
      ?auto_13858 - SURFACE
    )
    :vars
    (
      ?auto_13860 - HOIST
      ?auto_13859 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13860 ?auto_13859 ) ( SURFACE-AT ?auto_13857 ?auto_13859 ) ( CLEAR ?auto_13857 ) ( LIFTING ?auto_13860 ?auto_13858 ) ( IS-CRATE ?auto_13858 ) ( not ( = ?auto_13857 ?auto_13858 ) ) ( ON ?auto_13857 ?auto_13856 ) ( not ( = ?auto_13856 ?auto_13857 ) ) ( not ( = ?auto_13856 ?auto_13858 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13857 ?auto_13858 )
      ( MAKE-2CRATE-VERIFY ?auto_13856 ?auto_13857 ?auto_13858 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13861 - SURFACE
      ?auto_13862 - SURFACE
      ?auto_13863 - SURFACE
      ?auto_13864 - SURFACE
    )
    :vars
    (
      ?auto_13866 - HOIST
      ?auto_13865 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13866 ?auto_13865 ) ( SURFACE-AT ?auto_13863 ?auto_13865 ) ( CLEAR ?auto_13863 ) ( LIFTING ?auto_13866 ?auto_13864 ) ( IS-CRATE ?auto_13864 ) ( not ( = ?auto_13863 ?auto_13864 ) ) ( ON ?auto_13862 ?auto_13861 ) ( ON ?auto_13863 ?auto_13862 ) ( not ( = ?auto_13861 ?auto_13862 ) ) ( not ( = ?auto_13861 ?auto_13863 ) ) ( not ( = ?auto_13861 ?auto_13864 ) ) ( not ( = ?auto_13862 ?auto_13863 ) ) ( not ( = ?auto_13862 ?auto_13864 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13863 ?auto_13864 )
      ( MAKE-3CRATE-VERIFY ?auto_13861 ?auto_13862 ?auto_13863 ?auto_13864 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13867 - SURFACE
      ?auto_13868 - SURFACE
    )
    :vars
    (
      ?auto_13870 - HOIST
      ?auto_13869 - PLACE
      ?auto_13871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13870 ?auto_13869 ) ( SURFACE-AT ?auto_13867 ?auto_13869 ) ( CLEAR ?auto_13867 ) ( IS-CRATE ?auto_13868 ) ( not ( = ?auto_13867 ?auto_13868 ) ) ( TRUCK-AT ?auto_13871 ?auto_13869 ) ( AVAILABLE ?auto_13870 ) ( IN ?auto_13868 ?auto_13871 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13870 ?auto_13868 ?auto_13871 ?auto_13869 )
      ( MAKE-1CRATE ?auto_13867 ?auto_13868 )
      ( MAKE-1CRATE-VERIFY ?auto_13867 ?auto_13868 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13872 - SURFACE
      ?auto_13873 - SURFACE
      ?auto_13874 - SURFACE
    )
    :vars
    (
      ?auto_13875 - HOIST
      ?auto_13877 - PLACE
      ?auto_13876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13875 ?auto_13877 ) ( SURFACE-AT ?auto_13873 ?auto_13877 ) ( CLEAR ?auto_13873 ) ( IS-CRATE ?auto_13874 ) ( not ( = ?auto_13873 ?auto_13874 ) ) ( TRUCK-AT ?auto_13876 ?auto_13877 ) ( AVAILABLE ?auto_13875 ) ( IN ?auto_13874 ?auto_13876 ) ( ON ?auto_13873 ?auto_13872 ) ( not ( = ?auto_13872 ?auto_13873 ) ) ( not ( = ?auto_13872 ?auto_13874 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13873 ?auto_13874 )
      ( MAKE-2CRATE-VERIFY ?auto_13872 ?auto_13873 ?auto_13874 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13878 - SURFACE
      ?auto_13879 - SURFACE
      ?auto_13880 - SURFACE
      ?auto_13881 - SURFACE
    )
    :vars
    (
      ?auto_13883 - HOIST
      ?auto_13884 - PLACE
      ?auto_13882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13883 ?auto_13884 ) ( SURFACE-AT ?auto_13880 ?auto_13884 ) ( CLEAR ?auto_13880 ) ( IS-CRATE ?auto_13881 ) ( not ( = ?auto_13880 ?auto_13881 ) ) ( TRUCK-AT ?auto_13882 ?auto_13884 ) ( AVAILABLE ?auto_13883 ) ( IN ?auto_13881 ?auto_13882 ) ( ON ?auto_13880 ?auto_13879 ) ( not ( = ?auto_13879 ?auto_13880 ) ) ( not ( = ?auto_13879 ?auto_13881 ) ) ( ON ?auto_13879 ?auto_13878 ) ( not ( = ?auto_13878 ?auto_13879 ) ) ( not ( = ?auto_13878 ?auto_13880 ) ) ( not ( = ?auto_13878 ?auto_13881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13879 ?auto_13880 ?auto_13881 )
      ( MAKE-3CRATE-VERIFY ?auto_13878 ?auto_13879 ?auto_13880 ?auto_13881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13885 - SURFACE
      ?auto_13886 - SURFACE
    )
    :vars
    (
      ?auto_13888 - HOIST
      ?auto_13890 - PLACE
      ?auto_13887 - TRUCK
      ?auto_13889 - SURFACE
      ?auto_13891 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13888 ?auto_13890 ) ( SURFACE-AT ?auto_13885 ?auto_13890 ) ( CLEAR ?auto_13885 ) ( IS-CRATE ?auto_13886 ) ( not ( = ?auto_13885 ?auto_13886 ) ) ( AVAILABLE ?auto_13888 ) ( IN ?auto_13886 ?auto_13887 ) ( ON ?auto_13885 ?auto_13889 ) ( not ( = ?auto_13889 ?auto_13885 ) ) ( not ( = ?auto_13889 ?auto_13886 ) ) ( TRUCK-AT ?auto_13887 ?auto_13891 ) ( not ( = ?auto_13891 ?auto_13890 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13887 ?auto_13891 ?auto_13890 )
      ( MAKE-2CRATE ?auto_13889 ?auto_13885 ?auto_13886 )
      ( MAKE-1CRATE-VERIFY ?auto_13885 ?auto_13886 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13892 - SURFACE
      ?auto_13893 - SURFACE
      ?auto_13894 - SURFACE
    )
    :vars
    (
      ?auto_13896 - HOIST
      ?auto_13897 - PLACE
      ?auto_13898 - TRUCK
      ?auto_13895 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13896 ?auto_13897 ) ( SURFACE-AT ?auto_13893 ?auto_13897 ) ( CLEAR ?auto_13893 ) ( IS-CRATE ?auto_13894 ) ( not ( = ?auto_13893 ?auto_13894 ) ) ( AVAILABLE ?auto_13896 ) ( IN ?auto_13894 ?auto_13898 ) ( ON ?auto_13893 ?auto_13892 ) ( not ( = ?auto_13892 ?auto_13893 ) ) ( not ( = ?auto_13892 ?auto_13894 ) ) ( TRUCK-AT ?auto_13898 ?auto_13895 ) ( not ( = ?auto_13895 ?auto_13897 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13893 ?auto_13894 )
      ( MAKE-2CRATE-VERIFY ?auto_13892 ?auto_13893 ?auto_13894 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13899 - SURFACE
      ?auto_13900 - SURFACE
      ?auto_13901 - SURFACE
      ?auto_13902 - SURFACE
    )
    :vars
    (
      ?auto_13904 - HOIST
      ?auto_13905 - PLACE
      ?auto_13903 - TRUCK
      ?auto_13906 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13904 ?auto_13905 ) ( SURFACE-AT ?auto_13901 ?auto_13905 ) ( CLEAR ?auto_13901 ) ( IS-CRATE ?auto_13902 ) ( not ( = ?auto_13901 ?auto_13902 ) ) ( AVAILABLE ?auto_13904 ) ( IN ?auto_13902 ?auto_13903 ) ( ON ?auto_13901 ?auto_13900 ) ( not ( = ?auto_13900 ?auto_13901 ) ) ( not ( = ?auto_13900 ?auto_13902 ) ) ( TRUCK-AT ?auto_13903 ?auto_13906 ) ( not ( = ?auto_13906 ?auto_13905 ) ) ( ON ?auto_13900 ?auto_13899 ) ( not ( = ?auto_13899 ?auto_13900 ) ) ( not ( = ?auto_13899 ?auto_13901 ) ) ( not ( = ?auto_13899 ?auto_13902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13900 ?auto_13901 ?auto_13902 )
      ( MAKE-3CRATE-VERIFY ?auto_13899 ?auto_13900 ?auto_13901 ?auto_13902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13907 - SURFACE
      ?auto_13908 - SURFACE
    )
    :vars
    (
      ?auto_13910 - HOIST
      ?auto_13911 - PLACE
      ?auto_13912 - SURFACE
      ?auto_13909 - TRUCK
      ?auto_13913 - PLACE
      ?auto_13914 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13910 ?auto_13911 ) ( SURFACE-AT ?auto_13907 ?auto_13911 ) ( CLEAR ?auto_13907 ) ( IS-CRATE ?auto_13908 ) ( not ( = ?auto_13907 ?auto_13908 ) ) ( AVAILABLE ?auto_13910 ) ( ON ?auto_13907 ?auto_13912 ) ( not ( = ?auto_13912 ?auto_13907 ) ) ( not ( = ?auto_13912 ?auto_13908 ) ) ( TRUCK-AT ?auto_13909 ?auto_13913 ) ( not ( = ?auto_13913 ?auto_13911 ) ) ( HOIST-AT ?auto_13914 ?auto_13913 ) ( LIFTING ?auto_13914 ?auto_13908 ) ( not ( = ?auto_13910 ?auto_13914 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13914 ?auto_13908 ?auto_13909 ?auto_13913 )
      ( MAKE-2CRATE ?auto_13912 ?auto_13907 ?auto_13908 )
      ( MAKE-1CRATE-VERIFY ?auto_13907 ?auto_13908 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13915 - SURFACE
      ?auto_13916 - SURFACE
      ?auto_13917 - SURFACE
    )
    :vars
    (
      ?auto_13920 - HOIST
      ?auto_13919 - PLACE
      ?auto_13918 - TRUCK
      ?auto_13922 - PLACE
      ?auto_13921 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13920 ?auto_13919 ) ( SURFACE-AT ?auto_13916 ?auto_13919 ) ( CLEAR ?auto_13916 ) ( IS-CRATE ?auto_13917 ) ( not ( = ?auto_13916 ?auto_13917 ) ) ( AVAILABLE ?auto_13920 ) ( ON ?auto_13916 ?auto_13915 ) ( not ( = ?auto_13915 ?auto_13916 ) ) ( not ( = ?auto_13915 ?auto_13917 ) ) ( TRUCK-AT ?auto_13918 ?auto_13922 ) ( not ( = ?auto_13922 ?auto_13919 ) ) ( HOIST-AT ?auto_13921 ?auto_13922 ) ( LIFTING ?auto_13921 ?auto_13917 ) ( not ( = ?auto_13920 ?auto_13921 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13916 ?auto_13917 )
      ( MAKE-2CRATE-VERIFY ?auto_13915 ?auto_13916 ?auto_13917 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13923 - SURFACE
      ?auto_13924 - SURFACE
      ?auto_13925 - SURFACE
      ?auto_13926 - SURFACE
    )
    :vars
    (
      ?auto_13928 - HOIST
      ?auto_13930 - PLACE
      ?auto_13929 - TRUCK
      ?auto_13927 - PLACE
      ?auto_13931 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13928 ?auto_13930 ) ( SURFACE-AT ?auto_13925 ?auto_13930 ) ( CLEAR ?auto_13925 ) ( IS-CRATE ?auto_13926 ) ( not ( = ?auto_13925 ?auto_13926 ) ) ( AVAILABLE ?auto_13928 ) ( ON ?auto_13925 ?auto_13924 ) ( not ( = ?auto_13924 ?auto_13925 ) ) ( not ( = ?auto_13924 ?auto_13926 ) ) ( TRUCK-AT ?auto_13929 ?auto_13927 ) ( not ( = ?auto_13927 ?auto_13930 ) ) ( HOIST-AT ?auto_13931 ?auto_13927 ) ( LIFTING ?auto_13931 ?auto_13926 ) ( not ( = ?auto_13928 ?auto_13931 ) ) ( ON ?auto_13924 ?auto_13923 ) ( not ( = ?auto_13923 ?auto_13924 ) ) ( not ( = ?auto_13923 ?auto_13925 ) ) ( not ( = ?auto_13923 ?auto_13926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13924 ?auto_13925 ?auto_13926 )
      ( MAKE-3CRATE-VERIFY ?auto_13923 ?auto_13924 ?auto_13925 ?auto_13926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13932 - SURFACE
      ?auto_13933 - SURFACE
    )
    :vars
    (
      ?auto_13936 - HOIST
      ?auto_13938 - PLACE
      ?auto_13934 - SURFACE
      ?auto_13937 - TRUCK
      ?auto_13935 - PLACE
      ?auto_13939 - HOIST
      ?auto_13940 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13936 ?auto_13938 ) ( SURFACE-AT ?auto_13932 ?auto_13938 ) ( CLEAR ?auto_13932 ) ( IS-CRATE ?auto_13933 ) ( not ( = ?auto_13932 ?auto_13933 ) ) ( AVAILABLE ?auto_13936 ) ( ON ?auto_13932 ?auto_13934 ) ( not ( = ?auto_13934 ?auto_13932 ) ) ( not ( = ?auto_13934 ?auto_13933 ) ) ( TRUCK-AT ?auto_13937 ?auto_13935 ) ( not ( = ?auto_13935 ?auto_13938 ) ) ( HOIST-AT ?auto_13939 ?auto_13935 ) ( not ( = ?auto_13936 ?auto_13939 ) ) ( AVAILABLE ?auto_13939 ) ( SURFACE-AT ?auto_13933 ?auto_13935 ) ( ON ?auto_13933 ?auto_13940 ) ( CLEAR ?auto_13933 ) ( not ( = ?auto_13932 ?auto_13940 ) ) ( not ( = ?auto_13933 ?auto_13940 ) ) ( not ( = ?auto_13934 ?auto_13940 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13939 ?auto_13933 ?auto_13940 ?auto_13935 )
      ( MAKE-2CRATE ?auto_13934 ?auto_13932 ?auto_13933 )
      ( MAKE-1CRATE-VERIFY ?auto_13932 ?auto_13933 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13941 - SURFACE
      ?auto_13942 - SURFACE
      ?auto_13943 - SURFACE
    )
    :vars
    (
      ?auto_13948 - HOIST
      ?auto_13945 - PLACE
      ?auto_13949 - TRUCK
      ?auto_13946 - PLACE
      ?auto_13944 - HOIST
      ?auto_13947 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13948 ?auto_13945 ) ( SURFACE-AT ?auto_13942 ?auto_13945 ) ( CLEAR ?auto_13942 ) ( IS-CRATE ?auto_13943 ) ( not ( = ?auto_13942 ?auto_13943 ) ) ( AVAILABLE ?auto_13948 ) ( ON ?auto_13942 ?auto_13941 ) ( not ( = ?auto_13941 ?auto_13942 ) ) ( not ( = ?auto_13941 ?auto_13943 ) ) ( TRUCK-AT ?auto_13949 ?auto_13946 ) ( not ( = ?auto_13946 ?auto_13945 ) ) ( HOIST-AT ?auto_13944 ?auto_13946 ) ( not ( = ?auto_13948 ?auto_13944 ) ) ( AVAILABLE ?auto_13944 ) ( SURFACE-AT ?auto_13943 ?auto_13946 ) ( ON ?auto_13943 ?auto_13947 ) ( CLEAR ?auto_13943 ) ( not ( = ?auto_13942 ?auto_13947 ) ) ( not ( = ?auto_13943 ?auto_13947 ) ) ( not ( = ?auto_13941 ?auto_13947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13942 ?auto_13943 )
      ( MAKE-2CRATE-VERIFY ?auto_13941 ?auto_13942 ?auto_13943 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13950 - SURFACE
      ?auto_13951 - SURFACE
      ?auto_13952 - SURFACE
      ?auto_13953 - SURFACE
    )
    :vars
    (
      ?auto_13958 - HOIST
      ?auto_13959 - PLACE
      ?auto_13954 - TRUCK
      ?auto_13956 - PLACE
      ?auto_13957 - HOIST
      ?auto_13955 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13958 ?auto_13959 ) ( SURFACE-AT ?auto_13952 ?auto_13959 ) ( CLEAR ?auto_13952 ) ( IS-CRATE ?auto_13953 ) ( not ( = ?auto_13952 ?auto_13953 ) ) ( AVAILABLE ?auto_13958 ) ( ON ?auto_13952 ?auto_13951 ) ( not ( = ?auto_13951 ?auto_13952 ) ) ( not ( = ?auto_13951 ?auto_13953 ) ) ( TRUCK-AT ?auto_13954 ?auto_13956 ) ( not ( = ?auto_13956 ?auto_13959 ) ) ( HOIST-AT ?auto_13957 ?auto_13956 ) ( not ( = ?auto_13958 ?auto_13957 ) ) ( AVAILABLE ?auto_13957 ) ( SURFACE-AT ?auto_13953 ?auto_13956 ) ( ON ?auto_13953 ?auto_13955 ) ( CLEAR ?auto_13953 ) ( not ( = ?auto_13952 ?auto_13955 ) ) ( not ( = ?auto_13953 ?auto_13955 ) ) ( not ( = ?auto_13951 ?auto_13955 ) ) ( ON ?auto_13951 ?auto_13950 ) ( not ( = ?auto_13950 ?auto_13951 ) ) ( not ( = ?auto_13950 ?auto_13952 ) ) ( not ( = ?auto_13950 ?auto_13953 ) ) ( not ( = ?auto_13950 ?auto_13955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13951 ?auto_13952 ?auto_13953 )
      ( MAKE-3CRATE-VERIFY ?auto_13950 ?auto_13951 ?auto_13952 ?auto_13953 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13960 - SURFACE
      ?auto_13961 - SURFACE
    )
    :vars
    (
      ?auto_13967 - HOIST
      ?auto_13968 - PLACE
      ?auto_13963 - SURFACE
      ?auto_13965 - PLACE
      ?auto_13966 - HOIST
      ?auto_13964 - SURFACE
      ?auto_13962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13967 ?auto_13968 ) ( SURFACE-AT ?auto_13960 ?auto_13968 ) ( CLEAR ?auto_13960 ) ( IS-CRATE ?auto_13961 ) ( not ( = ?auto_13960 ?auto_13961 ) ) ( AVAILABLE ?auto_13967 ) ( ON ?auto_13960 ?auto_13963 ) ( not ( = ?auto_13963 ?auto_13960 ) ) ( not ( = ?auto_13963 ?auto_13961 ) ) ( not ( = ?auto_13965 ?auto_13968 ) ) ( HOIST-AT ?auto_13966 ?auto_13965 ) ( not ( = ?auto_13967 ?auto_13966 ) ) ( AVAILABLE ?auto_13966 ) ( SURFACE-AT ?auto_13961 ?auto_13965 ) ( ON ?auto_13961 ?auto_13964 ) ( CLEAR ?auto_13961 ) ( not ( = ?auto_13960 ?auto_13964 ) ) ( not ( = ?auto_13961 ?auto_13964 ) ) ( not ( = ?auto_13963 ?auto_13964 ) ) ( TRUCK-AT ?auto_13962 ?auto_13968 ) )
    :subtasks
    ( ( !DRIVE ?auto_13962 ?auto_13968 ?auto_13965 )
      ( MAKE-2CRATE ?auto_13963 ?auto_13960 ?auto_13961 )
      ( MAKE-1CRATE-VERIFY ?auto_13960 ?auto_13961 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13969 - SURFACE
      ?auto_13970 - SURFACE
      ?auto_13971 - SURFACE
    )
    :vars
    (
      ?auto_13977 - HOIST
      ?auto_13974 - PLACE
      ?auto_13973 - PLACE
      ?auto_13972 - HOIST
      ?auto_13976 - SURFACE
      ?auto_13975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13977 ?auto_13974 ) ( SURFACE-AT ?auto_13970 ?auto_13974 ) ( CLEAR ?auto_13970 ) ( IS-CRATE ?auto_13971 ) ( not ( = ?auto_13970 ?auto_13971 ) ) ( AVAILABLE ?auto_13977 ) ( ON ?auto_13970 ?auto_13969 ) ( not ( = ?auto_13969 ?auto_13970 ) ) ( not ( = ?auto_13969 ?auto_13971 ) ) ( not ( = ?auto_13973 ?auto_13974 ) ) ( HOIST-AT ?auto_13972 ?auto_13973 ) ( not ( = ?auto_13977 ?auto_13972 ) ) ( AVAILABLE ?auto_13972 ) ( SURFACE-AT ?auto_13971 ?auto_13973 ) ( ON ?auto_13971 ?auto_13976 ) ( CLEAR ?auto_13971 ) ( not ( = ?auto_13970 ?auto_13976 ) ) ( not ( = ?auto_13971 ?auto_13976 ) ) ( not ( = ?auto_13969 ?auto_13976 ) ) ( TRUCK-AT ?auto_13975 ?auto_13974 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13970 ?auto_13971 )
      ( MAKE-2CRATE-VERIFY ?auto_13969 ?auto_13970 ?auto_13971 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13978 - SURFACE
      ?auto_13979 - SURFACE
      ?auto_13980 - SURFACE
      ?auto_13981 - SURFACE
    )
    :vars
    (
      ?auto_13982 - HOIST
      ?auto_13983 - PLACE
      ?auto_13986 - PLACE
      ?auto_13985 - HOIST
      ?auto_13987 - SURFACE
      ?auto_13984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13982 ?auto_13983 ) ( SURFACE-AT ?auto_13980 ?auto_13983 ) ( CLEAR ?auto_13980 ) ( IS-CRATE ?auto_13981 ) ( not ( = ?auto_13980 ?auto_13981 ) ) ( AVAILABLE ?auto_13982 ) ( ON ?auto_13980 ?auto_13979 ) ( not ( = ?auto_13979 ?auto_13980 ) ) ( not ( = ?auto_13979 ?auto_13981 ) ) ( not ( = ?auto_13986 ?auto_13983 ) ) ( HOIST-AT ?auto_13985 ?auto_13986 ) ( not ( = ?auto_13982 ?auto_13985 ) ) ( AVAILABLE ?auto_13985 ) ( SURFACE-AT ?auto_13981 ?auto_13986 ) ( ON ?auto_13981 ?auto_13987 ) ( CLEAR ?auto_13981 ) ( not ( = ?auto_13980 ?auto_13987 ) ) ( not ( = ?auto_13981 ?auto_13987 ) ) ( not ( = ?auto_13979 ?auto_13987 ) ) ( TRUCK-AT ?auto_13984 ?auto_13983 ) ( ON ?auto_13979 ?auto_13978 ) ( not ( = ?auto_13978 ?auto_13979 ) ) ( not ( = ?auto_13978 ?auto_13980 ) ) ( not ( = ?auto_13978 ?auto_13981 ) ) ( not ( = ?auto_13978 ?auto_13987 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13979 ?auto_13980 ?auto_13981 )
      ( MAKE-3CRATE-VERIFY ?auto_13978 ?auto_13979 ?auto_13980 ?auto_13981 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13988 - SURFACE
      ?auto_13989 - SURFACE
    )
    :vars
    (
      ?auto_13990 - HOIST
      ?auto_13992 - PLACE
      ?auto_13991 - SURFACE
      ?auto_13995 - PLACE
      ?auto_13994 - HOIST
      ?auto_13996 - SURFACE
      ?auto_13993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13990 ?auto_13992 ) ( IS-CRATE ?auto_13989 ) ( not ( = ?auto_13988 ?auto_13989 ) ) ( not ( = ?auto_13991 ?auto_13988 ) ) ( not ( = ?auto_13991 ?auto_13989 ) ) ( not ( = ?auto_13995 ?auto_13992 ) ) ( HOIST-AT ?auto_13994 ?auto_13995 ) ( not ( = ?auto_13990 ?auto_13994 ) ) ( AVAILABLE ?auto_13994 ) ( SURFACE-AT ?auto_13989 ?auto_13995 ) ( ON ?auto_13989 ?auto_13996 ) ( CLEAR ?auto_13989 ) ( not ( = ?auto_13988 ?auto_13996 ) ) ( not ( = ?auto_13989 ?auto_13996 ) ) ( not ( = ?auto_13991 ?auto_13996 ) ) ( TRUCK-AT ?auto_13993 ?auto_13992 ) ( SURFACE-AT ?auto_13991 ?auto_13992 ) ( CLEAR ?auto_13991 ) ( LIFTING ?auto_13990 ?auto_13988 ) ( IS-CRATE ?auto_13988 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13991 ?auto_13988 )
      ( MAKE-2CRATE ?auto_13991 ?auto_13988 ?auto_13989 )
      ( MAKE-1CRATE-VERIFY ?auto_13988 ?auto_13989 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13997 - SURFACE
      ?auto_13998 - SURFACE
      ?auto_13999 - SURFACE
    )
    :vars
    (
      ?auto_14004 - HOIST
      ?auto_14001 - PLACE
      ?auto_14003 - PLACE
      ?auto_14002 - HOIST
      ?auto_14000 - SURFACE
      ?auto_14005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14004 ?auto_14001 ) ( IS-CRATE ?auto_13999 ) ( not ( = ?auto_13998 ?auto_13999 ) ) ( not ( = ?auto_13997 ?auto_13998 ) ) ( not ( = ?auto_13997 ?auto_13999 ) ) ( not ( = ?auto_14003 ?auto_14001 ) ) ( HOIST-AT ?auto_14002 ?auto_14003 ) ( not ( = ?auto_14004 ?auto_14002 ) ) ( AVAILABLE ?auto_14002 ) ( SURFACE-AT ?auto_13999 ?auto_14003 ) ( ON ?auto_13999 ?auto_14000 ) ( CLEAR ?auto_13999 ) ( not ( = ?auto_13998 ?auto_14000 ) ) ( not ( = ?auto_13999 ?auto_14000 ) ) ( not ( = ?auto_13997 ?auto_14000 ) ) ( TRUCK-AT ?auto_14005 ?auto_14001 ) ( SURFACE-AT ?auto_13997 ?auto_14001 ) ( CLEAR ?auto_13997 ) ( LIFTING ?auto_14004 ?auto_13998 ) ( IS-CRATE ?auto_13998 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13998 ?auto_13999 )
      ( MAKE-2CRATE-VERIFY ?auto_13997 ?auto_13998 ?auto_13999 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14006 - SURFACE
      ?auto_14007 - SURFACE
      ?auto_14008 - SURFACE
      ?auto_14009 - SURFACE
    )
    :vars
    (
      ?auto_14015 - HOIST
      ?auto_14013 - PLACE
      ?auto_14010 - PLACE
      ?auto_14011 - HOIST
      ?auto_14014 - SURFACE
      ?auto_14012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14015 ?auto_14013 ) ( IS-CRATE ?auto_14009 ) ( not ( = ?auto_14008 ?auto_14009 ) ) ( not ( = ?auto_14007 ?auto_14008 ) ) ( not ( = ?auto_14007 ?auto_14009 ) ) ( not ( = ?auto_14010 ?auto_14013 ) ) ( HOIST-AT ?auto_14011 ?auto_14010 ) ( not ( = ?auto_14015 ?auto_14011 ) ) ( AVAILABLE ?auto_14011 ) ( SURFACE-AT ?auto_14009 ?auto_14010 ) ( ON ?auto_14009 ?auto_14014 ) ( CLEAR ?auto_14009 ) ( not ( = ?auto_14008 ?auto_14014 ) ) ( not ( = ?auto_14009 ?auto_14014 ) ) ( not ( = ?auto_14007 ?auto_14014 ) ) ( TRUCK-AT ?auto_14012 ?auto_14013 ) ( SURFACE-AT ?auto_14007 ?auto_14013 ) ( CLEAR ?auto_14007 ) ( LIFTING ?auto_14015 ?auto_14008 ) ( IS-CRATE ?auto_14008 ) ( ON ?auto_14007 ?auto_14006 ) ( not ( = ?auto_14006 ?auto_14007 ) ) ( not ( = ?auto_14006 ?auto_14008 ) ) ( not ( = ?auto_14006 ?auto_14009 ) ) ( not ( = ?auto_14006 ?auto_14014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14007 ?auto_14008 ?auto_14009 )
      ( MAKE-3CRATE-VERIFY ?auto_14006 ?auto_14007 ?auto_14008 ?auto_14009 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14016 - SURFACE
      ?auto_14017 - SURFACE
    )
    :vars
    (
      ?auto_14024 - HOIST
      ?auto_14022 - PLACE
      ?auto_14020 - SURFACE
      ?auto_14018 - PLACE
      ?auto_14019 - HOIST
      ?auto_14023 - SURFACE
      ?auto_14021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14024 ?auto_14022 ) ( IS-CRATE ?auto_14017 ) ( not ( = ?auto_14016 ?auto_14017 ) ) ( not ( = ?auto_14020 ?auto_14016 ) ) ( not ( = ?auto_14020 ?auto_14017 ) ) ( not ( = ?auto_14018 ?auto_14022 ) ) ( HOIST-AT ?auto_14019 ?auto_14018 ) ( not ( = ?auto_14024 ?auto_14019 ) ) ( AVAILABLE ?auto_14019 ) ( SURFACE-AT ?auto_14017 ?auto_14018 ) ( ON ?auto_14017 ?auto_14023 ) ( CLEAR ?auto_14017 ) ( not ( = ?auto_14016 ?auto_14023 ) ) ( not ( = ?auto_14017 ?auto_14023 ) ) ( not ( = ?auto_14020 ?auto_14023 ) ) ( TRUCK-AT ?auto_14021 ?auto_14022 ) ( SURFACE-AT ?auto_14020 ?auto_14022 ) ( CLEAR ?auto_14020 ) ( IS-CRATE ?auto_14016 ) ( AVAILABLE ?auto_14024 ) ( IN ?auto_14016 ?auto_14021 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14024 ?auto_14016 ?auto_14021 ?auto_14022 )
      ( MAKE-2CRATE ?auto_14020 ?auto_14016 ?auto_14017 )
      ( MAKE-1CRATE-VERIFY ?auto_14016 ?auto_14017 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14025 - SURFACE
      ?auto_14026 - SURFACE
      ?auto_14027 - SURFACE
    )
    :vars
    (
      ?auto_14032 - HOIST
      ?auto_14031 - PLACE
      ?auto_14033 - PLACE
      ?auto_14029 - HOIST
      ?auto_14030 - SURFACE
      ?auto_14028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14032 ?auto_14031 ) ( IS-CRATE ?auto_14027 ) ( not ( = ?auto_14026 ?auto_14027 ) ) ( not ( = ?auto_14025 ?auto_14026 ) ) ( not ( = ?auto_14025 ?auto_14027 ) ) ( not ( = ?auto_14033 ?auto_14031 ) ) ( HOIST-AT ?auto_14029 ?auto_14033 ) ( not ( = ?auto_14032 ?auto_14029 ) ) ( AVAILABLE ?auto_14029 ) ( SURFACE-AT ?auto_14027 ?auto_14033 ) ( ON ?auto_14027 ?auto_14030 ) ( CLEAR ?auto_14027 ) ( not ( = ?auto_14026 ?auto_14030 ) ) ( not ( = ?auto_14027 ?auto_14030 ) ) ( not ( = ?auto_14025 ?auto_14030 ) ) ( TRUCK-AT ?auto_14028 ?auto_14031 ) ( SURFACE-AT ?auto_14025 ?auto_14031 ) ( CLEAR ?auto_14025 ) ( IS-CRATE ?auto_14026 ) ( AVAILABLE ?auto_14032 ) ( IN ?auto_14026 ?auto_14028 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14026 ?auto_14027 )
      ( MAKE-2CRATE-VERIFY ?auto_14025 ?auto_14026 ?auto_14027 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14034 - SURFACE
      ?auto_14035 - SURFACE
      ?auto_14036 - SURFACE
      ?auto_14037 - SURFACE
    )
    :vars
    (
      ?auto_14043 - HOIST
      ?auto_14041 - PLACE
      ?auto_14038 - PLACE
      ?auto_14039 - HOIST
      ?auto_14040 - SURFACE
      ?auto_14042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14043 ?auto_14041 ) ( IS-CRATE ?auto_14037 ) ( not ( = ?auto_14036 ?auto_14037 ) ) ( not ( = ?auto_14035 ?auto_14036 ) ) ( not ( = ?auto_14035 ?auto_14037 ) ) ( not ( = ?auto_14038 ?auto_14041 ) ) ( HOIST-AT ?auto_14039 ?auto_14038 ) ( not ( = ?auto_14043 ?auto_14039 ) ) ( AVAILABLE ?auto_14039 ) ( SURFACE-AT ?auto_14037 ?auto_14038 ) ( ON ?auto_14037 ?auto_14040 ) ( CLEAR ?auto_14037 ) ( not ( = ?auto_14036 ?auto_14040 ) ) ( not ( = ?auto_14037 ?auto_14040 ) ) ( not ( = ?auto_14035 ?auto_14040 ) ) ( TRUCK-AT ?auto_14042 ?auto_14041 ) ( SURFACE-AT ?auto_14035 ?auto_14041 ) ( CLEAR ?auto_14035 ) ( IS-CRATE ?auto_14036 ) ( AVAILABLE ?auto_14043 ) ( IN ?auto_14036 ?auto_14042 ) ( ON ?auto_14035 ?auto_14034 ) ( not ( = ?auto_14034 ?auto_14035 ) ) ( not ( = ?auto_14034 ?auto_14036 ) ) ( not ( = ?auto_14034 ?auto_14037 ) ) ( not ( = ?auto_14034 ?auto_14040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14035 ?auto_14036 ?auto_14037 )
      ( MAKE-3CRATE-VERIFY ?auto_14034 ?auto_14035 ?auto_14036 ?auto_14037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14044 - SURFACE
      ?auto_14045 - SURFACE
    )
    :vars
    (
      ?auto_14052 - HOIST
      ?auto_14050 - PLACE
      ?auto_14048 - SURFACE
      ?auto_14046 - PLACE
      ?auto_14047 - HOIST
      ?auto_14049 - SURFACE
      ?auto_14051 - TRUCK
      ?auto_14053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14052 ?auto_14050 ) ( IS-CRATE ?auto_14045 ) ( not ( = ?auto_14044 ?auto_14045 ) ) ( not ( = ?auto_14048 ?auto_14044 ) ) ( not ( = ?auto_14048 ?auto_14045 ) ) ( not ( = ?auto_14046 ?auto_14050 ) ) ( HOIST-AT ?auto_14047 ?auto_14046 ) ( not ( = ?auto_14052 ?auto_14047 ) ) ( AVAILABLE ?auto_14047 ) ( SURFACE-AT ?auto_14045 ?auto_14046 ) ( ON ?auto_14045 ?auto_14049 ) ( CLEAR ?auto_14045 ) ( not ( = ?auto_14044 ?auto_14049 ) ) ( not ( = ?auto_14045 ?auto_14049 ) ) ( not ( = ?auto_14048 ?auto_14049 ) ) ( SURFACE-AT ?auto_14048 ?auto_14050 ) ( CLEAR ?auto_14048 ) ( IS-CRATE ?auto_14044 ) ( AVAILABLE ?auto_14052 ) ( IN ?auto_14044 ?auto_14051 ) ( TRUCK-AT ?auto_14051 ?auto_14053 ) ( not ( = ?auto_14053 ?auto_14050 ) ) ( not ( = ?auto_14046 ?auto_14053 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14051 ?auto_14053 ?auto_14050 )
      ( MAKE-2CRATE ?auto_14048 ?auto_14044 ?auto_14045 )
      ( MAKE-1CRATE-VERIFY ?auto_14044 ?auto_14045 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14054 - SURFACE
      ?auto_14055 - SURFACE
      ?auto_14056 - SURFACE
    )
    :vars
    (
      ?auto_14059 - HOIST
      ?auto_14062 - PLACE
      ?auto_14058 - PLACE
      ?auto_14061 - HOIST
      ?auto_14057 - SURFACE
      ?auto_14060 - TRUCK
      ?auto_14063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14059 ?auto_14062 ) ( IS-CRATE ?auto_14056 ) ( not ( = ?auto_14055 ?auto_14056 ) ) ( not ( = ?auto_14054 ?auto_14055 ) ) ( not ( = ?auto_14054 ?auto_14056 ) ) ( not ( = ?auto_14058 ?auto_14062 ) ) ( HOIST-AT ?auto_14061 ?auto_14058 ) ( not ( = ?auto_14059 ?auto_14061 ) ) ( AVAILABLE ?auto_14061 ) ( SURFACE-AT ?auto_14056 ?auto_14058 ) ( ON ?auto_14056 ?auto_14057 ) ( CLEAR ?auto_14056 ) ( not ( = ?auto_14055 ?auto_14057 ) ) ( not ( = ?auto_14056 ?auto_14057 ) ) ( not ( = ?auto_14054 ?auto_14057 ) ) ( SURFACE-AT ?auto_14054 ?auto_14062 ) ( CLEAR ?auto_14054 ) ( IS-CRATE ?auto_14055 ) ( AVAILABLE ?auto_14059 ) ( IN ?auto_14055 ?auto_14060 ) ( TRUCK-AT ?auto_14060 ?auto_14063 ) ( not ( = ?auto_14063 ?auto_14062 ) ) ( not ( = ?auto_14058 ?auto_14063 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14055 ?auto_14056 )
      ( MAKE-2CRATE-VERIFY ?auto_14054 ?auto_14055 ?auto_14056 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14064 - SURFACE
      ?auto_14065 - SURFACE
      ?auto_14066 - SURFACE
      ?auto_14067 - SURFACE
    )
    :vars
    (
      ?auto_14069 - HOIST
      ?auto_14070 - PLACE
      ?auto_14068 - PLACE
      ?auto_14071 - HOIST
      ?auto_14074 - SURFACE
      ?auto_14073 - TRUCK
      ?auto_14072 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14069 ?auto_14070 ) ( IS-CRATE ?auto_14067 ) ( not ( = ?auto_14066 ?auto_14067 ) ) ( not ( = ?auto_14065 ?auto_14066 ) ) ( not ( = ?auto_14065 ?auto_14067 ) ) ( not ( = ?auto_14068 ?auto_14070 ) ) ( HOIST-AT ?auto_14071 ?auto_14068 ) ( not ( = ?auto_14069 ?auto_14071 ) ) ( AVAILABLE ?auto_14071 ) ( SURFACE-AT ?auto_14067 ?auto_14068 ) ( ON ?auto_14067 ?auto_14074 ) ( CLEAR ?auto_14067 ) ( not ( = ?auto_14066 ?auto_14074 ) ) ( not ( = ?auto_14067 ?auto_14074 ) ) ( not ( = ?auto_14065 ?auto_14074 ) ) ( SURFACE-AT ?auto_14065 ?auto_14070 ) ( CLEAR ?auto_14065 ) ( IS-CRATE ?auto_14066 ) ( AVAILABLE ?auto_14069 ) ( IN ?auto_14066 ?auto_14073 ) ( TRUCK-AT ?auto_14073 ?auto_14072 ) ( not ( = ?auto_14072 ?auto_14070 ) ) ( not ( = ?auto_14068 ?auto_14072 ) ) ( ON ?auto_14065 ?auto_14064 ) ( not ( = ?auto_14064 ?auto_14065 ) ) ( not ( = ?auto_14064 ?auto_14066 ) ) ( not ( = ?auto_14064 ?auto_14067 ) ) ( not ( = ?auto_14064 ?auto_14074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14065 ?auto_14066 ?auto_14067 )
      ( MAKE-3CRATE-VERIFY ?auto_14064 ?auto_14065 ?auto_14066 ?auto_14067 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14075 - SURFACE
      ?auto_14076 - SURFACE
    )
    :vars
    (
      ?auto_14078 - HOIST
      ?auto_14079 - PLACE
      ?auto_14082 - SURFACE
      ?auto_14077 - PLACE
      ?auto_14080 - HOIST
      ?auto_14084 - SURFACE
      ?auto_14083 - TRUCK
      ?auto_14081 - PLACE
      ?auto_14085 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14078 ?auto_14079 ) ( IS-CRATE ?auto_14076 ) ( not ( = ?auto_14075 ?auto_14076 ) ) ( not ( = ?auto_14082 ?auto_14075 ) ) ( not ( = ?auto_14082 ?auto_14076 ) ) ( not ( = ?auto_14077 ?auto_14079 ) ) ( HOIST-AT ?auto_14080 ?auto_14077 ) ( not ( = ?auto_14078 ?auto_14080 ) ) ( AVAILABLE ?auto_14080 ) ( SURFACE-AT ?auto_14076 ?auto_14077 ) ( ON ?auto_14076 ?auto_14084 ) ( CLEAR ?auto_14076 ) ( not ( = ?auto_14075 ?auto_14084 ) ) ( not ( = ?auto_14076 ?auto_14084 ) ) ( not ( = ?auto_14082 ?auto_14084 ) ) ( SURFACE-AT ?auto_14082 ?auto_14079 ) ( CLEAR ?auto_14082 ) ( IS-CRATE ?auto_14075 ) ( AVAILABLE ?auto_14078 ) ( TRUCK-AT ?auto_14083 ?auto_14081 ) ( not ( = ?auto_14081 ?auto_14079 ) ) ( not ( = ?auto_14077 ?auto_14081 ) ) ( HOIST-AT ?auto_14085 ?auto_14081 ) ( LIFTING ?auto_14085 ?auto_14075 ) ( not ( = ?auto_14078 ?auto_14085 ) ) ( not ( = ?auto_14080 ?auto_14085 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14085 ?auto_14075 ?auto_14083 ?auto_14081 )
      ( MAKE-2CRATE ?auto_14082 ?auto_14075 ?auto_14076 )
      ( MAKE-1CRATE-VERIFY ?auto_14075 ?auto_14076 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14086 - SURFACE
      ?auto_14087 - SURFACE
      ?auto_14088 - SURFACE
    )
    :vars
    (
      ?auto_14092 - HOIST
      ?auto_14091 - PLACE
      ?auto_14089 - PLACE
      ?auto_14090 - HOIST
      ?auto_14093 - SURFACE
      ?auto_14095 - TRUCK
      ?auto_14094 - PLACE
      ?auto_14096 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14092 ?auto_14091 ) ( IS-CRATE ?auto_14088 ) ( not ( = ?auto_14087 ?auto_14088 ) ) ( not ( = ?auto_14086 ?auto_14087 ) ) ( not ( = ?auto_14086 ?auto_14088 ) ) ( not ( = ?auto_14089 ?auto_14091 ) ) ( HOIST-AT ?auto_14090 ?auto_14089 ) ( not ( = ?auto_14092 ?auto_14090 ) ) ( AVAILABLE ?auto_14090 ) ( SURFACE-AT ?auto_14088 ?auto_14089 ) ( ON ?auto_14088 ?auto_14093 ) ( CLEAR ?auto_14088 ) ( not ( = ?auto_14087 ?auto_14093 ) ) ( not ( = ?auto_14088 ?auto_14093 ) ) ( not ( = ?auto_14086 ?auto_14093 ) ) ( SURFACE-AT ?auto_14086 ?auto_14091 ) ( CLEAR ?auto_14086 ) ( IS-CRATE ?auto_14087 ) ( AVAILABLE ?auto_14092 ) ( TRUCK-AT ?auto_14095 ?auto_14094 ) ( not ( = ?auto_14094 ?auto_14091 ) ) ( not ( = ?auto_14089 ?auto_14094 ) ) ( HOIST-AT ?auto_14096 ?auto_14094 ) ( LIFTING ?auto_14096 ?auto_14087 ) ( not ( = ?auto_14092 ?auto_14096 ) ) ( not ( = ?auto_14090 ?auto_14096 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14087 ?auto_14088 )
      ( MAKE-2CRATE-VERIFY ?auto_14086 ?auto_14087 ?auto_14088 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14097 - SURFACE
      ?auto_14098 - SURFACE
      ?auto_14099 - SURFACE
      ?auto_14100 - SURFACE
    )
    :vars
    (
      ?auto_14108 - HOIST
      ?auto_14106 - PLACE
      ?auto_14107 - PLACE
      ?auto_14103 - HOIST
      ?auto_14102 - SURFACE
      ?auto_14105 - TRUCK
      ?auto_14101 - PLACE
      ?auto_14104 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14108 ?auto_14106 ) ( IS-CRATE ?auto_14100 ) ( not ( = ?auto_14099 ?auto_14100 ) ) ( not ( = ?auto_14098 ?auto_14099 ) ) ( not ( = ?auto_14098 ?auto_14100 ) ) ( not ( = ?auto_14107 ?auto_14106 ) ) ( HOIST-AT ?auto_14103 ?auto_14107 ) ( not ( = ?auto_14108 ?auto_14103 ) ) ( AVAILABLE ?auto_14103 ) ( SURFACE-AT ?auto_14100 ?auto_14107 ) ( ON ?auto_14100 ?auto_14102 ) ( CLEAR ?auto_14100 ) ( not ( = ?auto_14099 ?auto_14102 ) ) ( not ( = ?auto_14100 ?auto_14102 ) ) ( not ( = ?auto_14098 ?auto_14102 ) ) ( SURFACE-AT ?auto_14098 ?auto_14106 ) ( CLEAR ?auto_14098 ) ( IS-CRATE ?auto_14099 ) ( AVAILABLE ?auto_14108 ) ( TRUCK-AT ?auto_14105 ?auto_14101 ) ( not ( = ?auto_14101 ?auto_14106 ) ) ( not ( = ?auto_14107 ?auto_14101 ) ) ( HOIST-AT ?auto_14104 ?auto_14101 ) ( LIFTING ?auto_14104 ?auto_14099 ) ( not ( = ?auto_14108 ?auto_14104 ) ) ( not ( = ?auto_14103 ?auto_14104 ) ) ( ON ?auto_14098 ?auto_14097 ) ( not ( = ?auto_14097 ?auto_14098 ) ) ( not ( = ?auto_14097 ?auto_14099 ) ) ( not ( = ?auto_14097 ?auto_14100 ) ) ( not ( = ?auto_14097 ?auto_14102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14098 ?auto_14099 ?auto_14100 )
      ( MAKE-3CRATE-VERIFY ?auto_14097 ?auto_14098 ?auto_14099 ?auto_14100 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14109 - SURFACE
      ?auto_14110 - SURFACE
    )
    :vars
    (
      ?auto_14118 - HOIST
      ?auto_14116 - PLACE
      ?auto_14119 - SURFACE
      ?auto_14117 - PLACE
      ?auto_14113 - HOIST
      ?auto_14112 - SURFACE
      ?auto_14115 - TRUCK
      ?auto_14111 - PLACE
      ?auto_14114 - HOIST
      ?auto_14120 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14118 ?auto_14116 ) ( IS-CRATE ?auto_14110 ) ( not ( = ?auto_14109 ?auto_14110 ) ) ( not ( = ?auto_14119 ?auto_14109 ) ) ( not ( = ?auto_14119 ?auto_14110 ) ) ( not ( = ?auto_14117 ?auto_14116 ) ) ( HOIST-AT ?auto_14113 ?auto_14117 ) ( not ( = ?auto_14118 ?auto_14113 ) ) ( AVAILABLE ?auto_14113 ) ( SURFACE-AT ?auto_14110 ?auto_14117 ) ( ON ?auto_14110 ?auto_14112 ) ( CLEAR ?auto_14110 ) ( not ( = ?auto_14109 ?auto_14112 ) ) ( not ( = ?auto_14110 ?auto_14112 ) ) ( not ( = ?auto_14119 ?auto_14112 ) ) ( SURFACE-AT ?auto_14119 ?auto_14116 ) ( CLEAR ?auto_14119 ) ( IS-CRATE ?auto_14109 ) ( AVAILABLE ?auto_14118 ) ( TRUCK-AT ?auto_14115 ?auto_14111 ) ( not ( = ?auto_14111 ?auto_14116 ) ) ( not ( = ?auto_14117 ?auto_14111 ) ) ( HOIST-AT ?auto_14114 ?auto_14111 ) ( not ( = ?auto_14118 ?auto_14114 ) ) ( not ( = ?auto_14113 ?auto_14114 ) ) ( AVAILABLE ?auto_14114 ) ( SURFACE-AT ?auto_14109 ?auto_14111 ) ( ON ?auto_14109 ?auto_14120 ) ( CLEAR ?auto_14109 ) ( not ( = ?auto_14109 ?auto_14120 ) ) ( not ( = ?auto_14110 ?auto_14120 ) ) ( not ( = ?auto_14119 ?auto_14120 ) ) ( not ( = ?auto_14112 ?auto_14120 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14114 ?auto_14109 ?auto_14120 ?auto_14111 )
      ( MAKE-2CRATE ?auto_14119 ?auto_14109 ?auto_14110 )
      ( MAKE-1CRATE-VERIFY ?auto_14109 ?auto_14110 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14121 - SURFACE
      ?auto_14122 - SURFACE
      ?auto_14123 - SURFACE
    )
    :vars
    (
      ?auto_14127 - HOIST
      ?auto_14126 - PLACE
      ?auto_14129 - PLACE
      ?auto_14128 - HOIST
      ?auto_14130 - SURFACE
      ?auto_14131 - TRUCK
      ?auto_14125 - PLACE
      ?auto_14124 - HOIST
      ?auto_14132 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14127 ?auto_14126 ) ( IS-CRATE ?auto_14123 ) ( not ( = ?auto_14122 ?auto_14123 ) ) ( not ( = ?auto_14121 ?auto_14122 ) ) ( not ( = ?auto_14121 ?auto_14123 ) ) ( not ( = ?auto_14129 ?auto_14126 ) ) ( HOIST-AT ?auto_14128 ?auto_14129 ) ( not ( = ?auto_14127 ?auto_14128 ) ) ( AVAILABLE ?auto_14128 ) ( SURFACE-AT ?auto_14123 ?auto_14129 ) ( ON ?auto_14123 ?auto_14130 ) ( CLEAR ?auto_14123 ) ( not ( = ?auto_14122 ?auto_14130 ) ) ( not ( = ?auto_14123 ?auto_14130 ) ) ( not ( = ?auto_14121 ?auto_14130 ) ) ( SURFACE-AT ?auto_14121 ?auto_14126 ) ( CLEAR ?auto_14121 ) ( IS-CRATE ?auto_14122 ) ( AVAILABLE ?auto_14127 ) ( TRUCK-AT ?auto_14131 ?auto_14125 ) ( not ( = ?auto_14125 ?auto_14126 ) ) ( not ( = ?auto_14129 ?auto_14125 ) ) ( HOIST-AT ?auto_14124 ?auto_14125 ) ( not ( = ?auto_14127 ?auto_14124 ) ) ( not ( = ?auto_14128 ?auto_14124 ) ) ( AVAILABLE ?auto_14124 ) ( SURFACE-AT ?auto_14122 ?auto_14125 ) ( ON ?auto_14122 ?auto_14132 ) ( CLEAR ?auto_14122 ) ( not ( = ?auto_14122 ?auto_14132 ) ) ( not ( = ?auto_14123 ?auto_14132 ) ) ( not ( = ?auto_14121 ?auto_14132 ) ) ( not ( = ?auto_14130 ?auto_14132 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14122 ?auto_14123 )
      ( MAKE-2CRATE-VERIFY ?auto_14121 ?auto_14122 ?auto_14123 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14133 - SURFACE
      ?auto_14134 - SURFACE
      ?auto_14135 - SURFACE
      ?auto_14136 - SURFACE
    )
    :vars
    (
      ?auto_14145 - HOIST
      ?auto_14138 - PLACE
      ?auto_14143 - PLACE
      ?auto_14141 - HOIST
      ?auto_14139 - SURFACE
      ?auto_14142 - TRUCK
      ?auto_14144 - PLACE
      ?auto_14137 - HOIST
      ?auto_14140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14145 ?auto_14138 ) ( IS-CRATE ?auto_14136 ) ( not ( = ?auto_14135 ?auto_14136 ) ) ( not ( = ?auto_14134 ?auto_14135 ) ) ( not ( = ?auto_14134 ?auto_14136 ) ) ( not ( = ?auto_14143 ?auto_14138 ) ) ( HOIST-AT ?auto_14141 ?auto_14143 ) ( not ( = ?auto_14145 ?auto_14141 ) ) ( AVAILABLE ?auto_14141 ) ( SURFACE-AT ?auto_14136 ?auto_14143 ) ( ON ?auto_14136 ?auto_14139 ) ( CLEAR ?auto_14136 ) ( not ( = ?auto_14135 ?auto_14139 ) ) ( not ( = ?auto_14136 ?auto_14139 ) ) ( not ( = ?auto_14134 ?auto_14139 ) ) ( SURFACE-AT ?auto_14134 ?auto_14138 ) ( CLEAR ?auto_14134 ) ( IS-CRATE ?auto_14135 ) ( AVAILABLE ?auto_14145 ) ( TRUCK-AT ?auto_14142 ?auto_14144 ) ( not ( = ?auto_14144 ?auto_14138 ) ) ( not ( = ?auto_14143 ?auto_14144 ) ) ( HOIST-AT ?auto_14137 ?auto_14144 ) ( not ( = ?auto_14145 ?auto_14137 ) ) ( not ( = ?auto_14141 ?auto_14137 ) ) ( AVAILABLE ?auto_14137 ) ( SURFACE-AT ?auto_14135 ?auto_14144 ) ( ON ?auto_14135 ?auto_14140 ) ( CLEAR ?auto_14135 ) ( not ( = ?auto_14135 ?auto_14140 ) ) ( not ( = ?auto_14136 ?auto_14140 ) ) ( not ( = ?auto_14134 ?auto_14140 ) ) ( not ( = ?auto_14139 ?auto_14140 ) ) ( ON ?auto_14134 ?auto_14133 ) ( not ( = ?auto_14133 ?auto_14134 ) ) ( not ( = ?auto_14133 ?auto_14135 ) ) ( not ( = ?auto_14133 ?auto_14136 ) ) ( not ( = ?auto_14133 ?auto_14139 ) ) ( not ( = ?auto_14133 ?auto_14140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14134 ?auto_14135 ?auto_14136 )
      ( MAKE-3CRATE-VERIFY ?auto_14133 ?auto_14134 ?auto_14135 ?auto_14136 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14146 - SURFACE
      ?auto_14147 - SURFACE
    )
    :vars
    (
      ?auto_14157 - HOIST
      ?auto_14149 - PLACE
      ?auto_14150 - SURFACE
      ?auto_14155 - PLACE
      ?auto_14153 - HOIST
      ?auto_14151 - SURFACE
      ?auto_14156 - PLACE
      ?auto_14148 - HOIST
      ?auto_14152 - SURFACE
      ?auto_14154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14157 ?auto_14149 ) ( IS-CRATE ?auto_14147 ) ( not ( = ?auto_14146 ?auto_14147 ) ) ( not ( = ?auto_14150 ?auto_14146 ) ) ( not ( = ?auto_14150 ?auto_14147 ) ) ( not ( = ?auto_14155 ?auto_14149 ) ) ( HOIST-AT ?auto_14153 ?auto_14155 ) ( not ( = ?auto_14157 ?auto_14153 ) ) ( AVAILABLE ?auto_14153 ) ( SURFACE-AT ?auto_14147 ?auto_14155 ) ( ON ?auto_14147 ?auto_14151 ) ( CLEAR ?auto_14147 ) ( not ( = ?auto_14146 ?auto_14151 ) ) ( not ( = ?auto_14147 ?auto_14151 ) ) ( not ( = ?auto_14150 ?auto_14151 ) ) ( SURFACE-AT ?auto_14150 ?auto_14149 ) ( CLEAR ?auto_14150 ) ( IS-CRATE ?auto_14146 ) ( AVAILABLE ?auto_14157 ) ( not ( = ?auto_14156 ?auto_14149 ) ) ( not ( = ?auto_14155 ?auto_14156 ) ) ( HOIST-AT ?auto_14148 ?auto_14156 ) ( not ( = ?auto_14157 ?auto_14148 ) ) ( not ( = ?auto_14153 ?auto_14148 ) ) ( AVAILABLE ?auto_14148 ) ( SURFACE-AT ?auto_14146 ?auto_14156 ) ( ON ?auto_14146 ?auto_14152 ) ( CLEAR ?auto_14146 ) ( not ( = ?auto_14146 ?auto_14152 ) ) ( not ( = ?auto_14147 ?auto_14152 ) ) ( not ( = ?auto_14150 ?auto_14152 ) ) ( not ( = ?auto_14151 ?auto_14152 ) ) ( TRUCK-AT ?auto_14154 ?auto_14149 ) )
    :subtasks
    ( ( !DRIVE ?auto_14154 ?auto_14149 ?auto_14156 )
      ( MAKE-2CRATE ?auto_14150 ?auto_14146 ?auto_14147 )
      ( MAKE-1CRATE-VERIFY ?auto_14146 ?auto_14147 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14158 - SURFACE
      ?auto_14159 - SURFACE
      ?auto_14160 - SURFACE
    )
    :vars
    (
      ?auto_14168 - HOIST
      ?auto_14163 - PLACE
      ?auto_14169 - PLACE
      ?auto_14162 - HOIST
      ?auto_14165 - SURFACE
      ?auto_14164 - PLACE
      ?auto_14167 - HOIST
      ?auto_14166 - SURFACE
      ?auto_14161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14168 ?auto_14163 ) ( IS-CRATE ?auto_14160 ) ( not ( = ?auto_14159 ?auto_14160 ) ) ( not ( = ?auto_14158 ?auto_14159 ) ) ( not ( = ?auto_14158 ?auto_14160 ) ) ( not ( = ?auto_14169 ?auto_14163 ) ) ( HOIST-AT ?auto_14162 ?auto_14169 ) ( not ( = ?auto_14168 ?auto_14162 ) ) ( AVAILABLE ?auto_14162 ) ( SURFACE-AT ?auto_14160 ?auto_14169 ) ( ON ?auto_14160 ?auto_14165 ) ( CLEAR ?auto_14160 ) ( not ( = ?auto_14159 ?auto_14165 ) ) ( not ( = ?auto_14160 ?auto_14165 ) ) ( not ( = ?auto_14158 ?auto_14165 ) ) ( SURFACE-AT ?auto_14158 ?auto_14163 ) ( CLEAR ?auto_14158 ) ( IS-CRATE ?auto_14159 ) ( AVAILABLE ?auto_14168 ) ( not ( = ?auto_14164 ?auto_14163 ) ) ( not ( = ?auto_14169 ?auto_14164 ) ) ( HOIST-AT ?auto_14167 ?auto_14164 ) ( not ( = ?auto_14168 ?auto_14167 ) ) ( not ( = ?auto_14162 ?auto_14167 ) ) ( AVAILABLE ?auto_14167 ) ( SURFACE-AT ?auto_14159 ?auto_14164 ) ( ON ?auto_14159 ?auto_14166 ) ( CLEAR ?auto_14159 ) ( not ( = ?auto_14159 ?auto_14166 ) ) ( not ( = ?auto_14160 ?auto_14166 ) ) ( not ( = ?auto_14158 ?auto_14166 ) ) ( not ( = ?auto_14165 ?auto_14166 ) ) ( TRUCK-AT ?auto_14161 ?auto_14163 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14159 ?auto_14160 )
      ( MAKE-2CRATE-VERIFY ?auto_14158 ?auto_14159 ?auto_14160 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14170 - SURFACE
      ?auto_14171 - SURFACE
      ?auto_14172 - SURFACE
      ?auto_14173 - SURFACE
    )
    :vars
    (
      ?auto_14174 - HOIST
      ?auto_14181 - PLACE
      ?auto_14182 - PLACE
      ?auto_14175 - HOIST
      ?auto_14179 - SURFACE
      ?auto_14176 - PLACE
      ?auto_14180 - HOIST
      ?auto_14177 - SURFACE
      ?auto_14178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14174 ?auto_14181 ) ( IS-CRATE ?auto_14173 ) ( not ( = ?auto_14172 ?auto_14173 ) ) ( not ( = ?auto_14171 ?auto_14172 ) ) ( not ( = ?auto_14171 ?auto_14173 ) ) ( not ( = ?auto_14182 ?auto_14181 ) ) ( HOIST-AT ?auto_14175 ?auto_14182 ) ( not ( = ?auto_14174 ?auto_14175 ) ) ( AVAILABLE ?auto_14175 ) ( SURFACE-AT ?auto_14173 ?auto_14182 ) ( ON ?auto_14173 ?auto_14179 ) ( CLEAR ?auto_14173 ) ( not ( = ?auto_14172 ?auto_14179 ) ) ( not ( = ?auto_14173 ?auto_14179 ) ) ( not ( = ?auto_14171 ?auto_14179 ) ) ( SURFACE-AT ?auto_14171 ?auto_14181 ) ( CLEAR ?auto_14171 ) ( IS-CRATE ?auto_14172 ) ( AVAILABLE ?auto_14174 ) ( not ( = ?auto_14176 ?auto_14181 ) ) ( not ( = ?auto_14182 ?auto_14176 ) ) ( HOIST-AT ?auto_14180 ?auto_14176 ) ( not ( = ?auto_14174 ?auto_14180 ) ) ( not ( = ?auto_14175 ?auto_14180 ) ) ( AVAILABLE ?auto_14180 ) ( SURFACE-AT ?auto_14172 ?auto_14176 ) ( ON ?auto_14172 ?auto_14177 ) ( CLEAR ?auto_14172 ) ( not ( = ?auto_14172 ?auto_14177 ) ) ( not ( = ?auto_14173 ?auto_14177 ) ) ( not ( = ?auto_14171 ?auto_14177 ) ) ( not ( = ?auto_14179 ?auto_14177 ) ) ( TRUCK-AT ?auto_14178 ?auto_14181 ) ( ON ?auto_14171 ?auto_14170 ) ( not ( = ?auto_14170 ?auto_14171 ) ) ( not ( = ?auto_14170 ?auto_14172 ) ) ( not ( = ?auto_14170 ?auto_14173 ) ) ( not ( = ?auto_14170 ?auto_14179 ) ) ( not ( = ?auto_14170 ?auto_14177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14171 ?auto_14172 ?auto_14173 )
      ( MAKE-3CRATE-VERIFY ?auto_14170 ?auto_14171 ?auto_14172 ?auto_14173 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14183 - SURFACE
      ?auto_14184 - SURFACE
    )
    :vars
    (
      ?auto_14185 - HOIST
      ?auto_14193 - PLACE
      ?auto_14190 - SURFACE
      ?auto_14194 - PLACE
      ?auto_14186 - HOIST
      ?auto_14191 - SURFACE
      ?auto_14187 - PLACE
      ?auto_14192 - HOIST
      ?auto_14188 - SURFACE
      ?auto_14189 - TRUCK
      ?auto_14195 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14185 ?auto_14193 ) ( IS-CRATE ?auto_14184 ) ( not ( = ?auto_14183 ?auto_14184 ) ) ( not ( = ?auto_14190 ?auto_14183 ) ) ( not ( = ?auto_14190 ?auto_14184 ) ) ( not ( = ?auto_14194 ?auto_14193 ) ) ( HOIST-AT ?auto_14186 ?auto_14194 ) ( not ( = ?auto_14185 ?auto_14186 ) ) ( AVAILABLE ?auto_14186 ) ( SURFACE-AT ?auto_14184 ?auto_14194 ) ( ON ?auto_14184 ?auto_14191 ) ( CLEAR ?auto_14184 ) ( not ( = ?auto_14183 ?auto_14191 ) ) ( not ( = ?auto_14184 ?auto_14191 ) ) ( not ( = ?auto_14190 ?auto_14191 ) ) ( IS-CRATE ?auto_14183 ) ( not ( = ?auto_14187 ?auto_14193 ) ) ( not ( = ?auto_14194 ?auto_14187 ) ) ( HOIST-AT ?auto_14192 ?auto_14187 ) ( not ( = ?auto_14185 ?auto_14192 ) ) ( not ( = ?auto_14186 ?auto_14192 ) ) ( AVAILABLE ?auto_14192 ) ( SURFACE-AT ?auto_14183 ?auto_14187 ) ( ON ?auto_14183 ?auto_14188 ) ( CLEAR ?auto_14183 ) ( not ( = ?auto_14183 ?auto_14188 ) ) ( not ( = ?auto_14184 ?auto_14188 ) ) ( not ( = ?auto_14190 ?auto_14188 ) ) ( not ( = ?auto_14191 ?auto_14188 ) ) ( TRUCK-AT ?auto_14189 ?auto_14193 ) ( SURFACE-AT ?auto_14195 ?auto_14193 ) ( CLEAR ?auto_14195 ) ( LIFTING ?auto_14185 ?auto_14190 ) ( IS-CRATE ?auto_14190 ) ( not ( = ?auto_14195 ?auto_14190 ) ) ( not ( = ?auto_14183 ?auto_14195 ) ) ( not ( = ?auto_14184 ?auto_14195 ) ) ( not ( = ?auto_14191 ?auto_14195 ) ) ( not ( = ?auto_14188 ?auto_14195 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14195 ?auto_14190 )
      ( MAKE-2CRATE ?auto_14190 ?auto_14183 ?auto_14184 )
      ( MAKE-1CRATE-VERIFY ?auto_14183 ?auto_14184 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14196 - SURFACE
      ?auto_14197 - SURFACE
      ?auto_14198 - SURFACE
    )
    :vars
    (
      ?auto_14200 - HOIST
      ?auto_14208 - PLACE
      ?auto_14205 - PLACE
      ?auto_14206 - HOIST
      ?auto_14204 - SURFACE
      ?auto_14202 - PLACE
      ?auto_14203 - HOIST
      ?auto_14201 - SURFACE
      ?auto_14199 - TRUCK
      ?auto_14207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14200 ?auto_14208 ) ( IS-CRATE ?auto_14198 ) ( not ( = ?auto_14197 ?auto_14198 ) ) ( not ( = ?auto_14196 ?auto_14197 ) ) ( not ( = ?auto_14196 ?auto_14198 ) ) ( not ( = ?auto_14205 ?auto_14208 ) ) ( HOIST-AT ?auto_14206 ?auto_14205 ) ( not ( = ?auto_14200 ?auto_14206 ) ) ( AVAILABLE ?auto_14206 ) ( SURFACE-AT ?auto_14198 ?auto_14205 ) ( ON ?auto_14198 ?auto_14204 ) ( CLEAR ?auto_14198 ) ( not ( = ?auto_14197 ?auto_14204 ) ) ( not ( = ?auto_14198 ?auto_14204 ) ) ( not ( = ?auto_14196 ?auto_14204 ) ) ( IS-CRATE ?auto_14197 ) ( not ( = ?auto_14202 ?auto_14208 ) ) ( not ( = ?auto_14205 ?auto_14202 ) ) ( HOIST-AT ?auto_14203 ?auto_14202 ) ( not ( = ?auto_14200 ?auto_14203 ) ) ( not ( = ?auto_14206 ?auto_14203 ) ) ( AVAILABLE ?auto_14203 ) ( SURFACE-AT ?auto_14197 ?auto_14202 ) ( ON ?auto_14197 ?auto_14201 ) ( CLEAR ?auto_14197 ) ( not ( = ?auto_14197 ?auto_14201 ) ) ( not ( = ?auto_14198 ?auto_14201 ) ) ( not ( = ?auto_14196 ?auto_14201 ) ) ( not ( = ?auto_14204 ?auto_14201 ) ) ( TRUCK-AT ?auto_14199 ?auto_14208 ) ( SURFACE-AT ?auto_14207 ?auto_14208 ) ( CLEAR ?auto_14207 ) ( LIFTING ?auto_14200 ?auto_14196 ) ( IS-CRATE ?auto_14196 ) ( not ( = ?auto_14207 ?auto_14196 ) ) ( not ( = ?auto_14197 ?auto_14207 ) ) ( not ( = ?auto_14198 ?auto_14207 ) ) ( not ( = ?auto_14204 ?auto_14207 ) ) ( not ( = ?auto_14201 ?auto_14207 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14197 ?auto_14198 )
      ( MAKE-2CRATE-VERIFY ?auto_14196 ?auto_14197 ?auto_14198 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14209 - SURFACE
      ?auto_14210 - SURFACE
      ?auto_14211 - SURFACE
      ?auto_14212 - SURFACE
    )
    :vars
    (
      ?auto_14221 - HOIST
      ?auto_14219 - PLACE
      ?auto_14213 - PLACE
      ?auto_14214 - HOIST
      ?auto_14215 - SURFACE
      ?auto_14218 - PLACE
      ?auto_14216 - HOIST
      ?auto_14220 - SURFACE
      ?auto_14217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14221 ?auto_14219 ) ( IS-CRATE ?auto_14212 ) ( not ( = ?auto_14211 ?auto_14212 ) ) ( not ( = ?auto_14210 ?auto_14211 ) ) ( not ( = ?auto_14210 ?auto_14212 ) ) ( not ( = ?auto_14213 ?auto_14219 ) ) ( HOIST-AT ?auto_14214 ?auto_14213 ) ( not ( = ?auto_14221 ?auto_14214 ) ) ( AVAILABLE ?auto_14214 ) ( SURFACE-AT ?auto_14212 ?auto_14213 ) ( ON ?auto_14212 ?auto_14215 ) ( CLEAR ?auto_14212 ) ( not ( = ?auto_14211 ?auto_14215 ) ) ( not ( = ?auto_14212 ?auto_14215 ) ) ( not ( = ?auto_14210 ?auto_14215 ) ) ( IS-CRATE ?auto_14211 ) ( not ( = ?auto_14218 ?auto_14219 ) ) ( not ( = ?auto_14213 ?auto_14218 ) ) ( HOIST-AT ?auto_14216 ?auto_14218 ) ( not ( = ?auto_14221 ?auto_14216 ) ) ( not ( = ?auto_14214 ?auto_14216 ) ) ( AVAILABLE ?auto_14216 ) ( SURFACE-AT ?auto_14211 ?auto_14218 ) ( ON ?auto_14211 ?auto_14220 ) ( CLEAR ?auto_14211 ) ( not ( = ?auto_14211 ?auto_14220 ) ) ( not ( = ?auto_14212 ?auto_14220 ) ) ( not ( = ?auto_14210 ?auto_14220 ) ) ( not ( = ?auto_14215 ?auto_14220 ) ) ( TRUCK-AT ?auto_14217 ?auto_14219 ) ( SURFACE-AT ?auto_14209 ?auto_14219 ) ( CLEAR ?auto_14209 ) ( LIFTING ?auto_14221 ?auto_14210 ) ( IS-CRATE ?auto_14210 ) ( not ( = ?auto_14209 ?auto_14210 ) ) ( not ( = ?auto_14211 ?auto_14209 ) ) ( not ( = ?auto_14212 ?auto_14209 ) ) ( not ( = ?auto_14215 ?auto_14209 ) ) ( not ( = ?auto_14220 ?auto_14209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14210 ?auto_14211 ?auto_14212 )
      ( MAKE-3CRATE-VERIFY ?auto_14209 ?auto_14210 ?auto_14211 ?auto_14212 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14222 - SURFACE
      ?auto_14223 - SURFACE
    )
    :vars
    (
      ?auto_14234 - HOIST
      ?auto_14231 - PLACE
      ?auto_14229 - SURFACE
      ?auto_14224 - PLACE
      ?auto_14225 - HOIST
      ?auto_14226 - SURFACE
      ?auto_14230 - PLACE
      ?auto_14227 - HOIST
      ?auto_14232 - SURFACE
      ?auto_14228 - TRUCK
      ?auto_14233 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14234 ?auto_14231 ) ( IS-CRATE ?auto_14223 ) ( not ( = ?auto_14222 ?auto_14223 ) ) ( not ( = ?auto_14229 ?auto_14222 ) ) ( not ( = ?auto_14229 ?auto_14223 ) ) ( not ( = ?auto_14224 ?auto_14231 ) ) ( HOIST-AT ?auto_14225 ?auto_14224 ) ( not ( = ?auto_14234 ?auto_14225 ) ) ( AVAILABLE ?auto_14225 ) ( SURFACE-AT ?auto_14223 ?auto_14224 ) ( ON ?auto_14223 ?auto_14226 ) ( CLEAR ?auto_14223 ) ( not ( = ?auto_14222 ?auto_14226 ) ) ( not ( = ?auto_14223 ?auto_14226 ) ) ( not ( = ?auto_14229 ?auto_14226 ) ) ( IS-CRATE ?auto_14222 ) ( not ( = ?auto_14230 ?auto_14231 ) ) ( not ( = ?auto_14224 ?auto_14230 ) ) ( HOIST-AT ?auto_14227 ?auto_14230 ) ( not ( = ?auto_14234 ?auto_14227 ) ) ( not ( = ?auto_14225 ?auto_14227 ) ) ( AVAILABLE ?auto_14227 ) ( SURFACE-AT ?auto_14222 ?auto_14230 ) ( ON ?auto_14222 ?auto_14232 ) ( CLEAR ?auto_14222 ) ( not ( = ?auto_14222 ?auto_14232 ) ) ( not ( = ?auto_14223 ?auto_14232 ) ) ( not ( = ?auto_14229 ?auto_14232 ) ) ( not ( = ?auto_14226 ?auto_14232 ) ) ( TRUCK-AT ?auto_14228 ?auto_14231 ) ( SURFACE-AT ?auto_14233 ?auto_14231 ) ( CLEAR ?auto_14233 ) ( IS-CRATE ?auto_14229 ) ( not ( = ?auto_14233 ?auto_14229 ) ) ( not ( = ?auto_14222 ?auto_14233 ) ) ( not ( = ?auto_14223 ?auto_14233 ) ) ( not ( = ?auto_14226 ?auto_14233 ) ) ( not ( = ?auto_14232 ?auto_14233 ) ) ( AVAILABLE ?auto_14234 ) ( IN ?auto_14229 ?auto_14228 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14234 ?auto_14229 ?auto_14228 ?auto_14231 )
      ( MAKE-2CRATE ?auto_14229 ?auto_14222 ?auto_14223 )
      ( MAKE-1CRATE-VERIFY ?auto_14222 ?auto_14223 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14235 - SURFACE
      ?auto_14236 - SURFACE
      ?auto_14237 - SURFACE
    )
    :vars
    (
      ?auto_14238 - HOIST
      ?auto_14247 - PLACE
      ?auto_14245 - PLACE
      ?auto_14241 - HOIST
      ?auto_14243 - SURFACE
      ?auto_14246 - PLACE
      ?auto_14244 - HOIST
      ?auto_14242 - SURFACE
      ?auto_14239 - TRUCK
      ?auto_14240 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14238 ?auto_14247 ) ( IS-CRATE ?auto_14237 ) ( not ( = ?auto_14236 ?auto_14237 ) ) ( not ( = ?auto_14235 ?auto_14236 ) ) ( not ( = ?auto_14235 ?auto_14237 ) ) ( not ( = ?auto_14245 ?auto_14247 ) ) ( HOIST-AT ?auto_14241 ?auto_14245 ) ( not ( = ?auto_14238 ?auto_14241 ) ) ( AVAILABLE ?auto_14241 ) ( SURFACE-AT ?auto_14237 ?auto_14245 ) ( ON ?auto_14237 ?auto_14243 ) ( CLEAR ?auto_14237 ) ( not ( = ?auto_14236 ?auto_14243 ) ) ( not ( = ?auto_14237 ?auto_14243 ) ) ( not ( = ?auto_14235 ?auto_14243 ) ) ( IS-CRATE ?auto_14236 ) ( not ( = ?auto_14246 ?auto_14247 ) ) ( not ( = ?auto_14245 ?auto_14246 ) ) ( HOIST-AT ?auto_14244 ?auto_14246 ) ( not ( = ?auto_14238 ?auto_14244 ) ) ( not ( = ?auto_14241 ?auto_14244 ) ) ( AVAILABLE ?auto_14244 ) ( SURFACE-AT ?auto_14236 ?auto_14246 ) ( ON ?auto_14236 ?auto_14242 ) ( CLEAR ?auto_14236 ) ( not ( = ?auto_14236 ?auto_14242 ) ) ( not ( = ?auto_14237 ?auto_14242 ) ) ( not ( = ?auto_14235 ?auto_14242 ) ) ( not ( = ?auto_14243 ?auto_14242 ) ) ( TRUCK-AT ?auto_14239 ?auto_14247 ) ( SURFACE-AT ?auto_14240 ?auto_14247 ) ( CLEAR ?auto_14240 ) ( IS-CRATE ?auto_14235 ) ( not ( = ?auto_14240 ?auto_14235 ) ) ( not ( = ?auto_14236 ?auto_14240 ) ) ( not ( = ?auto_14237 ?auto_14240 ) ) ( not ( = ?auto_14243 ?auto_14240 ) ) ( not ( = ?auto_14242 ?auto_14240 ) ) ( AVAILABLE ?auto_14238 ) ( IN ?auto_14235 ?auto_14239 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14236 ?auto_14237 )
      ( MAKE-2CRATE-VERIFY ?auto_14235 ?auto_14236 ?auto_14237 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14248 - SURFACE
      ?auto_14249 - SURFACE
      ?auto_14250 - SURFACE
      ?auto_14251 - SURFACE
    )
    :vars
    (
      ?auto_14257 - HOIST
      ?auto_14256 - PLACE
      ?auto_14259 - PLACE
      ?auto_14258 - HOIST
      ?auto_14253 - SURFACE
      ?auto_14254 - PLACE
      ?auto_14252 - HOIST
      ?auto_14260 - SURFACE
      ?auto_14255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14257 ?auto_14256 ) ( IS-CRATE ?auto_14251 ) ( not ( = ?auto_14250 ?auto_14251 ) ) ( not ( = ?auto_14249 ?auto_14250 ) ) ( not ( = ?auto_14249 ?auto_14251 ) ) ( not ( = ?auto_14259 ?auto_14256 ) ) ( HOIST-AT ?auto_14258 ?auto_14259 ) ( not ( = ?auto_14257 ?auto_14258 ) ) ( AVAILABLE ?auto_14258 ) ( SURFACE-AT ?auto_14251 ?auto_14259 ) ( ON ?auto_14251 ?auto_14253 ) ( CLEAR ?auto_14251 ) ( not ( = ?auto_14250 ?auto_14253 ) ) ( not ( = ?auto_14251 ?auto_14253 ) ) ( not ( = ?auto_14249 ?auto_14253 ) ) ( IS-CRATE ?auto_14250 ) ( not ( = ?auto_14254 ?auto_14256 ) ) ( not ( = ?auto_14259 ?auto_14254 ) ) ( HOIST-AT ?auto_14252 ?auto_14254 ) ( not ( = ?auto_14257 ?auto_14252 ) ) ( not ( = ?auto_14258 ?auto_14252 ) ) ( AVAILABLE ?auto_14252 ) ( SURFACE-AT ?auto_14250 ?auto_14254 ) ( ON ?auto_14250 ?auto_14260 ) ( CLEAR ?auto_14250 ) ( not ( = ?auto_14250 ?auto_14260 ) ) ( not ( = ?auto_14251 ?auto_14260 ) ) ( not ( = ?auto_14249 ?auto_14260 ) ) ( not ( = ?auto_14253 ?auto_14260 ) ) ( TRUCK-AT ?auto_14255 ?auto_14256 ) ( SURFACE-AT ?auto_14248 ?auto_14256 ) ( CLEAR ?auto_14248 ) ( IS-CRATE ?auto_14249 ) ( not ( = ?auto_14248 ?auto_14249 ) ) ( not ( = ?auto_14250 ?auto_14248 ) ) ( not ( = ?auto_14251 ?auto_14248 ) ) ( not ( = ?auto_14253 ?auto_14248 ) ) ( not ( = ?auto_14260 ?auto_14248 ) ) ( AVAILABLE ?auto_14257 ) ( IN ?auto_14249 ?auto_14255 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14249 ?auto_14250 ?auto_14251 )
      ( MAKE-3CRATE-VERIFY ?auto_14248 ?auto_14249 ?auto_14250 ?auto_14251 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14261 - SURFACE
      ?auto_14262 - SURFACE
    )
    :vars
    (
      ?auto_14270 - HOIST
      ?auto_14269 - PLACE
      ?auto_14263 - SURFACE
      ?auto_14272 - PLACE
      ?auto_14271 - HOIST
      ?auto_14265 - SURFACE
      ?auto_14267 - PLACE
      ?auto_14264 - HOIST
      ?auto_14273 - SURFACE
      ?auto_14266 - SURFACE
      ?auto_14268 - TRUCK
      ?auto_14274 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14270 ?auto_14269 ) ( IS-CRATE ?auto_14262 ) ( not ( = ?auto_14261 ?auto_14262 ) ) ( not ( = ?auto_14263 ?auto_14261 ) ) ( not ( = ?auto_14263 ?auto_14262 ) ) ( not ( = ?auto_14272 ?auto_14269 ) ) ( HOIST-AT ?auto_14271 ?auto_14272 ) ( not ( = ?auto_14270 ?auto_14271 ) ) ( AVAILABLE ?auto_14271 ) ( SURFACE-AT ?auto_14262 ?auto_14272 ) ( ON ?auto_14262 ?auto_14265 ) ( CLEAR ?auto_14262 ) ( not ( = ?auto_14261 ?auto_14265 ) ) ( not ( = ?auto_14262 ?auto_14265 ) ) ( not ( = ?auto_14263 ?auto_14265 ) ) ( IS-CRATE ?auto_14261 ) ( not ( = ?auto_14267 ?auto_14269 ) ) ( not ( = ?auto_14272 ?auto_14267 ) ) ( HOIST-AT ?auto_14264 ?auto_14267 ) ( not ( = ?auto_14270 ?auto_14264 ) ) ( not ( = ?auto_14271 ?auto_14264 ) ) ( AVAILABLE ?auto_14264 ) ( SURFACE-AT ?auto_14261 ?auto_14267 ) ( ON ?auto_14261 ?auto_14273 ) ( CLEAR ?auto_14261 ) ( not ( = ?auto_14261 ?auto_14273 ) ) ( not ( = ?auto_14262 ?auto_14273 ) ) ( not ( = ?auto_14263 ?auto_14273 ) ) ( not ( = ?auto_14265 ?auto_14273 ) ) ( SURFACE-AT ?auto_14266 ?auto_14269 ) ( CLEAR ?auto_14266 ) ( IS-CRATE ?auto_14263 ) ( not ( = ?auto_14266 ?auto_14263 ) ) ( not ( = ?auto_14261 ?auto_14266 ) ) ( not ( = ?auto_14262 ?auto_14266 ) ) ( not ( = ?auto_14265 ?auto_14266 ) ) ( not ( = ?auto_14273 ?auto_14266 ) ) ( AVAILABLE ?auto_14270 ) ( IN ?auto_14263 ?auto_14268 ) ( TRUCK-AT ?auto_14268 ?auto_14274 ) ( not ( = ?auto_14274 ?auto_14269 ) ) ( not ( = ?auto_14272 ?auto_14274 ) ) ( not ( = ?auto_14267 ?auto_14274 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14268 ?auto_14274 ?auto_14269 )
      ( MAKE-2CRATE ?auto_14263 ?auto_14261 ?auto_14262 )
      ( MAKE-1CRATE-VERIFY ?auto_14261 ?auto_14262 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14275 - SURFACE
      ?auto_14276 - SURFACE
      ?auto_14277 - SURFACE
    )
    :vars
    (
      ?auto_14280 - HOIST
      ?auto_14278 - PLACE
      ?auto_14283 - PLACE
      ?auto_14282 - HOIST
      ?auto_14288 - SURFACE
      ?auto_14287 - PLACE
      ?auto_14281 - HOIST
      ?auto_14285 - SURFACE
      ?auto_14279 - SURFACE
      ?auto_14286 - TRUCK
      ?auto_14284 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14280 ?auto_14278 ) ( IS-CRATE ?auto_14277 ) ( not ( = ?auto_14276 ?auto_14277 ) ) ( not ( = ?auto_14275 ?auto_14276 ) ) ( not ( = ?auto_14275 ?auto_14277 ) ) ( not ( = ?auto_14283 ?auto_14278 ) ) ( HOIST-AT ?auto_14282 ?auto_14283 ) ( not ( = ?auto_14280 ?auto_14282 ) ) ( AVAILABLE ?auto_14282 ) ( SURFACE-AT ?auto_14277 ?auto_14283 ) ( ON ?auto_14277 ?auto_14288 ) ( CLEAR ?auto_14277 ) ( not ( = ?auto_14276 ?auto_14288 ) ) ( not ( = ?auto_14277 ?auto_14288 ) ) ( not ( = ?auto_14275 ?auto_14288 ) ) ( IS-CRATE ?auto_14276 ) ( not ( = ?auto_14287 ?auto_14278 ) ) ( not ( = ?auto_14283 ?auto_14287 ) ) ( HOIST-AT ?auto_14281 ?auto_14287 ) ( not ( = ?auto_14280 ?auto_14281 ) ) ( not ( = ?auto_14282 ?auto_14281 ) ) ( AVAILABLE ?auto_14281 ) ( SURFACE-AT ?auto_14276 ?auto_14287 ) ( ON ?auto_14276 ?auto_14285 ) ( CLEAR ?auto_14276 ) ( not ( = ?auto_14276 ?auto_14285 ) ) ( not ( = ?auto_14277 ?auto_14285 ) ) ( not ( = ?auto_14275 ?auto_14285 ) ) ( not ( = ?auto_14288 ?auto_14285 ) ) ( SURFACE-AT ?auto_14279 ?auto_14278 ) ( CLEAR ?auto_14279 ) ( IS-CRATE ?auto_14275 ) ( not ( = ?auto_14279 ?auto_14275 ) ) ( not ( = ?auto_14276 ?auto_14279 ) ) ( not ( = ?auto_14277 ?auto_14279 ) ) ( not ( = ?auto_14288 ?auto_14279 ) ) ( not ( = ?auto_14285 ?auto_14279 ) ) ( AVAILABLE ?auto_14280 ) ( IN ?auto_14275 ?auto_14286 ) ( TRUCK-AT ?auto_14286 ?auto_14284 ) ( not ( = ?auto_14284 ?auto_14278 ) ) ( not ( = ?auto_14283 ?auto_14284 ) ) ( not ( = ?auto_14287 ?auto_14284 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14276 ?auto_14277 )
      ( MAKE-2CRATE-VERIFY ?auto_14275 ?auto_14276 ?auto_14277 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14289 - SURFACE
      ?auto_14290 - SURFACE
      ?auto_14291 - SURFACE
      ?auto_14292 - SURFACE
    )
    :vars
    (
      ?auto_14297 - HOIST
      ?auto_14296 - PLACE
      ?auto_14301 - PLACE
      ?auto_14295 - HOIST
      ?auto_14294 - SURFACE
      ?auto_14293 - PLACE
      ?auto_14302 - HOIST
      ?auto_14300 - SURFACE
      ?auto_14298 - TRUCK
      ?auto_14299 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14297 ?auto_14296 ) ( IS-CRATE ?auto_14292 ) ( not ( = ?auto_14291 ?auto_14292 ) ) ( not ( = ?auto_14290 ?auto_14291 ) ) ( not ( = ?auto_14290 ?auto_14292 ) ) ( not ( = ?auto_14301 ?auto_14296 ) ) ( HOIST-AT ?auto_14295 ?auto_14301 ) ( not ( = ?auto_14297 ?auto_14295 ) ) ( AVAILABLE ?auto_14295 ) ( SURFACE-AT ?auto_14292 ?auto_14301 ) ( ON ?auto_14292 ?auto_14294 ) ( CLEAR ?auto_14292 ) ( not ( = ?auto_14291 ?auto_14294 ) ) ( not ( = ?auto_14292 ?auto_14294 ) ) ( not ( = ?auto_14290 ?auto_14294 ) ) ( IS-CRATE ?auto_14291 ) ( not ( = ?auto_14293 ?auto_14296 ) ) ( not ( = ?auto_14301 ?auto_14293 ) ) ( HOIST-AT ?auto_14302 ?auto_14293 ) ( not ( = ?auto_14297 ?auto_14302 ) ) ( not ( = ?auto_14295 ?auto_14302 ) ) ( AVAILABLE ?auto_14302 ) ( SURFACE-AT ?auto_14291 ?auto_14293 ) ( ON ?auto_14291 ?auto_14300 ) ( CLEAR ?auto_14291 ) ( not ( = ?auto_14291 ?auto_14300 ) ) ( not ( = ?auto_14292 ?auto_14300 ) ) ( not ( = ?auto_14290 ?auto_14300 ) ) ( not ( = ?auto_14294 ?auto_14300 ) ) ( SURFACE-AT ?auto_14289 ?auto_14296 ) ( CLEAR ?auto_14289 ) ( IS-CRATE ?auto_14290 ) ( not ( = ?auto_14289 ?auto_14290 ) ) ( not ( = ?auto_14291 ?auto_14289 ) ) ( not ( = ?auto_14292 ?auto_14289 ) ) ( not ( = ?auto_14294 ?auto_14289 ) ) ( not ( = ?auto_14300 ?auto_14289 ) ) ( AVAILABLE ?auto_14297 ) ( IN ?auto_14290 ?auto_14298 ) ( TRUCK-AT ?auto_14298 ?auto_14299 ) ( not ( = ?auto_14299 ?auto_14296 ) ) ( not ( = ?auto_14301 ?auto_14299 ) ) ( not ( = ?auto_14293 ?auto_14299 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14290 ?auto_14291 ?auto_14292 )
      ( MAKE-3CRATE-VERIFY ?auto_14289 ?auto_14290 ?auto_14291 ?auto_14292 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14303 - SURFACE
      ?auto_14304 - SURFACE
    )
    :vars
    (
      ?auto_14310 - HOIST
      ?auto_14309 - PLACE
      ?auto_14308 - SURFACE
      ?auto_14315 - PLACE
      ?auto_14307 - HOIST
      ?auto_14306 - SURFACE
      ?auto_14305 - PLACE
      ?auto_14316 - HOIST
      ?auto_14314 - SURFACE
      ?auto_14311 - SURFACE
      ?auto_14312 - TRUCK
      ?auto_14313 - PLACE
      ?auto_14317 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14310 ?auto_14309 ) ( IS-CRATE ?auto_14304 ) ( not ( = ?auto_14303 ?auto_14304 ) ) ( not ( = ?auto_14308 ?auto_14303 ) ) ( not ( = ?auto_14308 ?auto_14304 ) ) ( not ( = ?auto_14315 ?auto_14309 ) ) ( HOIST-AT ?auto_14307 ?auto_14315 ) ( not ( = ?auto_14310 ?auto_14307 ) ) ( AVAILABLE ?auto_14307 ) ( SURFACE-AT ?auto_14304 ?auto_14315 ) ( ON ?auto_14304 ?auto_14306 ) ( CLEAR ?auto_14304 ) ( not ( = ?auto_14303 ?auto_14306 ) ) ( not ( = ?auto_14304 ?auto_14306 ) ) ( not ( = ?auto_14308 ?auto_14306 ) ) ( IS-CRATE ?auto_14303 ) ( not ( = ?auto_14305 ?auto_14309 ) ) ( not ( = ?auto_14315 ?auto_14305 ) ) ( HOIST-AT ?auto_14316 ?auto_14305 ) ( not ( = ?auto_14310 ?auto_14316 ) ) ( not ( = ?auto_14307 ?auto_14316 ) ) ( AVAILABLE ?auto_14316 ) ( SURFACE-AT ?auto_14303 ?auto_14305 ) ( ON ?auto_14303 ?auto_14314 ) ( CLEAR ?auto_14303 ) ( not ( = ?auto_14303 ?auto_14314 ) ) ( not ( = ?auto_14304 ?auto_14314 ) ) ( not ( = ?auto_14308 ?auto_14314 ) ) ( not ( = ?auto_14306 ?auto_14314 ) ) ( SURFACE-AT ?auto_14311 ?auto_14309 ) ( CLEAR ?auto_14311 ) ( IS-CRATE ?auto_14308 ) ( not ( = ?auto_14311 ?auto_14308 ) ) ( not ( = ?auto_14303 ?auto_14311 ) ) ( not ( = ?auto_14304 ?auto_14311 ) ) ( not ( = ?auto_14306 ?auto_14311 ) ) ( not ( = ?auto_14314 ?auto_14311 ) ) ( AVAILABLE ?auto_14310 ) ( TRUCK-AT ?auto_14312 ?auto_14313 ) ( not ( = ?auto_14313 ?auto_14309 ) ) ( not ( = ?auto_14315 ?auto_14313 ) ) ( not ( = ?auto_14305 ?auto_14313 ) ) ( HOIST-AT ?auto_14317 ?auto_14313 ) ( LIFTING ?auto_14317 ?auto_14308 ) ( not ( = ?auto_14310 ?auto_14317 ) ) ( not ( = ?auto_14307 ?auto_14317 ) ) ( not ( = ?auto_14316 ?auto_14317 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14317 ?auto_14308 ?auto_14312 ?auto_14313 )
      ( MAKE-2CRATE ?auto_14308 ?auto_14303 ?auto_14304 )
      ( MAKE-1CRATE-VERIFY ?auto_14303 ?auto_14304 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14318 - SURFACE
      ?auto_14319 - SURFACE
      ?auto_14320 - SURFACE
    )
    :vars
    (
      ?auto_14331 - HOIST
      ?auto_14330 - PLACE
      ?auto_14323 - PLACE
      ?auto_14328 - HOIST
      ?auto_14327 - SURFACE
      ?auto_14325 - PLACE
      ?auto_14324 - HOIST
      ?auto_14329 - SURFACE
      ?auto_14326 - SURFACE
      ?auto_14321 - TRUCK
      ?auto_14332 - PLACE
      ?auto_14322 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14331 ?auto_14330 ) ( IS-CRATE ?auto_14320 ) ( not ( = ?auto_14319 ?auto_14320 ) ) ( not ( = ?auto_14318 ?auto_14319 ) ) ( not ( = ?auto_14318 ?auto_14320 ) ) ( not ( = ?auto_14323 ?auto_14330 ) ) ( HOIST-AT ?auto_14328 ?auto_14323 ) ( not ( = ?auto_14331 ?auto_14328 ) ) ( AVAILABLE ?auto_14328 ) ( SURFACE-AT ?auto_14320 ?auto_14323 ) ( ON ?auto_14320 ?auto_14327 ) ( CLEAR ?auto_14320 ) ( not ( = ?auto_14319 ?auto_14327 ) ) ( not ( = ?auto_14320 ?auto_14327 ) ) ( not ( = ?auto_14318 ?auto_14327 ) ) ( IS-CRATE ?auto_14319 ) ( not ( = ?auto_14325 ?auto_14330 ) ) ( not ( = ?auto_14323 ?auto_14325 ) ) ( HOIST-AT ?auto_14324 ?auto_14325 ) ( not ( = ?auto_14331 ?auto_14324 ) ) ( not ( = ?auto_14328 ?auto_14324 ) ) ( AVAILABLE ?auto_14324 ) ( SURFACE-AT ?auto_14319 ?auto_14325 ) ( ON ?auto_14319 ?auto_14329 ) ( CLEAR ?auto_14319 ) ( not ( = ?auto_14319 ?auto_14329 ) ) ( not ( = ?auto_14320 ?auto_14329 ) ) ( not ( = ?auto_14318 ?auto_14329 ) ) ( not ( = ?auto_14327 ?auto_14329 ) ) ( SURFACE-AT ?auto_14326 ?auto_14330 ) ( CLEAR ?auto_14326 ) ( IS-CRATE ?auto_14318 ) ( not ( = ?auto_14326 ?auto_14318 ) ) ( not ( = ?auto_14319 ?auto_14326 ) ) ( not ( = ?auto_14320 ?auto_14326 ) ) ( not ( = ?auto_14327 ?auto_14326 ) ) ( not ( = ?auto_14329 ?auto_14326 ) ) ( AVAILABLE ?auto_14331 ) ( TRUCK-AT ?auto_14321 ?auto_14332 ) ( not ( = ?auto_14332 ?auto_14330 ) ) ( not ( = ?auto_14323 ?auto_14332 ) ) ( not ( = ?auto_14325 ?auto_14332 ) ) ( HOIST-AT ?auto_14322 ?auto_14332 ) ( LIFTING ?auto_14322 ?auto_14318 ) ( not ( = ?auto_14331 ?auto_14322 ) ) ( not ( = ?auto_14328 ?auto_14322 ) ) ( not ( = ?auto_14324 ?auto_14322 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14319 ?auto_14320 )
      ( MAKE-2CRATE-VERIFY ?auto_14318 ?auto_14319 ?auto_14320 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14333 - SURFACE
      ?auto_14334 - SURFACE
      ?auto_14335 - SURFACE
      ?auto_14336 - SURFACE
    )
    :vars
    (
      ?auto_14337 - HOIST
      ?auto_14345 - PLACE
      ?auto_14344 - PLACE
      ?auto_14342 - HOIST
      ?auto_14338 - SURFACE
      ?auto_14347 - PLACE
      ?auto_14340 - HOIST
      ?auto_14339 - SURFACE
      ?auto_14341 - TRUCK
      ?auto_14346 - PLACE
      ?auto_14343 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14337 ?auto_14345 ) ( IS-CRATE ?auto_14336 ) ( not ( = ?auto_14335 ?auto_14336 ) ) ( not ( = ?auto_14334 ?auto_14335 ) ) ( not ( = ?auto_14334 ?auto_14336 ) ) ( not ( = ?auto_14344 ?auto_14345 ) ) ( HOIST-AT ?auto_14342 ?auto_14344 ) ( not ( = ?auto_14337 ?auto_14342 ) ) ( AVAILABLE ?auto_14342 ) ( SURFACE-AT ?auto_14336 ?auto_14344 ) ( ON ?auto_14336 ?auto_14338 ) ( CLEAR ?auto_14336 ) ( not ( = ?auto_14335 ?auto_14338 ) ) ( not ( = ?auto_14336 ?auto_14338 ) ) ( not ( = ?auto_14334 ?auto_14338 ) ) ( IS-CRATE ?auto_14335 ) ( not ( = ?auto_14347 ?auto_14345 ) ) ( not ( = ?auto_14344 ?auto_14347 ) ) ( HOIST-AT ?auto_14340 ?auto_14347 ) ( not ( = ?auto_14337 ?auto_14340 ) ) ( not ( = ?auto_14342 ?auto_14340 ) ) ( AVAILABLE ?auto_14340 ) ( SURFACE-AT ?auto_14335 ?auto_14347 ) ( ON ?auto_14335 ?auto_14339 ) ( CLEAR ?auto_14335 ) ( not ( = ?auto_14335 ?auto_14339 ) ) ( not ( = ?auto_14336 ?auto_14339 ) ) ( not ( = ?auto_14334 ?auto_14339 ) ) ( not ( = ?auto_14338 ?auto_14339 ) ) ( SURFACE-AT ?auto_14333 ?auto_14345 ) ( CLEAR ?auto_14333 ) ( IS-CRATE ?auto_14334 ) ( not ( = ?auto_14333 ?auto_14334 ) ) ( not ( = ?auto_14335 ?auto_14333 ) ) ( not ( = ?auto_14336 ?auto_14333 ) ) ( not ( = ?auto_14338 ?auto_14333 ) ) ( not ( = ?auto_14339 ?auto_14333 ) ) ( AVAILABLE ?auto_14337 ) ( TRUCK-AT ?auto_14341 ?auto_14346 ) ( not ( = ?auto_14346 ?auto_14345 ) ) ( not ( = ?auto_14344 ?auto_14346 ) ) ( not ( = ?auto_14347 ?auto_14346 ) ) ( HOIST-AT ?auto_14343 ?auto_14346 ) ( LIFTING ?auto_14343 ?auto_14334 ) ( not ( = ?auto_14337 ?auto_14343 ) ) ( not ( = ?auto_14342 ?auto_14343 ) ) ( not ( = ?auto_14340 ?auto_14343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14334 ?auto_14335 ?auto_14336 )
      ( MAKE-3CRATE-VERIFY ?auto_14333 ?auto_14334 ?auto_14335 ?auto_14336 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14348 - SURFACE
      ?auto_14349 - SURFACE
    )
    :vars
    (
      ?auto_14350 - HOIST
      ?auto_14360 - PLACE
      ?auto_14359 - SURFACE
      ?auto_14358 - PLACE
      ?auto_14356 - HOIST
      ?auto_14351 - SURFACE
      ?auto_14362 - PLACE
      ?auto_14353 - HOIST
      ?auto_14352 - SURFACE
      ?auto_14355 - SURFACE
      ?auto_14354 - TRUCK
      ?auto_14361 - PLACE
      ?auto_14357 - HOIST
      ?auto_14363 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14350 ?auto_14360 ) ( IS-CRATE ?auto_14349 ) ( not ( = ?auto_14348 ?auto_14349 ) ) ( not ( = ?auto_14359 ?auto_14348 ) ) ( not ( = ?auto_14359 ?auto_14349 ) ) ( not ( = ?auto_14358 ?auto_14360 ) ) ( HOIST-AT ?auto_14356 ?auto_14358 ) ( not ( = ?auto_14350 ?auto_14356 ) ) ( AVAILABLE ?auto_14356 ) ( SURFACE-AT ?auto_14349 ?auto_14358 ) ( ON ?auto_14349 ?auto_14351 ) ( CLEAR ?auto_14349 ) ( not ( = ?auto_14348 ?auto_14351 ) ) ( not ( = ?auto_14349 ?auto_14351 ) ) ( not ( = ?auto_14359 ?auto_14351 ) ) ( IS-CRATE ?auto_14348 ) ( not ( = ?auto_14362 ?auto_14360 ) ) ( not ( = ?auto_14358 ?auto_14362 ) ) ( HOIST-AT ?auto_14353 ?auto_14362 ) ( not ( = ?auto_14350 ?auto_14353 ) ) ( not ( = ?auto_14356 ?auto_14353 ) ) ( AVAILABLE ?auto_14353 ) ( SURFACE-AT ?auto_14348 ?auto_14362 ) ( ON ?auto_14348 ?auto_14352 ) ( CLEAR ?auto_14348 ) ( not ( = ?auto_14348 ?auto_14352 ) ) ( not ( = ?auto_14349 ?auto_14352 ) ) ( not ( = ?auto_14359 ?auto_14352 ) ) ( not ( = ?auto_14351 ?auto_14352 ) ) ( SURFACE-AT ?auto_14355 ?auto_14360 ) ( CLEAR ?auto_14355 ) ( IS-CRATE ?auto_14359 ) ( not ( = ?auto_14355 ?auto_14359 ) ) ( not ( = ?auto_14348 ?auto_14355 ) ) ( not ( = ?auto_14349 ?auto_14355 ) ) ( not ( = ?auto_14351 ?auto_14355 ) ) ( not ( = ?auto_14352 ?auto_14355 ) ) ( AVAILABLE ?auto_14350 ) ( TRUCK-AT ?auto_14354 ?auto_14361 ) ( not ( = ?auto_14361 ?auto_14360 ) ) ( not ( = ?auto_14358 ?auto_14361 ) ) ( not ( = ?auto_14362 ?auto_14361 ) ) ( HOIST-AT ?auto_14357 ?auto_14361 ) ( not ( = ?auto_14350 ?auto_14357 ) ) ( not ( = ?auto_14356 ?auto_14357 ) ) ( not ( = ?auto_14353 ?auto_14357 ) ) ( AVAILABLE ?auto_14357 ) ( SURFACE-AT ?auto_14359 ?auto_14361 ) ( ON ?auto_14359 ?auto_14363 ) ( CLEAR ?auto_14359 ) ( not ( = ?auto_14348 ?auto_14363 ) ) ( not ( = ?auto_14349 ?auto_14363 ) ) ( not ( = ?auto_14359 ?auto_14363 ) ) ( not ( = ?auto_14351 ?auto_14363 ) ) ( not ( = ?auto_14352 ?auto_14363 ) ) ( not ( = ?auto_14355 ?auto_14363 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14357 ?auto_14359 ?auto_14363 ?auto_14361 )
      ( MAKE-2CRATE ?auto_14359 ?auto_14348 ?auto_14349 )
      ( MAKE-1CRATE-VERIFY ?auto_14348 ?auto_14349 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14364 - SURFACE
      ?auto_14365 - SURFACE
      ?auto_14366 - SURFACE
    )
    :vars
    (
      ?auto_14376 - HOIST
      ?auto_14377 - PLACE
      ?auto_14379 - PLACE
      ?auto_14369 - HOIST
      ?auto_14374 - SURFACE
      ?auto_14378 - PLACE
      ?auto_14372 - HOIST
      ?auto_14370 - SURFACE
      ?auto_14368 - SURFACE
      ?auto_14373 - TRUCK
      ?auto_14371 - PLACE
      ?auto_14367 - HOIST
      ?auto_14375 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14376 ?auto_14377 ) ( IS-CRATE ?auto_14366 ) ( not ( = ?auto_14365 ?auto_14366 ) ) ( not ( = ?auto_14364 ?auto_14365 ) ) ( not ( = ?auto_14364 ?auto_14366 ) ) ( not ( = ?auto_14379 ?auto_14377 ) ) ( HOIST-AT ?auto_14369 ?auto_14379 ) ( not ( = ?auto_14376 ?auto_14369 ) ) ( AVAILABLE ?auto_14369 ) ( SURFACE-AT ?auto_14366 ?auto_14379 ) ( ON ?auto_14366 ?auto_14374 ) ( CLEAR ?auto_14366 ) ( not ( = ?auto_14365 ?auto_14374 ) ) ( not ( = ?auto_14366 ?auto_14374 ) ) ( not ( = ?auto_14364 ?auto_14374 ) ) ( IS-CRATE ?auto_14365 ) ( not ( = ?auto_14378 ?auto_14377 ) ) ( not ( = ?auto_14379 ?auto_14378 ) ) ( HOIST-AT ?auto_14372 ?auto_14378 ) ( not ( = ?auto_14376 ?auto_14372 ) ) ( not ( = ?auto_14369 ?auto_14372 ) ) ( AVAILABLE ?auto_14372 ) ( SURFACE-AT ?auto_14365 ?auto_14378 ) ( ON ?auto_14365 ?auto_14370 ) ( CLEAR ?auto_14365 ) ( not ( = ?auto_14365 ?auto_14370 ) ) ( not ( = ?auto_14366 ?auto_14370 ) ) ( not ( = ?auto_14364 ?auto_14370 ) ) ( not ( = ?auto_14374 ?auto_14370 ) ) ( SURFACE-AT ?auto_14368 ?auto_14377 ) ( CLEAR ?auto_14368 ) ( IS-CRATE ?auto_14364 ) ( not ( = ?auto_14368 ?auto_14364 ) ) ( not ( = ?auto_14365 ?auto_14368 ) ) ( not ( = ?auto_14366 ?auto_14368 ) ) ( not ( = ?auto_14374 ?auto_14368 ) ) ( not ( = ?auto_14370 ?auto_14368 ) ) ( AVAILABLE ?auto_14376 ) ( TRUCK-AT ?auto_14373 ?auto_14371 ) ( not ( = ?auto_14371 ?auto_14377 ) ) ( not ( = ?auto_14379 ?auto_14371 ) ) ( not ( = ?auto_14378 ?auto_14371 ) ) ( HOIST-AT ?auto_14367 ?auto_14371 ) ( not ( = ?auto_14376 ?auto_14367 ) ) ( not ( = ?auto_14369 ?auto_14367 ) ) ( not ( = ?auto_14372 ?auto_14367 ) ) ( AVAILABLE ?auto_14367 ) ( SURFACE-AT ?auto_14364 ?auto_14371 ) ( ON ?auto_14364 ?auto_14375 ) ( CLEAR ?auto_14364 ) ( not ( = ?auto_14365 ?auto_14375 ) ) ( not ( = ?auto_14366 ?auto_14375 ) ) ( not ( = ?auto_14364 ?auto_14375 ) ) ( not ( = ?auto_14374 ?auto_14375 ) ) ( not ( = ?auto_14370 ?auto_14375 ) ) ( not ( = ?auto_14368 ?auto_14375 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14365 ?auto_14366 )
      ( MAKE-2CRATE-VERIFY ?auto_14364 ?auto_14365 ?auto_14366 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14380 - SURFACE
      ?auto_14381 - SURFACE
      ?auto_14382 - SURFACE
      ?auto_14383 - SURFACE
    )
    :vars
    (
      ?auto_14392 - HOIST
      ?auto_14391 - PLACE
      ?auto_14389 - PLACE
      ?auto_14393 - HOIST
      ?auto_14390 - SURFACE
      ?auto_14386 - PLACE
      ?auto_14387 - HOIST
      ?auto_14385 - SURFACE
      ?auto_14388 - TRUCK
      ?auto_14395 - PLACE
      ?auto_14384 - HOIST
      ?auto_14394 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14392 ?auto_14391 ) ( IS-CRATE ?auto_14383 ) ( not ( = ?auto_14382 ?auto_14383 ) ) ( not ( = ?auto_14381 ?auto_14382 ) ) ( not ( = ?auto_14381 ?auto_14383 ) ) ( not ( = ?auto_14389 ?auto_14391 ) ) ( HOIST-AT ?auto_14393 ?auto_14389 ) ( not ( = ?auto_14392 ?auto_14393 ) ) ( AVAILABLE ?auto_14393 ) ( SURFACE-AT ?auto_14383 ?auto_14389 ) ( ON ?auto_14383 ?auto_14390 ) ( CLEAR ?auto_14383 ) ( not ( = ?auto_14382 ?auto_14390 ) ) ( not ( = ?auto_14383 ?auto_14390 ) ) ( not ( = ?auto_14381 ?auto_14390 ) ) ( IS-CRATE ?auto_14382 ) ( not ( = ?auto_14386 ?auto_14391 ) ) ( not ( = ?auto_14389 ?auto_14386 ) ) ( HOIST-AT ?auto_14387 ?auto_14386 ) ( not ( = ?auto_14392 ?auto_14387 ) ) ( not ( = ?auto_14393 ?auto_14387 ) ) ( AVAILABLE ?auto_14387 ) ( SURFACE-AT ?auto_14382 ?auto_14386 ) ( ON ?auto_14382 ?auto_14385 ) ( CLEAR ?auto_14382 ) ( not ( = ?auto_14382 ?auto_14385 ) ) ( not ( = ?auto_14383 ?auto_14385 ) ) ( not ( = ?auto_14381 ?auto_14385 ) ) ( not ( = ?auto_14390 ?auto_14385 ) ) ( SURFACE-AT ?auto_14380 ?auto_14391 ) ( CLEAR ?auto_14380 ) ( IS-CRATE ?auto_14381 ) ( not ( = ?auto_14380 ?auto_14381 ) ) ( not ( = ?auto_14382 ?auto_14380 ) ) ( not ( = ?auto_14383 ?auto_14380 ) ) ( not ( = ?auto_14390 ?auto_14380 ) ) ( not ( = ?auto_14385 ?auto_14380 ) ) ( AVAILABLE ?auto_14392 ) ( TRUCK-AT ?auto_14388 ?auto_14395 ) ( not ( = ?auto_14395 ?auto_14391 ) ) ( not ( = ?auto_14389 ?auto_14395 ) ) ( not ( = ?auto_14386 ?auto_14395 ) ) ( HOIST-AT ?auto_14384 ?auto_14395 ) ( not ( = ?auto_14392 ?auto_14384 ) ) ( not ( = ?auto_14393 ?auto_14384 ) ) ( not ( = ?auto_14387 ?auto_14384 ) ) ( AVAILABLE ?auto_14384 ) ( SURFACE-AT ?auto_14381 ?auto_14395 ) ( ON ?auto_14381 ?auto_14394 ) ( CLEAR ?auto_14381 ) ( not ( = ?auto_14382 ?auto_14394 ) ) ( not ( = ?auto_14383 ?auto_14394 ) ) ( not ( = ?auto_14381 ?auto_14394 ) ) ( not ( = ?auto_14390 ?auto_14394 ) ) ( not ( = ?auto_14385 ?auto_14394 ) ) ( not ( = ?auto_14380 ?auto_14394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14381 ?auto_14382 ?auto_14383 )
      ( MAKE-3CRATE-VERIFY ?auto_14380 ?auto_14381 ?auto_14382 ?auto_14383 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14396 - SURFACE
      ?auto_14397 - SURFACE
    )
    :vars
    (
      ?auto_14406 - HOIST
      ?auto_14405 - PLACE
      ?auto_14408 - SURFACE
      ?auto_14403 - PLACE
      ?auto_14407 - HOIST
      ?auto_14404 - SURFACE
      ?auto_14400 - PLACE
      ?auto_14401 - HOIST
      ?auto_14399 - SURFACE
      ?auto_14411 - SURFACE
      ?auto_14410 - PLACE
      ?auto_14398 - HOIST
      ?auto_14409 - SURFACE
      ?auto_14402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14406 ?auto_14405 ) ( IS-CRATE ?auto_14397 ) ( not ( = ?auto_14396 ?auto_14397 ) ) ( not ( = ?auto_14408 ?auto_14396 ) ) ( not ( = ?auto_14408 ?auto_14397 ) ) ( not ( = ?auto_14403 ?auto_14405 ) ) ( HOIST-AT ?auto_14407 ?auto_14403 ) ( not ( = ?auto_14406 ?auto_14407 ) ) ( AVAILABLE ?auto_14407 ) ( SURFACE-AT ?auto_14397 ?auto_14403 ) ( ON ?auto_14397 ?auto_14404 ) ( CLEAR ?auto_14397 ) ( not ( = ?auto_14396 ?auto_14404 ) ) ( not ( = ?auto_14397 ?auto_14404 ) ) ( not ( = ?auto_14408 ?auto_14404 ) ) ( IS-CRATE ?auto_14396 ) ( not ( = ?auto_14400 ?auto_14405 ) ) ( not ( = ?auto_14403 ?auto_14400 ) ) ( HOIST-AT ?auto_14401 ?auto_14400 ) ( not ( = ?auto_14406 ?auto_14401 ) ) ( not ( = ?auto_14407 ?auto_14401 ) ) ( AVAILABLE ?auto_14401 ) ( SURFACE-AT ?auto_14396 ?auto_14400 ) ( ON ?auto_14396 ?auto_14399 ) ( CLEAR ?auto_14396 ) ( not ( = ?auto_14396 ?auto_14399 ) ) ( not ( = ?auto_14397 ?auto_14399 ) ) ( not ( = ?auto_14408 ?auto_14399 ) ) ( not ( = ?auto_14404 ?auto_14399 ) ) ( SURFACE-AT ?auto_14411 ?auto_14405 ) ( CLEAR ?auto_14411 ) ( IS-CRATE ?auto_14408 ) ( not ( = ?auto_14411 ?auto_14408 ) ) ( not ( = ?auto_14396 ?auto_14411 ) ) ( not ( = ?auto_14397 ?auto_14411 ) ) ( not ( = ?auto_14404 ?auto_14411 ) ) ( not ( = ?auto_14399 ?auto_14411 ) ) ( AVAILABLE ?auto_14406 ) ( not ( = ?auto_14410 ?auto_14405 ) ) ( not ( = ?auto_14403 ?auto_14410 ) ) ( not ( = ?auto_14400 ?auto_14410 ) ) ( HOIST-AT ?auto_14398 ?auto_14410 ) ( not ( = ?auto_14406 ?auto_14398 ) ) ( not ( = ?auto_14407 ?auto_14398 ) ) ( not ( = ?auto_14401 ?auto_14398 ) ) ( AVAILABLE ?auto_14398 ) ( SURFACE-AT ?auto_14408 ?auto_14410 ) ( ON ?auto_14408 ?auto_14409 ) ( CLEAR ?auto_14408 ) ( not ( = ?auto_14396 ?auto_14409 ) ) ( not ( = ?auto_14397 ?auto_14409 ) ) ( not ( = ?auto_14408 ?auto_14409 ) ) ( not ( = ?auto_14404 ?auto_14409 ) ) ( not ( = ?auto_14399 ?auto_14409 ) ) ( not ( = ?auto_14411 ?auto_14409 ) ) ( TRUCK-AT ?auto_14402 ?auto_14405 ) )
    :subtasks
    ( ( !DRIVE ?auto_14402 ?auto_14405 ?auto_14410 )
      ( MAKE-2CRATE ?auto_14408 ?auto_14396 ?auto_14397 )
      ( MAKE-1CRATE-VERIFY ?auto_14396 ?auto_14397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14412 - SURFACE
      ?auto_14413 - SURFACE
      ?auto_14414 - SURFACE
    )
    :vars
    (
      ?auto_14421 - HOIST
      ?auto_14417 - PLACE
      ?auto_14427 - PLACE
      ?auto_14426 - HOIST
      ?auto_14418 - SURFACE
      ?auto_14415 - PLACE
      ?auto_14416 - HOIST
      ?auto_14419 - SURFACE
      ?auto_14424 - SURFACE
      ?auto_14420 - PLACE
      ?auto_14422 - HOIST
      ?auto_14423 - SURFACE
      ?auto_14425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14421 ?auto_14417 ) ( IS-CRATE ?auto_14414 ) ( not ( = ?auto_14413 ?auto_14414 ) ) ( not ( = ?auto_14412 ?auto_14413 ) ) ( not ( = ?auto_14412 ?auto_14414 ) ) ( not ( = ?auto_14427 ?auto_14417 ) ) ( HOIST-AT ?auto_14426 ?auto_14427 ) ( not ( = ?auto_14421 ?auto_14426 ) ) ( AVAILABLE ?auto_14426 ) ( SURFACE-AT ?auto_14414 ?auto_14427 ) ( ON ?auto_14414 ?auto_14418 ) ( CLEAR ?auto_14414 ) ( not ( = ?auto_14413 ?auto_14418 ) ) ( not ( = ?auto_14414 ?auto_14418 ) ) ( not ( = ?auto_14412 ?auto_14418 ) ) ( IS-CRATE ?auto_14413 ) ( not ( = ?auto_14415 ?auto_14417 ) ) ( not ( = ?auto_14427 ?auto_14415 ) ) ( HOIST-AT ?auto_14416 ?auto_14415 ) ( not ( = ?auto_14421 ?auto_14416 ) ) ( not ( = ?auto_14426 ?auto_14416 ) ) ( AVAILABLE ?auto_14416 ) ( SURFACE-AT ?auto_14413 ?auto_14415 ) ( ON ?auto_14413 ?auto_14419 ) ( CLEAR ?auto_14413 ) ( not ( = ?auto_14413 ?auto_14419 ) ) ( not ( = ?auto_14414 ?auto_14419 ) ) ( not ( = ?auto_14412 ?auto_14419 ) ) ( not ( = ?auto_14418 ?auto_14419 ) ) ( SURFACE-AT ?auto_14424 ?auto_14417 ) ( CLEAR ?auto_14424 ) ( IS-CRATE ?auto_14412 ) ( not ( = ?auto_14424 ?auto_14412 ) ) ( not ( = ?auto_14413 ?auto_14424 ) ) ( not ( = ?auto_14414 ?auto_14424 ) ) ( not ( = ?auto_14418 ?auto_14424 ) ) ( not ( = ?auto_14419 ?auto_14424 ) ) ( AVAILABLE ?auto_14421 ) ( not ( = ?auto_14420 ?auto_14417 ) ) ( not ( = ?auto_14427 ?auto_14420 ) ) ( not ( = ?auto_14415 ?auto_14420 ) ) ( HOIST-AT ?auto_14422 ?auto_14420 ) ( not ( = ?auto_14421 ?auto_14422 ) ) ( not ( = ?auto_14426 ?auto_14422 ) ) ( not ( = ?auto_14416 ?auto_14422 ) ) ( AVAILABLE ?auto_14422 ) ( SURFACE-AT ?auto_14412 ?auto_14420 ) ( ON ?auto_14412 ?auto_14423 ) ( CLEAR ?auto_14412 ) ( not ( = ?auto_14413 ?auto_14423 ) ) ( not ( = ?auto_14414 ?auto_14423 ) ) ( not ( = ?auto_14412 ?auto_14423 ) ) ( not ( = ?auto_14418 ?auto_14423 ) ) ( not ( = ?auto_14419 ?auto_14423 ) ) ( not ( = ?auto_14424 ?auto_14423 ) ) ( TRUCK-AT ?auto_14425 ?auto_14417 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14413 ?auto_14414 )
      ( MAKE-2CRATE-VERIFY ?auto_14412 ?auto_14413 ?auto_14414 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14428 - SURFACE
      ?auto_14429 - SURFACE
      ?auto_14430 - SURFACE
      ?auto_14431 - SURFACE
    )
    :vars
    (
      ?auto_14432 - HOIST
      ?auto_14438 - PLACE
      ?auto_14437 - PLACE
      ?auto_14435 - HOIST
      ?auto_14441 - SURFACE
      ?auto_14442 - PLACE
      ?auto_14436 - HOIST
      ?auto_14440 - SURFACE
      ?auto_14443 - PLACE
      ?auto_14439 - HOIST
      ?auto_14433 - SURFACE
      ?auto_14434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14432 ?auto_14438 ) ( IS-CRATE ?auto_14431 ) ( not ( = ?auto_14430 ?auto_14431 ) ) ( not ( = ?auto_14429 ?auto_14430 ) ) ( not ( = ?auto_14429 ?auto_14431 ) ) ( not ( = ?auto_14437 ?auto_14438 ) ) ( HOIST-AT ?auto_14435 ?auto_14437 ) ( not ( = ?auto_14432 ?auto_14435 ) ) ( AVAILABLE ?auto_14435 ) ( SURFACE-AT ?auto_14431 ?auto_14437 ) ( ON ?auto_14431 ?auto_14441 ) ( CLEAR ?auto_14431 ) ( not ( = ?auto_14430 ?auto_14441 ) ) ( not ( = ?auto_14431 ?auto_14441 ) ) ( not ( = ?auto_14429 ?auto_14441 ) ) ( IS-CRATE ?auto_14430 ) ( not ( = ?auto_14442 ?auto_14438 ) ) ( not ( = ?auto_14437 ?auto_14442 ) ) ( HOIST-AT ?auto_14436 ?auto_14442 ) ( not ( = ?auto_14432 ?auto_14436 ) ) ( not ( = ?auto_14435 ?auto_14436 ) ) ( AVAILABLE ?auto_14436 ) ( SURFACE-AT ?auto_14430 ?auto_14442 ) ( ON ?auto_14430 ?auto_14440 ) ( CLEAR ?auto_14430 ) ( not ( = ?auto_14430 ?auto_14440 ) ) ( not ( = ?auto_14431 ?auto_14440 ) ) ( not ( = ?auto_14429 ?auto_14440 ) ) ( not ( = ?auto_14441 ?auto_14440 ) ) ( SURFACE-AT ?auto_14428 ?auto_14438 ) ( CLEAR ?auto_14428 ) ( IS-CRATE ?auto_14429 ) ( not ( = ?auto_14428 ?auto_14429 ) ) ( not ( = ?auto_14430 ?auto_14428 ) ) ( not ( = ?auto_14431 ?auto_14428 ) ) ( not ( = ?auto_14441 ?auto_14428 ) ) ( not ( = ?auto_14440 ?auto_14428 ) ) ( AVAILABLE ?auto_14432 ) ( not ( = ?auto_14443 ?auto_14438 ) ) ( not ( = ?auto_14437 ?auto_14443 ) ) ( not ( = ?auto_14442 ?auto_14443 ) ) ( HOIST-AT ?auto_14439 ?auto_14443 ) ( not ( = ?auto_14432 ?auto_14439 ) ) ( not ( = ?auto_14435 ?auto_14439 ) ) ( not ( = ?auto_14436 ?auto_14439 ) ) ( AVAILABLE ?auto_14439 ) ( SURFACE-AT ?auto_14429 ?auto_14443 ) ( ON ?auto_14429 ?auto_14433 ) ( CLEAR ?auto_14429 ) ( not ( = ?auto_14430 ?auto_14433 ) ) ( not ( = ?auto_14431 ?auto_14433 ) ) ( not ( = ?auto_14429 ?auto_14433 ) ) ( not ( = ?auto_14441 ?auto_14433 ) ) ( not ( = ?auto_14440 ?auto_14433 ) ) ( not ( = ?auto_14428 ?auto_14433 ) ) ( TRUCK-AT ?auto_14434 ?auto_14438 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14429 ?auto_14430 ?auto_14431 )
      ( MAKE-3CRATE-VERIFY ?auto_14428 ?auto_14429 ?auto_14430 ?auto_14431 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14458 - SURFACE
      ?auto_14459 - SURFACE
    )
    :vars
    (
      ?auto_14460 - HOIST
      ?auto_14461 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14460 ?auto_14461 ) ( SURFACE-AT ?auto_14458 ?auto_14461 ) ( CLEAR ?auto_14458 ) ( LIFTING ?auto_14460 ?auto_14459 ) ( IS-CRATE ?auto_14459 ) ( not ( = ?auto_14458 ?auto_14459 ) ) )
    :subtasks
    ( ( !DROP ?auto_14460 ?auto_14459 ?auto_14458 ?auto_14461 )
      ( MAKE-1CRATE-VERIFY ?auto_14458 ?auto_14459 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14462 - SURFACE
      ?auto_14463 - SURFACE
      ?auto_14464 - SURFACE
    )
    :vars
    (
      ?auto_14466 - HOIST
      ?auto_14465 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14466 ?auto_14465 ) ( SURFACE-AT ?auto_14463 ?auto_14465 ) ( CLEAR ?auto_14463 ) ( LIFTING ?auto_14466 ?auto_14464 ) ( IS-CRATE ?auto_14464 ) ( not ( = ?auto_14463 ?auto_14464 ) ) ( ON ?auto_14463 ?auto_14462 ) ( not ( = ?auto_14462 ?auto_14463 ) ) ( not ( = ?auto_14462 ?auto_14464 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14463 ?auto_14464 )
      ( MAKE-2CRATE-VERIFY ?auto_14462 ?auto_14463 ?auto_14464 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14467 - SURFACE
      ?auto_14468 - SURFACE
      ?auto_14469 - SURFACE
      ?auto_14470 - SURFACE
    )
    :vars
    (
      ?auto_14472 - HOIST
      ?auto_14471 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14472 ?auto_14471 ) ( SURFACE-AT ?auto_14469 ?auto_14471 ) ( CLEAR ?auto_14469 ) ( LIFTING ?auto_14472 ?auto_14470 ) ( IS-CRATE ?auto_14470 ) ( not ( = ?auto_14469 ?auto_14470 ) ) ( ON ?auto_14468 ?auto_14467 ) ( ON ?auto_14469 ?auto_14468 ) ( not ( = ?auto_14467 ?auto_14468 ) ) ( not ( = ?auto_14467 ?auto_14469 ) ) ( not ( = ?auto_14467 ?auto_14470 ) ) ( not ( = ?auto_14468 ?auto_14469 ) ) ( not ( = ?auto_14468 ?auto_14470 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14469 ?auto_14470 )
      ( MAKE-3CRATE-VERIFY ?auto_14467 ?auto_14468 ?auto_14469 ?auto_14470 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14473 - SURFACE
      ?auto_14474 - SURFACE
      ?auto_14475 - SURFACE
      ?auto_14476 - SURFACE
      ?auto_14477 - SURFACE
    )
    :vars
    (
      ?auto_14479 - HOIST
      ?auto_14478 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14479 ?auto_14478 ) ( SURFACE-AT ?auto_14476 ?auto_14478 ) ( CLEAR ?auto_14476 ) ( LIFTING ?auto_14479 ?auto_14477 ) ( IS-CRATE ?auto_14477 ) ( not ( = ?auto_14476 ?auto_14477 ) ) ( ON ?auto_14474 ?auto_14473 ) ( ON ?auto_14475 ?auto_14474 ) ( ON ?auto_14476 ?auto_14475 ) ( not ( = ?auto_14473 ?auto_14474 ) ) ( not ( = ?auto_14473 ?auto_14475 ) ) ( not ( = ?auto_14473 ?auto_14476 ) ) ( not ( = ?auto_14473 ?auto_14477 ) ) ( not ( = ?auto_14474 ?auto_14475 ) ) ( not ( = ?auto_14474 ?auto_14476 ) ) ( not ( = ?auto_14474 ?auto_14477 ) ) ( not ( = ?auto_14475 ?auto_14476 ) ) ( not ( = ?auto_14475 ?auto_14477 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14476 ?auto_14477 )
      ( MAKE-4CRATE-VERIFY ?auto_14473 ?auto_14474 ?auto_14475 ?auto_14476 ?auto_14477 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14480 - SURFACE
      ?auto_14481 - SURFACE
    )
    :vars
    (
      ?auto_14483 - HOIST
      ?auto_14482 - PLACE
      ?auto_14484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14483 ?auto_14482 ) ( SURFACE-AT ?auto_14480 ?auto_14482 ) ( CLEAR ?auto_14480 ) ( IS-CRATE ?auto_14481 ) ( not ( = ?auto_14480 ?auto_14481 ) ) ( TRUCK-AT ?auto_14484 ?auto_14482 ) ( AVAILABLE ?auto_14483 ) ( IN ?auto_14481 ?auto_14484 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14483 ?auto_14481 ?auto_14484 ?auto_14482 )
      ( MAKE-1CRATE ?auto_14480 ?auto_14481 )
      ( MAKE-1CRATE-VERIFY ?auto_14480 ?auto_14481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14485 - SURFACE
      ?auto_14486 - SURFACE
      ?auto_14487 - SURFACE
    )
    :vars
    (
      ?auto_14488 - HOIST
      ?auto_14490 - PLACE
      ?auto_14489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14488 ?auto_14490 ) ( SURFACE-AT ?auto_14486 ?auto_14490 ) ( CLEAR ?auto_14486 ) ( IS-CRATE ?auto_14487 ) ( not ( = ?auto_14486 ?auto_14487 ) ) ( TRUCK-AT ?auto_14489 ?auto_14490 ) ( AVAILABLE ?auto_14488 ) ( IN ?auto_14487 ?auto_14489 ) ( ON ?auto_14486 ?auto_14485 ) ( not ( = ?auto_14485 ?auto_14486 ) ) ( not ( = ?auto_14485 ?auto_14487 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14486 ?auto_14487 )
      ( MAKE-2CRATE-VERIFY ?auto_14485 ?auto_14486 ?auto_14487 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14491 - SURFACE
      ?auto_14492 - SURFACE
      ?auto_14493 - SURFACE
      ?auto_14494 - SURFACE
    )
    :vars
    (
      ?auto_14496 - HOIST
      ?auto_14497 - PLACE
      ?auto_14495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14496 ?auto_14497 ) ( SURFACE-AT ?auto_14493 ?auto_14497 ) ( CLEAR ?auto_14493 ) ( IS-CRATE ?auto_14494 ) ( not ( = ?auto_14493 ?auto_14494 ) ) ( TRUCK-AT ?auto_14495 ?auto_14497 ) ( AVAILABLE ?auto_14496 ) ( IN ?auto_14494 ?auto_14495 ) ( ON ?auto_14493 ?auto_14492 ) ( not ( = ?auto_14492 ?auto_14493 ) ) ( not ( = ?auto_14492 ?auto_14494 ) ) ( ON ?auto_14492 ?auto_14491 ) ( not ( = ?auto_14491 ?auto_14492 ) ) ( not ( = ?auto_14491 ?auto_14493 ) ) ( not ( = ?auto_14491 ?auto_14494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14492 ?auto_14493 ?auto_14494 )
      ( MAKE-3CRATE-VERIFY ?auto_14491 ?auto_14492 ?auto_14493 ?auto_14494 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14498 - SURFACE
      ?auto_14499 - SURFACE
      ?auto_14500 - SURFACE
      ?auto_14501 - SURFACE
      ?auto_14502 - SURFACE
    )
    :vars
    (
      ?auto_14504 - HOIST
      ?auto_14505 - PLACE
      ?auto_14503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14504 ?auto_14505 ) ( SURFACE-AT ?auto_14501 ?auto_14505 ) ( CLEAR ?auto_14501 ) ( IS-CRATE ?auto_14502 ) ( not ( = ?auto_14501 ?auto_14502 ) ) ( TRUCK-AT ?auto_14503 ?auto_14505 ) ( AVAILABLE ?auto_14504 ) ( IN ?auto_14502 ?auto_14503 ) ( ON ?auto_14501 ?auto_14500 ) ( not ( = ?auto_14500 ?auto_14501 ) ) ( not ( = ?auto_14500 ?auto_14502 ) ) ( ON ?auto_14499 ?auto_14498 ) ( ON ?auto_14500 ?auto_14499 ) ( not ( = ?auto_14498 ?auto_14499 ) ) ( not ( = ?auto_14498 ?auto_14500 ) ) ( not ( = ?auto_14498 ?auto_14501 ) ) ( not ( = ?auto_14498 ?auto_14502 ) ) ( not ( = ?auto_14499 ?auto_14500 ) ) ( not ( = ?auto_14499 ?auto_14501 ) ) ( not ( = ?auto_14499 ?auto_14502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14500 ?auto_14501 ?auto_14502 )
      ( MAKE-4CRATE-VERIFY ?auto_14498 ?auto_14499 ?auto_14500 ?auto_14501 ?auto_14502 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14506 - SURFACE
      ?auto_14507 - SURFACE
    )
    :vars
    (
      ?auto_14510 - HOIST
      ?auto_14511 - PLACE
      ?auto_14509 - TRUCK
      ?auto_14508 - SURFACE
      ?auto_14512 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14510 ?auto_14511 ) ( SURFACE-AT ?auto_14506 ?auto_14511 ) ( CLEAR ?auto_14506 ) ( IS-CRATE ?auto_14507 ) ( not ( = ?auto_14506 ?auto_14507 ) ) ( AVAILABLE ?auto_14510 ) ( IN ?auto_14507 ?auto_14509 ) ( ON ?auto_14506 ?auto_14508 ) ( not ( = ?auto_14508 ?auto_14506 ) ) ( not ( = ?auto_14508 ?auto_14507 ) ) ( TRUCK-AT ?auto_14509 ?auto_14512 ) ( not ( = ?auto_14512 ?auto_14511 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14509 ?auto_14512 ?auto_14511 )
      ( MAKE-2CRATE ?auto_14508 ?auto_14506 ?auto_14507 )
      ( MAKE-1CRATE-VERIFY ?auto_14506 ?auto_14507 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14513 - SURFACE
      ?auto_14514 - SURFACE
      ?auto_14515 - SURFACE
    )
    :vars
    (
      ?auto_14516 - HOIST
      ?auto_14519 - PLACE
      ?auto_14518 - TRUCK
      ?auto_14517 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14516 ?auto_14519 ) ( SURFACE-AT ?auto_14514 ?auto_14519 ) ( CLEAR ?auto_14514 ) ( IS-CRATE ?auto_14515 ) ( not ( = ?auto_14514 ?auto_14515 ) ) ( AVAILABLE ?auto_14516 ) ( IN ?auto_14515 ?auto_14518 ) ( ON ?auto_14514 ?auto_14513 ) ( not ( = ?auto_14513 ?auto_14514 ) ) ( not ( = ?auto_14513 ?auto_14515 ) ) ( TRUCK-AT ?auto_14518 ?auto_14517 ) ( not ( = ?auto_14517 ?auto_14519 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14514 ?auto_14515 )
      ( MAKE-2CRATE-VERIFY ?auto_14513 ?auto_14514 ?auto_14515 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14520 - SURFACE
      ?auto_14521 - SURFACE
      ?auto_14522 - SURFACE
      ?auto_14523 - SURFACE
    )
    :vars
    (
      ?auto_14524 - HOIST
      ?auto_14525 - PLACE
      ?auto_14527 - TRUCK
      ?auto_14526 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14524 ?auto_14525 ) ( SURFACE-AT ?auto_14522 ?auto_14525 ) ( CLEAR ?auto_14522 ) ( IS-CRATE ?auto_14523 ) ( not ( = ?auto_14522 ?auto_14523 ) ) ( AVAILABLE ?auto_14524 ) ( IN ?auto_14523 ?auto_14527 ) ( ON ?auto_14522 ?auto_14521 ) ( not ( = ?auto_14521 ?auto_14522 ) ) ( not ( = ?auto_14521 ?auto_14523 ) ) ( TRUCK-AT ?auto_14527 ?auto_14526 ) ( not ( = ?auto_14526 ?auto_14525 ) ) ( ON ?auto_14521 ?auto_14520 ) ( not ( = ?auto_14520 ?auto_14521 ) ) ( not ( = ?auto_14520 ?auto_14522 ) ) ( not ( = ?auto_14520 ?auto_14523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14521 ?auto_14522 ?auto_14523 )
      ( MAKE-3CRATE-VERIFY ?auto_14520 ?auto_14521 ?auto_14522 ?auto_14523 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14528 - SURFACE
      ?auto_14529 - SURFACE
      ?auto_14530 - SURFACE
      ?auto_14531 - SURFACE
      ?auto_14532 - SURFACE
    )
    :vars
    (
      ?auto_14533 - HOIST
      ?auto_14534 - PLACE
      ?auto_14536 - TRUCK
      ?auto_14535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14533 ?auto_14534 ) ( SURFACE-AT ?auto_14531 ?auto_14534 ) ( CLEAR ?auto_14531 ) ( IS-CRATE ?auto_14532 ) ( not ( = ?auto_14531 ?auto_14532 ) ) ( AVAILABLE ?auto_14533 ) ( IN ?auto_14532 ?auto_14536 ) ( ON ?auto_14531 ?auto_14530 ) ( not ( = ?auto_14530 ?auto_14531 ) ) ( not ( = ?auto_14530 ?auto_14532 ) ) ( TRUCK-AT ?auto_14536 ?auto_14535 ) ( not ( = ?auto_14535 ?auto_14534 ) ) ( ON ?auto_14529 ?auto_14528 ) ( ON ?auto_14530 ?auto_14529 ) ( not ( = ?auto_14528 ?auto_14529 ) ) ( not ( = ?auto_14528 ?auto_14530 ) ) ( not ( = ?auto_14528 ?auto_14531 ) ) ( not ( = ?auto_14528 ?auto_14532 ) ) ( not ( = ?auto_14529 ?auto_14530 ) ) ( not ( = ?auto_14529 ?auto_14531 ) ) ( not ( = ?auto_14529 ?auto_14532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14530 ?auto_14531 ?auto_14532 )
      ( MAKE-4CRATE-VERIFY ?auto_14528 ?auto_14529 ?auto_14530 ?auto_14531 ?auto_14532 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14537 - SURFACE
      ?auto_14538 - SURFACE
    )
    :vars
    (
      ?auto_14539 - HOIST
      ?auto_14540 - PLACE
      ?auto_14543 - SURFACE
      ?auto_14542 - TRUCK
      ?auto_14541 - PLACE
      ?auto_14544 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14539 ?auto_14540 ) ( SURFACE-AT ?auto_14537 ?auto_14540 ) ( CLEAR ?auto_14537 ) ( IS-CRATE ?auto_14538 ) ( not ( = ?auto_14537 ?auto_14538 ) ) ( AVAILABLE ?auto_14539 ) ( ON ?auto_14537 ?auto_14543 ) ( not ( = ?auto_14543 ?auto_14537 ) ) ( not ( = ?auto_14543 ?auto_14538 ) ) ( TRUCK-AT ?auto_14542 ?auto_14541 ) ( not ( = ?auto_14541 ?auto_14540 ) ) ( HOIST-AT ?auto_14544 ?auto_14541 ) ( LIFTING ?auto_14544 ?auto_14538 ) ( not ( = ?auto_14539 ?auto_14544 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14544 ?auto_14538 ?auto_14542 ?auto_14541 )
      ( MAKE-2CRATE ?auto_14543 ?auto_14537 ?auto_14538 )
      ( MAKE-1CRATE-VERIFY ?auto_14537 ?auto_14538 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14545 - SURFACE
      ?auto_14546 - SURFACE
      ?auto_14547 - SURFACE
    )
    :vars
    (
      ?auto_14549 - HOIST
      ?auto_14548 - PLACE
      ?auto_14552 - TRUCK
      ?auto_14551 - PLACE
      ?auto_14550 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14549 ?auto_14548 ) ( SURFACE-AT ?auto_14546 ?auto_14548 ) ( CLEAR ?auto_14546 ) ( IS-CRATE ?auto_14547 ) ( not ( = ?auto_14546 ?auto_14547 ) ) ( AVAILABLE ?auto_14549 ) ( ON ?auto_14546 ?auto_14545 ) ( not ( = ?auto_14545 ?auto_14546 ) ) ( not ( = ?auto_14545 ?auto_14547 ) ) ( TRUCK-AT ?auto_14552 ?auto_14551 ) ( not ( = ?auto_14551 ?auto_14548 ) ) ( HOIST-AT ?auto_14550 ?auto_14551 ) ( LIFTING ?auto_14550 ?auto_14547 ) ( not ( = ?auto_14549 ?auto_14550 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14546 ?auto_14547 )
      ( MAKE-2CRATE-VERIFY ?auto_14545 ?auto_14546 ?auto_14547 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14553 - SURFACE
      ?auto_14554 - SURFACE
      ?auto_14555 - SURFACE
      ?auto_14556 - SURFACE
    )
    :vars
    (
      ?auto_14560 - HOIST
      ?auto_14561 - PLACE
      ?auto_14557 - TRUCK
      ?auto_14559 - PLACE
      ?auto_14558 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14560 ?auto_14561 ) ( SURFACE-AT ?auto_14555 ?auto_14561 ) ( CLEAR ?auto_14555 ) ( IS-CRATE ?auto_14556 ) ( not ( = ?auto_14555 ?auto_14556 ) ) ( AVAILABLE ?auto_14560 ) ( ON ?auto_14555 ?auto_14554 ) ( not ( = ?auto_14554 ?auto_14555 ) ) ( not ( = ?auto_14554 ?auto_14556 ) ) ( TRUCK-AT ?auto_14557 ?auto_14559 ) ( not ( = ?auto_14559 ?auto_14561 ) ) ( HOIST-AT ?auto_14558 ?auto_14559 ) ( LIFTING ?auto_14558 ?auto_14556 ) ( not ( = ?auto_14560 ?auto_14558 ) ) ( ON ?auto_14554 ?auto_14553 ) ( not ( = ?auto_14553 ?auto_14554 ) ) ( not ( = ?auto_14553 ?auto_14555 ) ) ( not ( = ?auto_14553 ?auto_14556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14554 ?auto_14555 ?auto_14556 )
      ( MAKE-3CRATE-VERIFY ?auto_14553 ?auto_14554 ?auto_14555 ?auto_14556 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14562 - SURFACE
      ?auto_14563 - SURFACE
      ?auto_14564 - SURFACE
      ?auto_14565 - SURFACE
      ?auto_14566 - SURFACE
    )
    :vars
    (
      ?auto_14570 - HOIST
      ?auto_14571 - PLACE
      ?auto_14567 - TRUCK
      ?auto_14569 - PLACE
      ?auto_14568 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14570 ?auto_14571 ) ( SURFACE-AT ?auto_14565 ?auto_14571 ) ( CLEAR ?auto_14565 ) ( IS-CRATE ?auto_14566 ) ( not ( = ?auto_14565 ?auto_14566 ) ) ( AVAILABLE ?auto_14570 ) ( ON ?auto_14565 ?auto_14564 ) ( not ( = ?auto_14564 ?auto_14565 ) ) ( not ( = ?auto_14564 ?auto_14566 ) ) ( TRUCK-AT ?auto_14567 ?auto_14569 ) ( not ( = ?auto_14569 ?auto_14571 ) ) ( HOIST-AT ?auto_14568 ?auto_14569 ) ( LIFTING ?auto_14568 ?auto_14566 ) ( not ( = ?auto_14570 ?auto_14568 ) ) ( ON ?auto_14563 ?auto_14562 ) ( ON ?auto_14564 ?auto_14563 ) ( not ( = ?auto_14562 ?auto_14563 ) ) ( not ( = ?auto_14562 ?auto_14564 ) ) ( not ( = ?auto_14562 ?auto_14565 ) ) ( not ( = ?auto_14562 ?auto_14566 ) ) ( not ( = ?auto_14563 ?auto_14564 ) ) ( not ( = ?auto_14563 ?auto_14565 ) ) ( not ( = ?auto_14563 ?auto_14566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14564 ?auto_14565 ?auto_14566 )
      ( MAKE-4CRATE-VERIFY ?auto_14562 ?auto_14563 ?auto_14564 ?auto_14565 ?auto_14566 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14572 - SURFACE
      ?auto_14573 - SURFACE
    )
    :vars
    (
      ?auto_14578 - HOIST
      ?auto_14579 - PLACE
      ?auto_14574 - SURFACE
      ?auto_14575 - TRUCK
      ?auto_14577 - PLACE
      ?auto_14576 - HOIST
      ?auto_14580 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14578 ?auto_14579 ) ( SURFACE-AT ?auto_14572 ?auto_14579 ) ( CLEAR ?auto_14572 ) ( IS-CRATE ?auto_14573 ) ( not ( = ?auto_14572 ?auto_14573 ) ) ( AVAILABLE ?auto_14578 ) ( ON ?auto_14572 ?auto_14574 ) ( not ( = ?auto_14574 ?auto_14572 ) ) ( not ( = ?auto_14574 ?auto_14573 ) ) ( TRUCK-AT ?auto_14575 ?auto_14577 ) ( not ( = ?auto_14577 ?auto_14579 ) ) ( HOIST-AT ?auto_14576 ?auto_14577 ) ( not ( = ?auto_14578 ?auto_14576 ) ) ( AVAILABLE ?auto_14576 ) ( SURFACE-AT ?auto_14573 ?auto_14577 ) ( ON ?auto_14573 ?auto_14580 ) ( CLEAR ?auto_14573 ) ( not ( = ?auto_14572 ?auto_14580 ) ) ( not ( = ?auto_14573 ?auto_14580 ) ) ( not ( = ?auto_14574 ?auto_14580 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14576 ?auto_14573 ?auto_14580 ?auto_14577 )
      ( MAKE-2CRATE ?auto_14574 ?auto_14572 ?auto_14573 )
      ( MAKE-1CRATE-VERIFY ?auto_14572 ?auto_14573 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14581 - SURFACE
      ?auto_14582 - SURFACE
      ?auto_14583 - SURFACE
    )
    :vars
    (
      ?auto_14584 - HOIST
      ?auto_14586 - PLACE
      ?auto_14587 - TRUCK
      ?auto_14585 - PLACE
      ?auto_14589 - HOIST
      ?auto_14588 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14584 ?auto_14586 ) ( SURFACE-AT ?auto_14582 ?auto_14586 ) ( CLEAR ?auto_14582 ) ( IS-CRATE ?auto_14583 ) ( not ( = ?auto_14582 ?auto_14583 ) ) ( AVAILABLE ?auto_14584 ) ( ON ?auto_14582 ?auto_14581 ) ( not ( = ?auto_14581 ?auto_14582 ) ) ( not ( = ?auto_14581 ?auto_14583 ) ) ( TRUCK-AT ?auto_14587 ?auto_14585 ) ( not ( = ?auto_14585 ?auto_14586 ) ) ( HOIST-AT ?auto_14589 ?auto_14585 ) ( not ( = ?auto_14584 ?auto_14589 ) ) ( AVAILABLE ?auto_14589 ) ( SURFACE-AT ?auto_14583 ?auto_14585 ) ( ON ?auto_14583 ?auto_14588 ) ( CLEAR ?auto_14583 ) ( not ( = ?auto_14582 ?auto_14588 ) ) ( not ( = ?auto_14583 ?auto_14588 ) ) ( not ( = ?auto_14581 ?auto_14588 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14582 ?auto_14583 )
      ( MAKE-2CRATE-VERIFY ?auto_14581 ?auto_14582 ?auto_14583 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14590 - SURFACE
      ?auto_14591 - SURFACE
      ?auto_14592 - SURFACE
      ?auto_14593 - SURFACE
    )
    :vars
    (
      ?auto_14596 - HOIST
      ?auto_14598 - PLACE
      ?auto_14594 - TRUCK
      ?auto_14597 - PLACE
      ?auto_14599 - HOIST
      ?auto_14595 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14596 ?auto_14598 ) ( SURFACE-AT ?auto_14592 ?auto_14598 ) ( CLEAR ?auto_14592 ) ( IS-CRATE ?auto_14593 ) ( not ( = ?auto_14592 ?auto_14593 ) ) ( AVAILABLE ?auto_14596 ) ( ON ?auto_14592 ?auto_14591 ) ( not ( = ?auto_14591 ?auto_14592 ) ) ( not ( = ?auto_14591 ?auto_14593 ) ) ( TRUCK-AT ?auto_14594 ?auto_14597 ) ( not ( = ?auto_14597 ?auto_14598 ) ) ( HOIST-AT ?auto_14599 ?auto_14597 ) ( not ( = ?auto_14596 ?auto_14599 ) ) ( AVAILABLE ?auto_14599 ) ( SURFACE-AT ?auto_14593 ?auto_14597 ) ( ON ?auto_14593 ?auto_14595 ) ( CLEAR ?auto_14593 ) ( not ( = ?auto_14592 ?auto_14595 ) ) ( not ( = ?auto_14593 ?auto_14595 ) ) ( not ( = ?auto_14591 ?auto_14595 ) ) ( ON ?auto_14591 ?auto_14590 ) ( not ( = ?auto_14590 ?auto_14591 ) ) ( not ( = ?auto_14590 ?auto_14592 ) ) ( not ( = ?auto_14590 ?auto_14593 ) ) ( not ( = ?auto_14590 ?auto_14595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14591 ?auto_14592 ?auto_14593 )
      ( MAKE-3CRATE-VERIFY ?auto_14590 ?auto_14591 ?auto_14592 ?auto_14593 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14600 - SURFACE
      ?auto_14601 - SURFACE
      ?auto_14602 - SURFACE
      ?auto_14603 - SURFACE
      ?auto_14604 - SURFACE
    )
    :vars
    (
      ?auto_14607 - HOIST
      ?auto_14609 - PLACE
      ?auto_14605 - TRUCK
      ?auto_14608 - PLACE
      ?auto_14610 - HOIST
      ?auto_14606 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14607 ?auto_14609 ) ( SURFACE-AT ?auto_14603 ?auto_14609 ) ( CLEAR ?auto_14603 ) ( IS-CRATE ?auto_14604 ) ( not ( = ?auto_14603 ?auto_14604 ) ) ( AVAILABLE ?auto_14607 ) ( ON ?auto_14603 ?auto_14602 ) ( not ( = ?auto_14602 ?auto_14603 ) ) ( not ( = ?auto_14602 ?auto_14604 ) ) ( TRUCK-AT ?auto_14605 ?auto_14608 ) ( not ( = ?auto_14608 ?auto_14609 ) ) ( HOIST-AT ?auto_14610 ?auto_14608 ) ( not ( = ?auto_14607 ?auto_14610 ) ) ( AVAILABLE ?auto_14610 ) ( SURFACE-AT ?auto_14604 ?auto_14608 ) ( ON ?auto_14604 ?auto_14606 ) ( CLEAR ?auto_14604 ) ( not ( = ?auto_14603 ?auto_14606 ) ) ( not ( = ?auto_14604 ?auto_14606 ) ) ( not ( = ?auto_14602 ?auto_14606 ) ) ( ON ?auto_14601 ?auto_14600 ) ( ON ?auto_14602 ?auto_14601 ) ( not ( = ?auto_14600 ?auto_14601 ) ) ( not ( = ?auto_14600 ?auto_14602 ) ) ( not ( = ?auto_14600 ?auto_14603 ) ) ( not ( = ?auto_14600 ?auto_14604 ) ) ( not ( = ?auto_14600 ?auto_14606 ) ) ( not ( = ?auto_14601 ?auto_14602 ) ) ( not ( = ?auto_14601 ?auto_14603 ) ) ( not ( = ?auto_14601 ?auto_14604 ) ) ( not ( = ?auto_14601 ?auto_14606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14602 ?auto_14603 ?auto_14604 )
      ( MAKE-4CRATE-VERIFY ?auto_14600 ?auto_14601 ?auto_14602 ?auto_14603 ?auto_14604 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14611 - SURFACE
      ?auto_14612 - SURFACE
    )
    :vars
    (
      ?auto_14615 - HOIST
      ?auto_14617 - PLACE
      ?auto_14619 - SURFACE
      ?auto_14616 - PLACE
      ?auto_14618 - HOIST
      ?auto_14614 - SURFACE
      ?auto_14613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14615 ?auto_14617 ) ( SURFACE-AT ?auto_14611 ?auto_14617 ) ( CLEAR ?auto_14611 ) ( IS-CRATE ?auto_14612 ) ( not ( = ?auto_14611 ?auto_14612 ) ) ( AVAILABLE ?auto_14615 ) ( ON ?auto_14611 ?auto_14619 ) ( not ( = ?auto_14619 ?auto_14611 ) ) ( not ( = ?auto_14619 ?auto_14612 ) ) ( not ( = ?auto_14616 ?auto_14617 ) ) ( HOIST-AT ?auto_14618 ?auto_14616 ) ( not ( = ?auto_14615 ?auto_14618 ) ) ( AVAILABLE ?auto_14618 ) ( SURFACE-AT ?auto_14612 ?auto_14616 ) ( ON ?auto_14612 ?auto_14614 ) ( CLEAR ?auto_14612 ) ( not ( = ?auto_14611 ?auto_14614 ) ) ( not ( = ?auto_14612 ?auto_14614 ) ) ( not ( = ?auto_14619 ?auto_14614 ) ) ( TRUCK-AT ?auto_14613 ?auto_14617 ) )
    :subtasks
    ( ( !DRIVE ?auto_14613 ?auto_14617 ?auto_14616 )
      ( MAKE-2CRATE ?auto_14619 ?auto_14611 ?auto_14612 )
      ( MAKE-1CRATE-VERIFY ?auto_14611 ?auto_14612 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14620 - SURFACE
      ?auto_14621 - SURFACE
      ?auto_14622 - SURFACE
    )
    :vars
    (
      ?auto_14626 - HOIST
      ?auto_14628 - PLACE
      ?auto_14624 - PLACE
      ?auto_14627 - HOIST
      ?auto_14625 - SURFACE
      ?auto_14623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14626 ?auto_14628 ) ( SURFACE-AT ?auto_14621 ?auto_14628 ) ( CLEAR ?auto_14621 ) ( IS-CRATE ?auto_14622 ) ( not ( = ?auto_14621 ?auto_14622 ) ) ( AVAILABLE ?auto_14626 ) ( ON ?auto_14621 ?auto_14620 ) ( not ( = ?auto_14620 ?auto_14621 ) ) ( not ( = ?auto_14620 ?auto_14622 ) ) ( not ( = ?auto_14624 ?auto_14628 ) ) ( HOIST-AT ?auto_14627 ?auto_14624 ) ( not ( = ?auto_14626 ?auto_14627 ) ) ( AVAILABLE ?auto_14627 ) ( SURFACE-AT ?auto_14622 ?auto_14624 ) ( ON ?auto_14622 ?auto_14625 ) ( CLEAR ?auto_14622 ) ( not ( = ?auto_14621 ?auto_14625 ) ) ( not ( = ?auto_14622 ?auto_14625 ) ) ( not ( = ?auto_14620 ?auto_14625 ) ) ( TRUCK-AT ?auto_14623 ?auto_14628 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14621 ?auto_14622 )
      ( MAKE-2CRATE-VERIFY ?auto_14620 ?auto_14621 ?auto_14622 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14629 - SURFACE
      ?auto_14630 - SURFACE
      ?auto_14631 - SURFACE
      ?auto_14632 - SURFACE
    )
    :vars
    (
      ?auto_14635 - HOIST
      ?auto_14634 - PLACE
      ?auto_14633 - PLACE
      ?auto_14638 - HOIST
      ?auto_14636 - SURFACE
      ?auto_14637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14635 ?auto_14634 ) ( SURFACE-AT ?auto_14631 ?auto_14634 ) ( CLEAR ?auto_14631 ) ( IS-CRATE ?auto_14632 ) ( not ( = ?auto_14631 ?auto_14632 ) ) ( AVAILABLE ?auto_14635 ) ( ON ?auto_14631 ?auto_14630 ) ( not ( = ?auto_14630 ?auto_14631 ) ) ( not ( = ?auto_14630 ?auto_14632 ) ) ( not ( = ?auto_14633 ?auto_14634 ) ) ( HOIST-AT ?auto_14638 ?auto_14633 ) ( not ( = ?auto_14635 ?auto_14638 ) ) ( AVAILABLE ?auto_14638 ) ( SURFACE-AT ?auto_14632 ?auto_14633 ) ( ON ?auto_14632 ?auto_14636 ) ( CLEAR ?auto_14632 ) ( not ( = ?auto_14631 ?auto_14636 ) ) ( not ( = ?auto_14632 ?auto_14636 ) ) ( not ( = ?auto_14630 ?auto_14636 ) ) ( TRUCK-AT ?auto_14637 ?auto_14634 ) ( ON ?auto_14630 ?auto_14629 ) ( not ( = ?auto_14629 ?auto_14630 ) ) ( not ( = ?auto_14629 ?auto_14631 ) ) ( not ( = ?auto_14629 ?auto_14632 ) ) ( not ( = ?auto_14629 ?auto_14636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14630 ?auto_14631 ?auto_14632 )
      ( MAKE-3CRATE-VERIFY ?auto_14629 ?auto_14630 ?auto_14631 ?auto_14632 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14639 - SURFACE
      ?auto_14640 - SURFACE
      ?auto_14641 - SURFACE
      ?auto_14642 - SURFACE
      ?auto_14643 - SURFACE
    )
    :vars
    (
      ?auto_14646 - HOIST
      ?auto_14645 - PLACE
      ?auto_14644 - PLACE
      ?auto_14649 - HOIST
      ?auto_14647 - SURFACE
      ?auto_14648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14646 ?auto_14645 ) ( SURFACE-AT ?auto_14642 ?auto_14645 ) ( CLEAR ?auto_14642 ) ( IS-CRATE ?auto_14643 ) ( not ( = ?auto_14642 ?auto_14643 ) ) ( AVAILABLE ?auto_14646 ) ( ON ?auto_14642 ?auto_14641 ) ( not ( = ?auto_14641 ?auto_14642 ) ) ( not ( = ?auto_14641 ?auto_14643 ) ) ( not ( = ?auto_14644 ?auto_14645 ) ) ( HOIST-AT ?auto_14649 ?auto_14644 ) ( not ( = ?auto_14646 ?auto_14649 ) ) ( AVAILABLE ?auto_14649 ) ( SURFACE-AT ?auto_14643 ?auto_14644 ) ( ON ?auto_14643 ?auto_14647 ) ( CLEAR ?auto_14643 ) ( not ( = ?auto_14642 ?auto_14647 ) ) ( not ( = ?auto_14643 ?auto_14647 ) ) ( not ( = ?auto_14641 ?auto_14647 ) ) ( TRUCK-AT ?auto_14648 ?auto_14645 ) ( ON ?auto_14640 ?auto_14639 ) ( ON ?auto_14641 ?auto_14640 ) ( not ( = ?auto_14639 ?auto_14640 ) ) ( not ( = ?auto_14639 ?auto_14641 ) ) ( not ( = ?auto_14639 ?auto_14642 ) ) ( not ( = ?auto_14639 ?auto_14643 ) ) ( not ( = ?auto_14639 ?auto_14647 ) ) ( not ( = ?auto_14640 ?auto_14641 ) ) ( not ( = ?auto_14640 ?auto_14642 ) ) ( not ( = ?auto_14640 ?auto_14643 ) ) ( not ( = ?auto_14640 ?auto_14647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14641 ?auto_14642 ?auto_14643 )
      ( MAKE-4CRATE-VERIFY ?auto_14639 ?auto_14640 ?auto_14641 ?auto_14642 ?auto_14643 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14650 - SURFACE
      ?auto_14651 - SURFACE
    )
    :vars
    (
      ?auto_14654 - HOIST
      ?auto_14653 - PLACE
      ?auto_14657 - SURFACE
      ?auto_14652 - PLACE
      ?auto_14658 - HOIST
      ?auto_14655 - SURFACE
      ?auto_14656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14654 ?auto_14653 ) ( IS-CRATE ?auto_14651 ) ( not ( = ?auto_14650 ?auto_14651 ) ) ( not ( = ?auto_14657 ?auto_14650 ) ) ( not ( = ?auto_14657 ?auto_14651 ) ) ( not ( = ?auto_14652 ?auto_14653 ) ) ( HOIST-AT ?auto_14658 ?auto_14652 ) ( not ( = ?auto_14654 ?auto_14658 ) ) ( AVAILABLE ?auto_14658 ) ( SURFACE-AT ?auto_14651 ?auto_14652 ) ( ON ?auto_14651 ?auto_14655 ) ( CLEAR ?auto_14651 ) ( not ( = ?auto_14650 ?auto_14655 ) ) ( not ( = ?auto_14651 ?auto_14655 ) ) ( not ( = ?auto_14657 ?auto_14655 ) ) ( TRUCK-AT ?auto_14656 ?auto_14653 ) ( SURFACE-AT ?auto_14657 ?auto_14653 ) ( CLEAR ?auto_14657 ) ( LIFTING ?auto_14654 ?auto_14650 ) ( IS-CRATE ?auto_14650 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14657 ?auto_14650 )
      ( MAKE-2CRATE ?auto_14657 ?auto_14650 ?auto_14651 )
      ( MAKE-1CRATE-VERIFY ?auto_14650 ?auto_14651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14659 - SURFACE
      ?auto_14660 - SURFACE
      ?auto_14661 - SURFACE
    )
    :vars
    (
      ?auto_14664 - HOIST
      ?auto_14666 - PLACE
      ?auto_14662 - PLACE
      ?auto_14665 - HOIST
      ?auto_14663 - SURFACE
      ?auto_14667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14664 ?auto_14666 ) ( IS-CRATE ?auto_14661 ) ( not ( = ?auto_14660 ?auto_14661 ) ) ( not ( = ?auto_14659 ?auto_14660 ) ) ( not ( = ?auto_14659 ?auto_14661 ) ) ( not ( = ?auto_14662 ?auto_14666 ) ) ( HOIST-AT ?auto_14665 ?auto_14662 ) ( not ( = ?auto_14664 ?auto_14665 ) ) ( AVAILABLE ?auto_14665 ) ( SURFACE-AT ?auto_14661 ?auto_14662 ) ( ON ?auto_14661 ?auto_14663 ) ( CLEAR ?auto_14661 ) ( not ( = ?auto_14660 ?auto_14663 ) ) ( not ( = ?auto_14661 ?auto_14663 ) ) ( not ( = ?auto_14659 ?auto_14663 ) ) ( TRUCK-AT ?auto_14667 ?auto_14666 ) ( SURFACE-AT ?auto_14659 ?auto_14666 ) ( CLEAR ?auto_14659 ) ( LIFTING ?auto_14664 ?auto_14660 ) ( IS-CRATE ?auto_14660 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14660 ?auto_14661 )
      ( MAKE-2CRATE-VERIFY ?auto_14659 ?auto_14660 ?auto_14661 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14668 - SURFACE
      ?auto_14669 - SURFACE
      ?auto_14670 - SURFACE
      ?auto_14671 - SURFACE
    )
    :vars
    (
      ?auto_14673 - HOIST
      ?auto_14674 - PLACE
      ?auto_14672 - PLACE
      ?auto_14676 - HOIST
      ?auto_14677 - SURFACE
      ?auto_14675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14673 ?auto_14674 ) ( IS-CRATE ?auto_14671 ) ( not ( = ?auto_14670 ?auto_14671 ) ) ( not ( = ?auto_14669 ?auto_14670 ) ) ( not ( = ?auto_14669 ?auto_14671 ) ) ( not ( = ?auto_14672 ?auto_14674 ) ) ( HOIST-AT ?auto_14676 ?auto_14672 ) ( not ( = ?auto_14673 ?auto_14676 ) ) ( AVAILABLE ?auto_14676 ) ( SURFACE-AT ?auto_14671 ?auto_14672 ) ( ON ?auto_14671 ?auto_14677 ) ( CLEAR ?auto_14671 ) ( not ( = ?auto_14670 ?auto_14677 ) ) ( not ( = ?auto_14671 ?auto_14677 ) ) ( not ( = ?auto_14669 ?auto_14677 ) ) ( TRUCK-AT ?auto_14675 ?auto_14674 ) ( SURFACE-AT ?auto_14669 ?auto_14674 ) ( CLEAR ?auto_14669 ) ( LIFTING ?auto_14673 ?auto_14670 ) ( IS-CRATE ?auto_14670 ) ( ON ?auto_14669 ?auto_14668 ) ( not ( = ?auto_14668 ?auto_14669 ) ) ( not ( = ?auto_14668 ?auto_14670 ) ) ( not ( = ?auto_14668 ?auto_14671 ) ) ( not ( = ?auto_14668 ?auto_14677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14669 ?auto_14670 ?auto_14671 )
      ( MAKE-3CRATE-VERIFY ?auto_14668 ?auto_14669 ?auto_14670 ?auto_14671 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14678 - SURFACE
      ?auto_14679 - SURFACE
      ?auto_14680 - SURFACE
      ?auto_14681 - SURFACE
      ?auto_14682 - SURFACE
    )
    :vars
    (
      ?auto_14684 - HOIST
      ?auto_14685 - PLACE
      ?auto_14683 - PLACE
      ?auto_14687 - HOIST
      ?auto_14688 - SURFACE
      ?auto_14686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14684 ?auto_14685 ) ( IS-CRATE ?auto_14682 ) ( not ( = ?auto_14681 ?auto_14682 ) ) ( not ( = ?auto_14680 ?auto_14681 ) ) ( not ( = ?auto_14680 ?auto_14682 ) ) ( not ( = ?auto_14683 ?auto_14685 ) ) ( HOIST-AT ?auto_14687 ?auto_14683 ) ( not ( = ?auto_14684 ?auto_14687 ) ) ( AVAILABLE ?auto_14687 ) ( SURFACE-AT ?auto_14682 ?auto_14683 ) ( ON ?auto_14682 ?auto_14688 ) ( CLEAR ?auto_14682 ) ( not ( = ?auto_14681 ?auto_14688 ) ) ( not ( = ?auto_14682 ?auto_14688 ) ) ( not ( = ?auto_14680 ?auto_14688 ) ) ( TRUCK-AT ?auto_14686 ?auto_14685 ) ( SURFACE-AT ?auto_14680 ?auto_14685 ) ( CLEAR ?auto_14680 ) ( LIFTING ?auto_14684 ?auto_14681 ) ( IS-CRATE ?auto_14681 ) ( ON ?auto_14679 ?auto_14678 ) ( ON ?auto_14680 ?auto_14679 ) ( not ( = ?auto_14678 ?auto_14679 ) ) ( not ( = ?auto_14678 ?auto_14680 ) ) ( not ( = ?auto_14678 ?auto_14681 ) ) ( not ( = ?auto_14678 ?auto_14682 ) ) ( not ( = ?auto_14678 ?auto_14688 ) ) ( not ( = ?auto_14679 ?auto_14680 ) ) ( not ( = ?auto_14679 ?auto_14681 ) ) ( not ( = ?auto_14679 ?auto_14682 ) ) ( not ( = ?auto_14679 ?auto_14688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14680 ?auto_14681 ?auto_14682 )
      ( MAKE-4CRATE-VERIFY ?auto_14678 ?auto_14679 ?auto_14680 ?auto_14681 ?auto_14682 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14689 - SURFACE
      ?auto_14690 - SURFACE
    )
    :vars
    (
      ?auto_14692 - HOIST
      ?auto_14693 - PLACE
      ?auto_14694 - SURFACE
      ?auto_14691 - PLACE
      ?auto_14696 - HOIST
      ?auto_14697 - SURFACE
      ?auto_14695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14692 ?auto_14693 ) ( IS-CRATE ?auto_14690 ) ( not ( = ?auto_14689 ?auto_14690 ) ) ( not ( = ?auto_14694 ?auto_14689 ) ) ( not ( = ?auto_14694 ?auto_14690 ) ) ( not ( = ?auto_14691 ?auto_14693 ) ) ( HOIST-AT ?auto_14696 ?auto_14691 ) ( not ( = ?auto_14692 ?auto_14696 ) ) ( AVAILABLE ?auto_14696 ) ( SURFACE-AT ?auto_14690 ?auto_14691 ) ( ON ?auto_14690 ?auto_14697 ) ( CLEAR ?auto_14690 ) ( not ( = ?auto_14689 ?auto_14697 ) ) ( not ( = ?auto_14690 ?auto_14697 ) ) ( not ( = ?auto_14694 ?auto_14697 ) ) ( TRUCK-AT ?auto_14695 ?auto_14693 ) ( SURFACE-AT ?auto_14694 ?auto_14693 ) ( CLEAR ?auto_14694 ) ( IS-CRATE ?auto_14689 ) ( AVAILABLE ?auto_14692 ) ( IN ?auto_14689 ?auto_14695 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14692 ?auto_14689 ?auto_14695 ?auto_14693 )
      ( MAKE-2CRATE ?auto_14694 ?auto_14689 ?auto_14690 )
      ( MAKE-1CRATE-VERIFY ?auto_14689 ?auto_14690 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14698 - SURFACE
      ?auto_14699 - SURFACE
      ?auto_14700 - SURFACE
    )
    :vars
    (
      ?auto_14702 - HOIST
      ?auto_14701 - PLACE
      ?auto_14703 - PLACE
      ?auto_14705 - HOIST
      ?auto_14704 - SURFACE
      ?auto_14706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14702 ?auto_14701 ) ( IS-CRATE ?auto_14700 ) ( not ( = ?auto_14699 ?auto_14700 ) ) ( not ( = ?auto_14698 ?auto_14699 ) ) ( not ( = ?auto_14698 ?auto_14700 ) ) ( not ( = ?auto_14703 ?auto_14701 ) ) ( HOIST-AT ?auto_14705 ?auto_14703 ) ( not ( = ?auto_14702 ?auto_14705 ) ) ( AVAILABLE ?auto_14705 ) ( SURFACE-AT ?auto_14700 ?auto_14703 ) ( ON ?auto_14700 ?auto_14704 ) ( CLEAR ?auto_14700 ) ( not ( = ?auto_14699 ?auto_14704 ) ) ( not ( = ?auto_14700 ?auto_14704 ) ) ( not ( = ?auto_14698 ?auto_14704 ) ) ( TRUCK-AT ?auto_14706 ?auto_14701 ) ( SURFACE-AT ?auto_14698 ?auto_14701 ) ( CLEAR ?auto_14698 ) ( IS-CRATE ?auto_14699 ) ( AVAILABLE ?auto_14702 ) ( IN ?auto_14699 ?auto_14706 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14699 ?auto_14700 )
      ( MAKE-2CRATE-VERIFY ?auto_14698 ?auto_14699 ?auto_14700 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14707 - SURFACE
      ?auto_14708 - SURFACE
      ?auto_14709 - SURFACE
      ?auto_14710 - SURFACE
    )
    :vars
    (
      ?auto_14716 - HOIST
      ?auto_14712 - PLACE
      ?auto_14714 - PLACE
      ?auto_14711 - HOIST
      ?auto_14713 - SURFACE
      ?auto_14715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14716 ?auto_14712 ) ( IS-CRATE ?auto_14710 ) ( not ( = ?auto_14709 ?auto_14710 ) ) ( not ( = ?auto_14708 ?auto_14709 ) ) ( not ( = ?auto_14708 ?auto_14710 ) ) ( not ( = ?auto_14714 ?auto_14712 ) ) ( HOIST-AT ?auto_14711 ?auto_14714 ) ( not ( = ?auto_14716 ?auto_14711 ) ) ( AVAILABLE ?auto_14711 ) ( SURFACE-AT ?auto_14710 ?auto_14714 ) ( ON ?auto_14710 ?auto_14713 ) ( CLEAR ?auto_14710 ) ( not ( = ?auto_14709 ?auto_14713 ) ) ( not ( = ?auto_14710 ?auto_14713 ) ) ( not ( = ?auto_14708 ?auto_14713 ) ) ( TRUCK-AT ?auto_14715 ?auto_14712 ) ( SURFACE-AT ?auto_14708 ?auto_14712 ) ( CLEAR ?auto_14708 ) ( IS-CRATE ?auto_14709 ) ( AVAILABLE ?auto_14716 ) ( IN ?auto_14709 ?auto_14715 ) ( ON ?auto_14708 ?auto_14707 ) ( not ( = ?auto_14707 ?auto_14708 ) ) ( not ( = ?auto_14707 ?auto_14709 ) ) ( not ( = ?auto_14707 ?auto_14710 ) ) ( not ( = ?auto_14707 ?auto_14713 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14708 ?auto_14709 ?auto_14710 )
      ( MAKE-3CRATE-VERIFY ?auto_14707 ?auto_14708 ?auto_14709 ?auto_14710 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14717 - SURFACE
      ?auto_14718 - SURFACE
      ?auto_14719 - SURFACE
      ?auto_14720 - SURFACE
      ?auto_14721 - SURFACE
    )
    :vars
    (
      ?auto_14727 - HOIST
      ?auto_14723 - PLACE
      ?auto_14725 - PLACE
      ?auto_14722 - HOIST
      ?auto_14724 - SURFACE
      ?auto_14726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14727 ?auto_14723 ) ( IS-CRATE ?auto_14721 ) ( not ( = ?auto_14720 ?auto_14721 ) ) ( not ( = ?auto_14719 ?auto_14720 ) ) ( not ( = ?auto_14719 ?auto_14721 ) ) ( not ( = ?auto_14725 ?auto_14723 ) ) ( HOIST-AT ?auto_14722 ?auto_14725 ) ( not ( = ?auto_14727 ?auto_14722 ) ) ( AVAILABLE ?auto_14722 ) ( SURFACE-AT ?auto_14721 ?auto_14725 ) ( ON ?auto_14721 ?auto_14724 ) ( CLEAR ?auto_14721 ) ( not ( = ?auto_14720 ?auto_14724 ) ) ( not ( = ?auto_14721 ?auto_14724 ) ) ( not ( = ?auto_14719 ?auto_14724 ) ) ( TRUCK-AT ?auto_14726 ?auto_14723 ) ( SURFACE-AT ?auto_14719 ?auto_14723 ) ( CLEAR ?auto_14719 ) ( IS-CRATE ?auto_14720 ) ( AVAILABLE ?auto_14727 ) ( IN ?auto_14720 ?auto_14726 ) ( ON ?auto_14718 ?auto_14717 ) ( ON ?auto_14719 ?auto_14718 ) ( not ( = ?auto_14717 ?auto_14718 ) ) ( not ( = ?auto_14717 ?auto_14719 ) ) ( not ( = ?auto_14717 ?auto_14720 ) ) ( not ( = ?auto_14717 ?auto_14721 ) ) ( not ( = ?auto_14717 ?auto_14724 ) ) ( not ( = ?auto_14718 ?auto_14719 ) ) ( not ( = ?auto_14718 ?auto_14720 ) ) ( not ( = ?auto_14718 ?auto_14721 ) ) ( not ( = ?auto_14718 ?auto_14724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14719 ?auto_14720 ?auto_14721 )
      ( MAKE-4CRATE-VERIFY ?auto_14717 ?auto_14718 ?auto_14719 ?auto_14720 ?auto_14721 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14728 - SURFACE
      ?auto_14729 - SURFACE
    )
    :vars
    (
      ?auto_14736 - HOIST
      ?auto_14731 - PLACE
      ?auto_14732 - SURFACE
      ?auto_14734 - PLACE
      ?auto_14730 - HOIST
      ?auto_14733 - SURFACE
      ?auto_14735 - TRUCK
      ?auto_14737 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14736 ?auto_14731 ) ( IS-CRATE ?auto_14729 ) ( not ( = ?auto_14728 ?auto_14729 ) ) ( not ( = ?auto_14732 ?auto_14728 ) ) ( not ( = ?auto_14732 ?auto_14729 ) ) ( not ( = ?auto_14734 ?auto_14731 ) ) ( HOIST-AT ?auto_14730 ?auto_14734 ) ( not ( = ?auto_14736 ?auto_14730 ) ) ( AVAILABLE ?auto_14730 ) ( SURFACE-AT ?auto_14729 ?auto_14734 ) ( ON ?auto_14729 ?auto_14733 ) ( CLEAR ?auto_14729 ) ( not ( = ?auto_14728 ?auto_14733 ) ) ( not ( = ?auto_14729 ?auto_14733 ) ) ( not ( = ?auto_14732 ?auto_14733 ) ) ( SURFACE-AT ?auto_14732 ?auto_14731 ) ( CLEAR ?auto_14732 ) ( IS-CRATE ?auto_14728 ) ( AVAILABLE ?auto_14736 ) ( IN ?auto_14728 ?auto_14735 ) ( TRUCK-AT ?auto_14735 ?auto_14737 ) ( not ( = ?auto_14737 ?auto_14731 ) ) ( not ( = ?auto_14734 ?auto_14737 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14735 ?auto_14737 ?auto_14731 )
      ( MAKE-2CRATE ?auto_14732 ?auto_14728 ?auto_14729 )
      ( MAKE-1CRATE-VERIFY ?auto_14728 ?auto_14729 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14738 - SURFACE
      ?auto_14739 - SURFACE
      ?auto_14740 - SURFACE
    )
    :vars
    (
      ?auto_14745 - HOIST
      ?auto_14741 - PLACE
      ?auto_14747 - PLACE
      ?auto_14743 - HOIST
      ?auto_14742 - SURFACE
      ?auto_14744 - TRUCK
      ?auto_14746 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14745 ?auto_14741 ) ( IS-CRATE ?auto_14740 ) ( not ( = ?auto_14739 ?auto_14740 ) ) ( not ( = ?auto_14738 ?auto_14739 ) ) ( not ( = ?auto_14738 ?auto_14740 ) ) ( not ( = ?auto_14747 ?auto_14741 ) ) ( HOIST-AT ?auto_14743 ?auto_14747 ) ( not ( = ?auto_14745 ?auto_14743 ) ) ( AVAILABLE ?auto_14743 ) ( SURFACE-AT ?auto_14740 ?auto_14747 ) ( ON ?auto_14740 ?auto_14742 ) ( CLEAR ?auto_14740 ) ( not ( = ?auto_14739 ?auto_14742 ) ) ( not ( = ?auto_14740 ?auto_14742 ) ) ( not ( = ?auto_14738 ?auto_14742 ) ) ( SURFACE-AT ?auto_14738 ?auto_14741 ) ( CLEAR ?auto_14738 ) ( IS-CRATE ?auto_14739 ) ( AVAILABLE ?auto_14745 ) ( IN ?auto_14739 ?auto_14744 ) ( TRUCK-AT ?auto_14744 ?auto_14746 ) ( not ( = ?auto_14746 ?auto_14741 ) ) ( not ( = ?auto_14747 ?auto_14746 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14739 ?auto_14740 )
      ( MAKE-2CRATE-VERIFY ?auto_14738 ?auto_14739 ?auto_14740 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14748 - SURFACE
      ?auto_14749 - SURFACE
      ?auto_14750 - SURFACE
      ?auto_14751 - SURFACE
    )
    :vars
    (
      ?auto_14752 - HOIST
      ?auto_14757 - PLACE
      ?auto_14756 - PLACE
      ?auto_14758 - HOIST
      ?auto_14755 - SURFACE
      ?auto_14754 - TRUCK
      ?auto_14753 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14752 ?auto_14757 ) ( IS-CRATE ?auto_14751 ) ( not ( = ?auto_14750 ?auto_14751 ) ) ( not ( = ?auto_14749 ?auto_14750 ) ) ( not ( = ?auto_14749 ?auto_14751 ) ) ( not ( = ?auto_14756 ?auto_14757 ) ) ( HOIST-AT ?auto_14758 ?auto_14756 ) ( not ( = ?auto_14752 ?auto_14758 ) ) ( AVAILABLE ?auto_14758 ) ( SURFACE-AT ?auto_14751 ?auto_14756 ) ( ON ?auto_14751 ?auto_14755 ) ( CLEAR ?auto_14751 ) ( not ( = ?auto_14750 ?auto_14755 ) ) ( not ( = ?auto_14751 ?auto_14755 ) ) ( not ( = ?auto_14749 ?auto_14755 ) ) ( SURFACE-AT ?auto_14749 ?auto_14757 ) ( CLEAR ?auto_14749 ) ( IS-CRATE ?auto_14750 ) ( AVAILABLE ?auto_14752 ) ( IN ?auto_14750 ?auto_14754 ) ( TRUCK-AT ?auto_14754 ?auto_14753 ) ( not ( = ?auto_14753 ?auto_14757 ) ) ( not ( = ?auto_14756 ?auto_14753 ) ) ( ON ?auto_14749 ?auto_14748 ) ( not ( = ?auto_14748 ?auto_14749 ) ) ( not ( = ?auto_14748 ?auto_14750 ) ) ( not ( = ?auto_14748 ?auto_14751 ) ) ( not ( = ?auto_14748 ?auto_14755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14749 ?auto_14750 ?auto_14751 )
      ( MAKE-3CRATE-VERIFY ?auto_14748 ?auto_14749 ?auto_14750 ?auto_14751 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14759 - SURFACE
      ?auto_14760 - SURFACE
      ?auto_14761 - SURFACE
      ?auto_14762 - SURFACE
      ?auto_14763 - SURFACE
    )
    :vars
    (
      ?auto_14764 - HOIST
      ?auto_14769 - PLACE
      ?auto_14768 - PLACE
      ?auto_14770 - HOIST
      ?auto_14767 - SURFACE
      ?auto_14766 - TRUCK
      ?auto_14765 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14764 ?auto_14769 ) ( IS-CRATE ?auto_14763 ) ( not ( = ?auto_14762 ?auto_14763 ) ) ( not ( = ?auto_14761 ?auto_14762 ) ) ( not ( = ?auto_14761 ?auto_14763 ) ) ( not ( = ?auto_14768 ?auto_14769 ) ) ( HOIST-AT ?auto_14770 ?auto_14768 ) ( not ( = ?auto_14764 ?auto_14770 ) ) ( AVAILABLE ?auto_14770 ) ( SURFACE-AT ?auto_14763 ?auto_14768 ) ( ON ?auto_14763 ?auto_14767 ) ( CLEAR ?auto_14763 ) ( not ( = ?auto_14762 ?auto_14767 ) ) ( not ( = ?auto_14763 ?auto_14767 ) ) ( not ( = ?auto_14761 ?auto_14767 ) ) ( SURFACE-AT ?auto_14761 ?auto_14769 ) ( CLEAR ?auto_14761 ) ( IS-CRATE ?auto_14762 ) ( AVAILABLE ?auto_14764 ) ( IN ?auto_14762 ?auto_14766 ) ( TRUCK-AT ?auto_14766 ?auto_14765 ) ( not ( = ?auto_14765 ?auto_14769 ) ) ( not ( = ?auto_14768 ?auto_14765 ) ) ( ON ?auto_14760 ?auto_14759 ) ( ON ?auto_14761 ?auto_14760 ) ( not ( = ?auto_14759 ?auto_14760 ) ) ( not ( = ?auto_14759 ?auto_14761 ) ) ( not ( = ?auto_14759 ?auto_14762 ) ) ( not ( = ?auto_14759 ?auto_14763 ) ) ( not ( = ?auto_14759 ?auto_14767 ) ) ( not ( = ?auto_14760 ?auto_14761 ) ) ( not ( = ?auto_14760 ?auto_14762 ) ) ( not ( = ?auto_14760 ?auto_14763 ) ) ( not ( = ?auto_14760 ?auto_14767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14761 ?auto_14762 ?auto_14763 )
      ( MAKE-4CRATE-VERIFY ?auto_14759 ?auto_14760 ?auto_14761 ?auto_14762 ?auto_14763 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14771 - SURFACE
      ?auto_14772 - SURFACE
    )
    :vars
    (
      ?auto_14773 - HOIST
      ?auto_14779 - PLACE
      ?auto_14775 - SURFACE
      ?auto_14778 - PLACE
      ?auto_14780 - HOIST
      ?auto_14777 - SURFACE
      ?auto_14776 - TRUCK
      ?auto_14774 - PLACE
      ?auto_14781 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14773 ?auto_14779 ) ( IS-CRATE ?auto_14772 ) ( not ( = ?auto_14771 ?auto_14772 ) ) ( not ( = ?auto_14775 ?auto_14771 ) ) ( not ( = ?auto_14775 ?auto_14772 ) ) ( not ( = ?auto_14778 ?auto_14779 ) ) ( HOIST-AT ?auto_14780 ?auto_14778 ) ( not ( = ?auto_14773 ?auto_14780 ) ) ( AVAILABLE ?auto_14780 ) ( SURFACE-AT ?auto_14772 ?auto_14778 ) ( ON ?auto_14772 ?auto_14777 ) ( CLEAR ?auto_14772 ) ( not ( = ?auto_14771 ?auto_14777 ) ) ( not ( = ?auto_14772 ?auto_14777 ) ) ( not ( = ?auto_14775 ?auto_14777 ) ) ( SURFACE-AT ?auto_14775 ?auto_14779 ) ( CLEAR ?auto_14775 ) ( IS-CRATE ?auto_14771 ) ( AVAILABLE ?auto_14773 ) ( TRUCK-AT ?auto_14776 ?auto_14774 ) ( not ( = ?auto_14774 ?auto_14779 ) ) ( not ( = ?auto_14778 ?auto_14774 ) ) ( HOIST-AT ?auto_14781 ?auto_14774 ) ( LIFTING ?auto_14781 ?auto_14771 ) ( not ( = ?auto_14773 ?auto_14781 ) ) ( not ( = ?auto_14780 ?auto_14781 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14781 ?auto_14771 ?auto_14776 ?auto_14774 )
      ( MAKE-2CRATE ?auto_14775 ?auto_14771 ?auto_14772 )
      ( MAKE-1CRATE-VERIFY ?auto_14771 ?auto_14772 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14782 - SURFACE
      ?auto_14783 - SURFACE
      ?auto_14784 - SURFACE
    )
    :vars
    (
      ?auto_14790 - HOIST
      ?auto_14789 - PLACE
      ?auto_14791 - PLACE
      ?auto_14788 - HOIST
      ?auto_14792 - SURFACE
      ?auto_14787 - TRUCK
      ?auto_14786 - PLACE
      ?auto_14785 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14790 ?auto_14789 ) ( IS-CRATE ?auto_14784 ) ( not ( = ?auto_14783 ?auto_14784 ) ) ( not ( = ?auto_14782 ?auto_14783 ) ) ( not ( = ?auto_14782 ?auto_14784 ) ) ( not ( = ?auto_14791 ?auto_14789 ) ) ( HOIST-AT ?auto_14788 ?auto_14791 ) ( not ( = ?auto_14790 ?auto_14788 ) ) ( AVAILABLE ?auto_14788 ) ( SURFACE-AT ?auto_14784 ?auto_14791 ) ( ON ?auto_14784 ?auto_14792 ) ( CLEAR ?auto_14784 ) ( not ( = ?auto_14783 ?auto_14792 ) ) ( not ( = ?auto_14784 ?auto_14792 ) ) ( not ( = ?auto_14782 ?auto_14792 ) ) ( SURFACE-AT ?auto_14782 ?auto_14789 ) ( CLEAR ?auto_14782 ) ( IS-CRATE ?auto_14783 ) ( AVAILABLE ?auto_14790 ) ( TRUCK-AT ?auto_14787 ?auto_14786 ) ( not ( = ?auto_14786 ?auto_14789 ) ) ( not ( = ?auto_14791 ?auto_14786 ) ) ( HOIST-AT ?auto_14785 ?auto_14786 ) ( LIFTING ?auto_14785 ?auto_14783 ) ( not ( = ?auto_14790 ?auto_14785 ) ) ( not ( = ?auto_14788 ?auto_14785 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14783 ?auto_14784 )
      ( MAKE-2CRATE-VERIFY ?auto_14782 ?auto_14783 ?auto_14784 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14793 - SURFACE
      ?auto_14794 - SURFACE
      ?auto_14795 - SURFACE
      ?auto_14796 - SURFACE
    )
    :vars
    (
      ?auto_14803 - HOIST
      ?auto_14797 - PLACE
      ?auto_14799 - PLACE
      ?auto_14800 - HOIST
      ?auto_14802 - SURFACE
      ?auto_14804 - TRUCK
      ?auto_14801 - PLACE
      ?auto_14798 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14803 ?auto_14797 ) ( IS-CRATE ?auto_14796 ) ( not ( = ?auto_14795 ?auto_14796 ) ) ( not ( = ?auto_14794 ?auto_14795 ) ) ( not ( = ?auto_14794 ?auto_14796 ) ) ( not ( = ?auto_14799 ?auto_14797 ) ) ( HOIST-AT ?auto_14800 ?auto_14799 ) ( not ( = ?auto_14803 ?auto_14800 ) ) ( AVAILABLE ?auto_14800 ) ( SURFACE-AT ?auto_14796 ?auto_14799 ) ( ON ?auto_14796 ?auto_14802 ) ( CLEAR ?auto_14796 ) ( not ( = ?auto_14795 ?auto_14802 ) ) ( not ( = ?auto_14796 ?auto_14802 ) ) ( not ( = ?auto_14794 ?auto_14802 ) ) ( SURFACE-AT ?auto_14794 ?auto_14797 ) ( CLEAR ?auto_14794 ) ( IS-CRATE ?auto_14795 ) ( AVAILABLE ?auto_14803 ) ( TRUCK-AT ?auto_14804 ?auto_14801 ) ( not ( = ?auto_14801 ?auto_14797 ) ) ( not ( = ?auto_14799 ?auto_14801 ) ) ( HOIST-AT ?auto_14798 ?auto_14801 ) ( LIFTING ?auto_14798 ?auto_14795 ) ( not ( = ?auto_14803 ?auto_14798 ) ) ( not ( = ?auto_14800 ?auto_14798 ) ) ( ON ?auto_14794 ?auto_14793 ) ( not ( = ?auto_14793 ?auto_14794 ) ) ( not ( = ?auto_14793 ?auto_14795 ) ) ( not ( = ?auto_14793 ?auto_14796 ) ) ( not ( = ?auto_14793 ?auto_14802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14794 ?auto_14795 ?auto_14796 )
      ( MAKE-3CRATE-VERIFY ?auto_14793 ?auto_14794 ?auto_14795 ?auto_14796 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14805 - SURFACE
      ?auto_14806 - SURFACE
      ?auto_14807 - SURFACE
      ?auto_14808 - SURFACE
      ?auto_14809 - SURFACE
    )
    :vars
    (
      ?auto_14816 - HOIST
      ?auto_14810 - PLACE
      ?auto_14812 - PLACE
      ?auto_14813 - HOIST
      ?auto_14815 - SURFACE
      ?auto_14817 - TRUCK
      ?auto_14814 - PLACE
      ?auto_14811 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14816 ?auto_14810 ) ( IS-CRATE ?auto_14809 ) ( not ( = ?auto_14808 ?auto_14809 ) ) ( not ( = ?auto_14807 ?auto_14808 ) ) ( not ( = ?auto_14807 ?auto_14809 ) ) ( not ( = ?auto_14812 ?auto_14810 ) ) ( HOIST-AT ?auto_14813 ?auto_14812 ) ( not ( = ?auto_14816 ?auto_14813 ) ) ( AVAILABLE ?auto_14813 ) ( SURFACE-AT ?auto_14809 ?auto_14812 ) ( ON ?auto_14809 ?auto_14815 ) ( CLEAR ?auto_14809 ) ( not ( = ?auto_14808 ?auto_14815 ) ) ( not ( = ?auto_14809 ?auto_14815 ) ) ( not ( = ?auto_14807 ?auto_14815 ) ) ( SURFACE-AT ?auto_14807 ?auto_14810 ) ( CLEAR ?auto_14807 ) ( IS-CRATE ?auto_14808 ) ( AVAILABLE ?auto_14816 ) ( TRUCK-AT ?auto_14817 ?auto_14814 ) ( not ( = ?auto_14814 ?auto_14810 ) ) ( not ( = ?auto_14812 ?auto_14814 ) ) ( HOIST-AT ?auto_14811 ?auto_14814 ) ( LIFTING ?auto_14811 ?auto_14808 ) ( not ( = ?auto_14816 ?auto_14811 ) ) ( not ( = ?auto_14813 ?auto_14811 ) ) ( ON ?auto_14806 ?auto_14805 ) ( ON ?auto_14807 ?auto_14806 ) ( not ( = ?auto_14805 ?auto_14806 ) ) ( not ( = ?auto_14805 ?auto_14807 ) ) ( not ( = ?auto_14805 ?auto_14808 ) ) ( not ( = ?auto_14805 ?auto_14809 ) ) ( not ( = ?auto_14805 ?auto_14815 ) ) ( not ( = ?auto_14806 ?auto_14807 ) ) ( not ( = ?auto_14806 ?auto_14808 ) ) ( not ( = ?auto_14806 ?auto_14809 ) ) ( not ( = ?auto_14806 ?auto_14815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14807 ?auto_14808 ?auto_14809 )
      ( MAKE-4CRATE-VERIFY ?auto_14805 ?auto_14806 ?auto_14807 ?auto_14808 ?auto_14809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14818 - SURFACE
      ?auto_14819 - SURFACE
    )
    :vars
    (
      ?auto_14827 - HOIST
      ?auto_14820 - PLACE
      ?auto_14823 - SURFACE
      ?auto_14822 - PLACE
      ?auto_14824 - HOIST
      ?auto_14826 - SURFACE
      ?auto_14828 - TRUCK
      ?auto_14825 - PLACE
      ?auto_14821 - HOIST
      ?auto_14829 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14827 ?auto_14820 ) ( IS-CRATE ?auto_14819 ) ( not ( = ?auto_14818 ?auto_14819 ) ) ( not ( = ?auto_14823 ?auto_14818 ) ) ( not ( = ?auto_14823 ?auto_14819 ) ) ( not ( = ?auto_14822 ?auto_14820 ) ) ( HOIST-AT ?auto_14824 ?auto_14822 ) ( not ( = ?auto_14827 ?auto_14824 ) ) ( AVAILABLE ?auto_14824 ) ( SURFACE-AT ?auto_14819 ?auto_14822 ) ( ON ?auto_14819 ?auto_14826 ) ( CLEAR ?auto_14819 ) ( not ( = ?auto_14818 ?auto_14826 ) ) ( not ( = ?auto_14819 ?auto_14826 ) ) ( not ( = ?auto_14823 ?auto_14826 ) ) ( SURFACE-AT ?auto_14823 ?auto_14820 ) ( CLEAR ?auto_14823 ) ( IS-CRATE ?auto_14818 ) ( AVAILABLE ?auto_14827 ) ( TRUCK-AT ?auto_14828 ?auto_14825 ) ( not ( = ?auto_14825 ?auto_14820 ) ) ( not ( = ?auto_14822 ?auto_14825 ) ) ( HOIST-AT ?auto_14821 ?auto_14825 ) ( not ( = ?auto_14827 ?auto_14821 ) ) ( not ( = ?auto_14824 ?auto_14821 ) ) ( AVAILABLE ?auto_14821 ) ( SURFACE-AT ?auto_14818 ?auto_14825 ) ( ON ?auto_14818 ?auto_14829 ) ( CLEAR ?auto_14818 ) ( not ( = ?auto_14818 ?auto_14829 ) ) ( not ( = ?auto_14819 ?auto_14829 ) ) ( not ( = ?auto_14823 ?auto_14829 ) ) ( not ( = ?auto_14826 ?auto_14829 ) ) )
    :subtasks
    ( ( !LIFT ?auto_14821 ?auto_14818 ?auto_14829 ?auto_14825 )
      ( MAKE-2CRATE ?auto_14823 ?auto_14818 ?auto_14819 )
      ( MAKE-1CRATE-VERIFY ?auto_14818 ?auto_14819 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14830 - SURFACE
      ?auto_14831 - SURFACE
      ?auto_14832 - SURFACE
    )
    :vars
    (
      ?auto_14837 - HOIST
      ?auto_14833 - PLACE
      ?auto_14841 - PLACE
      ?auto_14840 - HOIST
      ?auto_14838 - SURFACE
      ?auto_14836 - TRUCK
      ?auto_14835 - PLACE
      ?auto_14834 - HOIST
      ?auto_14839 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14837 ?auto_14833 ) ( IS-CRATE ?auto_14832 ) ( not ( = ?auto_14831 ?auto_14832 ) ) ( not ( = ?auto_14830 ?auto_14831 ) ) ( not ( = ?auto_14830 ?auto_14832 ) ) ( not ( = ?auto_14841 ?auto_14833 ) ) ( HOIST-AT ?auto_14840 ?auto_14841 ) ( not ( = ?auto_14837 ?auto_14840 ) ) ( AVAILABLE ?auto_14840 ) ( SURFACE-AT ?auto_14832 ?auto_14841 ) ( ON ?auto_14832 ?auto_14838 ) ( CLEAR ?auto_14832 ) ( not ( = ?auto_14831 ?auto_14838 ) ) ( not ( = ?auto_14832 ?auto_14838 ) ) ( not ( = ?auto_14830 ?auto_14838 ) ) ( SURFACE-AT ?auto_14830 ?auto_14833 ) ( CLEAR ?auto_14830 ) ( IS-CRATE ?auto_14831 ) ( AVAILABLE ?auto_14837 ) ( TRUCK-AT ?auto_14836 ?auto_14835 ) ( not ( = ?auto_14835 ?auto_14833 ) ) ( not ( = ?auto_14841 ?auto_14835 ) ) ( HOIST-AT ?auto_14834 ?auto_14835 ) ( not ( = ?auto_14837 ?auto_14834 ) ) ( not ( = ?auto_14840 ?auto_14834 ) ) ( AVAILABLE ?auto_14834 ) ( SURFACE-AT ?auto_14831 ?auto_14835 ) ( ON ?auto_14831 ?auto_14839 ) ( CLEAR ?auto_14831 ) ( not ( = ?auto_14831 ?auto_14839 ) ) ( not ( = ?auto_14832 ?auto_14839 ) ) ( not ( = ?auto_14830 ?auto_14839 ) ) ( not ( = ?auto_14838 ?auto_14839 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14831 ?auto_14832 )
      ( MAKE-2CRATE-VERIFY ?auto_14830 ?auto_14831 ?auto_14832 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14842 - SURFACE
      ?auto_14843 - SURFACE
      ?auto_14844 - SURFACE
      ?auto_14845 - SURFACE
    )
    :vars
    (
      ?auto_14848 - HOIST
      ?auto_14850 - PLACE
      ?auto_14853 - PLACE
      ?auto_14852 - HOIST
      ?auto_14854 - SURFACE
      ?auto_14847 - TRUCK
      ?auto_14846 - PLACE
      ?auto_14849 - HOIST
      ?auto_14851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14848 ?auto_14850 ) ( IS-CRATE ?auto_14845 ) ( not ( = ?auto_14844 ?auto_14845 ) ) ( not ( = ?auto_14843 ?auto_14844 ) ) ( not ( = ?auto_14843 ?auto_14845 ) ) ( not ( = ?auto_14853 ?auto_14850 ) ) ( HOIST-AT ?auto_14852 ?auto_14853 ) ( not ( = ?auto_14848 ?auto_14852 ) ) ( AVAILABLE ?auto_14852 ) ( SURFACE-AT ?auto_14845 ?auto_14853 ) ( ON ?auto_14845 ?auto_14854 ) ( CLEAR ?auto_14845 ) ( not ( = ?auto_14844 ?auto_14854 ) ) ( not ( = ?auto_14845 ?auto_14854 ) ) ( not ( = ?auto_14843 ?auto_14854 ) ) ( SURFACE-AT ?auto_14843 ?auto_14850 ) ( CLEAR ?auto_14843 ) ( IS-CRATE ?auto_14844 ) ( AVAILABLE ?auto_14848 ) ( TRUCK-AT ?auto_14847 ?auto_14846 ) ( not ( = ?auto_14846 ?auto_14850 ) ) ( not ( = ?auto_14853 ?auto_14846 ) ) ( HOIST-AT ?auto_14849 ?auto_14846 ) ( not ( = ?auto_14848 ?auto_14849 ) ) ( not ( = ?auto_14852 ?auto_14849 ) ) ( AVAILABLE ?auto_14849 ) ( SURFACE-AT ?auto_14844 ?auto_14846 ) ( ON ?auto_14844 ?auto_14851 ) ( CLEAR ?auto_14844 ) ( not ( = ?auto_14844 ?auto_14851 ) ) ( not ( = ?auto_14845 ?auto_14851 ) ) ( not ( = ?auto_14843 ?auto_14851 ) ) ( not ( = ?auto_14854 ?auto_14851 ) ) ( ON ?auto_14843 ?auto_14842 ) ( not ( = ?auto_14842 ?auto_14843 ) ) ( not ( = ?auto_14842 ?auto_14844 ) ) ( not ( = ?auto_14842 ?auto_14845 ) ) ( not ( = ?auto_14842 ?auto_14854 ) ) ( not ( = ?auto_14842 ?auto_14851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14843 ?auto_14844 ?auto_14845 )
      ( MAKE-3CRATE-VERIFY ?auto_14842 ?auto_14843 ?auto_14844 ?auto_14845 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14855 - SURFACE
      ?auto_14856 - SURFACE
      ?auto_14857 - SURFACE
      ?auto_14858 - SURFACE
      ?auto_14859 - SURFACE
    )
    :vars
    (
      ?auto_14862 - HOIST
      ?auto_14864 - PLACE
      ?auto_14867 - PLACE
      ?auto_14866 - HOIST
      ?auto_14868 - SURFACE
      ?auto_14861 - TRUCK
      ?auto_14860 - PLACE
      ?auto_14863 - HOIST
      ?auto_14865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14862 ?auto_14864 ) ( IS-CRATE ?auto_14859 ) ( not ( = ?auto_14858 ?auto_14859 ) ) ( not ( = ?auto_14857 ?auto_14858 ) ) ( not ( = ?auto_14857 ?auto_14859 ) ) ( not ( = ?auto_14867 ?auto_14864 ) ) ( HOIST-AT ?auto_14866 ?auto_14867 ) ( not ( = ?auto_14862 ?auto_14866 ) ) ( AVAILABLE ?auto_14866 ) ( SURFACE-AT ?auto_14859 ?auto_14867 ) ( ON ?auto_14859 ?auto_14868 ) ( CLEAR ?auto_14859 ) ( not ( = ?auto_14858 ?auto_14868 ) ) ( not ( = ?auto_14859 ?auto_14868 ) ) ( not ( = ?auto_14857 ?auto_14868 ) ) ( SURFACE-AT ?auto_14857 ?auto_14864 ) ( CLEAR ?auto_14857 ) ( IS-CRATE ?auto_14858 ) ( AVAILABLE ?auto_14862 ) ( TRUCK-AT ?auto_14861 ?auto_14860 ) ( not ( = ?auto_14860 ?auto_14864 ) ) ( not ( = ?auto_14867 ?auto_14860 ) ) ( HOIST-AT ?auto_14863 ?auto_14860 ) ( not ( = ?auto_14862 ?auto_14863 ) ) ( not ( = ?auto_14866 ?auto_14863 ) ) ( AVAILABLE ?auto_14863 ) ( SURFACE-AT ?auto_14858 ?auto_14860 ) ( ON ?auto_14858 ?auto_14865 ) ( CLEAR ?auto_14858 ) ( not ( = ?auto_14858 ?auto_14865 ) ) ( not ( = ?auto_14859 ?auto_14865 ) ) ( not ( = ?auto_14857 ?auto_14865 ) ) ( not ( = ?auto_14868 ?auto_14865 ) ) ( ON ?auto_14856 ?auto_14855 ) ( ON ?auto_14857 ?auto_14856 ) ( not ( = ?auto_14855 ?auto_14856 ) ) ( not ( = ?auto_14855 ?auto_14857 ) ) ( not ( = ?auto_14855 ?auto_14858 ) ) ( not ( = ?auto_14855 ?auto_14859 ) ) ( not ( = ?auto_14855 ?auto_14868 ) ) ( not ( = ?auto_14855 ?auto_14865 ) ) ( not ( = ?auto_14856 ?auto_14857 ) ) ( not ( = ?auto_14856 ?auto_14858 ) ) ( not ( = ?auto_14856 ?auto_14859 ) ) ( not ( = ?auto_14856 ?auto_14868 ) ) ( not ( = ?auto_14856 ?auto_14865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14857 ?auto_14858 ?auto_14859 )
      ( MAKE-4CRATE-VERIFY ?auto_14855 ?auto_14856 ?auto_14857 ?auto_14858 ?auto_14859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14869 - SURFACE
      ?auto_14870 - SURFACE
    )
    :vars
    (
      ?auto_14873 - HOIST
      ?auto_14875 - PLACE
      ?auto_14878 - SURFACE
      ?auto_14879 - PLACE
      ?auto_14877 - HOIST
      ?auto_14880 - SURFACE
      ?auto_14871 - PLACE
      ?auto_14874 - HOIST
      ?auto_14876 - SURFACE
      ?auto_14872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14873 ?auto_14875 ) ( IS-CRATE ?auto_14870 ) ( not ( = ?auto_14869 ?auto_14870 ) ) ( not ( = ?auto_14878 ?auto_14869 ) ) ( not ( = ?auto_14878 ?auto_14870 ) ) ( not ( = ?auto_14879 ?auto_14875 ) ) ( HOIST-AT ?auto_14877 ?auto_14879 ) ( not ( = ?auto_14873 ?auto_14877 ) ) ( AVAILABLE ?auto_14877 ) ( SURFACE-AT ?auto_14870 ?auto_14879 ) ( ON ?auto_14870 ?auto_14880 ) ( CLEAR ?auto_14870 ) ( not ( = ?auto_14869 ?auto_14880 ) ) ( not ( = ?auto_14870 ?auto_14880 ) ) ( not ( = ?auto_14878 ?auto_14880 ) ) ( SURFACE-AT ?auto_14878 ?auto_14875 ) ( CLEAR ?auto_14878 ) ( IS-CRATE ?auto_14869 ) ( AVAILABLE ?auto_14873 ) ( not ( = ?auto_14871 ?auto_14875 ) ) ( not ( = ?auto_14879 ?auto_14871 ) ) ( HOIST-AT ?auto_14874 ?auto_14871 ) ( not ( = ?auto_14873 ?auto_14874 ) ) ( not ( = ?auto_14877 ?auto_14874 ) ) ( AVAILABLE ?auto_14874 ) ( SURFACE-AT ?auto_14869 ?auto_14871 ) ( ON ?auto_14869 ?auto_14876 ) ( CLEAR ?auto_14869 ) ( not ( = ?auto_14869 ?auto_14876 ) ) ( not ( = ?auto_14870 ?auto_14876 ) ) ( not ( = ?auto_14878 ?auto_14876 ) ) ( not ( = ?auto_14880 ?auto_14876 ) ) ( TRUCK-AT ?auto_14872 ?auto_14875 ) )
    :subtasks
    ( ( !DRIVE ?auto_14872 ?auto_14875 ?auto_14871 )
      ( MAKE-2CRATE ?auto_14878 ?auto_14869 ?auto_14870 )
      ( MAKE-1CRATE-VERIFY ?auto_14869 ?auto_14870 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14881 - SURFACE
      ?auto_14882 - SURFACE
      ?auto_14883 - SURFACE
    )
    :vars
    (
      ?auto_14884 - HOIST
      ?auto_14888 - PLACE
      ?auto_14891 - PLACE
      ?auto_14892 - HOIST
      ?auto_14890 - SURFACE
      ?auto_14887 - PLACE
      ?auto_14889 - HOIST
      ?auto_14885 - SURFACE
      ?auto_14886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14884 ?auto_14888 ) ( IS-CRATE ?auto_14883 ) ( not ( = ?auto_14882 ?auto_14883 ) ) ( not ( = ?auto_14881 ?auto_14882 ) ) ( not ( = ?auto_14881 ?auto_14883 ) ) ( not ( = ?auto_14891 ?auto_14888 ) ) ( HOIST-AT ?auto_14892 ?auto_14891 ) ( not ( = ?auto_14884 ?auto_14892 ) ) ( AVAILABLE ?auto_14892 ) ( SURFACE-AT ?auto_14883 ?auto_14891 ) ( ON ?auto_14883 ?auto_14890 ) ( CLEAR ?auto_14883 ) ( not ( = ?auto_14882 ?auto_14890 ) ) ( not ( = ?auto_14883 ?auto_14890 ) ) ( not ( = ?auto_14881 ?auto_14890 ) ) ( SURFACE-AT ?auto_14881 ?auto_14888 ) ( CLEAR ?auto_14881 ) ( IS-CRATE ?auto_14882 ) ( AVAILABLE ?auto_14884 ) ( not ( = ?auto_14887 ?auto_14888 ) ) ( not ( = ?auto_14891 ?auto_14887 ) ) ( HOIST-AT ?auto_14889 ?auto_14887 ) ( not ( = ?auto_14884 ?auto_14889 ) ) ( not ( = ?auto_14892 ?auto_14889 ) ) ( AVAILABLE ?auto_14889 ) ( SURFACE-AT ?auto_14882 ?auto_14887 ) ( ON ?auto_14882 ?auto_14885 ) ( CLEAR ?auto_14882 ) ( not ( = ?auto_14882 ?auto_14885 ) ) ( not ( = ?auto_14883 ?auto_14885 ) ) ( not ( = ?auto_14881 ?auto_14885 ) ) ( not ( = ?auto_14890 ?auto_14885 ) ) ( TRUCK-AT ?auto_14886 ?auto_14888 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14882 ?auto_14883 )
      ( MAKE-2CRATE-VERIFY ?auto_14881 ?auto_14882 ?auto_14883 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14893 - SURFACE
      ?auto_14894 - SURFACE
      ?auto_14895 - SURFACE
      ?auto_14896 - SURFACE
    )
    :vars
    (
      ?auto_14902 - HOIST
      ?auto_14900 - PLACE
      ?auto_14898 - PLACE
      ?auto_14897 - HOIST
      ?auto_14904 - SURFACE
      ?auto_14905 - PLACE
      ?auto_14901 - HOIST
      ?auto_14903 - SURFACE
      ?auto_14899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14902 ?auto_14900 ) ( IS-CRATE ?auto_14896 ) ( not ( = ?auto_14895 ?auto_14896 ) ) ( not ( = ?auto_14894 ?auto_14895 ) ) ( not ( = ?auto_14894 ?auto_14896 ) ) ( not ( = ?auto_14898 ?auto_14900 ) ) ( HOIST-AT ?auto_14897 ?auto_14898 ) ( not ( = ?auto_14902 ?auto_14897 ) ) ( AVAILABLE ?auto_14897 ) ( SURFACE-AT ?auto_14896 ?auto_14898 ) ( ON ?auto_14896 ?auto_14904 ) ( CLEAR ?auto_14896 ) ( not ( = ?auto_14895 ?auto_14904 ) ) ( not ( = ?auto_14896 ?auto_14904 ) ) ( not ( = ?auto_14894 ?auto_14904 ) ) ( SURFACE-AT ?auto_14894 ?auto_14900 ) ( CLEAR ?auto_14894 ) ( IS-CRATE ?auto_14895 ) ( AVAILABLE ?auto_14902 ) ( not ( = ?auto_14905 ?auto_14900 ) ) ( not ( = ?auto_14898 ?auto_14905 ) ) ( HOIST-AT ?auto_14901 ?auto_14905 ) ( not ( = ?auto_14902 ?auto_14901 ) ) ( not ( = ?auto_14897 ?auto_14901 ) ) ( AVAILABLE ?auto_14901 ) ( SURFACE-AT ?auto_14895 ?auto_14905 ) ( ON ?auto_14895 ?auto_14903 ) ( CLEAR ?auto_14895 ) ( not ( = ?auto_14895 ?auto_14903 ) ) ( not ( = ?auto_14896 ?auto_14903 ) ) ( not ( = ?auto_14894 ?auto_14903 ) ) ( not ( = ?auto_14904 ?auto_14903 ) ) ( TRUCK-AT ?auto_14899 ?auto_14900 ) ( ON ?auto_14894 ?auto_14893 ) ( not ( = ?auto_14893 ?auto_14894 ) ) ( not ( = ?auto_14893 ?auto_14895 ) ) ( not ( = ?auto_14893 ?auto_14896 ) ) ( not ( = ?auto_14893 ?auto_14904 ) ) ( not ( = ?auto_14893 ?auto_14903 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14894 ?auto_14895 ?auto_14896 )
      ( MAKE-3CRATE-VERIFY ?auto_14893 ?auto_14894 ?auto_14895 ?auto_14896 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14906 - SURFACE
      ?auto_14907 - SURFACE
      ?auto_14908 - SURFACE
      ?auto_14909 - SURFACE
      ?auto_14910 - SURFACE
    )
    :vars
    (
      ?auto_14916 - HOIST
      ?auto_14914 - PLACE
      ?auto_14912 - PLACE
      ?auto_14911 - HOIST
      ?auto_14918 - SURFACE
      ?auto_14919 - PLACE
      ?auto_14915 - HOIST
      ?auto_14917 - SURFACE
      ?auto_14913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14916 ?auto_14914 ) ( IS-CRATE ?auto_14910 ) ( not ( = ?auto_14909 ?auto_14910 ) ) ( not ( = ?auto_14908 ?auto_14909 ) ) ( not ( = ?auto_14908 ?auto_14910 ) ) ( not ( = ?auto_14912 ?auto_14914 ) ) ( HOIST-AT ?auto_14911 ?auto_14912 ) ( not ( = ?auto_14916 ?auto_14911 ) ) ( AVAILABLE ?auto_14911 ) ( SURFACE-AT ?auto_14910 ?auto_14912 ) ( ON ?auto_14910 ?auto_14918 ) ( CLEAR ?auto_14910 ) ( not ( = ?auto_14909 ?auto_14918 ) ) ( not ( = ?auto_14910 ?auto_14918 ) ) ( not ( = ?auto_14908 ?auto_14918 ) ) ( SURFACE-AT ?auto_14908 ?auto_14914 ) ( CLEAR ?auto_14908 ) ( IS-CRATE ?auto_14909 ) ( AVAILABLE ?auto_14916 ) ( not ( = ?auto_14919 ?auto_14914 ) ) ( not ( = ?auto_14912 ?auto_14919 ) ) ( HOIST-AT ?auto_14915 ?auto_14919 ) ( not ( = ?auto_14916 ?auto_14915 ) ) ( not ( = ?auto_14911 ?auto_14915 ) ) ( AVAILABLE ?auto_14915 ) ( SURFACE-AT ?auto_14909 ?auto_14919 ) ( ON ?auto_14909 ?auto_14917 ) ( CLEAR ?auto_14909 ) ( not ( = ?auto_14909 ?auto_14917 ) ) ( not ( = ?auto_14910 ?auto_14917 ) ) ( not ( = ?auto_14908 ?auto_14917 ) ) ( not ( = ?auto_14918 ?auto_14917 ) ) ( TRUCK-AT ?auto_14913 ?auto_14914 ) ( ON ?auto_14907 ?auto_14906 ) ( ON ?auto_14908 ?auto_14907 ) ( not ( = ?auto_14906 ?auto_14907 ) ) ( not ( = ?auto_14906 ?auto_14908 ) ) ( not ( = ?auto_14906 ?auto_14909 ) ) ( not ( = ?auto_14906 ?auto_14910 ) ) ( not ( = ?auto_14906 ?auto_14918 ) ) ( not ( = ?auto_14906 ?auto_14917 ) ) ( not ( = ?auto_14907 ?auto_14908 ) ) ( not ( = ?auto_14907 ?auto_14909 ) ) ( not ( = ?auto_14907 ?auto_14910 ) ) ( not ( = ?auto_14907 ?auto_14918 ) ) ( not ( = ?auto_14907 ?auto_14917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14908 ?auto_14909 ?auto_14910 )
      ( MAKE-4CRATE-VERIFY ?auto_14906 ?auto_14907 ?auto_14908 ?auto_14909 ?auto_14910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14920 - SURFACE
      ?auto_14921 - SURFACE
    )
    :vars
    (
      ?auto_14928 - HOIST
      ?auto_14926 - PLACE
      ?auto_14922 - SURFACE
      ?auto_14924 - PLACE
      ?auto_14923 - HOIST
      ?auto_14930 - SURFACE
      ?auto_14931 - PLACE
      ?auto_14927 - HOIST
      ?auto_14929 - SURFACE
      ?auto_14925 - TRUCK
      ?auto_14932 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14928 ?auto_14926 ) ( IS-CRATE ?auto_14921 ) ( not ( = ?auto_14920 ?auto_14921 ) ) ( not ( = ?auto_14922 ?auto_14920 ) ) ( not ( = ?auto_14922 ?auto_14921 ) ) ( not ( = ?auto_14924 ?auto_14926 ) ) ( HOIST-AT ?auto_14923 ?auto_14924 ) ( not ( = ?auto_14928 ?auto_14923 ) ) ( AVAILABLE ?auto_14923 ) ( SURFACE-AT ?auto_14921 ?auto_14924 ) ( ON ?auto_14921 ?auto_14930 ) ( CLEAR ?auto_14921 ) ( not ( = ?auto_14920 ?auto_14930 ) ) ( not ( = ?auto_14921 ?auto_14930 ) ) ( not ( = ?auto_14922 ?auto_14930 ) ) ( IS-CRATE ?auto_14920 ) ( not ( = ?auto_14931 ?auto_14926 ) ) ( not ( = ?auto_14924 ?auto_14931 ) ) ( HOIST-AT ?auto_14927 ?auto_14931 ) ( not ( = ?auto_14928 ?auto_14927 ) ) ( not ( = ?auto_14923 ?auto_14927 ) ) ( AVAILABLE ?auto_14927 ) ( SURFACE-AT ?auto_14920 ?auto_14931 ) ( ON ?auto_14920 ?auto_14929 ) ( CLEAR ?auto_14920 ) ( not ( = ?auto_14920 ?auto_14929 ) ) ( not ( = ?auto_14921 ?auto_14929 ) ) ( not ( = ?auto_14922 ?auto_14929 ) ) ( not ( = ?auto_14930 ?auto_14929 ) ) ( TRUCK-AT ?auto_14925 ?auto_14926 ) ( SURFACE-AT ?auto_14932 ?auto_14926 ) ( CLEAR ?auto_14932 ) ( LIFTING ?auto_14928 ?auto_14922 ) ( IS-CRATE ?auto_14922 ) ( not ( = ?auto_14932 ?auto_14922 ) ) ( not ( = ?auto_14920 ?auto_14932 ) ) ( not ( = ?auto_14921 ?auto_14932 ) ) ( not ( = ?auto_14930 ?auto_14932 ) ) ( not ( = ?auto_14929 ?auto_14932 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14932 ?auto_14922 )
      ( MAKE-2CRATE ?auto_14922 ?auto_14920 ?auto_14921 )
      ( MAKE-1CRATE-VERIFY ?auto_14920 ?auto_14921 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14933 - SURFACE
      ?auto_14934 - SURFACE
      ?auto_14935 - SURFACE
    )
    :vars
    (
      ?auto_14937 - HOIST
      ?auto_14943 - PLACE
      ?auto_14944 - PLACE
      ?auto_14936 - HOIST
      ?auto_14938 - SURFACE
      ?auto_14942 - PLACE
      ?auto_14940 - HOIST
      ?auto_14939 - SURFACE
      ?auto_14945 - TRUCK
      ?auto_14941 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14937 ?auto_14943 ) ( IS-CRATE ?auto_14935 ) ( not ( = ?auto_14934 ?auto_14935 ) ) ( not ( = ?auto_14933 ?auto_14934 ) ) ( not ( = ?auto_14933 ?auto_14935 ) ) ( not ( = ?auto_14944 ?auto_14943 ) ) ( HOIST-AT ?auto_14936 ?auto_14944 ) ( not ( = ?auto_14937 ?auto_14936 ) ) ( AVAILABLE ?auto_14936 ) ( SURFACE-AT ?auto_14935 ?auto_14944 ) ( ON ?auto_14935 ?auto_14938 ) ( CLEAR ?auto_14935 ) ( not ( = ?auto_14934 ?auto_14938 ) ) ( not ( = ?auto_14935 ?auto_14938 ) ) ( not ( = ?auto_14933 ?auto_14938 ) ) ( IS-CRATE ?auto_14934 ) ( not ( = ?auto_14942 ?auto_14943 ) ) ( not ( = ?auto_14944 ?auto_14942 ) ) ( HOIST-AT ?auto_14940 ?auto_14942 ) ( not ( = ?auto_14937 ?auto_14940 ) ) ( not ( = ?auto_14936 ?auto_14940 ) ) ( AVAILABLE ?auto_14940 ) ( SURFACE-AT ?auto_14934 ?auto_14942 ) ( ON ?auto_14934 ?auto_14939 ) ( CLEAR ?auto_14934 ) ( not ( = ?auto_14934 ?auto_14939 ) ) ( not ( = ?auto_14935 ?auto_14939 ) ) ( not ( = ?auto_14933 ?auto_14939 ) ) ( not ( = ?auto_14938 ?auto_14939 ) ) ( TRUCK-AT ?auto_14945 ?auto_14943 ) ( SURFACE-AT ?auto_14941 ?auto_14943 ) ( CLEAR ?auto_14941 ) ( LIFTING ?auto_14937 ?auto_14933 ) ( IS-CRATE ?auto_14933 ) ( not ( = ?auto_14941 ?auto_14933 ) ) ( not ( = ?auto_14934 ?auto_14941 ) ) ( not ( = ?auto_14935 ?auto_14941 ) ) ( not ( = ?auto_14938 ?auto_14941 ) ) ( not ( = ?auto_14939 ?auto_14941 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14934 ?auto_14935 )
      ( MAKE-2CRATE-VERIFY ?auto_14933 ?auto_14934 ?auto_14935 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14946 - SURFACE
      ?auto_14947 - SURFACE
      ?auto_14948 - SURFACE
      ?auto_14949 - SURFACE
    )
    :vars
    (
      ?auto_14953 - HOIST
      ?auto_14951 - PLACE
      ?auto_14956 - PLACE
      ?auto_14957 - HOIST
      ?auto_14952 - SURFACE
      ?auto_14955 - PLACE
      ?auto_14954 - HOIST
      ?auto_14950 - SURFACE
      ?auto_14958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14953 ?auto_14951 ) ( IS-CRATE ?auto_14949 ) ( not ( = ?auto_14948 ?auto_14949 ) ) ( not ( = ?auto_14947 ?auto_14948 ) ) ( not ( = ?auto_14947 ?auto_14949 ) ) ( not ( = ?auto_14956 ?auto_14951 ) ) ( HOIST-AT ?auto_14957 ?auto_14956 ) ( not ( = ?auto_14953 ?auto_14957 ) ) ( AVAILABLE ?auto_14957 ) ( SURFACE-AT ?auto_14949 ?auto_14956 ) ( ON ?auto_14949 ?auto_14952 ) ( CLEAR ?auto_14949 ) ( not ( = ?auto_14948 ?auto_14952 ) ) ( not ( = ?auto_14949 ?auto_14952 ) ) ( not ( = ?auto_14947 ?auto_14952 ) ) ( IS-CRATE ?auto_14948 ) ( not ( = ?auto_14955 ?auto_14951 ) ) ( not ( = ?auto_14956 ?auto_14955 ) ) ( HOIST-AT ?auto_14954 ?auto_14955 ) ( not ( = ?auto_14953 ?auto_14954 ) ) ( not ( = ?auto_14957 ?auto_14954 ) ) ( AVAILABLE ?auto_14954 ) ( SURFACE-AT ?auto_14948 ?auto_14955 ) ( ON ?auto_14948 ?auto_14950 ) ( CLEAR ?auto_14948 ) ( not ( = ?auto_14948 ?auto_14950 ) ) ( not ( = ?auto_14949 ?auto_14950 ) ) ( not ( = ?auto_14947 ?auto_14950 ) ) ( not ( = ?auto_14952 ?auto_14950 ) ) ( TRUCK-AT ?auto_14958 ?auto_14951 ) ( SURFACE-AT ?auto_14946 ?auto_14951 ) ( CLEAR ?auto_14946 ) ( LIFTING ?auto_14953 ?auto_14947 ) ( IS-CRATE ?auto_14947 ) ( not ( = ?auto_14946 ?auto_14947 ) ) ( not ( = ?auto_14948 ?auto_14946 ) ) ( not ( = ?auto_14949 ?auto_14946 ) ) ( not ( = ?auto_14952 ?auto_14946 ) ) ( not ( = ?auto_14950 ?auto_14946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14947 ?auto_14948 ?auto_14949 )
      ( MAKE-3CRATE-VERIFY ?auto_14946 ?auto_14947 ?auto_14948 ?auto_14949 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14959 - SURFACE
      ?auto_14960 - SURFACE
      ?auto_14961 - SURFACE
      ?auto_14962 - SURFACE
      ?auto_14963 - SURFACE
    )
    :vars
    (
      ?auto_14967 - HOIST
      ?auto_14965 - PLACE
      ?auto_14970 - PLACE
      ?auto_14971 - HOIST
      ?auto_14966 - SURFACE
      ?auto_14969 - PLACE
      ?auto_14968 - HOIST
      ?auto_14964 - SURFACE
      ?auto_14972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14967 ?auto_14965 ) ( IS-CRATE ?auto_14963 ) ( not ( = ?auto_14962 ?auto_14963 ) ) ( not ( = ?auto_14961 ?auto_14962 ) ) ( not ( = ?auto_14961 ?auto_14963 ) ) ( not ( = ?auto_14970 ?auto_14965 ) ) ( HOIST-AT ?auto_14971 ?auto_14970 ) ( not ( = ?auto_14967 ?auto_14971 ) ) ( AVAILABLE ?auto_14971 ) ( SURFACE-AT ?auto_14963 ?auto_14970 ) ( ON ?auto_14963 ?auto_14966 ) ( CLEAR ?auto_14963 ) ( not ( = ?auto_14962 ?auto_14966 ) ) ( not ( = ?auto_14963 ?auto_14966 ) ) ( not ( = ?auto_14961 ?auto_14966 ) ) ( IS-CRATE ?auto_14962 ) ( not ( = ?auto_14969 ?auto_14965 ) ) ( not ( = ?auto_14970 ?auto_14969 ) ) ( HOIST-AT ?auto_14968 ?auto_14969 ) ( not ( = ?auto_14967 ?auto_14968 ) ) ( not ( = ?auto_14971 ?auto_14968 ) ) ( AVAILABLE ?auto_14968 ) ( SURFACE-AT ?auto_14962 ?auto_14969 ) ( ON ?auto_14962 ?auto_14964 ) ( CLEAR ?auto_14962 ) ( not ( = ?auto_14962 ?auto_14964 ) ) ( not ( = ?auto_14963 ?auto_14964 ) ) ( not ( = ?auto_14961 ?auto_14964 ) ) ( not ( = ?auto_14966 ?auto_14964 ) ) ( TRUCK-AT ?auto_14972 ?auto_14965 ) ( SURFACE-AT ?auto_14960 ?auto_14965 ) ( CLEAR ?auto_14960 ) ( LIFTING ?auto_14967 ?auto_14961 ) ( IS-CRATE ?auto_14961 ) ( not ( = ?auto_14960 ?auto_14961 ) ) ( not ( = ?auto_14962 ?auto_14960 ) ) ( not ( = ?auto_14963 ?auto_14960 ) ) ( not ( = ?auto_14966 ?auto_14960 ) ) ( not ( = ?auto_14964 ?auto_14960 ) ) ( ON ?auto_14960 ?auto_14959 ) ( not ( = ?auto_14959 ?auto_14960 ) ) ( not ( = ?auto_14959 ?auto_14961 ) ) ( not ( = ?auto_14959 ?auto_14962 ) ) ( not ( = ?auto_14959 ?auto_14963 ) ) ( not ( = ?auto_14959 ?auto_14966 ) ) ( not ( = ?auto_14959 ?auto_14964 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14961 ?auto_14962 ?auto_14963 )
      ( MAKE-4CRATE-VERIFY ?auto_14959 ?auto_14960 ?auto_14961 ?auto_14962 ?auto_14963 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14973 - SURFACE
      ?auto_14974 - SURFACE
    )
    :vars
    (
      ?auto_14979 - HOIST
      ?auto_14976 - PLACE
      ?auto_14985 - SURFACE
      ?auto_14982 - PLACE
      ?auto_14983 - HOIST
      ?auto_14977 - SURFACE
      ?auto_14981 - PLACE
      ?auto_14980 - HOIST
      ?auto_14975 - SURFACE
      ?auto_14984 - TRUCK
      ?auto_14978 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14979 ?auto_14976 ) ( IS-CRATE ?auto_14974 ) ( not ( = ?auto_14973 ?auto_14974 ) ) ( not ( = ?auto_14985 ?auto_14973 ) ) ( not ( = ?auto_14985 ?auto_14974 ) ) ( not ( = ?auto_14982 ?auto_14976 ) ) ( HOIST-AT ?auto_14983 ?auto_14982 ) ( not ( = ?auto_14979 ?auto_14983 ) ) ( AVAILABLE ?auto_14983 ) ( SURFACE-AT ?auto_14974 ?auto_14982 ) ( ON ?auto_14974 ?auto_14977 ) ( CLEAR ?auto_14974 ) ( not ( = ?auto_14973 ?auto_14977 ) ) ( not ( = ?auto_14974 ?auto_14977 ) ) ( not ( = ?auto_14985 ?auto_14977 ) ) ( IS-CRATE ?auto_14973 ) ( not ( = ?auto_14981 ?auto_14976 ) ) ( not ( = ?auto_14982 ?auto_14981 ) ) ( HOIST-AT ?auto_14980 ?auto_14981 ) ( not ( = ?auto_14979 ?auto_14980 ) ) ( not ( = ?auto_14983 ?auto_14980 ) ) ( AVAILABLE ?auto_14980 ) ( SURFACE-AT ?auto_14973 ?auto_14981 ) ( ON ?auto_14973 ?auto_14975 ) ( CLEAR ?auto_14973 ) ( not ( = ?auto_14973 ?auto_14975 ) ) ( not ( = ?auto_14974 ?auto_14975 ) ) ( not ( = ?auto_14985 ?auto_14975 ) ) ( not ( = ?auto_14977 ?auto_14975 ) ) ( TRUCK-AT ?auto_14984 ?auto_14976 ) ( SURFACE-AT ?auto_14978 ?auto_14976 ) ( CLEAR ?auto_14978 ) ( IS-CRATE ?auto_14985 ) ( not ( = ?auto_14978 ?auto_14985 ) ) ( not ( = ?auto_14973 ?auto_14978 ) ) ( not ( = ?auto_14974 ?auto_14978 ) ) ( not ( = ?auto_14977 ?auto_14978 ) ) ( not ( = ?auto_14975 ?auto_14978 ) ) ( AVAILABLE ?auto_14979 ) ( IN ?auto_14985 ?auto_14984 ) )
    :subtasks
    ( ( !UNLOAD ?auto_14979 ?auto_14985 ?auto_14984 ?auto_14976 )
      ( MAKE-2CRATE ?auto_14985 ?auto_14973 ?auto_14974 )
      ( MAKE-1CRATE-VERIFY ?auto_14973 ?auto_14974 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14986 - SURFACE
      ?auto_14987 - SURFACE
      ?auto_14988 - SURFACE
    )
    :vars
    (
      ?auto_14996 - HOIST
      ?auto_14989 - PLACE
      ?auto_14992 - PLACE
      ?auto_14997 - HOIST
      ?auto_14998 - SURFACE
      ?auto_14990 - PLACE
      ?auto_14995 - HOIST
      ?auto_14994 - SURFACE
      ?auto_14993 - TRUCK
      ?auto_14991 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14996 ?auto_14989 ) ( IS-CRATE ?auto_14988 ) ( not ( = ?auto_14987 ?auto_14988 ) ) ( not ( = ?auto_14986 ?auto_14987 ) ) ( not ( = ?auto_14986 ?auto_14988 ) ) ( not ( = ?auto_14992 ?auto_14989 ) ) ( HOIST-AT ?auto_14997 ?auto_14992 ) ( not ( = ?auto_14996 ?auto_14997 ) ) ( AVAILABLE ?auto_14997 ) ( SURFACE-AT ?auto_14988 ?auto_14992 ) ( ON ?auto_14988 ?auto_14998 ) ( CLEAR ?auto_14988 ) ( not ( = ?auto_14987 ?auto_14998 ) ) ( not ( = ?auto_14988 ?auto_14998 ) ) ( not ( = ?auto_14986 ?auto_14998 ) ) ( IS-CRATE ?auto_14987 ) ( not ( = ?auto_14990 ?auto_14989 ) ) ( not ( = ?auto_14992 ?auto_14990 ) ) ( HOIST-AT ?auto_14995 ?auto_14990 ) ( not ( = ?auto_14996 ?auto_14995 ) ) ( not ( = ?auto_14997 ?auto_14995 ) ) ( AVAILABLE ?auto_14995 ) ( SURFACE-AT ?auto_14987 ?auto_14990 ) ( ON ?auto_14987 ?auto_14994 ) ( CLEAR ?auto_14987 ) ( not ( = ?auto_14987 ?auto_14994 ) ) ( not ( = ?auto_14988 ?auto_14994 ) ) ( not ( = ?auto_14986 ?auto_14994 ) ) ( not ( = ?auto_14998 ?auto_14994 ) ) ( TRUCK-AT ?auto_14993 ?auto_14989 ) ( SURFACE-AT ?auto_14991 ?auto_14989 ) ( CLEAR ?auto_14991 ) ( IS-CRATE ?auto_14986 ) ( not ( = ?auto_14991 ?auto_14986 ) ) ( not ( = ?auto_14987 ?auto_14991 ) ) ( not ( = ?auto_14988 ?auto_14991 ) ) ( not ( = ?auto_14998 ?auto_14991 ) ) ( not ( = ?auto_14994 ?auto_14991 ) ) ( AVAILABLE ?auto_14996 ) ( IN ?auto_14986 ?auto_14993 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14987 ?auto_14988 )
      ( MAKE-2CRATE-VERIFY ?auto_14986 ?auto_14987 ?auto_14988 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14999 - SURFACE
      ?auto_15000 - SURFACE
      ?auto_15001 - SURFACE
      ?auto_15002 - SURFACE
    )
    :vars
    (
      ?auto_15003 - HOIST
      ?auto_15011 - PLACE
      ?auto_15006 - PLACE
      ?auto_15008 - HOIST
      ?auto_15010 - SURFACE
      ?auto_15009 - PLACE
      ?auto_15007 - HOIST
      ?auto_15004 - SURFACE
      ?auto_15005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15003 ?auto_15011 ) ( IS-CRATE ?auto_15002 ) ( not ( = ?auto_15001 ?auto_15002 ) ) ( not ( = ?auto_15000 ?auto_15001 ) ) ( not ( = ?auto_15000 ?auto_15002 ) ) ( not ( = ?auto_15006 ?auto_15011 ) ) ( HOIST-AT ?auto_15008 ?auto_15006 ) ( not ( = ?auto_15003 ?auto_15008 ) ) ( AVAILABLE ?auto_15008 ) ( SURFACE-AT ?auto_15002 ?auto_15006 ) ( ON ?auto_15002 ?auto_15010 ) ( CLEAR ?auto_15002 ) ( not ( = ?auto_15001 ?auto_15010 ) ) ( not ( = ?auto_15002 ?auto_15010 ) ) ( not ( = ?auto_15000 ?auto_15010 ) ) ( IS-CRATE ?auto_15001 ) ( not ( = ?auto_15009 ?auto_15011 ) ) ( not ( = ?auto_15006 ?auto_15009 ) ) ( HOIST-AT ?auto_15007 ?auto_15009 ) ( not ( = ?auto_15003 ?auto_15007 ) ) ( not ( = ?auto_15008 ?auto_15007 ) ) ( AVAILABLE ?auto_15007 ) ( SURFACE-AT ?auto_15001 ?auto_15009 ) ( ON ?auto_15001 ?auto_15004 ) ( CLEAR ?auto_15001 ) ( not ( = ?auto_15001 ?auto_15004 ) ) ( not ( = ?auto_15002 ?auto_15004 ) ) ( not ( = ?auto_15000 ?auto_15004 ) ) ( not ( = ?auto_15010 ?auto_15004 ) ) ( TRUCK-AT ?auto_15005 ?auto_15011 ) ( SURFACE-AT ?auto_14999 ?auto_15011 ) ( CLEAR ?auto_14999 ) ( IS-CRATE ?auto_15000 ) ( not ( = ?auto_14999 ?auto_15000 ) ) ( not ( = ?auto_15001 ?auto_14999 ) ) ( not ( = ?auto_15002 ?auto_14999 ) ) ( not ( = ?auto_15010 ?auto_14999 ) ) ( not ( = ?auto_15004 ?auto_14999 ) ) ( AVAILABLE ?auto_15003 ) ( IN ?auto_15000 ?auto_15005 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15000 ?auto_15001 ?auto_15002 )
      ( MAKE-3CRATE-VERIFY ?auto_14999 ?auto_15000 ?auto_15001 ?auto_15002 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15012 - SURFACE
      ?auto_15013 - SURFACE
      ?auto_15014 - SURFACE
      ?auto_15015 - SURFACE
      ?auto_15016 - SURFACE
    )
    :vars
    (
      ?auto_15017 - HOIST
      ?auto_15025 - PLACE
      ?auto_15020 - PLACE
      ?auto_15022 - HOIST
      ?auto_15024 - SURFACE
      ?auto_15023 - PLACE
      ?auto_15021 - HOIST
      ?auto_15018 - SURFACE
      ?auto_15019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15017 ?auto_15025 ) ( IS-CRATE ?auto_15016 ) ( not ( = ?auto_15015 ?auto_15016 ) ) ( not ( = ?auto_15014 ?auto_15015 ) ) ( not ( = ?auto_15014 ?auto_15016 ) ) ( not ( = ?auto_15020 ?auto_15025 ) ) ( HOIST-AT ?auto_15022 ?auto_15020 ) ( not ( = ?auto_15017 ?auto_15022 ) ) ( AVAILABLE ?auto_15022 ) ( SURFACE-AT ?auto_15016 ?auto_15020 ) ( ON ?auto_15016 ?auto_15024 ) ( CLEAR ?auto_15016 ) ( not ( = ?auto_15015 ?auto_15024 ) ) ( not ( = ?auto_15016 ?auto_15024 ) ) ( not ( = ?auto_15014 ?auto_15024 ) ) ( IS-CRATE ?auto_15015 ) ( not ( = ?auto_15023 ?auto_15025 ) ) ( not ( = ?auto_15020 ?auto_15023 ) ) ( HOIST-AT ?auto_15021 ?auto_15023 ) ( not ( = ?auto_15017 ?auto_15021 ) ) ( not ( = ?auto_15022 ?auto_15021 ) ) ( AVAILABLE ?auto_15021 ) ( SURFACE-AT ?auto_15015 ?auto_15023 ) ( ON ?auto_15015 ?auto_15018 ) ( CLEAR ?auto_15015 ) ( not ( = ?auto_15015 ?auto_15018 ) ) ( not ( = ?auto_15016 ?auto_15018 ) ) ( not ( = ?auto_15014 ?auto_15018 ) ) ( not ( = ?auto_15024 ?auto_15018 ) ) ( TRUCK-AT ?auto_15019 ?auto_15025 ) ( SURFACE-AT ?auto_15013 ?auto_15025 ) ( CLEAR ?auto_15013 ) ( IS-CRATE ?auto_15014 ) ( not ( = ?auto_15013 ?auto_15014 ) ) ( not ( = ?auto_15015 ?auto_15013 ) ) ( not ( = ?auto_15016 ?auto_15013 ) ) ( not ( = ?auto_15024 ?auto_15013 ) ) ( not ( = ?auto_15018 ?auto_15013 ) ) ( AVAILABLE ?auto_15017 ) ( IN ?auto_15014 ?auto_15019 ) ( ON ?auto_15013 ?auto_15012 ) ( not ( = ?auto_15012 ?auto_15013 ) ) ( not ( = ?auto_15012 ?auto_15014 ) ) ( not ( = ?auto_15012 ?auto_15015 ) ) ( not ( = ?auto_15012 ?auto_15016 ) ) ( not ( = ?auto_15012 ?auto_15024 ) ) ( not ( = ?auto_15012 ?auto_15018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15014 ?auto_15015 ?auto_15016 )
      ( MAKE-4CRATE-VERIFY ?auto_15012 ?auto_15013 ?auto_15014 ?auto_15015 ?auto_15016 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15026 - SURFACE
      ?auto_15027 - SURFACE
    )
    :vars
    (
      ?auto_15028 - HOIST
      ?auto_15038 - PLACE
      ?auto_15030 - SURFACE
      ?auto_15032 - PLACE
      ?auto_15035 - HOIST
      ?auto_15037 - SURFACE
      ?auto_15036 - PLACE
      ?auto_15033 - HOIST
      ?auto_15029 - SURFACE
      ?auto_15034 - SURFACE
      ?auto_15031 - TRUCK
      ?auto_15039 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15028 ?auto_15038 ) ( IS-CRATE ?auto_15027 ) ( not ( = ?auto_15026 ?auto_15027 ) ) ( not ( = ?auto_15030 ?auto_15026 ) ) ( not ( = ?auto_15030 ?auto_15027 ) ) ( not ( = ?auto_15032 ?auto_15038 ) ) ( HOIST-AT ?auto_15035 ?auto_15032 ) ( not ( = ?auto_15028 ?auto_15035 ) ) ( AVAILABLE ?auto_15035 ) ( SURFACE-AT ?auto_15027 ?auto_15032 ) ( ON ?auto_15027 ?auto_15037 ) ( CLEAR ?auto_15027 ) ( not ( = ?auto_15026 ?auto_15037 ) ) ( not ( = ?auto_15027 ?auto_15037 ) ) ( not ( = ?auto_15030 ?auto_15037 ) ) ( IS-CRATE ?auto_15026 ) ( not ( = ?auto_15036 ?auto_15038 ) ) ( not ( = ?auto_15032 ?auto_15036 ) ) ( HOIST-AT ?auto_15033 ?auto_15036 ) ( not ( = ?auto_15028 ?auto_15033 ) ) ( not ( = ?auto_15035 ?auto_15033 ) ) ( AVAILABLE ?auto_15033 ) ( SURFACE-AT ?auto_15026 ?auto_15036 ) ( ON ?auto_15026 ?auto_15029 ) ( CLEAR ?auto_15026 ) ( not ( = ?auto_15026 ?auto_15029 ) ) ( not ( = ?auto_15027 ?auto_15029 ) ) ( not ( = ?auto_15030 ?auto_15029 ) ) ( not ( = ?auto_15037 ?auto_15029 ) ) ( SURFACE-AT ?auto_15034 ?auto_15038 ) ( CLEAR ?auto_15034 ) ( IS-CRATE ?auto_15030 ) ( not ( = ?auto_15034 ?auto_15030 ) ) ( not ( = ?auto_15026 ?auto_15034 ) ) ( not ( = ?auto_15027 ?auto_15034 ) ) ( not ( = ?auto_15037 ?auto_15034 ) ) ( not ( = ?auto_15029 ?auto_15034 ) ) ( AVAILABLE ?auto_15028 ) ( IN ?auto_15030 ?auto_15031 ) ( TRUCK-AT ?auto_15031 ?auto_15039 ) ( not ( = ?auto_15039 ?auto_15038 ) ) ( not ( = ?auto_15032 ?auto_15039 ) ) ( not ( = ?auto_15036 ?auto_15039 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15031 ?auto_15039 ?auto_15038 )
      ( MAKE-2CRATE ?auto_15030 ?auto_15026 ?auto_15027 )
      ( MAKE-1CRATE-VERIFY ?auto_15026 ?auto_15027 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15040 - SURFACE
      ?auto_15041 - SURFACE
      ?auto_15042 - SURFACE
    )
    :vars
    (
      ?auto_15053 - HOIST
      ?auto_15052 - PLACE
      ?auto_15050 - PLACE
      ?auto_15047 - HOIST
      ?auto_15051 - SURFACE
      ?auto_15046 - PLACE
      ?auto_15048 - HOIST
      ?auto_15043 - SURFACE
      ?auto_15049 - SURFACE
      ?auto_15044 - TRUCK
      ?auto_15045 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15053 ?auto_15052 ) ( IS-CRATE ?auto_15042 ) ( not ( = ?auto_15041 ?auto_15042 ) ) ( not ( = ?auto_15040 ?auto_15041 ) ) ( not ( = ?auto_15040 ?auto_15042 ) ) ( not ( = ?auto_15050 ?auto_15052 ) ) ( HOIST-AT ?auto_15047 ?auto_15050 ) ( not ( = ?auto_15053 ?auto_15047 ) ) ( AVAILABLE ?auto_15047 ) ( SURFACE-AT ?auto_15042 ?auto_15050 ) ( ON ?auto_15042 ?auto_15051 ) ( CLEAR ?auto_15042 ) ( not ( = ?auto_15041 ?auto_15051 ) ) ( not ( = ?auto_15042 ?auto_15051 ) ) ( not ( = ?auto_15040 ?auto_15051 ) ) ( IS-CRATE ?auto_15041 ) ( not ( = ?auto_15046 ?auto_15052 ) ) ( not ( = ?auto_15050 ?auto_15046 ) ) ( HOIST-AT ?auto_15048 ?auto_15046 ) ( not ( = ?auto_15053 ?auto_15048 ) ) ( not ( = ?auto_15047 ?auto_15048 ) ) ( AVAILABLE ?auto_15048 ) ( SURFACE-AT ?auto_15041 ?auto_15046 ) ( ON ?auto_15041 ?auto_15043 ) ( CLEAR ?auto_15041 ) ( not ( = ?auto_15041 ?auto_15043 ) ) ( not ( = ?auto_15042 ?auto_15043 ) ) ( not ( = ?auto_15040 ?auto_15043 ) ) ( not ( = ?auto_15051 ?auto_15043 ) ) ( SURFACE-AT ?auto_15049 ?auto_15052 ) ( CLEAR ?auto_15049 ) ( IS-CRATE ?auto_15040 ) ( not ( = ?auto_15049 ?auto_15040 ) ) ( not ( = ?auto_15041 ?auto_15049 ) ) ( not ( = ?auto_15042 ?auto_15049 ) ) ( not ( = ?auto_15051 ?auto_15049 ) ) ( not ( = ?auto_15043 ?auto_15049 ) ) ( AVAILABLE ?auto_15053 ) ( IN ?auto_15040 ?auto_15044 ) ( TRUCK-AT ?auto_15044 ?auto_15045 ) ( not ( = ?auto_15045 ?auto_15052 ) ) ( not ( = ?auto_15050 ?auto_15045 ) ) ( not ( = ?auto_15046 ?auto_15045 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15041 ?auto_15042 )
      ( MAKE-2CRATE-VERIFY ?auto_15040 ?auto_15041 ?auto_15042 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15054 - SURFACE
      ?auto_15055 - SURFACE
      ?auto_15056 - SURFACE
      ?auto_15057 - SURFACE
    )
    :vars
    (
      ?auto_15064 - HOIST
      ?auto_15061 - PLACE
      ?auto_15060 - PLACE
      ?auto_15066 - HOIST
      ?auto_15063 - SURFACE
      ?auto_15065 - PLACE
      ?auto_15067 - HOIST
      ?auto_15062 - SURFACE
      ?auto_15058 - TRUCK
      ?auto_15059 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15064 ?auto_15061 ) ( IS-CRATE ?auto_15057 ) ( not ( = ?auto_15056 ?auto_15057 ) ) ( not ( = ?auto_15055 ?auto_15056 ) ) ( not ( = ?auto_15055 ?auto_15057 ) ) ( not ( = ?auto_15060 ?auto_15061 ) ) ( HOIST-AT ?auto_15066 ?auto_15060 ) ( not ( = ?auto_15064 ?auto_15066 ) ) ( AVAILABLE ?auto_15066 ) ( SURFACE-AT ?auto_15057 ?auto_15060 ) ( ON ?auto_15057 ?auto_15063 ) ( CLEAR ?auto_15057 ) ( not ( = ?auto_15056 ?auto_15063 ) ) ( not ( = ?auto_15057 ?auto_15063 ) ) ( not ( = ?auto_15055 ?auto_15063 ) ) ( IS-CRATE ?auto_15056 ) ( not ( = ?auto_15065 ?auto_15061 ) ) ( not ( = ?auto_15060 ?auto_15065 ) ) ( HOIST-AT ?auto_15067 ?auto_15065 ) ( not ( = ?auto_15064 ?auto_15067 ) ) ( not ( = ?auto_15066 ?auto_15067 ) ) ( AVAILABLE ?auto_15067 ) ( SURFACE-AT ?auto_15056 ?auto_15065 ) ( ON ?auto_15056 ?auto_15062 ) ( CLEAR ?auto_15056 ) ( not ( = ?auto_15056 ?auto_15062 ) ) ( not ( = ?auto_15057 ?auto_15062 ) ) ( not ( = ?auto_15055 ?auto_15062 ) ) ( not ( = ?auto_15063 ?auto_15062 ) ) ( SURFACE-AT ?auto_15054 ?auto_15061 ) ( CLEAR ?auto_15054 ) ( IS-CRATE ?auto_15055 ) ( not ( = ?auto_15054 ?auto_15055 ) ) ( not ( = ?auto_15056 ?auto_15054 ) ) ( not ( = ?auto_15057 ?auto_15054 ) ) ( not ( = ?auto_15063 ?auto_15054 ) ) ( not ( = ?auto_15062 ?auto_15054 ) ) ( AVAILABLE ?auto_15064 ) ( IN ?auto_15055 ?auto_15058 ) ( TRUCK-AT ?auto_15058 ?auto_15059 ) ( not ( = ?auto_15059 ?auto_15061 ) ) ( not ( = ?auto_15060 ?auto_15059 ) ) ( not ( = ?auto_15065 ?auto_15059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15055 ?auto_15056 ?auto_15057 )
      ( MAKE-3CRATE-VERIFY ?auto_15054 ?auto_15055 ?auto_15056 ?auto_15057 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15068 - SURFACE
      ?auto_15069 - SURFACE
      ?auto_15070 - SURFACE
      ?auto_15071 - SURFACE
      ?auto_15072 - SURFACE
    )
    :vars
    (
      ?auto_15079 - HOIST
      ?auto_15076 - PLACE
      ?auto_15075 - PLACE
      ?auto_15081 - HOIST
      ?auto_15078 - SURFACE
      ?auto_15080 - PLACE
      ?auto_15082 - HOIST
      ?auto_15077 - SURFACE
      ?auto_15073 - TRUCK
      ?auto_15074 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15079 ?auto_15076 ) ( IS-CRATE ?auto_15072 ) ( not ( = ?auto_15071 ?auto_15072 ) ) ( not ( = ?auto_15070 ?auto_15071 ) ) ( not ( = ?auto_15070 ?auto_15072 ) ) ( not ( = ?auto_15075 ?auto_15076 ) ) ( HOIST-AT ?auto_15081 ?auto_15075 ) ( not ( = ?auto_15079 ?auto_15081 ) ) ( AVAILABLE ?auto_15081 ) ( SURFACE-AT ?auto_15072 ?auto_15075 ) ( ON ?auto_15072 ?auto_15078 ) ( CLEAR ?auto_15072 ) ( not ( = ?auto_15071 ?auto_15078 ) ) ( not ( = ?auto_15072 ?auto_15078 ) ) ( not ( = ?auto_15070 ?auto_15078 ) ) ( IS-CRATE ?auto_15071 ) ( not ( = ?auto_15080 ?auto_15076 ) ) ( not ( = ?auto_15075 ?auto_15080 ) ) ( HOIST-AT ?auto_15082 ?auto_15080 ) ( not ( = ?auto_15079 ?auto_15082 ) ) ( not ( = ?auto_15081 ?auto_15082 ) ) ( AVAILABLE ?auto_15082 ) ( SURFACE-AT ?auto_15071 ?auto_15080 ) ( ON ?auto_15071 ?auto_15077 ) ( CLEAR ?auto_15071 ) ( not ( = ?auto_15071 ?auto_15077 ) ) ( not ( = ?auto_15072 ?auto_15077 ) ) ( not ( = ?auto_15070 ?auto_15077 ) ) ( not ( = ?auto_15078 ?auto_15077 ) ) ( SURFACE-AT ?auto_15069 ?auto_15076 ) ( CLEAR ?auto_15069 ) ( IS-CRATE ?auto_15070 ) ( not ( = ?auto_15069 ?auto_15070 ) ) ( not ( = ?auto_15071 ?auto_15069 ) ) ( not ( = ?auto_15072 ?auto_15069 ) ) ( not ( = ?auto_15078 ?auto_15069 ) ) ( not ( = ?auto_15077 ?auto_15069 ) ) ( AVAILABLE ?auto_15079 ) ( IN ?auto_15070 ?auto_15073 ) ( TRUCK-AT ?auto_15073 ?auto_15074 ) ( not ( = ?auto_15074 ?auto_15076 ) ) ( not ( = ?auto_15075 ?auto_15074 ) ) ( not ( = ?auto_15080 ?auto_15074 ) ) ( ON ?auto_15069 ?auto_15068 ) ( not ( = ?auto_15068 ?auto_15069 ) ) ( not ( = ?auto_15068 ?auto_15070 ) ) ( not ( = ?auto_15068 ?auto_15071 ) ) ( not ( = ?auto_15068 ?auto_15072 ) ) ( not ( = ?auto_15068 ?auto_15078 ) ) ( not ( = ?auto_15068 ?auto_15077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15070 ?auto_15071 ?auto_15072 )
      ( MAKE-4CRATE-VERIFY ?auto_15068 ?auto_15069 ?auto_15070 ?auto_15071 ?auto_15072 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15083 - SURFACE
      ?auto_15084 - SURFACE
    )
    :vars
    (
      ?auto_15091 - HOIST
      ?auto_15088 - PLACE
      ?auto_15096 - SURFACE
      ?auto_15087 - PLACE
      ?auto_15093 - HOIST
      ?auto_15090 - SURFACE
      ?auto_15092 - PLACE
      ?auto_15095 - HOIST
      ?auto_15089 - SURFACE
      ?auto_15094 - SURFACE
      ?auto_15085 - TRUCK
      ?auto_15086 - PLACE
      ?auto_15097 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15091 ?auto_15088 ) ( IS-CRATE ?auto_15084 ) ( not ( = ?auto_15083 ?auto_15084 ) ) ( not ( = ?auto_15096 ?auto_15083 ) ) ( not ( = ?auto_15096 ?auto_15084 ) ) ( not ( = ?auto_15087 ?auto_15088 ) ) ( HOIST-AT ?auto_15093 ?auto_15087 ) ( not ( = ?auto_15091 ?auto_15093 ) ) ( AVAILABLE ?auto_15093 ) ( SURFACE-AT ?auto_15084 ?auto_15087 ) ( ON ?auto_15084 ?auto_15090 ) ( CLEAR ?auto_15084 ) ( not ( = ?auto_15083 ?auto_15090 ) ) ( not ( = ?auto_15084 ?auto_15090 ) ) ( not ( = ?auto_15096 ?auto_15090 ) ) ( IS-CRATE ?auto_15083 ) ( not ( = ?auto_15092 ?auto_15088 ) ) ( not ( = ?auto_15087 ?auto_15092 ) ) ( HOIST-AT ?auto_15095 ?auto_15092 ) ( not ( = ?auto_15091 ?auto_15095 ) ) ( not ( = ?auto_15093 ?auto_15095 ) ) ( AVAILABLE ?auto_15095 ) ( SURFACE-AT ?auto_15083 ?auto_15092 ) ( ON ?auto_15083 ?auto_15089 ) ( CLEAR ?auto_15083 ) ( not ( = ?auto_15083 ?auto_15089 ) ) ( not ( = ?auto_15084 ?auto_15089 ) ) ( not ( = ?auto_15096 ?auto_15089 ) ) ( not ( = ?auto_15090 ?auto_15089 ) ) ( SURFACE-AT ?auto_15094 ?auto_15088 ) ( CLEAR ?auto_15094 ) ( IS-CRATE ?auto_15096 ) ( not ( = ?auto_15094 ?auto_15096 ) ) ( not ( = ?auto_15083 ?auto_15094 ) ) ( not ( = ?auto_15084 ?auto_15094 ) ) ( not ( = ?auto_15090 ?auto_15094 ) ) ( not ( = ?auto_15089 ?auto_15094 ) ) ( AVAILABLE ?auto_15091 ) ( TRUCK-AT ?auto_15085 ?auto_15086 ) ( not ( = ?auto_15086 ?auto_15088 ) ) ( not ( = ?auto_15087 ?auto_15086 ) ) ( not ( = ?auto_15092 ?auto_15086 ) ) ( HOIST-AT ?auto_15097 ?auto_15086 ) ( LIFTING ?auto_15097 ?auto_15096 ) ( not ( = ?auto_15091 ?auto_15097 ) ) ( not ( = ?auto_15093 ?auto_15097 ) ) ( not ( = ?auto_15095 ?auto_15097 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15097 ?auto_15096 ?auto_15085 ?auto_15086 )
      ( MAKE-2CRATE ?auto_15096 ?auto_15083 ?auto_15084 )
      ( MAKE-1CRATE-VERIFY ?auto_15083 ?auto_15084 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15098 - SURFACE
      ?auto_15099 - SURFACE
      ?auto_15100 - SURFACE
    )
    :vars
    (
      ?auto_15101 - HOIST
      ?auto_15112 - PLACE
      ?auto_15105 - PLACE
      ?auto_15110 - HOIST
      ?auto_15111 - SURFACE
      ?auto_15104 - PLACE
      ?auto_15108 - HOIST
      ?auto_15107 - SURFACE
      ?auto_15109 - SURFACE
      ?auto_15106 - TRUCK
      ?auto_15103 - PLACE
      ?auto_15102 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15101 ?auto_15112 ) ( IS-CRATE ?auto_15100 ) ( not ( = ?auto_15099 ?auto_15100 ) ) ( not ( = ?auto_15098 ?auto_15099 ) ) ( not ( = ?auto_15098 ?auto_15100 ) ) ( not ( = ?auto_15105 ?auto_15112 ) ) ( HOIST-AT ?auto_15110 ?auto_15105 ) ( not ( = ?auto_15101 ?auto_15110 ) ) ( AVAILABLE ?auto_15110 ) ( SURFACE-AT ?auto_15100 ?auto_15105 ) ( ON ?auto_15100 ?auto_15111 ) ( CLEAR ?auto_15100 ) ( not ( = ?auto_15099 ?auto_15111 ) ) ( not ( = ?auto_15100 ?auto_15111 ) ) ( not ( = ?auto_15098 ?auto_15111 ) ) ( IS-CRATE ?auto_15099 ) ( not ( = ?auto_15104 ?auto_15112 ) ) ( not ( = ?auto_15105 ?auto_15104 ) ) ( HOIST-AT ?auto_15108 ?auto_15104 ) ( not ( = ?auto_15101 ?auto_15108 ) ) ( not ( = ?auto_15110 ?auto_15108 ) ) ( AVAILABLE ?auto_15108 ) ( SURFACE-AT ?auto_15099 ?auto_15104 ) ( ON ?auto_15099 ?auto_15107 ) ( CLEAR ?auto_15099 ) ( not ( = ?auto_15099 ?auto_15107 ) ) ( not ( = ?auto_15100 ?auto_15107 ) ) ( not ( = ?auto_15098 ?auto_15107 ) ) ( not ( = ?auto_15111 ?auto_15107 ) ) ( SURFACE-AT ?auto_15109 ?auto_15112 ) ( CLEAR ?auto_15109 ) ( IS-CRATE ?auto_15098 ) ( not ( = ?auto_15109 ?auto_15098 ) ) ( not ( = ?auto_15099 ?auto_15109 ) ) ( not ( = ?auto_15100 ?auto_15109 ) ) ( not ( = ?auto_15111 ?auto_15109 ) ) ( not ( = ?auto_15107 ?auto_15109 ) ) ( AVAILABLE ?auto_15101 ) ( TRUCK-AT ?auto_15106 ?auto_15103 ) ( not ( = ?auto_15103 ?auto_15112 ) ) ( not ( = ?auto_15105 ?auto_15103 ) ) ( not ( = ?auto_15104 ?auto_15103 ) ) ( HOIST-AT ?auto_15102 ?auto_15103 ) ( LIFTING ?auto_15102 ?auto_15098 ) ( not ( = ?auto_15101 ?auto_15102 ) ) ( not ( = ?auto_15110 ?auto_15102 ) ) ( not ( = ?auto_15108 ?auto_15102 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15099 ?auto_15100 )
      ( MAKE-2CRATE-VERIFY ?auto_15098 ?auto_15099 ?auto_15100 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15113 - SURFACE
      ?auto_15114 - SURFACE
      ?auto_15115 - SURFACE
      ?auto_15116 - SURFACE
    )
    :vars
    (
      ?auto_15126 - HOIST
      ?auto_15120 - PLACE
      ?auto_15117 - PLACE
      ?auto_15125 - HOIST
      ?auto_15118 - SURFACE
      ?auto_15122 - PLACE
      ?auto_15119 - HOIST
      ?auto_15124 - SURFACE
      ?auto_15121 - TRUCK
      ?auto_15127 - PLACE
      ?auto_15123 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15126 ?auto_15120 ) ( IS-CRATE ?auto_15116 ) ( not ( = ?auto_15115 ?auto_15116 ) ) ( not ( = ?auto_15114 ?auto_15115 ) ) ( not ( = ?auto_15114 ?auto_15116 ) ) ( not ( = ?auto_15117 ?auto_15120 ) ) ( HOIST-AT ?auto_15125 ?auto_15117 ) ( not ( = ?auto_15126 ?auto_15125 ) ) ( AVAILABLE ?auto_15125 ) ( SURFACE-AT ?auto_15116 ?auto_15117 ) ( ON ?auto_15116 ?auto_15118 ) ( CLEAR ?auto_15116 ) ( not ( = ?auto_15115 ?auto_15118 ) ) ( not ( = ?auto_15116 ?auto_15118 ) ) ( not ( = ?auto_15114 ?auto_15118 ) ) ( IS-CRATE ?auto_15115 ) ( not ( = ?auto_15122 ?auto_15120 ) ) ( not ( = ?auto_15117 ?auto_15122 ) ) ( HOIST-AT ?auto_15119 ?auto_15122 ) ( not ( = ?auto_15126 ?auto_15119 ) ) ( not ( = ?auto_15125 ?auto_15119 ) ) ( AVAILABLE ?auto_15119 ) ( SURFACE-AT ?auto_15115 ?auto_15122 ) ( ON ?auto_15115 ?auto_15124 ) ( CLEAR ?auto_15115 ) ( not ( = ?auto_15115 ?auto_15124 ) ) ( not ( = ?auto_15116 ?auto_15124 ) ) ( not ( = ?auto_15114 ?auto_15124 ) ) ( not ( = ?auto_15118 ?auto_15124 ) ) ( SURFACE-AT ?auto_15113 ?auto_15120 ) ( CLEAR ?auto_15113 ) ( IS-CRATE ?auto_15114 ) ( not ( = ?auto_15113 ?auto_15114 ) ) ( not ( = ?auto_15115 ?auto_15113 ) ) ( not ( = ?auto_15116 ?auto_15113 ) ) ( not ( = ?auto_15118 ?auto_15113 ) ) ( not ( = ?auto_15124 ?auto_15113 ) ) ( AVAILABLE ?auto_15126 ) ( TRUCK-AT ?auto_15121 ?auto_15127 ) ( not ( = ?auto_15127 ?auto_15120 ) ) ( not ( = ?auto_15117 ?auto_15127 ) ) ( not ( = ?auto_15122 ?auto_15127 ) ) ( HOIST-AT ?auto_15123 ?auto_15127 ) ( LIFTING ?auto_15123 ?auto_15114 ) ( not ( = ?auto_15126 ?auto_15123 ) ) ( not ( = ?auto_15125 ?auto_15123 ) ) ( not ( = ?auto_15119 ?auto_15123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15114 ?auto_15115 ?auto_15116 )
      ( MAKE-3CRATE-VERIFY ?auto_15113 ?auto_15114 ?auto_15115 ?auto_15116 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15128 - SURFACE
      ?auto_15129 - SURFACE
      ?auto_15130 - SURFACE
      ?auto_15131 - SURFACE
      ?auto_15132 - SURFACE
    )
    :vars
    (
      ?auto_15142 - HOIST
      ?auto_15136 - PLACE
      ?auto_15133 - PLACE
      ?auto_15141 - HOIST
      ?auto_15134 - SURFACE
      ?auto_15138 - PLACE
      ?auto_15135 - HOIST
      ?auto_15140 - SURFACE
      ?auto_15137 - TRUCK
      ?auto_15143 - PLACE
      ?auto_15139 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15142 ?auto_15136 ) ( IS-CRATE ?auto_15132 ) ( not ( = ?auto_15131 ?auto_15132 ) ) ( not ( = ?auto_15130 ?auto_15131 ) ) ( not ( = ?auto_15130 ?auto_15132 ) ) ( not ( = ?auto_15133 ?auto_15136 ) ) ( HOIST-AT ?auto_15141 ?auto_15133 ) ( not ( = ?auto_15142 ?auto_15141 ) ) ( AVAILABLE ?auto_15141 ) ( SURFACE-AT ?auto_15132 ?auto_15133 ) ( ON ?auto_15132 ?auto_15134 ) ( CLEAR ?auto_15132 ) ( not ( = ?auto_15131 ?auto_15134 ) ) ( not ( = ?auto_15132 ?auto_15134 ) ) ( not ( = ?auto_15130 ?auto_15134 ) ) ( IS-CRATE ?auto_15131 ) ( not ( = ?auto_15138 ?auto_15136 ) ) ( not ( = ?auto_15133 ?auto_15138 ) ) ( HOIST-AT ?auto_15135 ?auto_15138 ) ( not ( = ?auto_15142 ?auto_15135 ) ) ( not ( = ?auto_15141 ?auto_15135 ) ) ( AVAILABLE ?auto_15135 ) ( SURFACE-AT ?auto_15131 ?auto_15138 ) ( ON ?auto_15131 ?auto_15140 ) ( CLEAR ?auto_15131 ) ( not ( = ?auto_15131 ?auto_15140 ) ) ( not ( = ?auto_15132 ?auto_15140 ) ) ( not ( = ?auto_15130 ?auto_15140 ) ) ( not ( = ?auto_15134 ?auto_15140 ) ) ( SURFACE-AT ?auto_15129 ?auto_15136 ) ( CLEAR ?auto_15129 ) ( IS-CRATE ?auto_15130 ) ( not ( = ?auto_15129 ?auto_15130 ) ) ( not ( = ?auto_15131 ?auto_15129 ) ) ( not ( = ?auto_15132 ?auto_15129 ) ) ( not ( = ?auto_15134 ?auto_15129 ) ) ( not ( = ?auto_15140 ?auto_15129 ) ) ( AVAILABLE ?auto_15142 ) ( TRUCK-AT ?auto_15137 ?auto_15143 ) ( not ( = ?auto_15143 ?auto_15136 ) ) ( not ( = ?auto_15133 ?auto_15143 ) ) ( not ( = ?auto_15138 ?auto_15143 ) ) ( HOIST-AT ?auto_15139 ?auto_15143 ) ( LIFTING ?auto_15139 ?auto_15130 ) ( not ( = ?auto_15142 ?auto_15139 ) ) ( not ( = ?auto_15141 ?auto_15139 ) ) ( not ( = ?auto_15135 ?auto_15139 ) ) ( ON ?auto_15129 ?auto_15128 ) ( not ( = ?auto_15128 ?auto_15129 ) ) ( not ( = ?auto_15128 ?auto_15130 ) ) ( not ( = ?auto_15128 ?auto_15131 ) ) ( not ( = ?auto_15128 ?auto_15132 ) ) ( not ( = ?auto_15128 ?auto_15134 ) ) ( not ( = ?auto_15128 ?auto_15140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15130 ?auto_15131 ?auto_15132 )
      ( MAKE-4CRATE-VERIFY ?auto_15128 ?auto_15129 ?auto_15130 ?auto_15131 ?auto_15132 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15144 - SURFACE
      ?auto_15145 - SURFACE
    )
    :vars
    (
      ?auto_15155 - HOIST
      ?auto_15149 - PLACE
      ?auto_15158 - SURFACE
      ?auto_15146 - PLACE
      ?auto_15154 - HOIST
      ?auto_15147 - SURFACE
      ?auto_15151 - PLACE
      ?auto_15148 - HOIST
      ?auto_15153 - SURFACE
      ?auto_15156 - SURFACE
      ?auto_15150 - TRUCK
      ?auto_15157 - PLACE
      ?auto_15152 - HOIST
      ?auto_15159 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15155 ?auto_15149 ) ( IS-CRATE ?auto_15145 ) ( not ( = ?auto_15144 ?auto_15145 ) ) ( not ( = ?auto_15158 ?auto_15144 ) ) ( not ( = ?auto_15158 ?auto_15145 ) ) ( not ( = ?auto_15146 ?auto_15149 ) ) ( HOIST-AT ?auto_15154 ?auto_15146 ) ( not ( = ?auto_15155 ?auto_15154 ) ) ( AVAILABLE ?auto_15154 ) ( SURFACE-AT ?auto_15145 ?auto_15146 ) ( ON ?auto_15145 ?auto_15147 ) ( CLEAR ?auto_15145 ) ( not ( = ?auto_15144 ?auto_15147 ) ) ( not ( = ?auto_15145 ?auto_15147 ) ) ( not ( = ?auto_15158 ?auto_15147 ) ) ( IS-CRATE ?auto_15144 ) ( not ( = ?auto_15151 ?auto_15149 ) ) ( not ( = ?auto_15146 ?auto_15151 ) ) ( HOIST-AT ?auto_15148 ?auto_15151 ) ( not ( = ?auto_15155 ?auto_15148 ) ) ( not ( = ?auto_15154 ?auto_15148 ) ) ( AVAILABLE ?auto_15148 ) ( SURFACE-AT ?auto_15144 ?auto_15151 ) ( ON ?auto_15144 ?auto_15153 ) ( CLEAR ?auto_15144 ) ( not ( = ?auto_15144 ?auto_15153 ) ) ( not ( = ?auto_15145 ?auto_15153 ) ) ( not ( = ?auto_15158 ?auto_15153 ) ) ( not ( = ?auto_15147 ?auto_15153 ) ) ( SURFACE-AT ?auto_15156 ?auto_15149 ) ( CLEAR ?auto_15156 ) ( IS-CRATE ?auto_15158 ) ( not ( = ?auto_15156 ?auto_15158 ) ) ( not ( = ?auto_15144 ?auto_15156 ) ) ( not ( = ?auto_15145 ?auto_15156 ) ) ( not ( = ?auto_15147 ?auto_15156 ) ) ( not ( = ?auto_15153 ?auto_15156 ) ) ( AVAILABLE ?auto_15155 ) ( TRUCK-AT ?auto_15150 ?auto_15157 ) ( not ( = ?auto_15157 ?auto_15149 ) ) ( not ( = ?auto_15146 ?auto_15157 ) ) ( not ( = ?auto_15151 ?auto_15157 ) ) ( HOIST-AT ?auto_15152 ?auto_15157 ) ( not ( = ?auto_15155 ?auto_15152 ) ) ( not ( = ?auto_15154 ?auto_15152 ) ) ( not ( = ?auto_15148 ?auto_15152 ) ) ( AVAILABLE ?auto_15152 ) ( SURFACE-AT ?auto_15158 ?auto_15157 ) ( ON ?auto_15158 ?auto_15159 ) ( CLEAR ?auto_15158 ) ( not ( = ?auto_15144 ?auto_15159 ) ) ( not ( = ?auto_15145 ?auto_15159 ) ) ( not ( = ?auto_15158 ?auto_15159 ) ) ( not ( = ?auto_15147 ?auto_15159 ) ) ( not ( = ?auto_15153 ?auto_15159 ) ) ( not ( = ?auto_15156 ?auto_15159 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15152 ?auto_15158 ?auto_15159 ?auto_15157 )
      ( MAKE-2CRATE ?auto_15158 ?auto_15144 ?auto_15145 )
      ( MAKE-1CRATE-VERIFY ?auto_15144 ?auto_15145 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15160 - SURFACE
      ?auto_15161 - SURFACE
      ?auto_15162 - SURFACE
    )
    :vars
    (
      ?auto_15174 - HOIST
      ?auto_15166 - PLACE
      ?auto_15172 - PLACE
      ?auto_15167 - HOIST
      ?auto_15165 - SURFACE
      ?auto_15169 - PLACE
      ?auto_15163 - HOIST
      ?auto_15171 - SURFACE
      ?auto_15168 - SURFACE
      ?auto_15175 - TRUCK
      ?auto_15164 - PLACE
      ?auto_15170 - HOIST
      ?auto_15173 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15174 ?auto_15166 ) ( IS-CRATE ?auto_15162 ) ( not ( = ?auto_15161 ?auto_15162 ) ) ( not ( = ?auto_15160 ?auto_15161 ) ) ( not ( = ?auto_15160 ?auto_15162 ) ) ( not ( = ?auto_15172 ?auto_15166 ) ) ( HOIST-AT ?auto_15167 ?auto_15172 ) ( not ( = ?auto_15174 ?auto_15167 ) ) ( AVAILABLE ?auto_15167 ) ( SURFACE-AT ?auto_15162 ?auto_15172 ) ( ON ?auto_15162 ?auto_15165 ) ( CLEAR ?auto_15162 ) ( not ( = ?auto_15161 ?auto_15165 ) ) ( not ( = ?auto_15162 ?auto_15165 ) ) ( not ( = ?auto_15160 ?auto_15165 ) ) ( IS-CRATE ?auto_15161 ) ( not ( = ?auto_15169 ?auto_15166 ) ) ( not ( = ?auto_15172 ?auto_15169 ) ) ( HOIST-AT ?auto_15163 ?auto_15169 ) ( not ( = ?auto_15174 ?auto_15163 ) ) ( not ( = ?auto_15167 ?auto_15163 ) ) ( AVAILABLE ?auto_15163 ) ( SURFACE-AT ?auto_15161 ?auto_15169 ) ( ON ?auto_15161 ?auto_15171 ) ( CLEAR ?auto_15161 ) ( not ( = ?auto_15161 ?auto_15171 ) ) ( not ( = ?auto_15162 ?auto_15171 ) ) ( not ( = ?auto_15160 ?auto_15171 ) ) ( not ( = ?auto_15165 ?auto_15171 ) ) ( SURFACE-AT ?auto_15168 ?auto_15166 ) ( CLEAR ?auto_15168 ) ( IS-CRATE ?auto_15160 ) ( not ( = ?auto_15168 ?auto_15160 ) ) ( not ( = ?auto_15161 ?auto_15168 ) ) ( not ( = ?auto_15162 ?auto_15168 ) ) ( not ( = ?auto_15165 ?auto_15168 ) ) ( not ( = ?auto_15171 ?auto_15168 ) ) ( AVAILABLE ?auto_15174 ) ( TRUCK-AT ?auto_15175 ?auto_15164 ) ( not ( = ?auto_15164 ?auto_15166 ) ) ( not ( = ?auto_15172 ?auto_15164 ) ) ( not ( = ?auto_15169 ?auto_15164 ) ) ( HOIST-AT ?auto_15170 ?auto_15164 ) ( not ( = ?auto_15174 ?auto_15170 ) ) ( not ( = ?auto_15167 ?auto_15170 ) ) ( not ( = ?auto_15163 ?auto_15170 ) ) ( AVAILABLE ?auto_15170 ) ( SURFACE-AT ?auto_15160 ?auto_15164 ) ( ON ?auto_15160 ?auto_15173 ) ( CLEAR ?auto_15160 ) ( not ( = ?auto_15161 ?auto_15173 ) ) ( not ( = ?auto_15162 ?auto_15173 ) ) ( not ( = ?auto_15160 ?auto_15173 ) ) ( not ( = ?auto_15165 ?auto_15173 ) ) ( not ( = ?auto_15171 ?auto_15173 ) ) ( not ( = ?auto_15168 ?auto_15173 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15161 ?auto_15162 )
      ( MAKE-2CRATE-VERIFY ?auto_15160 ?auto_15161 ?auto_15162 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15176 - SURFACE
      ?auto_15177 - SURFACE
      ?auto_15178 - SURFACE
      ?auto_15179 - SURFACE
    )
    :vars
    (
      ?auto_15190 - HOIST
      ?auto_15184 - PLACE
      ?auto_15181 - PLACE
      ?auto_15188 - HOIST
      ?auto_15187 - SURFACE
      ?auto_15180 - PLACE
      ?auto_15191 - HOIST
      ?auto_15186 - SURFACE
      ?auto_15182 - TRUCK
      ?auto_15185 - PLACE
      ?auto_15183 - HOIST
      ?auto_15189 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15190 ?auto_15184 ) ( IS-CRATE ?auto_15179 ) ( not ( = ?auto_15178 ?auto_15179 ) ) ( not ( = ?auto_15177 ?auto_15178 ) ) ( not ( = ?auto_15177 ?auto_15179 ) ) ( not ( = ?auto_15181 ?auto_15184 ) ) ( HOIST-AT ?auto_15188 ?auto_15181 ) ( not ( = ?auto_15190 ?auto_15188 ) ) ( AVAILABLE ?auto_15188 ) ( SURFACE-AT ?auto_15179 ?auto_15181 ) ( ON ?auto_15179 ?auto_15187 ) ( CLEAR ?auto_15179 ) ( not ( = ?auto_15178 ?auto_15187 ) ) ( not ( = ?auto_15179 ?auto_15187 ) ) ( not ( = ?auto_15177 ?auto_15187 ) ) ( IS-CRATE ?auto_15178 ) ( not ( = ?auto_15180 ?auto_15184 ) ) ( not ( = ?auto_15181 ?auto_15180 ) ) ( HOIST-AT ?auto_15191 ?auto_15180 ) ( not ( = ?auto_15190 ?auto_15191 ) ) ( not ( = ?auto_15188 ?auto_15191 ) ) ( AVAILABLE ?auto_15191 ) ( SURFACE-AT ?auto_15178 ?auto_15180 ) ( ON ?auto_15178 ?auto_15186 ) ( CLEAR ?auto_15178 ) ( not ( = ?auto_15178 ?auto_15186 ) ) ( not ( = ?auto_15179 ?auto_15186 ) ) ( not ( = ?auto_15177 ?auto_15186 ) ) ( not ( = ?auto_15187 ?auto_15186 ) ) ( SURFACE-AT ?auto_15176 ?auto_15184 ) ( CLEAR ?auto_15176 ) ( IS-CRATE ?auto_15177 ) ( not ( = ?auto_15176 ?auto_15177 ) ) ( not ( = ?auto_15178 ?auto_15176 ) ) ( not ( = ?auto_15179 ?auto_15176 ) ) ( not ( = ?auto_15187 ?auto_15176 ) ) ( not ( = ?auto_15186 ?auto_15176 ) ) ( AVAILABLE ?auto_15190 ) ( TRUCK-AT ?auto_15182 ?auto_15185 ) ( not ( = ?auto_15185 ?auto_15184 ) ) ( not ( = ?auto_15181 ?auto_15185 ) ) ( not ( = ?auto_15180 ?auto_15185 ) ) ( HOIST-AT ?auto_15183 ?auto_15185 ) ( not ( = ?auto_15190 ?auto_15183 ) ) ( not ( = ?auto_15188 ?auto_15183 ) ) ( not ( = ?auto_15191 ?auto_15183 ) ) ( AVAILABLE ?auto_15183 ) ( SURFACE-AT ?auto_15177 ?auto_15185 ) ( ON ?auto_15177 ?auto_15189 ) ( CLEAR ?auto_15177 ) ( not ( = ?auto_15178 ?auto_15189 ) ) ( not ( = ?auto_15179 ?auto_15189 ) ) ( not ( = ?auto_15177 ?auto_15189 ) ) ( not ( = ?auto_15187 ?auto_15189 ) ) ( not ( = ?auto_15186 ?auto_15189 ) ) ( not ( = ?auto_15176 ?auto_15189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15177 ?auto_15178 ?auto_15179 )
      ( MAKE-3CRATE-VERIFY ?auto_15176 ?auto_15177 ?auto_15178 ?auto_15179 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15192 - SURFACE
      ?auto_15193 - SURFACE
      ?auto_15194 - SURFACE
      ?auto_15195 - SURFACE
      ?auto_15196 - SURFACE
    )
    :vars
    (
      ?auto_15207 - HOIST
      ?auto_15201 - PLACE
      ?auto_15198 - PLACE
      ?auto_15205 - HOIST
      ?auto_15204 - SURFACE
      ?auto_15197 - PLACE
      ?auto_15208 - HOIST
      ?auto_15203 - SURFACE
      ?auto_15199 - TRUCK
      ?auto_15202 - PLACE
      ?auto_15200 - HOIST
      ?auto_15206 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15207 ?auto_15201 ) ( IS-CRATE ?auto_15196 ) ( not ( = ?auto_15195 ?auto_15196 ) ) ( not ( = ?auto_15194 ?auto_15195 ) ) ( not ( = ?auto_15194 ?auto_15196 ) ) ( not ( = ?auto_15198 ?auto_15201 ) ) ( HOIST-AT ?auto_15205 ?auto_15198 ) ( not ( = ?auto_15207 ?auto_15205 ) ) ( AVAILABLE ?auto_15205 ) ( SURFACE-AT ?auto_15196 ?auto_15198 ) ( ON ?auto_15196 ?auto_15204 ) ( CLEAR ?auto_15196 ) ( not ( = ?auto_15195 ?auto_15204 ) ) ( not ( = ?auto_15196 ?auto_15204 ) ) ( not ( = ?auto_15194 ?auto_15204 ) ) ( IS-CRATE ?auto_15195 ) ( not ( = ?auto_15197 ?auto_15201 ) ) ( not ( = ?auto_15198 ?auto_15197 ) ) ( HOIST-AT ?auto_15208 ?auto_15197 ) ( not ( = ?auto_15207 ?auto_15208 ) ) ( not ( = ?auto_15205 ?auto_15208 ) ) ( AVAILABLE ?auto_15208 ) ( SURFACE-AT ?auto_15195 ?auto_15197 ) ( ON ?auto_15195 ?auto_15203 ) ( CLEAR ?auto_15195 ) ( not ( = ?auto_15195 ?auto_15203 ) ) ( not ( = ?auto_15196 ?auto_15203 ) ) ( not ( = ?auto_15194 ?auto_15203 ) ) ( not ( = ?auto_15204 ?auto_15203 ) ) ( SURFACE-AT ?auto_15193 ?auto_15201 ) ( CLEAR ?auto_15193 ) ( IS-CRATE ?auto_15194 ) ( not ( = ?auto_15193 ?auto_15194 ) ) ( not ( = ?auto_15195 ?auto_15193 ) ) ( not ( = ?auto_15196 ?auto_15193 ) ) ( not ( = ?auto_15204 ?auto_15193 ) ) ( not ( = ?auto_15203 ?auto_15193 ) ) ( AVAILABLE ?auto_15207 ) ( TRUCK-AT ?auto_15199 ?auto_15202 ) ( not ( = ?auto_15202 ?auto_15201 ) ) ( not ( = ?auto_15198 ?auto_15202 ) ) ( not ( = ?auto_15197 ?auto_15202 ) ) ( HOIST-AT ?auto_15200 ?auto_15202 ) ( not ( = ?auto_15207 ?auto_15200 ) ) ( not ( = ?auto_15205 ?auto_15200 ) ) ( not ( = ?auto_15208 ?auto_15200 ) ) ( AVAILABLE ?auto_15200 ) ( SURFACE-AT ?auto_15194 ?auto_15202 ) ( ON ?auto_15194 ?auto_15206 ) ( CLEAR ?auto_15194 ) ( not ( = ?auto_15195 ?auto_15206 ) ) ( not ( = ?auto_15196 ?auto_15206 ) ) ( not ( = ?auto_15194 ?auto_15206 ) ) ( not ( = ?auto_15204 ?auto_15206 ) ) ( not ( = ?auto_15203 ?auto_15206 ) ) ( not ( = ?auto_15193 ?auto_15206 ) ) ( ON ?auto_15193 ?auto_15192 ) ( not ( = ?auto_15192 ?auto_15193 ) ) ( not ( = ?auto_15192 ?auto_15194 ) ) ( not ( = ?auto_15192 ?auto_15195 ) ) ( not ( = ?auto_15192 ?auto_15196 ) ) ( not ( = ?auto_15192 ?auto_15204 ) ) ( not ( = ?auto_15192 ?auto_15203 ) ) ( not ( = ?auto_15192 ?auto_15206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15194 ?auto_15195 ?auto_15196 )
      ( MAKE-4CRATE-VERIFY ?auto_15192 ?auto_15193 ?auto_15194 ?auto_15195 ?auto_15196 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15209 - SURFACE
      ?auto_15210 - SURFACE
    )
    :vars
    (
      ?auto_15223 - HOIST
      ?auto_15216 - PLACE
      ?auto_15213 - SURFACE
      ?auto_15212 - PLACE
      ?auto_15221 - HOIST
      ?auto_15220 - SURFACE
      ?auto_15211 - PLACE
      ?auto_15224 - HOIST
      ?auto_15219 - SURFACE
      ?auto_15217 - SURFACE
      ?auto_15218 - PLACE
      ?auto_15215 - HOIST
      ?auto_15222 - SURFACE
      ?auto_15214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15223 ?auto_15216 ) ( IS-CRATE ?auto_15210 ) ( not ( = ?auto_15209 ?auto_15210 ) ) ( not ( = ?auto_15213 ?auto_15209 ) ) ( not ( = ?auto_15213 ?auto_15210 ) ) ( not ( = ?auto_15212 ?auto_15216 ) ) ( HOIST-AT ?auto_15221 ?auto_15212 ) ( not ( = ?auto_15223 ?auto_15221 ) ) ( AVAILABLE ?auto_15221 ) ( SURFACE-AT ?auto_15210 ?auto_15212 ) ( ON ?auto_15210 ?auto_15220 ) ( CLEAR ?auto_15210 ) ( not ( = ?auto_15209 ?auto_15220 ) ) ( not ( = ?auto_15210 ?auto_15220 ) ) ( not ( = ?auto_15213 ?auto_15220 ) ) ( IS-CRATE ?auto_15209 ) ( not ( = ?auto_15211 ?auto_15216 ) ) ( not ( = ?auto_15212 ?auto_15211 ) ) ( HOIST-AT ?auto_15224 ?auto_15211 ) ( not ( = ?auto_15223 ?auto_15224 ) ) ( not ( = ?auto_15221 ?auto_15224 ) ) ( AVAILABLE ?auto_15224 ) ( SURFACE-AT ?auto_15209 ?auto_15211 ) ( ON ?auto_15209 ?auto_15219 ) ( CLEAR ?auto_15209 ) ( not ( = ?auto_15209 ?auto_15219 ) ) ( not ( = ?auto_15210 ?auto_15219 ) ) ( not ( = ?auto_15213 ?auto_15219 ) ) ( not ( = ?auto_15220 ?auto_15219 ) ) ( SURFACE-AT ?auto_15217 ?auto_15216 ) ( CLEAR ?auto_15217 ) ( IS-CRATE ?auto_15213 ) ( not ( = ?auto_15217 ?auto_15213 ) ) ( not ( = ?auto_15209 ?auto_15217 ) ) ( not ( = ?auto_15210 ?auto_15217 ) ) ( not ( = ?auto_15220 ?auto_15217 ) ) ( not ( = ?auto_15219 ?auto_15217 ) ) ( AVAILABLE ?auto_15223 ) ( not ( = ?auto_15218 ?auto_15216 ) ) ( not ( = ?auto_15212 ?auto_15218 ) ) ( not ( = ?auto_15211 ?auto_15218 ) ) ( HOIST-AT ?auto_15215 ?auto_15218 ) ( not ( = ?auto_15223 ?auto_15215 ) ) ( not ( = ?auto_15221 ?auto_15215 ) ) ( not ( = ?auto_15224 ?auto_15215 ) ) ( AVAILABLE ?auto_15215 ) ( SURFACE-AT ?auto_15213 ?auto_15218 ) ( ON ?auto_15213 ?auto_15222 ) ( CLEAR ?auto_15213 ) ( not ( = ?auto_15209 ?auto_15222 ) ) ( not ( = ?auto_15210 ?auto_15222 ) ) ( not ( = ?auto_15213 ?auto_15222 ) ) ( not ( = ?auto_15220 ?auto_15222 ) ) ( not ( = ?auto_15219 ?auto_15222 ) ) ( not ( = ?auto_15217 ?auto_15222 ) ) ( TRUCK-AT ?auto_15214 ?auto_15216 ) )
    :subtasks
    ( ( !DRIVE ?auto_15214 ?auto_15216 ?auto_15218 )
      ( MAKE-2CRATE ?auto_15213 ?auto_15209 ?auto_15210 )
      ( MAKE-1CRATE-VERIFY ?auto_15209 ?auto_15210 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15225 - SURFACE
      ?auto_15226 - SURFACE
      ?auto_15227 - SURFACE
    )
    :vars
    (
      ?auto_15233 - HOIST
      ?auto_15228 - PLACE
      ?auto_15234 - PLACE
      ?auto_15239 - HOIST
      ?auto_15232 - SURFACE
      ?auto_15229 - PLACE
      ?auto_15235 - HOIST
      ?auto_15236 - SURFACE
      ?auto_15238 - SURFACE
      ?auto_15231 - PLACE
      ?auto_15240 - HOIST
      ?auto_15230 - SURFACE
      ?auto_15237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15233 ?auto_15228 ) ( IS-CRATE ?auto_15227 ) ( not ( = ?auto_15226 ?auto_15227 ) ) ( not ( = ?auto_15225 ?auto_15226 ) ) ( not ( = ?auto_15225 ?auto_15227 ) ) ( not ( = ?auto_15234 ?auto_15228 ) ) ( HOIST-AT ?auto_15239 ?auto_15234 ) ( not ( = ?auto_15233 ?auto_15239 ) ) ( AVAILABLE ?auto_15239 ) ( SURFACE-AT ?auto_15227 ?auto_15234 ) ( ON ?auto_15227 ?auto_15232 ) ( CLEAR ?auto_15227 ) ( not ( = ?auto_15226 ?auto_15232 ) ) ( not ( = ?auto_15227 ?auto_15232 ) ) ( not ( = ?auto_15225 ?auto_15232 ) ) ( IS-CRATE ?auto_15226 ) ( not ( = ?auto_15229 ?auto_15228 ) ) ( not ( = ?auto_15234 ?auto_15229 ) ) ( HOIST-AT ?auto_15235 ?auto_15229 ) ( not ( = ?auto_15233 ?auto_15235 ) ) ( not ( = ?auto_15239 ?auto_15235 ) ) ( AVAILABLE ?auto_15235 ) ( SURFACE-AT ?auto_15226 ?auto_15229 ) ( ON ?auto_15226 ?auto_15236 ) ( CLEAR ?auto_15226 ) ( not ( = ?auto_15226 ?auto_15236 ) ) ( not ( = ?auto_15227 ?auto_15236 ) ) ( not ( = ?auto_15225 ?auto_15236 ) ) ( not ( = ?auto_15232 ?auto_15236 ) ) ( SURFACE-AT ?auto_15238 ?auto_15228 ) ( CLEAR ?auto_15238 ) ( IS-CRATE ?auto_15225 ) ( not ( = ?auto_15238 ?auto_15225 ) ) ( not ( = ?auto_15226 ?auto_15238 ) ) ( not ( = ?auto_15227 ?auto_15238 ) ) ( not ( = ?auto_15232 ?auto_15238 ) ) ( not ( = ?auto_15236 ?auto_15238 ) ) ( AVAILABLE ?auto_15233 ) ( not ( = ?auto_15231 ?auto_15228 ) ) ( not ( = ?auto_15234 ?auto_15231 ) ) ( not ( = ?auto_15229 ?auto_15231 ) ) ( HOIST-AT ?auto_15240 ?auto_15231 ) ( not ( = ?auto_15233 ?auto_15240 ) ) ( not ( = ?auto_15239 ?auto_15240 ) ) ( not ( = ?auto_15235 ?auto_15240 ) ) ( AVAILABLE ?auto_15240 ) ( SURFACE-AT ?auto_15225 ?auto_15231 ) ( ON ?auto_15225 ?auto_15230 ) ( CLEAR ?auto_15225 ) ( not ( = ?auto_15226 ?auto_15230 ) ) ( not ( = ?auto_15227 ?auto_15230 ) ) ( not ( = ?auto_15225 ?auto_15230 ) ) ( not ( = ?auto_15232 ?auto_15230 ) ) ( not ( = ?auto_15236 ?auto_15230 ) ) ( not ( = ?auto_15238 ?auto_15230 ) ) ( TRUCK-AT ?auto_15237 ?auto_15228 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15226 ?auto_15227 )
      ( MAKE-2CRATE-VERIFY ?auto_15225 ?auto_15226 ?auto_15227 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15241 - SURFACE
      ?auto_15242 - SURFACE
      ?auto_15243 - SURFACE
      ?auto_15244 - SURFACE
    )
    :vars
    (
      ?auto_15248 - HOIST
      ?auto_15252 - PLACE
      ?auto_15247 - PLACE
      ?auto_15245 - HOIST
      ?auto_15250 - SURFACE
      ?auto_15254 - PLACE
      ?auto_15256 - HOIST
      ?auto_15246 - SURFACE
      ?auto_15251 - PLACE
      ?auto_15255 - HOIST
      ?auto_15249 - SURFACE
      ?auto_15253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15248 ?auto_15252 ) ( IS-CRATE ?auto_15244 ) ( not ( = ?auto_15243 ?auto_15244 ) ) ( not ( = ?auto_15242 ?auto_15243 ) ) ( not ( = ?auto_15242 ?auto_15244 ) ) ( not ( = ?auto_15247 ?auto_15252 ) ) ( HOIST-AT ?auto_15245 ?auto_15247 ) ( not ( = ?auto_15248 ?auto_15245 ) ) ( AVAILABLE ?auto_15245 ) ( SURFACE-AT ?auto_15244 ?auto_15247 ) ( ON ?auto_15244 ?auto_15250 ) ( CLEAR ?auto_15244 ) ( not ( = ?auto_15243 ?auto_15250 ) ) ( not ( = ?auto_15244 ?auto_15250 ) ) ( not ( = ?auto_15242 ?auto_15250 ) ) ( IS-CRATE ?auto_15243 ) ( not ( = ?auto_15254 ?auto_15252 ) ) ( not ( = ?auto_15247 ?auto_15254 ) ) ( HOIST-AT ?auto_15256 ?auto_15254 ) ( not ( = ?auto_15248 ?auto_15256 ) ) ( not ( = ?auto_15245 ?auto_15256 ) ) ( AVAILABLE ?auto_15256 ) ( SURFACE-AT ?auto_15243 ?auto_15254 ) ( ON ?auto_15243 ?auto_15246 ) ( CLEAR ?auto_15243 ) ( not ( = ?auto_15243 ?auto_15246 ) ) ( not ( = ?auto_15244 ?auto_15246 ) ) ( not ( = ?auto_15242 ?auto_15246 ) ) ( not ( = ?auto_15250 ?auto_15246 ) ) ( SURFACE-AT ?auto_15241 ?auto_15252 ) ( CLEAR ?auto_15241 ) ( IS-CRATE ?auto_15242 ) ( not ( = ?auto_15241 ?auto_15242 ) ) ( not ( = ?auto_15243 ?auto_15241 ) ) ( not ( = ?auto_15244 ?auto_15241 ) ) ( not ( = ?auto_15250 ?auto_15241 ) ) ( not ( = ?auto_15246 ?auto_15241 ) ) ( AVAILABLE ?auto_15248 ) ( not ( = ?auto_15251 ?auto_15252 ) ) ( not ( = ?auto_15247 ?auto_15251 ) ) ( not ( = ?auto_15254 ?auto_15251 ) ) ( HOIST-AT ?auto_15255 ?auto_15251 ) ( not ( = ?auto_15248 ?auto_15255 ) ) ( not ( = ?auto_15245 ?auto_15255 ) ) ( not ( = ?auto_15256 ?auto_15255 ) ) ( AVAILABLE ?auto_15255 ) ( SURFACE-AT ?auto_15242 ?auto_15251 ) ( ON ?auto_15242 ?auto_15249 ) ( CLEAR ?auto_15242 ) ( not ( = ?auto_15243 ?auto_15249 ) ) ( not ( = ?auto_15244 ?auto_15249 ) ) ( not ( = ?auto_15242 ?auto_15249 ) ) ( not ( = ?auto_15250 ?auto_15249 ) ) ( not ( = ?auto_15246 ?auto_15249 ) ) ( not ( = ?auto_15241 ?auto_15249 ) ) ( TRUCK-AT ?auto_15253 ?auto_15252 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15242 ?auto_15243 ?auto_15244 )
      ( MAKE-3CRATE-VERIFY ?auto_15241 ?auto_15242 ?auto_15243 ?auto_15244 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15257 - SURFACE
      ?auto_15258 - SURFACE
      ?auto_15259 - SURFACE
      ?auto_15260 - SURFACE
      ?auto_15261 - SURFACE
    )
    :vars
    (
      ?auto_15265 - HOIST
      ?auto_15269 - PLACE
      ?auto_15264 - PLACE
      ?auto_15262 - HOIST
      ?auto_15267 - SURFACE
      ?auto_15271 - PLACE
      ?auto_15273 - HOIST
      ?auto_15263 - SURFACE
      ?auto_15268 - PLACE
      ?auto_15272 - HOIST
      ?auto_15266 - SURFACE
      ?auto_15270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15265 ?auto_15269 ) ( IS-CRATE ?auto_15261 ) ( not ( = ?auto_15260 ?auto_15261 ) ) ( not ( = ?auto_15259 ?auto_15260 ) ) ( not ( = ?auto_15259 ?auto_15261 ) ) ( not ( = ?auto_15264 ?auto_15269 ) ) ( HOIST-AT ?auto_15262 ?auto_15264 ) ( not ( = ?auto_15265 ?auto_15262 ) ) ( AVAILABLE ?auto_15262 ) ( SURFACE-AT ?auto_15261 ?auto_15264 ) ( ON ?auto_15261 ?auto_15267 ) ( CLEAR ?auto_15261 ) ( not ( = ?auto_15260 ?auto_15267 ) ) ( not ( = ?auto_15261 ?auto_15267 ) ) ( not ( = ?auto_15259 ?auto_15267 ) ) ( IS-CRATE ?auto_15260 ) ( not ( = ?auto_15271 ?auto_15269 ) ) ( not ( = ?auto_15264 ?auto_15271 ) ) ( HOIST-AT ?auto_15273 ?auto_15271 ) ( not ( = ?auto_15265 ?auto_15273 ) ) ( not ( = ?auto_15262 ?auto_15273 ) ) ( AVAILABLE ?auto_15273 ) ( SURFACE-AT ?auto_15260 ?auto_15271 ) ( ON ?auto_15260 ?auto_15263 ) ( CLEAR ?auto_15260 ) ( not ( = ?auto_15260 ?auto_15263 ) ) ( not ( = ?auto_15261 ?auto_15263 ) ) ( not ( = ?auto_15259 ?auto_15263 ) ) ( not ( = ?auto_15267 ?auto_15263 ) ) ( SURFACE-AT ?auto_15258 ?auto_15269 ) ( CLEAR ?auto_15258 ) ( IS-CRATE ?auto_15259 ) ( not ( = ?auto_15258 ?auto_15259 ) ) ( not ( = ?auto_15260 ?auto_15258 ) ) ( not ( = ?auto_15261 ?auto_15258 ) ) ( not ( = ?auto_15267 ?auto_15258 ) ) ( not ( = ?auto_15263 ?auto_15258 ) ) ( AVAILABLE ?auto_15265 ) ( not ( = ?auto_15268 ?auto_15269 ) ) ( not ( = ?auto_15264 ?auto_15268 ) ) ( not ( = ?auto_15271 ?auto_15268 ) ) ( HOIST-AT ?auto_15272 ?auto_15268 ) ( not ( = ?auto_15265 ?auto_15272 ) ) ( not ( = ?auto_15262 ?auto_15272 ) ) ( not ( = ?auto_15273 ?auto_15272 ) ) ( AVAILABLE ?auto_15272 ) ( SURFACE-AT ?auto_15259 ?auto_15268 ) ( ON ?auto_15259 ?auto_15266 ) ( CLEAR ?auto_15259 ) ( not ( = ?auto_15260 ?auto_15266 ) ) ( not ( = ?auto_15261 ?auto_15266 ) ) ( not ( = ?auto_15259 ?auto_15266 ) ) ( not ( = ?auto_15267 ?auto_15266 ) ) ( not ( = ?auto_15263 ?auto_15266 ) ) ( not ( = ?auto_15258 ?auto_15266 ) ) ( TRUCK-AT ?auto_15270 ?auto_15269 ) ( ON ?auto_15258 ?auto_15257 ) ( not ( = ?auto_15257 ?auto_15258 ) ) ( not ( = ?auto_15257 ?auto_15259 ) ) ( not ( = ?auto_15257 ?auto_15260 ) ) ( not ( = ?auto_15257 ?auto_15261 ) ) ( not ( = ?auto_15257 ?auto_15267 ) ) ( not ( = ?auto_15257 ?auto_15263 ) ) ( not ( = ?auto_15257 ?auto_15266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15259 ?auto_15260 ?auto_15261 )
      ( MAKE-4CRATE-VERIFY ?auto_15257 ?auto_15258 ?auto_15259 ?auto_15260 ?auto_15261 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15274 - SURFACE
      ?auto_15275 - SURFACE
    )
    :vars
    (
      ?auto_15279 - HOIST
      ?auto_15284 - PLACE
      ?auto_15289 - SURFACE
      ?auto_15278 - PLACE
      ?auto_15276 - HOIST
      ?auto_15282 - SURFACE
      ?auto_15286 - PLACE
      ?auto_15288 - HOIST
      ?auto_15277 - SURFACE
      ?auto_15280 - SURFACE
      ?auto_15283 - PLACE
      ?auto_15287 - HOIST
      ?auto_15281 - SURFACE
      ?auto_15285 - TRUCK
      ?auto_15290 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15279 ?auto_15284 ) ( IS-CRATE ?auto_15275 ) ( not ( = ?auto_15274 ?auto_15275 ) ) ( not ( = ?auto_15289 ?auto_15274 ) ) ( not ( = ?auto_15289 ?auto_15275 ) ) ( not ( = ?auto_15278 ?auto_15284 ) ) ( HOIST-AT ?auto_15276 ?auto_15278 ) ( not ( = ?auto_15279 ?auto_15276 ) ) ( AVAILABLE ?auto_15276 ) ( SURFACE-AT ?auto_15275 ?auto_15278 ) ( ON ?auto_15275 ?auto_15282 ) ( CLEAR ?auto_15275 ) ( not ( = ?auto_15274 ?auto_15282 ) ) ( not ( = ?auto_15275 ?auto_15282 ) ) ( not ( = ?auto_15289 ?auto_15282 ) ) ( IS-CRATE ?auto_15274 ) ( not ( = ?auto_15286 ?auto_15284 ) ) ( not ( = ?auto_15278 ?auto_15286 ) ) ( HOIST-AT ?auto_15288 ?auto_15286 ) ( not ( = ?auto_15279 ?auto_15288 ) ) ( not ( = ?auto_15276 ?auto_15288 ) ) ( AVAILABLE ?auto_15288 ) ( SURFACE-AT ?auto_15274 ?auto_15286 ) ( ON ?auto_15274 ?auto_15277 ) ( CLEAR ?auto_15274 ) ( not ( = ?auto_15274 ?auto_15277 ) ) ( not ( = ?auto_15275 ?auto_15277 ) ) ( not ( = ?auto_15289 ?auto_15277 ) ) ( not ( = ?auto_15282 ?auto_15277 ) ) ( IS-CRATE ?auto_15289 ) ( not ( = ?auto_15280 ?auto_15289 ) ) ( not ( = ?auto_15274 ?auto_15280 ) ) ( not ( = ?auto_15275 ?auto_15280 ) ) ( not ( = ?auto_15282 ?auto_15280 ) ) ( not ( = ?auto_15277 ?auto_15280 ) ) ( not ( = ?auto_15283 ?auto_15284 ) ) ( not ( = ?auto_15278 ?auto_15283 ) ) ( not ( = ?auto_15286 ?auto_15283 ) ) ( HOIST-AT ?auto_15287 ?auto_15283 ) ( not ( = ?auto_15279 ?auto_15287 ) ) ( not ( = ?auto_15276 ?auto_15287 ) ) ( not ( = ?auto_15288 ?auto_15287 ) ) ( AVAILABLE ?auto_15287 ) ( SURFACE-AT ?auto_15289 ?auto_15283 ) ( ON ?auto_15289 ?auto_15281 ) ( CLEAR ?auto_15289 ) ( not ( = ?auto_15274 ?auto_15281 ) ) ( not ( = ?auto_15275 ?auto_15281 ) ) ( not ( = ?auto_15289 ?auto_15281 ) ) ( not ( = ?auto_15282 ?auto_15281 ) ) ( not ( = ?auto_15277 ?auto_15281 ) ) ( not ( = ?auto_15280 ?auto_15281 ) ) ( TRUCK-AT ?auto_15285 ?auto_15284 ) ( SURFACE-AT ?auto_15290 ?auto_15284 ) ( CLEAR ?auto_15290 ) ( LIFTING ?auto_15279 ?auto_15280 ) ( IS-CRATE ?auto_15280 ) ( not ( = ?auto_15290 ?auto_15280 ) ) ( not ( = ?auto_15274 ?auto_15290 ) ) ( not ( = ?auto_15275 ?auto_15290 ) ) ( not ( = ?auto_15289 ?auto_15290 ) ) ( not ( = ?auto_15282 ?auto_15290 ) ) ( not ( = ?auto_15277 ?auto_15290 ) ) ( not ( = ?auto_15281 ?auto_15290 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15290 ?auto_15280 )
      ( MAKE-2CRATE ?auto_15289 ?auto_15274 ?auto_15275 )
      ( MAKE-1CRATE-VERIFY ?auto_15274 ?auto_15275 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15291 - SURFACE
      ?auto_15292 - SURFACE
      ?auto_15293 - SURFACE
    )
    :vars
    (
      ?auto_15304 - HOIST
      ?auto_15301 - PLACE
      ?auto_15303 - PLACE
      ?auto_15296 - HOIST
      ?auto_15306 - SURFACE
      ?auto_15300 - PLACE
      ?auto_15299 - HOIST
      ?auto_15295 - SURFACE
      ?auto_15297 - SURFACE
      ?auto_15294 - PLACE
      ?auto_15302 - HOIST
      ?auto_15305 - SURFACE
      ?auto_15298 - TRUCK
      ?auto_15307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15304 ?auto_15301 ) ( IS-CRATE ?auto_15293 ) ( not ( = ?auto_15292 ?auto_15293 ) ) ( not ( = ?auto_15291 ?auto_15292 ) ) ( not ( = ?auto_15291 ?auto_15293 ) ) ( not ( = ?auto_15303 ?auto_15301 ) ) ( HOIST-AT ?auto_15296 ?auto_15303 ) ( not ( = ?auto_15304 ?auto_15296 ) ) ( AVAILABLE ?auto_15296 ) ( SURFACE-AT ?auto_15293 ?auto_15303 ) ( ON ?auto_15293 ?auto_15306 ) ( CLEAR ?auto_15293 ) ( not ( = ?auto_15292 ?auto_15306 ) ) ( not ( = ?auto_15293 ?auto_15306 ) ) ( not ( = ?auto_15291 ?auto_15306 ) ) ( IS-CRATE ?auto_15292 ) ( not ( = ?auto_15300 ?auto_15301 ) ) ( not ( = ?auto_15303 ?auto_15300 ) ) ( HOIST-AT ?auto_15299 ?auto_15300 ) ( not ( = ?auto_15304 ?auto_15299 ) ) ( not ( = ?auto_15296 ?auto_15299 ) ) ( AVAILABLE ?auto_15299 ) ( SURFACE-AT ?auto_15292 ?auto_15300 ) ( ON ?auto_15292 ?auto_15295 ) ( CLEAR ?auto_15292 ) ( not ( = ?auto_15292 ?auto_15295 ) ) ( not ( = ?auto_15293 ?auto_15295 ) ) ( not ( = ?auto_15291 ?auto_15295 ) ) ( not ( = ?auto_15306 ?auto_15295 ) ) ( IS-CRATE ?auto_15291 ) ( not ( = ?auto_15297 ?auto_15291 ) ) ( not ( = ?auto_15292 ?auto_15297 ) ) ( not ( = ?auto_15293 ?auto_15297 ) ) ( not ( = ?auto_15306 ?auto_15297 ) ) ( not ( = ?auto_15295 ?auto_15297 ) ) ( not ( = ?auto_15294 ?auto_15301 ) ) ( not ( = ?auto_15303 ?auto_15294 ) ) ( not ( = ?auto_15300 ?auto_15294 ) ) ( HOIST-AT ?auto_15302 ?auto_15294 ) ( not ( = ?auto_15304 ?auto_15302 ) ) ( not ( = ?auto_15296 ?auto_15302 ) ) ( not ( = ?auto_15299 ?auto_15302 ) ) ( AVAILABLE ?auto_15302 ) ( SURFACE-AT ?auto_15291 ?auto_15294 ) ( ON ?auto_15291 ?auto_15305 ) ( CLEAR ?auto_15291 ) ( not ( = ?auto_15292 ?auto_15305 ) ) ( not ( = ?auto_15293 ?auto_15305 ) ) ( not ( = ?auto_15291 ?auto_15305 ) ) ( not ( = ?auto_15306 ?auto_15305 ) ) ( not ( = ?auto_15295 ?auto_15305 ) ) ( not ( = ?auto_15297 ?auto_15305 ) ) ( TRUCK-AT ?auto_15298 ?auto_15301 ) ( SURFACE-AT ?auto_15307 ?auto_15301 ) ( CLEAR ?auto_15307 ) ( LIFTING ?auto_15304 ?auto_15297 ) ( IS-CRATE ?auto_15297 ) ( not ( = ?auto_15307 ?auto_15297 ) ) ( not ( = ?auto_15292 ?auto_15307 ) ) ( not ( = ?auto_15293 ?auto_15307 ) ) ( not ( = ?auto_15291 ?auto_15307 ) ) ( not ( = ?auto_15306 ?auto_15307 ) ) ( not ( = ?auto_15295 ?auto_15307 ) ) ( not ( = ?auto_15305 ?auto_15307 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15292 ?auto_15293 )
      ( MAKE-2CRATE-VERIFY ?auto_15291 ?auto_15292 ?auto_15293 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15308 - SURFACE
      ?auto_15309 - SURFACE
      ?auto_15310 - SURFACE
      ?auto_15311 - SURFACE
    )
    :vars
    (
      ?auto_15320 - HOIST
      ?auto_15313 - PLACE
      ?auto_15312 - PLACE
      ?auto_15324 - HOIST
      ?auto_15319 - SURFACE
      ?auto_15315 - PLACE
      ?auto_15321 - HOIST
      ?auto_15317 - SURFACE
      ?auto_15323 - PLACE
      ?auto_15322 - HOIST
      ?auto_15316 - SURFACE
      ?auto_15314 - TRUCK
      ?auto_15318 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15320 ?auto_15313 ) ( IS-CRATE ?auto_15311 ) ( not ( = ?auto_15310 ?auto_15311 ) ) ( not ( = ?auto_15309 ?auto_15310 ) ) ( not ( = ?auto_15309 ?auto_15311 ) ) ( not ( = ?auto_15312 ?auto_15313 ) ) ( HOIST-AT ?auto_15324 ?auto_15312 ) ( not ( = ?auto_15320 ?auto_15324 ) ) ( AVAILABLE ?auto_15324 ) ( SURFACE-AT ?auto_15311 ?auto_15312 ) ( ON ?auto_15311 ?auto_15319 ) ( CLEAR ?auto_15311 ) ( not ( = ?auto_15310 ?auto_15319 ) ) ( not ( = ?auto_15311 ?auto_15319 ) ) ( not ( = ?auto_15309 ?auto_15319 ) ) ( IS-CRATE ?auto_15310 ) ( not ( = ?auto_15315 ?auto_15313 ) ) ( not ( = ?auto_15312 ?auto_15315 ) ) ( HOIST-AT ?auto_15321 ?auto_15315 ) ( not ( = ?auto_15320 ?auto_15321 ) ) ( not ( = ?auto_15324 ?auto_15321 ) ) ( AVAILABLE ?auto_15321 ) ( SURFACE-AT ?auto_15310 ?auto_15315 ) ( ON ?auto_15310 ?auto_15317 ) ( CLEAR ?auto_15310 ) ( not ( = ?auto_15310 ?auto_15317 ) ) ( not ( = ?auto_15311 ?auto_15317 ) ) ( not ( = ?auto_15309 ?auto_15317 ) ) ( not ( = ?auto_15319 ?auto_15317 ) ) ( IS-CRATE ?auto_15309 ) ( not ( = ?auto_15308 ?auto_15309 ) ) ( not ( = ?auto_15310 ?auto_15308 ) ) ( not ( = ?auto_15311 ?auto_15308 ) ) ( not ( = ?auto_15319 ?auto_15308 ) ) ( not ( = ?auto_15317 ?auto_15308 ) ) ( not ( = ?auto_15323 ?auto_15313 ) ) ( not ( = ?auto_15312 ?auto_15323 ) ) ( not ( = ?auto_15315 ?auto_15323 ) ) ( HOIST-AT ?auto_15322 ?auto_15323 ) ( not ( = ?auto_15320 ?auto_15322 ) ) ( not ( = ?auto_15324 ?auto_15322 ) ) ( not ( = ?auto_15321 ?auto_15322 ) ) ( AVAILABLE ?auto_15322 ) ( SURFACE-AT ?auto_15309 ?auto_15323 ) ( ON ?auto_15309 ?auto_15316 ) ( CLEAR ?auto_15309 ) ( not ( = ?auto_15310 ?auto_15316 ) ) ( not ( = ?auto_15311 ?auto_15316 ) ) ( not ( = ?auto_15309 ?auto_15316 ) ) ( not ( = ?auto_15319 ?auto_15316 ) ) ( not ( = ?auto_15317 ?auto_15316 ) ) ( not ( = ?auto_15308 ?auto_15316 ) ) ( TRUCK-AT ?auto_15314 ?auto_15313 ) ( SURFACE-AT ?auto_15318 ?auto_15313 ) ( CLEAR ?auto_15318 ) ( LIFTING ?auto_15320 ?auto_15308 ) ( IS-CRATE ?auto_15308 ) ( not ( = ?auto_15318 ?auto_15308 ) ) ( not ( = ?auto_15310 ?auto_15318 ) ) ( not ( = ?auto_15311 ?auto_15318 ) ) ( not ( = ?auto_15309 ?auto_15318 ) ) ( not ( = ?auto_15319 ?auto_15318 ) ) ( not ( = ?auto_15317 ?auto_15318 ) ) ( not ( = ?auto_15316 ?auto_15318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15309 ?auto_15310 ?auto_15311 )
      ( MAKE-3CRATE-VERIFY ?auto_15308 ?auto_15309 ?auto_15310 ?auto_15311 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15325 - SURFACE
      ?auto_15326 - SURFACE
      ?auto_15327 - SURFACE
      ?auto_15328 - SURFACE
      ?auto_15329 - SURFACE
    )
    :vars
    (
      ?auto_15337 - HOIST
      ?auto_15331 - PLACE
      ?auto_15330 - PLACE
      ?auto_15341 - HOIST
      ?auto_15336 - SURFACE
      ?auto_15333 - PLACE
      ?auto_15338 - HOIST
      ?auto_15335 - SURFACE
      ?auto_15340 - PLACE
      ?auto_15339 - HOIST
      ?auto_15334 - SURFACE
      ?auto_15332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15337 ?auto_15331 ) ( IS-CRATE ?auto_15329 ) ( not ( = ?auto_15328 ?auto_15329 ) ) ( not ( = ?auto_15327 ?auto_15328 ) ) ( not ( = ?auto_15327 ?auto_15329 ) ) ( not ( = ?auto_15330 ?auto_15331 ) ) ( HOIST-AT ?auto_15341 ?auto_15330 ) ( not ( = ?auto_15337 ?auto_15341 ) ) ( AVAILABLE ?auto_15341 ) ( SURFACE-AT ?auto_15329 ?auto_15330 ) ( ON ?auto_15329 ?auto_15336 ) ( CLEAR ?auto_15329 ) ( not ( = ?auto_15328 ?auto_15336 ) ) ( not ( = ?auto_15329 ?auto_15336 ) ) ( not ( = ?auto_15327 ?auto_15336 ) ) ( IS-CRATE ?auto_15328 ) ( not ( = ?auto_15333 ?auto_15331 ) ) ( not ( = ?auto_15330 ?auto_15333 ) ) ( HOIST-AT ?auto_15338 ?auto_15333 ) ( not ( = ?auto_15337 ?auto_15338 ) ) ( not ( = ?auto_15341 ?auto_15338 ) ) ( AVAILABLE ?auto_15338 ) ( SURFACE-AT ?auto_15328 ?auto_15333 ) ( ON ?auto_15328 ?auto_15335 ) ( CLEAR ?auto_15328 ) ( not ( = ?auto_15328 ?auto_15335 ) ) ( not ( = ?auto_15329 ?auto_15335 ) ) ( not ( = ?auto_15327 ?auto_15335 ) ) ( not ( = ?auto_15336 ?auto_15335 ) ) ( IS-CRATE ?auto_15327 ) ( not ( = ?auto_15326 ?auto_15327 ) ) ( not ( = ?auto_15328 ?auto_15326 ) ) ( not ( = ?auto_15329 ?auto_15326 ) ) ( not ( = ?auto_15336 ?auto_15326 ) ) ( not ( = ?auto_15335 ?auto_15326 ) ) ( not ( = ?auto_15340 ?auto_15331 ) ) ( not ( = ?auto_15330 ?auto_15340 ) ) ( not ( = ?auto_15333 ?auto_15340 ) ) ( HOIST-AT ?auto_15339 ?auto_15340 ) ( not ( = ?auto_15337 ?auto_15339 ) ) ( not ( = ?auto_15341 ?auto_15339 ) ) ( not ( = ?auto_15338 ?auto_15339 ) ) ( AVAILABLE ?auto_15339 ) ( SURFACE-AT ?auto_15327 ?auto_15340 ) ( ON ?auto_15327 ?auto_15334 ) ( CLEAR ?auto_15327 ) ( not ( = ?auto_15328 ?auto_15334 ) ) ( not ( = ?auto_15329 ?auto_15334 ) ) ( not ( = ?auto_15327 ?auto_15334 ) ) ( not ( = ?auto_15336 ?auto_15334 ) ) ( not ( = ?auto_15335 ?auto_15334 ) ) ( not ( = ?auto_15326 ?auto_15334 ) ) ( TRUCK-AT ?auto_15332 ?auto_15331 ) ( SURFACE-AT ?auto_15325 ?auto_15331 ) ( CLEAR ?auto_15325 ) ( LIFTING ?auto_15337 ?auto_15326 ) ( IS-CRATE ?auto_15326 ) ( not ( = ?auto_15325 ?auto_15326 ) ) ( not ( = ?auto_15328 ?auto_15325 ) ) ( not ( = ?auto_15329 ?auto_15325 ) ) ( not ( = ?auto_15327 ?auto_15325 ) ) ( not ( = ?auto_15336 ?auto_15325 ) ) ( not ( = ?auto_15335 ?auto_15325 ) ) ( not ( = ?auto_15334 ?auto_15325 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15327 ?auto_15328 ?auto_15329 )
      ( MAKE-4CRATE-VERIFY ?auto_15325 ?auto_15326 ?auto_15327 ?auto_15328 ?auto_15329 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15342 - SURFACE
      ?auto_15343 - SURFACE
    )
    :vars
    (
      ?auto_15352 - HOIST
      ?auto_15345 - PLACE
      ?auto_15357 - SURFACE
      ?auto_15344 - PLACE
      ?auto_15358 - HOIST
      ?auto_15351 - SURFACE
      ?auto_15347 - PLACE
      ?auto_15353 - HOIST
      ?auto_15349 - SURFACE
      ?auto_15354 - SURFACE
      ?auto_15356 - PLACE
      ?auto_15355 - HOIST
      ?auto_15348 - SURFACE
      ?auto_15346 - TRUCK
      ?auto_15350 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15352 ?auto_15345 ) ( IS-CRATE ?auto_15343 ) ( not ( = ?auto_15342 ?auto_15343 ) ) ( not ( = ?auto_15357 ?auto_15342 ) ) ( not ( = ?auto_15357 ?auto_15343 ) ) ( not ( = ?auto_15344 ?auto_15345 ) ) ( HOIST-AT ?auto_15358 ?auto_15344 ) ( not ( = ?auto_15352 ?auto_15358 ) ) ( AVAILABLE ?auto_15358 ) ( SURFACE-AT ?auto_15343 ?auto_15344 ) ( ON ?auto_15343 ?auto_15351 ) ( CLEAR ?auto_15343 ) ( not ( = ?auto_15342 ?auto_15351 ) ) ( not ( = ?auto_15343 ?auto_15351 ) ) ( not ( = ?auto_15357 ?auto_15351 ) ) ( IS-CRATE ?auto_15342 ) ( not ( = ?auto_15347 ?auto_15345 ) ) ( not ( = ?auto_15344 ?auto_15347 ) ) ( HOIST-AT ?auto_15353 ?auto_15347 ) ( not ( = ?auto_15352 ?auto_15353 ) ) ( not ( = ?auto_15358 ?auto_15353 ) ) ( AVAILABLE ?auto_15353 ) ( SURFACE-AT ?auto_15342 ?auto_15347 ) ( ON ?auto_15342 ?auto_15349 ) ( CLEAR ?auto_15342 ) ( not ( = ?auto_15342 ?auto_15349 ) ) ( not ( = ?auto_15343 ?auto_15349 ) ) ( not ( = ?auto_15357 ?auto_15349 ) ) ( not ( = ?auto_15351 ?auto_15349 ) ) ( IS-CRATE ?auto_15357 ) ( not ( = ?auto_15354 ?auto_15357 ) ) ( not ( = ?auto_15342 ?auto_15354 ) ) ( not ( = ?auto_15343 ?auto_15354 ) ) ( not ( = ?auto_15351 ?auto_15354 ) ) ( not ( = ?auto_15349 ?auto_15354 ) ) ( not ( = ?auto_15356 ?auto_15345 ) ) ( not ( = ?auto_15344 ?auto_15356 ) ) ( not ( = ?auto_15347 ?auto_15356 ) ) ( HOIST-AT ?auto_15355 ?auto_15356 ) ( not ( = ?auto_15352 ?auto_15355 ) ) ( not ( = ?auto_15358 ?auto_15355 ) ) ( not ( = ?auto_15353 ?auto_15355 ) ) ( AVAILABLE ?auto_15355 ) ( SURFACE-AT ?auto_15357 ?auto_15356 ) ( ON ?auto_15357 ?auto_15348 ) ( CLEAR ?auto_15357 ) ( not ( = ?auto_15342 ?auto_15348 ) ) ( not ( = ?auto_15343 ?auto_15348 ) ) ( not ( = ?auto_15357 ?auto_15348 ) ) ( not ( = ?auto_15351 ?auto_15348 ) ) ( not ( = ?auto_15349 ?auto_15348 ) ) ( not ( = ?auto_15354 ?auto_15348 ) ) ( TRUCK-AT ?auto_15346 ?auto_15345 ) ( SURFACE-AT ?auto_15350 ?auto_15345 ) ( CLEAR ?auto_15350 ) ( IS-CRATE ?auto_15354 ) ( not ( = ?auto_15350 ?auto_15354 ) ) ( not ( = ?auto_15342 ?auto_15350 ) ) ( not ( = ?auto_15343 ?auto_15350 ) ) ( not ( = ?auto_15357 ?auto_15350 ) ) ( not ( = ?auto_15351 ?auto_15350 ) ) ( not ( = ?auto_15349 ?auto_15350 ) ) ( not ( = ?auto_15348 ?auto_15350 ) ) ( AVAILABLE ?auto_15352 ) ( IN ?auto_15354 ?auto_15346 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15352 ?auto_15354 ?auto_15346 ?auto_15345 )
      ( MAKE-2CRATE ?auto_15357 ?auto_15342 ?auto_15343 )
      ( MAKE-1CRATE-VERIFY ?auto_15342 ?auto_15343 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15359 - SURFACE
      ?auto_15360 - SURFACE
      ?auto_15361 - SURFACE
    )
    :vars
    (
      ?auto_15363 - HOIST
      ?auto_15372 - PLACE
      ?auto_15375 - PLACE
      ?auto_15365 - HOIST
      ?auto_15371 - SURFACE
      ?auto_15368 - PLACE
      ?auto_15370 - HOIST
      ?auto_15366 - SURFACE
      ?auto_15364 - SURFACE
      ?auto_15369 - PLACE
      ?auto_15362 - HOIST
      ?auto_15374 - SURFACE
      ?auto_15373 - TRUCK
      ?auto_15367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15363 ?auto_15372 ) ( IS-CRATE ?auto_15361 ) ( not ( = ?auto_15360 ?auto_15361 ) ) ( not ( = ?auto_15359 ?auto_15360 ) ) ( not ( = ?auto_15359 ?auto_15361 ) ) ( not ( = ?auto_15375 ?auto_15372 ) ) ( HOIST-AT ?auto_15365 ?auto_15375 ) ( not ( = ?auto_15363 ?auto_15365 ) ) ( AVAILABLE ?auto_15365 ) ( SURFACE-AT ?auto_15361 ?auto_15375 ) ( ON ?auto_15361 ?auto_15371 ) ( CLEAR ?auto_15361 ) ( not ( = ?auto_15360 ?auto_15371 ) ) ( not ( = ?auto_15361 ?auto_15371 ) ) ( not ( = ?auto_15359 ?auto_15371 ) ) ( IS-CRATE ?auto_15360 ) ( not ( = ?auto_15368 ?auto_15372 ) ) ( not ( = ?auto_15375 ?auto_15368 ) ) ( HOIST-AT ?auto_15370 ?auto_15368 ) ( not ( = ?auto_15363 ?auto_15370 ) ) ( not ( = ?auto_15365 ?auto_15370 ) ) ( AVAILABLE ?auto_15370 ) ( SURFACE-AT ?auto_15360 ?auto_15368 ) ( ON ?auto_15360 ?auto_15366 ) ( CLEAR ?auto_15360 ) ( not ( = ?auto_15360 ?auto_15366 ) ) ( not ( = ?auto_15361 ?auto_15366 ) ) ( not ( = ?auto_15359 ?auto_15366 ) ) ( not ( = ?auto_15371 ?auto_15366 ) ) ( IS-CRATE ?auto_15359 ) ( not ( = ?auto_15364 ?auto_15359 ) ) ( not ( = ?auto_15360 ?auto_15364 ) ) ( not ( = ?auto_15361 ?auto_15364 ) ) ( not ( = ?auto_15371 ?auto_15364 ) ) ( not ( = ?auto_15366 ?auto_15364 ) ) ( not ( = ?auto_15369 ?auto_15372 ) ) ( not ( = ?auto_15375 ?auto_15369 ) ) ( not ( = ?auto_15368 ?auto_15369 ) ) ( HOIST-AT ?auto_15362 ?auto_15369 ) ( not ( = ?auto_15363 ?auto_15362 ) ) ( not ( = ?auto_15365 ?auto_15362 ) ) ( not ( = ?auto_15370 ?auto_15362 ) ) ( AVAILABLE ?auto_15362 ) ( SURFACE-AT ?auto_15359 ?auto_15369 ) ( ON ?auto_15359 ?auto_15374 ) ( CLEAR ?auto_15359 ) ( not ( = ?auto_15360 ?auto_15374 ) ) ( not ( = ?auto_15361 ?auto_15374 ) ) ( not ( = ?auto_15359 ?auto_15374 ) ) ( not ( = ?auto_15371 ?auto_15374 ) ) ( not ( = ?auto_15366 ?auto_15374 ) ) ( not ( = ?auto_15364 ?auto_15374 ) ) ( TRUCK-AT ?auto_15373 ?auto_15372 ) ( SURFACE-AT ?auto_15367 ?auto_15372 ) ( CLEAR ?auto_15367 ) ( IS-CRATE ?auto_15364 ) ( not ( = ?auto_15367 ?auto_15364 ) ) ( not ( = ?auto_15360 ?auto_15367 ) ) ( not ( = ?auto_15361 ?auto_15367 ) ) ( not ( = ?auto_15359 ?auto_15367 ) ) ( not ( = ?auto_15371 ?auto_15367 ) ) ( not ( = ?auto_15366 ?auto_15367 ) ) ( not ( = ?auto_15374 ?auto_15367 ) ) ( AVAILABLE ?auto_15363 ) ( IN ?auto_15364 ?auto_15373 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15360 ?auto_15361 )
      ( MAKE-2CRATE-VERIFY ?auto_15359 ?auto_15360 ?auto_15361 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15376 - SURFACE
      ?auto_15377 - SURFACE
      ?auto_15378 - SURFACE
      ?auto_15379 - SURFACE
    )
    :vars
    (
      ?auto_15383 - HOIST
      ?auto_15387 - PLACE
      ?auto_15388 - PLACE
      ?auto_15382 - HOIST
      ?auto_15380 - SURFACE
      ?auto_15391 - PLACE
      ?auto_15392 - HOIST
      ?auto_15385 - SURFACE
      ?auto_15381 - PLACE
      ?auto_15384 - HOIST
      ?auto_15389 - SURFACE
      ?auto_15390 - TRUCK
      ?auto_15386 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15383 ?auto_15387 ) ( IS-CRATE ?auto_15379 ) ( not ( = ?auto_15378 ?auto_15379 ) ) ( not ( = ?auto_15377 ?auto_15378 ) ) ( not ( = ?auto_15377 ?auto_15379 ) ) ( not ( = ?auto_15388 ?auto_15387 ) ) ( HOIST-AT ?auto_15382 ?auto_15388 ) ( not ( = ?auto_15383 ?auto_15382 ) ) ( AVAILABLE ?auto_15382 ) ( SURFACE-AT ?auto_15379 ?auto_15388 ) ( ON ?auto_15379 ?auto_15380 ) ( CLEAR ?auto_15379 ) ( not ( = ?auto_15378 ?auto_15380 ) ) ( not ( = ?auto_15379 ?auto_15380 ) ) ( not ( = ?auto_15377 ?auto_15380 ) ) ( IS-CRATE ?auto_15378 ) ( not ( = ?auto_15391 ?auto_15387 ) ) ( not ( = ?auto_15388 ?auto_15391 ) ) ( HOIST-AT ?auto_15392 ?auto_15391 ) ( not ( = ?auto_15383 ?auto_15392 ) ) ( not ( = ?auto_15382 ?auto_15392 ) ) ( AVAILABLE ?auto_15392 ) ( SURFACE-AT ?auto_15378 ?auto_15391 ) ( ON ?auto_15378 ?auto_15385 ) ( CLEAR ?auto_15378 ) ( not ( = ?auto_15378 ?auto_15385 ) ) ( not ( = ?auto_15379 ?auto_15385 ) ) ( not ( = ?auto_15377 ?auto_15385 ) ) ( not ( = ?auto_15380 ?auto_15385 ) ) ( IS-CRATE ?auto_15377 ) ( not ( = ?auto_15376 ?auto_15377 ) ) ( not ( = ?auto_15378 ?auto_15376 ) ) ( not ( = ?auto_15379 ?auto_15376 ) ) ( not ( = ?auto_15380 ?auto_15376 ) ) ( not ( = ?auto_15385 ?auto_15376 ) ) ( not ( = ?auto_15381 ?auto_15387 ) ) ( not ( = ?auto_15388 ?auto_15381 ) ) ( not ( = ?auto_15391 ?auto_15381 ) ) ( HOIST-AT ?auto_15384 ?auto_15381 ) ( not ( = ?auto_15383 ?auto_15384 ) ) ( not ( = ?auto_15382 ?auto_15384 ) ) ( not ( = ?auto_15392 ?auto_15384 ) ) ( AVAILABLE ?auto_15384 ) ( SURFACE-AT ?auto_15377 ?auto_15381 ) ( ON ?auto_15377 ?auto_15389 ) ( CLEAR ?auto_15377 ) ( not ( = ?auto_15378 ?auto_15389 ) ) ( not ( = ?auto_15379 ?auto_15389 ) ) ( not ( = ?auto_15377 ?auto_15389 ) ) ( not ( = ?auto_15380 ?auto_15389 ) ) ( not ( = ?auto_15385 ?auto_15389 ) ) ( not ( = ?auto_15376 ?auto_15389 ) ) ( TRUCK-AT ?auto_15390 ?auto_15387 ) ( SURFACE-AT ?auto_15386 ?auto_15387 ) ( CLEAR ?auto_15386 ) ( IS-CRATE ?auto_15376 ) ( not ( = ?auto_15386 ?auto_15376 ) ) ( not ( = ?auto_15378 ?auto_15386 ) ) ( not ( = ?auto_15379 ?auto_15386 ) ) ( not ( = ?auto_15377 ?auto_15386 ) ) ( not ( = ?auto_15380 ?auto_15386 ) ) ( not ( = ?auto_15385 ?auto_15386 ) ) ( not ( = ?auto_15389 ?auto_15386 ) ) ( AVAILABLE ?auto_15383 ) ( IN ?auto_15376 ?auto_15390 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15377 ?auto_15378 ?auto_15379 )
      ( MAKE-3CRATE-VERIFY ?auto_15376 ?auto_15377 ?auto_15378 ?auto_15379 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15393 - SURFACE
      ?auto_15394 - SURFACE
      ?auto_15395 - SURFACE
      ?auto_15396 - SURFACE
      ?auto_15397 - SURFACE
    )
    :vars
    (
      ?auto_15401 - HOIST
      ?auto_15404 - PLACE
      ?auto_15405 - PLACE
      ?auto_15400 - HOIST
      ?auto_15398 - SURFACE
      ?auto_15408 - PLACE
      ?auto_15409 - HOIST
      ?auto_15403 - SURFACE
      ?auto_15399 - PLACE
      ?auto_15402 - HOIST
      ?auto_15406 - SURFACE
      ?auto_15407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15401 ?auto_15404 ) ( IS-CRATE ?auto_15397 ) ( not ( = ?auto_15396 ?auto_15397 ) ) ( not ( = ?auto_15395 ?auto_15396 ) ) ( not ( = ?auto_15395 ?auto_15397 ) ) ( not ( = ?auto_15405 ?auto_15404 ) ) ( HOIST-AT ?auto_15400 ?auto_15405 ) ( not ( = ?auto_15401 ?auto_15400 ) ) ( AVAILABLE ?auto_15400 ) ( SURFACE-AT ?auto_15397 ?auto_15405 ) ( ON ?auto_15397 ?auto_15398 ) ( CLEAR ?auto_15397 ) ( not ( = ?auto_15396 ?auto_15398 ) ) ( not ( = ?auto_15397 ?auto_15398 ) ) ( not ( = ?auto_15395 ?auto_15398 ) ) ( IS-CRATE ?auto_15396 ) ( not ( = ?auto_15408 ?auto_15404 ) ) ( not ( = ?auto_15405 ?auto_15408 ) ) ( HOIST-AT ?auto_15409 ?auto_15408 ) ( not ( = ?auto_15401 ?auto_15409 ) ) ( not ( = ?auto_15400 ?auto_15409 ) ) ( AVAILABLE ?auto_15409 ) ( SURFACE-AT ?auto_15396 ?auto_15408 ) ( ON ?auto_15396 ?auto_15403 ) ( CLEAR ?auto_15396 ) ( not ( = ?auto_15396 ?auto_15403 ) ) ( not ( = ?auto_15397 ?auto_15403 ) ) ( not ( = ?auto_15395 ?auto_15403 ) ) ( not ( = ?auto_15398 ?auto_15403 ) ) ( IS-CRATE ?auto_15395 ) ( not ( = ?auto_15394 ?auto_15395 ) ) ( not ( = ?auto_15396 ?auto_15394 ) ) ( not ( = ?auto_15397 ?auto_15394 ) ) ( not ( = ?auto_15398 ?auto_15394 ) ) ( not ( = ?auto_15403 ?auto_15394 ) ) ( not ( = ?auto_15399 ?auto_15404 ) ) ( not ( = ?auto_15405 ?auto_15399 ) ) ( not ( = ?auto_15408 ?auto_15399 ) ) ( HOIST-AT ?auto_15402 ?auto_15399 ) ( not ( = ?auto_15401 ?auto_15402 ) ) ( not ( = ?auto_15400 ?auto_15402 ) ) ( not ( = ?auto_15409 ?auto_15402 ) ) ( AVAILABLE ?auto_15402 ) ( SURFACE-AT ?auto_15395 ?auto_15399 ) ( ON ?auto_15395 ?auto_15406 ) ( CLEAR ?auto_15395 ) ( not ( = ?auto_15396 ?auto_15406 ) ) ( not ( = ?auto_15397 ?auto_15406 ) ) ( not ( = ?auto_15395 ?auto_15406 ) ) ( not ( = ?auto_15398 ?auto_15406 ) ) ( not ( = ?auto_15403 ?auto_15406 ) ) ( not ( = ?auto_15394 ?auto_15406 ) ) ( TRUCK-AT ?auto_15407 ?auto_15404 ) ( SURFACE-AT ?auto_15393 ?auto_15404 ) ( CLEAR ?auto_15393 ) ( IS-CRATE ?auto_15394 ) ( not ( = ?auto_15393 ?auto_15394 ) ) ( not ( = ?auto_15396 ?auto_15393 ) ) ( not ( = ?auto_15397 ?auto_15393 ) ) ( not ( = ?auto_15395 ?auto_15393 ) ) ( not ( = ?auto_15398 ?auto_15393 ) ) ( not ( = ?auto_15403 ?auto_15393 ) ) ( not ( = ?auto_15406 ?auto_15393 ) ) ( AVAILABLE ?auto_15401 ) ( IN ?auto_15394 ?auto_15407 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15395 ?auto_15396 ?auto_15397 )
      ( MAKE-4CRATE-VERIFY ?auto_15393 ?auto_15394 ?auto_15395 ?auto_15396 ?auto_15397 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15410 - SURFACE
      ?auto_15411 - SURFACE
    )
    :vars
    (
      ?auto_15416 - HOIST
      ?auto_15420 - PLACE
      ?auto_15424 - SURFACE
      ?auto_15421 - PLACE
      ?auto_15415 - HOIST
      ?auto_15412 - SURFACE
      ?auto_15425 - PLACE
      ?auto_15426 - HOIST
      ?auto_15418 - SURFACE
      ?auto_15413 - SURFACE
      ?auto_15414 - PLACE
      ?auto_15417 - HOIST
      ?auto_15422 - SURFACE
      ?auto_15419 - SURFACE
      ?auto_15423 - TRUCK
      ?auto_15427 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15416 ?auto_15420 ) ( IS-CRATE ?auto_15411 ) ( not ( = ?auto_15410 ?auto_15411 ) ) ( not ( = ?auto_15424 ?auto_15410 ) ) ( not ( = ?auto_15424 ?auto_15411 ) ) ( not ( = ?auto_15421 ?auto_15420 ) ) ( HOIST-AT ?auto_15415 ?auto_15421 ) ( not ( = ?auto_15416 ?auto_15415 ) ) ( AVAILABLE ?auto_15415 ) ( SURFACE-AT ?auto_15411 ?auto_15421 ) ( ON ?auto_15411 ?auto_15412 ) ( CLEAR ?auto_15411 ) ( not ( = ?auto_15410 ?auto_15412 ) ) ( not ( = ?auto_15411 ?auto_15412 ) ) ( not ( = ?auto_15424 ?auto_15412 ) ) ( IS-CRATE ?auto_15410 ) ( not ( = ?auto_15425 ?auto_15420 ) ) ( not ( = ?auto_15421 ?auto_15425 ) ) ( HOIST-AT ?auto_15426 ?auto_15425 ) ( not ( = ?auto_15416 ?auto_15426 ) ) ( not ( = ?auto_15415 ?auto_15426 ) ) ( AVAILABLE ?auto_15426 ) ( SURFACE-AT ?auto_15410 ?auto_15425 ) ( ON ?auto_15410 ?auto_15418 ) ( CLEAR ?auto_15410 ) ( not ( = ?auto_15410 ?auto_15418 ) ) ( not ( = ?auto_15411 ?auto_15418 ) ) ( not ( = ?auto_15424 ?auto_15418 ) ) ( not ( = ?auto_15412 ?auto_15418 ) ) ( IS-CRATE ?auto_15424 ) ( not ( = ?auto_15413 ?auto_15424 ) ) ( not ( = ?auto_15410 ?auto_15413 ) ) ( not ( = ?auto_15411 ?auto_15413 ) ) ( not ( = ?auto_15412 ?auto_15413 ) ) ( not ( = ?auto_15418 ?auto_15413 ) ) ( not ( = ?auto_15414 ?auto_15420 ) ) ( not ( = ?auto_15421 ?auto_15414 ) ) ( not ( = ?auto_15425 ?auto_15414 ) ) ( HOIST-AT ?auto_15417 ?auto_15414 ) ( not ( = ?auto_15416 ?auto_15417 ) ) ( not ( = ?auto_15415 ?auto_15417 ) ) ( not ( = ?auto_15426 ?auto_15417 ) ) ( AVAILABLE ?auto_15417 ) ( SURFACE-AT ?auto_15424 ?auto_15414 ) ( ON ?auto_15424 ?auto_15422 ) ( CLEAR ?auto_15424 ) ( not ( = ?auto_15410 ?auto_15422 ) ) ( not ( = ?auto_15411 ?auto_15422 ) ) ( not ( = ?auto_15424 ?auto_15422 ) ) ( not ( = ?auto_15412 ?auto_15422 ) ) ( not ( = ?auto_15418 ?auto_15422 ) ) ( not ( = ?auto_15413 ?auto_15422 ) ) ( SURFACE-AT ?auto_15419 ?auto_15420 ) ( CLEAR ?auto_15419 ) ( IS-CRATE ?auto_15413 ) ( not ( = ?auto_15419 ?auto_15413 ) ) ( not ( = ?auto_15410 ?auto_15419 ) ) ( not ( = ?auto_15411 ?auto_15419 ) ) ( not ( = ?auto_15424 ?auto_15419 ) ) ( not ( = ?auto_15412 ?auto_15419 ) ) ( not ( = ?auto_15418 ?auto_15419 ) ) ( not ( = ?auto_15422 ?auto_15419 ) ) ( AVAILABLE ?auto_15416 ) ( IN ?auto_15413 ?auto_15423 ) ( TRUCK-AT ?auto_15423 ?auto_15427 ) ( not ( = ?auto_15427 ?auto_15420 ) ) ( not ( = ?auto_15421 ?auto_15427 ) ) ( not ( = ?auto_15425 ?auto_15427 ) ) ( not ( = ?auto_15414 ?auto_15427 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15423 ?auto_15427 ?auto_15420 )
      ( MAKE-2CRATE ?auto_15424 ?auto_15410 ?auto_15411 )
      ( MAKE-1CRATE-VERIFY ?auto_15410 ?auto_15411 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15428 - SURFACE
      ?auto_15429 - SURFACE
      ?auto_15430 - SURFACE
    )
    :vars
    (
      ?auto_15437 - HOIST
      ?auto_15435 - PLACE
      ?auto_15434 - PLACE
      ?auto_15444 - HOIST
      ?auto_15431 - SURFACE
      ?auto_15442 - PLACE
      ?auto_15441 - HOIST
      ?auto_15445 - SURFACE
      ?auto_15443 - SURFACE
      ?auto_15439 - PLACE
      ?auto_15436 - HOIST
      ?auto_15432 - SURFACE
      ?auto_15438 - SURFACE
      ?auto_15440 - TRUCK
      ?auto_15433 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15437 ?auto_15435 ) ( IS-CRATE ?auto_15430 ) ( not ( = ?auto_15429 ?auto_15430 ) ) ( not ( = ?auto_15428 ?auto_15429 ) ) ( not ( = ?auto_15428 ?auto_15430 ) ) ( not ( = ?auto_15434 ?auto_15435 ) ) ( HOIST-AT ?auto_15444 ?auto_15434 ) ( not ( = ?auto_15437 ?auto_15444 ) ) ( AVAILABLE ?auto_15444 ) ( SURFACE-AT ?auto_15430 ?auto_15434 ) ( ON ?auto_15430 ?auto_15431 ) ( CLEAR ?auto_15430 ) ( not ( = ?auto_15429 ?auto_15431 ) ) ( not ( = ?auto_15430 ?auto_15431 ) ) ( not ( = ?auto_15428 ?auto_15431 ) ) ( IS-CRATE ?auto_15429 ) ( not ( = ?auto_15442 ?auto_15435 ) ) ( not ( = ?auto_15434 ?auto_15442 ) ) ( HOIST-AT ?auto_15441 ?auto_15442 ) ( not ( = ?auto_15437 ?auto_15441 ) ) ( not ( = ?auto_15444 ?auto_15441 ) ) ( AVAILABLE ?auto_15441 ) ( SURFACE-AT ?auto_15429 ?auto_15442 ) ( ON ?auto_15429 ?auto_15445 ) ( CLEAR ?auto_15429 ) ( not ( = ?auto_15429 ?auto_15445 ) ) ( not ( = ?auto_15430 ?auto_15445 ) ) ( not ( = ?auto_15428 ?auto_15445 ) ) ( not ( = ?auto_15431 ?auto_15445 ) ) ( IS-CRATE ?auto_15428 ) ( not ( = ?auto_15443 ?auto_15428 ) ) ( not ( = ?auto_15429 ?auto_15443 ) ) ( not ( = ?auto_15430 ?auto_15443 ) ) ( not ( = ?auto_15431 ?auto_15443 ) ) ( not ( = ?auto_15445 ?auto_15443 ) ) ( not ( = ?auto_15439 ?auto_15435 ) ) ( not ( = ?auto_15434 ?auto_15439 ) ) ( not ( = ?auto_15442 ?auto_15439 ) ) ( HOIST-AT ?auto_15436 ?auto_15439 ) ( not ( = ?auto_15437 ?auto_15436 ) ) ( not ( = ?auto_15444 ?auto_15436 ) ) ( not ( = ?auto_15441 ?auto_15436 ) ) ( AVAILABLE ?auto_15436 ) ( SURFACE-AT ?auto_15428 ?auto_15439 ) ( ON ?auto_15428 ?auto_15432 ) ( CLEAR ?auto_15428 ) ( not ( = ?auto_15429 ?auto_15432 ) ) ( not ( = ?auto_15430 ?auto_15432 ) ) ( not ( = ?auto_15428 ?auto_15432 ) ) ( not ( = ?auto_15431 ?auto_15432 ) ) ( not ( = ?auto_15445 ?auto_15432 ) ) ( not ( = ?auto_15443 ?auto_15432 ) ) ( SURFACE-AT ?auto_15438 ?auto_15435 ) ( CLEAR ?auto_15438 ) ( IS-CRATE ?auto_15443 ) ( not ( = ?auto_15438 ?auto_15443 ) ) ( not ( = ?auto_15429 ?auto_15438 ) ) ( not ( = ?auto_15430 ?auto_15438 ) ) ( not ( = ?auto_15428 ?auto_15438 ) ) ( not ( = ?auto_15431 ?auto_15438 ) ) ( not ( = ?auto_15445 ?auto_15438 ) ) ( not ( = ?auto_15432 ?auto_15438 ) ) ( AVAILABLE ?auto_15437 ) ( IN ?auto_15443 ?auto_15440 ) ( TRUCK-AT ?auto_15440 ?auto_15433 ) ( not ( = ?auto_15433 ?auto_15435 ) ) ( not ( = ?auto_15434 ?auto_15433 ) ) ( not ( = ?auto_15442 ?auto_15433 ) ) ( not ( = ?auto_15439 ?auto_15433 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15429 ?auto_15430 )
      ( MAKE-2CRATE-VERIFY ?auto_15428 ?auto_15429 ?auto_15430 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15446 - SURFACE
      ?auto_15447 - SURFACE
      ?auto_15448 - SURFACE
      ?auto_15449 - SURFACE
    )
    :vars
    (
      ?auto_15454 - HOIST
      ?auto_15463 - PLACE
      ?auto_15460 - PLACE
      ?auto_15456 - HOIST
      ?auto_15458 - SURFACE
      ?auto_15459 - PLACE
      ?auto_15455 - HOIST
      ?auto_15450 - SURFACE
      ?auto_15452 - PLACE
      ?auto_15462 - HOIST
      ?auto_15451 - SURFACE
      ?auto_15457 - SURFACE
      ?auto_15453 - TRUCK
      ?auto_15461 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15454 ?auto_15463 ) ( IS-CRATE ?auto_15449 ) ( not ( = ?auto_15448 ?auto_15449 ) ) ( not ( = ?auto_15447 ?auto_15448 ) ) ( not ( = ?auto_15447 ?auto_15449 ) ) ( not ( = ?auto_15460 ?auto_15463 ) ) ( HOIST-AT ?auto_15456 ?auto_15460 ) ( not ( = ?auto_15454 ?auto_15456 ) ) ( AVAILABLE ?auto_15456 ) ( SURFACE-AT ?auto_15449 ?auto_15460 ) ( ON ?auto_15449 ?auto_15458 ) ( CLEAR ?auto_15449 ) ( not ( = ?auto_15448 ?auto_15458 ) ) ( not ( = ?auto_15449 ?auto_15458 ) ) ( not ( = ?auto_15447 ?auto_15458 ) ) ( IS-CRATE ?auto_15448 ) ( not ( = ?auto_15459 ?auto_15463 ) ) ( not ( = ?auto_15460 ?auto_15459 ) ) ( HOIST-AT ?auto_15455 ?auto_15459 ) ( not ( = ?auto_15454 ?auto_15455 ) ) ( not ( = ?auto_15456 ?auto_15455 ) ) ( AVAILABLE ?auto_15455 ) ( SURFACE-AT ?auto_15448 ?auto_15459 ) ( ON ?auto_15448 ?auto_15450 ) ( CLEAR ?auto_15448 ) ( not ( = ?auto_15448 ?auto_15450 ) ) ( not ( = ?auto_15449 ?auto_15450 ) ) ( not ( = ?auto_15447 ?auto_15450 ) ) ( not ( = ?auto_15458 ?auto_15450 ) ) ( IS-CRATE ?auto_15447 ) ( not ( = ?auto_15446 ?auto_15447 ) ) ( not ( = ?auto_15448 ?auto_15446 ) ) ( not ( = ?auto_15449 ?auto_15446 ) ) ( not ( = ?auto_15458 ?auto_15446 ) ) ( not ( = ?auto_15450 ?auto_15446 ) ) ( not ( = ?auto_15452 ?auto_15463 ) ) ( not ( = ?auto_15460 ?auto_15452 ) ) ( not ( = ?auto_15459 ?auto_15452 ) ) ( HOIST-AT ?auto_15462 ?auto_15452 ) ( not ( = ?auto_15454 ?auto_15462 ) ) ( not ( = ?auto_15456 ?auto_15462 ) ) ( not ( = ?auto_15455 ?auto_15462 ) ) ( AVAILABLE ?auto_15462 ) ( SURFACE-AT ?auto_15447 ?auto_15452 ) ( ON ?auto_15447 ?auto_15451 ) ( CLEAR ?auto_15447 ) ( not ( = ?auto_15448 ?auto_15451 ) ) ( not ( = ?auto_15449 ?auto_15451 ) ) ( not ( = ?auto_15447 ?auto_15451 ) ) ( not ( = ?auto_15458 ?auto_15451 ) ) ( not ( = ?auto_15450 ?auto_15451 ) ) ( not ( = ?auto_15446 ?auto_15451 ) ) ( SURFACE-AT ?auto_15457 ?auto_15463 ) ( CLEAR ?auto_15457 ) ( IS-CRATE ?auto_15446 ) ( not ( = ?auto_15457 ?auto_15446 ) ) ( not ( = ?auto_15448 ?auto_15457 ) ) ( not ( = ?auto_15449 ?auto_15457 ) ) ( not ( = ?auto_15447 ?auto_15457 ) ) ( not ( = ?auto_15458 ?auto_15457 ) ) ( not ( = ?auto_15450 ?auto_15457 ) ) ( not ( = ?auto_15451 ?auto_15457 ) ) ( AVAILABLE ?auto_15454 ) ( IN ?auto_15446 ?auto_15453 ) ( TRUCK-AT ?auto_15453 ?auto_15461 ) ( not ( = ?auto_15461 ?auto_15463 ) ) ( not ( = ?auto_15460 ?auto_15461 ) ) ( not ( = ?auto_15459 ?auto_15461 ) ) ( not ( = ?auto_15452 ?auto_15461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15447 ?auto_15448 ?auto_15449 )
      ( MAKE-3CRATE-VERIFY ?auto_15446 ?auto_15447 ?auto_15448 ?auto_15449 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15464 - SURFACE
      ?auto_15465 - SURFACE
      ?auto_15466 - SURFACE
      ?auto_15467 - SURFACE
      ?auto_15468 - SURFACE
    )
    :vars
    (
      ?auto_15473 - HOIST
      ?auto_15481 - PLACE
      ?auto_15478 - PLACE
      ?auto_15475 - HOIST
      ?auto_15476 - SURFACE
      ?auto_15477 - PLACE
      ?auto_15474 - HOIST
      ?auto_15469 - SURFACE
      ?auto_15471 - PLACE
      ?auto_15480 - HOIST
      ?auto_15470 - SURFACE
      ?auto_15472 - TRUCK
      ?auto_15479 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15473 ?auto_15481 ) ( IS-CRATE ?auto_15468 ) ( not ( = ?auto_15467 ?auto_15468 ) ) ( not ( = ?auto_15466 ?auto_15467 ) ) ( not ( = ?auto_15466 ?auto_15468 ) ) ( not ( = ?auto_15478 ?auto_15481 ) ) ( HOIST-AT ?auto_15475 ?auto_15478 ) ( not ( = ?auto_15473 ?auto_15475 ) ) ( AVAILABLE ?auto_15475 ) ( SURFACE-AT ?auto_15468 ?auto_15478 ) ( ON ?auto_15468 ?auto_15476 ) ( CLEAR ?auto_15468 ) ( not ( = ?auto_15467 ?auto_15476 ) ) ( not ( = ?auto_15468 ?auto_15476 ) ) ( not ( = ?auto_15466 ?auto_15476 ) ) ( IS-CRATE ?auto_15467 ) ( not ( = ?auto_15477 ?auto_15481 ) ) ( not ( = ?auto_15478 ?auto_15477 ) ) ( HOIST-AT ?auto_15474 ?auto_15477 ) ( not ( = ?auto_15473 ?auto_15474 ) ) ( not ( = ?auto_15475 ?auto_15474 ) ) ( AVAILABLE ?auto_15474 ) ( SURFACE-AT ?auto_15467 ?auto_15477 ) ( ON ?auto_15467 ?auto_15469 ) ( CLEAR ?auto_15467 ) ( not ( = ?auto_15467 ?auto_15469 ) ) ( not ( = ?auto_15468 ?auto_15469 ) ) ( not ( = ?auto_15466 ?auto_15469 ) ) ( not ( = ?auto_15476 ?auto_15469 ) ) ( IS-CRATE ?auto_15466 ) ( not ( = ?auto_15465 ?auto_15466 ) ) ( not ( = ?auto_15467 ?auto_15465 ) ) ( not ( = ?auto_15468 ?auto_15465 ) ) ( not ( = ?auto_15476 ?auto_15465 ) ) ( not ( = ?auto_15469 ?auto_15465 ) ) ( not ( = ?auto_15471 ?auto_15481 ) ) ( not ( = ?auto_15478 ?auto_15471 ) ) ( not ( = ?auto_15477 ?auto_15471 ) ) ( HOIST-AT ?auto_15480 ?auto_15471 ) ( not ( = ?auto_15473 ?auto_15480 ) ) ( not ( = ?auto_15475 ?auto_15480 ) ) ( not ( = ?auto_15474 ?auto_15480 ) ) ( AVAILABLE ?auto_15480 ) ( SURFACE-AT ?auto_15466 ?auto_15471 ) ( ON ?auto_15466 ?auto_15470 ) ( CLEAR ?auto_15466 ) ( not ( = ?auto_15467 ?auto_15470 ) ) ( not ( = ?auto_15468 ?auto_15470 ) ) ( not ( = ?auto_15466 ?auto_15470 ) ) ( not ( = ?auto_15476 ?auto_15470 ) ) ( not ( = ?auto_15469 ?auto_15470 ) ) ( not ( = ?auto_15465 ?auto_15470 ) ) ( SURFACE-AT ?auto_15464 ?auto_15481 ) ( CLEAR ?auto_15464 ) ( IS-CRATE ?auto_15465 ) ( not ( = ?auto_15464 ?auto_15465 ) ) ( not ( = ?auto_15467 ?auto_15464 ) ) ( not ( = ?auto_15468 ?auto_15464 ) ) ( not ( = ?auto_15466 ?auto_15464 ) ) ( not ( = ?auto_15476 ?auto_15464 ) ) ( not ( = ?auto_15469 ?auto_15464 ) ) ( not ( = ?auto_15470 ?auto_15464 ) ) ( AVAILABLE ?auto_15473 ) ( IN ?auto_15465 ?auto_15472 ) ( TRUCK-AT ?auto_15472 ?auto_15479 ) ( not ( = ?auto_15479 ?auto_15481 ) ) ( not ( = ?auto_15478 ?auto_15479 ) ) ( not ( = ?auto_15477 ?auto_15479 ) ) ( not ( = ?auto_15471 ?auto_15479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15466 ?auto_15467 ?auto_15468 )
      ( MAKE-4CRATE-VERIFY ?auto_15464 ?auto_15465 ?auto_15466 ?auto_15467 ?auto_15468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15482 - SURFACE
      ?auto_15483 - SURFACE
    )
    :vars
    (
      ?auto_15488 - HOIST
      ?auto_15499 - PLACE
      ?auto_15498 - SURFACE
      ?auto_15495 - PLACE
      ?auto_15491 - HOIST
      ?auto_15493 - SURFACE
      ?auto_15494 - PLACE
      ?auto_15489 - HOIST
      ?auto_15484 - SURFACE
      ?auto_15490 - SURFACE
      ?auto_15486 - PLACE
      ?auto_15497 - HOIST
      ?auto_15485 - SURFACE
      ?auto_15492 - SURFACE
      ?auto_15487 - TRUCK
      ?auto_15496 - PLACE
      ?auto_15500 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15488 ?auto_15499 ) ( IS-CRATE ?auto_15483 ) ( not ( = ?auto_15482 ?auto_15483 ) ) ( not ( = ?auto_15498 ?auto_15482 ) ) ( not ( = ?auto_15498 ?auto_15483 ) ) ( not ( = ?auto_15495 ?auto_15499 ) ) ( HOIST-AT ?auto_15491 ?auto_15495 ) ( not ( = ?auto_15488 ?auto_15491 ) ) ( AVAILABLE ?auto_15491 ) ( SURFACE-AT ?auto_15483 ?auto_15495 ) ( ON ?auto_15483 ?auto_15493 ) ( CLEAR ?auto_15483 ) ( not ( = ?auto_15482 ?auto_15493 ) ) ( not ( = ?auto_15483 ?auto_15493 ) ) ( not ( = ?auto_15498 ?auto_15493 ) ) ( IS-CRATE ?auto_15482 ) ( not ( = ?auto_15494 ?auto_15499 ) ) ( not ( = ?auto_15495 ?auto_15494 ) ) ( HOIST-AT ?auto_15489 ?auto_15494 ) ( not ( = ?auto_15488 ?auto_15489 ) ) ( not ( = ?auto_15491 ?auto_15489 ) ) ( AVAILABLE ?auto_15489 ) ( SURFACE-AT ?auto_15482 ?auto_15494 ) ( ON ?auto_15482 ?auto_15484 ) ( CLEAR ?auto_15482 ) ( not ( = ?auto_15482 ?auto_15484 ) ) ( not ( = ?auto_15483 ?auto_15484 ) ) ( not ( = ?auto_15498 ?auto_15484 ) ) ( not ( = ?auto_15493 ?auto_15484 ) ) ( IS-CRATE ?auto_15498 ) ( not ( = ?auto_15490 ?auto_15498 ) ) ( not ( = ?auto_15482 ?auto_15490 ) ) ( not ( = ?auto_15483 ?auto_15490 ) ) ( not ( = ?auto_15493 ?auto_15490 ) ) ( not ( = ?auto_15484 ?auto_15490 ) ) ( not ( = ?auto_15486 ?auto_15499 ) ) ( not ( = ?auto_15495 ?auto_15486 ) ) ( not ( = ?auto_15494 ?auto_15486 ) ) ( HOIST-AT ?auto_15497 ?auto_15486 ) ( not ( = ?auto_15488 ?auto_15497 ) ) ( not ( = ?auto_15491 ?auto_15497 ) ) ( not ( = ?auto_15489 ?auto_15497 ) ) ( AVAILABLE ?auto_15497 ) ( SURFACE-AT ?auto_15498 ?auto_15486 ) ( ON ?auto_15498 ?auto_15485 ) ( CLEAR ?auto_15498 ) ( not ( = ?auto_15482 ?auto_15485 ) ) ( not ( = ?auto_15483 ?auto_15485 ) ) ( not ( = ?auto_15498 ?auto_15485 ) ) ( not ( = ?auto_15493 ?auto_15485 ) ) ( not ( = ?auto_15484 ?auto_15485 ) ) ( not ( = ?auto_15490 ?auto_15485 ) ) ( SURFACE-AT ?auto_15492 ?auto_15499 ) ( CLEAR ?auto_15492 ) ( IS-CRATE ?auto_15490 ) ( not ( = ?auto_15492 ?auto_15490 ) ) ( not ( = ?auto_15482 ?auto_15492 ) ) ( not ( = ?auto_15483 ?auto_15492 ) ) ( not ( = ?auto_15498 ?auto_15492 ) ) ( not ( = ?auto_15493 ?auto_15492 ) ) ( not ( = ?auto_15484 ?auto_15492 ) ) ( not ( = ?auto_15485 ?auto_15492 ) ) ( AVAILABLE ?auto_15488 ) ( TRUCK-AT ?auto_15487 ?auto_15496 ) ( not ( = ?auto_15496 ?auto_15499 ) ) ( not ( = ?auto_15495 ?auto_15496 ) ) ( not ( = ?auto_15494 ?auto_15496 ) ) ( not ( = ?auto_15486 ?auto_15496 ) ) ( HOIST-AT ?auto_15500 ?auto_15496 ) ( LIFTING ?auto_15500 ?auto_15490 ) ( not ( = ?auto_15488 ?auto_15500 ) ) ( not ( = ?auto_15491 ?auto_15500 ) ) ( not ( = ?auto_15489 ?auto_15500 ) ) ( not ( = ?auto_15497 ?auto_15500 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15500 ?auto_15490 ?auto_15487 ?auto_15496 )
      ( MAKE-2CRATE ?auto_15498 ?auto_15482 ?auto_15483 )
      ( MAKE-1CRATE-VERIFY ?auto_15482 ?auto_15483 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15501 - SURFACE
      ?auto_15502 - SURFACE
      ?auto_15503 - SURFACE
    )
    :vars
    (
      ?auto_15504 - HOIST
      ?auto_15516 - PLACE
      ?auto_15518 - PLACE
      ?auto_15508 - HOIST
      ?auto_15512 - SURFACE
      ?auto_15511 - PLACE
      ?auto_15514 - HOIST
      ?auto_15505 - SURFACE
      ?auto_15509 - SURFACE
      ?auto_15513 - PLACE
      ?auto_15506 - HOIST
      ?auto_15515 - SURFACE
      ?auto_15519 - SURFACE
      ?auto_15507 - TRUCK
      ?auto_15510 - PLACE
      ?auto_15517 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15504 ?auto_15516 ) ( IS-CRATE ?auto_15503 ) ( not ( = ?auto_15502 ?auto_15503 ) ) ( not ( = ?auto_15501 ?auto_15502 ) ) ( not ( = ?auto_15501 ?auto_15503 ) ) ( not ( = ?auto_15518 ?auto_15516 ) ) ( HOIST-AT ?auto_15508 ?auto_15518 ) ( not ( = ?auto_15504 ?auto_15508 ) ) ( AVAILABLE ?auto_15508 ) ( SURFACE-AT ?auto_15503 ?auto_15518 ) ( ON ?auto_15503 ?auto_15512 ) ( CLEAR ?auto_15503 ) ( not ( = ?auto_15502 ?auto_15512 ) ) ( not ( = ?auto_15503 ?auto_15512 ) ) ( not ( = ?auto_15501 ?auto_15512 ) ) ( IS-CRATE ?auto_15502 ) ( not ( = ?auto_15511 ?auto_15516 ) ) ( not ( = ?auto_15518 ?auto_15511 ) ) ( HOIST-AT ?auto_15514 ?auto_15511 ) ( not ( = ?auto_15504 ?auto_15514 ) ) ( not ( = ?auto_15508 ?auto_15514 ) ) ( AVAILABLE ?auto_15514 ) ( SURFACE-AT ?auto_15502 ?auto_15511 ) ( ON ?auto_15502 ?auto_15505 ) ( CLEAR ?auto_15502 ) ( not ( = ?auto_15502 ?auto_15505 ) ) ( not ( = ?auto_15503 ?auto_15505 ) ) ( not ( = ?auto_15501 ?auto_15505 ) ) ( not ( = ?auto_15512 ?auto_15505 ) ) ( IS-CRATE ?auto_15501 ) ( not ( = ?auto_15509 ?auto_15501 ) ) ( not ( = ?auto_15502 ?auto_15509 ) ) ( not ( = ?auto_15503 ?auto_15509 ) ) ( not ( = ?auto_15512 ?auto_15509 ) ) ( not ( = ?auto_15505 ?auto_15509 ) ) ( not ( = ?auto_15513 ?auto_15516 ) ) ( not ( = ?auto_15518 ?auto_15513 ) ) ( not ( = ?auto_15511 ?auto_15513 ) ) ( HOIST-AT ?auto_15506 ?auto_15513 ) ( not ( = ?auto_15504 ?auto_15506 ) ) ( not ( = ?auto_15508 ?auto_15506 ) ) ( not ( = ?auto_15514 ?auto_15506 ) ) ( AVAILABLE ?auto_15506 ) ( SURFACE-AT ?auto_15501 ?auto_15513 ) ( ON ?auto_15501 ?auto_15515 ) ( CLEAR ?auto_15501 ) ( not ( = ?auto_15502 ?auto_15515 ) ) ( not ( = ?auto_15503 ?auto_15515 ) ) ( not ( = ?auto_15501 ?auto_15515 ) ) ( not ( = ?auto_15512 ?auto_15515 ) ) ( not ( = ?auto_15505 ?auto_15515 ) ) ( not ( = ?auto_15509 ?auto_15515 ) ) ( SURFACE-AT ?auto_15519 ?auto_15516 ) ( CLEAR ?auto_15519 ) ( IS-CRATE ?auto_15509 ) ( not ( = ?auto_15519 ?auto_15509 ) ) ( not ( = ?auto_15502 ?auto_15519 ) ) ( not ( = ?auto_15503 ?auto_15519 ) ) ( not ( = ?auto_15501 ?auto_15519 ) ) ( not ( = ?auto_15512 ?auto_15519 ) ) ( not ( = ?auto_15505 ?auto_15519 ) ) ( not ( = ?auto_15515 ?auto_15519 ) ) ( AVAILABLE ?auto_15504 ) ( TRUCK-AT ?auto_15507 ?auto_15510 ) ( not ( = ?auto_15510 ?auto_15516 ) ) ( not ( = ?auto_15518 ?auto_15510 ) ) ( not ( = ?auto_15511 ?auto_15510 ) ) ( not ( = ?auto_15513 ?auto_15510 ) ) ( HOIST-AT ?auto_15517 ?auto_15510 ) ( LIFTING ?auto_15517 ?auto_15509 ) ( not ( = ?auto_15504 ?auto_15517 ) ) ( not ( = ?auto_15508 ?auto_15517 ) ) ( not ( = ?auto_15514 ?auto_15517 ) ) ( not ( = ?auto_15506 ?auto_15517 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15502 ?auto_15503 )
      ( MAKE-2CRATE-VERIFY ?auto_15501 ?auto_15502 ?auto_15503 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15520 - SURFACE
      ?auto_15521 - SURFACE
      ?auto_15522 - SURFACE
      ?auto_15523 - SURFACE
    )
    :vars
    (
      ?auto_15535 - HOIST
      ?auto_15528 - PLACE
      ?auto_15525 - PLACE
      ?auto_15524 - HOIST
      ?auto_15538 - SURFACE
      ?auto_15534 - PLACE
      ?auto_15529 - HOIST
      ?auto_15536 - SURFACE
      ?auto_15532 - PLACE
      ?auto_15533 - HOIST
      ?auto_15526 - SURFACE
      ?auto_15527 - SURFACE
      ?auto_15531 - TRUCK
      ?auto_15537 - PLACE
      ?auto_15530 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15535 ?auto_15528 ) ( IS-CRATE ?auto_15523 ) ( not ( = ?auto_15522 ?auto_15523 ) ) ( not ( = ?auto_15521 ?auto_15522 ) ) ( not ( = ?auto_15521 ?auto_15523 ) ) ( not ( = ?auto_15525 ?auto_15528 ) ) ( HOIST-AT ?auto_15524 ?auto_15525 ) ( not ( = ?auto_15535 ?auto_15524 ) ) ( AVAILABLE ?auto_15524 ) ( SURFACE-AT ?auto_15523 ?auto_15525 ) ( ON ?auto_15523 ?auto_15538 ) ( CLEAR ?auto_15523 ) ( not ( = ?auto_15522 ?auto_15538 ) ) ( not ( = ?auto_15523 ?auto_15538 ) ) ( not ( = ?auto_15521 ?auto_15538 ) ) ( IS-CRATE ?auto_15522 ) ( not ( = ?auto_15534 ?auto_15528 ) ) ( not ( = ?auto_15525 ?auto_15534 ) ) ( HOIST-AT ?auto_15529 ?auto_15534 ) ( not ( = ?auto_15535 ?auto_15529 ) ) ( not ( = ?auto_15524 ?auto_15529 ) ) ( AVAILABLE ?auto_15529 ) ( SURFACE-AT ?auto_15522 ?auto_15534 ) ( ON ?auto_15522 ?auto_15536 ) ( CLEAR ?auto_15522 ) ( not ( = ?auto_15522 ?auto_15536 ) ) ( not ( = ?auto_15523 ?auto_15536 ) ) ( not ( = ?auto_15521 ?auto_15536 ) ) ( not ( = ?auto_15538 ?auto_15536 ) ) ( IS-CRATE ?auto_15521 ) ( not ( = ?auto_15520 ?auto_15521 ) ) ( not ( = ?auto_15522 ?auto_15520 ) ) ( not ( = ?auto_15523 ?auto_15520 ) ) ( not ( = ?auto_15538 ?auto_15520 ) ) ( not ( = ?auto_15536 ?auto_15520 ) ) ( not ( = ?auto_15532 ?auto_15528 ) ) ( not ( = ?auto_15525 ?auto_15532 ) ) ( not ( = ?auto_15534 ?auto_15532 ) ) ( HOIST-AT ?auto_15533 ?auto_15532 ) ( not ( = ?auto_15535 ?auto_15533 ) ) ( not ( = ?auto_15524 ?auto_15533 ) ) ( not ( = ?auto_15529 ?auto_15533 ) ) ( AVAILABLE ?auto_15533 ) ( SURFACE-AT ?auto_15521 ?auto_15532 ) ( ON ?auto_15521 ?auto_15526 ) ( CLEAR ?auto_15521 ) ( not ( = ?auto_15522 ?auto_15526 ) ) ( not ( = ?auto_15523 ?auto_15526 ) ) ( not ( = ?auto_15521 ?auto_15526 ) ) ( not ( = ?auto_15538 ?auto_15526 ) ) ( not ( = ?auto_15536 ?auto_15526 ) ) ( not ( = ?auto_15520 ?auto_15526 ) ) ( SURFACE-AT ?auto_15527 ?auto_15528 ) ( CLEAR ?auto_15527 ) ( IS-CRATE ?auto_15520 ) ( not ( = ?auto_15527 ?auto_15520 ) ) ( not ( = ?auto_15522 ?auto_15527 ) ) ( not ( = ?auto_15523 ?auto_15527 ) ) ( not ( = ?auto_15521 ?auto_15527 ) ) ( not ( = ?auto_15538 ?auto_15527 ) ) ( not ( = ?auto_15536 ?auto_15527 ) ) ( not ( = ?auto_15526 ?auto_15527 ) ) ( AVAILABLE ?auto_15535 ) ( TRUCK-AT ?auto_15531 ?auto_15537 ) ( not ( = ?auto_15537 ?auto_15528 ) ) ( not ( = ?auto_15525 ?auto_15537 ) ) ( not ( = ?auto_15534 ?auto_15537 ) ) ( not ( = ?auto_15532 ?auto_15537 ) ) ( HOIST-AT ?auto_15530 ?auto_15537 ) ( LIFTING ?auto_15530 ?auto_15520 ) ( not ( = ?auto_15535 ?auto_15530 ) ) ( not ( = ?auto_15524 ?auto_15530 ) ) ( not ( = ?auto_15529 ?auto_15530 ) ) ( not ( = ?auto_15533 ?auto_15530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15521 ?auto_15522 ?auto_15523 )
      ( MAKE-3CRATE-VERIFY ?auto_15520 ?auto_15521 ?auto_15522 ?auto_15523 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15539 - SURFACE
      ?auto_15540 - SURFACE
      ?auto_15541 - SURFACE
      ?auto_15542 - SURFACE
      ?auto_15543 - SURFACE
    )
    :vars
    (
      ?auto_15554 - HOIST
      ?auto_15547 - PLACE
      ?auto_15545 - PLACE
      ?auto_15544 - HOIST
      ?auto_15557 - SURFACE
      ?auto_15553 - PLACE
      ?auto_15548 - HOIST
      ?auto_15555 - SURFACE
      ?auto_15551 - PLACE
      ?auto_15552 - HOIST
      ?auto_15546 - SURFACE
      ?auto_15550 - TRUCK
      ?auto_15556 - PLACE
      ?auto_15549 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15554 ?auto_15547 ) ( IS-CRATE ?auto_15543 ) ( not ( = ?auto_15542 ?auto_15543 ) ) ( not ( = ?auto_15541 ?auto_15542 ) ) ( not ( = ?auto_15541 ?auto_15543 ) ) ( not ( = ?auto_15545 ?auto_15547 ) ) ( HOIST-AT ?auto_15544 ?auto_15545 ) ( not ( = ?auto_15554 ?auto_15544 ) ) ( AVAILABLE ?auto_15544 ) ( SURFACE-AT ?auto_15543 ?auto_15545 ) ( ON ?auto_15543 ?auto_15557 ) ( CLEAR ?auto_15543 ) ( not ( = ?auto_15542 ?auto_15557 ) ) ( not ( = ?auto_15543 ?auto_15557 ) ) ( not ( = ?auto_15541 ?auto_15557 ) ) ( IS-CRATE ?auto_15542 ) ( not ( = ?auto_15553 ?auto_15547 ) ) ( not ( = ?auto_15545 ?auto_15553 ) ) ( HOIST-AT ?auto_15548 ?auto_15553 ) ( not ( = ?auto_15554 ?auto_15548 ) ) ( not ( = ?auto_15544 ?auto_15548 ) ) ( AVAILABLE ?auto_15548 ) ( SURFACE-AT ?auto_15542 ?auto_15553 ) ( ON ?auto_15542 ?auto_15555 ) ( CLEAR ?auto_15542 ) ( not ( = ?auto_15542 ?auto_15555 ) ) ( not ( = ?auto_15543 ?auto_15555 ) ) ( not ( = ?auto_15541 ?auto_15555 ) ) ( not ( = ?auto_15557 ?auto_15555 ) ) ( IS-CRATE ?auto_15541 ) ( not ( = ?auto_15540 ?auto_15541 ) ) ( not ( = ?auto_15542 ?auto_15540 ) ) ( not ( = ?auto_15543 ?auto_15540 ) ) ( not ( = ?auto_15557 ?auto_15540 ) ) ( not ( = ?auto_15555 ?auto_15540 ) ) ( not ( = ?auto_15551 ?auto_15547 ) ) ( not ( = ?auto_15545 ?auto_15551 ) ) ( not ( = ?auto_15553 ?auto_15551 ) ) ( HOIST-AT ?auto_15552 ?auto_15551 ) ( not ( = ?auto_15554 ?auto_15552 ) ) ( not ( = ?auto_15544 ?auto_15552 ) ) ( not ( = ?auto_15548 ?auto_15552 ) ) ( AVAILABLE ?auto_15552 ) ( SURFACE-AT ?auto_15541 ?auto_15551 ) ( ON ?auto_15541 ?auto_15546 ) ( CLEAR ?auto_15541 ) ( not ( = ?auto_15542 ?auto_15546 ) ) ( not ( = ?auto_15543 ?auto_15546 ) ) ( not ( = ?auto_15541 ?auto_15546 ) ) ( not ( = ?auto_15557 ?auto_15546 ) ) ( not ( = ?auto_15555 ?auto_15546 ) ) ( not ( = ?auto_15540 ?auto_15546 ) ) ( SURFACE-AT ?auto_15539 ?auto_15547 ) ( CLEAR ?auto_15539 ) ( IS-CRATE ?auto_15540 ) ( not ( = ?auto_15539 ?auto_15540 ) ) ( not ( = ?auto_15542 ?auto_15539 ) ) ( not ( = ?auto_15543 ?auto_15539 ) ) ( not ( = ?auto_15541 ?auto_15539 ) ) ( not ( = ?auto_15557 ?auto_15539 ) ) ( not ( = ?auto_15555 ?auto_15539 ) ) ( not ( = ?auto_15546 ?auto_15539 ) ) ( AVAILABLE ?auto_15554 ) ( TRUCK-AT ?auto_15550 ?auto_15556 ) ( not ( = ?auto_15556 ?auto_15547 ) ) ( not ( = ?auto_15545 ?auto_15556 ) ) ( not ( = ?auto_15553 ?auto_15556 ) ) ( not ( = ?auto_15551 ?auto_15556 ) ) ( HOIST-AT ?auto_15549 ?auto_15556 ) ( LIFTING ?auto_15549 ?auto_15540 ) ( not ( = ?auto_15554 ?auto_15549 ) ) ( not ( = ?auto_15544 ?auto_15549 ) ) ( not ( = ?auto_15548 ?auto_15549 ) ) ( not ( = ?auto_15552 ?auto_15549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15541 ?auto_15542 ?auto_15543 )
      ( MAKE-4CRATE-VERIFY ?auto_15539 ?auto_15540 ?auto_15541 ?auto_15542 ?auto_15543 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15558 - SURFACE
      ?auto_15559 - SURFACE
    )
    :vars
    (
      ?auto_15573 - HOIST
      ?auto_15566 - PLACE
      ?auto_15565 - SURFACE
      ?auto_15561 - PLACE
      ?auto_15560 - HOIST
      ?auto_15576 - SURFACE
      ?auto_15572 - PLACE
      ?auto_15567 - HOIST
      ?auto_15574 - SURFACE
      ?auto_15562 - SURFACE
      ?auto_15570 - PLACE
      ?auto_15571 - HOIST
      ?auto_15563 - SURFACE
      ?auto_15564 - SURFACE
      ?auto_15569 - TRUCK
      ?auto_15575 - PLACE
      ?auto_15568 - HOIST
      ?auto_15577 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15573 ?auto_15566 ) ( IS-CRATE ?auto_15559 ) ( not ( = ?auto_15558 ?auto_15559 ) ) ( not ( = ?auto_15565 ?auto_15558 ) ) ( not ( = ?auto_15565 ?auto_15559 ) ) ( not ( = ?auto_15561 ?auto_15566 ) ) ( HOIST-AT ?auto_15560 ?auto_15561 ) ( not ( = ?auto_15573 ?auto_15560 ) ) ( AVAILABLE ?auto_15560 ) ( SURFACE-AT ?auto_15559 ?auto_15561 ) ( ON ?auto_15559 ?auto_15576 ) ( CLEAR ?auto_15559 ) ( not ( = ?auto_15558 ?auto_15576 ) ) ( not ( = ?auto_15559 ?auto_15576 ) ) ( not ( = ?auto_15565 ?auto_15576 ) ) ( IS-CRATE ?auto_15558 ) ( not ( = ?auto_15572 ?auto_15566 ) ) ( not ( = ?auto_15561 ?auto_15572 ) ) ( HOIST-AT ?auto_15567 ?auto_15572 ) ( not ( = ?auto_15573 ?auto_15567 ) ) ( not ( = ?auto_15560 ?auto_15567 ) ) ( AVAILABLE ?auto_15567 ) ( SURFACE-AT ?auto_15558 ?auto_15572 ) ( ON ?auto_15558 ?auto_15574 ) ( CLEAR ?auto_15558 ) ( not ( = ?auto_15558 ?auto_15574 ) ) ( not ( = ?auto_15559 ?auto_15574 ) ) ( not ( = ?auto_15565 ?auto_15574 ) ) ( not ( = ?auto_15576 ?auto_15574 ) ) ( IS-CRATE ?auto_15565 ) ( not ( = ?auto_15562 ?auto_15565 ) ) ( not ( = ?auto_15558 ?auto_15562 ) ) ( not ( = ?auto_15559 ?auto_15562 ) ) ( not ( = ?auto_15576 ?auto_15562 ) ) ( not ( = ?auto_15574 ?auto_15562 ) ) ( not ( = ?auto_15570 ?auto_15566 ) ) ( not ( = ?auto_15561 ?auto_15570 ) ) ( not ( = ?auto_15572 ?auto_15570 ) ) ( HOIST-AT ?auto_15571 ?auto_15570 ) ( not ( = ?auto_15573 ?auto_15571 ) ) ( not ( = ?auto_15560 ?auto_15571 ) ) ( not ( = ?auto_15567 ?auto_15571 ) ) ( AVAILABLE ?auto_15571 ) ( SURFACE-AT ?auto_15565 ?auto_15570 ) ( ON ?auto_15565 ?auto_15563 ) ( CLEAR ?auto_15565 ) ( not ( = ?auto_15558 ?auto_15563 ) ) ( not ( = ?auto_15559 ?auto_15563 ) ) ( not ( = ?auto_15565 ?auto_15563 ) ) ( not ( = ?auto_15576 ?auto_15563 ) ) ( not ( = ?auto_15574 ?auto_15563 ) ) ( not ( = ?auto_15562 ?auto_15563 ) ) ( SURFACE-AT ?auto_15564 ?auto_15566 ) ( CLEAR ?auto_15564 ) ( IS-CRATE ?auto_15562 ) ( not ( = ?auto_15564 ?auto_15562 ) ) ( not ( = ?auto_15558 ?auto_15564 ) ) ( not ( = ?auto_15559 ?auto_15564 ) ) ( not ( = ?auto_15565 ?auto_15564 ) ) ( not ( = ?auto_15576 ?auto_15564 ) ) ( not ( = ?auto_15574 ?auto_15564 ) ) ( not ( = ?auto_15563 ?auto_15564 ) ) ( AVAILABLE ?auto_15573 ) ( TRUCK-AT ?auto_15569 ?auto_15575 ) ( not ( = ?auto_15575 ?auto_15566 ) ) ( not ( = ?auto_15561 ?auto_15575 ) ) ( not ( = ?auto_15572 ?auto_15575 ) ) ( not ( = ?auto_15570 ?auto_15575 ) ) ( HOIST-AT ?auto_15568 ?auto_15575 ) ( not ( = ?auto_15573 ?auto_15568 ) ) ( not ( = ?auto_15560 ?auto_15568 ) ) ( not ( = ?auto_15567 ?auto_15568 ) ) ( not ( = ?auto_15571 ?auto_15568 ) ) ( AVAILABLE ?auto_15568 ) ( SURFACE-AT ?auto_15562 ?auto_15575 ) ( ON ?auto_15562 ?auto_15577 ) ( CLEAR ?auto_15562 ) ( not ( = ?auto_15558 ?auto_15577 ) ) ( not ( = ?auto_15559 ?auto_15577 ) ) ( not ( = ?auto_15565 ?auto_15577 ) ) ( not ( = ?auto_15576 ?auto_15577 ) ) ( not ( = ?auto_15574 ?auto_15577 ) ) ( not ( = ?auto_15562 ?auto_15577 ) ) ( not ( = ?auto_15563 ?auto_15577 ) ) ( not ( = ?auto_15564 ?auto_15577 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15568 ?auto_15562 ?auto_15577 ?auto_15575 )
      ( MAKE-2CRATE ?auto_15565 ?auto_15558 ?auto_15559 )
      ( MAKE-1CRATE-VERIFY ?auto_15558 ?auto_15559 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15578 - SURFACE
      ?auto_15579 - SURFACE
      ?auto_15580 - SURFACE
    )
    :vars
    (
      ?auto_15586 - HOIST
      ?auto_15587 - PLACE
      ?auto_15592 - PLACE
      ?auto_15597 - HOIST
      ?auto_15583 - SURFACE
      ?auto_15593 - PLACE
      ?auto_15590 - HOIST
      ?auto_15595 - SURFACE
      ?auto_15596 - SURFACE
      ?auto_15585 - PLACE
      ?auto_15588 - HOIST
      ?auto_15584 - SURFACE
      ?auto_15594 - SURFACE
      ?auto_15591 - TRUCK
      ?auto_15589 - PLACE
      ?auto_15582 - HOIST
      ?auto_15581 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15586 ?auto_15587 ) ( IS-CRATE ?auto_15580 ) ( not ( = ?auto_15579 ?auto_15580 ) ) ( not ( = ?auto_15578 ?auto_15579 ) ) ( not ( = ?auto_15578 ?auto_15580 ) ) ( not ( = ?auto_15592 ?auto_15587 ) ) ( HOIST-AT ?auto_15597 ?auto_15592 ) ( not ( = ?auto_15586 ?auto_15597 ) ) ( AVAILABLE ?auto_15597 ) ( SURFACE-AT ?auto_15580 ?auto_15592 ) ( ON ?auto_15580 ?auto_15583 ) ( CLEAR ?auto_15580 ) ( not ( = ?auto_15579 ?auto_15583 ) ) ( not ( = ?auto_15580 ?auto_15583 ) ) ( not ( = ?auto_15578 ?auto_15583 ) ) ( IS-CRATE ?auto_15579 ) ( not ( = ?auto_15593 ?auto_15587 ) ) ( not ( = ?auto_15592 ?auto_15593 ) ) ( HOIST-AT ?auto_15590 ?auto_15593 ) ( not ( = ?auto_15586 ?auto_15590 ) ) ( not ( = ?auto_15597 ?auto_15590 ) ) ( AVAILABLE ?auto_15590 ) ( SURFACE-AT ?auto_15579 ?auto_15593 ) ( ON ?auto_15579 ?auto_15595 ) ( CLEAR ?auto_15579 ) ( not ( = ?auto_15579 ?auto_15595 ) ) ( not ( = ?auto_15580 ?auto_15595 ) ) ( not ( = ?auto_15578 ?auto_15595 ) ) ( not ( = ?auto_15583 ?auto_15595 ) ) ( IS-CRATE ?auto_15578 ) ( not ( = ?auto_15596 ?auto_15578 ) ) ( not ( = ?auto_15579 ?auto_15596 ) ) ( not ( = ?auto_15580 ?auto_15596 ) ) ( not ( = ?auto_15583 ?auto_15596 ) ) ( not ( = ?auto_15595 ?auto_15596 ) ) ( not ( = ?auto_15585 ?auto_15587 ) ) ( not ( = ?auto_15592 ?auto_15585 ) ) ( not ( = ?auto_15593 ?auto_15585 ) ) ( HOIST-AT ?auto_15588 ?auto_15585 ) ( not ( = ?auto_15586 ?auto_15588 ) ) ( not ( = ?auto_15597 ?auto_15588 ) ) ( not ( = ?auto_15590 ?auto_15588 ) ) ( AVAILABLE ?auto_15588 ) ( SURFACE-AT ?auto_15578 ?auto_15585 ) ( ON ?auto_15578 ?auto_15584 ) ( CLEAR ?auto_15578 ) ( not ( = ?auto_15579 ?auto_15584 ) ) ( not ( = ?auto_15580 ?auto_15584 ) ) ( not ( = ?auto_15578 ?auto_15584 ) ) ( not ( = ?auto_15583 ?auto_15584 ) ) ( not ( = ?auto_15595 ?auto_15584 ) ) ( not ( = ?auto_15596 ?auto_15584 ) ) ( SURFACE-AT ?auto_15594 ?auto_15587 ) ( CLEAR ?auto_15594 ) ( IS-CRATE ?auto_15596 ) ( not ( = ?auto_15594 ?auto_15596 ) ) ( not ( = ?auto_15579 ?auto_15594 ) ) ( not ( = ?auto_15580 ?auto_15594 ) ) ( not ( = ?auto_15578 ?auto_15594 ) ) ( not ( = ?auto_15583 ?auto_15594 ) ) ( not ( = ?auto_15595 ?auto_15594 ) ) ( not ( = ?auto_15584 ?auto_15594 ) ) ( AVAILABLE ?auto_15586 ) ( TRUCK-AT ?auto_15591 ?auto_15589 ) ( not ( = ?auto_15589 ?auto_15587 ) ) ( not ( = ?auto_15592 ?auto_15589 ) ) ( not ( = ?auto_15593 ?auto_15589 ) ) ( not ( = ?auto_15585 ?auto_15589 ) ) ( HOIST-AT ?auto_15582 ?auto_15589 ) ( not ( = ?auto_15586 ?auto_15582 ) ) ( not ( = ?auto_15597 ?auto_15582 ) ) ( not ( = ?auto_15590 ?auto_15582 ) ) ( not ( = ?auto_15588 ?auto_15582 ) ) ( AVAILABLE ?auto_15582 ) ( SURFACE-AT ?auto_15596 ?auto_15589 ) ( ON ?auto_15596 ?auto_15581 ) ( CLEAR ?auto_15596 ) ( not ( = ?auto_15579 ?auto_15581 ) ) ( not ( = ?auto_15580 ?auto_15581 ) ) ( not ( = ?auto_15578 ?auto_15581 ) ) ( not ( = ?auto_15583 ?auto_15581 ) ) ( not ( = ?auto_15595 ?auto_15581 ) ) ( not ( = ?auto_15596 ?auto_15581 ) ) ( not ( = ?auto_15584 ?auto_15581 ) ) ( not ( = ?auto_15594 ?auto_15581 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15579 ?auto_15580 )
      ( MAKE-2CRATE-VERIFY ?auto_15578 ?auto_15579 ?auto_15580 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15598 - SURFACE
      ?auto_15599 - SURFACE
      ?auto_15600 - SURFACE
      ?auto_15601 - SURFACE
    )
    :vars
    (
      ?auto_15604 - HOIST
      ?auto_15611 - PLACE
      ?auto_15616 - PLACE
      ?auto_15612 - HOIST
      ?auto_15614 - SURFACE
      ?auto_15617 - PLACE
      ?auto_15609 - HOIST
      ?auto_15602 - SURFACE
      ?auto_15606 - PLACE
      ?auto_15610 - HOIST
      ?auto_15608 - SURFACE
      ?auto_15613 - SURFACE
      ?auto_15605 - TRUCK
      ?auto_15615 - PLACE
      ?auto_15603 - HOIST
      ?auto_15607 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15604 ?auto_15611 ) ( IS-CRATE ?auto_15601 ) ( not ( = ?auto_15600 ?auto_15601 ) ) ( not ( = ?auto_15599 ?auto_15600 ) ) ( not ( = ?auto_15599 ?auto_15601 ) ) ( not ( = ?auto_15616 ?auto_15611 ) ) ( HOIST-AT ?auto_15612 ?auto_15616 ) ( not ( = ?auto_15604 ?auto_15612 ) ) ( AVAILABLE ?auto_15612 ) ( SURFACE-AT ?auto_15601 ?auto_15616 ) ( ON ?auto_15601 ?auto_15614 ) ( CLEAR ?auto_15601 ) ( not ( = ?auto_15600 ?auto_15614 ) ) ( not ( = ?auto_15601 ?auto_15614 ) ) ( not ( = ?auto_15599 ?auto_15614 ) ) ( IS-CRATE ?auto_15600 ) ( not ( = ?auto_15617 ?auto_15611 ) ) ( not ( = ?auto_15616 ?auto_15617 ) ) ( HOIST-AT ?auto_15609 ?auto_15617 ) ( not ( = ?auto_15604 ?auto_15609 ) ) ( not ( = ?auto_15612 ?auto_15609 ) ) ( AVAILABLE ?auto_15609 ) ( SURFACE-AT ?auto_15600 ?auto_15617 ) ( ON ?auto_15600 ?auto_15602 ) ( CLEAR ?auto_15600 ) ( not ( = ?auto_15600 ?auto_15602 ) ) ( not ( = ?auto_15601 ?auto_15602 ) ) ( not ( = ?auto_15599 ?auto_15602 ) ) ( not ( = ?auto_15614 ?auto_15602 ) ) ( IS-CRATE ?auto_15599 ) ( not ( = ?auto_15598 ?auto_15599 ) ) ( not ( = ?auto_15600 ?auto_15598 ) ) ( not ( = ?auto_15601 ?auto_15598 ) ) ( not ( = ?auto_15614 ?auto_15598 ) ) ( not ( = ?auto_15602 ?auto_15598 ) ) ( not ( = ?auto_15606 ?auto_15611 ) ) ( not ( = ?auto_15616 ?auto_15606 ) ) ( not ( = ?auto_15617 ?auto_15606 ) ) ( HOIST-AT ?auto_15610 ?auto_15606 ) ( not ( = ?auto_15604 ?auto_15610 ) ) ( not ( = ?auto_15612 ?auto_15610 ) ) ( not ( = ?auto_15609 ?auto_15610 ) ) ( AVAILABLE ?auto_15610 ) ( SURFACE-AT ?auto_15599 ?auto_15606 ) ( ON ?auto_15599 ?auto_15608 ) ( CLEAR ?auto_15599 ) ( not ( = ?auto_15600 ?auto_15608 ) ) ( not ( = ?auto_15601 ?auto_15608 ) ) ( not ( = ?auto_15599 ?auto_15608 ) ) ( not ( = ?auto_15614 ?auto_15608 ) ) ( not ( = ?auto_15602 ?auto_15608 ) ) ( not ( = ?auto_15598 ?auto_15608 ) ) ( SURFACE-AT ?auto_15613 ?auto_15611 ) ( CLEAR ?auto_15613 ) ( IS-CRATE ?auto_15598 ) ( not ( = ?auto_15613 ?auto_15598 ) ) ( not ( = ?auto_15600 ?auto_15613 ) ) ( not ( = ?auto_15601 ?auto_15613 ) ) ( not ( = ?auto_15599 ?auto_15613 ) ) ( not ( = ?auto_15614 ?auto_15613 ) ) ( not ( = ?auto_15602 ?auto_15613 ) ) ( not ( = ?auto_15608 ?auto_15613 ) ) ( AVAILABLE ?auto_15604 ) ( TRUCK-AT ?auto_15605 ?auto_15615 ) ( not ( = ?auto_15615 ?auto_15611 ) ) ( not ( = ?auto_15616 ?auto_15615 ) ) ( not ( = ?auto_15617 ?auto_15615 ) ) ( not ( = ?auto_15606 ?auto_15615 ) ) ( HOIST-AT ?auto_15603 ?auto_15615 ) ( not ( = ?auto_15604 ?auto_15603 ) ) ( not ( = ?auto_15612 ?auto_15603 ) ) ( not ( = ?auto_15609 ?auto_15603 ) ) ( not ( = ?auto_15610 ?auto_15603 ) ) ( AVAILABLE ?auto_15603 ) ( SURFACE-AT ?auto_15598 ?auto_15615 ) ( ON ?auto_15598 ?auto_15607 ) ( CLEAR ?auto_15598 ) ( not ( = ?auto_15600 ?auto_15607 ) ) ( not ( = ?auto_15601 ?auto_15607 ) ) ( not ( = ?auto_15599 ?auto_15607 ) ) ( not ( = ?auto_15614 ?auto_15607 ) ) ( not ( = ?auto_15602 ?auto_15607 ) ) ( not ( = ?auto_15598 ?auto_15607 ) ) ( not ( = ?auto_15608 ?auto_15607 ) ) ( not ( = ?auto_15613 ?auto_15607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15599 ?auto_15600 ?auto_15601 )
      ( MAKE-3CRATE-VERIFY ?auto_15598 ?auto_15599 ?auto_15600 ?auto_15601 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15618 - SURFACE
      ?auto_15619 - SURFACE
      ?auto_15620 - SURFACE
      ?auto_15621 - SURFACE
      ?auto_15622 - SURFACE
    )
    :vars
    (
      ?auto_15625 - HOIST
      ?auto_15632 - PLACE
      ?auto_15636 - PLACE
      ?auto_15633 - HOIST
      ?auto_15634 - SURFACE
      ?auto_15637 - PLACE
      ?auto_15630 - HOIST
      ?auto_15623 - SURFACE
      ?auto_15627 - PLACE
      ?auto_15631 - HOIST
      ?auto_15629 - SURFACE
      ?auto_15626 - TRUCK
      ?auto_15635 - PLACE
      ?auto_15624 - HOIST
      ?auto_15628 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15625 ?auto_15632 ) ( IS-CRATE ?auto_15622 ) ( not ( = ?auto_15621 ?auto_15622 ) ) ( not ( = ?auto_15620 ?auto_15621 ) ) ( not ( = ?auto_15620 ?auto_15622 ) ) ( not ( = ?auto_15636 ?auto_15632 ) ) ( HOIST-AT ?auto_15633 ?auto_15636 ) ( not ( = ?auto_15625 ?auto_15633 ) ) ( AVAILABLE ?auto_15633 ) ( SURFACE-AT ?auto_15622 ?auto_15636 ) ( ON ?auto_15622 ?auto_15634 ) ( CLEAR ?auto_15622 ) ( not ( = ?auto_15621 ?auto_15634 ) ) ( not ( = ?auto_15622 ?auto_15634 ) ) ( not ( = ?auto_15620 ?auto_15634 ) ) ( IS-CRATE ?auto_15621 ) ( not ( = ?auto_15637 ?auto_15632 ) ) ( not ( = ?auto_15636 ?auto_15637 ) ) ( HOIST-AT ?auto_15630 ?auto_15637 ) ( not ( = ?auto_15625 ?auto_15630 ) ) ( not ( = ?auto_15633 ?auto_15630 ) ) ( AVAILABLE ?auto_15630 ) ( SURFACE-AT ?auto_15621 ?auto_15637 ) ( ON ?auto_15621 ?auto_15623 ) ( CLEAR ?auto_15621 ) ( not ( = ?auto_15621 ?auto_15623 ) ) ( not ( = ?auto_15622 ?auto_15623 ) ) ( not ( = ?auto_15620 ?auto_15623 ) ) ( not ( = ?auto_15634 ?auto_15623 ) ) ( IS-CRATE ?auto_15620 ) ( not ( = ?auto_15619 ?auto_15620 ) ) ( not ( = ?auto_15621 ?auto_15619 ) ) ( not ( = ?auto_15622 ?auto_15619 ) ) ( not ( = ?auto_15634 ?auto_15619 ) ) ( not ( = ?auto_15623 ?auto_15619 ) ) ( not ( = ?auto_15627 ?auto_15632 ) ) ( not ( = ?auto_15636 ?auto_15627 ) ) ( not ( = ?auto_15637 ?auto_15627 ) ) ( HOIST-AT ?auto_15631 ?auto_15627 ) ( not ( = ?auto_15625 ?auto_15631 ) ) ( not ( = ?auto_15633 ?auto_15631 ) ) ( not ( = ?auto_15630 ?auto_15631 ) ) ( AVAILABLE ?auto_15631 ) ( SURFACE-AT ?auto_15620 ?auto_15627 ) ( ON ?auto_15620 ?auto_15629 ) ( CLEAR ?auto_15620 ) ( not ( = ?auto_15621 ?auto_15629 ) ) ( not ( = ?auto_15622 ?auto_15629 ) ) ( not ( = ?auto_15620 ?auto_15629 ) ) ( not ( = ?auto_15634 ?auto_15629 ) ) ( not ( = ?auto_15623 ?auto_15629 ) ) ( not ( = ?auto_15619 ?auto_15629 ) ) ( SURFACE-AT ?auto_15618 ?auto_15632 ) ( CLEAR ?auto_15618 ) ( IS-CRATE ?auto_15619 ) ( not ( = ?auto_15618 ?auto_15619 ) ) ( not ( = ?auto_15621 ?auto_15618 ) ) ( not ( = ?auto_15622 ?auto_15618 ) ) ( not ( = ?auto_15620 ?auto_15618 ) ) ( not ( = ?auto_15634 ?auto_15618 ) ) ( not ( = ?auto_15623 ?auto_15618 ) ) ( not ( = ?auto_15629 ?auto_15618 ) ) ( AVAILABLE ?auto_15625 ) ( TRUCK-AT ?auto_15626 ?auto_15635 ) ( not ( = ?auto_15635 ?auto_15632 ) ) ( not ( = ?auto_15636 ?auto_15635 ) ) ( not ( = ?auto_15637 ?auto_15635 ) ) ( not ( = ?auto_15627 ?auto_15635 ) ) ( HOIST-AT ?auto_15624 ?auto_15635 ) ( not ( = ?auto_15625 ?auto_15624 ) ) ( not ( = ?auto_15633 ?auto_15624 ) ) ( not ( = ?auto_15630 ?auto_15624 ) ) ( not ( = ?auto_15631 ?auto_15624 ) ) ( AVAILABLE ?auto_15624 ) ( SURFACE-AT ?auto_15619 ?auto_15635 ) ( ON ?auto_15619 ?auto_15628 ) ( CLEAR ?auto_15619 ) ( not ( = ?auto_15621 ?auto_15628 ) ) ( not ( = ?auto_15622 ?auto_15628 ) ) ( not ( = ?auto_15620 ?auto_15628 ) ) ( not ( = ?auto_15634 ?auto_15628 ) ) ( not ( = ?auto_15623 ?auto_15628 ) ) ( not ( = ?auto_15619 ?auto_15628 ) ) ( not ( = ?auto_15629 ?auto_15628 ) ) ( not ( = ?auto_15618 ?auto_15628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15620 ?auto_15621 ?auto_15622 )
      ( MAKE-4CRATE-VERIFY ?auto_15618 ?auto_15619 ?auto_15620 ?auto_15621 ?auto_15622 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15638 - SURFACE
      ?auto_15639 - SURFACE
    )
    :vars
    (
      ?auto_15642 - HOIST
      ?auto_15650 - PLACE
      ?auto_15652 - SURFACE
      ?auto_15656 - PLACE
      ?auto_15651 - HOIST
      ?auto_15654 - SURFACE
      ?auto_15657 - PLACE
      ?auto_15648 - HOIST
      ?auto_15640 - SURFACE
      ?auto_15645 - SURFACE
      ?auto_15644 - PLACE
      ?auto_15649 - HOIST
      ?auto_15647 - SURFACE
      ?auto_15653 - SURFACE
      ?auto_15655 - PLACE
      ?auto_15641 - HOIST
      ?auto_15646 - SURFACE
      ?auto_15643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15642 ?auto_15650 ) ( IS-CRATE ?auto_15639 ) ( not ( = ?auto_15638 ?auto_15639 ) ) ( not ( = ?auto_15652 ?auto_15638 ) ) ( not ( = ?auto_15652 ?auto_15639 ) ) ( not ( = ?auto_15656 ?auto_15650 ) ) ( HOIST-AT ?auto_15651 ?auto_15656 ) ( not ( = ?auto_15642 ?auto_15651 ) ) ( AVAILABLE ?auto_15651 ) ( SURFACE-AT ?auto_15639 ?auto_15656 ) ( ON ?auto_15639 ?auto_15654 ) ( CLEAR ?auto_15639 ) ( not ( = ?auto_15638 ?auto_15654 ) ) ( not ( = ?auto_15639 ?auto_15654 ) ) ( not ( = ?auto_15652 ?auto_15654 ) ) ( IS-CRATE ?auto_15638 ) ( not ( = ?auto_15657 ?auto_15650 ) ) ( not ( = ?auto_15656 ?auto_15657 ) ) ( HOIST-AT ?auto_15648 ?auto_15657 ) ( not ( = ?auto_15642 ?auto_15648 ) ) ( not ( = ?auto_15651 ?auto_15648 ) ) ( AVAILABLE ?auto_15648 ) ( SURFACE-AT ?auto_15638 ?auto_15657 ) ( ON ?auto_15638 ?auto_15640 ) ( CLEAR ?auto_15638 ) ( not ( = ?auto_15638 ?auto_15640 ) ) ( not ( = ?auto_15639 ?auto_15640 ) ) ( not ( = ?auto_15652 ?auto_15640 ) ) ( not ( = ?auto_15654 ?auto_15640 ) ) ( IS-CRATE ?auto_15652 ) ( not ( = ?auto_15645 ?auto_15652 ) ) ( not ( = ?auto_15638 ?auto_15645 ) ) ( not ( = ?auto_15639 ?auto_15645 ) ) ( not ( = ?auto_15654 ?auto_15645 ) ) ( not ( = ?auto_15640 ?auto_15645 ) ) ( not ( = ?auto_15644 ?auto_15650 ) ) ( not ( = ?auto_15656 ?auto_15644 ) ) ( not ( = ?auto_15657 ?auto_15644 ) ) ( HOIST-AT ?auto_15649 ?auto_15644 ) ( not ( = ?auto_15642 ?auto_15649 ) ) ( not ( = ?auto_15651 ?auto_15649 ) ) ( not ( = ?auto_15648 ?auto_15649 ) ) ( AVAILABLE ?auto_15649 ) ( SURFACE-AT ?auto_15652 ?auto_15644 ) ( ON ?auto_15652 ?auto_15647 ) ( CLEAR ?auto_15652 ) ( not ( = ?auto_15638 ?auto_15647 ) ) ( not ( = ?auto_15639 ?auto_15647 ) ) ( not ( = ?auto_15652 ?auto_15647 ) ) ( not ( = ?auto_15654 ?auto_15647 ) ) ( not ( = ?auto_15640 ?auto_15647 ) ) ( not ( = ?auto_15645 ?auto_15647 ) ) ( SURFACE-AT ?auto_15653 ?auto_15650 ) ( CLEAR ?auto_15653 ) ( IS-CRATE ?auto_15645 ) ( not ( = ?auto_15653 ?auto_15645 ) ) ( not ( = ?auto_15638 ?auto_15653 ) ) ( not ( = ?auto_15639 ?auto_15653 ) ) ( not ( = ?auto_15652 ?auto_15653 ) ) ( not ( = ?auto_15654 ?auto_15653 ) ) ( not ( = ?auto_15640 ?auto_15653 ) ) ( not ( = ?auto_15647 ?auto_15653 ) ) ( AVAILABLE ?auto_15642 ) ( not ( = ?auto_15655 ?auto_15650 ) ) ( not ( = ?auto_15656 ?auto_15655 ) ) ( not ( = ?auto_15657 ?auto_15655 ) ) ( not ( = ?auto_15644 ?auto_15655 ) ) ( HOIST-AT ?auto_15641 ?auto_15655 ) ( not ( = ?auto_15642 ?auto_15641 ) ) ( not ( = ?auto_15651 ?auto_15641 ) ) ( not ( = ?auto_15648 ?auto_15641 ) ) ( not ( = ?auto_15649 ?auto_15641 ) ) ( AVAILABLE ?auto_15641 ) ( SURFACE-AT ?auto_15645 ?auto_15655 ) ( ON ?auto_15645 ?auto_15646 ) ( CLEAR ?auto_15645 ) ( not ( = ?auto_15638 ?auto_15646 ) ) ( not ( = ?auto_15639 ?auto_15646 ) ) ( not ( = ?auto_15652 ?auto_15646 ) ) ( not ( = ?auto_15654 ?auto_15646 ) ) ( not ( = ?auto_15640 ?auto_15646 ) ) ( not ( = ?auto_15645 ?auto_15646 ) ) ( not ( = ?auto_15647 ?auto_15646 ) ) ( not ( = ?auto_15653 ?auto_15646 ) ) ( TRUCK-AT ?auto_15643 ?auto_15650 ) )
    :subtasks
    ( ( !DRIVE ?auto_15643 ?auto_15650 ?auto_15655 )
      ( MAKE-2CRATE ?auto_15652 ?auto_15638 ?auto_15639 )
      ( MAKE-1CRATE-VERIFY ?auto_15638 ?auto_15639 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15658 - SURFACE
      ?auto_15659 - SURFACE
      ?auto_15660 - SURFACE
    )
    :vars
    (
      ?auto_15669 - HOIST
      ?auto_15676 - PLACE
      ?auto_15662 - PLACE
      ?auto_15664 - HOIST
      ?auto_15674 - SURFACE
      ?auto_15663 - PLACE
      ?auto_15661 - HOIST
      ?auto_15665 - SURFACE
      ?auto_15673 - SURFACE
      ?auto_15667 - PLACE
      ?auto_15670 - HOIST
      ?auto_15671 - SURFACE
      ?auto_15668 - SURFACE
      ?auto_15677 - PLACE
      ?auto_15672 - HOIST
      ?auto_15666 - SURFACE
      ?auto_15675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15669 ?auto_15676 ) ( IS-CRATE ?auto_15660 ) ( not ( = ?auto_15659 ?auto_15660 ) ) ( not ( = ?auto_15658 ?auto_15659 ) ) ( not ( = ?auto_15658 ?auto_15660 ) ) ( not ( = ?auto_15662 ?auto_15676 ) ) ( HOIST-AT ?auto_15664 ?auto_15662 ) ( not ( = ?auto_15669 ?auto_15664 ) ) ( AVAILABLE ?auto_15664 ) ( SURFACE-AT ?auto_15660 ?auto_15662 ) ( ON ?auto_15660 ?auto_15674 ) ( CLEAR ?auto_15660 ) ( not ( = ?auto_15659 ?auto_15674 ) ) ( not ( = ?auto_15660 ?auto_15674 ) ) ( not ( = ?auto_15658 ?auto_15674 ) ) ( IS-CRATE ?auto_15659 ) ( not ( = ?auto_15663 ?auto_15676 ) ) ( not ( = ?auto_15662 ?auto_15663 ) ) ( HOIST-AT ?auto_15661 ?auto_15663 ) ( not ( = ?auto_15669 ?auto_15661 ) ) ( not ( = ?auto_15664 ?auto_15661 ) ) ( AVAILABLE ?auto_15661 ) ( SURFACE-AT ?auto_15659 ?auto_15663 ) ( ON ?auto_15659 ?auto_15665 ) ( CLEAR ?auto_15659 ) ( not ( = ?auto_15659 ?auto_15665 ) ) ( not ( = ?auto_15660 ?auto_15665 ) ) ( not ( = ?auto_15658 ?auto_15665 ) ) ( not ( = ?auto_15674 ?auto_15665 ) ) ( IS-CRATE ?auto_15658 ) ( not ( = ?auto_15673 ?auto_15658 ) ) ( not ( = ?auto_15659 ?auto_15673 ) ) ( not ( = ?auto_15660 ?auto_15673 ) ) ( not ( = ?auto_15674 ?auto_15673 ) ) ( not ( = ?auto_15665 ?auto_15673 ) ) ( not ( = ?auto_15667 ?auto_15676 ) ) ( not ( = ?auto_15662 ?auto_15667 ) ) ( not ( = ?auto_15663 ?auto_15667 ) ) ( HOIST-AT ?auto_15670 ?auto_15667 ) ( not ( = ?auto_15669 ?auto_15670 ) ) ( not ( = ?auto_15664 ?auto_15670 ) ) ( not ( = ?auto_15661 ?auto_15670 ) ) ( AVAILABLE ?auto_15670 ) ( SURFACE-AT ?auto_15658 ?auto_15667 ) ( ON ?auto_15658 ?auto_15671 ) ( CLEAR ?auto_15658 ) ( not ( = ?auto_15659 ?auto_15671 ) ) ( not ( = ?auto_15660 ?auto_15671 ) ) ( not ( = ?auto_15658 ?auto_15671 ) ) ( not ( = ?auto_15674 ?auto_15671 ) ) ( not ( = ?auto_15665 ?auto_15671 ) ) ( not ( = ?auto_15673 ?auto_15671 ) ) ( SURFACE-AT ?auto_15668 ?auto_15676 ) ( CLEAR ?auto_15668 ) ( IS-CRATE ?auto_15673 ) ( not ( = ?auto_15668 ?auto_15673 ) ) ( not ( = ?auto_15659 ?auto_15668 ) ) ( not ( = ?auto_15660 ?auto_15668 ) ) ( not ( = ?auto_15658 ?auto_15668 ) ) ( not ( = ?auto_15674 ?auto_15668 ) ) ( not ( = ?auto_15665 ?auto_15668 ) ) ( not ( = ?auto_15671 ?auto_15668 ) ) ( AVAILABLE ?auto_15669 ) ( not ( = ?auto_15677 ?auto_15676 ) ) ( not ( = ?auto_15662 ?auto_15677 ) ) ( not ( = ?auto_15663 ?auto_15677 ) ) ( not ( = ?auto_15667 ?auto_15677 ) ) ( HOIST-AT ?auto_15672 ?auto_15677 ) ( not ( = ?auto_15669 ?auto_15672 ) ) ( not ( = ?auto_15664 ?auto_15672 ) ) ( not ( = ?auto_15661 ?auto_15672 ) ) ( not ( = ?auto_15670 ?auto_15672 ) ) ( AVAILABLE ?auto_15672 ) ( SURFACE-AT ?auto_15673 ?auto_15677 ) ( ON ?auto_15673 ?auto_15666 ) ( CLEAR ?auto_15673 ) ( not ( = ?auto_15659 ?auto_15666 ) ) ( not ( = ?auto_15660 ?auto_15666 ) ) ( not ( = ?auto_15658 ?auto_15666 ) ) ( not ( = ?auto_15674 ?auto_15666 ) ) ( not ( = ?auto_15665 ?auto_15666 ) ) ( not ( = ?auto_15673 ?auto_15666 ) ) ( not ( = ?auto_15671 ?auto_15666 ) ) ( not ( = ?auto_15668 ?auto_15666 ) ) ( TRUCK-AT ?auto_15675 ?auto_15676 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15659 ?auto_15660 )
      ( MAKE-2CRATE-VERIFY ?auto_15658 ?auto_15659 ?auto_15660 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15678 - SURFACE
      ?auto_15679 - SURFACE
      ?auto_15680 - SURFACE
      ?auto_15681 - SURFACE
    )
    :vars
    (
      ?auto_15686 - HOIST
      ?auto_15682 - PLACE
      ?auto_15695 - PLACE
      ?auto_15685 - HOIST
      ?auto_15693 - SURFACE
      ?auto_15684 - PLACE
      ?auto_15691 - HOIST
      ?auto_15687 - SURFACE
      ?auto_15697 - PLACE
      ?auto_15690 - HOIST
      ?auto_15692 - SURFACE
      ?auto_15696 - SURFACE
      ?auto_15683 - PLACE
      ?auto_15694 - HOIST
      ?auto_15688 - SURFACE
      ?auto_15689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15686 ?auto_15682 ) ( IS-CRATE ?auto_15681 ) ( not ( = ?auto_15680 ?auto_15681 ) ) ( not ( = ?auto_15679 ?auto_15680 ) ) ( not ( = ?auto_15679 ?auto_15681 ) ) ( not ( = ?auto_15695 ?auto_15682 ) ) ( HOIST-AT ?auto_15685 ?auto_15695 ) ( not ( = ?auto_15686 ?auto_15685 ) ) ( AVAILABLE ?auto_15685 ) ( SURFACE-AT ?auto_15681 ?auto_15695 ) ( ON ?auto_15681 ?auto_15693 ) ( CLEAR ?auto_15681 ) ( not ( = ?auto_15680 ?auto_15693 ) ) ( not ( = ?auto_15681 ?auto_15693 ) ) ( not ( = ?auto_15679 ?auto_15693 ) ) ( IS-CRATE ?auto_15680 ) ( not ( = ?auto_15684 ?auto_15682 ) ) ( not ( = ?auto_15695 ?auto_15684 ) ) ( HOIST-AT ?auto_15691 ?auto_15684 ) ( not ( = ?auto_15686 ?auto_15691 ) ) ( not ( = ?auto_15685 ?auto_15691 ) ) ( AVAILABLE ?auto_15691 ) ( SURFACE-AT ?auto_15680 ?auto_15684 ) ( ON ?auto_15680 ?auto_15687 ) ( CLEAR ?auto_15680 ) ( not ( = ?auto_15680 ?auto_15687 ) ) ( not ( = ?auto_15681 ?auto_15687 ) ) ( not ( = ?auto_15679 ?auto_15687 ) ) ( not ( = ?auto_15693 ?auto_15687 ) ) ( IS-CRATE ?auto_15679 ) ( not ( = ?auto_15678 ?auto_15679 ) ) ( not ( = ?auto_15680 ?auto_15678 ) ) ( not ( = ?auto_15681 ?auto_15678 ) ) ( not ( = ?auto_15693 ?auto_15678 ) ) ( not ( = ?auto_15687 ?auto_15678 ) ) ( not ( = ?auto_15697 ?auto_15682 ) ) ( not ( = ?auto_15695 ?auto_15697 ) ) ( not ( = ?auto_15684 ?auto_15697 ) ) ( HOIST-AT ?auto_15690 ?auto_15697 ) ( not ( = ?auto_15686 ?auto_15690 ) ) ( not ( = ?auto_15685 ?auto_15690 ) ) ( not ( = ?auto_15691 ?auto_15690 ) ) ( AVAILABLE ?auto_15690 ) ( SURFACE-AT ?auto_15679 ?auto_15697 ) ( ON ?auto_15679 ?auto_15692 ) ( CLEAR ?auto_15679 ) ( not ( = ?auto_15680 ?auto_15692 ) ) ( not ( = ?auto_15681 ?auto_15692 ) ) ( not ( = ?auto_15679 ?auto_15692 ) ) ( not ( = ?auto_15693 ?auto_15692 ) ) ( not ( = ?auto_15687 ?auto_15692 ) ) ( not ( = ?auto_15678 ?auto_15692 ) ) ( SURFACE-AT ?auto_15696 ?auto_15682 ) ( CLEAR ?auto_15696 ) ( IS-CRATE ?auto_15678 ) ( not ( = ?auto_15696 ?auto_15678 ) ) ( not ( = ?auto_15680 ?auto_15696 ) ) ( not ( = ?auto_15681 ?auto_15696 ) ) ( not ( = ?auto_15679 ?auto_15696 ) ) ( not ( = ?auto_15693 ?auto_15696 ) ) ( not ( = ?auto_15687 ?auto_15696 ) ) ( not ( = ?auto_15692 ?auto_15696 ) ) ( AVAILABLE ?auto_15686 ) ( not ( = ?auto_15683 ?auto_15682 ) ) ( not ( = ?auto_15695 ?auto_15683 ) ) ( not ( = ?auto_15684 ?auto_15683 ) ) ( not ( = ?auto_15697 ?auto_15683 ) ) ( HOIST-AT ?auto_15694 ?auto_15683 ) ( not ( = ?auto_15686 ?auto_15694 ) ) ( not ( = ?auto_15685 ?auto_15694 ) ) ( not ( = ?auto_15691 ?auto_15694 ) ) ( not ( = ?auto_15690 ?auto_15694 ) ) ( AVAILABLE ?auto_15694 ) ( SURFACE-AT ?auto_15678 ?auto_15683 ) ( ON ?auto_15678 ?auto_15688 ) ( CLEAR ?auto_15678 ) ( not ( = ?auto_15680 ?auto_15688 ) ) ( not ( = ?auto_15681 ?auto_15688 ) ) ( not ( = ?auto_15679 ?auto_15688 ) ) ( not ( = ?auto_15693 ?auto_15688 ) ) ( not ( = ?auto_15687 ?auto_15688 ) ) ( not ( = ?auto_15678 ?auto_15688 ) ) ( not ( = ?auto_15692 ?auto_15688 ) ) ( not ( = ?auto_15696 ?auto_15688 ) ) ( TRUCK-AT ?auto_15689 ?auto_15682 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15679 ?auto_15680 ?auto_15681 )
      ( MAKE-3CRATE-VERIFY ?auto_15678 ?auto_15679 ?auto_15680 ?auto_15681 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15698 - SURFACE
      ?auto_15699 - SURFACE
      ?auto_15700 - SURFACE
      ?auto_15701 - SURFACE
      ?auto_15702 - SURFACE
    )
    :vars
    (
      ?auto_15707 - HOIST
      ?auto_15703 - PLACE
      ?auto_15716 - PLACE
      ?auto_15706 - HOIST
      ?auto_15714 - SURFACE
      ?auto_15705 - PLACE
      ?auto_15712 - HOIST
      ?auto_15708 - SURFACE
      ?auto_15717 - PLACE
      ?auto_15711 - HOIST
      ?auto_15713 - SURFACE
      ?auto_15704 - PLACE
      ?auto_15715 - HOIST
      ?auto_15709 - SURFACE
      ?auto_15710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15707 ?auto_15703 ) ( IS-CRATE ?auto_15702 ) ( not ( = ?auto_15701 ?auto_15702 ) ) ( not ( = ?auto_15700 ?auto_15701 ) ) ( not ( = ?auto_15700 ?auto_15702 ) ) ( not ( = ?auto_15716 ?auto_15703 ) ) ( HOIST-AT ?auto_15706 ?auto_15716 ) ( not ( = ?auto_15707 ?auto_15706 ) ) ( AVAILABLE ?auto_15706 ) ( SURFACE-AT ?auto_15702 ?auto_15716 ) ( ON ?auto_15702 ?auto_15714 ) ( CLEAR ?auto_15702 ) ( not ( = ?auto_15701 ?auto_15714 ) ) ( not ( = ?auto_15702 ?auto_15714 ) ) ( not ( = ?auto_15700 ?auto_15714 ) ) ( IS-CRATE ?auto_15701 ) ( not ( = ?auto_15705 ?auto_15703 ) ) ( not ( = ?auto_15716 ?auto_15705 ) ) ( HOIST-AT ?auto_15712 ?auto_15705 ) ( not ( = ?auto_15707 ?auto_15712 ) ) ( not ( = ?auto_15706 ?auto_15712 ) ) ( AVAILABLE ?auto_15712 ) ( SURFACE-AT ?auto_15701 ?auto_15705 ) ( ON ?auto_15701 ?auto_15708 ) ( CLEAR ?auto_15701 ) ( not ( = ?auto_15701 ?auto_15708 ) ) ( not ( = ?auto_15702 ?auto_15708 ) ) ( not ( = ?auto_15700 ?auto_15708 ) ) ( not ( = ?auto_15714 ?auto_15708 ) ) ( IS-CRATE ?auto_15700 ) ( not ( = ?auto_15699 ?auto_15700 ) ) ( not ( = ?auto_15701 ?auto_15699 ) ) ( not ( = ?auto_15702 ?auto_15699 ) ) ( not ( = ?auto_15714 ?auto_15699 ) ) ( not ( = ?auto_15708 ?auto_15699 ) ) ( not ( = ?auto_15717 ?auto_15703 ) ) ( not ( = ?auto_15716 ?auto_15717 ) ) ( not ( = ?auto_15705 ?auto_15717 ) ) ( HOIST-AT ?auto_15711 ?auto_15717 ) ( not ( = ?auto_15707 ?auto_15711 ) ) ( not ( = ?auto_15706 ?auto_15711 ) ) ( not ( = ?auto_15712 ?auto_15711 ) ) ( AVAILABLE ?auto_15711 ) ( SURFACE-AT ?auto_15700 ?auto_15717 ) ( ON ?auto_15700 ?auto_15713 ) ( CLEAR ?auto_15700 ) ( not ( = ?auto_15701 ?auto_15713 ) ) ( not ( = ?auto_15702 ?auto_15713 ) ) ( not ( = ?auto_15700 ?auto_15713 ) ) ( not ( = ?auto_15714 ?auto_15713 ) ) ( not ( = ?auto_15708 ?auto_15713 ) ) ( not ( = ?auto_15699 ?auto_15713 ) ) ( SURFACE-AT ?auto_15698 ?auto_15703 ) ( CLEAR ?auto_15698 ) ( IS-CRATE ?auto_15699 ) ( not ( = ?auto_15698 ?auto_15699 ) ) ( not ( = ?auto_15701 ?auto_15698 ) ) ( not ( = ?auto_15702 ?auto_15698 ) ) ( not ( = ?auto_15700 ?auto_15698 ) ) ( not ( = ?auto_15714 ?auto_15698 ) ) ( not ( = ?auto_15708 ?auto_15698 ) ) ( not ( = ?auto_15713 ?auto_15698 ) ) ( AVAILABLE ?auto_15707 ) ( not ( = ?auto_15704 ?auto_15703 ) ) ( not ( = ?auto_15716 ?auto_15704 ) ) ( not ( = ?auto_15705 ?auto_15704 ) ) ( not ( = ?auto_15717 ?auto_15704 ) ) ( HOIST-AT ?auto_15715 ?auto_15704 ) ( not ( = ?auto_15707 ?auto_15715 ) ) ( not ( = ?auto_15706 ?auto_15715 ) ) ( not ( = ?auto_15712 ?auto_15715 ) ) ( not ( = ?auto_15711 ?auto_15715 ) ) ( AVAILABLE ?auto_15715 ) ( SURFACE-AT ?auto_15699 ?auto_15704 ) ( ON ?auto_15699 ?auto_15709 ) ( CLEAR ?auto_15699 ) ( not ( = ?auto_15701 ?auto_15709 ) ) ( not ( = ?auto_15702 ?auto_15709 ) ) ( not ( = ?auto_15700 ?auto_15709 ) ) ( not ( = ?auto_15714 ?auto_15709 ) ) ( not ( = ?auto_15708 ?auto_15709 ) ) ( not ( = ?auto_15699 ?auto_15709 ) ) ( not ( = ?auto_15713 ?auto_15709 ) ) ( not ( = ?auto_15698 ?auto_15709 ) ) ( TRUCK-AT ?auto_15710 ?auto_15703 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15700 ?auto_15701 ?auto_15702 )
      ( MAKE-4CRATE-VERIFY ?auto_15698 ?auto_15699 ?auto_15700 ?auto_15701 ?auto_15702 ) )
  )

)

