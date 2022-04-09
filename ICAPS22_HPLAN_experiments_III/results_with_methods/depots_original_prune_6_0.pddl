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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27784 - SURFACE
      ?auto_27785 - SURFACE
    )
    :vars
    (
      ?auto_27786 - HOIST
      ?auto_27787 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27786 ?auto_27787 ) ( SURFACE-AT ?auto_27784 ?auto_27787 ) ( CLEAR ?auto_27784 ) ( LIFTING ?auto_27786 ?auto_27785 ) ( IS-CRATE ?auto_27785 ) ( not ( = ?auto_27784 ?auto_27785 ) ) )
    :subtasks
    ( ( !DROP ?auto_27786 ?auto_27785 ?auto_27784 ?auto_27787 )
      ( MAKE-1CRATE-VERIFY ?auto_27784 ?auto_27785 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27788 - SURFACE
      ?auto_27789 - SURFACE
    )
    :vars
    (
      ?auto_27790 - HOIST
      ?auto_27791 - PLACE
      ?auto_27792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27790 ?auto_27791 ) ( SURFACE-AT ?auto_27788 ?auto_27791 ) ( CLEAR ?auto_27788 ) ( IS-CRATE ?auto_27789 ) ( not ( = ?auto_27788 ?auto_27789 ) ) ( TRUCK-AT ?auto_27792 ?auto_27791 ) ( AVAILABLE ?auto_27790 ) ( IN ?auto_27789 ?auto_27792 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27790 ?auto_27789 ?auto_27792 ?auto_27791 )
      ( MAKE-1CRATE ?auto_27788 ?auto_27789 )
      ( MAKE-1CRATE-VERIFY ?auto_27788 ?auto_27789 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27793 - SURFACE
      ?auto_27794 - SURFACE
    )
    :vars
    (
      ?auto_27795 - HOIST
      ?auto_27797 - PLACE
      ?auto_27796 - TRUCK
      ?auto_27798 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27795 ?auto_27797 ) ( SURFACE-AT ?auto_27793 ?auto_27797 ) ( CLEAR ?auto_27793 ) ( IS-CRATE ?auto_27794 ) ( not ( = ?auto_27793 ?auto_27794 ) ) ( AVAILABLE ?auto_27795 ) ( IN ?auto_27794 ?auto_27796 ) ( TRUCK-AT ?auto_27796 ?auto_27798 ) ( not ( = ?auto_27798 ?auto_27797 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27796 ?auto_27798 ?auto_27797 )
      ( MAKE-1CRATE ?auto_27793 ?auto_27794 )
      ( MAKE-1CRATE-VERIFY ?auto_27793 ?auto_27794 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27799 - SURFACE
      ?auto_27800 - SURFACE
    )
    :vars
    (
      ?auto_27803 - HOIST
      ?auto_27802 - PLACE
      ?auto_27801 - TRUCK
      ?auto_27804 - PLACE
      ?auto_27805 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27803 ?auto_27802 ) ( SURFACE-AT ?auto_27799 ?auto_27802 ) ( CLEAR ?auto_27799 ) ( IS-CRATE ?auto_27800 ) ( not ( = ?auto_27799 ?auto_27800 ) ) ( AVAILABLE ?auto_27803 ) ( TRUCK-AT ?auto_27801 ?auto_27804 ) ( not ( = ?auto_27804 ?auto_27802 ) ) ( HOIST-AT ?auto_27805 ?auto_27804 ) ( LIFTING ?auto_27805 ?auto_27800 ) ( not ( = ?auto_27803 ?auto_27805 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27805 ?auto_27800 ?auto_27801 ?auto_27804 )
      ( MAKE-1CRATE ?auto_27799 ?auto_27800 )
      ( MAKE-1CRATE-VERIFY ?auto_27799 ?auto_27800 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27806 - SURFACE
      ?auto_27807 - SURFACE
    )
    :vars
    (
      ?auto_27812 - HOIST
      ?auto_27811 - PLACE
      ?auto_27810 - TRUCK
      ?auto_27808 - PLACE
      ?auto_27809 - HOIST
      ?auto_27813 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27812 ?auto_27811 ) ( SURFACE-AT ?auto_27806 ?auto_27811 ) ( CLEAR ?auto_27806 ) ( IS-CRATE ?auto_27807 ) ( not ( = ?auto_27806 ?auto_27807 ) ) ( AVAILABLE ?auto_27812 ) ( TRUCK-AT ?auto_27810 ?auto_27808 ) ( not ( = ?auto_27808 ?auto_27811 ) ) ( HOIST-AT ?auto_27809 ?auto_27808 ) ( not ( = ?auto_27812 ?auto_27809 ) ) ( AVAILABLE ?auto_27809 ) ( SURFACE-AT ?auto_27807 ?auto_27808 ) ( ON ?auto_27807 ?auto_27813 ) ( CLEAR ?auto_27807 ) ( not ( = ?auto_27806 ?auto_27813 ) ) ( not ( = ?auto_27807 ?auto_27813 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27809 ?auto_27807 ?auto_27813 ?auto_27808 )
      ( MAKE-1CRATE ?auto_27806 ?auto_27807 )
      ( MAKE-1CRATE-VERIFY ?auto_27806 ?auto_27807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27814 - SURFACE
      ?auto_27815 - SURFACE
    )
    :vars
    (
      ?auto_27820 - HOIST
      ?auto_27816 - PLACE
      ?auto_27821 - PLACE
      ?auto_27817 - HOIST
      ?auto_27819 - SURFACE
      ?auto_27818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27820 ?auto_27816 ) ( SURFACE-AT ?auto_27814 ?auto_27816 ) ( CLEAR ?auto_27814 ) ( IS-CRATE ?auto_27815 ) ( not ( = ?auto_27814 ?auto_27815 ) ) ( AVAILABLE ?auto_27820 ) ( not ( = ?auto_27821 ?auto_27816 ) ) ( HOIST-AT ?auto_27817 ?auto_27821 ) ( not ( = ?auto_27820 ?auto_27817 ) ) ( AVAILABLE ?auto_27817 ) ( SURFACE-AT ?auto_27815 ?auto_27821 ) ( ON ?auto_27815 ?auto_27819 ) ( CLEAR ?auto_27815 ) ( not ( = ?auto_27814 ?auto_27819 ) ) ( not ( = ?auto_27815 ?auto_27819 ) ) ( TRUCK-AT ?auto_27818 ?auto_27816 ) )
    :subtasks
    ( ( !DRIVE ?auto_27818 ?auto_27816 ?auto_27821 )
      ( MAKE-1CRATE ?auto_27814 ?auto_27815 )
      ( MAKE-1CRATE-VERIFY ?auto_27814 ?auto_27815 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27831 - SURFACE
      ?auto_27832 - SURFACE
      ?auto_27833 - SURFACE
    )
    :vars
    (
      ?auto_27834 - HOIST
      ?auto_27835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27834 ?auto_27835 ) ( SURFACE-AT ?auto_27832 ?auto_27835 ) ( CLEAR ?auto_27832 ) ( LIFTING ?auto_27834 ?auto_27833 ) ( IS-CRATE ?auto_27833 ) ( not ( = ?auto_27832 ?auto_27833 ) ) ( ON ?auto_27832 ?auto_27831 ) ( not ( = ?auto_27831 ?auto_27832 ) ) ( not ( = ?auto_27831 ?auto_27833 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27832 ?auto_27833 )
      ( MAKE-2CRATE-VERIFY ?auto_27831 ?auto_27832 ?auto_27833 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27841 - SURFACE
      ?auto_27842 - SURFACE
      ?auto_27843 - SURFACE
    )
    :vars
    (
      ?auto_27846 - HOIST
      ?auto_27844 - PLACE
      ?auto_27845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27846 ?auto_27844 ) ( SURFACE-AT ?auto_27842 ?auto_27844 ) ( CLEAR ?auto_27842 ) ( IS-CRATE ?auto_27843 ) ( not ( = ?auto_27842 ?auto_27843 ) ) ( TRUCK-AT ?auto_27845 ?auto_27844 ) ( AVAILABLE ?auto_27846 ) ( IN ?auto_27843 ?auto_27845 ) ( ON ?auto_27842 ?auto_27841 ) ( not ( = ?auto_27841 ?auto_27842 ) ) ( not ( = ?auto_27841 ?auto_27843 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27842 ?auto_27843 )
      ( MAKE-2CRATE-VERIFY ?auto_27841 ?auto_27842 ?auto_27843 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27847 - SURFACE
      ?auto_27848 - SURFACE
    )
    :vars
    (
      ?auto_27851 - HOIST
      ?auto_27849 - PLACE
      ?auto_27850 - TRUCK
      ?auto_27852 - SURFACE
      ?auto_27853 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27851 ?auto_27849 ) ( SURFACE-AT ?auto_27847 ?auto_27849 ) ( CLEAR ?auto_27847 ) ( IS-CRATE ?auto_27848 ) ( not ( = ?auto_27847 ?auto_27848 ) ) ( AVAILABLE ?auto_27851 ) ( IN ?auto_27848 ?auto_27850 ) ( ON ?auto_27847 ?auto_27852 ) ( not ( = ?auto_27852 ?auto_27847 ) ) ( not ( = ?auto_27852 ?auto_27848 ) ) ( TRUCK-AT ?auto_27850 ?auto_27853 ) ( not ( = ?auto_27853 ?auto_27849 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27850 ?auto_27853 ?auto_27849 )
      ( MAKE-2CRATE ?auto_27852 ?auto_27847 ?auto_27848 )
      ( MAKE-1CRATE-VERIFY ?auto_27847 ?auto_27848 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27854 - SURFACE
      ?auto_27855 - SURFACE
      ?auto_27856 - SURFACE
    )
    :vars
    (
      ?auto_27859 - HOIST
      ?auto_27858 - PLACE
      ?auto_27857 - TRUCK
      ?auto_27860 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27859 ?auto_27858 ) ( SURFACE-AT ?auto_27855 ?auto_27858 ) ( CLEAR ?auto_27855 ) ( IS-CRATE ?auto_27856 ) ( not ( = ?auto_27855 ?auto_27856 ) ) ( AVAILABLE ?auto_27859 ) ( IN ?auto_27856 ?auto_27857 ) ( ON ?auto_27855 ?auto_27854 ) ( not ( = ?auto_27854 ?auto_27855 ) ) ( not ( = ?auto_27854 ?auto_27856 ) ) ( TRUCK-AT ?auto_27857 ?auto_27860 ) ( not ( = ?auto_27860 ?auto_27858 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27855 ?auto_27856 )
      ( MAKE-2CRATE-VERIFY ?auto_27854 ?auto_27855 ?auto_27856 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27861 - SURFACE
      ?auto_27862 - SURFACE
    )
    :vars
    (
      ?auto_27866 - HOIST
      ?auto_27864 - PLACE
      ?auto_27863 - SURFACE
      ?auto_27867 - TRUCK
      ?auto_27865 - PLACE
      ?auto_27868 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27866 ?auto_27864 ) ( SURFACE-AT ?auto_27861 ?auto_27864 ) ( CLEAR ?auto_27861 ) ( IS-CRATE ?auto_27862 ) ( not ( = ?auto_27861 ?auto_27862 ) ) ( AVAILABLE ?auto_27866 ) ( ON ?auto_27861 ?auto_27863 ) ( not ( = ?auto_27863 ?auto_27861 ) ) ( not ( = ?auto_27863 ?auto_27862 ) ) ( TRUCK-AT ?auto_27867 ?auto_27865 ) ( not ( = ?auto_27865 ?auto_27864 ) ) ( HOIST-AT ?auto_27868 ?auto_27865 ) ( LIFTING ?auto_27868 ?auto_27862 ) ( not ( = ?auto_27866 ?auto_27868 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27868 ?auto_27862 ?auto_27867 ?auto_27865 )
      ( MAKE-2CRATE ?auto_27863 ?auto_27861 ?auto_27862 )
      ( MAKE-1CRATE-VERIFY ?auto_27861 ?auto_27862 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27869 - SURFACE
      ?auto_27870 - SURFACE
      ?auto_27871 - SURFACE
    )
    :vars
    (
      ?auto_27874 - HOIST
      ?auto_27873 - PLACE
      ?auto_27875 - TRUCK
      ?auto_27876 - PLACE
      ?auto_27872 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27874 ?auto_27873 ) ( SURFACE-AT ?auto_27870 ?auto_27873 ) ( CLEAR ?auto_27870 ) ( IS-CRATE ?auto_27871 ) ( not ( = ?auto_27870 ?auto_27871 ) ) ( AVAILABLE ?auto_27874 ) ( ON ?auto_27870 ?auto_27869 ) ( not ( = ?auto_27869 ?auto_27870 ) ) ( not ( = ?auto_27869 ?auto_27871 ) ) ( TRUCK-AT ?auto_27875 ?auto_27876 ) ( not ( = ?auto_27876 ?auto_27873 ) ) ( HOIST-AT ?auto_27872 ?auto_27876 ) ( LIFTING ?auto_27872 ?auto_27871 ) ( not ( = ?auto_27874 ?auto_27872 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27870 ?auto_27871 )
      ( MAKE-2CRATE-VERIFY ?auto_27869 ?auto_27870 ?auto_27871 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27877 - SURFACE
      ?auto_27878 - SURFACE
    )
    :vars
    (
      ?auto_27882 - HOIST
      ?auto_27879 - PLACE
      ?auto_27883 - SURFACE
      ?auto_27880 - TRUCK
      ?auto_27884 - PLACE
      ?auto_27881 - HOIST
      ?auto_27885 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27882 ?auto_27879 ) ( SURFACE-AT ?auto_27877 ?auto_27879 ) ( CLEAR ?auto_27877 ) ( IS-CRATE ?auto_27878 ) ( not ( = ?auto_27877 ?auto_27878 ) ) ( AVAILABLE ?auto_27882 ) ( ON ?auto_27877 ?auto_27883 ) ( not ( = ?auto_27883 ?auto_27877 ) ) ( not ( = ?auto_27883 ?auto_27878 ) ) ( TRUCK-AT ?auto_27880 ?auto_27884 ) ( not ( = ?auto_27884 ?auto_27879 ) ) ( HOIST-AT ?auto_27881 ?auto_27884 ) ( not ( = ?auto_27882 ?auto_27881 ) ) ( AVAILABLE ?auto_27881 ) ( SURFACE-AT ?auto_27878 ?auto_27884 ) ( ON ?auto_27878 ?auto_27885 ) ( CLEAR ?auto_27878 ) ( not ( = ?auto_27877 ?auto_27885 ) ) ( not ( = ?auto_27878 ?auto_27885 ) ) ( not ( = ?auto_27883 ?auto_27885 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27881 ?auto_27878 ?auto_27885 ?auto_27884 )
      ( MAKE-2CRATE ?auto_27883 ?auto_27877 ?auto_27878 )
      ( MAKE-1CRATE-VERIFY ?auto_27877 ?auto_27878 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27886 - SURFACE
      ?auto_27887 - SURFACE
      ?auto_27888 - SURFACE
    )
    :vars
    (
      ?auto_27892 - HOIST
      ?auto_27890 - PLACE
      ?auto_27891 - TRUCK
      ?auto_27894 - PLACE
      ?auto_27893 - HOIST
      ?auto_27889 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27892 ?auto_27890 ) ( SURFACE-AT ?auto_27887 ?auto_27890 ) ( CLEAR ?auto_27887 ) ( IS-CRATE ?auto_27888 ) ( not ( = ?auto_27887 ?auto_27888 ) ) ( AVAILABLE ?auto_27892 ) ( ON ?auto_27887 ?auto_27886 ) ( not ( = ?auto_27886 ?auto_27887 ) ) ( not ( = ?auto_27886 ?auto_27888 ) ) ( TRUCK-AT ?auto_27891 ?auto_27894 ) ( not ( = ?auto_27894 ?auto_27890 ) ) ( HOIST-AT ?auto_27893 ?auto_27894 ) ( not ( = ?auto_27892 ?auto_27893 ) ) ( AVAILABLE ?auto_27893 ) ( SURFACE-AT ?auto_27888 ?auto_27894 ) ( ON ?auto_27888 ?auto_27889 ) ( CLEAR ?auto_27888 ) ( not ( = ?auto_27887 ?auto_27889 ) ) ( not ( = ?auto_27888 ?auto_27889 ) ) ( not ( = ?auto_27886 ?auto_27889 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27887 ?auto_27888 )
      ( MAKE-2CRATE-VERIFY ?auto_27886 ?auto_27887 ?auto_27888 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27895 - SURFACE
      ?auto_27896 - SURFACE
    )
    :vars
    (
      ?auto_27901 - HOIST
      ?auto_27902 - PLACE
      ?auto_27903 - SURFACE
      ?auto_27899 - PLACE
      ?auto_27897 - HOIST
      ?auto_27900 - SURFACE
      ?auto_27898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27901 ?auto_27902 ) ( SURFACE-AT ?auto_27895 ?auto_27902 ) ( CLEAR ?auto_27895 ) ( IS-CRATE ?auto_27896 ) ( not ( = ?auto_27895 ?auto_27896 ) ) ( AVAILABLE ?auto_27901 ) ( ON ?auto_27895 ?auto_27903 ) ( not ( = ?auto_27903 ?auto_27895 ) ) ( not ( = ?auto_27903 ?auto_27896 ) ) ( not ( = ?auto_27899 ?auto_27902 ) ) ( HOIST-AT ?auto_27897 ?auto_27899 ) ( not ( = ?auto_27901 ?auto_27897 ) ) ( AVAILABLE ?auto_27897 ) ( SURFACE-AT ?auto_27896 ?auto_27899 ) ( ON ?auto_27896 ?auto_27900 ) ( CLEAR ?auto_27896 ) ( not ( = ?auto_27895 ?auto_27900 ) ) ( not ( = ?auto_27896 ?auto_27900 ) ) ( not ( = ?auto_27903 ?auto_27900 ) ) ( TRUCK-AT ?auto_27898 ?auto_27902 ) )
    :subtasks
    ( ( !DRIVE ?auto_27898 ?auto_27902 ?auto_27899 )
      ( MAKE-2CRATE ?auto_27903 ?auto_27895 ?auto_27896 )
      ( MAKE-1CRATE-VERIFY ?auto_27895 ?auto_27896 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27904 - SURFACE
      ?auto_27905 - SURFACE
      ?auto_27906 - SURFACE
    )
    :vars
    (
      ?auto_27908 - HOIST
      ?auto_27909 - PLACE
      ?auto_27910 - PLACE
      ?auto_27907 - HOIST
      ?auto_27912 - SURFACE
      ?auto_27911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27908 ?auto_27909 ) ( SURFACE-AT ?auto_27905 ?auto_27909 ) ( CLEAR ?auto_27905 ) ( IS-CRATE ?auto_27906 ) ( not ( = ?auto_27905 ?auto_27906 ) ) ( AVAILABLE ?auto_27908 ) ( ON ?auto_27905 ?auto_27904 ) ( not ( = ?auto_27904 ?auto_27905 ) ) ( not ( = ?auto_27904 ?auto_27906 ) ) ( not ( = ?auto_27910 ?auto_27909 ) ) ( HOIST-AT ?auto_27907 ?auto_27910 ) ( not ( = ?auto_27908 ?auto_27907 ) ) ( AVAILABLE ?auto_27907 ) ( SURFACE-AT ?auto_27906 ?auto_27910 ) ( ON ?auto_27906 ?auto_27912 ) ( CLEAR ?auto_27906 ) ( not ( = ?auto_27905 ?auto_27912 ) ) ( not ( = ?auto_27906 ?auto_27912 ) ) ( not ( = ?auto_27904 ?auto_27912 ) ) ( TRUCK-AT ?auto_27911 ?auto_27909 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27905 ?auto_27906 )
      ( MAKE-2CRATE-VERIFY ?auto_27904 ?auto_27905 ?auto_27906 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27913 - SURFACE
      ?auto_27914 - SURFACE
    )
    :vars
    (
      ?auto_27920 - HOIST
      ?auto_27915 - PLACE
      ?auto_27916 - SURFACE
      ?auto_27917 - PLACE
      ?auto_27918 - HOIST
      ?auto_27919 - SURFACE
      ?auto_27921 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27920 ?auto_27915 ) ( IS-CRATE ?auto_27914 ) ( not ( = ?auto_27913 ?auto_27914 ) ) ( not ( = ?auto_27916 ?auto_27913 ) ) ( not ( = ?auto_27916 ?auto_27914 ) ) ( not ( = ?auto_27917 ?auto_27915 ) ) ( HOIST-AT ?auto_27918 ?auto_27917 ) ( not ( = ?auto_27920 ?auto_27918 ) ) ( AVAILABLE ?auto_27918 ) ( SURFACE-AT ?auto_27914 ?auto_27917 ) ( ON ?auto_27914 ?auto_27919 ) ( CLEAR ?auto_27914 ) ( not ( = ?auto_27913 ?auto_27919 ) ) ( not ( = ?auto_27914 ?auto_27919 ) ) ( not ( = ?auto_27916 ?auto_27919 ) ) ( TRUCK-AT ?auto_27921 ?auto_27915 ) ( SURFACE-AT ?auto_27916 ?auto_27915 ) ( CLEAR ?auto_27916 ) ( LIFTING ?auto_27920 ?auto_27913 ) ( IS-CRATE ?auto_27913 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27916 ?auto_27913 )
      ( MAKE-2CRATE ?auto_27916 ?auto_27913 ?auto_27914 )
      ( MAKE-1CRATE-VERIFY ?auto_27913 ?auto_27914 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27922 - SURFACE
      ?auto_27923 - SURFACE
      ?auto_27924 - SURFACE
    )
    :vars
    (
      ?auto_27925 - HOIST
      ?auto_27927 - PLACE
      ?auto_27930 - PLACE
      ?auto_27926 - HOIST
      ?auto_27929 - SURFACE
      ?auto_27928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27925 ?auto_27927 ) ( IS-CRATE ?auto_27924 ) ( not ( = ?auto_27923 ?auto_27924 ) ) ( not ( = ?auto_27922 ?auto_27923 ) ) ( not ( = ?auto_27922 ?auto_27924 ) ) ( not ( = ?auto_27930 ?auto_27927 ) ) ( HOIST-AT ?auto_27926 ?auto_27930 ) ( not ( = ?auto_27925 ?auto_27926 ) ) ( AVAILABLE ?auto_27926 ) ( SURFACE-AT ?auto_27924 ?auto_27930 ) ( ON ?auto_27924 ?auto_27929 ) ( CLEAR ?auto_27924 ) ( not ( = ?auto_27923 ?auto_27929 ) ) ( not ( = ?auto_27924 ?auto_27929 ) ) ( not ( = ?auto_27922 ?auto_27929 ) ) ( TRUCK-AT ?auto_27928 ?auto_27927 ) ( SURFACE-AT ?auto_27922 ?auto_27927 ) ( CLEAR ?auto_27922 ) ( LIFTING ?auto_27925 ?auto_27923 ) ( IS-CRATE ?auto_27923 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27923 ?auto_27924 )
      ( MAKE-2CRATE-VERIFY ?auto_27922 ?auto_27923 ?auto_27924 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27931 - SURFACE
      ?auto_27932 - SURFACE
    )
    :vars
    (
      ?auto_27939 - HOIST
      ?auto_27937 - PLACE
      ?auto_27936 - SURFACE
      ?auto_27934 - PLACE
      ?auto_27935 - HOIST
      ?auto_27933 - SURFACE
      ?auto_27938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27939 ?auto_27937 ) ( IS-CRATE ?auto_27932 ) ( not ( = ?auto_27931 ?auto_27932 ) ) ( not ( = ?auto_27936 ?auto_27931 ) ) ( not ( = ?auto_27936 ?auto_27932 ) ) ( not ( = ?auto_27934 ?auto_27937 ) ) ( HOIST-AT ?auto_27935 ?auto_27934 ) ( not ( = ?auto_27939 ?auto_27935 ) ) ( AVAILABLE ?auto_27935 ) ( SURFACE-AT ?auto_27932 ?auto_27934 ) ( ON ?auto_27932 ?auto_27933 ) ( CLEAR ?auto_27932 ) ( not ( = ?auto_27931 ?auto_27933 ) ) ( not ( = ?auto_27932 ?auto_27933 ) ) ( not ( = ?auto_27936 ?auto_27933 ) ) ( TRUCK-AT ?auto_27938 ?auto_27937 ) ( SURFACE-AT ?auto_27936 ?auto_27937 ) ( CLEAR ?auto_27936 ) ( IS-CRATE ?auto_27931 ) ( AVAILABLE ?auto_27939 ) ( IN ?auto_27931 ?auto_27938 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27939 ?auto_27931 ?auto_27938 ?auto_27937 )
      ( MAKE-2CRATE ?auto_27936 ?auto_27931 ?auto_27932 )
      ( MAKE-1CRATE-VERIFY ?auto_27931 ?auto_27932 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27940 - SURFACE
      ?auto_27941 - SURFACE
      ?auto_27942 - SURFACE
    )
    :vars
    (
      ?auto_27948 - HOIST
      ?auto_27946 - PLACE
      ?auto_27947 - PLACE
      ?auto_27943 - HOIST
      ?auto_27945 - SURFACE
      ?auto_27944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27948 ?auto_27946 ) ( IS-CRATE ?auto_27942 ) ( not ( = ?auto_27941 ?auto_27942 ) ) ( not ( = ?auto_27940 ?auto_27941 ) ) ( not ( = ?auto_27940 ?auto_27942 ) ) ( not ( = ?auto_27947 ?auto_27946 ) ) ( HOIST-AT ?auto_27943 ?auto_27947 ) ( not ( = ?auto_27948 ?auto_27943 ) ) ( AVAILABLE ?auto_27943 ) ( SURFACE-AT ?auto_27942 ?auto_27947 ) ( ON ?auto_27942 ?auto_27945 ) ( CLEAR ?auto_27942 ) ( not ( = ?auto_27941 ?auto_27945 ) ) ( not ( = ?auto_27942 ?auto_27945 ) ) ( not ( = ?auto_27940 ?auto_27945 ) ) ( TRUCK-AT ?auto_27944 ?auto_27946 ) ( SURFACE-AT ?auto_27940 ?auto_27946 ) ( CLEAR ?auto_27940 ) ( IS-CRATE ?auto_27941 ) ( AVAILABLE ?auto_27948 ) ( IN ?auto_27941 ?auto_27944 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27941 ?auto_27942 )
      ( MAKE-2CRATE-VERIFY ?auto_27940 ?auto_27941 ?auto_27942 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27985 - SURFACE
      ?auto_27986 - SURFACE
    )
    :vars
    (
      ?auto_27990 - HOIST
      ?auto_27989 - PLACE
      ?auto_27991 - SURFACE
      ?auto_27988 - PLACE
      ?auto_27987 - HOIST
      ?auto_27993 - SURFACE
      ?auto_27992 - TRUCK
      ?auto_27994 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27990 ?auto_27989 ) ( SURFACE-AT ?auto_27985 ?auto_27989 ) ( CLEAR ?auto_27985 ) ( IS-CRATE ?auto_27986 ) ( not ( = ?auto_27985 ?auto_27986 ) ) ( AVAILABLE ?auto_27990 ) ( ON ?auto_27985 ?auto_27991 ) ( not ( = ?auto_27991 ?auto_27985 ) ) ( not ( = ?auto_27991 ?auto_27986 ) ) ( not ( = ?auto_27988 ?auto_27989 ) ) ( HOIST-AT ?auto_27987 ?auto_27988 ) ( not ( = ?auto_27990 ?auto_27987 ) ) ( AVAILABLE ?auto_27987 ) ( SURFACE-AT ?auto_27986 ?auto_27988 ) ( ON ?auto_27986 ?auto_27993 ) ( CLEAR ?auto_27986 ) ( not ( = ?auto_27985 ?auto_27993 ) ) ( not ( = ?auto_27986 ?auto_27993 ) ) ( not ( = ?auto_27991 ?auto_27993 ) ) ( TRUCK-AT ?auto_27992 ?auto_27994 ) ( not ( = ?auto_27994 ?auto_27989 ) ) ( not ( = ?auto_27988 ?auto_27994 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27992 ?auto_27994 ?auto_27989 )
      ( MAKE-1CRATE ?auto_27985 ?auto_27986 )
      ( MAKE-1CRATE-VERIFY ?auto_27985 ?auto_27986 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28024 - SURFACE
      ?auto_28025 - SURFACE
      ?auto_28026 - SURFACE
      ?auto_28027 - SURFACE
    )
    :vars
    (
      ?auto_28028 - HOIST
      ?auto_28029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28028 ?auto_28029 ) ( SURFACE-AT ?auto_28026 ?auto_28029 ) ( CLEAR ?auto_28026 ) ( LIFTING ?auto_28028 ?auto_28027 ) ( IS-CRATE ?auto_28027 ) ( not ( = ?auto_28026 ?auto_28027 ) ) ( ON ?auto_28025 ?auto_28024 ) ( ON ?auto_28026 ?auto_28025 ) ( not ( = ?auto_28024 ?auto_28025 ) ) ( not ( = ?auto_28024 ?auto_28026 ) ) ( not ( = ?auto_28024 ?auto_28027 ) ) ( not ( = ?auto_28025 ?auto_28026 ) ) ( not ( = ?auto_28025 ?auto_28027 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28026 ?auto_28027 )
      ( MAKE-3CRATE-VERIFY ?auto_28024 ?auto_28025 ?auto_28026 ?auto_28027 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28041 - SURFACE
      ?auto_28042 - SURFACE
      ?auto_28043 - SURFACE
      ?auto_28044 - SURFACE
    )
    :vars
    (
      ?auto_28047 - HOIST
      ?auto_28045 - PLACE
      ?auto_28046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28047 ?auto_28045 ) ( SURFACE-AT ?auto_28043 ?auto_28045 ) ( CLEAR ?auto_28043 ) ( IS-CRATE ?auto_28044 ) ( not ( = ?auto_28043 ?auto_28044 ) ) ( TRUCK-AT ?auto_28046 ?auto_28045 ) ( AVAILABLE ?auto_28047 ) ( IN ?auto_28044 ?auto_28046 ) ( ON ?auto_28043 ?auto_28042 ) ( not ( = ?auto_28042 ?auto_28043 ) ) ( not ( = ?auto_28042 ?auto_28044 ) ) ( ON ?auto_28042 ?auto_28041 ) ( not ( = ?auto_28041 ?auto_28042 ) ) ( not ( = ?auto_28041 ?auto_28043 ) ) ( not ( = ?auto_28041 ?auto_28044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28042 ?auto_28043 ?auto_28044 )
      ( MAKE-3CRATE-VERIFY ?auto_28041 ?auto_28042 ?auto_28043 ?auto_28044 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28062 - SURFACE
      ?auto_28063 - SURFACE
      ?auto_28064 - SURFACE
      ?auto_28065 - SURFACE
    )
    :vars
    (
      ?auto_28068 - HOIST
      ?auto_28067 - PLACE
      ?auto_28066 - TRUCK
      ?auto_28069 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28068 ?auto_28067 ) ( SURFACE-AT ?auto_28064 ?auto_28067 ) ( CLEAR ?auto_28064 ) ( IS-CRATE ?auto_28065 ) ( not ( = ?auto_28064 ?auto_28065 ) ) ( AVAILABLE ?auto_28068 ) ( IN ?auto_28065 ?auto_28066 ) ( ON ?auto_28064 ?auto_28063 ) ( not ( = ?auto_28063 ?auto_28064 ) ) ( not ( = ?auto_28063 ?auto_28065 ) ) ( TRUCK-AT ?auto_28066 ?auto_28069 ) ( not ( = ?auto_28069 ?auto_28067 ) ) ( ON ?auto_28063 ?auto_28062 ) ( not ( = ?auto_28062 ?auto_28063 ) ) ( not ( = ?auto_28062 ?auto_28064 ) ) ( not ( = ?auto_28062 ?auto_28065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28063 ?auto_28064 ?auto_28065 )
      ( MAKE-3CRATE-VERIFY ?auto_28062 ?auto_28063 ?auto_28064 ?auto_28065 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28086 - SURFACE
      ?auto_28087 - SURFACE
      ?auto_28088 - SURFACE
      ?auto_28089 - SURFACE
    )
    :vars
    (
      ?auto_28094 - HOIST
      ?auto_28092 - PLACE
      ?auto_28090 - TRUCK
      ?auto_28091 - PLACE
      ?auto_28093 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28094 ?auto_28092 ) ( SURFACE-AT ?auto_28088 ?auto_28092 ) ( CLEAR ?auto_28088 ) ( IS-CRATE ?auto_28089 ) ( not ( = ?auto_28088 ?auto_28089 ) ) ( AVAILABLE ?auto_28094 ) ( ON ?auto_28088 ?auto_28087 ) ( not ( = ?auto_28087 ?auto_28088 ) ) ( not ( = ?auto_28087 ?auto_28089 ) ) ( TRUCK-AT ?auto_28090 ?auto_28091 ) ( not ( = ?auto_28091 ?auto_28092 ) ) ( HOIST-AT ?auto_28093 ?auto_28091 ) ( LIFTING ?auto_28093 ?auto_28089 ) ( not ( = ?auto_28094 ?auto_28093 ) ) ( ON ?auto_28087 ?auto_28086 ) ( not ( = ?auto_28086 ?auto_28087 ) ) ( not ( = ?auto_28086 ?auto_28088 ) ) ( not ( = ?auto_28086 ?auto_28089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28087 ?auto_28088 ?auto_28089 )
      ( MAKE-3CRATE-VERIFY ?auto_28086 ?auto_28087 ?auto_28088 ?auto_28089 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28113 - SURFACE
      ?auto_28114 - SURFACE
      ?auto_28115 - SURFACE
      ?auto_28116 - SURFACE
    )
    :vars
    (
      ?auto_28121 - HOIST
      ?auto_28119 - PLACE
      ?auto_28117 - TRUCK
      ?auto_28120 - PLACE
      ?auto_28122 - HOIST
      ?auto_28118 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28121 ?auto_28119 ) ( SURFACE-AT ?auto_28115 ?auto_28119 ) ( CLEAR ?auto_28115 ) ( IS-CRATE ?auto_28116 ) ( not ( = ?auto_28115 ?auto_28116 ) ) ( AVAILABLE ?auto_28121 ) ( ON ?auto_28115 ?auto_28114 ) ( not ( = ?auto_28114 ?auto_28115 ) ) ( not ( = ?auto_28114 ?auto_28116 ) ) ( TRUCK-AT ?auto_28117 ?auto_28120 ) ( not ( = ?auto_28120 ?auto_28119 ) ) ( HOIST-AT ?auto_28122 ?auto_28120 ) ( not ( = ?auto_28121 ?auto_28122 ) ) ( AVAILABLE ?auto_28122 ) ( SURFACE-AT ?auto_28116 ?auto_28120 ) ( ON ?auto_28116 ?auto_28118 ) ( CLEAR ?auto_28116 ) ( not ( = ?auto_28115 ?auto_28118 ) ) ( not ( = ?auto_28116 ?auto_28118 ) ) ( not ( = ?auto_28114 ?auto_28118 ) ) ( ON ?auto_28114 ?auto_28113 ) ( not ( = ?auto_28113 ?auto_28114 ) ) ( not ( = ?auto_28113 ?auto_28115 ) ) ( not ( = ?auto_28113 ?auto_28116 ) ) ( not ( = ?auto_28113 ?auto_28118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28114 ?auto_28115 ?auto_28116 )
      ( MAKE-3CRATE-VERIFY ?auto_28113 ?auto_28114 ?auto_28115 ?auto_28116 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28141 - SURFACE
      ?auto_28142 - SURFACE
      ?auto_28143 - SURFACE
      ?auto_28144 - SURFACE
    )
    :vars
    (
      ?auto_28148 - HOIST
      ?auto_28149 - PLACE
      ?auto_28145 - PLACE
      ?auto_28150 - HOIST
      ?auto_28147 - SURFACE
      ?auto_28146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28148 ?auto_28149 ) ( SURFACE-AT ?auto_28143 ?auto_28149 ) ( CLEAR ?auto_28143 ) ( IS-CRATE ?auto_28144 ) ( not ( = ?auto_28143 ?auto_28144 ) ) ( AVAILABLE ?auto_28148 ) ( ON ?auto_28143 ?auto_28142 ) ( not ( = ?auto_28142 ?auto_28143 ) ) ( not ( = ?auto_28142 ?auto_28144 ) ) ( not ( = ?auto_28145 ?auto_28149 ) ) ( HOIST-AT ?auto_28150 ?auto_28145 ) ( not ( = ?auto_28148 ?auto_28150 ) ) ( AVAILABLE ?auto_28150 ) ( SURFACE-AT ?auto_28144 ?auto_28145 ) ( ON ?auto_28144 ?auto_28147 ) ( CLEAR ?auto_28144 ) ( not ( = ?auto_28143 ?auto_28147 ) ) ( not ( = ?auto_28144 ?auto_28147 ) ) ( not ( = ?auto_28142 ?auto_28147 ) ) ( TRUCK-AT ?auto_28146 ?auto_28149 ) ( ON ?auto_28142 ?auto_28141 ) ( not ( = ?auto_28141 ?auto_28142 ) ) ( not ( = ?auto_28141 ?auto_28143 ) ) ( not ( = ?auto_28141 ?auto_28144 ) ) ( not ( = ?auto_28141 ?auto_28147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28142 ?auto_28143 ?auto_28144 )
      ( MAKE-3CRATE-VERIFY ?auto_28141 ?auto_28142 ?auto_28143 ?auto_28144 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28169 - SURFACE
      ?auto_28170 - SURFACE
      ?auto_28171 - SURFACE
      ?auto_28172 - SURFACE
    )
    :vars
    (
      ?auto_28177 - HOIST
      ?auto_28176 - PLACE
      ?auto_28175 - PLACE
      ?auto_28173 - HOIST
      ?auto_28178 - SURFACE
      ?auto_28174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28177 ?auto_28176 ) ( IS-CRATE ?auto_28172 ) ( not ( = ?auto_28171 ?auto_28172 ) ) ( not ( = ?auto_28170 ?auto_28171 ) ) ( not ( = ?auto_28170 ?auto_28172 ) ) ( not ( = ?auto_28175 ?auto_28176 ) ) ( HOIST-AT ?auto_28173 ?auto_28175 ) ( not ( = ?auto_28177 ?auto_28173 ) ) ( AVAILABLE ?auto_28173 ) ( SURFACE-AT ?auto_28172 ?auto_28175 ) ( ON ?auto_28172 ?auto_28178 ) ( CLEAR ?auto_28172 ) ( not ( = ?auto_28171 ?auto_28178 ) ) ( not ( = ?auto_28172 ?auto_28178 ) ) ( not ( = ?auto_28170 ?auto_28178 ) ) ( TRUCK-AT ?auto_28174 ?auto_28176 ) ( SURFACE-AT ?auto_28170 ?auto_28176 ) ( CLEAR ?auto_28170 ) ( LIFTING ?auto_28177 ?auto_28171 ) ( IS-CRATE ?auto_28171 ) ( ON ?auto_28170 ?auto_28169 ) ( not ( = ?auto_28169 ?auto_28170 ) ) ( not ( = ?auto_28169 ?auto_28171 ) ) ( not ( = ?auto_28169 ?auto_28172 ) ) ( not ( = ?auto_28169 ?auto_28178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28170 ?auto_28171 ?auto_28172 )
      ( MAKE-3CRATE-VERIFY ?auto_28169 ?auto_28170 ?auto_28171 ?auto_28172 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28197 - SURFACE
      ?auto_28198 - SURFACE
      ?auto_28199 - SURFACE
      ?auto_28200 - SURFACE
    )
    :vars
    (
      ?auto_28206 - HOIST
      ?auto_28201 - PLACE
      ?auto_28202 - PLACE
      ?auto_28203 - HOIST
      ?auto_28204 - SURFACE
      ?auto_28205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28206 ?auto_28201 ) ( IS-CRATE ?auto_28200 ) ( not ( = ?auto_28199 ?auto_28200 ) ) ( not ( = ?auto_28198 ?auto_28199 ) ) ( not ( = ?auto_28198 ?auto_28200 ) ) ( not ( = ?auto_28202 ?auto_28201 ) ) ( HOIST-AT ?auto_28203 ?auto_28202 ) ( not ( = ?auto_28206 ?auto_28203 ) ) ( AVAILABLE ?auto_28203 ) ( SURFACE-AT ?auto_28200 ?auto_28202 ) ( ON ?auto_28200 ?auto_28204 ) ( CLEAR ?auto_28200 ) ( not ( = ?auto_28199 ?auto_28204 ) ) ( not ( = ?auto_28200 ?auto_28204 ) ) ( not ( = ?auto_28198 ?auto_28204 ) ) ( TRUCK-AT ?auto_28205 ?auto_28201 ) ( SURFACE-AT ?auto_28198 ?auto_28201 ) ( CLEAR ?auto_28198 ) ( IS-CRATE ?auto_28199 ) ( AVAILABLE ?auto_28206 ) ( IN ?auto_28199 ?auto_28205 ) ( ON ?auto_28198 ?auto_28197 ) ( not ( = ?auto_28197 ?auto_28198 ) ) ( not ( = ?auto_28197 ?auto_28199 ) ) ( not ( = ?auto_28197 ?auto_28200 ) ) ( not ( = ?auto_28197 ?auto_28204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28198 ?auto_28199 ?auto_28200 )
      ( MAKE-3CRATE-VERIFY ?auto_28197 ?auto_28198 ?auto_28199 ?auto_28200 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28488 - SURFACE
      ?auto_28489 - SURFACE
      ?auto_28490 - SURFACE
      ?auto_28492 - SURFACE
      ?auto_28491 - SURFACE
    )
    :vars
    (
      ?auto_28493 - HOIST
      ?auto_28494 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28493 ?auto_28494 ) ( SURFACE-AT ?auto_28492 ?auto_28494 ) ( CLEAR ?auto_28492 ) ( LIFTING ?auto_28493 ?auto_28491 ) ( IS-CRATE ?auto_28491 ) ( not ( = ?auto_28492 ?auto_28491 ) ) ( ON ?auto_28489 ?auto_28488 ) ( ON ?auto_28490 ?auto_28489 ) ( ON ?auto_28492 ?auto_28490 ) ( not ( = ?auto_28488 ?auto_28489 ) ) ( not ( = ?auto_28488 ?auto_28490 ) ) ( not ( = ?auto_28488 ?auto_28492 ) ) ( not ( = ?auto_28488 ?auto_28491 ) ) ( not ( = ?auto_28489 ?auto_28490 ) ) ( not ( = ?auto_28489 ?auto_28492 ) ) ( not ( = ?auto_28489 ?auto_28491 ) ) ( not ( = ?auto_28490 ?auto_28492 ) ) ( not ( = ?auto_28490 ?auto_28491 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28492 ?auto_28491 )
      ( MAKE-4CRATE-VERIFY ?auto_28488 ?auto_28489 ?auto_28490 ?auto_28492 ?auto_28491 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28513 - SURFACE
      ?auto_28514 - SURFACE
      ?auto_28515 - SURFACE
      ?auto_28517 - SURFACE
      ?auto_28516 - SURFACE
    )
    :vars
    (
      ?auto_28518 - HOIST
      ?auto_28519 - PLACE
      ?auto_28520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28518 ?auto_28519 ) ( SURFACE-AT ?auto_28517 ?auto_28519 ) ( CLEAR ?auto_28517 ) ( IS-CRATE ?auto_28516 ) ( not ( = ?auto_28517 ?auto_28516 ) ) ( TRUCK-AT ?auto_28520 ?auto_28519 ) ( AVAILABLE ?auto_28518 ) ( IN ?auto_28516 ?auto_28520 ) ( ON ?auto_28517 ?auto_28515 ) ( not ( = ?auto_28515 ?auto_28517 ) ) ( not ( = ?auto_28515 ?auto_28516 ) ) ( ON ?auto_28514 ?auto_28513 ) ( ON ?auto_28515 ?auto_28514 ) ( not ( = ?auto_28513 ?auto_28514 ) ) ( not ( = ?auto_28513 ?auto_28515 ) ) ( not ( = ?auto_28513 ?auto_28517 ) ) ( not ( = ?auto_28513 ?auto_28516 ) ) ( not ( = ?auto_28514 ?auto_28515 ) ) ( not ( = ?auto_28514 ?auto_28517 ) ) ( not ( = ?auto_28514 ?auto_28516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28515 ?auto_28517 ?auto_28516 )
      ( MAKE-4CRATE-VERIFY ?auto_28513 ?auto_28514 ?auto_28515 ?auto_28517 ?auto_28516 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28543 - SURFACE
      ?auto_28544 - SURFACE
      ?auto_28545 - SURFACE
      ?auto_28547 - SURFACE
      ?auto_28546 - SURFACE
    )
    :vars
    (
      ?auto_28548 - HOIST
      ?auto_28551 - PLACE
      ?auto_28550 - TRUCK
      ?auto_28549 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28548 ?auto_28551 ) ( SURFACE-AT ?auto_28547 ?auto_28551 ) ( CLEAR ?auto_28547 ) ( IS-CRATE ?auto_28546 ) ( not ( = ?auto_28547 ?auto_28546 ) ) ( AVAILABLE ?auto_28548 ) ( IN ?auto_28546 ?auto_28550 ) ( ON ?auto_28547 ?auto_28545 ) ( not ( = ?auto_28545 ?auto_28547 ) ) ( not ( = ?auto_28545 ?auto_28546 ) ) ( TRUCK-AT ?auto_28550 ?auto_28549 ) ( not ( = ?auto_28549 ?auto_28551 ) ) ( ON ?auto_28544 ?auto_28543 ) ( ON ?auto_28545 ?auto_28544 ) ( not ( = ?auto_28543 ?auto_28544 ) ) ( not ( = ?auto_28543 ?auto_28545 ) ) ( not ( = ?auto_28543 ?auto_28547 ) ) ( not ( = ?auto_28543 ?auto_28546 ) ) ( not ( = ?auto_28544 ?auto_28545 ) ) ( not ( = ?auto_28544 ?auto_28547 ) ) ( not ( = ?auto_28544 ?auto_28546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28545 ?auto_28547 ?auto_28546 )
      ( MAKE-4CRATE-VERIFY ?auto_28543 ?auto_28544 ?auto_28545 ?auto_28547 ?auto_28546 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28577 - SURFACE
      ?auto_28578 - SURFACE
      ?auto_28579 - SURFACE
      ?auto_28581 - SURFACE
      ?auto_28580 - SURFACE
    )
    :vars
    (
      ?auto_28585 - HOIST
      ?auto_28582 - PLACE
      ?auto_28586 - TRUCK
      ?auto_28584 - PLACE
      ?auto_28583 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28585 ?auto_28582 ) ( SURFACE-AT ?auto_28581 ?auto_28582 ) ( CLEAR ?auto_28581 ) ( IS-CRATE ?auto_28580 ) ( not ( = ?auto_28581 ?auto_28580 ) ) ( AVAILABLE ?auto_28585 ) ( ON ?auto_28581 ?auto_28579 ) ( not ( = ?auto_28579 ?auto_28581 ) ) ( not ( = ?auto_28579 ?auto_28580 ) ) ( TRUCK-AT ?auto_28586 ?auto_28584 ) ( not ( = ?auto_28584 ?auto_28582 ) ) ( HOIST-AT ?auto_28583 ?auto_28584 ) ( LIFTING ?auto_28583 ?auto_28580 ) ( not ( = ?auto_28585 ?auto_28583 ) ) ( ON ?auto_28578 ?auto_28577 ) ( ON ?auto_28579 ?auto_28578 ) ( not ( = ?auto_28577 ?auto_28578 ) ) ( not ( = ?auto_28577 ?auto_28579 ) ) ( not ( = ?auto_28577 ?auto_28581 ) ) ( not ( = ?auto_28577 ?auto_28580 ) ) ( not ( = ?auto_28578 ?auto_28579 ) ) ( not ( = ?auto_28578 ?auto_28581 ) ) ( not ( = ?auto_28578 ?auto_28580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28579 ?auto_28581 ?auto_28580 )
      ( MAKE-4CRATE-VERIFY ?auto_28577 ?auto_28578 ?auto_28579 ?auto_28581 ?auto_28580 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28615 - SURFACE
      ?auto_28616 - SURFACE
      ?auto_28617 - SURFACE
      ?auto_28619 - SURFACE
      ?auto_28618 - SURFACE
    )
    :vars
    (
      ?auto_28622 - HOIST
      ?auto_28623 - PLACE
      ?auto_28625 - TRUCK
      ?auto_28624 - PLACE
      ?auto_28620 - HOIST
      ?auto_28621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28622 ?auto_28623 ) ( SURFACE-AT ?auto_28619 ?auto_28623 ) ( CLEAR ?auto_28619 ) ( IS-CRATE ?auto_28618 ) ( not ( = ?auto_28619 ?auto_28618 ) ) ( AVAILABLE ?auto_28622 ) ( ON ?auto_28619 ?auto_28617 ) ( not ( = ?auto_28617 ?auto_28619 ) ) ( not ( = ?auto_28617 ?auto_28618 ) ) ( TRUCK-AT ?auto_28625 ?auto_28624 ) ( not ( = ?auto_28624 ?auto_28623 ) ) ( HOIST-AT ?auto_28620 ?auto_28624 ) ( not ( = ?auto_28622 ?auto_28620 ) ) ( AVAILABLE ?auto_28620 ) ( SURFACE-AT ?auto_28618 ?auto_28624 ) ( ON ?auto_28618 ?auto_28621 ) ( CLEAR ?auto_28618 ) ( not ( = ?auto_28619 ?auto_28621 ) ) ( not ( = ?auto_28618 ?auto_28621 ) ) ( not ( = ?auto_28617 ?auto_28621 ) ) ( ON ?auto_28616 ?auto_28615 ) ( ON ?auto_28617 ?auto_28616 ) ( not ( = ?auto_28615 ?auto_28616 ) ) ( not ( = ?auto_28615 ?auto_28617 ) ) ( not ( = ?auto_28615 ?auto_28619 ) ) ( not ( = ?auto_28615 ?auto_28618 ) ) ( not ( = ?auto_28615 ?auto_28621 ) ) ( not ( = ?auto_28616 ?auto_28617 ) ) ( not ( = ?auto_28616 ?auto_28619 ) ) ( not ( = ?auto_28616 ?auto_28618 ) ) ( not ( = ?auto_28616 ?auto_28621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28617 ?auto_28619 ?auto_28618 )
      ( MAKE-4CRATE-VERIFY ?auto_28615 ?auto_28616 ?auto_28617 ?auto_28619 ?auto_28618 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28654 - SURFACE
      ?auto_28655 - SURFACE
      ?auto_28656 - SURFACE
      ?auto_28658 - SURFACE
      ?auto_28657 - SURFACE
    )
    :vars
    (
      ?auto_28662 - HOIST
      ?auto_28660 - PLACE
      ?auto_28664 - PLACE
      ?auto_28663 - HOIST
      ?auto_28661 - SURFACE
      ?auto_28659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28662 ?auto_28660 ) ( SURFACE-AT ?auto_28658 ?auto_28660 ) ( CLEAR ?auto_28658 ) ( IS-CRATE ?auto_28657 ) ( not ( = ?auto_28658 ?auto_28657 ) ) ( AVAILABLE ?auto_28662 ) ( ON ?auto_28658 ?auto_28656 ) ( not ( = ?auto_28656 ?auto_28658 ) ) ( not ( = ?auto_28656 ?auto_28657 ) ) ( not ( = ?auto_28664 ?auto_28660 ) ) ( HOIST-AT ?auto_28663 ?auto_28664 ) ( not ( = ?auto_28662 ?auto_28663 ) ) ( AVAILABLE ?auto_28663 ) ( SURFACE-AT ?auto_28657 ?auto_28664 ) ( ON ?auto_28657 ?auto_28661 ) ( CLEAR ?auto_28657 ) ( not ( = ?auto_28658 ?auto_28661 ) ) ( not ( = ?auto_28657 ?auto_28661 ) ) ( not ( = ?auto_28656 ?auto_28661 ) ) ( TRUCK-AT ?auto_28659 ?auto_28660 ) ( ON ?auto_28655 ?auto_28654 ) ( ON ?auto_28656 ?auto_28655 ) ( not ( = ?auto_28654 ?auto_28655 ) ) ( not ( = ?auto_28654 ?auto_28656 ) ) ( not ( = ?auto_28654 ?auto_28658 ) ) ( not ( = ?auto_28654 ?auto_28657 ) ) ( not ( = ?auto_28654 ?auto_28661 ) ) ( not ( = ?auto_28655 ?auto_28656 ) ) ( not ( = ?auto_28655 ?auto_28658 ) ) ( not ( = ?auto_28655 ?auto_28657 ) ) ( not ( = ?auto_28655 ?auto_28661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28656 ?auto_28658 ?auto_28657 )
      ( MAKE-4CRATE-VERIFY ?auto_28654 ?auto_28655 ?auto_28656 ?auto_28658 ?auto_28657 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28693 - SURFACE
      ?auto_28694 - SURFACE
      ?auto_28695 - SURFACE
      ?auto_28697 - SURFACE
      ?auto_28696 - SURFACE
    )
    :vars
    (
      ?auto_28701 - HOIST
      ?auto_28700 - PLACE
      ?auto_28698 - PLACE
      ?auto_28699 - HOIST
      ?auto_28702 - SURFACE
      ?auto_28703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28701 ?auto_28700 ) ( IS-CRATE ?auto_28696 ) ( not ( = ?auto_28697 ?auto_28696 ) ) ( not ( = ?auto_28695 ?auto_28697 ) ) ( not ( = ?auto_28695 ?auto_28696 ) ) ( not ( = ?auto_28698 ?auto_28700 ) ) ( HOIST-AT ?auto_28699 ?auto_28698 ) ( not ( = ?auto_28701 ?auto_28699 ) ) ( AVAILABLE ?auto_28699 ) ( SURFACE-AT ?auto_28696 ?auto_28698 ) ( ON ?auto_28696 ?auto_28702 ) ( CLEAR ?auto_28696 ) ( not ( = ?auto_28697 ?auto_28702 ) ) ( not ( = ?auto_28696 ?auto_28702 ) ) ( not ( = ?auto_28695 ?auto_28702 ) ) ( TRUCK-AT ?auto_28703 ?auto_28700 ) ( SURFACE-AT ?auto_28695 ?auto_28700 ) ( CLEAR ?auto_28695 ) ( LIFTING ?auto_28701 ?auto_28697 ) ( IS-CRATE ?auto_28697 ) ( ON ?auto_28694 ?auto_28693 ) ( ON ?auto_28695 ?auto_28694 ) ( not ( = ?auto_28693 ?auto_28694 ) ) ( not ( = ?auto_28693 ?auto_28695 ) ) ( not ( = ?auto_28693 ?auto_28697 ) ) ( not ( = ?auto_28693 ?auto_28696 ) ) ( not ( = ?auto_28693 ?auto_28702 ) ) ( not ( = ?auto_28694 ?auto_28695 ) ) ( not ( = ?auto_28694 ?auto_28697 ) ) ( not ( = ?auto_28694 ?auto_28696 ) ) ( not ( = ?auto_28694 ?auto_28702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28695 ?auto_28697 ?auto_28696 )
      ( MAKE-4CRATE-VERIFY ?auto_28693 ?auto_28694 ?auto_28695 ?auto_28697 ?auto_28696 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28732 - SURFACE
      ?auto_28733 - SURFACE
      ?auto_28734 - SURFACE
      ?auto_28736 - SURFACE
      ?auto_28735 - SURFACE
    )
    :vars
    (
      ?auto_28737 - HOIST
      ?auto_28741 - PLACE
      ?auto_28739 - PLACE
      ?auto_28740 - HOIST
      ?auto_28742 - SURFACE
      ?auto_28738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28737 ?auto_28741 ) ( IS-CRATE ?auto_28735 ) ( not ( = ?auto_28736 ?auto_28735 ) ) ( not ( = ?auto_28734 ?auto_28736 ) ) ( not ( = ?auto_28734 ?auto_28735 ) ) ( not ( = ?auto_28739 ?auto_28741 ) ) ( HOIST-AT ?auto_28740 ?auto_28739 ) ( not ( = ?auto_28737 ?auto_28740 ) ) ( AVAILABLE ?auto_28740 ) ( SURFACE-AT ?auto_28735 ?auto_28739 ) ( ON ?auto_28735 ?auto_28742 ) ( CLEAR ?auto_28735 ) ( not ( = ?auto_28736 ?auto_28742 ) ) ( not ( = ?auto_28735 ?auto_28742 ) ) ( not ( = ?auto_28734 ?auto_28742 ) ) ( TRUCK-AT ?auto_28738 ?auto_28741 ) ( SURFACE-AT ?auto_28734 ?auto_28741 ) ( CLEAR ?auto_28734 ) ( IS-CRATE ?auto_28736 ) ( AVAILABLE ?auto_28737 ) ( IN ?auto_28736 ?auto_28738 ) ( ON ?auto_28733 ?auto_28732 ) ( ON ?auto_28734 ?auto_28733 ) ( not ( = ?auto_28732 ?auto_28733 ) ) ( not ( = ?auto_28732 ?auto_28734 ) ) ( not ( = ?auto_28732 ?auto_28736 ) ) ( not ( = ?auto_28732 ?auto_28735 ) ) ( not ( = ?auto_28732 ?auto_28742 ) ) ( not ( = ?auto_28733 ?auto_28734 ) ) ( not ( = ?auto_28733 ?auto_28736 ) ) ( not ( = ?auto_28733 ?auto_28735 ) ) ( not ( = ?auto_28733 ?auto_28742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28734 ?auto_28736 ?auto_28735 )
      ( MAKE-4CRATE-VERIFY ?auto_28732 ?auto_28733 ?auto_28734 ?auto_28736 ?auto_28735 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29392 - SURFACE
      ?auto_29393 - SURFACE
      ?auto_29394 - SURFACE
      ?auto_29396 - SURFACE
      ?auto_29395 - SURFACE
      ?auto_29397 - SURFACE
    )
    :vars
    (
      ?auto_29398 - HOIST
      ?auto_29399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29398 ?auto_29399 ) ( SURFACE-AT ?auto_29395 ?auto_29399 ) ( CLEAR ?auto_29395 ) ( LIFTING ?auto_29398 ?auto_29397 ) ( IS-CRATE ?auto_29397 ) ( not ( = ?auto_29395 ?auto_29397 ) ) ( ON ?auto_29393 ?auto_29392 ) ( ON ?auto_29394 ?auto_29393 ) ( ON ?auto_29396 ?auto_29394 ) ( ON ?auto_29395 ?auto_29396 ) ( not ( = ?auto_29392 ?auto_29393 ) ) ( not ( = ?auto_29392 ?auto_29394 ) ) ( not ( = ?auto_29392 ?auto_29396 ) ) ( not ( = ?auto_29392 ?auto_29395 ) ) ( not ( = ?auto_29392 ?auto_29397 ) ) ( not ( = ?auto_29393 ?auto_29394 ) ) ( not ( = ?auto_29393 ?auto_29396 ) ) ( not ( = ?auto_29393 ?auto_29395 ) ) ( not ( = ?auto_29393 ?auto_29397 ) ) ( not ( = ?auto_29394 ?auto_29396 ) ) ( not ( = ?auto_29394 ?auto_29395 ) ) ( not ( = ?auto_29394 ?auto_29397 ) ) ( not ( = ?auto_29396 ?auto_29395 ) ) ( not ( = ?auto_29396 ?auto_29397 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29395 ?auto_29397 )
      ( MAKE-5CRATE-VERIFY ?auto_29392 ?auto_29393 ?auto_29394 ?auto_29396 ?auto_29395 ?auto_29397 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29426 - SURFACE
      ?auto_29427 - SURFACE
      ?auto_29428 - SURFACE
      ?auto_29430 - SURFACE
      ?auto_29429 - SURFACE
      ?auto_29431 - SURFACE
    )
    :vars
    (
      ?auto_29434 - HOIST
      ?auto_29432 - PLACE
      ?auto_29433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29434 ?auto_29432 ) ( SURFACE-AT ?auto_29429 ?auto_29432 ) ( CLEAR ?auto_29429 ) ( IS-CRATE ?auto_29431 ) ( not ( = ?auto_29429 ?auto_29431 ) ) ( TRUCK-AT ?auto_29433 ?auto_29432 ) ( AVAILABLE ?auto_29434 ) ( IN ?auto_29431 ?auto_29433 ) ( ON ?auto_29429 ?auto_29430 ) ( not ( = ?auto_29430 ?auto_29429 ) ) ( not ( = ?auto_29430 ?auto_29431 ) ) ( ON ?auto_29427 ?auto_29426 ) ( ON ?auto_29428 ?auto_29427 ) ( ON ?auto_29430 ?auto_29428 ) ( not ( = ?auto_29426 ?auto_29427 ) ) ( not ( = ?auto_29426 ?auto_29428 ) ) ( not ( = ?auto_29426 ?auto_29430 ) ) ( not ( = ?auto_29426 ?auto_29429 ) ) ( not ( = ?auto_29426 ?auto_29431 ) ) ( not ( = ?auto_29427 ?auto_29428 ) ) ( not ( = ?auto_29427 ?auto_29430 ) ) ( not ( = ?auto_29427 ?auto_29429 ) ) ( not ( = ?auto_29427 ?auto_29431 ) ) ( not ( = ?auto_29428 ?auto_29430 ) ) ( not ( = ?auto_29428 ?auto_29429 ) ) ( not ( = ?auto_29428 ?auto_29431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29430 ?auto_29429 ?auto_29431 )
      ( MAKE-5CRATE-VERIFY ?auto_29426 ?auto_29427 ?auto_29428 ?auto_29430 ?auto_29429 ?auto_29431 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29466 - SURFACE
      ?auto_29467 - SURFACE
      ?auto_29468 - SURFACE
      ?auto_29470 - SURFACE
      ?auto_29469 - SURFACE
      ?auto_29471 - SURFACE
    )
    :vars
    (
      ?auto_29474 - HOIST
      ?auto_29472 - PLACE
      ?auto_29475 - TRUCK
      ?auto_29473 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29474 ?auto_29472 ) ( SURFACE-AT ?auto_29469 ?auto_29472 ) ( CLEAR ?auto_29469 ) ( IS-CRATE ?auto_29471 ) ( not ( = ?auto_29469 ?auto_29471 ) ) ( AVAILABLE ?auto_29474 ) ( IN ?auto_29471 ?auto_29475 ) ( ON ?auto_29469 ?auto_29470 ) ( not ( = ?auto_29470 ?auto_29469 ) ) ( not ( = ?auto_29470 ?auto_29471 ) ) ( TRUCK-AT ?auto_29475 ?auto_29473 ) ( not ( = ?auto_29473 ?auto_29472 ) ) ( ON ?auto_29467 ?auto_29466 ) ( ON ?auto_29468 ?auto_29467 ) ( ON ?auto_29470 ?auto_29468 ) ( not ( = ?auto_29466 ?auto_29467 ) ) ( not ( = ?auto_29466 ?auto_29468 ) ) ( not ( = ?auto_29466 ?auto_29470 ) ) ( not ( = ?auto_29466 ?auto_29469 ) ) ( not ( = ?auto_29466 ?auto_29471 ) ) ( not ( = ?auto_29467 ?auto_29468 ) ) ( not ( = ?auto_29467 ?auto_29470 ) ) ( not ( = ?auto_29467 ?auto_29469 ) ) ( not ( = ?auto_29467 ?auto_29471 ) ) ( not ( = ?auto_29468 ?auto_29470 ) ) ( not ( = ?auto_29468 ?auto_29469 ) ) ( not ( = ?auto_29468 ?auto_29471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29470 ?auto_29469 ?auto_29471 )
      ( MAKE-5CRATE-VERIFY ?auto_29466 ?auto_29467 ?auto_29468 ?auto_29470 ?auto_29469 ?auto_29471 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29511 - SURFACE
      ?auto_29512 - SURFACE
      ?auto_29513 - SURFACE
      ?auto_29515 - SURFACE
      ?auto_29514 - SURFACE
      ?auto_29516 - SURFACE
    )
    :vars
    (
      ?auto_29519 - HOIST
      ?auto_29518 - PLACE
      ?auto_29521 - TRUCK
      ?auto_29517 - PLACE
      ?auto_29520 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_29519 ?auto_29518 ) ( SURFACE-AT ?auto_29514 ?auto_29518 ) ( CLEAR ?auto_29514 ) ( IS-CRATE ?auto_29516 ) ( not ( = ?auto_29514 ?auto_29516 ) ) ( AVAILABLE ?auto_29519 ) ( ON ?auto_29514 ?auto_29515 ) ( not ( = ?auto_29515 ?auto_29514 ) ) ( not ( = ?auto_29515 ?auto_29516 ) ) ( TRUCK-AT ?auto_29521 ?auto_29517 ) ( not ( = ?auto_29517 ?auto_29518 ) ) ( HOIST-AT ?auto_29520 ?auto_29517 ) ( LIFTING ?auto_29520 ?auto_29516 ) ( not ( = ?auto_29519 ?auto_29520 ) ) ( ON ?auto_29512 ?auto_29511 ) ( ON ?auto_29513 ?auto_29512 ) ( ON ?auto_29515 ?auto_29513 ) ( not ( = ?auto_29511 ?auto_29512 ) ) ( not ( = ?auto_29511 ?auto_29513 ) ) ( not ( = ?auto_29511 ?auto_29515 ) ) ( not ( = ?auto_29511 ?auto_29514 ) ) ( not ( = ?auto_29511 ?auto_29516 ) ) ( not ( = ?auto_29512 ?auto_29513 ) ) ( not ( = ?auto_29512 ?auto_29515 ) ) ( not ( = ?auto_29512 ?auto_29514 ) ) ( not ( = ?auto_29512 ?auto_29516 ) ) ( not ( = ?auto_29513 ?auto_29515 ) ) ( not ( = ?auto_29513 ?auto_29514 ) ) ( not ( = ?auto_29513 ?auto_29516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29515 ?auto_29514 ?auto_29516 )
      ( MAKE-5CRATE-VERIFY ?auto_29511 ?auto_29512 ?auto_29513 ?auto_29515 ?auto_29514 ?auto_29516 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29561 - SURFACE
      ?auto_29562 - SURFACE
      ?auto_29563 - SURFACE
      ?auto_29565 - SURFACE
      ?auto_29564 - SURFACE
      ?auto_29566 - SURFACE
    )
    :vars
    (
      ?auto_29567 - HOIST
      ?auto_29571 - PLACE
      ?auto_29568 - TRUCK
      ?auto_29572 - PLACE
      ?auto_29569 - HOIST
      ?auto_29570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29567 ?auto_29571 ) ( SURFACE-AT ?auto_29564 ?auto_29571 ) ( CLEAR ?auto_29564 ) ( IS-CRATE ?auto_29566 ) ( not ( = ?auto_29564 ?auto_29566 ) ) ( AVAILABLE ?auto_29567 ) ( ON ?auto_29564 ?auto_29565 ) ( not ( = ?auto_29565 ?auto_29564 ) ) ( not ( = ?auto_29565 ?auto_29566 ) ) ( TRUCK-AT ?auto_29568 ?auto_29572 ) ( not ( = ?auto_29572 ?auto_29571 ) ) ( HOIST-AT ?auto_29569 ?auto_29572 ) ( not ( = ?auto_29567 ?auto_29569 ) ) ( AVAILABLE ?auto_29569 ) ( SURFACE-AT ?auto_29566 ?auto_29572 ) ( ON ?auto_29566 ?auto_29570 ) ( CLEAR ?auto_29566 ) ( not ( = ?auto_29564 ?auto_29570 ) ) ( not ( = ?auto_29566 ?auto_29570 ) ) ( not ( = ?auto_29565 ?auto_29570 ) ) ( ON ?auto_29562 ?auto_29561 ) ( ON ?auto_29563 ?auto_29562 ) ( ON ?auto_29565 ?auto_29563 ) ( not ( = ?auto_29561 ?auto_29562 ) ) ( not ( = ?auto_29561 ?auto_29563 ) ) ( not ( = ?auto_29561 ?auto_29565 ) ) ( not ( = ?auto_29561 ?auto_29564 ) ) ( not ( = ?auto_29561 ?auto_29566 ) ) ( not ( = ?auto_29561 ?auto_29570 ) ) ( not ( = ?auto_29562 ?auto_29563 ) ) ( not ( = ?auto_29562 ?auto_29565 ) ) ( not ( = ?auto_29562 ?auto_29564 ) ) ( not ( = ?auto_29562 ?auto_29566 ) ) ( not ( = ?auto_29562 ?auto_29570 ) ) ( not ( = ?auto_29563 ?auto_29565 ) ) ( not ( = ?auto_29563 ?auto_29564 ) ) ( not ( = ?auto_29563 ?auto_29566 ) ) ( not ( = ?auto_29563 ?auto_29570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29565 ?auto_29564 ?auto_29566 )
      ( MAKE-5CRATE-VERIFY ?auto_29561 ?auto_29562 ?auto_29563 ?auto_29565 ?auto_29564 ?auto_29566 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29612 - SURFACE
      ?auto_29613 - SURFACE
      ?auto_29614 - SURFACE
      ?auto_29616 - SURFACE
      ?auto_29615 - SURFACE
      ?auto_29617 - SURFACE
    )
    :vars
    (
      ?auto_29618 - HOIST
      ?auto_29619 - PLACE
      ?auto_29621 - PLACE
      ?auto_29623 - HOIST
      ?auto_29620 - SURFACE
      ?auto_29622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29618 ?auto_29619 ) ( SURFACE-AT ?auto_29615 ?auto_29619 ) ( CLEAR ?auto_29615 ) ( IS-CRATE ?auto_29617 ) ( not ( = ?auto_29615 ?auto_29617 ) ) ( AVAILABLE ?auto_29618 ) ( ON ?auto_29615 ?auto_29616 ) ( not ( = ?auto_29616 ?auto_29615 ) ) ( not ( = ?auto_29616 ?auto_29617 ) ) ( not ( = ?auto_29621 ?auto_29619 ) ) ( HOIST-AT ?auto_29623 ?auto_29621 ) ( not ( = ?auto_29618 ?auto_29623 ) ) ( AVAILABLE ?auto_29623 ) ( SURFACE-AT ?auto_29617 ?auto_29621 ) ( ON ?auto_29617 ?auto_29620 ) ( CLEAR ?auto_29617 ) ( not ( = ?auto_29615 ?auto_29620 ) ) ( not ( = ?auto_29617 ?auto_29620 ) ) ( not ( = ?auto_29616 ?auto_29620 ) ) ( TRUCK-AT ?auto_29622 ?auto_29619 ) ( ON ?auto_29613 ?auto_29612 ) ( ON ?auto_29614 ?auto_29613 ) ( ON ?auto_29616 ?auto_29614 ) ( not ( = ?auto_29612 ?auto_29613 ) ) ( not ( = ?auto_29612 ?auto_29614 ) ) ( not ( = ?auto_29612 ?auto_29616 ) ) ( not ( = ?auto_29612 ?auto_29615 ) ) ( not ( = ?auto_29612 ?auto_29617 ) ) ( not ( = ?auto_29612 ?auto_29620 ) ) ( not ( = ?auto_29613 ?auto_29614 ) ) ( not ( = ?auto_29613 ?auto_29616 ) ) ( not ( = ?auto_29613 ?auto_29615 ) ) ( not ( = ?auto_29613 ?auto_29617 ) ) ( not ( = ?auto_29613 ?auto_29620 ) ) ( not ( = ?auto_29614 ?auto_29616 ) ) ( not ( = ?auto_29614 ?auto_29615 ) ) ( not ( = ?auto_29614 ?auto_29617 ) ) ( not ( = ?auto_29614 ?auto_29620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29616 ?auto_29615 ?auto_29617 )
      ( MAKE-5CRATE-VERIFY ?auto_29612 ?auto_29613 ?auto_29614 ?auto_29616 ?auto_29615 ?auto_29617 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29663 - SURFACE
      ?auto_29664 - SURFACE
      ?auto_29665 - SURFACE
      ?auto_29667 - SURFACE
      ?auto_29666 - SURFACE
      ?auto_29668 - SURFACE
    )
    :vars
    (
      ?auto_29672 - HOIST
      ?auto_29670 - PLACE
      ?auto_29669 - PLACE
      ?auto_29671 - HOIST
      ?auto_29674 - SURFACE
      ?auto_29673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29672 ?auto_29670 ) ( IS-CRATE ?auto_29668 ) ( not ( = ?auto_29666 ?auto_29668 ) ) ( not ( = ?auto_29667 ?auto_29666 ) ) ( not ( = ?auto_29667 ?auto_29668 ) ) ( not ( = ?auto_29669 ?auto_29670 ) ) ( HOIST-AT ?auto_29671 ?auto_29669 ) ( not ( = ?auto_29672 ?auto_29671 ) ) ( AVAILABLE ?auto_29671 ) ( SURFACE-AT ?auto_29668 ?auto_29669 ) ( ON ?auto_29668 ?auto_29674 ) ( CLEAR ?auto_29668 ) ( not ( = ?auto_29666 ?auto_29674 ) ) ( not ( = ?auto_29668 ?auto_29674 ) ) ( not ( = ?auto_29667 ?auto_29674 ) ) ( TRUCK-AT ?auto_29673 ?auto_29670 ) ( SURFACE-AT ?auto_29667 ?auto_29670 ) ( CLEAR ?auto_29667 ) ( LIFTING ?auto_29672 ?auto_29666 ) ( IS-CRATE ?auto_29666 ) ( ON ?auto_29664 ?auto_29663 ) ( ON ?auto_29665 ?auto_29664 ) ( ON ?auto_29667 ?auto_29665 ) ( not ( = ?auto_29663 ?auto_29664 ) ) ( not ( = ?auto_29663 ?auto_29665 ) ) ( not ( = ?auto_29663 ?auto_29667 ) ) ( not ( = ?auto_29663 ?auto_29666 ) ) ( not ( = ?auto_29663 ?auto_29668 ) ) ( not ( = ?auto_29663 ?auto_29674 ) ) ( not ( = ?auto_29664 ?auto_29665 ) ) ( not ( = ?auto_29664 ?auto_29667 ) ) ( not ( = ?auto_29664 ?auto_29666 ) ) ( not ( = ?auto_29664 ?auto_29668 ) ) ( not ( = ?auto_29664 ?auto_29674 ) ) ( not ( = ?auto_29665 ?auto_29667 ) ) ( not ( = ?auto_29665 ?auto_29666 ) ) ( not ( = ?auto_29665 ?auto_29668 ) ) ( not ( = ?auto_29665 ?auto_29674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29667 ?auto_29666 ?auto_29668 )
      ( MAKE-5CRATE-VERIFY ?auto_29663 ?auto_29664 ?auto_29665 ?auto_29667 ?auto_29666 ?auto_29668 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29714 - SURFACE
      ?auto_29715 - SURFACE
      ?auto_29716 - SURFACE
      ?auto_29718 - SURFACE
      ?auto_29717 - SURFACE
      ?auto_29719 - SURFACE
    )
    :vars
    (
      ?auto_29721 - HOIST
      ?auto_29725 - PLACE
      ?auto_29720 - PLACE
      ?auto_29722 - HOIST
      ?auto_29724 - SURFACE
      ?auto_29723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29721 ?auto_29725 ) ( IS-CRATE ?auto_29719 ) ( not ( = ?auto_29717 ?auto_29719 ) ) ( not ( = ?auto_29718 ?auto_29717 ) ) ( not ( = ?auto_29718 ?auto_29719 ) ) ( not ( = ?auto_29720 ?auto_29725 ) ) ( HOIST-AT ?auto_29722 ?auto_29720 ) ( not ( = ?auto_29721 ?auto_29722 ) ) ( AVAILABLE ?auto_29722 ) ( SURFACE-AT ?auto_29719 ?auto_29720 ) ( ON ?auto_29719 ?auto_29724 ) ( CLEAR ?auto_29719 ) ( not ( = ?auto_29717 ?auto_29724 ) ) ( not ( = ?auto_29719 ?auto_29724 ) ) ( not ( = ?auto_29718 ?auto_29724 ) ) ( TRUCK-AT ?auto_29723 ?auto_29725 ) ( SURFACE-AT ?auto_29718 ?auto_29725 ) ( CLEAR ?auto_29718 ) ( IS-CRATE ?auto_29717 ) ( AVAILABLE ?auto_29721 ) ( IN ?auto_29717 ?auto_29723 ) ( ON ?auto_29715 ?auto_29714 ) ( ON ?auto_29716 ?auto_29715 ) ( ON ?auto_29718 ?auto_29716 ) ( not ( = ?auto_29714 ?auto_29715 ) ) ( not ( = ?auto_29714 ?auto_29716 ) ) ( not ( = ?auto_29714 ?auto_29718 ) ) ( not ( = ?auto_29714 ?auto_29717 ) ) ( not ( = ?auto_29714 ?auto_29719 ) ) ( not ( = ?auto_29714 ?auto_29724 ) ) ( not ( = ?auto_29715 ?auto_29716 ) ) ( not ( = ?auto_29715 ?auto_29718 ) ) ( not ( = ?auto_29715 ?auto_29717 ) ) ( not ( = ?auto_29715 ?auto_29719 ) ) ( not ( = ?auto_29715 ?auto_29724 ) ) ( not ( = ?auto_29716 ?auto_29718 ) ) ( not ( = ?auto_29716 ?auto_29717 ) ) ( not ( = ?auto_29716 ?auto_29719 ) ) ( not ( = ?auto_29716 ?auto_29724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29718 ?auto_29717 ?auto_29719 )
      ( MAKE-5CRATE-VERIFY ?auto_29714 ?auto_29715 ?auto_29716 ?auto_29718 ?auto_29717 ?auto_29719 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29726 - SURFACE
      ?auto_29727 - SURFACE
    )
    :vars
    (
      ?auto_29729 - HOIST
      ?auto_29734 - PLACE
      ?auto_29733 - SURFACE
      ?auto_29728 - PLACE
      ?auto_29730 - HOIST
      ?auto_29732 - SURFACE
      ?auto_29731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29729 ?auto_29734 ) ( IS-CRATE ?auto_29727 ) ( not ( = ?auto_29726 ?auto_29727 ) ) ( not ( = ?auto_29733 ?auto_29726 ) ) ( not ( = ?auto_29733 ?auto_29727 ) ) ( not ( = ?auto_29728 ?auto_29734 ) ) ( HOIST-AT ?auto_29730 ?auto_29728 ) ( not ( = ?auto_29729 ?auto_29730 ) ) ( AVAILABLE ?auto_29730 ) ( SURFACE-AT ?auto_29727 ?auto_29728 ) ( ON ?auto_29727 ?auto_29732 ) ( CLEAR ?auto_29727 ) ( not ( = ?auto_29726 ?auto_29732 ) ) ( not ( = ?auto_29727 ?auto_29732 ) ) ( not ( = ?auto_29733 ?auto_29732 ) ) ( SURFACE-AT ?auto_29733 ?auto_29734 ) ( CLEAR ?auto_29733 ) ( IS-CRATE ?auto_29726 ) ( AVAILABLE ?auto_29729 ) ( IN ?auto_29726 ?auto_29731 ) ( TRUCK-AT ?auto_29731 ?auto_29728 ) )
    :subtasks
    ( ( !DRIVE ?auto_29731 ?auto_29728 ?auto_29734 )
      ( MAKE-2CRATE ?auto_29733 ?auto_29726 ?auto_29727 )
      ( MAKE-1CRATE-VERIFY ?auto_29726 ?auto_29727 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29735 - SURFACE
      ?auto_29736 - SURFACE
      ?auto_29737 - SURFACE
    )
    :vars
    (
      ?auto_29738 - HOIST
      ?auto_29741 - PLACE
      ?auto_29739 - PLACE
      ?auto_29742 - HOIST
      ?auto_29743 - SURFACE
      ?auto_29740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29738 ?auto_29741 ) ( IS-CRATE ?auto_29737 ) ( not ( = ?auto_29736 ?auto_29737 ) ) ( not ( = ?auto_29735 ?auto_29736 ) ) ( not ( = ?auto_29735 ?auto_29737 ) ) ( not ( = ?auto_29739 ?auto_29741 ) ) ( HOIST-AT ?auto_29742 ?auto_29739 ) ( not ( = ?auto_29738 ?auto_29742 ) ) ( AVAILABLE ?auto_29742 ) ( SURFACE-AT ?auto_29737 ?auto_29739 ) ( ON ?auto_29737 ?auto_29743 ) ( CLEAR ?auto_29737 ) ( not ( = ?auto_29736 ?auto_29743 ) ) ( not ( = ?auto_29737 ?auto_29743 ) ) ( not ( = ?auto_29735 ?auto_29743 ) ) ( SURFACE-AT ?auto_29735 ?auto_29741 ) ( CLEAR ?auto_29735 ) ( IS-CRATE ?auto_29736 ) ( AVAILABLE ?auto_29738 ) ( IN ?auto_29736 ?auto_29740 ) ( TRUCK-AT ?auto_29740 ?auto_29739 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29736 ?auto_29737 )
      ( MAKE-2CRATE-VERIFY ?auto_29735 ?auto_29736 ?auto_29737 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29744 - SURFACE
      ?auto_29745 - SURFACE
      ?auto_29746 - SURFACE
      ?auto_29747 - SURFACE
    )
    :vars
    (
      ?auto_29752 - HOIST
      ?auto_29753 - PLACE
      ?auto_29751 - PLACE
      ?auto_29749 - HOIST
      ?auto_29748 - SURFACE
      ?auto_29750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29752 ?auto_29753 ) ( IS-CRATE ?auto_29747 ) ( not ( = ?auto_29746 ?auto_29747 ) ) ( not ( = ?auto_29745 ?auto_29746 ) ) ( not ( = ?auto_29745 ?auto_29747 ) ) ( not ( = ?auto_29751 ?auto_29753 ) ) ( HOIST-AT ?auto_29749 ?auto_29751 ) ( not ( = ?auto_29752 ?auto_29749 ) ) ( AVAILABLE ?auto_29749 ) ( SURFACE-AT ?auto_29747 ?auto_29751 ) ( ON ?auto_29747 ?auto_29748 ) ( CLEAR ?auto_29747 ) ( not ( = ?auto_29746 ?auto_29748 ) ) ( not ( = ?auto_29747 ?auto_29748 ) ) ( not ( = ?auto_29745 ?auto_29748 ) ) ( SURFACE-AT ?auto_29745 ?auto_29753 ) ( CLEAR ?auto_29745 ) ( IS-CRATE ?auto_29746 ) ( AVAILABLE ?auto_29752 ) ( IN ?auto_29746 ?auto_29750 ) ( TRUCK-AT ?auto_29750 ?auto_29751 ) ( ON ?auto_29745 ?auto_29744 ) ( not ( = ?auto_29744 ?auto_29745 ) ) ( not ( = ?auto_29744 ?auto_29746 ) ) ( not ( = ?auto_29744 ?auto_29747 ) ) ( not ( = ?auto_29744 ?auto_29748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29745 ?auto_29746 ?auto_29747 )
      ( MAKE-3CRATE-VERIFY ?auto_29744 ?auto_29745 ?auto_29746 ?auto_29747 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29754 - SURFACE
      ?auto_29755 - SURFACE
      ?auto_29756 - SURFACE
      ?auto_29758 - SURFACE
      ?auto_29757 - SURFACE
    )
    :vars
    (
      ?auto_29763 - HOIST
      ?auto_29764 - PLACE
      ?auto_29762 - PLACE
      ?auto_29760 - HOIST
      ?auto_29759 - SURFACE
      ?auto_29761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29763 ?auto_29764 ) ( IS-CRATE ?auto_29757 ) ( not ( = ?auto_29758 ?auto_29757 ) ) ( not ( = ?auto_29756 ?auto_29758 ) ) ( not ( = ?auto_29756 ?auto_29757 ) ) ( not ( = ?auto_29762 ?auto_29764 ) ) ( HOIST-AT ?auto_29760 ?auto_29762 ) ( not ( = ?auto_29763 ?auto_29760 ) ) ( AVAILABLE ?auto_29760 ) ( SURFACE-AT ?auto_29757 ?auto_29762 ) ( ON ?auto_29757 ?auto_29759 ) ( CLEAR ?auto_29757 ) ( not ( = ?auto_29758 ?auto_29759 ) ) ( not ( = ?auto_29757 ?auto_29759 ) ) ( not ( = ?auto_29756 ?auto_29759 ) ) ( SURFACE-AT ?auto_29756 ?auto_29764 ) ( CLEAR ?auto_29756 ) ( IS-CRATE ?auto_29758 ) ( AVAILABLE ?auto_29763 ) ( IN ?auto_29758 ?auto_29761 ) ( TRUCK-AT ?auto_29761 ?auto_29762 ) ( ON ?auto_29755 ?auto_29754 ) ( ON ?auto_29756 ?auto_29755 ) ( not ( = ?auto_29754 ?auto_29755 ) ) ( not ( = ?auto_29754 ?auto_29756 ) ) ( not ( = ?auto_29754 ?auto_29758 ) ) ( not ( = ?auto_29754 ?auto_29757 ) ) ( not ( = ?auto_29754 ?auto_29759 ) ) ( not ( = ?auto_29755 ?auto_29756 ) ) ( not ( = ?auto_29755 ?auto_29758 ) ) ( not ( = ?auto_29755 ?auto_29757 ) ) ( not ( = ?auto_29755 ?auto_29759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29756 ?auto_29758 ?auto_29757 )
      ( MAKE-4CRATE-VERIFY ?auto_29754 ?auto_29755 ?auto_29756 ?auto_29758 ?auto_29757 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29765 - SURFACE
      ?auto_29766 - SURFACE
      ?auto_29767 - SURFACE
      ?auto_29769 - SURFACE
      ?auto_29768 - SURFACE
      ?auto_29770 - SURFACE
    )
    :vars
    (
      ?auto_29775 - HOIST
      ?auto_29776 - PLACE
      ?auto_29774 - PLACE
      ?auto_29772 - HOIST
      ?auto_29771 - SURFACE
      ?auto_29773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29775 ?auto_29776 ) ( IS-CRATE ?auto_29770 ) ( not ( = ?auto_29768 ?auto_29770 ) ) ( not ( = ?auto_29769 ?auto_29768 ) ) ( not ( = ?auto_29769 ?auto_29770 ) ) ( not ( = ?auto_29774 ?auto_29776 ) ) ( HOIST-AT ?auto_29772 ?auto_29774 ) ( not ( = ?auto_29775 ?auto_29772 ) ) ( AVAILABLE ?auto_29772 ) ( SURFACE-AT ?auto_29770 ?auto_29774 ) ( ON ?auto_29770 ?auto_29771 ) ( CLEAR ?auto_29770 ) ( not ( = ?auto_29768 ?auto_29771 ) ) ( not ( = ?auto_29770 ?auto_29771 ) ) ( not ( = ?auto_29769 ?auto_29771 ) ) ( SURFACE-AT ?auto_29769 ?auto_29776 ) ( CLEAR ?auto_29769 ) ( IS-CRATE ?auto_29768 ) ( AVAILABLE ?auto_29775 ) ( IN ?auto_29768 ?auto_29773 ) ( TRUCK-AT ?auto_29773 ?auto_29774 ) ( ON ?auto_29766 ?auto_29765 ) ( ON ?auto_29767 ?auto_29766 ) ( ON ?auto_29769 ?auto_29767 ) ( not ( = ?auto_29765 ?auto_29766 ) ) ( not ( = ?auto_29765 ?auto_29767 ) ) ( not ( = ?auto_29765 ?auto_29769 ) ) ( not ( = ?auto_29765 ?auto_29768 ) ) ( not ( = ?auto_29765 ?auto_29770 ) ) ( not ( = ?auto_29765 ?auto_29771 ) ) ( not ( = ?auto_29766 ?auto_29767 ) ) ( not ( = ?auto_29766 ?auto_29769 ) ) ( not ( = ?auto_29766 ?auto_29768 ) ) ( not ( = ?auto_29766 ?auto_29770 ) ) ( not ( = ?auto_29766 ?auto_29771 ) ) ( not ( = ?auto_29767 ?auto_29769 ) ) ( not ( = ?auto_29767 ?auto_29768 ) ) ( not ( = ?auto_29767 ?auto_29770 ) ) ( not ( = ?auto_29767 ?auto_29771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29769 ?auto_29768 ?auto_29770 )
      ( MAKE-5CRATE-VERIFY ?auto_29765 ?auto_29766 ?auto_29767 ?auto_29769 ?auto_29768 ?auto_29770 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29777 - SURFACE
      ?auto_29778 - SURFACE
    )
    :vars
    (
      ?auto_29784 - HOIST
      ?auto_29785 - PLACE
      ?auto_29782 - SURFACE
      ?auto_29783 - PLACE
      ?auto_29780 - HOIST
      ?auto_29779 - SURFACE
      ?auto_29781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29784 ?auto_29785 ) ( IS-CRATE ?auto_29778 ) ( not ( = ?auto_29777 ?auto_29778 ) ) ( not ( = ?auto_29782 ?auto_29777 ) ) ( not ( = ?auto_29782 ?auto_29778 ) ) ( not ( = ?auto_29783 ?auto_29785 ) ) ( HOIST-AT ?auto_29780 ?auto_29783 ) ( not ( = ?auto_29784 ?auto_29780 ) ) ( SURFACE-AT ?auto_29778 ?auto_29783 ) ( ON ?auto_29778 ?auto_29779 ) ( CLEAR ?auto_29778 ) ( not ( = ?auto_29777 ?auto_29779 ) ) ( not ( = ?auto_29778 ?auto_29779 ) ) ( not ( = ?auto_29782 ?auto_29779 ) ) ( SURFACE-AT ?auto_29782 ?auto_29785 ) ( CLEAR ?auto_29782 ) ( IS-CRATE ?auto_29777 ) ( AVAILABLE ?auto_29784 ) ( TRUCK-AT ?auto_29781 ?auto_29783 ) ( LIFTING ?auto_29780 ?auto_29777 ) )
    :subtasks
    ( ( !LOAD ?auto_29780 ?auto_29777 ?auto_29781 ?auto_29783 )
      ( MAKE-2CRATE ?auto_29782 ?auto_29777 ?auto_29778 )
      ( MAKE-1CRATE-VERIFY ?auto_29777 ?auto_29778 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29786 - SURFACE
      ?auto_29787 - SURFACE
      ?auto_29788 - SURFACE
    )
    :vars
    (
      ?auto_29792 - HOIST
      ?auto_29791 - PLACE
      ?auto_29789 - PLACE
      ?auto_29790 - HOIST
      ?auto_29793 - SURFACE
      ?auto_29794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29792 ?auto_29791 ) ( IS-CRATE ?auto_29788 ) ( not ( = ?auto_29787 ?auto_29788 ) ) ( not ( = ?auto_29786 ?auto_29787 ) ) ( not ( = ?auto_29786 ?auto_29788 ) ) ( not ( = ?auto_29789 ?auto_29791 ) ) ( HOIST-AT ?auto_29790 ?auto_29789 ) ( not ( = ?auto_29792 ?auto_29790 ) ) ( SURFACE-AT ?auto_29788 ?auto_29789 ) ( ON ?auto_29788 ?auto_29793 ) ( CLEAR ?auto_29788 ) ( not ( = ?auto_29787 ?auto_29793 ) ) ( not ( = ?auto_29788 ?auto_29793 ) ) ( not ( = ?auto_29786 ?auto_29793 ) ) ( SURFACE-AT ?auto_29786 ?auto_29791 ) ( CLEAR ?auto_29786 ) ( IS-CRATE ?auto_29787 ) ( AVAILABLE ?auto_29792 ) ( TRUCK-AT ?auto_29794 ?auto_29789 ) ( LIFTING ?auto_29790 ?auto_29787 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29787 ?auto_29788 )
      ( MAKE-2CRATE-VERIFY ?auto_29786 ?auto_29787 ?auto_29788 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29795 - SURFACE
      ?auto_29796 - SURFACE
      ?auto_29797 - SURFACE
      ?auto_29798 - SURFACE
    )
    :vars
    (
      ?auto_29803 - HOIST
      ?auto_29802 - PLACE
      ?auto_29801 - PLACE
      ?auto_29804 - HOIST
      ?auto_29799 - SURFACE
      ?auto_29800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29803 ?auto_29802 ) ( IS-CRATE ?auto_29798 ) ( not ( = ?auto_29797 ?auto_29798 ) ) ( not ( = ?auto_29796 ?auto_29797 ) ) ( not ( = ?auto_29796 ?auto_29798 ) ) ( not ( = ?auto_29801 ?auto_29802 ) ) ( HOIST-AT ?auto_29804 ?auto_29801 ) ( not ( = ?auto_29803 ?auto_29804 ) ) ( SURFACE-AT ?auto_29798 ?auto_29801 ) ( ON ?auto_29798 ?auto_29799 ) ( CLEAR ?auto_29798 ) ( not ( = ?auto_29797 ?auto_29799 ) ) ( not ( = ?auto_29798 ?auto_29799 ) ) ( not ( = ?auto_29796 ?auto_29799 ) ) ( SURFACE-AT ?auto_29796 ?auto_29802 ) ( CLEAR ?auto_29796 ) ( IS-CRATE ?auto_29797 ) ( AVAILABLE ?auto_29803 ) ( TRUCK-AT ?auto_29800 ?auto_29801 ) ( LIFTING ?auto_29804 ?auto_29797 ) ( ON ?auto_29796 ?auto_29795 ) ( not ( = ?auto_29795 ?auto_29796 ) ) ( not ( = ?auto_29795 ?auto_29797 ) ) ( not ( = ?auto_29795 ?auto_29798 ) ) ( not ( = ?auto_29795 ?auto_29799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29796 ?auto_29797 ?auto_29798 )
      ( MAKE-3CRATE-VERIFY ?auto_29795 ?auto_29796 ?auto_29797 ?auto_29798 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29805 - SURFACE
      ?auto_29806 - SURFACE
      ?auto_29807 - SURFACE
      ?auto_29809 - SURFACE
      ?auto_29808 - SURFACE
    )
    :vars
    (
      ?auto_29814 - HOIST
      ?auto_29813 - PLACE
      ?auto_29812 - PLACE
      ?auto_29815 - HOIST
      ?auto_29810 - SURFACE
      ?auto_29811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29814 ?auto_29813 ) ( IS-CRATE ?auto_29808 ) ( not ( = ?auto_29809 ?auto_29808 ) ) ( not ( = ?auto_29807 ?auto_29809 ) ) ( not ( = ?auto_29807 ?auto_29808 ) ) ( not ( = ?auto_29812 ?auto_29813 ) ) ( HOIST-AT ?auto_29815 ?auto_29812 ) ( not ( = ?auto_29814 ?auto_29815 ) ) ( SURFACE-AT ?auto_29808 ?auto_29812 ) ( ON ?auto_29808 ?auto_29810 ) ( CLEAR ?auto_29808 ) ( not ( = ?auto_29809 ?auto_29810 ) ) ( not ( = ?auto_29808 ?auto_29810 ) ) ( not ( = ?auto_29807 ?auto_29810 ) ) ( SURFACE-AT ?auto_29807 ?auto_29813 ) ( CLEAR ?auto_29807 ) ( IS-CRATE ?auto_29809 ) ( AVAILABLE ?auto_29814 ) ( TRUCK-AT ?auto_29811 ?auto_29812 ) ( LIFTING ?auto_29815 ?auto_29809 ) ( ON ?auto_29806 ?auto_29805 ) ( ON ?auto_29807 ?auto_29806 ) ( not ( = ?auto_29805 ?auto_29806 ) ) ( not ( = ?auto_29805 ?auto_29807 ) ) ( not ( = ?auto_29805 ?auto_29809 ) ) ( not ( = ?auto_29805 ?auto_29808 ) ) ( not ( = ?auto_29805 ?auto_29810 ) ) ( not ( = ?auto_29806 ?auto_29807 ) ) ( not ( = ?auto_29806 ?auto_29809 ) ) ( not ( = ?auto_29806 ?auto_29808 ) ) ( not ( = ?auto_29806 ?auto_29810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29807 ?auto_29809 ?auto_29808 )
      ( MAKE-4CRATE-VERIFY ?auto_29805 ?auto_29806 ?auto_29807 ?auto_29809 ?auto_29808 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29816 - SURFACE
      ?auto_29817 - SURFACE
      ?auto_29818 - SURFACE
      ?auto_29820 - SURFACE
      ?auto_29819 - SURFACE
      ?auto_29821 - SURFACE
    )
    :vars
    (
      ?auto_29826 - HOIST
      ?auto_29825 - PLACE
      ?auto_29824 - PLACE
      ?auto_29827 - HOIST
      ?auto_29822 - SURFACE
      ?auto_29823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29826 ?auto_29825 ) ( IS-CRATE ?auto_29821 ) ( not ( = ?auto_29819 ?auto_29821 ) ) ( not ( = ?auto_29820 ?auto_29819 ) ) ( not ( = ?auto_29820 ?auto_29821 ) ) ( not ( = ?auto_29824 ?auto_29825 ) ) ( HOIST-AT ?auto_29827 ?auto_29824 ) ( not ( = ?auto_29826 ?auto_29827 ) ) ( SURFACE-AT ?auto_29821 ?auto_29824 ) ( ON ?auto_29821 ?auto_29822 ) ( CLEAR ?auto_29821 ) ( not ( = ?auto_29819 ?auto_29822 ) ) ( not ( = ?auto_29821 ?auto_29822 ) ) ( not ( = ?auto_29820 ?auto_29822 ) ) ( SURFACE-AT ?auto_29820 ?auto_29825 ) ( CLEAR ?auto_29820 ) ( IS-CRATE ?auto_29819 ) ( AVAILABLE ?auto_29826 ) ( TRUCK-AT ?auto_29823 ?auto_29824 ) ( LIFTING ?auto_29827 ?auto_29819 ) ( ON ?auto_29817 ?auto_29816 ) ( ON ?auto_29818 ?auto_29817 ) ( ON ?auto_29820 ?auto_29818 ) ( not ( = ?auto_29816 ?auto_29817 ) ) ( not ( = ?auto_29816 ?auto_29818 ) ) ( not ( = ?auto_29816 ?auto_29820 ) ) ( not ( = ?auto_29816 ?auto_29819 ) ) ( not ( = ?auto_29816 ?auto_29821 ) ) ( not ( = ?auto_29816 ?auto_29822 ) ) ( not ( = ?auto_29817 ?auto_29818 ) ) ( not ( = ?auto_29817 ?auto_29820 ) ) ( not ( = ?auto_29817 ?auto_29819 ) ) ( not ( = ?auto_29817 ?auto_29821 ) ) ( not ( = ?auto_29817 ?auto_29822 ) ) ( not ( = ?auto_29818 ?auto_29820 ) ) ( not ( = ?auto_29818 ?auto_29819 ) ) ( not ( = ?auto_29818 ?auto_29821 ) ) ( not ( = ?auto_29818 ?auto_29822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29820 ?auto_29819 ?auto_29821 )
      ( MAKE-5CRATE-VERIFY ?auto_29816 ?auto_29817 ?auto_29818 ?auto_29820 ?auto_29819 ?auto_29821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29828 - SURFACE
      ?auto_29829 - SURFACE
    )
    :vars
    (
      ?auto_29834 - HOIST
      ?auto_29833 - PLACE
      ?auto_29835 - SURFACE
      ?auto_29832 - PLACE
      ?auto_29836 - HOIST
      ?auto_29830 - SURFACE
      ?auto_29831 - TRUCK
      ?auto_29837 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29834 ?auto_29833 ) ( IS-CRATE ?auto_29829 ) ( not ( = ?auto_29828 ?auto_29829 ) ) ( not ( = ?auto_29835 ?auto_29828 ) ) ( not ( = ?auto_29835 ?auto_29829 ) ) ( not ( = ?auto_29832 ?auto_29833 ) ) ( HOIST-AT ?auto_29836 ?auto_29832 ) ( not ( = ?auto_29834 ?auto_29836 ) ) ( SURFACE-AT ?auto_29829 ?auto_29832 ) ( ON ?auto_29829 ?auto_29830 ) ( CLEAR ?auto_29829 ) ( not ( = ?auto_29828 ?auto_29830 ) ) ( not ( = ?auto_29829 ?auto_29830 ) ) ( not ( = ?auto_29835 ?auto_29830 ) ) ( SURFACE-AT ?auto_29835 ?auto_29833 ) ( CLEAR ?auto_29835 ) ( IS-CRATE ?auto_29828 ) ( AVAILABLE ?auto_29834 ) ( TRUCK-AT ?auto_29831 ?auto_29832 ) ( AVAILABLE ?auto_29836 ) ( SURFACE-AT ?auto_29828 ?auto_29832 ) ( ON ?auto_29828 ?auto_29837 ) ( CLEAR ?auto_29828 ) ( not ( = ?auto_29828 ?auto_29837 ) ) ( not ( = ?auto_29829 ?auto_29837 ) ) ( not ( = ?auto_29835 ?auto_29837 ) ) ( not ( = ?auto_29830 ?auto_29837 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29836 ?auto_29828 ?auto_29837 ?auto_29832 )
      ( MAKE-2CRATE ?auto_29835 ?auto_29828 ?auto_29829 )
      ( MAKE-1CRATE-VERIFY ?auto_29828 ?auto_29829 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29838 - SURFACE
      ?auto_29839 - SURFACE
      ?auto_29840 - SURFACE
    )
    :vars
    (
      ?auto_29842 - HOIST
      ?auto_29844 - PLACE
      ?auto_29843 - PLACE
      ?auto_29847 - HOIST
      ?auto_29845 - SURFACE
      ?auto_29846 - TRUCK
      ?auto_29841 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29842 ?auto_29844 ) ( IS-CRATE ?auto_29840 ) ( not ( = ?auto_29839 ?auto_29840 ) ) ( not ( = ?auto_29838 ?auto_29839 ) ) ( not ( = ?auto_29838 ?auto_29840 ) ) ( not ( = ?auto_29843 ?auto_29844 ) ) ( HOIST-AT ?auto_29847 ?auto_29843 ) ( not ( = ?auto_29842 ?auto_29847 ) ) ( SURFACE-AT ?auto_29840 ?auto_29843 ) ( ON ?auto_29840 ?auto_29845 ) ( CLEAR ?auto_29840 ) ( not ( = ?auto_29839 ?auto_29845 ) ) ( not ( = ?auto_29840 ?auto_29845 ) ) ( not ( = ?auto_29838 ?auto_29845 ) ) ( SURFACE-AT ?auto_29838 ?auto_29844 ) ( CLEAR ?auto_29838 ) ( IS-CRATE ?auto_29839 ) ( AVAILABLE ?auto_29842 ) ( TRUCK-AT ?auto_29846 ?auto_29843 ) ( AVAILABLE ?auto_29847 ) ( SURFACE-AT ?auto_29839 ?auto_29843 ) ( ON ?auto_29839 ?auto_29841 ) ( CLEAR ?auto_29839 ) ( not ( = ?auto_29839 ?auto_29841 ) ) ( not ( = ?auto_29840 ?auto_29841 ) ) ( not ( = ?auto_29838 ?auto_29841 ) ) ( not ( = ?auto_29845 ?auto_29841 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29839 ?auto_29840 )
      ( MAKE-2CRATE-VERIFY ?auto_29838 ?auto_29839 ?auto_29840 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29848 - SURFACE
      ?auto_29849 - SURFACE
      ?auto_29850 - SURFACE
      ?auto_29851 - SURFACE
    )
    :vars
    (
      ?auto_29858 - HOIST
      ?auto_29852 - PLACE
      ?auto_29855 - PLACE
      ?auto_29853 - HOIST
      ?auto_29854 - SURFACE
      ?auto_29856 - TRUCK
      ?auto_29857 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29858 ?auto_29852 ) ( IS-CRATE ?auto_29851 ) ( not ( = ?auto_29850 ?auto_29851 ) ) ( not ( = ?auto_29849 ?auto_29850 ) ) ( not ( = ?auto_29849 ?auto_29851 ) ) ( not ( = ?auto_29855 ?auto_29852 ) ) ( HOIST-AT ?auto_29853 ?auto_29855 ) ( not ( = ?auto_29858 ?auto_29853 ) ) ( SURFACE-AT ?auto_29851 ?auto_29855 ) ( ON ?auto_29851 ?auto_29854 ) ( CLEAR ?auto_29851 ) ( not ( = ?auto_29850 ?auto_29854 ) ) ( not ( = ?auto_29851 ?auto_29854 ) ) ( not ( = ?auto_29849 ?auto_29854 ) ) ( SURFACE-AT ?auto_29849 ?auto_29852 ) ( CLEAR ?auto_29849 ) ( IS-CRATE ?auto_29850 ) ( AVAILABLE ?auto_29858 ) ( TRUCK-AT ?auto_29856 ?auto_29855 ) ( AVAILABLE ?auto_29853 ) ( SURFACE-AT ?auto_29850 ?auto_29855 ) ( ON ?auto_29850 ?auto_29857 ) ( CLEAR ?auto_29850 ) ( not ( = ?auto_29850 ?auto_29857 ) ) ( not ( = ?auto_29851 ?auto_29857 ) ) ( not ( = ?auto_29849 ?auto_29857 ) ) ( not ( = ?auto_29854 ?auto_29857 ) ) ( ON ?auto_29849 ?auto_29848 ) ( not ( = ?auto_29848 ?auto_29849 ) ) ( not ( = ?auto_29848 ?auto_29850 ) ) ( not ( = ?auto_29848 ?auto_29851 ) ) ( not ( = ?auto_29848 ?auto_29854 ) ) ( not ( = ?auto_29848 ?auto_29857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29849 ?auto_29850 ?auto_29851 )
      ( MAKE-3CRATE-VERIFY ?auto_29848 ?auto_29849 ?auto_29850 ?auto_29851 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29859 - SURFACE
      ?auto_29860 - SURFACE
      ?auto_29861 - SURFACE
      ?auto_29863 - SURFACE
      ?auto_29862 - SURFACE
    )
    :vars
    (
      ?auto_29870 - HOIST
      ?auto_29864 - PLACE
      ?auto_29867 - PLACE
      ?auto_29865 - HOIST
      ?auto_29866 - SURFACE
      ?auto_29868 - TRUCK
      ?auto_29869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29870 ?auto_29864 ) ( IS-CRATE ?auto_29862 ) ( not ( = ?auto_29863 ?auto_29862 ) ) ( not ( = ?auto_29861 ?auto_29863 ) ) ( not ( = ?auto_29861 ?auto_29862 ) ) ( not ( = ?auto_29867 ?auto_29864 ) ) ( HOIST-AT ?auto_29865 ?auto_29867 ) ( not ( = ?auto_29870 ?auto_29865 ) ) ( SURFACE-AT ?auto_29862 ?auto_29867 ) ( ON ?auto_29862 ?auto_29866 ) ( CLEAR ?auto_29862 ) ( not ( = ?auto_29863 ?auto_29866 ) ) ( not ( = ?auto_29862 ?auto_29866 ) ) ( not ( = ?auto_29861 ?auto_29866 ) ) ( SURFACE-AT ?auto_29861 ?auto_29864 ) ( CLEAR ?auto_29861 ) ( IS-CRATE ?auto_29863 ) ( AVAILABLE ?auto_29870 ) ( TRUCK-AT ?auto_29868 ?auto_29867 ) ( AVAILABLE ?auto_29865 ) ( SURFACE-AT ?auto_29863 ?auto_29867 ) ( ON ?auto_29863 ?auto_29869 ) ( CLEAR ?auto_29863 ) ( not ( = ?auto_29863 ?auto_29869 ) ) ( not ( = ?auto_29862 ?auto_29869 ) ) ( not ( = ?auto_29861 ?auto_29869 ) ) ( not ( = ?auto_29866 ?auto_29869 ) ) ( ON ?auto_29860 ?auto_29859 ) ( ON ?auto_29861 ?auto_29860 ) ( not ( = ?auto_29859 ?auto_29860 ) ) ( not ( = ?auto_29859 ?auto_29861 ) ) ( not ( = ?auto_29859 ?auto_29863 ) ) ( not ( = ?auto_29859 ?auto_29862 ) ) ( not ( = ?auto_29859 ?auto_29866 ) ) ( not ( = ?auto_29859 ?auto_29869 ) ) ( not ( = ?auto_29860 ?auto_29861 ) ) ( not ( = ?auto_29860 ?auto_29863 ) ) ( not ( = ?auto_29860 ?auto_29862 ) ) ( not ( = ?auto_29860 ?auto_29866 ) ) ( not ( = ?auto_29860 ?auto_29869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29861 ?auto_29863 ?auto_29862 )
      ( MAKE-4CRATE-VERIFY ?auto_29859 ?auto_29860 ?auto_29861 ?auto_29863 ?auto_29862 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29871 - SURFACE
      ?auto_29872 - SURFACE
      ?auto_29873 - SURFACE
      ?auto_29875 - SURFACE
      ?auto_29874 - SURFACE
      ?auto_29876 - SURFACE
    )
    :vars
    (
      ?auto_29883 - HOIST
      ?auto_29877 - PLACE
      ?auto_29880 - PLACE
      ?auto_29878 - HOIST
      ?auto_29879 - SURFACE
      ?auto_29881 - TRUCK
      ?auto_29882 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29883 ?auto_29877 ) ( IS-CRATE ?auto_29876 ) ( not ( = ?auto_29874 ?auto_29876 ) ) ( not ( = ?auto_29875 ?auto_29874 ) ) ( not ( = ?auto_29875 ?auto_29876 ) ) ( not ( = ?auto_29880 ?auto_29877 ) ) ( HOIST-AT ?auto_29878 ?auto_29880 ) ( not ( = ?auto_29883 ?auto_29878 ) ) ( SURFACE-AT ?auto_29876 ?auto_29880 ) ( ON ?auto_29876 ?auto_29879 ) ( CLEAR ?auto_29876 ) ( not ( = ?auto_29874 ?auto_29879 ) ) ( not ( = ?auto_29876 ?auto_29879 ) ) ( not ( = ?auto_29875 ?auto_29879 ) ) ( SURFACE-AT ?auto_29875 ?auto_29877 ) ( CLEAR ?auto_29875 ) ( IS-CRATE ?auto_29874 ) ( AVAILABLE ?auto_29883 ) ( TRUCK-AT ?auto_29881 ?auto_29880 ) ( AVAILABLE ?auto_29878 ) ( SURFACE-AT ?auto_29874 ?auto_29880 ) ( ON ?auto_29874 ?auto_29882 ) ( CLEAR ?auto_29874 ) ( not ( = ?auto_29874 ?auto_29882 ) ) ( not ( = ?auto_29876 ?auto_29882 ) ) ( not ( = ?auto_29875 ?auto_29882 ) ) ( not ( = ?auto_29879 ?auto_29882 ) ) ( ON ?auto_29872 ?auto_29871 ) ( ON ?auto_29873 ?auto_29872 ) ( ON ?auto_29875 ?auto_29873 ) ( not ( = ?auto_29871 ?auto_29872 ) ) ( not ( = ?auto_29871 ?auto_29873 ) ) ( not ( = ?auto_29871 ?auto_29875 ) ) ( not ( = ?auto_29871 ?auto_29874 ) ) ( not ( = ?auto_29871 ?auto_29876 ) ) ( not ( = ?auto_29871 ?auto_29879 ) ) ( not ( = ?auto_29871 ?auto_29882 ) ) ( not ( = ?auto_29872 ?auto_29873 ) ) ( not ( = ?auto_29872 ?auto_29875 ) ) ( not ( = ?auto_29872 ?auto_29874 ) ) ( not ( = ?auto_29872 ?auto_29876 ) ) ( not ( = ?auto_29872 ?auto_29879 ) ) ( not ( = ?auto_29872 ?auto_29882 ) ) ( not ( = ?auto_29873 ?auto_29875 ) ) ( not ( = ?auto_29873 ?auto_29874 ) ) ( not ( = ?auto_29873 ?auto_29876 ) ) ( not ( = ?auto_29873 ?auto_29879 ) ) ( not ( = ?auto_29873 ?auto_29882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29875 ?auto_29874 ?auto_29876 )
      ( MAKE-5CRATE-VERIFY ?auto_29871 ?auto_29872 ?auto_29873 ?auto_29875 ?auto_29874 ?auto_29876 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29884 - SURFACE
      ?auto_29885 - SURFACE
    )
    :vars
    (
      ?auto_29893 - HOIST
      ?auto_29886 - PLACE
      ?auto_29892 - SURFACE
      ?auto_29889 - PLACE
      ?auto_29887 - HOIST
      ?auto_29888 - SURFACE
      ?auto_29891 - SURFACE
      ?auto_29890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29893 ?auto_29886 ) ( IS-CRATE ?auto_29885 ) ( not ( = ?auto_29884 ?auto_29885 ) ) ( not ( = ?auto_29892 ?auto_29884 ) ) ( not ( = ?auto_29892 ?auto_29885 ) ) ( not ( = ?auto_29889 ?auto_29886 ) ) ( HOIST-AT ?auto_29887 ?auto_29889 ) ( not ( = ?auto_29893 ?auto_29887 ) ) ( SURFACE-AT ?auto_29885 ?auto_29889 ) ( ON ?auto_29885 ?auto_29888 ) ( CLEAR ?auto_29885 ) ( not ( = ?auto_29884 ?auto_29888 ) ) ( not ( = ?auto_29885 ?auto_29888 ) ) ( not ( = ?auto_29892 ?auto_29888 ) ) ( SURFACE-AT ?auto_29892 ?auto_29886 ) ( CLEAR ?auto_29892 ) ( IS-CRATE ?auto_29884 ) ( AVAILABLE ?auto_29893 ) ( AVAILABLE ?auto_29887 ) ( SURFACE-AT ?auto_29884 ?auto_29889 ) ( ON ?auto_29884 ?auto_29891 ) ( CLEAR ?auto_29884 ) ( not ( = ?auto_29884 ?auto_29891 ) ) ( not ( = ?auto_29885 ?auto_29891 ) ) ( not ( = ?auto_29892 ?auto_29891 ) ) ( not ( = ?auto_29888 ?auto_29891 ) ) ( TRUCK-AT ?auto_29890 ?auto_29886 ) )
    :subtasks
    ( ( !DRIVE ?auto_29890 ?auto_29886 ?auto_29889 )
      ( MAKE-2CRATE ?auto_29892 ?auto_29884 ?auto_29885 )
      ( MAKE-1CRATE-VERIFY ?auto_29884 ?auto_29885 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29894 - SURFACE
      ?auto_29895 - SURFACE
      ?auto_29896 - SURFACE
    )
    :vars
    (
      ?auto_29899 - HOIST
      ?auto_29898 - PLACE
      ?auto_29902 - PLACE
      ?auto_29900 - HOIST
      ?auto_29903 - SURFACE
      ?auto_29901 - SURFACE
      ?auto_29897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29899 ?auto_29898 ) ( IS-CRATE ?auto_29896 ) ( not ( = ?auto_29895 ?auto_29896 ) ) ( not ( = ?auto_29894 ?auto_29895 ) ) ( not ( = ?auto_29894 ?auto_29896 ) ) ( not ( = ?auto_29902 ?auto_29898 ) ) ( HOIST-AT ?auto_29900 ?auto_29902 ) ( not ( = ?auto_29899 ?auto_29900 ) ) ( SURFACE-AT ?auto_29896 ?auto_29902 ) ( ON ?auto_29896 ?auto_29903 ) ( CLEAR ?auto_29896 ) ( not ( = ?auto_29895 ?auto_29903 ) ) ( not ( = ?auto_29896 ?auto_29903 ) ) ( not ( = ?auto_29894 ?auto_29903 ) ) ( SURFACE-AT ?auto_29894 ?auto_29898 ) ( CLEAR ?auto_29894 ) ( IS-CRATE ?auto_29895 ) ( AVAILABLE ?auto_29899 ) ( AVAILABLE ?auto_29900 ) ( SURFACE-AT ?auto_29895 ?auto_29902 ) ( ON ?auto_29895 ?auto_29901 ) ( CLEAR ?auto_29895 ) ( not ( = ?auto_29895 ?auto_29901 ) ) ( not ( = ?auto_29896 ?auto_29901 ) ) ( not ( = ?auto_29894 ?auto_29901 ) ) ( not ( = ?auto_29903 ?auto_29901 ) ) ( TRUCK-AT ?auto_29897 ?auto_29898 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29895 ?auto_29896 )
      ( MAKE-2CRATE-VERIFY ?auto_29894 ?auto_29895 ?auto_29896 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29904 - SURFACE
      ?auto_29905 - SURFACE
      ?auto_29906 - SURFACE
      ?auto_29907 - SURFACE
    )
    :vars
    (
      ?auto_29914 - HOIST
      ?auto_29913 - PLACE
      ?auto_29911 - PLACE
      ?auto_29908 - HOIST
      ?auto_29912 - SURFACE
      ?auto_29910 - SURFACE
      ?auto_29909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29914 ?auto_29913 ) ( IS-CRATE ?auto_29907 ) ( not ( = ?auto_29906 ?auto_29907 ) ) ( not ( = ?auto_29905 ?auto_29906 ) ) ( not ( = ?auto_29905 ?auto_29907 ) ) ( not ( = ?auto_29911 ?auto_29913 ) ) ( HOIST-AT ?auto_29908 ?auto_29911 ) ( not ( = ?auto_29914 ?auto_29908 ) ) ( SURFACE-AT ?auto_29907 ?auto_29911 ) ( ON ?auto_29907 ?auto_29912 ) ( CLEAR ?auto_29907 ) ( not ( = ?auto_29906 ?auto_29912 ) ) ( not ( = ?auto_29907 ?auto_29912 ) ) ( not ( = ?auto_29905 ?auto_29912 ) ) ( SURFACE-AT ?auto_29905 ?auto_29913 ) ( CLEAR ?auto_29905 ) ( IS-CRATE ?auto_29906 ) ( AVAILABLE ?auto_29914 ) ( AVAILABLE ?auto_29908 ) ( SURFACE-AT ?auto_29906 ?auto_29911 ) ( ON ?auto_29906 ?auto_29910 ) ( CLEAR ?auto_29906 ) ( not ( = ?auto_29906 ?auto_29910 ) ) ( not ( = ?auto_29907 ?auto_29910 ) ) ( not ( = ?auto_29905 ?auto_29910 ) ) ( not ( = ?auto_29912 ?auto_29910 ) ) ( TRUCK-AT ?auto_29909 ?auto_29913 ) ( ON ?auto_29905 ?auto_29904 ) ( not ( = ?auto_29904 ?auto_29905 ) ) ( not ( = ?auto_29904 ?auto_29906 ) ) ( not ( = ?auto_29904 ?auto_29907 ) ) ( not ( = ?auto_29904 ?auto_29912 ) ) ( not ( = ?auto_29904 ?auto_29910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29905 ?auto_29906 ?auto_29907 )
      ( MAKE-3CRATE-VERIFY ?auto_29904 ?auto_29905 ?auto_29906 ?auto_29907 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29915 - SURFACE
      ?auto_29916 - SURFACE
      ?auto_29917 - SURFACE
      ?auto_29919 - SURFACE
      ?auto_29918 - SURFACE
    )
    :vars
    (
      ?auto_29926 - HOIST
      ?auto_29925 - PLACE
      ?auto_29923 - PLACE
      ?auto_29920 - HOIST
      ?auto_29924 - SURFACE
      ?auto_29922 - SURFACE
      ?auto_29921 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29926 ?auto_29925 ) ( IS-CRATE ?auto_29918 ) ( not ( = ?auto_29919 ?auto_29918 ) ) ( not ( = ?auto_29917 ?auto_29919 ) ) ( not ( = ?auto_29917 ?auto_29918 ) ) ( not ( = ?auto_29923 ?auto_29925 ) ) ( HOIST-AT ?auto_29920 ?auto_29923 ) ( not ( = ?auto_29926 ?auto_29920 ) ) ( SURFACE-AT ?auto_29918 ?auto_29923 ) ( ON ?auto_29918 ?auto_29924 ) ( CLEAR ?auto_29918 ) ( not ( = ?auto_29919 ?auto_29924 ) ) ( not ( = ?auto_29918 ?auto_29924 ) ) ( not ( = ?auto_29917 ?auto_29924 ) ) ( SURFACE-AT ?auto_29917 ?auto_29925 ) ( CLEAR ?auto_29917 ) ( IS-CRATE ?auto_29919 ) ( AVAILABLE ?auto_29926 ) ( AVAILABLE ?auto_29920 ) ( SURFACE-AT ?auto_29919 ?auto_29923 ) ( ON ?auto_29919 ?auto_29922 ) ( CLEAR ?auto_29919 ) ( not ( = ?auto_29919 ?auto_29922 ) ) ( not ( = ?auto_29918 ?auto_29922 ) ) ( not ( = ?auto_29917 ?auto_29922 ) ) ( not ( = ?auto_29924 ?auto_29922 ) ) ( TRUCK-AT ?auto_29921 ?auto_29925 ) ( ON ?auto_29916 ?auto_29915 ) ( ON ?auto_29917 ?auto_29916 ) ( not ( = ?auto_29915 ?auto_29916 ) ) ( not ( = ?auto_29915 ?auto_29917 ) ) ( not ( = ?auto_29915 ?auto_29919 ) ) ( not ( = ?auto_29915 ?auto_29918 ) ) ( not ( = ?auto_29915 ?auto_29924 ) ) ( not ( = ?auto_29915 ?auto_29922 ) ) ( not ( = ?auto_29916 ?auto_29917 ) ) ( not ( = ?auto_29916 ?auto_29919 ) ) ( not ( = ?auto_29916 ?auto_29918 ) ) ( not ( = ?auto_29916 ?auto_29924 ) ) ( not ( = ?auto_29916 ?auto_29922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29917 ?auto_29919 ?auto_29918 )
      ( MAKE-4CRATE-VERIFY ?auto_29915 ?auto_29916 ?auto_29917 ?auto_29919 ?auto_29918 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29927 - SURFACE
      ?auto_29928 - SURFACE
      ?auto_29929 - SURFACE
      ?auto_29931 - SURFACE
      ?auto_29930 - SURFACE
      ?auto_29932 - SURFACE
    )
    :vars
    (
      ?auto_29939 - HOIST
      ?auto_29938 - PLACE
      ?auto_29936 - PLACE
      ?auto_29933 - HOIST
      ?auto_29937 - SURFACE
      ?auto_29935 - SURFACE
      ?auto_29934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29939 ?auto_29938 ) ( IS-CRATE ?auto_29932 ) ( not ( = ?auto_29930 ?auto_29932 ) ) ( not ( = ?auto_29931 ?auto_29930 ) ) ( not ( = ?auto_29931 ?auto_29932 ) ) ( not ( = ?auto_29936 ?auto_29938 ) ) ( HOIST-AT ?auto_29933 ?auto_29936 ) ( not ( = ?auto_29939 ?auto_29933 ) ) ( SURFACE-AT ?auto_29932 ?auto_29936 ) ( ON ?auto_29932 ?auto_29937 ) ( CLEAR ?auto_29932 ) ( not ( = ?auto_29930 ?auto_29937 ) ) ( not ( = ?auto_29932 ?auto_29937 ) ) ( not ( = ?auto_29931 ?auto_29937 ) ) ( SURFACE-AT ?auto_29931 ?auto_29938 ) ( CLEAR ?auto_29931 ) ( IS-CRATE ?auto_29930 ) ( AVAILABLE ?auto_29939 ) ( AVAILABLE ?auto_29933 ) ( SURFACE-AT ?auto_29930 ?auto_29936 ) ( ON ?auto_29930 ?auto_29935 ) ( CLEAR ?auto_29930 ) ( not ( = ?auto_29930 ?auto_29935 ) ) ( not ( = ?auto_29932 ?auto_29935 ) ) ( not ( = ?auto_29931 ?auto_29935 ) ) ( not ( = ?auto_29937 ?auto_29935 ) ) ( TRUCK-AT ?auto_29934 ?auto_29938 ) ( ON ?auto_29928 ?auto_29927 ) ( ON ?auto_29929 ?auto_29928 ) ( ON ?auto_29931 ?auto_29929 ) ( not ( = ?auto_29927 ?auto_29928 ) ) ( not ( = ?auto_29927 ?auto_29929 ) ) ( not ( = ?auto_29927 ?auto_29931 ) ) ( not ( = ?auto_29927 ?auto_29930 ) ) ( not ( = ?auto_29927 ?auto_29932 ) ) ( not ( = ?auto_29927 ?auto_29937 ) ) ( not ( = ?auto_29927 ?auto_29935 ) ) ( not ( = ?auto_29928 ?auto_29929 ) ) ( not ( = ?auto_29928 ?auto_29931 ) ) ( not ( = ?auto_29928 ?auto_29930 ) ) ( not ( = ?auto_29928 ?auto_29932 ) ) ( not ( = ?auto_29928 ?auto_29937 ) ) ( not ( = ?auto_29928 ?auto_29935 ) ) ( not ( = ?auto_29929 ?auto_29931 ) ) ( not ( = ?auto_29929 ?auto_29930 ) ) ( not ( = ?auto_29929 ?auto_29932 ) ) ( not ( = ?auto_29929 ?auto_29937 ) ) ( not ( = ?auto_29929 ?auto_29935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29931 ?auto_29930 ?auto_29932 )
      ( MAKE-5CRATE-VERIFY ?auto_29927 ?auto_29928 ?auto_29929 ?auto_29931 ?auto_29930 ?auto_29932 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_29940 - SURFACE
      ?auto_29941 - SURFACE
    )
    :vars
    (
      ?auto_29949 - HOIST
      ?auto_29948 - PLACE
      ?auto_29944 - SURFACE
      ?auto_29946 - PLACE
      ?auto_29942 - HOIST
      ?auto_29947 - SURFACE
      ?auto_29945 - SURFACE
      ?auto_29943 - TRUCK
      ?auto_29950 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29949 ?auto_29948 ) ( IS-CRATE ?auto_29941 ) ( not ( = ?auto_29940 ?auto_29941 ) ) ( not ( = ?auto_29944 ?auto_29940 ) ) ( not ( = ?auto_29944 ?auto_29941 ) ) ( not ( = ?auto_29946 ?auto_29948 ) ) ( HOIST-AT ?auto_29942 ?auto_29946 ) ( not ( = ?auto_29949 ?auto_29942 ) ) ( SURFACE-AT ?auto_29941 ?auto_29946 ) ( ON ?auto_29941 ?auto_29947 ) ( CLEAR ?auto_29941 ) ( not ( = ?auto_29940 ?auto_29947 ) ) ( not ( = ?auto_29941 ?auto_29947 ) ) ( not ( = ?auto_29944 ?auto_29947 ) ) ( IS-CRATE ?auto_29940 ) ( AVAILABLE ?auto_29942 ) ( SURFACE-AT ?auto_29940 ?auto_29946 ) ( ON ?auto_29940 ?auto_29945 ) ( CLEAR ?auto_29940 ) ( not ( = ?auto_29940 ?auto_29945 ) ) ( not ( = ?auto_29941 ?auto_29945 ) ) ( not ( = ?auto_29944 ?auto_29945 ) ) ( not ( = ?auto_29947 ?auto_29945 ) ) ( TRUCK-AT ?auto_29943 ?auto_29948 ) ( SURFACE-AT ?auto_29950 ?auto_29948 ) ( CLEAR ?auto_29950 ) ( LIFTING ?auto_29949 ?auto_29944 ) ( IS-CRATE ?auto_29944 ) ( not ( = ?auto_29950 ?auto_29944 ) ) ( not ( = ?auto_29940 ?auto_29950 ) ) ( not ( = ?auto_29941 ?auto_29950 ) ) ( not ( = ?auto_29947 ?auto_29950 ) ) ( not ( = ?auto_29945 ?auto_29950 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29950 ?auto_29944 )
      ( MAKE-2CRATE ?auto_29944 ?auto_29940 ?auto_29941 )
      ( MAKE-1CRATE-VERIFY ?auto_29940 ?auto_29941 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_29951 - SURFACE
      ?auto_29952 - SURFACE
      ?auto_29953 - SURFACE
    )
    :vars
    (
      ?auto_29956 - HOIST
      ?auto_29954 - PLACE
      ?auto_29961 - PLACE
      ?auto_29957 - HOIST
      ?auto_29959 - SURFACE
      ?auto_29958 - SURFACE
      ?auto_29955 - TRUCK
      ?auto_29960 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29956 ?auto_29954 ) ( IS-CRATE ?auto_29953 ) ( not ( = ?auto_29952 ?auto_29953 ) ) ( not ( = ?auto_29951 ?auto_29952 ) ) ( not ( = ?auto_29951 ?auto_29953 ) ) ( not ( = ?auto_29961 ?auto_29954 ) ) ( HOIST-AT ?auto_29957 ?auto_29961 ) ( not ( = ?auto_29956 ?auto_29957 ) ) ( SURFACE-AT ?auto_29953 ?auto_29961 ) ( ON ?auto_29953 ?auto_29959 ) ( CLEAR ?auto_29953 ) ( not ( = ?auto_29952 ?auto_29959 ) ) ( not ( = ?auto_29953 ?auto_29959 ) ) ( not ( = ?auto_29951 ?auto_29959 ) ) ( IS-CRATE ?auto_29952 ) ( AVAILABLE ?auto_29957 ) ( SURFACE-AT ?auto_29952 ?auto_29961 ) ( ON ?auto_29952 ?auto_29958 ) ( CLEAR ?auto_29952 ) ( not ( = ?auto_29952 ?auto_29958 ) ) ( not ( = ?auto_29953 ?auto_29958 ) ) ( not ( = ?auto_29951 ?auto_29958 ) ) ( not ( = ?auto_29959 ?auto_29958 ) ) ( TRUCK-AT ?auto_29955 ?auto_29954 ) ( SURFACE-AT ?auto_29960 ?auto_29954 ) ( CLEAR ?auto_29960 ) ( LIFTING ?auto_29956 ?auto_29951 ) ( IS-CRATE ?auto_29951 ) ( not ( = ?auto_29960 ?auto_29951 ) ) ( not ( = ?auto_29952 ?auto_29960 ) ) ( not ( = ?auto_29953 ?auto_29960 ) ) ( not ( = ?auto_29959 ?auto_29960 ) ) ( not ( = ?auto_29958 ?auto_29960 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_29952 ?auto_29953 )
      ( MAKE-2CRATE-VERIFY ?auto_29951 ?auto_29952 ?auto_29953 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_29962 - SURFACE
      ?auto_29963 - SURFACE
      ?auto_29964 - SURFACE
      ?auto_29965 - SURFACE
    )
    :vars
    (
      ?auto_29971 - HOIST
      ?auto_29970 - PLACE
      ?auto_29968 - PLACE
      ?auto_29972 - HOIST
      ?auto_29966 - SURFACE
      ?auto_29967 - SURFACE
      ?auto_29969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29971 ?auto_29970 ) ( IS-CRATE ?auto_29965 ) ( not ( = ?auto_29964 ?auto_29965 ) ) ( not ( = ?auto_29963 ?auto_29964 ) ) ( not ( = ?auto_29963 ?auto_29965 ) ) ( not ( = ?auto_29968 ?auto_29970 ) ) ( HOIST-AT ?auto_29972 ?auto_29968 ) ( not ( = ?auto_29971 ?auto_29972 ) ) ( SURFACE-AT ?auto_29965 ?auto_29968 ) ( ON ?auto_29965 ?auto_29966 ) ( CLEAR ?auto_29965 ) ( not ( = ?auto_29964 ?auto_29966 ) ) ( not ( = ?auto_29965 ?auto_29966 ) ) ( not ( = ?auto_29963 ?auto_29966 ) ) ( IS-CRATE ?auto_29964 ) ( AVAILABLE ?auto_29972 ) ( SURFACE-AT ?auto_29964 ?auto_29968 ) ( ON ?auto_29964 ?auto_29967 ) ( CLEAR ?auto_29964 ) ( not ( = ?auto_29964 ?auto_29967 ) ) ( not ( = ?auto_29965 ?auto_29967 ) ) ( not ( = ?auto_29963 ?auto_29967 ) ) ( not ( = ?auto_29966 ?auto_29967 ) ) ( TRUCK-AT ?auto_29969 ?auto_29970 ) ( SURFACE-AT ?auto_29962 ?auto_29970 ) ( CLEAR ?auto_29962 ) ( LIFTING ?auto_29971 ?auto_29963 ) ( IS-CRATE ?auto_29963 ) ( not ( = ?auto_29962 ?auto_29963 ) ) ( not ( = ?auto_29964 ?auto_29962 ) ) ( not ( = ?auto_29965 ?auto_29962 ) ) ( not ( = ?auto_29966 ?auto_29962 ) ) ( not ( = ?auto_29967 ?auto_29962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29963 ?auto_29964 ?auto_29965 )
      ( MAKE-3CRATE-VERIFY ?auto_29962 ?auto_29963 ?auto_29964 ?auto_29965 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_29973 - SURFACE
      ?auto_29974 - SURFACE
      ?auto_29975 - SURFACE
      ?auto_29977 - SURFACE
      ?auto_29976 - SURFACE
    )
    :vars
    (
      ?auto_29983 - HOIST
      ?auto_29982 - PLACE
      ?auto_29980 - PLACE
      ?auto_29984 - HOIST
      ?auto_29978 - SURFACE
      ?auto_29979 - SURFACE
      ?auto_29981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29983 ?auto_29982 ) ( IS-CRATE ?auto_29976 ) ( not ( = ?auto_29977 ?auto_29976 ) ) ( not ( = ?auto_29975 ?auto_29977 ) ) ( not ( = ?auto_29975 ?auto_29976 ) ) ( not ( = ?auto_29980 ?auto_29982 ) ) ( HOIST-AT ?auto_29984 ?auto_29980 ) ( not ( = ?auto_29983 ?auto_29984 ) ) ( SURFACE-AT ?auto_29976 ?auto_29980 ) ( ON ?auto_29976 ?auto_29978 ) ( CLEAR ?auto_29976 ) ( not ( = ?auto_29977 ?auto_29978 ) ) ( not ( = ?auto_29976 ?auto_29978 ) ) ( not ( = ?auto_29975 ?auto_29978 ) ) ( IS-CRATE ?auto_29977 ) ( AVAILABLE ?auto_29984 ) ( SURFACE-AT ?auto_29977 ?auto_29980 ) ( ON ?auto_29977 ?auto_29979 ) ( CLEAR ?auto_29977 ) ( not ( = ?auto_29977 ?auto_29979 ) ) ( not ( = ?auto_29976 ?auto_29979 ) ) ( not ( = ?auto_29975 ?auto_29979 ) ) ( not ( = ?auto_29978 ?auto_29979 ) ) ( TRUCK-AT ?auto_29981 ?auto_29982 ) ( SURFACE-AT ?auto_29974 ?auto_29982 ) ( CLEAR ?auto_29974 ) ( LIFTING ?auto_29983 ?auto_29975 ) ( IS-CRATE ?auto_29975 ) ( not ( = ?auto_29974 ?auto_29975 ) ) ( not ( = ?auto_29977 ?auto_29974 ) ) ( not ( = ?auto_29976 ?auto_29974 ) ) ( not ( = ?auto_29978 ?auto_29974 ) ) ( not ( = ?auto_29979 ?auto_29974 ) ) ( ON ?auto_29974 ?auto_29973 ) ( not ( = ?auto_29973 ?auto_29974 ) ) ( not ( = ?auto_29973 ?auto_29975 ) ) ( not ( = ?auto_29973 ?auto_29977 ) ) ( not ( = ?auto_29973 ?auto_29976 ) ) ( not ( = ?auto_29973 ?auto_29978 ) ) ( not ( = ?auto_29973 ?auto_29979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29975 ?auto_29977 ?auto_29976 )
      ( MAKE-4CRATE-VERIFY ?auto_29973 ?auto_29974 ?auto_29975 ?auto_29977 ?auto_29976 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_29985 - SURFACE
      ?auto_29986 - SURFACE
      ?auto_29987 - SURFACE
      ?auto_29989 - SURFACE
      ?auto_29988 - SURFACE
      ?auto_29990 - SURFACE
    )
    :vars
    (
      ?auto_29996 - HOIST
      ?auto_29995 - PLACE
      ?auto_29993 - PLACE
      ?auto_29997 - HOIST
      ?auto_29991 - SURFACE
      ?auto_29992 - SURFACE
      ?auto_29994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29996 ?auto_29995 ) ( IS-CRATE ?auto_29990 ) ( not ( = ?auto_29988 ?auto_29990 ) ) ( not ( = ?auto_29989 ?auto_29988 ) ) ( not ( = ?auto_29989 ?auto_29990 ) ) ( not ( = ?auto_29993 ?auto_29995 ) ) ( HOIST-AT ?auto_29997 ?auto_29993 ) ( not ( = ?auto_29996 ?auto_29997 ) ) ( SURFACE-AT ?auto_29990 ?auto_29993 ) ( ON ?auto_29990 ?auto_29991 ) ( CLEAR ?auto_29990 ) ( not ( = ?auto_29988 ?auto_29991 ) ) ( not ( = ?auto_29990 ?auto_29991 ) ) ( not ( = ?auto_29989 ?auto_29991 ) ) ( IS-CRATE ?auto_29988 ) ( AVAILABLE ?auto_29997 ) ( SURFACE-AT ?auto_29988 ?auto_29993 ) ( ON ?auto_29988 ?auto_29992 ) ( CLEAR ?auto_29988 ) ( not ( = ?auto_29988 ?auto_29992 ) ) ( not ( = ?auto_29990 ?auto_29992 ) ) ( not ( = ?auto_29989 ?auto_29992 ) ) ( not ( = ?auto_29991 ?auto_29992 ) ) ( TRUCK-AT ?auto_29994 ?auto_29995 ) ( SURFACE-AT ?auto_29987 ?auto_29995 ) ( CLEAR ?auto_29987 ) ( LIFTING ?auto_29996 ?auto_29989 ) ( IS-CRATE ?auto_29989 ) ( not ( = ?auto_29987 ?auto_29989 ) ) ( not ( = ?auto_29988 ?auto_29987 ) ) ( not ( = ?auto_29990 ?auto_29987 ) ) ( not ( = ?auto_29991 ?auto_29987 ) ) ( not ( = ?auto_29992 ?auto_29987 ) ) ( ON ?auto_29986 ?auto_29985 ) ( ON ?auto_29987 ?auto_29986 ) ( not ( = ?auto_29985 ?auto_29986 ) ) ( not ( = ?auto_29985 ?auto_29987 ) ) ( not ( = ?auto_29985 ?auto_29989 ) ) ( not ( = ?auto_29985 ?auto_29988 ) ) ( not ( = ?auto_29985 ?auto_29990 ) ) ( not ( = ?auto_29985 ?auto_29991 ) ) ( not ( = ?auto_29985 ?auto_29992 ) ) ( not ( = ?auto_29986 ?auto_29987 ) ) ( not ( = ?auto_29986 ?auto_29989 ) ) ( not ( = ?auto_29986 ?auto_29988 ) ) ( not ( = ?auto_29986 ?auto_29990 ) ) ( not ( = ?auto_29986 ?auto_29991 ) ) ( not ( = ?auto_29986 ?auto_29992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_29989 ?auto_29988 ?auto_29990 )
      ( MAKE-5CRATE-VERIFY ?auto_29985 ?auto_29986 ?auto_29987 ?auto_29989 ?auto_29988 ?auto_29990 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_30906 - SURFACE
      ?auto_30907 - SURFACE
      ?auto_30908 - SURFACE
      ?auto_30910 - SURFACE
      ?auto_30909 - SURFACE
      ?auto_30911 - SURFACE
      ?auto_30912 - SURFACE
    )
    :vars
    (
      ?auto_30914 - HOIST
      ?auto_30913 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_30914 ?auto_30913 ) ( SURFACE-AT ?auto_30911 ?auto_30913 ) ( CLEAR ?auto_30911 ) ( LIFTING ?auto_30914 ?auto_30912 ) ( IS-CRATE ?auto_30912 ) ( not ( = ?auto_30911 ?auto_30912 ) ) ( ON ?auto_30907 ?auto_30906 ) ( ON ?auto_30908 ?auto_30907 ) ( ON ?auto_30910 ?auto_30908 ) ( ON ?auto_30909 ?auto_30910 ) ( ON ?auto_30911 ?auto_30909 ) ( not ( = ?auto_30906 ?auto_30907 ) ) ( not ( = ?auto_30906 ?auto_30908 ) ) ( not ( = ?auto_30906 ?auto_30910 ) ) ( not ( = ?auto_30906 ?auto_30909 ) ) ( not ( = ?auto_30906 ?auto_30911 ) ) ( not ( = ?auto_30906 ?auto_30912 ) ) ( not ( = ?auto_30907 ?auto_30908 ) ) ( not ( = ?auto_30907 ?auto_30910 ) ) ( not ( = ?auto_30907 ?auto_30909 ) ) ( not ( = ?auto_30907 ?auto_30911 ) ) ( not ( = ?auto_30907 ?auto_30912 ) ) ( not ( = ?auto_30908 ?auto_30910 ) ) ( not ( = ?auto_30908 ?auto_30909 ) ) ( not ( = ?auto_30908 ?auto_30911 ) ) ( not ( = ?auto_30908 ?auto_30912 ) ) ( not ( = ?auto_30910 ?auto_30909 ) ) ( not ( = ?auto_30910 ?auto_30911 ) ) ( not ( = ?auto_30910 ?auto_30912 ) ) ( not ( = ?auto_30909 ?auto_30911 ) ) ( not ( = ?auto_30909 ?auto_30912 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_30911 ?auto_30912 )
      ( MAKE-6CRATE-VERIFY ?auto_30906 ?auto_30907 ?auto_30908 ?auto_30910 ?auto_30909 ?auto_30911 ?auto_30912 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_30950 - SURFACE
      ?auto_30951 - SURFACE
      ?auto_30952 - SURFACE
      ?auto_30954 - SURFACE
      ?auto_30953 - SURFACE
      ?auto_30955 - SURFACE
      ?auto_30956 - SURFACE
    )
    :vars
    (
      ?auto_30958 - HOIST
      ?auto_30957 - PLACE
      ?auto_30959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_30958 ?auto_30957 ) ( SURFACE-AT ?auto_30955 ?auto_30957 ) ( CLEAR ?auto_30955 ) ( IS-CRATE ?auto_30956 ) ( not ( = ?auto_30955 ?auto_30956 ) ) ( TRUCK-AT ?auto_30959 ?auto_30957 ) ( AVAILABLE ?auto_30958 ) ( IN ?auto_30956 ?auto_30959 ) ( ON ?auto_30955 ?auto_30953 ) ( not ( = ?auto_30953 ?auto_30955 ) ) ( not ( = ?auto_30953 ?auto_30956 ) ) ( ON ?auto_30951 ?auto_30950 ) ( ON ?auto_30952 ?auto_30951 ) ( ON ?auto_30954 ?auto_30952 ) ( ON ?auto_30953 ?auto_30954 ) ( not ( = ?auto_30950 ?auto_30951 ) ) ( not ( = ?auto_30950 ?auto_30952 ) ) ( not ( = ?auto_30950 ?auto_30954 ) ) ( not ( = ?auto_30950 ?auto_30953 ) ) ( not ( = ?auto_30950 ?auto_30955 ) ) ( not ( = ?auto_30950 ?auto_30956 ) ) ( not ( = ?auto_30951 ?auto_30952 ) ) ( not ( = ?auto_30951 ?auto_30954 ) ) ( not ( = ?auto_30951 ?auto_30953 ) ) ( not ( = ?auto_30951 ?auto_30955 ) ) ( not ( = ?auto_30951 ?auto_30956 ) ) ( not ( = ?auto_30952 ?auto_30954 ) ) ( not ( = ?auto_30952 ?auto_30953 ) ) ( not ( = ?auto_30952 ?auto_30955 ) ) ( not ( = ?auto_30952 ?auto_30956 ) ) ( not ( = ?auto_30954 ?auto_30953 ) ) ( not ( = ?auto_30954 ?auto_30955 ) ) ( not ( = ?auto_30954 ?auto_30956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_30953 ?auto_30955 ?auto_30956 )
      ( MAKE-6CRATE-VERIFY ?auto_30950 ?auto_30951 ?auto_30952 ?auto_30954 ?auto_30953 ?auto_30955 ?auto_30956 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31001 - SURFACE
      ?auto_31002 - SURFACE
      ?auto_31003 - SURFACE
      ?auto_31005 - SURFACE
      ?auto_31004 - SURFACE
      ?auto_31006 - SURFACE
      ?auto_31007 - SURFACE
    )
    :vars
    (
      ?auto_31009 - HOIST
      ?auto_31010 - PLACE
      ?auto_31011 - TRUCK
      ?auto_31008 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31009 ?auto_31010 ) ( SURFACE-AT ?auto_31006 ?auto_31010 ) ( CLEAR ?auto_31006 ) ( IS-CRATE ?auto_31007 ) ( not ( = ?auto_31006 ?auto_31007 ) ) ( AVAILABLE ?auto_31009 ) ( IN ?auto_31007 ?auto_31011 ) ( ON ?auto_31006 ?auto_31004 ) ( not ( = ?auto_31004 ?auto_31006 ) ) ( not ( = ?auto_31004 ?auto_31007 ) ) ( TRUCK-AT ?auto_31011 ?auto_31008 ) ( not ( = ?auto_31008 ?auto_31010 ) ) ( ON ?auto_31002 ?auto_31001 ) ( ON ?auto_31003 ?auto_31002 ) ( ON ?auto_31005 ?auto_31003 ) ( ON ?auto_31004 ?auto_31005 ) ( not ( = ?auto_31001 ?auto_31002 ) ) ( not ( = ?auto_31001 ?auto_31003 ) ) ( not ( = ?auto_31001 ?auto_31005 ) ) ( not ( = ?auto_31001 ?auto_31004 ) ) ( not ( = ?auto_31001 ?auto_31006 ) ) ( not ( = ?auto_31001 ?auto_31007 ) ) ( not ( = ?auto_31002 ?auto_31003 ) ) ( not ( = ?auto_31002 ?auto_31005 ) ) ( not ( = ?auto_31002 ?auto_31004 ) ) ( not ( = ?auto_31002 ?auto_31006 ) ) ( not ( = ?auto_31002 ?auto_31007 ) ) ( not ( = ?auto_31003 ?auto_31005 ) ) ( not ( = ?auto_31003 ?auto_31004 ) ) ( not ( = ?auto_31003 ?auto_31006 ) ) ( not ( = ?auto_31003 ?auto_31007 ) ) ( not ( = ?auto_31005 ?auto_31004 ) ) ( not ( = ?auto_31005 ?auto_31006 ) ) ( not ( = ?auto_31005 ?auto_31007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31004 ?auto_31006 ?auto_31007 )
      ( MAKE-6CRATE-VERIFY ?auto_31001 ?auto_31002 ?auto_31003 ?auto_31005 ?auto_31004 ?auto_31006 ?auto_31007 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31058 - SURFACE
      ?auto_31059 - SURFACE
      ?auto_31060 - SURFACE
      ?auto_31062 - SURFACE
      ?auto_31061 - SURFACE
      ?auto_31063 - SURFACE
      ?auto_31064 - SURFACE
    )
    :vars
    (
      ?auto_31067 - HOIST
      ?auto_31069 - PLACE
      ?auto_31065 - TRUCK
      ?auto_31068 - PLACE
      ?auto_31066 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_31067 ?auto_31069 ) ( SURFACE-AT ?auto_31063 ?auto_31069 ) ( CLEAR ?auto_31063 ) ( IS-CRATE ?auto_31064 ) ( not ( = ?auto_31063 ?auto_31064 ) ) ( AVAILABLE ?auto_31067 ) ( ON ?auto_31063 ?auto_31061 ) ( not ( = ?auto_31061 ?auto_31063 ) ) ( not ( = ?auto_31061 ?auto_31064 ) ) ( TRUCK-AT ?auto_31065 ?auto_31068 ) ( not ( = ?auto_31068 ?auto_31069 ) ) ( HOIST-AT ?auto_31066 ?auto_31068 ) ( LIFTING ?auto_31066 ?auto_31064 ) ( not ( = ?auto_31067 ?auto_31066 ) ) ( ON ?auto_31059 ?auto_31058 ) ( ON ?auto_31060 ?auto_31059 ) ( ON ?auto_31062 ?auto_31060 ) ( ON ?auto_31061 ?auto_31062 ) ( not ( = ?auto_31058 ?auto_31059 ) ) ( not ( = ?auto_31058 ?auto_31060 ) ) ( not ( = ?auto_31058 ?auto_31062 ) ) ( not ( = ?auto_31058 ?auto_31061 ) ) ( not ( = ?auto_31058 ?auto_31063 ) ) ( not ( = ?auto_31058 ?auto_31064 ) ) ( not ( = ?auto_31059 ?auto_31060 ) ) ( not ( = ?auto_31059 ?auto_31062 ) ) ( not ( = ?auto_31059 ?auto_31061 ) ) ( not ( = ?auto_31059 ?auto_31063 ) ) ( not ( = ?auto_31059 ?auto_31064 ) ) ( not ( = ?auto_31060 ?auto_31062 ) ) ( not ( = ?auto_31060 ?auto_31061 ) ) ( not ( = ?auto_31060 ?auto_31063 ) ) ( not ( = ?auto_31060 ?auto_31064 ) ) ( not ( = ?auto_31062 ?auto_31061 ) ) ( not ( = ?auto_31062 ?auto_31063 ) ) ( not ( = ?auto_31062 ?auto_31064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31061 ?auto_31063 ?auto_31064 )
      ( MAKE-6CRATE-VERIFY ?auto_31058 ?auto_31059 ?auto_31060 ?auto_31062 ?auto_31061 ?auto_31063 ?auto_31064 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31121 - SURFACE
      ?auto_31122 - SURFACE
      ?auto_31123 - SURFACE
      ?auto_31125 - SURFACE
      ?auto_31124 - SURFACE
      ?auto_31126 - SURFACE
      ?auto_31127 - SURFACE
    )
    :vars
    (
      ?auto_31130 - HOIST
      ?auto_31128 - PLACE
      ?auto_31129 - TRUCK
      ?auto_31131 - PLACE
      ?auto_31132 - HOIST
      ?auto_31133 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31130 ?auto_31128 ) ( SURFACE-AT ?auto_31126 ?auto_31128 ) ( CLEAR ?auto_31126 ) ( IS-CRATE ?auto_31127 ) ( not ( = ?auto_31126 ?auto_31127 ) ) ( AVAILABLE ?auto_31130 ) ( ON ?auto_31126 ?auto_31124 ) ( not ( = ?auto_31124 ?auto_31126 ) ) ( not ( = ?auto_31124 ?auto_31127 ) ) ( TRUCK-AT ?auto_31129 ?auto_31131 ) ( not ( = ?auto_31131 ?auto_31128 ) ) ( HOIST-AT ?auto_31132 ?auto_31131 ) ( not ( = ?auto_31130 ?auto_31132 ) ) ( AVAILABLE ?auto_31132 ) ( SURFACE-AT ?auto_31127 ?auto_31131 ) ( ON ?auto_31127 ?auto_31133 ) ( CLEAR ?auto_31127 ) ( not ( = ?auto_31126 ?auto_31133 ) ) ( not ( = ?auto_31127 ?auto_31133 ) ) ( not ( = ?auto_31124 ?auto_31133 ) ) ( ON ?auto_31122 ?auto_31121 ) ( ON ?auto_31123 ?auto_31122 ) ( ON ?auto_31125 ?auto_31123 ) ( ON ?auto_31124 ?auto_31125 ) ( not ( = ?auto_31121 ?auto_31122 ) ) ( not ( = ?auto_31121 ?auto_31123 ) ) ( not ( = ?auto_31121 ?auto_31125 ) ) ( not ( = ?auto_31121 ?auto_31124 ) ) ( not ( = ?auto_31121 ?auto_31126 ) ) ( not ( = ?auto_31121 ?auto_31127 ) ) ( not ( = ?auto_31121 ?auto_31133 ) ) ( not ( = ?auto_31122 ?auto_31123 ) ) ( not ( = ?auto_31122 ?auto_31125 ) ) ( not ( = ?auto_31122 ?auto_31124 ) ) ( not ( = ?auto_31122 ?auto_31126 ) ) ( not ( = ?auto_31122 ?auto_31127 ) ) ( not ( = ?auto_31122 ?auto_31133 ) ) ( not ( = ?auto_31123 ?auto_31125 ) ) ( not ( = ?auto_31123 ?auto_31124 ) ) ( not ( = ?auto_31123 ?auto_31126 ) ) ( not ( = ?auto_31123 ?auto_31127 ) ) ( not ( = ?auto_31123 ?auto_31133 ) ) ( not ( = ?auto_31125 ?auto_31124 ) ) ( not ( = ?auto_31125 ?auto_31126 ) ) ( not ( = ?auto_31125 ?auto_31127 ) ) ( not ( = ?auto_31125 ?auto_31133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31124 ?auto_31126 ?auto_31127 )
      ( MAKE-6CRATE-VERIFY ?auto_31121 ?auto_31122 ?auto_31123 ?auto_31125 ?auto_31124 ?auto_31126 ?auto_31127 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31185 - SURFACE
      ?auto_31186 - SURFACE
      ?auto_31187 - SURFACE
      ?auto_31189 - SURFACE
      ?auto_31188 - SURFACE
      ?auto_31190 - SURFACE
      ?auto_31191 - SURFACE
    )
    :vars
    (
      ?auto_31194 - HOIST
      ?auto_31192 - PLACE
      ?auto_31197 - PLACE
      ?auto_31195 - HOIST
      ?auto_31196 - SURFACE
      ?auto_31193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31194 ?auto_31192 ) ( SURFACE-AT ?auto_31190 ?auto_31192 ) ( CLEAR ?auto_31190 ) ( IS-CRATE ?auto_31191 ) ( not ( = ?auto_31190 ?auto_31191 ) ) ( AVAILABLE ?auto_31194 ) ( ON ?auto_31190 ?auto_31188 ) ( not ( = ?auto_31188 ?auto_31190 ) ) ( not ( = ?auto_31188 ?auto_31191 ) ) ( not ( = ?auto_31197 ?auto_31192 ) ) ( HOIST-AT ?auto_31195 ?auto_31197 ) ( not ( = ?auto_31194 ?auto_31195 ) ) ( AVAILABLE ?auto_31195 ) ( SURFACE-AT ?auto_31191 ?auto_31197 ) ( ON ?auto_31191 ?auto_31196 ) ( CLEAR ?auto_31191 ) ( not ( = ?auto_31190 ?auto_31196 ) ) ( not ( = ?auto_31191 ?auto_31196 ) ) ( not ( = ?auto_31188 ?auto_31196 ) ) ( TRUCK-AT ?auto_31193 ?auto_31192 ) ( ON ?auto_31186 ?auto_31185 ) ( ON ?auto_31187 ?auto_31186 ) ( ON ?auto_31189 ?auto_31187 ) ( ON ?auto_31188 ?auto_31189 ) ( not ( = ?auto_31185 ?auto_31186 ) ) ( not ( = ?auto_31185 ?auto_31187 ) ) ( not ( = ?auto_31185 ?auto_31189 ) ) ( not ( = ?auto_31185 ?auto_31188 ) ) ( not ( = ?auto_31185 ?auto_31190 ) ) ( not ( = ?auto_31185 ?auto_31191 ) ) ( not ( = ?auto_31185 ?auto_31196 ) ) ( not ( = ?auto_31186 ?auto_31187 ) ) ( not ( = ?auto_31186 ?auto_31189 ) ) ( not ( = ?auto_31186 ?auto_31188 ) ) ( not ( = ?auto_31186 ?auto_31190 ) ) ( not ( = ?auto_31186 ?auto_31191 ) ) ( not ( = ?auto_31186 ?auto_31196 ) ) ( not ( = ?auto_31187 ?auto_31189 ) ) ( not ( = ?auto_31187 ?auto_31188 ) ) ( not ( = ?auto_31187 ?auto_31190 ) ) ( not ( = ?auto_31187 ?auto_31191 ) ) ( not ( = ?auto_31187 ?auto_31196 ) ) ( not ( = ?auto_31189 ?auto_31188 ) ) ( not ( = ?auto_31189 ?auto_31190 ) ) ( not ( = ?auto_31189 ?auto_31191 ) ) ( not ( = ?auto_31189 ?auto_31196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31188 ?auto_31190 ?auto_31191 )
      ( MAKE-6CRATE-VERIFY ?auto_31185 ?auto_31186 ?auto_31187 ?auto_31189 ?auto_31188 ?auto_31190 ?auto_31191 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31249 - SURFACE
      ?auto_31250 - SURFACE
      ?auto_31251 - SURFACE
      ?auto_31253 - SURFACE
      ?auto_31252 - SURFACE
      ?auto_31254 - SURFACE
      ?auto_31255 - SURFACE
    )
    :vars
    (
      ?auto_31256 - HOIST
      ?auto_31258 - PLACE
      ?auto_31257 - PLACE
      ?auto_31261 - HOIST
      ?auto_31260 - SURFACE
      ?auto_31259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31256 ?auto_31258 ) ( IS-CRATE ?auto_31255 ) ( not ( = ?auto_31254 ?auto_31255 ) ) ( not ( = ?auto_31252 ?auto_31254 ) ) ( not ( = ?auto_31252 ?auto_31255 ) ) ( not ( = ?auto_31257 ?auto_31258 ) ) ( HOIST-AT ?auto_31261 ?auto_31257 ) ( not ( = ?auto_31256 ?auto_31261 ) ) ( AVAILABLE ?auto_31261 ) ( SURFACE-AT ?auto_31255 ?auto_31257 ) ( ON ?auto_31255 ?auto_31260 ) ( CLEAR ?auto_31255 ) ( not ( = ?auto_31254 ?auto_31260 ) ) ( not ( = ?auto_31255 ?auto_31260 ) ) ( not ( = ?auto_31252 ?auto_31260 ) ) ( TRUCK-AT ?auto_31259 ?auto_31258 ) ( SURFACE-AT ?auto_31252 ?auto_31258 ) ( CLEAR ?auto_31252 ) ( LIFTING ?auto_31256 ?auto_31254 ) ( IS-CRATE ?auto_31254 ) ( ON ?auto_31250 ?auto_31249 ) ( ON ?auto_31251 ?auto_31250 ) ( ON ?auto_31253 ?auto_31251 ) ( ON ?auto_31252 ?auto_31253 ) ( not ( = ?auto_31249 ?auto_31250 ) ) ( not ( = ?auto_31249 ?auto_31251 ) ) ( not ( = ?auto_31249 ?auto_31253 ) ) ( not ( = ?auto_31249 ?auto_31252 ) ) ( not ( = ?auto_31249 ?auto_31254 ) ) ( not ( = ?auto_31249 ?auto_31255 ) ) ( not ( = ?auto_31249 ?auto_31260 ) ) ( not ( = ?auto_31250 ?auto_31251 ) ) ( not ( = ?auto_31250 ?auto_31253 ) ) ( not ( = ?auto_31250 ?auto_31252 ) ) ( not ( = ?auto_31250 ?auto_31254 ) ) ( not ( = ?auto_31250 ?auto_31255 ) ) ( not ( = ?auto_31250 ?auto_31260 ) ) ( not ( = ?auto_31251 ?auto_31253 ) ) ( not ( = ?auto_31251 ?auto_31252 ) ) ( not ( = ?auto_31251 ?auto_31254 ) ) ( not ( = ?auto_31251 ?auto_31255 ) ) ( not ( = ?auto_31251 ?auto_31260 ) ) ( not ( = ?auto_31253 ?auto_31252 ) ) ( not ( = ?auto_31253 ?auto_31254 ) ) ( not ( = ?auto_31253 ?auto_31255 ) ) ( not ( = ?auto_31253 ?auto_31260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31252 ?auto_31254 ?auto_31255 )
      ( MAKE-6CRATE-VERIFY ?auto_31249 ?auto_31250 ?auto_31251 ?auto_31253 ?auto_31252 ?auto_31254 ?auto_31255 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_31313 - SURFACE
      ?auto_31314 - SURFACE
      ?auto_31315 - SURFACE
      ?auto_31317 - SURFACE
      ?auto_31316 - SURFACE
      ?auto_31318 - SURFACE
      ?auto_31319 - SURFACE
    )
    :vars
    (
      ?auto_31325 - HOIST
      ?auto_31321 - PLACE
      ?auto_31323 - PLACE
      ?auto_31324 - HOIST
      ?auto_31322 - SURFACE
      ?auto_31320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_31325 ?auto_31321 ) ( IS-CRATE ?auto_31319 ) ( not ( = ?auto_31318 ?auto_31319 ) ) ( not ( = ?auto_31316 ?auto_31318 ) ) ( not ( = ?auto_31316 ?auto_31319 ) ) ( not ( = ?auto_31323 ?auto_31321 ) ) ( HOIST-AT ?auto_31324 ?auto_31323 ) ( not ( = ?auto_31325 ?auto_31324 ) ) ( AVAILABLE ?auto_31324 ) ( SURFACE-AT ?auto_31319 ?auto_31323 ) ( ON ?auto_31319 ?auto_31322 ) ( CLEAR ?auto_31319 ) ( not ( = ?auto_31318 ?auto_31322 ) ) ( not ( = ?auto_31319 ?auto_31322 ) ) ( not ( = ?auto_31316 ?auto_31322 ) ) ( TRUCK-AT ?auto_31320 ?auto_31321 ) ( SURFACE-AT ?auto_31316 ?auto_31321 ) ( CLEAR ?auto_31316 ) ( IS-CRATE ?auto_31318 ) ( AVAILABLE ?auto_31325 ) ( IN ?auto_31318 ?auto_31320 ) ( ON ?auto_31314 ?auto_31313 ) ( ON ?auto_31315 ?auto_31314 ) ( ON ?auto_31317 ?auto_31315 ) ( ON ?auto_31316 ?auto_31317 ) ( not ( = ?auto_31313 ?auto_31314 ) ) ( not ( = ?auto_31313 ?auto_31315 ) ) ( not ( = ?auto_31313 ?auto_31317 ) ) ( not ( = ?auto_31313 ?auto_31316 ) ) ( not ( = ?auto_31313 ?auto_31318 ) ) ( not ( = ?auto_31313 ?auto_31319 ) ) ( not ( = ?auto_31313 ?auto_31322 ) ) ( not ( = ?auto_31314 ?auto_31315 ) ) ( not ( = ?auto_31314 ?auto_31317 ) ) ( not ( = ?auto_31314 ?auto_31316 ) ) ( not ( = ?auto_31314 ?auto_31318 ) ) ( not ( = ?auto_31314 ?auto_31319 ) ) ( not ( = ?auto_31314 ?auto_31322 ) ) ( not ( = ?auto_31315 ?auto_31317 ) ) ( not ( = ?auto_31315 ?auto_31316 ) ) ( not ( = ?auto_31315 ?auto_31318 ) ) ( not ( = ?auto_31315 ?auto_31319 ) ) ( not ( = ?auto_31315 ?auto_31322 ) ) ( not ( = ?auto_31317 ?auto_31316 ) ) ( not ( = ?auto_31317 ?auto_31318 ) ) ( not ( = ?auto_31317 ?auto_31319 ) ) ( not ( = ?auto_31317 ?auto_31322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_31316 ?auto_31318 ?auto_31319 )
      ( MAKE-6CRATE-VERIFY ?auto_31313 ?auto_31314 ?auto_31315 ?auto_31317 ?auto_31316 ?auto_31318 ?auto_31319 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_31783 - SURFACE
      ?auto_31784 - SURFACE
    )
    :vars
    (
      ?auto_31788 - HOIST
      ?auto_31791 - PLACE
      ?auto_31786 - SURFACE
      ?auto_31787 - PLACE
      ?auto_31789 - HOIST
      ?auto_31790 - SURFACE
      ?auto_31785 - TRUCK
      ?auto_31792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_31788 ?auto_31791 ) ( SURFACE-AT ?auto_31783 ?auto_31791 ) ( CLEAR ?auto_31783 ) ( IS-CRATE ?auto_31784 ) ( not ( = ?auto_31783 ?auto_31784 ) ) ( ON ?auto_31783 ?auto_31786 ) ( not ( = ?auto_31786 ?auto_31783 ) ) ( not ( = ?auto_31786 ?auto_31784 ) ) ( not ( = ?auto_31787 ?auto_31791 ) ) ( HOIST-AT ?auto_31789 ?auto_31787 ) ( not ( = ?auto_31788 ?auto_31789 ) ) ( AVAILABLE ?auto_31789 ) ( SURFACE-AT ?auto_31784 ?auto_31787 ) ( ON ?auto_31784 ?auto_31790 ) ( CLEAR ?auto_31784 ) ( not ( = ?auto_31783 ?auto_31790 ) ) ( not ( = ?auto_31784 ?auto_31790 ) ) ( not ( = ?auto_31786 ?auto_31790 ) ) ( TRUCK-AT ?auto_31785 ?auto_31791 ) ( LIFTING ?auto_31788 ?auto_31792 ) ( IS-CRATE ?auto_31792 ) ( not ( = ?auto_31783 ?auto_31792 ) ) ( not ( = ?auto_31784 ?auto_31792 ) ) ( not ( = ?auto_31786 ?auto_31792 ) ) ( not ( = ?auto_31790 ?auto_31792 ) ) )
    :subtasks
    ( ( !LOAD ?auto_31788 ?auto_31792 ?auto_31785 ?auto_31791 )
      ( MAKE-1CRATE ?auto_31783 ?auto_31784 )
      ( MAKE-1CRATE-VERIFY ?auto_31783 ?auto_31784 ) )
  )

)

