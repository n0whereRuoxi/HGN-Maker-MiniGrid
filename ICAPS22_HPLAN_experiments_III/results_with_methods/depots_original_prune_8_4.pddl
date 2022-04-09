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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152713 - SURFACE
      ?auto_152714 - SURFACE
    )
    :vars
    (
      ?auto_152715 - HOIST
      ?auto_152716 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152715 ?auto_152716 ) ( SURFACE-AT ?auto_152713 ?auto_152716 ) ( CLEAR ?auto_152713 ) ( LIFTING ?auto_152715 ?auto_152714 ) ( IS-CRATE ?auto_152714 ) ( not ( = ?auto_152713 ?auto_152714 ) ) )
    :subtasks
    ( ( !DROP ?auto_152715 ?auto_152714 ?auto_152713 ?auto_152716 )
      ( MAKE-1CRATE-VERIFY ?auto_152713 ?auto_152714 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152717 - SURFACE
      ?auto_152718 - SURFACE
    )
    :vars
    (
      ?auto_152719 - HOIST
      ?auto_152720 - PLACE
      ?auto_152721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152719 ?auto_152720 ) ( SURFACE-AT ?auto_152717 ?auto_152720 ) ( CLEAR ?auto_152717 ) ( IS-CRATE ?auto_152718 ) ( not ( = ?auto_152717 ?auto_152718 ) ) ( TRUCK-AT ?auto_152721 ?auto_152720 ) ( AVAILABLE ?auto_152719 ) ( IN ?auto_152718 ?auto_152721 ) )
    :subtasks
    ( ( !UNLOAD ?auto_152719 ?auto_152718 ?auto_152721 ?auto_152720 )
      ( MAKE-1CRATE ?auto_152717 ?auto_152718 )
      ( MAKE-1CRATE-VERIFY ?auto_152717 ?auto_152718 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152722 - SURFACE
      ?auto_152723 - SURFACE
    )
    :vars
    (
      ?auto_152724 - HOIST
      ?auto_152725 - PLACE
      ?auto_152726 - TRUCK
      ?auto_152727 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152724 ?auto_152725 ) ( SURFACE-AT ?auto_152722 ?auto_152725 ) ( CLEAR ?auto_152722 ) ( IS-CRATE ?auto_152723 ) ( not ( = ?auto_152722 ?auto_152723 ) ) ( AVAILABLE ?auto_152724 ) ( IN ?auto_152723 ?auto_152726 ) ( TRUCK-AT ?auto_152726 ?auto_152727 ) ( not ( = ?auto_152727 ?auto_152725 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_152726 ?auto_152727 ?auto_152725 )
      ( MAKE-1CRATE ?auto_152722 ?auto_152723 )
      ( MAKE-1CRATE-VERIFY ?auto_152722 ?auto_152723 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152728 - SURFACE
      ?auto_152729 - SURFACE
    )
    :vars
    (
      ?auto_152732 - HOIST
      ?auto_152733 - PLACE
      ?auto_152730 - TRUCK
      ?auto_152731 - PLACE
      ?auto_152734 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_152732 ?auto_152733 ) ( SURFACE-AT ?auto_152728 ?auto_152733 ) ( CLEAR ?auto_152728 ) ( IS-CRATE ?auto_152729 ) ( not ( = ?auto_152728 ?auto_152729 ) ) ( AVAILABLE ?auto_152732 ) ( TRUCK-AT ?auto_152730 ?auto_152731 ) ( not ( = ?auto_152731 ?auto_152733 ) ) ( HOIST-AT ?auto_152734 ?auto_152731 ) ( LIFTING ?auto_152734 ?auto_152729 ) ( not ( = ?auto_152732 ?auto_152734 ) ) )
    :subtasks
    ( ( !LOAD ?auto_152734 ?auto_152729 ?auto_152730 ?auto_152731 )
      ( MAKE-1CRATE ?auto_152728 ?auto_152729 )
      ( MAKE-1CRATE-VERIFY ?auto_152728 ?auto_152729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152735 - SURFACE
      ?auto_152736 - SURFACE
    )
    :vars
    (
      ?auto_152737 - HOIST
      ?auto_152741 - PLACE
      ?auto_152738 - TRUCK
      ?auto_152740 - PLACE
      ?auto_152739 - HOIST
      ?auto_152742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152737 ?auto_152741 ) ( SURFACE-AT ?auto_152735 ?auto_152741 ) ( CLEAR ?auto_152735 ) ( IS-CRATE ?auto_152736 ) ( not ( = ?auto_152735 ?auto_152736 ) ) ( AVAILABLE ?auto_152737 ) ( TRUCK-AT ?auto_152738 ?auto_152740 ) ( not ( = ?auto_152740 ?auto_152741 ) ) ( HOIST-AT ?auto_152739 ?auto_152740 ) ( not ( = ?auto_152737 ?auto_152739 ) ) ( AVAILABLE ?auto_152739 ) ( SURFACE-AT ?auto_152736 ?auto_152740 ) ( ON ?auto_152736 ?auto_152742 ) ( CLEAR ?auto_152736 ) ( not ( = ?auto_152735 ?auto_152742 ) ) ( not ( = ?auto_152736 ?auto_152742 ) ) )
    :subtasks
    ( ( !LIFT ?auto_152739 ?auto_152736 ?auto_152742 ?auto_152740 )
      ( MAKE-1CRATE ?auto_152735 ?auto_152736 )
      ( MAKE-1CRATE-VERIFY ?auto_152735 ?auto_152736 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152743 - SURFACE
      ?auto_152744 - SURFACE
    )
    :vars
    (
      ?auto_152746 - HOIST
      ?auto_152747 - PLACE
      ?auto_152745 - PLACE
      ?auto_152748 - HOIST
      ?auto_152750 - SURFACE
      ?auto_152749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152746 ?auto_152747 ) ( SURFACE-AT ?auto_152743 ?auto_152747 ) ( CLEAR ?auto_152743 ) ( IS-CRATE ?auto_152744 ) ( not ( = ?auto_152743 ?auto_152744 ) ) ( AVAILABLE ?auto_152746 ) ( not ( = ?auto_152745 ?auto_152747 ) ) ( HOIST-AT ?auto_152748 ?auto_152745 ) ( not ( = ?auto_152746 ?auto_152748 ) ) ( AVAILABLE ?auto_152748 ) ( SURFACE-AT ?auto_152744 ?auto_152745 ) ( ON ?auto_152744 ?auto_152750 ) ( CLEAR ?auto_152744 ) ( not ( = ?auto_152743 ?auto_152750 ) ) ( not ( = ?auto_152744 ?auto_152750 ) ) ( TRUCK-AT ?auto_152749 ?auto_152747 ) )
    :subtasks
    ( ( !DRIVE ?auto_152749 ?auto_152747 ?auto_152745 )
      ( MAKE-1CRATE ?auto_152743 ?auto_152744 )
      ( MAKE-1CRATE-VERIFY ?auto_152743 ?auto_152744 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152760 - SURFACE
      ?auto_152761 - SURFACE
      ?auto_152762 - SURFACE
    )
    :vars
    (
      ?auto_152763 - HOIST
      ?auto_152764 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152763 ?auto_152764 ) ( SURFACE-AT ?auto_152761 ?auto_152764 ) ( CLEAR ?auto_152761 ) ( LIFTING ?auto_152763 ?auto_152762 ) ( IS-CRATE ?auto_152762 ) ( not ( = ?auto_152761 ?auto_152762 ) ) ( ON ?auto_152761 ?auto_152760 ) ( not ( = ?auto_152760 ?auto_152761 ) ) ( not ( = ?auto_152760 ?auto_152762 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152761 ?auto_152762 )
      ( MAKE-2CRATE-VERIFY ?auto_152760 ?auto_152761 ?auto_152762 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152770 - SURFACE
      ?auto_152771 - SURFACE
      ?auto_152772 - SURFACE
    )
    :vars
    (
      ?auto_152775 - HOIST
      ?auto_152773 - PLACE
      ?auto_152774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152775 ?auto_152773 ) ( SURFACE-AT ?auto_152771 ?auto_152773 ) ( CLEAR ?auto_152771 ) ( IS-CRATE ?auto_152772 ) ( not ( = ?auto_152771 ?auto_152772 ) ) ( TRUCK-AT ?auto_152774 ?auto_152773 ) ( AVAILABLE ?auto_152775 ) ( IN ?auto_152772 ?auto_152774 ) ( ON ?auto_152771 ?auto_152770 ) ( not ( = ?auto_152770 ?auto_152771 ) ) ( not ( = ?auto_152770 ?auto_152772 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152771 ?auto_152772 )
      ( MAKE-2CRATE-VERIFY ?auto_152770 ?auto_152771 ?auto_152772 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152776 - SURFACE
      ?auto_152777 - SURFACE
    )
    :vars
    (
      ?auto_152780 - HOIST
      ?auto_152781 - PLACE
      ?auto_152778 - TRUCK
      ?auto_152779 - SURFACE
      ?auto_152782 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152780 ?auto_152781 ) ( SURFACE-AT ?auto_152776 ?auto_152781 ) ( CLEAR ?auto_152776 ) ( IS-CRATE ?auto_152777 ) ( not ( = ?auto_152776 ?auto_152777 ) ) ( AVAILABLE ?auto_152780 ) ( IN ?auto_152777 ?auto_152778 ) ( ON ?auto_152776 ?auto_152779 ) ( not ( = ?auto_152779 ?auto_152776 ) ) ( not ( = ?auto_152779 ?auto_152777 ) ) ( TRUCK-AT ?auto_152778 ?auto_152782 ) ( not ( = ?auto_152782 ?auto_152781 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_152778 ?auto_152782 ?auto_152781 )
      ( MAKE-2CRATE ?auto_152779 ?auto_152776 ?auto_152777 )
      ( MAKE-1CRATE-VERIFY ?auto_152776 ?auto_152777 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152783 - SURFACE
      ?auto_152784 - SURFACE
      ?auto_152785 - SURFACE
    )
    :vars
    (
      ?auto_152789 - HOIST
      ?auto_152786 - PLACE
      ?auto_152787 - TRUCK
      ?auto_152788 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152789 ?auto_152786 ) ( SURFACE-AT ?auto_152784 ?auto_152786 ) ( CLEAR ?auto_152784 ) ( IS-CRATE ?auto_152785 ) ( not ( = ?auto_152784 ?auto_152785 ) ) ( AVAILABLE ?auto_152789 ) ( IN ?auto_152785 ?auto_152787 ) ( ON ?auto_152784 ?auto_152783 ) ( not ( = ?auto_152783 ?auto_152784 ) ) ( not ( = ?auto_152783 ?auto_152785 ) ) ( TRUCK-AT ?auto_152787 ?auto_152788 ) ( not ( = ?auto_152788 ?auto_152786 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152784 ?auto_152785 )
      ( MAKE-2CRATE-VERIFY ?auto_152783 ?auto_152784 ?auto_152785 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152790 - SURFACE
      ?auto_152791 - SURFACE
    )
    :vars
    (
      ?auto_152792 - HOIST
      ?auto_152793 - PLACE
      ?auto_152794 - SURFACE
      ?auto_152795 - TRUCK
      ?auto_152796 - PLACE
      ?auto_152797 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_152792 ?auto_152793 ) ( SURFACE-AT ?auto_152790 ?auto_152793 ) ( CLEAR ?auto_152790 ) ( IS-CRATE ?auto_152791 ) ( not ( = ?auto_152790 ?auto_152791 ) ) ( AVAILABLE ?auto_152792 ) ( ON ?auto_152790 ?auto_152794 ) ( not ( = ?auto_152794 ?auto_152790 ) ) ( not ( = ?auto_152794 ?auto_152791 ) ) ( TRUCK-AT ?auto_152795 ?auto_152796 ) ( not ( = ?auto_152796 ?auto_152793 ) ) ( HOIST-AT ?auto_152797 ?auto_152796 ) ( LIFTING ?auto_152797 ?auto_152791 ) ( not ( = ?auto_152792 ?auto_152797 ) ) )
    :subtasks
    ( ( !LOAD ?auto_152797 ?auto_152791 ?auto_152795 ?auto_152796 )
      ( MAKE-2CRATE ?auto_152794 ?auto_152790 ?auto_152791 )
      ( MAKE-1CRATE-VERIFY ?auto_152790 ?auto_152791 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152798 - SURFACE
      ?auto_152799 - SURFACE
      ?auto_152800 - SURFACE
    )
    :vars
    (
      ?auto_152804 - HOIST
      ?auto_152803 - PLACE
      ?auto_152802 - TRUCK
      ?auto_152805 - PLACE
      ?auto_152801 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_152804 ?auto_152803 ) ( SURFACE-AT ?auto_152799 ?auto_152803 ) ( CLEAR ?auto_152799 ) ( IS-CRATE ?auto_152800 ) ( not ( = ?auto_152799 ?auto_152800 ) ) ( AVAILABLE ?auto_152804 ) ( ON ?auto_152799 ?auto_152798 ) ( not ( = ?auto_152798 ?auto_152799 ) ) ( not ( = ?auto_152798 ?auto_152800 ) ) ( TRUCK-AT ?auto_152802 ?auto_152805 ) ( not ( = ?auto_152805 ?auto_152803 ) ) ( HOIST-AT ?auto_152801 ?auto_152805 ) ( LIFTING ?auto_152801 ?auto_152800 ) ( not ( = ?auto_152804 ?auto_152801 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152799 ?auto_152800 )
      ( MAKE-2CRATE-VERIFY ?auto_152798 ?auto_152799 ?auto_152800 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152806 - SURFACE
      ?auto_152807 - SURFACE
    )
    :vars
    (
      ?auto_152808 - HOIST
      ?auto_152811 - PLACE
      ?auto_152812 - SURFACE
      ?auto_152810 - TRUCK
      ?auto_152809 - PLACE
      ?auto_152813 - HOIST
      ?auto_152814 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152808 ?auto_152811 ) ( SURFACE-AT ?auto_152806 ?auto_152811 ) ( CLEAR ?auto_152806 ) ( IS-CRATE ?auto_152807 ) ( not ( = ?auto_152806 ?auto_152807 ) ) ( AVAILABLE ?auto_152808 ) ( ON ?auto_152806 ?auto_152812 ) ( not ( = ?auto_152812 ?auto_152806 ) ) ( not ( = ?auto_152812 ?auto_152807 ) ) ( TRUCK-AT ?auto_152810 ?auto_152809 ) ( not ( = ?auto_152809 ?auto_152811 ) ) ( HOIST-AT ?auto_152813 ?auto_152809 ) ( not ( = ?auto_152808 ?auto_152813 ) ) ( AVAILABLE ?auto_152813 ) ( SURFACE-AT ?auto_152807 ?auto_152809 ) ( ON ?auto_152807 ?auto_152814 ) ( CLEAR ?auto_152807 ) ( not ( = ?auto_152806 ?auto_152814 ) ) ( not ( = ?auto_152807 ?auto_152814 ) ) ( not ( = ?auto_152812 ?auto_152814 ) ) )
    :subtasks
    ( ( !LIFT ?auto_152813 ?auto_152807 ?auto_152814 ?auto_152809 )
      ( MAKE-2CRATE ?auto_152812 ?auto_152806 ?auto_152807 )
      ( MAKE-1CRATE-VERIFY ?auto_152806 ?auto_152807 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152815 - SURFACE
      ?auto_152816 - SURFACE
      ?auto_152817 - SURFACE
    )
    :vars
    (
      ?auto_152822 - HOIST
      ?auto_152820 - PLACE
      ?auto_152821 - TRUCK
      ?auto_152819 - PLACE
      ?auto_152818 - HOIST
      ?auto_152823 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152822 ?auto_152820 ) ( SURFACE-AT ?auto_152816 ?auto_152820 ) ( CLEAR ?auto_152816 ) ( IS-CRATE ?auto_152817 ) ( not ( = ?auto_152816 ?auto_152817 ) ) ( AVAILABLE ?auto_152822 ) ( ON ?auto_152816 ?auto_152815 ) ( not ( = ?auto_152815 ?auto_152816 ) ) ( not ( = ?auto_152815 ?auto_152817 ) ) ( TRUCK-AT ?auto_152821 ?auto_152819 ) ( not ( = ?auto_152819 ?auto_152820 ) ) ( HOIST-AT ?auto_152818 ?auto_152819 ) ( not ( = ?auto_152822 ?auto_152818 ) ) ( AVAILABLE ?auto_152818 ) ( SURFACE-AT ?auto_152817 ?auto_152819 ) ( ON ?auto_152817 ?auto_152823 ) ( CLEAR ?auto_152817 ) ( not ( = ?auto_152816 ?auto_152823 ) ) ( not ( = ?auto_152817 ?auto_152823 ) ) ( not ( = ?auto_152815 ?auto_152823 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152816 ?auto_152817 )
      ( MAKE-2CRATE-VERIFY ?auto_152815 ?auto_152816 ?auto_152817 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152824 - SURFACE
      ?auto_152825 - SURFACE
    )
    :vars
    (
      ?auto_152829 - HOIST
      ?auto_152831 - PLACE
      ?auto_152826 - SURFACE
      ?auto_152832 - PLACE
      ?auto_152830 - HOIST
      ?auto_152828 - SURFACE
      ?auto_152827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152829 ?auto_152831 ) ( SURFACE-AT ?auto_152824 ?auto_152831 ) ( CLEAR ?auto_152824 ) ( IS-CRATE ?auto_152825 ) ( not ( = ?auto_152824 ?auto_152825 ) ) ( AVAILABLE ?auto_152829 ) ( ON ?auto_152824 ?auto_152826 ) ( not ( = ?auto_152826 ?auto_152824 ) ) ( not ( = ?auto_152826 ?auto_152825 ) ) ( not ( = ?auto_152832 ?auto_152831 ) ) ( HOIST-AT ?auto_152830 ?auto_152832 ) ( not ( = ?auto_152829 ?auto_152830 ) ) ( AVAILABLE ?auto_152830 ) ( SURFACE-AT ?auto_152825 ?auto_152832 ) ( ON ?auto_152825 ?auto_152828 ) ( CLEAR ?auto_152825 ) ( not ( = ?auto_152824 ?auto_152828 ) ) ( not ( = ?auto_152825 ?auto_152828 ) ) ( not ( = ?auto_152826 ?auto_152828 ) ) ( TRUCK-AT ?auto_152827 ?auto_152831 ) )
    :subtasks
    ( ( !DRIVE ?auto_152827 ?auto_152831 ?auto_152832 )
      ( MAKE-2CRATE ?auto_152826 ?auto_152824 ?auto_152825 )
      ( MAKE-1CRATE-VERIFY ?auto_152824 ?auto_152825 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152833 - SURFACE
      ?auto_152834 - SURFACE
      ?auto_152835 - SURFACE
    )
    :vars
    (
      ?auto_152840 - HOIST
      ?auto_152839 - PLACE
      ?auto_152836 - PLACE
      ?auto_152838 - HOIST
      ?auto_152841 - SURFACE
      ?auto_152837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152840 ?auto_152839 ) ( SURFACE-AT ?auto_152834 ?auto_152839 ) ( CLEAR ?auto_152834 ) ( IS-CRATE ?auto_152835 ) ( not ( = ?auto_152834 ?auto_152835 ) ) ( AVAILABLE ?auto_152840 ) ( ON ?auto_152834 ?auto_152833 ) ( not ( = ?auto_152833 ?auto_152834 ) ) ( not ( = ?auto_152833 ?auto_152835 ) ) ( not ( = ?auto_152836 ?auto_152839 ) ) ( HOIST-AT ?auto_152838 ?auto_152836 ) ( not ( = ?auto_152840 ?auto_152838 ) ) ( AVAILABLE ?auto_152838 ) ( SURFACE-AT ?auto_152835 ?auto_152836 ) ( ON ?auto_152835 ?auto_152841 ) ( CLEAR ?auto_152835 ) ( not ( = ?auto_152834 ?auto_152841 ) ) ( not ( = ?auto_152835 ?auto_152841 ) ) ( not ( = ?auto_152833 ?auto_152841 ) ) ( TRUCK-AT ?auto_152837 ?auto_152839 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152834 ?auto_152835 )
      ( MAKE-2CRATE-VERIFY ?auto_152833 ?auto_152834 ?auto_152835 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152842 - SURFACE
      ?auto_152843 - SURFACE
    )
    :vars
    (
      ?auto_152848 - HOIST
      ?auto_152850 - PLACE
      ?auto_152849 - SURFACE
      ?auto_152847 - PLACE
      ?auto_152846 - HOIST
      ?auto_152844 - SURFACE
      ?auto_152845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152848 ?auto_152850 ) ( IS-CRATE ?auto_152843 ) ( not ( = ?auto_152842 ?auto_152843 ) ) ( not ( = ?auto_152849 ?auto_152842 ) ) ( not ( = ?auto_152849 ?auto_152843 ) ) ( not ( = ?auto_152847 ?auto_152850 ) ) ( HOIST-AT ?auto_152846 ?auto_152847 ) ( not ( = ?auto_152848 ?auto_152846 ) ) ( AVAILABLE ?auto_152846 ) ( SURFACE-AT ?auto_152843 ?auto_152847 ) ( ON ?auto_152843 ?auto_152844 ) ( CLEAR ?auto_152843 ) ( not ( = ?auto_152842 ?auto_152844 ) ) ( not ( = ?auto_152843 ?auto_152844 ) ) ( not ( = ?auto_152849 ?auto_152844 ) ) ( TRUCK-AT ?auto_152845 ?auto_152850 ) ( SURFACE-AT ?auto_152849 ?auto_152850 ) ( CLEAR ?auto_152849 ) ( LIFTING ?auto_152848 ?auto_152842 ) ( IS-CRATE ?auto_152842 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152849 ?auto_152842 )
      ( MAKE-2CRATE ?auto_152849 ?auto_152842 ?auto_152843 )
      ( MAKE-1CRATE-VERIFY ?auto_152842 ?auto_152843 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152851 - SURFACE
      ?auto_152852 - SURFACE
      ?auto_152853 - SURFACE
    )
    :vars
    (
      ?auto_152856 - HOIST
      ?auto_152859 - PLACE
      ?auto_152858 - PLACE
      ?auto_152857 - HOIST
      ?auto_152855 - SURFACE
      ?auto_152854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152856 ?auto_152859 ) ( IS-CRATE ?auto_152853 ) ( not ( = ?auto_152852 ?auto_152853 ) ) ( not ( = ?auto_152851 ?auto_152852 ) ) ( not ( = ?auto_152851 ?auto_152853 ) ) ( not ( = ?auto_152858 ?auto_152859 ) ) ( HOIST-AT ?auto_152857 ?auto_152858 ) ( not ( = ?auto_152856 ?auto_152857 ) ) ( AVAILABLE ?auto_152857 ) ( SURFACE-AT ?auto_152853 ?auto_152858 ) ( ON ?auto_152853 ?auto_152855 ) ( CLEAR ?auto_152853 ) ( not ( = ?auto_152852 ?auto_152855 ) ) ( not ( = ?auto_152853 ?auto_152855 ) ) ( not ( = ?auto_152851 ?auto_152855 ) ) ( TRUCK-AT ?auto_152854 ?auto_152859 ) ( SURFACE-AT ?auto_152851 ?auto_152859 ) ( CLEAR ?auto_152851 ) ( LIFTING ?auto_152856 ?auto_152852 ) ( IS-CRATE ?auto_152852 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152852 ?auto_152853 )
      ( MAKE-2CRATE-VERIFY ?auto_152851 ?auto_152852 ?auto_152853 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152860 - SURFACE
      ?auto_152861 - SURFACE
    )
    :vars
    (
      ?auto_152867 - HOIST
      ?auto_152863 - PLACE
      ?auto_152864 - SURFACE
      ?auto_152862 - PLACE
      ?auto_152865 - HOIST
      ?auto_152868 - SURFACE
      ?auto_152866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152867 ?auto_152863 ) ( IS-CRATE ?auto_152861 ) ( not ( = ?auto_152860 ?auto_152861 ) ) ( not ( = ?auto_152864 ?auto_152860 ) ) ( not ( = ?auto_152864 ?auto_152861 ) ) ( not ( = ?auto_152862 ?auto_152863 ) ) ( HOIST-AT ?auto_152865 ?auto_152862 ) ( not ( = ?auto_152867 ?auto_152865 ) ) ( AVAILABLE ?auto_152865 ) ( SURFACE-AT ?auto_152861 ?auto_152862 ) ( ON ?auto_152861 ?auto_152868 ) ( CLEAR ?auto_152861 ) ( not ( = ?auto_152860 ?auto_152868 ) ) ( not ( = ?auto_152861 ?auto_152868 ) ) ( not ( = ?auto_152864 ?auto_152868 ) ) ( TRUCK-AT ?auto_152866 ?auto_152863 ) ( SURFACE-AT ?auto_152864 ?auto_152863 ) ( CLEAR ?auto_152864 ) ( IS-CRATE ?auto_152860 ) ( AVAILABLE ?auto_152867 ) ( IN ?auto_152860 ?auto_152866 ) )
    :subtasks
    ( ( !UNLOAD ?auto_152867 ?auto_152860 ?auto_152866 ?auto_152863 )
      ( MAKE-2CRATE ?auto_152864 ?auto_152860 ?auto_152861 )
      ( MAKE-1CRATE-VERIFY ?auto_152860 ?auto_152861 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_152869 - SURFACE
      ?auto_152870 - SURFACE
      ?auto_152871 - SURFACE
    )
    :vars
    (
      ?auto_152875 - HOIST
      ?auto_152872 - PLACE
      ?auto_152873 - PLACE
      ?auto_152874 - HOIST
      ?auto_152877 - SURFACE
      ?auto_152876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152875 ?auto_152872 ) ( IS-CRATE ?auto_152871 ) ( not ( = ?auto_152870 ?auto_152871 ) ) ( not ( = ?auto_152869 ?auto_152870 ) ) ( not ( = ?auto_152869 ?auto_152871 ) ) ( not ( = ?auto_152873 ?auto_152872 ) ) ( HOIST-AT ?auto_152874 ?auto_152873 ) ( not ( = ?auto_152875 ?auto_152874 ) ) ( AVAILABLE ?auto_152874 ) ( SURFACE-AT ?auto_152871 ?auto_152873 ) ( ON ?auto_152871 ?auto_152877 ) ( CLEAR ?auto_152871 ) ( not ( = ?auto_152870 ?auto_152877 ) ) ( not ( = ?auto_152871 ?auto_152877 ) ) ( not ( = ?auto_152869 ?auto_152877 ) ) ( TRUCK-AT ?auto_152876 ?auto_152872 ) ( SURFACE-AT ?auto_152869 ?auto_152872 ) ( CLEAR ?auto_152869 ) ( IS-CRATE ?auto_152870 ) ( AVAILABLE ?auto_152875 ) ( IN ?auto_152870 ?auto_152876 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152870 ?auto_152871 )
      ( MAKE-2CRATE-VERIFY ?auto_152869 ?auto_152870 ?auto_152871 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_152914 - SURFACE
      ?auto_152915 - SURFACE
    )
    :vars
    (
      ?auto_152922 - HOIST
      ?auto_152916 - PLACE
      ?auto_152920 - SURFACE
      ?auto_152917 - PLACE
      ?auto_152919 - HOIST
      ?auto_152921 - SURFACE
      ?auto_152918 - TRUCK
      ?auto_152923 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152922 ?auto_152916 ) ( SURFACE-AT ?auto_152914 ?auto_152916 ) ( CLEAR ?auto_152914 ) ( IS-CRATE ?auto_152915 ) ( not ( = ?auto_152914 ?auto_152915 ) ) ( AVAILABLE ?auto_152922 ) ( ON ?auto_152914 ?auto_152920 ) ( not ( = ?auto_152920 ?auto_152914 ) ) ( not ( = ?auto_152920 ?auto_152915 ) ) ( not ( = ?auto_152917 ?auto_152916 ) ) ( HOIST-AT ?auto_152919 ?auto_152917 ) ( not ( = ?auto_152922 ?auto_152919 ) ) ( AVAILABLE ?auto_152919 ) ( SURFACE-AT ?auto_152915 ?auto_152917 ) ( ON ?auto_152915 ?auto_152921 ) ( CLEAR ?auto_152915 ) ( not ( = ?auto_152914 ?auto_152921 ) ) ( not ( = ?auto_152915 ?auto_152921 ) ) ( not ( = ?auto_152920 ?auto_152921 ) ) ( TRUCK-AT ?auto_152918 ?auto_152923 ) ( not ( = ?auto_152923 ?auto_152916 ) ) ( not ( = ?auto_152917 ?auto_152923 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_152918 ?auto_152923 ?auto_152916 )
      ( MAKE-1CRATE ?auto_152914 ?auto_152915 )
      ( MAKE-1CRATE-VERIFY ?auto_152914 ?auto_152915 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_152953 - SURFACE
      ?auto_152954 - SURFACE
      ?auto_152955 - SURFACE
      ?auto_152956 - SURFACE
    )
    :vars
    (
      ?auto_152958 - HOIST
      ?auto_152957 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152958 ?auto_152957 ) ( SURFACE-AT ?auto_152955 ?auto_152957 ) ( CLEAR ?auto_152955 ) ( LIFTING ?auto_152958 ?auto_152956 ) ( IS-CRATE ?auto_152956 ) ( not ( = ?auto_152955 ?auto_152956 ) ) ( ON ?auto_152954 ?auto_152953 ) ( ON ?auto_152955 ?auto_152954 ) ( not ( = ?auto_152953 ?auto_152954 ) ) ( not ( = ?auto_152953 ?auto_152955 ) ) ( not ( = ?auto_152953 ?auto_152956 ) ) ( not ( = ?auto_152954 ?auto_152955 ) ) ( not ( = ?auto_152954 ?auto_152956 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_152955 ?auto_152956 )
      ( MAKE-3CRATE-VERIFY ?auto_152953 ?auto_152954 ?auto_152955 ?auto_152956 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_152970 - SURFACE
      ?auto_152971 - SURFACE
      ?auto_152972 - SURFACE
      ?auto_152973 - SURFACE
    )
    :vars
    (
      ?auto_152976 - HOIST
      ?auto_152974 - PLACE
      ?auto_152975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_152976 ?auto_152974 ) ( SURFACE-AT ?auto_152972 ?auto_152974 ) ( CLEAR ?auto_152972 ) ( IS-CRATE ?auto_152973 ) ( not ( = ?auto_152972 ?auto_152973 ) ) ( TRUCK-AT ?auto_152975 ?auto_152974 ) ( AVAILABLE ?auto_152976 ) ( IN ?auto_152973 ?auto_152975 ) ( ON ?auto_152972 ?auto_152971 ) ( not ( = ?auto_152971 ?auto_152972 ) ) ( not ( = ?auto_152971 ?auto_152973 ) ) ( ON ?auto_152971 ?auto_152970 ) ( not ( = ?auto_152970 ?auto_152971 ) ) ( not ( = ?auto_152970 ?auto_152972 ) ) ( not ( = ?auto_152970 ?auto_152973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_152971 ?auto_152972 ?auto_152973 )
      ( MAKE-3CRATE-VERIFY ?auto_152970 ?auto_152971 ?auto_152972 ?auto_152973 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_152991 - SURFACE
      ?auto_152992 - SURFACE
      ?auto_152993 - SURFACE
      ?auto_152994 - SURFACE
    )
    :vars
    (
      ?auto_152995 - HOIST
      ?auto_152998 - PLACE
      ?auto_152996 - TRUCK
      ?auto_152997 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_152995 ?auto_152998 ) ( SURFACE-AT ?auto_152993 ?auto_152998 ) ( CLEAR ?auto_152993 ) ( IS-CRATE ?auto_152994 ) ( not ( = ?auto_152993 ?auto_152994 ) ) ( AVAILABLE ?auto_152995 ) ( IN ?auto_152994 ?auto_152996 ) ( ON ?auto_152993 ?auto_152992 ) ( not ( = ?auto_152992 ?auto_152993 ) ) ( not ( = ?auto_152992 ?auto_152994 ) ) ( TRUCK-AT ?auto_152996 ?auto_152997 ) ( not ( = ?auto_152997 ?auto_152998 ) ) ( ON ?auto_152992 ?auto_152991 ) ( not ( = ?auto_152991 ?auto_152992 ) ) ( not ( = ?auto_152991 ?auto_152993 ) ) ( not ( = ?auto_152991 ?auto_152994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_152992 ?auto_152993 ?auto_152994 )
      ( MAKE-3CRATE-VERIFY ?auto_152991 ?auto_152992 ?auto_152993 ?auto_152994 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153015 - SURFACE
      ?auto_153016 - SURFACE
      ?auto_153017 - SURFACE
      ?auto_153018 - SURFACE
    )
    :vars
    (
      ?auto_153019 - HOIST
      ?auto_153020 - PLACE
      ?auto_153021 - TRUCK
      ?auto_153023 - PLACE
      ?auto_153022 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_153019 ?auto_153020 ) ( SURFACE-AT ?auto_153017 ?auto_153020 ) ( CLEAR ?auto_153017 ) ( IS-CRATE ?auto_153018 ) ( not ( = ?auto_153017 ?auto_153018 ) ) ( AVAILABLE ?auto_153019 ) ( ON ?auto_153017 ?auto_153016 ) ( not ( = ?auto_153016 ?auto_153017 ) ) ( not ( = ?auto_153016 ?auto_153018 ) ) ( TRUCK-AT ?auto_153021 ?auto_153023 ) ( not ( = ?auto_153023 ?auto_153020 ) ) ( HOIST-AT ?auto_153022 ?auto_153023 ) ( LIFTING ?auto_153022 ?auto_153018 ) ( not ( = ?auto_153019 ?auto_153022 ) ) ( ON ?auto_153016 ?auto_153015 ) ( not ( = ?auto_153015 ?auto_153016 ) ) ( not ( = ?auto_153015 ?auto_153017 ) ) ( not ( = ?auto_153015 ?auto_153018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153016 ?auto_153017 ?auto_153018 )
      ( MAKE-3CRATE-VERIFY ?auto_153015 ?auto_153016 ?auto_153017 ?auto_153018 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153042 - SURFACE
      ?auto_153043 - SURFACE
      ?auto_153044 - SURFACE
      ?auto_153045 - SURFACE
    )
    :vars
    (
      ?auto_153051 - HOIST
      ?auto_153048 - PLACE
      ?auto_153050 - TRUCK
      ?auto_153047 - PLACE
      ?auto_153049 - HOIST
      ?auto_153046 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153051 ?auto_153048 ) ( SURFACE-AT ?auto_153044 ?auto_153048 ) ( CLEAR ?auto_153044 ) ( IS-CRATE ?auto_153045 ) ( not ( = ?auto_153044 ?auto_153045 ) ) ( AVAILABLE ?auto_153051 ) ( ON ?auto_153044 ?auto_153043 ) ( not ( = ?auto_153043 ?auto_153044 ) ) ( not ( = ?auto_153043 ?auto_153045 ) ) ( TRUCK-AT ?auto_153050 ?auto_153047 ) ( not ( = ?auto_153047 ?auto_153048 ) ) ( HOIST-AT ?auto_153049 ?auto_153047 ) ( not ( = ?auto_153051 ?auto_153049 ) ) ( AVAILABLE ?auto_153049 ) ( SURFACE-AT ?auto_153045 ?auto_153047 ) ( ON ?auto_153045 ?auto_153046 ) ( CLEAR ?auto_153045 ) ( not ( = ?auto_153044 ?auto_153046 ) ) ( not ( = ?auto_153045 ?auto_153046 ) ) ( not ( = ?auto_153043 ?auto_153046 ) ) ( ON ?auto_153043 ?auto_153042 ) ( not ( = ?auto_153042 ?auto_153043 ) ) ( not ( = ?auto_153042 ?auto_153044 ) ) ( not ( = ?auto_153042 ?auto_153045 ) ) ( not ( = ?auto_153042 ?auto_153046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153043 ?auto_153044 ?auto_153045 )
      ( MAKE-3CRATE-VERIFY ?auto_153042 ?auto_153043 ?auto_153044 ?auto_153045 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153070 - SURFACE
      ?auto_153071 - SURFACE
      ?auto_153072 - SURFACE
      ?auto_153073 - SURFACE
    )
    :vars
    (
      ?auto_153076 - HOIST
      ?auto_153075 - PLACE
      ?auto_153079 - PLACE
      ?auto_153077 - HOIST
      ?auto_153074 - SURFACE
      ?auto_153078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153076 ?auto_153075 ) ( SURFACE-AT ?auto_153072 ?auto_153075 ) ( CLEAR ?auto_153072 ) ( IS-CRATE ?auto_153073 ) ( not ( = ?auto_153072 ?auto_153073 ) ) ( AVAILABLE ?auto_153076 ) ( ON ?auto_153072 ?auto_153071 ) ( not ( = ?auto_153071 ?auto_153072 ) ) ( not ( = ?auto_153071 ?auto_153073 ) ) ( not ( = ?auto_153079 ?auto_153075 ) ) ( HOIST-AT ?auto_153077 ?auto_153079 ) ( not ( = ?auto_153076 ?auto_153077 ) ) ( AVAILABLE ?auto_153077 ) ( SURFACE-AT ?auto_153073 ?auto_153079 ) ( ON ?auto_153073 ?auto_153074 ) ( CLEAR ?auto_153073 ) ( not ( = ?auto_153072 ?auto_153074 ) ) ( not ( = ?auto_153073 ?auto_153074 ) ) ( not ( = ?auto_153071 ?auto_153074 ) ) ( TRUCK-AT ?auto_153078 ?auto_153075 ) ( ON ?auto_153071 ?auto_153070 ) ( not ( = ?auto_153070 ?auto_153071 ) ) ( not ( = ?auto_153070 ?auto_153072 ) ) ( not ( = ?auto_153070 ?auto_153073 ) ) ( not ( = ?auto_153070 ?auto_153074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153071 ?auto_153072 ?auto_153073 )
      ( MAKE-3CRATE-VERIFY ?auto_153070 ?auto_153071 ?auto_153072 ?auto_153073 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153098 - SURFACE
      ?auto_153099 - SURFACE
      ?auto_153100 - SURFACE
      ?auto_153101 - SURFACE
    )
    :vars
    (
      ?auto_153105 - HOIST
      ?auto_153102 - PLACE
      ?auto_153103 - PLACE
      ?auto_153107 - HOIST
      ?auto_153106 - SURFACE
      ?auto_153104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153105 ?auto_153102 ) ( IS-CRATE ?auto_153101 ) ( not ( = ?auto_153100 ?auto_153101 ) ) ( not ( = ?auto_153099 ?auto_153100 ) ) ( not ( = ?auto_153099 ?auto_153101 ) ) ( not ( = ?auto_153103 ?auto_153102 ) ) ( HOIST-AT ?auto_153107 ?auto_153103 ) ( not ( = ?auto_153105 ?auto_153107 ) ) ( AVAILABLE ?auto_153107 ) ( SURFACE-AT ?auto_153101 ?auto_153103 ) ( ON ?auto_153101 ?auto_153106 ) ( CLEAR ?auto_153101 ) ( not ( = ?auto_153100 ?auto_153106 ) ) ( not ( = ?auto_153101 ?auto_153106 ) ) ( not ( = ?auto_153099 ?auto_153106 ) ) ( TRUCK-AT ?auto_153104 ?auto_153102 ) ( SURFACE-AT ?auto_153099 ?auto_153102 ) ( CLEAR ?auto_153099 ) ( LIFTING ?auto_153105 ?auto_153100 ) ( IS-CRATE ?auto_153100 ) ( ON ?auto_153099 ?auto_153098 ) ( not ( = ?auto_153098 ?auto_153099 ) ) ( not ( = ?auto_153098 ?auto_153100 ) ) ( not ( = ?auto_153098 ?auto_153101 ) ) ( not ( = ?auto_153098 ?auto_153106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153099 ?auto_153100 ?auto_153101 )
      ( MAKE-3CRATE-VERIFY ?auto_153098 ?auto_153099 ?auto_153100 ?auto_153101 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_153126 - SURFACE
      ?auto_153127 - SURFACE
      ?auto_153128 - SURFACE
      ?auto_153129 - SURFACE
    )
    :vars
    (
      ?auto_153132 - HOIST
      ?auto_153133 - PLACE
      ?auto_153134 - PLACE
      ?auto_153130 - HOIST
      ?auto_153135 - SURFACE
      ?auto_153131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153132 ?auto_153133 ) ( IS-CRATE ?auto_153129 ) ( not ( = ?auto_153128 ?auto_153129 ) ) ( not ( = ?auto_153127 ?auto_153128 ) ) ( not ( = ?auto_153127 ?auto_153129 ) ) ( not ( = ?auto_153134 ?auto_153133 ) ) ( HOIST-AT ?auto_153130 ?auto_153134 ) ( not ( = ?auto_153132 ?auto_153130 ) ) ( AVAILABLE ?auto_153130 ) ( SURFACE-AT ?auto_153129 ?auto_153134 ) ( ON ?auto_153129 ?auto_153135 ) ( CLEAR ?auto_153129 ) ( not ( = ?auto_153128 ?auto_153135 ) ) ( not ( = ?auto_153129 ?auto_153135 ) ) ( not ( = ?auto_153127 ?auto_153135 ) ) ( TRUCK-AT ?auto_153131 ?auto_153133 ) ( SURFACE-AT ?auto_153127 ?auto_153133 ) ( CLEAR ?auto_153127 ) ( IS-CRATE ?auto_153128 ) ( AVAILABLE ?auto_153132 ) ( IN ?auto_153128 ?auto_153131 ) ( ON ?auto_153127 ?auto_153126 ) ( not ( = ?auto_153126 ?auto_153127 ) ) ( not ( = ?auto_153126 ?auto_153128 ) ) ( not ( = ?auto_153126 ?auto_153129 ) ) ( not ( = ?auto_153126 ?auto_153135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153127 ?auto_153128 ?auto_153129 )
      ( MAKE-3CRATE-VERIFY ?auto_153126 ?auto_153127 ?auto_153128 ?auto_153129 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153417 - SURFACE
      ?auto_153418 - SURFACE
      ?auto_153419 - SURFACE
      ?auto_153421 - SURFACE
      ?auto_153420 - SURFACE
    )
    :vars
    (
      ?auto_153422 - HOIST
      ?auto_153423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153422 ?auto_153423 ) ( SURFACE-AT ?auto_153421 ?auto_153423 ) ( CLEAR ?auto_153421 ) ( LIFTING ?auto_153422 ?auto_153420 ) ( IS-CRATE ?auto_153420 ) ( not ( = ?auto_153421 ?auto_153420 ) ) ( ON ?auto_153418 ?auto_153417 ) ( ON ?auto_153419 ?auto_153418 ) ( ON ?auto_153421 ?auto_153419 ) ( not ( = ?auto_153417 ?auto_153418 ) ) ( not ( = ?auto_153417 ?auto_153419 ) ) ( not ( = ?auto_153417 ?auto_153421 ) ) ( not ( = ?auto_153417 ?auto_153420 ) ) ( not ( = ?auto_153418 ?auto_153419 ) ) ( not ( = ?auto_153418 ?auto_153421 ) ) ( not ( = ?auto_153418 ?auto_153420 ) ) ( not ( = ?auto_153419 ?auto_153421 ) ) ( not ( = ?auto_153419 ?auto_153420 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_153421 ?auto_153420 )
      ( MAKE-4CRATE-VERIFY ?auto_153417 ?auto_153418 ?auto_153419 ?auto_153421 ?auto_153420 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153442 - SURFACE
      ?auto_153443 - SURFACE
      ?auto_153444 - SURFACE
      ?auto_153446 - SURFACE
      ?auto_153445 - SURFACE
    )
    :vars
    (
      ?auto_153449 - HOIST
      ?auto_153447 - PLACE
      ?auto_153448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153449 ?auto_153447 ) ( SURFACE-AT ?auto_153446 ?auto_153447 ) ( CLEAR ?auto_153446 ) ( IS-CRATE ?auto_153445 ) ( not ( = ?auto_153446 ?auto_153445 ) ) ( TRUCK-AT ?auto_153448 ?auto_153447 ) ( AVAILABLE ?auto_153449 ) ( IN ?auto_153445 ?auto_153448 ) ( ON ?auto_153446 ?auto_153444 ) ( not ( = ?auto_153444 ?auto_153446 ) ) ( not ( = ?auto_153444 ?auto_153445 ) ) ( ON ?auto_153443 ?auto_153442 ) ( ON ?auto_153444 ?auto_153443 ) ( not ( = ?auto_153442 ?auto_153443 ) ) ( not ( = ?auto_153442 ?auto_153444 ) ) ( not ( = ?auto_153442 ?auto_153446 ) ) ( not ( = ?auto_153442 ?auto_153445 ) ) ( not ( = ?auto_153443 ?auto_153444 ) ) ( not ( = ?auto_153443 ?auto_153446 ) ) ( not ( = ?auto_153443 ?auto_153445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153444 ?auto_153446 ?auto_153445 )
      ( MAKE-4CRATE-VERIFY ?auto_153442 ?auto_153443 ?auto_153444 ?auto_153446 ?auto_153445 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153472 - SURFACE
      ?auto_153473 - SURFACE
      ?auto_153474 - SURFACE
      ?auto_153476 - SURFACE
      ?auto_153475 - SURFACE
    )
    :vars
    (
      ?auto_153479 - HOIST
      ?auto_153478 - PLACE
      ?auto_153480 - TRUCK
      ?auto_153477 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153479 ?auto_153478 ) ( SURFACE-AT ?auto_153476 ?auto_153478 ) ( CLEAR ?auto_153476 ) ( IS-CRATE ?auto_153475 ) ( not ( = ?auto_153476 ?auto_153475 ) ) ( AVAILABLE ?auto_153479 ) ( IN ?auto_153475 ?auto_153480 ) ( ON ?auto_153476 ?auto_153474 ) ( not ( = ?auto_153474 ?auto_153476 ) ) ( not ( = ?auto_153474 ?auto_153475 ) ) ( TRUCK-AT ?auto_153480 ?auto_153477 ) ( not ( = ?auto_153477 ?auto_153478 ) ) ( ON ?auto_153473 ?auto_153472 ) ( ON ?auto_153474 ?auto_153473 ) ( not ( = ?auto_153472 ?auto_153473 ) ) ( not ( = ?auto_153472 ?auto_153474 ) ) ( not ( = ?auto_153472 ?auto_153476 ) ) ( not ( = ?auto_153472 ?auto_153475 ) ) ( not ( = ?auto_153473 ?auto_153474 ) ) ( not ( = ?auto_153473 ?auto_153476 ) ) ( not ( = ?auto_153473 ?auto_153475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153474 ?auto_153476 ?auto_153475 )
      ( MAKE-4CRATE-VERIFY ?auto_153472 ?auto_153473 ?auto_153474 ?auto_153476 ?auto_153475 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153506 - SURFACE
      ?auto_153507 - SURFACE
      ?auto_153508 - SURFACE
      ?auto_153510 - SURFACE
      ?auto_153509 - SURFACE
    )
    :vars
    (
      ?auto_153514 - HOIST
      ?auto_153515 - PLACE
      ?auto_153511 - TRUCK
      ?auto_153512 - PLACE
      ?auto_153513 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_153514 ?auto_153515 ) ( SURFACE-AT ?auto_153510 ?auto_153515 ) ( CLEAR ?auto_153510 ) ( IS-CRATE ?auto_153509 ) ( not ( = ?auto_153510 ?auto_153509 ) ) ( AVAILABLE ?auto_153514 ) ( ON ?auto_153510 ?auto_153508 ) ( not ( = ?auto_153508 ?auto_153510 ) ) ( not ( = ?auto_153508 ?auto_153509 ) ) ( TRUCK-AT ?auto_153511 ?auto_153512 ) ( not ( = ?auto_153512 ?auto_153515 ) ) ( HOIST-AT ?auto_153513 ?auto_153512 ) ( LIFTING ?auto_153513 ?auto_153509 ) ( not ( = ?auto_153514 ?auto_153513 ) ) ( ON ?auto_153507 ?auto_153506 ) ( ON ?auto_153508 ?auto_153507 ) ( not ( = ?auto_153506 ?auto_153507 ) ) ( not ( = ?auto_153506 ?auto_153508 ) ) ( not ( = ?auto_153506 ?auto_153510 ) ) ( not ( = ?auto_153506 ?auto_153509 ) ) ( not ( = ?auto_153507 ?auto_153508 ) ) ( not ( = ?auto_153507 ?auto_153510 ) ) ( not ( = ?auto_153507 ?auto_153509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153508 ?auto_153510 ?auto_153509 )
      ( MAKE-4CRATE-VERIFY ?auto_153506 ?auto_153507 ?auto_153508 ?auto_153510 ?auto_153509 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153544 - SURFACE
      ?auto_153545 - SURFACE
      ?auto_153546 - SURFACE
      ?auto_153548 - SURFACE
      ?auto_153547 - SURFACE
    )
    :vars
    (
      ?auto_153549 - HOIST
      ?auto_153554 - PLACE
      ?auto_153551 - TRUCK
      ?auto_153550 - PLACE
      ?auto_153553 - HOIST
      ?auto_153552 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_153549 ?auto_153554 ) ( SURFACE-AT ?auto_153548 ?auto_153554 ) ( CLEAR ?auto_153548 ) ( IS-CRATE ?auto_153547 ) ( not ( = ?auto_153548 ?auto_153547 ) ) ( AVAILABLE ?auto_153549 ) ( ON ?auto_153548 ?auto_153546 ) ( not ( = ?auto_153546 ?auto_153548 ) ) ( not ( = ?auto_153546 ?auto_153547 ) ) ( TRUCK-AT ?auto_153551 ?auto_153550 ) ( not ( = ?auto_153550 ?auto_153554 ) ) ( HOIST-AT ?auto_153553 ?auto_153550 ) ( not ( = ?auto_153549 ?auto_153553 ) ) ( AVAILABLE ?auto_153553 ) ( SURFACE-AT ?auto_153547 ?auto_153550 ) ( ON ?auto_153547 ?auto_153552 ) ( CLEAR ?auto_153547 ) ( not ( = ?auto_153548 ?auto_153552 ) ) ( not ( = ?auto_153547 ?auto_153552 ) ) ( not ( = ?auto_153546 ?auto_153552 ) ) ( ON ?auto_153545 ?auto_153544 ) ( ON ?auto_153546 ?auto_153545 ) ( not ( = ?auto_153544 ?auto_153545 ) ) ( not ( = ?auto_153544 ?auto_153546 ) ) ( not ( = ?auto_153544 ?auto_153548 ) ) ( not ( = ?auto_153544 ?auto_153547 ) ) ( not ( = ?auto_153544 ?auto_153552 ) ) ( not ( = ?auto_153545 ?auto_153546 ) ) ( not ( = ?auto_153545 ?auto_153548 ) ) ( not ( = ?auto_153545 ?auto_153547 ) ) ( not ( = ?auto_153545 ?auto_153552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153546 ?auto_153548 ?auto_153547 )
      ( MAKE-4CRATE-VERIFY ?auto_153544 ?auto_153545 ?auto_153546 ?auto_153548 ?auto_153547 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153583 - SURFACE
      ?auto_153584 - SURFACE
      ?auto_153585 - SURFACE
      ?auto_153587 - SURFACE
      ?auto_153586 - SURFACE
    )
    :vars
    (
      ?auto_153593 - HOIST
      ?auto_153591 - PLACE
      ?auto_153588 - PLACE
      ?auto_153589 - HOIST
      ?auto_153592 - SURFACE
      ?auto_153590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153593 ?auto_153591 ) ( SURFACE-AT ?auto_153587 ?auto_153591 ) ( CLEAR ?auto_153587 ) ( IS-CRATE ?auto_153586 ) ( not ( = ?auto_153587 ?auto_153586 ) ) ( AVAILABLE ?auto_153593 ) ( ON ?auto_153587 ?auto_153585 ) ( not ( = ?auto_153585 ?auto_153587 ) ) ( not ( = ?auto_153585 ?auto_153586 ) ) ( not ( = ?auto_153588 ?auto_153591 ) ) ( HOIST-AT ?auto_153589 ?auto_153588 ) ( not ( = ?auto_153593 ?auto_153589 ) ) ( AVAILABLE ?auto_153589 ) ( SURFACE-AT ?auto_153586 ?auto_153588 ) ( ON ?auto_153586 ?auto_153592 ) ( CLEAR ?auto_153586 ) ( not ( = ?auto_153587 ?auto_153592 ) ) ( not ( = ?auto_153586 ?auto_153592 ) ) ( not ( = ?auto_153585 ?auto_153592 ) ) ( TRUCK-AT ?auto_153590 ?auto_153591 ) ( ON ?auto_153584 ?auto_153583 ) ( ON ?auto_153585 ?auto_153584 ) ( not ( = ?auto_153583 ?auto_153584 ) ) ( not ( = ?auto_153583 ?auto_153585 ) ) ( not ( = ?auto_153583 ?auto_153587 ) ) ( not ( = ?auto_153583 ?auto_153586 ) ) ( not ( = ?auto_153583 ?auto_153592 ) ) ( not ( = ?auto_153584 ?auto_153585 ) ) ( not ( = ?auto_153584 ?auto_153587 ) ) ( not ( = ?auto_153584 ?auto_153586 ) ) ( not ( = ?auto_153584 ?auto_153592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153585 ?auto_153587 ?auto_153586 )
      ( MAKE-4CRATE-VERIFY ?auto_153583 ?auto_153584 ?auto_153585 ?auto_153587 ?auto_153586 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153622 - SURFACE
      ?auto_153623 - SURFACE
      ?auto_153624 - SURFACE
      ?auto_153626 - SURFACE
      ?auto_153625 - SURFACE
    )
    :vars
    (
      ?auto_153627 - HOIST
      ?auto_153629 - PLACE
      ?auto_153631 - PLACE
      ?auto_153632 - HOIST
      ?auto_153630 - SURFACE
      ?auto_153628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153627 ?auto_153629 ) ( IS-CRATE ?auto_153625 ) ( not ( = ?auto_153626 ?auto_153625 ) ) ( not ( = ?auto_153624 ?auto_153626 ) ) ( not ( = ?auto_153624 ?auto_153625 ) ) ( not ( = ?auto_153631 ?auto_153629 ) ) ( HOIST-AT ?auto_153632 ?auto_153631 ) ( not ( = ?auto_153627 ?auto_153632 ) ) ( AVAILABLE ?auto_153632 ) ( SURFACE-AT ?auto_153625 ?auto_153631 ) ( ON ?auto_153625 ?auto_153630 ) ( CLEAR ?auto_153625 ) ( not ( = ?auto_153626 ?auto_153630 ) ) ( not ( = ?auto_153625 ?auto_153630 ) ) ( not ( = ?auto_153624 ?auto_153630 ) ) ( TRUCK-AT ?auto_153628 ?auto_153629 ) ( SURFACE-AT ?auto_153624 ?auto_153629 ) ( CLEAR ?auto_153624 ) ( LIFTING ?auto_153627 ?auto_153626 ) ( IS-CRATE ?auto_153626 ) ( ON ?auto_153623 ?auto_153622 ) ( ON ?auto_153624 ?auto_153623 ) ( not ( = ?auto_153622 ?auto_153623 ) ) ( not ( = ?auto_153622 ?auto_153624 ) ) ( not ( = ?auto_153622 ?auto_153626 ) ) ( not ( = ?auto_153622 ?auto_153625 ) ) ( not ( = ?auto_153622 ?auto_153630 ) ) ( not ( = ?auto_153623 ?auto_153624 ) ) ( not ( = ?auto_153623 ?auto_153626 ) ) ( not ( = ?auto_153623 ?auto_153625 ) ) ( not ( = ?auto_153623 ?auto_153630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153624 ?auto_153626 ?auto_153625 )
      ( MAKE-4CRATE-VERIFY ?auto_153622 ?auto_153623 ?auto_153624 ?auto_153626 ?auto_153625 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_153661 - SURFACE
      ?auto_153662 - SURFACE
      ?auto_153663 - SURFACE
      ?auto_153665 - SURFACE
      ?auto_153664 - SURFACE
    )
    :vars
    (
      ?auto_153667 - HOIST
      ?auto_153671 - PLACE
      ?auto_153669 - PLACE
      ?auto_153666 - HOIST
      ?auto_153670 - SURFACE
      ?auto_153668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_153667 ?auto_153671 ) ( IS-CRATE ?auto_153664 ) ( not ( = ?auto_153665 ?auto_153664 ) ) ( not ( = ?auto_153663 ?auto_153665 ) ) ( not ( = ?auto_153663 ?auto_153664 ) ) ( not ( = ?auto_153669 ?auto_153671 ) ) ( HOIST-AT ?auto_153666 ?auto_153669 ) ( not ( = ?auto_153667 ?auto_153666 ) ) ( AVAILABLE ?auto_153666 ) ( SURFACE-AT ?auto_153664 ?auto_153669 ) ( ON ?auto_153664 ?auto_153670 ) ( CLEAR ?auto_153664 ) ( not ( = ?auto_153665 ?auto_153670 ) ) ( not ( = ?auto_153664 ?auto_153670 ) ) ( not ( = ?auto_153663 ?auto_153670 ) ) ( TRUCK-AT ?auto_153668 ?auto_153671 ) ( SURFACE-AT ?auto_153663 ?auto_153671 ) ( CLEAR ?auto_153663 ) ( IS-CRATE ?auto_153665 ) ( AVAILABLE ?auto_153667 ) ( IN ?auto_153665 ?auto_153668 ) ( ON ?auto_153662 ?auto_153661 ) ( ON ?auto_153663 ?auto_153662 ) ( not ( = ?auto_153661 ?auto_153662 ) ) ( not ( = ?auto_153661 ?auto_153663 ) ) ( not ( = ?auto_153661 ?auto_153665 ) ) ( not ( = ?auto_153661 ?auto_153664 ) ) ( not ( = ?auto_153661 ?auto_153670 ) ) ( not ( = ?auto_153662 ?auto_153663 ) ) ( not ( = ?auto_153662 ?auto_153665 ) ) ( not ( = ?auto_153662 ?auto_153664 ) ) ( not ( = ?auto_153662 ?auto_153670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_153663 ?auto_153665 ?auto_153664 )
      ( MAKE-4CRATE-VERIFY ?auto_153661 ?auto_153662 ?auto_153663 ?auto_153665 ?auto_153664 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154321 - SURFACE
      ?auto_154322 - SURFACE
      ?auto_154323 - SURFACE
      ?auto_154325 - SURFACE
      ?auto_154324 - SURFACE
      ?auto_154326 - SURFACE
    )
    :vars
    (
      ?auto_154328 - HOIST
      ?auto_154327 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_154328 ?auto_154327 ) ( SURFACE-AT ?auto_154324 ?auto_154327 ) ( CLEAR ?auto_154324 ) ( LIFTING ?auto_154328 ?auto_154326 ) ( IS-CRATE ?auto_154326 ) ( not ( = ?auto_154324 ?auto_154326 ) ) ( ON ?auto_154322 ?auto_154321 ) ( ON ?auto_154323 ?auto_154322 ) ( ON ?auto_154325 ?auto_154323 ) ( ON ?auto_154324 ?auto_154325 ) ( not ( = ?auto_154321 ?auto_154322 ) ) ( not ( = ?auto_154321 ?auto_154323 ) ) ( not ( = ?auto_154321 ?auto_154325 ) ) ( not ( = ?auto_154321 ?auto_154324 ) ) ( not ( = ?auto_154321 ?auto_154326 ) ) ( not ( = ?auto_154322 ?auto_154323 ) ) ( not ( = ?auto_154322 ?auto_154325 ) ) ( not ( = ?auto_154322 ?auto_154324 ) ) ( not ( = ?auto_154322 ?auto_154326 ) ) ( not ( = ?auto_154323 ?auto_154325 ) ) ( not ( = ?auto_154323 ?auto_154324 ) ) ( not ( = ?auto_154323 ?auto_154326 ) ) ( not ( = ?auto_154325 ?auto_154324 ) ) ( not ( = ?auto_154325 ?auto_154326 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_154324 ?auto_154326 )
      ( MAKE-5CRATE-VERIFY ?auto_154321 ?auto_154322 ?auto_154323 ?auto_154325 ?auto_154324 ?auto_154326 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154355 - SURFACE
      ?auto_154356 - SURFACE
      ?auto_154357 - SURFACE
      ?auto_154359 - SURFACE
      ?auto_154358 - SURFACE
      ?auto_154360 - SURFACE
    )
    :vars
    (
      ?auto_154362 - HOIST
      ?auto_154363 - PLACE
      ?auto_154361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154362 ?auto_154363 ) ( SURFACE-AT ?auto_154358 ?auto_154363 ) ( CLEAR ?auto_154358 ) ( IS-CRATE ?auto_154360 ) ( not ( = ?auto_154358 ?auto_154360 ) ) ( TRUCK-AT ?auto_154361 ?auto_154363 ) ( AVAILABLE ?auto_154362 ) ( IN ?auto_154360 ?auto_154361 ) ( ON ?auto_154358 ?auto_154359 ) ( not ( = ?auto_154359 ?auto_154358 ) ) ( not ( = ?auto_154359 ?auto_154360 ) ) ( ON ?auto_154356 ?auto_154355 ) ( ON ?auto_154357 ?auto_154356 ) ( ON ?auto_154359 ?auto_154357 ) ( not ( = ?auto_154355 ?auto_154356 ) ) ( not ( = ?auto_154355 ?auto_154357 ) ) ( not ( = ?auto_154355 ?auto_154359 ) ) ( not ( = ?auto_154355 ?auto_154358 ) ) ( not ( = ?auto_154355 ?auto_154360 ) ) ( not ( = ?auto_154356 ?auto_154357 ) ) ( not ( = ?auto_154356 ?auto_154359 ) ) ( not ( = ?auto_154356 ?auto_154358 ) ) ( not ( = ?auto_154356 ?auto_154360 ) ) ( not ( = ?auto_154357 ?auto_154359 ) ) ( not ( = ?auto_154357 ?auto_154358 ) ) ( not ( = ?auto_154357 ?auto_154360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154359 ?auto_154358 ?auto_154360 )
      ( MAKE-5CRATE-VERIFY ?auto_154355 ?auto_154356 ?auto_154357 ?auto_154359 ?auto_154358 ?auto_154360 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154395 - SURFACE
      ?auto_154396 - SURFACE
      ?auto_154397 - SURFACE
      ?auto_154399 - SURFACE
      ?auto_154398 - SURFACE
      ?auto_154400 - SURFACE
    )
    :vars
    (
      ?auto_154401 - HOIST
      ?auto_154402 - PLACE
      ?auto_154403 - TRUCK
      ?auto_154404 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_154401 ?auto_154402 ) ( SURFACE-AT ?auto_154398 ?auto_154402 ) ( CLEAR ?auto_154398 ) ( IS-CRATE ?auto_154400 ) ( not ( = ?auto_154398 ?auto_154400 ) ) ( AVAILABLE ?auto_154401 ) ( IN ?auto_154400 ?auto_154403 ) ( ON ?auto_154398 ?auto_154399 ) ( not ( = ?auto_154399 ?auto_154398 ) ) ( not ( = ?auto_154399 ?auto_154400 ) ) ( TRUCK-AT ?auto_154403 ?auto_154404 ) ( not ( = ?auto_154404 ?auto_154402 ) ) ( ON ?auto_154396 ?auto_154395 ) ( ON ?auto_154397 ?auto_154396 ) ( ON ?auto_154399 ?auto_154397 ) ( not ( = ?auto_154395 ?auto_154396 ) ) ( not ( = ?auto_154395 ?auto_154397 ) ) ( not ( = ?auto_154395 ?auto_154399 ) ) ( not ( = ?auto_154395 ?auto_154398 ) ) ( not ( = ?auto_154395 ?auto_154400 ) ) ( not ( = ?auto_154396 ?auto_154397 ) ) ( not ( = ?auto_154396 ?auto_154399 ) ) ( not ( = ?auto_154396 ?auto_154398 ) ) ( not ( = ?auto_154396 ?auto_154400 ) ) ( not ( = ?auto_154397 ?auto_154399 ) ) ( not ( = ?auto_154397 ?auto_154398 ) ) ( not ( = ?auto_154397 ?auto_154400 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154399 ?auto_154398 ?auto_154400 )
      ( MAKE-5CRATE-VERIFY ?auto_154395 ?auto_154396 ?auto_154397 ?auto_154399 ?auto_154398 ?auto_154400 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154440 - SURFACE
      ?auto_154441 - SURFACE
      ?auto_154442 - SURFACE
      ?auto_154444 - SURFACE
      ?auto_154443 - SURFACE
      ?auto_154445 - SURFACE
    )
    :vars
    (
      ?auto_154448 - HOIST
      ?auto_154447 - PLACE
      ?auto_154446 - TRUCK
      ?auto_154449 - PLACE
      ?auto_154450 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_154448 ?auto_154447 ) ( SURFACE-AT ?auto_154443 ?auto_154447 ) ( CLEAR ?auto_154443 ) ( IS-CRATE ?auto_154445 ) ( not ( = ?auto_154443 ?auto_154445 ) ) ( AVAILABLE ?auto_154448 ) ( ON ?auto_154443 ?auto_154444 ) ( not ( = ?auto_154444 ?auto_154443 ) ) ( not ( = ?auto_154444 ?auto_154445 ) ) ( TRUCK-AT ?auto_154446 ?auto_154449 ) ( not ( = ?auto_154449 ?auto_154447 ) ) ( HOIST-AT ?auto_154450 ?auto_154449 ) ( LIFTING ?auto_154450 ?auto_154445 ) ( not ( = ?auto_154448 ?auto_154450 ) ) ( ON ?auto_154441 ?auto_154440 ) ( ON ?auto_154442 ?auto_154441 ) ( ON ?auto_154444 ?auto_154442 ) ( not ( = ?auto_154440 ?auto_154441 ) ) ( not ( = ?auto_154440 ?auto_154442 ) ) ( not ( = ?auto_154440 ?auto_154444 ) ) ( not ( = ?auto_154440 ?auto_154443 ) ) ( not ( = ?auto_154440 ?auto_154445 ) ) ( not ( = ?auto_154441 ?auto_154442 ) ) ( not ( = ?auto_154441 ?auto_154444 ) ) ( not ( = ?auto_154441 ?auto_154443 ) ) ( not ( = ?auto_154441 ?auto_154445 ) ) ( not ( = ?auto_154442 ?auto_154444 ) ) ( not ( = ?auto_154442 ?auto_154443 ) ) ( not ( = ?auto_154442 ?auto_154445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154444 ?auto_154443 ?auto_154445 )
      ( MAKE-5CRATE-VERIFY ?auto_154440 ?auto_154441 ?auto_154442 ?auto_154444 ?auto_154443 ?auto_154445 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154490 - SURFACE
      ?auto_154491 - SURFACE
      ?auto_154492 - SURFACE
      ?auto_154494 - SURFACE
      ?auto_154493 - SURFACE
      ?auto_154495 - SURFACE
    )
    :vars
    (
      ?auto_154499 - HOIST
      ?auto_154497 - PLACE
      ?auto_154496 - TRUCK
      ?auto_154501 - PLACE
      ?auto_154498 - HOIST
      ?auto_154500 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_154499 ?auto_154497 ) ( SURFACE-AT ?auto_154493 ?auto_154497 ) ( CLEAR ?auto_154493 ) ( IS-CRATE ?auto_154495 ) ( not ( = ?auto_154493 ?auto_154495 ) ) ( AVAILABLE ?auto_154499 ) ( ON ?auto_154493 ?auto_154494 ) ( not ( = ?auto_154494 ?auto_154493 ) ) ( not ( = ?auto_154494 ?auto_154495 ) ) ( TRUCK-AT ?auto_154496 ?auto_154501 ) ( not ( = ?auto_154501 ?auto_154497 ) ) ( HOIST-AT ?auto_154498 ?auto_154501 ) ( not ( = ?auto_154499 ?auto_154498 ) ) ( AVAILABLE ?auto_154498 ) ( SURFACE-AT ?auto_154495 ?auto_154501 ) ( ON ?auto_154495 ?auto_154500 ) ( CLEAR ?auto_154495 ) ( not ( = ?auto_154493 ?auto_154500 ) ) ( not ( = ?auto_154495 ?auto_154500 ) ) ( not ( = ?auto_154494 ?auto_154500 ) ) ( ON ?auto_154491 ?auto_154490 ) ( ON ?auto_154492 ?auto_154491 ) ( ON ?auto_154494 ?auto_154492 ) ( not ( = ?auto_154490 ?auto_154491 ) ) ( not ( = ?auto_154490 ?auto_154492 ) ) ( not ( = ?auto_154490 ?auto_154494 ) ) ( not ( = ?auto_154490 ?auto_154493 ) ) ( not ( = ?auto_154490 ?auto_154495 ) ) ( not ( = ?auto_154490 ?auto_154500 ) ) ( not ( = ?auto_154491 ?auto_154492 ) ) ( not ( = ?auto_154491 ?auto_154494 ) ) ( not ( = ?auto_154491 ?auto_154493 ) ) ( not ( = ?auto_154491 ?auto_154495 ) ) ( not ( = ?auto_154491 ?auto_154500 ) ) ( not ( = ?auto_154492 ?auto_154494 ) ) ( not ( = ?auto_154492 ?auto_154493 ) ) ( not ( = ?auto_154492 ?auto_154495 ) ) ( not ( = ?auto_154492 ?auto_154500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154494 ?auto_154493 ?auto_154495 )
      ( MAKE-5CRATE-VERIFY ?auto_154490 ?auto_154491 ?auto_154492 ?auto_154494 ?auto_154493 ?auto_154495 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154541 - SURFACE
      ?auto_154542 - SURFACE
      ?auto_154543 - SURFACE
      ?auto_154545 - SURFACE
      ?auto_154544 - SURFACE
      ?auto_154546 - SURFACE
    )
    :vars
    (
      ?auto_154548 - HOIST
      ?auto_154551 - PLACE
      ?auto_154552 - PLACE
      ?auto_154547 - HOIST
      ?auto_154549 - SURFACE
      ?auto_154550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154548 ?auto_154551 ) ( SURFACE-AT ?auto_154544 ?auto_154551 ) ( CLEAR ?auto_154544 ) ( IS-CRATE ?auto_154546 ) ( not ( = ?auto_154544 ?auto_154546 ) ) ( AVAILABLE ?auto_154548 ) ( ON ?auto_154544 ?auto_154545 ) ( not ( = ?auto_154545 ?auto_154544 ) ) ( not ( = ?auto_154545 ?auto_154546 ) ) ( not ( = ?auto_154552 ?auto_154551 ) ) ( HOIST-AT ?auto_154547 ?auto_154552 ) ( not ( = ?auto_154548 ?auto_154547 ) ) ( AVAILABLE ?auto_154547 ) ( SURFACE-AT ?auto_154546 ?auto_154552 ) ( ON ?auto_154546 ?auto_154549 ) ( CLEAR ?auto_154546 ) ( not ( = ?auto_154544 ?auto_154549 ) ) ( not ( = ?auto_154546 ?auto_154549 ) ) ( not ( = ?auto_154545 ?auto_154549 ) ) ( TRUCK-AT ?auto_154550 ?auto_154551 ) ( ON ?auto_154542 ?auto_154541 ) ( ON ?auto_154543 ?auto_154542 ) ( ON ?auto_154545 ?auto_154543 ) ( not ( = ?auto_154541 ?auto_154542 ) ) ( not ( = ?auto_154541 ?auto_154543 ) ) ( not ( = ?auto_154541 ?auto_154545 ) ) ( not ( = ?auto_154541 ?auto_154544 ) ) ( not ( = ?auto_154541 ?auto_154546 ) ) ( not ( = ?auto_154541 ?auto_154549 ) ) ( not ( = ?auto_154542 ?auto_154543 ) ) ( not ( = ?auto_154542 ?auto_154545 ) ) ( not ( = ?auto_154542 ?auto_154544 ) ) ( not ( = ?auto_154542 ?auto_154546 ) ) ( not ( = ?auto_154542 ?auto_154549 ) ) ( not ( = ?auto_154543 ?auto_154545 ) ) ( not ( = ?auto_154543 ?auto_154544 ) ) ( not ( = ?auto_154543 ?auto_154546 ) ) ( not ( = ?auto_154543 ?auto_154549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154545 ?auto_154544 ?auto_154546 )
      ( MAKE-5CRATE-VERIFY ?auto_154541 ?auto_154542 ?auto_154543 ?auto_154545 ?auto_154544 ?auto_154546 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154592 - SURFACE
      ?auto_154593 - SURFACE
      ?auto_154594 - SURFACE
      ?auto_154596 - SURFACE
      ?auto_154595 - SURFACE
      ?auto_154597 - SURFACE
    )
    :vars
    (
      ?auto_154600 - HOIST
      ?auto_154601 - PLACE
      ?auto_154602 - PLACE
      ?auto_154599 - HOIST
      ?auto_154598 - SURFACE
      ?auto_154603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154600 ?auto_154601 ) ( IS-CRATE ?auto_154597 ) ( not ( = ?auto_154595 ?auto_154597 ) ) ( not ( = ?auto_154596 ?auto_154595 ) ) ( not ( = ?auto_154596 ?auto_154597 ) ) ( not ( = ?auto_154602 ?auto_154601 ) ) ( HOIST-AT ?auto_154599 ?auto_154602 ) ( not ( = ?auto_154600 ?auto_154599 ) ) ( AVAILABLE ?auto_154599 ) ( SURFACE-AT ?auto_154597 ?auto_154602 ) ( ON ?auto_154597 ?auto_154598 ) ( CLEAR ?auto_154597 ) ( not ( = ?auto_154595 ?auto_154598 ) ) ( not ( = ?auto_154597 ?auto_154598 ) ) ( not ( = ?auto_154596 ?auto_154598 ) ) ( TRUCK-AT ?auto_154603 ?auto_154601 ) ( SURFACE-AT ?auto_154596 ?auto_154601 ) ( CLEAR ?auto_154596 ) ( LIFTING ?auto_154600 ?auto_154595 ) ( IS-CRATE ?auto_154595 ) ( ON ?auto_154593 ?auto_154592 ) ( ON ?auto_154594 ?auto_154593 ) ( ON ?auto_154596 ?auto_154594 ) ( not ( = ?auto_154592 ?auto_154593 ) ) ( not ( = ?auto_154592 ?auto_154594 ) ) ( not ( = ?auto_154592 ?auto_154596 ) ) ( not ( = ?auto_154592 ?auto_154595 ) ) ( not ( = ?auto_154592 ?auto_154597 ) ) ( not ( = ?auto_154592 ?auto_154598 ) ) ( not ( = ?auto_154593 ?auto_154594 ) ) ( not ( = ?auto_154593 ?auto_154596 ) ) ( not ( = ?auto_154593 ?auto_154595 ) ) ( not ( = ?auto_154593 ?auto_154597 ) ) ( not ( = ?auto_154593 ?auto_154598 ) ) ( not ( = ?auto_154594 ?auto_154596 ) ) ( not ( = ?auto_154594 ?auto_154595 ) ) ( not ( = ?auto_154594 ?auto_154597 ) ) ( not ( = ?auto_154594 ?auto_154598 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154596 ?auto_154595 ?auto_154597 )
      ( MAKE-5CRATE-VERIFY ?auto_154592 ?auto_154593 ?auto_154594 ?auto_154596 ?auto_154595 ?auto_154597 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_154643 - SURFACE
      ?auto_154644 - SURFACE
      ?auto_154645 - SURFACE
      ?auto_154647 - SURFACE
      ?auto_154646 - SURFACE
      ?auto_154648 - SURFACE
    )
    :vars
    (
      ?auto_154649 - HOIST
      ?auto_154650 - PLACE
      ?auto_154654 - PLACE
      ?auto_154653 - HOIST
      ?auto_154652 - SURFACE
      ?auto_154651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154649 ?auto_154650 ) ( IS-CRATE ?auto_154648 ) ( not ( = ?auto_154646 ?auto_154648 ) ) ( not ( = ?auto_154647 ?auto_154646 ) ) ( not ( = ?auto_154647 ?auto_154648 ) ) ( not ( = ?auto_154654 ?auto_154650 ) ) ( HOIST-AT ?auto_154653 ?auto_154654 ) ( not ( = ?auto_154649 ?auto_154653 ) ) ( AVAILABLE ?auto_154653 ) ( SURFACE-AT ?auto_154648 ?auto_154654 ) ( ON ?auto_154648 ?auto_154652 ) ( CLEAR ?auto_154648 ) ( not ( = ?auto_154646 ?auto_154652 ) ) ( not ( = ?auto_154648 ?auto_154652 ) ) ( not ( = ?auto_154647 ?auto_154652 ) ) ( TRUCK-AT ?auto_154651 ?auto_154650 ) ( SURFACE-AT ?auto_154647 ?auto_154650 ) ( CLEAR ?auto_154647 ) ( IS-CRATE ?auto_154646 ) ( AVAILABLE ?auto_154649 ) ( IN ?auto_154646 ?auto_154651 ) ( ON ?auto_154644 ?auto_154643 ) ( ON ?auto_154645 ?auto_154644 ) ( ON ?auto_154647 ?auto_154645 ) ( not ( = ?auto_154643 ?auto_154644 ) ) ( not ( = ?auto_154643 ?auto_154645 ) ) ( not ( = ?auto_154643 ?auto_154647 ) ) ( not ( = ?auto_154643 ?auto_154646 ) ) ( not ( = ?auto_154643 ?auto_154648 ) ) ( not ( = ?auto_154643 ?auto_154652 ) ) ( not ( = ?auto_154644 ?auto_154645 ) ) ( not ( = ?auto_154644 ?auto_154647 ) ) ( not ( = ?auto_154644 ?auto_154646 ) ) ( not ( = ?auto_154644 ?auto_154648 ) ) ( not ( = ?auto_154644 ?auto_154652 ) ) ( not ( = ?auto_154645 ?auto_154647 ) ) ( not ( = ?auto_154645 ?auto_154646 ) ) ( not ( = ?auto_154645 ?auto_154648 ) ) ( not ( = ?auto_154645 ?auto_154652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_154647 ?auto_154646 ?auto_154648 )
      ( MAKE-5CRATE-VERIFY ?auto_154643 ?auto_154644 ?auto_154645 ?auto_154647 ?auto_154646 ?auto_154648 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_155323 - SURFACE
      ?auto_155324 - SURFACE
    )
    :vars
    (
      ?auto_155325 - HOIST
      ?auto_155327 - PLACE
      ?auto_155326 - SURFACE
      ?auto_155330 - TRUCK
      ?auto_155329 - PLACE
      ?auto_155328 - HOIST
      ?auto_155331 - SURFACE
      ?auto_155332 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_155325 ?auto_155327 ) ( SURFACE-AT ?auto_155323 ?auto_155327 ) ( CLEAR ?auto_155323 ) ( IS-CRATE ?auto_155324 ) ( not ( = ?auto_155323 ?auto_155324 ) ) ( AVAILABLE ?auto_155325 ) ( ON ?auto_155323 ?auto_155326 ) ( not ( = ?auto_155326 ?auto_155323 ) ) ( not ( = ?auto_155326 ?auto_155324 ) ) ( TRUCK-AT ?auto_155330 ?auto_155329 ) ( not ( = ?auto_155329 ?auto_155327 ) ) ( HOIST-AT ?auto_155328 ?auto_155329 ) ( not ( = ?auto_155325 ?auto_155328 ) ) ( SURFACE-AT ?auto_155324 ?auto_155329 ) ( ON ?auto_155324 ?auto_155331 ) ( CLEAR ?auto_155324 ) ( not ( = ?auto_155323 ?auto_155331 ) ) ( not ( = ?auto_155324 ?auto_155331 ) ) ( not ( = ?auto_155326 ?auto_155331 ) ) ( LIFTING ?auto_155328 ?auto_155332 ) ( IS-CRATE ?auto_155332 ) ( not ( = ?auto_155323 ?auto_155332 ) ) ( not ( = ?auto_155324 ?auto_155332 ) ) ( not ( = ?auto_155326 ?auto_155332 ) ) ( not ( = ?auto_155331 ?auto_155332 ) ) )
    :subtasks
    ( ( !LOAD ?auto_155328 ?auto_155332 ?auto_155330 ?auto_155329 )
      ( MAKE-1CRATE ?auto_155323 ?auto_155324 )
      ( MAKE-1CRATE-VERIFY ?auto_155323 ?auto_155324 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_155849 - SURFACE
      ?auto_155850 - SURFACE
      ?auto_155851 - SURFACE
      ?auto_155853 - SURFACE
      ?auto_155852 - SURFACE
      ?auto_155854 - SURFACE
      ?auto_155855 - SURFACE
    )
    :vars
    (
      ?auto_155856 - HOIST
      ?auto_155857 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_155856 ?auto_155857 ) ( SURFACE-AT ?auto_155854 ?auto_155857 ) ( CLEAR ?auto_155854 ) ( LIFTING ?auto_155856 ?auto_155855 ) ( IS-CRATE ?auto_155855 ) ( not ( = ?auto_155854 ?auto_155855 ) ) ( ON ?auto_155850 ?auto_155849 ) ( ON ?auto_155851 ?auto_155850 ) ( ON ?auto_155853 ?auto_155851 ) ( ON ?auto_155852 ?auto_155853 ) ( ON ?auto_155854 ?auto_155852 ) ( not ( = ?auto_155849 ?auto_155850 ) ) ( not ( = ?auto_155849 ?auto_155851 ) ) ( not ( = ?auto_155849 ?auto_155853 ) ) ( not ( = ?auto_155849 ?auto_155852 ) ) ( not ( = ?auto_155849 ?auto_155854 ) ) ( not ( = ?auto_155849 ?auto_155855 ) ) ( not ( = ?auto_155850 ?auto_155851 ) ) ( not ( = ?auto_155850 ?auto_155853 ) ) ( not ( = ?auto_155850 ?auto_155852 ) ) ( not ( = ?auto_155850 ?auto_155854 ) ) ( not ( = ?auto_155850 ?auto_155855 ) ) ( not ( = ?auto_155851 ?auto_155853 ) ) ( not ( = ?auto_155851 ?auto_155852 ) ) ( not ( = ?auto_155851 ?auto_155854 ) ) ( not ( = ?auto_155851 ?auto_155855 ) ) ( not ( = ?auto_155853 ?auto_155852 ) ) ( not ( = ?auto_155853 ?auto_155854 ) ) ( not ( = ?auto_155853 ?auto_155855 ) ) ( not ( = ?auto_155852 ?auto_155854 ) ) ( not ( = ?auto_155852 ?auto_155855 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_155854 ?auto_155855 )
      ( MAKE-6CRATE-VERIFY ?auto_155849 ?auto_155850 ?auto_155851 ?auto_155853 ?auto_155852 ?auto_155854 ?auto_155855 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_155893 - SURFACE
      ?auto_155894 - SURFACE
      ?auto_155895 - SURFACE
      ?auto_155897 - SURFACE
      ?auto_155896 - SURFACE
      ?auto_155898 - SURFACE
      ?auto_155899 - SURFACE
    )
    :vars
    (
      ?auto_155902 - HOIST
      ?auto_155900 - PLACE
      ?auto_155901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_155902 ?auto_155900 ) ( SURFACE-AT ?auto_155898 ?auto_155900 ) ( CLEAR ?auto_155898 ) ( IS-CRATE ?auto_155899 ) ( not ( = ?auto_155898 ?auto_155899 ) ) ( TRUCK-AT ?auto_155901 ?auto_155900 ) ( AVAILABLE ?auto_155902 ) ( IN ?auto_155899 ?auto_155901 ) ( ON ?auto_155898 ?auto_155896 ) ( not ( = ?auto_155896 ?auto_155898 ) ) ( not ( = ?auto_155896 ?auto_155899 ) ) ( ON ?auto_155894 ?auto_155893 ) ( ON ?auto_155895 ?auto_155894 ) ( ON ?auto_155897 ?auto_155895 ) ( ON ?auto_155896 ?auto_155897 ) ( not ( = ?auto_155893 ?auto_155894 ) ) ( not ( = ?auto_155893 ?auto_155895 ) ) ( not ( = ?auto_155893 ?auto_155897 ) ) ( not ( = ?auto_155893 ?auto_155896 ) ) ( not ( = ?auto_155893 ?auto_155898 ) ) ( not ( = ?auto_155893 ?auto_155899 ) ) ( not ( = ?auto_155894 ?auto_155895 ) ) ( not ( = ?auto_155894 ?auto_155897 ) ) ( not ( = ?auto_155894 ?auto_155896 ) ) ( not ( = ?auto_155894 ?auto_155898 ) ) ( not ( = ?auto_155894 ?auto_155899 ) ) ( not ( = ?auto_155895 ?auto_155897 ) ) ( not ( = ?auto_155895 ?auto_155896 ) ) ( not ( = ?auto_155895 ?auto_155898 ) ) ( not ( = ?auto_155895 ?auto_155899 ) ) ( not ( = ?auto_155897 ?auto_155896 ) ) ( not ( = ?auto_155897 ?auto_155898 ) ) ( not ( = ?auto_155897 ?auto_155899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_155896 ?auto_155898 ?auto_155899 )
      ( MAKE-6CRATE-VERIFY ?auto_155893 ?auto_155894 ?auto_155895 ?auto_155897 ?auto_155896 ?auto_155898 ?auto_155899 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_155944 - SURFACE
      ?auto_155945 - SURFACE
      ?auto_155946 - SURFACE
      ?auto_155948 - SURFACE
      ?auto_155947 - SURFACE
      ?auto_155949 - SURFACE
      ?auto_155950 - SURFACE
    )
    :vars
    (
      ?auto_155953 - HOIST
      ?auto_155952 - PLACE
      ?auto_155951 - TRUCK
      ?auto_155954 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_155953 ?auto_155952 ) ( SURFACE-AT ?auto_155949 ?auto_155952 ) ( CLEAR ?auto_155949 ) ( IS-CRATE ?auto_155950 ) ( not ( = ?auto_155949 ?auto_155950 ) ) ( AVAILABLE ?auto_155953 ) ( IN ?auto_155950 ?auto_155951 ) ( ON ?auto_155949 ?auto_155947 ) ( not ( = ?auto_155947 ?auto_155949 ) ) ( not ( = ?auto_155947 ?auto_155950 ) ) ( TRUCK-AT ?auto_155951 ?auto_155954 ) ( not ( = ?auto_155954 ?auto_155952 ) ) ( ON ?auto_155945 ?auto_155944 ) ( ON ?auto_155946 ?auto_155945 ) ( ON ?auto_155948 ?auto_155946 ) ( ON ?auto_155947 ?auto_155948 ) ( not ( = ?auto_155944 ?auto_155945 ) ) ( not ( = ?auto_155944 ?auto_155946 ) ) ( not ( = ?auto_155944 ?auto_155948 ) ) ( not ( = ?auto_155944 ?auto_155947 ) ) ( not ( = ?auto_155944 ?auto_155949 ) ) ( not ( = ?auto_155944 ?auto_155950 ) ) ( not ( = ?auto_155945 ?auto_155946 ) ) ( not ( = ?auto_155945 ?auto_155948 ) ) ( not ( = ?auto_155945 ?auto_155947 ) ) ( not ( = ?auto_155945 ?auto_155949 ) ) ( not ( = ?auto_155945 ?auto_155950 ) ) ( not ( = ?auto_155946 ?auto_155948 ) ) ( not ( = ?auto_155946 ?auto_155947 ) ) ( not ( = ?auto_155946 ?auto_155949 ) ) ( not ( = ?auto_155946 ?auto_155950 ) ) ( not ( = ?auto_155948 ?auto_155947 ) ) ( not ( = ?auto_155948 ?auto_155949 ) ) ( not ( = ?auto_155948 ?auto_155950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_155947 ?auto_155949 ?auto_155950 )
      ( MAKE-6CRATE-VERIFY ?auto_155944 ?auto_155945 ?auto_155946 ?auto_155948 ?auto_155947 ?auto_155949 ?auto_155950 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156001 - SURFACE
      ?auto_156002 - SURFACE
      ?auto_156003 - SURFACE
      ?auto_156005 - SURFACE
      ?auto_156004 - SURFACE
      ?auto_156006 - SURFACE
      ?auto_156007 - SURFACE
    )
    :vars
    (
      ?auto_156010 - HOIST
      ?auto_156008 - PLACE
      ?auto_156009 - TRUCK
      ?auto_156011 - PLACE
      ?auto_156012 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_156010 ?auto_156008 ) ( SURFACE-AT ?auto_156006 ?auto_156008 ) ( CLEAR ?auto_156006 ) ( IS-CRATE ?auto_156007 ) ( not ( = ?auto_156006 ?auto_156007 ) ) ( AVAILABLE ?auto_156010 ) ( ON ?auto_156006 ?auto_156004 ) ( not ( = ?auto_156004 ?auto_156006 ) ) ( not ( = ?auto_156004 ?auto_156007 ) ) ( TRUCK-AT ?auto_156009 ?auto_156011 ) ( not ( = ?auto_156011 ?auto_156008 ) ) ( HOIST-AT ?auto_156012 ?auto_156011 ) ( LIFTING ?auto_156012 ?auto_156007 ) ( not ( = ?auto_156010 ?auto_156012 ) ) ( ON ?auto_156002 ?auto_156001 ) ( ON ?auto_156003 ?auto_156002 ) ( ON ?auto_156005 ?auto_156003 ) ( ON ?auto_156004 ?auto_156005 ) ( not ( = ?auto_156001 ?auto_156002 ) ) ( not ( = ?auto_156001 ?auto_156003 ) ) ( not ( = ?auto_156001 ?auto_156005 ) ) ( not ( = ?auto_156001 ?auto_156004 ) ) ( not ( = ?auto_156001 ?auto_156006 ) ) ( not ( = ?auto_156001 ?auto_156007 ) ) ( not ( = ?auto_156002 ?auto_156003 ) ) ( not ( = ?auto_156002 ?auto_156005 ) ) ( not ( = ?auto_156002 ?auto_156004 ) ) ( not ( = ?auto_156002 ?auto_156006 ) ) ( not ( = ?auto_156002 ?auto_156007 ) ) ( not ( = ?auto_156003 ?auto_156005 ) ) ( not ( = ?auto_156003 ?auto_156004 ) ) ( not ( = ?auto_156003 ?auto_156006 ) ) ( not ( = ?auto_156003 ?auto_156007 ) ) ( not ( = ?auto_156005 ?auto_156004 ) ) ( not ( = ?auto_156005 ?auto_156006 ) ) ( not ( = ?auto_156005 ?auto_156007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156004 ?auto_156006 ?auto_156007 )
      ( MAKE-6CRATE-VERIFY ?auto_156001 ?auto_156002 ?auto_156003 ?auto_156005 ?auto_156004 ?auto_156006 ?auto_156007 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156064 - SURFACE
      ?auto_156065 - SURFACE
      ?auto_156066 - SURFACE
      ?auto_156068 - SURFACE
      ?auto_156067 - SURFACE
      ?auto_156069 - SURFACE
      ?auto_156070 - SURFACE
    )
    :vars
    (
      ?auto_156072 - HOIST
      ?auto_156076 - PLACE
      ?auto_156075 - TRUCK
      ?auto_156071 - PLACE
      ?auto_156073 - HOIST
      ?auto_156074 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_156072 ?auto_156076 ) ( SURFACE-AT ?auto_156069 ?auto_156076 ) ( CLEAR ?auto_156069 ) ( IS-CRATE ?auto_156070 ) ( not ( = ?auto_156069 ?auto_156070 ) ) ( AVAILABLE ?auto_156072 ) ( ON ?auto_156069 ?auto_156067 ) ( not ( = ?auto_156067 ?auto_156069 ) ) ( not ( = ?auto_156067 ?auto_156070 ) ) ( TRUCK-AT ?auto_156075 ?auto_156071 ) ( not ( = ?auto_156071 ?auto_156076 ) ) ( HOIST-AT ?auto_156073 ?auto_156071 ) ( not ( = ?auto_156072 ?auto_156073 ) ) ( AVAILABLE ?auto_156073 ) ( SURFACE-AT ?auto_156070 ?auto_156071 ) ( ON ?auto_156070 ?auto_156074 ) ( CLEAR ?auto_156070 ) ( not ( = ?auto_156069 ?auto_156074 ) ) ( not ( = ?auto_156070 ?auto_156074 ) ) ( not ( = ?auto_156067 ?auto_156074 ) ) ( ON ?auto_156065 ?auto_156064 ) ( ON ?auto_156066 ?auto_156065 ) ( ON ?auto_156068 ?auto_156066 ) ( ON ?auto_156067 ?auto_156068 ) ( not ( = ?auto_156064 ?auto_156065 ) ) ( not ( = ?auto_156064 ?auto_156066 ) ) ( not ( = ?auto_156064 ?auto_156068 ) ) ( not ( = ?auto_156064 ?auto_156067 ) ) ( not ( = ?auto_156064 ?auto_156069 ) ) ( not ( = ?auto_156064 ?auto_156070 ) ) ( not ( = ?auto_156064 ?auto_156074 ) ) ( not ( = ?auto_156065 ?auto_156066 ) ) ( not ( = ?auto_156065 ?auto_156068 ) ) ( not ( = ?auto_156065 ?auto_156067 ) ) ( not ( = ?auto_156065 ?auto_156069 ) ) ( not ( = ?auto_156065 ?auto_156070 ) ) ( not ( = ?auto_156065 ?auto_156074 ) ) ( not ( = ?auto_156066 ?auto_156068 ) ) ( not ( = ?auto_156066 ?auto_156067 ) ) ( not ( = ?auto_156066 ?auto_156069 ) ) ( not ( = ?auto_156066 ?auto_156070 ) ) ( not ( = ?auto_156066 ?auto_156074 ) ) ( not ( = ?auto_156068 ?auto_156067 ) ) ( not ( = ?auto_156068 ?auto_156069 ) ) ( not ( = ?auto_156068 ?auto_156070 ) ) ( not ( = ?auto_156068 ?auto_156074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156067 ?auto_156069 ?auto_156070 )
      ( MAKE-6CRATE-VERIFY ?auto_156064 ?auto_156065 ?auto_156066 ?auto_156068 ?auto_156067 ?auto_156069 ?auto_156070 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156128 - SURFACE
      ?auto_156129 - SURFACE
      ?auto_156130 - SURFACE
      ?auto_156132 - SURFACE
      ?auto_156131 - SURFACE
      ?auto_156133 - SURFACE
      ?auto_156134 - SURFACE
    )
    :vars
    (
      ?auto_156140 - HOIST
      ?auto_156135 - PLACE
      ?auto_156137 - PLACE
      ?auto_156136 - HOIST
      ?auto_156138 - SURFACE
      ?auto_156139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_156140 ?auto_156135 ) ( SURFACE-AT ?auto_156133 ?auto_156135 ) ( CLEAR ?auto_156133 ) ( IS-CRATE ?auto_156134 ) ( not ( = ?auto_156133 ?auto_156134 ) ) ( AVAILABLE ?auto_156140 ) ( ON ?auto_156133 ?auto_156131 ) ( not ( = ?auto_156131 ?auto_156133 ) ) ( not ( = ?auto_156131 ?auto_156134 ) ) ( not ( = ?auto_156137 ?auto_156135 ) ) ( HOIST-AT ?auto_156136 ?auto_156137 ) ( not ( = ?auto_156140 ?auto_156136 ) ) ( AVAILABLE ?auto_156136 ) ( SURFACE-AT ?auto_156134 ?auto_156137 ) ( ON ?auto_156134 ?auto_156138 ) ( CLEAR ?auto_156134 ) ( not ( = ?auto_156133 ?auto_156138 ) ) ( not ( = ?auto_156134 ?auto_156138 ) ) ( not ( = ?auto_156131 ?auto_156138 ) ) ( TRUCK-AT ?auto_156139 ?auto_156135 ) ( ON ?auto_156129 ?auto_156128 ) ( ON ?auto_156130 ?auto_156129 ) ( ON ?auto_156132 ?auto_156130 ) ( ON ?auto_156131 ?auto_156132 ) ( not ( = ?auto_156128 ?auto_156129 ) ) ( not ( = ?auto_156128 ?auto_156130 ) ) ( not ( = ?auto_156128 ?auto_156132 ) ) ( not ( = ?auto_156128 ?auto_156131 ) ) ( not ( = ?auto_156128 ?auto_156133 ) ) ( not ( = ?auto_156128 ?auto_156134 ) ) ( not ( = ?auto_156128 ?auto_156138 ) ) ( not ( = ?auto_156129 ?auto_156130 ) ) ( not ( = ?auto_156129 ?auto_156132 ) ) ( not ( = ?auto_156129 ?auto_156131 ) ) ( not ( = ?auto_156129 ?auto_156133 ) ) ( not ( = ?auto_156129 ?auto_156134 ) ) ( not ( = ?auto_156129 ?auto_156138 ) ) ( not ( = ?auto_156130 ?auto_156132 ) ) ( not ( = ?auto_156130 ?auto_156131 ) ) ( not ( = ?auto_156130 ?auto_156133 ) ) ( not ( = ?auto_156130 ?auto_156134 ) ) ( not ( = ?auto_156130 ?auto_156138 ) ) ( not ( = ?auto_156132 ?auto_156131 ) ) ( not ( = ?auto_156132 ?auto_156133 ) ) ( not ( = ?auto_156132 ?auto_156134 ) ) ( not ( = ?auto_156132 ?auto_156138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156131 ?auto_156133 ?auto_156134 )
      ( MAKE-6CRATE-VERIFY ?auto_156128 ?auto_156129 ?auto_156130 ?auto_156132 ?auto_156131 ?auto_156133 ?auto_156134 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156192 - SURFACE
      ?auto_156193 - SURFACE
      ?auto_156194 - SURFACE
      ?auto_156196 - SURFACE
      ?auto_156195 - SURFACE
      ?auto_156197 - SURFACE
      ?auto_156198 - SURFACE
    )
    :vars
    (
      ?auto_156203 - HOIST
      ?auto_156201 - PLACE
      ?auto_156199 - PLACE
      ?auto_156202 - HOIST
      ?auto_156204 - SURFACE
      ?auto_156200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_156203 ?auto_156201 ) ( IS-CRATE ?auto_156198 ) ( not ( = ?auto_156197 ?auto_156198 ) ) ( not ( = ?auto_156195 ?auto_156197 ) ) ( not ( = ?auto_156195 ?auto_156198 ) ) ( not ( = ?auto_156199 ?auto_156201 ) ) ( HOIST-AT ?auto_156202 ?auto_156199 ) ( not ( = ?auto_156203 ?auto_156202 ) ) ( AVAILABLE ?auto_156202 ) ( SURFACE-AT ?auto_156198 ?auto_156199 ) ( ON ?auto_156198 ?auto_156204 ) ( CLEAR ?auto_156198 ) ( not ( = ?auto_156197 ?auto_156204 ) ) ( not ( = ?auto_156198 ?auto_156204 ) ) ( not ( = ?auto_156195 ?auto_156204 ) ) ( TRUCK-AT ?auto_156200 ?auto_156201 ) ( SURFACE-AT ?auto_156195 ?auto_156201 ) ( CLEAR ?auto_156195 ) ( LIFTING ?auto_156203 ?auto_156197 ) ( IS-CRATE ?auto_156197 ) ( ON ?auto_156193 ?auto_156192 ) ( ON ?auto_156194 ?auto_156193 ) ( ON ?auto_156196 ?auto_156194 ) ( ON ?auto_156195 ?auto_156196 ) ( not ( = ?auto_156192 ?auto_156193 ) ) ( not ( = ?auto_156192 ?auto_156194 ) ) ( not ( = ?auto_156192 ?auto_156196 ) ) ( not ( = ?auto_156192 ?auto_156195 ) ) ( not ( = ?auto_156192 ?auto_156197 ) ) ( not ( = ?auto_156192 ?auto_156198 ) ) ( not ( = ?auto_156192 ?auto_156204 ) ) ( not ( = ?auto_156193 ?auto_156194 ) ) ( not ( = ?auto_156193 ?auto_156196 ) ) ( not ( = ?auto_156193 ?auto_156195 ) ) ( not ( = ?auto_156193 ?auto_156197 ) ) ( not ( = ?auto_156193 ?auto_156198 ) ) ( not ( = ?auto_156193 ?auto_156204 ) ) ( not ( = ?auto_156194 ?auto_156196 ) ) ( not ( = ?auto_156194 ?auto_156195 ) ) ( not ( = ?auto_156194 ?auto_156197 ) ) ( not ( = ?auto_156194 ?auto_156198 ) ) ( not ( = ?auto_156194 ?auto_156204 ) ) ( not ( = ?auto_156196 ?auto_156195 ) ) ( not ( = ?auto_156196 ?auto_156197 ) ) ( not ( = ?auto_156196 ?auto_156198 ) ) ( not ( = ?auto_156196 ?auto_156204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156195 ?auto_156197 ?auto_156198 )
      ( MAKE-6CRATE-VERIFY ?auto_156192 ?auto_156193 ?auto_156194 ?auto_156196 ?auto_156195 ?auto_156197 ?auto_156198 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_156256 - SURFACE
      ?auto_156257 - SURFACE
      ?auto_156258 - SURFACE
      ?auto_156260 - SURFACE
      ?auto_156259 - SURFACE
      ?auto_156261 - SURFACE
      ?auto_156262 - SURFACE
    )
    :vars
    (
      ?auto_156266 - HOIST
      ?auto_156264 - PLACE
      ?auto_156263 - PLACE
      ?auto_156268 - HOIST
      ?auto_156267 - SURFACE
      ?auto_156265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_156266 ?auto_156264 ) ( IS-CRATE ?auto_156262 ) ( not ( = ?auto_156261 ?auto_156262 ) ) ( not ( = ?auto_156259 ?auto_156261 ) ) ( not ( = ?auto_156259 ?auto_156262 ) ) ( not ( = ?auto_156263 ?auto_156264 ) ) ( HOIST-AT ?auto_156268 ?auto_156263 ) ( not ( = ?auto_156266 ?auto_156268 ) ) ( AVAILABLE ?auto_156268 ) ( SURFACE-AT ?auto_156262 ?auto_156263 ) ( ON ?auto_156262 ?auto_156267 ) ( CLEAR ?auto_156262 ) ( not ( = ?auto_156261 ?auto_156267 ) ) ( not ( = ?auto_156262 ?auto_156267 ) ) ( not ( = ?auto_156259 ?auto_156267 ) ) ( TRUCK-AT ?auto_156265 ?auto_156264 ) ( SURFACE-AT ?auto_156259 ?auto_156264 ) ( CLEAR ?auto_156259 ) ( IS-CRATE ?auto_156261 ) ( AVAILABLE ?auto_156266 ) ( IN ?auto_156261 ?auto_156265 ) ( ON ?auto_156257 ?auto_156256 ) ( ON ?auto_156258 ?auto_156257 ) ( ON ?auto_156260 ?auto_156258 ) ( ON ?auto_156259 ?auto_156260 ) ( not ( = ?auto_156256 ?auto_156257 ) ) ( not ( = ?auto_156256 ?auto_156258 ) ) ( not ( = ?auto_156256 ?auto_156260 ) ) ( not ( = ?auto_156256 ?auto_156259 ) ) ( not ( = ?auto_156256 ?auto_156261 ) ) ( not ( = ?auto_156256 ?auto_156262 ) ) ( not ( = ?auto_156256 ?auto_156267 ) ) ( not ( = ?auto_156257 ?auto_156258 ) ) ( not ( = ?auto_156257 ?auto_156260 ) ) ( not ( = ?auto_156257 ?auto_156259 ) ) ( not ( = ?auto_156257 ?auto_156261 ) ) ( not ( = ?auto_156257 ?auto_156262 ) ) ( not ( = ?auto_156257 ?auto_156267 ) ) ( not ( = ?auto_156258 ?auto_156260 ) ) ( not ( = ?auto_156258 ?auto_156259 ) ) ( not ( = ?auto_156258 ?auto_156261 ) ) ( not ( = ?auto_156258 ?auto_156262 ) ) ( not ( = ?auto_156258 ?auto_156267 ) ) ( not ( = ?auto_156260 ?auto_156259 ) ) ( not ( = ?auto_156260 ?auto_156261 ) ) ( not ( = ?auto_156260 ?auto_156262 ) ) ( not ( = ?auto_156260 ?auto_156267 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_156259 ?auto_156261 ?auto_156262 )
      ( MAKE-6CRATE-VERIFY ?auto_156256 ?auto_156257 ?auto_156258 ?auto_156260 ?auto_156259 ?auto_156261 ?auto_156262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_157530 - SURFACE
      ?auto_157531 - SURFACE
    )
    :vars
    (
      ?auto_157532 - HOIST
      ?auto_157536 - PLACE
      ?auto_157533 - SURFACE
      ?auto_157538 - PLACE
      ?auto_157537 - HOIST
      ?auto_157535 - SURFACE
      ?auto_157534 - TRUCK
      ?auto_157539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_157532 ?auto_157536 ) ( SURFACE-AT ?auto_157530 ?auto_157536 ) ( CLEAR ?auto_157530 ) ( IS-CRATE ?auto_157531 ) ( not ( = ?auto_157530 ?auto_157531 ) ) ( ON ?auto_157530 ?auto_157533 ) ( not ( = ?auto_157533 ?auto_157530 ) ) ( not ( = ?auto_157533 ?auto_157531 ) ) ( not ( = ?auto_157538 ?auto_157536 ) ) ( HOIST-AT ?auto_157537 ?auto_157538 ) ( not ( = ?auto_157532 ?auto_157537 ) ) ( AVAILABLE ?auto_157537 ) ( SURFACE-AT ?auto_157531 ?auto_157538 ) ( ON ?auto_157531 ?auto_157535 ) ( CLEAR ?auto_157531 ) ( not ( = ?auto_157530 ?auto_157535 ) ) ( not ( = ?auto_157531 ?auto_157535 ) ) ( not ( = ?auto_157533 ?auto_157535 ) ) ( TRUCK-AT ?auto_157534 ?auto_157536 ) ( LIFTING ?auto_157532 ?auto_157539 ) ( IS-CRATE ?auto_157539 ) ( not ( = ?auto_157530 ?auto_157539 ) ) ( not ( = ?auto_157531 ?auto_157539 ) ) ( not ( = ?auto_157533 ?auto_157539 ) ) ( not ( = ?auto_157535 ?auto_157539 ) ) )
    :subtasks
    ( ( !LOAD ?auto_157532 ?auto_157539 ?auto_157534 ?auto_157536 )
      ( MAKE-1CRATE ?auto_157530 ?auto_157531 )
      ( MAKE-1CRATE-VERIFY ?auto_157530 ?auto_157531 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158207 - SURFACE
      ?auto_158208 - SURFACE
      ?auto_158209 - SURFACE
      ?auto_158211 - SURFACE
      ?auto_158210 - SURFACE
      ?auto_158212 - SURFACE
      ?auto_158213 - SURFACE
      ?auto_158214 - SURFACE
    )
    :vars
    (
      ?auto_158215 - HOIST
      ?auto_158216 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_158215 ?auto_158216 ) ( SURFACE-AT ?auto_158213 ?auto_158216 ) ( CLEAR ?auto_158213 ) ( LIFTING ?auto_158215 ?auto_158214 ) ( IS-CRATE ?auto_158214 ) ( not ( = ?auto_158213 ?auto_158214 ) ) ( ON ?auto_158208 ?auto_158207 ) ( ON ?auto_158209 ?auto_158208 ) ( ON ?auto_158211 ?auto_158209 ) ( ON ?auto_158210 ?auto_158211 ) ( ON ?auto_158212 ?auto_158210 ) ( ON ?auto_158213 ?auto_158212 ) ( not ( = ?auto_158207 ?auto_158208 ) ) ( not ( = ?auto_158207 ?auto_158209 ) ) ( not ( = ?auto_158207 ?auto_158211 ) ) ( not ( = ?auto_158207 ?auto_158210 ) ) ( not ( = ?auto_158207 ?auto_158212 ) ) ( not ( = ?auto_158207 ?auto_158213 ) ) ( not ( = ?auto_158207 ?auto_158214 ) ) ( not ( = ?auto_158208 ?auto_158209 ) ) ( not ( = ?auto_158208 ?auto_158211 ) ) ( not ( = ?auto_158208 ?auto_158210 ) ) ( not ( = ?auto_158208 ?auto_158212 ) ) ( not ( = ?auto_158208 ?auto_158213 ) ) ( not ( = ?auto_158208 ?auto_158214 ) ) ( not ( = ?auto_158209 ?auto_158211 ) ) ( not ( = ?auto_158209 ?auto_158210 ) ) ( not ( = ?auto_158209 ?auto_158212 ) ) ( not ( = ?auto_158209 ?auto_158213 ) ) ( not ( = ?auto_158209 ?auto_158214 ) ) ( not ( = ?auto_158211 ?auto_158210 ) ) ( not ( = ?auto_158211 ?auto_158212 ) ) ( not ( = ?auto_158211 ?auto_158213 ) ) ( not ( = ?auto_158211 ?auto_158214 ) ) ( not ( = ?auto_158210 ?auto_158212 ) ) ( not ( = ?auto_158210 ?auto_158213 ) ) ( not ( = ?auto_158210 ?auto_158214 ) ) ( not ( = ?auto_158212 ?auto_158213 ) ) ( not ( = ?auto_158212 ?auto_158214 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_158213 ?auto_158214 )
      ( MAKE-7CRATE-VERIFY ?auto_158207 ?auto_158208 ?auto_158209 ?auto_158211 ?auto_158210 ?auto_158212 ?auto_158213 ?auto_158214 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158262 - SURFACE
      ?auto_158263 - SURFACE
      ?auto_158264 - SURFACE
      ?auto_158266 - SURFACE
      ?auto_158265 - SURFACE
      ?auto_158267 - SURFACE
      ?auto_158268 - SURFACE
      ?auto_158269 - SURFACE
    )
    :vars
    (
      ?auto_158272 - HOIST
      ?auto_158270 - PLACE
      ?auto_158271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158272 ?auto_158270 ) ( SURFACE-AT ?auto_158268 ?auto_158270 ) ( CLEAR ?auto_158268 ) ( IS-CRATE ?auto_158269 ) ( not ( = ?auto_158268 ?auto_158269 ) ) ( TRUCK-AT ?auto_158271 ?auto_158270 ) ( AVAILABLE ?auto_158272 ) ( IN ?auto_158269 ?auto_158271 ) ( ON ?auto_158268 ?auto_158267 ) ( not ( = ?auto_158267 ?auto_158268 ) ) ( not ( = ?auto_158267 ?auto_158269 ) ) ( ON ?auto_158263 ?auto_158262 ) ( ON ?auto_158264 ?auto_158263 ) ( ON ?auto_158266 ?auto_158264 ) ( ON ?auto_158265 ?auto_158266 ) ( ON ?auto_158267 ?auto_158265 ) ( not ( = ?auto_158262 ?auto_158263 ) ) ( not ( = ?auto_158262 ?auto_158264 ) ) ( not ( = ?auto_158262 ?auto_158266 ) ) ( not ( = ?auto_158262 ?auto_158265 ) ) ( not ( = ?auto_158262 ?auto_158267 ) ) ( not ( = ?auto_158262 ?auto_158268 ) ) ( not ( = ?auto_158262 ?auto_158269 ) ) ( not ( = ?auto_158263 ?auto_158264 ) ) ( not ( = ?auto_158263 ?auto_158266 ) ) ( not ( = ?auto_158263 ?auto_158265 ) ) ( not ( = ?auto_158263 ?auto_158267 ) ) ( not ( = ?auto_158263 ?auto_158268 ) ) ( not ( = ?auto_158263 ?auto_158269 ) ) ( not ( = ?auto_158264 ?auto_158266 ) ) ( not ( = ?auto_158264 ?auto_158265 ) ) ( not ( = ?auto_158264 ?auto_158267 ) ) ( not ( = ?auto_158264 ?auto_158268 ) ) ( not ( = ?auto_158264 ?auto_158269 ) ) ( not ( = ?auto_158266 ?auto_158265 ) ) ( not ( = ?auto_158266 ?auto_158267 ) ) ( not ( = ?auto_158266 ?auto_158268 ) ) ( not ( = ?auto_158266 ?auto_158269 ) ) ( not ( = ?auto_158265 ?auto_158267 ) ) ( not ( = ?auto_158265 ?auto_158268 ) ) ( not ( = ?auto_158265 ?auto_158269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158267 ?auto_158268 ?auto_158269 )
      ( MAKE-7CRATE-VERIFY ?auto_158262 ?auto_158263 ?auto_158264 ?auto_158266 ?auto_158265 ?auto_158267 ?auto_158268 ?auto_158269 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158325 - SURFACE
      ?auto_158326 - SURFACE
      ?auto_158327 - SURFACE
      ?auto_158329 - SURFACE
      ?auto_158328 - SURFACE
      ?auto_158330 - SURFACE
      ?auto_158331 - SURFACE
      ?auto_158332 - SURFACE
    )
    :vars
    (
      ?auto_158334 - HOIST
      ?auto_158336 - PLACE
      ?auto_158335 - TRUCK
      ?auto_158333 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_158334 ?auto_158336 ) ( SURFACE-AT ?auto_158331 ?auto_158336 ) ( CLEAR ?auto_158331 ) ( IS-CRATE ?auto_158332 ) ( not ( = ?auto_158331 ?auto_158332 ) ) ( AVAILABLE ?auto_158334 ) ( IN ?auto_158332 ?auto_158335 ) ( ON ?auto_158331 ?auto_158330 ) ( not ( = ?auto_158330 ?auto_158331 ) ) ( not ( = ?auto_158330 ?auto_158332 ) ) ( TRUCK-AT ?auto_158335 ?auto_158333 ) ( not ( = ?auto_158333 ?auto_158336 ) ) ( ON ?auto_158326 ?auto_158325 ) ( ON ?auto_158327 ?auto_158326 ) ( ON ?auto_158329 ?auto_158327 ) ( ON ?auto_158328 ?auto_158329 ) ( ON ?auto_158330 ?auto_158328 ) ( not ( = ?auto_158325 ?auto_158326 ) ) ( not ( = ?auto_158325 ?auto_158327 ) ) ( not ( = ?auto_158325 ?auto_158329 ) ) ( not ( = ?auto_158325 ?auto_158328 ) ) ( not ( = ?auto_158325 ?auto_158330 ) ) ( not ( = ?auto_158325 ?auto_158331 ) ) ( not ( = ?auto_158325 ?auto_158332 ) ) ( not ( = ?auto_158326 ?auto_158327 ) ) ( not ( = ?auto_158326 ?auto_158329 ) ) ( not ( = ?auto_158326 ?auto_158328 ) ) ( not ( = ?auto_158326 ?auto_158330 ) ) ( not ( = ?auto_158326 ?auto_158331 ) ) ( not ( = ?auto_158326 ?auto_158332 ) ) ( not ( = ?auto_158327 ?auto_158329 ) ) ( not ( = ?auto_158327 ?auto_158328 ) ) ( not ( = ?auto_158327 ?auto_158330 ) ) ( not ( = ?auto_158327 ?auto_158331 ) ) ( not ( = ?auto_158327 ?auto_158332 ) ) ( not ( = ?auto_158329 ?auto_158328 ) ) ( not ( = ?auto_158329 ?auto_158330 ) ) ( not ( = ?auto_158329 ?auto_158331 ) ) ( not ( = ?auto_158329 ?auto_158332 ) ) ( not ( = ?auto_158328 ?auto_158330 ) ) ( not ( = ?auto_158328 ?auto_158331 ) ) ( not ( = ?auto_158328 ?auto_158332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158330 ?auto_158331 ?auto_158332 )
      ( MAKE-7CRATE-VERIFY ?auto_158325 ?auto_158326 ?auto_158327 ?auto_158329 ?auto_158328 ?auto_158330 ?auto_158331 ?auto_158332 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158395 - SURFACE
      ?auto_158396 - SURFACE
      ?auto_158397 - SURFACE
      ?auto_158399 - SURFACE
      ?auto_158398 - SURFACE
      ?auto_158400 - SURFACE
      ?auto_158401 - SURFACE
      ?auto_158402 - SURFACE
    )
    :vars
    (
      ?auto_158404 - HOIST
      ?auto_158405 - PLACE
      ?auto_158403 - TRUCK
      ?auto_158406 - PLACE
      ?auto_158407 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_158404 ?auto_158405 ) ( SURFACE-AT ?auto_158401 ?auto_158405 ) ( CLEAR ?auto_158401 ) ( IS-CRATE ?auto_158402 ) ( not ( = ?auto_158401 ?auto_158402 ) ) ( AVAILABLE ?auto_158404 ) ( ON ?auto_158401 ?auto_158400 ) ( not ( = ?auto_158400 ?auto_158401 ) ) ( not ( = ?auto_158400 ?auto_158402 ) ) ( TRUCK-AT ?auto_158403 ?auto_158406 ) ( not ( = ?auto_158406 ?auto_158405 ) ) ( HOIST-AT ?auto_158407 ?auto_158406 ) ( LIFTING ?auto_158407 ?auto_158402 ) ( not ( = ?auto_158404 ?auto_158407 ) ) ( ON ?auto_158396 ?auto_158395 ) ( ON ?auto_158397 ?auto_158396 ) ( ON ?auto_158399 ?auto_158397 ) ( ON ?auto_158398 ?auto_158399 ) ( ON ?auto_158400 ?auto_158398 ) ( not ( = ?auto_158395 ?auto_158396 ) ) ( not ( = ?auto_158395 ?auto_158397 ) ) ( not ( = ?auto_158395 ?auto_158399 ) ) ( not ( = ?auto_158395 ?auto_158398 ) ) ( not ( = ?auto_158395 ?auto_158400 ) ) ( not ( = ?auto_158395 ?auto_158401 ) ) ( not ( = ?auto_158395 ?auto_158402 ) ) ( not ( = ?auto_158396 ?auto_158397 ) ) ( not ( = ?auto_158396 ?auto_158399 ) ) ( not ( = ?auto_158396 ?auto_158398 ) ) ( not ( = ?auto_158396 ?auto_158400 ) ) ( not ( = ?auto_158396 ?auto_158401 ) ) ( not ( = ?auto_158396 ?auto_158402 ) ) ( not ( = ?auto_158397 ?auto_158399 ) ) ( not ( = ?auto_158397 ?auto_158398 ) ) ( not ( = ?auto_158397 ?auto_158400 ) ) ( not ( = ?auto_158397 ?auto_158401 ) ) ( not ( = ?auto_158397 ?auto_158402 ) ) ( not ( = ?auto_158399 ?auto_158398 ) ) ( not ( = ?auto_158399 ?auto_158400 ) ) ( not ( = ?auto_158399 ?auto_158401 ) ) ( not ( = ?auto_158399 ?auto_158402 ) ) ( not ( = ?auto_158398 ?auto_158400 ) ) ( not ( = ?auto_158398 ?auto_158401 ) ) ( not ( = ?auto_158398 ?auto_158402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158400 ?auto_158401 ?auto_158402 )
      ( MAKE-7CRATE-VERIFY ?auto_158395 ?auto_158396 ?auto_158397 ?auto_158399 ?auto_158398 ?auto_158400 ?auto_158401 ?auto_158402 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158472 - SURFACE
      ?auto_158473 - SURFACE
      ?auto_158474 - SURFACE
      ?auto_158476 - SURFACE
      ?auto_158475 - SURFACE
      ?auto_158477 - SURFACE
      ?auto_158478 - SURFACE
      ?auto_158479 - SURFACE
    )
    :vars
    (
      ?auto_158482 - HOIST
      ?auto_158481 - PLACE
      ?auto_158483 - TRUCK
      ?auto_158484 - PLACE
      ?auto_158485 - HOIST
      ?auto_158480 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_158482 ?auto_158481 ) ( SURFACE-AT ?auto_158478 ?auto_158481 ) ( CLEAR ?auto_158478 ) ( IS-CRATE ?auto_158479 ) ( not ( = ?auto_158478 ?auto_158479 ) ) ( AVAILABLE ?auto_158482 ) ( ON ?auto_158478 ?auto_158477 ) ( not ( = ?auto_158477 ?auto_158478 ) ) ( not ( = ?auto_158477 ?auto_158479 ) ) ( TRUCK-AT ?auto_158483 ?auto_158484 ) ( not ( = ?auto_158484 ?auto_158481 ) ) ( HOIST-AT ?auto_158485 ?auto_158484 ) ( not ( = ?auto_158482 ?auto_158485 ) ) ( AVAILABLE ?auto_158485 ) ( SURFACE-AT ?auto_158479 ?auto_158484 ) ( ON ?auto_158479 ?auto_158480 ) ( CLEAR ?auto_158479 ) ( not ( = ?auto_158478 ?auto_158480 ) ) ( not ( = ?auto_158479 ?auto_158480 ) ) ( not ( = ?auto_158477 ?auto_158480 ) ) ( ON ?auto_158473 ?auto_158472 ) ( ON ?auto_158474 ?auto_158473 ) ( ON ?auto_158476 ?auto_158474 ) ( ON ?auto_158475 ?auto_158476 ) ( ON ?auto_158477 ?auto_158475 ) ( not ( = ?auto_158472 ?auto_158473 ) ) ( not ( = ?auto_158472 ?auto_158474 ) ) ( not ( = ?auto_158472 ?auto_158476 ) ) ( not ( = ?auto_158472 ?auto_158475 ) ) ( not ( = ?auto_158472 ?auto_158477 ) ) ( not ( = ?auto_158472 ?auto_158478 ) ) ( not ( = ?auto_158472 ?auto_158479 ) ) ( not ( = ?auto_158472 ?auto_158480 ) ) ( not ( = ?auto_158473 ?auto_158474 ) ) ( not ( = ?auto_158473 ?auto_158476 ) ) ( not ( = ?auto_158473 ?auto_158475 ) ) ( not ( = ?auto_158473 ?auto_158477 ) ) ( not ( = ?auto_158473 ?auto_158478 ) ) ( not ( = ?auto_158473 ?auto_158479 ) ) ( not ( = ?auto_158473 ?auto_158480 ) ) ( not ( = ?auto_158474 ?auto_158476 ) ) ( not ( = ?auto_158474 ?auto_158475 ) ) ( not ( = ?auto_158474 ?auto_158477 ) ) ( not ( = ?auto_158474 ?auto_158478 ) ) ( not ( = ?auto_158474 ?auto_158479 ) ) ( not ( = ?auto_158474 ?auto_158480 ) ) ( not ( = ?auto_158476 ?auto_158475 ) ) ( not ( = ?auto_158476 ?auto_158477 ) ) ( not ( = ?auto_158476 ?auto_158478 ) ) ( not ( = ?auto_158476 ?auto_158479 ) ) ( not ( = ?auto_158476 ?auto_158480 ) ) ( not ( = ?auto_158475 ?auto_158477 ) ) ( not ( = ?auto_158475 ?auto_158478 ) ) ( not ( = ?auto_158475 ?auto_158479 ) ) ( not ( = ?auto_158475 ?auto_158480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158477 ?auto_158478 ?auto_158479 )
      ( MAKE-7CRATE-VERIFY ?auto_158472 ?auto_158473 ?auto_158474 ?auto_158476 ?auto_158475 ?auto_158477 ?auto_158478 ?auto_158479 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158550 - SURFACE
      ?auto_158551 - SURFACE
      ?auto_158552 - SURFACE
      ?auto_158554 - SURFACE
      ?auto_158553 - SURFACE
      ?auto_158555 - SURFACE
      ?auto_158556 - SURFACE
      ?auto_158557 - SURFACE
    )
    :vars
    (
      ?auto_158558 - HOIST
      ?auto_158559 - PLACE
      ?auto_158560 - PLACE
      ?auto_158563 - HOIST
      ?auto_158561 - SURFACE
      ?auto_158562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158558 ?auto_158559 ) ( SURFACE-AT ?auto_158556 ?auto_158559 ) ( CLEAR ?auto_158556 ) ( IS-CRATE ?auto_158557 ) ( not ( = ?auto_158556 ?auto_158557 ) ) ( AVAILABLE ?auto_158558 ) ( ON ?auto_158556 ?auto_158555 ) ( not ( = ?auto_158555 ?auto_158556 ) ) ( not ( = ?auto_158555 ?auto_158557 ) ) ( not ( = ?auto_158560 ?auto_158559 ) ) ( HOIST-AT ?auto_158563 ?auto_158560 ) ( not ( = ?auto_158558 ?auto_158563 ) ) ( AVAILABLE ?auto_158563 ) ( SURFACE-AT ?auto_158557 ?auto_158560 ) ( ON ?auto_158557 ?auto_158561 ) ( CLEAR ?auto_158557 ) ( not ( = ?auto_158556 ?auto_158561 ) ) ( not ( = ?auto_158557 ?auto_158561 ) ) ( not ( = ?auto_158555 ?auto_158561 ) ) ( TRUCK-AT ?auto_158562 ?auto_158559 ) ( ON ?auto_158551 ?auto_158550 ) ( ON ?auto_158552 ?auto_158551 ) ( ON ?auto_158554 ?auto_158552 ) ( ON ?auto_158553 ?auto_158554 ) ( ON ?auto_158555 ?auto_158553 ) ( not ( = ?auto_158550 ?auto_158551 ) ) ( not ( = ?auto_158550 ?auto_158552 ) ) ( not ( = ?auto_158550 ?auto_158554 ) ) ( not ( = ?auto_158550 ?auto_158553 ) ) ( not ( = ?auto_158550 ?auto_158555 ) ) ( not ( = ?auto_158550 ?auto_158556 ) ) ( not ( = ?auto_158550 ?auto_158557 ) ) ( not ( = ?auto_158550 ?auto_158561 ) ) ( not ( = ?auto_158551 ?auto_158552 ) ) ( not ( = ?auto_158551 ?auto_158554 ) ) ( not ( = ?auto_158551 ?auto_158553 ) ) ( not ( = ?auto_158551 ?auto_158555 ) ) ( not ( = ?auto_158551 ?auto_158556 ) ) ( not ( = ?auto_158551 ?auto_158557 ) ) ( not ( = ?auto_158551 ?auto_158561 ) ) ( not ( = ?auto_158552 ?auto_158554 ) ) ( not ( = ?auto_158552 ?auto_158553 ) ) ( not ( = ?auto_158552 ?auto_158555 ) ) ( not ( = ?auto_158552 ?auto_158556 ) ) ( not ( = ?auto_158552 ?auto_158557 ) ) ( not ( = ?auto_158552 ?auto_158561 ) ) ( not ( = ?auto_158554 ?auto_158553 ) ) ( not ( = ?auto_158554 ?auto_158555 ) ) ( not ( = ?auto_158554 ?auto_158556 ) ) ( not ( = ?auto_158554 ?auto_158557 ) ) ( not ( = ?auto_158554 ?auto_158561 ) ) ( not ( = ?auto_158553 ?auto_158555 ) ) ( not ( = ?auto_158553 ?auto_158556 ) ) ( not ( = ?auto_158553 ?auto_158557 ) ) ( not ( = ?auto_158553 ?auto_158561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158555 ?auto_158556 ?auto_158557 )
      ( MAKE-7CRATE-VERIFY ?auto_158550 ?auto_158551 ?auto_158552 ?auto_158554 ?auto_158553 ?auto_158555 ?auto_158556 ?auto_158557 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158628 - SURFACE
      ?auto_158629 - SURFACE
      ?auto_158630 - SURFACE
      ?auto_158632 - SURFACE
      ?auto_158631 - SURFACE
      ?auto_158633 - SURFACE
      ?auto_158634 - SURFACE
      ?auto_158635 - SURFACE
    )
    :vars
    (
      ?auto_158638 - HOIST
      ?auto_158637 - PLACE
      ?auto_158636 - PLACE
      ?auto_158641 - HOIST
      ?auto_158640 - SURFACE
      ?auto_158639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158638 ?auto_158637 ) ( IS-CRATE ?auto_158635 ) ( not ( = ?auto_158634 ?auto_158635 ) ) ( not ( = ?auto_158633 ?auto_158634 ) ) ( not ( = ?auto_158633 ?auto_158635 ) ) ( not ( = ?auto_158636 ?auto_158637 ) ) ( HOIST-AT ?auto_158641 ?auto_158636 ) ( not ( = ?auto_158638 ?auto_158641 ) ) ( AVAILABLE ?auto_158641 ) ( SURFACE-AT ?auto_158635 ?auto_158636 ) ( ON ?auto_158635 ?auto_158640 ) ( CLEAR ?auto_158635 ) ( not ( = ?auto_158634 ?auto_158640 ) ) ( not ( = ?auto_158635 ?auto_158640 ) ) ( not ( = ?auto_158633 ?auto_158640 ) ) ( TRUCK-AT ?auto_158639 ?auto_158637 ) ( SURFACE-AT ?auto_158633 ?auto_158637 ) ( CLEAR ?auto_158633 ) ( LIFTING ?auto_158638 ?auto_158634 ) ( IS-CRATE ?auto_158634 ) ( ON ?auto_158629 ?auto_158628 ) ( ON ?auto_158630 ?auto_158629 ) ( ON ?auto_158632 ?auto_158630 ) ( ON ?auto_158631 ?auto_158632 ) ( ON ?auto_158633 ?auto_158631 ) ( not ( = ?auto_158628 ?auto_158629 ) ) ( not ( = ?auto_158628 ?auto_158630 ) ) ( not ( = ?auto_158628 ?auto_158632 ) ) ( not ( = ?auto_158628 ?auto_158631 ) ) ( not ( = ?auto_158628 ?auto_158633 ) ) ( not ( = ?auto_158628 ?auto_158634 ) ) ( not ( = ?auto_158628 ?auto_158635 ) ) ( not ( = ?auto_158628 ?auto_158640 ) ) ( not ( = ?auto_158629 ?auto_158630 ) ) ( not ( = ?auto_158629 ?auto_158632 ) ) ( not ( = ?auto_158629 ?auto_158631 ) ) ( not ( = ?auto_158629 ?auto_158633 ) ) ( not ( = ?auto_158629 ?auto_158634 ) ) ( not ( = ?auto_158629 ?auto_158635 ) ) ( not ( = ?auto_158629 ?auto_158640 ) ) ( not ( = ?auto_158630 ?auto_158632 ) ) ( not ( = ?auto_158630 ?auto_158631 ) ) ( not ( = ?auto_158630 ?auto_158633 ) ) ( not ( = ?auto_158630 ?auto_158634 ) ) ( not ( = ?auto_158630 ?auto_158635 ) ) ( not ( = ?auto_158630 ?auto_158640 ) ) ( not ( = ?auto_158632 ?auto_158631 ) ) ( not ( = ?auto_158632 ?auto_158633 ) ) ( not ( = ?auto_158632 ?auto_158634 ) ) ( not ( = ?auto_158632 ?auto_158635 ) ) ( not ( = ?auto_158632 ?auto_158640 ) ) ( not ( = ?auto_158631 ?auto_158633 ) ) ( not ( = ?auto_158631 ?auto_158634 ) ) ( not ( = ?auto_158631 ?auto_158635 ) ) ( not ( = ?auto_158631 ?auto_158640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158633 ?auto_158634 ?auto_158635 )
      ( MAKE-7CRATE-VERIFY ?auto_158628 ?auto_158629 ?auto_158630 ?auto_158632 ?auto_158631 ?auto_158633 ?auto_158634 ?auto_158635 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_158706 - SURFACE
      ?auto_158707 - SURFACE
      ?auto_158708 - SURFACE
      ?auto_158710 - SURFACE
      ?auto_158709 - SURFACE
      ?auto_158711 - SURFACE
      ?auto_158712 - SURFACE
      ?auto_158713 - SURFACE
    )
    :vars
    (
      ?auto_158715 - HOIST
      ?auto_158716 - PLACE
      ?auto_158718 - PLACE
      ?auto_158714 - HOIST
      ?auto_158719 - SURFACE
      ?auto_158717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_158715 ?auto_158716 ) ( IS-CRATE ?auto_158713 ) ( not ( = ?auto_158712 ?auto_158713 ) ) ( not ( = ?auto_158711 ?auto_158712 ) ) ( not ( = ?auto_158711 ?auto_158713 ) ) ( not ( = ?auto_158718 ?auto_158716 ) ) ( HOIST-AT ?auto_158714 ?auto_158718 ) ( not ( = ?auto_158715 ?auto_158714 ) ) ( AVAILABLE ?auto_158714 ) ( SURFACE-AT ?auto_158713 ?auto_158718 ) ( ON ?auto_158713 ?auto_158719 ) ( CLEAR ?auto_158713 ) ( not ( = ?auto_158712 ?auto_158719 ) ) ( not ( = ?auto_158713 ?auto_158719 ) ) ( not ( = ?auto_158711 ?auto_158719 ) ) ( TRUCK-AT ?auto_158717 ?auto_158716 ) ( SURFACE-AT ?auto_158711 ?auto_158716 ) ( CLEAR ?auto_158711 ) ( IS-CRATE ?auto_158712 ) ( AVAILABLE ?auto_158715 ) ( IN ?auto_158712 ?auto_158717 ) ( ON ?auto_158707 ?auto_158706 ) ( ON ?auto_158708 ?auto_158707 ) ( ON ?auto_158710 ?auto_158708 ) ( ON ?auto_158709 ?auto_158710 ) ( ON ?auto_158711 ?auto_158709 ) ( not ( = ?auto_158706 ?auto_158707 ) ) ( not ( = ?auto_158706 ?auto_158708 ) ) ( not ( = ?auto_158706 ?auto_158710 ) ) ( not ( = ?auto_158706 ?auto_158709 ) ) ( not ( = ?auto_158706 ?auto_158711 ) ) ( not ( = ?auto_158706 ?auto_158712 ) ) ( not ( = ?auto_158706 ?auto_158713 ) ) ( not ( = ?auto_158706 ?auto_158719 ) ) ( not ( = ?auto_158707 ?auto_158708 ) ) ( not ( = ?auto_158707 ?auto_158710 ) ) ( not ( = ?auto_158707 ?auto_158709 ) ) ( not ( = ?auto_158707 ?auto_158711 ) ) ( not ( = ?auto_158707 ?auto_158712 ) ) ( not ( = ?auto_158707 ?auto_158713 ) ) ( not ( = ?auto_158707 ?auto_158719 ) ) ( not ( = ?auto_158708 ?auto_158710 ) ) ( not ( = ?auto_158708 ?auto_158709 ) ) ( not ( = ?auto_158708 ?auto_158711 ) ) ( not ( = ?auto_158708 ?auto_158712 ) ) ( not ( = ?auto_158708 ?auto_158713 ) ) ( not ( = ?auto_158708 ?auto_158719 ) ) ( not ( = ?auto_158710 ?auto_158709 ) ) ( not ( = ?auto_158710 ?auto_158711 ) ) ( not ( = ?auto_158710 ?auto_158712 ) ) ( not ( = ?auto_158710 ?auto_158713 ) ) ( not ( = ?auto_158710 ?auto_158719 ) ) ( not ( = ?auto_158709 ?auto_158711 ) ) ( not ( = ?auto_158709 ?auto_158712 ) ) ( not ( = ?auto_158709 ?auto_158713 ) ) ( not ( = ?auto_158709 ?auto_158719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_158711 ?auto_158712 ?auto_158713 )
      ( MAKE-7CRATE-VERIFY ?auto_158706 ?auto_158707 ?auto_158708 ?auto_158710 ?auto_158709 ?auto_158711 ?auto_158712 ?auto_158713 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161617 - SURFACE
      ?auto_161618 - SURFACE
      ?auto_161619 - SURFACE
      ?auto_161621 - SURFACE
      ?auto_161620 - SURFACE
      ?auto_161622 - SURFACE
      ?auto_161623 - SURFACE
      ?auto_161624 - SURFACE
      ?auto_161625 - SURFACE
    )
    :vars
    (
      ?auto_161627 - HOIST
      ?auto_161626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_161627 ?auto_161626 ) ( SURFACE-AT ?auto_161624 ?auto_161626 ) ( CLEAR ?auto_161624 ) ( LIFTING ?auto_161627 ?auto_161625 ) ( IS-CRATE ?auto_161625 ) ( not ( = ?auto_161624 ?auto_161625 ) ) ( ON ?auto_161618 ?auto_161617 ) ( ON ?auto_161619 ?auto_161618 ) ( ON ?auto_161621 ?auto_161619 ) ( ON ?auto_161620 ?auto_161621 ) ( ON ?auto_161622 ?auto_161620 ) ( ON ?auto_161623 ?auto_161622 ) ( ON ?auto_161624 ?auto_161623 ) ( not ( = ?auto_161617 ?auto_161618 ) ) ( not ( = ?auto_161617 ?auto_161619 ) ) ( not ( = ?auto_161617 ?auto_161621 ) ) ( not ( = ?auto_161617 ?auto_161620 ) ) ( not ( = ?auto_161617 ?auto_161622 ) ) ( not ( = ?auto_161617 ?auto_161623 ) ) ( not ( = ?auto_161617 ?auto_161624 ) ) ( not ( = ?auto_161617 ?auto_161625 ) ) ( not ( = ?auto_161618 ?auto_161619 ) ) ( not ( = ?auto_161618 ?auto_161621 ) ) ( not ( = ?auto_161618 ?auto_161620 ) ) ( not ( = ?auto_161618 ?auto_161622 ) ) ( not ( = ?auto_161618 ?auto_161623 ) ) ( not ( = ?auto_161618 ?auto_161624 ) ) ( not ( = ?auto_161618 ?auto_161625 ) ) ( not ( = ?auto_161619 ?auto_161621 ) ) ( not ( = ?auto_161619 ?auto_161620 ) ) ( not ( = ?auto_161619 ?auto_161622 ) ) ( not ( = ?auto_161619 ?auto_161623 ) ) ( not ( = ?auto_161619 ?auto_161624 ) ) ( not ( = ?auto_161619 ?auto_161625 ) ) ( not ( = ?auto_161621 ?auto_161620 ) ) ( not ( = ?auto_161621 ?auto_161622 ) ) ( not ( = ?auto_161621 ?auto_161623 ) ) ( not ( = ?auto_161621 ?auto_161624 ) ) ( not ( = ?auto_161621 ?auto_161625 ) ) ( not ( = ?auto_161620 ?auto_161622 ) ) ( not ( = ?auto_161620 ?auto_161623 ) ) ( not ( = ?auto_161620 ?auto_161624 ) ) ( not ( = ?auto_161620 ?auto_161625 ) ) ( not ( = ?auto_161622 ?auto_161623 ) ) ( not ( = ?auto_161622 ?auto_161624 ) ) ( not ( = ?auto_161622 ?auto_161625 ) ) ( not ( = ?auto_161623 ?auto_161624 ) ) ( not ( = ?auto_161623 ?auto_161625 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_161624 ?auto_161625 )
      ( MAKE-8CRATE-VERIFY ?auto_161617 ?auto_161618 ?auto_161619 ?auto_161621 ?auto_161620 ?auto_161622 ?auto_161623 ?auto_161624 ?auto_161625 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161684 - SURFACE
      ?auto_161685 - SURFACE
      ?auto_161686 - SURFACE
      ?auto_161688 - SURFACE
      ?auto_161687 - SURFACE
      ?auto_161689 - SURFACE
      ?auto_161690 - SURFACE
      ?auto_161691 - SURFACE
      ?auto_161692 - SURFACE
    )
    :vars
    (
      ?auto_161695 - HOIST
      ?auto_161694 - PLACE
      ?auto_161693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_161695 ?auto_161694 ) ( SURFACE-AT ?auto_161691 ?auto_161694 ) ( CLEAR ?auto_161691 ) ( IS-CRATE ?auto_161692 ) ( not ( = ?auto_161691 ?auto_161692 ) ) ( TRUCK-AT ?auto_161693 ?auto_161694 ) ( AVAILABLE ?auto_161695 ) ( IN ?auto_161692 ?auto_161693 ) ( ON ?auto_161691 ?auto_161690 ) ( not ( = ?auto_161690 ?auto_161691 ) ) ( not ( = ?auto_161690 ?auto_161692 ) ) ( ON ?auto_161685 ?auto_161684 ) ( ON ?auto_161686 ?auto_161685 ) ( ON ?auto_161688 ?auto_161686 ) ( ON ?auto_161687 ?auto_161688 ) ( ON ?auto_161689 ?auto_161687 ) ( ON ?auto_161690 ?auto_161689 ) ( not ( = ?auto_161684 ?auto_161685 ) ) ( not ( = ?auto_161684 ?auto_161686 ) ) ( not ( = ?auto_161684 ?auto_161688 ) ) ( not ( = ?auto_161684 ?auto_161687 ) ) ( not ( = ?auto_161684 ?auto_161689 ) ) ( not ( = ?auto_161684 ?auto_161690 ) ) ( not ( = ?auto_161684 ?auto_161691 ) ) ( not ( = ?auto_161684 ?auto_161692 ) ) ( not ( = ?auto_161685 ?auto_161686 ) ) ( not ( = ?auto_161685 ?auto_161688 ) ) ( not ( = ?auto_161685 ?auto_161687 ) ) ( not ( = ?auto_161685 ?auto_161689 ) ) ( not ( = ?auto_161685 ?auto_161690 ) ) ( not ( = ?auto_161685 ?auto_161691 ) ) ( not ( = ?auto_161685 ?auto_161692 ) ) ( not ( = ?auto_161686 ?auto_161688 ) ) ( not ( = ?auto_161686 ?auto_161687 ) ) ( not ( = ?auto_161686 ?auto_161689 ) ) ( not ( = ?auto_161686 ?auto_161690 ) ) ( not ( = ?auto_161686 ?auto_161691 ) ) ( not ( = ?auto_161686 ?auto_161692 ) ) ( not ( = ?auto_161688 ?auto_161687 ) ) ( not ( = ?auto_161688 ?auto_161689 ) ) ( not ( = ?auto_161688 ?auto_161690 ) ) ( not ( = ?auto_161688 ?auto_161691 ) ) ( not ( = ?auto_161688 ?auto_161692 ) ) ( not ( = ?auto_161687 ?auto_161689 ) ) ( not ( = ?auto_161687 ?auto_161690 ) ) ( not ( = ?auto_161687 ?auto_161691 ) ) ( not ( = ?auto_161687 ?auto_161692 ) ) ( not ( = ?auto_161689 ?auto_161690 ) ) ( not ( = ?auto_161689 ?auto_161691 ) ) ( not ( = ?auto_161689 ?auto_161692 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_161690 ?auto_161691 ?auto_161692 )
      ( MAKE-8CRATE-VERIFY ?auto_161684 ?auto_161685 ?auto_161686 ?auto_161688 ?auto_161687 ?auto_161689 ?auto_161690 ?auto_161691 ?auto_161692 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161760 - SURFACE
      ?auto_161761 - SURFACE
      ?auto_161762 - SURFACE
      ?auto_161764 - SURFACE
      ?auto_161763 - SURFACE
      ?auto_161765 - SURFACE
      ?auto_161766 - SURFACE
      ?auto_161767 - SURFACE
      ?auto_161768 - SURFACE
    )
    :vars
    (
      ?auto_161771 - HOIST
      ?auto_161769 - PLACE
      ?auto_161772 - TRUCK
      ?auto_161770 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_161771 ?auto_161769 ) ( SURFACE-AT ?auto_161767 ?auto_161769 ) ( CLEAR ?auto_161767 ) ( IS-CRATE ?auto_161768 ) ( not ( = ?auto_161767 ?auto_161768 ) ) ( AVAILABLE ?auto_161771 ) ( IN ?auto_161768 ?auto_161772 ) ( ON ?auto_161767 ?auto_161766 ) ( not ( = ?auto_161766 ?auto_161767 ) ) ( not ( = ?auto_161766 ?auto_161768 ) ) ( TRUCK-AT ?auto_161772 ?auto_161770 ) ( not ( = ?auto_161770 ?auto_161769 ) ) ( ON ?auto_161761 ?auto_161760 ) ( ON ?auto_161762 ?auto_161761 ) ( ON ?auto_161764 ?auto_161762 ) ( ON ?auto_161763 ?auto_161764 ) ( ON ?auto_161765 ?auto_161763 ) ( ON ?auto_161766 ?auto_161765 ) ( not ( = ?auto_161760 ?auto_161761 ) ) ( not ( = ?auto_161760 ?auto_161762 ) ) ( not ( = ?auto_161760 ?auto_161764 ) ) ( not ( = ?auto_161760 ?auto_161763 ) ) ( not ( = ?auto_161760 ?auto_161765 ) ) ( not ( = ?auto_161760 ?auto_161766 ) ) ( not ( = ?auto_161760 ?auto_161767 ) ) ( not ( = ?auto_161760 ?auto_161768 ) ) ( not ( = ?auto_161761 ?auto_161762 ) ) ( not ( = ?auto_161761 ?auto_161764 ) ) ( not ( = ?auto_161761 ?auto_161763 ) ) ( not ( = ?auto_161761 ?auto_161765 ) ) ( not ( = ?auto_161761 ?auto_161766 ) ) ( not ( = ?auto_161761 ?auto_161767 ) ) ( not ( = ?auto_161761 ?auto_161768 ) ) ( not ( = ?auto_161762 ?auto_161764 ) ) ( not ( = ?auto_161762 ?auto_161763 ) ) ( not ( = ?auto_161762 ?auto_161765 ) ) ( not ( = ?auto_161762 ?auto_161766 ) ) ( not ( = ?auto_161762 ?auto_161767 ) ) ( not ( = ?auto_161762 ?auto_161768 ) ) ( not ( = ?auto_161764 ?auto_161763 ) ) ( not ( = ?auto_161764 ?auto_161765 ) ) ( not ( = ?auto_161764 ?auto_161766 ) ) ( not ( = ?auto_161764 ?auto_161767 ) ) ( not ( = ?auto_161764 ?auto_161768 ) ) ( not ( = ?auto_161763 ?auto_161765 ) ) ( not ( = ?auto_161763 ?auto_161766 ) ) ( not ( = ?auto_161763 ?auto_161767 ) ) ( not ( = ?auto_161763 ?auto_161768 ) ) ( not ( = ?auto_161765 ?auto_161766 ) ) ( not ( = ?auto_161765 ?auto_161767 ) ) ( not ( = ?auto_161765 ?auto_161768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_161766 ?auto_161767 ?auto_161768 )
      ( MAKE-8CRATE-VERIFY ?auto_161760 ?auto_161761 ?auto_161762 ?auto_161764 ?auto_161763 ?auto_161765 ?auto_161766 ?auto_161767 ?auto_161768 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161844 - SURFACE
      ?auto_161845 - SURFACE
      ?auto_161846 - SURFACE
      ?auto_161848 - SURFACE
      ?auto_161847 - SURFACE
      ?auto_161849 - SURFACE
      ?auto_161850 - SURFACE
      ?auto_161851 - SURFACE
      ?auto_161852 - SURFACE
    )
    :vars
    (
      ?auto_161855 - HOIST
      ?auto_161856 - PLACE
      ?auto_161853 - TRUCK
      ?auto_161857 - PLACE
      ?auto_161854 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_161855 ?auto_161856 ) ( SURFACE-AT ?auto_161851 ?auto_161856 ) ( CLEAR ?auto_161851 ) ( IS-CRATE ?auto_161852 ) ( not ( = ?auto_161851 ?auto_161852 ) ) ( AVAILABLE ?auto_161855 ) ( ON ?auto_161851 ?auto_161850 ) ( not ( = ?auto_161850 ?auto_161851 ) ) ( not ( = ?auto_161850 ?auto_161852 ) ) ( TRUCK-AT ?auto_161853 ?auto_161857 ) ( not ( = ?auto_161857 ?auto_161856 ) ) ( HOIST-AT ?auto_161854 ?auto_161857 ) ( LIFTING ?auto_161854 ?auto_161852 ) ( not ( = ?auto_161855 ?auto_161854 ) ) ( ON ?auto_161845 ?auto_161844 ) ( ON ?auto_161846 ?auto_161845 ) ( ON ?auto_161848 ?auto_161846 ) ( ON ?auto_161847 ?auto_161848 ) ( ON ?auto_161849 ?auto_161847 ) ( ON ?auto_161850 ?auto_161849 ) ( not ( = ?auto_161844 ?auto_161845 ) ) ( not ( = ?auto_161844 ?auto_161846 ) ) ( not ( = ?auto_161844 ?auto_161848 ) ) ( not ( = ?auto_161844 ?auto_161847 ) ) ( not ( = ?auto_161844 ?auto_161849 ) ) ( not ( = ?auto_161844 ?auto_161850 ) ) ( not ( = ?auto_161844 ?auto_161851 ) ) ( not ( = ?auto_161844 ?auto_161852 ) ) ( not ( = ?auto_161845 ?auto_161846 ) ) ( not ( = ?auto_161845 ?auto_161848 ) ) ( not ( = ?auto_161845 ?auto_161847 ) ) ( not ( = ?auto_161845 ?auto_161849 ) ) ( not ( = ?auto_161845 ?auto_161850 ) ) ( not ( = ?auto_161845 ?auto_161851 ) ) ( not ( = ?auto_161845 ?auto_161852 ) ) ( not ( = ?auto_161846 ?auto_161848 ) ) ( not ( = ?auto_161846 ?auto_161847 ) ) ( not ( = ?auto_161846 ?auto_161849 ) ) ( not ( = ?auto_161846 ?auto_161850 ) ) ( not ( = ?auto_161846 ?auto_161851 ) ) ( not ( = ?auto_161846 ?auto_161852 ) ) ( not ( = ?auto_161848 ?auto_161847 ) ) ( not ( = ?auto_161848 ?auto_161849 ) ) ( not ( = ?auto_161848 ?auto_161850 ) ) ( not ( = ?auto_161848 ?auto_161851 ) ) ( not ( = ?auto_161848 ?auto_161852 ) ) ( not ( = ?auto_161847 ?auto_161849 ) ) ( not ( = ?auto_161847 ?auto_161850 ) ) ( not ( = ?auto_161847 ?auto_161851 ) ) ( not ( = ?auto_161847 ?auto_161852 ) ) ( not ( = ?auto_161849 ?auto_161850 ) ) ( not ( = ?auto_161849 ?auto_161851 ) ) ( not ( = ?auto_161849 ?auto_161852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_161850 ?auto_161851 ?auto_161852 )
      ( MAKE-8CRATE-VERIFY ?auto_161844 ?auto_161845 ?auto_161846 ?auto_161848 ?auto_161847 ?auto_161849 ?auto_161850 ?auto_161851 ?auto_161852 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_161936 - SURFACE
      ?auto_161937 - SURFACE
      ?auto_161938 - SURFACE
      ?auto_161940 - SURFACE
      ?auto_161939 - SURFACE
      ?auto_161941 - SURFACE
      ?auto_161942 - SURFACE
      ?auto_161943 - SURFACE
      ?auto_161944 - SURFACE
    )
    :vars
    (
      ?auto_161946 - HOIST
      ?auto_161949 - PLACE
      ?auto_161945 - TRUCK
      ?auto_161947 - PLACE
      ?auto_161948 - HOIST
      ?auto_161950 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_161946 ?auto_161949 ) ( SURFACE-AT ?auto_161943 ?auto_161949 ) ( CLEAR ?auto_161943 ) ( IS-CRATE ?auto_161944 ) ( not ( = ?auto_161943 ?auto_161944 ) ) ( AVAILABLE ?auto_161946 ) ( ON ?auto_161943 ?auto_161942 ) ( not ( = ?auto_161942 ?auto_161943 ) ) ( not ( = ?auto_161942 ?auto_161944 ) ) ( TRUCK-AT ?auto_161945 ?auto_161947 ) ( not ( = ?auto_161947 ?auto_161949 ) ) ( HOIST-AT ?auto_161948 ?auto_161947 ) ( not ( = ?auto_161946 ?auto_161948 ) ) ( AVAILABLE ?auto_161948 ) ( SURFACE-AT ?auto_161944 ?auto_161947 ) ( ON ?auto_161944 ?auto_161950 ) ( CLEAR ?auto_161944 ) ( not ( = ?auto_161943 ?auto_161950 ) ) ( not ( = ?auto_161944 ?auto_161950 ) ) ( not ( = ?auto_161942 ?auto_161950 ) ) ( ON ?auto_161937 ?auto_161936 ) ( ON ?auto_161938 ?auto_161937 ) ( ON ?auto_161940 ?auto_161938 ) ( ON ?auto_161939 ?auto_161940 ) ( ON ?auto_161941 ?auto_161939 ) ( ON ?auto_161942 ?auto_161941 ) ( not ( = ?auto_161936 ?auto_161937 ) ) ( not ( = ?auto_161936 ?auto_161938 ) ) ( not ( = ?auto_161936 ?auto_161940 ) ) ( not ( = ?auto_161936 ?auto_161939 ) ) ( not ( = ?auto_161936 ?auto_161941 ) ) ( not ( = ?auto_161936 ?auto_161942 ) ) ( not ( = ?auto_161936 ?auto_161943 ) ) ( not ( = ?auto_161936 ?auto_161944 ) ) ( not ( = ?auto_161936 ?auto_161950 ) ) ( not ( = ?auto_161937 ?auto_161938 ) ) ( not ( = ?auto_161937 ?auto_161940 ) ) ( not ( = ?auto_161937 ?auto_161939 ) ) ( not ( = ?auto_161937 ?auto_161941 ) ) ( not ( = ?auto_161937 ?auto_161942 ) ) ( not ( = ?auto_161937 ?auto_161943 ) ) ( not ( = ?auto_161937 ?auto_161944 ) ) ( not ( = ?auto_161937 ?auto_161950 ) ) ( not ( = ?auto_161938 ?auto_161940 ) ) ( not ( = ?auto_161938 ?auto_161939 ) ) ( not ( = ?auto_161938 ?auto_161941 ) ) ( not ( = ?auto_161938 ?auto_161942 ) ) ( not ( = ?auto_161938 ?auto_161943 ) ) ( not ( = ?auto_161938 ?auto_161944 ) ) ( not ( = ?auto_161938 ?auto_161950 ) ) ( not ( = ?auto_161940 ?auto_161939 ) ) ( not ( = ?auto_161940 ?auto_161941 ) ) ( not ( = ?auto_161940 ?auto_161942 ) ) ( not ( = ?auto_161940 ?auto_161943 ) ) ( not ( = ?auto_161940 ?auto_161944 ) ) ( not ( = ?auto_161940 ?auto_161950 ) ) ( not ( = ?auto_161939 ?auto_161941 ) ) ( not ( = ?auto_161939 ?auto_161942 ) ) ( not ( = ?auto_161939 ?auto_161943 ) ) ( not ( = ?auto_161939 ?auto_161944 ) ) ( not ( = ?auto_161939 ?auto_161950 ) ) ( not ( = ?auto_161941 ?auto_161942 ) ) ( not ( = ?auto_161941 ?auto_161943 ) ) ( not ( = ?auto_161941 ?auto_161944 ) ) ( not ( = ?auto_161941 ?auto_161950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_161942 ?auto_161943 ?auto_161944 )
      ( MAKE-8CRATE-VERIFY ?auto_161936 ?auto_161937 ?auto_161938 ?auto_161940 ?auto_161939 ?auto_161941 ?auto_161942 ?auto_161943 ?auto_161944 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162029 - SURFACE
      ?auto_162030 - SURFACE
      ?auto_162031 - SURFACE
      ?auto_162033 - SURFACE
      ?auto_162032 - SURFACE
      ?auto_162034 - SURFACE
      ?auto_162035 - SURFACE
      ?auto_162036 - SURFACE
      ?auto_162037 - SURFACE
    )
    :vars
    (
      ?auto_162039 - HOIST
      ?auto_162038 - PLACE
      ?auto_162042 - PLACE
      ?auto_162040 - HOIST
      ?auto_162043 - SURFACE
      ?auto_162041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162039 ?auto_162038 ) ( SURFACE-AT ?auto_162036 ?auto_162038 ) ( CLEAR ?auto_162036 ) ( IS-CRATE ?auto_162037 ) ( not ( = ?auto_162036 ?auto_162037 ) ) ( AVAILABLE ?auto_162039 ) ( ON ?auto_162036 ?auto_162035 ) ( not ( = ?auto_162035 ?auto_162036 ) ) ( not ( = ?auto_162035 ?auto_162037 ) ) ( not ( = ?auto_162042 ?auto_162038 ) ) ( HOIST-AT ?auto_162040 ?auto_162042 ) ( not ( = ?auto_162039 ?auto_162040 ) ) ( AVAILABLE ?auto_162040 ) ( SURFACE-AT ?auto_162037 ?auto_162042 ) ( ON ?auto_162037 ?auto_162043 ) ( CLEAR ?auto_162037 ) ( not ( = ?auto_162036 ?auto_162043 ) ) ( not ( = ?auto_162037 ?auto_162043 ) ) ( not ( = ?auto_162035 ?auto_162043 ) ) ( TRUCK-AT ?auto_162041 ?auto_162038 ) ( ON ?auto_162030 ?auto_162029 ) ( ON ?auto_162031 ?auto_162030 ) ( ON ?auto_162033 ?auto_162031 ) ( ON ?auto_162032 ?auto_162033 ) ( ON ?auto_162034 ?auto_162032 ) ( ON ?auto_162035 ?auto_162034 ) ( not ( = ?auto_162029 ?auto_162030 ) ) ( not ( = ?auto_162029 ?auto_162031 ) ) ( not ( = ?auto_162029 ?auto_162033 ) ) ( not ( = ?auto_162029 ?auto_162032 ) ) ( not ( = ?auto_162029 ?auto_162034 ) ) ( not ( = ?auto_162029 ?auto_162035 ) ) ( not ( = ?auto_162029 ?auto_162036 ) ) ( not ( = ?auto_162029 ?auto_162037 ) ) ( not ( = ?auto_162029 ?auto_162043 ) ) ( not ( = ?auto_162030 ?auto_162031 ) ) ( not ( = ?auto_162030 ?auto_162033 ) ) ( not ( = ?auto_162030 ?auto_162032 ) ) ( not ( = ?auto_162030 ?auto_162034 ) ) ( not ( = ?auto_162030 ?auto_162035 ) ) ( not ( = ?auto_162030 ?auto_162036 ) ) ( not ( = ?auto_162030 ?auto_162037 ) ) ( not ( = ?auto_162030 ?auto_162043 ) ) ( not ( = ?auto_162031 ?auto_162033 ) ) ( not ( = ?auto_162031 ?auto_162032 ) ) ( not ( = ?auto_162031 ?auto_162034 ) ) ( not ( = ?auto_162031 ?auto_162035 ) ) ( not ( = ?auto_162031 ?auto_162036 ) ) ( not ( = ?auto_162031 ?auto_162037 ) ) ( not ( = ?auto_162031 ?auto_162043 ) ) ( not ( = ?auto_162033 ?auto_162032 ) ) ( not ( = ?auto_162033 ?auto_162034 ) ) ( not ( = ?auto_162033 ?auto_162035 ) ) ( not ( = ?auto_162033 ?auto_162036 ) ) ( not ( = ?auto_162033 ?auto_162037 ) ) ( not ( = ?auto_162033 ?auto_162043 ) ) ( not ( = ?auto_162032 ?auto_162034 ) ) ( not ( = ?auto_162032 ?auto_162035 ) ) ( not ( = ?auto_162032 ?auto_162036 ) ) ( not ( = ?auto_162032 ?auto_162037 ) ) ( not ( = ?auto_162032 ?auto_162043 ) ) ( not ( = ?auto_162034 ?auto_162035 ) ) ( not ( = ?auto_162034 ?auto_162036 ) ) ( not ( = ?auto_162034 ?auto_162037 ) ) ( not ( = ?auto_162034 ?auto_162043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162035 ?auto_162036 ?auto_162037 )
      ( MAKE-8CRATE-VERIFY ?auto_162029 ?auto_162030 ?auto_162031 ?auto_162033 ?auto_162032 ?auto_162034 ?auto_162035 ?auto_162036 ?auto_162037 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162122 - SURFACE
      ?auto_162123 - SURFACE
      ?auto_162124 - SURFACE
      ?auto_162126 - SURFACE
      ?auto_162125 - SURFACE
      ?auto_162127 - SURFACE
      ?auto_162128 - SURFACE
      ?auto_162129 - SURFACE
      ?auto_162130 - SURFACE
    )
    :vars
    (
      ?auto_162135 - HOIST
      ?auto_162131 - PLACE
      ?auto_162134 - PLACE
      ?auto_162133 - HOIST
      ?auto_162136 - SURFACE
      ?auto_162132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162135 ?auto_162131 ) ( IS-CRATE ?auto_162130 ) ( not ( = ?auto_162129 ?auto_162130 ) ) ( not ( = ?auto_162128 ?auto_162129 ) ) ( not ( = ?auto_162128 ?auto_162130 ) ) ( not ( = ?auto_162134 ?auto_162131 ) ) ( HOIST-AT ?auto_162133 ?auto_162134 ) ( not ( = ?auto_162135 ?auto_162133 ) ) ( AVAILABLE ?auto_162133 ) ( SURFACE-AT ?auto_162130 ?auto_162134 ) ( ON ?auto_162130 ?auto_162136 ) ( CLEAR ?auto_162130 ) ( not ( = ?auto_162129 ?auto_162136 ) ) ( not ( = ?auto_162130 ?auto_162136 ) ) ( not ( = ?auto_162128 ?auto_162136 ) ) ( TRUCK-AT ?auto_162132 ?auto_162131 ) ( SURFACE-AT ?auto_162128 ?auto_162131 ) ( CLEAR ?auto_162128 ) ( LIFTING ?auto_162135 ?auto_162129 ) ( IS-CRATE ?auto_162129 ) ( ON ?auto_162123 ?auto_162122 ) ( ON ?auto_162124 ?auto_162123 ) ( ON ?auto_162126 ?auto_162124 ) ( ON ?auto_162125 ?auto_162126 ) ( ON ?auto_162127 ?auto_162125 ) ( ON ?auto_162128 ?auto_162127 ) ( not ( = ?auto_162122 ?auto_162123 ) ) ( not ( = ?auto_162122 ?auto_162124 ) ) ( not ( = ?auto_162122 ?auto_162126 ) ) ( not ( = ?auto_162122 ?auto_162125 ) ) ( not ( = ?auto_162122 ?auto_162127 ) ) ( not ( = ?auto_162122 ?auto_162128 ) ) ( not ( = ?auto_162122 ?auto_162129 ) ) ( not ( = ?auto_162122 ?auto_162130 ) ) ( not ( = ?auto_162122 ?auto_162136 ) ) ( not ( = ?auto_162123 ?auto_162124 ) ) ( not ( = ?auto_162123 ?auto_162126 ) ) ( not ( = ?auto_162123 ?auto_162125 ) ) ( not ( = ?auto_162123 ?auto_162127 ) ) ( not ( = ?auto_162123 ?auto_162128 ) ) ( not ( = ?auto_162123 ?auto_162129 ) ) ( not ( = ?auto_162123 ?auto_162130 ) ) ( not ( = ?auto_162123 ?auto_162136 ) ) ( not ( = ?auto_162124 ?auto_162126 ) ) ( not ( = ?auto_162124 ?auto_162125 ) ) ( not ( = ?auto_162124 ?auto_162127 ) ) ( not ( = ?auto_162124 ?auto_162128 ) ) ( not ( = ?auto_162124 ?auto_162129 ) ) ( not ( = ?auto_162124 ?auto_162130 ) ) ( not ( = ?auto_162124 ?auto_162136 ) ) ( not ( = ?auto_162126 ?auto_162125 ) ) ( not ( = ?auto_162126 ?auto_162127 ) ) ( not ( = ?auto_162126 ?auto_162128 ) ) ( not ( = ?auto_162126 ?auto_162129 ) ) ( not ( = ?auto_162126 ?auto_162130 ) ) ( not ( = ?auto_162126 ?auto_162136 ) ) ( not ( = ?auto_162125 ?auto_162127 ) ) ( not ( = ?auto_162125 ?auto_162128 ) ) ( not ( = ?auto_162125 ?auto_162129 ) ) ( not ( = ?auto_162125 ?auto_162130 ) ) ( not ( = ?auto_162125 ?auto_162136 ) ) ( not ( = ?auto_162127 ?auto_162128 ) ) ( not ( = ?auto_162127 ?auto_162129 ) ) ( not ( = ?auto_162127 ?auto_162130 ) ) ( not ( = ?auto_162127 ?auto_162136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162128 ?auto_162129 ?auto_162130 )
      ( MAKE-8CRATE-VERIFY ?auto_162122 ?auto_162123 ?auto_162124 ?auto_162126 ?auto_162125 ?auto_162127 ?auto_162128 ?auto_162129 ?auto_162130 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_162215 - SURFACE
      ?auto_162216 - SURFACE
      ?auto_162217 - SURFACE
      ?auto_162219 - SURFACE
      ?auto_162218 - SURFACE
      ?auto_162220 - SURFACE
      ?auto_162221 - SURFACE
      ?auto_162222 - SURFACE
      ?auto_162223 - SURFACE
    )
    :vars
    (
      ?auto_162224 - HOIST
      ?auto_162225 - PLACE
      ?auto_162228 - PLACE
      ?auto_162227 - HOIST
      ?auto_162229 - SURFACE
      ?auto_162226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_162224 ?auto_162225 ) ( IS-CRATE ?auto_162223 ) ( not ( = ?auto_162222 ?auto_162223 ) ) ( not ( = ?auto_162221 ?auto_162222 ) ) ( not ( = ?auto_162221 ?auto_162223 ) ) ( not ( = ?auto_162228 ?auto_162225 ) ) ( HOIST-AT ?auto_162227 ?auto_162228 ) ( not ( = ?auto_162224 ?auto_162227 ) ) ( AVAILABLE ?auto_162227 ) ( SURFACE-AT ?auto_162223 ?auto_162228 ) ( ON ?auto_162223 ?auto_162229 ) ( CLEAR ?auto_162223 ) ( not ( = ?auto_162222 ?auto_162229 ) ) ( not ( = ?auto_162223 ?auto_162229 ) ) ( not ( = ?auto_162221 ?auto_162229 ) ) ( TRUCK-AT ?auto_162226 ?auto_162225 ) ( SURFACE-AT ?auto_162221 ?auto_162225 ) ( CLEAR ?auto_162221 ) ( IS-CRATE ?auto_162222 ) ( AVAILABLE ?auto_162224 ) ( IN ?auto_162222 ?auto_162226 ) ( ON ?auto_162216 ?auto_162215 ) ( ON ?auto_162217 ?auto_162216 ) ( ON ?auto_162219 ?auto_162217 ) ( ON ?auto_162218 ?auto_162219 ) ( ON ?auto_162220 ?auto_162218 ) ( ON ?auto_162221 ?auto_162220 ) ( not ( = ?auto_162215 ?auto_162216 ) ) ( not ( = ?auto_162215 ?auto_162217 ) ) ( not ( = ?auto_162215 ?auto_162219 ) ) ( not ( = ?auto_162215 ?auto_162218 ) ) ( not ( = ?auto_162215 ?auto_162220 ) ) ( not ( = ?auto_162215 ?auto_162221 ) ) ( not ( = ?auto_162215 ?auto_162222 ) ) ( not ( = ?auto_162215 ?auto_162223 ) ) ( not ( = ?auto_162215 ?auto_162229 ) ) ( not ( = ?auto_162216 ?auto_162217 ) ) ( not ( = ?auto_162216 ?auto_162219 ) ) ( not ( = ?auto_162216 ?auto_162218 ) ) ( not ( = ?auto_162216 ?auto_162220 ) ) ( not ( = ?auto_162216 ?auto_162221 ) ) ( not ( = ?auto_162216 ?auto_162222 ) ) ( not ( = ?auto_162216 ?auto_162223 ) ) ( not ( = ?auto_162216 ?auto_162229 ) ) ( not ( = ?auto_162217 ?auto_162219 ) ) ( not ( = ?auto_162217 ?auto_162218 ) ) ( not ( = ?auto_162217 ?auto_162220 ) ) ( not ( = ?auto_162217 ?auto_162221 ) ) ( not ( = ?auto_162217 ?auto_162222 ) ) ( not ( = ?auto_162217 ?auto_162223 ) ) ( not ( = ?auto_162217 ?auto_162229 ) ) ( not ( = ?auto_162219 ?auto_162218 ) ) ( not ( = ?auto_162219 ?auto_162220 ) ) ( not ( = ?auto_162219 ?auto_162221 ) ) ( not ( = ?auto_162219 ?auto_162222 ) ) ( not ( = ?auto_162219 ?auto_162223 ) ) ( not ( = ?auto_162219 ?auto_162229 ) ) ( not ( = ?auto_162218 ?auto_162220 ) ) ( not ( = ?auto_162218 ?auto_162221 ) ) ( not ( = ?auto_162218 ?auto_162222 ) ) ( not ( = ?auto_162218 ?auto_162223 ) ) ( not ( = ?auto_162218 ?auto_162229 ) ) ( not ( = ?auto_162220 ?auto_162221 ) ) ( not ( = ?auto_162220 ?auto_162222 ) ) ( not ( = ?auto_162220 ?auto_162223 ) ) ( not ( = ?auto_162220 ?auto_162229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_162221 ?auto_162222 ?auto_162223 )
      ( MAKE-8CRATE-VERIFY ?auto_162215 ?auto_162216 ?auto_162217 ?auto_162219 ?auto_162218 ?auto_162220 ?auto_162221 ?auto_162222 ?auto_162223 ) )
  )

)

