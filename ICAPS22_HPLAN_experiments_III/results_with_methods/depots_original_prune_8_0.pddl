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
      ?auto_98782 - SURFACE
      ?auto_98783 - SURFACE
    )
    :vars
    (
      ?auto_98784 - HOIST
      ?auto_98785 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98784 ?auto_98785 ) ( SURFACE-AT ?auto_98782 ?auto_98785 ) ( CLEAR ?auto_98782 ) ( LIFTING ?auto_98784 ?auto_98783 ) ( IS-CRATE ?auto_98783 ) ( not ( = ?auto_98782 ?auto_98783 ) ) )
    :subtasks
    ( ( !DROP ?auto_98784 ?auto_98783 ?auto_98782 ?auto_98785 )
      ( MAKE-1CRATE-VERIFY ?auto_98782 ?auto_98783 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98786 - SURFACE
      ?auto_98787 - SURFACE
    )
    :vars
    (
      ?auto_98789 - HOIST
      ?auto_98788 - PLACE
      ?auto_98790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98789 ?auto_98788 ) ( SURFACE-AT ?auto_98786 ?auto_98788 ) ( CLEAR ?auto_98786 ) ( IS-CRATE ?auto_98787 ) ( not ( = ?auto_98786 ?auto_98787 ) ) ( TRUCK-AT ?auto_98790 ?auto_98788 ) ( AVAILABLE ?auto_98789 ) ( IN ?auto_98787 ?auto_98790 ) )
    :subtasks
    ( ( !UNLOAD ?auto_98789 ?auto_98787 ?auto_98790 ?auto_98788 )
      ( MAKE-1CRATE ?auto_98786 ?auto_98787 )
      ( MAKE-1CRATE-VERIFY ?auto_98786 ?auto_98787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98791 - SURFACE
      ?auto_98792 - SURFACE
    )
    :vars
    (
      ?auto_98794 - HOIST
      ?auto_98793 - PLACE
      ?auto_98795 - TRUCK
      ?auto_98796 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98794 ?auto_98793 ) ( SURFACE-AT ?auto_98791 ?auto_98793 ) ( CLEAR ?auto_98791 ) ( IS-CRATE ?auto_98792 ) ( not ( = ?auto_98791 ?auto_98792 ) ) ( AVAILABLE ?auto_98794 ) ( IN ?auto_98792 ?auto_98795 ) ( TRUCK-AT ?auto_98795 ?auto_98796 ) ( not ( = ?auto_98796 ?auto_98793 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_98795 ?auto_98796 ?auto_98793 )
      ( MAKE-1CRATE ?auto_98791 ?auto_98792 )
      ( MAKE-1CRATE-VERIFY ?auto_98791 ?auto_98792 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98797 - SURFACE
      ?auto_98798 - SURFACE
    )
    :vars
    (
      ?auto_98799 - HOIST
      ?auto_98802 - PLACE
      ?auto_98801 - TRUCK
      ?auto_98800 - PLACE
      ?auto_98803 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_98799 ?auto_98802 ) ( SURFACE-AT ?auto_98797 ?auto_98802 ) ( CLEAR ?auto_98797 ) ( IS-CRATE ?auto_98798 ) ( not ( = ?auto_98797 ?auto_98798 ) ) ( AVAILABLE ?auto_98799 ) ( TRUCK-AT ?auto_98801 ?auto_98800 ) ( not ( = ?auto_98800 ?auto_98802 ) ) ( HOIST-AT ?auto_98803 ?auto_98800 ) ( LIFTING ?auto_98803 ?auto_98798 ) ( not ( = ?auto_98799 ?auto_98803 ) ) )
    :subtasks
    ( ( !LOAD ?auto_98803 ?auto_98798 ?auto_98801 ?auto_98800 )
      ( MAKE-1CRATE ?auto_98797 ?auto_98798 )
      ( MAKE-1CRATE-VERIFY ?auto_98797 ?auto_98798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98804 - SURFACE
      ?auto_98805 - SURFACE
    )
    :vars
    (
      ?auto_98807 - HOIST
      ?auto_98808 - PLACE
      ?auto_98810 - TRUCK
      ?auto_98806 - PLACE
      ?auto_98809 - HOIST
      ?auto_98811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98807 ?auto_98808 ) ( SURFACE-AT ?auto_98804 ?auto_98808 ) ( CLEAR ?auto_98804 ) ( IS-CRATE ?auto_98805 ) ( not ( = ?auto_98804 ?auto_98805 ) ) ( AVAILABLE ?auto_98807 ) ( TRUCK-AT ?auto_98810 ?auto_98806 ) ( not ( = ?auto_98806 ?auto_98808 ) ) ( HOIST-AT ?auto_98809 ?auto_98806 ) ( not ( = ?auto_98807 ?auto_98809 ) ) ( AVAILABLE ?auto_98809 ) ( SURFACE-AT ?auto_98805 ?auto_98806 ) ( ON ?auto_98805 ?auto_98811 ) ( CLEAR ?auto_98805 ) ( not ( = ?auto_98804 ?auto_98811 ) ) ( not ( = ?auto_98805 ?auto_98811 ) ) )
    :subtasks
    ( ( !LIFT ?auto_98809 ?auto_98805 ?auto_98811 ?auto_98806 )
      ( MAKE-1CRATE ?auto_98804 ?auto_98805 )
      ( MAKE-1CRATE-VERIFY ?auto_98804 ?auto_98805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98812 - SURFACE
      ?auto_98813 - SURFACE
    )
    :vars
    (
      ?auto_98814 - HOIST
      ?auto_98817 - PLACE
      ?auto_98815 - PLACE
      ?auto_98818 - HOIST
      ?auto_98819 - SURFACE
      ?auto_98816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98814 ?auto_98817 ) ( SURFACE-AT ?auto_98812 ?auto_98817 ) ( CLEAR ?auto_98812 ) ( IS-CRATE ?auto_98813 ) ( not ( = ?auto_98812 ?auto_98813 ) ) ( AVAILABLE ?auto_98814 ) ( not ( = ?auto_98815 ?auto_98817 ) ) ( HOIST-AT ?auto_98818 ?auto_98815 ) ( not ( = ?auto_98814 ?auto_98818 ) ) ( AVAILABLE ?auto_98818 ) ( SURFACE-AT ?auto_98813 ?auto_98815 ) ( ON ?auto_98813 ?auto_98819 ) ( CLEAR ?auto_98813 ) ( not ( = ?auto_98812 ?auto_98819 ) ) ( not ( = ?auto_98813 ?auto_98819 ) ) ( TRUCK-AT ?auto_98816 ?auto_98817 ) )
    :subtasks
    ( ( !DRIVE ?auto_98816 ?auto_98817 ?auto_98815 )
      ( MAKE-1CRATE ?auto_98812 ?auto_98813 )
      ( MAKE-1CRATE-VERIFY ?auto_98812 ?auto_98813 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_98829 - SURFACE
      ?auto_98830 - SURFACE
      ?auto_98831 - SURFACE
    )
    :vars
    (
      ?auto_98832 - HOIST
      ?auto_98833 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98832 ?auto_98833 ) ( SURFACE-AT ?auto_98830 ?auto_98833 ) ( CLEAR ?auto_98830 ) ( LIFTING ?auto_98832 ?auto_98831 ) ( IS-CRATE ?auto_98831 ) ( not ( = ?auto_98830 ?auto_98831 ) ) ( ON ?auto_98830 ?auto_98829 ) ( not ( = ?auto_98829 ?auto_98830 ) ) ( not ( = ?auto_98829 ?auto_98831 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_98830 ?auto_98831 )
      ( MAKE-2CRATE-VERIFY ?auto_98829 ?auto_98830 ?auto_98831 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_98839 - SURFACE
      ?auto_98840 - SURFACE
      ?auto_98841 - SURFACE
    )
    :vars
    (
      ?auto_98843 - HOIST
      ?auto_98844 - PLACE
      ?auto_98842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98843 ?auto_98844 ) ( SURFACE-AT ?auto_98840 ?auto_98844 ) ( CLEAR ?auto_98840 ) ( IS-CRATE ?auto_98841 ) ( not ( = ?auto_98840 ?auto_98841 ) ) ( TRUCK-AT ?auto_98842 ?auto_98844 ) ( AVAILABLE ?auto_98843 ) ( IN ?auto_98841 ?auto_98842 ) ( ON ?auto_98840 ?auto_98839 ) ( not ( = ?auto_98839 ?auto_98840 ) ) ( not ( = ?auto_98839 ?auto_98841 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_98840 ?auto_98841 )
      ( MAKE-2CRATE-VERIFY ?auto_98839 ?auto_98840 ?auto_98841 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98845 - SURFACE
      ?auto_98846 - SURFACE
    )
    :vars
    (
      ?auto_98847 - HOIST
      ?auto_98850 - PLACE
      ?auto_98848 - TRUCK
      ?auto_98849 - SURFACE
      ?auto_98851 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98847 ?auto_98850 ) ( SURFACE-AT ?auto_98845 ?auto_98850 ) ( CLEAR ?auto_98845 ) ( IS-CRATE ?auto_98846 ) ( not ( = ?auto_98845 ?auto_98846 ) ) ( AVAILABLE ?auto_98847 ) ( IN ?auto_98846 ?auto_98848 ) ( ON ?auto_98845 ?auto_98849 ) ( not ( = ?auto_98849 ?auto_98845 ) ) ( not ( = ?auto_98849 ?auto_98846 ) ) ( TRUCK-AT ?auto_98848 ?auto_98851 ) ( not ( = ?auto_98851 ?auto_98850 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_98848 ?auto_98851 ?auto_98850 )
      ( MAKE-2CRATE ?auto_98849 ?auto_98845 ?auto_98846 )
      ( MAKE-1CRATE-VERIFY ?auto_98845 ?auto_98846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_98852 - SURFACE
      ?auto_98853 - SURFACE
      ?auto_98854 - SURFACE
    )
    :vars
    (
      ?auto_98858 - HOIST
      ?auto_98857 - PLACE
      ?auto_98855 - TRUCK
      ?auto_98856 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98858 ?auto_98857 ) ( SURFACE-AT ?auto_98853 ?auto_98857 ) ( CLEAR ?auto_98853 ) ( IS-CRATE ?auto_98854 ) ( not ( = ?auto_98853 ?auto_98854 ) ) ( AVAILABLE ?auto_98858 ) ( IN ?auto_98854 ?auto_98855 ) ( ON ?auto_98853 ?auto_98852 ) ( not ( = ?auto_98852 ?auto_98853 ) ) ( not ( = ?auto_98852 ?auto_98854 ) ) ( TRUCK-AT ?auto_98855 ?auto_98856 ) ( not ( = ?auto_98856 ?auto_98857 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_98853 ?auto_98854 )
      ( MAKE-2CRATE-VERIFY ?auto_98852 ?auto_98853 ?auto_98854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98859 - SURFACE
      ?auto_98860 - SURFACE
    )
    :vars
    (
      ?auto_98862 - HOIST
      ?auto_98861 - PLACE
      ?auto_98864 - SURFACE
      ?auto_98863 - TRUCK
      ?auto_98865 - PLACE
      ?auto_98866 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_98862 ?auto_98861 ) ( SURFACE-AT ?auto_98859 ?auto_98861 ) ( CLEAR ?auto_98859 ) ( IS-CRATE ?auto_98860 ) ( not ( = ?auto_98859 ?auto_98860 ) ) ( AVAILABLE ?auto_98862 ) ( ON ?auto_98859 ?auto_98864 ) ( not ( = ?auto_98864 ?auto_98859 ) ) ( not ( = ?auto_98864 ?auto_98860 ) ) ( TRUCK-AT ?auto_98863 ?auto_98865 ) ( not ( = ?auto_98865 ?auto_98861 ) ) ( HOIST-AT ?auto_98866 ?auto_98865 ) ( LIFTING ?auto_98866 ?auto_98860 ) ( not ( = ?auto_98862 ?auto_98866 ) ) )
    :subtasks
    ( ( !LOAD ?auto_98866 ?auto_98860 ?auto_98863 ?auto_98865 )
      ( MAKE-2CRATE ?auto_98864 ?auto_98859 ?auto_98860 )
      ( MAKE-1CRATE-VERIFY ?auto_98859 ?auto_98860 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_98867 - SURFACE
      ?auto_98868 - SURFACE
      ?auto_98869 - SURFACE
    )
    :vars
    (
      ?auto_98872 - HOIST
      ?auto_98873 - PLACE
      ?auto_98874 - TRUCK
      ?auto_98871 - PLACE
      ?auto_98870 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_98872 ?auto_98873 ) ( SURFACE-AT ?auto_98868 ?auto_98873 ) ( CLEAR ?auto_98868 ) ( IS-CRATE ?auto_98869 ) ( not ( = ?auto_98868 ?auto_98869 ) ) ( AVAILABLE ?auto_98872 ) ( ON ?auto_98868 ?auto_98867 ) ( not ( = ?auto_98867 ?auto_98868 ) ) ( not ( = ?auto_98867 ?auto_98869 ) ) ( TRUCK-AT ?auto_98874 ?auto_98871 ) ( not ( = ?auto_98871 ?auto_98873 ) ) ( HOIST-AT ?auto_98870 ?auto_98871 ) ( LIFTING ?auto_98870 ?auto_98869 ) ( not ( = ?auto_98872 ?auto_98870 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_98868 ?auto_98869 )
      ( MAKE-2CRATE-VERIFY ?auto_98867 ?auto_98868 ?auto_98869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98875 - SURFACE
      ?auto_98876 - SURFACE
    )
    :vars
    (
      ?auto_98878 - HOIST
      ?auto_98882 - PLACE
      ?auto_98877 - SURFACE
      ?auto_98881 - TRUCK
      ?auto_98880 - PLACE
      ?auto_98879 - HOIST
      ?auto_98883 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98878 ?auto_98882 ) ( SURFACE-AT ?auto_98875 ?auto_98882 ) ( CLEAR ?auto_98875 ) ( IS-CRATE ?auto_98876 ) ( not ( = ?auto_98875 ?auto_98876 ) ) ( AVAILABLE ?auto_98878 ) ( ON ?auto_98875 ?auto_98877 ) ( not ( = ?auto_98877 ?auto_98875 ) ) ( not ( = ?auto_98877 ?auto_98876 ) ) ( TRUCK-AT ?auto_98881 ?auto_98880 ) ( not ( = ?auto_98880 ?auto_98882 ) ) ( HOIST-AT ?auto_98879 ?auto_98880 ) ( not ( = ?auto_98878 ?auto_98879 ) ) ( AVAILABLE ?auto_98879 ) ( SURFACE-AT ?auto_98876 ?auto_98880 ) ( ON ?auto_98876 ?auto_98883 ) ( CLEAR ?auto_98876 ) ( not ( = ?auto_98875 ?auto_98883 ) ) ( not ( = ?auto_98876 ?auto_98883 ) ) ( not ( = ?auto_98877 ?auto_98883 ) ) )
    :subtasks
    ( ( !LIFT ?auto_98879 ?auto_98876 ?auto_98883 ?auto_98880 )
      ( MAKE-2CRATE ?auto_98877 ?auto_98875 ?auto_98876 )
      ( MAKE-1CRATE-VERIFY ?auto_98875 ?auto_98876 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_98884 - SURFACE
      ?auto_98885 - SURFACE
      ?auto_98886 - SURFACE
    )
    :vars
    (
      ?auto_98891 - HOIST
      ?auto_98888 - PLACE
      ?auto_98892 - TRUCK
      ?auto_98887 - PLACE
      ?auto_98890 - HOIST
      ?auto_98889 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98891 ?auto_98888 ) ( SURFACE-AT ?auto_98885 ?auto_98888 ) ( CLEAR ?auto_98885 ) ( IS-CRATE ?auto_98886 ) ( not ( = ?auto_98885 ?auto_98886 ) ) ( AVAILABLE ?auto_98891 ) ( ON ?auto_98885 ?auto_98884 ) ( not ( = ?auto_98884 ?auto_98885 ) ) ( not ( = ?auto_98884 ?auto_98886 ) ) ( TRUCK-AT ?auto_98892 ?auto_98887 ) ( not ( = ?auto_98887 ?auto_98888 ) ) ( HOIST-AT ?auto_98890 ?auto_98887 ) ( not ( = ?auto_98891 ?auto_98890 ) ) ( AVAILABLE ?auto_98890 ) ( SURFACE-AT ?auto_98886 ?auto_98887 ) ( ON ?auto_98886 ?auto_98889 ) ( CLEAR ?auto_98886 ) ( not ( = ?auto_98885 ?auto_98889 ) ) ( not ( = ?auto_98886 ?auto_98889 ) ) ( not ( = ?auto_98884 ?auto_98889 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_98885 ?auto_98886 )
      ( MAKE-2CRATE-VERIFY ?auto_98884 ?auto_98885 ?auto_98886 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98893 - SURFACE
      ?auto_98894 - SURFACE
    )
    :vars
    (
      ?auto_98897 - HOIST
      ?auto_98898 - PLACE
      ?auto_98896 - SURFACE
      ?auto_98900 - PLACE
      ?auto_98901 - HOIST
      ?auto_98895 - SURFACE
      ?auto_98899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98897 ?auto_98898 ) ( SURFACE-AT ?auto_98893 ?auto_98898 ) ( CLEAR ?auto_98893 ) ( IS-CRATE ?auto_98894 ) ( not ( = ?auto_98893 ?auto_98894 ) ) ( AVAILABLE ?auto_98897 ) ( ON ?auto_98893 ?auto_98896 ) ( not ( = ?auto_98896 ?auto_98893 ) ) ( not ( = ?auto_98896 ?auto_98894 ) ) ( not ( = ?auto_98900 ?auto_98898 ) ) ( HOIST-AT ?auto_98901 ?auto_98900 ) ( not ( = ?auto_98897 ?auto_98901 ) ) ( AVAILABLE ?auto_98901 ) ( SURFACE-AT ?auto_98894 ?auto_98900 ) ( ON ?auto_98894 ?auto_98895 ) ( CLEAR ?auto_98894 ) ( not ( = ?auto_98893 ?auto_98895 ) ) ( not ( = ?auto_98894 ?auto_98895 ) ) ( not ( = ?auto_98896 ?auto_98895 ) ) ( TRUCK-AT ?auto_98899 ?auto_98898 ) )
    :subtasks
    ( ( !DRIVE ?auto_98899 ?auto_98898 ?auto_98900 )
      ( MAKE-2CRATE ?auto_98896 ?auto_98893 ?auto_98894 )
      ( MAKE-1CRATE-VERIFY ?auto_98893 ?auto_98894 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_98902 - SURFACE
      ?auto_98903 - SURFACE
      ?auto_98904 - SURFACE
    )
    :vars
    (
      ?auto_98909 - HOIST
      ?auto_98905 - PLACE
      ?auto_98910 - PLACE
      ?auto_98906 - HOIST
      ?auto_98907 - SURFACE
      ?auto_98908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98909 ?auto_98905 ) ( SURFACE-AT ?auto_98903 ?auto_98905 ) ( CLEAR ?auto_98903 ) ( IS-CRATE ?auto_98904 ) ( not ( = ?auto_98903 ?auto_98904 ) ) ( AVAILABLE ?auto_98909 ) ( ON ?auto_98903 ?auto_98902 ) ( not ( = ?auto_98902 ?auto_98903 ) ) ( not ( = ?auto_98902 ?auto_98904 ) ) ( not ( = ?auto_98910 ?auto_98905 ) ) ( HOIST-AT ?auto_98906 ?auto_98910 ) ( not ( = ?auto_98909 ?auto_98906 ) ) ( AVAILABLE ?auto_98906 ) ( SURFACE-AT ?auto_98904 ?auto_98910 ) ( ON ?auto_98904 ?auto_98907 ) ( CLEAR ?auto_98904 ) ( not ( = ?auto_98903 ?auto_98907 ) ) ( not ( = ?auto_98904 ?auto_98907 ) ) ( not ( = ?auto_98902 ?auto_98907 ) ) ( TRUCK-AT ?auto_98908 ?auto_98905 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_98903 ?auto_98904 )
      ( MAKE-2CRATE-VERIFY ?auto_98902 ?auto_98903 ?auto_98904 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98911 - SURFACE
      ?auto_98912 - SURFACE
    )
    :vars
    (
      ?auto_98915 - HOIST
      ?auto_98918 - PLACE
      ?auto_98916 - SURFACE
      ?auto_98913 - PLACE
      ?auto_98917 - HOIST
      ?auto_98919 - SURFACE
      ?auto_98914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98915 ?auto_98918 ) ( IS-CRATE ?auto_98912 ) ( not ( = ?auto_98911 ?auto_98912 ) ) ( not ( = ?auto_98916 ?auto_98911 ) ) ( not ( = ?auto_98916 ?auto_98912 ) ) ( not ( = ?auto_98913 ?auto_98918 ) ) ( HOIST-AT ?auto_98917 ?auto_98913 ) ( not ( = ?auto_98915 ?auto_98917 ) ) ( AVAILABLE ?auto_98917 ) ( SURFACE-AT ?auto_98912 ?auto_98913 ) ( ON ?auto_98912 ?auto_98919 ) ( CLEAR ?auto_98912 ) ( not ( = ?auto_98911 ?auto_98919 ) ) ( not ( = ?auto_98912 ?auto_98919 ) ) ( not ( = ?auto_98916 ?auto_98919 ) ) ( TRUCK-AT ?auto_98914 ?auto_98918 ) ( SURFACE-AT ?auto_98916 ?auto_98918 ) ( CLEAR ?auto_98916 ) ( LIFTING ?auto_98915 ?auto_98911 ) ( IS-CRATE ?auto_98911 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_98916 ?auto_98911 )
      ( MAKE-2CRATE ?auto_98916 ?auto_98911 ?auto_98912 )
      ( MAKE-1CRATE-VERIFY ?auto_98911 ?auto_98912 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_98920 - SURFACE
      ?auto_98921 - SURFACE
      ?auto_98922 - SURFACE
    )
    :vars
    (
      ?auto_98928 - HOIST
      ?auto_98923 - PLACE
      ?auto_98927 - PLACE
      ?auto_98925 - HOIST
      ?auto_98926 - SURFACE
      ?auto_98924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98928 ?auto_98923 ) ( IS-CRATE ?auto_98922 ) ( not ( = ?auto_98921 ?auto_98922 ) ) ( not ( = ?auto_98920 ?auto_98921 ) ) ( not ( = ?auto_98920 ?auto_98922 ) ) ( not ( = ?auto_98927 ?auto_98923 ) ) ( HOIST-AT ?auto_98925 ?auto_98927 ) ( not ( = ?auto_98928 ?auto_98925 ) ) ( AVAILABLE ?auto_98925 ) ( SURFACE-AT ?auto_98922 ?auto_98927 ) ( ON ?auto_98922 ?auto_98926 ) ( CLEAR ?auto_98922 ) ( not ( = ?auto_98921 ?auto_98926 ) ) ( not ( = ?auto_98922 ?auto_98926 ) ) ( not ( = ?auto_98920 ?auto_98926 ) ) ( TRUCK-AT ?auto_98924 ?auto_98923 ) ( SURFACE-AT ?auto_98920 ?auto_98923 ) ( CLEAR ?auto_98920 ) ( LIFTING ?auto_98928 ?auto_98921 ) ( IS-CRATE ?auto_98921 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_98921 ?auto_98922 )
      ( MAKE-2CRATE-VERIFY ?auto_98920 ?auto_98921 ?auto_98922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98929 - SURFACE
      ?auto_98930 - SURFACE
    )
    :vars
    (
      ?auto_98936 - HOIST
      ?auto_98935 - PLACE
      ?auto_98931 - SURFACE
      ?auto_98932 - PLACE
      ?auto_98934 - HOIST
      ?auto_98933 - SURFACE
      ?auto_98937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98936 ?auto_98935 ) ( IS-CRATE ?auto_98930 ) ( not ( = ?auto_98929 ?auto_98930 ) ) ( not ( = ?auto_98931 ?auto_98929 ) ) ( not ( = ?auto_98931 ?auto_98930 ) ) ( not ( = ?auto_98932 ?auto_98935 ) ) ( HOIST-AT ?auto_98934 ?auto_98932 ) ( not ( = ?auto_98936 ?auto_98934 ) ) ( AVAILABLE ?auto_98934 ) ( SURFACE-AT ?auto_98930 ?auto_98932 ) ( ON ?auto_98930 ?auto_98933 ) ( CLEAR ?auto_98930 ) ( not ( = ?auto_98929 ?auto_98933 ) ) ( not ( = ?auto_98930 ?auto_98933 ) ) ( not ( = ?auto_98931 ?auto_98933 ) ) ( TRUCK-AT ?auto_98937 ?auto_98935 ) ( SURFACE-AT ?auto_98931 ?auto_98935 ) ( CLEAR ?auto_98931 ) ( IS-CRATE ?auto_98929 ) ( AVAILABLE ?auto_98936 ) ( IN ?auto_98929 ?auto_98937 ) )
    :subtasks
    ( ( !UNLOAD ?auto_98936 ?auto_98929 ?auto_98937 ?auto_98935 )
      ( MAKE-2CRATE ?auto_98931 ?auto_98929 ?auto_98930 )
      ( MAKE-1CRATE-VERIFY ?auto_98929 ?auto_98930 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_98938 - SURFACE
      ?auto_98939 - SURFACE
      ?auto_98940 - SURFACE
    )
    :vars
    (
      ?auto_98941 - HOIST
      ?auto_98943 - PLACE
      ?auto_98945 - PLACE
      ?auto_98946 - HOIST
      ?auto_98942 - SURFACE
      ?auto_98944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98941 ?auto_98943 ) ( IS-CRATE ?auto_98940 ) ( not ( = ?auto_98939 ?auto_98940 ) ) ( not ( = ?auto_98938 ?auto_98939 ) ) ( not ( = ?auto_98938 ?auto_98940 ) ) ( not ( = ?auto_98945 ?auto_98943 ) ) ( HOIST-AT ?auto_98946 ?auto_98945 ) ( not ( = ?auto_98941 ?auto_98946 ) ) ( AVAILABLE ?auto_98946 ) ( SURFACE-AT ?auto_98940 ?auto_98945 ) ( ON ?auto_98940 ?auto_98942 ) ( CLEAR ?auto_98940 ) ( not ( = ?auto_98939 ?auto_98942 ) ) ( not ( = ?auto_98940 ?auto_98942 ) ) ( not ( = ?auto_98938 ?auto_98942 ) ) ( TRUCK-AT ?auto_98944 ?auto_98943 ) ( SURFACE-AT ?auto_98938 ?auto_98943 ) ( CLEAR ?auto_98938 ) ( IS-CRATE ?auto_98939 ) ( AVAILABLE ?auto_98941 ) ( IN ?auto_98939 ?auto_98944 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_98939 ?auto_98940 )
      ( MAKE-2CRATE-VERIFY ?auto_98938 ?auto_98939 ?auto_98940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98983 - SURFACE
      ?auto_98984 - SURFACE
    )
    :vars
    (
      ?auto_98990 - HOIST
      ?auto_98985 - PLACE
      ?auto_98986 - SURFACE
      ?auto_98991 - PLACE
      ?auto_98988 - HOIST
      ?auto_98989 - SURFACE
      ?auto_98987 - TRUCK
      ?auto_98992 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98990 ?auto_98985 ) ( SURFACE-AT ?auto_98983 ?auto_98985 ) ( CLEAR ?auto_98983 ) ( IS-CRATE ?auto_98984 ) ( not ( = ?auto_98983 ?auto_98984 ) ) ( AVAILABLE ?auto_98990 ) ( ON ?auto_98983 ?auto_98986 ) ( not ( = ?auto_98986 ?auto_98983 ) ) ( not ( = ?auto_98986 ?auto_98984 ) ) ( not ( = ?auto_98991 ?auto_98985 ) ) ( HOIST-AT ?auto_98988 ?auto_98991 ) ( not ( = ?auto_98990 ?auto_98988 ) ) ( AVAILABLE ?auto_98988 ) ( SURFACE-AT ?auto_98984 ?auto_98991 ) ( ON ?auto_98984 ?auto_98989 ) ( CLEAR ?auto_98984 ) ( not ( = ?auto_98983 ?auto_98989 ) ) ( not ( = ?auto_98984 ?auto_98989 ) ) ( not ( = ?auto_98986 ?auto_98989 ) ) ( TRUCK-AT ?auto_98987 ?auto_98992 ) ( not ( = ?auto_98992 ?auto_98985 ) ) ( not ( = ?auto_98991 ?auto_98992 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_98987 ?auto_98992 ?auto_98985 )
      ( MAKE-1CRATE ?auto_98983 ?auto_98984 )
      ( MAKE-1CRATE-VERIFY ?auto_98983 ?auto_98984 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99022 - SURFACE
      ?auto_99023 - SURFACE
      ?auto_99024 - SURFACE
      ?auto_99025 - SURFACE
    )
    :vars
    (
      ?auto_99027 - HOIST
      ?auto_99026 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99027 ?auto_99026 ) ( SURFACE-AT ?auto_99024 ?auto_99026 ) ( CLEAR ?auto_99024 ) ( LIFTING ?auto_99027 ?auto_99025 ) ( IS-CRATE ?auto_99025 ) ( not ( = ?auto_99024 ?auto_99025 ) ) ( ON ?auto_99023 ?auto_99022 ) ( ON ?auto_99024 ?auto_99023 ) ( not ( = ?auto_99022 ?auto_99023 ) ) ( not ( = ?auto_99022 ?auto_99024 ) ) ( not ( = ?auto_99022 ?auto_99025 ) ) ( not ( = ?auto_99023 ?auto_99024 ) ) ( not ( = ?auto_99023 ?auto_99025 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99024 ?auto_99025 )
      ( MAKE-3CRATE-VERIFY ?auto_99022 ?auto_99023 ?auto_99024 ?auto_99025 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99039 - SURFACE
      ?auto_99040 - SURFACE
      ?auto_99041 - SURFACE
      ?auto_99042 - SURFACE
    )
    :vars
    (
      ?auto_99043 - HOIST
      ?auto_99044 - PLACE
      ?auto_99045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99043 ?auto_99044 ) ( SURFACE-AT ?auto_99041 ?auto_99044 ) ( CLEAR ?auto_99041 ) ( IS-CRATE ?auto_99042 ) ( not ( = ?auto_99041 ?auto_99042 ) ) ( TRUCK-AT ?auto_99045 ?auto_99044 ) ( AVAILABLE ?auto_99043 ) ( IN ?auto_99042 ?auto_99045 ) ( ON ?auto_99041 ?auto_99040 ) ( not ( = ?auto_99040 ?auto_99041 ) ) ( not ( = ?auto_99040 ?auto_99042 ) ) ( ON ?auto_99040 ?auto_99039 ) ( not ( = ?auto_99039 ?auto_99040 ) ) ( not ( = ?auto_99039 ?auto_99041 ) ) ( not ( = ?auto_99039 ?auto_99042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99040 ?auto_99041 ?auto_99042 )
      ( MAKE-3CRATE-VERIFY ?auto_99039 ?auto_99040 ?auto_99041 ?auto_99042 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99060 - SURFACE
      ?auto_99061 - SURFACE
      ?auto_99062 - SURFACE
      ?auto_99063 - SURFACE
    )
    :vars
    (
      ?auto_99067 - HOIST
      ?auto_99064 - PLACE
      ?auto_99065 - TRUCK
      ?auto_99066 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99067 ?auto_99064 ) ( SURFACE-AT ?auto_99062 ?auto_99064 ) ( CLEAR ?auto_99062 ) ( IS-CRATE ?auto_99063 ) ( not ( = ?auto_99062 ?auto_99063 ) ) ( AVAILABLE ?auto_99067 ) ( IN ?auto_99063 ?auto_99065 ) ( ON ?auto_99062 ?auto_99061 ) ( not ( = ?auto_99061 ?auto_99062 ) ) ( not ( = ?auto_99061 ?auto_99063 ) ) ( TRUCK-AT ?auto_99065 ?auto_99066 ) ( not ( = ?auto_99066 ?auto_99064 ) ) ( ON ?auto_99061 ?auto_99060 ) ( not ( = ?auto_99060 ?auto_99061 ) ) ( not ( = ?auto_99060 ?auto_99062 ) ) ( not ( = ?auto_99060 ?auto_99063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99061 ?auto_99062 ?auto_99063 )
      ( MAKE-3CRATE-VERIFY ?auto_99060 ?auto_99061 ?auto_99062 ?auto_99063 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99084 - SURFACE
      ?auto_99085 - SURFACE
      ?auto_99086 - SURFACE
      ?auto_99087 - SURFACE
    )
    :vars
    (
      ?auto_99090 - HOIST
      ?auto_99092 - PLACE
      ?auto_99089 - TRUCK
      ?auto_99091 - PLACE
      ?auto_99088 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_99090 ?auto_99092 ) ( SURFACE-AT ?auto_99086 ?auto_99092 ) ( CLEAR ?auto_99086 ) ( IS-CRATE ?auto_99087 ) ( not ( = ?auto_99086 ?auto_99087 ) ) ( AVAILABLE ?auto_99090 ) ( ON ?auto_99086 ?auto_99085 ) ( not ( = ?auto_99085 ?auto_99086 ) ) ( not ( = ?auto_99085 ?auto_99087 ) ) ( TRUCK-AT ?auto_99089 ?auto_99091 ) ( not ( = ?auto_99091 ?auto_99092 ) ) ( HOIST-AT ?auto_99088 ?auto_99091 ) ( LIFTING ?auto_99088 ?auto_99087 ) ( not ( = ?auto_99090 ?auto_99088 ) ) ( ON ?auto_99085 ?auto_99084 ) ( not ( = ?auto_99084 ?auto_99085 ) ) ( not ( = ?auto_99084 ?auto_99086 ) ) ( not ( = ?auto_99084 ?auto_99087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99085 ?auto_99086 ?auto_99087 )
      ( MAKE-3CRATE-VERIFY ?auto_99084 ?auto_99085 ?auto_99086 ?auto_99087 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99111 - SURFACE
      ?auto_99112 - SURFACE
      ?auto_99113 - SURFACE
      ?auto_99114 - SURFACE
    )
    :vars
    (
      ?auto_99115 - HOIST
      ?auto_99118 - PLACE
      ?auto_99119 - TRUCK
      ?auto_99116 - PLACE
      ?auto_99120 - HOIST
      ?auto_99117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99115 ?auto_99118 ) ( SURFACE-AT ?auto_99113 ?auto_99118 ) ( CLEAR ?auto_99113 ) ( IS-CRATE ?auto_99114 ) ( not ( = ?auto_99113 ?auto_99114 ) ) ( AVAILABLE ?auto_99115 ) ( ON ?auto_99113 ?auto_99112 ) ( not ( = ?auto_99112 ?auto_99113 ) ) ( not ( = ?auto_99112 ?auto_99114 ) ) ( TRUCK-AT ?auto_99119 ?auto_99116 ) ( not ( = ?auto_99116 ?auto_99118 ) ) ( HOIST-AT ?auto_99120 ?auto_99116 ) ( not ( = ?auto_99115 ?auto_99120 ) ) ( AVAILABLE ?auto_99120 ) ( SURFACE-AT ?auto_99114 ?auto_99116 ) ( ON ?auto_99114 ?auto_99117 ) ( CLEAR ?auto_99114 ) ( not ( = ?auto_99113 ?auto_99117 ) ) ( not ( = ?auto_99114 ?auto_99117 ) ) ( not ( = ?auto_99112 ?auto_99117 ) ) ( ON ?auto_99112 ?auto_99111 ) ( not ( = ?auto_99111 ?auto_99112 ) ) ( not ( = ?auto_99111 ?auto_99113 ) ) ( not ( = ?auto_99111 ?auto_99114 ) ) ( not ( = ?auto_99111 ?auto_99117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99112 ?auto_99113 ?auto_99114 )
      ( MAKE-3CRATE-VERIFY ?auto_99111 ?auto_99112 ?auto_99113 ?auto_99114 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99139 - SURFACE
      ?auto_99140 - SURFACE
      ?auto_99141 - SURFACE
      ?auto_99142 - SURFACE
    )
    :vars
    (
      ?auto_99143 - HOIST
      ?auto_99147 - PLACE
      ?auto_99145 - PLACE
      ?auto_99148 - HOIST
      ?auto_99146 - SURFACE
      ?auto_99144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99143 ?auto_99147 ) ( SURFACE-AT ?auto_99141 ?auto_99147 ) ( CLEAR ?auto_99141 ) ( IS-CRATE ?auto_99142 ) ( not ( = ?auto_99141 ?auto_99142 ) ) ( AVAILABLE ?auto_99143 ) ( ON ?auto_99141 ?auto_99140 ) ( not ( = ?auto_99140 ?auto_99141 ) ) ( not ( = ?auto_99140 ?auto_99142 ) ) ( not ( = ?auto_99145 ?auto_99147 ) ) ( HOIST-AT ?auto_99148 ?auto_99145 ) ( not ( = ?auto_99143 ?auto_99148 ) ) ( AVAILABLE ?auto_99148 ) ( SURFACE-AT ?auto_99142 ?auto_99145 ) ( ON ?auto_99142 ?auto_99146 ) ( CLEAR ?auto_99142 ) ( not ( = ?auto_99141 ?auto_99146 ) ) ( not ( = ?auto_99142 ?auto_99146 ) ) ( not ( = ?auto_99140 ?auto_99146 ) ) ( TRUCK-AT ?auto_99144 ?auto_99147 ) ( ON ?auto_99140 ?auto_99139 ) ( not ( = ?auto_99139 ?auto_99140 ) ) ( not ( = ?auto_99139 ?auto_99141 ) ) ( not ( = ?auto_99139 ?auto_99142 ) ) ( not ( = ?auto_99139 ?auto_99146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99140 ?auto_99141 ?auto_99142 )
      ( MAKE-3CRATE-VERIFY ?auto_99139 ?auto_99140 ?auto_99141 ?auto_99142 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99167 - SURFACE
      ?auto_99168 - SURFACE
      ?auto_99169 - SURFACE
      ?auto_99170 - SURFACE
    )
    :vars
    (
      ?auto_99176 - HOIST
      ?auto_99172 - PLACE
      ?auto_99171 - PLACE
      ?auto_99174 - HOIST
      ?auto_99175 - SURFACE
      ?auto_99173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99176 ?auto_99172 ) ( IS-CRATE ?auto_99170 ) ( not ( = ?auto_99169 ?auto_99170 ) ) ( not ( = ?auto_99168 ?auto_99169 ) ) ( not ( = ?auto_99168 ?auto_99170 ) ) ( not ( = ?auto_99171 ?auto_99172 ) ) ( HOIST-AT ?auto_99174 ?auto_99171 ) ( not ( = ?auto_99176 ?auto_99174 ) ) ( AVAILABLE ?auto_99174 ) ( SURFACE-AT ?auto_99170 ?auto_99171 ) ( ON ?auto_99170 ?auto_99175 ) ( CLEAR ?auto_99170 ) ( not ( = ?auto_99169 ?auto_99175 ) ) ( not ( = ?auto_99170 ?auto_99175 ) ) ( not ( = ?auto_99168 ?auto_99175 ) ) ( TRUCK-AT ?auto_99173 ?auto_99172 ) ( SURFACE-AT ?auto_99168 ?auto_99172 ) ( CLEAR ?auto_99168 ) ( LIFTING ?auto_99176 ?auto_99169 ) ( IS-CRATE ?auto_99169 ) ( ON ?auto_99168 ?auto_99167 ) ( not ( = ?auto_99167 ?auto_99168 ) ) ( not ( = ?auto_99167 ?auto_99169 ) ) ( not ( = ?auto_99167 ?auto_99170 ) ) ( not ( = ?auto_99167 ?auto_99175 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99168 ?auto_99169 ?auto_99170 )
      ( MAKE-3CRATE-VERIFY ?auto_99167 ?auto_99168 ?auto_99169 ?auto_99170 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99195 - SURFACE
      ?auto_99196 - SURFACE
      ?auto_99197 - SURFACE
      ?auto_99198 - SURFACE
    )
    :vars
    (
      ?auto_99202 - HOIST
      ?auto_99200 - PLACE
      ?auto_99201 - PLACE
      ?auto_99199 - HOIST
      ?auto_99203 - SURFACE
      ?auto_99204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99202 ?auto_99200 ) ( IS-CRATE ?auto_99198 ) ( not ( = ?auto_99197 ?auto_99198 ) ) ( not ( = ?auto_99196 ?auto_99197 ) ) ( not ( = ?auto_99196 ?auto_99198 ) ) ( not ( = ?auto_99201 ?auto_99200 ) ) ( HOIST-AT ?auto_99199 ?auto_99201 ) ( not ( = ?auto_99202 ?auto_99199 ) ) ( AVAILABLE ?auto_99199 ) ( SURFACE-AT ?auto_99198 ?auto_99201 ) ( ON ?auto_99198 ?auto_99203 ) ( CLEAR ?auto_99198 ) ( not ( = ?auto_99197 ?auto_99203 ) ) ( not ( = ?auto_99198 ?auto_99203 ) ) ( not ( = ?auto_99196 ?auto_99203 ) ) ( TRUCK-AT ?auto_99204 ?auto_99200 ) ( SURFACE-AT ?auto_99196 ?auto_99200 ) ( CLEAR ?auto_99196 ) ( IS-CRATE ?auto_99197 ) ( AVAILABLE ?auto_99202 ) ( IN ?auto_99197 ?auto_99204 ) ( ON ?auto_99196 ?auto_99195 ) ( not ( = ?auto_99195 ?auto_99196 ) ) ( not ( = ?auto_99195 ?auto_99197 ) ) ( not ( = ?auto_99195 ?auto_99198 ) ) ( not ( = ?auto_99195 ?auto_99203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99196 ?auto_99197 ?auto_99198 )
      ( MAKE-3CRATE-VERIFY ?auto_99195 ?auto_99196 ?auto_99197 ?auto_99198 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99486 - SURFACE
      ?auto_99487 - SURFACE
      ?auto_99488 - SURFACE
      ?auto_99490 - SURFACE
      ?auto_99489 - SURFACE
    )
    :vars
    (
      ?auto_99492 - HOIST
      ?auto_99491 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99492 ?auto_99491 ) ( SURFACE-AT ?auto_99490 ?auto_99491 ) ( CLEAR ?auto_99490 ) ( LIFTING ?auto_99492 ?auto_99489 ) ( IS-CRATE ?auto_99489 ) ( not ( = ?auto_99490 ?auto_99489 ) ) ( ON ?auto_99487 ?auto_99486 ) ( ON ?auto_99488 ?auto_99487 ) ( ON ?auto_99490 ?auto_99488 ) ( not ( = ?auto_99486 ?auto_99487 ) ) ( not ( = ?auto_99486 ?auto_99488 ) ) ( not ( = ?auto_99486 ?auto_99490 ) ) ( not ( = ?auto_99486 ?auto_99489 ) ) ( not ( = ?auto_99487 ?auto_99488 ) ) ( not ( = ?auto_99487 ?auto_99490 ) ) ( not ( = ?auto_99487 ?auto_99489 ) ) ( not ( = ?auto_99488 ?auto_99490 ) ) ( not ( = ?auto_99488 ?auto_99489 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99490 ?auto_99489 )
      ( MAKE-4CRATE-VERIFY ?auto_99486 ?auto_99487 ?auto_99488 ?auto_99490 ?auto_99489 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99511 - SURFACE
      ?auto_99512 - SURFACE
      ?auto_99513 - SURFACE
      ?auto_99515 - SURFACE
      ?auto_99514 - SURFACE
    )
    :vars
    (
      ?auto_99516 - HOIST
      ?auto_99517 - PLACE
      ?auto_99518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99516 ?auto_99517 ) ( SURFACE-AT ?auto_99515 ?auto_99517 ) ( CLEAR ?auto_99515 ) ( IS-CRATE ?auto_99514 ) ( not ( = ?auto_99515 ?auto_99514 ) ) ( TRUCK-AT ?auto_99518 ?auto_99517 ) ( AVAILABLE ?auto_99516 ) ( IN ?auto_99514 ?auto_99518 ) ( ON ?auto_99515 ?auto_99513 ) ( not ( = ?auto_99513 ?auto_99515 ) ) ( not ( = ?auto_99513 ?auto_99514 ) ) ( ON ?auto_99512 ?auto_99511 ) ( ON ?auto_99513 ?auto_99512 ) ( not ( = ?auto_99511 ?auto_99512 ) ) ( not ( = ?auto_99511 ?auto_99513 ) ) ( not ( = ?auto_99511 ?auto_99515 ) ) ( not ( = ?auto_99511 ?auto_99514 ) ) ( not ( = ?auto_99512 ?auto_99513 ) ) ( not ( = ?auto_99512 ?auto_99515 ) ) ( not ( = ?auto_99512 ?auto_99514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99513 ?auto_99515 ?auto_99514 )
      ( MAKE-4CRATE-VERIFY ?auto_99511 ?auto_99512 ?auto_99513 ?auto_99515 ?auto_99514 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99541 - SURFACE
      ?auto_99542 - SURFACE
      ?auto_99543 - SURFACE
      ?auto_99545 - SURFACE
      ?auto_99544 - SURFACE
    )
    :vars
    (
      ?auto_99549 - HOIST
      ?auto_99547 - PLACE
      ?auto_99548 - TRUCK
      ?auto_99546 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99549 ?auto_99547 ) ( SURFACE-AT ?auto_99545 ?auto_99547 ) ( CLEAR ?auto_99545 ) ( IS-CRATE ?auto_99544 ) ( not ( = ?auto_99545 ?auto_99544 ) ) ( AVAILABLE ?auto_99549 ) ( IN ?auto_99544 ?auto_99548 ) ( ON ?auto_99545 ?auto_99543 ) ( not ( = ?auto_99543 ?auto_99545 ) ) ( not ( = ?auto_99543 ?auto_99544 ) ) ( TRUCK-AT ?auto_99548 ?auto_99546 ) ( not ( = ?auto_99546 ?auto_99547 ) ) ( ON ?auto_99542 ?auto_99541 ) ( ON ?auto_99543 ?auto_99542 ) ( not ( = ?auto_99541 ?auto_99542 ) ) ( not ( = ?auto_99541 ?auto_99543 ) ) ( not ( = ?auto_99541 ?auto_99545 ) ) ( not ( = ?auto_99541 ?auto_99544 ) ) ( not ( = ?auto_99542 ?auto_99543 ) ) ( not ( = ?auto_99542 ?auto_99545 ) ) ( not ( = ?auto_99542 ?auto_99544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99543 ?auto_99545 ?auto_99544 )
      ( MAKE-4CRATE-VERIFY ?auto_99541 ?auto_99542 ?auto_99543 ?auto_99545 ?auto_99544 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99575 - SURFACE
      ?auto_99576 - SURFACE
      ?auto_99577 - SURFACE
      ?auto_99579 - SURFACE
      ?auto_99578 - SURFACE
    )
    :vars
    (
      ?auto_99584 - HOIST
      ?auto_99583 - PLACE
      ?auto_99581 - TRUCK
      ?auto_99580 - PLACE
      ?auto_99582 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_99584 ?auto_99583 ) ( SURFACE-AT ?auto_99579 ?auto_99583 ) ( CLEAR ?auto_99579 ) ( IS-CRATE ?auto_99578 ) ( not ( = ?auto_99579 ?auto_99578 ) ) ( AVAILABLE ?auto_99584 ) ( ON ?auto_99579 ?auto_99577 ) ( not ( = ?auto_99577 ?auto_99579 ) ) ( not ( = ?auto_99577 ?auto_99578 ) ) ( TRUCK-AT ?auto_99581 ?auto_99580 ) ( not ( = ?auto_99580 ?auto_99583 ) ) ( HOIST-AT ?auto_99582 ?auto_99580 ) ( LIFTING ?auto_99582 ?auto_99578 ) ( not ( = ?auto_99584 ?auto_99582 ) ) ( ON ?auto_99576 ?auto_99575 ) ( ON ?auto_99577 ?auto_99576 ) ( not ( = ?auto_99575 ?auto_99576 ) ) ( not ( = ?auto_99575 ?auto_99577 ) ) ( not ( = ?auto_99575 ?auto_99579 ) ) ( not ( = ?auto_99575 ?auto_99578 ) ) ( not ( = ?auto_99576 ?auto_99577 ) ) ( not ( = ?auto_99576 ?auto_99579 ) ) ( not ( = ?auto_99576 ?auto_99578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99577 ?auto_99579 ?auto_99578 )
      ( MAKE-4CRATE-VERIFY ?auto_99575 ?auto_99576 ?auto_99577 ?auto_99579 ?auto_99578 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99613 - SURFACE
      ?auto_99614 - SURFACE
      ?auto_99615 - SURFACE
      ?auto_99617 - SURFACE
      ?auto_99616 - SURFACE
    )
    :vars
    (
      ?auto_99618 - HOIST
      ?auto_99623 - PLACE
      ?auto_99619 - TRUCK
      ?auto_99620 - PLACE
      ?auto_99621 - HOIST
      ?auto_99622 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99618 ?auto_99623 ) ( SURFACE-AT ?auto_99617 ?auto_99623 ) ( CLEAR ?auto_99617 ) ( IS-CRATE ?auto_99616 ) ( not ( = ?auto_99617 ?auto_99616 ) ) ( AVAILABLE ?auto_99618 ) ( ON ?auto_99617 ?auto_99615 ) ( not ( = ?auto_99615 ?auto_99617 ) ) ( not ( = ?auto_99615 ?auto_99616 ) ) ( TRUCK-AT ?auto_99619 ?auto_99620 ) ( not ( = ?auto_99620 ?auto_99623 ) ) ( HOIST-AT ?auto_99621 ?auto_99620 ) ( not ( = ?auto_99618 ?auto_99621 ) ) ( AVAILABLE ?auto_99621 ) ( SURFACE-AT ?auto_99616 ?auto_99620 ) ( ON ?auto_99616 ?auto_99622 ) ( CLEAR ?auto_99616 ) ( not ( = ?auto_99617 ?auto_99622 ) ) ( not ( = ?auto_99616 ?auto_99622 ) ) ( not ( = ?auto_99615 ?auto_99622 ) ) ( ON ?auto_99614 ?auto_99613 ) ( ON ?auto_99615 ?auto_99614 ) ( not ( = ?auto_99613 ?auto_99614 ) ) ( not ( = ?auto_99613 ?auto_99615 ) ) ( not ( = ?auto_99613 ?auto_99617 ) ) ( not ( = ?auto_99613 ?auto_99616 ) ) ( not ( = ?auto_99613 ?auto_99622 ) ) ( not ( = ?auto_99614 ?auto_99615 ) ) ( not ( = ?auto_99614 ?auto_99617 ) ) ( not ( = ?auto_99614 ?auto_99616 ) ) ( not ( = ?auto_99614 ?auto_99622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99615 ?auto_99617 ?auto_99616 )
      ( MAKE-4CRATE-VERIFY ?auto_99613 ?auto_99614 ?auto_99615 ?auto_99617 ?auto_99616 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99652 - SURFACE
      ?auto_99653 - SURFACE
      ?auto_99654 - SURFACE
      ?auto_99656 - SURFACE
      ?auto_99655 - SURFACE
    )
    :vars
    (
      ?auto_99660 - HOIST
      ?auto_99657 - PLACE
      ?auto_99659 - PLACE
      ?auto_99658 - HOIST
      ?auto_99661 - SURFACE
      ?auto_99662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99660 ?auto_99657 ) ( SURFACE-AT ?auto_99656 ?auto_99657 ) ( CLEAR ?auto_99656 ) ( IS-CRATE ?auto_99655 ) ( not ( = ?auto_99656 ?auto_99655 ) ) ( AVAILABLE ?auto_99660 ) ( ON ?auto_99656 ?auto_99654 ) ( not ( = ?auto_99654 ?auto_99656 ) ) ( not ( = ?auto_99654 ?auto_99655 ) ) ( not ( = ?auto_99659 ?auto_99657 ) ) ( HOIST-AT ?auto_99658 ?auto_99659 ) ( not ( = ?auto_99660 ?auto_99658 ) ) ( AVAILABLE ?auto_99658 ) ( SURFACE-AT ?auto_99655 ?auto_99659 ) ( ON ?auto_99655 ?auto_99661 ) ( CLEAR ?auto_99655 ) ( not ( = ?auto_99656 ?auto_99661 ) ) ( not ( = ?auto_99655 ?auto_99661 ) ) ( not ( = ?auto_99654 ?auto_99661 ) ) ( TRUCK-AT ?auto_99662 ?auto_99657 ) ( ON ?auto_99653 ?auto_99652 ) ( ON ?auto_99654 ?auto_99653 ) ( not ( = ?auto_99652 ?auto_99653 ) ) ( not ( = ?auto_99652 ?auto_99654 ) ) ( not ( = ?auto_99652 ?auto_99656 ) ) ( not ( = ?auto_99652 ?auto_99655 ) ) ( not ( = ?auto_99652 ?auto_99661 ) ) ( not ( = ?auto_99653 ?auto_99654 ) ) ( not ( = ?auto_99653 ?auto_99656 ) ) ( not ( = ?auto_99653 ?auto_99655 ) ) ( not ( = ?auto_99653 ?auto_99661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99654 ?auto_99656 ?auto_99655 )
      ( MAKE-4CRATE-VERIFY ?auto_99652 ?auto_99653 ?auto_99654 ?auto_99656 ?auto_99655 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99691 - SURFACE
      ?auto_99692 - SURFACE
      ?auto_99693 - SURFACE
      ?auto_99695 - SURFACE
      ?auto_99694 - SURFACE
    )
    :vars
    (
      ?auto_99701 - HOIST
      ?auto_99699 - PLACE
      ?auto_99697 - PLACE
      ?auto_99700 - HOIST
      ?auto_99698 - SURFACE
      ?auto_99696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99701 ?auto_99699 ) ( IS-CRATE ?auto_99694 ) ( not ( = ?auto_99695 ?auto_99694 ) ) ( not ( = ?auto_99693 ?auto_99695 ) ) ( not ( = ?auto_99693 ?auto_99694 ) ) ( not ( = ?auto_99697 ?auto_99699 ) ) ( HOIST-AT ?auto_99700 ?auto_99697 ) ( not ( = ?auto_99701 ?auto_99700 ) ) ( AVAILABLE ?auto_99700 ) ( SURFACE-AT ?auto_99694 ?auto_99697 ) ( ON ?auto_99694 ?auto_99698 ) ( CLEAR ?auto_99694 ) ( not ( = ?auto_99695 ?auto_99698 ) ) ( not ( = ?auto_99694 ?auto_99698 ) ) ( not ( = ?auto_99693 ?auto_99698 ) ) ( TRUCK-AT ?auto_99696 ?auto_99699 ) ( SURFACE-AT ?auto_99693 ?auto_99699 ) ( CLEAR ?auto_99693 ) ( LIFTING ?auto_99701 ?auto_99695 ) ( IS-CRATE ?auto_99695 ) ( ON ?auto_99692 ?auto_99691 ) ( ON ?auto_99693 ?auto_99692 ) ( not ( = ?auto_99691 ?auto_99692 ) ) ( not ( = ?auto_99691 ?auto_99693 ) ) ( not ( = ?auto_99691 ?auto_99695 ) ) ( not ( = ?auto_99691 ?auto_99694 ) ) ( not ( = ?auto_99691 ?auto_99698 ) ) ( not ( = ?auto_99692 ?auto_99693 ) ) ( not ( = ?auto_99692 ?auto_99695 ) ) ( not ( = ?auto_99692 ?auto_99694 ) ) ( not ( = ?auto_99692 ?auto_99698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99693 ?auto_99695 ?auto_99694 )
      ( MAKE-4CRATE-VERIFY ?auto_99691 ?auto_99692 ?auto_99693 ?auto_99695 ?auto_99694 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99730 - SURFACE
      ?auto_99731 - SURFACE
      ?auto_99732 - SURFACE
      ?auto_99734 - SURFACE
      ?auto_99733 - SURFACE
    )
    :vars
    (
      ?auto_99738 - HOIST
      ?auto_99736 - PLACE
      ?auto_99737 - PLACE
      ?auto_99735 - HOIST
      ?auto_99739 - SURFACE
      ?auto_99740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99738 ?auto_99736 ) ( IS-CRATE ?auto_99733 ) ( not ( = ?auto_99734 ?auto_99733 ) ) ( not ( = ?auto_99732 ?auto_99734 ) ) ( not ( = ?auto_99732 ?auto_99733 ) ) ( not ( = ?auto_99737 ?auto_99736 ) ) ( HOIST-AT ?auto_99735 ?auto_99737 ) ( not ( = ?auto_99738 ?auto_99735 ) ) ( AVAILABLE ?auto_99735 ) ( SURFACE-AT ?auto_99733 ?auto_99737 ) ( ON ?auto_99733 ?auto_99739 ) ( CLEAR ?auto_99733 ) ( not ( = ?auto_99734 ?auto_99739 ) ) ( not ( = ?auto_99733 ?auto_99739 ) ) ( not ( = ?auto_99732 ?auto_99739 ) ) ( TRUCK-AT ?auto_99740 ?auto_99736 ) ( SURFACE-AT ?auto_99732 ?auto_99736 ) ( CLEAR ?auto_99732 ) ( IS-CRATE ?auto_99734 ) ( AVAILABLE ?auto_99738 ) ( IN ?auto_99734 ?auto_99740 ) ( ON ?auto_99731 ?auto_99730 ) ( ON ?auto_99732 ?auto_99731 ) ( not ( = ?auto_99730 ?auto_99731 ) ) ( not ( = ?auto_99730 ?auto_99732 ) ) ( not ( = ?auto_99730 ?auto_99734 ) ) ( not ( = ?auto_99730 ?auto_99733 ) ) ( not ( = ?auto_99730 ?auto_99739 ) ) ( not ( = ?auto_99731 ?auto_99732 ) ) ( not ( = ?auto_99731 ?auto_99734 ) ) ( not ( = ?auto_99731 ?auto_99733 ) ) ( not ( = ?auto_99731 ?auto_99739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99732 ?auto_99734 ?auto_99733 )
      ( MAKE-4CRATE-VERIFY ?auto_99730 ?auto_99731 ?auto_99732 ?auto_99734 ?auto_99733 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100390 - SURFACE
      ?auto_100391 - SURFACE
      ?auto_100392 - SURFACE
      ?auto_100394 - SURFACE
      ?auto_100393 - SURFACE
      ?auto_100395 - SURFACE
    )
    :vars
    (
      ?auto_100397 - HOIST
      ?auto_100396 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100397 ?auto_100396 ) ( SURFACE-AT ?auto_100393 ?auto_100396 ) ( CLEAR ?auto_100393 ) ( LIFTING ?auto_100397 ?auto_100395 ) ( IS-CRATE ?auto_100395 ) ( not ( = ?auto_100393 ?auto_100395 ) ) ( ON ?auto_100391 ?auto_100390 ) ( ON ?auto_100392 ?auto_100391 ) ( ON ?auto_100394 ?auto_100392 ) ( ON ?auto_100393 ?auto_100394 ) ( not ( = ?auto_100390 ?auto_100391 ) ) ( not ( = ?auto_100390 ?auto_100392 ) ) ( not ( = ?auto_100390 ?auto_100394 ) ) ( not ( = ?auto_100390 ?auto_100393 ) ) ( not ( = ?auto_100390 ?auto_100395 ) ) ( not ( = ?auto_100391 ?auto_100392 ) ) ( not ( = ?auto_100391 ?auto_100394 ) ) ( not ( = ?auto_100391 ?auto_100393 ) ) ( not ( = ?auto_100391 ?auto_100395 ) ) ( not ( = ?auto_100392 ?auto_100394 ) ) ( not ( = ?auto_100392 ?auto_100393 ) ) ( not ( = ?auto_100392 ?auto_100395 ) ) ( not ( = ?auto_100394 ?auto_100393 ) ) ( not ( = ?auto_100394 ?auto_100395 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_100393 ?auto_100395 )
      ( MAKE-5CRATE-VERIFY ?auto_100390 ?auto_100391 ?auto_100392 ?auto_100394 ?auto_100393 ?auto_100395 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100424 - SURFACE
      ?auto_100425 - SURFACE
      ?auto_100426 - SURFACE
      ?auto_100428 - SURFACE
      ?auto_100427 - SURFACE
      ?auto_100429 - SURFACE
    )
    :vars
    (
      ?auto_100432 - HOIST
      ?auto_100430 - PLACE
      ?auto_100431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100432 ?auto_100430 ) ( SURFACE-AT ?auto_100427 ?auto_100430 ) ( CLEAR ?auto_100427 ) ( IS-CRATE ?auto_100429 ) ( not ( = ?auto_100427 ?auto_100429 ) ) ( TRUCK-AT ?auto_100431 ?auto_100430 ) ( AVAILABLE ?auto_100432 ) ( IN ?auto_100429 ?auto_100431 ) ( ON ?auto_100427 ?auto_100428 ) ( not ( = ?auto_100428 ?auto_100427 ) ) ( not ( = ?auto_100428 ?auto_100429 ) ) ( ON ?auto_100425 ?auto_100424 ) ( ON ?auto_100426 ?auto_100425 ) ( ON ?auto_100428 ?auto_100426 ) ( not ( = ?auto_100424 ?auto_100425 ) ) ( not ( = ?auto_100424 ?auto_100426 ) ) ( not ( = ?auto_100424 ?auto_100428 ) ) ( not ( = ?auto_100424 ?auto_100427 ) ) ( not ( = ?auto_100424 ?auto_100429 ) ) ( not ( = ?auto_100425 ?auto_100426 ) ) ( not ( = ?auto_100425 ?auto_100428 ) ) ( not ( = ?auto_100425 ?auto_100427 ) ) ( not ( = ?auto_100425 ?auto_100429 ) ) ( not ( = ?auto_100426 ?auto_100428 ) ) ( not ( = ?auto_100426 ?auto_100427 ) ) ( not ( = ?auto_100426 ?auto_100429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100428 ?auto_100427 ?auto_100429 )
      ( MAKE-5CRATE-VERIFY ?auto_100424 ?auto_100425 ?auto_100426 ?auto_100428 ?auto_100427 ?auto_100429 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100464 - SURFACE
      ?auto_100465 - SURFACE
      ?auto_100466 - SURFACE
      ?auto_100468 - SURFACE
      ?auto_100467 - SURFACE
      ?auto_100469 - SURFACE
    )
    :vars
    (
      ?auto_100472 - HOIST
      ?auto_100471 - PLACE
      ?auto_100473 - TRUCK
      ?auto_100470 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100472 ?auto_100471 ) ( SURFACE-AT ?auto_100467 ?auto_100471 ) ( CLEAR ?auto_100467 ) ( IS-CRATE ?auto_100469 ) ( not ( = ?auto_100467 ?auto_100469 ) ) ( AVAILABLE ?auto_100472 ) ( IN ?auto_100469 ?auto_100473 ) ( ON ?auto_100467 ?auto_100468 ) ( not ( = ?auto_100468 ?auto_100467 ) ) ( not ( = ?auto_100468 ?auto_100469 ) ) ( TRUCK-AT ?auto_100473 ?auto_100470 ) ( not ( = ?auto_100470 ?auto_100471 ) ) ( ON ?auto_100465 ?auto_100464 ) ( ON ?auto_100466 ?auto_100465 ) ( ON ?auto_100468 ?auto_100466 ) ( not ( = ?auto_100464 ?auto_100465 ) ) ( not ( = ?auto_100464 ?auto_100466 ) ) ( not ( = ?auto_100464 ?auto_100468 ) ) ( not ( = ?auto_100464 ?auto_100467 ) ) ( not ( = ?auto_100464 ?auto_100469 ) ) ( not ( = ?auto_100465 ?auto_100466 ) ) ( not ( = ?auto_100465 ?auto_100468 ) ) ( not ( = ?auto_100465 ?auto_100467 ) ) ( not ( = ?auto_100465 ?auto_100469 ) ) ( not ( = ?auto_100466 ?auto_100468 ) ) ( not ( = ?auto_100466 ?auto_100467 ) ) ( not ( = ?auto_100466 ?auto_100469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100468 ?auto_100467 ?auto_100469 )
      ( MAKE-5CRATE-VERIFY ?auto_100464 ?auto_100465 ?auto_100466 ?auto_100468 ?auto_100467 ?auto_100469 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100509 - SURFACE
      ?auto_100510 - SURFACE
      ?auto_100511 - SURFACE
      ?auto_100513 - SURFACE
      ?auto_100512 - SURFACE
      ?auto_100514 - SURFACE
    )
    :vars
    (
      ?auto_100517 - HOIST
      ?auto_100518 - PLACE
      ?auto_100519 - TRUCK
      ?auto_100516 - PLACE
      ?auto_100515 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_100517 ?auto_100518 ) ( SURFACE-AT ?auto_100512 ?auto_100518 ) ( CLEAR ?auto_100512 ) ( IS-CRATE ?auto_100514 ) ( not ( = ?auto_100512 ?auto_100514 ) ) ( AVAILABLE ?auto_100517 ) ( ON ?auto_100512 ?auto_100513 ) ( not ( = ?auto_100513 ?auto_100512 ) ) ( not ( = ?auto_100513 ?auto_100514 ) ) ( TRUCK-AT ?auto_100519 ?auto_100516 ) ( not ( = ?auto_100516 ?auto_100518 ) ) ( HOIST-AT ?auto_100515 ?auto_100516 ) ( LIFTING ?auto_100515 ?auto_100514 ) ( not ( = ?auto_100517 ?auto_100515 ) ) ( ON ?auto_100510 ?auto_100509 ) ( ON ?auto_100511 ?auto_100510 ) ( ON ?auto_100513 ?auto_100511 ) ( not ( = ?auto_100509 ?auto_100510 ) ) ( not ( = ?auto_100509 ?auto_100511 ) ) ( not ( = ?auto_100509 ?auto_100513 ) ) ( not ( = ?auto_100509 ?auto_100512 ) ) ( not ( = ?auto_100509 ?auto_100514 ) ) ( not ( = ?auto_100510 ?auto_100511 ) ) ( not ( = ?auto_100510 ?auto_100513 ) ) ( not ( = ?auto_100510 ?auto_100512 ) ) ( not ( = ?auto_100510 ?auto_100514 ) ) ( not ( = ?auto_100511 ?auto_100513 ) ) ( not ( = ?auto_100511 ?auto_100512 ) ) ( not ( = ?auto_100511 ?auto_100514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100513 ?auto_100512 ?auto_100514 )
      ( MAKE-5CRATE-VERIFY ?auto_100509 ?auto_100510 ?auto_100511 ?auto_100513 ?auto_100512 ?auto_100514 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100559 - SURFACE
      ?auto_100560 - SURFACE
      ?auto_100561 - SURFACE
      ?auto_100563 - SURFACE
      ?auto_100562 - SURFACE
      ?auto_100564 - SURFACE
    )
    :vars
    (
      ?auto_100569 - HOIST
      ?auto_100566 - PLACE
      ?auto_100568 - TRUCK
      ?auto_100570 - PLACE
      ?auto_100567 - HOIST
      ?auto_100565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100569 ?auto_100566 ) ( SURFACE-AT ?auto_100562 ?auto_100566 ) ( CLEAR ?auto_100562 ) ( IS-CRATE ?auto_100564 ) ( not ( = ?auto_100562 ?auto_100564 ) ) ( AVAILABLE ?auto_100569 ) ( ON ?auto_100562 ?auto_100563 ) ( not ( = ?auto_100563 ?auto_100562 ) ) ( not ( = ?auto_100563 ?auto_100564 ) ) ( TRUCK-AT ?auto_100568 ?auto_100570 ) ( not ( = ?auto_100570 ?auto_100566 ) ) ( HOIST-AT ?auto_100567 ?auto_100570 ) ( not ( = ?auto_100569 ?auto_100567 ) ) ( AVAILABLE ?auto_100567 ) ( SURFACE-AT ?auto_100564 ?auto_100570 ) ( ON ?auto_100564 ?auto_100565 ) ( CLEAR ?auto_100564 ) ( not ( = ?auto_100562 ?auto_100565 ) ) ( not ( = ?auto_100564 ?auto_100565 ) ) ( not ( = ?auto_100563 ?auto_100565 ) ) ( ON ?auto_100560 ?auto_100559 ) ( ON ?auto_100561 ?auto_100560 ) ( ON ?auto_100563 ?auto_100561 ) ( not ( = ?auto_100559 ?auto_100560 ) ) ( not ( = ?auto_100559 ?auto_100561 ) ) ( not ( = ?auto_100559 ?auto_100563 ) ) ( not ( = ?auto_100559 ?auto_100562 ) ) ( not ( = ?auto_100559 ?auto_100564 ) ) ( not ( = ?auto_100559 ?auto_100565 ) ) ( not ( = ?auto_100560 ?auto_100561 ) ) ( not ( = ?auto_100560 ?auto_100563 ) ) ( not ( = ?auto_100560 ?auto_100562 ) ) ( not ( = ?auto_100560 ?auto_100564 ) ) ( not ( = ?auto_100560 ?auto_100565 ) ) ( not ( = ?auto_100561 ?auto_100563 ) ) ( not ( = ?auto_100561 ?auto_100562 ) ) ( not ( = ?auto_100561 ?auto_100564 ) ) ( not ( = ?auto_100561 ?auto_100565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100563 ?auto_100562 ?auto_100564 )
      ( MAKE-5CRATE-VERIFY ?auto_100559 ?auto_100560 ?auto_100561 ?auto_100563 ?auto_100562 ?auto_100564 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100610 - SURFACE
      ?auto_100611 - SURFACE
      ?auto_100612 - SURFACE
      ?auto_100614 - SURFACE
      ?auto_100613 - SURFACE
      ?auto_100615 - SURFACE
    )
    :vars
    (
      ?auto_100620 - HOIST
      ?auto_100621 - PLACE
      ?auto_100617 - PLACE
      ?auto_100616 - HOIST
      ?auto_100618 - SURFACE
      ?auto_100619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100620 ?auto_100621 ) ( SURFACE-AT ?auto_100613 ?auto_100621 ) ( CLEAR ?auto_100613 ) ( IS-CRATE ?auto_100615 ) ( not ( = ?auto_100613 ?auto_100615 ) ) ( AVAILABLE ?auto_100620 ) ( ON ?auto_100613 ?auto_100614 ) ( not ( = ?auto_100614 ?auto_100613 ) ) ( not ( = ?auto_100614 ?auto_100615 ) ) ( not ( = ?auto_100617 ?auto_100621 ) ) ( HOIST-AT ?auto_100616 ?auto_100617 ) ( not ( = ?auto_100620 ?auto_100616 ) ) ( AVAILABLE ?auto_100616 ) ( SURFACE-AT ?auto_100615 ?auto_100617 ) ( ON ?auto_100615 ?auto_100618 ) ( CLEAR ?auto_100615 ) ( not ( = ?auto_100613 ?auto_100618 ) ) ( not ( = ?auto_100615 ?auto_100618 ) ) ( not ( = ?auto_100614 ?auto_100618 ) ) ( TRUCK-AT ?auto_100619 ?auto_100621 ) ( ON ?auto_100611 ?auto_100610 ) ( ON ?auto_100612 ?auto_100611 ) ( ON ?auto_100614 ?auto_100612 ) ( not ( = ?auto_100610 ?auto_100611 ) ) ( not ( = ?auto_100610 ?auto_100612 ) ) ( not ( = ?auto_100610 ?auto_100614 ) ) ( not ( = ?auto_100610 ?auto_100613 ) ) ( not ( = ?auto_100610 ?auto_100615 ) ) ( not ( = ?auto_100610 ?auto_100618 ) ) ( not ( = ?auto_100611 ?auto_100612 ) ) ( not ( = ?auto_100611 ?auto_100614 ) ) ( not ( = ?auto_100611 ?auto_100613 ) ) ( not ( = ?auto_100611 ?auto_100615 ) ) ( not ( = ?auto_100611 ?auto_100618 ) ) ( not ( = ?auto_100612 ?auto_100614 ) ) ( not ( = ?auto_100612 ?auto_100613 ) ) ( not ( = ?auto_100612 ?auto_100615 ) ) ( not ( = ?auto_100612 ?auto_100618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100614 ?auto_100613 ?auto_100615 )
      ( MAKE-5CRATE-VERIFY ?auto_100610 ?auto_100611 ?auto_100612 ?auto_100614 ?auto_100613 ?auto_100615 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100661 - SURFACE
      ?auto_100662 - SURFACE
      ?auto_100663 - SURFACE
      ?auto_100665 - SURFACE
      ?auto_100664 - SURFACE
      ?auto_100666 - SURFACE
    )
    :vars
    (
      ?auto_100672 - HOIST
      ?auto_100668 - PLACE
      ?auto_100667 - PLACE
      ?auto_100671 - HOIST
      ?auto_100670 - SURFACE
      ?auto_100669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100672 ?auto_100668 ) ( IS-CRATE ?auto_100666 ) ( not ( = ?auto_100664 ?auto_100666 ) ) ( not ( = ?auto_100665 ?auto_100664 ) ) ( not ( = ?auto_100665 ?auto_100666 ) ) ( not ( = ?auto_100667 ?auto_100668 ) ) ( HOIST-AT ?auto_100671 ?auto_100667 ) ( not ( = ?auto_100672 ?auto_100671 ) ) ( AVAILABLE ?auto_100671 ) ( SURFACE-AT ?auto_100666 ?auto_100667 ) ( ON ?auto_100666 ?auto_100670 ) ( CLEAR ?auto_100666 ) ( not ( = ?auto_100664 ?auto_100670 ) ) ( not ( = ?auto_100666 ?auto_100670 ) ) ( not ( = ?auto_100665 ?auto_100670 ) ) ( TRUCK-AT ?auto_100669 ?auto_100668 ) ( SURFACE-AT ?auto_100665 ?auto_100668 ) ( CLEAR ?auto_100665 ) ( LIFTING ?auto_100672 ?auto_100664 ) ( IS-CRATE ?auto_100664 ) ( ON ?auto_100662 ?auto_100661 ) ( ON ?auto_100663 ?auto_100662 ) ( ON ?auto_100665 ?auto_100663 ) ( not ( = ?auto_100661 ?auto_100662 ) ) ( not ( = ?auto_100661 ?auto_100663 ) ) ( not ( = ?auto_100661 ?auto_100665 ) ) ( not ( = ?auto_100661 ?auto_100664 ) ) ( not ( = ?auto_100661 ?auto_100666 ) ) ( not ( = ?auto_100661 ?auto_100670 ) ) ( not ( = ?auto_100662 ?auto_100663 ) ) ( not ( = ?auto_100662 ?auto_100665 ) ) ( not ( = ?auto_100662 ?auto_100664 ) ) ( not ( = ?auto_100662 ?auto_100666 ) ) ( not ( = ?auto_100662 ?auto_100670 ) ) ( not ( = ?auto_100663 ?auto_100665 ) ) ( not ( = ?auto_100663 ?auto_100664 ) ) ( not ( = ?auto_100663 ?auto_100666 ) ) ( not ( = ?auto_100663 ?auto_100670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100665 ?auto_100664 ?auto_100666 )
      ( MAKE-5CRATE-VERIFY ?auto_100661 ?auto_100662 ?auto_100663 ?auto_100665 ?auto_100664 ?auto_100666 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100712 - SURFACE
      ?auto_100713 - SURFACE
      ?auto_100714 - SURFACE
      ?auto_100716 - SURFACE
      ?auto_100715 - SURFACE
      ?auto_100717 - SURFACE
    )
    :vars
    (
      ?auto_100721 - HOIST
      ?auto_100719 - PLACE
      ?auto_100718 - PLACE
      ?auto_100722 - HOIST
      ?auto_100723 - SURFACE
      ?auto_100720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100721 ?auto_100719 ) ( IS-CRATE ?auto_100717 ) ( not ( = ?auto_100715 ?auto_100717 ) ) ( not ( = ?auto_100716 ?auto_100715 ) ) ( not ( = ?auto_100716 ?auto_100717 ) ) ( not ( = ?auto_100718 ?auto_100719 ) ) ( HOIST-AT ?auto_100722 ?auto_100718 ) ( not ( = ?auto_100721 ?auto_100722 ) ) ( AVAILABLE ?auto_100722 ) ( SURFACE-AT ?auto_100717 ?auto_100718 ) ( ON ?auto_100717 ?auto_100723 ) ( CLEAR ?auto_100717 ) ( not ( = ?auto_100715 ?auto_100723 ) ) ( not ( = ?auto_100717 ?auto_100723 ) ) ( not ( = ?auto_100716 ?auto_100723 ) ) ( TRUCK-AT ?auto_100720 ?auto_100719 ) ( SURFACE-AT ?auto_100716 ?auto_100719 ) ( CLEAR ?auto_100716 ) ( IS-CRATE ?auto_100715 ) ( AVAILABLE ?auto_100721 ) ( IN ?auto_100715 ?auto_100720 ) ( ON ?auto_100713 ?auto_100712 ) ( ON ?auto_100714 ?auto_100713 ) ( ON ?auto_100716 ?auto_100714 ) ( not ( = ?auto_100712 ?auto_100713 ) ) ( not ( = ?auto_100712 ?auto_100714 ) ) ( not ( = ?auto_100712 ?auto_100716 ) ) ( not ( = ?auto_100712 ?auto_100715 ) ) ( not ( = ?auto_100712 ?auto_100717 ) ) ( not ( = ?auto_100712 ?auto_100723 ) ) ( not ( = ?auto_100713 ?auto_100714 ) ) ( not ( = ?auto_100713 ?auto_100716 ) ) ( not ( = ?auto_100713 ?auto_100715 ) ) ( not ( = ?auto_100713 ?auto_100717 ) ) ( not ( = ?auto_100713 ?auto_100723 ) ) ( not ( = ?auto_100714 ?auto_100716 ) ) ( not ( = ?auto_100714 ?auto_100715 ) ) ( not ( = ?auto_100714 ?auto_100717 ) ) ( not ( = ?auto_100714 ?auto_100723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100716 ?auto_100715 ?auto_100717 )
      ( MAKE-5CRATE-VERIFY ?auto_100712 ?auto_100713 ?auto_100714 ?auto_100716 ?auto_100715 ?auto_100717 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_101392 - SURFACE
      ?auto_101393 - SURFACE
    )
    :vars
    (
      ?auto_101396 - HOIST
      ?auto_101399 - PLACE
      ?auto_101395 - SURFACE
      ?auto_101400 - TRUCK
      ?auto_101397 - PLACE
      ?auto_101394 - HOIST
      ?auto_101398 - SURFACE
      ?auto_101401 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_101396 ?auto_101399 ) ( SURFACE-AT ?auto_101392 ?auto_101399 ) ( CLEAR ?auto_101392 ) ( IS-CRATE ?auto_101393 ) ( not ( = ?auto_101392 ?auto_101393 ) ) ( AVAILABLE ?auto_101396 ) ( ON ?auto_101392 ?auto_101395 ) ( not ( = ?auto_101395 ?auto_101392 ) ) ( not ( = ?auto_101395 ?auto_101393 ) ) ( TRUCK-AT ?auto_101400 ?auto_101397 ) ( not ( = ?auto_101397 ?auto_101399 ) ) ( HOIST-AT ?auto_101394 ?auto_101397 ) ( not ( = ?auto_101396 ?auto_101394 ) ) ( SURFACE-AT ?auto_101393 ?auto_101397 ) ( ON ?auto_101393 ?auto_101398 ) ( CLEAR ?auto_101393 ) ( not ( = ?auto_101392 ?auto_101398 ) ) ( not ( = ?auto_101393 ?auto_101398 ) ) ( not ( = ?auto_101395 ?auto_101398 ) ) ( LIFTING ?auto_101394 ?auto_101401 ) ( IS-CRATE ?auto_101401 ) ( not ( = ?auto_101392 ?auto_101401 ) ) ( not ( = ?auto_101393 ?auto_101401 ) ) ( not ( = ?auto_101395 ?auto_101401 ) ) ( not ( = ?auto_101398 ?auto_101401 ) ) )
    :subtasks
    ( ( !LOAD ?auto_101394 ?auto_101401 ?auto_101400 ?auto_101397 )
      ( MAKE-1CRATE ?auto_101392 ?auto_101393 )
      ( MAKE-1CRATE-VERIFY ?auto_101392 ?auto_101393 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_101918 - SURFACE
      ?auto_101919 - SURFACE
      ?auto_101920 - SURFACE
      ?auto_101922 - SURFACE
      ?auto_101921 - SURFACE
      ?auto_101923 - SURFACE
      ?auto_101924 - SURFACE
    )
    :vars
    (
      ?auto_101926 - HOIST
      ?auto_101925 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_101926 ?auto_101925 ) ( SURFACE-AT ?auto_101923 ?auto_101925 ) ( CLEAR ?auto_101923 ) ( LIFTING ?auto_101926 ?auto_101924 ) ( IS-CRATE ?auto_101924 ) ( not ( = ?auto_101923 ?auto_101924 ) ) ( ON ?auto_101919 ?auto_101918 ) ( ON ?auto_101920 ?auto_101919 ) ( ON ?auto_101922 ?auto_101920 ) ( ON ?auto_101921 ?auto_101922 ) ( ON ?auto_101923 ?auto_101921 ) ( not ( = ?auto_101918 ?auto_101919 ) ) ( not ( = ?auto_101918 ?auto_101920 ) ) ( not ( = ?auto_101918 ?auto_101922 ) ) ( not ( = ?auto_101918 ?auto_101921 ) ) ( not ( = ?auto_101918 ?auto_101923 ) ) ( not ( = ?auto_101918 ?auto_101924 ) ) ( not ( = ?auto_101919 ?auto_101920 ) ) ( not ( = ?auto_101919 ?auto_101922 ) ) ( not ( = ?auto_101919 ?auto_101921 ) ) ( not ( = ?auto_101919 ?auto_101923 ) ) ( not ( = ?auto_101919 ?auto_101924 ) ) ( not ( = ?auto_101920 ?auto_101922 ) ) ( not ( = ?auto_101920 ?auto_101921 ) ) ( not ( = ?auto_101920 ?auto_101923 ) ) ( not ( = ?auto_101920 ?auto_101924 ) ) ( not ( = ?auto_101922 ?auto_101921 ) ) ( not ( = ?auto_101922 ?auto_101923 ) ) ( not ( = ?auto_101922 ?auto_101924 ) ) ( not ( = ?auto_101921 ?auto_101923 ) ) ( not ( = ?auto_101921 ?auto_101924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_101923 ?auto_101924 )
      ( MAKE-6CRATE-VERIFY ?auto_101918 ?auto_101919 ?auto_101920 ?auto_101922 ?auto_101921 ?auto_101923 ?auto_101924 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_101962 - SURFACE
      ?auto_101963 - SURFACE
      ?auto_101964 - SURFACE
      ?auto_101966 - SURFACE
      ?auto_101965 - SURFACE
      ?auto_101967 - SURFACE
      ?auto_101968 - SURFACE
    )
    :vars
    (
      ?auto_101970 - HOIST
      ?auto_101971 - PLACE
      ?auto_101969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_101970 ?auto_101971 ) ( SURFACE-AT ?auto_101967 ?auto_101971 ) ( CLEAR ?auto_101967 ) ( IS-CRATE ?auto_101968 ) ( not ( = ?auto_101967 ?auto_101968 ) ) ( TRUCK-AT ?auto_101969 ?auto_101971 ) ( AVAILABLE ?auto_101970 ) ( IN ?auto_101968 ?auto_101969 ) ( ON ?auto_101967 ?auto_101965 ) ( not ( = ?auto_101965 ?auto_101967 ) ) ( not ( = ?auto_101965 ?auto_101968 ) ) ( ON ?auto_101963 ?auto_101962 ) ( ON ?auto_101964 ?auto_101963 ) ( ON ?auto_101966 ?auto_101964 ) ( ON ?auto_101965 ?auto_101966 ) ( not ( = ?auto_101962 ?auto_101963 ) ) ( not ( = ?auto_101962 ?auto_101964 ) ) ( not ( = ?auto_101962 ?auto_101966 ) ) ( not ( = ?auto_101962 ?auto_101965 ) ) ( not ( = ?auto_101962 ?auto_101967 ) ) ( not ( = ?auto_101962 ?auto_101968 ) ) ( not ( = ?auto_101963 ?auto_101964 ) ) ( not ( = ?auto_101963 ?auto_101966 ) ) ( not ( = ?auto_101963 ?auto_101965 ) ) ( not ( = ?auto_101963 ?auto_101967 ) ) ( not ( = ?auto_101963 ?auto_101968 ) ) ( not ( = ?auto_101964 ?auto_101966 ) ) ( not ( = ?auto_101964 ?auto_101965 ) ) ( not ( = ?auto_101964 ?auto_101967 ) ) ( not ( = ?auto_101964 ?auto_101968 ) ) ( not ( = ?auto_101966 ?auto_101965 ) ) ( not ( = ?auto_101966 ?auto_101967 ) ) ( not ( = ?auto_101966 ?auto_101968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_101965 ?auto_101967 ?auto_101968 )
      ( MAKE-6CRATE-VERIFY ?auto_101962 ?auto_101963 ?auto_101964 ?auto_101966 ?auto_101965 ?auto_101967 ?auto_101968 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102013 - SURFACE
      ?auto_102014 - SURFACE
      ?auto_102015 - SURFACE
      ?auto_102017 - SURFACE
      ?auto_102016 - SURFACE
      ?auto_102018 - SURFACE
      ?auto_102019 - SURFACE
    )
    :vars
    (
      ?auto_102022 - HOIST
      ?auto_102023 - PLACE
      ?auto_102020 - TRUCK
      ?auto_102021 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_102022 ?auto_102023 ) ( SURFACE-AT ?auto_102018 ?auto_102023 ) ( CLEAR ?auto_102018 ) ( IS-CRATE ?auto_102019 ) ( not ( = ?auto_102018 ?auto_102019 ) ) ( AVAILABLE ?auto_102022 ) ( IN ?auto_102019 ?auto_102020 ) ( ON ?auto_102018 ?auto_102016 ) ( not ( = ?auto_102016 ?auto_102018 ) ) ( not ( = ?auto_102016 ?auto_102019 ) ) ( TRUCK-AT ?auto_102020 ?auto_102021 ) ( not ( = ?auto_102021 ?auto_102023 ) ) ( ON ?auto_102014 ?auto_102013 ) ( ON ?auto_102015 ?auto_102014 ) ( ON ?auto_102017 ?auto_102015 ) ( ON ?auto_102016 ?auto_102017 ) ( not ( = ?auto_102013 ?auto_102014 ) ) ( not ( = ?auto_102013 ?auto_102015 ) ) ( not ( = ?auto_102013 ?auto_102017 ) ) ( not ( = ?auto_102013 ?auto_102016 ) ) ( not ( = ?auto_102013 ?auto_102018 ) ) ( not ( = ?auto_102013 ?auto_102019 ) ) ( not ( = ?auto_102014 ?auto_102015 ) ) ( not ( = ?auto_102014 ?auto_102017 ) ) ( not ( = ?auto_102014 ?auto_102016 ) ) ( not ( = ?auto_102014 ?auto_102018 ) ) ( not ( = ?auto_102014 ?auto_102019 ) ) ( not ( = ?auto_102015 ?auto_102017 ) ) ( not ( = ?auto_102015 ?auto_102016 ) ) ( not ( = ?auto_102015 ?auto_102018 ) ) ( not ( = ?auto_102015 ?auto_102019 ) ) ( not ( = ?auto_102017 ?auto_102016 ) ) ( not ( = ?auto_102017 ?auto_102018 ) ) ( not ( = ?auto_102017 ?auto_102019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102016 ?auto_102018 ?auto_102019 )
      ( MAKE-6CRATE-VERIFY ?auto_102013 ?auto_102014 ?auto_102015 ?auto_102017 ?auto_102016 ?auto_102018 ?auto_102019 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102070 - SURFACE
      ?auto_102071 - SURFACE
      ?auto_102072 - SURFACE
      ?auto_102074 - SURFACE
      ?auto_102073 - SURFACE
      ?auto_102075 - SURFACE
      ?auto_102076 - SURFACE
    )
    :vars
    (
      ?auto_102081 - HOIST
      ?auto_102080 - PLACE
      ?auto_102078 - TRUCK
      ?auto_102079 - PLACE
      ?auto_102077 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_102081 ?auto_102080 ) ( SURFACE-AT ?auto_102075 ?auto_102080 ) ( CLEAR ?auto_102075 ) ( IS-CRATE ?auto_102076 ) ( not ( = ?auto_102075 ?auto_102076 ) ) ( AVAILABLE ?auto_102081 ) ( ON ?auto_102075 ?auto_102073 ) ( not ( = ?auto_102073 ?auto_102075 ) ) ( not ( = ?auto_102073 ?auto_102076 ) ) ( TRUCK-AT ?auto_102078 ?auto_102079 ) ( not ( = ?auto_102079 ?auto_102080 ) ) ( HOIST-AT ?auto_102077 ?auto_102079 ) ( LIFTING ?auto_102077 ?auto_102076 ) ( not ( = ?auto_102081 ?auto_102077 ) ) ( ON ?auto_102071 ?auto_102070 ) ( ON ?auto_102072 ?auto_102071 ) ( ON ?auto_102074 ?auto_102072 ) ( ON ?auto_102073 ?auto_102074 ) ( not ( = ?auto_102070 ?auto_102071 ) ) ( not ( = ?auto_102070 ?auto_102072 ) ) ( not ( = ?auto_102070 ?auto_102074 ) ) ( not ( = ?auto_102070 ?auto_102073 ) ) ( not ( = ?auto_102070 ?auto_102075 ) ) ( not ( = ?auto_102070 ?auto_102076 ) ) ( not ( = ?auto_102071 ?auto_102072 ) ) ( not ( = ?auto_102071 ?auto_102074 ) ) ( not ( = ?auto_102071 ?auto_102073 ) ) ( not ( = ?auto_102071 ?auto_102075 ) ) ( not ( = ?auto_102071 ?auto_102076 ) ) ( not ( = ?auto_102072 ?auto_102074 ) ) ( not ( = ?auto_102072 ?auto_102073 ) ) ( not ( = ?auto_102072 ?auto_102075 ) ) ( not ( = ?auto_102072 ?auto_102076 ) ) ( not ( = ?auto_102074 ?auto_102073 ) ) ( not ( = ?auto_102074 ?auto_102075 ) ) ( not ( = ?auto_102074 ?auto_102076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102073 ?auto_102075 ?auto_102076 )
      ( MAKE-6CRATE-VERIFY ?auto_102070 ?auto_102071 ?auto_102072 ?auto_102074 ?auto_102073 ?auto_102075 ?auto_102076 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102133 - SURFACE
      ?auto_102134 - SURFACE
      ?auto_102135 - SURFACE
      ?auto_102137 - SURFACE
      ?auto_102136 - SURFACE
      ?auto_102138 - SURFACE
      ?auto_102139 - SURFACE
    )
    :vars
    (
      ?auto_102140 - HOIST
      ?auto_102142 - PLACE
      ?auto_102145 - TRUCK
      ?auto_102144 - PLACE
      ?auto_102141 - HOIST
      ?auto_102143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_102140 ?auto_102142 ) ( SURFACE-AT ?auto_102138 ?auto_102142 ) ( CLEAR ?auto_102138 ) ( IS-CRATE ?auto_102139 ) ( not ( = ?auto_102138 ?auto_102139 ) ) ( AVAILABLE ?auto_102140 ) ( ON ?auto_102138 ?auto_102136 ) ( not ( = ?auto_102136 ?auto_102138 ) ) ( not ( = ?auto_102136 ?auto_102139 ) ) ( TRUCK-AT ?auto_102145 ?auto_102144 ) ( not ( = ?auto_102144 ?auto_102142 ) ) ( HOIST-AT ?auto_102141 ?auto_102144 ) ( not ( = ?auto_102140 ?auto_102141 ) ) ( AVAILABLE ?auto_102141 ) ( SURFACE-AT ?auto_102139 ?auto_102144 ) ( ON ?auto_102139 ?auto_102143 ) ( CLEAR ?auto_102139 ) ( not ( = ?auto_102138 ?auto_102143 ) ) ( not ( = ?auto_102139 ?auto_102143 ) ) ( not ( = ?auto_102136 ?auto_102143 ) ) ( ON ?auto_102134 ?auto_102133 ) ( ON ?auto_102135 ?auto_102134 ) ( ON ?auto_102137 ?auto_102135 ) ( ON ?auto_102136 ?auto_102137 ) ( not ( = ?auto_102133 ?auto_102134 ) ) ( not ( = ?auto_102133 ?auto_102135 ) ) ( not ( = ?auto_102133 ?auto_102137 ) ) ( not ( = ?auto_102133 ?auto_102136 ) ) ( not ( = ?auto_102133 ?auto_102138 ) ) ( not ( = ?auto_102133 ?auto_102139 ) ) ( not ( = ?auto_102133 ?auto_102143 ) ) ( not ( = ?auto_102134 ?auto_102135 ) ) ( not ( = ?auto_102134 ?auto_102137 ) ) ( not ( = ?auto_102134 ?auto_102136 ) ) ( not ( = ?auto_102134 ?auto_102138 ) ) ( not ( = ?auto_102134 ?auto_102139 ) ) ( not ( = ?auto_102134 ?auto_102143 ) ) ( not ( = ?auto_102135 ?auto_102137 ) ) ( not ( = ?auto_102135 ?auto_102136 ) ) ( not ( = ?auto_102135 ?auto_102138 ) ) ( not ( = ?auto_102135 ?auto_102139 ) ) ( not ( = ?auto_102135 ?auto_102143 ) ) ( not ( = ?auto_102137 ?auto_102136 ) ) ( not ( = ?auto_102137 ?auto_102138 ) ) ( not ( = ?auto_102137 ?auto_102139 ) ) ( not ( = ?auto_102137 ?auto_102143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102136 ?auto_102138 ?auto_102139 )
      ( MAKE-6CRATE-VERIFY ?auto_102133 ?auto_102134 ?auto_102135 ?auto_102137 ?auto_102136 ?auto_102138 ?auto_102139 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102197 - SURFACE
      ?auto_102198 - SURFACE
      ?auto_102199 - SURFACE
      ?auto_102201 - SURFACE
      ?auto_102200 - SURFACE
      ?auto_102202 - SURFACE
      ?auto_102203 - SURFACE
    )
    :vars
    (
      ?auto_102206 - HOIST
      ?auto_102208 - PLACE
      ?auto_102209 - PLACE
      ?auto_102205 - HOIST
      ?auto_102207 - SURFACE
      ?auto_102204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_102206 ?auto_102208 ) ( SURFACE-AT ?auto_102202 ?auto_102208 ) ( CLEAR ?auto_102202 ) ( IS-CRATE ?auto_102203 ) ( not ( = ?auto_102202 ?auto_102203 ) ) ( AVAILABLE ?auto_102206 ) ( ON ?auto_102202 ?auto_102200 ) ( not ( = ?auto_102200 ?auto_102202 ) ) ( not ( = ?auto_102200 ?auto_102203 ) ) ( not ( = ?auto_102209 ?auto_102208 ) ) ( HOIST-AT ?auto_102205 ?auto_102209 ) ( not ( = ?auto_102206 ?auto_102205 ) ) ( AVAILABLE ?auto_102205 ) ( SURFACE-AT ?auto_102203 ?auto_102209 ) ( ON ?auto_102203 ?auto_102207 ) ( CLEAR ?auto_102203 ) ( not ( = ?auto_102202 ?auto_102207 ) ) ( not ( = ?auto_102203 ?auto_102207 ) ) ( not ( = ?auto_102200 ?auto_102207 ) ) ( TRUCK-AT ?auto_102204 ?auto_102208 ) ( ON ?auto_102198 ?auto_102197 ) ( ON ?auto_102199 ?auto_102198 ) ( ON ?auto_102201 ?auto_102199 ) ( ON ?auto_102200 ?auto_102201 ) ( not ( = ?auto_102197 ?auto_102198 ) ) ( not ( = ?auto_102197 ?auto_102199 ) ) ( not ( = ?auto_102197 ?auto_102201 ) ) ( not ( = ?auto_102197 ?auto_102200 ) ) ( not ( = ?auto_102197 ?auto_102202 ) ) ( not ( = ?auto_102197 ?auto_102203 ) ) ( not ( = ?auto_102197 ?auto_102207 ) ) ( not ( = ?auto_102198 ?auto_102199 ) ) ( not ( = ?auto_102198 ?auto_102201 ) ) ( not ( = ?auto_102198 ?auto_102200 ) ) ( not ( = ?auto_102198 ?auto_102202 ) ) ( not ( = ?auto_102198 ?auto_102203 ) ) ( not ( = ?auto_102198 ?auto_102207 ) ) ( not ( = ?auto_102199 ?auto_102201 ) ) ( not ( = ?auto_102199 ?auto_102200 ) ) ( not ( = ?auto_102199 ?auto_102202 ) ) ( not ( = ?auto_102199 ?auto_102203 ) ) ( not ( = ?auto_102199 ?auto_102207 ) ) ( not ( = ?auto_102201 ?auto_102200 ) ) ( not ( = ?auto_102201 ?auto_102202 ) ) ( not ( = ?auto_102201 ?auto_102203 ) ) ( not ( = ?auto_102201 ?auto_102207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102200 ?auto_102202 ?auto_102203 )
      ( MAKE-6CRATE-VERIFY ?auto_102197 ?auto_102198 ?auto_102199 ?auto_102201 ?auto_102200 ?auto_102202 ?auto_102203 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102261 - SURFACE
      ?auto_102262 - SURFACE
      ?auto_102263 - SURFACE
      ?auto_102265 - SURFACE
      ?auto_102264 - SURFACE
      ?auto_102266 - SURFACE
      ?auto_102267 - SURFACE
    )
    :vars
    (
      ?auto_102269 - HOIST
      ?auto_102273 - PLACE
      ?auto_102270 - PLACE
      ?auto_102271 - HOIST
      ?auto_102272 - SURFACE
      ?auto_102268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_102269 ?auto_102273 ) ( IS-CRATE ?auto_102267 ) ( not ( = ?auto_102266 ?auto_102267 ) ) ( not ( = ?auto_102264 ?auto_102266 ) ) ( not ( = ?auto_102264 ?auto_102267 ) ) ( not ( = ?auto_102270 ?auto_102273 ) ) ( HOIST-AT ?auto_102271 ?auto_102270 ) ( not ( = ?auto_102269 ?auto_102271 ) ) ( AVAILABLE ?auto_102271 ) ( SURFACE-AT ?auto_102267 ?auto_102270 ) ( ON ?auto_102267 ?auto_102272 ) ( CLEAR ?auto_102267 ) ( not ( = ?auto_102266 ?auto_102272 ) ) ( not ( = ?auto_102267 ?auto_102272 ) ) ( not ( = ?auto_102264 ?auto_102272 ) ) ( TRUCK-AT ?auto_102268 ?auto_102273 ) ( SURFACE-AT ?auto_102264 ?auto_102273 ) ( CLEAR ?auto_102264 ) ( LIFTING ?auto_102269 ?auto_102266 ) ( IS-CRATE ?auto_102266 ) ( ON ?auto_102262 ?auto_102261 ) ( ON ?auto_102263 ?auto_102262 ) ( ON ?auto_102265 ?auto_102263 ) ( ON ?auto_102264 ?auto_102265 ) ( not ( = ?auto_102261 ?auto_102262 ) ) ( not ( = ?auto_102261 ?auto_102263 ) ) ( not ( = ?auto_102261 ?auto_102265 ) ) ( not ( = ?auto_102261 ?auto_102264 ) ) ( not ( = ?auto_102261 ?auto_102266 ) ) ( not ( = ?auto_102261 ?auto_102267 ) ) ( not ( = ?auto_102261 ?auto_102272 ) ) ( not ( = ?auto_102262 ?auto_102263 ) ) ( not ( = ?auto_102262 ?auto_102265 ) ) ( not ( = ?auto_102262 ?auto_102264 ) ) ( not ( = ?auto_102262 ?auto_102266 ) ) ( not ( = ?auto_102262 ?auto_102267 ) ) ( not ( = ?auto_102262 ?auto_102272 ) ) ( not ( = ?auto_102263 ?auto_102265 ) ) ( not ( = ?auto_102263 ?auto_102264 ) ) ( not ( = ?auto_102263 ?auto_102266 ) ) ( not ( = ?auto_102263 ?auto_102267 ) ) ( not ( = ?auto_102263 ?auto_102272 ) ) ( not ( = ?auto_102265 ?auto_102264 ) ) ( not ( = ?auto_102265 ?auto_102266 ) ) ( not ( = ?auto_102265 ?auto_102267 ) ) ( not ( = ?auto_102265 ?auto_102272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102264 ?auto_102266 ?auto_102267 )
      ( MAKE-6CRATE-VERIFY ?auto_102261 ?auto_102262 ?auto_102263 ?auto_102265 ?auto_102264 ?auto_102266 ?auto_102267 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102325 - SURFACE
      ?auto_102326 - SURFACE
      ?auto_102327 - SURFACE
      ?auto_102329 - SURFACE
      ?auto_102328 - SURFACE
      ?auto_102330 - SURFACE
      ?auto_102331 - SURFACE
    )
    :vars
    (
      ?auto_102335 - HOIST
      ?auto_102334 - PLACE
      ?auto_102333 - PLACE
      ?auto_102332 - HOIST
      ?auto_102337 - SURFACE
      ?auto_102336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_102335 ?auto_102334 ) ( IS-CRATE ?auto_102331 ) ( not ( = ?auto_102330 ?auto_102331 ) ) ( not ( = ?auto_102328 ?auto_102330 ) ) ( not ( = ?auto_102328 ?auto_102331 ) ) ( not ( = ?auto_102333 ?auto_102334 ) ) ( HOIST-AT ?auto_102332 ?auto_102333 ) ( not ( = ?auto_102335 ?auto_102332 ) ) ( AVAILABLE ?auto_102332 ) ( SURFACE-AT ?auto_102331 ?auto_102333 ) ( ON ?auto_102331 ?auto_102337 ) ( CLEAR ?auto_102331 ) ( not ( = ?auto_102330 ?auto_102337 ) ) ( not ( = ?auto_102331 ?auto_102337 ) ) ( not ( = ?auto_102328 ?auto_102337 ) ) ( TRUCK-AT ?auto_102336 ?auto_102334 ) ( SURFACE-AT ?auto_102328 ?auto_102334 ) ( CLEAR ?auto_102328 ) ( IS-CRATE ?auto_102330 ) ( AVAILABLE ?auto_102335 ) ( IN ?auto_102330 ?auto_102336 ) ( ON ?auto_102326 ?auto_102325 ) ( ON ?auto_102327 ?auto_102326 ) ( ON ?auto_102329 ?auto_102327 ) ( ON ?auto_102328 ?auto_102329 ) ( not ( = ?auto_102325 ?auto_102326 ) ) ( not ( = ?auto_102325 ?auto_102327 ) ) ( not ( = ?auto_102325 ?auto_102329 ) ) ( not ( = ?auto_102325 ?auto_102328 ) ) ( not ( = ?auto_102325 ?auto_102330 ) ) ( not ( = ?auto_102325 ?auto_102331 ) ) ( not ( = ?auto_102325 ?auto_102337 ) ) ( not ( = ?auto_102326 ?auto_102327 ) ) ( not ( = ?auto_102326 ?auto_102329 ) ) ( not ( = ?auto_102326 ?auto_102328 ) ) ( not ( = ?auto_102326 ?auto_102330 ) ) ( not ( = ?auto_102326 ?auto_102331 ) ) ( not ( = ?auto_102326 ?auto_102337 ) ) ( not ( = ?auto_102327 ?auto_102329 ) ) ( not ( = ?auto_102327 ?auto_102328 ) ) ( not ( = ?auto_102327 ?auto_102330 ) ) ( not ( = ?auto_102327 ?auto_102331 ) ) ( not ( = ?auto_102327 ?auto_102337 ) ) ( not ( = ?auto_102329 ?auto_102328 ) ) ( not ( = ?auto_102329 ?auto_102330 ) ) ( not ( = ?auto_102329 ?auto_102331 ) ) ( not ( = ?auto_102329 ?auto_102337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102328 ?auto_102330 ?auto_102331 )
      ( MAKE-6CRATE-VERIFY ?auto_102325 ?auto_102326 ?auto_102327 ?auto_102329 ?auto_102328 ?auto_102330 ?auto_102331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_103599 - SURFACE
      ?auto_103600 - SURFACE
    )
    :vars
    (
      ?auto_103603 - HOIST
      ?auto_103606 - PLACE
      ?auto_103601 - SURFACE
      ?auto_103607 - PLACE
      ?auto_103604 - HOIST
      ?auto_103605 - SURFACE
      ?auto_103602 - TRUCK
      ?auto_103608 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_103603 ?auto_103606 ) ( SURFACE-AT ?auto_103599 ?auto_103606 ) ( CLEAR ?auto_103599 ) ( IS-CRATE ?auto_103600 ) ( not ( = ?auto_103599 ?auto_103600 ) ) ( ON ?auto_103599 ?auto_103601 ) ( not ( = ?auto_103601 ?auto_103599 ) ) ( not ( = ?auto_103601 ?auto_103600 ) ) ( not ( = ?auto_103607 ?auto_103606 ) ) ( HOIST-AT ?auto_103604 ?auto_103607 ) ( not ( = ?auto_103603 ?auto_103604 ) ) ( AVAILABLE ?auto_103604 ) ( SURFACE-AT ?auto_103600 ?auto_103607 ) ( ON ?auto_103600 ?auto_103605 ) ( CLEAR ?auto_103600 ) ( not ( = ?auto_103599 ?auto_103605 ) ) ( not ( = ?auto_103600 ?auto_103605 ) ) ( not ( = ?auto_103601 ?auto_103605 ) ) ( TRUCK-AT ?auto_103602 ?auto_103606 ) ( LIFTING ?auto_103603 ?auto_103608 ) ( IS-CRATE ?auto_103608 ) ( not ( = ?auto_103599 ?auto_103608 ) ) ( not ( = ?auto_103600 ?auto_103608 ) ) ( not ( = ?auto_103601 ?auto_103608 ) ) ( not ( = ?auto_103605 ?auto_103608 ) ) )
    :subtasks
    ( ( !LOAD ?auto_103603 ?auto_103608 ?auto_103602 ?auto_103606 )
      ( MAKE-1CRATE ?auto_103599 ?auto_103600 )
      ( MAKE-1CRATE-VERIFY ?auto_103599 ?auto_103600 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104276 - SURFACE
      ?auto_104277 - SURFACE
      ?auto_104278 - SURFACE
      ?auto_104280 - SURFACE
      ?auto_104279 - SURFACE
      ?auto_104281 - SURFACE
      ?auto_104282 - SURFACE
      ?auto_104283 - SURFACE
    )
    :vars
    (
      ?auto_104284 - HOIST
      ?auto_104285 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_104284 ?auto_104285 ) ( SURFACE-AT ?auto_104282 ?auto_104285 ) ( CLEAR ?auto_104282 ) ( LIFTING ?auto_104284 ?auto_104283 ) ( IS-CRATE ?auto_104283 ) ( not ( = ?auto_104282 ?auto_104283 ) ) ( ON ?auto_104277 ?auto_104276 ) ( ON ?auto_104278 ?auto_104277 ) ( ON ?auto_104280 ?auto_104278 ) ( ON ?auto_104279 ?auto_104280 ) ( ON ?auto_104281 ?auto_104279 ) ( ON ?auto_104282 ?auto_104281 ) ( not ( = ?auto_104276 ?auto_104277 ) ) ( not ( = ?auto_104276 ?auto_104278 ) ) ( not ( = ?auto_104276 ?auto_104280 ) ) ( not ( = ?auto_104276 ?auto_104279 ) ) ( not ( = ?auto_104276 ?auto_104281 ) ) ( not ( = ?auto_104276 ?auto_104282 ) ) ( not ( = ?auto_104276 ?auto_104283 ) ) ( not ( = ?auto_104277 ?auto_104278 ) ) ( not ( = ?auto_104277 ?auto_104280 ) ) ( not ( = ?auto_104277 ?auto_104279 ) ) ( not ( = ?auto_104277 ?auto_104281 ) ) ( not ( = ?auto_104277 ?auto_104282 ) ) ( not ( = ?auto_104277 ?auto_104283 ) ) ( not ( = ?auto_104278 ?auto_104280 ) ) ( not ( = ?auto_104278 ?auto_104279 ) ) ( not ( = ?auto_104278 ?auto_104281 ) ) ( not ( = ?auto_104278 ?auto_104282 ) ) ( not ( = ?auto_104278 ?auto_104283 ) ) ( not ( = ?auto_104280 ?auto_104279 ) ) ( not ( = ?auto_104280 ?auto_104281 ) ) ( not ( = ?auto_104280 ?auto_104282 ) ) ( not ( = ?auto_104280 ?auto_104283 ) ) ( not ( = ?auto_104279 ?auto_104281 ) ) ( not ( = ?auto_104279 ?auto_104282 ) ) ( not ( = ?auto_104279 ?auto_104283 ) ) ( not ( = ?auto_104281 ?auto_104282 ) ) ( not ( = ?auto_104281 ?auto_104283 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_104282 ?auto_104283 )
      ( MAKE-7CRATE-VERIFY ?auto_104276 ?auto_104277 ?auto_104278 ?auto_104280 ?auto_104279 ?auto_104281 ?auto_104282 ?auto_104283 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104331 - SURFACE
      ?auto_104332 - SURFACE
      ?auto_104333 - SURFACE
      ?auto_104335 - SURFACE
      ?auto_104334 - SURFACE
      ?auto_104336 - SURFACE
      ?auto_104337 - SURFACE
      ?auto_104338 - SURFACE
    )
    :vars
    (
      ?auto_104341 - HOIST
      ?auto_104339 - PLACE
      ?auto_104340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104341 ?auto_104339 ) ( SURFACE-AT ?auto_104337 ?auto_104339 ) ( CLEAR ?auto_104337 ) ( IS-CRATE ?auto_104338 ) ( not ( = ?auto_104337 ?auto_104338 ) ) ( TRUCK-AT ?auto_104340 ?auto_104339 ) ( AVAILABLE ?auto_104341 ) ( IN ?auto_104338 ?auto_104340 ) ( ON ?auto_104337 ?auto_104336 ) ( not ( = ?auto_104336 ?auto_104337 ) ) ( not ( = ?auto_104336 ?auto_104338 ) ) ( ON ?auto_104332 ?auto_104331 ) ( ON ?auto_104333 ?auto_104332 ) ( ON ?auto_104335 ?auto_104333 ) ( ON ?auto_104334 ?auto_104335 ) ( ON ?auto_104336 ?auto_104334 ) ( not ( = ?auto_104331 ?auto_104332 ) ) ( not ( = ?auto_104331 ?auto_104333 ) ) ( not ( = ?auto_104331 ?auto_104335 ) ) ( not ( = ?auto_104331 ?auto_104334 ) ) ( not ( = ?auto_104331 ?auto_104336 ) ) ( not ( = ?auto_104331 ?auto_104337 ) ) ( not ( = ?auto_104331 ?auto_104338 ) ) ( not ( = ?auto_104332 ?auto_104333 ) ) ( not ( = ?auto_104332 ?auto_104335 ) ) ( not ( = ?auto_104332 ?auto_104334 ) ) ( not ( = ?auto_104332 ?auto_104336 ) ) ( not ( = ?auto_104332 ?auto_104337 ) ) ( not ( = ?auto_104332 ?auto_104338 ) ) ( not ( = ?auto_104333 ?auto_104335 ) ) ( not ( = ?auto_104333 ?auto_104334 ) ) ( not ( = ?auto_104333 ?auto_104336 ) ) ( not ( = ?auto_104333 ?auto_104337 ) ) ( not ( = ?auto_104333 ?auto_104338 ) ) ( not ( = ?auto_104335 ?auto_104334 ) ) ( not ( = ?auto_104335 ?auto_104336 ) ) ( not ( = ?auto_104335 ?auto_104337 ) ) ( not ( = ?auto_104335 ?auto_104338 ) ) ( not ( = ?auto_104334 ?auto_104336 ) ) ( not ( = ?auto_104334 ?auto_104337 ) ) ( not ( = ?auto_104334 ?auto_104338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104336 ?auto_104337 ?auto_104338 )
      ( MAKE-7CRATE-VERIFY ?auto_104331 ?auto_104332 ?auto_104333 ?auto_104335 ?auto_104334 ?auto_104336 ?auto_104337 ?auto_104338 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104394 - SURFACE
      ?auto_104395 - SURFACE
      ?auto_104396 - SURFACE
      ?auto_104398 - SURFACE
      ?auto_104397 - SURFACE
      ?auto_104399 - SURFACE
      ?auto_104400 - SURFACE
      ?auto_104401 - SURFACE
    )
    :vars
    (
      ?auto_104404 - HOIST
      ?auto_104402 - PLACE
      ?auto_104405 - TRUCK
      ?auto_104403 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_104404 ?auto_104402 ) ( SURFACE-AT ?auto_104400 ?auto_104402 ) ( CLEAR ?auto_104400 ) ( IS-CRATE ?auto_104401 ) ( not ( = ?auto_104400 ?auto_104401 ) ) ( AVAILABLE ?auto_104404 ) ( IN ?auto_104401 ?auto_104405 ) ( ON ?auto_104400 ?auto_104399 ) ( not ( = ?auto_104399 ?auto_104400 ) ) ( not ( = ?auto_104399 ?auto_104401 ) ) ( TRUCK-AT ?auto_104405 ?auto_104403 ) ( not ( = ?auto_104403 ?auto_104402 ) ) ( ON ?auto_104395 ?auto_104394 ) ( ON ?auto_104396 ?auto_104395 ) ( ON ?auto_104398 ?auto_104396 ) ( ON ?auto_104397 ?auto_104398 ) ( ON ?auto_104399 ?auto_104397 ) ( not ( = ?auto_104394 ?auto_104395 ) ) ( not ( = ?auto_104394 ?auto_104396 ) ) ( not ( = ?auto_104394 ?auto_104398 ) ) ( not ( = ?auto_104394 ?auto_104397 ) ) ( not ( = ?auto_104394 ?auto_104399 ) ) ( not ( = ?auto_104394 ?auto_104400 ) ) ( not ( = ?auto_104394 ?auto_104401 ) ) ( not ( = ?auto_104395 ?auto_104396 ) ) ( not ( = ?auto_104395 ?auto_104398 ) ) ( not ( = ?auto_104395 ?auto_104397 ) ) ( not ( = ?auto_104395 ?auto_104399 ) ) ( not ( = ?auto_104395 ?auto_104400 ) ) ( not ( = ?auto_104395 ?auto_104401 ) ) ( not ( = ?auto_104396 ?auto_104398 ) ) ( not ( = ?auto_104396 ?auto_104397 ) ) ( not ( = ?auto_104396 ?auto_104399 ) ) ( not ( = ?auto_104396 ?auto_104400 ) ) ( not ( = ?auto_104396 ?auto_104401 ) ) ( not ( = ?auto_104398 ?auto_104397 ) ) ( not ( = ?auto_104398 ?auto_104399 ) ) ( not ( = ?auto_104398 ?auto_104400 ) ) ( not ( = ?auto_104398 ?auto_104401 ) ) ( not ( = ?auto_104397 ?auto_104399 ) ) ( not ( = ?auto_104397 ?auto_104400 ) ) ( not ( = ?auto_104397 ?auto_104401 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104399 ?auto_104400 ?auto_104401 )
      ( MAKE-7CRATE-VERIFY ?auto_104394 ?auto_104395 ?auto_104396 ?auto_104398 ?auto_104397 ?auto_104399 ?auto_104400 ?auto_104401 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104464 - SURFACE
      ?auto_104465 - SURFACE
      ?auto_104466 - SURFACE
      ?auto_104468 - SURFACE
      ?auto_104467 - SURFACE
      ?auto_104469 - SURFACE
      ?auto_104470 - SURFACE
      ?auto_104471 - SURFACE
    )
    :vars
    (
      ?auto_104475 - HOIST
      ?auto_104472 - PLACE
      ?auto_104473 - TRUCK
      ?auto_104476 - PLACE
      ?auto_104474 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_104475 ?auto_104472 ) ( SURFACE-AT ?auto_104470 ?auto_104472 ) ( CLEAR ?auto_104470 ) ( IS-CRATE ?auto_104471 ) ( not ( = ?auto_104470 ?auto_104471 ) ) ( AVAILABLE ?auto_104475 ) ( ON ?auto_104470 ?auto_104469 ) ( not ( = ?auto_104469 ?auto_104470 ) ) ( not ( = ?auto_104469 ?auto_104471 ) ) ( TRUCK-AT ?auto_104473 ?auto_104476 ) ( not ( = ?auto_104476 ?auto_104472 ) ) ( HOIST-AT ?auto_104474 ?auto_104476 ) ( LIFTING ?auto_104474 ?auto_104471 ) ( not ( = ?auto_104475 ?auto_104474 ) ) ( ON ?auto_104465 ?auto_104464 ) ( ON ?auto_104466 ?auto_104465 ) ( ON ?auto_104468 ?auto_104466 ) ( ON ?auto_104467 ?auto_104468 ) ( ON ?auto_104469 ?auto_104467 ) ( not ( = ?auto_104464 ?auto_104465 ) ) ( not ( = ?auto_104464 ?auto_104466 ) ) ( not ( = ?auto_104464 ?auto_104468 ) ) ( not ( = ?auto_104464 ?auto_104467 ) ) ( not ( = ?auto_104464 ?auto_104469 ) ) ( not ( = ?auto_104464 ?auto_104470 ) ) ( not ( = ?auto_104464 ?auto_104471 ) ) ( not ( = ?auto_104465 ?auto_104466 ) ) ( not ( = ?auto_104465 ?auto_104468 ) ) ( not ( = ?auto_104465 ?auto_104467 ) ) ( not ( = ?auto_104465 ?auto_104469 ) ) ( not ( = ?auto_104465 ?auto_104470 ) ) ( not ( = ?auto_104465 ?auto_104471 ) ) ( not ( = ?auto_104466 ?auto_104468 ) ) ( not ( = ?auto_104466 ?auto_104467 ) ) ( not ( = ?auto_104466 ?auto_104469 ) ) ( not ( = ?auto_104466 ?auto_104470 ) ) ( not ( = ?auto_104466 ?auto_104471 ) ) ( not ( = ?auto_104468 ?auto_104467 ) ) ( not ( = ?auto_104468 ?auto_104469 ) ) ( not ( = ?auto_104468 ?auto_104470 ) ) ( not ( = ?auto_104468 ?auto_104471 ) ) ( not ( = ?auto_104467 ?auto_104469 ) ) ( not ( = ?auto_104467 ?auto_104470 ) ) ( not ( = ?auto_104467 ?auto_104471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104469 ?auto_104470 ?auto_104471 )
      ( MAKE-7CRATE-VERIFY ?auto_104464 ?auto_104465 ?auto_104466 ?auto_104468 ?auto_104467 ?auto_104469 ?auto_104470 ?auto_104471 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104541 - SURFACE
      ?auto_104542 - SURFACE
      ?auto_104543 - SURFACE
      ?auto_104545 - SURFACE
      ?auto_104544 - SURFACE
      ?auto_104546 - SURFACE
      ?auto_104547 - SURFACE
      ?auto_104548 - SURFACE
    )
    :vars
    (
      ?auto_104552 - HOIST
      ?auto_104553 - PLACE
      ?auto_104551 - TRUCK
      ?auto_104549 - PLACE
      ?auto_104554 - HOIST
      ?auto_104550 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_104552 ?auto_104553 ) ( SURFACE-AT ?auto_104547 ?auto_104553 ) ( CLEAR ?auto_104547 ) ( IS-CRATE ?auto_104548 ) ( not ( = ?auto_104547 ?auto_104548 ) ) ( AVAILABLE ?auto_104552 ) ( ON ?auto_104547 ?auto_104546 ) ( not ( = ?auto_104546 ?auto_104547 ) ) ( not ( = ?auto_104546 ?auto_104548 ) ) ( TRUCK-AT ?auto_104551 ?auto_104549 ) ( not ( = ?auto_104549 ?auto_104553 ) ) ( HOIST-AT ?auto_104554 ?auto_104549 ) ( not ( = ?auto_104552 ?auto_104554 ) ) ( AVAILABLE ?auto_104554 ) ( SURFACE-AT ?auto_104548 ?auto_104549 ) ( ON ?auto_104548 ?auto_104550 ) ( CLEAR ?auto_104548 ) ( not ( = ?auto_104547 ?auto_104550 ) ) ( not ( = ?auto_104548 ?auto_104550 ) ) ( not ( = ?auto_104546 ?auto_104550 ) ) ( ON ?auto_104542 ?auto_104541 ) ( ON ?auto_104543 ?auto_104542 ) ( ON ?auto_104545 ?auto_104543 ) ( ON ?auto_104544 ?auto_104545 ) ( ON ?auto_104546 ?auto_104544 ) ( not ( = ?auto_104541 ?auto_104542 ) ) ( not ( = ?auto_104541 ?auto_104543 ) ) ( not ( = ?auto_104541 ?auto_104545 ) ) ( not ( = ?auto_104541 ?auto_104544 ) ) ( not ( = ?auto_104541 ?auto_104546 ) ) ( not ( = ?auto_104541 ?auto_104547 ) ) ( not ( = ?auto_104541 ?auto_104548 ) ) ( not ( = ?auto_104541 ?auto_104550 ) ) ( not ( = ?auto_104542 ?auto_104543 ) ) ( not ( = ?auto_104542 ?auto_104545 ) ) ( not ( = ?auto_104542 ?auto_104544 ) ) ( not ( = ?auto_104542 ?auto_104546 ) ) ( not ( = ?auto_104542 ?auto_104547 ) ) ( not ( = ?auto_104542 ?auto_104548 ) ) ( not ( = ?auto_104542 ?auto_104550 ) ) ( not ( = ?auto_104543 ?auto_104545 ) ) ( not ( = ?auto_104543 ?auto_104544 ) ) ( not ( = ?auto_104543 ?auto_104546 ) ) ( not ( = ?auto_104543 ?auto_104547 ) ) ( not ( = ?auto_104543 ?auto_104548 ) ) ( not ( = ?auto_104543 ?auto_104550 ) ) ( not ( = ?auto_104545 ?auto_104544 ) ) ( not ( = ?auto_104545 ?auto_104546 ) ) ( not ( = ?auto_104545 ?auto_104547 ) ) ( not ( = ?auto_104545 ?auto_104548 ) ) ( not ( = ?auto_104545 ?auto_104550 ) ) ( not ( = ?auto_104544 ?auto_104546 ) ) ( not ( = ?auto_104544 ?auto_104547 ) ) ( not ( = ?auto_104544 ?auto_104548 ) ) ( not ( = ?auto_104544 ?auto_104550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104546 ?auto_104547 ?auto_104548 )
      ( MAKE-7CRATE-VERIFY ?auto_104541 ?auto_104542 ?auto_104543 ?auto_104545 ?auto_104544 ?auto_104546 ?auto_104547 ?auto_104548 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104619 - SURFACE
      ?auto_104620 - SURFACE
      ?auto_104621 - SURFACE
      ?auto_104623 - SURFACE
      ?auto_104622 - SURFACE
      ?auto_104624 - SURFACE
      ?auto_104625 - SURFACE
      ?auto_104626 - SURFACE
    )
    :vars
    (
      ?auto_104629 - HOIST
      ?auto_104632 - PLACE
      ?auto_104630 - PLACE
      ?auto_104627 - HOIST
      ?auto_104631 - SURFACE
      ?auto_104628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104629 ?auto_104632 ) ( SURFACE-AT ?auto_104625 ?auto_104632 ) ( CLEAR ?auto_104625 ) ( IS-CRATE ?auto_104626 ) ( not ( = ?auto_104625 ?auto_104626 ) ) ( AVAILABLE ?auto_104629 ) ( ON ?auto_104625 ?auto_104624 ) ( not ( = ?auto_104624 ?auto_104625 ) ) ( not ( = ?auto_104624 ?auto_104626 ) ) ( not ( = ?auto_104630 ?auto_104632 ) ) ( HOIST-AT ?auto_104627 ?auto_104630 ) ( not ( = ?auto_104629 ?auto_104627 ) ) ( AVAILABLE ?auto_104627 ) ( SURFACE-AT ?auto_104626 ?auto_104630 ) ( ON ?auto_104626 ?auto_104631 ) ( CLEAR ?auto_104626 ) ( not ( = ?auto_104625 ?auto_104631 ) ) ( not ( = ?auto_104626 ?auto_104631 ) ) ( not ( = ?auto_104624 ?auto_104631 ) ) ( TRUCK-AT ?auto_104628 ?auto_104632 ) ( ON ?auto_104620 ?auto_104619 ) ( ON ?auto_104621 ?auto_104620 ) ( ON ?auto_104623 ?auto_104621 ) ( ON ?auto_104622 ?auto_104623 ) ( ON ?auto_104624 ?auto_104622 ) ( not ( = ?auto_104619 ?auto_104620 ) ) ( not ( = ?auto_104619 ?auto_104621 ) ) ( not ( = ?auto_104619 ?auto_104623 ) ) ( not ( = ?auto_104619 ?auto_104622 ) ) ( not ( = ?auto_104619 ?auto_104624 ) ) ( not ( = ?auto_104619 ?auto_104625 ) ) ( not ( = ?auto_104619 ?auto_104626 ) ) ( not ( = ?auto_104619 ?auto_104631 ) ) ( not ( = ?auto_104620 ?auto_104621 ) ) ( not ( = ?auto_104620 ?auto_104623 ) ) ( not ( = ?auto_104620 ?auto_104622 ) ) ( not ( = ?auto_104620 ?auto_104624 ) ) ( not ( = ?auto_104620 ?auto_104625 ) ) ( not ( = ?auto_104620 ?auto_104626 ) ) ( not ( = ?auto_104620 ?auto_104631 ) ) ( not ( = ?auto_104621 ?auto_104623 ) ) ( not ( = ?auto_104621 ?auto_104622 ) ) ( not ( = ?auto_104621 ?auto_104624 ) ) ( not ( = ?auto_104621 ?auto_104625 ) ) ( not ( = ?auto_104621 ?auto_104626 ) ) ( not ( = ?auto_104621 ?auto_104631 ) ) ( not ( = ?auto_104623 ?auto_104622 ) ) ( not ( = ?auto_104623 ?auto_104624 ) ) ( not ( = ?auto_104623 ?auto_104625 ) ) ( not ( = ?auto_104623 ?auto_104626 ) ) ( not ( = ?auto_104623 ?auto_104631 ) ) ( not ( = ?auto_104622 ?auto_104624 ) ) ( not ( = ?auto_104622 ?auto_104625 ) ) ( not ( = ?auto_104622 ?auto_104626 ) ) ( not ( = ?auto_104622 ?auto_104631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104624 ?auto_104625 ?auto_104626 )
      ( MAKE-7CRATE-VERIFY ?auto_104619 ?auto_104620 ?auto_104621 ?auto_104623 ?auto_104622 ?auto_104624 ?auto_104625 ?auto_104626 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104697 - SURFACE
      ?auto_104698 - SURFACE
      ?auto_104699 - SURFACE
      ?auto_104701 - SURFACE
      ?auto_104700 - SURFACE
      ?auto_104702 - SURFACE
      ?auto_104703 - SURFACE
      ?auto_104704 - SURFACE
    )
    :vars
    (
      ?auto_104710 - HOIST
      ?auto_104709 - PLACE
      ?auto_104708 - PLACE
      ?auto_104705 - HOIST
      ?auto_104706 - SURFACE
      ?auto_104707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104710 ?auto_104709 ) ( IS-CRATE ?auto_104704 ) ( not ( = ?auto_104703 ?auto_104704 ) ) ( not ( = ?auto_104702 ?auto_104703 ) ) ( not ( = ?auto_104702 ?auto_104704 ) ) ( not ( = ?auto_104708 ?auto_104709 ) ) ( HOIST-AT ?auto_104705 ?auto_104708 ) ( not ( = ?auto_104710 ?auto_104705 ) ) ( AVAILABLE ?auto_104705 ) ( SURFACE-AT ?auto_104704 ?auto_104708 ) ( ON ?auto_104704 ?auto_104706 ) ( CLEAR ?auto_104704 ) ( not ( = ?auto_104703 ?auto_104706 ) ) ( not ( = ?auto_104704 ?auto_104706 ) ) ( not ( = ?auto_104702 ?auto_104706 ) ) ( TRUCK-AT ?auto_104707 ?auto_104709 ) ( SURFACE-AT ?auto_104702 ?auto_104709 ) ( CLEAR ?auto_104702 ) ( LIFTING ?auto_104710 ?auto_104703 ) ( IS-CRATE ?auto_104703 ) ( ON ?auto_104698 ?auto_104697 ) ( ON ?auto_104699 ?auto_104698 ) ( ON ?auto_104701 ?auto_104699 ) ( ON ?auto_104700 ?auto_104701 ) ( ON ?auto_104702 ?auto_104700 ) ( not ( = ?auto_104697 ?auto_104698 ) ) ( not ( = ?auto_104697 ?auto_104699 ) ) ( not ( = ?auto_104697 ?auto_104701 ) ) ( not ( = ?auto_104697 ?auto_104700 ) ) ( not ( = ?auto_104697 ?auto_104702 ) ) ( not ( = ?auto_104697 ?auto_104703 ) ) ( not ( = ?auto_104697 ?auto_104704 ) ) ( not ( = ?auto_104697 ?auto_104706 ) ) ( not ( = ?auto_104698 ?auto_104699 ) ) ( not ( = ?auto_104698 ?auto_104701 ) ) ( not ( = ?auto_104698 ?auto_104700 ) ) ( not ( = ?auto_104698 ?auto_104702 ) ) ( not ( = ?auto_104698 ?auto_104703 ) ) ( not ( = ?auto_104698 ?auto_104704 ) ) ( not ( = ?auto_104698 ?auto_104706 ) ) ( not ( = ?auto_104699 ?auto_104701 ) ) ( not ( = ?auto_104699 ?auto_104700 ) ) ( not ( = ?auto_104699 ?auto_104702 ) ) ( not ( = ?auto_104699 ?auto_104703 ) ) ( not ( = ?auto_104699 ?auto_104704 ) ) ( not ( = ?auto_104699 ?auto_104706 ) ) ( not ( = ?auto_104701 ?auto_104700 ) ) ( not ( = ?auto_104701 ?auto_104702 ) ) ( not ( = ?auto_104701 ?auto_104703 ) ) ( not ( = ?auto_104701 ?auto_104704 ) ) ( not ( = ?auto_104701 ?auto_104706 ) ) ( not ( = ?auto_104700 ?auto_104702 ) ) ( not ( = ?auto_104700 ?auto_104703 ) ) ( not ( = ?auto_104700 ?auto_104704 ) ) ( not ( = ?auto_104700 ?auto_104706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104702 ?auto_104703 ?auto_104704 )
      ( MAKE-7CRATE-VERIFY ?auto_104697 ?auto_104698 ?auto_104699 ?auto_104701 ?auto_104700 ?auto_104702 ?auto_104703 ?auto_104704 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104775 - SURFACE
      ?auto_104776 - SURFACE
      ?auto_104777 - SURFACE
      ?auto_104779 - SURFACE
      ?auto_104778 - SURFACE
      ?auto_104780 - SURFACE
      ?auto_104781 - SURFACE
      ?auto_104782 - SURFACE
    )
    :vars
    (
      ?auto_104783 - HOIST
      ?auto_104788 - PLACE
      ?auto_104784 - PLACE
      ?auto_104787 - HOIST
      ?auto_104786 - SURFACE
      ?auto_104785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104783 ?auto_104788 ) ( IS-CRATE ?auto_104782 ) ( not ( = ?auto_104781 ?auto_104782 ) ) ( not ( = ?auto_104780 ?auto_104781 ) ) ( not ( = ?auto_104780 ?auto_104782 ) ) ( not ( = ?auto_104784 ?auto_104788 ) ) ( HOIST-AT ?auto_104787 ?auto_104784 ) ( not ( = ?auto_104783 ?auto_104787 ) ) ( AVAILABLE ?auto_104787 ) ( SURFACE-AT ?auto_104782 ?auto_104784 ) ( ON ?auto_104782 ?auto_104786 ) ( CLEAR ?auto_104782 ) ( not ( = ?auto_104781 ?auto_104786 ) ) ( not ( = ?auto_104782 ?auto_104786 ) ) ( not ( = ?auto_104780 ?auto_104786 ) ) ( TRUCK-AT ?auto_104785 ?auto_104788 ) ( SURFACE-AT ?auto_104780 ?auto_104788 ) ( CLEAR ?auto_104780 ) ( IS-CRATE ?auto_104781 ) ( AVAILABLE ?auto_104783 ) ( IN ?auto_104781 ?auto_104785 ) ( ON ?auto_104776 ?auto_104775 ) ( ON ?auto_104777 ?auto_104776 ) ( ON ?auto_104779 ?auto_104777 ) ( ON ?auto_104778 ?auto_104779 ) ( ON ?auto_104780 ?auto_104778 ) ( not ( = ?auto_104775 ?auto_104776 ) ) ( not ( = ?auto_104775 ?auto_104777 ) ) ( not ( = ?auto_104775 ?auto_104779 ) ) ( not ( = ?auto_104775 ?auto_104778 ) ) ( not ( = ?auto_104775 ?auto_104780 ) ) ( not ( = ?auto_104775 ?auto_104781 ) ) ( not ( = ?auto_104775 ?auto_104782 ) ) ( not ( = ?auto_104775 ?auto_104786 ) ) ( not ( = ?auto_104776 ?auto_104777 ) ) ( not ( = ?auto_104776 ?auto_104779 ) ) ( not ( = ?auto_104776 ?auto_104778 ) ) ( not ( = ?auto_104776 ?auto_104780 ) ) ( not ( = ?auto_104776 ?auto_104781 ) ) ( not ( = ?auto_104776 ?auto_104782 ) ) ( not ( = ?auto_104776 ?auto_104786 ) ) ( not ( = ?auto_104777 ?auto_104779 ) ) ( not ( = ?auto_104777 ?auto_104778 ) ) ( not ( = ?auto_104777 ?auto_104780 ) ) ( not ( = ?auto_104777 ?auto_104781 ) ) ( not ( = ?auto_104777 ?auto_104782 ) ) ( not ( = ?auto_104777 ?auto_104786 ) ) ( not ( = ?auto_104779 ?auto_104778 ) ) ( not ( = ?auto_104779 ?auto_104780 ) ) ( not ( = ?auto_104779 ?auto_104781 ) ) ( not ( = ?auto_104779 ?auto_104782 ) ) ( not ( = ?auto_104779 ?auto_104786 ) ) ( not ( = ?auto_104778 ?auto_104780 ) ) ( not ( = ?auto_104778 ?auto_104781 ) ) ( not ( = ?auto_104778 ?auto_104782 ) ) ( not ( = ?auto_104778 ?auto_104786 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104780 ?auto_104781 ?auto_104782 )
      ( MAKE-7CRATE-VERIFY ?auto_104775 ?auto_104776 ?auto_104777 ?auto_104779 ?auto_104778 ?auto_104780 ?auto_104781 ?auto_104782 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_107694 - SURFACE
      ?auto_107695 - SURFACE
      ?auto_107696 - SURFACE
      ?auto_107698 - SURFACE
      ?auto_107697 - SURFACE
      ?auto_107699 - SURFACE
      ?auto_107700 - SURFACE
      ?auto_107701 - SURFACE
      ?auto_107702 - SURFACE
    )
    :vars
    (
      ?auto_107704 - HOIST
      ?auto_107703 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_107704 ?auto_107703 ) ( SURFACE-AT ?auto_107701 ?auto_107703 ) ( CLEAR ?auto_107701 ) ( LIFTING ?auto_107704 ?auto_107702 ) ( IS-CRATE ?auto_107702 ) ( not ( = ?auto_107701 ?auto_107702 ) ) ( ON ?auto_107695 ?auto_107694 ) ( ON ?auto_107696 ?auto_107695 ) ( ON ?auto_107698 ?auto_107696 ) ( ON ?auto_107697 ?auto_107698 ) ( ON ?auto_107699 ?auto_107697 ) ( ON ?auto_107700 ?auto_107699 ) ( ON ?auto_107701 ?auto_107700 ) ( not ( = ?auto_107694 ?auto_107695 ) ) ( not ( = ?auto_107694 ?auto_107696 ) ) ( not ( = ?auto_107694 ?auto_107698 ) ) ( not ( = ?auto_107694 ?auto_107697 ) ) ( not ( = ?auto_107694 ?auto_107699 ) ) ( not ( = ?auto_107694 ?auto_107700 ) ) ( not ( = ?auto_107694 ?auto_107701 ) ) ( not ( = ?auto_107694 ?auto_107702 ) ) ( not ( = ?auto_107695 ?auto_107696 ) ) ( not ( = ?auto_107695 ?auto_107698 ) ) ( not ( = ?auto_107695 ?auto_107697 ) ) ( not ( = ?auto_107695 ?auto_107699 ) ) ( not ( = ?auto_107695 ?auto_107700 ) ) ( not ( = ?auto_107695 ?auto_107701 ) ) ( not ( = ?auto_107695 ?auto_107702 ) ) ( not ( = ?auto_107696 ?auto_107698 ) ) ( not ( = ?auto_107696 ?auto_107697 ) ) ( not ( = ?auto_107696 ?auto_107699 ) ) ( not ( = ?auto_107696 ?auto_107700 ) ) ( not ( = ?auto_107696 ?auto_107701 ) ) ( not ( = ?auto_107696 ?auto_107702 ) ) ( not ( = ?auto_107698 ?auto_107697 ) ) ( not ( = ?auto_107698 ?auto_107699 ) ) ( not ( = ?auto_107698 ?auto_107700 ) ) ( not ( = ?auto_107698 ?auto_107701 ) ) ( not ( = ?auto_107698 ?auto_107702 ) ) ( not ( = ?auto_107697 ?auto_107699 ) ) ( not ( = ?auto_107697 ?auto_107700 ) ) ( not ( = ?auto_107697 ?auto_107701 ) ) ( not ( = ?auto_107697 ?auto_107702 ) ) ( not ( = ?auto_107699 ?auto_107700 ) ) ( not ( = ?auto_107699 ?auto_107701 ) ) ( not ( = ?auto_107699 ?auto_107702 ) ) ( not ( = ?auto_107700 ?auto_107701 ) ) ( not ( = ?auto_107700 ?auto_107702 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_107701 ?auto_107702 )
      ( MAKE-8CRATE-VERIFY ?auto_107694 ?auto_107695 ?auto_107696 ?auto_107698 ?auto_107697 ?auto_107699 ?auto_107700 ?auto_107701 ?auto_107702 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_107761 - SURFACE
      ?auto_107762 - SURFACE
      ?auto_107763 - SURFACE
      ?auto_107765 - SURFACE
      ?auto_107764 - SURFACE
      ?auto_107766 - SURFACE
      ?auto_107767 - SURFACE
      ?auto_107768 - SURFACE
      ?auto_107769 - SURFACE
    )
    :vars
    (
      ?auto_107771 - HOIST
      ?auto_107770 - PLACE
      ?auto_107772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_107771 ?auto_107770 ) ( SURFACE-AT ?auto_107768 ?auto_107770 ) ( CLEAR ?auto_107768 ) ( IS-CRATE ?auto_107769 ) ( not ( = ?auto_107768 ?auto_107769 ) ) ( TRUCK-AT ?auto_107772 ?auto_107770 ) ( AVAILABLE ?auto_107771 ) ( IN ?auto_107769 ?auto_107772 ) ( ON ?auto_107768 ?auto_107767 ) ( not ( = ?auto_107767 ?auto_107768 ) ) ( not ( = ?auto_107767 ?auto_107769 ) ) ( ON ?auto_107762 ?auto_107761 ) ( ON ?auto_107763 ?auto_107762 ) ( ON ?auto_107765 ?auto_107763 ) ( ON ?auto_107764 ?auto_107765 ) ( ON ?auto_107766 ?auto_107764 ) ( ON ?auto_107767 ?auto_107766 ) ( not ( = ?auto_107761 ?auto_107762 ) ) ( not ( = ?auto_107761 ?auto_107763 ) ) ( not ( = ?auto_107761 ?auto_107765 ) ) ( not ( = ?auto_107761 ?auto_107764 ) ) ( not ( = ?auto_107761 ?auto_107766 ) ) ( not ( = ?auto_107761 ?auto_107767 ) ) ( not ( = ?auto_107761 ?auto_107768 ) ) ( not ( = ?auto_107761 ?auto_107769 ) ) ( not ( = ?auto_107762 ?auto_107763 ) ) ( not ( = ?auto_107762 ?auto_107765 ) ) ( not ( = ?auto_107762 ?auto_107764 ) ) ( not ( = ?auto_107762 ?auto_107766 ) ) ( not ( = ?auto_107762 ?auto_107767 ) ) ( not ( = ?auto_107762 ?auto_107768 ) ) ( not ( = ?auto_107762 ?auto_107769 ) ) ( not ( = ?auto_107763 ?auto_107765 ) ) ( not ( = ?auto_107763 ?auto_107764 ) ) ( not ( = ?auto_107763 ?auto_107766 ) ) ( not ( = ?auto_107763 ?auto_107767 ) ) ( not ( = ?auto_107763 ?auto_107768 ) ) ( not ( = ?auto_107763 ?auto_107769 ) ) ( not ( = ?auto_107765 ?auto_107764 ) ) ( not ( = ?auto_107765 ?auto_107766 ) ) ( not ( = ?auto_107765 ?auto_107767 ) ) ( not ( = ?auto_107765 ?auto_107768 ) ) ( not ( = ?auto_107765 ?auto_107769 ) ) ( not ( = ?auto_107764 ?auto_107766 ) ) ( not ( = ?auto_107764 ?auto_107767 ) ) ( not ( = ?auto_107764 ?auto_107768 ) ) ( not ( = ?auto_107764 ?auto_107769 ) ) ( not ( = ?auto_107766 ?auto_107767 ) ) ( not ( = ?auto_107766 ?auto_107768 ) ) ( not ( = ?auto_107766 ?auto_107769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_107767 ?auto_107768 ?auto_107769 )
      ( MAKE-8CRATE-VERIFY ?auto_107761 ?auto_107762 ?auto_107763 ?auto_107765 ?auto_107764 ?auto_107766 ?auto_107767 ?auto_107768 ?auto_107769 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_107837 - SURFACE
      ?auto_107838 - SURFACE
      ?auto_107839 - SURFACE
      ?auto_107841 - SURFACE
      ?auto_107840 - SURFACE
      ?auto_107842 - SURFACE
      ?auto_107843 - SURFACE
      ?auto_107844 - SURFACE
      ?auto_107845 - SURFACE
    )
    :vars
    (
      ?auto_107846 - HOIST
      ?auto_107848 - PLACE
      ?auto_107849 - TRUCK
      ?auto_107847 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_107846 ?auto_107848 ) ( SURFACE-AT ?auto_107844 ?auto_107848 ) ( CLEAR ?auto_107844 ) ( IS-CRATE ?auto_107845 ) ( not ( = ?auto_107844 ?auto_107845 ) ) ( AVAILABLE ?auto_107846 ) ( IN ?auto_107845 ?auto_107849 ) ( ON ?auto_107844 ?auto_107843 ) ( not ( = ?auto_107843 ?auto_107844 ) ) ( not ( = ?auto_107843 ?auto_107845 ) ) ( TRUCK-AT ?auto_107849 ?auto_107847 ) ( not ( = ?auto_107847 ?auto_107848 ) ) ( ON ?auto_107838 ?auto_107837 ) ( ON ?auto_107839 ?auto_107838 ) ( ON ?auto_107841 ?auto_107839 ) ( ON ?auto_107840 ?auto_107841 ) ( ON ?auto_107842 ?auto_107840 ) ( ON ?auto_107843 ?auto_107842 ) ( not ( = ?auto_107837 ?auto_107838 ) ) ( not ( = ?auto_107837 ?auto_107839 ) ) ( not ( = ?auto_107837 ?auto_107841 ) ) ( not ( = ?auto_107837 ?auto_107840 ) ) ( not ( = ?auto_107837 ?auto_107842 ) ) ( not ( = ?auto_107837 ?auto_107843 ) ) ( not ( = ?auto_107837 ?auto_107844 ) ) ( not ( = ?auto_107837 ?auto_107845 ) ) ( not ( = ?auto_107838 ?auto_107839 ) ) ( not ( = ?auto_107838 ?auto_107841 ) ) ( not ( = ?auto_107838 ?auto_107840 ) ) ( not ( = ?auto_107838 ?auto_107842 ) ) ( not ( = ?auto_107838 ?auto_107843 ) ) ( not ( = ?auto_107838 ?auto_107844 ) ) ( not ( = ?auto_107838 ?auto_107845 ) ) ( not ( = ?auto_107839 ?auto_107841 ) ) ( not ( = ?auto_107839 ?auto_107840 ) ) ( not ( = ?auto_107839 ?auto_107842 ) ) ( not ( = ?auto_107839 ?auto_107843 ) ) ( not ( = ?auto_107839 ?auto_107844 ) ) ( not ( = ?auto_107839 ?auto_107845 ) ) ( not ( = ?auto_107841 ?auto_107840 ) ) ( not ( = ?auto_107841 ?auto_107842 ) ) ( not ( = ?auto_107841 ?auto_107843 ) ) ( not ( = ?auto_107841 ?auto_107844 ) ) ( not ( = ?auto_107841 ?auto_107845 ) ) ( not ( = ?auto_107840 ?auto_107842 ) ) ( not ( = ?auto_107840 ?auto_107843 ) ) ( not ( = ?auto_107840 ?auto_107844 ) ) ( not ( = ?auto_107840 ?auto_107845 ) ) ( not ( = ?auto_107842 ?auto_107843 ) ) ( not ( = ?auto_107842 ?auto_107844 ) ) ( not ( = ?auto_107842 ?auto_107845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_107843 ?auto_107844 ?auto_107845 )
      ( MAKE-8CRATE-VERIFY ?auto_107837 ?auto_107838 ?auto_107839 ?auto_107841 ?auto_107840 ?auto_107842 ?auto_107843 ?auto_107844 ?auto_107845 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_107921 - SURFACE
      ?auto_107922 - SURFACE
      ?auto_107923 - SURFACE
      ?auto_107925 - SURFACE
      ?auto_107924 - SURFACE
      ?auto_107926 - SURFACE
      ?auto_107927 - SURFACE
      ?auto_107928 - SURFACE
      ?auto_107929 - SURFACE
    )
    :vars
    (
      ?auto_107934 - HOIST
      ?auto_107932 - PLACE
      ?auto_107930 - TRUCK
      ?auto_107931 - PLACE
      ?auto_107933 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_107934 ?auto_107932 ) ( SURFACE-AT ?auto_107928 ?auto_107932 ) ( CLEAR ?auto_107928 ) ( IS-CRATE ?auto_107929 ) ( not ( = ?auto_107928 ?auto_107929 ) ) ( AVAILABLE ?auto_107934 ) ( ON ?auto_107928 ?auto_107927 ) ( not ( = ?auto_107927 ?auto_107928 ) ) ( not ( = ?auto_107927 ?auto_107929 ) ) ( TRUCK-AT ?auto_107930 ?auto_107931 ) ( not ( = ?auto_107931 ?auto_107932 ) ) ( HOIST-AT ?auto_107933 ?auto_107931 ) ( LIFTING ?auto_107933 ?auto_107929 ) ( not ( = ?auto_107934 ?auto_107933 ) ) ( ON ?auto_107922 ?auto_107921 ) ( ON ?auto_107923 ?auto_107922 ) ( ON ?auto_107925 ?auto_107923 ) ( ON ?auto_107924 ?auto_107925 ) ( ON ?auto_107926 ?auto_107924 ) ( ON ?auto_107927 ?auto_107926 ) ( not ( = ?auto_107921 ?auto_107922 ) ) ( not ( = ?auto_107921 ?auto_107923 ) ) ( not ( = ?auto_107921 ?auto_107925 ) ) ( not ( = ?auto_107921 ?auto_107924 ) ) ( not ( = ?auto_107921 ?auto_107926 ) ) ( not ( = ?auto_107921 ?auto_107927 ) ) ( not ( = ?auto_107921 ?auto_107928 ) ) ( not ( = ?auto_107921 ?auto_107929 ) ) ( not ( = ?auto_107922 ?auto_107923 ) ) ( not ( = ?auto_107922 ?auto_107925 ) ) ( not ( = ?auto_107922 ?auto_107924 ) ) ( not ( = ?auto_107922 ?auto_107926 ) ) ( not ( = ?auto_107922 ?auto_107927 ) ) ( not ( = ?auto_107922 ?auto_107928 ) ) ( not ( = ?auto_107922 ?auto_107929 ) ) ( not ( = ?auto_107923 ?auto_107925 ) ) ( not ( = ?auto_107923 ?auto_107924 ) ) ( not ( = ?auto_107923 ?auto_107926 ) ) ( not ( = ?auto_107923 ?auto_107927 ) ) ( not ( = ?auto_107923 ?auto_107928 ) ) ( not ( = ?auto_107923 ?auto_107929 ) ) ( not ( = ?auto_107925 ?auto_107924 ) ) ( not ( = ?auto_107925 ?auto_107926 ) ) ( not ( = ?auto_107925 ?auto_107927 ) ) ( not ( = ?auto_107925 ?auto_107928 ) ) ( not ( = ?auto_107925 ?auto_107929 ) ) ( not ( = ?auto_107924 ?auto_107926 ) ) ( not ( = ?auto_107924 ?auto_107927 ) ) ( not ( = ?auto_107924 ?auto_107928 ) ) ( not ( = ?auto_107924 ?auto_107929 ) ) ( not ( = ?auto_107926 ?auto_107927 ) ) ( not ( = ?auto_107926 ?auto_107928 ) ) ( not ( = ?auto_107926 ?auto_107929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_107927 ?auto_107928 ?auto_107929 )
      ( MAKE-8CRATE-VERIFY ?auto_107921 ?auto_107922 ?auto_107923 ?auto_107925 ?auto_107924 ?auto_107926 ?auto_107927 ?auto_107928 ?auto_107929 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108013 - SURFACE
      ?auto_108014 - SURFACE
      ?auto_108015 - SURFACE
      ?auto_108017 - SURFACE
      ?auto_108016 - SURFACE
      ?auto_108018 - SURFACE
      ?auto_108019 - SURFACE
      ?auto_108020 - SURFACE
      ?auto_108021 - SURFACE
    )
    :vars
    (
      ?auto_108025 - HOIST
      ?auto_108024 - PLACE
      ?auto_108022 - TRUCK
      ?auto_108027 - PLACE
      ?auto_108026 - HOIST
      ?auto_108023 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_108025 ?auto_108024 ) ( SURFACE-AT ?auto_108020 ?auto_108024 ) ( CLEAR ?auto_108020 ) ( IS-CRATE ?auto_108021 ) ( not ( = ?auto_108020 ?auto_108021 ) ) ( AVAILABLE ?auto_108025 ) ( ON ?auto_108020 ?auto_108019 ) ( not ( = ?auto_108019 ?auto_108020 ) ) ( not ( = ?auto_108019 ?auto_108021 ) ) ( TRUCK-AT ?auto_108022 ?auto_108027 ) ( not ( = ?auto_108027 ?auto_108024 ) ) ( HOIST-AT ?auto_108026 ?auto_108027 ) ( not ( = ?auto_108025 ?auto_108026 ) ) ( AVAILABLE ?auto_108026 ) ( SURFACE-AT ?auto_108021 ?auto_108027 ) ( ON ?auto_108021 ?auto_108023 ) ( CLEAR ?auto_108021 ) ( not ( = ?auto_108020 ?auto_108023 ) ) ( not ( = ?auto_108021 ?auto_108023 ) ) ( not ( = ?auto_108019 ?auto_108023 ) ) ( ON ?auto_108014 ?auto_108013 ) ( ON ?auto_108015 ?auto_108014 ) ( ON ?auto_108017 ?auto_108015 ) ( ON ?auto_108016 ?auto_108017 ) ( ON ?auto_108018 ?auto_108016 ) ( ON ?auto_108019 ?auto_108018 ) ( not ( = ?auto_108013 ?auto_108014 ) ) ( not ( = ?auto_108013 ?auto_108015 ) ) ( not ( = ?auto_108013 ?auto_108017 ) ) ( not ( = ?auto_108013 ?auto_108016 ) ) ( not ( = ?auto_108013 ?auto_108018 ) ) ( not ( = ?auto_108013 ?auto_108019 ) ) ( not ( = ?auto_108013 ?auto_108020 ) ) ( not ( = ?auto_108013 ?auto_108021 ) ) ( not ( = ?auto_108013 ?auto_108023 ) ) ( not ( = ?auto_108014 ?auto_108015 ) ) ( not ( = ?auto_108014 ?auto_108017 ) ) ( not ( = ?auto_108014 ?auto_108016 ) ) ( not ( = ?auto_108014 ?auto_108018 ) ) ( not ( = ?auto_108014 ?auto_108019 ) ) ( not ( = ?auto_108014 ?auto_108020 ) ) ( not ( = ?auto_108014 ?auto_108021 ) ) ( not ( = ?auto_108014 ?auto_108023 ) ) ( not ( = ?auto_108015 ?auto_108017 ) ) ( not ( = ?auto_108015 ?auto_108016 ) ) ( not ( = ?auto_108015 ?auto_108018 ) ) ( not ( = ?auto_108015 ?auto_108019 ) ) ( not ( = ?auto_108015 ?auto_108020 ) ) ( not ( = ?auto_108015 ?auto_108021 ) ) ( not ( = ?auto_108015 ?auto_108023 ) ) ( not ( = ?auto_108017 ?auto_108016 ) ) ( not ( = ?auto_108017 ?auto_108018 ) ) ( not ( = ?auto_108017 ?auto_108019 ) ) ( not ( = ?auto_108017 ?auto_108020 ) ) ( not ( = ?auto_108017 ?auto_108021 ) ) ( not ( = ?auto_108017 ?auto_108023 ) ) ( not ( = ?auto_108016 ?auto_108018 ) ) ( not ( = ?auto_108016 ?auto_108019 ) ) ( not ( = ?auto_108016 ?auto_108020 ) ) ( not ( = ?auto_108016 ?auto_108021 ) ) ( not ( = ?auto_108016 ?auto_108023 ) ) ( not ( = ?auto_108018 ?auto_108019 ) ) ( not ( = ?auto_108018 ?auto_108020 ) ) ( not ( = ?auto_108018 ?auto_108021 ) ) ( not ( = ?auto_108018 ?auto_108023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108019 ?auto_108020 ?auto_108021 )
      ( MAKE-8CRATE-VERIFY ?auto_108013 ?auto_108014 ?auto_108015 ?auto_108017 ?auto_108016 ?auto_108018 ?auto_108019 ?auto_108020 ?auto_108021 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108106 - SURFACE
      ?auto_108107 - SURFACE
      ?auto_108108 - SURFACE
      ?auto_108110 - SURFACE
      ?auto_108109 - SURFACE
      ?auto_108111 - SURFACE
      ?auto_108112 - SURFACE
      ?auto_108113 - SURFACE
      ?auto_108114 - SURFACE
    )
    :vars
    (
      ?auto_108119 - HOIST
      ?auto_108118 - PLACE
      ?auto_108117 - PLACE
      ?auto_108115 - HOIST
      ?auto_108116 - SURFACE
      ?auto_108120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_108119 ?auto_108118 ) ( SURFACE-AT ?auto_108113 ?auto_108118 ) ( CLEAR ?auto_108113 ) ( IS-CRATE ?auto_108114 ) ( not ( = ?auto_108113 ?auto_108114 ) ) ( AVAILABLE ?auto_108119 ) ( ON ?auto_108113 ?auto_108112 ) ( not ( = ?auto_108112 ?auto_108113 ) ) ( not ( = ?auto_108112 ?auto_108114 ) ) ( not ( = ?auto_108117 ?auto_108118 ) ) ( HOIST-AT ?auto_108115 ?auto_108117 ) ( not ( = ?auto_108119 ?auto_108115 ) ) ( AVAILABLE ?auto_108115 ) ( SURFACE-AT ?auto_108114 ?auto_108117 ) ( ON ?auto_108114 ?auto_108116 ) ( CLEAR ?auto_108114 ) ( not ( = ?auto_108113 ?auto_108116 ) ) ( not ( = ?auto_108114 ?auto_108116 ) ) ( not ( = ?auto_108112 ?auto_108116 ) ) ( TRUCK-AT ?auto_108120 ?auto_108118 ) ( ON ?auto_108107 ?auto_108106 ) ( ON ?auto_108108 ?auto_108107 ) ( ON ?auto_108110 ?auto_108108 ) ( ON ?auto_108109 ?auto_108110 ) ( ON ?auto_108111 ?auto_108109 ) ( ON ?auto_108112 ?auto_108111 ) ( not ( = ?auto_108106 ?auto_108107 ) ) ( not ( = ?auto_108106 ?auto_108108 ) ) ( not ( = ?auto_108106 ?auto_108110 ) ) ( not ( = ?auto_108106 ?auto_108109 ) ) ( not ( = ?auto_108106 ?auto_108111 ) ) ( not ( = ?auto_108106 ?auto_108112 ) ) ( not ( = ?auto_108106 ?auto_108113 ) ) ( not ( = ?auto_108106 ?auto_108114 ) ) ( not ( = ?auto_108106 ?auto_108116 ) ) ( not ( = ?auto_108107 ?auto_108108 ) ) ( not ( = ?auto_108107 ?auto_108110 ) ) ( not ( = ?auto_108107 ?auto_108109 ) ) ( not ( = ?auto_108107 ?auto_108111 ) ) ( not ( = ?auto_108107 ?auto_108112 ) ) ( not ( = ?auto_108107 ?auto_108113 ) ) ( not ( = ?auto_108107 ?auto_108114 ) ) ( not ( = ?auto_108107 ?auto_108116 ) ) ( not ( = ?auto_108108 ?auto_108110 ) ) ( not ( = ?auto_108108 ?auto_108109 ) ) ( not ( = ?auto_108108 ?auto_108111 ) ) ( not ( = ?auto_108108 ?auto_108112 ) ) ( not ( = ?auto_108108 ?auto_108113 ) ) ( not ( = ?auto_108108 ?auto_108114 ) ) ( not ( = ?auto_108108 ?auto_108116 ) ) ( not ( = ?auto_108110 ?auto_108109 ) ) ( not ( = ?auto_108110 ?auto_108111 ) ) ( not ( = ?auto_108110 ?auto_108112 ) ) ( not ( = ?auto_108110 ?auto_108113 ) ) ( not ( = ?auto_108110 ?auto_108114 ) ) ( not ( = ?auto_108110 ?auto_108116 ) ) ( not ( = ?auto_108109 ?auto_108111 ) ) ( not ( = ?auto_108109 ?auto_108112 ) ) ( not ( = ?auto_108109 ?auto_108113 ) ) ( not ( = ?auto_108109 ?auto_108114 ) ) ( not ( = ?auto_108109 ?auto_108116 ) ) ( not ( = ?auto_108111 ?auto_108112 ) ) ( not ( = ?auto_108111 ?auto_108113 ) ) ( not ( = ?auto_108111 ?auto_108114 ) ) ( not ( = ?auto_108111 ?auto_108116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108112 ?auto_108113 ?auto_108114 )
      ( MAKE-8CRATE-VERIFY ?auto_108106 ?auto_108107 ?auto_108108 ?auto_108110 ?auto_108109 ?auto_108111 ?auto_108112 ?auto_108113 ?auto_108114 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108199 - SURFACE
      ?auto_108200 - SURFACE
      ?auto_108201 - SURFACE
      ?auto_108203 - SURFACE
      ?auto_108202 - SURFACE
      ?auto_108204 - SURFACE
      ?auto_108205 - SURFACE
      ?auto_108206 - SURFACE
      ?auto_108207 - SURFACE
    )
    :vars
    (
      ?auto_108210 - HOIST
      ?auto_108213 - PLACE
      ?auto_108212 - PLACE
      ?auto_108209 - HOIST
      ?auto_108208 - SURFACE
      ?auto_108211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_108210 ?auto_108213 ) ( IS-CRATE ?auto_108207 ) ( not ( = ?auto_108206 ?auto_108207 ) ) ( not ( = ?auto_108205 ?auto_108206 ) ) ( not ( = ?auto_108205 ?auto_108207 ) ) ( not ( = ?auto_108212 ?auto_108213 ) ) ( HOIST-AT ?auto_108209 ?auto_108212 ) ( not ( = ?auto_108210 ?auto_108209 ) ) ( AVAILABLE ?auto_108209 ) ( SURFACE-AT ?auto_108207 ?auto_108212 ) ( ON ?auto_108207 ?auto_108208 ) ( CLEAR ?auto_108207 ) ( not ( = ?auto_108206 ?auto_108208 ) ) ( not ( = ?auto_108207 ?auto_108208 ) ) ( not ( = ?auto_108205 ?auto_108208 ) ) ( TRUCK-AT ?auto_108211 ?auto_108213 ) ( SURFACE-AT ?auto_108205 ?auto_108213 ) ( CLEAR ?auto_108205 ) ( LIFTING ?auto_108210 ?auto_108206 ) ( IS-CRATE ?auto_108206 ) ( ON ?auto_108200 ?auto_108199 ) ( ON ?auto_108201 ?auto_108200 ) ( ON ?auto_108203 ?auto_108201 ) ( ON ?auto_108202 ?auto_108203 ) ( ON ?auto_108204 ?auto_108202 ) ( ON ?auto_108205 ?auto_108204 ) ( not ( = ?auto_108199 ?auto_108200 ) ) ( not ( = ?auto_108199 ?auto_108201 ) ) ( not ( = ?auto_108199 ?auto_108203 ) ) ( not ( = ?auto_108199 ?auto_108202 ) ) ( not ( = ?auto_108199 ?auto_108204 ) ) ( not ( = ?auto_108199 ?auto_108205 ) ) ( not ( = ?auto_108199 ?auto_108206 ) ) ( not ( = ?auto_108199 ?auto_108207 ) ) ( not ( = ?auto_108199 ?auto_108208 ) ) ( not ( = ?auto_108200 ?auto_108201 ) ) ( not ( = ?auto_108200 ?auto_108203 ) ) ( not ( = ?auto_108200 ?auto_108202 ) ) ( not ( = ?auto_108200 ?auto_108204 ) ) ( not ( = ?auto_108200 ?auto_108205 ) ) ( not ( = ?auto_108200 ?auto_108206 ) ) ( not ( = ?auto_108200 ?auto_108207 ) ) ( not ( = ?auto_108200 ?auto_108208 ) ) ( not ( = ?auto_108201 ?auto_108203 ) ) ( not ( = ?auto_108201 ?auto_108202 ) ) ( not ( = ?auto_108201 ?auto_108204 ) ) ( not ( = ?auto_108201 ?auto_108205 ) ) ( not ( = ?auto_108201 ?auto_108206 ) ) ( not ( = ?auto_108201 ?auto_108207 ) ) ( not ( = ?auto_108201 ?auto_108208 ) ) ( not ( = ?auto_108203 ?auto_108202 ) ) ( not ( = ?auto_108203 ?auto_108204 ) ) ( not ( = ?auto_108203 ?auto_108205 ) ) ( not ( = ?auto_108203 ?auto_108206 ) ) ( not ( = ?auto_108203 ?auto_108207 ) ) ( not ( = ?auto_108203 ?auto_108208 ) ) ( not ( = ?auto_108202 ?auto_108204 ) ) ( not ( = ?auto_108202 ?auto_108205 ) ) ( not ( = ?auto_108202 ?auto_108206 ) ) ( not ( = ?auto_108202 ?auto_108207 ) ) ( not ( = ?auto_108202 ?auto_108208 ) ) ( not ( = ?auto_108204 ?auto_108205 ) ) ( not ( = ?auto_108204 ?auto_108206 ) ) ( not ( = ?auto_108204 ?auto_108207 ) ) ( not ( = ?auto_108204 ?auto_108208 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108205 ?auto_108206 ?auto_108207 )
      ( MAKE-8CRATE-VERIFY ?auto_108199 ?auto_108200 ?auto_108201 ?auto_108203 ?auto_108202 ?auto_108204 ?auto_108205 ?auto_108206 ?auto_108207 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108292 - SURFACE
      ?auto_108293 - SURFACE
      ?auto_108294 - SURFACE
      ?auto_108296 - SURFACE
      ?auto_108295 - SURFACE
      ?auto_108297 - SURFACE
      ?auto_108298 - SURFACE
      ?auto_108299 - SURFACE
      ?auto_108300 - SURFACE
    )
    :vars
    (
      ?auto_108304 - HOIST
      ?auto_108306 - PLACE
      ?auto_108305 - PLACE
      ?auto_108303 - HOIST
      ?auto_108301 - SURFACE
      ?auto_108302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_108304 ?auto_108306 ) ( IS-CRATE ?auto_108300 ) ( not ( = ?auto_108299 ?auto_108300 ) ) ( not ( = ?auto_108298 ?auto_108299 ) ) ( not ( = ?auto_108298 ?auto_108300 ) ) ( not ( = ?auto_108305 ?auto_108306 ) ) ( HOIST-AT ?auto_108303 ?auto_108305 ) ( not ( = ?auto_108304 ?auto_108303 ) ) ( AVAILABLE ?auto_108303 ) ( SURFACE-AT ?auto_108300 ?auto_108305 ) ( ON ?auto_108300 ?auto_108301 ) ( CLEAR ?auto_108300 ) ( not ( = ?auto_108299 ?auto_108301 ) ) ( not ( = ?auto_108300 ?auto_108301 ) ) ( not ( = ?auto_108298 ?auto_108301 ) ) ( TRUCK-AT ?auto_108302 ?auto_108306 ) ( SURFACE-AT ?auto_108298 ?auto_108306 ) ( CLEAR ?auto_108298 ) ( IS-CRATE ?auto_108299 ) ( AVAILABLE ?auto_108304 ) ( IN ?auto_108299 ?auto_108302 ) ( ON ?auto_108293 ?auto_108292 ) ( ON ?auto_108294 ?auto_108293 ) ( ON ?auto_108296 ?auto_108294 ) ( ON ?auto_108295 ?auto_108296 ) ( ON ?auto_108297 ?auto_108295 ) ( ON ?auto_108298 ?auto_108297 ) ( not ( = ?auto_108292 ?auto_108293 ) ) ( not ( = ?auto_108292 ?auto_108294 ) ) ( not ( = ?auto_108292 ?auto_108296 ) ) ( not ( = ?auto_108292 ?auto_108295 ) ) ( not ( = ?auto_108292 ?auto_108297 ) ) ( not ( = ?auto_108292 ?auto_108298 ) ) ( not ( = ?auto_108292 ?auto_108299 ) ) ( not ( = ?auto_108292 ?auto_108300 ) ) ( not ( = ?auto_108292 ?auto_108301 ) ) ( not ( = ?auto_108293 ?auto_108294 ) ) ( not ( = ?auto_108293 ?auto_108296 ) ) ( not ( = ?auto_108293 ?auto_108295 ) ) ( not ( = ?auto_108293 ?auto_108297 ) ) ( not ( = ?auto_108293 ?auto_108298 ) ) ( not ( = ?auto_108293 ?auto_108299 ) ) ( not ( = ?auto_108293 ?auto_108300 ) ) ( not ( = ?auto_108293 ?auto_108301 ) ) ( not ( = ?auto_108294 ?auto_108296 ) ) ( not ( = ?auto_108294 ?auto_108295 ) ) ( not ( = ?auto_108294 ?auto_108297 ) ) ( not ( = ?auto_108294 ?auto_108298 ) ) ( not ( = ?auto_108294 ?auto_108299 ) ) ( not ( = ?auto_108294 ?auto_108300 ) ) ( not ( = ?auto_108294 ?auto_108301 ) ) ( not ( = ?auto_108296 ?auto_108295 ) ) ( not ( = ?auto_108296 ?auto_108297 ) ) ( not ( = ?auto_108296 ?auto_108298 ) ) ( not ( = ?auto_108296 ?auto_108299 ) ) ( not ( = ?auto_108296 ?auto_108300 ) ) ( not ( = ?auto_108296 ?auto_108301 ) ) ( not ( = ?auto_108295 ?auto_108297 ) ) ( not ( = ?auto_108295 ?auto_108298 ) ) ( not ( = ?auto_108295 ?auto_108299 ) ) ( not ( = ?auto_108295 ?auto_108300 ) ) ( not ( = ?auto_108295 ?auto_108301 ) ) ( not ( = ?auto_108297 ?auto_108298 ) ) ( not ( = ?auto_108297 ?auto_108299 ) ) ( not ( = ?auto_108297 ?auto_108300 ) ) ( not ( = ?auto_108297 ?auto_108301 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108298 ?auto_108299 ?auto_108300 )
      ( MAKE-8CRATE-VERIFY ?auto_108292 ?auto_108293 ?auto_108294 ?auto_108296 ?auto_108295 ?auto_108297 ?auto_108298 ?auto_108299 ?auto_108300 ) )
  )

)

