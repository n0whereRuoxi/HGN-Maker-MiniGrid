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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042760 - SURFACE
      ?auto_1042761 - SURFACE
    )
    :vars
    (
      ?auto_1042762 - HOIST
      ?auto_1042763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042762 ?auto_1042763 ) ( SURFACE-AT ?auto_1042760 ?auto_1042763 ) ( CLEAR ?auto_1042760 ) ( LIFTING ?auto_1042762 ?auto_1042761 ) ( IS-CRATE ?auto_1042761 ) ( not ( = ?auto_1042760 ?auto_1042761 ) ) )
    :subtasks
    ( ( !DROP ?auto_1042762 ?auto_1042761 ?auto_1042760 ?auto_1042763 )
      ( MAKE-1CRATE-VERIFY ?auto_1042760 ?auto_1042761 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042764 - SURFACE
      ?auto_1042765 - SURFACE
    )
    :vars
    (
      ?auto_1042767 - HOIST
      ?auto_1042766 - PLACE
      ?auto_1042768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042767 ?auto_1042766 ) ( SURFACE-AT ?auto_1042764 ?auto_1042766 ) ( CLEAR ?auto_1042764 ) ( IS-CRATE ?auto_1042765 ) ( not ( = ?auto_1042764 ?auto_1042765 ) ) ( TRUCK-AT ?auto_1042768 ?auto_1042766 ) ( AVAILABLE ?auto_1042767 ) ( IN ?auto_1042765 ?auto_1042768 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1042767 ?auto_1042765 ?auto_1042768 ?auto_1042766 )
      ( MAKE-1CRATE ?auto_1042764 ?auto_1042765 )
      ( MAKE-1CRATE-VERIFY ?auto_1042764 ?auto_1042765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042769 - SURFACE
      ?auto_1042770 - SURFACE
    )
    :vars
    (
      ?auto_1042772 - HOIST
      ?auto_1042773 - PLACE
      ?auto_1042771 - TRUCK
      ?auto_1042774 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042772 ?auto_1042773 ) ( SURFACE-AT ?auto_1042769 ?auto_1042773 ) ( CLEAR ?auto_1042769 ) ( IS-CRATE ?auto_1042770 ) ( not ( = ?auto_1042769 ?auto_1042770 ) ) ( AVAILABLE ?auto_1042772 ) ( IN ?auto_1042770 ?auto_1042771 ) ( TRUCK-AT ?auto_1042771 ?auto_1042774 ) ( not ( = ?auto_1042774 ?auto_1042773 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1042771 ?auto_1042774 ?auto_1042773 )
      ( MAKE-1CRATE ?auto_1042769 ?auto_1042770 )
      ( MAKE-1CRATE-VERIFY ?auto_1042769 ?auto_1042770 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042775 - SURFACE
      ?auto_1042776 - SURFACE
    )
    :vars
    (
      ?auto_1042777 - HOIST
      ?auto_1042780 - PLACE
      ?auto_1042779 - TRUCK
      ?auto_1042778 - PLACE
      ?auto_1042781 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042777 ?auto_1042780 ) ( SURFACE-AT ?auto_1042775 ?auto_1042780 ) ( CLEAR ?auto_1042775 ) ( IS-CRATE ?auto_1042776 ) ( not ( = ?auto_1042775 ?auto_1042776 ) ) ( AVAILABLE ?auto_1042777 ) ( TRUCK-AT ?auto_1042779 ?auto_1042778 ) ( not ( = ?auto_1042778 ?auto_1042780 ) ) ( HOIST-AT ?auto_1042781 ?auto_1042778 ) ( LIFTING ?auto_1042781 ?auto_1042776 ) ( not ( = ?auto_1042777 ?auto_1042781 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1042781 ?auto_1042776 ?auto_1042779 ?auto_1042778 )
      ( MAKE-1CRATE ?auto_1042775 ?auto_1042776 )
      ( MAKE-1CRATE-VERIFY ?auto_1042775 ?auto_1042776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042782 - SURFACE
      ?auto_1042783 - SURFACE
    )
    :vars
    (
      ?auto_1042786 - HOIST
      ?auto_1042788 - PLACE
      ?auto_1042784 - TRUCK
      ?auto_1042787 - PLACE
      ?auto_1042785 - HOIST
      ?auto_1042789 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042786 ?auto_1042788 ) ( SURFACE-AT ?auto_1042782 ?auto_1042788 ) ( CLEAR ?auto_1042782 ) ( IS-CRATE ?auto_1042783 ) ( not ( = ?auto_1042782 ?auto_1042783 ) ) ( AVAILABLE ?auto_1042786 ) ( TRUCK-AT ?auto_1042784 ?auto_1042787 ) ( not ( = ?auto_1042787 ?auto_1042788 ) ) ( HOIST-AT ?auto_1042785 ?auto_1042787 ) ( not ( = ?auto_1042786 ?auto_1042785 ) ) ( AVAILABLE ?auto_1042785 ) ( SURFACE-AT ?auto_1042783 ?auto_1042787 ) ( ON ?auto_1042783 ?auto_1042789 ) ( CLEAR ?auto_1042783 ) ( not ( = ?auto_1042782 ?auto_1042789 ) ) ( not ( = ?auto_1042783 ?auto_1042789 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1042785 ?auto_1042783 ?auto_1042789 ?auto_1042787 )
      ( MAKE-1CRATE ?auto_1042782 ?auto_1042783 )
      ( MAKE-1CRATE-VERIFY ?auto_1042782 ?auto_1042783 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042790 - SURFACE
      ?auto_1042791 - SURFACE
    )
    :vars
    (
      ?auto_1042796 - HOIST
      ?auto_1042792 - PLACE
      ?auto_1042795 - PLACE
      ?auto_1042794 - HOIST
      ?auto_1042793 - SURFACE
      ?auto_1042797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042796 ?auto_1042792 ) ( SURFACE-AT ?auto_1042790 ?auto_1042792 ) ( CLEAR ?auto_1042790 ) ( IS-CRATE ?auto_1042791 ) ( not ( = ?auto_1042790 ?auto_1042791 ) ) ( AVAILABLE ?auto_1042796 ) ( not ( = ?auto_1042795 ?auto_1042792 ) ) ( HOIST-AT ?auto_1042794 ?auto_1042795 ) ( not ( = ?auto_1042796 ?auto_1042794 ) ) ( AVAILABLE ?auto_1042794 ) ( SURFACE-AT ?auto_1042791 ?auto_1042795 ) ( ON ?auto_1042791 ?auto_1042793 ) ( CLEAR ?auto_1042791 ) ( not ( = ?auto_1042790 ?auto_1042793 ) ) ( not ( = ?auto_1042791 ?auto_1042793 ) ) ( TRUCK-AT ?auto_1042797 ?auto_1042792 ) )
    :subtasks
    ( ( !DRIVE ?auto_1042797 ?auto_1042792 ?auto_1042795 )
      ( MAKE-1CRATE ?auto_1042790 ?auto_1042791 )
      ( MAKE-1CRATE-VERIFY ?auto_1042790 ?auto_1042791 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042807 - SURFACE
      ?auto_1042808 - SURFACE
      ?auto_1042809 - SURFACE
    )
    :vars
    (
      ?auto_1042810 - HOIST
      ?auto_1042811 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042810 ?auto_1042811 ) ( SURFACE-AT ?auto_1042808 ?auto_1042811 ) ( CLEAR ?auto_1042808 ) ( LIFTING ?auto_1042810 ?auto_1042809 ) ( IS-CRATE ?auto_1042809 ) ( not ( = ?auto_1042808 ?auto_1042809 ) ) ( ON ?auto_1042808 ?auto_1042807 ) ( not ( = ?auto_1042807 ?auto_1042808 ) ) ( not ( = ?auto_1042807 ?auto_1042809 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042808 ?auto_1042809 )
      ( MAKE-2CRATE-VERIFY ?auto_1042807 ?auto_1042808 ?auto_1042809 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042817 - SURFACE
      ?auto_1042818 - SURFACE
      ?auto_1042819 - SURFACE
    )
    :vars
    (
      ?auto_1042820 - HOIST
      ?auto_1042822 - PLACE
      ?auto_1042821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042820 ?auto_1042822 ) ( SURFACE-AT ?auto_1042818 ?auto_1042822 ) ( CLEAR ?auto_1042818 ) ( IS-CRATE ?auto_1042819 ) ( not ( = ?auto_1042818 ?auto_1042819 ) ) ( TRUCK-AT ?auto_1042821 ?auto_1042822 ) ( AVAILABLE ?auto_1042820 ) ( IN ?auto_1042819 ?auto_1042821 ) ( ON ?auto_1042818 ?auto_1042817 ) ( not ( = ?auto_1042817 ?auto_1042818 ) ) ( not ( = ?auto_1042817 ?auto_1042819 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042818 ?auto_1042819 )
      ( MAKE-2CRATE-VERIFY ?auto_1042817 ?auto_1042818 ?auto_1042819 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042823 - SURFACE
      ?auto_1042824 - SURFACE
    )
    :vars
    (
      ?auto_1042826 - HOIST
      ?auto_1042825 - PLACE
      ?auto_1042827 - TRUCK
      ?auto_1042828 - SURFACE
      ?auto_1042829 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042826 ?auto_1042825 ) ( SURFACE-AT ?auto_1042823 ?auto_1042825 ) ( CLEAR ?auto_1042823 ) ( IS-CRATE ?auto_1042824 ) ( not ( = ?auto_1042823 ?auto_1042824 ) ) ( AVAILABLE ?auto_1042826 ) ( IN ?auto_1042824 ?auto_1042827 ) ( ON ?auto_1042823 ?auto_1042828 ) ( not ( = ?auto_1042828 ?auto_1042823 ) ) ( not ( = ?auto_1042828 ?auto_1042824 ) ) ( TRUCK-AT ?auto_1042827 ?auto_1042829 ) ( not ( = ?auto_1042829 ?auto_1042825 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1042827 ?auto_1042829 ?auto_1042825 )
      ( MAKE-2CRATE ?auto_1042828 ?auto_1042823 ?auto_1042824 )
      ( MAKE-1CRATE-VERIFY ?auto_1042823 ?auto_1042824 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042830 - SURFACE
      ?auto_1042831 - SURFACE
      ?auto_1042832 - SURFACE
    )
    :vars
    (
      ?auto_1042836 - HOIST
      ?auto_1042835 - PLACE
      ?auto_1042833 - TRUCK
      ?auto_1042834 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042836 ?auto_1042835 ) ( SURFACE-AT ?auto_1042831 ?auto_1042835 ) ( CLEAR ?auto_1042831 ) ( IS-CRATE ?auto_1042832 ) ( not ( = ?auto_1042831 ?auto_1042832 ) ) ( AVAILABLE ?auto_1042836 ) ( IN ?auto_1042832 ?auto_1042833 ) ( ON ?auto_1042831 ?auto_1042830 ) ( not ( = ?auto_1042830 ?auto_1042831 ) ) ( not ( = ?auto_1042830 ?auto_1042832 ) ) ( TRUCK-AT ?auto_1042833 ?auto_1042834 ) ( not ( = ?auto_1042834 ?auto_1042835 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042831 ?auto_1042832 )
      ( MAKE-2CRATE-VERIFY ?auto_1042830 ?auto_1042831 ?auto_1042832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042837 - SURFACE
      ?auto_1042838 - SURFACE
    )
    :vars
    (
      ?auto_1042843 - HOIST
      ?auto_1042839 - PLACE
      ?auto_1042842 - SURFACE
      ?auto_1042840 - TRUCK
      ?auto_1042841 - PLACE
      ?auto_1042844 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042843 ?auto_1042839 ) ( SURFACE-AT ?auto_1042837 ?auto_1042839 ) ( CLEAR ?auto_1042837 ) ( IS-CRATE ?auto_1042838 ) ( not ( = ?auto_1042837 ?auto_1042838 ) ) ( AVAILABLE ?auto_1042843 ) ( ON ?auto_1042837 ?auto_1042842 ) ( not ( = ?auto_1042842 ?auto_1042837 ) ) ( not ( = ?auto_1042842 ?auto_1042838 ) ) ( TRUCK-AT ?auto_1042840 ?auto_1042841 ) ( not ( = ?auto_1042841 ?auto_1042839 ) ) ( HOIST-AT ?auto_1042844 ?auto_1042841 ) ( LIFTING ?auto_1042844 ?auto_1042838 ) ( not ( = ?auto_1042843 ?auto_1042844 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1042844 ?auto_1042838 ?auto_1042840 ?auto_1042841 )
      ( MAKE-2CRATE ?auto_1042842 ?auto_1042837 ?auto_1042838 )
      ( MAKE-1CRATE-VERIFY ?auto_1042837 ?auto_1042838 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042845 - SURFACE
      ?auto_1042846 - SURFACE
      ?auto_1042847 - SURFACE
    )
    :vars
    (
      ?auto_1042848 - HOIST
      ?auto_1042850 - PLACE
      ?auto_1042851 - TRUCK
      ?auto_1042849 - PLACE
      ?auto_1042852 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042848 ?auto_1042850 ) ( SURFACE-AT ?auto_1042846 ?auto_1042850 ) ( CLEAR ?auto_1042846 ) ( IS-CRATE ?auto_1042847 ) ( not ( = ?auto_1042846 ?auto_1042847 ) ) ( AVAILABLE ?auto_1042848 ) ( ON ?auto_1042846 ?auto_1042845 ) ( not ( = ?auto_1042845 ?auto_1042846 ) ) ( not ( = ?auto_1042845 ?auto_1042847 ) ) ( TRUCK-AT ?auto_1042851 ?auto_1042849 ) ( not ( = ?auto_1042849 ?auto_1042850 ) ) ( HOIST-AT ?auto_1042852 ?auto_1042849 ) ( LIFTING ?auto_1042852 ?auto_1042847 ) ( not ( = ?auto_1042848 ?auto_1042852 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042846 ?auto_1042847 )
      ( MAKE-2CRATE-VERIFY ?auto_1042845 ?auto_1042846 ?auto_1042847 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042853 - SURFACE
      ?auto_1042854 - SURFACE
    )
    :vars
    (
      ?auto_1042857 - HOIST
      ?auto_1042858 - PLACE
      ?auto_1042859 - SURFACE
      ?auto_1042856 - TRUCK
      ?auto_1042860 - PLACE
      ?auto_1042855 - HOIST
      ?auto_1042861 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042857 ?auto_1042858 ) ( SURFACE-AT ?auto_1042853 ?auto_1042858 ) ( CLEAR ?auto_1042853 ) ( IS-CRATE ?auto_1042854 ) ( not ( = ?auto_1042853 ?auto_1042854 ) ) ( AVAILABLE ?auto_1042857 ) ( ON ?auto_1042853 ?auto_1042859 ) ( not ( = ?auto_1042859 ?auto_1042853 ) ) ( not ( = ?auto_1042859 ?auto_1042854 ) ) ( TRUCK-AT ?auto_1042856 ?auto_1042860 ) ( not ( = ?auto_1042860 ?auto_1042858 ) ) ( HOIST-AT ?auto_1042855 ?auto_1042860 ) ( not ( = ?auto_1042857 ?auto_1042855 ) ) ( AVAILABLE ?auto_1042855 ) ( SURFACE-AT ?auto_1042854 ?auto_1042860 ) ( ON ?auto_1042854 ?auto_1042861 ) ( CLEAR ?auto_1042854 ) ( not ( = ?auto_1042853 ?auto_1042861 ) ) ( not ( = ?auto_1042854 ?auto_1042861 ) ) ( not ( = ?auto_1042859 ?auto_1042861 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1042855 ?auto_1042854 ?auto_1042861 ?auto_1042860 )
      ( MAKE-2CRATE ?auto_1042859 ?auto_1042853 ?auto_1042854 )
      ( MAKE-1CRATE-VERIFY ?auto_1042853 ?auto_1042854 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042862 - SURFACE
      ?auto_1042863 - SURFACE
      ?auto_1042864 - SURFACE
    )
    :vars
    (
      ?auto_1042870 - HOIST
      ?auto_1042866 - PLACE
      ?auto_1042867 - TRUCK
      ?auto_1042869 - PLACE
      ?auto_1042865 - HOIST
      ?auto_1042868 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042870 ?auto_1042866 ) ( SURFACE-AT ?auto_1042863 ?auto_1042866 ) ( CLEAR ?auto_1042863 ) ( IS-CRATE ?auto_1042864 ) ( not ( = ?auto_1042863 ?auto_1042864 ) ) ( AVAILABLE ?auto_1042870 ) ( ON ?auto_1042863 ?auto_1042862 ) ( not ( = ?auto_1042862 ?auto_1042863 ) ) ( not ( = ?auto_1042862 ?auto_1042864 ) ) ( TRUCK-AT ?auto_1042867 ?auto_1042869 ) ( not ( = ?auto_1042869 ?auto_1042866 ) ) ( HOIST-AT ?auto_1042865 ?auto_1042869 ) ( not ( = ?auto_1042870 ?auto_1042865 ) ) ( AVAILABLE ?auto_1042865 ) ( SURFACE-AT ?auto_1042864 ?auto_1042869 ) ( ON ?auto_1042864 ?auto_1042868 ) ( CLEAR ?auto_1042864 ) ( not ( = ?auto_1042863 ?auto_1042868 ) ) ( not ( = ?auto_1042864 ?auto_1042868 ) ) ( not ( = ?auto_1042862 ?auto_1042868 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042863 ?auto_1042864 )
      ( MAKE-2CRATE-VERIFY ?auto_1042862 ?auto_1042863 ?auto_1042864 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042871 - SURFACE
      ?auto_1042872 - SURFACE
    )
    :vars
    (
      ?auto_1042874 - HOIST
      ?auto_1042873 - PLACE
      ?auto_1042875 - SURFACE
      ?auto_1042879 - PLACE
      ?auto_1042877 - HOIST
      ?auto_1042876 - SURFACE
      ?auto_1042878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042874 ?auto_1042873 ) ( SURFACE-AT ?auto_1042871 ?auto_1042873 ) ( CLEAR ?auto_1042871 ) ( IS-CRATE ?auto_1042872 ) ( not ( = ?auto_1042871 ?auto_1042872 ) ) ( AVAILABLE ?auto_1042874 ) ( ON ?auto_1042871 ?auto_1042875 ) ( not ( = ?auto_1042875 ?auto_1042871 ) ) ( not ( = ?auto_1042875 ?auto_1042872 ) ) ( not ( = ?auto_1042879 ?auto_1042873 ) ) ( HOIST-AT ?auto_1042877 ?auto_1042879 ) ( not ( = ?auto_1042874 ?auto_1042877 ) ) ( AVAILABLE ?auto_1042877 ) ( SURFACE-AT ?auto_1042872 ?auto_1042879 ) ( ON ?auto_1042872 ?auto_1042876 ) ( CLEAR ?auto_1042872 ) ( not ( = ?auto_1042871 ?auto_1042876 ) ) ( not ( = ?auto_1042872 ?auto_1042876 ) ) ( not ( = ?auto_1042875 ?auto_1042876 ) ) ( TRUCK-AT ?auto_1042878 ?auto_1042873 ) )
    :subtasks
    ( ( !DRIVE ?auto_1042878 ?auto_1042873 ?auto_1042879 )
      ( MAKE-2CRATE ?auto_1042875 ?auto_1042871 ?auto_1042872 )
      ( MAKE-1CRATE-VERIFY ?auto_1042871 ?auto_1042872 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042880 - SURFACE
      ?auto_1042881 - SURFACE
      ?auto_1042882 - SURFACE
    )
    :vars
    (
      ?auto_1042886 - HOIST
      ?auto_1042883 - PLACE
      ?auto_1042888 - PLACE
      ?auto_1042885 - HOIST
      ?auto_1042884 - SURFACE
      ?auto_1042887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042886 ?auto_1042883 ) ( SURFACE-AT ?auto_1042881 ?auto_1042883 ) ( CLEAR ?auto_1042881 ) ( IS-CRATE ?auto_1042882 ) ( not ( = ?auto_1042881 ?auto_1042882 ) ) ( AVAILABLE ?auto_1042886 ) ( ON ?auto_1042881 ?auto_1042880 ) ( not ( = ?auto_1042880 ?auto_1042881 ) ) ( not ( = ?auto_1042880 ?auto_1042882 ) ) ( not ( = ?auto_1042888 ?auto_1042883 ) ) ( HOIST-AT ?auto_1042885 ?auto_1042888 ) ( not ( = ?auto_1042886 ?auto_1042885 ) ) ( AVAILABLE ?auto_1042885 ) ( SURFACE-AT ?auto_1042882 ?auto_1042888 ) ( ON ?auto_1042882 ?auto_1042884 ) ( CLEAR ?auto_1042882 ) ( not ( = ?auto_1042881 ?auto_1042884 ) ) ( not ( = ?auto_1042882 ?auto_1042884 ) ) ( not ( = ?auto_1042880 ?auto_1042884 ) ) ( TRUCK-AT ?auto_1042887 ?auto_1042883 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042881 ?auto_1042882 )
      ( MAKE-2CRATE-VERIFY ?auto_1042880 ?auto_1042881 ?auto_1042882 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042889 - SURFACE
      ?auto_1042890 - SURFACE
    )
    :vars
    (
      ?auto_1042894 - HOIST
      ?auto_1042897 - PLACE
      ?auto_1042893 - SURFACE
      ?auto_1042895 - PLACE
      ?auto_1042892 - HOIST
      ?auto_1042896 - SURFACE
      ?auto_1042891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042894 ?auto_1042897 ) ( IS-CRATE ?auto_1042890 ) ( not ( = ?auto_1042889 ?auto_1042890 ) ) ( not ( = ?auto_1042893 ?auto_1042889 ) ) ( not ( = ?auto_1042893 ?auto_1042890 ) ) ( not ( = ?auto_1042895 ?auto_1042897 ) ) ( HOIST-AT ?auto_1042892 ?auto_1042895 ) ( not ( = ?auto_1042894 ?auto_1042892 ) ) ( AVAILABLE ?auto_1042892 ) ( SURFACE-AT ?auto_1042890 ?auto_1042895 ) ( ON ?auto_1042890 ?auto_1042896 ) ( CLEAR ?auto_1042890 ) ( not ( = ?auto_1042889 ?auto_1042896 ) ) ( not ( = ?auto_1042890 ?auto_1042896 ) ) ( not ( = ?auto_1042893 ?auto_1042896 ) ) ( TRUCK-AT ?auto_1042891 ?auto_1042897 ) ( SURFACE-AT ?auto_1042893 ?auto_1042897 ) ( CLEAR ?auto_1042893 ) ( LIFTING ?auto_1042894 ?auto_1042889 ) ( IS-CRATE ?auto_1042889 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042893 ?auto_1042889 )
      ( MAKE-2CRATE ?auto_1042893 ?auto_1042889 ?auto_1042890 )
      ( MAKE-1CRATE-VERIFY ?auto_1042889 ?auto_1042890 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042898 - SURFACE
      ?auto_1042899 - SURFACE
      ?auto_1042900 - SURFACE
    )
    :vars
    (
      ?auto_1042905 - HOIST
      ?auto_1042903 - PLACE
      ?auto_1042901 - PLACE
      ?auto_1042904 - HOIST
      ?auto_1042902 - SURFACE
      ?auto_1042906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042905 ?auto_1042903 ) ( IS-CRATE ?auto_1042900 ) ( not ( = ?auto_1042899 ?auto_1042900 ) ) ( not ( = ?auto_1042898 ?auto_1042899 ) ) ( not ( = ?auto_1042898 ?auto_1042900 ) ) ( not ( = ?auto_1042901 ?auto_1042903 ) ) ( HOIST-AT ?auto_1042904 ?auto_1042901 ) ( not ( = ?auto_1042905 ?auto_1042904 ) ) ( AVAILABLE ?auto_1042904 ) ( SURFACE-AT ?auto_1042900 ?auto_1042901 ) ( ON ?auto_1042900 ?auto_1042902 ) ( CLEAR ?auto_1042900 ) ( not ( = ?auto_1042899 ?auto_1042902 ) ) ( not ( = ?auto_1042900 ?auto_1042902 ) ) ( not ( = ?auto_1042898 ?auto_1042902 ) ) ( TRUCK-AT ?auto_1042906 ?auto_1042903 ) ( SURFACE-AT ?auto_1042898 ?auto_1042903 ) ( CLEAR ?auto_1042898 ) ( LIFTING ?auto_1042905 ?auto_1042899 ) ( IS-CRATE ?auto_1042899 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042899 ?auto_1042900 )
      ( MAKE-2CRATE-VERIFY ?auto_1042898 ?auto_1042899 ?auto_1042900 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042907 - SURFACE
      ?auto_1042908 - SURFACE
    )
    :vars
    (
      ?auto_1042914 - HOIST
      ?auto_1042913 - PLACE
      ?auto_1042910 - SURFACE
      ?auto_1042911 - PLACE
      ?auto_1042909 - HOIST
      ?auto_1042912 - SURFACE
      ?auto_1042915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042914 ?auto_1042913 ) ( IS-CRATE ?auto_1042908 ) ( not ( = ?auto_1042907 ?auto_1042908 ) ) ( not ( = ?auto_1042910 ?auto_1042907 ) ) ( not ( = ?auto_1042910 ?auto_1042908 ) ) ( not ( = ?auto_1042911 ?auto_1042913 ) ) ( HOIST-AT ?auto_1042909 ?auto_1042911 ) ( not ( = ?auto_1042914 ?auto_1042909 ) ) ( AVAILABLE ?auto_1042909 ) ( SURFACE-AT ?auto_1042908 ?auto_1042911 ) ( ON ?auto_1042908 ?auto_1042912 ) ( CLEAR ?auto_1042908 ) ( not ( = ?auto_1042907 ?auto_1042912 ) ) ( not ( = ?auto_1042908 ?auto_1042912 ) ) ( not ( = ?auto_1042910 ?auto_1042912 ) ) ( TRUCK-AT ?auto_1042915 ?auto_1042913 ) ( SURFACE-AT ?auto_1042910 ?auto_1042913 ) ( CLEAR ?auto_1042910 ) ( IS-CRATE ?auto_1042907 ) ( AVAILABLE ?auto_1042914 ) ( IN ?auto_1042907 ?auto_1042915 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1042914 ?auto_1042907 ?auto_1042915 ?auto_1042913 )
      ( MAKE-2CRATE ?auto_1042910 ?auto_1042907 ?auto_1042908 )
      ( MAKE-1CRATE-VERIFY ?auto_1042907 ?auto_1042908 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1042916 - SURFACE
      ?auto_1042917 - SURFACE
      ?auto_1042918 - SURFACE
    )
    :vars
    (
      ?auto_1042920 - HOIST
      ?auto_1042923 - PLACE
      ?auto_1042924 - PLACE
      ?auto_1042922 - HOIST
      ?auto_1042921 - SURFACE
      ?auto_1042919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042920 ?auto_1042923 ) ( IS-CRATE ?auto_1042918 ) ( not ( = ?auto_1042917 ?auto_1042918 ) ) ( not ( = ?auto_1042916 ?auto_1042917 ) ) ( not ( = ?auto_1042916 ?auto_1042918 ) ) ( not ( = ?auto_1042924 ?auto_1042923 ) ) ( HOIST-AT ?auto_1042922 ?auto_1042924 ) ( not ( = ?auto_1042920 ?auto_1042922 ) ) ( AVAILABLE ?auto_1042922 ) ( SURFACE-AT ?auto_1042918 ?auto_1042924 ) ( ON ?auto_1042918 ?auto_1042921 ) ( CLEAR ?auto_1042918 ) ( not ( = ?auto_1042917 ?auto_1042921 ) ) ( not ( = ?auto_1042918 ?auto_1042921 ) ) ( not ( = ?auto_1042916 ?auto_1042921 ) ) ( TRUCK-AT ?auto_1042919 ?auto_1042923 ) ( SURFACE-AT ?auto_1042916 ?auto_1042923 ) ( CLEAR ?auto_1042916 ) ( IS-CRATE ?auto_1042917 ) ( AVAILABLE ?auto_1042920 ) ( IN ?auto_1042917 ?auto_1042919 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1042917 ?auto_1042918 )
      ( MAKE-2CRATE-VERIFY ?auto_1042916 ?auto_1042917 ?auto_1042918 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1042961 - SURFACE
      ?auto_1042962 - SURFACE
    )
    :vars
    (
      ?auto_1042967 - HOIST
      ?auto_1042963 - PLACE
      ?auto_1042964 - SURFACE
      ?auto_1042969 - PLACE
      ?auto_1042965 - HOIST
      ?auto_1042966 - SURFACE
      ?auto_1042968 - TRUCK
      ?auto_1042970 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042967 ?auto_1042963 ) ( SURFACE-AT ?auto_1042961 ?auto_1042963 ) ( CLEAR ?auto_1042961 ) ( IS-CRATE ?auto_1042962 ) ( not ( = ?auto_1042961 ?auto_1042962 ) ) ( AVAILABLE ?auto_1042967 ) ( ON ?auto_1042961 ?auto_1042964 ) ( not ( = ?auto_1042964 ?auto_1042961 ) ) ( not ( = ?auto_1042964 ?auto_1042962 ) ) ( not ( = ?auto_1042969 ?auto_1042963 ) ) ( HOIST-AT ?auto_1042965 ?auto_1042969 ) ( not ( = ?auto_1042967 ?auto_1042965 ) ) ( AVAILABLE ?auto_1042965 ) ( SURFACE-AT ?auto_1042962 ?auto_1042969 ) ( ON ?auto_1042962 ?auto_1042966 ) ( CLEAR ?auto_1042962 ) ( not ( = ?auto_1042961 ?auto_1042966 ) ) ( not ( = ?auto_1042962 ?auto_1042966 ) ) ( not ( = ?auto_1042964 ?auto_1042966 ) ) ( TRUCK-AT ?auto_1042968 ?auto_1042970 ) ( not ( = ?auto_1042970 ?auto_1042963 ) ) ( not ( = ?auto_1042969 ?auto_1042970 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1042968 ?auto_1042970 ?auto_1042963 )
      ( MAKE-1CRATE ?auto_1042961 ?auto_1042962 )
      ( MAKE-1CRATE-VERIFY ?auto_1042961 ?auto_1042962 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043000 - SURFACE
      ?auto_1043001 - SURFACE
      ?auto_1043002 - SURFACE
      ?auto_1043003 - SURFACE
    )
    :vars
    (
      ?auto_1043005 - HOIST
      ?auto_1043004 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043005 ?auto_1043004 ) ( SURFACE-AT ?auto_1043002 ?auto_1043004 ) ( CLEAR ?auto_1043002 ) ( LIFTING ?auto_1043005 ?auto_1043003 ) ( IS-CRATE ?auto_1043003 ) ( not ( = ?auto_1043002 ?auto_1043003 ) ) ( ON ?auto_1043001 ?auto_1043000 ) ( ON ?auto_1043002 ?auto_1043001 ) ( not ( = ?auto_1043000 ?auto_1043001 ) ) ( not ( = ?auto_1043000 ?auto_1043002 ) ) ( not ( = ?auto_1043000 ?auto_1043003 ) ) ( not ( = ?auto_1043001 ?auto_1043002 ) ) ( not ( = ?auto_1043001 ?auto_1043003 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043002 ?auto_1043003 )
      ( MAKE-3CRATE-VERIFY ?auto_1043000 ?auto_1043001 ?auto_1043002 ?auto_1043003 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043017 - SURFACE
      ?auto_1043018 - SURFACE
      ?auto_1043019 - SURFACE
      ?auto_1043020 - SURFACE
    )
    :vars
    (
      ?auto_1043022 - HOIST
      ?auto_1043023 - PLACE
      ?auto_1043021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043022 ?auto_1043023 ) ( SURFACE-AT ?auto_1043019 ?auto_1043023 ) ( CLEAR ?auto_1043019 ) ( IS-CRATE ?auto_1043020 ) ( not ( = ?auto_1043019 ?auto_1043020 ) ) ( TRUCK-AT ?auto_1043021 ?auto_1043023 ) ( AVAILABLE ?auto_1043022 ) ( IN ?auto_1043020 ?auto_1043021 ) ( ON ?auto_1043019 ?auto_1043018 ) ( not ( = ?auto_1043018 ?auto_1043019 ) ) ( not ( = ?auto_1043018 ?auto_1043020 ) ) ( ON ?auto_1043018 ?auto_1043017 ) ( not ( = ?auto_1043017 ?auto_1043018 ) ) ( not ( = ?auto_1043017 ?auto_1043019 ) ) ( not ( = ?auto_1043017 ?auto_1043020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043018 ?auto_1043019 ?auto_1043020 )
      ( MAKE-3CRATE-VERIFY ?auto_1043017 ?auto_1043018 ?auto_1043019 ?auto_1043020 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043038 - SURFACE
      ?auto_1043039 - SURFACE
      ?auto_1043040 - SURFACE
      ?auto_1043041 - SURFACE
    )
    :vars
    (
      ?auto_1043043 - HOIST
      ?auto_1043044 - PLACE
      ?auto_1043042 - TRUCK
      ?auto_1043045 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043043 ?auto_1043044 ) ( SURFACE-AT ?auto_1043040 ?auto_1043044 ) ( CLEAR ?auto_1043040 ) ( IS-CRATE ?auto_1043041 ) ( not ( = ?auto_1043040 ?auto_1043041 ) ) ( AVAILABLE ?auto_1043043 ) ( IN ?auto_1043041 ?auto_1043042 ) ( ON ?auto_1043040 ?auto_1043039 ) ( not ( = ?auto_1043039 ?auto_1043040 ) ) ( not ( = ?auto_1043039 ?auto_1043041 ) ) ( TRUCK-AT ?auto_1043042 ?auto_1043045 ) ( not ( = ?auto_1043045 ?auto_1043044 ) ) ( ON ?auto_1043039 ?auto_1043038 ) ( not ( = ?auto_1043038 ?auto_1043039 ) ) ( not ( = ?auto_1043038 ?auto_1043040 ) ) ( not ( = ?auto_1043038 ?auto_1043041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043039 ?auto_1043040 ?auto_1043041 )
      ( MAKE-3CRATE-VERIFY ?auto_1043038 ?auto_1043039 ?auto_1043040 ?auto_1043041 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043062 - SURFACE
      ?auto_1043063 - SURFACE
      ?auto_1043064 - SURFACE
      ?auto_1043065 - SURFACE
    )
    :vars
    (
      ?auto_1043068 - HOIST
      ?auto_1043069 - PLACE
      ?auto_1043066 - TRUCK
      ?auto_1043067 - PLACE
      ?auto_1043070 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043068 ?auto_1043069 ) ( SURFACE-AT ?auto_1043064 ?auto_1043069 ) ( CLEAR ?auto_1043064 ) ( IS-CRATE ?auto_1043065 ) ( not ( = ?auto_1043064 ?auto_1043065 ) ) ( AVAILABLE ?auto_1043068 ) ( ON ?auto_1043064 ?auto_1043063 ) ( not ( = ?auto_1043063 ?auto_1043064 ) ) ( not ( = ?auto_1043063 ?auto_1043065 ) ) ( TRUCK-AT ?auto_1043066 ?auto_1043067 ) ( not ( = ?auto_1043067 ?auto_1043069 ) ) ( HOIST-AT ?auto_1043070 ?auto_1043067 ) ( LIFTING ?auto_1043070 ?auto_1043065 ) ( not ( = ?auto_1043068 ?auto_1043070 ) ) ( ON ?auto_1043063 ?auto_1043062 ) ( not ( = ?auto_1043062 ?auto_1043063 ) ) ( not ( = ?auto_1043062 ?auto_1043064 ) ) ( not ( = ?auto_1043062 ?auto_1043065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043063 ?auto_1043064 ?auto_1043065 )
      ( MAKE-3CRATE-VERIFY ?auto_1043062 ?auto_1043063 ?auto_1043064 ?auto_1043065 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043089 - SURFACE
      ?auto_1043090 - SURFACE
      ?auto_1043091 - SURFACE
      ?auto_1043092 - SURFACE
    )
    :vars
    (
      ?auto_1043094 - HOIST
      ?auto_1043093 - PLACE
      ?auto_1043097 - TRUCK
      ?auto_1043095 - PLACE
      ?auto_1043098 - HOIST
      ?auto_1043096 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043094 ?auto_1043093 ) ( SURFACE-AT ?auto_1043091 ?auto_1043093 ) ( CLEAR ?auto_1043091 ) ( IS-CRATE ?auto_1043092 ) ( not ( = ?auto_1043091 ?auto_1043092 ) ) ( AVAILABLE ?auto_1043094 ) ( ON ?auto_1043091 ?auto_1043090 ) ( not ( = ?auto_1043090 ?auto_1043091 ) ) ( not ( = ?auto_1043090 ?auto_1043092 ) ) ( TRUCK-AT ?auto_1043097 ?auto_1043095 ) ( not ( = ?auto_1043095 ?auto_1043093 ) ) ( HOIST-AT ?auto_1043098 ?auto_1043095 ) ( not ( = ?auto_1043094 ?auto_1043098 ) ) ( AVAILABLE ?auto_1043098 ) ( SURFACE-AT ?auto_1043092 ?auto_1043095 ) ( ON ?auto_1043092 ?auto_1043096 ) ( CLEAR ?auto_1043092 ) ( not ( = ?auto_1043091 ?auto_1043096 ) ) ( not ( = ?auto_1043092 ?auto_1043096 ) ) ( not ( = ?auto_1043090 ?auto_1043096 ) ) ( ON ?auto_1043090 ?auto_1043089 ) ( not ( = ?auto_1043089 ?auto_1043090 ) ) ( not ( = ?auto_1043089 ?auto_1043091 ) ) ( not ( = ?auto_1043089 ?auto_1043092 ) ) ( not ( = ?auto_1043089 ?auto_1043096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043090 ?auto_1043091 ?auto_1043092 )
      ( MAKE-3CRATE-VERIFY ?auto_1043089 ?auto_1043090 ?auto_1043091 ?auto_1043092 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043117 - SURFACE
      ?auto_1043118 - SURFACE
      ?auto_1043119 - SURFACE
      ?auto_1043120 - SURFACE
    )
    :vars
    (
      ?auto_1043124 - HOIST
      ?auto_1043121 - PLACE
      ?auto_1043126 - PLACE
      ?auto_1043123 - HOIST
      ?auto_1043122 - SURFACE
      ?auto_1043125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043124 ?auto_1043121 ) ( SURFACE-AT ?auto_1043119 ?auto_1043121 ) ( CLEAR ?auto_1043119 ) ( IS-CRATE ?auto_1043120 ) ( not ( = ?auto_1043119 ?auto_1043120 ) ) ( AVAILABLE ?auto_1043124 ) ( ON ?auto_1043119 ?auto_1043118 ) ( not ( = ?auto_1043118 ?auto_1043119 ) ) ( not ( = ?auto_1043118 ?auto_1043120 ) ) ( not ( = ?auto_1043126 ?auto_1043121 ) ) ( HOIST-AT ?auto_1043123 ?auto_1043126 ) ( not ( = ?auto_1043124 ?auto_1043123 ) ) ( AVAILABLE ?auto_1043123 ) ( SURFACE-AT ?auto_1043120 ?auto_1043126 ) ( ON ?auto_1043120 ?auto_1043122 ) ( CLEAR ?auto_1043120 ) ( not ( = ?auto_1043119 ?auto_1043122 ) ) ( not ( = ?auto_1043120 ?auto_1043122 ) ) ( not ( = ?auto_1043118 ?auto_1043122 ) ) ( TRUCK-AT ?auto_1043125 ?auto_1043121 ) ( ON ?auto_1043118 ?auto_1043117 ) ( not ( = ?auto_1043117 ?auto_1043118 ) ) ( not ( = ?auto_1043117 ?auto_1043119 ) ) ( not ( = ?auto_1043117 ?auto_1043120 ) ) ( not ( = ?auto_1043117 ?auto_1043122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043118 ?auto_1043119 ?auto_1043120 )
      ( MAKE-3CRATE-VERIFY ?auto_1043117 ?auto_1043118 ?auto_1043119 ?auto_1043120 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043145 - SURFACE
      ?auto_1043146 - SURFACE
      ?auto_1043147 - SURFACE
      ?auto_1043148 - SURFACE
    )
    :vars
    (
      ?auto_1043153 - HOIST
      ?auto_1043151 - PLACE
      ?auto_1043152 - PLACE
      ?auto_1043149 - HOIST
      ?auto_1043150 - SURFACE
      ?auto_1043154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043153 ?auto_1043151 ) ( IS-CRATE ?auto_1043148 ) ( not ( = ?auto_1043147 ?auto_1043148 ) ) ( not ( = ?auto_1043146 ?auto_1043147 ) ) ( not ( = ?auto_1043146 ?auto_1043148 ) ) ( not ( = ?auto_1043152 ?auto_1043151 ) ) ( HOIST-AT ?auto_1043149 ?auto_1043152 ) ( not ( = ?auto_1043153 ?auto_1043149 ) ) ( AVAILABLE ?auto_1043149 ) ( SURFACE-AT ?auto_1043148 ?auto_1043152 ) ( ON ?auto_1043148 ?auto_1043150 ) ( CLEAR ?auto_1043148 ) ( not ( = ?auto_1043147 ?auto_1043150 ) ) ( not ( = ?auto_1043148 ?auto_1043150 ) ) ( not ( = ?auto_1043146 ?auto_1043150 ) ) ( TRUCK-AT ?auto_1043154 ?auto_1043151 ) ( SURFACE-AT ?auto_1043146 ?auto_1043151 ) ( CLEAR ?auto_1043146 ) ( LIFTING ?auto_1043153 ?auto_1043147 ) ( IS-CRATE ?auto_1043147 ) ( ON ?auto_1043146 ?auto_1043145 ) ( not ( = ?auto_1043145 ?auto_1043146 ) ) ( not ( = ?auto_1043145 ?auto_1043147 ) ) ( not ( = ?auto_1043145 ?auto_1043148 ) ) ( not ( = ?auto_1043145 ?auto_1043150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043146 ?auto_1043147 ?auto_1043148 )
      ( MAKE-3CRATE-VERIFY ?auto_1043145 ?auto_1043146 ?auto_1043147 ?auto_1043148 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1043173 - SURFACE
      ?auto_1043174 - SURFACE
      ?auto_1043175 - SURFACE
      ?auto_1043176 - SURFACE
    )
    :vars
    (
      ?auto_1043181 - HOIST
      ?auto_1043178 - PLACE
      ?auto_1043180 - PLACE
      ?auto_1043177 - HOIST
      ?auto_1043182 - SURFACE
      ?auto_1043179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043181 ?auto_1043178 ) ( IS-CRATE ?auto_1043176 ) ( not ( = ?auto_1043175 ?auto_1043176 ) ) ( not ( = ?auto_1043174 ?auto_1043175 ) ) ( not ( = ?auto_1043174 ?auto_1043176 ) ) ( not ( = ?auto_1043180 ?auto_1043178 ) ) ( HOIST-AT ?auto_1043177 ?auto_1043180 ) ( not ( = ?auto_1043181 ?auto_1043177 ) ) ( AVAILABLE ?auto_1043177 ) ( SURFACE-AT ?auto_1043176 ?auto_1043180 ) ( ON ?auto_1043176 ?auto_1043182 ) ( CLEAR ?auto_1043176 ) ( not ( = ?auto_1043175 ?auto_1043182 ) ) ( not ( = ?auto_1043176 ?auto_1043182 ) ) ( not ( = ?auto_1043174 ?auto_1043182 ) ) ( TRUCK-AT ?auto_1043179 ?auto_1043178 ) ( SURFACE-AT ?auto_1043174 ?auto_1043178 ) ( CLEAR ?auto_1043174 ) ( IS-CRATE ?auto_1043175 ) ( AVAILABLE ?auto_1043181 ) ( IN ?auto_1043175 ?auto_1043179 ) ( ON ?auto_1043174 ?auto_1043173 ) ( not ( = ?auto_1043173 ?auto_1043174 ) ) ( not ( = ?auto_1043173 ?auto_1043175 ) ) ( not ( = ?auto_1043173 ?auto_1043176 ) ) ( not ( = ?auto_1043173 ?auto_1043182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043174 ?auto_1043175 ?auto_1043176 )
      ( MAKE-3CRATE-VERIFY ?auto_1043173 ?auto_1043174 ?auto_1043175 ?auto_1043176 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043464 - SURFACE
      ?auto_1043465 - SURFACE
      ?auto_1043466 - SURFACE
      ?auto_1043467 - SURFACE
      ?auto_1043468 - SURFACE
    )
    :vars
    (
      ?auto_1043469 - HOIST
      ?auto_1043470 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043469 ?auto_1043470 ) ( SURFACE-AT ?auto_1043467 ?auto_1043470 ) ( CLEAR ?auto_1043467 ) ( LIFTING ?auto_1043469 ?auto_1043468 ) ( IS-CRATE ?auto_1043468 ) ( not ( = ?auto_1043467 ?auto_1043468 ) ) ( ON ?auto_1043465 ?auto_1043464 ) ( ON ?auto_1043466 ?auto_1043465 ) ( ON ?auto_1043467 ?auto_1043466 ) ( not ( = ?auto_1043464 ?auto_1043465 ) ) ( not ( = ?auto_1043464 ?auto_1043466 ) ) ( not ( = ?auto_1043464 ?auto_1043467 ) ) ( not ( = ?auto_1043464 ?auto_1043468 ) ) ( not ( = ?auto_1043465 ?auto_1043466 ) ) ( not ( = ?auto_1043465 ?auto_1043467 ) ) ( not ( = ?auto_1043465 ?auto_1043468 ) ) ( not ( = ?auto_1043466 ?auto_1043467 ) ) ( not ( = ?auto_1043466 ?auto_1043468 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1043467 ?auto_1043468 )
      ( MAKE-4CRATE-VERIFY ?auto_1043464 ?auto_1043465 ?auto_1043466 ?auto_1043467 ?auto_1043468 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043489 - SURFACE
      ?auto_1043490 - SURFACE
      ?auto_1043491 - SURFACE
      ?auto_1043492 - SURFACE
      ?auto_1043493 - SURFACE
    )
    :vars
    (
      ?auto_1043494 - HOIST
      ?auto_1043496 - PLACE
      ?auto_1043495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043494 ?auto_1043496 ) ( SURFACE-AT ?auto_1043492 ?auto_1043496 ) ( CLEAR ?auto_1043492 ) ( IS-CRATE ?auto_1043493 ) ( not ( = ?auto_1043492 ?auto_1043493 ) ) ( TRUCK-AT ?auto_1043495 ?auto_1043496 ) ( AVAILABLE ?auto_1043494 ) ( IN ?auto_1043493 ?auto_1043495 ) ( ON ?auto_1043492 ?auto_1043491 ) ( not ( = ?auto_1043491 ?auto_1043492 ) ) ( not ( = ?auto_1043491 ?auto_1043493 ) ) ( ON ?auto_1043490 ?auto_1043489 ) ( ON ?auto_1043491 ?auto_1043490 ) ( not ( = ?auto_1043489 ?auto_1043490 ) ) ( not ( = ?auto_1043489 ?auto_1043491 ) ) ( not ( = ?auto_1043489 ?auto_1043492 ) ) ( not ( = ?auto_1043489 ?auto_1043493 ) ) ( not ( = ?auto_1043490 ?auto_1043491 ) ) ( not ( = ?auto_1043490 ?auto_1043492 ) ) ( not ( = ?auto_1043490 ?auto_1043493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043491 ?auto_1043492 ?auto_1043493 )
      ( MAKE-4CRATE-VERIFY ?auto_1043489 ?auto_1043490 ?auto_1043491 ?auto_1043492 ?auto_1043493 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043519 - SURFACE
      ?auto_1043520 - SURFACE
      ?auto_1043521 - SURFACE
      ?auto_1043522 - SURFACE
      ?auto_1043523 - SURFACE
    )
    :vars
    (
      ?auto_1043524 - HOIST
      ?auto_1043525 - PLACE
      ?auto_1043527 - TRUCK
      ?auto_1043526 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043524 ?auto_1043525 ) ( SURFACE-AT ?auto_1043522 ?auto_1043525 ) ( CLEAR ?auto_1043522 ) ( IS-CRATE ?auto_1043523 ) ( not ( = ?auto_1043522 ?auto_1043523 ) ) ( AVAILABLE ?auto_1043524 ) ( IN ?auto_1043523 ?auto_1043527 ) ( ON ?auto_1043522 ?auto_1043521 ) ( not ( = ?auto_1043521 ?auto_1043522 ) ) ( not ( = ?auto_1043521 ?auto_1043523 ) ) ( TRUCK-AT ?auto_1043527 ?auto_1043526 ) ( not ( = ?auto_1043526 ?auto_1043525 ) ) ( ON ?auto_1043520 ?auto_1043519 ) ( ON ?auto_1043521 ?auto_1043520 ) ( not ( = ?auto_1043519 ?auto_1043520 ) ) ( not ( = ?auto_1043519 ?auto_1043521 ) ) ( not ( = ?auto_1043519 ?auto_1043522 ) ) ( not ( = ?auto_1043519 ?auto_1043523 ) ) ( not ( = ?auto_1043520 ?auto_1043521 ) ) ( not ( = ?auto_1043520 ?auto_1043522 ) ) ( not ( = ?auto_1043520 ?auto_1043523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043521 ?auto_1043522 ?auto_1043523 )
      ( MAKE-4CRATE-VERIFY ?auto_1043519 ?auto_1043520 ?auto_1043521 ?auto_1043522 ?auto_1043523 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043553 - SURFACE
      ?auto_1043554 - SURFACE
      ?auto_1043555 - SURFACE
      ?auto_1043556 - SURFACE
      ?auto_1043557 - SURFACE
    )
    :vars
    (
      ?auto_1043558 - HOIST
      ?auto_1043559 - PLACE
      ?auto_1043562 - TRUCK
      ?auto_1043560 - PLACE
      ?auto_1043561 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043558 ?auto_1043559 ) ( SURFACE-AT ?auto_1043556 ?auto_1043559 ) ( CLEAR ?auto_1043556 ) ( IS-CRATE ?auto_1043557 ) ( not ( = ?auto_1043556 ?auto_1043557 ) ) ( AVAILABLE ?auto_1043558 ) ( ON ?auto_1043556 ?auto_1043555 ) ( not ( = ?auto_1043555 ?auto_1043556 ) ) ( not ( = ?auto_1043555 ?auto_1043557 ) ) ( TRUCK-AT ?auto_1043562 ?auto_1043560 ) ( not ( = ?auto_1043560 ?auto_1043559 ) ) ( HOIST-AT ?auto_1043561 ?auto_1043560 ) ( LIFTING ?auto_1043561 ?auto_1043557 ) ( not ( = ?auto_1043558 ?auto_1043561 ) ) ( ON ?auto_1043554 ?auto_1043553 ) ( ON ?auto_1043555 ?auto_1043554 ) ( not ( = ?auto_1043553 ?auto_1043554 ) ) ( not ( = ?auto_1043553 ?auto_1043555 ) ) ( not ( = ?auto_1043553 ?auto_1043556 ) ) ( not ( = ?auto_1043553 ?auto_1043557 ) ) ( not ( = ?auto_1043554 ?auto_1043555 ) ) ( not ( = ?auto_1043554 ?auto_1043556 ) ) ( not ( = ?auto_1043554 ?auto_1043557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043555 ?auto_1043556 ?auto_1043557 )
      ( MAKE-4CRATE-VERIFY ?auto_1043553 ?auto_1043554 ?auto_1043555 ?auto_1043556 ?auto_1043557 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043591 - SURFACE
      ?auto_1043592 - SURFACE
      ?auto_1043593 - SURFACE
      ?auto_1043594 - SURFACE
      ?auto_1043595 - SURFACE
    )
    :vars
    (
      ?auto_1043600 - HOIST
      ?auto_1043601 - PLACE
      ?auto_1043598 - TRUCK
      ?auto_1043599 - PLACE
      ?auto_1043596 - HOIST
      ?auto_1043597 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043600 ?auto_1043601 ) ( SURFACE-AT ?auto_1043594 ?auto_1043601 ) ( CLEAR ?auto_1043594 ) ( IS-CRATE ?auto_1043595 ) ( not ( = ?auto_1043594 ?auto_1043595 ) ) ( AVAILABLE ?auto_1043600 ) ( ON ?auto_1043594 ?auto_1043593 ) ( not ( = ?auto_1043593 ?auto_1043594 ) ) ( not ( = ?auto_1043593 ?auto_1043595 ) ) ( TRUCK-AT ?auto_1043598 ?auto_1043599 ) ( not ( = ?auto_1043599 ?auto_1043601 ) ) ( HOIST-AT ?auto_1043596 ?auto_1043599 ) ( not ( = ?auto_1043600 ?auto_1043596 ) ) ( AVAILABLE ?auto_1043596 ) ( SURFACE-AT ?auto_1043595 ?auto_1043599 ) ( ON ?auto_1043595 ?auto_1043597 ) ( CLEAR ?auto_1043595 ) ( not ( = ?auto_1043594 ?auto_1043597 ) ) ( not ( = ?auto_1043595 ?auto_1043597 ) ) ( not ( = ?auto_1043593 ?auto_1043597 ) ) ( ON ?auto_1043592 ?auto_1043591 ) ( ON ?auto_1043593 ?auto_1043592 ) ( not ( = ?auto_1043591 ?auto_1043592 ) ) ( not ( = ?auto_1043591 ?auto_1043593 ) ) ( not ( = ?auto_1043591 ?auto_1043594 ) ) ( not ( = ?auto_1043591 ?auto_1043595 ) ) ( not ( = ?auto_1043591 ?auto_1043597 ) ) ( not ( = ?auto_1043592 ?auto_1043593 ) ) ( not ( = ?auto_1043592 ?auto_1043594 ) ) ( not ( = ?auto_1043592 ?auto_1043595 ) ) ( not ( = ?auto_1043592 ?auto_1043597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043593 ?auto_1043594 ?auto_1043595 )
      ( MAKE-4CRATE-VERIFY ?auto_1043591 ?auto_1043592 ?auto_1043593 ?auto_1043594 ?auto_1043595 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043630 - SURFACE
      ?auto_1043631 - SURFACE
      ?auto_1043632 - SURFACE
      ?auto_1043633 - SURFACE
      ?auto_1043634 - SURFACE
    )
    :vars
    (
      ?auto_1043636 - HOIST
      ?auto_1043637 - PLACE
      ?auto_1043638 - PLACE
      ?auto_1043635 - HOIST
      ?auto_1043640 - SURFACE
      ?auto_1043639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043636 ?auto_1043637 ) ( SURFACE-AT ?auto_1043633 ?auto_1043637 ) ( CLEAR ?auto_1043633 ) ( IS-CRATE ?auto_1043634 ) ( not ( = ?auto_1043633 ?auto_1043634 ) ) ( AVAILABLE ?auto_1043636 ) ( ON ?auto_1043633 ?auto_1043632 ) ( not ( = ?auto_1043632 ?auto_1043633 ) ) ( not ( = ?auto_1043632 ?auto_1043634 ) ) ( not ( = ?auto_1043638 ?auto_1043637 ) ) ( HOIST-AT ?auto_1043635 ?auto_1043638 ) ( not ( = ?auto_1043636 ?auto_1043635 ) ) ( AVAILABLE ?auto_1043635 ) ( SURFACE-AT ?auto_1043634 ?auto_1043638 ) ( ON ?auto_1043634 ?auto_1043640 ) ( CLEAR ?auto_1043634 ) ( not ( = ?auto_1043633 ?auto_1043640 ) ) ( not ( = ?auto_1043634 ?auto_1043640 ) ) ( not ( = ?auto_1043632 ?auto_1043640 ) ) ( TRUCK-AT ?auto_1043639 ?auto_1043637 ) ( ON ?auto_1043631 ?auto_1043630 ) ( ON ?auto_1043632 ?auto_1043631 ) ( not ( = ?auto_1043630 ?auto_1043631 ) ) ( not ( = ?auto_1043630 ?auto_1043632 ) ) ( not ( = ?auto_1043630 ?auto_1043633 ) ) ( not ( = ?auto_1043630 ?auto_1043634 ) ) ( not ( = ?auto_1043630 ?auto_1043640 ) ) ( not ( = ?auto_1043631 ?auto_1043632 ) ) ( not ( = ?auto_1043631 ?auto_1043633 ) ) ( not ( = ?auto_1043631 ?auto_1043634 ) ) ( not ( = ?auto_1043631 ?auto_1043640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043632 ?auto_1043633 ?auto_1043634 )
      ( MAKE-4CRATE-VERIFY ?auto_1043630 ?auto_1043631 ?auto_1043632 ?auto_1043633 ?auto_1043634 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043669 - SURFACE
      ?auto_1043670 - SURFACE
      ?auto_1043671 - SURFACE
      ?auto_1043672 - SURFACE
      ?auto_1043673 - SURFACE
    )
    :vars
    (
      ?auto_1043674 - HOIST
      ?auto_1043679 - PLACE
      ?auto_1043675 - PLACE
      ?auto_1043676 - HOIST
      ?auto_1043678 - SURFACE
      ?auto_1043677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043674 ?auto_1043679 ) ( IS-CRATE ?auto_1043673 ) ( not ( = ?auto_1043672 ?auto_1043673 ) ) ( not ( = ?auto_1043671 ?auto_1043672 ) ) ( not ( = ?auto_1043671 ?auto_1043673 ) ) ( not ( = ?auto_1043675 ?auto_1043679 ) ) ( HOIST-AT ?auto_1043676 ?auto_1043675 ) ( not ( = ?auto_1043674 ?auto_1043676 ) ) ( AVAILABLE ?auto_1043676 ) ( SURFACE-AT ?auto_1043673 ?auto_1043675 ) ( ON ?auto_1043673 ?auto_1043678 ) ( CLEAR ?auto_1043673 ) ( not ( = ?auto_1043672 ?auto_1043678 ) ) ( not ( = ?auto_1043673 ?auto_1043678 ) ) ( not ( = ?auto_1043671 ?auto_1043678 ) ) ( TRUCK-AT ?auto_1043677 ?auto_1043679 ) ( SURFACE-AT ?auto_1043671 ?auto_1043679 ) ( CLEAR ?auto_1043671 ) ( LIFTING ?auto_1043674 ?auto_1043672 ) ( IS-CRATE ?auto_1043672 ) ( ON ?auto_1043670 ?auto_1043669 ) ( ON ?auto_1043671 ?auto_1043670 ) ( not ( = ?auto_1043669 ?auto_1043670 ) ) ( not ( = ?auto_1043669 ?auto_1043671 ) ) ( not ( = ?auto_1043669 ?auto_1043672 ) ) ( not ( = ?auto_1043669 ?auto_1043673 ) ) ( not ( = ?auto_1043669 ?auto_1043678 ) ) ( not ( = ?auto_1043670 ?auto_1043671 ) ) ( not ( = ?auto_1043670 ?auto_1043672 ) ) ( not ( = ?auto_1043670 ?auto_1043673 ) ) ( not ( = ?auto_1043670 ?auto_1043678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043671 ?auto_1043672 ?auto_1043673 )
      ( MAKE-4CRATE-VERIFY ?auto_1043669 ?auto_1043670 ?auto_1043671 ?auto_1043672 ?auto_1043673 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1043708 - SURFACE
      ?auto_1043709 - SURFACE
      ?auto_1043710 - SURFACE
      ?auto_1043711 - SURFACE
      ?auto_1043712 - SURFACE
    )
    :vars
    (
      ?auto_1043717 - HOIST
      ?auto_1043715 - PLACE
      ?auto_1043713 - PLACE
      ?auto_1043716 - HOIST
      ?auto_1043718 - SURFACE
      ?auto_1043714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1043717 ?auto_1043715 ) ( IS-CRATE ?auto_1043712 ) ( not ( = ?auto_1043711 ?auto_1043712 ) ) ( not ( = ?auto_1043710 ?auto_1043711 ) ) ( not ( = ?auto_1043710 ?auto_1043712 ) ) ( not ( = ?auto_1043713 ?auto_1043715 ) ) ( HOIST-AT ?auto_1043716 ?auto_1043713 ) ( not ( = ?auto_1043717 ?auto_1043716 ) ) ( AVAILABLE ?auto_1043716 ) ( SURFACE-AT ?auto_1043712 ?auto_1043713 ) ( ON ?auto_1043712 ?auto_1043718 ) ( CLEAR ?auto_1043712 ) ( not ( = ?auto_1043711 ?auto_1043718 ) ) ( not ( = ?auto_1043712 ?auto_1043718 ) ) ( not ( = ?auto_1043710 ?auto_1043718 ) ) ( TRUCK-AT ?auto_1043714 ?auto_1043715 ) ( SURFACE-AT ?auto_1043710 ?auto_1043715 ) ( CLEAR ?auto_1043710 ) ( IS-CRATE ?auto_1043711 ) ( AVAILABLE ?auto_1043717 ) ( IN ?auto_1043711 ?auto_1043714 ) ( ON ?auto_1043709 ?auto_1043708 ) ( ON ?auto_1043710 ?auto_1043709 ) ( not ( = ?auto_1043708 ?auto_1043709 ) ) ( not ( = ?auto_1043708 ?auto_1043710 ) ) ( not ( = ?auto_1043708 ?auto_1043711 ) ) ( not ( = ?auto_1043708 ?auto_1043712 ) ) ( not ( = ?auto_1043708 ?auto_1043718 ) ) ( not ( = ?auto_1043709 ?auto_1043710 ) ) ( not ( = ?auto_1043709 ?auto_1043711 ) ) ( not ( = ?auto_1043709 ?auto_1043712 ) ) ( not ( = ?auto_1043709 ?auto_1043718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1043710 ?auto_1043711 ?auto_1043712 )
      ( MAKE-4CRATE-VERIFY ?auto_1043708 ?auto_1043709 ?auto_1043710 ?auto_1043711 ?auto_1043712 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044368 - SURFACE
      ?auto_1044369 - SURFACE
      ?auto_1044370 - SURFACE
      ?auto_1044371 - SURFACE
      ?auto_1044372 - SURFACE
      ?auto_1044373 - SURFACE
    )
    :vars
    (
      ?auto_1044374 - HOIST
      ?auto_1044375 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044374 ?auto_1044375 ) ( SURFACE-AT ?auto_1044372 ?auto_1044375 ) ( CLEAR ?auto_1044372 ) ( LIFTING ?auto_1044374 ?auto_1044373 ) ( IS-CRATE ?auto_1044373 ) ( not ( = ?auto_1044372 ?auto_1044373 ) ) ( ON ?auto_1044369 ?auto_1044368 ) ( ON ?auto_1044370 ?auto_1044369 ) ( ON ?auto_1044371 ?auto_1044370 ) ( ON ?auto_1044372 ?auto_1044371 ) ( not ( = ?auto_1044368 ?auto_1044369 ) ) ( not ( = ?auto_1044368 ?auto_1044370 ) ) ( not ( = ?auto_1044368 ?auto_1044371 ) ) ( not ( = ?auto_1044368 ?auto_1044372 ) ) ( not ( = ?auto_1044368 ?auto_1044373 ) ) ( not ( = ?auto_1044369 ?auto_1044370 ) ) ( not ( = ?auto_1044369 ?auto_1044371 ) ) ( not ( = ?auto_1044369 ?auto_1044372 ) ) ( not ( = ?auto_1044369 ?auto_1044373 ) ) ( not ( = ?auto_1044370 ?auto_1044371 ) ) ( not ( = ?auto_1044370 ?auto_1044372 ) ) ( not ( = ?auto_1044370 ?auto_1044373 ) ) ( not ( = ?auto_1044371 ?auto_1044372 ) ) ( not ( = ?auto_1044371 ?auto_1044373 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1044372 ?auto_1044373 )
      ( MAKE-5CRATE-VERIFY ?auto_1044368 ?auto_1044369 ?auto_1044370 ?auto_1044371 ?auto_1044372 ?auto_1044373 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044402 - SURFACE
      ?auto_1044403 - SURFACE
      ?auto_1044404 - SURFACE
      ?auto_1044405 - SURFACE
      ?auto_1044406 - SURFACE
      ?auto_1044407 - SURFACE
    )
    :vars
    (
      ?auto_1044408 - HOIST
      ?auto_1044409 - PLACE
      ?auto_1044410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044408 ?auto_1044409 ) ( SURFACE-AT ?auto_1044406 ?auto_1044409 ) ( CLEAR ?auto_1044406 ) ( IS-CRATE ?auto_1044407 ) ( not ( = ?auto_1044406 ?auto_1044407 ) ) ( TRUCK-AT ?auto_1044410 ?auto_1044409 ) ( AVAILABLE ?auto_1044408 ) ( IN ?auto_1044407 ?auto_1044410 ) ( ON ?auto_1044406 ?auto_1044405 ) ( not ( = ?auto_1044405 ?auto_1044406 ) ) ( not ( = ?auto_1044405 ?auto_1044407 ) ) ( ON ?auto_1044403 ?auto_1044402 ) ( ON ?auto_1044404 ?auto_1044403 ) ( ON ?auto_1044405 ?auto_1044404 ) ( not ( = ?auto_1044402 ?auto_1044403 ) ) ( not ( = ?auto_1044402 ?auto_1044404 ) ) ( not ( = ?auto_1044402 ?auto_1044405 ) ) ( not ( = ?auto_1044402 ?auto_1044406 ) ) ( not ( = ?auto_1044402 ?auto_1044407 ) ) ( not ( = ?auto_1044403 ?auto_1044404 ) ) ( not ( = ?auto_1044403 ?auto_1044405 ) ) ( not ( = ?auto_1044403 ?auto_1044406 ) ) ( not ( = ?auto_1044403 ?auto_1044407 ) ) ( not ( = ?auto_1044404 ?auto_1044405 ) ) ( not ( = ?auto_1044404 ?auto_1044406 ) ) ( not ( = ?auto_1044404 ?auto_1044407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044405 ?auto_1044406 ?auto_1044407 )
      ( MAKE-5CRATE-VERIFY ?auto_1044402 ?auto_1044403 ?auto_1044404 ?auto_1044405 ?auto_1044406 ?auto_1044407 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044442 - SURFACE
      ?auto_1044443 - SURFACE
      ?auto_1044444 - SURFACE
      ?auto_1044445 - SURFACE
      ?auto_1044446 - SURFACE
      ?auto_1044447 - SURFACE
    )
    :vars
    (
      ?auto_1044451 - HOIST
      ?auto_1044449 - PLACE
      ?auto_1044450 - TRUCK
      ?auto_1044448 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044451 ?auto_1044449 ) ( SURFACE-AT ?auto_1044446 ?auto_1044449 ) ( CLEAR ?auto_1044446 ) ( IS-CRATE ?auto_1044447 ) ( not ( = ?auto_1044446 ?auto_1044447 ) ) ( AVAILABLE ?auto_1044451 ) ( IN ?auto_1044447 ?auto_1044450 ) ( ON ?auto_1044446 ?auto_1044445 ) ( not ( = ?auto_1044445 ?auto_1044446 ) ) ( not ( = ?auto_1044445 ?auto_1044447 ) ) ( TRUCK-AT ?auto_1044450 ?auto_1044448 ) ( not ( = ?auto_1044448 ?auto_1044449 ) ) ( ON ?auto_1044443 ?auto_1044442 ) ( ON ?auto_1044444 ?auto_1044443 ) ( ON ?auto_1044445 ?auto_1044444 ) ( not ( = ?auto_1044442 ?auto_1044443 ) ) ( not ( = ?auto_1044442 ?auto_1044444 ) ) ( not ( = ?auto_1044442 ?auto_1044445 ) ) ( not ( = ?auto_1044442 ?auto_1044446 ) ) ( not ( = ?auto_1044442 ?auto_1044447 ) ) ( not ( = ?auto_1044443 ?auto_1044444 ) ) ( not ( = ?auto_1044443 ?auto_1044445 ) ) ( not ( = ?auto_1044443 ?auto_1044446 ) ) ( not ( = ?auto_1044443 ?auto_1044447 ) ) ( not ( = ?auto_1044444 ?auto_1044445 ) ) ( not ( = ?auto_1044444 ?auto_1044446 ) ) ( not ( = ?auto_1044444 ?auto_1044447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044445 ?auto_1044446 ?auto_1044447 )
      ( MAKE-5CRATE-VERIFY ?auto_1044442 ?auto_1044443 ?auto_1044444 ?auto_1044445 ?auto_1044446 ?auto_1044447 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044487 - SURFACE
      ?auto_1044488 - SURFACE
      ?auto_1044489 - SURFACE
      ?auto_1044490 - SURFACE
      ?auto_1044491 - SURFACE
      ?auto_1044492 - SURFACE
    )
    :vars
    (
      ?auto_1044493 - HOIST
      ?auto_1044497 - PLACE
      ?auto_1044495 - TRUCK
      ?auto_1044496 - PLACE
      ?auto_1044494 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044493 ?auto_1044497 ) ( SURFACE-AT ?auto_1044491 ?auto_1044497 ) ( CLEAR ?auto_1044491 ) ( IS-CRATE ?auto_1044492 ) ( not ( = ?auto_1044491 ?auto_1044492 ) ) ( AVAILABLE ?auto_1044493 ) ( ON ?auto_1044491 ?auto_1044490 ) ( not ( = ?auto_1044490 ?auto_1044491 ) ) ( not ( = ?auto_1044490 ?auto_1044492 ) ) ( TRUCK-AT ?auto_1044495 ?auto_1044496 ) ( not ( = ?auto_1044496 ?auto_1044497 ) ) ( HOIST-AT ?auto_1044494 ?auto_1044496 ) ( LIFTING ?auto_1044494 ?auto_1044492 ) ( not ( = ?auto_1044493 ?auto_1044494 ) ) ( ON ?auto_1044488 ?auto_1044487 ) ( ON ?auto_1044489 ?auto_1044488 ) ( ON ?auto_1044490 ?auto_1044489 ) ( not ( = ?auto_1044487 ?auto_1044488 ) ) ( not ( = ?auto_1044487 ?auto_1044489 ) ) ( not ( = ?auto_1044487 ?auto_1044490 ) ) ( not ( = ?auto_1044487 ?auto_1044491 ) ) ( not ( = ?auto_1044487 ?auto_1044492 ) ) ( not ( = ?auto_1044488 ?auto_1044489 ) ) ( not ( = ?auto_1044488 ?auto_1044490 ) ) ( not ( = ?auto_1044488 ?auto_1044491 ) ) ( not ( = ?auto_1044488 ?auto_1044492 ) ) ( not ( = ?auto_1044489 ?auto_1044490 ) ) ( not ( = ?auto_1044489 ?auto_1044491 ) ) ( not ( = ?auto_1044489 ?auto_1044492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044490 ?auto_1044491 ?auto_1044492 )
      ( MAKE-5CRATE-VERIFY ?auto_1044487 ?auto_1044488 ?auto_1044489 ?auto_1044490 ?auto_1044491 ?auto_1044492 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044537 - SURFACE
      ?auto_1044538 - SURFACE
      ?auto_1044539 - SURFACE
      ?auto_1044540 - SURFACE
      ?auto_1044541 - SURFACE
      ?auto_1044542 - SURFACE
    )
    :vars
    (
      ?auto_1044548 - HOIST
      ?auto_1044545 - PLACE
      ?auto_1044547 - TRUCK
      ?auto_1044543 - PLACE
      ?auto_1044546 - HOIST
      ?auto_1044544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044548 ?auto_1044545 ) ( SURFACE-AT ?auto_1044541 ?auto_1044545 ) ( CLEAR ?auto_1044541 ) ( IS-CRATE ?auto_1044542 ) ( not ( = ?auto_1044541 ?auto_1044542 ) ) ( AVAILABLE ?auto_1044548 ) ( ON ?auto_1044541 ?auto_1044540 ) ( not ( = ?auto_1044540 ?auto_1044541 ) ) ( not ( = ?auto_1044540 ?auto_1044542 ) ) ( TRUCK-AT ?auto_1044547 ?auto_1044543 ) ( not ( = ?auto_1044543 ?auto_1044545 ) ) ( HOIST-AT ?auto_1044546 ?auto_1044543 ) ( not ( = ?auto_1044548 ?auto_1044546 ) ) ( AVAILABLE ?auto_1044546 ) ( SURFACE-AT ?auto_1044542 ?auto_1044543 ) ( ON ?auto_1044542 ?auto_1044544 ) ( CLEAR ?auto_1044542 ) ( not ( = ?auto_1044541 ?auto_1044544 ) ) ( not ( = ?auto_1044542 ?auto_1044544 ) ) ( not ( = ?auto_1044540 ?auto_1044544 ) ) ( ON ?auto_1044538 ?auto_1044537 ) ( ON ?auto_1044539 ?auto_1044538 ) ( ON ?auto_1044540 ?auto_1044539 ) ( not ( = ?auto_1044537 ?auto_1044538 ) ) ( not ( = ?auto_1044537 ?auto_1044539 ) ) ( not ( = ?auto_1044537 ?auto_1044540 ) ) ( not ( = ?auto_1044537 ?auto_1044541 ) ) ( not ( = ?auto_1044537 ?auto_1044542 ) ) ( not ( = ?auto_1044537 ?auto_1044544 ) ) ( not ( = ?auto_1044538 ?auto_1044539 ) ) ( not ( = ?auto_1044538 ?auto_1044540 ) ) ( not ( = ?auto_1044538 ?auto_1044541 ) ) ( not ( = ?auto_1044538 ?auto_1044542 ) ) ( not ( = ?auto_1044538 ?auto_1044544 ) ) ( not ( = ?auto_1044539 ?auto_1044540 ) ) ( not ( = ?auto_1044539 ?auto_1044541 ) ) ( not ( = ?auto_1044539 ?auto_1044542 ) ) ( not ( = ?auto_1044539 ?auto_1044544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044540 ?auto_1044541 ?auto_1044542 )
      ( MAKE-5CRATE-VERIFY ?auto_1044537 ?auto_1044538 ?auto_1044539 ?auto_1044540 ?auto_1044541 ?auto_1044542 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044588 - SURFACE
      ?auto_1044589 - SURFACE
      ?auto_1044590 - SURFACE
      ?auto_1044591 - SURFACE
      ?auto_1044592 - SURFACE
      ?auto_1044593 - SURFACE
    )
    :vars
    (
      ?auto_1044597 - HOIST
      ?auto_1044598 - PLACE
      ?auto_1044596 - PLACE
      ?auto_1044599 - HOIST
      ?auto_1044595 - SURFACE
      ?auto_1044594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044597 ?auto_1044598 ) ( SURFACE-AT ?auto_1044592 ?auto_1044598 ) ( CLEAR ?auto_1044592 ) ( IS-CRATE ?auto_1044593 ) ( not ( = ?auto_1044592 ?auto_1044593 ) ) ( AVAILABLE ?auto_1044597 ) ( ON ?auto_1044592 ?auto_1044591 ) ( not ( = ?auto_1044591 ?auto_1044592 ) ) ( not ( = ?auto_1044591 ?auto_1044593 ) ) ( not ( = ?auto_1044596 ?auto_1044598 ) ) ( HOIST-AT ?auto_1044599 ?auto_1044596 ) ( not ( = ?auto_1044597 ?auto_1044599 ) ) ( AVAILABLE ?auto_1044599 ) ( SURFACE-AT ?auto_1044593 ?auto_1044596 ) ( ON ?auto_1044593 ?auto_1044595 ) ( CLEAR ?auto_1044593 ) ( not ( = ?auto_1044592 ?auto_1044595 ) ) ( not ( = ?auto_1044593 ?auto_1044595 ) ) ( not ( = ?auto_1044591 ?auto_1044595 ) ) ( TRUCK-AT ?auto_1044594 ?auto_1044598 ) ( ON ?auto_1044589 ?auto_1044588 ) ( ON ?auto_1044590 ?auto_1044589 ) ( ON ?auto_1044591 ?auto_1044590 ) ( not ( = ?auto_1044588 ?auto_1044589 ) ) ( not ( = ?auto_1044588 ?auto_1044590 ) ) ( not ( = ?auto_1044588 ?auto_1044591 ) ) ( not ( = ?auto_1044588 ?auto_1044592 ) ) ( not ( = ?auto_1044588 ?auto_1044593 ) ) ( not ( = ?auto_1044588 ?auto_1044595 ) ) ( not ( = ?auto_1044589 ?auto_1044590 ) ) ( not ( = ?auto_1044589 ?auto_1044591 ) ) ( not ( = ?auto_1044589 ?auto_1044592 ) ) ( not ( = ?auto_1044589 ?auto_1044593 ) ) ( not ( = ?auto_1044589 ?auto_1044595 ) ) ( not ( = ?auto_1044590 ?auto_1044591 ) ) ( not ( = ?auto_1044590 ?auto_1044592 ) ) ( not ( = ?auto_1044590 ?auto_1044593 ) ) ( not ( = ?auto_1044590 ?auto_1044595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044591 ?auto_1044592 ?auto_1044593 )
      ( MAKE-5CRATE-VERIFY ?auto_1044588 ?auto_1044589 ?auto_1044590 ?auto_1044591 ?auto_1044592 ?auto_1044593 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044639 - SURFACE
      ?auto_1044640 - SURFACE
      ?auto_1044641 - SURFACE
      ?auto_1044642 - SURFACE
      ?auto_1044643 - SURFACE
      ?auto_1044644 - SURFACE
    )
    :vars
    (
      ?auto_1044649 - HOIST
      ?auto_1044646 - PLACE
      ?auto_1044650 - PLACE
      ?auto_1044645 - HOIST
      ?auto_1044648 - SURFACE
      ?auto_1044647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044649 ?auto_1044646 ) ( IS-CRATE ?auto_1044644 ) ( not ( = ?auto_1044643 ?auto_1044644 ) ) ( not ( = ?auto_1044642 ?auto_1044643 ) ) ( not ( = ?auto_1044642 ?auto_1044644 ) ) ( not ( = ?auto_1044650 ?auto_1044646 ) ) ( HOIST-AT ?auto_1044645 ?auto_1044650 ) ( not ( = ?auto_1044649 ?auto_1044645 ) ) ( AVAILABLE ?auto_1044645 ) ( SURFACE-AT ?auto_1044644 ?auto_1044650 ) ( ON ?auto_1044644 ?auto_1044648 ) ( CLEAR ?auto_1044644 ) ( not ( = ?auto_1044643 ?auto_1044648 ) ) ( not ( = ?auto_1044644 ?auto_1044648 ) ) ( not ( = ?auto_1044642 ?auto_1044648 ) ) ( TRUCK-AT ?auto_1044647 ?auto_1044646 ) ( SURFACE-AT ?auto_1044642 ?auto_1044646 ) ( CLEAR ?auto_1044642 ) ( LIFTING ?auto_1044649 ?auto_1044643 ) ( IS-CRATE ?auto_1044643 ) ( ON ?auto_1044640 ?auto_1044639 ) ( ON ?auto_1044641 ?auto_1044640 ) ( ON ?auto_1044642 ?auto_1044641 ) ( not ( = ?auto_1044639 ?auto_1044640 ) ) ( not ( = ?auto_1044639 ?auto_1044641 ) ) ( not ( = ?auto_1044639 ?auto_1044642 ) ) ( not ( = ?auto_1044639 ?auto_1044643 ) ) ( not ( = ?auto_1044639 ?auto_1044644 ) ) ( not ( = ?auto_1044639 ?auto_1044648 ) ) ( not ( = ?auto_1044640 ?auto_1044641 ) ) ( not ( = ?auto_1044640 ?auto_1044642 ) ) ( not ( = ?auto_1044640 ?auto_1044643 ) ) ( not ( = ?auto_1044640 ?auto_1044644 ) ) ( not ( = ?auto_1044640 ?auto_1044648 ) ) ( not ( = ?auto_1044641 ?auto_1044642 ) ) ( not ( = ?auto_1044641 ?auto_1044643 ) ) ( not ( = ?auto_1044641 ?auto_1044644 ) ) ( not ( = ?auto_1044641 ?auto_1044648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044642 ?auto_1044643 ?auto_1044644 )
      ( MAKE-5CRATE-VERIFY ?auto_1044639 ?auto_1044640 ?auto_1044641 ?auto_1044642 ?auto_1044643 ?auto_1044644 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1044690 - SURFACE
      ?auto_1044691 - SURFACE
      ?auto_1044692 - SURFACE
      ?auto_1044693 - SURFACE
      ?auto_1044694 - SURFACE
      ?auto_1044695 - SURFACE
    )
    :vars
    (
      ?auto_1044697 - HOIST
      ?auto_1044698 - PLACE
      ?auto_1044696 - PLACE
      ?auto_1044699 - HOIST
      ?auto_1044700 - SURFACE
      ?auto_1044701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1044697 ?auto_1044698 ) ( IS-CRATE ?auto_1044695 ) ( not ( = ?auto_1044694 ?auto_1044695 ) ) ( not ( = ?auto_1044693 ?auto_1044694 ) ) ( not ( = ?auto_1044693 ?auto_1044695 ) ) ( not ( = ?auto_1044696 ?auto_1044698 ) ) ( HOIST-AT ?auto_1044699 ?auto_1044696 ) ( not ( = ?auto_1044697 ?auto_1044699 ) ) ( AVAILABLE ?auto_1044699 ) ( SURFACE-AT ?auto_1044695 ?auto_1044696 ) ( ON ?auto_1044695 ?auto_1044700 ) ( CLEAR ?auto_1044695 ) ( not ( = ?auto_1044694 ?auto_1044700 ) ) ( not ( = ?auto_1044695 ?auto_1044700 ) ) ( not ( = ?auto_1044693 ?auto_1044700 ) ) ( TRUCK-AT ?auto_1044701 ?auto_1044698 ) ( SURFACE-AT ?auto_1044693 ?auto_1044698 ) ( CLEAR ?auto_1044693 ) ( IS-CRATE ?auto_1044694 ) ( AVAILABLE ?auto_1044697 ) ( IN ?auto_1044694 ?auto_1044701 ) ( ON ?auto_1044691 ?auto_1044690 ) ( ON ?auto_1044692 ?auto_1044691 ) ( ON ?auto_1044693 ?auto_1044692 ) ( not ( = ?auto_1044690 ?auto_1044691 ) ) ( not ( = ?auto_1044690 ?auto_1044692 ) ) ( not ( = ?auto_1044690 ?auto_1044693 ) ) ( not ( = ?auto_1044690 ?auto_1044694 ) ) ( not ( = ?auto_1044690 ?auto_1044695 ) ) ( not ( = ?auto_1044690 ?auto_1044700 ) ) ( not ( = ?auto_1044691 ?auto_1044692 ) ) ( not ( = ?auto_1044691 ?auto_1044693 ) ) ( not ( = ?auto_1044691 ?auto_1044694 ) ) ( not ( = ?auto_1044691 ?auto_1044695 ) ) ( not ( = ?auto_1044691 ?auto_1044700 ) ) ( not ( = ?auto_1044692 ?auto_1044693 ) ) ( not ( = ?auto_1044692 ?auto_1044694 ) ) ( not ( = ?auto_1044692 ?auto_1044695 ) ) ( not ( = ?auto_1044692 ?auto_1044700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1044693 ?auto_1044694 ?auto_1044695 )
      ( MAKE-5CRATE-VERIFY ?auto_1044690 ?auto_1044691 ?auto_1044692 ?auto_1044693 ?auto_1044694 ?auto_1044695 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1045899 - SURFACE
      ?auto_1045900 - SURFACE
      ?auto_1045901 - SURFACE
      ?auto_1045902 - SURFACE
      ?auto_1045903 - SURFACE
      ?auto_1045904 - SURFACE
      ?auto_1045905 - SURFACE
    )
    :vars
    (
      ?auto_1045906 - HOIST
      ?auto_1045907 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045906 ?auto_1045907 ) ( SURFACE-AT ?auto_1045904 ?auto_1045907 ) ( CLEAR ?auto_1045904 ) ( LIFTING ?auto_1045906 ?auto_1045905 ) ( IS-CRATE ?auto_1045905 ) ( not ( = ?auto_1045904 ?auto_1045905 ) ) ( ON ?auto_1045900 ?auto_1045899 ) ( ON ?auto_1045901 ?auto_1045900 ) ( ON ?auto_1045902 ?auto_1045901 ) ( ON ?auto_1045903 ?auto_1045902 ) ( ON ?auto_1045904 ?auto_1045903 ) ( not ( = ?auto_1045899 ?auto_1045900 ) ) ( not ( = ?auto_1045899 ?auto_1045901 ) ) ( not ( = ?auto_1045899 ?auto_1045902 ) ) ( not ( = ?auto_1045899 ?auto_1045903 ) ) ( not ( = ?auto_1045899 ?auto_1045904 ) ) ( not ( = ?auto_1045899 ?auto_1045905 ) ) ( not ( = ?auto_1045900 ?auto_1045901 ) ) ( not ( = ?auto_1045900 ?auto_1045902 ) ) ( not ( = ?auto_1045900 ?auto_1045903 ) ) ( not ( = ?auto_1045900 ?auto_1045904 ) ) ( not ( = ?auto_1045900 ?auto_1045905 ) ) ( not ( = ?auto_1045901 ?auto_1045902 ) ) ( not ( = ?auto_1045901 ?auto_1045903 ) ) ( not ( = ?auto_1045901 ?auto_1045904 ) ) ( not ( = ?auto_1045901 ?auto_1045905 ) ) ( not ( = ?auto_1045902 ?auto_1045903 ) ) ( not ( = ?auto_1045902 ?auto_1045904 ) ) ( not ( = ?auto_1045902 ?auto_1045905 ) ) ( not ( = ?auto_1045903 ?auto_1045904 ) ) ( not ( = ?auto_1045903 ?auto_1045905 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1045904 ?auto_1045905 )
      ( MAKE-6CRATE-VERIFY ?auto_1045899 ?auto_1045900 ?auto_1045901 ?auto_1045902 ?auto_1045903 ?auto_1045904 ?auto_1045905 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1045943 - SURFACE
      ?auto_1045944 - SURFACE
      ?auto_1045945 - SURFACE
      ?auto_1045946 - SURFACE
      ?auto_1045947 - SURFACE
      ?auto_1045948 - SURFACE
      ?auto_1045949 - SURFACE
    )
    :vars
    (
      ?auto_1045950 - HOIST
      ?auto_1045951 - PLACE
      ?auto_1045952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045950 ?auto_1045951 ) ( SURFACE-AT ?auto_1045948 ?auto_1045951 ) ( CLEAR ?auto_1045948 ) ( IS-CRATE ?auto_1045949 ) ( not ( = ?auto_1045948 ?auto_1045949 ) ) ( TRUCK-AT ?auto_1045952 ?auto_1045951 ) ( AVAILABLE ?auto_1045950 ) ( IN ?auto_1045949 ?auto_1045952 ) ( ON ?auto_1045948 ?auto_1045947 ) ( not ( = ?auto_1045947 ?auto_1045948 ) ) ( not ( = ?auto_1045947 ?auto_1045949 ) ) ( ON ?auto_1045944 ?auto_1045943 ) ( ON ?auto_1045945 ?auto_1045944 ) ( ON ?auto_1045946 ?auto_1045945 ) ( ON ?auto_1045947 ?auto_1045946 ) ( not ( = ?auto_1045943 ?auto_1045944 ) ) ( not ( = ?auto_1045943 ?auto_1045945 ) ) ( not ( = ?auto_1045943 ?auto_1045946 ) ) ( not ( = ?auto_1045943 ?auto_1045947 ) ) ( not ( = ?auto_1045943 ?auto_1045948 ) ) ( not ( = ?auto_1045943 ?auto_1045949 ) ) ( not ( = ?auto_1045944 ?auto_1045945 ) ) ( not ( = ?auto_1045944 ?auto_1045946 ) ) ( not ( = ?auto_1045944 ?auto_1045947 ) ) ( not ( = ?auto_1045944 ?auto_1045948 ) ) ( not ( = ?auto_1045944 ?auto_1045949 ) ) ( not ( = ?auto_1045945 ?auto_1045946 ) ) ( not ( = ?auto_1045945 ?auto_1045947 ) ) ( not ( = ?auto_1045945 ?auto_1045948 ) ) ( not ( = ?auto_1045945 ?auto_1045949 ) ) ( not ( = ?auto_1045946 ?auto_1045947 ) ) ( not ( = ?auto_1045946 ?auto_1045948 ) ) ( not ( = ?auto_1045946 ?auto_1045949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045947 ?auto_1045948 ?auto_1045949 )
      ( MAKE-6CRATE-VERIFY ?auto_1045943 ?auto_1045944 ?auto_1045945 ?auto_1045946 ?auto_1045947 ?auto_1045948 ?auto_1045949 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1045994 - SURFACE
      ?auto_1045995 - SURFACE
      ?auto_1045996 - SURFACE
      ?auto_1045997 - SURFACE
      ?auto_1045998 - SURFACE
      ?auto_1045999 - SURFACE
      ?auto_1046000 - SURFACE
    )
    :vars
    (
      ?auto_1046003 - HOIST
      ?auto_1046002 - PLACE
      ?auto_1046004 - TRUCK
      ?auto_1046001 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046003 ?auto_1046002 ) ( SURFACE-AT ?auto_1045999 ?auto_1046002 ) ( CLEAR ?auto_1045999 ) ( IS-CRATE ?auto_1046000 ) ( not ( = ?auto_1045999 ?auto_1046000 ) ) ( AVAILABLE ?auto_1046003 ) ( IN ?auto_1046000 ?auto_1046004 ) ( ON ?auto_1045999 ?auto_1045998 ) ( not ( = ?auto_1045998 ?auto_1045999 ) ) ( not ( = ?auto_1045998 ?auto_1046000 ) ) ( TRUCK-AT ?auto_1046004 ?auto_1046001 ) ( not ( = ?auto_1046001 ?auto_1046002 ) ) ( ON ?auto_1045995 ?auto_1045994 ) ( ON ?auto_1045996 ?auto_1045995 ) ( ON ?auto_1045997 ?auto_1045996 ) ( ON ?auto_1045998 ?auto_1045997 ) ( not ( = ?auto_1045994 ?auto_1045995 ) ) ( not ( = ?auto_1045994 ?auto_1045996 ) ) ( not ( = ?auto_1045994 ?auto_1045997 ) ) ( not ( = ?auto_1045994 ?auto_1045998 ) ) ( not ( = ?auto_1045994 ?auto_1045999 ) ) ( not ( = ?auto_1045994 ?auto_1046000 ) ) ( not ( = ?auto_1045995 ?auto_1045996 ) ) ( not ( = ?auto_1045995 ?auto_1045997 ) ) ( not ( = ?auto_1045995 ?auto_1045998 ) ) ( not ( = ?auto_1045995 ?auto_1045999 ) ) ( not ( = ?auto_1045995 ?auto_1046000 ) ) ( not ( = ?auto_1045996 ?auto_1045997 ) ) ( not ( = ?auto_1045996 ?auto_1045998 ) ) ( not ( = ?auto_1045996 ?auto_1045999 ) ) ( not ( = ?auto_1045996 ?auto_1046000 ) ) ( not ( = ?auto_1045997 ?auto_1045998 ) ) ( not ( = ?auto_1045997 ?auto_1045999 ) ) ( not ( = ?auto_1045997 ?auto_1046000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1045998 ?auto_1045999 ?auto_1046000 )
      ( MAKE-6CRATE-VERIFY ?auto_1045994 ?auto_1045995 ?auto_1045996 ?auto_1045997 ?auto_1045998 ?auto_1045999 ?auto_1046000 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046051 - SURFACE
      ?auto_1046052 - SURFACE
      ?auto_1046053 - SURFACE
      ?auto_1046054 - SURFACE
      ?auto_1046055 - SURFACE
      ?auto_1046056 - SURFACE
      ?auto_1046057 - SURFACE
    )
    :vars
    (
      ?auto_1046061 - HOIST
      ?auto_1046060 - PLACE
      ?auto_1046059 - TRUCK
      ?auto_1046062 - PLACE
      ?auto_1046058 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046061 ?auto_1046060 ) ( SURFACE-AT ?auto_1046056 ?auto_1046060 ) ( CLEAR ?auto_1046056 ) ( IS-CRATE ?auto_1046057 ) ( not ( = ?auto_1046056 ?auto_1046057 ) ) ( AVAILABLE ?auto_1046061 ) ( ON ?auto_1046056 ?auto_1046055 ) ( not ( = ?auto_1046055 ?auto_1046056 ) ) ( not ( = ?auto_1046055 ?auto_1046057 ) ) ( TRUCK-AT ?auto_1046059 ?auto_1046062 ) ( not ( = ?auto_1046062 ?auto_1046060 ) ) ( HOIST-AT ?auto_1046058 ?auto_1046062 ) ( LIFTING ?auto_1046058 ?auto_1046057 ) ( not ( = ?auto_1046061 ?auto_1046058 ) ) ( ON ?auto_1046052 ?auto_1046051 ) ( ON ?auto_1046053 ?auto_1046052 ) ( ON ?auto_1046054 ?auto_1046053 ) ( ON ?auto_1046055 ?auto_1046054 ) ( not ( = ?auto_1046051 ?auto_1046052 ) ) ( not ( = ?auto_1046051 ?auto_1046053 ) ) ( not ( = ?auto_1046051 ?auto_1046054 ) ) ( not ( = ?auto_1046051 ?auto_1046055 ) ) ( not ( = ?auto_1046051 ?auto_1046056 ) ) ( not ( = ?auto_1046051 ?auto_1046057 ) ) ( not ( = ?auto_1046052 ?auto_1046053 ) ) ( not ( = ?auto_1046052 ?auto_1046054 ) ) ( not ( = ?auto_1046052 ?auto_1046055 ) ) ( not ( = ?auto_1046052 ?auto_1046056 ) ) ( not ( = ?auto_1046052 ?auto_1046057 ) ) ( not ( = ?auto_1046053 ?auto_1046054 ) ) ( not ( = ?auto_1046053 ?auto_1046055 ) ) ( not ( = ?auto_1046053 ?auto_1046056 ) ) ( not ( = ?auto_1046053 ?auto_1046057 ) ) ( not ( = ?auto_1046054 ?auto_1046055 ) ) ( not ( = ?auto_1046054 ?auto_1046056 ) ) ( not ( = ?auto_1046054 ?auto_1046057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046055 ?auto_1046056 ?auto_1046057 )
      ( MAKE-6CRATE-VERIFY ?auto_1046051 ?auto_1046052 ?auto_1046053 ?auto_1046054 ?auto_1046055 ?auto_1046056 ?auto_1046057 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046114 - SURFACE
      ?auto_1046115 - SURFACE
      ?auto_1046116 - SURFACE
      ?auto_1046117 - SURFACE
      ?auto_1046118 - SURFACE
      ?auto_1046119 - SURFACE
      ?auto_1046120 - SURFACE
    )
    :vars
    (
      ?auto_1046124 - HOIST
      ?auto_1046123 - PLACE
      ?auto_1046126 - TRUCK
      ?auto_1046122 - PLACE
      ?auto_1046125 - HOIST
      ?auto_1046121 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046124 ?auto_1046123 ) ( SURFACE-AT ?auto_1046119 ?auto_1046123 ) ( CLEAR ?auto_1046119 ) ( IS-CRATE ?auto_1046120 ) ( not ( = ?auto_1046119 ?auto_1046120 ) ) ( AVAILABLE ?auto_1046124 ) ( ON ?auto_1046119 ?auto_1046118 ) ( not ( = ?auto_1046118 ?auto_1046119 ) ) ( not ( = ?auto_1046118 ?auto_1046120 ) ) ( TRUCK-AT ?auto_1046126 ?auto_1046122 ) ( not ( = ?auto_1046122 ?auto_1046123 ) ) ( HOIST-AT ?auto_1046125 ?auto_1046122 ) ( not ( = ?auto_1046124 ?auto_1046125 ) ) ( AVAILABLE ?auto_1046125 ) ( SURFACE-AT ?auto_1046120 ?auto_1046122 ) ( ON ?auto_1046120 ?auto_1046121 ) ( CLEAR ?auto_1046120 ) ( not ( = ?auto_1046119 ?auto_1046121 ) ) ( not ( = ?auto_1046120 ?auto_1046121 ) ) ( not ( = ?auto_1046118 ?auto_1046121 ) ) ( ON ?auto_1046115 ?auto_1046114 ) ( ON ?auto_1046116 ?auto_1046115 ) ( ON ?auto_1046117 ?auto_1046116 ) ( ON ?auto_1046118 ?auto_1046117 ) ( not ( = ?auto_1046114 ?auto_1046115 ) ) ( not ( = ?auto_1046114 ?auto_1046116 ) ) ( not ( = ?auto_1046114 ?auto_1046117 ) ) ( not ( = ?auto_1046114 ?auto_1046118 ) ) ( not ( = ?auto_1046114 ?auto_1046119 ) ) ( not ( = ?auto_1046114 ?auto_1046120 ) ) ( not ( = ?auto_1046114 ?auto_1046121 ) ) ( not ( = ?auto_1046115 ?auto_1046116 ) ) ( not ( = ?auto_1046115 ?auto_1046117 ) ) ( not ( = ?auto_1046115 ?auto_1046118 ) ) ( not ( = ?auto_1046115 ?auto_1046119 ) ) ( not ( = ?auto_1046115 ?auto_1046120 ) ) ( not ( = ?auto_1046115 ?auto_1046121 ) ) ( not ( = ?auto_1046116 ?auto_1046117 ) ) ( not ( = ?auto_1046116 ?auto_1046118 ) ) ( not ( = ?auto_1046116 ?auto_1046119 ) ) ( not ( = ?auto_1046116 ?auto_1046120 ) ) ( not ( = ?auto_1046116 ?auto_1046121 ) ) ( not ( = ?auto_1046117 ?auto_1046118 ) ) ( not ( = ?auto_1046117 ?auto_1046119 ) ) ( not ( = ?auto_1046117 ?auto_1046120 ) ) ( not ( = ?auto_1046117 ?auto_1046121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046118 ?auto_1046119 ?auto_1046120 )
      ( MAKE-6CRATE-VERIFY ?auto_1046114 ?auto_1046115 ?auto_1046116 ?auto_1046117 ?auto_1046118 ?auto_1046119 ?auto_1046120 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046178 - SURFACE
      ?auto_1046179 - SURFACE
      ?auto_1046180 - SURFACE
      ?auto_1046181 - SURFACE
      ?auto_1046182 - SURFACE
      ?auto_1046183 - SURFACE
      ?auto_1046184 - SURFACE
    )
    :vars
    (
      ?auto_1046190 - HOIST
      ?auto_1046189 - PLACE
      ?auto_1046186 - PLACE
      ?auto_1046185 - HOIST
      ?auto_1046187 - SURFACE
      ?auto_1046188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046190 ?auto_1046189 ) ( SURFACE-AT ?auto_1046183 ?auto_1046189 ) ( CLEAR ?auto_1046183 ) ( IS-CRATE ?auto_1046184 ) ( not ( = ?auto_1046183 ?auto_1046184 ) ) ( AVAILABLE ?auto_1046190 ) ( ON ?auto_1046183 ?auto_1046182 ) ( not ( = ?auto_1046182 ?auto_1046183 ) ) ( not ( = ?auto_1046182 ?auto_1046184 ) ) ( not ( = ?auto_1046186 ?auto_1046189 ) ) ( HOIST-AT ?auto_1046185 ?auto_1046186 ) ( not ( = ?auto_1046190 ?auto_1046185 ) ) ( AVAILABLE ?auto_1046185 ) ( SURFACE-AT ?auto_1046184 ?auto_1046186 ) ( ON ?auto_1046184 ?auto_1046187 ) ( CLEAR ?auto_1046184 ) ( not ( = ?auto_1046183 ?auto_1046187 ) ) ( not ( = ?auto_1046184 ?auto_1046187 ) ) ( not ( = ?auto_1046182 ?auto_1046187 ) ) ( TRUCK-AT ?auto_1046188 ?auto_1046189 ) ( ON ?auto_1046179 ?auto_1046178 ) ( ON ?auto_1046180 ?auto_1046179 ) ( ON ?auto_1046181 ?auto_1046180 ) ( ON ?auto_1046182 ?auto_1046181 ) ( not ( = ?auto_1046178 ?auto_1046179 ) ) ( not ( = ?auto_1046178 ?auto_1046180 ) ) ( not ( = ?auto_1046178 ?auto_1046181 ) ) ( not ( = ?auto_1046178 ?auto_1046182 ) ) ( not ( = ?auto_1046178 ?auto_1046183 ) ) ( not ( = ?auto_1046178 ?auto_1046184 ) ) ( not ( = ?auto_1046178 ?auto_1046187 ) ) ( not ( = ?auto_1046179 ?auto_1046180 ) ) ( not ( = ?auto_1046179 ?auto_1046181 ) ) ( not ( = ?auto_1046179 ?auto_1046182 ) ) ( not ( = ?auto_1046179 ?auto_1046183 ) ) ( not ( = ?auto_1046179 ?auto_1046184 ) ) ( not ( = ?auto_1046179 ?auto_1046187 ) ) ( not ( = ?auto_1046180 ?auto_1046181 ) ) ( not ( = ?auto_1046180 ?auto_1046182 ) ) ( not ( = ?auto_1046180 ?auto_1046183 ) ) ( not ( = ?auto_1046180 ?auto_1046184 ) ) ( not ( = ?auto_1046180 ?auto_1046187 ) ) ( not ( = ?auto_1046181 ?auto_1046182 ) ) ( not ( = ?auto_1046181 ?auto_1046183 ) ) ( not ( = ?auto_1046181 ?auto_1046184 ) ) ( not ( = ?auto_1046181 ?auto_1046187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046182 ?auto_1046183 ?auto_1046184 )
      ( MAKE-6CRATE-VERIFY ?auto_1046178 ?auto_1046179 ?auto_1046180 ?auto_1046181 ?auto_1046182 ?auto_1046183 ?auto_1046184 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046242 - SURFACE
      ?auto_1046243 - SURFACE
      ?auto_1046244 - SURFACE
      ?auto_1046245 - SURFACE
      ?auto_1046246 - SURFACE
      ?auto_1046247 - SURFACE
      ?auto_1046248 - SURFACE
    )
    :vars
    (
      ?auto_1046251 - HOIST
      ?auto_1046249 - PLACE
      ?auto_1046250 - PLACE
      ?auto_1046252 - HOIST
      ?auto_1046254 - SURFACE
      ?auto_1046253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046251 ?auto_1046249 ) ( IS-CRATE ?auto_1046248 ) ( not ( = ?auto_1046247 ?auto_1046248 ) ) ( not ( = ?auto_1046246 ?auto_1046247 ) ) ( not ( = ?auto_1046246 ?auto_1046248 ) ) ( not ( = ?auto_1046250 ?auto_1046249 ) ) ( HOIST-AT ?auto_1046252 ?auto_1046250 ) ( not ( = ?auto_1046251 ?auto_1046252 ) ) ( AVAILABLE ?auto_1046252 ) ( SURFACE-AT ?auto_1046248 ?auto_1046250 ) ( ON ?auto_1046248 ?auto_1046254 ) ( CLEAR ?auto_1046248 ) ( not ( = ?auto_1046247 ?auto_1046254 ) ) ( not ( = ?auto_1046248 ?auto_1046254 ) ) ( not ( = ?auto_1046246 ?auto_1046254 ) ) ( TRUCK-AT ?auto_1046253 ?auto_1046249 ) ( SURFACE-AT ?auto_1046246 ?auto_1046249 ) ( CLEAR ?auto_1046246 ) ( LIFTING ?auto_1046251 ?auto_1046247 ) ( IS-CRATE ?auto_1046247 ) ( ON ?auto_1046243 ?auto_1046242 ) ( ON ?auto_1046244 ?auto_1046243 ) ( ON ?auto_1046245 ?auto_1046244 ) ( ON ?auto_1046246 ?auto_1046245 ) ( not ( = ?auto_1046242 ?auto_1046243 ) ) ( not ( = ?auto_1046242 ?auto_1046244 ) ) ( not ( = ?auto_1046242 ?auto_1046245 ) ) ( not ( = ?auto_1046242 ?auto_1046246 ) ) ( not ( = ?auto_1046242 ?auto_1046247 ) ) ( not ( = ?auto_1046242 ?auto_1046248 ) ) ( not ( = ?auto_1046242 ?auto_1046254 ) ) ( not ( = ?auto_1046243 ?auto_1046244 ) ) ( not ( = ?auto_1046243 ?auto_1046245 ) ) ( not ( = ?auto_1046243 ?auto_1046246 ) ) ( not ( = ?auto_1046243 ?auto_1046247 ) ) ( not ( = ?auto_1046243 ?auto_1046248 ) ) ( not ( = ?auto_1046243 ?auto_1046254 ) ) ( not ( = ?auto_1046244 ?auto_1046245 ) ) ( not ( = ?auto_1046244 ?auto_1046246 ) ) ( not ( = ?auto_1046244 ?auto_1046247 ) ) ( not ( = ?auto_1046244 ?auto_1046248 ) ) ( not ( = ?auto_1046244 ?auto_1046254 ) ) ( not ( = ?auto_1046245 ?auto_1046246 ) ) ( not ( = ?auto_1046245 ?auto_1046247 ) ) ( not ( = ?auto_1046245 ?auto_1046248 ) ) ( not ( = ?auto_1046245 ?auto_1046254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046246 ?auto_1046247 ?auto_1046248 )
      ( MAKE-6CRATE-VERIFY ?auto_1046242 ?auto_1046243 ?auto_1046244 ?auto_1046245 ?auto_1046246 ?auto_1046247 ?auto_1046248 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1046306 - SURFACE
      ?auto_1046307 - SURFACE
      ?auto_1046308 - SURFACE
      ?auto_1046309 - SURFACE
      ?auto_1046310 - SURFACE
      ?auto_1046311 - SURFACE
      ?auto_1046312 - SURFACE
    )
    :vars
    (
      ?auto_1046315 - HOIST
      ?auto_1046318 - PLACE
      ?auto_1046316 - PLACE
      ?auto_1046313 - HOIST
      ?auto_1046314 - SURFACE
      ?auto_1046317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1046315 ?auto_1046318 ) ( IS-CRATE ?auto_1046312 ) ( not ( = ?auto_1046311 ?auto_1046312 ) ) ( not ( = ?auto_1046310 ?auto_1046311 ) ) ( not ( = ?auto_1046310 ?auto_1046312 ) ) ( not ( = ?auto_1046316 ?auto_1046318 ) ) ( HOIST-AT ?auto_1046313 ?auto_1046316 ) ( not ( = ?auto_1046315 ?auto_1046313 ) ) ( AVAILABLE ?auto_1046313 ) ( SURFACE-AT ?auto_1046312 ?auto_1046316 ) ( ON ?auto_1046312 ?auto_1046314 ) ( CLEAR ?auto_1046312 ) ( not ( = ?auto_1046311 ?auto_1046314 ) ) ( not ( = ?auto_1046312 ?auto_1046314 ) ) ( not ( = ?auto_1046310 ?auto_1046314 ) ) ( TRUCK-AT ?auto_1046317 ?auto_1046318 ) ( SURFACE-AT ?auto_1046310 ?auto_1046318 ) ( CLEAR ?auto_1046310 ) ( IS-CRATE ?auto_1046311 ) ( AVAILABLE ?auto_1046315 ) ( IN ?auto_1046311 ?auto_1046317 ) ( ON ?auto_1046307 ?auto_1046306 ) ( ON ?auto_1046308 ?auto_1046307 ) ( ON ?auto_1046309 ?auto_1046308 ) ( ON ?auto_1046310 ?auto_1046309 ) ( not ( = ?auto_1046306 ?auto_1046307 ) ) ( not ( = ?auto_1046306 ?auto_1046308 ) ) ( not ( = ?auto_1046306 ?auto_1046309 ) ) ( not ( = ?auto_1046306 ?auto_1046310 ) ) ( not ( = ?auto_1046306 ?auto_1046311 ) ) ( not ( = ?auto_1046306 ?auto_1046312 ) ) ( not ( = ?auto_1046306 ?auto_1046314 ) ) ( not ( = ?auto_1046307 ?auto_1046308 ) ) ( not ( = ?auto_1046307 ?auto_1046309 ) ) ( not ( = ?auto_1046307 ?auto_1046310 ) ) ( not ( = ?auto_1046307 ?auto_1046311 ) ) ( not ( = ?auto_1046307 ?auto_1046312 ) ) ( not ( = ?auto_1046307 ?auto_1046314 ) ) ( not ( = ?auto_1046308 ?auto_1046309 ) ) ( not ( = ?auto_1046308 ?auto_1046310 ) ) ( not ( = ?auto_1046308 ?auto_1046311 ) ) ( not ( = ?auto_1046308 ?auto_1046312 ) ) ( not ( = ?auto_1046308 ?auto_1046314 ) ) ( not ( = ?auto_1046309 ?auto_1046310 ) ) ( not ( = ?auto_1046309 ?auto_1046311 ) ) ( not ( = ?auto_1046309 ?auto_1046312 ) ) ( not ( = ?auto_1046309 ?auto_1046314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1046310 ?auto_1046311 ?auto_1046312 )
      ( MAKE-6CRATE-VERIFY ?auto_1046306 ?auto_1046307 ?auto_1046308 ?auto_1046309 ?auto_1046310 ?auto_1046311 ?auto_1046312 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048262 - SURFACE
      ?auto_1048263 - SURFACE
      ?auto_1048264 - SURFACE
      ?auto_1048265 - SURFACE
      ?auto_1048266 - SURFACE
      ?auto_1048267 - SURFACE
      ?auto_1048268 - SURFACE
      ?auto_1048269 - SURFACE
    )
    :vars
    (
      ?auto_1048271 - HOIST
      ?auto_1048270 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048271 ?auto_1048270 ) ( SURFACE-AT ?auto_1048268 ?auto_1048270 ) ( CLEAR ?auto_1048268 ) ( LIFTING ?auto_1048271 ?auto_1048269 ) ( IS-CRATE ?auto_1048269 ) ( not ( = ?auto_1048268 ?auto_1048269 ) ) ( ON ?auto_1048263 ?auto_1048262 ) ( ON ?auto_1048264 ?auto_1048263 ) ( ON ?auto_1048265 ?auto_1048264 ) ( ON ?auto_1048266 ?auto_1048265 ) ( ON ?auto_1048267 ?auto_1048266 ) ( ON ?auto_1048268 ?auto_1048267 ) ( not ( = ?auto_1048262 ?auto_1048263 ) ) ( not ( = ?auto_1048262 ?auto_1048264 ) ) ( not ( = ?auto_1048262 ?auto_1048265 ) ) ( not ( = ?auto_1048262 ?auto_1048266 ) ) ( not ( = ?auto_1048262 ?auto_1048267 ) ) ( not ( = ?auto_1048262 ?auto_1048268 ) ) ( not ( = ?auto_1048262 ?auto_1048269 ) ) ( not ( = ?auto_1048263 ?auto_1048264 ) ) ( not ( = ?auto_1048263 ?auto_1048265 ) ) ( not ( = ?auto_1048263 ?auto_1048266 ) ) ( not ( = ?auto_1048263 ?auto_1048267 ) ) ( not ( = ?auto_1048263 ?auto_1048268 ) ) ( not ( = ?auto_1048263 ?auto_1048269 ) ) ( not ( = ?auto_1048264 ?auto_1048265 ) ) ( not ( = ?auto_1048264 ?auto_1048266 ) ) ( not ( = ?auto_1048264 ?auto_1048267 ) ) ( not ( = ?auto_1048264 ?auto_1048268 ) ) ( not ( = ?auto_1048264 ?auto_1048269 ) ) ( not ( = ?auto_1048265 ?auto_1048266 ) ) ( not ( = ?auto_1048265 ?auto_1048267 ) ) ( not ( = ?auto_1048265 ?auto_1048268 ) ) ( not ( = ?auto_1048265 ?auto_1048269 ) ) ( not ( = ?auto_1048266 ?auto_1048267 ) ) ( not ( = ?auto_1048266 ?auto_1048268 ) ) ( not ( = ?auto_1048266 ?auto_1048269 ) ) ( not ( = ?auto_1048267 ?auto_1048268 ) ) ( not ( = ?auto_1048267 ?auto_1048269 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1048268 ?auto_1048269 )
      ( MAKE-7CRATE-VERIFY ?auto_1048262 ?auto_1048263 ?auto_1048264 ?auto_1048265 ?auto_1048266 ?auto_1048267 ?auto_1048268 ?auto_1048269 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048317 - SURFACE
      ?auto_1048318 - SURFACE
      ?auto_1048319 - SURFACE
      ?auto_1048320 - SURFACE
      ?auto_1048321 - SURFACE
      ?auto_1048322 - SURFACE
      ?auto_1048323 - SURFACE
      ?auto_1048324 - SURFACE
    )
    :vars
    (
      ?auto_1048327 - HOIST
      ?auto_1048325 - PLACE
      ?auto_1048326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048327 ?auto_1048325 ) ( SURFACE-AT ?auto_1048323 ?auto_1048325 ) ( CLEAR ?auto_1048323 ) ( IS-CRATE ?auto_1048324 ) ( not ( = ?auto_1048323 ?auto_1048324 ) ) ( TRUCK-AT ?auto_1048326 ?auto_1048325 ) ( AVAILABLE ?auto_1048327 ) ( IN ?auto_1048324 ?auto_1048326 ) ( ON ?auto_1048323 ?auto_1048322 ) ( not ( = ?auto_1048322 ?auto_1048323 ) ) ( not ( = ?auto_1048322 ?auto_1048324 ) ) ( ON ?auto_1048318 ?auto_1048317 ) ( ON ?auto_1048319 ?auto_1048318 ) ( ON ?auto_1048320 ?auto_1048319 ) ( ON ?auto_1048321 ?auto_1048320 ) ( ON ?auto_1048322 ?auto_1048321 ) ( not ( = ?auto_1048317 ?auto_1048318 ) ) ( not ( = ?auto_1048317 ?auto_1048319 ) ) ( not ( = ?auto_1048317 ?auto_1048320 ) ) ( not ( = ?auto_1048317 ?auto_1048321 ) ) ( not ( = ?auto_1048317 ?auto_1048322 ) ) ( not ( = ?auto_1048317 ?auto_1048323 ) ) ( not ( = ?auto_1048317 ?auto_1048324 ) ) ( not ( = ?auto_1048318 ?auto_1048319 ) ) ( not ( = ?auto_1048318 ?auto_1048320 ) ) ( not ( = ?auto_1048318 ?auto_1048321 ) ) ( not ( = ?auto_1048318 ?auto_1048322 ) ) ( not ( = ?auto_1048318 ?auto_1048323 ) ) ( not ( = ?auto_1048318 ?auto_1048324 ) ) ( not ( = ?auto_1048319 ?auto_1048320 ) ) ( not ( = ?auto_1048319 ?auto_1048321 ) ) ( not ( = ?auto_1048319 ?auto_1048322 ) ) ( not ( = ?auto_1048319 ?auto_1048323 ) ) ( not ( = ?auto_1048319 ?auto_1048324 ) ) ( not ( = ?auto_1048320 ?auto_1048321 ) ) ( not ( = ?auto_1048320 ?auto_1048322 ) ) ( not ( = ?auto_1048320 ?auto_1048323 ) ) ( not ( = ?auto_1048320 ?auto_1048324 ) ) ( not ( = ?auto_1048321 ?auto_1048322 ) ) ( not ( = ?auto_1048321 ?auto_1048323 ) ) ( not ( = ?auto_1048321 ?auto_1048324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048322 ?auto_1048323 ?auto_1048324 )
      ( MAKE-7CRATE-VERIFY ?auto_1048317 ?auto_1048318 ?auto_1048319 ?auto_1048320 ?auto_1048321 ?auto_1048322 ?auto_1048323 ?auto_1048324 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048380 - SURFACE
      ?auto_1048381 - SURFACE
      ?auto_1048382 - SURFACE
      ?auto_1048383 - SURFACE
      ?auto_1048384 - SURFACE
      ?auto_1048385 - SURFACE
      ?auto_1048386 - SURFACE
      ?auto_1048387 - SURFACE
    )
    :vars
    (
      ?auto_1048391 - HOIST
      ?auto_1048388 - PLACE
      ?auto_1048390 - TRUCK
      ?auto_1048389 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048391 ?auto_1048388 ) ( SURFACE-AT ?auto_1048386 ?auto_1048388 ) ( CLEAR ?auto_1048386 ) ( IS-CRATE ?auto_1048387 ) ( not ( = ?auto_1048386 ?auto_1048387 ) ) ( AVAILABLE ?auto_1048391 ) ( IN ?auto_1048387 ?auto_1048390 ) ( ON ?auto_1048386 ?auto_1048385 ) ( not ( = ?auto_1048385 ?auto_1048386 ) ) ( not ( = ?auto_1048385 ?auto_1048387 ) ) ( TRUCK-AT ?auto_1048390 ?auto_1048389 ) ( not ( = ?auto_1048389 ?auto_1048388 ) ) ( ON ?auto_1048381 ?auto_1048380 ) ( ON ?auto_1048382 ?auto_1048381 ) ( ON ?auto_1048383 ?auto_1048382 ) ( ON ?auto_1048384 ?auto_1048383 ) ( ON ?auto_1048385 ?auto_1048384 ) ( not ( = ?auto_1048380 ?auto_1048381 ) ) ( not ( = ?auto_1048380 ?auto_1048382 ) ) ( not ( = ?auto_1048380 ?auto_1048383 ) ) ( not ( = ?auto_1048380 ?auto_1048384 ) ) ( not ( = ?auto_1048380 ?auto_1048385 ) ) ( not ( = ?auto_1048380 ?auto_1048386 ) ) ( not ( = ?auto_1048380 ?auto_1048387 ) ) ( not ( = ?auto_1048381 ?auto_1048382 ) ) ( not ( = ?auto_1048381 ?auto_1048383 ) ) ( not ( = ?auto_1048381 ?auto_1048384 ) ) ( not ( = ?auto_1048381 ?auto_1048385 ) ) ( not ( = ?auto_1048381 ?auto_1048386 ) ) ( not ( = ?auto_1048381 ?auto_1048387 ) ) ( not ( = ?auto_1048382 ?auto_1048383 ) ) ( not ( = ?auto_1048382 ?auto_1048384 ) ) ( not ( = ?auto_1048382 ?auto_1048385 ) ) ( not ( = ?auto_1048382 ?auto_1048386 ) ) ( not ( = ?auto_1048382 ?auto_1048387 ) ) ( not ( = ?auto_1048383 ?auto_1048384 ) ) ( not ( = ?auto_1048383 ?auto_1048385 ) ) ( not ( = ?auto_1048383 ?auto_1048386 ) ) ( not ( = ?auto_1048383 ?auto_1048387 ) ) ( not ( = ?auto_1048384 ?auto_1048385 ) ) ( not ( = ?auto_1048384 ?auto_1048386 ) ) ( not ( = ?auto_1048384 ?auto_1048387 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048385 ?auto_1048386 ?auto_1048387 )
      ( MAKE-7CRATE-VERIFY ?auto_1048380 ?auto_1048381 ?auto_1048382 ?auto_1048383 ?auto_1048384 ?auto_1048385 ?auto_1048386 ?auto_1048387 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048450 - SURFACE
      ?auto_1048451 - SURFACE
      ?auto_1048452 - SURFACE
      ?auto_1048453 - SURFACE
      ?auto_1048454 - SURFACE
      ?auto_1048455 - SURFACE
      ?auto_1048456 - SURFACE
      ?auto_1048457 - SURFACE
    )
    :vars
    (
      ?auto_1048459 - HOIST
      ?auto_1048462 - PLACE
      ?auto_1048461 - TRUCK
      ?auto_1048458 - PLACE
      ?auto_1048460 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048459 ?auto_1048462 ) ( SURFACE-AT ?auto_1048456 ?auto_1048462 ) ( CLEAR ?auto_1048456 ) ( IS-CRATE ?auto_1048457 ) ( not ( = ?auto_1048456 ?auto_1048457 ) ) ( AVAILABLE ?auto_1048459 ) ( ON ?auto_1048456 ?auto_1048455 ) ( not ( = ?auto_1048455 ?auto_1048456 ) ) ( not ( = ?auto_1048455 ?auto_1048457 ) ) ( TRUCK-AT ?auto_1048461 ?auto_1048458 ) ( not ( = ?auto_1048458 ?auto_1048462 ) ) ( HOIST-AT ?auto_1048460 ?auto_1048458 ) ( LIFTING ?auto_1048460 ?auto_1048457 ) ( not ( = ?auto_1048459 ?auto_1048460 ) ) ( ON ?auto_1048451 ?auto_1048450 ) ( ON ?auto_1048452 ?auto_1048451 ) ( ON ?auto_1048453 ?auto_1048452 ) ( ON ?auto_1048454 ?auto_1048453 ) ( ON ?auto_1048455 ?auto_1048454 ) ( not ( = ?auto_1048450 ?auto_1048451 ) ) ( not ( = ?auto_1048450 ?auto_1048452 ) ) ( not ( = ?auto_1048450 ?auto_1048453 ) ) ( not ( = ?auto_1048450 ?auto_1048454 ) ) ( not ( = ?auto_1048450 ?auto_1048455 ) ) ( not ( = ?auto_1048450 ?auto_1048456 ) ) ( not ( = ?auto_1048450 ?auto_1048457 ) ) ( not ( = ?auto_1048451 ?auto_1048452 ) ) ( not ( = ?auto_1048451 ?auto_1048453 ) ) ( not ( = ?auto_1048451 ?auto_1048454 ) ) ( not ( = ?auto_1048451 ?auto_1048455 ) ) ( not ( = ?auto_1048451 ?auto_1048456 ) ) ( not ( = ?auto_1048451 ?auto_1048457 ) ) ( not ( = ?auto_1048452 ?auto_1048453 ) ) ( not ( = ?auto_1048452 ?auto_1048454 ) ) ( not ( = ?auto_1048452 ?auto_1048455 ) ) ( not ( = ?auto_1048452 ?auto_1048456 ) ) ( not ( = ?auto_1048452 ?auto_1048457 ) ) ( not ( = ?auto_1048453 ?auto_1048454 ) ) ( not ( = ?auto_1048453 ?auto_1048455 ) ) ( not ( = ?auto_1048453 ?auto_1048456 ) ) ( not ( = ?auto_1048453 ?auto_1048457 ) ) ( not ( = ?auto_1048454 ?auto_1048455 ) ) ( not ( = ?auto_1048454 ?auto_1048456 ) ) ( not ( = ?auto_1048454 ?auto_1048457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048455 ?auto_1048456 ?auto_1048457 )
      ( MAKE-7CRATE-VERIFY ?auto_1048450 ?auto_1048451 ?auto_1048452 ?auto_1048453 ?auto_1048454 ?auto_1048455 ?auto_1048456 ?auto_1048457 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048527 - SURFACE
      ?auto_1048528 - SURFACE
      ?auto_1048529 - SURFACE
      ?auto_1048530 - SURFACE
      ?auto_1048531 - SURFACE
      ?auto_1048532 - SURFACE
      ?auto_1048533 - SURFACE
      ?auto_1048534 - SURFACE
    )
    :vars
    (
      ?auto_1048538 - HOIST
      ?auto_1048539 - PLACE
      ?auto_1048536 - TRUCK
      ?auto_1048537 - PLACE
      ?auto_1048535 - HOIST
      ?auto_1048540 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048538 ?auto_1048539 ) ( SURFACE-AT ?auto_1048533 ?auto_1048539 ) ( CLEAR ?auto_1048533 ) ( IS-CRATE ?auto_1048534 ) ( not ( = ?auto_1048533 ?auto_1048534 ) ) ( AVAILABLE ?auto_1048538 ) ( ON ?auto_1048533 ?auto_1048532 ) ( not ( = ?auto_1048532 ?auto_1048533 ) ) ( not ( = ?auto_1048532 ?auto_1048534 ) ) ( TRUCK-AT ?auto_1048536 ?auto_1048537 ) ( not ( = ?auto_1048537 ?auto_1048539 ) ) ( HOIST-AT ?auto_1048535 ?auto_1048537 ) ( not ( = ?auto_1048538 ?auto_1048535 ) ) ( AVAILABLE ?auto_1048535 ) ( SURFACE-AT ?auto_1048534 ?auto_1048537 ) ( ON ?auto_1048534 ?auto_1048540 ) ( CLEAR ?auto_1048534 ) ( not ( = ?auto_1048533 ?auto_1048540 ) ) ( not ( = ?auto_1048534 ?auto_1048540 ) ) ( not ( = ?auto_1048532 ?auto_1048540 ) ) ( ON ?auto_1048528 ?auto_1048527 ) ( ON ?auto_1048529 ?auto_1048528 ) ( ON ?auto_1048530 ?auto_1048529 ) ( ON ?auto_1048531 ?auto_1048530 ) ( ON ?auto_1048532 ?auto_1048531 ) ( not ( = ?auto_1048527 ?auto_1048528 ) ) ( not ( = ?auto_1048527 ?auto_1048529 ) ) ( not ( = ?auto_1048527 ?auto_1048530 ) ) ( not ( = ?auto_1048527 ?auto_1048531 ) ) ( not ( = ?auto_1048527 ?auto_1048532 ) ) ( not ( = ?auto_1048527 ?auto_1048533 ) ) ( not ( = ?auto_1048527 ?auto_1048534 ) ) ( not ( = ?auto_1048527 ?auto_1048540 ) ) ( not ( = ?auto_1048528 ?auto_1048529 ) ) ( not ( = ?auto_1048528 ?auto_1048530 ) ) ( not ( = ?auto_1048528 ?auto_1048531 ) ) ( not ( = ?auto_1048528 ?auto_1048532 ) ) ( not ( = ?auto_1048528 ?auto_1048533 ) ) ( not ( = ?auto_1048528 ?auto_1048534 ) ) ( not ( = ?auto_1048528 ?auto_1048540 ) ) ( not ( = ?auto_1048529 ?auto_1048530 ) ) ( not ( = ?auto_1048529 ?auto_1048531 ) ) ( not ( = ?auto_1048529 ?auto_1048532 ) ) ( not ( = ?auto_1048529 ?auto_1048533 ) ) ( not ( = ?auto_1048529 ?auto_1048534 ) ) ( not ( = ?auto_1048529 ?auto_1048540 ) ) ( not ( = ?auto_1048530 ?auto_1048531 ) ) ( not ( = ?auto_1048530 ?auto_1048532 ) ) ( not ( = ?auto_1048530 ?auto_1048533 ) ) ( not ( = ?auto_1048530 ?auto_1048534 ) ) ( not ( = ?auto_1048530 ?auto_1048540 ) ) ( not ( = ?auto_1048531 ?auto_1048532 ) ) ( not ( = ?auto_1048531 ?auto_1048533 ) ) ( not ( = ?auto_1048531 ?auto_1048534 ) ) ( not ( = ?auto_1048531 ?auto_1048540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048532 ?auto_1048533 ?auto_1048534 )
      ( MAKE-7CRATE-VERIFY ?auto_1048527 ?auto_1048528 ?auto_1048529 ?auto_1048530 ?auto_1048531 ?auto_1048532 ?auto_1048533 ?auto_1048534 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048605 - SURFACE
      ?auto_1048606 - SURFACE
      ?auto_1048607 - SURFACE
      ?auto_1048608 - SURFACE
      ?auto_1048609 - SURFACE
      ?auto_1048610 - SURFACE
      ?auto_1048611 - SURFACE
      ?auto_1048612 - SURFACE
    )
    :vars
    (
      ?auto_1048615 - HOIST
      ?auto_1048614 - PLACE
      ?auto_1048616 - PLACE
      ?auto_1048618 - HOIST
      ?auto_1048617 - SURFACE
      ?auto_1048613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048615 ?auto_1048614 ) ( SURFACE-AT ?auto_1048611 ?auto_1048614 ) ( CLEAR ?auto_1048611 ) ( IS-CRATE ?auto_1048612 ) ( not ( = ?auto_1048611 ?auto_1048612 ) ) ( AVAILABLE ?auto_1048615 ) ( ON ?auto_1048611 ?auto_1048610 ) ( not ( = ?auto_1048610 ?auto_1048611 ) ) ( not ( = ?auto_1048610 ?auto_1048612 ) ) ( not ( = ?auto_1048616 ?auto_1048614 ) ) ( HOIST-AT ?auto_1048618 ?auto_1048616 ) ( not ( = ?auto_1048615 ?auto_1048618 ) ) ( AVAILABLE ?auto_1048618 ) ( SURFACE-AT ?auto_1048612 ?auto_1048616 ) ( ON ?auto_1048612 ?auto_1048617 ) ( CLEAR ?auto_1048612 ) ( not ( = ?auto_1048611 ?auto_1048617 ) ) ( not ( = ?auto_1048612 ?auto_1048617 ) ) ( not ( = ?auto_1048610 ?auto_1048617 ) ) ( TRUCK-AT ?auto_1048613 ?auto_1048614 ) ( ON ?auto_1048606 ?auto_1048605 ) ( ON ?auto_1048607 ?auto_1048606 ) ( ON ?auto_1048608 ?auto_1048607 ) ( ON ?auto_1048609 ?auto_1048608 ) ( ON ?auto_1048610 ?auto_1048609 ) ( not ( = ?auto_1048605 ?auto_1048606 ) ) ( not ( = ?auto_1048605 ?auto_1048607 ) ) ( not ( = ?auto_1048605 ?auto_1048608 ) ) ( not ( = ?auto_1048605 ?auto_1048609 ) ) ( not ( = ?auto_1048605 ?auto_1048610 ) ) ( not ( = ?auto_1048605 ?auto_1048611 ) ) ( not ( = ?auto_1048605 ?auto_1048612 ) ) ( not ( = ?auto_1048605 ?auto_1048617 ) ) ( not ( = ?auto_1048606 ?auto_1048607 ) ) ( not ( = ?auto_1048606 ?auto_1048608 ) ) ( not ( = ?auto_1048606 ?auto_1048609 ) ) ( not ( = ?auto_1048606 ?auto_1048610 ) ) ( not ( = ?auto_1048606 ?auto_1048611 ) ) ( not ( = ?auto_1048606 ?auto_1048612 ) ) ( not ( = ?auto_1048606 ?auto_1048617 ) ) ( not ( = ?auto_1048607 ?auto_1048608 ) ) ( not ( = ?auto_1048607 ?auto_1048609 ) ) ( not ( = ?auto_1048607 ?auto_1048610 ) ) ( not ( = ?auto_1048607 ?auto_1048611 ) ) ( not ( = ?auto_1048607 ?auto_1048612 ) ) ( not ( = ?auto_1048607 ?auto_1048617 ) ) ( not ( = ?auto_1048608 ?auto_1048609 ) ) ( not ( = ?auto_1048608 ?auto_1048610 ) ) ( not ( = ?auto_1048608 ?auto_1048611 ) ) ( not ( = ?auto_1048608 ?auto_1048612 ) ) ( not ( = ?auto_1048608 ?auto_1048617 ) ) ( not ( = ?auto_1048609 ?auto_1048610 ) ) ( not ( = ?auto_1048609 ?auto_1048611 ) ) ( not ( = ?auto_1048609 ?auto_1048612 ) ) ( not ( = ?auto_1048609 ?auto_1048617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048610 ?auto_1048611 ?auto_1048612 )
      ( MAKE-7CRATE-VERIFY ?auto_1048605 ?auto_1048606 ?auto_1048607 ?auto_1048608 ?auto_1048609 ?auto_1048610 ?auto_1048611 ?auto_1048612 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048683 - SURFACE
      ?auto_1048684 - SURFACE
      ?auto_1048685 - SURFACE
      ?auto_1048686 - SURFACE
      ?auto_1048687 - SURFACE
      ?auto_1048688 - SURFACE
      ?auto_1048689 - SURFACE
      ?auto_1048690 - SURFACE
    )
    :vars
    (
      ?auto_1048696 - HOIST
      ?auto_1048695 - PLACE
      ?auto_1048694 - PLACE
      ?auto_1048691 - HOIST
      ?auto_1048693 - SURFACE
      ?auto_1048692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048696 ?auto_1048695 ) ( IS-CRATE ?auto_1048690 ) ( not ( = ?auto_1048689 ?auto_1048690 ) ) ( not ( = ?auto_1048688 ?auto_1048689 ) ) ( not ( = ?auto_1048688 ?auto_1048690 ) ) ( not ( = ?auto_1048694 ?auto_1048695 ) ) ( HOIST-AT ?auto_1048691 ?auto_1048694 ) ( not ( = ?auto_1048696 ?auto_1048691 ) ) ( AVAILABLE ?auto_1048691 ) ( SURFACE-AT ?auto_1048690 ?auto_1048694 ) ( ON ?auto_1048690 ?auto_1048693 ) ( CLEAR ?auto_1048690 ) ( not ( = ?auto_1048689 ?auto_1048693 ) ) ( not ( = ?auto_1048690 ?auto_1048693 ) ) ( not ( = ?auto_1048688 ?auto_1048693 ) ) ( TRUCK-AT ?auto_1048692 ?auto_1048695 ) ( SURFACE-AT ?auto_1048688 ?auto_1048695 ) ( CLEAR ?auto_1048688 ) ( LIFTING ?auto_1048696 ?auto_1048689 ) ( IS-CRATE ?auto_1048689 ) ( ON ?auto_1048684 ?auto_1048683 ) ( ON ?auto_1048685 ?auto_1048684 ) ( ON ?auto_1048686 ?auto_1048685 ) ( ON ?auto_1048687 ?auto_1048686 ) ( ON ?auto_1048688 ?auto_1048687 ) ( not ( = ?auto_1048683 ?auto_1048684 ) ) ( not ( = ?auto_1048683 ?auto_1048685 ) ) ( not ( = ?auto_1048683 ?auto_1048686 ) ) ( not ( = ?auto_1048683 ?auto_1048687 ) ) ( not ( = ?auto_1048683 ?auto_1048688 ) ) ( not ( = ?auto_1048683 ?auto_1048689 ) ) ( not ( = ?auto_1048683 ?auto_1048690 ) ) ( not ( = ?auto_1048683 ?auto_1048693 ) ) ( not ( = ?auto_1048684 ?auto_1048685 ) ) ( not ( = ?auto_1048684 ?auto_1048686 ) ) ( not ( = ?auto_1048684 ?auto_1048687 ) ) ( not ( = ?auto_1048684 ?auto_1048688 ) ) ( not ( = ?auto_1048684 ?auto_1048689 ) ) ( not ( = ?auto_1048684 ?auto_1048690 ) ) ( not ( = ?auto_1048684 ?auto_1048693 ) ) ( not ( = ?auto_1048685 ?auto_1048686 ) ) ( not ( = ?auto_1048685 ?auto_1048687 ) ) ( not ( = ?auto_1048685 ?auto_1048688 ) ) ( not ( = ?auto_1048685 ?auto_1048689 ) ) ( not ( = ?auto_1048685 ?auto_1048690 ) ) ( not ( = ?auto_1048685 ?auto_1048693 ) ) ( not ( = ?auto_1048686 ?auto_1048687 ) ) ( not ( = ?auto_1048686 ?auto_1048688 ) ) ( not ( = ?auto_1048686 ?auto_1048689 ) ) ( not ( = ?auto_1048686 ?auto_1048690 ) ) ( not ( = ?auto_1048686 ?auto_1048693 ) ) ( not ( = ?auto_1048687 ?auto_1048688 ) ) ( not ( = ?auto_1048687 ?auto_1048689 ) ) ( not ( = ?auto_1048687 ?auto_1048690 ) ) ( not ( = ?auto_1048687 ?auto_1048693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048688 ?auto_1048689 ?auto_1048690 )
      ( MAKE-7CRATE-VERIFY ?auto_1048683 ?auto_1048684 ?auto_1048685 ?auto_1048686 ?auto_1048687 ?auto_1048688 ?auto_1048689 ?auto_1048690 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1048761 - SURFACE
      ?auto_1048762 - SURFACE
      ?auto_1048763 - SURFACE
      ?auto_1048764 - SURFACE
      ?auto_1048765 - SURFACE
      ?auto_1048766 - SURFACE
      ?auto_1048767 - SURFACE
      ?auto_1048768 - SURFACE
    )
    :vars
    (
      ?auto_1048772 - HOIST
      ?auto_1048769 - PLACE
      ?auto_1048770 - PLACE
      ?auto_1048773 - HOIST
      ?auto_1048771 - SURFACE
      ?auto_1048774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048772 ?auto_1048769 ) ( IS-CRATE ?auto_1048768 ) ( not ( = ?auto_1048767 ?auto_1048768 ) ) ( not ( = ?auto_1048766 ?auto_1048767 ) ) ( not ( = ?auto_1048766 ?auto_1048768 ) ) ( not ( = ?auto_1048770 ?auto_1048769 ) ) ( HOIST-AT ?auto_1048773 ?auto_1048770 ) ( not ( = ?auto_1048772 ?auto_1048773 ) ) ( AVAILABLE ?auto_1048773 ) ( SURFACE-AT ?auto_1048768 ?auto_1048770 ) ( ON ?auto_1048768 ?auto_1048771 ) ( CLEAR ?auto_1048768 ) ( not ( = ?auto_1048767 ?auto_1048771 ) ) ( not ( = ?auto_1048768 ?auto_1048771 ) ) ( not ( = ?auto_1048766 ?auto_1048771 ) ) ( TRUCK-AT ?auto_1048774 ?auto_1048769 ) ( SURFACE-AT ?auto_1048766 ?auto_1048769 ) ( CLEAR ?auto_1048766 ) ( IS-CRATE ?auto_1048767 ) ( AVAILABLE ?auto_1048772 ) ( IN ?auto_1048767 ?auto_1048774 ) ( ON ?auto_1048762 ?auto_1048761 ) ( ON ?auto_1048763 ?auto_1048762 ) ( ON ?auto_1048764 ?auto_1048763 ) ( ON ?auto_1048765 ?auto_1048764 ) ( ON ?auto_1048766 ?auto_1048765 ) ( not ( = ?auto_1048761 ?auto_1048762 ) ) ( not ( = ?auto_1048761 ?auto_1048763 ) ) ( not ( = ?auto_1048761 ?auto_1048764 ) ) ( not ( = ?auto_1048761 ?auto_1048765 ) ) ( not ( = ?auto_1048761 ?auto_1048766 ) ) ( not ( = ?auto_1048761 ?auto_1048767 ) ) ( not ( = ?auto_1048761 ?auto_1048768 ) ) ( not ( = ?auto_1048761 ?auto_1048771 ) ) ( not ( = ?auto_1048762 ?auto_1048763 ) ) ( not ( = ?auto_1048762 ?auto_1048764 ) ) ( not ( = ?auto_1048762 ?auto_1048765 ) ) ( not ( = ?auto_1048762 ?auto_1048766 ) ) ( not ( = ?auto_1048762 ?auto_1048767 ) ) ( not ( = ?auto_1048762 ?auto_1048768 ) ) ( not ( = ?auto_1048762 ?auto_1048771 ) ) ( not ( = ?auto_1048763 ?auto_1048764 ) ) ( not ( = ?auto_1048763 ?auto_1048765 ) ) ( not ( = ?auto_1048763 ?auto_1048766 ) ) ( not ( = ?auto_1048763 ?auto_1048767 ) ) ( not ( = ?auto_1048763 ?auto_1048768 ) ) ( not ( = ?auto_1048763 ?auto_1048771 ) ) ( not ( = ?auto_1048764 ?auto_1048765 ) ) ( not ( = ?auto_1048764 ?auto_1048766 ) ) ( not ( = ?auto_1048764 ?auto_1048767 ) ) ( not ( = ?auto_1048764 ?auto_1048768 ) ) ( not ( = ?auto_1048764 ?auto_1048771 ) ) ( not ( = ?auto_1048765 ?auto_1048766 ) ) ( not ( = ?auto_1048765 ?auto_1048767 ) ) ( not ( = ?auto_1048765 ?auto_1048768 ) ) ( not ( = ?auto_1048765 ?auto_1048771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1048766 ?auto_1048767 ?auto_1048768 )
      ( MAKE-7CRATE-VERIFY ?auto_1048761 ?auto_1048762 ?auto_1048763 ?auto_1048764 ?auto_1048765 ?auto_1048766 ?auto_1048767 ?auto_1048768 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051680 - SURFACE
      ?auto_1051681 - SURFACE
      ?auto_1051682 - SURFACE
      ?auto_1051683 - SURFACE
      ?auto_1051684 - SURFACE
      ?auto_1051685 - SURFACE
      ?auto_1051686 - SURFACE
      ?auto_1051687 - SURFACE
      ?auto_1051688 - SURFACE
    )
    :vars
    (
      ?auto_1051689 - HOIST
      ?auto_1051690 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051689 ?auto_1051690 ) ( SURFACE-AT ?auto_1051687 ?auto_1051690 ) ( CLEAR ?auto_1051687 ) ( LIFTING ?auto_1051689 ?auto_1051688 ) ( IS-CRATE ?auto_1051688 ) ( not ( = ?auto_1051687 ?auto_1051688 ) ) ( ON ?auto_1051681 ?auto_1051680 ) ( ON ?auto_1051682 ?auto_1051681 ) ( ON ?auto_1051683 ?auto_1051682 ) ( ON ?auto_1051684 ?auto_1051683 ) ( ON ?auto_1051685 ?auto_1051684 ) ( ON ?auto_1051686 ?auto_1051685 ) ( ON ?auto_1051687 ?auto_1051686 ) ( not ( = ?auto_1051680 ?auto_1051681 ) ) ( not ( = ?auto_1051680 ?auto_1051682 ) ) ( not ( = ?auto_1051680 ?auto_1051683 ) ) ( not ( = ?auto_1051680 ?auto_1051684 ) ) ( not ( = ?auto_1051680 ?auto_1051685 ) ) ( not ( = ?auto_1051680 ?auto_1051686 ) ) ( not ( = ?auto_1051680 ?auto_1051687 ) ) ( not ( = ?auto_1051680 ?auto_1051688 ) ) ( not ( = ?auto_1051681 ?auto_1051682 ) ) ( not ( = ?auto_1051681 ?auto_1051683 ) ) ( not ( = ?auto_1051681 ?auto_1051684 ) ) ( not ( = ?auto_1051681 ?auto_1051685 ) ) ( not ( = ?auto_1051681 ?auto_1051686 ) ) ( not ( = ?auto_1051681 ?auto_1051687 ) ) ( not ( = ?auto_1051681 ?auto_1051688 ) ) ( not ( = ?auto_1051682 ?auto_1051683 ) ) ( not ( = ?auto_1051682 ?auto_1051684 ) ) ( not ( = ?auto_1051682 ?auto_1051685 ) ) ( not ( = ?auto_1051682 ?auto_1051686 ) ) ( not ( = ?auto_1051682 ?auto_1051687 ) ) ( not ( = ?auto_1051682 ?auto_1051688 ) ) ( not ( = ?auto_1051683 ?auto_1051684 ) ) ( not ( = ?auto_1051683 ?auto_1051685 ) ) ( not ( = ?auto_1051683 ?auto_1051686 ) ) ( not ( = ?auto_1051683 ?auto_1051687 ) ) ( not ( = ?auto_1051683 ?auto_1051688 ) ) ( not ( = ?auto_1051684 ?auto_1051685 ) ) ( not ( = ?auto_1051684 ?auto_1051686 ) ) ( not ( = ?auto_1051684 ?auto_1051687 ) ) ( not ( = ?auto_1051684 ?auto_1051688 ) ) ( not ( = ?auto_1051685 ?auto_1051686 ) ) ( not ( = ?auto_1051685 ?auto_1051687 ) ) ( not ( = ?auto_1051685 ?auto_1051688 ) ) ( not ( = ?auto_1051686 ?auto_1051687 ) ) ( not ( = ?auto_1051686 ?auto_1051688 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1051687 ?auto_1051688 )
      ( MAKE-8CRATE-VERIFY ?auto_1051680 ?auto_1051681 ?auto_1051682 ?auto_1051683 ?auto_1051684 ?auto_1051685 ?auto_1051686 ?auto_1051687 ?auto_1051688 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051747 - SURFACE
      ?auto_1051748 - SURFACE
      ?auto_1051749 - SURFACE
      ?auto_1051750 - SURFACE
      ?auto_1051751 - SURFACE
      ?auto_1051752 - SURFACE
      ?auto_1051753 - SURFACE
      ?auto_1051754 - SURFACE
      ?auto_1051755 - SURFACE
    )
    :vars
    (
      ?auto_1051757 - HOIST
      ?auto_1051756 - PLACE
      ?auto_1051758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051757 ?auto_1051756 ) ( SURFACE-AT ?auto_1051754 ?auto_1051756 ) ( CLEAR ?auto_1051754 ) ( IS-CRATE ?auto_1051755 ) ( not ( = ?auto_1051754 ?auto_1051755 ) ) ( TRUCK-AT ?auto_1051758 ?auto_1051756 ) ( AVAILABLE ?auto_1051757 ) ( IN ?auto_1051755 ?auto_1051758 ) ( ON ?auto_1051754 ?auto_1051753 ) ( not ( = ?auto_1051753 ?auto_1051754 ) ) ( not ( = ?auto_1051753 ?auto_1051755 ) ) ( ON ?auto_1051748 ?auto_1051747 ) ( ON ?auto_1051749 ?auto_1051748 ) ( ON ?auto_1051750 ?auto_1051749 ) ( ON ?auto_1051751 ?auto_1051750 ) ( ON ?auto_1051752 ?auto_1051751 ) ( ON ?auto_1051753 ?auto_1051752 ) ( not ( = ?auto_1051747 ?auto_1051748 ) ) ( not ( = ?auto_1051747 ?auto_1051749 ) ) ( not ( = ?auto_1051747 ?auto_1051750 ) ) ( not ( = ?auto_1051747 ?auto_1051751 ) ) ( not ( = ?auto_1051747 ?auto_1051752 ) ) ( not ( = ?auto_1051747 ?auto_1051753 ) ) ( not ( = ?auto_1051747 ?auto_1051754 ) ) ( not ( = ?auto_1051747 ?auto_1051755 ) ) ( not ( = ?auto_1051748 ?auto_1051749 ) ) ( not ( = ?auto_1051748 ?auto_1051750 ) ) ( not ( = ?auto_1051748 ?auto_1051751 ) ) ( not ( = ?auto_1051748 ?auto_1051752 ) ) ( not ( = ?auto_1051748 ?auto_1051753 ) ) ( not ( = ?auto_1051748 ?auto_1051754 ) ) ( not ( = ?auto_1051748 ?auto_1051755 ) ) ( not ( = ?auto_1051749 ?auto_1051750 ) ) ( not ( = ?auto_1051749 ?auto_1051751 ) ) ( not ( = ?auto_1051749 ?auto_1051752 ) ) ( not ( = ?auto_1051749 ?auto_1051753 ) ) ( not ( = ?auto_1051749 ?auto_1051754 ) ) ( not ( = ?auto_1051749 ?auto_1051755 ) ) ( not ( = ?auto_1051750 ?auto_1051751 ) ) ( not ( = ?auto_1051750 ?auto_1051752 ) ) ( not ( = ?auto_1051750 ?auto_1051753 ) ) ( not ( = ?auto_1051750 ?auto_1051754 ) ) ( not ( = ?auto_1051750 ?auto_1051755 ) ) ( not ( = ?auto_1051751 ?auto_1051752 ) ) ( not ( = ?auto_1051751 ?auto_1051753 ) ) ( not ( = ?auto_1051751 ?auto_1051754 ) ) ( not ( = ?auto_1051751 ?auto_1051755 ) ) ( not ( = ?auto_1051752 ?auto_1051753 ) ) ( not ( = ?auto_1051752 ?auto_1051754 ) ) ( not ( = ?auto_1051752 ?auto_1051755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1051753 ?auto_1051754 ?auto_1051755 )
      ( MAKE-8CRATE-VERIFY ?auto_1051747 ?auto_1051748 ?auto_1051749 ?auto_1051750 ?auto_1051751 ?auto_1051752 ?auto_1051753 ?auto_1051754 ?auto_1051755 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051823 - SURFACE
      ?auto_1051824 - SURFACE
      ?auto_1051825 - SURFACE
      ?auto_1051826 - SURFACE
      ?auto_1051827 - SURFACE
      ?auto_1051828 - SURFACE
      ?auto_1051829 - SURFACE
      ?auto_1051830 - SURFACE
      ?auto_1051831 - SURFACE
    )
    :vars
    (
      ?auto_1051832 - HOIST
      ?auto_1051834 - PLACE
      ?auto_1051833 - TRUCK
      ?auto_1051835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051832 ?auto_1051834 ) ( SURFACE-AT ?auto_1051830 ?auto_1051834 ) ( CLEAR ?auto_1051830 ) ( IS-CRATE ?auto_1051831 ) ( not ( = ?auto_1051830 ?auto_1051831 ) ) ( AVAILABLE ?auto_1051832 ) ( IN ?auto_1051831 ?auto_1051833 ) ( ON ?auto_1051830 ?auto_1051829 ) ( not ( = ?auto_1051829 ?auto_1051830 ) ) ( not ( = ?auto_1051829 ?auto_1051831 ) ) ( TRUCK-AT ?auto_1051833 ?auto_1051835 ) ( not ( = ?auto_1051835 ?auto_1051834 ) ) ( ON ?auto_1051824 ?auto_1051823 ) ( ON ?auto_1051825 ?auto_1051824 ) ( ON ?auto_1051826 ?auto_1051825 ) ( ON ?auto_1051827 ?auto_1051826 ) ( ON ?auto_1051828 ?auto_1051827 ) ( ON ?auto_1051829 ?auto_1051828 ) ( not ( = ?auto_1051823 ?auto_1051824 ) ) ( not ( = ?auto_1051823 ?auto_1051825 ) ) ( not ( = ?auto_1051823 ?auto_1051826 ) ) ( not ( = ?auto_1051823 ?auto_1051827 ) ) ( not ( = ?auto_1051823 ?auto_1051828 ) ) ( not ( = ?auto_1051823 ?auto_1051829 ) ) ( not ( = ?auto_1051823 ?auto_1051830 ) ) ( not ( = ?auto_1051823 ?auto_1051831 ) ) ( not ( = ?auto_1051824 ?auto_1051825 ) ) ( not ( = ?auto_1051824 ?auto_1051826 ) ) ( not ( = ?auto_1051824 ?auto_1051827 ) ) ( not ( = ?auto_1051824 ?auto_1051828 ) ) ( not ( = ?auto_1051824 ?auto_1051829 ) ) ( not ( = ?auto_1051824 ?auto_1051830 ) ) ( not ( = ?auto_1051824 ?auto_1051831 ) ) ( not ( = ?auto_1051825 ?auto_1051826 ) ) ( not ( = ?auto_1051825 ?auto_1051827 ) ) ( not ( = ?auto_1051825 ?auto_1051828 ) ) ( not ( = ?auto_1051825 ?auto_1051829 ) ) ( not ( = ?auto_1051825 ?auto_1051830 ) ) ( not ( = ?auto_1051825 ?auto_1051831 ) ) ( not ( = ?auto_1051826 ?auto_1051827 ) ) ( not ( = ?auto_1051826 ?auto_1051828 ) ) ( not ( = ?auto_1051826 ?auto_1051829 ) ) ( not ( = ?auto_1051826 ?auto_1051830 ) ) ( not ( = ?auto_1051826 ?auto_1051831 ) ) ( not ( = ?auto_1051827 ?auto_1051828 ) ) ( not ( = ?auto_1051827 ?auto_1051829 ) ) ( not ( = ?auto_1051827 ?auto_1051830 ) ) ( not ( = ?auto_1051827 ?auto_1051831 ) ) ( not ( = ?auto_1051828 ?auto_1051829 ) ) ( not ( = ?auto_1051828 ?auto_1051830 ) ) ( not ( = ?auto_1051828 ?auto_1051831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1051829 ?auto_1051830 ?auto_1051831 )
      ( MAKE-8CRATE-VERIFY ?auto_1051823 ?auto_1051824 ?auto_1051825 ?auto_1051826 ?auto_1051827 ?auto_1051828 ?auto_1051829 ?auto_1051830 ?auto_1051831 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051907 - SURFACE
      ?auto_1051908 - SURFACE
      ?auto_1051909 - SURFACE
      ?auto_1051910 - SURFACE
      ?auto_1051911 - SURFACE
      ?auto_1051912 - SURFACE
      ?auto_1051913 - SURFACE
      ?auto_1051914 - SURFACE
      ?auto_1051915 - SURFACE
    )
    :vars
    (
      ?auto_1051916 - HOIST
      ?auto_1051918 - PLACE
      ?auto_1051920 - TRUCK
      ?auto_1051917 - PLACE
      ?auto_1051919 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1051916 ?auto_1051918 ) ( SURFACE-AT ?auto_1051914 ?auto_1051918 ) ( CLEAR ?auto_1051914 ) ( IS-CRATE ?auto_1051915 ) ( not ( = ?auto_1051914 ?auto_1051915 ) ) ( AVAILABLE ?auto_1051916 ) ( ON ?auto_1051914 ?auto_1051913 ) ( not ( = ?auto_1051913 ?auto_1051914 ) ) ( not ( = ?auto_1051913 ?auto_1051915 ) ) ( TRUCK-AT ?auto_1051920 ?auto_1051917 ) ( not ( = ?auto_1051917 ?auto_1051918 ) ) ( HOIST-AT ?auto_1051919 ?auto_1051917 ) ( LIFTING ?auto_1051919 ?auto_1051915 ) ( not ( = ?auto_1051916 ?auto_1051919 ) ) ( ON ?auto_1051908 ?auto_1051907 ) ( ON ?auto_1051909 ?auto_1051908 ) ( ON ?auto_1051910 ?auto_1051909 ) ( ON ?auto_1051911 ?auto_1051910 ) ( ON ?auto_1051912 ?auto_1051911 ) ( ON ?auto_1051913 ?auto_1051912 ) ( not ( = ?auto_1051907 ?auto_1051908 ) ) ( not ( = ?auto_1051907 ?auto_1051909 ) ) ( not ( = ?auto_1051907 ?auto_1051910 ) ) ( not ( = ?auto_1051907 ?auto_1051911 ) ) ( not ( = ?auto_1051907 ?auto_1051912 ) ) ( not ( = ?auto_1051907 ?auto_1051913 ) ) ( not ( = ?auto_1051907 ?auto_1051914 ) ) ( not ( = ?auto_1051907 ?auto_1051915 ) ) ( not ( = ?auto_1051908 ?auto_1051909 ) ) ( not ( = ?auto_1051908 ?auto_1051910 ) ) ( not ( = ?auto_1051908 ?auto_1051911 ) ) ( not ( = ?auto_1051908 ?auto_1051912 ) ) ( not ( = ?auto_1051908 ?auto_1051913 ) ) ( not ( = ?auto_1051908 ?auto_1051914 ) ) ( not ( = ?auto_1051908 ?auto_1051915 ) ) ( not ( = ?auto_1051909 ?auto_1051910 ) ) ( not ( = ?auto_1051909 ?auto_1051911 ) ) ( not ( = ?auto_1051909 ?auto_1051912 ) ) ( not ( = ?auto_1051909 ?auto_1051913 ) ) ( not ( = ?auto_1051909 ?auto_1051914 ) ) ( not ( = ?auto_1051909 ?auto_1051915 ) ) ( not ( = ?auto_1051910 ?auto_1051911 ) ) ( not ( = ?auto_1051910 ?auto_1051912 ) ) ( not ( = ?auto_1051910 ?auto_1051913 ) ) ( not ( = ?auto_1051910 ?auto_1051914 ) ) ( not ( = ?auto_1051910 ?auto_1051915 ) ) ( not ( = ?auto_1051911 ?auto_1051912 ) ) ( not ( = ?auto_1051911 ?auto_1051913 ) ) ( not ( = ?auto_1051911 ?auto_1051914 ) ) ( not ( = ?auto_1051911 ?auto_1051915 ) ) ( not ( = ?auto_1051912 ?auto_1051913 ) ) ( not ( = ?auto_1051912 ?auto_1051914 ) ) ( not ( = ?auto_1051912 ?auto_1051915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1051913 ?auto_1051914 ?auto_1051915 )
      ( MAKE-8CRATE-VERIFY ?auto_1051907 ?auto_1051908 ?auto_1051909 ?auto_1051910 ?auto_1051911 ?auto_1051912 ?auto_1051913 ?auto_1051914 ?auto_1051915 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1051999 - SURFACE
      ?auto_1052000 - SURFACE
      ?auto_1052001 - SURFACE
      ?auto_1052002 - SURFACE
      ?auto_1052003 - SURFACE
      ?auto_1052004 - SURFACE
      ?auto_1052005 - SURFACE
      ?auto_1052006 - SURFACE
      ?auto_1052007 - SURFACE
    )
    :vars
    (
      ?auto_1052011 - HOIST
      ?auto_1052008 - PLACE
      ?auto_1052013 - TRUCK
      ?auto_1052012 - PLACE
      ?auto_1052009 - HOIST
      ?auto_1052010 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052011 ?auto_1052008 ) ( SURFACE-AT ?auto_1052006 ?auto_1052008 ) ( CLEAR ?auto_1052006 ) ( IS-CRATE ?auto_1052007 ) ( not ( = ?auto_1052006 ?auto_1052007 ) ) ( AVAILABLE ?auto_1052011 ) ( ON ?auto_1052006 ?auto_1052005 ) ( not ( = ?auto_1052005 ?auto_1052006 ) ) ( not ( = ?auto_1052005 ?auto_1052007 ) ) ( TRUCK-AT ?auto_1052013 ?auto_1052012 ) ( not ( = ?auto_1052012 ?auto_1052008 ) ) ( HOIST-AT ?auto_1052009 ?auto_1052012 ) ( not ( = ?auto_1052011 ?auto_1052009 ) ) ( AVAILABLE ?auto_1052009 ) ( SURFACE-AT ?auto_1052007 ?auto_1052012 ) ( ON ?auto_1052007 ?auto_1052010 ) ( CLEAR ?auto_1052007 ) ( not ( = ?auto_1052006 ?auto_1052010 ) ) ( not ( = ?auto_1052007 ?auto_1052010 ) ) ( not ( = ?auto_1052005 ?auto_1052010 ) ) ( ON ?auto_1052000 ?auto_1051999 ) ( ON ?auto_1052001 ?auto_1052000 ) ( ON ?auto_1052002 ?auto_1052001 ) ( ON ?auto_1052003 ?auto_1052002 ) ( ON ?auto_1052004 ?auto_1052003 ) ( ON ?auto_1052005 ?auto_1052004 ) ( not ( = ?auto_1051999 ?auto_1052000 ) ) ( not ( = ?auto_1051999 ?auto_1052001 ) ) ( not ( = ?auto_1051999 ?auto_1052002 ) ) ( not ( = ?auto_1051999 ?auto_1052003 ) ) ( not ( = ?auto_1051999 ?auto_1052004 ) ) ( not ( = ?auto_1051999 ?auto_1052005 ) ) ( not ( = ?auto_1051999 ?auto_1052006 ) ) ( not ( = ?auto_1051999 ?auto_1052007 ) ) ( not ( = ?auto_1051999 ?auto_1052010 ) ) ( not ( = ?auto_1052000 ?auto_1052001 ) ) ( not ( = ?auto_1052000 ?auto_1052002 ) ) ( not ( = ?auto_1052000 ?auto_1052003 ) ) ( not ( = ?auto_1052000 ?auto_1052004 ) ) ( not ( = ?auto_1052000 ?auto_1052005 ) ) ( not ( = ?auto_1052000 ?auto_1052006 ) ) ( not ( = ?auto_1052000 ?auto_1052007 ) ) ( not ( = ?auto_1052000 ?auto_1052010 ) ) ( not ( = ?auto_1052001 ?auto_1052002 ) ) ( not ( = ?auto_1052001 ?auto_1052003 ) ) ( not ( = ?auto_1052001 ?auto_1052004 ) ) ( not ( = ?auto_1052001 ?auto_1052005 ) ) ( not ( = ?auto_1052001 ?auto_1052006 ) ) ( not ( = ?auto_1052001 ?auto_1052007 ) ) ( not ( = ?auto_1052001 ?auto_1052010 ) ) ( not ( = ?auto_1052002 ?auto_1052003 ) ) ( not ( = ?auto_1052002 ?auto_1052004 ) ) ( not ( = ?auto_1052002 ?auto_1052005 ) ) ( not ( = ?auto_1052002 ?auto_1052006 ) ) ( not ( = ?auto_1052002 ?auto_1052007 ) ) ( not ( = ?auto_1052002 ?auto_1052010 ) ) ( not ( = ?auto_1052003 ?auto_1052004 ) ) ( not ( = ?auto_1052003 ?auto_1052005 ) ) ( not ( = ?auto_1052003 ?auto_1052006 ) ) ( not ( = ?auto_1052003 ?auto_1052007 ) ) ( not ( = ?auto_1052003 ?auto_1052010 ) ) ( not ( = ?auto_1052004 ?auto_1052005 ) ) ( not ( = ?auto_1052004 ?auto_1052006 ) ) ( not ( = ?auto_1052004 ?auto_1052007 ) ) ( not ( = ?auto_1052004 ?auto_1052010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052005 ?auto_1052006 ?auto_1052007 )
      ( MAKE-8CRATE-VERIFY ?auto_1051999 ?auto_1052000 ?auto_1052001 ?auto_1052002 ?auto_1052003 ?auto_1052004 ?auto_1052005 ?auto_1052006 ?auto_1052007 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052092 - SURFACE
      ?auto_1052093 - SURFACE
      ?auto_1052094 - SURFACE
      ?auto_1052095 - SURFACE
      ?auto_1052096 - SURFACE
      ?auto_1052097 - SURFACE
      ?auto_1052098 - SURFACE
      ?auto_1052099 - SURFACE
      ?auto_1052100 - SURFACE
    )
    :vars
    (
      ?auto_1052102 - HOIST
      ?auto_1052104 - PLACE
      ?auto_1052103 - PLACE
      ?auto_1052101 - HOIST
      ?auto_1052105 - SURFACE
      ?auto_1052106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052102 ?auto_1052104 ) ( SURFACE-AT ?auto_1052099 ?auto_1052104 ) ( CLEAR ?auto_1052099 ) ( IS-CRATE ?auto_1052100 ) ( not ( = ?auto_1052099 ?auto_1052100 ) ) ( AVAILABLE ?auto_1052102 ) ( ON ?auto_1052099 ?auto_1052098 ) ( not ( = ?auto_1052098 ?auto_1052099 ) ) ( not ( = ?auto_1052098 ?auto_1052100 ) ) ( not ( = ?auto_1052103 ?auto_1052104 ) ) ( HOIST-AT ?auto_1052101 ?auto_1052103 ) ( not ( = ?auto_1052102 ?auto_1052101 ) ) ( AVAILABLE ?auto_1052101 ) ( SURFACE-AT ?auto_1052100 ?auto_1052103 ) ( ON ?auto_1052100 ?auto_1052105 ) ( CLEAR ?auto_1052100 ) ( not ( = ?auto_1052099 ?auto_1052105 ) ) ( not ( = ?auto_1052100 ?auto_1052105 ) ) ( not ( = ?auto_1052098 ?auto_1052105 ) ) ( TRUCK-AT ?auto_1052106 ?auto_1052104 ) ( ON ?auto_1052093 ?auto_1052092 ) ( ON ?auto_1052094 ?auto_1052093 ) ( ON ?auto_1052095 ?auto_1052094 ) ( ON ?auto_1052096 ?auto_1052095 ) ( ON ?auto_1052097 ?auto_1052096 ) ( ON ?auto_1052098 ?auto_1052097 ) ( not ( = ?auto_1052092 ?auto_1052093 ) ) ( not ( = ?auto_1052092 ?auto_1052094 ) ) ( not ( = ?auto_1052092 ?auto_1052095 ) ) ( not ( = ?auto_1052092 ?auto_1052096 ) ) ( not ( = ?auto_1052092 ?auto_1052097 ) ) ( not ( = ?auto_1052092 ?auto_1052098 ) ) ( not ( = ?auto_1052092 ?auto_1052099 ) ) ( not ( = ?auto_1052092 ?auto_1052100 ) ) ( not ( = ?auto_1052092 ?auto_1052105 ) ) ( not ( = ?auto_1052093 ?auto_1052094 ) ) ( not ( = ?auto_1052093 ?auto_1052095 ) ) ( not ( = ?auto_1052093 ?auto_1052096 ) ) ( not ( = ?auto_1052093 ?auto_1052097 ) ) ( not ( = ?auto_1052093 ?auto_1052098 ) ) ( not ( = ?auto_1052093 ?auto_1052099 ) ) ( not ( = ?auto_1052093 ?auto_1052100 ) ) ( not ( = ?auto_1052093 ?auto_1052105 ) ) ( not ( = ?auto_1052094 ?auto_1052095 ) ) ( not ( = ?auto_1052094 ?auto_1052096 ) ) ( not ( = ?auto_1052094 ?auto_1052097 ) ) ( not ( = ?auto_1052094 ?auto_1052098 ) ) ( not ( = ?auto_1052094 ?auto_1052099 ) ) ( not ( = ?auto_1052094 ?auto_1052100 ) ) ( not ( = ?auto_1052094 ?auto_1052105 ) ) ( not ( = ?auto_1052095 ?auto_1052096 ) ) ( not ( = ?auto_1052095 ?auto_1052097 ) ) ( not ( = ?auto_1052095 ?auto_1052098 ) ) ( not ( = ?auto_1052095 ?auto_1052099 ) ) ( not ( = ?auto_1052095 ?auto_1052100 ) ) ( not ( = ?auto_1052095 ?auto_1052105 ) ) ( not ( = ?auto_1052096 ?auto_1052097 ) ) ( not ( = ?auto_1052096 ?auto_1052098 ) ) ( not ( = ?auto_1052096 ?auto_1052099 ) ) ( not ( = ?auto_1052096 ?auto_1052100 ) ) ( not ( = ?auto_1052096 ?auto_1052105 ) ) ( not ( = ?auto_1052097 ?auto_1052098 ) ) ( not ( = ?auto_1052097 ?auto_1052099 ) ) ( not ( = ?auto_1052097 ?auto_1052100 ) ) ( not ( = ?auto_1052097 ?auto_1052105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052098 ?auto_1052099 ?auto_1052100 )
      ( MAKE-8CRATE-VERIFY ?auto_1052092 ?auto_1052093 ?auto_1052094 ?auto_1052095 ?auto_1052096 ?auto_1052097 ?auto_1052098 ?auto_1052099 ?auto_1052100 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052185 - SURFACE
      ?auto_1052186 - SURFACE
      ?auto_1052187 - SURFACE
      ?auto_1052188 - SURFACE
      ?auto_1052189 - SURFACE
      ?auto_1052190 - SURFACE
      ?auto_1052191 - SURFACE
      ?auto_1052192 - SURFACE
      ?auto_1052193 - SURFACE
    )
    :vars
    (
      ?auto_1052197 - HOIST
      ?auto_1052195 - PLACE
      ?auto_1052199 - PLACE
      ?auto_1052194 - HOIST
      ?auto_1052198 - SURFACE
      ?auto_1052196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052197 ?auto_1052195 ) ( IS-CRATE ?auto_1052193 ) ( not ( = ?auto_1052192 ?auto_1052193 ) ) ( not ( = ?auto_1052191 ?auto_1052192 ) ) ( not ( = ?auto_1052191 ?auto_1052193 ) ) ( not ( = ?auto_1052199 ?auto_1052195 ) ) ( HOIST-AT ?auto_1052194 ?auto_1052199 ) ( not ( = ?auto_1052197 ?auto_1052194 ) ) ( AVAILABLE ?auto_1052194 ) ( SURFACE-AT ?auto_1052193 ?auto_1052199 ) ( ON ?auto_1052193 ?auto_1052198 ) ( CLEAR ?auto_1052193 ) ( not ( = ?auto_1052192 ?auto_1052198 ) ) ( not ( = ?auto_1052193 ?auto_1052198 ) ) ( not ( = ?auto_1052191 ?auto_1052198 ) ) ( TRUCK-AT ?auto_1052196 ?auto_1052195 ) ( SURFACE-AT ?auto_1052191 ?auto_1052195 ) ( CLEAR ?auto_1052191 ) ( LIFTING ?auto_1052197 ?auto_1052192 ) ( IS-CRATE ?auto_1052192 ) ( ON ?auto_1052186 ?auto_1052185 ) ( ON ?auto_1052187 ?auto_1052186 ) ( ON ?auto_1052188 ?auto_1052187 ) ( ON ?auto_1052189 ?auto_1052188 ) ( ON ?auto_1052190 ?auto_1052189 ) ( ON ?auto_1052191 ?auto_1052190 ) ( not ( = ?auto_1052185 ?auto_1052186 ) ) ( not ( = ?auto_1052185 ?auto_1052187 ) ) ( not ( = ?auto_1052185 ?auto_1052188 ) ) ( not ( = ?auto_1052185 ?auto_1052189 ) ) ( not ( = ?auto_1052185 ?auto_1052190 ) ) ( not ( = ?auto_1052185 ?auto_1052191 ) ) ( not ( = ?auto_1052185 ?auto_1052192 ) ) ( not ( = ?auto_1052185 ?auto_1052193 ) ) ( not ( = ?auto_1052185 ?auto_1052198 ) ) ( not ( = ?auto_1052186 ?auto_1052187 ) ) ( not ( = ?auto_1052186 ?auto_1052188 ) ) ( not ( = ?auto_1052186 ?auto_1052189 ) ) ( not ( = ?auto_1052186 ?auto_1052190 ) ) ( not ( = ?auto_1052186 ?auto_1052191 ) ) ( not ( = ?auto_1052186 ?auto_1052192 ) ) ( not ( = ?auto_1052186 ?auto_1052193 ) ) ( not ( = ?auto_1052186 ?auto_1052198 ) ) ( not ( = ?auto_1052187 ?auto_1052188 ) ) ( not ( = ?auto_1052187 ?auto_1052189 ) ) ( not ( = ?auto_1052187 ?auto_1052190 ) ) ( not ( = ?auto_1052187 ?auto_1052191 ) ) ( not ( = ?auto_1052187 ?auto_1052192 ) ) ( not ( = ?auto_1052187 ?auto_1052193 ) ) ( not ( = ?auto_1052187 ?auto_1052198 ) ) ( not ( = ?auto_1052188 ?auto_1052189 ) ) ( not ( = ?auto_1052188 ?auto_1052190 ) ) ( not ( = ?auto_1052188 ?auto_1052191 ) ) ( not ( = ?auto_1052188 ?auto_1052192 ) ) ( not ( = ?auto_1052188 ?auto_1052193 ) ) ( not ( = ?auto_1052188 ?auto_1052198 ) ) ( not ( = ?auto_1052189 ?auto_1052190 ) ) ( not ( = ?auto_1052189 ?auto_1052191 ) ) ( not ( = ?auto_1052189 ?auto_1052192 ) ) ( not ( = ?auto_1052189 ?auto_1052193 ) ) ( not ( = ?auto_1052189 ?auto_1052198 ) ) ( not ( = ?auto_1052190 ?auto_1052191 ) ) ( not ( = ?auto_1052190 ?auto_1052192 ) ) ( not ( = ?auto_1052190 ?auto_1052193 ) ) ( not ( = ?auto_1052190 ?auto_1052198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052191 ?auto_1052192 ?auto_1052193 )
      ( MAKE-8CRATE-VERIFY ?auto_1052185 ?auto_1052186 ?auto_1052187 ?auto_1052188 ?auto_1052189 ?auto_1052190 ?auto_1052191 ?auto_1052192 ?auto_1052193 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052278 - SURFACE
      ?auto_1052279 - SURFACE
      ?auto_1052280 - SURFACE
      ?auto_1052281 - SURFACE
      ?auto_1052282 - SURFACE
      ?auto_1052283 - SURFACE
      ?auto_1052284 - SURFACE
      ?auto_1052285 - SURFACE
      ?auto_1052286 - SURFACE
    )
    :vars
    (
      ?auto_1052288 - HOIST
      ?auto_1052290 - PLACE
      ?auto_1052292 - PLACE
      ?auto_1052287 - HOIST
      ?auto_1052289 - SURFACE
      ?auto_1052291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052288 ?auto_1052290 ) ( IS-CRATE ?auto_1052286 ) ( not ( = ?auto_1052285 ?auto_1052286 ) ) ( not ( = ?auto_1052284 ?auto_1052285 ) ) ( not ( = ?auto_1052284 ?auto_1052286 ) ) ( not ( = ?auto_1052292 ?auto_1052290 ) ) ( HOIST-AT ?auto_1052287 ?auto_1052292 ) ( not ( = ?auto_1052288 ?auto_1052287 ) ) ( AVAILABLE ?auto_1052287 ) ( SURFACE-AT ?auto_1052286 ?auto_1052292 ) ( ON ?auto_1052286 ?auto_1052289 ) ( CLEAR ?auto_1052286 ) ( not ( = ?auto_1052285 ?auto_1052289 ) ) ( not ( = ?auto_1052286 ?auto_1052289 ) ) ( not ( = ?auto_1052284 ?auto_1052289 ) ) ( TRUCK-AT ?auto_1052291 ?auto_1052290 ) ( SURFACE-AT ?auto_1052284 ?auto_1052290 ) ( CLEAR ?auto_1052284 ) ( IS-CRATE ?auto_1052285 ) ( AVAILABLE ?auto_1052288 ) ( IN ?auto_1052285 ?auto_1052291 ) ( ON ?auto_1052279 ?auto_1052278 ) ( ON ?auto_1052280 ?auto_1052279 ) ( ON ?auto_1052281 ?auto_1052280 ) ( ON ?auto_1052282 ?auto_1052281 ) ( ON ?auto_1052283 ?auto_1052282 ) ( ON ?auto_1052284 ?auto_1052283 ) ( not ( = ?auto_1052278 ?auto_1052279 ) ) ( not ( = ?auto_1052278 ?auto_1052280 ) ) ( not ( = ?auto_1052278 ?auto_1052281 ) ) ( not ( = ?auto_1052278 ?auto_1052282 ) ) ( not ( = ?auto_1052278 ?auto_1052283 ) ) ( not ( = ?auto_1052278 ?auto_1052284 ) ) ( not ( = ?auto_1052278 ?auto_1052285 ) ) ( not ( = ?auto_1052278 ?auto_1052286 ) ) ( not ( = ?auto_1052278 ?auto_1052289 ) ) ( not ( = ?auto_1052279 ?auto_1052280 ) ) ( not ( = ?auto_1052279 ?auto_1052281 ) ) ( not ( = ?auto_1052279 ?auto_1052282 ) ) ( not ( = ?auto_1052279 ?auto_1052283 ) ) ( not ( = ?auto_1052279 ?auto_1052284 ) ) ( not ( = ?auto_1052279 ?auto_1052285 ) ) ( not ( = ?auto_1052279 ?auto_1052286 ) ) ( not ( = ?auto_1052279 ?auto_1052289 ) ) ( not ( = ?auto_1052280 ?auto_1052281 ) ) ( not ( = ?auto_1052280 ?auto_1052282 ) ) ( not ( = ?auto_1052280 ?auto_1052283 ) ) ( not ( = ?auto_1052280 ?auto_1052284 ) ) ( not ( = ?auto_1052280 ?auto_1052285 ) ) ( not ( = ?auto_1052280 ?auto_1052286 ) ) ( not ( = ?auto_1052280 ?auto_1052289 ) ) ( not ( = ?auto_1052281 ?auto_1052282 ) ) ( not ( = ?auto_1052281 ?auto_1052283 ) ) ( not ( = ?auto_1052281 ?auto_1052284 ) ) ( not ( = ?auto_1052281 ?auto_1052285 ) ) ( not ( = ?auto_1052281 ?auto_1052286 ) ) ( not ( = ?auto_1052281 ?auto_1052289 ) ) ( not ( = ?auto_1052282 ?auto_1052283 ) ) ( not ( = ?auto_1052282 ?auto_1052284 ) ) ( not ( = ?auto_1052282 ?auto_1052285 ) ) ( not ( = ?auto_1052282 ?auto_1052286 ) ) ( not ( = ?auto_1052282 ?auto_1052289 ) ) ( not ( = ?auto_1052283 ?auto_1052284 ) ) ( not ( = ?auto_1052283 ?auto_1052285 ) ) ( not ( = ?auto_1052283 ?auto_1052286 ) ) ( not ( = ?auto_1052283 ?auto_1052289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052284 ?auto_1052285 ?auto_1052286 )
      ( MAKE-8CRATE-VERIFY ?auto_1052278 ?auto_1052279 ?auto_1052280 ?auto_1052281 ?auto_1052282 ?auto_1052283 ?auto_1052284 ?auto_1052285 ?auto_1052286 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1052293 - SURFACE
      ?auto_1052294 - SURFACE
    )
    :vars
    (
      ?auto_1052297 - HOIST
      ?auto_1052299 - PLACE
      ?auto_1052295 - SURFACE
      ?auto_1052301 - PLACE
      ?auto_1052296 - HOIST
      ?auto_1052298 - SURFACE
      ?auto_1052300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052297 ?auto_1052299 ) ( IS-CRATE ?auto_1052294 ) ( not ( = ?auto_1052293 ?auto_1052294 ) ) ( not ( = ?auto_1052295 ?auto_1052293 ) ) ( not ( = ?auto_1052295 ?auto_1052294 ) ) ( not ( = ?auto_1052301 ?auto_1052299 ) ) ( HOIST-AT ?auto_1052296 ?auto_1052301 ) ( not ( = ?auto_1052297 ?auto_1052296 ) ) ( AVAILABLE ?auto_1052296 ) ( SURFACE-AT ?auto_1052294 ?auto_1052301 ) ( ON ?auto_1052294 ?auto_1052298 ) ( CLEAR ?auto_1052294 ) ( not ( = ?auto_1052293 ?auto_1052298 ) ) ( not ( = ?auto_1052294 ?auto_1052298 ) ) ( not ( = ?auto_1052295 ?auto_1052298 ) ) ( SURFACE-AT ?auto_1052295 ?auto_1052299 ) ( CLEAR ?auto_1052295 ) ( IS-CRATE ?auto_1052293 ) ( AVAILABLE ?auto_1052297 ) ( IN ?auto_1052293 ?auto_1052300 ) ( TRUCK-AT ?auto_1052300 ?auto_1052301 ) )
    :subtasks
    ( ( !DRIVE ?auto_1052300 ?auto_1052301 ?auto_1052299 )
      ( MAKE-2CRATE ?auto_1052295 ?auto_1052293 ?auto_1052294 )
      ( MAKE-1CRATE-VERIFY ?auto_1052293 ?auto_1052294 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1052302 - SURFACE
      ?auto_1052303 - SURFACE
      ?auto_1052304 - SURFACE
    )
    :vars
    (
      ?auto_1052309 - HOIST
      ?auto_1052308 - PLACE
      ?auto_1052306 - PLACE
      ?auto_1052305 - HOIST
      ?auto_1052310 - SURFACE
      ?auto_1052307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052309 ?auto_1052308 ) ( IS-CRATE ?auto_1052304 ) ( not ( = ?auto_1052303 ?auto_1052304 ) ) ( not ( = ?auto_1052302 ?auto_1052303 ) ) ( not ( = ?auto_1052302 ?auto_1052304 ) ) ( not ( = ?auto_1052306 ?auto_1052308 ) ) ( HOIST-AT ?auto_1052305 ?auto_1052306 ) ( not ( = ?auto_1052309 ?auto_1052305 ) ) ( AVAILABLE ?auto_1052305 ) ( SURFACE-AT ?auto_1052304 ?auto_1052306 ) ( ON ?auto_1052304 ?auto_1052310 ) ( CLEAR ?auto_1052304 ) ( not ( = ?auto_1052303 ?auto_1052310 ) ) ( not ( = ?auto_1052304 ?auto_1052310 ) ) ( not ( = ?auto_1052302 ?auto_1052310 ) ) ( SURFACE-AT ?auto_1052302 ?auto_1052308 ) ( CLEAR ?auto_1052302 ) ( IS-CRATE ?auto_1052303 ) ( AVAILABLE ?auto_1052309 ) ( IN ?auto_1052303 ?auto_1052307 ) ( TRUCK-AT ?auto_1052307 ?auto_1052306 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1052303 ?auto_1052304 )
      ( MAKE-2CRATE-VERIFY ?auto_1052302 ?auto_1052303 ?auto_1052304 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1052311 - SURFACE
      ?auto_1052312 - SURFACE
      ?auto_1052313 - SURFACE
      ?auto_1052314 - SURFACE
    )
    :vars
    (
      ?auto_1052317 - HOIST
      ?auto_1052315 - PLACE
      ?auto_1052318 - PLACE
      ?auto_1052320 - HOIST
      ?auto_1052319 - SURFACE
      ?auto_1052316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052317 ?auto_1052315 ) ( IS-CRATE ?auto_1052314 ) ( not ( = ?auto_1052313 ?auto_1052314 ) ) ( not ( = ?auto_1052312 ?auto_1052313 ) ) ( not ( = ?auto_1052312 ?auto_1052314 ) ) ( not ( = ?auto_1052318 ?auto_1052315 ) ) ( HOIST-AT ?auto_1052320 ?auto_1052318 ) ( not ( = ?auto_1052317 ?auto_1052320 ) ) ( AVAILABLE ?auto_1052320 ) ( SURFACE-AT ?auto_1052314 ?auto_1052318 ) ( ON ?auto_1052314 ?auto_1052319 ) ( CLEAR ?auto_1052314 ) ( not ( = ?auto_1052313 ?auto_1052319 ) ) ( not ( = ?auto_1052314 ?auto_1052319 ) ) ( not ( = ?auto_1052312 ?auto_1052319 ) ) ( SURFACE-AT ?auto_1052312 ?auto_1052315 ) ( CLEAR ?auto_1052312 ) ( IS-CRATE ?auto_1052313 ) ( AVAILABLE ?auto_1052317 ) ( IN ?auto_1052313 ?auto_1052316 ) ( TRUCK-AT ?auto_1052316 ?auto_1052318 ) ( ON ?auto_1052312 ?auto_1052311 ) ( not ( = ?auto_1052311 ?auto_1052312 ) ) ( not ( = ?auto_1052311 ?auto_1052313 ) ) ( not ( = ?auto_1052311 ?auto_1052314 ) ) ( not ( = ?auto_1052311 ?auto_1052319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052312 ?auto_1052313 ?auto_1052314 )
      ( MAKE-3CRATE-VERIFY ?auto_1052311 ?auto_1052312 ?auto_1052313 ?auto_1052314 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1052321 - SURFACE
      ?auto_1052322 - SURFACE
      ?auto_1052323 - SURFACE
      ?auto_1052324 - SURFACE
      ?auto_1052325 - SURFACE
    )
    :vars
    (
      ?auto_1052328 - HOIST
      ?auto_1052326 - PLACE
      ?auto_1052329 - PLACE
      ?auto_1052331 - HOIST
      ?auto_1052330 - SURFACE
      ?auto_1052327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052328 ?auto_1052326 ) ( IS-CRATE ?auto_1052325 ) ( not ( = ?auto_1052324 ?auto_1052325 ) ) ( not ( = ?auto_1052323 ?auto_1052324 ) ) ( not ( = ?auto_1052323 ?auto_1052325 ) ) ( not ( = ?auto_1052329 ?auto_1052326 ) ) ( HOIST-AT ?auto_1052331 ?auto_1052329 ) ( not ( = ?auto_1052328 ?auto_1052331 ) ) ( AVAILABLE ?auto_1052331 ) ( SURFACE-AT ?auto_1052325 ?auto_1052329 ) ( ON ?auto_1052325 ?auto_1052330 ) ( CLEAR ?auto_1052325 ) ( not ( = ?auto_1052324 ?auto_1052330 ) ) ( not ( = ?auto_1052325 ?auto_1052330 ) ) ( not ( = ?auto_1052323 ?auto_1052330 ) ) ( SURFACE-AT ?auto_1052323 ?auto_1052326 ) ( CLEAR ?auto_1052323 ) ( IS-CRATE ?auto_1052324 ) ( AVAILABLE ?auto_1052328 ) ( IN ?auto_1052324 ?auto_1052327 ) ( TRUCK-AT ?auto_1052327 ?auto_1052329 ) ( ON ?auto_1052322 ?auto_1052321 ) ( ON ?auto_1052323 ?auto_1052322 ) ( not ( = ?auto_1052321 ?auto_1052322 ) ) ( not ( = ?auto_1052321 ?auto_1052323 ) ) ( not ( = ?auto_1052321 ?auto_1052324 ) ) ( not ( = ?auto_1052321 ?auto_1052325 ) ) ( not ( = ?auto_1052321 ?auto_1052330 ) ) ( not ( = ?auto_1052322 ?auto_1052323 ) ) ( not ( = ?auto_1052322 ?auto_1052324 ) ) ( not ( = ?auto_1052322 ?auto_1052325 ) ) ( not ( = ?auto_1052322 ?auto_1052330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052323 ?auto_1052324 ?auto_1052325 )
      ( MAKE-4CRATE-VERIFY ?auto_1052321 ?auto_1052322 ?auto_1052323 ?auto_1052324 ?auto_1052325 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1052332 - SURFACE
      ?auto_1052333 - SURFACE
      ?auto_1052334 - SURFACE
      ?auto_1052335 - SURFACE
      ?auto_1052336 - SURFACE
      ?auto_1052337 - SURFACE
    )
    :vars
    (
      ?auto_1052340 - HOIST
      ?auto_1052338 - PLACE
      ?auto_1052341 - PLACE
      ?auto_1052343 - HOIST
      ?auto_1052342 - SURFACE
      ?auto_1052339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052340 ?auto_1052338 ) ( IS-CRATE ?auto_1052337 ) ( not ( = ?auto_1052336 ?auto_1052337 ) ) ( not ( = ?auto_1052335 ?auto_1052336 ) ) ( not ( = ?auto_1052335 ?auto_1052337 ) ) ( not ( = ?auto_1052341 ?auto_1052338 ) ) ( HOIST-AT ?auto_1052343 ?auto_1052341 ) ( not ( = ?auto_1052340 ?auto_1052343 ) ) ( AVAILABLE ?auto_1052343 ) ( SURFACE-AT ?auto_1052337 ?auto_1052341 ) ( ON ?auto_1052337 ?auto_1052342 ) ( CLEAR ?auto_1052337 ) ( not ( = ?auto_1052336 ?auto_1052342 ) ) ( not ( = ?auto_1052337 ?auto_1052342 ) ) ( not ( = ?auto_1052335 ?auto_1052342 ) ) ( SURFACE-AT ?auto_1052335 ?auto_1052338 ) ( CLEAR ?auto_1052335 ) ( IS-CRATE ?auto_1052336 ) ( AVAILABLE ?auto_1052340 ) ( IN ?auto_1052336 ?auto_1052339 ) ( TRUCK-AT ?auto_1052339 ?auto_1052341 ) ( ON ?auto_1052333 ?auto_1052332 ) ( ON ?auto_1052334 ?auto_1052333 ) ( ON ?auto_1052335 ?auto_1052334 ) ( not ( = ?auto_1052332 ?auto_1052333 ) ) ( not ( = ?auto_1052332 ?auto_1052334 ) ) ( not ( = ?auto_1052332 ?auto_1052335 ) ) ( not ( = ?auto_1052332 ?auto_1052336 ) ) ( not ( = ?auto_1052332 ?auto_1052337 ) ) ( not ( = ?auto_1052332 ?auto_1052342 ) ) ( not ( = ?auto_1052333 ?auto_1052334 ) ) ( not ( = ?auto_1052333 ?auto_1052335 ) ) ( not ( = ?auto_1052333 ?auto_1052336 ) ) ( not ( = ?auto_1052333 ?auto_1052337 ) ) ( not ( = ?auto_1052333 ?auto_1052342 ) ) ( not ( = ?auto_1052334 ?auto_1052335 ) ) ( not ( = ?auto_1052334 ?auto_1052336 ) ) ( not ( = ?auto_1052334 ?auto_1052337 ) ) ( not ( = ?auto_1052334 ?auto_1052342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052335 ?auto_1052336 ?auto_1052337 )
      ( MAKE-5CRATE-VERIFY ?auto_1052332 ?auto_1052333 ?auto_1052334 ?auto_1052335 ?auto_1052336 ?auto_1052337 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1052344 - SURFACE
      ?auto_1052345 - SURFACE
      ?auto_1052346 - SURFACE
      ?auto_1052347 - SURFACE
      ?auto_1052348 - SURFACE
      ?auto_1052349 - SURFACE
      ?auto_1052350 - SURFACE
    )
    :vars
    (
      ?auto_1052353 - HOIST
      ?auto_1052351 - PLACE
      ?auto_1052354 - PLACE
      ?auto_1052356 - HOIST
      ?auto_1052355 - SURFACE
      ?auto_1052352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052353 ?auto_1052351 ) ( IS-CRATE ?auto_1052350 ) ( not ( = ?auto_1052349 ?auto_1052350 ) ) ( not ( = ?auto_1052348 ?auto_1052349 ) ) ( not ( = ?auto_1052348 ?auto_1052350 ) ) ( not ( = ?auto_1052354 ?auto_1052351 ) ) ( HOIST-AT ?auto_1052356 ?auto_1052354 ) ( not ( = ?auto_1052353 ?auto_1052356 ) ) ( AVAILABLE ?auto_1052356 ) ( SURFACE-AT ?auto_1052350 ?auto_1052354 ) ( ON ?auto_1052350 ?auto_1052355 ) ( CLEAR ?auto_1052350 ) ( not ( = ?auto_1052349 ?auto_1052355 ) ) ( not ( = ?auto_1052350 ?auto_1052355 ) ) ( not ( = ?auto_1052348 ?auto_1052355 ) ) ( SURFACE-AT ?auto_1052348 ?auto_1052351 ) ( CLEAR ?auto_1052348 ) ( IS-CRATE ?auto_1052349 ) ( AVAILABLE ?auto_1052353 ) ( IN ?auto_1052349 ?auto_1052352 ) ( TRUCK-AT ?auto_1052352 ?auto_1052354 ) ( ON ?auto_1052345 ?auto_1052344 ) ( ON ?auto_1052346 ?auto_1052345 ) ( ON ?auto_1052347 ?auto_1052346 ) ( ON ?auto_1052348 ?auto_1052347 ) ( not ( = ?auto_1052344 ?auto_1052345 ) ) ( not ( = ?auto_1052344 ?auto_1052346 ) ) ( not ( = ?auto_1052344 ?auto_1052347 ) ) ( not ( = ?auto_1052344 ?auto_1052348 ) ) ( not ( = ?auto_1052344 ?auto_1052349 ) ) ( not ( = ?auto_1052344 ?auto_1052350 ) ) ( not ( = ?auto_1052344 ?auto_1052355 ) ) ( not ( = ?auto_1052345 ?auto_1052346 ) ) ( not ( = ?auto_1052345 ?auto_1052347 ) ) ( not ( = ?auto_1052345 ?auto_1052348 ) ) ( not ( = ?auto_1052345 ?auto_1052349 ) ) ( not ( = ?auto_1052345 ?auto_1052350 ) ) ( not ( = ?auto_1052345 ?auto_1052355 ) ) ( not ( = ?auto_1052346 ?auto_1052347 ) ) ( not ( = ?auto_1052346 ?auto_1052348 ) ) ( not ( = ?auto_1052346 ?auto_1052349 ) ) ( not ( = ?auto_1052346 ?auto_1052350 ) ) ( not ( = ?auto_1052346 ?auto_1052355 ) ) ( not ( = ?auto_1052347 ?auto_1052348 ) ) ( not ( = ?auto_1052347 ?auto_1052349 ) ) ( not ( = ?auto_1052347 ?auto_1052350 ) ) ( not ( = ?auto_1052347 ?auto_1052355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052348 ?auto_1052349 ?auto_1052350 )
      ( MAKE-6CRATE-VERIFY ?auto_1052344 ?auto_1052345 ?auto_1052346 ?auto_1052347 ?auto_1052348 ?auto_1052349 ?auto_1052350 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1052357 - SURFACE
      ?auto_1052358 - SURFACE
      ?auto_1052359 - SURFACE
      ?auto_1052360 - SURFACE
      ?auto_1052361 - SURFACE
      ?auto_1052362 - SURFACE
      ?auto_1052363 - SURFACE
      ?auto_1052364 - SURFACE
    )
    :vars
    (
      ?auto_1052367 - HOIST
      ?auto_1052365 - PLACE
      ?auto_1052368 - PLACE
      ?auto_1052370 - HOIST
      ?auto_1052369 - SURFACE
      ?auto_1052366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052367 ?auto_1052365 ) ( IS-CRATE ?auto_1052364 ) ( not ( = ?auto_1052363 ?auto_1052364 ) ) ( not ( = ?auto_1052362 ?auto_1052363 ) ) ( not ( = ?auto_1052362 ?auto_1052364 ) ) ( not ( = ?auto_1052368 ?auto_1052365 ) ) ( HOIST-AT ?auto_1052370 ?auto_1052368 ) ( not ( = ?auto_1052367 ?auto_1052370 ) ) ( AVAILABLE ?auto_1052370 ) ( SURFACE-AT ?auto_1052364 ?auto_1052368 ) ( ON ?auto_1052364 ?auto_1052369 ) ( CLEAR ?auto_1052364 ) ( not ( = ?auto_1052363 ?auto_1052369 ) ) ( not ( = ?auto_1052364 ?auto_1052369 ) ) ( not ( = ?auto_1052362 ?auto_1052369 ) ) ( SURFACE-AT ?auto_1052362 ?auto_1052365 ) ( CLEAR ?auto_1052362 ) ( IS-CRATE ?auto_1052363 ) ( AVAILABLE ?auto_1052367 ) ( IN ?auto_1052363 ?auto_1052366 ) ( TRUCK-AT ?auto_1052366 ?auto_1052368 ) ( ON ?auto_1052358 ?auto_1052357 ) ( ON ?auto_1052359 ?auto_1052358 ) ( ON ?auto_1052360 ?auto_1052359 ) ( ON ?auto_1052361 ?auto_1052360 ) ( ON ?auto_1052362 ?auto_1052361 ) ( not ( = ?auto_1052357 ?auto_1052358 ) ) ( not ( = ?auto_1052357 ?auto_1052359 ) ) ( not ( = ?auto_1052357 ?auto_1052360 ) ) ( not ( = ?auto_1052357 ?auto_1052361 ) ) ( not ( = ?auto_1052357 ?auto_1052362 ) ) ( not ( = ?auto_1052357 ?auto_1052363 ) ) ( not ( = ?auto_1052357 ?auto_1052364 ) ) ( not ( = ?auto_1052357 ?auto_1052369 ) ) ( not ( = ?auto_1052358 ?auto_1052359 ) ) ( not ( = ?auto_1052358 ?auto_1052360 ) ) ( not ( = ?auto_1052358 ?auto_1052361 ) ) ( not ( = ?auto_1052358 ?auto_1052362 ) ) ( not ( = ?auto_1052358 ?auto_1052363 ) ) ( not ( = ?auto_1052358 ?auto_1052364 ) ) ( not ( = ?auto_1052358 ?auto_1052369 ) ) ( not ( = ?auto_1052359 ?auto_1052360 ) ) ( not ( = ?auto_1052359 ?auto_1052361 ) ) ( not ( = ?auto_1052359 ?auto_1052362 ) ) ( not ( = ?auto_1052359 ?auto_1052363 ) ) ( not ( = ?auto_1052359 ?auto_1052364 ) ) ( not ( = ?auto_1052359 ?auto_1052369 ) ) ( not ( = ?auto_1052360 ?auto_1052361 ) ) ( not ( = ?auto_1052360 ?auto_1052362 ) ) ( not ( = ?auto_1052360 ?auto_1052363 ) ) ( not ( = ?auto_1052360 ?auto_1052364 ) ) ( not ( = ?auto_1052360 ?auto_1052369 ) ) ( not ( = ?auto_1052361 ?auto_1052362 ) ) ( not ( = ?auto_1052361 ?auto_1052363 ) ) ( not ( = ?auto_1052361 ?auto_1052364 ) ) ( not ( = ?auto_1052361 ?auto_1052369 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052362 ?auto_1052363 ?auto_1052364 )
      ( MAKE-7CRATE-VERIFY ?auto_1052357 ?auto_1052358 ?auto_1052359 ?auto_1052360 ?auto_1052361 ?auto_1052362 ?auto_1052363 ?auto_1052364 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052371 - SURFACE
      ?auto_1052372 - SURFACE
      ?auto_1052373 - SURFACE
      ?auto_1052374 - SURFACE
      ?auto_1052375 - SURFACE
      ?auto_1052376 - SURFACE
      ?auto_1052377 - SURFACE
      ?auto_1052378 - SURFACE
      ?auto_1052379 - SURFACE
    )
    :vars
    (
      ?auto_1052382 - HOIST
      ?auto_1052380 - PLACE
      ?auto_1052383 - PLACE
      ?auto_1052385 - HOIST
      ?auto_1052384 - SURFACE
      ?auto_1052381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052382 ?auto_1052380 ) ( IS-CRATE ?auto_1052379 ) ( not ( = ?auto_1052378 ?auto_1052379 ) ) ( not ( = ?auto_1052377 ?auto_1052378 ) ) ( not ( = ?auto_1052377 ?auto_1052379 ) ) ( not ( = ?auto_1052383 ?auto_1052380 ) ) ( HOIST-AT ?auto_1052385 ?auto_1052383 ) ( not ( = ?auto_1052382 ?auto_1052385 ) ) ( AVAILABLE ?auto_1052385 ) ( SURFACE-AT ?auto_1052379 ?auto_1052383 ) ( ON ?auto_1052379 ?auto_1052384 ) ( CLEAR ?auto_1052379 ) ( not ( = ?auto_1052378 ?auto_1052384 ) ) ( not ( = ?auto_1052379 ?auto_1052384 ) ) ( not ( = ?auto_1052377 ?auto_1052384 ) ) ( SURFACE-AT ?auto_1052377 ?auto_1052380 ) ( CLEAR ?auto_1052377 ) ( IS-CRATE ?auto_1052378 ) ( AVAILABLE ?auto_1052382 ) ( IN ?auto_1052378 ?auto_1052381 ) ( TRUCK-AT ?auto_1052381 ?auto_1052383 ) ( ON ?auto_1052372 ?auto_1052371 ) ( ON ?auto_1052373 ?auto_1052372 ) ( ON ?auto_1052374 ?auto_1052373 ) ( ON ?auto_1052375 ?auto_1052374 ) ( ON ?auto_1052376 ?auto_1052375 ) ( ON ?auto_1052377 ?auto_1052376 ) ( not ( = ?auto_1052371 ?auto_1052372 ) ) ( not ( = ?auto_1052371 ?auto_1052373 ) ) ( not ( = ?auto_1052371 ?auto_1052374 ) ) ( not ( = ?auto_1052371 ?auto_1052375 ) ) ( not ( = ?auto_1052371 ?auto_1052376 ) ) ( not ( = ?auto_1052371 ?auto_1052377 ) ) ( not ( = ?auto_1052371 ?auto_1052378 ) ) ( not ( = ?auto_1052371 ?auto_1052379 ) ) ( not ( = ?auto_1052371 ?auto_1052384 ) ) ( not ( = ?auto_1052372 ?auto_1052373 ) ) ( not ( = ?auto_1052372 ?auto_1052374 ) ) ( not ( = ?auto_1052372 ?auto_1052375 ) ) ( not ( = ?auto_1052372 ?auto_1052376 ) ) ( not ( = ?auto_1052372 ?auto_1052377 ) ) ( not ( = ?auto_1052372 ?auto_1052378 ) ) ( not ( = ?auto_1052372 ?auto_1052379 ) ) ( not ( = ?auto_1052372 ?auto_1052384 ) ) ( not ( = ?auto_1052373 ?auto_1052374 ) ) ( not ( = ?auto_1052373 ?auto_1052375 ) ) ( not ( = ?auto_1052373 ?auto_1052376 ) ) ( not ( = ?auto_1052373 ?auto_1052377 ) ) ( not ( = ?auto_1052373 ?auto_1052378 ) ) ( not ( = ?auto_1052373 ?auto_1052379 ) ) ( not ( = ?auto_1052373 ?auto_1052384 ) ) ( not ( = ?auto_1052374 ?auto_1052375 ) ) ( not ( = ?auto_1052374 ?auto_1052376 ) ) ( not ( = ?auto_1052374 ?auto_1052377 ) ) ( not ( = ?auto_1052374 ?auto_1052378 ) ) ( not ( = ?auto_1052374 ?auto_1052379 ) ) ( not ( = ?auto_1052374 ?auto_1052384 ) ) ( not ( = ?auto_1052375 ?auto_1052376 ) ) ( not ( = ?auto_1052375 ?auto_1052377 ) ) ( not ( = ?auto_1052375 ?auto_1052378 ) ) ( not ( = ?auto_1052375 ?auto_1052379 ) ) ( not ( = ?auto_1052375 ?auto_1052384 ) ) ( not ( = ?auto_1052376 ?auto_1052377 ) ) ( not ( = ?auto_1052376 ?auto_1052378 ) ) ( not ( = ?auto_1052376 ?auto_1052379 ) ) ( not ( = ?auto_1052376 ?auto_1052384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052377 ?auto_1052378 ?auto_1052379 )
      ( MAKE-8CRATE-VERIFY ?auto_1052371 ?auto_1052372 ?auto_1052373 ?auto_1052374 ?auto_1052375 ?auto_1052376 ?auto_1052377 ?auto_1052378 ?auto_1052379 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1052386 - SURFACE
      ?auto_1052387 - SURFACE
    )
    :vars
    (
      ?auto_1052391 - HOIST
      ?auto_1052389 - PLACE
      ?auto_1052388 - SURFACE
      ?auto_1052392 - PLACE
      ?auto_1052394 - HOIST
      ?auto_1052393 - SURFACE
      ?auto_1052390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052391 ?auto_1052389 ) ( IS-CRATE ?auto_1052387 ) ( not ( = ?auto_1052386 ?auto_1052387 ) ) ( not ( = ?auto_1052388 ?auto_1052386 ) ) ( not ( = ?auto_1052388 ?auto_1052387 ) ) ( not ( = ?auto_1052392 ?auto_1052389 ) ) ( HOIST-AT ?auto_1052394 ?auto_1052392 ) ( not ( = ?auto_1052391 ?auto_1052394 ) ) ( SURFACE-AT ?auto_1052387 ?auto_1052392 ) ( ON ?auto_1052387 ?auto_1052393 ) ( CLEAR ?auto_1052387 ) ( not ( = ?auto_1052386 ?auto_1052393 ) ) ( not ( = ?auto_1052387 ?auto_1052393 ) ) ( not ( = ?auto_1052388 ?auto_1052393 ) ) ( SURFACE-AT ?auto_1052388 ?auto_1052389 ) ( CLEAR ?auto_1052388 ) ( IS-CRATE ?auto_1052386 ) ( AVAILABLE ?auto_1052391 ) ( TRUCK-AT ?auto_1052390 ?auto_1052392 ) ( LIFTING ?auto_1052394 ?auto_1052386 ) )
    :subtasks
    ( ( !LOAD ?auto_1052394 ?auto_1052386 ?auto_1052390 ?auto_1052392 )
      ( MAKE-2CRATE ?auto_1052388 ?auto_1052386 ?auto_1052387 )
      ( MAKE-1CRATE-VERIFY ?auto_1052386 ?auto_1052387 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1052395 - SURFACE
      ?auto_1052396 - SURFACE
      ?auto_1052397 - SURFACE
    )
    :vars
    (
      ?auto_1052402 - HOIST
      ?auto_1052399 - PLACE
      ?auto_1052398 - PLACE
      ?auto_1052400 - HOIST
      ?auto_1052401 - SURFACE
      ?auto_1052403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052402 ?auto_1052399 ) ( IS-CRATE ?auto_1052397 ) ( not ( = ?auto_1052396 ?auto_1052397 ) ) ( not ( = ?auto_1052395 ?auto_1052396 ) ) ( not ( = ?auto_1052395 ?auto_1052397 ) ) ( not ( = ?auto_1052398 ?auto_1052399 ) ) ( HOIST-AT ?auto_1052400 ?auto_1052398 ) ( not ( = ?auto_1052402 ?auto_1052400 ) ) ( SURFACE-AT ?auto_1052397 ?auto_1052398 ) ( ON ?auto_1052397 ?auto_1052401 ) ( CLEAR ?auto_1052397 ) ( not ( = ?auto_1052396 ?auto_1052401 ) ) ( not ( = ?auto_1052397 ?auto_1052401 ) ) ( not ( = ?auto_1052395 ?auto_1052401 ) ) ( SURFACE-AT ?auto_1052395 ?auto_1052399 ) ( CLEAR ?auto_1052395 ) ( IS-CRATE ?auto_1052396 ) ( AVAILABLE ?auto_1052402 ) ( TRUCK-AT ?auto_1052403 ?auto_1052398 ) ( LIFTING ?auto_1052400 ?auto_1052396 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1052396 ?auto_1052397 )
      ( MAKE-2CRATE-VERIFY ?auto_1052395 ?auto_1052396 ?auto_1052397 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1052404 - SURFACE
      ?auto_1052405 - SURFACE
      ?auto_1052406 - SURFACE
      ?auto_1052407 - SURFACE
    )
    :vars
    (
      ?auto_1052410 - HOIST
      ?auto_1052413 - PLACE
      ?auto_1052411 - PLACE
      ?auto_1052409 - HOIST
      ?auto_1052408 - SURFACE
      ?auto_1052412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052410 ?auto_1052413 ) ( IS-CRATE ?auto_1052407 ) ( not ( = ?auto_1052406 ?auto_1052407 ) ) ( not ( = ?auto_1052405 ?auto_1052406 ) ) ( not ( = ?auto_1052405 ?auto_1052407 ) ) ( not ( = ?auto_1052411 ?auto_1052413 ) ) ( HOIST-AT ?auto_1052409 ?auto_1052411 ) ( not ( = ?auto_1052410 ?auto_1052409 ) ) ( SURFACE-AT ?auto_1052407 ?auto_1052411 ) ( ON ?auto_1052407 ?auto_1052408 ) ( CLEAR ?auto_1052407 ) ( not ( = ?auto_1052406 ?auto_1052408 ) ) ( not ( = ?auto_1052407 ?auto_1052408 ) ) ( not ( = ?auto_1052405 ?auto_1052408 ) ) ( SURFACE-AT ?auto_1052405 ?auto_1052413 ) ( CLEAR ?auto_1052405 ) ( IS-CRATE ?auto_1052406 ) ( AVAILABLE ?auto_1052410 ) ( TRUCK-AT ?auto_1052412 ?auto_1052411 ) ( LIFTING ?auto_1052409 ?auto_1052406 ) ( ON ?auto_1052405 ?auto_1052404 ) ( not ( = ?auto_1052404 ?auto_1052405 ) ) ( not ( = ?auto_1052404 ?auto_1052406 ) ) ( not ( = ?auto_1052404 ?auto_1052407 ) ) ( not ( = ?auto_1052404 ?auto_1052408 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052405 ?auto_1052406 ?auto_1052407 )
      ( MAKE-3CRATE-VERIFY ?auto_1052404 ?auto_1052405 ?auto_1052406 ?auto_1052407 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1052414 - SURFACE
      ?auto_1052415 - SURFACE
      ?auto_1052416 - SURFACE
      ?auto_1052417 - SURFACE
      ?auto_1052418 - SURFACE
    )
    :vars
    (
      ?auto_1052421 - HOIST
      ?auto_1052424 - PLACE
      ?auto_1052422 - PLACE
      ?auto_1052420 - HOIST
      ?auto_1052419 - SURFACE
      ?auto_1052423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052421 ?auto_1052424 ) ( IS-CRATE ?auto_1052418 ) ( not ( = ?auto_1052417 ?auto_1052418 ) ) ( not ( = ?auto_1052416 ?auto_1052417 ) ) ( not ( = ?auto_1052416 ?auto_1052418 ) ) ( not ( = ?auto_1052422 ?auto_1052424 ) ) ( HOIST-AT ?auto_1052420 ?auto_1052422 ) ( not ( = ?auto_1052421 ?auto_1052420 ) ) ( SURFACE-AT ?auto_1052418 ?auto_1052422 ) ( ON ?auto_1052418 ?auto_1052419 ) ( CLEAR ?auto_1052418 ) ( not ( = ?auto_1052417 ?auto_1052419 ) ) ( not ( = ?auto_1052418 ?auto_1052419 ) ) ( not ( = ?auto_1052416 ?auto_1052419 ) ) ( SURFACE-AT ?auto_1052416 ?auto_1052424 ) ( CLEAR ?auto_1052416 ) ( IS-CRATE ?auto_1052417 ) ( AVAILABLE ?auto_1052421 ) ( TRUCK-AT ?auto_1052423 ?auto_1052422 ) ( LIFTING ?auto_1052420 ?auto_1052417 ) ( ON ?auto_1052415 ?auto_1052414 ) ( ON ?auto_1052416 ?auto_1052415 ) ( not ( = ?auto_1052414 ?auto_1052415 ) ) ( not ( = ?auto_1052414 ?auto_1052416 ) ) ( not ( = ?auto_1052414 ?auto_1052417 ) ) ( not ( = ?auto_1052414 ?auto_1052418 ) ) ( not ( = ?auto_1052414 ?auto_1052419 ) ) ( not ( = ?auto_1052415 ?auto_1052416 ) ) ( not ( = ?auto_1052415 ?auto_1052417 ) ) ( not ( = ?auto_1052415 ?auto_1052418 ) ) ( not ( = ?auto_1052415 ?auto_1052419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052416 ?auto_1052417 ?auto_1052418 )
      ( MAKE-4CRATE-VERIFY ?auto_1052414 ?auto_1052415 ?auto_1052416 ?auto_1052417 ?auto_1052418 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1052425 - SURFACE
      ?auto_1052426 - SURFACE
      ?auto_1052427 - SURFACE
      ?auto_1052428 - SURFACE
      ?auto_1052429 - SURFACE
      ?auto_1052430 - SURFACE
    )
    :vars
    (
      ?auto_1052433 - HOIST
      ?auto_1052436 - PLACE
      ?auto_1052434 - PLACE
      ?auto_1052432 - HOIST
      ?auto_1052431 - SURFACE
      ?auto_1052435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052433 ?auto_1052436 ) ( IS-CRATE ?auto_1052430 ) ( not ( = ?auto_1052429 ?auto_1052430 ) ) ( not ( = ?auto_1052428 ?auto_1052429 ) ) ( not ( = ?auto_1052428 ?auto_1052430 ) ) ( not ( = ?auto_1052434 ?auto_1052436 ) ) ( HOIST-AT ?auto_1052432 ?auto_1052434 ) ( not ( = ?auto_1052433 ?auto_1052432 ) ) ( SURFACE-AT ?auto_1052430 ?auto_1052434 ) ( ON ?auto_1052430 ?auto_1052431 ) ( CLEAR ?auto_1052430 ) ( not ( = ?auto_1052429 ?auto_1052431 ) ) ( not ( = ?auto_1052430 ?auto_1052431 ) ) ( not ( = ?auto_1052428 ?auto_1052431 ) ) ( SURFACE-AT ?auto_1052428 ?auto_1052436 ) ( CLEAR ?auto_1052428 ) ( IS-CRATE ?auto_1052429 ) ( AVAILABLE ?auto_1052433 ) ( TRUCK-AT ?auto_1052435 ?auto_1052434 ) ( LIFTING ?auto_1052432 ?auto_1052429 ) ( ON ?auto_1052426 ?auto_1052425 ) ( ON ?auto_1052427 ?auto_1052426 ) ( ON ?auto_1052428 ?auto_1052427 ) ( not ( = ?auto_1052425 ?auto_1052426 ) ) ( not ( = ?auto_1052425 ?auto_1052427 ) ) ( not ( = ?auto_1052425 ?auto_1052428 ) ) ( not ( = ?auto_1052425 ?auto_1052429 ) ) ( not ( = ?auto_1052425 ?auto_1052430 ) ) ( not ( = ?auto_1052425 ?auto_1052431 ) ) ( not ( = ?auto_1052426 ?auto_1052427 ) ) ( not ( = ?auto_1052426 ?auto_1052428 ) ) ( not ( = ?auto_1052426 ?auto_1052429 ) ) ( not ( = ?auto_1052426 ?auto_1052430 ) ) ( not ( = ?auto_1052426 ?auto_1052431 ) ) ( not ( = ?auto_1052427 ?auto_1052428 ) ) ( not ( = ?auto_1052427 ?auto_1052429 ) ) ( not ( = ?auto_1052427 ?auto_1052430 ) ) ( not ( = ?auto_1052427 ?auto_1052431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052428 ?auto_1052429 ?auto_1052430 )
      ( MAKE-5CRATE-VERIFY ?auto_1052425 ?auto_1052426 ?auto_1052427 ?auto_1052428 ?auto_1052429 ?auto_1052430 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1052437 - SURFACE
      ?auto_1052438 - SURFACE
      ?auto_1052439 - SURFACE
      ?auto_1052440 - SURFACE
      ?auto_1052441 - SURFACE
      ?auto_1052442 - SURFACE
      ?auto_1052443 - SURFACE
    )
    :vars
    (
      ?auto_1052446 - HOIST
      ?auto_1052449 - PLACE
      ?auto_1052447 - PLACE
      ?auto_1052445 - HOIST
      ?auto_1052444 - SURFACE
      ?auto_1052448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052446 ?auto_1052449 ) ( IS-CRATE ?auto_1052443 ) ( not ( = ?auto_1052442 ?auto_1052443 ) ) ( not ( = ?auto_1052441 ?auto_1052442 ) ) ( not ( = ?auto_1052441 ?auto_1052443 ) ) ( not ( = ?auto_1052447 ?auto_1052449 ) ) ( HOIST-AT ?auto_1052445 ?auto_1052447 ) ( not ( = ?auto_1052446 ?auto_1052445 ) ) ( SURFACE-AT ?auto_1052443 ?auto_1052447 ) ( ON ?auto_1052443 ?auto_1052444 ) ( CLEAR ?auto_1052443 ) ( not ( = ?auto_1052442 ?auto_1052444 ) ) ( not ( = ?auto_1052443 ?auto_1052444 ) ) ( not ( = ?auto_1052441 ?auto_1052444 ) ) ( SURFACE-AT ?auto_1052441 ?auto_1052449 ) ( CLEAR ?auto_1052441 ) ( IS-CRATE ?auto_1052442 ) ( AVAILABLE ?auto_1052446 ) ( TRUCK-AT ?auto_1052448 ?auto_1052447 ) ( LIFTING ?auto_1052445 ?auto_1052442 ) ( ON ?auto_1052438 ?auto_1052437 ) ( ON ?auto_1052439 ?auto_1052438 ) ( ON ?auto_1052440 ?auto_1052439 ) ( ON ?auto_1052441 ?auto_1052440 ) ( not ( = ?auto_1052437 ?auto_1052438 ) ) ( not ( = ?auto_1052437 ?auto_1052439 ) ) ( not ( = ?auto_1052437 ?auto_1052440 ) ) ( not ( = ?auto_1052437 ?auto_1052441 ) ) ( not ( = ?auto_1052437 ?auto_1052442 ) ) ( not ( = ?auto_1052437 ?auto_1052443 ) ) ( not ( = ?auto_1052437 ?auto_1052444 ) ) ( not ( = ?auto_1052438 ?auto_1052439 ) ) ( not ( = ?auto_1052438 ?auto_1052440 ) ) ( not ( = ?auto_1052438 ?auto_1052441 ) ) ( not ( = ?auto_1052438 ?auto_1052442 ) ) ( not ( = ?auto_1052438 ?auto_1052443 ) ) ( not ( = ?auto_1052438 ?auto_1052444 ) ) ( not ( = ?auto_1052439 ?auto_1052440 ) ) ( not ( = ?auto_1052439 ?auto_1052441 ) ) ( not ( = ?auto_1052439 ?auto_1052442 ) ) ( not ( = ?auto_1052439 ?auto_1052443 ) ) ( not ( = ?auto_1052439 ?auto_1052444 ) ) ( not ( = ?auto_1052440 ?auto_1052441 ) ) ( not ( = ?auto_1052440 ?auto_1052442 ) ) ( not ( = ?auto_1052440 ?auto_1052443 ) ) ( not ( = ?auto_1052440 ?auto_1052444 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052441 ?auto_1052442 ?auto_1052443 )
      ( MAKE-6CRATE-VERIFY ?auto_1052437 ?auto_1052438 ?auto_1052439 ?auto_1052440 ?auto_1052441 ?auto_1052442 ?auto_1052443 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1052450 - SURFACE
      ?auto_1052451 - SURFACE
      ?auto_1052452 - SURFACE
      ?auto_1052453 - SURFACE
      ?auto_1052454 - SURFACE
      ?auto_1052455 - SURFACE
      ?auto_1052456 - SURFACE
      ?auto_1052457 - SURFACE
    )
    :vars
    (
      ?auto_1052460 - HOIST
      ?auto_1052463 - PLACE
      ?auto_1052461 - PLACE
      ?auto_1052459 - HOIST
      ?auto_1052458 - SURFACE
      ?auto_1052462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052460 ?auto_1052463 ) ( IS-CRATE ?auto_1052457 ) ( not ( = ?auto_1052456 ?auto_1052457 ) ) ( not ( = ?auto_1052455 ?auto_1052456 ) ) ( not ( = ?auto_1052455 ?auto_1052457 ) ) ( not ( = ?auto_1052461 ?auto_1052463 ) ) ( HOIST-AT ?auto_1052459 ?auto_1052461 ) ( not ( = ?auto_1052460 ?auto_1052459 ) ) ( SURFACE-AT ?auto_1052457 ?auto_1052461 ) ( ON ?auto_1052457 ?auto_1052458 ) ( CLEAR ?auto_1052457 ) ( not ( = ?auto_1052456 ?auto_1052458 ) ) ( not ( = ?auto_1052457 ?auto_1052458 ) ) ( not ( = ?auto_1052455 ?auto_1052458 ) ) ( SURFACE-AT ?auto_1052455 ?auto_1052463 ) ( CLEAR ?auto_1052455 ) ( IS-CRATE ?auto_1052456 ) ( AVAILABLE ?auto_1052460 ) ( TRUCK-AT ?auto_1052462 ?auto_1052461 ) ( LIFTING ?auto_1052459 ?auto_1052456 ) ( ON ?auto_1052451 ?auto_1052450 ) ( ON ?auto_1052452 ?auto_1052451 ) ( ON ?auto_1052453 ?auto_1052452 ) ( ON ?auto_1052454 ?auto_1052453 ) ( ON ?auto_1052455 ?auto_1052454 ) ( not ( = ?auto_1052450 ?auto_1052451 ) ) ( not ( = ?auto_1052450 ?auto_1052452 ) ) ( not ( = ?auto_1052450 ?auto_1052453 ) ) ( not ( = ?auto_1052450 ?auto_1052454 ) ) ( not ( = ?auto_1052450 ?auto_1052455 ) ) ( not ( = ?auto_1052450 ?auto_1052456 ) ) ( not ( = ?auto_1052450 ?auto_1052457 ) ) ( not ( = ?auto_1052450 ?auto_1052458 ) ) ( not ( = ?auto_1052451 ?auto_1052452 ) ) ( not ( = ?auto_1052451 ?auto_1052453 ) ) ( not ( = ?auto_1052451 ?auto_1052454 ) ) ( not ( = ?auto_1052451 ?auto_1052455 ) ) ( not ( = ?auto_1052451 ?auto_1052456 ) ) ( not ( = ?auto_1052451 ?auto_1052457 ) ) ( not ( = ?auto_1052451 ?auto_1052458 ) ) ( not ( = ?auto_1052452 ?auto_1052453 ) ) ( not ( = ?auto_1052452 ?auto_1052454 ) ) ( not ( = ?auto_1052452 ?auto_1052455 ) ) ( not ( = ?auto_1052452 ?auto_1052456 ) ) ( not ( = ?auto_1052452 ?auto_1052457 ) ) ( not ( = ?auto_1052452 ?auto_1052458 ) ) ( not ( = ?auto_1052453 ?auto_1052454 ) ) ( not ( = ?auto_1052453 ?auto_1052455 ) ) ( not ( = ?auto_1052453 ?auto_1052456 ) ) ( not ( = ?auto_1052453 ?auto_1052457 ) ) ( not ( = ?auto_1052453 ?auto_1052458 ) ) ( not ( = ?auto_1052454 ?auto_1052455 ) ) ( not ( = ?auto_1052454 ?auto_1052456 ) ) ( not ( = ?auto_1052454 ?auto_1052457 ) ) ( not ( = ?auto_1052454 ?auto_1052458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052455 ?auto_1052456 ?auto_1052457 )
      ( MAKE-7CRATE-VERIFY ?auto_1052450 ?auto_1052451 ?auto_1052452 ?auto_1052453 ?auto_1052454 ?auto_1052455 ?auto_1052456 ?auto_1052457 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052464 - SURFACE
      ?auto_1052465 - SURFACE
      ?auto_1052466 - SURFACE
      ?auto_1052467 - SURFACE
      ?auto_1052468 - SURFACE
      ?auto_1052469 - SURFACE
      ?auto_1052470 - SURFACE
      ?auto_1052471 - SURFACE
      ?auto_1052472 - SURFACE
    )
    :vars
    (
      ?auto_1052475 - HOIST
      ?auto_1052478 - PLACE
      ?auto_1052476 - PLACE
      ?auto_1052474 - HOIST
      ?auto_1052473 - SURFACE
      ?auto_1052477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052475 ?auto_1052478 ) ( IS-CRATE ?auto_1052472 ) ( not ( = ?auto_1052471 ?auto_1052472 ) ) ( not ( = ?auto_1052470 ?auto_1052471 ) ) ( not ( = ?auto_1052470 ?auto_1052472 ) ) ( not ( = ?auto_1052476 ?auto_1052478 ) ) ( HOIST-AT ?auto_1052474 ?auto_1052476 ) ( not ( = ?auto_1052475 ?auto_1052474 ) ) ( SURFACE-AT ?auto_1052472 ?auto_1052476 ) ( ON ?auto_1052472 ?auto_1052473 ) ( CLEAR ?auto_1052472 ) ( not ( = ?auto_1052471 ?auto_1052473 ) ) ( not ( = ?auto_1052472 ?auto_1052473 ) ) ( not ( = ?auto_1052470 ?auto_1052473 ) ) ( SURFACE-AT ?auto_1052470 ?auto_1052478 ) ( CLEAR ?auto_1052470 ) ( IS-CRATE ?auto_1052471 ) ( AVAILABLE ?auto_1052475 ) ( TRUCK-AT ?auto_1052477 ?auto_1052476 ) ( LIFTING ?auto_1052474 ?auto_1052471 ) ( ON ?auto_1052465 ?auto_1052464 ) ( ON ?auto_1052466 ?auto_1052465 ) ( ON ?auto_1052467 ?auto_1052466 ) ( ON ?auto_1052468 ?auto_1052467 ) ( ON ?auto_1052469 ?auto_1052468 ) ( ON ?auto_1052470 ?auto_1052469 ) ( not ( = ?auto_1052464 ?auto_1052465 ) ) ( not ( = ?auto_1052464 ?auto_1052466 ) ) ( not ( = ?auto_1052464 ?auto_1052467 ) ) ( not ( = ?auto_1052464 ?auto_1052468 ) ) ( not ( = ?auto_1052464 ?auto_1052469 ) ) ( not ( = ?auto_1052464 ?auto_1052470 ) ) ( not ( = ?auto_1052464 ?auto_1052471 ) ) ( not ( = ?auto_1052464 ?auto_1052472 ) ) ( not ( = ?auto_1052464 ?auto_1052473 ) ) ( not ( = ?auto_1052465 ?auto_1052466 ) ) ( not ( = ?auto_1052465 ?auto_1052467 ) ) ( not ( = ?auto_1052465 ?auto_1052468 ) ) ( not ( = ?auto_1052465 ?auto_1052469 ) ) ( not ( = ?auto_1052465 ?auto_1052470 ) ) ( not ( = ?auto_1052465 ?auto_1052471 ) ) ( not ( = ?auto_1052465 ?auto_1052472 ) ) ( not ( = ?auto_1052465 ?auto_1052473 ) ) ( not ( = ?auto_1052466 ?auto_1052467 ) ) ( not ( = ?auto_1052466 ?auto_1052468 ) ) ( not ( = ?auto_1052466 ?auto_1052469 ) ) ( not ( = ?auto_1052466 ?auto_1052470 ) ) ( not ( = ?auto_1052466 ?auto_1052471 ) ) ( not ( = ?auto_1052466 ?auto_1052472 ) ) ( not ( = ?auto_1052466 ?auto_1052473 ) ) ( not ( = ?auto_1052467 ?auto_1052468 ) ) ( not ( = ?auto_1052467 ?auto_1052469 ) ) ( not ( = ?auto_1052467 ?auto_1052470 ) ) ( not ( = ?auto_1052467 ?auto_1052471 ) ) ( not ( = ?auto_1052467 ?auto_1052472 ) ) ( not ( = ?auto_1052467 ?auto_1052473 ) ) ( not ( = ?auto_1052468 ?auto_1052469 ) ) ( not ( = ?auto_1052468 ?auto_1052470 ) ) ( not ( = ?auto_1052468 ?auto_1052471 ) ) ( not ( = ?auto_1052468 ?auto_1052472 ) ) ( not ( = ?auto_1052468 ?auto_1052473 ) ) ( not ( = ?auto_1052469 ?auto_1052470 ) ) ( not ( = ?auto_1052469 ?auto_1052471 ) ) ( not ( = ?auto_1052469 ?auto_1052472 ) ) ( not ( = ?auto_1052469 ?auto_1052473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052470 ?auto_1052471 ?auto_1052472 )
      ( MAKE-8CRATE-VERIFY ?auto_1052464 ?auto_1052465 ?auto_1052466 ?auto_1052467 ?auto_1052468 ?auto_1052469 ?auto_1052470 ?auto_1052471 ?auto_1052472 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1052479 - SURFACE
      ?auto_1052480 - SURFACE
    )
    :vars
    (
      ?auto_1052484 - HOIST
      ?auto_1052487 - PLACE
      ?auto_1052481 - SURFACE
      ?auto_1052485 - PLACE
      ?auto_1052483 - HOIST
      ?auto_1052482 - SURFACE
      ?auto_1052486 - TRUCK
      ?auto_1052488 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052484 ?auto_1052487 ) ( IS-CRATE ?auto_1052480 ) ( not ( = ?auto_1052479 ?auto_1052480 ) ) ( not ( = ?auto_1052481 ?auto_1052479 ) ) ( not ( = ?auto_1052481 ?auto_1052480 ) ) ( not ( = ?auto_1052485 ?auto_1052487 ) ) ( HOIST-AT ?auto_1052483 ?auto_1052485 ) ( not ( = ?auto_1052484 ?auto_1052483 ) ) ( SURFACE-AT ?auto_1052480 ?auto_1052485 ) ( ON ?auto_1052480 ?auto_1052482 ) ( CLEAR ?auto_1052480 ) ( not ( = ?auto_1052479 ?auto_1052482 ) ) ( not ( = ?auto_1052480 ?auto_1052482 ) ) ( not ( = ?auto_1052481 ?auto_1052482 ) ) ( SURFACE-AT ?auto_1052481 ?auto_1052487 ) ( CLEAR ?auto_1052481 ) ( IS-CRATE ?auto_1052479 ) ( AVAILABLE ?auto_1052484 ) ( TRUCK-AT ?auto_1052486 ?auto_1052485 ) ( AVAILABLE ?auto_1052483 ) ( SURFACE-AT ?auto_1052479 ?auto_1052485 ) ( ON ?auto_1052479 ?auto_1052488 ) ( CLEAR ?auto_1052479 ) ( not ( = ?auto_1052479 ?auto_1052488 ) ) ( not ( = ?auto_1052480 ?auto_1052488 ) ) ( not ( = ?auto_1052481 ?auto_1052488 ) ) ( not ( = ?auto_1052482 ?auto_1052488 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1052483 ?auto_1052479 ?auto_1052488 ?auto_1052485 )
      ( MAKE-2CRATE ?auto_1052481 ?auto_1052479 ?auto_1052480 )
      ( MAKE-1CRATE-VERIFY ?auto_1052479 ?auto_1052480 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1052489 - SURFACE
      ?auto_1052490 - SURFACE
      ?auto_1052491 - SURFACE
    )
    :vars
    (
      ?auto_1052496 - HOIST
      ?auto_1052495 - PLACE
      ?auto_1052497 - PLACE
      ?auto_1052492 - HOIST
      ?auto_1052493 - SURFACE
      ?auto_1052494 - TRUCK
      ?auto_1052498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052496 ?auto_1052495 ) ( IS-CRATE ?auto_1052491 ) ( not ( = ?auto_1052490 ?auto_1052491 ) ) ( not ( = ?auto_1052489 ?auto_1052490 ) ) ( not ( = ?auto_1052489 ?auto_1052491 ) ) ( not ( = ?auto_1052497 ?auto_1052495 ) ) ( HOIST-AT ?auto_1052492 ?auto_1052497 ) ( not ( = ?auto_1052496 ?auto_1052492 ) ) ( SURFACE-AT ?auto_1052491 ?auto_1052497 ) ( ON ?auto_1052491 ?auto_1052493 ) ( CLEAR ?auto_1052491 ) ( not ( = ?auto_1052490 ?auto_1052493 ) ) ( not ( = ?auto_1052491 ?auto_1052493 ) ) ( not ( = ?auto_1052489 ?auto_1052493 ) ) ( SURFACE-AT ?auto_1052489 ?auto_1052495 ) ( CLEAR ?auto_1052489 ) ( IS-CRATE ?auto_1052490 ) ( AVAILABLE ?auto_1052496 ) ( TRUCK-AT ?auto_1052494 ?auto_1052497 ) ( AVAILABLE ?auto_1052492 ) ( SURFACE-AT ?auto_1052490 ?auto_1052497 ) ( ON ?auto_1052490 ?auto_1052498 ) ( CLEAR ?auto_1052490 ) ( not ( = ?auto_1052490 ?auto_1052498 ) ) ( not ( = ?auto_1052491 ?auto_1052498 ) ) ( not ( = ?auto_1052489 ?auto_1052498 ) ) ( not ( = ?auto_1052493 ?auto_1052498 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1052490 ?auto_1052491 )
      ( MAKE-2CRATE-VERIFY ?auto_1052489 ?auto_1052490 ?auto_1052491 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1052499 - SURFACE
      ?auto_1052500 - SURFACE
      ?auto_1052501 - SURFACE
      ?auto_1052502 - SURFACE
    )
    :vars
    (
      ?auto_1052508 - HOIST
      ?auto_1052505 - PLACE
      ?auto_1052507 - PLACE
      ?auto_1052504 - HOIST
      ?auto_1052503 - SURFACE
      ?auto_1052506 - TRUCK
      ?auto_1052509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052508 ?auto_1052505 ) ( IS-CRATE ?auto_1052502 ) ( not ( = ?auto_1052501 ?auto_1052502 ) ) ( not ( = ?auto_1052500 ?auto_1052501 ) ) ( not ( = ?auto_1052500 ?auto_1052502 ) ) ( not ( = ?auto_1052507 ?auto_1052505 ) ) ( HOIST-AT ?auto_1052504 ?auto_1052507 ) ( not ( = ?auto_1052508 ?auto_1052504 ) ) ( SURFACE-AT ?auto_1052502 ?auto_1052507 ) ( ON ?auto_1052502 ?auto_1052503 ) ( CLEAR ?auto_1052502 ) ( not ( = ?auto_1052501 ?auto_1052503 ) ) ( not ( = ?auto_1052502 ?auto_1052503 ) ) ( not ( = ?auto_1052500 ?auto_1052503 ) ) ( SURFACE-AT ?auto_1052500 ?auto_1052505 ) ( CLEAR ?auto_1052500 ) ( IS-CRATE ?auto_1052501 ) ( AVAILABLE ?auto_1052508 ) ( TRUCK-AT ?auto_1052506 ?auto_1052507 ) ( AVAILABLE ?auto_1052504 ) ( SURFACE-AT ?auto_1052501 ?auto_1052507 ) ( ON ?auto_1052501 ?auto_1052509 ) ( CLEAR ?auto_1052501 ) ( not ( = ?auto_1052501 ?auto_1052509 ) ) ( not ( = ?auto_1052502 ?auto_1052509 ) ) ( not ( = ?auto_1052500 ?auto_1052509 ) ) ( not ( = ?auto_1052503 ?auto_1052509 ) ) ( ON ?auto_1052500 ?auto_1052499 ) ( not ( = ?auto_1052499 ?auto_1052500 ) ) ( not ( = ?auto_1052499 ?auto_1052501 ) ) ( not ( = ?auto_1052499 ?auto_1052502 ) ) ( not ( = ?auto_1052499 ?auto_1052503 ) ) ( not ( = ?auto_1052499 ?auto_1052509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052500 ?auto_1052501 ?auto_1052502 )
      ( MAKE-3CRATE-VERIFY ?auto_1052499 ?auto_1052500 ?auto_1052501 ?auto_1052502 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1052510 - SURFACE
      ?auto_1052511 - SURFACE
      ?auto_1052512 - SURFACE
      ?auto_1052513 - SURFACE
      ?auto_1052514 - SURFACE
    )
    :vars
    (
      ?auto_1052520 - HOIST
      ?auto_1052517 - PLACE
      ?auto_1052519 - PLACE
      ?auto_1052516 - HOIST
      ?auto_1052515 - SURFACE
      ?auto_1052518 - TRUCK
      ?auto_1052521 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052520 ?auto_1052517 ) ( IS-CRATE ?auto_1052514 ) ( not ( = ?auto_1052513 ?auto_1052514 ) ) ( not ( = ?auto_1052512 ?auto_1052513 ) ) ( not ( = ?auto_1052512 ?auto_1052514 ) ) ( not ( = ?auto_1052519 ?auto_1052517 ) ) ( HOIST-AT ?auto_1052516 ?auto_1052519 ) ( not ( = ?auto_1052520 ?auto_1052516 ) ) ( SURFACE-AT ?auto_1052514 ?auto_1052519 ) ( ON ?auto_1052514 ?auto_1052515 ) ( CLEAR ?auto_1052514 ) ( not ( = ?auto_1052513 ?auto_1052515 ) ) ( not ( = ?auto_1052514 ?auto_1052515 ) ) ( not ( = ?auto_1052512 ?auto_1052515 ) ) ( SURFACE-AT ?auto_1052512 ?auto_1052517 ) ( CLEAR ?auto_1052512 ) ( IS-CRATE ?auto_1052513 ) ( AVAILABLE ?auto_1052520 ) ( TRUCK-AT ?auto_1052518 ?auto_1052519 ) ( AVAILABLE ?auto_1052516 ) ( SURFACE-AT ?auto_1052513 ?auto_1052519 ) ( ON ?auto_1052513 ?auto_1052521 ) ( CLEAR ?auto_1052513 ) ( not ( = ?auto_1052513 ?auto_1052521 ) ) ( not ( = ?auto_1052514 ?auto_1052521 ) ) ( not ( = ?auto_1052512 ?auto_1052521 ) ) ( not ( = ?auto_1052515 ?auto_1052521 ) ) ( ON ?auto_1052511 ?auto_1052510 ) ( ON ?auto_1052512 ?auto_1052511 ) ( not ( = ?auto_1052510 ?auto_1052511 ) ) ( not ( = ?auto_1052510 ?auto_1052512 ) ) ( not ( = ?auto_1052510 ?auto_1052513 ) ) ( not ( = ?auto_1052510 ?auto_1052514 ) ) ( not ( = ?auto_1052510 ?auto_1052515 ) ) ( not ( = ?auto_1052510 ?auto_1052521 ) ) ( not ( = ?auto_1052511 ?auto_1052512 ) ) ( not ( = ?auto_1052511 ?auto_1052513 ) ) ( not ( = ?auto_1052511 ?auto_1052514 ) ) ( not ( = ?auto_1052511 ?auto_1052515 ) ) ( not ( = ?auto_1052511 ?auto_1052521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052512 ?auto_1052513 ?auto_1052514 )
      ( MAKE-4CRATE-VERIFY ?auto_1052510 ?auto_1052511 ?auto_1052512 ?auto_1052513 ?auto_1052514 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1052522 - SURFACE
      ?auto_1052523 - SURFACE
      ?auto_1052524 - SURFACE
      ?auto_1052525 - SURFACE
      ?auto_1052526 - SURFACE
      ?auto_1052527 - SURFACE
    )
    :vars
    (
      ?auto_1052533 - HOIST
      ?auto_1052530 - PLACE
      ?auto_1052532 - PLACE
      ?auto_1052529 - HOIST
      ?auto_1052528 - SURFACE
      ?auto_1052531 - TRUCK
      ?auto_1052534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052533 ?auto_1052530 ) ( IS-CRATE ?auto_1052527 ) ( not ( = ?auto_1052526 ?auto_1052527 ) ) ( not ( = ?auto_1052525 ?auto_1052526 ) ) ( not ( = ?auto_1052525 ?auto_1052527 ) ) ( not ( = ?auto_1052532 ?auto_1052530 ) ) ( HOIST-AT ?auto_1052529 ?auto_1052532 ) ( not ( = ?auto_1052533 ?auto_1052529 ) ) ( SURFACE-AT ?auto_1052527 ?auto_1052532 ) ( ON ?auto_1052527 ?auto_1052528 ) ( CLEAR ?auto_1052527 ) ( not ( = ?auto_1052526 ?auto_1052528 ) ) ( not ( = ?auto_1052527 ?auto_1052528 ) ) ( not ( = ?auto_1052525 ?auto_1052528 ) ) ( SURFACE-AT ?auto_1052525 ?auto_1052530 ) ( CLEAR ?auto_1052525 ) ( IS-CRATE ?auto_1052526 ) ( AVAILABLE ?auto_1052533 ) ( TRUCK-AT ?auto_1052531 ?auto_1052532 ) ( AVAILABLE ?auto_1052529 ) ( SURFACE-AT ?auto_1052526 ?auto_1052532 ) ( ON ?auto_1052526 ?auto_1052534 ) ( CLEAR ?auto_1052526 ) ( not ( = ?auto_1052526 ?auto_1052534 ) ) ( not ( = ?auto_1052527 ?auto_1052534 ) ) ( not ( = ?auto_1052525 ?auto_1052534 ) ) ( not ( = ?auto_1052528 ?auto_1052534 ) ) ( ON ?auto_1052523 ?auto_1052522 ) ( ON ?auto_1052524 ?auto_1052523 ) ( ON ?auto_1052525 ?auto_1052524 ) ( not ( = ?auto_1052522 ?auto_1052523 ) ) ( not ( = ?auto_1052522 ?auto_1052524 ) ) ( not ( = ?auto_1052522 ?auto_1052525 ) ) ( not ( = ?auto_1052522 ?auto_1052526 ) ) ( not ( = ?auto_1052522 ?auto_1052527 ) ) ( not ( = ?auto_1052522 ?auto_1052528 ) ) ( not ( = ?auto_1052522 ?auto_1052534 ) ) ( not ( = ?auto_1052523 ?auto_1052524 ) ) ( not ( = ?auto_1052523 ?auto_1052525 ) ) ( not ( = ?auto_1052523 ?auto_1052526 ) ) ( not ( = ?auto_1052523 ?auto_1052527 ) ) ( not ( = ?auto_1052523 ?auto_1052528 ) ) ( not ( = ?auto_1052523 ?auto_1052534 ) ) ( not ( = ?auto_1052524 ?auto_1052525 ) ) ( not ( = ?auto_1052524 ?auto_1052526 ) ) ( not ( = ?auto_1052524 ?auto_1052527 ) ) ( not ( = ?auto_1052524 ?auto_1052528 ) ) ( not ( = ?auto_1052524 ?auto_1052534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052525 ?auto_1052526 ?auto_1052527 )
      ( MAKE-5CRATE-VERIFY ?auto_1052522 ?auto_1052523 ?auto_1052524 ?auto_1052525 ?auto_1052526 ?auto_1052527 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1052535 - SURFACE
      ?auto_1052536 - SURFACE
      ?auto_1052537 - SURFACE
      ?auto_1052538 - SURFACE
      ?auto_1052539 - SURFACE
      ?auto_1052540 - SURFACE
      ?auto_1052541 - SURFACE
    )
    :vars
    (
      ?auto_1052547 - HOIST
      ?auto_1052544 - PLACE
      ?auto_1052546 - PLACE
      ?auto_1052543 - HOIST
      ?auto_1052542 - SURFACE
      ?auto_1052545 - TRUCK
      ?auto_1052548 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052547 ?auto_1052544 ) ( IS-CRATE ?auto_1052541 ) ( not ( = ?auto_1052540 ?auto_1052541 ) ) ( not ( = ?auto_1052539 ?auto_1052540 ) ) ( not ( = ?auto_1052539 ?auto_1052541 ) ) ( not ( = ?auto_1052546 ?auto_1052544 ) ) ( HOIST-AT ?auto_1052543 ?auto_1052546 ) ( not ( = ?auto_1052547 ?auto_1052543 ) ) ( SURFACE-AT ?auto_1052541 ?auto_1052546 ) ( ON ?auto_1052541 ?auto_1052542 ) ( CLEAR ?auto_1052541 ) ( not ( = ?auto_1052540 ?auto_1052542 ) ) ( not ( = ?auto_1052541 ?auto_1052542 ) ) ( not ( = ?auto_1052539 ?auto_1052542 ) ) ( SURFACE-AT ?auto_1052539 ?auto_1052544 ) ( CLEAR ?auto_1052539 ) ( IS-CRATE ?auto_1052540 ) ( AVAILABLE ?auto_1052547 ) ( TRUCK-AT ?auto_1052545 ?auto_1052546 ) ( AVAILABLE ?auto_1052543 ) ( SURFACE-AT ?auto_1052540 ?auto_1052546 ) ( ON ?auto_1052540 ?auto_1052548 ) ( CLEAR ?auto_1052540 ) ( not ( = ?auto_1052540 ?auto_1052548 ) ) ( not ( = ?auto_1052541 ?auto_1052548 ) ) ( not ( = ?auto_1052539 ?auto_1052548 ) ) ( not ( = ?auto_1052542 ?auto_1052548 ) ) ( ON ?auto_1052536 ?auto_1052535 ) ( ON ?auto_1052537 ?auto_1052536 ) ( ON ?auto_1052538 ?auto_1052537 ) ( ON ?auto_1052539 ?auto_1052538 ) ( not ( = ?auto_1052535 ?auto_1052536 ) ) ( not ( = ?auto_1052535 ?auto_1052537 ) ) ( not ( = ?auto_1052535 ?auto_1052538 ) ) ( not ( = ?auto_1052535 ?auto_1052539 ) ) ( not ( = ?auto_1052535 ?auto_1052540 ) ) ( not ( = ?auto_1052535 ?auto_1052541 ) ) ( not ( = ?auto_1052535 ?auto_1052542 ) ) ( not ( = ?auto_1052535 ?auto_1052548 ) ) ( not ( = ?auto_1052536 ?auto_1052537 ) ) ( not ( = ?auto_1052536 ?auto_1052538 ) ) ( not ( = ?auto_1052536 ?auto_1052539 ) ) ( not ( = ?auto_1052536 ?auto_1052540 ) ) ( not ( = ?auto_1052536 ?auto_1052541 ) ) ( not ( = ?auto_1052536 ?auto_1052542 ) ) ( not ( = ?auto_1052536 ?auto_1052548 ) ) ( not ( = ?auto_1052537 ?auto_1052538 ) ) ( not ( = ?auto_1052537 ?auto_1052539 ) ) ( not ( = ?auto_1052537 ?auto_1052540 ) ) ( not ( = ?auto_1052537 ?auto_1052541 ) ) ( not ( = ?auto_1052537 ?auto_1052542 ) ) ( not ( = ?auto_1052537 ?auto_1052548 ) ) ( not ( = ?auto_1052538 ?auto_1052539 ) ) ( not ( = ?auto_1052538 ?auto_1052540 ) ) ( not ( = ?auto_1052538 ?auto_1052541 ) ) ( not ( = ?auto_1052538 ?auto_1052542 ) ) ( not ( = ?auto_1052538 ?auto_1052548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052539 ?auto_1052540 ?auto_1052541 )
      ( MAKE-6CRATE-VERIFY ?auto_1052535 ?auto_1052536 ?auto_1052537 ?auto_1052538 ?auto_1052539 ?auto_1052540 ?auto_1052541 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1052549 - SURFACE
      ?auto_1052550 - SURFACE
      ?auto_1052551 - SURFACE
      ?auto_1052552 - SURFACE
      ?auto_1052553 - SURFACE
      ?auto_1052554 - SURFACE
      ?auto_1052555 - SURFACE
      ?auto_1052556 - SURFACE
    )
    :vars
    (
      ?auto_1052562 - HOIST
      ?auto_1052559 - PLACE
      ?auto_1052561 - PLACE
      ?auto_1052558 - HOIST
      ?auto_1052557 - SURFACE
      ?auto_1052560 - TRUCK
      ?auto_1052563 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052562 ?auto_1052559 ) ( IS-CRATE ?auto_1052556 ) ( not ( = ?auto_1052555 ?auto_1052556 ) ) ( not ( = ?auto_1052554 ?auto_1052555 ) ) ( not ( = ?auto_1052554 ?auto_1052556 ) ) ( not ( = ?auto_1052561 ?auto_1052559 ) ) ( HOIST-AT ?auto_1052558 ?auto_1052561 ) ( not ( = ?auto_1052562 ?auto_1052558 ) ) ( SURFACE-AT ?auto_1052556 ?auto_1052561 ) ( ON ?auto_1052556 ?auto_1052557 ) ( CLEAR ?auto_1052556 ) ( not ( = ?auto_1052555 ?auto_1052557 ) ) ( not ( = ?auto_1052556 ?auto_1052557 ) ) ( not ( = ?auto_1052554 ?auto_1052557 ) ) ( SURFACE-AT ?auto_1052554 ?auto_1052559 ) ( CLEAR ?auto_1052554 ) ( IS-CRATE ?auto_1052555 ) ( AVAILABLE ?auto_1052562 ) ( TRUCK-AT ?auto_1052560 ?auto_1052561 ) ( AVAILABLE ?auto_1052558 ) ( SURFACE-AT ?auto_1052555 ?auto_1052561 ) ( ON ?auto_1052555 ?auto_1052563 ) ( CLEAR ?auto_1052555 ) ( not ( = ?auto_1052555 ?auto_1052563 ) ) ( not ( = ?auto_1052556 ?auto_1052563 ) ) ( not ( = ?auto_1052554 ?auto_1052563 ) ) ( not ( = ?auto_1052557 ?auto_1052563 ) ) ( ON ?auto_1052550 ?auto_1052549 ) ( ON ?auto_1052551 ?auto_1052550 ) ( ON ?auto_1052552 ?auto_1052551 ) ( ON ?auto_1052553 ?auto_1052552 ) ( ON ?auto_1052554 ?auto_1052553 ) ( not ( = ?auto_1052549 ?auto_1052550 ) ) ( not ( = ?auto_1052549 ?auto_1052551 ) ) ( not ( = ?auto_1052549 ?auto_1052552 ) ) ( not ( = ?auto_1052549 ?auto_1052553 ) ) ( not ( = ?auto_1052549 ?auto_1052554 ) ) ( not ( = ?auto_1052549 ?auto_1052555 ) ) ( not ( = ?auto_1052549 ?auto_1052556 ) ) ( not ( = ?auto_1052549 ?auto_1052557 ) ) ( not ( = ?auto_1052549 ?auto_1052563 ) ) ( not ( = ?auto_1052550 ?auto_1052551 ) ) ( not ( = ?auto_1052550 ?auto_1052552 ) ) ( not ( = ?auto_1052550 ?auto_1052553 ) ) ( not ( = ?auto_1052550 ?auto_1052554 ) ) ( not ( = ?auto_1052550 ?auto_1052555 ) ) ( not ( = ?auto_1052550 ?auto_1052556 ) ) ( not ( = ?auto_1052550 ?auto_1052557 ) ) ( not ( = ?auto_1052550 ?auto_1052563 ) ) ( not ( = ?auto_1052551 ?auto_1052552 ) ) ( not ( = ?auto_1052551 ?auto_1052553 ) ) ( not ( = ?auto_1052551 ?auto_1052554 ) ) ( not ( = ?auto_1052551 ?auto_1052555 ) ) ( not ( = ?auto_1052551 ?auto_1052556 ) ) ( not ( = ?auto_1052551 ?auto_1052557 ) ) ( not ( = ?auto_1052551 ?auto_1052563 ) ) ( not ( = ?auto_1052552 ?auto_1052553 ) ) ( not ( = ?auto_1052552 ?auto_1052554 ) ) ( not ( = ?auto_1052552 ?auto_1052555 ) ) ( not ( = ?auto_1052552 ?auto_1052556 ) ) ( not ( = ?auto_1052552 ?auto_1052557 ) ) ( not ( = ?auto_1052552 ?auto_1052563 ) ) ( not ( = ?auto_1052553 ?auto_1052554 ) ) ( not ( = ?auto_1052553 ?auto_1052555 ) ) ( not ( = ?auto_1052553 ?auto_1052556 ) ) ( not ( = ?auto_1052553 ?auto_1052557 ) ) ( not ( = ?auto_1052553 ?auto_1052563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052554 ?auto_1052555 ?auto_1052556 )
      ( MAKE-7CRATE-VERIFY ?auto_1052549 ?auto_1052550 ?auto_1052551 ?auto_1052552 ?auto_1052553 ?auto_1052554 ?auto_1052555 ?auto_1052556 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052564 - SURFACE
      ?auto_1052565 - SURFACE
      ?auto_1052566 - SURFACE
      ?auto_1052567 - SURFACE
      ?auto_1052568 - SURFACE
      ?auto_1052569 - SURFACE
      ?auto_1052570 - SURFACE
      ?auto_1052571 - SURFACE
      ?auto_1052572 - SURFACE
    )
    :vars
    (
      ?auto_1052578 - HOIST
      ?auto_1052575 - PLACE
      ?auto_1052577 - PLACE
      ?auto_1052574 - HOIST
      ?auto_1052573 - SURFACE
      ?auto_1052576 - TRUCK
      ?auto_1052579 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052578 ?auto_1052575 ) ( IS-CRATE ?auto_1052572 ) ( not ( = ?auto_1052571 ?auto_1052572 ) ) ( not ( = ?auto_1052570 ?auto_1052571 ) ) ( not ( = ?auto_1052570 ?auto_1052572 ) ) ( not ( = ?auto_1052577 ?auto_1052575 ) ) ( HOIST-AT ?auto_1052574 ?auto_1052577 ) ( not ( = ?auto_1052578 ?auto_1052574 ) ) ( SURFACE-AT ?auto_1052572 ?auto_1052577 ) ( ON ?auto_1052572 ?auto_1052573 ) ( CLEAR ?auto_1052572 ) ( not ( = ?auto_1052571 ?auto_1052573 ) ) ( not ( = ?auto_1052572 ?auto_1052573 ) ) ( not ( = ?auto_1052570 ?auto_1052573 ) ) ( SURFACE-AT ?auto_1052570 ?auto_1052575 ) ( CLEAR ?auto_1052570 ) ( IS-CRATE ?auto_1052571 ) ( AVAILABLE ?auto_1052578 ) ( TRUCK-AT ?auto_1052576 ?auto_1052577 ) ( AVAILABLE ?auto_1052574 ) ( SURFACE-AT ?auto_1052571 ?auto_1052577 ) ( ON ?auto_1052571 ?auto_1052579 ) ( CLEAR ?auto_1052571 ) ( not ( = ?auto_1052571 ?auto_1052579 ) ) ( not ( = ?auto_1052572 ?auto_1052579 ) ) ( not ( = ?auto_1052570 ?auto_1052579 ) ) ( not ( = ?auto_1052573 ?auto_1052579 ) ) ( ON ?auto_1052565 ?auto_1052564 ) ( ON ?auto_1052566 ?auto_1052565 ) ( ON ?auto_1052567 ?auto_1052566 ) ( ON ?auto_1052568 ?auto_1052567 ) ( ON ?auto_1052569 ?auto_1052568 ) ( ON ?auto_1052570 ?auto_1052569 ) ( not ( = ?auto_1052564 ?auto_1052565 ) ) ( not ( = ?auto_1052564 ?auto_1052566 ) ) ( not ( = ?auto_1052564 ?auto_1052567 ) ) ( not ( = ?auto_1052564 ?auto_1052568 ) ) ( not ( = ?auto_1052564 ?auto_1052569 ) ) ( not ( = ?auto_1052564 ?auto_1052570 ) ) ( not ( = ?auto_1052564 ?auto_1052571 ) ) ( not ( = ?auto_1052564 ?auto_1052572 ) ) ( not ( = ?auto_1052564 ?auto_1052573 ) ) ( not ( = ?auto_1052564 ?auto_1052579 ) ) ( not ( = ?auto_1052565 ?auto_1052566 ) ) ( not ( = ?auto_1052565 ?auto_1052567 ) ) ( not ( = ?auto_1052565 ?auto_1052568 ) ) ( not ( = ?auto_1052565 ?auto_1052569 ) ) ( not ( = ?auto_1052565 ?auto_1052570 ) ) ( not ( = ?auto_1052565 ?auto_1052571 ) ) ( not ( = ?auto_1052565 ?auto_1052572 ) ) ( not ( = ?auto_1052565 ?auto_1052573 ) ) ( not ( = ?auto_1052565 ?auto_1052579 ) ) ( not ( = ?auto_1052566 ?auto_1052567 ) ) ( not ( = ?auto_1052566 ?auto_1052568 ) ) ( not ( = ?auto_1052566 ?auto_1052569 ) ) ( not ( = ?auto_1052566 ?auto_1052570 ) ) ( not ( = ?auto_1052566 ?auto_1052571 ) ) ( not ( = ?auto_1052566 ?auto_1052572 ) ) ( not ( = ?auto_1052566 ?auto_1052573 ) ) ( not ( = ?auto_1052566 ?auto_1052579 ) ) ( not ( = ?auto_1052567 ?auto_1052568 ) ) ( not ( = ?auto_1052567 ?auto_1052569 ) ) ( not ( = ?auto_1052567 ?auto_1052570 ) ) ( not ( = ?auto_1052567 ?auto_1052571 ) ) ( not ( = ?auto_1052567 ?auto_1052572 ) ) ( not ( = ?auto_1052567 ?auto_1052573 ) ) ( not ( = ?auto_1052567 ?auto_1052579 ) ) ( not ( = ?auto_1052568 ?auto_1052569 ) ) ( not ( = ?auto_1052568 ?auto_1052570 ) ) ( not ( = ?auto_1052568 ?auto_1052571 ) ) ( not ( = ?auto_1052568 ?auto_1052572 ) ) ( not ( = ?auto_1052568 ?auto_1052573 ) ) ( not ( = ?auto_1052568 ?auto_1052579 ) ) ( not ( = ?auto_1052569 ?auto_1052570 ) ) ( not ( = ?auto_1052569 ?auto_1052571 ) ) ( not ( = ?auto_1052569 ?auto_1052572 ) ) ( not ( = ?auto_1052569 ?auto_1052573 ) ) ( not ( = ?auto_1052569 ?auto_1052579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052570 ?auto_1052571 ?auto_1052572 )
      ( MAKE-8CRATE-VERIFY ?auto_1052564 ?auto_1052565 ?auto_1052566 ?auto_1052567 ?auto_1052568 ?auto_1052569 ?auto_1052570 ?auto_1052571 ?auto_1052572 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1052580 - SURFACE
      ?auto_1052581 - SURFACE
    )
    :vars
    (
      ?auto_1052588 - HOIST
      ?auto_1052585 - PLACE
      ?auto_1052584 - SURFACE
      ?auto_1052587 - PLACE
      ?auto_1052583 - HOIST
      ?auto_1052582 - SURFACE
      ?auto_1052589 - SURFACE
      ?auto_1052586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052588 ?auto_1052585 ) ( IS-CRATE ?auto_1052581 ) ( not ( = ?auto_1052580 ?auto_1052581 ) ) ( not ( = ?auto_1052584 ?auto_1052580 ) ) ( not ( = ?auto_1052584 ?auto_1052581 ) ) ( not ( = ?auto_1052587 ?auto_1052585 ) ) ( HOIST-AT ?auto_1052583 ?auto_1052587 ) ( not ( = ?auto_1052588 ?auto_1052583 ) ) ( SURFACE-AT ?auto_1052581 ?auto_1052587 ) ( ON ?auto_1052581 ?auto_1052582 ) ( CLEAR ?auto_1052581 ) ( not ( = ?auto_1052580 ?auto_1052582 ) ) ( not ( = ?auto_1052581 ?auto_1052582 ) ) ( not ( = ?auto_1052584 ?auto_1052582 ) ) ( SURFACE-AT ?auto_1052584 ?auto_1052585 ) ( CLEAR ?auto_1052584 ) ( IS-CRATE ?auto_1052580 ) ( AVAILABLE ?auto_1052588 ) ( AVAILABLE ?auto_1052583 ) ( SURFACE-AT ?auto_1052580 ?auto_1052587 ) ( ON ?auto_1052580 ?auto_1052589 ) ( CLEAR ?auto_1052580 ) ( not ( = ?auto_1052580 ?auto_1052589 ) ) ( not ( = ?auto_1052581 ?auto_1052589 ) ) ( not ( = ?auto_1052584 ?auto_1052589 ) ) ( not ( = ?auto_1052582 ?auto_1052589 ) ) ( TRUCK-AT ?auto_1052586 ?auto_1052585 ) )
    :subtasks
    ( ( !DRIVE ?auto_1052586 ?auto_1052585 ?auto_1052587 )
      ( MAKE-2CRATE ?auto_1052584 ?auto_1052580 ?auto_1052581 )
      ( MAKE-1CRATE-VERIFY ?auto_1052580 ?auto_1052581 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1052590 - SURFACE
      ?auto_1052591 - SURFACE
      ?auto_1052592 - SURFACE
    )
    :vars
    (
      ?auto_1052595 - HOIST
      ?auto_1052597 - PLACE
      ?auto_1052599 - PLACE
      ?auto_1052593 - HOIST
      ?auto_1052598 - SURFACE
      ?auto_1052596 - SURFACE
      ?auto_1052594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052595 ?auto_1052597 ) ( IS-CRATE ?auto_1052592 ) ( not ( = ?auto_1052591 ?auto_1052592 ) ) ( not ( = ?auto_1052590 ?auto_1052591 ) ) ( not ( = ?auto_1052590 ?auto_1052592 ) ) ( not ( = ?auto_1052599 ?auto_1052597 ) ) ( HOIST-AT ?auto_1052593 ?auto_1052599 ) ( not ( = ?auto_1052595 ?auto_1052593 ) ) ( SURFACE-AT ?auto_1052592 ?auto_1052599 ) ( ON ?auto_1052592 ?auto_1052598 ) ( CLEAR ?auto_1052592 ) ( not ( = ?auto_1052591 ?auto_1052598 ) ) ( not ( = ?auto_1052592 ?auto_1052598 ) ) ( not ( = ?auto_1052590 ?auto_1052598 ) ) ( SURFACE-AT ?auto_1052590 ?auto_1052597 ) ( CLEAR ?auto_1052590 ) ( IS-CRATE ?auto_1052591 ) ( AVAILABLE ?auto_1052595 ) ( AVAILABLE ?auto_1052593 ) ( SURFACE-AT ?auto_1052591 ?auto_1052599 ) ( ON ?auto_1052591 ?auto_1052596 ) ( CLEAR ?auto_1052591 ) ( not ( = ?auto_1052591 ?auto_1052596 ) ) ( not ( = ?auto_1052592 ?auto_1052596 ) ) ( not ( = ?auto_1052590 ?auto_1052596 ) ) ( not ( = ?auto_1052598 ?auto_1052596 ) ) ( TRUCK-AT ?auto_1052594 ?auto_1052597 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1052591 ?auto_1052592 )
      ( MAKE-2CRATE-VERIFY ?auto_1052590 ?auto_1052591 ?auto_1052592 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1052600 - SURFACE
      ?auto_1052601 - SURFACE
      ?auto_1052602 - SURFACE
      ?auto_1052603 - SURFACE
    )
    :vars
    (
      ?auto_1052609 - HOIST
      ?auto_1052607 - PLACE
      ?auto_1052604 - PLACE
      ?auto_1052608 - HOIST
      ?auto_1052606 - SURFACE
      ?auto_1052610 - SURFACE
      ?auto_1052605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052609 ?auto_1052607 ) ( IS-CRATE ?auto_1052603 ) ( not ( = ?auto_1052602 ?auto_1052603 ) ) ( not ( = ?auto_1052601 ?auto_1052602 ) ) ( not ( = ?auto_1052601 ?auto_1052603 ) ) ( not ( = ?auto_1052604 ?auto_1052607 ) ) ( HOIST-AT ?auto_1052608 ?auto_1052604 ) ( not ( = ?auto_1052609 ?auto_1052608 ) ) ( SURFACE-AT ?auto_1052603 ?auto_1052604 ) ( ON ?auto_1052603 ?auto_1052606 ) ( CLEAR ?auto_1052603 ) ( not ( = ?auto_1052602 ?auto_1052606 ) ) ( not ( = ?auto_1052603 ?auto_1052606 ) ) ( not ( = ?auto_1052601 ?auto_1052606 ) ) ( SURFACE-AT ?auto_1052601 ?auto_1052607 ) ( CLEAR ?auto_1052601 ) ( IS-CRATE ?auto_1052602 ) ( AVAILABLE ?auto_1052609 ) ( AVAILABLE ?auto_1052608 ) ( SURFACE-AT ?auto_1052602 ?auto_1052604 ) ( ON ?auto_1052602 ?auto_1052610 ) ( CLEAR ?auto_1052602 ) ( not ( = ?auto_1052602 ?auto_1052610 ) ) ( not ( = ?auto_1052603 ?auto_1052610 ) ) ( not ( = ?auto_1052601 ?auto_1052610 ) ) ( not ( = ?auto_1052606 ?auto_1052610 ) ) ( TRUCK-AT ?auto_1052605 ?auto_1052607 ) ( ON ?auto_1052601 ?auto_1052600 ) ( not ( = ?auto_1052600 ?auto_1052601 ) ) ( not ( = ?auto_1052600 ?auto_1052602 ) ) ( not ( = ?auto_1052600 ?auto_1052603 ) ) ( not ( = ?auto_1052600 ?auto_1052606 ) ) ( not ( = ?auto_1052600 ?auto_1052610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052601 ?auto_1052602 ?auto_1052603 )
      ( MAKE-3CRATE-VERIFY ?auto_1052600 ?auto_1052601 ?auto_1052602 ?auto_1052603 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1052611 - SURFACE
      ?auto_1052612 - SURFACE
      ?auto_1052613 - SURFACE
      ?auto_1052614 - SURFACE
      ?auto_1052615 - SURFACE
    )
    :vars
    (
      ?auto_1052621 - HOIST
      ?auto_1052619 - PLACE
      ?auto_1052616 - PLACE
      ?auto_1052620 - HOIST
      ?auto_1052618 - SURFACE
      ?auto_1052622 - SURFACE
      ?auto_1052617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052621 ?auto_1052619 ) ( IS-CRATE ?auto_1052615 ) ( not ( = ?auto_1052614 ?auto_1052615 ) ) ( not ( = ?auto_1052613 ?auto_1052614 ) ) ( not ( = ?auto_1052613 ?auto_1052615 ) ) ( not ( = ?auto_1052616 ?auto_1052619 ) ) ( HOIST-AT ?auto_1052620 ?auto_1052616 ) ( not ( = ?auto_1052621 ?auto_1052620 ) ) ( SURFACE-AT ?auto_1052615 ?auto_1052616 ) ( ON ?auto_1052615 ?auto_1052618 ) ( CLEAR ?auto_1052615 ) ( not ( = ?auto_1052614 ?auto_1052618 ) ) ( not ( = ?auto_1052615 ?auto_1052618 ) ) ( not ( = ?auto_1052613 ?auto_1052618 ) ) ( SURFACE-AT ?auto_1052613 ?auto_1052619 ) ( CLEAR ?auto_1052613 ) ( IS-CRATE ?auto_1052614 ) ( AVAILABLE ?auto_1052621 ) ( AVAILABLE ?auto_1052620 ) ( SURFACE-AT ?auto_1052614 ?auto_1052616 ) ( ON ?auto_1052614 ?auto_1052622 ) ( CLEAR ?auto_1052614 ) ( not ( = ?auto_1052614 ?auto_1052622 ) ) ( not ( = ?auto_1052615 ?auto_1052622 ) ) ( not ( = ?auto_1052613 ?auto_1052622 ) ) ( not ( = ?auto_1052618 ?auto_1052622 ) ) ( TRUCK-AT ?auto_1052617 ?auto_1052619 ) ( ON ?auto_1052612 ?auto_1052611 ) ( ON ?auto_1052613 ?auto_1052612 ) ( not ( = ?auto_1052611 ?auto_1052612 ) ) ( not ( = ?auto_1052611 ?auto_1052613 ) ) ( not ( = ?auto_1052611 ?auto_1052614 ) ) ( not ( = ?auto_1052611 ?auto_1052615 ) ) ( not ( = ?auto_1052611 ?auto_1052618 ) ) ( not ( = ?auto_1052611 ?auto_1052622 ) ) ( not ( = ?auto_1052612 ?auto_1052613 ) ) ( not ( = ?auto_1052612 ?auto_1052614 ) ) ( not ( = ?auto_1052612 ?auto_1052615 ) ) ( not ( = ?auto_1052612 ?auto_1052618 ) ) ( not ( = ?auto_1052612 ?auto_1052622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052613 ?auto_1052614 ?auto_1052615 )
      ( MAKE-4CRATE-VERIFY ?auto_1052611 ?auto_1052612 ?auto_1052613 ?auto_1052614 ?auto_1052615 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1052623 - SURFACE
      ?auto_1052624 - SURFACE
      ?auto_1052625 - SURFACE
      ?auto_1052626 - SURFACE
      ?auto_1052627 - SURFACE
      ?auto_1052628 - SURFACE
    )
    :vars
    (
      ?auto_1052634 - HOIST
      ?auto_1052632 - PLACE
      ?auto_1052629 - PLACE
      ?auto_1052633 - HOIST
      ?auto_1052631 - SURFACE
      ?auto_1052635 - SURFACE
      ?auto_1052630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052634 ?auto_1052632 ) ( IS-CRATE ?auto_1052628 ) ( not ( = ?auto_1052627 ?auto_1052628 ) ) ( not ( = ?auto_1052626 ?auto_1052627 ) ) ( not ( = ?auto_1052626 ?auto_1052628 ) ) ( not ( = ?auto_1052629 ?auto_1052632 ) ) ( HOIST-AT ?auto_1052633 ?auto_1052629 ) ( not ( = ?auto_1052634 ?auto_1052633 ) ) ( SURFACE-AT ?auto_1052628 ?auto_1052629 ) ( ON ?auto_1052628 ?auto_1052631 ) ( CLEAR ?auto_1052628 ) ( not ( = ?auto_1052627 ?auto_1052631 ) ) ( not ( = ?auto_1052628 ?auto_1052631 ) ) ( not ( = ?auto_1052626 ?auto_1052631 ) ) ( SURFACE-AT ?auto_1052626 ?auto_1052632 ) ( CLEAR ?auto_1052626 ) ( IS-CRATE ?auto_1052627 ) ( AVAILABLE ?auto_1052634 ) ( AVAILABLE ?auto_1052633 ) ( SURFACE-AT ?auto_1052627 ?auto_1052629 ) ( ON ?auto_1052627 ?auto_1052635 ) ( CLEAR ?auto_1052627 ) ( not ( = ?auto_1052627 ?auto_1052635 ) ) ( not ( = ?auto_1052628 ?auto_1052635 ) ) ( not ( = ?auto_1052626 ?auto_1052635 ) ) ( not ( = ?auto_1052631 ?auto_1052635 ) ) ( TRUCK-AT ?auto_1052630 ?auto_1052632 ) ( ON ?auto_1052624 ?auto_1052623 ) ( ON ?auto_1052625 ?auto_1052624 ) ( ON ?auto_1052626 ?auto_1052625 ) ( not ( = ?auto_1052623 ?auto_1052624 ) ) ( not ( = ?auto_1052623 ?auto_1052625 ) ) ( not ( = ?auto_1052623 ?auto_1052626 ) ) ( not ( = ?auto_1052623 ?auto_1052627 ) ) ( not ( = ?auto_1052623 ?auto_1052628 ) ) ( not ( = ?auto_1052623 ?auto_1052631 ) ) ( not ( = ?auto_1052623 ?auto_1052635 ) ) ( not ( = ?auto_1052624 ?auto_1052625 ) ) ( not ( = ?auto_1052624 ?auto_1052626 ) ) ( not ( = ?auto_1052624 ?auto_1052627 ) ) ( not ( = ?auto_1052624 ?auto_1052628 ) ) ( not ( = ?auto_1052624 ?auto_1052631 ) ) ( not ( = ?auto_1052624 ?auto_1052635 ) ) ( not ( = ?auto_1052625 ?auto_1052626 ) ) ( not ( = ?auto_1052625 ?auto_1052627 ) ) ( not ( = ?auto_1052625 ?auto_1052628 ) ) ( not ( = ?auto_1052625 ?auto_1052631 ) ) ( not ( = ?auto_1052625 ?auto_1052635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052626 ?auto_1052627 ?auto_1052628 )
      ( MAKE-5CRATE-VERIFY ?auto_1052623 ?auto_1052624 ?auto_1052625 ?auto_1052626 ?auto_1052627 ?auto_1052628 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1052636 - SURFACE
      ?auto_1052637 - SURFACE
      ?auto_1052638 - SURFACE
      ?auto_1052639 - SURFACE
      ?auto_1052640 - SURFACE
      ?auto_1052641 - SURFACE
      ?auto_1052642 - SURFACE
    )
    :vars
    (
      ?auto_1052648 - HOIST
      ?auto_1052646 - PLACE
      ?auto_1052643 - PLACE
      ?auto_1052647 - HOIST
      ?auto_1052645 - SURFACE
      ?auto_1052649 - SURFACE
      ?auto_1052644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052648 ?auto_1052646 ) ( IS-CRATE ?auto_1052642 ) ( not ( = ?auto_1052641 ?auto_1052642 ) ) ( not ( = ?auto_1052640 ?auto_1052641 ) ) ( not ( = ?auto_1052640 ?auto_1052642 ) ) ( not ( = ?auto_1052643 ?auto_1052646 ) ) ( HOIST-AT ?auto_1052647 ?auto_1052643 ) ( not ( = ?auto_1052648 ?auto_1052647 ) ) ( SURFACE-AT ?auto_1052642 ?auto_1052643 ) ( ON ?auto_1052642 ?auto_1052645 ) ( CLEAR ?auto_1052642 ) ( not ( = ?auto_1052641 ?auto_1052645 ) ) ( not ( = ?auto_1052642 ?auto_1052645 ) ) ( not ( = ?auto_1052640 ?auto_1052645 ) ) ( SURFACE-AT ?auto_1052640 ?auto_1052646 ) ( CLEAR ?auto_1052640 ) ( IS-CRATE ?auto_1052641 ) ( AVAILABLE ?auto_1052648 ) ( AVAILABLE ?auto_1052647 ) ( SURFACE-AT ?auto_1052641 ?auto_1052643 ) ( ON ?auto_1052641 ?auto_1052649 ) ( CLEAR ?auto_1052641 ) ( not ( = ?auto_1052641 ?auto_1052649 ) ) ( not ( = ?auto_1052642 ?auto_1052649 ) ) ( not ( = ?auto_1052640 ?auto_1052649 ) ) ( not ( = ?auto_1052645 ?auto_1052649 ) ) ( TRUCK-AT ?auto_1052644 ?auto_1052646 ) ( ON ?auto_1052637 ?auto_1052636 ) ( ON ?auto_1052638 ?auto_1052637 ) ( ON ?auto_1052639 ?auto_1052638 ) ( ON ?auto_1052640 ?auto_1052639 ) ( not ( = ?auto_1052636 ?auto_1052637 ) ) ( not ( = ?auto_1052636 ?auto_1052638 ) ) ( not ( = ?auto_1052636 ?auto_1052639 ) ) ( not ( = ?auto_1052636 ?auto_1052640 ) ) ( not ( = ?auto_1052636 ?auto_1052641 ) ) ( not ( = ?auto_1052636 ?auto_1052642 ) ) ( not ( = ?auto_1052636 ?auto_1052645 ) ) ( not ( = ?auto_1052636 ?auto_1052649 ) ) ( not ( = ?auto_1052637 ?auto_1052638 ) ) ( not ( = ?auto_1052637 ?auto_1052639 ) ) ( not ( = ?auto_1052637 ?auto_1052640 ) ) ( not ( = ?auto_1052637 ?auto_1052641 ) ) ( not ( = ?auto_1052637 ?auto_1052642 ) ) ( not ( = ?auto_1052637 ?auto_1052645 ) ) ( not ( = ?auto_1052637 ?auto_1052649 ) ) ( not ( = ?auto_1052638 ?auto_1052639 ) ) ( not ( = ?auto_1052638 ?auto_1052640 ) ) ( not ( = ?auto_1052638 ?auto_1052641 ) ) ( not ( = ?auto_1052638 ?auto_1052642 ) ) ( not ( = ?auto_1052638 ?auto_1052645 ) ) ( not ( = ?auto_1052638 ?auto_1052649 ) ) ( not ( = ?auto_1052639 ?auto_1052640 ) ) ( not ( = ?auto_1052639 ?auto_1052641 ) ) ( not ( = ?auto_1052639 ?auto_1052642 ) ) ( not ( = ?auto_1052639 ?auto_1052645 ) ) ( not ( = ?auto_1052639 ?auto_1052649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052640 ?auto_1052641 ?auto_1052642 )
      ( MAKE-6CRATE-VERIFY ?auto_1052636 ?auto_1052637 ?auto_1052638 ?auto_1052639 ?auto_1052640 ?auto_1052641 ?auto_1052642 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1052650 - SURFACE
      ?auto_1052651 - SURFACE
      ?auto_1052652 - SURFACE
      ?auto_1052653 - SURFACE
      ?auto_1052654 - SURFACE
      ?auto_1052655 - SURFACE
      ?auto_1052656 - SURFACE
      ?auto_1052657 - SURFACE
    )
    :vars
    (
      ?auto_1052663 - HOIST
      ?auto_1052661 - PLACE
      ?auto_1052658 - PLACE
      ?auto_1052662 - HOIST
      ?auto_1052660 - SURFACE
      ?auto_1052664 - SURFACE
      ?auto_1052659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052663 ?auto_1052661 ) ( IS-CRATE ?auto_1052657 ) ( not ( = ?auto_1052656 ?auto_1052657 ) ) ( not ( = ?auto_1052655 ?auto_1052656 ) ) ( not ( = ?auto_1052655 ?auto_1052657 ) ) ( not ( = ?auto_1052658 ?auto_1052661 ) ) ( HOIST-AT ?auto_1052662 ?auto_1052658 ) ( not ( = ?auto_1052663 ?auto_1052662 ) ) ( SURFACE-AT ?auto_1052657 ?auto_1052658 ) ( ON ?auto_1052657 ?auto_1052660 ) ( CLEAR ?auto_1052657 ) ( not ( = ?auto_1052656 ?auto_1052660 ) ) ( not ( = ?auto_1052657 ?auto_1052660 ) ) ( not ( = ?auto_1052655 ?auto_1052660 ) ) ( SURFACE-AT ?auto_1052655 ?auto_1052661 ) ( CLEAR ?auto_1052655 ) ( IS-CRATE ?auto_1052656 ) ( AVAILABLE ?auto_1052663 ) ( AVAILABLE ?auto_1052662 ) ( SURFACE-AT ?auto_1052656 ?auto_1052658 ) ( ON ?auto_1052656 ?auto_1052664 ) ( CLEAR ?auto_1052656 ) ( not ( = ?auto_1052656 ?auto_1052664 ) ) ( not ( = ?auto_1052657 ?auto_1052664 ) ) ( not ( = ?auto_1052655 ?auto_1052664 ) ) ( not ( = ?auto_1052660 ?auto_1052664 ) ) ( TRUCK-AT ?auto_1052659 ?auto_1052661 ) ( ON ?auto_1052651 ?auto_1052650 ) ( ON ?auto_1052652 ?auto_1052651 ) ( ON ?auto_1052653 ?auto_1052652 ) ( ON ?auto_1052654 ?auto_1052653 ) ( ON ?auto_1052655 ?auto_1052654 ) ( not ( = ?auto_1052650 ?auto_1052651 ) ) ( not ( = ?auto_1052650 ?auto_1052652 ) ) ( not ( = ?auto_1052650 ?auto_1052653 ) ) ( not ( = ?auto_1052650 ?auto_1052654 ) ) ( not ( = ?auto_1052650 ?auto_1052655 ) ) ( not ( = ?auto_1052650 ?auto_1052656 ) ) ( not ( = ?auto_1052650 ?auto_1052657 ) ) ( not ( = ?auto_1052650 ?auto_1052660 ) ) ( not ( = ?auto_1052650 ?auto_1052664 ) ) ( not ( = ?auto_1052651 ?auto_1052652 ) ) ( not ( = ?auto_1052651 ?auto_1052653 ) ) ( not ( = ?auto_1052651 ?auto_1052654 ) ) ( not ( = ?auto_1052651 ?auto_1052655 ) ) ( not ( = ?auto_1052651 ?auto_1052656 ) ) ( not ( = ?auto_1052651 ?auto_1052657 ) ) ( not ( = ?auto_1052651 ?auto_1052660 ) ) ( not ( = ?auto_1052651 ?auto_1052664 ) ) ( not ( = ?auto_1052652 ?auto_1052653 ) ) ( not ( = ?auto_1052652 ?auto_1052654 ) ) ( not ( = ?auto_1052652 ?auto_1052655 ) ) ( not ( = ?auto_1052652 ?auto_1052656 ) ) ( not ( = ?auto_1052652 ?auto_1052657 ) ) ( not ( = ?auto_1052652 ?auto_1052660 ) ) ( not ( = ?auto_1052652 ?auto_1052664 ) ) ( not ( = ?auto_1052653 ?auto_1052654 ) ) ( not ( = ?auto_1052653 ?auto_1052655 ) ) ( not ( = ?auto_1052653 ?auto_1052656 ) ) ( not ( = ?auto_1052653 ?auto_1052657 ) ) ( not ( = ?auto_1052653 ?auto_1052660 ) ) ( not ( = ?auto_1052653 ?auto_1052664 ) ) ( not ( = ?auto_1052654 ?auto_1052655 ) ) ( not ( = ?auto_1052654 ?auto_1052656 ) ) ( not ( = ?auto_1052654 ?auto_1052657 ) ) ( not ( = ?auto_1052654 ?auto_1052660 ) ) ( not ( = ?auto_1052654 ?auto_1052664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052655 ?auto_1052656 ?auto_1052657 )
      ( MAKE-7CRATE-VERIFY ?auto_1052650 ?auto_1052651 ?auto_1052652 ?auto_1052653 ?auto_1052654 ?auto_1052655 ?auto_1052656 ?auto_1052657 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052665 - SURFACE
      ?auto_1052666 - SURFACE
      ?auto_1052667 - SURFACE
      ?auto_1052668 - SURFACE
      ?auto_1052669 - SURFACE
      ?auto_1052670 - SURFACE
      ?auto_1052671 - SURFACE
      ?auto_1052672 - SURFACE
      ?auto_1052673 - SURFACE
    )
    :vars
    (
      ?auto_1052679 - HOIST
      ?auto_1052677 - PLACE
      ?auto_1052674 - PLACE
      ?auto_1052678 - HOIST
      ?auto_1052676 - SURFACE
      ?auto_1052680 - SURFACE
      ?auto_1052675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052679 ?auto_1052677 ) ( IS-CRATE ?auto_1052673 ) ( not ( = ?auto_1052672 ?auto_1052673 ) ) ( not ( = ?auto_1052671 ?auto_1052672 ) ) ( not ( = ?auto_1052671 ?auto_1052673 ) ) ( not ( = ?auto_1052674 ?auto_1052677 ) ) ( HOIST-AT ?auto_1052678 ?auto_1052674 ) ( not ( = ?auto_1052679 ?auto_1052678 ) ) ( SURFACE-AT ?auto_1052673 ?auto_1052674 ) ( ON ?auto_1052673 ?auto_1052676 ) ( CLEAR ?auto_1052673 ) ( not ( = ?auto_1052672 ?auto_1052676 ) ) ( not ( = ?auto_1052673 ?auto_1052676 ) ) ( not ( = ?auto_1052671 ?auto_1052676 ) ) ( SURFACE-AT ?auto_1052671 ?auto_1052677 ) ( CLEAR ?auto_1052671 ) ( IS-CRATE ?auto_1052672 ) ( AVAILABLE ?auto_1052679 ) ( AVAILABLE ?auto_1052678 ) ( SURFACE-AT ?auto_1052672 ?auto_1052674 ) ( ON ?auto_1052672 ?auto_1052680 ) ( CLEAR ?auto_1052672 ) ( not ( = ?auto_1052672 ?auto_1052680 ) ) ( not ( = ?auto_1052673 ?auto_1052680 ) ) ( not ( = ?auto_1052671 ?auto_1052680 ) ) ( not ( = ?auto_1052676 ?auto_1052680 ) ) ( TRUCK-AT ?auto_1052675 ?auto_1052677 ) ( ON ?auto_1052666 ?auto_1052665 ) ( ON ?auto_1052667 ?auto_1052666 ) ( ON ?auto_1052668 ?auto_1052667 ) ( ON ?auto_1052669 ?auto_1052668 ) ( ON ?auto_1052670 ?auto_1052669 ) ( ON ?auto_1052671 ?auto_1052670 ) ( not ( = ?auto_1052665 ?auto_1052666 ) ) ( not ( = ?auto_1052665 ?auto_1052667 ) ) ( not ( = ?auto_1052665 ?auto_1052668 ) ) ( not ( = ?auto_1052665 ?auto_1052669 ) ) ( not ( = ?auto_1052665 ?auto_1052670 ) ) ( not ( = ?auto_1052665 ?auto_1052671 ) ) ( not ( = ?auto_1052665 ?auto_1052672 ) ) ( not ( = ?auto_1052665 ?auto_1052673 ) ) ( not ( = ?auto_1052665 ?auto_1052676 ) ) ( not ( = ?auto_1052665 ?auto_1052680 ) ) ( not ( = ?auto_1052666 ?auto_1052667 ) ) ( not ( = ?auto_1052666 ?auto_1052668 ) ) ( not ( = ?auto_1052666 ?auto_1052669 ) ) ( not ( = ?auto_1052666 ?auto_1052670 ) ) ( not ( = ?auto_1052666 ?auto_1052671 ) ) ( not ( = ?auto_1052666 ?auto_1052672 ) ) ( not ( = ?auto_1052666 ?auto_1052673 ) ) ( not ( = ?auto_1052666 ?auto_1052676 ) ) ( not ( = ?auto_1052666 ?auto_1052680 ) ) ( not ( = ?auto_1052667 ?auto_1052668 ) ) ( not ( = ?auto_1052667 ?auto_1052669 ) ) ( not ( = ?auto_1052667 ?auto_1052670 ) ) ( not ( = ?auto_1052667 ?auto_1052671 ) ) ( not ( = ?auto_1052667 ?auto_1052672 ) ) ( not ( = ?auto_1052667 ?auto_1052673 ) ) ( not ( = ?auto_1052667 ?auto_1052676 ) ) ( not ( = ?auto_1052667 ?auto_1052680 ) ) ( not ( = ?auto_1052668 ?auto_1052669 ) ) ( not ( = ?auto_1052668 ?auto_1052670 ) ) ( not ( = ?auto_1052668 ?auto_1052671 ) ) ( not ( = ?auto_1052668 ?auto_1052672 ) ) ( not ( = ?auto_1052668 ?auto_1052673 ) ) ( not ( = ?auto_1052668 ?auto_1052676 ) ) ( not ( = ?auto_1052668 ?auto_1052680 ) ) ( not ( = ?auto_1052669 ?auto_1052670 ) ) ( not ( = ?auto_1052669 ?auto_1052671 ) ) ( not ( = ?auto_1052669 ?auto_1052672 ) ) ( not ( = ?auto_1052669 ?auto_1052673 ) ) ( not ( = ?auto_1052669 ?auto_1052676 ) ) ( not ( = ?auto_1052669 ?auto_1052680 ) ) ( not ( = ?auto_1052670 ?auto_1052671 ) ) ( not ( = ?auto_1052670 ?auto_1052672 ) ) ( not ( = ?auto_1052670 ?auto_1052673 ) ) ( not ( = ?auto_1052670 ?auto_1052676 ) ) ( not ( = ?auto_1052670 ?auto_1052680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052671 ?auto_1052672 ?auto_1052673 )
      ( MAKE-8CRATE-VERIFY ?auto_1052665 ?auto_1052666 ?auto_1052667 ?auto_1052668 ?auto_1052669 ?auto_1052670 ?auto_1052671 ?auto_1052672 ?auto_1052673 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1052681 - SURFACE
      ?auto_1052682 - SURFACE
    )
    :vars
    (
      ?auto_1052688 - HOIST
      ?auto_1052686 - PLACE
      ?auto_1052690 - SURFACE
      ?auto_1052683 - PLACE
      ?auto_1052687 - HOIST
      ?auto_1052685 - SURFACE
      ?auto_1052689 - SURFACE
      ?auto_1052684 - TRUCK
      ?auto_1052691 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052688 ?auto_1052686 ) ( IS-CRATE ?auto_1052682 ) ( not ( = ?auto_1052681 ?auto_1052682 ) ) ( not ( = ?auto_1052690 ?auto_1052681 ) ) ( not ( = ?auto_1052690 ?auto_1052682 ) ) ( not ( = ?auto_1052683 ?auto_1052686 ) ) ( HOIST-AT ?auto_1052687 ?auto_1052683 ) ( not ( = ?auto_1052688 ?auto_1052687 ) ) ( SURFACE-AT ?auto_1052682 ?auto_1052683 ) ( ON ?auto_1052682 ?auto_1052685 ) ( CLEAR ?auto_1052682 ) ( not ( = ?auto_1052681 ?auto_1052685 ) ) ( not ( = ?auto_1052682 ?auto_1052685 ) ) ( not ( = ?auto_1052690 ?auto_1052685 ) ) ( IS-CRATE ?auto_1052681 ) ( AVAILABLE ?auto_1052687 ) ( SURFACE-AT ?auto_1052681 ?auto_1052683 ) ( ON ?auto_1052681 ?auto_1052689 ) ( CLEAR ?auto_1052681 ) ( not ( = ?auto_1052681 ?auto_1052689 ) ) ( not ( = ?auto_1052682 ?auto_1052689 ) ) ( not ( = ?auto_1052690 ?auto_1052689 ) ) ( not ( = ?auto_1052685 ?auto_1052689 ) ) ( TRUCK-AT ?auto_1052684 ?auto_1052686 ) ( SURFACE-AT ?auto_1052691 ?auto_1052686 ) ( CLEAR ?auto_1052691 ) ( LIFTING ?auto_1052688 ?auto_1052690 ) ( IS-CRATE ?auto_1052690 ) ( not ( = ?auto_1052691 ?auto_1052690 ) ) ( not ( = ?auto_1052681 ?auto_1052691 ) ) ( not ( = ?auto_1052682 ?auto_1052691 ) ) ( not ( = ?auto_1052685 ?auto_1052691 ) ) ( not ( = ?auto_1052689 ?auto_1052691 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1052691 ?auto_1052690 )
      ( MAKE-2CRATE ?auto_1052690 ?auto_1052681 ?auto_1052682 )
      ( MAKE-1CRATE-VERIFY ?auto_1052681 ?auto_1052682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1052692 - SURFACE
      ?auto_1052693 - SURFACE
      ?auto_1052694 - SURFACE
    )
    :vars
    (
      ?auto_1052702 - HOIST
      ?auto_1052697 - PLACE
      ?auto_1052695 - PLACE
      ?auto_1052700 - HOIST
      ?auto_1052698 - SURFACE
      ?auto_1052699 - SURFACE
      ?auto_1052701 - TRUCK
      ?auto_1052696 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052702 ?auto_1052697 ) ( IS-CRATE ?auto_1052694 ) ( not ( = ?auto_1052693 ?auto_1052694 ) ) ( not ( = ?auto_1052692 ?auto_1052693 ) ) ( not ( = ?auto_1052692 ?auto_1052694 ) ) ( not ( = ?auto_1052695 ?auto_1052697 ) ) ( HOIST-AT ?auto_1052700 ?auto_1052695 ) ( not ( = ?auto_1052702 ?auto_1052700 ) ) ( SURFACE-AT ?auto_1052694 ?auto_1052695 ) ( ON ?auto_1052694 ?auto_1052698 ) ( CLEAR ?auto_1052694 ) ( not ( = ?auto_1052693 ?auto_1052698 ) ) ( not ( = ?auto_1052694 ?auto_1052698 ) ) ( not ( = ?auto_1052692 ?auto_1052698 ) ) ( IS-CRATE ?auto_1052693 ) ( AVAILABLE ?auto_1052700 ) ( SURFACE-AT ?auto_1052693 ?auto_1052695 ) ( ON ?auto_1052693 ?auto_1052699 ) ( CLEAR ?auto_1052693 ) ( not ( = ?auto_1052693 ?auto_1052699 ) ) ( not ( = ?auto_1052694 ?auto_1052699 ) ) ( not ( = ?auto_1052692 ?auto_1052699 ) ) ( not ( = ?auto_1052698 ?auto_1052699 ) ) ( TRUCK-AT ?auto_1052701 ?auto_1052697 ) ( SURFACE-AT ?auto_1052696 ?auto_1052697 ) ( CLEAR ?auto_1052696 ) ( LIFTING ?auto_1052702 ?auto_1052692 ) ( IS-CRATE ?auto_1052692 ) ( not ( = ?auto_1052696 ?auto_1052692 ) ) ( not ( = ?auto_1052693 ?auto_1052696 ) ) ( not ( = ?auto_1052694 ?auto_1052696 ) ) ( not ( = ?auto_1052698 ?auto_1052696 ) ) ( not ( = ?auto_1052699 ?auto_1052696 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1052693 ?auto_1052694 )
      ( MAKE-2CRATE-VERIFY ?auto_1052692 ?auto_1052693 ?auto_1052694 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1052703 - SURFACE
      ?auto_1052704 - SURFACE
      ?auto_1052705 - SURFACE
      ?auto_1052706 - SURFACE
    )
    :vars
    (
      ?auto_1052713 - HOIST
      ?auto_1052709 - PLACE
      ?auto_1052708 - PLACE
      ?auto_1052711 - HOIST
      ?auto_1052707 - SURFACE
      ?auto_1052710 - SURFACE
      ?auto_1052712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052713 ?auto_1052709 ) ( IS-CRATE ?auto_1052706 ) ( not ( = ?auto_1052705 ?auto_1052706 ) ) ( not ( = ?auto_1052704 ?auto_1052705 ) ) ( not ( = ?auto_1052704 ?auto_1052706 ) ) ( not ( = ?auto_1052708 ?auto_1052709 ) ) ( HOIST-AT ?auto_1052711 ?auto_1052708 ) ( not ( = ?auto_1052713 ?auto_1052711 ) ) ( SURFACE-AT ?auto_1052706 ?auto_1052708 ) ( ON ?auto_1052706 ?auto_1052707 ) ( CLEAR ?auto_1052706 ) ( not ( = ?auto_1052705 ?auto_1052707 ) ) ( not ( = ?auto_1052706 ?auto_1052707 ) ) ( not ( = ?auto_1052704 ?auto_1052707 ) ) ( IS-CRATE ?auto_1052705 ) ( AVAILABLE ?auto_1052711 ) ( SURFACE-AT ?auto_1052705 ?auto_1052708 ) ( ON ?auto_1052705 ?auto_1052710 ) ( CLEAR ?auto_1052705 ) ( not ( = ?auto_1052705 ?auto_1052710 ) ) ( not ( = ?auto_1052706 ?auto_1052710 ) ) ( not ( = ?auto_1052704 ?auto_1052710 ) ) ( not ( = ?auto_1052707 ?auto_1052710 ) ) ( TRUCK-AT ?auto_1052712 ?auto_1052709 ) ( SURFACE-AT ?auto_1052703 ?auto_1052709 ) ( CLEAR ?auto_1052703 ) ( LIFTING ?auto_1052713 ?auto_1052704 ) ( IS-CRATE ?auto_1052704 ) ( not ( = ?auto_1052703 ?auto_1052704 ) ) ( not ( = ?auto_1052705 ?auto_1052703 ) ) ( not ( = ?auto_1052706 ?auto_1052703 ) ) ( not ( = ?auto_1052707 ?auto_1052703 ) ) ( not ( = ?auto_1052710 ?auto_1052703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052704 ?auto_1052705 ?auto_1052706 )
      ( MAKE-3CRATE-VERIFY ?auto_1052703 ?auto_1052704 ?auto_1052705 ?auto_1052706 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1052714 - SURFACE
      ?auto_1052715 - SURFACE
      ?auto_1052716 - SURFACE
      ?auto_1052717 - SURFACE
      ?auto_1052718 - SURFACE
    )
    :vars
    (
      ?auto_1052725 - HOIST
      ?auto_1052721 - PLACE
      ?auto_1052720 - PLACE
      ?auto_1052723 - HOIST
      ?auto_1052719 - SURFACE
      ?auto_1052722 - SURFACE
      ?auto_1052724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052725 ?auto_1052721 ) ( IS-CRATE ?auto_1052718 ) ( not ( = ?auto_1052717 ?auto_1052718 ) ) ( not ( = ?auto_1052716 ?auto_1052717 ) ) ( not ( = ?auto_1052716 ?auto_1052718 ) ) ( not ( = ?auto_1052720 ?auto_1052721 ) ) ( HOIST-AT ?auto_1052723 ?auto_1052720 ) ( not ( = ?auto_1052725 ?auto_1052723 ) ) ( SURFACE-AT ?auto_1052718 ?auto_1052720 ) ( ON ?auto_1052718 ?auto_1052719 ) ( CLEAR ?auto_1052718 ) ( not ( = ?auto_1052717 ?auto_1052719 ) ) ( not ( = ?auto_1052718 ?auto_1052719 ) ) ( not ( = ?auto_1052716 ?auto_1052719 ) ) ( IS-CRATE ?auto_1052717 ) ( AVAILABLE ?auto_1052723 ) ( SURFACE-AT ?auto_1052717 ?auto_1052720 ) ( ON ?auto_1052717 ?auto_1052722 ) ( CLEAR ?auto_1052717 ) ( not ( = ?auto_1052717 ?auto_1052722 ) ) ( not ( = ?auto_1052718 ?auto_1052722 ) ) ( not ( = ?auto_1052716 ?auto_1052722 ) ) ( not ( = ?auto_1052719 ?auto_1052722 ) ) ( TRUCK-AT ?auto_1052724 ?auto_1052721 ) ( SURFACE-AT ?auto_1052715 ?auto_1052721 ) ( CLEAR ?auto_1052715 ) ( LIFTING ?auto_1052725 ?auto_1052716 ) ( IS-CRATE ?auto_1052716 ) ( not ( = ?auto_1052715 ?auto_1052716 ) ) ( not ( = ?auto_1052717 ?auto_1052715 ) ) ( not ( = ?auto_1052718 ?auto_1052715 ) ) ( not ( = ?auto_1052719 ?auto_1052715 ) ) ( not ( = ?auto_1052722 ?auto_1052715 ) ) ( ON ?auto_1052715 ?auto_1052714 ) ( not ( = ?auto_1052714 ?auto_1052715 ) ) ( not ( = ?auto_1052714 ?auto_1052716 ) ) ( not ( = ?auto_1052714 ?auto_1052717 ) ) ( not ( = ?auto_1052714 ?auto_1052718 ) ) ( not ( = ?auto_1052714 ?auto_1052719 ) ) ( not ( = ?auto_1052714 ?auto_1052722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052716 ?auto_1052717 ?auto_1052718 )
      ( MAKE-4CRATE-VERIFY ?auto_1052714 ?auto_1052715 ?auto_1052716 ?auto_1052717 ?auto_1052718 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1052726 - SURFACE
      ?auto_1052727 - SURFACE
      ?auto_1052728 - SURFACE
      ?auto_1052729 - SURFACE
      ?auto_1052730 - SURFACE
      ?auto_1052731 - SURFACE
    )
    :vars
    (
      ?auto_1052738 - HOIST
      ?auto_1052734 - PLACE
      ?auto_1052733 - PLACE
      ?auto_1052736 - HOIST
      ?auto_1052732 - SURFACE
      ?auto_1052735 - SURFACE
      ?auto_1052737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052738 ?auto_1052734 ) ( IS-CRATE ?auto_1052731 ) ( not ( = ?auto_1052730 ?auto_1052731 ) ) ( not ( = ?auto_1052729 ?auto_1052730 ) ) ( not ( = ?auto_1052729 ?auto_1052731 ) ) ( not ( = ?auto_1052733 ?auto_1052734 ) ) ( HOIST-AT ?auto_1052736 ?auto_1052733 ) ( not ( = ?auto_1052738 ?auto_1052736 ) ) ( SURFACE-AT ?auto_1052731 ?auto_1052733 ) ( ON ?auto_1052731 ?auto_1052732 ) ( CLEAR ?auto_1052731 ) ( not ( = ?auto_1052730 ?auto_1052732 ) ) ( not ( = ?auto_1052731 ?auto_1052732 ) ) ( not ( = ?auto_1052729 ?auto_1052732 ) ) ( IS-CRATE ?auto_1052730 ) ( AVAILABLE ?auto_1052736 ) ( SURFACE-AT ?auto_1052730 ?auto_1052733 ) ( ON ?auto_1052730 ?auto_1052735 ) ( CLEAR ?auto_1052730 ) ( not ( = ?auto_1052730 ?auto_1052735 ) ) ( not ( = ?auto_1052731 ?auto_1052735 ) ) ( not ( = ?auto_1052729 ?auto_1052735 ) ) ( not ( = ?auto_1052732 ?auto_1052735 ) ) ( TRUCK-AT ?auto_1052737 ?auto_1052734 ) ( SURFACE-AT ?auto_1052728 ?auto_1052734 ) ( CLEAR ?auto_1052728 ) ( LIFTING ?auto_1052738 ?auto_1052729 ) ( IS-CRATE ?auto_1052729 ) ( not ( = ?auto_1052728 ?auto_1052729 ) ) ( not ( = ?auto_1052730 ?auto_1052728 ) ) ( not ( = ?auto_1052731 ?auto_1052728 ) ) ( not ( = ?auto_1052732 ?auto_1052728 ) ) ( not ( = ?auto_1052735 ?auto_1052728 ) ) ( ON ?auto_1052727 ?auto_1052726 ) ( ON ?auto_1052728 ?auto_1052727 ) ( not ( = ?auto_1052726 ?auto_1052727 ) ) ( not ( = ?auto_1052726 ?auto_1052728 ) ) ( not ( = ?auto_1052726 ?auto_1052729 ) ) ( not ( = ?auto_1052726 ?auto_1052730 ) ) ( not ( = ?auto_1052726 ?auto_1052731 ) ) ( not ( = ?auto_1052726 ?auto_1052732 ) ) ( not ( = ?auto_1052726 ?auto_1052735 ) ) ( not ( = ?auto_1052727 ?auto_1052728 ) ) ( not ( = ?auto_1052727 ?auto_1052729 ) ) ( not ( = ?auto_1052727 ?auto_1052730 ) ) ( not ( = ?auto_1052727 ?auto_1052731 ) ) ( not ( = ?auto_1052727 ?auto_1052732 ) ) ( not ( = ?auto_1052727 ?auto_1052735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052729 ?auto_1052730 ?auto_1052731 )
      ( MAKE-5CRATE-VERIFY ?auto_1052726 ?auto_1052727 ?auto_1052728 ?auto_1052729 ?auto_1052730 ?auto_1052731 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1052739 - SURFACE
      ?auto_1052740 - SURFACE
      ?auto_1052741 - SURFACE
      ?auto_1052742 - SURFACE
      ?auto_1052743 - SURFACE
      ?auto_1052744 - SURFACE
      ?auto_1052745 - SURFACE
    )
    :vars
    (
      ?auto_1052752 - HOIST
      ?auto_1052748 - PLACE
      ?auto_1052747 - PLACE
      ?auto_1052750 - HOIST
      ?auto_1052746 - SURFACE
      ?auto_1052749 - SURFACE
      ?auto_1052751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052752 ?auto_1052748 ) ( IS-CRATE ?auto_1052745 ) ( not ( = ?auto_1052744 ?auto_1052745 ) ) ( not ( = ?auto_1052743 ?auto_1052744 ) ) ( not ( = ?auto_1052743 ?auto_1052745 ) ) ( not ( = ?auto_1052747 ?auto_1052748 ) ) ( HOIST-AT ?auto_1052750 ?auto_1052747 ) ( not ( = ?auto_1052752 ?auto_1052750 ) ) ( SURFACE-AT ?auto_1052745 ?auto_1052747 ) ( ON ?auto_1052745 ?auto_1052746 ) ( CLEAR ?auto_1052745 ) ( not ( = ?auto_1052744 ?auto_1052746 ) ) ( not ( = ?auto_1052745 ?auto_1052746 ) ) ( not ( = ?auto_1052743 ?auto_1052746 ) ) ( IS-CRATE ?auto_1052744 ) ( AVAILABLE ?auto_1052750 ) ( SURFACE-AT ?auto_1052744 ?auto_1052747 ) ( ON ?auto_1052744 ?auto_1052749 ) ( CLEAR ?auto_1052744 ) ( not ( = ?auto_1052744 ?auto_1052749 ) ) ( not ( = ?auto_1052745 ?auto_1052749 ) ) ( not ( = ?auto_1052743 ?auto_1052749 ) ) ( not ( = ?auto_1052746 ?auto_1052749 ) ) ( TRUCK-AT ?auto_1052751 ?auto_1052748 ) ( SURFACE-AT ?auto_1052742 ?auto_1052748 ) ( CLEAR ?auto_1052742 ) ( LIFTING ?auto_1052752 ?auto_1052743 ) ( IS-CRATE ?auto_1052743 ) ( not ( = ?auto_1052742 ?auto_1052743 ) ) ( not ( = ?auto_1052744 ?auto_1052742 ) ) ( not ( = ?auto_1052745 ?auto_1052742 ) ) ( not ( = ?auto_1052746 ?auto_1052742 ) ) ( not ( = ?auto_1052749 ?auto_1052742 ) ) ( ON ?auto_1052740 ?auto_1052739 ) ( ON ?auto_1052741 ?auto_1052740 ) ( ON ?auto_1052742 ?auto_1052741 ) ( not ( = ?auto_1052739 ?auto_1052740 ) ) ( not ( = ?auto_1052739 ?auto_1052741 ) ) ( not ( = ?auto_1052739 ?auto_1052742 ) ) ( not ( = ?auto_1052739 ?auto_1052743 ) ) ( not ( = ?auto_1052739 ?auto_1052744 ) ) ( not ( = ?auto_1052739 ?auto_1052745 ) ) ( not ( = ?auto_1052739 ?auto_1052746 ) ) ( not ( = ?auto_1052739 ?auto_1052749 ) ) ( not ( = ?auto_1052740 ?auto_1052741 ) ) ( not ( = ?auto_1052740 ?auto_1052742 ) ) ( not ( = ?auto_1052740 ?auto_1052743 ) ) ( not ( = ?auto_1052740 ?auto_1052744 ) ) ( not ( = ?auto_1052740 ?auto_1052745 ) ) ( not ( = ?auto_1052740 ?auto_1052746 ) ) ( not ( = ?auto_1052740 ?auto_1052749 ) ) ( not ( = ?auto_1052741 ?auto_1052742 ) ) ( not ( = ?auto_1052741 ?auto_1052743 ) ) ( not ( = ?auto_1052741 ?auto_1052744 ) ) ( not ( = ?auto_1052741 ?auto_1052745 ) ) ( not ( = ?auto_1052741 ?auto_1052746 ) ) ( not ( = ?auto_1052741 ?auto_1052749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052743 ?auto_1052744 ?auto_1052745 )
      ( MAKE-6CRATE-VERIFY ?auto_1052739 ?auto_1052740 ?auto_1052741 ?auto_1052742 ?auto_1052743 ?auto_1052744 ?auto_1052745 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1052753 - SURFACE
      ?auto_1052754 - SURFACE
      ?auto_1052755 - SURFACE
      ?auto_1052756 - SURFACE
      ?auto_1052757 - SURFACE
      ?auto_1052758 - SURFACE
      ?auto_1052759 - SURFACE
      ?auto_1052760 - SURFACE
    )
    :vars
    (
      ?auto_1052767 - HOIST
      ?auto_1052763 - PLACE
      ?auto_1052762 - PLACE
      ?auto_1052765 - HOIST
      ?auto_1052761 - SURFACE
      ?auto_1052764 - SURFACE
      ?auto_1052766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052767 ?auto_1052763 ) ( IS-CRATE ?auto_1052760 ) ( not ( = ?auto_1052759 ?auto_1052760 ) ) ( not ( = ?auto_1052758 ?auto_1052759 ) ) ( not ( = ?auto_1052758 ?auto_1052760 ) ) ( not ( = ?auto_1052762 ?auto_1052763 ) ) ( HOIST-AT ?auto_1052765 ?auto_1052762 ) ( not ( = ?auto_1052767 ?auto_1052765 ) ) ( SURFACE-AT ?auto_1052760 ?auto_1052762 ) ( ON ?auto_1052760 ?auto_1052761 ) ( CLEAR ?auto_1052760 ) ( not ( = ?auto_1052759 ?auto_1052761 ) ) ( not ( = ?auto_1052760 ?auto_1052761 ) ) ( not ( = ?auto_1052758 ?auto_1052761 ) ) ( IS-CRATE ?auto_1052759 ) ( AVAILABLE ?auto_1052765 ) ( SURFACE-AT ?auto_1052759 ?auto_1052762 ) ( ON ?auto_1052759 ?auto_1052764 ) ( CLEAR ?auto_1052759 ) ( not ( = ?auto_1052759 ?auto_1052764 ) ) ( not ( = ?auto_1052760 ?auto_1052764 ) ) ( not ( = ?auto_1052758 ?auto_1052764 ) ) ( not ( = ?auto_1052761 ?auto_1052764 ) ) ( TRUCK-AT ?auto_1052766 ?auto_1052763 ) ( SURFACE-AT ?auto_1052757 ?auto_1052763 ) ( CLEAR ?auto_1052757 ) ( LIFTING ?auto_1052767 ?auto_1052758 ) ( IS-CRATE ?auto_1052758 ) ( not ( = ?auto_1052757 ?auto_1052758 ) ) ( not ( = ?auto_1052759 ?auto_1052757 ) ) ( not ( = ?auto_1052760 ?auto_1052757 ) ) ( not ( = ?auto_1052761 ?auto_1052757 ) ) ( not ( = ?auto_1052764 ?auto_1052757 ) ) ( ON ?auto_1052754 ?auto_1052753 ) ( ON ?auto_1052755 ?auto_1052754 ) ( ON ?auto_1052756 ?auto_1052755 ) ( ON ?auto_1052757 ?auto_1052756 ) ( not ( = ?auto_1052753 ?auto_1052754 ) ) ( not ( = ?auto_1052753 ?auto_1052755 ) ) ( not ( = ?auto_1052753 ?auto_1052756 ) ) ( not ( = ?auto_1052753 ?auto_1052757 ) ) ( not ( = ?auto_1052753 ?auto_1052758 ) ) ( not ( = ?auto_1052753 ?auto_1052759 ) ) ( not ( = ?auto_1052753 ?auto_1052760 ) ) ( not ( = ?auto_1052753 ?auto_1052761 ) ) ( not ( = ?auto_1052753 ?auto_1052764 ) ) ( not ( = ?auto_1052754 ?auto_1052755 ) ) ( not ( = ?auto_1052754 ?auto_1052756 ) ) ( not ( = ?auto_1052754 ?auto_1052757 ) ) ( not ( = ?auto_1052754 ?auto_1052758 ) ) ( not ( = ?auto_1052754 ?auto_1052759 ) ) ( not ( = ?auto_1052754 ?auto_1052760 ) ) ( not ( = ?auto_1052754 ?auto_1052761 ) ) ( not ( = ?auto_1052754 ?auto_1052764 ) ) ( not ( = ?auto_1052755 ?auto_1052756 ) ) ( not ( = ?auto_1052755 ?auto_1052757 ) ) ( not ( = ?auto_1052755 ?auto_1052758 ) ) ( not ( = ?auto_1052755 ?auto_1052759 ) ) ( not ( = ?auto_1052755 ?auto_1052760 ) ) ( not ( = ?auto_1052755 ?auto_1052761 ) ) ( not ( = ?auto_1052755 ?auto_1052764 ) ) ( not ( = ?auto_1052756 ?auto_1052757 ) ) ( not ( = ?auto_1052756 ?auto_1052758 ) ) ( not ( = ?auto_1052756 ?auto_1052759 ) ) ( not ( = ?auto_1052756 ?auto_1052760 ) ) ( not ( = ?auto_1052756 ?auto_1052761 ) ) ( not ( = ?auto_1052756 ?auto_1052764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052758 ?auto_1052759 ?auto_1052760 )
      ( MAKE-7CRATE-VERIFY ?auto_1052753 ?auto_1052754 ?auto_1052755 ?auto_1052756 ?auto_1052757 ?auto_1052758 ?auto_1052759 ?auto_1052760 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1052768 - SURFACE
      ?auto_1052769 - SURFACE
      ?auto_1052770 - SURFACE
      ?auto_1052771 - SURFACE
      ?auto_1052772 - SURFACE
      ?auto_1052773 - SURFACE
      ?auto_1052774 - SURFACE
      ?auto_1052775 - SURFACE
      ?auto_1052776 - SURFACE
    )
    :vars
    (
      ?auto_1052783 - HOIST
      ?auto_1052779 - PLACE
      ?auto_1052778 - PLACE
      ?auto_1052781 - HOIST
      ?auto_1052777 - SURFACE
      ?auto_1052780 - SURFACE
      ?auto_1052782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1052783 ?auto_1052779 ) ( IS-CRATE ?auto_1052776 ) ( not ( = ?auto_1052775 ?auto_1052776 ) ) ( not ( = ?auto_1052774 ?auto_1052775 ) ) ( not ( = ?auto_1052774 ?auto_1052776 ) ) ( not ( = ?auto_1052778 ?auto_1052779 ) ) ( HOIST-AT ?auto_1052781 ?auto_1052778 ) ( not ( = ?auto_1052783 ?auto_1052781 ) ) ( SURFACE-AT ?auto_1052776 ?auto_1052778 ) ( ON ?auto_1052776 ?auto_1052777 ) ( CLEAR ?auto_1052776 ) ( not ( = ?auto_1052775 ?auto_1052777 ) ) ( not ( = ?auto_1052776 ?auto_1052777 ) ) ( not ( = ?auto_1052774 ?auto_1052777 ) ) ( IS-CRATE ?auto_1052775 ) ( AVAILABLE ?auto_1052781 ) ( SURFACE-AT ?auto_1052775 ?auto_1052778 ) ( ON ?auto_1052775 ?auto_1052780 ) ( CLEAR ?auto_1052775 ) ( not ( = ?auto_1052775 ?auto_1052780 ) ) ( not ( = ?auto_1052776 ?auto_1052780 ) ) ( not ( = ?auto_1052774 ?auto_1052780 ) ) ( not ( = ?auto_1052777 ?auto_1052780 ) ) ( TRUCK-AT ?auto_1052782 ?auto_1052779 ) ( SURFACE-AT ?auto_1052773 ?auto_1052779 ) ( CLEAR ?auto_1052773 ) ( LIFTING ?auto_1052783 ?auto_1052774 ) ( IS-CRATE ?auto_1052774 ) ( not ( = ?auto_1052773 ?auto_1052774 ) ) ( not ( = ?auto_1052775 ?auto_1052773 ) ) ( not ( = ?auto_1052776 ?auto_1052773 ) ) ( not ( = ?auto_1052777 ?auto_1052773 ) ) ( not ( = ?auto_1052780 ?auto_1052773 ) ) ( ON ?auto_1052769 ?auto_1052768 ) ( ON ?auto_1052770 ?auto_1052769 ) ( ON ?auto_1052771 ?auto_1052770 ) ( ON ?auto_1052772 ?auto_1052771 ) ( ON ?auto_1052773 ?auto_1052772 ) ( not ( = ?auto_1052768 ?auto_1052769 ) ) ( not ( = ?auto_1052768 ?auto_1052770 ) ) ( not ( = ?auto_1052768 ?auto_1052771 ) ) ( not ( = ?auto_1052768 ?auto_1052772 ) ) ( not ( = ?auto_1052768 ?auto_1052773 ) ) ( not ( = ?auto_1052768 ?auto_1052774 ) ) ( not ( = ?auto_1052768 ?auto_1052775 ) ) ( not ( = ?auto_1052768 ?auto_1052776 ) ) ( not ( = ?auto_1052768 ?auto_1052777 ) ) ( not ( = ?auto_1052768 ?auto_1052780 ) ) ( not ( = ?auto_1052769 ?auto_1052770 ) ) ( not ( = ?auto_1052769 ?auto_1052771 ) ) ( not ( = ?auto_1052769 ?auto_1052772 ) ) ( not ( = ?auto_1052769 ?auto_1052773 ) ) ( not ( = ?auto_1052769 ?auto_1052774 ) ) ( not ( = ?auto_1052769 ?auto_1052775 ) ) ( not ( = ?auto_1052769 ?auto_1052776 ) ) ( not ( = ?auto_1052769 ?auto_1052777 ) ) ( not ( = ?auto_1052769 ?auto_1052780 ) ) ( not ( = ?auto_1052770 ?auto_1052771 ) ) ( not ( = ?auto_1052770 ?auto_1052772 ) ) ( not ( = ?auto_1052770 ?auto_1052773 ) ) ( not ( = ?auto_1052770 ?auto_1052774 ) ) ( not ( = ?auto_1052770 ?auto_1052775 ) ) ( not ( = ?auto_1052770 ?auto_1052776 ) ) ( not ( = ?auto_1052770 ?auto_1052777 ) ) ( not ( = ?auto_1052770 ?auto_1052780 ) ) ( not ( = ?auto_1052771 ?auto_1052772 ) ) ( not ( = ?auto_1052771 ?auto_1052773 ) ) ( not ( = ?auto_1052771 ?auto_1052774 ) ) ( not ( = ?auto_1052771 ?auto_1052775 ) ) ( not ( = ?auto_1052771 ?auto_1052776 ) ) ( not ( = ?auto_1052771 ?auto_1052777 ) ) ( not ( = ?auto_1052771 ?auto_1052780 ) ) ( not ( = ?auto_1052772 ?auto_1052773 ) ) ( not ( = ?auto_1052772 ?auto_1052774 ) ) ( not ( = ?auto_1052772 ?auto_1052775 ) ) ( not ( = ?auto_1052772 ?auto_1052776 ) ) ( not ( = ?auto_1052772 ?auto_1052777 ) ) ( not ( = ?auto_1052772 ?auto_1052780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1052774 ?auto_1052775 ?auto_1052776 )
      ( MAKE-8CRATE-VERIFY ?auto_1052768 ?auto_1052769 ?auto_1052770 ?auto_1052771 ?auto_1052772 ?auto_1052773 ?auto_1052774 ?auto_1052775 ?auto_1052776 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056329 - SURFACE
      ?auto_1056330 - SURFACE
      ?auto_1056331 - SURFACE
      ?auto_1056332 - SURFACE
      ?auto_1056333 - SURFACE
      ?auto_1056334 - SURFACE
      ?auto_1056335 - SURFACE
      ?auto_1056336 - SURFACE
      ?auto_1056337 - SURFACE
      ?auto_1056338 - SURFACE
    )
    :vars
    (
      ?auto_1056339 - HOIST
      ?auto_1056340 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056339 ?auto_1056340 ) ( SURFACE-AT ?auto_1056337 ?auto_1056340 ) ( CLEAR ?auto_1056337 ) ( LIFTING ?auto_1056339 ?auto_1056338 ) ( IS-CRATE ?auto_1056338 ) ( not ( = ?auto_1056337 ?auto_1056338 ) ) ( ON ?auto_1056330 ?auto_1056329 ) ( ON ?auto_1056331 ?auto_1056330 ) ( ON ?auto_1056332 ?auto_1056331 ) ( ON ?auto_1056333 ?auto_1056332 ) ( ON ?auto_1056334 ?auto_1056333 ) ( ON ?auto_1056335 ?auto_1056334 ) ( ON ?auto_1056336 ?auto_1056335 ) ( ON ?auto_1056337 ?auto_1056336 ) ( not ( = ?auto_1056329 ?auto_1056330 ) ) ( not ( = ?auto_1056329 ?auto_1056331 ) ) ( not ( = ?auto_1056329 ?auto_1056332 ) ) ( not ( = ?auto_1056329 ?auto_1056333 ) ) ( not ( = ?auto_1056329 ?auto_1056334 ) ) ( not ( = ?auto_1056329 ?auto_1056335 ) ) ( not ( = ?auto_1056329 ?auto_1056336 ) ) ( not ( = ?auto_1056329 ?auto_1056337 ) ) ( not ( = ?auto_1056329 ?auto_1056338 ) ) ( not ( = ?auto_1056330 ?auto_1056331 ) ) ( not ( = ?auto_1056330 ?auto_1056332 ) ) ( not ( = ?auto_1056330 ?auto_1056333 ) ) ( not ( = ?auto_1056330 ?auto_1056334 ) ) ( not ( = ?auto_1056330 ?auto_1056335 ) ) ( not ( = ?auto_1056330 ?auto_1056336 ) ) ( not ( = ?auto_1056330 ?auto_1056337 ) ) ( not ( = ?auto_1056330 ?auto_1056338 ) ) ( not ( = ?auto_1056331 ?auto_1056332 ) ) ( not ( = ?auto_1056331 ?auto_1056333 ) ) ( not ( = ?auto_1056331 ?auto_1056334 ) ) ( not ( = ?auto_1056331 ?auto_1056335 ) ) ( not ( = ?auto_1056331 ?auto_1056336 ) ) ( not ( = ?auto_1056331 ?auto_1056337 ) ) ( not ( = ?auto_1056331 ?auto_1056338 ) ) ( not ( = ?auto_1056332 ?auto_1056333 ) ) ( not ( = ?auto_1056332 ?auto_1056334 ) ) ( not ( = ?auto_1056332 ?auto_1056335 ) ) ( not ( = ?auto_1056332 ?auto_1056336 ) ) ( not ( = ?auto_1056332 ?auto_1056337 ) ) ( not ( = ?auto_1056332 ?auto_1056338 ) ) ( not ( = ?auto_1056333 ?auto_1056334 ) ) ( not ( = ?auto_1056333 ?auto_1056335 ) ) ( not ( = ?auto_1056333 ?auto_1056336 ) ) ( not ( = ?auto_1056333 ?auto_1056337 ) ) ( not ( = ?auto_1056333 ?auto_1056338 ) ) ( not ( = ?auto_1056334 ?auto_1056335 ) ) ( not ( = ?auto_1056334 ?auto_1056336 ) ) ( not ( = ?auto_1056334 ?auto_1056337 ) ) ( not ( = ?auto_1056334 ?auto_1056338 ) ) ( not ( = ?auto_1056335 ?auto_1056336 ) ) ( not ( = ?auto_1056335 ?auto_1056337 ) ) ( not ( = ?auto_1056335 ?auto_1056338 ) ) ( not ( = ?auto_1056336 ?auto_1056337 ) ) ( not ( = ?auto_1056336 ?auto_1056338 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1056337 ?auto_1056338 )
      ( MAKE-9CRATE-VERIFY ?auto_1056329 ?auto_1056330 ?auto_1056331 ?auto_1056332 ?auto_1056333 ?auto_1056334 ?auto_1056335 ?auto_1056336 ?auto_1056337 ?auto_1056338 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056409 - SURFACE
      ?auto_1056410 - SURFACE
      ?auto_1056411 - SURFACE
      ?auto_1056412 - SURFACE
      ?auto_1056413 - SURFACE
      ?auto_1056414 - SURFACE
      ?auto_1056415 - SURFACE
      ?auto_1056416 - SURFACE
      ?auto_1056417 - SURFACE
      ?auto_1056418 - SURFACE
    )
    :vars
    (
      ?auto_1056421 - HOIST
      ?auto_1056419 - PLACE
      ?auto_1056420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056421 ?auto_1056419 ) ( SURFACE-AT ?auto_1056417 ?auto_1056419 ) ( CLEAR ?auto_1056417 ) ( IS-CRATE ?auto_1056418 ) ( not ( = ?auto_1056417 ?auto_1056418 ) ) ( TRUCK-AT ?auto_1056420 ?auto_1056419 ) ( AVAILABLE ?auto_1056421 ) ( IN ?auto_1056418 ?auto_1056420 ) ( ON ?auto_1056417 ?auto_1056416 ) ( not ( = ?auto_1056416 ?auto_1056417 ) ) ( not ( = ?auto_1056416 ?auto_1056418 ) ) ( ON ?auto_1056410 ?auto_1056409 ) ( ON ?auto_1056411 ?auto_1056410 ) ( ON ?auto_1056412 ?auto_1056411 ) ( ON ?auto_1056413 ?auto_1056412 ) ( ON ?auto_1056414 ?auto_1056413 ) ( ON ?auto_1056415 ?auto_1056414 ) ( ON ?auto_1056416 ?auto_1056415 ) ( not ( = ?auto_1056409 ?auto_1056410 ) ) ( not ( = ?auto_1056409 ?auto_1056411 ) ) ( not ( = ?auto_1056409 ?auto_1056412 ) ) ( not ( = ?auto_1056409 ?auto_1056413 ) ) ( not ( = ?auto_1056409 ?auto_1056414 ) ) ( not ( = ?auto_1056409 ?auto_1056415 ) ) ( not ( = ?auto_1056409 ?auto_1056416 ) ) ( not ( = ?auto_1056409 ?auto_1056417 ) ) ( not ( = ?auto_1056409 ?auto_1056418 ) ) ( not ( = ?auto_1056410 ?auto_1056411 ) ) ( not ( = ?auto_1056410 ?auto_1056412 ) ) ( not ( = ?auto_1056410 ?auto_1056413 ) ) ( not ( = ?auto_1056410 ?auto_1056414 ) ) ( not ( = ?auto_1056410 ?auto_1056415 ) ) ( not ( = ?auto_1056410 ?auto_1056416 ) ) ( not ( = ?auto_1056410 ?auto_1056417 ) ) ( not ( = ?auto_1056410 ?auto_1056418 ) ) ( not ( = ?auto_1056411 ?auto_1056412 ) ) ( not ( = ?auto_1056411 ?auto_1056413 ) ) ( not ( = ?auto_1056411 ?auto_1056414 ) ) ( not ( = ?auto_1056411 ?auto_1056415 ) ) ( not ( = ?auto_1056411 ?auto_1056416 ) ) ( not ( = ?auto_1056411 ?auto_1056417 ) ) ( not ( = ?auto_1056411 ?auto_1056418 ) ) ( not ( = ?auto_1056412 ?auto_1056413 ) ) ( not ( = ?auto_1056412 ?auto_1056414 ) ) ( not ( = ?auto_1056412 ?auto_1056415 ) ) ( not ( = ?auto_1056412 ?auto_1056416 ) ) ( not ( = ?auto_1056412 ?auto_1056417 ) ) ( not ( = ?auto_1056412 ?auto_1056418 ) ) ( not ( = ?auto_1056413 ?auto_1056414 ) ) ( not ( = ?auto_1056413 ?auto_1056415 ) ) ( not ( = ?auto_1056413 ?auto_1056416 ) ) ( not ( = ?auto_1056413 ?auto_1056417 ) ) ( not ( = ?auto_1056413 ?auto_1056418 ) ) ( not ( = ?auto_1056414 ?auto_1056415 ) ) ( not ( = ?auto_1056414 ?auto_1056416 ) ) ( not ( = ?auto_1056414 ?auto_1056417 ) ) ( not ( = ?auto_1056414 ?auto_1056418 ) ) ( not ( = ?auto_1056415 ?auto_1056416 ) ) ( not ( = ?auto_1056415 ?auto_1056417 ) ) ( not ( = ?auto_1056415 ?auto_1056418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056416 ?auto_1056417 ?auto_1056418 )
      ( MAKE-9CRATE-VERIFY ?auto_1056409 ?auto_1056410 ?auto_1056411 ?auto_1056412 ?auto_1056413 ?auto_1056414 ?auto_1056415 ?auto_1056416 ?auto_1056417 ?auto_1056418 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056499 - SURFACE
      ?auto_1056500 - SURFACE
      ?auto_1056501 - SURFACE
      ?auto_1056502 - SURFACE
      ?auto_1056503 - SURFACE
      ?auto_1056504 - SURFACE
      ?auto_1056505 - SURFACE
      ?auto_1056506 - SURFACE
      ?auto_1056507 - SURFACE
      ?auto_1056508 - SURFACE
    )
    :vars
    (
      ?auto_1056511 - HOIST
      ?auto_1056512 - PLACE
      ?auto_1056509 - TRUCK
      ?auto_1056510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056511 ?auto_1056512 ) ( SURFACE-AT ?auto_1056507 ?auto_1056512 ) ( CLEAR ?auto_1056507 ) ( IS-CRATE ?auto_1056508 ) ( not ( = ?auto_1056507 ?auto_1056508 ) ) ( AVAILABLE ?auto_1056511 ) ( IN ?auto_1056508 ?auto_1056509 ) ( ON ?auto_1056507 ?auto_1056506 ) ( not ( = ?auto_1056506 ?auto_1056507 ) ) ( not ( = ?auto_1056506 ?auto_1056508 ) ) ( TRUCK-AT ?auto_1056509 ?auto_1056510 ) ( not ( = ?auto_1056510 ?auto_1056512 ) ) ( ON ?auto_1056500 ?auto_1056499 ) ( ON ?auto_1056501 ?auto_1056500 ) ( ON ?auto_1056502 ?auto_1056501 ) ( ON ?auto_1056503 ?auto_1056502 ) ( ON ?auto_1056504 ?auto_1056503 ) ( ON ?auto_1056505 ?auto_1056504 ) ( ON ?auto_1056506 ?auto_1056505 ) ( not ( = ?auto_1056499 ?auto_1056500 ) ) ( not ( = ?auto_1056499 ?auto_1056501 ) ) ( not ( = ?auto_1056499 ?auto_1056502 ) ) ( not ( = ?auto_1056499 ?auto_1056503 ) ) ( not ( = ?auto_1056499 ?auto_1056504 ) ) ( not ( = ?auto_1056499 ?auto_1056505 ) ) ( not ( = ?auto_1056499 ?auto_1056506 ) ) ( not ( = ?auto_1056499 ?auto_1056507 ) ) ( not ( = ?auto_1056499 ?auto_1056508 ) ) ( not ( = ?auto_1056500 ?auto_1056501 ) ) ( not ( = ?auto_1056500 ?auto_1056502 ) ) ( not ( = ?auto_1056500 ?auto_1056503 ) ) ( not ( = ?auto_1056500 ?auto_1056504 ) ) ( not ( = ?auto_1056500 ?auto_1056505 ) ) ( not ( = ?auto_1056500 ?auto_1056506 ) ) ( not ( = ?auto_1056500 ?auto_1056507 ) ) ( not ( = ?auto_1056500 ?auto_1056508 ) ) ( not ( = ?auto_1056501 ?auto_1056502 ) ) ( not ( = ?auto_1056501 ?auto_1056503 ) ) ( not ( = ?auto_1056501 ?auto_1056504 ) ) ( not ( = ?auto_1056501 ?auto_1056505 ) ) ( not ( = ?auto_1056501 ?auto_1056506 ) ) ( not ( = ?auto_1056501 ?auto_1056507 ) ) ( not ( = ?auto_1056501 ?auto_1056508 ) ) ( not ( = ?auto_1056502 ?auto_1056503 ) ) ( not ( = ?auto_1056502 ?auto_1056504 ) ) ( not ( = ?auto_1056502 ?auto_1056505 ) ) ( not ( = ?auto_1056502 ?auto_1056506 ) ) ( not ( = ?auto_1056502 ?auto_1056507 ) ) ( not ( = ?auto_1056502 ?auto_1056508 ) ) ( not ( = ?auto_1056503 ?auto_1056504 ) ) ( not ( = ?auto_1056503 ?auto_1056505 ) ) ( not ( = ?auto_1056503 ?auto_1056506 ) ) ( not ( = ?auto_1056503 ?auto_1056507 ) ) ( not ( = ?auto_1056503 ?auto_1056508 ) ) ( not ( = ?auto_1056504 ?auto_1056505 ) ) ( not ( = ?auto_1056504 ?auto_1056506 ) ) ( not ( = ?auto_1056504 ?auto_1056507 ) ) ( not ( = ?auto_1056504 ?auto_1056508 ) ) ( not ( = ?auto_1056505 ?auto_1056506 ) ) ( not ( = ?auto_1056505 ?auto_1056507 ) ) ( not ( = ?auto_1056505 ?auto_1056508 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056506 ?auto_1056507 ?auto_1056508 )
      ( MAKE-9CRATE-VERIFY ?auto_1056499 ?auto_1056500 ?auto_1056501 ?auto_1056502 ?auto_1056503 ?auto_1056504 ?auto_1056505 ?auto_1056506 ?auto_1056507 ?auto_1056508 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056598 - SURFACE
      ?auto_1056599 - SURFACE
      ?auto_1056600 - SURFACE
      ?auto_1056601 - SURFACE
      ?auto_1056602 - SURFACE
      ?auto_1056603 - SURFACE
      ?auto_1056604 - SURFACE
      ?auto_1056605 - SURFACE
      ?auto_1056606 - SURFACE
      ?auto_1056607 - SURFACE
    )
    :vars
    (
      ?auto_1056609 - HOIST
      ?auto_1056612 - PLACE
      ?auto_1056611 - TRUCK
      ?auto_1056608 - PLACE
      ?auto_1056610 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056609 ?auto_1056612 ) ( SURFACE-AT ?auto_1056606 ?auto_1056612 ) ( CLEAR ?auto_1056606 ) ( IS-CRATE ?auto_1056607 ) ( not ( = ?auto_1056606 ?auto_1056607 ) ) ( AVAILABLE ?auto_1056609 ) ( ON ?auto_1056606 ?auto_1056605 ) ( not ( = ?auto_1056605 ?auto_1056606 ) ) ( not ( = ?auto_1056605 ?auto_1056607 ) ) ( TRUCK-AT ?auto_1056611 ?auto_1056608 ) ( not ( = ?auto_1056608 ?auto_1056612 ) ) ( HOIST-AT ?auto_1056610 ?auto_1056608 ) ( LIFTING ?auto_1056610 ?auto_1056607 ) ( not ( = ?auto_1056609 ?auto_1056610 ) ) ( ON ?auto_1056599 ?auto_1056598 ) ( ON ?auto_1056600 ?auto_1056599 ) ( ON ?auto_1056601 ?auto_1056600 ) ( ON ?auto_1056602 ?auto_1056601 ) ( ON ?auto_1056603 ?auto_1056602 ) ( ON ?auto_1056604 ?auto_1056603 ) ( ON ?auto_1056605 ?auto_1056604 ) ( not ( = ?auto_1056598 ?auto_1056599 ) ) ( not ( = ?auto_1056598 ?auto_1056600 ) ) ( not ( = ?auto_1056598 ?auto_1056601 ) ) ( not ( = ?auto_1056598 ?auto_1056602 ) ) ( not ( = ?auto_1056598 ?auto_1056603 ) ) ( not ( = ?auto_1056598 ?auto_1056604 ) ) ( not ( = ?auto_1056598 ?auto_1056605 ) ) ( not ( = ?auto_1056598 ?auto_1056606 ) ) ( not ( = ?auto_1056598 ?auto_1056607 ) ) ( not ( = ?auto_1056599 ?auto_1056600 ) ) ( not ( = ?auto_1056599 ?auto_1056601 ) ) ( not ( = ?auto_1056599 ?auto_1056602 ) ) ( not ( = ?auto_1056599 ?auto_1056603 ) ) ( not ( = ?auto_1056599 ?auto_1056604 ) ) ( not ( = ?auto_1056599 ?auto_1056605 ) ) ( not ( = ?auto_1056599 ?auto_1056606 ) ) ( not ( = ?auto_1056599 ?auto_1056607 ) ) ( not ( = ?auto_1056600 ?auto_1056601 ) ) ( not ( = ?auto_1056600 ?auto_1056602 ) ) ( not ( = ?auto_1056600 ?auto_1056603 ) ) ( not ( = ?auto_1056600 ?auto_1056604 ) ) ( not ( = ?auto_1056600 ?auto_1056605 ) ) ( not ( = ?auto_1056600 ?auto_1056606 ) ) ( not ( = ?auto_1056600 ?auto_1056607 ) ) ( not ( = ?auto_1056601 ?auto_1056602 ) ) ( not ( = ?auto_1056601 ?auto_1056603 ) ) ( not ( = ?auto_1056601 ?auto_1056604 ) ) ( not ( = ?auto_1056601 ?auto_1056605 ) ) ( not ( = ?auto_1056601 ?auto_1056606 ) ) ( not ( = ?auto_1056601 ?auto_1056607 ) ) ( not ( = ?auto_1056602 ?auto_1056603 ) ) ( not ( = ?auto_1056602 ?auto_1056604 ) ) ( not ( = ?auto_1056602 ?auto_1056605 ) ) ( not ( = ?auto_1056602 ?auto_1056606 ) ) ( not ( = ?auto_1056602 ?auto_1056607 ) ) ( not ( = ?auto_1056603 ?auto_1056604 ) ) ( not ( = ?auto_1056603 ?auto_1056605 ) ) ( not ( = ?auto_1056603 ?auto_1056606 ) ) ( not ( = ?auto_1056603 ?auto_1056607 ) ) ( not ( = ?auto_1056604 ?auto_1056605 ) ) ( not ( = ?auto_1056604 ?auto_1056606 ) ) ( not ( = ?auto_1056604 ?auto_1056607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056605 ?auto_1056606 ?auto_1056607 )
      ( MAKE-9CRATE-VERIFY ?auto_1056598 ?auto_1056599 ?auto_1056600 ?auto_1056601 ?auto_1056602 ?auto_1056603 ?auto_1056604 ?auto_1056605 ?auto_1056606 ?auto_1056607 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056706 - SURFACE
      ?auto_1056707 - SURFACE
      ?auto_1056708 - SURFACE
      ?auto_1056709 - SURFACE
      ?auto_1056710 - SURFACE
      ?auto_1056711 - SURFACE
      ?auto_1056712 - SURFACE
      ?auto_1056713 - SURFACE
      ?auto_1056714 - SURFACE
      ?auto_1056715 - SURFACE
    )
    :vars
    (
      ?auto_1056716 - HOIST
      ?auto_1056719 - PLACE
      ?auto_1056720 - TRUCK
      ?auto_1056721 - PLACE
      ?auto_1056717 - HOIST
      ?auto_1056718 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056716 ?auto_1056719 ) ( SURFACE-AT ?auto_1056714 ?auto_1056719 ) ( CLEAR ?auto_1056714 ) ( IS-CRATE ?auto_1056715 ) ( not ( = ?auto_1056714 ?auto_1056715 ) ) ( AVAILABLE ?auto_1056716 ) ( ON ?auto_1056714 ?auto_1056713 ) ( not ( = ?auto_1056713 ?auto_1056714 ) ) ( not ( = ?auto_1056713 ?auto_1056715 ) ) ( TRUCK-AT ?auto_1056720 ?auto_1056721 ) ( not ( = ?auto_1056721 ?auto_1056719 ) ) ( HOIST-AT ?auto_1056717 ?auto_1056721 ) ( not ( = ?auto_1056716 ?auto_1056717 ) ) ( AVAILABLE ?auto_1056717 ) ( SURFACE-AT ?auto_1056715 ?auto_1056721 ) ( ON ?auto_1056715 ?auto_1056718 ) ( CLEAR ?auto_1056715 ) ( not ( = ?auto_1056714 ?auto_1056718 ) ) ( not ( = ?auto_1056715 ?auto_1056718 ) ) ( not ( = ?auto_1056713 ?auto_1056718 ) ) ( ON ?auto_1056707 ?auto_1056706 ) ( ON ?auto_1056708 ?auto_1056707 ) ( ON ?auto_1056709 ?auto_1056708 ) ( ON ?auto_1056710 ?auto_1056709 ) ( ON ?auto_1056711 ?auto_1056710 ) ( ON ?auto_1056712 ?auto_1056711 ) ( ON ?auto_1056713 ?auto_1056712 ) ( not ( = ?auto_1056706 ?auto_1056707 ) ) ( not ( = ?auto_1056706 ?auto_1056708 ) ) ( not ( = ?auto_1056706 ?auto_1056709 ) ) ( not ( = ?auto_1056706 ?auto_1056710 ) ) ( not ( = ?auto_1056706 ?auto_1056711 ) ) ( not ( = ?auto_1056706 ?auto_1056712 ) ) ( not ( = ?auto_1056706 ?auto_1056713 ) ) ( not ( = ?auto_1056706 ?auto_1056714 ) ) ( not ( = ?auto_1056706 ?auto_1056715 ) ) ( not ( = ?auto_1056706 ?auto_1056718 ) ) ( not ( = ?auto_1056707 ?auto_1056708 ) ) ( not ( = ?auto_1056707 ?auto_1056709 ) ) ( not ( = ?auto_1056707 ?auto_1056710 ) ) ( not ( = ?auto_1056707 ?auto_1056711 ) ) ( not ( = ?auto_1056707 ?auto_1056712 ) ) ( not ( = ?auto_1056707 ?auto_1056713 ) ) ( not ( = ?auto_1056707 ?auto_1056714 ) ) ( not ( = ?auto_1056707 ?auto_1056715 ) ) ( not ( = ?auto_1056707 ?auto_1056718 ) ) ( not ( = ?auto_1056708 ?auto_1056709 ) ) ( not ( = ?auto_1056708 ?auto_1056710 ) ) ( not ( = ?auto_1056708 ?auto_1056711 ) ) ( not ( = ?auto_1056708 ?auto_1056712 ) ) ( not ( = ?auto_1056708 ?auto_1056713 ) ) ( not ( = ?auto_1056708 ?auto_1056714 ) ) ( not ( = ?auto_1056708 ?auto_1056715 ) ) ( not ( = ?auto_1056708 ?auto_1056718 ) ) ( not ( = ?auto_1056709 ?auto_1056710 ) ) ( not ( = ?auto_1056709 ?auto_1056711 ) ) ( not ( = ?auto_1056709 ?auto_1056712 ) ) ( not ( = ?auto_1056709 ?auto_1056713 ) ) ( not ( = ?auto_1056709 ?auto_1056714 ) ) ( not ( = ?auto_1056709 ?auto_1056715 ) ) ( not ( = ?auto_1056709 ?auto_1056718 ) ) ( not ( = ?auto_1056710 ?auto_1056711 ) ) ( not ( = ?auto_1056710 ?auto_1056712 ) ) ( not ( = ?auto_1056710 ?auto_1056713 ) ) ( not ( = ?auto_1056710 ?auto_1056714 ) ) ( not ( = ?auto_1056710 ?auto_1056715 ) ) ( not ( = ?auto_1056710 ?auto_1056718 ) ) ( not ( = ?auto_1056711 ?auto_1056712 ) ) ( not ( = ?auto_1056711 ?auto_1056713 ) ) ( not ( = ?auto_1056711 ?auto_1056714 ) ) ( not ( = ?auto_1056711 ?auto_1056715 ) ) ( not ( = ?auto_1056711 ?auto_1056718 ) ) ( not ( = ?auto_1056712 ?auto_1056713 ) ) ( not ( = ?auto_1056712 ?auto_1056714 ) ) ( not ( = ?auto_1056712 ?auto_1056715 ) ) ( not ( = ?auto_1056712 ?auto_1056718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056713 ?auto_1056714 ?auto_1056715 )
      ( MAKE-9CRATE-VERIFY ?auto_1056706 ?auto_1056707 ?auto_1056708 ?auto_1056709 ?auto_1056710 ?auto_1056711 ?auto_1056712 ?auto_1056713 ?auto_1056714 ?auto_1056715 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056815 - SURFACE
      ?auto_1056816 - SURFACE
      ?auto_1056817 - SURFACE
      ?auto_1056818 - SURFACE
      ?auto_1056819 - SURFACE
      ?auto_1056820 - SURFACE
      ?auto_1056821 - SURFACE
      ?auto_1056822 - SURFACE
      ?auto_1056823 - SURFACE
      ?auto_1056824 - SURFACE
    )
    :vars
    (
      ?auto_1056828 - HOIST
      ?auto_1056826 - PLACE
      ?auto_1056827 - PLACE
      ?auto_1056830 - HOIST
      ?auto_1056829 - SURFACE
      ?auto_1056825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056828 ?auto_1056826 ) ( SURFACE-AT ?auto_1056823 ?auto_1056826 ) ( CLEAR ?auto_1056823 ) ( IS-CRATE ?auto_1056824 ) ( not ( = ?auto_1056823 ?auto_1056824 ) ) ( AVAILABLE ?auto_1056828 ) ( ON ?auto_1056823 ?auto_1056822 ) ( not ( = ?auto_1056822 ?auto_1056823 ) ) ( not ( = ?auto_1056822 ?auto_1056824 ) ) ( not ( = ?auto_1056827 ?auto_1056826 ) ) ( HOIST-AT ?auto_1056830 ?auto_1056827 ) ( not ( = ?auto_1056828 ?auto_1056830 ) ) ( AVAILABLE ?auto_1056830 ) ( SURFACE-AT ?auto_1056824 ?auto_1056827 ) ( ON ?auto_1056824 ?auto_1056829 ) ( CLEAR ?auto_1056824 ) ( not ( = ?auto_1056823 ?auto_1056829 ) ) ( not ( = ?auto_1056824 ?auto_1056829 ) ) ( not ( = ?auto_1056822 ?auto_1056829 ) ) ( TRUCK-AT ?auto_1056825 ?auto_1056826 ) ( ON ?auto_1056816 ?auto_1056815 ) ( ON ?auto_1056817 ?auto_1056816 ) ( ON ?auto_1056818 ?auto_1056817 ) ( ON ?auto_1056819 ?auto_1056818 ) ( ON ?auto_1056820 ?auto_1056819 ) ( ON ?auto_1056821 ?auto_1056820 ) ( ON ?auto_1056822 ?auto_1056821 ) ( not ( = ?auto_1056815 ?auto_1056816 ) ) ( not ( = ?auto_1056815 ?auto_1056817 ) ) ( not ( = ?auto_1056815 ?auto_1056818 ) ) ( not ( = ?auto_1056815 ?auto_1056819 ) ) ( not ( = ?auto_1056815 ?auto_1056820 ) ) ( not ( = ?auto_1056815 ?auto_1056821 ) ) ( not ( = ?auto_1056815 ?auto_1056822 ) ) ( not ( = ?auto_1056815 ?auto_1056823 ) ) ( not ( = ?auto_1056815 ?auto_1056824 ) ) ( not ( = ?auto_1056815 ?auto_1056829 ) ) ( not ( = ?auto_1056816 ?auto_1056817 ) ) ( not ( = ?auto_1056816 ?auto_1056818 ) ) ( not ( = ?auto_1056816 ?auto_1056819 ) ) ( not ( = ?auto_1056816 ?auto_1056820 ) ) ( not ( = ?auto_1056816 ?auto_1056821 ) ) ( not ( = ?auto_1056816 ?auto_1056822 ) ) ( not ( = ?auto_1056816 ?auto_1056823 ) ) ( not ( = ?auto_1056816 ?auto_1056824 ) ) ( not ( = ?auto_1056816 ?auto_1056829 ) ) ( not ( = ?auto_1056817 ?auto_1056818 ) ) ( not ( = ?auto_1056817 ?auto_1056819 ) ) ( not ( = ?auto_1056817 ?auto_1056820 ) ) ( not ( = ?auto_1056817 ?auto_1056821 ) ) ( not ( = ?auto_1056817 ?auto_1056822 ) ) ( not ( = ?auto_1056817 ?auto_1056823 ) ) ( not ( = ?auto_1056817 ?auto_1056824 ) ) ( not ( = ?auto_1056817 ?auto_1056829 ) ) ( not ( = ?auto_1056818 ?auto_1056819 ) ) ( not ( = ?auto_1056818 ?auto_1056820 ) ) ( not ( = ?auto_1056818 ?auto_1056821 ) ) ( not ( = ?auto_1056818 ?auto_1056822 ) ) ( not ( = ?auto_1056818 ?auto_1056823 ) ) ( not ( = ?auto_1056818 ?auto_1056824 ) ) ( not ( = ?auto_1056818 ?auto_1056829 ) ) ( not ( = ?auto_1056819 ?auto_1056820 ) ) ( not ( = ?auto_1056819 ?auto_1056821 ) ) ( not ( = ?auto_1056819 ?auto_1056822 ) ) ( not ( = ?auto_1056819 ?auto_1056823 ) ) ( not ( = ?auto_1056819 ?auto_1056824 ) ) ( not ( = ?auto_1056819 ?auto_1056829 ) ) ( not ( = ?auto_1056820 ?auto_1056821 ) ) ( not ( = ?auto_1056820 ?auto_1056822 ) ) ( not ( = ?auto_1056820 ?auto_1056823 ) ) ( not ( = ?auto_1056820 ?auto_1056824 ) ) ( not ( = ?auto_1056820 ?auto_1056829 ) ) ( not ( = ?auto_1056821 ?auto_1056822 ) ) ( not ( = ?auto_1056821 ?auto_1056823 ) ) ( not ( = ?auto_1056821 ?auto_1056824 ) ) ( not ( = ?auto_1056821 ?auto_1056829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056822 ?auto_1056823 ?auto_1056824 )
      ( MAKE-9CRATE-VERIFY ?auto_1056815 ?auto_1056816 ?auto_1056817 ?auto_1056818 ?auto_1056819 ?auto_1056820 ?auto_1056821 ?auto_1056822 ?auto_1056823 ?auto_1056824 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1056924 - SURFACE
      ?auto_1056925 - SURFACE
      ?auto_1056926 - SURFACE
      ?auto_1056927 - SURFACE
      ?auto_1056928 - SURFACE
      ?auto_1056929 - SURFACE
      ?auto_1056930 - SURFACE
      ?auto_1056931 - SURFACE
      ?auto_1056932 - SURFACE
      ?auto_1056933 - SURFACE
    )
    :vars
    (
      ?auto_1056935 - HOIST
      ?auto_1056937 - PLACE
      ?auto_1056939 - PLACE
      ?auto_1056936 - HOIST
      ?auto_1056934 - SURFACE
      ?auto_1056938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056935 ?auto_1056937 ) ( IS-CRATE ?auto_1056933 ) ( not ( = ?auto_1056932 ?auto_1056933 ) ) ( not ( = ?auto_1056931 ?auto_1056932 ) ) ( not ( = ?auto_1056931 ?auto_1056933 ) ) ( not ( = ?auto_1056939 ?auto_1056937 ) ) ( HOIST-AT ?auto_1056936 ?auto_1056939 ) ( not ( = ?auto_1056935 ?auto_1056936 ) ) ( AVAILABLE ?auto_1056936 ) ( SURFACE-AT ?auto_1056933 ?auto_1056939 ) ( ON ?auto_1056933 ?auto_1056934 ) ( CLEAR ?auto_1056933 ) ( not ( = ?auto_1056932 ?auto_1056934 ) ) ( not ( = ?auto_1056933 ?auto_1056934 ) ) ( not ( = ?auto_1056931 ?auto_1056934 ) ) ( TRUCK-AT ?auto_1056938 ?auto_1056937 ) ( SURFACE-AT ?auto_1056931 ?auto_1056937 ) ( CLEAR ?auto_1056931 ) ( LIFTING ?auto_1056935 ?auto_1056932 ) ( IS-CRATE ?auto_1056932 ) ( ON ?auto_1056925 ?auto_1056924 ) ( ON ?auto_1056926 ?auto_1056925 ) ( ON ?auto_1056927 ?auto_1056926 ) ( ON ?auto_1056928 ?auto_1056927 ) ( ON ?auto_1056929 ?auto_1056928 ) ( ON ?auto_1056930 ?auto_1056929 ) ( ON ?auto_1056931 ?auto_1056930 ) ( not ( = ?auto_1056924 ?auto_1056925 ) ) ( not ( = ?auto_1056924 ?auto_1056926 ) ) ( not ( = ?auto_1056924 ?auto_1056927 ) ) ( not ( = ?auto_1056924 ?auto_1056928 ) ) ( not ( = ?auto_1056924 ?auto_1056929 ) ) ( not ( = ?auto_1056924 ?auto_1056930 ) ) ( not ( = ?auto_1056924 ?auto_1056931 ) ) ( not ( = ?auto_1056924 ?auto_1056932 ) ) ( not ( = ?auto_1056924 ?auto_1056933 ) ) ( not ( = ?auto_1056924 ?auto_1056934 ) ) ( not ( = ?auto_1056925 ?auto_1056926 ) ) ( not ( = ?auto_1056925 ?auto_1056927 ) ) ( not ( = ?auto_1056925 ?auto_1056928 ) ) ( not ( = ?auto_1056925 ?auto_1056929 ) ) ( not ( = ?auto_1056925 ?auto_1056930 ) ) ( not ( = ?auto_1056925 ?auto_1056931 ) ) ( not ( = ?auto_1056925 ?auto_1056932 ) ) ( not ( = ?auto_1056925 ?auto_1056933 ) ) ( not ( = ?auto_1056925 ?auto_1056934 ) ) ( not ( = ?auto_1056926 ?auto_1056927 ) ) ( not ( = ?auto_1056926 ?auto_1056928 ) ) ( not ( = ?auto_1056926 ?auto_1056929 ) ) ( not ( = ?auto_1056926 ?auto_1056930 ) ) ( not ( = ?auto_1056926 ?auto_1056931 ) ) ( not ( = ?auto_1056926 ?auto_1056932 ) ) ( not ( = ?auto_1056926 ?auto_1056933 ) ) ( not ( = ?auto_1056926 ?auto_1056934 ) ) ( not ( = ?auto_1056927 ?auto_1056928 ) ) ( not ( = ?auto_1056927 ?auto_1056929 ) ) ( not ( = ?auto_1056927 ?auto_1056930 ) ) ( not ( = ?auto_1056927 ?auto_1056931 ) ) ( not ( = ?auto_1056927 ?auto_1056932 ) ) ( not ( = ?auto_1056927 ?auto_1056933 ) ) ( not ( = ?auto_1056927 ?auto_1056934 ) ) ( not ( = ?auto_1056928 ?auto_1056929 ) ) ( not ( = ?auto_1056928 ?auto_1056930 ) ) ( not ( = ?auto_1056928 ?auto_1056931 ) ) ( not ( = ?auto_1056928 ?auto_1056932 ) ) ( not ( = ?auto_1056928 ?auto_1056933 ) ) ( not ( = ?auto_1056928 ?auto_1056934 ) ) ( not ( = ?auto_1056929 ?auto_1056930 ) ) ( not ( = ?auto_1056929 ?auto_1056931 ) ) ( not ( = ?auto_1056929 ?auto_1056932 ) ) ( not ( = ?auto_1056929 ?auto_1056933 ) ) ( not ( = ?auto_1056929 ?auto_1056934 ) ) ( not ( = ?auto_1056930 ?auto_1056931 ) ) ( not ( = ?auto_1056930 ?auto_1056932 ) ) ( not ( = ?auto_1056930 ?auto_1056933 ) ) ( not ( = ?auto_1056930 ?auto_1056934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1056931 ?auto_1056932 ?auto_1056933 )
      ( MAKE-9CRATE-VERIFY ?auto_1056924 ?auto_1056925 ?auto_1056926 ?auto_1056927 ?auto_1056928 ?auto_1056929 ?auto_1056930 ?auto_1056931 ?auto_1056932 ?auto_1056933 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1057033 - SURFACE
      ?auto_1057034 - SURFACE
      ?auto_1057035 - SURFACE
      ?auto_1057036 - SURFACE
      ?auto_1057037 - SURFACE
      ?auto_1057038 - SURFACE
      ?auto_1057039 - SURFACE
      ?auto_1057040 - SURFACE
      ?auto_1057041 - SURFACE
      ?auto_1057042 - SURFACE
    )
    :vars
    (
      ?auto_1057048 - HOIST
      ?auto_1057047 - PLACE
      ?auto_1057044 - PLACE
      ?auto_1057043 - HOIST
      ?auto_1057045 - SURFACE
      ?auto_1057046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057048 ?auto_1057047 ) ( IS-CRATE ?auto_1057042 ) ( not ( = ?auto_1057041 ?auto_1057042 ) ) ( not ( = ?auto_1057040 ?auto_1057041 ) ) ( not ( = ?auto_1057040 ?auto_1057042 ) ) ( not ( = ?auto_1057044 ?auto_1057047 ) ) ( HOIST-AT ?auto_1057043 ?auto_1057044 ) ( not ( = ?auto_1057048 ?auto_1057043 ) ) ( AVAILABLE ?auto_1057043 ) ( SURFACE-AT ?auto_1057042 ?auto_1057044 ) ( ON ?auto_1057042 ?auto_1057045 ) ( CLEAR ?auto_1057042 ) ( not ( = ?auto_1057041 ?auto_1057045 ) ) ( not ( = ?auto_1057042 ?auto_1057045 ) ) ( not ( = ?auto_1057040 ?auto_1057045 ) ) ( TRUCK-AT ?auto_1057046 ?auto_1057047 ) ( SURFACE-AT ?auto_1057040 ?auto_1057047 ) ( CLEAR ?auto_1057040 ) ( IS-CRATE ?auto_1057041 ) ( AVAILABLE ?auto_1057048 ) ( IN ?auto_1057041 ?auto_1057046 ) ( ON ?auto_1057034 ?auto_1057033 ) ( ON ?auto_1057035 ?auto_1057034 ) ( ON ?auto_1057036 ?auto_1057035 ) ( ON ?auto_1057037 ?auto_1057036 ) ( ON ?auto_1057038 ?auto_1057037 ) ( ON ?auto_1057039 ?auto_1057038 ) ( ON ?auto_1057040 ?auto_1057039 ) ( not ( = ?auto_1057033 ?auto_1057034 ) ) ( not ( = ?auto_1057033 ?auto_1057035 ) ) ( not ( = ?auto_1057033 ?auto_1057036 ) ) ( not ( = ?auto_1057033 ?auto_1057037 ) ) ( not ( = ?auto_1057033 ?auto_1057038 ) ) ( not ( = ?auto_1057033 ?auto_1057039 ) ) ( not ( = ?auto_1057033 ?auto_1057040 ) ) ( not ( = ?auto_1057033 ?auto_1057041 ) ) ( not ( = ?auto_1057033 ?auto_1057042 ) ) ( not ( = ?auto_1057033 ?auto_1057045 ) ) ( not ( = ?auto_1057034 ?auto_1057035 ) ) ( not ( = ?auto_1057034 ?auto_1057036 ) ) ( not ( = ?auto_1057034 ?auto_1057037 ) ) ( not ( = ?auto_1057034 ?auto_1057038 ) ) ( not ( = ?auto_1057034 ?auto_1057039 ) ) ( not ( = ?auto_1057034 ?auto_1057040 ) ) ( not ( = ?auto_1057034 ?auto_1057041 ) ) ( not ( = ?auto_1057034 ?auto_1057042 ) ) ( not ( = ?auto_1057034 ?auto_1057045 ) ) ( not ( = ?auto_1057035 ?auto_1057036 ) ) ( not ( = ?auto_1057035 ?auto_1057037 ) ) ( not ( = ?auto_1057035 ?auto_1057038 ) ) ( not ( = ?auto_1057035 ?auto_1057039 ) ) ( not ( = ?auto_1057035 ?auto_1057040 ) ) ( not ( = ?auto_1057035 ?auto_1057041 ) ) ( not ( = ?auto_1057035 ?auto_1057042 ) ) ( not ( = ?auto_1057035 ?auto_1057045 ) ) ( not ( = ?auto_1057036 ?auto_1057037 ) ) ( not ( = ?auto_1057036 ?auto_1057038 ) ) ( not ( = ?auto_1057036 ?auto_1057039 ) ) ( not ( = ?auto_1057036 ?auto_1057040 ) ) ( not ( = ?auto_1057036 ?auto_1057041 ) ) ( not ( = ?auto_1057036 ?auto_1057042 ) ) ( not ( = ?auto_1057036 ?auto_1057045 ) ) ( not ( = ?auto_1057037 ?auto_1057038 ) ) ( not ( = ?auto_1057037 ?auto_1057039 ) ) ( not ( = ?auto_1057037 ?auto_1057040 ) ) ( not ( = ?auto_1057037 ?auto_1057041 ) ) ( not ( = ?auto_1057037 ?auto_1057042 ) ) ( not ( = ?auto_1057037 ?auto_1057045 ) ) ( not ( = ?auto_1057038 ?auto_1057039 ) ) ( not ( = ?auto_1057038 ?auto_1057040 ) ) ( not ( = ?auto_1057038 ?auto_1057041 ) ) ( not ( = ?auto_1057038 ?auto_1057042 ) ) ( not ( = ?auto_1057038 ?auto_1057045 ) ) ( not ( = ?auto_1057039 ?auto_1057040 ) ) ( not ( = ?auto_1057039 ?auto_1057041 ) ) ( not ( = ?auto_1057039 ?auto_1057042 ) ) ( not ( = ?auto_1057039 ?auto_1057045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1057040 ?auto_1057041 ?auto_1057042 )
      ( MAKE-9CRATE-VERIFY ?auto_1057033 ?auto_1057034 ?auto_1057035 ?auto_1057036 ?auto_1057037 ?auto_1057038 ?auto_1057039 ?auto_1057040 ?auto_1057041 ?auto_1057042 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1057851 - SURFACE
      ?auto_1057852 - SURFACE
    )
    :vars
    (
      ?auto_1057858 - HOIST
      ?auto_1057857 - PLACE
      ?auto_1057855 - SURFACE
      ?auto_1057853 - PLACE
      ?auto_1057859 - HOIST
      ?auto_1057856 - SURFACE
      ?auto_1057854 - TRUCK
      ?auto_1057860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1057858 ?auto_1057857 ) ( SURFACE-AT ?auto_1057851 ?auto_1057857 ) ( CLEAR ?auto_1057851 ) ( IS-CRATE ?auto_1057852 ) ( not ( = ?auto_1057851 ?auto_1057852 ) ) ( ON ?auto_1057851 ?auto_1057855 ) ( not ( = ?auto_1057855 ?auto_1057851 ) ) ( not ( = ?auto_1057855 ?auto_1057852 ) ) ( not ( = ?auto_1057853 ?auto_1057857 ) ) ( HOIST-AT ?auto_1057859 ?auto_1057853 ) ( not ( = ?auto_1057858 ?auto_1057859 ) ) ( AVAILABLE ?auto_1057859 ) ( SURFACE-AT ?auto_1057852 ?auto_1057853 ) ( ON ?auto_1057852 ?auto_1057856 ) ( CLEAR ?auto_1057852 ) ( not ( = ?auto_1057851 ?auto_1057856 ) ) ( not ( = ?auto_1057852 ?auto_1057856 ) ) ( not ( = ?auto_1057855 ?auto_1057856 ) ) ( TRUCK-AT ?auto_1057854 ?auto_1057857 ) ( LIFTING ?auto_1057858 ?auto_1057860 ) ( IS-CRATE ?auto_1057860 ) ( not ( = ?auto_1057851 ?auto_1057860 ) ) ( not ( = ?auto_1057852 ?auto_1057860 ) ) ( not ( = ?auto_1057855 ?auto_1057860 ) ) ( not ( = ?auto_1057856 ?auto_1057860 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1057858 ?auto_1057860 ?auto_1057854 ?auto_1057857 )
      ( MAKE-1CRATE ?auto_1057851 ?auto_1057852 )
      ( MAKE-1CRATE-VERIFY ?auto_1057851 ?auto_1057852 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062582 - SURFACE
      ?auto_1062583 - SURFACE
      ?auto_1062584 - SURFACE
      ?auto_1062585 - SURFACE
      ?auto_1062586 - SURFACE
      ?auto_1062587 - SURFACE
      ?auto_1062588 - SURFACE
      ?auto_1062589 - SURFACE
      ?auto_1062590 - SURFACE
      ?auto_1062591 - SURFACE
      ?auto_1062592 - SURFACE
    )
    :vars
    (
      ?auto_1062593 - HOIST
      ?auto_1062594 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062593 ?auto_1062594 ) ( SURFACE-AT ?auto_1062591 ?auto_1062594 ) ( CLEAR ?auto_1062591 ) ( LIFTING ?auto_1062593 ?auto_1062592 ) ( IS-CRATE ?auto_1062592 ) ( not ( = ?auto_1062591 ?auto_1062592 ) ) ( ON ?auto_1062583 ?auto_1062582 ) ( ON ?auto_1062584 ?auto_1062583 ) ( ON ?auto_1062585 ?auto_1062584 ) ( ON ?auto_1062586 ?auto_1062585 ) ( ON ?auto_1062587 ?auto_1062586 ) ( ON ?auto_1062588 ?auto_1062587 ) ( ON ?auto_1062589 ?auto_1062588 ) ( ON ?auto_1062590 ?auto_1062589 ) ( ON ?auto_1062591 ?auto_1062590 ) ( not ( = ?auto_1062582 ?auto_1062583 ) ) ( not ( = ?auto_1062582 ?auto_1062584 ) ) ( not ( = ?auto_1062582 ?auto_1062585 ) ) ( not ( = ?auto_1062582 ?auto_1062586 ) ) ( not ( = ?auto_1062582 ?auto_1062587 ) ) ( not ( = ?auto_1062582 ?auto_1062588 ) ) ( not ( = ?auto_1062582 ?auto_1062589 ) ) ( not ( = ?auto_1062582 ?auto_1062590 ) ) ( not ( = ?auto_1062582 ?auto_1062591 ) ) ( not ( = ?auto_1062582 ?auto_1062592 ) ) ( not ( = ?auto_1062583 ?auto_1062584 ) ) ( not ( = ?auto_1062583 ?auto_1062585 ) ) ( not ( = ?auto_1062583 ?auto_1062586 ) ) ( not ( = ?auto_1062583 ?auto_1062587 ) ) ( not ( = ?auto_1062583 ?auto_1062588 ) ) ( not ( = ?auto_1062583 ?auto_1062589 ) ) ( not ( = ?auto_1062583 ?auto_1062590 ) ) ( not ( = ?auto_1062583 ?auto_1062591 ) ) ( not ( = ?auto_1062583 ?auto_1062592 ) ) ( not ( = ?auto_1062584 ?auto_1062585 ) ) ( not ( = ?auto_1062584 ?auto_1062586 ) ) ( not ( = ?auto_1062584 ?auto_1062587 ) ) ( not ( = ?auto_1062584 ?auto_1062588 ) ) ( not ( = ?auto_1062584 ?auto_1062589 ) ) ( not ( = ?auto_1062584 ?auto_1062590 ) ) ( not ( = ?auto_1062584 ?auto_1062591 ) ) ( not ( = ?auto_1062584 ?auto_1062592 ) ) ( not ( = ?auto_1062585 ?auto_1062586 ) ) ( not ( = ?auto_1062585 ?auto_1062587 ) ) ( not ( = ?auto_1062585 ?auto_1062588 ) ) ( not ( = ?auto_1062585 ?auto_1062589 ) ) ( not ( = ?auto_1062585 ?auto_1062590 ) ) ( not ( = ?auto_1062585 ?auto_1062591 ) ) ( not ( = ?auto_1062585 ?auto_1062592 ) ) ( not ( = ?auto_1062586 ?auto_1062587 ) ) ( not ( = ?auto_1062586 ?auto_1062588 ) ) ( not ( = ?auto_1062586 ?auto_1062589 ) ) ( not ( = ?auto_1062586 ?auto_1062590 ) ) ( not ( = ?auto_1062586 ?auto_1062591 ) ) ( not ( = ?auto_1062586 ?auto_1062592 ) ) ( not ( = ?auto_1062587 ?auto_1062588 ) ) ( not ( = ?auto_1062587 ?auto_1062589 ) ) ( not ( = ?auto_1062587 ?auto_1062590 ) ) ( not ( = ?auto_1062587 ?auto_1062591 ) ) ( not ( = ?auto_1062587 ?auto_1062592 ) ) ( not ( = ?auto_1062588 ?auto_1062589 ) ) ( not ( = ?auto_1062588 ?auto_1062590 ) ) ( not ( = ?auto_1062588 ?auto_1062591 ) ) ( not ( = ?auto_1062588 ?auto_1062592 ) ) ( not ( = ?auto_1062589 ?auto_1062590 ) ) ( not ( = ?auto_1062589 ?auto_1062591 ) ) ( not ( = ?auto_1062589 ?auto_1062592 ) ) ( not ( = ?auto_1062590 ?auto_1062591 ) ) ( not ( = ?auto_1062590 ?auto_1062592 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1062591 ?auto_1062592 )
      ( MAKE-10CRATE-VERIFY ?auto_1062582 ?auto_1062583 ?auto_1062584 ?auto_1062585 ?auto_1062586 ?auto_1062587 ?auto_1062588 ?auto_1062589 ?auto_1062590 ?auto_1062591 ?auto_1062592 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062676 - SURFACE
      ?auto_1062677 - SURFACE
      ?auto_1062678 - SURFACE
      ?auto_1062679 - SURFACE
      ?auto_1062680 - SURFACE
      ?auto_1062681 - SURFACE
      ?auto_1062682 - SURFACE
      ?auto_1062683 - SURFACE
      ?auto_1062684 - SURFACE
      ?auto_1062685 - SURFACE
      ?auto_1062686 - SURFACE
    )
    :vars
    (
      ?auto_1062689 - HOIST
      ?auto_1062688 - PLACE
      ?auto_1062687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062689 ?auto_1062688 ) ( SURFACE-AT ?auto_1062685 ?auto_1062688 ) ( CLEAR ?auto_1062685 ) ( IS-CRATE ?auto_1062686 ) ( not ( = ?auto_1062685 ?auto_1062686 ) ) ( TRUCK-AT ?auto_1062687 ?auto_1062688 ) ( AVAILABLE ?auto_1062689 ) ( IN ?auto_1062686 ?auto_1062687 ) ( ON ?auto_1062685 ?auto_1062684 ) ( not ( = ?auto_1062684 ?auto_1062685 ) ) ( not ( = ?auto_1062684 ?auto_1062686 ) ) ( ON ?auto_1062677 ?auto_1062676 ) ( ON ?auto_1062678 ?auto_1062677 ) ( ON ?auto_1062679 ?auto_1062678 ) ( ON ?auto_1062680 ?auto_1062679 ) ( ON ?auto_1062681 ?auto_1062680 ) ( ON ?auto_1062682 ?auto_1062681 ) ( ON ?auto_1062683 ?auto_1062682 ) ( ON ?auto_1062684 ?auto_1062683 ) ( not ( = ?auto_1062676 ?auto_1062677 ) ) ( not ( = ?auto_1062676 ?auto_1062678 ) ) ( not ( = ?auto_1062676 ?auto_1062679 ) ) ( not ( = ?auto_1062676 ?auto_1062680 ) ) ( not ( = ?auto_1062676 ?auto_1062681 ) ) ( not ( = ?auto_1062676 ?auto_1062682 ) ) ( not ( = ?auto_1062676 ?auto_1062683 ) ) ( not ( = ?auto_1062676 ?auto_1062684 ) ) ( not ( = ?auto_1062676 ?auto_1062685 ) ) ( not ( = ?auto_1062676 ?auto_1062686 ) ) ( not ( = ?auto_1062677 ?auto_1062678 ) ) ( not ( = ?auto_1062677 ?auto_1062679 ) ) ( not ( = ?auto_1062677 ?auto_1062680 ) ) ( not ( = ?auto_1062677 ?auto_1062681 ) ) ( not ( = ?auto_1062677 ?auto_1062682 ) ) ( not ( = ?auto_1062677 ?auto_1062683 ) ) ( not ( = ?auto_1062677 ?auto_1062684 ) ) ( not ( = ?auto_1062677 ?auto_1062685 ) ) ( not ( = ?auto_1062677 ?auto_1062686 ) ) ( not ( = ?auto_1062678 ?auto_1062679 ) ) ( not ( = ?auto_1062678 ?auto_1062680 ) ) ( not ( = ?auto_1062678 ?auto_1062681 ) ) ( not ( = ?auto_1062678 ?auto_1062682 ) ) ( not ( = ?auto_1062678 ?auto_1062683 ) ) ( not ( = ?auto_1062678 ?auto_1062684 ) ) ( not ( = ?auto_1062678 ?auto_1062685 ) ) ( not ( = ?auto_1062678 ?auto_1062686 ) ) ( not ( = ?auto_1062679 ?auto_1062680 ) ) ( not ( = ?auto_1062679 ?auto_1062681 ) ) ( not ( = ?auto_1062679 ?auto_1062682 ) ) ( not ( = ?auto_1062679 ?auto_1062683 ) ) ( not ( = ?auto_1062679 ?auto_1062684 ) ) ( not ( = ?auto_1062679 ?auto_1062685 ) ) ( not ( = ?auto_1062679 ?auto_1062686 ) ) ( not ( = ?auto_1062680 ?auto_1062681 ) ) ( not ( = ?auto_1062680 ?auto_1062682 ) ) ( not ( = ?auto_1062680 ?auto_1062683 ) ) ( not ( = ?auto_1062680 ?auto_1062684 ) ) ( not ( = ?auto_1062680 ?auto_1062685 ) ) ( not ( = ?auto_1062680 ?auto_1062686 ) ) ( not ( = ?auto_1062681 ?auto_1062682 ) ) ( not ( = ?auto_1062681 ?auto_1062683 ) ) ( not ( = ?auto_1062681 ?auto_1062684 ) ) ( not ( = ?auto_1062681 ?auto_1062685 ) ) ( not ( = ?auto_1062681 ?auto_1062686 ) ) ( not ( = ?auto_1062682 ?auto_1062683 ) ) ( not ( = ?auto_1062682 ?auto_1062684 ) ) ( not ( = ?auto_1062682 ?auto_1062685 ) ) ( not ( = ?auto_1062682 ?auto_1062686 ) ) ( not ( = ?auto_1062683 ?auto_1062684 ) ) ( not ( = ?auto_1062683 ?auto_1062685 ) ) ( not ( = ?auto_1062683 ?auto_1062686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1062684 ?auto_1062685 ?auto_1062686 )
      ( MAKE-10CRATE-VERIFY ?auto_1062676 ?auto_1062677 ?auto_1062678 ?auto_1062679 ?auto_1062680 ?auto_1062681 ?auto_1062682 ?auto_1062683 ?auto_1062684 ?auto_1062685 ?auto_1062686 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062781 - SURFACE
      ?auto_1062782 - SURFACE
      ?auto_1062783 - SURFACE
      ?auto_1062784 - SURFACE
      ?auto_1062785 - SURFACE
      ?auto_1062786 - SURFACE
      ?auto_1062787 - SURFACE
      ?auto_1062788 - SURFACE
      ?auto_1062789 - SURFACE
      ?auto_1062790 - SURFACE
      ?auto_1062791 - SURFACE
    )
    :vars
    (
      ?auto_1062794 - HOIST
      ?auto_1062793 - PLACE
      ?auto_1062795 - TRUCK
      ?auto_1062792 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062794 ?auto_1062793 ) ( SURFACE-AT ?auto_1062790 ?auto_1062793 ) ( CLEAR ?auto_1062790 ) ( IS-CRATE ?auto_1062791 ) ( not ( = ?auto_1062790 ?auto_1062791 ) ) ( AVAILABLE ?auto_1062794 ) ( IN ?auto_1062791 ?auto_1062795 ) ( ON ?auto_1062790 ?auto_1062789 ) ( not ( = ?auto_1062789 ?auto_1062790 ) ) ( not ( = ?auto_1062789 ?auto_1062791 ) ) ( TRUCK-AT ?auto_1062795 ?auto_1062792 ) ( not ( = ?auto_1062792 ?auto_1062793 ) ) ( ON ?auto_1062782 ?auto_1062781 ) ( ON ?auto_1062783 ?auto_1062782 ) ( ON ?auto_1062784 ?auto_1062783 ) ( ON ?auto_1062785 ?auto_1062784 ) ( ON ?auto_1062786 ?auto_1062785 ) ( ON ?auto_1062787 ?auto_1062786 ) ( ON ?auto_1062788 ?auto_1062787 ) ( ON ?auto_1062789 ?auto_1062788 ) ( not ( = ?auto_1062781 ?auto_1062782 ) ) ( not ( = ?auto_1062781 ?auto_1062783 ) ) ( not ( = ?auto_1062781 ?auto_1062784 ) ) ( not ( = ?auto_1062781 ?auto_1062785 ) ) ( not ( = ?auto_1062781 ?auto_1062786 ) ) ( not ( = ?auto_1062781 ?auto_1062787 ) ) ( not ( = ?auto_1062781 ?auto_1062788 ) ) ( not ( = ?auto_1062781 ?auto_1062789 ) ) ( not ( = ?auto_1062781 ?auto_1062790 ) ) ( not ( = ?auto_1062781 ?auto_1062791 ) ) ( not ( = ?auto_1062782 ?auto_1062783 ) ) ( not ( = ?auto_1062782 ?auto_1062784 ) ) ( not ( = ?auto_1062782 ?auto_1062785 ) ) ( not ( = ?auto_1062782 ?auto_1062786 ) ) ( not ( = ?auto_1062782 ?auto_1062787 ) ) ( not ( = ?auto_1062782 ?auto_1062788 ) ) ( not ( = ?auto_1062782 ?auto_1062789 ) ) ( not ( = ?auto_1062782 ?auto_1062790 ) ) ( not ( = ?auto_1062782 ?auto_1062791 ) ) ( not ( = ?auto_1062783 ?auto_1062784 ) ) ( not ( = ?auto_1062783 ?auto_1062785 ) ) ( not ( = ?auto_1062783 ?auto_1062786 ) ) ( not ( = ?auto_1062783 ?auto_1062787 ) ) ( not ( = ?auto_1062783 ?auto_1062788 ) ) ( not ( = ?auto_1062783 ?auto_1062789 ) ) ( not ( = ?auto_1062783 ?auto_1062790 ) ) ( not ( = ?auto_1062783 ?auto_1062791 ) ) ( not ( = ?auto_1062784 ?auto_1062785 ) ) ( not ( = ?auto_1062784 ?auto_1062786 ) ) ( not ( = ?auto_1062784 ?auto_1062787 ) ) ( not ( = ?auto_1062784 ?auto_1062788 ) ) ( not ( = ?auto_1062784 ?auto_1062789 ) ) ( not ( = ?auto_1062784 ?auto_1062790 ) ) ( not ( = ?auto_1062784 ?auto_1062791 ) ) ( not ( = ?auto_1062785 ?auto_1062786 ) ) ( not ( = ?auto_1062785 ?auto_1062787 ) ) ( not ( = ?auto_1062785 ?auto_1062788 ) ) ( not ( = ?auto_1062785 ?auto_1062789 ) ) ( not ( = ?auto_1062785 ?auto_1062790 ) ) ( not ( = ?auto_1062785 ?auto_1062791 ) ) ( not ( = ?auto_1062786 ?auto_1062787 ) ) ( not ( = ?auto_1062786 ?auto_1062788 ) ) ( not ( = ?auto_1062786 ?auto_1062789 ) ) ( not ( = ?auto_1062786 ?auto_1062790 ) ) ( not ( = ?auto_1062786 ?auto_1062791 ) ) ( not ( = ?auto_1062787 ?auto_1062788 ) ) ( not ( = ?auto_1062787 ?auto_1062789 ) ) ( not ( = ?auto_1062787 ?auto_1062790 ) ) ( not ( = ?auto_1062787 ?auto_1062791 ) ) ( not ( = ?auto_1062788 ?auto_1062789 ) ) ( not ( = ?auto_1062788 ?auto_1062790 ) ) ( not ( = ?auto_1062788 ?auto_1062791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1062789 ?auto_1062790 ?auto_1062791 )
      ( MAKE-10CRATE-VERIFY ?auto_1062781 ?auto_1062782 ?auto_1062783 ?auto_1062784 ?auto_1062785 ?auto_1062786 ?auto_1062787 ?auto_1062788 ?auto_1062789 ?auto_1062790 ?auto_1062791 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1062896 - SURFACE
      ?auto_1062897 - SURFACE
      ?auto_1062898 - SURFACE
      ?auto_1062899 - SURFACE
      ?auto_1062900 - SURFACE
      ?auto_1062901 - SURFACE
      ?auto_1062902 - SURFACE
      ?auto_1062903 - SURFACE
      ?auto_1062904 - SURFACE
      ?auto_1062905 - SURFACE
      ?auto_1062906 - SURFACE
    )
    :vars
    (
      ?auto_1062909 - HOIST
      ?auto_1062910 - PLACE
      ?auto_1062907 - TRUCK
      ?auto_1062908 - PLACE
      ?auto_1062911 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062909 ?auto_1062910 ) ( SURFACE-AT ?auto_1062905 ?auto_1062910 ) ( CLEAR ?auto_1062905 ) ( IS-CRATE ?auto_1062906 ) ( not ( = ?auto_1062905 ?auto_1062906 ) ) ( AVAILABLE ?auto_1062909 ) ( ON ?auto_1062905 ?auto_1062904 ) ( not ( = ?auto_1062904 ?auto_1062905 ) ) ( not ( = ?auto_1062904 ?auto_1062906 ) ) ( TRUCK-AT ?auto_1062907 ?auto_1062908 ) ( not ( = ?auto_1062908 ?auto_1062910 ) ) ( HOIST-AT ?auto_1062911 ?auto_1062908 ) ( LIFTING ?auto_1062911 ?auto_1062906 ) ( not ( = ?auto_1062909 ?auto_1062911 ) ) ( ON ?auto_1062897 ?auto_1062896 ) ( ON ?auto_1062898 ?auto_1062897 ) ( ON ?auto_1062899 ?auto_1062898 ) ( ON ?auto_1062900 ?auto_1062899 ) ( ON ?auto_1062901 ?auto_1062900 ) ( ON ?auto_1062902 ?auto_1062901 ) ( ON ?auto_1062903 ?auto_1062902 ) ( ON ?auto_1062904 ?auto_1062903 ) ( not ( = ?auto_1062896 ?auto_1062897 ) ) ( not ( = ?auto_1062896 ?auto_1062898 ) ) ( not ( = ?auto_1062896 ?auto_1062899 ) ) ( not ( = ?auto_1062896 ?auto_1062900 ) ) ( not ( = ?auto_1062896 ?auto_1062901 ) ) ( not ( = ?auto_1062896 ?auto_1062902 ) ) ( not ( = ?auto_1062896 ?auto_1062903 ) ) ( not ( = ?auto_1062896 ?auto_1062904 ) ) ( not ( = ?auto_1062896 ?auto_1062905 ) ) ( not ( = ?auto_1062896 ?auto_1062906 ) ) ( not ( = ?auto_1062897 ?auto_1062898 ) ) ( not ( = ?auto_1062897 ?auto_1062899 ) ) ( not ( = ?auto_1062897 ?auto_1062900 ) ) ( not ( = ?auto_1062897 ?auto_1062901 ) ) ( not ( = ?auto_1062897 ?auto_1062902 ) ) ( not ( = ?auto_1062897 ?auto_1062903 ) ) ( not ( = ?auto_1062897 ?auto_1062904 ) ) ( not ( = ?auto_1062897 ?auto_1062905 ) ) ( not ( = ?auto_1062897 ?auto_1062906 ) ) ( not ( = ?auto_1062898 ?auto_1062899 ) ) ( not ( = ?auto_1062898 ?auto_1062900 ) ) ( not ( = ?auto_1062898 ?auto_1062901 ) ) ( not ( = ?auto_1062898 ?auto_1062902 ) ) ( not ( = ?auto_1062898 ?auto_1062903 ) ) ( not ( = ?auto_1062898 ?auto_1062904 ) ) ( not ( = ?auto_1062898 ?auto_1062905 ) ) ( not ( = ?auto_1062898 ?auto_1062906 ) ) ( not ( = ?auto_1062899 ?auto_1062900 ) ) ( not ( = ?auto_1062899 ?auto_1062901 ) ) ( not ( = ?auto_1062899 ?auto_1062902 ) ) ( not ( = ?auto_1062899 ?auto_1062903 ) ) ( not ( = ?auto_1062899 ?auto_1062904 ) ) ( not ( = ?auto_1062899 ?auto_1062905 ) ) ( not ( = ?auto_1062899 ?auto_1062906 ) ) ( not ( = ?auto_1062900 ?auto_1062901 ) ) ( not ( = ?auto_1062900 ?auto_1062902 ) ) ( not ( = ?auto_1062900 ?auto_1062903 ) ) ( not ( = ?auto_1062900 ?auto_1062904 ) ) ( not ( = ?auto_1062900 ?auto_1062905 ) ) ( not ( = ?auto_1062900 ?auto_1062906 ) ) ( not ( = ?auto_1062901 ?auto_1062902 ) ) ( not ( = ?auto_1062901 ?auto_1062903 ) ) ( not ( = ?auto_1062901 ?auto_1062904 ) ) ( not ( = ?auto_1062901 ?auto_1062905 ) ) ( not ( = ?auto_1062901 ?auto_1062906 ) ) ( not ( = ?auto_1062902 ?auto_1062903 ) ) ( not ( = ?auto_1062902 ?auto_1062904 ) ) ( not ( = ?auto_1062902 ?auto_1062905 ) ) ( not ( = ?auto_1062902 ?auto_1062906 ) ) ( not ( = ?auto_1062903 ?auto_1062904 ) ) ( not ( = ?auto_1062903 ?auto_1062905 ) ) ( not ( = ?auto_1062903 ?auto_1062906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1062904 ?auto_1062905 ?auto_1062906 )
      ( MAKE-10CRATE-VERIFY ?auto_1062896 ?auto_1062897 ?auto_1062898 ?auto_1062899 ?auto_1062900 ?auto_1062901 ?auto_1062902 ?auto_1062903 ?auto_1062904 ?auto_1062905 ?auto_1062906 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1063021 - SURFACE
      ?auto_1063022 - SURFACE
      ?auto_1063023 - SURFACE
      ?auto_1063024 - SURFACE
      ?auto_1063025 - SURFACE
      ?auto_1063026 - SURFACE
      ?auto_1063027 - SURFACE
      ?auto_1063028 - SURFACE
      ?auto_1063029 - SURFACE
      ?auto_1063030 - SURFACE
      ?auto_1063031 - SURFACE
    )
    :vars
    (
      ?auto_1063036 - HOIST
      ?auto_1063032 - PLACE
      ?auto_1063033 - TRUCK
      ?auto_1063034 - PLACE
      ?auto_1063035 - HOIST
      ?auto_1063037 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063036 ?auto_1063032 ) ( SURFACE-AT ?auto_1063030 ?auto_1063032 ) ( CLEAR ?auto_1063030 ) ( IS-CRATE ?auto_1063031 ) ( not ( = ?auto_1063030 ?auto_1063031 ) ) ( AVAILABLE ?auto_1063036 ) ( ON ?auto_1063030 ?auto_1063029 ) ( not ( = ?auto_1063029 ?auto_1063030 ) ) ( not ( = ?auto_1063029 ?auto_1063031 ) ) ( TRUCK-AT ?auto_1063033 ?auto_1063034 ) ( not ( = ?auto_1063034 ?auto_1063032 ) ) ( HOIST-AT ?auto_1063035 ?auto_1063034 ) ( not ( = ?auto_1063036 ?auto_1063035 ) ) ( AVAILABLE ?auto_1063035 ) ( SURFACE-AT ?auto_1063031 ?auto_1063034 ) ( ON ?auto_1063031 ?auto_1063037 ) ( CLEAR ?auto_1063031 ) ( not ( = ?auto_1063030 ?auto_1063037 ) ) ( not ( = ?auto_1063031 ?auto_1063037 ) ) ( not ( = ?auto_1063029 ?auto_1063037 ) ) ( ON ?auto_1063022 ?auto_1063021 ) ( ON ?auto_1063023 ?auto_1063022 ) ( ON ?auto_1063024 ?auto_1063023 ) ( ON ?auto_1063025 ?auto_1063024 ) ( ON ?auto_1063026 ?auto_1063025 ) ( ON ?auto_1063027 ?auto_1063026 ) ( ON ?auto_1063028 ?auto_1063027 ) ( ON ?auto_1063029 ?auto_1063028 ) ( not ( = ?auto_1063021 ?auto_1063022 ) ) ( not ( = ?auto_1063021 ?auto_1063023 ) ) ( not ( = ?auto_1063021 ?auto_1063024 ) ) ( not ( = ?auto_1063021 ?auto_1063025 ) ) ( not ( = ?auto_1063021 ?auto_1063026 ) ) ( not ( = ?auto_1063021 ?auto_1063027 ) ) ( not ( = ?auto_1063021 ?auto_1063028 ) ) ( not ( = ?auto_1063021 ?auto_1063029 ) ) ( not ( = ?auto_1063021 ?auto_1063030 ) ) ( not ( = ?auto_1063021 ?auto_1063031 ) ) ( not ( = ?auto_1063021 ?auto_1063037 ) ) ( not ( = ?auto_1063022 ?auto_1063023 ) ) ( not ( = ?auto_1063022 ?auto_1063024 ) ) ( not ( = ?auto_1063022 ?auto_1063025 ) ) ( not ( = ?auto_1063022 ?auto_1063026 ) ) ( not ( = ?auto_1063022 ?auto_1063027 ) ) ( not ( = ?auto_1063022 ?auto_1063028 ) ) ( not ( = ?auto_1063022 ?auto_1063029 ) ) ( not ( = ?auto_1063022 ?auto_1063030 ) ) ( not ( = ?auto_1063022 ?auto_1063031 ) ) ( not ( = ?auto_1063022 ?auto_1063037 ) ) ( not ( = ?auto_1063023 ?auto_1063024 ) ) ( not ( = ?auto_1063023 ?auto_1063025 ) ) ( not ( = ?auto_1063023 ?auto_1063026 ) ) ( not ( = ?auto_1063023 ?auto_1063027 ) ) ( not ( = ?auto_1063023 ?auto_1063028 ) ) ( not ( = ?auto_1063023 ?auto_1063029 ) ) ( not ( = ?auto_1063023 ?auto_1063030 ) ) ( not ( = ?auto_1063023 ?auto_1063031 ) ) ( not ( = ?auto_1063023 ?auto_1063037 ) ) ( not ( = ?auto_1063024 ?auto_1063025 ) ) ( not ( = ?auto_1063024 ?auto_1063026 ) ) ( not ( = ?auto_1063024 ?auto_1063027 ) ) ( not ( = ?auto_1063024 ?auto_1063028 ) ) ( not ( = ?auto_1063024 ?auto_1063029 ) ) ( not ( = ?auto_1063024 ?auto_1063030 ) ) ( not ( = ?auto_1063024 ?auto_1063031 ) ) ( not ( = ?auto_1063024 ?auto_1063037 ) ) ( not ( = ?auto_1063025 ?auto_1063026 ) ) ( not ( = ?auto_1063025 ?auto_1063027 ) ) ( not ( = ?auto_1063025 ?auto_1063028 ) ) ( not ( = ?auto_1063025 ?auto_1063029 ) ) ( not ( = ?auto_1063025 ?auto_1063030 ) ) ( not ( = ?auto_1063025 ?auto_1063031 ) ) ( not ( = ?auto_1063025 ?auto_1063037 ) ) ( not ( = ?auto_1063026 ?auto_1063027 ) ) ( not ( = ?auto_1063026 ?auto_1063028 ) ) ( not ( = ?auto_1063026 ?auto_1063029 ) ) ( not ( = ?auto_1063026 ?auto_1063030 ) ) ( not ( = ?auto_1063026 ?auto_1063031 ) ) ( not ( = ?auto_1063026 ?auto_1063037 ) ) ( not ( = ?auto_1063027 ?auto_1063028 ) ) ( not ( = ?auto_1063027 ?auto_1063029 ) ) ( not ( = ?auto_1063027 ?auto_1063030 ) ) ( not ( = ?auto_1063027 ?auto_1063031 ) ) ( not ( = ?auto_1063027 ?auto_1063037 ) ) ( not ( = ?auto_1063028 ?auto_1063029 ) ) ( not ( = ?auto_1063028 ?auto_1063030 ) ) ( not ( = ?auto_1063028 ?auto_1063031 ) ) ( not ( = ?auto_1063028 ?auto_1063037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063029 ?auto_1063030 ?auto_1063031 )
      ( MAKE-10CRATE-VERIFY ?auto_1063021 ?auto_1063022 ?auto_1063023 ?auto_1063024 ?auto_1063025 ?auto_1063026 ?auto_1063027 ?auto_1063028 ?auto_1063029 ?auto_1063030 ?auto_1063031 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1063147 - SURFACE
      ?auto_1063148 - SURFACE
      ?auto_1063149 - SURFACE
      ?auto_1063150 - SURFACE
      ?auto_1063151 - SURFACE
      ?auto_1063152 - SURFACE
      ?auto_1063153 - SURFACE
      ?auto_1063154 - SURFACE
      ?auto_1063155 - SURFACE
      ?auto_1063156 - SURFACE
      ?auto_1063157 - SURFACE
    )
    :vars
    (
      ?auto_1063160 - HOIST
      ?auto_1063158 - PLACE
      ?auto_1063161 - PLACE
      ?auto_1063159 - HOIST
      ?auto_1063163 - SURFACE
      ?auto_1063162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063160 ?auto_1063158 ) ( SURFACE-AT ?auto_1063156 ?auto_1063158 ) ( CLEAR ?auto_1063156 ) ( IS-CRATE ?auto_1063157 ) ( not ( = ?auto_1063156 ?auto_1063157 ) ) ( AVAILABLE ?auto_1063160 ) ( ON ?auto_1063156 ?auto_1063155 ) ( not ( = ?auto_1063155 ?auto_1063156 ) ) ( not ( = ?auto_1063155 ?auto_1063157 ) ) ( not ( = ?auto_1063161 ?auto_1063158 ) ) ( HOIST-AT ?auto_1063159 ?auto_1063161 ) ( not ( = ?auto_1063160 ?auto_1063159 ) ) ( AVAILABLE ?auto_1063159 ) ( SURFACE-AT ?auto_1063157 ?auto_1063161 ) ( ON ?auto_1063157 ?auto_1063163 ) ( CLEAR ?auto_1063157 ) ( not ( = ?auto_1063156 ?auto_1063163 ) ) ( not ( = ?auto_1063157 ?auto_1063163 ) ) ( not ( = ?auto_1063155 ?auto_1063163 ) ) ( TRUCK-AT ?auto_1063162 ?auto_1063158 ) ( ON ?auto_1063148 ?auto_1063147 ) ( ON ?auto_1063149 ?auto_1063148 ) ( ON ?auto_1063150 ?auto_1063149 ) ( ON ?auto_1063151 ?auto_1063150 ) ( ON ?auto_1063152 ?auto_1063151 ) ( ON ?auto_1063153 ?auto_1063152 ) ( ON ?auto_1063154 ?auto_1063153 ) ( ON ?auto_1063155 ?auto_1063154 ) ( not ( = ?auto_1063147 ?auto_1063148 ) ) ( not ( = ?auto_1063147 ?auto_1063149 ) ) ( not ( = ?auto_1063147 ?auto_1063150 ) ) ( not ( = ?auto_1063147 ?auto_1063151 ) ) ( not ( = ?auto_1063147 ?auto_1063152 ) ) ( not ( = ?auto_1063147 ?auto_1063153 ) ) ( not ( = ?auto_1063147 ?auto_1063154 ) ) ( not ( = ?auto_1063147 ?auto_1063155 ) ) ( not ( = ?auto_1063147 ?auto_1063156 ) ) ( not ( = ?auto_1063147 ?auto_1063157 ) ) ( not ( = ?auto_1063147 ?auto_1063163 ) ) ( not ( = ?auto_1063148 ?auto_1063149 ) ) ( not ( = ?auto_1063148 ?auto_1063150 ) ) ( not ( = ?auto_1063148 ?auto_1063151 ) ) ( not ( = ?auto_1063148 ?auto_1063152 ) ) ( not ( = ?auto_1063148 ?auto_1063153 ) ) ( not ( = ?auto_1063148 ?auto_1063154 ) ) ( not ( = ?auto_1063148 ?auto_1063155 ) ) ( not ( = ?auto_1063148 ?auto_1063156 ) ) ( not ( = ?auto_1063148 ?auto_1063157 ) ) ( not ( = ?auto_1063148 ?auto_1063163 ) ) ( not ( = ?auto_1063149 ?auto_1063150 ) ) ( not ( = ?auto_1063149 ?auto_1063151 ) ) ( not ( = ?auto_1063149 ?auto_1063152 ) ) ( not ( = ?auto_1063149 ?auto_1063153 ) ) ( not ( = ?auto_1063149 ?auto_1063154 ) ) ( not ( = ?auto_1063149 ?auto_1063155 ) ) ( not ( = ?auto_1063149 ?auto_1063156 ) ) ( not ( = ?auto_1063149 ?auto_1063157 ) ) ( not ( = ?auto_1063149 ?auto_1063163 ) ) ( not ( = ?auto_1063150 ?auto_1063151 ) ) ( not ( = ?auto_1063150 ?auto_1063152 ) ) ( not ( = ?auto_1063150 ?auto_1063153 ) ) ( not ( = ?auto_1063150 ?auto_1063154 ) ) ( not ( = ?auto_1063150 ?auto_1063155 ) ) ( not ( = ?auto_1063150 ?auto_1063156 ) ) ( not ( = ?auto_1063150 ?auto_1063157 ) ) ( not ( = ?auto_1063150 ?auto_1063163 ) ) ( not ( = ?auto_1063151 ?auto_1063152 ) ) ( not ( = ?auto_1063151 ?auto_1063153 ) ) ( not ( = ?auto_1063151 ?auto_1063154 ) ) ( not ( = ?auto_1063151 ?auto_1063155 ) ) ( not ( = ?auto_1063151 ?auto_1063156 ) ) ( not ( = ?auto_1063151 ?auto_1063157 ) ) ( not ( = ?auto_1063151 ?auto_1063163 ) ) ( not ( = ?auto_1063152 ?auto_1063153 ) ) ( not ( = ?auto_1063152 ?auto_1063154 ) ) ( not ( = ?auto_1063152 ?auto_1063155 ) ) ( not ( = ?auto_1063152 ?auto_1063156 ) ) ( not ( = ?auto_1063152 ?auto_1063157 ) ) ( not ( = ?auto_1063152 ?auto_1063163 ) ) ( not ( = ?auto_1063153 ?auto_1063154 ) ) ( not ( = ?auto_1063153 ?auto_1063155 ) ) ( not ( = ?auto_1063153 ?auto_1063156 ) ) ( not ( = ?auto_1063153 ?auto_1063157 ) ) ( not ( = ?auto_1063153 ?auto_1063163 ) ) ( not ( = ?auto_1063154 ?auto_1063155 ) ) ( not ( = ?auto_1063154 ?auto_1063156 ) ) ( not ( = ?auto_1063154 ?auto_1063157 ) ) ( not ( = ?auto_1063154 ?auto_1063163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063155 ?auto_1063156 ?auto_1063157 )
      ( MAKE-10CRATE-VERIFY ?auto_1063147 ?auto_1063148 ?auto_1063149 ?auto_1063150 ?auto_1063151 ?auto_1063152 ?auto_1063153 ?auto_1063154 ?auto_1063155 ?auto_1063156 ?auto_1063157 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1063273 - SURFACE
      ?auto_1063274 - SURFACE
      ?auto_1063275 - SURFACE
      ?auto_1063276 - SURFACE
      ?auto_1063277 - SURFACE
      ?auto_1063278 - SURFACE
      ?auto_1063279 - SURFACE
      ?auto_1063280 - SURFACE
      ?auto_1063281 - SURFACE
      ?auto_1063282 - SURFACE
      ?auto_1063283 - SURFACE
    )
    :vars
    (
      ?auto_1063286 - HOIST
      ?auto_1063284 - PLACE
      ?auto_1063288 - PLACE
      ?auto_1063285 - HOIST
      ?auto_1063287 - SURFACE
      ?auto_1063289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063286 ?auto_1063284 ) ( IS-CRATE ?auto_1063283 ) ( not ( = ?auto_1063282 ?auto_1063283 ) ) ( not ( = ?auto_1063281 ?auto_1063282 ) ) ( not ( = ?auto_1063281 ?auto_1063283 ) ) ( not ( = ?auto_1063288 ?auto_1063284 ) ) ( HOIST-AT ?auto_1063285 ?auto_1063288 ) ( not ( = ?auto_1063286 ?auto_1063285 ) ) ( AVAILABLE ?auto_1063285 ) ( SURFACE-AT ?auto_1063283 ?auto_1063288 ) ( ON ?auto_1063283 ?auto_1063287 ) ( CLEAR ?auto_1063283 ) ( not ( = ?auto_1063282 ?auto_1063287 ) ) ( not ( = ?auto_1063283 ?auto_1063287 ) ) ( not ( = ?auto_1063281 ?auto_1063287 ) ) ( TRUCK-AT ?auto_1063289 ?auto_1063284 ) ( SURFACE-AT ?auto_1063281 ?auto_1063284 ) ( CLEAR ?auto_1063281 ) ( LIFTING ?auto_1063286 ?auto_1063282 ) ( IS-CRATE ?auto_1063282 ) ( ON ?auto_1063274 ?auto_1063273 ) ( ON ?auto_1063275 ?auto_1063274 ) ( ON ?auto_1063276 ?auto_1063275 ) ( ON ?auto_1063277 ?auto_1063276 ) ( ON ?auto_1063278 ?auto_1063277 ) ( ON ?auto_1063279 ?auto_1063278 ) ( ON ?auto_1063280 ?auto_1063279 ) ( ON ?auto_1063281 ?auto_1063280 ) ( not ( = ?auto_1063273 ?auto_1063274 ) ) ( not ( = ?auto_1063273 ?auto_1063275 ) ) ( not ( = ?auto_1063273 ?auto_1063276 ) ) ( not ( = ?auto_1063273 ?auto_1063277 ) ) ( not ( = ?auto_1063273 ?auto_1063278 ) ) ( not ( = ?auto_1063273 ?auto_1063279 ) ) ( not ( = ?auto_1063273 ?auto_1063280 ) ) ( not ( = ?auto_1063273 ?auto_1063281 ) ) ( not ( = ?auto_1063273 ?auto_1063282 ) ) ( not ( = ?auto_1063273 ?auto_1063283 ) ) ( not ( = ?auto_1063273 ?auto_1063287 ) ) ( not ( = ?auto_1063274 ?auto_1063275 ) ) ( not ( = ?auto_1063274 ?auto_1063276 ) ) ( not ( = ?auto_1063274 ?auto_1063277 ) ) ( not ( = ?auto_1063274 ?auto_1063278 ) ) ( not ( = ?auto_1063274 ?auto_1063279 ) ) ( not ( = ?auto_1063274 ?auto_1063280 ) ) ( not ( = ?auto_1063274 ?auto_1063281 ) ) ( not ( = ?auto_1063274 ?auto_1063282 ) ) ( not ( = ?auto_1063274 ?auto_1063283 ) ) ( not ( = ?auto_1063274 ?auto_1063287 ) ) ( not ( = ?auto_1063275 ?auto_1063276 ) ) ( not ( = ?auto_1063275 ?auto_1063277 ) ) ( not ( = ?auto_1063275 ?auto_1063278 ) ) ( not ( = ?auto_1063275 ?auto_1063279 ) ) ( not ( = ?auto_1063275 ?auto_1063280 ) ) ( not ( = ?auto_1063275 ?auto_1063281 ) ) ( not ( = ?auto_1063275 ?auto_1063282 ) ) ( not ( = ?auto_1063275 ?auto_1063283 ) ) ( not ( = ?auto_1063275 ?auto_1063287 ) ) ( not ( = ?auto_1063276 ?auto_1063277 ) ) ( not ( = ?auto_1063276 ?auto_1063278 ) ) ( not ( = ?auto_1063276 ?auto_1063279 ) ) ( not ( = ?auto_1063276 ?auto_1063280 ) ) ( not ( = ?auto_1063276 ?auto_1063281 ) ) ( not ( = ?auto_1063276 ?auto_1063282 ) ) ( not ( = ?auto_1063276 ?auto_1063283 ) ) ( not ( = ?auto_1063276 ?auto_1063287 ) ) ( not ( = ?auto_1063277 ?auto_1063278 ) ) ( not ( = ?auto_1063277 ?auto_1063279 ) ) ( not ( = ?auto_1063277 ?auto_1063280 ) ) ( not ( = ?auto_1063277 ?auto_1063281 ) ) ( not ( = ?auto_1063277 ?auto_1063282 ) ) ( not ( = ?auto_1063277 ?auto_1063283 ) ) ( not ( = ?auto_1063277 ?auto_1063287 ) ) ( not ( = ?auto_1063278 ?auto_1063279 ) ) ( not ( = ?auto_1063278 ?auto_1063280 ) ) ( not ( = ?auto_1063278 ?auto_1063281 ) ) ( not ( = ?auto_1063278 ?auto_1063282 ) ) ( not ( = ?auto_1063278 ?auto_1063283 ) ) ( not ( = ?auto_1063278 ?auto_1063287 ) ) ( not ( = ?auto_1063279 ?auto_1063280 ) ) ( not ( = ?auto_1063279 ?auto_1063281 ) ) ( not ( = ?auto_1063279 ?auto_1063282 ) ) ( not ( = ?auto_1063279 ?auto_1063283 ) ) ( not ( = ?auto_1063279 ?auto_1063287 ) ) ( not ( = ?auto_1063280 ?auto_1063281 ) ) ( not ( = ?auto_1063280 ?auto_1063282 ) ) ( not ( = ?auto_1063280 ?auto_1063283 ) ) ( not ( = ?auto_1063280 ?auto_1063287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063281 ?auto_1063282 ?auto_1063283 )
      ( MAKE-10CRATE-VERIFY ?auto_1063273 ?auto_1063274 ?auto_1063275 ?auto_1063276 ?auto_1063277 ?auto_1063278 ?auto_1063279 ?auto_1063280 ?auto_1063281 ?auto_1063282 ?auto_1063283 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1063399 - SURFACE
      ?auto_1063400 - SURFACE
      ?auto_1063401 - SURFACE
      ?auto_1063402 - SURFACE
      ?auto_1063403 - SURFACE
      ?auto_1063404 - SURFACE
      ?auto_1063405 - SURFACE
      ?auto_1063406 - SURFACE
      ?auto_1063407 - SURFACE
      ?auto_1063408 - SURFACE
      ?auto_1063409 - SURFACE
    )
    :vars
    (
      ?auto_1063411 - HOIST
      ?auto_1063414 - PLACE
      ?auto_1063412 - PLACE
      ?auto_1063415 - HOIST
      ?auto_1063413 - SURFACE
      ?auto_1063410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063411 ?auto_1063414 ) ( IS-CRATE ?auto_1063409 ) ( not ( = ?auto_1063408 ?auto_1063409 ) ) ( not ( = ?auto_1063407 ?auto_1063408 ) ) ( not ( = ?auto_1063407 ?auto_1063409 ) ) ( not ( = ?auto_1063412 ?auto_1063414 ) ) ( HOIST-AT ?auto_1063415 ?auto_1063412 ) ( not ( = ?auto_1063411 ?auto_1063415 ) ) ( AVAILABLE ?auto_1063415 ) ( SURFACE-AT ?auto_1063409 ?auto_1063412 ) ( ON ?auto_1063409 ?auto_1063413 ) ( CLEAR ?auto_1063409 ) ( not ( = ?auto_1063408 ?auto_1063413 ) ) ( not ( = ?auto_1063409 ?auto_1063413 ) ) ( not ( = ?auto_1063407 ?auto_1063413 ) ) ( TRUCK-AT ?auto_1063410 ?auto_1063414 ) ( SURFACE-AT ?auto_1063407 ?auto_1063414 ) ( CLEAR ?auto_1063407 ) ( IS-CRATE ?auto_1063408 ) ( AVAILABLE ?auto_1063411 ) ( IN ?auto_1063408 ?auto_1063410 ) ( ON ?auto_1063400 ?auto_1063399 ) ( ON ?auto_1063401 ?auto_1063400 ) ( ON ?auto_1063402 ?auto_1063401 ) ( ON ?auto_1063403 ?auto_1063402 ) ( ON ?auto_1063404 ?auto_1063403 ) ( ON ?auto_1063405 ?auto_1063404 ) ( ON ?auto_1063406 ?auto_1063405 ) ( ON ?auto_1063407 ?auto_1063406 ) ( not ( = ?auto_1063399 ?auto_1063400 ) ) ( not ( = ?auto_1063399 ?auto_1063401 ) ) ( not ( = ?auto_1063399 ?auto_1063402 ) ) ( not ( = ?auto_1063399 ?auto_1063403 ) ) ( not ( = ?auto_1063399 ?auto_1063404 ) ) ( not ( = ?auto_1063399 ?auto_1063405 ) ) ( not ( = ?auto_1063399 ?auto_1063406 ) ) ( not ( = ?auto_1063399 ?auto_1063407 ) ) ( not ( = ?auto_1063399 ?auto_1063408 ) ) ( not ( = ?auto_1063399 ?auto_1063409 ) ) ( not ( = ?auto_1063399 ?auto_1063413 ) ) ( not ( = ?auto_1063400 ?auto_1063401 ) ) ( not ( = ?auto_1063400 ?auto_1063402 ) ) ( not ( = ?auto_1063400 ?auto_1063403 ) ) ( not ( = ?auto_1063400 ?auto_1063404 ) ) ( not ( = ?auto_1063400 ?auto_1063405 ) ) ( not ( = ?auto_1063400 ?auto_1063406 ) ) ( not ( = ?auto_1063400 ?auto_1063407 ) ) ( not ( = ?auto_1063400 ?auto_1063408 ) ) ( not ( = ?auto_1063400 ?auto_1063409 ) ) ( not ( = ?auto_1063400 ?auto_1063413 ) ) ( not ( = ?auto_1063401 ?auto_1063402 ) ) ( not ( = ?auto_1063401 ?auto_1063403 ) ) ( not ( = ?auto_1063401 ?auto_1063404 ) ) ( not ( = ?auto_1063401 ?auto_1063405 ) ) ( not ( = ?auto_1063401 ?auto_1063406 ) ) ( not ( = ?auto_1063401 ?auto_1063407 ) ) ( not ( = ?auto_1063401 ?auto_1063408 ) ) ( not ( = ?auto_1063401 ?auto_1063409 ) ) ( not ( = ?auto_1063401 ?auto_1063413 ) ) ( not ( = ?auto_1063402 ?auto_1063403 ) ) ( not ( = ?auto_1063402 ?auto_1063404 ) ) ( not ( = ?auto_1063402 ?auto_1063405 ) ) ( not ( = ?auto_1063402 ?auto_1063406 ) ) ( not ( = ?auto_1063402 ?auto_1063407 ) ) ( not ( = ?auto_1063402 ?auto_1063408 ) ) ( not ( = ?auto_1063402 ?auto_1063409 ) ) ( not ( = ?auto_1063402 ?auto_1063413 ) ) ( not ( = ?auto_1063403 ?auto_1063404 ) ) ( not ( = ?auto_1063403 ?auto_1063405 ) ) ( not ( = ?auto_1063403 ?auto_1063406 ) ) ( not ( = ?auto_1063403 ?auto_1063407 ) ) ( not ( = ?auto_1063403 ?auto_1063408 ) ) ( not ( = ?auto_1063403 ?auto_1063409 ) ) ( not ( = ?auto_1063403 ?auto_1063413 ) ) ( not ( = ?auto_1063404 ?auto_1063405 ) ) ( not ( = ?auto_1063404 ?auto_1063406 ) ) ( not ( = ?auto_1063404 ?auto_1063407 ) ) ( not ( = ?auto_1063404 ?auto_1063408 ) ) ( not ( = ?auto_1063404 ?auto_1063409 ) ) ( not ( = ?auto_1063404 ?auto_1063413 ) ) ( not ( = ?auto_1063405 ?auto_1063406 ) ) ( not ( = ?auto_1063405 ?auto_1063407 ) ) ( not ( = ?auto_1063405 ?auto_1063408 ) ) ( not ( = ?auto_1063405 ?auto_1063409 ) ) ( not ( = ?auto_1063405 ?auto_1063413 ) ) ( not ( = ?auto_1063406 ?auto_1063407 ) ) ( not ( = ?auto_1063406 ?auto_1063408 ) ) ( not ( = ?auto_1063406 ?auto_1063409 ) ) ( not ( = ?auto_1063406 ?auto_1063413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1063407 ?auto_1063408 ?auto_1063409 )
      ( MAKE-10CRATE-VERIFY ?auto_1063399 ?auto_1063400 ?auto_1063401 ?auto_1063402 ?auto_1063403 ?auto_1063404 ?auto_1063405 ?auto_1063406 ?auto_1063407 ?auto_1063408 ?auto_1063409 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1070683 - SURFACE
      ?auto_1070684 - SURFACE
      ?auto_1070685 - SURFACE
      ?auto_1070686 - SURFACE
      ?auto_1070687 - SURFACE
      ?auto_1070688 - SURFACE
      ?auto_1070689 - SURFACE
      ?auto_1070690 - SURFACE
      ?auto_1070691 - SURFACE
      ?auto_1070692 - SURFACE
      ?auto_1070693 - SURFACE
      ?auto_1070694 - SURFACE
    )
    :vars
    (
      ?auto_1070696 - HOIST
      ?auto_1070695 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070696 ?auto_1070695 ) ( SURFACE-AT ?auto_1070693 ?auto_1070695 ) ( CLEAR ?auto_1070693 ) ( LIFTING ?auto_1070696 ?auto_1070694 ) ( IS-CRATE ?auto_1070694 ) ( not ( = ?auto_1070693 ?auto_1070694 ) ) ( ON ?auto_1070684 ?auto_1070683 ) ( ON ?auto_1070685 ?auto_1070684 ) ( ON ?auto_1070686 ?auto_1070685 ) ( ON ?auto_1070687 ?auto_1070686 ) ( ON ?auto_1070688 ?auto_1070687 ) ( ON ?auto_1070689 ?auto_1070688 ) ( ON ?auto_1070690 ?auto_1070689 ) ( ON ?auto_1070691 ?auto_1070690 ) ( ON ?auto_1070692 ?auto_1070691 ) ( ON ?auto_1070693 ?auto_1070692 ) ( not ( = ?auto_1070683 ?auto_1070684 ) ) ( not ( = ?auto_1070683 ?auto_1070685 ) ) ( not ( = ?auto_1070683 ?auto_1070686 ) ) ( not ( = ?auto_1070683 ?auto_1070687 ) ) ( not ( = ?auto_1070683 ?auto_1070688 ) ) ( not ( = ?auto_1070683 ?auto_1070689 ) ) ( not ( = ?auto_1070683 ?auto_1070690 ) ) ( not ( = ?auto_1070683 ?auto_1070691 ) ) ( not ( = ?auto_1070683 ?auto_1070692 ) ) ( not ( = ?auto_1070683 ?auto_1070693 ) ) ( not ( = ?auto_1070683 ?auto_1070694 ) ) ( not ( = ?auto_1070684 ?auto_1070685 ) ) ( not ( = ?auto_1070684 ?auto_1070686 ) ) ( not ( = ?auto_1070684 ?auto_1070687 ) ) ( not ( = ?auto_1070684 ?auto_1070688 ) ) ( not ( = ?auto_1070684 ?auto_1070689 ) ) ( not ( = ?auto_1070684 ?auto_1070690 ) ) ( not ( = ?auto_1070684 ?auto_1070691 ) ) ( not ( = ?auto_1070684 ?auto_1070692 ) ) ( not ( = ?auto_1070684 ?auto_1070693 ) ) ( not ( = ?auto_1070684 ?auto_1070694 ) ) ( not ( = ?auto_1070685 ?auto_1070686 ) ) ( not ( = ?auto_1070685 ?auto_1070687 ) ) ( not ( = ?auto_1070685 ?auto_1070688 ) ) ( not ( = ?auto_1070685 ?auto_1070689 ) ) ( not ( = ?auto_1070685 ?auto_1070690 ) ) ( not ( = ?auto_1070685 ?auto_1070691 ) ) ( not ( = ?auto_1070685 ?auto_1070692 ) ) ( not ( = ?auto_1070685 ?auto_1070693 ) ) ( not ( = ?auto_1070685 ?auto_1070694 ) ) ( not ( = ?auto_1070686 ?auto_1070687 ) ) ( not ( = ?auto_1070686 ?auto_1070688 ) ) ( not ( = ?auto_1070686 ?auto_1070689 ) ) ( not ( = ?auto_1070686 ?auto_1070690 ) ) ( not ( = ?auto_1070686 ?auto_1070691 ) ) ( not ( = ?auto_1070686 ?auto_1070692 ) ) ( not ( = ?auto_1070686 ?auto_1070693 ) ) ( not ( = ?auto_1070686 ?auto_1070694 ) ) ( not ( = ?auto_1070687 ?auto_1070688 ) ) ( not ( = ?auto_1070687 ?auto_1070689 ) ) ( not ( = ?auto_1070687 ?auto_1070690 ) ) ( not ( = ?auto_1070687 ?auto_1070691 ) ) ( not ( = ?auto_1070687 ?auto_1070692 ) ) ( not ( = ?auto_1070687 ?auto_1070693 ) ) ( not ( = ?auto_1070687 ?auto_1070694 ) ) ( not ( = ?auto_1070688 ?auto_1070689 ) ) ( not ( = ?auto_1070688 ?auto_1070690 ) ) ( not ( = ?auto_1070688 ?auto_1070691 ) ) ( not ( = ?auto_1070688 ?auto_1070692 ) ) ( not ( = ?auto_1070688 ?auto_1070693 ) ) ( not ( = ?auto_1070688 ?auto_1070694 ) ) ( not ( = ?auto_1070689 ?auto_1070690 ) ) ( not ( = ?auto_1070689 ?auto_1070691 ) ) ( not ( = ?auto_1070689 ?auto_1070692 ) ) ( not ( = ?auto_1070689 ?auto_1070693 ) ) ( not ( = ?auto_1070689 ?auto_1070694 ) ) ( not ( = ?auto_1070690 ?auto_1070691 ) ) ( not ( = ?auto_1070690 ?auto_1070692 ) ) ( not ( = ?auto_1070690 ?auto_1070693 ) ) ( not ( = ?auto_1070690 ?auto_1070694 ) ) ( not ( = ?auto_1070691 ?auto_1070692 ) ) ( not ( = ?auto_1070691 ?auto_1070693 ) ) ( not ( = ?auto_1070691 ?auto_1070694 ) ) ( not ( = ?auto_1070692 ?auto_1070693 ) ) ( not ( = ?auto_1070692 ?auto_1070694 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1070693 ?auto_1070694 )
      ( MAKE-11CRATE-VERIFY ?auto_1070683 ?auto_1070684 ?auto_1070685 ?auto_1070686 ?auto_1070687 ?auto_1070688 ?auto_1070689 ?auto_1070690 ?auto_1070691 ?auto_1070692 ?auto_1070693 ?auto_1070694 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1070792 - SURFACE
      ?auto_1070793 - SURFACE
      ?auto_1070794 - SURFACE
      ?auto_1070795 - SURFACE
      ?auto_1070796 - SURFACE
      ?auto_1070797 - SURFACE
      ?auto_1070798 - SURFACE
      ?auto_1070799 - SURFACE
      ?auto_1070800 - SURFACE
      ?auto_1070801 - SURFACE
      ?auto_1070802 - SURFACE
      ?auto_1070803 - SURFACE
    )
    :vars
    (
      ?auto_1070806 - HOIST
      ?auto_1070804 - PLACE
      ?auto_1070805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070806 ?auto_1070804 ) ( SURFACE-AT ?auto_1070802 ?auto_1070804 ) ( CLEAR ?auto_1070802 ) ( IS-CRATE ?auto_1070803 ) ( not ( = ?auto_1070802 ?auto_1070803 ) ) ( TRUCK-AT ?auto_1070805 ?auto_1070804 ) ( AVAILABLE ?auto_1070806 ) ( IN ?auto_1070803 ?auto_1070805 ) ( ON ?auto_1070802 ?auto_1070801 ) ( not ( = ?auto_1070801 ?auto_1070802 ) ) ( not ( = ?auto_1070801 ?auto_1070803 ) ) ( ON ?auto_1070793 ?auto_1070792 ) ( ON ?auto_1070794 ?auto_1070793 ) ( ON ?auto_1070795 ?auto_1070794 ) ( ON ?auto_1070796 ?auto_1070795 ) ( ON ?auto_1070797 ?auto_1070796 ) ( ON ?auto_1070798 ?auto_1070797 ) ( ON ?auto_1070799 ?auto_1070798 ) ( ON ?auto_1070800 ?auto_1070799 ) ( ON ?auto_1070801 ?auto_1070800 ) ( not ( = ?auto_1070792 ?auto_1070793 ) ) ( not ( = ?auto_1070792 ?auto_1070794 ) ) ( not ( = ?auto_1070792 ?auto_1070795 ) ) ( not ( = ?auto_1070792 ?auto_1070796 ) ) ( not ( = ?auto_1070792 ?auto_1070797 ) ) ( not ( = ?auto_1070792 ?auto_1070798 ) ) ( not ( = ?auto_1070792 ?auto_1070799 ) ) ( not ( = ?auto_1070792 ?auto_1070800 ) ) ( not ( = ?auto_1070792 ?auto_1070801 ) ) ( not ( = ?auto_1070792 ?auto_1070802 ) ) ( not ( = ?auto_1070792 ?auto_1070803 ) ) ( not ( = ?auto_1070793 ?auto_1070794 ) ) ( not ( = ?auto_1070793 ?auto_1070795 ) ) ( not ( = ?auto_1070793 ?auto_1070796 ) ) ( not ( = ?auto_1070793 ?auto_1070797 ) ) ( not ( = ?auto_1070793 ?auto_1070798 ) ) ( not ( = ?auto_1070793 ?auto_1070799 ) ) ( not ( = ?auto_1070793 ?auto_1070800 ) ) ( not ( = ?auto_1070793 ?auto_1070801 ) ) ( not ( = ?auto_1070793 ?auto_1070802 ) ) ( not ( = ?auto_1070793 ?auto_1070803 ) ) ( not ( = ?auto_1070794 ?auto_1070795 ) ) ( not ( = ?auto_1070794 ?auto_1070796 ) ) ( not ( = ?auto_1070794 ?auto_1070797 ) ) ( not ( = ?auto_1070794 ?auto_1070798 ) ) ( not ( = ?auto_1070794 ?auto_1070799 ) ) ( not ( = ?auto_1070794 ?auto_1070800 ) ) ( not ( = ?auto_1070794 ?auto_1070801 ) ) ( not ( = ?auto_1070794 ?auto_1070802 ) ) ( not ( = ?auto_1070794 ?auto_1070803 ) ) ( not ( = ?auto_1070795 ?auto_1070796 ) ) ( not ( = ?auto_1070795 ?auto_1070797 ) ) ( not ( = ?auto_1070795 ?auto_1070798 ) ) ( not ( = ?auto_1070795 ?auto_1070799 ) ) ( not ( = ?auto_1070795 ?auto_1070800 ) ) ( not ( = ?auto_1070795 ?auto_1070801 ) ) ( not ( = ?auto_1070795 ?auto_1070802 ) ) ( not ( = ?auto_1070795 ?auto_1070803 ) ) ( not ( = ?auto_1070796 ?auto_1070797 ) ) ( not ( = ?auto_1070796 ?auto_1070798 ) ) ( not ( = ?auto_1070796 ?auto_1070799 ) ) ( not ( = ?auto_1070796 ?auto_1070800 ) ) ( not ( = ?auto_1070796 ?auto_1070801 ) ) ( not ( = ?auto_1070796 ?auto_1070802 ) ) ( not ( = ?auto_1070796 ?auto_1070803 ) ) ( not ( = ?auto_1070797 ?auto_1070798 ) ) ( not ( = ?auto_1070797 ?auto_1070799 ) ) ( not ( = ?auto_1070797 ?auto_1070800 ) ) ( not ( = ?auto_1070797 ?auto_1070801 ) ) ( not ( = ?auto_1070797 ?auto_1070802 ) ) ( not ( = ?auto_1070797 ?auto_1070803 ) ) ( not ( = ?auto_1070798 ?auto_1070799 ) ) ( not ( = ?auto_1070798 ?auto_1070800 ) ) ( not ( = ?auto_1070798 ?auto_1070801 ) ) ( not ( = ?auto_1070798 ?auto_1070802 ) ) ( not ( = ?auto_1070798 ?auto_1070803 ) ) ( not ( = ?auto_1070799 ?auto_1070800 ) ) ( not ( = ?auto_1070799 ?auto_1070801 ) ) ( not ( = ?auto_1070799 ?auto_1070802 ) ) ( not ( = ?auto_1070799 ?auto_1070803 ) ) ( not ( = ?auto_1070800 ?auto_1070801 ) ) ( not ( = ?auto_1070800 ?auto_1070802 ) ) ( not ( = ?auto_1070800 ?auto_1070803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1070801 ?auto_1070802 ?auto_1070803 )
      ( MAKE-11CRATE-VERIFY ?auto_1070792 ?auto_1070793 ?auto_1070794 ?auto_1070795 ?auto_1070796 ?auto_1070797 ?auto_1070798 ?auto_1070799 ?auto_1070800 ?auto_1070801 ?auto_1070802 ?auto_1070803 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1070913 - SURFACE
      ?auto_1070914 - SURFACE
      ?auto_1070915 - SURFACE
      ?auto_1070916 - SURFACE
      ?auto_1070917 - SURFACE
      ?auto_1070918 - SURFACE
      ?auto_1070919 - SURFACE
      ?auto_1070920 - SURFACE
      ?auto_1070921 - SURFACE
      ?auto_1070922 - SURFACE
      ?auto_1070923 - SURFACE
      ?auto_1070924 - SURFACE
    )
    :vars
    (
      ?auto_1070927 - HOIST
      ?auto_1070925 - PLACE
      ?auto_1070926 - TRUCK
      ?auto_1070928 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070927 ?auto_1070925 ) ( SURFACE-AT ?auto_1070923 ?auto_1070925 ) ( CLEAR ?auto_1070923 ) ( IS-CRATE ?auto_1070924 ) ( not ( = ?auto_1070923 ?auto_1070924 ) ) ( AVAILABLE ?auto_1070927 ) ( IN ?auto_1070924 ?auto_1070926 ) ( ON ?auto_1070923 ?auto_1070922 ) ( not ( = ?auto_1070922 ?auto_1070923 ) ) ( not ( = ?auto_1070922 ?auto_1070924 ) ) ( TRUCK-AT ?auto_1070926 ?auto_1070928 ) ( not ( = ?auto_1070928 ?auto_1070925 ) ) ( ON ?auto_1070914 ?auto_1070913 ) ( ON ?auto_1070915 ?auto_1070914 ) ( ON ?auto_1070916 ?auto_1070915 ) ( ON ?auto_1070917 ?auto_1070916 ) ( ON ?auto_1070918 ?auto_1070917 ) ( ON ?auto_1070919 ?auto_1070918 ) ( ON ?auto_1070920 ?auto_1070919 ) ( ON ?auto_1070921 ?auto_1070920 ) ( ON ?auto_1070922 ?auto_1070921 ) ( not ( = ?auto_1070913 ?auto_1070914 ) ) ( not ( = ?auto_1070913 ?auto_1070915 ) ) ( not ( = ?auto_1070913 ?auto_1070916 ) ) ( not ( = ?auto_1070913 ?auto_1070917 ) ) ( not ( = ?auto_1070913 ?auto_1070918 ) ) ( not ( = ?auto_1070913 ?auto_1070919 ) ) ( not ( = ?auto_1070913 ?auto_1070920 ) ) ( not ( = ?auto_1070913 ?auto_1070921 ) ) ( not ( = ?auto_1070913 ?auto_1070922 ) ) ( not ( = ?auto_1070913 ?auto_1070923 ) ) ( not ( = ?auto_1070913 ?auto_1070924 ) ) ( not ( = ?auto_1070914 ?auto_1070915 ) ) ( not ( = ?auto_1070914 ?auto_1070916 ) ) ( not ( = ?auto_1070914 ?auto_1070917 ) ) ( not ( = ?auto_1070914 ?auto_1070918 ) ) ( not ( = ?auto_1070914 ?auto_1070919 ) ) ( not ( = ?auto_1070914 ?auto_1070920 ) ) ( not ( = ?auto_1070914 ?auto_1070921 ) ) ( not ( = ?auto_1070914 ?auto_1070922 ) ) ( not ( = ?auto_1070914 ?auto_1070923 ) ) ( not ( = ?auto_1070914 ?auto_1070924 ) ) ( not ( = ?auto_1070915 ?auto_1070916 ) ) ( not ( = ?auto_1070915 ?auto_1070917 ) ) ( not ( = ?auto_1070915 ?auto_1070918 ) ) ( not ( = ?auto_1070915 ?auto_1070919 ) ) ( not ( = ?auto_1070915 ?auto_1070920 ) ) ( not ( = ?auto_1070915 ?auto_1070921 ) ) ( not ( = ?auto_1070915 ?auto_1070922 ) ) ( not ( = ?auto_1070915 ?auto_1070923 ) ) ( not ( = ?auto_1070915 ?auto_1070924 ) ) ( not ( = ?auto_1070916 ?auto_1070917 ) ) ( not ( = ?auto_1070916 ?auto_1070918 ) ) ( not ( = ?auto_1070916 ?auto_1070919 ) ) ( not ( = ?auto_1070916 ?auto_1070920 ) ) ( not ( = ?auto_1070916 ?auto_1070921 ) ) ( not ( = ?auto_1070916 ?auto_1070922 ) ) ( not ( = ?auto_1070916 ?auto_1070923 ) ) ( not ( = ?auto_1070916 ?auto_1070924 ) ) ( not ( = ?auto_1070917 ?auto_1070918 ) ) ( not ( = ?auto_1070917 ?auto_1070919 ) ) ( not ( = ?auto_1070917 ?auto_1070920 ) ) ( not ( = ?auto_1070917 ?auto_1070921 ) ) ( not ( = ?auto_1070917 ?auto_1070922 ) ) ( not ( = ?auto_1070917 ?auto_1070923 ) ) ( not ( = ?auto_1070917 ?auto_1070924 ) ) ( not ( = ?auto_1070918 ?auto_1070919 ) ) ( not ( = ?auto_1070918 ?auto_1070920 ) ) ( not ( = ?auto_1070918 ?auto_1070921 ) ) ( not ( = ?auto_1070918 ?auto_1070922 ) ) ( not ( = ?auto_1070918 ?auto_1070923 ) ) ( not ( = ?auto_1070918 ?auto_1070924 ) ) ( not ( = ?auto_1070919 ?auto_1070920 ) ) ( not ( = ?auto_1070919 ?auto_1070921 ) ) ( not ( = ?auto_1070919 ?auto_1070922 ) ) ( not ( = ?auto_1070919 ?auto_1070923 ) ) ( not ( = ?auto_1070919 ?auto_1070924 ) ) ( not ( = ?auto_1070920 ?auto_1070921 ) ) ( not ( = ?auto_1070920 ?auto_1070922 ) ) ( not ( = ?auto_1070920 ?auto_1070923 ) ) ( not ( = ?auto_1070920 ?auto_1070924 ) ) ( not ( = ?auto_1070921 ?auto_1070922 ) ) ( not ( = ?auto_1070921 ?auto_1070923 ) ) ( not ( = ?auto_1070921 ?auto_1070924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1070922 ?auto_1070923 ?auto_1070924 )
      ( MAKE-11CRATE-VERIFY ?auto_1070913 ?auto_1070914 ?auto_1070915 ?auto_1070916 ?auto_1070917 ?auto_1070918 ?auto_1070919 ?auto_1070920 ?auto_1070921 ?auto_1070922 ?auto_1070923 ?auto_1070924 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071045 - SURFACE
      ?auto_1071046 - SURFACE
      ?auto_1071047 - SURFACE
      ?auto_1071048 - SURFACE
      ?auto_1071049 - SURFACE
      ?auto_1071050 - SURFACE
      ?auto_1071051 - SURFACE
      ?auto_1071052 - SURFACE
      ?auto_1071053 - SURFACE
      ?auto_1071054 - SURFACE
      ?auto_1071055 - SURFACE
      ?auto_1071056 - SURFACE
    )
    :vars
    (
      ?auto_1071060 - HOIST
      ?auto_1071057 - PLACE
      ?auto_1071061 - TRUCK
      ?auto_1071059 - PLACE
      ?auto_1071058 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071060 ?auto_1071057 ) ( SURFACE-AT ?auto_1071055 ?auto_1071057 ) ( CLEAR ?auto_1071055 ) ( IS-CRATE ?auto_1071056 ) ( not ( = ?auto_1071055 ?auto_1071056 ) ) ( AVAILABLE ?auto_1071060 ) ( ON ?auto_1071055 ?auto_1071054 ) ( not ( = ?auto_1071054 ?auto_1071055 ) ) ( not ( = ?auto_1071054 ?auto_1071056 ) ) ( TRUCK-AT ?auto_1071061 ?auto_1071059 ) ( not ( = ?auto_1071059 ?auto_1071057 ) ) ( HOIST-AT ?auto_1071058 ?auto_1071059 ) ( LIFTING ?auto_1071058 ?auto_1071056 ) ( not ( = ?auto_1071060 ?auto_1071058 ) ) ( ON ?auto_1071046 ?auto_1071045 ) ( ON ?auto_1071047 ?auto_1071046 ) ( ON ?auto_1071048 ?auto_1071047 ) ( ON ?auto_1071049 ?auto_1071048 ) ( ON ?auto_1071050 ?auto_1071049 ) ( ON ?auto_1071051 ?auto_1071050 ) ( ON ?auto_1071052 ?auto_1071051 ) ( ON ?auto_1071053 ?auto_1071052 ) ( ON ?auto_1071054 ?auto_1071053 ) ( not ( = ?auto_1071045 ?auto_1071046 ) ) ( not ( = ?auto_1071045 ?auto_1071047 ) ) ( not ( = ?auto_1071045 ?auto_1071048 ) ) ( not ( = ?auto_1071045 ?auto_1071049 ) ) ( not ( = ?auto_1071045 ?auto_1071050 ) ) ( not ( = ?auto_1071045 ?auto_1071051 ) ) ( not ( = ?auto_1071045 ?auto_1071052 ) ) ( not ( = ?auto_1071045 ?auto_1071053 ) ) ( not ( = ?auto_1071045 ?auto_1071054 ) ) ( not ( = ?auto_1071045 ?auto_1071055 ) ) ( not ( = ?auto_1071045 ?auto_1071056 ) ) ( not ( = ?auto_1071046 ?auto_1071047 ) ) ( not ( = ?auto_1071046 ?auto_1071048 ) ) ( not ( = ?auto_1071046 ?auto_1071049 ) ) ( not ( = ?auto_1071046 ?auto_1071050 ) ) ( not ( = ?auto_1071046 ?auto_1071051 ) ) ( not ( = ?auto_1071046 ?auto_1071052 ) ) ( not ( = ?auto_1071046 ?auto_1071053 ) ) ( not ( = ?auto_1071046 ?auto_1071054 ) ) ( not ( = ?auto_1071046 ?auto_1071055 ) ) ( not ( = ?auto_1071046 ?auto_1071056 ) ) ( not ( = ?auto_1071047 ?auto_1071048 ) ) ( not ( = ?auto_1071047 ?auto_1071049 ) ) ( not ( = ?auto_1071047 ?auto_1071050 ) ) ( not ( = ?auto_1071047 ?auto_1071051 ) ) ( not ( = ?auto_1071047 ?auto_1071052 ) ) ( not ( = ?auto_1071047 ?auto_1071053 ) ) ( not ( = ?auto_1071047 ?auto_1071054 ) ) ( not ( = ?auto_1071047 ?auto_1071055 ) ) ( not ( = ?auto_1071047 ?auto_1071056 ) ) ( not ( = ?auto_1071048 ?auto_1071049 ) ) ( not ( = ?auto_1071048 ?auto_1071050 ) ) ( not ( = ?auto_1071048 ?auto_1071051 ) ) ( not ( = ?auto_1071048 ?auto_1071052 ) ) ( not ( = ?auto_1071048 ?auto_1071053 ) ) ( not ( = ?auto_1071048 ?auto_1071054 ) ) ( not ( = ?auto_1071048 ?auto_1071055 ) ) ( not ( = ?auto_1071048 ?auto_1071056 ) ) ( not ( = ?auto_1071049 ?auto_1071050 ) ) ( not ( = ?auto_1071049 ?auto_1071051 ) ) ( not ( = ?auto_1071049 ?auto_1071052 ) ) ( not ( = ?auto_1071049 ?auto_1071053 ) ) ( not ( = ?auto_1071049 ?auto_1071054 ) ) ( not ( = ?auto_1071049 ?auto_1071055 ) ) ( not ( = ?auto_1071049 ?auto_1071056 ) ) ( not ( = ?auto_1071050 ?auto_1071051 ) ) ( not ( = ?auto_1071050 ?auto_1071052 ) ) ( not ( = ?auto_1071050 ?auto_1071053 ) ) ( not ( = ?auto_1071050 ?auto_1071054 ) ) ( not ( = ?auto_1071050 ?auto_1071055 ) ) ( not ( = ?auto_1071050 ?auto_1071056 ) ) ( not ( = ?auto_1071051 ?auto_1071052 ) ) ( not ( = ?auto_1071051 ?auto_1071053 ) ) ( not ( = ?auto_1071051 ?auto_1071054 ) ) ( not ( = ?auto_1071051 ?auto_1071055 ) ) ( not ( = ?auto_1071051 ?auto_1071056 ) ) ( not ( = ?auto_1071052 ?auto_1071053 ) ) ( not ( = ?auto_1071052 ?auto_1071054 ) ) ( not ( = ?auto_1071052 ?auto_1071055 ) ) ( not ( = ?auto_1071052 ?auto_1071056 ) ) ( not ( = ?auto_1071053 ?auto_1071054 ) ) ( not ( = ?auto_1071053 ?auto_1071055 ) ) ( not ( = ?auto_1071053 ?auto_1071056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071054 ?auto_1071055 ?auto_1071056 )
      ( MAKE-11CRATE-VERIFY ?auto_1071045 ?auto_1071046 ?auto_1071047 ?auto_1071048 ?auto_1071049 ?auto_1071050 ?auto_1071051 ?auto_1071052 ?auto_1071053 ?auto_1071054 ?auto_1071055 ?auto_1071056 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071188 - SURFACE
      ?auto_1071189 - SURFACE
      ?auto_1071190 - SURFACE
      ?auto_1071191 - SURFACE
      ?auto_1071192 - SURFACE
      ?auto_1071193 - SURFACE
      ?auto_1071194 - SURFACE
      ?auto_1071195 - SURFACE
      ?auto_1071196 - SURFACE
      ?auto_1071197 - SURFACE
      ?auto_1071198 - SURFACE
      ?auto_1071199 - SURFACE
    )
    :vars
    (
      ?auto_1071200 - HOIST
      ?auto_1071205 - PLACE
      ?auto_1071202 - TRUCK
      ?auto_1071203 - PLACE
      ?auto_1071204 - HOIST
      ?auto_1071201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071200 ?auto_1071205 ) ( SURFACE-AT ?auto_1071198 ?auto_1071205 ) ( CLEAR ?auto_1071198 ) ( IS-CRATE ?auto_1071199 ) ( not ( = ?auto_1071198 ?auto_1071199 ) ) ( AVAILABLE ?auto_1071200 ) ( ON ?auto_1071198 ?auto_1071197 ) ( not ( = ?auto_1071197 ?auto_1071198 ) ) ( not ( = ?auto_1071197 ?auto_1071199 ) ) ( TRUCK-AT ?auto_1071202 ?auto_1071203 ) ( not ( = ?auto_1071203 ?auto_1071205 ) ) ( HOIST-AT ?auto_1071204 ?auto_1071203 ) ( not ( = ?auto_1071200 ?auto_1071204 ) ) ( AVAILABLE ?auto_1071204 ) ( SURFACE-AT ?auto_1071199 ?auto_1071203 ) ( ON ?auto_1071199 ?auto_1071201 ) ( CLEAR ?auto_1071199 ) ( not ( = ?auto_1071198 ?auto_1071201 ) ) ( not ( = ?auto_1071199 ?auto_1071201 ) ) ( not ( = ?auto_1071197 ?auto_1071201 ) ) ( ON ?auto_1071189 ?auto_1071188 ) ( ON ?auto_1071190 ?auto_1071189 ) ( ON ?auto_1071191 ?auto_1071190 ) ( ON ?auto_1071192 ?auto_1071191 ) ( ON ?auto_1071193 ?auto_1071192 ) ( ON ?auto_1071194 ?auto_1071193 ) ( ON ?auto_1071195 ?auto_1071194 ) ( ON ?auto_1071196 ?auto_1071195 ) ( ON ?auto_1071197 ?auto_1071196 ) ( not ( = ?auto_1071188 ?auto_1071189 ) ) ( not ( = ?auto_1071188 ?auto_1071190 ) ) ( not ( = ?auto_1071188 ?auto_1071191 ) ) ( not ( = ?auto_1071188 ?auto_1071192 ) ) ( not ( = ?auto_1071188 ?auto_1071193 ) ) ( not ( = ?auto_1071188 ?auto_1071194 ) ) ( not ( = ?auto_1071188 ?auto_1071195 ) ) ( not ( = ?auto_1071188 ?auto_1071196 ) ) ( not ( = ?auto_1071188 ?auto_1071197 ) ) ( not ( = ?auto_1071188 ?auto_1071198 ) ) ( not ( = ?auto_1071188 ?auto_1071199 ) ) ( not ( = ?auto_1071188 ?auto_1071201 ) ) ( not ( = ?auto_1071189 ?auto_1071190 ) ) ( not ( = ?auto_1071189 ?auto_1071191 ) ) ( not ( = ?auto_1071189 ?auto_1071192 ) ) ( not ( = ?auto_1071189 ?auto_1071193 ) ) ( not ( = ?auto_1071189 ?auto_1071194 ) ) ( not ( = ?auto_1071189 ?auto_1071195 ) ) ( not ( = ?auto_1071189 ?auto_1071196 ) ) ( not ( = ?auto_1071189 ?auto_1071197 ) ) ( not ( = ?auto_1071189 ?auto_1071198 ) ) ( not ( = ?auto_1071189 ?auto_1071199 ) ) ( not ( = ?auto_1071189 ?auto_1071201 ) ) ( not ( = ?auto_1071190 ?auto_1071191 ) ) ( not ( = ?auto_1071190 ?auto_1071192 ) ) ( not ( = ?auto_1071190 ?auto_1071193 ) ) ( not ( = ?auto_1071190 ?auto_1071194 ) ) ( not ( = ?auto_1071190 ?auto_1071195 ) ) ( not ( = ?auto_1071190 ?auto_1071196 ) ) ( not ( = ?auto_1071190 ?auto_1071197 ) ) ( not ( = ?auto_1071190 ?auto_1071198 ) ) ( not ( = ?auto_1071190 ?auto_1071199 ) ) ( not ( = ?auto_1071190 ?auto_1071201 ) ) ( not ( = ?auto_1071191 ?auto_1071192 ) ) ( not ( = ?auto_1071191 ?auto_1071193 ) ) ( not ( = ?auto_1071191 ?auto_1071194 ) ) ( not ( = ?auto_1071191 ?auto_1071195 ) ) ( not ( = ?auto_1071191 ?auto_1071196 ) ) ( not ( = ?auto_1071191 ?auto_1071197 ) ) ( not ( = ?auto_1071191 ?auto_1071198 ) ) ( not ( = ?auto_1071191 ?auto_1071199 ) ) ( not ( = ?auto_1071191 ?auto_1071201 ) ) ( not ( = ?auto_1071192 ?auto_1071193 ) ) ( not ( = ?auto_1071192 ?auto_1071194 ) ) ( not ( = ?auto_1071192 ?auto_1071195 ) ) ( not ( = ?auto_1071192 ?auto_1071196 ) ) ( not ( = ?auto_1071192 ?auto_1071197 ) ) ( not ( = ?auto_1071192 ?auto_1071198 ) ) ( not ( = ?auto_1071192 ?auto_1071199 ) ) ( not ( = ?auto_1071192 ?auto_1071201 ) ) ( not ( = ?auto_1071193 ?auto_1071194 ) ) ( not ( = ?auto_1071193 ?auto_1071195 ) ) ( not ( = ?auto_1071193 ?auto_1071196 ) ) ( not ( = ?auto_1071193 ?auto_1071197 ) ) ( not ( = ?auto_1071193 ?auto_1071198 ) ) ( not ( = ?auto_1071193 ?auto_1071199 ) ) ( not ( = ?auto_1071193 ?auto_1071201 ) ) ( not ( = ?auto_1071194 ?auto_1071195 ) ) ( not ( = ?auto_1071194 ?auto_1071196 ) ) ( not ( = ?auto_1071194 ?auto_1071197 ) ) ( not ( = ?auto_1071194 ?auto_1071198 ) ) ( not ( = ?auto_1071194 ?auto_1071199 ) ) ( not ( = ?auto_1071194 ?auto_1071201 ) ) ( not ( = ?auto_1071195 ?auto_1071196 ) ) ( not ( = ?auto_1071195 ?auto_1071197 ) ) ( not ( = ?auto_1071195 ?auto_1071198 ) ) ( not ( = ?auto_1071195 ?auto_1071199 ) ) ( not ( = ?auto_1071195 ?auto_1071201 ) ) ( not ( = ?auto_1071196 ?auto_1071197 ) ) ( not ( = ?auto_1071196 ?auto_1071198 ) ) ( not ( = ?auto_1071196 ?auto_1071199 ) ) ( not ( = ?auto_1071196 ?auto_1071201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071197 ?auto_1071198 ?auto_1071199 )
      ( MAKE-11CRATE-VERIFY ?auto_1071188 ?auto_1071189 ?auto_1071190 ?auto_1071191 ?auto_1071192 ?auto_1071193 ?auto_1071194 ?auto_1071195 ?auto_1071196 ?auto_1071197 ?auto_1071198 ?auto_1071199 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071332 - SURFACE
      ?auto_1071333 - SURFACE
      ?auto_1071334 - SURFACE
      ?auto_1071335 - SURFACE
      ?auto_1071336 - SURFACE
      ?auto_1071337 - SURFACE
      ?auto_1071338 - SURFACE
      ?auto_1071339 - SURFACE
      ?auto_1071340 - SURFACE
      ?auto_1071341 - SURFACE
      ?auto_1071342 - SURFACE
      ?auto_1071343 - SURFACE
    )
    :vars
    (
      ?auto_1071348 - HOIST
      ?auto_1071346 - PLACE
      ?auto_1071349 - PLACE
      ?auto_1071345 - HOIST
      ?auto_1071347 - SURFACE
      ?auto_1071344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071348 ?auto_1071346 ) ( SURFACE-AT ?auto_1071342 ?auto_1071346 ) ( CLEAR ?auto_1071342 ) ( IS-CRATE ?auto_1071343 ) ( not ( = ?auto_1071342 ?auto_1071343 ) ) ( AVAILABLE ?auto_1071348 ) ( ON ?auto_1071342 ?auto_1071341 ) ( not ( = ?auto_1071341 ?auto_1071342 ) ) ( not ( = ?auto_1071341 ?auto_1071343 ) ) ( not ( = ?auto_1071349 ?auto_1071346 ) ) ( HOIST-AT ?auto_1071345 ?auto_1071349 ) ( not ( = ?auto_1071348 ?auto_1071345 ) ) ( AVAILABLE ?auto_1071345 ) ( SURFACE-AT ?auto_1071343 ?auto_1071349 ) ( ON ?auto_1071343 ?auto_1071347 ) ( CLEAR ?auto_1071343 ) ( not ( = ?auto_1071342 ?auto_1071347 ) ) ( not ( = ?auto_1071343 ?auto_1071347 ) ) ( not ( = ?auto_1071341 ?auto_1071347 ) ) ( TRUCK-AT ?auto_1071344 ?auto_1071346 ) ( ON ?auto_1071333 ?auto_1071332 ) ( ON ?auto_1071334 ?auto_1071333 ) ( ON ?auto_1071335 ?auto_1071334 ) ( ON ?auto_1071336 ?auto_1071335 ) ( ON ?auto_1071337 ?auto_1071336 ) ( ON ?auto_1071338 ?auto_1071337 ) ( ON ?auto_1071339 ?auto_1071338 ) ( ON ?auto_1071340 ?auto_1071339 ) ( ON ?auto_1071341 ?auto_1071340 ) ( not ( = ?auto_1071332 ?auto_1071333 ) ) ( not ( = ?auto_1071332 ?auto_1071334 ) ) ( not ( = ?auto_1071332 ?auto_1071335 ) ) ( not ( = ?auto_1071332 ?auto_1071336 ) ) ( not ( = ?auto_1071332 ?auto_1071337 ) ) ( not ( = ?auto_1071332 ?auto_1071338 ) ) ( not ( = ?auto_1071332 ?auto_1071339 ) ) ( not ( = ?auto_1071332 ?auto_1071340 ) ) ( not ( = ?auto_1071332 ?auto_1071341 ) ) ( not ( = ?auto_1071332 ?auto_1071342 ) ) ( not ( = ?auto_1071332 ?auto_1071343 ) ) ( not ( = ?auto_1071332 ?auto_1071347 ) ) ( not ( = ?auto_1071333 ?auto_1071334 ) ) ( not ( = ?auto_1071333 ?auto_1071335 ) ) ( not ( = ?auto_1071333 ?auto_1071336 ) ) ( not ( = ?auto_1071333 ?auto_1071337 ) ) ( not ( = ?auto_1071333 ?auto_1071338 ) ) ( not ( = ?auto_1071333 ?auto_1071339 ) ) ( not ( = ?auto_1071333 ?auto_1071340 ) ) ( not ( = ?auto_1071333 ?auto_1071341 ) ) ( not ( = ?auto_1071333 ?auto_1071342 ) ) ( not ( = ?auto_1071333 ?auto_1071343 ) ) ( not ( = ?auto_1071333 ?auto_1071347 ) ) ( not ( = ?auto_1071334 ?auto_1071335 ) ) ( not ( = ?auto_1071334 ?auto_1071336 ) ) ( not ( = ?auto_1071334 ?auto_1071337 ) ) ( not ( = ?auto_1071334 ?auto_1071338 ) ) ( not ( = ?auto_1071334 ?auto_1071339 ) ) ( not ( = ?auto_1071334 ?auto_1071340 ) ) ( not ( = ?auto_1071334 ?auto_1071341 ) ) ( not ( = ?auto_1071334 ?auto_1071342 ) ) ( not ( = ?auto_1071334 ?auto_1071343 ) ) ( not ( = ?auto_1071334 ?auto_1071347 ) ) ( not ( = ?auto_1071335 ?auto_1071336 ) ) ( not ( = ?auto_1071335 ?auto_1071337 ) ) ( not ( = ?auto_1071335 ?auto_1071338 ) ) ( not ( = ?auto_1071335 ?auto_1071339 ) ) ( not ( = ?auto_1071335 ?auto_1071340 ) ) ( not ( = ?auto_1071335 ?auto_1071341 ) ) ( not ( = ?auto_1071335 ?auto_1071342 ) ) ( not ( = ?auto_1071335 ?auto_1071343 ) ) ( not ( = ?auto_1071335 ?auto_1071347 ) ) ( not ( = ?auto_1071336 ?auto_1071337 ) ) ( not ( = ?auto_1071336 ?auto_1071338 ) ) ( not ( = ?auto_1071336 ?auto_1071339 ) ) ( not ( = ?auto_1071336 ?auto_1071340 ) ) ( not ( = ?auto_1071336 ?auto_1071341 ) ) ( not ( = ?auto_1071336 ?auto_1071342 ) ) ( not ( = ?auto_1071336 ?auto_1071343 ) ) ( not ( = ?auto_1071336 ?auto_1071347 ) ) ( not ( = ?auto_1071337 ?auto_1071338 ) ) ( not ( = ?auto_1071337 ?auto_1071339 ) ) ( not ( = ?auto_1071337 ?auto_1071340 ) ) ( not ( = ?auto_1071337 ?auto_1071341 ) ) ( not ( = ?auto_1071337 ?auto_1071342 ) ) ( not ( = ?auto_1071337 ?auto_1071343 ) ) ( not ( = ?auto_1071337 ?auto_1071347 ) ) ( not ( = ?auto_1071338 ?auto_1071339 ) ) ( not ( = ?auto_1071338 ?auto_1071340 ) ) ( not ( = ?auto_1071338 ?auto_1071341 ) ) ( not ( = ?auto_1071338 ?auto_1071342 ) ) ( not ( = ?auto_1071338 ?auto_1071343 ) ) ( not ( = ?auto_1071338 ?auto_1071347 ) ) ( not ( = ?auto_1071339 ?auto_1071340 ) ) ( not ( = ?auto_1071339 ?auto_1071341 ) ) ( not ( = ?auto_1071339 ?auto_1071342 ) ) ( not ( = ?auto_1071339 ?auto_1071343 ) ) ( not ( = ?auto_1071339 ?auto_1071347 ) ) ( not ( = ?auto_1071340 ?auto_1071341 ) ) ( not ( = ?auto_1071340 ?auto_1071342 ) ) ( not ( = ?auto_1071340 ?auto_1071343 ) ) ( not ( = ?auto_1071340 ?auto_1071347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071341 ?auto_1071342 ?auto_1071343 )
      ( MAKE-11CRATE-VERIFY ?auto_1071332 ?auto_1071333 ?auto_1071334 ?auto_1071335 ?auto_1071336 ?auto_1071337 ?auto_1071338 ?auto_1071339 ?auto_1071340 ?auto_1071341 ?auto_1071342 ?auto_1071343 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071476 - SURFACE
      ?auto_1071477 - SURFACE
      ?auto_1071478 - SURFACE
      ?auto_1071479 - SURFACE
      ?auto_1071480 - SURFACE
      ?auto_1071481 - SURFACE
      ?auto_1071482 - SURFACE
      ?auto_1071483 - SURFACE
      ?auto_1071484 - SURFACE
      ?auto_1071485 - SURFACE
      ?auto_1071486 - SURFACE
      ?auto_1071487 - SURFACE
    )
    :vars
    (
      ?auto_1071491 - HOIST
      ?auto_1071493 - PLACE
      ?auto_1071489 - PLACE
      ?auto_1071490 - HOIST
      ?auto_1071492 - SURFACE
      ?auto_1071488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071491 ?auto_1071493 ) ( IS-CRATE ?auto_1071487 ) ( not ( = ?auto_1071486 ?auto_1071487 ) ) ( not ( = ?auto_1071485 ?auto_1071486 ) ) ( not ( = ?auto_1071485 ?auto_1071487 ) ) ( not ( = ?auto_1071489 ?auto_1071493 ) ) ( HOIST-AT ?auto_1071490 ?auto_1071489 ) ( not ( = ?auto_1071491 ?auto_1071490 ) ) ( AVAILABLE ?auto_1071490 ) ( SURFACE-AT ?auto_1071487 ?auto_1071489 ) ( ON ?auto_1071487 ?auto_1071492 ) ( CLEAR ?auto_1071487 ) ( not ( = ?auto_1071486 ?auto_1071492 ) ) ( not ( = ?auto_1071487 ?auto_1071492 ) ) ( not ( = ?auto_1071485 ?auto_1071492 ) ) ( TRUCK-AT ?auto_1071488 ?auto_1071493 ) ( SURFACE-AT ?auto_1071485 ?auto_1071493 ) ( CLEAR ?auto_1071485 ) ( LIFTING ?auto_1071491 ?auto_1071486 ) ( IS-CRATE ?auto_1071486 ) ( ON ?auto_1071477 ?auto_1071476 ) ( ON ?auto_1071478 ?auto_1071477 ) ( ON ?auto_1071479 ?auto_1071478 ) ( ON ?auto_1071480 ?auto_1071479 ) ( ON ?auto_1071481 ?auto_1071480 ) ( ON ?auto_1071482 ?auto_1071481 ) ( ON ?auto_1071483 ?auto_1071482 ) ( ON ?auto_1071484 ?auto_1071483 ) ( ON ?auto_1071485 ?auto_1071484 ) ( not ( = ?auto_1071476 ?auto_1071477 ) ) ( not ( = ?auto_1071476 ?auto_1071478 ) ) ( not ( = ?auto_1071476 ?auto_1071479 ) ) ( not ( = ?auto_1071476 ?auto_1071480 ) ) ( not ( = ?auto_1071476 ?auto_1071481 ) ) ( not ( = ?auto_1071476 ?auto_1071482 ) ) ( not ( = ?auto_1071476 ?auto_1071483 ) ) ( not ( = ?auto_1071476 ?auto_1071484 ) ) ( not ( = ?auto_1071476 ?auto_1071485 ) ) ( not ( = ?auto_1071476 ?auto_1071486 ) ) ( not ( = ?auto_1071476 ?auto_1071487 ) ) ( not ( = ?auto_1071476 ?auto_1071492 ) ) ( not ( = ?auto_1071477 ?auto_1071478 ) ) ( not ( = ?auto_1071477 ?auto_1071479 ) ) ( not ( = ?auto_1071477 ?auto_1071480 ) ) ( not ( = ?auto_1071477 ?auto_1071481 ) ) ( not ( = ?auto_1071477 ?auto_1071482 ) ) ( not ( = ?auto_1071477 ?auto_1071483 ) ) ( not ( = ?auto_1071477 ?auto_1071484 ) ) ( not ( = ?auto_1071477 ?auto_1071485 ) ) ( not ( = ?auto_1071477 ?auto_1071486 ) ) ( not ( = ?auto_1071477 ?auto_1071487 ) ) ( not ( = ?auto_1071477 ?auto_1071492 ) ) ( not ( = ?auto_1071478 ?auto_1071479 ) ) ( not ( = ?auto_1071478 ?auto_1071480 ) ) ( not ( = ?auto_1071478 ?auto_1071481 ) ) ( not ( = ?auto_1071478 ?auto_1071482 ) ) ( not ( = ?auto_1071478 ?auto_1071483 ) ) ( not ( = ?auto_1071478 ?auto_1071484 ) ) ( not ( = ?auto_1071478 ?auto_1071485 ) ) ( not ( = ?auto_1071478 ?auto_1071486 ) ) ( not ( = ?auto_1071478 ?auto_1071487 ) ) ( not ( = ?auto_1071478 ?auto_1071492 ) ) ( not ( = ?auto_1071479 ?auto_1071480 ) ) ( not ( = ?auto_1071479 ?auto_1071481 ) ) ( not ( = ?auto_1071479 ?auto_1071482 ) ) ( not ( = ?auto_1071479 ?auto_1071483 ) ) ( not ( = ?auto_1071479 ?auto_1071484 ) ) ( not ( = ?auto_1071479 ?auto_1071485 ) ) ( not ( = ?auto_1071479 ?auto_1071486 ) ) ( not ( = ?auto_1071479 ?auto_1071487 ) ) ( not ( = ?auto_1071479 ?auto_1071492 ) ) ( not ( = ?auto_1071480 ?auto_1071481 ) ) ( not ( = ?auto_1071480 ?auto_1071482 ) ) ( not ( = ?auto_1071480 ?auto_1071483 ) ) ( not ( = ?auto_1071480 ?auto_1071484 ) ) ( not ( = ?auto_1071480 ?auto_1071485 ) ) ( not ( = ?auto_1071480 ?auto_1071486 ) ) ( not ( = ?auto_1071480 ?auto_1071487 ) ) ( not ( = ?auto_1071480 ?auto_1071492 ) ) ( not ( = ?auto_1071481 ?auto_1071482 ) ) ( not ( = ?auto_1071481 ?auto_1071483 ) ) ( not ( = ?auto_1071481 ?auto_1071484 ) ) ( not ( = ?auto_1071481 ?auto_1071485 ) ) ( not ( = ?auto_1071481 ?auto_1071486 ) ) ( not ( = ?auto_1071481 ?auto_1071487 ) ) ( not ( = ?auto_1071481 ?auto_1071492 ) ) ( not ( = ?auto_1071482 ?auto_1071483 ) ) ( not ( = ?auto_1071482 ?auto_1071484 ) ) ( not ( = ?auto_1071482 ?auto_1071485 ) ) ( not ( = ?auto_1071482 ?auto_1071486 ) ) ( not ( = ?auto_1071482 ?auto_1071487 ) ) ( not ( = ?auto_1071482 ?auto_1071492 ) ) ( not ( = ?auto_1071483 ?auto_1071484 ) ) ( not ( = ?auto_1071483 ?auto_1071485 ) ) ( not ( = ?auto_1071483 ?auto_1071486 ) ) ( not ( = ?auto_1071483 ?auto_1071487 ) ) ( not ( = ?auto_1071483 ?auto_1071492 ) ) ( not ( = ?auto_1071484 ?auto_1071485 ) ) ( not ( = ?auto_1071484 ?auto_1071486 ) ) ( not ( = ?auto_1071484 ?auto_1071487 ) ) ( not ( = ?auto_1071484 ?auto_1071492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071485 ?auto_1071486 ?auto_1071487 )
      ( MAKE-11CRATE-VERIFY ?auto_1071476 ?auto_1071477 ?auto_1071478 ?auto_1071479 ?auto_1071480 ?auto_1071481 ?auto_1071482 ?auto_1071483 ?auto_1071484 ?auto_1071485 ?auto_1071486 ?auto_1071487 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1071620 - SURFACE
      ?auto_1071621 - SURFACE
      ?auto_1071622 - SURFACE
      ?auto_1071623 - SURFACE
      ?auto_1071624 - SURFACE
      ?auto_1071625 - SURFACE
      ?auto_1071626 - SURFACE
      ?auto_1071627 - SURFACE
      ?auto_1071628 - SURFACE
      ?auto_1071629 - SURFACE
      ?auto_1071630 - SURFACE
      ?auto_1071631 - SURFACE
    )
    :vars
    (
      ?auto_1071635 - HOIST
      ?auto_1071636 - PLACE
      ?auto_1071637 - PLACE
      ?auto_1071632 - HOIST
      ?auto_1071634 - SURFACE
      ?auto_1071633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1071635 ?auto_1071636 ) ( IS-CRATE ?auto_1071631 ) ( not ( = ?auto_1071630 ?auto_1071631 ) ) ( not ( = ?auto_1071629 ?auto_1071630 ) ) ( not ( = ?auto_1071629 ?auto_1071631 ) ) ( not ( = ?auto_1071637 ?auto_1071636 ) ) ( HOIST-AT ?auto_1071632 ?auto_1071637 ) ( not ( = ?auto_1071635 ?auto_1071632 ) ) ( AVAILABLE ?auto_1071632 ) ( SURFACE-AT ?auto_1071631 ?auto_1071637 ) ( ON ?auto_1071631 ?auto_1071634 ) ( CLEAR ?auto_1071631 ) ( not ( = ?auto_1071630 ?auto_1071634 ) ) ( not ( = ?auto_1071631 ?auto_1071634 ) ) ( not ( = ?auto_1071629 ?auto_1071634 ) ) ( TRUCK-AT ?auto_1071633 ?auto_1071636 ) ( SURFACE-AT ?auto_1071629 ?auto_1071636 ) ( CLEAR ?auto_1071629 ) ( IS-CRATE ?auto_1071630 ) ( AVAILABLE ?auto_1071635 ) ( IN ?auto_1071630 ?auto_1071633 ) ( ON ?auto_1071621 ?auto_1071620 ) ( ON ?auto_1071622 ?auto_1071621 ) ( ON ?auto_1071623 ?auto_1071622 ) ( ON ?auto_1071624 ?auto_1071623 ) ( ON ?auto_1071625 ?auto_1071624 ) ( ON ?auto_1071626 ?auto_1071625 ) ( ON ?auto_1071627 ?auto_1071626 ) ( ON ?auto_1071628 ?auto_1071627 ) ( ON ?auto_1071629 ?auto_1071628 ) ( not ( = ?auto_1071620 ?auto_1071621 ) ) ( not ( = ?auto_1071620 ?auto_1071622 ) ) ( not ( = ?auto_1071620 ?auto_1071623 ) ) ( not ( = ?auto_1071620 ?auto_1071624 ) ) ( not ( = ?auto_1071620 ?auto_1071625 ) ) ( not ( = ?auto_1071620 ?auto_1071626 ) ) ( not ( = ?auto_1071620 ?auto_1071627 ) ) ( not ( = ?auto_1071620 ?auto_1071628 ) ) ( not ( = ?auto_1071620 ?auto_1071629 ) ) ( not ( = ?auto_1071620 ?auto_1071630 ) ) ( not ( = ?auto_1071620 ?auto_1071631 ) ) ( not ( = ?auto_1071620 ?auto_1071634 ) ) ( not ( = ?auto_1071621 ?auto_1071622 ) ) ( not ( = ?auto_1071621 ?auto_1071623 ) ) ( not ( = ?auto_1071621 ?auto_1071624 ) ) ( not ( = ?auto_1071621 ?auto_1071625 ) ) ( not ( = ?auto_1071621 ?auto_1071626 ) ) ( not ( = ?auto_1071621 ?auto_1071627 ) ) ( not ( = ?auto_1071621 ?auto_1071628 ) ) ( not ( = ?auto_1071621 ?auto_1071629 ) ) ( not ( = ?auto_1071621 ?auto_1071630 ) ) ( not ( = ?auto_1071621 ?auto_1071631 ) ) ( not ( = ?auto_1071621 ?auto_1071634 ) ) ( not ( = ?auto_1071622 ?auto_1071623 ) ) ( not ( = ?auto_1071622 ?auto_1071624 ) ) ( not ( = ?auto_1071622 ?auto_1071625 ) ) ( not ( = ?auto_1071622 ?auto_1071626 ) ) ( not ( = ?auto_1071622 ?auto_1071627 ) ) ( not ( = ?auto_1071622 ?auto_1071628 ) ) ( not ( = ?auto_1071622 ?auto_1071629 ) ) ( not ( = ?auto_1071622 ?auto_1071630 ) ) ( not ( = ?auto_1071622 ?auto_1071631 ) ) ( not ( = ?auto_1071622 ?auto_1071634 ) ) ( not ( = ?auto_1071623 ?auto_1071624 ) ) ( not ( = ?auto_1071623 ?auto_1071625 ) ) ( not ( = ?auto_1071623 ?auto_1071626 ) ) ( not ( = ?auto_1071623 ?auto_1071627 ) ) ( not ( = ?auto_1071623 ?auto_1071628 ) ) ( not ( = ?auto_1071623 ?auto_1071629 ) ) ( not ( = ?auto_1071623 ?auto_1071630 ) ) ( not ( = ?auto_1071623 ?auto_1071631 ) ) ( not ( = ?auto_1071623 ?auto_1071634 ) ) ( not ( = ?auto_1071624 ?auto_1071625 ) ) ( not ( = ?auto_1071624 ?auto_1071626 ) ) ( not ( = ?auto_1071624 ?auto_1071627 ) ) ( not ( = ?auto_1071624 ?auto_1071628 ) ) ( not ( = ?auto_1071624 ?auto_1071629 ) ) ( not ( = ?auto_1071624 ?auto_1071630 ) ) ( not ( = ?auto_1071624 ?auto_1071631 ) ) ( not ( = ?auto_1071624 ?auto_1071634 ) ) ( not ( = ?auto_1071625 ?auto_1071626 ) ) ( not ( = ?auto_1071625 ?auto_1071627 ) ) ( not ( = ?auto_1071625 ?auto_1071628 ) ) ( not ( = ?auto_1071625 ?auto_1071629 ) ) ( not ( = ?auto_1071625 ?auto_1071630 ) ) ( not ( = ?auto_1071625 ?auto_1071631 ) ) ( not ( = ?auto_1071625 ?auto_1071634 ) ) ( not ( = ?auto_1071626 ?auto_1071627 ) ) ( not ( = ?auto_1071626 ?auto_1071628 ) ) ( not ( = ?auto_1071626 ?auto_1071629 ) ) ( not ( = ?auto_1071626 ?auto_1071630 ) ) ( not ( = ?auto_1071626 ?auto_1071631 ) ) ( not ( = ?auto_1071626 ?auto_1071634 ) ) ( not ( = ?auto_1071627 ?auto_1071628 ) ) ( not ( = ?auto_1071627 ?auto_1071629 ) ) ( not ( = ?auto_1071627 ?auto_1071630 ) ) ( not ( = ?auto_1071627 ?auto_1071631 ) ) ( not ( = ?auto_1071627 ?auto_1071634 ) ) ( not ( = ?auto_1071628 ?auto_1071629 ) ) ( not ( = ?auto_1071628 ?auto_1071630 ) ) ( not ( = ?auto_1071628 ?auto_1071631 ) ) ( not ( = ?auto_1071628 ?auto_1071634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1071629 ?auto_1071630 ?auto_1071631 )
      ( MAKE-11CRATE-VERIFY ?auto_1071620 ?auto_1071621 ?auto_1071622 ?auto_1071623 ?auto_1071624 ?auto_1071625 ?auto_1071626 ?auto_1071627 ?auto_1071628 ?auto_1071629 ?auto_1071630 ?auto_1071631 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1080911 - SURFACE
      ?auto_1080912 - SURFACE
      ?auto_1080913 - SURFACE
      ?auto_1080914 - SURFACE
      ?auto_1080915 - SURFACE
      ?auto_1080916 - SURFACE
      ?auto_1080917 - SURFACE
      ?auto_1080918 - SURFACE
      ?auto_1080919 - SURFACE
      ?auto_1080920 - SURFACE
      ?auto_1080921 - SURFACE
      ?auto_1080922 - SURFACE
      ?auto_1080923 - SURFACE
    )
    :vars
    (
      ?auto_1080925 - HOIST
      ?auto_1080924 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1080925 ?auto_1080924 ) ( SURFACE-AT ?auto_1080922 ?auto_1080924 ) ( CLEAR ?auto_1080922 ) ( LIFTING ?auto_1080925 ?auto_1080923 ) ( IS-CRATE ?auto_1080923 ) ( not ( = ?auto_1080922 ?auto_1080923 ) ) ( ON ?auto_1080912 ?auto_1080911 ) ( ON ?auto_1080913 ?auto_1080912 ) ( ON ?auto_1080914 ?auto_1080913 ) ( ON ?auto_1080915 ?auto_1080914 ) ( ON ?auto_1080916 ?auto_1080915 ) ( ON ?auto_1080917 ?auto_1080916 ) ( ON ?auto_1080918 ?auto_1080917 ) ( ON ?auto_1080919 ?auto_1080918 ) ( ON ?auto_1080920 ?auto_1080919 ) ( ON ?auto_1080921 ?auto_1080920 ) ( ON ?auto_1080922 ?auto_1080921 ) ( not ( = ?auto_1080911 ?auto_1080912 ) ) ( not ( = ?auto_1080911 ?auto_1080913 ) ) ( not ( = ?auto_1080911 ?auto_1080914 ) ) ( not ( = ?auto_1080911 ?auto_1080915 ) ) ( not ( = ?auto_1080911 ?auto_1080916 ) ) ( not ( = ?auto_1080911 ?auto_1080917 ) ) ( not ( = ?auto_1080911 ?auto_1080918 ) ) ( not ( = ?auto_1080911 ?auto_1080919 ) ) ( not ( = ?auto_1080911 ?auto_1080920 ) ) ( not ( = ?auto_1080911 ?auto_1080921 ) ) ( not ( = ?auto_1080911 ?auto_1080922 ) ) ( not ( = ?auto_1080911 ?auto_1080923 ) ) ( not ( = ?auto_1080912 ?auto_1080913 ) ) ( not ( = ?auto_1080912 ?auto_1080914 ) ) ( not ( = ?auto_1080912 ?auto_1080915 ) ) ( not ( = ?auto_1080912 ?auto_1080916 ) ) ( not ( = ?auto_1080912 ?auto_1080917 ) ) ( not ( = ?auto_1080912 ?auto_1080918 ) ) ( not ( = ?auto_1080912 ?auto_1080919 ) ) ( not ( = ?auto_1080912 ?auto_1080920 ) ) ( not ( = ?auto_1080912 ?auto_1080921 ) ) ( not ( = ?auto_1080912 ?auto_1080922 ) ) ( not ( = ?auto_1080912 ?auto_1080923 ) ) ( not ( = ?auto_1080913 ?auto_1080914 ) ) ( not ( = ?auto_1080913 ?auto_1080915 ) ) ( not ( = ?auto_1080913 ?auto_1080916 ) ) ( not ( = ?auto_1080913 ?auto_1080917 ) ) ( not ( = ?auto_1080913 ?auto_1080918 ) ) ( not ( = ?auto_1080913 ?auto_1080919 ) ) ( not ( = ?auto_1080913 ?auto_1080920 ) ) ( not ( = ?auto_1080913 ?auto_1080921 ) ) ( not ( = ?auto_1080913 ?auto_1080922 ) ) ( not ( = ?auto_1080913 ?auto_1080923 ) ) ( not ( = ?auto_1080914 ?auto_1080915 ) ) ( not ( = ?auto_1080914 ?auto_1080916 ) ) ( not ( = ?auto_1080914 ?auto_1080917 ) ) ( not ( = ?auto_1080914 ?auto_1080918 ) ) ( not ( = ?auto_1080914 ?auto_1080919 ) ) ( not ( = ?auto_1080914 ?auto_1080920 ) ) ( not ( = ?auto_1080914 ?auto_1080921 ) ) ( not ( = ?auto_1080914 ?auto_1080922 ) ) ( not ( = ?auto_1080914 ?auto_1080923 ) ) ( not ( = ?auto_1080915 ?auto_1080916 ) ) ( not ( = ?auto_1080915 ?auto_1080917 ) ) ( not ( = ?auto_1080915 ?auto_1080918 ) ) ( not ( = ?auto_1080915 ?auto_1080919 ) ) ( not ( = ?auto_1080915 ?auto_1080920 ) ) ( not ( = ?auto_1080915 ?auto_1080921 ) ) ( not ( = ?auto_1080915 ?auto_1080922 ) ) ( not ( = ?auto_1080915 ?auto_1080923 ) ) ( not ( = ?auto_1080916 ?auto_1080917 ) ) ( not ( = ?auto_1080916 ?auto_1080918 ) ) ( not ( = ?auto_1080916 ?auto_1080919 ) ) ( not ( = ?auto_1080916 ?auto_1080920 ) ) ( not ( = ?auto_1080916 ?auto_1080921 ) ) ( not ( = ?auto_1080916 ?auto_1080922 ) ) ( not ( = ?auto_1080916 ?auto_1080923 ) ) ( not ( = ?auto_1080917 ?auto_1080918 ) ) ( not ( = ?auto_1080917 ?auto_1080919 ) ) ( not ( = ?auto_1080917 ?auto_1080920 ) ) ( not ( = ?auto_1080917 ?auto_1080921 ) ) ( not ( = ?auto_1080917 ?auto_1080922 ) ) ( not ( = ?auto_1080917 ?auto_1080923 ) ) ( not ( = ?auto_1080918 ?auto_1080919 ) ) ( not ( = ?auto_1080918 ?auto_1080920 ) ) ( not ( = ?auto_1080918 ?auto_1080921 ) ) ( not ( = ?auto_1080918 ?auto_1080922 ) ) ( not ( = ?auto_1080918 ?auto_1080923 ) ) ( not ( = ?auto_1080919 ?auto_1080920 ) ) ( not ( = ?auto_1080919 ?auto_1080921 ) ) ( not ( = ?auto_1080919 ?auto_1080922 ) ) ( not ( = ?auto_1080919 ?auto_1080923 ) ) ( not ( = ?auto_1080920 ?auto_1080921 ) ) ( not ( = ?auto_1080920 ?auto_1080922 ) ) ( not ( = ?auto_1080920 ?auto_1080923 ) ) ( not ( = ?auto_1080921 ?auto_1080922 ) ) ( not ( = ?auto_1080921 ?auto_1080923 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1080922 ?auto_1080923 )
      ( MAKE-12CRATE-VERIFY ?auto_1080911 ?auto_1080912 ?auto_1080913 ?auto_1080914 ?auto_1080915 ?auto_1080916 ?auto_1080917 ?auto_1080918 ?auto_1080919 ?auto_1080920 ?auto_1080921 ?auto_1080922 ?auto_1080923 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081036 - SURFACE
      ?auto_1081037 - SURFACE
      ?auto_1081038 - SURFACE
      ?auto_1081039 - SURFACE
      ?auto_1081040 - SURFACE
      ?auto_1081041 - SURFACE
      ?auto_1081042 - SURFACE
      ?auto_1081043 - SURFACE
      ?auto_1081044 - SURFACE
      ?auto_1081045 - SURFACE
      ?auto_1081046 - SURFACE
      ?auto_1081047 - SURFACE
      ?auto_1081048 - SURFACE
    )
    :vars
    (
      ?auto_1081051 - HOIST
      ?auto_1081049 - PLACE
      ?auto_1081050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081051 ?auto_1081049 ) ( SURFACE-AT ?auto_1081047 ?auto_1081049 ) ( CLEAR ?auto_1081047 ) ( IS-CRATE ?auto_1081048 ) ( not ( = ?auto_1081047 ?auto_1081048 ) ) ( TRUCK-AT ?auto_1081050 ?auto_1081049 ) ( AVAILABLE ?auto_1081051 ) ( IN ?auto_1081048 ?auto_1081050 ) ( ON ?auto_1081047 ?auto_1081046 ) ( not ( = ?auto_1081046 ?auto_1081047 ) ) ( not ( = ?auto_1081046 ?auto_1081048 ) ) ( ON ?auto_1081037 ?auto_1081036 ) ( ON ?auto_1081038 ?auto_1081037 ) ( ON ?auto_1081039 ?auto_1081038 ) ( ON ?auto_1081040 ?auto_1081039 ) ( ON ?auto_1081041 ?auto_1081040 ) ( ON ?auto_1081042 ?auto_1081041 ) ( ON ?auto_1081043 ?auto_1081042 ) ( ON ?auto_1081044 ?auto_1081043 ) ( ON ?auto_1081045 ?auto_1081044 ) ( ON ?auto_1081046 ?auto_1081045 ) ( not ( = ?auto_1081036 ?auto_1081037 ) ) ( not ( = ?auto_1081036 ?auto_1081038 ) ) ( not ( = ?auto_1081036 ?auto_1081039 ) ) ( not ( = ?auto_1081036 ?auto_1081040 ) ) ( not ( = ?auto_1081036 ?auto_1081041 ) ) ( not ( = ?auto_1081036 ?auto_1081042 ) ) ( not ( = ?auto_1081036 ?auto_1081043 ) ) ( not ( = ?auto_1081036 ?auto_1081044 ) ) ( not ( = ?auto_1081036 ?auto_1081045 ) ) ( not ( = ?auto_1081036 ?auto_1081046 ) ) ( not ( = ?auto_1081036 ?auto_1081047 ) ) ( not ( = ?auto_1081036 ?auto_1081048 ) ) ( not ( = ?auto_1081037 ?auto_1081038 ) ) ( not ( = ?auto_1081037 ?auto_1081039 ) ) ( not ( = ?auto_1081037 ?auto_1081040 ) ) ( not ( = ?auto_1081037 ?auto_1081041 ) ) ( not ( = ?auto_1081037 ?auto_1081042 ) ) ( not ( = ?auto_1081037 ?auto_1081043 ) ) ( not ( = ?auto_1081037 ?auto_1081044 ) ) ( not ( = ?auto_1081037 ?auto_1081045 ) ) ( not ( = ?auto_1081037 ?auto_1081046 ) ) ( not ( = ?auto_1081037 ?auto_1081047 ) ) ( not ( = ?auto_1081037 ?auto_1081048 ) ) ( not ( = ?auto_1081038 ?auto_1081039 ) ) ( not ( = ?auto_1081038 ?auto_1081040 ) ) ( not ( = ?auto_1081038 ?auto_1081041 ) ) ( not ( = ?auto_1081038 ?auto_1081042 ) ) ( not ( = ?auto_1081038 ?auto_1081043 ) ) ( not ( = ?auto_1081038 ?auto_1081044 ) ) ( not ( = ?auto_1081038 ?auto_1081045 ) ) ( not ( = ?auto_1081038 ?auto_1081046 ) ) ( not ( = ?auto_1081038 ?auto_1081047 ) ) ( not ( = ?auto_1081038 ?auto_1081048 ) ) ( not ( = ?auto_1081039 ?auto_1081040 ) ) ( not ( = ?auto_1081039 ?auto_1081041 ) ) ( not ( = ?auto_1081039 ?auto_1081042 ) ) ( not ( = ?auto_1081039 ?auto_1081043 ) ) ( not ( = ?auto_1081039 ?auto_1081044 ) ) ( not ( = ?auto_1081039 ?auto_1081045 ) ) ( not ( = ?auto_1081039 ?auto_1081046 ) ) ( not ( = ?auto_1081039 ?auto_1081047 ) ) ( not ( = ?auto_1081039 ?auto_1081048 ) ) ( not ( = ?auto_1081040 ?auto_1081041 ) ) ( not ( = ?auto_1081040 ?auto_1081042 ) ) ( not ( = ?auto_1081040 ?auto_1081043 ) ) ( not ( = ?auto_1081040 ?auto_1081044 ) ) ( not ( = ?auto_1081040 ?auto_1081045 ) ) ( not ( = ?auto_1081040 ?auto_1081046 ) ) ( not ( = ?auto_1081040 ?auto_1081047 ) ) ( not ( = ?auto_1081040 ?auto_1081048 ) ) ( not ( = ?auto_1081041 ?auto_1081042 ) ) ( not ( = ?auto_1081041 ?auto_1081043 ) ) ( not ( = ?auto_1081041 ?auto_1081044 ) ) ( not ( = ?auto_1081041 ?auto_1081045 ) ) ( not ( = ?auto_1081041 ?auto_1081046 ) ) ( not ( = ?auto_1081041 ?auto_1081047 ) ) ( not ( = ?auto_1081041 ?auto_1081048 ) ) ( not ( = ?auto_1081042 ?auto_1081043 ) ) ( not ( = ?auto_1081042 ?auto_1081044 ) ) ( not ( = ?auto_1081042 ?auto_1081045 ) ) ( not ( = ?auto_1081042 ?auto_1081046 ) ) ( not ( = ?auto_1081042 ?auto_1081047 ) ) ( not ( = ?auto_1081042 ?auto_1081048 ) ) ( not ( = ?auto_1081043 ?auto_1081044 ) ) ( not ( = ?auto_1081043 ?auto_1081045 ) ) ( not ( = ?auto_1081043 ?auto_1081046 ) ) ( not ( = ?auto_1081043 ?auto_1081047 ) ) ( not ( = ?auto_1081043 ?auto_1081048 ) ) ( not ( = ?auto_1081044 ?auto_1081045 ) ) ( not ( = ?auto_1081044 ?auto_1081046 ) ) ( not ( = ?auto_1081044 ?auto_1081047 ) ) ( not ( = ?auto_1081044 ?auto_1081048 ) ) ( not ( = ?auto_1081045 ?auto_1081046 ) ) ( not ( = ?auto_1081045 ?auto_1081047 ) ) ( not ( = ?auto_1081045 ?auto_1081048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081046 ?auto_1081047 ?auto_1081048 )
      ( MAKE-12CRATE-VERIFY ?auto_1081036 ?auto_1081037 ?auto_1081038 ?auto_1081039 ?auto_1081040 ?auto_1081041 ?auto_1081042 ?auto_1081043 ?auto_1081044 ?auto_1081045 ?auto_1081046 ?auto_1081047 ?auto_1081048 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081174 - SURFACE
      ?auto_1081175 - SURFACE
      ?auto_1081176 - SURFACE
      ?auto_1081177 - SURFACE
      ?auto_1081178 - SURFACE
      ?auto_1081179 - SURFACE
      ?auto_1081180 - SURFACE
      ?auto_1081181 - SURFACE
      ?auto_1081182 - SURFACE
      ?auto_1081183 - SURFACE
      ?auto_1081184 - SURFACE
      ?auto_1081185 - SURFACE
      ?auto_1081186 - SURFACE
    )
    :vars
    (
      ?auto_1081189 - HOIST
      ?auto_1081187 - PLACE
      ?auto_1081188 - TRUCK
      ?auto_1081190 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081189 ?auto_1081187 ) ( SURFACE-AT ?auto_1081185 ?auto_1081187 ) ( CLEAR ?auto_1081185 ) ( IS-CRATE ?auto_1081186 ) ( not ( = ?auto_1081185 ?auto_1081186 ) ) ( AVAILABLE ?auto_1081189 ) ( IN ?auto_1081186 ?auto_1081188 ) ( ON ?auto_1081185 ?auto_1081184 ) ( not ( = ?auto_1081184 ?auto_1081185 ) ) ( not ( = ?auto_1081184 ?auto_1081186 ) ) ( TRUCK-AT ?auto_1081188 ?auto_1081190 ) ( not ( = ?auto_1081190 ?auto_1081187 ) ) ( ON ?auto_1081175 ?auto_1081174 ) ( ON ?auto_1081176 ?auto_1081175 ) ( ON ?auto_1081177 ?auto_1081176 ) ( ON ?auto_1081178 ?auto_1081177 ) ( ON ?auto_1081179 ?auto_1081178 ) ( ON ?auto_1081180 ?auto_1081179 ) ( ON ?auto_1081181 ?auto_1081180 ) ( ON ?auto_1081182 ?auto_1081181 ) ( ON ?auto_1081183 ?auto_1081182 ) ( ON ?auto_1081184 ?auto_1081183 ) ( not ( = ?auto_1081174 ?auto_1081175 ) ) ( not ( = ?auto_1081174 ?auto_1081176 ) ) ( not ( = ?auto_1081174 ?auto_1081177 ) ) ( not ( = ?auto_1081174 ?auto_1081178 ) ) ( not ( = ?auto_1081174 ?auto_1081179 ) ) ( not ( = ?auto_1081174 ?auto_1081180 ) ) ( not ( = ?auto_1081174 ?auto_1081181 ) ) ( not ( = ?auto_1081174 ?auto_1081182 ) ) ( not ( = ?auto_1081174 ?auto_1081183 ) ) ( not ( = ?auto_1081174 ?auto_1081184 ) ) ( not ( = ?auto_1081174 ?auto_1081185 ) ) ( not ( = ?auto_1081174 ?auto_1081186 ) ) ( not ( = ?auto_1081175 ?auto_1081176 ) ) ( not ( = ?auto_1081175 ?auto_1081177 ) ) ( not ( = ?auto_1081175 ?auto_1081178 ) ) ( not ( = ?auto_1081175 ?auto_1081179 ) ) ( not ( = ?auto_1081175 ?auto_1081180 ) ) ( not ( = ?auto_1081175 ?auto_1081181 ) ) ( not ( = ?auto_1081175 ?auto_1081182 ) ) ( not ( = ?auto_1081175 ?auto_1081183 ) ) ( not ( = ?auto_1081175 ?auto_1081184 ) ) ( not ( = ?auto_1081175 ?auto_1081185 ) ) ( not ( = ?auto_1081175 ?auto_1081186 ) ) ( not ( = ?auto_1081176 ?auto_1081177 ) ) ( not ( = ?auto_1081176 ?auto_1081178 ) ) ( not ( = ?auto_1081176 ?auto_1081179 ) ) ( not ( = ?auto_1081176 ?auto_1081180 ) ) ( not ( = ?auto_1081176 ?auto_1081181 ) ) ( not ( = ?auto_1081176 ?auto_1081182 ) ) ( not ( = ?auto_1081176 ?auto_1081183 ) ) ( not ( = ?auto_1081176 ?auto_1081184 ) ) ( not ( = ?auto_1081176 ?auto_1081185 ) ) ( not ( = ?auto_1081176 ?auto_1081186 ) ) ( not ( = ?auto_1081177 ?auto_1081178 ) ) ( not ( = ?auto_1081177 ?auto_1081179 ) ) ( not ( = ?auto_1081177 ?auto_1081180 ) ) ( not ( = ?auto_1081177 ?auto_1081181 ) ) ( not ( = ?auto_1081177 ?auto_1081182 ) ) ( not ( = ?auto_1081177 ?auto_1081183 ) ) ( not ( = ?auto_1081177 ?auto_1081184 ) ) ( not ( = ?auto_1081177 ?auto_1081185 ) ) ( not ( = ?auto_1081177 ?auto_1081186 ) ) ( not ( = ?auto_1081178 ?auto_1081179 ) ) ( not ( = ?auto_1081178 ?auto_1081180 ) ) ( not ( = ?auto_1081178 ?auto_1081181 ) ) ( not ( = ?auto_1081178 ?auto_1081182 ) ) ( not ( = ?auto_1081178 ?auto_1081183 ) ) ( not ( = ?auto_1081178 ?auto_1081184 ) ) ( not ( = ?auto_1081178 ?auto_1081185 ) ) ( not ( = ?auto_1081178 ?auto_1081186 ) ) ( not ( = ?auto_1081179 ?auto_1081180 ) ) ( not ( = ?auto_1081179 ?auto_1081181 ) ) ( not ( = ?auto_1081179 ?auto_1081182 ) ) ( not ( = ?auto_1081179 ?auto_1081183 ) ) ( not ( = ?auto_1081179 ?auto_1081184 ) ) ( not ( = ?auto_1081179 ?auto_1081185 ) ) ( not ( = ?auto_1081179 ?auto_1081186 ) ) ( not ( = ?auto_1081180 ?auto_1081181 ) ) ( not ( = ?auto_1081180 ?auto_1081182 ) ) ( not ( = ?auto_1081180 ?auto_1081183 ) ) ( not ( = ?auto_1081180 ?auto_1081184 ) ) ( not ( = ?auto_1081180 ?auto_1081185 ) ) ( not ( = ?auto_1081180 ?auto_1081186 ) ) ( not ( = ?auto_1081181 ?auto_1081182 ) ) ( not ( = ?auto_1081181 ?auto_1081183 ) ) ( not ( = ?auto_1081181 ?auto_1081184 ) ) ( not ( = ?auto_1081181 ?auto_1081185 ) ) ( not ( = ?auto_1081181 ?auto_1081186 ) ) ( not ( = ?auto_1081182 ?auto_1081183 ) ) ( not ( = ?auto_1081182 ?auto_1081184 ) ) ( not ( = ?auto_1081182 ?auto_1081185 ) ) ( not ( = ?auto_1081182 ?auto_1081186 ) ) ( not ( = ?auto_1081183 ?auto_1081184 ) ) ( not ( = ?auto_1081183 ?auto_1081185 ) ) ( not ( = ?auto_1081183 ?auto_1081186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081184 ?auto_1081185 ?auto_1081186 )
      ( MAKE-12CRATE-VERIFY ?auto_1081174 ?auto_1081175 ?auto_1081176 ?auto_1081177 ?auto_1081178 ?auto_1081179 ?auto_1081180 ?auto_1081181 ?auto_1081182 ?auto_1081183 ?auto_1081184 ?auto_1081185 ?auto_1081186 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081324 - SURFACE
      ?auto_1081325 - SURFACE
      ?auto_1081326 - SURFACE
      ?auto_1081327 - SURFACE
      ?auto_1081328 - SURFACE
      ?auto_1081329 - SURFACE
      ?auto_1081330 - SURFACE
      ?auto_1081331 - SURFACE
      ?auto_1081332 - SURFACE
      ?auto_1081333 - SURFACE
      ?auto_1081334 - SURFACE
      ?auto_1081335 - SURFACE
      ?auto_1081336 - SURFACE
    )
    :vars
    (
      ?auto_1081339 - HOIST
      ?auto_1081340 - PLACE
      ?auto_1081338 - TRUCK
      ?auto_1081337 - PLACE
      ?auto_1081341 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081339 ?auto_1081340 ) ( SURFACE-AT ?auto_1081335 ?auto_1081340 ) ( CLEAR ?auto_1081335 ) ( IS-CRATE ?auto_1081336 ) ( not ( = ?auto_1081335 ?auto_1081336 ) ) ( AVAILABLE ?auto_1081339 ) ( ON ?auto_1081335 ?auto_1081334 ) ( not ( = ?auto_1081334 ?auto_1081335 ) ) ( not ( = ?auto_1081334 ?auto_1081336 ) ) ( TRUCK-AT ?auto_1081338 ?auto_1081337 ) ( not ( = ?auto_1081337 ?auto_1081340 ) ) ( HOIST-AT ?auto_1081341 ?auto_1081337 ) ( LIFTING ?auto_1081341 ?auto_1081336 ) ( not ( = ?auto_1081339 ?auto_1081341 ) ) ( ON ?auto_1081325 ?auto_1081324 ) ( ON ?auto_1081326 ?auto_1081325 ) ( ON ?auto_1081327 ?auto_1081326 ) ( ON ?auto_1081328 ?auto_1081327 ) ( ON ?auto_1081329 ?auto_1081328 ) ( ON ?auto_1081330 ?auto_1081329 ) ( ON ?auto_1081331 ?auto_1081330 ) ( ON ?auto_1081332 ?auto_1081331 ) ( ON ?auto_1081333 ?auto_1081332 ) ( ON ?auto_1081334 ?auto_1081333 ) ( not ( = ?auto_1081324 ?auto_1081325 ) ) ( not ( = ?auto_1081324 ?auto_1081326 ) ) ( not ( = ?auto_1081324 ?auto_1081327 ) ) ( not ( = ?auto_1081324 ?auto_1081328 ) ) ( not ( = ?auto_1081324 ?auto_1081329 ) ) ( not ( = ?auto_1081324 ?auto_1081330 ) ) ( not ( = ?auto_1081324 ?auto_1081331 ) ) ( not ( = ?auto_1081324 ?auto_1081332 ) ) ( not ( = ?auto_1081324 ?auto_1081333 ) ) ( not ( = ?auto_1081324 ?auto_1081334 ) ) ( not ( = ?auto_1081324 ?auto_1081335 ) ) ( not ( = ?auto_1081324 ?auto_1081336 ) ) ( not ( = ?auto_1081325 ?auto_1081326 ) ) ( not ( = ?auto_1081325 ?auto_1081327 ) ) ( not ( = ?auto_1081325 ?auto_1081328 ) ) ( not ( = ?auto_1081325 ?auto_1081329 ) ) ( not ( = ?auto_1081325 ?auto_1081330 ) ) ( not ( = ?auto_1081325 ?auto_1081331 ) ) ( not ( = ?auto_1081325 ?auto_1081332 ) ) ( not ( = ?auto_1081325 ?auto_1081333 ) ) ( not ( = ?auto_1081325 ?auto_1081334 ) ) ( not ( = ?auto_1081325 ?auto_1081335 ) ) ( not ( = ?auto_1081325 ?auto_1081336 ) ) ( not ( = ?auto_1081326 ?auto_1081327 ) ) ( not ( = ?auto_1081326 ?auto_1081328 ) ) ( not ( = ?auto_1081326 ?auto_1081329 ) ) ( not ( = ?auto_1081326 ?auto_1081330 ) ) ( not ( = ?auto_1081326 ?auto_1081331 ) ) ( not ( = ?auto_1081326 ?auto_1081332 ) ) ( not ( = ?auto_1081326 ?auto_1081333 ) ) ( not ( = ?auto_1081326 ?auto_1081334 ) ) ( not ( = ?auto_1081326 ?auto_1081335 ) ) ( not ( = ?auto_1081326 ?auto_1081336 ) ) ( not ( = ?auto_1081327 ?auto_1081328 ) ) ( not ( = ?auto_1081327 ?auto_1081329 ) ) ( not ( = ?auto_1081327 ?auto_1081330 ) ) ( not ( = ?auto_1081327 ?auto_1081331 ) ) ( not ( = ?auto_1081327 ?auto_1081332 ) ) ( not ( = ?auto_1081327 ?auto_1081333 ) ) ( not ( = ?auto_1081327 ?auto_1081334 ) ) ( not ( = ?auto_1081327 ?auto_1081335 ) ) ( not ( = ?auto_1081327 ?auto_1081336 ) ) ( not ( = ?auto_1081328 ?auto_1081329 ) ) ( not ( = ?auto_1081328 ?auto_1081330 ) ) ( not ( = ?auto_1081328 ?auto_1081331 ) ) ( not ( = ?auto_1081328 ?auto_1081332 ) ) ( not ( = ?auto_1081328 ?auto_1081333 ) ) ( not ( = ?auto_1081328 ?auto_1081334 ) ) ( not ( = ?auto_1081328 ?auto_1081335 ) ) ( not ( = ?auto_1081328 ?auto_1081336 ) ) ( not ( = ?auto_1081329 ?auto_1081330 ) ) ( not ( = ?auto_1081329 ?auto_1081331 ) ) ( not ( = ?auto_1081329 ?auto_1081332 ) ) ( not ( = ?auto_1081329 ?auto_1081333 ) ) ( not ( = ?auto_1081329 ?auto_1081334 ) ) ( not ( = ?auto_1081329 ?auto_1081335 ) ) ( not ( = ?auto_1081329 ?auto_1081336 ) ) ( not ( = ?auto_1081330 ?auto_1081331 ) ) ( not ( = ?auto_1081330 ?auto_1081332 ) ) ( not ( = ?auto_1081330 ?auto_1081333 ) ) ( not ( = ?auto_1081330 ?auto_1081334 ) ) ( not ( = ?auto_1081330 ?auto_1081335 ) ) ( not ( = ?auto_1081330 ?auto_1081336 ) ) ( not ( = ?auto_1081331 ?auto_1081332 ) ) ( not ( = ?auto_1081331 ?auto_1081333 ) ) ( not ( = ?auto_1081331 ?auto_1081334 ) ) ( not ( = ?auto_1081331 ?auto_1081335 ) ) ( not ( = ?auto_1081331 ?auto_1081336 ) ) ( not ( = ?auto_1081332 ?auto_1081333 ) ) ( not ( = ?auto_1081332 ?auto_1081334 ) ) ( not ( = ?auto_1081332 ?auto_1081335 ) ) ( not ( = ?auto_1081332 ?auto_1081336 ) ) ( not ( = ?auto_1081333 ?auto_1081334 ) ) ( not ( = ?auto_1081333 ?auto_1081335 ) ) ( not ( = ?auto_1081333 ?auto_1081336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081334 ?auto_1081335 ?auto_1081336 )
      ( MAKE-12CRATE-VERIFY ?auto_1081324 ?auto_1081325 ?auto_1081326 ?auto_1081327 ?auto_1081328 ?auto_1081329 ?auto_1081330 ?auto_1081331 ?auto_1081332 ?auto_1081333 ?auto_1081334 ?auto_1081335 ?auto_1081336 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081486 - SURFACE
      ?auto_1081487 - SURFACE
      ?auto_1081488 - SURFACE
      ?auto_1081489 - SURFACE
      ?auto_1081490 - SURFACE
      ?auto_1081491 - SURFACE
      ?auto_1081492 - SURFACE
      ?auto_1081493 - SURFACE
      ?auto_1081494 - SURFACE
      ?auto_1081495 - SURFACE
      ?auto_1081496 - SURFACE
      ?auto_1081497 - SURFACE
      ?auto_1081498 - SURFACE
    )
    :vars
    (
      ?auto_1081502 - HOIST
      ?auto_1081500 - PLACE
      ?auto_1081499 - TRUCK
      ?auto_1081504 - PLACE
      ?auto_1081501 - HOIST
      ?auto_1081503 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081502 ?auto_1081500 ) ( SURFACE-AT ?auto_1081497 ?auto_1081500 ) ( CLEAR ?auto_1081497 ) ( IS-CRATE ?auto_1081498 ) ( not ( = ?auto_1081497 ?auto_1081498 ) ) ( AVAILABLE ?auto_1081502 ) ( ON ?auto_1081497 ?auto_1081496 ) ( not ( = ?auto_1081496 ?auto_1081497 ) ) ( not ( = ?auto_1081496 ?auto_1081498 ) ) ( TRUCK-AT ?auto_1081499 ?auto_1081504 ) ( not ( = ?auto_1081504 ?auto_1081500 ) ) ( HOIST-AT ?auto_1081501 ?auto_1081504 ) ( not ( = ?auto_1081502 ?auto_1081501 ) ) ( AVAILABLE ?auto_1081501 ) ( SURFACE-AT ?auto_1081498 ?auto_1081504 ) ( ON ?auto_1081498 ?auto_1081503 ) ( CLEAR ?auto_1081498 ) ( not ( = ?auto_1081497 ?auto_1081503 ) ) ( not ( = ?auto_1081498 ?auto_1081503 ) ) ( not ( = ?auto_1081496 ?auto_1081503 ) ) ( ON ?auto_1081487 ?auto_1081486 ) ( ON ?auto_1081488 ?auto_1081487 ) ( ON ?auto_1081489 ?auto_1081488 ) ( ON ?auto_1081490 ?auto_1081489 ) ( ON ?auto_1081491 ?auto_1081490 ) ( ON ?auto_1081492 ?auto_1081491 ) ( ON ?auto_1081493 ?auto_1081492 ) ( ON ?auto_1081494 ?auto_1081493 ) ( ON ?auto_1081495 ?auto_1081494 ) ( ON ?auto_1081496 ?auto_1081495 ) ( not ( = ?auto_1081486 ?auto_1081487 ) ) ( not ( = ?auto_1081486 ?auto_1081488 ) ) ( not ( = ?auto_1081486 ?auto_1081489 ) ) ( not ( = ?auto_1081486 ?auto_1081490 ) ) ( not ( = ?auto_1081486 ?auto_1081491 ) ) ( not ( = ?auto_1081486 ?auto_1081492 ) ) ( not ( = ?auto_1081486 ?auto_1081493 ) ) ( not ( = ?auto_1081486 ?auto_1081494 ) ) ( not ( = ?auto_1081486 ?auto_1081495 ) ) ( not ( = ?auto_1081486 ?auto_1081496 ) ) ( not ( = ?auto_1081486 ?auto_1081497 ) ) ( not ( = ?auto_1081486 ?auto_1081498 ) ) ( not ( = ?auto_1081486 ?auto_1081503 ) ) ( not ( = ?auto_1081487 ?auto_1081488 ) ) ( not ( = ?auto_1081487 ?auto_1081489 ) ) ( not ( = ?auto_1081487 ?auto_1081490 ) ) ( not ( = ?auto_1081487 ?auto_1081491 ) ) ( not ( = ?auto_1081487 ?auto_1081492 ) ) ( not ( = ?auto_1081487 ?auto_1081493 ) ) ( not ( = ?auto_1081487 ?auto_1081494 ) ) ( not ( = ?auto_1081487 ?auto_1081495 ) ) ( not ( = ?auto_1081487 ?auto_1081496 ) ) ( not ( = ?auto_1081487 ?auto_1081497 ) ) ( not ( = ?auto_1081487 ?auto_1081498 ) ) ( not ( = ?auto_1081487 ?auto_1081503 ) ) ( not ( = ?auto_1081488 ?auto_1081489 ) ) ( not ( = ?auto_1081488 ?auto_1081490 ) ) ( not ( = ?auto_1081488 ?auto_1081491 ) ) ( not ( = ?auto_1081488 ?auto_1081492 ) ) ( not ( = ?auto_1081488 ?auto_1081493 ) ) ( not ( = ?auto_1081488 ?auto_1081494 ) ) ( not ( = ?auto_1081488 ?auto_1081495 ) ) ( not ( = ?auto_1081488 ?auto_1081496 ) ) ( not ( = ?auto_1081488 ?auto_1081497 ) ) ( not ( = ?auto_1081488 ?auto_1081498 ) ) ( not ( = ?auto_1081488 ?auto_1081503 ) ) ( not ( = ?auto_1081489 ?auto_1081490 ) ) ( not ( = ?auto_1081489 ?auto_1081491 ) ) ( not ( = ?auto_1081489 ?auto_1081492 ) ) ( not ( = ?auto_1081489 ?auto_1081493 ) ) ( not ( = ?auto_1081489 ?auto_1081494 ) ) ( not ( = ?auto_1081489 ?auto_1081495 ) ) ( not ( = ?auto_1081489 ?auto_1081496 ) ) ( not ( = ?auto_1081489 ?auto_1081497 ) ) ( not ( = ?auto_1081489 ?auto_1081498 ) ) ( not ( = ?auto_1081489 ?auto_1081503 ) ) ( not ( = ?auto_1081490 ?auto_1081491 ) ) ( not ( = ?auto_1081490 ?auto_1081492 ) ) ( not ( = ?auto_1081490 ?auto_1081493 ) ) ( not ( = ?auto_1081490 ?auto_1081494 ) ) ( not ( = ?auto_1081490 ?auto_1081495 ) ) ( not ( = ?auto_1081490 ?auto_1081496 ) ) ( not ( = ?auto_1081490 ?auto_1081497 ) ) ( not ( = ?auto_1081490 ?auto_1081498 ) ) ( not ( = ?auto_1081490 ?auto_1081503 ) ) ( not ( = ?auto_1081491 ?auto_1081492 ) ) ( not ( = ?auto_1081491 ?auto_1081493 ) ) ( not ( = ?auto_1081491 ?auto_1081494 ) ) ( not ( = ?auto_1081491 ?auto_1081495 ) ) ( not ( = ?auto_1081491 ?auto_1081496 ) ) ( not ( = ?auto_1081491 ?auto_1081497 ) ) ( not ( = ?auto_1081491 ?auto_1081498 ) ) ( not ( = ?auto_1081491 ?auto_1081503 ) ) ( not ( = ?auto_1081492 ?auto_1081493 ) ) ( not ( = ?auto_1081492 ?auto_1081494 ) ) ( not ( = ?auto_1081492 ?auto_1081495 ) ) ( not ( = ?auto_1081492 ?auto_1081496 ) ) ( not ( = ?auto_1081492 ?auto_1081497 ) ) ( not ( = ?auto_1081492 ?auto_1081498 ) ) ( not ( = ?auto_1081492 ?auto_1081503 ) ) ( not ( = ?auto_1081493 ?auto_1081494 ) ) ( not ( = ?auto_1081493 ?auto_1081495 ) ) ( not ( = ?auto_1081493 ?auto_1081496 ) ) ( not ( = ?auto_1081493 ?auto_1081497 ) ) ( not ( = ?auto_1081493 ?auto_1081498 ) ) ( not ( = ?auto_1081493 ?auto_1081503 ) ) ( not ( = ?auto_1081494 ?auto_1081495 ) ) ( not ( = ?auto_1081494 ?auto_1081496 ) ) ( not ( = ?auto_1081494 ?auto_1081497 ) ) ( not ( = ?auto_1081494 ?auto_1081498 ) ) ( not ( = ?auto_1081494 ?auto_1081503 ) ) ( not ( = ?auto_1081495 ?auto_1081496 ) ) ( not ( = ?auto_1081495 ?auto_1081497 ) ) ( not ( = ?auto_1081495 ?auto_1081498 ) ) ( not ( = ?auto_1081495 ?auto_1081503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081496 ?auto_1081497 ?auto_1081498 )
      ( MAKE-12CRATE-VERIFY ?auto_1081486 ?auto_1081487 ?auto_1081488 ?auto_1081489 ?auto_1081490 ?auto_1081491 ?auto_1081492 ?auto_1081493 ?auto_1081494 ?auto_1081495 ?auto_1081496 ?auto_1081497 ?auto_1081498 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081649 - SURFACE
      ?auto_1081650 - SURFACE
      ?auto_1081651 - SURFACE
      ?auto_1081652 - SURFACE
      ?auto_1081653 - SURFACE
      ?auto_1081654 - SURFACE
      ?auto_1081655 - SURFACE
      ?auto_1081656 - SURFACE
      ?auto_1081657 - SURFACE
      ?auto_1081658 - SURFACE
      ?auto_1081659 - SURFACE
      ?auto_1081660 - SURFACE
      ?auto_1081661 - SURFACE
    )
    :vars
    (
      ?auto_1081663 - HOIST
      ?auto_1081666 - PLACE
      ?auto_1081662 - PLACE
      ?auto_1081667 - HOIST
      ?auto_1081665 - SURFACE
      ?auto_1081664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081663 ?auto_1081666 ) ( SURFACE-AT ?auto_1081660 ?auto_1081666 ) ( CLEAR ?auto_1081660 ) ( IS-CRATE ?auto_1081661 ) ( not ( = ?auto_1081660 ?auto_1081661 ) ) ( AVAILABLE ?auto_1081663 ) ( ON ?auto_1081660 ?auto_1081659 ) ( not ( = ?auto_1081659 ?auto_1081660 ) ) ( not ( = ?auto_1081659 ?auto_1081661 ) ) ( not ( = ?auto_1081662 ?auto_1081666 ) ) ( HOIST-AT ?auto_1081667 ?auto_1081662 ) ( not ( = ?auto_1081663 ?auto_1081667 ) ) ( AVAILABLE ?auto_1081667 ) ( SURFACE-AT ?auto_1081661 ?auto_1081662 ) ( ON ?auto_1081661 ?auto_1081665 ) ( CLEAR ?auto_1081661 ) ( not ( = ?auto_1081660 ?auto_1081665 ) ) ( not ( = ?auto_1081661 ?auto_1081665 ) ) ( not ( = ?auto_1081659 ?auto_1081665 ) ) ( TRUCK-AT ?auto_1081664 ?auto_1081666 ) ( ON ?auto_1081650 ?auto_1081649 ) ( ON ?auto_1081651 ?auto_1081650 ) ( ON ?auto_1081652 ?auto_1081651 ) ( ON ?auto_1081653 ?auto_1081652 ) ( ON ?auto_1081654 ?auto_1081653 ) ( ON ?auto_1081655 ?auto_1081654 ) ( ON ?auto_1081656 ?auto_1081655 ) ( ON ?auto_1081657 ?auto_1081656 ) ( ON ?auto_1081658 ?auto_1081657 ) ( ON ?auto_1081659 ?auto_1081658 ) ( not ( = ?auto_1081649 ?auto_1081650 ) ) ( not ( = ?auto_1081649 ?auto_1081651 ) ) ( not ( = ?auto_1081649 ?auto_1081652 ) ) ( not ( = ?auto_1081649 ?auto_1081653 ) ) ( not ( = ?auto_1081649 ?auto_1081654 ) ) ( not ( = ?auto_1081649 ?auto_1081655 ) ) ( not ( = ?auto_1081649 ?auto_1081656 ) ) ( not ( = ?auto_1081649 ?auto_1081657 ) ) ( not ( = ?auto_1081649 ?auto_1081658 ) ) ( not ( = ?auto_1081649 ?auto_1081659 ) ) ( not ( = ?auto_1081649 ?auto_1081660 ) ) ( not ( = ?auto_1081649 ?auto_1081661 ) ) ( not ( = ?auto_1081649 ?auto_1081665 ) ) ( not ( = ?auto_1081650 ?auto_1081651 ) ) ( not ( = ?auto_1081650 ?auto_1081652 ) ) ( not ( = ?auto_1081650 ?auto_1081653 ) ) ( not ( = ?auto_1081650 ?auto_1081654 ) ) ( not ( = ?auto_1081650 ?auto_1081655 ) ) ( not ( = ?auto_1081650 ?auto_1081656 ) ) ( not ( = ?auto_1081650 ?auto_1081657 ) ) ( not ( = ?auto_1081650 ?auto_1081658 ) ) ( not ( = ?auto_1081650 ?auto_1081659 ) ) ( not ( = ?auto_1081650 ?auto_1081660 ) ) ( not ( = ?auto_1081650 ?auto_1081661 ) ) ( not ( = ?auto_1081650 ?auto_1081665 ) ) ( not ( = ?auto_1081651 ?auto_1081652 ) ) ( not ( = ?auto_1081651 ?auto_1081653 ) ) ( not ( = ?auto_1081651 ?auto_1081654 ) ) ( not ( = ?auto_1081651 ?auto_1081655 ) ) ( not ( = ?auto_1081651 ?auto_1081656 ) ) ( not ( = ?auto_1081651 ?auto_1081657 ) ) ( not ( = ?auto_1081651 ?auto_1081658 ) ) ( not ( = ?auto_1081651 ?auto_1081659 ) ) ( not ( = ?auto_1081651 ?auto_1081660 ) ) ( not ( = ?auto_1081651 ?auto_1081661 ) ) ( not ( = ?auto_1081651 ?auto_1081665 ) ) ( not ( = ?auto_1081652 ?auto_1081653 ) ) ( not ( = ?auto_1081652 ?auto_1081654 ) ) ( not ( = ?auto_1081652 ?auto_1081655 ) ) ( not ( = ?auto_1081652 ?auto_1081656 ) ) ( not ( = ?auto_1081652 ?auto_1081657 ) ) ( not ( = ?auto_1081652 ?auto_1081658 ) ) ( not ( = ?auto_1081652 ?auto_1081659 ) ) ( not ( = ?auto_1081652 ?auto_1081660 ) ) ( not ( = ?auto_1081652 ?auto_1081661 ) ) ( not ( = ?auto_1081652 ?auto_1081665 ) ) ( not ( = ?auto_1081653 ?auto_1081654 ) ) ( not ( = ?auto_1081653 ?auto_1081655 ) ) ( not ( = ?auto_1081653 ?auto_1081656 ) ) ( not ( = ?auto_1081653 ?auto_1081657 ) ) ( not ( = ?auto_1081653 ?auto_1081658 ) ) ( not ( = ?auto_1081653 ?auto_1081659 ) ) ( not ( = ?auto_1081653 ?auto_1081660 ) ) ( not ( = ?auto_1081653 ?auto_1081661 ) ) ( not ( = ?auto_1081653 ?auto_1081665 ) ) ( not ( = ?auto_1081654 ?auto_1081655 ) ) ( not ( = ?auto_1081654 ?auto_1081656 ) ) ( not ( = ?auto_1081654 ?auto_1081657 ) ) ( not ( = ?auto_1081654 ?auto_1081658 ) ) ( not ( = ?auto_1081654 ?auto_1081659 ) ) ( not ( = ?auto_1081654 ?auto_1081660 ) ) ( not ( = ?auto_1081654 ?auto_1081661 ) ) ( not ( = ?auto_1081654 ?auto_1081665 ) ) ( not ( = ?auto_1081655 ?auto_1081656 ) ) ( not ( = ?auto_1081655 ?auto_1081657 ) ) ( not ( = ?auto_1081655 ?auto_1081658 ) ) ( not ( = ?auto_1081655 ?auto_1081659 ) ) ( not ( = ?auto_1081655 ?auto_1081660 ) ) ( not ( = ?auto_1081655 ?auto_1081661 ) ) ( not ( = ?auto_1081655 ?auto_1081665 ) ) ( not ( = ?auto_1081656 ?auto_1081657 ) ) ( not ( = ?auto_1081656 ?auto_1081658 ) ) ( not ( = ?auto_1081656 ?auto_1081659 ) ) ( not ( = ?auto_1081656 ?auto_1081660 ) ) ( not ( = ?auto_1081656 ?auto_1081661 ) ) ( not ( = ?auto_1081656 ?auto_1081665 ) ) ( not ( = ?auto_1081657 ?auto_1081658 ) ) ( not ( = ?auto_1081657 ?auto_1081659 ) ) ( not ( = ?auto_1081657 ?auto_1081660 ) ) ( not ( = ?auto_1081657 ?auto_1081661 ) ) ( not ( = ?auto_1081657 ?auto_1081665 ) ) ( not ( = ?auto_1081658 ?auto_1081659 ) ) ( not ( = ?auto_1081658 ?auto_1081660 ) ) ( not ( = ?auto_1081658 ?auto_1081661 ) ) ( not ( = ?auto_1081658 ?auto_1081665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081659 ?auto_1081660 ?auto_1081661 )
      ( MAKE-12CRATE-VERIFY ?auto_1081649 ?auto_1081650 ?auto_1081651 ?auto_1081652 ?auto_1081653 ?auto_1081654 ?auto_1081655 ?auto_1081656 ?auto_1081657 ?auto_1081658 ?auto_1081659 ?auto_1081660 ?auto_1081661 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081812 - SURFACE
      ?auto_1081813 - SURFACE
      ?auto_1081814 - SURFACE
      ?auto_1081815 - SURFACE
      ?auto_1081816 - SURFACE
      ?auto_1081817 - SURFACE
      ?auto_1081818 - SURFACE
      ?auto_1081819 - SURFACE
      ?auto_1081820 - SURFACE
      ?auto_1081821 - SURFACE
      ?auto_1081822 - SURFACE
      ?auto_1081823 - SURFACE
      ?auto_1081824 - SURFACE
    )
    :vars
    (
      ?auto_1081826 - HOIST
      ?auto_1081825 - PLACE
      ?auto_1081827 - PLACE
      ?auto_1081829 - HOIST
      ?auto_1081828 - SURFACE
      ?auto_1081830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081826 ?auto_1081825 ) ( IS-CRATE ?auto_1081824 ) ( not ( = ?auto_1081823 ?auto_1081824 ) ) ( not ( = ?auto_1081822 ?auto_1081823 ) ) ( not ( = ?auto_1081822 ?auto_1081824 ) ) ( not ( = ?auto_1081827 ?auto_1081825 ) ) ( HOIST-AT ?auto_1081829 ?auto_1081827 ) ( not ( = ?auto_1081826 ?auto_1081829 ) ) ( AVAILABLE ?auto_1081829 ) ( SURFACE-AT ?auto_1081824 ?auto_1081827 ) ( ON ?auto_1081824 ?auto_1081828 ) ( CLEAR ?auto_1081824 ) ( not ( = ?auto_1081823 ?auto_1081828 ) ) ( not ( = ?auto_1081824 ?auto_1081828 ) ) ( not ( = ?auto_1081822 ?auto_1081828 ) ) ( TRUCK-AT ?auto_1081830 ?auto_1081825 ) ( SURFACE-AT ?auto_1081822 ?auto_1081825 ) ( CLEAR ?auto_1081822 ) ( LIFTING ?auto_1081826 ?auto_1081823 ) ( IS-CRATE ?auto_1081823 ) ( ON ?auto_1081813 ?auto_1081812 ) ( ON ?auto_1081814 ?auto_1081813 ) ( ON ?auto_1081815 ?auto_1081814 ) ( ON ?auto_1081816 ?auto_1081815 ) ( ON ?auto_1081817 ?auto_1081816 ) ( ON ?auto_1081818 ?auto_1081817 ) ( ON ?auto_1081819 ?auto_1081818 ) ( ON ?auto_1081820 ?auto_1081819 ) ( ON ?auto_1081821 ?auto_1081820 ) ( ON ?auto_1081822 ?auto_1081821 ) ( not ( = ?auto_1081812 ?auto_1081813 ) ) ( not ( = ?auto_1081812 ?auto_1081814 ) ) ( not ( = ?auto_1081812 ?auto_1081815 ) ) ( not ( = ?auto_1081812 ?auto_1081816 ) ) ( not ( = ?auto_1081812 ?auto_1081817 ) ) ( not ( = ?auto_1081812 ?auto_1081818 ) ) ( not ( = ?auto_1081812 ?auto_1081819 ) ) ( not ( = ?auto_1081812 ?auto_1081820 ) ) ( not ( = ?auto_1081812 ?auto_1081821 ) ) ( not ( = ?auto_1081812 ?auto_1081822 ) ) ( not ( = ?auto_1081812 ?auto_1081823 ) ) ( not ( = ?auto_1081812 ?auto_1081824 ) ) ( not ( = ?auto_1081812 ?auto_1081828 ) ) ( not ( = ?auto_1081813 ?auto_1081814 ) ) ( not ( = ?auto_1081813 ?auto_1081815 ) ) ( not ( = ?auto_1081813 ?auto_1081816 ) ) ( not ( = ?auto_1081813 ?auto_1081817 ) ) ( not ( = ?auto_1081813 ?auto_1081818 ) ) ( not ( = ?auto_1081813 ?auto_1081819 ) ) ( not ( = ?auto_1081813 ?auto_1081820 ) ) ( not ( = ?auto_1081813 ?auto_1081821 ) ) ( not ( = ?auto_1081813 ?auto_1081822 ) ) ( not ( = ?auto_1081813 ?auto_1081823 ) ) ( not ( = ?auto_1081813 ?auto_1081824 ) ) ( not ( = ?auto_1081813 ?auto_1081828 ) ) ( not ( = ?auto_1081814 ?auto_1081815 ) ) ( not ( = ?auto_1081814 ?auto_1081816 ) ) ( not ( = ?auto_1081814 ?auto_1081817 ) ) ( not ( = ?auto_1081814 ?auto_1081818 ) ) ( not ( = ?auto_1081814 ?auto_1081819 ) ) ( not ( = ?auto_1081814 ?auto_1081820 ) ) ( not ( = ?auto_1081814 ?auto_1081821 ) ) ( not ( = ?auto_1081814 ?auto_1081822 ) ) ( not ( = ?auto_1081814 ?auto_1081823 ) ) ( not ( = ?auto_1081814 ?auto_1081824 ) ) ( not ( = ?auto_1081814 ?auto_1081828 ) ) ( not ( = ?auto_1081815 ?auto_1081816 ) ) ( not ( = ?auto_1081815 ?auto_1081817 ) ) ( not ( = ?auto_1081815 ?auto_1081818 ) ) ( not ( = ?auto_1081815 ?auto_1081819 ) ) ( not ( = ?auto_1081815 ?auto_1081820 ) ) ( not ( = ?auto_1081815 ?auto_1081821 ) ) ( not ( = ?auto_1081815 ?auto_1081822 ) ) ( not ( = ?auto_1081815 ?auto_1081823 ) ) ( not ( = ?auto_1081815 ?auto_1081824 ) ) ( not ( = ?auto_1081815 ?auto_1081828 ) ) ( not ( = ?auto_1081816 ?auto_1081817 ) ) ( not ( = ?auto_1081816 ?auto_1081818 ) ) ( not ( = ?auto_1081816 ?auto_1081819 ) ) ( not ( = ?auto_1081816 ?auto_1081820 ) ) ( not ( = ?auto_1081816 ?auto_1081821 ) ) ( not ( = ?auto_1081816 ?auto_1081822 ) ) ( not ( = ?auto_1081816 ?auto_1081823 ) ) ( not ( = ?auto_1081816 ?auto_1081824 ) ) ( not ( = ?auto_1081816 ?auto_1081828 ) ) ( not ( = ?auto_1081817 ?auto_1081818 ) ) ( not ( = ?auto_1081817 ?auto_1081819 ) ) ( not ( = ?auto_1081817 ?auto_1081820 ) ) ( not ( = ?auto_1081817 ?auto_1081821 ) ) ( not ( = ?auto_1081817 ?auto_1081822 ) ) ( not ( = ?auto_1081817 ?auto_1081823 ) ) ( not ( = ?auto_1081817 ?auto_1081824 ) ) ( not ( = ?auto_1081817 ?auto_1081828 ) ) ( not ( = ?auto_1081818 ?auto_1081819 ) ) ( not ( = ?auto_1081818 ?auto_1081820 ) ) ( not ( = ?auto_1081818 ?auto_1081821 ) ) ( not ( = ?auto_1081818 ?auto_1081822 ) ) ( not ( = ?auto_1081818 ?auto_1081823 ) ) ( not ( = ?auto_1081818 ?auto_1081824 ) ) ( not ( = ?auto_1081818 ?auto_1081828 ) ) ( not ( = ?auto_1081819 ?auto_1081820 ) ) ( not ( = ?auto_1081819 ?auto_1081821 ) ) ( not ( = ?auto_1081819 ?auto_1081822 ) ) ( not ( = ?auto_1081819 ?auto_1081823 ) ) ( not ( = ?auto_1081819 ?auto_1081824 ) ) ( not ( = ?auto_1081819 ?auto_1081828 ) ) ( not ( = ?auto_1081820 ?auto_1081821 ) ) ( not ( = ?auto_1081820 ?auto_1081822 ) ) ( not ( = ?auto_1081820 ?auto_1081823 ) ) ( not ( = ?auto_1081820 ?auto_1081824 ) ) ( not ( = ?auto_1081820 ?auto_1081828 ) ) ( not ( = ?auto_1081821 ?auto_1081822 ) ) ( not ( = ?auto_1081821 ?auto_1081823 ) ) ( not ( = ?auto_1081821 ?auto_1081824 ) ) ( not ( = ?auto_1081821 ?auto_1081828 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081822 ?auto_1081823 ?auto_1081824 )
      ( MAKE-12CRATE-VERIFY ?auto_1081812 ?auto_1081813 ?auto_1081814 ?auto_1081815 ?auto_1081816 ?auto_1081817 ?auto_1081818 ?auto_1081819 ?auto_1081820 ?auto_1081821 ?auto_1081822 ?auto_1081823 ?auto_1081824 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1081975 - SURFACE
      ?auto_1081976 - SURFACE
      ?auto_1081977 - SURFACE
      ?auto_1081978 - SURFACE
      ?auto_1081979 - SURFACE
      ?auto_1081980 - SURFACE
      ?auto_1081981 - SURFACE
      ?auto_1081982 - SURFACE
      ?auto_1081983 - SURFACE
      ?auto_1081984 - SURFACE
      ?auto_1081985 - SURFACE
      ?auto_1081986 - SURFACE
      ?auto_1081987 - SURFACE
    )
    :vars
    (
      ?auto_1081993 - HOIST
      ?auto_1081992 - PLACE
      ?auto_1081989 - PLACE
      ?auto_1081990 - HOIST
      ?auto_1081988 - SURFACE
      ?auto_1081991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1081993 ?auto_1081992 ) ( IS-CRATE ?auto_1081987 ) ( not ( = ?auto_1081986 ?auto_1081987 ) ) ( not ( = ?auto_1081985 ?auto_1081986 ) ) ( not ( = ?auto_1081985 ?auto_1081987 ) ) ( not ( = ?auto_1081989 ?auto_1081992 ) ) ( HOIST-AT ?auto_1081990 ?auto_1081989 ) ( not ( = ?auto_1081993 ?auto_1081990 ) ) ( AVAILABLE ?auto_1081990 ) ( SURFACE-AT ?auto_1081987 ?auto_1081989 ) ( ON ?auto_1081987 ?auto_1081988 ) ( CLEAR ?auto_1081987 ) ( not ( = ?auto_1081986 ?auto_1081988 ) ) ( not ( = ?auto_1081987 ?auto_1081988 ) ) ( not ( = ?auto_1081985 ?auto_1081988 ) ) ( TRUCK-AT ?auto_1081991 ?auto_1081992 ) ( SURFACE-AT ?auto_1081985 ?auto_1081992 ) ( CLEAR ?auto_1081985 ) ( IS-CRATE ?auto_1081986 ) ( AVAILABLE ?auto_1081993 ) ( IN ?auto_1081986 ?auto_1081991 ) ( ON ?auto_1081976 ?auto_1081975 ) ( ON ?auto_1081977 ?auto_1081976 ) ( ON ?auto_1081978 ?auto_1081977 ) ( ON ?auto_1081979 ?auto_1081978 ) ( ON ?auto_1081980 ?auto_1081979 ) ( ON ?auto_1081981 ?auto_1081980 ) ( ON ?auto_1081982 ?auto_1081981 ) ( ON ?auto_1081983 ?auto_1081982 ) ( ON ?auto_1081984 ?auto_1081983 ) ( ON ?auto_1081985 ?auto_1081984 ) ( not ( = ?auto_1081975 ?auto_1081976 ) ) ( not ( = ?auto_1081975 ?auto_1081977 ) ) ( not ( = ?auto_1081975 ?auto_1081978 ) ) ( not ( = ?auto_1081975 ?auto_1081979 ) ) ( not ( = ?auto_1081975 ?auto_1081980 ) ) ( not ( = ?auto_1081975 ?auto_1081981 ) ) ( not ( = ?auto_1081975 ?auto_1081982 ) ) ( not ( = ?auto_1081975 ?auto_1081983 ) ) ( not ( = ?auto_1081975 ?auto_1081984 ) ) ( not ( = ?auto_1081975 ?auto_1081985 ) ) ( not ( = ?auto_1081975 ?auto_1081986 ) ) ( not ( = ?auto_1081975 ?auto_1081987 ) ) ( not ( = ?auto_1081975 ?auto_1081988 ) ) ( not ( = ?auto_1081976 ?auto_1081977 ) ) ( not ( = ?auto_1081976 ?auto_1081978 ) ) ( not ( = ?auto_1081976 ?auto_1081979 ) ) ( not ( = ?auto_1081976 ?auto_1081980 ) ) ( not ( = ?auto_1081976 ?auto_1081981 ) ) ( not ( = ?auto_1081976 ?auto_1081982 ) ) ( not ( = ?auto_1081976 ?auto_1081983 ) ) ( not ( = ?auto_1081976 ?auto_1081984 ) ) ( not ( = ?auto_1081976 ?auto_1081985 ) ) ( not ( = ?auto_1081976 ?auto_1081986 ) ) ( not ( = ?auto_1081976 ?auto_1081987 ) ) ( not ( = ?auto_1081976 ?auto_1081988 ) ) ( not ( = ?auto_1081977 ?auto_1081978 ) ) ( not ( = ?auto_1081977 ?auto_1081979 ) ) ( not ( = ?auto_1081977 ?auto_1081980 ) ) ( not ( = ?auto_1081977 ?auto_1081981 ) ) ( not ( = ?auto_1081977 ?auto_1081982 ) ) ( not ( = ?auto_1081977 ?auto_1081983 ) ) ( not ( = ?auto_1081977 ?auto_1081984 ) ) ( not ( = ?auto_1081977 ?auto_1081985 ) ) ( not ( = ?auto_1081977 ?auto_1081986 ) ) ( not ( = ?auto_1081977 ?auto_1081987 ) ) ( not ( = ?auto_1081977 ?auto_1081988 ) ) ( not ( = ?auto_1081978 ?auto_1081979 ) ) ( not ( = ?auto_1081978 ?auto_1081980 ) ) ( not ( = ?auto_1081978 ?auto_1081981 ) ) ( not ( = ?auto_1081978 ?auto_1081982 ) ) ( not ( = ?auto_1081978 ?auto_1081983 ) ) ( not ( = ?auto_1081978 ?auto_1081984 ) ) ( not ( = ?auto_1081978 ?auto_1081985 ) ) ( not ( = ?auto_1081978 ?auto_1081986 ) ) ( not ( = ?auto_1081978 ?auto_1081987 ) ) ( not ( = ?auto_1081978 ?auto_1081988 ) ) ( not ( = ?auto_1081979 ?auto_1081980 ) ) ( not ( = ?auto_1081979 ?auto_1081981 ) ) ( not ( = ?auto_1081979 ?auto_1081982 ) ) ( not ( = ?auto_1081979 ?auto_1081983 ) ) ( not ( = ?auto_1081979 ?auto_1081984 ) ) ( not ( = ?auto_1081979 ?auto_1081985 ) ) ( not ( = ?auto_1081979 ?auto_1081986 ) ) ( not ( = ?auto_1081979 ?auto_1081987 ) ) ( not ( = ?auto_1081979 ?auto_1081988 ) ) ( not ( = ?auto_1081980 ?auto_1081981 ) ) ( not ( = ?auto_1081980 ?auto_1081982 ) ) ( not ( = ?auto_1081980 ?auto_1081983 ) ) ( not ( = ?auto_1081980 ?auto_1081984 ) ) ( not ( = ?auto_1081980 ?auto_1081985 ) ) ( not ( = ?auto_1081980 ?auto_1081986 ) ) ( not ( = ?auto_1081980 ?auto_1081987 ) ) ( not ( = ?auto_1081980 ?auto_1081988 ) ) ( not ( = ?auto_1081981 ?auto_1081982 ) ) ( not ( = ?auto_1081981 ?auto_1081983 ) ) ( not ( = ?auto_1081981 ?auto_1081984 ) ) ( not ( = ?auto_1081981 ?auto_1081985 ) ) ( not ( = ?auto_1081981 ?auto_1081986 ) ) ( not ( = ?auto_1081981 ?auto_1081987 ) ) ( not ( = ?auto_1081981 ?auto_1081988 ) ) ( not ( = ?auto_1081982 ?auto_1081983 ) ) ( not ( = ?auto_1081982 ?auto_1081984 ) ) ( not ( = ?auto_1081982 ?auto_1081985 ) ) ( not ( = ?auto_1081982 ?auto_1081986 ) ) ( not ( = ?auto_1081982 ?auto_1081987 ) ) ( not ( = ?auto_1081982 ?auto_1081988 ) ) ( not ( = ?auto_1081983 ?auto_1081984 ) ) ( not ( = ?auto_1081983 ?auto_1081985 ) ) ( not ( = ?auto_1081983 ?auto_1081986 ) ) ( not ( = ?auto_1081983 ?auto_1081987 ) ) ( not ( = ?auto_1081983 ?auto_1081988 ) ) ( not ( = ?auto_1081984 ?auto_1081985 ) ) ( not ( = ?auto_1081984 ?auto_1081986 ) ) ( not ( = ?auto_1081984 ?auto_1081987 ) ) ( not ( = ?auto_1081984 ?auto_1081988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1081985 ?auto_1081986 ?auto_1081987 )
      ( MAKE-12CRATE-VERIFY ?auto_1081975 ?auto_1081976 ?auto_1081977 ?auto_1081978 ?auto_1081979 ?auto_1081980 ?auto_1081981 ?auto_1081982 ?auto_1081983 ?auto_1081984 ?auto_1081985 ?auto_1081986 ?auto_1081987 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1093579 - SURFACE
      ?auto_1093580 - SURFACE
      ?auto_1093581 - SURFACE
      ?auto_1093582 - SURFACE
      ?auto_1093583 - SURFACE
      ?auto_1093584 - SURFACE
      ?auto_1093585 - SURFACE
      ?auto_1093586 - SURFACE
      ?auto_1093587 - SURFACE
      ?auto_1093588 - SURFACE
      ?auto_1093589 - SURFACE
      ?auto_1093590 - SURFACE
      ?auto_1093591 - SURFACE
      ?auto_1093592 - SURFACE
    )
    :vars
    (
      ?auto_1093593 - HOIST
      ?auto_1093594 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1093593 ?auto_1093594 ) ( SURFACE-AT ?auto_1093591 ?auto_1093594 ) ( CLEAR ?auto_1093591 ) ( LIFTING ?auto_1093593 ?auto_1093592 ) ( IS-CRATE ?auto_1093592 ) ( not ( = ?auto_1093591 ?auto_1093592 ) ) ( ON ?auto_1093580 ?auto_1093579 ) ( ON ?auto_1093581 ?auto_1093580 ) ( ON ?auto_1093582 ?auto_1093581 ) ( ON ?auto_1093583 ?auto_1093582 ) ( ON ?auto_1093584 ?auto_1093583 ) ( ON ?auto_1093585 ?auto_1093584 ) ( ON ?auto_1093586 ?auto_1093585 ) ( ON ?auto_1093587 ?auto_1093586 ) ( ON ?auto_1093588 ?auto_1093587 ) ( ON ?auto_1093589 ?auto_1093588 ) ( ON ?auto_1093590 ?auto_1093589 ) ( ON ?auto_1093591 ?auto_1093590 ) ( not ( = ?auto_1093579 ?auto_1093580 ) ) ( not ( = ?auto_1093579 ?auto_1093581 ) ) ( not ( = ?auto_1093579 ?auto_1093582 ) ) ( not ( = ?auto_1093579 ?auto_1093583 ) ) ( not ( = ?auto_1093579 ?auto_1093584 ) ) ( not ( = ?auto_1093579 ?auto_1093585 ) ) ( not ( = ?auto_1093579 ?auto_1093586 ) ) ( not ( = ?auto_1093579 ?auto_1093587 ) ) ( not ( = ?auto_1093579 ?auto_1093588 ) ) ( not ( = ?auto_1093579 ?auto_1093589 ) ) ( not ( = ?auto_1093579 ?auto_1093590 ) ) ( not ( = ?auto_1093579 ?auto_1093591 ) ) ( not ( = ?auto_1093579 ?auto_1093592 ) ) ( not ( = ?auto_1093580 ?auto_1093581 ) ) ( not ( = ?auto_1093580 ?auto_1093582 ) ) ( not ( = ?auto_1093580 ?auto_1093583 ) ) ( not ( = ?auto_1093580 ?auto_1093584 ) ) ( not ( = ?auto_1093580 ?auto_1093585 ) ) ( not ( = ?auto_1093580 ?auto_1093586 ) ) ( not ( = ?auto_1093580 ?auto_1093587 ) ) ( not ( = ?auto_1093580 ?auto_1093588 ) ) ( not ( = ?auto_1093580 ?auto_1093589 ) ) ( not ( = ?auto_1093580 ?auto_1093590 ) ) ( not ( = ?auto_1093580 ?auto_1093591 ) ) ( not ( = ?auto_1093580 ?auto_1093592 ) ) ( not ( = ?auto_1093581 ?auto_1093582 ) ) ( not ( = ?auto_1093581 ?auto_1093583 ) ) ( not ( = ?auto_1093581 ?auto_1093584 ) ) ( not ( = ?auto_1093581 ?auto_1093585 ) ) ( not ( = ?auto_1093581 ?auto_1093586 ) ) ( not ( = ?auto_1093581 ?auto_1093587 ) ) ( not ( = ?auto_1093581 ?auto_1093588 ) ) ( not ( = ?auto_1093581 ?auto_1093589 ) ) ( not ( = ?auto_1093581 ?auto_1093590 ) ) ( not ( = ?auto_1093581 ?auto_1093591 ) ) ( not ( = ?auto_1093581 ?auto_1093592 ) ) ( not ( = ?auto_1093582 ?auto_1093583 ) ) ( not ( = ?auto_1093582 ?auto_1093584 ) ) ( not ( = ?auto_1093582 ?auto_1093585 ) ) ( not ( = ?auto_1093582 ?auto_1093586 ) ) ( not ( = ?auto_1093582 ?auto_1093587 ) ) ( not ( = ?auto_1093582 ?auto_1093588 ) ) ( not ( = ?auto_1093582 ?auto_1093589 ) ) ( not ( = ?auto_1093582 ?auto_1093590 ) ) ( not ( = ?auto_1093582 ?auto_1093591 ) ) ( not ( = ?auto_1093582 ?auto_1093592 ) ) ( not ( = ?auto_1093583 ?auto_1093584 ) ) ( not ( = ?auto_1093583 ?auto_1093585 ) ) ( not ( = ?auto_1093583 ?auto_1093586 ) ) ( not ( = ?auto_1093583 ?auto_1093587 ) ) ( not ( = ?auto_1093583 ?auto_1093588 ) ) ( not ( = ?auto_1093583 ?auto_1093589 ) ) ( not ( = ?auto_1093583 ?auto_1093590 ) ) ( not ( = ?auto_1093583 ?auto_1093591 ) ) ( not ( = ?auto_1093583 ?auto_1093592 ) ) ( not ( = ?auto_1093584 ?auto_1093585 ) ) ( not ( = ?auto_1093584 ?auto_1093586 ) ) ( not ( = ?auto_1093584 ?auto_1093587 ) ) ( not ( = ?auto_1093584 ?auto_1093588 ) ) ( not ( = ?auto_1093584 ?auto_1093589 ) ) ( not ( = ?auto_1093584 ?auto_1093590 ) ) ( not ( = ?auto_1093584 ?auto_1093591 ) ) ( not ( = ?auto_1093584 ?auto_1093592 ) ) ( not ( = ?auto_1093585 ?auto_1093586 ) ) ( not ( = ?auto_1093585 ?auto_1093587 ) ) ( not ( = ?auto_1093585 ?auto_1093588 ) ) ( not ( = ?auto_1093585 ?auto_1093589 ) ) ( not ( = ?auto_1093585 ?auto_1093590 ) ) ( not ( = ?auto_1093585 ?auto_1093591 ) ) ( not ( = ?auto_1093585 ?auto_1093592 ) ) ( not ( = ?auto_1093586 ?auto_1093587 ) ) ( not ( = ?auto_1093586 ?auto_1093588 ) ) ( not ( = ?auto_1093586 ?auto_1093589 ) ) ( not ( = ?auto_1093586 ?auto_1093590 ) ) ( not ( = ?auto_1093586 ?auto_1093591 ) ) ( not ( = ?auto_1093586 ?auto_1093592 ) ) ( not ( = ?auto_1093587 ?auto_1093588 ) ) ( not ( = ?auto_1093587 ?auto_1093589 ) ) ( not ( = ?auto_1093587 ?auto_1093590 ) ) ( not ( = ?auto_1093587 ?auto_1093591 ) ) ( not ( = ?auto_1093587 ?auto_1093592 ) ) ( not ( = ?auto_1093588 ?auto_1093589 ) ) ( not ( = ?auto_1093588 ?auto_1093590 ) ) ( not ( = ?auto_1093588 ?auto_1093591 ) ) ( not ( = ?auto_1093588 ?auto_1093592 ) ) ( not ( = ?auto_1093589 ?auto_1093590 ) ) ( not ( = ?auto_1093589 ?auto_1093591 ) ) ( not ( = ?auto_1093589 ?auto_1093592 ) ) ( not ( = ?auto_1093590 ?auto_1093591 ) ) ( not ( = ?auto_1093590 ?auto_1093592 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1093591 ?auto_1093592 )
      ( MAKE-13CRATE-VERIFY ?auto_1093579 ?auto_1093580 ?auto_1093581 ?auto_1093582 ?auto_1093583 ?auto_1093584 ?auto_1093585 ?auto_1093586 ?auto_1093587 ?auto_1093588 ?auto_1093589 ?auto_1093590 ?auto_1093591 ?auto_1093592 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1093721 - SURFACE
      ?auto_1093722 - SURFACE
      ?auto_1093723 - SURFACE
      ?auto_1093724 - SURFACE
      ?auto_1093725 - SURFACE
      ?auto_1093726 - SURFACE
      ?auto_1093727 - SURFACE
      ?auto_1093728 - SURFACE
      ?auto_1093729 - SURFACE
      ?auto_1093730 - SURFACE
      ?auto_1093731 - SURFACE
      ?auto_1093732 - SURFACE
      ?auto_1093733 - SURFACE
      ?auto_1093734 - SURFACE
    )
    :vars
    (
      ?auto_1093735 - HOIST
      ?auto_1093736 - PLACE
      ?auto_1093737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1093735 ?auto_1093736 ) ( SURFACE-AT ?auto_1093733 ?auto_1093736 ) ( CLEAR ?auto_1093733 ) ( IS-CRATE ?auto_1093734 ) ( not ( = ?auto_1093733 ?auto_1093734 ) ) ( TRUCK-AT ?auto_1093737 ?auto_1093736 ) ( AVAILABLE ?auto_1093735 ) ( IN ?auto_1093734 ?auto_1093737 ) ( ON ?auto_1093733 ?auto_1093732 ) ( not ( = ?auto_1093732 ?auto_1093733 ) ) ( not ( = ?auto_1093732 ?auto_1093734 ) ) ( ON ?auto_1093722 ?auto_1093721 ) ( ON ?auto_1093723 ?auto_1093722 ) ( ON ?auto_1093724 ?auto_1093723 ) ( ON ?auto_1093725 ?auto_1093724 ) ( ON ?auto_1093726 ?auto_1093725 ) ( ON ?auto_1093727 ?auto_1093726 ) ( ON ?auto_1093728 ?auto_1093727 ) ( ON ?auto_1093729 ?auto_1093728 ) ( ON ?auto_1093730 ?auto_1093729 ) ( ON ?auto_1093731 ?auto_1093730 ) ( ON ?auto_1093732 ?auto_1093731 ) ( not ( = ?auto_1093721 ?auto_1093722 ) ) ( not ( = ?auto_1093721 ?auto_1093723 ) ) ( not ( = ?auto_1093721 ?auto_1093724 ) ) ( not ( = ?auto_1093721 ?auto_1093725 ) ) ( not ( = ?auto_1093721 ?auto_1093726 ) ) ( not ( = ?auto_1093721 ?auto_1093727 ) ) ( not ( = ?auto_1093721 ?auto_1093728 ) ) ( not ( = ?auto_1093721 ?auto_1093729 ) ) ( not ( = ?auto_1093721 ?auto_1093730 ) ) ( not ( = ?auto_1093721 ?auto_1093731 ) ) ( not ( = ?auto_1093721 ?auto_1093732 ) ) ( not ( = ?auto_1093721 ?auto_1093733 ) ) ( not ( = ?auto_1093721 ?auto_1093734 ) ) ( not ( = ?auto_1093722 ?auto_1093723 ) ) ( not ( = ?auto_1093722 ?auto_1093724 ) ) ( not ( = ?auto_1093722 ?auto_1093725 ) ) ( not ( = ?auto_1093722 ?auto_1093726 ) ) ( not ( = ?auto_1093722 ?auto_1093727 ) ) ( not ( = ?auto_1093722 ?auto_1093728 ) ) ( not ( = ?auto_1093722 ?auto_1093729 ) ) ( not ( = ?auto_1093722 ?auto_1093730 ) ) ( not ( = ?auto_1093722 ?auto_1093731 ) ) ( not ( = ?auto_1093722 ?auto_1093732 ) ) ( not ( = ?auto_1093722 ?auto_1093733 ) ) ( not ( = ?auto_1093722 ?auto_1093734 ) ) ( not ( = ?auto_1093723 ?auto_1093724 ) ) ( not ( = ?auto_1093723 ?auto_1093725 ) ) ( not ( = ?auto_1093723 ?auto_1093726 ) ) ( not ( = ?auto_1093723 ?auto_1093727 ) ) ( not ( = ?auto_1093723 ?auto_1093728 ) ) ( not ( = ?auto_1093723 ?auto_1093729 ) ) ( not ( = ?auto_1093723 ?auto_1093730 ) ) ( not ( = ?auto_1093723 ?auto_1093731 ) ) ( not ( = ?auto_1093723 ?auto_1093732 ) ) ( not ( = ?auto_1093723 ?auto_1093733 ) ) ( not ( = ?auto_1093723 ?auto_1093734 ) ) ( not ( = ?auto_1093724 ?auto_1093725 ) ) ( not ( = ?auto_1093724 ?auto_1093726 ) ) ( not ( = ?auto_1093724 ?auto_1093727 ) ) ( not ( = ?auto_1093724 ?auto_1093728 ) ) ( not ( = ?auto_1093724 ?auto_1093729 ) ) ( not ( = ?auto_1093724 ?auto_1093730 ) ) ( not ( = ?auto_1093724 ?auto_1093731 ) ) ( not ( = ?auto_1093724 ?auto_1093732 ) ) ( not ( = ?auto_1093724 ?auto_1093733 ) ) ( not ( = ?auto_1093724 ?auto_1093734 ) ) ( not ( = ?auto_1093725 ?auto_1093726 ) ) ( not ( = ?auto_1093725 ?auto_1093727 ) ) ( not ( = ?auto_1093725 ?auto_1093728 ) ) ( not ( = ?auto_1093725 ?auto_1093729 ) ) ( not ( = ?auto_1093725 ?auto_1093730 ) ) ( not ( = ?auto_1093725 ?auto_1093731 ) ) ( not ( = ?auto_1093725 ?auto_1093732 ) ) ( not ( = ?auto_1093725 ?auto_1093733 ) ) ( not ( = ?auto_1093725 ?auto_1093734 ) ) ( not ( = ?auto_1093726 ?auto_1093727 ) ) ( not ( = ?auto_1093726 ?auto_1093728 ) ) ( not ( = ?auto_1093726 ?auto_1093729 ) ) ( not ( = ?auto_1093726 ?auto_1093730 ) ) ( not ( = ?auto_1093726 ?auto_1093731 ) ) ( not ( = ?auto_1093726 ?auto_1093732 ) ) ( not ( = ?auto_1093726 ?auto_1093733 ) ) ( not ( = ?auto_1093726 ?auto_1093734 ) ) ( not ( = ?auto_1093727 ?auto_1093728 ) ) ( not ( = ?auto_1093727 ?auto_1093729 ) ) ( not ( = ?auto_1093727 ?auto_1093730 ) ) ( not ( = ?auto_1093727 ?auto_1093731 ) ) ( not ( = ?auto_1093727 ?auto_1093732 ) ) ( not ( = ?auto_1093727 ?auto_1093733 ) ) ( not ( = ?auto_1093727 ?auto_1093734 ) ) ( not ( = ?auto_1093728 ?auto_1093729 ) ) ( not ( = ?auto_1093728 ?auto_1093730 ) ) ( not ( = ?auto_1093728 ?auto_1093731 ) ) ( not ( = ?auto_1093728 ?auto_1093732 ) ) ( not ( = ?auto_1093728 ?auto_1093733 ) ) ( not ( = ?auto_1093728 ?auto_1093734 ) ) ( not ( = ?auto_1093729 ?auto_1093730 ) ) ( not ( = ?auto_1093729 ?auto_1093731 ) ) ( not ( = ?auto_1093729 ?auto_1093732 ) ) ( not ( = ?auto_1093729 ?auto_1093733 ) ) ( not ( = ?auto_1093729 ?auto_1093734 ) ) ( not ( = ?auto_1093730 ?auto_1093731 ) ) ( not ( = ?auto_1093730 ?auto_1093732 ) ) ( not ( = ?auto_1093730 ?auto_1093733 ) ) ( not ( = ?auto_1093730 ?auto_1093734 ) ) ( not ( = ?auto_1093731 ?auto_1093732 ) ) ( not ( = ?auto_1093731 ?auto_1093733 ) ) ( not ( = ?auto_1093731 ?auto_1093734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1093732 ?auto_1093733 ?auto_1093734 )
      ( MAKE-13CRATE-VERIFY ?auto_1093721 ?auto_1093722 ?auto_1093723 ?auto_1093724 ?auto_1093725 ?auto_1093726 ?auto_1093727 ?auto_1093728 ?auto_1093729 ?auto_1093730 ?auto_1093731 ?auto_1093732 ?auto_1093733 ?auto_1093734 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1093877 - SURFACE
      ?auto_1093878 - SURFACE
      ?auto_1093879 - SURFACE
      ?auto_1093880 - SURFACE
      ?auto_1093881 - SURFACE
      ?auto_1093882 - SURFACE
      ?auto_1093883 - SURFACE
      ?auto_1093884 - SURFACE
      ?auto_1093885 - SURFACE
      ?auto_1093886 - SURFACE
      ?auto_1093887 - SURFACE
      ?auto_1093888 - SURFACE
      ?auto_1093889 - SURFACE
      ?auto_1093890 - SURFACE
    )
    :vars
    (
      ?auto_1093893 - HOIST
      ?auto_1093892 - PLACE
      ?auto_1093891 - TRUCK
      ?auto_1093894 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1093893 ?auto_1093892 ) ( SURFACE-AT ?auto_1093889 ?auto_1093892 ) ( CLEAR ?auto_1093889 ) ( IS-CRATE ?auto_1093890 ) ( not ( = ?auto_1093889 ?auto_1093890 ) ) ( AVAILABLE ?auto_1093893 ) ( IN ?auto_1093890 ?auto_1093891 ) ( ON ?auto_1093889 ?auto_1093888 ) ( not ( = ?auto_1093888 ?auto_1093889 ) ) ( not ( = ?auto_1093888 ?auto_1093890 ) ) ( TRUCK-AT ?auto_1093891 ?auto_1093894 ) ( not ( = ?auto_1093894 ?auto_1093892 ) ) ( ON ?auto_1093878 ?auto_1093877 ) ( ON ?auto_1093879 ?auto_1093878 ) ( ON ?auto_1093880 ?auto_1093879 ) ( ON ?auto_1093881 ?auto_1093880 ) ( ON ?auto_1093882 ?auto_1093881 ) ( ON ?auto_1093883 ?auto_1093882 ) ( ON ?auto_1093884 ?auto_1093883 ) ( ON ?auto_1093885 ?auto_1093884 ) ( ON ?auto_1093886 ?auto_1093885 ) ( ON ?auto_1093887 ?auto_1093886 ) ( ON ?auto_1093888 ?auto_1093887 ) ( not ( = ?auto_1093877 ?auto_1093878 ) ) ( not ( = ?auto_1093877 ?auto_1093879 ) ) ( not ( = ?auto_1093877 ?auto_1093880 ) ) ( not ( = ?auto_1093877 ?auto_1093881 ) ) ( not ( = ?auto_1093877 ?auto_1093882 ) ) ( not ( = ?auto_1093877 ?auto_1093883 ) ) ( not ( = ?auto_1093877 ?auto_1093884 ) ) ( not ( = ?auto_1093877 ?auto_1093885 ) ) ( not ( = ?auto_1093877 ?auto_1093886 ) ) ( not ( = ?auto_1093877 ?auto_1093887 ) ) ( not ( = ?auto_1093877 ?auto_1093888 ) ) ( not ( = ?auto_1093877 ?auto_1093889 ) ) ( not ( = ?auto_1093877 ?auto_1093890 ) ) ( not ( = ?auto_1093878 ?auto_1093879 ) ) ( not ( = ?auto_1093878 ?auto_1093880 ) ) ( not ( = ?auto_1093878 ?auto_1093881 ) ) ( not ( = ?auto_1093878 ?auto_1093882 ) ) ( not ( = ?auto_1093878 ?auto_1093883 ) ) ( not ( = ?auto_1093878 ?auto_1093884 ) ) ( not ( = ?auto_1093878 ?auto_1093885 ) ) ( not ( = ?auto_1093878 ?auto_1093886 ) ) ( not ( = ?auto_1093878 ?auto_1093887 ) ) ( not ( = ?auto_1093878 ?auto_1093888 ) ) ( not ( = ?auto_1093878 ?auto_1093889 ) ) ( not ( = ?auto_1093878 ?auto_1093890 ) ) ( not ( = ?auto_1093879 ?auto_1093880 ) ) ( not ( = ?auto_1093879 ?auto_1093881 ) ) ( not ( = ?auto_1093879 ?auto_1093882 ) ) ( not ( = ?auto_1093879 ?auto_1093883 ) ) ( not ( = ?auto_1093879 ?auto_1093884 ) ) ( not ( = ?auto_1093879 ?auto_1093885 ) ) ( not ( = ?auto_1093879 ?auto_1093886 ) ) ( not ( = ?auto_1093879 ?auto_1093887 ) ) ( not ( = ?auto_1093879 ?auto_1093888 ) ) ( not ( = ?auto_1093879 ?auto_1093889 ) ) ( not ( = ?auto_1093879 ?auto_1093890 ) ) ( not ( = ?auto_1093880 ?auto_1093881 ) ) ( not ( = ?auto_1093880 ?auto_1093882 ) ) ( not ( = ?auto_1093880 ?auto_1093883 ) ) ( not ( = ?auto_1093880 ?auto_1093884 ) ) ( not ( = ?auto_1093880 ?auto_1093885 ) ) ( not ( = ?auto_1093880 ?auto_1093886 ) ) ( not ( = ?auto_1093880 ?auto_1093887 ) ) ( not ( = ?auto_1093880 ?auto_1093888 ) ) ( not ( = ?auto_1093880 ?auto_1093889 ) ) ( not ( = ?auto_1093880 ?auto_1093890 ) ) ( not ( = ?auto_1093881 ?auto_1093882 ) ) ( not ( = ?auto_1093881 ?auto_1093883 ) ) ( not ( = ?auto_1093881 ?auto_1093884 ) ) ( not ( = ?auto_1093881 ?auto_1093885 ) ) ( not ( = ?auto_1093881 ?auto_1093886 ) ) ( not ( = ?auto_1093881 ?auto_1093887 ) ) ( not ( = ?auto_1093881 ?auto_1093888 ) ) ( not ( = ?auto_1093881 ?auto_1093889 ) ) ( not ( = ?auto_1093881 ?auto_1093890 ) ) ( not ( = ?auto_1093882 ?auto_1093883 ) ) ( not ( = ?auto_1093882 ?auto_1093884 ) ) ( not ( = ?auto_1093882 ?auto_1093885 ) ) ( not ( = ?auto_1093882 ?auto_1093886 ) ) ( not ( = ?auto_1093882 ?auto_1093887 ) ) ( not ( = ?auto_1093882 ?auto_1093888 ) ) ( not ( = ?auto_1093882 ?auto_1093889 ) ) ( not ( = ?auto_1093882 ?auto_1093890 ) ) ( not ( = ?auto_1093883 ?auto_1093884 ) ) ( not ( = ?auto_1093883 ?auto_1093885 ) ) ( not ( = ?auto_1093883 ?auto_1093886 ) ) ( not ( = ?auto_1093883 ?auto_1093887 ) ) ( not ( = ?auto_1093883 ?auto_1093888 ) ) ( not ( = ?auto_1093883 ?auto_1093889 ) ) ( not ( = ?auto_1093883 ?auto_1093890 ) ) ( not ( = ?auto_1093884 ?auto_1093885 ) ) ( not ( = ?auto_1093884 ?auto_1093886 ) ) ( not ( = ?auto_1093884 ?auto_1093887 ) ) ( not ( = ?auto_1093884 ?auto_1093888 ) ) ( not ( = ?auto_1093884 ?auto_1093889 ) ) ( not ( = ?auto_1093884 ?auto_1093890 ) ) ( not ( = ?auto_1093885 ?auto_1093886 ) ) ( not ( = ?auto_1093885 ?auto_1093887 ) ) ( not ( = ?auto_1093885 ?auto_1093888 ) ) ( not ( = ?auto_1093885 ?auto_1093889 ) ) ( not ( = ?auto_1093885 ?auto_1093890 ) ) ( not ( = ?auto_1093886 ?auto_1093887 ) ) ( not ( = ?auto_1093886 ?auto_1093888 ) ) ( not ( = ?auto_1093886 ?auto_1093889 ) ) ( not ( = ?auto_1093886 ?auto_1093890 ) ) ( not ( = ?auto_1093887 ?auto_1093888 ) ) ( not ( = ?auto_1093887 ?auto_1093889 ) ) ( not ( = ?auto_1093887 ?auto_1093890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1093888 ?auto_1093889 ?auto_1093890 )
      ( MAKE-13CRATE-VERIFY ?auto_1093877 ?auto_1093878 ?auto_1093879 ?auto_1093880 ?auto_1093881 ?auto_1093882 ?auto_1093883 ?auto_1093884 ?auto_1093885 ?auto_1093886 ?auto_1093887 ?auto_1093888 ?auto_1093889 ?auto_1093890 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094046 - SURFACE
      ?auto_1094047 - SURFACE
      ?auto_1094048 - SURFACE
      ?auto_1094049 - SURFACE
      ?auto_1094050 - SURFACE
      ?auto_1094051 - SURFACE
      ?auto_1094052 - SURFACE
      ?auto_1094053 - SURFACE
      ?auto_1094054 - SURFACE
      ?auto_1094055 - SURFACE
      ?auto_1094056 - SURFACE
      ?auto_1094057 - SURFACE
      ?auto_1094058 - SURFACE
      ?auto_1094059 - SURFACE
    )
    :vars
    (
      ?auto_1094062 - HOIST
      ?auto_1094063 - PLACE
      ?auto_1094060 - TRUCK
      ?auto_1094061 - PLACE
      ?auto_1094064 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094062 ?auto_1094063 ) ( SURFACE-AT ?auto_1094058 ?auto_1094063 ) ( CLEAR ?auto_1094058 ) ( IS-CRATE ?auto_1094059 ) ( not ( = ?auto_1094058 ?auto_1094059 ) ) ( AVAILABLE ?auto_1094062 ) ( ON ?auto_1094058 ?auto_1094057 ) ( not ( = ?auto_1094057 ?auto_1094058 ) ) ( not ( = ?auto_1094057 ?auto_1094059 ) ) ( TRUCK-AT ?auto_1094060 ?auto_1094061 ) ( not ( = ?auto_1094061 ?auto_1094063 ) ) ( HOIST-AT ?auto_1094064 ?auto_1094061 ) ( LIFTING ?auto_1094064 ?auto_1094059 ) ( not ( = ?auto_1094062 ?auto_1094064 ) ) ( ON ?auto_1094047 ?auto_1094046 ) ( ON ?auto_1094048 ?auto_1094047 ) ( ON ?auto_1094049 ?auto_1094048 ) ( ON ?auto_1094050 ?auto_1094049 ) ( ON ?auto_1094051 ?auto_1094050 ) ( ON ?auto_1094052 ?auto_1094051 ) ( ON ?auto_1094053 ?auto_1094052 ) ( ON ?auto_1094054 ?auto_1094053 ) ( ON ?auto_1094055 ?auto_1094054 ) ( ON ?auto_1094056 ?auto_1094055 ) ( ON ?auto_1094057 ?auto_1094056 ) ( not ( = ?auto_1094046 ?auto_1094047 ) ) ( not ( = ?auto_1094046 ?auto_1094048 ) ) ( not ( = ?auto_1094046 ?auto_1094049 ) ) ( not ( = ?auto_1094046 ?auto_1094050 ) ) ( not ( = ?auto_1094046 ?auto_1094051 ) ) ( not ( = ?auto_1094046 ?auto_1094052 ) ) ( not ( = ?auto_1094046 ?auto_1094053 ) ) ( not ( = ?auto_1094046 ?auto_1094054 ) ) ( not ( = ?auto_1094046 ?auto_1094055 ) ) ( not ( = ?auto_1094046 ?auto_1094056 ) ) ( not ( = ?auto_1094046 ?auto_1094057 ) ) ( not ( = ?auto_1094046 ?auto_1094058 ) ) ( not ( = ?auto_1094046 ?auto_1094059 ) ) ( not ( = ?auto_1094047 ?auto_1094048 ) ) ( not ( = ?auto_1094047 ?auto_1094049 ) ) ( not ( = ?auto_1094047 ?auto_1094050 ) ) ( not ( = ?auto_1094047 ?auto_1094051 ) ) ( not ( = ?auto_1094047 ?auto_1094052 ) ) ( not ( = ?auto_1094047 ?auto_1094053 ) ) ( not ( = ?auto_1094047 ?auto_1094054 ) ) ( not ( = ?auto_1094047 ?auto_1094055 ) ) ( not ( = ?auto_1094047 ?auto_1094056 ) ) ( not ( = ?auto_1094047 ?auto_1094057 ) ) ( not ( = ?auto_1094047 ?auto_1094058 ) ) ( not ( = ?auto_1094047 ?auto_1094059 ) ) ( not ( = ?auto_1094048 ?auto_1094049 ) ) ( not ( = ?auto_1094048 ?auto_1094050 ) ) ( not ( = ?auto_1094048 ?auto_1094051 ) ) ( not ( = ?auto_1094048 ?auto_1094052 ) ) ( not ( = ?auto_1094048 ?auto_1094053 ) ) ( not ( = ?auto_1094048 ?auto_1094054 ) ) ( not ( = ?auto_1094048 ?auto_1094055 ) ) ( not ( = ?auto_1094048 ?auto_1094056 ) ) ( not ( = ?auto_1094048 ?auto_1094057 ) ) ( not ( = ?auto_1094048 ?auto_1094058 ) ) ( not ( = ?auto_1094048 ?auto_1094059 ) ) ( not ( = ?auto_1094049 ?auto_1094050 ) ) ( not ( = ?auto_1094049 ?auto_1094051 ) ) ( not ( = ?auto_1094049 ?auto_1094052 ) ) ( not ( = ?auto_1094049 ?auto_1094053 ) ) ( not ( = ?auto_1094049 ?auto_1094054 ) ) ( not ( = ?auto_1094049 ?auto_1094055 ) ) ( not ( = ?auto_1094049 ?auto_1094056 ) ) ( not ( = ?auto_1094049 ?auto_1094057 ) ) ( not ( = ?auto_1094049 ?auto_1094058 ) ) ( not ( = ?auto_1094049 ?auto_1094059 ) ) ( not ( = ?auto_1094050 ?auto_1094051 ) ) ( not ( = ?auto_1094050 ?auto_1094052 ) ) ( not ( = ?auto_1094050 ?auto_1094053 ) ) ( not ( = ?auto_1094050 ?auto_1094054 ) ) ( not ( = ?auto_1094050 ?auto_1094055 ) ) ( not ( = ?auto_1094050 ?auto_1094056 ) ) ( not ( = ?auto_1094050 ?auto_1094057 ) ) ( not ( = ?auto_1094050 ?auto_1094058 ) ) ( not ( = ?auto_1094050 ?auto_1094059 ) ) ( not ( = ?auto_1094051 ?auto_1094052 ) ) ( not ( = ?auto_1094051 ?auto_1094053 ) ) ( not ( = ?auto_1094051 ?auto_1094054 ) ) ( not ( = ?auto_1094051 ?auto_1094055 ) ) ( not ( = ?auto_1094051 ?auto_1094056 ) ) ( not ( = ?auto_1094051 ?auto_1094057 ) ) ( not ( = ?auto_1094051 ?auto_1094058 ) ) ( not ( = ?auto_1094051 ?auto_1094059 ) ) ( not ( = ?auto_1094052 ?auto_1094053 ) ) ( not ( = ?auto_1094052 ?auto_1094054 ) ) ( not ( = ?auto_1094052 ?auto_1094055 ) ) ( not ( = ?auto_1094052 ?auto_1094056 ) ) ( not ( = ?auto_1094052 ?auto_1094057 ) ) ( not ( = ?auto_1094052 ?auto_1094058 ) ) ( not ( = ?auto_1094052 ?auto_1094059 ) ) ( not ( = ?auto_1094053 ?auto_1094054 ) ) ( not ( = ?auto_1094053 ?auto_1094055 ) ) ( not ( = ?auto_1094053 ?auto_1094056 ) ) ( not ( = ?auto_1094053 ?auto_1094057 ) ) ( not ( = ?auto_1094053 ?auto_1094058 ) ) ( not ( = ?auto_1094053 ?auto_1094059 ) ) ( not ( = ?auto_1094054 ?auto_1094055 ) ) ( not ( = ?auto_1094054 ?auto_1094056 ) ) ( not ( = ?auto_1094054 ?auto_1094057 ) ) ( not ( = ?auto_1094054 ?auto_1094058 ) ) ( not ( = ?auto_1094054 ?auto_1094059 ) ) ( not ( = ?auto_1094055 ?auto_1094056 ) ) ( not ( = ?auto_1094055 ?auto_1094057 ) ) ( not ( = ?auto_1094055 ?auto_1094058 ) ) ( not ( = ?auto_1094055 ?auto_1094059 ) ) ( not ( = ?auto_1094056 ?auto_1094057 ) ) ( not ( = ?auto_1094056 ?auto_1094058 ) ) ( not ( = ?auto_1094056 ?auto_1094059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094057 ?auto_1094058 ?auto_1094059 )
      ( MAKE-13CRATE-VERIFY ?auto_1094046 ?auto_1094047 ?auto_1094048 ?auto_1094049 ?auto_1094050 ?auto_1094051 ?auto_1094052 ?auto_1094053 ?auto_1094054 ?auto_1094055 ?auto_1094056 ?auto_1094057 ?auto_1094058 ?auto_1094059 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094228 - SURFACE
      ?auto_1094229 - SURFACE
      ?auto_1094230 - SURFACE
      ?auto_1094231 - SURFACE
      ?auto_1094232 - SURFACE
      ?auto_1094233 - SURFACE
      ?auto_1094234 - SURFACE
      ?auto_1094235 - SURFACE
      ?auto_1094236 - SURFACE
      ?auto_1094237 - SURFACE
      ?auto_1094238 - SURFACE
      ?auto_1094239 - SURFACE
      ?auto_1094240 - SURFACE
      ?auto_1094241 - SURFACE
    )
    :vars
    (
      ?auto_1094242 - HOIST
      ?auto_1094244 - PLACE
      ?auto_1094243 - TRUCK
      ?auto_1094245 - PLACE
      ?auto_1094247 - HOIST
      ?auto_1094246 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094242 ?auto_1094244 ) ( SURFACE-AT ?auto_1094240 ?auto_1094244 ) ( CLEAR ?auto_1094240 ) ( IS-CRATE ?auto_1094241 ) ( not ( = ?auto_1094240 ?auto_1094241 ) ) ( AVAILABLE ?auto_1094242 ) ( ON ?auto_1094240 ?auto_1094239 ) ( not ( = ?auto_1094239 ?auto_1094240 ) ) ( not ( = ?auto_1094239 ?auto_1094241 ) ) ( TRUCK-AT ?auto_1094243 ?auto_1094245 ) ( not ( = ?auto_1094245 ?auto_1094244 ) ) ( HOIST-AT ?auto_1094247 ?auto_1094245 ) ( not ( = ?auto_1094242 ?auto_1094247 ) ) ( AVAILABLE ?auto_1094247 ) ( SURFACE-AT ?auto_1094241 ?auto_1094245 ) ( ON ?auto_1094241 ?auto_1094246 ) ( CLEAR ?auto_1094241 ) ( not ( = ?auto_1094240 ?auto_1094246 ) ) ( not ( = ?auto_1094241 ?auto_1094246 ) ) ( not ( = ?auto_1094239 ?auto_1094246 ) ) ( ON ?auto_1094229 ?auto_1094228 ) ( ON ?auto_1094230 ?auto_1094229 ) ( ON ?auto_1094231 ?auto_1094230 ) ( ON ?auto_1094232 ?auto_1094231 ) ( ON ?auto_1094233 ?auto_1094232 ) ( ON ?auto_1094234 ?auto_1094233 ) ( ON ?auto_1094235 ?auto_1094234 ) ( ON ?auto_1094236 ?auto_1094235 ) ( ON ?auto_1094237 ?auto_1094236 ) ( ON ?auto_1094238 ?auto_1094237 ) ( ON ?auto_1094239 ?auto_1094238 ) ( not ( = ?auto_1094228 ?auto_1094229 ) ) ( not ( = ?auto_1094228 ?auto_1094230 ) ) ( not ( = ?auto_1094228 ?auto_1094231 ) ) ( not ( = ?auto_1094228 ?auto_1094232 ) ) ( not ( = ?auto_1094228 ?auto_1094233 ) ) ( not ( = ?auto_1094228 ?auto_1094234 ) ) ( not ( = ?auto_1094228 ?auto_1094235 ) ) ( not ( = ?auto_1094228 ?auto_1094236 ) ) ( not ( = ?auto_1094228 ?auto_1094237 ) ) ( not ( = ?auto_1094228 ?auto_1094238 ) ) ( not ( = ?auto_1094228 ?auto_1094239 ) ) ( not ( = ?auto_1094228 ?auto_1094240 ) ) ( not ( = ?auto_1094228 ?auto_1094241 ) ) ( not ( = ?auto_1094228 ?auto_1094246 ) ) ( not ( = ?auto_1094229 ?auto_1094230 ) ) ( not ( = ?auto_1094229 ?auto_1094231 ) ) ( not ( = ?auto_1094229 ?auto_1094232 ) ) ( not ( = ?auto_1094229 ?auto_1094233 ) ) ( not ( = ?auto_1094229 ?auto_1094234 ) ) ( not ( = ?auto_1094229 ?auto_1094235 ) ) ( not ( = ?auto_1094229 ?auto_1094236 ) ) ( not ( = ?auto_1094229 ?auto_1094237 ) ) ( not ( = ?auto_1094229 ?auto_1094238 ) ) ( not ( = ?auto_1094229 ?auto_1094239 ) ) ( not ( = ?auto_1094229 ?auto_1094240 ) ) ( not ( = ?auto_1094229 ?auto_1094241 ) ) ( not ( = ?auto_1094229 ?auto_1094246 ) ) ( not ( = ?auto_1094230 ?auto_1094231 ) ) ( not ( = ?auto_1094230 ?auto_1094232 ) ) ( not ( = ?auto_1094230 ?auto_1094233 ) ) ( not ( = ?auto_1094230 ?auto_1094234 ) ) ( not ( = ?auto_1094230 ?auto_1094235 ) ) ( not ( = ?auto_1094230 ?auto_1094236 ) ) ( not ( = ?auto_1094230 ?auto_1094237 ) ) ( not ( = ?auto_1094230 ?auto_1094238 ) ) ( not ( = ?auto_1094230 ?auto_1094239 ) ) ( not ( = ?auto_1094230 ?auto_1094240 ) ) ( not ( = ?auto_1094230 ?auto_1094241 ) ) ( not ( = ?auto_1094230 ?auto_1094246 ) ) ( not ( = ?auto_1094231 ?auto_1094232 ) ) ( not ( = ?auto_1094231 ?auto_1094233 ) ) ( not ( = ?auto_1094231 ?auto_1094234 ) ) ( not ( = ?auto_1094231 ?auto_1094235 ) ) ( not ( = ?auto_1094231 ?auto_1094236 ) ) ( not ( = ?auto_1094231 ?auto_1094237 ) ) ( not ( = ?auto_1094231 ?auto_1094238 ) ) ( not ( = ?auto_1094231 ?auto_1094239 ) ) ( not ( = ?auto_1094231 ?auto_1094240 ) ) ( not ( = ?auto_1094231 ?auto_1094241 ) ) ( not ( = ?auto_1094231 ?auto_1094246 ) ) ( not ( = ?auto_1094232 ?auto_1094233 ) ) ( not ( = ?auto_1094232 ?auto_1094234 ) ) ( not ( = ?auto_1094232 ?auto_1094235 ) ) ( not ( = ?auto_1094232 ?auto_1094236 ) ) ( not ( = ?auto_1094232 ?auto_1094237 ) ) ( not ( = ?auto_1094232 ?auto_1094238 ) ) ( not ( = ?auto_1094232 ?auto_1094239 ) ) ( not ( = ?auto_1094232 ?auto_1094240 ) ) ( not ( = ?auto_1094232 ?auto_1094241 ) ) ( not ( = ?auto_1094232 ?auto_1094246 ) ) ( not ( = ?auto_1094233 ?auto_1094234 ) ) ( not ( = ?auto_1094233 ?auto_1094235 ) ) ( not ( = ?auto_1094233 ?auto_1094236 ) ) ( not ( = ?auto_1094233 ?auto_1094237 ) ) ( not ( = ?auto_1094233 ?auto_1094238 ) ) ( not ( = ?auto_1094233 ?auto_1094239 ) ) ( not ( = ?auto_1094233 ?auto_1094240 ) ) ( not ( = ?auto_1094233 ?auto_1094241 ) ) ( not ( = ?auto_1094233 ?auto_1094246 ) ) ( not ( = ?auto_1094234 ?auto_1094235 ) ) ( not ( = ?auto_1094234 ?auto_1094236 ) ) ( not ( = ?auto_1094234 ?auto_1094237 ) ) ( not ( = ?auto_1094234 ?auto_1094238 ) ) ( not ( = ?auto_1094234 ?auto_1094239 ) ) ( not ( = ?auto_1094234 ?auto_1094240 ) ) ( not ( = ?auto_1094234 ?auto_1094241 ) ) ( not ( = ?auto_1094234 ?auto_1094246 ) ) ( not ( = ?auto_1094235 ?auto_1094236 ) ) ( not ( = ?auto_1094235 ?auto_1094237 ) ) ( not ( = ?auto_1094235 ?auto_1094238 ) ) ( not ( = ?auto_1094235 ?auto_1094239 ) ) ( not ( = ?auto_1094235 ?auto_1094240 ) ) ( not ( = ?auto_1094235 ?auto_1094241 ) ) ( not ( = ?auto_1094235 ?auto_1094246 ) ) ( not ( = ?auto_1094236 ?auto_1094237 ) ) ( not ( = ?auto_1094236 ?auto_1094238 ) ) ( not ( = ?auto_1094236 ?auto_1094239 ) ) ( not ( = ?auto_1094236 ?auto_1094240 ) ) ( not ( = ?auto_1094236 ?auto_1094241 ) ) ( not ( = ?auto_1094236 ?auto_1094246 ) ) ( not ( = ?auto_1094237 ?auto_1094238 ) ) ( not ( = ?auto_1094237 ?auto_1094239 ) ) ( not ( = ?auto_1094237 ?auto_1094240 ) ) ( not ( = ?auto_1094237 ?auto_1094241 ) ) ( not ( = ?auto_1094237 ?auto_1094246 ) ) ( not ( = ?auto_1094238 ?auto_1094239 ) ) ( not ( = ?auto_1094238 ?auto_1094240 ) ) ( not ( = ?auto_1094238 ?auto_1094241 ) ) ( not ( = ?auto_1094238 ?auto_1094246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094239 ?auto_1094240 ?auto_1094241 )
      ( MAKE-13CRATE-VERIFY ?auto_1094228 ?auto_1094229 ?auto_1094230 ?auto_1094231 ?auto_1094232 ?auto_1094233 ?auto_1094234 ?auto_1094235 ?auto_1094236 ?auto_1094237 ?auto_1094238 ?auto_1094239 ?auto_1094240 ?auto_1094241 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094411 - SURFACE
      ?auto_1094412 - SURFACE
      ?auto_1094413 - SURFACE
      ?auto_1094414 - SURFACE
      ?auto_1094415 - SURFACE
      ?auto_1094416 - SURFACE
      ?auto_1094417 - SURFACE
      ?auto_1094418 - SURFACE
      ?auto_1094419 - SURFACE
      ?auto_1094420 - SURFACE
      ?auto_1094421 - SURFACE
      ?auto_1094422 - SURFACE
      ?auto_1094423 - SURFACE
      ?auto_1094424 - SURFACE
    )
    :vars
    (
      ?auto_1094427 - HOIST
      ?auto_1094425 - PLACE
      ?auto_1094430 - PLACE
      ?auto_1094426 - HOIST
      ?auto_1094429 - SURFACE
      ?auto_1094428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094427 ?auto_1094425 ) ( SURFACE-AT ?auto_1094423 ?auto_1094425 ) ( CLEAR ?auto_1094423 ) ( IS-CRATE ?auto_1094424 ) ( not ( = ?auto_1094423 ?auto_1094424 ) ) ( AVAILABLE ?auto_1094427 ) ( ON ?auto_1094423 ?auto_1094422 ) ( not ( = ?auto_1094422 ?auto_1094423 ) ) ( not ( = ?auto_1094422 ?auto_1094424 ) ) ( not ( = ?auto_1094430 ?auto_1094425 ) ) ( HOIST-AT ?auto_1094426 ?auto_1094430 ) ( not ( = ?auto_1094427 ?auto_1094426 ) ) ( AVAILABLE ?auto_1094426 ) ( SURFACE-AT ?auto_1094424 ?auto_1094430 ) ( ON ?auto_1094424 ?auto_1094429 ) ( CLEAR ?auto_1094424 ) ( not ( = ?auto_1094423 ?auto_1094429 ) ) ( not ( = ?auto_1094424 ?auto_1094429 ) ) ( not ( = ?auto_1094422 ?auto_1094429 ) ) ( TRUCK-AT ?auto_1094428 ?auto_1094425 ) ( ON ?auto_1094412 ?auto_1094411 ) ( ON ?auto_1094413 ?auto_1094412 ) ( ON ?auto_1094414 ?auto_1094413 ) ( ON ?auto_1094415 ?auto_1094414 ) ( ON ?auto_1094416 ?auto_1094415 ) ( ON ?auto_1094417 ?auto_1094416 ) ( ON ?auto_1094418 ?auto_1094417 ) ( ON ?auto_1094419 ?auto_1094418 ) ( ON ?auto_1094420 ?auto_1094419 ) ( ON ?auto_1094421 ?auto_1094420 ) ( ON ?auto_1094422 ?auto_1094421 ) ( not ( = ?auto_1094411 ?auto_1094412 ) ) ( not ( = ?auto_1094411 ?auto_1094413 ) ) ( not ( = ?auto_1094411 ?auto_1094414 ) ) ( not ( = ?auto_1094411 ?auto_1094415 ) ) ( not ( = ?auto_1094411 ?auto_1094416 ) ) ( not ( = ?auto_1094411 ?auto_1094417 ) ) ( not ( = ?auto_1094411 ?auto_1094418 ) ) ( not ( = ?auto_1094411 ?auto_1094419 ) ) ( not ( = ?auto_1094411 ?auto_1094420 ) ) ( not ( = ?auto_1094411 ?auto_1094421 ) ) ( not ( = ?auto_1094411 ?auto_1094422 ) ) ( not ( = ?auto_1094411 ?auto_1094423 ) ) ( not ( = ?auto_1094411 ?auto_1094424 ) ) ( not ( = ?auto_1094411 ?auto_1094429 ) ) ( not ( = ?auto_1094412 ?auto_1094413 ) ) ( not ( = ?auto_1094412 ?auto_1094414 ) ) ( not ( = ?auto_1094412 ?auto_1094415 ) ) ( not ( = ?auto_1094412 ?auto_1094416 ) ) ( not ( = ?auto_1094412 ?auto_1094417 ) ) ( not ( = ?auto_1094412 ?auto_1094418 ) ) ( not ( = ?auto_1094412 ?auto_1094419 ) ) ( not ( = ?auto_1094412 ?auto_1094420 ) ) ( not ( = ?auto_1094412 ?auto_1094421 ) ) ( not ( = ?auto_1094412 ?auto_1094422 ) ) ( not ( = ?auto_1094412 ?auto_1094423 ) ) ( not ( = ?auto_1094412 ?auto_1094424 ) ) ( not ( = ?auto_1094412 ?auto_1094429 ) ) ( not ( = ?auto_1094413 ?auto_1094414 ) ) ( not ( = ?auto_1094413 ?auto_1094415 ) ) ( not ( = ?auto_1094413 ?auto_1094416 ) ) ( not ( = ?auto_1094413 ?auto_1094417 ) ) ( not ( = ?auto_1094413 ?auto_1094418 ) ) ( not ( = ?auto_1094413 ?auto_1094419 ) ) ( not ( = ?auto_1094413 ?auto_1094420 ) ) ( not ( = ?auto_1094413 ?auto_1094421 ) ) ( not ( = ?auto_1094413 ?auto_1094422 ) ) ( not ( = ?auto_1094413 ?auto_1094423 ) ) ( not ( = ?auto_1094413 ?auto_1094424 ) ) ( not ( = ?auto_1094413 ?auto_1094429 ) ) ( not ( = ?auto_1094414 ?auto_1094415 ) ) ( not ( = ?auto_1094414 ?auto_1094416 ) ) ( not ( = ?auto_1094414 ?auto_1094417 ) ) ( not ( = ?auto_1094414 ?auto_1094418 ) ) ( not ( = ?auto_1094414 ?auto_1094419 ) ) ( not ( = ?auto_1094414 ?auto_1094420 ) ) ( not ( = ?auto_1094414 ?auto_1094421 ) ) ( not ( = ?auto_1094414 ?auto_1094422 ) ) ( not ( = ?auto_1094414 ?auto_1094423 ) ) ( not ( = ?auto_1094414 ?auto_1094424 ) ) ( not ( = ?auto_1094414 ?auto_1094429 ) ) ( not ( = ?auto_1094415 ?auto_1094416 ) ) ( not ( = ?auto_1094415 ?auto_1094417 ) ) ( not ( = ?auto_1094415 ?auto_1094418 ) ) ( not ( = ?auto_1094415 ?auto_1094419 ) ) ( not ( = ?auto_1094415 ?auto_1094420 ) ) ( not ( = ?auto_1094415 ?auto_1094421 ) ) ( not ( = ?auto_1094415 ?auto_1094422 ) ) ( not ( = ?auto_1094415 ?auto_1094423 ) ) ( not ( = ?auto_1094415 ?auto_1094424 ) ) ( not ( = ?auto_1094415 ?auto_1094429 ) ) ( not ( = ?auto_1094416 ?auto_1094417 ) ) ( not ( = ?auto_1094416 ?auto_1094418 ) ) ( not ( = ?auto_1094416 ?auto_1094419 ) ) ( not ( = ?auto_1094416 ?auto_1094420 ) ) ( not ( = ?auto_1094416 ?auto_1094421 ) ) ( not ( = ?auto_1094416 ?auto_1094422 ) ) ( not ( = ?auto_1094416 ?auto_1094423 ) ) ( not ( = ?auto_1094416 ?auto_1094424 ) ) ( not ( = ?auto_1094416 ?auto_1094429 ) ) ( not ( = ?auto_1094417 ?auto_1094418 ) ) ( not ( = ?auto_1094417 ?auto_1094419 ) ) ( not ( = ?auto_1094417 ?auto_1094420 ) ) ( not ( = ?auto_1094417 ?auto_1094421 ) ) ( not ( = ?auto_1094417 ?auto_1094422 ) ) ( not ( = ?auto_1094417 ?auto_1094423 ) ) ( not ( = ?auto_1094417 ?auto_1094424 ) ) ( not ( = ?auto_1094417 ?auto_1094429 ) ) ( not ( = ?auto_1094418 ?auto_1094419 ) ) ( not ( = ?auto_1094418 ?auto_1094420 ) ) ( not ( = ?auto_1094418 ?auto_1094421 ) ) ( not ( = ?auto_1094418 ?auto_1094422 ) ) ( not ( = ?auto_1094418 ?auto_1094423 ) ) ( not ( = ?auto_1094418 ?auto_1094424 ) ) ( not ( = ?auto_1094418 ?auto_1094429 ) ) ( not ( = ?auto_1094419 ?auto_1094420 ) ) ( not ( = ?auto_1094419 ?auto_1094421 ) ) ( not ( = ?auto_1094419 ?auto_1094422 ) ) ( not ( = ?auto_1094419 ?auto_1094423 ) ) ( not ( = ?auto_1094419 ?auto_1094424 ) ) ( not ( = ?auto_1094419 ?auto_1094429 ) ) ( not ( = ?auto_1094420 ?auto_1094421 ) ) ( not ( = ?auto_1094420 ?auto_1094422 ) ) ( not ( = ?auto_1094420 ?auto_1094423 ) ) ( not ( = ?auto_1094420 ?auto_1094424 ) ) ( not ( = ?auto_1094420 ?auto_1094429 ) ) ( not ( = ?auto_1094421 ?auto_1094422 ) ) ( not ( = ?auto_1094421 ?auto_1094423 ) ) ( not ( = ?auto_1094421 ?auto_1094424 ) ) ( not ( = ?auto_1094421 ?auto_1094429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094422 ?auto_1094423 ?auto_1094424 )
      ( MAKE-13CRATE-VERIFY ?auto_1094411 ?auto_1094412 ?auto_1094413 ?auto_1094414 ?auto_1094415 ?auto_1094416 ?auto_1094417 ?auto_1094418 ?auto_1094419 ?auto_1094420 ?auto_1094421 ?auto_1094422 ?auto_1094423 ?auto_1094424 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094594 - SURFACE
      ?auto_1094595 - SURFACE
      ?auto_1094596 - SURFACE
      ?auto_1094597 - SURFACE
      ?auto_1094598 - SURFACE
      ?auto_1094599 - SURFACE
      ?auto_1094600 - SURFACE
      ?auto_1094601 - SURFACE
      ?auto_1094602 - SURFACE
      ?auto_1094603 - SURFACE
      ?auto_1094604 - SURFACE
      ?auto_1094605 - SURFACE
      ?auto_1094606 - SURFACE
      ?auto_1094607 - SURFACE
    )
    :vars
    (
      ?auto_1094609 - HOIST
      ?auto_1094612 - PLACE
      ?auto_1094610 - PLACE
      ?auto_1094608 - HOIST
      ?auto_1094613 - SURFACE
      ?auto_1094611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094609 ?auto_1094612 ) ( IS-CRATE ?auto_1094607 ) ( not ( = ?auto_1094606 ?auto_1094607 ) ) ( not ( = ?auto_1094605 ?auto_1094606 ) ) ( not ( = ?auto_1094605 ?auto_1094607 ) ) ( not ( = ?auto_1094610 ?auto_1094612 ) ) ( HOIST-AT ?auto_1094608 ?auto_1094610 ) ( not ( = ?auto_1094609 ?auto_1094608 ) ) ( AVAILABLE ?auto_1094608 ) ( SURFACE-AT ?auto_1094607 ?auto_1094610 ) ( ON ?auto_1094607 ?auto_1094613 ) ( CLEAR ?auto_1094607 ) ( not ( = ?auto_1094606 ?auto_1094613 ) ) ( not ( = ?auto_1094607 ?auto_1094613 ) ) ( not ( = ?auto_1094605 ?auto_1094613 ) ) ( TRUCK-AT ?auto_1094611 ?auto_1094612 ) ( SURFACE-AT ?auto_1094605 ?auto_1094612 ) ( CLEAR ?auto_1094605 ) ( LIFTING ?auto_1094609 ?auto_1094606 ) ( IS-CRATE ?auto_1094606 ) ( ON ?auto_1094595 ?auto_1094594 ) ( ON ?auto_1094596 ?auto_1094595 ) ( ON ?auto_1094597 ?auto_1094596 ) ( ON ?auto_1094598 ?auto_1094597 ) ( ON ?auto_1094599 ?auto_1094598 ) ( ON ?auto_1094600 ?auto_1094599 ) ( ON ?auto_1094601 ?auto_1094600 ) ( ON ?auto_1094602 ?auto_1094601 ) ( ON ?auto_1094603 ?auto_1094602 ) ( ON ?auto_1094604 ?auto_1094603 ) ( ON ?auto_1094605 ?auto_1094604 ) ( not ( = ?auto_1094594 ?auto_1094595 ) ) ( not ( = ?auto_1094594 ?auto_1094596 ) ) ( not ( = ?auto_1094594 ?auto_1094597 ) ) ( not ( = ?auto_1094594 ?auto_1094598 ) ) ( not ( = ?auto_1094594 ?auto_1094599 ) ) ( not ( = ?auto_1094594 ?auto_1094600 ) ) ( not ( = ?auto_1094594 ?auto_1094601 ) ) ( not ( = ?auto_1094594 ?auto_1094602 ) ) ( not ( = ?auto_1094594 ?auto_1094603 ) ) ( not ( = ?auto_1094594 ?auto_1094604 ) ) ( not ( = ?auto_1094594 ?auto_1094605 ) ) ( not ( = ?auto_1094594 ?auto_1094606 ) ) ( not ( = ?auto_1094594 ?auto_1094607 ) ) ( not ( = ?auto_1094594 ?auto_1094613 ) ) ( not ( = ?auto_1094595 ?auto_1094596 ) ) ( not ( = ?auto_1094595 ?auto_1094597 ) ) ( not ( = ?auto_1094595 ?auto_1094598 ) ) ( not ( = ?auto_1094595 ?auto_1094599 ) ) ( not ( = ?auto_1094595 ?auto_1094600 ) ) ( not ( = ?auto_1094595 ?auto_1094601 ) ) ( not ( = ?auto_1094595 ?auto_1094602 ) ) ( not ( = ?auto_1094595 ?auto_1094603 ) ) ( not ( = ?auto_1094595 ?auto_1094604 ) ) ( not ( = ?auto_1094595 ?auto_1094605 ) ) ( not ( = ?auto_1094595 ?auto_1094606 ) ) ( not ( = ?auto_1094595 ?auto_1094607 ) ) ( not ( = ?auto_1094595 ?auto_1094613 ) ) ( not ( = ?auto_1094596 ?auto_1094597 ) ) ( not ( = ?auto_1094596 ?auto_1094598 ) ) ( not ( = ?auto_1094596 ?auto_1094599 ) ) ( not ( = ?auto_1094596 ?auto_1094600 ) ) ( not ( = ?auto_1094596 ?auto_1094601 ) ) ( not ( = ?auto_1094596 ?auto_1094602 ) ) ( not ( = ?auto_1094596 ?auto_1094603 ) ) ( not ( = ?auto_1094596 ?auto_1094604 ) ) ( not ( = ?auto_1094596 ?auto_1094605 ) ) ( not ( = ?auto_1094596 ?auto_1094606 ) ) ( not ( = ?auto_1094596 ?auto_1094607 ) ) ( not ( = ?auto_1094596 ?auto_1094613 ) ) ( not ( = ?auto_1094597 ?auto_1094598 ) ) ( not ( = ?auto_1094597 ?auto_1094599 ) ) ( not ( = ?auto_1094597 ?auto_1094600 ) ) ( not ( = ?auto_1094597 ?auto_1094601 ) ) ( not ( = ?auto_1094597 ?auto_1094602 ) ) ( not ( = ?auto_1094597 ?auto_1094603 ) ) ( not ( = ?auto_1094597 ?auto_1094604 ) ) ( not ( = ?auto_1094597 ?auto_1094605 ) ) ( not ( = ?auto_1094597 ?auto_1094606 ) ) ( not ( = ?auto_1094597 ?auto_1094607 ) ) ( not ( = ?auto_1094597 ?auto_1094613 ) ) ( not ( = ?auto_1094598 ?auto_1094599 ) ) ( not ( = ?auto_1094598 ?auto_1094600 ) ) ( not ( = ?auto_1094598 ?auto_1094601 ) ) ( not ( = ?auto_1094598 ?auto_1094602 ) ) ( not ( = ?auto_1094598 ?auto_1094603 ) ) ( not ( = ?auto_1094598 ?auto_1094604 ) ) ( not ( = ?auto_1094598 ?auto_1094605 ) ) ( not ( = ?auto_1094598 ?auto_1094606 ) ) ( not ( = ?auto_1094598 ?auto_1094607 ) ) ( not ( = ?auto_1094598 ?auto_1094613 ) ) ( not ( = ?auto_1094599 ?auto_1094600 ) ) ( not ( = ?auto_1094599 ?auto_1094601 ) ) ( not ( = ?auto_1094599 ?auto_1094602 ) ) ( not ( = ?auto_1094599 ?auto_1094603 ) ) ( not ( = ?auto_1094599 ?auto_1094604 ) ) ( not ( = ?auto_1094599 ?auto_1094605 ) ) ( not ( = ?auto_1094599 ?auto_1094606 ) ) ( not ( = ?auto_1094599 ?auto_1094607 ) ) ( not ( = ?auto_1094599 ?auto_1094613 ) ) ( not ( = ?auto_1094600 ?auto_1094601 ) ) ( not ( = ?auto_1094600 ?auto_1094602 ) ) ( not ( = ?auto_1094600 ?auto_1094603 ) ) ( not ( = ?auto_1094600 ?auto_1094604 ) ) ( not ( = ?auto_1094600 ?auto_1094605 ) ) ( not ( = ?auto_1094600 ?auto_1094606 ) ) ( not ( = ?auto_1094600 ?auto_1094607 ) ) ( not ( = ?auto_1094600 ?auto_1094613 ) ) ( not ( = ?auto_1094601 ?auto_1094602 ) ) ( not ( = ?auto_1094601 ?auto_1094603 ) ) ( not ( = ?auto_1094601 ?auto_1094604 ) ) ( not ( = ?auto_1094601 ?auto_1094605 ) ) ( not ( = ?auto_1094601 ?auto_1094606 ) ) ( not ( = ?auto_1094601 ?auto_1094607 ) ) ( not ( = ?auto_1094601 ?auto_1094613 ) ) ( not ( = ?auto_1094602 ?auto_1094603 ) ) ( not ( = ?auto_1094602 ?auto_1094604 ) ) ( not ( = ?auto_1094602 ?auto_1094605 ) ) ( not ( = ?auto_1094602 ?auto_1094606 ) ) ( not ( = ?auto_1094602 ?auto_1094607 ) ) ( not ( = ?auto_1094602 ?auto_1094613 ) ) ( not ( = ?auto_1094603 ?auto_1094604 ) ) ( not ( = ?auto_1094603 ?auto_1094605 ) ) ( not ( = ?auto_1094603 ?auto_1094606 ) ) ( not ( = ?auto_1094603 ?auto_1094607 ) ) ( not ( = ?auto_1094603 ?auto_1094613 ) ) ( not ( = ?auto_1094604 ?auto_1094605 ) ) ( not ( = ?auto_1094604 ?auto_1094606 ) ) ( not ( = ?auto_1094604 ?auto_1094607 ) ) ( not ( = ?auto_1094604 ?auto_1094613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094605 ?auto_1094606 ?auto_1094607 )
      ( MAKE-13CRATE-VERIFY ?auto_1094594 ?auto_1094595 ?auto_1094596 ?auto_1094597 ?auto_1094598 ?auto_1094599 ?auto_1094600 ?auto_1094601 ?auto_1094602 ?auto_1094603 ?auto_1094604 ?auto_1094605 ?auto_1094606 ?auto_1094607 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1094777 - SURFACE
      ?auto_1094778 - SURFACE
      ?auto_1094779 - SURFACE
      ?auto_1094780 - SURFACE
      ?auto_1094781 - SURFACE
      ?auto_1094782 - SURFACE
      ?auto_1094783 - SURFACE
      ?auto_1094784 - SURFACE
      ?auto_1094785 - SURFACE
      ?auto_1094786 - SURFACE
      ?auto_1094787 - SURFACE
      ?auto_1094788 - SURFACE
      ?auto_1094789 - SURFACE
      ?auto_1094790 - SURFACE
    )
    :vars
    (
      ?auto_1094792 - HOIST
      ?auto_1094794 - PLACE
      ?auto_1094795 - PLACE
      ?auto_1094791 - HOIST
      ?auto_1094793 - SURFACE
      ?auto_1094796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1094792 ?auto_1094794 ) ( IS-CRATE ?auto_1094790 ) ( not ( = ?auto_1094789 ?auto_1094790 ) ) ( not ( = ?auto_1094788 ?auto_1094789 ) ) ( not ( = ?auto_1094788 ?auto_1094790 ) ) ( not ( = ?auto_1094795 ?auto_1094794 ) ) ( HOIST-AT ?auto_1094791 ?auto_1094795 ) ( not ( = ?auto_1094792 ?auto_1094791 ) ) ( AVAILABLE ?auto_1094791 ) ( SURFACE-AT ?auto_1094790 ?auto_1094795 ) ( ON ?auto_1094790 ?auto_1094793 ) ( CLEAR ?auto_1094790 ) ( not ( = ?auto_1094789 ?auto_1094793 ) ) ( not ( = ?auto_1094790 ?auto_1094793 ) ) ( not ( = ?auto_1094788 ?auto_1094793 ) ) ( TRUCK-AT ?auto_1094796 ?auto_1094794 ) ( SURFACE-AT ?auto_1094788 ?auto_1094794 ) ( CLEAR ?auto_1094788 ) ( IS-CRATE ?auto_1094789 ) ( AVAILABLE ?auto_1094792 ) ( IN ?auto_1094789 ?auto_1094796 ) ( ON ?auto_1094778 ?auto_1094777 ) ( ON ?auto_1094779 ?auto_1094778 ) ( ON ?auto_1094780 ?auto_1094779 ) ( ON ?auto_1094781 ?auto_1094780 ) ( ON ?auto_1094782 ?auto_1094781 ) ( ON ?auto_1094783 ?auto_1094782 ) ( ON ?auto_1094784 ?auto_1094783 ) ( ON ?auto_1094785 ?auto_1094784 ) ( ON ?auto_1094786 ?auto_1094785 ) ( ON ?auto_1094787 ?auto_1094786 ) ( ON ?auto_1094788 ?auto_1094787 ) ( not ( = ?auto_1094777 ?auto_1094778 ) ) ( not ( = ?auto_1094777 ?auto_1094779 ) ) ( not ( = ?auto_1094777 ?auto_1094780 ) ) ( not ( = ?auto_1094777 ?auto_1094781 ) ) ( not ( = ?auto_1094777 ?auto_1094782 ) ) ( not ( = ?auto_1094777 ?auto_1094783 ) ) ( not ( = ?auto_1094777 ?auto_1094784 ) ) ( not ( = ?auto_1094777 ?auto_1094785 ) ) ( not ( = ?auto_1094777 ?auto_1094786 ) ) ( not ( = ?auto_1094777 ?auto_1094787 ) ) ( not ( = ?auto_1094777 ?auto_1094788 ) ) ( not ( = ?auto_1094777 ?auto_1094789 ) ) ( not ( = ?auto_1094777 ?auto_1094790 ) ) ( not ( = ?auto_1094777 ?auto_1094793 ) ) ( not ( = ?auto_1094778 ?auto_1094779 ) ) ( not ( = ?auto_1094778 ?auto_1094780 ) ) ( not ( = ?auto_1094778 ?auto_1094781 ) ) ( not ( = ?auto_1094778 ?auto_1094782 ) ) ( not ( = ?auto_1094778 ?auto_1094783 ) ) ( not ( = ?auto_1094778 ?auto_1094784 ) ) ( not ( = ?auto_1094778 ?auto_1094785 ) ) ( not ( = ?auto_1094778 ?auto_1094786 ) ) ( not ( = ?auto_1094778 ?auto_1094787 ) ) ( not ( = ?auto_1094778 ?auto_1094788 ) ) ( not ( = ?auto_1094778 ?auto_1094789 ) ) ( not ( = ?auto_1094778 ?auto_1094790 ) ) ( not ( = ?auto_1094778 ?auto_1094793 ) ) ( not ( = ?auto_1094779 ?auto_1094780 ) ) ( not ( = ?auto_1094779 ?auto_1094781 ) ) ( not ( = ?auto_1094779 ?auto_1094782 ) ) ( not ( = ?auto_1094779 ?auto_1094783 ) ) ( not ( = ?auto_1094779 ?auto_1094784 ) ) ( not ( = ?auto_1094779 ?auto_1094785 ) ) ( not ( = ?auto_1094779 ?auto_1094786 ) ) ( not ( = ?auto_1094779 ?auto_1094787 ) ) ( not ( = ?auto_1094779 ?auto_1094788 ) ) ( not ( = ?auto_1094779 ?auto_1094789 ) ) ( not ( = ?auto_1094779 ?auto_1094790 ) ) ( not ( = ?auto_1094779 ?auto_1094793 ) ) ( not ( = ?auto_1094780 ?auto_1094781 ) ) ( not ( = ?auto_1094780 ?auto_1094782 ) ) ( not ( = ?auto_1094780 ?auto_1094783 ) ) ( not ( = ?auto_1094780 ?auto_1094784 ) ) ( not ( = ?auto_1094780 ?auto_1094785 ) ) ( not ( = ?auto_1094780 ?auto_1094786 ) ) ( not ( = ?auto_1094780 ?auto_1094787 ) ) ( not ( = ?auto_1094780 ?auto_1094788 ) ) ( not ( = ?auto_1094780 ?auto_1094789 ) ) ( not ( = ?auto_1094780 ?auto_1094790 ) ) ( not ( = ?auto_1094780 ?auto_1094793 ) ) ( not ( = ?auto_1094781 ?auto_1094782 ) ) ( not ( = ?auto_1094781 ?auto_1094783 ) ) ( not ( = ?auto_1094781 ?auto_1094784 ) ) ( not ( = ?auto_1094781 ?auto_1094785 ) ) ( not ( = ?auto_1094781 ?auto_1094786 ) ) ( not ( = ?auto_1094781 ?auto_1094787 ) ) ( not ( = ?auto_1094781 ?auto_1094788 ) ) ( not ( = ?auto_1094781 ?auto_1094789 ) ) ( not ( = ?auto_1094781 ?auto_1094790 ) ) ( not ( = ?auto_1094781 ?auto_1094793 ) ) ( not ( = ?auto_1094782 ?auto_1094783 ) ) ( not ( = ?auto_1094782 ?auto_1094784 ) ) ( not ( = ?auto_1094782 ?auto_1094785 ) ) ( not ( = ?auto_1094782 ?auto_1094786 ) ) ( not ( = ?auto_1094782 ?auto_1094787 ) ) ( not ( = ?auto_1094782 ?auto_1094788 ) ) ( not ( = ?auto_1094782 ?auto_1094789 ) ) ( not ( = ?auto_1094782 ?auto_1094790 ) ) ( not ( = ?auto_1094782 ?auto_1094793 ) ) ( not ( = ?auto_1094783 ?auto_1094784 ) ) ( not ( = ?auto_1094783 ?auto_1094785 ) ) ( not ( = ?auto_1094783 ?auto_1094786 ) ) ( not ( = ?auto_1094783 ?auto_1094787 ) ) ( not ( = ?auto_1094783 ?auto_1094788 ) ) ( not ( = ?auto_1094783 ?auto_1094789 ) ) ( not ( = ?auto_1094783 ?auto_1094790 ) ) ( not ( = ?auto_1094783 ?auto_1094793 ) ) ( not ( = ?auto_1094784 ?auto_1094785 ) ) ( not ( = ?auto_1094784 ?auto_1094786 ) ) ( not ( = ?auto_1094784 ?auto_1094787 ) ) ( not ( = ?auto_1094784 ?auto_1094788 ) ) ( not ( = ?auto_1094784 ?auto_1094789 ) ) ( not ( = ?auto_1094784 ?auto_1094790 ) ) ( not ( = ?auto_1094784 ?auto_1094793 ) ) ( not ( = ?auto_1094785 ?auto_1094786 ) ) ( not ( = ?auto_1094785 ?auto_1094787 ) ) ( not ( = ?auto_1094785 ?auto_1094788 ) ) ( not ( = ?auto_1094785 ?auto_1094789 ) ) ( not ( = ?auto_1094785 ?auto_1094790 ) ) ( not ( = ?auto_1094785 ?auto_1094793 ) ) ( not ( = ?auto_1094786 ?auto_1094787 ) ) ( not ( = ?auto_1094786 ?auto_1094788 ) ) ( not ( = ?auto_1094786 ?auto_1094789 ) ) ( not ( = ?auto_1094786 ?auto_1094790 ) ) ( not ( = ?auto_1094786 ?auto_1094793 ) ) ( not ( = ?auto_1094787 ?auto_1094788 ) ) ( not ( = ?auto_1094787 ?auto_1094789 ) ) ( not ( = ?auto_1094787 ?auto_1094790 ) ) ( not ( = ?auto_1094787 ?auto_1094793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1094788 ?auto_1094789 ?auto_1094790 )
      ( MAKE-13CRATE-VERIFY ?auto_1094777 ?auto_1094778 ?auto_1094779 ?auto_1094780 ?auto_1094781 ?auto_1094782 ?auto_1094783 ?auto_1094784 ?auto_1094785 ?auto_1094786 ?auto_1094787 ?auto_1094788 ?auto_1094789 ?auto_1094790 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108157 - SURFACE
      ?auto_1108158 - SURFACE
    )
    :vars
    (
      ?auto_1108165 - HOIST
      ?auto_1108162 - PLACE
      ?auto_1108161 - SURFACE
      ?auto_1108160 - TRUCK
      ?auto_1108164 - PLACE
      ?auto_1108163 - HOIST
      ?auto_1108159 - SURFACE
      ?auto_1108166 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1108165 ?auto_1108162 ) ( SURFACE-AT ?auto_1108157 ?auto_1108162 ) ( CLEAR ?auto_1108157 ) ( IS-CRATE ?auto_1108158 ) ( not ( = ?auto_1108157 ?auto_1108158 ) ) ( AVAILABLE ?auto_1108165 ) ( ON ?auto_1108157 ?auto_1108161 ) ( not ( = ?auto_1108161 ?auto_1108157 ) ) ( not ( = ?auto_1108161 ?auto_1108158 ) ) ( TRUCK-AT ?auto_1108160 ?auto_1108164 ) ( not ( = ?auto_1108164 ?auto_1108162 ) ) ( HOIST-AT ?auto_1108163 ?auto_1108164 ) ( not ( = ?auto_1108165 ?auto_1108163 ) ) ( SURFACE-AT ?auto_1108158 ?auto_1108164 ) ( ON ?auto_1108158 ?auto_1108159 ) ( CLEAR ?auto_1108158 ) ( not ( = ?auto_1108157 ?auto_1108159 ) ) ( not ( = ?auto_1108158 ?auto_1108159 ) ) ( not ( = ?auto_1108161 ?auto_1108159 ) ) ( LIFTING ?auto_1108163 ?auto_1108166 ) ( IS-CRATE ?auto_1108166 ) ( not ( = ?auto_1108157 ?auto_1108166 ) ) ( not ( = ?auto_1108158 ?auto_1108166 ) ) ( not ( = ?auto_1108161 ?auto_1108166 ) ) ( not ( = ?auto_1108159 ?auto_1108166 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1108163 ?auto_1108166 ?auto_1108160 ?auto_1108164 )
      ( MAKE-1CRATE ?auto_1108157 ?auto_1108158 )
      ( MAKE-1CRATE-VERIFY ?auto_1108157 ?auto_1108158 ) )
  )

)

