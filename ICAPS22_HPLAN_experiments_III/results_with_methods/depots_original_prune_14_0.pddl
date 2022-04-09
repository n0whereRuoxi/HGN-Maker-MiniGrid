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

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174716 - SURFACE
      ?auto_1174717 - SURFACE
    )
    :vars
    (
      ?auto_1174718 - HOIST
      ?auto_1174719 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174718 ?auto_1174719 ) ( SURFACE-AT ?auto_1174716 ?auto_1174719 ) ( CLEAR ?auto_1174716 ) ( LIFTING ?auto_1174718 ?auto_1174717 ) ( IS-CRATE ?auto_1174717 ) ( not ( = ?auto_1174716 ?auto_1174717 ) ) )
    :subtasks
    ( ( !DROP ?auto_1174718 ?auto_1174717 ?auto_1174716 ?auto_1174719 )
      ( MAKE-1CRATE-VERIFY ?auto_1174716 ?auto_1174717 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174720 - SURFACE
      ?auto_1174721 - SURFACE
    )
    :vars
    (
      ?auto_1174723 - HOIST
      ?auto_1174722 - PLACE
      ?auto_1174724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174723 ?auto_1174722 ) ( SURFACE-AT ?auto_1174720 ?auto_1174722 ) ( CLEAR ?auto_1174720 ) ( IS-CRATE ?auto_1174721 ) ( not ( = ?auto_1174720 ?auto_1174721 ) ) ( TRUCK-AT ?auto_1174724 ?auto_1174722 ) ( AVAILABLE ?auto_1174723 ) ( IN ?auto_1174721 ?auto_1174724 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1174723 ?auto_1174721 ?auto_1174724 ?auto_1174722 )
      ( MAKE-1CRATE ?auto_1174720 ?auto_1174721 )
      ( MAKE-1CRATE-VERIFY ?auto_1174720 ?auto_1174721 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174725 - SURFACE
      ?auto_1174726 - SURFACE
    )
    :vars
    (
      ?auto_1174729 - HOIST
      ?auto_1174728 - PLACE
      ?auto_1174727 - TRUCK
      ?auto_1174730 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174729 ?auto_1174728 ) ( SURFACE-AT ?auto_1174725 ?auto_1174728 ) ( CLEAR ?auto_1174725 ) ( IS-CRATE ?auto_1174726 ) ( not ( = ?auto_1174725 ?auto_1174726 ) ) ( AVAILABLE ?auto_1174729 ) ( IN ?auto_1174726 ?auto_1174727 ) ( TRUCK-AT ?auto_1174727 ?auto_1174730 ) ( not ( = ?auto_1174730 ?auto_1174728 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1174727 ?auto_1174730 ?auto_1174728 )
      ( MAKE-1CRATE ?auto_1174725 ?auto_1174726 )
      ( MAKE-1CRATE-VERIFY ?auto_1174725 ?auto_1174726 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174731 - SURFACE
      ?auto_1174732 - SURFACE
    )
    :vars
    (
      ?auto_1174736 - HOIST
      ?auto_1174733 - PLACE
      ?auto_1174735 - TRUCK
      ?auto_1174734 - PLACE
      ?auto_1174737 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174736 ?auto_1174733 ) ( SURFACE-AT ?auto_1174731 ?auto_1174733 ) ( CLEAR ?auto_1174731 ) ( IS-CRATE ?auto_1174732 ) ( not ( = ?auto_1174731 ?auto_1174732 ) ) ( AVAILABLE ?auto_1174736 ) ( TRUCK-AT ?auto_1174735 ?auto_1174734 ) ( not ( = ?auto_1174734 ?auto_1174733 ) ) ( HOIST-AT ?auto_1174737 ?auto_1174734 ) ( LIFTING ?auto_1174737 ?auto_1174732 ) ( not ( = ?auto_1174736 ?auto_1174737 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1174737 ?auto_1174732 ?auto_1174735 ?auto_1174734 )
      ( MAKE-1CRATE ?auto_1174731 ?auto_1174732 )
      ( MAKE-1CRATE-VERIFY ?auto_1174731 ?auto_1174732 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174738 - SURFACE
      ?auto_1174739 - SURFACE
    )
    :vars
    (
      ?auto_1174744 - HOIST
      ?auto_1174741 - PLACE
      ?auto_1174740 - TRUCK
      ?auto_1174743 - PLACE
      ?auto_1174742 - HOIST
      ?auto_1174745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174744 ?auto_1174741 ) ( SURFACE-AT ?auto_1174738 ?auto_1174741 ) ( CLEAR ?auto_1174738 ) ( IS-CRATE ?auto_1174739 ) ( not ( = ?auto_1174738 ?auto_1174739 ) ) ( AVAILABLE ?auto_1174744 ) ( TRUCK-AT ?auto_1174740 ?auto_1174743 ) ( not ( = ?auto_1174743 ?auto_1174741 ) ) ( HOIST-AT ?auto_1174742 ?auto_1174743 ) ( not ( = ?auto_1174744 ?auto_1174742 ) ) ( AVAILABLE ?auto_1174742 ) ( SURFACE-AT ?auto_1174739 ?auto_1174743 ) ( ON ?auto_1174739 ?auto_1174745 ) ( CLEAR ?auto_1174739 ) ( not ( = ?auto_1174738 ?auto_1174745 ) ) ( not ( = ?auto_1174739 ?auto_1174745 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1174742 ?auto_1174739 ?auto_1174745 ?auto_1174743 )
      ( MAKE-1CRATE ?auto_1174738 ?auto_1174739 )
      ( MAKE-1CRATE-VERIFY ?auto_1174738 ?auto_1174739 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174746 - SURFACE
      ?auto_1174747 - SURFACE
    )
    :vars
    (
      ?auto_1174752 - HOIST
      ?auto_1174749 - PLACE
      ?auto_1174748 - PLACE
      ?auto_1174751 - HOIST
      ?auto_1174753 - SURFACE
      ?auto_1174750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174752 ?auto_1174749 ) ( SURFACE-AT ?auto_1174746 ?auto_1174749 ) ( CLEAR ?auto_1174746 ) ( IS-CRATE ?auto_1174747 ) ( not ( = ?auto_1174746 ?auto_1174747 ) ) ( AVAILABLE ?auto_1174752 ) ( not ( = ?auto_1174748 ?auto_1174749 ) ) ( HOIST-AT ?auto_1174751 ?auto_1174748 ) ( not ( = ?auto_1174752 ?auto_1174751 ) ) ( AVAILABLE ?auto_1174751 ) ( SURFACE-AT ?auto_1174747 ?auto_1174748 ) ( ON ?auto_1174747 ?auto_1174753 ) ( CLEAR ?auto_1174747 ) ( not ( = ?auto_1174746 ?auto_1174753 ) ) ( not ( = ?auto_1174747 ?auto_1174753 ) ) ( TRUCK-AT ?auto_1174750 ?auto_1174749 ) )
    :subtasks
    ( ( !DRIVE ?auto_1174750 ?auto_1174749 ?auto_1174748 )
      ( MAKE-1CRATE ?auto_1174746 ?auto_1174747 )
      ( MAKE-1CRATE-VERIFY ?auto_1174746 ?auto_1174747 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174763 - SURFACE
      ?auto_1174764 - SURFACE
      ?auto_1174765 - SURFACE
    )
    :vars
    (
      ?auto_1174767 - HOIST
      ?auto_1174766 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174767 ?auto_1174766 ) ( SURFACE-AT ?auto_1174764 ?auto_1174766 ) ( CLEAR ?auto_1174764 ) ( LIFTING ?auto_1174767 ?auto_1174765 ) ( IS-CRATE ?auto_1174765 ) ( not ( = ?auto_1174764 ?auto_1174765 ) ) ( ON ?auto_1174764 ?auto_1174763 ) ( not ( = ?auto_1174763 ?auto_1174764 ) ) ( not ( = ?auto_1174763 ?auto_1174765 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174764 ?auto_1174765 )
      ( MAKE-2CRATE-VERIFY ?auto_1174763 ?auto_1174764 ?auto_1174765 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174773 - SURFACE
      ?auto_1174774 - SURFACE
      ?auto_1174775 - SURFACE
    )
    :vars
    (
      ?auto_1174778 - HOIST
      ?auto_1174777 - PLACE
      ?auto_1174776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174778 ?auto_1174777 ) ( SURFACE-AT ?auto_1174774 ?auto_1174777 ) ( CLEAR ?auto_1174774 ) ( IS-CRATE ?auto_1174775 ) ( not ( = ?auto_1174774 ?auto_1174775 ) ) ( TRUCK-AT ?auto_1174776 ?auto_1174777 ) ( AVAILABLE ?auto_1174778 ) ( IN ?auto_1174775 ?auto_1174776 ) ( ON ?auto_1174774 ?auto_1174773 ) ( not ( = ?auto_1174773 ?auto_1174774 ) ) ( not ( = ?auto_1174773 ?auto_1174775 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174774 ?auto_1174775 )
      ( MAKE-2CRATE-VERIFY ?auto_1174773 ?auto_1174774 ?auto_1174775 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174779 - SURFACE
      ?auto_1174780 - SURFACE
    )
    :vars
    (
      ?auto_1174784 - HOIST
      ?auto_1174782 - PLACE
      ?auto_1174781 - TRUCK
      ?auto_1174783 - SURFACE
      ?auto_1174785 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174784 ?auto_1174782 ) ( SURFACE-AT ?auto_1174779 ?auto_1174782 ) ( CLEAR ?auto_1174779 ) ( IS-CRATE ?auto_1174780 ) ( not ( = ?auto_1174779 ?auto_1174780 ) ) ( AVAILABLE ?auto_1174784 ) ( IN ?auto_1174780 ?auto_1174781 ) ( ON ?auto_1174779 ?auto_1174783 ) ( not ( = ?auto_1174783 ?auto_1174779 ) ) ( not ( = ?auto_1174783 ?auto_1174780 ) ) ( TRUCK-AT ?auto_1174781 ?auto_1174785 ) ( not ( = ?auto_1174785 ?auto_1174782 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1174781 ?auto_1174785 ?auto_1174782 )
      ( MAKE-2CRATE ?auto_1174783 ?auto_1174779 ?auto_1174780 )
      ( MAKE-1CRATE-VERIFY ?auto_1174779 ?auto_1174780 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174786 - SURFACE
      ?auto_1174787 - SURFACE
      ?auto_1174788 - SURFACE
    )
    :vars
    (
      ?auto_1174790 - HOIST
      ?auto_1174792 - PLACE
      ?auto_1174789 - TRUCK
      ?auto_1174791 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174790 ?auto_1174792 ) ( SURFACE-AT ?auto_1174787 ?auto_1174792 ) ( CLEAR ?auto_1174787 ) ( IS-CRATE ?auto_1174788 ) ( not ( = ?auto_1174787 ?auto_1174788 ) ) ( AVAILABLE ?auto_1174790 ) ( IN ?auto_1174788 ?auto_1174789 ) ( ON ?auto_1174787 ?auto_1174786 ) ( not ( = ?auto_1174786 ?auto_1174787 ) ) ( not ( = ?auto_1174786 ?auto_1174788 ) ) ( TRUCK-AT ?auto_1174789 ?auto_1174791 ) ( not ( = ?auto_1174791 ?auto_1174792 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174787 ?auto_1174788 )
      ( MAKE-2CRATE-VERIFY ?auto_1174786 ?auto_1174787 ?auto_1174788 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174793 - SURFACE
      ?auto_1174794 - SURFACE
    )
    :vars
    (
      ?auto_1174797 - HOIST
      ?auto_1174795 - PLACE
      ?auto_1174799 - SURFACE
      ?auto_1174796 - TRUCK
      ?auto_1174798 - PLACE
      ?auto_1174800 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174797 ?auto_1174795 ) ( SURFACE-AT ?auto_1174793 ?auto_1174795 ) ( CLEAR ?auto_1174793 ) ( IS-CRATE ?auto_1174794 ) ( not ( = ?auto_1174793 ?auto_1174794 ) ) ( AVAILABLE ?auto_1174797 ) ( ON ?auto_1174793 ?auto_1174799 ) ( not ( = ?auto_1174799 ?auto_1174793 ) ) ( not ( = ?auto_1174799 ?auto_1174794 ) ) ( TRUCK-AT ?auto_1174796 ?auto_1174798 ) ( not ( = ?auto_1174798 ?auto_1174795 ) ) ( HOIST-AT ?auto_1174800 ?auto_1174798 ) ( LIFTING ?auto_1174800 ?auto_1174794 ) ( not ( = ?auto_1174797 ?auto_1174800 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1174800 ?auto_1174794 ?auto_1174796 ?auto_1174798 )
      ( MAKE-2CRATE ?auto_1174799 ?auto_1174793 ?auto_1174794 )
      ( MAKE-1CRATE-VERIFY ?auto_1174793 ?auto_1174794 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174801 - SURFACE
      ?auto_1174802 - SURFACE
      ?auto_1174803 - SURFACE
    )
    :vars
    (
      ?auto_1174808 - HOIST
      ?auto_1174807 - PLACE
      ?auto_1174804 - TRUCK
      ?auto_1174806 - PLACE
      ?auto_1174805 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174808 ?auto_1174807 ) ( SURFACE-AT ?auto_1174802 ?auto_1174807 ) ( CLEAR ?auto_1174802 ) ( IS-CRATE ?auto_1174803 ) ( not ( = ?auto_1174802 ?auto_1174803 ) ) ( AVAILABLE ?auto_1174808 ) ( ON ?auto_1174802 ?auto_1174801 ) ( not ( = ?auto_1174801 ?auto_1174802 ) ) ( not ( = ?auto_1174801 ?auto_1174803 ) ) ( TRUCK-AT ?auto_1174804 ?auto_1174806 ) ( not ( = ?auto_1174806 ?auto_1174807 ) ) ( HOIST-AT ?auto_1174805 ?auto_1174806 ) ( LIFTING ?auto_1174805 ?auto_1174803 ) ( not ( = ?auto_1174808 ?auto_1174805 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174802 ?auto_1174803 )
      ( MAKE-2CRATE-VERIFY ?auto_1174801 ?auto_1174802 ?auto_1174803 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174809 - SURFACE
      ?auto_1174810 - SURFACE
    )
    :vars
    (
      ?auto_1174811 - HOIST
      ?auto_1174812 - PLACE
      ?auto_1174814 - SURFACE
      ?auto_1174815 - TRUCK
      ?auto_1174816 - PLACE
      ?auto_1174813 - HOIST
      ?auto_1174817 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174811 ?auto_1174812 ) ( SURFACE-AT ?auto_1174809 ?auto_1174812 ) ( CLEAR ?auto_1174809 ) ( IS-CRATE ?auto_1174810 ) ( not ( = ?auto_1174809 ?auto_1174810 ) ) ( AVAILABLE ?auto_1174811 ) ( ON ?auto_1174809 ?auto_1174814 ) ( not ( = ?auto_1174814 ?auto_1174809 ) ) ( not ( = ?auto_1174814 ?auto_1174810 ) ) ( TRUCK-AT ?auto_1174815 ?auto_1174816 ) ( not ( = ?auto_1174816 ?auto_1174812 ) ) ( HOIST-AT ?auto_1174813 ?auto_1174816 ) ( not ( = ?auto_1174811 ?auto_1174813 ) ) ( AVAILABLE ?auto_1174813 ) ( SURFACE-AT ?auto_1174810 ?auto_1174816 ) ( ON ?auto_1174810 ?auto_1174817 ) ( CLEAR ?auto_1174810 ) ( not ( = ?auto_1174809 ?auto_1174817 ) ) ( not ( = ?auto_1174810 ?auto_1174817 ) ) ( not ( = ?auto_1174814 ?auto_1174817 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1174813 ?auto_1174810 ?auto_1174817 ?auto_1174816 )
      ( MAKE-2CRATE ?auto_1174814 ?auto_1174809 ?auto_1174810 )
      ( MAKE-1CRATE-VERIFY ?auto_1174809 ?auto_1174810 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174818 - SURFACE
      ?auto_1174819 - SURFACE
      ?auto_1174820 - SURFACE
    )
    :vars
    (
      ?auto_1174823 - HOIST
      ?auto_1174822 - PLACE
      ?auto_1174824 - TRUCK
      ?auto_1174826 - PLACE
      ?auto_1174825 - HOIST
      ?auto_1174821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174823 ?auto_1174822 ) ( SURFACE-AT ?auto_1174819 ?auto_1174822 ) ( CLEAR ?auto_1174819 ) ( IS-CRATE ?auto_1174820 ) ( not ( = ?auto_1174819 ?auto_1174820 ) ) ( AVAILABLE ?auto_1174823 ) ( ON ?auto_1174819 ?auto_1174818 ) ( not ( = ?auto_1174818 ?auto_1174819 ) ) ( not ( = ?auto_1174818 ?auto_1174820 ) ) ( TRUCK-AT ?auto_1174824 ?auto_1174826 ) ( not ( = ?auto_1174826 ?auto_1174822 ) ) ( HOIST-AT ?auto_1174825 ?auto_1174826 ) ( not ( = ?auto_1174823 ?auto_1174825 ) ) ( AVAILABLE ?auto_1174825 ) ( SURFACE-AT ?auto_1174820 ?auto_1174826 ) ( ON ?auto_1174820 ?auto_1174821 ) ( CLEAR ?auto_1174820 ) ( not ( = ?auto_1174819 ?auto_1174821 ) ) ( not ( = ?auto_1174820 ?auto_1174821 ) ) ( not ( = ?auto_1174818 ?auto_1174821 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174819 ?auto_1174820 )
      ( MAKE-2CRATE-VERIFY ?auto_1174818 ?auto_1174819 ?auto_1174820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174827 - SURFACE
      ?auto_1174828 - SURFACE
    )
    :vars
    (
      ?auto_1174833 - HOIST
      ?auto_1174829 - PLACE
      ?auto_1174831 - SURFACE
      ?auto_1174830 - PLACE
      ?auto_1174834 - HOIST
      ?auto_1174832 - SURFACE
      ?auto_1174835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174833 ?auto_1174829 ) ( SURFACE-AT ?auto_1174827 ?auto_1174829 ) ( CLEAR ?auto_1174827 ) ( IS-CRATE ?auto_1174828 ) ( not ( = ?auto_1174827 ?auto_1174828 ) ) ( AVAILABLE ?auto_1174833 ) ( ON ?auto_1174827 ?auto_1174831 ) ( not ( = ?auto_1174831 ?auto_1174827 ) ) ( not ( = ?auto_1174831 ?auto_1174828 ) ) ( not ( = ?auto_1174830 ?auto_1174829 ) ) ( HOIST-AT ?auto_1174834 ?auto_1174830 ) ( not ( = ?auto_1174833 ?auto_1174834 ) ) ( AVAILABLE ?auto_1174834 ) ( SURFACE-AT ?auto_1174828 ?auto_1174830 ) ( ON ?auto_1174828 ?auto_1174832 ) ( CLEAR ?auto_1174828 ) ( not ( = ?auto_1174827 ?auto_1174832 ) ) ( not ( = ?auto_1174828 ?auto_1174832 ) ) ( not ( = ?auto_1174831 ?auto_1174832 ) ) ( TRUCK-AT ?auto_1174835 ?auto_1174829 ) )
    :subtasks
    ( ( !DRIVE ?auto_1174835 ?auto_1174829 ?auto_1174830 )
      ( MAKE-2CRATE ?auto_1174831 ?auto_1174827 ?auto_1174828 )
      ( MAKE-1CRATE-VERIFY ?auto_1174827 ?auto_1174828 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174836 - SURFACE
      ?auto_1174837 - SURFACE
      ?auto_1174838 - SURFACE
    )
    :vars
    (
      ?auto_1174841 - HOIST
      ?auto_1174844 - PLACE
      ?auto_1174839 - PLACE
      ?auto_1174843 - HOIST
      ?auto_1174840 - SURFACE
      ?auto_1174842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174841 ?auto_1174844 ) ( SURFACE-AT ?auto_1174837 ?auto_1174844 ) ( CLEAR ?auto_1174837 ) ( IS-CRATE ?auto_1174838 ) ( not ( = ?auto_1174837 ?auto_1174838 ) ) ( AVAILABLE ?auto_1174841 ) ( ON ?auto_1174837 ?auto_1174836 ) ( not ( = ?auto_1174836 ?auto_1174837 ) ) ( not ( = ?auto_1174836 ?auto_1174838 ) ) ( not ( = ?auto_1174839 ?auto_1174844 ) ) ( HOIST-AT ?auto_1174843 ?auto_1174839 ) ( not ( = ?auto_1174841 ?auto_1174843 ) ) ( AVAILABLE ?auto_1174843 ) ( SURFACE-AT ?auto_1174838 ?auto_1174839 ) ( ON ?auto_1174838 ?auto_1174840 ) ( CLEAR ?auto_1174838 ) ( not ( = ?auto_1174837 ?auto_1174840 ) ) ( not ( = ?auto_1174838 ?auto_1174840 ) ) ( not ( = ?auto_1174836 ?auto_1174840 ) ) ( TRUCK-AT ?auto_1174842 ?auto_1174844 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174837 ?auto_1174838 )
      ( MAKE-2CRATE-VERIFY ?auto_1174836 ?auto_1174837 ?auto_1174838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174845 - SURFACE
      ?auto_1174846 - SURFACE
    )
    :vars
    (
      ?auto_1174850 - HOIST
      ?auto_1174852 - PLACE
      ?auto_1174849 - SURFACE
      ?auto_1174853 - PLACE
      ?auto_1174851 - HOIST
      ?auto_1174847 - SURFACE
      ?auto_1174848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174850 ?auto_1174852 ) ( IS-CRATE ?auto_1174846 ) ( not ( = ?auto_1174845 ?auto_1174846 ) ) ( not ( = ?auto_1174849 ?auto_1174845 ) ) ( not ( = ?auto_1174849 ?auto_1174846 ) ) ( not ( = ?auto_1174853 ?auto_1174852 ) ) ( HOIST-AT ?auto_1174851 ?auto_1174853 ) ( not ( = ?auto_1174850 ?auto_1174851 ) ) ( AVAILABLE ?auto_1174851 ) ( SURFACE-AT ?auto_1174846 ?auto_1174853 ) ( ON ?auto_1174846 ?auto_1174847 ) ( CLEAR ?auto_1174846 ) ( not ( = ?auto_1174845 ?auto_1174847 ) ) ( not ( = ?auto_1174846 ?auto_1174847 ) ) ( not ( = ?auto_1174849 ?auto_1174847 ) ) ( TRUCK-AT ?auto_1174848 ?auto_1174852 ) ( SURFACE-AT ?auto_1174849 ?auto_1174852 ) ( CLEAR ?auto_1174849 ) ( LIFTING ?auto_1174850 ?auto_1174845 ) ( IS-CRATE ?auto_1174845 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174849 ?auto_1174845 )
      ( MAKE-2CRATE ?auto_1174849 ?auto_1174845 ?auto_1174846 )
      ( MAKE-1CRATE-VERIFY ?auto_1174845 ?auto_1174846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174854 - SURFACE
      ?auto_1174855 - SURFACE
      ?auto_1174856 - SURFACE
    )
    :vars
    (
      ?auto_1174857 - HOIST
      ?auto_1174861 - PLACE
      ?auto_1174859 - PLACE
      ?auto_1174858 - HOIST
      ?auto_1174862 - SURFACE
      ?auto_1174860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174857 ?auto_1174861 ) ( IS-CRATE ?auto_1174856 ) ( not ( = ?auto_1174855 ?auto_1174856 ) ) ( not ( = ?auto_1174854 ?auto_1174855 ) ) ( not ( = ?auto_1174854 ?auto_1174856 ) ) ( not ( = ?auto_1174859 ?auto_1174861 ) ) ( HOIST-AT ?auto_1174858 ?auto_1174859 ) ( not ( = ?auto_1174857 ?auto_1174858 ) ) ( AVAILABLE ?auto_1174858 ) ( SURFACE-AT ?auto_1174856 ?auto_1174859 ) ( ON ?auto_1174856 ?auto_1174862 ) ( CLEAR ?auto_1174856 ) ( not ( = ?auto_1174855 ?auto_1174862 ) ) ( not ( = ?auto_1174856 ?auto_1174862 ) ) ( not ( = ?auto_1174854 ?auto_1174862 ) ) ( TRUCK-AT ?auto_1174860 ?auto_1174861 ) ( SURFACE-AT ?auto_1174854 ?auto_1174861 ) ( CLEAR ?auto_1174854 ) ( LIFTING ?auto_1174857 ?auto_1174855 ) ( IS-CRATE ?auto_1174855 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174855 ?auto_1174856 )
      ( MAKE-2CRATE-VERIFY ?auto_1174854 ?auto_1174855 ?auto_1174856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174863 - SURFACE
      ?auto_1174864 - SURFACE
    )
    :vars
    (
      ?auto_1174867 - HOIST
      ?auto_1174869 - PLACE
      ?auto_1174866 - SURFACE
      ?auto_1174868 - PLACE
      ?auto_1174865 - HOIST
      ?auto_1174870 - SURFACE
      ?auto_1174871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174867 ?auto_1174869 ) ( IS-CRATE ?auto_1174864 ) ( not ( = ?auto_1174863 ?auto_1174864 ) ) ( not ( = ?auto_1174866 ?auto_1174863 ) ) ( not ( = ?auto_1174866 ?auto_1174864 ) ) ( not ( = ?auto_1174868 ?auto_1174869 ) ) ( HOIST-AT ?auto_1174865 ?auto_1174868 ) ( not ( = ?auto_1174867 ?auto_1174865 ) ) ( AVAILABLE ?auto_1174865 ) ( SURFACE-AT ?auto_1174864 ?auto_1174868 ) ( ON ?auto_1174864 ?auto_1174870 ) ( CLEAR ?auto_1174864 ) ( not ( = ?auto_1174863 ?auto_1174870 ) ) ( not ( = ?auto_1174864 ?auto_1174870 ) ) ( not ( = ?auto_1174866 ?auto_1174870 ) ) ( TRUCK-AT ?auto_1174871 ?auto_1174869 ) ( SURFACE-AT ?auto_1174866 ?auto_1174869 ) ( CLEAR ?auto_1174866 ) ( IS-CRATE ?auto_1174863 ) ( AVAILABLE ?auto_1174867 ) ( IN ?auto_1174863 ?auto_1174871 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1174867 ?auto_1174863 ?auto_1174871 ?auto_1174869 )
      ( MAKE-2CRATE ?auto_1174866 ?auto_1174863 ?auto_1174864 )
      ( MAKE-1CRATE-VERIFY ?auto_1174863 ?auto_1174864 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1174872 - SURFACE
      ?auto_1174873 - SURFACE
      ?auto_1174874 - SURFACE
    )
    :vars
    (
      ?auto_1174879 - HOIST
      ?auto_1174878 - PLACE
      ?auto_1174875 - PLACE
      ?auto_1174877 - HOIST
      ?auto_1174880 - SURFACE
      ?auto_1174876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174879 ?auto_1174878 ) ( IS-CRATE ?auto_1174874 ) ( not ( = ?auto_1174873 ?auto_1174874 ) ) ( not ( = ?auto_1174872 ?auto_1174873 ) ) ( not ( = ?auto_1174872 ?auto_1174874 ) ) ( not ( = ?auto_1174875 ?auto_1174878 ) ) ( HOIST-AT ?auto_1174877 ?auto_1174875 ) ( not ( = ?auto_1174879 ?auto_1174877 ) ) ( AVAILABLE ?auto_1174877 ) ( SURFACE-AT ?auto_1174874 ?auto_1174875 ) ( ON ?auto_1174874 ?auto_1174880 ) ( CLEAR ?auto_1174874 ) ( not ( = ?auto_1174873 ?auto_1174880 ) ) ( not ( = ?auto_1174874 ?auto_1174880 ) ) ( not ( = ?auto_1174872 ?auto_1174880 ) ) ( TRUCK-AT ?auto_1174876 ?auto_1174878 ) ( SURFACE-AT ?auto_1174872 ?auto_1174878 ) ( CLEAR ?auto_1174872 ) ( IS-CRATE ?auto_1174873 ) ( AVAILABLE ?auto_1174879 ) ( IN ?auto_1174873 ?auto_1174876 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174873 ?auto_1174874 )
      ( MAKE-2CRATE-VERIFY ?auto_1174872 ?auto_1174873 ?auto_1174874 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1174917 - SURFACE
      ?auto_1174918 - SURFACE
    )
    :vars
    (
      ?auto_1174921 - HOIST
      ?auto_1174924 - PLACE
      ?auto_1174925 - SURFACE
      ?auto_1174920 - PLACE
      ?auto_1174922 - HOIST
      ?auto_1174919 - SURFACE
      ?auto_1174923 - TRUCK
      ?auto_1174926 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174921 ?auto_1174924 ) ( SURFACE-AT ?auto_1174917 ?auto_1174924 ) ( CLEAR ?auto_1174917 ) ( IS-CRATE ?auto_1174918 ) ( not ( = ?auto_1174917 ?auto_1174918 ) ) ( AVAILABLE ?auto_1174921 ) ( ON ?auto_1174917 ?auto_1174925 ) ( not ( = ?auto_1174925 ?auto_1174917 ) ) ( not ( = ?auto_1174925 ?auto_1174918 ) ) ( not ( = ?auto_1174920 ?auto_1174924 ) ) ( HOIST-AT ?auto_1174922 ?auto_1174920 ) ( not ( = ?auto_1174921 ?auto_1174922 ) ) ( AVAILABLE ?auto_1174922 ) ( SURFACE-AT ?auto_1174918 ?auto_1174920 ) ( ON ?auto_1174918 ?auto_1174919 ) ( CLEAR ?auto_1174918 ) ( not ( = ?auto_1174917 ?auto_1174919 ) ) ( not ( = ?auto_1174918 ?auto_1174919 ) ) ( not ( = ?auto_1174925 ?auto_1174919 ) ) ( TRUCK-AT ?auto_1174923 ?auto_1174926 ) ( not ( = ?auto_1174926 ?auto_1174924 ) ) ( not ( = ?auto_1174920 ?auto_1174926 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1174923 ?auto_1174926 ?auto_1174924 )
      ( MAKE-1CRATE ?auto_1174917 ?auto_1174918 )
      ( MAKE-1CRATE-VERIFY ?auto_1174917 ?auto_1174918 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1174956 - SURFACE
      ?auto_1174957 - SURFACE
      ?auto_1174958 - SURFACE
      ?auto_1174959 - SURFACE
    )
    :vars
    (
      ?auto_1174961 - HOIST
      ?auto_1174960 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174961 ?auto_1174960 ) ( SURFACE-AT ?auto_1174958 ?auto_1174960 ) ( CLEAR ?auto_1174958 ) ( LIFTING ?auto_1174961 ?auto_1174959 ) ( IS-CRATE ?auto_1174959 ) ( not ( = ?auto_1174958 ?auto_1174959 ) ) ( ON ?auto_1174957 ?auto_1174956 ) ( ON ?auto_1174958 ?auto_1174957 ) ( not ( = ?auto_1174956 ?auto_1174957 ) ) ( not ( = ?auto_1174956 ?auto_1174958 ) ) ( not ( = ?auto_1174956 ?auto_1174959 ) ) ( not ( = ?auto_1174957 ?auto_1174958 ) ) ( not ( = ?auto_1174957 ?auto_1174959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1174958 ?auto_1174959 )
      ( MAKE-3CRATE-VERIFY ?auto_1174956 ?auto_1174957 ?auto_1174958 ?auto_1174959 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1174973 - SURFACE
      ?auto_1174974 - SURFACE
      ?auto_1174975 - SURFACE
      ?auto_1174976 - SURFACE
    )
    :vars
    (
      ?auto_1174978 - HOIST
      ?auto_1174979 - PLACE
      ?auto_1174977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1174978 ?auto_1174979 ) ( SURFACE-AT ?auto_1174975 ?auto_1174979 ) ( CLEAR ?auto_1174975 ) ( IS-CRATE ?auto_1174976 ) ( not ( = ?auto_1174975 ?auto_1174976 ) ) ( TRUCK-AT ?auto_1174977 ?auto_1174979 ) ( AVAILABLE ?auto_1174978 ) ( IN ?auto_1174976 ?auto_1174977 ) ( ON ?auto_1174975 ?auto_1174974 ) ( not ( = ?auto_1174974 ?auto_1174975 ) ) ( not ( = ?auto_1174974 ?auto_1174976 ) ) ( ON ?auto_1174974 ?auto_1174973 ) ( not ( = ?auto_1174973 ?auto_1174974 ) ) ( not ( = ?auto_1174973 ?auto_1174975 ) ) ( not ( = ?auto_1174973 ?auto_1174976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174974 ?auto_1174975 ?auto_1174976 )
      ( MAKE-3CRATE-VERIFY ?auto_1174973 ?auto_1174974 ?auto_1174975 ?auto_1174976 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1174994 - SURFACE
      ?auto_1174995 - SURFACE
      ?auto_1174996 - SURFACE
      ?auto_1174997 - SURFACE
    )
    :vars
    (
      ?auto_1175000 - HOIST
      ?auto_1174998 - PLACE
      ?auto_1175001 - TRUCK
      ?auto_1174999 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175000 ?auto_1174998 ) ( SURFACE-AT ?auto_1174996 ?auto_1174998 ) ( CLEAR ?auto_1174996 ) ( IS-CRATE ?auto_1174997 ) ( not ( = ?auto_1174996 ?auto_1174997 ) ) ( AVAILABLE ?auto_1175000 ) ( IN ?auto_1174997 ?auto_1175001 ) ( ON ?auto_1174996 ?auto_1174995 ) ( not ( = ?auto_1174995 ?auto_1174996 ) ) ( not ( = ?auto_1174995 ?auto_1174997 ) ) ( TRUCK-AT ?auto_1175001 ?auto_1174999 ) ( not ( = ?auto_1174999 ?auto_1174998 ) ) ( ON ?auto_1174995 ?auto_1174994 ) ( not ( = ?auto_1174994 ?auto_1174995 ) ) ( not ( = ?auto_1174994 ?auto_1174996 ) ) ( not ( = ?auto_1174994 ?auto_1174997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1174995 ?auto_1174996 ?auto_1174997 )
      ( MAKE-3CRATE-VERIFY ?auto_1174994 ?auto_1174995 ?auto_1174996 ?auto_1174997 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175018 - SURFACE
      ?auto_1175019 - SURFACE
      ?auto_1175020 - SURFACE
      ?auto_1175021 - SURFACE
    )
    :vars
    (
      ?auto_1175024 - HOIST
      ?auto_1175025 - PLACE
      ?auto_1175023 - TRUCK
      ?auto_1175026 - PLACE
      ?auto_1175022 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175024 ?auto_1175025 ) ( SURFACE-AT ?auto_1175020 ?auto_1175025 ) ( CLEAR ?auto_1175020 ) ( IS-CRATE ?auto_1175021 ) ( not ( = ?auto_1175020 ?auto_1175021 ) ) ( AVAILABLE ?auto_1175024 ) ( ON ?auto_1175020 ?auto_1175019 ) ( not ( = ?auto_1175019 ?auto_1175020 ) ) ( not ( = ?auto_1175019 ?auto_1175021 ) ) ( TRUCK-AT ?auto_1175023 ?auto_1175026 ) ( not ( = ?auto_1175026 ?auto_1175025 ) ) ( HOIST-AT ?auto_1175022 ?auto_1175026 ) ( LIFTING ?auto_1175022 ?auto_1175021 ) ( not ( = ?auto_1175024 ?auto_1175022 ) ) ( ON ?auto_1175019 ?auto_1175018 ) ( not ( = ?auto_1175018 ?auto_1175019 ) ) ( not ( = ?auto_1175018 ?auto_1175020 ) ) ( not ( = ?auto_1175018 ?auto_1175021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175019 ?auto_1175020 ?auto_1175021 )
      ( MAKE-3CRATE-VERIFY ?auto_1175018 ?auto_1175019 ?auto_1175020 ?auto_1175021 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175045 - SURFACE
      ?auto_1175046 - SURFACE
      ?auto_1175047 - SURFACE
      ?auto_1175048 - SURFACE
    )
    :vars
    (
      ?auto_1175052 - HOIST
      ?auto_1175049 - PLACE
      ?auto_1175050 - TRUCK
      ?auto_1175053 - PLACE
      ?auto_1175054 - HOIST
      ?auto_1175051 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175052 ?auto_1175049 ) ( SURFACE-AT ?auto_1175047 ?auto_1175049 ) ( CLEAR ?auto_1175047 ) ( IS-CRATE ?auto_1175048 ) ( not ( = ?auto_1175047 ?auto_1175048 ) ) ( AVAILABLE ?auto_1175052 ) ( ON ?auto_1175047 ?auto_1175046 ) ( not ( = ?auto_1175046 ?auto_1175047 ) ) ( not ( = ?auto_1175046 ?auto_1175048 ) ) ( TRUCK-AT ?auto_1175050 ?auto_1175053 ) ( not ( = ?auto_1175053 ?auto_1175049 ) ) ( HOIST-AT ?auto_1175054 ?auto_1175053 ) ( not ( = ?auto_1175052 ?auto_1175054 ) ) ( AVAILABLE ?auto_1175054 ) ( SURFACE-AT ?auto_1175048 ?auto_1175053 ) ( ON ?auto_1175048 ?auto_1175051 ) ( CLEAR ?auto_1175048 ) ( not ( = ?auto_1175047 ?auto_1175051 ) ) ( not ( = ?auto_1175048 ?auto_1175051 ) ) ( not ( = ?auto_1175046 ?auto_1175051 ) ) ( ON ?auto_1175046 ?auto_1175045 ) ( not ( = ?auto_1175045 ?auto_1175046 ) ) ( not ( = ?auto_1175045 ?auto_1175047 ) ) ( not ( = ?auto_1175045 ?auto_1175048 ) ) ( not ( = ?auto_1175045 ?auto_1175051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175046 ?auto_1175047 ?auto_1175048 )
      ( MAKE-3CRATE-VERIFY ?auto_1175045 ?auto_1175046 ?auto_1175047 ?auto_1175048 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175073 - SURFACE
      ?auto_1175074 - SURFACE
      ?auto_1175075 - SURFACE
      ?auto_1175076 - SURFACE
    )
    :vars
    (
      ?auto_1175079 - HOIST
      ?auto_1175082 - PLACE
      ?auto_1175080 - PLACE
      ?auto_1175078 - HOIST
      ?auto_1175077 - SURFACE
      ?auto_1175081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175079 ?auto_1175082 ) ( SURFACE-AT ?auto_1175075 ?auto_1175082 ) ( CLEAR ?auto_1175075 ) ( IS-CRATE ?auto_1175076 ) ( not ( = ?auto_1175075 ?auto_1175076 ) ) ( AVAILABLE ?auto_1175079 ) ( ON ?auto_1175075 ?auto_1175074 ) ( not ( = ?auto_1175074 ?auto_1175075 ) ) ( not ( = ?auto_1175074 ?auto_1175076 ) ) ( not ( = ?auto_1175080 ?auto_1175082 ) ) ( HOIST-AT ?auto_1175078 ?auto_1175080 ) ( not ( = ?auto_1175079 ?auto_1175078 ) ) ( AVAILABLE ?auto_1175078 ) ( SURFACE-AT ?auto_1175076 ?auto_1175080 ) ( ON ?auto_1175076 ?auto_1175077 ) ( CLEAR ?auto_1175076 ) ( not ( = ?auto_1175075 ?auto_1175077 ) ) ( not ( = ?auto_1175076 ?auto_1175077 ) ) ( not ( = ?auto_1175074 ?auto_1175077 ) ) ( TRUCK-AT ?auto_1175081 ?auto_1175082 ) ( ON ?auto_1175074 ?auto_1175073 ) ( not ( = ?auto_1175073 ?auto_1175074 ) ) ( not ( = ?auto_1175073 ?auto_1175075 ) ) ( not ( = ?auto_1175073 ?auto_1175076 ) ) ( not ( = ?auto_1175073 ?auto_1175077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175074 ?auto_1175075 ?auto_1175076 )
      ( MAKE-3CRATE-VERIFY ?auto_1175073 ?auto_1175074 ?auto_1175075 ?auto_1175076 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175101 - SURFACE
      ?auto_1175102 - SURFACE
      ?auto_1175103 - SURFACE
      ?auto_1175104 - SURFACE
    )
    :vars
    (
      ?auto_1175108 - HOIST
      ?auto_1175105 - PLACE
      ?auto_1175106 - PLACE
      ?auto_1175107 - HOIST
      ?auto_1175110 - SURFACE
      ?auto_1175109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175108 ?auto_1175105 ) ( IS-CRATE ?auto_1175104 ) ( not ( = ?auto_1175103 ?auto_1175104 ) ) ( not ( = ?auto_1175102 ?auto_1175103 ) ) ( not ( = ?auto_1175102 ?auto_1175104 ) ) ( not ( = ?auto_1175106 ?auto_1175105 ) ) ( HOIST-AT ?auto_1175107 ?auto_1175106 ) ( not ( = ?auto_1175108 ?auto_1175107 ) ) ( AVAILABLE ?auto_1175107 ) ( SURFACE-AT ?auto_1175104 ?auto_1175106 ) ( ON ?auto_1175104 ?auto_1175110 ) ( CLEAR ?auto_1175104 ) ( not ( = ?auto_1175103 ?auto_1175110 ) ) ( not ( = ?auto_1175104 ?auto_1175110 ) ) ( not ( = ?auto_1175102 ?auto_1175110 ) ) ( TRUCK-AT ?auto_1175109 ?auto_1175105 ) ( SURFACE-AT ?auto_1175102 ?auto_1175105 ) ( CLEAR ?auto_1175102 ) ( LIFTING ?auto_1175108 ?auto_1175103 ) ( IS-CRATE ?auto_1175103 ) ( ON ?auto_1175102 ?auto_1175101 ) ( not ( = ?auto_1175101 ?auto_1175102 ) ) ( not ( = ?auto_1175101 ?auto_1175103 ) ) ( not ( = ?auto_1175101 ?auto_1175104 ) ) ( not ( = ?auto_1175101 ?auto_1175110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175102 ?auto_1175103 ?auto_1175104 )
      ( MAKE-3CRATE-VERIFY ?auto_1175101 ?auto_1175102 ?auto_1175103 ?auto_1175104 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1175129 - SURFACE
      ?auto_1175130 - SURFACE
      ?auto_1175131 - SURFACE
      ?auto_1175132 - SURFACE
    )
    :vars
    (
      ?auto_1175138 - HOIST
      ?auto_1175137 - PLACE
      ?auto_1175136 - PLACE
      ?auto_1175133 - HOIST
      ?auto_1175134 - SURFACE
      ?auto_1175135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175138 ?auto_1175137 ) ( IS-CRATE ?auto_1175132 ) ( not ( = ?auto_1175131 ?auto_1175132 ) ) ( not ( = ?auto_1175130 ?auto_1175131 ) ) ( not ( = ?auto_1175130 ?auto_1175132 ) ) ( not ( = ?auto_1175136 ?auto_1175137 ) ) ( HOIST-AT ?auto_1175133 ?auto_1175136 ) ( not ( = ?auto_1175138 ?auto_1175133 ) ) ( AVAILABLE ?auto_1175133 ) ( SURFACE-AT ?auto_1175132 ?auto_1175136 ) ( ON ?auto_1175132 ?auto_1175134 ) ( CLEAR ?auto_1175132 ) ( not ( = ?auto_1175131 ?auto_1175134 ) ) ( not ( = ?auto_1175132 ?auto_1175134 ) ) ( not ( = ?auto_1175130 ?auto_1175134 ) ) ( TRUCK-AT ?auto_1175135 ?auto_1175137 ) ( SURFACE-AT ?auto_1175130 ?auto_1175137 ) ( CLEAR ?auto_1175130 ) ( IS-CRATE ?auto_1175131 ) ( AVAILABLE ?auto_1175138 ) ( IN ?auto_1175131 ?auto_1175135 ) ( ON ?auto_1175130 ?auto_1175129 ) ( not ( = ?auto_1175129 ?auto_1175130 ) ) ( not ( = ?auto_1175129 ?auto_1175131 ) ) ( not ( = ?auto_1175129 ?auto_1175132 ) ) ( not ( = ?auto_1175129 ?auto_1175134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175130 ?auto_1175131 ?auto_1175132 )
      ( MAKE-3CRATE-VERIFY ?auto_1175129 ?auto_1175130 ?auto_1175131 ?auto_1175132 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175420 - SURFACE
      ?auto_1175421 - SURFACE
      ?auto_1175422 - SURFACE
      ?auto_1175423 - SURFACE
      ?auto_1175424 - SURFACE
    )
    :vars
    (
      ?auto_1175426 - HOIST
      ?auto_1175425 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175426 ?auto_1175425 ) ( SURFACE-AT ?auto_1175423 ?auto_1175425 ) ( CLEAR ?auto_1175423 ) ( LIFTING ?auto_1175426 ?auto_1175424 ) ( IS-CRATE ?auto_1175424 ) ( not ( = ?auto_1175423 ?auto_1175424 ) ) ( ON ?auto_1175421 ?auto_1175420 ) ( ON ?auto_1175422 ?auto_1175421 ) ( ON ?auto_1175423 ?auto_1175422 ) ( not ( = ?auto_1175420 ?auto_1175421 ) ) ( not ( = ?auto_1175420 ?auto_1175422 ) ) ( not ( = ?auto_1175420 ?auto_1175423 ) ) ( not ( = ?auto_1175420 ?auto_1175424 ) ) ( not ( = ?auto_1175421 ?auto_1175422 ) ) ( not ( = ?auto_1175421 ?auto_1175423 ) ) ( not ( = ?auto_1175421 ?auto_1175424 ) ) ( not ( = ?auto_1175422 ?auto_1175423 ) ) ( not ( = ?auto_1175422 ?auto_1175424 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1175423 ?auto_1175424 )
      ( MAKE-4CRATE-VERIFY ?auto_1175420 ?auto_1175421 ?auto_1175422 ?auto_1175423 ?auto_1175424 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175445 - SURFACE
      ?auto_1175446 - SURFACE
      ?auto_1175447 - SURFACE
      ?auto_1175448 - SURFACE
      ?auto_1175449 - SURFACE
    )
    :vars
    (
      ?auto_1175451 - HOIST
      ?auto_1175452 - PLACE
      ?auto_1175450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175451 ?auto_1175452 ) ( SURFACE-AT ?auto_1175448 ?auto_1175452 ) ( CLEAR ?auto_1175448 ) ( IS-CRATE ?auto_1175449 ) ( not ( = ?auto_1175448 ?auto_1175449 ) ) ( TRUCK-AT ?auto_1175450 ?auto_1175452 ) ( AVAILABLE ?auto_1175451 ) ( IN ?auto_1175449 ?auto_1175450 ) ( ON ?auto_1175448 ?auto_1175447 ) ( not ( = ?auto_1175447 ?auto_1175448 ) ) ( not ( = ?auto_1175447 ?auto_1175449 ) ) ( ON ?auto_1175446 ?auto_1175445 ) ( ON ?auto_1175447 ?auto_1175446 ) ( not ( = ?auto_1175445 ?auto_1175446 ) ) ( not ( = ?auto_1175445 ?auto_1175447 ) ) ( not ( = ?auto_1175445 ?auto_1175448 ) ) ( not ( = ?auto_1175445 ?auto_1175449 ) ) ( not ( = ?auto_1175446 ?auto_1175447 ) ) ( not ( = ?auto_1175446 ?auto_1175448 ) ) ( not ( = ?auto_1175446 ?auto_1175449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175447 ?auto_1175448 ?auto_1175449 )
      ( MAKE-4CRATE-VERIFY ?auto_1175445 ?auto_1175446 ?auto_1175447 ?auto_1175448 ?auto_1175449 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175475 - SURFACE
      ?auto_1175476 - SURFACE
      ?auto_1175477 - SURFACE
      ?auto_1175478 - SURFACE
      ?auto_1175479 - SURFACE
    )
    :vars
    (
      ?auto_1175480 - HOIST
      ?auto_1175481 - PLACE
      ?auto_1175483 - TRUCK
      ?auto_1175482 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175480 ?auto_1175481 ) ( SURFACE-AT ?auto_1175478 ?auto_1175481 ) ( CLEAR ?auto_1175478 ) ( IS-CRATE ?auto_1175479 ) ( not ( = ?auto_1175478 ?auto_1175479 ) ) ( AVAILABLE ?auto_1175480 ) ( IN ?auto_1175479 ?auto_1175483 ) ( ON ?auto_1175478 ?auto_1175477 ) ( not ( = ?auto_1175477 ?auto_1175478 ) ) ( not ( = ?auto_1175477 ?auto_1175479 ) ) ( TRUCK-AT ?auto_1175483 ?auto_1175482 ) ( not ( = ?auto_1175482 ?auto_1175481 ) ) ( ON ?auto_1175476 ?auto_1175475 ) ( ON ?auto_1175477 ?auto_1175476 ) ( not ( = ?auto_1175475 ?auto_1175476 ) ) ( not ( = ?auto_1175475 ?auto_1175477 ) ) ( not ( = ?auto_1175475 ?auto_1175478 ) ) ( not ( = ?auto_1175475 ?auto_1175479 ) ) ( not ( = ?auto_1175476 ?auto_1175477 ) ) ( not ( = ?auto_1175476 ?auto_1175478 ) ) ( not ( = ?auto_1175476 ?auto_1175479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175477 ?auto_1175478 ?auto_1175479 )
      ( MAKE-4CRATE-VERIFY ?auto_1175475 ?auto_1175476 ?auto_1175477 ?auto_1175478 ?auto_1175479 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175509 - SURFACE
      ?auto_1175510 - SURFACE
      ?auto_1175511 - SURFACE
      ?auto_1175512 - SURFACE
      ?auto_1175513 - SURFACE
    )
    :vars
    (
      ?auto_1175515 - HOIST
      ?auto_1175514 - PLACE
      ?auto_1175516 - TRUCK
      ?auto_1175518 - PLACE
      ?auto_1175517 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175515 ?auto_1175514 ) ( SURFACE-AT ?auto_1175512 ?auto_1175514 ) ( CLEAR ?auto_1175512 ) ( IS-CRATE ?auto_1175513 ) ( not ( = ?auto_1175512 ?auto_1175513 ) ) ( AVAILABLE ?auto_1175515 ) ( ON ?auto_1175512 ?auto_1175511 ) ( not ( = ?auto_1175511 ?auto_1175512 ) ) ( not ( = ?auto_1175511 ?auto_1175513 ) ) ( TRUCK-AT ?auto_1175516 ?auto_1175518 ) ( not ( = ?auto_1175518 ?auto_1175514 ) ) ( HOIST-AT ?auto_1175517 ?auto_1175518 ) ( LIFTING ?auto_1175517 ?auto_1175513 ) ( not ( = ?auto_1175515 ?auto_1175517 ) ) ( ON ?auto_1175510 ?auto_1175509 ) ( ON ?auto_1175511 ?auto_1175510 ) ( not ( = ?auto_1175509 ?auto_1175510 ) ) ( not ( = ?auto_1175509 ?auto_1175511 ) ) ( not ( = ?auto_1175509 ?auto_1175512 ) ) ( not ( = ?auto_1175509 ?auto_1175513 ) ) ( not ( = ?auto_1175510 ?auto_1175511 ) ) ( not ( = ?auto_1175510 ?auto_1175512 ) ) ( not ( = ?auto_1175510 ?auto_1175513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175511 ?auto_1175512 ?auto_1175513 )
      ( MAKE-4CRATE-VERIFY ?auto_1175509 ?auto_1175510 ?auto_1175511 ?auto_1175512 ?auto_1175513 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175547 - SURFACE
      ?auto_1175548 - SURFACE
      ?auto_1175549 - SURFACE
      ?auto_1175550 - SURFACE
      ?auto_1175551 - SURFACE
    )
    :vars
    (
      ?auto_1175554 - HOIST
      ?auto_1175555 - PLACE
      ?auto_1175552 - TRUCK
      ?auto_1175556 - PLACE
      ?auto_1175553 - HOIST
      ?auto_1175557 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175554 ?auto_1175555 ) ( SURFACE-AT ?auto_1175550 ?auto_1175555 ) ( CLEAR ?auto_1175550 ) ( IS-CRATE ?auto_1175551 ) ( not ( = ?auto_1175550 ?auto_1175551 ) ) ( AVAILABLE ?auto_1175554 ) ( ON ?auto_1175550 ?auto_1175549 ) ( not ( = ?auto_1175549 ?auto_1175550 ) ) ( not ( = ?auto_1175549 ?auto_1175551 ) ) ( TRUCK-AT ?auto_1175552 ?auto_1175556 ) ( not ( = ?auto_1175556 ?auto_1175555 ) ) ( HOIST-AT ?auto_1175553 ?auto_1175556 ) ( not ( = ?auto_1175554 ?auto_1175553 ) ) ( AVAILABLE ?auto_1175553 ) ( SURFACE-AT ?auto_1175551 ?auto_1175556 ) ( ON ?auto_1175551 ?auto_1175557 ) ( CLEAR ?auto_1175551 ) ( not ( = ?auto_1175550 ?auto_1175557 ) ) ( not ( = ?auto_1175551 ?auto_1175557 ) ) ( not ( = ?auto_1175549 ?auto_1175557 ) ) ( ON ?auto_1175548 ?auto_1175547 ) ( ON ?auto_1175549 ?auto_1175548 ) ( not ( = ?auto_1175547 ?auto_1175548 ) ) ( not ( = ?auto_1175547 ?auto_1175549 ) ) ( not ( = ?auto_1175547 ?auto_1175550 ) ) ( not ( = ?auto_1175547 ?auto_1175551 ) ) ( not ( = ?auto_1175547 ?auto_1175557 ) ) ( not ( = ?auto_1175548 ?auto_1175549 ) ) ( not ( = ?auto_1175548 ?auto_1175550 ) ) ( not ( = ?auto_1175548 ?auto_1175551 ) ) ( not ( = ?auto_1175548 ?auto_1175557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175549 ?auto_1175550 ?auto_1175551 )
      ( MAKE-4CRATE-VERIFY ?auto_1175547 ?auto_1175548 ?auto_1175549 ?auto_1175550 ?auto_1175551 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175586 - SURFACE
      ?auto_1175587 - SURFACE
      ?auto_1175588 - SURFACE
      ?auto_1175589 - SURFACE
      ?auto_1175590 - SURFACE
    )
    :vars
    (
      ?auto_1175591 - HOIST
      ?auto_1175593 - PLACE
      ?auto_1175595 - PLACE
      ?auto_1175596 - HOIST
      ?auto_1175594 - SURFACE
      ?auto_1175592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175591 ?auto_1175593 ) ( SURFACE-AT ?auto_1175589 ?auto_1175593 ) ( CLEAR ?auto_1175589 ) ( IS-CRATE ?auto_1175590 ) ( not ( = ?auto_1175589 ?auto_1175590 ) ) ( AVAILABLE ?auto_1175591 ) ( ON ?auto_1175589 ?auto_1175588 ) ( not ( = ?auto_1175588 ?auto_1175589 ) ) ( not ( = ?auto_1175588 ?auto_1175590 ) ) ( not ( = ?auto_1175595 ?auto_1175593 ) ) ( HOIST-AT ?auto_1175596 ?auto_1175595 ) ( not ( = ?auto_1175591 ?auto_1175596 ) ) ( AVAILABLE ?auto_1175596 ) ( SURFACE-AT ?auto_1175590 ?auto_1175595 ) ( ON ?auto_1175590 ?auto_1175594 ) ( CLEAR ?auto_1175590 ) ( not ( = ?auto_1175589 ?auto_1175594 ) ) ( not ( = ?auto_1175590 ?auto_1175594 ) ) ( not ( = ?auto_1175588 ?auto_1175594 ) ) ( TRUCK-AT ?auto_1175592 ?auto_1175593 ) ( ON ?auto_1175587 ?auto_1175586 ) ( ON ?auto_1175588 ?auto_1175587 ) ( not ( = ?auto_1175586 ?auto_1175587 ) ) ( not ( = ?auto_1175586 ?auto_1175588 ) ) ( not ( = ?auto_1175586 ?auto_1175589 ) ) ( not ( = ?auto_1175586 ?auto_1175590 ) ) ( not ( = ?auto_1175586 ?auto_1175594 ) ) ( not ( = ?auto_1175587 ?auto_1175588 ) ) ( not ( = ?auto_1175587 ?auto_1175589 ) ) ( not ( = ?auto_1175587 ?auto_1175590 ) ) ( not ( = ?auto_1175587 ?auto_1175594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175588 ?auto_1175589 ?auto_1175590 )
      ( MAKE-4CRATE-VERIFY ?auto_1175586 ?auto_1175587 ?auto_1175588 ?auto_1175589 ?auto_1175590 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175625 - SURFACE
      ?auto_1175626 - SURFACE
      ?auto_1175627 - SURFACE
      ?auto_1175628 - SURFACE
      ?auto_1175629 - SURFACE
    )
    :vars
    (
      ?auto_1175630 - HOIST
      ?auto_1175634 - PLACE
      ?auto_1175632 - PLACE
      ?auto_1175635 - HOIST
      ?auto_1175631 - SURFACE
      ?auto_1175633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175630 ?auto_1175634 ) ( IS-CRATE ?auto_1175629 ) ( not ( = ?auto_1175628 ?auto_1175629 ) ) ( not ( = ?auto_1175627 ?auto_1175628 ) ) ( not ( = ?auto_1175627 ?auto_1175629 ) ) ( not ( = ?auto_1175632 ?auto_1175634 ) ) ( HOIST-AT ?auto_1175635 ?auto_1175632 ) ( not ( = ?auto_1175630 ?auto_1175635 ) ) ( AVAILABLE ?auto_1175635 ) ( SURFACE-AT ?auto_1175629 ?auto_1175632 ) ( ON ?auto_1175629 ?auto_1175631 ) ( CLEAR ?auto_1175629 ) ( not ( = ?auto_1175628 ?auto_1175631 ) ) ( not ( = ?auto_1175629 ?auto_1175631 ) ) ( not ( = ?auto_1175627 ?auto_1175631 ) ) ( TRUCK-AT ?auto_1175633 ?auto_1175634 ) ( SURFACE-AT ?auto_1175627 ?auto_1175634 ) ( CLEAR ?auto_1175627 ) ( LIFTING ?auto_1175630 ?auto_1175628 ) ( IS-CRATE ?auto_1175628 ) ( ON ?auto_1175626 ?auto_1175625 ) ( ON ?auto_1175627 ?auto_1175626 ) ( not ( = ?auto_1175625 ?auto_1175626 ) ) ( not ( = ?auto_1175625 ?auto_1175627 ) ) ( not ( = ?auto_1175625 ?auto_1175628 ) ) ( not ( = ?auto_1175625 ?auto_1175629 ) ) ( not ( = ?auto_1175625 ?auto_1175631 ) ) ( not ( = ?auto_1175626 ?auto_1175627 ) ) ( not ( = ?auto_1175626 ?auto_1175628 ) ) ( not ( = ?auto_1175626 ?auto_1175629 ) ) ( not ( = ?auto_1175626 ?auto_1175631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175627 ?auto_1175628 ?auto_1175629 )
      ( MAKE-4CRATE-VERIFY ?auto_1175625 ?auto_1175626 ?auto_1175627 ?auto_1175628 ?auto_1175629 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1175664 - SURFACE
      ?auto_1175665 - SURFACE
      ?auto_1175666 - SURFACE
      ?auto_1175667 - SURFACE
      ?auto_1175668 - SURFACE
    )
    :vars
    (
      ?auto_1175670 - HOIST
      ?auto_1175673 - PLACE
      ?auto_1175671 - PLACE
      ?auto_1175674 - HOIST
      ?auto_1175672 - SURFACE
      ?auto_1175669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1175670 ?auto_1175673 ) ( IS-CRATE ?auto_1175668 ) ( not ( = ?auto_1175667 ?auto_1175668 ) ) ( not ( = ?auto_1175666 ?auto_1175667 ) ) ( not ( = ?auto_1175666 ?auto_1175668 ) ) ( not ( = ?auto_1175671 ?auto_1175673 ) ) ( HOIST-AT ?auto_1175674 ?auto_1175671 ) ( not ( = ?auto_1175670 ?auto_1175674 ) ) ( AVAILABLE ?auto_1175674 ) ( SURFACE-AT ?auto_1175668 ?auto_1175671 ) ( ON ?auto_1175668 ?auto_1175672 ) ( CLEAR ?auto_1175668 ) ( not ( = ?auto_1175667 ?auto_1175672 ) ) ( not ( = ?auto_1175668 ?auto_1175672 ) ) ( not ( = ?auto_1175666 ?auto_1175672 ) ) ( TRUCK-AT ?auto_1175669 ?auto_1175673 ) ( SURFACE-AT ?auto_1175666 ?auto_1175673 ) ( CLEAR ?auto_1175666 ) ( IS-CRATE ?auto_1175667 ) ( AVAILABLE ?auto_1175670 ) ( IN ?auto_1175667 ?auto_1175669 ) ( ON ?auto_1175665 ?auto_1175664 ) ( ON ?auto_1175666 ?auto_1175665 ) ( not ( = ?auto_1175664 ?auto_1175665 ) ) ( not ( = ?auto_1175664 ?auto_1175666 ) ) ( not ( = ?auto_1175664 ?auto_1175667 ) ) ( not ( = ?auto_1175664 ?auto_1175668 ) ) ( not ( = ?auto_1175664 ?auto_1175672 ) ) ( not ( = ?auto_1175665 ?auto_1175666 ) ) ( not ( = ?auto_1175665 ?auto_1175667 ) ) ( not ( = ?auto_1175665 ?auto_1175668 ) ) ( not ( = ?auto_1175665 ?auto_1175672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1175666 ?auto_1175667 ?auto_1175668 )
      ( MAKE-4CRATE-VERIFY ?auto_1175664 ?auto_1175665 ?auto_1175666 ?auto_1175667 ?auto_1175668 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176324 - SURFACE
      ?auto_1176325 - SURFACE
      ?auto_1176326 - SURFACE
      ?auto_1176327 - SURFACE
      ?auto_1176328 - SURFACE
      ?auto_1176329 - SURFACE
    )
    :vars
    (
      ?auto_1176330 - HOIST
      ?auto_1176331 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176330 ?auto_1176331 ) ( SURFACE-AT ?auto_1176328 ?auto_1176331 ) ( CLEAR ?auto_1176328 ) ( LIFTING ?auto_1176330 ?auto_1176329 ) ( IS-CRATE ?auto_1176329 ) ( not ( = ?auto_1176328 ?auto_1176329 ) ) ( ON ?auto_1176325 ?auto_1176324 ) ( ON ?auto_1176326 ?auto_1176325 ) ( ON ?auto_1176327 ?auto_1176326 ) ( ON ?auto_1176328 ?auto_1176327 ) ( not ( = ?auto_1176324 ?auto_1176325 ) ) ( not ( = ?auto_1176324 ?auto_1176326 ) ) ( not ( = ?auto_1176324 ?auto_1176327 ) ) ( not ( = ?auto_1176324 ?auto_1176328 ) ) ( not ( = ?auto_1176324 ?auto_1176329 ) ) ( not ( = ?auto_1176325 ?auto_1176326 ) ) ( not ( = ?auto_1176325 ?auto_1176327 ) ) ( not ( = ?auto_1176325 ?auto_1176328 ) ) ( not ( = ?auto_1176325 ?auto_1176329 ) ) ( not ( = ?auto_1176326 ?auto_1176327 ) ) ( not ( = ?auto_1176326 ?auto_1176328 ) ) ( not ( = ?auto_1176326 ?auto_1176329 ) ) ( not ( = ?auto_1176327 ?auto_1176328 ) ) ( not ( = ?auto_1176327 ?auto_1176329 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1176328 ?auto_1176329 )
      ( MAKE-5CRATE-VERIFY ?auto_1176324 ?auto_1176325 ?auto_1176326 ?auto_1176327 ?auto_1176328 ?auto_1176329 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176358 - SURFACE
      ?auto_1176359 - SURFACE
      ?auto_1176360 - SURFACE
      ?auto_1176361 - SURFACE
      ?auto_1176362 - SURFACE
      ?auto_1176363 - SURFACE
    )
    :vars
    (
      ?auto_1176365 - HOIST
      ?auto_1176366 - PLACE
      ?auto_1176364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176365 ?auto_1176366 ) ( SURFACE-AT ?auto_1176362 ?auto_1176366 ) ( CLEAR ?auto_1176362 ) ( IS-CRATE ?auto_1176363 ) ( not ( = ?auto_1176362 ?auto_1176363 ) ) ( TRUCK-AT ?auto_1176364 ?auto_1176366 ) ( AVAILABLE ?auto_1176365 ) ( IN ?auto_1176363 ?auto_1176364 ) ( ON ?auto_1176362 ?auto_1176361 ) ( not ( = ?auto_1176361 ?auto_1176362 ) ) ( not ( = ?auto_1176361 ?auto_1176363 ) ) ( ON ?auto_1176359 ?auto_1176358 ) ( ON ?auto_1176360 ?auto_1176359 ) ( ON ?auto_1176361 ?auto_1176360 ) ( not ( = ?auto_1176358 ?auto_1176359 ) ) ( not ( = ?auto_1176358 ?auto_1176360 ) ) ( not ( = ?auto_1176358 ?auto_1176361 ) ) ( not ( = ?auto_1176358 ?auto_1176362 ) ) ( not ( = ?auto_1176358 ?auto_1176363 ) ) ( not ( = ?auto_1176359 ?auto_1176360 ) ) ( not ( = ?auto_1176359 ?auto_1176361 ) ) ( not ( = ?auto_1176359 ?auto_1176362 ) ) ( not ( = ?auto_1176359 ?auto_1176363 ) ) ( not ( = ?auto_1176360 ?auto_1176361 ) ) ( not ( = ?auto_1176360 ?auto_1176362 ) ) ( not ( = ?auto_1176360 ?auto_1176363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176361 ?auto_1176362 ?auto_1176363 )
      ( MAKE-5CRATE-VERIFY ?auto_1176358 ?auto_1176359 ?auto_1176360 ?auto_1176361 ?auto_1176362 ?auto_1176363 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176398 - SURFACE
      ?auto_1176399 - SURFACE
      ?auto_1176400 - SURFACE
      ?auto_1176401 - SURFACE
      ?auto_1176402 - SURFACE
      ?auto_1176403 - SURFACE
    )
    :vars
    (
      ?auto_1176405 - HOIST
      ?auto_1176404 - PLACE
      ?auto_1176406 - TRUCK
      ?auto_1176407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176405 ?auto_1176404 ) ( SURFACE-AT ?auto_1176402 ?auto_1176404 ) ( CLEAR ?auto_1176402 ) ( IS-CRATE ?auto_1176403 ) ( not ( = ?auto_1176402 ?auto_1176403 ) ) ( AVAILABLE ?auto_1176405 ) ( IN ?auto_1176403 ?auto_1176406 ) ( ON ?auto_1176402 ?auto_1176401 ) ( not ( = ?auto_1176401 ?auto_1176402 ) ) ( not ( = ?auto_1176401 ?auto_1176403 ) ) ( TRUCK-AT ?auto_1176406 ?auto_1176407 ) ( not ( = ?auto_1176407 ?auto_1176404 ) ) ( ON ?auto_1176399 ?auto_1176398 ) ( ON ?auto_1176400 ?auto_1176399 ) ( ON ?auto_1176401 ?auto_1176400 ) ( not ( = ?auto_1176398 ?auto_1176399 ) ) ( not ( = ?auto_1176398 ?auto_1176400 ) ) ( not ( = ?auto_1176398 ?auto_1176401 ) ) ( not ( = ?auto_1176398 ?auto_1176402 ) ) ( not ( = ?auto_1176398 ?auto_1176403 ) ) ( not ( = ?auto_1176399 ?auto_1176400 ) ) ( not ( = ?auto_1176399 ?auto_1176401 ) ) ( not ( = ?auto_1176399 ?auto_1176402 ) ) ( not ( = ?auto_1176399 ?auto_1176403 ) ) ( not ( = ?auto_1176400 ?auto_1176401 ) ) ( not ( = ?auto_1176400 ?auto_1176402 ) ) ( not ( = ?auto_1176400 ?auto_1176403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176401 ?auto_1176402 ?auto_1176403 )
      ( MAKE-5CRATE-VERIFY ?auto_1176398 ?auto_1176399 ?auto_1176400 ?auto_1176401 ?auto_1176402 ?auto_1176403 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176443 - SURFACE
      ?auto_1176444 - SURFACE
      ?auto_1176445 - SURFACE
      ?auto_1176446 - SURFACE
      ?auto_1176447 - SURFACE
      ?auto_1176448 - SURFACE
    )
    :vars
    (
      ?auto_1176452 - HOIST
      ?auto_1176449 - PLACE
      ?auto_1176450 - TRUCK
      ?auto_1176451 - PLACE
      ?auto_1176453 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176452 ?auto_1176449 ) ( SURFACE-AT ?auto_1176447 ?auto_1176449 ) ( CLEAR ?auto_1176447 ) ( IS-CRATE ?auto_1176448 ) ( not ( = ?auto_1176447 ?auto_1176448 ) ) ( AVAILABLE ?auto_1176452 ) ( ON ?auto_1176447 ?auto_1176446 ) ( not ( = ?auto_1176446 ?auto_1176447 ) ) ( not ( = ?auto_1176446 ?auto_1176448 ) ) ( TRUCK-AT ?auto_1176450 ?auto_1176451 ) ( not ( = ?auto_1176451 ?auto_1176449 ) ) ( HOIST-AT ?auto_1176453 ?auto_1176451 ) ( LIFTING ?auto_1176453 ?auto_1176448 ) ( not ( = ?auto_1176452 ?auto_1176453 ) ) ( ON ?auto_1176444 ?auto_1176443 ) ( ON ?auto_1176445 ?auto_1176444 ) ( ON ?auto_1176446 ?auto_1176445 ) ( not ( = ?auto_1176443 ?auto_1176444 ) ) ( not ( = ?auto_1176443 ?auto_1176445 ) ) ( not ( = ?auto_1176443 ?auto_1176446 ) ) ( not ( = ?auto_1176443 ?auto_1176447 ) ) ( not ( = ?auto_1176443 ?auto_1176448 ) ) ( not ( = ?auto_1176444 ?auto_1176445 ) ) ( not ( = ?auto_1176444 ?auto_1176446 ) ) ( not ( = ?auto_1176444 ?auto_1176447 ) ) ( not ( = ?auto_1176444 ?auto_1176448 ) ) ( not ( = ?auto_1176445 ?auto_1176446 ) ) ( not ( = ?auto_1176445 ?auto_1176447 ) ) ( not ( = ?auto_1176445 ?auto_1176448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176446 ?auto_1176447 ?auto_1176448 )
      ( MAKE-5CRATE-VERIFY ?auto_1176443 ?auto_1176444 ?auto_1176445 ?auto_1176446 ?auto_1176447 ?auto_1176448 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176493 - SURFACE
      ?auto_1176494 - SURFACE
      ?auto_1176495 - SURFACE
      ?auto_1176496 - SURFACE
      ?auto_1176497 - SURFACE
      ?auto_1176498 - SURFACE
    )
    :vars
    (
      ?auto_1176503 - HOIST
      ?auto_1176500 - PLACE
      ?auto_1176501 - TRUCK
      ?auto_1176502 - PLACE
      ?auto_1176499 - HOIST
      ?auto_1176504 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176503 ?auto_1176500 ) ( SURFACE-AT ?auto_1176497 ?auto_1176500 ) ( CLEAR ?auto_1176497 ) ( IS-CRATE ?auto_1176498 ) ( not ( = ?auto_1176497 ?auto_1176498 ) ) ( AVAILABLE ?auto_1176503 ) ( ON ?auto_1176497 ?auto_1176496 ) ( not ( = ?auto_1176496 ?auto_1176497 ) ) ( not ( = ?auto_1176496 ?auto_1176498 ) ) ( TRUCK-AT ?auto_1176501 ?auto_1176502 ) ( not ( = ?auto_1176502 ?auto_1176500 ) ) ( HOIST-AT ?auto_1176499 ?auto_1176502 ) ( not ( = ?auto_1176503 ?auto_1176499 ) ) ( AVAILABLE ?auto_1176499 ) ( SURFACE-AT ?auto_1176498 ?auto_1176502 ) ( ON ?auto_1176498 ?auto_1176504 ) ( CLEAR ?auto_1176498 ) ( not ( = ?auto_1176497 ?auto_1176504 ) ) ( not ( = ?auto_1176498 ?auto_1176504 ) ) ( not ( = ?auto_1176496 ?auto_1176504 ) ) ( ON ?auto_1176494 ?auto_1176493 ) ( ON ?auto_1176495 ?auto_1176494 ) ( ON ?auto_1176496 ?auto_1176495 ) ( not ( = ?auto_1176493 ?auto_1176494 ) ) ( not ( = ?auto_1176493 ?auto_1176495 ) ) ( not ( = ?auto_1176493 ?auto_1176496 ) ) ( not ( = ?auto_1176493 ?auto_1176497 ) ) ( not ( = ?auto_1176493 ?auto_1176498 ) ) ( not ( = ?auto_1176493 ?auto_1176504 ) ) ( not ( = ?auto_1176494 ?auto_1176495 ) ) ( not ( = ?auto_1176494 ?auto_1176496 ) ) ( not ( = ?auto_1176494 ?auto_1176497 ) ) ( not ( = ?auto_1176494 ?auto_1176498 ) ) ( not ( = ?auto_1176494 ?auto_1176504 ) ) ( not ( = ?auto_1176495 ?auto_1176496 ) ) ( not ( = ?auto_1176495 ?auto_1176497 ) ) ( not ( = ?auto_1176495 ?auto_1176498 ) ) ( not ( = ?auto_1176495 ?auto_1176504 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176496 ?auto_1176497 ?auto_1176498 )
      ( MAKE-5CRATE-VERIFY ?auto_1176493 ?auto_1176494 ?auto_1176495 ?auto_1176496 ?auto_1176497 ?auto_1176498 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176544 - SURFACE
      ?auto_1176545 - SURFACE
      ?auto_1176546 - SURFACE
      ?auto_1176547 - SURFACE
      ?auto_1176548 - SURFACE
      ?auto_1176549 - SURFACE
    )
    :vars
    (
      ?auto_1176550 - HOIST
      ?auto_1176554 - PLACE
      ?auto_1176551 - PLACE
      ?auto_1176555 - HOIST
      ?auto_1176553 - SURFACE
      ?auto_1176552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176550 ?auto_1176554 ) ( SURFACE-AT ?auto_1176548 ?auto_1176554 ) ( CLEAR ?auto_1176548 ) ( IS-CRATE ?auto_1176549 ) ( not ( = ?auto_1176548 ?auto_1176549 ) ) ( AVAILABLE ?auto_1176550 ) ( ON ?auto_1176548 ?auto_1176547 ) ( not ( = ?auto_1176547 ?auto_1176548 ) ) ( not ( = ?auto_1176547 ?auto_1176549 ) ) ( not ( = ?auto_1176551 ?auto_1176554 ) ) ( HOIST-AT ?auto_1176555 ?auto_1176551 ) ( not ( = ?auto_1176550 ?auto_1176555 ) ) ( AVAILABLE ?auto_1176555 ) ( SURFACE-AT ?auto_1176549 ?auto_1176551 ) ( ON ?auto_1176549 ?auto_1176553 ) ( CLEAR ?auto_1176549 ) ( not ( = ?auto_1176548 ?auto_1176553 ) ) ( not ( = ?auto_1176549 ?auto_1176553 ) ) ( not ( = ?auto_1176547 ?auto_1176553 ) ) ( TRUCK-AT ?auto_1176552 ?auto_1176554 ) ( ON ?auto_1176545 ?auto_1176544 ) ( ON ?auto_1176546 ?auto_1176545 ) ( ON ?auto_1176547 ?auto_1176546 ) ( not ( = ?auto_1176544 ?auto_1176545 ) ) ( not ( = ?auto_1176544 ?auto_1176546 ) ) ( not ( = ?auto_1176544 ?auto_1176547 ) ) ( not ( = ?auto_1176544 ?auto_1176548 ) ) ( not ( = ?auto_1176544 ?auto_1176549 ) ) ( not ( = ?auto_1176544 ?auto_1176553 ) ) ( not ( = ?auto_1176545 ?auto_1176546 ) ) ( not ( = ?auto_1176545 ?auto_1176547 ) ) ( not ( = ?auto_1176545 ?auto_1176548 ) ) ( not ( = ?auto_1176545 ?auto_1176549 ) ) ( not ( = ?auto_1176545 ?auto_1176553 ) ) ( not ( = ?auto_1176546 ?auto_1176547 ) ) ( not ( = ?auto_1176546 ?auto_1176548 ) ) ( not ( = ?auto_1176546 ?auto_1176549 ) ) ( not ( = ?auto_1176546 ?auto_1176553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176547 ?auto_1176548 ?auto_1176549 )
      ( MAKE-5CRATE-VERIFY ?auto_1176544 ?auto_1176545 ?auto_1176546 ?auto_1176547 ?auto_1176548 ?auto_1176549 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176595 - SURFACE
      ?auto_1176596 - SURFACE
      ?auto_1176597 - SURFACE
      ?auto_1176598 - SURFACE
      ?auto_1176599 - SURFACE
      ?auto_1176600 - SURFACE
    )
    :vars
    (
      ?auto_1176601 - HOIST
      ?auto_1176603 - PLACE
      ?auto_1176605 - PLACE
      ?auto_1176606 - HOIST
      ?auto_1176602 - SURFACE
      ?auto_1176604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176601 ?auto_1176603 ) ( IS-CRATE ?auto_1176600 ) ( not ( = ?auto_1176599 ?auto_1176600 ) ) ( not ( = ?auto_1176598 ?auto_1176599 ) ) ( not ( = ?auto_1176598 ?auto_1176600 ) ) ( not ( = ?auto_1176605 ?auto_1176603 ) ) ( HOIST-AT ?auto_1176606 ?auto_1176605 ) ( not ( = ?auto_1176601 ?auto_1176606 ) ) ( AVAILABLE ?auto_1176606 ) ( SURFACE-AT ?auto_1176600 ?auto_1176605 ) ( ON ?auto_1176600 ?auto_1176602 ) ( CLEAR ?auto_1176600 ) ( not ( = ?auto_1176599 ?auto_1176602 ) ) ( not ( = ?auto_1176600 ?auto_1176602 ) ) ( not ( = ?auto_1176598 ?auto_1176602 ) ) ( TRUCK-AT ?auto_1176604 ?auto_1176603 ) ( SURFACE-AT ?auto_1176598 ?auto_1176603 ) ( CLEAR ?auto_1176598 ) ( LIFTING ?auto_1176601 ?auto_1176599 ) ( IS-CRATE ?auto_1176599 ) ( ON ?auto_1176596 ?auto_1176595 ) ( ON ?auto_1176597 ?auto_1176596 ) ( ON ?auto_1176598 ?auto_1176597 ) ( not ( = ?auto_1176595 ?auto_1176596 ) ) ( not ( = ?auto_1176595 ?auto_1176597 ) ) ( not ( = ?auto_1176595 ?auto_1176598 ) ) ( not ( = ?auto_1176595 ?auto_1176599 ) ) ( not ( = ?auto_1176595 ?auto_1176600 ) ) ( not ( = ?auto_1176595 ?auto_1176602 ) ) ( not ( = ?auto_1176596 ?auto_1176597 ) ) ( not ( = ?auto_1176596 ?auto_1176598 ) ) ( not ( = ?auto_1176596 ?auto_1176599 ) ) ( not ( = ?auto_1176596 ?auto_1176600 ) ) ( not ( = ?auto_1176596 ?auto_1176602 ) ) ( not ( = ?auto_1176597 ?auto_1176598 ) ) ( not ( = ?auto_1176597 ?auto_1176599 ) ) ( not ( = ?auto_1176597 ?auto_1176600 ) ) ( not ( = ?auto_1176597 ?auto_1176602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176598 ?auto_1176599 ?auto_1176600 )
      ( MAKE-5CRATE-VERIFY ?auto_1176595 ?auto_1176596 ?auto_1176597 ?auto_1176598 ?auto_1176599 ?auto_1176600 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1176646 - SURFACE
      ?auto_1176647 - SURFACE
      ?auto_1176648 - SURFACE
      ?auto_1176649 - SURFACE
      ?auto_1176650 - SURFACE
      ?auto_1176651 - SURFACE
    )
    :vars
    (
      ?auto_1176653 - HOIST
      ?auto_1176652 - PLACE
      ?auto_1176654 - PLACE
      ?auto_1176655 - HOIST
      ?auto_1176657 - SURFACE
      ?auto_1176656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1176653 ?auto_1176652 ) ( IS-CRATE ?auto_1176651 ) ( not ( = ?auto_1176650 ?auto_1176651 ) ) ( not ( = ?auto_1176649 ?auto_1176650 ) ) ( not ( = ?auto_1176649 ?auto_1176651 ) ) ( not ( = ?auto_1176654 ?auto_1176652 ) ) ( HOIST-AT ?auto_1176655 ?auto_1176654 ) ( not ( = ?auto_1176653 ?auto_1176655 ) ) ( AVAILABLE ?auto_1176655 ) ( SURFACE-AT ?auto_1176651 ?auto_1176654 ) ( ON ?auto_1176651 ?auto_1176657 ) ( CLEAR ?auto_1176651 ) ( not ( = ?auto_1176650 ?auto_1176657 ) ) ( not ( = ?auto_1176651 ?auto_1176657 ) ) ( not ( = ?auto_1176649 ?auto_1176657 ) ) ( TRUCK-AT ?auto_1176656 ?auto_1176652 ) ( SURFACE-AT ?auto_1176649 ?auto_1176652 ) ( CLEAR ?auto_1176649 ) ( IS-CRATE ?auto_1176650 ) ( AVAILABLE ?auto_1176653 ) ( IN ?auto_1176650 ?auto_1176656 ) ( ON ?auto_1176647 ?auto_1176646 ) ( ON ?auto_1176648 ?auto_1176647 ) ( ON ?auto_1176649 ?auto_1176648 ) ( not ( = ?auto_1176646 ?auto_1176647 ) ) ( not ( = ?auto_1176646 ?auto_1176648 ) ) ( not ( = ?auto_1176646 ?auto_1176649 ) ) ( not ( = ?auto_1176646 ?auto_1176650 ) ) ( not ( = ?auto_1176646 ?auto_1176651 ) ) ( not ( = ?auto_1176646 ?auto_1176657 ) ) ( not ( = ?auto_1176647 ?auto_1176648 ) ) ( not ( = ?auto_1176647 ?auto_1176649 ) ) ( not ( = ?auto_1176647 ?auto_1176650 ) ) ( not ( = ?auto_1176647 ?auto_1176651 ) ) ( not ( = ?auto_1176647 ?auto_1176657 ) ) ( not ( = ?auto_1176648 ?auto_1176649 ) ) ( not ( = ?auto_1176648 ?auto_1176650 ) ) ( not ( = ?auto_1176648 ?auto_1176651 ) ) ( not ( = ?auto_1176648 ?auto_1176657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1176649 ?auto_1176650 ?auto_1176651 )
      ( MAKE-5CRATE-VERIFY ?auto_1176646 ?auto_1176647 ?auto_1176648 ?auto_1176649 ?auto_1176650 ?auto_1176651 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177855 - SURFACE
      ?auto_1177856 - SURFACE
      ?auto_1177857 - SURFACE
      ?auto_1177858 - SURFACE
      ?auto_1177859 - SURFACE
      ?auto_1177860 - SURFACE
      ?auto_1177861 - SURFACE
    )
    :vars
    (
      ?auto_1177862 - HOIST
      ?auto_1177863 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177862 ?auto_1177863 ) ( SURFACE-AT ?auto_1177860 ?auto_1177863 ) ( CLEAR ?auto_1177860 ) ( LIFTING ?auto_1177862 ?auto_1177861 ) ( IS-CRATE ?auto_1177861 ) ( not ( = ?auto_1177860 ?auto_1177861 ) ) ( ON ?auto_1177856 ?auto_1177855 ) ( ON ?auto_1177857 ?auto_1177856 ) ( ON ?auto_1177858 ?auto_1177857 ) ( ON ?auto_1177859 ?auto_1177858 ) ( ON ?auto_1177860 ?auto_1177859 ) ( not ( = ?auto_1177855 ?auto_1177856 ) ) ( not ( = ?auto_1177855 ?auto_1177857 ) ) ( not ( = ?auto_1177855 ?auto_1177858 ) ) ( not ( = ?auto_1177855 ?auto_1177859 ) ) ( not ( = ?auto_1177855 ?auto_1177860 ) ) ( not ( = ?auto_1177855 ?auto_1177861 ) ) ( not ( = ?auto_1177856 ?auto_1177857 ) ) ( not ( = ?auto_1177856 ?auto_1177858 ) ) ( not ( = ?auto_1177856 ?auto_1177859 ) ) ( not ( = ?auto_1177856 ?auto_1177860 ) ) ( not ( = ?auto_1177856 ?auto_1177861 ) ) ( not ( = ?auto_1177857 ?auto_1177858 ) ) ( not ( = ?auto_1177857 ?auto_1177859 ) ) ( not ( = ?auto_1177857 ?auto_1177860 ) ) ( not ( = ?auto_1177857 ?auto_1177861 ) ) ( not ( = ?auto_1177858 ?auto_1177859 ) ) ( not ( = ?auto_1177858 ?auto_1177860 ) ) ( not ( = ?auto_1177858 ?auto_1177861 ) ) ( not ( = ?auto_1177859 ?auto_1177860 ) ) ( not ( = ?auto_1177859 ?auto_1177861 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1177860 ?auto_1177861 )
      ( MAKE-6CRATE-VERIFY ?auto_1177855 ?auto_1177856 ?auto_1177857 ?auto_1177858 ?auto_1177859 ?auto_1177860 ?auto_1177861 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177899 - SURFACE
      ?auto_1177900 - SURFACE
      ?auto_1177901 - SURFACE
      ?auto_1177902 - SURFACE
      ?auto_1177903 - SURFACE
      ?auto_1177904 - SURFACE
      ?auto_1177905 - SURFACE
    )
    :vars
    (
      ?auto_1177906 - HOIST
      ?auto_1177908 - PLACE
      ?auto_1177907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177906 ?auto_1177908 ) ( SURFACE-AT ?auto_1177904 ?auto_1177908 ) ( CLEAR ?auto_1177904 ) ( IS-CRATE ?auto_1177905 ) ( not ( = ?auto_1177904 ?auto_1177905 ) ) ( TRUCK-AT ?auto_1177907 ?auto_1177908 ) ( AVAILABLE ?auto_1177906 ) ( IN ?auto_1177905 ?auto_1177907 ) ( ON ?auto_1177904 ?auto_1177903 ) ( not ( = ?auto_1177903 ?auto_1177904 ) ) ( not ( = ?auto_1177903 ?auto_1177905 ) ) ( ON ?auto_1177900 ?auto_1177899 ) ( ON ?auto_1177901 ?auto_1177900 ) ( ON ?auto_1177902 ?auto_1177901 ) ( ON ?auto_1177903 ?auto_1177902 ) ( not ( = ?auto_1177899 ?auto_1177900 ) ) ( not ( = ?auto_1177899 ?auto_1177901 ) ) ( not ( = ?auto_1177899 ?auto_1177902 ) ) ( not ( = ?auto_1177899 ?auto_1177903 ) ) ( not ( = ?auto_1177899 ?auto_1177904 ) ) ( not ( = ?auto_1177899 ?auto_1177905 ) ) ( not ( = ?auto_1177900 ?auto_1177901 ) ) ( not ( = ?auto_1177900 ?auto_1177902 ) ) ( not ( = ?auto_1177900 ?auto_1177903 ) ) ( not ( = ?auto_1177900 ?auto_1177904 ) ) ( not ( = ?auto_1177900 ?auto_1177905 ) ) ( not ( = ?auto_1177901 ?auto_1177902 ) ) ( not ( = ?auto_1177901 ?auto_1177903 ) ) ( not ( = ?auto_1177901 ?auto_1177904 ) ) ( not ( = ?auto_1177901 ?auto_1177905 ) ) ( not ( = ?auto_1177902 ?auto_1177903 ) ) ( not ( = ?auto_1177902 ?auto_1177904 ) ) ( not ( = ?auto_1177902 ?auto_1177905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1177903 ?auto_1177904 ?auto_1177905 )
      ( MAKE-6CRATE-VERIFY ?auto_1177899 ?auto_1177900 ?auto_1177901 ?auto_1177902 ?auto_1177903 ?auto_1177904 ?auto_1177905 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1177950 - SURFACE
      ?auto_1177951 - SURFACE
      ?auto_1177952 - SURFACE
      ?auto_1177953 - SURFACE
      ?auto_1177954 - SURFACE
      ?auto_1177955 - SURFACE
      ?auto_1177956 - SURFACE
    )
    :vars
    (
      ?auto_1177957 - HOIST
      ?auto_1177959 - PLACE
      ?auto_1177958 - TRUCK
      ?auto_1177960 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1177957 ?auto_1177959 ) ( SURFACE-AT ?auto_1177955 ?auto_1177959 ) ( CLEAR ?auto_1177955 ) ( IS-CRATE ?auto_1177956 ) ( not ( = ?auto_1177955 ?auto_1177956 ) ) ( AVAILABLE ?auto_1177957 ) ( IN ?auto_1177956 ?auto_1177958 ) ( ON ?auto_1177955 ?auto_1177954 ) ( not ( = ?auto_1177954 ?auto_1177955 ) ) ( not ( = ?auto_1177954 ?auto_1177956 ) ) ( TRUCK-AT ?auto_1177958 ?auto_1177960 ) ( not ( = ?auto_1177960 ?auto_1177959 ) ) ( ON ?auto_1177951 ?auto_1177950 ) ( ON ?auto_1177952 ?auto_1177951 ) ( ON ?auto_1177953 ?auto_1177952 ) ( ON ?auto_1177954 ?auto_1177953 ) ( not ( = ?auto_1177950 ?auto_1177951 ) ) ( not ( = ?auto_1177950 ?auto_1177952 ) ) ( not ( = ?auto_1177950 ?auto_1177953 ) ) ( not ( = ?auto_1177950 ?auto_1177954 ) ) ( not ( = ?auto_1177950 ?auto_1177955 ) ) ( not ( = ?auto_1177950 ?auto_1177956 ) ) ( not ( = ?auto_1177951 ?auto_1177952 ) ) ( not ( = ?auto_1177951 ?auto_1177953 ) ) ( not ( = ?auto_1177951 ?auto_1177954 ) ) ( not ( = ?auto_1177951 ?auto_1177955 ) ) ( not ( = ?auto_1177951 ?auto_1177956 ) ) ( not ( = ?auto_1177952 ?auto_1177953 ) ) ( not ( = ?auto_1177952 ?auto_1177954 ) ) ( not ( = ?auto_1177952 ?auto_1177955 ) ) ( not ( = ?auto_1177952 ?auto_1177956 ) ) ( not ( = ?auto_1177953 ?auto_1177954 ) ) ( not ( = ?auto_1177953 ?auto_1177955 ) ) ( not ( = ?auto_1177953 ?auto_1177956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1177954 ?auto_1177955 ?auto_1177956 )
      ( MAKE-6CRATE-VERIFY ?auto_1177950 ?auto_1177951 ?auto_1177952 ?auto_1177953 ?auto_1177954 ?auto_1177955 ?auto_1177956 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1178007 - SURFACE
      ?auto_1178008 - SURFACE
      ?auto_1178009 - SURFACE
      ?auto_1178010 - SURFACE
      ?auto_1178011 - SURFACE
      ?auto_1178012 - SURFACE
      ?auto_1178013 - SURFACE
    )
    :vars
    (
      ?auto_1178015 - HOIST
      ?auto_1178014 - PLACE
      ?auto_1178018 - TRUCK
      ?auto_1178017 - PLACE
      ?auto_1178016 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1178015 ?auto_1178014 ) ( SURFACE-AT ?auto_1178012 ?auto_1178014 ) ( CLEAR ?auto_1178012 ) ( IS-CRATE ?auto_1178013 ) ( not ( = ?auto_1178012 ?auto_1178013 ) ) ( AVAILABLE ?auto_1178015 ) ( ON ?auto_1178012 ?auto_1178011 ) ( not ( = ?auto_1178011 ?auto_1178012 ) ) ( not ( = ?auto_1178011 ?auto_1178013 ) ) ( TRUCK-AT ?auto_1178018 ?auto_1178017 ) ( not ( = ?auto_1178017 ?auto_1178014 ) ) ( HOIST-AT ?auto_1178016 ?auto_1178017 ) ( LIFTING ?auto_1178016 ?auto_1178013 ) ( not ( = ?auto_1178015 ?auto_1178016 ) ) ( ON ?auto_1178008 ?auto_1178007 ) ( ON ?auto_1178009 ?auto_1178008 ) ( ON ?auto_1178010 ?auto_1178009 ) ( ON ?auto_1178011 ?auto_1178010 ) ( not ( = ?auto_1178007 ?auto_1178008 ) ) ( not ( = ?auto_1178007 ?auto_1178009 ) ) ( not ( = ?auto_1178007 ?auto_1178010 ) ) ( not ( = ?auto_1178007 ?auto_1178011 ) ) ( not ( = ?auto_1178007 ?auto_1178012 ) ) ( not ( = ?auto_1178007 ?auto_1178013 ) ) ( not ( = ?auto_1178008 ?auto_1178009 ) ) ( not ( = ?auto_1178008 ?auto_1178010 ) ) ( not ( = ?auto_1178008 ?auto_1178011 ) ) ( not ( = ?auto_1178008 ?auto_1178012 ) ) ( not ( = ?auto_1178008 ?auto_1178013 ) ) ( not ( = ?auto_1178009 ?auto_1178010 ) ) ( not ( = ?auto_1178009 ?auto_1178011 ) ) ( not ( = ?auto_1178009 ?auto_1178012 ) ) ( not ( = ?auto_1178009 ?auto_1178013 ) ) ( not ( = ?auto_1178010 ?auto_1178011 ) ) ( not ( = ?auto_1178010 ?auto_1178012 ) ) ( not ( = ?auto_1178010 ?auto_1178013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1178011 ?auto_1178012 ?auto_1178013 )
      ( MAKE-6CRATE-VERIFY ?auto_1178007 ?auto_1178008 ?auto_1178009 ?auto_1178010 ?auto_1178011 ?auto_1178012 ?auto_1178013 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1178070 - SURFACE
      ?auto_1178071 - SURFACE
      ?auto_1178072 - SURFACE
      ?auto_1178073 - SURFACE
      ?auto_1178074 - SURFACE
      ?auto_1178075 - SURFACE
      ?auto_1178076 - SURFACE
    )
    :vars
    (
      ?auto_1178082 - HOIST
      ?auto_1178078 - PLACE
      ?auto_1178081 - TRUCK
      ?auto_1178077 - PLACE
      ?auto_1178080 - HOIST
      ?auto_1178079 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1178082 ?auto_1178078 ) ( SURFACE-AT ?auto_1178075 ?auto_1178078 ) ( CLEAR ?auto_1178075 ) ( IS-CRATE ?auto_1178076 ) ( not ( = ?auto_1178075 ?auto_1178076 ) ) ( AVAILABLE ?auto_1178082 ) ( ON ?auto_1178075 ?auto_1178074 ) ( not ( = ?auto_1178074 ?auto_1178075 ) ) ( not ( = ?auto_1178074 ?auto_1178076 ) ) ( TRUCK-AT ?auto_1178081 ?auto_1178077 ) ( not ( = ?auto_1178077 ?auto_1178078 ) ) ( HOIST-AT ?auto_1178080 ?auto_1178077 ) ( not ( = ?auto_1178082 ?auto_1178080 ) ) ( AVAILABLE ?auto_1178080 ) ( SURFACE-AT ?auto_1178076 ?auto_1178077 ) ( ON ?auto_1178076 ?auto_1178079 ) ( CLEAR ?auto_1178076 ) ( not ( = ?auto_1178075 ?auto_1178079 ) ) ( not ( = ?auto_1178076 ?auto_1178079 ) ) ( not ( = ?auto_1178074 ?auto_1178079 ) ) ( ON ?auto_1178071 ?auto_1178070 ) ( ON ?auto_1178072 ?auto_1178071 ) ( ON ?auto_1178073 ?auto_1178072 ) ( ON ?auto_1178074 ?auto_1178073 ) ( not ( = ?auto_1178070 ?auto_1178071 ) ) ( not ( = ?auto_1178070 ?auto_1178072 ) ) ( not ( = ?auto_1178070 ?auto_1178073 ) ) ( not ( = ?auto_1178070 ?auto_1178074 ) ) ( not ( = ?auto_1178070 ?auto_1178075 ) ) ( not ( = ?auto_1178070 ?auto_1178076 ) ) ( not ( = ?auto_1178070 ?auto_1178079 ) ) ( not ( = ?auto_1178071 ?auto_1178072 ) ) ( not ( = ?auto_1178071 ?auto_1178073 ) ) ( not ( = ?auto_1178071 ?auto_1178074 ) ) ( not ( = ?auto_1178071 ?auto_1178075 ) ) ( not ( = ?auto_1178071 ?auto_1178076 ) ) ( not ( = ?auto_1178071 ?auto_1178079 ) ) ( not ( = ?auto_1178072 ?auto_1178073 ) ) ( not ( = ?auto_1178072 ?auto_1178074 ) ) ( not ( = ?auto_1178072 ?auto_1178075 ) ) ( not ( = ?auto_1178072 ?auto_1178076 ) ) ( not ( = ?auto_1178072 ?auto_1178079 ) ) ( not ( = ?auto_1178073 ?auto_1178074 ) ) ( not ( = ?auto_1178073 ?auto_1178075 ) ) ( not ( = ?auto_1178073 ?auto_1178076 ) ) ( not ( = ?auto_1178073 ?auto_1178079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1178074 ?auto_1178075 ?auto_1178076 )
      ( MAKE-6CRATE-VERIFY ?auto_1178070 ?auto_1178071 ?auto_1178072 ?auto_1178073 ?auto_1178074 ?auto_1178075 ?auto_1178076 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1178134 - SURFACE
      ?auto_1178135 - SURFACE
      ?auto_1178136 - SURFACE
      ?auto_1178137 - SURFACE
      ?auto_1178138 - SURFACE
      ?auto_1178139 - SURFACE
      ?auto_1178140 - SURFACE
    )
    :vars
    (
      ?auto_1178146 - HOIST
      ?auto_1178145 - PLACE
      ?auto_1178144 - PLACE
      ?auto_1178142 - HOIST
      ?auto_1178141 - SURFACE
      ?auto_1178143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1178146 ?auto_1178145 ) ( SURFACE-AT ?auto_1178139 ?auto_1178145 ) ( CLEAR ?auto_1178139 ) ( IS-CRATE ?auto_1178140 ) ( not ( = ?auto_1178139 ?auto_1178140 ) ) ( AVAILABLE ?auto_1178146 ) ( ON ?auto_1178139 ?auto_1178138 ) ( not ( = ?auto_1178138 ?auto_1178139 ) ) ( not ( = ?auto_1178138 ?auto_1178140 ) ) ( not ( = ?auto_1178144 ?auto_1178145 ) ) ( HOIST-AT ?auto_1178142 ?auto_1178144 ) ( not ( = ?auto_1178146 ?auto_1178142 ) ) ( AVAILABLE ?auto_1178142 ) ( SURFACE-AT ?auto_1178140 ?auto_1178144 ) ( ON ?auto_1178140 ?auto_1178141 ) ( CLEAR ?auto_1178140 ) ( not ( = ?auto_1178139 ?auto_1178141 ) ) ( not ( = ?auto_1178140 ?auto_1178141 ) ) ( not ( = ?auto_1178138 ?auto_1178141 ) ) ( TRUCK-AT ?auto_1178143 ?auto_1178145 ) ( ON ?auto_1178135 ?auto_1178134 ) ( ON ?auto_1178136 ?auto_1178135 ) ( ON ?auto_1178137 ?auto_1178136 ) ( ON ?auto_1178138 ?auto_1178137 ) ( not ( = ?auto_1178134 ?auto_1178135 ) ) ( not ( = ?auto_1178134 ?auto_1178136 ) ) ( not ( = ?auto_1178134 ?auto_1178137 ) ) ( not ( = ?auto_1178134 ?auto_1178138 ) ) ( not ( = ?auto_1178134 ?auto_1178139 ) ) ( not ( = ?auto_1178134 ?auto_1178140 ) ) ( not ( = ?auto_1178134 ?auto_1178141 ) ) ( not ( = ?auto_1178135 ?auto_1178136 ) ) ( not ( = ?auto_1178135 ?auto_1178137 ) ) ( not ( = ?auto_1178135 ?auto_1178138 ) ) ( not ( = ?auto_1178135 ?auto_1178139 ) ) ( not ( = ?auto_1178135 ?auto_1178140 ) ) ( not ( = ?auto_1178135 ?auto_1178141 ) ) ( not ( = ?auto_1178136 ?auto_1178137 ) ) ( not ( = ?auto_1178136 ?auto_1178138 ) ) ( not ( = ?auto_1178136 ?auto_1178139 ) ) ( not ( = ?auto_1178136 ?auto_1178140 ) ) ( not ( = ?auto_1178136 ?auto_1178141 ) ) ( not ( = ?auto_1178137 ?auto_1178138 ) ) ( not ( = ?auto_1178137 ?auto_1178139 ) ) ( not ( = ?auto_1178137 ?auto_1178140 ) ) ( not ( = ?auto_1178137 ?auto_1178141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1178138 ?auto_1178139 ?auto_1178140 )
      ( MAKE-6CRATE-VERIFY ?auto_1178134 ?auto_1178135 ?auto_1178136 ?auto_1178137 ?auto_1178138 ?auto_1178139 ?auto_1178140 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1178198 - SURFACE
      ?auto_1178199 - SURFACE
      ?auto_1178200 - SURFACE
      ?auto_1178201 - SURFACE
      ?auto_1178202 - SURFACE
      ?auto_1178203 - SURFACE
      ?auto_1178204 - SURFACE
    )
    :vars
    (
      ?auto_1178208 - HOIST
      ?auto_1178209 - PLACE
      ?auto_1178207 - PLACE
      ?auto_1178210 - HOIST
      ?auto_1178205 - SURFACE
      ?auto_1178206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1178208 ?auto_1178209 ) ( IS-CRATE ?auto_1178204 ) ( not ( = ?auto_1178203 ?auto_1178204 ) ) ( not ( = ?auto_1178202 ?auto_1178203 ) ) ( not ( = ?auto_1178202 ?auto_1178204 ) ) ( not ( = ?auto_1178207 ?auto_1178209 ) ) ( HOIST-AT ?auto_1178210 ?auto_1178207 ) ( not ( = ?auto_1178208 ?auto_1178210 ) ) ( AVAILABLE ?auto_1178210 ) ( SURFACE-AT ?auto_1178204 ?auto_1178207 ) ( ON ?auto_1178204 ?auto_1178205 ) ( CLEAR ?auto_1178204 ) ( not ( = ?auto_1178203 ?auto_1178205 ) ) ( not ( = ?auto_1178204 ?auto_1178205 ) ) ( not ( = ?auto_1178202 ?auto_1178205 ) ) ( TRUCK-AT ?auto_1178206 ?auto_1178209 ) ( SURFACE-AT ?auto_1178202 ?auto_1178209 ) ( CLEAR ?auto_1178202 ) ( LIFTING ?auto_1178208 ?auto_1178203 ) ( IS-CRATE ?auto_1178203 ) ( ON ?auto_1178199 ?auto_1178198 ) ( ON ?auto_1178200 ?auto_1178199 ) ( ON ?auto_1178201 ?auto_1178200 ) ( ON ?auto_1178202 ?auto_1178201 ) ( not ( = ?auto_1178198 ?auto_1178199 ) ) ( not ( = ?auto_1178198 ?auto_1178200 ) ) ( not ( = ?auto_1178198 ?auto_1178201 ) ) ( not ( = ?auto_1178198 ?auto_1178202 ) ) ( not ( = ?auto_1178198 ?auto_1178203 ) ) ( not ( = ?auto_1178198 ?auto_1178204 ) ) ( not ( = ?auto_1178198 ?auto_1178205 ) ) ( not ( = ?auto_1178199 ?auto_1178200 ) ) ( not ( = ?auto_1178199 ?auto_1178201 ) ) ( not ( = ?auto_1178199 ?auto_1178202 ) ) ( not ( = ?auto_1178199 ?auto_1178203 ) ) ( not ( = ?auto_1178199 ?auto_1178204 ) ) ( not ( = ?auto_1178199 ?auto_1178205 ) ) ( not ( = ?auto_1178200 ?auto_1178201 ) ) ( not ( = ?auto_1178200 ?auto_1178202 ) ) ( not ( = ?auto_1178200 ?auto_1178203 ) ) ( not ( = ?auto_1178200 ?auto_1178204 ) ) ( not ( = ?auto_1178200 ?auto_1178205 ) ) ( not ( = ?auto_1178201 ?auto_1178202 ) ) ( not ( = ?auto_1178201 ?auto_1178203 ) ) ( not ( = ?auto_1178201 ?auto_1178204 ) ) ( not ( = ?auto_1178201 ?auto_1178205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1178202 ?auto_1178203 ?auto_1178204 )
      ( MAKE-6CRATE-VERIFY ?auto_1178198 ?auto_1178199 ?auto_1178200 ?auto_1178201 ?auto_1178202 ?auto_1178203 ?auto_1178204 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1178262 - SURFACE
      ?auto_1178263 - SURFACE
      ?auto_1178264 - SURFACE
      ?auto_1178265 - SURFACE
      ?auto_1178266 - SURFACE
      ?auto_1178267 - SURFACE
      ?auto_1178268 - SURFACE
    )
    :vars
    (
      ?auto_1178272 - HOIST
      ?auto_1178269 - PLACE
      ?auto_1178274 - PLACE
      ?auto_1178270 - HOIST
      ?auto_1178271 - SURFACE
      ?auto_1178273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1178272 ?auto_1178269 ) ( IS-CRATE ?auto_1178268 ) ( not ( = ?auto_1178267 ?auto_1178268 ) ) ( not ( = ?auto_1178266 ?auto_1178267 ) ) ( not ( = ?auto_1178266 ?auto_1178268 ) ) ( not ( = ?auto_1178274 ?auto_1178269 ) ) ( HOIST-AT ?auto_1178270 ?auto_1178274 ) ( not ( = ?auto_1178272 ?auto_1178270 ) ) ( AVAILABLE ?auto_1178270 ) ( SURFACE-AT ?auto_1178268 ?auto_1178274 ) ( ON ?auto_1178268 ?auto_1178271 ) ( CLEAR ?auto_1178268 ) ( not ( = ?auto_1178267 ?auto_1178271 ) ) ( not ( = ?auto_1178268 ?auto_1178271 ) ) ( not ( = ?auto_1178266 ?auto_1178271 ) ) ( TRUCK-AT ?auto_1178273 ?auto_1178269 ) ( SURFACE-AT ?auto_1178266 ?auto_1178269 ) ( CLEAR ?auto_1178266 ) ( IS-CRATE ?auto_1178267 ) ( AVAILABLE ?auto_1178272 ) ( IN ?auto_1178267 ?auto_1178273 ) ( ON ?auto_1178263 ?auto_1178262 ) ( ON ?auto_1178264 ?auto_1178263 ) ( ON ?auto_1178265 ?auto_1178264 ) ( ON ?auto_1178266 ?auto_1178265 ) ( not ( = ?auto_1178262 ?auto_1178263 ) ) ( not ( = ?auto_1178262 ?auto_1178264 ) ) ( not ( = ?auto_1178262 ?auto_1178265 ) ) ( not ( = ?auto_1178262 ?auto_1178266 ) ) ( not ( = ?auto_1178262 ?auto_1178267 ) ) ( not ( = ?auto_1178262 ?auto_1178268 ) ) ( not ( = ?auto_1178262 ?auto_1178271 ) ) ( not ( = ?auto_1178263 ?auto_1178264 ) ) ( not ( = ?auto_1178263 ?auto_1178265 ) ) ( not ( = ?auto_1178263 ?auto_1178266 ) ) ( not ( = ?auto_1178263 ?auto_1178267 ) ) ( not ( = ?auto_1178263 ?auto_1178268 ) ) ( not ( = ?auto_1178263 ?auto_1178271 ) ) ( not ( = ?auto_1178264 ?auto_1178265 ) ) ( not ( = ?auto_1178264 ?auto_1178266 ) ) ( not ( = ?auto_1178264 ?auto_1178267 ) ) ( not ( = ?auto_1178264 ?auto_1178268 ) ) ( not ( = ?auto_1178264 ?auto_1178271 ) ) ( not ( = ?auto_1178265 ?auto_1178266 ) ) ( not ( = ?auto_1178265 ?auto_1178267 ) ) ( not ( = ?auto_1178265 ?auto_1178268 ) ) ( not ( = ?auto_1178265 ?auto_1178271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1178266 ?auto_1178267 ?auto_1178268 )
      ( MAKE-6CRATE-VERIFY ?auto_1178262 ?auto_1178263 ?auto_1178264 ?auto_1178265 ?auto_1178266 ?auto_1178267 ?auto_1178268 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180218 - SURFACE
      ?auto_1180219 - SURFACE
      ?auto_1180220 - SURFACE
      ?auto_1180221 - SURFACE
      ?auto_1180222 - SURFACE
      ?auto_1180223 - SURFACE
      ?auto_1180224 - SURFACE
      ?auto_1180225 - SURFACE
    )
    :vars
    (
      ?auto_1180227 - HOIST
      ?auto_1180226 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180227 ?auto_1180226 ) ( SURFACE-AT ?auto_1180224 ?auto_1180226 ) ( CLEAR ?auto_1180224 ) ( LIFTING ?auto_1180227 ?auto_1180225 ) ( IS-CRATE ?auto_1180225 ) ( not ( = ?auto_1180224 ?auto_1180225 ) ) ( ON ?auto_1180219 ?auto_1180218 ) ( ON ?auto_1180220 ?auto_1180219 ) ( ON ?auto_1180221 ?auto_1180220 ) ( ON ?auto_1180222 ?auto_1180221 ) ( ON ?auto_1180223 ?auto_1180222 ) ( ON ?auto_1180224 ?auto_1180223 ) ( not ( = ?auto_1180218 ?auto_1180219 ) ) ( not ( = ?auto_1180218 ?auto_1180220 ) ) ( not ( = ?auto_1180218 ?auto_1180221 ) ) ( not ( = ?auto_1180218 ?auto_1180222 ) ) ( not ( = ?auto_1180218 ?auto_1180223 ) ) ( not ( = ?auto_1180218 ?auto_1180224 ) ) ( not ( = ?auto_1180218 ?auto_1180225 ) ) ( not ( = ?auto_1180219 ?auto_1180220 ) ) ( not ( = ?auto_1180219 ?auto_1180221 ) ) ( not ( = ?auto_1180219 ?auto_1180222 ) ) ( not ( = ?auto_1180219 ?auto_1180223 ) ) ( not ( = ?auto_1180219 ?auto_1180224 ) ) ( not ( = ?auto_1180219 ?auto_1180225 ) ) ( not ( = ?auto_1180220 ?auto_1180221 ) ) ( not ( = ?auto_1180220 ?auto_1180222 ) ) ( not ( = ?auto_1180220 ?auto_1180223 ) ) ( not ( = ?auto_1180220 ?auto_1180224 ) ) ( not ( = ?auto_1180220 ?auto_1180225 ) ) ( not ( = ?auto_1180221 ?auto_1180222 ) ) ( not ( = ?auto_1180221 ?auto_1180223 ) ) ( not ( = ?auto_1180221 ?auto_1180224 ) ) ( not ( = ?auto_1180221 ?auto_1180225 ) ) ( not ( = ?auto_1180222 ?auto_1180223 ) ) ( not ( = ?auto_1180222 ?auto_1180224 ) ) ( not ( = ?auto_1180222 ?auto_1180225 ) ) ( not ( = ?auto_1180223 ?auto_1180224 ) ) ( not ( = ?auto_1180223 ?auto_1180225 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1180224 ?auto_1180225 )
      ( MAKE-7CRATE-VERIFY ?auto_1180218 ?auto_1180219 ?auto_1180220 ?auto_1180221 ?auto_1180222 ?auto_1180223 ?auto_1180224 ?auto_1180225 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180273 - SURFACE
      ?auto_1180274 - SURFACE
      ?auto_1180275 - SURFACE
      ?auto_1180276 - SURFACE
      ?auto_1180277 - SURFACE
      ?auto_1180278 - SURFACE
      ?auto_1180279 - SURFACE
      ?auto_1180280 - SURFACE
    )
    :vars
    (
      ?auto_1180282 - HOIST
      ?auto_1180283 - PLACE
      ?auto_1180281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180282 ?auto_1180283 ) ( SURFACE-AT ?auto_1180279 ?auto_1180283 ) ( CLEAR ?auto_1180279 ) ( IS-CRATE ?auto_1180280 ) ( not ( = ?auto_1180279 ?auto_1180280 ) ) ( TRUCK-AT ?auto_1180281 ?auto_1180283 ) ( AVAILABLE ?auto_1180282 ) ( IN ?auto_1180280 ?auto_1180281 ) ( ON ?auto_1180279 ?auto_1180278 ) ( not ( = ?auto_1180278 ?auto_1180279 ) ) ( not ( = ?auto_1180278 ?auto_1180280 ) ) ( ON ?auto_1180274 ?auto_1180273 ) ( ON ?auto_1180275 ?auto_1180274 ) ( ON ?auto_1180276 ?auto_1180275 ) ( ON ?auto_1180277 ?auto_1180276 ) ( ON ?auto_1180278 ?auto_1180277 ) ( not ( = ?auto_1180273 ?auto_1180274 ) ) ( not ( = ?auto_1180273 ?auto_1180275 ) ) ( not ( = ?auto_1180273 ?auto_1180276 ) ) ( not ( = ?auto_1180273 ?auto_1180277 ) ) ( not ( = ?auto_1180273 ?auto_1180278 ) ) ( not ( = ?auto_1180273 ?auto_1180279 ) ) ( not ( = ?auto_1180273 ?auto_1180280 ) ) ( not ( = ?auto_1180274 ?auto_1180275 ) ) ( not ( = ?auto_1180274 ?auto_1180276 ) ) ( not ( = ?auto_1180274 ?auto_1180277 ) ) ( not ( = ?auto_1180274 ?auto_1180278 ) ) ( not ( = ?auto_1180274 ?auto_1180279 ) ) ( not ( = ?auto_1180274 ?auto_1180280 ) ) ( not ( = ?auto_1180275 ?auto_1180276 ) ) ( not ( = ?auto_1180275 ?auto_1180277 ) ) ( not ( = ?auto_1180275 ?auto_1180278 ) ) ( not ( = ?auto_1180275 ?auto_1180279 ) ) ( not ( = ?auto_1180275 ?auto_1180280 ) ) ( not ( = ?auto_1180276 ?auto_1180277 ) ) ( not ( = ?auto_1180276 ?auto_1180278 ) ) ( not ( = ?auto_1180276 ?auto_1180279 ) ) ( not ( = ?auto_1180276 ?auto_1180280 ) ) ( not ( = ?auto_1180277 ?auto_1180278 ) ) ( not ( = ?auto_1180277 ?auto_1180279 ) ) ( not ( = ?auto_1180277 ?auto_1180280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180278 ?auto_1180279 ?auto_1180280 )
      ( MAKE-7CRATE-VERIFY ?auto_1180273 ?auto_1180274 ?auto_1180275 ?auto_1180276 ?auto_1180277 ?auto_1180278 ?auto_1180279 ?auto_1180280 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180336 - SURFACE
      ?auto_1180337 - SURFACE
      ?auto_1180338 - SURFACE
      ?auto_1180339 - SURFACE
      ?auto_1180340 - SURFACE
      ?auto_1180341 - SURFACE
      ?auto_1180342 - SURFACE
      ?auto_1180343 - SURFACE
    )
    :vars
    (
      ?auto_1180346 - HOIST
      ?auto_1180344 - PLACE
      ?auto_1180347 - TRUCK
      ?auto_1180345 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180346 ?auto_1180344 ) ( SURFACE-AT ?auto_1180342 ?auto_1180344 ) ( CLEAR ?auto_1180342 ) ( IS-CRATE ?auto_1180343 ) ( not ( = ?auto_1180342 ?auto_1180343 ) ) ( AVAILABLE ?auto_1180346 ) ( IN ?auto_1180343 ?auto_1180347 ) ( ON ?auto_1180342 ?auto_1180341 ) ( not ( = ?auto_1180341 ?auto_1180342 ) ) ( not ( = ?auto_1180341 ?auto_1180343 ) ) ( TRUCK-AT ?auto_1180347 ?auto_1180345 ) ( not ( = ?auto_1180345 ?auto_1180344 ) ) ( ON ?auto_1180337 ?auto_1180336 ) ( ON ?auto_1180338 ?auto_1180337 ) ( ON ?auto_1180339 ?auto_1180338 ) ( ON ?auto_1180340 ?auto_1180339 ) ( ON ?auto_1180341 ?auto_1180340 ) ( not ( = ?auto_1180336 ?auto_1180337 ) ) ( not ( = ?auto_1180336 ?auto_1180338 ) ) ( not ( = ?auto_1180336 ?auto_1180339 ) ) ( not ( = ?auto_1180336 ?auto_1180340 ) ) ( not ( = ?auto_1180336 ?auto_1180341 ) ) ( not ( = ?auto_1180336 ?auto_1180342 ) ) ( not ( = ?auto_1180336 ?auto_1180343 ) ) ( not ( = ?auto_1180337 ?auto_1180338 ) ) ( not ( = ?auto_1180337 ?auto_1180339 ) ) ( not ( = ?auto_1180337 ?auto_1180340 ) ) ( not ( = ?auto_1180337 ?auto_1180341 ) ) ( not ( = ?auto_1180337 ?auto_1180342 ) ) ( not ( = ?auto_1180337 ?auto_1180343 ) ) ( not ( = ?auto_1180338 ?auto_1180339 ) ) ( not ( = ?auto_1180338 ?auto_1180340 ) ) ( not ( = ?auto_1180338 ?auto_1180341 ) ) ( not ( = ?auto_1180338 ?auto_1180342 ) ) ( not ( = ?auto_1180338 ?auto_1180343 ) ) ( not ( = ?auto_1180339 ?auto_1180340 ) ) ( not ( = ?auto_1180339 ?auto_1180341 ) ) ( not ( = ?auto_1180339 ?auto_1180342 ) ) ( not ( = ?auto_1180339 ?auto_1180343 ) ) ( not ( = ?auto_1180340 ?auto_1180341 ) ) ( not ( = ?auto_1180340 ?auto_1180342 ) ) ( not ( = ?auto_1180340 ?auto_1180343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180341 ?auto_1180342 ?auto_1180343 )
      ( MAKE-7CRATE-VERIFY ?auto_1180336 ?auto_1180337 ?auto_1180338 ?auto_1180339 ?auto_1180340 ?auto_1180341 ?auto_1180342 ?auto_1180343 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180406 - SURFACE
      ?auto_1180407 - SURFACE
      ?auto_1180408 - SURFACE
      ?auto_1180409 - SURFACE
      ?auto_1180410 - SURFACE
      ?auto_1180411 - SURFACE
      ?auto_1180412 - SURFACE
      ?auto_1180413 - SURFACE
    )
    :vars
    (
      ?auto_1180415 - HOIST
      ?auto_1180417 - PLACE
      ?auto_1180414 - TRUCK
      ?auto_1180416 - PLACE
      ?auto_1180418 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180415 ?auto_1180417 ) ( SURFACE-AT ?auto_1180412 ?auto_1180417 ) ( CLEAR ?auto_1180412 ) ( IS-CRATE ?auto_1180413 ) ( not ( = ?auto_1180412 ?auto_1180413 ) ) ( AVAILABLE ?auto_1180415 ) ( ON ?auto_1180412 ?auto_1180411 ) ( not ( = ?auto_1180411 ?auto_1180412 ) ) ( not ( = ?auto_1180411 ?auto_1180413 ) ) ( TRUCK-AT ?auto_1180414 ?auto_1180416 ) ( not ( = ?auto_1180416 ?auto_1180417 ) ) ( HOIST-AT ?auto_1180418 ?auto_1180416 ) ( LIFTING ?auto_1180418 ?auto_1180413 ) ( not ( = ?auto_1180415 ?auto_1180418 ) ) ( ON ?auto_1180407 ?auto_1180406 ) ( ON ?auto_1180408 ?auto_1180407 ) ( ON ?auto_1180409 ?auto_1180408 ) ( ON ?auto_1180410 ?auto_1180409 ) ( ON ?auto_1180411 ?auto_1180410 ) ( not ( = ?auto_1180406 ?auto_1180407 ) ) ( not ( = ?auto_1180406 ?auto_1180408 ) ) ( not ( = ?auto_1180406 ?auto_1180409 ) ) ( not ( = ?auto_1180406 ?auto_1180410 ) ) ( not ( = ?auto_1180406 ?auto_1180411 ) ) ( not ( = ?auto_1180406 ?auto_1180412 ) ) ( not ( = ?auto_1180406 ?auto_1180413 ) ) ( not ( = ?auto_1180407 ?auto_1180408 ) ) ( not ( = ?auto_1180407 ?auto_1180409 ) ) ( not ( = ?auto_1180407 ?auto_1180410 ) ) ( not ( = ?auto_1180407 ?auto_1180411 ) ) ( not ( = ?auto_1180407 ?auto_1180412 ) ) ( not ( = ?auto_1180407 ?auto_1180413 ) ) ( not ( = ?auto_1180408 ?auto_1180409 ) ) ( not ( = ?auto_1180408 ?auto_1180410 ) ) ( not ( = ?auto_1180408 ?auto_1180411 ) ) ( not ( = ?auto_1180408 ?auto_1180412 ) ) ( not ( = ?auto_1180408 ?auto_1180413 ) ) ( not ( = ?auto_1180409 ?auto_1180410 ) ) ( not ( = ?auto_1180409 ?auto_1180411 ) ) ( not ( = ?auto_1180409 ?auto_1180412 ) ) ( not ( = ?auto_1180409 ?auto_1180413 ) ) ( not ( = ?auto_1180410 ?auto_1180411 ) ) ( not ( = ?auto_1180410 ?auto_1180412 ) ) ( not ( = ?auto_1180410 ?auto_1180413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180411 ?auto_1180412 ?auto_1180413 )
      ( MAKE-7CRATE-VERIFY ?auto_1180406 ?auto_1180407 ?auto_1180408 ?auto_1180409 ?auto_1180410 ?auto_1180411 ?auto_1180412 ?auto_1180413 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180483 - SURFACE
      ?auto_1180484 - SURFACE
      ?auto_1180485 - SURFACE
      ?auto_1180486 - SURFACE
      ?auto_1180487 - SURFACE
      ?auto_1180488 - SURFACE
      ?auto_1180489 - SURFACE
      ?auto_1180490 - SURFACE
    )
    :vars
    (
      ?auto_1180496 - HOIST
      ?auto_1180492 - PLACE
      ?auto_1180494 - TRUCK
      ?auto_1180491 - PLACE
      ?auto_1180495 - HOIST
      ?auto_1180493 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180496 ?auto_1180492 ) ( SURFACE-AT ?auto_1180489 ?auto_1180492 ) ( CLEAR ?auto_1180489 ) ( IS-CRATE ?auto_1180490 ) ( not ( = ?auto_1180489 ?auto_1180490 ) ) ( AVAILABLE ?auto_1180496 ) ( ON ?auto_1180489 ?auto_1180488 ) ( not ( = ?auto_1180488 ?auto_1180489 ) ) ( not ( = ?auto_1180488 ?auto_1180490 ) ) ( TRUCK-AT ?auto_1180494 ?auto_1180491 ) ( not ( = ?auto_1180491 ?auto_1180492 ) ) ( HOIST-AT ?auto_1180495 ?auto_1180491 ) ( not ( = ?auto_1180496 ?auto_1180495 ) ) ( AVAILABLE ?auto_1180495 ) ( SURFACE-AT ?auto_1180490 ?auto_1180491 ) ( ON ?auto_1180490 ?auto_1180493 ) ( CLEAR ?auto_1180490 ) ( not ( = ?auto_1180489 ?auto_1180493 ) ) ( not ( = ?auto_1180490 ?auto_1180493 ) ) ( not ( = ?auto_1180488 ?auto_1180493 ) ) ( ON ?auto_1180484 ?auto_1180483 ) ( ON ?auto_1180485 ?auto_1180484 ) ( ON ?auto_1180486 ?auto_1180485 ) ( ON ?auto_1180487 ?auto_1180486 ) ( ON ?auto_1180488 ?auto_1180487 ) ( not ( = ?auto_1180483 ?auto_1180484 ) ) ( not ( = ?auto_1180483 ?auto_1180485 ) ) ( not ( = ?auto_1180483 ?auto_1180486 ) ) ( not ( = ?auto_1180483 ?auto_1180487 ) ) ( not ( = ?auto_1180483 ?auto_1180488 ) ) ( not ( = ?auto_1180483 ?auto_1180489 ) ) ( not ( = ?auto_1180483 ?auto_1180490 ) ) ( not ( = ?auto_1180483 ?auto_1180493 ) ) ( not ( = ?auto_1180484 ?auto_1180485 ) ) ( not ( = ?auto_1180484 ?auto_1180486 ) ) ( not ( = ?auto_1180484 ?auto_1180487 ) ) ( not ( = ?auto_1180484 ?auto_1180488 ) ) ( not ( = ?auto_1180484 ?auto_1180489 ) ) ( not ( = ?auto_1180484 ?auto_1180490 ) ) ( not ( = ?auto_1180484 ?auto_1180493 ) ) ( not ( = ?auto_1180485 ?auto_1180486 ) ) ( not ( = ?auto_1180485 ?auto_1180487 ) ) ( not ( = ?auto_1180485 ?auto_1180488 ) ) ( not ( = ?auto_1180485 ?auto_1180489 ) ) ( not ( = ?auto_1180485 ?auto_1180490 ) ) ( not ( = ?auto_1180485 ?auto_1180493 ) ) ( not ( = ?auto_1180486 ?auto_1180487 ) ) ( not ( = ?auto_1180486 ?auto_1180488 ) ) ( not ( = ?auto_1180486 ?auto_1180489 ) ) ( not ( = ?auto_1180486 ?auto_1180490 ) ) ( not ( = ?auto_1180486 ?auto_1180493 ) ) ( not ( = ?auto_1180487 ?auto_1180488 ) ) ( not ( = ?auto_1180487 ?auto_1180489 ) ) ( not ( = ?auto_1180487 ?auto_1180490 ) ) ( not ( = ?auto_1180487 ?auto_1180493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180488 ?auto_1180489 ?auto_1180490 )
      ( MAKE-7CRATE-VERIFY ?auto_1180483 ?auto_1180484 ?auto_1180485 ?auto_1180486 ?auto_1180487 ?auto_1180488 ?auto_1180489 ?auto_1180490 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180561 - SURFACE
      ?auto_1180562 - SURFACE
      ?auto_1180563 - SURFACE
      ?auto_1180564 - SURFACE
      ?auto_1180565 - SURFACE
      ?auto_1180566 - SURFACE
      ?auto_1180567 - SURFACE
      ?auto_1180568 - SURFACE
    )
    :vars
    (
      ?auto_1180574 - HOIST
      ?auto_1180573 - PLACE
      ?auto_1180570 - PLACE
      ?auto_1180571 - HOIST
      ?auto_1180569 - SURFACE
      ?auto_1180572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180574 ?auto_1180573 ) ( SURFACE-AT ?auto_1180567 ?auto_1180573 ) ( CLEAR ?auto_1180567 ) ( IS-CRATE ?auto_1180568 ) ( not ( = ?auto_1180567 ?auto_1180568 ) ) ( AVAILABLE ?auto_1180574 ) ( ON ?auto_1180567 ?auto_1180566 ) ( not ( = ?auto_1180566 ?auto_1180567 ) ) ( not ( = ?auto_1180566 ?auto_1180568 ) ) ( not ( = ?auto_1180570 ?auto_1180573 ) ) ( HOIST-AT ?auto_1180571 ?auto_1180570 ) ( not ( = ?auto_1180574 ?auto_1180571 ) ) ( AVAILABLE ?auto_1180571 ) ( SURFACE-AT ?auto_1180568 ?auto_1180570 ) ( ON ?auto_1180568 ?auto_1180569 ) ( CLEAR ?auto_1180568 ) ( not ( = ?auto_1180567 ?auto_1180569 ) ) ( not ( = ?auto_1180568 ?auto_1180569 ) ) ( not ( = ?auto_1180566 ?auto_1180569 ) ) ( TRUCK-AT ?auto_1180572 ?auto_1180573 ) ( ON ?auto_1180562 ?auto_1180561 ) ( ON ?auto_1180563 ?auto_1180562 ) ( ON ?auto_1180564 ?auto_1180563 ) ( ON ?auto_1180565 ?auto_1180564 ) ( ON ?auto_1180566 ?auto_1180565 ) ( not ( = ?auto_1180561 ?auto_1180562 ) ) ( not ( = ?auto_1180561 ?auto_1180563 ) ) ( not ( = ?auto_1180561 ?auto_1180564 ) ) ( not ( = ?auto_1180561 ?auto_1180565 ) ) ( not ( = ?auto_1180561 ?auto_1180566 ) ) ( not ( = ?auto_1180561 ?auto_1180567 ) ) ( not ( = ?auto_1180561 ?auto_1180568 ) ) ( not ( = ?auto_1180561 ?auto_1180569 ) ) ( not ( = ?auto_1180562 ?auto_1180563 ) ) ( not ( = ?auto_1180562 ?auto_1180564 ) ) ( not ( = ?auto_1180562 ?auto_1180565 ) ) ( not ( = ?auto_1180562 ?auto_1180566 ) ) ( not ( = ?auto_1180562 ?auto_1180567 ) ) ( not ( = ?auto_1180562 ?auto_1180568 ) ) ( not ( = ?auto_1180562 ?auto_1180569 ) ) ( not ( = ?auto_1180563 ?auto_1180564 ) ) ( not ( = ?auto_1180563 ?auto_1180565 ) ) ( not ( = ?auto_1180563 ?auto_1180566 ) ) ( not ( = ?auto_1180563 ?auto_1180567 ) ) ( not ( = ?auto_1180563 ?auto_1180568 ) ) ( not ( = ?auto_1180563 ?auto_1180569 ) ) ( not ( = ?auto_1180564 ?auto_1180565 ) ) ( not ( = ?auto_1180564 ?auto_1180566 ) ) ( not ( = ?auto_1180564 ?auto_1180567 ) ) ( not ( = ?auto_1180564 ?auto_1180568 ) ) ( not ( = ?auto_1180564 ?auto_1180569 ) ) ( not ( = ?auto_1180565 ?auto_1180566 ) ) ( not ( = ?auto_1180565 ?auto_1180567 ) ) ( not ( = ?auto_1180565 ?auto_1180568 ) ) ( not ( = ?auto_1180565 ?auto_1180569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180566 ?auto_1180567 ?auto_1180568 )
      ( MAKE-7CRATE-VERIFY ?auto_1180561 ?auto_1180562 ?auto_1180563 ?auto_1180564 ?auto_1180565 ?auto_1180566 ?auto_1180567 ?auto_1180568 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180639 - SURFACE
      ?auto_1180640 - SURFACE
      ?auto_1180641 - SURFACE
      ?auto_1180642 - SURFACE
      ?auto_1180643 - SURFACE
      ?auto_1180644 - SURFACE
      ?auto_1180645 - SURFACE
      ?auto_1180646 - SURFACE
    )
    :vars
    (
      ?auto_1180647 - HOIST
      ?auto_1180649 - PLACE
      ?auto_1180651 - PLACE
      ?auto_1180650 - HOIST
      ?auto_1180652 - SURFACE
      ?auto_1180648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180647 ?auto_1180649 ) ( IS-CRATE ?auto_1180646 ) ( not ( = ?auto_1180645 ?auto_1180646 ) ) ( not ( = ?auto_1180644 ?auto_1180645 ) ) ( not ( = ?auto_1180644 ?auto_1180646 ) ) ( not ( = ?auto_1180651 ?auto_1180649 ) ) ( HOIST-AT ?auto_1180650 ?auto_1180651 ) ( not ( = ?auto_1180647 ?auto_1180650 ) ) ( AVAILABLE ?auto_1180650 ) ( SURFACE-AT ?auto_1180646 ?auto_1180651 ) ( ON ?auto_1180646 ?auto_1180652 ) ( CLEAR ?auto_1180646 ) ( not ( = ?auto_1180645 ?auto_1180652 ) ) ( not ( = ?auto_1180646 ?auto_1180652 ) ) ( not ( = ?auto_1180644 ?auto_1180652 ) ) ( TRUCK-AT ?auto_1180648 ?auto_1180649 ) ( SURFACE-AT ?auto_1180644 ?auto_1180649 ) ( CLEAR ?auto_1180644 ) ( LIFTING ?auto_1180647 ?auto_1180645 ) ( IS-CRATE ?auto_1180645 ) ( ON ?auto_1180640 ?auto_1180639 ) ( ON ?auto_1180641 ?auto_1180640 ) ( ON ?auto_1180642 ?auto_1180641 ) ( ON ?auto_1180643 ?auto_1180642 ) ( ON ?auto_1180644 ?auto_1180643 ) ( not ( = ?auto_1180639 ?auto_1180640 ) ) ( not ( = ?auto_1180639 ?auto_1180641 ) ) ( not ( = ?auto_1180639 ?auto_1180642 ) ) ( not ( = ?auto_1180639 ?auto_1180643 ) ) ( not ( = ?auto_1180639 ?auto_1180644 ) ) ( not ( = ?auto_1180639 ?auto_1180645 ) ) ( not ( = ?auto_1180639 ?auto_1180646 ) ) ( not ( = ?auto_1180639 ?auto_1180652 ) ) ( not ( = ?auto_1180640 ?auto_1180641 ) ) ( not ( = ?auto_1180640 ?auto_1180642 ) ) ( not ( = ?auto_1180640 ?auto_1180643 ) ) ( not ( = ?auto_1180640 ?auto_1180644 ) ) ( not ( = ?auto_1180640 ?auto_1180645 ) ) ( not ( = ?auto_1180640 ?auto_1180646 ) ) ( not ( = ?auto_1180640 ?auto_1180652 ) ) ( not ( = ?auto_1180641 ?auto_1180642 ) ) ( not ( = ?auto_1180641 ?auto_1180643 ) ) ( not ( = ?auto_1180641 ?auto_1180644 ) ) ( not ( = ?auto_1180641 ?auto_1180645 ) ) ( not ( = ?auto_1180641 ?auto_1180646 ) ) ( not ( = ?auto_1180641 ?auto_1180652 ) ) ( not ( = ?auto_1180642 ?auto_1180643 ) ) ( not ( = ?auto_1180642 ?auto_1180644 ) ) ( not ( = ?auto_1180642 ?auto_1180645 ) ) ( not ( = ?auto_1180642 ?auto_1180646 ) ) ( not ( = ?auto_1180642 ?auto_1180652 ) ) ( not ( = ?auto_1180643 ?auto_1180644 ) ) ( not ( = ?auto_1180643 ?auto_1180645 ) ) ( not ( = ?auto_1180643 ?auto_1180646 ) ) ( not ( = ?auto_1180643 ?auto_1180652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180644 ?auto_1180645 ?auto_1180646 )
      ( MAKE-7CRATE-VERIFY ?auto_1180639 ?auto_1180640 ?auto_1180641 ?auto_1180642 ?auto_1180643 ?auto_1180644 ?auto_1180645 ?auto_1180646 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1180717 - SURFACE
      ?auto_1180718 - SURFACE
      ?auto_1180719 - SURFACE
      ?auto_1180720 - SURFACE
      ?auto_1180721 - SURFACE
      ?auto_1180722 - SURFACE
      ?auto_1180723 - SURFACE
      ?auto_1180724 - SURFACE
    )
    :vars
    (
      ?auto_1180725 - HOIST
      ?auto_1180730 - PLACE
      ?auto_1180727 - PLACE
      ?auto_1180728 - HOIST
      ?auto_1180729 - SURFACE
      ?auto_1180726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1180725 ?auto_1180730 ) ( IS-CRATE ?auto_1180724 ) ( not ( = ?auto_1180723 ?auto_1180724 ) ) ( not ( = ?auto_1180722 ?auto_1180723 ) ) ( not ( = ?auto_1180722 ?auto_1180724 ) ) ( not ( = ?auto_1180727 ?auto_1180730 ) ) ( HOIST-AT ?auto_1180728 ?auto_1180727 ) ( not ( = ?auto_1180725 ?auto_1180728 ) ) ( AVAILABLE ?auto_1180728 ) ( SURFACE-AT ?auto_1180724 ?auto_1180727 ) ( ON ?auto_1180724 ?auto_1180729 ) ( CLEAR ?auto_1180724 ) ( not ( = ?auto_1180723 ?auto_1180729 ) ) ( not ( = ?auto_1180724 ?auto_1180729 ) ) ( not ( = ?auto_1180722 ?auto_1180729 ) ) ( TRUCK-AT ?auto_1180726 ?auto_1180730 ) ( SURFACE-AT ?auto_1180722 ?auto_1180730 ) ( CLEAR ?auto_1180722 ) ( IS-CRATE ?auto_1180723 ) ( AVAILABLE ?auto_1180725 ) ( IN ?auto_1180723 ?auto_1180726 ) ( ON ?auto_1180718 ?auto_1180717 ) ( ON ?auto_1180719 ?auto_1180718 ) ( ON ?auto_1180720 ?auto_1180719 ) ( ON ?auto_1180721 ?auto_1180720 ) ( ON ?auto_1180722 ?auto_1180721 ) ( not ( = ?auto_1180717 ?auto_1180718 ) ) ( not ( = ?auto_1180717 ?auto_1180719 ) ) ( not ( = ?auto_1180717 ?auto_1180720 ) ) ( not ( = ?auto_1180717 ?auto_1180721 ) ) ( not ( = ?auto_1180717 ?auto_1180722 ) ) ( not ( = ?auto_1180717 ?auto_1180723 ) ) ( not ( = ?auto_1180717 ?auto_1180724 ) ) ( not ( = ?auto_1180717 ?auto_1180729 ) ) ( not ( = ?auto_1180718 ?auto_1180719 ) ) ( not ( = ?auto_1180718 ?auto_1180720 ) ) ( not ( = ?auto_1180718 ?auto_1180721 ) ) ( not ( = ?auto_1180718 ?auto_1180722 ) ) ( not ( = ?auto_1180718 ?auto_1180723 ) ) ( not ( = ?auto_1180718 ?auto_1180724 ) ) ( not ( = ?auto_1180718 ?auto_1180729 ) ) ( not ( = ?auto_1180719 ?auto_1180720 ) ) ( not ( = ?auto_1180719 ?auto_1180721 ) ) ( not ( = ?auto_1180719 ?auto_1180722 ) ) ( not ( = ?auto_1180719 ?auto_1180723 ) ) ( not ( = ?auto_1180719 ?auto_1180724 ) ) ( not ( = ?auto_1180719 ?auto_1180729 ) ) ( not ( = ?auto_1180720 ?auto_1180721 ) ) ( not ( = ?auto_1180720 ?auto_1180722 ) ) ( not ( = ?auto_1180720 ?auto_1180723 ) ) ( not ( = ?auto_1180720 ?auto_1180724 ) ) ( not ( = ?auto_1180720 ?auto_1180729 ) ) ( not ( = ?auto_1180721 ?auto_1180722 ) ) ( not ( = ?auto_1180721 ?auto_1180723 ) ) ( not ( = ?auto_1180721 ?auto_1180724 ) ) ( not ( = ?auto_1180721 ?auto_1180729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1180722 ?auto_1180723 ?auto_1180724 )
      ( MAKE-7CRATE-VERIFY ?auto_1180717 ?auto_1180718 ?auto_1180719 ?auto_1180720 ?auto_1180721 ?auto_1180722 ?auto_1180723 ?auto_1180724 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183636 - SURFACE
      ?auto_1183637 - SURFACE
      ?auto_1183638 - SURFACE
      ?auto_1183639 - SURFACE
      ?auto_1183640 - SURFACE
      ?auto_1183641 - SURFACE
      ?auto_1183642 - SURFACE
      ?auto_1183643 - SURFACE
      ?auto_1183644 - SURFACE
    )
    :vars
    (
      ?auto_1183645 - HOIST
      ?auto_1183646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183645 ?auto_1183646 ) ( SURFACE-AT ?auto_1183643 ?auto_1183646 ) ( CLEAR ?auto_1183643 ) ( LIFTING ?auto_1183645 ?auto_1183644 ) ( IS-CRATE ?auto_1183644 ) ( not ( = ?auto_1183643 ?auto_1183644 ) ) ( ON ?auto_1183637 ?auto_1183636 ) ( ON ?auto_1183638 ?auto_1183637 ) ( ON ?auto_1183639 ?auto_1183638 ) ( ON ?auto_1183640 ?auto_1183639 ) ( ON ?auto_1183641 ?auto_1183640 ) ( ON ?auto_1183642 ?auto_1183641 ) ( ON ?auto_1183643 ?auto_1183642 ) ( not ( = ?auto_1183636 ?auto_1183637 ) ) ( not ( = ?auto_1183636 ?auto_1183638 ) ) ( not ( = ?auto_1183636 ?auto_1183639 ) ) ( not ( = ?auto_1183636 ?auto_1183640 ) ) ( not ( = ?auto_1183636 ?auto_1183641 ) ) ( not ( = ?auto_1183636 ?auto_1183642 ) ) ( not ( = ?auto_1183636 ?auto_1183643 ) ) ( not ( = ?auto_1183636 ?auto_1183644 ) ) ( not ( = ?auto_1183637 ?auto_1183638 ) ) ( not ( = ?auto_1183637 ?auto_1183639 ) ) ( not ( = ?auto_1183637 ?auto_1183640 ) ) ( not ( = ?auto_1183637 ?auto_1183641 ) ) ( not ( = ?auto_1183637 ?auto_1183642 ) ) ( not ( = ?auto_1183637 ?auto_1183643 ) ) ( not ( = ?auto_1183637 ?auto_1183644 ) ) ( not ( = ?auto_1183638 ?auto_1183639 ) ) ( not ( = ?auto_1183638 ?auto_1183640 ) ) ( not ( = ?auto_1183638 ?auto_1183641 ) ) ( not ( = ?auto_1183638 ?auto_1183642 ) ) ( not ( = ?auto_1183638 ?auto_1183643 ) ) ( not ( = ?auto_1183638 ?auto_1183644 ) ) ( not ( = ?auto_1183639 ?auto_1183640 ) ) ( not ( = ?auto_1183639 ?auto_1183641 ) ) ( not ( = ?auto_1183639 ?auto_1183642 ) ) ( not ( = ?auto_1183639 ?auto_1183643 ) ) ( not ( = ?auto_1183639 ?auto_1183644 ) ) ( not ( = ?auto_1183640 ?auto_1183641 ) ) ( not ( = ?auto_1183640 ?auto_1183642 ) ) ( not ( = ?auto_1183640 ?auto_1183643 ) ) ( not ( = ?auto_1183640 ?auto_1183644 ) ) ( not ( = ?auto_1183641 ?auto_1183642 ) ) ( not ( = ?auto_1183641 ?auto_1183643 ) ) ( not ( = ?auto_1183641 ?auto_1183644 ) ) ( not ( = ?auto_1183642 ?auto_1183643 ) ) ( not ( = ?auto_1183642 ?auto_1183644 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1183643 ?auto_1183644 )
      ( MAKE-8CRATE-VERIFY ?auto_1183636 ?auto_1183637 ?auto_1183638 ?auto_1183639 ?auto_1183640 ?auto_1183641 ?auto_1183642 ?auto_1183643 ?auto_1183644 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183703 - SURFACE
      ?auto_1183704 - SURFACE
      ?auto_1183705 - SURFACE
      ?auto_1183706 - SURFACE
      ?auto_1183707 - SURFACE
      ?auto_1183708 - SURFACE
      ?auto_1183709 - SURFACE
      ?auto_1183710 - SURFACE
      ?auto_1183711 - SURFACE
    )
    :vars
    (
      ?auto_1183714 - HOIST
      ?auto_1183712 - PLACE
      ?auto_1183713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183714 ?auto_1183712 ) ( SURFACE-AT ?auto_1183710 ?auto_1183712 ) ( CLEAR ?auto_1183710 ) ( IS-CRATE ?auto_1183711 ) ( not ( = ?auto_1183710 ?auto_1183711 ) ) ( TRUCK-AT ?auto_1183713 ?auto_1183712 ) ( AVAILABLE ?auto_1183714 ) ( IN ?auto_1183711 ?auto_1183713 ) ( ON ?auto_1183710 ?auto_1183709 ) ( not ( = ?auto_1183709 ?auto_1183710 ) ) ( not ( = ?auto_1183709 ?auto_1183711 ) ) ( ON ?auto_1183704 ?auto_1183703 ) ( ON ?auto_1183705 ?auto_1183704 ) ( ON ?auto_1183706 ?auto_1183705 ) ( ON ?auto_1183707 ?auto_1183706 ) ( ON ?auto_1183708 ?auto_1183707 ) ( ON ?auto_1183709 ?auto_1183708 ) ( not ( = ?auto_1183703 ?auto_1183704 ) ) ( not ( = ?auto_1183703 ?auto_1183705 ) ) ( not ( = ?auto_1183703 ?auto_1183706 ) ) ( not ( = ?auto_1183703 ?auto_1183707 ) ) ( not ( = ?auto_1183703 ?auto_1183708 ) ) ( not ( = ?auto_1183703 ?auto_1183709 ) ) ( not ( = ?auto_1183703 ?auto_1183710 ) ) ( not ( = ?auto_1183703 ?auto_1183711 ) ) ( not ( = ?auto_1183704 ?auto_1183705 ) ) ( not ( = ?auto_1183704 ?auto_1183706 ) ) ( not ( = ?auto_1183704 ?auto_1183707 ) ) ( not ( = ?auto_1183704 ?auto_1183708 ) ) ( not ( = ?auto_1183704 ?auto_1183709 ) ) ( not ( = ?auto_1183704 ?auto_1183710 ) ) ( not ( = ?auto_1183704 ?auto_1183711 ) ) ( not ( = ?auto_1183705 ?auto_1183706 ) ) ( not ( = ?auto_1183705 ?auto_1183707 ) ) ( not ( = ?auto_1183705 ?auto_1183708 ) ) ( not ( = ?auto_1183705 ?auto_1183709 ) ) ( not ( = ?auto_1183705 ?auto_1183710 ) ) ( not ( = ?auto_1183705 ?auto_1183711 ) ) ( not ( = ?auto_1183706 ?auto_1183707 ) ) ( not ( = ?auto_1183706 ?auto_1183708 ) ) ( not ( = ?auto_1183706 ?auto_1183709 ) ) ( not ( = ?auto_1183706 ?auto_1183710 ) ) ( not ( = ?auto_1183706 ?auto_1183711 ) ) ( not ( = ?auto_1183707 ?auto_1183708 ) ) ( not ( = ?auto_1183707 ?auto_1183709 ) ) ( not ( = ?auto_1183707 ?auto_1183710 ) ) ( not ( = ?auto_1183707 ?auto_1183711 ) ) ( not ( = ?auto_1183708 ?auto_1183709 ) ) ( not ( = ?auto_1183708 ?auto_1183710 ) ) ( not ( = ?auto_1183708 ?auto_1183711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1183709 ?auto_1183710 ?auto_1183711 )
      ( MAKE-8CRATE-VERIFY ?auto_1183703 ?auto_1183704 ?auto_1183705 ?auto_1183706 ?auto_1183707 ?auto_1183708 ?auto_1183709 ?auto_1183710 ?auto_1183711 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183779 - SURFACE
      ?auto_1183780 - SURFACE
      ?auto_1183781 - SURFACE
      ?auto_1183782 - SURFACE
      ?auto_1183783 - SURFACE
      ?auto_1183784 - SURFACE
      ?auto_1183785 - SURFACE
      ?auto_1183786 - SURFACE
      ?auto_1183787 - SURFACE
    )
    :vars
    (
      ?auto_1183790 - HOIST
      ?auto_1183789 - PLACE
      ?auto_1183791 - TRUCK
      ?auto_1183788 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183790 ?auto_1183789 ) ( SURFACE-AT ?auto_1183786 ?auto_1183789 ) ( CLEAR ?auto_1183786 ) ( IS-CRATE ?auto_1183787 ) ( not ( = ?auto_1183786 ?auto_1183787 ) ) ( AVAILABLE ?auto_1183790 ) ( IN ?auto_1183787 ?auto_1183791 ) ( ON ?auto_1183786 ?auto_1183785 ) ( not ( = ?auto_1183785 ?auto_1183786 ) ) ( not ( = ?auto_1183785 ?auto_1183787 ) ) ( TRUCK-AT ?auto_1183791 ?auto_1183788 ) ( not ( = ?auto_1183788 ?auto_1183789 ) ) ( ON ?auto_1183780 ?auto_1183779 ) ( ON ?auto_1183781 ?auto_1183780 ) ( ON ?auto_1183782 ?auto_1183781 ) ( ON ?auto_1183783 ?auto_1183782 ) ( ON ?auto_1183784 ?auto_1183783 ) ( ON ?auto_1183785 ?auto_1183784 ) ( not ( = ?auto_1183779 ?auto_1183780 ) ) ( not ( = ?auto_1183779 ?auto_1183781 ) ) ( not ( = ?auto_1183779 ?auto_1183782 ) ) ( not ( = ?auto_1183779 ?auto_1183783 ) ) ( not ( = ?auto_1183779 ?auto_1183784 ) ) ( not ( = ?auto_1183779 ?auto_1183785 ) ) ( not ( = ?auto_1183779 ?auto_1183786 ) ) ( not ( = ?auto_1183779 ?auto_1183787 ) ) ( not ( = ?auto_1183780 ?auto_1183781 ) ) ( not ( = ?auto_1183780 ?auto_1183782 ) ) ( not ( = ?auto_1183780 ?auto_1183783 ) ) ( not ( = ?auto_1183780 ?auto_1183784 ) ) ( not ( = ?auto_1183780 ?auto_1183785 ) ) ( not ( = ?auto_1183780 ?auto_1183786 ) ) ( not ( = ?auto_1183780 ?auto_1183787 ) ) ( not ( = ?auto_1183781 ?auto_1183782 ) ) ( not ( = ?auto_1183781 ?auto_1183783 ) ) ( not ( = ?auto_1183781 ?auto_1183784 ) ) ( not ( = ?auto_1183781 ?auto_1183785 ) ) ( not ( = ?auto_1183781 ?auto_1183786 ) ) ( not ( = ?auto_1183781 ?auto_1183787 ) ) ( not ( = ?auto_1183782 ?auto_1183783 ) ) ( not ( = ?auto_1183782 ?auto_1183784 ) ) ( not ( = ?auto_1183782 ?auto_1183785 ) ) ( not ( = ?auto_1183782 ?auto_1183786 ) ) ( not ( = ?auto_1183782 ?auto_1183787 ) ) ( not ( = ?auto_1183783 ?auto_1183784 ) ) ( not ( = ?auto_1183783 ?auto_1183785 ) ) ( not ( = ?auto_1183783 ?auto_1183786 ) ) ( not ( = ?auto_1183783 ?auto_1183787 ) ) ( not ( = ?auto_1183784 ?auto_1183785 ) ) ( not ( = ?auto_1183784 ?auto_1183786 ) ) ( not ( = ?auto_1183784 ?auto_1183787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1183785 ?auto_1183786 ?auto_1183787 )
      ( MAKE-8CRATE-VERIFY ?auto_1183779 ?auto_1183780 ?auto_1183781 ?auto_1183782 ?auto_1183783 ?auto_1183784 ?auto_1183785 ?auto_1183786 ?auto_1183787 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183863 - SURFACE
      ?auto_1183864 - SURFACE
      ?auto_1183865 - SURFACE
      ?auto_1183866 - SURFACE
      ?auto_1183867 - SURFACE
      ?auto_1183868 - SURFACE
      ?auto_1183869 - SURFACE
      ?auto_1183870 - SURFACE
      ?auto_1183871 - SURFACE
    )
    :vars
    (
      ?auto_1183872 - HOIST
      ?auto_1183873 - PLACE
      ?auto_1183876 - TRUCK
      ?auto_1183874 - PLACE
      ?auto_1183875 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183872 ?auto_1183873 ) ( SURFACE-AT ?auto_1183870 ?auto_1183873 ) ( CLEAR ?auto_1183870 ) ( IS-CRATE ?auto_1183871 ) ( not ( = ?auto_1183870 ?auto_1183871 ) ) ( AVAILABLE ?auto_1183872 ) ( ON ?auto_1183870 ?auto_1183869 ) ( not ( = ?auto_1183869 ?auto_1183870 ) ) ( not ( = ?auto_1183869 ?auto_1183871 ) ) ( TRUCK-AT ?auto_1183876 ?auto_1183874 ) ( not ( = ?auto_1183874 ?auto_1183873 ) ) ( HOIST-AT ?auto_1183875 ?auto_1183874 ) ( LIFTING ?auto_1183875 ?auto_1183871 ) ( not ( = ?auto_1183872 ?auto_1183875 ) ) ( ON ?auto_1183864 ?auto_1183863 ) ( ON ?auto_1183865 ?auto_1183864 ) ( ON ?auto_1183866 ?auto_1183865 ) ( ON ?auto_1183867 ?auto_1183866 ) ( ON ?auto_1183868 ?auto_1183867 ) ( ON ?auto_1183869 ?auto_1183868 ) ( not ( = ?auto_1183863 ?auto_1183864 ) ) ( not ( = ?auto_1183863 ?auto_1183865 ) ) ( not ( = ?auto_1183863 ?auto_1183866 ) ) ( not ( = ?auto_1183863 ?auto_1183867 ) ) ( not ( = ?auto_1183863 ?auto_1183868 ) ) ( not ( = ?auto_1183863 ?auto_1183869 ) ) ( not ( = ?auto_1183863 ?auto_1183870 ) ) ( not ( = ?auto_1183863 ?auto_1183871 ) ) ( not ( = ?auto_1183864 ?auto_1183865 ) ) ( not ( = ?auto_1183864 ?auto_1183866 ) ) ( not ( = ?auto_1183864 ?auto_1183867 ) ) ( not ( = ?auto_1183864 ?auto_1183868 ) ) ( not ( = ?auto_1183864 ?auto_1183869 ) ) ( not ( = ?auto_1183864 ?auto_1183870 ) ) ( not ( = ?auto_1183864 ?auto_1183871 ) ) ( not ( = ?auto_1183865 ?auto_1183866 ) ) ( not ( = ?auto_1183865 ?auto_1183867 ) ) ( not ( = ?auto_1183865 ?auto_1183868 ) ) ( not ( = ?auto_1183865 ?auto_1183869 ) ) ( not ( = ?auto_1183865 ?auto_1183870 ) ) ( not ( = ?auto_1183865 ?auto_1183871 ) ) ( not ( = ?auto_1183866 ?auto_1183867 ) ) ( not ( = ?auto_1183866 ?auto_1183868 ) ) ( not ( = ?auto_1183866 ?auto_1183869 ) ) ( not ( = ?auto_1183866 ?auto_1183870 ) ) ( not ( = ?auto_1183866 ?auto_1183871 ) ) ( not ( = ?auto_1183867 ?auto_1183868 ) ) ( not ( = ?auto_1183867 ?auto_1183869 ) ) ( not ( = ?auto_1183867 ?auto_1183870 ) ) ( not ( = ?auto_1183867 ?auto_1183871 ) ) ( not ( = ?auto_1183868 ?auto_1183869 ) ) ( not ( = ?auto_1183868 ?auto_1183870 ) ) ( not ( = ?auto_1183868 ?auto_1183871 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1183869 ?auto_1183870 ?auto_1183871 )
      ( MAKE-8CRATE-VERIFY ?auto_1183863 ?auto_1183864 ?auto_1183865 ?auto_1183866 ?auto_1183867 ?auto_1183868 ?auto_1183869 ?auto_1183870 ?auto_1183871 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1183955 - SURFACE
      ?auto_1183956 - SURFACE
      ?auto_1183957 - SURFACE
      ?auto_1183958 - SURFACE
      ?auto_1183959 - SURFACE
      ?auto_1183960 - SURFACE
      ?auto_1183961 - SURFACE
      ?auto_1183962 - SURFACE
      ?auto_1183963 - SURFACE
    )
    :vars
    (
      ?auto_1183967 - HOIST
      ?auto_1183968 - PLACE
      ?auto_1183965 - TRUCK
      ?auto_1183969 - PLACE
      ?auto_1183964 - HOIST
      ?auto_1183966 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183967 ?auto_1183968 ) ( SURFACE-AT ?auto_1183962 ?auto_1183968 ) ( CLEAR ?auto_1183962 ) ( IS-CRATE ?auto_1183963 ) ( not ( = ?auto_1183962 ?auto_1183963 ) ) ( AVAILABLE ?auto_1183967 ) ( ON ?auto_1183962 ?auto_1183961 ) ( not ( = ?auto_1183961 ?auto_1183962 ) ) ( not ( = ?auto_1183961 ?auto_1183963 ) ) ( TRUCK-AT ?auto_1183965 ?auto_1183969 ) ( not ( = ?auto_1183969 ?auto_1183968 ) ) ( HOIST-AT ?auto_1183964 ?auto_1183969 ) ( not ( = ?auto_1183967 ?auto_1183964 ) ) ( AVAILABLE ?auto_1183964 ) ( SURFACE-AT ?auto_1183963 ?auto_1183969 ) ( ON ?auto_1183963 ?auto_1183966 ) ( CLEAR ?auto_1183963 ) ( not ( = ?auto_1183962 ?auto_1183966 ) ) ( not ( = ?auto_1183963 ?auto_1183966 ) ) ( not ( = ?auto_1183961 ?auto_1183966 ) ) ( ON ?auto_1183956 ?auto_1183955 ) ( ON ?auto_1183957 ?auto_1183956 ) ( ON ?auto_1183958 ?auto_1183957 ) ( ON ?auto_1183959 ?auto_1183958 ) ( ON ?auto_1183960 ?auto_1183959 ) ( ON ?auto_1183961 ?auto_1183960 ) ( not ( = ?auto_1183955 ?auto_1183956 ) ) ( not ( = ?auto_1183955 ?auto_1183957 ) ) ( not ( = ?auto_1183955 ?auto_1183958 ) ) ( not ( = ?auto_1183955 ?auto_1183959 ) ) ( not ( = ?auto_1183955 ?auto_1183960 ) ) ( not ( = ?auto_1183955 ?auto_1183961 ) ) ( not ( = ?auto_1183955 ?auto_1183962 ) ) ( not ( = ?auto_1183955 ?auto_1183963 ) ) ( not ( = ?auto_1183955 ?auto_1183966 ) ) ( not ( = ?auto_1183956 ?auto_1183957 ) ) ( not ( = ?auto_1183956 ?auto_1183958 ) ) ( not ( = ?auto_1183956 ?auto_1183959 ) ) ( not ( = ?auto_1183956 ?auto_1183960 ) ) ( not ( = ?auto_1183956 ?auto_1183961 ) ) ( not ( = ?auto_1183956 ?auto_1183962 ) ) ( not ( = ?auto_1183956 ?auto_1183963 ) ) ( not ( = ?auto_1183956 ?auto_1183966 ) ) ( not ( = ?auto_1183957 ?auto_1183958 ) ) ( not ( = ?auto_1183957 ?auto_1183959 ) ) ( not ( = ?auto_1183957 ?auto_1183960 ) ) ( not ( = ?auto_1183957 ?auto_1183961 ) ) ( not ( = ?auto_1183957 ?auto_1183962 ) ) ( not ( = ?auto_1183957 ?auto_1183963 ) ) ( not ( = ?auto_1183957 ?auto_1183966 ) ) ( not ( = ?auto_1183958 ?auto_1183959 ) ) ( not ( = ?auto_1183958 ?auto_1183960 ) ) ( not ( = ?auto_1183958 ?auto_1183961 ) ) ( not ( = ?auto_1183958 ?auto_1183962 ) ) ( not ( = ?auto_1183958 ?auto_1183963 ) ) ( not ( = ?auto_1183958 ?auto_1183966 ) ) ( not ( = ?auto_1183959 ?auto_1183960 ) ) ( not ( = ?auto_1183959 ?auto_1183961 ) ) ( not ( = ?auto_1183959 ?auto_1183962 ) ) ( not ( = ?auto_1183959 ?auto_1183963 ) ) ( not ( = ?auto_1183959 ?auto_1183966 ) ) ( not ( = ?auto_1183960 ?auto_1183961 ) ) ( not ( = ?auto_1183960 ?auto_1183962 ) ) ( not ( = ?auto_1183960 ?auto_1183963 ) ) ( not ( = ?auto_1183960 ?auto_1183966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1183961 ?auto_1183962 ?auto_1183963 )
      ( MAKE-8CRATE-VERIFY ?auto_1183955 ?auto_1183956 ?auto_1183957 ?auto_1183958 ?auto_1183959 ?auto_1183960 ?auto_1183961 ?auto_1183962 ?auto_1183963 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1184048 - SURFACE
      ?auto_1184049 - SURFACE
      ?auto_1184050 - SURFACE
      ?auto_1184051 - SURFACE
      ?auto_1184052 - SURFACE
      ?auto_1184053 - SURFACE
      ?auto_1184054 - SURFACE
      ?auto_1184055 - SURFACE
      ?auto_1184056 - SURFACE
    )
    :vars
    (
      ?auto_1184060 - HOIST
      ?auto_1184059 - PLACE
      ?auto_1184061 - PLACE
      ?auto_1184062 - HOIST
      ?auto_1184057 - SURFACE
      ?auto_1184058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1184060 ?auto_1184059 ) ( SURFACE-AT ?auto_1184055 ?auto_1184059 ) ( CLEAR ?auto_1184055 ) ( IS-CRATE ?auto_1184056 ) ( not ( = ?auto_1184055 ?auto_1184056 ) ) ( AVAILABLE ?auto_1184060 ) ( ON ?auto_1184055 ?auto_1184054 ) ( not ( = ?auto_1184054 ?auto_1184055 ) ) ( not ( = ?auto_1184054 ?auto_1184056 ) ) ( not ( = ?auto_1184061 ?auto_1184059 ) ) ( HOIST-AT ?auto_1184062 ?auto_1184061 ) ( not ( = ?auto_1184060 ?auto_1184062 ) ) ( AVAILABLE ?auto_1184062 ) ( SURFACE-AT ?auto_1184056 ?auto_1184061 ) ( ON ?auto_1184056 ?auto_1184057 ) ( CLEAR ?auto_1184056 ) ( not ( = ?auto_1184055 ?auto_1184057 ) ) ( not ( = ?auto_1184056 ?auto_1184057 ) ) ( not ( = ?auto_1184054 ?auto_1184057 ) ) ( TRUCK-AT ?auto_1184058 ?auto_1184059 ) ( ON ?auto_1184049 ?auto_1184048 ) ( ON ?auto_1184050 ?auto_1184049 ) ( ON ?auto_1184051 ?auto_1184050 ) ( ON ?auto_1184052 ?auto_1184051 ) ( ON ?auto_1184053 ?auto_1184052 ) ( ON ?auto_1184054 ?auto_1184053 ) ( not ( = ?auto_1184048 ?auto_1184049 ) ) ( not ( = ?auto_1184048 ?auto_1184050 ) ) ( not ( = ?auto_1184048 ?auto_1184051 ) ) ( not ( = ?auto_1184048 ?auto_1184052 ) ) ( not ( = ?auto_1184048 ?auto_1184053 ) ) ( not ( = ?auto_1184048 ?auto_1184054 ) ) ( not ( = ?auto_1184048 ?auto_1184055 ) ) ( not ( = ?auto_1184048 ?auto_1184056 ) ) ( not ( = ?auto_1184048 ?auto_1184057 ) ) ( not ( = ?auto_1184049 ?auto_1184050 ) ) ( not ( = ?auto_1184049 ?auto_1184051 ) ) ( not ( = ?auto_1184049 ?auto_1184052 ) ) ( not ( = ?auto_1184049 ?auto_1184053 ) ) ( not ( = ?auto_1184049 ?auto_1184054 ) ) ( not ( = ?auto_1184049 ?auto_1184055 ) ) ( not ( = ?auto_1184049 ?auto_1184056 ) ) ( not ( = ?auto_1184049 ?auto_1184057 ) ) ( not ( = ?auto_1184050 ?auto_1184051 ) ) ( not ( = ?auto_1184050 ?auto_1184052 ) ) ( not ( = ?auto_1184050 ?auto_1184053 ) ) ( not ( = ?auto_1184050 ?auto_1184054 ) ) ( not ( = ?auto_1184050 ?auto_1184055 ) ) ( not ( = ?auto_1184050 ?auto_1184056 ) ) ( not ( = ?auto_1184050 ?auto_1184057 ) ) ( not ( = ?auto_1184051 ?auto_1184052 ) ) ( not ( = ?auto_1184051 ?auto_1184053 ) ) ( not ( = ?auto_1184051 ?auto_1184054 ) ) ( not ( = ?auto_1184051 ?auto_1184055 ) ) ( not ( = ?auto_1184051 ?auto_1184056 ) ) ( not ( = ?auto_1184051 ?auto_1184057 ) ) ( not ( = ?auto_1184052 ?auto_1184053 ) ) ( not ( = ?auto_1184052 ?auto_1184054 ) ) ( not ( = ?auto_1184052 ?auto_1184055 ) ) ( not ( = ?auto_1184052 ?auto_1184056 ) ) ( not ( = ?auto_1184052 ?auto_1184057 ) ) ( not ( = ?auto_1184053 ?auto_1184054 ) ) ( not ( = ?auto_1184053 ?auto_1184055 ) ) ( not ( = ?auto_1184053 ?auto_1184056 ) ) ( not ( = ?auto_1184053 ?auto_1184057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1184054 ?auto_1184055 ?auto_1184056 )
      ( MAKE-8CRATE-VERIFY ?auto_1184048 ?auto_1184049 ?auto_1184050 ?auto_1184051 ?auto_1184052 ?auto_1184053 ?auto_1184054 ?auto_1184055 ?auto_1184056 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1184141 - SURFACE
      ?auto_1184142 - SURFACE
      ?auto_1184143 - SURFACE
      ?auto_1184144 - SURFACE
      ?auto_1184145 - SURFACE
      ?auto_1184146 - SURFACE
      ?auto_1184147 - SURFACE
      ?auto_1184148 - SURFACE
      ?auto_1184149 - SURFACE
    )
    :vars
    (
      ?auto_1184153 - HOIST
      ?auto_1184152 - PLACE
      ?auto_1184154 - PLACE
      ?auto_1184155 - HOIST
      ?auto_1184150 - SURFACE
      ?auto_1184151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1184153 ?auto_1184152 ) ( IS-CRATE ?auto_1184149 ) ( not ( = ?auto_1184148 ?auto_1184149 ) ) ( not ( = ?auto_1184147 ?auto_1184148 ) ) ( not ( = ?auto_1184147 ?auto_1184149 ) ) ( not ( = ?auto_1184154 ?auto_1184152 ) ) ( HOIST-AT ?auto_1184155 ?auto_1184154 ) ( not ( = ?auto_1184153 ?auto_1184155 ) ) ( AVAILABLE ?auto_1184155 ) ( SURFACE-AT ?auto_1184149 ?auto_1184154 ) ( ON ?auto_1184149 ?auto_1184150 ) ( CLEAR ?auto_1184149 ) ( not ( = ?auto_1184148 ?auto_1184150 ) ) ( not ( = ?auto_1184149 ?auto_1184150 ) ) ( not ( = ?auto_1184147 ?auto_1184150 ) ) ( TRUCK-AT ?auto_1184151 ?auto_1184152 ) ( SURFACE-AT ?auto_1184147 ?auto_1184152 ) ( CLEAR ?auto_1184147 ) ( LIFTING ?auto_1184153 ?auto_1184148 ) ( IS-CRATE ?auto_1184148 ) ( ON ?auto_1184142 ?auto_1184141 ) ( ON ?auto_1184143 ?auto_1184142 ) ( ON ?auto_1184144 ?auto_1184143 ) ( ON ?auto_1184145 ?auto_1184144 ) ( ON ?auto_1184146 ?auto_1184145 ) ( ON ?auto_1184147 ?auto_1184146 ) ( not ( = ?auto_1184141 ?auto_1184142 ) ) ( not ( = ?auto_1184141 ?auto_1184143 ) ) ( not ( = ?auto_1184141 ?auto_1184144 ) ) ( not ( = ?auto_1184141 ?auto_1184145 ) ) ( not ( = ?auto_1184141 ?auto_1184146 ) ) ( not ( = ?auto_1184141 ?auto_1184147 ) ) ( not ( = ?auto_1184141 ?auto_1184148 ) ) ( not ( = ?auto_1184141 ?auto_1184149 ) ) ( not ( = ?auto_1184141 ?auto_1184150 ) ) ( not ( = ?auto_1184142 ?auto_1184143 ) ) ( not ( = ?auto_1184142 ?auto_1184144 ) ) ( not ( = ?auto_1184142 ?auto_1184145 ) ) ( not ( = ?auto_1184142 ?auto_1184146 ) ) ( not ( = ?auto_1184142 ?auto_1184147 ) ) ( not ( = ?auto_1184142 ?auto_1184148 ) ) ( not ( = ?auto_1184142 ?auto_1184149 ) ) ( not ( = ?auto_1184142 ?auto_1184150 ) ) ( not ( = ?auto_1184143 ?auto_1184144 ) ) ( not ( = ?auto_1184143 ?auto_1184145 ) ) ( not ( = ?auto_1184143 ?auto_1184146 ) ) ( not ( = ?auto_1184143 ?auto_1184147 ) ) ( not ( = ?auto_1184143 ?auto_1184148 ) ) ( not ( = ?auto_1184143 ?auto_1184149 ) ) ( not ( = ?auto_1184143 ?auto_1184150 ) ) ( not ( = ?auto_1184144 ?auto_1184145 ) ) ( not ( = ?auto_1184144 ?auto_1184146 ) ) ( not ( = ?auto_1184144 ?auto_1184147 ) ) ( not ( = ?auto_1184144 ?auto_1184148 ) ) ( not ( = ?auto_1184144 ?auto_1184149 ) ) ( not ( = ?auto_1184144 ?auto_1184150 ) ) ( not ( = ?auto_1184145 ?auto_1184146 ) ) ( not ( = ?auto_1184145 ?auto_1184147 ) ) ( not ( = ?auto_1184145 ?auto_1184148 ) ) ( not ( = ?auto_1184145 ?auto_1184149 ) ) ( not ( = ?auto_1184145 ?auto_1184150 ) ) ( not ( = ?auto_1184146 ?auto_1184147 ) ) ( not ( = ?auto_1184146 ?auto_1184148 ) ) ( not ( = ?auto_1184146 ?auto_1184149 ) ) ( not ( = ?auto_1184146 ?auto_1184150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1184147 ?auto_1184148 ?auto_1184149 )
      ( MAKE-8CRATE-VERIFY ?auto_1184141 ?auto_1184142 ?auto_1184143 ?auto_1184144 ?auto_1184145 ?auto_1184146 ?auto_1184147 ?auto_1184148 ?auto_1184149 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1184234 - SURFACE
      ?auto_1184235 - SURFACE
      ?auto_1184236 - SURFACE
      ?auto_1184237 - SURFACE
      ?auto_1184238 - SURFACE
      ?auto_1184239 - SURFACE
      ?auto_1184240 - SURFACE
      ?auto_1184241 - SURFACE
      ?auto_1184242 - SURFACE
    )
    :vars
    (
      ?auto_1184246 - HOIST
      ?auto_1184245 - PLACE
      ?auto_1184248 - PLACE
      ?auto_1184247 - HOIST
      ?auto_1184244 - SURFACE
      ?auto_1184243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1184246 ?auto_1184245 ) ( IS-CRATE ?auto_1184242 ) ( not ( = ?auto_1184241 ?auto_1184242 ) ) ( not ( = ?auto_1184240 ?auto_1184241 ) ) ( not ( = ?auto_1184240 ?auto_1184242 ) ) ( not ( = ?auto_1184248 ?auto_1184245 ) ) ( HOIST-AT ?auto_1184247 ?auto_1184248 ) ( not ( = ?auto_1184246 ?auto_1184247 ) ) ( AVAILABLE ?auto_1184247 ) ( SURFACE-AT ?auto_1184242 ?auto_1184248 ) ( ON ?auto_1184242 ?auto_1184244 ) ( CLEAR ?auto_1184242 ) ( not ( = ?auto_1184241 ?auto_1184244 ) ) ( not ( = ?auto_1184242 ?auto_1184244 ) ) ( not ( = ?auto_1184240 ?auto_1184244 ) ) ( TRUCK-AT ?auto_1184243 ?auto_1184245 ) ( SURFACE-AT ?auto_1184240 ?auto_1184245 ) ( CLEAR ?auto_1184240 ) ( IS-CRATE ?auto_1184241 ) ( AVAILABLE ?auto_1184246 ) ( IN ?auto_1184241 ?auto_1184243 ) ( ON ?auto_1184235 ?auto_1184234 ) ( ON ?auto_1184236 ?auto_1184235 ) ( ON ?auto_1184237 ?auto_1184236 ) ( ON ?auto_1184238 ?auto_1184237 ) ( ON ?auto_1184239 ?auto_1184238 ) ( ON ?auto_1184240 ?auto_1184239 ) ( not ( = ?auto_1184234 ?auto_1184235 ) ) ( not ( = ?auto_1184234 ?auto_1184236 ) ) ( not ( = ?auto_1184234 ?auto_1184237 ) ) ( not ( = ?auto_1184234 ?auto_1184238 ) ) ( not ( = ?auto_1184234 ?auto_1184239 ) ) ( not ( = ?auto_1184234 ?auto_1184240 ) ) ( not ( = ?auto_1184234 ?auto_1184241 ) ) ( not ( = ?auto_1184234 ?auto_1184242 ) ) ( not ( = ?auto_1184234 ?auto_1184244 ) ) ( not ( = ?auto_1184235 ?auto_1184236 ) ) ( not ( = ?auto_1184235 ?auto_1184237 ) ) ( not ( = ?auto_1184235 ?auto_1184238 ) ) ( not ( = ?auto_1184235 ?auto_1184239 ) ) ( not ( = ?auto_1184235 ?auto_1184240 ) ) ( not ( = ?auto_1184235 ?auto_1184241 ) ) ( not ( = ?auto_1184235 ?auto_1184242 ) ) ( not ( = ?auto_1184235 ?auto_1184244 ) ) ( not ( = ?auto_1184236 ?auto_1184237 ) ) ( not ( = ?auto_1184236 ?auto_1184238 ) ) ( not ( = ?auto_1184236 ?auto_1184239 ) ) ( not ( = ?auto_1184236 ?auto_1184240 ) ) ( not ( = ?auto_1184236 ?auto_1184241 ) ) ( not ( = ?auto_1184236 ?auto_1184242 ) ) ( not ( = ?auto_1184236 ?auto_1184244 ) ) ( not ( = ?auto_1184237 ?auto_1184238 ) ) ( not ( = ?auto_1184237 ?auto_1184239 ) ) ( not ( = ?auto_1184237 ?auto_1184240 ) ) ( not ( = ?auto_1184237 ?auto_1184241 ) ) ( not ( = ?auto_1184237 ?auto_1184242 ) ) ( not ( = ?auto_1184237 ?auto_1184244 ) ) ( not ( = ?auto_1184238 ?auto_1184239 ) ) ( not ( = ?auto_1184238 ?auto_1184240 ) ) ( not ( = ?auto_1184238 ?auto_1184241 ) ) ( not ( = ?auto_1184238 ?auto_1184242 ) ) ( not ( = ?auto_1184238 ?auto_1184244 ) ) ( not ( = ?auto_1184239 ?auto_1184240 ) ) ( not ( = ?auto_1184239 ?auto_1184241 ) ) ( not ( = ?auto_1184239 ?auto_1184242 ) ) ( not ( = ?auto_1184239 ?auto_1184244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1184240 ?auto_1184241 ?auto_1184242 )
      ( MAKE-8CRATE-VERIFY ?auto_1184234 ?auto_1184235 ?auto_1184236 ?auto_1184237 ?auto_1184238 ?auto_1184239 ?auto_1184240 ?auto_1184241 ?auto_1184242 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1186729 - SURFACE
      ?auto_1186730 - SURFACE
    )
    :vars
    (
      ?auto_1186735 - HOIST
      ?auto_1186732 - PLACE
      ?auto_1186733 - SURFACE
      ?auto_1186736 - TRUCK
      ?auto_1186731 - PLACE
      ?auto_1186734 - HOIST
      ?auto_1186737 - SURFACE
      ?auto_1186738 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1186735 ?auto_1186732 ) ( SURFACE-AT ?auto_1186729 ?auto_1186732 ) ( CLEAR ?auto_1186729 ) ( IS-CRATE ?auto_1186730 ) ( not ( = ?auto_1186729 ?auto_1186730 ) ) ( AVAILABLE ?auto_1186735 ) ( ON ?auto_1186729 ?auto_1186733 ) ( not ( = ?auto_1186733 ?auto_1186729 ) ) ( not ( = ?auto_1186733 ?auto_1186730 ) ) ( TRUCK-AT ?auto_1186736 ?auto_1186731 ) ( not ( = ?auto_1186731 ?auto_1186732 ) ) ( HOIST-AT ?auto_1186734 ?auto_1186731 ) ( not ( = ?auto_1186735 ?auto_1186734 ) ) ( SURFACE-AT ?auto_1186730 ?auto_1186731 ) ( ON ?auto_1186730 ?auto_1186737 ) ( CLEAR ?auto_1186730 ) ( not ( = ?auto_1186729 ?auto_1186737 ) ) ( not ( = ?auto_1186730 ?auto_1186737 ) ) ( not ( = ?auto_1186733 ?auto_1186737 ) ) ( LIFTING ?auto_1186734 ?auto_1186738 ) ( IS-CRATE ?auto_1186738 ) ( not ( = ?auto_1186729 ?auto_1186738 ) ) ( not ( = ?auto_1186730 ?auto_1186738 ) ) ( not ( = ?auto_1186733 ?auto_1186738 ) ) ( not ( = ?auto_1186737 ?auto_1186738 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1186734 ?auto_1186738 ?auto_1186736 ?auto_1186731 )
      ( MAKE-1CRATE ?auto_1186729 ?auto_1186730 )
      ( MAKE-1CRATE-VERIFY ?auto_1186729 ?auto_1186730 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188340 - SURFACE
      ?auto_1188341 - SURFACE
      ?auto_1188342 - SURFACE
      ?auto_1188343 - SURFACE
      ?auto_1188344 - SURFACE
      ?auto_1188345 - SURFACE
      ?auto_1188346 - SURFACE
      ?auto_1188347 - SURFACE
      ?auto_1188348 - SURFACE
      ?auto_1188349 - SURFACE
    )
    :vars
    (
      ?auto_1188350 - HOIST
      ?auto_1188351 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188350 ?auto_1188351 ) ( SURFACE-AT ?auto_1188348 ?auto_1188351 ) ( CLEAR ?auto_1188348 ) ( LIFTING ?auto_1188350 ?auto_1188349 ) ( IS-CRATE ?auto_1188349 ) ( not ( = ?auto_1188348 ?auto_1188349 ) ) ( ON ?auto_1188341 ?auto_1188340 ) ( ON ?auto_1188342 ?auto_1188341 ) ( ON ?auto_1188343 ?auto_1188342 ) ( ON ?auto_1188344 ?auto_1188343 ) ( ON ?auto_1188345 ?auto_1188344 ) ( ON ?auto_1188346 ?auto_1188345 ) ( ON ?auto_1188347 ?auto_1188346 ) ( ON ?auto_1188348 ?auto_1188347 ) ( not ( = ?auto_1188340 ?auto_1188341 ) ) ( not ( = ?auto_1188340 ?auto_1188342 ) ) ( not ( = ?auto_1188340 ?auto_1188343 ) ) ( not ( = ?auto_1188340 ?auto_1188344 ) ) ( not ( = ?auto_1188340 ?auto_1188345 ) ) ( not ( = ?auto_1188340 ?auto_1188346 ) ) ( not ( = ?auto_1188340 ?auto_1188347 ) ) ( not ( = ?auto_1188340 ?auto_1188348 ) ) ( not ( = ?auto_1188340 ?auto_1188349 ) ) ( not ( = ?auto_1188341 ?auto_1188342 ) ) ( not ( = ?auto_1188341 ?auto_1188343 ) ) ( not ( = ?auto_1188341 ?auto_1188344 ) ) ( not ( = ?auto_1188341 ?auto_1188345 ) ) ( not ( = ?auto_1188341 ?auto_1188346 ) ) ( not ( = ?auto_1188341 ?auto_1188347 ) ) ( not ( = ?auto_1188341 ?auto_1188348 ) ) ( not ( = ?auto_1188341 ?auto_1188349 ) ) ( not ( = ?auto_1188342 ?auto_1188343 ) ) ( not ( = ?auto_1188342 ?auto_1188344 ) ) ( not ( = ?auto_1188342 ?auto_1188345 ) ) ( not ( = ?auto_1188342 ?auto_1188346 ) ) ( not ( = ?auto_1188342 ?auto_1188347 ) ) ( not ( = ?auto_1188342 ?auto_1188348 ) ) ( not ( = ?auto_1188342 ?auto_1188349 ) ) ( not ( = ?auto_1188343 ?auto_1188344 ) ) ( not ( = ?auto_1188343 ?auto_1188345 ) ) ( not ( = ?auto_1188343 ?auto_1188346 ) ) ( not ( = ?auto_1188343 ?auto_1188347 ) ) ( not ( = ?auto_1188343 ?auto_1188348 ) ) ( not ( = ?auto_1188343 ?auto_1188349 ) ) ( not ( = ?auto_1188344 ?auto_1188345 ) ) ( not ( = ?auto_1188344 ?auto_1188346 ) ) ( not ( = ?auto_1188344 ?auto_1188347 ) ) ( not ( = ?auto_1188344 ?auto_1188348 ) ) ( not ( = ?auto_1188344 ?auto_1188349 ) ) ( not ( = ?auto_1188345 ?auto_1188346 ) ) ( not ( = ?auto_1188345 ?auto_1188347 ) ) ( not ( = ?auto_1188345 ?auto_1188348 ) ) ( not ( = ?auto_1188345 ?auto_1188349 ) ) ( not ( = ?auto_1188346 ?auto_1188347 ) ) ( not ( = ?auto_1188346 ?auto_1188348 ) ) ( not ( = ?auto_1188346 ?auto_1188349 ) ) ( not ( = ?auto_1188347 ?auto_1188348 ) ) ( not ( = ?auto_1188347 ?auto_1188349 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1188348 ?auto_1188349 )
      ( MAKE-9CRATE-VERIFY ?auto_1188340 ?auto_1188341 ?auto_1188342 ?auto_1188343 ?auto_1188344 ?auto_1188345 ?auto_1188346 ?auto_1188347 ?auto_1188348 ?auto_1188349 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188420 - SURFACE
      ?auto_1188421 - SURFACE
      ?auto_1188422 - SURFACE
      ?auto_1188423 - SURFACE
      ?auto_1188424 - SURFACE
      ?auto_1188425 - SURFACE
      ?auto_1188426 - SURFACE
      ?auto_1188427 - SURFACE
      ?auto_1188428 - SURFACE
      ?auto_1188429 - SURFACE
    )
    :vars
    (
      ?auto_1188432 - HOIST
      ?auto_1188431 - PLACE
      ?auto_1188430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188432 ?auto_1188431 ) ( SURFACE-AT ?auto_1188428 ?auto_1188431 ) ( CLEAR ?auto_1188428 ) ( IS-CRATE ?auto_1188429 ) ( not ( = ?auto_1188428 ?auto_1188429 ) ) ( TRUCK-AT ?auto_1188430 ?auto_1188431 ) ( AVAILABLE ?auto_1188432 ) ( IN ?auto_1188429 ?auto_1188430 ) ( ON ?auto_1188428 ?auto_1188427 ) ( not ( = ?auto_1188427 ?auto_1188428 ) ) ( not ( = ?auto_1188427 ?auto_1188429 ) ) ( ON ?auto_1188421 ?auto_1188420 ) ( ON ?auto_1188422 ?auto_1188421 ) ( ON ?auto_1188423 ?auto_1188422 ) ( ON ?auto_1188424 ?auto_1188423 ) ( ON ?auto_1188425 ?auto_1188424 ) ( ON ?auto_1188426 ?auto_1188425 ) ( ON ?auto_1188427 ?auto_1188426 ) ( not ( = ?auto_1188420 ?auto_1188421 ) ) ( not ( = ?auto_1188420 ?auto_1188422 ) ) ( not ( = ?auto_1188420 ?auto_1188423 ) ) ( not ( = ?auto_1188420 ?auto_1188424 ) ) ( not ( = ?auto_1188420 ?auto_1188425 ) ) ( not ( = ?auto_1188420 ?auto_1188426 ) ) ( not ( = ?auto_1188420 ?auto_1188427 ) ) ( not ( = ?auto_1188420 ?auto_1188428 ) ) ( not ( = ?auto_1188420 ?auto_1188429 ) ) ( not ( = ?auto_1188421 ?auto_1188422 ) ) ( not ( = ?auto_1188421 ?auto_1188423 ) ) ( not ( = ?auto_1188421 ?auto_1188424 ) ) ( not ( = ?auto_1188421 ?auto_1188425 ) ) ( not ( = ?auto_1188421 ?auto_1188426 ) ) ( not ( = ?auto_1188421 ?auto_1188427 ) ) ( not ( = ?auto_1188421 ?auto_1188428 ) ) ( not ( = ?auto_1188421 ?auto_1188429 ) ) ( not ( = ?auto_1188422 ?auto_1188423 ) ) ( not ( = ?auto_1188422 ?auto_1188424 ) ) ( not ( = ?auto_1188422 ?auto_1188425 ) ) ( not ( = ?auto_1188422 ?auto_1188426 ) ) ( not ( = ?auto_1188422 ?auto_1188427 ) ) ( not ( = ?auto_1188422 ?auto_1188428 ) ) ( not ( = ?auto_1188422 ?auto_1188429 ) ) ( not ( = ?auto_1188423 ?auto_1188424 ) ) ( not ( = ?auto_1188423 ?auto_1188425 ) ) ( not ( = ?auto_1188423 ?auto_1188426 ) ) ( not ( = ?auto_1188423 ?auto_1188427 ) ) ( not ( = ?auto_1188423 ?auto_1188428 ) ) ( not ( = ?auto_1188423 ?auto_1188429 ) ) ( not ( = ?auto_1188424 ?auto_1188425 ) ) ( not ( = ?auto_1188424 ?auto_1188426 ) ) ( not ( = ?auto_1188424 ?auto_1188427 ) ) ( not ( = ?auto_1188424 ?auto_1188428 ) ) ( not ( = ?auto_1188424 ?auto_1188429 ) ) ( not ( = ?auto_1188425 ?auto_1188426 ) ) ( not ( = ?auto_1188425 ?auto_1188427 ) ) ( not ( = ?auto_1188425 ?auto_1188428 ) ) ( not ( = ?auto_1188425 ?auto_1188429 ) ) ( not ( = ?auto_1188426 ?auto_1188427 ) ) ( not ( = ?auto_1188426 ?auto_1188428 ) ) ( not ( = ?auto_1188426 ?auto_1188429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188427 ?auto_1188428 ?auto_1188429 )
      ( MAKE-9CRATE-VERIFY ?auto_1188420 ?auto_1188421 ?auto_1188422 ?auto_1188423 ?auto_1188424 ?auto_1188425 ?auto_1188426 ?auto_1188427 ?auto_1188428 ?auto_1188429 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188510 - SURFACE
      ?auto_1188511 - SURFACE
      ?auto_1188512 - SURFACE
      ?auto_1188513 - SURFACE
      ?auto_1188514 - SURFACE
      ?auto_1188515 - SURFACE
      ?auto_1188516 - SURFACE
      ?auto_1188517 - SURFACE
      ?auto_1188518 - SURFACE
      ?auto_1188519 - SURFACE
    )
    :vars
    (
      ?auto_1188523 - HOIST
      ?auto_1188520 - PLACE
      ?auto_1188522 - TRUCK
      ?auto_1188521 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188523 ?auto_1188520 ) ( SURFACE-AT ?auto_1188518 ?auto_1188520 ) ( CLEAR ?auto_1188518 ) ( IS-CRATE ?auto_1188519 ) ( not ( = ?auto_1188518 ?auto_1188519 ) ) ( AVAILABLE ?auto_1188523 ) ( IN ?auto_1188519 ?auto_1188522 ) ( ON ?auto_1188518 ?auto_1188517 ) ( not ( = ?auto_1188517 ?auto_1188518 ) ) ( not ( = ?auto_1188517 ?auto_1188519 ) ) ( TRUCK-AT ?auto_1188522 ?auto_1188521 ) ( not ( = ?auto_1188521 ?auto_1188520 ) ) ( ON ?auto_1188511 ?auto_1188510 ) ( ON ?auto_1188512 ?auto_1188511 ) ( ON ?auto_1188513 ?auto_1188512 ) ( ON ?auto_1188514 ?auto_1188513 ) ( ON ?auto_1188515 ?auto_1188514 ) ( ON ?auto_1188516 ?auto_1188515 ) ( ON ?auto_1188517 ?auto_1188516 ) ( not ( = ?auto_1188510 ?auto_1188511 ) ) ( not ( = ?auto_1188510 ?auto_1188512 ) ) ( not ( = ?auto_1188510 ?auto_1188513 ) ) ( not ( = ?auto_1188510 ?auto_1188514 ) ) ( not ( = ?auto_1188510 ?auto_1188515 ) ) ( not ( = ?auto_1188510 ?auto_1188516 ) ) ( not ( = ?auto_1188510 ?auto_1188517 ) ) ( not ( = ?auto_1188510 ?auto_1188518 ) ) ( not ( = ?auto_1188510 ?auto_1188519 ) ) ( not ( = ?auto_1188511 ?auto_1188512 ) ) ( not ( = ?auto_1188511 ?auto_1188513 ) ) ( not ( = ?auto_1188511 ?auto_1188514 ) ) ( not ( = ?auto_1188511 ?auto_1188515 ) ) ( not ( = ?auto_1188511 ?auto_1188516 ) ) ( not ( = ?auto_1188511 ?auto_1188517 ) ) ( not ( = ?auto_1188511 ?auto_1188518 ) ) ( not ( = ?auto_1188511 ?auto_1188519 ) ) ( not ( = ?auto_1188512 ?auto_1188513 ) ) ( not ( = ?auto_1188512 ?auto_1188514 ) ) ( not ( = ?auto_1188512 ?auto_1188515 ) ) ( not ( = ?auto_1188512 ?auto_1188516 ) ) ( not ( = ?auto_1188512 ?auto_1188517 ) ) ( not ( = ?auto_1188512 ?auto_1188518 ) ) ( not ( = ?auto_1188512 ?auto_1188519 ) ) ( not ( = ?auto_1188513 ?auto_1188514 ) ) ( not ( = ?auto_1188513 ?auto_1188515 ) ) ( not ( = ?auto_1188513 ?auto_1188516 ) ) ( not ( = ?auto_1188513 ?auto_1188517 ) ) ( not ( = ?auto_1188513 ?auto_1188518 ) ) ( not ( = ?auto_1188513 ?auto_1188519 ) ) ( not ( = ?auto_1188514 ?auto_1188515 ) ) ( not ( = ?auto_1188514 ?auto_1188516 ) ) ( not ( = ?auto_1188514 ?auto_1188517 ) ) ( not ( = ?auto_1188514 ?auto_1188518 ) ) ( not ( = ?auto_1188514 ?auto_1188519 ) ) ( not ( = ?auto_1188515 ?auto_1188516 ) ) ( not ( = ?auto_1188515 ?auto_1188517 ) ) ( not ( = ?auto_1188515 ?auto_1188518 ) ) ( not ( = ?auto_1188515 ?auto_1188519 ) ) ( not ( = ?auto_1188516 ?auto_1188517 ) ) ( not ( = ?auto_1188516 ?auto_1188518 ) ) ( not ( = ?auto_1188516 ?auto_1188519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188517 ?auto_1188518 ?auto_1188519 )
      ( MAKE-9CRATE-VERIFY ?auto_1188510 ?auto_1188511 ?auto_1188512 ?auto_1188513 ?auto_1188514 ?auto_1188515 ?auto_1188516 ?auto_1188517 ?auto_1188518 ?auto_1188519 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188609 - SURFACE
      ?auto_1188610 - SURFACE
      ?auto_1188611 - SURFACE
      ?auto_1188612 - SURFACE
      ?auto_1188613 - SURFACE
      ?auto_1188614 - SURFACE
      ?auto_1188615 - SURFACE
      ?auto_1188616 - SURFACE
      ?auto_1188617 - SURFACE
      ?auto_1188618 - SURFACE
    )
    :vars
    (
      ?auto_1188621 - HOIST
      ?auto_1188620 - PLACE
      ?auto_1188622 - TRUCK
      ?auto_1188623 - PLACE
      ?auto_1188619 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188621 ?auto_1188620 ) ( SURFACE-AT ?auto_1188617 ?auto_1188620 ) ( CLEAR ?auto_1188617 ) ( IS-CRATE ?auto_1188618 ) ( not ( = ?auto_1188617 ?auto_1188618 ) ) ( AVAILABLE ?auto_1188621 ) ( ON ?auto_1188617 ?auto_1188616 ) ( not ( = ?auto_1188616 ?auto_1188617 ) ) ( not ( = ?auto_1188616 ?auto_1188618 ) ) ( TRUCK-AT ?auto_1188622 ?auto_1188623 ) ( not ( = ?auto_1188623 ?auto_1188620 ) ) ( HOIST-AT ?auto_1188619 ?auto_1188623 ) ( LIFTING ?auto_1188619 ?auto_1188618 ) ( not ( = ?auto_1188621 ?auto_1188619 ) ) ( ON ?auto_1188610 ?auto_1188609 ) ( ON ?auto_1188611 ?auto_1188610 ) ( ON ?auto_1188612 ?auto_1188611 ) ( ON ?auto_1188613 ?auto_1188612 ) ( ON ?auto_1188614 ?auto_1188613 ) ( ON ?auto_1188615 ?auto_1188614 ) ( ON ?auto_1188616 ?auto_1188615 ) ( not ( = ?auto_1188609 ?auto_1188610 ) ) ( not ( = ?auto_1188609 ?auto_1188611 ) ) ( not ( = ?auto_1188609 ?auto_1188612 ) ) ( not ( = ?auto_1188609 ?auto_1188613 ) ) ( not ( = ?auto_1188609 ?auto_1188614 ) ) ( not ( = ?auto_1188609 ?auto_1188615 ) ) ( not ( = ?auto_1188609 ?auto_1188616 ) ) ( not ( = ?auto_1188609 ?auto_1188617 ) ) ( not ( = ?auto_1188609 ?auto_1188618 ) ) ( not ( = ?auto_1188610 ?auto_1188611 ) ) ( not ( = ?auto_1188610 ?auto_1188612 ) ) ( not ( = ?auto_1188610 ?auto_1188613 ) ) ( not ( = ?auto_1188610 ?auto_1188614 ) ) ( not ( = ?auto_1188610 ?auto_1188615 ) ) ( not ( = ?auto_1188610 ?auto_1188616 ) ) ( not ( = ?auto_1188610 ?auto_1188617 ) ) ( not ( = ?auto_1188610 ?auto_1188618 ) ) ( not ( = ?auto_1188611 ?auto_1188612 ) ) ( not ( = ?auto_1188611 ?auto_1188613 ) ) ( not ( = ?auto_1188611 ?auto_1188614 ) ) ( not ( = ?auto_1188611 ?auto_1188615 ) ) ( not ( = ?auto_1188611 ?auto_1188616 ) ) ( not ( = ?auto_1188611 ?auto_1188617 ) ) ( not ( = ?auto_1188611 ?auto_1188618 ) ) ( not ( = ?auto_1188612 ?auto_1188613 ) ) ( not ( = ?auto_1188612 ?auto_1188614 ) ) ( not ( = ?auto_1188612 ?auto_1188615 ) ) ( not ( = ?auto_1188612 ?auto_1188616 ) ) ( not ( = ?auto_1188612 ?auto_1188617 ) ) ( not ( = ?auto_1188612 ?auto_1188618 ) ) ( not ( = ?auto_1188613 ?auto_1188614 ) ) ( not ( = ?auto_1188613 ?auto_1188615 ) ) ( not ( = ?auto_1188613 ?auto_1188616 ) ) ( not ( = ?auto_1188613 ?auto_1188617 ) ) ( not ( = ?auto_1188613 ?auto_1188618 ) ) ( not ( = ?auto_1188614 ?auto_1188615 ) ) ( not ( = ?auto_1188614 ?auto_1188616 ) ) ( not ( = ?auto_1188614 ?auto_1188617 ) ) ( not ( = ?auto_1188614 ?auto_1188618 ) ) ( not ( = ?auto_1188615 ?auto_1188616 ) ) ( not ( = ?auto_1188615 ?auto_1188617 ) ) ( not ( = ?auto_1188615 ?auto_1188618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188616 ?auto_1188617 ?auto_1188618 )
      ( MAKE-9CRATE-VERIFY ?auto_1188609 ?auto_1188610 ?auto_1188611 ?auto_1188612 ?auto_1188613 ?auto_1188614 ?auto_1188615 ?auto_1188616 ?auto_1188617 ?auto_1188618 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188717 - SURFACE
      ?auto_1188718 - SURFACE
      ?auto_1188719 - SURFACE
      ?auto_1188720 - SURFACE
      ?auto_1188721 - SURFACE
      ?auto_1188722 - SURFACE
      ?auto_1188723 - SURFACE
      ?auto_1188724 - SURFACE
      ?auto_1188725 - SURFACE
      ?auto_1188726 - SURFACE
    )
    :vars
    (
      ?auto_1188730 - HOIST
      ?auto_1188729 - PLACE
      ?auto_1188732 - TRUCK
      ?auto_1188731 - PLACE
      ?auto_1188727 - HOIST
      ?auto_1188728 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188730 ?auto_1188729 ) ( SURFACE-AT ?auto_1188725 ?auto_1188729 ) ( CLEAR ?auto_1188725 ) ( IS-CRATE ?auto_1188726 ) ( not ( = ?auto_1188725 ?auto_1188726 ) ) ( AVAILABLE ?auto_1188730 ) ( ON ?auto_1188725 ?auto_1188724 ) ( not ( = ?auto_1188724 ?auto_1188725 ) ) ( not ( = ?auto_1188724 ?auto_1188726 ) ) ( TRUCK-AT ?auto_1188732 ?auto_1188731 ) ( not ( = ?auto_1188731 ?auto_1188729 ) ) ( HOIST-AT ?auto_1188727 ?auto_1188731 ) ( not ( = ?auto_1188730 ?auto_1188727 ) ) ( AVAILABLE ?auto_1188727 ) ( SURFACE-AT ?auto_1188726 ?auto_1188731 ) ( ON ?auto_1188726 ?auto_1188728 ) ( CLEAR ?auto_1188726 ) ( not ( = ?auto_1188725 ?auto_1188728 ) ) ( not ( = ?auto_1188726 ?auto_1188728 ) ) ( not ( = ?auto_1188724 ?auto_1188728 ) ) ( ON ?auto_1188718 ?auto_1188717 ) ( ON ?auto_1188719 ?auto_1188718 ) ( ON ?auto_1188720 ?auto_1188719 ) ( ON ?auto_1188721 ?auto_1188720 ) ( ON ?auto_1188722 ?auto_1188721 ) ( ON ?auto_1188723 ?auto_1188722 ) ( ON ?auto_1188724 ?auto_1188723 ) ( not ( = ?auto_1188717 ?auto_1188718 ) ) ( not ( = ?auto_1188717 ?auto_1188719 ) ) ( not ( = ?auto_1188717 ?auto_1188720 ) ) ( not ( = ?auto_1188717 ?auto_1188721 ) ) ( not ( = ?auto_1188717 ?auto_1188722 ) ) ( not ( = ?auto_1188717 ?auto_1188723 ) ) ( not ( = ?auto_1188717 ?auto_1188724 ) ) ( not ( = ?auto_1188717 ?auto_1188725 ) ) ( not ( = ?auto_1188717 ?auto_1188726 ) ) ( not ( = ?auto_1188717 ?auto_1188728 ) ) ( not ( = ?auto_1188718 ?auto_1188719 ) ) ( not ( = ?auto_1188718 ?auto_1188720 ) ) ( not ( = ?auto_1188718 ?auto_1188721 ) ) ( not ( = ?auto_1188718 ?auto_1188722 ) ) ( not ( = ?auto_1188718 ?auto_1188723 ) ) ( not ( = ?auto_1188718 ?auto_1188724 ) ) ( not ( = ?auto_1188718 ?auto_1188725 ) ) ( not ( = ?auto_1188718 ?auto_1188726 ) ) ( not ( = ?auto_1188718 ?auto_1188728 ) ) ( not ( = ?auto_1188719 ?auto_1188720 ) ) ( not ( = ?auto_1188719 ?auto_1188721 ) ) ( not ( = ?auto_1188719 ?auto_1188722 ) ) ( not ( = ?auto_1188719 ?auto_1188723 ) ) ( not ( = ?auto_1188719 ?auto_1188724 ) ) ( not ( = ?auto_1188719 ?auto_1188725 ) ) ( not ( = ?auto_1188719 ?auto_1188726 ) ) ( not ( = ?auto_1188719 ?auto_1188728 ) ) ( not ( = ?auto_1188720 ?auto_1188721 ) ) ( not ( = ?auto_1188720 ?auto_1188722 ) ) ( not ( = ?auto_1188720 ?auto_1188723 ) ) ( not ( = ?auto_1188720 ?auto_1188724 ) ) ( not ( = ?auto_1188720 ?auto_1188725 ) ) ( not ( = ?auto_1188720 ?auto_1188726 ) ) ( not ( = ?auto_1188720 ?auto_1188728 ) ) ( not ( = ?auto_1188721 ?auto_1188722 ) ) ( not ( = ?auto_1188721 ?auto_1188723 ) ) ( not ( = ?auto_1188721 ?auto_1188724 ) ) ( not ( = ?auto_1188721 ?auto_1188725 ) ) ( not ( = ?auto_1188721 ?auto_1188726 ) ) ( not ( = ?auto_1188721 ?auto_1188728 ) ) ( not ( = ?auto_1188722 ?auto_1188723 ) ) ( not ( = ?auto_1188722 ?auto_1188724 ) ) ( not ( = ?auto_1188722 ?auto_1188725 ) ) ( not ( = ?auto_1188722 ?auto_1188726 ) ) ( not ( = ?auto_1188722 ?auto_1188728 ) ) ( not ( = ?auto_1188723 ?auto_1188724 ) ) ( not ( = ?auto_1188723 ?auto_1188725 ) ) ( not ( = ?auto_1188723 ?auto_1188726 ) ) ( not ( = ?auto_1188723 ?auto_1188728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188724 ?auto_1188725 ?auto_1188726 )
      ( MAKE-9CRATE-VERIFY ?auto_1188717 ?auto_1188718 ?auto_1188719 ?auto_1188720 ?auto_1188721 ?auto_1188722 ?auto_1188723 ?auto_1188724 ?auto_1188725 ?auto_1188726 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188826 - SURFACE
      ?auto_1188827 - SURFACE
      ?auto_1188828 - SURFACE
      ?auto_1188829 - SURFACE
      ?auto_1188830 - SURFACE
      ?auto_1188831 - SURFACE
      ?auto_1188832 - SURFACE
      ?auto_1188833 - SURFACE
      ?auto_1188834 - SURFACE
      ?auto_1188835 - SURFACE
    )
    :vars
    (
      ?auto_1188839 - HOIST
      ?auto_1188838 - PLACE
      ?auto_1188841 - PLACE
      ?auto_1188840 - HOIST
      ?auto_1188836 - SURFACE
      ?auto_1188837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188839 ?auto_1188838 ) ( SURFACE-AT ?auto_1188834 ?auto_1188838 ) ( CLEAR ?auto_1188834 ) ( IS-CRATE ?auto_1188835 ) ( not ( = ?auto_1188834 ?auto_1188835 ) ) ( AVAILABLE ?auto_1188839 ) ( ON ?auto_1188834 ?auto_1188833 ) ( not ( = ?auto_1188833 ?auto_1188834 ) ) ( not ( = ?auto_1188833 ?auto_1188835 ) ) ( not ( = ?auto_1188841 ?auto_1188838 ) ) ( HOIST-AT ?auto_1188840 ?auto_1188841 ) ( not ( = ?auto_1188839 ?auto_1188840 ) ) ( AVAILABLE ?auto_1188840 ) ( SURFACE-AT ?auto_1188835 ?auto_1188841 ) ( ON ?auto_1188835 ?auto_1188836 ) ( CLEAR ?auto_1188835 ) ( not ( = ?auto_1188834 ?auto_1188836 ) ) ( not ( = ?auto_1188835 ?auto_1188836 ) ) ( not ( = ?auto_1188833 ?auto_1188836 ) ) ( TRUCK-AT ?auto_1188837 ?auto_1188838 ) ( ON ?auto_1188827 ?auto_1188826 ) ( ON ?auto_1188828 ?auto_1188827 ) ( ON ?auto_1188829 ?auto_1188828 ) ( ON ?auto_1188830 ?auto_1188829 ) ( ON ?auto_1188831 ?auto_1188830 ) ( ON ?auto_1188832 ?auto_1188831 ) ( ON ?auto_1188833 ?auto_1188832 ) ( not ( = ?auto_1188826 ?auto_1188827 ) ) ( not ( = ?auto_1188826 ?auto_1188828 ) ) ( not ( = ?auto_1188826 ?auto_1188829 ) ) ( not ( = ?auto_1188826 ?auto_1188830 ) ) ( not ( = ?auto_1188826 ?auto_1188831 ) ) ( not ( = ?auto_1188826 ?auto_1188832 ) ) ( not ( = ?auto_1188826 ?auto_1188833 ) ) ( not ( = ?auto_1188826 ?auto_1188834 ) ) ( not ( = ?auto_1188826 ?auto_1188835 ) ) ( not ( = ?auto_1188826 ?auto_1188836 ) ) ( not ( = ?auto_1188827 ?auto_1188828 ) ) ( not ( = ?auto_1188827 ?auto_1188829 ) ) ( not ( = ?auto_1188827 ?auto_1188830 ) ) ( not ( = ?auto_1188827 ?auto_1188831 ) ) ( not ( = ?auto_1188827 ?auto_1188832 ) ) ( not ( = ?auto_1188827 ?auto_1188833 ) ) ( not ( = ?auto_1188827 ?auto_1188834 ) ) ( not ( = ?auto_1188827 ?auto_1188835 ) ) ( not ( = ?auto_1188827 ?auto_1188836 ) ) ( not ( = ?auto_1188828 ?auto_1188829 ) ) ( not ( = ?auto_1188828 ?auto_1188830 ) ) ( not ( = ?auto_1188828 ?auto_1188831 ) ) ( not ( = ?auto_1188828 ?auto_1188832 ) ) ( not ( = ?auto_1188828 ?auto_1188833 ) ) ( not ( = ?auto_1188828 ?auto_1188834 ) ) ( not ( = ?auto_1188828 ?auto_1188835 ) ) ( not ( = ?auto_1188828 ?auto_1188836 ) ) ( not ( = ?auto_1188829 ?auto_1188830 ) ) ( not ( = ?auto_1188829 ?auto_1188831 ) ) ( not ( = ?auto_1188829 ?auto_1188832 ) ) ( not ( = ?auto_1188829 ?auto_1188833 ) ) ( not ( = ?auto_1188829 ?auto_1188834 ) ) ( not ( = ?auto_1188829 ?auto_1188835 ) ) ( not ( = ?auto_1188829 ?auto_1188836 ) ) ( not ( = ?auto_1188830 ?auto_1188831 ) ) ( not ( = ?auto_1188830 ?auto_1188832 ) ) ( not ( = ?auto_1188830 ?auto_1188833 ) ) ( not ( = ?auto_1188830 ?auto_1188834 ) ) ( not ( = ?auto_1188830 ?auto_1188835 ) ) ( not ( = ?auto_1188830 ?auto_1188836 ) ) ( not ( = ?auto_1188831 ?auto_1188832 ) ) ( not ( = ?auto_1188831 ?auto_1188833 ) ) ( not ( = ?auto_1188831 ?auto_1188834 ) ) ( not ( = ?auto_1188831 ?auto_1188835 ) ) ( not ( = ?auto_1188831 ?auto_1188836 ) ) ( not ( = ?auto_1188832 ?auto_1188833 ) ) ( not ( = ?auto_1188832 ?auto_1188834 ) ) ( not ( = ?auto_1188832 ?auto_1188835 ) ) ( not ( = ?auto_1188832 ?auto_1188836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188833 ?auto_1188834 ?auto_1188835 )
      ( MAKE-9CRATE-VERIFY ?auto_1188826 ?auto_1188827 ?auto_1188828 ?auto_1188829 ?auto_1188830 ?auto_1188831 ?auto_1188832 ?auto_1188833 ?auto_1188834 ?auto_1188835 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1188935 - SURFACE
      ?auto_1188936 - SURFACE
      ?auto_1188937 - SURFACE
      ?auto_1188938 - SURFACE
      ?auto_1188939 - SURFACE
      ?auto_1188940 - SURFACE
      ?auto_1188941 - SURFACE
      ?auto_1188942 - SURFACE
      ?auto_1188943 - SURFACE
      ?auto_1188944 - SURFACE
    )
    :vars
    (
      ?auto_1188948 - HOIST
      ?auto_1188950 - PLACE
      ?auto_1188949 - PLACE
      ?auto_1188945 - HOIST
      ?auto_1188946 - SURFACE
      ?auto_1188947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188948 ?auto_1188950 ) ( IS-CRATE ?auto_1188944 ) ( not ( = ?auto_1188943 ?auto_1188944 ) ) ( not ( = ?auto_1188942 ?auto_1188943 ) ) ( not ( = ?auto_1188942 ?auto_1188944 ) ) ( not ( = ?auto_1188949 ?auto_1188950 ) ) ( HOIST-AT ?auto_1188945 ?auto_1188949 ) ( not ( = ?auto_1188948 ?auto_1188945 ) ) ( AVAILABLE ?auto_1188945 ) ( SURFACE-AT ?auto_1188944 ?auto_1188949 ) ( ON ?auto_1188944 ?auto_1188946 ) ( CLEAR ?auto_1188944 ) ( not ( = ?auto_1188943 ?auto_1188946 ) ) ( not ( = ?auto_1188944 ?auto_1188946 ) ) ( not ( = ?auto_1188942 ?auto_1188946 ) ) ( TRUCK-AT ?auto_1188947 ?auto_1188950 ) ( SURFACE-AT ?auto_1188942 ?auto_1188950 ) ( CLEAR ?auto_1188942 ) ( LIFTING ?auto_1188948 ?auto_1188943 ) ( IS-CRATE ?auto_1188943 ) ( ON ?auto_1188936 ?auto_1188935 ) ( ON ?auto_1188937 ?auto_1188936 ) ( ON ?auto_1188938 ?auto_1188937 ) ( ON ?auto_1188939 ?auto_1188938 ) ( ON ?auto_1188940 ?auto_1188939 ) ( ON ?auto_1188941 ?auto_1188940 ) ( ON ?auto_1188942 ?auto_1188941 ) ( not ( = ?auto_1188935 ?auto_1188936 ) ) ( not ( = ?auto_1188935 ?auto_1188937 ) ) ( not ( = ?auto_1188935 ?auto_1188938 ) ) ( not ( = ?auto_1188935 ?auto_1188939 ) ) ( not ( = ?auto_1188935 ?auto_1188940 ) ) ( not ( = ?auto_1188935 ?auto_1188941 ) ) ( not ( = ?auto_1188935 ?auto_1188942 ) ) ( not ( = ?auto_1188935 ?auto_1188943 ) ) ( not ( = ?auto_1188935 ?auto_1188944 ) ) ( not ( = ?auto_1188935 ?auto_1188946 ) ) ( not ( = ?auto_1188936 ?auto_1188937 ) ) ( not ( = ?auto_1188936 ?auto_1188938 ) ) ( not ( = ?auto_1188936 ?auto_1188939 ) ) ( not ( = ?auto_1188936 ?auto_1188940 ) ) ( not ( = ?auto_1188936 ?auto_1188941 ) ) ( not ( = ?auto_1188936 ?auto_1188942 ) ) ( not ( = ?auto_1188936 ?auto_1188943 ) ) ( not ( = ?auto_1188936 ?auto_1188944 ) ) ( not ( = ?auto_1188936 ?auto_1188946 ) ) ( not ( = ?auto_1188937 ?auto_1188938 ) ) ( not ( = ?auto_1188937 ?auto_1188939 ) ) ( not ( = ?auto_1188937 ?auto_1188940 ) ) ( not ( = ?auto_1188937 ?auto_1188941 ) ) ( not ( = ?auto_1188937 ?auto_1188942 ) ) ( not ( = ?auto_1188937 ?auto_1188943 ) ) ( not ( = ?auto_1188937 ?auto_1188944 ) ) ( not ( = ?auto_1188937 ?auto_1188946 ) ) ( not ( = ?auto_1188938 ?auto_1188939 ) ) ( not ( = ?auto_1188938 ?auto_1188940 ) ) ( not ( = ?auto_1188938 ?auto_1188941 ) ) ( not ( = ?auto_1188938 ?auto_1188942 ) ) ( not ( = ?auto_1188938 ?auto_1188943 ) ) ( not ( = ?auto_1188938 ?auto_1188944 ) ) ( not ( = ?auto_1188938 ?auto_1188946 ) ) ( not ( = ?auto_1188939 ?auto_1188940 ) ) ( not ( = ?auto_1188939 ?auto_1188941 ) ) ( not ( = ?auto_1188939 ?auto_1188942 ) ) ( not ( = ?auto_1188939 ?auto_1188943 ) ) ( not ( = ?auto_1188939 ?auto_1188944 ) ) ( not ( = ?auto_1188939 ?auto_1188946 ) ) ( not ( = ?auto_1188940 ?auto_1188941 ) ) ( not ( = ?auto_1188940 ?auto_1188942 ) ) ( not ( = ?auto_1188940 ?auto_1188943 ) ) ( not ( = ?auto_1188940 ?auto_1188944 ) ) ( not ( = ?auto_1188940 ?auto_1188946 ) ) ( not ( = ?auto_1188941 ?auto_1188942 ) ) ( not ( = ?auto_1188941 ?auto_1188943 ) ) ( not ( = ?auto_1188941 ?auto_1188944 ) ) ( not ( = ?auto_1188941 ?auto_1188946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1188942 ?auto_1188943 ?auto_1188944 )
      ( MAKE-9CRATE-VERIFY ?auto_1188935 ?auto_1188936 ?auto_1188937 ?auto_1188938 ?auto_1188939 ?auto_1188940 ?auto_1188941 ?auto_1188942 ?auto_1188943 ?auto_1188944 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1189044 - SURFACE
      ?auto_1189045 - SURFACE
      ?auto_1189046 - SURFACE
      ?auto_1189047 - SURFACE
      ?auto_1189048 - SURFACE
      ?auto_1189049 - SURFACE
      ?auto_1189050 - SURFACE
      ?auto_1189051 - SURFACE
      ?auto_1189052 - SURFACE
      ?auto_1189053 - SURFACE
    )
    :vars
    (
      ?auto_1189058 - HOIST
      ?auto_1189056 - PLACE
      ?auto_1189055 - PLACE
      ?auto_1189059 - HOIST
      ?auto_1189057 - SURFACE
      ?auto_1189054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1189058 ?auto_1189056 ) ( IS-CRATE ?auto_1189053 ) ( not ( = ?auto_1189052 ?auto_1189053 ) ) ( not ( = ?auto_1189051 ?auto_1189052 ) ) ( not ( = ?auto_1189051 ?auto_1189053 ) ) ( not ( = ?auto_1189055 ?auto_1189056 ) ) ( HOIST-AT ?auto_1189059 ?auto_1189055 ) ( not ( = ?auto_1189058 ?auto_1189059 ) ) ( AVAILABLE ?auto_1189059 ) ( SURFACE-AT ?auto_1189053 ?auto_1189055 ) ( ON ?auto_1189053 ?auto_1189057 ) ( CLEAR ?auto_1189053 ) ( not ( = ?auto_1189052 ?auto_1189057 ) ) ( not ( = ?auto_1189053 ?auto_1189057 ) ) ( not ( = ?auto_1189051 ?auto_1189057 ) ) ( TRUCK-AT ?auto_1189054 ?auto_1189056 ) ( SURFACE-AT ?auto_1189051 ?auto_1189056 ) ( CLEAR ?auto_1189051 ) ( IS-CRATE ?auto_1189052 ) ( AVAILABLE ?auto_1189058 ) ( IN ?auto_1189052 ?auto_1189054 ) ( ON ?auto_1189045 ?auto_1189044 ) ( ON ?auto_1189046 ?auto_1189045 ) ( ON ?auto_1189047 ?auto_1189046 ) ( ON ?auto_1189048 ?auto_1189047 ) ( ON ?auto_1189049 ?auto_1189048 ) ( ON ?auto_1189050 ?auto_1189049 ) ( ON ?auto_1189051 ?auto_1189050 ) ( not ( = ?auto_1189044 ?auto_1189045 ) ) ( not ( = ?auto_1189044 ?auto_1189046 ) ) ( not ( = ?auto_1189044 ?auto_1189047 ) ) ( not ( = ?auto_1189044 ?auto_1189048 ) ) ( not ( = ?auto_1189044 ?auto_1189049 ) ) ( not ( = ?auto_1189044 ?auto_1189050 ) ) ( not ( = ?auto_1189044 ?auto_1189051 ) ) ( not ( = ?auto_1189044 ?auto_1189052 ) ) ( not ( = ?auto_1189044 ?auto_1189053 ) ) ( not ( = ?auto_1189044 ?auto_1189057 ) ) ( not ( = ?auto_1189045 ?auto_1189046 ) ) ( not ( = ?auto_1189045 ?auto_1189047 ) ) ( not ( = ?auto_1189045 ?auto_1189048 ) ) ( not ( = ?auto_1189045 ?auto_1189049 ) ) ( not ( = ?auto_1189045 ?auto_1189050 ) ) ( not ( = ?auto_1189045 ?auto_1189051 ) ) ( not ( = ?auto_1189045 ?auto_1189052 ) ) ( not ( = ?auto_1189045 ?auto_1189053 ) ) ( not ( = ?auto_1189045 ?auto_1189057 ) ) ( not ( = ?auto_1189046 ?auto_1189047 ) ) ( not ( = ?auto_1189046 ?auto_1189048 ) ) ( not ( = ?auto_1189046 ?auto_1189049 ) ) ( not ( = ?auto_1189046 ?auto_1189050 ) ) ( not ( = ?auto_1189046 ?auto_1189051 ) ) ( not ( = ?auto_1189046 ?auto_1189052 ) ) ( not ( = ?auto_1189046 ?auto_1189053 ) ) ( not ( = ?auto_1189046 ?auto_1189057 ) ) ( not ( = ?auto_1189047 ?auto_1189048 ) ) ( not ( = ?auto_1189047 ?auto_1189049 ) ) ( not ( = ?auto_1189047 ?auto_1189050 ) ) ( not ( = ?auto_1189047 ?auto_1189051 ) ) ( not ( = ?auto_1189047 ?auto_1189052 ) ) ( not ( = ?auto_1189047 ?auto_1189053 ) ) ( not ( = ?auto_1189047 ?auto_1189057 ) ) ( not ( = ?auto_1189048 ?auto_1189049 ) ) ( not ( = ?auto_1189048 ?auto_1189050 ) ) ( not ( = ?auto_1189048 ?auto_1189051 ) ) ( not ( = ?auto_1189048 ?auto_1189052 ) ) ( not ( = ?auto_1189048 ?auto_1189053 ) ) ( not ( = ?auto_1189048 ?auto_1189057 ) ) ( not ( = ?auto_1189049 ?auto_1189050 ) ) ( not ( = ?auto_1189049 ?auto_1189051 ) ) ( not ( = ?auto_1189049 ?auto_1189052 ) ) ( not ( = ?auto_1189049 ?auto_1189053 ) ) ( not ( = ?auto_1189049 ?auto_1189057 ) ) ( not ( = ?auto_1189050 ?auto_1189051 ) ) ( not ( = ?auto_1189050 ?auto_1189052 ) ) ( not ( = ?auto_1189050 ?auto_1189053 ) ) ( not ( = ?auto_1189050 ?auto_1189057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1189051 ?auto_1189052 ?auto_1189053 )
      ( MAKE-9CRATE-VERIFY ?auto_1189044 ?auto_1189045 ?auto_1189046 ?auto_1189047 ?auto_1189048 ?auto_1189049 ?auto_1189050 ?auto_1189051 ?auto_1189052 ?auto_1189053 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1192694 - SURFACE
      ?auto_1192695 - SURFACE
    )
    :vars
    (
      ?auto_1192698 - HOIST
      ?auto_1192700 - PLACE
      ?auto_1192696 - SURFACE
      ?auto_1192702 - PLACE
      ?auto_1192697 - HOIST
      ?auto_1192701 - SURFACE
      ?auto_1192699 - TRUCK
      ?auto_1192703 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1192698 ?auto_1192700 ) ( SURFACE-AT ?auto_1192694 ?auto_1192700 ) ( CLEAR ?auto_1192694 ) ( IS-CRATE ?auto_1192695 ) ( not ( = ?auto_1192694 ?auto_1192695 ) ) ( ON ?auto_1192694 ?auto_1192696 ) ( not ( = ?auto_1192696 ?auto_1192694 ) ) ( not ( = ?auto_1192696 ?auto_1192695 ) ) ( not ( = ?auto_1192702 ?auto_1192700 ) ) ( HOIST-AT ?auto_1192697 ?auto_1192702 ) ( not ( = ?auto_1192698 ?auto_1192697 ) ) ( AVAILABLE ?auto_1192697 ) ( SURFACE-AT ?auto_1192695 ?auto_1192702 ) ( ON ?auto_1192695 ?auto_1192701 ) ( CLEAR ?auto_1192695 ) ( not ( = ?auto_1192694 ?auto_1192701 ) ) ( not ( = ?auto_1192695 ?auto_1192701 ) ) ( not ( = ?auto_1192696 ?auto_1192701 ) ) ( TRUCK-AT ?auto_1192699 ?auto_1192700 ) ( LIFTING ?auto_1192698 ?auto_1192703 ) ( IS-CRATE ?auto_1192703 ) ( not ( = ?auto_1192694 ?auto_1192703 ) ) ( not ( = ?auto_1192695 ?auto_1192703 ) ) ( not ( = ?auto_1192696 ?auto_1192703 ) ) ( not ( = ?auto_1192701 ?auto_1192703 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1192698 ?auto_1192703 ?auto_1192699 ?auto_1192700 )
      ( MAKE-1CRATE ?auto_1192694 ?auto_1192695 )
      ( MAKE-1CRATE-VERIFY ?auto_1192694 ?auto_1192695 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194597 - SURFACE
      ?auto_1194598 - SURFACE
      ?auto_1194599 - SURFACE
      ?auto_1194600 - SURFACE
      ?auto_1194601 - SURFACE
      ?auto_1194602 - SURFACE
      ?auto_1194603 - SURFACE
      ?auto_1194604 - SURFACE
      ?auto_1194605 - SURFACE
      ?auto_1194606 - SURFACE
      ?auto_1194607 - SURFACE
    )
    :vars
    (
      ?auto_1194609 - HOIST
      ?auto_1194608 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194609 ?auto_1194608 ) ( SURFACE-AT ?auto_1194606 ?auto_1194608 ) ( CLEAR ?auto_1194606 ) ( LIFTING ?auto_1194609 ?auto_1194607 ) ( IS-CRATE ?auto_1194607 ) ( not ( = ?auto_1194606 ?auto_1194607 ) ) ( ON ?auto_1194598 ?auto_1194597 ) ( ON ?auto_1194599 ?auto_1194598 ) ( ON ?auto_1194600 ?auto_1194599 ) ( ON ?auto_1194601 ?auto_1194600 ) ( ON ?auto_1194602 ?auto_1194601 ) ( ON ?auto_1194603 ?auto_1194602 ) ( ON ?auto_1194604 ?auto_1194603 ) ( ON ?auto_1194605 ?auto_1194604 ) ( ON ?auto_1194606 ?auto_1194605 ) ( not ( = ?auto_1194597 ?auto_1194598 ) ) ( not ( = ?auto_1194597 ?auto_1194599 ) ) ( not ( = ?auto_1194597 ?auto_1194600 ) ) ( not ( = ?auto_1194597 ?auto_1194601 ) ) ( not ( = ?auto_1194597 ?auto_1194602 ) ) ( not ( = ?auto_1194597 ?auto_1194603 ) ) ( not ( = ?auto_1194597 ?auto_1194604 ) ) ( not ( = ?auto_1194597 ?auto_1194605 ) ) ( not ( = ?auto_1194597 ?auto_1194606 ) ) ( not ( = ?auto_1194597 ?auto_1194607 ) ) ( not ( = ?auto_1194598 ?auto_1194599 ) ) ( not ( = ?auto_1194598 ?auto_1194600 ) ) ( not ( = ?auto_1194598 ?auto_1194601 ) ) ( not ( = ?auto_1194598 ?auto_1194602 ) ) ( not ( = ?auto_1194598 ?auto_1194603 ) ) ( not ( = ?auto_1194598 ?auto_1194604 ) ) ( not ( = ?auto_1194598 ?auto_1194605 ) ) ( not ( = ?auto_1194598 ?auto_1194606 ) ) ( not ( = ?auto_1194598 ?auto_1194607 ) ) ( not ( = ?auto_1194599 ?auto_1194600 ) ) ( not ( = ?auto_1194599 ?auto_1194601 ) ) ( not ( = ?auto_1194599 ?auto_1194602 ) ) ( not ( = ?auto_1194599 ?auto_1194603 ) ) ( not ( = ?auto_1194599 ?auto_1194604 ) ) ( not ( = ?auto_1194599 ?auto_1194605 ) ) ( not ( = ?auto_1194599 ?auto_1194606 ) ) ( not ( = ?auto_1194599 ?auto_1194607 ) ) ( not ( = ?auto_1194600 ?auto_1194601 ) ) ( not ( = ?auto_1194600 ?auto_1194602 ) ) ( not ( = ?auto_1194600 ?auto_1194603 ) ) ( not ( = ?auto_1194600 ?auto_1194604 ) ) ( not ( = ?auto_1194600 ?auto_1194605 ) ) ( not ( = ?auto_1194600 ?auto_1194606 ) ) ( not ( = ?auto_1194600 ?auto_1194607 ) ) ( not ( = ?auto_1194601 ?auto_1194602 ) ) ( not ( = ?auto_1194601 ?auto_1194603 ) ) ( not ( = ?auto_1194601 ?auto_1194604 ) ) ( not ( = ?auto_1194601 ?auto_1194605 ) ) ( not ( = ?auto_1194601 ?auto_1194606 ) ) ( not ( = ?auto_1194601 ?auto_1194607 ) ) ( not ( = ?auto_1194602 ?auto_1194603 ) ) ( not ( = ?auto_1194602 ?auto_1194604 ) ) ( not ( = ?auto_1194602 ?auto_1194605 ) ) ( not ( = ?auto_1194602 ?auto_1194606 ) ) ( not ( = ?auto_1194602 ?auto_1194607 ) ) ( not ( = ?auto_1194603 ?auto_1194604 ) ) ( not ( = ?auto_1194603 ?auto_1194605 ) ) ( not ( = ?auto_1194603 ?auto_1194606 ) ) ( not ( = ?auto_1194603 ?auto_1194607 ) ) ( not ( = ?auto_1194604 ?auto_1194605 ) ) ( not ( = ?auto_1194604 ?auto_1194606 ) ) ( not ( = ?auto_1194604 ?auto_1194607 ) ) ( not ( = ?auto_1194605 ?auto_1194606 ) ) ( not ( = ?auto_1194605 ?auto_1194607 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1194606 ?auto_1194607 )
      ( MAKE-10CRATE-VERIFY ?auto_1194597 ?auto_1194598 ?auto_1194599 ?auto_1194600 ?auto_1194601 ?auto_1194602 ?auto_1194603 ?auto_1194604 ?auto_1194605 ?auto_1194606 ?auto_1194607 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194691 - SURFACE
      ?auto_1194692 - SURFACE
      ?auto_1194693 - SURFACE
      ?auto_1194694 - SURFACE
      ?auto_1194695 - SURFACE
      ?auto_1194696 - SURFACE
      ?auto_1194697 - SURFACE
      ?auto_1194698 - SURFACE
      ?auto_1194699 - SURFACE
      ?auto_1194700 - SURFACE
      ?auto_1194701 - SURFACE
    )
    :vars
    (
      ?auto_1194703 - HOIST
      ?auto_1194704 - PLACE
      ?auto_1194702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194703 ?auto_1194704 ) ( SURFACE-AT ?auto_1194700 ?auto_1194704 ) ( CLEAR ?auto_1194700 ) ( IS-CRATE ?auto_1194701 ) ( not ( = ?auto_1194700 ?auto_1194701 ) ) ( TRUCK-AT ?auto_1194702 ?auto_1194704 ) ( AVAILABLE ?auto_1194703 ) ( IN ?auto_1194701 ?auto_1194702 ) ( ON ?auto_1194700 ?auto_1194699 ) ( not ( = ?auto_1194699 ?auto_1194700 ) ) ( not ( = ?auto_1194699 ?auto_1194701 ) ) ( ON ?auto_1194692 ?auto_1194691 ) ( ON ?auto_1194693 ?auto_1194692 ) ( ON ?auto_1194694 ?auto_1194693 ) ( ON ?auto_1194695 ?auto_1194694 ) ( ON ?auto_1194696 ?auto_1194695 ) ( ON ?auto_1194697 ?auto_1194696 ) ( ON ?auto_1194698 ?auto_1194697 ) ( ON ?auto_1194699 ?auto_1194698 ) ( not ( = ?auto_1194691 ?auto_1194692 ) ) ( not ( = ?auto_1194691 ?auto_1194693 ) ) ( not ( = ?auto_1194691 ?auto_1194694 ) ) ( not ( = ?auto_1194691 ?auto_1194695 ) ) ( not ( = ?auto_1194691 ?auto_1194696 ) ) ( not ( = ?auto_1194691 ?auto_1194697 ) ) ( not ( = ?auto_1194691 ?auto_1194698 ) ) ( not ( = ?auto_1194691 ?auto_1194699 ) ) ( not ( = ?auto_1194691 ?auto_1194700 ) ) ( not ( = ?auto_1194691 ?auto_1194701 ) ) ( not ( = ?auto_1194692 ?auto_1194693 ) ) ( not ( = ?auto_1194692 ?auto_1194694 ) ) ( not ( = ?auto_1194692 ?auto_1194695 ) ) ( not ( = ?auto_1194692 ?auto_1194696 ) ) ( not ( = ?auto_1194692 ?auto_1194697 ) ) ( not ( = ?auto_1194692 ?auto_1194698 ) ) ( not ( = ?auto_1194692 ?auto_1194699 ) ) ( not ( = ?auto_1194692 ?auto_1194700 ) ) ( not ( = ?auto_1194692 ?auto_1194701 ) ) ( not ( = ?auto_1194693 ?auto_1194694 ) ) ( not ( = ?auto_1194693 ?auto_1194695 ) ) ( not ( = ?auto_1194693 ?auto_1194696 ) ) ( not ( = ?auto_1194693 ?auto_1194697 ) ) ( not ( = ?auto_1194693 ?auto_1194698 ) ) ( not ( = ?auto_1194693 ?auto_1194699 ) ) ( not ( = ?auto_1194693 ?auto_1194700 ) ) ( not ( = ?auto_1194693 ?auto_1194701 ) ) ( not ( = ?auto_1194694 ?auto_1194695 ) ) ( not ( = ?auto_1194694 ?auto_1194696 ) ) ( not ( = ?auto_1194694 ?auto_1194697 ) ) ( not ( = ?auto_1194694 ?auto_1194698 ) ) ( not ( = ?auto_1194694 ?auto_1194699 ) ) ( not ( = ?auto_1194694 ?auto_1194700 ) ) ( not ( = ?auto_1194694 ?auto_1194701 ) ) ( not ( = ?auto_1194695 ?auto_1194696 ) ) ( not ( = ?auto_1194695 ?auto_1194697 ) ) ( not ( = ?auto_1194695 ?auto_1194698 ) ) ( not ( = ?auto_1194695 ?auto_1194699 ) ) ( not ( = ?auto_1194695 ?auto_1194700 ) ) ( not ( = ?auto_1194695 ?auto_1194701 ) ) ( not ( = ?auto_1194696 ?auto_1194697 ) ) ( not ( = ?auto_1194696 ?auto_1194698 ) ) ( not ( = ?auto_1194696 ?auto_1194699 ) ) ( not ( = ?auto_1194696 ?auto_1194700 ) ) ( not ( = ?auto_1194696 ?auto_1194701 ) ) ( not ( = ?auto_1194697 ?auto_1194698 ) ) ( not ( = ?auto_1194697 ?auto_1194699 ) ) ( not ( = ?auto_1194697 ?auto_1194700 ) ) ( not ( = ?auto_1194697 ?auto_1194701 ) ) ( not ( = ?auto_1194698 ?auto_1194699 ) ) ( not ( = ?auto_1194698 ?auto_1194700 ) ) ( not ( = ?auto_1194698 ?auto_1194701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194699 ?auto_1194700 ?auto_1194701 )
      ( MAKE-10CRATE-VERIFY ?auto_1194691 ?auto_1194692 ?auto_1194693 ?auto_1194694 ?auto_1194695 ?auto_1194696 ?auto_1194697 ?auto_1194698 ?auto_1194699 ?auto_1194700 ?auto_1194701 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194796 - SURFACE
      ?auto_1194797 - SURFACE
      ?auto_1194798 - SURFACE
      ?auto_1194799 - SURFACE
      ?auto_1194800 - SURFACE
      ?auto_1194801 - SURFACE
      ?auto_1194802 - SURFACE
      ?auto_1194803 - SURFACE
      ?auto_1194804 - SURFACE
      ?auto_1194805 - SURFACE
      ?auto_1194806 - SURFACE
    )
    :vars
    (
      ?auto_1194807 - HOIST
      ?auto_1194809 - PLACE
      ?auto_1194810 - TRUCK
      ?auto_1194808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194807 ?auto_1194809 ) ( SURFACE-AT ?auto_1194805 ?auto_1194809 ) ( CLEAR ?auto_1194805 ) ( IS-CRATE ?auto_1194806 ) ( not ( = ?auto_1194805 ?auto_1194806 ) ) ( AVAILABLE ?auto_1194807 ) ( IN ?auto_1194806 ?auto_1194810 ) ( ON ?auto_1194805 ?auto_1194804 ) ( not ( = ?auto_1194804 ?auto_1194805 ) ) ( not ( = ?auto_1194804 ?auto_1194806 ) ) ( TRUCK-AT ?auto_1194810 ?auto_1194808 ) ( not ( = ?auto_1194808 ?auto_1194809 ) ) ( ON ?auto_1194797 ?auto_1194796 ) ( ON ?auto_1194798 ?auto_1194797 ) ( ON ?auto_1194799 ?auto_1194798 ) ( ON ?auto_1194800 ?auto_1194799 ) ( ON ?auto_1194801 ?auto_1194800 ) ( ON ?auto_1194802 ?auto_1194801 ) ( ON ?auto_1194803 ?auto_1194802 ) ( ON ?auto_1194804 ?auto_1194803 ) ( not ( = ?auto_1194796 ?auto_1194797 ) ) ( not ( = ?auto_1194796 ?auto_1194798 ) ) ( not ( = ?auto_1194796 ?auto_1194799 ) ) ( not ( = ?auto_1194796 ?auto_1194800 ) ) ( not ( = ?auto_1194796 ?auto_1194801 ) ) ( not ( = ?auto_1194796 ?auto_1194802 ) ) ( not ( = ?auto_1194796 ?auto_1194803 ) ) ( not ( = ?auto_1194796 ?auto_1194804 ) ) ( not ( = ?auto_1194796 ?auto_1194805 ) ) ( not ( = ?auto_1194796 ?auto_1194806 ) ) ( not ( = ?auto_1194797 ?auto_1194798 ) ) ( not ( = ?auto_1194797 ?auto_1194799 ) ) ( not ( = ?auto_1194797 ?auto_1194800 ) ) ( not ( = ?auto_1194797 ?auto_1194801 ) ) ( not ( = ?auto_1194797 ?auto_1194802 ) ) ( not ( = ?auto_1194797 ?auto_1194803 ) ) ( not ( = ?auto_1194797 ?auto_1194804 ) ) ( not ( = ?auto_1194797 ?auto_1194805 ) ) ( not ( = ?auto_1194797 ?auto_1194806 ) ) ( not ( = ?auto_1194798 ?auto_1194799 ) ) ( not ( = ?auto_1194798 ?auto_1194800 ) ) ( not ( = ?auto_1194798 ?auto_1194801 ) ) ( not ( = ?auto_1194798 ?auto_1194802 ) ) ( not ( = ?auto_1194798 ?auto_1194803 ) ) ( not ( = ?auto_1194798 ?auto_1194804 ) ) ( not ( = ?auto_1194798 ?auto_1194805 ) ) ( not ( = ?auto_1194798 ?auto_1194806 ) ) ( not ( = ?auto_1194799 ?auto_1194800 ) ) ( not ( = ?auto_1194799 ?auto_1194801 ) ) ( not ( = ?auto_1194799 ?auto_1194802 ) ) ( not ( = ?auto_1194799 ?auto_1194803 ) ) ( not ( = ?auto_1194799 ?auto_1194804 ) ) ( not ( = ?auto_1194799 ?auto_1194805 ) ) ( not ( = ?auto_1194799 ?auto_1194806 ) ) ( not ( = ?auto_1194800 ?auto_1194801 ) ) ( not ( = ?auto_1194800 ?auto_1194802 ) ) ( not ( = ?auto_1194800 ?auto_1194803 ) ) ( not ( = ?auto_1194800 ?auto_1194804 ) ) ( not ( = ?auto_1194800 ?auto_1194805 ) ) ( not ( = ?auto_1194800 ?auto_1194806 ) ) ( not ( = ?auto_1194801 ?auto_1194802 ) ) ( not ( = ?auto_1194801 ?auto_1194803 ) ) ( not ( = ?auto_1194801 ?auto_1194804 ) ) ( not ( = ?auto_1194801 ?auto_1194805 ) ) ( not ( = ?auto_1194801 ?auto_1194806 ) ) ( not ( = ?auto_1194802 ?auto_1194803 ) ) ( not ( = ?auto_1194802 ?auto_1194804 ) ) ( not ( = ?auto_1194802 ?auto_1194805 ) ) ( not ( = ?auto_1194802 ?auto_1194806 ) ) ( not ( = ?auto_1194803 ?auto_1194804 ) ) ( not ( = ?auto_1194803 ?auto_1194805 ) ) ( not ( = ?auto_1194803 ?auto_1194806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194804 ?auto_1194805 ?auto_1194806 )
      ( MAKE-10CRATE-VERIFY ?auto_1194796 ?auto_1194797 ?auto_1194798 ?auto_1194799 ?auto_1194800 ?auto_1194801 ?auto_1194802 ?auto_1194803 ?auto_1194804 ?auto_1194805 ?auto_1194806 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1194911 - SURFACE
      ?auto_1194912 - SURFACE
      ?auto_1194913 - SURFACE
      ?auto_1194914 - SURFACE
      ?auto_1194915 - SURFACE
      ?auto_1194916 - SURFACE
      ?auto_1194917 - SURFACE
      ?auto_1194918 - SURFACE
      ?auto_1194919 - SURFACE
      ?auto_1194920 - SURFACE
      ?auto_1194921 - SURFACE
    )
    :vars
    (
      ?auto_1194926 - HOIST
      ?auto_1194922 - PLACE
      ?auto_1194923 - TRUCK
      ?auto_1194925 - PLACE
      ?auto_1194924 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194926 ?auto_1194922 ) ( SURFACE-AT ?auto_1194920 ?auto_1194922 ) ( CLEAR ?auto_1194920 ) ( IS-CRATE ?auto_1194921 ) ( not ( = ?auto_1194920 ?auto_1194921 ) ) ( AVAILABLE ?auto_1194926 ) ( ON ?auto_1194920 ?auto_1194919 ) ( not ( = ?auto_1194919 ?auto_1194920 ) ) ( not ( = ?auto_1194919 ?auto_1194921 ) ) ( TRUCK-AT ?auto_1194923 ?auto_1194925 ) ( not ( = ?auto_1194925 ?auto_1194922 ) ) ( HOIST-AT ?auto_1194924 ?auto_1194925 ) ( LIFTING ?auto_1194924 ?auto_1194921 ) ( not ( = ?auto_1194926 ?auto_1194924 ) ) ( ON ?auto_1194912 ?auto_1194911 ) ( ON ?auto_1194913 ?auto_1194912 ) ( ON ?auto_1194914 ?auto_1194913 ) ( ON ?auto_1194915 ?auto_1194914 ) ( ON ?auto_1194916 ?auto_1194915 ) ( ON ?auto_1194917 ?auto_1194916 ) ( ON ?auto_1194918 ?auto_1194917 ) ( ON ?auto_1194919 ?auto_1194918 ) ( not ( = ?auto_1194911 ?auto_1194912 ) ) ( not ( = ?auto_1194911 ?auto_1194913 ) ) ( not ( = ?auto_1194911 ?auto_1194914 ) ) ( not ( = ?auto_1194911 ?auto_1194915 ) ) ( not ( = ?auto_1194911 ?auto_1194916 ) ) ( not ( = ?auto_1194911 ?auto_1194917 ) ) ( not ( = ?auto_1194911 ?auto_1194918 ) ) ( not ( = ?auto_1194911 ?auto_1194919 ) ) ( not ( = ?auto_1194911 ?auto_1194920 ) ) ( not ( = ?auto_1194911 ?auto_1194921 ) ) ( not ( = ?auto_1194912 ?auto_1194913 ) ) ( not ( = ?auto_1194912 ?auto_1194914 ) ) ( not ( = ?auto_1194912 ?auto_1194915 ) ) ( not ( = ?auto_1194912 ?auto_1194916 ) ) ( not ( = ?auto_1194912 ?auto_1194917 ) ) ( not ( = ?auto_1194912 ?auto_1194918 ) ) ( not ( = ?auto_1194912 ?auto_1194919 ) ) ( not ( = ?auto_1194912 ?auto_1194920 ) ) ( not ( = ?auto_1194912 ?auto_1194921 ) ) ( not ( = ?auto_1194913 ?auto_1194914 ) ) ( not ( = ?auto_1194913 ?auto_1194915 ) ) ( not ( = ?auto_1194913 ?auto_1194916 ) ) ( not ( = ?auto_1194913 ?auto_1194917 ) ) ( not ( = ?auto_1194913 ?auto_1194918 ) ) ( not ( = ?auto_1194913 ?auto_1194919 ) ) ( not ( = ?auto_1194913 ?auto_1194920 ) ) ( not ( = ?auto_1194913 ?auto_1194921 ) ) ( not ( = ?auto_1194914 ?auto_1194915 ) ) ( not ( = ?auto_1194914 ?auto_1194916 ) ) ( not ( = ?auto_1194914 ?auto_1194917 ) ) ( not ( = ?auto_1194914 ?auto_1194918 ) ) ( not ( = ?auto_1194914 ?auto_1194919 ) ) ( not ( = ?auto_1194914 ?auto_1194920 ) ) ( not ( = ?auto_1194914 ?auto_1194921 ) ) ( not ( = ?auto_1194915 ?auto_1194916 ) ) ( not ( = ?auto_1194915 ?auto_1194917 ) ) ( not ( = ?auto_1194915 ?auto_1194918 ) ) ( not ( = ?auto_1194915 ?auto_1194919 ) ) ( not ( = ?auto_1194915 ?auto_1194920 ) ) ( not ( = ?auto_1194915 ?auto_1194921 ) ) ( not ( = ?auto_1194916 ?auto_1194917 ) ) ( not ( = ?auto_1194916 ?auto_1194918 ) ) ( not ( = ?auto_1194916 ?auto_1194919 ) ) ( not ( = ?auto_1194916 ?auto_1194920 ) ) ( not ( = ?auto_1194916 ?auto_1194921 ) ) ( not ( = ?auto_1194917 ?auto_1194918 ) ) ( not ( = ?auto_1194917 ?auto_1194919 ) ) ( not ( = ?auto_1194917 ?auto_1194920 ) ) ( not ( = ?auto_1194917 ?auto_1194921 ) ) ( not ( = ?auto_1194918 ?auto_1194919 ) ) ( not ( = ?auto_1194918 ?auto_1194920 ) ) ( not ( = ?auto_1194918 ?auto_1194921 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1194919 ?auto_1194920 ?auto_1194921 )
      ( MAKE-10CRATE-VERIFY ?auto_1194911 ?auto_1194912 ?auto_1194913 ?auto_1194914 ?auto_1194915 ?auto_1194916 ?auto_1194917 ?auto_1194918 ?auto_1194919 ?auto_1194920 ?auto_1194921 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1195036 - SURFACE
      ?auto_1195037 - SURFACE
      ?auto_1195038 - SURFACE
      ?auto_1195039 - SURFACE
      ?auto_1195040 - SURFACE
      ?auto_1195041 - SURFACE
      ?auto_1195042 - SURFACE
      ?auto_1195043 - SURFACE
      ?auto_1195044 - SURFACE
      ?auto_1195045 - SURFACE
      ?auto_1195046 - SURFACE
    )
    :vars
    (
      ?auto_1195048 - HOIST
      ?auto_1195047 - PLACE
      ?auto_1195049 - TRUCK
      ?auto_1195052 - PLACE
      ?auto_1195051 - HOIST
      ?auto_1195050 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195048 ?auto_1195047 ) ( SURFACE-AT ?auto_1195045 ?auto_1195047 ) ( CLEAR ?auto_1195045 ) ( IS-CRATE ?auto_1195046 ) ( not ( = ?auto_1195045 ?auto_1195046 ) ) ( AVAILABLE ?auto_1195048 ) ( ON ?auto_1195045 ?auto_1195044 ) ( not ( = ?auto_1195044 ?auto_1195045 ) ) ( not ( = ?auto_1195044 ?auto_1195046 ) ) ( TRUCK-AT ?auto_1195049 ?auto_1195052 ) ( not ( = ?auto_1195052 ?auto_1195047 ) ) ( HOIST-AT ?auto_1195051 ?auto_1195052 ) ( not ( = ?auto_1195048 ?auto_1195051 ) ) ( AVAILABLE ?auto_1195051 ) ( SURFACE-AT ?auto_1195046 ?auto_1195052 ) ( ON ?auto_1195046 ?auto_1195050 ) ( CLEAR ?auto_1195046 ) ( not ( = ?auto_1195045 ?auto_1195050 ) ) ( not ( = ?auto_1195046 ?auto_1195050 ) ) ( not ( = ?auto_1195044 ?auto_1195050 ) ) ( ON ?auto_1195037 ?auto_1195036 ) ( ON ?auto_1195038 ?auto_1195037 ) ( ON ?auto_1195039 ?auto_1195038 ) ( ON ?auto_1195040 ?auto_1195039 ) ( ON ?auto_1195041 ?auto_1195040 ) ( ON ?auto_1195042 ?auto_1195041 ) ( ON ?auto_1195043 ?auto_1195042 ) ( ON ?auto_1195044 ?auto_1195043 ) ( not ( = ?auto_1195036 ?auto_1195037 ) ) ( not ( = ?auto_1195036 ?auto_1195038 ) ) ( not ( = ?auto_1195036 ?auto_1195039 ) ) ( not ( = ?auto_1195036 ?auto_1195040 ) ) ( not ( = ?auto_1195036 ?auto_1195041 ) ) ( not ( = ?auto_1195036 ?auto_1195042 ) ) ( not ( = ?auto_1195036 ?auto_1195043 ) ) ( not ( = ?auto_1195036 ?auto_1195044 ) ) ( not ( = ?auto_1195036 ?auto_1195045 ) ) ( not ( = ?auto_1195036 ?auto_1195046 ) ) ( not ( = ?auto_1195036 ?auto_1195050 ) ) ( not ( = ?auto_1195037 ?auto_1195038 ) ) ( not ( = ?auto_1195037 ?auto_1195039 ) ) ( not ( = ?auto_1195037 ?auto_1195040 ) ) ( not ( = ?auto_1195037 ?auto_1195041 ) ) ( not ( = ?auto_1195037 ?auto_1195042 ) ) ( not ( = ?auto_1195037 ?auto_1195043 ) ) ( not ( = ?auto_1195037 ?auto_1195044 ) ) ( not ( = ?auto_1195037 ?auto_1195045 ) ) ( not ( = ?auto_1195037 ?auto_1195046 ) ) ( not ( = ?auto_1195037 ?auto_1195050 ) ) ( not ( = ?auto_1195038 ?auto_1195039 ) ) ( not ( = ?auto_1195038 ?auto_1195040 ) ) ( not ( = ?auto_1195038 ?auto_1195041 ) ) ( not ( = ?auto_1195038 ?auto_1195042 ) ) ( not ( = ?auto_1195038 ?auto_1195043 ) ) ( not ( = ?auto_1195038 ?auto_1195044 ) ) ( not ( = ?auto_1195038 ?auto_1195045 ) ) ( not ( = ?auto_1195038 ?auto_1195046 ) ) ( not ( = ?auto_1195038 ?auto_1195050 ) ) ( not ( = ?auto_1195039 ?auto_1195040 ) ) ( not ( = ?auto_1195039 ?auto_1195041 ) ) ( not ( = ?auto_1195039 ?auto_1195042 ) ) ( not ( = ?auto_1195039 ?auto_1195043 ) ) ( not ( = ?auto_1195039 ?auto_1195044 ) ) ( not ( = ?auto_1195039 ?auto_1195045 ) ) ( not ( = ?auto_1195039 ?auto_1195046 ) ) ( not ( = ?auto_1195039 ?auto_1195050 ) ) ( not ( = ?auto_1195040 ?auto_1195041 ) ) ( not ( = ?auto_1195040 ?auto_1195042 ) ) ( not ( = ?auto_1195040 ?auto_1195043 ) ) ( not ( = ?auto_1195040 ?auto_1195044 ) ) ( not ( = ?auto_1195040 ?auto_1195045 ) ) ( not ( = ?auto_1195040 ?auto_1195046 ) ) ( not ( = ?auto_1195040 ?auto_1195050 ) ) ( not ( = ?auto_1195041 ?auto_1195042 ) ) ( not ( = ?auto_1195041 ?auto_1195043 ) ) ( not ( = ?auto_1195041 ?auto_1195044 ) ) ( not ( = ?auto_1195041 ?auto_1195045 ) ) ( not ( = ?auto_1195041 ?auto_1195046 ) ) ( not ( = ?auto_1195041 ?auto_1195050 ) ) ( not ( = ?auto_1195042 ?auto_1195043 ) ) ( not ( = ?auto_1195042 ?auto_1195044 ) ) ( not ( = ?auto_1195042 ?auto_1195045 ) ) ( not ( = ?auto_1195042 ?auto_1195046 ) ) ( not ( = ?auto_1195042 ?auto_1195050 ) ) ( not ( = ?auto_1195043 ?auto_1195044 ) ) ( not ( = ?auto_1195043 ?auto_1195045 ) ) ( not ( = ?auto_1195043 ?auto_1195046 ) ) ( not ( = ?auto_1195043 ?auto_1195050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195044 ?auto_1195045 ?auto_1195046 )
      ( MAKE-10CRATE-VERIFY ?auto_1195036 ?auto_1195037 ?auto_1195038 ?auto_1195039 ?auto_1195040 ?auto_1195041 ?auto_1195042 ?auto_1195043 ?auto_1195044 ?auto_1195045 ?auto_1195046 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1195162 - SURFACE
      ?auto_1195163 - SURFACE
      ?auto_1195164 - SURFACE
      ?auto_1195165 - SURFACE
      ?auto_1195166 - SURFACE
      ?auto_1195167 - SURFACE
      ?auto_1195168 - SURFACE
      ?auto_1195169 - SURFACE
      ?auto_1195170 - SURFACE
      ?auto_1195171 - SURFACE
      ?auto_1195172 - SURFACE
    )
    :vars
    (
      ?auto_1195176 - HOIST
      ?auto_1195175 - PLACE
      ?auto_1195178 - PLACE
      ?auto_1195173 - HOIST
      ?auto_1195174 - SURFACE
      ?auto_1195177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195176 ?auto_1195175 ) ( SURFACE-AT ?auto_1195171 ?auto_1195175 ) ( CLEAR ?auto_1195171 ) ( IS-CRATE ?auto_1195172 ) ( not ( = ?auto_1195171 ?auto_1195172 ) ) ( AVAILABLE ?auto_1195176 ) ( ON ?auto_1195171 ?auto_1195170 ) ( not ( = ?auto_1195170 ?auto_1195171 ) ) ( not ( = ?auto_1195170 ?auto_1195172 ) ) ( not ( = ?auto_1195178 ?auto_1195175 ) ) ( HOIST-AT ?auto_1195173 ?auto_1195178 ) ( not ( = ?auto_1195176 ?auto_1195173 ) ) ( AVAILABLE ?auto_1195173 ) ( SURFACE-AT ?auto_1195172 ?auto_1195178 ) ( ON ?auto_1195172 ?auto_1195174 ) ( CLEAR ?auto_1195172 ) ( not ( = ?auto_1195171 ?auto_1195174 ) ) ( not ( = ?auto_1195172 ?auto_1195174 ) ) ( not ( = ?auto_1195170 ?auto_1195174 ) ) ( TRUCK-AT ?auto_1195177 ?auto_1195175 ) ( ON ?auto_1195163 ?auto_1195162 ) ( ON ?auto_1195164 ?auto_1195163 ) ( ON ?auto_1195165 ?auto_1195164 ) ( ON ?auto_1195166 ?auto_1195165 ) ( ON ?auto_1195167 ?auto_1195166 ) ( ON ?auto_1195168 ?auto_1195167 ) ( ON ?auto_1195169 ?auto_1195168 ) ( ON ?auto_1195170 ?auto_1195169 ) ( not ( = ?auto_1195162 ?auto_1195163 ) ) ( not ( = ?auto_1195162 ?auto_1195164 ) ) ( not ( = ?auto_1195162 ?auto_1195165 ) ) ( not ( = ?auto_1195162 ?auto_1195166 ) ) ( not ( = ?auto_1195162 ?auto_1195167 ) ) ( not ( = ?auto_1195162 ?auto_1195168 ) ) ( not ( = ?auto_1195162 ?auto_1195169 ) ) ( not ( = ?auto_1195162 ?auto_1195170 ) ) ( not ( = ?auto_1195162 ?auto_1195171 ) ) ( not ( = ?auto_1195162 ?auto_1195172 ) ) ( not ( = ?auto_1195162 ?auto_1195174 ) ) ( not ( = ?auto_1195163 ?auto_1195164 ) ) ( not ( = ?auto_1195163 ?auto_1195165 ) ) ( not ( = ?auto_1195163 ?auto_1195166 ) ) ( not ( = ?auto_1195163 ?auto_1195167 ) ) ( not ( = ?auto_1195163 ?auto_1195168 ) ) ( not ( = ?auto_1195163 ?auto_1195169 ) ) ( not ( = ?auto_1195163 ?auto_1195170 ) ) ( not ( = ?auto_1195163 ?auto_1195171 ) ) ( not ( = ?auto_1195163 ?auto_1195172 ) ) ( not ( = ?auto_1195163 ?auto_1195174 ) ) ( not ( = ?auto_1195164 ?auto_1195165 ) ) ( not ( = ?auto_1195164 ?auto_1195166 ) ) ( not ( = ?auto_1195164 ?auto_1195167 ) ) ( not ( = ?auto_1195164 ?auto_1195168 ) ) ( not ( = ?auto_1195164 ?auto_1195169 ) ) ( not ( = ?auto_1195164 ?auto_1195170 ) ) ( not ( = ?auto_1195164 ?auto_1195171 ) ) ( not ( = ?auto_1195164 ?auto_1195172 ) ) ( not ( = ?auto_1195164 ?auto_1195174 ) ) ( not ( = ?auto_1195165 ?auto_1195166 ) ) ( not ( = ?auto_1195165 ?auto_1195167 ) ) ( not ( = ?auto_1195165 ?auto_1195168 ) ) ( not ( = ?auto_1195165 ?auto_1195169 ) ) ( not ( = ?auto_1195165 ?auto_1195170 ) ) ( not ( = ?auto_1195165 ?auto_1195171 ) ) ( not ( = ?auto_1195165 ?auto_1195172 ) ) ( not ( = ?auto_1195165 ?auto_1195174 ) ) ( not ( = ?auto_1195166 ?auto_1195167 ) ) ( not ( = ?auto_1195166 ?auto_1195168 ) ) ( not ( = ?auto_1195166 ?auto_1195169 ) ) ( not ( = ?auto_1195166 ?auto_1195170 ) ) ( not ( = ?auto_1195166 ?auto_1195171 ) ) ( not ( = ?auto_1195166 ?auto_1195172 ) ) ( not ( = ?auto_1195166 ?auto_1195174 ) ) ( not ( = ?auto_1195167 ?auto_1195168 ) ) ( not ( = ?auto_1195167 ?auto_1195169 ) ) ( not ( = ?auto_1195167 ?auto_1195170 ) ) ( not ( = ?auto_1195167 ?auto_1195171 ) ) ( not ( = ?auto_1195167 ?auto_1195172 ) ) ( not ( = ?auto_1195167 ?auto_1195174 ) ) ( not ( = ?auto_1195168 ?auto_1195169 ) ) ( not ( = ?auto_1195168 ?auto_1195170 ) ) ( not ( = ?auto_1195168 ?auto_1195171 ) ) ( not ( = ?auto_1195168 ?auto_1195172 ) ) ( not ( = ?auto_1195168 ?auto_1195174 ) ) ( not ( = ?auto_1195169 ?auto_1195170 ) ) ( not ( = ?auto_1195169 ?auto_1195171 ) ) ( not ( = ?auto_1195169 ?auto_1195172 ) ) ( not ( = ?auto_1195169 ?auto_1195174 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195170 ?auto_1195171 ?auto_1195172 )
      ( MAKE-10CRATE-VERIFY ?auto_1195162 ?auto_1195163 ?auto_1195164 ?auto_1195165 ?auto_1195166 ?auto_1195167 ?auto_1195168 ?auto_1195169 ?auto_1195170 ?auto_1195171 ?auto_1195172 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1195288 - SURFACE
      ?auto_1195289 - SURFACE
      ?auto_1195290 - SURFACE
      ?auto_1195291 - SURFACE
      ?auto_1195292 - SURFACE
      ?auto_1195293 - SURFACE
      ?auto_1195294 - SURFACE
      ?auto_1195295 - SURFACE
      ?auto_1195296 - SURFACE
      ?auto_1195297 - SURFACE
      ?auto_1195298 - SURFACE
    )
    :vars
    (
      ?auto_1195300 - HOIST
      ?auto_1195301 - PLACE
      ?auto_1195299 - PLACE
      ?auto_1195303 - HOIST
      ?auto_1195302 - SURFACE
      ?auto_1195304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195300 ?auto_1195301 ) ( IS-CRATE ?auto_1195298 ) ( not ( = ?auto_1195297 ?auto_1195298 ) ) ( not ( = ?auto_1195296 ?auto_1195297 ) ) ( not ( = ?auto_1195296 ?auto_1195298 ) ) ( not ( = ?auto_1195299 ?auto_1195301 ) ) ( HOIST-AT ?auto_1195303 ?auto_1195299 ) ( not ( = ?auto_1195300 ?auto_1195303 ) ) ( AVAILABLE ?auto_1195303 ) ( SURFACE-AT ?auto_1195298 ?auto_1195299 ) ( ON ?auto_1195298 ?auto_1195302 ) ( CLEAR ?auto_1195298 ) ( not ( = ?auto_1195297 ?auto_1195302 ) ) ( not ( = ?auto_1195298 ?auto_1195302 ) ) ( not ( = ?auto_1195296 ?auto_1195302 ) ) ( TRUCK-AT ?auto_1195304 ?auto_1195301 ) ( SURFACE-AT ?auto_1195296 ?auto_1195301 ) ( CLEAR ?auto_1195296 ) ( LIFTING ?auto_1195300 ?auto_1195297 ) ( IS-CRATE ?auto_1195297 ) ( ON ?auto_1195289 ?auto_1195288 ) ( ON ?auto_1195290 ?auto_1195289 ) ( ON ?auto_1195291 ?auto_1195290 ) ( ON ?auto_1195292 ?auto_1195291 ) ( ON ?auto_1195293 ?auto_1195292 ) ( ON ?auto_1195294 ?auto_1195293 ) ( ON ?auto_1195295 ?auto_1195294 ) ( ON ?auto_1195296 ?auto_1195295 ) ( not ( = ?auto_1195288 ?auto_1195289 ) ) ( not ( = ?auto_1195288 ?auto_1195290 ) ) ( not ( = ?auto_1195288 ?auto_1195291 ) ) ( not ( = ?auto_1195288 ?auto_1195292 ) ) ( not ( = ?auto_1195288 ?auto_1195293 ) ) ( not ( = ?auto_1195288 ?auto_1195294 ) ) ( not ( = ?auto_1195288 ?auto_1195295 ) ) ( not ( = ?auto_1195288 ?auto_1195296 ) ) ( not ( = ?auto_1195288 ?auto_1195297 ) ) ( not ( = ?auto_1195288 ?auto_1195298 ) ) ( not ( = ?auto_1195288 ?auto_1195302 ) ) ( not ( = ?auto_1195289 ?auto_1195290 ) ) ( not ( = ?auto_1195289 ?auto_1195291 ) ) ( not ( = ?auto_1195289 ?auto_1195292 ) ) ( not ( = ?auto_1195289 ?auto_1195293 ) ) ( not ( = ?auto_1195289 ?auto_1195294 ) ) ( not ( = ?auto_1195289 ?auto_1195295 ) ) ( not ( = ?auto_1195289 ?auto_1195296 ) ) ( not ( = ?auto_1195289 ?auto_1195297 ) ) ( not ( = ?auto_1195289 ?auto_1195298 ) ) ( not ( = ?auto_1195289 ?auto_1195302 ) ) ( not ( = ?auto_1195290 ?auto_1195291 ) ) ( not ( = ?auto_1195290 ?auto_1195292 ) ) ( not ( = ?auto_1195290 ?auto_1195293 ) ) ( not ( = ?auto_1195290 ?auto_1195294 ) ) ( not ( = ?auto_1195290 ?auto_1195295 ) ) ( not ( = ?auto_1195290 ?auto_1195296 ) ) ( not ( = ?auto_1195290 ?auto_1195297 ) ) ( not ( = ?auto_1195290 ?auto_1195298 ) ) ( not ( = ?auto_1195290 ?auto_1195302 ) ) ( not ( = ?auto_1195291 ?auto_1195292 ) ) ( not ( = ?auto_1195291 ?auto_1195293 ) ) ( not ( = ?auto_1195291 ?auto_1195294 ) ) ( not ( = ?auto_1195291 ?auto_1195295 ) ) ( not ( = ?auto_1195291 ?auto_1195296 ) ) ( not ( = ?auto_1195291 ?auto_1195297 ) ) ( not ( = ?auto_1195291 ?auto_1195298 ) ) ( not ( = ?auto_1195291 ?auto_1195302 ) ) ( not ( = ?auto_1195292 ?auto_1195293 ) ) ( not ( = ?auto_1195292 ?auto_1195294 ) ) ( not ( = ?auto_1195292 ?auto_1195295 ) ) ( not ( = ?auto_1195292 ?auto_1195296 ) ) ( not ( = ?auto_1195292 ?auto_1195297 ) ) ( not ( = ?auto_1195292 ?auto_1195298 ) ) ( not ( = ?auto_1195292 ?auto_1195302 ) ) ( not ( = ?auto_1195293 ?auto_1195294 ) ) ( not ( = ?auto_1195293 ?auto_1195295 ) ) ( not ( = ?auto_1195293 ?auto_1195296 ) ) ( not ( = ?auto_1195293 ?auto_1195297 ) ) ( not ( = ?auto_1195293 ?auto_1195298 ) ) ( not ( = ?auto_1195293 ?auto_1195302 ) ) ( not ( = ?auto_1195294 ?auto_1195295 ) ) ( not ( = ?auto_1195294 ?auto_1195296 ) ) ( not ( = ?auto_1195294 ?auto_1195297 ) ) ( not ( = ?auto_1195294 ?auto_1195298 ) ) ( not ( = ?auto_1195294 ?auto_1195302 ) ) ( not ( = ?auto_1195295 ?auto_1195296 ) ) ( not ( = ?auto_1195295 ?auto_1195297 ) ) ( not ( = ?auto_1195295 ?auto_1195298 ) ) ( not ( = ?auto_1195295 ?auto_1195302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195296 ?auto_1195297 ?auto_1195298 )
      ( MAKE-10CRATE-VERIFY ?auto_1195288 ?auto_1195289 ?auto_1195290 ?auto_1195291 ?auto_1195292 ?auto_1195293 ?auto_1195294 ?auto_1195295 ?auto_1195296 ?auto_1195297 ?auto_1195298 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1195414 - SURFACE
      ?auto_1195415 - SURFACE
      ?auto_1195416 - SURFACE
      ?auto_1195417 - SURFACE
      ?auto_1195418 - SURFACE
      ?auto_1195419 - SURFACE
      ?auto_1195420 - SURFACE
      ?auto_1195421 - SURFACE
      ?auto_1195422 - SURFACE
      ?auto_1195423 - SURFACE
      ?auto_1195424 - SURFACE
    )
    :vars
    (
      ?auto_1195429 - HOIST
      ?auto_1195428 - PLACE
      ?auto_1195426 - PLACE
      ?auto_1195425 - HOIST
      ?auto_1195427 - SURFACE
      ?auto_1195430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195429 ?auto_1195428 ) ( IS-CRATE ?auto_1195424 ) ( not ( = ?auto_1195423 ?auto_1195424 ) ) ( not ( = ?auto_1195422 ?auto_1195423 ) ) ( not ( = ?auto_1195422 ?auto_1195424 ) ) ( not ( = ?auto_1195426 ?auto_1195428 ) ) ( HOIST-AT ?auto_1195425 ?auto_1195426 ) ( not ( = ?auto_1195429 ?auto_1195425 ) ) ( AVAILABLE ?auto_1195425 ) ( SURFACE-AT ?auto_1195424 ?auto_1195426 ) ( ON ?auto_1195424 ?auto_1195427 ) ( CLEAR ?auto_1195424 ) ( not ( = ?auto_1195423 ?auto_1195427 ) ) ( not ( = ?auto_1195424 ?auto_1195427 ) ) ( not ( = ?auto_1195422 ?auto_1195427 ) ) ( TRUCK-AT ?auto_1195430 ?auto_1195428 ) ( SURFACE-AT ?auto_1195422 ?auto_1195428 ) ( CLEAR ?auto_1195422 ) ( IS-CRATE ?auto_1195423 ) ( AVAILABLE ?auto_1195429 ) ( IN ?auto_1195423 ?auto_1195430 ) ( ON ?auto_1195415 ?auto_1195414 ) ( ON ?auto_1195416 ?auto_1195415 ) ( ON ?auto_1195417 ?auto_1195416 ) ( ON ?auto_1195418 ?auto_1195417 ) ( ON ?auto_1195419 ?auto_1195418 ) ( ON ?auto_1195420 ?auto_1195419 ) ( ON ?auto_1195421 ?auto_1195420 ) ( ON ?auto_1195422 ?auto_1195421 ) ( not ( = ?auto_1195414 ?auto_1195415 ) ) ( not ( = ?auto_1195414 ?auto_1195416 ) ) ( not ( = ?auto_1195414 ?auto_1195417 ) ) ( not ( = ?auto_1195414 ?auto_1195418 ) ) ( not ( = ?auto_1195414 ?auto_1195419 ) ) ( not ( = ?auto_1195414 ?auto_1195420 ) ) ( not ( = ?auto_1195414 ?auto_1195421 ) ) ( not ( = ?auto_1195414 ?auto_1195422 ) ) ( not ( = ?auto_1195414 ?auto_1195423 ) ) ( not ( = ?auto_1195414 ?auto_1195424 ) ) ( not ( = ?auto_1195414 ?auto_1195427 ) ) ( not ( = ?auto_1195415 ?auto_1195416 ) ) ( not ( = ?auto_1195415 ?auto_1195417 ) ) ( not ( = ?auto_1195415 ?auto_1195418 ) ) ( not ( = ?auto_1195415 ?auto_1195419 ) ) ( not ( = ?auto_1195415 ?auto_1195420 ) ) ( not ( = ?auto_1195415 ?auto_1195421 ) ) ( not ( = ?auto_1195415 ?auto_1195422 ) ) ( not ( = ?auto_1195415 ?auto_1195423 ) ) ( not ( = ?auto_1195415 ?auto_1195424 ) ) ( not ( = ?auto_1195415 ?auto_1195427 ) ) ( not ( = ?auto_1195416 ?auto_1195417 ) ) ( not ( = ?auto_1195416 ?auto_1195418 ) ) ( not ( = ?auto_1195416 ?auto_1195419 ) ) ( not ( = ?auto_1195416 ?auto_1195420 ) ) ( not ( = ?auto_1195416 ?auto_1195421 ) ) ( not ( = ?auto_1195416 ?auto_1195422 ) ) ( not ( = ?auto_1195416 ?auto_1195423 ) ) ( not ( = ?auto_1195416 ?auto_1195424 ) ) ( not ( = ?auto_1195416 ?auto_1195427 ) ) ( not ( = ?auto_1195417 ?auto_1195418 ) ) ( not ( = ?auto_1195417 ?auto_1195419 ) ) ( not ( = ?auto_1195417 ?auto_1195420 ) ) ( not ( = ?auto_1195417 ?auto_1195421 ) ) ( not ( = ?auto_1195417 ?auto_1195422 ) ) ( not ( = ?auto_1195417 ?auto_1195423 ) ) ( not ( = ?auto_1195417 ?auto_1195424 ) ) ( not ( = ?auto_1195417 ?auto_1195427 ) ) ( not ( = ?auto_1195418 ?auto_1195419 ) ) ( not ( = ?auto_1195418 ?auto_1195420 ) ) ( not ( = ?auto_1195418 ?auto_1195421 ) ) ( not ( = ?auto_1195418 ?auto_1195422 ) ) ( not ( = ?auto_1195418 ?auto_1195423 ) ) ( not ( = ?auto_1195418 ?auto_1195424 ) ) ( not ( = ?auto_1195418 ?auto_1195427 ) ) ( not ( = ?auto_1195419 ?auto_1195420 ) ) ( not ( = ?auto_1195419 ?auto_1195421 ) ) ( not ( = ?auto_1195419 ?auto_1195422 ) ) ( not ( = ?auto_1195419 ?auto_1195423 ) ) ( not ( = ?auto_1195419 ?auto_1195424 ) ) ( not ( = ?auto_1195419 ?auto_1195427 ) ) ( not ( = ?auto_1195420 ?auto_1195421 ) ) ( not ( = ?auto_1195420 ?auto_1195422 ) ) ( not ( = ?auto_1195420 ?auto_1195423 ) ) ( not ( = ?auto_1195420 ?auto_1195424 ) ) ( not ( = ?auto_1195420 ?auto_1195427 ) ) ( not ( = ?auto_1195421 ?auto_1195422 ) ) ( not ( = ?auto_1195421 ?auto_1195423 ) ) ( not ( = ?auto_1195421 ?auto_1195424 ) ) ( not ( = ?auto_1195421 ?auto_1195427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1195422 ?auto_1195423 ?auto_1195424 )
      ( MAKE-10CRATE-VERIFY ?auto_1195414 ?auto_1195415 ?auto_1195416 ?auto_1195417 ?auto_1195418 ?auto_1195419 ?auto_1195420 ?auto_1195421 ?auto_1195422 ?auto_1195423 ?auto_1195424 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1202698 - SURFACE
      ?auto_1202699 - SURFACE
      ?auto_1202700 - SURFACE
      ?auto_1202701 - SURFACE
      ?auto_1202702 - SURFACE
      ?auto_1202703 - SURFACE
      ?auto_1202704 - SURFACE
      ?auto_1202705 - SURFACE
      ?auto_1202706 - SURFACE
      ?auto_1202707 - SURFACE
      ?auto_1202708 - SURFACE
      ?auto_1202709 - SURFACE
    )
    :vars
    (
      ?auto_1202710 - HOIST
      ?auto_1202711 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1202710 ?auto_1202711 ) ( SURFACE-AT ?auto_1202708 ?auto_1202711 ) ( CLEAR ?auto_1202708 ) ( LIFTING ?auto_1202710 ?auto_1202709 ) ( IS-CRATE ?auto_1202709 ) ( not ( = ?auto_1202708 ?auto_1202709 ) ) ( ON ?auto_1202699 ?auto_1202698 ) ( ON ?auto_1202700 ?auto_1202699 ) ( ON ?auto_1202701 ?auto_1202700 ) ( ON ?auto_1202702 ?auto_1202701 ) ( ON ?auto_1202703 ?auto_1202702 ) ( ON ?auto_1202704 ?auto_1202703 ) ( ON ?auto_1202705 ?auto_1202704 ) ( ON ?auto_1202706 ?auto_1202705 ) ( ON ?auto_1202707 ?auto_1202706 ) ( ON ?auto_1202708 ?auto_1202707 ) ( not ( = ?auto_1202698 ?auto_1202699 ) ) ( not ( = ?auto_1202698 ?auto_1202700 ) ) ( not ( = ?auto_1202698 ?auto_1202701 ) ) ( not ( = ?auto_1202698 ?auto_1202702 ) ) ( not ( = ?auto_1202698 ?auto_1202703 ) ) ( not ( = ?auto_1202698 ?auto_1202704 ) ) ( not ( = ?auto_1202698 ?auto_1202705 ) ) ( not ( = ?auto_1202698 ?auto_1202706 ) ) ( not ( = ?auto_1202698 ?auto_1202707 ) ) ( not ( = ?auto_1202698 ?auto_1202708 ) ) ( not ( = ?auto_1202698 ?auto_1202709 ) ) ( not ( = ?auto_1202699 ?auto_1202700 ) ) ( not ( = ?auto_1202699 ?auto_1202701 ) ) ( not ( = ?auto_1202699 ?auto_1202702 ) ) ( not ( = ?auto_1202699 ?auto_1202703 ) ) ( not ( = ?auto_1202699 ?auto_1202704 ) ) ( not ( = ?auto_1202699 ?auto_1202705 ) ) ( not ( = ?auto_1202699 ?auto_1202706 ) ) ( not ( = ?auto_1202699 ?auto_1202707 ) ) ( not ( = ?auto_1202699 ?auto_1202708 ) ) ( not ( = ?auto_1202699 ?auto_1202709 ) ) ( not ( = ?auto_1202700 ?auto_1202701 ) ) ( not ( = ?auto_1202700 ?auto_1202702 ) ) ( not ( = ?auto_1202700 ?auto_1202703 ) ) ( not ( = ?auto_1202700 ?auto_1202704 ) ) ( not ( = ?auto_1202700 ?auto_1202705 ) ) ( not ( = ?auto_1202700 ?auto_1202706 ) ) ( not ( = ?auto_1202700 ?auto_1202707 ) ) ( not ( = ?auto_1202700 ?auto_1202708 ) ) ( not ( = ?auto_1202700 ?auto_1202709 ) ) ( not ( = ?auto_1202701 ?auto_1202702 ) ) ( not ( = ?auto_1202701 ?auto_1202703 ) ) ( not ( = ?auto_1202701 ?auto_1202704 ) ) ( not ( = ?auto_1202701 ?auto_1202705 ) ) ( not ( = ?auto_1202701 ?auto_1202706 ) ) ( not ( = ?auto_1202701 ?auto_1202707 ) ) ( not ( = ?auto_1202701 ?auto_1202708 ) ) ( not ( = ?auto_1202701 ?auto_1202709 ) ) ( not ( = ?auto_1202702 ?auto_1202703 ) ) ( not ( = ?auto_1202702 ?auto_1202704 ) ) ( not ( = ?auto_1202702 ?auto_1202705 ) ) ( not ( = ?auto_1202702 ?auto_1202706 ) ) ( not ( = ?auto_1202702 ?auto_1202707 ) ) ( not ( = ?auto_1202702 ?auto_1202708 ) ) ( not ( = ?auto_1202702 ?auto_1202709 ) ) ( not ( = ?auto_1202703 ?auto_1202704 ) ) ( not ( = ?auto_1202703 ?auto_1202705 ) ) ( not ( = ?auto_1202703 ?auto_1202706 ) ) ( not ( = ?auto_1202703 ?auto_1202707 ) ) ( not ( = ?auto_1202703 ?auto_1202708 ) ) ( not ( = ?auto_1202703 ?auto_1202709 ) ) ( not ( = ?auto_1202704 ?auto_1202705 ) ) ( not ( = ?auto_1202704 ?auto_1202706 ) ) ( not ( = ?auto_1202704 ?auto_1202707 ) ) ( not ( = ?auto_1202704 ?auto_1202708 ) ) ( not ( = ?auto_1202704 ?auto_1202709 ) ) ( not ( = ?auto_1202705 ?auto_1202706 ) ) ( not ( = ?auto_1202705 ?auto_1202707 ) ) ( not ( = ?auto_1202705 ?auto_1202708 ) ) ( not ( = ?auto_1202705 ?auto_1202709 ) ) ( not ( = ?auto_1202706 ?auto_1202707 ) ) ( not ( = ?auto_1202706 ?auto_1202708 ) ) ( not ( = ?auto_1202706 ?auto_1202709 ) ) ( not ( = ?auto_1202707 ?auto_1202708 ) ) ( not ( = ?auto_1202707 ?auto_1202709 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1202708 ?auto_1202709 )
      ( MAKE-11CRATE-VERIFY ?auto_1202698 ?auto_1202699 ?auto_1202700 ?auto_1202701 ?auto_1202702 ?auto_1202703 ?auto_1202704 ?auto_1202705 ?auto_1202706 ?auto_1202707 ?auto_1202708 ?auto_1202709 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1202807 - SURFACE
      ?auto_1202808 - SURFACE
      ?auto_1202809 - SURFACE
      ?auto_1202810 - SURFACE
      ?auto_1202811 - SURFACE
      ?auto_1202812 - SURFACE
      ?auto_1202813 - SURFACE
      ?auto_1202814 - SURFACE
      ?auto_1202815 - SURFACE
      ?auto_1202816 - SURFACE
      ?auto_1202817 - SURFACE
      ?auto_1202818 - SURFACE
    )
    :vars
    (
      ?auto_1202820 - HOIST
      ?auto_1202821 - PLACE
      ?auto_1202819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1202820 ?auto_1202821 ) ( SURFACE-AT ?auto_1202817 ?auto_1202821 ) ( CLEAR ?auto_1202817 ) ( IS-CRATE ?auto_1202818 ) ( not ( = ?auto_1202817 ?auto_1202818 ) ) ( TRUCK-AT ?auto_1202819 ?auto_1202821 ) ( AVAILABLE ?auto_1202820 ) ( IN ?auto_1202818 ?auto_1202819 ) ( ON ?auto_1202817 ?auto_1202816 ) ( not ( = ?auto_1202816 ?auto_1202817 ) ) ( not ( = ?auto_1202816 ?auto_1202818 ) ) ( ON ?auto_1202808 ?auto_1202807 ) ( ON ?auto_1202809 ?auto_1202808 ) ( ON ?auto_1202810 ?auto_1202809 ) ( ON ?auto_1202811 ?auto_1202810 ) ( ON ?auto_1202812 ?auto_1202811 ) ( ON ?auto_1202813 ?auto_1202812 ) ( ON ?auto_1202814 ?auto_1202813 ) ( ON ?auto_1202815 ?auto_1202814 ) ( ON ?auto_1202816 ?auto_1202815 ) ( not ( = ?auto_1202807 ?auto_1202808 ) ) ( not ( = ?auto_1202807 ?auto_1202809 ) ) ( not ( = ?auto_1202807 ?auto_1202810 ) ) ( not ( = ?auto_1202807 ?auto_1202811 ) ) ( not ( = ?auto_1202807 ?auto_1202812 ) ) ( not ( = ?auto_1202807 ?auto_1202813 ) ) ( not ( = ?auto_1202807 ?auto_1202814 ) ) ( not ( = ?auto_1202807 ?auto_1202815 ) ) ( not ( = ?auto_1202807 ?auto_1202816 ) ) ( not ( = ?auto_1202807 ?auto_1202817 ) ) ( not ( = ?auto_1202807 ?auto_1202818 ) ) ( not ( = ?auto_1202808 ?auto_1202809 ) ) ( not ( = ?auto_1202808 ?auto_1202810 ) ) ( not ( = ?auto_1202808 ?auto_1202811 ) ) ( not ( = ?auto_1202808 ?auto_1202812 ) ) ( not ( = ?auto_1202808 ?auto_1202813 ) ) ( not ( = ?auto_1202808 ?auto_1202814 ) ) ( not ( = ?auto_1202808 ?auto_1202815 ) ) ( not ( = ?auto_1202808 ?auto_1202816 ) ) ( not ( = ?auto_1202808 ?auto_1202817 ) ) ( not ( = ?auto_1202808 ?auto_1202818 ) ) ( not ( = ?auto_1202809 ?auto_1202810 ) ) ( not ( = ?auto_1202809 ?auto_1202811 ) ) ( not ( = ?auto_1202809 ?auto_1202812 ) ) ( not ( = ?auto_1202809 ?auto_1202813 ) ) ( not ( = ?auto_1202809 ?auto_1202814 ) ) ( not ( = ?auto_1202809 ?auto_1202815 ) ) ( not ( = ?auto_1202809 ?auto_1202816 ) ) ( not ( = ?auto_1202809 ?auto_1202817 ) ) ( not ( = ?auto_1202809 ?auto_1202818 ) ) ( not ( = ?auto_1202810 ?auto_1202811 ) ) ( not ( = ?auto_1202810 ?auto_1202812 ) ) ( not ( = ?auto_1202810 ?auto_1202813 ) ) ( not ( = ?auto_1202810 ?auto_1202814 ) ) ( not ( = ?auto_1202810 ?auto_1202815 ) ) ( not ( = ?auto_1202810 ?auto_1202816 ) ) ( not ( = ?auto_1202810 ?auto_1202817 ) ) ( not ( = ?auto_1202810 ?auto_1202818 ) ) ( not ( = ?auto_1202811 ?auto_1202812 ) ) ( not ( = ?auto_1202811 ?auto_1202813 ) ) ( not ( = ?auto_1202811 ?auto_1202814 ) ) ( not ( = ?auto_1202811 ?auto_1202815 ) ) ( not ( = ?auto_1202811 ?auto_1202816 ) ) ( not ( = ?auto_1202811 ?auto_1202817 ) ) ( not ( = ?auto_1202811 ?auto_1202818 ) ) ( not ( = ?auto_1202812 ?auto_1202813 ) ) ( not ( = ?auto_1202812 ?auto_1202814 ) ) ( not ( = ?auto_1202812 ?auto_1202815 ) ) ( not ( = ?auto_1202812 ?auto_1202816 ) ) ( not ( = ?auto_1202812 ?auto_1202817 ) ) ( not ( = ?auto_1202812 ?auto_1202818 ) ) ( not ( = ?auto_1202813 ?auto_1202814 ) ) ( not ( = ?auto_1202813 ?auto_1202815 ) ) ( not ( = ?auto_1202813 ?auto_1202816 ) ) ( not ( = ?auto_1202813 ?auto_1202817 ) ) ( not ( = ?auto_1202813 ?auto_1202818 ) ) ( not ( = ?auto_1202814 ?auto_1202815 ) ) ( not ( = ?auto_1202814 ?auto_1202816 ) ) ( not ( = ?auto_1202814 ?auto_1202817 ) ) ( not ( = ?auto_1202814 ?auto_1202818 ) ) ( not ( = ?auto_1202815 ?auto_1202816 ) ) ( not ( = ?auto_1202815 ?auto_1202817 ) ) ( not ( = ?auto_1202815 ?auto_1202818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1202816 ?auto_1202817 ?auto_1202818 )
      ( MAKE-11CRATE-VERIFY ?auto_1202807 ?auto_1202808 ?auto_1202809 ?auto_1202810 ?auto_1202811 ?auto_1202812 ?auto_1202813 ?auto_1202814 ?auto_1202815 ?auto_1202816 ?auto_1202817 ?auto_1202818 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1202928 - SURFACE
      ?auto_1202929 - SURFACE
      ?auto_1202930 - SURFACE
      ?auto_1202931 - SURFACE
      ?auto_1202932 - SURFACE
      ?auto_1202933 - SURFACE
      ?auto_1202934 - SURFACE
      ?auto_1202935 - SURFACE
      ?auto_1202936 - SURFACE
      ?auto_1202937 - SURFACE
      ?auto_1202938 - SURFACE
      ?auto_1202939 - SURFACE
    )
    :vars
    (
      ?auto_1202940 - HOIST
      ?auto_1202941 - PLACE
      ?auto_1202942 - TRUCK
      ?auto_1202943 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1202940 ?auto_1202941 ) ( SURFACE-AT ?auto_1202938 ?auto_1202941 ) ( CLEAR ?auto_1202938 ) ( IS-CRATE ?auto_1202939 ) ( not ( = ?auto_1202938 ?auto_1202939 ) ) ( AVAILABLE ?auto_1202940 ) ( IN ?auto_1202939 ?auto_1202942 ) ( ON ?auto_1202938 ?auto_1202937 ) ( not ( = ?auto_1202937 ?auto_1202938 ) ) ( not ( = ?auto_1202937 ?auto_1202939 ) ) ( TRUCK-AT ?auto_1202942 ?auto_1202943 ) ( not ( = ?auto_1202943 ?auto_1202941 ) ) ( ON ?auto_1202929 ?auto_1202928 ) ( ON ?auto_1202930 ?auto_1202929 ) ( ON ?auto_1202931 ?auto_1202930 ) ( ON ?auto_1202932 ?auto_1202931 ) ( ON ?auto_1202933 ?auto_1202932 ) ( ON ?auto_1202934 ?auto_1202933 ) ( ON ?auto_1202935 ?auto_1202934 ) ( ON ?auto_1202936 ?auto_1202935 ) ( ON ?auto_1202937 ?auto_1202936 ) ( not ( = ?auto_1202928 ?auto_1202929 ) ) ( not ( = ?auto_1202928 ?auto_1202930 ) ) ( not ( = ?auto_1202928 ?auto_1202931 ) ) ( not ( = ?auto_1202928 ?auto_1202932 ) ) ( not ( = ?auto_1202928 ?auto_1202933 ) ) ( not ( = ?auto_1202928 ?auto_1202934 ) ) ( not ( = ?auto_1202928 ?auto_1202935 ) ) ( not ( = ?auto_1202928 ?auto_1202936 ) ) ( not ( = ?auto_1202928 ?auto_1202937 ) ) ( not ( = ?auto_1202928 ?auto_1202938 ) ) ( not ( = ?auto_1202928 ?auto_1202939 ) ) ( not ( = ?auto_1202929 ?auto_1202930 ) ) ( not ( = ?auto_1202929 ?auto_1202931 ) ) ( not ( = ?auto_1202929 ?auto_1202932 ) ) ( not ( = ?auto_1202929 ?auto_1202933 ) ) ( not ( = ?auto_1202929 ?auto_1202934 ) ) ( not ( = ?auto_1202929 ?auto_1202935 ) ) ( not ( = ?auto_1202929 ?auto_1202936 ) ) ( not ( = ?auto_1202929 ?auto_1202937 ) ) ( not ( = ?auto_1202929 ?auto_1202938 ) ) ( not ( = ?auto_1202929 ?auto_1202939 ) ) ( not ( = ?auto_1202930 ?auto_1202931 ) ) ( not ( = ?auto_1202930 ?auto_1202932 ) ) ( not ( = ?auto_1202930 ?auto_1202933 ) ) ( not ( = ?auto_1202930 ?auto_1202934 ) ) ( not ( = ?auto_1202930 ?auto_1202935 ) ) ( not ( = ?auto_1202930 ?auto_1202936 ) ) ( not ( = ?auto_1202930 ?auto_1202937 ) ) ( not ( = ?auto_1202930 ?auto_1202938 ) ) ( not ( = ?auto_1202930 ?auto_1202939 ) ) ( not ( = ?auto_1202931 ?auto_1202932 ) ) ( not ( = ?auto_1202931 ?auto_1202933 ) ) ( not ( = ?auto_1202931 ?auto_1202934 ) ) ( not ( = ?auto_1202931 ?auto_1202935 ) ) ( not ( = ?auto_1202931 ?auto_1202936 ) ) ( not ( = ?auto_1202931 ?auto_1202937 ) ) ( not ( = ?auto_1202931 ?auto_1202938 ) ) ( not ( = ?auto_1202931 ?auto_1202939 ) ) ( not ( = ?auto_1202932 ?auto_1202933 ) ) ( not ( = ?auto_1202932 ?auto_1202934 ) ) ( not ( = ?auto_1202932 ?auto_1202935 ) ) ( not ( = ?auto_1202932 ?auto_1202936 ) ) ( not ( = ?auto_1202932 ?auto_1202937 ) ) ( not ( = ?auto_1202932 ?auto_1202938 ) ) ( not ( = ?auto_1202932 ?auto_1202939 ) ) ( not ( = ?auto_1202933 ?auto_1202934 ) ) ( not ( = ?auto_1202933 ?auto_1202935 ) ) ( not ( = ?auto_1202933 ?auto_1202936 ) ) ( not ( = ?auto_1202933 ?auto_1202937 ) ) ( not ( = ?auto_1202933 ?auto_1202938 ) ) ( not ( = ?auto_1202933 ?auto_1202939 ) ) ( not ( = ?auto_1202934 ?auto_1202935 ) ) ( not ( = ?auto_1202934 ?auto_1202936 ) ) ( not ( = ?auto_1202934 ?auto_1202937 ) ) ( not ( = ?auto_1202934 ?auto_1202938 ) ) ( not ( = ?auto_1202934 ?auto_1202939 ) ) ( not ( = ?auto_1202935 ?auto_1202936 ) ) ( not ( = ?auto_1202935 ?auto_1202937 ) ) ( not ( = ?auto_1202935 ?auto_1202938 ) ) ( not ( = ?auto_1202935 ?auto_1202939 ) ) ( not ( = ?auto_1202936 ?auto_1202937 ) ) ( not ( = ?auto_1202936 ?auto_1202938 ) ) ( not ( = ?auto_1202936 ?auto_1202939 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1202937 ?auto_1202938 ?auto_1202939 )
      ( MAKE-11CRATE-VERIFY ?auto_1202928 ?auto_1202929 ?auto_1202930 ?auto_1202931 ?auto_1202932 ?auto_1202933 ?auto_1202934 ?auto_1202935 ?auto_1202936 ?auto_1202937 ?auto_1202938 ?auto_1202939 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1203060 - SURFACE
      ?auto_1203061 - SURFACE
      ?auto_1203062 - SURFACE
      ?auto_1203063 - SURFACE
      ?auto_1203064 - SURFACE
      ?auto_1203065 - SURFACE
      ?auto_1203066 - SURFACE
      ?auto_1203067 - SURFACE
      ?auto_1203068 - SURFACE
      ?auto_1203069 - SURFACE
      ?auto_1203070 - SURFACE
      ?auto_1203071 - SURFACE
    )
    :vars
    (
      ?auto_1203072 - HOIST
      ?auto_1203073 - PLACE
      ?auto_1203074 - TRUCK
      ?auto_1203076 - PLACE
      ?auto_1203075 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203072 ?auto_1203073 ) ( SURFACE-AT ?auto_1203070 ?auto_1203073 ) ( CLEAR ?auto_1203070 ) ( IS-CRATE ?auto_1203071 ) ( not ( = ?auto_1203070 ?auto_1203071 ) ) ( AVAILABLE ?auto_1203072 ) ( ON ?auto_1203070 ?auto_1203069 ) ( not ( = ?auto_1203069 ?auto_1203070 ) ) ( not ( = ?auto_1203069 ?auto_1203071 ) ) ( TRUCK-AT ?auto_1203074 ?auto_1203076 ) ( not ( = ?auto_1203076 ?auto_1203073 ) ) ( HOIST-AT ?auto_1203075 ?auto_1203076 ) ( LIFTING ?auto_1203075 ?auto_1203071 ) ( not ( = ?auto_1203072 ?auto_1203075 ) ) ( ON ?auto_1203061 ?auto_1203060 ) ( ON ?auto_1203062 ?auto_1203061 ) ( ON ?auto_1203063 ?auto_1203062 ) ( ON ?auto_1203064 ?auto_1203063 ) ( ON ?auto_1203065 ?auto_1203064 ) ( ON ?auto_1203066 ?auto_1203065 ) ( ON ?auto_1203067 ?auto_1203066 ) ( ON ?auto_1203068 ?auto_1203067 ) ( ON ?auto_1203069 ?auto_1203068 ) ( not ( = ?auto_1203060 ?auto_1203061 ) ) ( not ( = ?auto_1203060 ?auto_1203062 ) ) ( not ( = ?auto_1203060 ?auto_1203063 ) ) ( not ( = ?auto_1203060 ?auto_1203064 ) ) ( not ( = ?auto_1203060 ?auto_1203065 ) ) ( not ( = ?auto_1203060 ?auto_1203066 ) ) ( not ( = ?auto_1203060 ?auto_1203067 ) ) ( not ( = ?auto_1203060 ?auto_1203068 ) ) ( not ( = ?auto_1203060 ?auto_1203069 ) ) ( not ( = ?auto_1203060 ?auto_1203070 ) ) ( not ( = ?auto_1203060 ?auto_1203071 ) ) ( not ( = ?auto_1203061 ?auto_1203062 ) ) ( not ( = ?auto_1203061 ?auto_1203063 ) ) ( not ( = ?auto_1203061 ?auto_1203064 ) ) ( not ( = ?auto_1203061 ?auto_1203065 ) ) ( not ( = ?auto_1203061 ?auto_1203066 ) ) ( not ( = ?auto_1203061 ?auto_1203067 ) ) ( not ( = ?auto_1203061 ?auto_1203068 ) ) ( not ( = ?auto_1203061 ?auto_1203069 ) ) ( not ( = ?auto_1203061 ?auto_1203070 ) ) ( not ( = ?auto_1203061 ?auto_1203071 ) ) ( not ( = ?auto_1203062 ?auto_1203063 ) ) ( not ( = ?auto_1203062 ?auto_1203064 ) ) ( not ( = ?auto_1203062 ?auto_1203065 ) ) ( not ( = ?auto_1203062 ?auto_1203066 ) ) ( not ( = ?auto_1203062 ?auto_1203067 ) ) ( not ( = ?auto_1203062 ?auto_1203068 ) ) ( not ( = ?auto_1203062 ?auto_1203069 ) ) ( not ( = ?auto_1203062 ?auto_1203070 ) ) ( not ( = ?auto_1203062 ?auto_1203071 ) ) ( not ( = ?auto_1203063 ?auto_1203064 ) ) ( not ( = ?auto_1203063 ?auto_1203065 ) ) ( not ( = ?auto_1203063 ?auto_1203066 ) ) ( not ( = ?auto_1203063 ?auto_1203067 ) ) ( not ( = ?auto_1203063 ?auto_1203068 ) ) ( not ( = ?auto_1203063 ?auto_1203069 ) ) ( not ( = ?auto_1203063 ?auto_1203070 ) ) ( not ( = ?auto_1203063 ?auto_1203071 ) ) ( not ( = ?auto_1203064 ?auto_1203065 ) ) ( not ( = ?auto_1203064 ?auto_1203066 ) ) ( not ( = ?auto_1203064 ?auto_1203067 ) ) ( not ( = ?auto_1203064 ?auto_1203068 ) ) ( not ( = ?auto_1203064 ?auto_1203069 ) ) ( not ( = ?auto_1203064 ?auto_1203070 ) ) ( not ( = ?auto_1203064 ?auto_1203071 ) ) ( not ( = ?auto_1203065 ?auto_1203066 ) ) ( not ( = ?auto_1203065 ?auto_1203067 ) ) ( not ( = ?auto_1203065 ?auto_1203068 ) ) ( not ( = ?auto_1203065 ?auto_1203069 ) ) ( not ( = ?auto_1203065 ?auto_1203070 ) ) ( not ( = ?auto_1203065 ?auto_1203071 ) ) ( not ( = ?auto_1203066 ?auto_1203067 ) ) ( not ( = ?auto_1203066 ?auto_1203068 ) ) ( not ( = ?auto_1203066 ?auto_1203069 ) ) ( not ( = ?auto_1203066 ?auto_1203070 ) ) ( not ( = ?auto_1203066 ?auto_1203071 ) ) ( not ( = ?auto_1203067 ?auto_1203068 ) ) ( not ( = ?auto_1203067 ?auto_1203069 ) ) ( not ( = ?auto_1203067 ?auto_1203070 ) ) ( not ( = ?auto_1203067 ?auto_1203071 ) ) ( not ( = ?auto_1203068 ?auto_1203069 ) ) ( not ( = ?auto_1203068 ?auto_1203070 ) ) ( not ( = ?auto_1203068 ?auto_1203071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1203069 ?auto_1203070 ?auto_1203071 )
      ( MAKE-11CRATE-VERIFY ?auto_1203060 ?auto_1203061 ?auto_1203062 ?auto_1203063 ?auto_1203064 ?auto_1203065 ?auto_1203066 ?auto_1203067 ?auto_1203068 ?auto_1203069 ?auto_1203070 ?auto_1203071 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1203203 - SURFACE
      ?auto_1203204 - SURFACE
      ?auto_1203205 - SURFACE
      ?auto_1203206 - SURFACE
      ?auto_1203207 - SURFACE
      ?auto_1203208 - SURFACE
      ?auto_1203209 - SURFACE
      ?auto_1203210 - SURFACE
      ?auto_1203211 - SURFACE
      ?auto_1203212 - SURFACE
      ?auto_1203213 - SURFACE
      ?auto_1203214 - SURFACE
    )
    :vars
    (
      ?auto_1203216 - HOIST
      ?auto_1203217 - PLACE
      ?auto_1203218 - TRUCK
      ?auto_1203220 - PLACE
      ?auto_1203215 - HOIST
      ?auto_1203219 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203216 ?auto_1203217 ) ( SURFACE-AT ?auto_1203213 ?auto_1203217 ) ( CLEAR ?auto_1203213 ) ( IS-CRATE ?auto_1203214 ) ( not ( = ?auto_1203213 ?auto_1203214 ) ) ( AVAILABLE ?auto_1203216 ) ( ON ?auto_1203213 ?auto_1203212 ) ( not ( = ?auto_1203212 ?auto_1203213 ) ) ( not ( = ?auto_1203212 ?auto_1203214 ) ) ( TRUCK-AT ?auto_1203218 ?auto_1203220 ) ( not ( = ?auto_1203220 ?auto_1203217 ) ) ( HOIST-AT ?auto_1203215 ?auto_1203220 ) ( not ( = ?auto_1203216 ?auto_1203215 ) ) ( AVAILABLE ?auto_1203215 ) ( SURFACE-AT ?auto_1203214 ?auto_1203220 ) ( ON ?auto_1203214 ?auto_1203219 ) ( CLEAR ?auto_1203214 ) ( not ( = ?auto_1203213 ?auto_1203219 ) ) ( not ( = ?auto_1203214 ?auto_1203219 ) ) ( not ( = ?auto_1203212 ?auto_1203219 ) ) ( ON ?auto_1203204 ?auto_1203203 ) ( ON ?auto_1203205 ?auto_1203204 ) ( ON ?auto_1203206 ?auto_1203205 ) ( ON ?auto_1203207 ?auto_1203206 ) ( ON ?auto_1203208 ?auto_1203207 ) ( ON ?auto_1203209 ?auto_1203208 ) ( ON ?auto_1203210 ?auto_1203209 ) ( ON ?auto_1203211 ?auto_1203210 ) ( ON ?auto_1203212 ?auto_1203211 ) ( not ( = ?auto_1203203 ?auto_1203204 ) ) ( not ( = ?auto_1203203 ?auto_1203205 ) ) ( not ( = ?auto_1203203 ?auto_1203206 ) ) ( not ( = ?auto_1203203 ?auto_1203207 ) ) ( not ( = ?auto_1203203 ?auto_1203208 ) ) ( not ( = ?auto_1203203 ?auto_1203209 ) ) ( not ( = ?auto_1203203 ?auto_1203210 ) ) ( not ( = ?auto_1203203 ?auto_1203211 ) ) ( not ( = ?auto_1203203 ?auto_1203212 ) ) ( not ( = ?auto_1203203 ?auto_1203213 ) ) ( not ( = ?auto_1203203 ?auto_1203214 ) ) ( not ( = ?auto_1203203 ?auto_1203219 ) ) ( not ( = ?auto_1203204 ?auto_1203205 ) ) ( not ( = ?auto_1203204 ?auto_1203206 ) ) ( not ( = ?auto_1203204 ?auto_1203207 ) ) ( not ( = ?auto_1203204 ?auto_1203208 ) ) ( not ( = ?auto_1203204 ?auto_1203209 ) ) ( not ( = ?auto_1203204 ?auto_1203210 ) ) ( not ( = ?auto_1203204 ?auto_1203211 ) ) ( not ( = ?auto_1203204 ?auto_1203212 ) ) ( not ( = ?auto_1203204 ?auto_1203213 ) ) ( not ( = ?auto_1203204 ?auto_1203214 ) ) ( not ( = ?auto_1203204 ?auto_1203219 ) ) ( not ( = ?auto_1203205 ?auto_1203206 ) ) ( not ( = ?auto_1203205 ?auto_1203207 ) ) ( not ( = ?auto_1203205 ?auto_1203208 ) ) ( not ( = ?auto_1203205 ?auto_1203209 ) ) ( not ( = ?auto_1203205 ?auto_1203210 ) ) ( not ( = ?auto_1203205 ?auto_1203211 ) ) ( not ( = ?auto_1203205 ?auto_1203212 ) ) ( not ( = ?auto_1203205 ?auto_1203213 ) ) ( not ( = ?auto_1203205 ?auto_1203214 ) ) ( not ( = ?auto_1203205 ?auto_1203219 ) ) ( not ( = ?auto_1203206 ?auto_1203207 ) ) ( not ( = ?auto_1203206 ?auto_1203208 ) ) ( not ( = ?auto_1203206 ?auto_1203209 ) ) ( not ( = ?auto_1203206 ?auto_1203210 ) ) ( not ( = ?auto_1203206 ?auto_1203211 ) ) ( not ( = ?auto_1203206 ?auto_1203212 ) ) ( not ( = ?auto_1203206 ?auto_1203213 ) ) ( not ( = ?auto_1203206 ?auto_1203214 ) ) ( not ( = ?auto_1203206 ?auto_1203219 ) ) ( not ( = ?auto_1203207 ?auto_1203208 ) ) ( not ( = ?auto_1203207 ?auto_1203209 ) ) ( not ( = ?auto_1203207 ?auto_1203210 ) ) ( not ( = ?auto_1203207 ?auto_1203211 ) ) ( not ( = ?auto_1203207 ?auto_1203212 ) ) ( not ( = ?auto_1203207 ?auto_1203213 ) ) ( not ( = ?auto_1203207 ?auto_1203214 ) ) ( not ( = ?auto_1203207 ?auto_1203219 ) ) ( not ( = ?auto_1203208 ?auto_1203209 ) ) ( not ( = ?auto_1203208 ?auto_1203210 ) ) ( not ( = ?auto_1203208 ?auto_1203211 ) ) ( not ( = ?auto_1203208 ?auto_1203212 ) ) ( not ( = ?auto_1203208 ?auto_1203213 ) ) ( not ( = ?auto_1203208 ?auto_1203214 ) ) ( not ( = ?auto_1203208 ?auto_1203219 ) ) ( not ( = ?auto_1203209 ?auto_1203210 ) ) ( not ( = ?auto_1203209 ?auto_1203211 ) ) ( not ( = ?auto_1203209 ?auto_1203212 ) ) ( not ( = ?auto_1203209 ?auto_1203213 ) ) ( not ( = ?auto_1203209 ?auto_1203214 ) ) ( not ( = ?auto_1203209 ?auto_1203219 ) ) ( not ( = ?auto_1203210 ?auto_1203211 ) ) ( not ( = ?auto_1203210 ?auto_1203212 ) ) ( not ( = ?auto_1203210 ?auto_1203213 ) ) ( not ( = ?auto_1203210 ?auto_1203214 ) ) ( not ( = ?auto_1203210 ?auto_1203219 ) ) ( not ( = ?auto_1203211 ?auto_1203212 ) ) ( not ( = ?auto_1203211 ?auto_1203213 ) ) ( not ( = ?auto_1203211 ?auto_1203214 ) ) ( not ( = ?auto_1203211 ?auto_1203219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1203212 ?auto_1203213 ?auto_1203214 )
      ( MAKE-11CRATE-VERIFY ?auto_1203203 ?auto_1203204 ?auto_1203205 ?auto_1203206 ?auto_1203207 ?auto_1203208 ?auto_1203209 ?auto_1203210 ?auto_1203211 ?auto_1203212 ?auto_1203213 ?auto_1203214 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1203347 - SURFACE
      ?auto_1203348 - SURFACE
      ?auto_1203349 - SURFACE
      ?auto_1203350 - SURFACE
      ?auto_1203351 - SURFACE
      ?auto_1203352 - SURFACE
      ?auto_1203353 - SURFACE
      ?auto_1203354 - SURFACE
      ?auto_1203355 - SURFACE
      ?auto_1203356 - SURFACE
      ?auto_1203357 - SURFACE
      ?auto_1203358 - SURFACE
    )
    :vars
    (
      ?auto_1203360 - HOIST
      ?auto_1203364 - PLACE
      ?auto_1203359 - PLACE
      ?auto_1203362 - HOIST
      ?auto_1203363 - SURFACE
      ?auto_1203361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203360 ?auto_1203364 ) ( SURFACE-AT ?auto_1203357 ?auto_1203364 ) ( CLEAR ?auto_1203357 ) ( IS-CRATE ?auto_1203358 ) ( not ( = ?auto_1203357 ?auto_1203358 ) ) ( AVAILABLE ?auto_1203360 ) ( ON ?auto_1203357 ?auto_1203356 ) ( not ( = ?auto_1203356 ?auto_1203357 ) ) ( not ( = ?auto_1203356 ?auto_1203358 ) ) ( not ( = ?auto_1203359 ?auto_1203364 ) ) ( HOIST-AT ?auto_1203362 ?auto_1203359 ) ( not ( = ?auto_1203360 ?auto_1203362 ) ) ( AVAILABLE ?auto_1203362 ) ( SURFACE-AT ?auto_1203358 ?auto_1203359 ) ( ON ?auto_1203358 ?auto_1203363 ) ( CLEAR ?auto_1203358 ) ( not ( = ?auto_1203357 ?auto_1203363 ) ) ( not ( = ?auto_1203358 ?auto_1203363 ) ) ( not ( = ?auto_1203356 ?auto_1203363 ) ) ( TRUCK-AT ?auto_1203361 ?auto_1203364 ) ( ON ?auto_1203348 ?auto_1203347 ) ( ON ?auto_1203349 ?auto_1203348 ) ( ON ?auto_1203350 ?auto_1203349 ) ( ON ?auto_1203351 ?auto_1203350 ) ( ON ?auto_1203352 ?auto_1203351 ) ( ON ?auto_1203353 ?auto_1203352 ) ( ON ?auto_1203354 ?auto_1203353 ) ( ON ?auto_1203355 ?auto_1203354 ) ( ON ?auto_1203356 ?auto_1203355 ) ( not ( = ?auto_1203347 ?auto_1203348 ) ) ( not ( = ?auto_1203347 ?auto_1203349 ) ) ( not ( = ?auto_1203347 ?auto_1203350 ) ) ( not ( = ?auto_1203347 ?auto_1203351 ) ) ( not ( = ?auto_1203347 ?auto_1203352 ) ) ( not ( = ?auto_1203347 ?auto_1203353 ) ) ( not ( = ?auto_1203347 ?auto_1203354 ) ) ( not ( = ?auto_1203347 ?auto_1203355 ) ) ( not ( = ?auto_1203347 ?auto_1203356 ) ) ( not ( = ?auto_1203347 ?auto_1203357 ) ) ( not ( = ?auto_1203347 ?auto_1203358 ) ) ( not ( = ?auto_1203347 ?auto_1203363 ) ) ( not ( = ?auto_1203348 ?auto_1203349 ) ) ( not ( = ?auto_1203348 ?auto_1203350 ) ) ( not ( = ?auto_1203348 ?auto_1203351 ) ) ( not ( = ?auto_1203348 ?auto_1203352 ) ) ( not ( = ?auto_1203348 ?auto_1203353 ) ) ( not ( = ?auto_1203348 ?auto_1203354 ) ) ( not ( = ?auto_1203348 ?auto_1203355 ) ) ( not ( = ?auto_1203348 ?auto_1203356 ) ) ( not ( = ?auto_1203348 ?auto_1203357 ) ) ( not ( = ?auto_1203348 ?auto_1203358 ) ) ( not ( = ?auto_1203348 ?auto_1203363 ) ) ( not ( = ?auto_1203349 ?auto_1203350 ) ) ( not ( = ?auto_1203349 ?auto_1203351 ) ) ( not ( = ?auto_1203349 ?auto_1203352 ) ) ( not ( = ?auto_1203349 ?auto_1203353 ) ) ( not ( = ?auto_1203349 ?auto_1203354 ) ) ( not ( = ?auto_1203349 ?auto_1203355 ) ) ( not ( = ?auto_1203349 ?auto_1203356 ) ) ( not ( = ?auto_1203349 ?auto_1203357 ) ) ( not ( = ?auto_1203349 ?auto_1203358 ) ) ( not ( = ?auto_1203349 ?auto_1203363 ) ) ( not ( = ?auto_1203350 ?auto_1203351 ) ) ( not ( = ?auto_1203350 ?auto_1203352 ) ) ( not ( = ?auto_1203350 ?auto_1203353 ) ) ( not ( = ?auto_1203350 ?auto_1203354 ) ) ( not ( = ?auto_1203350 ?auto_1203355 ) ) ( not ( = ?auto_1203350 ?auto_1203356 ) ) ( not ( = ?auto_1203350 ?auto_1203357 ) ) ( not ( = ?auto_1203350 ?auto_1203358 ) ) ( not ( = ?auto_1203350 ?auto_1203363 ) ) ( not ( = ?auto_1203351 ?auto_1203352 ) ) ( not ( = ?auto_1203351 ?auto_1203353 ) ) ( not ( = ?auto_1203351 ?auto_1203354 ) ) ( not ( = ?auto_1203351 ?auto_1203355 ) ) ( not ( = ?auto_1203351 ?auto_1203356 ) ) ( not ( = ?auto_1203351 ?auto_1203357 ) ) ( not ( = ?auto_1203351 ?auto_1203358 ) ) ( not ( = ?auto_1203351 ?auto_1203363 ) ) ( not ( = ?auto_1203352 ?auto_1203353 ) ) ( not ( = ?auto_1203352 ?auto_1203354 ) ) ( not ( = ?auto_1203352 ?auto_1203355 ) ) ( not ( = ?auto_1203352 ?auto_1203356 ) ) ( not ( = ?auto_1203352 ?auto_1203357 ) ) ( not ( = ?auto_1203352 ?auto_1203358 ) ) ( not ( = ?auto_1203352 ?auto_1203363 ) ) ( not ( = ?auto_1203353 ?auto_1203354 ) ) ( not ( = ?auto_1203353 ?auto_1203355 ) ) ( not ( = ?auto_1203353 ?auto_1203356 ) ) ( not ( = ?auto_1203353 ?auto_1203357 ) ) ( not ( = ?auto_1203353 ?auto_1203358 ) ) ( not ( = ?auto_1203353 ?auto_1203363 ) ) ( not ( = ?auto_1203354 ?auto_1203355 ) ) ( not ( = ?auto_1203354 ?auto_1203356 ) ) ( not ( = ?auto_1203354 ?auto_1203357 ) ) ( not ( = ?auto_1203354 ?auto_1203358 ) ) ( not ( = ?auto_1203354 ?auto_1203363 ) ) ( not ( = ?auto_1203355 ?auto_1203356 ) ) ( not ( = ?auto_1203355 ?auto_1203357 ) ) ( not ( = ?auto_1203355 ?auto_1203358 ) ) ( not ( = ?auto_1203355 ?auto_1203363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1203356 ?auto_1203357 ?auto_1203358 )
      ( MAKE-11CRATE-VERIFY ?auto_1203347 ?auto_1203348 ?auto_1203349 ?auto_1203350 ?auto_1203351 ?auto_1203352 ?auto_1203353 ?auto_1203354 ?auto_1203355 ?auto_1203356 ?auto_1203357 ?auto_1203358 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1203491 - SURFACE
      ?auto_1203492 - SURFACE
      ?auto_1203493 - SURFACE
      ?auto_1203494 - SURFACE
      ?auto_1203495 - SURFACE
      ?auto_1203496 - SURFACE
      ?auto_1203497 - SURFACE
      ?auto_1203498 - SURFACE
      ?auto_1203499 - SURFACE
      ?auto_1203500 - SURFACE
      ?auto_1203501 - SURFACE
      ?auto_1203502 - SURFACE
    )
    :vars
    (
      ?auto_1203507 - HOIST
      ?auto_1203504 - PLACE
      ?auto_1203505 - PLACE
      ?auto_1203503 - HOIST
      ?auto_1203508 - SURFACE
      ?auto_1203506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203507 ?auto_1203504 ) ( IS-CRATE ?auto_1203502 ) ( not ( = ?auto_1203501 ?auto_1203502 ) ) ( not ( = ?auto_1203500 ?auto_1203501 ) ) ( not ( = ?auto_1203500 ?auto_1203502 ) ) ( not ( = ?auto_1203505 ?auto_1203504 ) ) ( HOIST-AT ?auto_1203503 ?auto_1203505 ) ( not ( = ?auto_1203507 ?auto_1203503 ) ) ( AVAILABLE ?auto_1203503 ) ( SURFACE-AT ?auto_1203502 ?auto_1203505 ) ( ON ?auto_1203502 ?auto_1203508 ) ( CLEAR ?auto_1203502 ) ( not ( = ?auto_1203501 ?auto_1203508 ) ) ( not ( = ?auto_1203502 ?auto_1203508 ) ) ( not ( = ?auto_1203500 ?auto_1203508 ) ) ( TRUCK-AT ?auto_1203506 ?auto_1203504 ) ( SURFACE-AT ?auto_1203500 ?auto_1203504 ) ( CLEAR ?auto_1203500 ) ( LIFTING ?auto_1203507 ?auto_1203501 ) ( IS-CRATE ?auto_1203501 ) ( ON ?auto_1203492 ?auto_1203491 ) ( ON ?auto_1203493 ?auto_1203492 ) ( ON ?auto_1203494 ?auto_1203493 ) ( ON ?auto_1203495 ?auto_1203494 ) ( ON ?auto_1203496 ?auto_1203495 ) ( ON ?auto_1203497 ?auto_1203496 ) ( ON ?auto_1203498 ?auto_1203497 ) ( ON ?auto_1203499 ?auto_1203498 ) ( ON ?auto_1203500 ?auto_1203499 ) ( not ( = ?auto_1203491 ?auto_1203492 ) ) ( not ( = ?auto_1203491 ?auto_1203493 ) ) ( not ( = ?auto_1203491 ?auto_1203494 ) ) ( not ( = ?auto_1203491 ?auto_1203495 ) ) ( not ( = ?auto_1203491 ?auto_1203496 ) ) ( not ( = ?auto_1203491 ?auto_1203497 ) ) ( not ( = ?auto_1203491 ?auto_1203498 ) ) ( not ( = ?auto_1203491 ?auto_1203499 ) ) ( not ( = ?auto_1203491 ?auto_1203500 ) ) ( not ( = ?auto_1203491 ?auto_1203501 ) ) ( not ( = ?auto_1203491 ?auto_1203502 ) ) ( not ( = ?auto_1203491 ?auto_1203508 ) ) ( not ( = ?auto_1203492 ?auto_1203493 ) ) ( not ( = ?auto_1203492 ?auto_1203494 ) ) ( not ( = ?auto_1203492 ?auto_1203495 ) ) ( not ( = ?auto_1203492 ?auto_1203496 ) ) ( not ( = ?auto_1203492 ?auto_1203497 ) ) ( not ( = ?auto_1203492 ?auto_1203498 ) ) ( not ( = ?auto_1203492 ?auto_1203499 ) ) ( not ( = ?auto_1203492 ?auto_1203500 ) ) ( not ( = ?auto_1203492 ?auto_1203501 ) ) ( not ( = ?auto_1203492 ?auto_1203502 ) ) ( not ( = ?auto_1203492 ?auto_1203508 ) ) ( not ( = ?auto_1203493 ?auto_1203494 ) ) ( not ( = ?auto_1203493 ?auto_1203495 ) ) ( not ( = ?auto_1203493 ?auto_1203496 ) ) ( not ( = ?auto_1203493 ?auto_1203497 ) ) ( not ( = ?auto_1203493 ?auto_1203498 ) ) ( not ( = ?auto_1203493 ?auto_1203499 ) ) ( not ( = ?auto_1203493 ?auto_1203500 ) ) ( not ( = ?auto_1203493 ?auto_1203501 ) ) ( not ( = ?auto_1203493 ?auto_1203502 ) ) ( not ( = ?auto_1203493 ?auto_1203508 ) ) ( not ( = ?auto_1203494 ?auto_1203495 ) ) ( not ( = ?auto_1203494 ?auto_1203496 ) ) ( not ( = ?auto_1203494 ?auto_1203497 ) ) ( not ( = ?auto_1203494 ?auto_1203498 ) ) ( not ( = ?auto_1203494 ?auto_1203499 ) ) ( not ( = ?auto_1203494 ?auto_1203500 ) ) ( not ( = ?auto_1203494 ?auto_1203501 ) ) ( not ( = ?auto_1203494 ?auto_1203502 ) ) ( not ( = ?auto_1203494 ?auto_1203508 ) ) ( not ( = ?auto_1203495 ?auto_1203496 ) ) ( not ( = ?auto_1203495 ?auto_1203497 ) ) ( not ( = ?auto_1203495 ?auto_1203498 ) ) ( not ( = ?auto_1203495 ?auto_1203499 ) ) ( not ( = ?auto_1203495 ?auto_1203500 ) ) ( not ( = ?auto_1203495 ?auto_1203501 ) ) ( not ( = ?auto_1203495 ?auto_1203502 ) ) ( not ( = ?auto_1203495 ?auto_1203508 ) ) ( not ( = ?auto_1203496 ?auto_1203497 ) ) ( not ( = ?auto_1203496 ?auto_1203498 ) ) ( not ( = ?auto_1203496 ?auto_1203499 ) ) ( not ( = ?auto_1203496 ?auto_1203500 ) ) ( not ( = ?auto_1203496 ?auto_1203501 ) ) ( not ( = ?auto_1203496 ?auto_1203502 ) ) ( not ( = ?auto_1203496 ?auto_1203508 ) ) ( not ( = ?auto_1203497 ?auto_1203498 ) ) ( not ( = ?auto_1203497 ?auto_1203499 ) ) ( not ( = ?auto_1203497 ?auto_1203500 ) ) ( not ( = ?auto_1203497 ?auto_1203501 ) ) ( not ( = ?auto_1203497 ?auto_1203502 ) ) ( not ( = ?auto_1203497 ?auto_1203508 ) ) ( not ( = ?auto_1203498 ?auto_1203499 ) ) ( not ( = ?auto_1203498 ?auto_1203500 ) ) ( not ( = ?auto_1203498 ?auto_1203501 ) ) ( not ( = ?auto_1203498 ?auto_1203502 ) ) ( not ( = ?auto_1203498 ?auto_1203508 ) ) ( not ( = ?auto_1203499 ?auto_1203500 ) ) ( not ( = ?auto_1203499 ?auto_1203501 ) ) ( not ( = ?auto_1203499 ?auto_1203502 ) ) ( not ( = ?auto_1203499 ?auto_1203508 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1203500 ?auto_1203501 ?auto_1203502 )
      ( MAKE-11CRATE-VERIFY ?auto_1203491 ?auto_1203492 ?auto_1203493 ?auto_1203494 ?auto_1203495 ?auto_1203496 ?auto_1203497 ?auto_1203498 ?auto_1203499 ?auto_1203500 ?auto_1203501 ?auto_1203502 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1203635 - SURFACE
      ?auto_1203636 - SURFACE
      ?auto_1203637 - SURFACE
      ?auto_1203638 - SURFACE
      ?auto_1203639 - SURFACE
      ?auto_1203640 - SURFACE
      ?auto_1203641 - SURFACE
      ?auto_1203642 - SURFACE
      ?auto_1203643 - SURFACE
      ?auto_1203644 - SURFACE
      ?auto_1203645 - SURFACE
      ?auto_1203646 - SURFACE
    )
    :vars
    (
      ?auto_1203650 - HOIST
      ?auto_1203652 - PLACE
      ?auto_1203649 - PLACE
      ?auto_1203651 - HOIST
      ?auto_1203648 - SURFACE
      ?auto_1203647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203650 ?auto_1203652 ) ( IS-CRATE ?auto_1203646 ) ( not ( = ?auto_1203645 ?auto_1203646 ) ) ( not ( = ?auto_1203644 ?auto_1203645 ) ) ( not ( = ?auto_1203644 ?auto_1203646 ) ) ( not ( = ?auto_1203649 ?auto_1203652 ) ) ( HOIST-AT ?auto_1203651 ?auto_1203649 ) ( not ( = ?auto_1203650 ?auto_1203651 ) ) ( AVAILABLE ?auto_1203651 ) ( SURFACE-AT ?auto_1203646 ?auto_1203649 ) ( ON ?auto_1203646 ?auto_1203648 ) ( CLEAR ?auto_1203646 ) ( not ( = ?auto_1203645 ?auto_1203648 ) ) ( not ( = ?auto_1203646 ?auto_1203648 ) ) ( not ( = ?auto_1203644 ?auto_1203648 ) ) ( TRUCK-AT ?auto_1203647 ?auto_1203652 ) ( SURFACE-AT ?auto_1203644 ?auto_1203652 ) ( CLEAR ?auto_1203644 ) ( IS-CRATE ?auto_1203645 ) ( AVAILABLE ?auto_1203650 ) ( IN ?auto_1203645 ?auto_1203647 ) ( ON ?auto_1203636 ?auto_1203635 ) ( ON ?auto_1203637 ?auto_1203636 ) ( ON ?auto_1203638 ?auto_1203637 ) ( ON ?auto_1203639 ?auto_1203638 ) ( ON ?auto_1203640 ?auto_1203639 ) ( ON ?auto_1203641 ?auto_1203640 ) ( ON ?auto_1203642 ?auto_1203641 ) ( ON ?auto_1203643 ?auto_1203642 ) ( ON ?auto_1203644 ?auto_1203643 ) ( not ( = ?auto_1203635 ?auto_1203636 ) ) ( not ( = ?auto_1203635 ?auto_1203637 ) ) ( not ( = ?auto_1203635 ?auto_1203638 ) ) ( not ( = ?auto_1203635 ?auto_1203639 ) ) ( not ( = ?auto_1203635 ?auto_1203640 ) ) ( not ( = ?auto_1203635 ?auto_1203641 ) ) ( not ( = ?auto_1203635 ?auto_1203642 ) ) ( not ( = ?auto_1203635 ?auto_1203643 ) ) ( not ( = ?auto_1203635 ?auto_1203644 ) ) ( not ( = ?auto_1203635 ?auto_1203645 ) ) ( not ( = ?auto_1203635 ?auto_1203646 ) ) ( not ( = ?auto_1203635 ?auto_1203648 ) ) ( not ( = ?auto_1203636 ?auto_1203637 ) ) ( not ( = ?auto_1203636 ?auto_1203638 ) ) ( not ( = ?auto_1203636 ?auto_1203639 ) ) ( not ( = ?auto_1203636 ?auto_1203640 ) ) ( not ( = ?auto_1203636 ?auto_1203641 ) ) ( not ( = ?auto_1203636 ?auto_1203642 ) ) ( not ( = ?auto_1203636 ?auto_1203643 ) ) ( not ( = ?auto_1203636 ?auto_1203644 ) ) ( not ( = ?auto_1203636 ?auto_1203645 ) ) ( not ( = ?auto_1203636 ?auto_1203646 ) ) ( not ( = ?auto_1203636 ?auto_1203648 ) ) ( not ( = ?auto_1203637 ?auto_1203638 ) ) ( not ( = ?auto_1203637 ?auto_1203639 ) ) ( not ( = ?auto_1203637 ?auto_1203640 ) ) ( not ( = ?auto_1203637 ?auto_1203641 ) ) ( not ( = ?auto_1203637 ?auto_1203642 ) ) ( not ( = ?auto_1203637 ?auto_1203643 ) ) ( not ( = ?auto_1203637 ?auto_1203644 ) ) ( not ( = ?auto_1203637 ?auto_1203645 ) ) ( not ( = ?auto_1203637 ?auto_1203646 ) ) ( not ( = ?auto_1203637 ?auto_1203648 ) ) ( not ( = ?auto_1203638 ?auto_1203639 ) ) ( not ( = ?auto_1203638 ?auto_1203640 ) ) ( not ( = ?auto_1203638 ?auto_1203641 ) ) ( not ( = ?auto_1203638 ?auto_1203642 ) ) ( not ( = ?auto_1203638 ?auto_1203643 ) ) ( not ( = ?auto_1203638 ?auto_1203644 ) ) ( not ( = ?auto_1203638 ?auto_1203645 ) ) ( not ( = ?auto_1203638 ?auto_1203646 ) ) ( not ( = ?auto_1203638 ?auto_1203648 ) ) ( not ( = ?auto_1203639 ?auto_1203640 ) ) ( not ( = ?auto_1203639 ?auto_1203641 ) ) ( not ( = ?auto_1203639 ?auto_1203642 ) ) ( not ( = ?auto_1203639 ?auto_1203643 ) ) ( not ( = ?auto_1203639 ?auto_1203644 ) ) ( not ( = ?auto_1203639 ?auto_1203645 ) ) ( not ( = ?auto_1203639 ?auto_1203646 ) ) ( not ( = ?auto_1203639 ?auto_1203648 ) ) ( not ( = ?auto_1203640 ?auto_1203641 ) ) ( not ( = ?auto_1203640 ?auto_1203642 ) ) ( not ( = ?auto_1203640 ?auto_1203643 ) ) ( not ( = ?auto_1203640 ?auto_1203644 ) ) ( not ( = ?auto_1203640 ?auto_1203645 ) ) ( not ( = ?auto_1203640 ?auto_1203646 ) ) ( not ( = ?auto_1203640 ?auto_1203648 ) ) ( not ( = ?auto_1203641 ?auto_1203642 ) ) ( not ( = ?auto_1203641 ?auto_1203643 ) ) ( not ( = ?auto_1203641 ?auto_1203644 ) ) ( not ( = ?auto_1203641 ?auto_1203645 ) ) ( not ( = ?auto_1203641 ?auto_1203646 ) ) ( not ( = ?auto_1203641 ?auto_1203648 ) ) ( not ( = ?auto_1203642 ?auto_1203643 ) ) ( not ( = ?auto_1203642 ?auto_1203644 ) ) ( not ( = ?auto_1203642 ?auto_1203645 ) ) ( not ( = ?auto_1203642 ?auto_1203646 ) ) ( not ( = ?auto_1203642 ?auto_1203648 ) ) ( not ( = ?auto_1203643 ?auto_1203644 ) ) ( not ( = ?auto_1203643 ?auto_1203645 ) ) ( not ( = ?auto_1203643 ?auto_1203646 ) ) ( not ( = ?auto_1203643 ?auto_1203648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1203644 ?auto_1203645 ?auto_1203646 )
      ( MAKE-11CRATE-VERIFY ?auto_1203635 ?auto_1203636 ?auto_1203637 ?auto_1203638 ?auto_1203639 ?auto_1203640 ?auto_1203641 ?auto_1203642 ?auto_1203643 ?auto_1203644 ?auto_1203645 ?auto_1203646 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1212926 - SURFACE
      ?auto_1212927 - SURFACE
      ?auto_1212928 - SURFACE
      ?auto_1212929 - SURFACE
      ?auto_1212930 - SURFACE
      ?auto_1212931 - SURFACE
      ?auto_1212932 - SURFACE
      ?auto_1212933 - SURFACE
      ?auto_1212934 - SURFACE
      ?auto_1212935 - SURFACE
      ?auto_1212936 - SURFACE
      ?auto_1212937 - SURFACE
      ?auto_1212938 - SURFACE
    )
    :vars
    (
      ?auto_1212939 - HOIST
      ?auto_1212940 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1212939 ?auto_1212940 ) ( SURFACE-AT ?auto_1212937 ?auto_1212940 ) ( CLEAR ?auto_1212937 ) ( LIFTING ?auto_1212939 ?auto_1212938 ) ( IS-CRATE ?auto_1212938 ) ( not ( = ?auto_1212937 ?auto_1212938 ) ) ( ON ?auto_1212927 ?auto_1212926 ) ( ON ?auto_1212928 ?auto_1212927 ) ( ON ?auto_1212929 ?auto_1212928 ) ( ON ?auto_1212930 ?auto_1212929 ) ( ON ?auto_1212931 ?auto_1212930 ) ( ON ?auto_1212932 ?auto_1212931 ) ( ON ?auto_1212933 ?auto_1212932 ) ( ON ?auto_1212934 ?auto_1212933 ) ( ON ?auto_1212935 ?auto_1212934 ) ( ON ?auto_1212936 ?auto_1212935 ) ( ON ?auto_1212937 ?auto_1212936 ) ( not ( = ?auto_1212926 ?auto_1212927 ) ) ( not ( = ?auto_1212926 ?auto_1212928 ) ) ( not ( = ?auto_1212926 ?auto_1212929 ) ) ( not ( = ?auto_1212926 ?auto_1212930 ) ) ( not ( = ?auto_1212926 ?auto_1212931 ) ) ( not ( = ?auto_1212926 ?auto_1212932 ) ) ( not ( = ?auto_1212926 ?auto_1212933 ) ) ( not ( = ?auto_1212926 ?auto_1212934 ) ) ( not ( = ?auto_1212926 ?auto_1212935 ) ) ( not ( = ?auto_1212926 ?auto_1212936 ) ) ( not ( = ?auto_1212926 ?auto_1212937 ) ) ( not ( = ?auto_1212926 ?auto_1212938 ) ) ( not ( = ?auto_1212927 ?auto_1212928 ) ) ( not ( = ?auto_1212927 ?auto_1212929 ) ) ( not ( = ?auto_1212927 ?auto_1212930 ) ) ( not ( = ?auto_1212927 ?auto_1212931 ) ) ( not ( = ?auto_1212927 ?auto_1212932 ) ) ( not ( = ?auto_1212927 ?auto_1212933 ) ) ( not ( = ?auto_1212927 ?auto_1212934 ) ) ( not ( = ?auto_1212927 ?auto_1212935 ) ) ( not ( = ?auto_1212927 ?auto_1212936 ) ) ( not ( = ?auto_1212927 ?auto_1212937 ) ) ( not ( = ?auto_1212927 ?auto_1212938 ) ) ( not ( = ?auto_1212928 ?auto_1212929 ) ) ( not ( = ?auto_1212928 ?auto_1212930 ) ) ( not ( = ?auto_1212928 ?auto_1212931 ) ) ( not ( = ?auto_1212928 ?auto_1212932 ) ) ( not ( = ?auto_1212928 ?auto_1212933 ) ) ( not ( = ?auto_1212928 ?auto_1212934 ) ) ( not ( = ?auto_1212928 ?auto_1212935 ) ) ( not ( = ?auto_1212928 ?auto_1212936 ) ) ( not ( = ?auto_1212928 ?auto_1212937 ) ) ( not ( = ?auto_1212928 ?auto_1212938 ) ) ( not ( = ?auto_1212929 ?auto_1212930 ) ) ( not ( = ?auto_1212929 ?auto_1212931 ) ) ( not ( = ?auto_1212929 ?auto_1212932 ) ) ( not ( = ?auto_1212929 ?auto_1212933 ) ) ( not ( = ?auto_1212929 ?auto_1212934 ) ) ( not ( = ?auto_1212929 ?auto_1212935 ) ) ( not ( = ?auto_1212929 ?auto_1212936 ) ) ( not ( = ?auto_1212929 ?auto_1212937 ) ) ( not ( = ?auto_1212929 ?auto_1212938 ) ) ( not ( = ?auto_1212930 ?auto_1212931 ) ) ( not ( = ?auto_1212930 ?auto_1212932 ) ) ( not ( = ?auto_1212930 ?auto_1212933 ) ) ( not ( = ?auto_1212930 ?auto_1212934 ) ) ( not ( = ?auto_1212930 ?auto_1212935 ) ) ( not ( = ?auto_1212930 ?auto_1212936 ) ) ( not ( = ?auto_1212930 ?auto_1212937 ) ) ( not ( = ?auto_1212930 ?auto_1212938 ) ) ( not ( = ?auto_1212931 ?auto_1212932 ) ) ( not ( = ?auto_1212931 ?auto_1212933 ) ) ( not ( = ?auto_1212931 ?auto_1212934 ) ) ( not ( = ?auto_1212931 ?auto_1212935 ) ) ( not ( = ?auto_1212931 ?auto_1212936 ) ) ( not ( = ?auto_1212931 ?auto_1212937 ) ) ( not ( = ?auto_1212931 ?auto_1212938 ) ) ( not ( = ?auto_1212932 ?auto_1212933 ) ) ( not ( = ?auto_1212932 ?auto_1212934 ) ) ( not ( = ?auto_1212932 ?auto_1212935 ) ) ( not ( = ?auto_1212932 ?auto_1212936 ) ) ( not ( = ?auto_1212932 ?auto_1212937 ) ) ( not ( = ?auto_1212932 ?auto_1212938 ) ) ( not ( = ?auto_1212933 ?auto_1212934 ) ) ( not ( = ?auto_1212933 ?auto_1212935 ) ) ( not ( = ?auto_1212933 ?auto_1212936 ) ) ( not ( = ?auto_1212933 ?auto_1212937 ) ) ( not ( = ?auto_1212933 ?auto_1212938 ) ) ( not ( = ?auto_1212934 ?auto_1212935 ) ) ( not ( = ?auto_1212934 ?auto_1212936 ) ) ( not ( = ?auto_1212934 ?auto_1212937 ) ) ( not ( = ?auto_1212934 ?auto_1212938 ) ) ( not ( = ?auto_1212935 ?auto_1212936 ) ) ( not ( = ?auto_1212935 ?auto_1212937 ) ) ( not ( = ?auto_1212935 ?auto_1212938 ) ) ( not ( = ?auto_1212936 ?auto_1212937 ) ) ( not ( = ?auto_1212936 ?auto_1212938 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1212937 ?auto_1212938 )
      ( MAKE-12CRATE-VERIFY ?auto_1212926 ?auto_1212927 ?auto_1212928 ?auto_1212929 ?auto_1212930 ?auto_1212931 ?auto_1212932 ?auto_1212933 ?auto_1212934 ?auto_1212935 ?auto_1212936 ?auto_1212937 ?auto_1212938 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213051 - SURFACE
      ?auto_1213052 - SURFACE
      ?auto_1213053 - SURFACE
      ?auto_1213054 - SURFACE
      ?auto_1213055 - SURFACE
      ?auto_1213056 - SURFACE
      ?auto_1213057 - SURFACE
      ?auto_1213058 - SURFACE
      ?auto_1213059 - SURFACE
      ?auto_1213060 - SURFACE
      ?auto_1213061 - SURFACE
      ?auto_1213062 - SURFACE
      ?auto_1213063 - SURFACE
    )
    :vars
    (
      ?auto_1213066 - HOIST
      ?auto_1213065 - PLACE
      ?auto_1213064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213066 ?auto_1213065 ) ( SURFACE-AT ?auto_1213062 ?auto_1213065 ) ( CLEAR ?auto_1213062 ) ( IS-CRATE ?auto_1213063 ) ( not ( = ?auto_1213062 ?auto_1213063 ) ) ( TRUCK-AT ?auto_1213064 ?auto_1213065 ) ( AVAILABLE ?auto_1213066 ) ( IN ?auto_1213063 ?auto_1213064 ) ( ON ?auto_1213062 ?auto_1213061 ) ( not ( = ?auto_1213061 ?auto_1213062 ) ) ( not ( = ?auto_1213061 ?auto_1213063 ) ) ( ON ?auto_1213052 ?auto_1213051 ) ( ON ?auto_1213053 ?auto_1213052 ) ( ON ?auto_1213054 ?auto_1213053 ) ( ON ?auto_1213055 ?auto_1213054 ) ( ON ?auto_1213056 ?auto_1213055 ) ( ON ?auto_1213057 ?auto_1213056 ) ( ON ?auto_1213058 ?auto_1213057 ) ( ON ?auto_1213059 ?auto_1213058 ) ( ON ?auto_1213060 ?auto_1213059 ) ( ON ?auto_1213061 ?auto_1213060 ) ( not ( = ?auto_1213051 ?auto_1213052 ) ) ( not ( = ?auto_1213051 ?auto_1213053 ) ) ( not ( = ?auto_1213051 ?auto_1213054 ) ) ( not ( = ?auto_1213051 ?auto_1213055 ) ) ( not ( = ?auto_1213051 ?auto_1213056 ) ) ( not ( = ?auto_1213051 ?auto_1213057 ) ) ( not ( = ?auto_1213051 ?auto_1213058 ) ) ( not ( = ?auto_1213051 ?auto_1213059 ) ) ( not ( = ?auto_1213051 ?auto_1213060 ) ) ( not ( = ?auto_1213051 ?auto_1213061 ) ) ( not ( = ?auto_1213051 ?auto_1213062 ) ) ( not ( = ?auto_1213051 ?auto_1213063 ) ) ( not ( = ?auto_1213052 ?auto_1213053 ) ) ( not ( = ?auto_1213052 ?auto_1213054 ) ) ( not ( = ?auto_1213052 ?auto_1213055 ) ) ( not ( = ?auto_1213052 ?auto_1213056 ) ) ( not ( = ?auto_1213052 ?auto_1213057 ) ) ( not ( = ?auto_1213052 ?auto_1213058 ) ) ( not ( = ?auto_1213052 ?auto_1213059 ) ) ( not ( = ?auto_1213052 ?auto_1213060 ) ) ( not ( = ?auto_1213052 ?auto_1213061 ) ) ( not ( = ?auto_1213052 ?auto_1213062 ) ) ( not ( = ?auto_1213052 ?auto_1213063 ) ) ( not ( = ?auto_1213053 ?auto_1213054 ) ) ( not ( = ?auto_1213053 ?auto_1213055 ) ) ( not ( = ?auto_1213053 ?auto_1213056 ) ) ( not ( = ?auto_1213053 ?auto_1213057 ) ) ( not ( = ?auto_1213053 ?auto_1213058 ) ) ( not ( = ?auto_1213053 ?auto_1213059 ) ) ( not ( = ?auto_1213053 ?auto_1213060 ) ) ( not ( = ?auto_1213053 ?auto_1213061 ) ) ( not ( = ?auto_1213053 ?auto_1213062 ) ) ( not ( = ?auto_1213053 ?auto_1213063 ) ) ( not ( = ?auto_1213054 ?auto_1213055 ) ) ( not ( = ?auto_1213054 ?auto_1213056 ) ) ( not ( = ?auto_1213054 ?auto_1213057 ) ) ( not ( = ?auto_1213054 ?auto_1213058 ) ) ( not ( = ?auto_1213054 ?auto_1213059 ) ) ( not ( = ?auto_1213054 ?auto_1213060 ) ) ( not ( = ?auto_1213054 ?auto_1213061 ) ) ( not ( = ?auto_1213054 ?auto_1213062 ) ) ( not ( = ?auto_1213054 ?auto_1213063 ) ) ( not ( = ?auto_1213055 ?auto_1213056 ) ) ( not ( = ?auto_1213055 ?auto_1213057 ) ) ( not ( = ?auto_1213055 ?auto_1213058 ) ) ( not ( = ?auto_1213055 ?auto_1213059 ) ) ( not ( = ?auto_1213055 ?auto_1213060 ) ) ( not ( = ?auto_1213055 ?auto_1213061 ) ) ( not ( = ?auto_1213055 ?auto_1213062 ) ) ( not ( = ?auto_1213055 ?auto_1213063 ) ) ( not ( = ?auto_1213056 ?auto_1213057 ) ) ( not ( = ?auto_1213056 ?auto_1213058 ) ) ( not ( = ?auto_1213056 ?auto_1213059 ) ) ( not ( = ?auto_1213056 ?auto_1213060 ) ) ( not ( = ?auto_1213056 ?auto_1213061 ) ) ( not ( = ?auto_1213056 ?auto_1213062 ) ) ( not ( = ?auto_1213056 ?auto_1213063 ) ) ( not ( = ?auto_1213057 ?auto_1213058 ) ) ( not ( = ?auto_1213057 ?auto_1213059 ) ) ( not ( = ?auto_1213057 ?auto_1213060 ) ) ( not ( = ?auto_1213057 ?auto_1213061 ) ) ( not ( = ?auto_1213057 ?auto_1213062 ) ) ( not ( = ?auto_1213057 ?auto_1213063 ) ) ( not ( = ?auto_1213058 ?auto_1213059 ) ) ( not ( = ?auto_1213058 ?auto_1213060 ) ) ( not ( = ?auto_1213058 ?auto_1213061 ) ) ( not ( = ?auto_1213058 ?auto_1213062 ) ) ( not ( = ?auto_1213058 ?auto_1213063 ) ) ( not ( = ?auto_1213059 ?auto_1213060 ) ) ( not ( = ?auto_1213059 ?auto_1213061 ) ) ( not ( = ?auto_1213059 ?auto_1213062 ) ) ( not ( = ?auto_1213059 ?auto_1213063 ) ) ( not ( = ?auto_1213060 ?auto_1213061 ) ) ( not ( = ?auto_1213060 ?auto_1213062 ) ) ( not ( = ?auto_1213060 ?auto_1213063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213061 ?auto_1213062 ?auto_1213063 )
      ( MAKE-12CRATE-VERIFY ?auto_1213051 ?auto_1213052 ?auto_1213053 ?auto_1213054 ?auto_1213055 ?auto_1213056 ?auto_1213057 ?auto_1213058 ?auto_1213059 ?auto_1213060 ?auto_1213061 ?auto_1213062 ?auto_1213063 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213189 - SURFACE
      ?auto_1213190 - SURFACE
      ?auto_1213191 - SURFACE
      ?auto_1213192 - SURFACE
      ?auto_1213193 - SURFACE
      ?auto_1213194 - SURFACE
      ?auto_1213195 - SURFACE
      ?auto_1213196 - SURFACE
      ?auto_1213197 - SURFACE
      ?auto_1213198 - SURFACE
      ?auto_1213199 - SURFACE
      ?auto_1213200 - SURFACE
      ?auto_1213201 - SURFACE
    )
    :vars
    (
      ?auto_1213203 - HOIST
      ?auto_1213205 - PLACE
      ?auto_1213204 - TRUCK
      ?auto_1213202 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213203 ?auto_1213205 ) ( SURFACE-AT ?auto_1213200 ?auto_1213205 ) ( CLEAR ?auto_1213200 ) ( IS-CRATE ?auto_1213201 ) ( not ( = ?auto_1213200 ?auto_1213201 ) ) ( AVAILABLE ?auto_1213203 ) ( IN ?auto_1213201 ?auto_1213204 ) ( ON ?auto_1213200 ?auto_1213199 ) ( not ( = ?auto_1213199 ?auto_1213200 ) ) ( not ( = ?auto_1213199 ?auto_1213201 ) ) ( TRUCK-AT ?auto_1213204 ?auto_1213202 ) ( not ( = ?auto_1213202 ?auto_1213205 ) ) ( ON ?auto_1213190 ?auto_1213189 ) ( ON ?auto_1213191 ?auto_1213190 ) ( ON ?auto_1213192 ?auto_1213191 ) ( ON ?auto_1213193 ?auto_1213192 ) ( ON ?auto_1213194 ?auto_1213193 ) ( ON ?auto_1213195 ?auto_1213194 ) ( ON ?auto_1213196 ?auto_1213195 ) ( ON ?auto_1213197 ?auto_1213196 ) ( ON ?auto_1213198 ?auto_1213197 ) ( ON ?auto_1213199 ?auto_1213198 ) ( not ( = ?auto_1213189 ?auto_1213190 ) ) ( not ( = ?auto_1213189 ?auto_1213191 ) ) ( not ( = ?auto_1213189 ?auto_1213192 ) ) ( not ( = ?auto_1213189 ?auto_1213193 ) ) ( not ( = ?auto_1213189 ?auto_1213194 ) ) ( not ( = ?auto_1213189 ?auto_1213195 ) ) ( not ( = ?auto_1213189 ?auto_1213196 ) ) ( not ( = ?auto_1213189 ?auto_1213197 ) ) ( not ( = ?auto_1213189 ?auto_1213198 ) ) ( not ( = ?auto_1213189 ?auto_1213199 ) ) ( not ( = ?auto_1213189 ?auto_1213200 ) ) ( not ( = ?auto_1213189 ?auto_1213201 ) ) ( not ( = ?auto_1213190 ?auto_1213191 ) ) ( not ( = ?auto_1213190 ?auto_1213192 ) ) ( not ( = ?auto_1213190 ?auto_1213193 ) ) ( not ( = ?auto_1213190 ?auto_1213194 ) ) ( not ( = ?auto_1213190 ?auto_1213195 ) ) ( not ( = ?auto_1213190 ?auto_1213196 ) ) ( not ( = ?auto_1213190 ?auto_1213197 ) ) ( not ( = ?auto_1213190 ?auto_1213198 ) ) ( not ( = ?auto_1213190 ?auto_1213199 ) ) ( not ( = ?auto_1213190 ?auto_1213200 ) ) ( not ( = ?auto_1213190 ?auto_1213201 ) ) ( not ( = ?auto_1213191 ?auto_1213192 ) ) ( not ( = ?auto_1213191 ?auto_1213193 ) ) ( not ( = ?auto_1213191 ?auto_1213194 ) ) ( not ( = ?auto_1213191 ?auto_1213195 ) ) ( not ( = ?auto_1213191 ?auto_1213196 ) ) ( not ( = ?auto_1213191 ?auto_1213197 ) ) ( not ( = ?auto_1213191 ?auto_1213198 ) ) ( not ( = ?auto_1213191 ?auto_1213199 ) ) ( not ( = ?auto_1213191 ?auto_1213200 ) ) ( not ( = ?auto_1213191 ?auto_1213201 ) ) ( not ( = ?auto_1213192 ?auto_1213193 ) ) ( not ( = ?auto_1213192 ?auto_1213194 ) ) ( not ( = ?auto_1213192 ?auto_1213195 ) ) ( not ( = ?auto_1213192 ?auto_1213196 ) ) ( not ( = ?auto_1213192 ?auto_1213197 ) ) ( not ( = ?auto_1213192 ?auto_1213198 ) ) ( not ( = ?auto_1213192 ?auto_1213199 ) ) ( not ( = ?auto_1213192 ?auto_1213200 ) ) ( not ( = ?auto_1213192 ?auto_1213201 ) ) ( not ( = ?auto_1213193 ?auto_1213194 ) ) ( not ( = ?auto_1213193 ?auto_1213195 ) ) ( not ( = ?auto_1213193 ?auto_1213196 ) ) ( not ( = ?auto_1213193 ?auto_1213197 ) ) ( not ( = ?auto_1213193 ?auto_1213198 ) ) ( not ( = ?auto_1213193 ?auto_1213199 ) ) ( not ( = ?auto_1213193 ?auto_1213200 ) ) ( not ( = ?auto_1213193 ?auto_1213201 ) ) ( not ( = ?auto_1213194 ?auto_1213195 ) ) ( not ( = ?auto_1213194 ?auto_1213196 ) ) ( not ( = ?auto_1213194 ?auto_1213197 ) ) ( not ( = ?auto_1213194 ?auto_1213198 ) ) ( not ( = ?auto_1213194 ?auto_1213199 ) ) ( not ( = ?auto_1213194 ?auto_1213200 ) ) ( not ( = ?auto_1213194 ?auto_1213201 ) ) ( not ( = ?auto_1213195 ?auto_1213196 ) ) ( not ( = ?auto_1213195 ?auto_1213197 ) ) ( not ( = ?auto_1213195 ?auto_1213198 ) ) ( not ( = ?auto_1213195 ?auto_1213199 ) ) ( not ( = ?auto_1213195 ?auto_1213200 ) ) ( not ( = ?auto_1213195 ?auto_1213201 ) ) ( not ( = ?auto_1213196 ?auto_1213197 ) ) ( not ( = ?auto_1213196 ?auto_1213198 ) ) ( not ( = ?auto_1213196 ?auto_1213199 ) ) ( not ( = ?auto_1213196 ?auto_1213200 ) ) ( not ( = ?auto_1213196 ?auto_1213201 ) ) ( not ( = ?auto_1213197 ?auto_1213198 ) ) ( not ( = ?auto_1213197 ?auto_1213199 ) ) ( not ( = ?auto_1213197 ?auto_1213200 ) ) ( not ( = ?auto_1213197 ?auto_1213201 ) ) ( not ( = ?auto_1213198 ?auto_1213199 ) ) ( not ( = ?auto_1213198 ?auto_1213200 ) ) ( not ( = ?auto_1213198 ?auto_1213201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213199 ?auto_1213200 ?auto_1213201 )
      ( MAKE-12CRATE-VERIFY ?auto_1213189 ?auto_1213190 ?auto_1213191 ?auto_1213192 ?auto_1213193 ?auto_1213194 ?auto_1213195 ?auto_1213196 ?auto_1213197 ?auto_1213198 ?auto_1213199 ?auto_1213200 ?auto_1213201 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213339 - SURFACE
      ?auto_1213340 - SURFACE
      ?auto_1213341 - SURFACE
      ?auto_1213342 - SURFACE
      ?auto_1213343 - SURFACE
      ?auto_1213344 - SURFACE
      ?auto_1213345 - SURFACE
      ?auto_1213346 - SURFACE
      ?auto_1213347 - SURFACE
      ?auto_1213348 - SURFACE
      ?auto_1213349 - SURFACE
      ?auto_1213350 - SURFACE
      ?auto_1213351 - SURFACE
    )
    :vars
    (
      ?auto_1213355 - HOIST
      ?auto_1213354 - PLACE
      ?auto_1213352 - TRUCK
      ?auto_1213356 - PLACE
      ?auto_1213353 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213355 ?auto_1213354 ) ( SURFACE-AT ?auto_1213350 ?auto_1213354 ) ( CLEAR ?auto_1213350 ) ( IS-CRATE ?auto_1213351 ) ( not ( = ?auto_1213350 ?auto_1213351 ) ) ( AVAILABLE ?auto_1213355 ) ( ON ?auto_1213350 ?auto_1213349 ) ( not ( = ?auto_1213349 ?auto_1213350 ) ) ( not ( = ?auto_1213349 ?auto_1213351 ) ) ( TRUCK-AT ?auto_1213352 ?auto_1213356 ) ( not ( = ?auto_1213356 ?auto_1213354 ) ) ( HOIST-AT ?auto_1213353 ?auto_1213356 ) ( LIFTING ?auto_1213353 ?auto_1213351 ) ( not ( = ?auto_1213355 ?auto_1213353 ) ) ( ON ?auto_1213340 ?auto_1213339 ) ( ON ?auto_1213341 ?auto_1213340 ) ( ON ?auto_1213342 ?auto_1213341 ) ( ON ?auto_1213343 ?auto_1213342 ) ( ON ?auto_1213344 ?auto_1213343 ) ( ON ?auto_1213345 ?auto_1213344 ) ( ON ?auto_1213346 ?auto_1213345 ) ( ON ?auto_1213347 ?auto_1213346 ) ( ON ?auto_1213348 ?auto_1213347 ) ( ON ?auto_1213349 ?auto_1213348 ) ( not ( = ?auto_1213339 ?auto_1213340 ) ) ( not ( = ?auto_1213339 ?auto_1213341 ) ) ( not ( = ?auto_1213339 ?auto_1213342 ) ) ( not ( = ?auto_1213339 ?auto_1213343 ) ) ( not ( = ?auto_1213339 ?auto_1213344 ) ) ( not ( = ?auto_1213339 ?auto_1213345 ) ) ( not ( = ?auto_1213339 ?auto_1213346 ) ) ( not ( = ?auto_1213339 ?auto_1213347 ) ) ( not ( = ?auto_1213339 ?auto_1213348 ) ) ( not ( = ?auto_1213339 ?auto_1213349 ) ) ( not ( = ?auto_1213339 ?auto_1213350 ) ) ( not ( = ?auto_1213339 ?auto_1213351 ) ) ( not ( = ?auto_1213340 ?auto_1213341 ) ) ( not ( = ?auto_1213340 ?auto_1213342 ) ) ( not ( = ?auto_1213340 ?auto_1213343 ) ) ( not ( = ?auto_1213340 ?auto_1213344 ) ) ( not ( = ?auto_1213340 ?auto_1213345 ) ) ( not ( = ?auto_1213340 ?auto_1213346 ) ) ( not ( = ?auto_1213340 ?auto_1213347 ) ) ( not ( = ?auto_1213340 ?auto_1213348 ) ) ( not ( = ?auto_1213340 ?auto_1213349 ) ) ( not ( = ?auto_1213340 ?auto_1213350 ) ) ( not ( = ?auto_1213340 ?auto_1213351 ) ) ( not ( = ?auto_1213341 ?auto_1213342 ) ) ( not ( = ?auto_1213341 ?auto_1213343 ) ) ( not ( = ?auto_1213341 ?auto_1213344 ) ) ( not ( = ?auto_1213341 ?auto_1213345 ) ) ( not ( = ?auto_1213341 ?auto_1213346 ) ) ( not ( = ?auto_1213341 ?auto_1213347 ) ) ( not ( = ?auto_1213341 ?auto_1213348 ) ) ( not ( = ?auto_1213341 ?auto_1213349 ) ) ( not ( = ?auto_1213341 ?auto_1213350 ) ) ( not ( = ?auto_1213341 ?auto_1213351 ) ) ( not ( = ?auto_1213342 ?auto_1213343 ) ) ( not ( = ?auto_1213342 ?auto_1213344 ) ) ( not ( = ?auto_1213342 ?auto_1213345 ) ) ( not ( = ?auto_1213342 ?auto_1213346 ) ) ( not ( = ?auto_1213342 ?auto_1213347 ) ) ( not ( = ?auto_1213342 ?auto_1213348 ) ) ( not ( = ?auto_1213342 ?auto_1213349 ) ) ( not ( = ?auto_1213342 ?auto_1213350 ) ) ( not ( = ?auto_1213342 ?auto_1213351 ) ) ( not ( = ?auto_1213343 ?auto_1213344 ) ) ( not ( = ?auto_1213343 ?auto_1213345 ) ) ( not ( = ?auto_1213343 ?auto_1213346 ) ) ( not ( = ?auto_1213343 ?auto_1213347 ) ) ( not ( = ?auto_1213343 ?auto_1213348 ) ) ( not ( = ?auto_1213343 ?auto_1213349 ) ) ( not ( = ?auto_1213343 ?auto_1213350 ) ) ( not ( = ?auto_1213343 ?auto_1213351 ) ) ( not ( = ?auto_1213344 ?auto_1213345 ) ) ( not ( = ?auto_1213344 ?auto_1213346 ) ) ( not ( = ?auto_1213344 ?auto_1213347 ) ) ( not ( = ?auto_1213344 ?auto_1213348 ) ) ( not ( = ?auto_1213344 ?auto_1213349 ) ) ( not ( = ?auto_1213344 ?auto_1213350 ) ) ( not ( = ?auto_1213344 ?auto_1213351 ) ) ( not ( = ?auto_1213345 ?auto_1213346 ) ) ( not ( = ?auto_1213345 ?auto_1213347 ) ) ( not ( = ?auto_1213345 ?auto_1213348 ) ) ( not ( = ?auto_1213345 ?auto_1213349 ) ) ( not ( = ?auto_1213345 ?auto_1213350 ) ) ( not ( = ?auto_1213345 ?auto_1213351 ) ) ( not ( = ?auto_1213346 ?auto_1213347 ) ) ( not ( = ?auto_1213346 ?auto_1213348 ) ) ( not ( = ?auto_1213346 ?auto_1213349 ) ) ( not ( = ?auto_1213346 ?auto_1213350 ) ) ( not ( = ?auto_1213346 ?auto_1213351 ) ) ( not ( = ?auto_1213347 ?auto_1213348 ) ) ( not ( = ?auto_1213347 ?auto_1213349 ) ) ( not ( = ?auto_1213347 ?auto_1213350 ) ) ( not ( = ?auto_1213347 ?auto_1213351 ) ) ( not ( = ?auto_1213348 ?auto_1213349 ) ) ( not ( = ?auto_1213348 ?auto_1213350 ) ) ( not ( = ?auto_1213348 ?auto_1213351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213349 ?auto_1213350 ?auto_1213351 )
      ( MAKE-12CRATE-VERIFY ?auto_1213339 ?auto_1213340 ?auto_1213341 ?auto_1213342 ?auto_1213343 ?auto_1213344 ?auto_1213345 ?auto_1213346 ?auto_1213347 ?auto_1213348 ?auto_1213349 ?auto_1213350 ?auto_1213351 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213501 - SURFACE
      ?auto_1213502 - SURFACE
      ?auto_1213503 - SURFACE
      ?auto_1213504 - SURFACE
      ?auto_1213505 - SURFACE
      ?auto_1213506 - SURFACE
      ?auto_1213507 - SURFACE
      ?auto_1213508 - SURFACE
      ?auto_1213509 - SURFACE
      ?auto_1213510 - SURFACE
      ?auto_1213511 - SURFACE
      ?auto_1213512 - SURFACE
      ?auto_1213513 - SURFACE
    )
    :vars
    (
      ?auto_1213519 - HOIST
      ?auto_1213518 - PLACE
      ?auto_1213515 - TRUCK
      ?auto_1213514 - PLACE
      ?auto_1213516 - HOIST
      ?auto_1213517 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213519 ?auto_1213518 ) ( SURFACE-AT ?auto_1213512 ?auto_1213518 ) ( CLEAR ?auto_1213512 ) ( IS-CRATE ?auto_1213513 ) ( not ( = ?auto_1213512 ?auto_1213513 ) ) ( AVAILABLE ?auto_1213519 ) ( ON ?auto_1213512 ?auto_1213511 ) ( not ( = ?auto_1213511 ?auto_1213512 ) ) ( not ( = ?auto_1213511 ?auto_1213513 ) ) ( TRUCK-AT ?auto_1213515 ?auto_1213514 ) ( not ( = ?auto_1213514 ?auto_1213518 ) ) ( HOIST-AT ?auto_1213516 ?auto_1213514 ) ( not ( = ?auto_1213519 ?auto_1213516 ) ) ( AVAILABLE ?auto_1213516 ) ( SURFACE-AT ?auto_1213513 ?auto_1213514 ) ( ON ?auto_1213513 ?auto_1213517 ) ( CLEAR ?auto_1213513 ) ( not ( = ?auto_1213512 ?auto_1213517 ) ) ( not ( = ?auto_1213513 ?auto_1213517 ) ) ( not ( = ?auto_1213511 ?auto_1213517 ) ) ( ON ?auto_1213502 ?auto_1213501 ) ( ON ?auto_1213503 ?auto_1213502 ) ( ON ?auto_1213504 ?auto_1213503 ) ( ON ?auto_1213505 ?auto_1213504 ) ( ON ?auto_1213506 ?auto_1213505 ) ( ON ?auto_1213507 ?auto_1213506 ) ( ON ?auto_1213508 ?auto_1213507 ) ( ON ?auto_1213509 ?auto_1213508 ) ( ON ?auto_1213510 ?auto_1213509 ) ( ON ?auto_1213511 ?auto_1213510 ) ( not ( = ?auto_1213501 ?auto_1213502 ) ) ( not ( = ?auto_1213501 ?auto_1213503 ) ) ( not ( = ?auto_1213501 ?auto_1213504 ) ) ( not ( = ?auto_1213501 ?auto_1213505 ) ) ( not ( = ?auto_1213501 ?auto_1213506 ) ) ( not ( = ?auto_1213501 ?auto_1213507 ) ) ( not ( = ?auto_1213501 ?auto_1213508 ) ) ( not ( = ?auto_1213501 ?auto_1213509 ) ) ( not ( = ?auto_1213501 ?auto_1213510 ) ) ( not ( = ?auto_1213501 ?auto_1213511 ) ) ( not ( = ?auto_1213501 ?auto_1213512 ) ) ( not ( = ?auto_1213501 ?auto_1213513 ) ) ( not ( = ?auto_1213501 ?auto_1213517 ) ) ( not ( = ?auto_1213502 ?auto_1213503 ) ) ( not ( = ?auto_1213502 ?auto_1213504 ) ) ( not ( = ?auto_1213502 ?auto_1213505 ) ) ( not ( = ?auto_1213502 ?auto_1213506 ) ) ( not ( = ?auto_1213502 ?auto_1213507 ) ) ( not ( = ?auto_1213502 ?auto_1213508 ) ) ( not ( = ?auto_1213502 ?auto_1213509 ) ) ( not ( = ?auto_1213502 ?auto_1213510 ) ) ( not ( = ?auto_1213502 ?auto_1213511 ) ) ( not ( = ?auto_1213502 ?auto_1213512 ) ) ( not ( = ?auto_1213502 ?auto_1213513 ) ) ( not ( = ?auto_1213502 ?auto_1213517 ) ) ( not ( = ?auto_1213503 ?auto_1213504 ) ) ( not ( = ?auto_1213503 ?auto_1213505 ) ) ( not ( = ?auto_1213503 ?auto_1213506 ) ) ( not ( = ?auto_1213503 ?auto_1213507 ) ) ( not ( = ?auto_1213503 ?auto_1213508 ) ) ( not ( = ?auto_1213503 ?auto_1213509 ) ) ( not ( = ?auto_1213503 ?auto_1213510 ) ) ( not ( = ?auto_1213503 ?auto_1213511 ) ) ( not ( = ?auto_1213503 ?auto_1213512 ) ) ( not ( = ?auto_1213503 ?auto_1213513 ) ) ( not ( = ?auto_1213503 ?auto_1213517 ) ) ( not ( = ?auto_1213504 ?auto_1213505 ) ) ( not ( = ?auto_1213504 ?auto_1213506 ) ) ( not ( = ?auto_1213504 ?auto_1213507 ) ) ( not ( = ?auto_1213504 ?auto_1213508 ) ) ( not ( = ?auto_1213504 ?auto_1213509 ) ) ( not ( = ?auto_1213504 ?auto_1213510 ) ) ( not ( = ?auto_1213504 ?auto_1213511 ) ) ( not ( = ?auto_1213504 ?auto_1213512 ) ) ( not ( = ?auto_1213504 ?auto_1213513 ) ) ( not ( = ?auto_1213504 ?auto_1213517 ) ) ( not ( = ?auto_1213505 ?auto_1213506 ) ) ( not ( = ?auto_1213505 ?auto_1213507 ) ) ( not ( = ?auto_1213505 ?auto_1213508 ) ) ( not ( = ?auto_1213505 ?auto_1213509 ) ) ( not ( = ?auto_1213505 ?auto_1213510 ) ) ( not ( = ?auto_1213505 ?auto_1213511 ) ) ( not ( = ?auto_1213505 ?auto_1213512 ) ) ( not ( = ?auto_1213505 ?auto_1213513 ) ) ( not ( = ?auto_1213505 ?auto_1213517 ) ) ( not ( = ?auto_1213506 ?auto_1213507 ) ) ( not ( = ?auto_1213506 ?auto_1213508 ) ) ( not ( = ?auto_1213506 ?auto_1213509 ) ) ( not ( = ?auto_1213506 ?auto_1213510 ) ) ( not ( = ?auto_1213506 ?auto_1213511 ) ) ( not ( = ?auto_1213506 ?auto_1213512 ) ) ( not ( = ?auto_1213506 ?auto_1213513 ) ) ( not ( = ?auto_1213506 ?auto_1213517 ) ) ( not ( = ?auto_1213507 ?auto_1213508 ) ) ( not ( = ?auto_1213507 ?auto_1213509 ) ) ( not ( = ?auto_1213507 ?auto_1213510 ) ) ( not ( = ?auto_1213507 ?auto_1213511 ) ) ( not ( = ?auto_1213507 ?auto_1213512 ) ) ( not ( = ?auto_1213507 ?auto_1213513 ) ) ( not ( = ?auto_1213507 ?auto_1213517 ) ) ( not ( = ?auto_1213508 ?auto_1213509 ) ) ( not ( = ?auto_1213508 ?auto_1213510 ) ) ( not ( = ?auto_1213508 ?auto_1213511 ) ) ( not ( = ?auto_1213508 ?auto_1213512 ) ) ( not ( = ?auto_1213508 ?auto_1213513 ) ) ( not ( = ?auto_1213508 ?auto_1213517 ) ) ( not ( = ?auto_1213509 ?auto_1213510 ) ) ( not ( = ?auto_1213509 ?auto_1213511 ) ) ( not ( = ?auto_1213509 ?auto_1213512 ) ) ( not ( = ?auto_1213509 ?auto_1213513 ) ) ( not ( = ?auto_1213509 ?auto_1213517 ) ) ( not ( = ?auto_1213510 ?auto_1213511 ) ) ( not ( = ?auto_1213510 ?auto_1213512 ) ) ( not ( = ?auto_1213510 ?auto_1213513 ) ) ( not ( = ?auto_1213510 ?auto_1213517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213511 ?auto_1213512 ?auto_1213513 )
      ( MAKE-12CRATE-VERIFY ?auto_1213501 ?auto_1213502 ?auto_1213503 ?auto_1213504 ?auto_1213505 ?auto_1213506 ?auto_1213507 ?auto_1213508 ?auto_1213509 ?auto_1213510 ?auto_1213511 ?auto_1213512 ?auto_1213513 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213664 - SURFACE
      ?auto_1213665 - SURFACE
      ?auto_1213666 - SURFACE
      ?auto_1213667 - SURFACE
      ?auto_1213668 - SURFACE
      ?auto_1213669 - SURFACE
      ?auto_1213670 - SURFACE
      ?auto_1213671 - SURFACE
      ?auto_1213672 - SURFACE
      ?auto_1213673 - SURFACE
      ?auto_1213674 - SURFACE
      ?auto_1213675 - SURFACE
      ?auto_1213676 - SURFACE
    )
    :vars
    (
      ?auto_1213681 - HOIST
      ?auto_1213679 - PLACE
      ?auto_1213677 - PLACE
      ?auto_1213680 - HOIST
      ?auto_1213682 - SURFACE
      ?auto_1213678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213681 ?auto_1213679 ) ( SURFACE-AT ?auto_1213675 ?auto_1213679 ) ( CLEAR ?auto_1213675 ) ( IS-CRATE ?auto_1213676 ) ( not ( = ?auto_1213675 ?auto_1213676 ) ) ( AVAILABLE ?auto_1213681 ) ( ON ?auto_1213675 ?auto_1213674 ) ( not ( = ?auto_1213674 ?auto_1213675 ) ) ( not ( = ?auto_1213674 ?auto_1213676 ) ) ( not ( = ?auto_1213677 ?auto_1213679 ) ) ( HOIST-AT ?auto_1213680 ?auto_1213677 ) ( not ( = ?auto_1213681 ?auto_1213680 ) ) ( AVAILABLE ?auto_1213680 ) ( SURFACE-AT ?auto_1213676 ?auto_1213677 ) ( ON ?auto_1213676 ?auto_1213682 ) ( CLEAR ?auto_1213676 ) ( not ( = ?auto_1213675 ?auto_1213682 ) ) ( not ( = ?auto_1213676 ?auto_1213682 ) ) ( not ( = ?auto_1213674 ?auto_1213682 ) ) ( TRUCK-AT ?auto_1213678 ?auto_1213679 ) ( ON ?auto_1213665 ?auto_1213664 ) ( ON ?auto_1213666 ?auto_1213665 ) ( ON ?auto_1213667 ?auto_1213666 ) ( ON ?auto_1213668 ?auto_1213667 ) ( ON ?auto_1213669 ?auto_1213668 ) ( ON ?auto_1213670 ?auto_1213669 ) ( ON ?auto_1213671 ?auto_1213670 ) ( ON ?auto_1213672 ?auto_1213671 ) ( ON ?auto_1213673 ?auto_1213672 ) ( ON ?auto_1213674 ?auto_1213673 ) ( not ( = ?auto_1213664 ?auto_1213665 ) ) ( not ( = ?auto_1213664 ?auto_1213666 ) ) ( not ( = ?auto_1213664 ?auto_1213667 ) ) ( not ( = ?auto_1213664 ?auto_1213668 ) ) ( not ( = ?auto_1213664 ?auto_1213669 ) ) ( not ( = ?auto_1213664 ?auto_1213670 ) ) ( not ( = ?auto_1213664 ?auto_1213671 ) ) ( not ( = ?auto_1213664 ?auto_1213672 ) ) ( not ( = ?auto_1213664 ?auto_1213673 ) ) ( not ( = ?auto_1213664 ?auto_1213674 ) ) ( not ( = ?auto_1213664 ?auto_1213675 ) ) ( not ( = ?auto_1213664 ?auto_1213676 ) ) ( not ( = ?auto_1213664 ?auto_1213682 ) ) ( not ( = ?auto_1213665 ?auto_1213666 ) ) ( not ( = ?auto_1213665 ?auto_1213667 ) ) ( not ( = ?auto_1213665 ?auto_1213668 ) ) ( not ( = ?auto_1213665 ?auto_1213669 ) ) ( not ( = ?auto_1213665 ?auto_1213670 ) ) ( not ( = ?auto_1213665 ?auto_1213671 ) ) ( not ( = ?auto_1213665 ?auto_1213672 ) ) ( not ( = ?auto_1213665 ?auto_1213673 ) ) ( not ( = ?auto_1213665 ?auto_1213674 ) ) ( not ( = ?auto_1213665 ?auto_1213675 ) ) ( not ( = ?auto_1213665 ?auto_1213676 ) ) ( not ( = ?auto_1213665 ?auto_1213682 ) ) ( not ( = ?auto_1213666 ?auto_1213667 ) ) ( not ( = ?auto_1213666 ?auto_1213668 ) ) ( not ( = ?auto_1213666 ?auto_1213669 ) ) ( not ( = ?auto_1213666 ?auto_1213670 ) ) ( not ( = ?auto_1213666 ?auto_1213671 ) ) ( not ( = ?auto_1213666 ?auto_1213672 ) ) ( not ( = ?auto_1213666 ?auto_1213673 ) ) ( not ( = ?auto_1213666 ?auto_1213674 ) ) ( not ( = ?auto_1213666 ?auto_1213675 ) ) ( not ( = ?auto_1213666 ?auto_1213676 ) ) ( not ( = ?auto_1213666 ?auto_1213682 ) ) ( not ( = ?auto_1213667 ?auto_1213668 ) ) ( not ( = ?auto_1213667 ?auto_1213669 ) ) ( not ( = ?auto_1213667 ?auto_1213670 ) ) ( not ( = ?auto_1213667 ?auto_1213671 ) ) ( not ( = ?auto_1213667 ?auto_1213672 ) ) ( not ( = ?auto_1213667 ?auto_1213673 ) ) ( not ( = ?auto_1213667 ?auto_1213674 ) ) ( not ( = ?auto_1213667 ?auto_1213675 ) ) ( not ( = ?auto_1213667 ?auto_1213676 ) ) ( not ( = ?auto_1213667 ?auto_1213682 ) ) ( not ( = ?auto_1213668 ?auto_1213669 ) ) ( not ( = ?auto_1213668 ?auto_1213670 ) ) ( not ( = ?auto_1213668 ?auto_1213671 ) ) ( not ( = ?auto_1213668 ?auto_1213672 ) ) ( not ( = ?auto_1213668 ?auto_1213673 ) ) ( not ( = ?auto_1213668 ?auto_1213674 ) ) ( not ( = ?auto_1213668 ?auto_1213675 ) ) ( not ( = ?auto_1213668 ?auto_1213676 ) ) ( not ( = ?auto_1213668 ?auto_1213682 ) ) ( not ( = ?auto_1213669 ?auto_1213670 ) ) ( not ( = ?auto_1213669 ?auto_1213671 ) ) ( not ( = ?auto_1213669 ?auto_1213672 ) ) ( not ( = ?auto_1213669 ?auto_1213673 ) ) ( not ( = ?auto_1213669 ?auto_1213674 ) ) ( not ( = ?auto_1213669 ?auto_1213675 ) ) ( not ( = ?auto_1213669 ?auto_1213676 ) ) ( not ( = ?auto_1213669 ?auto_1213682 ) ) ( not ( = ?auto_1213670 ?auto_1213671 ) ) ( not ( = ?auto_1213670 ?auto_1213672 ) ) ( not ( = ?auto_1213670 ?auto_1213673 ) ) ( not ( = ?auto_1213670 ?auto_1213674 ) ) ( not ( = ?auto_1213670 ?auto_1213675 ) ) ( not ( = ?auto_1213670 ?auto_1213676 ) ) ( not ( = ?auto_1213670 ?auto_1213682 ) ) ( not ( = ?auto_1213671 ?auto_1213672 ) ) ( not ( = ?auto_1213671 ?auto_1213673 ) ) ( not ( = ?auto_1213671 ?auto_1213674 ) ) ( not ( = ?auto_1213671 ?auto_1213675 ) ) ( not ( = ?auto_1213671 ?auto_1213676 ) ) ( not ( = ?auto_1213671 ?auto_1213682 ) ) ( not ( = ?auto_1213672 ?auto_1213673 ) ) ( not ( = ?auto_1213672 ?auto_1213674 ) ) ( not ( = ?auto_1213672 ?auto_1213675 ) ) ( not ( = ?auto_1213672 ?auto_1213676 ) ) ( not ( = ?auto_1213672 ?auto_1213682 ) ) ( not ( = ?auto_1213673 ?auto_1213674 ) ) ( not ( = ?auto_1213673 ?auto_1213675 ) ) ( not ( = ?auto_1213673 ?auto_1213676 ) ) ( not ( = ?auto_1213673 ?auto_1213682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213674 ?auto_1213675 ?auto_1213676 )
      ( MAKE-12CRATE-VERIFY ?auto_1213664 ?auto_1213665 ?auto_1213666 ?auto_1213667 ?auto_1213668 ?auto_1213669 ?auto_1213670 ?auto_1213671 ?auto_1213672 ?auto_1213673 ?auto_1213674 ?auto_1213675 ?auto_1213676 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213827 - SURFACE
      ?auto_1213828 - SURFACE
      ?auto_1213829 - SURFACE
      ?auto_1213830 - SURFACE
      ?auto_1213831 - SURFACE
      ?auto_1213832 - SURFACE
      ?auto_1213833 - SURFACE
      ?auto_1213834 - SURFACE
      ?auto_1213835 - SURFACE
      ?auto_1213836 - SURFACE
      ?auto_1213837 - SURFACE
      ?auto_1213838 - SURFACE
      ?auto_1213839 - SURFACE
    )
    :vars
    (
      ?auto_1213844 - HOIST
      ?auto_1213841 - PLACE
      ?auto_1213842 - PLACE
      ?auto_1213843 - HOIST
      ?auto_1213840 - SURFACE
      ?auto_1213845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1213844 ?auto_1213841 ) ( IS-CRATE ?auto_1213839 ) ( not ( = ?auto_1213838 ?auto_1213839 ) ) ( not ( = ?auto_1213837 ?auto_1213838 ) ) ( not ( = ?auto_1213837 ?auto_1213839 ) ) ( not ( = ?auto_1213842 ?auto_1213841 ) ) ( HOIST-AT ?auto_1213843 ?auto_1213842 ) ( not ( = ?auto_1213844 ?auto_1213843 ) ) ( AVAILABLE ?auto_1213843 ) ( SURFACE-AT ?auto_1213839 ?auto_1213842 ) ( ON ?auto_1213839 ?auto_1213840 ) ( CLEAR ?auto_1213839 ) ( not ( = ?auto_1213838 ?auto_1213840 ) ) ( not ( = ?auto_1213839 ?auto_1213840 ) ) ( not ( = ?auto_1213837 ?auto_1213840 ) ) ( TRUCK-AT ?auto_1213845 ?auto_1213841 ) ( SURFACE-AT ?auto_1213837 ?auto_1213841 ) ( CLEAR ?auto_1213837 ) ( LIFTING ?auto_1213844 ?auto_1213838 ) ( IS-CRATE ?auto_1213838 ) ( ON ?auto_1213828 ?auto_1213827 ) ( ON ?auto_1213829 ?auto_1213828 ) ( ON ?auto_1213830 ?auto_1213829 ) ( ON ?auto_1213831 ?auto_1213830 ) ( ON ?auto_1213832 ?auto_1213831 ) ( ON ?auto_1213833 ?auto_1213832 ) ( ON ?auto_1213834 ?auto_1213833 ) ( ON ?auto_1213835 ?auto_1213834 ) ( ON ?auto_1213836 ?auto_1213835 ) ( ON ?auto_1213837 ?auto_1213836 ) ( not ( = ?auto_1213827 ?auto_1213828 ) ) ( not ( = ?auto_1213827 ?auto_1213829 ) ) ( not ( = ?auto_1213827 ?auto_1213830 ) ) ( not ( = ?auto_1213827 ?auto_1213831 ) ) ( not ( = ?auto_1213827 ?auto_1213832 ) ) ( not ( = ?auto_1213827 ?auto_1213833 ) ) ( not ( = ?auto_1213827 ?auto_1213834 ) ) ( not ( = ?auto_1213827 ?auto_1213835 ) ) ( not ( = ?auto_1213827 ?auto_1213836 ) ) ( not ( = ?auto_1213827 ?auto_1213837 ) ) ( not ( = ?auto_1213827 ?auto_1213838 ) ) ( not ( = ?auto_1213827 ?auto_1213839 ) ) ( not ( = ?auto_1213827 ?auto_1213840 ) ) ( not ( = ?auto_1213828 ?auto_1213829 ) ) ( not ( = ?auto_1213828 ?auto_1213830 ) ) ( not ( = ?auto_1213828 ?auto_1213831 ) ) ( not ( = ?auto_1213828 ?auto_1213832 ) ) ( not ( = ?auto_1213828 ?auto_1213833 ) ) ( not ( = ?auto_1213828 ?auto_1213834 ) ) ( not ( = ?auto_1213828 ?auto_1213835 ) ) ( not ( = ?auto_1213828 ?auto_1213836 ) ) ( not ( = ?auto_1213828 ?auto_1213837 ) ) ( not ( = ?auto_1213828 ?auto_1213838 ) ) ( not ( = ?auto_1213828 ?auto_1213839 ) ) ( not ( = ?auto_1213828 ?auto_1213840 ) ) ( not ( = ?auto_1213829 ?auto_1213830 ) ) ( not ( = ?auto_1213829 ?auto_1213831 ) ) ( not ( = ?auto_1213829 ?auto_1213832 ) ) ( not ( = ?auto_1213829 ?auto_1213833 ) ) ( not ( = ?auto_1213829 ?auto_1213834 ) ) ( not ( = ?auto_1213829 ?auto_1213835 ) ) ( not ( = ?auto_1213829 ?auto_1213836 ) ) ( not ( = ?auto_1213829 ?auto_1213837 ) ) ( not ( = ?auto_1213829 ?auto_1213838 ) ) ( not ( = ?auto_1213829 ?auto_1213839 ) ) ( not ( = ?auto_1213829 ?auto_1213840 ) ) ( not ( = ?auto_1213830 ?auto_1213831 ) ) ( not ( = ?auto_1213830 ?auto_1213832 ) ) ( not ( = ?auto_1213830 ?auto_1213833 ) ) ( not ( = ?auto_1213830 ?auto_1213834 ) ) ( not ( = ?auto_1213830 ?auto_1213835 ) ) ( not ( = ?auto_1213830 ?auto_1213836 ) ) ( not ( = ?auto_1213830 ?auto_1213837 ) ) ( not ( = ?auto_1213830 ?auto_1213838 ) ) ( not ( = ?auto_1213830 ?auto_1213839 ) ) ( not ( = ?auto_1213830 ?auto_1213840 ) ) ( not ( = ?auto_1213831 ?auto_1213832 ) ) ( not ( = ?auto_1213831 ?auto_1213833 ) ) ( not ( = ?auto_1213831 ?auto_1213834 ) ) ( not ( = ?auto_1213831 ?auto_1213835 ) ) ( not ( = ?auto_1213831 ?auto_1213836 ) ) ( not ( = ?auto_1213831 ?auto_1213837 ) ) ( not ( = ?auto_1213831 ?auto_1213838 ) ) ( not ( = ?auto_1213831 ?auto_1213839 ) ) ( not ( = ?auto_1213831 ?auto_1213840 ) ) ( not ( = ?auto_1213832 ?auto_1213833 ) ) ( not ( = ?auto_1213832 ?auto_1213834 ) ) ( not ( = ?auto_1213832 ?auto_1213835 ) ) ( not ( = ?auto_1213832 ?auto_1213836 ) ) ( not ( = ?auto_1213832 ?auto_1213837 ) ) ( not ( = ?auto_1213832 ?auto_1213838 ) ) ( not ( = ?auto_1213832 ?auto_1213839 ) ) ( not ( = ?auto_1213832 ?auto_1213840 ) ) ( not ( = ?auto_1213833 ?auto_1213834 ) ) ( not ( = ?auto_1213833 ?auto_1213835 ) ) ( not ( = ?auto_1213833 ?auto_1213836 ) ) ( not ( = ?auto_1213833 ?auto_1213837 ) ) ( not ( = ?auto_1213833 ?auto_1213838 ) ) ( not ( = ?auto_1213833 ?auto_1213839 ) ) ( not ( = ?auto_1213833 ?auto_1213840 ) ) ( not ( = ?auto_1213834 ?auto_1213835 ) ) ( not ( = ?auto_1213834 ?auto_1213836 ) ) ( not ( = ?auto_1213834 ?auto_1213837 ) ) ( not ( = ?auto_1213834 ?auto_1213838 ) ) ( not ( = ?auto_1213834 ?auto_1213839 ) ) ( not ( = ?auto_1213834 ?auto_1213840 ) ) ( not ( = ?auto_1213835 ?auto_1213836 ) ) ( not ( = ?auto_1213835 ?auto_1213837 ) ) ( not ( = ?auto_1213835 ?auto_1213838 ) ) ( not ( = ?auto_1213835 ?auto_1213839 ) ) ( not ( = ?auto_1213835 ?auto_1213840 ) ) ( not ( = ?auto_1213836 ?auto_1213837 ) ) ( not ( = ?auto_1213836 ?auto_1213838 ) ) ( not ( = ?auto_1213836 ?auto_1213839 ) ) ( not ( = ?auto_1213836 ?auto_1213840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1213837 ?auto_1213838 ?auto_1213839 )
      ( MAKE-12CRATE-VERIFY ?auto_1213827 ?auto_1213828 ?auto_1213829 ?auto_1213830 ?auto_1213831 ?auto_1213832 ?auto_1213833 ?auto_1213834 ?auto_1213835 ?auto_1213836 ?auto_1213837 ?auto_1213838 ?auto_1213839 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1213990 - SURFACE
      ?auto_1213991 - SURFACE
      ?auto_1213992 - SURFACE
      ?auto_1213993 - SURFACE
      ?auto_1213994 - SURFACE
      ?auto_1213995 - SURFACE
      ?auto_1213996 - SURFACE
      ?auto_1213997 - SURFACE
      ?auto_1213998 - SURFACE
      ?auto_1213999 - SURFACE
      ?auto_1214000 - SURFACE
      ?auto_1214001 - SURFACE
      ?auto_1214002 - SURFACE
    )
    :vars
    (
      ?auto_1214007 - HOIST
      ?auto_1214004 - PLACE
      ?auto_1214005 - PLACE
      ?auto_1214003 - HOIST
      ?auto_1214006 - SURFACE
      ?auto_1214008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1214007 ?auto_1214004 ) ( IS-CRATE ?auto_1214002 ) ( not ( = ?auto_1214001 ?auto_1214002 ) ) ( not ( = ?auto_1214000 ?auto_1214001 ) ) ( not ( = ?auto_1214000 ?auto_1214002 ) ) ( not ( = ?auto_1214005 ?auto_1214004 ) ) ( HOIST-AT ?auto_1214003 ?auto_1214005 ) ( not ( = ?auto_1214007 ?auto_1214003 ) ) ( AVAILABLE ?auto_1214003 ) ( SURFACE-AT ?auto_1214002 ?auto_1214005 ) ( ON ?auto_1214002 ?auto_1214006 ) ( CLEAR ?auto_1214002 ) ( not ( = ?auto_1214001 ?auto_1214006 ) ) ( not ( = ?auto_1214002 ?auto_1214006 ) ) ( not ( = ?auto_1214000 ?auto_1214006 ) ) ( TRUCK-AT ?auto_1214008 ?auto_1214004 ) ( SURFACE-AT ?auto_1214000 ?auto_1214004 ) ( CLEAR ?auto_1214000 ) ( IS-CRATE ?auto_1214001 ) ( AVAILABLE ?auto_1214007 ) ( IN ?auto_1214001 ?auto_1214008 ) ( ON ?auto_1213991 ?auto_1213990 ) ( ON ?auto_1213992 ?auto_1213991 ) ( ON ?auto_1213993 ?auto_1213992 ) ( ON ?auto_1213994 ?auto_1213993 ) ( ON ?auto_1213995 ?auto_1213994 ) ( ON ?auto_1213996 ?auto_1213995 ) ( ON ?auto_1213997 ?auto_1213996 ) ( ON ?auto_1213998 ?auto_1213997 ) ( ON ?auto_1213999 ?auto_1213998 ) ( ON ?auto_1214000 ?auto_1213999 ) ( not ( = ?auto_1213990 ?auto_1213991 ) ) ( not ( = ?auto_1213990 ?auto_1213992 ) ) ( not ( = ?auto_1213990 ?auto_1213993 ) ) ( not ( = ?auto_1213990 ?auto_1213994 ) ) ( not ( = ?auto_1213990 ?auto_1213995 ) ) ( not ( = ?auto_1213990 ?auto_1213996 ) ) ( not ( = ?auto_1213990 ?auto_1213997 ) ) ( not ( = ?auto_1213990 ?auto_1213998 ) ) ( not ( = ?auto_1213990 ?auto_1213999 ) ) ( not ( = ?auto_1213990 ?auto_1214000 ) ) ( not ( = ?auto_1213990 ?auto_1214001 ) ) ( not ( = ?auto_1213990 ?auto_1214002 ) ) ( not ( = ?auto_1213990 ?auto_1214006 ) ) ( not ( = ?auto_1213991 ?auto_1213992 ) ) ( not ( = ?auto_1213991 ?auto_1213993 ) ) ( not ( = ?auto_1213991 ?auto_1213994 ) ) ( not ( = ?auto_1213991 ?auto_1213995 ) ) ( not ( = ?auto_1213991 ?auto_1213996 ) ) ( not ( = ?auto_1213991 ?auto_1213997 ) ) ( not ( = ?auto_1213991 ?auto_1213998 ) ) ( not ( = ?auto_1213991 ?auto_1213999 ) ) ( not ( = ?auto_1213991 ?auto_1214000 ) ) ( not ( = ?auto_1213991 ?auto_1214001 ) ) ( not ( = ?auto_1213991 ?auto_1214002 ) ) ( not ( = ?auto_1213991 ?auto_1214006 ) ) ( not ( = ?auto_1213992 ?auto_1213993 ) ) ( not ( = ?auto_1213992 ?auto_1213994 ) ) ( not ( = ?auto_1213992 ?auto_1213995 ) ) ( not ( = ?auto_1213992 ?auto_1213996 ) ) ( not ( = ?auto_1213992 ?auto_1213997 ) ) ( not ( = ?auto_1213992 ?auto_1213998 ) ) ( not ( = ?auto_1213992 ?auto_1213999 ) ) ( not ( = ?auto_1213992 ?auto_1214000 ) ) ( not ( = ?auto_1213992 ?auto_1214001 ) ) ( not ( = ?auto_1213992 ?auto_1214002 ) ) ( not ( = ?auto_1213992 ?auto_1214006 ) ) ( not ( = ?auto_1213993 ?auto_1213994 ) ) ( not ( = ?auto_1213993 ?auto_1213995 ) ) ( not ( = ?auto_1213993 ?auto_1213996 ) ) ( not ( = ?auto_1213993 ?auto_1213997 ) ) ( not ( = ?auto_1213993 ?auto_1213998 ) ) ( not ( = ?auto_1213993 ?auto_1213999 ) ) ( not ( = ?auto_1213993 ?auto_1214000 ) ) ( not ( = ?auto_1213993 ?auto_1214001 ) ) ( not ( = ?auto_1213993 ?auto_1214002 ) ) ( not ( = ?auto_1213993 ?auto_1214006 ) ) ( not ( = ?auto_1213994 ?auto_1213995 ) ) ( not ( = ?auto_1213994 ?auto_1213996 ) ) ( not ( = ?auto_1213994 ?auto_1213997 ) ) ( not ( = ?auto_1213994 ?auto_1213998 ) ) ( not ( = ?auto_1213994 ?auto_1213999 ) ) ( not ( = ?auto_1213994 ?auto_1214000 ) ) ( not ( = ?auto_1213994 ?auto_1214001 ) ) ( not ( = ?auto_1213994 ?auto_1214002 ) ) ( not ( = ?auto_1213994 ?auto_1214006 ) ) ( not ( = ?auto_1213995 ?auto_1213996 ) ) ( not ( = ?auto_1213995 ?auto_1213997 ) ) ( not ( = ?auto_1213995 ?auto_1213998 ) ) ( not ( = ?auto_1213995 ?auto_1213999 ) ) ( not ( = ?auto_1213995 ?auto_1214000 ) ) ( not ( = ?auto_1213995 ?auto_1214001 ) ) ( not ( = ?auto_1213995 ?auto_1214002 ) ) ( not ( = ?auto_1213995 ?auto_1214006 ) ) ( not ( = ?auto_1213996 ?auto_1213997 ) ) ( not ( = ?auto_1213996 ?auto_1213998 ) ) ( not ( = ?auto_1213996 ?auto_1213999 ) ) ( not ( = ?auto_1213996 ?auto_1214000 ) ) ( not ( = ?auto_1213996 ?auto_1214001 ) ) ( not ( = ?auto_1213996 ?auto_1214002 ) ) ( not ( = ?auto_1213996 ?auto_1214006 ) ) ( not ( = ?auto_1213997 ?auto_1213998 ) ) ( not ( = ?auto_1213997 ?auto_1213999 ) ) ( not ( = ?auto_1213997 ?auto_1214000 ) ) ( not ( = ?auto_1213997 ?auto_1214001 ) ) ( not ( = ?auto_1213997 ?auto_1214002 ) ) ( not ( = ?auto_1213997 ?auto_1214006 ) ) ( not ( = ?auto_1213998 ?auto_1213999 ) ) ( not ( = ?auto_1213998 ?auto_1214000 ) ) ( not ( = ?auto_1213998 ?auto_1214001 ) ) ( not ( = ?auto_1213998 ?auto_1214002 ) ) ( not ( = ?auto_1213998 ?auto_1214006 ) ) ( not ( = ?auto_1213999 ?auto_1214000 ) ) ( not ( = ?auto_1213999 ?auto_1214001 ) ) ( not ( = ?auto_1213999 ?auto_1214002 ) ) ( not ( = ?auto_1213999 ?auto_1214006 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1214000 ?auto_1214001 ?auto_1214002 )
      ( MAKE-12CRATE-VERIFY ?auto_1213990 ?auto_1213991 ?auto_1213992 ?auto_1213993 ?auto_1213994 ?auto_1213995 ?auto_1213996 ?auto_1213997 ?auto_1213998 ?auto_1213999 ?auto_1214000 ?auto_1214001 ?auto_1214002 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1225594 - SURFACE
      ?auto_1225595 - SURFACE
      ?auto_1225596 - SURFACE
      ?auto_1225597 - SURFACE
      ?auto_1225598 - SURFACE
      ?auto_1225599 - SURFACE
      ?auto_1225600 - SURFACE
      ?auto_1225601 - SURFACE
      ?auto_1225602 - SURFACE
      ?auto_1225603 - SURFACE
      ?auto_1225604 - SURFACE
      ?auto_1225605 - SURFACE
      ?auto_1225606 - SURFACE
      ?auto_1225607 - SURFACE
    )
    :vars
    (
      ?auto_1225609 - HOIST
      ?auto_1225608 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1225609 ?auto_1225608 ) ( SURFACE-AT ?auto_1225606 ?auto_1225608 ) ( CLEAR ?auto_1225606 ) ( LIFTING ?auto_1225609 ?auto_1225607 ) ( IS-CRATE ?auto_1225607 ) ( not ( = ?auto_1225606 ?auto_1225607 ) ) ( ON ?auto_1225595 ?auto_1225594 ) ( ON ?auto_1225596 ?auto_1225595 ) ( ON ?auto_1225597 ?auto_1225596 ) ( ON ?auto_1225598 ?auto_1225597 ) ( ON ?auto_1225599 ?auto_1225598 ) ( ON ?auto_1225600 ?auto_1225599 ) ( ON ?auto_1225601 ?auto_1225600 ) ( ON ?auto_1225602 ?auto_1225601 ) ( ON ?auto_1225603 ?auto_1225602 ) ( ON ?auto_1225604 ?auto_1225603 ) ( ON ?auto_1225605 ?auto_1225604 ) ( ON ?auto_1225606 ?auto_1225605 ) ( not ( = ?auto_1225594 ?auto_1225595 ) ) ( not ( = ?auto_1225594 ?auto_1225596 ) ) ( not ( = ?auto_1225594 ?auto_1225597 ) ) ( not ( = ?auto_1225594 ?auto_1225598 ) ) ( not ( = ?auto_1225594 ?auto_1225599 ) ) ( not ( = ?auto_1225594 ?auto_1225600 ) ) ( not ( = ?auto_1225594 ?auto_1225601 ) ) ( not ( = ?auto_1225594 ?auto_1225602 ) ) ( not ( = ?auto_1225594 ?auto_1225603 ) ) ( not ( = ?auto_1225594 ?auto_1225604 ) ) ( not ( = ?auto_1225594 ?auto_1225605 ) ) ( not ( = ?auto_1225594 ?auto_1225606 ) ) ( not ( = ?auto_1225594 ?auto_1225607 ) ) ( not ( = ?auto_1225595 ?auto_1225596 ) ) ( not ( = ?auto_1225595 ?auto_1225597 ) ) ( not ( = ?auto_1225595 ?auto_1225598 ) ) ( not ( = ?auto_1225595 ?auto_1225599 ) ) ( not ( = ?auto_1225595 ?auto_1225600 ) ) ( not ( = ?auto_1225595 ?auto_1225601 ) ) ( not ( = ?auto_1225595 ?auto_1225602 ) ) ( not ( = ?auto_1225595 ?auto_1225603 ) ) ( not ( = ?auto_1225595 ?auto_1225604 ) ) ( not ( = ?auto_1225595 ?auto_1225605 ) ) ( not ( = ?auto_1225595 ?auto_1225606 ) ) ( not ( = ?auto_1225595 ?auto_1225607 ) ) ( not ( = ?auto_1225596 ?auto_1225597 ) ) ( not ( = ?auto_1225596 ?auto_1225598 ) ) ( not ( = ?auto_1225596 ?auto_1225599 ) ) ( not ( = ?auto_1225596 ?auto_1225600 ) ) ( not ( = ?auto_1225596 ?auto_1225601 ) ) ( not ( = ?auto_1225596 ?auto_1225602 ) ) ( not ( = ?auto_1225596 ?auto_1225603 ) ) ( not ( = ?auto_1225596 ?auto_1225604 ) ) ( not ( = ?auto_1225596 ?auto_1225605 ) ) ( not ( = ?auto_1225596 ?auto_1225606 ) ) ( not ( = ?auto_1225596 ?auto_1225607 ) ) ( not ( = ?auto_1225597 ?auto_1225598 ) ) ( not ( = ?auto_1225597 ?auto_1225599 ) ) ( not ( = ?auto_1225597 ?auto_1225600 ) ) ( not ( = ?auto_1225597 ?auto_1225601 ) ) ( not ( = ?auto_1225597 ?auto_1225602 ) ) ( not ( = ?auto_1225597 ?auto_1225603 ) ) ( not ( = ?auto_1225597 ?auto_1225604 ) ) ( not ( = ?auto_1225597 ?auto_1225605 ) ) ( not ( = ?auto_1225597 ?auto_1225606 ) ) ( not ( = ?auto_1225597 ?auto_1225607 ) ) ( not ( = ?auto_1225598 ?auto_1225599 ) ) ( not ( = ?auto_1225598 ?auto_1225600 ) ) ( not ( = ?auto_1225598 ?auto_1225601 ) ) ( not ( = ?auto_1225598 ?auto_1225602 ) ) ( not ( = ?auto_1225598 ?auto_1225603 ) ) ( not ( = ?auto_1225598 ?auto_1225604 ) ) ( not ( = ?auto_1225598 ?auto_1225605 ) ) ( not ( = ?auto_1225598 ?auto_1225606 ) ) ( not ( = ?auto_1225598 ?auto_1225607 ) ) ( not ( = ?auto_1225599 ?auto_1225600 ) ) ( not ( = ?auto_1225599 ?auto_1225601 ) ) ( not ( = ?auto_1225599 ?auto_1225602 ) ) ( not ( = ?auto_1225599 ?auto_1225603 ) ) ( not ( = ?auto_1225599 ?auto_1225604 ) ) ( not ( = ?auto_1225599 ?auto_1225605 ) ) ( not ( = ?auto_1225599 ?auto_1225606 ) ) ( not ( = ?auto_1225599 ?auto_1225607 ) ) ( not ( = ?auto_1225600 ?auto_1225601 ) ) ( not ( = ?auto_1225600 ?auto_1225602 ) ) ( not ( = ?auto_1225600 ?auto_1225603 ) ) ( not ( = ?auto_1225600 ?auto_1225604 ) ) ( not ( = ?auto_1225600 ?auto_1225605 ) ) ( not ( = ?auto_1225600 ?auto_1225606 ) ) ( not ( = ?auto_1225600 ?auto_1225607 ) ) ( not ( = ?auto_1225601 ?auto_1225602 ) ) ( not ( = ?auto_1225601 ?auto_1225603 ) ) ( not ( = ?auto_1225601 ?auto_1225604 ) ) ( not ( = ?auto_1225601 ?auto_1225605 ) ) ( not ( = ?auto_1225601 ?auto_1225606 ) ) ( not ( = ?auto_1225601 ?auto_1225607 ) ) ( not ( = ?auto_1225602 ?auto_1225603 ) ) ( not ( = ?auto_1225602 ?auto_1225604 ) ) ( not ( = ?auto_1225602 ?auto_1225605 ) ) ( not ( = ?auto_1225602 ?auto_1225606 ) ) ( not ( = ?auto_1225602 ?auto_1225607 ) ) ( not ( = ?auto_1225603 ?auto_1225604 ) ) ( not ( = ?auto_1225603 ?auto_1225605 ) ) ( not ( = ?auto_1225603 ?auto_1225606 ) ) ( not ( = ?auto_1225603 ?auto_1225607 ) ) ( not ( = ?auto_1225604 ?auto_1225605 ) ) ( not ( = ?auto_1225604 ?auto_1225606 ) ) ( not ( = ?auto_1225604 ?auto_1225607 ) ) ( not ( = ?auto_1225605 ?auto_1225606 ) ) ( not ( = ?auto_1225605 ?auto_1225607 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1225606 ?auto_1225607 )
      ( MAKE-13CRATE-VERIFY ?auto_1225594 ?auto_1225595 ?auto_1225596 ?auto_1225597 ?auto_1225598 ?auto_1225599 ?auto_1225600 ?auto_1225601 ?auto_1225602 ?auto_1225603 ?auto_1225604 ?auto_1225605 ?auto_1225606 ?auto_1225607 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1225736 - SURFACE
      ?auto_1225737 - SURFACE
      ?auto_1225738 - SURFACE
      ?auto_1225739 - SURFACE
      ?auto_1225740 - SURFACE
      ?auto_1225741 - SURFACE
      ?auto_1225742 - SURFACE
      ?auto_1225743 - SURFACE
      ?auto_1225744 - SURFACE
      ?auto_1225745 - SURFACE
      ?auto_1225746 - SURFACE
      ?auto_1225747 - SURFACE
      ?auto_1225748 - SURFACE
      ?auto_1225749 - SURFACE
    )
    :vars
    (
      ?auto_1225751 - HOIST
      ?auto_1225750 - PLACE
      ?auto_1225752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1225751 ?auto_1225750 ) ( SURFACE-AT ?auto_1225748 ?auto_1225750 ) ( CLEAR ?auto_1225748 ) ( IS-CRATE ?auto_1225749 ) ( not ( = ?auto_1225748 ?auto_1225749 ) ) ( TRUCK-AT ?auto_1225752 ?auto_1225750 ) ( AVAILABLE ?auto_1225751 ) ( IN ?auto_1225749 ?auto_1225752 ) ( ON ?auto_1225748 ?auto_1225747 ) ( not ( = ?auto_1225747 ?auto_1225748 ) ) ( not ( = ?auto_1225747 ?auto_1225749 ) ) ( ON ?auto_1225737 ?auto_1225736 ) ( ON ?auto_1225738 ?auto_1225737 ) ( ON ?auto_1225739 ?auto_1225738 ) ( ON ?auto_1225740 ?auto_1225739 ) ( ON ?auto_1225741 ?auto_1225740 ) ( ON ?auto_1225742 ?auto_1225741 ) ( ON ?auto_1225743 ?auto_1225742 ) ( ON ?auto_1225744 ?auto_1225743 ) ( ON ?auto_1225745 ?auto_1225744 ) ( ON ?auto_1225746 ?auto_1225745 ) ( ON ?auto_1225747 ?auto_1225746 ) ( not ( = ?auto_1225736 ?auto_1225737 ) ) ( not ( = ?auto_1225736 ?auto_1225738 ) ) ( not ( = ?auto_1225736 ?auto_1225739 ) ) ( not ( = ?auto_1225736 ?auto_1225740 ) ) ( not ( = ?auto_1225736 ?auto_1225741 ) ) ( not ( = ?auto_1225736 ?auto_1225742 ) ) ( not ( = ?auto_1225736 ?auto_1225743 ) ) ( not ( = ?auto_1225736 ?auto_1225744 ) ) ( not ( = ?auto_1225736 ?auto_1225745 ) ) ( not ( = ?auto_1225736 ?auto_1225746 ) ) ( not ( = ?auto_1225736 ?auto_1225747 ) ) ( not ( = ?auto_1225736 ?auto_1225748 ) ) ( not ( = ?auto_1225736 ?auto_1225749 ) ) ( not ( = ?auto_1225737 ?auto_1225738 ) ) ( not ( = ?auto_1225737 ?auto_1225739 ) ) ( not ( = ?auto_1225737 ?auto_1225740 ) ) ( not ( = ?auto_1225737 ?auto_1225741 ) ) ( not ( = ?auto_1225737 ?auto_1225742 ) ) ( not ( = ?auto_1225737 ?auto_1225743 ) ) ( not ( = ?auto_1225737 ?auto_1225744 ) ) ( not ( = ?auto_1225737 ?auto_1225745 ) ) ( not ( = ?auto_1225737 ?auto_1225746 ) ) ( not ( = ?auto_1225737 ?auto_1225747 ) ) ( not ( = ?auto_1225737 ?auto_1225748 ) ) ( not ( = ?auto_1225737 ?auto_1225749 ) ) ( not ( = ?auto_1225738 ?auto_1225739 ) ) ( not ( = ?auto_1225738 ?auto_1225740 ) ) ( not ( = ?auto_1225738 ?auto_1225741 ) ) ( not ( = ?auto_1225738 ?auto_1225742 ) ) ( not ( = ?auto_1225738 ?auto_1225743 ) ) ( not ( = ?auto_1225738 ?auto_1225744 ) ) ( not ( = ?auto_1225738 ?auto_1225745 ) ) ( not ( = ?auto_1225738 ?auto_1225746 ) ) ( not ( = ?auto_1225738 ?auto_1225747 ) ) ( not ( = ?auto_1225738 ?auto_1225748 ) ) ( not ( = ?auto_1225738 ?auto_1225749 ) ) ( not ( = ?auto_1225739 ?auto_1225740 ) ) ( not ( = ?auto_1225739 ?auto_1225741 ) ) ( not ( = ?auto_1225739 ?auto_1225742 ) ) ( not ( = ?auto_1225739 ?auto_1225743 ) ) ( not ( = ?auto_1225739 ?auto_1225744 ) ) ( not ( = ?auto_1225739 ?auto_1225745 ) ) ( not ( = ?auto_1225739 ?auto_1225746 ) ) ( not ( = ?auto_1225739 ?auto_1225747 ) ) ( not ( = ?auto_1225739 ?auto_1225748 ) ) ( not ( = ?auto_1225739 ?auto_1225749 ) ) ( not ( = ?auto_1225740 ?auto_1225741 ) ) ( not ( = ?auto_1225740 ?auto_1225742 ) ) ( not ( = ?auto_1225740 ?auto_1225743 ) ) ( not ( = ?auto_1225740 ?auto_1225744 ) ) ( not ( = ?auto_1225740 ?auto_1225745 ) ) ( not ( = ?auto_1225740 ?auto_1225746 ) ) ( not ( = ?auto_1225740 ?auto_1225747 ) ) ( not ( = ?auto_1225740 ?auto_1225748 ) ) ( not ( = ?auto_1225740 ?auto_1225749 ) ) ( not ( = ?auto_1225741 ?auto_1225742 ) ) ( not ( = ?auto_1225741 ?auto_1225743 ) ) ( not ( = ?auto_1225741 ?auto_1225744 ) ) ( not ( = ?auto_1225741 ?auto_1225745 ) ) ( not ( = ?auto_1225741 ?auto_1225746 ) ) ( not ( = ?auto_1225741 ?auto_1225747 ) ) ( not ( = ?auto_1225741 ?auto_1225748 ) ) ( not ( = ?auto_1225741 ?auto_1225749 ) ) ( not ( = ?auto_1225742 ?auto_1225743 ) ) ( not ( = ?auto_1225742 ?auto_1225744 ) ) ( not ( = ?auto_1225742 ?auto_1225745 ) ) ( not ( = ?auto_1225742 ?auto_1225746 ) ) ( not ( = ?auto_1225742 ?auto_1225747 ) ) ( not ( = ?auto_1225742 ?auto_1225748 ) ) ( not ( = ?auto_1225742 ?auto_1225749 ) ) ( not ( = ?auto_1225743 ?auto_1225744 ) ) ( not ( = ?auto_1225743 ?auto_1225745 ) ) ( not ( = ?auto_1225743 ?auto_1225746 ) ) ( not ( = ?auto_1225743 ?auto_1225747 ) ) ( not ( = ?auto_1225743 ?auto_1225748 ) ) ( not ( = ?auto_1225743 ?auto_1225749 ) ) ( not ( = ?auto_1225744 ?auto_1225745 ) ) ( not ( = ?auto_1225744 ?auto_1225746 ) ) ( not ( = ?auto_1225744 ?auto_1225747 ) ) ( not ( = ?auto_1225744 ?auto_1225748 ) ) ( not ( = ?auto_1225744 ?auto_1225749 ) ) ( not ( = ?auto_1225745 ?auto_1225746 ) ) ( not ( = ?auto_1225745 ?auto_1225747 ) ) ( not ( = ?auto_1225745 ?auto_1225748 ) ) ( not ( = ?auto_1225745 ?auto_1225749 ) ) ( not ( = ?auto_1225746 ?auto_1225747 ) ) ( not ( = ?auto_1225746 ?auto_1225748 ) ) ( not ( = ?auto_1225746 ?auto_1225749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1225747 ?auto_1225748 ?auto_1225749 )
      ( MAKE-13CRATE-VERIFY ?auto_1225736 ?auto_1225737 ?auto_1225738 ?auto_1225739 ?auto_1225740 ?auto_1225741 ?auto_1225742 ?auto_1225743 ?auto_1225744 ?auto_1225745 ?auto_1225746 ?auto_1225747 ?auto_1225748 ?auto_1225749 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1225892 - SURFACE
      ?auto_1225893 - SURFACE
      ?auto_1225894 - SURFACE
      ?auto_1225895 - SURFACE
      ?auto_1225896 - SURFACE
      ?auto_1225897 - SURFACE
      ?auto_1225898 - SURFACE
      ?auto_1225899 - SURFACE
      ?auto_1225900 - SURFACE
      ?auto_1225901 - SURFACE
      ?auto_1225902 - SURFACE
      ?auto_1225903 - SURFACE
      ?auto_1225904 - SURFACE
      ?auto_1225905 - SURFACE
    )
    :vars
    (
      ?auto_1225906 - HOIST
      ?auto_1225909 - PLACE
      ?auto_1225908 - TRUCK
      ?auto_1225907 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1225906 ?auto_1225909 ) ( SURFACE-AT ?auto_1225904 ?auto_1225909 ) ( CLEAR ?auto_1225904 ) ( IS-CRATE ?auto_1225905 ) ( not ( = ?auto_1225904 ?auto_1225905 ) ) ( AVAILABLE ?auto_1225906 ) ( IN ?auto_1225905 ?auto_1225908 ) ( ON ?auto_1225904 ?auto_1225903 ) ( not ( = ?auto_1225903 ?auto_1225904 ) ) ( not ( = ?auto_1225903 ?auto_1225905 ) ) ( TRUCK-AT ?auto_1225908 ?auto_1225907 ) ( not ( = ?auto_1225907 ?auto_1225909 ) ) ( ON ?auto_1225893 ?auto_1225892 ) ( ON ?auto_1225894 ?auto_1225893 ) ( ON ?auto_1225895 ?auto_1225894 ) ( ON ?auto_1225896 ?auto_1225895 ) ( ON ?auto_1225897 ?auto_1225896 ) ( ON ?auto_1225898 ?auto_1225897 ) ( ON ?auto_1225899 ?auto_1225898 ) ( ON ?auto_1225900 ?auto_1225899 ) ( ON ?auto_1225901 ?auto_1225900 ) ( ON ?auto_1225902 ?auto_1225901 ) ( ON ?auto_1225903 ?auto_1225902 ) ( not ( = ?auto_1225892 ?auto_1225893 ) ) ( not ( = ?auto_1225892 ?auto_1225894 ) ) ( not ( = ?auto_1225892 ?auto_1225895 ) ) ( not ( = ?auto_1225892 ?auto_1225896 ) ) ( not ( = ?auto_1225892 ?auto_1225897 ) ) ( not ( = ?auto_1225892 ?auto_1225898 ) ) ( not ( = ?auto_1225892 ?auto_1225899 ) ) ( not ( = ?auto_1225892 ?auto_1225900 ) ) ( not ( = ?auto_1225892 ?auto_1225901 ) ) ( not ( = ?auto_1225892 ?auto_1225902 ) ) ( not ( = ?auto_1225892 ?auto_1225903 ) ) ( not ( = ?auto_1225892 ?auto_1225904 ) ) ( not ( = ?auto_1225892 ?auto_1225905 ) ) ( not ( = ?auto_1225893 ?auto_1225894 ) ) ( not ( = ?auto_1225893 ?auto_1225895 ) ) ( not ( = ?auto_1225893 ?auto_1225896 ) ) ( not ( = ?auto_1225893 ?auto_1225897 ) ) ( not ( = ?auto_1225893 ?auto_1225898 ) ) ( not ( = ?auto_1225893 ?auto_1225899 ) ) ( not ( = ?auto_1225893 ?auto_1225900 ) ) ( not ( = ?auto_1225893 ?auto_1225901 ) ) ( not ( = ?auto_1225893 ?auto_1225902 ) ) ( not ( = ?auto_1225893 ?auto_1225903 ) ) ( not ( = ?auto_1225893 ?auto_1225904 ) ) ( not ( = ?auto_1225893 ?auto_1225905 ) ) ( not ( = ?auto_1225894 ?auto_1225895 ) ) ( not ( = ?auto_1225894 ?auto_1225896 ) ) ( not ( = ?auto_1225894 ?auto_1225897 ) ) ( not ( = ?auto_1225894 ?auto_1225898 ) ) ( not ( = ?auto_1225894 ?auto_1225899 ) ) ( not ( = ?auto_1225894 ?auto_1225900 ) ) ( not ( = ?auto_1225894 ?auto_1225901 ) ) ( not ( = ?auto_1225894 ?auto_1225902 ) ) ( not ( = ?auto_1225894 ?auto_1225903 ) ) ( not ( = ?auto_1225894 ?auto_1225904 ) ) ( not ( = ?auto_1225894 ?auto_1225905 ) ) ( not ( = ?auto_1225895 ?auto_1225896 ) ) ( not ( = ?auto_1225895 ?auto_1225897 ) ) ( not ( = ?auto_1225895 ?auto_1225898 ) ) ( not ( = ?auto_1225895 ?auto_1225899 ) ) ( not ( = ?auto_1225895 ?auto_1225900 ) ) ( not ( = ?auto_1225895 ?auto_1225901 ) ) ( not ( = ?auto_1225895 ?auto_1225902 ) ) ( not ( = ?auto_1225895 ?auto_1225903 ) ) ( not ( = ?auto_1225895 ?auto_1225904 ) ) ( not ( = ?auto_1225895 ?auto_1225905 ) ) ( not ( = ?auto_1225896 ?auto_1225897 ) ) ( not ( = ?auto_1225896 ?auto_1225898 ) ) ( not ( = ?auto_1225896 ?auto_1225899 ) ) ( not ( = ?auto_1225896 ?auto_1225900 ) ) ( not ( = ?auto_1225896 ?auto_1225901 ) ) ( not ( = ?auto_1225896 ?auto_1225902 ) ) ( not ( = ?auto_1225896 ?auto_1225903 ) ) ( not ( = ?auto_1225896 ?auto_1225904 ) ) ( not ( = ?auto_1225896 ?auto_1225905 ) ) ( not ( = ?auto_1225897 ?auto_1225898 ) ) ( not ( = ?auto_1225897 ?auto_1225899 ) ) ( not ( = ?auto_1225897 ?auto_1225900 ) ) ( not ( = ?auto_1225897 ?auto_1225901 ) ) ( not ( = ?auto_1225897 ?auto_1225902 ) ) ( not ( = ?auto_1225897 ?auto_1225903 ) ) ( not ( = ?auto_1225897 ?auto_1225904 ) ) ( not ( = ?auto_1225897 ?auto_1225905 ) ) ( not ( = ?auto_1225898 ?auto_1225899 ) ) ( not ( = ?auto_1225898 ?auto_1225900 ) ) ( not ( = ?auto_1225898 ?auto_1225901 ) ) ( not ( = ?auto_1225898 ?auto_1225902 ) ) ( not ( = ?auto_1225898 ?auto_1225903 ) ) ( not ( = ?auto_1225898 ?auto_1225904 ) ) ( not ( = ?auto_1225898 ?auto_1225905 ) ) ( not ( = ?auto_1225899 ?auto_1225900 ) ) ( not ( = ?auto_1225899 ?auto_1225901 ) ) ( not ( = ?auto_1225899 ?auto_1225902 ) ) ( not ( = ?auto_1225899 ?auto_1225903 ) ) ( not ( = ?auto_1225899 ?auto_1225904 ) ) ( not ( = ?auto_1225899 ?auto_1225905 ) ) ( not ( = ?auto_1225900 ?auto_1225901 ) ) ( not ( = ?auto_1225900 ?auto_1225902 ) ) ( not ( = ?auto_1225900 ?auto_1225903 ) ) ( not ( = ?auto_1225900 ?auto_1225904 ) ) ( not ( = ?auto_1225900 ?auto_1225905 ) ) ( not ( = ?auto_1225901 ?auto_1225902 ) ) ( not ( = ?auto_1225901 ?auto_1225903 ) ) ( not ( = ?auto_1225901 ?auto_1225904 ) ) ( not ( = ?auto_1225901 ?auto_1225905 ) ) ( not ( = ?auto_1225902 ?auto_1225903 ) ) ( not ( = ?auto_1225902 ?auto_1225904 ) ) ( not ( = ?auto_1225902 ?auto_1225905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1225903 ?auto_1225904 ?auto_1225905 )
      ( MAKE-13CRATE-VERIFY ?auto_1225892 ?auto_1225893 ?auto_1225894 ?auto_1225895 ?auto_1225896 ?auto_1225897 ?auto_1225898 ?auto_1225899 ?auto_1225900 ?auto_1225901 ?auto_1225902 ?auto_1225903 ?auto_1225904 ?auto_1225905 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1226061 - SURFACE
      ?auto_1226062 - SURFACE
      ?auto_1226063 - SURFACE
      ?auto_1226064 - SURFACE
      ?auto_1226065 - SURFACE
      ?auto_1226066 - SURFACE
      ?auto_1226067 - SURFACE
      ?auto_1226068 - SURFACE
      ?auto_1226069 - SURFACE
      ?auto_1226070 - SURFACE
      ?auto_1226071 - SURFACE
      ?auto_1226072 - SURFACE
      ?auto_1226073 - SURFACE
      ?auto_1226074 - SURFACE
    )
    :vars
    (
      ?auto_1226078 - HOIST
      ?auto_1226076 - PLACE
      ?auto_1226077 - TRUCK
      ?auto_1226075 - PLACE
      ?auto_1226079 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1226078 ?auto_1226076 ) ( SURFACE-AT ?auto_1226073 ?auto_1226076 ) ( CLEAR ?auto_1226073 ) ( IS-CRATE ?auto_1226074 ) ( not ( = ?auto_1226073 ?auto_1226074 ) ) ( AVAILABLE ?auto_1226078 ) ( ON ?auto_1226073 ?auto_1226072 ) ( not ( = ?auto_1226072 ?auto_1226073 ) ) ( not ( = ?auto_1226072 ?auto_1226074 ) ) ( TRUCK-AT ?auto_1226077 ?auto_1226075 ) ( not ( = ?auto_1226075 ?auto_1226076 ) ) ( HOIST-AT ?auto_1226079 ?auto_1226075 ) ( LIFTING ?auto_1226079 ?auto_1226074 ) ( not ( = ?auto_1226078 ?auto_1226079 ) ) ( ON ?auto_1226062 ?auto_1226061 ) ( ON ?auto_1226063 ?auto_1226062 ) ( ON ?auto_1226064 ?auto_1226063 ) ( ON ?auto_1226065 ?auto_1226064 ) ( ON ?auto_1226066 ?auto_1226065 ) ( ON ?auto_1226067 ?auto_1226066 ) ( ON ?auto_1226068 ?auto_1226067 ) ( ON ?auto_1226069 ?auto_1226068 ) ( ON ?auto_1226070 ?auto_1226069 ) ( ON ?auto_1226071 ?auto_1226070 ) ( ON ?auto_1226072 ?auto_1226071 ) ( not ( = ?auto_1226061 ?auto_1226062 ) ) ( not ( = ?auto_1226061 ?auto_1226063 ) ) ( not ( = ?auto_1226061 ?auto_1226064 ) ) ( not ( = ?auto_1226061 ?auto_1226065 ) ) ( not ( = ?auto_1226061 ?auto_1226066 ) ) ( not ( = ?auto_1226061 ?auto_1226067 ) ) ( not ( = ?auto_1226061 ?auto_1226068 ) ) ( not ( = ?auto_1226061 ?auto_1226069 ) ) ( not ( = ?auto_1226061 ?auto_1226070 ) ) ( not ( = ?auto_1226061 ?auto_1226071 ) ) ( not ( = ?auto_1226061 ?auto_1226072 ) ) ( not ( = ?auto_1226061 ?auto_1226073 ) ) ( not ( = ?auto_1226061 ?auto_1226074 ) ) ( not ( = ?auto_1226062 ?auto_1226063 ) ) ( not ( = ?auto_1226062 ?auto_1226064 ) ) ( not ( = ?auto_1226062 ?auto_1226065 ) ) ( not ( = ?auto_1226062 ?auto_1226066 ) ) ( not ( = ?auto_1226062 ?auto_1226067 ) ) ( not ( = ?auto_1226062 ?auto_1226068 ) ) ( not ( = ?auto_1226062 ?auto_1226069 ) ) ( not ( = ?auto_1226062 ?auto_1226070 ) ) ( not ( = ?auto_1226062 ?auto_1226071 ) ) ( not ( = ?auto_1226062 ?auto_1226072 ) ) ( not ( = ?auto_1226062 ?auto_1226073 ) ) ( not ( = ?auto_1226062 ?auto_1226074 ) ) ( not ( = ?auto_1226063 ?auto_1226064 ) ) ( not ( = ?auto_1226063 ?auto_1226065 ) ) ( not ( = ?auto_1226063 ?auto_1226066 ) ) ( not ( = ?auto_1226063 ?auto_1226067 ) ) ( not ( = ?auto_1226063 ?auto_1226068 ) ) ( not ( = ?auto_1226063 ?auto_1226069 ) ) ( not ( = ?auto_1226063 ?auto_1226070 ) ) ( not ( = ?auto_1226063 ?auto_1226071 ) ) ( not ( = ?auto_1226063 ?auto_1226072 ) ) ( not ( = ?auto_1226063 ?auto_1226073 ) ) ( not ( = ?auto_1226063 ?auto_1226074 ) ) ( not ( = ?auto_1226064 ?auto_1226065 ) ) ( not ( = ?auto_1226064 ?auto_1226066 ) ) ( not ( = ?auto_1226064 ?auto_1226067 ) ) ( not ( = ?auto_1226064 ?auto_1226068 ) ) ( not ( = ?auto_1226064 ?auto_1226069 ) ) ( not ( = ?auto_1226064 ?auto_1226070 ) ) ( not ( = ?auto_1226064 ?auto_1226071 ) ) ( not ( = ?auto_1226064 ?auto_1226072 ) ) ( not ( = ?auto_1226064 ?auto_1226073 ) ) ( not ( = ?auto_1226064 ?auto_1226074 ) ) ( not ( = ?auto_1226065 ?auto_1226066 ) ) ( not ( = ?auto_1226065 ?auto_1226067 ) ) ( not ( = ?auto_1226065 ?auto_1226068 ) ) ( not ( = ?auto_1226065 ?auto_1226069 ) ) ( not ( = ?auto_1226065 ?auto_1226070 ) ) ( not ( = ?auto_1226065 ?auto_1226071 ) ) ( not ( = ?auto_1226065 ?auto_1226072 ) ) ( not ( = ?auto_1226065 ?auto_1226073 ) ) ( not ( = ?auto_1226065 ?auto_1226074 ) ) ( not ( = ?auto_1226066 ?auto_1226067 ) ) ( not ( = ?auto_1226066 ?auto_1226068 ) ) ( not ( = ?auto_1226066 ?auto_1226069 ) ) ( not ( = ?auto_1226066 ?auto_1226070 ) ) ( not ( = ?auto_1226066 ?auto_1226071 ) ) ( not ( = ?auto_1226066 ?auto_1226072 ) ) ( not ( = ?auto_1226066 ?auto_1226073 ) ) ( not ( = ?auto_1226066 ?auto_1226074 ) ) ( not ( = ?auto_1226067 ?auto_1226068 ) ) ( not ( = ?auto_1226067 ?auto_1226069 ) ) ( not ( = ?auto_1226067 ?auto_1226070 ) ) ( not ( = ?auto_1226067 ?auto_1226071 ) ) ( not ( = ?auto_1226067 ?auto_1226072 ) ) ( not ( = ?auto_1226067 ?auto_1226073 ) ) ( not ( = ?auto_1226067 ?auto_1226074 ) ) ( not ( = ?auto_1226068 ?auto_1226069 ) ) ( not ( = ?auto_1226068 ?auto_1226070 ) ) ( not ( = ?auto_1226068 ?auto_1226071 ) ) ( not ( = ?auto_1226068 ?auto_1226072 ) ) ( not ( = ?auto_1226068 ?auto_1226073 ) ) ( not ( = ?auto_1226068 ?auto_1226074 ) ) ( not ( = ?auto_1226069 ?auto_1226070 ) ) ( not ( = ?auto_1226069 ?auto_1226071 ) ) ( not ( = ?auto_1226069 ?auto_1226072 ) ) ( not ( = ?auto_1226069 ?auto_1226073 ) ) ( not ( = ?auto_1226069 ?auto_1226074 ) ) ( not ( = ?auto_1226070 ?auto_1226071 ) ) ( not ( = ?auto_1226070 ?auto_1226072 ) ) ( not ( = ?auto_1226070 ?auto_1226073 ) ) ( not ( = ?auto_1226070 ?auto_1226074 ) ) ( not ( = ?auto_1226071 ?auto_1226072 ) ) ( not ( = ?auto_1226071 ?auto_1226073 ) ) ( not ( = ?auto_1226071 ?auto_1226074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1226072 ?auto_1226073 ?auto_1226074 )
      ( MAKE-13CRATE-VERIFY ?auto_1226061 ?auto_1226062 ?auto_1226063 ?auto_1226064 ?auto_1226065 ?auto_1226066 ?auto_1226067 ?auto_1226068 ?auto_1226069 ?auto_1226070 ?auto_1226071 ?auto_1226072 ?auto_1226073 ?auto_1226074 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1226243 - SURFACE
      ?auto_1226244 - SURFACE
      ?auto_1226245 - SURFACE
      ?auto_1226246 - SURFACE
      ?auto_1226247 - SURFACE
      ?auto_1226248 - SURFACE
      ?auto_1226249 - SURFACE
      ?auto_1226250 - SURFACE
      ?auto_1226251 - SURFACE
      ?auto_1226252 - SURFACE
      ?auto_1226253 - SURFACE
      ?auto_1226254 - SURFACE
      ?auto_1226255 - SURFACE
      ?auto_1226256 - SURFACE
    )
    :vars
    (
      ?auto_1226262 - HOIST
      ?auto_1226261 - PLACE
      ?auto_1226258 - TRUCK
      ?auto_1226260 - PLACE
      ?auto_1226257 - HOIST
      ?auto_1226259 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1226262 ?auto_1226261 ) ( SURFACE-AT ?auto_1226255 ?auto_1226261 ) ( CLEAR ?auto_1226255 ) ( IS-CRATE ?auto_1226256 ) ( not ( = ?auto_1226255 ?auto_1226256 ) ) ( AVAILABLE ?auto_1226262 ) ( ON ?auto_1226255 ?auto_1226254 ) ( not ( = ?auto_1226254 ?auto_1226255 ) ) ( not ( = ?auto_1226254 ?auto_1226256 ) ) ( TRUCK-AT ?auto_1226258 ?auto_1226260 ) ( not ( = ?auto_1226260 ?auto_1226261 ) ) ( HOIST-AT ?auto_1226257 ?auto_1226260 ) ( not ( = ?auto_1226262 ?auto_1226257 ) ) ( AVAILABLE ?auto_1226257 ) ( SURFACE-AT ?auto_1226256 ?auto_1226260 ) ( ON ?auto_1226256 ?auto_1226259 ) ( CLEAR ?auto_1226256 ) ( not ( = ?auto_1226255 ?auto_1226259 ) ) ( not ( = ?auto_1226256 ?auto_1226259 ) ) ( not ( = ?auto_1226254 ?auto_1226259 ) ) ( ON ?auto_1226244 ?auto_1226243 ) ( ON ?auto_1226245 ?auto_1226244 ) ( ON ?auto_1226246 ?auto_1226245 ) ( ON ?auto_1226247 ?auto_1226246 ) ( ON ?auto_1226248 ?auto_1226247 ) ( ON ?auto_1226249 ?auto_1226248 ) ( ON ?auto_1226250 ?auto_1226249 ) ( ON ?auto_1226251 ?auto_1226250 ) ( ON ?auto_1226252 ?auto_1226251 ) ( ON ?auto_1226253 ?auto_1226252 ) ( ON ?auto_1226254 ?auto_1226253 ) ( not ( = ?auto_1226243 ?auto_1226244 ) ) ( not ( = ?auto_1226243 ?auto_1226245 ) ) ( not ( = ?auto_1226243 ?auto_1226246 ) ) ( not ( = ?auto_1226243 ?auto_1226247 ) ) ( not ( = ?auto_1226243 ?auto_1226248 ) ) ( not ( = ?auto_1226243 ?auto_1226249 ) ) ( not ( = ?auto_1226243 ?auto_1226250 ) ) ( not ( = ?auto_1226243 ?auto_1226251 ) ) ( not ( = ?auto_1226243 ?auto_1226252 ) ) ( not ( = ?auto_1226243 ?auto_1226253 ) ) ( not ( = ?auto_1226243 ?auto_1226254 ) ) ( not ( = ?auto_1226243 ?auto_1226255 ) ) ( not ( = ?auto_1226243 ?auto_1226256 ) ) ( not ( = ?auto_1226243 ?auto_1226259 ) ) ( not ( = ?auto_1226244 ?auto_1226245 ) ) ( not ( = ?auto_1226244 ?auto_1226246 ) ) ( not ( = ?auto_1226244 ?auto_1226247 ) ) ( not ( = ?auto_1226244 ?auto_1226248 ) ) ( not ( = ?auto_1226244 ?auto_1226249 ) ) ( not ( = ?auto_1226244 ?auto_1226250 ) ) ( not ( = ?auto_1226244 ?auto_1226251 ) ) ( not ( = ?auto_1226244 ?auto_1226252 ) ) ( not ( = ?auto_1226244 ?auto_1226253 ) ) ( not ( = ?auto_1226244 ?auto_1226254 ) ) ( not ( = ?auto_1226244 ?auto_1226255 ) ) ( not ( = ?auto_1226244 ?auto_1226256 ) ) ( not ( = ?auto_1226244 ?auto_1226259 ) ) ( not ( = ?auto_1226245 ?auto_1226246 ) ) ( not ( = ?auto_1226245 ?auto_1226247 ) ) ( not ( = ?auto_1226245 ?auto_1226248 ) ) ( not ( = ?auto_1226245 ?auto_1226249 ) ) ( not ( = ?auto_1226245 ?auto_1226250 ) ) ( not ( = ?auto_1226245 ?auto_1226251 ) ) ( not ( = ?auto_1226245 ?auto_1226252 ) ) ( not ( = ?auto_1226245 ?auto_1226253 ) ) ( not ( = ?auto_1226245 ?auto_1226254 ) ) ( not ( = ?auto_1226245 ?auto_1226255 ) ) ( not ( = ?auto_1226245 ?auto_1226256 ) ) ( not ( = ?auto_1226245 ?auto_1226259 ) ) ( not ( = ?auto_1226246 ?auto_1226247 ) ) ( not ( = ?auto_1226246 ?auto_1226248 ) ) ( not ( = ?auto_1226246 ?auto_1226249 ) ) ( not ( = ?auto_1226246 ?auto_1226250 ) ) ( not ( = ?auto_1226246 ?auto_1226251 ) ) ( not ( = ?auto_1226246 ?auto_1226252 ) ) ( not ( = ?auto_1226246 ?auto_1226253 ) ) ( not ( = ?auto_1226246 ?auto_1226254 ) ) ( not ( = ?auto_1226246 ?auto_1226255 ) ) ( not ( = ?auto_1226246 ?auto_1226256 ) ) ( not ( = ?auto_1226246 ?auto_1226259 ) ) ( not ( = ?auto_1226247 ?auto_1226248 ) ) ( not ( = ?auto_1226247 ?auto_1226249 ) ) ( not ( = ?auto_1226247 ?auto_1226250 ) ) ( not ( = ?auto_1226247 ?auto_1226251 ) ) ( not ( = ?auto_1226247 ?auto_1226252 ) ) ( not ( = ?auto_1226247 ?auto_1226253 ) ) ( not ( = ?auto_1226247 ?auto_1226254 ) ) ( not ( = ?auto_1226247 ?auto_1226255 ) ) ( not ( = ?auto_1226247 ?auto_1226256 ) ) ( not ( = ?auto_1226247 ?auto_1226259 ) ) ( not ( = ?auto_1226248 ?auto_1226249 ) ) ( not ( = ?auto_1226248 ?auto_1226250 ) ) ( not ( = ?auto_1226248 ?auto_1226251 ) ) ( not ( = ?auto_1226248 ?auto_1226252 ) ) ( not ( = ?auto_1226248 ?auto_1226253 ) ) ( not ( = ?auto_1226248 ?auto_1226254 ) ) ( not ( = ?auto_1226248 ?auto_1226255 ) ) ( not ( = ?auto_1226248 ?auto_1226256 ) ) ( not ( = ?auto_1226248 ?auto_1226259 ) ) ( not ( = ?auto_1226249 ?auto_1226250 ) ) ( not ( = ?auto_1226249 ?auto_1226251 ) ) ( not ( = ?auto_1226249 ?auto_1226252 ) ) ( not ( = ?auto_1226249 ?auto_1226253 ) ) ( not ( = ?auto_1226249 ?auto_1226254 ) ) ( not ( = ?auto_1226249 ?auto_1226255 ) ) ( not ( = ?auto_1226249 ?auto_1226256 ) ) ( not ( = ?auto_1226249 ?auto_1226259 ) ) ( not ( = ?auto_1226250 ?auto_1226251 ) ) ( not ( = ?auto_1226250 ?auto_1226252 ) ) ( not ( = ?auto_1226250 ?auto_1226253 ) ) ( not ( = ?auto_1226250 ?auto_1226254 ) ) ( not ( = ?auto_1226250 ?auto_1226255 ) ) ( not ( = ?auto_1226250 ?auto_1226256 ) ) ( not ( = ?auto_1226250 ?auto_1226259 ) ) ( not ( = ?auto_1226251 ?auto_1226252 ) ) ( not ( = ?auto_1226251 ?auto_1226253 ) ) ( not ( = ?auto_1226251 ?auto_1226254 ) ) ( not ( = ?auto_1226251 ?auto_1226255 ) ) ( not ( = ?auto_1226251 ?auto_1226256 ) ) ( not ( = ?auto_1226251 ?auto_1226259 ) ) ( not ( = ?auto_1226252 ?auto_1226253 ) ) ( not ( = ?auto_1226252 ?auto_1226254 ) ) ( not ( = ?auto_1226252 ?auto_1226255 ) ) ( not ( = ?auto_1226252 ?auto_1226256 ) ) ( not ( = ?auto_1226252 ?auto_1226259 ) ) ( not ( = ?auto_1226253 ?auto_1226254 ) ) ( not ( = ?auto_1226253 ?auto_1226255 ) ) ( not ( = ?auto_1226253 ?auto_1226256 ) ) ( not ( = ?auto_1226253 ?auto_1226259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1226254 ?auto_1226255 ?auto_1226256 )
      ( MAKE-13CRATE-VERIFY ?auto_1226243 ?auto_1226244 ?auto_1226245 ?auto_1226246 ?auto_1226247 ?auto_1226248 ?auto_1226249 ?auto_1226250 ?auto_1226251 ?auto_1226252 ?auto_1226253 ?auto_1226254 ?auto_1226255 ?auto_1226256 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1226426 - SURFACE
      ?auto_1226427 - SURFACE
      ?auto_1226428 - SURFACE
      ?auto_1226429 - SURFACE
      ?auto_1226430 - SURFACE
      ?auto_1226431 - SURFACE
      ?auto_1226432 - SURFACE
      ?auto_1226433 - SURFACE
      ?auto_1226434 - SURFACE
      ?auto_1226435 - SURFACE
      ?auto_1226436 - SURFACE
      ?auto_1226437 - SURFACE
      ?auto_1226438 - SURFACE
      ?auto_1226439 - SURFACE
    )
    :vars
    (
      ?auto_1226445 - HOIST
      ?auto_1226442 - PLACE
      ?auto_1226443 - PLACE
      ?auto_1226441 - HOIST
      ?auto_1226440 - SURFACE
      ?auto_1226444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1226445 ?auto_1226442 ) ( SURFACE-AT ?auto_1226438 ?auto_1226442 ) ( CLEAR ?auto_1226438 ) ( IS-CRATE ?auto_1226439 ) ( not ( = ?auto_1226438 ?auto_1226439 ) ) ( AVAILABLE ?auto_1226445 ) ( ON ?auto_1226438 ?auto_1226437 ) ( not ( = ?auto_1226437 ?auto_1226438 ) ) ( not ( = ?auto_1226437 ?auto_1226439 ) ) ( not ( = ?auto_1226443 ?auto_1226442 ) ) ( HOIST-AT ?auto_1226441 ?auto_1226443 ) ( not ( = ?auto_1226445 ?auto_1226441 ) ) ( AVAILABLE ?auto_1226441 ) ( SURFACE-AT ?auto_1226439 ?auto_1226443 ) ( ON ?auto_1226439 ?auto_1226440 ) ( CLEAR ?auto_1226439 ) ( not ( = ?auto_1226438 ?auto_1226440 ) ) ( not ( = ?auto_1226439 ?auto_1226440 ) ) ( not ( = ?auto_1226437 ?auto_1226440 ) ) ( TRUCK-AT ?auto_1226444 ?auto_1226442 ) ( ON ?auto_1226427 ?auto_1226426 ) ( ON ?auto_1226428 ?auto_1226427 ) ( ON ?auto_1226429 ?auto_1226428 ) ( ON ?auto_1226430 ?auto_1226429 ) ( ON ?auto_1226431 ?auto_1226430 ) ( ON ?auto_1226432 ?auto_1226431 ) ( ON ?auto_1226433 ?auto_1226432 ) ( ON ?auto_1226434 ?auto_1226433 ) ( ON ?auto_1226435 ?auto_1226434 ) ( ON ?auto_1226436 ?auto_1226435 ) ( ON ?auto_1226437 ?auto_1226436 ) ( not ( = ?auto_1226426 ?auto_1226427 ) ) ( not ( = ?auto_1226426 ?auto_1226428 ) ) ( not ( = ?auto_1226426 ?auto_1226429 ) ) ( not ( = ?auto_1226426 ?auto_1226430 ) ) ( not ( = ?auto_1226426 ?auto_1226431 ) ) ( not ( = ?auto_1226426 ?auto_1226432 ) ) ( not ( = ?auto_1226426 ?auto_1226433 ) ) ( not ( = ?auto_1226426 ?auto_1226434 ) ) ( not ( = ?auto_1226426 ?auto_1226435 ) ) ( not ( = ?auto_1226426 ?auto_1226436 ) ) ( not ( = ?auto_1226426 ?auto_1226437 ) ) ( not ( = ?auto_1226426 ?auto_1226438 ) ) ( not ( = ?auto_1226426 ?auto_1226439 ) ) ( not ( = ?auto_1226426 ?auto_1226440 ) ) ( not ( = ?auto_1226427 ?auto_1226428 ) ) ( not ( = ?auto_1226427 ?auto_1226429 ) ) ( not ( = ?auto_1226427 ?auto_1226430 ) ) ( not ( = ?auto_1226427 ?auto_1226431 ) ) ( not ( = ?auto_1226427 ?auto_1226432 ) ) ( not ( = ?auto_1226427 ?auto_1226433 ) ) ( not ( = ?auto_1226427 ?auto_1226434 ) ) ( not ( = ?auto_1226427 ?auto_1226435 ) ) ( not ( = ?auto_1226427 ?auto_1226436 ) ) ( not ( = ?auto_1226427 ?auto_1226437 ) ) ( not ( = ?auto_1226427 ?auto_1226438 ) ) ( not ( = ?auto_1226427 ?auto_1226439 ) ) ( not ( = ?auto_1226427 ?auto_1226440 ) ) ( not ( = ?auto_1226428 ?auto_1226429 ) ) ( not ( = ?auto_1226428 ?auto_1226430 ) ) ( not ( = ?auto_1226428 ?auto_1226431 ) ) ( not ( = ?auto_1226428 ?auto_1226432 ) ) ( not ( = ?auto_1226428 ?auto_1226433 ) ) ( not ( = ?auto_1226428 ?auto_1226434 ) ) ( not ( = ?auto_1226428 ?auto_1226435 ) ) ( not ( = ?auto_1226428 ?auto_1226436 ) ) ( not ( = ?auto_1226428 ?auto_1226437 ) ) ( not ( = ?auto_1226428 ?auto_1226438 ) ) ( not ( = ?auto_1226428 ?auto_1226439 ) ) ( not ( = ?auto_1226428 ?auto_1226440 ) ) ( not ( = ?auto_1226429 ?auto_1226430 ) ) ( not ( = ?auto_1226429 ?auto_1226431 ) ) ( not ( = ?auto_1226429 ?auto_1226432 ) ) ( not ( = ?auto_1226429 ?auto_1226433 ) ) ( not ( = ?auto_1226429 ?auto_1226434 ) ) ( not ( = ?auto_1226429 ?auto_1226435 ) ) ( not ( = ?auto_1226429 ?auto_1226436 ) ) ( not ( = ?auto_1226429 ?auto_1226437 ) ) ( not ( = ?auto_1226429 ?auto_1226438 ) ) ( not ( = ?auto_1226429 ?auto_1226439 ) ) ( not ( = ?auto_1226429 ?auto_1226440 ) ) ( not ( = ?auto_1226430 ?auto_1226431 ) ) ( not ( = ?auto_1226430 ?auto_1226432 ) ) ( not ( = ?auto_1226430 ?auto_1226433 ) ) ( not ( = ?auto_1226430 ?auto_1226434 ) ) ( not ( = ?auto_1226430 ?auto_1226435 ) ) ( not ( = ?auto_1226430 ?auto_1226436 ) ) ( not ( = ?auto_1226430 ?auto_1226437 ) ) ( not ( = ?auto_1226430 ?auto_1226438 ) ) ( not ( = ?auto_1226430 ?auto_1226439 ) ) ( not ( = ?auto_1226430 ?auto_1226440 ) ) ( not ( = ?auto_1226431 ?auto_1226432 ) ) ( not ( = ?auto_1226431 ?auto_1226433 ) ) ( not ( = ?auto_1226431 ?auto_1226434 ) ) ( not ( = ?auto_1226431 ?auto_1226435 ) ) ( not ( = ?auto_1226431 ?auto_1226436 ) ) ( not ( = ?auto_1226431 ?auto_1226437 ) ) ( not ( = ?auto_1226431 ?auto_1226438 ) ) ( not ( = ?auto_1226431 ?auto_1226439 ) ) ( not ( = ?auto_1226431 ?auto_1226440 ) ) ( not ( = ?auto_1226432 ?auto_1226433 ) ) ( not ( = ?auto_1226432 ?auto_1226434 ) ) ( not ( = ?auto_1226432 ?auto_1226435 ) ) ( not ( = ?auto_1226432 ?auto_1226436 ) ) ( not ( = ?auto_1226432 ?auto_1226437 ) ) ( not ( = ?auto_1226432 ?auto_1226438 ) ) ( not ( = ?auto_1226432 ?auto_1226439 ) ) ( not ( = ?auto_1226432 ?auto_1226440 ) ) ( not ( = ?auto_1226433 ?auto_1226434 ) ) ( not ( = ?auto_1226433 ?auto_1226435 ) ) ( not ( = ?auto_1226433 ?auto_1226436 ) ) ( not ( = ?auto_1226433 ?auto_1226437 ) ) ( not ( = ?auto_1226433 ?auto_1226438 ) ) ( not ( = ?auto_1226433 ?auto_1226439 ) ) ( not ( = ?auto_1226433 ?auto_1226440 ) ) ( not ( = ?auto_1226434 ?auto_1226435 ) ) ( not ( = ?auto_1226434 ?auto_1226436 ) ) ( not ( = ?auto_1226434 ?auto_1226437 ) ) ( not ( = ?auto_1226434 ?auto_1226438 ) ) ( not ( = ?auto_1226434 ?auto_1226439 ) ) ( not ( = ?auto_1226434 ?auto_1226440 ) ) ( not ( = ?auto_1226435 ?auto_1226436 ) ) ( not ( = ?auto_1226435 ?auto_1226437 ) ) ( not ( = ?auto_1226435 ?auto_1226438 ) ) ( not ( = ?auto_1226435 ?auto_1226439 ) ) ( not ( = ?auto_1226435 ?auto_1226440 ) ) ( not ( = ?auto_1226436 ?auto_1226437 ) ) ( not ( = ?auto_1226436 ?auto_1226438 ) ) ( not ( = ?auto_1226436 ?auto_1226439 ) ) ( not ( = ?auto_1226436 ?auto_1226440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1226437 ?auto_1226438 ?auto_1226439 )
      ( MAKE-13CRATE-VERIFY ?auto_1226426 ?auto_1226427 ?auto_1226428 ?auto_1226429 ?auto_1226430 ?auto_1226431 ?auto_1226432 ?auto_1226433 ?auto_1226434 ?auto_1226435 ?auto_1226436 ?auto_1226437 ?auto_1226438 ?auto_1226439 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1226609 - SURFACE
      ?auto_1226610 - SURFACE
      ?auto_1226611 - SURFACE
      ?auto_1226612 - SURFACE
      ?auto_1226613 - SURFACE
      ?auto_1226614 - SURFACE
      ?auto_1226615 - SURFACE
      ?auto_1226616 - SURFACE
      ?auto_1226617 - SURFACE
      ?auto_1226618 - SURFACE
      ?auto_1226619 - SURFACE
      ?auto_1226620 - SURFACE
      ?auto_1226621 - SURFACE
      ?auto_1226622 - SURFACE
    )
    :vars
    (
      ?auto_1226624 - HOIST
      ?auto_1226626 - PLACE
      ?auto_1226628 - PLACE
      ?auto_1226623 - HOIST
      ?auto_1226625 - SURFACE
      ?auto_1226627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1226624 ?auto_1226626 ) ( IS-CRATE ?auto_1226622 ) ( not ( = ?auto_1226621 ?auto_1226622 ) ) ( not ( = ?auto_1226620 ?auto_1226621 ) ) ( not ( = ?auto_1226620 ?auto_1226622 ) ) ( not ( = ?auto_1226628 ?auto_1226626 ) ) ( HOIST-AT ?auto_1226623 ?auto_1226628 ) ( not ( = ?auto_1226624 ?auto_1226623 ) ) ( AVAILABLE ?auto_1226623 ) ( SURFACE-AT ?auto_1226622 ?auto_1226628 ) ( ON ?auto_1226622 ?auto_1226625 ) ( CLEAR ?auto_1226622 ) ( not ( = ?auto_1226621 ?auto_1226625 ) ) ( not ( = ?auto_1226622 ?auto_1226625 ) ) ( not ( = ?auto_1226620 ?auto_1226625 ) ) ( TRUCK-AT ?auto_1226627 ?auto_1226626 ) ( SURFACE-AT ?auto_1226620 ?auto_1226626 ) ( CLEAR ?auto_1226620 ) ( LIFTING ?auto_1226624 ?auto_1226621 ) ( IS-CRATE ?auto_1226621 ) ( ON ?auto_1226610 ?auto_1226609 ) ( ON ?auto_1226611 ?auto_1226610 ) ( ON ?auto_1226612 ?auto_1226611 ) ( ON ?auto_1226613 ?auto_1226612 ) ( ON ?auto_1226614 ?auto_1226613 ) ( ON ?auto_1226615 ?auto_1226614 ) ( ON ?auto_1226616 ?auto_1226615 ) ( ON ?auto_1226617 ?auto_1226616 ) ( ON ?auto_1226618 ?auto_1226617 ) ( ON ?auto_1226619 ?auto_1226618 ) ( ON ?auto_1226620 ?auto_1226619 ) ( not ( = ?auto_1226609 ?auto_1226610 ) ) ( not ( = ?auto_1226609 ?auto_1226611 ) ) ( not ( = ?auto_1226609 ?auto_1226612 ) ) ( not ( = ?auto_1226609 ?auto_1226613 ) ) ( not ( = ?auto_1226609 ?auto_1226614 ) ) ( not ( = ?auto_1226609 ?auto_1226615 ) ) ( not ( = ?auto_1226609 ?auto_1226616 ) ) ( not ( = ?auto_1226609 ?auto_1226617 ) ) ( not ( = ?auto_1226609 ?auto_1226618 ) ) ( not ( = ?auto_1226609 ?auto_1226619 ) ) ( not ( = ?auto_1226609 ?auto_1226620 ) ) ( not ( = ?auto_1226609 ?auto_1226621 ) ) ( not ( = ?auto_1226609 ?auto_1226622 ) ) ( not ( = ?auto_1226609 ?auto_1226625 ) ) ( not ( = ?auto_1226610 ?auto_1226611 ) ) ( not ( = ?auto_1226610 ?auto_1226612 ) ) ( not ( = ?auto_1226610 ?auto_1226613 ) ) ( not ( = ?auto_1226610 ?auto_1226614 ) ) ( not ( = ?auto_1226610 ?auto_1226615 ) ) ( not ( = ?auto_1226610 ?auto_1226616 ) ) ( not ( = ?auto_1226610 ?auto_1226617 ) ) ( not ( = ?auto_1226610 ?auto_1226618 ) ) ( not ( = ?auto_1226610 ?auto_1226619 ) ) ( not ( = ?auto_1226610 ?auto_1226620 ) ) ( not ( = ?auto_1226610 ?auto_1226621 ) ) ( not ( = ?auto_1226610 ?auto_1226622 ) ) ( not ( = ?auto_1226610 ?auto_1226625 ) ) ( not ( = ?auto_1226611 ?auto_1226612 ) ) ( not ( = ?auto_1226611 ?auto_1226613 ) ) ( not ( = ?auto_1226611 ?auto_1226614 ) ) ( not ( = ?auto_1226611 ?auto_1226615 ) ) ( not ( = ?auto_1226611 ?auto_1226616 ) ) ( not ( = ?auto_1226611 ?auto_1226617 ) ) ( not ( = ?auto_1226611 ?auto_1226618 ) ) ( not ( = ?auto_1226611 ?auto_1226619 ) ) ( not ( = ?auto_1226611 ?auto_1226620 ) ) ( not ( = ?auto_1226611 ?auto_1226621 ) ) ( not ( = ?auto_1226611 ?auto_1226622 ) ) ( not ( = ?auto_1226611 ?auto_1226625 ) ) ( not ( = ?auto_1226612 ?auto_1226613 ) ) ( not ( = ?auto_1226612 ?auto_1226614 ) ) ( not ( = ?auto_1226612 ?auto_1226615 ) ) ( not ( = ?auto_1226612 ?auto_1226616 ) ) ( not ( = ?auto_1226612 ?auto_1226617 ) ) ( not ( = ?auto_1226612 ?auto_1226618 ) ) ( not ( = ?auto_1226612 ?auto_1226619 ) ) ( not ( = ?auto_1226612 ?auto_1226620 ) ) ( not ( = ?auto_1226612 ?auto_1226621 ) ) ( not ( = ?auto_1226612 ?auto_1226622 ) ) ( not ( = ?auto_1226612 ?auto_1226625 ) ) ( not ( = ?auto_1226613 ?auto_1226614 ) ) ( not ( = ?auto_1226613 ?auto_1226615 ) ) ( not ( = ?auto_1226613 ?auto_1226616 ) ) ( not ( = ?auto_1226613 ?auto_1226617 ) ) ( not ( = ?auto_1226613 ?auto_1226618 ) ) ( not ( = ?auto_1226613 ?auto_1226619 ) ) ( not ( = ?auto_1226613 ?auto_1226620 ) ) ( not ( = ?auto_1226613 ?auto_1226621 ) ) ( not ( = ?auto_1226613 ?auto_1226622 ) ) ( not ( = ?auto_1226613 ?auto_1226625 ) ) ( not ( = ?auto_1226614 ?auto_1226615 ) ) ( not ( = ?auto_1226614 ?auto_1226616 ) ) ( not ( = ?auto_1226614 ?auto_1226617 ) ) ( not ( = ?auto_1226614 ?auto_1226618 ) ) ( not ( = ?auto_1226614 ?auto_1226619 ) ) ( not ( = ?auto_1226614 ?auto_1226620 ) ) ( not ( = ?auto_1226614 ?auto_1226621 ) ) ( not ( = ?auto_1226614 ?auto_1226622 ) ) ( not ( = ?auto_1226614 ?auto_1226625 ) ) ( not ( = ?auto_1226615 ?auto_1226616 ) ) ( not ( = ?auto_1226615 ?auto_1226617 ) ) ( not ( = ?auto_1226615 ?auto_1226618 ) ) ( not ( = ?auto_1226615 ?auto_1226619 ) ) ( not ( = ?auto_1226615 ?auto_1226620 ) ) ( not ( = ?auto_1226615 ?auto_1226621 ) ) ( not ( = ?auto_1226615 ?auto_1226622 ) ) ( not ( = ?auto_1226615 ?auto_1226625 ) ) ( not ( = ?auto_1226616 ?auto_1226617 ) ) ( not ( = ?auto_1226616 ?auto_1226618 ) ) ( not ( = ?auto_1226616 ?auto_1226619 ) ) ( not ( = ?auto_1226616 ?auto_1226620 ) ) ( not ( = ?auto_1226616 ?auto_1226621 ) ) ( not ( = ?auto_1226616 ?auto_1226622 ) ) ( not ( = ?auto_1226616 ?auto_1226625 ) ) ( not ( = ?auto_1226617 ?auto_1226618 ) ) ( not ( = ?auto_1226617 ?auto_1226619 ) ) ( not ( = ?auto_1226617 ?auto_1226620 ) ) ( not ( = ?auto_1226617 ?auto_1226621 ) ) ( not ( = ?auto_1226617 ?auto_1226622 ) ) ( not ( = ?auto_1226617 ?auto_1226625 ) ) ( not ( = ?auto_1226618 ?auto_1226619 ) ) ( not ( = ?auto_1226618 ?auto_1226620 ) ) ( not ( = ?auto_1226618 ?auto_1226621 ) ) ( not ( = ?auto_1226618 ?auto_1226622 ) ) ( not ( = ?auto_1226618 ?auto_1226625 ) ) ( not ( = ?auto_1226619 ?auto_1226620 ) ) ( not ( = ?auto_1226619 ?auto_1226621 ) ) ( not ( = ?auto_1226619 ?auto_1226622 ) ) ( not ( = ?auto_1226619 ?auto_1226625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1226620 ?auto_1226621 ?auto_1226622 )
      ( MAKE-13CRATE-VERIFY ?auto_1226609 ?auto_1226610 ?auto_1226611 ?auto_1226612 ?auto_1226613 ?auto_1226614 ?auto_1226615 ?auto_1226616 ?auto_1226617 ?auto_1226618 ?auto_1226619 ?auto_1226620 ?auto_1226621 ?auto_1226622 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1226792 - SURFACE
      ?auto_1226793 - SURFACE
      ?auto_1226794 - SURFACE
      ?auto_1226795 - SURFACE
      ?auto_1226796 - SURFACE
      ?auto_1226797 - SURFACE
      ?auto_1226798 - SURFACE
      ?auto_1226799 - SURFACE
      ?auto_1226800 - SURFACE
      ?auto_1226801 - SURFACE
      ?auto_1226802 - SURFACE
      ?auto_1226803 - SURFACE
      ?auto_1226804 - SURFACE
      ?auto_1226805 - SURFACE
    )
    :vars
    (
      ?auto_1226811 - HOIST
      ?auto_1226806 - PLACE
      ?auto_1226810 - PLACE
      ?auto_1226807 - HOIST
      ?auto_1226809 - SURFACE
      ?auto_1226808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1226811 ?auto_1226806 ) ( IS-CRATE ?auto_1226805 ) ( not ( = ?auto_1226804 ?auto_1226805 ) ) ( not ( = ?auto_1226803 ?auto_1226804 ) ) ( not ( = ?auto_1226803 ?auto_1226805 ) ) ( not ( = ?auto_1226810 ?auto_1226806 ) ) ( HOIST-AT ?auto_1226807 ?auto_1226810 ) ( not ( = ?auto_1226811 ?auto_1226807 ) ) ( AVAILABLE ?auto_1226807 ) ( SURFACE-AT ?auto_1226805 ?auto_1226810 ) ( ON ?auto_1226805 ?auto_1226809 ) ( CLEAR ?auto_1226805 ) ( not ( = ?auto_1226804 ?auto_1226809 ) ) ( not ( = ?auto_1226805 ?auto_1226809 ) ) ( not ( = ?auto_1226803 ?auto_1226809 ) ) ( TRUCK-AT ?auto_1226808 ?auto_1226806 ) ( SURFACE-AT ?auto_1226803 ?auto_1226806 ) ( CLEAR ?auto_1226803 ) ( IS-CRATE ?auto_1226804 ) ( AVAILABLE ?auto_1226811 ) ( IN ?auto_1226804 ?auto_1226808 ) ( ON ?auto_1226793 ?auto_1226792 ) ( ON ?auto_1226794 ?auto_1226793 ) ( ON ?auto_1226795 ?auto_1226794 ) ( ON ?auto_1226796 ?auto_1226795 ) ( ON ?auto_1226797 ?auto_1226796 ) ( ON ?auto_1226798 ?auto_1226797 ) ( ON ?auto_1226799 ?auto_1226798 ) ( ON ?auto_1226800 ?auto_1226799 ) ( ON ?auto_1226801 ?auto_1226800 ) ( ON ?auto_1226802 ?auto_1226801 ) ( ON ?auto_1226803 ?auto_1226802 ) ( not ( = ?auto_1226792 ?auto_1226793 ) ) ( not ( = ?auto_1226792 ?auto_1226794 ) ) ( not ( = ?auto_1226792 ?auto_1226795 ) ) ( not ( = ?auto_1226792 ?auto_1226796 ) ) ( not ( = ?auto_1226792 ?auto_1226797 ) ) ( not ( = ?auto_1226792 ?auto_1226798 ) ) ( not ( = ?auto_1226792 ?auto_1226799 ) ) ( not ( = ?auto_1226792 ?auto_1226800 ) ) ( not ( = ?auto_1226792 ?auto_1226801 ) ) ( not ( = ?auto_1226792 ?auto_1226802 ) ) ( not ( = ?auto_1226792 ?auto_1226803 ) ) ( not ( = ?auto_1226792 ?auto_1226804 ) ) ( not ( = ?auto_1226792 ?auto_1226805 ) ) ( not ( = ?auto_1226792 ?auto_1226809 ) ) ( not ( = ?auto_1226793 ?auto_1226794 ) ) ( not ( = ?auto_1226793 ?auto_1226795 ) ) ( not ( = ?auto_1226793 ?auto_1226796 ) ) ( not ( = ?auto_1226793 ?auto_1226797 ) ) ( not ( = ?auto_1226793 ?auto_1226798 ) ) ( not ( = ?auto_1226793 ?auto_1226799 ) ) ( not ( = ?auto_1226793 ?auto_1226800 ) ) ( not ( = ?auto_1226793 ?auto_1226801 ) ) ( not ( = ?auto_1226793 ?auto_1226802 ) ) ( not ( = ?auto_1226793 ?auto_1226803 ) ) ( not ( = ?auto_1226793 ?auto_1226804 ) ) ( not ( = ?auto_1226793 ?auto_1226805 ) ) ( not ( = ?auto_1226793 ?auto_1226809 ) ) ( not ( = ?auto_1226794 ?auto_1226795 ) ) ( not ( = ?auto_1226794 ?auto_1226796 ) ) ( not ( = ?auto_1226794 ?auto_1226797 ) ) ( not ( = ?auto_1226794 ?auto_1226798 ) ) ( not ( = ?auto_1226794 ?auto_1226799 ) ) ( not ( = ?auto_1226794 ?auto_1226800 ) ) ( not ( = ?auto_1226794 ?auto_1226801 ) ) ( not ( = ?auto_1226794 ?auto_1226802 ) ) ( not ( = ?auto_1226794 ?auto_1226803 ) ) ( not ( = ?auto_1226794 ?auto_1226804 ) ) ( not ( = ?auto_1226794 ?auto_1226805 ) ) ( not ( = ?auto_1226794 ?auto_1226809 ) ) ( not ( = ?auto_1226795 ?auto_1226796 ) ) ( not ( = ?auto_1226795 ?auto_1226797 ) ) ( not ( = ?auto_1226795 ?auto_1226798 ) ) ( not ( = ?auto_1226795 ?auto_1226799 ) ) ( not ( = ?auto_1226795 ?auto_1226800 ) ) ( not ( = ?auto_1226795 ?auto_1226801 ) ) ( not ( = ?auto_1226795 ?auto_1226802 ) ) ( not ( = ?auto_1226795 ?auto_1226803 ) ) ( not ( = ?auto_1226795 ?auto_1226804 ) ) ( not ( = ?auto_1226795 ?auto_1226805 ) ) ( not ( = ?auto_1226795 ?auto_1226809 ) ) ( not ( = ?auto_1226796 ?auto_1226797 ) ) ( not ( = ?auto_1226796 ?auto_1226798 ) ) ( not ( = ?auto_1226796 ?auto_1226799 ) ) ( not ( = ?auto_1226796 ?auto_1226800 ) ) ( not ( = ?auto_1226796 ?auto_1226801 ) ) ( not ( = ?auto_1226796 ?auto_1226802 ) ) ( not ( = ?auto_1226796 ?auto_1226803 ) ) ( not ( = ?auto_1226796 ?auto_1226804 ) ) ( not ( = ?auto_1226796 ?auto_1226805 ) ) ( not ( = ?auto_1226796 ?auto_1226809 ) ) ( not ( = ?auto_1226797 ?auto_1226798 ) ) ( not ( = ?auto_1226797 ?auto_1226799 ) ) ( not ( = ?auto_1226797 ?auto_1226800 ) ) ( not ( = ?auto_1226797 ?auto_1226801 ) ) ( not ( = ?auto_1226797 ?auto_1226802 ) ) ( not ( = ?auto_1226797 ?auto_1226803 ) ) ( not ( = ?auto_1226797 ?auto_1226804 ) ) ( not ( = ?auto_1226797 ?auto_1226805 ) ) ( not ( = ?auto_1226797 ?auto_1226809 ) ) ( not ( = ?auto_1226798 ?auto_1226799 ) ) ( not ( = ?auto_1226798 ?auto_1226800 ) ) ( not ( = ?auto_1226798 ?auto_1226801 ) ) ( not ( = ?auto_1226798 ?auto_1226802 ) ) ( not ( = ?auto_1226798 ?auto_1226803 ) ) ( not ( = ?auto_1226798 ?auto_1226804 ) ) ( not ( = ?auto_1226798 ?auto_1226805 ) ) ( not ( = ?auto_1226798 ?auto_1226809 ) ) ( not ( = ?auto_1226799 ?auto_1226800 ) ) ( not ( = ?auto_1226799 ?auto_1226801 ) ) ( not ( = ?auto_1226799 ?auto_1226802 ) ) ( not ( = ?auto_1226799 ?auto_1226803 ) ) ( not ( = ?auto_1226799 ?auto_1226804 ) ) ( not ( = ?auto_1226799 ?auto_1226805 ) ) ( not ( = ?auto_1226799 ?auto_1226809 ) ) ( not ( = ?auto_1226800 ?auto_1226801 ) ) ( not ( = ?auto_1226800 ?auto_1226802 ) ) ( not ( = ?auto_1226800 ?auto_1226803 ) ) ( not ( = ?auto_1226800 ?auto_1226804 ) ) ( not ( = ?auto_1226800 ?auto_1226805 ) ) ( not ( = ?auto_1226800 ?auto_1226809 ) ) ( not ( = ?auto_1226801 ?auto_1226802 ) ) ( not ( = ?auto_1226801 ?auto_1226803 ) ) ( not ( = ?auto_1226801 ?auto_1226804 ) ) ( not ( = ?auto_1226801 ?auto_1226805 ) ) ( not ( = ?auto_1226801 ?auto_1226809 ) ) ( not ( = ?auto_1226802 ?auto_1226803 ) ) ( not ( = ?auto_1226802 ?auto_1226804 ) ) ( not ( = ?auto_1226802 ?auto_1226805 ) ) ( not ( = ?auto_1226802 ?auto_1226809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1226803 ?auto_1226804 ?auto_1226805 )
      ( MAKE-13CRATE-VERIFY ?auto_1226792 ?auto_1226793 ?auto_1226794 ?auto_1226795 ?auto_1226796 ?auto_1226797 ?auto_1226798 ?auto_1226799 ?auto_1226800 ?auto_1226801 ?auto_1226802 ?auto_1226803 ?auto_1226804 ?auto_1226805 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241033 - SURFACE
      ?auto_1241034 - SURFACE
      ?auto_1241035 - SURFACE
      ?auto_1241036 - SURFACE
      ?auto_1241037 - SURFACE
      ?auto_1241038 - SURFACE
      ?auto_1241039 - SURFACE
      ?auto_1241040 - SURFACE
      ?auto_1241041 - SURFACE
      ?auto_1241042 - SURFACE
      ?auto_1241043 - SURFACE
      ?auto_1241044 - SURFACE
      ?auto_1241045 - SURFACE
      ?auto_1241046 - SURFACE
      ?auto_1241047 - SURFACE
    )
    :vars
    (
      ?auto_1241049 - HOIST
      ?auto_1241048 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241049 ?auto_1241048 ) ( SURFACE-AT ?auto_1241046 ?auto_1241048 ) ( CLEAR ?auto_1241046 ) ( LIFTING ?auto_1241049 ?auto_1241047 ) ( IS-CRATE ?auto_1241047 ) ( not ( = ?auto_1241046 ?auto_1241047 ) ) ( ON ?auto_1241034 ?auto_1241033 ) ( ON ?auto_1241035 ?auto_1241034 ) ( ON ?auto_1241036 ?auto_1241035 ) ( ON ?auto_1241037 ?auto_1241036 ) ( ON ?auto_1241038 ?auto_1241037 ) ( ON ?auto_1241039 ?auto_1241038 ) ( ON ?auto_1241040 ?auto_1241039 ) ( ON ?auto_1241041 ?auto_1241040 ) ( ON ?auto_1241042 ?auto_1241041 ) ( ON ?auto_1241043 ?auto_1241042 ) ( ON ?auto_1241044 ?auto_1241043 ) ( ON ?auto_1241045 ?auto_1241044 ) ( ON ?auto_1241046 ?auto_1241045 ) ( not ( = ?auto_1241033 ?auto_1241034 ) ) ( not ( = ?auto_1241033 ?auto_1241035 ) ) ( not ( = ?auto_1241033 ?auto_1241036 ) ) ( not ( = ?auto_1241033 ?auto_1241037 ) ) ( not ( = ?auto_1241033 ?auto_1241038 ) ) ( not ( = ?auto_1241033 ?auto_1241039 ) ) ( not ( = ?auto_1241033 ?auto_1241040 ) ) ( not ( = ?auto_1241033 ?auto_1241041 ) ) ( not ( = ?auto_1241033 ?auto_1241042 ) ) ( not ( = ?auto_1241033 ?auto_1241043 ) ) ( not ( = ?auto_1241033 ?auto_1241044 ) ) ( not ( = ?auto_1241033 ?auto_1241045 ) ) ( not ( = ?auto_1241033 ?auto_1241046 ) ) ( not ( = ?auto_1241033 ?auto_1241047 ) ) ( not ( = ?auto_1241034 ?auto_1241035 ) ) ( not ( = ?auto_1241034 ?auto_1241036 ) ) ( not ( = ?auto_1241034 ?auto_1241037 ) ) ( not ( = ?auto_1241034 ?auto_1241038 ) ) ( not ( = ?auto_1241034 ?auto_1241039 ) ) ( not ( = ?auto_1241034 ?auto_1241040 ) ) ( not ( = ?auto_1241034 ?auto_1241041 ) ) ( not ( = ?auto_1241034 ?auto_1241042 ) ) ( not ( = ?auto_1241034 ?auto_1241043 ) ) ( not ( = ?auto_1241034 ?auto_1241044 ) ) ( not ( = ?auto_1241034 ?auto_1241045 ) ) ( not ( = ?auto_1241034 ?auto_1241046 ) ) ( not ( = ?auto_1241034 ?auto_1241047 ) ) ( not ( = ?auto_1241035 ?auto_1241036 ) ) ( not ( = ?auto_1241035 ?auto_1241037 ) ) ( not ( = ?auto_1241035 ?auto_1241038 ) ) ( not ( = ?auto_1241035 ?auto_1241039 ) ) ( not ( = ?auto_1241035 ?auto_1241040 ) ) ( not ( = ?auto_1241035 ?auto_1241041 ) ) ( not ( = ?auto_1241035 ?auto_1241042 ) ) ( not ( = ?auto_1241035 ?auto_1241043 ) ) ( not ( = ?auto_1241035 ?auto_1241044 ) ) ( not ( = ?auto_1241035 ?auto_1241045 ) ) ( not ( = ?auto_1241035 ?auto_1241046 ) ) ( not ( = ?auto_1241035 ?auto_1241047 ) ) ( not ( = ?auto_1241036 ?auto_1241037 ) ) ( not ( = ?auto_1241036 ?auto_1241038 ) ) ( not ( = ?auto_1241036 ?auto_1241039 ) ) ( not ( = ?auto_1241036 ?auto_1241040 ) ) ( not ( = ?auto_1241036 ?auto_1241041 ) ) ( not ( = ?auto_1241036 ?auto_1241042 ) ) ( not ( = ?auto_1241036 ?auto_1241043 ) ) ( not ( = ?auto_1241036 ?auto_1241044 ) ) ( not ( = ?auto_1241036 ?auto_1241045 ) ) ( not ( = ?auto_1241036 ?auto_1241046 ) ) ( not ( = ?auto_1241036 ?auto_1241047 ) ) ( not ( = ?auto_1241037 ?auto_1241038 ) ) ( not ( = ?auto_1241037 ?auto_1241039 ) ) ( not ( = ?auto_1241037 ?auto_1241040 ) ) ( not ( = ?auto_1241037 ?auto_1241041 ) ) ( not ( = ?auto_1241037 ?auto_1241042 ) ) ( not ( = ?auto_1241037 ?auto_1241043 ) ) ( not ( = ?auto_1241037 ?auto_1241044 ) ) ( not ( = ?auto_1241037 ?auto_1241045 ) ) ( not ( = ?auto_1241037 ?auto_1241046 ) ) ( not ( = ?auto_1241037 ?auto_1241047 ) ) ( not ( = ?auto_1241038 ?auto_1241039 ) ) ( not ( = ?auto_1241038 ?auto_1241040 ) ) ( not ( = ?auto_1241038 ?auto_1241041 ) ) ( not ( = ?auto_1241038 ?auto_1241042 ) ) ( not ( = ?auto_1241038 ?auto_1241043 ) ) ( not ( = ?auto_1241038 ?auto_1241044 ) ) ( not ( = ?auto_1241038 ?auto_1241045 ) ) ( not ( = ?auto_1241038 ?auto_1241046 ) ) ( not ( = ?auto_1241038 ?auto_1241047 ) ) ( not ( = ?auto_1241039 ?auto_1241040 ) ) ( not ( = ?auto_1241039 ?auto_1241041 ) ) ( not ( = ?auto_1241039 ?auto_1241042 ) ) ( not ( = ?auto_1241039 ?auto_1241043 ) ) ( not ( = ?auto_1241039 ?auto_1241044 ) ) ( not ( = ?auto_1241039 ?auto_1241045 ) ) ( not ( = ?auto_1241039 ?auto_1241046 ) ) ( not ( = ?auto_1241039 ?auto_1241047 ) ) ( not ( = ?auto_1241040 ?auto_1241041 ) ) ( not ( = ?auto_1241040 ?auto_1241042 ) ) ( not ( = ?auto_1241040 ?auto_1241043 ) ) ( not ( = ?auto_1241040 ?auto_1241044 ) ) ( not ( = ?auto_1241040 ?auto_1241045 ) ) ( not ( = ?auto_1241040 ?auto_1241046 ) ) ( not ( = ?auto_1241040 ?auto_1241047 ) ) ( not ( = ?auto_1241041 ?auto_1241042 ) ) ( not ( = ?auto_1241041 ?auto_1241043 ) ) ( not ( = ?auto_1241041 ?auto_1241044 ) ) ( not ( = ?auto_1241041 ?auto_1241045 ) ) ( not ( = ?auto_1241041 ?auto_1241046 ) ) ( not ( = ?auto_1241041 ?auto_1241047 ) ) ( not ( = ?auto_1241042 ?auto_1241043 ) ) ( not ( = ?auto_1241042 ?auto_1241044 ) ) ( not ( = ?auto_1241042 ?auto_1241045 ) ) ( not ( = ?auto_1241042 ?auto_1241046 ) ) ( not ( = ?auto_1241042 ?auto_1241047 ) ) ( not ( = ?auto_1241043 ?auto_1241044 ) ) ( not ( = ?auto_1241043 ?auto_1241045 ) ) ( not ( = ?auto_1241043 ?auto_1241046 ) ) ( not ( = ?auto_1241043 ?auto_1241047 ) ) ( not ( = ?auto_1241044 ?auto_1241045 ) ) ( not ( = ?auto_1241044 ?auto_1241046 ) ) ( not ( = ?auto_1241044 ?auto_1241047 ) ) ( not ( = ?auto_1241045 ?auto_1241046 ) ) ( not ( = ?auto_1241045 ?auto_1241047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1241046 ?auto_1241047 )
      ( MAKE-14CRATE-VERIFY ?auto_1241033 ?auto_1241034 ?auto_1241035 ?auto_1241036 ?auto_1241037 ?auto_1241038 ?auto_1241039 ?auto_1241040 ?auto_1241041 ?auto_1241042 ?auto_1241043 ?auto_1241044 ?auto_1241045 ?auto_1241046 ?auto_1241047 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241193 - SURFACE
      ?auto_1241194 - SURFACE
      ?auto_1241195 - SURFACE
      ?auto_1241196 - SURFACE
      ?auto_1241197 - SURFACE
      ?auto_1241198 - SURFACE
      ?auto_1241199 - SURFACE
      ?auto_1241200 - SURFACE
      ?auto_1241201 - SURFACE
      ?auto_1241202 - SURFACE
      ?auto_1241203 - SURFACE
      ?auto_1241204 - SURFACE
      ?auto_1241205 - SURFACE
      ?auto_1241206 - SURFACE
      ?auto_1241207 - SURFACE
    )
    :vars
    (
      ?auto_1241210 - HOIST
      ?auto_1241209 - PLACE
      ?auto_1241208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241210 ?auto_1241209 ) ( SURFACE-AT ?auto_1241206 ?auto_1241209 ) ( CLEAR ?auto_1241206 ) ( IS-CRATE ?auto_1241207 ) ( not ( = ?auto_1241206 ?auto_1241207 ) ) ( TRUCK-AT ?auto_1241208 ?auto_1241209 ) ( AVAILABLE ?auto_1241210 ) ( IN ?auto_1241207 ?auto_1241208 ) ( ON ?auto_1241206 ?auto_1241205 ) ( not ( = ?auto_1241205 ?auto_1241206 ) ) ( not ( = ?auto_1241205 ?auto_1241207 ) ) ( ON ?auto_1241194 ?auto_1241193 ) ( ON ?auto_1241195 ?auto_1241194 ) ( ON ?auto_1241196 ?auto_1241195 ) ( ON ?auto_1241197 ?auto_1241196 ) ( ON ?auto_1241198 ?auto_1241197 ) ( ON ?auto_1241199 ?auto_1241198 ) ( ON ?auto_1241200 ?auto_1241199 ) ( ON ?auto_1241201 ?auto_1241200 ) ( ON ?auto_1241202 ?auto_1241201 ) ( ON ?auto_1241203 ?auto_1241202 ) ( ON ?auto_1241204 ?auto_1241203 ) ( ON ?auto_1241205 ?auto_1241204 ) ( not ( = ?auto_1241193 ?auto_1241194 ) ) ( not ( = ?auto_1241193 ?auto_1241195 ) ) ( not ( = ?auto_1241193 ?auto_1241196 ) ) ( not ( = ?auto_1241193 ?auto_1241197 ) ) ( not ( = ?auto_1241193 ?auto_1241198 ) ) ( not ( = ?auto_1241193 ?auto_1241199 ) ) ( not ( = ?auto_1241193 ?auto_1241200 ) ) ( not ( = ?auto_1241193 ?auto_1241201 ) ) ( not ( = ?auto_1241193 ?auto_1241202 ) ) ( not ( = ?auto_1241193 ?auto_1241203 ) ) ( not ( = ?auto_1241193 ?auto_1241204 ) ) ( not ( = ?auto_1241193 ?auto_1241205 ) ) ( not ( = ?auto_1241193 ?auto_1241206 ) ) ( not ( = ?auto_1241193 ?auto_1241207 ) ) ( not ( = ?auto_1241194 ?auto_1241195 ) ) ( not ( = ?auto_1241194 ?auto_1241196 ) ) ( not ( = ?auto_1241194 ?auto_1241197 ) ) ( not ( = ?auto_1241194 ?auto_1241198 ) ) ( not ( = ?auto_1241194 ?auto_1241199 ) ) ( not ( = ?auto_1241194 ?auto_1241200 ) ) ( not ( = ?auto_1241194 ?auto_1241201 ) ) ( not ( = ?auto_1241194 ?auto_1241202 ) ) ( not ( = ?auto_1241194 ?auto_1241203 ) ) ( not ( = ?auto_1241194 ?auto_1241204 ) ) ( not ( = ?auto_1241194 ?auto_1241205 ) ) ( not ( = ?auto_1241194 ?auto_1241206 ) ) ( not ( = ?auto_1241194 ?auto_1241207 ) ) ( not ( = ?auto_1241195 ?auto_1241196 ) ) ( not ( = ?auto_1241195 ?auto_1241197 ) ) ( not ( = ?auto_1241195 ?auto_1241198 ) ) ( not ( = ?auto_1241195 ?auto_1241199 ) ) ( not ( = ?auto_1241195 ?auto_1241200 ) ) ( not ( = ?auto_1241195 ?auto_1241201 ) ) ( not ( = ?auto_1241195 ?auto_1241202 ) ) ( not ( = ?auto_1241195 ?auto_1241203 ) ) ( not ( = ?auto_1241195 ?auto_1241204 ) ) ( not ( = ?auto_1241195 ?auto_1241205 ) ) ( not ( = ?auto_1241195 ?auto_1241206 ) ) ( not ( = ?auto_1241195 ?auto_1241207 ) ) ( not ( = ?auto_1241196 ?auto_1241197 ) ) ( not ( = ?auto_1241196 ?auto_1241198 ) ) ( not ( = ?auto_1241196 ?auto_1241199 ) ) ( not ( = ?auto_1241196 ?auto_1241200 ) ) ( not ( = ?auto_1241196 ?auto_1241201 ) ) ( not ( = ?auto_1241196 ?auto_1241202 ) ) ( not ( = ?auto_1241196 ?auto_1241203 ) ) ( not ( = ?auto_1241196 ?auto_1241204 ) ) ( not ( = ?auto_1241196 ?auto_1241205 ) ) ( not ( = ?auto_1241196 ?auto_1241206 ) ) ( not ( = ?auto_1241196 ?auto_1241207 ) ) ( not ( = ?auto_1241197 ?auto_1241198 ) ) ( not ( = ?auto_1241197 ?auto_1241199 ) ) ( not ( = ?auto_1241197 ?auto_1241200 ) ) ( not ( = ?auto_1241197 ?auto_1241201 ) ) ( not ( = ?auto_1241197 ?auto_1241202 ) ) ( not ( = ?auto_1241197 ?auto_1241203 ) ) ( not ( = ?auto_1241197 ?auto_1241204 ) ) ( not ( = ?auto_1241197 ?auto_1241205 ) ) ( not ( = ?auto_1241197 ?auto_1241206 ) ) ( not ( = ?auto_1241197 ?auto_1241207 ) ) ( not ( = ?auto_1241198 ?auto_1241199 ) ) ( not ( = ?auto_1241198 ?auto_1241200 ) ) ( not ( = ?auto_1241198 ?auto_1241201 ) ) ( not ( = ?auto_1241198 ?auto_1241202 ) ) ( not ( = ?auto_1241198 ?auto_1241203 ) ) ( not ( = ?auto_1241198 ?auto_1241204 ) ) ( not ( = ?auto_1241198 ?auto_1241205 ) ) ( not ( = ?auto_1241198 ?auto_1241206 ) ) ( not ( = ?auto_1241198 ?auto_1241207 ) ) ( not ( = ?auto_1241199 ?auto_1241200 ) ) ( not ( = ?auto_1241199 ?auto_1241201 ) ) ( not ( = ?auto_1241199 ?auto_1241202 ) ) ( not ( = ?auto_1241199 ?auto_1241203 ) ) ( not ( = ?auto_1241199 ?auto_1241204 ) ) ( not ( = ?auto_1241199 ?auto_1241205 ) ) ( not ( = ?auto_1241199 ?auto_1241206 ) ) ( not ( = ?auto_1241199 ?auto_1241207 ) ) ( not ( = ?auto_1241200 ?auto_1241201 ) ) ( not ( = ?auto_1241200 ?auto_1241202 ) ) ( not ( = ?auto_1241200 ?auto_1241203 ) ) ( not ( = ?auto_1241200 ?auto_1241204 ) ) ( not ( = ?auto_1241200 ?auto_1241205 ) ) ( not ( = ?auto_1241200 ?auto_1241206 ) ) ( not ( = ?auto_1241200 ?auto_1241207 ) ) ( not ( = ?auto_1241201 ?auto_1241202 ) ) ( not ( = ?auto_1241201 ?auto_1241203 ) ) ( not ( = ?auto_1241201 ?auto_1241204 ) ) ( not ( = ?auto_1241201 ?auto_1241205 ) ) ( not ( = ?auto_1241201 ?auto_1241206 ) ) ( not ( = ?auto_1241201 ?auto_1241207 ) ) ( not ( = ?auto_1241202 ?auto_1241203 ) ) ( not ( = ?auto_1241202 ?auto_1241204 ) ) ( not ( = ?auto_1241202 ?auto_1241205 ) ) ( not ( = ?auto_1241202 ?auto_1241206 ) ) ( not ( = ?auto_1241202 ?auto_1241207 ) ) ( not ( = ?auto_1241203 ?auto_1241204 ) ) ( not ( = ?auto_1241203 ?auto_1241205 ) ) ( not ( = ?auto_1241203 ?auto_1241206 ) ) ( not ( = ?auto_1241203 ?auto_1241207 ) ) ( not ( = ?auto_1241204 ?auto_1241205 ) ) ( not ( = ?auto_1241204 ?auto_1241206 ) ) ( not ( = ?auto_1241204 ?auto_1241207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1241205 ?auto_1241206 ?auto_1241207 )
      ( MAKE-14CRATE-VERIFY ?auto_1241193 ?auto_1241194 ?auto_1241195 ?auto_1241196 ?auto_1241197 ?auto_1241198 ?auto_1241199 ?auto_1241200 ?auto_1241201 ?auto_1241202 ?auto_1241203 ?auto_1241204 ?auto_1241205 ?auto_1241206 ?auto_1241207 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241368 - SURFACE
      ?auto_1241369 - SURFACE
      ?auto_1241370 - SURFACE
      ?auto_1241371 - SURFACE
      ?auto_1241372 - SURFACE
      ?auto_1241373 - SURFACE
      ?auto_1241374 - SURFACE
      ?auto_1241375 - SURFACE
      ?auto_1241376 - SURFACE
      ?auto_1241377 - SURFACE
      ?auto_1241378 - SURFACE
      ?auto_1241379 - SURFACE
      ?auto_1241380 - SURFACE
      ?auto_1241381 - SURFACE
      ?auto_1241382 - SURFACE
    )
    :vars
    (
      ?auto_1241383 - HOIST
      ?auto_1241385 - PLACE
      ?auto_1241386 - TRUCK
      ?auto_1241384 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241383 ?auto_1241385 ) ( SURFACE-AT ?auto_1241381 ?auto_1241385 ) ( CLEAR ?auto_1241381 ) ( IS-CRATE ?auto_1241382 ) ( not ( = ?auto_1241381 ?auto_1241382 ) ) ( AVAILABLE ?auto_1241383 ) ( IN ?auto_1241382 ?auto_1241386 ) ( ON ?auto_1241381 ?auto_1241380 ) ( not ( = ?auto_1241380 ?auto_1241381 ) ) ( not ( = ?auto_1241380 ?auto_1241382 ) ) ( TRUCK-AT ?auto_1241386 ?auto_1241384 ) ( not ( = ?auto_1241384 ?auto_1241385 ) ) ( ON ?auto_1241369 ?auto_1241368 ) ( ON ?auto_1241370 ?auto_1241369 ) ( ON ?auto_1241371 ?auto_1241370 ) ( ON ?auto_1241372 ?auto_1241371 ) ( ON ?auto_1241373 ?auto_1241372 ) ( ON ?auto_1241374 ?auto_1241373 ) ( ON ?auto_1241375 ?auto_1241374 ) ( ON ?auto_1241376 ?auto_1241375 ) ( ON ?auto_1241377 ?auto_1241376 ) ( ON ?auto_1241378 ?auto_1241377 ) ( ON ?auto_1241379 ?auto_1241378 ) ( ON ?auto_1241380 ?auto_1241379 ) ( not ( = ?auto_1241368 ?auto_1241369 ) ) ( not ( = ?auto_1241368 ?auto_1241370 ) ) ( not ( = ?auto_1241368 ?auto_1241371 ) ) ( not ( = ?auto_1241368 ?auto_1241372 ) ) ( not ( = ?auto_1241368 ?auto_1241373 ) ) ( not ( = ?auto_1241368 ?auto_1241374 ) ) ( not ( = ?auto_1241368 ?auto_1241375 ) ) ( not ( = ?auto_1241368 ?auto_1241376 ) ) ( not ( = ?auto_1241368 ?auto_1241377 ) ) ( not ( = ?auto_1241368 ?auto_1241378 ) ) ( not ( = ?auto_1241368 ?auto_1241379 ) ) ( not ( = ?auto_1241368 ?auto_1241380 ) ) ( not ( = ?auto_1241368 ?auto_1241381 ) ) ( not ( = ?auto_1241368 ?auto_1241382 ) ) ( not ( = ?auto_1241369 ?auto_1241370 ) ) ( not ( = ?auto_1241369 ?auto_1241371 ) ) ( not ( = ?auto_1241369 ?auto_1241372 ) ) ( not ( = ?auto_1241369 ?auto_1241373 ) ) ( not ( = ?auto_1241369 ?auto_1241374 ) ) ( not ( = ?auto_1241369 ?auto_1241375 ) ) ( not ( = ?auto_1241369 ?auto_1241376 ) ) ( not ( = ?auto_1241369 ?auto_1241377 ) ) ( not ( = ?auto_1241369 ?auto_1241378 ) ) ( not ( = ?auto_1241369 ?auto_1241379 ) ) ( not ( = ?auto_1241369 ?auto_1241380 ) ) ( not ( = ?auto_1241369 ?auto_1241381 ) ) ( not ( = ?auto_1241369 ?auto_1241382 ) ) ( not ( = ?auto_1241370 ?auto_1241371 ) ) ( not ( = ?auto_1241370 ?auto_1241372 ) ) ( not ( = ?auto_1241370 ?auto_1241373 ) ) ( not ( = ?auto_1241370 ?auto_1241374 ) ) ( not ( = ?auto_1241370 ?auto_1241375 ) ) ( not ( = ?auto_1241370 ?auto_1241376 ) ) ( not ( = ?auto_1241370 ?auto_1241377 ) ) ( not ( = ?auto_1241370 ?auto_1241378 ) ) ( not ( = ?auto_1241370 ?auto_1241379 ) ) ( not ( = ?auto_1241370 ?auto_1241380 ) ) ( not ( = ?auto_1241370 ?auto_1241381 ) ) ( not ( = ?auto_1241370 ?auto_1241382 ) ) ( not ( = ?auto_1241371 ?auto_1241372 ) ) ( not ( = ?auto_1241371 ?auto_1241373 ) ) ( not ( = ?auto_1241371 ?auto_1241374 ) ) ( not ( = ?auto_1241371 ?auto_1241375 ) ) ( not ( = ?auto_1241371 ?auto_1241376 ) ) ( not ( = ?auto_1241371 ?auto_1241377 ) ) ( not ( = ?auto_1241371 ?auto_1241378 ) ) ( not ( = ?auto_1241371 ?auto_1241379 ) ) ( not ( = ?auto_1241371 ?auto_1241380 ) ) ( not ( = ?auto_1241371 ?auto_1241381 ) ) ( not ( = ?auto_1241371 ?auto_1241382 ) ) ( not ( = ?auto_1241372 ?auto_1241373 ) ) ( not ( = ?auto_1241372 ?auto_1241374 ) ) ( not ( = ?auto_1241372 ?auto_1241375 ) ) ( not ( = ?auto_1241372 ?auto_1241376 ) ) ( not ( = ?auto_1241372 ?auto_1241377 ) ) ( not ( = ?auto_1241372 ?auto_1241378 ) ) ( not ( = ?auto_1241372 ?auto_1241379 ) ) ( not ( = ?auto_1241372 ?auto_1241380 ) ) ( not ( = ?auto_1241372 ?auto_1241381 ) ) ( not ( = ?auto_1241372 ?auto_1241382 ) ) ( not ( = ?auto_1241373 ?auto_1241374 ) ) ( not ( = ?auto_1241373 ?auto_1241375 ) ) ( not ( = ?auto_1241373 ?auto_1241376 ) ) ( not ( = ?auto_1241373 ?auto_1241377 ) ) ( not ( = ?auto_1241373 ?auto_1241378 ) ) ( not ( = ?auto_1241373 ?auto_1241379 ) ) ( not ( = ?auto_1241373 ?auto_1241380 ) ) ( not ( = ?auto_1241373 ?auto_1241381 ) ) ( not ( = ?auto_1241373 ?auto_1241382 ) ) ( not ( = ?auto_1241374 ?auto_1241375 ) ) ( not ( = ?auto_1241374 ?auto_1241376 ) ) ( not ( = ?auto_1241374 ?auto_1241377 ) ) ( not ( = ?auto_1241374 ?auto_1241378 ) ) ( not ( = ?auto_1241374 ?auto_1241379 ) ) ( not ( = ?auto_1241374 ?auto_1241380 ) ) ( not ( = ?auto_1241374 ?auto_1241381 ) ) ( not ( = ?auto_1241374 ?auto_1241382 ) ) ( not ( = ?auto_1241375 ?auto_1241376 ) ) ( not ( = ?auto_1241375 ?auto_1241377 ) ) ( not ( = ?auto_1241375 ?auto_1241378 ) ) ( not ( = ?auto_1241375 ?auto_1241379 ) ) ( not ( = ?auto_1241375 ?auto_1241380 ) ) ( not ( = ?auto_1241375 ?auto_1241381 ) ) ( not ( = ?auto_1241375 ?auto_1241382 ) ) ( not ( = ?auto_1241376 ?auto_1241377 ) ) ( not ( = ?auto_1241376 ?auto_1241378 ) ) ( not ( = ?auto_1241376 ?auto_1241379 ) ) ( not ( = ?auto_1241376 ?auto_1241380 ) ) ( not ( = ?auto_1241376 ?auto_1241381 ) ) ( not ( = ?auto_1241376 ?auto_1241382 ) ) ( not ( = ?auto_1241377 ?auto_1241378 ) ) ( not ( = ?auto_1241377 ?auto_1241379 ) ) ( not ( = ?auto_1241377 ?auto_1241380 ) ) ( not ( = ?auto_1241377 ?auto_1241381 ) ) ( not ( = ?auto_1241377 ?auto_1241382 ) ) ( not ( = ?auto_1241378 ?auto_1241379 ) ) ( not ( = ?auto_1241378 ?auto_1241380 ) ) ( not ( = ?auto_1241378 ?auto_1241381 ) ) ( not ( = ?auto_1241378 ?auto_1241382 ) ) ( not ( = ?auto_1241379 ?auto_1241380 ) ) ( not ( = ?auto_1241379 ?auto_1241381 ) ) ( not ( = ?auto_1241379 ?auto_1241382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1241380 ?auto_1241381 ?auto_1241382 )
      ( MAKE-14CRATE-VERIFY ?auto_1241368 ?auto_1241369 ?auto_1241370 ?auto_1241371 ?auto_1241372 ?auto_1241373 ?auto_1241374 ?auto_1241375 ?auto_1241376 ?auto_1241377 ?auto_1241378 ?auto_1241379 ?auto_1241380 ?auto_1241381 ?auto_1241382 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241557 - SURFACE
      ?auto_1241558 - SURFACE
      ?auto_1241559 - SURFACE
      ?auto_1241560 - SURFACE
      ?auto_1241561 - SURFACE
      ?auto_1241562 - SURFACE
      ?auto_1241563 - SURFACE
      ?auto_1241564 - SURFACE
      ?auto_1241565 - SURFACE
      ?auto_1241566 - SURFACE
      ?auto_1241567 - SURFACE
      ?auto_1241568 - SURFACE
      ?auto_1241569 - SURFACE
      ?auto_1241570 - SURFACE
      ?auto_1241571 - SURFACE
    )
    :vars
    (
      ?auto_1241574 - HOIST
      ?auto_1241573 - PLACE
      ?auto_1241575 - TRUCK
      ?auto_1241572 - PLACE
      ?auto_1241576 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241574 ?auto_1241573 ) ( SURFACE-AT ?auto_1241570 ?auto_1241573 ) ( CLEAR ?auto_1241570 ) ( IS-CRATE ?auto_1241571 ) ( not ( = ?auto_1241570 ?auto_1241571 ) ) ( AVAILABLE ?auto_1241574 ) ( ON ?auto_1241570 ?auto_1241569 ) ( not ( = ?auto_1241569 ?auto_1241570 ) ) ( not ( = ?auto_1241569 ?auto_1241571 ) ) ( TRUCK-AT ?auto_1241575 ?auto_1241572 ) ( not ( = ?auto_1241572 ?auto_1241573 ) ) ( HOIST-AT ?auto_1241576 ?auto_1241572 ) ( LIFTING ?auto_1241576 ?auto_1241571 ) ( not ( = ?auto_1241574 ?auto_1241576 ) ) ( ON ?auto_1241558 ?auto_1241557 ) ( ON ?auto_1241559 ?auto_1241558 ) ( ON ?auto_1241560 ?auto_1241559 ) ( ON ?auto_1241561 ?auto_1241560 ) ( ON ?auto_1241562 ?auto_1241561 ) ( ON ?auto_1241563 ?auto_1241562 ) ( ON ?auto_1241564 ?auto_1241563 ) ( ON ?auto_1241565 ?auto_1241564 ) ( ON ?auto_1241566 ?auto_1241565 ) ( ON ?auto_1241567 ?auto_1241566 ) ( ON ?auto_1241568 ?auto_1241567 ) ( ON ?auto_1241569 ?auto_1241568 ) ( not ( = ?auto_1241557 ?auto_1241558 ) ) ( not ( = ?auto_1241557 ?auto_1241559 ) ) ( not ( = ?auto_1241557 ?auto_1241560 ) ) ( not ( = ?auto_1241557 ?auto_1241561 ) ) ( not ( = ?auto_1241557 ?auto_1241562 ) ) ( not ( = ?auto_1241557 ?auto_1241563 ) ) ( not ( = ?auto_1241557 ?auto_1241564 ) ) ( not ( = ?auto_1241557 ?auto_1241565 ) ) ( not ( = ?auto_1241557 ?auto_1241566 ) ) ( not ( = ?auto_1241557 ?auto_1241567 ) ) ( not ( = ?auto_1241557 ?auto_1241568 ) ) ( not ( = ?auto_1241557 ?auto_1241569 ) ) ( not ( = ?auto_1241557 ?auto_1241570 ) ) ( not ( = ?auto_1241557 ?auto_1241571 ) ) ( not ( = ?auto_1241558 ?auto_1241559 ) ) ( not ( = ?auto_1241558 ?auto_1241560 ) ) ( not ( = ?auto_1241558 ?auto_1241561 ) ) ( not ( = ?auto_1241558 ?auto_1241562 ) ) ( not ( = ?auto_1241558 ?auto_1241563 ) ) ( not ( = ?auto_1241558 ?auto_1241564 ) ) ( not ( = ?auto_1241558 ?auto_1241565 ) ) ( not ( = ?auto_1241558 ?auto_1241566 ) ) ( not ( = ?auto_1241558 ?auto_1241567 ) ) ( not ( = ?auto_1241558 ?auto_1241568 ) ) ( not ( = ?auto_1241558 ?auto_1241569 ) ) ( not ( = ?auto_1241558 ?auto_1241570 ) ) ( not ( = ?auto_1241558 ?auto_1241571 ) ) ( not ( = ?auto_1241559 ?auto_1241560 ) ) ( not ( = ?auto_1241559 ?auto_1241561 ) ) ( not ( = ?auto_1241559 ?auto_1241562 ) ) ( not ( = ?auto_1241559 ?auto_1241563 ) ) ( not ( = ?auto_1241559 ?auto_1241564 ) ) ( not ( = ?auto_1241559 ?auto_1241565 ) ) ( not ( = ?auto_1241559 ?auto_1241566 ) ) ( not ( = ?auto_1241559 ?auto_1241567 ) ) ( not ( = ?auto_1241559 ?auto_1241568 ) ) ( not ( = ?auto_1241559 ?auto_1241569 ) ) ( not ( = ?auto_1241559 ?auto_1241570 ) ) ( not ( = ?auto_1241559 ?auto_1241571 ) ) ( not ( = ?auto_1241560 ?auto_1241561 ) ) ( not ( = ?auto_1241560 ?auto_1241562 ) ) ( not ( = ?auto_1241560 ?auto_1241563 ) ) ( not ( = ?auto_1241560 ?auto_1241564 ) ) ( not ( = ?auto_1241560 ?auto_1241565 ) ) ( not ( = ?auto_1241560 ?auto_1241566 ) ) ( not ( = ?auto_1241560 ?auto_1241567 ) ) ( not ( = ?auto_1241560 ?auto_1241568 ) ) ( not ( = ?auto_1241560 ?auto_1241569 ) ) ( not ( = ?auto_1241560 ?auto_1241570 ) ) ( not ( = ?auto_1241560 ?auto_1241571 ) ) ( not ( = ?auto_1241561 ?auto_1241562 ) ) ( not ( = ?auto_1241561 ?auto_1241563 ) ) ( not ( = ?auto_1241561 ?auto_1241564 ) ) ( not ( = ?auto_1241561 ?auto_1241565 ) ) ( not ( = ?auto_1241561 ?auto_1241566 ) ) ( not ( = ?auto_1241561 ?auto_1241567 ) ) ( not ( = ?auto_1241561 ?auto_1241568 ) ) ( not ( = ?auto_1241561 ?auto_1241569 ) ) ( not ( = ?auto_1241561 ?auto_1241570 ) ) ( not ( = ?auto_1241561 ?auto_1241571 ) ) ( not ( = ?auto_1241562 ?auto_1241563 ) ) ( not ( = ?auto_1241562 ?auto_1241564 ) ) ( not ( = ?auto_1241562 ?auto_1241565 ) ) ( not ( = ?auto_1241562 ?auto_1241566 ) ) ( not ( = ?auto_1241562 ?auto_1241567 ) ) ( not ( = ?auto_1241562 ?auto_1241568 ) ) ( not ( = ?auto_1241562 ?auto_1241569 ) ) ( not ( = ?auto_1241562 ?auto_1241570 ) ) ( not ( = ?auto_1241562 ?auto_1241571 ) ) ( not ( = ?auto_1241563 ?auto_1241564 ) ) ( not ( = ?auto_1241563 ?auto_1241565 ) ) ( not ( = ?auto_1241563 ?auto_1241566 ) ) ( not ( = ?auto_1241563 ?auto_1241567 ) ) ( not ( = ?auto_1241563 ?auto_1241568 ) ) ( not ( = ?auto_1241563 ?auto_1241569 ) ) ( not ( = ?auto_1241563 ?auto_1241570 ) ) ( not ( = ?auto_1241563 ?auto_1241571 ) ) ( not ( = ?auto_1241564 ?auto_1241565 ) ) ( not ( = ?auto_1241564 ?auto_1241566 ) ) ( not ( = ?auto_1241564 ?auto_1241567 ) ) ( not ( = ?auto_1241564 ?auto_1241568 ) ) ( not ( = ?auto_1241564 ?auto_1241569 ) ) ( not ( = ?auto_1241564 ?auto_1241570 ) ) ( not ( = ?auto_1241564 ?auto_1241571 ) ) ( not ( = ?auto_1241565 ?auto_1241566 ) ) ( not ( = ?auto_1241565 ?auto_1241567 ) ) ( not ( = ?auto_1241565 ?auto_1241568 ) ) ( not ( = ?auto_1241565 ?auto_1241569 ) ) ( not ( = ?auto_1241565 ?auto_1241570 ) ) ( not ( = ?auto_1241565 ?auto_1241571 ) ) ( not ( = ?auto_1241566 ?auto_1241567 ) ) ( not ( = ?auto_1241566 ?auto_1241568 ) ) ( not ( = ?auto_1241566 ?auto_1241569 ) ) ( not ( = ?auto_1241566 ?auto_1241570 ) ) ( not ( = ?auto_1241566 ?auto_1241571 ) ) ( not ( = ?auto_1241567 ?auto_1241568 ) ) ( not ( = ?auto_1241567 ?auto_1241569 ) ) ( not ( = ?auto_1241567 ?auto_1241570 ) ) ( not ( = ?auto_1241567 ?auto_1241571 ) ) ( not ( = ?auto_1241568 ?auto_1241569 ) ) ( not ( = ?auto_1241568 ?auto_1241570 ) ) ( not ( = ?auto_1241568 ?auto_1241571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1241569 ?auto_1241570 ?auto_1241571 )
      ( MAKE-14CRATE-VERIFY ?auto_1241557 ?auto_1241558 ?auto_1241559 ?auto_1241560 ?auto_1241561 ?auto_1241562 ?auto_1241563 ?auto_1241564 ?auto_1241565 ?auto_1241566 ?auto_1241567 ?auto_1241568 ?auto_1241569 ?auto_1241570 ?auto_1241571 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241760 - SURFACE
      ?auto_1241761 - SURFACE
      ?auto_1241762 - SURFACE
      ?auto_1241763 - SURFACE
      ?auto_1241764 - SURFACE
      ?auto_1241765 - SURFACE
      ?auto_1241766 - SURFACE
      ?auto_1241767 - SURFACE
      ?auto_1241768 - SURFACE
      ?auto_1241769 - SURFACE
      ?auto_1241770 - SURFACE
      ?auto_1241771 - SURFACE
      ?auto_1241772 - SURFACE
      ?auto_1241773 - SURFACE
      ?auto_1241774 - SURFACE
    )
    :vars
    (
      ?auto_1241777 - HOIST
      ?auto_1241775 - PLACE
      ?auto_1241778 - TRUCK
      ?auto_1241779 - PLACE
      ?auto_1241780 - HOIST
      ?auto_1241776 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241777 ?auto_1241775 ) ( SURFACE-AT ?auto_1241773 ?auto_1241775 ) ( CLEAR ?auto_1241773 ) ( IS-CRATE ?auto_1241774 ) ( not ( = ?auto_1241773 ?auto_1241774 ) ) ( AVAILABLE ?auto_1241777 ) ( ON ?auto_1241773 ?auto_1241772 ) ( not ( = ?auto_1241772 ?auto_1241773 ) ) ( not ( = ?auto_1241772 ?auto_1241774 ) ) ( TRUCK-AT ?auto_1241778 ?auto_1241779 ) ( not ( = ?auto_1241779 ?auto_1241775 ) ) ( HOIST-AT ?auto_1241780 ?auto_1241779 ) ( not ( = ?auto_1241777 ?auto_1241780 ) ) ( AVAILABLE ?auto_1241780 ) ( SURFACE-AT ?auto_1241774 ?auto_1241779 ) ( ON ?auto_1241774 ?auto_1241776 ) ( CLEAR ?auto_1241774 ) ( not ( = ?auto_1241773 ?auto_1241776 ) ) ( not ( = ?auto_1241774 ?auto_1241776 ) ) ( not ( = ?auto_1241772 ?auto_1241776 ) ) ( ON ?auto_1241761 ?auto_1241760 ) ( ON ?auto_1241762 ?auto_1241761 ) ( ON ?auto_1241763 ?auto_1241762 ) ( ON ?auto_1241764 ?auto_1241763 ) ( ON ?auto_1241765 ?auto_1241764 ) ( ON ?auto_1241766 ?auto_1241765 ) ( ON ?auto_1241767 ?auto_1241766 ) ( ON ?auto_1241768 ?auto_1241767 ) ( ON ?auto_1241769 ?auto_1241768 ) ( ON ?auto_1241770 ?auto_1241769 ) ( ON ?auto_1241771 ?auto_1241770 ) ( ON ?auto_1241772 ?auto_1241771 ) ( not ( = ?auto_1241760 ?auto_1241761 ) ) ( not ( = ?auto_1241760 ?auto_1241762 ) ) ( not ( = ?auto_1241760 ?auto_1241763 ) ) ( not ( = ?auto_1241760 ?auto_1241764 ) ) ( not ( = ?auto_1241760 ?auto_1241765 ) ) ( not ( = ?auto_1241760 ?auto_1241766 ) ) ( not ( = ?auto_1241760 ?auto_1241767 ) ) ( not ( = ?auto_1241760 ?auto_1241768 ) ) ( not ( = ?auto_1241760 ?auto_1241769 ) ) ( not ( = ?auto_1241760 ?auto_1241770 ) ) ( not ( = ?auto_1241760 ?auto_1241771 ) ) ( not ( = ?auto_1241760 ?auto_1241772 ) ) ( not ( = ?auto_1241760 ?auto_1241773 ) ) ( not ( = ?auto_1241760 ?auto_1241774 ) ) ( not ( = ?auto_1241760 ?auto_1241776 ) ) ( not ( = ?auto_1241761 ?auto_1241762 ) ) ( not ( = ?auto_1241761 ?auto_1241763 ) ) ( not ( = ?auto_1241761 ?auto_1241764 ) ) ( not ( = ?auto_1241761 ?auto_1241765 ) ) ( not ( = ?auto_1241761 ?auto_1241766 ) ) ( not ( = ?auto_1241761 ?auto_1241767 ) ) ( not ( = ?auto_1241761 ?auto_1241768 ) ) ( not ( = ?auto_1241761 ?auto_1241769 ) ) ( not ( = ?auto_1241761 ?auto_1241770 ) ) ( not ( = ?auto_1241761 ?auto_1241771 ) ) ( not ( = ?auto_1241761 ?auto_1241772 ) ) ( not ( = ?auto_1241761 ?auto_1241773 ) ) ( not ( = ?auto_1241761 ?auto_1241774 ) ) ( not ( = ?auto_1241761 ?auto_1241776 ) ) ( not ( = ?auto_1241762 ?auto_1241763 ) ) ( not ( = ?auto_1241762 ?auto_1241764 ) ) ( not ( = ?auto_1241762 ?auto_1241765 ) ) ( not ( = ?auto_1241762 ?auto_1241766 ) ) ( not ( = ?auto_1241762 ?auto_1241767 ) ) ( not ( = ?auto_1241762 ?auto_1241768 ) ) ( not ( = ?auto_1241762 ?auto_1241769 ) ) ( not ( = ?auto_1241762 ?auto_1241770 ) ) ( not ( = ?auto_1241762 ?auto_1241771 ) ) ( not ( = ?auto_1241762 ?auto_1241772 ) ) ( not ( = ?auto_1241762 ?auto_1241773 ) ) ( not ( = ?auto_1241762 ?auto_1241774 ) ) ( not ( = ?auto_1241762 ?auto_1241776 ) ) ( not ( = ?auto_1241763 ?auto_1241764 ) ) ( not ( = ?auto_1241763 ?auto_1241765 ) ) ( not ( = ?auto_1241763 ?auto_1241766 ) ) ( not ( = ?auto_1241763 ?auto_1241767 ) ) ( not ( = ?auto_1241763 ?auto_1241768 ) ) ( not ( = ?auto_1241763 ?auto_1241769 ) ) ( not ( = ?auto_1241763 ?auto_1241770 ) ) ( not ( = ?auto_1241763 ?auto_1241771 ) ) ( not ( = ?auto_1241763 ?auto_1241772 ) ) ( not ( = ?auto_1241763 ?auto_1241773 ) ) ( not ( = ?auto_1241763 ?auto_1241774 ) ) ( not ( = ?auto_1241763 ?auto_1241776 ) ) ( not ( = ?auto_1241764 ?auto_1241765 ) ) ( not ( = ?auto_1241764 ?auto_1241766 ) ) ( not ( = ?auto_1241764 ?auto_1241767 ) ) ( not ( = ?auto_1241764 ?auto_1241768 ) ) ( not ( = ?auto_1241764 ?auto_1241769 ) ) ( not ( = ?auto_1241764 ?auto_1241770 ) ) ( not ( = ?auto_1241764 ?auto_1241771 ) ) ( not ( = ?auto_1241764 ?auto_1241772 ) ) ( not ( = ?auto_1241764 ?auto_1241773 ) ) ( not ( = ?auto_1241764 ?auto_1241774 ) ) ( not ( = ?auto_1241764 ?auto_1241776 ) ) ( not ( = ?auto_1241765 ?auto_1241766 ) ) ( not ( = ?auto_1241765 ?auto_1241767 ) ) ( not ( = ?auto_1241765 ?auto_1241768 ) ) ( not ( = ?auto_1241765 ?auto_1241769 ) ) ( not ( = ?auto_1241765 ?auto_1241770 ) ) ( not ( = ?auto_1241765 ?auto_1241771 ) ) ( not ( = ?auto_1241765 ?auto_1241772 ) ) ( not ( = ?auto_1241765 ?auto_1241773 ) ) ( not ( = ?auto_1241765 ?auto_1241774 ) ) ( not ( = ?auto_1241765 ?auto_1241776 ) ) ( not ( = ?auto_1241766 ?auto_1241767 ) ) ( not ( = ?auto_1241766 ?auto_1241768 ) ) ( not ( = ?auto_1241766 ?auto_1241769 ) ) ( not ( = ?auto_1241766 ?auto_1241770 ) ) ( not ( = ?auto_1241766 ?auto_1241771 ) ) ( not ( = ?auto_1241766 ?auto_1241772 ) ) ( not ( = ?auto_1241766 ?auto_1241773 ) ) ( not ( = ?auto_1241766 ?auto_1241774 ) ) ( not ( = ?auto_1241766 ?auto_1241776 ) ) ( not ( = ?auto_1241767 ?auto_1241768 ) ) ( not ( = ?auto_1241767 ?auto_1241769 ) ) ( not ( = ?auto_1241767 ?auto_1241770 ) ) ( not ( = ?auto_1241767 ?auto_1241771 ) ) ( not ( = ?auto_1241767 ?auto_1241772 ) ) ( not ( = ?auto_1241767 ?auto_1241773 ) ) ( not ( = ?auto_1241767 ?auto_1241774 ) ) ( not ( = ?auto_1241767 ?auto_1241776 ) ) ( not ( = ?auto_1241768 ?auto_1241769 ) ) ( not ( = ?auto_1241768 ?auto_1241770 ) ) ( not ( = ?auto_1241768 ?auto_1241771 ) ) ( not ( = ?auto_1241768 ?auto_1241772 ) ) ( not ( = ?auto_1241768 ?auto_1241773 ) ) ( not ( = ?auto_1241768 ?auto_1241774 ) ) ( not ( = ?auto_1241768 ?auto_1241776 ) ) ( not ( = ?auto_1241769 ?auto_1241770 ) ) ( not ( = ?auto_1241769 ?auto_1241771 ) ) ( not ( = ?auto_1241769 ?auto_1241772 ) ) ( not ( = ?auto_1241769 ?auto_1241773 ) ) ( not ( = ?auto_1241769 ?auto_1241774 ) ) ( not ( = ?auto_1241769 ?auto_1241776 ) ) ( not ( = ?auto_1241770 ?auto_1241771 ) ) ( not ( = ?auto_1241770 ?auto_1241772 ) ) ( not ( = ?auto_1241770 ?auto_1241773 ) ) ( not ( = ?auto_1241770 ?auto_1241774 ) ) ( not ( = ?auto_1241770 ?auto_1241776 ) ) ( not ( = ?auto_1241771 ?auto_1241772 ) ) ( not ( = ?auto_1241771 ?auto_1241773 ) ) ( not ( = ?auto_1241771 ?auto_1241774 ) ) ( not ( = ?auto_1241771 ?auto_1241776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1241772 ?auto_1241773 ?auto_1241774 )
      ( MAKE-14CRATE-VERIFY ?auto_1241760 ?auto_1241761 ?auto_1241762 ?auto_1241763 ?auto_1241764 ?auto_1241765 ?auto_1241766 ?auto_1241767 ?auto_1241768 ?auto_1241769 ?auto_1241770 ?auto_1241771 ?auto_1241772 ?auto_1241773 ?auto_1241774 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1241964 - SURFACE
      ?auto_1241965 - SURFACE
      ?auto_1241966 - SURFACE
      ?auto_1241967 - SURFACE
      ?auto_1241968 - SURFACE
      ?auto_1241969 - SURFACE
      ?auto_1241970 - SURFACE
      ?auto_1241971 - SURFACE
      ?auto_1241972 - SURFACE
      ?auto_1241973 - SURFACE
      ?auto_1241974 - SURFACE
      ?auto_1241975 - SURFACE
      ?auto_1241976 - SURFACE
      ?auto_1241977 - SURFACE
      ?auto_1241978 - SURFACE
    )
    :vars
    (
      ?auto_1241980 - HOIST
      ?auto_1241979 - PLACE
      ?auto_1241983 - PLACE
      ?auto_1241982 - HOIST
      ?auto_1241984 - SURFACE
      ?auto_1241981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241980 ?auto_1241979 ) ( SURFACE-AT ?auto_1241977 ?auto_1241979 ) ( CLEAR ?auto_1241977 ) ( IS-CRATE ?auto_1241978 ) ( not ( = ?auto_1241977 ?auto_1241978 ) ) ( AVAILABLE ?auto_1241980 ) ( ON ?auto_1241977 ?auto_1241976 ) ( not ( = ?auto_1241976 ?auto_1241977 ) ) ( not ( = ?auto_1241976 ?auto_1241978 ) ) ( not ( = ?auto_1241983 ?auto_1241979 ) ) ( HOIST-AT ?auto_1241982 ?auto_1241983 ) ( not ( = ?auto_1241980 ?auto_1241982 ) ) ( AVAILABLE ?auto_1241982 ) ( SURFACE-AT ?auto_1241978 ?auto_1241983 ) ( ON ?auto_1241978 ?auto_1241984 ) ( CLEAR ?auto_1241978 ) ( not ( = ?auto_1241977 ?auto_1241984 ) ) ( not ( = ?auto_1241978 ?auto_1241984 ) ) ( not ( = ?auto_1241976 ?auto_1241984 ) ) ( TRUCK-AT ?auto_1241981 ?auto_1241979 ) ( ON ?auto_1241965 ?auto_1241964 ) ( ON ?auto_1241966 ?auto_1241965 ) ( ON ?auto_1241967 ?auto_1241966 ) ( ON ?auto_1241968 ?auto_1241967 ) ( ON ?auto_1241969 ?auto_1241968 ) ( ON ?auto_1241970 ?auto_1241969 ) ( ON ?auto_1241971 ?auto_1241970 ) ( ON ?auto_1241972 ?auto_1241971 ) ( ON ?auto_1241973 ?auto_1241972 ) ( ON ?auto_1241974 ?auto_1241973 ) ( ON ?auto_1241975 ?auto_1241974 ) ( ON ?auto_1241976 ?auto_1241975 ) ( not ( = ?auto_1241964 ?auto_1241965 ) ) ( not ( = ?auto_1241964 ?auto_1241966 ) ) ( not ( = ?auto_1241964 ?auto_1241967 ) ) ( not ( = ?auto_1241964 ?auto_1241968 ) ) ( not ( = ?auto_1241964 ?auto_1241969 ) ) ( not ( = ?auto_1241964 ?auto_1241970 ) ) ( not ( = ?auto_1241964 ?auto_1241971 ) ) ( not ( = ?auto_1241964 ?auto_1241972 ) ) ( not ( = ?auto_1241964 ?auto_1241973 ) ) ( not ( = ?auto_1241964 ?auto_1241974 ) ) ( not ( = ?auto_1241964 ?auto_1241975 ) ) ( not ( = ?auto_1241964 ?auto_1241976 ) ) ( not ( = ?auto_1241964 ?auto_1241977 ) ) ( not ( = ?auto_1241964 ?auto_1241978 ) ) ( not ( = ?auto_1241964 ?auto_1241984 ) ) ( not ( = ?auto_1241965 ?auto_1241966 ) ) ( not ( = ?auto_1241965 ?auto_1241967 ) ) ( not ( = ?auto_1241965 ?auto_1241968 ) ) ( not ( = ?auto_1241965 ?auto_1241969 ) ) ( not ( = ?auto_1241965 ?auto_1241970 ) ) ( not ( = ?auto_1241965 ?auto_1241971 ) ) ( not ( = ?auto_1241965 ?auto_1241972 ) ) ( not ( = ?auto_1241965 ?auto_1241973 ) ) ( not ( = ?auto_1241965 ?auto_1241974 ) ) ( not ( = ?auto_1241965 ?auto_1241975 ) ) ( not ( = ?auto_1241965 ?auto_1241976 ) ) ( not ( = ?auto_1241965 ?auto_1241977 ) ) ( not ( = ?auto_1241965 ?auto_1241978 ) ) ( not ( = ?auto_1241965 ?auto_1241984 ) ) ( not ( = ?auto_1241966 ?auto_1241967 ) ) ( not ( = ?auto_1241966 ?auto_1241968 ) ) ( not ( = ?auto_1241966 ?auto_1241969 ) ) ( not ( = ?auto_1241966 ?auto_1241970 ) ) ( not ( = ?auto_1241966 ?auto_1241971 ) ) ( not ( = ?auto_1241966 ?auto_1241972 ) ) ( not ( = ?auto_1241966 ?auto_1241973 ) ) ( not ( = ?auto_1241966 ?auto_1241974 ) ) ( not ( = ?auto_1241966 ?auto_1241975 ) ) ( not ( = ?auto_1241966 ?auto_1241976 ) ) ( not ( = ?auto_1241966 ?auto_1241977 ) ) ( not ( = ?auto_1241966 ?auto_1241978 ) ) ( not ( = ?auto_1241966 ?auto_1241984 ) ) ( not ( = ?auto_1241967 ?auto_1241968 ) ) ( not ( = ?auto_1241967 ?auto_1241969 ) ) ( not ( = ?auto_1241967 ?auto_1241970 ) ) ( not ( = ?auto_1241967 ?auto_1241971 ) ) ( not ( = ?auto_1241967 ?auto_1241972 ) ) ( not ( = ?auto_1241967 ?auto_1241973 ) ) ( not ( = ?auto_1241967 ?auto_1241974 ) ) ( not ( = ?auto_1241967 ?auto_1241975 ) ) ( not ( = ?auto_1241967 ?auto_1241976 ) ) ( not ( = ?auto_1241967 ?auto_1241977 ) ) ( not ( = ?auto_1241967 ?auto_1241978 ) ) ( not ( = ?auto_1241967 ?auto_1241984 ) ) ( not ( = ?auto_1241968 ?auto_1241969 ) ) ( not ( = ?auto_1241968 ?auto_1241970 ) ) ( not ( = ?auto_1241968 ?auto_1241971 ) ) ( not ( = ?auto_1241968 ?auto_1241972 ) ) ( not ( = ?auto_1241968 ?auto_1241973 ) ) ( not ( = ?auto_1241968 ?auto_1241974 ) ) ( not ( = ?auto_1241968 ?auto_1241975 ) ) ( not ( = ?auto_1241968 ?auto_1241976 ) ) ( not ( = ?auto_1241968 ?auto_1241977 ) ) ( not ( = ?auto_1241968 ?auto_1241978 ) ) ( not ( = ?auto_1241968 ?auto_1241984 ) ) ( not ( = ?auto_1241969 ?auto_1241970 ) ) ( not ( = ?auto_1241969 ?auto_1241971 ) ) ( not ( = ?auto_1241969 ?auto_1241972 ) ) ( not ( = ?auto_1241969 ?auto_1241973 ) ) ( not ( = ?auto_1241969 ?auto_1241974 ) ) ( not ( = ?auto_1241969 ?auto_1241975 ) ) ( not ( = ?auto_1241969 ?auto_1241976 ) ) ( not ( = ?auto_1241969 ?auto_1241977 ) ) ( not ( = ?auto_1241969 ?auto_1241978 ) ) ( not ( = ?auto_1241969 ?auto_1241984 ) ) ( not ( = ?auto_1241970 ?auto_1241971 ) ) ( not ( = ?auto_1241970 ?auto_1241972 ) ) ( not ( = ?auto_1241970 ?auto_1241973 ) ) ( not ( = ?auto_1241970 ?auto_1241974 ) ) ( not ( = ?auto_1241970 ?auto_1241975 ) ) ( not ( = ?auto_1241970 ?auto_1241976 ) ) ( not ( = ?auto_1241970 ?auto_1241977 ) ) ( not ( = ?auto_1241970 ?auto_1241978 ) ) ( not ( = ?auto_1241970 ?auto_1241984 ) ) ( not ( = ?auto_1241971 ?auto_1241972 ) ) ( not ( = ?auto_1241971 ?auto_1241973 ) ) ( not ( = ?auto_1241971 ?auto_1241974 ) ) ( not ( = ?auto_1241971 ?auto_1241975 ) ) ( not ( = ?auto_1241971 ?auto_1241976 ) ) ( not ( = ?auto_1241971 ?auto_1241977 ) ) ( not ( = ?auto_1241971 ?auto_1241978 ) ) ( not ( = ?auto_1241971 ?auto_1241984 ) ) ( not ( = ?auto_1241972 ?auto_1241973 ) ) ( not ( = ?auto_1241972 ?auto_1241974 ) ) ( not ( = ?auto_1241972 ?auto_1241975 ) ) ( not ( = ?auto_1241972 ?auto_1241976 ) ) ( not ( = ?auto_1241972 ?auto_1241977 ) ) ( not ( = ?auto_1241972 ?auto_1241978 ) ) ( not ( = ?auto_1241972 ?auto_1241984 ) ) ( not ( = ?auto_1241973 ?auto_1241974 ) ) ( not ( = ?auto_1241973 ?auto_1241975 ) ) ( not ( = ?auto_1241973 ?auto_1241976 ) ) ( not ( = ?auto_1241973 ?auto_1241977 ) ) ( not ( = ?auto_1241973 ?auto_1241978 ) ) ( not ( = ?auto_1241973 ?auto_1241984 ) ) ( not ( = ?auto_1241974 ?auto_1241975 ) ) ( not ( = ?auto_1241974 ?auto_1241976 ) ) ( not ( = ?auto_1241974 ?auto_1241977 ) ) ( not ( = ?auto_1241974 ?auto_1241978 ) ) ( not ( = ?auto_1241974 ?auto_1241984 ) ) ( not ( = ?auto_1241975 ?auto_1241976 ) ) ( not ( = ?auto_1241975 ?auto_1241977 ) ) ( not ( = ?auto_1241975 ?auto_1241978 ) ) ( not ( = ?auto_1241975 ?auto_1241984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1241976 ?auto_1241977 ?auto_1241978 )
      ( MAKE-14CRATE-VERIFY ?auto_1241964 ?auto_1241965 ?auto_1241966 ?auto_1241967 ?auto_1241968 ?auto_1241969 ?auto_1241970 ?auto_1241971 ?auto_1241972 ?auto_1241973 ?auto_1241974 ?auto_1241975 ?auto_1241976 ?auto_1241977 ?auto_1241978 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1242168 - SURFACE
      ?auto_1242169 - SURFACE
      ?auto_1242170 - SURFACE
      ?auto_1242171 - SURFACE
      ?auto_1242172 - SURFACE
      ?auto_1242173 - SURFACE
      ?auto_1242174 - SURFACE
      ?auto_1242175 - SURFACE
      ?auto_1242176 - SURFACE
      ?auto_1242177 - SURFACE
      ?auto_1242178 - SURFACE
      ?auto_1242179 - SURFACE
      ?auto_1242180 - SURFACE
      ?auto_1242181 - SURFACE
      ?auto_1242182 - SURFACE
    )
    :vars
    (
      ?auto_1242187 - HOIST
      ?auto_1242183 - PLACE
      ?auto_1242185 - PLACE
      ?auto_1242186 - HOIST
      ?auto_1242188 - SURFACE
      ?auto_1242184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1242187 ?auto_1242183 ) ( IS-CRATE ?auto_1242182 ) ( not ( = ?auto_1242181 ?auto_1242182 ) ) ( not ( = ?auto_1242180 ?auto_1242181 ) ) ( not ( = ?auto_1242180 ?auto_1242182 ) ) ( not ( = ?auto_1242185 ?auto_1242183 ) ) ( HOIST-AT ?auto_1242186 ?auto_1242185 ) ( not ( = ?auto_1242187 ?auto_1242186 ) ) ( AVAILABLE ?auto_1242186 ) ( SURFACE-AT ?auto_1242182 ?auto_1242185 ) ( ON ?auto_1242182 ?auto_1242188 ) ( CLEAR ?auto_1242182 ) ( not ( = ?auto_1242181 ?auto_1242188 ) ) ( not ( = ?auto_1242182 ?auto_1242188 ) ) ( not ( = ?auto_1242180 ?auto_1242188 ) ) ( TRUCK-AT ?auto_1242184 ?auto_1242183 ) ( SURFACE-AT ?auto_1242180 ?auto_1242183 ) ( CLEAR ?auto_1242180 ) ( LIFTING ?auto_1242187 ?auto_1242181 ) ( IS-CRATE ?auto_1242181 ) ( ON ?auto_1242169 ?auto_1242168 ) ( ON ?auto_1242170 ?auto_1242169 ) ( ON ?auto_1242171 ?auto_1242170 ) ( ON ?auto_1242172 ?auto_1242171 ) ( ON ?auto_1242173 ?auto_1242172 ) ( ON ?auto_1242174 ?auto_1242173 ) ( ON ?auto_1242175 ?auto_1242174 ) ( ON ?auto_1242176 ?auto_1242175 ) ( ON ?auto_1242177 ?auto_1242176 ) ( ON ?auto_1242178 ?auto_1242177 ) ( ON ?auto_1242179 ?auto_1242178 ) ( ON ?auto_1242180 ?auto_1242179 ) ( not ( = ?auto_1242168 ?auto_1242169 ) ) ( not ( = ?auto_1242168 ?auto_1242170 ) ) ( not ( = ?auto_1242168 ?auto_1242171 ) ) ( not ( = ?auto_1242168 ?auto_1242172 ) ) ( not ( = ?auto_1242168 ?auto_1242173 ) ) ( not ( = ?auto_1242168 ?auto_1242174 ) ) ( not ( = ?auto_1242168 ?auto_1242175 ) ) ( not ( = ?auto_1242168 ?auto_1242176 ) ) ( not ( = ?auto_1242168 ?auto_1242177 ) ) ( not ( = ?auto_1242168 ?auto_1242178 ) ) ( not ( = ?auto_1242168 ?auto_1242179 ) ) ( not ( = ?auto_1242168 ?auto_1242180 ) ) ( not ( = ?auto_1242168 ?auto_1242181 ) ) ( not ( = ?auto_1242168 ?auto_1242182 ) ) ( not ( = ?auto_1242168 ?auto_1242188 ) ) ( not ( = ?auto_1242169 ?auto_1242170 ) ) ( not ( = ?auto_1242169 ?auto_1242171 ) ) ( not ( = ?auto_1242169 ?auto_1242172 ) ) ( not ( = ?auto_1242169 ?auto_1242173 ) ) ( not ( = ?auto_1242169 ?auto_1242174 ) ) ( not ( = ?auto_1242169 ?auto_1242175 ) ) ( not ( = ?auto_1242169 ?auto_1242176 ) ) ( not ( = ?auto_1242169 ?auto_1242177 ) ) ( not ( = ?auto_1242169 ?auto_1242178 ) ) ( not ( = ?auto_1242169 ?auto_1242179 ) ) ( not ( = ?auto_1242169 ?auto_1242180 ) ) ( not ( = ?auto_1242169 ?auto_1242181 ) ) ( not ( = ?auto_1242169 ?auto_1242182 ) ) ( not ( = ?auto_1242169 ?auto_1242188 ) ) ( not ( = ?auto_1242170 ?auto_1242171 ) ) ( not ( = ?auto_1242170 ?auto_1242172 ) ) ( not ( = ?auto_1242170 ?auto_1242173 ) ) ( not ( = ?auto_1242170 ?auto_1242174 ) ) ( not ( = ?auto_1242170 ?auto_1242175 ) ) ( not ( = ?auto_1242170 ?auto_1242176 ) ) ( not ( = ?auto_1242170 ?auto_1242177 ) ) ( not ( = ?auto_1242170 ?auto_1242178 ) ) ( not ( = ?auto_1242170 ?auto_1242179 ) ) ( not ( = ?auto_1242170 ?auto_1242180 ) ) ( not ( = ?auto_1242170 ?auto_1242181 ) ) ( not ( = ?auto_1242170 ?auto_1242182 ) ) ( not ( = ?auto_1242170 ?auto_1242188 ) ) ( not ( = ?auto_1242171 ?auto_1242172 ) ) ( not ( = ?auto_1242171 ?auto_1242173 ) ) ( not ( = ?auto_1242171 ?auto_1242174 ) ) ( not ( = ?auto_1242171 ?auto_1242175 ) ) ( not ( = ?auto_1242171 ?auto_1242176 ) ) ( not ( = ?auto_1242171 ?auto_1242177 ) ) ( not ( = ?auto_1242171 ?auto_1242178 ) ) ( not ( = ?auto_1242171 ?auto_1242179 ) ) ( not ( = ?auto_1242171 ?auto_1242180 ) ) ( not ( = ?auto_1242171 ?auto_1242181 ) ) ( not ( = ?auto_1242171 ?auto_1242182 ) ) ( not ( = ?auto_1242171 ?auto_1242188 ) ) ( not ( = ?auto_1242172 ?auto_1242173 ) ) ( not ( = ?auto_1242172 ?auto_1242174 ) ) ( not ( = ?auto_1242172 ?auto_1242175 ) ) ( not ( = ?auto_1242172 ?auto_1242176 ) ) ( not ( = ?auto_1242172 ?auto_1242177 ) ) ( not ( = ?auto_1242172 ?auto_1242178 ) ) ( not ( = ?auto_1242172 ?auto_1242179 ) ) ( not ( = ?auto_1242172 ?auto_1242180 ) ) ( not ( = ?auto_1242172 ?auto_1242181 ) ) ( not ( = ?auto_1242172 ?auto_1242182 ) ) ( not ( = ?auto_1242172 ?auto_1242188 ) ) ( not ( = ?auto_1242173 ?auto_1242174 ) ) ( not ( = ?auto_1242173 ?auto_1242175 ) ) ( not ( = ?auto_1242173 ?auto_1242176 ) ) ( not ( = ?auto_1242173 ?auto_1242177 ) ) ( not ( = ?auto_1242173 ?auto_1242178 ) ) ( not ( = ?auto_1242173 ?auto_1242179 ) ) ( not ( = ?auto_1242173 ?auto_1242180 ) ) ( not ( = ?auto_1242173 ?auto_1242181 ) ) ( not ( = ?auto_1242173 ?auto_1242182 ) ) ( not ( = ?auto_1242173 ?auto_1242188 ) ) ( not ( = ?auto_1242174 ?auto_1242175 ) ) ( not ( = ?auto_1242174 ?auto_1242176 ) ) ( not ( = ?auto_1242174 ?auto_1242177 ) ) ( not ( = ?auto_1242174 ?auto_1242178 ) ) ( not ( = ?auto_1242174 ?auto_1242179 ) ) ( not ( = ?auto_1242174 ?auto_1242180 ) ) ( not ( = ?auto_1242174 ?auto_1242181 ) ) ( not ( = ?auto_1242174 ?auto_1242182 ) ) ( not ( = ?auto_1242174 ?auto_1242188 ) ) ( not ( = ?auto_1242175 ?auto_1242176 ) ) ( not ( = ?auto_1242175 ?auto_1242177 ) ) ( not ( = ?auto_1242175 ?auto_1242178 ) ) ( not ( = ?auto_1242175 ?auto_1242179 ) ) ( not ( = ?auto_1242175 ?auto_1242180 ) ) ( not ( = ?auto_1242175 ?auto_1242181 ) ) ( not ( = ?auto_1242175 ?auto_1242182 ) ) ( not ( = ?auto_1242175 ?auto_1242188 ) ) ( not ( = ?auto_1242176 ?auto_1242177 ) ) ( not ( = ?auto_1242176 ?auto_1242178 ) ) ( not ( = ?auto_1242176 ?auto_1242179 ) ) ( not ( = ?auto_1242176 ?auto_1242180 ) ) ( not ( = ?auto_1242176 ?auto_1242181 ) ) ( not ( = ?auto_1242176 ?auto_1242182 ) ) ( not ( = ?auto_1242176 ?auto_1242188 ) ) ( not ( = ?auto_1242177 ?auto_1242178 ) ) ( not ( = ?auto_1242177 ?auto_1242179 ) ) ( not ( = ?auto_1242177 ?auto_1242180 ) ) ( not ( = ?auto_1242177 ?auto_1242181 ) ) ( not ( = ?auto_1242177 ?auto_1242182 ) ) ( not ( = ?auto_1242177 ?auto_1242188 ) ) ( not ( = ?auto_1242178 ?auto_1242179 ) ) ( not ( = ?auto_1242178 ?auto_1242180 ) ) ( not ( = ?auto_1242178 ?auto_1242181 ) ) ( not ( = ?auto_1242178 ?auto_1242182 ) ) ( not ( = ?auto_1242178 ?auto_1242188 ) ) ( not ( = ?auto_1242179 ?auto_1242180 ) ) ( not ( = ?auto_1242179 ?auto_1242181 ) ) ( not ( = ?auto_1242179 ?auto_1242182 ) ) ( not ( = ?auto_1242179 ?auto_1242188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1242180 ?auto_1242181 ?auto_1242182 )
      ( MAKE-14CRATE-VERIFY ?auto_1242168 ?auto_1242169 ?auto_1242170 ?auto_1242171 ?auto_1242172 ?auto_1242173 ?auto_1242174 ?auto_1242175 ?auto_1242176 ?auto_1242177 ?auto_1242178 ?auto_1242179 ?auto_1242180 ?auto_1242181 ?auto_1242182 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1242372 - SURFACE
      ?auto_1242373 - SURFACE
      ?auto_1242374 - SURFACE
      ?auto_1242375 - SURFACE
      ?auto_1242376 - SURFACE
      ?auto_1242377 - SURFACE
      ?auto_1242378 - SURFACE
      ?auto_1242379 - SURFACE
      ?auto_1242380 - SURFACE
      ?auto_1242381 - SURFACE
      ?auto_1242382 - SURFACE
      ?auto_1242383 - SURFACE
      ?auto_1242384 - SURFACE
      ?auto_1242385 - SURFACE
      ?auto_1242386 - SURFACE
    )
    :vars
    (
      ?auto_1242390 - HOIST
      ?auto_1242387 - PLACE
      ?auto_1242389 - PLACE
      ?auto_1242392 - HOIST
      ?auto_1242391 - SURFACE
      ?auto_1242388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1242390 ?auto_1242387 ) ( IS-CRATE ?auto_1242386 ) ( not ( = ?auto_1242385 ?auto_1242386 ) ) ( not ( = ?auto_1242384 ?auto_1242385 ) ) ( not ( = ?auto_1242384 ?auto_1242386 ) ) ( not ( = ?auto_1242389 ?auto_1242387 ) ) ( HOIST-AT ?auto_1242392 ?auto_1242389 ) ( not ( = ?auto_1242390 ?auto_1242392 ) ) ( AVAILABLE ?auto_1242392 ) ( SURFACE-AT ?auto_1242386 ?auto_1242389 ) ( ON ?auto_1242386 ?auto_1242391 ) ( CLEAR ?auto_1242386 ) ( not ( = ?auto_1242385 ?auto_1242391 ) ) ( not ( = ?auto_1242386 ?auto_1242391 ) ) ( not ( = ?auto_1242384 ?auto_1242391 ) ) ( TRUCK-AT ?auto_1242388 ?auto_1242387 ) ( SURFACE-AT ?auto_1242384 ?auto_1242387 ) ( CLEAR ?auto_1242384 ) ( IS-CRATE ?auto_1242385 ) ( AVAILABLE ?auto_1242390 ) ( IN ?auto_1242385 ?auto_1242388 ) ( ON ?auto_1242373 ?auto_1242372 ) ( ON ?auto_1242374 ?auto_1242373 ) ( ON ?auto_1242375 ?auto_1242374 ) ( ON ?auto_1242376 ?auto_1242375 ) ( ON ?auto_1242377 ?auto_1242376 ) ( ON ?auto_1242378 ?auto_1242377 ) ( ON ?auto_1242379 ?auto_1242378 ) ( ON ?auto_1242380 ?auto_1242379 ) ( ON ?auto_1242381 ?auto_1242380 ) ( ON ?auto_1242382 ?auto_1242381 ) ( ON ?auto_1242383 ?auto_1242382 ) ( ON ?auto_1242384 ?auto_1242383 ) ( not ( = ?auto_1242372 ?auto_1242373 ) ) ( not ( = ?auto_1242372 ?auto_1242374 ) ) ( not ( = ?auto_1242372 ?auto_1242375 ) ) ( not ( = ?auto_1242372 ?auto_1242376 ) ) ( not ( = ?auto_1242372 ?auto_1242377 ) ) ( not ( = ?auto_1242372 ?auto_1242378 ) ) ( not ( = ?auto_1242372 ?auto_1242379 ) ) ( not ( = ?auto_1242372 ?auto_1242380 ) ) ( not ( = ?auto_1242372 ?auto_1242381 ) ) ( not ( = ?auto_1242372 ?auto_1242382 ) ) ( not ( = ?auto_1242372 ?auto_1242383 ) ) ( not ( = ?auto_1242372 ?auto_1242384 ) ) ( not ( = ?auto_1242372 ?auto_1242385 ) ) ( not ( = ?auto_1242372 ?auto_1242386 ) ) ( not ( = ?auto_1242372 ?auto_1242391 ) ) ( not ( = ?auto_1242373 ?auto_1242374 ) ) ( not ( = ?auto_1242373 ?auto_1242375 ) ) ( not ( = ?auto_1242373 ?auto_1242376 ) ) ( not ( = ?auto_1242373 ?auto_1242377 ) ) ( not ( = ?auto_1242373 ?auto_1242378 ) ) ( not ( = ?auto_1242373 ?auto_1242379 ) ) ( not ( = ?auto_1242373 ?auto_1242380 ) ) ( not ( = ?auto_1242373 ?auto_1242381 ) ) ( not ( = ?auto_1242373 ?auto_1242382 ) ) ( not ( = ?auto_1242373 ?auto_1242383 ) ) ( not ( = ?auto_1242373 ?auto_1242384 ) ) ( not ( = ?auto_1242373 ?auto_1242385 ) ) ( not ( = ?auto_1242373 ?auto_1242386 ) ) ( not ( = ?auto_1242373 ?auto_1242391 ) ) ( not ( = ?auto_1242374 ?auto_1242375 ) ) ( not ( = ?auto_1242374 ?auto_1242376 ) ) ( not ( = ?auto_1242374 ?auto_1242377 ) ) ( not ( = ?auto_1242374 ?auto_1242378 ) ) ( not ( = ?auto_1242374 ?auto_1242379 ) ) ( not ( = ?auto_1242374 ?auto_1242380 ) ) ( not ( = ?auto_1242374 ?auto_1242381 ) ) ( not ( = ?auto_1242374 ?auto_1242382 ) ) ( not ( = ?auto_1242374 ?auto_1242383 ) ) ( not ( = ?auto_1242374 ?auto_1242384 ) ) ( not ( = ?auto_1242374 ?auto_1242385 ) ) ( not ( = ?auto_1242374 ?auto_1242386 ) ) ( not ( = ?auto_1242374 ?auto_1242391 ) ) ( not ( = ?auto_1242375 ?auto_1242376 ) ) ( not ( = ?auto_1242375 ?auto_1242377 ) ) ( not ( = ?auto_1242375 ?auto_1242378 ) ) ( not ( = ?auto_1242375 ?auto_1242379 ) ) ( not ( = ?auto_1242375 ?auto_1242380 ) ) ( not ( = ?auto_1242375 ?auto_1242381 ) ) ( not ( = ?auto_1242375 ?auto_1242382 ) ) ( not ( = ?auto_1242375 ?auto_1242383 ) ) ( not ( = ?auto_1242375 ?auto_1242384 ) ) ( not ( = ?auto_1242375 ?auto_1242385 ) ) ( not ( = ?auto_1242375 ?auto_1242386 ) ) ( not ( = ?auto_1242375 ?auto_1242391 ) ) ( not ( = ?auto_1242376 ?auto_1242377 ) ) ( not ( = ?auto_1242376 ?auto_1242378 ) ) ( not ( = ?auto_1242376 ?auto_1242379 ) ) ( not ( = ?auto_1242376 ?auto_1242380 ) ) ( not ( = ?auto_1242376 ?auto_1242381 ) ) ( not ( = ?auto_1242376 ?auto_1242382 ) ) ( not ( = ?auto_1242376 ?auto_1242383 ) ) ( not ( = ?auto_1242376 ?auto_1242384 ) ) ( not ( = ?auto_1242376 ?auto_1242385 ) ) ( not ( = ?auto_1242376 ?auto_1242386 ) ) ( not ( = ?auto_1242376 ?auto_1242391 ) ) ( not ( = ?auto_1242377 ?auto_1242378 ) ) ( not ( = ?auto_1242377 ?auto_1242379 ) ) ( not ( = ?auto_1242377 ?auto_1242380 ) ) ( not ( = ?auto_1242377 ?auto_1242381 ) ) ( not ( = ?auto_1242377 ?auto_1242382 ) ) ( not ( = ?auto_1242377 ?auto_1242383 ) ) ( not ( = ?auto_1242377 ?auto_1242384 ) ) ( not ( = ?auto_1242377 ?auto_1242385 ) ) ( not ( = ?auto_1242377 ?auto_1242386 ) ) ( not ( = ?auto_1242377 ?auto_1242391 ) ) ( not ( = ?auto_1242378 ?auto_1242379 ) ) ( not ( = ?auto_1242378 ?auto_1242380 ) ) ( not ( = ?auto_1242378 ?auto_1242381 ) ) ( not ( = ?auto_1242378 ?auto_1242382 ) ) ( not ( = ?auto_1242378 ?auto_1242383 ) ) ( not ( = ?auto_1242378 ?auto_1242384 ) ) ( not ( = ?auto_1242378 ?auto_1242385 ) ) ( not ( = ?auto_1242378 ?auto_1242386 ) ) ( not ( = ?auto_1242378 ?auto_1242391 ) ) ( not ( = ?auto_1242379 ?auto_1242380 ) ) ( not ( = ?auto_1242379 ?auto_1242381 ) ) ( not ( = ?auto_1242379 ?auto_1242382 ) ) ( not ( = ?auto_1242379 ?auto_1242383 ) ) ( not ( = ?auto_1242379 ?auto_1242384 ) ) ( not ( = ?auto_1242379 ?auto_1242385 ) ) ( not ( = ?auto_1242379 ?auto_1242386 ) ) ( not ( = ?auto_1242379 ?auto_1242391 ) ) ( not ( = ?auto_1242380 ?auto_1242381 ) ) ( not ( = ?auto_1242380 ?auto_1242382 ) ) ( not ( = ?auto_1242380 ?auto_1242383 ) ) ( not ( = ?auto_1242380 ?auto_1242384 ) ) ( not ( = ?auto_1242380 ?auto_1242385 ) ) ( not ( = ?auto_1242380 ?auto_1242386 ) ) ( not ( = ?auto_1242380 ?auto_1242391 ) ) ( not ( = ?auto_1242381 ?auto_1242382 ) ) ( not ( = ?auto_1242381 ?auto_1242383 ) ) ( not ( = ?auto_1242381 ?auto_1242384 ) ) ( not ( = ?auto_1242381 ?auto_1242385 ) ) ( not ( = ?auto_1242381 ?auto_1242386 ) ) ( not ( = ?auto_1242381 ?auto_1242391 ) ) ( not ( = ?auto_1242382 ?auto_1242383 ) ) ( not ( = ?auto_1242382 ?auto_1242384 ) ) ( not ( = ?auto_1242382 ?auto_1242385 ) ) ( not ( = ?auto_1242382 ?auto_1242386 ) ) ( not ( = ?auto_1242382 ?auto_1242391 ) ) ( not ( = ?auto_1242383 ?auto_1242384 ) ) ( not ( = ?auto_1242383 ?auto_1242385 ) ) ( not ( = ?auto_1242383 ?auto_1242386 ) ) ( not ( = ?auto_1242383 ?auto_1242391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1242384 ?auto_1242385 ?auto_1242386 )
      ( MAKE-14CRATE-VERIFY ?auto_1242372 ?auto_1242373 ?auto_1242374 ?auto_1242375 ?auto_1242376 ?auto_1242377 ?auto_1242378 ?auto_1242379 ?auto_1242380 ?auto_1242381 ?auto_1242382 ?auto_1242383 ?auto_1242384 ?auto_1242385 ?auto_1242386 ) )
  )

)

