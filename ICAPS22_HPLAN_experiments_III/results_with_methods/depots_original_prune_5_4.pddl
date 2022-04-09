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
      ?auto_24773 - SURFACE
      ?auto_24774 - SURFACE
    )
    :vars
    (
      ?auto_24775 - HOIST
      ?auto_24776 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24775 ?auto_24776 ) ( SURFACE-AT ?auto_24773 ?auto_24776 ) ( CLEAR ?auto_24773 ) ( LIFTING ?auto_24775 ?auto_24774 ) ( IS-CRATE ?auto_24774 ) ( not ( = ?auto_24773 ?auto_24774 ) ) )
    :subtasks
    ( ( !DROP ?auto_24775 ?auto_24774 ?auto_24773 ?auto_24776 )
      ( MAKE-1CRATE-VERIFY ?auto_24773 ?auto_24774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24777 - SURFACE
      ?auto_24778 - SURFACE
    )
    :vars
    (
      ?auto_24779 - HOIST
      ?auto_24780 - PLACE
      ?auto_24781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24779 ?auto_24780 ) ( SURFACE-AT ?auto_24777 ?auto_24780 ) ( CLEAR ?auto_24777 ) ( IS-CRATE ?auto_24778 ) ( not ( = ?auto_24777 ?auto_24778 ) ) ( TRUCK-AT ?auto_24781 ?auto_24780 ) ( AVAILABLE ?auto_24779 ) ( IN ?auto_24778 ?auto_24781 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24779 ?auto_24778 ?auto_24781 ?auto_24780 )
      ( MAKE-1CRATE ?auto_24777 ?auto_24778 )
      ( MAKE-1CRATE-VERIFY ?auto_24777 ?auto_24778 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24782 - SURFACE
      ?auto_24783 - SURFACE
    )
    :vars
    (
      ?auto_24784 - HOIST
      ?auto_24786 - PLACE
      ?auto_24785 - TRUCK
      ?auto_24787 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24784 ?auto_24786 ) ( SURFACE-AT ?auto_24782 ?auto_24786 ) ( CLEAR ?auto_24782 ) ( IS-CRATE ?auto_24783 ) ( not ( = ?auto_24782 ?auto_24783 ) ) ( AVAILABLE ?auto_24784 ) ( IN ?auto_24783 ?auto_24785 ) ( TRUCK-AT ?auto_24785 ?auto_24787 ) ( not ( = ?auto_24787 ?auto_24786 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24785 ?auto_24787 ?auto_24786 )
      ( MAKE-1CRATE ?auto_24782 ?auto_24783 )
      ( MAKE-1CRATE-VERIFY ?auto_24782 ?auto_24783 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24788 - SURFACE
      ?auto_24789 - SURFACE
    )
    :vars
    (
      ?auto_24792 - HOIST
      ?auto_24793 - PLACE
      ?auto_24791 - TRUCK
      ?auto_24790 - PLACE
      ?auto_24794 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24792 ?auto_24793 ) ( SURFACE-AT ?auto_24788 ?auto_24793 ) ( CLEAR ?auto_24788 ) ( IS-CRATE ?auto_24789 ) ( not ( = ?auto_24788 ?auto_24789 ) ) ( AVAILABLE ?auto_24792 ) ( TRUCK-AT ?auto_24791 ?auto_24790 ) ( not ( = ?auto_24790 ?auto_24793 ) ) ( HOIST-AT ?auto_24794 ?auto_24790 ) ( LIFTING ?auto_24794 ?auto_24789 ) ( not ( = ?auto_24792 ?auto_24794 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24794 ?auto_24789 ?auto_24791 ?auto_24790 )
      ( MAKE-1CRATE ?auto_24788 ?auto_24789 )
      ( MAKE-1CRATE-VERIFY ?auto_24788 ?auto_24789 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24795 - SURFACE
      ?auto_24796 - SURFACE
    )
    :vars
    (
      ?auto_24801 - HOIST
      ?auto_24800 - PLACE
      ?auto_24797 - TRUCK
      ?auto_24798 - PLACE
      ?auto_24799 - HOIST
      ?auto_24802 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24801 ?auto_24800 ) ( SURFACE-AT ?auto_24795 ?auto_24800 ) ( CLEAR ?auto_24795 ) ( IS-CRATE ?auto_24796 ) ( not ( = ?auto_24795 ?auto_24796 ) ) ( AVAILABLE ?auto_24801 ) ( TRUCK-AT ?auto_24797 ?auto_24798 ) ( not ( = ?auto_24798 ?auto_24800 ) ) ( HOIST-AT ?auto_24799 ?auto_24798 ) ( not ( = ?auto_24801 ?auto_24799 ) ) ( AVAILABLE ?auto_24799 ) ( SURFACE-AT ?auto_24796 ?auto_24798 ) ( ON ?auto_24796 ?auto_24802 ) ( CLEAR ?auto_24796 ) ( not ( = ?auto_24795 ?auto_24802 ) ) ( not ( = ?auto_24796 ?auto_24802 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24799 ?auto_24796 ?auto_24802 ?auto_24798 )
      ( MAKE-1CRATE ?auto_24795 ?auto_24796 )
      ( MAKE-1CRATE-VERIFY ?auto_24795 ?auto_24796 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24803 - SURFACE
      ?auto_24804 - SURFACE
    )
    :vars
    (
      ?auto_24809 - HOIST
      ?auto_24810 - PLACE
      ?auto_24805 - PLACE
      ?auto_24807 - HOIST
      ?auto_24808 - SURFACE
      ?auto_24806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24809 ?auto_24810 ) ( SURFACE-AT ?auto_24803 ?auto_24810 ) ( CLEAR ?auto_24803 ) ( IS-CRATE ?auto_24804 ) ( not ( = ?auto_24803 ?auto_24804 ) ) ( AVAILABLE ?auto_24809 ) ( not ( = ?auto_24805 ?auto_24810 ) ) ( HOIST-AT ?auto_24807 ?auto_24805 ) ( not ( = ?auto_24809 ?auto_24807 ) ) ( AVAILABLE ?auto_24807 ) ( SURFACE-AT ?auto_24804 ?auto_24805 ) ( ON ?auto_24804 ?auto_24808 ) ( CLEAR ?auto_24804 ) ( not ( = ?auto_24803 ?auto_24808 ) ) ( not ( = ?auto_24804 ?auto_24808 ) ) ( TRUCK-AT ?auto_24806 ?auto_24810 ) )
    :subtasks
    ( ( !DRIVE ?auto_24806 ?auto_24810 ?auto_24805 )
      ( MAKE-1CRATE ?auto_24803 ?auto_24804 )
      ( MAKE-1CRATE-VERIFY ?auto_24803 ?auto_24804 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24820 - SURFACE
      ?auto_24821 - SURFACE
      ?auto_24822 - SURFACE
    )
    :vars
    (
      ?auto_24824 - HOIST
      ?auto_24823 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24824 ?auto_24823 ) ( SURFACE-AT ?auto_24821 ?auto_24823 ) ( CLEAR ?auto_24821 ) ( LIFTING ?auto_24824 ?auto_24822 ) ( IS-CRATE ?auto_24822 ) ( not ( = ?auto_24821 ?auto_24822 ) ) ( ON ?auto_24821 ?auto_24820 ) ( not ( = ?auto_24820 ?auto_24821 ) ) ( not ( = ?auto_24820 ?auto_24822 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24821 ?auto_24822 )
      ( MAKE-2CRATE-VERIFY ?auto_24820 ?auto_24821 ?auto_24822 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24830 - SURFACE
      ?auto_24831 - SURFACE
      ?auto_24832 - SURFACE
    )
    :vars
    (
      ?auto_24834 - HOIST
      ?auto_24835 - PLACE
      ?auto_24833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24834 ?auto_24835 ) ( SURFACE-AT ?auto_24831 ?auto_24835 ) ( CLEAR ?auto_24831 ) ( IS-CRATE ?auto_24832 ) ( not ( = ?auto_24831 ?auto_24832 ) ) ( TRUCK-AT ?auto_24833 ?auto_24835 ) ( AVAILABLE ?auto_24834 ) ( IN ?auto_24832 ?auto_24833 ) ( ON ?auto_24831 ?auto_24830 ) ( not ( = ?auto_24830 ?auto_24831 ) ) ( not ( = ?auto_24830 ?auto_24832 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24831 ?auto_24832 )
      ( MAKE-2CRATE-VERIFY ?auto_24830 ?auto_24831 ?auto_24832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24836 - SURFACE
      ?auto_24837 - SURFACE
    )
    :vars
    (
      ?auto_24838 - HOIST
      ?auto_24840 - PLACE
      ?auto_24841 - TRUCK
      ?auto_24839 - SURFACE
      ?auto_24842 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24838 ?auto_24840 ) ( SURFACE-AT ?auto_24836 ?auto_24840 ) ( CLEAR ?auto_24836 ) ( IS-CRATE ?auto_24837 ) ( not ( = ?auto_24836 ?auto_24837 ) ) ( AVAILABLE ?auto_24838 ) ( IN ?auto_24837 ?auto_24841 ) ( ON ?auto_24836 ?auto_24839 ) ( not ( = ?auto_24839 ?auto_24836 ) ) ( not ( = ?auto_24839 ?auto_24837 ) ) ( TRUCK-AT ?auto_24841 ?auto_24842 ) ( not ( = ?auto_24842 ?auto_24840 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24841 ?auto_24842 ?auto_24840 )
      ( MAKE-2CRATE ?auto_24839 ?auto_24836 ?auto_24837 )
      ( MAKE-1CRATE-VERIFY ?auto_24836 ?auto_24837 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24843 - SURFACE
      ?auto_24844 - SURFACE
      ?auto_24845 - SURFACE
    )
    :vars
    (
      ?auto_24849 - HOIST
      ?auto_24848 - PLACE
      ?auto_24846 - TRUCK
      ?auto_24847 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24849 ?auto_24848 ) ( SURFACE-AT ?auto_24844 ?auto_24848 ) ( CLEAR ?auto_24844 ) ( IS-CRATE ?auto_24845 ) ( not ( = ?auto_24844 ?auto_24845 ) ) ( AVAILABLE ?auto_24849 ) ( IN ?auto_24845 ?auto_24846 ) ( ON ?auto_24844 ?auto_24843 ) ( not ( = ?auto_24843 ?auto_24844 ) ) ( not ( = ?auto_24843 ?auto_24845 ) ) ( TRUCK-AT ?auto_24846 ?auto_24847 ) ( not ( = ?auto_24847 ?auto_24848 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24844 ?auto_24845 )
      ( MAKE-2CRATE-VERIFY ?auto_24843 ?auto_24844 ?auto_24845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24850 - SURFACE
      ?auto_24851 - SURFACE
    )
    :vars
    (
      ?auto_24853 - HOIST
      ?auto_24852 - PLACE
      ?auto_24855 - SURFACE
      ?auto_24856 - TRUCK
      ?auto_24854 - PLACE
      ?auto_24857 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24853 ?auto_24852 ) ( SURFACE-AT ?auto_24850 ?auto_24852 ) ( CLEAR ?auto_24850 ) ( IS-CRATE ?auto_24851 ) ( not ( = ?auto_24850 ?auto_24851 ) ) ( AVAILABLE ?auto_24853 ) ( ON ?auto_24850 ?auto_24855 ) ( not ( = ?auto_24855 ?auto_24850 ) ) ( not ( = ?auto_24855 ?auto_24851 ) ) ( TRUCK-AT ?auto_24856 ?auto_24854 ) ( not ( = ?auto_24854 ?auto_24852 ) ) ( HOIST-AT ?auto_24857 ?auto_24854 ) ( LIFTING ?auto_24857 ?auto_24851 ) ( not ( = ?auto_24853 ?auto_24857 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24857 ?auto_24851 ?auto_24856 ?auto_24854 )
      ( MAKE-2CRATE ?auto_24855 ?auto_24850 ?auto_24851 )
      ( MAKE-1CRATE-VERIFY ?auto_24850 ?auto_24851 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24858 - SURFACE
      ?auto_24859 - SURFACE
      ?auto_24860 - SURFACE
    )
    :vars
    (
      ?auto_24862 - HOIST
      ?auto_24865 - PLACE
      ?auto_24861 - TRUCK
      ?auto_24863 - PLACE
      ?auto_24864 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24862 ?auto_24865 ) ( SURFACE-AT ?auto_24859 ?auto_24865 ) ( CLEAR ?auto_24859 ) ( IS-CRATE ?auto_24860 ) ( not ( = ?auto_24859 ?auto_24860 ) ) ( AVAILABLE ?auto_24862 ) ( ON ?auto_24859 ?auto_24858 ) ( not ( = ?auto_24858 ?auto_24859 ) ) ( not ( = ?auto_24858 ?auto_24860 ) ) ( TRUCK-AT ?auto_24861 ?auto_24863 ) ( not ( = ?auto_24863 ?auto_24865 ) ) ( HOIST-AT ?auto_24864 ?auto_24863 ) ( LIFTING ?auto_24864 ?auto_24860 ) ( not ( = ?auto_24862 ?auto_24864 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24859 ?auto_24860 )
      ( MAKE-2CRATE-VERIFY ?auto_24858 ?auto_24859 ?auto_24860 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24866 - SURFACE
      ?auto_24867 - SURFACE
    )
    :vars
    (
      ?auto_24869 - HOIST
      ?auto_24868 - PLACE
      ?auto_24871 - SURFACE
      ?auto_24872 - TRUCK
      ?auto_24873 - PLACE
      ?auto_24870 - HOIST
      ?auto_24874 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24869 ?auto_24868 ) ( SURFACE-AT ?auto_24866 ?auto_24868 ) ( CLEAR ?auto_24866 ) ( IS-CRATE ?auto_24867 ) ( not ( = ?auto_24866 ?auto_24867 ) ) ( AVAILABLE ?auto_24869 ) ( ON ?auto_24866 ?auto_24871 ) ( not ( = ?auto_24871 ?auto_24866 ) ) ( not ( = ?auto_24871 ?auto_24867 ) ) ( TRUCK-AT ?auto_24872 ?auto_24873 ) ( not ( = ?auto_24873 ?auto_24868 ) ) ( HOIST-AT ?auto_24870 ?auto_24873 ) ( not ( = ?auto_24869 ?auto_24870 ) ) ( AVAILABLE ?auto_24870 ) ( SURFACE-AT ?auto_24867 ?auto_24873 ) ( ON ?auto_24867 ?auto_24874 ) ( CLEAR ?auto_24867 ) ( not ( = ?auto_24866 ?auto_24874 ) ) ( not ( = ?auto_24867 ?auto_24874 ) ) ( not ( = ?auto_24871 ?auto_24874 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24870 ?auto_24867 ?auto_24874 ?auto_24873 )
      ( MAKE-2CRATE ?auto_24871 ?auto_24866 ?auto_24867 )
      ( MAKE-1CRATE-VERIFY ?auto_24866 ?auto_24867 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24875 - SURFACE
      ?auto_24876 - SURFACE
      ?auto_24877 - SURFACE
    )
    :vars
    (
      ?auto_24883 - HOIST
      ?auto_24878 - PLACE
      ?auto_24879 - TRUCK
      ?auto_24881 - PLACE
      ?auto_24882 - HOIST
      ?auto_24880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24883 ?auto_24878 ) ( SURFACE-AT ?auto_24876 ?auto_24878 ) ( CLEAR ?auto_24876 ) ( IS-CRATE ?auto_24877 ) ( not ( = ?auto_24876 ?auto_24877 ) ) ( AVAILABLE ?auto_24883 ) ( ON ?auto_24876 ?auto_24875 ) ( not ( = ?auto_24875 ?auto_24876 ) ) ( not ( = ?auto_24875 ?auto_24877 ) ) ( TRUCK-AT ?auto_24879 ?auto_24881 ) ( not ( = ?auto_24881 ?auto_24878 ) ) ( HOIST-AT ?auto_24882 ?auto_24881 ) ( not ( = ?auto_24883 ?auto_24882 ) ) ( AVAILABLE ?auto_24882 ) ( SURFACE-AT ?auto_24877 ?auto_24881 ) ( ON ?auto_24877 ?auto_24880 ) ( CLEAR ?auto_24877 ) ( not ( = ?auto_24876 ?auto_24880 ) ) ( not ( = ?auto_24877 ?auto_24880 ) ) ( not ( = ?auto_24875 ?auto_24880 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24876 ?auto_24877 )
      ( MAKE-2CRATE-VERIFY ?auto_24875 ?auto_24876 ?auto_24877 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24884 - SURFACE
      ?auto_24885 - SURFACE
    )
    :vars
    (
      ?auto_24888 - HOIST
      ?auto_24886 - PLACE
      ?auto_24892 - SURFACE
      ?auto_24890 - PLACE
      ?auto_24887 - HOIST
      ?auto_24891 - SURFACE
      ?auto_24889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24888 ?auto_24886 ) ( SURFACE-AT ?auto_24884 ?auto_24886 ) ( CLEAR ?auto_24884 ) ( IS-CRATE ?auto_24885 ) ( not ( = ?auto_24884 ?auto_24885 ) ) ( AVAILABLE ?auto_24888 ) ( ON ?auto_24884 ?auto_24892 ) ( not ( = ?auto_24892 ?auto_24884 ) ) ( not ( = ?auto_24892 ?auto_24885 ) ) ( not ( = ?auto_24890 ?auto_24886 ) ) ( HOIST-AT ?auto_24887 ?auto_24890 ) ( not ( = ?auto_24888 ?auto_24887 ) ) ( AVAILABLE ?auto_24887 ) ( SURFACE-AT ?auto_24885 ?auto_24890 ) ( ON ?auto_24885 ?auto_24891 ) ( CLEAR ?auto_24885 ) ( not ( = ?auto_24884 ?auto_24891 ) ) ( not ( = ?auto_24885 ?auto_24891 ) ) ( not ( = ?auto_24892 ?auto_24891 ) ) ( TRUCK-AT ?auto_24889 ?auto_24886 ) )
    :subtasks
    ( ( !DRIVE ?auto_24889 ?auto_24886 ?auto_24890 )
      ( MAKE-2CRATE ?auto_24892 ?auto_24884 ?auto_24885 )
      ( MAKE-1CRATE-VERIFY ?auto_24884 ?auto_24885 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24893 - SURFACE
      ?auto_24894 - SURFACE
      ?auto_24895 - SURFACE
    )
    :vars
    (
      ?auto_24897 - HOIST
      ?auto_24898 - PLACE
      ?auto_24900 - PLACE
      ?auto_24901 - HOIST
      ?auto_24896 - SURFACE
      ?auto_24899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24897 ?auto_24898 ) ( SURFACE-AT ?auto_24894 ?auto_24898 ) ( CLEAR ?auto_24894 ) ( IS-CRATE ?auto_24895 ) ( not ( = ?auto_24894 ?auto_24895 ) ) ( AVAILABLE ?auto_24897 ) ( ON ?auto_24894 ?auto_24893 ) ( not ( = ?auto_24893 ?auto_24894 ) ) ( not ( = ?auto_24893 ?auto_24895 ) ) ( not ( = ?auto_24900 ?auto_24898 ) ) ( HOIST-AT ?auto_24901 ?auto_24900 ) ( not ( = ?auto_24897 ?auto_24901 ) ) ( AVAILABLE ?auto_24901 ) ( SURFACE-AT ?auto_24895 ?auto_24900 ) ( ON ?auto_24895 ?auto_24896 ) ( CLEAR ?auto_24895 ) ( not ( = ?auto_24894 ?auto_24896 ) ) ( not ( = ?auto_24895 ?auto_24896 ) ) ( not ( = ?auto_24893 ?auto_24896 ) ) ( TRUCK-AT ?auto_24899 ?auto_24898 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24894 ?auto_24895 )
      ( MAKE-2CRATE-VERIFY ?auto_24893 ?auto_24894 ?auto_24895 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24902 - SURFACE
      ?auto_24903 - SURFACE
    )
    :vars
    (
      ?auto_24908 - HOIST
      ?auto_24905 - PLACE
      ?auto_24910 - SURFACE
      ?auto_24909 - PLACE
      ?auto_24907 - HOIST
      ?auto_24904 - SURFACE
      ?auto_24906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24908 ?auto_24905 ) ( IS-CRATE ?auto_24903 ) ( not ( = ?auto_24902 ?auto_24903 ) ) ( not ( = ?auto_24910 ?auto_24902 ) ) ( not ( = ?auto_24910 ?auto_24903 ) ) ( not ( = ?auto_24909 ?auto_24905 ) ) ( HOIST-AT ?auto_24907 ?auto_24909 ) ( not ( = ?auto_24908 ?auto_24907 ) ) ( AVAILABLE ?auto_24907 ) ( SURFACE-AT ?auto_24903 ?auto_24909 ) ( ON ?auto_24903 ?auto_24904 ) ( CLEAR ?auto_24903 ) ( not ( = ?auto_24902 ?auto_24904 ) ) ( not ( = ?auto_24903 ?auto_24904 ) ) ( not ( = ?auto_24910 ?auto_24904 ) ) ( TRUCK-AT ?auto_24906 ?auto_24905 ) ( SURFACE-AT ?auto_24910 ?auto_24905 ) ( CLEAR ?auto_24910 ) ( LIFTING ?auto_24908 ?auto_24902 ) ( IS-CRATE ?auto_24902 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24910 ?auto_24902 )
      ( MAKE-2CRATE ?auto_24910 ?auto_24902 ?auto_24903 )
      ( MAKE-1CRATE-VERIFY ?auto_24902 ?auto_24903 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24911 - SURFACE
      ?auto_24912 - SURFACE
      ?auto_24913 - SURFACE
    )
    :vars
    (
      ?auto_24916 - HOIST
      ?auto_24914 - PLACE
      ?auto_24917 - PLACE
      ?auto_24919 - HOIST
      ?auto_24918 - SURFACE
      ?auto_24915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24916 ?auto_24914 ) ( IS-CRATE ?auto_24913 ) ( not ( = ?auto_24912 ?auto_24913 ) ) ( not ( = ?auto_24911 ?auto_24912 ) ) ( not ( = ?auto_24911 ?auto_24913 ) ) ( not ( = ?auto_24917 ?auto_24914 ) ) ( HOIST-AT ?auto_24919 ?auto_24917 ) ( not ( = ?auto_24916 ?auto_24919 ) ) ( AVAILABLE ?auto_24919 ) ( SURFACE-AT ?auto_24913 ?auto_24917 ) ( ON ?auto_24913 ?auto_24918 ) ( CLEAR ?auto_24913 ) ( not ( = ?auto_24912 ?auto_24918 ) ) ( not ( = ?auto_24913 ?auto_24918 ) ) ( not ( = ?auto_24911 ?auto_24918 ) ) ( TRUCK-AT ?auto_24915 ?auto_24914 ) ( SURFACE-AT ?auto_24911 ?auto_24914 ) ( CLEAR ?auto_24911 ) ( LIFTING ?auto_24916 ?auto_24912 ) ( IS-CRATE ?auto_24912 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24912 ?auto_24913 )
      ( MAKE-2CRATE-VERIFY ?auto_24911 ?auto_24912 ?auto_24913 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24920 - SURFACE
      ?auto_24921 - SURFACE
    )
    :vars
    (
      ?auto_24925 - HOIST
      ?auto_24926 - PLACE
      ?auto_24922 - SURFACE
      ?auto_24927 - PLACE
      ?auto_24928 - HOIST
      ?auto_24923 - SURFACE
      ?auto_24924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24925 ?auto_24926 ) ( IS-CRATE ?auto_24921 ) ( not ( = ?auto_24920 ?auto_24921 ) ) ( not ( = ?auto_24922 ?auto_24920 ) ) ( not ( = ?auto_24922 ?auto_24921 ) ) ( not ( = ?auto_24927 ?auto_24926 ) ) ( HOIST-AT ?auto_24928 ?auto_24927 ) ( not ( = ?auto_24925 ?auto_24928 ) ) ( AVAILABLE ?auto_24928 ) ( SURFACE-AT ?auto_24921 ?auto_24927 ) ( ON ?auto_24921 ?auto_24923 ) ( CLEAR ?auto_24921 ) ( not ( = ?auto_24920 ?auto_24923 ) ) ( not ( = ?auto_24921 ?auto_24923 ) ) ( not ( = ?auto_24922 ?auto_24923 ) ) ( TRUCK-AT ?auto_24924 ?auto_24926 ) ( SURFACE-AT ?auto_24922 ?auto_24926 ) ( CLEAR ?auto_24922 ) ( IS-CRATE ?auto_24920 ) ( AVAILABLE ?auto_24925 ) ( IN ?auto_24920 ?auto_24924 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24925 ?auto_24920 ?auto_24924 ?auto_24926 )
      ( MAKE-2CRATE ?auto_24922 ?auto_24920 ?auto_24921 )
      ( MAKE-1CRATE-VERIFY ?auto_24920 ?auto_24921 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24929 - SURFACE
      ?auto_24930 - SURFACE
      ?auto_24931 - SURFACE
    )
    :vars
    (
      ?auto_24935 - HOIST
      ?auto_24936 - PLACE
      ?auto_24932 - PLACE
      ?auto_24933 - HOIST
      ?auto_24937 - SURFACE
      ?auto_24934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24935 ?auto_24936 ) ( IS-CRATE ?auto_24931 ) ( not ( = ?auto_24930 ?auto_24931 ) ) ( not ( = ?auto_24929 ?auto_24930 ) ) ( not ( = ?auto_24929 ?auto_24931 ) ) ( not ( = ?auto_24932 ?auto_24936 ) ) ( HOIST-AT ?auto_24933 ?auto_24932 ) ( not ( = ?auto_24935 ?auto_24933 ) ) ( AVAILABLE ?auto_24933 ) ( SURFACE-AT ?auto_24931 ?auto_24932 ) ( ON ?auto_24931 ?auto_24937 ) ( CLEAR ?auto_24931 ) ( not ( = ?auto_24930 ?auto_24937 ) ) ( not ( = ?auto_24931 ?auto_24937 ) ) ( not ( = ?auto_24929 ?auto_24937 ) ) ( TRUCK-AT ?auto_24934 ?auto_24936 ) ( SURFACE-AT ?auto_24929 ?auto_24936 ) ( CLEAR ?auto_24929 ) ( IS-CRATE ?auto_24930 ) ( AVAILABLE ?auto_24935 ) ( IN ?auto_24930 ?auto_24934 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24930 ?auto_24931 )
      ( MAKE-2CRATE-VERIFY ?auto_24929 ?auto_24930 ?auto_24931 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24938 - SURFACE
      ?auto_24939 - SURFACE
    )
    :vars
    (
      ?auto_24944 - HOIST
      ?auto_24943 - PLACE
      ?auto_24945 - SURFACE
      ?auto_24946 - PLACE
      ?auto_24940 - HOIST
      ?auto_24942 - SURFACE
      ?auto_24941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24944 ?auto_24943 ) ( IS-CRATE ?auto_24939 ) ( not ( = ?auto_24938 ?auto_24939 ) ) ( not ( = ?auto_24945 ?auto_24938 ) ) ( not ( = ?auto_24945 ?auto_24939 ) ) ( not ( = ?auto_24946 ?auto_24943 ) ) ( HOIST-AT ?auto_24940 ?auto_24946 ) ( not ( = ?auto_24944 ?auto_24940 ) ) ( AVAILABLE ?auto_24940 ) ( SURFACE-AT ?auto_24939 ?auto_24946 ) ( ON ?auto_24939 ?auto_24942 ) ( CLEAR ?auto_24939 ) ( not ( = ?auto_24938 ?auto_24942 ) ) ( not ( = ?auto_24939 ?auto_24942 ) ) ( not ( = ?auto_24945 ?auto_24942 ) ) ( SURFACE-AT ?auto_24945 ?auto_24943 ) ( CLEAR ?auto_24945 ) ( IS-CRATE ?auto_24938 ) ( AVAILABLE ?auto_24944 ) ( IN ?auto_24938 ?auto_24941 ) ( TRUCK-AT ?auto_24941 ?auto_24946 ) )
    :subtasks
    ( ( !DRIVE ?auto_24941 ?auto_24946 ?auto_24943 )
      ( MAKE-2CRATE ?auto_24945 ?auto_24938 ?auto_24939 )
      ( MAKE-1CRATE-VERIFY ?auto_24938 ?auto_24939 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24947 - SURFACE
      ?auto_24948 - SURFACE
      ?auto_24949 - SURFACE
    )
    :vars
    (
      ?auto_24951 - HOIST
      ?auto_24950 - PLACE
      ?auto_24955 - PLACE
      ?auto_24952 - HOIST
      ?auto_24954 - SURFACE
      ?auto_24953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24951 ?auto_24950 ) ( IS-CRATE ?auto_24949 ) ( not ( = ?auto_24948 ?auto_24949 ) ) ( not ( = ?auto_24947 ?auto_24948 ) ) ( not ( = ?auto_24947 ?auto_24949 ) ) ( not ( = ?auto_24955 ?auto_24950 ) ) ( HOIST-AT ?auto_24952 ?auto_24955 ) ( not ( = ?auto_24951 ?auto_24952 ) ) ( AVAILABLE ?auto_24952 ) ( SURFACE-AT ?auto_24949 ?auto_24955 ) ( ON ?auto_24949 ?auto_24954 ) ( CLEAR ?auto_24949 ) ( not ( = ?auto_24948 ?auto_24954 ) ) ( not ( = ?auto_24949 ?auto_24954 ) ) ( not ( = ?auto_24947 ?auto_24954 ) ) ( SURFACE-AT ?auto_24947 ?auto_24950 ) ( CLEAR ?auto_24947 ) ( IS-CRATE ?auto_24948 ) ( AVAILABLE ?auto_24951 ) ( IN ?auto_24948 ?auto_24953 ) ( TRUCK-AT ?auto_24953 ?auto_24955 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24948 ?auto_24949 )
      ( MAKE-2CRATE-VERIFY ?auto_24947 ?auto_24948 ?auto_24949 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24956 - SURFACE
      ?auto_24957 - SURFACE
    )
    :vars
    (
      ?auto_24963 - HOIST
      ?auto_24958 - PLACE
      ?auto_24962 - SURFACE
      ?auto_24959 - PLACE
      ?auto_24964 - HOIST
      ?auto_24960 - SURFACE
      ?auto_24961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24963 ?auto_24958 ) ( IS-CRATE ?auto_24957 ) ( not ( = ?auto_24956 ?auto_24957 ) ) ( not ( = ?auto_24962 ?auto_24956 ) ) ( not ( = ?auto_24962 ?auto_24957 ) ) ( not ( = ?auto_24959 ?auto_24958 ) ) ( HOIST-AT ?auto_24964 ?auto_24959 ) ( not ( = ?auto_24963 ?auto_24964 ) ) ( SURFACE-AT ?auto_24957 ?auto_24959 ) ( ON ?auto_24957 ?auto_24960 ) ( CLEAR ?auto_24957 ) ( not ( = ?auto_24956 ?auto_24960 ) ) ( not ( = ?auto_24957 ?auto_24960 ) ) ( not ( = ?auto_24962 ?auto_24960 ) ) ( SURFACE-AT ?auto_24962 ?auto_24958 ) ( CLEAR ?auto_24962 ) ( IS-CRATE ?auto_24956 ) ( AVAILABLE ?auto_24963 ) ( TRUCK-AT ?auto_24961 ?auto_24959 ) ( LIFTING ?auto_24964 ?auto_24956 ) )
    :subtasks
    ( ( !LOAD ?auto_24964 ?auto_24956 ?auto_24961 ?auto_24959 )
      ( MAKE-2CRATE ?auto_24962 ?auto_24956 ?auto_24957 )
      ( MAKE-1CRATE-VERIFY ?auto_24956 ?auto_24957 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24965 - SURFACE
      ?auto_24966 - SURFACE
      ?auto_24967 - SURFACE
    )
    :vars
    (
      ?auto_24969 - HOIST
      ?auto_24973 - PLACE
      ?auto_24970 - PLACE
      ?auto_24971 - HOIST
      ?auto_24972 - SURFACE
      ?auto_24968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24969 ?auto_24973 ) ( IS-CRATE ?auto_24967 ) ( not ( = ?auto_24966 ?auto_24967 ) ) ( not ( = ?auto_24965 ?auto_24966 ) ) ( not ( = ?auto_24965 ?auto_24967 ) ) ( not ( = ?auto_24970 ?auto_24973 ) ) ( HOIST-AT ?auto_24971 ?auto_24970 ) ( not ( = ?auto_24969 ?auto_24971 ) ) ( SURFACE-AT ?auto_24967 ?auto_24970 ) ( ON ?auto_24967 ?auto_24972 ) ( CLEAR ?auto_24967 ) ( not ( = ?auto_24966 ?auto_24972 ) ) ( not ( = ?auto_24967 ?auto_24972 ) ) ( not ( = ?auto_24965 ?auto_24972 ) ) ( SURFACE-AT ?auto_24965 ?auto_24973 ) ( CLEAR ?auto_24965 ) ( IS-CRATE ?auto_24966 ) ( AVAILABLE ?auto_24969 ) ( TRUCK-AT ?auto_24968 ?auto_24970 ) ( LIFTING ?auto_24971 ?auto_24966 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24966 ?auto_24967 )
      ( MAKE-2CRATE-VERIFY ?auto_24965 ?auto_24966 ?auto_24967 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24974 - SURFACE
      ?auto_24975 - SURFACE
    )
    :vars
    (
      ?auto_24978 - HOIST
      ?auto_24976 - PLACE
      ?auto_24979 - SURFACE
      ?auto_24980 - PLACE
      ?auto_24982 - HOIST
      ?auto_24977 - SURFACE
      ?auto_24981 - TRUCK
      ?auto_24983 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24978 ?auto_24976 ) ( IS-CRATE ?auto_24975 ) ( not ( = ?auto_24974 ?auto_24975 ) ) ( not ( = ?auto_24979 ?auto_24974 ) ) ( not ( = ?auto_24979 ?auto_24975 ) ) ( not ( = ?auto_24980 ?auto_24976 ) ) ( HOIST-AT ?auto_24982 ?auto_24980 ) ( not ( = ?auto_24978 ?auto_24982 ) ) ( SURFACE-AT ?auto_24975 ?auto_24980 ) ( ON ?auto_24975 ?auto_24977 ) ( CLEAR ?auto_24975 ) ( not ( = ?auto_24974 ?auto_24977 ) ) ( not ( = ?auto_24975 ?auto_24977 ) ) ( not ( = ?auto_24979 ?auto_24977 ) ) ( SURFACE-AT ?auto_24979 ?auto_24976 ) ( CLEAR ?auto_24979 ) ( IS-CRATE ?auto_24974 ) ( AVAILABLE ?auto_24978 ) ( TRUCK-AT ?auto_24981 ?auto_24980 ) ( AVAILABLE ?auto_24982 ) ( SURFACE-AT ?auto_24974 ?auto_24980 ) ( ON ?auto_24974 ?auto_24983 ) ( CLEAR ?auto_24974 ) ( not ( = ?auto_24974 ?auto_24983 ) ) ( not ( = ?auto_24975 ?auto_24983 ) ) ( not ( = ?auto_24979 ?auto_24983 ) ) ( not ( = ?auto_24977 ?auto_24983 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24982 ?auto_24974 ?auto_24983 ?auto_24980 )
      ( MAKE-2CRATE ?auto_24979 ?auto_24974 ?auto_24975 )
      ( MAKE-1CRATE-VERIFY ?auto_24974 ?auto_24975 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24984 - SURFACE
      ?auto_24985 - SURFACE
      ?auto_24986 - SURFACE
    )
    :vars
    (
      ?auto_24991 - HOIST
      ?auto_24993 - PLACE
      ?auto_24988 - PLACE
      ?auto_24990 - HOIST
      ?auto_24992 - SURFACE
      ?auto_24989 - TRUCK
      ?auto_24987 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24991 ?auto_24993 ) ( IS-CRATE ?auto_24986 ) ( not ( = ?auto_24985 ?auto_24986 ) ) ( not ( = ?auto_24984 ?auto_24985 ) ) ( not ( = ?auto_24984 ?auto_24986 ) ) ( not ( = ?auto_24988 ?auto_24993 ) ) ( HOIST-AT ?auto_24990 ?auto_24988 ) ( not ( = ?auto_24991 ?auto_24990 ) ) ( SURFACE-AT ?auto_24986 ?auto_24988 ) ( ON ?auto_24986 ?auto_24992 ) ( CLEAR ?auto_24986 ) ( not ( = ?auto_24985 ?auto_24992 ) ) ( not ( = ?auto_24986 ?auto_24992 ) ) ( not ( = ?auto_24984 ?auto_24992 ) ) ( SURFACE-AT ?auto_24984 ?auto_24993 ) ( CLEAR ?auto_24984 ) ( IS-CRATE ?auto_24985 ) ( AVAILABLE ?auto_24991 ) ( TRUCK-AT ?auto_24989 ?auto_24988 ) ( AVAILABLE ?auto_24990 ) ( SURFACE-AT ?auto_24985 ?auto_24988 ) ( ON ?auto_24985 ?auto_24987 ) ( CLEAR ?auto_24985 ) ( not ( = ?auto_24985 ?auto_24987 ) ) ( not ( = ?auto_24986 ?auto_24987 ) ) ( not ( = ?auto_24984 ?auto_24987 ) ) ( not ( = ?auto_24992 ?auto_24987 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24985 ?auto_24986 )
      ( MAKE-2CRATE-VERIFY ?auto_24984 ?auto_24985 ?auto_24986 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24994 - SURFACE
      ?auto_24995 - SURFACE
    )
    :vars
    (
      ?auto_25000 - HOIST
      ?auto_24996 - PLACE
      ?auto_25003 - SURFACE
      ?auto_24997 - PLACE
      ?auto_25002 - HOIST
      ?auto_25001 - SURFACE
      ?auto_24999 - SURFACE
      ?auto_24998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25000 ?auto_24996 ) ( IS-CRATE ?auto_24995 ) ( not ( = ?auto_24994 ?auto_24995 ) ) ( not ( = ?auto_25003 ?auto_24994 ) ) ( not ( = ?auto_25003 ?auto_24995 ) ) ( not ( = ?auto_24997 ?auto_24996 ) ) ( HOIST-AT ?auto_25002 ?auto_24997 ) ( not ( = ?auto_25000 ?auto_25002 ) ) ( SURFACE-AT ?auto_24995 ?auto_24997 ) ( ON ?auto_24995 ?auto_25001 ) ( CLEAR ?auto_24995 ) ( not ( = ?auto_24994 ?auto_25001 ) ) ( not ( = ?auto_24995 ?auto_25001 ) ) ( not ( = ?auto_25003 ?auto_25001 ) ) ( SURFACE-AT ?auto_25003 ?auto_24996 ) ( CLEAR ?auto_25003 ) ( IS-CRATE ?auto_24994 ) ( AVAILABLE ?auto_25000 ) ( AVAILABLE ?auto_25002 ) ( SURFACE-AT ?auto_24994 ?auto_24997 ) ( ON ?auto_24994 ?auto_24999 ) ( CLEAR ?auto_24994 ) ( not ( = ?auto_24994 ?auto_24999 ) ) ( not ( = ?auto_24995 ?auto_24999 ) ) ( not ( = ?auto_25003 ?auto_24999 ) ) ( not ( = ?auto_25001 ?auto_24999 ) ) ( TRUCK-AT ?auto_24998 ?auto_24996 ) )
    :subtasks
    ( ( !DRIVE ?auto_24998 ?auto_24996 ?auto_24997 )
      ( MAKE-2CRATE ?auto_25003 ?auto_24994 ?auto_24995 )
      ( MAKE-1CRATE-VERIFY ?auto_24994 ?auto_24995 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25004 - SURFACE
      ?auto_25005 - SURFACE
      ?auto_25006 - SURFACE
    )
    :vars
    (
      ?auto_25010 - HOIST
      ?auto_25011 - PLACE
      ?auto_25012 - PLACE
      ?auto_25013 - HOIST
      ?auto_25009 - SURFACE
      ?auto_25007 - SURFACE
      ?auto_25008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25010 ?auto_25011 ) ( IS-CRATE ?auto_25006 ) ( not ( = ?auto_25005 ?auto_25006 ) ) ( not ( = ?auto_25004 ?auto_25005 ) ) ( not ( = ?auto_25004 ?auto_25006 ) ) ( not ( = ?auto_25012 ?auto_25011 ) ) ( HOIST-AT ?auto_25013 ?auto_25012 ) ( not ( = ?auto_25010 ?auto_25013 ) ) ( SURFACE-AT ?auto_25006 ?auto_25012 ) ( ON ?auto_25006 ?auto_25009 ) ( CLEAR ?auto_25006 ) ( not ( = ?auto_25005 ?auto_25009 ) ) ( not ( = ?auto_25006 ?auto_25009 ) ) ( not ( = ?auto_25004 ?auto_25009 ) ) ( SURFACE-AT ?auto_25004 ?auto_25011 ) ( CLEAR ?auto_25004 ) ( IS-CRATE ?auto_25005 ) ( AVAILABLE ?auto_25010 ) ( AVAILABLE ?auto_25013 ) ( SURFACE-AT ?auto_25005 ?auto_25012 ) ( ON ?auto_25005 ?auto_25007 ) ( CLEAR ?auto_25005 ) ( not ( = ?auto_25005 ?auto_25007 ) ) ( not ( = ?auto_25006 ?auto_25007 ) ) ( not ( = ?auto_25004 ?auto_25007 ) ) ( not ( = ?auto_25009 ?auto_25007 ) ) ( TRUCK-AT ?auto_25008 ?auto_25011 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25005 ?auto_25006 )
      ( MAKE-2CRATE-VERIFY ?auto_25004 ?auto_25005 ?auto_25006 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25032 - SURFACE
      ?auto_25033 - SURFACE
      ?auto_25034 - SURFACE
      ?auto_25035 - SURFACE
    )
    :vars
    (
      ?auto_25037 - HOIST
      ?auto_25036 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25037 ?auto_25036 ) ( SURFACE-AT ?auto_25034 ?auto_25036 ) ( CLEAR ?auto_25034 ) ( LIFTING ?auto_25037 ?auto_25035 ) ( IS-CRATE ?auto_25035 ) ( not ( = ?auto_25034 ?auto_25035 ) ) ( ON ?auto_25033 ?auto_25032 ) ( ON ?auto_25034 ?auto_25033 ) ( not ( = ?auto_25032 ?auto_25033 ) ) ( not ( = ?auto_25032 ?auto_25034 ) ) ( not ( = ?auto_25032 ?auto_25035 ) ) ( not ( = ?auto_25033 ?auto_25034 ) ) ( not ( = ?auto_25033 ?auto_25035 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25034 ?auto_25035 )
      ( MAKE-3CRATE-VERIFY ?auto_25032 ?auto_25033 ?auto_25034 ?auto_25035 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25049 - SURFACE
      ?auto_25050 - SURFACE
      ?auto_25051 - SURFACE
      ?auto_25052 - SURFACE
    )
    :vars
    (
      ?auto_25055 - HOIST
      ?auto_25053 - PLACE
      ?auto_25054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25055 ?auto_25053 ) ( SURFACE-AT ?auto_25051 ?auto_25053 ) ( CLEAR ?auto_25051 ) ( IS-CRATE ?auto_25052 ) ( not ( = ?auto_25051 ?auto_25052 ) ) ( TRUCK-AT ?auto_25054 ?auto_25053 ) ( AVAILABLE ?auto_25055 ) ( IN ?auto_25052 ?auto_25054 ) ( ON ?auto_25051 ?auto_25050 ) ( not ( = ?auto_25050 ?auto_25051 ) ) ( not ( = ?auto_25050 ?auto_25052 ) ) ( ON ?auto_25050 ?auto_25049 ) ( not ( = ?auto_25049 ?auto_25050 ) ) ( not ( = ?auto_25049 ?auto_25051 ) ) ( not ( = ?auto_25049 ?auto_25052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25050 ?auto_25051 ?auto_25052 )
      ( MAKE-3CRATE-VERIFY ?auto_25049 ?auto_25050 ?auto_25051 ?auto_25052 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25070 - SURFACE
      ?auto_25071 - SURFACE
      ?auto_25072 - SURFACE
      ?auto_25073 - SURFACE
    )
    :vars
    (
      ?auto_25075 - HOIST
      ?auto_25074 - PLACE
      ?auto_25076 - TRUCK
      ?auto_25077 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25075 ?auto_25074 ) ( SURFACE-AT ?auto_25072 ?auto_25074 ) ( CLEAR ?auto_25072 ) ( IS-CRATE ?auto_25073 ) ( not ( = ?auto_25072 ?auto_25073 ) ) ( AVAILABLE ?auto_25075 ) ( IN ?auto_25073 ?auto_25076 ) ( ON ?auto_25072 ?auto_25071 ) ( not ( = ?auto_25071 ?auto_25072 ) ) ( not ( = ?auto_25071 ?auto_25073 ) ) ( TRUCK-AT ?auto_25076 ?auto_25077 ) ( not ( = ?auto_25077 ?auto_25074 ) ) ( ON ?auto_25071 ?auto_25070 ) ( not ( = ?auto_25070 ?auto_25071 ) ) ( not ( = ?auto_25070 ?auto_25072 ) ) ( not ( = ?auto_25070 ?auto_25073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25071 ?auto_25072 ?auto_25073 )
      ( MAKE-3CRATE-VERIFY ?auto_25070 ?auto_25071 ?auto_25072 ?auto_25073 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25094 - SURFACE
      ?auto_25095 - SURFACE
      ?auto_25096 - SURFACE
      ?auto_25097 - SURFACE
    )
    :vars
    (
      ?auto_25100 - HOIST
      ?auto_25098 - PLACE
      ?auto_25101 - TRUCK
      ?auto_25102 - PLACE
      ?auto_25099 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25100 ?auto_25098 ) ( SURFACE-AT ?auto_25096 ?auto_25098 ) ( CLEAR ?auto_25096 ) ( IS-CRATE ?auto_25097 ) ( not ( = ?auto_25096 ?auto_25097 ) ) ( AVAILABLE ?auto_25100 ) ( ON ?auto_25096 ?auto_25095 ) ( not ( = ?auto_25095 ?auto_25096 ) ) ( not ( = ?auto_25095 ?auto_25097 ) ) ( TRUCK-AT ?auto_25101 ?auto_25102 ) ( not ( = ?auto_25102 ?auto_25098 ) ) ( HOIST-AT ?auto_25099 ?auto_25102 ) ( LIFTING ?auto_25099 ?auto_25097 ) ( not ( = ?auto_25100 ?auto_25099 ) ) ( ON ?auto_25095 ?auto_25094 ) ( not ( = ?auto_25094 ?auto_25095 ) ) ( not ( = ?auto_25094 ?auto_25096 ) ) ( not ( = ?auto_25094 ?auto_25097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25095 ?auto_25096 ?auto_25097 )
      ( MAKE-3CRATE-VERIFY ?auto_25094 ?auto_25095 ?auto_25096 ?auto_25097 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25121 - SURFACE
      ?auto_25122 - SURFACE
      ?auto_25123 - SURFACE
      ?auto_25124 - SURFACE
    )
    :vars
    (
      ?auto_25126 - HOIST
      ?auto_25125 - PLACE
      ?auto_25129 - TRUCK
      ?auto_25128 - PLACE
      ?auto_25127 - HOIST
      ?auto_25130 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25126 ?auto_25125 ) ( SURFACE-AT ?auto_25123 ?auto_25125 ) ( CLEAR ?auto_25123 ) ( IS-CRATE ?auto_25124 ) ( not ( = ?auto_25123 ?auto_25124 ) ) ( AVAILABLE ?auto_25126 ) ( ON ?auto_25123 ?auto_25122 ) ( not ( = ?auto_25122 ?auto_25123 ) ) ( not ( = ?auto_25122 ?auto_25124 ) ) ( TRUCK-AT ?auto_25129 ?auto_25128 ) ( not ( = ?auto_25128 ?auto_25125 ) ) ( HOIST-AT ?auto_25127 ?auto_25128 ) ( not ( = ?auto_25126 ?auto_25127 ) ) ( AVAILABLE ?auto_25127 ) ( SURFACE-AT ?auto_25124 ?auto_25128 ) ( ON ?auto_25124 ?auto_25130 ) ( CLEAR ?auto_25124 ) ( not ( = ?auto_25123 ?auto_25130 ) ) ( not ( = ?auto_25124 ?auto_25130 ) ) ( not ( = ?auto_25122 ?auto_25130 ) ) ( ON ?auto_25122 ?auto_25121 ) ( not ( = ?auto_25121 ?auto_25122 ) ) ( not ( = ?auto_25121 ?auto_25123 ) ) ( not ( = ?auto_25121 ?auto_25124 ) ) ( not ( = ?auto_25121 ?auto_25130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25122 ?auto_25123 ?auto_25124 )
      ( MAKE-3CRATE-VERIFY ?auto_25121 ?auto_25122 ?auto_25123 ?auto_25124 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25149 - SURFACE
      ?auto_25150 - SURFACE
      ?auto_25151 - SURFACE
      ?auto_25152 - SURFACE
    )
    :vars
    (
      ?auto_25153 - HOIST
      ?auto_25154 - PLACE
      ?auto_25155 - PLACE
      ?auto_25156 - HOIST
      ?auto_25158 - SURFACE
      ?auto_25157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25153 ?auto_25154 ) ( SURFACE-AT ?auto_25151 ?auto_25154 ) ( CLEAR ?auto_25151 ) ( IS-CRATE ?auto_25152 ) ( not ( = ?auto_25151 ?auto_25152 ) ) ( AVAILABLE ?auto_25153 ) ( ON ?auto_25151 ?auto_25150 ) ( not ( = ?auto_25150 ?auto_25151 ) ) ( not ( = ?auto_25150 ?auto_25152 ) ) ( not ( = ?auto_25155 ?auto_25154 ) ) ( HOIST-AT ?auto_25156 ?auto_25155 ) ( not ( = ?auto_25153 ?auto_25156 ) ) ( AVAILABLE ?auto_25156 ) ( SURFACE-AT ?auto_25152 ?auto_25155 ) ( ON ?auto_25152 ?auto_25158 ) ( CLEAR ?auto_25152 ) ( not ( = ?auto_25151 ?auto_25158 ) ) ( not ( = ?auto_25152 ?auto_25158 ) ) ( not ( = ?auto_25150 ?auto_25158 ) ) ( TRUCK-AT ?auto_25157 ?auto_25154 ) ( ON ?auto_25150 ?auto_25149 ) ( not ( = ?auto_25149 ?auto_25150 ) ) ( not ( = ?auto_25149 ?auto_25151 ) ) ( not ( = ?auto_25149 ?auto_25152 ) ) ( not ( = ?auto_25149 ?auto_25158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25150 ?auto_25151 ?auto_25152 )
      ( MAKE-3CRATE-VERIFY ?auto_25149 ?auto_25150 ?auto_25151 ?auto_25152 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25177 - SURFACE
      ?auto_25178 - SURFACE
      ?auto_25179 - SURFACE
      ?auto_25180 - SURFACE
    )
    :vars
    (
      ?auto_25182 - HOIST
      ?auto_25185 - PLACE
      ?auto_25181 - PLACE
      ?auto_25183 - HOIST
      ?auto_25184 - SURFACE
      ?auto_25186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25182 ?auto_25185 ) ( IS-CRATE ?auto_25180 ) ( not ( = ?auto_25179 ?auto_25180 ) ) ( not ( = ?auto_25178 ?auto_25179 ) ) ( not ( = ?auto_25178 ?auto_25180 ) ) ( not ( = ?auto_25181 ?auto_25185 ) ) ( HOIST-AT ?auto_25183 ?auto_25181 ) ( not ( = ?auto_25182 ?auto_25183 ) ) ( AVAILABLE ?auto_25183 ) ( SURFACE-AT ?auto_25180 ?auto_25181 ) ( ON ?auto_25180 ?auto_25184 ) ( CLEAR ?auto_25180 ) ( not ( = ?auto_25179 ?auto_25184 ) ) ( not ( = ?auto_25180 ?auto_25184 ) ) ( not ( = ?auto_25178 ?auto_25184 ) ) ( TRUCK-AT ?auto_25186 ?auto_25185 ) ( SURFACE-AT ?auto_25178 ?auto_25185 ) ( CLEAR ?auto_25178 ) ( LIFTING ?auto_25182 ?auto_25179 ) ( IS-CRATE ?auto_25179 ) ( ON ?auto_25178 ?auto_25177 ) ( not ( = ?auto_25177 ?auto_25178 ) ) ( not ( = ?auto_25177 ?auto_25179 ) ) ( not ( = ?auto_25177 ?auto_25180 ) ) ( not ( = ?auto_25177 ?auto_25184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25178 ?auto_25179 ?auto_25180 )
      ( MAKE-3CRATE-VERIFY ?auto_25177 ?auto_25178 ?auto_25179 ?auto_25180 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25205 - SURFACE
      ?auto_25206 - SURFACE
      ?auto_25207 - SURFACE
      ?auto_25208 - SURFACE
    )
    :vars
    (
      ?auto_25211 - HOIST
      ?auto_25214 - PLACE
      ?auto_25213 - PLACE
      ?auto_25209 - HOIST
      ?auto_25212 - SURFACE
      ?auto_25210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25211 ?auto_25214 ) ( IS-CRATE ?auto_25208 ) ( not ( = ?auto_25207 ?auto_25208 ) ) ( not ( = ?auto_25206 ?auto_25207 ) ) ( not ( = ?auto_25206 ?auto_25208 ) ) ( not ( = ?auto_25213 ?auto_25214 ) ) ( HOIST-AT ?auto_25209 ?auto_25213 ) ( not ( = ?auto_25211 ?auto_25209 ) ) ( AVAILABLE ?auto_25209 ) ( SURFACE-AT ?auto_25208 ?auto_25213 ) ( ON ?auto_25208 ?auto_25212 ) ( CLEAR ?auto_25208 ) ( not ( = ?auto_25207 ?auto_25212 ) ) ( not ( = ?auto_25208 ?auto_25212 ) ) ( not ( = ?auto_25206 ?auto_25212 ) ) ( TRUCK-AT ?auto_25210 ?auto_25214 ) ( SURFACE-AT ?auto_25206 ?auto_25214 ) ( CLEAR ?auto_25206 ) ( IS-CRATE ?auto_25207 ) ( AVAILABLE ?auto_25211 ) ( IN ?auto_25207 ?auto_25210 ) ( ON ?auto_25206 ?auto_25205 ) ( not ( = ?auto_25205 ?auto_25206 ) ) ( not ( = ?auto_25205 ?auto_25207 ) ) ( not ( = ?auto_25205 ?auto_25208 ) ) ( not ( = ?auto_25205 ?auto_25212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25206 ?auto_25207 ?auto_25208 )
      ( MAKE-3CRATE-VERIFY ?auto_25205 ?auto_25206 ?auto_25207 ?auto_25208 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25233 - SURFACE
      ?auto_25234 - SURFACE
      ?auto_25235 - SURFACE
      ?auto_25236 - SURFACE
    )
    :vars
    (
      ?auto_25237 - HOIST
      ?auto_25242 - PLACE
      ?auto_25239 - PLACE
      ?auto_25240 - HOIST
      ?auto_25241 - SURFACE
      ?auto_25238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25237 ?auto_25242 ) ( IS-CRATE ?auto_25236 ) ( not ( = ?auto_25235 ?auto_25236 ) ) ( not ( = ?auto_25234 ?auto_25235 ) ) ( not ( = ?auto_25234 ?auto_25236 ) ) ( not ( = ?auto_25239 ?auto_25242 ) ) ( HOIST-AT ?auto_25240 ?auto_25239 ) ( not ( = ?auto_25237 ?auto_25240 ) ) ( AVAILABLE ?auto_25240 ) ( SURFACE-AT ?auto_25236 ?auto_25239 ) ( ON ?auto_25236 ?auto_25241 ) ( CLEAR ?auto_25236 ) ( not ( = ?auto_25235 ?auto_25241 ) ) ( not ( = ?auto_25236 ?auto_25241 ) ) ( not ( = ?auto_25234 ?auto_25241 ) ) ( SURFACE-AT ?auto_25234 ?auto_25242 ) ( CLEAR ?auto_25234 ) ( IS-CRATE ?auto_25235 ) ( AVAILABLE ?auto_25237 ) ( IN ?auto_25235 ?auto_25238 ) ( TRUCK-AT ?auto_25238 ?auto_25239 ) ( ON ?auto_25234 ?auto_25233 ) ( not ( = ?auto_25233 ?auto_25234 ) ) ( not ( = ?auto_25233 ?auto_25235 ) ) ( not ( = ?auto_25233 ?auto_25236 ) ) ( not ( = ?auto_25233 ?auto_25241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25234 ?auto_25235 ?auto_25236 )
      ( MAKE-3CRATE-VERIFY ?auto_25233 ?auto_25234 ?auto_25235 ?auto_25236 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25261 - SURFACE
      ?auto_25262 - SURFACE
      ?auto_25263 - SURFACE
      ?auto_25264 - SURFACE
    )
    :vars
    (
      ?auto_25268 - HOIST
      ?auto_25270 - PLACE
      ?auto_25266 - PLACE
      ?auto_25265 - HOIST
      ?auto_25269 - SURFACE
      ?auto_25267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25268 ?auto_25270 ) ( IS-CRATE ?auto_25264 ) ( not ( = ?auto_25263 ?auto_25264 ) ) ( not ( = ?auto_25262 ?auto_25263 ) ) ( not ( = ?auto_25262 ?auto_25264 ) ) ( not ( = ?auto_25266 ?auto_25270 ) ) ( HOIST-AT ?auto_25265 ?auto_25266 ) ( not ( = ?auto_25268 ?auto_25265 ) ) ( SURFACE-AT ?auto_25264 ?auto_25266 ) ( ON ?auto_25264 ?auto_25269 ) ( CLEAR ?auto_25264 ) ( not ( = ?auto_25263 ?auto_25269 ) ) ( not ( = ?auto_25264 ?auto_25269 ) ) ( not ( = ?auto_25262 ?auto_25269 ) ) ( SURFACE-AT ?auto_25262 ?auto_25270 ) ( CLEAR ?auto_25262 ) ( IS-CRATE ?auto_25263 ) ( AVAILABLE ?auto_25268 ) ( TRUCK-AT ?auto_25267 ?auto_25266 ) ( LIFTING ?auto_25265 ?auto_25263 ) ( ON ?auto_25262 ?auto_25261 ) ( not ( = ?auto_25261 ?auto_25262 ) ) ( not ( = ?auto_25261 ?auto_25263 ) ) ( not ( = ?auto_25261 ?auto_25264 ) ) ( not ( = ?auto_25261 ?auto_25269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25262 ?auto_25263 ?auto_25264 )
      ( MAKE-3CRATE-VERIFY ?auto_25261 ?auto_25262 ?auto_25263 ?auto_25264 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25291 - SURFACE
      ?auto_25292 - SURFACE
      ?auto_25293 - SURFACE
      ?auto_25294 - SURFACE
    )
    :vars
    (
      ?auto_25296 - HOIST
      ?auto_25301 - PLACE
      ?auto_25298 - PLACE
      ?auto_25300 - HOIST
      ?auto_25299 - SURFACE
      ?auto_25295 - TRUCK
      ?auto_25297 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25296 ?auto_25301 ) ( IS-CRATE ?auto_25294 ) ( not ( = ?auto_25293 ?auto_25294 ) ) ( not ( = ?auto_25292 ?auto_25293 ) ) ( not ( = ?auto_25292 ?auto_25294 ) ) ( not ( = ?auto_25298 ?auto_25301 ) ) ( HOIST-AT ?auto_25300 ?auto_25298 ) ( not ( = ?auto_25296 ?auto_25300 ) ) ( SURFACE-AT ?auto_25294 ?auto_25298 ) ( ON ?auto_25294 ?auto_25299 ) ( CLEAR ?auto_25294 ) ( not ( = ?auto_25293 ?auto_25299 ) ) ( not ( = ?auto_25294 ?auto_25299 ) ) ( not ( = ?auto_25292 ?auto_25299 ) ) ( SURFACE-AT ?auto_25292 ?auto_25301 ) ( CLEAR ?auto_25292 ) ( IS-CRATE ?auto_25293 ) ( AVAILABLE ?auto_25296 ) ( TRUCK-AT ?auto_25295 ?auto_25298 ) ( AVAILABLE ?auto_25300 ) ( SURFACE-AT ?auto_25293 ?auto_25298 ) ( ON ?auto_25293 ?auto_25297 ) ( CLEAR ?auto_25293 ) ( not ( = ?auto_25293 ?auto_25297 ) ) ( not ( = ?auto_25294 ?auto_25297 ) ) ( not ( = ?auto_25292 ?auto_25297 ) ) ( not ( = ?auto_25299 ?auto_25297 ) ) ( ON ?auto_25292 ?auto_25291 ) ( not ( = ?auto_25291 ?auto_25292 ) ) ( not ( = ?auto_25291 ?auto_25293 ) ) ( not ( = ?auto_25291 ?auto_25294 ) ) ( not ( = ?auto_25291 ?auto_25299 ) ) ( not ( = ?auto_25291 ?auto_25297 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25292 ?auto_25293 ?auto_25294 )
      ( MAKE-3CRATE-VERIFY ?auto_25291 ?auto_25292 ?auto_25293 ?auto_25294 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25322 - SURFACE
      ?auto_25323 - SURFACE
      ?auto_25324 - SURFACE
      ?auto_25325 - SURFACE
    )
    :vars
    (
      ?auto_25332 - HOIST
      ?auto_25327 - PLACE
      ?auto_25330 - PLACE
      ?auto_25326 - HOIST
      ?auto_25331 - SURFACE
      ?auto_25328 - SURFACE
      ?auto_25329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25332 ?auto_25327 ) ( IS-CRATE ?auto_25325 ) ( not ( = ?auto_25324 ?auto_25325 ) ) ( not ( = ?auto_25323 ?auto_25324 ) ) ( not ( = ?auto_25323 ?auto_25325 ) ) ( not ( = ?auto_25330 ?auto_25327 ) ) ( HOIST-AT ?auto_25326 ?auto_25330 ) ( not ( = ?auto_25332 ?auto_25326 ) ) ( SURFACE-AT ?auto_25325 ?auto_25330 ) ( ON ?auto_25325 ?auto_25331 ) ( CLEAR ?auto_25325 ) ( not ( = ?auto_25324 ?auto_25331 ) ) ( not ( = ?auto_25325 ?auto_25331 ) ) ( not ( = ?auto_25323 ?auto_25331 ) ) ( SURFACE-AT ?auto_25323 ?auto_25327 ) ( CLEAR ?auto_25323 ) ( IS-CRATE ?auto_25324 ) ( AVAILABLE ?auto_25332 ) ( AVAILABLE ?auto_25326 ) ( SURFACE-AT ?auto_25324 ?auto_25330 ) ( ON ?auto_25324 ?auto_25328 ) ( CLEAR ?auto_25324 ) ( not ( = ?auto_25324 ?auto_25328 ) ) ( not ( = ?auto_25325 ?auto_25328 ) ) ( not ( = ?auto_25323 ?auto_25328 ) ) ( not ( = ?auto_25331 ?auto_25328 ) ) ( TRUCK-AT ?auto_25329 ?auto_25327 ) ( ON ?auto_25323 ?auto_25322 ) ( not ( = ?auto_25322 ?auto_25323 ) ) ( not ( = ?auto_25322 ?auto_25324 ) ) ( not ( = ?auto_25322 ?auto_25325 ) ) ( not ( = ?auto_25322 ?auto_25331 ) ) ( not ( = ?auto_25322 ?auto_25328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25323 ?auto_25324 ?auto_25325 )
      ( MAKE-3CRATE-VERIFY ?auto_25322 ?auto_25323 ?auto_25324 ?auto_25325 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25333 - SURFACE
      ?auto_25334 - SURFACE
    )
    :vars
    (
      ?auto_25342 - HOIST
      ?auto_25336 - PLACE
      ?auto_25341 - SURFACE
      ?auto_25339 - PLACE
      ?auto_25335 - HOIST
      ?auto_25340 - SURFACE
      ?auto_25337 - SURFACE
      ?auto_25338 - TRUCK
      ?auto_25343 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25342 ?auto_25336 ) ( IS-CRATE ?auto_25334 ) ( not ( = ?auto_25333 ?auto_25334 ) ) ( not ( = ?auto_25341 ?auto_25333 ) ) ( not ( = ?auto_25341 ?auto_25334 ) ) ( not ( = ?auto_25339 ?auto_25336 ) ) ( HOIST-AT ?auto_25335 ?auto_25339 ) ( not ( = ?auto_25342 ?auto_25335 ) ) ( SURFACE-AT ?auto_25334 ?auto_25339 ) ( ON ?auto_25334 ?auto_25340 ) ( CLEAR ?auto_25334 ) ( not ( = ?auto_25333 ?auto_25340 ) ) ( not ( = ?auto_25334 ?auto_25340 ) ) ( not ( = ?auto_25341 ?auto_25340 ) ) ( IS-CRATE ?auto_25333 ) ( AVAILABLE ?auto_25335 ) ( SURFACE-AT ?auto_25333 ?auto_25339 ) ( ON ?auto_25333 ?auto_25337 ) ( CLEAR ?auto_25333 ) ( not ( = ?auto_25333 ?auto_25337 ) ) ( not ( = ?auto_25334 ?auto_25337 ) ) ( not ( = ?auto_25341 ?auto_25337 ) ) ( not ( = ?auto_25340 ?auto_25337 ) ) ( TRUCK-AT ?auto_25338 ?auto_25336 ) ( SURFACE-AT ?auto_25343 ?auto_25336 ) ( CLEAR ?auto_25343 ) ( LIFTING ?auto_25342 ?auto_25341 ) ( IS-CRATE ?auto_25341 ) ( not ( = ?auto_25343 ?auto_25341 ) ) ( not ( = ?auto_25333 ?auto_25343 ) ) ( not ( = ?auto_25334 ?auto_25343 ) ) ( not ( = ?auto_25340 ?auto_25343 ) ) ( not ( = ?auto_25337 ?auto_25343 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25343 ?auto_25341 )
      ( MAKE-2CRATE ?auto_25341 ?auto_25333 ?auto_25334 )
      ( MAKE-1CRATE-VERIFY ?auto_25333 ?auto_25334 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25344 - SURFACE
      ?auto_25345 - SURFACE
      ?auto_25346 - SURFACE
    )
    :vars
    (
      ?auto_25354 - HOIST
      ?auto_25350 - PLACE
      ?auto_25348 - PLACE
      ?auto_25352 - HOIST
      ?auto_25347 - SURFACE
      ?auto_25351 - SURFACE
      ?auto_25349 - TRUCK
      ?auto_25353 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25354 ?auto_25350 ) ( IS-CRATE ?auto_25346 ) ( not ( = ?auto_25345 ?auto_25346 ) ) ( not ( = ?auto_25344 ?auto_25345 ) ) ( not ( = ?auto_25344 ?auto_25346 ) ) ( not ( = ?auto_25348 ?auto_25350 ) ) ( HOIST-AT ?auto_25352 ?auto_25348 ) ( not ( = ?auto_25354 ?auto_25352 ) ) ( SURFACE-AT ?auto_25346 ?auto_25348 ) ( ON ?auto_25346 ?auto_25347 ) ( CLEAR ?auto_25346 ) ( not ( = ?auto_25345 ?auto_25347 ) ) ( not ( = ?auto_25346 ?auto_25347 ) ) ( not ( = ?auto_25344 ?auto_25347 ) ) ( IS-CRATE ?auto_25345 ) ( AVAILABLE ?auto_25352 ) ( SURFACE-AT ?auto_25345 ?auto_25348 ) ( ON ?auto_25345 ?auto_25351 ) ( CLEAR ?auto_25345 ) ( not ( = ?auto_25345 ?auto_25351 ) ) ( not ( = ?auto_25346 ?auto_25351 ) ) ( not ( = ?auto_25344 ?auto_25351 ) ) ( not ( = ?auto_25347 ?auto_25351 ) ) ( TRUCK-AT ?auto_25349 ?auto_25350 ) ( SURFACE-AT ?auto_25353 ?auto_25350 ) ( CLEAR ?auto_25353 ) ( LIFTING ?auto_25354 ?auto_25344 ) ( IS-CRATE ?auto_25344 ) ( not ( = ?auto_25353 ?auto_25344 ) ) ( not ( = ?auto_25345 ?auto_25353 ) ) ( not ( = ?auto_25346 ?auto_25353 ) ) ( not ( = ?auto_25347 ?auto_25353 ) ) ( not ( = ?auto_25351 ?auto_25353 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25345 ?auto_25346 )
      ( MAKE-2CRATE-VERIFY ?auto_25344 ?auto_25345 ?auto_25346 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25355 - SURFACE
      ?auto_25356 - SURFACE
      ?auto_25357 - SURFACE
      ?auto_25358 - SURFACE
    )
    :vars
    (
      ?auto_25365 - HOIST
      ?auto_25362 - PLACE
      ?auto_25363 - PLACE
      ?auto_25360 - HOIST
      ?auto_25361 - SURFACE
      ?auto_25359 - SURFACE
      ?auto_25364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25365 ?auto_25362 ) ( IS-CRATE ?auto_25358 ) ( not ( = ?auto_25357 ?auto_25358 ) ) ( not ( = ?auto_25356 ?auto_25357 ) ) ( not ( = ?auto_25356 ?auto_25358 ) ) ( not ( = ?auto_25363 ?auto_25362 ) ) ( HOIST-AT ?auto_25360 ?auto_25363 ) ( not ( = ?auto_25365 ?auto_25360 ) ) ( SURFACE-AT ?auto_25358 ?auto_25363 ) ( ON ?auto_25358 ?auto_25361 ) ( CLEAR ?auto_25358 ) ( not ( = ?auto_25357 ?auto_25361 ) ) ( not ( = ?auto_25358 ?auto_25361 ) ) ( not ( = ?auto_25356 ?auto_25361 ) ) ( IS-CRATE ?auto_25357 ) ( AVAILABLE ?auto_25360 ) ( SURFACE-AT ?auto_25357 ?auto_25363 ) ( ON ?auto_25357 ?auto_25359 ) ( CLEAR ?auto_25357 ) ( not ( = ?auto_25357 ?auto_25359 ) ) ( not ( = ?auto_25358 ?auto_25359 ) ) ( not ( = ?auto_25356 ?auto_25359 ) ) ( not ( = ?auto_25361 ?auto_25359 ) ) ( TRUCK-AT ?auto_25364 ?auto_25362 ) ( SURFACE-AT ?auto_25355 ?auto_25362 ) ( CLEAR ?auto_25355 ) ( LIFTING ?auto_25365 ?auto_25356 ) ( IS-CRATE ?auto_25356 ) ( not ( = ?auto_25355 ?auto_25356 ) ) ( not ( = ?auto_25357 ?auto_25355 ) ) ( not ( = ?auto_25358 ?auto_25355 ) ) ( not ( = ?auto_25361 ?auto_25355 ) ) ( not ( = ?auto_25359 ?auto_25355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25356 ?auto_25357 ?auto_25358 )
      ( MAKE-3CRATE-VERIFY ?auto_25355 ?auto_25356 ?auto_25357 ?auto_25358 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25415 - SURFACE
      ?auto_25416 - SURFACE
    )
    :vars
    (
      ?auto_25418 - HOIST
      ?auto_25422 - PLACE
      ?auto_25421 - SURFACE
      ?auto_25424 - PLACE
      ?auto_25423 - HOIST
      ?auto_25420 - SURFACE
      ?auto_25419 - TRUCK
      ?auto_25417 - SURFACE
      ?auto_25425 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25418 ?auto_25422 ) ( IS-CRATE ?auto_25416 ) ( not ( = ?auto_25415 ?auto_25416 ) ) ( not ( = ?auto_25421 ?auto_25415 ) ) ( not ( = ?auto_25421 ?auto_25416 ) ) ( not ( = ?auto_25424 ?auto_25422 ) ) ( HOIST-AT ?auto_25423 ?auto_25424 ) ( not ( = ?auto_25418 ?auto_25423 ) ) ( SURFACE-AT ?auto_25416 ?auto_25424 ) ( ON ?auto_25416 ?auto_25420 ) ( CLEAR ?auto_25416 ) ( not ( = ?auto_25415 ?auto_25420 ) ) ( not ( = ?auto_25416 ?auto_25420 ) ) ( not ( = ?auto_25421 ?auto_25420 ) ) ( SURFACE-AT ?auto_25421 ?auto_25422 ) ( CLEAR ?auto_25421 ) ( IS-CRATE ?auto_25415 ) ( AVAILABLE ?auto_25418 ) ( TRUCK-AT ?auto_25419 ?auto_25424 ) ( SURFACE-AT ?auto_25415 ?auto_25424 ) ( ON ?auto_25415 ?auto_25417 ) ( CLEAR ?auto_25415 ) ( not ( = ?auto_25415 ?auto_25417 ) ) ( not ( = ?auto_25416 ?auto_25417 ) ) ( not ( = ?auto_25421 ?auto_25417 ) ) ( not ( = ?auto_25420 ?auto_25417 ) ) ( LIFTING ?auto_25423 ?auto_25425 ) ( IS-CRATE ?auto_25425 ) ( not ( = ?auto_25415 ?auto_25425 ) ) ( not ( = ?auto_25416 ?auto_25425 ) ) ( not ( = ?auto_25421 ?auto_25425 ) ) ( not ( = ?auto_25420 ?auto_25425 ) ) ( not ( = ?auto_25417 ?auto_25425 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25423 ?auto_25425 ?auto_25419 ?auto_25424 )
      ( MAKE-1CRATE ?auto_25415 ?auto_25416 )
      ( MAKE-1CRATE-VERIFY ?auto_25415 ?auto_25416 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25527 - SURFACE
      ?auto_25528 - SURFACE
      ?auto_25529 - SURFACE
      ?auto_25530 - SURFACE
      ?auto_25531 - SURFACE
    )
    :vars
    (
      ?auto_25533 - HOIST
      ?auto_25532 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25533 ?auto_25532 ) ( SURFACE-AT ?auto_25530 ?auto_25532 ) ( CLEAR ?auto_25530 ) ( LIFTING ?auto_25533 ?auto_25531 ) ( IS-CRATE ?auto_25531 ) ( not ( = ?auto_25530 ?auto_25531 ) ) ( ON ?auto_25528 ?auto_25527 ) ( ON ?auto_25529 ?auto_25528 ) ( ON ?auto_25530 ?auto_25529 ) ( not ( = ?auto_25527 ?auto_25528 ) ) ( not ( = ?auto_25527 ?auto_25529 ) ) ( not ( = ?auto_25527 ?auto_25530 ) ) ( not ( = ?auto_25527 ?auto_25531 ) ) ( not ( = ?auto_25528 ?auto_25529 ) ) ( not ( = ?auto_25528 ?auto_25530 ) ) ( not ( = ?auto_25528 ?auto_25531 ) ) ( not ( = ?auto_25529 ?auto_25530 ) ) ( not ( = ?auto_25529 ?auto_25531 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25530 ?auto_25531 )
      ( MAKE-4CRATE-VERIFY ?auto_25527 ?auto_25528 ?auto_25529 ?auto_25530 ?auto_25531 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25552 - SURFACE
      ?auto_25553 - SURFACE
      ?auto_25554 - SURFACE
      ?auto_25555 - SURFACE
      ?auto_25556 - SURFACE
    )
    :vars
    (
      ?auto_25557 - HOIST
      ?auto_25559 - PLACE
      ?auto_25558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25557 ?auto_25559 ) ( SURFACE-AT ?auto_25555 ?auto_25559 ) ( CLEAR ?auto_25555 ) ( IS-CRATE ?auto_25556 ) ( not ( = ?auto_25555 ?auto_25556 ) ) ( TRUCK-AT ?auto_25558 ?auto_25559 ) ( AVAILABLE ?auto_25557 ) ( IN ?auto_25556 ?auto_25558 ) ( ON ?auto_25555 ?auto_25554 ) ( not ( = ?auto_25554 ?auto_25555 ) ) ( not ( = ?auto_25554 ?auto_25556 ) ) ( ON ?auto_25553 ?auto_25552 ) ( ON ?auto_25554 ?auto_25553 ) ( not ( = ?auto_25552 ?auto_25553 ) ) ( not ( = ?auto_25552 ?auto_25554 ) ) ( not ( = ?auto_25552 ?auto_25555 ) ) ( not ( = ?auto_25552 ?auto_25556 ) ) ( not ( = ?auto_25553 ?auto_25554 ) ) ( not ( = ?auto_25553 ?auto_25555 ) ) ( not ( = ?auto_25553 ?auto_25556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25554 ?auto_25555 ?auto_25556 )
      ( MAKE-4CRATE-VERIFY ?auto_25552 ?auto_25553 ?auto_25554 ?auto_25555 ?auto_25556 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25582 - SURFACE
      ?auto_25583 - SURFACE
      ?auto_25584 - SURFACE
      ?auto_25585 - SURFACE
      ?auto_25586 - SURFACE
    )
    :vars
    (
      ?auto_25590 - HOIST
      ?auto_25589 - PLACE
      ?auto_25587 - TRUCK
      ?auto_25588 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25590 ?auto_25589 ) ( SURFACE-AT ?auto_25585 ?auto_25589 ) ( CLEAR ?auto_25585 ) ( IS-CRATE ?auto_25586 ) ( not ( = ?auto_25585 ?auto_25586 ) ) ( AVAILABLE ?auto_25590 ) ( IN ?auto_25586 ?auto_25587 ) ( ON ?auto_25585 ?auto_25584 ) ( not ( = ?auto_25584 ?auto_25585 ) ) ( not ( = ?auto_25584 ?auto_25586 ) ) ( TRUCK-AT ?auto_25587 ?auto_25588 ) ( not ( = ?auto_25588 ?auto_25589 ) ) ( ON ?auto_25583 ?auto_25582 ) ( ON ?auto_25584 ?auto_25583 ) ( not ( = ?auto_25582 ?auto_25583 ) ) ( not ( = ?auto_25582 ?auto_25584 ) ) ( not ( = ?auto_25582 ?auto_25585 ) ) ( not ( = ?auto_25582 ?auto_25586 ) ) ( not ( = ?auto_25583 ?auto_25584 ) ) ( not ( = ?auto_25583 ?auto_25585 ) ) ( not ( = ?auto_25583 ?auto_25586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25584 ?auto_25585 ?auto_25586 )
      ( MAKE-4CRATE-VERIFY ?auto_25582 ?auto_25583 ?auto_25584 ?auto_25585 ?auto_25586 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25616 - SURFACE
      ?auto_25617 - SURFACE
      ?auto_25618 - SURFACE
      ?auto_25619 - SURFACE
      ?auto_25620 - SURFACE
    )
    :vars
    (
      ?auto_25623 - HOIST
      ?auto_25621 - PLACE
      ?auto_25622 - TRUCK
      ?auto_25625 - PLACE
      ?auto_25624 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25623 ?auto_25621 ) ( SURFACE-AT ?auto_25619 ?auto_25621 ) ( CLEAR ?auto_25619 ) ( IS-CRATE ?auto_25620 ) ( not ( = ?auto_25619 ?auto_25620 ) ) ( AVAILABLE ?auto_25623 ) ( ON ?auto_25619 ?auto_25618 ) ( not ( = ?auto_25618 ?auto_25619 ) ) ( not ( = ?auto_25618 ?auto_25620 ) ) ( TRUCK-AT ?auto_25622 ?auto_25625 ) ( not ( = ?auto_25625 ?auto_25621 ) ) ( HOIST-AT ?auto_25624 ?auto_25625 ) ( LIFTING ?auto_25624 ?auto_25620 ) ( not ( = ?auto_25623 ?auto_25624 ) ) ( ON ?auto_25617 ?auto_25616 ) ( ON ?auto_25618 ?auto_25617 ) ( not ( = ?auto_25616 ?auto_25617 ) ) ( not ( = ?auto_25616 ?auto_25618 ) ) ( not ( = ?auto_25616 ?auto_25619 ) ) ( not ( = ?auto_25616 ?auto_25620 ) ) ( not ( = ?auto_25617 ?auto_25618 ) ) ( not ( = ?auto_25617 ?auto_25619 ) ) ( not ( = ?auto_25617 ?auto_25620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25618 ?auto_25619 ?auto_25620 )
      ( MAKE-4CRATE-VERIFY ?auto_25616 ?auto_25617 ?auto_25618 ?auto_25619 ?auto_25620 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25654 - SURFACE
      ?auto_25655 - SURFACE
      ?auto_25656 - SURFACE
      ?auto_25657 - SURFACE
      ?auto_25658 - SURFACE
    )
    :vars
    (
      ?auto_25661 - HOIST
      ?auto_25659 - PLACE
      ?auto_25664 - TRUCK
      ?auto_25660 - PLACE
      ?auto_25663 - HOIST
      ?auto_25662 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25661 ?auto_25659 ) ( SURFACE-AT ?auto_25657 ?auto_25659 ) ( CLEAR ?auto_25657 ) ( IS-CRATE ?auto_25658 ) ( not ( = ?auto_25657 ?auto_25658 ) ) ( AVAILABLE ?auto_25661 ) ( ON ?auto_25657 ?auto_25656 ) ( not ( = ?auto_25656 ?auto_25657 ) ) ( not ( = ?auto_25656 ?auto_25658 ) ) ( TRUCK-AT ?auto_25664 ?auto_25660 ) ( not ( = ?auto_25660 ?auto_25659 ) ) ( HOIST-AT ?auto_25663 ?auto_25660 ) ( not ( = ?auto_25661 ?auto_25663 ) ) ( AVAILABLE ?auto_25663 ) ( SURFACE-AT ?auto_25658 ?auto_25660 ) ( ON ?auto_25658 ?auto_25662 ) ( CLEAR ?auto_25658 ) ( not ( = ?auto_25657 ?auto_25662 ) ) ( not ( = ?auto_25658 ?auto_25662 ) ) ( not ( = ?auto_25656 ?auto_25662 ) ) ( ON ?auto_25655 ?auto_25654 ) ( ON ?auto_25656 ?auto_25655 ) ( not ( = ?auto_25654 ?auto_25655 ) ) ( not ( = ?auto_25654 ?auto_25656 ) ) ( not ( = ?auto_25654 ?auto_25657 ) ) ( not ( = ?auto_25654 ?auto_25658 ) ) ( not ( = ?auto_25654 ?auto_25662 ) ) ( not ( = ?auto_25655 ?auto_25656 ) ) ( not ( = ?auto_25655 ?auto_25657 ) ) ( not ( = ?auto_25655 ?auto_25658 ) ) ( not ( = ?auto_25655 ?auto_25662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25656 ?auto_25657 ?auto_25658 )
      ( MAKE-4CRATE-VERIFY ?auto_25654 ?auto_25655 ?auto_25656 ?auto_25657 ?auto_25658 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25693 - SURFACE
      ?auto_25694 - SURFACE
      ?auto_25695 - SURFACE
      ?auto_25696 - SURFACE
      ?auto_25697 - SURFACE
    )
    :vars
    (
      ?auto_25699 - HOIST
      ?auto_25700 - PLACE
      ?auto_25702 - PLACE
      ?auto_25701 - HOIST
      ?auto_25698 - SURFACE
      ?auto_25703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25699 ?auto_25700 ) ( SURFACE-AT ?auto_25696 ?auto_25700 ) ( CLEAR ?auto_25696 ) ( IS-CRATE ?auto_25697 ) ( not ( = ?auto_25696 ?auto_25697 ) ) ( AVAILABLE ?auto_25699 ) ( ON ?auto_25696 ?auto_25695 ) ( not ( = ?auto_25695 ?auto_25696 ) ) ( not ( = ?auto_25695 ?auto_25697 ) ) ( not ( = ?auto_25702 ?auto_25700 ) ) ( HOIST-AT ?auto_25701 ?auto_25702 ) ( not ( = ?auto_25699 ?auto_25701 ) ) ( AVAILABLE ?auto_25701 ) ( SURFACE-AT ?auto_25697 ?auto_25702 ) ( ON ?auto_25697 ?auto_25698 ) ( CLEAR ?auto_25697 ) ( not ( = ?auto_25696 ?auto_25698 ) ) ( not ( = ?auto_25697 ?auto_25698 ) ) ( not ( = ?auto_25695 ?auto_25698 ) ) ( TRUCK-AT ?auto_25703 ?auto_25700 ) ( ON ?auto_25694 ?auto_25693 ) ( ON ?auto_25695 ?auto_25694 ) ( not ( = ?auto_25693 ?auto_25694 ) ) ( not ( = ?auto_25693 ?auto_25695 ) ) ( not ( = ?auto_25693 ?auto_25696 ) ) ( not ( = ?auto_25693 ?auto_25697 ) ) ( not ( = ?auto_25693 ?auto_25698 ) ) ( not ( = ?auto_25694 ?auto_25695 ) ) ( not ( = ?auto_25694 ?auto_25696 ) ) ( not ( = ?auto_25694 ?auto_25697 ) ) ( not ( = ?auto_25694 ?auto_25698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25695 ?auto_25696 ?auto_25697 )
      ( MAKE-4CRATE-VERIFY ?auto_25693 ?auto_25694 ?auto_25695 ?auto_25696 ?auto_25697 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25732 - SURFACE
      ?auto_25733 - SURFACE
      ?auto_25734 - SURFACE
      ?auto_25735 - SURFACE
      ?auto_25736 - SURFACE
    )
    :vars
    (
      ?auto_25739 - HOIST
      ?auto_25737 - PLACE
      ?auto_25738 - PLACE
      ?auto_25740 - HOIST
      ?auto_25741 - SURFACE
      ?auto_25742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25739 ?auto_25737 ) ( IS-CRATE ?auto_25736 ) ( not ( = ?auto_25735 ?auto_25736 ) ) ( not ( = ?auto_25734 ?auto_25735 ) ) ( not ( = ?auto_25734 ?auto_25736 ) ) ( not ( = ?auto_25738 ?auto_25737 ) ) ( HOIST-AT ?auto_25740 ?auto_25738 ) ( not ( = ?auto_25739 ?auto_25740 ) ) ( AVAILABLE ?auto_25740 ) ( SURFACE-AT ?auto_25736 ?auto_25738 ) ( ON ?auto_25736 ?auto_25741 ) ( CLEAR ?auto_25736 ) ( not ( = ?auto_25735 ?auto_25741 ) ) ( not ( = ?auto_25736 ?auto_25741 ) ) ( not ( = ?auto_25734 ?auto_25741 ) ) ( TRUCK-AT ?auto_25742 ?auto_25737 ) ( SURFACE-AT ?auto_25734 ?auto_25737 ) ( CLEAR ?auto_25734 ) ( LIFTING ?auto_25739 ?auto_25735 ) ( IS-CRATE ?auto_25735 ) ( ON ?auto_25733 ?auto_25732 ) ( ON ?auto_25734 ?auto_25733 ) ( not ( = ?auto_25732 ?auto_25733 ) ) ( not ( = ?auto_25732 ?auto_25734 ) ) ( not ( = ?auto_25732 ?auto_25735 ) ) ( not ( = ?auto_25732 ?auto_25736 ) ) ( not ( = ?auto_25732 ?auto_25741 ) ) ( not ( = ?auto_25733 ?auto_25734 ) ) ( not ( = ?auto_25733 ?auto_25735 ) ) ( not ( = ?auto_25733 ?auto_25736 ) ) ( not ( = ?auto_25733 ?auto_25741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25734 ?auto_25735 ?auto_25736 )
      ( MAKE-4CRATE-VERIFY ?auto_25732 ?auto_25733 ?auto_25734 ?auto_25735 ?auto_25736 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25771 - SURFACE
      ?auto_25772 - SURFACE
      ?auto_25773 - SURFACE
      ?auto_25774 - SURFACE
      ?auto_25775 - SURFACE
    )
    :vars
    (
      ?auto_25779 - HOIST
      ?auto_25778 - PLACE
      ?auto_25777 - PLACE
      ?auto_25780 - HOIST
      ?auto_25776 - SURFACE
      ?auto_25781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25779 ?auto_25778 ) ( IS-CRATE ?auto_25775 ) ( not ( = ?auto_25774 ?auto_25775 ) ) ( not ( = ?auto_25773 ?auto_25774 ) ) ( not ( = ?auto_25773 ?auto_25775 ) ) ( not ( = ?auto_25777 ?auto_25778 ) ) ( HOIST-AT ?auto_25780 ?auto_25777 ) ( not ( = ?auto_25779 ?auto_25780 ) ) ( AVAILABLE ?auto_25780 ) ( SURFACE-AT ?auto_25775 ?auto_25777 ) ( ON ?auto_25775 ?auto_25776 ) ( CLEAR ?auto_25775 ) ( not ( = ?auto_25774 ?auto_25776 ) ) ( not ( = ?auto_25775 ?auto_25776 ) ) ( not ( = ?auto_25773 ?auto_25776 ) ) ( TRUCK-AT ?auto_25781 ?auto_25778 ) ( SURFACE-AT ?auto_25773 ?auto_25778 ) ( CLEAR ?auto_25773 ) ( IS-CRATE ?auto_25774 ) ( AVAILABLE ?auto_25779 ) ( IN ?auto_25774 ?auto_25781 ) ( ON ?auto_25772 ?auto_25771 ) ( ON ?auto_25773 ?auto_25772 ) ( not ( = ?auto_25771 ?auto_25772 ) ) ( not ( = ?auto_25771 ?auto_25773 ) ) ( not ( = ?auto_25771 ?auto_25774 ) ) ( not ( = ?auto_25771 ?auto_25775 ) ) ( not ( = ?auto_25771 ?auto_25776 ) ) ( not ( = ?auto_25772 ?auto_25773 ) ) ( not ( = ?auto_25772 ?auto_25774 ) ) ( not ( = ?auto_25772 ?auto_25775 ) ) ( not ( = ?auto_25772 ?auto_25776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25773 ?auto_25774 ?auto_25775 )
      ( MAKE-4CRATE-VERIFY ?auto_25771 ?auto_25772 ?auto_25773 ?auto_25774 ?auto_25775 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25887 - SURFACE
      ?auto_25888 - SURFACE
    )
    :vars
    (
      ?auto_25895 - HOIST
      ?auto_25894 - PLACE
      ?auto_25891 - SURFACE
      ?auto_25892 - PLACE
      ?auto_25890 - HOIST
      ?auto_25889 - SURFACE
      ?auto_25893 - TRUCK
      ?auto_25896 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25895 ?auto_25894 ) ( SURFACE-AT ?auto_25887 ?auto_25894 ) ( CLEAR ?auto_25887 ) ( IS-CRATE ?auto_25888 ) ( not ( = ?auto_25887 ?auto_25888 ) ) ( AVAILABLE ?auto_25895 ) ( ON ?auto_25887 ?auto_25891 ) ( not ( = ?auto_25891 ?auto_25887 ) ) ( not ( = ?auto_25891 ?auto_25888 ) ) ( not ( = ?auto_25892 ?auto_25894 ) ) ( HOIST-AT ?auto_25890 ?auto_25892 ) ( not ( = ?auto_25895 ?auto_25890 ) ) ( AVAILABLE ?auto_25890 ) ( SURFACE-AT ?auto_25888 ?auto_25892 ) ( ON ?auto_25888 ?auto_25889 ) ( CLEAR ?auto_25888 ) ( not ( = ?auto_25887 ?auto_25889 ) ) ( not ( = ?auto_25888 ?auto_25889 ) ) ( not ( = ?auto_25891 ?auto_25889 ) ) ( TRUCK-AT ?auto_25893 ?auto_25896 ) ( not ( = ?auto_25896 ?auto_25894 ) ) ( not ( = ?auto_25892 ?auto_25896 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25893 ?auto_25896 ?auto_25894 )
      ( MAKE-1CRATE ?auto_25887 ?auto_25888 )
      ( MAKE-1CRATE-VERIFY ?auto_25887 ?auto_25888 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26044 - SURFACE
      ?auto_26045 - SURFACE
    )
    :vars
    (
      ?auto_26046 - HOIST
      ?auto_26049 - PLACE
      ?auto_26052 - SURFACE
      ?auto_26051 - PLACE
      ?auto_26048 - HOIST
      ?auto_26047 - SURFACE
      ?auto_26050 - TRUCK
      ?auto_26053 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26046 ?auto_26049 ) ( SURFACE-AT ?auto_26044 ?auto_26049 ) ( CLEAR ?auto_26044 ) ( IS-CRATE ?auto_26045 ) ( not ( = ?auto_26044 ?auto_26045 ) ) ( ON ?auto_26044 ?auto_26052 ) ( not ( = ?auto_26052 ?auto_26044 ) ) ( not ( = ?auto_26052 ?auto_26045 ) ) ( not ( = ?auto_26051 ?auto_26049 ) ) ( HOIST-AT ?auto_26048 ?auto_26051 ) ( not ( = ?auto_26046 ?auto_26048 ) ) ( AVAILABLE ?auto_26048 ) ( SURFACE-AT ?auto_26045 ?auto_26051 ) ( ON ?auto_26045 ?auto_26047 ) ( CLEAR ?auto_26045 ) ( not ( = ?auto_26044 ?auto_26047 ) ) ( not ( = ?auto_26045 ?auto_26047 ) ) ( not ( = ?auto_26052 ?auto_26047 ) ) ( TRUCK-AT ?auto_26050 ?auto_26049 ) ( LIFTING ?auto_26046 ?auto_26053 ) ( IS-CRATE ?auto_26053 ) ( not ( = ?auto_26044 ?auto_26053 ) ) ( not ( = ?auto_26045 ?auto_26053 ) ) ( not ( = ?auto_26052 ?auto_26053 ) ) ( not ( = ?auto_26047 ?auto_26053 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26046 ?auto_26053 ?auto_26050 ?auto_26049 )
      ( MAKE-1CRATE ?auto_26044 ?auto_26045 )
      ( MAKE-1CRATE-VERIFY ?auto_26044 ?auto_26045 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26422 - SURFACE
      ?auto_26423 - SURFACE
      ?auto_26424 - SURFACE
      ?auto_26425 - SURFACE
      ?auto_26426 - SURFACE
      ?auto_26427 - SURFACE
    )
    :vars
    (
      ?auto_26429 - HOIST
      ?auto_26428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26429 ?auto_26428 ) ( SURFACE-AT ?auto_26426 ?auto_26428 ) ( CLEAR ?auto_26426 ) ( LIFTING ?auto_26429 ?auto_26427 ) ( IS-CRATE ?auto_26427 ) ( not ( = ?auto_26426 ?auto_26427 ) ) ( ON ?auto_26423 ?auto_26422 ) ( ON ?auto_26424 ?auto_26423 ) ( ON ?auto_26425 ?auto_26424 ) ( ON ?auto_26426 ?auto_26425 ) ( not ( = ?auto_26422 ?auto_26423 ) ) ( not ( = ?auto_26422 ?auto_26424 ) ) ( not ( = ?auto_26422 ?auto_26425 ) ) ( not ( = ?auto_26422 ?auto_26426 ) ) ( not ( = ?auto_26422 ?auto_26427 ) ) ( not ( = ?auto_26423 ?auto_26424 ) ) ( not ( = ?auto_26423 ?auto_26425 ) ) ( not ( = ?auto_26423 ?auto_26426 ) ) ( not ( = ?auto_26423 ?auto_26427 ) ) ( not ( = ?auto_26424 ?auto_26425 ) ) ( not ( = ?auto_26424 ?auto_26426 ) ) ( not ( = ?auto_26424 ?auto_26427 ) ) ( not ( = ?auto_26425 ?auto_26426 ) ) ( not ( = ?auto_26425 ?auto_26427 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26426 ?auto_26427 )
      ( MAKE-5CRATE-VERIFY ?auto_26422 ?auto_26423 ?auto_26424 ?auto_26425 ?auto_26426 ?auto_26427 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26456 - SURFACE
      ?auto_26457 - SURFACE
      ?auto_26458 - SURFACE
      ?auto_26459 - SURFACE
      ?auto_26460 - SURFACE
      ?auto_26461 - SURFACE
    )
    :vars
    (
      ?auto_26463 - HOIST
      ?auto_26464 - PLACE
      ?auto_26462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26463 ?auto_26464 ) ( SURFACE-AT ?auto_26460 ?auto_26464 ) ( CLEAR ?auto_26460 ) ( IS-CRATE ?auto_26461 ) ( not ( = ?auto_26460 ?auto_26461 ) ) ( TRUCK-AT ?auto_26462 ?auto_26464 ) ( AVAILABLE ?auto_26463 ) ( IN ?auto_26461 ?auto_26462 ) ( ON ?auto_26460 ?auto_26459 ) ( not ( = ?auto_26459 ?auto_26460 ) ) ( not ( = ?auto_26459 ?auto_26461 ) ) ( ON ?auto_26457 ?auto_26456 ) ( ON ?auto_26458 ?auto_26457 ) ( ON ?auto_26459 ?auto_26458 ) ( not ( = ?auto_26456 ?auto_26457 ) ) ( not ( = ?auto_26456 ?auto_26458 ) ) ( not ( = ?auto_26456 ?auto_26459 ) ) ( not ( = ?auto_26456 ?auto_26460 ) ) ( not ( = ?auto_26456 ?auto_26461 ) ) ( not ( = ?auto_26457 ?auto_26458 ) ) ( not ( = ?auto_26457 ?auto_26459 ) ) ( not ( = ?auto_26457 ?auto_26460 ) ) ( not ( = ?auto_26457 ?auto_26461 ) ) ( not ( = ?auto_26458 ?auto_26459 ) ) ( not ( = ?auto_26458 ?auto_26460 ) ) ( not ( = ?auto_26458 ?auto_26461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26459 ?auto_26460 ?auto_26461 )
      ( MAKE-5CRATE-VERIFY ?auto_26456 ?auto_26457 ?auto_26458 ?auto_26459 ?auto_26460 ?auto_26461 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26496 - SURFACE
      ?auto_26497 - SURFACE
      ?auto_26498 - SURFACE
      ?auto_26499 - SURFACE
      ?auto_26500 - SURFACE
      ?auto_26501 - SURFACE
    )
    :vars
    (
      ?auto_26505 - HOIST
      ?auto_26503 - PLACE
      ?auto_26502 - TRUCK
      ?auto_26504 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26505 ?auto_26503 ) ( SURFACE-AT ?auto_26500 ?auto_26503 ) ( CLEAR ?auto_26500 ) ( IS-CRATE ?auto_26501 ) ( not ( = ?auto_26500 ?auto_26501 ) ) ( AVAILABLE ?auto_26505 ) ( IN ?auto_26501 ?auto_26502 ) ( ON ?auto_26500 ?auto_26499 ) ( not ( = ?auto_26499 ?auto_26500 ) ) ( not ( = ?auto_26499 ?auto_26501 ) ) ( TRUCK-AT ?auto_26502 ?auto_26504 ) ( not ( = ?auto_26504 ?auto_26503 ) ) ( ON ?auto_26497 ?auto_26496 ) ( ON ?auto_26498 ?auto_26497 ) ( ON ?auto_26499 ?auto_26498 ) ( not ( = ?auto_26496 ?auto_26497 ) ) ( not ( = ?auto_26496 ?auto_26498 ) ) ( not ( = ?auto_26496 ?auto_26499 ) ) ( not ( = ?auto_26496 ?auto_26500 ) ) ( not ( = ?auto_26496 ?auto_26501 ) ) ( not ( = ?auto_26497 ?auto_26498 ) ) ( not ( = ?auto_26497 ?auto_26499 ) ) ( not ( = ?auto_26497 ?auto_26500 ) ) ( not ( = ?auto_26497 ?auto_26501 ) ) ( not ( = ?auto_26498 ?auto_26499 ) ) ( not ( = ?auto_26498 ?auto_26500 ) ) ( not ( = ?auto_26498 ?auto_26501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26499 ?auto_26500 ?auto_26501 )
      ( MAKE-5CRATE-VERIFY ?auto_26496 ?auto_26497 ?auto_26498 ?auto_26499 ?auto_26500 ?auto_26501 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26541 - SURFACE
      ?auto_26542 - SURFACE
      ?auto_26543 - SURFACE
      ?auto_26544 - SURFACE
      ?auto_26545 - SURFACE
      ?auto_26546 - SURFACE
    )
    :vars
    (
      ?auto_26547 - HOIST
      ?auto_26550 - PLACE
      ?auto_26549 - TRUCK
      ?auto_26551 - PLACE
      ?auto_26548 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26547 ?auto_26550 ) ( SURFACE-AT ?auto_26545 ?auto_26550 ) ( CLEAR ?auto_26545 ) ( IS-CRATE ?auto_26546 ) ( not ( = ?auto_26545 ?auto_26546 ) ) ( AVAILABLE ?auto_26547 ) ( ON ?auto_26545 ?auto_26544 ) ( not ( = ?auto_26544 ?auto_26545 ) ) ( not ( = ?auto_26544 ?auto_26546 ) ) ( TRUCK-AT ?auto_26549 ?auto_26551 ) ( not ( = ?auto_26551 ?auto_26550 ) ) ( HOIST-AT ?auto_26548 ?auto_26551 ) ( LIFTING ?auto_26548 ?auto_26546 ) ( not ( = ?auto_26547 ?auto_26548 ) ) ( ON ?auto_26542 ?auto_26541 ) ( ON ?auto_26543 ?auto_26542 ) ( ON ?auto_26544 ?auto_26543 ) ( not ( = ?auto_26541 ?auto_26542 ) ) ( not ( = ?auto_26541 ?auto_26543 ) ) ( not ( = ?auto_26541 ?auto_26544 ) ) ( not ( = ?auto_26541 ?auto_26545 ) ) ( not ( = ?auto_26541 ?auto_26546 ) ) ( not ( = ?auto_26542 ?auto_26543 ) ) ( not ( = ?auto_26542 ?auto_26544 ) ) ( not ( = ?auto_26542 ?auto_26545 ) ) ( not ( = ?auto_26542 ?auto_26546 ) ) ( not ( = ?auto_26543 ?auto_26544 ) ) ( not ( = ?auto_26543 ?auto_26545 ) ) ( not ( = ?auto_26543 ?auto_26546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26544 ?auto_26545 ?auto_26546 )
      ( MAKE-5CRATE-VERIFY ?auto_26541 ?auto_26542 ?auto_26543 ?auto_26544 ?auto_26545 ?auto_26546 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26591 - SURFACE
      ?auto_26592 - SURFACE
      ?auto_26593 - SURFACE
      ?auto_26594 - SURFACE
      ?auto_26595 - SURFACE
      ?auto_26596 - SURFACE
    )
    :vars
    (
      ?auto_26602 - HOIST
      ?auto_26601 - PLACE
      ?auto_26597 - TRUCK
      ?auto_26598 - PLACE
      ?auto_26599 - HOIST
      ?auto_26600 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26602 ?auto_26601 ) ( SURFACE-AT ?auto_26595 ?auto_26601 ) ( CLEAR ?auto_26595 ) ( IS-CRATE ?auto_26596 ) ( not ( = ?auto_26595 ?auto_26596 ) ) ( AVAILABLE ?auto_26602 ) ( ON ?auto_26595 ?auto_26594 ) ( not ( = ?auto_26594 ?auto_26595 ) ) ( not ( = ?auto_26594 ?auto_26596 ) ) ( TRUCK-AT ?auto_26597 ?auto_26598 ) ( not ( = ?auto_26598 ?auto_26601 ) ) ( HOIST-AT ?auto_26599 ?auto_26598 ) ( not ( = ?auto_26602 ?auto_26599 ) ) ( AVAILABLE ?auto_26599 ) ( SURFACE-AT ?auto_26596 ?auto_26598 ) ( ON ?auto_26596 ?auto_26600 ) ( CLEAR ?auto_26596 ) ( not ( = ?auto_26595 ?auto_26600 ) ) ( not ( = ?auto_26596 ?auto_26600 ) ) ( not ( = ?auto_26594 ?auto_26600 ) ) ( ON ?auto_26592 ?auto_26591 ) ( ON ?auto_26593 ?auto_26592 ) ( ON ?auto_26594 ?auto_26593 ) ( not ( = ?auto_26591 ?auto_26592 ) ) ( not ( = ?auto_26591 ?auto_26593 ) ) ( not ( = ?auto_26591 ?auto_26594 ) ) ( not ( = ?auto_26591 ?auto_26595 ) ) ( not ( = ?auto_26591 ?auto_26596 ) ) ( not ( = ?auto_26591 ?auto_26600 ) ) ( not ( = ?auto_26592 ?auto_26593 ) ) ( not ( = ?auto_26592 ?auto_26594 ) ) ( not ( = ?auto_26592 ?auto_26595 ) ) ( not ( = ?auto_26592 ?auto_26596 ) ) ( not ( = ?auto_26592 ?auto_26600 ) ) ( not ( = ?auto_26593 ?auto_26594 ) ) ( not ( = ?auto_26593 ?auto_26595 ) ) ( not ( = ?auto_26593 ?auto_26596 ) ) ( not ( = ?auto_26593 ?auto_26600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26594 ?auto_26595 ?auto_26596 )
      ( MAKE-5CRATE-VERIFY ?auto_26591 ?auto_26592 ?auto_26593 ?auto_26594 ?auto_26595 ?auto_26596 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26642 - SURFACE
      ?auto_26643 - SURFACE
      ?auto_26644 - SURFACE
      ?auto_26645 - SURFACE
      ?auto_26646 - SURFACE
      ?auto_26647 - SURFACE
    )
    :vars
    (
      ?auto_26650 - HOIST
      ?auto_26652 - PLACE
      ?auto_26649 - PLACE
      ?auto_26651 - HOIST
      ?auto_26648 - SURFACE
      ?auto_26653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26650 ?auto_26652 ) ( SURFACE-AT ?auto_26646 ?auto_26652 ) ( CLEAR ?auto_26646 ) ( IS-CRATE ?auto_26647 ) ( not ( = ?auto_26646 ?auto_26647 ) ) ( AVAILABLE ?auto_26650 ) ( ON ?auto_26646 ?auto_26645 ) ( not ( = ?auto_26645 ?auto_26646 ) ) ( not ( = ?auto_26645 ?auto_26647 ) ) ( not ( = ?auto_26649 ?auto_26652 ) ) ( HOIST-AT ?auto_26651 ?auto_26649 ) ( not ( = ?auto_26650 ?auto_26651 ) ) ( AVAILABLE ?auto_26651 ) ( SURFACE-AT ?auto_26647 ?auto_26649 ) ( ON ?auto_26647 ?auto_26648 ) ( CLEAR ?auto_26647 ) ( not ( = ?auto_26646 ?auto_26648 ) ) ( not ( = ?auto_26647 ?auto_26648 ) ) ( not ( = ?auto_26645 ?auto_26648 ) ) ( TRUCK-AT ?auto_26653 ?auto_26652 ) ( ON ?auto_26643 ?auto_26642 ) ( ON ?auto_26644 ?auto_26643 ) ( ON ?auto_26645 ?auto_26644 ) ( not ( = ?auto_26642 ?auto_26643 ) ) ( not ( = ?auto_26642 ?auto_26644 ) ) ( not ( = ?auto_26642 ?auto_26645 ) ) ( not ( = ?auto_26642 ?auto_26646 ) ) ( not ( = ?auto_26642 ?auto_26647 ) ) ( not ( = ?auto_26642 ?auto_26648 ) ) ( not ( = ?auto_26643 ?auto_26644 ) ) ( not ( = ?auto_26643 ?auto_26645 ) ) ( not ( = ?auto_26643 ?auto_26646 ) ) ( not ( = ?auto_26643 ?auto_26647 ) ) ( not ( = ?auto_26643 ?auto_26648 ) ) ( not ( = ?auto_26644 ?auto_26645 ) ) ( not ( = ?auto_26644 ?auto_26646 ) ) ( not ( = ?auto_26644 ?auto_26647 ) ) ( not ( = ?auto_26644 ?auto_26648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26645 ?auto_26646 ?auto_26647 )
      ( MAKE-5CRATE-VERIFY ?auto_26642 ?auto_26643 ?auto_26644 ?auto_26645 ?auto_26646 ?auto_26647 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26693 - SURFACE
      ?auto_26694 - SURFACE
      ?auto_26695 - SURFACE
      ?auto_26696 - SURFACE
      ?auto_26697 - SURFACE
      ?auto_26698 - SURFACE
    )
    :vars
    (
      ?auto_26704 - HOIST
      ?auto_26700 - PLACE
      ?auto_26703 - PLACE
      ?auto_26699 - HOIST
      ?auto_26702 - SURFACE
      ?auto_26701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26704 ?auto_26700 ) ( IS-CRATE ?auto_26698 ) ( not ( = ?auto_26697 ?auto_26698 ) ) ( not ( = ?auto_26696 ?auto_26697 ) ) ( not ( = ?auto_26696 ?auto_26698 ) ) ( not ( = ?auto_26703 ?auto_26700 ) ) ( HOIST-AT ?auto_26699 ?auto_26703 ) ( not ( = ?auto_26704 ?auto_26699 ) ) ( AVAILABLE ?auto_26699 ) ( SURFACE-AT ?auto_26698 ?auto_26703 ) ( ON ?auto_26698 ?auto_26702 ) ( CLEAR ?auto_26698 ) ( not ( = ?auto_26697 ?auto_26702 ) ) ( not ( = ?auto_26698 ?auto_26702 ) ) ( not ( = ?auto_26696 ?auto_26702 ) ) ( TRUCK-AT ?auto_26701 ?auto_26700 ) ( SURFACE-AT ?auto_26696 ?auto_26700 ) ( CLEAR ?auto_26696 ) ( LIFTING ?auto_26704 ?auto_26697 ) ( IS-CRATE ?auto_26697 ) ( ON ?auto_26694 ?auto_26693 ) ( ON ?auto_26695 ?auto_26694 ) ( ON ?auto_26696 ?auto_26695 ) ( not ( = ?auto_26693 ?auto_26694 ) ) ( not ( = ?auto_26693 ?auto_26695 ) ) ( not ( = ?auto_26693 ?auto_26696 ) ) ( not ( = ?auto_26693 ?auto_26697 ) ) ( not ( = ?auto_26693 ?auto_26698 ) ) ( not ( = ?auto_26693 ?auto_26702 ) ) ( not ( = ?auto_26694 ?auto_26695 ) ) ( not ( = ?auto_26694 ?auto_26696 ) ) ( not ( = ?auto_26694 ?auto_26697 ) ) ( not ( = ?auto_26694 ?auto_26698 ) ) ( not ( = ?auto_26694 ?auto_26702 ) ) ( not ( = ?auto_26695 ?auto_26696 ) ) ( not ( = ?auto_26695 ?auto_26697 ) ) ( not ( = ?auto_26695 ?auto_26698 ) ) ( not ( = ?auto_26695 ?auto_26702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26696 ?auto_26697 ?auto_26698 )
      ( MAKE-5CRATE-VERIFY ?auto_26693 ?auto_26694 ?auto_26695 ?auto_26696 ?auto_26697 ?auto_26698 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26744 - SURFACE
      ?auto_26745 - SURFACE
      ?auto_26746 - SURFACE
      ?auto_26747 - SURFACE
      ?auto_26748 - SURFACE
      ?auto_26749 - SURFACE
    )
    :vars
    (
      ?auto_26752 - HOIST
      ?auto_26751 - PLACE
      ?auto_26753 - PLACE
      ?auto_26754 - HOIST
      ?auto_26755 - SURFACE
      ?auto_26750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26752 ?auto_26751 ) ( IS-CRATE ?auto_26749 ) ( not ( = ?auto_26748 ?auto_26749 ) ) ( not ( = ?auto_26747 ?auto_26748 ) ) ( not ( = ?auto_26747 ?auto_26749 ) ) ( not ( = ?auto_26753 ?auto_26751 ) ) ( HOIST-AT ?auto_26754 ?auto_26753 ) ( not ( = ?auto_26752 ?auto_26754 ) ) ( AVAILABLE ?auto_26754 ) ( SURFACE-AT ?auto_26749 ?auto_26753 ) ( ON ?auto_26749 ?auto_26755 ) ( CLEAR ?auto_26749 ) ( not ( = ?auto_26748 ?auto_26755 ) ) ( not ( = ?auto_26749 ?auto_26755 ) ) ( not ( = ?auto_26747 ?auto_26755 ) ) ( TRUCK-AT ?auto_26750 ?auto_26751 ) ( SURFACE-AT ?auto_26747 ?auto_26751 ) ( CLEAR ?auto_26747 ) ( IS-CRATE ?auto_26748 ) ( AVAILABLE ?auto_26752 ) ( IN ?auto_26748 ?auto_26750 ) ( ON ?auto_26745 ?auto_26744 ) ( ON ?auto_26746 ?auto_26745 ) ( ON ?auto_26747 ?auto_26746 ) ( not ( = ?auto_26744 ?auto_26745 ) ) ( not ( = ?auto_26744 ?auto_26746 ) ) ( not ( = ?auto_26744 ?auto_26747 ) ) ( not ( = ?auto_26744 ?auto_26748 ) ) ( not ( = ?auto_26744 ?auto_26749 ) ) ( not ( = ?auto_26744 ?auto_26755 ) ) ( not ( = ?auto_26745 ?auto_26746 ) ) ( not ( = ?auto_26745 ?auto_26747 ) ) ( not ( = ?auto_26745 ?auto_26748 ) ) ( not ( = ?auto_26745 ?auto_26749 ) ) ( not ( = ?auto_26745 ?auto_26755 ) ) ( not ( = ?auto_26746 ?auto_26747 ) ) ( not ( = ?auto_26746 ?auto_26748 ) ) ( not ( = ?auto_26746 ?auto_26749 ) ) ( not ( = ?auto_26746 ?auto_26755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26747 ?auto_26748 ?auto_26749 )
      ( MAKE-5CRATE-VERIFY ?auto_26744 ?auto_26745 ?auto_26746 ?auto_26747 ?auto_26748 ?auto_26749 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27112 - SURFACE
      ?auto_27113 - SURFACE
    )
    :vars
    (
      ?auto_27120 - HOIST
      ?auto_27115 - PLACE
      ?auto_27117 - SURFACE
      ?auto_27118 - TRUCK
      ?auto_27116 - PLACE
      ?auto_27114 - HOIST
      ?auto_27119 - SURFACE
      ?auto_27121 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27120 ?auto_27115 ) ( SURFACE-AT ?auto_27112 ?auto_27115 ) ( CLEAR ?auto_27112 ) ( IS-CRATE ?auto_27113 ) ( not ( = ?auto_27112 ?auto_27113 ) ) ( AVAILABLE ?auto_27120 ) ( ON ?auto_27112 ?auto_27117 ) ( not ( = ?auto_27117 ?auto_27112 ) ) ( not ( = ?auto_27117 ?auto_27113 ) ) ( TRUCK-AT ?auto_27118 ?auto_27116 ) ( not ( = ?auto_27116 ?auto_27115 ) ) ( HOIST-AT ?auto_27114 ?auto_27116 ) ( not ( = ?auto_27120 ?auto_27114 ) ) ( SURFACE-AT ?auto_27113 ?auto_27116 ) ( ON ?auto_27113 ?auto_27119 ) ( CLEAR ?auto_27113 ) ( not ( = ?auto_27112 ?auto_27119 ) ) ( not ( = ?auto_27113 ?auto_27119 ) ) ( not ( = ?auto_27117 ?auto_27119 ) ) ( LIFTING ?auto_27114 ?auto_27121 ) ( IS-CRATE ?auto_27121 ) ( not ( = ?auto_27112 ?auto_27121 ) ) ( not ( = ?auto_27113 ?auto_27121 ) ) ( not ( = ?auto_27117 ?auto_27121 ) ) ( not ( = ?auto_27119 ?auto_27121 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27114 ?auto_27121 ?auto_27118 ?auto_27116 )
      ( MAKE-1CRATE ?auto_27112 ?auto_27113 )
      ( MAKE-1CRATE-VERIFY ?auto_27112 ?auto_27113 ) )
  )

)

