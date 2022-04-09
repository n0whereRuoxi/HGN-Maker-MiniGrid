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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21721 - SURFACE
      ?auto_21722 - SURFACE
    )
    :vars
    (
      ?auto_21723 - HOIST
      ?auto_21724 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21723 ?auto_21724 ) ( SURFACE-AT ?auto_21721 ?auto_21724 ) ( CLEAR ?auto_21721 ) ( LIFTING ?auto_21723 ?auto_21722 ) ( IS-CRATE ?auto_21722 ) ( not ( = ?auto_21721 ?auto_21722 ) ) )
    :subtasks
    ( ( !DROP ?auto_21723 ?auto_21722 ?auto_21721 ?auto_21724 )
      ( MAKE-1CRATE-VERIFY ?auto_21721 ?auto_21722 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21725 - SURFACE
      ?auto_21726 - SURFACE
    )
    :vars
    (
      ?auto_21727 - HOIST
      ?auto_21728 - PLACE
      ?auto_21729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21727 ?auto_21728 ) ( SURFACE-AT ?auto_21725 ?auto_21728 ) ( CLEAR ?auto_21725 ) ( IS-CRATE ?auto_21726 ) ( not ( = ?auto_21725 ?auto_21726 ) ) ( TRUCK-AT ?auto_21729 ?auto_21728 ) ( AVAILABLE ?auto_21727 ) ( IN ?auto_21726 ?auto_21729 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21727 ?auto_21726 ?auto_21729 ?auto_21728 )
      ( MAKE-1CRATE ?auto_21725 ?auto_21726 )
      ( MAKE-1CRATE-VERIFY ?auto_21725 ?auto_21726 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21730 - SURFACE
      ?auto_21731 - SURFACE
    )
    :vars
    (
      ?auto_21734 - HOIST
      ?auto_21732 - PLACE
      ?auto_21733 - TRUCK
      ?auto_21735 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21734 ?auto_21732 ) ( SURFACE-AT ?auto_21730 ?auto_21732 ) ( CLEAR ?auto_21730 ) ( IS-CRATE ?auto_21731 ) ( not ( = ?auto_21730 ?auto_21731 ) ) ( AVAILABLE ?auto_21734 ) ( IN ?auto_21731 ?auto_21733 ) ( TRUCK-AT ?auto_21733 ?auto_21735 ) ( not ( = ?auto_21735 ?auto_21732 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21733 ?auto_21735 ?auto_21732 )
      ( MAKE-1CRATE ?auto_21730 ?auto_21731 )
      ( MAKE-1CRATE-VERIFY ?auto_21730 ?auto_21731 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21736 - SURFACE
      ?auto_21737 - SURFACE
    )
    :vars
    (
      ?auto_21741 - HOIST
      ?auto_21738 - PLACE
      ?auto_21740 - TRUCK
      ?auto_21739 - PLACE
      ?auto_21742 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21741 ?auto_21738 ) ( SURFACE-AT ?auto_21736 ?auto_21738 ) ( CLEAR ?auto_21736 ) ( IS-CRATE ?auto_21737 ) ( not ( = ?auto_21736 ?auto_21737 ) ) ( AVAILABLE ?auto_21741 ) ( TRUCK-AT ?auto_21740 ?auto_21739 ) ( not ( = ?auto_21739 ?auto_21738 ) ) ( HOIST-AT ?auto_21742 ?auto_21739 ) ( LIFTING ?auto_21742 ?auto_21737 ) ( not ( = ?auto_21741 ?auto_21742 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21742 ?auto_21737 ?auto_21740 ?auto_21739 )
      ( MAKE-1CRATE ?auto_21736 ?auto_21737 )
      ( MAKE-1CRATE-VERIFY ?auto_21736 ?auto_21737 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21743 - SURFACE
      ?auto_21744 - SURFACE
    )
    :vars
    (
      ?auto_21745 - HOIST
      ?auto_21749 - PLACE
      ?auto_21748 - TRUCK
      ?auto_21746 - PLACE
      ?auto_21747 - HOIST
      ?auto_21750 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21745 ?auto_21749 ) ( SURFACE-AT ?auto_21743 ?auto_21749 ) ( CLEAR ?auto_21743 ) ( IS-CRATE ?auto_21744 ) ( not ( = ?auto_21743 ?auto_21744 ) ) ( AVAILABLE ?auto_21745 ) ( TRUCK-AT ?auto_21748 ?auto_21746 ) ( not ( = ?auto_21746 ?auto_21749 ) ) ( HOIST-AT ?auto_21747 ?auto_21746 ) ( not ( = ?auto_21745 ?auto_21747 ) ) ( AVAILABLE ?auto_21747 ) ( SURFACE-AT ?auto_21744 ?auto_21746 ) ( ON ?auto_21744 ?auto_21750 ) ( CLEAR ?auto_21744 ) ( not ( = ?auto_21743 ?auto_21750 ) ) ( not ( = ?auto_21744 ?auto_21750 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21747 ?auto_21744 ?auto_21750 ?auto_21746 )
      ( MAKE-1CRATE ?auto_21743 ?auto_21744 )
      ( MAKE-1CRATE-VERIFY ?auto_21743 ?auto_21744 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21751 - SURFACE
      ?auto_21752 - SURFACE
    )
    :vars
    (
      ?auto_21754 - HOIST
      ?auto_21755 - PLACE
      ?auto_21758 - PLACE
      ?auto_21753 - HOIST
      ?auto_21756 - SURFACE
      ?auto_21757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21754 ?auto_21755 ) ( SURFACE-AT ?auto_21751 ?auto_21755 ) ( CLEAR ?auto_21751 ) ( IS-CRATE ?auto_21752 ) ( not ( = ?auto_21751 ?auto_21752 ) ) ( AVAILABLE ?auto_21754 ) ( not ( = ?auto_21758 ?auto_21755 ) ) ( HOIST-AT ?auto_21753 ?auto_21758 ) ( not ( = ?auto_21754 ?auto_21753 ) ) ( AVAILABLE ?auto_21753 ) ( SURFACE-AT ?auto_21752 ?auto_21758 ) ( ON ?auto_21752 ?auto_21756 ) ( CLEAR ?auto_21752 ) ( not ( = ?auto_21751 ?auto_21756 ) ) ( not ( = ?auto_21752 ?auto_21756 ) ) ( TRUCK-AT ?auto_21757 ?auto_21755 ) )
    :subtasks
    ( ( !DRIVE ?auto_21757 ?auto_21755 ?auto_21758 )
      ( MAKE-1CRATE ?auto_21751 ?auto_21752 )
      ( MAKE-1CRATE-VERIFY ?auto_21751 ?auto_21752 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21768 - SURFACE
      ?auto_21769 - SURFACE
      ?auto_21770 - SURFACE
    )
    :vars
    (
      ?auto_21771 - HOIST
      ?auto_21772 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21771 ?auto_21772 ) ( SURFACE-AT ?auto_21769 ?auto_21772 ) ( CLEAR ?auto_21769 ) ( LIFTING ?auto_21771 ?auto_21770 ) ( IS-CRATE ?auto_21770 ) ( not ( = ?auto_21769 ?auto_21770 ) ) ( ON ?auto_21769 ?auto_21768 ) ( not ( = ?auto_21768 ?auto_21769 ) ) ( not ( = ?auto_21768 ?auto_21770 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21769 ?auto_21770 )
      ( MAKE-2CRATE-VERIFY ?auto_21768 ?auto_21769 ?auto_21770 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21778 - SURFACE
      ?auto_21779 - SURFACE
      ?auto_21780 - SURFACE
    )
    :vars
    (
      ?auto_21783 - HOIST
      ?auto_21782 - PLACE
      ?auto_21781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21783 ?auto_21782 ) ( SURFACE-AT ?auto_21779 ?auto_21782 ) ( CLEAR ?auto_21779 ) ( IS-CRATE ?auto_21780 ) ( not ( = ?auto_21779 ?auto_21780 ) ) ( TRUCK-AT ?auto_21781 ?auto_21782 ) ( AVAILABLE ?auto_21783 ) ( IN ?auto_21780 ?auto_21781 ) ( ON ?auto_21779 ?auto_21778 ) ( not ( = ?auto_21778 ?auto_21779 ) ) ( not ( = ?auto_21778 ?auto_21780 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21779 ?auto_21780 )
      ( MAKE-2CRATE-VERIFY ?auto_21778 ?auto_21779 ?auto_21780 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21784 - SURFACE
      ?auto_21785 - SURFACE
    )
    :vars
    (
      ?auto_21787 - HOIST
      ?auto_21789 - PLACE
      ?auto_21786 - TRUCK
      ?auto_21788 - SURFACE
      ?auto_21790 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21787 ?auto_21789 ) ( SURFACE-AT ?auto_21784 ?auto_21789 ) ( CLEAR ?auto_21784 ) ( IS-CRATE ?auto_21785 ) ( not ( = ?auto_21784 ?auto_21785 ) ) ( AVAILABLE ?auto_21787 ) ( IN ?auto_21785 ?auto_21786 ) ( ON ?auto_21784 ?auto_21788 ) ( not ( = ?auto_21788 ?auto_21784 ) ) ( not ( = ?auto_21788 ?auto_21785 ) ) ( TRUCK-AT ?auto_21786 ?auto_21790 ) ( not ( = ?auto_21790 ?auto_21789 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21786 ?auto_21790 ?auto_21789 )
      ( MAKE-2CRATE ?auto_21788 ?auto_21784 ?auto_21785 )
      ( MAKE-1CRATE-VERIFY ?auto_21784 ?auto_21785 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21791 - SURFACE
      ?auto_21792 - SURFACE
      ?auto_21793 - SURFACE
    )
    :vars
    (
      ?auto_21796 - HOIST
      ?auto_21794 - PLACE
      ?auto_21795 - TRUCK
      ?auto_21797 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21796 ?auto_21794 ) ( SURFACE-AT ?auto_21792 ?auto_21794 ) ( CLEAR ?auto_21792 ) ( IS-CRATE ?auto_21793 ) ( not ( = ?auto_21792 ?auto_21793 ) ) ( AVAILABLE ?auto_21796 ) ( IN ?auto_21793 ?auto_21795 ) ( ON ?auto_21792 ?auto_21791 ) ( not ( = ?auto_21791 ?auto_21792 ) ) ( not ( = ?auto_21791 ?auto_21793 ) ) ( TRUCK-AT ?auto_21795 ?auto_21797 ) ( not ( = ?auto_21797 ?auto_21794 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21792 ?auto_21793 )
      ( MAKE-2CRATE-VERIFY ?auto_21791 ?auto_21792 ?auto_21793 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21798 - SURFACE
      ?auto_21799 - SURFACE
    )
    :vars
    (
      ?auto_21802 - HOIST
      ?auto_21801 - PLACE
      ?auto_21800 - SURFACE
      ?auto_21804 - TRUCK
      ?auto_21803 - PLACE
      ?auto_21805 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21802 ?auto_21801 ) ( SURFACE-AT ?auto_21798 ?auto_21801 ) ( CLEAR ?auto_21798 ) ( IS-CRATE ?auto_21799 ) ( not ( = ?auto_21798 ?auto_21799 ) ) ( AVAILABLE ?auto_21802 ) ( ON ?auto_21798 ?auto_21800 ) ( not ( = ?auto_21800 ?auto_21798 ) ) ( not ( = ?auto_21800 ?auto_21799 ) ) ( TRUCK-AT ?auto_21804 ?auto_21803 ) ( not ( = ?auto_21803 ?auto_21801 ) ) ( HOIST-AT ?auto_21805 ?auto_21803 ) ( LIFTING ?auto_21805 ?auto_21799 ) ( not ( = ?auto_21802 ?auto_21805 ) ) )
    :subtasks
    ( ( !LOAD ?auto_21805 ?auto_21799 ?auto_21804 ?auto_21803 )
      ( MAKE-2CRATE ?auto_21800 ?auto_21798 ?auto_21799 )
      ( MAKE-1CRATE-VERIFY ?auto_21798 ?auto_21799 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21806 - SURFACE
      ?auto_21807 - SURFACE
      ?auto_21808 - SURFACE
    )
    :vars
    (
      ?auto_21809 - HOIST
      ?auto_21811 - PLACE
      ?auto_21812 - TRUCK
      ?auto_21813 - PLACE
      ?auto_21810 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21809 ?auto_21811 ) ( SURFACE-AT ?auto_21807 ?auto_21811 ) ( CLEAR ?auto_21807 ) ( IS-CRATE ?auto_21808 ) ( not ( = ?auto_21807 ?auto_21808 ) ) ( AVAILABLE ?auto_21809 ) ( ON ?auto_21807 ?auto_21806 ) ( not ( = ?auto_21806 ?auto_21807 ) ) ( not ( = ?auto_21806 ?auto_21808 ) ) ( TRUCK-AT ?auto_21812 ?auto_21813 ) ( not ( = ?auto_21813 ?auto_21811 ) ) ( HOIST-AT ?auto_21810 ?auto_21813 ) ( LIFTING ?auto_21810 ?auto_21808 ) ( not ( = ?auto_21809 ?auto_21810 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21807 ?auto_21808 )
      ( MAKE-2CRATE-VERIFY ?auto_21806 ?auto_21807 ?auto_21808 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21814 - SURFACE
      ?auto_21815 - SURFACE
    )
    :vars
    (
      ?auto_21821 - HOIST
      ?auto_21817 - PLACE
      ?auto_21816 - SURFACE
      ?auto_21820 - TRUCK
      ?auto_21818 - PLACE
      ?auto_21819 - HOIST
      ?auto_21822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21821 ?auto_21817 ) ( SURFACE-AT ?auto_21814 ?auto_21817 ) ( CLEAR ?auto_21814 ) ( IS-CRATE ?auto_21815 ) ( not ( = ?auto_21814 ?auto_21815 ) ) ( AVAILABLE ?auto_21821 ) ( ON ?auto_21814 ?auto_21816 ) ( not ( = ?auto_21816 ?auto_21814 ) ) ( not ( = ?auto_21816 ?auto_21815 ) ) ( TRUCK-AT ?auto_21820 ?auto_21818 ) ( not ( = ?auto_21818 ?auto_21817 ) ) ( HOIST-AT ?auto_21819 ?auto_21818 ) ( not ( = ?auto_21821 ?auto_21819 ) ) ( AVAILABLE ?auto_21819 ) ( SURFACE-AT ?auto_21815 ?auto_21818 ) ( ON ?auto_21815 ?auto_21822 ) ( CLEAR ?auto_21815 ) ( not ( = ?auto_21814 ?auto_21822 ) ) ( not ( = ?auto_21815 ?auto_21822 ) ) ( not ( = ?auto_21816 ?auto_21822 ) ) )
    :subtasks
    ( ( !LIFT ?auto_21819 ?auto_21815 ?auto_21822 ?auto_21818 )
      ( MAKE-2CRATE ?auto_21816 ?auto_21814 ?auto_21815 )
      ( MAKE-1CRATE-VERIFY ?auto_21814 ?auto_21815 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21823 - SURFACE
      ?auto_21824 - SURFACE
      ?auto_21825 - SURFACE
    )
    :vars
    (
      ?auto_21827 - HOIST
      ?auto_21829 - PLACE
      ?auto_21830 - TRUCK
      ?auto_21828 - PLACE
      ?auto_21826 - HOIST
      ?auto_21831 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21827 ?auto_21829 ) ( SURFACE-AT ?auto_21824 ?auto_21829 ) ( CLEAR ?auto_21824 ) ( IS-CRATE ?auto_21825 ) ( not ( = ?auto_21824 ?auto_21825 ) ) ( AVAILABLE ?auto_21827 ) ( ON ?auto_21824 ?auto_21823 ) ( not ( = ?auto_21823 ?auto_21824 ) ) ( not ( = ?auto_21823 ?auto_21825 ) ) ( TRUCK-AT ?auto_21830 ?auto_21828 ) ( not ( = ?auto_21828 ?auto_21829 ) ) ( HOIST-AT ?auto_21826 ?auto_21828 ) ( not ( = ?auto_21827 ?auto_21826 ) ) ( AVAILABLE ?auto_21826 ) ( SURFACE-AT ?auto_21825 ?auto_21828 ) ( ON ?auto_21825 ?auto_21831 ) ( CLEAR ?auto_21825 ) ( not ( = ?auto_21824 ?auto_21831 ) ) ( not ( = ?auto_21825 ?auto_21831 ) ) ( not ( = ?auto_21823 ?auto_21831 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21824 ?auto_21825 )
      ( MAKE-2CRATE-VERIFY ?auto_21823 ?auto_21824 ?auto_21825 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21832 - SURFACE
      ?auto_21833 - SURFACE
    )
    :vars
    (
      ?auto_21839 - HOIST
      ?auto_21836 - PLACE
      ?auto_21834 - SURFACE
      ?auto_21835 - PLACE
      ?auto_21840 - HOIST
      ?auto_21837 - SURFACE
      ?auto_21838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21839 ?auto_21836 ) ( SURFACE-AT ?auto_21832 ?auto_21836 ) ( CLEAR ?auto_21832 ) ( IS-CRATE ?auto_21833 ) ( not ( = ?auto_21832 ?auto_21833 ) ) ( AVAILABLE ?auto_21839 ) ( ON ?auto_21832 ?auto_21834 ) ( not ( = ?auto_21834 ?auto_21832 ) ) ( not ( = ?auto_21834 ?auto_21833 ) ) ( not ( = ?auto_21835 ?auto_21836 ) ) ( HOIST-AT ?auto_21840 ?auto_21835 ) ( not ( = ?auto_21839 ?auto_21840 ) ) ( AVAILABLE ?auto_21840 ) ( SURFACE-AT ?auto_21833 ?auto_21835 ) ( ON ?auto_21833 ?auto_21837 ) ( CLEAR ?auto_21833 ) ( not ( = ?auto_21832 ?auto_21837 ) ) ( not ( = ?auto_21833 ?auto_21837 ) ) ( not ( = ?auto_21834 ?auto_21837 ) ) ( TRUCK-AT ?auto_21838 ?auto_21836 ) )
    :subtasks
    ( ( !DRIVE ?auto_21838 ?auto_21836 ?auto_21835 )
      ( MAKE-2CRATE ?auto_21834 ?auto_21832 ?auto_21833 )
      ( MAKE-1CRATE-VERIFY ?auto_21832 ?auto_21833 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21841 - SURFACE
      ?auto_21842 - SURFACE
      ?auto_21843 - SURFACE
    )
    :vars
    (
      ?auto_21846 - HOIST
      ?auto_21844 - PLACE
      ?auto_21847 - PLACE
      ?auto_21849 - HOIST
      ?auto_21848 - SURFACE
      ?auto_21845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21846 ?auto_21844 ) ( SURFACE-AT ?auto_21842 ?auto_21844 ) ( CLEAR ?auto_21842 ) ( IS-CRATE ?auto_21843 ) ( not ( = ?auto_21842 ?auto_21843 ) ) ( AVAILABLE ?auto_21846 ) ( ON ?auto_21842 ?auto_21841 ) ( not ( = ?auto_21841 ?auto_21842 ) ) ( not ( = ?auto_21841 ?auto_21843 ) ) ( not ( = ?auto_21847 ?auto_21844 ) ) ( HOIST-AT ?auto_21849 ?auto_21847 ) ( not ( = ?auto_21846 ?auto_21849 ) ) ( AVAILABLE ?auto_21849 ) ( SURFACE-AT ?auto_21843 ?auto_21847 ) ( ON ?auto_21843 ?auto_21848 ) ( CLEAR ?auto_21843 ) ( not ( = ?auto_21842 ?auto_21848 ) ) ( not ( = ?auto_21843 ?auto_21848 ) ) ( not ( = ?auto_21841 ?auto_21848 ) ) ( TRUCK-AT ?auto_21845 ?auto_21844 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21842 ?auto_21843 )
      ( MAKE-2CRATE-VERIFY ?auto_21841 ?auto_21842 ?auto_21843 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21850 - SURFACE
      ?auto_21851 - SURFACE
    )
    :vars
    (
      ?auto_21855 - HOIST
      ?auto_21854 - PLACE
      ?auto_21856 - SURFACE
      ?auto_21852 - PLACE
      ?auto_21857 - HOIST
      ?auto_21858 - SURFACE
      ?auto_21853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21855 ?auto_21854 ) ( IS-CRATE ?auto_21851 ) ( not ( = ?auto_21850 ?auto_21851 ) ) ( not ( = ?auto_21856 ?auto_21850 ) ) ( not ( = ?auto_21856 ?auto_21851 ) ) ( not ( = ?auto_21852 ?auto_21854 ) ) ( HOIST-AT ?auto_21857 ?auto_21852 ) ( not ( = ?auto_21855 ?auto_21857 ) ) ( AVAILABLE ?auto_21857 ) ( SURFACE-AT ?auto_21851 ?auto_21852 ) ( ON ?auto_21851 ?auto_21858 ) ( CLEAR ?auto_21851 ) ( not ( = ?auto_21850 ?auto_21858 ) ) ( not ( = ?auto_21851 ?auto_21858 ) ) ( not ( = ?auto_21856 ?auto_21858 ) ) ( TRUCK-AT ?auto_21853 ?auto_21854 ) ( SURFACE-AT ?auto_21856 ?auto_21854 ) ( CLEAR ?auto_21856 ) ( LIFTING ?auto_21855 ?auto_21850 ) ( IS-CRATE ?auto_21850 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21856 ?auto_21850 )
      ( MAKE-2CRATE ?auto_21856 ?auto_21850 ?auto_21851 )
      ( MAKE-1CRATE-VERIFY ?auto_21850 ?auto_21851 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21859 - SURFACE
      ?auto_21860 - SURFACE
      ?auto_21861 - SURFACE
    )
    :vars
    (
      ?auto_21867 - HOIST
      ?auto_21863 - PLACE
      ?auto_21866 - PLACE
      ?auto_21865 - HOIST
      ?auto_21864 - SURFACE
      ?auto_21862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21867 ?auto_21863 ) ( IS-CRATE ?auto_21861 ) ( not ( = ?auto_21860 ?auto_21861 ) ) ( not ( = ?auto_21859 ?auto_21860 ) ) ( not ( = ?auto_21859 ?auto_21861 ) ) ( not ( = ?auto_21866 ?auto_21863 ) ) ( HOIST-AT ?auto_21865 ?auto_21866 ) ( not ( = ?auto_21867 ?auto_21865 ) ) ( AVAILABLE ?auto_21865 ) ( SURFACE-AT ?auto_21861 ?auto_21866 ) ( ON ?auto_21861 ?auto_21864 ) ( CLEAR ?auto_21861 ) ( not ( = ?auto_21860 ?auto_21864 ) ) ( not ( = ?auto_21861 ?auto_21864 ) ) ( not ( = ?auto_21859 ?auto_21864 ) ) ( TRUCK-AT ?auto_21862 ?auto_21863 ) ( SURFACE-AT ?auto_21859 ?auto_21863 ) ( CLEAR ?auto_21859 ) ( LIFTING ?auto_21867 ?auto_21860 ) ( IS-CRATE ?auto_21860 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21860 ?auto_21861 )
      ( MAKE-2CRATE-VERIFY ?auto_21859 ?auto_21860 ?auto_21861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21868 - SURFACE
      ?auto_21869 - SURFACE
    )
    :vars
    (
      ?auto_21873 - HOIST
      ?auto_21876 - PLACE
      ?auto_21870 - SURFACE
      ?auto_21874 - PLACE
      ?auto_21871 - HOIST
      ?auto_21875 - SURFACE
      ?auto_21872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21873 ?auto_21876 ) ( IS-CRATE ?auto_21869 ) ( not ( = ?auto_21868 ?auto_21869 ) ) ( not ( = ?auto_21870 ?auto_21868 ) ) ( not ( = ?auto_21870 ?auto_21869 ) ) ( not ( = ?auto_21874 ?auto_21876 ) ) ( HOIST-AT ?auto_21871 ?auto_21874 ) ( not ( = ?auto_21873 ?auto_21871 ) ) ( AVAILABLE ?auto_21871 ) ( SURFACE-AT ?auto_21869 ?auto_21874 ) ( ON ?auto_21869 ?auto_21875 ) ( CLEAR ?auto_21869 ) ( not ( = ?auto_21868 ?auto_21875 ) ) ( not ( = ?auto_21869 ?auto_21875 ) ) ( not ( = ?auto_21870 ?auto_21875 ) ) ( TRUCK-AT ?auto_21872 ?auto_21876 ) ( SURFACE-AT ?auto_21870 ?auto_21876 ) ( CLEAR ?auto_21870 ) ( IS-CRATE ?auto_21868 ) ( AVAILABLE ?auto_21873 ) ( IN ?auto_21868 ?auto_21872 ) )
    :subtasks
    ( ( !UNLOAD ?auto_21873 ?auto_21868 ?auto_21872 ?auto_21876 )
      ( MAKE-2CRATE ?auto_21870 ?auto_21868 ?auto_21869 )
      ( MAKE-1CRATE-VERIFY ?auto_21868 ?auto_21869 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_21877 - SURFACE
      ?auto_21878 - SURFACE
      ?auto_21879 - SURFACE
    )
    :vars
    (
      ?auto_21880 - HOIST
      ?auto_21881 - PLACE
      ?auto_21883 - PLACE
      ?auto_21884 - HOIST
      ?auto_21882 - SURFACE
      ?auto_21885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21880 ?auto_21881 ) ( IS-CRATE ?auto_21879 ) ( not ( = ?auto_21878 ?auto_21879 ) ) ( not ( = ?auto_21877 ?auto_21878 ) ) ( not ( = ?auto_21877 ?auto_21879 ) ) ( not ( = ?auto_21883 ?auto_21881 ) ) ( HOIST-AT ?auto_21884 ?auto_21883 ) ( not ( = ?auto_21880 ?auto_21884 ) ) ( AVAILABLE ?auto_21884 ) ( SURFACE-AT ?auto_21879 ?auto_21883 ) ( ON ?auto_21879 ?auto_21882 ) ( CLEAR ?auto_21879 ) ( not ( = ?auto_21878 ?auto_21882 ) ) ( not ( = ?auto_21879 ?auto_21882 ) ) ( not ( = ?auto_21877 ?auto_21882 ) ) ( TRUCK-AT ?auto_21885 ?auto_21881 ) ( SURFACE-AT ?auto_21877 ?auto_21881 ) ( CLEAR ?auto_21877 ) ( IS-CRATE ?auto_21878 ) ( AVAILABLE ?auto_21880 ) ( IN ?auto_21878 ?auto_21885 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21878 ?auto_21879 )
      ( MAKE-2CRATE-VERIFY ?auto_21877 ?auto_21878 ?auto_21879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21922 - SURFACE
      ?auto_21923 - SURFACE
    )
    :vars
    (
      ?auto_21925 - HOIST
      ?auto_21926 - PLACE
      ?auto_21929 - SURFACE
      ?auto_21928 - PLACE
      ?auto_21924 - HOIST
      ?auto_21930 - SURFACE
      ?auto_21927 - TRUCK
      ?auto_21931 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21925 ?auto_21926 ) ( SURFACE-AT ?auto_21922 ?auto_21926 ) ( CLEAR ?auto_21922 ) ( IS-CRATE ?auto_21923 ) ( not ( = ?auto_21922 ?auto_21923 ) ) ( AVAILABLE ?auto_21925 ) ( ON ?auto_21922 ?auto_21929 ) ( not ( = ?auto_21929 ?auto_21922 ) ) ( not ( = ?auto_21929 ?auto_21923 ) ) ( not ( = ?auto_21928 ?auto_21926 ) ) ( HOIST-AT ?auto_21924 ?auto_21928 ) ( not ( = ?auto_21925 ?auto_21924 ) ) ( AVAILABLE ?auto_21924 ) ( SURFACE-AT ?auto_21923 ?auto_21928 ) ( ON ?auto_21923 ?auto_21930 ) ( CLEAR ?auto_21923 ) ( not ( = ?auto_21922 ?auto_21930 ) ) ( not ( = ?auto_21923 ?auto_21930 ) ) ( not ( = ?auto_21929 ?auto_21930 ) ) ( TRUCK-AT ?auto_21927 ?auto_21931 ) ( not ( = ?auto_21931 ?auto_21926 ) ) ( not ( = ?auto_21928 ?auto_21931 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21927 ?auto_21931 ?auto_21926 )
      ( MAKE-1CRATE ?auto_21922 ?auto_21923 )
      ( MAKE-1CRATE-VERIFY ?auto_21922 ?auto_21923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21961 - SURFACE
      ?auto_21962 - SURFACE
      ?auto_21963 - SURFACE
      ?auto_21964 - SURFACE
    )
    :vars
    (
      ?auto_21965 - HOIST
      ?auto_21966 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_21965 ?auto_21966 ) ( SURFACE-AT ?auto_21963 ?auto_21966 ) ( CLEAR ?auto_21963 ) ( LIFTING ?auto_21965 ?auto_21964 ) ( IS-CRATE ?auto_21964 ) ( not ( = ?auto_21963 ?auto_21964 ) ) ( ON ?auto_21962 ?auto_21961 ) ( ON ?auto_21963 ?auto_21962 ) ( not ( = ?auto_21961 ?auto_21962 ) ) ( not ( = ?auto_21961 ?auto_21963 ) ) ( not ( = ?auto_21961 ?auto_21964 ) ) ( not ( = ?auto_21962 ?auto_21963 ) ) ( not ( = ?auto_21962 ?auto_21964 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_21963 ?auto_21964 )
      ( MAKE-3CRATE-VERIFY ?auto_21961 ?auto_21962 ?auto_21963 ?auto_21964 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21978 - SURFACE
      ?auto_21979 - SURFACE
      ?auto_21980 - SURFACE
      ?auto_21981 - SURFACE
    )
    :vars
    (
      ?auto_21984 - HOIST
      ?auto_21983 - PLACE
      ?auto_21982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21984 ?auto_21983 ) ( SURFACE-AT ?auto_21980 ?auto_21983 ) ( CLEAR ?auto_21980 ) ( IS-CRATE ?auto_21981 ) ( not ( = ?auto_21980 ?auto_21981 ) ) ( TRUCK-AT ?auto_21982 ?auto_21983 ) ( AVAILABLE ?auto_21984 ) ( IN ?auto_21981 ?auto_21982 ) ( ON ?auto_21980 ?auto_21979 ) ( not ( = ?auto_21979 ?auto_21980 ) ) ( not ( = ?auto_21979 ?auto_21981 ) ) ( ON ?auto_21979 ?auto_21978 ) ( not ( = ?auto_21978 ?auto_21979 ) ) ( not ( = ?auto_21978 ?auto_21980 ) ) ( not ( = ?auto_21978 ?auto_21981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_21979 ?auto_21980 ?auto_21981 )
      ( MAKE-3CRATE-VERIFY ?auto_21978 ?auto_21979 ?auto_21980 ?auto_21981 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_21999 - SURFACE
      ?auto_22000 - SURFACE
      ?auto_22001 - SURFACE
      ?auto_22002 - SURFACE
    )
    :vars
    (
      ?auto_22004 - HOIST
      ?auto_22005 - PLACE
      ?auto_22006 - TRUCK
      ?auto_22003 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22004 ?auto_22005 ) ( SURFACE-AT ?auto_22001 ?auto_22005 ) ( CLEAR ?auto_22001 ) ( IS-CRATE ?auto_22002 ) ( not ( = ?auto_22001 ?auto_22002 ) ) ( AVAILABLE ?auto_22004 ) ( IN ?auto_22002 ?auto_22006 ) ( ON ?auto_22001 ?auto_22000 ) ( not ( = ?auto_22000 ?auto_22001 ) ) ( not ( = ?auto_22000 ?auto_22002 ) ) ( TRUCK-AT ?auto_22006 ?auto_22003 ) ( not ( = ?auto_22003 ?auto_22005 ) ) ( ON ?auto_22000 ?auto_21999 ) ( not ( = ?auto_21999 ?auto_22000 ) ) ( not ( = ?auto_21999 ?auto_22001 ) ) ( not ( = ?auto_21999 ?auto_22002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22000 ?auto_22001 ?auto_22002 )
      ( MAKE-3CRATE-VERIFY ?auto_21999 ?auto_22000 ?auto_22001 ?auto_22002 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22023 - SURFACE
      ?auto_22024 - SURFACE
      ?auto_22025 - SURFACE
      ?auto_22026 - SURFACE
    )
    :vars
    (
      ?auto_22028 - HOIST
      ?auto_22031 - PLACE
      ?auto_22029 - TRUCK
      ?auto_22030 - PLACE
      ?auto_22027 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22028 ?auto_22031 ) ( SURFACE-AT ?auto_22025 ?auto_22031 ) ( CLEAR ?auto_22025 ) ( IS-CRATE ?auto_22026 ) ( not ( = ?auto_22025 ?auto_22026 ) ) ( AVAILABLE ?auto_22028 ) ( ON ?auto_22025 ?auto_22024 ) ( not ( = ?auto_22024 ?auto_22025 ) ) ( not ( = ?auto_22024 ?auto_22026 ) ) ( TRUCK-AT ?auto_22029 ?auto_22030 ) ( not ( = ?auto_22030 ?auto_22031 ) ) ( HOIST-AT ?auto_22027 ?auto_22030 ) ( LIFTING ?auto_22027 ?auto_22026 ) ( not ( = ?auto_22028 ?auto_22027 ) ) ( ON ?auto_22024 ?auto_22023 ) ( not ( = ?auto_22023 ?auto_22024 ) ) ( not ( = ?auto_22023 ?auto_22025 ) ) ( not ( = ?auto_22023 ?auto_22026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22024 ?auto_22025 ?auto_22026 )
      ( MAKE-3CRATE-VERIFY ?auto_22023 ?auto_22024 ?auto_22025 ?auto_22026 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22050 - SURFACE
      ?auto_22051 - SURFACE
      ?auto_22052 - SURFACE
      ?auto_22053 - SURFACE
    )
    :vars
    (
      ?auto_22057 - HOIST
      ?auto_22055 - PLACE
      ?auto_22056 - TRUCK
      ?auto_22059 - PLACE
      ?auto_22058 - HOIST
      ?auto_22054 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22057 ?auto_22055 ) ( SURFACE-AT ?auto_22052 ?auto_22055 ) ( CLEAR ?auto_22052 ) ( IS-CRATE ?auto_22053 ) ( not ( = ?auto_22052 ?auto_22053 ) ) ( AVAILABLE ?auto_22057 ) ( ON ?auto_22052 ?auto_22051 ) ( not ( = ?auto_22051 ?auto_22052 ) ) ( not ( = ?auto_22051 ?auto_22053 ) ) ( TRUCK-AT ?auto_22056 ?auto_22059 ) ( not ( = ?auto_22059 ?auto_22055 ) ) ( HOIST-AT ?auto_22058 ?auto_22059 ) ( not ( = ?auto_22057 ?auto_22058 ) ) ( AVAILABLE ?auto_22058 ) ( SURFACE-AT ?auto_22053 ?auto_22059 ) ( ON ?auto_22053 ?auto_22054 ) ( CLEAR ?auto_22053 ) ( not ( = ?auto_22052 ?auto_22054 ) ) ( not ( = ?auto_22053 ?auto_22054 ) ) ( not ( = ?auto_22051 ?auto_22054 ) ) ( ON ?auto_22051 ?auto_22050 ) ( not ( = ?auto_22050 ?auto_22051 ) ) ( not ( = ?auto_22050 ?auto_22052 ) ) ( not ( = ?auto_22050 ?auto_22053 ) ) ( not ( = ?auto_22050 ?auto_22054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22051 ?auto_22052 ?auto_22053 )
      ( MAKE-3CRATE-VERIFY ?auto_22050 ?auto_22051 ?auto_22052 ?auto_22053 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22078 - SURFACE
      ?auto_22079 - SURFACE
      ?auto_22080 - SURFACE
      ?auto_22081 - SURFACE
    )
    :vars
    (
      ?auto_22082 - HOIST
      ?auto_22087 - PLACE
      ?auto_22083 - PLACE
      ?auto_22086 - HOIST
      ?auto_22084 - SURFACE
      ?auto_22085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22082 ?auto_22087 ) ( SURFACE-AT ?auto_22080 ?auto_22087 ) ( CLEAR ?auto_22080 ) ( IS-CRATE ?auto_22081 ) ( not ( = ?auto_22080 ?auto_22081 ) ) ( AVAILABLE ?auto_22082 ) ( ON ?auto_22080 ?auto_22079 ) ( not ( = ?auto_22079 ?auto_22080 ) ) ( not ( = ?auto_22079 ?auto_22081 ) ) ( not ( = ?auto_22083 ?auto_22087 ) ) ( HOIST-AT ?auto_22086 ?auto_22083 ) ( not ( = ?auto_22082 ?auto_22086 ) ) ( AVAILABLE ?auto_22086 ) ( SURFACE-AT ?auto_22081 ?auto_22083 ) ( ON ?auto_22081 ?auto_22084 ) ( CLEAR ?auto_22081 ) ( not ( = ?auto_22080 ?auto_22084 ) ) ( not ( = ?auto_22081 ?auto_22084 ) ) ( not ( = ?auto_22079 ?auto_22084 ) ) ( TRUCK-AT ?auto_22085 ?auto_22087 ) ( ON ?auto_22079 ?auto_22078 ) ( not ( = ?auto_22078 ?auto_22079 ) ) ( not ( = ?auto_22078 ?auto_22080 ) ) ( not ( = ?auto_22078 ?auto_22081 ) ) ( not ( = ?auto_22078 ?auto_22084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22079 ?auto_22080 ?auto_22081 )
      ( MAKE-3CRATE-VERIFY ?auto_22078 ?auto_22079 ?auto_22080 ?auto_22081 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22106 - SURFACE
      ?auto_22107 - SURFACE
      ?auto_22108 - SURFACE
      ?auto_22109 - SURFACE
    )
    :vars
    (
      ?auto_22112 - HOIST
      ?auto_22113 - PLACE
      ?auto_22110 - PLACE
      ?auto_22115 - HOIST
      ?auto_22111 - SURFACE
      ?auto_22114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22112 ?auto_22113 ) ( IS-CRATE ?auto_22109 ) ( not ( = ?auto_22108 ?auto_22109 ) ) ( not ( = ?auto_22107 ?auto_22108 ) ) ( not ( = ?auto_22107 ?auto_22109 ) ) ( not ( = ?auto_22110 ?auto_22113 ) ) ( HOIST-AT ?auto_22115 ?auto_22110 ) ( not ( = ?auto_22112 ?auto_22115 ) ) ( AVAILABLE ?auto_22115 ) ( SURFACE-AT ?auto_22109 ?auto_22110 ) ( ON ?auto_22109 ?auto_22111 ) ( CLEAR ?auto_22109 ) ( not ( = ?auto_22108 ?auto_22111 ) ) ( not ( = ?auto_22109 ?auto_22111 ) ) ( not ( = ?auto_22107 ?auto_22111 ) ) ( TRUCK-AT ?auto_22114 ?auto_22113 ) ( SURFACE-AT ?auto_22107 ?auto_22113 ) ( CLEAR ?auto_22107 ) ( LIFTING ?auto_22112 ?auto_22108 ) ( IS-CRATE ?auto_22108 ) ( ON ?auto_22107 ?auto_22106 ) ( not ( = ?auto_22106 ?auto_22107 ) ) ( not ( = ?auto_22106 ?auto_22108 ) ) ( not ( = ?auto_22106 ?auto_22109 ) ) ( not ( = ?auto_22106 ?auto_22111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22107 ?auto_22108 ?auto_22109 )
      ( MAKE-3CRATE-VERIFY ?auto_22106 ?auto_22107 ?auto_22108 ?auto_22109 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22134 - SURFACE
      ?auto_22135 - SURFACE
      ?auto_22136 - SURFACE
      ?auto_22137 - SURFACE
    )
    :vars
    (
      ?auto_22138 - HOIST
      ?auto_22141 - PLACE
      ?auto_22139 - PLACE
      ?auto_22140 - HOIST
      ?auto_22143 - SURFACE
      ?auto_22142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22138 ?auto_22141 ) ( IS-CRATE ?auto_22137 ) ( not ( = ?auto_22136 ?auto_22137 ) ) ( not ( = ?auto_22135 ?auto_22136 ) ) ( not ( = ?auto_22135 ?auto_22137 ) ) ( not ( = ?auto_22139 ?auto_22141 ) ) ( HOIST-AT ?auto_22140 ?auto_22139 ) ( not ( = ?auto_22138 ?auto_22140 ) ) ( AVAILABLE ?auto_22140 ) ( SURFACE-AT ?auto_22137 ?auto_22139 ) ( ON ?auto_22137 ?auto_22143 ) ( CLEAR ?auto_22137 ) ( not ( = ?auto_22136 ?auto_22143 ) ) ( not ( = ?auto_22137 ?auto_22143 ) ) ( not ( = ?auto_22135 ?auto_22143 ) ) ( TRUCK-AT ?auto_22142 ?auto_22141 ) ( SURFACE-AT ?auto_22135 ?auto_22141 ) ( CLEAR ?auto_22135 ) ( IS-CRATE ?auto_22136 ) ( AVAILABLE ?auto_22138 ) ( IN ?auto_22136 ?auto_22142 ) ( ON ?auto_22135 ?auto_22134 ) ( not ( = ?auto_22134 ?auto_22135 ) ) ( not ( = ?auto_22134 ?auto_22136 ) ) ( not ( = ?auto_22134 ?auto_22137 ) ) ( not ( = ?auto_22134 ?auto_22143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22135 ?auto_22136 ?auto_22137 )
      ( MAKE-3CRATE-VERIFY ?auto_22134 ?auto_22135 ?auto_22136 ?auto_22137 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22319 - SURFACE
      ?auto_22320 - SURFACE
    )
    :vars
    (
      ?auto_22323 - HOIST
      ?auto_22322 - PLACE
      ?auto_22325 - SURFACE
      ?auto_22324 - TRUCK
      ?auto_22327 - PLACE
      ?auto_22326 - HOIST
      ?auto_22321 - SURFACE
      ?auto_22328 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22323 ?auto_22322 ) ( SURFACE-AT ?auto_22319 ?auto_22322 ) ( CLEAR ?auto_22319 ) ( IS-CRATE ?auto_22320 ) ( not ( = ?auto_22319 ?auto_22320 ) ) ( AVAILABLE ?auto_22323 ) ( ON ?auto_22319 ?auto_22325 ) ( not ( = ?auto_22325 ?auto_22319 ) ) ( not ( = ?auto_22325 ?auto_22320 ) ) ( TRUCK-AT ?auto_22324 ?auto_22327 ) ( not ( = ?auto_22327 ?auto_22322 ) ) ( HOIST-AT ?auto_22326 ?auto_22327 ) ( not ( = ?auto_22323 ?auto_22326 ) ) ( SURFACE-AT ?auto_22320 ?auto_22327 ) ( ON ?auto_22320 ?auto_22321 ) ( CLEAR ?auto_22320 ) ( not ( = ?auto_22319 ?auto_22321 ) ) ( not ( = ?auto_22320 ?auto_22321 ) ) ( not ( = ?auto_22325 ?auto_22321 ) ) ( LIFTING ?auto_22326 ?auto_22328 ) ( IS-CRATE ?auto_22328 ) ( not ( = ?auto_22319 ?auto_22328 ) ) ( not ( = ?auto_22320 ?auto_22328 ) ) ( not ( = ?auto_22325 ?auto_22328 ) ) ( not ( = ?auto_22321 ?auto_22328 ) ) )
    :subtasks
    ( ( !LOAD ?auto_22326 ?auto_22328 ?auto_22324 ?auto_22327 )
      ( MAKE-1CRATE ?auto_22319 ?auto_22320 )
      ( MAKE-1CRATE-VERIFY ?auto_22319 ?auto_22320 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22427 - SURFACE
      ?auto_22428 - SURFACE
      ?auto_22429 - SURFACE
      ?auto_22430 - SURFACE
      ?auto_22431 - SURFACE
    )
    :vars
    (
      ?auto_22432 - HOIST
      ?auto_22433 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22432 ?auto_22433 ) ( SURFACE-AT ?auto_22430 ?auto_22433 ) ( CLEAR ?auto_22430 ) ( LIFTING ?auto_22432 ?auto_22431 ) ( IS-CRATE ?auto_22431 ) ( not ( = ?auto_22430 ?auto_22431 ) ) ( ON ?auto_22428 ?auto_22427 ) ( ON ?auto_22429 ?auto_22428 ) ( ON ?auto_22430 ?auto_22429 ) ( not ( = ?auto_22427 ?auto_22428 ) ) ( not ( = ?auto_22427 ?auto_22429 ) ) ( not ( = ?auto_22427 ?auto_22430 ) ) ( not ( = ?auto_22427 ?auto_22431 ) ) ( not ( = ?auto_22428 ?auto_22429 ) ) ( not ( = ?auto_22428 ?auto_22430 ) ) ( not ( = ?auto_22428 ?auto_22431 ) ) ( not ( = ?auto_22429 ?auto_22430 ) ) ( not ( = ?auto_22429 ?auto_22431 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22430 ?auto_22431 )
      ( MAKE-4CRATE-VERIFY ?auto_22427 ?auto_22428 ?auto_22429 ?auto_22430 ?auto_22431 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22452 - SURFACE
      ?auto_22453 - SURFACE
      ?auto_22454 - SURFACE
      ?auto_22455 - SURFACE
      ?auto_22456 - SURFACE
    )
    :vars
    (
      ?auto_22458 - HOIST
      ?auto_22459 - PLACE
      ?auto_22457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22458 ?auto_22459 ) ( SURFACE-AT ?auto_22455 ?auto_22459 ) ( CLEAR ?auto_22455 ) ( IS-CRATE ?auto_22456 ) ( not ( = ?auto_22455 ?auto_22456 ) ) ( TRUCK-AT ?auto_22457 ?auto_22459 ) ( AVAILABLE ?auto_22458 ) ( IN ?auto_22456 ?auto_22457 ) ( ON ?auto_22455 ?auto_22454 ) ( not ( = ?auto_22454 ?auto_22455 ) ) ( not ( = ?auto_22454 ?auto_22456 ) ) ( ON ?auto_22453 ?auto_22452 ) ( ON ?auto_22454 ?auto_22453 ) ( not ( = ?auto_22452 ?auto_22453 ) ) ( not ( = ?auto_22452 ?auto_22454 ) ) ( not ( = ?auto_22452 ?auto_22455 ) ) ( not ( = ?auto_22452 ?auto_22456 ) ) ( not ( = ?auto_22453 ?auto_22454 ) ) ( not ( = ?auto_22453 ?auto_22455 ) ) ( not ( = ?auto_22453 ?auto_22456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22454 ?auto_22455 ?auto_22456 )
      ( MAKE-4CRATE-VERIFY ?auto_22452 ?auto_22453 ?auto_22454 ?auto_22455 ?auto_22456 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22482 - SURFACE
      ?auto_22483 - SURFACE
      ?auto_22484 - SURFACE
      ?auto_22485 - SURFACE
      ?auto_22486 - SURFACE
    )
    :vars
    (
      ?auto_22487 - HOIST
      ?auto_22488 - PLACE
      ?auto_22490 - TRUCK
      ?auto_22489 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22487 ?auto_22488 ) ( SURFACE-AT ?auto_22485 ?auto_22488 ) ( CLEAR ?auto_22485 ) ( IS-CRATE ?auto_22486 ) ( not ( = ?auto_22485 ?auto_22486 ) ) ( AVAILABLE ?auto_22487 ) ( IN ?auto_22486 ?auto_22490 ) ( ON ?auto_22485 ?auto_22484 ) ( not ( = ?auto_22484 ?auto_22485 ) ) ( not ( = ?auto_22484 ?auto_22486 ) ) ( TRUCK-AT ?auto_22490 ?auto_22489 ) ( not ( = ?auto_22489 ?auto_22488 ) ) ( ON ?auto_22483 ?auto_22482 ) ( ON ?auto_22484 ?auto_22483 ) ( not ( = ?auto_22482 ?auto_22483 ) ) ( not ( = ?auto_22482 ?auto_22484 ) ) ( not ( = ?auto_22482 ?auto_22485 ) ) ( not ( = ?auto_22482 ?auto_22486 ) ) ( not ( = ?auto_22483 ?auto_22484 ) ) ( not ( = ?auto_22483 ?auto_22485 ) ) ( not ( = ?auto_22483 ?auto_22486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22484 ?auto_22485 ?auto_22486 )
      ( MAKE-4CRATE-VERIFY ?auto_22482 ?auto_22483 ?auto_22484 ?auto_22485 ?auto_22486 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22516 - SURFACE
      ?auto_22517 - SURFACE
      ?auto_22518 - SURFACE
      ?auto_22519 - SURFACE
      ?auto_22520 - SURFACE
    )
    :vars
    (
      ?auto_22522 - HOIST
      ?auto_22523 - PLACE
      ?auto_22524 - TRUCK
      ?auto_22525 - PLACE
      ?auto_22521 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22522 ?auto_22523 ) ( SURFACE-AT ?auto_22519 ?auto_22523 ) ( CLEAR ?auto_22519 ) ( IS-CRATE ?auto_22520 ) ( not ( = ?auto_22519 ?auto_22520 ) ) ( AVAILABLE ?auto_22522 ) ( ON ?auto_22519 ?auto_22518 ) ( not ( = ?auto_22518 ?auto_22519 ) ) ( not ( = ?auto_22518 ?auto_22520 ) ) ( TRUCK-AT ?auto_22524 ?auto_22525 ) ( not ( = ?auto_22525 ?auto_22523 ) ) ( HOIST-AT ?auto_22521 ?auto_22525 ) ( LIFTING ?auto_22521 ?auto_22520 ) ( not ( = ?auto_22522 ?auto_22521 ) ) ( ON ?auto_22517 ?auto_22516 ) ( ON ?auto_22518 ?auto_22517 ) ( not ( = ?auto_22516 ?auto_22517 ) ) ( not ( = ?auto_22516 ?auto_22518 ) ) ( not ( = ?auto_22516 ?auto_22519 ) ) ( not ( = ?auto_22516 ?auto_22520 ) ) ( not ( = ?auto_22517 ?auto_22518 ) ) ( not ( = ?auto_22517 ?auto_22519 ) ) ( not ( = ?auto_22517 ?auto_22520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22518 ?auto_22519 ?auto_22520 )
      ( MAKE-4CRATE-VERIFY ?auto_22516 ?auto_22517 ?auto_22518 ?auto_22519 ?auto_22520 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22554 - SURFACE
      ?auto_22555 - SURFACE
      ?auto_22556 - SURFACE
      ?auto_22557 - SURFACE
      ?auto_22558 - SURFACE
    )
    :vars
    (
      ?auto_22562 - HOIST
      ?auto_22559 - PLACE
      ?auto_22560 - TRUCK
      ?auto_22563 - PLACE
      ?auto_22564 - HOIST
      ?auto_22561 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22562 ?auto_22559 ) ( SURFACE-AT ?auto_22557 ?auto_22559 ) ( CLEAR ?auto_22557 ) ( IS-CRATE ?auto_22558 ) ( not ( = ?auto_22557 ?auto_22558 ) ) ( AVAILABLE ?auto_22562 ) ( ON ?auto_22557 ?auto_22556 ) ( not ( = ?auto_22556 ?auto_22557 ) ) ( not ( = ?auto_22556 ?auto_22558 ) ) ( TRUCK-AT ?auto_22560 ?auto_22563 ) ( not ( = ?auto_22563 ?auto_22559 ) ) ( HOIST-AT ?auto_22564 ?auto_22563 ) ( not ( = ?auto_22562 ?auto_22564 ) ) ( AVAILABLE ?auto_22564 ) ( SURFACE-AT ?auto_22558 ?auto_22563 ) ( ON ?auto_22558 ?auto_22561 ) ( CLEAR ?auto_22558 ) ( not ( = ?auto_22557 ?auto_22561 ) ) ( not ( = ?auto_22558 ?auto_22561 ) ) ( not ( = ?auto_22556 ?auto_22561 ) ) ( ON ?auto_22555 ?auto_22554 ) ( ON ?auto_22556 ?auto_22555 ) ( not ( = ?auto_22554 ?auto_22555 ) ) ( not ( = ?auto_22554 ?auto_22556 ) ) ( not ( = ?auto_22554 ?auto_22557 ) ) ( not ( = ?auto_22554 ?auto_22558 ) ) ( not ( = ?auto_22554 ?auto_22561 ) ) ( not ( = ?auto_22555 ?auto_22556 ) ) ( not ( = ?auto_22555 ?auto_22557 ) ) ( not ( = ?auto_22555 ?auto_22558 ) ) ( not ( = ?auto_22555 ?auto_22561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22556 ?auto_22557 ?auto_22558 )
      ( MAKE-4CRATE-VERIFY ?auto_22554 ?auto_22555 ?auto_22556 ?auto_22557 ?auto_22558 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22593 - SURFACE
      ?auto_22594 - SURFACE
      ?auto_22595 - SURFACE
      ?auto_22596 - SURFACE
      ?auto_22597 - SURFACE
    )
    :vars
    (
      ?auto_22598 - HOIST
      ?auto_22600 - PLACE
      ?auto_22599 - PLACE
      ?auto_22603 - HOIST
      ?auto_22601 - SURFACE
      ?auto_22602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22598 ?auto_22600 ) ( SURFACE-AT ?auto_22596 ?auto_22600 ) ( CLEAR ?auto_22596 ) ( IS-CRATE ?auto_22597 ) ( not ( = ?auto_22596 ?auto_22597 ) ) ( AVAILABLE ?auto_22598 ) ( ON ?auto_22596 ?auto_22595 ) ( not ( = ?auto_22595 ?auto_22596 ) ) ( not ( = ?auto_22595 ?auto_22597 ) ) ( not ( = ?auto_22599 ?auto_22600 ) ) ( HOIST-AT ?auto_22603 ?auto_22599 ) ( not ( = ?auto_22598 ?auto_22603 ) ) ( AVAILABLE ?auto_22603 ) ( SURFACE-AT ?auto_22597 ?auto_22599 ) ( ON ?auto_22597 ?auto_22601 ) ( CLEAR ?auto_22597 ) ( not ( = ?auto_22596 ?auto_22601 ) ) ( not ( = ?auto_22597 ?auto_22601 ) ) ( not ( = ?auto_22595 ?auto_22601 ) ) ( TRUCK-AT ?auto_22602 ?auto_22600 ) ( ON ?auto_22594 ?auto_22593 ) ( ON ?auto_22595 ?auto_22594 ) ( not ( = ?auto_22593 ?auto_22594 ) ) ( not ( = ?auto_22593 ?auto_22595 ) ) ( not ( = ?auto_22593 ?auto_22596 ) ) ( not ( = ?auto_22593 ?auto_22597 ) ) ( not ( = ?auto_22593 ?auto_22601 ) ) ( not ( = ?auto_22594 ?auto_22595 ) ) ( not ( = ?auto_22594 ?auto_22596 ) ) ( not ( = ?auto_22594 ?auto_22597 ) ) ( not ( = ?auto_22594 ?auto_22601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22595 ?auto_22596 ?auto_22597 )
      ( MAKE-4CRATE-VERIFY ?auto_22593 ?auto_22594 ?auto_22595 ?auto_22596 ?auto_22597 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22632 - SURFACE
      ?auto_22633 - SURFACE
      ?auto_22634 - SURFACE
      ?auto_22635 - SURFACE
      ?auto_22636 - SURFACE
    )
    :vars
    (
      ?auto_22639 - HOIST
      ?auto_22641 - PLACE
      ?auto_22637 - PLACE
      ?auto_22638 - HOIST
      ?auto_22640 - SURFACE
      ?auto_22642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22639 ?auto_22641 ) ( IS-CRATE ?auto_22636 ) ( not ( = ?auto_22635 ?auto_22636 ) ) ( not ( = ?auto_22634 ?auto_22635 ) ) ( not ( = ?auto_22634 ?auto_22636 ) ) ( not ( = ?auto_22637 ?auto_22641 ) ) ( HOIST-AT ?auto_22638 ?auto_22637 ) ( not ( = ?auto_22639 ?auto_22638 ) ) ( AVAILABLE ?auto_22638 ) ( SURFACE-AT ?auto_22636 ?auto_22637 ) ( ON ?auto_22636 ?auto_22640 ) ( CLEAR ?auto_22636 ) ( not ( = ?auto_22635 ?auto_22640 ) ) ( not ( = ?auto_22636 ?auto_22640 ) ) ( not ( = ?auto_22634 ?auto_22640 ) ) ( TRUCK-AT ?auto_22642 ?auto_22641 ) ( SURFACE-AT ?auto_22634 ?auto_22641 ) ( CLEAR ?auto_22634 ) ( LIFTING ?auto_22639 ?auto_22635 ) ( IS-CRATE ?auto_22635 ) ( ON ?auto_22633 ?auto_22632 ) ( ON ?auto_22634 ?auto_22633 ) ( not ( = ?auto_22632 ?auto_22633 ) ) ( not ( = ?auto_22632 ?auto_22634 ) ) ( not ( = ?auto_22632 ?auto_22635 ) ) ( not ( = ?auto_22632 ?auto_22636 ) ) ( not ( = ?auto_22632 ?auto_22640 ) ) ( not ( = ?auto_22633 ?auto_22634 ) ) ( not ( = ?auto_22633 ?auto_22635 ) ) ( not ( = ?auto_22633 ?auto_22636 ) ) ( not ( = ?auto_22633 ?auto_22640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22634 ?auto_22635 ?auto_22636 )
      ( MAKE-4CRATE-VERIFY ?auto_22632 ?auto_22633 ?auto_22634 ?auto_22635 ?auto_22636 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22671 - SURFACE
      ?auto_22672 - SURFACE
      ?auto_22673 - SURFACE
      ?auto_22674 - SURFACE
      ?auto_22675 - SURFACE
    )
    :vars
    (
      ?auto_22676 - HOIST
      ?auto_22677 - PLACE
      ?auto_22678 - PLACE
      ?auto_22679 - HOIST
      ?auto_22680 - SURFACE
      ?auto_22681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22676 ?auto_22677 ) ( IS-CRATE ?auto_22675 ) ( not ( = ?auto_22674 ?auto_22675 ) ) ( not ( = ?auto_22673 ?auto_22674 ) ) ( not ( = ?auto_22673 ?auto_22675 ) ) ( not ( = ?auto_22678 ?auto_22677 ) ) ( HOIST-AT ?auto_22679 ?auto_22678 ) ( not ( = ?auto_22676 ?auto_22679 ) ) ( AVAILABLE ?auto_22679 ) ( SURFACE-AT ?auto_22675 ?auto_22678 ) ( ON ?auto_22675 ?auto_22680 ) ( CLEAR ?auto_22675 ) ( not ( = ?auto_22674 ?auto_22680 ) ) ( not ( = ?auto_22675 ?auto_22680 ) ) ( not ( = ?auto_22673 ?auto_22680 ) ) ( TRUCK-AT ?auto_22681 ?auto_22677 ) ( SURFACE-AT ?auto_22673 ?auto_22677 ) ( CLEAR ?auto_22673 ) ( IS-CRATE ?auto_22674 ) ( AVAILABLE ?auto_22676 ) ( IN ?auto_22674 ?auto_22681 ) ( ON ?auto_22672 ?auto_22671 ) ( ON ?auto_22673 ?auto_22672 ) ( not ( = ?auto_22671 ?auto_22672 ) ) ( not ( = ?auto_22671 ?auto_22673 ) ) ( not ( = ?auto_22671 ?auto_22674 ) ) ( not ( = ?auto_22671 ?auto_22675 ) ) ( not ( = ?auto_22671 ?auto_22680 ) ) ( not ( = ?auto_22672 ?auto_22673 ) ) ( not ( = ?auto_22672 ?auto_22674 ) ) ( not ( = ?auto_22672 ?auto_22675 ) ) ( not ( = ?auto_22672 ?auto_22680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22673 ?auto_22674 ?auto_22675 )
      ( MAKE-4CRATE-VERIFY ?auto_22671 ?auto_22672 ?auto_22673 ?auto_22674 ?auto_22675 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22682 - SURFACE
      ?auto_22683 - SURFACE
    )
    :vars
    (
      ?auto_22684 - HOIST
      ?auto_22685 - PLACE
      ?auto_22688 - SURFACE
      ?auto_22686 - PLACE
      ?auto_22687 - HOIST
      ?auto_22689 - SURFACE
      ?auto_22690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22684 ?auto_22685 ) ( IS-CRATE ?auto_22683 ) ( not ( = ?auto_22682 ?auto_22683 ) ) ( not ( = ?auto_22688 ?auto_22682 ) ) ( not ( = ?auto_22688 ?auto_22683 ) ) ( not ( = ?auto_22686 ?auto_22685 ) ) ( HOIST-AT ?auto_22687 ?auto_22686 ) ( not ( = ?auto_22684 ?auto_22687 ) ) ( AVAILABLE ?auto_22687 ) ( SURFACE-AT ?auto_22683 ?auto_22686 ) ( ON ?auto_22683 ?auto_22689 ) ( CLEAR ?auto_22683 ) ( not ( = ?auto_22682 ?auto_22689 ) ) ( not ( = ?auto_22683 ?auto_22689 ) ) ( not ( = ?auto_22688 ?auto_22689 ) ) ( SURFACE-AT ?auto_22688 ?auto_22685 ) ( CLEAR ?auto_22688 ) ( IS-CRATE ?auto_22682 ) ( AVAILABLE ?auto_22684 ) ( IN ?auto_22682 ?auto_22690 ) ( TRUCK-AT ?auto_22690 ?auto_22686 ) )
    :subtasks
    ( ( !DRIVE ?auto_22690 ?auto_22686 ?auto_22685 )
      ( MAKE-2CRATE ?auto_22688 ?auto_22682 ?auto_22683 )
      ( MAKE-1CRATE-VERIFY ?auto_22682 ?auto_22683 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22691 - SURFACE
      ?auto_22692 - SURFACE
      ?auto_22693 - SURFACE
    )
    :vars
    (
      ?auto_22696 - HOIST
      ?auto_22695 - PLACE
      ?auto_22699 - PLACE
      ?auto_22694 - HOIST
      ?auto_22698 - SURFACE
      ?auto_22697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22696 ?auto_22695 ) ( IS-CRATE ?auto_22693 ) ( not ( = ?auto_22692 ?auto_22693 ) ) ( not ( = ?auto_22691 ?auto_22692 ) ) ( not ( = ?auto_22691 ?auto_22693 ) ) ( not ( = ?auto_22699 ?auto_22695 ) ) ( HOIST-AT ?auto_22694 ?auto_22699 ) ( not ( = ?auto_22696 ?auto_22694 ) ) ( AVAILABLE ?auto_22694 ) ( SURFACE-AT ?auto_22693 ?auto_22699 ) ( ON ?auto_22693 ?auto_22698 ) ( CLEAR ?auto_22693 ) ( not ( = ?auto_22692 ?auto_22698 ) ) ( not ( = ?auto_22693 ?auto_22698 ) ) ( not ( = ?auto_22691 ?auto_22698 ) ) ( SURFACE-AT ?auto_22691 ?auto_22695 ) ( CLEAR ?auto_22691 ) ( IS-CRATE ?auto_22692 ) ( AVAILABLE ?auto_22696 ) ( IN ?auto_22692 ?auto_22697 ) ( TRUCK-AT ?auto_22697 ?auto_22699 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22692 ?auto_22693 )
      ( MAKE-2CRATE-VERIFY ?auto_22691 ?auto_22692 ?auto_22693 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22700 - SURFACE
      ?auto_22701 - SURFACE
      ?auto_22702 - SURFACE
      ?auto_22703 - SURFACE
    )
    :vars
    (
      ?auto_22705 - HOIST
      ?auto_22709 - PLACE
      ?auto_22704 - PLACE
      ?auto_22708 - HOIST
      ?auto_22706 - SURFACE
      ?auto_22707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22705 ?auto_22709 ) ( IS-CRATE ?auto_22703 ) ( not ( = ?auto_22702 ?auto_22703 ) ) ( not ( = ?auto_22701 ?auto_22702 ) ) ( not ( = ?auto_22701 ?auto_22703 ) ) ( not ( = ?auto_22704 ?auto_22709 ) ) ( HOIST-AT ?auto_22708 ?auto_22704 ) ( not ( = ?auto_22705 ?auto_22708 ) ) ( AVAILABLE ?auto_22708 ) ( SURFACE-AT ?auto_22703 ?auto_22704 ) ( ON ?auto_22703 ?auto_22706 ) ( CLEAR ?auto_22703 ) ( not ( = ?auto_22702 ?auto_22706 ) ) ( not ( = ?auto_22703 ?auto_22706 ) ) ( not ( = ?auto_22701 ?auto_22706 ) ) ( SURFACE-AT ?auto_22701 ?auto_22709 ) ( CLEAR ?auto_22701 ) ( IS-CRATE ?auto_22702 ) ( AVAILABLE ?auto_22705 ) ( IN ?auto_22702 ?auto_22707 ) ( TRUCK-AT ?auto_22707 ?auto_22704 ) ( ON ?auto_22701 ?auto_22700 ) ( not ( = ?auto_22700 ?auto_22701 ) ) ( not ( = ?auto_22700 ?auto_22702 ) ) ( not ( = ?auto_22700 ?auto_22703 ) ) ( not ( = ?auto_22700 ?auto_22706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22701 ?auto_22702 ?auto_22703 )
      ( MAKE-3CRATE-VERIFY ?auto_22700 ?auto_22701 ?auto_22702 ?auto_22703 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22710 - SURFACE
      ?auto_22711 - SURFACE
      ?auto_22712 - SURFACE
      ?auto_22713 - SURFACE
      ?auto_22714 - SURFACE
    )
    :vars
    (
      ?auto_22716 - HOIST
      ?auto_22720 - PLACE
      ?auto_22715 - PLACE
      ?auto_22719 - HOIST
      ?auto_22717 - SURFACE
      ?auto_22718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22716 ?auto_22720 ) ( IS-CRATE ?auto_22714 ) ( not ( = ?auto_22713 ?auto_22714 ) ) ( not ( = ?auto_22712 ?auto_22713 ) ) ( not ( = ?auto_22712 ?auto_22714 ) ) ( not ( = ?auto_22715 ?auto_22720 ) ) ( HOIST-AT ?auto_22719 ?auto_22715 ) ( not ( = ?auto_22716 ?auto_22719 ) ) ( AVAILABLE ?auto_22719 ) ( SURFACE-AT ?auto_22714 ?auto_22715 ) ( ON ?auto_22714 ?auto_22717 ) ( CLEAR ?auto_22714 ) ( not ( = ?auto_22713 ?auto_22717 ) ) ( not ( = ?auto_22714 ?auto_22717 ) ) ( not ( = ?auto_22712 ?auto_22717 ) ) ( SURFACE-AT ?auto_22712 ?auto_22720 ) ( CLEAR ?auto_22712 ) ( IS-CRATE ?auto_22713 ) ( AVAILABLE ?auto_22716 ) ( IN ?auto_22713 ?auto_22718 ) ( TRUCK-AT ?auto_22718 ?auto_22715 ) ( ON ?auto_22711 ?auto_22710 ) ( ON ?auto_22712 ?auto_22711 ) ( not ( = ?auto_22710 ?auto_22711 ) ) ( not ( = ?auto_22710 ?auto_22712 ) ) ( not ( = ?auto_22710 ?auto_22713 ) ) ( not ( = ?auto_22710 ?auto_22714 ) ) ( not ( = ?auto_22710 ?auto_22717 ) ) ( not ( = ?auto_22711 ?auto_22712 ) ) ( not ( = ?auto_22711 ?auto_22713 ) ) ( not ( = ?auto_22711 ?auto_22714 ) ) ( not ( = ?auto_22711 ?auto_22717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22712 ?auto_22713 ?auto_22714 )
      ( MAKE-4CRATE-VERIFY ?auto_22710 ?auto_22711 ?auto_22712 ?auto_22713 ?auto_22714 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22721 - SURFACE
      ?auto_22722 - SURFACE
    )
    :vars
    (
      ?auto_22725 - HOIST
      ?auto_22729 - PLACE
      ?auto_22724 - SURFACE
      ?auto_22723 - PLACE
      ?auto_22728 - HOIST
      ?auto_22726 - SURFACE
      ?auto_22727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22725 ?auto_22729 ) ( IS-CRATE ?auto_22722 ) ( not ( = ?auto_22721 ?auto_22722 ) ) ( not ( = ?auto_22724 ?auto_22721 ) ) ( not ( = ?auto_22724 ?auto_22722 ) ) ( not ( = ?auto_22723 ?auto_22729 ) ) ( HOIST-AT ?auto_22728 ?auto_22723 ) ( not ( = ?auto_22725 ?auto_22728 ) ) ( SURFACE-AT ?auto_22722 ?auto_22723 ) ( ON ?auto_22722 ?auto_22726 ) ( CLEAR ?auto_22722 ) ( not ( = ?auto_22721 ?auto_22726 ) ) ( not ( = ?auto_22722 ?auto_22726 ) ) ( not ( = ?auto_22724 ?auto_22726 ) ) ( SURFACE-AT ?auto_22724 ?auto_22729 ) ( CLEAR ?auto_22724 ) ( IS-CRATE ?auto_22721 ) ( AVAILABLE ?auto_22725 ) ( TRUCK-AT ?auto_22727 ?auto_22723 ) ( LIFTING ?auto_22728 ?auto_22721 ) )
    :subtasks
    ( ( !LOAD ?auto_22728 ?auto_22721 ?auto_22727 ?auto_22723 )
      ( MAKE-2CRATE ?auto_22724 ?auto_22721 ?auto_22722 )
      ( MAKE-1CRATE-VERIFY ?auto_22721 ?auto_22722 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22730 - SURFACE
      ?auto_22731 - SURFACE
      ?auto_22732 - SURFACE
    )
    :vars
    (
      ?auto_22734 - HOIST
      ?auto_22737 - PLACE
      ?auto_22733 - PLACE
      ?auto_22738 - HOIST
      ?auto_22736 - SURFACE
      ?auto_22735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22734 ?auto_22737 ) ( IS-CRATE ?auto_22732 ) ( not ( = ?auto_22731 ?auto_22732 ) ) ( not ( = ?auto_22730 ?auto_22731 ) ) ( not ( = ?auto_22730 ?auto_22732 ) ) ( not ( = ?auto_22733 ?auto_22737 ) ) ( HOIST-AT ?auto_22738 ?auto_22733 ) ( not ( = ?auto_22734 ?auto_22738 ) ) ( SURFACE-AT ?auto_22732 ?auto_22733 ) ( ON ?auto_22732 ?auto_22736 ) ( CLEAR ?auto_22732 ) ( not ( = ?auto_22731 ?auto_22736 ) ) ( not ( = ?auto_22732 ?auto_22736 ) ) ( not ( = ?auto_22730 ?auto_22736 ) ) ( SURFACE-AT ?auto_22730 ?auto_22737 ) ( CLEAR ?auto_22730 ) ( IS-CRATE ?auto_22731 ) ( AVAILABLE ?auto_22734 ) ( TRUCK-AT ?auto_22735 ?auto_22733 ) ( LIFTING ?auto_22738 ?auto_22731 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22731 ?auto_22732 )
      ( MAKE-2CRATE-VERIFY ?auto_22730 ?auto_22731 ?auto_22732 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22739 - SURFACE
      ?auto_22740 - SURFACE
      ?auto_22741 - SURFACE
      ?auto_22742 - SURFACE
    )
    :vars
    (
      ?auto_22744 - HOIST
      ?auto_22743 - PLACE
      ?auto_22745 - PLACE
      ?auto_22746 - HOIST
      ?auto_22748 - SURFACE
      ?auto_22747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22744 ?auto_22743 ) ( IS-CRATE ?auto_22742 ) ( not ( = ?auto_22741 ?auto_22742 ) ) ( not ( = ?auto_22740 ?auto_22741 ) ) ( not ( = ?auto_22740 ?auto_22742 ) ) ( not ( = ?auto_22745 ?auto_22743 ) ) ( HOIST-AT ?auto_22746 ?auto_22745 ) ( not ( = ?auto_22744 ?auto_22746 ) ) ( SURFACE-AT ?auto_22742 ?auto_22745 ) ( ON ?auto_22742 ?auto_22748 ) ( CLEAR ?auto_22742 ) ( not ( = ?auto_22741 ?auto_22748 ) ) ( not ( = ?auto_22742 ?auto_22748 ) ) ( not ( = ?auto_22740 ?auto_22748 ) ) ( SURFACE-AT ?auto_22740 ?auto_22743 ) ( CLEAR ?auto_22740 ) ( IS-CRATE ?auto_22741 ) ( AVAILABLE ?auto_22744 ) ( TRUCK-AT ?auto_22747 ?auto_22745 ) ( LIFTING ?auto_22746 ?auto_22741 ) ( ON ?auto_22740 ?auto_22739 ) ( not ( = ?auto_22739 ?auto_22740 ) ) ( not ( = ?auto_22739 ?auto_22741 ) ) ( not ( = ?auto_22739 ?auto_22742 ) ) ( not ( = ?auto_22739 ?auto_22748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22740 ?auto_22741 ?auto_22742 )
      ( MAKE-3CRATE-VERIFY ?auto_22739 ?auto_22740 ?auto_22741 ?auto_22742 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22749 - SURFACE
      ?auto_22750 - SURFACE
      ?auto_22751 - SURFACE
      ?auto_22752 - SURFACE
      ?auto_22753 - SURFACE
    )
    :vars
    (
      ?auto_22755 - HOIST
      ?auto_22754 - PLACE
      ?auto_22756 - PLACE
      ?auto_22757 - HOIST
      ?auto_22759 - SURFACE
      ?auto_22758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22755 ?auto_22754 ) ( IS-CRATE ?auto_22753 ) ( not ( = ?auto_22752 ?auto_22753 ) ) ( not ( = ?auto_22751 ?auto_22752 ) ) ( not ( = ?auto_22751 ?auto_22753 ) ) ( not ( = ?auto_22756 ?auto_22754 ) ) ( HOIST-AT ?auto_22757 ?auto_22756 ) ( not ( = ?auto_22755 ?auto_22757 ) ) ( SURFACE-AT ?auto_22753 ?auto_22756 ) ( ON ?auto_22753 ?auto_22759 ) ( CLEAR ?auto_22753 ) ( not ( = ?auto_22752 ?auto_22759 ) ) ( not ( = ?auto_22753 ?auto_22759 ) ) ( not ( = ?auto_22751 ?auto_22759 ) ) ( SURFACE-AT ?auto_22751 ?auto_22754 ) ( CLEAR ?auto_22751 ) ( IS-CRATE ?auto_22752 ) ( AVAILABLE ?auto_22755 ) ( TRUCK-AT ?auto_22758 ?auto_22756 ) ( LIFTING ?auto_22757 ?auto_22752 ) ( ON ?auto_22750 ?auto_22749 ) ( ON ?auto_22751 ?auto_22750 ) ( not ( = ?auto_22749 ?auto_22750 ) ) ( not ( = ?auto_22749 ?auto_22751 ) ) ( not ( = ?auto_22749 ?auto_22752 ) ) ( not ( = ?auto_22749 ?auto_22753 ) ) ( not ( = ?auto_22749 ?auto_22759 ) ) ( not ( = ?auto_22750 ?auto_22751 ) ) ( not ( = ?auto_22750 ?auto_22752 ) ) ( not ( = ?auto_22750 ?auto_22753 ) ) ( not ( = ?auto_22750 ?auto_22759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22751 ?auto_22752 ?auto_22753 )
      ( MAKE-4CRATE-VERIFY ?auto_22749 ?auto_22750 ?auto_22751 ?auto_22752 ?auto_22753 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22760 - SURFACE
      ?auto_22761 - SURFACE
    )
    :vars
    (
      ?auto_22763 - HOIST
      ?auto_22762 - PLACE
      ?auto_22768 - SURFACE
      ?auto_22764 - PLACE
      ?auto_22765 - HOIST
      ?auto_22767 - SURFACE
      ?auto_22766 - TRUCK
      ?auto_22769 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22763 ?auto_22762 ) ( IS-CRATE ?auto_22761 ) ( not ( = ?auto_22760 ?auto_22761 ) ) ( not ( = ?auto_22768 ?auto_22760 ) ) ( not ( = ?auto_22768 ?auto_22761 ) ) ( not ( = ?auto_22764 ?auto_22762 ) ) ( HOIST-AT ?auto_22765 ?auto_22764 ) ( not ( = ?auto_22763 ?auto_22765 ) ) ( SURFACE-AT ?auto_22761 ?auto_22764 ) ( ON ?auto_22761 ?auto_22767 ) ( CLEAR ?auto_22761 ) ( not ( = ?auto_22760 ?auto_22767 ) ) ( not ( = ?auto_22761 ?auto_22767 ) ) ( not ( = ?auto_22768 ?auto_22767 ) ) ( SURFACE-AT ?auto_22768 ?auto_22762 ) ( CLEAR ?auto_22768 ) ( IS-CRATE ?auto_22760 ) ( AVAILABLE ?auto_22763 ) ( TRUCK-AT ?auto_22766 ?auto_22764 ) ( AVAILABLE ?auto_22765 ) ( SURFACE-AT ?auto_22760 ?auto_22764 ) ( ON ?auto_22760 ?auto_22769 ) ( CLEAR ?auto_22760 ) ( not ( = ?auto_22760 ?auto_22769 ) ) ( not ( = ?auto_22761 ?auto_22769 ) ) ( not ( = ?auto_22768 ?auto_22769 ) ) ( not ( = ?auto_22767 ?auto_22769 ) ) )
    :subtasks
    ( ( !LIFT ?auto_22765 ?auto_22760 ?auto_22769 ?auto_22764 )
      ( MAKE-2CRATE ?auto_22768 ?auto_22760 ?auto_22761 )
      ( MAKE-1CRATE-VERIFY ?auto_22760 ?auto_22761 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22770 - SURFACE
      ?auto_22771 - SURFACE
      ?auto_22772 - SURFACE
    )
    :vars
    (
      ?auto_22776 - HOIST
      ?auto_22775 - PLACE
      ?auto_22778 - PLACE
      ?auto_22774 - HOIST
      ?auto_22779 - SURFACE
      ?auto_22773 - TRUCK
      ?auto_22777 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22776 ?auto_22775 ) ( IS-CRATE ?auto_22772 ) ( not ( = ?auto_22771 ?auto_22772 ) ) ( not ( = ?auto_22770 ?auto_22771 ) ) ( not ( = ?auto_22770 ?auto_22772 ) ) ( not ( = ?auto_22778 ?auto_22775 ) ) ( HOIST-AT ?auto_22774 ?auto_22778 ) ( not ( = ?auto_22776 ?auto_22774 ) ) ( SURFACE-AT ?auto_22772 ?auto_22778 ) ( ON ?auto_22772 ?auto_22779 ) ( CLEAR ?auto_22772 ) ( not ( = ?auto_22771 ?auto_22779 ) ) ( not ( = ?auto_22772 ?auto_22779 ) ) ( not ( = ?auto_22770 ?auto_22779 ) ) ( SURFACE-AT ?auto_22770 ?auto_22775 ) ( CLEAR ?auto_22770 ) ( IS-CRATE ?auto_22771 ) ( AVAILABLE ?auto_22776 ) ( TRUCK-AT ?auto_22773 ?auto_22778 ) ( AVAILABLE ?auto_22774 ) ( SURFACE-AT ?auto_22771 ?auto_22778 ) ( ON ?auto_22771 ?auto_22777 ) ( CLEAR ?auto_22771 ) ( not ( = ?auto_22771 ?auto_22777 ) ) ( not ( = ?auto_22772 ?auto_22777 ) ) ( not ( = ?auto_22770 ?auto_22777 ) ) ( not ( = ?auto_22779 ?auto_22777 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22771 ?auto_22772 )
      ( MAKE-2CRATE-VERIFY ?auto_22770 ?auto_22771 ?auto_22772 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22780 - SURFACE
      ?auto_22781 - SURFACE
      ?auto_22782 - SURFACE
      ?auto_22783 - SURFACE
    )
    :vars
    (
      ?auto_22785 - HOIST
      ?auto_22786 - PLACE
      ?auto_22789 - PLACE
      ?auto_22790 - HOIST
      ?auto_22788 - SURFACE
      ?auto_22784 - TRUCK
      ?auto_22787 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22785 ?auto_22786 ) ( IS-CRATE ?auto_22783 ) ( not ( = ?auto_22782 ?auto_22783 ) ) ( not ( = ?auto_22781 ?auto_22782 ) ) ( not ( = ?auto_22781 ?auto_22783 ) ) ( not ( = ?auto_22789 ?auto_22786 ) ) ( HOIST-AT ?auto_22790 ?auto_22789 ) ( not ( = ?auto_22785 ?auto_22790 ) ) ( SURFACE-AT ?auto_22783 ?auto_22789 ) ( ON ?auto_22783 ?auto_22788 ) ( CLEAR ?auto_22783 ) ( not ( = ?auto_22782 ?auto_22788 ) ) ( not ( = ?auto_22783 ?auto_22788 ) ) ( not ( = ?auto_22781 ?auto_22788 ) ) ( SURFACE-AT ?auto_22781 ?auto_22786 ) ( CLEAR ?auto_22781 ) ( IS-CRATE ?auto_22782 ) ( AVAILABLE ?auto_22785 ) ( TRUCK-AT ?auto_22784 ?auto_22789 ) ( AVAILABLE ?auto_22790 ) ( SURFACE-AT ?auto_22782 ?auto_22789 ) ( ON ?auto_22782 ?auto_22787 ) ( CLEAR ?auto_22782 ) ( not ( = ?auto_22782 ?auto_22787 ) ) ( not ( = ?auto_22783 ?auto_22787 ) ) ( not ( = ?auto_22781 ?auto_22787 ) ) ( not ( = ?auto_22788 ?auto_22787 ) ) ( ON ?auto_22781 ?auto_22780 ) ( not ( = ?auto_22780 ?auto_22781 ) ) ( not ( = ?auto_22780 ?auto_22782 ) ) ( not ( = ?auto_22780 ?auto_22783 ) ) ( not ( = ?auto_22780 ?auto_22788 ) ) ( not ( = ?auto_22780 ?auto_22787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22781 ?auto_22782 ?auto_22783 )
      ( MAKE-3CRATE-VERIFY ?auto_22780 ?auto_22781 ?auto_22782 ?auto_22783 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22791 - SURFACE
      ?auto_22792 - SURFACE
      ?auto_22793 - SURFACE
      ?auto_22794 - SURFACE
      ?auto_22795 - SURFACE
    )
    :vars
    (
      ?auto_22797 - HOIST
      ?auto_22798 - PLACE
      ?auto_22801 - PLACE
      ?auto_22802 - HOIST
      ?auto_22800 - SURFACE
      ?auto_22796 - TRUCK
      ?auto_22799 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22797 ?auto_22798 ) ( IS-CRATE ?auto_22795 ) ( not ( = ?auto_22794 ?auto_22795 ) ) ( not ( = ?auto_22793 ?auto_22794 ) ) ( not ( = ?auto_22793 ?auto_22795 ) ) ( not ( = ?auto_22801 ?auto_22798 ) ) ( HOIST-AT ?auto_22802 ?auto_22801 ) ( not ( = ?auto_22797 ?auto_22802 ) ) ( SURFACE-AT ?auto_22795 ?auto_22801 ) ( ON ?auto_22795 ?auto_22800 ) ( CLEAR ?auto_22795 ) ( not ( = ?auto_22794 ?auto_22800 ) ) ( not ( = ?auto_22795 ?auto_22800 ) ) ( not ( = ?auto_22793 ?auto_22800 ) ) ( SURFACE-AT ?auto_22793 ?auto_22798 ) ( CLEAR ?auto_22793 ) ( IS-CRATE ?auto_22794 ) ( AVAILABLE ?auto_22797 ) ( TRUCK-AT ?auto_22796 ?auto_22801 ) ( AVAILABLE ?auto_22802 ) ( SURFACE-AT ?auto_22794 ?auto_22801 ) ( ON ?auto_22794 ?auto_22799 ) ( CLEAR ?auto_22794 ) ( not ( = ?auto_22794 ?auto_22799 ) ) ( not ( = ?auto_22795 ?auto_22799 ) ) ( not ( = ?auto_22793 ?auto_22799 ) ) ( not ( = ?auto_22800 ?auto_22799 ) ) ( ON ?auto_22792 ?auto_22791 ) ( ON ?auto_22793 ?auto_22792 ) ( not ( = ?auto_22791 ?auto_22792 ) ) ( not ( = ?auto_22791 ?auto_22793 ) ) ( not ( = ?auto_22791 ?auto_22794 ) ) ( not ( = ?auto_22791 ?auto_22795 ) ) ( not ( = ?auto_22791 ?auto_22800 ) ) ( not ( = ?auto_22791 ?auto_22799 ) ) ( not ( = ?auto_22792 ?auto_22793 ) ) ( not ( = ?auto_22792 ?auto_22794 ) ) ( not ( = ?auto_22792 ?auto_22795 ) ) ( not ( = ?auto_22792 ?auto_22800 ) ) ( not ( = ?auto_22792 ?auto_22799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22793 ?auto_22794 ?auto_22795 )
      ( MAKE-4CRATE-VERIFY ?auto_22791 ?auto_22792 ?auto_22793 ?auto_22794 ?auto_22795 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22803 - SURFACE
      ?auto_22804 - SURFACE
    )
    :vars
    (
      ?auto_22806 - HOIST
      ?auto_22807 - PLACE
      ?auto_22811 - SURFACE
      ?auto_22810 - PLACE
      ?auto_22812 - HOIST
      ?auto_22809 - SURFACE
      ?auto_22808 - SURFACE
      ?auto_22805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22806 ?auto_22807 ) ( IS-CRATE ?auto_22804 ) ( not ( = ?auto_22803 ?auto_22804 ) ) ( not ( = ?auto_22811 ?auto_22803 ) ) ( not ( = ?auto_22811 ?auto_22804 ) ) ( not ( = ?auto_22810 ?auto_22807 ) ) ( HOIST-AT ?auto_22812 ?auto_22810 ) ( not ( = ?auto_22806 ?auto_22812 ) ) ( SURFACE-AT ?auto_22804 ?auto_22810 ) ( ON ?auto_22804 ?auto_22809 ) ( CLEAR ?auto_22804 ) ( not ( = ?auto_22803 ?auto_22809 ) ) ( not ( = ?auto_22804 ?auto_22809 ) ) ( not ( = ?auto_22811 ?auto_22809 ) ) ( SURFACE-AT ?auto_22811 ?auto_22807 ) ( CLEAR ?auto_22811 ) ( IS-CRATE ?auto_22803 ) ( AVAILABLE ?auto_22806 ) ( AVAILABLE ?auto_22812 ) ( SURFACE-AT ?auto_22803 ?auto_22810 ) ( ON ?auto_22803 ?auto_22808 ) ( CLEAR ?auto_22803 ) ( not ( = ?auto_22803 ?auto_22808 ) ) ( not ( = ?auto_22804 ?auto_22808 ) ) ( not ( = ?auto_22811 ?auto_22808 ) ) ( not ( = ?auto_22809 ?auto_22808 ) ) ( TRUCK-AT ?auto_22805 ?auto_22807 ) )
    :subtasks
    ( ( !DRIVE ?auto_22805 ?auto_22807 ?auto_22810 )
      ( MAKE-2CRATE ?auto_22811 ?auto_22803 ?auto_22804 )
      ( MAKE-1CRATE-VERIFY ?auto_22803 ?auto_22804 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22813 - SURFACE
      ?auto_22814 - SURFACE
      ?auto_22815 - SURFACE
    )
    :vars
    (
      ?auto_22817 - HOIST
      ?auto_22821 - PLACE
      ?auto_22819 - PLACE
      ?auto_22822 - HOIST
      ?auto_22820 - SURFACE
      ?auto_22816 - SURFACE
      ?auto_22818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22817 ?auto_22821 ) ( IS-CRATE ?auto_22815 ) ( not ( = ?auto_22814 ?auto_22815 ) ) ( not ( = ?auto_22813 ?auto_22814 ) ) ( not ( = ?auto_22813 ?auto_22815 ) ) ( not ( = ?auto_22819 ?auto_22821 ) ) ( HOIST-AT ?auto_22822 ?auto_22819 ) ( not ( = ?auto_22817 ?auto_22822 ) ) ( SURFACE-AT ?auto_22815 ?auto_22819 ) ( ON ?auto_22815 ?auto_22820 ) ( CLEAR ?auto_22815 ) ( not ( = ?auto_22814 ?auto_22820 ) ) ( not ( = ?auto_22815 ?auto_22820 ) ) ( not ( = ?auto_22813 ?auto_22820 ) ) ( SURFACE-AT ?auto_22813 ?auto_22821 ) ( CLEAR ?auto_22813 ) ( IS-CRATE ?auto_22814 ) ( AVAILABLE ?auto_22817 ) ( AVAILABLE ?auto_22822 ) ( SURFACE-AT ?auto_22814 ?auto_22819 ) ( ON ?auto_22814 ?auto_22816 ) ( CLEAR ?auto_22814 ) ( not ( = ?auto_22814 ?auto_22816 ) ) ( not ( = ?auto_22815 ?auto_22816 ) ) ( not ( = ?auto_22813 ?auto_22816 ) ) ( not ( = ?auto_22820 ?auto_22816 ) ) ( TRUCK-AT ?auto_22818 ?auto_22821 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22814 ?auto_22815 )
      ( MAKE-2CRATE-VERIFY ?auto_22813 ?auto_22814 ?auto_22815 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22823 - SURFACE
      ?auto_22824 - SURFACE
      ?auto_22825 - SURFACE
      ?auto_22826 - SURFACE
    )
    :vars
    (
      ?auto_22827 - HOIST
      ?auto_22832 - PLACE
      ?auto_22833 - PLACE
      ?auto_22829 - HOIST
      ?auto_22828 - SURFACE
      ?auto_22831 - SURFACE
      ?auto_22830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22827 ?auto_22832 ) ( IS-CRATE ?auto_22826 ) ( not ( = ?auto_22825 ?auto_22826 ) ) ( not ( = ?auto_22824 ?auto_22825 ) ) ( not ( = ?auto_22824 ?auto_22826 ) ) ( not ( = ?auto_22833 ?auto_22832 ) ) ( HOIST-AT ?auto_22829 ?auto_22833 ) ( not ( = ?auto_22827 ?auto_22829 ) ) ( SURFACE-AT ?auto_22826 ?auto_22833 ) ( ON ?auto_22826 ?auto_22828 ) ( CLEAR ?auto_22826 ) ( not ( = ?auto_22825 ?auto_22828 ) ) ( not ( = ?auto_22826 ?auto_22828 ) ) ( not ( = ?auto_22824 ?auto_22828 ) ) ( SURFACE-AT ?auto_22824 ?auto_22832 ) ( CLEAR ?auto_22824 ) ( IS-CRATE ?auto_22825 ) ( AVAILABLE ?auto_22827 ) ( AVAILABLE ?auto_22829 ) ( SURFACE-AT ?auto_22825 ?auto_22833 ) ( ON ?auto_22825 ?auto_22831 ) ( CLEAR ?auto_22825 ) ( not ( = ?auto_22825 ?auto_22831 ) ) ( not ( = ?auto_22826 ?auto_22831 ) ) ( not ( = ?auto_22824 ?auto_22831 ) ) ( not ( = ?auto_22828 ?auto_22831 ) ) ( TRUCK-AT ?auto_22830 ?auto_22832 ) ( ON ?auto_22824 ?auto_22823 ) ( not ( = ?auto_22823 ?auto_22824 ) ) ( not ( = ?auto_22823 ?auto_22825 ) ) ( not ( = ?auto_22823 ?auto_22826 ) ) ( not ( = ?auto_22823 ?auto_22828 ) ) ( not ( = ?auto_22823 ?auto_22831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22824 ?auto_22825 ?auto_22826 )
      ( MAKE-3CRATE-VERIFY ?auto_22823 ?auto_22824 ?auto_22825 ?auto_22826 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22834 - SURFACE
      ?auto_22835 - SURFACE
      ?auto_22836 - SURFACE
      ?auto_22837 - SURFACE
      ?auto_22838 - SURFACE
    )
    :vars
    (
      ?auto_22839 - HOIST
      ?auto_22844 - PLACE
      ?auto_22845 - PLACE
      ?auto_22841 - HOIST
      ?auto_22840 - SURFACE
      ?auto_22843 - SURFACE
      ?auto_22842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22839 ?auto_22844 ) ( IS-CRATE ?auto_22838 ) ( not ( = ?auto_22837 ?auto_22838 ) ) ( not ( = ?auto_22836 ?auto_22837 ) ) ( not ( = ?auto_22836 ?auto_22838 ) ) ( not ( = ?auto_22845 ?auto_22844 ) ) ( HOIST-AT ?auto_22841 ?auto_22845 ) ( not ( = ?auto_22839 ?auto_22841 ) ) ( SURFACE-AT ?auto_22838 ?auto_22845 ) ( ON ?auto_22838 ?auto_22840 ) ( CLEAR ?auto_22838 ) ( not ( = ?auto_22837 ?auto_22840 ) ) ( not ( = ?auto_22838 ?auto_22840 ) ) ( not ( = ?auto_22836 ?auto_22840 ) ) ( SURFACE-AT ?auto_22836 ?auto_22844 ) ( CLEAR ?auto_22836 ) ( IS-CRATE ?auto_22837 ) ( AVAILABLE ?auto_22839 ) ( AVAILABLE ?auto_22841 ) ( SURFACE-AT ?auto_22837 ?auto_22845 ) ( ON ?auto_22837 ?auto_22843 ) ( CLEAR ?auto_22837 ) ( not ( = ?auto_22837 ?auto_22843 ) ) ( not ( = ?auto_22838 ?auto_22843 ) ) ( not ( = ?auto_22836 ?auto_22843 ) ) ( not ( = ?auto_22840 ?auto_22843 ) ) ( TRUCK-AT ?auto_22842 ?auto_22844 ) ( ON ?auto_22835 ?auto_22834 ) ( ON ?auto_22836 ?auto_22835 ) ( not ( = ?auto_22834 ?auto_22835 ) ) ( not ( = ?auto_22834 ?auto_22836 ) ) ( not ( = ?auto_22834 ?auto_22837 ) ) ( not ( = ?auto_22834 ?auto_22838 ) ) ( not ( = ?auto_22834 ?auto_22840 ) ) ( not ( = ?auto_22834 ?auto_22843 ) ) ( not ( = ?auto_22835 ?auto_22836 ) ) ( not ( = ?auto_22835 ?auto_22837 ) ) ( not ( = ?auto_22835 ?auto_22838 ) ) ( not ( = ?auto_22835 ?auto_22840 ) ) ( not ( = ?auto_22835 ?auto_22843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22836 ?auto_22837 ?auto_22838 )
      ( MAKE-4CRATE-VERIFY ?auto_22834 ?auto_22835 ?auto_22836 ?auto_22837 ?auto_22838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22846 - SURFACE
      ?auto_22847 - SURFACE
    )
    :vars
    (
      ?auto_22848 - HOIST
      ?auto_22853 - PLACE
      ?auto_22854 - SURFACE
      ?auto_22855 - PLACE
      ?auto_22850 - HOIST
      ?auto_22849 - SURFACE
      ?auto_22852 - SURFACE
      ?auto_22851 - TRUCK
      ?auto_22856 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22848 ?auto_22853 ) ( IS-CRATE ?auto_22847 ) ( not ( = ?auto_22846 ?auto_22847 ) ) ( not ( = ?auto_22854 ?auto_22846 ) ) ( not ( = ?auto_22854 ?auto_22847 ) ) ( not ( = ?auto_22855 ?auto_22853 ) ) ( HOIST-AT ?auto_22850 ?auto_22855 ) ( not ( = ?auto_22848 ?auto_22850 ) ) ( SURFACE-AT ?auto_22847 ?auto_22855 ) ( ON ?auto_22847 ?auto_22849 ) ( CLEAR ?auto_22847 ) ( not ( = ?auto_22846 ?auto_22849 ) ) ( not ( = ?auto_22847 ?auto_22849 ) ) ( not ( = ?auto_22854 ?auto_22849 ) ) ( IS-CRATE ?auto_22846 ) ( AVAILABLE ?auto_22850 ) ( SURFACE-AT ?auto_22846 ?auto_22855 ) ( ON ?auto_22846 ?auto_22852 ) ( CLEAR ?auto_22846 ) ( not ( = ?auto_22846 ?auto_22852 ) ) ( not ( = ?auto_22847 ?auto_22852 ) ) ( not ( = ?auto_22854 ?auto_22852 ) ) ( not ( = ?auto_22849 ?auto_22852 ) ) ( TRUCK-AT ?auto_22851 ?auto_22853 ) ( SURFACE-AT ?auto_22856 ?auto_22853 ) ( CLEAR ?auto_22856 ) ( LIFTING ?auto_22848 ?auto_22854 ) ( IS-CRATE ?auto_22854 ) ( not ( = ?auto_22856 ?auto_22854 ) ) ( not ( = ?auto_22846 ?auto_22856 ) ) ( not ( = ?auto_22847 ?auto_22856 ) ) ( not ( = ?auto_22849 ?auto_22856 ) ) ( not ( = ?auto_22852 ?auto_22856 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22856 ?auto_22854 )
      ( MAKE-2CRATE ?auto_22854 ?auto_22846 ?auto_22847 )
      ( MAKE-1CRATE-VERIFY ?auto_22846 ?auto_22847 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22857 - SURFACE
      ?auto_22858 - SURFACE
      ?auto_22859 - SURFACE
    )
    :vars
    (
      ?auto_22866 - HOIST
      ?auto_22861 - PLACE
      ?auto_22867 - PLACE
      ?auto_22862 - HOIST
      ?auto_22864 - SURFACE
      ?auto_22863 - SURFACE
      ?auto_22865 - TRUCK
      ?auto_22860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_22866 ?auto_22861 ) ( IS-CRATE ?auto_22859 ) ( not ( = ?auto_22858 ?auto_22859 ) ) ( not ( = ?auto_22857 ?auto_22858 ) ) ( not ( = ?auto_22857 ?auto_22859 ) ) ( not ( = ?auto_22867 ?auto_22861 ) ) ( HOIST-AT ?auto_22862 ?auto_22867 ) ( not ( = ?auto_22866 ?auto_22862 ) ) ( SURFACE-AT ?auto_22859 ?auto_22867 ) ( ON ?auto_22859 ?auto_22864 ) ( CLEAR ?auto_22859 ) ( not ( = ?auto_22858 ?auto_22864 ) ) ( not ( = ?auto_22859 ?auto_22864 ) ) ( not ( = ?auto_22857 ?auto_22864 ) ) ( IS-CRATE ?auto_22858 ) ( AVAILABLE ?auto_22862 ) ( SURFACE-AT ?auto_22858 ?auto_22867 ) ( ON ?auto_22858 ?auto_22863 ) ( CLEAR ?auto_22858 ) ( not ( = ?auto_22858 ?auto_22863 ) ) ( not ( = ?auto_22859 ?auto_22863 ) ) ( not ( = ?auto_22857 ?auto_22863 ) ) ( not ( = ?auto_22864 ?auto_22863 ) ) ( TRUCK-AT ?auto_22865 ?auto_22861 ) ( SURFACE-AT ?auto_22860 ?auto_22861 ) ( CLEAR ?auto_22860 ) ( LIFTING ?auto_22866 ?auto_22857 ) ( IS-CRATE ?auto_22857 ) ( not ( = ?auto_22860 ?auto_22857 ) ) ( not ( = ?auto_22858 ?auto_22860 ) ) ( not ( = ?auto_22859 ?auto_22860 ) ) ( not ( = ?auto_22864 ?auto_22860 ) ) ( not ( = ?auto_22863 ?auto_22860 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22858 ?auto_22859 )
      ( MAKE-2CRATE-VERIFY ?auto_22857 ?auto_22858 ?auto_22859 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22868 - SURFACE
      ?auto_22869 - SURFACE
      ?auto_22870 - SURFACE
      ?auto_22871 - SURFACE
    )
    :vars
    (
      ?auto_22876 - HOIST
      ?auto_22872 - PLACE
      ?auto_22878 - PLACE
      ?auto_22874 - HOIST
      ?auto_22877 - SURFACE
      ?auto_22875 - SURFACE
      ?auto_22873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22876 ?auto_22872 ) ( IS-CRATE ?auto_22871 ) ( not ( = ?auto_22870 ?auto_22871 ) ) ( not ( = ?auto_22869 ?auto_22870 ) ) ( not ( = ?auto_22869 ?auto_22871 ) ) ( not ( = ?auto_22878 ?auto_22872 ) ) ( HOIST-AT ?auto_22874 ?auto_22878 ) ( not ( = ?auto_22876 ?auto_22874 ) ) ( SURFACE-AT ?auto_22871 ?auto_22878 ) ( ON ?auto_22871 ?auto_22877 ) ( CLEAR ?auto_22871 ) ( not ( = ?auto_22870 ?auto_22877 ) ) ( not ( = ?auto_22871 ?auto_22877 ) ) ( not ( = ?auto_22869 ?auto_22877 ) ) ( IS-CRATE ?auto_22870 ) ( AVAILABLE ?auto_22874 ) ( SURFACE-AT ?auto_22870 ?auto_22878 ) ( ON ?auto_22870 ?auto_22875 ) ( CLEAR ?auto_22870 ) ( not ( = ?auto_22870 ?auto_22875 ) ) ( not ( = ?auto_22871 ?auto_22875 ) ) ( not ( = ?auto_22869 ?auto_22875 ) ) ( not ( = ?auto_22877 ?auto_22875 ) ) ( TRUCK-AT ?auto_22873 ?auto_22872 ) ( SURFACE-AT ?auto_22868 ?auto_22872 ) ( CLEAR ?auto_22868 ) ( LIFTING ?auto_22876 ?auto_22869 ) ( IS-CRATE ?auto_22869 ) ( not ( = ?auto_22868 ?auto_22869 ) ) ( not ( = ?auto_22870 ?auto_22868 ) ) ( not ( = ?auto_22871 ?auto_22868 ) ) ( not ( = ?auto_22877 ?auto_22868 ) ) ( not ( = ?auto_22875 ?auto_22868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22869 ?auto_22870 ?auto_22871 )
      ( MAKE-3CRATE-VERIFY ?auto_22868 ?auto_22869 ?auto_22870 ?auto_22871 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22879 - SURFACE
      ?auto_22880 - SURFACE
      ?auto_22881 - SURFACE
      ?auto_22882 - SURFACE
      ?auto_22883 - SURFACE
    )
    :vars
    (
      ?auto_22888 - HOIST
      ?auto_22884 - PLACE
      ?auto_22890 - PLACE
      ?auto_22886 - HOIST
      ?auto_22889 - SURFACE
      ?auto_22887 - SURFACE
      ?auto_22885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22888 ?auto_22884 ) ( IS-CRATE ?auto_22883 ) ( not ( = ?auto_22882 ?auto_22883 ) ) ( not ( = ?auto_22881 ?auto_22882 ) ) ( not ( = ?auto_22881 ?auto_22883 ) ) ( not ( = ?auto_22890 ?auto_22884 ) ) ( HOIST-AT ?auto_22886 ?auto_22890 ) ( not ( = ?auto_22888 ?auto_22886 ) ) ( SURFACE-AT ?auto_22883 ?auto_22890 ) ( ON ?auto_22883 ?auto_22889 ) ( CLEAR ?auto_22883 ) ( not ( = ?auto_22882 ?auto_22889 ) ) ( not ( = ?auto_22883 ?auto_22889 ) ) ( not ( = ?auto_22881 ?auto_22889 ) ) ( IS-CRATE ?auto_22882 ) ( AVAILABLE ?auto_22886 ) ( SURFACE-AT ?auto_22882 ?auto_22890 ) ( ON ?auto_22882 ?auto_22887 ) ( CLEAR ?auto_22882 ) ( not ( = ?auto_22882 ?auto_22887 ) ) ( not ( = ?auto_22883 ?auto_22887 ) ) ( not ( = ?auto_22881 ?auto_22887 ) ) ( not ( = ?auto_22889 ?auto_22887 ) ) ( TRUCK-AT ?auto_22885 ?auto_22884 ) ( SURFACE-AT ?auto_22880 ?auto_22884 ) ( CLEAR ?auto_22880 ) ( LIFTING ?auto_22888 ?auto_22881 ) ( IS-CRATE ?auto_22881 ) ( not ( = ?auto_22880 ?auto_22881 ) ) ( not ( = ?auto_22882 ?auto_22880 ) ) ( not ( = ?auto_22883 ?auto_22880 ) ) ( not ( = ?auto_22889 ?auto_22880 ) ) ( not ( = ?auto_22887 ?auto_22880 ) ) ( ON ?auto_22880 ?auto_22879 ) ( not ( = ?auto_22879 ?auto_22880 ) ) ( not ( = ?auto_22879 ?auto_22881 ) ) ( not ( = ?auto_22879 ?auto_22882 ) ) ( not ( = ?auto_22879 ?auto_22883 ) ) ( not ( = ?auto_22879 ?auto_22889 ) ) ( not ( = ?auto_22879 ?auto_22887 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22881 ?auto_22882 ?auto_22883 )
      ( MAKE-4CRATE-VERIFY ?auto_22879 ?auto_22880 ?auto_22881 ?auto_22882 ?auto_22883 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23162 - SURFACE
      ?auto_23163 - SURFACE
    )
    :vars
    (
      ?auto_23167 - HOIST
      ?auto_23168 - PLACE
      ?auto_23164 - SURFACE
      ?auto_23171 - PLACE
      ?auto_23165 - HOIST
      ?auto_23170 - SURFACE
      ?auto_23169 - TRUCK
      ?auto_23166 - SURFACE
      ?auto_23172 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23167 ?auto_23168 ) ( IS-CRATE ?auto_23163 ) ( not ( = ?auto_23162 ?auto_23163 ) ) ( not ( = ?auto_23164 ?auto_23162 ) ) ( not ( = ?auto_23164 ?auto_23163 ) ) ( not ( = ?auto_23171 ?auto_23168 ) ) ( HOIST-AT ?auto_23165 ?auto_23171 ) ( not ( = ?auto_23167 ?auto_23165 ) ) ( SURFACE-AT ?auto_23163 ?auto_23171 ) ( ON ?auto_23163 ?auto_23170 ) ( CLEAR ?auto_23163 ) ( not ( = ?auto_23162 ?auto_23170 ) ) ( not ( = ?auto_23163 ?auto_23170 ) ) ( not ( = ?auto_23164 ?auto_23170 ) ) ( SURFACE-AT ?auto_23164 ?auto_23168 ) ( CLEAR ?auto_23164 ) ( IS-CRATE ?auto_23162 ) ( AVAILABLE ?auto_23167 ) ( TRUCK-AT ?auto_23169 ?auto_23171 ) ( SURFACE-AT ?auto_23162 ?auto_23171 ) ( ON ?auto_23162 ?auto_23166 ) ( CLEAR ?auto_23162 ) ( not ( = ?auto_23162 ?auto_23166 ) ) ( not ( = ?auto_23163 ?auto_23166 ) ) ( not ( = ?auto_23164 ?auto_23166 ) ) ( not ( = ?auto_23170 ?auto_23166 ) ) ( LIFTING ?auto_23165 ?auto_23172 ) ( IS-CRATE ?auto_23172 ) ( not ( = ?auto_23162 ?auto_23172 ) ) ( not ( = ?auto_23163 ?auto_23172 ) ) ( not ( = ?auto_23164 ?auto_23172 ) ) ( not ( = ?auto_23170 ?auto_23172 ) ) ( not ( = ?auto_23166 ?auto_23172 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23165 ?auto_23172 ?auto_23169 ?auto_23171 )
      ( MAKE-2CRATE ?auto_23164 ?auto_23162 ?auto_23163 )
      ( MAKE-1CRATE-VERIFY ?auto_23162 ?auto_23163 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23173 - SURFACE
      ?auto_23174 - SURFACE
      ?auto_23175 - SURFACE
    )
    :vars
    (
      ?auto_23181 - HOIST
      ?auto_23182 - PLACE
      ?auto_23180 - PLACE
      ?auto_23178 - HOIST
      ?auto_23179 - SURFACE
      ?auto_23183 - TRUCK
      ?auto_23177 - SURFACE
      ?auto_23176 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23181 ?auto_23182 ) ( IS-CRATE ?auto_23175 ) ( not ( = ?auto_23174 ?auto_23175 ) ) ( not ( = ?auto_23173 ?auto_23174 ) ) ( not ( = ?auto_23173 ?auto_23175 ) ) ( not ( = ?auto_23180 ?auto_23182 ) ) ( HOIST-AT ?auto_23178 ?auto_23180 ) ( not ( = ?auto_23181 ?auto_23178 ) ) ( SURFACE-AT ?auto_23175 ?auto_23180 ) ( ON ?auto_23175 ?auto_23179 ) ( CLEAR ?auto_23175 ) ( not ( = ?auto_23174 ?auto_23179 ) ) ( not ( = ?auto_23175 ?auto_23179 ) ) ( not ( = ?auto_23173 ?auto_23179 ) ) ( SURFACE-AT ?auto_23173 ?auto_23182 ) ( CLEAR ?auto_23173 ) ( IS-CRATE ?auto_23174 ) ( AVAILABLE ?auto_23181 ) ( TRUCK-AT ?auto_23183 ?auto_23180 ) ( SURFACE-AT ?auto_23174 ?auto_23180 ) ( ON ?auto_23174 ?auto_23177 ) ( CLEAR ?auto_23174 ) ( not ( = ?auto_23174 ?auto_23177 ) ) ( not ( = ?auto_23175 ?auto_23177 ) ) ( not ( = ?auto_23173 ?auto_23177 ) ) ( not ( = ?auto_23179 ?auto_23177 ) ) ( LIFTING ?auto_23178 ?auto_23176 ) ( IS-CRATE ?auto_23176 ) ( not ( = ?auto_23174 ?auto_23176 ) ) ( not ( = ?auto_23175 ?auto_23176 ) ) ( not ( = ?auto_23173 ?auto_23176 ) ) ( not ( = ?auto_23179 ?auto_23176 ) ) ( not ( = ?auto_23177 ?auto_23176 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23174 ?auto_23175 )
      ( MAKE-2CRATE-VERIFY ?auto_23173 ?auto_23174 ?auto_23175 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23314 - SURFACE
      ?auto_23315 - SURFACE
      ?auto_23316 - SURFACE
      ?auto_23317 - SURFACE
      ?auto_23318 - SURFACE
      ?auto_23319 - SURFACE
    )
    :vars
    (
      ?auto_23321 - HOIST
      ?auto_23320 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23321 ?auto_23320 ) ( SURFACE-AT ?auto_23318 ?auto_23320 ) ( CLEAR ?auto_23318 ) ( LIFTING ?auto_23321 ?auto_23319 ) ( IS-CRATE ?auto_23319 ) ( not ( = ?auto_23318 ?auto_23319 ) ) ( ON ?auto_23315 ?auto_23314 ) ( ON ?auto_23316 ?auto_23315 ) ( ON ?auto_23317 ?auto_23316 ) ( ON ?auto_23318 ?auto_23317 ) ( not ( = ?auto_23314 ?auto_23315 ) ) ( not ( = ?auto_23314 ?auto_23316 ) ) ( not ( = ?auto_23314 ?auto_23317 ) ) ( not ( = ?auto_23314 ?auto_23318 ) ) ( not ( = ?auto_23314 ?auto_23319 ) ) ( not ( = ?auto_23315 ?auto_23316 ) ) ( not ( = ?auto_23315 ?auto_23317 ) ) ( not ( = ?auto_23315 ?auto_23318 ) ) ( not ( = ?auto_23315 ?auto_23319 ) ) ( not ( = ?auto_23316 ?auto_23317 ) ) ( not ( = ?auto_23316 ?auto_23318 ) ) ( not ( = ?auto_23316 ?auto_23319 ) ) ( not ( = ?auto_23317 ?auto_23318 ) ) ( not ( = ?auto_23317 ?auto_23319 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23318 ?auto_23319 )
      ( MAKE-5CRATE-VERIFY ?auto_23314 ?auto_23315 ?auto_23316 ?auto_23317 ?auto_23318 ?auto_23319 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23348 - SURFACE
      ?auto_23349 - SURFACE
      ?auto_23350 - SURFACE
      ?auto_23351 - SURFACE
      ?auto_23352 - SURFACE
      ?auto_23353 - SURFACE
    )
    :vars
    (
      ?auto_23355 - HOIST
      ?auto_23356 - PLACE
      ?auto_23354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23355 ?auto_23356 ) ( SURFACE-AT ?auto_23352 ?auto_23356 ) ( CLEAR ?auto_23352 ) ( IS-CRATE ?auto_23353 ) ( not ( = ?auto_23352 ?auto_23353 ) ) ( TRUCK-AT ?auto_23354 ?auto_23356 ) ( AVAILABLE ?auto_23355 ) ( IN ?auto_23353 ?auto_23354 ) ( ON ?auto_23352 ?auto_23351 ) ( not ( = ?auto_23351 ?auto_23352 ) ) ( not ( = ?auto_23351 ?auto_23353 ) ) ( ON ?auto_23349 ?auto_23348 ) ( ON ?auto_23350 ?auto_23349 ) ( ON ?auto_23351 ?auto_23350 ) ( not ( = ?auto_23348 ?auto_23349 ) ) ( not ( = ?auto_23348 ?auto_23350 ) ) ( not ( = ?auto_23348 ?auto_23351 ) ) ( not ( = ?auto_23348 ?auto_23352 ) ) ( not ( = ?auto_23348 ?auto_23353 ) ) ( not ( = ?auto_23349 ?auto_23350 ) ) ( not ( = ?auto_23349 ?auto_23351 ) ) ( not ( = ?auto_23349 ?auto_23352 ) ) ( not ( = ?auto_23349 ?auto_23353 ) ) ( not ( = ?auto_23350 ?auto_23351 ) ) ( not ( = ?auto_23350 ?auto_23352 ) ) ( not ( = ?auto_23350 ?auto_23353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23351 ?auto_23352 ?auto_23353 )
      ( MAKE-5CRATE-VERIFY ?auto_23348 ?auto_23349 ?auto_23350 ?auto_23351 ?auto_23352 ?auto_23353 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23388 - SURFACE
      ?auto_23389 - SURFACE
      ?auto_23390 - SURFACE
      ?auto_23391 - SURFACE
      ?auto_23392 - SURFACE
      ?auto_23393 - SURFACE
    )
    :vars
    (
      ?auto_23394 - HOIST
      ?auto_23396 - PLACE
      ?auto_23395 - TRUCK
      ?auto_23397 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23394 ?auto_23396 ) ( SURFACE-AT ?auto_23392 ?auto_23396 ) ( CLEAR ?auto_23392 ) ( IS-CRATE ?auto_23393 ) ( not ( = ?auto_23392 ?auto_23393 ) ) ( AVAILABLE ?auto_23394 ) ( IN ?auto_23393 ?auto_23395 ) ( ON ?auto_23392 ?auto_23391 ) ( not ( = ?auto_23391 ?auto_23392 ) ) ( not ( = ?auto_23391 ?auto_23393 ) ) ( TRUCK-AT ?auto_23395 ?auto_23397 ) ( not ( = ?auto_23397 ?auto_23396 ) ) ( ON ?auto_23389 ?auto_23388 ) ( ON ?auto_23390 ?auto_23389 ) ( ON ?auto_23391 ?auto_23390 ) ( not ( = ?auto_23388 ?auto_23389 ) ) ( not ( = ?auto_23388 ?auto_23390 ) ) ( not ( = ?auto_23388 ?auto_23391 ) ) ( not ( = ?auto_23388 ?auto_23392 ) ) ( not ( = ?auto_23388 ?auto_23393 ) ) ( not ( = ?auto_23389 ?auto_23390 ) ) ( not ( = ?auto_23389 ?auto_23391 ) ) ( not ( = ?auto_23389 ?auto_23392 ) ) ( not ( = ?auto_23389 ?auto_23393 ) ) ( not ( = ?auto_23390 ?auto_23391 ) ) ( not ( = ?auto_23390 ?auto_23392 ) ) ( not ( = ?auto_23390 ?auto_23393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23391 ?auto_23392 ?auto_23393 )
      ( MAKE-5CRATE-VERIFY ?auto_23388 ?auto_23389 ?auto_23390 ?auto_23391 ?auto_23392 ?auto_23393 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23433 - SURFACE
      ?auto_23434 - SURFACE
      ?auto_23435 - SURFACE
      ?auto_23436 - SURFACE
      ?auto_23437 - SURFACE
      ?auto_23438 - SURFACE
    )
    :vars
    (
      ?auto_23442 - HOIST
      ?auto_23443 - PLACE
      ?auto_23441 - TRUCK
      ?auto_23440 - PLACE
      ?auto_23439 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23442 ?auto_23443 ) ( SURFACE-AT ?auto_23437 ?auto_23443 ) ( CLEAR ?auto_23437 ) ( IS-CRATE ?auto_23438 ) ( not ( = ?auto_23437 ?auto_23438 ) ) ( AVAILABLE ?auto_23442 ) ( ON ?auto_23437 ?auto_23436 ) ( not ( = ?auto_23436 ?auto_23437 ) ) ( not ( = ?auto_23436 ?auto_23438 ) ) ( TRUCK-AT ?auto_23441 ?auto_23440 ) ( not ( = ?auto_23440 ?auto_23443 ) ) ( HOIST-AT ?auto_23439 ?auto_23440 ) ( LIFTING ?auto_23439 ?auto_23438 ) ( not ( = ?auto_23442 ?auto_23439 ) ) ( ON ?auto_23434 ?auto_23433 ) ( ON ?auto_23435 ?auto_23434 ) ( ON ?auto_23436 ?auto_23435 ) ( not ( = ?auto_23433 ?auto_23434 ) ) ( not ( = ?auto_23433 ?auto_23435 ) ) ( not ( = ?auto_23433 ?auto_23436 ) ) ( not ( = ?auto_23433 ?auto_23437 ) ) ( not ( = ?auto_23433 ?auto_23438 ) ) ( not ( = ?auto_23434 ?auto_23435 ) ) ( not ( = ?auto_23434 ?auto_23436 ) ) ( not ( = ?auto_23434 ?auto_23437 ) ) ( not ( = ?auto_23434 ?auto_23438 ) ) ( not ( = ?auto_23435 ?auto_23436 ) ) ( not ( = ?auto_23435 ?auto_23437 ) ) ( not ( = ?auto_23435 ?auto_23438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23436 ?auto_23437 ?auto_23438 )
      ( MAKE-5CRATE-VERIFY ?auto_23433 ?auto_23434 ?auto_23435 ?auto_23436 ?auto_23437 ?auto_23438 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23483 - SURFACE
      ?auto_23484 - SURFACE
      ?auto_23485 - SURFACE
      ?auto_23486 - SURFACE
      ?auto_23487 - SURFACE
      ?auto_23488 - SURFACE
    )
    :vars
    (
      ?auto_23491 - HOIST
      ?auto_23490 - PLACE
      ?auto_23489 - TRUCK
      ?auto_23492 - PLACE
      ?auto_23493 - HOIST
      ?auto_23494 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23491 ?auto_23490 ) ( SURFACE-AT ?auto_23487 ?auto_23490 ) ( CLEAR ?auto_23487 ) ( IS-CRATE ?auto_23488 ) ( not ( = ?auto_23487 ?auto_23488 ) ) ( AVAILABLE ?auto_23491 ) ( ON ?auto_23487 ?auto_23486 ) ( not ( = ?auto_23486 ?auto_23487 ) ) ( not ( = ?auto_23486 ?auto_23488 ) ) ( TRUCK-AT ?auto_23489 ?auto_23492 ) ( not ( = ?auto_23492 ?auto_23490 ) ) ( HOIST-AT ?auto_23493 ?auto_23492 ) ( not ( = ?auto_23491 ?auto_23493 ) ) ( AVAILABLE ?auto_23493 ) ( SURFACE-AT ?auto_23488 ?auto_23492 ) ( ON ?auto_23488 ?auto_23494 ) ( CLEAR ?auto_23488 ) ( not ( = ?auto_23487 ?auto_23494 ) ) ( not ( = ?auto_23488 ?auto_23494 ) ) ( not ( = ?auto_23486 ?auto_23494 ) ) ( ON ?auto_23484 ?auto_23483 ) ( ON ?auto_23485 ?auto_23484 ) ( ON ?auto_23486 ?auto_23485 ) ( not ( = ?auto_23483 ?auto_23484 ) ) ( not ( = ?auto_23483 ?auto_23485 ) ) ( not ( = ?auto_23483 ?auto_23486 ) ) ( not ( = ?auto_23483 ?auto_23487 ) ) ( not ( = ?auto_23483 ?auto_23488 ) ) ( not ( = ?auto_23483 ?auto_23494 ) ) ( not ( = ?auto_23484 ?auto_23485 ) ) ( not ( = ?auto_23484 ?auto_23486 ) ) ( not ( = ?auto_23484 ?auto_23487 ) ) ( not ( = ?auto_23484 ?auto_23488 ) ) ( not ( = ?auto_23484 ?auto_23494 ) ) ( not ( = ?auto_23485 ?auto_23486 ) ) ( not ( = ?auto_23485 ?auto_23487 ) ) ( not ( = ?auto_23485 ?auto_23488 ) ) ( not ( = ?auto_23485 ?auto_23494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23486 ?auto_23487 ?auto_23488 )
      ( MAKE-5CRATE-VERIFY ?auto_23483 ?auto_23484 ?auto_23485 ?auto_23486 ?auto_23487 ?auto_23488 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23534 - SURFACE
      ?auto_23535 - SURFACE
      ?auto_23536 - SURFACE
      ?auto_23537 - SURFACE
      ?auto_23538 - SURFACE
      ?auto_23539 - SURFACE
    )
    :vars
    (
      ?auto_23541 - HOIST
      ?auto_23545 - PLACE
      ?auto_23544 - PLACE
      ?auto_23542 - HOIST
      ?auto_23543 - SURFACE
      ?auto_23540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23541 ?auto_23545 ) ( SURFACE-AT ?auto_23538 ?auto_23545 ) ( CLEAR ?auto_23538 ) ( IS-CRATE ?auto_23539 ) ( not ( = ?auto_23538 ?auto_23539 ) ) ( AVAILABLE ?auto_23541 ) ( ON ?auto_23538 ?auto_23537 ) ( not ( = ?auto_23537 ?auto_23538 ) ) ( not ( = ?auto_23537 ?auto_23539 ) ) ( not ( = ?auto_23544 ?auto_23545 ) ) ( HOIST-AT ?auto_23542 ?auto_23544 ) ( not ( = ?auto_23541 ?auto_23542 ) ) ( AVAILABLE ?auto_23542 ) ( SURFACE-AT ?auto_23539 ?auto_23544 ) ( ON ?auto_23539 ?auto_23543 ) ( CLEAR ?auto_23539 ) ( not ( = ?auto_23538 ?auto_23543 ) ) ( not ( = ?auto_23539 ?auto_23543 ) ) ( not ( = ?auto_23537 ?auto_23543 ) ) ( TRUCK-AT ?auto_23540 ?auto_23545 ) ( ON ?auto_23535 ?auto_23534 ) ( ON ?auto_23536 ?auto_23535 ) ( ON ?auto_23537 ?auto_23536 ) ( not ( = ?auto_23534 ?auto_23535 ) ) ( not ( = ?auto_23534 ?auto_23536 ) ) ( not ( = ?auto_23534 ?auto_23537 ) ) ( not ( = ?auto_23534 ?auto_23538 ) ) ( not ( = ?auto_23534 ?auto_23539 ) ) ( not ( = ?auto_23534 ?auto_23543 ) ) ( not ( = ?auto_23535 ?auto_23536 ) ) ( not ( = ?auto_23535 ?auto_23537 ) ) ( not ( = ?auto_23535 ?auto_23538 ) ) ( not ( = ?auto_23535 ?auto_23539 ) ) ( not ( = ?auto_23535 ?auto_23543 ) ) ( not ( = ?auto_23536 ?auto_23537 ) ) ( not ( = ?auto_23536 ?auto_23538 ) ) ( not ( = ?auto_23536 ?auto_23539 ) ) ( not ( = ?auto_23536 ?auto_23543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23537 ?auto_23538 ?auto_23539 )
      ( MAKE-5CRATE-VERIFY ?auto_23534 ?auto_23535 ?auto_23536 ?auto_23537 ?auto_23538 ?auto_23539 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23585 - SURFACE
      ?auto_23586 - SURFACE
      ?auto_23587 - SURFACE
      ?auto_23588 - SURFACE
      ?auto_23589 - SURFACE
      ?auto_23590 - SURFACE
    )
    :vars
    (
      ?auto_23593 - HOIST
      ?auto_23592 - PLACE
      ?auto_23594 - PLACE
      ?auto_23591 - HOIST
      ?auto_23595 - SURFACE
      ?auto_23596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23593 ?auto_23592 ) ( IS-CRATE ?auto_23590 ) ( not ( = ?auto_23589 ?auto_23590 ) ) ( not ( = ?auto_23588 ?auto_23589 ) ) ( not ( = ?auto_23588 ?auto_23590 ) ) ( not ( = ?auto_23594 ?auto_23592 ) ) ( HOIST-AT ?auto_23591 ?auto_23594 ) ( not ( = ?auto_23593 ?auto_23591 ) ) ( AVAILABLE ?auto_23591 ) ( SURFACE-AT ?auto_23590 ?auto_23594 ) ( ON ?auto_23590 ?auto_23595 ) ( CLEAR ?auto_23590 ) ( not ( = ?auto_23589 ?auto_23595 ) ) ( not ( = ?auto_23590 ?auto_23595 ) ) ( not ( = ?auto_23588 ?auto_23595 ) ) ( TRUCK-AT ?auto_23596 ?auto_23592 ) ( SURFACE-AT ?auto_23588 ?auto_23592 ) ( CLEAR ?auto_23588 ) ( LIFTING ?auto_23593 ?auto_23589 ) ( IS-CRATE ?auto_23589 ) ( ON ?auto_23586 ?auto_23585 ) ( ON ?auto_23587 ?auto_23586 ) ( ON ?auto_23588 ?auto_23587 ) ( not ( = ?auto_23585 ?auto_23586 ) ) ( not ( = ?auto_23585 ?auto_23587 ) ) ( not ( = ?auto_23585 ?auto_23588 ) ) ( not ( = ?auto_23585 ?auto_23589 ) ) ( not ( = ?auto_23585 ?auto_23590 ) ) ( not ( = ?auto_23585 ?auto_23595 ) ) ( not ( = ?auto_23586 ?auto_23587 ) ) ( not ( = ?auto_23586 ?auto_23588 ) ) ( not ( = ?auto_23586 ?auto_23589 ) ) ( not ( = ?auto_23586 ?auto_23590 ) ) ( not ( = ?auto_23586 ?auto_23595 ) ) ( not ( = ?auto_23587 ?auto_23588 ) ) ( not ( = ?auto_23587 ?auto_23589 ) ) ( not ( = ?auto_23587 ?auto_23590 ) ) ( not ( = ?auto_23587 ?auto_23595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23588 ?auto_23589 ?auto_23590 )
      ( MAKE-5CRATE-VERIFY ?auto_23585 ?auto_23586 ?auto_23587 ?auto_23588 ?auto_23589 ?auto_23590 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_23636 - SURFACE
      ?auto_23637 - SURFACE
      ?auto_23638 - SURFACE
      ?auto_23639 - SURFACE
      ?auto_23640 - SURFACE
      ?auto_23641 - SURFACE
    )
    :vars
    (
      ?auto_23646 - HOIST
      ?auto_23647 - PLACE
      ?auto_23643 - PLACE
      ?auto_23645 - HOIST
      ?auto_23642 - SURFACE
      ?auto_23644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23646 ?auto_23647 ) ( IS-CRATE ?auto_23641 ) ( not ( = ?auto_23640 ?auto_23641 ) ) ( not ( = ?auto_23639 ?auto_23640 ) ) ( not ( = ?auto_23639 ?auto_23641 ) ) ( not ( = ?auto_23643 ?auto_23647 ) ) ( HOIST-AT ?auto_23645 ?auto_23643 ) ( not ( = ?auto_23646 ?auto_23645 ) ) ( AVAILABLE ?auto_23645 ) ( SURFACE-AT ?auto_23641 ?auto_23643 ) ( ON ?auto_23641 ?auto_23642 ) ( CLEAR ?auto_23641 ) ( not ( = ?auto_23640 ?auto_23642 ) ) ( not ( = ?auto_23641 ?auto_23642 ) ) ( not ( = ?auto_23639 ?auto_23642 ) ) ( TRUCK-AT ?auto_23644 ?auto_23647 ) ( SURFACE-AT ?auto_23639 ?auto_23647 ) ( CLEAR ?auto_23639 ) ( IS-CRATE ?auto_23640 ) ( AVAILABLE ?auto_23646 ) ( IN ?auto_23640 ?auto_23644 ) ( ON ?auto_23637 ?auto_23636 ) ( ON ?auto_23638 ?auto_23637 ) ( ON ?auto_23639 ?auto_23638 ) ( not ( = ?auto_23636 ?auto_23637 ) ) ( not ( = ?auto_23636 ?auto_23638 ) ) ( not ( = ?auto_23636 ?auto_23639 ) ) ( not ( = ?auto_23636 ?auto_23640 ) ) ( not ( = ?auto_23636 ?auto_23641 ) ) ( not ( = ?auto_23636 ?auto_23642 ) ) ( not ( = ?auto_23637 ?auto_23638 ) ) ( not ( = ?auto_23637 ?auto_23639 ) ) ( not ( = ?auto_23637 ?auto_23640 ) ) ( not ( = ?auto_23637 ?auto_23641 ) ) ( not ( = ?auto_23637 ?auto_23642 ) ) ( not ( = ?auto_23638 ?auto_23639 ) ) ( not ( = ?auto_23638 ?auto_23640 ) ) ( not ( = ?auto_23638 ?auto_23641 ) ) ( not ( = ?auto_23638 ?auto_23642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_23639 ?auto_23640 ?auto_23641 )
      ( MAKE-5CRATE-VERIFY ?auto_23636 ?auto_23637 ?auto_23638 ?auto_23639 ?auto_23640 ?auto_23641 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24004 - SURFACE
      ?auto_24005 - SURFACE
    )
    :vars
    (
      ?auto_24008 - HOIST
      ?auto_24007 - PLACE
      ?auto_24012 - SURFACE
      ?auto_24011 - PLACE
      ?auto_24006 - HOIST
      ?auto_24009 - SURFACE
      ?auto_24010 - TRUCK
      ?auto_24013 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24008 ?auto_24007 ) ( SURFACE-AT ?auto_24004 ?auto_24007 ) ( CLEAR ?auto_24004 ) ( IS-CRATE ?auto_24005 ) ( not ( = ?auto_24004 ?auto_24005 ) ) ( ON ?auto_24004 ?auto_24012 ) ( not ( = ?auto_24012 ?auto_24004 ) ) ( not ( = ?auto_24012 ?auto_24005 ) ) ( not ( = ?auto_24011 ?auto_24007 ) ) ( HOIST-AT ?auto_24006 ?auto_24011 ) ( not ( = ?auto_24008 ?auto_24006 ) ) ( AVAILABLE ?auto_24006 ) ( SURFACE-AT ?auto_24005 ?auto_24011 ) ( ON ?auto_24005 ?auto_24009 ) ( CLEAR ?auto_24005 ) ( not ( = ?auto_24004 ?auto_24009 ) ) ( not ( = ?auto_24005 ?auto_24009 ) ) ( not ( = ?auto_24012 ?auto_24009 ) ) ( TRUCK-AT ?auto_24010 ?auto_24007 ) ( LIFTING ?auto_24008 ?auto_24013 ) ( IS-CRATE ?auto_24013 ) ( not ( = ?auto_24004 ?auto_24013 ) ) ( not ( = ?auto_24005 ?auto_24013 ) ) ( not ( = ?auto_24012 ?auto_24013 ) ) ( not ( = ?auto_24009 ?auto_24013 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24008 ?auto_24013 ?auto_24010 ?auto_24007 )
      ( MAKE-1CRATE ?auto_24004 ?auto_24005 )
      ( MAKE-1CRATE-VERIFY ?auto_24004 ?auto_24005 ) )
  )

)

