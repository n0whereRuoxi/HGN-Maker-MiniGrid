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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185806 - SURFACE
      ?auto_185807 - SURFACE
    )
    :vars
    (
      ?auto_185808 - HOIST
      ?auto_185809 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185808 ?auto_185809 ) ( SURFACE-AT ?auto_185806 ?auto_185809 ) ( CLEAR ?auto_185806 ) ( LIFTING ?auto_185808 ?auto_185807 ) ( IS-CRATE ?auto_185807 ) ( not ( = ?auto_185806 ?auto_185807 ) ) )
    :subtasks
    ( ( !DROP ?auto_185808 ?auto_185807 ?auto_185806 ?auto_185809 )
      ( MAKE-1CRATE-VERIFY ?auto_185806 ?auto_185807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185810 - SURFACE
      ?auto_185811 - SURFACE
    )
    :vars
    (
      ?auto_185812 - HOIST
      ?auto_185813 - PLACE
      ?auto_185814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_185812 ?auto_185813 ) ( SURFACE-AT ?auto_185810 ?auto_185813 ) ( CLEAR ?auto_185810 ) ( IS-CRATE ?auto_185811 ) ( not ( = ?auto_185810 ?auto_185811 ) ) ( TRUCK-AT ?auto_185814 ?auto_185813 ) ( AVAILABLE ?auto_185812 ) ( IN ?auto_185811 ?auto_185814 ) )
    :subtasks
    ( ( !UNLOAD ?auto_185812 ?auto_185811 ?auto_185814 ?auto_185813 )
      ( MAKE-1CRATE ?auto_185810 ?auto_185811 )
      ( MAKE-1CRATE-VERIFY ?auto_185810 ?auto_185811 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185815 - SURFACE
      ?auto_185816 - SURFACE
    )
    :vars
    (
      ?auto_185818 - HOIST
      ?auto_185817 - PLACE
      ?auto_185819 - TRUCK
      ?auto_185820 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185818 ?auto_185817 ) ( SURFACE-AT ?auto_185815 ?auto_185817 ) ( CLEAR ?auto_185815 ) ( IS-CRATE ?auto_185816 ) ( not ( = ?auto_185815 ?auto_185816 ) ) ( AVAILABLE ?auto_185818 ) ( IN ?auto_185816 ?auto_185819 ) ( TRUCK-AT ?auto_185819 ?auto_185820 ) ( not ( = ?auto_185820 ?auto_185817 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_185819 ?auto_185820 ?auto_185817 )
      ( MAKE-1CRATE ?auto_185815 ?auto_185816 )
      ( MAKE-1CRATE-VERIFY ?auto_185815 ?auto_185816 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185821 - SURFACE
      ?auto_185822 - SURFACE
    )
    :vars
    (
      ?auto_185825 - HOIST
      ?auto_185823 - PLACE
      ?auto_185826 - TRUCK
      ?auto_185824 - PLACE
      ?auto_185827 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_185825 ?auto_185823 ) ( SURFACE-AT ?auto_185821 ?auto_185823 ) ( CLEAR ?auto_185821 ) ( IS-CRATE ?auto_185822 ) ( not ( = ?auto_185821 ?auto_185822 ) ) ( AVAILABLE ?auto_185825 ) ( TRUCK-AT ?auto_185826 ?auto_185824 ) ( not ( = ?auto_185824 ?auto_185823 ) ) ( HOIST-AT ?auto_185827 ?auto_185824 ) ( LIFTING ?auto_185827 ?auto_185822 ) ( not ( = ?auto_185825 ?auto_185827 ) ) )
    :subtasks
    ( ( !LOAD ?auto_185827 ?auto_185822 ?auto_185826 ?auto_185824 )
      ( MAKE-1CRATE ?auto_185821 ?auto_185822 )
      ( MAKE-1CRATE-VERIFY ?auto_185821 ?auto_185822 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185828 - SURFACE
      ?auto_185829 - SURFACE
    )
    :vars
    (
      ?auto_185834 - HOIST
      ?auto_185830 - PLACE
      ?auto_185833 - TRUCK
      ?auto_185832 - PLACE
      ?auto_185831 - HOIST
      ?auto_185835 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185834 ?auto_185830 ) ( SURFACE-AT ?auto_185828 ?auto_185830 ) ( CLEAR ?auto_185828 ) ( IS-CRATE ?auto_185829 ) ( not ( = ?auto_185828 ?auto_185829 ) ) ( AVAILABLE ?auto_185834 ) ( TRUCK-AT ?auto_185833 ?auto_185832 ) ( not ( = ?auto_185832 ?auto_185830 ) ) ( HOIST-AT ?auto_185831 ?auto_185832 ) ( not ( = ?auto_185834 ?auto_185831 ) ) ( AVAILABLE ?auto_185831 ) ( SURFACE-AT ?auto_185829 ?auto_185832 ) ( ON ?auto_185829 ?auto_185835 ) ( CLEAR ?auto_185829 ) ( not ( = ?auto_185828 ?auto_185835 ) ) ( not ( = ?auto_185829 ?auto_185835 ) ) )
    :subtasks
    ( ( !LIFT ?auto_185831 ?auto_185829 ?auto_185835 ?auto_185832 )
      ( MAKE-1CRATE ?auto_185828 ?auto_185829 )
      ( MAKE-1CRATE-VERIFY ?auto_185828 ?auto_185829 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185836 - SURFACE
      ?auto_185837 - SURFACE
    )
    :vars
    (
      ?auto_185839 - HOIST
      ?auto_185840 - PLACE
      ?auto_185841 - PLACE
      ?auto_185838 - HOIST
      ?auto_185842 - SURFACE
      ?auto_185843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_185839 ?auto_185840 ) ( SURFACE-AT ?auto_185836 ?auto_185840 ) ( CLEAR ?auto_185836 ) ( IS-CRATE ?auto_185837 ) ( not ( = ?auto_185836 ?auto_185837 ) ) ( AVAILABLE ?auto_185839 ) ( not ( = ?auto_185841 ?auto_185840 ) ) ( HOIST-AT ?auto_185838 ?auto_185841 ) ( not ( = ?auto_185839 ?auto_185838 ) ) ( AVAILABLE ?auto_185838 ) ( SURFACE-AT ?auto_185837 ?auto_185841 ) ( ON ?auto_185837 ?auto_185842 ) ( CLEAR ?auto_185837 ) ( not ( = ?auto_185836 ?auto_185842 ) ) ( not ( = ?auto_185837 ?auto_185842 ) ) ( TRUCK-AT ?auto_185843 ?auto_185840 ) )
    :subtasks
    ( ( !DRIVE ?auto_185843 ?auto_185840 ?auto_185841 )
      ( MAKE-1CRATE ?auto_185836 ?auto_185837 )
      ( MAKE-1CRATE-VERIFY ?auto_185836 ?auto_185837 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_185853 - SURFACE
      ?auto_185854 - SURFACE
      ?auto_185855 - SURFACE
    )
    :vars
    (
      ?auto_185857 - HOIST
      ?auto_185856 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185857 ?auto_185856 ) ( SURFACE-AT ?auto_185854 ?auto_185856 ) ( CLEAR ?auto_185854 ) ( LIFTING ?auto_185857 ?auto_185855 ) ( IS-CRATE ?auto_185855 ) ( not ( = ?auto_185854 ?auto_185855 ) ) ( ON ?auto_185854 ?auto_185853 ) ( not ( = ?auto_185853 ?auto_185854 ) ) ( not ( = ?auto_185853 ?auto_185855 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_185854 ?auto_185855 )
      ( MAKE-2CRATE-VERIFY ?auto_185853 ?auto_185854 ?auto_185855 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_185863 - SURFACE
      ?auto_185864 - SURFACE
      ?auto_185865 - SURFACE
    )
    :vars
    (
      ?auto_185868 - HOIST
      ?auto_185866 - PLACE
      ?auto_185867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_185868 ?auto_185866 ) ( SURFACE-AT ?auto_185864 ?auto_185866 ) ( CLEAR ?auto_185864 ) ( IS-CRATE ?auto_185865 ) ( not ( = ?auto_185864 ?auto_185865 ) ) ( TRUCK-AT ?auto_185867 ?auto_185866 ) ( AVAILABLE ?auto_185868 ) ( IN ?auto_185865 ?auto_185867 ) ( ON ?auto_185864 ?auto_185863 ) ( not ( = ?auto_185863 ?auto_185864 ) ) ( not ( = ?auto_185863 ?auto_185865 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_185864 ?auto_185865 )
      ( MAKE-2CRATE-VERIFY ?auto_185863 ?auto_185864 ?auto_185865 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185869 - SURFACE
      ?auto_185870 - SURFACE
    )
    :vars
    (
      ?auto_185872 - HOIST
      ?auto_185874 - PLACE
      ?auto_185871 - TRUCK
      ?auto_185873 - SURFACE
      ?auto_185875 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185872 ?auto_185874 ) ( SURFACE-AT ?auto_185869 ?auto_185874 ) ( CLEAR ?auto_185869 ) ( IS-CRATE ?auto_185870 ) ( not ( = ?auto_185869 ?auto_185870 ) ) ( AVAILABLE ?auto_185872 ) ( IN ?auto_185870 ?auto_185871 ) ( ON ?auto_185869 ?auto_185873 ) ( not ( = ?auto_185873 ?auto_185869 ) ) ( not ( = ?auto_185873 ?auto_185870 ) ) ( TRUCK-AT ?auto_185871 ?auto_185875 ) ( not ( = ?auto_185875 ?auto_185874 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_185871 ?auto_185875 ?auto_185874 )
      ( MAKE-2CRATE ?auto_185873 ?auto_185869 ?auto_185870 )
      ( MAKE-1CRATE-VERIFY ?auto_185869 ?auto_185870 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_185876 - SURFACE
      ?auto_185877 - SURFACE
      ?auto_185878 - SURFACE
    )
    :vars
    (
      ?auto_185881 - HOIST
      ?auto_185880 - PLACE
      ?auto_185882 - TRUCK
      ?auto_185879 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185881 ?auto_185880 ) ( SURFACE-AT ?auto_185877 ?auto_185880 ) ( CLEAR ?auto_185877 ) ( IS-CRATE ?auto_185878 ) ( not ( = ?auto_185877 ?auto_185878 ) ) ( AVAILABLE ?auto_185881 ) ( IN ?auto_185878 ?auto_185882 ) ( ON ?auto_185877 ?auto_185876 ) ( not ( = ?auto_185876 ?auto_185877 ) ) ( not ( = ?auto_185876 ?auto_185878 ) ) ( TRUCK-AT ?auto_185882 ?auto_185879 ) ( not ( = ?auto_185879 ?auto_185880 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_185877 ?auto_185878 )
      ( MAKE-2CRATE-VERIFY ?auto_185876 ?auto_185877 ?auto_185878 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185883 - SURFACE
      ?auto_185884 - SURFACE
    )
    :vars
    (
      ?auto_185885 - HOIST
      ?auto_185889 - PLACE
      ?auto_185886 - SURFACE
      ?auto_185887 - TRUCK
      ?auto_185888 - PLACE
      ?auto_185890 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_185885 ?auto_185889 ) ( SURFACE-AT ?auto_185883 ?auto_185889 ) ( CLEAR ?auto_185883 ) ( IS-CRATE ?auto_185884 ) ( not ( = ?auto_185883 ?auto_185884 ) ) ( AVAILABLE ?auto_185885 ) ( ON ?auto_185883 ?auto_185886 ) ( not ( = ?auto_185886 ?auto_185883 ) ) ( not ( = ?auto_185886 ?auto_185884 ) ) ( TRUCK-AT ?auto_185887 ?auto_185888 ) ( not ( = ?auto_185888 ?auto_185889 ) ) ( HOIST-AT ?auto_185890 ?auto_185888 ) ( LIFTING ?auto_185890 ?auto_185884 ) ( not ( = ?auto_185885 ?auto_185890 ) ) )
    :subtasks
    ( ( !LOAD ?auto_185890 ?auto_185884 ?auto_185887 ?auto_185888 )
      ( MAKE-2CRATE ?auto_185886 ?auto_185883 ?auto_185884 )
      ( MAKE-1CRATE-VERIFY ?auto_185883 ?auto_185884 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_185891 - SURFACE
      ?auto_185892 - SURFACE
      ?auto_185893 - SURFACE
    )
    :vars
    (
      ?auto_185896 - HOIST
      ?auto_185895 - PLACE
      ?auto_185897 - TRUCK
      ?auto_185894 - PLACE
      ?auto_185898 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_185896 ?auto_185895 ) ( SURFACE-AT ?auto_185892 ?auto_185895 ) ( CLEAR ?auto_185892 ) ( IS-CRATE ?auto_185893 ) ( not ( = ?auto_185892 ?auto_185893 ) ) ( AVAILABLE ?auto_185896 ) ( ON ?auto_185892 ?auto_185891 ) ( not ( = ?auto_185891 ?auto_185892 ) ) ( not ( = ?auto_185891 ?auto_185893 ) ) ( TRUCK-AT ?auto_185897 ?auto_185894 ) ( not ( = ?auto_185894 ?auto_185895 ) ) ( HOIST-AT ?auto_185898 ?auto_185894 ) ( LIFTING ?auto_185898 ?auto_185893 ) ( not ( = ?auto_185896 ?auto_185898 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_185892 ?auto_185893 )
      ( MAKE-2CRATE-VERIFY ?auto_185891 ?auto_185892 ?auto_185893 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185899 - SURFACE
      ?auto_185900 - SURFACE
    )
    :vars
    (
      ?auto_185904 - HOIST
      ?auto_185902 - PLACE
      ?auto_185905 - SURFACE
      ?auto_185903 - TRUCK
      ?auto_185906 - PLACE
      ?auto_185901 - HOIST
      ?auto_185907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185904 ?auto_185902 ) ( SURFACE-AT ?auto_185899 ?auto_185902 ) ( CLEAR ?auto_185899 ) ( IS-CRATE ?auto_185900 ) ( not ( = ?auto_185899 ?auto_185900 ) ) ( AVAILABLE ?auto_185904 ) ( ON ?auto_185899 ?auto_185905 ) ( not ( = ?auto_185905 ?auto_185899 ) ) ( not ( = ?auto_185905 ?auto_185900 ) ) ( TRUCK-AT ?auto_185903 ?auto_185906 ) ( not ( = ?auto_185906 ?auto_185902 ) ) ( HOIST-AT ?auto_185901 ?auto_185906 ) ( not ( = ?auto_185904 ?auto_185901 ) ) ( AVAILABLE ?auto_185901 ) ( SURFACE-AT ?auto_185900 ?auto_185906 ) ( ON ?auto_185900 ?auto_185907 ) ( CLEAR ?auto_185900 ) ( not ( = ?auto_185899 ?auto_185907 ) ) ( not ( = ?auto_185900 ?auto_185907 ) ) ( not ( = ?auto_185905 ?auto_185907 ) ) )
    :subtasks
    ( ( !LIFT ?auto_185901 ?auto_185900 ?auto_185907 ?auto_185906 )
      ( MAKE-2CRATE ?auto_185905 ?auto_185899 ?auto_185900 )
      ( MAKE-1CRATE-VERIFY ?auto_185899 ?auto_185900 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_185908 - SURFACE
      ?auto_185909 - SURFACE
      ?auto_185910 - SURFACE
    )
    :vars
    (
      ?auto_185911 - HOIST
      ?auto_185915 - PLACE
      ?auto_185912 - TRUCK
      ?auto_185914 - PLACE
      ?auto_185916 - HOIST
      ?auto_185913 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185911 ?auto_185915 ) ( SURFACE-AT ?auto_185909 ?auto_185915 ) ( CLEAR ?auto_185909 ) ( IS-CRATE ?auto_185910 ) ( not ( = ?auto_185909 ?auto_185910 ) ) ( AVAILABLE ?auto_185911 ) ( ON ?auto_185909 ?auto_185908 ) ( not ( = ?auto_185908 ?auto_185909 ) ) ( not ( = ?auto_185908 ?auto_185910 ) ) ( TRUCK-AT ?auto_185912 ?auto_185914 ) ( not ( = ?auto_185914 ?auto_185915 ) ) ( HOIST-AT ?auto_185916 ?auto_185914 ) ( not ( = ?auto_185911 ?auto_185916 ) ) ( AVAILABLE ?auto_185916 ) ( SURFACE-AT ?auto_185910 ?auto_185914 ) ( ON ?auto_185910 ?auto_185913 ) ( CLEAR ?auto_185910 ) ( not ( = ?auto_185909 ?auto_185913 ) ) ( not ( = ?auto_185910 ?auto_185913 ) ) ( not ( = ?auto_185908 ?auto_185913 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_185909 ?auto_185910 )
      ( MAKE-2CRATE-VERIFY ?auto_185908 ?auto_185909 ?auto_185910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185917 - SURFACE
      ?auto_185918 - SURFACE
    )
    :vars
    (
      ?auto_185922 - HOIST
      ?auto_185923 - PLACE
      ?auto_185924 - SURFACE
      ?auto_185920 - PLACE
      ?auto_185919 - HOIST
      ?auto_185921 - SURFACE
      ?auto_185925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_185922 ?auto_185923 ) ( SURFACE-AT ?auto_185917 ?auto_185923 ) ( CLEAR ?auto_185917 ) ( IS-CRATE ?auto_185918 ) ( not ( = ?auto_185917 ?auto_185918 ) ) ( AVAILABLE ?auto_185922 ) ( ON ?auto_185917 ?auto_185924 ) ( not ( = ?auto_185924 ?auto_185917 ) ) ( not ( = ?auto_185924 ?auto_185918 ) ) ( not ( = ?auto_185920 ?auto_185923 ) ) ( HOIST-AT ?auto_185919 ?auto_185920 ) ( not ( = ?auto_185922 ?auto_185919 ) ) ( AVAILABLE ?auto_185919 ) ( SURFACE-AT ?auto_185918 ?auto_185920 ) ( ON ?auto_185918 ?auto_185921 ) ( CLEAR ?auto_185918 ) ( not ( = ?auto_185917 ?auto_185921 ) ) ( not ( = ?auto_185918 ?auto_185921 ) ) ( not ( = ?auto_185924 ?auto_185921 ) ) ( TRUCK-AT ?auto_185925 ?auto_185923 ) )
    :subtasks
    ( ( !DRIVE ?auto_185925 ?auto_185923 ?auto_185920 )
      ( MAKE-2CRATE ?auto_185924 ?auto_185917 ?auto_185918 )
      ( MAKE-1CRATE-VERIFY ?auto_185917 ?auto_185918 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_185926 - SURFACE
      ?auto_185927 - SURFACE
      ?auto_185928 - SURFACE
    )
    :vars
    (
      ?auto_185930 - HOIST
      ?auto_185929 - PLACE
      ?auto_185934 - PLACE
      ?auto_185933 - HOIST
      ?auto_185932 - SURFACE
      ?auto_185931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_185930 ?auto_185929 ) ( SURFACE-AT ?auto_185927 ?auto_185929 ) ( CLEAR ?auto_185927 ) ( IS-CRATE ?auto_185928 ) ( not ( = ?auto_185927 ?auto_185928 ) ) ( AVAILABLE ?auto_185930 ) ( ON ?auto_185927 ?auto_185926 ) ( not ( = ?auto_185926 ?auto_185927 ) ) ( not ( = ?auto_185926 ?auto_185928 ) ) ( not ( = ?auto_185934 ?auto_185929 ) ) ( HOIST-AT ?auto_185933 ?auto_185934 ) ( not ( = ?auto_185930 ?auto_185933 ) ) ( AVAILABLE ?auto_185933 ) ( SURFACE-AT ?auto_185928 ?auto_185934 ) ( ON ?auto_185928 ?auto_185932 ) ( CLEAR ?auto_185928 ) ( not ( = ?auto_185927 ?auto_185932 ) ) ( not ( = ?auto_185928 ?auto_185932 ) ) ( not ( = ?auto_185926 ?auto_185932 ) ) ( TRUCK-AT ?auto_185931 ?auto_185929 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_185927 ?auto_185928 )
      ( MAKE-2CRATE-VERIFY ?auto_185926 ?auto_185927 ?auto_185928 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185935 - SURFACE
      ?auto_185936 - SURFACE
    )
    :vars
    (
      ?auto_185943 - HOIST
      ?auto_185937 - PLACE
      ?auto_185941 - SURFACE
      ?auto_185939 - PLACE
      ?auto_185942 - HOIST
      ?auto_185938 - SURFACE
      ?auto_185940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_185943 ?auto_185937 ) ( IS-CRATE ?auto_185936 ) ( not ( = ?auto_185935 ?auto_185936 ) ) ( not ( = ?auto_185941 ?auto_185935 ) ) ( not ( = ?auto_185941 ?auto_185936 ) ) ( not ( = ?auto_185939 ?auto_185937 ) ) ( HOIST-AT ?auto_185942 ?auto_185939 ) ( not ( = ?auto_185943 ?auto_185942 ) ) ( AVAILABLE ?auto_185942 ) ( SURFACE-AT ?auto_185936 ?auto_185939 ) ( ON ?auto_185936 ?auto_185938 ) ( CLEAR ?auto_185936 ) ( not ( = ?auto_185935 ?auto_185938 ) ) ( not ( = ?auto_185936 ?auto_185938 ) ) ( not ( = ?auto_185941 ?auto_185938 ) ) ( TRUCK-AT ?auto_185940 ?auto_185937 ) ( SURFACE-AT ?auto_185941 ?auto_185937 ) ( CLEAR ?auto_185941 ) ( LIFTING ?auto_185943 ?auto_185935 ) ( IS-CRATE ?auto_185935 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_185941 ?auto_185935 )
      ( MAKE-2CRATE ?auto_185941 ?auto_185935 ?auto_185936 )
      ( MAKE-1CRATE-VERIFY ?auto_185935 ?auto_185936 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_185944 - SURFACE
      ?auto_185945 - SURFACE
      ?auto_185946 - SURFACE
    )
    :vars
    (
      ?auto_185951 - HOIST
      ?auto_185948 - PLACE
      ?auto_185952 - PLACE
      ?auto_185950 - HOIST
      ?auto_185949 - SURFACE
      ?auto_185947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_185951 ?auto_185948 ) ( IS-CRATE ?auto_185946 ) ( not ( = ?auto_185945 ?auto_185946 ) ) ( not ( = ?auto_185944 ?auto_185945 ) ) ( not ( = ?auto_185944 ?auto_185946 ) ) ( not ( = ?auto_185952 ?auto_185948 ) ) ( HOIST-AT ?auto_185950 ?auto_185952 ) ( not ( = ?auto_185951 ?auto_185950 ) ) ( AVAILABLE ?auto_185950 ) ( SURFACE-AT ?auto_185946 ?auto_185952 ) ( ON ?auto_185946 ?auto_185949 ) ( CLEAR ?auto_185946 ) ( not ( = ?auto_185945 ?auto_185949 ) ) ( not ( = ?auto_185946 ?auto_185949 ) ) ( not ( = ?auto_185944 ?auto_185949 ) ) ( TRUCK-AT ?auto_185947 ?auto_185948 ) ( SURFACE-AT ?auto_185944 ?auto_185948 ) ( CLEAR ?auto_185944 ) ( LIFTING ?auto_185951 ?auto_185945 ) ( IS-CRATE ?auto_185945 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_185945 ?auto_185946 )
      ( MAKE-2CRATE-VERIFY ?auto_185944 ?auto_185945 ?auto_185946 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_185953 - SURFACE
      ?auto_185954 - SURFACE
    )
    :vars
    (
      ?auto_185960 - HOIST
      ?auto_185959 - PLACE
      ?auto_185961 - SURFACE
      ?auto_185956 - PLACE
      ?auto_185957 - HOIST
      ?auto_185958 - SURFACE
      ?auto_185955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_185960 ?auto_185959 ) ( IS-CRATE ?auto_185954 ) ( not ( = ?auto_185953 ?auto_185954 ) ) ( not ( = ?auto_185961 ?auto_185953 ) ) ( not ( = ?auto_185961 ?auto_185954 ) ) ( not ( = ?auto_185956 ?auto_185959 ) ) ( HOIST-AT ?auto_185957 ?auto_185956 ) ( not ( = ?auto_185960 ?auto_185957 ) ) ( AVAILABLE ?auto_185957 ) ( SURFACE-AT ?auto_185954 ?auto_185956 ) ( ON ?auto_185954 ?auto_185958 ) ( CLEAR ?auto_185954 ) ( not ( = ?auto_185953 ?auto_185958 ) ) ( not ( = ?auto_185954 ?auto_185958 ) ) ( not ( = ?auto_185961 ?auto_185958 ) ) ( TRUCK-AT ?auto_185955 ?auto_185959 ) ( SURFACE-AT ?auto_185961 ?auto_185959 ) ( CLEAR ?auto_185961 ) ( IS-CRATE ?auto_185953 ) ( AVAILABLE ?auto_185960 ) ( IN ?auto_185953 ?auto_185955 ) )
    :subtasks
    ( ( !UNLOAD ?auto_185960 ?auto_185953 ?auto_185955 ?auto_185959 )
      ( MAKE-2CRATE ?auto_185961 ?auto_185953 ?auto_185954 )
      ( MAKE-1CRATE-VERIFY ?auto_185953 ?auto_185954 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_185962 - SURFACE
      ?auto_185963 - SURFACE
      ?auto_185964 - SURFACE
    )
    :vars
    (
      ?auto_185967 - HOIST
      ?auto_185969 - PLACE
      ?auto_185970 - PLACE
      ?auto_185968 - HOIST
      ?auto_185965 - SURFACE
      ?auto_185966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_185967 ?auto_185969 ) ( IS-CRATE ?auto_185964 ) ( not ( = ?auto_185963 ?auto_185964 ) ) ( not ( = ?auto_185962 ?auto_185963 ) ) ( not ( = ?auto_185962 ?auto_185964 ) ) ( not ( = ?auto_185970 ?auto_185969 ) ) ( HOIST-AT ?auto_185968 ?auto_185970 ) ( not ( = ?auto_185967 ?auto_185968 ) ) ( AVAILABLE ?auto_185968 ) ( SURFACE-AT ?auto_185964 ?auto_185970 ) ( ON ?auto_185964 ?auto_185965 ) ( CLEAR ?auto_185964 ) ( not ( = ?auto_185963 ?auto_185965 ) ) ( not ( = ?auto_185964 ?auto_185965 ) ) ( not ( = ?auto_185962 ?auto_185965 ) ) ( TRUCK-AT ?auto_185966 ?auto_185969 ) ( SURFACE-AT ?auto_185962 ?auto_185969 ) ( CLEAR ?auto_185962 ) ( IS-CRATE ?auto_185963 ) ( AVAILABLE ?auto_185967 ) ( IN ?auto_185963 ?auto_185966 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_185963 ?auto_185964 )
      ( MAKE-2CRATE-VERIFY ?auto_185962 ?auto_185963 ?auto_185964 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_186007 - SURFACE
      ?auto_186008 - SURFACE
    )
    :vars
    (
      ?auto_186013 - HOIST
      ?auto_186009 - PLACE
      ?auto_186011 - SURFACE
      ?auto_186015 - PLACE
      ?auto_186014 - HOIST
      ?auto_186010 - SURFACE
      ?auto_186012 - TRUCK
      ?auto_186016 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186013 ?auto_186009 ) ( SURFACE-AT ?auto_186007 ?auto_186009 ) ( CLEAR ?auto_186007 ) ( IS-CRATE ?auto_186008 ) ( not ( = ?auto_186007 ?auto_186008 ) ) ( AVAILABLE ?auto_186013 ) ( ON ?auto_186007 ?auto_186011 ) ( not ( = ?auto_186011 ?auto_186007 ) ) ( not ( = ?auto_186011 ?auto_186008 ) ) ( not ( = ?auto_186015 ?auto_186009 ) ) ( HOIST-AT ?auto_186014 ?auto_186015 ) ( not ( = ?auto_186013 ?auto_186014 ) ) ( AVAILABLE ?auto_186014 ) ( SURFACE-AT ?auto_186008 ?auto_186015 ) ( ON ?auto_186008 ?auto_186010 ) ( CLEAR ?auto_186008 ) ( not ( = ?auto_186007 ?auto_186010 ) ) ( not ( = ?auto_186008 ?auto_186010 ) ) ( not ( = ?auto_186011 ?auto_186010 ) ) ( TRUCK-AT ?auto_186012 ?auto_186016 ) ( not ( = ?auto_186016 ?auto_186009 ) ) ( not ( = ?auto_186015 ?auto_186016 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_186012 ?auto_186016 ?auto_186009 )
      ( MAKE-1CRATE ?auto_186007 ?auto_186008 )
      ( MAKE-1CRATE-VERIFY ?auto_186007 ?auto_186008 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186046 - SURFACE
      ?auto_186047 - SURFACE
      ?auto_186048 - SURFACE
      ?auto_186049 - SURFACE
    )
    :vars
    (
      ?auto_186050 - HOIST
      ?auto_186051 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186050 ?auto_186051 ) ( SURFACE-AT ?auto_186048 ?auto_186051 ) ( CLEAR ?auto_186048 ) ( LIFTING ?auto_186050 ?auto_186049 ) ( IS-CRATE ?auto_186049 ) ( not ( = ?auto_186048 ?auto_186049 ) ) ( ON ?auto_186047 ?auto_186046 ) ( ON ?auto_186048 ?auto_186047 ) ( not ( = ?auto_186046 ?auto_186047 ) ) ( not ( = ?auto_186046 ?auto_186048 ) ) ( not ( = ?auto_186046 ?auto_186049 ) ) ( not ( = ?auto_186047 ?auto_186048 ) ) ( not ( = ?auto_186047 ?auto_186049 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186048 ?auto_186049 )
      ( MAKE-3CRATE-VERIFY ?auto_186046 ?auto_186047 ?auto_186048 ?auto_186049 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186063 - SURFACE
      ?auto_186064 - SURFACE
      ?auto_186065 - SURFACE
      ?auto_186066 - SURFACE
    )
    :vars
    (
      ?auto_186067 - HOIST
      ?auto_186069 - PLACE
      ?auto_186068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186067 ?auto_186069 ) ( SURFACE-AT ?auto_186065 ?auto_186069 ) ( CLEAR ?auto_186065 ) ( IS-CRATE ?auto_186066 ) ( not ( = ?auto_186065 ?auto_186066 ) ) ( TRUCK-AT ?auto_186068 ?auto_186069 ) ( AVAILABLE ?auto_186067 ) ( IN ?auto_186066 ?auto_186068 ) ( ON ?auto_186065 ?auto_186064 ) ( not ( = ?auto_186064 ?auto_186065 ) ) ( not ( = ?auto_186064 ?auto_186066 ) ) ( ON ?auto_186064 ?auto_186063 ) ( not ( = ?auto_186063 ?auto_186064 ) ) ( not ( = ?auto_186063 ?auto_186065 ) ) ( not ( = ?auto_186063 ?auto_186066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186064 ?auto_186065 ?auto_186066 )
      ( MAKE-3CRATE-VERIFY ?auto_186063 ?auto_186064 ?auto_186065 ?auto_186066 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186084 - SURFACE
      ?auto_186085 - SURFACE
      ?auto_186086 - SURFACE
      ?auto_186087 - SURFACE
    )
    :vars
    (
      ?auto_186090 - HOIST
      ?auto_186089 - PLACE
      ?auto_186088 - TRUCK
      ?auto_186091 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186090 ?auto_186089 ) ( SURFACE-AT ?auto_186086 ?auto_186089 ) ( CLEAR ?auto_186086 ) ( IS-CRATE ?auto_186087 ) ( not ( = ?auto_186086 ?auto_186087 ) ) ( AVAILABLE ?auto_186090 ) ( IN ?auto_186087 ?auto_186088 ) ( ON ?auto_186086 ?auto_186085 ) ( not ( = ?auto_186085 ?auto_186086 ) ) ( not ( = ?auto_186085 ?auto_186087 ) ) ( TRUCK-AT ?auto_186088 ?auto_186091 ) ( not ( = ?auto_186091 ?auto_186089 ) ) ( ON ?auto_186085 ?auto_186084 ) ( not ( = ?auto_186084 ?auto_186085 ) ) ( not ( = ?auto_186084 ?auto_186086 ) ) ( not ( = ?auto_186084 ?auto_186087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186085 ?auto_186086 ?auto_186087 )
      ( MAKE-3CRATE-VERIFY ?auto_186084 ?auto_186085 ?auto_186086 ?auto_186087 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186108 - SURFACE
      ?auto_186109 - SURFACE
      ?auto_186110 - SURFACE
      ?auto_186111 - SURFACE
    )
    :vars
    (
      ?auto_186114 - HOIST
      ?auto_186115 - PLACE
      ?auto_186112 - TRUCK
      ?auto_186113 - PLACE
      ?auto_186116 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_186114 ?auto_186115 ) ( SURFACE-AT ?auto_186110 ?auto_186115 ) ( CLEAR ?auto_186110 ) ( IS-CRATE ?auto_186111 ) ( not ( = ?auto_186110 ?auto_186111 ) ) ( AVAILABLE ?auto_186114 ) ( ON ?auto_186110 ?auto_186109 ) ( not ( = ?auto_186109 ?auto_186110 ) ) ( not ( = ?auto_186109 ?auto_186111 ) ) ( TRUCK-AT ?auto_186112 ?auto_186113 ) ( not ( = ?auto_186113 ?auto_186115 ) ) ( HOIST-AT ?auto_186116 ?auto_186113 ) ( LIFTING ?auto_186116 ?auto_186111 ) ( not ( = ?auto_186114 ?auto_186116 ) ) ( ON ?auto_186109 ?auto_186108 ) ( not ( = ?auto_186108 ?auto_186109 ) ) ( not ( = ?auto_186108 ?auto_186110 ) ) ( not ( = ?auto_186108 ?auto_186111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186109 ?auto_186110 ?auto_186111 )
      ( MAKE-3CRATE-VERIFY ?auto_186108 ?auto_186109 ?auto_186110 ?auto_186111 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186135 - SURFACE
      ?auto_186136 - SURFACE
      ?auto_186137 - SURFACE
      ?auto_186138 - SURFACE
    )
    :vars
    (
      ?auto_186140 - HOIST
      ?auto_186141 - PLACE
      ?auto_186139 - TRUCK
      ?auto_186143 - PLACE
      ?auto_186144 - HOIST
      ?auto_186142 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186140 ?auto_186141 ) ( SURFACE-AT ?auto_186137 ?auto_186141 ) ( CLEAR ?auto_186137 ) ( IS-CRATE ?auto_186138 ) ( not ( = ?auto_186137 ?auto_186138 ) ) ( AVAILABLE ?auto_186140 ) ( ON ?auto_186137 ?auto_186136 ) ( not ( = ?auto_186136 ?auto_186137 ) ) ( not ( = ?auto_186136 ?auto_186138 ) ) ( TRUCK-AT ?auto_186139 ?auto_186143 ) ( not ( = ?auto_186143 ?auto_186141 ) ) ( HOIST-AT ?auto_186144 ?auto_186143 ) ( not ( = ?auto_186140 ?auto_186144 ) ) ( AVAILABLE ?auto_186144 ) ( SURFACE-AT ?auto_186138 ?auto_186143 ) ( ON ?auto_186138 ?auto_186142 ) ( CLEAR ?auto_186138 ) ( not ( = ?auto_186137 ?auto_186142 ) ) ( not ( = ?auto_186138 ?auto_186142 ) ) ( not ( = ?auto_186136 ?auto_186142 ) ) ( ON ?auto_186136 ?auto_186135 ) ( not ( = ?auto_186135 ?auto_186136 ) ) ( not ( = ?auto_186135 ?auto_186137 ) ) ( not ( = ?auto_186135 ?auto_186138 ) ) ( not ( = ?auto_186135 ?auto_186142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186136 ?auto_186137 ?auto_186138 )
      ( MAKE-3CRATE-VERIFY ?auto_186135 ?auto_186136 ?auto_186137 ?auto_186138 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186163 - SURFACE
      ?auto_186164 - SURFACE
      ?auto_186165 - SURFACE
      ?auto_186166 - SURFACE
    )
    :vars
    (
      ?auto_186168 - HOIST
      ?auto_186171 - PLACE
      ?auto_186169 - PLACE
      ?auto_186170 - HOIST
      ?auto_186172 - SURFACE
      ?auto_186167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186168 ?auto_186171 ) ( SURFACE-AT ?auto_186165 ?auto_186171 ) ( CLEAR ?auto_186165 ) ( IS-CRATE ?auto_186166 ) ( not ( = ?auto_186165 ?auto_186166 ) ) ( AVAILABLE ?auto_186168 ) ( ON ?auto_186165 ?auto_186164 ) ( not ( = ?auto_186164 ?auto_186165 ) ) ( not ( = ?auto_186164 ?auto_186166 ) ) ( not ( = ?auto_186169 ?auto_186171 ) ) ( HOIST-AT ?auto_186170 ?auto_186169 ) ( not ( = ?auto_186168 ?auto_186170 ) ) ( AVAILABLE ?auto_186170 ) ( SURFACE-AT ?auto_186166 ?auto_186169 ) ( ON ?auto_186166 ?auto_186172 ) ( CLEAR ?auto_186166 ) ( not ( = ?auto_186165 ?auto_186172 ) ) ( not ( = ?auto_186166 ?auto_186172 ) ) ( not ( = ?auto_186164 ?auto_186172 ) ) ( TRUCK-AT ?auto_186167 ?auto_186171 ) ( ON ?auto_186164 ?auto_186163 ) ( not ( = ?auto_186163 ?auto_186164 ) ) ( not ( = ?auto_186163 ?auto_186165 ) ) ( not ( = ?auto_186163 ?auto_186166 ) ) ( not ( = ?auto_186163 ?auto_186172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186164 ?auto_186165 ?auto_186166 )
      ( MAKE-3CRATE-VERIFY ?auto_186163 ?auto_186164 ?auto_186165 ?auto_186166 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186191 - SURFACE
      ?auto_186192 - SURFACE
      ?auto_186193 - SURFACE
      ?auto_186194 - SURFACE
    )
    :vars
    (
      ?auto_186197 - HOIST
      ?auto_186196 - PLACE
      ?auto_186199 - PLACE
      ?auto_186195 - HOIST
      ?auto_186198 - SURFACE
      ?auto_186200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186197 ?auto_186196 ) ( IS-CRATE ?auto_186194 ) ( not ( = ?auto_186193 ?auto_186194 ) ) ( not ( = ?auto_186192 ?auto_186193 ) ) ( not ( = ?auto_186192 ?auto_186194 ) ) ( not ( = ?auto_186199 ?auto_186196 ) ) ( HOIST-AT ?auto_186195 ?auto_186199 ) ( not ( = ?auto_186197 ?auto_186195 ) ) ( AVAILABLE ?auto_186195 ) ( SURFACE-AT ?auto_186194 ?auto_186199 ) ( ON ?auto_186194 ?auto_186198 ) ( CLEAR ?auto_186194 ) ( not ( = ?auto_186193 ?auto_186198 ) ) ( not ( = ?auto_186194 ?auto_186198 ) ) ( not ( = ?auto_186192 ?auto_186198 ) ) ( TRUCK-AT ?auto_186200 ?auto_186196 ) ( SURFACE-AT ?auto_186192 ?auto_186196 ) ( CLEAR ?auto_186192 ) ( LIFTING ?auto_186197 ?auto_186193 ) ( IS-CRATE ?auto_186193 ) ( ON ?auto_186192 ?auto_186191 ) ( not ( = ?auto_186191 ?auto_186192 ) ) ( not ( = ?auto_186191 ?auto_186193 ) ) ( not ( = ?auto_186191 ?auto_186194 ) ) ( not ( = ?auto_186191 ?auto_186198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186192 ?auto_186193 ?auto_186194 )
      ( MAKE-3CRATE-VERIFY ?auto_186191 ?auto_186192 ?auto_186193 ?auto_186194 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_186219 - SURFACE
      ?auto_186220 - SURFACE
      ?auto_186221 - SURFACE
      ?auto_186222 - SURFACE
    )
    :vars
    (
      ?auto_186226 - HOIST
      ?auto_186225 - PLACE
      ?auto_186224 - PLACE
      ?auto_186228 - HOIST
      ?auto_186223 - SURFACE
      ?auto_186227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186226 ?auto_186225 ) ( IS-CRATE ?auto_186222 ) ( not ( = ?auto_186221 ?auto_186222 ) ) ( not ( = ?auto_186220 ?auto_186221 ) ) ( not ( = ?auto_186220 ?auto_186222 ) ) ( not ( = ?auto_186224 ?auto_186225 ) ) ( HOIST-AT ?auto_186228 ?auto_186224 ) ( not ( = ?auto_186226 ?auto_186228 ) ) ( AVAILABLE ?auto_186228 ) ( SURFACE-AT ?auto_186222 ?auto_186224 ) ( ON ?auto_186222 ?auto_186223 ) ( CLEAR ?auto_186222 ) ( not ( = ?auto_186221 ?auto_186223 ) ) ( not ( = ?auto_186222 ?auto_186223 ) ) ( not ( = ?auto_186220 ?auto_186223 ) ) ( TRUCK-AT ?auto_186227 ?auto_186225 ) ( SURFACE-AT ?auto_186220 ?auto_186225 ) ( CLEAR ?auto_186220 ) ( IS-CRATE ?auto_186221 ) ( AVAILABLE ?auto_186226 ) ( IN ?auto_186221 ?auto_186227 ) ( ON ?auto_186220 ?auto_186219 ) ( not ( = ?auto_186219 ?auto_186220 ) ) ( not ( = ?auto_186219 ?auto_186221 ) ) ( not ( = ?auto_186219 ?auto_186222 ) ) ( not ( = ?auto_186219 ?auto_186223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186220 ?auto_186221 ?auto_186222 )
      ( MAKE-3CRATE-VERIFY ?auto_186219 ?auto_186220 ?auto_186221 ?auto_186222 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186510 - SURFACE
      ?auto_186511 - SURFACE
      ?auto_186512 - SURFACE
      ?auto_186514 - SURFACE
      ?auto_186513 - SURFACE
    )
    :vars
    (
      ?auto_186515 - HOIST
      ?auto_186516 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186515 ?auto_186516 ) ( SURFACE-AT ?auto_186514 ?auto_186516 ) ( CLEAR ?auto_186514 ) ( LIFTING ?auto_186515 ?auto_186513 ) ( IS-CRATE ?auto_186513 ) ( not ( = ?auto_186514 ?auto_186513 ) ) ( ON ?auto_186511 ?auto_186510 ) ( ON ?auto_186512 ?auto_186511 ) ( ON ?auto_186514 ?auto_186512 ) ( not ( = ?auto_186510 ?auto_186511 ) ) ( not ( = ?auto_186510 ?auto_186512 ) ) ( not ( = ?auto_186510 ?auto_186514 ) ) ( not ( = ?auto_186510 ?auto_186513 ) ) ( not ( = ?auto_186511 ?auto_186512 ) ) ( not ( = ?auto_186511 ?auto_186514 ) ) ( not ( = ?auto_186511 ?auto_186513 ) ) ( not ( = ?auto_186512 ?auto_186514 ) ) ( not ( = ?auto_186512 ?auto_186513 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_186514 ?auto_186513 )
      ( MAKE-4CRATE-VERIFY ?auto_186510 ?auto_186511 ?auto_186512 ?auto_186514 ?auto_186513 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186535 - SURFACE
      ?auto_186536 - SURFACE
      ?auto_186537 - SURFACE
      ?auto_186539 - SURFACE
      ?auto_186538 - SURFACE
    )
    :vars
    (
      ?auto_186540 - HOIST
      ?auto_186542 - PLACE
      ?auto_186541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186540 ?auto_186542 ) ( SURFACE-AT ?auto_186539 ?auto_186542 ) ( CLEAR ?auto_186539 ) ( IS-CRATE ?auto_186538 ) ( not ( = ?auto_186539 ?auto_186538 ) ) ( TRUCK-AT ?auto_186541 ?auto_186542 ) ( AVAILABLE ?auto_186540 ) ( IN ?auto_186538 ?auto_186541 ) ( ON ?auto_186539 ?auto_186537 ) ( not ( = ?auto_186537 ?auto_186539 ) ) ( not ( = ?auto_186537 ?auto_186538 ) ) ( ON ?auto_186536 ?auto_186535 ) ( ON ?auto_186537 ?auto_186536 ) ( not ( = ?auto_186535 ?auto_186536 ) ) ( not ( = ?auto_186535 ?auto_186537 ) ) ( not ( = ?auto_186535 ?auto_186539 ) ) ( not ( = ?auto_186535 ?auto_186538 ) ) ( not ( = ?auto_186536 ?auto_186537 ) ) ( not ( = ?auto_186536 ?auto_186539 ) ) ( not ( = ?auto_186536 ?auto_186538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186537 ?auto_186539 ?auto_186538 )
      ( MAKE-4CRATE-VERIFY ?auto_186535 ?auto_186536 ?auto_186537 ?auto_186539 ?auto_186538 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186565 - SURFACE
      ?auto_186566 - SURFACE
      ?auto_186567 - SURFACE
      ?auto_186569 - SURFACE
      ?auto_186568 - SURFACE
    )
    :vars
    (
      ?auto_186570 - HOIST
      ?auto_186573 - PLACE
      ?auto_186572 - TRUCK
      ?auto_186571 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186570 ?auto_186573 ) ( SURFACE-AT ?auto_186569 ?auto_186573 ) ( CLEAR ?auto_186569 ) ( IS-CRATE ?auto_186568 ) ( not ( = ?auto_186569 ?auto_186568 ) ) ( AVAILABLE ?auto_186570 ) ( IN ?auto_186568 ?auto_186572 ) ( ON ?auto_186569 ?auto_186567 ) ( not ( = ?auto_186567 ?auto_186569 ) ) ( not ( = ?auto_186567 ?auto_186568 ) ) ( TRUCK-AT ?auto_186572 ?auto_186571 ) ( not ( = ?auto_186571 ?auto_186573 ) ) ( ON ?auto_186566 ?auto_186565 ) ( ON ?auto_186567 ?auto_186566 ) ( not ( = ?auto_186565 ?auto_186566 ) ) ( not ( = ?auto_186565 ?auto_186567 ) ) ( not ( = ?auto_186565 ?auto_186569 ) ) ( not ( = ?auto_186565 ?auto_186568 ) ) ( not ( = ?auto_186566 ?auto_186567 ) ) ( not ( = ?auto_186566 ?auto_186569 ) ) ( not ( = ?auto_186566 ?auto_186568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186567 ?auto_186569 ?auto_186568 )
      ( MAKE-4CRATE-VERIFY ?auto_186565 ?auto_186566 ?auto_186567 ?auto_186569 ?auto_186568 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186599 - SURFACE
      ?auto_186600 - SURFACE
      ?auto_186601 - SURFACE
      ?auto_186603 - SURFACE
      ?auto_186602 - SURFACE
    )
    :vars
    (
      ?auto_186608 - HOIST
      ?auto_186604 - PLACE
      ?auto_186606 - TRUCK
      ?auto_186607 - PLACE
      ?auto_186605 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_186608 ?auto_186604 ) ( SURFACE-AT ?auto_186603 ?auto_186604 ) ( CLEAR ?auto_186603 ) ( IS-CRATE ?auto_186602 ) ( not ( = ?auto_186603 ?auto_186602 ) ) ( AVAILABLE ?auto_186608 ) ( ON ?auto_186603 ?auto_186601 ) ( not ( = ?auto_186601 ?auto_186603 ) ) ( not ( = ?auto_186601 ?auto_186602 ) ) ( TRUCK-AT ?auto_186606 ?auto_186607 ) ( not ( = ?auto_186607 ?auto_186604 ) ) ( HOIST-AT ?auto_186605 ?auto_186607 ) ( LIFTING ?auto_186605 ?auto_186602 ) ( not ( = ?auto_186608 ?auto_186605 ) ) ( ON ?auto_186600 ?auto_186599 ) ( ON ?auto_186601 ?auto_186600 ) ( not ( = ?auto_186599 ?auto_186600 ) ) ( not ( = ?auto_186599 ?auto_186601 ) ) ( not ( = ?auto_186599 ?auto_186603 ) ) ( not ( = ?auto_186599 ?auto_186602 ) ) ( not ( = ?auto_186600 ?auto_186601 ) ) ( not ( = ?auto_186600 ?auto_186603 ) ) ( not ( = ?auto_186600 ?auto_186602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186601 ?auto_186603 ?auto_186602 )
      ( MAKE-4CRATE-VERIFY ?auto_186599 ?auto_186600 ?auto_186601 ?auto_186603 ?auto_186602 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186637 - SURFACE
      ?auto_186638 - SURFACE
      ?auto_186639 - SURFACE
      ?auto_186641 - SURFACE
      ?auto_186640 - SURFACE
    )
    :vars
    (
      ?auto_186647 - HOIST
      ?auto_186642 - PLACE
      ?auto_186646 - TRUCK
      ?auto_186643 - PLACE
      ?auto_186645 - HOIST
      ?auto_186644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_186647 ?auto_186642 ) ( SURFACE-AT ?auto_186641 ?auto_186642 ) ( CLEAR ?auto_186641 ) ( IS-CRATE ?auto_186640 ) ( not ( = ?auto_186641 ?auto_186640 ) ) ( AVAILABLE ?auto_186647 ) ( ON ?auto_186641 ?auto_186639 ) ( not ( = ?auto_186639 ?auto_186641 ) ) ( not ( = ?auto_186639 ?auto_186640 ) ) ( TRUCK-AT ?auto_186646 ?auto_186643 ) ( not ( = ?auto_186643 ?auto_186642 ) ) ( HOIST-AT ?auto_186645 ?auto_186643 ) ( not ( = ?auto_186647 ?auto_186645 ) ) ( AVAILABLE ?auto_186645 ) ( SURFACE-AT ?auto_186640 ?auto_186643 ) ( ON ?auto_186640 ?auto_186644 ) ( CLEAR ?auto_186640 ) ( not ( = ?auto_186641 ?auto_186644 ) ) ( not ( = ?auto_186640 ?auto_186644 ) ) ( not ( = ?auto_186639 ?auto_186644 ) ) ( ON ?auto_186638 ?auto_186637 ) ( ON ?auto_186639 ?auto_186638 ) ( not ( = ?auto_186637 ?auto_186638 ) ) ( not ( = ?auto_186637 ?auto_186639 ) ) ( not ( = ?auto_186637 ?auto_186641 ) ) ( not ( = ?auto_186637 ?auto_186640 ) ) ( not ( = ?auto_186637 ?auto_186644 ) ) ( not ( = ?auto_186638 ?auto_186639 ) ) ( not ( = ?auto_186638 ?auto_186641 ) ) ( not ( = ?auto_186638 ?auto_186640 ) ) ( not ( = ?auto_186638 ?auto_186644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186639 ?auto_186641 ?auto_186640 )
      ( MAKE-4CRATE-VERIFY ?auto_186637 ?auto_186638 ?auto_186639 ?auto_186641 ?auto_186640 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186676 - SURFACE
      ?auto_186677 - SURFACE
      ?auto_186678 - SURFACE
      ?auto_186680 - SURFACE
      ?auto_186679 - SURFACE
    )
    :vars
    (
      ?auto_186684 - HOIST
      ?auto_186683 - PLACE
      ?auto_186686 - PLACE
      ?auto_186682 - HOIST
      ?auto_186685 - SURFACE
      ?auto_186681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186684 ?auto_186683 ) ( SURFACE-AT ?auto_186680 ?auto_186683 ) ( CLEAR ?auto_186680 ) ( IS-CRATE ?auto_186679 ) ( not ( = ?auto_186680 ?auto_186679 ) ) ( AVAILABLE ?auto_186684 ) ( ON ?auto_186680 ?auto_186678 ) ( not ( = ?auto_186678 ?auto_186680 ) ) ( not ( = ?auto_186678 ?auto_186679 ) ) ( not ( = ?auto_186686 ?auto_186683 ) ) ( HOIST-AT ?auto_186682 ?auto_186686 ) ( not ( = ?auto_186684 ?auto_186682 ) ) ( AVAILABLE ?auto_186682 ) ( SURFACE-AT ?auto_186679 ?auto_186686 ) ( ON ?auto_186679 ?auto_186685 ) ( CLEAR ?auto_186679 ) ( not ( = ?auto_186680 ?auto_186685 ) ) ( not ( = ?auto_186679 ?auto_186685 ) ) ( not ( = ?auto_186678 ?auto_186685 ) ) ( TRUCK-AT ?auto_186681 ?auto_186683 ) ( ON ?auto_186677 ?auto_186676 ) ( ON ?auto_186678 ?auto_186677 ) ( not ( = ?auto_186676 ?auto_186677 ) ) ( not ( = ?auto_186676 ?auto_186678 ) ) ( not ( = ?auto_186676 ?auto_186680 ) ) ( not ( = ?auto_186676 ?auto_186679 ) ) ( not ( = ?auto_186676 ?auto_186685 ) ) ( not ( = ?auto_186677 ?auto_186678 ) ) ( not ( = ?auto_186677 ?auto_186680 ) ) ( not ( = ?auto_186677 ?auto_186679 ) ) ( not ( = ?auto_186677 ?auto_186685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186678 ?auto_186680 ?auto_186679 )
      ( MAKE-4CRATE-VERIFY ?auto_186676 ?auto_186677 ?auto_186678 ?auto_186680 ?auto_186679 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186715 - SURFACE
      ?auto_186716 - SURFACE
      ?auto_186717 - SURFACE
      ?auto_186719 - SURFACE
      ?auto_186718 - SURFACE
    )
    :vars
    (
      ?auto_186721 - HOIST
      ?auto_186723 - PLACE
      ?auto_186720 - PLACE
      ?auto_186725 - HOIST
      ?auto_186722 - SURFACE
      ?auto_186724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186721 ?auto_186723 ) ( IS-CRATE ?auto_186718 ) ( not ( = ?auto_186719 ?auto_186718 ) ) ( not ( = ?auto_186717 ?auto_186719 ) ) ( not ( = ?auto_186717 ?auto_186718 ) ) ( not ( = ?auto_186720 ?auto_186723 ) ) ( HOIST-AT ?auto_186725 ?auto_186720 ) ( not ( = ?auto_186721 ?auto_186725 ) ) ( AVAILABLE ?auto_186725 ) ( SURFACE-AT ?auto_186718 ?auto_186720 ) ( ON ?auto_186718 ?auto_186722 ) ( CLEAR ?auto_186718 ) ( not ( = ?auto_186719 ?auto_186722 ) ) ( not ( = ?auto_186718 ?auto_186722 ) ) ( not ( = ?auto_186717 ?auto_186722 ) ) ( TRUCK-AT ?auto_186724 ?auto_186723 ) ( SURFACE-AT ?auto_186717 ?auto_186723 ) ( CLEAR ?auto_186717 ) ( LIFTING ?auto_186721 ?auto_186719 ) ( IS-CRATE ?auto_186719 ) ( ON ?auto_186716 ?auto_186715 ) ( ON ?auto_186717 ?auto_186716 ) ( not ( = ?auto_186715 ?auto_186716 ) ) ( not ( = ?auto_186715 ?auto_186717 ) ) ( not ( = ?auto_186715 ?auto_186719 ) ) ( not ( = ?auto_186715 ?auto_186718 ) ) ( not ( = ?auto_186715 ?auto_186722 ) ) ( not ( = ?auto_186716 ?auto_186717 ) ) ( not ( = ?auto_186716 ?auto_186719 ) ) ( not ( = ?auto_186716 ?auto_186718 ) ) ( not ( = ?auto_186716 ?auto_186722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186717 ?auto_186719 ?auto_186718 )
      ( MAKE-4CRATE-VERIFY ?auto_186715 ?auto_186716 ?auto_186717 ?auto_186719 ?auto_186718 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_186754 - SURFACE
      ?auto_186755 - SURFACE
      ?auto_186756 - SURFACE
      ?auto_186758 - SURFACE
      ?auto_186757 - SURFACE
    )
    :vars
    (
      ?auto_186763 - HOIST
      ?auto_186762 - PLACE
      ?auto_186761 - PLACE
      ?auto_186764 - HOIST
      ?auto_186759 - SURFACE
      ?auto_186760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_186763 ?auto_186762 ) ( IS-CRATE ?auto_186757 ) ( not ( = ?auto_186758 ?auto_186757 ) ) ( not ( = ?auto_186756 ?auto_186758 ) ) ( not ( = ?auto_186756 ?auto_186757 ) ) ( not ( = ?auto_186761 ?auto_186762 ) ) ( HOIST-AT ?auto_186764 ?auto_186761 ) ( not ( = ?auto_186763 ?auto_186764 ) ) ( AVAILABLE ?auto_186764 ) ( SURFACE-AT ?auto_186757 ?auto_186761 ) ( ON ?auto_186757 ?auto_186759 ) ( CLEAR ?auto_186757 ) ( not ( = ?auto_186758 ?auto_186759 ) ) ( not ( = ?auto_186757 ?auto_186759 ) ) ( not ( = ?auto_186756 ?auto_186759 ) ) ( TRUCK-AT ?auto_186760 ?auto_186762 ) ( SURFACE-AT ?auto_186756 ?auto_186762 ) ( CLEAR ?auto_186756 ) ( IS-CRATE ?auto_186758 ) ( AVAILABLE ?auto_186763 ) ( IN ?auto_186758 ?auto_186760 ) ( ON ?auto_186755 ?auto_186754 ) ( ON ?auto_186756 ?auto_186755 ) ( not ( = ?auto_186754 ?auto_186755 ) ) ( not ( = ?auto_186754 ?auto_186756 ) ) ( not ( = ?auto_186754 ?auto_186758 ) ) ( not ( = ?auto_186754 ?auto_186757 ) ) ( not ( = ?auto_186754 ?auto_186759 ) ) ( not ( = ?auto_186755 ?auto_186756 ) ) ( not ( = ?auto_186755 ?auto_186758 ) ) ( not ( = ?auto_186755 ?auto_186757 ) ) ( not ( = ?auto_186755 ?auto_186759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_186756 ?auto_186758 ?auto_186757 )
      ( MAKE-4CRATE-VERIFY ?auto_186754 ?auto_186755 ?auto_186756 ?auto_186758 ?auto_186757 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187414 - SURFACE
      ?auto_187415 - SURFACE
      ?auto_187416 - SURFACE
      ?auto_187418 - SURFACE
      ?auto_187417 - SURFACE
      ?auto_187419 - SURFACE
    )
    :vars
    (
      ?auto_187420 - HOIST
      ?auto_187421 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187420 ?auto_187421 ) ( SURFACE-AT ?auto_187417 ?auto_187421 ) ( CLEAR ?auto_187417 ) ( LIFTING ?auto_187420 ?auto_187419 ) ( IS-CRATE ?auto_187419 ) ( not ( = ?auto_187417 ?auto_187419 ) ) ( ON ?auto_187415 ?auto_187414 ) ( ON ?auto_187416 ?auto_187415 ) ( ON ?auto_187418 ?auto_187416 ) ( ON ?auto_187417 ?auto_187418 ) ( not ( = ?auto_187414 ?auto_187415 ) ) ( not ( = ?auto_187414 ?auto_187416 ) ) ( not ( = ?auto_187414 ?auto_187418 ) ) ( not ( = ?auto_187414 ?auto_187417 ) ) ( not ( = ?auto_187414 ?auto_187419 ) ) ( not ( = ?auto_187415 ?auto_187416 ) ) ( not ( = ?auto_187415 ?auto_187418 ) ) ( not ( = ?auto_187415 ?auto_187417 ) ) ( not ( = ?auto_187415 ?auto_187419 ) ) ( not ( = ?auto_187416 ?auto_187418 ) ) ( not ( = ?auto_187416 ?auto_187417 ) ) ( not ( = ?auto_187416 ?auto_187419 ) ) ( not ( = ?auto_187418 ?auto_187417 ) ) ( not ( = ?auto_187418 ?auto_187419 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_187417 ?auto_187419 )
      ( MAKE-5CRATE-VERIFY ?auto_187414 ?auto_187415 ?auto_187416 ?auto_187418 ?auto_187417 ?auto_187419 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187448 - SURFACE
      ?auto_187449 - SURFACE
      ?auto_187450 - SURFACE
      ?auto_187452 - SURFACE
      ?auto_187451 - SURFACE
      ?auto_187453 - SURFACE
    )
    :vars
    (
      ?auto_187456 - HOIST
      ?auto_187455 - PLACE
      ?auto_187454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187456 ?auto_187455 ) ( SURFACE-AT ?auto_187451 ?auto_187455 ) ( CLEAR ?auto_187451 ) ( IS-CRATE ?auto_187453 ) ( not ( = ?auto_187451 ?auto_187453 ) ) ( TRUCK-AT ?auto_187454 ?auto_187455 ) ( AVAILABLE ?auto_187456 ) ( IN ?auto_187453 ?auto_187454 ) ( ON ?auto_187451 ?auto_187452 ) ( not ( = ?auto_187452 ?auto_187451 ) ) ( not ( = ?auto_187452 ?auto_187453 ) ) ( ON ?auto_187449 ?auto_187448 ) ( ON ?auto_187450 ?auto_187449 ) ( ON ?auto_187452 ?auto_187450 ) ( not ( = ?auto_187448 ?auto_187449 ) ) ( not ( = ?auto_187448 ?auto_187450 ) ) ( not ( = ?auto_187448 ?auto_187452 ) ) ( not ( = ?auto_187448 ?auto_187451 ) ) ( not ( = ?auto_187448 ?auto_187453 ) ) ( not ( = ?auto_187449 ?auto_187450 ) ) ( not ( = ?auto_187449 ?auto_187452 ) ) ( not ( = ?auto_187449 ?auto_187451 ) ) ( not ( = ?auto_187449 ?auto_187453 ) ) ( not ( = ?auto_187450 ?auto_187452 ) ) ( not ( = ?auto_187450 ?auto_187451 ) ) ( not ( = ?auto_187450 ?auto_187453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187452 ?auto_187451 ?auto_187453 )
      ( MAKE-5CRATE-VERIFY ?auto_187448 ?auto_187449 ?auto_187450 ?auto_187452 ?auto_187451 ?auto_187453 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187488 - SURFACE
      ?auto_187489 - SURFACE
      ?auto_187490 - SURFACE
      ?auto_187492 - SURFACE
      ?auto_187491 - SURFACE
      ?auto_187493 - SURFACE
    )
    :vars
    (
      ?auto_187496 - HOIST
      ?auto_187497 - PLACE
      ?auto_187495 - TRUCK
      ?auto_187494 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187496 ?auto_187497 ) ( SURFACE-AT ?auto_187491 ?auto_187497 ) ( CLEAR ?auto_187491 ) ( IS-CRATE ?auto_187493 ) ( not ( = ?auto_187491 ?auto_187493 ) ) ( AVAILABLE ?auto_187496 ) ( IN ?auto_187493 ?auto_187495 ) ( ON ?auto_187491 ?auto_187492 ) ( not ( = ?auto_187492 ?auto_187491 ) ) ( not ( = ?auto_187492 ?auto_187493 ) ) ( TRUCK-AT ?auto_187495 ?auto_187494 ) ( not ( = ?auto_187494 ?auto_187497 ) ) ( ON ?auto_187489 ?auto_187488 ) ( ON ?auto_187490 ?auto_187489 ) ( ON ?auto_187492 ?auto_187490 ) ( not ( = ?auto_187488 ?auto_187489 ) ) ( not ( = ?auto_187488 ?auto_187490 ) ) ( not ( = ?auto_187488 ?auto_187492 ) ) ( not ( = ?auto_187488 ?auto_187491 ) ) ( not ( = ?auto_187488 ?auto_187493 ) ) ( not ( = ?auto_187489 ?auto_187490 ) ) ( not ( = ?auto_187489 ?auto_187492 ) ) ( not ( = ?auto_187489 ?auto_187491 ) ) ( not ( = ?auto_187489 ?auto_187493 ) ) ( not ( = ?auto_187490 ?auto_187492 ) ) ( not ( = ?auto_187490 ?auto_187491 ) ) ( not ( = ?auto_187490 ?auto_187493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187492 ?auto_187491 ?auto_187493 )
      ( MAKE-5CRATE-VERIFY ?auto_187488 ?auto_187489 ?auto_187490 ?auto_187492 ?auto_187491 ?auto_187493 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187533 - SURFACE
      ?auto_187534 - SURFACE
      ?auto_187535 - SURFACE
      ?auto_187537 - SURFACE
      ?auto_187536 - SURFACE
      ?auto_187538 - SURFACE
    )
    :vars
    (
      ?auto_187542 - HOIST
      ?auto_187543 - PLACE
      ?auto_187539 - TRUCK
      ?auto_187541 - PLACE
      ?auto_187540 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_187542 ?auto_187543 ) ( SURFACE-AT ?auto_187536 ?auto_187543 ) ( CLEAR ?auto_187536 ) ( IS-CRATE ?auto_187538 ) ( not ( = ?auto_187536 ?auto_187538 ) ) ( AVAILABLE ?auto_187542 ) ( ON ?auto_187536 ?auto_187537 ) ( not ( = ?auto_187537 ?auto_187536 ) ) ( not ( = ?auto_187537 ?auto_187538 ) ) ( TRUCK-AT ?auto_187539 ?auto_187541 ) ( not ( = ?auto_187541 ?auto_187543 ) ) ( HOIST-AT ?auto_187540 ?auto_187541 ) ( LIFTING ?auto_187540 ?auto_187538 ) ( not ( = ?auto_187542 ?auto_187540 ) ) ( ON ?auto_187534 ?auto_187533 ) ( ON ?auto_187535 ?auto_187534 ) ( ON ?auto_187537 ?auto_187535 ) ( not ( = ?auto_187533 ?auto_187534 ) ) ( not ( = ?auto_187533 ?auto_187535 ) ) ( not ( = ?auto_187533 ?auto_187537 ) ) ( not ( = ?auto_187533 ?auto_187536 ) ) ( not ( = ?auto_187533 ?auto_187538 ) ) ( not ( = ?auto_187534 ?auto_187535 ) ) ( not ( = ?auto_187534 ?auto_187537 ) ) ( not ( = ?auto_187534 ?auto_187536 ) ) ( not ( = ?auto_187534 ?auto_187538 ) ) ( not ( = ?auto_187535 ?auto_187537 ) ) ( not ( = ?auto_187535 ?auto_187536 ) ) ( not ( = ?auto_187535 ?auto_187538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187537 ?auto_187536 ?auto_187538 )
      ( MAKE-5CRATE-VERIFY ?auto_187533 ?auto_187534 ?auto_187535 ?auto_187537 ?auto_187536 ?auto_187538 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187583 - SURFACE
      ?auto_187584 - SURFACE
      ?auto_187585 - SURFACE
      ?auto_187587 - SURFACE
      ?auto_187586 - SURFACE
      ?auto_187588 - SURFACE
    )
    :vars
    (
      ?auto_187593 - HOIST
      ?auto_187594 - PLACE
      ?auto_187591 - TRUCK
      ?auto_187592 - PLACE
      ?auto_187590 - HOIST
      ?auto_187589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187593 ?auto_187594 ) ( SURFACE-AT ?auto_187586 ?auto_187594 ) ( CLEAR ?auto_187586 ) ( IS-CRATE ?auto_187588 ) ( not ( = ?auto_187586 ?auto_187588 ) ) ( AVAILABLE ?auto_187593 ) ( ON ?auto_187586 ?auto_187587 ) ( not ( = ?auto_187587 ?auto_187586 ) ) ( not ( = ?auto_187587 ?auto_187588 ) ) ( TRUCK-AT ?auto_187591 ?auto_187592 ) ( not ( = ?auto_187592 ?auto_187594 ) ) ( HOIST-AT ?auto_187590 ?auto_187592 ) ( not ( = ?auto_187593 ?auto_187590 ) ) ( AVAILABLE ?auto_187590 ) ( SURFACE-AT ?auto_187588 ?auto_187592 ) ( ON ?auto_187588 ?auto_187589 ) ( CLEAR ?auto_187588 ) ( not ( = ?auto_187586 ?auto_187589 ) ) ( not ( = ?auto_187588 ?auto_187589 ) ) ( not ( = ?auto_187587 ?auto_187589 ) ) ( ON ?auto_187584 ?auto_187583 ) ( ON ?auto_187585 ?auto_187584 ) ( ON ?auto_187587 ?auto_187585 ) ( not ( = ?auto_187583 ?auto_187584 ) ) ( not ( = ?auto_187583 ?auto_187585 ) ) ( not ( = ?auto_187583 ?auto_187587 ) ) ( not ( = ?auto_187583 ?auto_187586 ) ) ( not ( = ?auto_187583 ?auto_187588 ) ) ( not ( = ?auto_187583 ?auto_187589 ) ) ( not ( = ?auto_187584 ?auto_187585 ) ) ( not ( = ?auto_187584 ?auto_187587 ) ) ( not ( = ?auto_187584 ?auto_187586 ) ) ( not ( = ?auto_187584 ?auto_187588 ) ) ( not ( = ?auto_187584 ?auto_187589 ) ) ( not ( = ?auto_187585 ?auto_187587 ) ) ( not ( = ?auto_187585 ?auto_187586 ) ) ( not ( = ?auto_187585 ?auto_187588 ) ) ( not ( = ?auto_187585 ?auto_187589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187587 ?auto_187586 ?auto_187588 )
      ( MAKE-5CRATE-VERIFY ?auto_187583 ?auto_187584 ?auto_187585 ?auto_187587 ?auto_187586 ?auto_187588 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187634 - SURFACE
      ?auto_187635 - SURFACE
      ?auto_187636 - SURFACE
      ?auto_187638 - SURFACE
      ?auto_187637 - SURFACE
      ?auto_187639 - SURFACE
    )
    :vars
    (
      ?auto_187641 - HOIST
      ?auto_187643 - PLACE
      ?auto_187644 - PLACE
      ?auto_187640 - HOIST
      ?auto_187645 - SURFACE
      ?auto_187642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187641 ?auto_187643 ) ( SURFACE-AT ?auto_187637 ?auto_187643 ) ( CLEAR ?auto_187637 ) ( IS-CRATE ?auto_187639 ) ( not ( = ?auto_187637 ?auto_187639 ) ) ( AVAILABLE ?auto_187641 ) ( ON ?auto_187637 ?auto_187638 ) ( not ( = ?auto_187638 ?auto_187637 ) ) ( not ( = ?auto_187638 ?auto_187639 ) ) ( not ( = ?auto_187644 ?auto_187643 ) ) ( HOIST-AT ?auto_187640 ?auto_187644 ) ( not ( = ?auto_187641 ?auto_187640 ) ) ( AVAILABLE ?auto_187640 ) ( SURFACE-AT ?auto_187639 ?auto_187644 ) ( ON ?auto_187639 ?auto_187645 ) ( CLEAR ?auto_187639 ) ( not ( = ?auto_187637 ?auto_187645 ) ) ( not ( = ?auto_187639 ?auto_187645 ) ) ( not ( = ?auto_187638 ?auto_187645 ) ) ( TRUCK-AT ?auto_187642 ?auto_187643 ) ( ON ?auto_187635 ?auto_187634 ) ( ON ?auto_187636 ?auto_187635 ) ( ON ?auto_187638 ?auto_187636 ) ( not ( = ?auto_187634 ?auto_187635 ) ) ( not ( = ?auto_187634 ?auto_187636 ) ) ( not ( = ?auto_187634 ?auto_187638 ) ) ( not ( = ?auto_187634 ?auto_187637 ) ) ( not ( = ?auto_187634 ?auto_187639 ) ) ( not ( = ?auto_187634 ?auto_187645 ) ) ( not ( = ?auto_187635 ?auto_187636 ) ) ( not ( = ?auto_187635 ?auto_187638 ) ) ( not ( = ?auto_187635 ?auto_187637 ) ) ( not ( = ?auto_187635 ?auto_187639 ) ) ( not ( = ?auto_187635 ?auto_187645 ) ) ( not ( = ?auto_187636 ?auto_187638 ) ) ( not ( = ?auto_187636 ?auto_187637 ) ) ( not ( = ?auto_187636 ?auto_187639 ) ) ( not ( = ?auto_187636 ?auto_187645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187638 ?auto_187637 ?auto_187639 )
      ( MAKE-5CRATE-VERIFY ?auto_187634 ?auto_187635 ?auto_187636 ?auto_187638 ?auto_187637 ?auto_187639 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187685 - SURFACE
      ?auto_187686 - SURFACE
      ?auto_187687 - SURFACE
      ?auto_187689 - SURFACE
      ?auto_187688 - SURFACE
      ?auto_187690 - SURFACE
    )
    :vars
    (
      ?auto_187696 - HOIST
      ?auto_187695 - PLACE
      ?auto_187693 - PLACE
      ?auto_187694 - HOIST
      ?auto_187691 - SURFACE
      ?auto_187692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187696 ?auto_187695 ) ( IS-CRATE ?auto_187690 ) ( not ( = ?auto_187688 ?auto_187690 ) ) ( not ( = ?auto_187689 ?auto_187688 ) ) ( not ( = ?auto_187689 ?auto_187690 ) ) ( not ( = ?auto_187693 ?auto_187695 ) ) ( HOIST-AT ?auto_187694 ?auto_187693 ) ( not ( = ?auto_187696 ?auto_187694 ) ) ( AVAILABLE ?auto_187694 ) ( SURFACE-AT ?auto_187690 ?auto_187693 ) ( ON ?auto_187690 ?auto_187691 ) ( CLEAR ?auto_187690 ) ( not ( = ?auto_187688 ?auto_187691 ) ) ( not ( = ?auto_187690 ?auto_187691 ) ) ( not ( = ?auto_187689 ?auto_187691 ) ) ( TRUCK-AT ?auto_187692 ?auto_187695 ) ( SURFACE-AT ?auto_187689 ?auto_187695 ) ( CLEAR ?auto_187689 ) ( LIFTING ?auto_187696 ?auto_187688 ) ( IS-CRATE ?auto_187688 ) ( ON ?auto_187686 ?auto_187685 ) ( ON ?auto_187687 ?auto_187686 ) ( ON ?auto_187689 ?auto_187687 ) ( not ( = ?auto_187685 ?auto_187686 ) ) ( not ( = ?auto_187685 ?auto_187687 ) ) ( not ( = ?auto_187685 ?auto_187689 ) ) ( not ( = ?auto_187685 ?auto_187688 ) ) ( not ( = ?auto_187685 ?auto_187690 ) ) ( not ( = ?auto_187685 ?auto_187691 ) ) ( not ( = ?auto_187686 ?auto_187687 ) ) ( not ( = ?auto_187686 ?auto_187689 ) ) ( not ( = ?auto_187686 ?auto_187688 ) ) ( not ( = ?auto_187686 ?auto_187690 ) ) ( not ( = ?auto_187686 ?auto_187691 ) ) ( not ( = ?auto_187687 ?auto_187689 ) ) ( not ( = ?auto_187687 ?auto_187688 ) ) ( not ( = ?auto_187687 ?auto_187690 ) ) ( not ( = ?auto_187687 ?auto_187691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187689 ?auto_187688 ?auto_187690 )
      ( MAKE-5CRATE-VERIFY ?auto_187685 ?auto_187686 ?auto_187687 ?auto_187689 ?auto_187688 ?auto_187690 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_187736 - SURFACE
      ?auto_187737 - SURFACE
      ?auto_187738 - SURFACE
      ?auto_187740 - SURFACE
      ?auto_187739 - SURFACE
      ?auto_187741 - SURFACE
    )
    :vars
    (
      ?auto_187746 - HOIST
      ?auto_187743 - PLACE
      ?auto_187745 - PLACE
      ?auto_187742 - HOIST
      ?auto_187747 - SURFACE
      ?auto_187744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_187746 ?auto_187743 ) ( IS-CRATE ?auto_187741 ) ( not ( = ?auto_187739 ?auto_187741 ) ) ( not ( = ?auto_187740 ?auto_187739 ) ) ( not ( = ?auto_187740 ?auto_187741 ) ) ( not ( = ?auto_187745 ?auto_187743 ) ) ( HOIST-AT ?auto_187742 ?auto_187745 ) ( not ( = ?auto_187746 ?auto_187742 ) ) ( AVAILABLE ?auto_187742 ) ( SURFACE-AT ?auto_187741 ?auto_187745 ) ( ON ?auto_187741 ?auto_187747 ) ( CLEAR ?auto_187741 ) ( not ( = ?auto_187739 ?auto_187747 ) ) ( not ( = ?auto_187741 ?auto_187747 ) ) ( not ( = ?auto_187740 ?auto_187747 ) ) ( TRUCK-AT ?auto_187744 ?auto_187743 ) ( SURFACE-AT ?auto_187740 ?auto_187743 ) ( CLEAR ?auto_187740 ) ( IS-CRATE ?auto_187739 ) ( AVAILABLE ?auto_187746 ) ( IN ?auto_187739 ?auto_187744 ) ( ON ?auto_187737 ?auto_187736 ) ( ON ?auto_187738 ?auto_187737 ) ( ON ?auto_187740 ?auto_187738 ) ( not ( = ?auto_187736 ?auto_187737 ) ) ( not ( = ?auto_187736 ?auto_187738 ) ) ( not ( = ?auto_187736 ?auto_187740 ) ) ( not ( = ?auto_187736 ?auto_187739 ) ) ( not ( = ?auto_187736 ?auto_187741 ) ) ( not ( = ?auto_187736 ?auto_187747 ) ) ( not ( = ?auto_187737 ?auto_187738 ) ) ( not ( = ?auto_187737 ?auto_187740 ) ) ( not ( = ?auto_187737 ?auto_187739 ) ) ( not ( = ?auto_187737 ?auto_187741 ) ) ( not ( = ?auto_187737 ?auto_187747 ) ) ( not ( = ?auto_187738 ?auto_187740 ) ) ( not ( = ?auto_187738 ?auto_187739 ) ) ( not ( = ?auto_187738 ?auto_187741 ) ) ( not ( = ?auto_187738 ?auto_187747 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_187740 ?auto_187739 ?auto_187741 )
      ( MAKE-5CRATE-VERIFY ?auto_187736 ?auto_187737 ?auto_187738 ?auto_187740 ?auto_187739 ?auto_187741 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_188945 - SURFACE
      ?auto_188946 - SURFACE
      ?auto_188947 - SURFACE
      ?auto_188949 - SURFACE
      ?auto_188948 - SURFACE
      ?auto_188950 - SURFACE
      ?auto_188951 - SURFACE
    )
    :vars
    (
      ?auto_188952 - HOIST
      ?auto_188953 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_188952 ?auto_188953 ) ( SURFACE-AT ?auto_188950 ?auto_188953 ) ( CLEAR ?auto_188950 ) ( LIFTING ?auto_188952 ?auto_188951 ) ( IS-CRATE ?auto_188951 ) ( not ( = ?auto_188950 ?auto_188951 ) ) ( ON ?auto_188946 ?auto_188945 ) ( ON ?auto_188947 ?auto_188946 ) ( ON ?auto_188949 ?auto_188947 ) ( ON ?auto_188948 ?auto_188949 ) ( ON ?auto_188950 ?auto_188948 ) ( not ( = ?auto_188945 ?auto_188946 ) ) ( not ( = ?auto_188945 ?auto_188947 ) ) ( not ( = ?auto_188945 ?auto_188949 ) ) ( not ( = ?auto_188945 ?auto_188948 ) ) ( not ( = ?auto_188945 ?auto_188950 ) ) ( not ( = ?auto_188945 ?auto_188951 ) ) ( not ( = ?auto_188946 ?auto_188947 ) ) ( not ( = ?auto_188946 ?auto_188949 ) ) ( not ( = ?auto_188946 ?auto_188948 ) ) ( not ( = ?auto_188946 ?auto_188950 ) ) ( not ( = ?auto_188946 ?auto_188951 ) ) ( not ( = ?auto_188947 ?auto_188949 ) ) ( not ( = ?auto_188947 ?auto_188948 ) ) ( not ( = ?auto_188947 ?auto_188950 ) ) ( not ( = ?auto_188947 ?auto_188951 ) ) ( not ( = ?auto_188949 ?auto_188948 ) ) ( not ( = ?auto_188949 ?auto_188950 ) ) ( not ( = ?auto_188949 ?auto_188951 ) ) ( not ( = ?auto_188948 ?auto_188950 ) ) ( not ( = ?auto_188948 ?auto_188951 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_188950 ?auto_188951 )
      ( MAKE-6CRATE-VERIFY ?auto_188945 ?auto_188946 ?auto_188947 ?auto_188949 ?auto_188948 ?auto_188950 ?auto_188951 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_188989 - SURFACE
      ?auto_188990 - SURFACE
      ?auto_188991 - SURFACE
      ?auto_188993 - SURFACE
      ?auto_188992 - SURFACE
      ?auto_188994 - SURFACE
      ?auto_188995 - SURFACE
    )
    :vars
    (
      ?auto_188997 - HOIST
      ?auto_188996 - PLACE
      ?auto_188998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_188997 ?auto_188996 ) ( SURFACE-AT ?auto_188994 ?auto_188996 ) ( CLEAR ?auto_188994 ) ( IS-CRATE ?auto_188995 ) ( not ( = ?auto_188994 ?auto_188995 ) ) ( TRUCK-AT ?auto_188998 ?auto_188996 ) ( AVAILABLE ?auto_188997 ) ( IN ?auto_188995 ?auto_188998 ) ( ON ?auto_188994 ?auto_188992 ) ( not ( = ?auto_188992 ?auto_188994 ) ) ( not ( = ?auto_188992 ?auto_188995 ) ) ( ON ?auto_188990 ?auto_188989 ) ( ON ?auto_188991 ?auto_188990 ) ( ON ?auto_188993 ?auto_188991 ) ( ON ?auto_188992 ?auto_188993 ) ( not ( = ?auto_188989 ?auto_188990 ) ) ( not ( = ?auto_188989 ?auto_188991 ) ) ( not ( = ?auto_188989 ?auto_188993 ) ) ( not ( = ?auto_188989 ?auto_188992 ) ) ( not ( = ?auto_188989 ?auto_188994 ) ) ( not ( = ?auto_188989 ?auto_188995 ) ) ( not ( = ?auto_188990 ?auto_188991 ) ) ( not ( = ?auto_188990 ?auto_188993 ) ) ( not ( = ?auto_188990 ?auto_188992 ) ) ( not ( = ?auto_188990 ?auto_188994 ) ) ( not ( = ?auto_188990 ?auto_188995 ) ) ( not ( = ?auto_188991 ?auto_188993 ) ) ( not ( = ?auto_188991 ?auto_188992 ) ) ( not ( = ?auto_188991 ?auto_188994 ) ) ( not ( = ?auto_188991 ?auto_188995 ) ) ( not ( = ?auto_188993 ?auto_188992 ) ) ( not ( = ?auto_188993 ?auto_188994 ) ) ( not ( = ?auto_188993 ?auto_188995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_188992 ?auto_188994 ?auto_188995 )
      ( MAKE-6CRATE-VERIFY ?auto_188989 ?auto_188990 ?auto_188991 ?auto_188993 ?auto_188992 ?auto_188994 ?auto_188995 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189040 - SURFACE
      ?auto_189041 - SURFACE
      ?auto_189042 - SURFACE
      ?auto_189044 - SURFACE
      ?auto_189043 - SURFACE
      ?auto_189045 - SURFACE
      ?auto_189046 - SURFACE
    )
    :vars
    (
      ?auto_189049 - HOIST
      ?auto_189047 - PLACE
      ?auto_189050 - TRUCK
      ?auto_189048 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189049 ?auto_189047 ) ( SURFACE-AT ?auto_189045 ?auto_189047 ) ( CLEAR ?auto_189045 ) ( IS-CRATE ?auto_189046 ) ( not ( = ?auto_189045 ?auto_189046 ) ) ( AVAILABLE ?auto_189049 ) ( IN ?auto_189046 ?auto_189050 ) ( ON ?auto_189045 ?auto_189043 ) ( not ( = ?auto_189043 ?auto_189045 ) ) ( not ( = ?auto_189043 ?auto_189046 ) ) ( TRUCK-AT ?auto_189050 ?auto_189048 ) ( not ( = ?auto_189048 ?auto_189047 ) ) ( ON ?auto_189041 ?auto_189040 ) ( ON ?auto_189042 ?auto_189041 ) ( ON ?auto_189044 ?auto_189042 ) ( ON ?auto_189043 ?auto_189044 ) ( not ( = ?auto_189040 ?auto_189041 ) ) ( not ( = ?auto_189040 ?auto_189042 ) ) ( not ( = ?auto_189040 ?auto_189044 ) ) ( not ( = ?auto_189040 ?auto_189043 ) ) ( not ( = ?auto_189040 ?auto_189045 ) ) ( not ( = ?auto_189040 ?auto_189046 ) ) ( not ( = ?auto_189041 ?auto_189042 ) ) ( not ( = ?auto_189041 ?auto_189044 ) ) ( not ( = ?auto_189041 ?auto_189043 ) ) ( not ( = ?auto_189041 ?auto_189045 ) ) ( not ( = ?auto_189041 ?auto_189046 ) ) ( not ( = ?auto_189042 ?auto_189044 ) ) ( not ( = ?auto_189042 ?auto_189043 ) ) ( not ( = ?auto_189042 ?auto_189045 ) ) ( not ( = ?auto_189042 ?auto_189046 ) ) ( not ( = ?auto_189044 ?auto_189043 ) ) ( not ( = ?auto_189044 ?auto_189045 ) ) ( not ( = ?auto_189044 ?auto_189046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189043 ?auto_189045 ?auto_189046 )
      ( MAKE-6CRATE-VERIFY ?auto_189040 ?auto_189041 ?auto_189042 ?auto_189044 ?auto_189043 ?auto_189045 ?auto_189046 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189097 - SURFACE
      ?auto_189098 - SURFACE
      ?auto_189099 - SURFACE
      ?auto_189101 - SURFACE
      ?auto_189100 - SURFACE
      ?auto_189102 - SURFACE
      ?auto_189103 - SURFACE
    )
    :vars
    (
      ?auto_189108 - HOIST
      ?auto_189105 - PLACE
      ?auto_189107 - TRUCK
      ?auto_189106 - PLACE
      ?auto_189104 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_189108 ?auto_189105 ) ( SURFACE-AT ?auto_189102 ?auto_189105 ) ( CLEAR ?auto_189102 ) ( IS-CRATE ?auto_189103 ) ( not ( = ?auto_189102 ?auto_189103 ) ) ( AVAILABLE ?auto_189108 ) ( ON ?auto_189102 ?auto_189100 ) ( not ( = ?auto_189100 ?auto_189102 ) ) ( not ( = ?auto_189100 ?auto_189103 ) ) ( TRUCK-AT ?auto_189107 ?auto_189106 ) ( not ( = ?auto_189106 ?auto_189105 ) ) ( HOIST-AT ?auto_189104 ?auto_189106 ) ( LIFTING ?auto_189104 ?auto_189103 ) ( not ( = ?auto_189108 ?auto_189104 ) ) ( ON ?auto_189098 ?auto_189097 ) ( ON ?auto_189099 ?auto_189098 ) ( ON ?auto_189101 ?auto_189099 ) ( ON ?auto_189100 ?auto_189101 ) ( not ( = ?auto_189097 ?auto_189098 ) ) ( not ( = ?auto_189097 ?auto_189099 ) ) ( not ( = ?auto_189097 ?auto_189101 ) ) ( not ( = ?auto_189097 ?auto_189100 ) ) ( not ( = ?auto_189097 ?auto_189102 ) ) ( not ( = ?auto_189097 ?auto_189103 ) ) ( not ( = ?auto_189098 ?auto_189099 ) ) ( not ( = ?auto_189098 ?auto_189101 ) ) ( not ( = ?auto_189098 ?auto_189100 ) ) ( not ( = ?auto_189098 ?auto_189102 ) ) ( not ( = ?auto_189098 ?auto_189103 ) ) ( not ( = ?auto_189099 ?auto_189101 ) ) ( not ( = ?auto_189099 ?auto_189100 ) ) ( not ( = ?auto_189099 ?auto_189102 ) ) ( not ( = ?auto_189099 ?auto_189103 ) ) ( not ( = ?auto_189101 ?auto_189100 ) ) ( not ( = ?auto_189101 ?auto_189102 ) ) ( not ( = ?auto_189101 ?auto_189103 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189100 ?auto_189102 ?auto_189103 )
      ( MAKE-6CRATE-VERIFY ?auto_189097 ?auto_189098 ?auto_189099 ?auto_189101 ?auto_189100 ?auto_189102 ?auto_189103 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189160 - SURFACE
      ?auto_189161 - SURFACE
      ?auto_189162 - SURFACE
      ?auto_189164 - SURFACE
      ?auto_189163 - SURFACE
      ?auto_189165 - SURFACE
      ?auto_189166 - SURFACE
    )
    :vars
    (
      ?auto_189167 - HOIST
      ?auto_189170 - PLACE
      ?auto_189171 - TRUCK
      ?auto_189168 - PLACE
      ?auto_189172 - HOIST
      ?auto_189169 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189167 ?auto_189170 ) ( SURFACE-AT ?auto_189165 ?auto_189170 ) ( CLEAR ?auto_189165 ) ( IS-CRATE ?auto_189166 ) ( not ( = ?auto_189165 ?auto_189166 ) ) ( AVAILABLE ?auto_189167 ) ( ON ?auto_189165 ?auto_189163 ) ( not ( = ?auto_189163 ?auto_189165 ) ) ( not ( = ?auto_189163 ?auto_189166 ) ) ( TRUCK-AT ?auto_189171 ?auto_189168 ) ( not ( = ?auto_189168 ?auto_189170 ) ) ( HOIST-AT ?auto_189172 ?auto_189168 ) ( not ( = ?auto_189167 ?auto_189172 ) ) ( AVAILABLE ?auto_189172 ) ( SURFACE-AT ?auto_189166 ?auto_189168 ) ( ON ?auto_189166 ?auto_189169 ) ( CLEAR ?auto_189166 ) ( not ( = ?auto_189165 ?auto_189169 ) ) ( not ( = ?auto_189166 ?auto_189169 ) ) ( not ( = ?auto_189163 ?auto_189169 ) ) ( ON ?auto_189161 ?auto_189160 ) ( ON ?auto_189162 ?auto_189161 ) ( ON ?auto_189164 ?auto_189162 ) ( ON ?auto_189163 ?auto_189164 ) ( not ( = ?auto_189160 ?auto_189161 ) ) ( not ( = ?auto_189160 ?auto_189162 ) ) ( not ( = ?auto_189160 ?auto_189164 ) ) ( not ( = ?auto_189160 ?auto_189163 ) ) ( not ( = ?auto_189160 ?auto_189165 ) ) ( not ( = ?auto_189160 ?auto_189166 ) ) ( not ( = ?auto_189160 ?auto_189169 ) ) ( not ( = ?auto_189161 ?auto_189162 ) ) ( not ( = ?auto_189161 ?auto_189164 ) ) ( not ( = ?auto_189161 ?auto_189163 ) ) ( not ( = ?auto_189161 ?auto_189165 ) ) ( not ( = ?auto_189161 ?auto_189166 ) ) ( not ( = ?auto_189161 ?auto_189169 ) ) ( not ( = ?auto_189162 ?auto_189164 ) ) ( not ( = ?auto_189162 ?auto_189163 ) ) ( not ( = ?auto_189162 ?auto_189165 ) ) ( not ( = ?auto_189162 ?auto_189166 ) ) ( not ( = ?auto_189162 ?auto_189169 ) ) ( not ( = ?auto_189164 ?auto_189163 ) ) ( not ( = ?auto_189164 ?auto_189165 ) ) ( not ( = ?auto_189164 ?auto_189166 ) ) ( not ( = ?auto_189164 ?auto_189169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189163 ?auto_189165 ?auto_189166 )
      ( MAKE-6CRATE-VERIFY ?auto_189160 ?auto_189161 ?auto_189162 ?auto_189164 ?auto_189163 ?auto_189165 ?auto_189166 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189224 - SURFACE
      ?auto_189225 - SURFACE
      ?auto_189226 - SURFACE
      ?auto_189228 - SURFACE
      ?auto_189227 - SURFACE
      ?auto_189229 - SURFACE
      ?auto_189230 - SURFACE
    )
    :vars
    (
      ?auto_189236 - HOIST
      ?auto_189233 - PLACE
      ?auto_189232 - PLACE
      ?auto_189231 - HOIST
      ?auto_189235 - SURFACE
      ?auto_189234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189236 ?auto_189233 ) ( SURFACE-AT ?auto_189229 ?auto_189233 ) ( CLEAR ?auto_189229 ) ( IS-CRATE ?auto_189230 ) ( not ( = ?auto_189229 ?auto_189230 ) ) ( AVAILABLE ?auto_189236 ) ( ON ?auto_189229 ?auto_189227 ) ( not ( = ?auto_189227 ?auto_189229 ) ) ( not ( = ?auto_189227 ?auto_189230 ) ) ( not ( = ?auto_189232 ?auto_189233 ) ) ( HOIST-AT ?auto_189231 ?auto_189232 ) ( not ( = ?auto_189236 ?auto_189231 ) ) ( AVAILABLE ?auto_189231 ) ( SURFACE-AT ?auto_189230 ?auto_189232 ) ( ON ?auto_189230 ?auto_189235 ) ( CLEAR ?auto_189230 ) ( not ( = ?auto_189229 ?auto_189235 ) ) ( not ( = ?auto_189230 ?auto_189235 ) ) ( not ( = ?auto_189227 ?auto_189235 ) ) ( TRUCK-AT ?auto_189234 ?auto_189233 ) ( ON ?auto_189225 ?auto_189224 ) ( ON ?auto_189226 ?auto_189225 ) ( ON ?auto_189228 ?auto_189226 ) ( ON ?auto_189227 ?auto_189228 ) ( not ( = ?auto_189224 ?auto_189225 ) ) ( not ( = ?auto_189224 ?auto_189226 ) ) ( not ( = ?auto_189224 ?auto_189228 ) ) ( not ( = ?auto_189224 ?auto_189227 ) ) ( not ( = ?auto_189224 ?auto_189229 ) ) ( not ( = ?auto_189224 ?auto_189230 ) ) ( not ( = ?auto_189224 ?auto_189235 ) ) ( not ( = ?auto_189225 ?auto_189226 ) ) ( not ( = ?auto_189225 ?auto_189228 ) ) ( not ( = ?auto_189225 ?auto_189227 ) ) ( not ( = ?auto_189225 ?auto_189229 ) ) ( not ( = ?auto_189225 ?auto_189230 ) ) ( not ( = ?auto_189225 ?auto_189235 ) ) ( not ( = ?auto_189226 ?auto_189228 ) ) ( not ( = ?auto_189226 ?auto_189227 ) ) ( not ( = ?auto_189226 ?auto_189229 ) ) ( not ( = ?auto_189226 ?auto_189230 ) ) ( not ( = ?auto_189226 ?auto_189235 ) ) ( not ( = ?auto_189228 ?auto_189227 ) ) ( not ( = ?auto_189228 ?auto_189229 ) ) ( not ( = ?auto_189228 ?auto_189230 ) ) ( not ( = ?auto_189228 ?auto_189235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189227 ?auto_189229 ?auto_189230 )
      ( MAKE-6CRATE-VERIFY ?auto_189224 ?auto_189225 ?auto_189226 ?auto_189228 ?auto_189227 ?auto_189229 ?auto_189230 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189288 - SURFACE
      ?auto_189289 - SURFACE
      ?auto_189290 - SURFACE
      ?auto_189292 - SURFACE
      ?auto_189291 - SURFACE
      ?auto_189293 - SURFACE
      ?auto_189294 - SURFACE
    )
    :vars
    (
      ?auto_189297 - HOIST
      ?auto_189295 - PLACE
      ?auto_189300 - PLACE
      ?auto_189296 - HOIST
      ?auto_189298 - SURFACE
      ?auto_189299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189297 ?auto_189295 ) ( IS-CRATE ?auto_189294 ) ( not ( = ?auto_189293 ?auto_189294 ) ) ( not ( = ?auto_189291 ?auto_189293 ) ) ( not ( = ?auto_189291 ?auto_189294 ) ) ( not ( = ?auto_189300 ?auto_189295 ) ) ( HOIST-AT ?auto_189296 ?auto_189300 ) ( not ( = ?auto_189297 ?auto_189296 ) ) ( AVAILABLE ?auto_189296 ) ( SURFACE-AT ?auto_189294 ?auto_189300 ) ( ON ?auto_189294 ?auto_189298 ) ( CLEAR ?auto_189294 ) ( not ( = ?auto_189293 ?auto_189298 ) ) ( not ( = ?auto_189294 ?auto_189298 ) ) ( not ( = ?auto_189291 ?auto_189298 ) ) ( TRUCK-AT ?auto_189299 ?auto_189295 ) ( SURFACE-AT ?auto_189291 ?auto_189295 ) ( CLEAR ?auto_189291 ) ( LIFTING ?auto_189297 ?auto_189293 ) ( IS-CRATE ?auto_189293 ) ( ON ?auto_189289 ?auto_189288 ) ( ON ?auto_189290 ?auto_189289 ) ( ON ?auto_189292 ?auto_189290 ) ( ON ?auto_189291 ?auto_189292 ) ( not ( = ?auto_189288 ?auto_189289 ) ) ( not ( = ?auto_189288 ?auto_189290 ) ) ( not ( = ?auto_189288 ?auto_189292 ) ) ( not ( = ?auto_189288 ?auto_189291 ) ) ( not ( = ?auto_189288 ?auto_189293 ) ) ( not ( = ?auto_189288 ?auto_189294 ) ) ( not ( = ?auto_189288 ?auto_189298 ) ) ( not ( = ?auto_189289 ?auto_189290 ) ) ( not ( = ?auto_189289 ?auto_189292 ) ) ( not ( = ?auto_189289 ?auto_189291 ) ) ( not ( = ?auto_189289 ?auto_189293 ) ) ( not ( = ?auto_189289 ?auto_189294 ) ) ( not ( = ?auto_189289 ?auto_189298 ) ) ( not ( = ?auto_189290 ?auto_189292 ) ) ( not ( = ?auto_189290 ?auto_189291 ) ) ( not ( = ?auto_189290 ?auto_189293 ) ) ( not ( = ?auto_189290 ?auto_189294 ) ) ( not ( = ?auto_189290 ?auto_189298 ) ) ( not ( = ?auto_189292 ?auto_189291 ) ) ( not ( = ?auto_189292 ?auto_189293 ) ) ( not ( = ?auto_189292 ?auto_189294 ) ) ( not ( = ?auto_189292 ?auto_189298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189291 ?auto_189293 ?auto_189294 )
      ( MAKE-6CRATE-VERIFY ?auto_189288 ?auto_189289 ?auto_189290 ?auto_189292 ?auto_189291 ?auto_189293 ?auto_189294 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189352 - SURFACE
      ?auto_189353 - SURFACE
      ?auto_189354 - SURFACE
      ?auto_189356 - SURFACE
      ?auto_189355 - SURFACE
      ?auto_189357 - SURFACE
      ?auto_189358 - SURFACE
    )
    :vars
    (
      ?auto_189360 - HOIST
      ?auto_189363 - PLACE
      ?auto_189364 - PLACE
      ?auto_189362 - HOIST
      ?auto_189361 - SURFACE
      ?auto_189359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189360 ?auto_189363 ) ( IS-CRATE ?auto_189358 ) ( not ( = ?auto_189357 ?auto_189358 ) ) ( not ( = ?auto_189355 ?auto_189357 ) ) ( not ( = ?auto_189355 ?auto_189358 ) ) ( not ( = ?auto_189364 ?auto_189363 ) ) ( HOIST-AT ?auto_189362 ?auto_189364 ) ( not ( = ?auto_189360 ?auto_189362 ) ) ( AVAILABLE ?auto_189362 ) ( SURFACE-AT ?auto_189358 ?auto_189364 ) ( ON ?auto_189358 ?auto_189361 ) ( CLEAR ?auto_189358 ) ( not ( = ?auto_189357 ?auto_189361 ) ) ( not ( = ?auto_189358 ?auto_189361 ) ) ( not ( = ?auto_189355 ?auto_189361 ) ) ( TRUCK-AT ?auto_189359 ?auto_189363 ) ( SURFACE-AT ?auto_189355 ?auto_189363 ) ( CLEAR ?auto_189355 ) ( IS-CRATE ?auto_189357 ) ( AVAILABLE ?auto_189360 ) ( IN ?auto_189357 ?auto_189359 ) ( ON ?auto_189353 ?auto_189352 ) ( ON ?auto_189354 ?auto_189353 ) ( ON ?auto_189356 ?auto_189354 ) ( ON ?auto_189355 ?auto_189356 ) ( not ( = ?auto_189352 ?auto_189353 ) ) ( not ( = ?auto_189352 ?auto_189354 ) ) ( not ( = ?auto_189352 ?auto_189356 ) ) ( not ( = ?auto_189352 ?auto_189355 ) ) ( not ( = ?auto_189352 ?auto_189357 ) ) ( not ( = ?auto_189352 ?auto_189358 ) ) ( not ( = ?auto_189352 ?auto_189361 ) ) ( not ( = ?auto_189353 ?auto_189354 ) ) ( not ( = ?auto_189353 ?auto_189356 ) ) ( not ( = ?auto_189353 ?auto_189355 ) ) ( not ( = ?auto_189353 ?auto_189357 ) ) ( not ( = ?auto_189353 ?auto_189358 ) ) ( not ( = ?auto_189353 ?auto_189361 ) ) ( not ( = ?auto_189354 ?auto_189356 ) ) ( not ( = ?auto_189354 ?auto_189355 ) ) ( not ( = ?auto_189354 ?auto_189357 ) ) ( not ( = ?auto_189354 ?auto_189358 ) ) ( not ( = ?auto_189354 ?auto_189361 ) ) ( not ( = ?auto_189356 ?auto_189355 ) ) ( not ( = ?auto_189356 ?auto_189357 ) ) ( not ( = ?auto_189356 ?auto_189358 ) ) ( not ( = ?auto_189356 ?auto_189361 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189355 ?auto_189357 ?auto_189358 )
      ( MAKE-6CRATE-VERIFY ?auto_189352 ?auto_189353 ?auto_189354 ?auto_189356 ?auto_189355 ?auto_189357 ?auto_189358 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_189365 - SURFACE
      ?auto_189366 - SURFACE
    )
    :vars
    (
      ?auto_189369 - HOIST
      ?auto_189372 - PLACE
      ?auto_189367 - SURFACE
      ?auto_189373 - PLACE
      ?auto_189371 - HOIST
      ?auto_189370 - SURFACE
      ?auto_189368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189369 ?auto_189372 ) ( IS-CRATE ?auto_189366 ) ( not ( = ?auto_189365 ?auto_189366 ) ) ( not ( = ?auto_189367 ?auto_189365 ) ) ( not ( = ?auto_189367 ?auto_189366 ) ) ( not ( = ?auto_189373 ?auto_189372 ) ) ( HOIST-AT ?auto_189371 ?auto_189373 ) ( not ( = ?auto_189369 ?auto_189371 ) ) ( AVAILABLE ?auto_189371 ) ( SURFACE-AT ?auto_189366 ?auto_189373 ) ( ON ?auto_189366 ?auto_189370 ) ( CLEAR ?auto_189366 ) ( not ( = ?auto_189365 ?auto_189370 ) ) ( not ( = ?auto_189366 ?auto_189370 ) ) ( not ( = ?auto_189367 ?auto_189370 ) ) ( SURFACE-AT ?auto_189367 ?auto_189372 ) ( CLEAR ?auto_189367 ) ( IS-CRATE ?auto_189365 ) ( AVAILABLE ?auto_189369 ) ( IN ?auto_189365 ?auto_189368 ) ( TRUCK-AT ?auto_189368 ?auto_189373 ) )
    :subtasks
    ( ( !DRIVE ?auto_189368 ?auto_189373 ?auto_189372 )
      ( MAKE-2CRATE ?auto_189367 ?auto_189365 ?auto_189366 )
      ( MAKE-1CRATE-VERIFY ?auto_189365 ?auto_189366 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_189374 - SURFACE
      ?auto_189375 - SURFACE
      ?auto_189376 - SURFACE
    )
    :vars
    (
      ?auto_189382 - HOIST
      ?auto_189378 - PLACE
      ?auto_189381 - PLACE
      ?auto_189380 - HOIST
      ?auto_189377 - SURFACE
      ?auto_189379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189382 ?auto_189378 ) ( IS-CRATE ?auto_189376 ) ( not ( = ?auto_189375 ?auto_189376 ) ) ( not ( = ?auto_189374 ?auto_189375 ) ) ( not ( = ?auto_189374 ?auto_189376 ) ) ( not ( = ?auto_189381 ?auto_189378 ) ) ( HOIST-AT ?auto_189380 ?auto_189381 ) ( not ( = ?auto_189382 ?auto_189380 ) ) ( AVAILABLE ?auto_189380 ) ( SURFACE-AT ?auto_189376 ?auto_189381 ) ( ON ?auto_189376 ?auto_189377 ) ( CLEAR ?auto_189376 ) ( not ( = ?auto_189375 ?auto_189377 ) ) ( not ( = ?auto_189376 ?auto_189377 ) ) ( not ( = ?auto_189374 ?auto_189377 ) ) ( SURFACE-AT ?auto_189374 ?auto_189378 ) ( CLEAR ?auto_189374 ) ( IS-CRATE ?auto_189375 ) ( AVAILABLE ?auto_189382 ) ( IN ?auto_189375 ?auto_189379 ) ( TRUCK-AT ?auto_189379 ?auto_189381 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_189375 ?auto_189376 )
      ( MAKE-2CRATE-VERIFY ?auto_189374 ?auto_189375 ?auto_189376 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_189383 - SURFACE
      ?auto_189384 - SURFACE
      ?auto_189385 - SURFACE
      ?auto_189386 - SURFACE
    )
    :vars
    (
      ?auto_189389 - HOIST
      ?auto_189390 - PLACE
      ?auto_189388 - PLACE
      ?auto_189392 - HOIST
      ?auto_189387 - SURFACE
      ?auto_189391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189389 ?auto_189390 ) ( IS-CRATE ?auto_189386 ) ( not ( = ?auto_189385 ?auto_189386 ) ) ( not ( = ?auto_189384 ?auto_189385 ) ) ( not ( = ?auto_189384 ?auto_189386 ) ) ( not ( = ?auto_189388 ?auto_189390 ) ) ( HOIST-AT ?auto_189392 ?auto_189388 ) ( not ( = ?auto_189389 ?auto_189392 ) ) ( AVAILABLE ?auto_189392 ) ( SURFACE-AT ?auto_189386 ?auto_189388 ) ( ON ?auto_189386 ?auto_189387 ) ( CLEAR ?auto_189386 ) ( not ( = ?auto_189385 ?auto_189387 ) ) ( not ( = ?auto_189386 ?auto_189387 ) ) ( not ( = ?auto_189384 ?auto_189387 ) ) ( SURFACE-AT ?auto_189384 ?auto_189390 ) ( CLEAR ?auto_189384 ) ( IS-CRATE ?auto_189385 ) ( AVAILABLE ?auto_189389 ) ( IN ?auto_189385 ?auto_189391 ) ( TRUCK-AT ?auto_189391 ?auto_189388 ) ( ON ?auto_189384 ?auto_189383 ) ( not ( = ?auto_189383 ?auto_189384 ) ) ( not ( = ?auto_189383 ?auto_189385 ) ) ( not ( = ?auto_189383 ?auto_189386 ) ) ( not ( = ?auto_189383 ?auto_189387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189384 ?auto_189385 ?auto_189386 )
      ( MAKE-3CRATE-VERIFY ?auto_189383 ?auto_189384 ?auto_189385 ?auto_189386 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_189393 - SURFACE
      ?auto_189394 - SURFACE
      ?auto_189395 - SURFACE
      ?auto_189397 - SURFACE
      ?auto_189396 - SURFACE
    )
    :vars
    (
      ?auto_189400 - HOIST
      ?auto_189401 - PLACE
      ?auto_189399 - PLACE
      ?auto_189403 - HOIST
      ?auto_189398 - SURFACE
      ?auto_189402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189400 ?auto_189401 ) ( IS-CRATE ?auto_189396 ) ( not ( = ?auto_189397 ?auto_189396 ) ) ( not ( = ?auto_189395 ?auto_189397 ) ) ( not ( = ?auto_189395 ?auto_189396 ) ) ( not ( = ?auto_189399 ?auto_189401 ) ) ( HOIST-AT ?auto_189403 ?auto_189399 ) ( not ( = ?auto_189400 ?auto_189403 ) ) ( AVAILABLE ?auto_189403 ) ( SURFACE-AT ?auto_189396 ?auto_189399 ) ( ON ?auto_189396 ?auto_189398 ) ( CLEAR ?auto_189396 ) ( not ( = ?auto_189397 ?auto_189398 ) ) ( not ( = ?auto_189396 ?auto_189398 ) ) ( not ( = ?auto_189395 ?auto_189398 ) ) ( SURFACE-AT ?auto_189395 ?auto_189401 ) ( CLEAR ?auto_189395 ) ( IS-CRATE ?auto_189397 ) ( AVAILABLE ?auto_189400 ) ( IN ?auto_189397 ?auto_189402 ) ( TRUCK-AT ?auto_189402 ?auto_189399 ) ( ON ?auto_189394 ?auto_189393 ) ( ON ?auto_189395 ?auto_189394 ) ( not ( = ?auto_189393 ?auto_189394 ) ) ( not ( = ?auto_189393 ?auto_189395 ) ) ( not ( = ?auto_189393 ?auto_189397 ) ) ( not ( = ?auto_189393 ?auto_189396 ) ) ( not ( = ?auto_189393 ?auto_189398 ) ) ( not ( = ?auto_189394 ?auto_189395 ) ) ( not ( = ?auto_189394 ?auto_189397 ) ) ( not ( = ?auto_189394 ?auto_189396 ) ) ( not ( = ?auto_189394 ?auto_189398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189395 ?auto_189397 ?auto_189396 )
      ( MAKE-4CRATE-VERIFY ?auto_189393 ?auto_189394 ?auto_189395 ?auto_189397 ?auto_189396 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_189404 - SURFACE
      ?auto_189405 - SURFACE
      ?auto_189406 - SURFACE
      ?auto_189408 - SURFACE
      ?auto_189407 - SURFACE
      ?auto_189409 - SURFACE
    )
    :vars
    (
      ?auto_189412 - HOIST
      ?auto_189413 - PLACE
      ?auto_189411 - PLACE
      ?auto_189415 - HOIST
      ?auto_189410 - SURFACE
      ?auto_189414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189412 ?auto_189413 ) ( IS-CRATE ?auto_189409 ) ( not ( = ?auto_189407 ?auto_189409 ) ) ( not ( = ?auto_189408 ?auto_189407 ) ) ( not ( = ?auto_189408 ?auto_189409 ) ) ( not ( = ?auto_189411 ?auto_189413 ) ) ( HOIST-AT ?auto_189415 ?auto_189411 ) ( not ( = ?auto_189412 ?auto_189415 ) ) ( AVAILABLE ?auto_189415 ) ( SURFACE-AT ?auto_189409 ?auto_189411 ) ( ON ?auto_189409 ?auto_189410 ) ( CLEAR ?auto_189409 ) ( not ( = ?auto_189407 ?auto_189410 ) ) ( not ( = ?auto_189409 ?auto_189410 ) ) ( not ( = ?auto_189408 ?auto_189410 ) ) ( SURFACE-AT ?auto_189408 ?auto_189413 ) ( CLEAR ?auto_189408 ) ( IS-CRATE ?auto_189407 ) ( AVAILABLE ?auto_189412 ) ( IN ?auto_189407 ?auto_189414 ) ( TRUCK-AT ?auto_189414 ?auto_189411 ) ( ON ?auto_189405 ?auto_189404 ) ( ON ?auto_189406 ?auto_189405 ) ( ON ?auto_189408 ?auto_189406 ) ( not ( = ?auto_189404 ?auto_189405 ) ) ( not ( = ?auto_189404 ?auto_189406 ) ) ( not ( = ?auto_189404 ?auto_189408 ) ) ( not ( = ?auto_189404 ?auto_189407 ) ) ( not ( = ?auto_189404 ?auto_189409 ) ) ( not ( = ?auto_189404 ?auto_189410 ) ) ( not ( = ?auto_189405 ?auto_189406 ) ) ( not ( = ?auto_189405 ?auto_189408 ) ) ( not ( = ?auto_189405 ?auto_189407 ) ) ( not ( = ?auto_189405 ?auto_189409 ) ) ( not ( = ?auto_189405 ?auto_189410 ) ) ( not ( = ?auto_189406 ?auto_189408 ) ) ( not ( = ?auto_189406 ?auto_189407 ) ) ( not ( = ?auto_189406 ?auto_189409 ) ) ( not ( = ?auto_189406 ?auto_189410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189408 ?auto_189407 ?auto_189409 )
      ( MAKE-5CRATE-VERIFY ?auto_189404 ?auto_189405 ?auto_189406 ?auto_189408 ?auto_189407 ?auto_189409 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189416 - SURFACE
      ?auto_189417 - SURFACE
      ?auto_189418 - SURFACE
      ?auto_189420 - SURFACE
      ?auto_189419 - SURFACE
      ?auto_189421 - SURFACE
      ?auto_189422 - SURFACE
    )
    :vars
    (
      ?auto_189425 - HOIST
      ?auto_189426 - PLACE
      ?auto_189424 - PLACE
      ?auto_189428 - HOIST
      ?auto_189423 - SURFACE
      ?auto_189427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189425 ?auto_189426 ) ( IS-CRATE ?auto_189422 ) ( not ( = ?auto_189421 ?auto_189422 ) ) ( not ( = ?auto_189419 ?auto_189421 ) ) ( not ( = ?auto_189419 ?auto_189422 ) ) ( not ( = ?auto_189424 ?auto_189426 ) ) ( HOIST-AT ?auto_189428 ?auto_189424 ) ( not ( = ?auto_189425 ?auto_189428 ) ) ( AVAILABLE ?auto_189428 ) ( SURFACE-AT ?auto_189422 ?auto_189424 ) ( ON ?auto_189422 ?auto_189423 ) ( CLEAR ?auto_189422 ) ( not ( = ?auto_189421 ?auto_189423 ) ) ( not ( = ?auto_189422 ?auto_189423 ) ) ( not ( = ?auto_189419 ?auto_189423 ) ) ( SURFACE-AT ?auto_189419 ?auto_189426 ) ( CLEAR ?auto_189419 ) ( IS-CRATE ?auto_189421 ) ( AVAILABLE ?auto_189425 ) ( IN ?auto_189421 ?auto_189427 ) ( TRUCK-AT ?auto_189427 ?auto_189424 ) ( ON ?auto_189417 ?auto_189416 ) ( ON ?auto_189418 ?auto_189417 ) ( ON ?auto_189420 ?auto_189418 ) ( ON ?auto_189419 ?auto_189420 ) ( not ( = ?auto_189416 ?auto_189417 ) ) ( not ( = ?auto_189416 ?auto_189418 ) ) ( not ( = ?auto_189416 ?auto_189420 ) ) ( not ( = ?auto_189416 ?auto_189419 ) ) ( not ( = ?auto_189416 ?auto_189421 ) ) ( not ( = ?auto_189416 ?auto_189422 ) ) ( not ( = ?auto_189416 ?auto_189423 ) ) ( not ( = ?auto_189417 ?auto_189418 ) ) ( not ( = ?auto_189417 ?auto_189420 ) ) ( not ( = ?auto_189417 ?auto_189419 ) ) ( not ( = ?auto_189417 ?auto_189421 ) ) ( not ( = ?auto_189417 ?auto_189422 ) ) ( not ( = ?auto_189417 ?auto_189423 ) ) ( not ( = ?auto_189418 ?auto_189420 ) ) ( not ( = ?auto_189418 ?auto_189419 ) ) ( not ( = ?auto_189418 ?auto_189421 ) ) ( not ( = ?auto_189418 ?auto_189422 ) ) ( not ( = ?auto_189418 ?auto_189423 ) ) ( not ( = ?auto_189420 ?auto_189419 ) ) ( not ( = ?auto_189420 ?auto_189421 ) ) ( not ( = ?auto_189420 ?auto_189422 ) ) ( not ( = ?auto_189420 ?auto_189423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189419 ?auto_189421 ?auto_189422 )
      ( MAKE-6CRATE-VERIFY ?auto_189416 ?auto_189417 ?auto_189418 ?auto_189420 ?auto_189419 ?auto_189421 ?auto_189422 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_189429 - SURFACE
      ?auto_189430 - SURFACE
    )
    :vars
    (
      ?auto_189434 - HOIST
      ?auto_189435 - PLACE
      ?auto_189433 - SURFACE
      ?auto_189432 - PLACE
      ?auto_189437 - HOIST
      ?auto_189431 - SURFACE
      ?auto_189436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189434 ?auto_189435 ) ( IS-CRATE ?auto_189430 ) ( not ( = ?auto_189429 ?auto_189430 ) ) ( not ( = ?auto_189433 ?auto_189429 ) ) ( not ( = ?auto_189433 ?auto_189430 ) ) ( not ( = ?auto_189432 ?auto_189435 ) ) ( HOIST-AT ?auto_189437 ?auto_189432 ) ( not ( = ?auto_189434 ?auto_189437 ) ) ( SURFACE-AT ?auto_189430 ?auto_189432 ) ( ON ?auto_189430 ?auto_189431 ) ( CLEAR ?auto_189430 ) ( not ( = ?auto_189429 ?auto_189431 ) ) ( not ( = ?auto_189430 ?auto_189431 ) ) ( not ( = ?auto_189433 ?auto_189431 ) ) ( SURFACE-AT ?auto_189433 ?auto_189435 ) ( CLEAR ?auto_189433 ) ( IS-CRATE ?auto_189429 ) ( AVAILABLE ?auto_189434 ) ( TRUCK-AT ?auto_189436 ?auto_189432 ) ( LIFTING ?auto_189437 ?auto_189429 ) )
    :subtasks
    ( ( !LOAD ?auto_189437 ?auto_189429 ?auto_189436 ?auto_189432 )
      ( MAKE-2CRATE ?auto_189433 ?auto_189429 ?auto_189430 )
      ( MAKE-1CRATE-VERIFY ?auto_189429 ?auto_189430 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_189438 - SURFACE
      ?auto_189439 - SURFACE
      ?auto_189440 - SURFACE
    )
    :vars
    (
      ?auto_189445 - HOIST
      ?auto_189441 - PLACE
      ?auto_189444 - PLACE
      ?auto_189446 - HOIST
      ?auto_189442 - SURFACE
      ?auto_189443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189445 ?auto_189441 ) ( IS-CRATE ?auto_189440 ) ( not ( = ?auto_189439 ?auto_189440 ) ) ( not ( = ?auto_189438 ?auto_189439 ) ) ( not ( = ?auto_189438 ?auto_189440 ) ) ( not ( = ?auto_189444 ?auto_189441 ) ) ( HOIST-AT ?auto_189446 ?auto_189444 ) ( not ( = ?auto_189445 ?auto_189446 ) ) ( SURFACE-AT ?auto_189440 ?auto_189444 ) ( ON ?auto_189440 ?auto_189442 ) ( CLEAR ?auto_189440 ) ( not ( = ?auto_189439 ?auto_189442 ) ) ( not ( = ?auto_189440 ?auto_189442 ) ) ( not ( = ?auto_189438 ?auto_189442 ) ) ( SURFACE-AT ?auto_189438 ?auto_189441 ) ( CLEAR ?auto_189438 ) ( IS-CRATE ?auto_189439 ) ( AVAILABLE ?auto_189445 ) ( TRUCK-AT ?auto_189443 ?auto_189444 ) ( LIFTING ?auto_189446 ?auto_189439 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_189439 ?auto_189440 )
      ( MAKE-2CRATE-VERIFY ?auto_189438 ?auto_189439 ?auto_189440 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_189447 - SURFACE
      ?auto_189448 - SURFACE
      ?auto_189449 - SURFACE
      ?auto_189450 - SURFACE
    )
    :vars
    (
      ?auto_189451 - HOIST
      ?auto_189453 - PLACE
      ?auto_189456 - PLACE
      ?auto_189454 - HOIST
      ?auto_189455 - SURFACE
      ?auto_189452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189451 ?auto_189453 ) ( IS-CRATE ?auto_189450 ) ( not ( = ?auto_189449 ?auto_189450 ) ) ( not ( = ?auto_189448 ?auto_189449 ) ) ( not ( = ?auto_189448 ?auto_189450 ) ) ( not ( = ?auto_189456 ?auto_189453 ) ) ( HOIST-AT ?auto_189454 ?auto_189456 ) ( not ( = ?auto_189451 ?auto_189454 ) ) ( SURFACE-AT ?auto_189450 ?auto_189456 ) ( ON ?auto_189450 ?auto_189455 ) ( CLEAR ?auto_189450 ) ( not ( = ?auto_189449 ?auto_189455 ) ) ( not ( = ?auto_189450 ?auto_189455 ) ) ( not ( = ?auto_189448 ?auto_189455 ) ) ( SURFACE-AT ?auto_189448 ?auto_189453 ) ( CLEAR ?auto_189448 ) ( IS-CRATE ?auto_189449 ) ( AVAILABLE ?auto_189451 ) ( TRUCK-AT ?auto_189452 ?auto_189456 ) ( LIFTING ?auto_189454 ?auto_189449 ) ( ON ?auto_189448 ?auto_189447 ) ( not ( = ?auto_189447 ?auto_189448 ) ) ( not ( = ?auto_189447 ?auto_189449 ) ) ( not ( = ?auto_189447 ?auto_189450 ) ) ( not ( = ?auto_189447 ?auto_189455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189448 ?auto_189449 ?auto_189450 )
      ( MAKE-3CRATE-VERIFY ?auto_189447 ?auto_189448 ?auto_189449 ?auto_189450 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_189457 - SURFACE
      ?auto_189458 - SURFACE
      ?auto_189459 - SURFACE
      ?auto_189461 - SURFACE
      ?auto_189460 - SURFACE
    )
    :vars
    (
      ?auto_189462 - HOIST
      ?auto_189464 - PLACE
      ?auto_189467 - PLACE
      ?auto_189465 - HOIST
      ?auto_189466 - SURFACE
      ?auto_189463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189462 ?auto_189464 ) ( IS-CRATE ?auto_189460 ) ( not ( = ?auto_189461 ?auto_189460 ) ) ( not ( = ?auto_189459 ?auto_189461 ) ) ( not ( = ?auto_189459 ?auto_189460 ) ) ( not ( = ?auto_189467 ?auto_189464 ) ) ( HOIST-AT ?auto_189465 ?auto_189467 ) ( not ( = ?auto_189462 ?auto_189465 ) ) ( SURFACE-AT ?auto_189460 ?auto_189467 ) ( ON ?auto_189460 ?auto_189466 ) ( CLEAR ?auto_189460 ) ( not ( = ?auto_189461 ?auto_189466 ) ) ( not ( = ?auto_189460 ?auto_189466 ) ) ( not ( = ?auto_189459 ?auto_189466 ) ) ( SURFACE-AT ?auto_189459 ?auto_189464 ) ( CLEAR ?auto_189459 ) ( IS-CRATE ?auto_189461 ) ( AVAILABLE ?auto_189462 ) ( TRUCK-AT ?auto_189463 ?auto_189467 ) ( LIFTING ?auto_189465 ?auto_189461 ) ( ON ?auto_189458 ?auto_189457 ) ( ON ?auto_189459 ?auto_189458 ) ( not ( = ?auto_189457 ?auto_189458 ) ) ( not ( = ?auto_189457 ?auto_189459 ) ) ( not ( = ?auto_189457 ?auto_189461 ) ) ( not ( = ?auto_189457 ?auto_189460 ) ) ( not ( = ?auto_189457 ?auto_189466 ) ) ( not ( = ?auto_189458 ?auto_189459 ) ) ( not ( = ?auto_189458 ?auto_189461 ) ) ( not ( = ?auto_189458 ?auto_189460 ) ) ( not ( = ?auto_189458 ?auto_189466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189459 ?auto_189461 ?auto_189460 )
      ( MAKE-4CRATE-VERIFY ?auto_189457 ?auto_189458 ?auto_189459 ?auto_189461 ?auto_189460 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_189468 - SURFACE
      ?auto_189469 - SURFACE
      ?auto_189470 - SURFACE
      ?auto_189472 - SURFACE
      ?auto_189471 - SURFACE
      ?auto_189473 - SURFACE
    )
    :vars
    (
      ?auto_189474 - HOIST
      ?auto_189476 - PLACE
      ?auto_189479 - PLACE
      ?auto_189477 - HOIST
      ?auto_189478 - SURFACE
      ?auto_189475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189474 ?auto_189476 ) ( IS-CRATE ?auto_189473 ) ( not ( = ?auto_189471 ?auto_189473 ) ) ( not ( = ?auto_189472 ?auto_189471 ) ) ( not ( = ?auto_189472 ?auto_189473 ) ) ( not ( = ?auto_189479 ?auto_189476 ) ) ( HOIST-AT ?auto_189477 ?auto_189479 ) ( not ( = ?auto_189474 ?auto_189477 ) ) ( SURFACE-AT ?auto_189473 ?auto_189479 ) ( ON ?auto_189473 ?auto_189478 ) ( CLEAR ?auto_189473 ) ( not ( = ?auto_189471 ?auto_189478 ) ) ( not ( = ?auto_189473 ?auto_189478 ) ) ( not ( = ?auto_189472 ?auto_189478 ) ) ( SURFACE-AT ?auto_189472 ?auto_189476 ) ( CLEAR ?auto_189472 ) ( IS-CRATE ?auto_189471 ) ( AVAILABLE ?auto_189474 ) ( TRUCK-AT ?auto_189475 ?auto_189479 ) ( LIFTING ?auto_189477 ?auto_189471 ) ( ON ?auto_189469 ?auto_189468 ) ( ON ?auto_189470 ?auto_189469 ) ( ON ?auto_189472 ?auto_189470 ) ( not ( = ?auto_189468 ?auto_189469 ) ) ( not ( = ?auto_189468 ?auto_189470 ) ) ( not ( = ?auto_189468 ?auto_189472 ) ) ( not ( = ?auto_189468 ?auto_189471 ) ) ( not ( = ?auto_189468 ?auto_189473 ) ) ( not ( = ?auto_189468 ?auto_189478 ) ) ( not ( = ?auto_189469 ?auto_189470 ) ) ( not ( = ?auto_189469 ?auto_189472 ) ) ( not ( = ?auto_189469 ?auto_189471 ) ) ( not ( = ?auto_189469 ?auto_189473 ) ) ( not ( = ?auto_189469 ?auto_189478 ) ) ( not ( = ?auto_189470 ?auto_189472 ) ) ( not ( = ?auto_189470 ?auto_189471 ) ) ( not ( = ?auto_189470 ?auto_189473 ) ) ( not ( = ?auto_189470 ?auto_189478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189472 ?auto_189471 ?auto_189473 )
      ( MAKE-5CRATE-VERIFY ?auto_189468 ?auto_189469 ?auto_189470 ?auto_189472 ?auto_189471 ?auto_189473 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189480 - SURFACE
      ?auto_189481 - SURFACE
      ?auto_189482 - SURFACE
      ?auto_189484 - SURFACE
      ?auto_189483 - SURFACE
      ?auto_189485 - SURFACE
      ?auto_189486 - SURFACE
    )
    :vars
    (
      ?auto_189487 - HOIST
      ?auto_189489 - PLACE
      ?auto_189492 - PLACE
      ?auto_189490 - HOIST
      ?auto_189491 - SURFACE
      ?auto_189488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189487 ?auto_189489 ) ( IS-CRATE ?auto_189486 ) ( not ( = ?auto_189485 ?auto_189486 ) ) ( not ( = ?auto_189483 ?auto_189485 ) ) ( not ( = ?auto_189483 ?auto_189486 ) ) ( not ( = ?auto_189492 ?auto_189489 ) ) ( HOIST-AT ?auto_189490 ?auto_189492 ) ( not ( = ?auto_189487 ?auto_189490 ) ) ( SURFACE-AT ?auto_189486 ?auto_189492 ) ( ON ?auto_189486 ?auto_189491 ) ( CLEAR ?auto_189486 ) ( not ( = ?auto_189485 ?auto_189491 ) ) ( not ( = ?auto_189486 ?auto_189491 ) ) ( not ( = ?auto_189483 ?auto_189491 ) ) ( SURFACE-AT ?auto_189483 ?auto_189489 ) ( CLEAR ?auto_189483 ) ( IS-CRATE ?auto_189485 ) ( AVAILABLE ?auto_189487 ) ( TRUCK-AT ?auto_189488 ?auto_189492 ) ( LIFTING ?auto_189490 ?auto_189485 ) ( ON ?auto_189481 ?auto_189480 ) ( ON ?auto_189482 ?auto_189481 ) ( ON ?auto_189484 ?auto_189482 ) ( ON ?auto_189483 ?auto_189484 ) ( not ( = ?auto_189480 ?auto_189481 ) ) ( not ( = ?auto_189480 ?auto_189482 ) ) ( not ( = ?auto_189480 ?auto_189484 ) ) ( not ( = ?auto_189480 ?auto_189483 ) ) ( not ( = ?auto_189480 ?auto_189485 ) ) ( not ( = ?auto_189480 ?auto_189486 ) ) ( not ( = ?auto_189480 ?auto_189491 ) ) ( not ( = ?auto_189481 ?auto_189482 ) ) ( not ( = ?auto_189481 ?auto_189484 ) ) ( not ( = ?auto_189481 ?auto_189483 ) ) ( not ( = ?auto_189481 ?auto_189485 ) ) ( not ( = ?auto_189481 ?auto_189486 ) ) ( not ( = ?auto_189481 ?auto_189491 ) ) ( not ( = ?auto_189482 ?auto_189484 ) ) ( not ( = ?auto_189482 ?auto_189483 ) ) ( not ( = ?auto_189482 ?auto_189485 ) ) ( not ( = ?auto_189482 ?auto_189486 ) ) ( not ( = ?auto_189482 ?auto_189491 ) ) ( not ( = ?auto_189484 ?auto_189483 ) ) ( not ( = ?auto_189484 ?auto_189485 ) ) ( not ( = ?auto_189484 ?auto_189486 ) ) ( not ( = ?auto_189484 ?auto_189491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189483 ?auto_189485 ?auto_189486 )
      ( MAKE-6CRATE-VERIFY ?auto_189480 ?auto_189481 ?auto_189482 ?auto_189484 ?auto_189483 ?auto_189485 ?auto_189486 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_189493 - SURFACE
      ?auto_189494 - SURFACE
    )
    :vars
    (
      ?auto_189495 - HOIST
      ?auto_189497 - PLACE
      ?auto_189498 - SURFACE
      ?auto_189501 - PLACE
      ?auto_189499 - HOIST
      ?auto_189500 - SURFACE
      ?auto_189496 - TRUCK
      ?auto_189502 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189495 ?auto_189497 ) ( IS-CRATE ?auto_189494 ) ( not ( = ?auto_189493 ?auto_189494 ) ) ( not ( = ?auto_189498 ?auto_189493 ) ) ( not ( = ?auto_189498 ?auto_189494 ) ) ( not ( = ?auto_189501 ?auto_189497 ) ) ( HOIST-AT ?auto_189499 ?auto_189501 ) ( not ( = ?auto_189495 ?auto_189499 ) ) ( SURFACE-AT ?auto_189494 ?auto_189501 ) ( ON ?auto_189494 ?auto_189500 ) ( CLEAR ?auto_189494 ) ( not ( = ?auto_189493 ?auto_189500 ) ) ( not ( = ?auto_189494 ?auto_189500 ) ) ( not ( = ?auto_189498 ?auto_189500 ) ) ( SURFACE-AT ?auto_189498 ?auto_189497 ) ( CLEAR ?auto_189498 ) ( IS-CRATE ?auto_189493 ) ( AVAILABLE ?auto_189495 ) ( TRUCK-AT ?auto_189496 ?auto_189501 ) ( AVAILABLE ?auto_189499 ) ( SURFACE-AT ?auto_189493 ?auto_189501 ) ( ON ?auto_189493 ?auto_189502 ) ( CLEAR ?auto_189493 ) ( not ( = ?auto_189493 ?auto_189502 ) ) ( not ( = ?auto_189494 ?auto_189502 ) ) ( not ( = ?auto_189498 ?auto_189502 ) ) ( not ( = ?auto_189500 ?auto_189502 ) ) )
    :subtasks
    ( ( !LIFT ?auto_189499 ?auto_189493 ?auto_189502 ?auto_189501 )
      ( MAKE-2CRATE ?auto_189498 ?auto_189493 ?auto_189494 )
      ( MAKE-1CRATE-VERIFY ?auto_189493 ?auto_189494 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_189503 - SURFACE
      ?auto_189504 - SURFACE
      ?auto_189505 - SURFACE
    )
    :vars
    (
      ?auto_189510 - HOIST
      ?auto_189512 - PLACE
      ?auto_189508 - PLACE
      ?auto_189509 - HOIST
      ?auto_189506 - SURFACE
      ?auto_189507 - TRUCK
      ?auto_189511 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189510 ?auto_189512 ) ( IS-CRATE ?auto_189505 ) ( not ( = ?auto_189504 ?auto_189505 ) ) ( not ( = ?auto_189503 ?auto_189504 ) ) ( not ( = ?auto_189503 ?auto_189505 ) ) ( not ( = ?auto_189508 ?auto_189512 ) ) ( HOIST-AT ?auto_189509 ?auto_189508 ) ( not ( = ?auto_189510 ?auto_189509 ) ) ( SURFACE-AT ?auto_189505 ?auto_189508 ) ( ON ?auto_189505 ?auto_189506 ) ( CLEAR ?auto_189505 ) ( not ( = ?auto_189504 ?auto_189506 ) ) ( not ( = ?auto_189505 ?auto_189506 ) ) ( not ( = ?auto_189503 ?auto_189506 ) ) ( SURFACE-AT ?auto_189503 ?auto_189512 ) ( CLEAR ?auto_189503 ) ( IS-CRATE ?auto_189504 ) ( AVAILABLE ?auto_189510 ) ( TRUCK-AT ?auto_189507 ?auto_189508 ) ( AVAILABLE ?auto_189509 ) ( SURFACE-AT ?auto_189504 ?auto_189508 ) ( ON ?auto_189504 ?auto_189511 ) ( CLEAR ?auto_189504 ) ( not ( = ?auto_189504 ?auto_189511 ) ) ( not ( = ?auto_189505 ?auto_189511 ) ) ( not ( = ?auto_189503 ?auto_189511 ) ) ( not ( = ?auto_189506 ?auto_189511 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_189504 ?auto_189505 )
      ( MAKE-2CRATE-VERIFY ?auto_189503 ?auto_189504 ?auto_189505 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_189513 - SURFACE
      ?auto_189514 - SURFACE
      ?auto_189515 - SURFACE
      ?auto_189516 - SURFACE
    )
    :vars
    (
      ?auto_189518 - HOIST
      ?auto_189521 - PLACE
      ?auto_189523 - PLACE
      ?auto_189519 - HOIST
      ?auto_189522 - SURFACE
      ?auto_189520 - TRUCK
      ?auto_189517 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189518 ?auto_189521 ) ( IS-CRATE ?auto_189516 ) ( not ( = ?auto_189515 ?auto_189516 ) ) ( not ( = ?auto_189514 ?auto_189515 ) ) ( not ( = ?auto_189514 ?auto_189516 ) ) ( not ( = ?auto_189523 ?auto_189521 ) ) ( HOIST-AT ?auto_189519 ?auto_189523 ) ( not ( = ?auto_189518 ?auto_189519 ) ) ( SURFACE-AT ?auto_189516 ?auto_189523 ) ( ON ?auto_189516 ?auto_189522 ) ( CLEAR ?auto_189516 ) ( not ( = ?auto_189515 ?auto_189522 ) ) ( not ( = ?auto_189516 ?auto_189522 ) ) ( not ( = ?auto_189514 ?auto_189522 ) ) ( SURFACE-AT ?auto_189514 ?auto_189521 ) ( CLEAR ?auto_189514 ) ( IS-CRATE ?auto_189515 ) ( AVAILABLE ?auto_189518 ) ( TRUCK-AT ?auto_189520 ?auto_189523 ) ( AVAILABLE ?auto_189519 ) ( SURFACE-AT ?auto_189515 ?auto_189523 ) ( ON ?auto_189515 ?auto_189517 ) ( CLEAR ?auto_189515 ) ( not ( = ?auto_189515 ?auto_189517 ) ) ( not ( = ?auto_189516 ?auto_189517 ) ) ( not ( = ?auto_189514 ?auto_189517 ) ) ( not ( = ?auto_189522 ?auto_189517 ) ) ( ON ?auto_189514 ?auto_189513 ) ( not ( = ?auto_189513 ?auto_189514 ) ) ( not ( = ?auto_189513 ?auto_189515 ) ) ( not ( = ?auto_189513 ?auto_189516 ) ) ( not ( = ?auto_189513 ?auto_189522 ) ) ( not ( = ?auto_189513 ?auto_189517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189514 ?auto_189515 ?auto_189516 )
      ( MAKE-3CRATE-VERIFY ?auto_189513 ?auto_189514 ?auto_189515 ?auto_189516 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_189524 - SURFACE
      ?auto_189525 - SURFACE
      ?auto_189526 - SURFACE
      ?auto_189528 - SURFACE
      ?auto_189527 - SURFACE
    )
    :vars
    (
      ?auto_189530 - HOIST
      ?auto_189533 - PLACE
      ?auto_189535 - PLACE
      ?auto_189531 - HOIST
      ?auto_189534 - SURFACE
      ?auto_189532 - TRUCK
      ?auto_189529 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189530 ?auto_189533 ) ( IS-CRATE ?auto_189527 ) ( not ( = ?auto_189528 ?auto_189527 ) ) ( not ( = ?auto_189526 ?auto_189528 ) ) ( not ( = ?auto_189526 ?auto_189527 ) ) ( not ( = ?auto_189535 ?auto_189533 ) ) ( HOIST-AT ?auto_189531 ?auto_189535 ) ( not ( = ?auto_189530 ?auto_189531 ) ) ( SURFACE-AT ?auto_189527 ?auto_189535 ) ( ON ?auto_189527 ?auto_189534 ) ( CLEAR ?auto_189527 ) ( not ( = ?auto_189528 ?auto_189534 ) ) ( not ( = ?auto_189527 ?auto_189534 ) ) ( not ( = ?auto_189526 ?auto_189534 ) ) ( SURFACE-AT ?auto_189526 ?auto_189533 ) ( CLEAR ?auto_189526 ) ( IS-CRATE ?auto_189528 ) ( AVAILABLE ?auto_189530 ) ( TRUCK-AT ?auto_189532 ?auto_189535 ) ( AVAILABLE ?auto_189531 ) ( SURFACE-AT ?auto_189528 ?auto_189535 ) ( ON ?auto_189528 ?auto_189529 ) ( CLEAR ?auto_189528 ) ( not ( = ?auto_189528 ?auto_189529 ) ) ( not ( = ?auto_189527 ?auto_189529 ) ) ( not ( = ?auto_189526 ?auto_189529 ) ) ( not ( = ?auto_189534 ?auto_189529 ) ) ( ON ?auto_189525 ?auto_189524 ) ( ON ?auto_189526 ?auto_189525 ) ( not ( = ?auto_189524 ?auto_189525 ) ) ( not ( = ?auto_189524 ?auto_189526 ) ) ( not ( = ?auto_189524 ?auto_189528 ) ) ( not ( = ?auto_189524 ?auto_189527 ) ) ( not ( = ?auto_189524 ?auto_189534 ) ) ( not ( = ?auto_189524 ?auto_189529 ) ) ( not ( = ?auto_189525 ?auto_189526 ) ) ( not ( = ?auto_189525 ?auto_189528 ) ) ( not ( = ?auto_189525 ?auto_189527 ) ) ( not ( = ?auto_189525 ?auto_189534 ) ) ( not ( = ?auto_189525 ?auto_189529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189526 ?auto_189528 ?auto_189527 )
      ( MAKE-4CRATE-VERIFY ?auto_189524 ?auto_189525 ?auto_189526 ?auto_189528 ?auto_189527 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_189536 - SURFACE
      ?auto_189537 - SURFACE
      ?auto_189538 - SURFACE
      ?auto_189540 - SURFACE
      ?auto_189539 - SURFACE
      ?auto_189541 - SURFACE
    )
    :vars
    (
      ?auto_189543 - HOIST
      ?auto_189546 - PLACE
      ?auto_189548 - PLACE
      ?auto_189544 - HOIST
      ?auto_189547 - SURFACE
      ?auto_189545 - TRUCK
      ?auto_189542 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189543 ?auto_189546 ) ( IS-CRATE ?auto_189541 ) ( not ( = ?auto_189539 ?auto_189541 ) ) ( not ( = ?auto_189540 ?auto_189539 ) ) ( not ( = ?auto_189540 ?auto_189541 ) ) ( not ( = ?auto_189548 ?auto_189546 ) ) ( HOIST-AT ?auto_189544 ?auto_189548 ) ( not ( = ?auto_189543 ?auto_189544 ) ) ( SURFACE-AT ?auto_189541 ?auto_189548 ) ( ON ?auto_189541 ?auto_189547 ) ( CLEAR ?auto_189541 ) ( not ( = ?auto_189539 ?auto_189547 ) ) ( not ( = ?auto_189541 ?auto_189547 ) ) ( not ( = ?auto_189540 ?auto_189547 ) ) ( SURFACE-AT ?auto_189540 ?auto_189546 ) ( CLEAR ?auto_189540 ) ( IS-CRATE ?auto_189539 ) ( AVAILABLE ?auto_189543 ) ( TRUCK-AT ?auto_189545 ?auto_189548 ) ( AVAILABLE ?auto_189544 ) ( SURFACE-AT ?auto_189539 ?auto_189548 ) ( ON ?auto_189539 ?auto_189542 ) ( CLEAR ?auto_189539 ) ( not ( = ?auto_189539 ?auto_189542 ) ) ( not ( = ?auto_189541 ?auto_189542 ) ) ( not ( = ?auto_189540 ?auto_189542 ) ) ( not ( = ?auto_189547 ?auto_189542 ) ) ( ON ?auto_189537 ?auto_189536 ) ( ON ?auto_189538 ?auto_189537 ) ( ON ?auto_189540 ?auto_189538 ) ( not ( = ?auto_189536 ?auto_189537 ) ) ( not ( = ?auto_189536 ?auto_189538 ) ) ( not ( = ?auto_189536 ?auto_189540 ) ) ( not ( = ?auto_189536 ?auto_189539 ) ) ( not ( = ?auto_189536 ?auto_189541 ) ) ( not ( = ?auto_189536 ?auto_189547 ) ) ( not ( = ?auto_189536 ?auto_189542 ) ) ( not ( = ?auto_189537 ?auto_189538 ) ) ( not ( = ?auto_189537 ?auto_189540 ) ) ( not ( = ?auto_189537 ?auto_189539 ) ) ( not ( = ?auto_189537 ?auto_189541 ) ) ( not ( = ?auto_189537 ?auto_189547 ) ) ( not ( = ?auto_189537 ?auto_189542 ) ) ( not ( = ?auto_189538 ?auto_189540 ) ) ( not ( = ?auto_189538 ?auto_189539 ) ) ( not ( = ?auto_189538 ?auto_189541 ) ) ( not ( = ?auto_189538 ?auto_189547 ) ) ( not ( = ?auto_189538 ?auto_189542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189540 ?auto_189539 ?auto_189541 )
      ( MAKE-5CRATE-VERIFY ?auto_189536 ?auto_189537 ?auto_189538 ?auto_189540 ?auto_189539 ?auto_189541 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189549 - SURFACE
      ?auto_189550 - SURFACE
      ?auto_189551 - SURFACE
      ?auto_189553 - SURFACE
      ?auto_189552 - SURFACE
      ?auto_189554 - SURFACE
      ?auto_189555 - SURFACE
    )
    :vars
    (
      ?auto_189557 - HOIST
      ?auto_189560 - PLACE
      ?auto_189562 - PLACE
      ?auto_189558 - HOIST
      ?auto_189561 - SURFACE
      ?auto_189559 - TRUCK
      ?auto_189556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189557 ?auto_189560 ) ( IS-CRATE ?auto_189555 ) ( not ( = ?auto_189554 ?auto_189555 ) ) ( not ( = ?auto_189552 ?auto_189554 ) ) ( not ( = ?auto_189552 ?auto_189555 ) ) ( not ( = ?auto_189562 ?auto_189560 ) ) ( HOIST-AT ?auto_189558 ?auto_189562 ) ( not ( = ?auto_189557 ?auto_189558 ) ) ( SURFACE-AT ?auto_189555 ?auto_189562 ) ( ON ?auto_189555 ?auto_189561 ) ( CLEAR ?auto_189555 ) ( not ( = ?auto_189554 ?auto_189561 ) ) ( not ( = ?auto_189555 ?auto_189561 ) ) ( not ( = ?auto_189552 ?auto_189561 ) ) ( SURFACE-AT ?auto_189552 ?auto_189560 ) ( CLEAR ?auto_189552 ) ( IS-CRATE ?auto_189554 ) ( AVAILABLE ?auto_189557 ) ( TRUCK-AT ?auto_189559 ?auto_189562 ) ( AVAILABLE ?auto_189558 ) ( SURFACE-AT ?auto_189554 ?auto_189562 ) ( ON ?auto_189554 ?auto_189556 ) ( CLEAR ?auto_189554 ) ( not ( = ?auto_189554 ?auto_189556 ) ) ( not ( = ?auto_189555 ?auto_189556 ) ) ( not ( = ?auto_189552 ?auto_189556 ) ) ( not ( = ?auto_189561 ?auto_189556 ) ) ( ON ?auto_189550 ?auto_189549 ) ( ON ?auto_189551 ?auto_189550 ) ( ON ?auto_189553 ?auto_189551 ) ( ON ?auto_189552 ?auto_189553 ) ( not ( = ?auto_189549 ?auto_189550 ) ) ( not ( = ?auto_189549 ?auto_189551 ) ) ( not ( = ?auto_189549 ?auto_189553 ) ) ( not ( = ?auto_189549 ?auto_189552 ) ) ( not ( = ?auto_189549 ?auto_189554 ) ) ( not ( = ?auto_189549 ?auto_189555 ) ) ( not ( = ?auto_189549 ?auto_189561 ) ) ( not ( = ?auto_189549 ?auto_189556 ) ) ( not ( = ?auto_189550 ?auto_189551 ) ) ( not ( = ?auto_189550 ?auto_189553 ) ) ( not ( = ?auto_189550 ?auto_189552 ) ) ( not ( = ?auto_189550 ?auto_189554 ) ) ( not ( = ?auto_189550 ?auto_189555 ) ) ( not ( = ?auto_189550 ?auto_189561 ) ) ( not ( = ?auto_189550 ?auto_189556 ) ) ( not ( = ?auto_189551 ?auto_189553 ) ) ( not ( = ?auto_189551 ?auto_189552 ) ) ( not ( = ?auto_189551 ?auto_189554 ) ) ( not ( = ?auto_189551 ?auto_189555 ) ) ( not ( = ?auto_189551 ?auto_189561 ) ) ( not ( = ?auto_189551 ?auto_189556 ) ) ( not ( = ?auto_189553 ?auto_189552 ) ) ( not ( = ?auto_189553 ?auto_189554 ) ) ( not ( = ?auto_189553 ?auto_189555 ) ) ( not ( = ?auto_189553 ?auto_189561 ) ) ( not ( = ?auto_189553 ?auto_189556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189552 ?auto_189554 ?auto_189555 )
      ( MAKE-6CRATE-VERIFY ?auto_189549 ?auto_189550 ?auto_189551 ?auto_189553 ?auto_189552 ?auto_189554 ?auto_189555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_189563 - SURFACE
      ?auto_189564 - SURFACE
    )
    :vars
    (
      ?auto_189566 - HOIST
      ?auto_189569 - PLACE
      ?auto_189571 - SURFACE
      ?auto_189572 - PLACE
      ?auto_189567 - HOIST
      ?auto_189570 - SURFACE
      ?auto_189565 - SURFACE
      ?auto_189568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189566 ?auto_189569 ) ( IS-CRATE ?auto_189564 ) ( not ( = ?auto_189563 ?auto_189564 ) ) ( not ( = ?auto_189571 ?auto_189563 ) ) ( not ( = ?auto_189571 ?auto_189564 ) ) ( not ( = ?auto_189572 ?auto_189569 ) ) ( HOIST-AT ?auto_189567 ?auto_189572 ) ( not ( = ?auto_189566 ?auto_189567 ) ) ( SURFACE-AT ?auto_189564 ?auto_189572 ) ( ON ?auto_189564 ?auto_189570 ) ( CLEAR ?auto_189564 ) ( not ( = ?auto_189563 ?auto_189570 ) ) ( not ( = ?auto_189564 ?auto_189570 ) ) ( not ( = ?auto_189571 ?auto_189570 ) ) ( SURFACE-AT ?auto_189571 ?auto_189569 ) ( CLEAR ?auto_189571 ) ( IS-CRATE ?auto_189563 ) ( AVAILABLE ?auto_189566 ) ( AVAILABLE ?auto_189567 ) ( SURFACE-AT ?auto_189563 ?auto_189572 ) ( ON ?auto_189563 ?auto_189565 ) ( CLEAR ?auto_189563 ) ( not ( = ?auto_189563 ?auto_189565 ) ) ( not ( = ?auto_189564 ?auto_189565 ) ) ( not ( = ?auto_189571 ?auto_189565 ) ) ( not ( = ?auto_189570 ?auto_189565 ) ) ( TRUCK-AT ?auto_189568 ?auto_189569 ) )
    :subtasks
    ( ( !DRIVE ?auto_189568 ?auto_189569 ?auto_189572 )
      ( MAKE-2CRATE ?auto_189571 ?auto_189563 ?auto_189564 )
      ( MAKE-1CRATE-VERIFY ?auto_189563 ?auto_189564 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_189573 - SURFACE
      ?auto_189574 - SURFACE
      ?auto_189575 - SURFACE
    )
    :vars
    (
      ?auto_189579 - HOIST
      ?auto_189581 - PLACE
      ?auto_189577 - PLACE
      ?auto_189582 - HOIST
      ?auto_189576 - SURFACE
      ?auto_189580 - SURFACE
      ?auto_189578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189579 ?auto_189581 ) ( IS-CRATE ?auto_189575 ) ( not ( = ?auto_189574 ?auto_189575 ) ) ( not ( = ?auto_189573 ?auto_189574 ) ) ( not ( = ?auto_189573 ?auto_189575 ) ) ( not ( = ?auto_189577 ?auto_189581 ) ) ( HOIST-AT ?auto_189582 ?auto_189577 ) ( not ( = ?auto_189579 ?auto_189582 ) ) ( SURFACE-AT ?auto_189575 ?auto_189577 ) ( ON ?auto_189575 ?auto_189576 ) ( CLEAR ?auto_189575 ) ( not ( = ?auto_189574 ?auto_189576 ) ) ( not ( = ?auto_189575 ?auto_189576 ) ) ( not ( = ?auto_189573 ?auto_189576 ) ) ( SURFACE-AT ?auto_189573 ?auto_189581 ) ( CLEAR ?auto_189573 ) ( IS-CRATE ?auto_189574 ) ( AVAILABLE ?auto_189579 ) ( AVAILABLE ?auto_189582 ) ( SURFACE-AT ?auto_189574 ?auto_189577 ) ( ON ?auto_189574 ?auto_189580 ) ( CLEAR ?auto_189574 ) ( not ( = ?auto_189574 ?auto_189580 ) ) ( not ( = ?auto_189575 ?auto_189580 ) ) ( not ( = ?auto_189573 ?auto_189580 ) ) ( not ( = ?auto_189576 ?auto_189580 ) ) ( TRUCK-AT ?auto_189578 ?auto_189581 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_189574 ?auto_189575 )
      ( MAKE-2CRATE-VERIFY ?auto_189573 ?auto_189574 ?auto_189575 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_189583 - SURFACE
      ?auto_189584 - SURFACE
      ?auto_189585 - SURFACE
      ?auto_189586 - SURFACE
    )
    :vars
    (
      ?auto_189591 - HOIST
      ?auto_189593 - PLACE
      ?auto_189592 - PLACE
      ?auto_189589 - HOIST
      ?auto_189590 - SURFACE
      ?auto_189588 - SURFACE
      ?auto_189587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189591 ?auto_189593 ) ( IS-CRATE ?auto_189586 ) ( not ( = ?auto_189585 ?auto_189586 ) ) ( not ( = ?auto_189584 ?auto_189585 ) ) ( not ( = ?auto_189584 ?auto_189586 ) ) ( not ( = ?auto_189592 ?auto_189593 ) ) ( HOIST-AT ?auto_189589 ?auto_189592 ) ( not ( = ?auto_189591 ?auto_189589 ) ) ( SURFACE-AT ?auto_189586 ?auto_189592 ) ( ON ?auto_189586 ?auto_189590 ) ( CLEAR ?auto_189586 ) ( not ( = ?auto_189585 ?auto_189590 ) ) ( not ( = ?auto_189586 ?auto_189590 ) ) ( not ( = ?auto_189584 ?auto_189590 ) ) ( SURFACE-AT ?auto_189584 ?auto_189593 ) ( CLEAR ?auto_189584 ) ( IS-CRATE ?auto_189585 ) ( AVAILABLE ?auto_189591 ) ( AVAILABLE ?auto_189589 ) ( SURFACE-AT ?auto_189585 ?auto_189592 ) ( ON ?auto_189585 ?auto_189588 ) ( CLEAR ?auto_189585 ) ( not ( = ?auto_189585 ?auto_189588 ) ) ( not ( = ?auto_189586 ?auto_189588 ) ) ( not ( = ?auto_189584 ?auto_189588 ) ) ( not ( = ?auto_189590 ?auto_189588 ) ) ( TRUCK-AT ?auto_189587 ?auto_189593 ) ( ON ?auto_189584 ?auto_189583 ) ( not ( = ?auto_189583 ?auto_189584 ) ) ( not ( = ?auto_189583 ?auto_189585 ) ) ( not ( = ?auto_189583 ?auto_189586 ) ) ( not ( = ?auto_189583 ?auto_189590 ) ) ( not ( = ?auto_189583 ?auto_189588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189584 ?auto_189585 ?auto_189586 )
      ( MAKE-3CRATE-VERIFY ?auto_189583 ?auto_189584 ?auto_189585 ?auto_189586 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_189594 - SURFACE
      ?auto_189595 - SURFACE
      ?auto_189596 - SURFACE
      ?auto_189598 - SURFACE
      ?auto_189597 - SURFACE
    )
    :vars
    (
      ?auto_189603 - HOIST
      ?auto_189605 - PLACE
      ?auto_189604 - PLACE
      ?auto_189601 - HOIST
      ?auto_189602 - SURFACE
      ?auto_189600 - SURFACE
      ?auto_189599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189603 ?auto_189605 ) ( IS-CRATE ?auto_189597 ) ( not ( = ?auto_189598 ?auto_189597 ) ) ( not ( = ?auto_189596 ?auto_189598 ) ) ( not ( = ?auto_189596 ?auto_189597 ) ) ( not ( = ?auto_189604 ?auto_189605 ) ) ( HOIST-AT ?auto_189601 ?auto_189604 ) ( not ( = ?auto_189603 ?auto_189601 ) ) ( SURFACE-AT ?auto_189597 ?auto_189604 ) ( ON ?auto_189597 ?auto_189602 ) ( CLEAR ?auto_189597 ) ( not ( = ?auto_189598 ?auto_189602 ) ) ( not ( = ?auto_189597 ?auto_189602 ) ) ( not ( = ?auto_189596 ?auto_189602 ) ) ( SURFACE-AT ?auto_189596 ?auto_189605 ) ( CLEAR ?auto_189596 ) ( IS-CRATE ?auto_189598 ) ( AVAILABLE ?auto_189603 ) ( AVAILABLE ?auto_189601 ) ( SURFACE-AT ?auto_189598 ?auto_189604 ) ( ON ?auto_189598 ?auto_189600 ) ( CLEAR ?auto_189598 ) ( not ( = ?auto_189598 ?auto_189600 ) ) ( not ( = ?auto_189597 ?auto_189600 ) ) ( not ( = ?auto_189596 ?auto_189600 ) ) ( not ( = ?auto_189602 ?auto_189600 ) ) ( TRUCK-AT ?auto_189599 ?auto_189605 ) ( ON ?auto_189595 ?auto_189594 ) ( ON ?auto_189596 ?auto_189595 ) ( not ( = ?auto_189594 ?auto_189595 ) ) ( not ( = ?auto_189594 ?auto_189596 ) ) ( not ( = ?auto_189594 ?auto_189598 ) ) ( not ( = ?auto_189594 ?auto_189597 ) ) ( not ( = ?auto_189594 ?auto_189602 ) ) ( not ( = ?auto_189594 ?auto_189600 ) ) ( not ( = ?auto_189595 ?auto_189596 ) ) ( not ( = ?auto_189595 ?auto_189598 ) ) ( not ( = ?auto_189595 ?auto_189597 ) ) ( not ( = ?auto_189595 ?auto_189602 ) ) ( not ( = ?auto_189595 ?auto_189600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189596 ?auto_189598 ?auto_189597 )
      ( MAKE-4CRATE-VERIFY ?auto_189594 ?auto_189595 ?auto_189596 ?auto_189598 ?auto_189597 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_189606 - SURFACE
      ?auto_189607 - SURFACE
      ?auto_189608 - SURFACE
      ?auto_189610 - SURFACE
      ?auto_189609 - SURFACE
      ?auto_189611 - SURFACE
    )
    :vars
    (
      ?auto_189616 - HOIST
      ?auto_189618 - PLACE
      ?auto_189617 - PLACE
      ?auto_189614 - HOIST
      ?auto_189615 - SURFACE
      ?auto_189613 - SURFACE
      ?auto_189612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189616 ?auto_189618 ) ( IS-CRATE ?auto_189611 ) ( not ( = ?auto_189609 ?auto_189611 ) ) ( not ( = ?auto_189610 ?auto_189609 ) ) ( not ( = ?auto_189610 ?auto_189611 ) ) ( not ( = ?auto_189617 ?auto_189618 ) ) ( HOIST-AT ?auto_189614 ?auto_189617 ) ( not ( = ?auto_189616 ?auto_189614 ) ) ( SURFACE-AT ?auto_189611 ?auto_189617 ) ( ON ?auto_189611 ?auto_189615 ) ( CLEAR ?auto_189611 ) ( not ( = ?auto_189609 ?auto_189615 ) ) ( not ( = ?auto_189611 ?auto_189615 ) ) ( not ( = ?auto_189610 ?auto_189615 ) ) ( SURFACE-AT ?auto_189610 ?auto_189618 ) ( CLEAR ?auto_189610 ) ( IS-CRATE ?auto_189609 ) ( AVAILABLE ?auto_189616 ) ( AVAILABLE ?auto_189614 ) ( SURFACE-AT ?auto_189609 ?auto_189617 ) ( ON ?auto_189609 ?auto_189613 ) ( CLEAR ?auto_189609 ) ( not ( = ?auto_189609 ?auto_189613 ) ) ( not ( = ?auto_189611 ?auto_189613 ) ) ( not ( = ?auto_189610 ?auto_189613 ) ) ( not ( = ?auto_189615 ?auto_189613 ) ) ( TRUCK-AT ?auto_189612 ?auto_189618 ) ( ON ?auto_189607 ?auto_189606 ) ( ON ?auto_189608 ?auto_189607 ) ( ON ?auto_189610 ?auto_189608 ) ( not ( = ?auto_189606 ?auto_189607 ) ) ( not ( = ?auto_189606 ?auto_189608 ) ) ( not ( = ?auto_189606 ?auto_189610 ) ) ( not ( = ?auto_189606 ?auto_189609 ) ) ( not ( = ?auto_189606 ?auto_189611 ) ) ( not ( = ?auto_189606 ?auto_189615 ) ) ( not ( = ?auto_189606 ?auto_189613 ) ) ( not ( = ?auto_189607 ?auto_189608 ) ) ( not ( = ?auto_189607 ?auto_189610 ) ) ( not ( = ?auto_189607 ?auto_189609 ) ) ( not ( = ?auto_189607 ?auto_189611 ) ) ( not ( = ?auto_189607 ?auto_189615 ) ) ( not ( = ?auto_189607 ?auto_189613 ) ) ( not ( = ?auto_189608 ?auto_189610 ) ) ( not ( = ?auto_189608 ?auto_189609 ) ) ( not ( = ?auto_189608 ?auto_189611 ) ) ( not ( = ?auto_189608 ?auto_189615 ) ) ( not ( = ?auto_189608 ?auto_189613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189610 ?auto_189609 ?auto_189611 )
      ( MAKE-5CRATE-VERIFY ?auto_189606 ?auto_189607 ?auto_189608 ?auto_189610 ?auto_189609 ?auto_189611 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189619 - SURFACE
      ?auto_189620 - SURFACE
      ?auto_189621 - SURFACE
      ?auto_189623 - SURFACE
      ?auto_189622 - SURFACE
      ?auto_189624 - SURFACE
      ?auto_189625 - SURFACE
    )
    :vars
    (
      ?auto_189630 - HOIST
      ?auto_189632 - PLACE
      ?auto_189631 - PLACE
      ?auto_189628 - HOIST
      ?auto_189629 - SURFACE
      ?auto_189627 - SURFACE
      ?auto_189626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189630 ?auto_189632 ) ( IS-CRATE ?auto_189625 ) ( not ( = ?auto_189624 ?auto_189625 ) ) ( not ( = ?auto_189622 ?auto_189624 ) ) ( not ( = ?auto_189622 ?auto_189625 ) ) ( not ( = ?auto_189631 ?auto_189632 ) ) ( HOIST-AT ?auto_189628 ?auto_189631 ) ( not ( = ?auto_189630 ?auto_189628 ) ) ( SURFACE-AT ?auto_189625 ?auto_189631 ) ( ON ?auto_189625 ?auto_189629 ) ( CLEAR ?auto_189625 ) ( not ( = ?auto_189624 ?auto_189629 ) ) ( not ( = ?auto_189625 ?auto_189629 ) ) ( not ( = ?auto_189622 ?auto_189629 ) ) ( SURFACE-AT ?auto_189622 ?auto_189632 ) ( CLEAR ?auto_189622 ) ( IS-CRATE ?auto_189624 ) ( AVAILABLE ?auto_189630 ) ( AVAILABLE ?auto_189628 ) ( SURFACE-AT ?auto_189624 ?auto_189631 ) ( ON ?auto_189624 ?auto_189627 ) ( CLEAR ?auto_189624 ) ( not ( = ?auto_189624 ?auto_189627 ) ) ( not ( = ?auto_189625 ?auto_189627 ) ) ( not ( = ?auto_189622 ?auto_189627 ) ) ( not ( = ?auto_189629 ?auto_189627 ) ) ( TRUCK-AT ?auto_189626 ?auto_189632 ) ( ON ?auto_189620 ?auto_189619 ) ( ON ?auto_189621 ?auto_189620 ) ( ON ?auto_189623 ?auto_189621 ) ( ON ?auto_189622 ?auto_189623 ) ( not ( = ?auto_189619 ?auto_189620 ) ) ( not ( = ?auto_189619 ?auto_189621 ) ) ( not ( = ?auto_189619 ?auto_189623 ) ) ( not ( = ?auto_189619 ?auto_189622 ) ) ( not ( = ?auto_189619 ?auto_189624 ) ) ( not ( = ?auto_189619 ?auto_189625 ) ) ( not ( = ?auto_189619 ?auto_189629 ) ) ( not ( = ?auto_189619 ?auto_189627 ) ) ( not ( = ?auto_189620 ?auto_189621 ) ) ( not ( = ?auto_189620 ?auto_189623 ) ) ( not ( = ?auto_189620 ?auto_189622 ) ) ( not ( = ?auto_189620 ?auto_189624 ) ) ( not ( = ?auto_189620 ?auto_189625 ) ) ( not ( = ?auto_189620 ?auto_189629 ) ) ( not ( = ?auto_189620 ?auto_189627 ) ) ( not ( = ?auto_189621 ?auto_189623 ) ) ( not ( = ?auto_189621 ?auto_189622 ) ) ( not ( = ?auto_189621 ?auto_189624 ) ) ( not ( = ?auto_189621 ?auto_189625 ) ) ( not ( = ?auto_189621 ?auto_189629 ) ) ( not ( = ?auto_189621 ?auto_189627 ) ) ( not ( = ?auto_189623 ?auto_189622 ) ) ( not ( = ?auto_189623 ?auto_189624 ) ) ( not ( = ?auto_189623 ?auto_189625 ) ) ( not ( = ?auto_189623 ?auto_189629 ) ) ( not ( = ?auto_189623 ?auto_189627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189622 ?auto_189624 ?auto_189625 )
      ( MAKE-6CRATE-VERIFY ?auto_189619 ?auto_189620 ?auto_189621 ?auto_189623 ?auto_189622 ?auto_189624 ?auto_189625 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_189633 - SURFACE
      ?auto_189634 - SURFACE
    )
    :vars
    (
      ?auto_189640 - HOIST
      ?auto_189642 - PLACE
      ?auto_189639 - SURFACE
      ?auto_189641 - PLACE
      ?auto_189637 - HOIST
      ?auto_189638 - SURFACE
      ?auto_189636 - SURFACE
      ?auto_189635 - TRUCK
      ?auto_189643 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189640 ?auto_189642 ) ( IS-CRATE ?auto_189634 ) ( not ( = ?auto_189633 ?auto_189634 ) ) ( not ( = ?auto_189639 ?auto_189633 ) ) ( not ( = ?auto_189639 ?auto_189634 ) ) ( not ( = ?auto_189641 ?auto_189642 ) ) ( HOIST-AT ?auto_189637 ?auto_189641 ) ( not ( = ?auto_189640 ?auto_189637 ) ) ( SURFACE-AT ?auto_189634 ?auto_189641 ) ( ON ?auto_189634 ?auto_189638 ) ( CLEAR ?auto_189634 ) ( not ( = ?auto_189633 ?auto_189638 ) ) ( not ( = ?auto_189634 ?auto_189638 ) ) ( not ( = ?auto_189639 ?auto_189638 ) ) ( IS-CRATE ?auto_189633 ) ( AVAILABLE ?auto_189637 ) ( SURFACE-AT ?auto_189633 ?auto_189641 ) ( ON ?auto_189633 ?auto_189636 ) ( CLEAR ?auto_189633 ) ( not ( = ?auto_189633 ?auto_189636 ) ) ( not ( = ?auto_189634 ?auto_189636 ) ) ( not ( = ?auto_189639 ?auto_189636 ) ) ( not ( = ?auto_189638 ?auto_189636 ) ) ( TRUCK-AT ?auto_189635 ?auto_189642 ) ( SURFACE-AT ?auto_189643 ?auto_189642 ) ( CLEAR ?auto_189643 ) ( LIFTING ?auto_189640 ?auto_189639 ) ( IS-CRATE ?auto_189639 ) ( not ( = ?auto_189643 ?auto_189639 ) ) ( not ( = ?auto_189633 ?auto_189643 ) ) ( not ( = ?auto_189634 ?auto_189643 ) ) ( not ( = ?auto_189638 ?auto_189643 ) ) ( not ( = ?auto_189636 ?auto_189643 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_189643 ?auto_189639 )
      ( MAKE-2CRATE ?auto_189639 ?auto_189633 ?auto_189634 )
      ( MAKE-1CRATE-VERIFY ?auto_189633 ?auto_189634 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_189644 - SURFACE
      ?auto_189645 - SURFACE
      ?auto_189646 - SURFACE
    )
    :vars
    (
      ?auto_189652 - HOIST
      ?auto_189647 - PLACE
      ?auto_189648 - PLACE
      ?auto_189651 - HOIST
      ?auto_189653 - SURFACE
      ?auto_189654 - SURFACE
      ?auto_189650 - TRUCK
      ?auto_189649 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_189652 ?auto_189647 ) ( IS-CRATE ?auto_189646 ) ( not ( = ?auto_189645 ?auto_189646 ) ) ( not ( = ?auto_189644 ?auto_189645 ) ) ( not ( = ?auto_189644 ?auto_189646 ) ) ( not ( = ?auto_189648 ?auto_189647 ) ) ( HOIST-AT ?auto_189651 ?auto_189648 ) ( not ( = ?auto_189652 ?auto_189651 ) ) ( SURFACE-AT ?auto_189646 ?auto_189648 ) ( ON ?auto_189646 ?auto_189653 ) ( CLEAR ?auto_189646 ) ( not ( = ?auto_189645 ?auto_189653 ) ) ( not ( = ?auto_189646 ?auto_189653 ) ) ( not ( = ?auto_189644 ?auto_189653 ) ) ( IS-CRATE ?auto_189645 ) ( AVAILABLE ?auto_189651 ) ( SURFACE-AT ?auto_189645 ?auto_189648 ) ( ON ?auto_189645 ?auto_189654 ) ( CLEAR ?auto_189645 ) ( not ( = ?auto_189645 ?auto_189654 ) ) ( not ( = ?auto_189646 ?auto_189654 ) ) ( not ( = ?auto_189644 ?auto_189654 ) ) ( not ( = ?auto_189653 ?auto_189654 ) ) ( TRUCK-AT ?auto_189650 ?auto_189647 ) ( SURFACE-AT ?auto_189649 ?auto_189647 ) ( CLEAR ?auto_189649 ) ( LIFTING ?auto_189652 ?auto_189644 ) ( IS-CRATE ?auto_189644 ) ( not ( = ?auto_189649 ?auto_189644 ) ) ( not ( = ?auto_189645 ?auto_189649 ) ) ( not ( = ?auto_189646 ?auto_189649 ) ) ( not ( = ?auto_189653 ?auto_189649 ) ) ( not ( = ?auto_189654 ?auto_189649 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_189645 ?auto_189646 )
      ( MAKE-2CRATE-VERIFY ?auto_189644 ?auto_189645 ?auto_189646 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_189655 - SURFACE
      ?auto_189656 - SURFACE
      ?auto_189657 - SURFACE
      ?auto_189658 - SURFACE
    )
    :vars
    (
      ?auto_189665 - HOIST
      ?auto_189659 - PLACE
      ?auto_189660 - PLACE
      ?auto_189663 - HOIST
      ?auto_189662 - SURFACE
      ?auto_189661 - SURFACE
      ?auto_189664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189665 ?auto_189659 ) ( IS-CRATE ?auto_189658 ) ( not ( = ?auto_189657 ?auto_189658 ) ) ( not ( = ?auto_189656 ?auto_189657 ) ) ( not ( = ?auto_189656 ?auto_189658 ) ) ( not ( = ?auto_189660 ?auto_189659 ) ) ( HOIST-AT ?auto_189663 ?auto_189660 ) ( not ( = ?auto_189665 ?auto_189663 ) ) ( SURFACE-AT ?auto_189658 ?auto_189660 ) ( ON ?auto_189658 ?auto_189662 ) ( CLEAR ?auto_189658 ) ( not ( = ?auto_189657 ?auto_189662 ) ) ( not ( = ?auto_189658 ?auto_189662 ) ) ( not ( = ?auto_189656 ?auto_189662 ) ) ( IS-CRATE ?auto_189657 ) ( AVAILABLE ?auto_189663 ) ( SURFACE-AT ?auto_189657 ?auto_189660 ) ( ON ?auto_189657 ?auto_189661 ) ( CLEAR ?auto_189657 ) ( not ( = ?auto_189657 ?auto_189661 ) ) ( not ( = ?auto_189658 ?auto_189661 ) ) ( not ( = ?auto_189656 ?auto_189661 ) ) ( not ( = ?auto_189662 ?auto_189661 ) ) ( TRUCK-AT ?auto_189664 ?auto_189659 ) ( SURFACE-AT ?auto_189655 ?auto_189659 ) ( CLEAR ?auto_189655 ) ( LIFTING ?auto_189665 ?auto_189656 ) ( IS-CRATE ?auto_189656 ) ( not ( = ?auto_189655 ?auto_189656 ) ) ( not ( = ?auto_189657 ?auto_189655 ) ) ( not ( = ?auto_189658 ?auto_189655 ) ) ( not ( = ?auto_189662 ?auto_189655 ) ) ( not ( = ?auto_189661 ?auto_189655 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189656 ?auto_189657 ?auto_189658 )
      ( MAKE-3CRATE-VERIFY ?auto_189655 ?auto_189656 ?auto_189657 ?auto_189658 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_189666 - SURFACE
      ?auto_189667 - SURFACE
      ?auto_189668 - SURFACE
      ?auto_189670 - SURFACE
      ?auto_189669 - SURFACE
    )
    :vars
    (
      ?auto_189677 - HOIST
      ?auto_189671 - PLACE
      ?auto_189672 - PLACE
      ?auto_189675 - HOIST
      ?auto_189674 - SURFACE
      ?auto_189673 - SURFACE
      ?auto_189676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189677 ?auto_189671 ) ( IS-CRATE ?auto_189669 ) ( not ( = ?auto_189670 ?auto_189669 ) ) ( not ( = ?auto_189668 ?auto_189670 ) ) ( not ( = ?auto_189668 ?auto_189669 ) ) ( not ( = ?auto_189672 ?auto_189671 ) ) ( HOIST-AT ?auto_189675 ?auto_189672 ) ( not ( = ?auto_189677 ?auto_189675 ) ) ( SURFACE-AT ?auto_189669 ?auto_189672 ) ( ON ?auto_189669 ?auto_189674 ) ( CLEAR ?auto_189669 ) ( not ( = ?auto_189670 ?auto_189674 ) ) ( not ( = ?auto_189669 ?auto_189674 ) ) ( not ( = ?auto_189668 ?auto_189674 ) ) ( IS-CRATE ?auto_189670 ) ( AVAILABLE ?auto_189675 ) ( SURFACE-AT ?auto_189670 ?auto_189672 ) ( ON ?auto_189670 ?auto_189673 ) ( CLEAR ?auto_189670 ) ( not ( = ?auto_189670 ?auto_189673 ) ) ( not ( = ?auto_189669 ?auto_189673 ) ) ( not ( = ?auto_189668 ?auto_189673 ) ) ( not ( = ?auto_189674 ?auto_189673 ) ) ( TRUCK-AT ?auto_189676 ?auto_189671 ) ( SURFACE-AT ?auto_189667 ?auto_189671 ) ( CLEAR ?auto_189667 ) ( LIFTING ?auto_189677 ?auto_189668 ) ( IS-CRATE ?auto_189668 ) ( not ( = ?auto_189667 ?auto_189668 ) ) ( not ( = ?auto_189670 ?auto_189667 ) ) ( not ( = ?auto_189669 ?auto_189667 ) ) ( not ( = ?auto_189674 ?auto_189667 ) ) ( not ( = ?auto_189673 ?auto_189667 ) ) ( ON ?auto_189667 ?auto_189666 ) ( not ( = ?auto_189666 ?auto_189667 ) ) ( not ( = ?auto_189666 ?auto_189668 ) ) ( not ( = ?auto_189666 ?auto_189670 ) ) ( not ( = ?auto_189666 ?auto_189669 ) ) ( not ( = ?auto_189666 ?auto_189674 ) ) ( not ( = ?auto_189666 ?auto_189673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189668 ?auto_189670 ?auto_189669 )
      ( MAKE-4CRATE-VERIFY ?auto_189666 ?auto_189667 ?auto_189668 ?auto_189670 ?auto_189669 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_189678 - SURFACE
      ?auto_189679 - SURFACE
      ?auto_189680 - SURFACE
      ?auto_189682 - SURFACE
      ?auto_189681 - SURFACE
      ?auto_189683 - SURFACE
    )
    :vars
    (
      ?auto_189690 - HOIST
      ?auto_189684 - PLACE
      ?auto_189685 - PLACE
      ?auto_189688 - HOIST
      ?auto_189687 - SURFACE
      ?auto_189686 - SURFACE
      ?auto_189689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189690 ?auto_189684 ) ( IS-CRATE ?auto_189683 ) ( not ( = ?auto_189681 ?auto_189683 ) ) ( not ( = ?auto_189682 ?auto_189681 ) ) ( not ( = ?auto_189682 ?auto_189683 ) ) ( not ( = ?auto_189685 ?auto_189684 ) ) ( HOIST-AT ?auto_189688 ?auto_189685 ) ( not ( = ?auto_189690 ?auto_189688 ) ) ( SURFACE-AT ?auto_189683 ?auto_189685 ) ( ON ?auto_189683 ?auto_189687 ) ( CLEAR ?auto_189683 ) ( not ( = ?auto_189681 ?auto_189687 ) ) ( not ( = ?auto_189683 ?auto_189687 ) ) ( not ( = ?auto_189682 ?auto_189687 ) ) ( IS-CRATE ?auto_189681 ) ( AVAILABLE ?auto_189688 ) ( SURFACE-AT ?auto_189681 ?auto_189685 ) ( ON ?auto_189681 ?auto_189686 ) ( CLEAR ?auto_189681 ) ( not ( = ?auto_189681 ?auto_189686 ) ) ( not ( = ?auto_189683 ?auto_189686 ) ) ( not ( = ?auto_189682 ?auto_189686 ) ) ( not ( = ?auto_189687 ?auto_189686 ) ) ( TRUCK-AT ?auto_189689 ?auto_189684 ) ( SURFACE-AT ?auto_189680 ?auto_189684 ) ( CLEAR ?auto_189680 ) ( LIFTING ?auto_189690 ?auto_189682 ) ( IS-CRATE ?auto_189682 ) ( not ( = ?auto_189680 ?auto_189682 ) ) ( not ( = ?auto_189681 ?auto_189680 ) ) ( not ( = ?auto_189683 ?auto_189680 ) ) ( not ( = ?auto_189687 ?auto_189680 ) ) ( not ( = ?auto_189686 ?auto_189680 ) ) ( ON ?auto_189679 ?auto_189678 ) ( ON ?auto_189680 ?auto_189679 ) ( not ( = ?auto_189678 ?auto_189679 ) ) ( not ( = ?auto_189678 ?auto_189680 ) ) ( not ( = ?auto_189678 ?auto_189682 ) ) ( not ( = ?auto_189678 ?auto_189681 ) ) ( not ( = ?auto_189678 ?auto_189683 ) ) ( not ( = ?auto_189678 ?auto_189687 ) ) ( not ( = ?auto_189678 ?auto_189686 ) ) ( not ( = ?auto_189679 ?auto_189680 ) ) ( not ( = ?auto_189679 ?auto_189682 ) ) ( not ( = ?auto_189679 ?auto_189681 ) ) ( not ( = ?auto_189679 ?auto_189683 ) ) ( not ( = ?auto_189679 ?auto_189687 ) ) ( not ( = ?auto_189679 ?auto_189686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189682 ?auto_189681 ?auto_189683 )
      ( MAKE-5CRATE-VERIFY ?auto_189678 ?auto_189679 ?auto_189680 ?auto_189682 ?auto_189681 ?auto_189683 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_189691 - SURFACE
      ?auto_189692 - SURFACE
      ?auto_189693 - SURFACE
      ?auto_189695 - SURFACE
      ?auto_189694 - SURFACE
      ?auto_189696 - SURFACE
      ?auto_189697 - SURFACE
    )
    :vars
    (
      ?auto_189704 - HOIST
      ?auto_189698 - PLACE
      ?auto_189699 - PLACE
      ?auto_189702 - HOIST
      ?auto_189701 - SURFACE
      ?auto_189700 - SURFACE
      ?auto_189703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_189704 ?auto_189698 ) ( IS-CRATE ?auto_189697 ) ( not ( = ?auto_189696 ?auto_189697 ) ) ( not ( = ?auto_189694 ?auto_189696 ) ) ( not ( = ?auto_189694 ?auto_189697 ) ) ( not ( = ?auto_189699 ?auto_189698 ) ) ( HOIST-AT ?auto_189702 ?auto_189699 ) ( not ( = ?auto_189704 ?auto_189702 ) ) ( SURFACE-AT ?auto_189697 ?auto_189699 ) ( ON ?auto_189697 ?auto_189701 ) ( CLEAR ?auto_189697 ) ( not ( = ?auto_189696 ?auto_189701 ) ) ( not ( = ?auto_189697 ?auto_189701 ) ) ( not ( = ?auto_189694 ?auto_189701 ) ) ( IS-CRATE ?auto_189696 ) ( AVAILABLE ?auto_189702 ) ( SURFACE-AT ?auto_189696 ?auto_189699 ) ( ON ?auto_189696 ?auto_189700 ) ( CLEAR ?auto_189696 ) ( not ( = ?auto_189696 ?auto_189700 ) ) ( not ( = ?auto_189697 ?auto_189700 ) ) ( not ( = ?auto_189694 ?auto_189700 ) ) ( not ( = ?auto_189701 ?auto_189700 ) ) ( TRUCK-AT ?auto_189703 ?auto_189698 ) ( SURFACE-AT ?auto_189695 ?auto_189698 ) ( CLEAR ?auto_189695 ) ( LIFTING ?auto_189704 ?auto_189694 ) ( IS-CRATE ?auto_189694 ) ( not ( = ?auto_189695 ?auto_189694 ) ) ( not ( = ?auto_189696 ?auto_189695 ) ) ( not ( = ?auto_189697 ?auto_189695 ) ) ( not ( = ?auto_189701 ?auto_189695 ) ) ( not ( = ?auto_189700 ?auto_189695 ) ) ( ON ?auto_189692 ?auto_189691 ) ( ON ?auto_189693 ?auto_189692 ) ( ON ?auto_189695 ?auto_189693 ) ( not ( = ?auto_189691 ?auto_189692 ) ) ( not ( = ?auto_189691 ?auto_189693 ) ) ( not ( = ?auto_189691 ?auto_189695 ) ) ( not ( = ?auto_189691 ?auto_189694 ) ) ( not ( = ?auto_189691 ?auto_189696 ) ) ( not ( = ?auto_189691 ?auto_189697 ) ) ( not ( = ?auto_189691 ?auto_189701 ) ) ( not ( = ?auto_189691 ?auto_189700 ) ) ( not ( = ?auto_189692 ?auto_189693 ) ) ( not ( = ?auto_189692 ?auto_189695 ) ) ( not ( = ?auto_189692 ?auto_189694 ) ) ( not ( = ?auto_189692 ?auto_189696 ) ) ( not ( = ?auto_189692 ?auto_189697 ) ) ( not ( = ?auto_189692 ?auto_189701 ) ) ( not ( = ?auto_189692 ?auto_189700 ) ) ( not ( = ?auto_189693 ?auto_189695 ) ) ( not ( = ?auto_189693 ?auto_189694 ) ) ( not ( = ?auto_189693 ?auto_189696 ) ) ( not ( = ?auto_189693 ?auto_189697 ) ) ( not ( = ?auto_189693 ?auto_189701 ) ) ( not ( = ?auto_189693 ?auto_189700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_189694 ?auto_189696 ?auto_189697 )
      ( MAKE-6CRATE-VERIFY ?auto_189691 ?auto_189692 ?auto_189693 ?auto_189695 ?auto_189694 ?auto_189696 ?auto_189697 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191277 - SURFACE
      ?auto_191278 - SURFACE
      ?auto_191279 - SURFACE
      ?auto_191281 - SURFACE
      ?auto_191280 - SURFACE
      ?auto_191282 - SURFACE
      ?auto_191283 - SURFACE
      ?auto_191284 - SURFACE
    )
    :vars
    (
      ?auto_191286 - HOIST
      ?auto_191285 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_191286 ?auto_191285 ) ( SURFACE-AT ?auto_191283 ?auto_191285 ) ( CLEAR ?auto_191283 ) ( LIFTING ?auto_191286 ?auto_191284 ) ( IS-CRATE ?auto_191284 ) ( not ( = ?auto_191283 ?auto_191284 ) ) ( ON ?auto_191278 ?auto_191277 ) ( ON ?auto_191279 ?auto_191278 ) ( ON ?auto_191281 ?auto_191279 ) ( ON ?auto_191280 ?auto_191281 ) ( ON ?auto_191282 ?auto_191280 ) ( ON ?auto_191283 ?auto_191282 ) ( not ( = ?auto_191277 ?auto_191278 ) ) ( not ( = ?auto_191277 ?auto_191279 ) ) ( not ( = ?auto_191277 ?auto_191281 ) ) ( not ( = ?auto_191277 ?auto_191280 ) ) ( not ( = ?auto_191277 ?auto_191282 ) ) ( not ( = ?auto_191277 ?auto_191283 ) ) ( not ( = ?auto_191277 ?auto_191284 ) ) ( not ( = ?auto_191278 ?auto_191279 ) ) ( not ( = ?auto_191278 ?auto_191281 ) ) ( not ( = ?auto_191278 ?auto_191280 ) ) ( not ( = ?auto_191278 ?auto_191282 ) ) ( not ( = ?auto_191278 ?auto_191283 ) ) ( not ( = ?auto_191278 ?auto_191284 ) ) ( not ( = ?auto_191279 ?auto_191281 ) ) ( not ( = ?auto_191279 ?auto_191280 ) ) ( not ( = ?auto_191279 ?auto_191282 ) ) ( not ( = ?auto_191279 ?auto_191283 ) ) ( not ( = ?auto_191279 ?auto_191284 ) ) ( not ( = ?auto_191281 ?auto_191280 ) ) ( not ( = ?auto_191281 ?auto_191282 ) ) ( not ( = ?auto_191281 ?auto_191283 ) ) ( not ( = ?auto_191281 ?auto_191284 ) ) ( not ( = ?auto_191280 ?auto_191282 ) ) ( not ( = ?auto_191280 ?auto_191283 ) ) ( not ( = ?auto_191280 ?auto_191284 ) ) ( not ( = ?auto_191282 ?auto_191283 ) ) ( not ( = ?auto_191282 ?auto_191284 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_191283 ?auto_191284 )
      ( MAKE-7CRATE-VERIFY ?auto_191277 ?auto_191278 ?auto_191279 ?auto_191281 ?auto_191280 ?auto_191282 ?auto_191283 ?auto_191284 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191332 - SURFACE
      ?auto_191333 - SURFACE
      ?auto_191334 - SURFACE
      ?auto_191336 - SURFACE
      ?auto_191335 - SURFACE
      ?auto_191337 - SURFACE
      ?auto_191338 - SURFACE
      ?auto_191339 - SURFACE
    )
    :vars
    (
      ?auto_191341 - HOIST
      ?auto_191340 - PLACE
      ?auto_191342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191341 ?auto_191340 ) ( SURFACE-AT ?auto_191338 ?auto_191340 ) ( CLEAR ?auto_191338 ) ( IS-CRATE ?auto_191339 ) ( not ( = ?auto_191338 ?auto_191339 ) ) ( TRUCK-AT ?auto_191342 ?auto_191340 ) ( AVAILABLE ?auto_191341 ) ( IN ?auto_191339 ?auto_191342 ) ( ON ?auto_191338 ?auto_191337 ) ( not ( = ?auto_191337 ?auto_191338 ) ) ( not ( = ?auto_191337 ?auto_191339 ) ) ( ON ?auto_191333 ?auto_191332 ) ( ON ?auto_191334 ?auto_191333 ) ( ON ?auto_191336 ?auto_191334 ) ( ON ?auto_191335 ?auto_191336 ) ( ON ?auto_191337 ?auto_191335 ) ( not ( = ?auto_191332 ?auto_191333 ) ) ( not ( = ?auto_191332 ?auto_191334 ) ) ( not ( = ?auto_191332 ?auto_191336 ) ) ( not ( = ?auto_191332 ?auto_191335 ) ) ( not ( = ?auto_191332 ?auto_191337 ) ) ( not ( = ?auto_191332 ?auto_191338 ) ) ( not ( = ?auto_191332 ?auto_191339 ) ) ( not ( = ?auto_191333 ?auto_191334 ) ) ( not ( = ?auto_191333 ?auto_191336 ) ) ( not ( = ?auto_191333 ?auto_191335 ) ) ( not ( = ?auto_191333 ?auto_191337 ) ) ( not ( = ?auto_191333 ?auto_191338 ) ) ( not ( = ?auto_191333 ?auto_191339 ) ) ( not ( = ?auto_191334 ?auto_191336 ) ) ( not ( = ?auto_191334 ?auto_191335 ) ) ( not ( = ?auto_191334 ?auto_191337 ) ) ( not ( = ?auto_191334 ?auto_191338 ) ) ( not ( = ?auto_191334 ?auto_191339 ) ) ( not ( = ?auto_191336 ?auto_191335 ) ) ( not ( = ?auto_191336 ?auto_191337 ) ) ( not ( = ?auto_191336 ?auto_191338 ) ) ( not ( = ?auto_191336 ?auto_191339 ) ) ( not ( = ?auto_191335 ?auto_191337 ) ) ( not ( = ?auto_191335 ?auto_191338 ) ) ( not ( = ?auto_191335 ?auto_191339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191337 ?auto_191338 ?auto_191339 )
      ( MAKE-7CRATE-VERIFY ?auto_191332 ?auto_191333 ?auto_191334 ?auto_191336 ?auto_191335 ?auto_191337 ?auto_191338 ?auto_191339 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191395 - SURFACE
      ?auto_191396 - SURFACE
      ?auto_191397 - SURFACE
      ?auto_191399 - SURFACE
      ?auto_191398 - SURFACE
      ?auto_191400 - SURFACE
      ?auto_191401 - SURFACE
      ?auto_191402 - SURFACE
    )
    :vars
    (
      ?auto_191403 - HOIST
      ?auto_191406 - PLACE
      ?auto_191405 - TRUCK
      ?auto_191404 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_191403 ?auto_191406 ) ( SURFACE-AT ?auto_191401 ?auto_191406 ) ( CLEAR ?auto_191401 ) ( IS-CRATE ?auto_191402 ) ( not ( = ?auto_191401 ?auto_191402 ) ) ( AVAILABLE ?auto_191403 ) ( IN ?auto_191402 ?auto_191405 ) ( ON ?auto_191401 ?auto_191400 ) ( not ( = ?auto_191400 ?auto_191401 ) ) ( not ( = ?auto_191400 ?auto_191402 ) ) ( TRUCK-AT ?auto_191405 ?auto_191404 ) ( not ( = ?auto_191404 ?auto_191406 ) ) ( ON ?auto_191396 ?auto_191395 ) ( ON ?auto_191397 ?auto_191396 ) ( ON ?auto_191399 ?auto_191397 ) ( ON ?auto_191398 ?auto_191399 ) ( ON ?auto_191400 ?auto_191398 ) ( not ( = ?auto_191395 ?auto_191396 ) ) ( not ( = ?auto_191395 ?auto_191397 ) ) ( not ( = ?auto_191395 ?auto_191399 ) ) ( not ( = ?auto_191395 ?auto_191398 ) ) ( not ( = ?auto_191395 ?auto_191400 ) ) ( not ( = ?auto_191395 ?auto_191401 ) ) ( not ( = ?auto_191395 ?auto_191402 ) ) ( not ( = ?auto_191396 ?auto_191397 ) ) ( not ( = ?auto_191396 ?auto_191399 ) ) ( not ( = ?auto_191396 ?auto_191398 ) ) ( not ( = ?auto_191396 ?auto_191400 ) ) ( not ( = ?auto_191396 ?auto_191401 ) ) ( not ( = ?auto_191396 ?auto_191402 ) ) ( not ( = ?auto_191397 ?auto_191399 ) ) ( not ( = ?auto_191397 ?auto_191398 ) ) ( not ( = ?auto_191397 ?auto_191400 ) ) ( not ( = ?auto_191397 ?auto_191401 ) ) ( not ( = ?auto_191397 ?auto_191402 ) ) ( not ( = ?auto_191399 ?auto_191398 ) ) ( not ( = ?auto_191399 ?auto_191400 ) ) ( not ( = ?auto_191399 ?auto_191401 ) ) ( not ( = ?auto_191399 ?auto_191402 ) ) ( not ( = ?auto_191398 ?auto_191400 ) ) ( not ( = ?auto_191398 ?auto_191401 ) ) ( not ( = ?auto_191398 ?auto_191402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191400 ?auto_191401 ?auto_191402 )
      ( MAKE-7CRATE-VERIFY ?auto_191395 ?auto_191396 ?auto_191397 ?auto_191399 ?auto_191398 ?auto_191400 ?auto_191401 ?auto_191402 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191465 - SURFACE
      ?auto_191466 - SURFACE
      ?auto_191467 - SURFACE
      ?auto_191469 - SURFACE
      ?auto_191468 - SURFACE
      ?auto_191470 - SURFACE
      ?auto_191471 - SURFACE
      ?auto_191472 - SURFACE
    )
    :vars
    (
      ?auto_191474 - HOIST
      ?auto_191473 - PLACE
      ?auto_191476 - TRUCK
      ?auto_191477 - PLACE
      ?auto_191475 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_191474 ?auto_191473 ) ( SURFACE-AT ?auto_191471 ?auto_191473 ) ( CLEAR ?auto_191471 ) ( IS-CRATE ?auto_191472 ) ( not ( = ?auto_191471 ?auto_191472 ) ) ( AVAILABLE ?auto_191474 ) ( ON ?auto_191471 ?auto_191470 ) ( not ( = ?auto_191470 ?auto_191471 ) ) ( not ( = ?auto_191470 ?auto_191472 ) ) ( TRUCK-AT ?auto_191476 ?auto_191477 ) ( not ( = ?auto_191477 ?auto_191473 ) ) ( HOIST-AT ?auto_191475 ?auto_191477 ) ( LIFTING ?auto_191475 ?auto_191472 ) ( not ( = ?auto_191474 ?auto_191475 ) ) ( ON ?auto_191466 ?auto_191465 ) ( ON ?auto_191467 ?auto_191466 ) ( ON ?auto_191469 ?auto_191467 ) ( ON ?auto_191468 ?auto_191469 ) ( ON ?auto_191470 ?auto_191468 ) ( not ( = ?auto_191465 ?auto_191466 ) ) ( not ( = ?auto_191465 ?auto_191467 ) ) ( not ( = ?auto_191465 ?auto_191469 ) ) ( not ( = ?auto_191465 ?auto_191468 ) ) ( not ( = ?auto_191465 ?auto_191470 ) ) ( not ( = ?auto_191465 ?auto_191471 ) ) ( not ( = ?auto_191465 ?auto_191472 ) ) ( not ( = ?auto_191466 ?auto_191467 ) ) ( not ( = ?auto_191466 ?auto_191469 ) ) ( not ( = ?auto_191466 ?auto_191468 ) ) ( not ( = ?auto_191466 ?auto_191470 ) ) ( not ( = ?auto_191466 ?auto_191471 ) ) ( not ( = ?auto_191466 ?auto_191472 ) ) ( not ( = ?auto_191467 ?auto_191469 ) ) ( not ( = ?auto_191467 ?auto_191468 ) ) ( not ( = ?auto_191467 ?auto_191470 ) ) ( not ( = ?auto_191467 ?auto_191471 ) ) ( not ( = ?auto_191467 ?auto_191472 ) ) ( not ( = ?auto_191469 ?auto_191468 ) ) ( not ( = ?auto_191469 ?auto_191470 ) ) ( not ( = ?auto_191469 ?auto_191471 ) ) ( not ( = ?auto_191469 ?auto_191472 ) ) ( not ( = ?auto_191468 ?auto_191470 ) ) ( not ( = ?auto_191468 ?auto_191471 ) ) ( not ( = ?auto_191468 ?auto_191472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191470 ?auto_191471 ?auto_191472 )
      ( MAKE-7CRATE-VERIFY ?auto_191465 ?auto_191466 ?auto_191467 ?auto_191469 ?auto_191468 ?auto_191470 ?auto_191471 ?auto_191472 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191542 - SURFACE
      ?auto_191543 - SURFACE
      ?auto_191544 - SURFACE
      ?auto_191546 - SURFACE
      ?auto_191545 - SURFACE
      ?auto_191547 - SURFACE
      ?auto_191548 - SURFACE
      ?auto_191549 - SURFACE
    )
    :vars
    (
      ?auto_191553 - HOIST
      ?auto_191555 - PLACE
      ?auto_191550 - TRUCK
      ?auto_191551 - PLACE
      ?auto_191552 - HOIST
      ?auto_191554 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_191553 ?auto_191555 ) ( SURFACE-AT ?auto_191548 ?auto_191555 ) ( CLEAR ?auto_191548 ) ( IS-CRATE ?auto_191549 ) ( not ( = ?auto_191548 ?auto_191549 ) ) ( AVAILABLE ?auto_191553 ) ( ON ?auto_191548 ?auto_191547 ) ( not ( = ?auto_191547 ?auto_191548 ) ) ( not ( = ?auto_191547 ?auto_191549 ) ) ( TRUCK-AT ?auto_191550 ?auto_191551 ) ( not ( = ?auto_191551 ?auto_191555 ) ) ( HOIST-AT ?auto_191552 ?auto_191551 ) ( not ( = ?auto_191553 ?auto_191552 ) ) ( AVAILABLE ?auto_191552 ) ( SURFACE-AT ?auto_191549 ?auto_191551 ) ( ON ?auto_191549 ?auto_191554 ) ( CLEAR ?auto_191549 ) ( not ( = ?auto_191548 ?auto_191554 ) ) ( not ( = ?auto_191549 ?auto_191554 ) ) ( not ( = ?auto_191547 ?auto_191554 ) ) ( ON ?auto_191543 ?auto_191542 ) ( ON ?auto_191544 ?auto_191543 ) ( ON ?auto_191546 ?auto_191544 ) ( ON ?auto_191545 ?auto_191546 ) ( ON ?auto_191547 ?auto_191545 ) ( not ( = ?auto_191542 ?auto_191543 ) ) ( not ( = ?auto_191542 ?auto_191544 ) ) ( not ( = ?auto_191542 ?auto_191546 ) ) ( not ( = ?auto_191542 ?auto_191545 ) ) ( not ( = ?auto_191542 ?auto_191547 ) ) ( not ( = ?auto_191542 ?auto_191548 ) ) ( not ( = ?auto_191542 ?auto_191549 ) ) ( not ( = ?auto_191542 ?auto_191554 ) ) ( not ( = ?auto_191543 ?auto_191544 ) ) ( not ( = ?auto_191543 ?auto_191546 ) ) ( not ( = ?auto_191543 ?auto_191545 ) ) ( not ( = ?auto_191543 ?auto_191547 ) ) ( not ( = ?auto_191543 ?auto_191548 ) ) ( not ( = ?auto_191543 ?auto_191549 ) ) ( not ( = ?auto_191543 ?auto_191554 ) ) ( not ( = ?auto_191544 ?auto_191546 ) ) ( not ( = ?auto_191544 ?auto_191545 ) ) ( not ( = ?auto_191544 ?auto_191547 ) ) ( not ( = ?auto_191544 ?auto_191548 ) ) ( not ( = ?auto_191544 ?auto_191549 ) ) ( not ( = ?auto_191544 ?auto_191554 ) ) ( not ( = ?auto_191546 ?auto_191545 ) ) ( not ( = ?auto_191546 ?auto_191547 ) ) ( not ( = ?auto_191546 ?auto_191548 ) ) ( not ( = ?auto_191546 ?auto_191549 ) ) ( not ( = ?auto_191546 ?auto_191554 ) ) ( not ( = ?auto_191545 ?auto_191547 ) ) ( not ( = ?auto_191545 ?auto_191548 ) ) ( not ( = ?auto_191545 ?auto_191549 ) ) ( not ( = ?auto_191545 ?auto_191554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191547 ?auto_191548 ?auto_191549 )
      ( MAKE-7CRATE-VERIFY ?auto_191542 ?auto_191543 ?auto_191544 ?auto_191546 ?auto_191545 ?auto_191547 ?auto_191548 ?auto_191549 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191620 - SURFACE
      ?auto_191621 - SURFACE
      ?auto_191622 - SURFACE
      ?auto_191624 - SURFACE
      ?auto_191623 - SURFACE
      ?auto_191625 - SURFACE
      ?auto_191626 - SURFACE
      ?auto_191627 - SURFACE
    )
    :vars
    (
      ?auto_191633 - HOIST
      ?auto_191632 - PLACE
      ?auto_191630 - PLACE
      ?auto_191631 - HOIST
      ?auto_191629 - SURFACE
      ?auto_191628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191633 ?auto_191632 ) ( SURFACE-AT ?auto_191626 ?auto_191632 ) ( CLEAR ?auto_191626 ) ( IS-CRATE ?auto_191627 ) ( not ( = ?auto_191626 ?auto_191627 ) ) ( AVAILABLE ?auto_191633 ) ( ON ?auto_191626 ?auto_191625 ) ( not ( = ?auto_191625 ?auto_191626 ) ) ( not ( = ?auto_191625 ?auto_191627 ) ) ( not ( = ?auto_191630 ?auto_191632 ) ) ( HOIST-AT ?auto_191631 ?auto_191630 ) ( not ( = ?auto_191633 ?auto_191631 ) ) ( AVAILABLE ?auto_191631 ) ( SURFACE-AT ?auto_191627 ?auto_191630 ) ( ON ?auto_191627 ?auto_191629 ) ( CLEAR ?auto_191627 ) ( not ( = ?auto_191626 ?auto_191629 ) ) ( not ( = ?auto_191627 ?auto_191629 ) ) ( not ( = ?auto_191625 ?auto_191629 ) ) ( TRUCK-AT ?auto_191628 ?auto_191632 ) ( ON ?auto_191621 ?auto_191620 ) ( ON ?auto_191622 ?auto_191621 ) ( ON ?auto_191624 ?auto_191622 ) ( ON ?auto_191623 ?auto_191624 ) ( ON ?auto_191625 ?auto_191623 ) ( not ( = ?auto_191620 ?auto_191621 ) ) ( not ( = ?auto_191620 ?auto_191622 ) ) ( not ( = ?auto_191620 ?auto_191624 ) ) ( not ( = ?auto_191620 ?auto_191623 ) ) ( not ( = ?auto_191620 ?auto_191625 ) ) ( not ( = ?auto_191620 ?auto_191626 ) ) ( not ( = ?auto_191620 ?auto_191627 ) ) ( not ( = ?auto_191620 ?auto_191629 ) ) ( not ( = ?auto_191621 ?auto_191622 ) ) ( not ( = ?auto_191621 ?auto_191624 ) ) ( not ( = ?auto_191621 ?auto_191623 ) ) ( not ( = ?auto_191621 ?auto_191625 ) ) ( not ( = ?auto_191621 ?auto_191626 ) ) ( not ( = ?auto_191621 ?auto_191627 ) ) ( not ( = ?auto_191621 ?auto_191629 ) ) ( not ( = ?auto_191622 ?auto_191624 ) ) ( not ( = ?auto_191622 ?auto_191623 ) ) ( not ( = ?auto_191622 ?auto_191625 ) ) ( not ( = ?auto_191622 ?auto_191626 ) ) ( not ( = ?auto_191622 ?auto_191627 ) ) ( not ( = ?auto_191622 ?auto_191629 ) ) ( not ( = ?auto_191624 ?auto_191623 ) ) ( not ( = ?auto_191624 ?auto_191625 ) ) ( not ( = ?auto_191624 ?auto_191626 ) ) ( not ( = ?auto_191624 ?auto_191627 ) ) ( not ( = ?auto_191624 ?auto_191629 ) ) ( not ( = ?auto_191623 ?auto_191625 ) ) ( not ( = ?auto_191623 ?auto_191626 ) ) ( not ( = ?auto_191623 ?auto_191627 ) ) ( not ( = ?auto_191623 ?auto_191629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191625 ?auto_191626 ?auto_191627 )
      ( MAKE-7CRATE-VERIFY ?auto_191620 ?auto_191621 ?auto_191622 ?auto_191624 ?auto_191623 ?auto_191625 ?auto_191626 ?auto_191627 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191698 - SURFACE
      ?auto_191699 - SURFACE
      ?auto_191700 - SURFACE
      ?auto_191702 - SURFACE
      ?auto_191701 - SURFACE
      ?auto_191703 - SURFACE
      ?auto_191704 - SURFACE
      ?auto_191705 - SURFACE
    )
    :vars
    (
      ?auto_191706 - HOIST
      ?auto_191709 - PLACE
      ?auto_191711 - PLACE
      ?auto_191710 - HOIST
      ?auto_191707 - SURFACE
      ?auto_191708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191706 ?auto_191709 ) ( IS-CRATE ?auto_191705 ) ( not ( = ?auto_191704 ?auto_191705 ) ) ( not ( = ?auto_191703 ?auto_191704 ) ) ( not ( = ?auto_191703 ?auto_191705 ) ) ( not ( = ?auto_191711 ?auto_191709 ) ) ( HOIST-AT ?auto_191710 ?auto_191711 ) ( not ( = ?auto_191706 ?auto_191710 ) ) ( AVAILABLE ?auto_191710 ) ( SURFACE-AT ?auto_191705 ?auto_191711 ) ( ON ?auto_191705 ?auto_191707 ) ( CLEAR ?auto_191705 ) ( not ( = ?auto_191704 ?auto_191707 ) ) ( not ( = ?auto_191705 ?auto_191707 ) ) ( not ( = ?auto_191703 ?auto_191707 ) ) ( TRUCK-AT ?auto_191708 ?auto_191709 ) ( SURFACE-AT ?auto_191703 ?auto_191709 ) ( CLEAR ?auto_191703 ) ( LIFTING ?auto_191706 ?auto_191704 ) ( IS-CRATE ?auto_191704 ) ( ON ?auto_191699 ?auto_191698 ) ( ON ?auto_191700 ?auto_191699 ) ( ON ?auto_191702 ?auto_191700 ) ( ON ?auto_191701 ?auto_191702 ) ( ON ?auto_191703 ?auto_191701 ) ( not ( = ?auto_191698 ?auto_191699 ) ) ( not ( = ?auto_191698 ?auto_191700 ) ) ( not ( = ?auto_191698 ?auto_191702 ) ) ( not ( = ?auto_191698 ?auto_191701 ) ) ( not ( = ?auto_191698 ?auto_191703 ) ) ( not ( = ?auto_191698 ?auto_191704 ) ) ( not ( = ?auto_191698 ?auto_191705 ) ) ( not ( = ?auto_191698 ?auto_191707 ) ) ( not ( = ?auto_191699 ?auto_191700 ) ) ( not ( = ?auto_191699 ?auto_191702 ) ) ( not ( = ?auto_191699 ?auto_191701 ) ) ( not ( = ?auto_191699 ?auto_191703 ) ) ( not ( = ?auto_191699 ?auto_191704 ) ) ( not ( = ?auto_191699 ?auto_191705 ) ) ( not ( = ?auto_191699 ?auto_191707 ) ) ( not ( = ?auto_191700 ?auto_191702 ) ) ( not ( = ?auto_191700 ?auto_191701 ) ) ( not ( = ?auto_191700 ?auto_191703 ) ) ( not ( = ?auto_191700 ?auto_191704 ) ) ( not ( = ?auto_191700 ?auto_191705 ) ) ( not ( = ?auto_191700 ?auto_191707 ) ) ( not ( = ?auto_191702 ?auto_191701 ) ) ( not ( = ?auto_191702 ?auto_191703 ) ) ( not ( = ?auto_191702 ?auto_191704 ) ) ( not ( = ?auto_191702 ?auto_191705 ) ) ( not ( = ?auto_191702 ?auto_191707 ) ) ( not ( = ?auto_191701 ?auto_191703 ) ) ( not ( = ?auto_191701 ?auto_191704 ) ) ( not ( = ?auto_191701 ?auto_191705 ) ) ( not ( = ?auto_191701 ?auto_191707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191703 ?auto_191704 ?auto_191705 )
      ( MAKE-7CRATE-VERIFY ?auto_191698 ?auto_191699 ?auto_191700 ?auto_191702 ?auto_191701 ?auto_191703 ?auto_191704 ?auto_191705 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_191776 - SURFACE
      ?auto_191777 - SURFACE
      ?auto_191778 - SURFACE
      ?auto_191780 - SURFACE
      ?auto_191779 - SURFACE
      ?auto_191781 - SURFACE
      ?auto_191782 - SURFACE
      ?auto_191783 - SURFACE
    )
    :vars
    (
      ?auto_191787 - HOIST
      ?auto_191789 - PLACE
      ?auto_191786 - PLACE
      ?auto_191784 - HOIST
      ?auto_191785 - SURFACE
      ?auto_191788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191787 ?auto_191789 ) ( IS-CRATE ?auto_191783 ) ( not ( = ?auto_191782 ?auto_191783 ) ) ( not ( = ?auto_191781 ?auto_191782 ) ) ( not ( = ?auto_191781 ?auto_191783 ) ) ( not ( = ?auto_191786 ?auto_191789 ) ) ( HOIST-AT ?auto_191784 ?auto_191786 ) ( not ( = ?auto_191787 ?auto_191784 ) ) ( AVAILABLE ?auto_191784 ) ( SURFACE-AT ?auto_191783 ?auto_191786 ) ( ON ?auto_191783 ?auto_191785 ) ( CLEAR ?auto_191783 ) ( not ( = ?auto_191782 ?auto_191785 ) ) ( not ( = ?auto_191783 ?auto_191785 ) ) ( not ( = ?auto_191781 ?auto_191785 ) ) ( TRUCK-AT ?auto_191788 ?auto_191789 ) ( SURFACE-AT ?auto_191781 ?auto_191789 ) ( CLEAR ?auto_191781 ) ( IS-CRATE ?auto_191782 ) ( AVAILABLE ?auto_191787 ) ( IN ?auto_191782 ?auto_191788 ) ( ON ?auto_191777 ?auto_191776 ) ( ON ?auto_191778 ?auto_191777 ) ( ON ?auto_191780 ?auto_191778 ) ( ON ?auto_191779 ?auto_191780 ) ( ON ?auto_191781 ?auto_191779 ) ( not ( = ?auto_191776 ?auto_191777 ) ) ( not ( = ?auto_191776 ?auto_191778 ) ) ( not ( = ?auto_191776 ?auto_191780 ) ) ( not ( = ?auto_191776 ?auto_191779 ) ) ( not ( = ?auto_191776 ?auto_191781 ) ) ( not ( = ?auto_191776 ?auto_191782 ) ) ( not ( = ?auto_191776 ?auto_191783 ) ) ( not ( = ?auto_191776 ?auto_191785 ) ) ( not ( = ?auto_191777 ?auto_191778 ) ) ( not ( = ?auto_191777 ?auto_191780 ) ) ( not ( = ?auto_191777 ?auto_191779 ) ) ( not ( = ?auto_191777 ?auto_191781 ) ) ( not ( = ?auto_191777 ?auto_191782 ) ) ( not ( = ?auto_191777 ?auto_191783 ) ) ( not ( = ?auto_191777 ?auto_191785 ) ) ( not ( = ?auto_191778 ?auto_191780 ) ) ( not ( = ?auto_191778 ?auto_191779 ) ) ( not ( = ?auto_191778 ?auto_191781 ) ) ( not ( = ?auto_191778 ?auto_191782 ) ) ( not ( = ?auto_191778 ?auto_191783 ) ) ( not ( = ?auto_191778 ?auto_191785 ) ) ( not ( = ?auto_191780 ?auto_191779 ) ) ( not ( = ?auto_191780 ?auto_191781 ) ) ( not ( = ?auto_191780 ?auto_191782 ) ) ( not ( = ?auto_191780 ?auto_191783 ) ) ( not ( = ?auto_191780 ?auto_191785 ) ) ( not ( = ?auto_191779 ?auto_191781 ) ) ( not ( = ?auto_191779 ?auto_191782 ) ) ( not ( = ?auto_191779 ?auto_191783 ) ) ( not ( = ?auto_191779 ?auto_191785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_191781 ?auto_191782 ?auto_191783 )
      ( MAKE-7CRATE-VERIFY ?auto_191776 ?auto_191777 ?auto_191778 ?auto_191780 ?auto_191779 ?auto_191781 ?auto_191782 ?auto_191783 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_192355 - SURFACE
      ?auto_192356 - SURFACE
    )
    :vars
    (
      ?auto_192362 - HOIST
      ?auto_192359 - PLACE
      ?auto_192358 - SURFACE
      ?auto_192357 - PLACE
      ?auto_192360 - HOIST
      ?auto_192363 - SURFACE
      ?auto_192361 - TRUCK
      ?auto_192364 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_192362 ?auto_192359 ) ( SURFACE-AT ?auto_192355 ?auto_192359 ) ( CLEAR ?auto_192355 ) ( IS-CRATE ?auto_192356 ) ( not ( = ?auto_192355 ?auto_192356 ) ) ( ON ?auto_192355 ?auto_192358 ) ( not ( = ?auto_192358 ?auto_192355 ) ) ( not ( = ?auto_192358 ?auto_192356 ) ) ( not ( = ?auto_192357 ?auto_192359 ) ) ( HOIST-AT ?auto_192360 ?auto_192357 ) ( not ( = ?auto_192362 ?auto_192360 ) ) ( AVAILABLE ?auto_192360 ) ( SURFACE-AT ?auto_192356 ?auto_192357 ) ( ON ?auto_192356 ?auto_192363 ) ( CLEAR ?auto_192356 ) ( not ( = ?auto_192355 ?auto_192363 ) ) ( not ( = ?auto_192356 ?auto_192363 ) ) ( not ( = ?auto_192358 ?auto_192363 ) ) ( TRUCK-AT ?auto_192361 ?auto_192359 ) ( LIFTING ?auto_192362 ?auto_192364 ) ( IS-CRATE ?auto_192364 ) ( not ( = ?auto_192355 ?auto_192364 ) ) ( not ( = ?auto_192356 ?auto_192364 ) ) ( not ( = ?auto_192358 ?auto_192364 ) ) ( not ( = ?auto_192363 ?auto_192364 ) ) )
    :subtasks
    ( ( !LOAD ?auto_192362 ?auto_192364 ?auto_192361 ?auto_192359 )
      ( MAKE-1CRATE ?auto_192355 ?auto_192356 )
      ( MAKE-1CRATE-VERIFY ?auto_192355 ?auto_192356 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_194685 - SURFACE
      ?auto_194686 - SURFACE
      ?auto_194687 - SURFACE
      ?auto_194689 - SURFACE
      ?auto_194688 - SURFACE
      ?auto_194690 - SURFACE
      ?auto_194691 - SURFACE
      ?auto_194692 - SURFACE
      ?auto_194693 - SURFACE
    )
    :vars
    (
      ?auto_194695 - HOIST
      ?auto_194694 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_194695 ?auto_194694 ) ( SURFACE-AT ?auto_194692 ?auto_194694 ) ( CLEAR ?auto_194692 ) ( LIFTING ?auto_194695 ?auto_194693 ) ( IS-CRATE ?auto_194693 ) ( not ( = ?auto_194692 ?auto_194693 ) ) ( ON ?auto_194686 ?auto_194685 ) ( ON ?auto_194687 ?auto_194686 ) ( ON ?auto_194689 ?auto_194687 ) ( ON ?auto_194688 ?auto_194689 ) ( ON ?auto_194690 ?auto_194688 ) ( ON ?auto_194691 ?auto_194690 ) ( ON ?auto_194692 ?auto_194691 ) ( not ( = ?auto_194685 ?auto_194686 ) ) ( not ( = ?auto_194685 ?auto_194687 ) ) ( not ( = ?auto_194685 ?auto_194689 ) ) ( not ( = ?auto_194685 ?auto_194688 ) ) ( not ( = ?auto_194685 ?auto_194690 ) ) ( not ( = ?auto_194685 ?auto_194691 ) ) ( not ( = ?auto_194685 ?auto_194692 ) ) ( not ( = ?auto_194685 ?auto_194693 ) ) ( not ( = ?auto_194686 ?auto_194687 ) ) ( not ( = ?auto_194686 ?auto_194689 ) ) ( not ( = ?auto_194686 ?auto_194688 ) ) ( not ( = ?auto_194686 ?auto_194690 ) ) ( not ( = ?auto_194686 ?auto_194691 ) ) ( not ( = ?auto_194686 ?auto_194692 ) ) ( not ( = ?auto_194686 ?auto_194693 ) ) ( not ( = ?auto_194687 ?auto_194689 ) ) ( not ( = ?auto_194687 ?auto_194688 ) ) ( not ( = ?auto_194687 ?auto_194690 ) ) ( not ( = ?auto_194687 ?auto_194691 ) ) ( not ( = ?auto_194687 ?auto_194692 ) ) ( not ( = ?auto_194687 ?auto_194693 ) ) ( not ( = ?auto_194689 ?auto_194688 ) ) ( not ( = ?auto_194689 ?auto_194690 ) ) ( not ( = ?auto_194689 ?auto_194691 ) ) ( not ( = ?auto_194689 ?auto_194692 ) ) ( not ( = ?auto_194689 ?auto_194693 ) ) ( not ( = ?auto_194688 ?auto_194690 ) ) ( not ( = ?auto_194688 ?auto_194691 ) ) ( not ( = ?auto_194688 ?auto_194692 ) ) ( not ( = ?auto_194688 ?auto_194693 ) ) ( not ( = ?auto_194690 ?auto_194691 ) ) ( not ( = ?auto_194690 ?auto_194692 ) ) ( not ( = ?auto_194690 ?auto_194693 ) ) ( not ( = ?auto_194691 ?auto_194692 ) ) ( not ( = ?auto_194691 ?auto_194693 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_194692 ?auto_194693 )
      ( MAKE-8CRATE-VERIFY ?auto_194685 ?auto_194686 ?auto_194687 ?auto_194689 ?auto_194688 ?auto_194690 ?auto_194691 ?auto_194692 ?auto_194693 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_194752 - SURFACE
      ?auto_194753 - SURFACE
      ?auto_194754 - SURFACE
      ?auto_194756 - SURFACE
      ?auto_194755 - SURFACE
      ?auto_194757 - SURFACE
      ?auto_194758 - SURFACE
      ?auto_194759 - SURFACE
      ?auto_194760 - SURFACE
    )
    :vars
    (
      ?auto_194762 - HOIST
      ?auto_194763 - PLACE
      ?auto_194761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_194762 ?auto_194763 ) ( SURFACE-AT ?auto_194759 ?auto_194763 ) ( CLEAR ?auto_194759 ) ( IS-CRATE ?auto_194760 ) ( not ( = ?auto_194759 ?auto_194760 ) ) ( TRUCK-AT ?auto_194761 ?auto_194763 ) ( AVAILABLE ?auto_194762 ) ( IN ?auto_194760 ?auto_194761 ) ( ON ?auto_194759 ?auto_194758 ) ( not ( = ?auto_194758 ?auto_194759 ) ) ( not ( = ?auto_194758 ?auto_194760 ) ) ( ON ?auto_194753 ?auto_194752 ) ( ON ?auto_194754 ?auto_194753 ) ( ON ?auto_194756 ?auto_194754 ) ( ON ?auto_194755 ?auto_194756 ) ( ON ?auto_194757 ?auto_194755 ) ( ON ?auto_194758 ?auto_194757 ) ( not ( = ?auto_194752 ?auto_194753 ) ) ( not ( = ?auto_194752 ?auto_194754 ) ) ( not ( = ?auto_194752 ?auto_194756 ) ) ( not ( = ?auto_194752 ?auto_194755 ) ) ( not ( = ?auto_194752 ?auto_194757 ) ) ( not ( = ?auto_194752 ?auto_194758 ) ) ( not ( = ?auto_194752 ?auto_194759 ) ) ( not ( = ?auto_194752 ?auto_194760 ) ) ( not ( = ?auto_194753 ?auto_194754 ) ) ( not ( = ?auto_194753 ?auto_194756 ) ) ( not ( = ?auto_194753 ?auto_194755 ) ) ( not ( = ?auto_194753 ?auto_194757 ) ) ( not ( = ?auto_194753 ?auto_194758 ) ) ( not ( = ?auto_194753 ?auto_194759 ) ) ( not ( = ?auto_194753 ?auto_194760 ) ) ( not ( = ?auto_194754 ?auto_194756 ) ) ( not ( = ?auto_194754 ?auto_194755 ) ) ( not ( = ?auto_194754 ?auto_194757 ) ) ( not ( = ?auto_194754 ?auto_194758 ) ) ( not ( = ?auto_194754 ?auto_194759 ) ) ( not ( = ?auto_194754 ?auto_194760 ) ) ( not ( = ?auto_194756 ?auto_194755 ) ) ( not ( = ?auto_194756 ?auto_194757 ) ) ( not ( = ?auto_194756 ?auto_194758 ) ) ( not ( = ?auto_194756 ?auto_194759 ) ) ( not ( = ?auto_194756 ?auto_194760 ) ) ( not ( = ?auto_194755 ?auto_194757 ) ) ( not ( = ?auto_194755 ?auto_194758 ) ) ( not ( = ?auto_194755 ?auto_194759 ) ) ( not ( = ?auto_194755 ?auto_194760 ) ) ( not ( = ?auto_194757 ?auto_194758 ) ) ( not ( = ?auto_194757 ?auto_194759 ) ) ( not ( = ?auto_194757 ?auto_194760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_194758 ?auto_194759 ?auto_194760 )
      ( MAKE-8CRATE-VERIFY ?auto_194752 ?auto_194753 ?auto_194754 ?auto_194756 ?auto_194755 ?auto_194757 ?auto_194758 ?auto_194759 ?auto_194760 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_194828 - SURFACE
      ?auto_194829 - SURFACE
      ?auto_194830 - SURFACE
      ?auto_194832 - SURFACE
      ?auto_194831 - SURFACE
      ?auto_194833 - SURFACE
      ?auto_194834 - SURFACE
      ?auto_194835 - SURFACE
      ?auto_194836 - SURFACE
    )
    :vars
    (
      ?auto_194837 - HOIST
      ?auto_194840 - PLACE
      ?auto_194839 - TRUCK
      ?auto_194838 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_194837 ?auto_194840 ) ( SURFACE-AT ?auto_194835 ?auto_194840 ) ( CLEAR ?auto_194835 ) ( IS-CRATE ?auto_194836 ) ( not ( = ?auto_194835 ?auto_194836 ) ) ( AVAILABLE ?auto_194837 ) ( IN ?auto_194836 ?auto_194839 ) ( ON ?auto_194835 ?auto_194834 ) ( not ( = ?auto_194834 ?auto_194835 ) ) ( not ( = ?auto_194834 ?auto_194836 ) ) ( TRUCK-AT ?auto_194839 ?auto_194838 ) ( not ( = ?auto_194838 ?auto_194840 ) ) ( ON ?auto_194829 ?auto_194828 ) ( ON ?auto_194830 ?auto_194829 ) ( ON ?auto_194832 ?auto_194830 ) ( ON ?auto_194831 ?auto_194832 ) ( ON ?auto_194833 ?auto_194831 ) ( ON ?auto_194834 ?auto_194833 ) ( not ( = ?auto_194828 ?auto_194829 ) ) ( not ( = ?auto_194828 ?auto_194830 ) ) ( not ( = ?auto_194828 ?auto_194832 ) ) ( not ( = ?auto_194828 ?auto_194831 ) ) ( not ( = ?auto_194828 ?auto_194833 ) ) ( not ( = ?auto_194828 ?auto_194834 ) ) ( not ( = ?auto_194828 ?auto_194835 ) ) ( not ( = ?auto_194828 ?auto_194836 ) ) ( not ( = ?auto_194829 ?auto_194830 ) ) ( not ( = ?auto_194829 ?auto_194832 ) ) ( not ( = ?auto_194829 ?auto_194831 ) ) ( not ( = ?auto_194829 ?auto_194833 ) ) ( not ( = ?auto_194829 ?auto_194834 ) ) ( not ( = ?auto_194829 ?auto_194835 ) ) ( not ( = ?auto_194829 ?auto_194836 ) ) ( not ( = ?auto_194830 ?auto_194832 ) ) ( not ( = ?auto_194830 ?auto_194831 ) ) ( not ( = ?auto_194830 ?auto_194833 ) ) ( not ( = ?auto_194830 ?auto_194834 ) ) ( not ( = ?auto_194830 ?auto_194835 ) ) ( not ( = ?auto_194830 ?auto_194836 ) ) ( not ( = ?auto_194832 ?auto_194831 ) ) ( not ( = ?auto_194832 ?auto_194833 ) ) ( not ( = ?auto_194832 ?auto_194834 ) ) ( not ( = ?auto_194832 ?auto_194835 ) ) ( not ( = ?auto_194832 ?auto_194836 ) ) ( not ( = ?auto_194831 ?auto_194833 ) ) ( not ( = ?auto_194831 ?auto_194834 ) ) ( not ( = ?auto_194831 ?auto_194835 ) ) ( not ( = ?auto_194831 ?auto_194836 ) ) ( not ( = ?auto_194833 ?auto_194834 ) ) ( not ( = ?auto_194833 ?auto_194835 ) ) ( not ( = ?auto_194833 ?auto_194836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_194834 ?auto_194835 ?auto_194836 )
      ( MAKE-8CRATE-VERIFY ?auto_194828 ?auto_194829 ?auto_194830 ?auto_194832 ?auto_194831 ?auto_194833 ?auto_194834 ?auto_194835 ?auto_194836 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_194912 - SURFACE
      ?auto_194913 - SURFACE
      ?auto_194914 - SURFACE
      ?auto_194916 - SURFACE
      ?auto_194915 - SURFACE
      ?auto_194917 - SURFACE
      ?auto_194918 - SURFACE
      ?auto_194919 - SURFACE
      ?auto_194920 - SURFACE
    )
    :vars
    (
      ?auto_194921 - HOIST
      ?auto_194923 - PLACE
      ?auto_194924 - TRUCK
      ?auto_194922 - PLACE
      ?auto_194925 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_194921 ?auto_194923 ) ( SURFACE-AT ?auto_194919 ?auto_194923 ) ( CLEAR ?auto_194919 ) ( IS-CRATE ?auto_194920 ) ( not ( = ?auto_194919 ?auto_194920 ) ) ( AVAILABLE ?auto_194921 ) ( ON ?auto_194919 ?auto_194918 ) ( not ( = ?auto_194918 ?auto_194919 ) ) ( not ( = ?auto_194918 ?auto_194920 ) ) ( TRUCK-AT ?auto_194924 ?auto_194922 ) ( not ( = ?auto_194922 ?auto_194923 ) ) ( HOIST-AT ?auto_194925 ?auto_194922 ) ( LIFTING ?auto_194925 ?auto_194920 ) ( not ( = ?auto_194921 ?auto_194925 ) ) ( ON ?auto_194913 ?auto_194912 ) ( ON ?auto_194914 ?auto_194913 ) ( ON ?auto_194916 ?auto_194914 ) ( ON ?auto_194915 ?auto_194916 ) ( ON ?auto_194917 ?auto_194915 ) ( ON ?auto_194918 ?auto_194917 ) ( not ( = ?auto_194912 ?auto_194913 ) ) ( not ( = ?auto_194912 ?auto_194914 ) ) ( not ( = ?auto_194912 ?auto_194916 ) ) ( not ( = ?auto_194912 ?auto_194915 ) ) ( not ( = ?auto_194912 ?auto_194917 ) ) ( not ( = ?auto_194912 ?auto_194918 ) ) ( not ( = ?auto_194912 ?auto_194919 ) ) ( not ( = ?auto_194912 ?auto_194920 ) ) ( not ( = ?auto_194913 ?auto_194914 ) ) ( not ( = ?auto_194913 ?auto_194916 ) ) ( not ( = ?auto_194913 ?auto_194915 ) ) ( not ( = ?auto_194913 ?auto_194917 ) ) ( not ( = ?auto_194913 ?auto_194918 ) ) ( not ( = ?auto_194913 ?auto_194919 ) ) ( not ( = ?auto_194913 ?auto_194920 ) ) ( not ( = ?auto_194914 ?auto_194916 ) ) ( not ( = ?auto_194914 ?auto_194915 ) ) ( not ( = ?auto_194914 ?auto_194917 ) ) ( not ( = ?auto_194914 ?auto_194918 ) ) ( not ( = ?auto_194914 ?auto_194919 ) ) ( not ( = ?auto_194914 ?auto_194920 ) ) ( not ( = ?auto_194916 ?auto_194915 ) ) ( not ( = ?auto_194916 ?auto_194917 ) ) ( not ( = ?auto_194916 ?auto_194918 ) ) ( not ( = ?auto_194916 ?auto_194919 ) ) ( not ( = ?auto_194916 ?auto_194920 ) ) ( not ( = ?auto_194915 ?auto_194917 ) ) ( not ( = ?auto_194915 ?auto_194918 ) ) ( not ( = ?auto_194915 ?auto_194919 ) ) ( not ( = ?auto_194915 ?auto_194920 ) ) ( not ( = ?auto_194917 ?auto_194918 ) ) ( not ( = ?auto_194917 ?auto_194919 ) ) ( not ( = ?auto_194917 ?auto_194920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_194918 ?auto_194919 ?auto_194920 )
      ( MAKE-8CRATE-VERIFY ?auto_194912 ?auto_194913 ?auto_194914 ?auto_194916 ?auto_194915 ?auto_194917 ?auto_194918 ?auto_194919 ?auto_194920 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195004 - SURFACE
      ?auto_195005 - SURFACE
      ?auto_195006 - SURFACE
      ?auto_195008 - SURFACE
      ?auto_195007 - SURFACE
      ?auto_195009 - SURFACE
      ?auto_195010 - SURFACE
      ?auto_195011 - SURFACE
      ?auto_195012 - SURFACE
    )
    :vars
    (
      ?auto_195015 - HOIST
      ?auto_195014 - PLACE
      ?auto_195016 - TRUCK
      ?auto_195017 - PLACE
      ?auto_195013 - HOIST
      ?auto_195018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_195015 ?auto_195014 ) ( SURFACE-AT ?auto_195011 ?auto_195014 ) ( CLEAR ?auto_195011 ) ( IS-CRATE ?auto_195012 ) ( not ( = ?auto_195011 ?auto_195012 ) ) ( AVAILABLE ?auto_195015 ) ( ON ?auto_195011 ?auto_195010 ) ( not ( = ?auto_195010 ?auto_195011 ) ) ( not ( = ?auto_195010 ?auto_195012 ) ) ( TRUCK-AT ?auto_195016 ?auto_195017 ) ( not ( = ?auto_195017 ?auto_195014 ) ) ( HOIST-AT ?auto_195013 ?auto_195017 ) ( not ( = ?auto_195015 ?auto_195013 ) ) ( AVAILABLE ?auto_195013 ) ( SURFACE-AT ?auto_195012 ?auto_195017 ) ( ON ?auto_195012 ?auto_195018 ) ( CLEAR ?auto_195012 ) ( not ( = ?auto_195011 ?auto_195018 ) ) ( not ( = ?auto_195012 ?auto_195018 ) ) ( not ( = ?auto_195010 ?auto_195018 ) ) ( ON ?auto_195005 ?auto_195004 ) ( ON ?auto_195006 ?auto_195005 ) ( ON ?auto_195008 ?auto_195006 ) ( ON ?auto_195007 ?auto_195008 ) ( ON ?auto_195009 ?auto_195007 ) ( ON ?auto_195010 ?auto_195009 ) ( not ( = ?auto_195004 ?auto_195005 ) ) ( not ( = ?auto_195004 ?auto_195006 ) ) ( not ( = ?auto_195004 ?auto_195008 ) ) ( not ( = ?auto_195004 ?auto_195007 ) ) ( not ( = ?auto_195004 ?auto_195009 ) ) ( not ( = ?auto_195004 ?auto_195010 ) ) ( not ( = ?auto_195004 ?auto_195011 ) ) ( not ( = ?auto_195004 ?auto_195012 ) ) ( not ( = ?auto_195004 ?auto_195018 ) ) ( not ( = ?auto_195005 ?auto_195006 ) ) ( not ( = ?auto_195005 ?auto_195008 ) ) ( not ( = ?auto_195005 ?auto_195007 ) ) ( not ( = ?auto_195005 ?auto_195009 ) ) ( not ( = ?auto_195005 ?auto_195010 ) ) ( not ( = ?auto_195005 ?auto_195011 ) ) ( not ( = ?auto_195005 ?auto_195012 ) ) ( not ( = ?auto_195005 ?auto_195018 ) ) ( not ( = ?auto_195006 ?auto_195008 ) ) ( not ( = ?auto_195006 ?auto_195007 ) ) ( not ( = ?auto_195006 ?auto_195009 ) ) ( not ( = ?auto_195006 ?auto_195010 ) ) ( not ( = ?auto_195006 ?auto_195011 ) ) ( not ( = ?auto_195006 ?auto_195012 ) ) ( not ( = ?auto_195006 ?auto_195018 ) ) ( not ( = ?auto_195008 ?auto_195007 ) ) ( not ( = ?auto_195008 ?auto_195009 ) ) ( not ( = ?auto_195008 ?auto_195010 ) ) ( not ( = ?auto_195008 ?auto_195011 ) ) ( not ( = ?auto_195008 ?auto_195012 ) ) ( not ( = ?auto_195008 ?auto_195018 ) ) ( not ( = ?auto_195007 ?auto_195009 ) ) ( not ( = ?auto_195007 ?auto_195010 ) ) ( not ( = ?auto_195007 ?auto_195011 ) ) ( not ( = ?auto_195007 ?auto_195012 ) ) ( not ( = ?auto_195007 ?auto_195018 ) ) ( not ( = ?auto_195009 ?auto_195010 ) ) ( not ( = ?auto_195009 ?auto_195011 ) ) ( not ( = ?auto_195009 ?auto_195012 ) ) ( not ( = ?auto_195009 ?auto_195018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195010 ?auto_195011 ?auto_195012 )
      ( MAKE-8CRATE-VERIFY ?auto_195004 ?auto_195005 ?auto_195006 ?auto_195008 ?auto_195007 ?auto_195009 ?auto_195010 ?auto_195011 ?auto_195012 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195097 - SURFACE
      ?auto_195098 - SURFACE
      ?auto_195099 - SURFACE
      ?auto_195101 - SURFACE
      ?auto_195100 - SURFACE
      ?auto_195102 - SURFACE
      ?auto_195103 - SURFACE
      ?auto_195104 - SURFACE
      ?auto_195105 - SURFACE
    )
    :vars
    (
      ?auto_195110 - HOIST
      ?auto_195109 - PLACE
      ?auto_195108 - PLACE
      ?auto_195107 - HOIST
      ?auto_195106 - SURFACE
      ?auto_195111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_195110 ?auto_195109 ) ( SURFACE-AT ?auto_195104 ?auto_195109 ) ( CLEAR ?auto_195104 ) ( IS-CRATE ?auto_195105 ) ( not ( = ?auto_195104 ?auto_195105 ) ) ( AVAILABLE ?auto_195110 ) ( ON ?auto_195104 ?auto_195103 ) ( not ( = ?auto_195103 ?auto_195104 ) ) ( not ( = ?auto_195103 ?auto_195105 ) ) ( not ( = ?auto_195108 ?auto_195109 ) ) ( HOIST-AT ?auto_195107 ?auto_195108 ) ( not ( = ?auto_195110 ?auto_195107 ) ) ( AVAILABLE ?auto_195107 ) ( SURFACE-AT ?auto_195105 ?auto_195108 ) ( ON ?auto_195105 ?auto_195106 ) ( CLEAR ?auto_195105 ) ( not ( = ?auto_195104 ?auto_195106 ) ) ( not ( = ?auto_195105 ?auto_195106 ) ) ( not ( = ?auto_195103 ?auto_195106 ) ) ( TRUCK-AT ?auto_195111 ?auto_195109 ) ( ON ?auto_195098 ?auto_195097 ) ( ON ?auto_195099 ?auto_195098 ) ( ON ?auto_195101 ?auto_195099 ) ( ON ?auto_195100 ?auto_195101 ) ( ON ?auto_195102 ?auto_195100 ) ( ON ?auto_195103 ?auto_195102 ) ( not ( = ?auto_195097 ?auto_195098 ) ) ( not ( = ?auto_195097 ?auto_195099 ) ) ( not ( = ?auto_195097 ?auto_195101 ) ) ( not ( = ?auto_195097 ?auto_195100 ) ) ( not ( = ?auto_195097 ?auto_195102 ) ) ( not ( = ?auto_195097 ?auto_195103 ) ) ( not ( = ?auto_195097 ?auto_195104 ) ) ( not ( = ?auto_195097 ?auto_195105 ) ) ( not ( = ?auto_195097 ?auto_195106 ) ) ( not ( = ?auto_195098 ?auto_195099 ) ) ( not ( = ?auto_195098 ?auto_195101 ) ) ( not ( = ?auto_195098 ?auto_195100 ) ) ( not ( = ?auto_195098 ?auto_195102 ) ) ( not ( = ?auto_195098 ?auto_195103 ) ) ( not ( = ?auto_195098 ?auto_195104 ) ) ( not ( = ?auto_195098 ?auto_195105 ) ) ( not ( = ?auto_195098 ?auto_195106 ) ) ( not ( = ?auto_195099 ?auto_195101 ) ) ( not ( = ?auto_195099 ?auto_195100 ) ) ( not ( = ?auto_195099 ?auto_195102 ) ) ( not ( = ?auto_195099 ?auto_195103 ) ) ( not ( = ?auto_195099 ?auto_195104 ) ) ( not ( = ?auto_195099 ?auto_195105 ) ) ( not ( = ?auto_195099 ?auto_195106 ) ) ( not ( = ?auto_195101 ?auto_195100 ) ) ( not ( = ?auto_195101 ?auto_195102 ) ) ( not ( = ?auto_195101 ?auto_195103 ) ) ( not ( = ?auto_195101 ?auto_195104 ) ) ( not ( = ?auto_195101 ?auto_195105 ) ) ( not ( = ?auto_195101 ?auto_195106 ) ) ( not ( = ?auto_195100 ?auto_195102 ) ) ( not ( = ?auto_195100 ?auto_195103 ) ) ( not ( = ?auto_195100 ?auto_195104 ) ) ( not ( = ?auto_195100 ?auto_195105 ) ) ( not ( = ?auto_195100 ?auto_195106 ) ) ( not ( = ?auto_195102 ?auto_195103 ) ) ( not ( = ?auto_195102 ?auto_195104 ) ) ( not ( = ?auto_195102 ?auto_195105 ) ) ( not ( = ?auto_195102 ?auto_195106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195103 ?auto_195104 ?auto_195105 )
      ( MAKE-8CRATE-VERIFY ?auto_195097 ?auto_195098 ?auto_195099 ?auto_195101 ?auto_195100 ?auto_195102 ?auto_195103 ?auto_195104 ?auto_195105 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195190 - SURFACE
      ?auto_195191 - SURFACE
      ?auto_195192 - SURFACE
      ?auto_195194 - SURFACE
      ?auto_195193 - SURFACE
      ?auto_195195 - SURFACE
      ?auto_195196 - SURFACE
      ?auto_195197 - SURFACE
      ?auto_195198 - SURFACE
    )
    :vars
    (
      ?auto_195201 - HOIST
      ?auto_195204 - PLACE
      ?auto_195199 - PLACE
      ?auto_195203 - HOIST
      ?auto_195200 - SURFACE
      ?auto_195202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_195201 ?auto_195204 ) ( IS-CRATE ?auto_195198 ) ( not ( = ?auto_195197 ?auto_195198 ) ) ( not ( = ?auto_195196 ?auto_195197 ) ) ( not ( = ?auto_195196 ?auto_195198 ) ) ( not ( = ?auto_195199 ?auto_195204 ) ) ( HOIST-AT ?auto_195203 ?auto_195199 ) ( not ( = ?auto_195201 ?auto_195203 ) ) ( AVAILABLE ?auto_195203 ) ( SURFACE-AT ?auto_195198 ?auto_195199 ) ( ON ?auto_195198 ?auto_195200 ) ( CLEAR ?auto_195198 ) ( not ( = ?auto_195197 ?auto_195200 ) ) ( not ( = ?auto_195198 ?auto_195200 ) ) ( not ( = ?auto_195196 ?auto_195200 ) ) ( TRUCK-AT ?auto_195202 ?auto_195204 ) ( SURFACE-AT ?auto_195196 ?auto_195204 ) ( CLEAR ?auto_195196 ) ( LIFTING ?auto_195201 ?auto_195197 ) ( IS-CRATE ?auto_195197 ) ( ON ?auto_195191 ?auto_195190 ) ( ON ?auto_195192 ?auto_195191 ) ( ON ?auto_195194 ?auto_195192 ) ( ON ?auto_195193 ?auto_195194 ) ( ON ?auto_195195 ?auto_195193 ) ( ON ?auto_195196 ?auto_195195 ) ( not ( = ?auto_195190 ?auto_195191 ) ) ( not ( = ?auto_195190 ?auto_195192 ) ) ( not ( = ?auto_195190 ?auto_195194 ) ) ( not ( = ?auto_195190 ?auto_195193 ) ) ( not ( = ?auto_195190 ?auto_195195 ) ) ( not ( = ?auto_195190 ?auto_195196 ) ) ( not ( = ?auto_195190 ?auto_195197 ) ) ( not ( = ?auto_195190 ?auto_195198 ) ) ( not ( = ?auto_195190 ?auto_195200 ) ) ( not ( = ?auto_195191 ?auto_195192 ) ) ( not ( = ?auto_195191 ?auto_195194 ) ) ( not ( = ?auto_195191 ?auto_195193 ) ) ( not ( = ?auto_195191 ?auto_195195 ) ) ( not ( = ?auto_195191 ?auto_195196 ) ) ( not ( = ?auto_195191 ?auto_195197 ) ) ( not ( = ?auto_195191 ?auto_195198 ) ) ( not ( = ?auto_195191 ?auto_195200 ) ) ( not ( = ?auto_195192 ?auto_195194 ) ) ( not ( = ?auto_195192 ?auto_195193 ) ) ( not ( = ?auto_195192 ?auto_195195 ) ) ( not ( = ?auto_195192 ?auto_195196 ) ) ( not ( = ?auto_195192 ?auto_195197 ) ) ( not ( = ?auto_195192 ?auto_195198 ) ) ( not ( = ?auto_195192 ?auto_195200 ) ) ( not ( = ?auto_195194 ?auto_195193 ) ) ( not ( = ?auto_195194 ?auto_195195 ) ) ( not ( = ?auto_195194 ?auto_195196 ) ) ( not ( = ?auto_195194 ?auto_195197 ) ) ( not ( = ?auto_195194 ?auto_195198 ) ) ( not ( = ?auto_195194 ?auto_195200 ) ) ( not ( = ?auto_195193 ?auto_195195 ) ) ( not ( = ?auto_195193 ?auto_195196 ) ) ( not ( = ?auto_195193 ?auto_195197 ) ) ( not ( = ?auto_195193 ?auto_195198 ) ) ( not ( = ?auto_195193 ?auto_195200 ) ) ( not ( = ?auto_195195 ?auto_195196 ) ) ( not ( = ?auto_195195 ?auto_195197 ) ) ( not ( = ?auto_195195 ?auto_195198 ) ) ( not ( = ?auto_195195 ?auto_195200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195196 ?auto_195197 ?auto_195198 )
      ( MAKE-8CRATE-VERIFY ?auto_195190 ?auto_195191 ?auto_195192 ?auto_195194 ?auto_195193 ?auto_195195 ?auto_195196 ?auto_195197 ?auto_195198 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_195283 - SURFACE
      ?auto_195284 - SURFACE
      ?auto_195285 - SURFACE
      ?auto_195287 - SURFACE
      ?auto_195286 - SURFACE
      ?auto_195288 - SURFACE
      ?auto_195289 - SURFACE
      ?auto_195290 - SURFACE
      ?auto_195291 - SURFACE
    )
    :vars
    (
      ?auto_195292 - HOIST
      ?auto_195297 - PLACE
      ?auto_195294 - PLACE
      ?auto_195293 - HOIST
      ?auto_195296 - SURFACE
      ?auto_195295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_195292 ?auto_195297 ) ( IS-CRATE ?auto_195291 ) ( not ( = ?auto_195290 ?auto_195291 ) ) ( not ( = ?auto_195289 ?auto_195290 ) ) ( not ( = ?auto_195289 ?auto_195291 ) ) ( not ( = ?auto_195294 ?auto_195297 ) ) ( HOIST-AT ?auto_195293 ?auto_195294 ) ( not ( = ?auto_195292 ?auto_195293 ) ) ( AVAILABLE ?auto_195293 ) ( SURFACE-AT ?auto_195291 ?auto_195294 ) ( ON ?auto_195291 ?auto_195296 ) ( CLEAR ?auto_195291 ) ( not ( = ?auto_195290 ?auto_195296 ) ) ( not ( = ?auto_195291 ?auto_195296 ) ) ( not ( = ?auto_195289 ?auto_195296 ) ) ( TRUCK-AT ?auto_195295 ?auto_195297 ) ( SURFACE-AT ?auto_195289 ?auto_195297 ) ( CLEAR ?auto_195289 ) ( IS-CRATE ?auto_195290 ) ( AVAILABLE ?auto_195292 ) ( IN ?auto_195290 ?auto_195295 ) ( ON ?auto_195284 ?auto_195283 ) ( ON ?auto_195285 ?auto_195284 ) ( ON ?auto_195287 ?auto_195285 ) ( ON ?auto_195286 ?auto_195287 ) ( ON ?auto_195288 ?auto_195286 ) ( ON ?auto_195289 ?auto_195288 ) ( not ( = ?auto_195283 ?auto_195284 ) ) ( not ( = ?auto_195283 ?auto_195285 ) ) ( not ( = ?auto_195283 ?auto_195287 ) ) ( not ( = ?auto_195283 ?auto_195286 ) ) ( not ( = ?auto_195283 ?auto_195288 ) ) ( not ( = ?auto_195283 ?auto_195289 ) ) ( not ( = ?auto_195283 ?auto_195290 ) ) ( not ( = ?auto_195283 ?auto_195291 ) ) ( not ( = ?auto_195283 ?auto_195296 ) ) ( not ( = ?auto_195284 ?auto_195285 ) ) ( not ( = ?auto_195284 ?auto_195287 ) ) ( not ( = ?auto_195284 ?auto_195286 ) ) ( not ( = ?auto_195284 ?auto_195288 ) ) ( not ( = ?auto_195284 ?auto_195289 ) ) ( not ( = ?auto_195284 ?auto_195290 ) ) ( not ( = ?auto_195284 ?auto_195291 ) ) ( not ( = ?auto_195284 ?auto_195296 ) ) ( not ( = ?auto_195285 ?auto_195287 ) ) ( not ( = ?auto_195285 ?auto_195286 ) ) ( not ( = ?auto_195285 ?auto_195288 ) ) ( not ( = ?auto_195285 ?auto_195289 ) ) ( not ( = ?auto_195285 ?auto_195290 ) ) ( not ( = ?auto_195285 ?auto_195291 ) ) ( not ( = ?auto_195285 ?auto_195296 ) ) ( not ( = ?auto_195287 ?auto_195286 ) ) ( not ( = ?auto_195287 ?auto_195288 ) ) ( not ( = ?auto_195287 ?auto_195289 ) ) ( not ( = ?auto_195287 ?auto_195290 ) ) ( not ( = ?auto_195287 ?auto_195291 ) ) ( not ( = ?auto_195287 ?auto_195296 ) ) ( not ( = ?auto_195286 ?auto_195288 ) ) ( not ( = ?auto_195286 ?auto_195289 ) ) ( not ( = ?auto_195286 ?auto_195290 ) ) ( not ( = ?auto_195286 ?auto_195291 ) ) ( not ( = ?auto_195286 ?auto_195296 ) ) ( not ( = ?auto_195288 ?auto_195289 ) ) ( not ( = ?auto_195288 ?auto_195290 ) ) ( not ( = ?auto_195288 ?auto_195291 ) ) ( not ( = ?auto_195288 ?auto_195296 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_195289 ?auto_195290 ?auto_195291 )
      ( MAKE-8CRATE-VERIFY ?auto_195283 ?auto_195284 ?auto_195285 ?auto_195287 ?auto_195286 ?auto_195288 ?auto_195289 ?auto_195290 ?auto_195291 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_195978 - SURFACE
      ?auto_195979 - SURFACE
    )
    :vars
    (
      ?auto_195980 - HOIST
      ?auto_195986 - PLACE
      ?auto_195984 - SURFACE
      ?auto_195985 - TRUCK
      ?auto_195982 - PLACE
      ?auto_195981 - HOIST
      ?auto_195983 - SURFACE
      ?auto_195987 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_195980 ?auto_195986 ) ( SURFACE-AT ?auto_195978 ?auto_195986 ) ( CLEAR ?auto_195978 ) ( IS-CRATE ?auto_195979 ) ( not ( = ?auto_195978 ?auto_195979 ) ) ( AVAILABLE ?auto_195980 ) ( ON ?auto_195978 ?auto_195984 ) ( not ( = ?auto_195984 ?auto_195978 ) ) ( not ( = ?auto_195984 ?auto_195979 ) ) ( TRUCK-AT ?auto_195985 ?auto_195982 ) ( not ( = ?auto_195982 ?auto_195986 ) ) ( HOIST-AT ?auto_195981 ?auto_195982 ) ( not ( = ?auto_195980 ?auto_195981 ) ) ( SURFACE-AT ?auto_195979 ?auto_195982 ) ( ON ?auto_195979 ?auto_195983 ) ( CLEAR ?auto_195979 ) ( not ( = ?auto_195978 ?auto_195983 ) ) ( not ( = ?auto_195979 ?auto_195983 ) ) ( not ( = ?auto_195984 ?auto_195983 ) ) ( LIFTING ?auto_195981 ?auto_195987 ) ( IS-CRATE ?auto_195987 ) ( not ( = ?auto_195978 ?auto_195987 ) ) ( not ( = ?auto_195979 ?auto_195987 ) ) ( not ( = ?auto_195984 ?auto_195987 ) ) ( not ( = ?auto_195983 ?auto_195987 ) ) )
    :subtasks
    ( ( !LOAD ?auto_195981 ?auto_195987 ?auto_195985 ?auto_195982 )
      ( MAKE-1CRATE ?auto_195978 ?auto_195979 )
      ( MAKE-1CRATE-VERIFY ?auto_195978 ?auto_195979 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199366 - SURFACE
      ?auto_199367 - SURFACE
      ?auto_199368 - SURFACE
      ?auto_199370 - SURFACE
      ?auto_199369 - SURFACE
      ?auto_199371 - SURFACE
      ?auto_199372 - SURFACE
      ?auto_199373 - SURFACE
      ?auto_199374 - SURFACE
      ?auto_199375 - SURFACE
    )
    :vars
    (
      ?auto_199376 - HOIST
      ?auto_199377 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_199376 ?auto_199377 ) ( SURFACE-AT ?auto_199374 ?auto_199377 ) ( CLEAR ?auto_199374 ) ( LIFTING ?auto_199376 ?auto_199375 ) ( IS-CRATE ?auto_199375 ) ( not ( = ?auto_199374 ?auto_199375 ) ) ( ON ?auto_199367 ?auto_199366 ) ( ON ?auto_199368 ?auto_199367 ) ( ON ?auto_199370 ?auto_199368 ) ( ON ?auto_199369 ?auto_199370 ) ( ON ?auto_199371 ?auto_199369 ) ( ON ?auto_199372 ?auto_199371 ) ( ON ?auto_199373 ?auto_199372 ) ( ON ?auto_199374 ?auto_199373 ) ( not ( = ?auto_199366 ?auto_199367 ) ) ( not ( = ?auto_199366 ?auto_199368 ) ) ( not ( = ?auto_199366 ?auto_199370 ) ) ( not ( = ?auto_199366 ?auto_199369 ) ) ( not ( = ?auto_199366 ?auto_199371 ) ) ( not ( = ?auto_199366 ?auto_199372 ) ) ( not ( = ?auto_199366 ?auto_199373 ) ) ( not ( = ?auto_199366 ?auto_199374 ) ) ( not ( = ?auto_199366 ?auto_199375 ) ) ( not ( = ?auto_199367 ?auto_199368 ) ) ( not ( = ?auto_199367 ?auto_199370 ) ) ( not ( = ?auto_199367 ?auto_199369 ) ) ( not ( = ?auto_199367 ?auto_199371 ) ) ( not ( = ?auto_199367 ?auto_199372 ) ) ( not ( = ?auto_199367 ?auto_199373 ) ) ( not ( = ?auto_199367 ?auto_199374 ) ) ( not ( = ?auto_199367 ?auto_199375 ) ) ( not ( = ?auto_199368 ?auto_199370 ) ) ( not ( = ?auto_199368 ?auto_199369 ) ) ( not ( = ?auto_199368 ?auto_199371 ) ) ( not ( = ?auto_199368 ?auto_199372 ) ) ( not ( = ?auto_199368 ?auto_199373 ) ) ( not ( = ?auto_199368 ?auto_199374 ) ) ( not ( = ?auto_199368 ?auto_199375 ) ) ( not ( = ?auto_199370 ?auto_199369 ) ) ( not ( = ?auto_199370 ?auto_199371 ) ) ( not ( = ?auto_199370 ?auto_199372 ) ) ( not ( = ?auto_199370 ?auto_199373 ) ) ( not ( = ?auto_199370 ?auto_199374 ) ) ( not ( = ?auto_199370 ?auto_199375 ) ) ( not ( = ?auto_199369 ?auto_199371 ) ) ( not ( = ?auto_199369 ?auto_199372 ) ) ( not ( = ?auto_199369 ?auto_199373 ) ) ( not ( = ?auto_199369 ?auto_199374 ) ) ( not ( = ?auto_199369 ?auto_199375 ) ) ( not ( = ?auto_199371 ?auto_199372 ) ) ( not ( = ?auto_199371 ?auto_199373 ) ) ( not ( = ?auto_199371 ?auto_199374 ) ) ( not ( = ?auto_199371 ?auto_199375 ) ) ( not ( = ?auto_199372 ?auto_199373 ) ) ( not ( = ?auto_199372 ?auto_199374 ) ) ( not ( = ?auto_199372 ?auto_199375 ) ) ( not ( = ?auto_199373 ?auto_199374 ) ) ( not ( = ?auto_199373 ?auto_199375 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_199374 ?auto_199375 )
      ( MAKE-9CRATE-VERIFY ?auto_199366 ?auto_199367 ?auto_199368 ?auto_199370 ?auto_199369 ?auto_199371 ?auto_199372 ?auto_199373 ?auto_199374 ?auto_199375 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199446 - SURFACE
      ?auto_199447 - SURFACE
      ?auto_199448 - SURFACE
      ?auto_199450 - SURFACE
      ?auto_199449 - SURFACE
      ?auto_199451 - SURFACE
      ?auto_199452 - SURFACE
      ?auto_199453 - SURFACE
      ?auto_199454 - SURFACE
      ?auto_199455 - SURFACE
    )
    :vars
    (
      ?auto_199456 - HOIST
      ?auto_199458 - PLACE
      ?auto_199457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_199456 ?auto_199458 ) ( SURFACE-AT ?auto_199454 ?auto_199458 ) ( CLEAR ?auto_199454 ) ( IS-CRATE ?auto_199455 ) ( not ( = ?auto_199454 ?auto_199455 ) ) ( TRUCK-AT ?auto_199457 ?auto_199458 ) ( AVAILABLE ?auto_199456 ) ( IN ?auto_199455 ?auto_199457 ) ( ON ?auto_199454 ?auto_199453 ) ( not ( = ?auto_199453 ?auto_199454 ) ) ( not ( = ?auto_199453 ?auto_199455 ) ) ( ON ?auto_199447 ?auto_199446 ) ( ON ?auto_199448 ?auto_199447 ) ( ON ?auto_199450 ?auto_199448 ) ( ON ?auto_199449 ?auto_199450 ) ( ON ?auto_199451 ?auto_199449 ) ( ON ?auto_199452 ?auto_199451 ) ( ON ?auto_199453 ?auto_199452 ) ( not ( = ?auto_199446 ?auto_199447 ) ) ( not ( = ?auto_199446 ?auto_199448 ) ) ( not ( = ?auto_199446 ?auto_199450 ) ) ( not ( = ?auto_199446 ?auto_199449 ) ) ( not ( = ?auto_199446 ?auto_199451 ) ) ( not ( = ?auto_199446 ?auto_199452 ) ) ( not ( = ?auto_199446 ?auto_199453 ) ) ( not ( = ?auto_199446 ?auto_199454 ) ) ( not ( = ?auto_199446 ?auto_199455 ) ) ( not ( = ?auto_199447 ?auto_199448 ) ) ( not ( = ?auto_199447 ?auto_199450 ) ) ( not ( = ?auto_199447 ?auto_199449 ) ) ( not ( = ?auto_199447 ?auto_199451 ) ) ( not ( = ?auto_199447 ?auto_199452 ) ) ( not ( = ?auto_199447 ?auto_199453 ) ) ( not ( = ?auto_199447 ?auto_199454 ) ) ( not ( = ?auto_199447 ?auto_199455 ) ) ( not ( = ?auto_199448 ?auto_199450 ) ) ( not ( = ?auto_199448 ?auto_199449 ) ) ( not ( = ?auto_199448 ?auto_199451 ) ) ( not ( = ?auto_199448 ?auto_199452 ) ) ( not ( = ?auto_199448 ?auto_199453 ) ) ( not ( = ?auto_199448 ?auto_199454 ) ) ( not ( = ?auto_199448 ?auto_199455 ) ) ( not ( = ?auto_199450 ?auto_199449 ) ) ( not ( = ?auto_199450 ?auto_199451 ) ) ( not ( = ?auto_199450 ?auto_199452 ) ) ( not ( = ?auto_199450 ?auto_199453 ) ) ( not ( = ?auto_199450 ?auto_199454 ) ) ( not ( = ?auto_199450 ?auto_199455 ) ) ( not ( = ?auto_199449 ?auto_199451 ) ) ( not ( = ?auto_199449 ?auto_199452 ) ) ( not ( = ?auto_199449 ?auto_199453 ) ) ( not ( = ?auto_199449 ?auto_199454 ) ) ( not ( = ?auto_199449 ?auto_199455 ) ) ( not ( = ?auto_199451 ?auto_199452 ) ) ( not ( = ?auto_199451 ?auto_199453 ) ) ( not ( = ?auto_199451 ?auto_199454 ) ) ( not ( = ?auto_199451 ?auto_199455 ) ) ( not ( = ?auto_199452 ?auto_199453 ) ) ( not ( = ?auto_199452 ?auto_199454 ) ) ( not ( = ?auto_199452 ?auto_199455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199453 ?auto_199454 ?auto_199455 )
      ( MAKE-9CRATE-VERIFY ?auto_199446 ?auto_199447 ?auto_199448 ?auto_199450 ?auto_199449 ?auto_199451 ?auto_199452 ?auto_199453 ?auto_199454 ?auto_199455 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199536 - SURFACE
      ?auto_199537 - SURFACE
      ?auto_199538 - SURFACE
      ?auto_199540 - SURFACE
      ?auto_199539 - SURFACE
      ?auto_199541 - SURFACE
      ?auto_199542 - SURFACE
      ?auto_199543 - SURFACE
      ?auto_199544 - SURFACE
      ?auto_199545 - SURFACE
    )
    :vars
    (
      ?auto_199547 - HOIST
      ?auto_199548 - PLACE
      ?auto_199546 - TRUCK
      ?auto_199549 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_199547 ?auto_199548 ) ( SURFACE-AT ?auto_199544 ?auto_199548 ) ( CLEAR ?auto_199544 ) ( IS-CRATE ?auto_199545 ) ( not ( = ?auto_199544 ?auto_199545 ) ) ( AVAILABLE ?auto_199547 ) ( IN ?auto_199545 ?auto_199546 ) ( ON ?auto_199544 ?auto_199543 ) ( not ( = ?auto_199543 ?auto_199544 ) ) ( not ( = ?auto_199543 ?auto_199545 ) ) ( TRUCK-AT ?auto_199546 ?auto_199549 ) ( not ( = ?auto_199549 ?auto_199548 ) ) ( ON ?auto_199537 ?auto_199536 ) ( ON ?auto_199538 ?auto_199537 ) ( ON ?auto_199540 ?auto_199538 ) ( ON ?auto_199539 ?auto_199540 ) ( ON ?auto_199541 ?auto_199539 ) ( ON ?auto_199542 ?auto_199541 ) ( ON ?auto_199543 ?auto_199542 ) ( not ( = ?auto_199536 ?auto_199537 ) ) ( not ( = ?auto_199536 ?auto_199538 ) ) ( not ( = ?auto_199536 ?auto_199540 ) ) ( not ( = ?auto_199536 ?auto_199539 ) ) ( not ( = ?auto_199536 ?auto_199541 ) ) ( not ( = ?auto_199536 ?auto_199542 ) ) ( not ( = ?auto_199536 ?auto_199543 ) ) ( not ( = ?auto_199536 ?auto_199544 ) ) ( not ( = ?auto_199536 ?auto_199545 ) ) ( not ( = ?auto_199537 ?auto_199538 ) ) ( not ( = ?auto_199537 ?auto_199540 ) ) ( not ( = ?auto_199537 ?auto_199539 ) ) ( not ( = ?auto_199537 ?auto_199541 ) ) ( not ( = ?auto_199537 ?auto_199542 ) ) ( not ( = ?auto_199537 ?auto_199543 ) ) ( not ( = ?auto_199537 ?auto_199544 ) ) ( not ( = ?auto_199537 ?auto_199545 ) ) ( not ( = ?auto_199538 ?auto_199540 ) ) ( not ( = ?auto_199538 ?auto_199539 ) ) ( not ( = ?auto_199538 ?auto_199541 ) ) ( not ( = ?auto_199538 ?auto_199542 ) ) ( not ( = ?auto_199538 ?auto_199543 ) ) ( not ( = ?auto_199538 ?auto_199544 ) ) ( not ( = ?auto_199538 ?auto_199545 ) ) ( not ( = ?auto_199540 ?auto_199539 ) ) ( not ( = ?auto_199540 ?auto_199541 ) ) ( not ( = ?auto_199540 ?auto_199542 ) ) ( not ( = ?auto_199540 ?auto_199543 ) ) ( not ( = ?auto_199540 ?auto_199544 ) ) ( not ( = ?auto_199540 ?auto_199545 ) ) ( not ( = ?auto_199539 ?auto_199541 ) ) ( not ( = ?auto_199539 ?auto_199542 ) ) ( not ( = ?auto_199539 ?auto_199543 ) ) ( not ( = ?auto_199539 ?auto_199544 ) ) ( not ( = ?auto_199539 ?auto_199545 ) ) ( not ( = ?auto_199541 ?auto_199542 ) ) ( not ( = ?auto_199541 ?auto_199543 ) ) ( not ( = ?auto_199541 ?auto_199544 ) ) ( not ( = ?auto_199541 ?auto_199545 ) ) ( not ( = ?auto_199542 ?auto_199543 ) ) ( not ( = ?auto_199542 ?auto_199544 ) ) ( not ( = ?auto_199542 ?auto_199545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199543 ?auto_199544 ?auto_199545 )
      ( MAKE-9CRATE-VERIFY ?auto_199536 ?auto_199537 ?auto_199538 ?auto_199540 ?auto_199539 ?auto_199541 ?auto_199542 ?auto_199543 ?auto_199544 ?auto_199545 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199635 - SURFACE
      ?auto_199636 - SURFACE
      ?auto_199637 - SURFACE
      ?auto_199639 - SURFACE
      ?auto_199638 - SURFACE
      ?auto_199640 - SURFACE
      ?auto_199641 - SURFACE
      ?auto_199642 - SURFACE
      ?auto_199643 - SURFACE
      ?auto_199644 - SURFACE
    )
    :vars
    (
      ?auto_199646 - HOIST
      ?auto_199645 - PLACE
      ?auto_199647 - TRUCK
      ?auto_199649 - PLACE
      ?auto_199648 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_199646 ?auto_199645 ) ( SURFACE-AT ?auto_199643 ?auto_199645 ) ( CLEAR ?auto_199643 ) ( IS-CRATE ?auto_199644 ) ( not ( = ?auto_199643 ?auto_199644 ) ) ( AVAILABLE ?auto_199646 ) ( ON ?auto_199643 ?auto_199642 ) ( not ( = ?auto_199642 ?auto_199643 ) ) ( not ( = ?auto_199642 ?auto_199644 ) ) ( TRUCK-AT ?auto_199647 ?auto_199649 ) ( not ( = ?auto_199649 ?auto_199645 ) ) ( HOIST-AT ?auto_199648 ?auto_199649 ) ( LIFTING ?auto_199648 ?auto_199644 ) ( not ( = ?auto_199646 ?auto_199648 ) ) ( ON ?auto_199636 ?auto_199635 ) ( ON ?auto_199637 ?auto_199636 ) ( ON ?auto_199639 ?auto_199637 ) ( ON ?auto_199638 ?auto_199639 ) ( ON ?auto_199640 ?auto_199638 ) ( ON ?auto_199641 ?auto_199640 ) ( ON ?auto_199642 ?auto_199641 ) ( not ( = ?auto_199635 ?auto_199636 ) ) ( not ( = ?auto_199635 ?auto_199637 ) ) ( not ( = ?auto_199635 ?auto_199639 ) ) ( not ( = ?auto_199635 ?auto_199638 ) ) ( not ( = ?auto_199635 ?auto_199640 ) ) ( not ( = ?auto_199635 ?auto_199641 ) ) ( not ( = ?auto_199635 ?auto_199642 ) ) ( not ( = ?auto_199635 ?auto_199643 ) ) ( not ( = ?auto_199635 ?auto_199644 ) ) ( not ( = ?auto_199636 ?auto_199637 ) ) ( not ( = ?auto_199636 ?auto_199639 ) ) ( not ( = ?auto_199636 ?auto_199638 ) ) ( not ( = ?auto_199636 ?auto_199640 ) ) ( not ( = ?auto_199636 ?auto_199641 ) ) ( not ( = ?auto_199636 ?auto_199642 ) ) ( not ( = ?auto_199636 ?auto_199643 ) ) ( not ( = ?auto_199636 ?auto_199644 ) ) ( not ( = ?auto_199637 ?auto_199639 ) ) ( not ( = ?auto_199637 ?auto_199638 ) ) ( not ( = ?auto_199637 ?auto_199640 ) ) ( not ( = ?auto_199637 ?auto_199641 ) ) ( not ( = ?auto_199637 ?auto_199642 ) ) ( not ( = ?auto_199637 ?auto_199643 ) ) ( not ( = ?auto_199637 ?auto_199644 ) ) ( not ( = ?auto_199639 ?auto_199638 ) ) ( not ( = ?auto_199639 ?auto_199640 ) ) ( not ( = ?auto_199639 ?auto_199641 ) ) ( not ( = ?auto_199639 ?auto_199642 ) ) ( not ( = ?auto_199639 ?auto_199643 ) ) ( not ( = ?auto_199639 ?auto_199644 ) ) ( not ( = ?auto_199638 ?auto_199640 ) ) ( not ( = ?auto_199638 ?auto_199641 ) ) ( not ( = ?auto_199638 ?auto_199642 ) ) ( not ( = ?auto_199638 ?auto_199643 ) ) ( not ( = ?auto_199638 ?auto_199644 ) ) ( not ( = ?auto_199640 ?auto_199641 ) ) ( not ( = ?auto_199640 ?auto_199642 ) ) ( not ( = ?auto_199640 ?auto_199643 ) ) ( not ( = ?auto_199640 ?auto_199644 ) ) ( not ( = ?auto_199641 ?auto_199642 ) ) ( not ( = ?auto_199641 ?auto_199643 ) ) ( not ( = ?auto_199641 ?auto_199644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199642 ?auto_199643 ?auto_199644 )
      ( MAKE-9CRATE-VERIFY ?auto_199635 ?auto_199636 ?auto_199637 ?auto_199639 ?auto_199638 ?auto_199640 ?auto_199641 ?auto_199642 ?auto_199643 ?auto_199644 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199743 - SURFACE
      ?auto_199744 - SURFACE
      ?auto_199745 - SURFACE
      ?auto_199747 - SURFACE
      ?auto_199746 - SURFACE
      ?auto_199748 - SURFACE
      ?auto_199749 - SURFACE
      ?auto_199750 - SURFACE
      ?auto_199751 - SURFACE
      ?auto_199752 - SURFACE
    )
    :vars
    (
      ?auto_199758 - HOIST
      ?auto_199755 - PLACE
      ?auto_199756 - TRUCK
      ?auto_199757 - PLACE
      ?auto_199753 - HOIST
      ?auto_199754 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_199758 ?auto_199755 ) ( SURFACE-AT ?auto_199751 ?auto_199755 ) ( CLEAR ?auto_199751 ) ( IS-CRATE ?auto_199752 ) ( not ( = ?auto_199751 ?auto_199752 ) ) ( AVAILABLE ?auto_199758 ) ( ON ?auto_199751 ?auto_199750 ) ( not ( = ?auto_199750 ?auto_199751 ) ) ( not ( = ?auto_199750 ?auto_199752 ) ) ( TRUCK-AT ?auto_199756 ?auto_199757 ) ( not ( = ?auto_199757 ?auto_199755 ) ) ( HOIST-AT ?auto_199753 ?auto_199757 ) ( not ( = ?auto_199758 ?auto_199753 ) ) ( AVAILABLE ?auto_199753 ) ( SURFACE-AT ?auto_199752 ?auto_199757 ) ( ON ?auto_199752 ?auto_199754 ) ( CLEAR ?auto_199752 ) ( not ( = ?auto_199751 ?auto_199754 ) ) ( not ( = ?auto_199752 ?auto_199754 ) ) ( not ( = ?auto_199750 ?auto_199754 ) ) ( ON ?auto_199744 ?auto_199743 ) ( ON ?auto_199745 ?auto_199744 ) ( ON ?auto_199747 ?auto_199745 ) ( ON ?auto_199746 ?auto_199747 ) ( ON ?auto_199748 ?auto_199746 ) ( ON ?auto_199749 ?auto_199748 ) ( ON ?auto_199750 ?auto_199749 ) ( not ( = ?auto_199743 ?auto_199744 ) ) ( not ( = ?auto_199743 ?auto_199745 ) ) ( not ( = ?auto_199743 ?auto_199747 ) ) ( not ( = ?auto_199743 ?auto_199746 ) ) ( not ( = ?auto_199743 ?auto_199748 ) ) ( not ( = ?auto_199743 ?auto_199749 ) ) ( not ( = ?auto_199743 ?auto_199750 ) ) ( not ( = ?auto_199743 ?auto_199751 ) ) ( not ( = ?auto_199743 ?auto_199752 ) ) ( not ( = ?auto_199743 ?auto_199754 ) ) ( not ( = ?auto_199744 ?auto_199745 ) ) ( not ( = ?auto_199744 ?auto_199747 ) ) ( not ( = ?auto_199744 ?auto_199746 ) ) ( not ( = ?auto_199744 ?auto_199748 ) ) ( not ( = ?auto_199744 ?auto_199749 ) ) ( not ( = ?auto_199744 ?auto_199750 ) ) ( not ( = ?auto_199744 ?auto_199751 ) ) ( not ( = ?auto_199744 ?auto_199752 ) ) ( not ( = ?auto_199744 ?auto_199754 ) ) ( not ( = ?auto_199745 ?auto_199747 ) ) ( not ( = ?auto_199745 ?auto_199746 ) ) ( not ( = ?auto_199745 ?auto_199748 ) ) ( not ( = ?auto_199745 ?auto_199749 ) ) ( not ( = ?auto_199745 ?auto_199750 ) ) ( not ( = ?auto_199745 ?auto_199751 ) ) ( not ( = ?auto_199745 ?auto_199752 ) ) ( not ( = ?auto_199745 ?auto_199754 ) ) ( not ( = ?auto_199747 ?auto_199746 ) ) ( not ( = ?auto_199747 ?auto_199748 ) ) ( not ( = ?auto_199747 ?auto_199749 ) ) ( not ( = ?auto_199747 ?auto_199750 ) ) ( not ( = ?auto_199747 ?auto_199751 ) ) ( not ( = ?auto_199747 ?auto_199752 ) ) ( not ( = ?auto_199747 ?auto_199754 ) ) ( not ( = ?auto_199746 ?auto_199748 ) ) ( not ( = ?auto_199746 ?auto_199749 ) ) ( not ( = ?auto_199746 ?auto_199750 ) ) ( not ( = ?auto_199746 ?auto_199751 ) ) ( not ( = ?auto_199746 ?auto_199752 ) ) ( not ( = ?auto_199746 ?auto_199754 ) ) ( not ( = ?auto_199748 ?auto_199749 ) ) ( not ( = ?auto_199748 ?auto_199750 ) ) ( not ( = ?auto_199748 ?auto_199751 ) ) ( not ( = ?auto_199748 ?auto_199752 ) ) ( not ( = ?auto_199748 ?auto_199754 ) ) ( not ( = ?auto_199749 ?auto_199750 ) ) ( not ( = ?auto_199749 ?auto_199751 ) ) ( not ( = ?auto_199749 ?auto_199752 ) ) ( not ( = ?auto_199749 ?auto_199754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199750 ?auto_199751 ?auto_199752 )
      ( MAKE-9CRATE-VERIFY ?auto_199743 ?auto_199744 ?auto_199745 ?auto_199747 ?auto_199746 ?auto_199748 ?auto_199749 ?auto_199750 ?auto_199751 ?auto_199752 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199852 - SURFACE
      ?auto_199853 - SURFACE
      ?auto_199854 - SURFACE
      ?auto_199856 - SURFACE
      ?auto_199855 - SURFACE
      ?auto_199857 - SURFACE
      ?auto_199858 - SURFACE
      ?auto_199859 - SURFACE
      ?auto_199860 - SURFACE
      ?auto_199861 - SURFACE
    )
    :vars
    (
      ?auto_199867 - HOIST
      ?auto_199866 - PLACE
      ?auto_199862 - PLACE
      ?auto_199865 - HOIST
      ?auto_199864 - SURFACE
      ?auto_199863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_199867 ?auto_199866 ) ( SURFACE-AT ?auto_199860 ?auto_199866 ) ( CLEAR ?auto_199860 ) ( IS-CRATE ?auto_199861 ) ( not ( = ?auto_199860 ?auto_199861 ) ) ( AVAILABLE ?auto_199867 ) ( ON ?auto_199860 ?auto_199859 ) ( not ( = ?auto_199859 ?auto_199860 ) ) ( not ( = ?auto_199859 ?auto_199861 ) ) ( not ( = ?auto_199862 ?auto_199866 ) ) ( HOIST-AT ?auto_199865 ?auto_199862 ) ( not ( = ?auto_199867 ?auto_199865 ) ) ( AVAILABLE ?auto_199865 ) ( SURFACE-AT ?auto_199861 ?auto_199862 ) ( ON ?auto_199861 ?auto_199864 ) ( CLEAR ?auto_199861 ) ( not ( = ?auto_199860 ?auto_199864 ) ) ( not ( = ?auto_199861 ?auto_199864 ) ) ( not ( = ?auto_199859 ?auto_199864 ) ) ( TRUCK-AT ?auto_199863 ?auto_199866 ) ( ON ?auto_199853 ?auto_199852 ) ( ON ?auto_199854 ?auto_199853 ) ( ON ?auto_199856 ?auto_199854 ) ( ON ?auto_199855 ?auto_199856 ) ( ON ?auto_199857 ?auto_199855 ) ( ON ?auto_199858 ?auto_199857 ) ( ON ?auto_199859 ?auto_199858 ) ( not ( = ?auto_199852 ?auto_199853 ) ) ( not ( = ?auto_199852 ?auto_199854 ) ) ( not ( = ?auto_199852 ?auto_199856 ) ) ( not ( = ?auto_199852 ?auto_199855 ) ) ( not ( = ?auto_199852 ?auto_199857 ) ) ( not ( = ?auto_199852 ?auto_199858 ) ) ( not ( = ?auto_199852 ?auto_199859 ) ) ( not ( = ?auto_199852 ?auto_199860 ) ) ( not ( = ?auto_199852 ?auto_199861 ) ) ( not ( = ?auto_199852 ?auto_199864 ) ) ( not ( = ?auto_199853 ?auto_199854 ) ) ( not ( = ?auto_199853 ?auto_199856 ) ) ( not ( = ?auto_199853 ?auto_199855 ) ) ( not ( = ?auto_199853 ?auto_199857 ) ) ( not ( = ?auto_199853 ?auto_199858 ) ) ( not ( = ?auto_199853 ?auto_199859 ) ) ( not ( = ?auto_199853 ?auto_199860 ) ) ( not ( = ?auto_199853 ?auto_199861 ) ) ( not ( = ?auto_199853 ?auto_199864 ) ) ( not ( = ?auto_199854 ?auto_199856 ) ) ( not ( = ?auto_199854 ?auto_199855 ) ) ( not ( = ?auto_199854 ?auto_199857 ) ) ( not ( = ?auto_199854 ?auto_199858 ) ) ( not ( = ?auto_199854 ?auto_199859 ) ) ( not ( = ?auto_199854 ?auto_199860 ) ) ( not ( = ?auto_199854 ?auto_199861 ) ) ( not ( = ?auto_199854 ?auto_199864 ) ) ( not ( = ?auto_199856 ?auto_199855 ) ) ( not ( = ?auto_199856 ?auto_199857 ) ) ( not ( = ?auto_199856 ?auto_199858 ) ) ( not ( = ?auto_199856 ?auto_199859 ) ) ( not ( = ?auto_199856 ?auto_199860 ) ) ( not ( = ?auto_199856 ?auto_199861 ) ) ( not ( = ?auto_199856 ?auto_199864 ) ) ( not ( = ?auto_199855 ?auto_199857 ) ) ( not ( = ?auto_199855 ?auto_199858 ) ) ( not ( = ?auto_199855 ?auto_199859 ) ) ( not ( = ?auto_199855 ?auto_199860 ) ) ( not ( = ?auto_199855 ?auto_199861 ) ) ( not ( = ?auto_199855 ?auto_199864 ) ) ( not ( = ?auto_199857 ?auto_199858 ) ) ( not ( = ?auto_199857 ?auto_199859 ) ) ( not ( = ?auto_199857 ?auto_199860 ) ) ( not ( = ?auto_199857 ?auto_199861 ) ) ( not ( = ?auto_199857 ?auto_199864 ) ) ( not ( = ?auto_199858 ?auto_199859 ) ) ( not ( = ?auto_199858 ?auto_199860 ) ) ( not ( = ?auto_199858 ?auto_199861 ) ) ( not ( = ?auto_199858 ?auto_199864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199859 ?auto_199860 ?auto_199861 )
      ( MAKE-9CRATE-VERIFY ?auto_199852 ?auto_199853 ?auto_199854 ?auto_199856 ?auto_199855 ?auto_199857 ?auto_199858 ?auto_199859 ?auto_199860 ?auto_199861 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_199961 - SURFACE
      ?auto_199962 - SURFACE
      ?auto_199963 - SURFACE
      ?auto_199965 - SURFACE
      ?auto_199964 - SURFACE
      ?auto_199966 - SURFACE
      ?auto_199967 - SURFACE
      ?auto_199968 - SURFACE
      ?auto_199969 - SURFACE
      ?auto_199970 - SURFACE
    )
    :vars
    (
      ?auto_199974 - HOIST
      ?auto_199975 - PLACE
      ?auto_199973 - PLACE
      ?auto_199972 - HOIST
      ?auto_199971 - SURFACE
      ?auto_199976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_199974 ?auto_199975 ) ( IS-CRATE ?auto_199970 ) ( not ( = ?auto_199969 ?auto_199970 ) ) ( not ( = ?auto_199968 ?auto_199969 ) ) ( not ( = ?auto_199968 ?auto_199970 ) ) ( not ( = ?auto_199973 ?auto_199975 ) ) ( HOIST-AT ?auto_199972 ?auto_199973 ) ( not ( = ?auto_199974 ?auto_199972 ) ) ( AVAILABLE ?auto_199972 ) ( SURFACE-AT ?auto_199970 ?auto_199973 ) ( ON ?auto_199970 ?auto_199971 ) ( CLEAR ?auto_199970 ) ( not ( = ?auto_199969 ?auto_199971 ) ) ( not ( = ?auto_199970 ?auto_199971 ) ) ( not ( = ?auto_199968 ?auto_199971 ) ) ( TRUCK-AT ?auto_199976 ?auto_199975 ) ( SURFACE-AT ?auto_199968 ?auto_199975 ) ( CLEAR ?auto_199968 ) ( LIFTING ?auto_199974 ?auto_199969 ) ( IS-CRATE ?auto_199969 ) ( ON ?auto_199962 ?auto_199961 ) ( ON ?auto_199963 ?auto_199962 ) ( ON ?auto_199965 ?auto_199963 ) ( ON ?auto_199964 ?auto_199965 ) ( ON ?auto_199966 ?auto_199964 ) ( ON ?auto_199967 ?auto_199966 ) ( ON ?auto_199968 ?auto_199967 ) ( not ( = ?auto_199961 ?auto_199962 ) ) ( not ( = ?auto_199961 ?auto_199963 ) ) ( not ( = ?auto_199961 ?auto_199965 ) ) ( not ( = ?auto_199961 ?auto_199964 ) ) ( not ( = ?auto_199961 ?auto_199966 ) ) ( not ( = ?auto_199961 ?auto_199967 ) ) ( not ( = ?auto_199961 ?auto_199968 ) ) ( not ( = ?auto_199961 ?auto_199969 ) ) ( not ( = ?auto_199961 ?auto_199970 ) ) ( not ( = ?auto_199961 ?auto_199971 ) ) ( not ( = ?auto_199962 ?auto_199963 ) ) ( not ( = ?auto_199962 ?auto_199965 ) ) ( not ( = ?auto_199962 ?auto_199964 ) ) ( not ( = ?auto_199962 ?auto_199966 ) ) ( not ( = ?auto_199962 ?auto_199967 ) ) ( not ( = ?auto_199962 ?auto_199968 ) ) ( not ( = ?auto_199962 ?auto_199969 ) ) ( not ( = ?auto_199962 ?auto_199970 ) ) ( not ( = ?auto_199962 ?auto_199971 ) ) ( not ( = ?auto_199963 ?auto_199965 ) ) ( not ( = ?auto_199963 ?auto_199964 ) ) ( not ( = ?auto_199963 ?auto_199966 ) ) ( not ( = ?auto_199963 ?auto_199967 ) ) ( not ( = ?auto_199963 ?auto_199968 ) ) ( not ( = ?auto_199963 ?auto_199969 ) ) ( not ( = ?auto_199963 ?auto_199970 ) ) ( not ( = ?auto_199963 ?auto_199971 ) ) ( not ( = ?auto_199965 ?auto_199964 ) ) ( not ( = ?auto_199965 ?auto_199966 ) ) ( not ( = ?auto_199965 ?auto_199967 ) ) ( not ( = ?auto_199965 ?auto_199968 ) ) ( not ( = ?auto_199965 ?auto_199969 ) ) ( not ( = ?auto_199965 ?auto_199970 ) ) ( not ( = ?auto_199965 ?auto_199971 ) ) ( not ( = ?auto_199964 ?auto_199966 ) ) ( not ( = ?auto_199964 ?auto_199967 ) ) ( not ( = ?auto_199964 ?auto_199968 ) ) ( not ( = ?auto_199964 ?auto_199969 ) ) ( not ( = ?auto_199964 ?auto_199970 ) ) ( not ( = ?auto_199964 ?auto_199971 ) ) ( not ( = ?auto_199966 ?auto_199967 ) ) ( not ( = ?auto_199966 ?auto_199968 ) ) ( not ( = ?auto_199966 ?auto_199969 ) ) ( not ( = ?auto_199966 ?auto_199970 ) ) ( not ( = ?auto_199966 ?auto_199971 ) ) ( not ( = ?auto_199967 ?auto_199968 ) ) ( not ( = ?auto_199967 ?auto_199969 ) ) ( not ( = ?auto_199967 ?auto_199970 ) ) ( not ( = ?auto_199967 ?auto_199971 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_199968 ?auto_199969 ?auto_199970 )
      ( MAKE-9CRATE-VERIFY ?auto_199961 ?auto_199962 ?auto_199963 ?auto_199965 ?auto_199964 ?auto_199966 ?auto_199967 ?auto_199968 ?auto_199969 ?auto_199970 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200070 - SURFACE
      ?auto_200071 - SURFACE
      ?auto_200072 - SURFACE
      ?auto_200074 - SURFACE
      ?auto_200073 - SURFACE
      ?auto_200075 - SURFACE
      ?auto_200076 - SURFACE
      ?auto_200077 - SURFACE
      ?auto_200078 - SURFACE
      ?auto_200079 - SURFACE
    )
    :vars
    (
      ?auto_200084 - HOIST
      ?auto_200083 - PLACE
      ?auto_200085 - PLACE
      ?auto_200080 - HOIST
      ?auto_200082 - SURFACE
      ?auto_200081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200084 ?auto_200083 ) ( IS-CRATE ?auto_200079 ) ( not ( = ?auto_200078 ?auto_200079 ) ) ( not ( = ?auto_200077 ?auto_200078 ) ) ( not ( = ?auto_200077 ?auto_200079 ) ) ( not ( = ?auto_200085 ?auto_200083 ) ) ( HOIST-AT ?auto_200080 ?auto_200085 ) ( not ( = ?auto_200084 ?auto_200080 ) ) ( AVAILABLE ?auto_200080 ) ( SURFACE-AT ?auto_200079 ?auto_200085 ) ( ON ?auto_200079 ?auto_200082 ) ( CLEAR ?auto_200079 ) ( not ( = ?auto_200078 ?auto_200082 ) ) ( not ( = ?auto_200079 ?auto_200082 ) ) ( not ( = ?auto_200077 ?auto_200082 ) ) ( TRUCK-AT ?auto_200081 ?auto_200083 ) ( SURFACE-AT ?auto_200077 ?auto_200083 ) ( CLEAR ?auto_200077 ) ( IS-CRATE ?auto_200078 ) ( AVAILABLE ?auto_200084 ) ( IN ?auto_200078 ?auto_200081 ) ( ON ?auto_200071 ?auto_200070 ) ( ON ?auto_200072 ?auto_200071 ) ( ON ?auto_200074 ?auto_200072 ) ( ON ?auto_200073 ?auto_200074 ) ( ON ?auto_200075 ?auto_200073 ) ( ON ?auto_200076 ?auto_200075 ) ( ON ?auto_200077 ?auto_200076 ) ( not ( = ?auto_200070 ?auto_200071 ) ) ( not ( = ?auto_200070 ?auto_200072 ) ) ( not ( = ?auto_200070 ?auto_200074 ) ) ( not ( = ?auto_200070 ?auto_200073 ) ) ( not ( = ?auto_200070 ?auto_200075 ) ) ( not ( = ?auto_200070 ?auto_200076 ) ) ( not ( = ?auto_200070 ?auto_200077 ) ) ( not ( = ?auto_200070 ?auto_200078 ) ) ( not ( = ?auto_200070 ?auto_200079 ) ) ( not ( = ?auto_200070 ?auto_200082 ) ) ( not ( = ?auto_200071 ?auto_200072 ) ) ( not ( = ?auto_200071 ?auto_200074 ) ) ( not ( = ?auto_200071 ?auto_200073 ) ) ( not ( = ?auto_200071 ?auto_200075 ) ) ( not ( = ?auto_200071 ?auto_200076 ) ) ( not ( = ?auto_200071 ?auto_200077 ) ) ( not ( = ?auto_200071 ?auto_200078 ) ) ( not ( = ?auto_200071 ?auto_200079 ) ) ( not ( = ?auto_200071 ?auto_200082 ) ) ( not ( = ?auto_200072 ?auto_200074 ) ) ( not ( = ?auto_200072 ?auto_200073 ) ) ( not ( = ?auto_200072 ?auto_200075 ) ) ( not ( = ?auto_200072 ?auto_200076 ) ) ( not ( = ?auto_200072 ?auto_200077 ) ) ( not ( = ?auto_200072 ?auto_200078 ) ) ( not ( = ?auto_200072 ?auto_200079 ) ) ( not ( = ?auto_200072 ?auto_200082 ) ) ( not ( = ?auto_200074 ?auto_200073 ) ) ( not ( = ?auto_200074 ?auto_200075 ) ) ( not ( = ?auto_200074 ?auto_200076 ) ) ( not ( = ?auto_200074 ?auto_200077 ) ) ( not ( = ?auto_200074 ?auto_200078 ) ) ( not ( = ?auto_200074 ?auto_200079 ) ) ( not ( = ?auto_200074 ?auto_200082 ) ) ( not ( = ?auto_200073 ?auto_200075 ) ) ( not ( = ?auto_200073 ?auto_200076 ) ) ( not ( = ?auto_200073 ?auto_200077 ) ) ( not ( = ?auto_200073 ?auto_200078 ) ) ( not ( = ?auto_200073 ?auto_200079 ) ) ( not ( = ?auto_200073 ?auto_200082 ) ) ( not ( = ?auto_200075 ?auto_200076 ) ) ( not ( = ?auto_200075 ?auto_200077 ) ) ( not ( = ?auto_200075 ?auto_200078 ) ) ( not ( = ?auto_200075 ?auto_200079 ) ) ( not ( = ?auto_200075 ?auto_200082 ) ) ( not ( = ?auto_200076 ?auto_200077 ) ) ( not ( = ?auto_200076 ?auto_200078 ) ) ( not ( = ?auto_200076 ?auto_200079 ) ) ( not ( = ?auto_200076 ?auto_200082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200077 ?auto_200078 ?auto_200079 )
      ( MAKE-9CRATE-VERIFY ?auto_200070 ?auto_200071 ?auto_200072 ?auto_200074 ?auto_200073 ?auto_200075 ?auto_200076 ?auto_200077 ?auto_200078 ?auto_200079 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_200150 - SURFACE
      ?auto_200151 - SURFACE
      ?auto_200152 - SURFACE
      ?auto_200154 - SURFACE
      ?auto_200153 - SURFACE
      ?auto_200155 - SURFACE
      ?auto_200156 - SURFACE
      ?auto_200157 - SURFACE
    )
    :vars
    (
      ?auto_200160 - HOIST
      ?auto_200163 - PLACE
      ?auto_200162 - PLACE
      ?auto_200159 - HOIST
      ?auto_200158 - SURFACE
      ?auto_200161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200160 ?auto_200163 ) ( IS-CRATE ?auto_200157 ) ( not ( = ?auto_200156 ?auto_200157 ) ) ( not ( = ?auto_200155 ?auto_200156 ) ) ( not ( = ?auto_200155 ?auto_200157 ) ) ( not ( = ?auto_200162 ?auto_200163 ) ) ( HOIST-AT ?auto_200159 ?auto_200162 ) ( not ( = ?auto_200160 ?auto_200159 ) ) ( AVAILABLE ?auto_200159 ) ( SURFACE-AT ?auto_200157 ?auto_200162 ) ( ON ?auto_200157 ?auto_200158 ) ( CLEAR ?auto_200157 ) ( not ( = ?auto_200156 ?auto_200158 ) ) ( not ( = ?auto_200157 ?auto_200158 ) ) ( not ( = ?auto_200155 ?auto_200158 ) ) ( SURFACE-AT ?auto_200155 ?auto_200163 ) ( CLEAR ?auto_200155 ) ( IS-CRATE ?auto_200156 ) ( AVAILABLE ?auto_200160 ) ( IN ?auto_200156 ?auto_200161 ) ( TRUCK-AT ?auto_200161 ?auto_200162 ) ( ON ?auto_200151 ?auto_200150 ) ( ON ?auto_200152 ?auto_200151 ) ( ON ?auto_200154 ?auto_200152 ) ( ON ?auto_200153 ?auto_200154 ) ( ON ?auto_200155 ?auto_200153 ) ( not ( = ?auto_200150 ?auto_200151 ) ) ( not ( = ?auto_200150 ?auto_200152 ) ) ( not ( = ?auto_200150 ?auto_200154 ) ) ( not ( = ?auto_200150 ?auto_200153 ) ) ( not ( = ?auto_200150 ?auto_200155 ) ) ( not ( = ?auto_200150 ?auto_200156 ) ) ( not ( = ?auto_200150 ?auto_200157 ) ) ( not ( = ?auto_200150 ?auto_200158 ) ) ( not ( = ?auto_200151 ?auto_200152 ) ) ( not ( = ?auto_200151 ?auto_200154 ) ) ( not ( = ?auto_200151 ?auto_200153 ) ) ( not ( = ?auto_200151 ?auto_200155 ) ) ( not ( = ?auto_200151 ?auto_200156 ) ) ( not ( = ?auto_200151 ?auto_200157 ) ) ( not ( = ?auto_200151 ?auto_200158 ) ) ( not ( = ?auto_200152 ?auto_200154 ) ) ( not ( = ?auto_200152 ?auto_200153 ) ) ( not ( = ?auto_200152 ?auto_200155 ) ) ( not ( = ?auto_200152 ?auto_200156 ) ) ( not ( = ?auto_200152 ?auto_200157 ) ) ( not ( = ?auto_200152 ?auto_200158 ) ) ( not ( = ?auto_200154 ?auto_200153 ) ) ( not ( = ?auto_200154 ?auto_200155 ) ) ( not ( = ?auto_200154 ?auto_200156 ) ) ( not ( = ?auto_200154 ?auto_200157 ) ) ( not ( = ?auto_200154 ?auto_200158 ) ) ( not ( = ?auto_200153 ?auto_200155 ) ) ( not ( = ?auto_200153 ?auto_200156 ) ) ( not ( = ?auto_200153 ?auto_200157 ) ) ( not ( = ?auto_200153 ?auto_200158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200155 ?auto_200156 ?auto_200157 )
      ( MAKE-7CRATE-VERIFY ?auto_200150 ?auto_200151 ?auto_200152 ?auto_200154 ?auto_200153 ?auto_200155 ?auto_200156 ?auto_200157 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_200164 - SURFACE
      ?auto_200165 - SURFACE
      ?auto_200166 - SURFACE
      ?auto_200168 - SURFACE
      ?auto_200167 - SURFACE
      ?auto_200169 - SURFACE
      ?auto_200170 - SURFACE
      ?auto_200171 - SURFACE
      ?auto_200172 - SURFACE
    )
    :vars
    (
      ?auto_200175 - HOIST
      ?auto_200178 - PLACE
      ?auto_200177 - PLACE
      ?auto_200174 - HOIST
      ?auto_200173 - SURFACE
      ?auto_200176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200175 ?auto_200178 ) ( IS-CRATE ?auto_200172 ) ( not ( = ?auto_200171 ?auto_200172 ) ) ( not ( = ?auto_200170 ?auto_200171 ) ) ( not ( = ?auto_200170 ?auto_200172 ) ) ( not ( = ?auto_200177 ?auto_200178 ) ) ( HOIST-AT ?auto_200174 ?auto_200177 ) ( not ( = ?auto_200175 ?auto_200174 ) ) ( AVAILABLE ?auto_200174 ) ( SURFACE-AT ?auto_200172 ?auto_200177 ) ( ON ?auto_200172 ?auto_200173 ) ( CLEAR ?auto_200172 ) ( not ( = ?auto_200171 ?auto_200173 ) ) ( not ( = ?auto_200172 ?auto_200173 ) ) ( not ( = ?auto_200170 ?auto_200173 ) ) ( SURFACE-AT ?auto_200170 ?auto_200178 ) ( CLEAR ?auto_200170 ) ( IS-CRATE ?auto_200171 ) ( AVAILABLE ?auto_200175 ) ( IN ?auto_200171 ?auto_200176 ) ( TRUCK-AT ?auto_200176 ?auto_200177 ) ( ON ?auto_200165 ?auto_200164 ) ( ON ?auto_200166 ?auto_200165 ) ( ON ?auto_200168 ?auto_200166 ) ( ON ?auto_200167 ?auto_200168 ) ( ON ?auto_200169 ?auto_200167 ) ( ON ?auto_200170 ?auto_200169 ) ( not ( = ?auto_200164 ?auto_200165 ) ) ( not ( = ?auto_200164 ?auto_200166 ) ) ( not ( = ?auto_200164 ?auto_200168 ) ) ( not ( = ?auto_200164 ?auto_200167 ) ) ( not ( = ?auto_200164 ?auto_200169 ) ) ( not ( = ?auto_200164 ?auto_200170 ) ) ( not ( = ?auto_200164 ?auto_200171 ) ) ( not ( = ?auto_200164 ?auto_200172 ) ) ( not ( = ?auto_200164 ?auto_200173 ) ) ( not ( = ?auto_200165 ?auto_200166 ) ) ( not ( = ?auto_200165 ?auto_200168 ) ) ( not ( = ?auto_200165 ?auto_200167 ) ) ( not ( = ?auto_200165 ?auto_200169 ) ) ( not ( = ?auto_200165 ?auto_200170 ) ) ( not ( = ?auto_200165 ?auto_200171 ) ) ( not ( = ?auto_200165 ?auto_200172 ) ) ( not ( = ?auto_200165 ?auto_200173 ) ) ( not ( = ?auto_200166 ?auto_200168 ) ) ( not ( = ?auto_200166 ?auto_200167 ) ) ( not ( = ?auto_200166 ?auto_200169 ) ) ( not ( = ?auto_200166 ?auto_200170 ) ) ( not ( = ?auto_200166 ?auto_200171 ) ) ( not ( = ?auto_200166 ?auto_200172 ) ) ( not ( = ?auto_200166 ?auto_200173 ) ) ( not ( = ?auto_200168 ?auto_200167 ) ) ( not ( = ?auto_200168 ?auto_200169 ) ) ( not ( = ?auto_200168 ?auto_200170 ) ) ( not ( = ?auto_200168 ?auto_200171 ) ) ( not ( = ?auto_200168 ?auto_200172 ) ) ( not ( = ?auto_200168 ?auto_200173 ) ) ( not ( = ?auto_200167 ?auto_200169 ) ) ( not ( = ?auto_200167 ?auto_200170 ) ) ( not ( = ?auto_200167 ?auto_200171 ) ) ( not ( = ?auto_200167 ?auto_200172 ) ) ( not ( = ?auto_200167 ?auto_200173 ) ) ( not ( = ?auto_200169 ?auto_200170 ) ) ( not ( = ?auto_200169 ?auto_200171 ) ) ( not ( = ?auto_200169 ?auto_200172 ) ) ( not ( = ?auto_200169 ?auto_200173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200170 ?auto_200171 ?auto_200172 )
      ( MAKE-8CRATE-VERIFY ?auto_200164 ?auto_200165 ?auto_200166 ?auto_200168 ?auto_200167 ?auto_200169 ?auto_200170 ?auto_200171 ?auto_200172 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200179 - SURFACE
      ?auto_200180 - SURFACE
      ?auto_200181 - SURFACE
      ?auto_200183 - SURFACE
      ?auto_200182 - SURFACE
      ?auto_200184 - SURFACE
      ?auto_200185 - SURFACE
      ?auto_200186 - SURFACE
      ?auto_200187 - SURFACE
      ?auto_200188 - SURFACE
    )
    :vars
    (
      ?auto_200191 - HOIST
      ?auto_200194 - PLACE
      ?auto_200193 - PLACE
      ?auto_200190 - HOIST
      ?auto_200189 - SURFACE
      ?auto_200192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200191 ?auto_200194 ) ( IS-CRATE ?auto_200188 ) ( not ( = ?auto_200187 ?auto_200188 ) ) ( not ( = ?auto_200186 ?auto_200187 ) ) ( not ( = ?auto_200186 ?auto_200188 ) ) ( not ( = ?auto_200193 ?auto_200194 ) ) ( HOIST-AT ?auto_200190 ?auto_200193 ) ( not ( = ?auto_200191 ?auto_200190 ) ) ( AVAILABLE ?auto_200190 ) ( SURFACE-AT ?auto_200188 ?auto_200193 ) ( ON ?auto_200188 ?auto_200189 ) ( CLEAR ?auto_200188 ) ( not ( = ?auto_200187 ?auto_200189 ) ) ( not ( = ?auto_200188 ?auto_200189 ) ) ( not ( = ?auto_200186 ?auto_200189 ) ) ( SURFACE-AT ?auto_200186 ?auto_200194 ) ( CLEAR ?auto_200186 ) ( IS-CRATE ?auto_200187 ) ( AVAILABLE ?auto_200191 ) ( IN ?auto_200187 ?auto_200192 ) ( TRUCK-AT ?auto_200192 ?auto_200193 ) ( ON ?auto_200180 ?auto_200179 ) ( ON ?auto_200181 ?auto_200180 ) ( ON ?auto_200183 ?auto_200181 ) ( ON ?auto_200182 ?auto_200183 ) ( ON ?auto_200184 ?auto_200182 ) ( ON ?auto_200185 ?auto_200184 ) ( ON ?auto_200186 ?auto_200185 ) ( not ( = ?auto_200179 ?auto_200180 ) ) ( not ( = ?auto_200179 ?auto_200181 ) ) ( not ( = ?auto_200179 ?auto_200183 ) ) ( not ( = ?auto_200179 ?auto_200182 ) ) ( not ( = ?auto_200179 ?auto_200184 ) ) ( not ( = ?auto_200179 ?auto_200185 ) ) ( not ( = ?auto_200179 ?auto_200186 ) ) ( not ( = ?auto_200179 ?auto_200187 ) ) ( not ( = ?auto_200179 ?auto_200188 ) ) ( not ( = ?auto_200179 ?auto_200189 ) ) ( not ( = ?auto_200180 ?auto_200181 ) ) ( not ( = ?auto_200180 ?auto_200183 ) ) ( not ( = ?auto_200180 ?auto_200182 ) ) ( not ( = ?auto_200180 ?auto_200184 ) ) ( not ( = ?auto_200180 ?auto_200185 ) ) ( not ( = ?auto_200180 ?auto_200186 ) ) ( not ( = ?auto_200180 ?auto_200187 ) ) ( not ( = ?auto_200180 ?auto_200188 ) ) ( not ( = ?auto_200180 ?auto_200189 ) ) ( not ( = ?auto_200181 ?auto_200183 ) ) ( not ( = ?auto_200181 ?auto_200182 ) ) ( not ( = ?auto_200181 ?auto_200184 ) ) ( not ( = ?auto_200181 ?auto_200185 ) ) ( not ( = ?auto_200181 ?auto_200186 ) ) ( not ( = ?auto_200181 ?auto_200187 ) ) ( not ( = ?auto_200181 ?auto_200188 ) ) ( not ( = ?auto_200181 ?auto_200189 ) ) ( not ( = ?auto_200183 ?auto_200182 ) ) ( not ( = ?auto_200183 ?auto_200184 ) ) ( not ( = ?auto_200183 ?auto_200185 ) ) ( not ( = ?auto_200183 ?auto_200186 ) ) ( not ( = ?auto_200183 ?auto_200187 ) ) ( not ( = ?auto_200183 ?auto_200188 ) ) ( not ( = ?auto_200183 ?auto_200189 ) ) ( not ( = ?auto_200182 ?auto_200184 ) ) ( not ( = ?auto_200182 ?auto_200185 ) ) ( not ( = ?auto_200182 ?auto_200186 ) ) ( not ( = ?auto_200182 ?auto_200187 ) ) ( not ( = ?auto_200182 ?auto_200188 ) ) ( not ( = ?auto_200182 ?auto_200189 ) ) ( not ( = ?auto_200184 ?auto_200185 ) ) ( not ( = ?auto_200184 ?auto_200186 ) ) ( not ( = ?auto_200184 ?auto_200187 ) ) ( not ( = ?auto_200184 ?auto_200188 ) ) ( not ( = ?auto_200184 ?auto_200189 ) ) ( not ( = ?auto_200185 ?auto_200186 ) ) ( not ( = ?auto_200185 ?auto_200187 ) ) ( not ( = ?auto_200185 ?auto_200188 ) ) ( not ( = ?auto_200185 ?auto_200189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200186 ?auto_200187 ?auto_200188 )
      ( MAKE-9CRATE-VERIFY ?auto_200179 ?auto_200180 ?auto_200181 ?auto_200183 ?auto_200182 ?auto_200184 ?auto_200185 ?auto_200186 ?auto_200187 ?auto_200188 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_200259 - SURFACE
      ?auto_200260 - SURFACE
      ?auto_200261 - SURFACE
      ?auto_200263 - SURFACE
      ?auto_200262 - SURFACE
      ?auto_200264 - SURFACE
      ?auto_200265 - SURFACE
      ?auto_200266 - SURFACE
    )
    :vars
    (
      ?auto_200267 - HOIST
      ?auto_200272 - PLACE
      ?auto_200270 - PLACE
      ?auto_200268 - HOIST
      ?auto_200269 - SURFACE
      ?auto_200271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200267 ?auto_200272 ) ( IS-CRATE ?auto_200266 ) ( not ( = ?auto_200265 ?auto_200266 ) ) ( not ( = ?auto_200264 ?auto_200265 ) ) ( not ( = ?auto_200264 ?auto_200266 ) ) ( not ( = ?auto_200270 ?auto_200272 ) ) ( HOIST-AT ?auto_200268 ?auto_200270 ) ( not ( = ?auto_200267 ?auto_200268 ) ) ( SURFACE-AT ?auto_200266 ?auto_200270 ) ( ON ?auto_200266 ?auto_200269 ) ( CLEAR ?auto_200266 ) ( not ( = ?auto_200265 ?auto_200269 ) ) ( not ( = ?auto_200266 ?auto_200269 ) ) ( not ( = ?auto_200264 ?auto_200269 ) ) ( SURFACE-AT ?auto_200264 ?auto_200272 ) ( CLEAR ?auto_200264 ) ( IS-CRATE ?auto_200265 ) ( AVAILABLE ?auto_200267 ) ( TRUCK-AT ?auto_200271 ?auto_200270 ) ( LIFTING ?auto_200268 ?auto_200265 ) ( ON ?auto_200260 ?auto_200259 ) ( ON ?auto_200261 ?auto_200260 ) ( ON ?auto_200263 ?auto_200261 ) ( ON ?auto_200262 ?auto_200263 ) ( ON ?auto_200264 ?auto_200262 ) ( not ( = ?auto_200259 ?auto_200260 ) ) ( not ( = ?auto_200259 ?auto_200261 ) ) ( not ( = ?auto_200259 ?auto_200263 ) ) ( not ( = ?auto_200259 ?auto_200262 ) ) ( not ( = ?auto_200259 ?auto_200264 ) ) ( not ( = ?auto_200259 ?auto_200265 ) ) ( not ( = ?auto_200259 ?auto_200266 ) ) ( not ( = ?auto_200259 ?auto_200269 ) ) ( not ( = ?auto_200260 ?auto_200261 ) ) ( not ( = ?auto_200260 ?auto_200263 ) ) ( not ( = ?auto_200260 ?auto_200262 ) ) ( not ( = ?auto_200260 ?auto_200264 ) ) ( not ( = ?auto_200260 ?auto_200265 ) ) ( not ( = ?auto_200260 ?auto_200266 ) ) ( not ( = ?auto_200260 ?auto_200269 ) ) ( not ( = ?auto_200261 ?auto_200263 ) ) ( not ( = ?auto_200261 ?auto_200262 ) ) ( not ( = ?auto_200261 ?auto_200264 ) ) ( not ( = ?auto_200261 ?auto_200265 ) ) ( not ( = ?auto_200261 ?auto_200266 ) ) ( not ( = ?auto_200261 ?auto_200269 ) ) ( not ( = ?auto_200263 ?auto_200262 ) ) ( not ( = ?auto_200263 ?auto_200264 ) ) ( not ( = ?auto_200263 ?auto_200265 ) ) ( not ( = ?auto_200263 ?auto_200266 ) ) ( not ( = ?auto_200263 ?auto_200269 ) ) ( not ( = ?auto_200262 ?auto_200264 ) ) ( not ( = ?auto_200262 ?auto_200265 ) ) ( not ( = ?auto_200262 ?auto_200266 ) ) ( not ( = ?auto_200262 ?auto_200269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200264 ?auto_200265 ?auto_200266 )
      ( MAKE-7CRATE-VERIFY ?auto_200259 ?auto_200260 ?auto_200261 ?auto_200263 ?auto_200262 ?auto_200264 ?auto_200265 ?auto_200266 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_200273 - SURFACE
      ?auto_200274 - SURFACE
      ?auto_200275 - SURFACE
      ?auto_200277 - SURFACE
      ?auto_200276 - SURFACE
      ?auto_200278 - SURFACE
      ?auto_200279 - SURFACE
      ?auto_200280 - SURFACE
      ?auto_200281 - SURFACE
    )
    :vars
    (
      ?auto_200282 - HOIST
      ?auto_200287 - PLACE
      ?auto_200285 - PLACE
      ?auto_200283 - HOIST
      ?auto_200284 - SURFACE
      ?auto_200286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200282 ?auto_200287 ) ( IS-CRATE ?auto_200281 ) ( not ( = ?auto_200280 ?auto_200281 ) ) ( not ( = ?auto_200279 ?auto_200280 ) ) ( not ( = ?auto_200279 ?auto_200281 ) ) ( not ( = ?auto_200285 ?auto_200287 ) ) ( HOIST-AT ?auto_200283 ?auto_200285 ) ( not ( = ?auto_200282 ?auto_200283 ) ) ( SURFACE-AT ?auto_200281 ?auto_200285 ) ( ON ?auto_200281 ?auto_200284 ) ( CLEAR ?auto_200281 ) ( not ( = ?auto_200280 ?auto_200284 ) ) ( not ( = ?auto_200281 ?auto_200284 ) ) ( not ( = ?auto_200279 ?auto_200284 ) ) ( SURFACE-AT ?auto_200279 ?auto_200287 ) ( CLEAR ?auto_200279 ) ( IS-CRATE ?auto_200280 ) ( AVAILABLE ?auto_200282 ) ( TRUCK-AT ?auto_200286 ?auto_200285 ) ( LIFTING ?auto_200283 ?auto_200280 ) ( ON ?auto_200274 ?auto_200273 ) ( ON ?auto_200275 ?auto_200274 ) ( ON ?auto_200277 ?auto_200275 ) ( ON ?auto_200276 ?auto_200277 ) ( ON ?auto_200278 ?auto_200276 ) ( ON ?auto_200279 ?auto_200278 ) ( not ( = ?auto_200273 ?auto_200274 ) ) ( not ( = ?auto_200273 ?auto_200275 ) ) ( not ( = ?auto_200273 ?auto_200277 ) ) ( not ( = ?auto_200273 ?auto_200276 ) ) ( not ( = ?auto_200273 ?auto_200278 ) ) ( not ( = ?auto_200273 ?auto_200279 ) ) ( not ( = ?auto_200273 ?auto_200280 ) ) ( not ( = ?auto_200273 ?auto_200281 ) ) ( not ( = ?auto_200273 ?auto_200284 ) ) ( not ( = ?auto_200274 ?auto_200275 ) ) ( not ( = ?auto_200274 ?auto_200277 ) ) ( not ( = ?auto_200274 ?auto_200276 ) ) ( not ( = ?auto_200274 ?auto_200278 ) ) ( not ( = ?auto_200274 ?auto_200279 ) ) ( not ( = ?auto_200274 ?auto_200280 ) ) ( not ( = ?auto_200274 ?auto_200281 ) ) ( not ( = ?auto_200274 ?auto_200284 ) ) ( not ( = ?auto_200275 ?auto_200277 ) ) ( not ( = ?auto_200275 ?auto_200276 ) ) ( not ( = ?auto_200275 ?auto_200278 ) ) ( not ( = ?auto_200275 ?auto_200279 ) ) ( not ( = ?auto_200275 ?auto_200280 ) ) ( not ( = ?auto_200275 ?auto_200281 ) ) ( not ( = ?auto_200275 ?auto_200284 ) ) ( not ( = ?auto_200277 ?auto_200276 ) ) ( not ( = ?auto_200277 ?auto_200278 ) ) ( not ( = ?auto_200277 ?auto_200279 ) ) ( not ( = ?auto_200277 ?auto_200280 ) ) ( not ( = ?auto_200277 ?auto_200281 ) ) ( not ( = ?auto_200277 ?auto_200284 ) ) ( not ( = ?auto_200276 ?auto_200278 ) ) ( not ( = ?auto_200276 ?auto_200279 ) ) ( not ( = ?auto_200276 ?auto_200280 ) ) ( not ( = ?auto_200276 ?auto_200281 ) ) ( not ( = ?auto_200276 ?auto_200284 ) ) ( not ( = ?auto_200278 ?auto_200279 ) ) ( not ( = ?auto_200278 ?auto_200280 ) ) ( not ( = ?auto_200278 ?auto_200281 ) ) ( not ( = ?auto_200278 ?auto_200284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200279 ?auto_200280 ?auto_200281 )
      ( MAKE-8CRATE-VERIFY ?auto_200273 ?auto_200274 ?auto_200275 ?auto_200277 ?auto_200276 ?auto_200278 ?auto_200279 ?auto_200280 ?auto_200281 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200288 - SURFACE
      ?auto_200289 - SURFACE
      ?auto_200290 - SURFACE
      ?auto_200292 - SURFACE
      ?auto_200291 - SURFACE
      ?auto_200293 - SURFACE
      ?auto_200294 - SURFACE
      ?auto_200295 - SURFACE
      ?auto_200296 - SURFACE
      ?auto_200297 - SURFACE
    )
    :vars
    (
      ?auto_200298 - HOIST
      ?auto_200303 - PLACE
      ?auto_200301 - PLACE
      ?auto_200299 - HOIST
      ?auto_200300 - SURFACE
      ?auto_200302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200298 ?auto_200303 ) ( IS-CRATE ?auto_200297 ) ( not ( = ?auto_200296 ?auto_200297 ) ) ( not ( = ?auto_200295 ?auto_200296 ) ) ( not ( = ?auto_200295 ?auto_200297 ) ) ( not ( = ?auto_200301 ?auto_200303 ) ) ( HOIST-AT ?auto_200299 ?auto_200301 ) ( not ( = ?auto_200298 ?auto_200299 ) ) ( SURFACE-AT ?auto_200297 ?auto_200301 ) ( ON ?auto_200297 ?auto_200300 ) ( CLEAR ?auto_200297 ) ( not ( = ?auto_200296 ?auto_200300 ) ) ( not ( = ?auto_200297 ?auto_200300 ) ) ( not ( = ?auto_200295 ?auto_200300 ) ) ( SURFACE-AT ?auto_200295 ?auto_200303 ) ( CLEAR ?auto_200295 ) ( IS-CRATE ?auto_200296 ) ( AVAILABLE ?auto_200298 ) ( TRUCK-AT ?auto_200302 ?auto_200301 ) ( LIFTING ?auto_200299 ?auto_200296 ) ( ON ?auto_200289 ?auto_200288 ) ( ON ?auto_200290 ?auto_200289 ) ( ON ?auto_200292 ?auto_200290 ) ( ON ?auto_200291 ?auto_200292 ) ( ON ?auto_200293 ?auto_200291 ) ( ON ?auto_200294 ?auto_200293 ) ( ON ?auto_200295 ?auto_200294 ) ( not ( = ?auto_200288 ?auto_200289 ) ) ( not ( = ?auto_200288 ?auto_200290 ) ) ( not ( = ?auto_200288 ?auto_200292 ) ) ( not ( = ?auto_200288 ?auto_200291 ) ) ( not ( = ?auto_200288 ?auto_200293 ) ) ( not ( = ?auto_200288 ?auto_200294 ) ) ( not ( = ?auto_200288 ?auto_200295 ) ) ( not ( = ?auto_200288 ?auto_200296 ) ) ( not ( = ?auto_200288 ?auto_200297 ) ) ( not ( = ?auto_200288 ?auto_200300 ) ) ( not ( = ?auto_200289 ?auto_200290 ) ) ( not ( = ?auto_200289 ?auto_200292 ) ) ( not ( = ?auto_200289 ?auto_200291 ) ) ( not ( = ?auto_200289 ?auto_200293 ) ) ( not ( = ?auto_200289 ?auto_200294 ) ) ( not ( = ?auto_200289 ?auto_200295 ) ) ( not ( = ?auto_200289 ?auto_200296 ) ) ( not ( = ?auto_200289 ?auto_200297 ) ) ( not ( = ?auto_200289 ?auto_200300 ) ) ( not ( = ?auto_200290 ?auto_200292 ) ) ( not ( = ?auto_200290 ?auto_200291 ) ) ( not ( = ?auto_200290 ?auto_200293 ) ) ( not ( = ?auto_200290 ?auto_200294 ) ) ( not ( = ?auto_200290 ?auto_200295 ) ) ( not ( = ?auto_200290 ?auto_200296 ) ) ( not ( = ?auto_200290 ?auto_200297 ) ) ( not ( = ?auto_200290 ?auto_200300 ) ) ( not ( = ?auto_200292 ?auto_200291 ) ) ( not ( = ?auto_200292 ?auto_200293 ) ) ( not ( = ?auto_200292 ?auto_200294 ) ) ( not ( = ?auto_200292 ?auto_200295 ) ) ( not ( = ?auto_200292 ?auto_200296 ) ) ( not ( = ?auto_200292 ?auto_200297 ) ) ( not ( = ?auto_200292 ?auto_200300 ) ) ( not ( = ?auto_200291 ?auto_200293 ) ) ( not ( = ?auto_200291 ?auto_200294 ) ) ( not ( = ?auto_200291 ?auto_200295 ) ) ( not ( = ?auto_200291 ?auto_200296 ) ) ( not ( = ?auto_200291 ?auto_200297 ) ) ( not ( = ?auto_200291 ?auto_200300 ) ) ( not ( = ?auto_200293 ?auto_200294 ) ) ( not ( = ?auto_200293 ?auto_200295 ) ) ( not ( = ?auto_200293 ?auto_200296 ) ) ( not ( = ?auto_200293 ?auto_200297 ) ) ( not ( = ?auto_200293 ?auto_200300 ) ) ( not ( = ?auto_200294 ?auto_200295 ) ) ( not ( = ?auto_200294 ?auto_200296 ) ) ( not ( = ?auto_200294 ?auto_200297 ) ) ( not ( = ?auto_200294 ?auto_200300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200295 ?auto_200296 ?auto_200297 )
      ( MAKE-9CRATE-VERIFY ?auto_200288 ?auto_200289 ?auto_200290 ?auto_200292 ?auto_200291 ?auto_200293 ?auto_200294 ?auto_200295 ?auto_200296 ?auto_200297 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_200374 - SURFACE
      ?auto_200375 - SURFACE
      ?auto_200376 - SURFACE
      ?auto_200378 - SURFACE
      ?auto_200377 - SURFACE
      ?auto_200379 - SURFACE
      ?auto_200380 - SURFACE
      ?auto_200381 - SURFACE
    )
    :vars
    (
      ?auto_200382 - HOIST
      ?auto_200387 - PLACE
      ?auto_200383 - PLACE
      ?auto_200386 - HOIST
      ?auto_200385 - SURFACE
      ?auto_200384 - TRUCK
      ?auto_200388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_200382 ?auto_200387 ) ( IS-CRATE ?auto_200381 ) ( not ( = ?auto_200380 ?auto_200381 ) ) ( not ( = ?auto_200379 ?auto_200380 ) ) ( not ( = ?auto_200379 ?auto_200381 ) ) ( not ( = ?auto_200383 ?auto_200387 ) ) ( HOIST-AT ?auto_200386 ?auto_200383 ) ( not ( = ?auto_200382 ?auto_200386 ) ) ( SURFACE-AT ?auto_200381 ?auto_200383 ) ( ON ?auto_200381 ?auto_200385 ) ( CLEAR ?auto_200381 ) ( not ( = ?auto_200380 ?auto_200385 ) ) ( not ( = ?auto_200381 ?auto_200385 ) ) ( not ( = ?auto_200379 ?auto_200385 ) ) ( SURFACE-AT ?auto_200379 ?auto_200387 ) ( CLEAR ?auto_200379 ) ( IS-CRATE ?auto_200380 ) ( AVAILABLE ?auto_200382 ) ( TRUCK-AT ?auto_200384 ?auto_200383 ) ( AVAILABLE ?auto_200386 ) ( SURFACE-AT ?auto_200380 ?auto_200383 ) ( ON ?auto_200380 ?auto_200388 ) ( CLEAR ?auto_200380 ) ( not ( = ?auto_200380 ?auto_200388 ) ) ( not ( = ?auto_200381 ?auto_200388 ) ) ( not ( = ?auto_200379 ?auto_200388 ) ) ( not ( = ?auto_200385 ?auto_200388 ) ) ( ON ?auto_200375 ?auto_200374 ) ( ON ?auto_200376 ?auto_200375 ) ( ON ?auto_200378 ?auto_200376 ) ( ON ?auto_200377 ?auto_200378 ) ( ON ?auto_200379 ?auto_200377 ) ( not ( = ?auto_200374 ?auto_200375 ) ) ( not ( = ?auto_200374 ?auto_200376 ) ) ( not ( = ?auto_200374 ?auto_200378 ) ) ( not ( = ?auto_200374 ?auto_200377 ) ) ( not ( = ?auto_200374 ?auto_200379 ) ) ( not ( = ?auto_200374 ?auto_200380 ) ) ( not ( = ?auto_200374 ?auto_200381 ) ) ( not ( = ?auto_200374 ?auto_200385 ) ) ( not ( = ?auto_200374 ?auto_200388 ) ) ( not ( = ?auto_200375 ?auto_200376 ) ) ( not ( = ?auto_200375 ?auto_200378 ) ) ( not ( = ?auto_200375 ?auto_200377 ) ) ( not ( = ?auto_200375 ?auto_200379 ) ) ( not ( = ?auto_200375 ?auto_200380 ) ) ( not ( = ?auto_200375 ?auto_200381 ) ) ( not ( = ?auto_200375 ?auto_200385 ) ) ( not ( = ?auto_200375 ?auto_200388 ) ) ( not ( = ?auto_200376 ?auto_200378 ) ) ( not ( = ?auto_200376 ?auto_200377 ) ) ( not ( = ?auto_200376 ?auto_200379 ) ) ( not ( = ?auto_200376 ?auto_200380 ) ) ( not ( = ?auto_200376 ?auto_200381 ) ) ( not ( = ?auto_200376 ?auto_200385 ) ) ( not ( = ?auto_200376 ?auto_200388 ) ) ( not ( = ?auto_200378 ?auto_200377 ) ) ( not ( = ?auto_200378 ?auto_200379 ) ) ( not ( = ?auto_200378 ?auto_200380 ) ) ( not ( = ?auto_200378 ?auto_200381 ) ) ( not ( = ?auto_200378 ?auto_200385 ) ) ( not ( = ?auto_200378 ?auto_200388 ) ) ( not ( = ?auto_200377 ?auto_200379 ) ) ( not ( = ?auto_200377 ?auto_200380 ) ) ( not ( = ?auto_200377 ?auto_200381 ) ) ( not ( = ?auto_200377 ?auto_200385 ) ) ( not ( = ?auto_200377 ?auto_200388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200379 ?auto_200380 ?auto_200381 )
      ( MAKE-7CRATE-VERIFY ?auto_200374 ?auto_200375 ?auto_200376 ?auto_200378 ?auto_200377 ?auto_200379 ?auto_200380 ?auto_200381 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_200389 - SURFACE
      ?auto_200390 - SURFACE
      ?auto_200391 - SURFACE
      ?auto_200393 - SURFACE
      ?auto_200392 - SURFACE
      ?auto_200394 - SURFACE
      ?auto_200395 - SURFACE
      ?auto_200396 - SURFACE
      ?auto_200397 - SURFACE
    )
    :vars
    (
      ?auto_200398 - HOIST
      ?auto_200403 - PLACE
      ?auto_200399 - PLACE
      ?auto_200402 - HOIST
      ?auto_200401 - SURFACE
      ?auto_200400 - TRUCK
      ?auto_200404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_200398 ?auto_200403 ) ( IS-CRATE ?auto_200397 ) ( not ( = ?auto_200396 ?auto_200397 ) ) ( not ( = ?auto_200395 ?auto_200396 ) ) ( not ( = ?auto_200395 ?auto_200397 ) ) ( not ( = ?auto_200399 ?auto_200403 ) ) ( HOIST-AT ?auto_200402 ?auto_200399 ) ( not ( = ?auto_200398 ?auto_200402 ) ) ( SURFACE-AT ?auto_200397 ?auto_200399 ) ( ON ?auto_200397 ?auto_200401 ) ( CLEAR ?auto_200397 ) ( not ( = ?auto_200396 ?auto_200401 ) ) ( not ( = ?auto_200397 ?auto_200401 ) ) ( not ( = ?auto_200395 ?auto_200401 ) ) ( SURFACE-AT ?auto_200395 ?auto_200403 ) ( CLEAR ?auto_200395 ) ( IS-CRATE ?auto_200396 ) ( AVAILABLE ?auto_200398 ) ( TRUCK-AT ?auto_200400 ?auto_200399 ) ( AVAILABLE ?auto_200402 ) ( SURFACE-AT ?auto_200396 ?auto_200399 ) ( ON ?auto_200396 ?auto_200404 ) ( CLEAR ?auto_200396 ) ( not ( = ?auto_200396 ?auto_200404 ) ) ( not ( = ?auto_200397 ?auto_200404 ) ) ( not ( = ?auto_200395 ?auto_200404 ) ) ( not ( = ?auto_200401 ?auto_200404 ) ) ( ON ?auto_200390 ?auto_200389 ) ( ON ?auto_200391 ?auto_200390 ) ( ON ?auto_200393 ?auto_200391 ) ( ON ?auto_200392 ?auto_200393 ) ( ON ?auto_200394 ?auto_200392 ) ( ON ?auto_200395 ?auto_200394 ) ( not ( = ?auto_200389 ?auto_200390 ) ) ( not ( = ?auto_200389 ?auto_200391 ) ) ( not ( = ?auto_200389 ?auto_200393 ) ) ( not ( = ?auto_200389 ?auto_200392 ) ) ( not ( = ?auto_200389 ?auto_200394 ) ) ( not ( = ?auto_200389 ?auto_200395 ) ) ( not ( = ?auto_200389 ?auto_200396 ) ) ( not ( = ?auto_200389 ?auto_200397 ) ) ( not ( = ?auto_200389 ?auto_200401 ) ) ( not ( = ?auto_200389 ?auto_200404 ) ) ( not ( = ?auto_200390 ?auto_200391 ) ) ( not ( = ?auto_200390 ?auto_200393 ) ) ( not ( = ?auto_200390 ?auto_200392 ) ) ( not ( = ?auto_200390 ?auto_200394 ) ) ( not ( = ?auto_200390 ?auto_200395 ) ) ( not ( = ?auto_200390 ?auto_200396 ) ) ( not ( = ?auto_200390 ?auto_200397 ) ) ( not ( = ?auto_200390 ?auto_200401 ) ) ( not ( = ?auto_200390 ?auto_200404 ) ) ( not ( = ?auto_200391 ?auto_200393 ) ) ( not ( = ?auto_200391 ?auto_200392 ) ) ( not ( = ?auto_200391 ?auto_200394 ) ) ( not ( = ?auto_200391 ?auto_200395 ) ) ( not ( = ?auto_200391 ?auto_200396 ) ) ( not ( = ?auto_200391 ?auto_200397 ) ) ( not ( = ?auto_200391 ?auto_200401 ) ) ( not ( = ?auto_200391 ?auto_200404 ) ) ( not ( = ?auto_200393 ?auto_200392 ) ) ( not ( = ?auto_200393 ?auto_200394 ) ) ( not ( = ?auto_200393 ?auto_200395 ) ) ( not ( = ?auto_200393 ?auto_200396 ) ) ( not ( = ?auto_200393 ?auto_200397 ) ) ( not ( = ?auto_200393 ?auto_200401 ) ) ( not ( = ?auto_200393 ?auto_200404 ) ) ( not ( = ?auto_200392 ?auto_200394 ) ) ( not ( = ?auto_200392 ?auto_200395 ) ) ( not ( = ?auto_200392 ?auto_200396 ) ) ( not ( = ?auto_200392 ?auto_200397 ) ) ( not ( = ?auto_200392 ?auto_200401 ) ) ( not ( = ?auto_200392 ?auto_200404 ) ) ( not ( = ?auto_200394 ?auto_200395 ) ) ( not ( = ?auto_200394 ?auto_200396 ) ) ( not ( = ?auto_200394 ?auto_200397 ) ) ( not ( = ?auto_200394 ?auto_200401 ) ) ( not ( = ?auto_200394 ?auto_200404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200395 ?auto_200396 ?auto_200397 )
      ( MAKE-8CRATE-VERIFY ?auto_200389 ?auto_200390 ?auto_200391 ?auto_200393 ?auto_200392 ?auto_200394 ?auto_200395 ?auto_200396 ?auto_200397 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200405 - SURFACE
      ?auto_200406 - SURFACE
      ?auto_200407 - SURFACE
      ?auto_200409 - SURFACE
      ?auto_200408 - SURFACE
      ?auto_200410 - SURFACE
      ?auto_200411 - SURFACE
      ?auto_200412 - SURFACE
      ?auto_200413 - SURFACE
      ?auto_200414 - SURFACE
    )
    :vars
    (
      ?auto_200415 - HOIST
      ?auto_200420 - PLACE
      ?auto_200416 - PLACE
      ?auto_200419 - HOIST
      ?auto_200418 - SURFACE
      ?auto_200417 - TRUCK
      ?auto_200421 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_200415 ?auto_200420 ) ( IS-CRATE ?auto_200414 ) ( not ( = ?auto_200413 ?auto_200414 ) ) ( not ( = ?auto_200412 ?auto_200413 ) ) ( not ( = ?auto_200412 ?auto_200414 ) ) ( not ( = ?auto_200416 ?auto_200420 ) ) ( HOIST-AT ?auto_200419 ?auto_200416 ) ( not ( = ?auto_200415 ?auto_200419 ) ) ( SURFACE-AT ?auto_200414 ?auto_200416 ) ( ON ?auto_200414 ?auto_200418 ) ( CLEAR ?auto_200414 ) ( not ( = ?auto_200413 ?auto_200418 ) ) ( not ( = ?auto_200414 ?auto_200418 ) ) ( not ( = ?auto_200412 ?auto_200418 ) ) ( SURFACE-AT ?auto_200412 ?auto_200420 ) ( CLEAR ?auto_200412 ) ( IS-CRATE ?auto_200413 ) ( AVAILABLE ?auto_200415 ) ( TRUCK-AT ?auto_200417 ?auto_200416 ) ( AVAILABLE ?auto_200419 ) ( SURFACE-AT ?auto_200413 ?auto_200416 ) ( ON ?auto_200413 ?auto_200421 ) ( CLEAR ?auto_200413 ) ( not ( = ?auto_200413 ?auto_200421 ) ) ( not ( = ?auto_200414 ?auto_200421 ) ) ( not ( = ?auto_200412 ?auto_200421 ) ) ( not ( = ?auto_200418 ?auto_200421 ) ) ( ON ?auto_200406 ?auto_200405 ) ( ON ?auto_200407 ?auto_200406 ) ( ON ?auto_200409 ?auto_200407 ) ( ON ?auto_200408 ?auto_200409 ) ( ON ?auto_200410 ?auto_200408 ) ( ON ?auto_200411 ?auto_200410 ) ( ON ?auto_200412 ?auto_200411 ) ( not ( = ?auto_200405 ?auto_200406 ) ) ( not ( = ?auto_200405 ?auto_200407 ) ) ( not ( = ?auto_200405 ?auto_200409 ) ) ( not ( = ?auto_200405 ?auto_200408 ) ) ( not ( = ?auto_200405 ?auto_200410 ) ) ( not ( = ?auto_200405 ?auto_200411 ) ) ( not ( = ?auto_200405 ?auto_200412 ) ) ( not ( = ?auto_200405 ?auto_200413 ) ) ( not ( = ?auto_200405 ?auto_200414 ) ) ( not ( = ?auto_200405 ?auto_200418 ) ) ( not ( = ?auto_200405 ?auto_200421 ) ) ( not ( = ?auto_200406 ?auto_200407 ) ) ( not ( = ?auto_200406 ?auto_200409 ) ) ( not ( = ?auto_200406 ?auto_200408 ) ) ( not ( = ?auto_200406 ?auto_200410 ) ) ( not ( = ?auto_200406 ?auto_200411 ) ) ( not ( = ?auto_200406 ?auto_200412 ) ) ( not ( = ?auto_200406 ?auto_200413 ) ) ( not ( = ?auto_200406 ?auto_200414 ) ) ( not ( = ?auto_200406 ?auto_200418 ) ) ( not ( = ?auto_200406 ?auto_200421 ) ) ( not ( = ?auto_200407 ?auto_200409 ) ) ( not ( = ?auto_200407 ?auto_200408 ) ) ( not ( = ?auto_200407 ?auto_200410 ) ) ( not ( = ?auto_200407 ?auto_200411 ) ) ( not ( = ?auto_200407 ?auto_200412 ) ) ( not ( = ?auto_200407 ?auto_200413 ) ) ( not ( = ?auto_200407 ?auto_200414 ) ) ( not ( = ?auto_200407 ?auto_200418 ) ) ( not ( = ?auto_200407 ?auto_200421 ) ) ( not ( = ?auto_200409 ?auto_200408 ) ) ( not ( = ?auto_200409 ?auto_200410 ) ) ( not ( = ?auto_200409 ?auto_200411 ) ) ( not ( = ?auto_200409 ?auto_200412 ) ) ( not ( = ?auto_200409 ?auto_200413 ) ) ( not ( = ?auto_200409 ?auto_200414 ) ) ( not ( = ?auto_200409 ?auto_200418 ) ) ( not ( = ?auto_200409 ?auto_200421 ) ) ( not ( = ?auto_200408 ?auto_200410 ) ) ( not ( = ?auto_200408 ?auto_200411 ) ) ( not ( = ?auto_200408 ?auto_200412 ) ) ( not ( = ?auto_200408 ?auto_200413 ) ) ( not ( = ?auto_200408 ?auto_200414 ) ) ( not ( = ?auto_200408 ?auto_200418 ) ) ( not ( = ?auto_200408 ?auto_200421 ) ) ( not ( = ?auto_200410 ?auto_200411 ) ) ( not ( = ?auto_200410 ?auto_200412 ) ) ( not ( = ?auto_200410 ?auto_200413 ) ) ( not ( = ?auto_200410 ?auto_200414 ) ) ( not ( = ?auto_200410 ?auto_200418 ) ) ( not ( = ?auto_200410 ?auto_200421 ) ) ( not ( = ?auto_200411 ?auto_200412 ) ) ( not ( = ?auto_200411 ?auto_200413 ) ) ( not ( = ?auto_200411 ?auto_200414 ) ) ( not ( = ?auto_200411 ?auto_200418 ) ) ( not ( = ?auto_200411 ?auto_200421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200412 ?auto_200413 ?auto_200414 )
      ( MAKE-9CRATE-VERIFY ?auto_200405 ?auto_200406 ?auto_200407 ?auto_200409 ?auto_200408 ?auto_200410 ?auto_200411 ?auto_200412 ?auto_200413 ?auto_200414 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_200492 - SURFACE
      ?auto_200493 - SURFACE
      ?auto_200494 - SURFACE
      ?auto_200496 - SURFACE
      ?auto_200495 - SURFACE
      ?auto_200497 - SURFACE
      ?auto_200498 - SURFACE
      ?auto_200499 - SURFACE
    )
    :vars
    (
      ?auto_200505 - HOIST
      ?auto_200502 - PLACE
      ?auto_200504 - PLACE
      ?auto_200501 - HOIST
      ?auto_200503 - SURFACE
      ?auto_200506 - SURFACE
      ?auto_200500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200505 ?auto_200502 ) ( IS-CRATE ?auto_200499 ) ( not ( = ?auto_200498 ?auto_200499 ) ) ( not ( = ?auto_200497 ?auto_200498 ) ) ( not ( = ?auto_200497 ?auto_200499 ) ) ( not ( = ?auto_200504 ?auto_200502 ) ) ( HOIST-AT ?auto_200501 ?auto_200504 ) ( not ( = ?auto_200505 ?auto_200501 ) ) ( SURFACE-AT ?auto_200499 ?auto_200504 ) ( ON ?auto_200499 ?auto_200503 ) ( CLEAR ?auto_200499 ) ( not ( = ?auto_200498 ?auto_200503 ) ) ( not ( = ?auto_200499 ?auto_200503 ) ) ( not ( = ?auto_200497 ?auto_200503 ) ) ( SURFACE-AT ?auto_200497 ?auto_200502 ) ( CLEAR ?auto_200497 ) ( IS-CRATE ?auto_200498 ) ( AVAILABLE ?auto_200505 ) ( AVAILABLE ?auto_200501 ) ( SURFACE-AT ?auto_200498 ?auto_200504 ) ( ON ?auto_200498 ?auto_200506 ) ( CLEAR ?auto_200498 ) ( not ( = ?auto_200498 ?auto_200506 ) ) ( not ( = ?auto_200499 ?auto_200506 ) ) ( not ( = ?auto_200497 ?auto_200506 ) ) ( not ( = ?auto_200503 ?auto_200506 ) ) ( TRUCK-AT ?auto_200500 ?auto_200502 ) ( ON ?auto_200493 ?auto_200492 ) ( ON ?auto_200494 ?auto_200493 ) ( ON ?auto_200496 ?auto_200494 ) ( ON ?auto_200495 ?auto_200496 ) ( ON ?auto_200497 ?auto_200495 ) ( not ( = ?auto_200492 ?auto_200493 ) ) ( not ( = ?auto_200492 ?auto_200494 ) ) ( not ( = ?auto_200492 ?auto_200496 ) ) ( not ( = ?auto_200492 ?auto_200495 ) ) ( not ( = ?auto_200492 ?auto_200497 ) ) ( not ( = ?auto_200492 ?auto_200498 ) ) ( not ( = ?auto_200492 ?auto_200499 ) ) ( not ( = ?auto_200492 ?auto_200503 ) ) ( not ( = ?auto_200492 ?auto_200506 ) ) ( not ( = ?auto_200493 ?auto_200494 ) ) ( not ( = ?auto_200493 ?auto_200496 ) ) ( not ( = ?auto_200493 ?auto_200495 ) ) ( not ( = ?auto_200493 ?auto_200497 ) ) ( not ( = ?auto_200493 ?auto_200498 ) ) ( not ( = ?auto_200493 ?auto_200499 ) ) ( not ( = ?auto_200493 ?auto_200503 ) ) ( not ( = ?auto_200493 ?auto_200506 ) ) ( not ( = ?auto_200494 ?auto_200496 ) ) ( not ( = ?auto_200494 ?auto_200495 ) ) ( not ( = ?auto_200494 ?auto_200497 ) ) ( not ( = ?auto_200494 ?auto_200498 ) ) ( not ( = ?auto_200494 ?auto_200499 ) ) ( not ( = ?auto_200494 ?auto_200503 ) ) ( not ( = ?auto_200494 ?auto_200506 ) ) ( not ( = ?auto_200496 ?auto_200495 ) ) ( not ( = ?auto_200496 ?auto_200497 ) ) ( not ( = ?auto_200496 ?auto_200498 ) ) ( not ( = ?auto_200496 ?auto_200499 ) ) ( not ( = ?auto_200496 ?auto_200503 ) ) ( not ( = ?auto_200496 ?auto_200506 ) ) ( not ( = ?auto_200495 ?auto_200497 ) ) ( not ( = ?auto_200495 ?auto_200498 ) ) ( not ( = ?auto_200495 ?auto_200499 ) ) ( not ( = ?auto_200495 ?auto_200503 ) ) ( not ( = ?auto_200495 ?auto_200506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200497 ?auto_200498 ?auto_200499 )
      ( MAKE-7CRATE-VERIFY ?auto_200492 ?auto_200493 ?auto_200494 ?auto_200496 ?auto_200495 ?auto_200497 ?auto_200498 ?auto_200499 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_200507 - SURFACE
      ?auto_200508 - SURFACE
      ?auto_200509 - SURFACE
      ?auto_200511 - SURFACE
      ?auto_200510 - SURFACE
      ?auto_200512 - SURFACE
      ?auto_200513 - SURFACE
      ?auto_200514 - SURFACE
      ?auto_200515 - SURFACE
    )
    :vars
    (
      ?auto_200521 - HOIST
      ?auto_200518 - PLACE
      ?auto_200520 - PLACE
      ?auto_200517 - HOIST
      ?auto_200519 - SURFACE
      ?auto_200522 - SURFACE
      ?auto_200516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200521 ?auto_200518 ) ( IS-CRATE ?auto_200515 ) ( not ( = ?auto_200514 ?auto_200515 ) ) ( not ( = ?auto_200513 ?auto_200514 ) ) ( not ( = ?auto_200513 ?auto_200515 ) ) ( not ( = ?auto_200520 ?auto_200518 ) ) ( HOIST-AT ?auto_200517 ?auto_200520 ) ( not ( = ?auto_200521 ?auto_200517 ) ) ( SURFACE-AT ?auto_200515 ?auto_200520 ) ( ON ?auto_200515 ?auto_200519 ) ( CLEAR ?auto_200515 ) ( not ( = ?auto_200514 ?auto_200519 ) ) ( not ( = ?auto_200515 ?auto_200519 ) ) ( not ( = ?auto_200513 ?auto_200519 ) ) ( SURFACE-AT ?auto_200513 ?auto_200518 ) ( CLEAR ?auto_200513 ) ( IS-CRATE ?auto_200514 ) ( AVAILABLE ?auto_200521 ) ( AVAILABLE ?auto_200517 ) ( SURFACE-AT ?auto_200514 ?auto_200520 ) ( ON ?auto_200514 ?auto_200522 ) ( CLEAR ?auto_200514 ) ( not ( = ?auto_200514 ?auto_200522 ) ) ( not ( = ?auto_200515 ?auto_200522 ) ) ( not ( = ?auto_200513 ?auto_200522 ) ) ( not ( = ?auto_200519 ?auto_200522 ) ) ( TRUCK-AT ?auto_200516 ?auto_200518 ) ( ON ?auto_200508 ?auto_200507 ) ( ON ?auto_200509 ?auto_200508 ) ( ON ?auto_200511 ?auto_200509 ) ( ON ?auto_200510 ?auto_200511 ) ( ON ?auto_200512 ?auto_200510 ) ( ON ?auto_200513 ?auto_200512 ) ( not ( = ?auto_200507 ?auto_200508 ) ) ( not ( = ?auto_200507 ?auto_200509 ) ) ( not ( = ?auto_200507 ?auto_200511 ) ) ( not ( = ?auto_200507 ?auto_200510 ) ) ( not ( = ?auto_200507 ?auto_200512 ) ) ( not ( = ?auto_200507 ?auto_200513 ) ) ( not ( = ?auto_200507 ?auto_200514 ) ) ( not ( = ?auto_200507 ?auto_200515 ) ) ( not ( = ?auto_200507 ?auto_200519 ) ) ( not ( = ?auto_200507 ?auto_200522 ) ) ( not ( = ?auto_200508 ?auto_200509 ) ) ( not ( = ?auto_200508 ?auto_200511 ) ) ( not ( = ?auto_200508 ?auto_200510 ) ) ( not ( = ?auto_200508 ?auto_200512 ) ) ( not ( = ?auto_200508 ?auto_200513 ) ) ( not ( = ?auto_200508 ?auto_200514 ) ) ( not ( = ?auto_200508 ?auto_200515 ) ) ( not ( = ?auto_200508 ?auto_200519 ) ) ( not ( = ?auto_200508 ?auto_200522 ) ) ( not ( = ?auto_200509 ?auto_200511 ) ) ( not ( = ?auto_200509 ?auto_200510 ) ) ( not ( = ?auto_200509 ?auto_200512 ) ) ( not ( = ?auto_200509 ?auto_200513 ) ) ( not ( = ?auto_200509 ?auto_200514 ) ) ( not ( = ?auto_200509 ?auto_200515 ) ) ( not ( = ?auto_200509 ?auto_200519 ) ) ( not ( = ?auto_200509 ?auto_200522 ) ) ( not ( = ?auto_200511 ?auto_200510 ) ) ( not ( = ?auto_200511 ?auto_200512 ) ) ( not ( = ?auto_200511 ?auto_200513 ) ) ( not ( = ?auto_200511 ?auto_200514 ) ) ( not ( = ?auto_200511 ?auto_200515 ) ) ( not ( = ?auto_200511 ?auto_200519 ) ) ( not ( = ?auto_200511 ?auto_200522 ) ) ( not ( = ?auto_200510 ?auto_200512 ) ) ( not ( = ?auto_200510 ?auto_200513 ) ) ( not ( = ?auto_200510 ?auto_200514 ) ) ( not ( = ?auto_200510 ?auto_200515 ) ) ( not ( = ?auto_200510 ?auto_200519 ) ) ( not ( = ?auto_200510 ?auto_200522 ) ) ( not ( = ?auto_200512 ?auto_200513 ) ) ( not ( = ?auto_200512 ?auto_200514 ) ) ( not ( = ?auto_200512 ?auto_200515 ) ) ( not ( = ?auto_200512 ?auto_200519 ) ) ( not ( = ?auto_200512 ?auto_200522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200513 ?auto_200514 ?auto_200515 )
      ( MAKE-8CRATE-VERIFY ?auto_200507 ?auto_200508 ?auto_200509 ?auto_200511 ?auto_200510 ?auto_200512 ?auto_200513 ?auto_200514 ?auto_200515 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200523 - SURFACE
      ?auto_200524 - SURFACE
      ?auto_200525 - SURFACE
      ?auto_200527 - SURFACE
      ?auto_200526 - SURFACE
      ?auto_200528 - SURFACE
      ?auto_200529 - SURFACE
      ?auto_200530 - SURFACE
      ?auto_200531 - SURFACE
      ?auto_200532 - SURFACE
    )
    :vars
    (
      ?auto_200538 - HOIST
      ?auto_200535 - PLACE
      ?auto_200537 - PLACE
      ?auto_200534 - HOIST
      ?auto_200536 - SURFACE
      ?auto_200539 - SURFACE
      ?auto_200533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200538 ?auto_200535 ) ( IS-CRATE ?auto_200532 ) ( not ( = ?auto_200531 ?auto_200532 ) ) ( not ( = ?auto_200530 ?auto_200531 ) ) ( not ( = ?auto_200530 ?auto_200532 ) ) ( not ( = ?auto_200537 ?auto_200535 ) ) ( HOIST-AT ?auto_200534 ?auto_200537 ) ( not ( = ?auto_200538 ?auto_200534 ) ) ( SURFACE-AT ?auto_200532 ?auto_200537 ) ( ON ?auto_200532 ?auto_200536 ) ( CLEAR ?auto_200532 ) ( not ( = ?auto_200531 ?auto_200536 ) ) ( not ( = ?auto_200532 ?auto_200536 ) ) ( not ( = ?auto_200530 ?auto_200536 ) ) ( SURFACE-AT ?auto_200530 ?auto_200535 ) ( CLEAR ?auto_200530 ) ( IS-CRATE ?auto_200531 ) ( AVAILABLE ?auto_200538 ) ( AVAILABLE ?auto_200534 ) ( SURFACE-AT ?auto_200531 ?auto_200537 ) ( ON ?auto_200531 ?auto_200539 ) ( CLEAR ?auto_200531 ) ( not ( = ?auto_200531 ?auto_200539 ) ) ( not ( = ?auto_200532 ?auto_200539 ) ) ( not ( = ?auto_200530 ?auto_200539 ) ) ( not ( = ?auto_200536 ?auto_200539 ) ) ( TRUCK-AT ?auto_200533 ?auto_200535 ) ( ON ?auto_200524 ?auto_200523 ) ( ON ?auto_200525 ?auto_200524 ) ( ON ?auto_200527 ?auto_200525 ) ( ON ?auto_200526 ?auto_200527 ) ( ON ?auto_200528 ?auto_200526 ) ( ON ?auto_200529 ?auto_200528 ) ( ON ?auto_200530 ?auto_200529 ) ( not ( = ?auto_200523 ?auto_200524 ) ) ( not ( = ?auto_200523 ?auto_200525 ) ) ( not ( = ?auto_200523 ?auto_200527 ) ) ( not ( = ?auto_200523 ?auto_200526 ) ) ( not ( = ?auto_200523 ?auto_200528 ) ) ( not ( = ?auto_200523 ?auto_200529 ) ) ( not ( = ?auto_200523 ?auto_200530 ) ) ( not ( = ?auto_200523 ?auto_200531 ) ) ( not ( = ?auto_200523 ?auto_200532 ) ) ( not ( = ?auto_200523 ?auto_200536 ) ) ( not ( = ?auto_200523 ?auto_200539 ) ) ( not ( = ?auto_200524 ?auto_200525 ) ) ( not ( = ?auto_200524 ?auto_200527 ) ) ( not ( = ?auto_200524 ?auto_200526 ) ) ( not ( = ?auto_200524 ?auto_200528 ) ) ( not ( = ?auto_200524 ?auto_200529 ) ) ( not ( = ?auto_200524 ?auto_200530 ) ) ( not ( = ?auto_200524 ?auto_200531 ) ) ( not ( = ?auto_200524 ?auto_200532 ) ) ( not ( = ?auto_200524 ?auto_200536 ) ) ( not ( = ?auto_200524 ?auto_200539 ) ) ( not ( = ?auto_200525 ?auto_200527 ) ) ( not ( = ?auto_200525 ?auto_200526 ) ) ( not ( = ?auto_200525 ?auto_200528 ) ) ( not ( = ?auto_200525 ?auto_200529 ) ) ( not ( = ?auto_200525 ?auto_200530 ) ) ( not ( = ?auto_200525 ?auto_200531 ) ) ( not ( = ?auto_200525 ?auto_200532 ) ) ( not ( = ?auto_200525 ?auto_200536 ) ) ( not ( = ?auto_200525 ?auto_200539 ) ) ( not ( = ?auto_200527 ?auto_200526 ) ) ( not ( = ?auto_200527 ?auto_200528 ) ) ( not ( = ?auto_200527 ?auto_200529 ) ) ( not ( = ?auto_200527 ?auto_200530 ) ) ( not ( = ?auto_200527 ?auto_200531 ) ) ( not ( = ?auto_200527 ?auto_200532 ) ) ( not ( = ?auto_200527 ?auto_200536 ) ) ( not ( = ?auto_200527 ?auto_200539 ) ) ( not ( = ?auto_200526 ?auto_200528 ) ) ( not ( = ?auto_200526 ?auto_200529 ) ) ( not ( = ?auto_200526 ?auto_200530 ) ) ( not ( = ?auto_200526 ?auto_200531 ) ) ( not ( = ?auto_200526 ?auto_200532 ) ) ( not ( = ?auto_200526 ?auto_200536 ) ) ( not ( = ?auto_200526 ?auto_200539 ) ) ( not ( = ?auto_200528 ?auto_200529 ) ) ( not ( = ?auto_200528 ?auto_200530 ) ) ( not ( = ?auto_200528 ?auto_200531 ) ) ( not ( = ?auto_200528 ?auto_200532 ) ) ( not ( = ?auto_200528 ?auto_200536 ) ) ( not ( = ?auto_200528 ?auto_200539 ) ) ( not ( = ?auto_200529 ?auto_200530 ) ) ( not ( = ?auto_200529 ?auto_200531 ) ) ( not ( = ?auto_200529 ?auto_200532 ) ) ( not ( = ?auto_200529 ?auto_200536 ) ) ( not ( = ?auto_200529 ?auto_200539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200530 ?auto_200531 ?auto_200532 )
      ( MAKE-9CRATE-VERIFY ?auto_200523 ?auto_200524 ?auto_200525 ?auto_200527 ?auto_200526 ?auto_200528 ?auto_200529 ?auto_200530 ?auto_200531 ?auto_200532 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_200612 - SURFACE
      ?auto_200613 - SURFACE
      ?auto_200614 - SURFACE
      ?auto_200616 - SURFACE
      ?auto_200615 - SURFACE
      ?auto_200617 - SURFACE
      ?auto_200618 - SURFACE
      ?auto_200619 - SURFACE
    )
    :vars
    (
      ?auto_200624 - HOIST
      ?auto_200625 - PLACE
      ?auto_200621 - PLACE
      ?auto_200620 - HOIST
      ?auto_200626 - SURFACE
      ?auto_200623 - SURFACE
      ?auto_200622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200624 ?auto_200625 ) ( IS-CRATE ?auto_200619 ) ( not ( = ?auto_200618 ?auto_200619 ) ) ( not ( = ?auto_200617 ?auto_200618 ) ) ( not ( = ?auto_200617 ?auto_200619 ) ) ( not ( = ?auto_200621 ?auto_200625 ) ) ( HOIST-AT ?auto_200620 ?auto_200621 ) ( not ( = ?auto_200624 ?auto_200620 ) ) ( SURFACE-AT ?auto_200619 ?auto_200621 ) ( ON ?auto_200619 ?auto_200626 ) ( CLEAR ?auto_200619 ) ( not ( = ?auto_200618 ?auto_200626 ) ) ( not ( = ?auto_200619 ?auto_200626 ) ) ( not ( = ?auto_200617 ?auto_200626 ) ) ( IS-CRATE ?auto_200618 ) ( AVAILABLE ?auto_200620 ) ( SURFACE-AT ?auto_200618 ?auto_200621 ) ( ON ?auto_200618 ?auto_200623 ) ( CLEAR ?auto_200618 ) ( not ( = ?auto_200618 ?auto_200623 ) ) ( not ( = ?auto_200619 ?auto_200623 ) ) ( not ( = ?auto_200617 ?auto_200623 ) ) ( not ( = ?auto_200626 ?auto_200623 ) ) ( TRUCK-AT ?auto_200622 ?auto_200625 ) ( SURFACE-AT ?auto_200615 ?auto_200625 ) ( CLEAR ?auto_200615 ) ( LIFTING ?auto_200624 ?auto_200617 ) ( IS-CRATE ?auto_200617 ) ( not ( = ?auto_200615 ?auto_200617 ) ) ( not ( = ?auto_200618 ?auto_200615 ) ) ( not ( = ?auto_200619 ?auto_200615 ) ) ( not ( = ?auto_200626 ?auto_200615 ) ) ( not ( = ?auto_200623 ?auto_200615 ) ) ( ON ?auto_200613 ?auto_200612 ) ( ON ?auto_200614 ?auto_200613 ) ( ON ?auto_200616 ?auto_200614 ) ( ON ?auto_200615 ?auto_200616 ) ( not ( = ?auto_200612 ?auto_200613 ) ) ( not ( = ?auto_200612 ?auto_200614 ) ) ( not ( = ?auto_200612 ?auto_200616 ) ) ( not ( = ?auto_200612 ?auto_200615 ) ) ( not ( = ?auto_200612 ?auto_200617 ) ) ( not ( = ?auto_200612 ?auto_200618 ) ) ( not ( = ?auto_200612 ?auto_200619 ) ) ( not ( = ?auto_200612 ?auto_200626 ) ) ( not ( = ?auto_200612 ?auto_200623 ) ) ( not ( = ?auto_200613 ?auto_200614 ) ) ( not ( = ?auto_200613 ?auto_200616 ) ) ( not ( = ?auto_200613 ?auto_200615 ) ) ( not ( = ?auto_200613 ?auto_200617 ) ) ( not ( = ?auto_200613 ?auto_200618 ) ) ( not ( = ?auto_200613 ?auto_200619 ) ) ( not ( = ?auto_200613 ?auto_200626 ) ) ( not ( = ?auto_200613 ?auto_200623 ) ) ( not ( = ?auto_200614 ?auto_200616 ) ) ( not ( = ?auto_200614 ?auto_200615 ) ) ( not ( = ?auto_200614 ?auto_200617 ) ) ( not ( = ?auto_200614 ?auto_200618 ) ) ( not ( = ?auto_200614 ?auto_200619 ) ) ( not ( = ?auto_200614 ?auto_200626 ) ) ( not ( = ?auto_200614 ?auto_200623 ) ) ( not ( = ?auto_200616 ?auto_200615 ) ) ( not ( = ?auto_200616 ?auto_200617 ) ) ( not ( = ?auto_200616 ?auto_200618 ) ) ( not ( = ?auto_200616 ?auto_200619 ) ) ( not ( = ?auto_200616 ?auto_200626 ) ) ( not ( = ?auto_200616 ?auto_200623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200617 ?auto_200618 ?auto_200619 )
      ( MAKE-7CRATE-VERIFY ?auto_200612 ?auto_200613 ?auto_200614 ?auto_200616 ?auto_200615 ?auto_200617 ?auto_200618 ?auto_200619 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_200627 - SURFACE
      ?auto_200628 - SURFACE
      ?auto_200629 - SURFACE
      ?auto_200631 - SURFACE
      ?auto_200630 - SURFACE
      ?auto_200632 - SURFACE
      ?auto_200633 - SURFACE
      ?auto_200634 - SURFACE
      ?auto_200635 - SURFACE
    )
    :vars
    (
      ?auto_200640 - HOIST
      ?auto_200641 - PLACE
      ?auto_200637 - PLACE
      ?auto_200636 - HOIST
      ?auto_200642 - SURFACE
      ?auto_200639 - SURFACE
      ?auto_200638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200640 ?auto_200641 ) ( IS-CRATE ?auto_200635 ) ( not ( = ?auto_200634 ?auto_200635 ) ) ( not ( = ?auto_200633 ?auto_200634 ) ) ( not ( = ?auto_200633 ?auto_200635 ) ) ( not ( = ?auto_200637 ?auto_200641 ) ) ( HOIST-AT ?auto_200636 ?auto_200637 ) ( not ( = ?auto_200640 ?auto_200636 ) ) ( SURFACE-AT ?auto_200635 ?auto_200637 ) ( ON ?auto_200635 ?auto_200642 ) ( CLEAR ?auto_200635 ) ( not ( = ?auto_200634 ?auto_200642 ) ) ( not ( = ?auto_200635 ?auto_200642 ) ) ( not ( = ?auto_200633 ?auto_200642 ) ) ( IS-CRATE ?auto_200634 ) ( AVAILABLE ?auto_200636 ) ( SURFACE-AT ?auto_200634 ?auto_200637 ) ( ON ?auto_200634 ?auto_200639 ) ( CLEAR ?auto_200634 ) ( not ( = ?auto_200634 ?auto_200639 ) ) ( not ( = ?auto_200635 ?auto_200639 ) ) ( not ( = ?auto_200633 ?auto_200639 ) ) ( not ( = ?auto_200642 ?auto_200639 ) ) ( TRUCK-AT ?auto_200638 ?auto_200641 ) ( SURFACE-AT ?auto_200632 ?auto_200641 ) ( CLEAR ?auto_200632 ) ( LIFTING ?auto_200640 ?auto_200633 ) ( IS-CRATE ?auto_200633 ) ( not ( = ?auto_200632 ?auto_200633 ) ) ( not ( = ?auto_200634 ?auto_200632 ) ) ( not ( = ?auto_200635 ?auto_200632 ) ) ( not ( = ?auto_200642 ?auto_200632 ) ) ( not ( = ?auto_200639 ?auto_200632 ) ) ( ON ?auto_200628 ?auto_200627 ) ( ON ?auto_200629 ?auto_200628 ) ( ON ?auto_200631 ?auto_200629 ) ( ON ?auto_200630 ?auto_200631 ) ( ON ?auto_200632 ?auto_200630 ) ( not ( = ?auto_200627 ?auto_200628 ) ) ( not ( = ?auto_200627 ?auto_200629 ) ) ( not ( = ?auto_200627 ?auto_200631 ) ) ( not ( = ?auto_200627 ?auto_200630 ) ) ( not ( = ?auto_200627 ?auto_200632 ) ) ( not ( = ?auto_200627 ?auto_200633 ) ) ( not ( = ?auto_200627 ?auto_200634 ) ) ( not ( = ?auto_200627 ?auto_200635 ) ) ( not ( = ?auto_200627 ?auto_200642 ) ) ( not ( = ?auto_200627 ?auto_200639 ) ) ( not ( = ?auto_200628 ?auto_200629 ) ) ( not ( = ?auto_200628 ?auto_200631 ) ) ( not ( = ?auto_200628 ?auto_200630 ) ) ( not ( = ?auto_200628 ?auto_200632 ) ) ( not ( = ?auto_200628 ?auto_200633 ) ) ( not ( = ?auto_200628 ?auto_200634 ) ) ( not ( = ?auto_200628 ?auto_200635 ) ) ( not ( = ?auto_200628 ?auto_200642 ) ) ( not ( = ?auto_200628 ?auto_200639 ) ) ( not ( = ?auto_200629 ?auto_200631 ) ) ( not ( = ?auto_200629 ?auto_200630 ) ) ( not ( = ?auto_200629 ?auto_200632 ) ) ( not ( = ?auto_200629 ?auto_200633 ) ) ( not ( = ?auto_200629 ?auto_200634 ) ) ( not ( = ?auto_200629 ?auto_200635 ) ) ( not ( = ?auto_200629 ?auto_200642 ) ) ( not ( = ?auto_200629 ?auto_200639 ) ) ( not ( = ?auto_200631 ?auto_200630 ) ) ( not ( = ?auto_200631 ?auto_200632 ) ) ( not ( = ?auto_200631 ?auto_200633 ) ) ( not ( = ?auto_200631 ?auto_200634 ) ) ( not ( = ?auto_200631 ?auto_200635 ) ) ( not ( = ?auto_200631 ?auto_200642 ) ) ( not ( = ?auto_200631 ?auto_200639 ) ) ( not ( = ?auto_200630 ?auto_200632 ) ) ( not ( = ?auto_200630 ?auto_200633 ) ) ( not ( = ?auto_200630 ?auto_200634 ) ) ( not ( = ?auto_200630 ?auto_200635 ) ) ( not ( = ?auto_200630 ?auto_200642 ) ) ( not ( = ?auto_200630 ?auto_200639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200633 ?auto_200634 ?auto_200635 )
      ( MAKE-8CRATE-VERIFY ?auto_200627 ?auto_200628 ?auto_200629 ?auto_200631 ?auto_200630 ?auto_200632 ?auto_200633 ?auto_200634 ?auto_200635 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_200643 - SURFACE
      ?auto_200644 - SURFACE
      ?auto_200645 - SURFACE
      ?auto_200647 - SURFACE
      ?auto_200646 - SURFACE
      ?auto_200648 - SURFACE
      ?auto_200649 - SURFACE
      ?auto_200650 - SURFACE
      ?auto_200651 - SURFACE
      ?auto_200652 - SURFACE
    )
    :vars
    (
      ?auto_200657 - HOIST
      ?auto_200658 - PLACE
      ?auto_200654 - PLACE
      ?auto_200653 - HOIST
      ?auto_200659 - SURFACE
      ?auto_200656 - SURFACE
      ?auto_200655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_200657 ?auto_200658 ) ( IS-CRATE ?auto_200652 ) ( not ( = ?auto_200651 ?auto_200652 ) ) ( not ( = ?auto_200650 ?auto_200651 ) ) ( not ( = ?auto_200650 ?auto_200652 ) ) ( not ( = ?auto_200654 ?auto_200658 ) ) ( HOIST-AT ?auto_200653 ?auto_200654 ) ( not ( = ?auto_200657 ?auto_200653 ) ) ( SURFACE-AT ?auto_200652 ?auto_200654 ) ( ON ?auto_200652 ?auto_200659 ) ( CLEAR ?auto_200652 ) ( not ( = ?auto_200651 ?auto_200659 ) ) ( not ( = ?auto_200652 ?auto_200659 ) ) ( not ( = ?auto_200650 ?auto_200659 ) ) ( IS-CRATE ?auto_200651 ) ( AVAILABLE ?auto_200653 ) ( SURFACE-AT ?auto_200651 ?auto_200654 ) ( ON ?auto_200651 ?auto_200656 ) ( CLEAR ?auto_200651 ) ( not ( = ?auto_200651 ?auto_200656 ) ) ( not ( = ?auto_200652 ?auto_200656 ) ) ( not ( = ?auto_200650 ?auto_200656 ) ) ( not ( = ?auto_200659 ?auto_200656 ) ) ( TRUCK-AT ?auto_200655 ?auto_200658 ) ( SURFACE-AT ?auto_200649 ?auto_200658 ) ( CLEAR ?auto_200649 ) ( LIFTING ?auto_200657 ?auto_200650 ) ( IS-CRATE ?auto_200650 ) ( not ( = ?auto_200649 ?auto_200650 ) ) ( not ( = ?auto_200651 ?auto_200649 ) ) ( not ( = ?auto_200652 ?auto_200649 ) ) ( not ( = ?auto_200659 ?auto_200649 ) ) ( not ( = ?auto_200656 ?auto_200649 ) ) ( ON ?auto_200644 ?auto_200643 ) ( ON ?auto_200645 ?auto_200644 ) ( ON ?auto_200647 ?auto_200645 ) ( ON ?auto_200646 ?auto_200647 ) ( ON ?auto_200648 ?auto_200646 ) ( ON ?auto_200649 ?auto_200648 ) ( not ( = ?auto_200643 ?auto_200644 ) ) ( not ( = ?auto_200643 ?auto_200645 ) ) ( not ( = ?auto_200643 ?auto_200647 ) ) ( not ( = ?auto_200643 ?auto_200646 ) ) ( not ( = ?auto_200643 ?auto_200648 ) ) ( not ( = ?auto_200643 ?auto_200649 ) ) ( not ( = ?auto_200643 ?auto_200650 ) ) ( not ( = ?auto_200643 ?auto_200651 ) ) ( not ( = ?auto_200643 ?auto_200652 ) ) ( not ( = ?auto_200643 ?auto_200659 ) ) ( not ( = ?auto_200643 ?auto_200656 ) ) ( not ( = ?auto_200644 ?auto_200645 ) ) ( not ( = ?auto_200644 ?auto_200647 ) ) ( not ( = ?auto_200644 ?auto_200646 ) ) ( not ( = ?auto_200644 ?auto_200648 ) ) ( not ( = ?auto_200644 ?auto_200649 ) ) ( not ( = ?auto_200644 ?auto_200650 ) ) ( not ( = ?auto_200644 ?auto_200651 ) ) ( not ( = ?auto_200644 ?auto_200652 ) ) ( not ( = ?auto_200644 ?auto_200659 ) ) ( not ( = ?auto_200644 ?auto_200656 ) ) ( not ( = ?auto_200645 ?auto_200647 ) ) ( not ( = ?auto_200645 ?auto_200646 ) ) ( not ( = ?auto_200645 ?auto_200648 ) ) ( not ( = ?auto_200645 ?auto_200649 ) ) ( not ( = ?auto_200645 ?auto_200650 ) ) ( not ( = ?auto_200645 ?auto_200651 ) ) ( not ( = ?auto_200645 ?auto_200652 ) ) ( not ( = ?auto_200645 ?auto_200659 ) ) ( not ( = ?auto_200645 ?auto_200656 ) ) ( not ( = ?auto_200647 ?auto_200646 ) ) ( not ( = ?auto_200647 ?auto_200648 ) ) ( not ( = ?auto_200647 ?auto_200649 ) ) ( not ( = ?auto_200647 ?auto_200650 ) ) ( not ( = ?auto_200647 ?auto_200651 ) ) ( not ( = ?auto_200647 ?auto_200652 ) ) ( not ( = ?auto_200647 ?auto_200659 ) ) ( not ( = ?auto_200647 ?auto_200656 ) ) ( not ( = ?auto_200646 ?auto_200648 ) ) ( not ( = ?auto_200646 ?auto_200649 ) ) ( not ( = ?auto_200646 ?auto_200650 ) ) ( not ( = ?auto_200646 ?auto_200651 ) ) ( not ( = ?auto_200646 ?auto_200652 ) ) ( not ( = ?auto_200646 ?auto_200659 ) ) ( not ( = ?auto_200646 ?auto_200656 ) ) ( not ( = ?auto_200648 ?auto_200649 ) ) ( not ( = ?auto_200648 ?auto_200650 ) ) ( not ( = ?auto_200648 ?auto_200651 ) ) ( not ( = ?auto_200648 ?auto_200652 ) ) ( not ( = ?auto_200648 ?auto_200659 ) ) ( not ( = ?auto_200648 ?auto_200656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_200650 ?auto_200651 ?auto_200652 )
      ( MAKE-9CRATE-VERIFY ?auto_200643 ?auto_200644 ?auto_200645 ?auto_200647 ?auto_200646 ?auto_200648 ?auto_200649 ?auto_200650 ?auto_200651 ?auto_200652 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_201541 - SURFACE
      ?auto_201542 - SURFACE
    )
    :vars
    (
      ?auto_201547 - HOIST
      ?auto_201544 - PLACE
      ?auto_201543 - SURFACE
      ?auto_201546 - PLACE
      ?auto_201548 - HOIST
      ?auto_201550 - SURFACE
      ?auto_201549 - TRUCK
      ?auto_201545 - SURFACE
      ?auto_201551 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_201547 ?auto_201544 ) ( IS-CRATE ?auto_201542 ) ( not ( = ?auto_201541 ?auto_201542 ) ) ( not ( = ?auto_201543 ?auto_201541 ) ) ( not ( = ?auto_201543 ?auto_201542 ) ) ( not ( = ?auto_201546 ?auto_201544 ) ) ( HOIST-AT ?auto_201548 ?auto_201546 ) ( not ( = ?auto_201547 ?auto_201548 ) ) ( SURFACE-AT ?auto_201542 ?auto_201546 ) ( ON ?auto_201542 ?auto_201550 ) ( CLEAR ?auto_201542 ) ( not ( = ?auto_201541 ?auto_201550 ) ) ( not ( = ?auto_201542 ?auto_201550 ) ) ( not ( = ?auto_201543 ?auto_201550 ) ) ( SURFACE-AT ?auto_201543 ?auto_201544 ) ( CLEAR ?auto_201543 ) ( IS-CRATE ?auto_201541 ) ( AVAILABLE ?auto_201547 ) ( TRUCK-AT ?auto_201549 ?auto_201546 ) ( SURFACE-AT ?auto_201541 ?auto_201546 ) ( ON ?auto_201541 ?auto_201545 ) ( CLEAR ?auto_201541 ) ( not ( = ?auto_201541 ?auto_201545 ) ) ( not ( = ?auto_201542 ?auto_201545 ) ) ( not ( = ?auto_201543 ?auto_201545 ) ) ( not ( = ?auto_201550 ?auto_201545 ) ) ( LIFTING ?auto_201548 ?auto_201551 ) ( IS-CRATE ?auto_201551 ) ( not ( = ?auto_201541 ?auto_201551 ) ) ( not ( = ?auto_201542 ?auto_201551 ) ) ( not ( = ?auto_201543 ?auto_201551 ) ) ( not ( = ?auto_201550 ?auto_201551 ) ) ( not ( = ?auto_201545 ?auto_201551 ) ) )
    :subtasks
    ( ( !LOAD ?auto_201548 ?auto_201551 ?auto_201549 ?auto_201546 )
      ( MAKE-2CRATE ?auto_201543 ?auto_201541 ?auto_201542 )
      ( MAKE-1CRATE-VERIFY ?auto_201541 ?auto_201542 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_201552 - SURFACE
      ?auto_201553 - SURFACE
      ?auto_201554 - SURFACE
    )
    :vars
    (
      ?auto_201558 - HOIST
      ?auto_201561 - PLACE
      ?auto_201557 - PLACE
      ?auto_201562 - HOIST
      ?auto_201555 - SURFACE
      ?auto_201559 - TRUCK
      ?auto_201556 - SURFACE
      ?auto_201560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_201558 ?auto_201561 ) ( IS-CRATE ?auto_201554 ) ( not ( = ?auto_201553 ?auto_201554 ) ) ( not ( = ?auto_201552 ?auto_201553 ) ) ( not ( = ?auto_201552 ?auto_201554 ) ) ( not ( = ?auto_201557 ?auto_201561 ) ) ( HOIST-AT ?auto_201562 ?auto_201557 ) ( not ( = ?auto_201558 ?auto_201562 ) ) ( SURFACE-AT ?auto_201554 ?auto_201557 ) ( ON ?auto_201554 ?auto_201555 ) ( CLEAR ?auto_201554 ) ( not ( = ?auto_201553 ?auto_201555 ) ) ( not ( = ?auto_201554 ?auto_201555 ) ) ( not ( = ?auto_201552 ?auto_201555 ) ) ( SURFACE-AT ?auto_201552 ?auto_201561 ) ( CLEAR ?auto_201552 ) ( IS-CRATE ?auto_201553 ) ( AVAILABLE ?auto_201558 ) ( TRUCK-AT ?auto_201559 ?auto_201557 ) ( SURFACE-AT ?auto_201553 ?auto_201557 ) ( ON ?auto_201553 ?auto_201556 ) ( CLEAR ?auto_201553 ) ( not ( = ?auto_201553 ?auto_201556 ) ) ( not ( = ?auto_201554 ?auto_201556 ) ) ( not ( = ?auto_201552 ?auto_201556 ) ) ( not ( = ?auto_201555 ?auto_201556 ) ) ( LIFTING ?auto_201562 ?auto_201560 ) ( IS-CRATE ?auto_201560 ) ( not ( = ?auto_201553 ?auto_201560 ) ) ( not ( = ?auto_201554 ?auto_201560 ) ) ( not ( = ?auto_201552 ?auto_201560 ) ) ( not ( = ?auto_201555 ?auto_201560 ) ) ( not ( = ?auto_201556 ?auto_201560 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_201553 ?auto_201554 )
      ( MAKE-2CRATE-VERIFY ?auto_201552 ?auto_201553 ?auto_201554 ) )
  )

)

