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
      ?auto_244750 - SURFACE
      ?auto_244751 - SURFACE
    )
    :vars
    (
      ?auto_244752 - HOIST
      ?auto_244753 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244752 ?auto_244753 ) ( SURFACE-AT ?auto_244750 ?auto_244753 ) ( CLEAR ?auto_244750 ) ( LIFTING ?auto_244752 ?auto_244751 ) ( IS-CRATE ?auto_244751 ) ( not ( = ?auto_244750 ?auto_244751 ) ) )
    :subtasks
    ( ( !DROP ?auto_244752 ?auto_244751 ?auto_244750 ?auto_244753 )
      ( MAKE-1CRATE-VERIFY ?auto_244750 ?auto_244751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244754 - SURFACE
      ?auto_244755 - SURFACE
    )
    :vars
    (
      ?auto_244757 - HOIST
      ?auto_244756 - PLACE
      ?auto_244758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244757 ?auto_244756 ) ( SURFACE-AT ?auto_244754 ?auto_244756 ) ( CLEAR ?auto_244754 ) ( IS-CRATE ?auto_244755 ) ( not ( = ?auto_244754 ?auto_244755 ) ) ( TRUCK-AT ?auto_244758 ?auto_244756 ) ( AVAILABLE ?auto_244757 ) ( IN ?auto_244755 ?auto_244758 ) )
    :subtasks
    ( ( !UNLOAD ?auto_244757 ?auto_244755 ?auto_244758 ?auto_244756 )
      ( MAKE-1CRATE ?auto_244754 ?auto_244755 )
      ( MAKE-1CRATE-VERIFY ?auto_244754 ?auto_244755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244759 - SURFACE
      ?auto_244760 - SURFACE
    )
    :vars
    (
      ?auto_244763 - HOIST
      ?auto_244761 - PLACE
      ?auto_244762 - TRUCK
      ?auto_244764 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244763 ?auto_244761 ) ( SURFACE-AT ?auto_244759 ?auto_244761 ) ( CLEAR ?auto_244759 ) ( IS-CRATE ?auto_244760 ) ( not ( = ?auto_244759 ?auto_244760 ) ) ( AVAILABLE ?auto_244763 ) ( IN ?auto_244760 ?auto_244762 ) ( TRUCK-AT ?auto_244762 ?auto_244764 ) ( not ( = ?auto_244764 ?auto_244761 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_244762 ?auto_244764 ?auto_244761 )
      ( MAKE-1CRATE ?auto_244759 ?auto_244760 )
      ( MAKE-1CRATE-VERIFY ?auto_244759 ?auto_244760 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244765 - SURFACE
      ?auto_244766 - SURFACE
    )
    :vars
    (
      ?auto_244768 - HOIST
      ?auto_244767 - PLACE
      ?auto_244770 - TRUCK
      ?auto_244769 - PLACE
      ?auto_244771 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_244768 ?auto_244767 ) ( SURFACE-AT ?auto_244765 ?auto_244767 ) ( CLEAR ?auto_244765 ) ( IS-CRATE ?auto_244766 ) ( not ( = ?auto_244765 ?auto_244766 ) ) ( AVAILABLE ?auto_244768 ) ( TRUCK-AT ?auto_244770 ?auto_244769 ) ( not ( = ?auto_244769 ?auto_244767 ) ) ( HOIST-AT ?auto_244771 ?auto_244769 ) ( LIFTING ?auto_244771 ?auto_244766 ) ( not ( = ?auto_244768 ?auto_244771 ) ) )
    :subtasks
    ( ( !LOAD ?auto_244771 ?auto_244766 ?auto_244770 ?auto_244769 )
      ( MAKE-1CRATE ?auto_244765 ?auto_244766 )
      ( MAKE-1CRATE-VERIFY ?auto_244765 ?auto_244766 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244772 - SURFACE
      ?auto_244773 - SURFACE
    )
    :vars
    (
      ?auto_244778 - HOIST
      ?auto_244776 - PLACE
      ?auto_244775 - TRUCK
      ?auto_244777 - PLACE
      ?auto_244774 - HOIST
      ?auto_244779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244778 ?auto_244776 ) ( SURFACE-AT ?auto_244772 ?auto_244776 ) ( CLEAR ?auto_244772 ) ( IS-CRATE ?auto_244773 ) ( not ( = ?auto_244772 ?auto_244773 ) ) ( AVAILABLE ?auto_244778 ) ( TRUCK-AT ?auto_244775 ?auto_244777 ) ( not ( = ?auto_244777 ?auto_244776 ) ) ( HOIST-AT ?auto_244774 ?auto_244777 ) ( not ( = ?auto_244778 ?auto_244774 ) ) ( AVAILABLE ?auto_244774 ) ( SURFACE-AT ?auto_244773 ?auto_244777 ) ( ON ?auto_244773 ?auto_244779 ) ( CLEAR ?auto_244773 ) ( not ( = ?auto_244772 ?auto_244779 ) ) ( not ( = ?auto_244773 ?auto_244779 ) ) )
    :subtasks
    ( ( !LIFT ?auto_244774 ?auto_244773 ?auto_244779 ?auto_244777 )
      ( MAKE-1CRATE ?auto_244772 ?auto_244773 )
      ( MAKE-1CRATE-VERIFY ?auto_244772 ?auto_244773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244780 - SURFACE
      ?auto_244781 - SURFACE
    )
    :vars
    (
      ?auto_244785 - HOIST
      ?auto_244786 - PLACE
      ?auto_244783 - PLACE
      ?auto_244782 - HOIST
      ?auto_244787 - SURFACE
      ?auto_244784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244785 ?auto_244786 ) ( SURFACE-AT ?auto_244780 ?auto_244786 ) ( CLEAR ?auto_244780 ) ( IS-CRATE ?auto_244781 ) ( not ( = ?auto_244780 ?auto_244781 ) ) ( AVAILABLE ?auto_244785 ) ( not ( = ?auto_244783 ?auto_244786 ) ) ( HOIST-AT ?auto_244782 ?auto_244783 ) ( not ( = ?auto_244785 ?auto_244782 ) ) ( AVAILABLE ?auto_244782 ) ( SURFACE-AT ?auto_244781 ?auto_244783 ) ( ON ?auto_244781 ?auto_244787 ) ( CLEAR ?auto_244781 ) ( not ( = ?auto_244780 ?auto_244787 ) ) ( not ( = ?auto_244781 ?auto_244787 ) ) ( TRUCK-AT ?auto_244784 ?auto_244786 ) )
    :subtasks
    ( ( !DRIVE ?auto_244784 ?auto_244786 ?auto_244783 )
      ( MAKE-1CRATE ?auto_244780 ?auto_244781 )
      ( MAKE-1CRATE-VERIFY ?auto_244780 ?auto_244781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244797 - SURFACE
      ?auto_244798 - SURFACE
      ?auto_244799 - SURFACE
    )
    :vars
    (
      ?auto_244800 - HOIST
      ?auto_244801 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244800 ?auto_244801 ) ( SURFACE-AT ?auto_244798 ?auto_244801 ) ( CLEAR ?auto_244798 ) ( LIFTING ?auto_244800 ?auto_244799 ) ( IS-CRATE ?auto_244799 ) ( not ( = ?auto_244798 ?auto_244799 ) ) ( ON ?auto_244798 ?auto_244797 ) ( not ( = ?auto_244797 ?auto_244798 ) ) ( not ( = ?auto_244797 ?auto_244799 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244798 ?auto_244799 )
      ( MAKE-2CRATE-VERIFY ?auto_244797 ?auto_244798 ?auto_244799 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244807 - SURFACE
      ?auto_244808 - SURFACE
      ?auto_244809 - SURFACE
    )
    :vars
    (
      ?auto_244812 - HOIST
      ?auto_244810 - PLACE
      ?auto_244811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244812 ?auto_244810 ) ( SURFACE-AT ?auto_244808 ?auto_244810 ) ( CLEAR ?auto_244808 ) ( IS-CRATE ?auto_244809 ) ( not ( = ?auto_244808 ?auto_244809 ) ) ( TRUCK-AT ?auto_244811 ?auto_244810 ) ( AVAILABLE ?auto_244812 ) ( IN ?auto_244809 ?auto_244811 ) ( ON ?auto_244808 ?auto_244807 ) ( not ( = ?auto_244807 ?auto_244808 ) ) ( not ( = ?auto_244807 ?auto_244809 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244808 ?auto_244809 )
      ( MAKE-2CRATE-VERIFY ?auto_244807 ?auto_244808 ?auto_244809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244813 - SURFACE
      ?auto_244814 - SURFACE
    )
    :vars
    (
      ?auto_244817 - HOIST
      ?auto_244816 - PLACE
      ?auto_244818 - TRUCK
      ?auto_244815 - SURFACE
      ?auto_244819 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244817 ?auto_244816 ) ( SURFACE-AT ?auto_244813 ?auto_244816 ) ( CLEAR ?auto_244813 ) ( IS-CRATE ?auto_244814 ) ( not ( = ?auto_244813 ?auto_244814 ) ) ( AVAILABLE ?auto_244817 ) ( IN ?auto_244814 ?auto_244818 ) ( ON ?auto_244813 ?auto_244815 ) ( not ( = ?auto_244815 ?auto_244813 ) ) ( not ( = ?auto_244815 ?auto_244814 ) ) ( TRUCK-AT ?auto_244818 ?auto_244819 ) ( not ( = ?auto_244819 ?auto_244816 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_244818 ?auto_244819 ?auto_244816 )
      ( MAKE-2CRATE ?auto_244815 ?auto_244813 ?auto_244814 )
      ( MAKE-1CRATE-VERIFY ?auto_244813 ?auto_244814 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244820 - SURFACE
      ?auto_244821 - SURFACE
      ?auto_244822 - SURFACE
    )
    :vars
    (
      ?auto_244823 - HOIST
      ?auto_244824 - PLACE
      ?auto_244826 - TRUCK
      ?auto_244825 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244823 ?auto_244824 ) ( SURFACE-AT ?auto_244821 ?auto_244824 ) ( CLEAR ?auto_244821 ) ( IS-CRATE ?auto_244822 ) ( not ( = ?auto_244821 ?auto_244822 ) ) ( AVAILABLE ?auto_244823 ) ( IN ?auto_244822 ?auto_244826 ) ( ON ?auto_244821 ?auto_244820 ) ( not ( = ?auto_244820 ?auto_244821 ) ) ( not ( = ?auto_244820 ?auto_244822 ) ) ( TRUCK-AT ?auto_244826 ?auto_244825 ) ( not ( = ?auto_244825 ?auto_244824 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244821 ?auto_244822 )
      ( MAKE-2CRATE-VERIFY ?auto_244820 ?auto_244821 ?auto_244822 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244827 - SURFACE
      ?auto_244828 - SURFACE
    )
    :vars
    (
      ?auto_244831 - HOIST
      ?auto_244830 - PLACE
      ?auto_244829 - SURFACE
      ?auto_244833 - TRUCK
      ?auto_244832 - PLACE
      ?auto_244834 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_244831 ?auto_244830 ) ( SURFACE-AT ?auto_244827 ?auto_244830 ) ( CLEAR ?auto_244827 ) ( IS-CRATE ?auto_244828 ) ( not ( = ?auto_244827 ?auto_244828 ) ) ( AVAILABLE ?auto_244831 ) ( ON ?auto_244827 ?auto_244829 ) ( not ( = ?auto_244829 ?auto_244827 ) ) ( not ( = ?auto_244829 ?auto_244828 ) ) ( TRUCK-AT ?auto_244833 ?auto_244832 ) ( not ( = ?auto_244832 ?auto_244830 ) ) ( HOIST-AT ?auto_244834 ?auto_244832 ) ( LIFTING ?auto_244834 ?auto_244828 ) ( not ( = ?auto_244831 ?auto_244834 ) ) )
    :subtasks
    ( ( !LOAD ?auto_244834 ?auto_244828 ?auto_244833 ?auto_244832 )
      ( MAKE-2CRATE ?auto_244829 ?auto_244827 ?auto_244828 )
      ( MAKE-1CRATE-VERIFY ?auto_244827 ?auto_244828 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244835 - SURFACE
      ?auto_244836 - SURFACE
      ?auto_244837 - SURFACE
    )
    :vars
    (
      ?auto_244841 - HOIST
      ?auto_244842 - PLACE
      ?auto_244839 - TRUCK
      ?auto_244838 - PLACE
      ?auto_244840 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_244841 ?auto_244842 ) ( SURFACE-AT ?auto_244836 ?auto_244842 ) ( CLEAR ?auto_244836 ) ( IS-CRATE ?auto_244837 ) ( not ( = ?auto_244836 ?auto_244837 ) ) ( AVAILABLE ?auto_244841 ) ( ON ?auto_244836 ?auto_244835 ) ( not ( = ?auto_244835 ?auto_244836 ) ) ( not ( = ?auto_244835 ?auto_244837 ) ) ( TRUCK-AT ?auto_244839 ?auto_244838 ) ( not ( = ?auto_244838 ?auto_244842 ) ) ( HOIST-AT ?auto_244840 ?auto_244838 ) ( LIFTING ?auto_244840 ?auto_244837 ) ( not ( = ?auto_244841 ?auto_244840 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244836 ?auto_244837 )
      ( MAKE-2CRATE-VERIFY ?auto_244835 ?auto_244836 ?auto_244837 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244843 - SURFACE
      ?auto_244844 - SURFACE
    )
    :vars
    (
      ?auto_244849 - HOIST
      ?auto_244847 - PLACE
      ?auto_244850 - SURFACE
      ?auto_244846 - TRUCK
      ?auto_244845 - PLACE
      ?auto_244848 - HOIST
      ?auto_244851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244849 ?auto_244847 ) ( SURFACE-AT ?auto_244843 ?auto_244847 ) ( CLEAR ?auto_244843 ) ( IS-CRATE ?auto_244844 ) ( not ( = ?auto_244843 ?auto_244844 ) ) ( AVAILABLE ?auto_244849 ) ( ON ?auto_244843 ?auto_244850 ) ( not ( = ?auto_244850 ?auto_244843 ) ) ( not ( = ?auto_244850 ?auto_244844 ) ) ( TRUCK-AT ?auto_244846 ?auto_244845 ) ( not ( = ?auto_244845 ?auto_244847 ) ) ( HOIST-AT ?auto_244848 ?auto_244845 ) ( not ( = ?auto_244849 ?auto_244848 ) ) ( AVAILABLE ?auto_244848 ) ( SURFACE-AT ?auto_244844 ?auto_244845 ) ( ON ?auto_244844 ?auto_244851 ) ( CLEAR ?auto_244844 ) ( not ( = ?auto_244843 ?auto_244851 ) ) ( not ( = ?auto_244844 ?auto_244851 ) ) ( not ( = ?auto_244850 ?auto_244851 ) ) )
    :subtasks
    ( ( !LIFT ?auto_244848 ?auto_244844 ?auto_244851 ?auto_244845 )
      ( MAKE-2CRATE ?auto_244850 ?auto_244843 ?auto_244844 )
      ( MAKE-1CRATE-VERIFY ?auto_244843 ?auto_244844 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244852 - SURFACE
      ?auto_244853 - SURFACE
      ?auto_244854 - SURFACE
    )
    :vars
    (
      ?auto_244860 - HOIST
      ?auto_244859 - PLACE
      ?auto_244858 - TRUCK
      ?auto_244855 - PLACE
      ?auto_244856 - HOIST
      ?auto_244857 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244860 ?auto_244859 ) ( SURFACE-AT ?auto_244853 ?auto_244859 ) ( CLEAR ?auto_244853 ) ( IS-CRATE ?auto_244854 ) ( not ( = ?auto_244853 ?auto_244854 ) ) ( AVAILABLE ?auto_244860 ) ( ON ?auto_244853 ?auto_244852 ) ( not ( = ?auto_244852 ?auto_244853 ) ) ( not ( = ?auto_244852 ?auto_244854 ) ) ( TRUCK-AT ?auto_244858 ?auto_244855 ) ( not ( = ?auto_244855 ?auto_244859 ) ) ( HOIST-AT ?auto_244856 ?auto_244855 ) ( not ( = ?auto_244860 ?auto_244856 ) ) ( AVAILABLE ?auto_244856 ) ( SURFACE-AT ?auto_244854 ?auto_244855 ) ( ON ?auto_244854 ?auto_244857 ) ( CLEAR ?auto_244854 ) ( not ( = ?auto_244853 ?auto_244857 ) ) ( not ( = ?auto_244854 ?auto_244857 ) ) ( not ( = ?auto_244852 ?auto_244857 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244853 ?auto_244854 )
      ( MAKE-2CRATE-VERIFY ?auto_244852 ?auto_244853 ?auto_244854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244861 - SURFACE
      ?auto_244862 - SURFACE
    )
    :vars
    (
      ?auto_244866 - HOIST
      ?auto_244868 - PLACE
      ?auto_244863 - SURFACE
      ?auto_244865 - PLACE
      ?auto_244864 - HOIST
      ?auto_244869 - SURFACE
      ?auto_244867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244866 ?auto_244868 ) ( SURFACE-AT ?auto_244861 ?auto_244868 ) ( CLEAR ?auto_244861 ) ( IS-CRATE ?auto_244862 ) ( not ( = ?auto_244861 ?auto_244862 ) ) ( AVAILABLE ?auto_244866 ) ( ON ?auto_244861 ?auto_244863 ) ( not ( = ?auto_244863 ?auto_244861 ) ) ( not ( = ?auto_244863 ?auto_244862 ) ) ( not ( = ?auto_244865 ?auto_244868 ) ) ( HOIST-AT ?auto_244864 ?auto_244865 ) ( not ( = ?auto_244866 ?auto_244864 ) ) ( AVAILABLE ?auto_244864 ) ( SURFACE-AT ?auto_244862 ?auto_244865 ) ( ON ?auto_244862 ?auto_244869 ) ( CLEAR ?auto_244862 ) ( not ( = ?auto_244861 ?auto_244869 ) ) ( not ( = ?auto_244862 ?auto_244869 ) ) ( not ( = ?auto_244863 ?auto_244869 ) ) ( TRUCK-AT ?auto_244867 ?auto_244868 ) )
    :subtasks
    ( ( !DRIVE ?auto_244867 ?auto_244868 ?auto_244865 )
      ( MAKE-2CRATE ?auto_244863 ?auto_244861 ?auto_244862 )
      ( MAKE-1CRATE-VERIFY ?auto_244861 ?auto_244862 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244870 - SURFACE
      ?auto_244871 - SURFACE
      ?auto_244872 - SURFACE
    )
    :vars
    (
      ?auto_244874 - HOIST
      ?auto_244875 - PLACE
      ?auto_244878 - PLACE
      ?auto_244876 - HOIST
      ?auto_244873 - SURFACE
      ?auto_244877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244874 ?auto_244875 ) ( SURFACE-AT ?auto_244871 ?auto_244875 ) ( CLEAR ?auto_244871 ) ( IS-CRATE ?auto_244872 ) ( not ( = ?auto_244871 ?auto_244872 ) ) ( AVAILABLE ?auto_244874 ) ( ON ?auto_244871 ?auto_244870 ) ( not ( = ?auto_244870 ?auto_244871 ) ) ( not ( = ?auto_244870 ?auto_244872 ) ) ( not ( = ?auto_244878 ?auto_244875 ) ) ( HOIST-AT ?auto_244876 ?auto_244878 ) ( not ( = ?auto_244874 ?auto_244876 ) ) ( AVAILABLE ?auto_244876 ) ( SURFACE-AT ?auto_244872 ?auto_244878 ) ( ON ?auto_244872 ?auto_244873 ) ( CLEAR ?auto_244872 ) ( not ( = ?auto_244871 ?auto_244873 ) ) ( not ( = ?auto_244872 ?auto_244873 ) ) ( not ( = ?auto_244870 ?auto_244873 ) ) ( TRUCK-AT ?auto_244877 ?auto_244875 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244871 ?auto_244872 )
      ( MAKE-2CRATE-VERIFY ?auto_244870 ?auto_244871 ?auto_244872 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244879 - SURFACE
      ?auto_244880 - SURFACE
    )
    :vars
    (
      ?auto_244884 - HOIST
      ?auto_244885 - PLACE
      ?auto_244882 - SURFACE
      ?auto_244887 - PLACE
      ?auto_244886 - HOIST
      ?auto_244881 - SURFACE
      ?auto_244883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244884 ?auto_244885 ) ( IS-CRATE ?auto_244880 ) ( not ( = ?auto_244879 ?auto_244880 ) ) ( not ( = ?auto_244882 ?auto_244879 ) ) ( not ( = ?auto_244882 ?auto_244880 ) ) ( not ( = ?auto_244887 ?auto_244885 ) ) ( HOIST-AT ?auto_244886 ?auto_244887 ) ( not ( = ?auto_244884 ?auto_244886 ) ) ( AVAILABLE ?auto_244886 ) ( SURFACE-AT ?auto_244880 ?auto_244887 ) ( ON ?auto_244880 ?auto_244881 ) ( CLEAR ?auto_244880 ) ( not ( = ?auto_244879 ?auto_244881 ) ) ( not ( = ?auto_244880 ?auto_244881 ) ) ( not ( = ?auto_244882 ?auto_244881 ) ) ( TRUCK-AT ?auto_244883 ?auto_244885 ) ( SURFACE-AT ?auto_244882 ?auto_244885 ) ( CLEAR ?auto_244882 ) ( LIFTING ?auto_244884 ?auto_244879 ) ( IS-CRATE ?auto_244879 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244882 ?auto_244879 )
      ( MAKE-2CRATE ?auto_244882 ?auto_244879 ?auto_244880 )
      ( MAKE-1CRATE-VERIFY ?auto_244879 ?auto_244880 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244888 - SURFACE
      ?auto_244889 - SURFACE
      ?auto_244890 - SURFACE
    )
    :vars
    (
      ?auto_244896 - HOIST
      ?auto_244893 - PLACE
      ?auto_244895 - PLACE
      ?auto_244894 - HOIST
      ?auto_244891 - SURFACE
      ?auto_244892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244896 ?auto_244893 ) ( IS-CRATE ?auto_244890 ) ( not ( = ?auto_244889 ?auto_244890 ) ) ( not ( = ?auto_244888 ?auto_244889 ) ) ( not ( = ?auto_244888 ?auto_244890 ) ) ( not ( = ?auto_244895 ?auto_244893 ) ) ( HOIST-AT ?auto_244894 ?auto_244895 ) ( not ( = ?auto_244896 ?auto_244894 ) ) ( AVAILABLE ?auto_244894 ) ( SURFACE-AT ?auto_244890 ?auto_244895 ) ( ON ?auto_244890 ?auto_244891 ) ( CLEAR ?auto_244890 ) ( not ( = ?auto_244889 ?auto_244891 ) ) ( not ( = ?auto_244890 ?auto_244891 ) ) ( not ( = ?auto_244888 ?auto_244891 ) ) ( TRUCK-AT ?auto_244892 ?auto_244893 ) ( SURFACE-AT ?auto_244888 ?auto_244893 ) ( CLEAR ?auto_244888 ) ( LIFTING ?auto_244896 ?auto_244889 ) ( IS-CRATE ?auto_244889 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244889 ?auto_244890 )
      ( MAKE-2CRATE-VERIFY ?auto_244888 ?auto_244889 ?auto_244890 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244897 - SURFACE
      ?auto_244898 - SURFACE
    )
    :vars
    (
      ?auto_244901 - HOIST
      ?auto_244904 - PLACE
      ?auto_244900 - SURFACE
      ?auto_244905 - PLACE
      ?auto_244902 - HOIST
      ?auto_244903 - SURFACE
      ?auto_244899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244901 ?auto_244904 ) ( IS-CRATE ?auto_244898 ) ( not ( = ?auto_244897 ?auto_244898 ) ) ( not ( = ?auto_244900 ?auto_244897 ) ) ( not ( = ?auto_244900 ?auto_244898 ) ) ( not ( = ?auto_244905 ?auto_244904 ) ) ( HOIST-AT ?auto_244902 ?auto_244905 ) ( not ( = ?auto_244901 ?auto_244902 ) ) ( AVAILABLE ?auto_244902 ) ( SURFACE-AT ?auto_244898 ?auto_244905 ) ( ON ?auto_244898 ?auto_244903 ) ( CLEAR ?auto_244898 ) ( not ( = ?auto_244897 ?auto_244903 ) ) ( not ( = ?auto_244898 ?auto_244903 ) ) ( not ( = ?auto_244900 ?auto_244903 ) ) ( TRUCK-AT ?auto_244899 ?auto_244904 ) ( SURFACE-AT ?auto_244900 ?auto_244904 ) ( CLEAR ?auto_244900 ) ( IS-CRATE ?auto_244897 ) ( AVAILABLE ?auto_244901 ) ( IN ?auto_244897 ?auto_244899 ) )
    :subtasks
    ( ( !UNLOAD ?auto_244901 ?auto_244897 ?auto_244899 ?auto_244904 )
      ( MAKE-2CRATE ?auto_244900 ?auto_244897 ?auto_244898 )
      ( MAKE-1CRATE-VERIFY ?auto_244897 ?auto_244898 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244906 - SURFACE
      ?auto_244907 - SURFACE
      ?auto_244908 - SURFACE
    )
    :vars
    (
      ?auto_244912 - HOIST
      ?auto_244914 - PLACE
      ?auto_244909 - PLACE
      ?auto_244911 - HOIST
      ?auto_244910 - SURFACE
      ?auto_244913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244912 ?auto_244914 ) ( IS-CRATE ?auto_244908 ) ( not ( = ?auto_244907 ?auto_244908 ) ) ( not ( = ?auto_244906 ?auto_244907 ) ) ( not ( = ?auto_244906 ?auto_244908 ) ) ( not ( = ?auto_244909 ?auto_244914 ) ) ( HOIST-AT ?auto_244911 ?auto_244909 ) ( not ( = ?auto_244912 ?auto_244911 ) ) ( AVAILABLE ?auto_244911 ) ( SURFACE-AT ?auto_244908 ?auto_244909 ) ( ON ?auto_244908 ?auto_244910 ) ( CLEAR ?auto_244908 ) ( not ( = ?auto_244907 ?auto_244910 ) ) ( not ( = ?auto_244908 ?auto_244910 ) ) ( not ( = ?auto_244906 ?auto_244910 ) ) ( TRUCK-AT ?auto_244913 ?auto_244914 ) ( SURFACE-AT ?auto_244906 ?auto_244914 ) ( CLEAR ?auto_244906 ) ( IS-CRATE ?auto_244907 ) ( AVAILABLE ?auto_244912 ) ( IN ?auto_244907 ?auto_244913 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244907 ?auto_244908 )
      ( MAKE-2CRATE-VERIFY ?auto_244906 ?auto_244907 ?auto_244908 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244951 - SURFACE
      ?auto_244952 - SURFACE
    )
    :vars
    (
      ?auto_244957 - HOIST
      ?auto_244956 - PLACE
      ?auto_244955 - SURFACE
      ?auto_244954 - PLACE
      ?auto_244958 - HOIST
      ?auto_244959 - SURFACE
      ?auto_244953 - TRUCK
      ?auto_244960 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244957 ?auto_244956 ) ( SURFACE-AT ?auto_244951 ?auto_244956 ) ( CLEAR ?auto_244951 ) ( IS-CRATE ?auto_244952 ) ( not ( = ?auto_244951 ?auto_244952 ) ) ( AVAILABLE ?auto_244957 ) ( ON ?auto_244951 ?auto_244955 ) ( not ( = ?auto_244955 ?auto_244951 ) ) ( not ( = ?auto_244955 ?auto_244952 ) ) ( not ( = ?auto_244954 ?auto_244956 ) ) ( HOIST-AT ?auto_244958 ?auto_244954 ) ( not ( = ?auto_244957 ?auto_244958 ) ) ( AVAILABLE ?auto_244958 ) ( SURFACE-AT ?auto_244952 ?auto_244954 ) ( ON ?auto_244952 ?auto_244959 ) ( CLEAR ?auto_244952 ) ( not ( = ?auto_244951 ?auto_244959 ) ) ( not ( = ?auto_244952 ?auto_244959 ) ) ( not ( = ?auto_244955 ?auto_244959 ) ) ( TRUCK-AT ?auto_244953 ?auto_244960 ) ( not ( = ?auto_244960 ?auto_244956 ) ) ( not ( = ?auto_244954 ?auto_244960 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_244953 ?auto_244960 ?auto_244956 )
      ( MAKE-1CRATE ?auto_244951 ?auto_244952 )
      ( MAKE-1CRATE-VERIFY ?auto_244951 ?auto_244952 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_244990 - SURFACE
      ?auto_244991 - SURFACE
      ?auto_244992 - SURFACE
      ?auto_244993 - SURFACE
    )
    :vars
    (
      ?auto_244994 - HOIST
      ?auto_244995 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244994 ?auto_244995 ) ( SURFACE-AT ?auto_244992 ?auto_244995 ) ( CLEAR ?auto_244992 ) ( LIFTING ?auto_244994 ?auto_244993 ) ( IS-CRATE ?auto_244993 ) ( not ( = ?auto_244992 ?auto_244993 ) ) ( ON ?auto_244991 ?auto_244990 ) ( ON ?auto_244992 ?auto_244991 ) ( not ( = ?auto_244990 ?auto_244991 ) ) ( not ( = ?auto_244990 ?auto_244992 ) ) ( not ( = ?auto_244990 ?auto_244993 ) ) ( not ( = ?auto_244991 ?auto_244992 ) ) ( not ( = ?auto_244991 ?auto_244993 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244992 ?auto_244993 )
      ( MAKE-3CRATE-VERIFY ?auto_244990 ?auto_244991 ?auto_244992 ?auto_244993 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245007 - SURFACE
      ?auto_245008 - SURFACE
      ?auto_245009 - SURFACE
      ?auto_245010 - SURFACE
    )
    :vars
    (
      ?auto_245011 - HOIST
      ?auto_245013 - PLACE
      ?auto_245012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245011 ?auto_245013 ) ( SURFACE-AT ?auto_245009 ?auto_245013 ) ( CLEAR ?auto_245009 ) ( IS-CRATE ?auto_245010 ) ( not ( = ?auto_245009 ?auto_245010 ) ) ( TRUCK-AT ?auto_245012 ?auto_245013 ) ( AVAILABLE ?auto_245011 ) ( IN ?auto_245010 ?auto_245012 ) ( ON ?auto_245009 ?auto_245008 ) ( not ( = ?auto_245008 ?auto_245009 ) ) ( not ( = ?auto_245008 ?auto_245010 ) ) ( ON ?auto_245008 ?auto_245007 ) ( not ( = ?auto_245007 ?auto_245008 ) ) ( not ( = ?auto_245007 ?auto_245009 ) ) ( not ( = ?auto_245007 ?auto_245010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245008 ?auto_245009 ?auto_245010 )
      ( MAKE-3CRATE-VERIFY ?auto_245007 ?auto_245008 ?auto_245009 ?auto_245010 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245028 - SURFACE
      ?auto_245029 - SURFACE
      ?auto_245030 - SURFACE
      ?auto_245031 - SURFACE
    )
    :vars
    (
      ?auto_245032 - HOIST
      ?auto_245034 - PLACE
      ?auto_245035 - TRUCK
      ?auto_245033 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245032 ?auto_245034 ) ( SURFACE-AT ?auto_245030 ?auto_245034 ) ( CLEAR ?auto_245030 ) ( IS-CRATE ?auto_245031 ) ( not ( = ?auto_245030 ?auto_245031 ) ) ( AVAILABLE ?auto_245032 ) ( IN ?auto_245031 ?auto_245035 ) ( ON ?auto_245030 ?auto_245029 ) ( not ( = ?auto_245029 ?auto_245030 ) ) ( not ( = ?auto_245029 ?auto_245031 ) ) ( TRUCK-AT ?auto_245035 ?auto_245033 ) ( not ( = ?auto_245033 ?auto_245034 ) ) ( ON ?auto_245029 ?auto_245028 ) ( not ( = ?auto_245028 ?auto_245029 ) ) ( not ( = ?auto_245028 ?auto_245030 ) ) ( not ( = ?auto_245028 ?auto_245031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245029 ?auto_245030 ?auto_245031 )
      ( MAKE-3CRATE-VERIFY ?auto_245028 ?auto_245029 ?auto_245030 ?auto_245031 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245052 - SURFACE
      ?auto_245053 - SURFACE
      ?auto_245054 - SURFACE
      ?auto_245055 - SURFACE
    )
    :vars
    (
      ?auto_245060 - HOIST
      ?auto_245058 - PLACE
      ?auto_245056 - TRUCK
      ?auto_245059 - PLACE
      ?auto_245057 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_245060 ?auto_245058 ) ( SURFACE-AT ?auto_245054 ?auto_245058 ) ( CLEAR ?auto_245054 ) ( IS-CRATE ?auto_245055 ) ( not ( = ?auto_245054 ?auto_245055 ) ) ( AVAILABLE ?auto_245060 ) ( ON ?auto_245054 ?auto_245053 ) ( not ( = ?auto_245053 ?auto_245054 ) ) ( not ( = ?auto_245053 ?auto_245055 ) ) ( TRUCK-AT ?auto_245056 ?auto_245059 ) ( not ( = ?auto_245059 ?auto_245058 ) ) ( HOIST-AT ?auto_245057 ?auto_245059 ) ( LIFTING ?auto_245057 ?auto_245055 ) ( not ( = ?auto_245060 ?auto_245057 ) ) ( ON ?auto_245053 ?auto_245052 ) ( not ( = ?auto_245052 ?auto_245053 ) ) ( not ( = ?auto_245052 ?auto_245054 ) ) ( not ( = ?auto_245052 ?auto_245055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245053 ?auto_245054 ?auto_245055 )
      ( MAKE-3CRATE-VERIFY ?auto_245052 ?auto_245053 ?auto_245054 ?auto_245055 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245079 - SURFACE
      ?auto_245080 - SURFACE
      ?auto_245081 - SURFACE
      ?auto_245082 - SURFACE
    )
    :vars
    (
      ?auto_245086 - HOIST
      ?auto_245083 - PLACE
      ?auto_245085 - TRUCK
      ?auto_245088 - PLACE
      ?auto_245084 - HOIST
      ?auto_245087 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245086 ?auto_245083 ) ( SURFACE-AT ?auto_245081 ?auto_245083 ) ( CLEAR ?auto_245081 ) ( IS-CRATE ?auto_245082 ) ( not ( = ?auto_245081 ?auto_245082 ) ) ( AVAILABLE ?auto_245086 ) ( ON ?auto_245081 ?auto_245080 ) ( not ( = ?auto_245080 ?auto_245081 ) ) ( not ( = ?auto_245080 ?auto_245082 ) ) ( TRUCK-AT ?auto_245085 ?auto_245088 ) ( not ( = ?auto_245088 ?auto_245083 ) ) ( HOIST-AT ?auto_245084 ?auto_245088 ) ( not ( = ?auto_245086 ?auto_245084 ) ) ( AVAILABLE ?auto_245084 ) ( SURFACE-AT ?auto_245082 ?auto_245088 ) ( ON ?auto_245082 ?auto_245087 ) ( CLEAR ?auto_245082 ) ( not ( = ?auto_245081 ?auto_245087 ) ) ( not ( = ?auto_245082 ?auto_245087 ) ) ( not ( = ?auto_245080 ?auto_245087 ) ) ( ON ?auto_245080 ?auto_245079 ) ( not ( = ?auto_245079 ?auto_245080 ) ) ( not ( = ?auto_245079 ?auto_245081 ) ) ( not ( = ?auto_245079 ?auto_245082 ) ) ( not ( = ?auto_245079 ?auto_245087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245080 ?auto_245081 ?auto_245082 )
      ( MAKE-3CRATE-VERIFY ?auto_245079 ?auto_245080 ?auto_245081 ?auto_245082 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245107 - SURFACE
      ?auto_245108 - SURFACE
      ?auto_245109 - SURFACE
      ?auto_245110 - SURFACE
    )
    :vars
    (
      ?auto_245114 - HOIST
      ?auto_245111 - PLACE
      ?auto_245116 - PLACE
      ?auto_245113 - HOIST
      ?auto_245112 - SURFACE
      ?auto_245115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245114 ?auto_245111 ) ( SURFACE-AT ?auto_245109 ?auto_245111 ) ( CLEAR ?auto_245109 ) ( IS-CRATE ?auto_245110 ) ( not ( = ?auto_245109 ?auto_245110 ) ) ( AVAILABLE ?auto_245114 ) ( ON ?auto_245109 ?auto_245108 ) ( not ( = ?auto_245108 ?auto_245109 ) ) ( not ( = ?auto_245108 ?auto_245110 ) ) ( not ( = ?auto_245116 ?auto_245111 ) ) ( HOIST-AT ?auto_245113 ?auto_245116 ) ( not ( = ?auto_245114 ?auto_245113 ) ) ( AVAILABLE ?auto_245113 ) ( SURFACE-AT ?auto_245110 ?auto_245116 ) ( ON ?auto_245110 ?auto_245112 ) ( CLEAR ?auto_245110 ) ( not ( = ?auto_245109 ?auto_245112 ) ) ( not ( = ?auto_245110 ?auto_245112 ) ) ( not ( = ?auto_245108 ?auto_245112 ) ) ( TRUCK-AT ?auto_245115 ?auto_245111 ) ( ON ?auto_245108 ?auto_245107 ) ( not ( = ?auto_245107 ?auto_245108 ) ) ( not ( = ?auto_245107 ?auto_245109 ) ) ( not ( = ?auto_245107 ?auto_245110 ) ) ( not ( = ?auto_245107 ?auto_245112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245108 ?auto_245109 ?auto_245110 )
      ( MAKE-3CRATE-VERIFY ?auto_245107 ?auto_245108 ?auto_245109 ?auto_245110 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245135 - SURFACE
      ?auto_245136 - SURFACE
      ?auto_245137 - SURFACE
      ?auto_245138 - SURFACE
    )
    :vars
    (
      ?auto_245142 - HOIST
      ?auto_245143 - PLACE
      ?auto_245139 - PLACE
      ?auto_245141 - HOIST
      ?auto_245140 - SURFACE
      ?auto_245144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245142 ?auto_245143 ) ( IS-CRATE ?auto_245138 ) ( not ( = ?auto_245137 ?auto_245138 ) ) ( not ( = ?auto_245136 ?auto_245137 ) ) ( not ( = ?auto_245136 ?auto_245138 ) ) ( not ( = ?auto_245139 ?auto_245143 ) ) ( HOIST-AT ?auto_245141 ?auto_245139 ) ( not ( = ?auto_245142 ?auto_245141 ) ) ( AVAILABLE ?auto_245141 ) ( SURFACE-AT ?auto_245138 ?auto_245139 ) ( ON ?auto_245138 ?auto_245140 ) ( CLEAR ?auto_245138 ) ( not ( = ?auto_245137 ?auto_245140 ) ) ( not ( = ?auto_245138 ?auto_245140 ) ) ( not ( = ?auto_245136 ?auto_245140 ) ) ( TRUCK-AT ?auto_245144 ?auto_245143 ) ( SURFACE-AT ?auto_245136 ?auto_245143 ) ( CLEAR ?auto_245136 ) ( LIFTING ?auto_245142 ?auto_245137 ) ( IS-CRATE ?auto_245137 ) ( ON ?auto_245136 ?auto_245135 ) ( not ( = ?auto_245135 ?auto_245136 ) ) ( not ( = ?auto_245135 ?auto_245137 ) ) ( not ( = ?auto_245135 ?auto_245138 ) ) ( not ( = ?auto_245135 ?auto_245140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245136 ?auto_245137 ?auto_245138 )
      ( MAKE-3CRATE-VERIFY ?auto_245135 ?auto_245136 ?auto_245137 ?auto_245138 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245163 - SURFACE
      ?auto_245164 - SURFACE
      ?auto_245165 - SURFACE
      ?auto_245166 - SURFACE
    )
    :vars
    (
      ?auto_245171 - HOIST
      ?auto_245167 - PLACE
      ?auto_245169 - PLACE
      ?auto_245172 - HOIST
      ?auto_245168 - SURFACE
      ?auto_245170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245171 ?auto_245167 ) ( IS-CRATE ?auto_245166 ) ( not ( = ?auto_245165 ?auto_245166 ) ) ( not ( = ?auto_245164 ?auto_245165 ) ) ( not ( = ?auto_245164 ?auto_245166 ) ) ( not ( = ?auto_245169 ?auto_245167 ) ) ( HOIST-AT ?auto_245172 ?auto_245169 ) ( not ( = ?auto_245171 ?auto_245172 ) ) ( AVAILABLE ?auto_245172 ) ( SURFACE-AT ?auto_245166 ?auto_245169 ) ( ON ?auto_245166 ?auto_245168 ) ( CLEAR ?auto_245166 ) ( not ( = ?auto_245165 ?auto_245168 ) ) ( not ( = ?auto_245166 ?auto_245168 ) ) ( not ( = ?auto_245164 ?auto_245168 ) ) ( TRUCK-AT ?auto_245170 ?auto_245167 ) ( SURFACE-AT ?auto_245164 ?auto_245167 ) ( CLEAR ?auto_245164 ) ( IS-CRATE ?auto_245165 ) ( AVAILABLE ?auto_245171 ) ( IN ?auto_245165 ?auto_245170 ) ( ON ?auto_245164 ?auto_245163 ) ( not ( = ?auto_245163 ?auto_245164 ) ) ( not ( = ?auto_245163 ?auto_245165 ) ) ( not ( = ?auto_245163 ?auto_245166 ) ) ( not ( = ?auto_245163 ?auto_245168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245164 ?auto_245165 ?auto_245166 )
      ( MAKE-3CRATE-VERIFY ?auto_245163 ?auto_245164 ?auto_245165 ?auto_245166 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245454 - SURFACE
      ?auto_245455 - SURFACE
      ?auto_245456 - SURFACE
      ?auto_245457 - SURFACE
      ?auto_245458 - SURFACE
    )
    :vars
    (
      ?auto_245460 - HOIST
      ?auto_245459 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245460 ?auto_245459 ) ( SURFACE-AT ?auto_245457 ?auto_245459 ) ( CLEAR ?auto_245457 ) ( LIFTING ?auto_245460 ?auto_245458 ) ( IS-CRATE ?auto_245458 ) ( not ( = ?auto_245457 ?auto_245458 ) ) ( ON ?auto_245455 ?auto_245454 ) ( ON ?auto_245456 ?auto_245455 ) ( ON ?auto_245457 ?auto_245456 ) ( not ( = ?auto_245454 ?auto_245455 ) ) ( not ( = ?auto_245454 ?auto_245456 ) ) ( not ( = ?auto_245454 ?auto_245457 ) ) ( not ( = ?auto_245454 ?auto_245458 ) ) ( not ( = ?auto_245455 ?auto_245456 ) ) ( not ( = ?auto_245455 ?auto_245457 ) ) ( not ( = ?auto_245455 ?auto_245458 ) ) ( not ( = ?auto_245456 ?auto_245457 ) ) ( not ( = ?auto_245456 ?auto_245458 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245457 ?auto_245458 )
      ( MAKE-4CRATE-VERIFY ?auto_245454 ?auto_245455 ?auto_245456 ?auto_245457 ?auto_245458 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245479 - SURFACE
      ?auto_245480 - SURFACE
      ?auto_245481 - SURFACE
      ?auto_245482 - SURFACE
      ?auto_245483 - SURFACE
    )
    :vars
    (
      ?auto_245486 - HOIST
      ?auto_245485 - PLACE
      ?auto_245484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245486 ?auto_245485 ) ( SURFACE-AT ?auto_245482 ?auto_245485 ) ( CLEAR ?auto_245482 ) ( IS-CRATE ?auto_245483 ) ( not ( = ?auto_245482 ?auto_245483 ) ) ( TRUCK-AT ?auto_245484 ?auto_245485 ) ( AVAILABLE ?auto_245486 ) ( IN ?auto_245483 ?auto_245484 ) ( ON ?auto_245482 ?auto_245481 ) ( not ( = ?auto_245481 ?auto_245482 ) ) ( not ( = ?auto_245481 ?auto_245483 ) ) ( ON ?auto_245480 ?auto_245479 ) ( ON ?auto_245481 ?auto_245480 ) ( not ( = ?auto_245479 ?auto_245480 ) ) ( not ( = ?auto_245479 ?auto_245481 ) ) ( not ( = ?auto_245479 ?auto_245482 ) ) ( not ( = ?auto_245479 ?auto_245483 ) ) ( not ( = ?auto_245480 ?auto_245481 ) ) ( not ( = ?auto_245480 ?auto_245482 ) ) ( not ( = ?auto_245480 ?auto_245483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245481 ?auto_245482 ?auto_245483 )
      ( MAKE-4CRATE-VERIFY ?auto_245479 ?auto_245480 ?auto_245481 ?auto_245482 ?auto_245483 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245509 - SURFACE
      ?auto_245510 - SURFACE
      ?auto_245511 - SURFACE
      ?auto_245512 - SURFACE
      ?auto_245513 - SURFACE
    )
    :vars
    (
      ?auto_245517 - HOIST
      ?auto_245514 - PLACE
      ?auto_245515 - TRUCK
      ?auto_245516 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245517 ?auto_245514 ) ( SURFACE-AT ?auto_245512 ?auto_245514 ) ( CLEAR ?auto_245512 ) ( IS-CRATE ?auto_245513 ) ( not ( = ?auto_245512 ?auto_245513 ) ) ( AVAILABLE ?auto_245517 ) ( IN ?auto_245513 ?auto_245515 ) ( ON ?auto_245512 ?auto_245511 ) ( not ( = ?auto_245511 ?auto_245512 ) ) ( not ( = ?auto_245511 ?auto_245513 ) ) ( TRUCK-AT ?auto_245515 ?auto_245516 ) ( not ( = ?auto_245516 ?auto_245514 ) ) ( ON ?auto_245510 ?auto_245509 ) ( ON ?auto_245511 ?auto_245510 ) ( not ( = ?auto_245509 ?auto_245510 ) ) ( not ( = ?auto_245509 ?auto_245511 ) ) ( not ( = ?auto_245509 ?auto_245512 ) ) ( not ( = ?auto_245509 ?auto_245513 ) ) ( not ( = ?auto_245510 ?auto_245511 ) ) ( not ( = ?auto_245510 ?auto_245512 ) ) ( not ( = ?auto_245510 ?auto_245513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245511 ?auto_245512 ?auto_245513 )
      ( MAKE-4CRATE-VERIFY ?auto_245509 ?auto_245510 ?auto_245511 ?auto_245512 ?auto_245513 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245543 - SURFACE
      ?auto_245544 - SURFACE
      ?auto_245545 - SURFACE
      ?auto_245546 - SURFACE
      ?auto_245547 - SURFACE
    )
    :vars
    (
      ?auto_245549 - HOIST
      ?auto_245548 - PLACE
      ?auto_245550 - TRUCK
      ?auto_245551 - PLACE
      ?auto_245552 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_245549 ?auto_245548 ) ( SURFACE-AT ?auto_245546 ?auto_245548 ) ( CLEAR ?auto_245546 ) ( IS-CRATE ?auto_245547 ) ( not ( = ?auto_245546 ?auto_245547 ) ) ( AVAILABLE ?auto_245549 ) ( ON ?auto_245546 ?auto_245545 ) ( not ( = ?auto_245545 ?auto_245546 ) ) ( not ( = ?auto_245545 ?auto_245547 ) ) ( TRUCK-AT ?auto_245550 ?auto_245551 ) ( not ( = ?auto_245551 ?auto_245548 ) ) ( HOIST-AT ?auto_245552 ?auto_245551 ) ( LIFTING ?auto_245552 ?auto_245547 ) ( not ( = ?auto_245549 ?auto_245552 ) ) ( ON ?auto_245544 ?auto_245543 ) ( ON ?auto_245545 ?auto_245544 ) ( not ( = ?auto_245543 ?auto_245544 ) ) ( not ( = ?auto_245543 ?auto_245545 ) ) ( not ( = ?auto_245543 ?auto_245546 ) ) ( not ( = ?auto_245543 ?auto_245547 ) ) ( not ( = ?auto_245544 ?auto_245545 ) ) ( not ( = ?auto_245544 ?auto_245546 ) ) ( not ( = ?auto_245544 ?auto_245547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245545 ?auto_245546 ?auto_245547 )
      ( MAKE-4CRATE-VERIFY ?auto_245543 ?auto_245544 ?auto_245545 ?auto_245546 ?auto_245547 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245581 - SURFACE
      ?auto_245582 - SURFACE
      ?auto_245583 - SURFACE
      ?auto_245584 - SURFACE
      ?auto_245585 - SURFACE
    )
    :vars
    (
      ?auto_245586 - HOIST
      ?auto_245589 - PLACE
      ?auto_245588 - TRUCK
      ?auto_245591 - PLACE
      ?auto_245587 - HOIST
      ?auto_245590 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245586 ?auto_245589 ) ( SURFACE-AT ?auto_245584 ?auto_245589 ) ( CLEAR ?auto_245584 ) ( IS-CRATE ?auto_245585 ) ( not ( = ?auto_245584 ?auto_245585 ) ) ( AVAILABLE ?auto_245586 ) ( ON ?auto_245584 ?auto_245583 ) ( not ( = ?auto_245583 ?auto_245584 ) ) ( not ( = ?auto_245583 ?auto_245585 ) ) ( TRUCK-AT ?auto_245588 ?auto_245591 ) ( not ( = ?auto_245591 ?auto_245589 ) ) ( HOIST-AT ?auto_245587 ?auto_245591 ) ( not ( = ?auto_245586 ?auto_245587 ) ) ( AVAILABLE ?auto_245587 ) ( SURFACE-AT ?auto_245585 ?auto_245591 ) ( ON ?auto_245585 ?auto_245590 ) ( CLEAR ?auto_245585 ) ( not ( = ?auto_245584 ?auto_245590 ) ) ( not ( = ?auto_245585 ?auto_245590 ) ) ( not ( = ?auto_245583 ?auto_245590 ) ) ( ON ?auto_245582 ?auto_245581 ) ( ON ?auto_245583 ?auto_245582 ) ( not ( = ?auto_245581 ?auto_245582 ) ) ( not ( = ?auto_245581 ?auto_245583 ) ) ( not ( = ?auto_245581 ?auto_245584 ) ) ( not ( = ?auto_245581 ?auto_245585 ) ) ( not ( = ?auto_245581 ?auto_245590 ) ) ( not ( = ?auto_245582 ?auto_245583 ) ) ( not ( = ?auto_245582 ?auto_245584 ) ) ( not ( = ?auto_245582 ?auto_245585 ) ) ( not ( = ?auto_245582 ?auto_245590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245583 ?auto_245584 ?auto_245585 )
      ( MAKE-4CRATE-VERIFY ?auto_245581 ?auto_245582 ?auto_245583 ?auto_245584 ?auto_245585 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245620 - SURFACE
      ?auto_245621 - SURFACE
      ?auto_245622 - SURFACE
      ?auto_245623 - SURFACE
      ?auto_245624 - SURFACE
    )
    :vars
    (
      ?auto_245630 - HOIST
      ?auto_245629 - PLACE
      ?auto_245625 - PLACE
      ?auto_245626 - HOIST
      ?auto_245628 - SURFACE
      ?auto_245627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245630 ?auto_245629 ) ( SURFACE-AT ?auto_245623 ?auto_245629 ) ( CLEAR ?auto_245623 ) ( IS-CRATE ?auto_245624 ) ( not ( = ?auto_245623 ?auto_245624 ) ) ( AVAILABLE ?auto_245630 ) ( ON ?auto_245623 ?auto_245622 ) ( not ( = ?auto_245622 ?auto_245623 ) ) ( not ( = ?auto_245622 ?auto_245624 ) ) ( not ( = ?auto_245625 ?auto_245629 ) ) ( HOIST-AT ?auto_245626 ?auto_245625 ) ( not ( = ?auto_245630 ?auto_245626 ) ) ( AVAILABLE ?auto_245626 ) ( SURFACE-AT ?auto_245624 ?auto_245625 ) ( ON ?auto_245624 ?auto_245628 ) ( CLEAR ?auto_245624 ) ( not ( = ?auto_245623 ?auto_245628 ) ) ( not ( = ?auto_245624 ?auto_245628 ) ) ( not ( = ?auto_245622 ?auto_245628 ) ) ( TRUCK-AT ?auto_245627 ?auto_245629 ) ( ON ?auto_245621 ?auto_245620 ) ( ON ?auto_245622 ?auto_245621 ) ( not ( = ?auto_245620 ?auto_245621 ) ) ( not ( = ?auto_245620 ?auto_245622 ) ) ( not ( = ?auto_245620 ?auto_245623 ) ) ( not ( = ?auto_245620 ?auto_245624 ) ) ( not ( = ?auto_245620 ?auto_245628 ) ) ( not ( = ?auto_245621 ?auto_245622 ) ) ( not ( = ?auto_245621 ?auto_245623 ) ) ( not ( = ?auto_245621 ?auto_245624 ) ) ( not ( = ?auto_245621 ?auto_245628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245622 ?auto_245623 ?auto_245624 )
      ( MAKE-4CRATE-VERIFY ?auto_245620 ?auto_245621 ?auto_245622 ?auto_245623 ?auto_245624 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245659 - SURFACE
      ?auto_245660 - SURFACE
      ?auto_245661 - SURFACE
      ?auto_245662 - SURFACE
      ?auto_245663 - SURFACE
    )
    :vars
    (
      ?auto_245664 - HOIST
      ?auto_245668 - PLACE
      ?auto_245667 - PLACE
      ?auto_245669 - HOIST
      ?auto_245666 - SURFACE
      ?auto_245665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245664 ?auto_245668 ) ( IS-CRATE ?auto_245663 ) ( not ( = ?auto_245662 ?auto_245663 ) ) ( not ( = ?auto_245661 ?auto_245662 ) ) ( not ( = ?auto_245661 ?auto_245663 ) ) ( not ( = ?auto_245667 ?auto_245668 ) ) ( HOIST-AT ?auto_245669 ?auto_245667 ) ( not ( = ?auto_245664 ?auto_245669 ) ) ( AVAILABLE ?auto_245669 ) ( SURFACE-AT ?auto_245663 ?auto_245667 ) ( ON ?auto_245663 ?auto_245666 ) ( CLEAR ?auto_245663 ) ( not ( = ?auto_245662 ?auto_245666 ) ) ( not ( = ?auto_245663 ?auto_245666 ) ) ( not ( = ?auto_245661 ?auto_245666 ) ) ( TRUCK-AT ?auto_245665 ?auto_245668 ) ( SURFACE-AT ?auto_245661 ?auto_245668 ) ( CLEAR ?auto_245661 ) ( LIFTING ?auto_245664 ?auto_245662 ) ( IS-CRATE ?auto_245662 ) ( ON ?auto_245660 ?auto_245659 ) ( ON ?auto_245661 ?auto_245660 ) ( not ( = ?auto_245659 ?auto_245660 ) ) ( not ( = ?auto_245659 ?auto_245661 ) ) ( not ( = ?auto_245659 ?auto_245662 ) ) ( not ( = ?auto_245659 ?auto_245663 ) ) ( not ( = ?auto_245659 ?auto_245666 ) ) ( not ( = ?auto_245660 ?auto_245661 ) ) ( not ( = ?auto_245660 ?auto_245662 ) ) ( not ( = ?auto_245660 ?auto_245663 ) ) ( not ( = ?auto_245660 ?auto_245666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245661 ?auto_245662 ?auto_245663 )
      ( MAKE-4CRATE-VERIFY ?auto_245659 ?auto_245660 ?auto_245661 ?auto_245662 ?auto_245663 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245698 - SURFACE
      ?auto_245699 - SURFACE
      ?auto_245700 - SURFACE
      ?auto_245701 - SURFACE
      ?auto_245702 - SURFACE
    )
    :vars
    (
      ?auto_245706 - HOIST
      ?auto_245708 - PLACE
      ?auto_245707 - PLACE
      ?auto_245705 - HOIST
      ?auto_245704 - SURFACE
      ?auto_245703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245706 ?auto_245708 ) ( IS-CRATE ?auto_245702 ) ( not ( = ?auto_245701 ?auto_245702 ) ) ( not ( = ?auto_245700 ?auto_245701 ) ) ( not ( = ?auto_245700 ?auto_245702 ) ) ( not ( = ?auto_245707 ?auto_245708 ) ) ( HOIST-AT ?auto_245705 ?auto_245707 ) ( not ( = ?auto_245706 ?auto_245705 ) ) ( AVAILABLE ?auto_245705 ) ( SURFACE-AT ?auto_245702 ?auto_245707 ) ( ON ?auto_245702 ?auto_245704 ) ( CLEAR ?auto_245702 ) ( not ( = ?auto_245701 ?auto_245704 ) ) ( not ( = ?auto_245702 ?auto_245704 ) ) ( not ( = ?auto_245700 ?auto_245704 ) ) ( TRUCK-AT ?auto_245703 ?auto_245708 ) ( SURFACE-AT ?auto_245700 ?auto_245708 ) ( CLEAR ?auto_245700 ) ( IS-CRATE ?auto_245701 ) ( AVAILABLE ?auto_245706 ) ( IN ?auto_245701 ?auto_245703 ) ( ON ?auto_245699 ?auto_245698 ) ( ON ?auto_245700 ?auto_245699 ) ( not ( = ?auto_245698 ?auto_245699 ) ) ( not ( = ?auto_245698 ?auto_245700 ) ) ( not ( = ?auto_245698 ?auto_245701 ) ) ( not ( = ?auto_245698 ?auto_245702 ) ) ( not ( = ?auto_245698 ?auto_245704 ) ) ( not ( = ?auto_245699 ?auto_245700 ) ) ( not ( = ?auto_245699 ?auto_245701 ) ) ( not ( = ?auto_245699 ?auto_245702 ) ) ( not ( = ?auto_245699 ?auto_245704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245700 ?auto_245701 ?auto_245702 )
      ( MAKE-4CRATE-VERIFY ?auto_245698 ?auto_245699 ?auto_245700 ?auto_245701 ?auto_245702 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_245971 - SURFACE
      ?auto_245972 - SURFACE
    )
    :vars
    (
      ?auto_245974 - HOIST
      ?auto_245977 - PLACE
      ?auto_245976 - SURFACE
      ?auto_245979 - TRUCK
      ?auto_245978 - PLACE
      ?auto_245973 - HOIST
      ?auto_245975 - SURFACE
      ?auto_245980 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245974 ?auto_245977 ) ( SURFACE-AT ?auto_245971 ?auto_245977 ) ( CLEAR ?auto_245971 ) ( IS-CRATE ?auto_245972 ) ( not ( = ?auto_245971 ?auto_245972 ) ) ( AVAILABLE ?auto_245974 ) ( ON ?auto_245971 ?auto_245976 ) ( not ( = ?auto_245976 ?auto_245971 ) ) ( not ( = ?auto_245976 ?auto_245972 ) ) ( TRUCK-AT ?auto_245979 ?auto_245978 ) ( not ( = ?auto_245978 ?auto_245977 ) ) ( HOIST-AT ?auto_245973 ?auto_245978 ) ( not ( = ?auto_245974 ?auto_245973 ) ) ( SURFACE-AT ?auto_245972 ?auto_245978 ) ( ON ?auto_245972 ?auto_245975 ) ( CLEAR ?auto_245972 ) ( not ( = ?auto_245971 ?auto_245975 ) ) ( not ( = ?auto_245972 ?auto_245975 ) ) ( not ( = ?auto_245976 ?auto_245975 ) ) ( LIFTING ?auto_245973 ?auto_245980 ) ( IS-CRATE ?auto_245980 ) ( not ( = ?auto_245971 ?auto_245980 ) ) ( not ( = ?auto_245972 ?auto_245980 ) ) ( not ( = ?auto_245976 ?auto_245980 ) ) ( not ( = ?auto_245975 ?auto_245980 ) ) )
    :subtasks
    ( ( !LOAD ?auto_245973 ?auto_245980 ?auto_245979 ?auto_245978 )
      ( MAKE-1CRATE ?auto_245971 ?auto_245972 )
      ( MAKE-1CRATE-VERIFY ?auto_245971 ?auto_245972 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246357 - SURFACE
      ?auto_246358 - SURFACE
      ?auto_246359 - SURFACE
      ?auto_246360 - SURFACE
      ?auto_246361 - SURFACE
      ?auto_246362 - SURFACE
    )
    :vars
    (
      ?auto_246364 - HOIST
      ?auto_246363 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246364 ?auto_246363 ) ( SURFACE-AT ?auto_246361 ?auto_246363 ) ( CLEAR ?auto_246361 ) ( LIFTING ?auto_246364 ?auto_246362 ) ( IS-CRATE ?auto_246362 ) ( not ( = ?auto_246361 ?auto_246362 ) ) ( ON ?auto_246358 ?auto_246357 ) ( ON ?auto_246359 ?auto_246358 ) ( ON ?auto_246360 ?auto_246359 ) ( ON ?auto_246361 ?auto_246360 ) ( not ( = ?auto_246357 ?auto_246358 ) ) ( not ( = ?auto_246357 ?auto_246359 ) ) ( not ( = ?auto_246357 ?auto_246360 ) ) ( not ( = ?auto_246357 ?auto_246361 ) ) ( not ( = ?auto_246357 ?auto_246362 ) ) ( not ( = ?auto_246358 ?auto_246359 ) ) ( not ( = ?auto_246358 ?auto_246360 ) ) ( not ( = ?auto_246358 ?auto_246361 ) ) ( not ( = ?auto_246358 ?auto_246362 ) ) ( not ( = ?auto_246359 ?auto_246360 ) ) ( not ( = ?auto_246359 ?auto_246361 ) ) ( not ( = ?auto_246359 ?auto_246362 ) ) ( not ( = ?auto_246360 ?auto_246361 ) ) ( not ( = ?auto_246360 ?auto_246362 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_246361 ?auto_246362 )
      ( MAKE-5CRATE-VERIFY ?auto_246357 ?auto_246358 ?auto_246359 ?auto_246360 ?auto_246361 ?auto_246362 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246391 - SURFACE
      ?auto_246392 - SURFACE
      ?auto_246393 - SURFACE
      ?auto_246394 - SURFACE
      ?auto_246395 - SURFACE
      ?auto_246396 - SURFACE
    )
    :vars
    (
      ?auto_246397 - HOIST
      ?auto_246399 - PLACE
      ?auto_246398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246397 ?auto_246399 ) ( SURFACE-AT ?auto_246395 ?auto_246399 ) ( CLEAR ?auto_246395 ) ( IS-CRATE ?auto_246396 ) ( not ( = ?auto_246395 ?auto_246396 ) ) ( TRUCK-AT ?auto_246398 ?auto_246399 ) ( AVAILABLE ?auto_246397 ) ( IN ?auto_246396 ?auto_246398 ) ( ON ?auto_246395 ?auto_246394 ) ( not ( = ?auto_246394 ?auto_246395 ) ) ( not ( = ?auto_246394 ?auto_246396 ) ) ( ON ?auto_246392 ?auto_246391 ) ( ON ?auto_246393 ?auto_246392 ) ( ON ?auto_246394 ?auto_246393 ) ( not ( = ?auto_246391 ?auto_246392 ) ) ( not ( = ?auto_246391 ?auto_246393 ) ) ( not ( = ?auto_246391 ?auto_246394 ) ) ( not ( = ?auto_246391 ?auto_246395 ) ) ( not ( = ?auto_246391 ?auto_246396 ) ) ( not ( = ?auto_246392 ?auto_246393 ) ) ( not ( = ?auto_246392 ?auto_246394 ) ) ( not ( = ?auto_246392 ?auto_246395 ) ) ( not ( = ?auto_246392 ?auto_246396 ) ) ( not ( = ?auto_246393 ?auto_246394 ) ) ( not ( = ?auto_246393 ?auto_246395 ) ) ( not ( = ?auto_246393 ?auto_246396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246394 ?auto_246395 ?auto_246396 )
      ( MAKE-5CRATE-VERIFY ?auto_246391 ?auto_246392 ?auto_246393 ?auto_246394 ?auto_246395 ?auto_246396 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246431 - SURFACE
      ?auto_246432 - SURFACE
      ?auto_246433 - SURFACE
      ?auto_246434 - SURFACE
      ?auto_246435 - SURFACE
      ?auto_246436 - SURFACE
    )
    :vars
    (
      ?auto_246437 - HOIST
      ?auto_246438 - PLACE
      ?auto_246439 - TRUCK
      ?auto_246440 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246437 ?auto_246438 ) ( SURFACE-AT ?auto_246435 ?auto_246438 ) ( CLEAR ?auto_246435 ) ( IS-CRATE ?auto_246436 ) ( not ( = ?auto_246435 ?auto_246436 ) ) ( AVAILABLE ?auto_246437 ) ( IN ?auto_246436 ?auto_246439 ) ( ON ?auto_246435 ?auto_246434 ) ( not ( = ?auto_246434 ?auto_246435 ) ) ( not ( = ?auto_246434 ?auto_246436 ) ) ( TRUCK-AT ?auto_246439 ?auto_246440 ) ( not ( = ?auto_246440 ?auto_246438 ) ) ( ON ?auto_246432 ?auto_246431 ) ( ON ?auto_246433 ?auto_246432 ) ( ON ?auto_246434 ?auto_246433 ) ( not ( = ?auto_246431 ?auto_246432 ) ) ( not ( = ?auto_246431 ?auto_246433 ) ) ( not ( = ?auto_246431 ?auto_246434 ) ) ( not ( = ?auto_246431 ?auto_246435 ) ) ( not ( = ?auto_246431 ?auto_246436 ) ) ( not ( = ?auto_246432 ?auto_246433 ) ) ( not ( = ?auto_246432 ?auto_246434 ) ) ( not ( = ?auto_246432 ?auto_246435 ) ) ( not ( = ?auto_246432 ?auto_246436 ) ) ( not ( = ?auto_246433 ?auto_246434 ) ) ( not ( = ?auto_246433 ?auto_246435 ) ) ( not ( = ?auto_246433 ?auto_246436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246434 ?auto_246435 ?auto_246436 )
      ( MAKE-5CRATE-VERIFY ?auto_246431 ?auto_246432 ?auto_246433 ?auto_246434 ?auto_246435 ?auto_246436 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246476 - SURFACE
      ?auto_246477 - SURFACE
      ?auto_246478 - SURFACE
      ?auto_246479 - SURFACE
      ?auto_246480 - SURFACE
      ?auto_246481 - SURFACE
    )
    :vars
    (
      ?auto_246482 - HOIST
      ?auto_246485 - PLACE
      ?auto_246486 - TRUCK
      ?auto_246484 - PLACE
      ?auto_246483 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_246482 ?auto_246485 ) ( SURFACE-AT ?auto_246480 ?auto_246485 ) ( CLEAR ?auto_246480 ) ( IS-CRATE ?auto_246481 ) ( not ( = ?auto_246480 ?auto_246481 ) ) ( AVAILABLE ?auto_246482 ) ( ON ?auto_246480 ?auto_246479 ) ( not ( = ?auto_246479 ?auto_246480 ) ) ( not ( = ?auto_246479 ?auto_246481 ) ) ( TRUCK-AT ?auto_246486 ?auto_246484 ) ( not ( = ?auto_246484 ?auto_246485 ) ) ( HOIST-AT ?auto_246483 ?auto_246484 ) ( LIFTING ?auto_246483 ?auto_246481 ) ( not ( = ?auto_246482 ?auto_246483 ) ) ( ON ?auto_246477 ?auto_246476 ) ( ON ?auto_246478 ?auto_246477 ) ( ON ?auto_246479 ?auto_246478 ) ( not ( = ?auto_246476 ?auto_246477 ) ) ( not ( = ?auto_246476 ?auto_246478 ) ) ( not ( = ?auto_246476 ?auto_246479 ) ) ( not ( = ?auto_246476 ?auto_246480 ) ) ( not ( = ?auto_246476 ?auto_246481 ) ) ( not ( = ?auto_246477 ?auto_246478 ) ) ( not ( = ?auto_246477 ?auto_246479 ) ) ( not ( = ?auto_246477 ?auto_246480 ) ) ( not ( = ?auto_246477 ?auto_246481 ) ) ( not ( = ?auto_246478 ?auto_246479 ) ) ( not ( = ?auto_246478 ?auto_246480 ) ) ( not ( = ?auto_246478 ?auto_246481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246479 ?auto_246480 ?auto_246481 )
      ( MAKE-5CRATE-VERIFY ?auto_246476 ?auto_246477 ?auto_246478 ?auto_246479 ?auto_246480 ?auto_246481 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246526 - SURFACE
      ?auto_246527 - SURFACE
      ?auto_246528 - SURFACE
      ?auto_246529 - SURFACE
      ?auto_246530 - SURFACE
      ?auto_246531 - SURFACE
    )
    :vars
    (
      ?auto_246532 - HOIST
      ?auto_246536 - PLACE
      ?auto_246535 - TRUCK
      ?auto_246534 - PLACE
      ?auto_246533 - HOIST
      ?auto_246537 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246532 ?auto_246536 ) ( SURFACE-AT ?auto_246530 ?auto_246536 ) ( CLEAR ?auto_246530 ) ( IS-CRATE ?auto_246531 ) ( not ( = ?auto_246530 ?auto_246531 ) ) ( AVAILABLE ?auto_246532 ) ( ON ?auto_246530 ?auto_246529 ) ( not ( = ?auto_246529 ?auto_246530 ) ) ( not ( = ?auto_246529 ?auto_246531 ) ) ( TRUCK-AT ?auto_246535 ?auto_246534 ) ( not ( = ?auto_246534 ?auto_246536 ) ) ( HOIST-AT ?auto_246533 ?auto_246534 ) ( not ( = ?auto_246532 ?auto_246533 ) ) ( AVAILABLE ?auto_246533 ) ( SURFACE-AT ?auto_246531 ?auto_246534 ) ( ON ?auto_246531 ?auto_246537 ) ( CLEAR ?auto_246531 ) ( not ( = ?auto_246530 ?auto_246537 ) ) ( not ( = ?auto_246531 ?auto_246537 ) ) ( not ( = ?auto_246529 ?auto_246537 ) ) ( ON ?auto_246527 ?auto_246526 ) ( ON ?auto_246528 ?auto_246527 ) ( ON ?auto_246529 ?auto_246528 ) ( not ( = ?auto_246526 ?auto_246527 ) ) ( not ( = ?auto_246526 ?auto_246528 ) ) ( not ( = ?auto_246526 ?auto_246529 ) ) ( not ( = ?auto_246526 ?auto_246530 ) ) ( not ( = ?auto_246526 ?auto_246531 ) ) ( not ( = ?auto_246526 ?auto_246537 ) ) ( not ( = ?auto_246527 ?auto_246528 ) ) ( not ( = ?auto_246527 ?auto_246529 ) ) ( not ( = ?auto_246527 ?auto_246530 ) ) ( not ( = ?auto_246527 ?auto_246531 ) ) ( not ( = ?auto_246527 ?auto_246537 ) ) ( not ( = ?auto_246528 ?auto_246529 ) ) ( not ( = ?auto_246528 ?auto_246530 ) ) ( not ( = ?auto_246528 ?auto_246531 ) ) ( not ( = ?auto_246528 ?auto_246537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246529 ?auto_246530 ?auto_246531 )
      ( MAKE-5CRATE-VERIFY ?auto_246526 ?auto_246527 ?auto_246528 ?auto_246529 ?auto_246530 ?auto_246531 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246577 - SURFACE
      ?auto_246578 - SURFACE
      ?auto_246579 - SURFACE
      ?auto_246580 - SURFACE
      ?auto_246581 - SURFACE
      ?auto_246582 - SURFACE
    )
    :vars
    (
      ?auto_246588 - HOIST
      ?auto_246584 - PLACE
      ?auto_246587 - PLACE
      ?auto_246585 - HOIST
      ?auto_246586 - SURFACE
      ?auto_246583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246588 ?auto_246584 ) ( SURFACE-AT ?auto_246581 ?auto_246584 ) ( CLEAR ?auto_246581 ) ( IS-CRATE ?auto_246582 ) ( not ( = ?auto_246581 ?auto_246582 ) ) ( AVAILABLE ?auto_246588 ) ( ON ?auto_246581 ?auto_246580 ) ( not ( = ?auto_246580 ?auto_246581 ) ) ( not ( = ?auto_246580 ?auto_246582 ) ) ( not ( = ?auto_246587 ?auto_246584 ) ) ( HOIST-AT ?auto_246585 ?auto_246587 ) ( not ( = ?auto_246588 ?auto_246585 ) ) ( AVAILABLE ?auto_246585 ) ( SURFACE-AT ?auto_246582 ?auto_246587 ) ( ON ?auto_246582 ?auto_246586 ) ( CLEAR ?auto_246582 ) ( not ( = ?auto_246581 ?auto_246586 ) ) ( not ( = ?auto_246582 ?auto_246586 ) ) ( not ( = ?auto_246580 ?auto_246586 ) ) ( TRUCK-AT ?auto_246583 ?auto_246584 ) ( ON ?auto_246578 ?auto_246577 ) ( ON ?auto_246579 ?auto_246578 ) ( ON ?auto_246580 ?auto_246579 ) ( not ( = ?auto_246577 ?auto_246578 ) ) ( not ( = ?auto_246577 ?auto_246579 ) ) ( not ( = ?auto_246577 ?auto_246580 ) ) ( not ( = ?auto_246577 ?auto_246581 ) ) ( not ( = ?auto_246577 ?auto_246582 ) ) ( not ( = ?auto_246577 ?auto_246586 ) ) ( not ( = ?auto_246578 ?auto_246579 ) ) ( not ( = ?auto_246578 ?auto_246580 ) ) ( not ( = ?auto_246578 ?auto_246581 ) ) ( not ( = ?auto_246578 ?auto_246582 ) ) ( not ( = ?auto_246578 ?auto_246586 ) ) ( not ( = ?auto_246579 ?auto_246580 ) ) ( not ( = ?auto_246579 ?auto_246581 ) ) ( not ( = ?auto_246579 ?auto_246582 ) ) ( not ( = ?auto_246579 ?auto_246586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246580 ?auto_246581 ?auto_246582 )
      ( MAKE-5CRATE-VERIFY ?auto_246577 ?auto_246578 ?auto_246579 ?auto_246580 ?auto_246581 ?auto_246582 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246628 - SURFACE
      ?auto_246629 - SURFACE
      ?auto_246630 - SURFACE
      ?auto_246631 - SURFACE
      ?auto_246632 - SURFACE
      ?auto_246633 - SURFACE
    )
    :vars
    (
      ?auto_246635 - HOIST
      ?auto_246637 - PLACE
      ?auto_246634 - PLACE
      ?auto_246639 - HOIST
      ?auto_246638 - SURFACE
      ?auto_246636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246635 ?auto_246637 ) ( IS-CRATE ?auto_246633 ) ( not ( = ?auto_246632 ?auto_246633 ) ) ( not ( = ?auto_246631 ?auto_246632 ) ) ( not ( = ?auto_246631 ?auto_246633 ) ) ( not ( = ?auto_246634 ?auto_246637 ) ) ( HOIST-AT ?auto_246639 ?auto_246634 ) ( not ( = ?auto_246635 ?auto_246639 ) ) ( AVAILABLE ?auto_246639 ) ( SURFACE-AT ?auto_246633 ?auto_246634 ) ( ON ?auto_246633 ?auto_246638 ) ( CLEAR ?auto_246633 ) ( not ( = ?auto_246632 ?auto_246638 ) ) ( not ( = ?auto_246633 ?auto_246638 ) ) ( not ( = ?auto_246631 ?auto_246638 ) ) ( TRUCK-AT ?auto_246636 ?auto_246637 ) ( SURFACE-AT ?auto_246631 ?auto_246637 ) ( CLEAR ?auto_246631 ) ( LIFTING ?auto_246635 ?auto_246632 ) ( IS-CRATE ?auto_246632 ) ( ON ?auto_246629 ?auto_246628 ) ( ON ?auto_246630 ?auto_246629 ) ( ON ?auto_246631 ?auto_246630 ) ( not ( = ?auto_246628 ?auto_246629 ) ) ( not ( = ?auto_246628 ?auto_246630 ) ) ( not ( = ?auto_246628 ?auto_246631 ) ) ( not ( = ?auto_246628 ?auto_246632 ) ) ( not ( = ?auto_246628 ?auto_246633 ) ) ( not ( = ?auto_246628 ?auto_246638 ) ) ( not ( = ?auto_246629 ?auto_246630 ) ) ( not ( = ?auto_246629 ?auto_246631 ) ) ( not ( = ?auto_246629 ?auto_246632 ) ) ( not ( = ?auto_246629 ?auto_246633 ) ) ( not ( = ?auto_246629 ?auto_246638 ) ) ( not ( = ?auto_246630 ?auto_246631 ) ) ( not ( = ?auto_246630 ?auto_246632 ) ) ( not ( = ?auto_246630 ?auto_246633 ) ) ( not ( = ?auto_246630 ?auto_246638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246631 ?auto_246632 ?auto_246633 )
      ( MAKE-5CRATE-VERIFY ?auto_246628 ?auto_246629 ?auto_246630 ?auto_246631 ?auto_246632 ?auto_246633 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246679 - SURFACE
      ?auto_246680 - SURFACE
      ?auto_246681 - SURFACE
      ?auto_246682 - SURFACE
      ?auto_246683 - SURFACE
      ?auto_246684 - SURFACE
    )
    :vars
    (
      ?auto_246687 - HOIST
      ?auto_246689 - PLACE
      ?auto_246688 - PLACE
      ?auto_246690 - HOIST
      ?auto_246685 - SURFACE
      ?auto_246686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246687 ?auto_246689 ) ( IS-CRATE ?auto_246684 ) ( not ( = ?auto_246683 ?auto_246684 ) ) ( not ( = ?auto_246682 ?auto_246683 ) ) ( not ( = ?auto_246682 ?auto_246684 ) ) ( not ( = ?auto_246688 ?auto_246689 ) ) ( HOIST-AT ?auto_246690 ?auto_246688 ) ( not ( = ?auto_246687 ?auto_246690 ) ) ( AVAILABLE ?auto_246690 ) ( SURFACE-AT ?auto_246684 ?auto_246688 ) ( ON ?auto_246684 ?auto_246685 ) ( CLEAR ?auto_246684 ) ( not ( = ?auto_246683 ?auto_246685 ) ) ( not ( = ?auto_246684 ?auto_246685 ) ) ( not ( = ?auto_246682 ?auto_246685 ) ) ( TRUCK-AT ?auto_246686 ?auto_246689 ) ( SURFACE-AT ?auto_246682 ?auto_246689 ) ( CLEAR ?auto_246682 ) ( IS-CRATE ?auto_246683 ) ( AVAILABLE ?auto_246687 ) ( IN ?auto_246683 ?auto_246686 ) ( ON ?auto_246680 ?auto_246679 ) ( ON ?auto_246681 ?auto_246680 ) ( ON ?auto_246682 ?auto_246681 ) ( not ( = ?auto_246679 ?auto_246680 ) ) ( not ( = ?auto_246679 ?auto_246681 ) ) ( not ( = ?auto_246679 ?auto_246682 ) ) ( not ( = ?auto_246679 ?auto_246683 ) ) ( not ( = ?auto_246679 ?auto_246684 ) ) ( not ( = ?auto_246679 ?auto_246685 ) ) ( not ( = ?auto_246680 ?auto_246681 ) ) ( not ( = ?auto_246680 ?auto_246682 ) ) ( not ( = ?auto_246680 ?auto_246683 ) ) ( not ( = ?auto_246680 ?auto_246684 ) ) ( not ( = ?auto_246680 ?auto_246685 ) ) ( not ( = ?auto_246681 ?auto_246682 ) ) ( not ( = ?auto_246681 ?auto_246683 ) ) ( not ( = ?auto_246681 ?auto_246684 ) ) ( not ( = ?auto_246681 ?auto_246685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246682 ?auto_246683 ?auto_246684 )
      ( MAKE-5CRATE-VERIFY ?auto_246679 ?auto_246680 ?auto_246681 ?auto_246682 ?auto_246683 ?auto_246684 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_247359 - SURFACE
      ?auto_247360 - SURFACE
    )
    :vars
    (
      ?auto_247363 - HOIST
      ?auto_247365 - PLACE
      ?auto_247367 - SURFACE
      ?auto_247362 - PLACE
      ?auto_247364 - HOIST
      ?auto_247366 - SURFACE
      ?auto_247361 - TRUCK
      ?auto_247368 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_247363 ?auto_247365 ) ( SURFACE-AT ?auto_247359 ?auto_247365 ) ( CLEAR ?auto_247359 ) ( IS-CRATE ?auto_247360 ) ( not ( = ?auto_247359 ?auto_247360 ) ) ( ON ?auto_247359 ?auto_247367 ) ( not ( = ?auto_247367 ?auto_247359 ) ) ( not ( = ?auto_247367 ?auto_247360 ) ) ( not ( = ?auto_247362 ?auto_247365 ) ) ( HOIST-AT ?auto_247364 ?auto_247362 ) ( not ( = ?auto_247363 ?auto_247364 ) ) ( AVAILABLE ?auto_247364 ) ( SURFACE-AT ?auto_247360 ?auto_247362 ) ( ON ?auto_247360 ?auto_247366 ) ( CLEAR ?auto_247360 ) ( not ( = ?auto_247359 ?auto_247366 ) ) ( not ( = ?auto_247360 ?auto_247366 ) ) ( not ( = ?auto_247367 ?auto_247366 ) ) ( TRUCK-AT ?auto_247361 ?auto_247365 ) ( LIFTING ?auto_247363 ?auto_247368 ) ( IS-CRATE ?auto_247368 ) ( not ( = ?auto_247359 ?auto_247368 ) ) ( not ( = ?auto_247360 ?auto_247368 ) ) ( not ( = ?auto_247367 ?auto_247368 ) ) ( not ( = ?auto_247366 ?auto_247368 ) ) )
    :subtasks
    ( ( !LOAD ?auto_247363 ?auto_247368 ?auto_247361 ?auto_247365 )
      ( MAKE-1CRATE ?auto_247359 ?auto_247360 )
      ( MAKE-1CRATE-VERIFY ?auto_247359 ?auto_247360 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_247885 - SURFACE
      ?auto_247886 - SURFACE
      ?auto_247887 - SURFACE
      ?auto_247888 - SURFACE
      ?auto_247889 - SURFACE
      ?auto_247890 - SURFACE
      ?auto_247891 - SURFACE
    )
    :vars
    (
      ?auto_247892 - HOIST
      ?auto_247893 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_247892 ?auto_247893 ) ( SURFACE-AT ?auto_247890 ?auto_247893 ) ( CLEAR ?auto_247890 ) ( LIFTING ?auto_247892 ?auto_247891 ) ( IS-CRATE ?auto_247891 ) ( not ( = ?auto_247890 ?auto_247891 ) ) ( ON ?auto_247886 ?auto_247885 ) ( ON ?auto_247887 ?auto_247886 ) ( ON ?auto_247888 ?auto_247887 ) ( ON ?auto_247889 ?auto_247888 ) ( ON ?auto_247890 ?auto_247889 ) ( not ( = ?auto_247885 ?auto_247886 ) ) ( not ( = ?auto_247885 ?auto_247887 ) ) ( not ( = ?auto_247885 ?auto_247888 ) ) ( not ( = ?auto_247885 ?auto_247889 ) ) ( not ( = ?auto_247885 ?auto_247890 ) ) ( not ( = ?auto_247885 ?auto_247891 ) ) ( not ( = ?auto_247886 ?auto_247887 ) ) ( not ( = ?auto_247886 ?auto_247888 ) ) ( not ( = ?auto_247886 ?auto_247889 ) ) ( not ( = ?auto_247886 ?auto_247890 ) ) ( not ( = ?auto_247886 ?auto_247891 ) ) ( not ( = ?auto_247887 ?auto_247888 ) ) ( not ( = ?auto_247887 ?auto_247889 ) ) ( not ( = ?auto_247887 ?auto_247890 ) ) ( not ( = ?auto_247887 ?auto_247891 ) ) ( not ( = ?auto_247888 ?auto_247889 ) ) ( not ( = ?auto_247888 ?auto_247890 ) ) ( not ( = ?auto_247888 ?auto_247891 ) ) ( not ( = ?auto_247889 ?auto_247890 ) ) ( not ( = ?auto_247889 ?auto_247891 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_247890 ?auto_247891 )
      ( MAKE-6CRATE-VERIFY ?auto_247885 ?auto_247886 ?auto_247887 ?auto_247888 ?auto_247889 ?auto_247890 ?auto_247891 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_247929 - SURFACE
      ?auto_247930 - SURFACE
      ?auto_247931 - SURFACE
      ?auto_247932 - SURFACE
      ?auto_247933 - SURFACE
      ?auto_247934 - SURFACE
      ?auto_247935 - SURFACE
    )
    :vars
    (
      ?auto_247936 - HOIST
      ?auto_247937 - PLACE
      ?auto_247938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_247936 ?auto_247937 ) ( SURFACE-AT ?auto_247934 ?auto_247937 ) ( CLEAR ?auto_247934 ) ( IS-CRATE ?auto_247935 ) ( not ( = ?auto_247934 ?auto_247935 ) ) ( TRUCK-AT ?auto_247938 ?auto_247937 ) ( AVAILABLE ?auto_247936 ) ( IN ?auto_247935 ?auto_247938 ) ( ON ?auto_247934 ?auto_247933 ) ( not ( = ?auto_247933 ?auto_247934 ) ) ( not ( = ?auto_247933 ?auto_247935 ) ) ( ON ?auto_247930 ?auto_247929 ) ( ON ?auto_247931 ?auto_247930 ) ( ON ?auto_247932 ?auto_247931 ) ( ON ?auto_247933 ?auto_247932 ) ( not ( = ?auto_247929 ?auto_247930 ) ) ( not ( = ?auto_247929 ?auto_247931 ) ) ( not ( = ?auto_247929 ?auto_247932 ) ) ( not ( = ?auto_247929 ?auto_247933 ) ) ( not ( = ?auto_247929 ?auto_247934 ) ) ( not ( = ?auto_247929 ?auto_247935 ) ) ( not ( = ?auto_247930 ?auto_247931 ) ) ( not ( = ?auto_247930 ?auto_247932 ) ) ( not ( = ?auto_247930 ?auto_247933 ) ) ( not ( = ?auto_247930 ?auto_247934 ) ) ( not ( = ?auto_247930 ?auto_247935 ) ) ( not ( = ?auto_247931 ?auto_247932 ) ) ( not ( = ?auto_247931 ?auto_247933 ) ) ( not ( = ?auto_247931 ?auto_247934 ) ) ( not ( = ?auto_247931 ?auto_247935 ) ) ( not ( = ?auto_247932 ?auto_247933 ) ) ( not ( = ?auto_247932 ?auto_247934 ) ) ( not ( = ?auto_247932 ?auto_247935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_247933 ?auto_247934 ?auto_247935 )
      ( MAKE-6CRATE-VERIFY ?auto_247929 ?auto_247930 ?auto_247931 ?auto_247932 ?auto_247933 ?auto_247934 ?auto_247935 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_247980 - SURFACE
      ?auto_247981 - SURFACE
      ?auto_247982 - SURFACE
      ?auto_247983 - SURFACE
      ?auto_247984 - SURFACE
      ?auto_247985 - SURFACE
      ?auto_247986 - SURFACE
    )
    :vars
    (
      ?auto_247987 - HOIST
      ?auto_247989 - PLACE
      ?auto_247988 - TRUCK
      ?auto_247990 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_247987 ?auto_247989 ) ( SURFACE-AT ?auto_247985 ?auto_247989 ) ( CLEAR ?auto_247985 ) ( IS-CRATE ?auto_247986 ) ( not ( = ?auto_247985 ?auto_247986 ) ) ( AVAILABLE ?auto_247987 ) ( IN ?auto_247986 ?auto_247988 ) ( ON ?auto_247985 ?auto_247984 ) ( not ( = ?auto_247984 ?auto_247985 ) ) ( not ( = ?auto_247984 ?auto_247986 ) ) ( TRUCK-AT ?auto_247988 ?auto_247990 ) ( not ( = ?auto_247990 ?auto_247989 ) ) ( ON ?auto_247981 ?auto_247980 ) ( ON ?auto_247982 ?auto_247981 ) ( ON ?auto_247983 ?auto_247982 ) ( ON ?auto_247984 ?auto_247983 ) ( not ( = ?auto_247980 ?auto_247981 ) ) ( not ( = ?auto_247980 ?auto_247982 ) ) ( not ( = ?auto_247980 ?auto_247983 ) ) ( not ( = ?auto_247980 ?auto_247984 ) ) ( not ( = ?auto_247980 ?auto_247985 ) ) ( not ( = ?auto_247980 ?auto_247986 ) ) ( not ( = ?auto_247981 ?auto_247982 ) ) ( not ( = ?auto_247981 ?auto_247983 ) ) ( not ( = ?auto_247981 ?auto_247984 ) ) ( not ( = ?auto_247981 ?auto_247985 ) ) ( not ( = ?auto_247981 ?auto_247986 ) ) ( not ( = ?auto_247982 ?auto_247983 ) ) ( not ( = ?auto_247982 ?auto_247984 ) ) ( not ( = ?auto_247982 ?auto_247985 ) ) ( not ( = ?auto_247982 ?auto_247986 ) ) ( not ( = ?auto_247983 ?auto_247984 ) ) ( not ( = ?auto_247983 ?auto_247985 ) ) ( not ( = ?auto_247983 ?auto_247986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_247984 ?auto_247985 ?auto_247986 )
      ( MAKE-6CRATE-VERIFY ?auto_247980 ?auto_247981 ?auto_247982 ?auto_247983 ?auto_247984 ?auto_247985 ?auto_247986 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248037 - SURFACE
      ?auto_248038 - SURFACE
      ?auto_248039 - SURFACE
      ?auto_248040 - SURFACE
      ?auto_248041 - SURFACE
      ?auto_248042 - SURFACE
      ?auto_248043 - SURFACE
    )
    :vars
    (
      ?auto_248044 - HOIST
      ?auto_248048 - PLACE
      ?auto_248045 - TRUCK
      ?auto_248046 - PLACE
      ?auto_248047 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_248044 ?auto_248048 ) ( SURFACE-AT ?auto_248042 ?auto_248048 ) ( CLEAR ?auto_248042 ) ( IS-CRATE ?auto_248043 ) ( not ( = ?auto_248042 ?auto_248043 ) ) ( AVAILABLE ?auto_248044 ) ( ON ?auto_248042 ?auto_248041 ) ( not ( = ?auto_248041 ?auto_248042 ) ) ( not ( = ?auto_248041 ?auto_248043 ) ) ( TRUCK-AT ?auto_248045 ?auto_248046 ) ( not ( = ?auto_248046 ?auto_248048 ) ) ( HOIST-AT ?auto_248047 ?auto_248046 ) ( LIFTING ?auto_248047 ?auto_248043 ) ( not ( = ?auto_248044 ?auto_248047 ) ) ( ON ?auto_248038 ?auto_248037 ) ( ON ?auto_248039 ?auto_248038 ) ( ON ?auto_248040 ?auto_248039 ) ( ON ?auto_248041 ?auto_248040 ) ( not ( = ?auto_248037 ?auto_248038 ) ) ( not ( = ?auto_248037 ?auto_248039 ) ) ( not ( = ?auto_248037 ?auto_248040 ) ) ( not ( = ?auto_248037 ?auto_248041 ) ) ( not ( = ?auto_248037 ?auto_248042 ) ) ( not ( = ?auto_248037 ?auto_248043 ) ) ( not ( = ?auto_248038 ?auto_248039 ) ) ( not ( = ?auto_248038 ?auto_248040 ) ) ( not ( = ?auto_248038 ?auto_248041 ) ) ( not ( = ?auto_248038 ?auto_248042 ) ) ( not ( = ?auto_248038 ?auto_248043 ) ) ( not ( = ?auto_248039 ?auto_248040 ) ) ( not ( = ?auto_248039 ?auto_248041 ) ) ( not ( = ?auto_248039 ?auto_248042 ) ) ( not ( = ?auto_248039 ?auto_248043 ) ) ( not ( = ?auto_248040 ?auto_248041 ) ) ( not ( = ?auto_248040 ?auto_248042 ) ) ( not ( = ?auto_248040 ?auto_248043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248041 ?auto_248042 ?auto_248043 )
      ( MAKE-6CRATE-VERIFY ?auto_248037 ?auto_248038 ?auto_248039 ?auto_248040 ?auto_248041 ?auto_248042 ?auto_248043 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248100 - SURFACE
      ?auto_248101 - SURFACE
      ?auto_248102 - SURFACE
      ?auto_248103 - SURFACE
      ?auto_248104 - SURFACE
      ?auto_248105 - SURFACE
      ?auto_248106 - SURFACE
    )
    :vars
    (
      ?auto_248110 - HOIST
      ?auto_248108 - PLACE
      ?auto_248112 - TRUCK
      ?auto_248109 - PLACE
      ?auto_248107 - HOIST
      ?auto_248111 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_248110 ?auto_248108 ) ( SURFACE-AT ?auto_248105 ?auto_248108 ) ( CLEAR ?auto_248105 ) ( IS-CRATE ?auto_248106 ) ( not ( = ?auto_248105 ?auto_248106 ) ) ( AVAILABLE ?auto_248110 ) ( ON ?auto_248105 ?auto_248104 ) ( not ( = ?auto_248104 ?auto_248105 ) ) ( not ( = ?auto_248104 ?auto_248106 ) ) ( TRUCK-AT ?auto_248112 ?auto_248109 ) ( not ( = ?auto_248109 ?auto_248108 ) ) ( HOIST-AT ?auto_248107 ?auto_248109 ) ( not ( = ?auto_248110 ?auto_248107 ) ) ( AVAILABLE ?auto_248107 ) ( SURFACE-AT ?auto_248106 ?auto_248109 ) ( ON ?auto_248106 ?auto_248111 ) ( CLEAR ?auto_248106 ) ( not ( = ?auto_248105 ?auto_248111 ) ) ( not ( = ?auto_248106 ?auto_248111 ) ) ( not ( = ?auto_248104 ?auto_248111 ) ) ( ON ?auto_248101 ?auto_248100 ) ( ON ?auto_248102 ?auto_248101 ) ( ON ?auto_248103 ?auto_248102 ) ( ON ?auto_248104 ?auto_248103 ) ( not ( = ?auto_248100 ?auto_248101 ) ) ( not ( = ?auto_248100 ?auto_248102 ) ) ( not ( = ?auto_248100 ?auto_248103 ) ) ( not ( = ?auto_248100 ?auto_248104 ) ) ( not ( = ?auto_248100 ?auto_248105 ) ) ( not ( = ?auto_248100 ?auto_248106 ) ) ( not ( = ?auto_248100 ?auto_248111 ) ) ( not ( = ?auto_248101 ?auto_248102 ) ) ( not ( = ?auto_248101 ?auto_248103 ) ) ( not ( = ?auto_248101 ?auto_248104 ) ) ( not ( = ?auto_248101 ?auto_248105 ) ) ( not ( = ?auto_248101 ?auto_248106 ) ) ( not ( = ?auto_248101 ?auto_248111 ) ) ( not ( = ?auto_248102 ?auto_248103 ) ) ( not ( = ?auto_248102 ?auto_248104 ) ) ( not ( = ?auto_248102 ?auto_248105 ) ) ( not ( = ?auto_248102 ?auto_248106 ) ) ( not ( = ?auto_248102 ?auto_248111 ) ) ( not ( = ?auto_248103 ?auto_248104 ) ) ( not ( = ?auto_248103 ?auto_248105 ) ) ( not ( = ?auto_248103 ?auto_248106 ) ) ( not ( = ?auto_248103 ?auto_248111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248104 ?auto_248105 ?auto_248106 )
      ( MAKE-6CRATE-VERIFY ?auto_248100 ?auto_248101 ?auto_248102 ?auto_248103 ?auto_248104 ?auto_248105 ?auto_248106 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248164 - SURFACE
      ?auto_248165 - SURFACE
      ?auto_248166 - SURFACE
      ?auto_248167 - SURFACE
      ?auto_248168 - SURFACE
      ?auto_248169 - SURFACE
      ?auto_248170 - SURFACE
    )
    :vars
    (
      ?auto_248173 - HOIST
      ?auto_248176 - PLACE
      ?auto_248174 - PLACE
      ?auto_248175 - HOIST
      ?auto_248171 - SURFACE
      ?auto_248172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_248173 ?auto_248176 ) ( SURFACE-AT ?auto_248169 ?auto_248176 ) ( CLEAR ?auto_248169 ) ( IS-CRATE ?auto_248170 ) ( not ( = ?auto_248169 ?auto_248170 ) ) ( AVAILABLE ?auto_248173 ) ( ON ?auto_248169 ?auto_248168 ) ( not ( = ?auto_248168 ?auto_248169 ) ) ( not ( = ?auto_248168 ?auto_248170 ) ) ( not ( = ?auto_248174 ?auto_248176 ) ) ( HOIST-AT ?auto_248175 ?auto_248174 ) ( not ( = ?auto_248173 ?auto_248175 ) ) ( AVAILABLE ?auto_248175 ) ( SURFACE-AT ?auto_248170 ?auto_248174 ) ( ON ?auto_248170 ?auto_248171 ) ( CLEAR ?auto_248170 ) ( not ( = ?auto_248169 ?auto_248171 ) ) ( not ( = ?auto_248170 ?auto_248171 ) ) ( not ( = ?auto_248168 ?auto_248171 ) ) ( TRUCK-AT ?auto_248172 ?auto_248176 ) ( ON ?auto_248165 ?auto_248164 ) ( ON ?auto_248166 ?auto_248165 ) ( ON ?auto_248167 ?auto_248166 ) ( ON ?auto_248168 ?auto_248167 ) ( not ( = ?auto_248164 ?auto_248165 ) ) ( not ( = ?auto_248164 ?auto_248166 ) ) ( not ( = ?auto_248164 ?auto_248167 ) ) ( not ( = ?auto_248164 ?auto_248168 ) ) ( not ( = ?auto_248164 ?auto_248169 ) ) ( not ( = ?auto_248164 ?auto_248170 ) ) ( not ( = ?auto_248164 ?auto_248171 ) ) ( not ( = ?auto_248165 ?auto_248166 ) ) ( not ( = ?auto_248165 ?auto_248167 ) ) ( not ( = ?auto_248165 ?auto_248168 ) ) ( not ( = ?auto_248165 ?auto_248169 ) ) ( not ( = ?auto_248165 ?auto_248170 ) ) ( not ( = ?auto_248165 ?auto_248171 ) ) ( not ( = ?auto_248166 ?auto_248167 ) ) ( not ( = ?auto_248166 ?auto_248168 ) ) ( not ( = ?auto_248166 ?auto_248169 ) ) ( not ( = ?auto_248166 ?auto_248170 ) ) ( not ( = ?auto_248166 ?auto_248171 ) ) ( not ( = ?auto_248167 ?auto_248168 ) ) ( not ( = ?auto_248167 ?auto_248169 ) ) ( not ( = ?auto_248167 ?auto_248170 ) ) ( not ( = ?auto_248167 ?auto_248171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248168 ?auto_248169 ?auto_248170 )
      ( MAKE-6CRATE-VERIFY ?auto_248164 ?auto_248165 ?auto_248166 ?auto_248167 ?auto_248168 ?auto_248169 ?auto_248170 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248228 - SURFACE
      ?auto_248229 - SURFACE
      ?auto_248230 - SURFACE
      ?auto_248231 - SURFACE
      ?auto_248232 - SURFACE
      ?auto_248233 - SURFACE
      ?auto_248234 - SURFACE
    )
    :vars
    (
      ?auto_248238 - HOIST
      ?auto_248237 - PLACE
      ?auto_248236 - PLACE
      ?auto_248235 - HOIST
      ?auto_248240 - SURFACE
      ?auto_248239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_248238 ?auto_248237 ) ( IS-CRATE ?auto_248234 ) ( not ( = ?auto_248233 ?auto_248234 ) ) ( not ( = ?auto_248232 ?auto_248233 ) ) ( not ( = ?auto_248232 ?auto_248234 ) ) ( not ( = ?auto_248236 ?auto_248237 ) ) ( HOIST-AT ?auto_248235 ?auto_248236 ) ( not ( = ?auto_248238 ?auto_248235 ) ) ( AVAILABLE ?auto_248235 ) ( SURFACE-AT ?auto_248234 ?auto_248236 ) ( ON ?auto_248234 ?auto_248240 ) ( CLEAR ?auto_248234 ) ( not ( = ?auto_248233 ?auto_248240 ) ) ( not ( = ?auto_248234 ?auto_248240 ) ) ( not ( = ?auto_248232 ?auto_248240 ) ) ( TRUCK-AT ?auto_248239 ?auto_248237 ) ( SURFACE-AT ?auto_248232 ?auto_248237 ) ( CLEAR ?auto_248232 ) ( LIFTING ?auto_248238 ?auto_248233 ) ( IS-CRATE ?auto_248233 ) ( ON ?auto_248229 ?auto_248228 ) ( ON ?auto_248230 ?auto_248229 ) ( ON ?auto_248231 ?auto_248230 ) ( ON ?auto_248232 ?auto_248231 ) ( not ( = ?auto_248228 ?auto_248229 ) ) ( not ( = ?auto_248228 ?auto_248230 ) ) ( not ( = ?auto_248228 ?auto_248231 ) ) ( not ( = ?auto_248228 ?auto_248232 ) ) ( not ( = ?auto_248228 ?auto_248233 ) ) ( not ( = ?auto_248228 ?auto_248234 ) ) ( not ( = ?auto_248228 ?auto_248240 ) ) ( not ( = ?auto_248229 ?auto_248230 ) ) ( not ( = ?auto_248229 ?auto_248231 ) ) ( not ( = ?auto_248229 ?auto_248232 ) ) ( not ( = ?auto_248229 ?auto_248233 ) ) ( not ( = ?auto_248229 ?auto_248234 ) ) ( not ( = ?auto_248229 ?auto_248240 ) ) ( not ( = ?auto_248230 ?auto_248231 ) ) ( not ( = ?auto_248230 ?auto_248232 ) ) ( not ( = ?auto_248230 ?auto_248233 ) ) ( not ( = ?auto_248230 ?auto_248234 ) ) ( not ( = ?auto_248230 ?auto_248240 ) ) ( not ( = ?auto_248231 ?auto_248232 ) ) ( not ( = ?auto_248231 ?auto_248233 ) ) ( not ( = ?auto_248231 ?auto_248234 ) ) ( not ( = ?auto_248231 ?auto_248240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248232 ?auto_248233 ?auto_248234 )
      ( MAKE-6CRATE-VERIFY ?auto_248228 ?auto_248229 ?auto_248230 ?auto_248231 ?auto_248232 ?auto_248233 ?auto_248234 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248292 - SURFACE
      ?auto_248293 - SURFACE
      ?auto_248294 - SURFACE
      ?auto_248295 - SURFACE
      ?auto_248296 - SURFACE
      ?auto_248297 - SURFACE
      ?auto_248298 - SURFACE
    )
    :vars
    (
      ?auto_248303 - HOIST
      ?auto_248301 - PLACE
      ?auto_248300 - PLACE
      ?auto_248302 - HOIST
      ?auto_248304 - SURFACE
      ?auto_248299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_248303 ?auto_248301 ) ( IS-CRATE ?auto_248298 ) ( not ( = ?auto_248297 ?auto_248298 ) ) ( not ( = ?auto_248296 ?auto_248297 ) ) ( not ( = ?auto_248296 ?auto_248298 ) ) ( not ( = ?auto_248300 ?auto_248301 ) ) ( HOIST-AT ?auto_248302 ?auto_248300 ) ( not ( = ?auto_248303 ?auto_248302 ) ) ( AVAILABLE ?auto_248302 ) ( SURFACE-AT ?auto_248298 ?auto_248300 ) ( ON ?auto_248298 ?auto_248304 ) ( CLEAR ?auto_248298 ) ( not ( = ?auto_248297 ?auto_248304 ) ) ( not ( = ?auto_248298 ?auto_248304 ) ) ( not ( = ?auto_248296 ?auto_248304 ) ) ( TRUCK-AT ?auto_248299 ?auto_248301 ) ( SURFACE-AT ?auto_248296 ?auto_248301 ) ( CLEAR ?auto_248296 ) ( IS-CRATE ?auto_248297 ) ( AVAILABLE ?auto_248303 ) ( IN ?auto_248297 ?auto_248299 ) ( ON ?auto_248293 ?auto_248292 ) ( ON ?auto_248294 ?auto_248293 ) ( ON ?auto_248295 ?auto_248294 ) ( ON ?auto_248296 ?auto_248295 ) ( not ( = ?auto_248292 ?auto_248293 ) ) ( not ( = ?auto_248292 ?auto_248294 ) ) ( not ( = ?auto_248292 ?auto_248295 ) ) ( not ( = ?auto_248292 ?auto_248296 ) ) ( not ( = ?auto_248292 ?auto_248297 ) ) ( not ( = ?auto_248292 ?auto_248298 ) ) ( not ( = ?auto_248292 ?auto_248304 ) ) ( not ( = ?auto_248293 ?auto_248294 ) ) ( not ( = ?auto_248293 ?auto_248295 ) ) ( not ( = ?auto_248293 ?auto_248296 ) ) ( not ( = ?auto_248293 ?auto_248297 ) ) ( not ( = ?auto_248293 ?auto_248298 ) ) ( not ( = ?auto_248293 ?auto_248304 ) ) ( not ( = ?auto_248294 ?auto_248295 ) ) ( not ( = ?auto_248294 ?auto_248296 ) ) ( not ( = ?auto_248294 ?auto_248297 ) ) ( not ( = ?auto_248294 ?auto_248298 ) ) ( not ( = ?auto_248294 ?auto_248304 ) ) ( not ( = ?auto_248295 ?auto_248296 ) ) ( not ( = ?auto_248295 ?auto_248297 ) ) ( not ( = ?auto_248295 ?auto_248298 ) ) ( not ( = ?auto_248295 ?auto_248304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248296 ?auto_248297 ?auto_248298 )
      ( MAKE-6CRATE-VERIFY ?auto_248292 ?auto_248293 ?auto_248294 ?auto_248295 ?auto_248296 ?auto_248297 ?auto_248298 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250248 - SURFACE
      ?auto_250249 - SURFACE
      ?auto_250250 - SURFACE
      ?auto_250251 - SURFACE
      ?auto_250252 - SURFACE
      ?auto_250253 - SURFACE
      ?auto_250254 - SURFACE
      ?auto_250255 - SURFACE
    )
    :vars
    (
      ?auto_250257 - HOIST
      ?auto_250256 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250257 ?auto_250256 ) ( SURFACE-AT ?auto_250254 ?auto_250256 ) ( CLEAR ?auto_250254 ) ( LIFTING ?auto_250257 ?auto_250255 ) ( IS-CRATE ?auto_250255 ) ( not ( = ?auto_250254 ?auto_250255 ) ) ( ON ?auto_250249 ?auto_250248 ) ( ON ?auto_250250 ?auto_250249 ) ( ON ?auto_250251 ?auto_250250 ) ( ON ?auto_250252 ?auto_250251 ) ( ON ?auto_250253 ?auto_250252 ) ( ON ?auto_250254 ?auto_250253 ) ( not ( = ?auto_250248 ?auto_250249 ) ) ( not ( = ?auto_250248 ?auto_250250 ) ) ( not ( = ?auto_250248 ?auto_250251 ) ) ( not ( = ?auto_250248 ?auto_250252 ) ) ( not ( = ?auto_250248 ?auto_250253 ) ) ( not ( = ?auto_250248 ?auto_250254 ) ) ( not ( = ?auto_250248 ?auto_250255 ) ) ( not ( = ?auto_250249 ?auto_250250 ) ) ( not ( = ?auto_250249 ?auto_250251 ) ) ( not ( = ?auto_250249 ?auto_250252 ) ) ( not ( = ?auto_250249 ?auto_250253 ) ) ( not ( = ?auto_250249 ?auto_250254 ) ) ( not ( = ?auto_250249 ?auto_250255 ) ) ( not ( = ?auto_250250 ?auto_250251 ) ) ( not ( = ?auto_250250 ?auto_250252 ) ) ( not ( = ?auto_250250 ?auto_250253 ) ) ( not ( = ?auto_250250 ?auto_250254 ) ) ( not ( = ?auto_250250 ?auto_250255 ) ) ( not ( = ?auto_250251 ?auto_250252 ) ) ( not ( = ?auto_250251 ?auto_250253 ) ) ( not ( = ?auto_250251 ?auto_250254 ) ) ( not ( = ?auto_250251 ?auto_250255 ) ) ( not ( = ?auto_250252 ?auto_250253 ) ) ( not ( = ?auto_250252 ?auto_250254 ) ) ( not ( = ?auto_250252 ?auto_250255 ) ) ( not ( = ?auto_250253 ?auto_250254 ) ) ( not ( = ?auto_250253 ?auto_250255 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_250254 ?auto_250255 )
      ( MAKE-7CRATE-VERIFY ?auto_250248 ?auto_250249 ?auto_250250 ?auto_250251 ?auto_250252 ?auto_250253 ?auto_250254 ?auto_250255 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250303 - SURFACE
      ?auto_250304 - SURFACE
      ?auto_250305 - SURFACE
      ?auto_250306 - SURFACE
      ?auto_250307 - SURFACE
      ?auto_250308 - SURFACE
      ?auto_250309 - SURFACE
      ?auto_250310 - SURFACE
    )
    :vars
    (
      ?auto_250312 - HOIST
      ?auto_250313 - PLACE
      ?auto_250311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250312 ?auto_250313 ) ( SURFACE-AT ?auto_250309 ?auto_250313 ) ( CLEAR ?auto_250309 ) ( IS-CRATE ?auto_250310 ) ( not ( = ?auto_250309 ?auto_250310 ) ) ( TRUCK-AT ?auto_250311 ?auto_250313 ) ( AVAILABLE ?auto_250312 ) ( IN ?auto_250310 ?auto_250311 ) ( ON ?auto_250309 ?auto_250308 ) ( not ( = ?auto_250308 ?auto_250309 ) ) ( not ( = ?auto_250308 ?auto_250310 ) ) ( ON ?auto_250304 ?auto_250303 ) ( ON ?auto_250305 ?auto_250304 ) ( ON ?auto_250306 ?auto_250305 ) ( ON ?auto_250307 ?auto_250306 ) ( ON ?auto_250308 ?auto_250307 ) ( not ( = ?auto_250303 ?auto_250304 ) ) ( not ( = ?auto_250303 ?auto_250305 ) ) ( not ( = ?auto_250303 ?auto_250306 ) ) ( not ( = ?auto_250303 ?auto_250307 ) ) ( not ( = ?auto_250303 ?auto_250308 ) ) ( not ( = ?auto_250303 ?auto_250309 ) ) ( not ( = ?auto_250303 ?auto_250310 ) ) ( not ( = ?auto_250304 ?auto_250305 ) ) ( not ( = ?auto_250304 ?auto_250306 ) ) ( not ( = ?auto_250304 ?auto_250307 ) ) ( not ( = ?auto_250304 ?auto_250308 ) ) ( not ( = ?auto_250304 ?auto_250309 ) ) ( not ( = ?auto_250304 ?auto_250310 ) ) ( not ( = ?auto_250305 ?auto_250306 ) ) ( not ( = ?auto_250305 ?auto_250307 ) ) ( not ( = ?auto_250305 ?auto_250308 ) ) ( not ( = ?auto_250305 ?auto_250309 ) ) ( not ( = ?auto_250305 ?auto_250310 ) ) ( not ( = ?auto_250306 ?auto_250307 ) ) ( not ( = ?auto_250306 ?auto_250308 ) ) ( not ( = ?auto_250306 ?auto_250309 ) ) ( not ( = ?auto_250306 ?auto_250310 ) ) ( not ( = ?auto_250307 ?auto_250308 ) ) ( not ( = ?auto_250307 ?auto_250309 ) ) ( not ( = ?auto_250307 ?auto_250310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250308 ?auto_250309 ?auto_250310 )
      ( MAKE-7CRATE-VERIFY ?auto_250303 ?auto_250304 ?auto_250305 ?auto_250306 ?auto_250307 ?auto_250308 ?auto_250309 ?auto_250310 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250366 - SURFACE
      ?auto_250367 - SURFACE
      ?auto_250368 - SURFACE
      ?auto_250369 - SURFACE
      ?auto_250370 - SURFACE
      ?auto_250371 - SURFACE
      ?auto_250372 - SURFACE
      ?auto_250373 - SURFACE
    )
    :vars
    (
      ?auto_250377 - HOIST
      ?auto_250374 - PLACE
      ?auto_250375 - TRUCK
      ?auto_250376 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250377 ?auto_250374 ) ( SURFACE-AT ?auto_250372 ?auto_250374 ) ( CLEAR ?auto_250372 ) ( IS-CRATE ?auto_250373 ) ( not ( = ?auto_250372 ?auto_250373 ) ) ( AVAILABLE ?auto_250377 ) ( IN ?auto_250373 ?auto_250375 ) ( ON ?auto_250372 ?auto_250371 ) ( not ( = ?auto_250371 ?auto_250372 ) ) ( not ( = ?auto_250371 ?auto_250373 ) ) ( TRUCK-AT ?auto_250375 ?auto_250376 ) ( not ( = ?auto_250376 ?auto_250374 ) ) ( ON ?auto_250367 ?auto_250366 ) ( ON ?auto_250368 ?auto_250367 ) ( ON ?auto_250369 ?auto_250368 ) ( ON ?auto_250370 ?auto_250369 ) ( ON ?auto_250371 ?auto_250370 ) ( not ( = ?auto_250366 ?auto_250367 ) ) ( not ( = ?auto_250366 ?auto_250368 ) ) ( not ( = ?auto_250366 ?auto_250369 ) ) ( not ( = ?auto_250366 ?auto_250370 ) ) ( not ( = ?auto_250366 ?auto_250371 ) ) ( not ( = ?auto_250366 ?auto_250372 ) ) ( not ( = ?auto_250366 ?auto_250373 ) ) ( not ( = ?auto_250367 ?auto_250368 ) ) ( not ( = ?auto_250367 ?auto_250369 ) ) ( not ( = ?auto_250367 ?auto_250370 ) ) ( not ( = ?auto_250367 ?auto_250371 ) ) ( not ( = ?auto_250367 ?auto_250372 ) ) ( not ( = ?auto_250367 ?auto_250373 ) ) ( not ( = ?auto_250368 ?auto_250369 ) ) ( not ( = ?auto_250368 ?auto_250370 ) ) ( not ( = ?auto_250368 ?auto_250371 ) ) ( not ( = ?auto_250368 ?auto_250372 ) ) ( not ( = ?auto_250368 ?auto_250373 ) ) ( not ( = ?auto_250369 ?auto_250370 ) ) ( not ( = ?auto_250369 ?auto_250371 ) ) ( not ( = ?auto_250369 ?auto_250372 ) ) ( not ( = ?auto_250369 ?auto_250373 ) ) ( not ( = ?auto_250370 ?auto_250371 ) ) ( not ( = ?auto_250370 ?auto_250372 ) ) ( not ( = ?auto_250370 ?auto_250373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250371 ?auto_250372 ?auto_250373 )
      ( MAKE-7CRATE-VERIFY ?auto_250366 ?auto_250367 ?auto_250368 ?auto_250369 ?auto_250370 ?auto_250371 ?auto_250372 ?auto_250373 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250436 - SURFACE
      ?auto_250437 - SURFACE
      ?auto_250438 - SURFACE
      ?auto_250439 - SURFACE
      ?auto_250440 - SURFACE
      ?auto_250441 - SURFACE
      ?auto_250442 - SURFACE
      ?auto_250443 - SURFACE
    )
    :vars
    (
      ?auto_250448 - HOIST
      ?auto_250446 - PLACE
      ?auto_250445 - TRUCK
      ?auto_250447 - PLACE
      ?auto_250444 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_250448 ?auto_250446 ) ( SURFACE-AT ?auto_250442 ?auto_250446 ) ( CLEAR ?auto_250442 ) ( IS-CRATE ?auto_250443 ) ( not ( = ?auto_250442 ?auto_250443 ) ) ( AVAILABLE ?auto_250448 ) ( ON ?auto_250442 ?auto_250441 ) ( not ( = ?auto_250441 ?auto_250442 ) ) ( not ( = ?auto_250441 ?auto_250443 ) ) ( TRUCK-AT ?auto_250445 ?auto_250447 ) ( not ( = ?auto_250447 ?auto_250446 ) ) ( HOIST-AT ?auto_250444 ?auto_250447 ) ( LIFTING ?auto_250444 ?auto_250443 ) ( not ( = ?auto_250448 ?auto_250444 ) ) ( ON ?auto_250437 ?auto_250436 ) ( ON ?auto_250438 ?auto_250437 ) ( ON ?auto_250439 ?auto_250438 ) ( ON ?auto_250440 ?auto_250439 ) ( ON ?auto_250441 ?auto_250440 ) ( not ( = ?auto_250436 ?auto_250437 ) ) ( not ( = ?auto_250436 ?auto_250438 ) ) ( not ( = ?auto_250436 ?auto_250439 ) ) ( not ( = ?auto_250436 ?auto_250440 ) ) ( not ( = ?auto_250436 ?auto_250441 ) ) ( not ( = ?auto_250436 ?auto_250442 ) ) ( not ( = ?auto_250436 ?auto_250443 ) ) ( not ( = ?auto_250437 ?auto_250438 ) ) ( not ( = ?auto_250437 ?auto_250439 ) ) ( not ( = ?auto_250437 ?auto_250440 ) ) ( not ( = ?auto_250437 ?auto_250441 ) ) ( not ( = ?auto_250437 ?auto_250442 ) ) ( not ( = ?auto_250437 ?auto_250443 ) ) ( not ( = ?auto_250438 ?auto_250439 ) ) ( not ( = ?auto_250438 ?auto_250440 ) ) ( not ( = ?auto_250438 ?auto_250441 ) ) ( not ( = ?auto_250438 ?auto_250442 ) ) ( not ( = ?auto_250438 ?auto_250443 ) ) ( not ( = ?auto_250439 ?auto_250440 ) ) ( not ( = ?auto_250439 ?auto_250441 ) ) ( not ( = ?auto_250439 ?auto_250442 ) ) ( not ( = ?auto_250439 ?auto_250443 ) ) ( not ( = ?auto_250440 ?auto_250441 ) ) ( not ( = ?auto_250440 ?auto_250442 ) ) ( not ( = ?auto_250440 ?auto_250443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250441 ?auto_250442 ?auto_250443 )
      ( MAKE-7CRATE-VERIFY ?auto_250436 ?auto_250437 ?auto_250438 ?auto_250439 ?auto_250440 ?auto_250441 ?auto_250442 ?auto_250443 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250513 - SURFACE
      ?auto_250514 - SURFACE
      ?auto_250515 - SURFACE
      ?auto_250516 - SURFACE
      ?auto_250517 - SURFACE
      ?auto_250518 - SURFACE
      ?auto_250519 - SURFACE
      ?auto_250520 - SURFACE
    )
    :vars
    (
      ?auto_250525 - HOIST
      ?auto_250523 - PLACE
      ?auto_250521 - TRUCK
      ?auto_250524 - PLACE
      ?auto_250526 - HOIST
      ?auto_250522 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250525 ?auto_250523 ) ( SURFACE-AT ?auto_250519 ?auto_250523 ) ( CLEAR ?auto_250519 ) ( IS-CRATE ?auto_250520 ) ( not ( = ?auto_250519 ?auto_250520 ) ) ( AVAILABLE ?auto_250525 ) ( ON ?auto_250519 ?auto_250518 ) ( not ( = ?auto_250518 ?auto_250519 ) ) ( not ( = ?auto_250518 ?auto_250520 ) ) ( TRUCK-AT ?auto_250521 ?auto_250524 ) ( not ( = ?auto_250524 ?auto_250523 ) ) ( HOIST-AT ?auto_250526 ?auto_250524 ) ( not ( = ?auto_250525 ?auto_250526 ) ) ( AVAILABLE ?auto_250526 ) ( SURFACE-AT ?auto_250520 ?auto_250524 ) ( ON ?auto_250520 ?auto_250522 ) ( CLEAR ?auto_250520 ) ( not ( = ?auto_250519 ?auto_250522 ) ) ( not ( = ?auto_250520 ?auto_250522 ) ) ( not ( = ?auto_250518 ?auto_250522 ) ) ( ON ?auto_250514 ?auto_250513 ) ( ON ?auto_250515 ?auto_250514 ) ( ON ?auto_250516 ?auto_250515 ) ( ON ?auto_250517 ?auto_250516 ) ( ON ?auto_250518 ?auto_250517 ) ( not ( = ?auto_250513 ?auto_250514 ) ) ( not ( = ?auto_250513 ?auto_250515 ) ) ( not ( = ?auto_250513 ?auto_250516 ) ) ( not ( = ?auto_250513 ?auto_250517 ) ) ( not ( = ?auto_250513 ?auto_250518 ) ) ( not ( = ?auto_250513 ?auto_250519 ) ) ( not ( = ?auto_250513 ?auto_250520 ) ) ( not ( = ?auto_250513 ?auto_250522 ) ) ( not ( = ?auto_250514 ?auto_250515 ) ) ( not ( = ?auto_250514 ?auto_250516 ) ) ( not ( = ?auto_250514 ?auto_250517 ) ) ( not ( = ?auto_250514 ?auto_250518 ) ) ( not ( = ?auto_250514 ?auto_250519 ) ) ( not ( = ?auto_250514 ?auto_250520 ) ) ( not ( = ?auto_250514 ?auto_250522 ) ) ( not ( = ?auto_250515 ?auto_250516 ) ) ( not ( = ?auto_250515 ?auto_250517 ) ) ( not ( = ?auto_250515 ?auto_250518 ) ) ( not ( = ?auto_250515 ?auto_250519 ) ) ( not ( = ?auto_250515 ?auto_250520 ) ) ( not ( = ?auto_250515 ?auto_250522 ) ) ( not ( = ?auto_250516 ?auto_250517 ) ) ( not ( = ?auto_250516 ?auto_250518 ) ) ( not ( = ?auto_250516 ?auto_250519 ) ) ( not ( = ?auto_250516 ?auto_250520 ) ) ( not ( = ?auto_250516 ?auto_250522 ) ) ( not ( = ?auto_250517 ?auto_250518 ) ) ( not ( = ?auto_250517 ?auto_250519 ) ) ( not ( = ?auto_250517 ?auto_250520 ) ) ( not ( = ?auto_250517 ?auto_250522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250518 ?auto_250519 ?auto_250520 )
      ( MAKE-7CRATE-VERIFY ?auto_250513 ?auto_250514 ?auto_250515 ?auto_250516 ?auto_250517 ?auto_250518 ?auto_250519 ?auto_250520 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250591 - SURFACE
      ?auto_250592 - SURFACE
      ?auto_250593 - SURFACE
      ?auto_250594 - SURFACE
      ?auto_250595 - SURFACE
      ?auto_250596 - SURFACE
      ?auto_250597 - SURFACE
      ?auto_250598 - SURFACE
    )
    :vars
    (
      ?auto_250600 - HOIST
      ?auto_250601 - PLACE
      ?auto_250602 - PLACE
      ?auto_250604 - HOIST
      ?auto_250603 - SURFACE
      ?auto_250599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250600 ?auto_250601 ) ( SURFACE-AT ?auto_250597 ?auto_250601 ) ( CLEAR ?auto_250597 ) ( IS-CRATE ?auto_250598 ) ( not ( = ?auto_250597 ?auto_250598 ) ) ( AVAILABLE ?auto_250600 ) ( ON ?auto_250597 ?auto_250596 ) ( not ( = ?auto_250596 ?auto_250597 ) ) ( not ( = ?auto_250596 ?auto_250598 ) ) ( not ( = ?auto_250602 ?auto_250601 ) ) ( HOIST-AT ?auto_250604 ?auto_250602 ) ( not ( = ?auto_250600 ?auto_250604 ) ) ( AVAILABLE ?auto_250604 ) ( SURFACE-AT ?auto_250598 ?auto_250602 ) ( ON ?auto_250598 ?auto_250603 ) ( CLEAR ?auto_250598 ) ( not ( = ?auto_250597 ?auto_250603 ) ) ( not ( = ?auto_250598 ?auto_250603 ) ) ( not ( = ?auto_250596 ?auto_250603 ) ) ( TRUCK-AT ?auto_250599 ?auto_250601 ) ( ON ?auto_250592 ?auto_250591 ) ( ON ?auto_250593 ?auto_250592 ) ( ON ?auto_250594 ?auto_250593 ) ( ON ?auto_250595 ?auto_250594 ) ( ON ?auto_250596 ?auto_250595 ) ( not ( = ?auto_250591 ?auto_250592 ) ) ( not ( = ?auto_250591 ?auto_250593 ) ) ( not ( = ?auto_250591 ?auto_250594 ) ) ( not ( = ?auto_250591 ?auto_250595 ) ) ( not ( = ?auto_250591 ?auto_250596 ) ) ( not ( = ?auto_250591 ?auto_250597 ) ) ( not ( = ?auto_250591 ?auto_250598 ) ) ( not ( = ?auto_250591 ?auto_250603 ) ) ( not ( = ?auto_250592 ?auto_250593 ) ) ( not ( = ?auto_250592 ?auto_250594 ) ) ( not ( = ?auto_250592 ?auto_250595 ) ) ( not ( = ?auto_250592 ?auto_250596 ) ) ( not ( = ?auto_250592 ?auto_250597 ) ) ( not ( = ?auto_250592 ?auto_250598 ) ) ( not ( = ?auto_250592 ?auto_250603 ) ) ( not ( = ?auto_250593 ?auto_250594 ) ) ( not ( = ?auto_250593 ?auto_250595 ) ) ( not ( = ?auto_250593 ?auto_250596 ) ) ( not ( = ?auto_250593 ?auto_250597 ) ) ( not ( = ?auto_250593 ?auto_250598 ) ) ( not ( = ?auto_250593 ?auto_250603 ) ) ( not ( = ?auto_250594 ?auto_250595 ) ) ( not ( = ?auto_250594 ?auto_250596 ) ) ( not ( = ?auto_250594 ?auto_250597 ) ) ( not ( = ?auto_250594 ?auto_250598 ) ) ( not ( = ?auto_250594 ?auto_250603 ) ) ( not ( = ?auto_250595 ?auto_250596 ) ) ( not ( = ?auto_250595 ?auto_250597 ) ) ( not ( = ?auto_250595 ?auto_250598 ) ) ( not ( = ?auto_250595 ?auto_250603 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250596 ?auto_250597 ?auto_250598 )
      ( MAKE-7CRATE-VERIFY ?auto_250591 ?auto_250592 ?auto_250593 ?auto_250594 ?auto_250595 ?auto_250596 ?auto_250597 ?auto_250598 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250669 - SURFACE
      ?auto_250670 - SURFACE
      ?auto_250671 - SURFACE
      ?auto_250672 - SURFACE
      ?auto_250673 - SURFACE
      ?auto_250674 - SURFACE
      ?auto_250675 - SURFACE
      ?auto_250676 - SURFACE
    )
    :vars
    (
      ?auto_250678 - HOIST
      ?auto_250681 - PLACE
      ?auto_250680 - PLACE
      ?auto_250679 - HOIST
      ?auto_250682 - SURFACE
      ?auto_250677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250678 ?auto_250681 ) ( IS-CRATE ?auto_250676 ) ( not ( = ?auto_250675 ?auto_250676 ) ) ( not ( = ?auto_250674 ?auto_250675 ) ) ( not ( = ?auto_250674 ?auto_250676 ) ) ( not ( = ?auto_250680 ?auto_250681 ) ) ( HOIST-AT ?auto_250679 ?auto_250680 ) ( not ( = ?auto_250678 ?auto_250679 ) ) ( AVAILABLE ?auto_250679 ) ( SURFACE-AT ?auto_250676 ?auto_250680 ) ( ON ?auto_250676 ?auto_250682 ) ( CLEAR ?auto_250676 ) ( not ( = ?auto_250675 ?auto_250682 ) ) ( not ( = ?auto_250676 ?auto_250682 ) ) ( not ( = ?auto_250674 ?auto_250682 ) ) ( TRUCK-AT ?auto_250677 ?auto_250681 ) ( SURFACE-AT ?auto_250674 ?auto_250681 ) ( CLEAR ?auto_250674 ) ( LIFTING ?auto_250678 ?auto_250675 ) ( IS-CRATE ?auto_250675 ) ( ON ?auto_250670 ?auto_250669 ) ( ON ?auto_250671 ?auto_250670 ) ( ON ?auto_250672 ?auto_250671 ) ( ON ?auto_250673 ?auto_250672 ) ( ON ?auto_250674 ?auto_250673 ) ( not ( = ?auto_250669 ?auto_250670 ) ) ( not ( = ?auto_250669 ?auto_250671 ) ) ( not ( = ?auto_250669 ?auto_250672 ) ) ( not ( = ?auto_250669 ?auto_250673 ) ) ( not ( = ?auto_250669 ?auto_250674 ) ) ( not ( = ?auto_250669 ?auto_250675 ) ) ( not ( = ?auto_250669 ?auto_250676 ) ) ( not ( = ?auto_250669 ?auto_250682 ) ) ( not ( = ?auto_250670 ?auto_250671 ) ) ( not ( = ?auto_250670 ?auto_250672 ) ) ( not ( = ?auto_250670 ?auto_250673 ) ) ( not ( = ?auto_250670 ?auto_250674 ) ) ( not ( = ?auto_250670 ?auto_250675 ) ) ( not ( = ?auto_250670 ?auto_250676 ) ) ( not ( = ?auto_250670 ?auto_250682 ) ) ( not ( = ?auto_250671 ?auto_250672 ) ) ( not ( = ?auto_250671 ?auto_250673 ) ) ( not ( = ?auto_250671 ?auto_250674 ) ) ( not ( = ?auto_250671 ?auto_250675 ) ) ( not ( = ?auto_250671 ?auto_250676 ) ) ( not ( = ?auto_250671 ?auto_250682 ) ) ( not ( = ?auto_250672 ?auto_250673 ) ) ( not ( = ?auto_250672 ?auto_250674 ) ) ( not ( = ?auto_250672 ?auto_250675 ) ) ( not ( = ?auto_250672 ?auto_250676 ) ) ( not ( = ?auto_250672 ?auto_250682 ) ) ( not ( = ?auto_250673 ?auto_250674 ) ) ( not ( = ?auto_250673 ?auto_250675 ) ) ( not ( = ?auto_250673 ?auto_250676 ) ) ( not ( = ?auto_250673 ?auto_250682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250674 ?auto_250675 ?auto_250676 )
      ( MAKE-7CRATE-VERIFY ?auto_250669 ?auto_250670 ?auto_250671 ?auto_250672 ?auto_250673 ?auto_250674 ?auto_250675 ?auto_250676 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250747 - SURFACE
      ?auto_250748 - SURFACE
      ?auto_250749 - SURFACE
      ?auto_250750 - SURFACE
      ?auto_250751 - SURFACE
      ?auto_250752 - SURFACE
      ?auto_250753 - SURFACE
      ?auto_250754 - SURFACE
    )
    :vars
    (
      ?auto_250756 - HOIST
      ?auto_250757 - PLACE
      ?auto_250755 - PLACE
      ?auto_250760 - HOIST
      ?auto_250758 - SURFACE
      ?auto_250759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250756 ?auto_250757 ) ( IS-CRATE ?auto_250754 ) ( not ( = ?auto_250753 ?auto_250754 ) ) ( not ( = ?auto_250752 ?auto_250753 ) ) ( not ( = ?auto_250752 ?auto_250754 ) ) ( not ( = ?auto_250755 ?auto_250757 ) ) ( HOIST-AT ?auto_250760 ?auto_250755 ) ( not ( = ?auto_250756 ?auto_250760 ) ) ( AVAILABLE ?auto_250760 ) ( SURFACE-AT ?auto_250754 ?auto_250755 ) ( ON ?auto_250754 ?auto_250758 ) ( CLEAR ?auto_250754 ) ( not ( = ?auto_250753 ?auto_250758 ) ) ( not ( = ?auto_250754 ?auto_250758 ) ) ( not ( = ?auto_250752 ?auto_250758 ) ) ( TRUCK-AT ?auto_250759 ?auto_250757 ) ( SURFACE-AT ?auto_250752 ?auto_250757 ) ( CLEAR ?auto_250752 ) ( IS-CRATE ?auto_250753 ) ( AVAILABLE ?auto_250756 ) ( IN ?auto_250753 ?auto_250759 ) ( ON ?auto_250748 ?auto_250747 ) ( ON ?auto_250749 ?auto_250748 ) ( ON ?auto_250750 ?auto_250749 ) ( ON ?auto_250751 ?auto_250750 ) ( ON ?auto_250752 ?auto_250751 ) ( not ( = ?auto_250747 ?auto_250748 ) ) ( not ( = ?auto_250747 ?auto_250749 ) ) ( not ( = ?auto_250747 ?auto_250750 ) ) ( not ( = ?auto_250747 ?auto_250751 ) ) ( not ( = ?auto_250747 ?auto_250752 ) ) ( not ( = ?auto_250747 ?auto_250753 ) ) ( not ( = ?auto_250747 ?auto_250754 ) ) ( not ( = ?auto_250747 ?auto_250758 ) ) ( not ( = ?auto_250748 ?auto_250749 ) ) ( not ( = ?auto_250748 ?auto_250750 ) ) ( not ( = ?auto_250748 ?auto_250751 ) ) ( not ( = ?auto_250748 ?auto_250752 ) ) ( not ( = ?auto_250748 ?auto_250753 ) ) ( not ( = ?auto_250748 ?auto_250754 ) ) ( not ( = ?auto_250748 ?auto_250758 ) ) ( not ( = ?auto_250749 ?auto_250750 ) ) ( not ( = ?auto_250749 ?auto_250751 ) ) ( not ( = ?auto_250749 ?auto_250752 ) ) ( not ( = ?auto_250749 ?auto_250753 ) ) ( not ( = ?auto_250749 ?auto_250754 ) ) ( not ( = ?auto_250749 ?auto_250758 ) ) ( not ( = ?auto_250750 ?auto_250751 ) ) ( not ( = ?auto_250750 ?auto_250752 ) ) ( not ( = ?auto_250750 ?auto_250753 ) ) ( not ( = ?auto_250750 ?auto_250754 ) ) ( not ( = ?auto_250750 ?auto_250758 ) ) ( not ( = ?auto_250751 ?auto_250752 ) ) ( not ( = ?auto_250751 ?auto_250753 ) ) ( not ( = ?auto_250751 ?auto_250754 ) ) ( not ( = ?auto_250751 ?auto_250758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250752 ?auto_250753 ?auto_250754 )
      ( MAKE-7CRATE-VERIFY ?auto_250747 ?auto_250748 ?auto_250749 ?auto_250750 ?auto_250751 ?auto_250752 ?auto_250753 ?auto_250754 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_250761 - SURFACE
      ?auto_250762 - SURFACE
    )
    :vars
    (
      ?auto_250764 - HOIST
      ?auto_250765 - PLACE
      ?auto_250767 - SURFACE
      ?auto_250763 - PLACE
      ?auto_250769 - HOIST
      ?auto_250766 - SURFACE
      ?auto_250768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250764 ?auto_250765 ) ( IS-CRATE ?auto_250762 ) ( not ( = ?auto_250761 ?auto_250762 ) ) ( not ( = ?auto_250767 ?auto_250761 ) ) ( not ( = ?auto_250767 ?auto_250762 ) ) ( not ( = ?auto_250763 ?auto_250765 ) ) ( HOIST-AT ?auto_250769 ?auto_250763 ) ( not ( = ?auto_250764 ?auto_250769 ) ) ( AVAILABLE ?auto_250769 ) ( SURFACE-AT ?auto_250762 ?auto_250763 ) ( ON ?auto_250762 ?auto_250766 ) ( CLEAR ?auto_250762 ) ( not ( = ?auto_250761 ?auto_250766 ) ) ( not ( = ?auto_250762 ?auto_250766 ) ) ( not ( = ?auto_250767 ?auto_250766 ) ) ( SURFACE-AT ?auto_250767 ?auto_250765 ) ( CLEAR ?auto_250767 ) ( IS-CRATE ?auto_250761 ) ( AVAILABLE ?auto_250764 ) ( IN ?auto_250761 ?auto_250768 ) ( TRUCK-AT ?auto_250768 ?auto_250763 ) )
    :subtasks
    ( ( !DRIVE ?auto_250768 ?auto_250763 ?auto_250765 )
      ( MAKE-2CRATE ?auto_250767 ?auto_250761 ?auto_250762 )
      ( MAKE-1CRATE-VERIFY ?auto_250761 ?auto_250762 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_250770 - SURFACE
      ?auto_250771 - SURFACE
      ?auto_250772 - SURFACE
    )
    :vars
    (
      ?auto_250776 - HOIST
      ?auto_250778 - PLACE
      ?auto_250774 - PLACE
      ?auto_250775 - HOIST
      ?auto_250773 - SURFACE
      ?auto_250777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250776 ?auto_250778 ) ( IS-CRATE ?auto_250772 ) ( not ( = ?auto_250771 ?auto_250772 ) ) ( not ( = ?auto_250770 ?auto_250771 ) ) ( not ( = ?auto_250770 ?auto_250772 ) ) ( not ( = ?auto_250774 ?auto_250778 ) ) ( HOIST-AT ?auto_250775 ?auto_250774 ) ( not ( = ?auto_250776 ?auto_250775 ) ) ( AVAILABLE ?auto_250775 ) ( SURFACE-AT ?auto_250772 ?auto_250774 ) ( ON ?auto_250772 ?auto_250773 ) ( CLEAR ?auto_250772 ) ( not ( = ?auto_250771 ?auto_250773 ) ) ( not ( = ?auto_250772 ?auto_250773 ) ) ( not ( = ?auto_250770 ?auto_250773 ) ) ( SURFACE-AT ?auto_250770 ?auto_250778 ) ( CLEAR ?auto_250770 ) ( IS-CRATE ?auto_250771 ) ( AVAILABLE ?auto_250776 ) ( IN ?auto_250771 ?auto_250777 ) ( TRUCK-AT ?auto_250777 ?auto_250774 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_250771 ?auto_250772 )
      ( MAKE-2CRATE-VERIFY ?auto_250770 ?auto_250771 ?auto_250772 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_250779 - SURFACE
      ?auto_250780 - SURFACE
      ?auto_250781 - SURFACE
      ?auto_250782 - SURFACE
    )
    :vars
    (
      ?auto_250788 - HOIST
      ?auto_250784 - PLACE
      ?auto_250783 - PLACE
      ?auto_250787 - HOIST
      ?auto_250785 - SURFACE
      ?auto_250786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250788 ?auto_250784 ) ( IS-CRATE ?auto_250782 ) ( not ( = ?auto_250781 ?auto_250782 ) ) ( not ( = ?auto_250780 ?auto_250781 ) ) ( not ( = ?auto_250780 ?auto_250782 ) ) ( not ( = ?auto_250783 ?auto_250784 ) ) ( HOIST-AT ?auto_250787 ?auto_250783 ) ( not ( = ?auto_250788 ?auto_250787 ) ) ( AVAILABLE ?auto_250787 ) ( SURFACE-AT ?auto_250782 ?auto_250783 ) ( ON ?auto_250782 ?auto_250785 ) ( CLEAR ?auto_250782 ) ( not ( = ?auto_250781 ?auto_250785 ) ) ( not ( = ?auto_250782 ?auto_250785 ) ) ( not ( = ?auto_250780 ?auto_250785 ) ) ( SURFACE-AT ?auto_250780 ?auto_250784 ) ( CLEAR ?auto_250780 ) ( IS-CRATE ?auto_250781 ) ( AVAILABLE ?auto_250788 ) ( IN ?auto_250781 ?auto_250786 ) ( TRUCK-AT ?auto_250786 ?auto_250783 ) ( ON ?auto_250780 ?auto_250779 ) ( not ( = ?auto_250779 ?auto_250780 ) ) ( not ( = ?auto_250779 ?auto_250781 ) ) ( not ( = ?auto_250779 ?auto_250782 ) ) ( not ( = ?auto_250779 ?auto_250785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250780 ?auto_250781 ?auto_250782 )
      ( MAKE-3CRATE-VERIFY ?auto_250779 ?auto_250780 ?auto_250781 ?auto_250782 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_250789 - SURFACE
      ?auto_250790 - SURFACE
      ?auto_250791 - SURFACE
      ?auto_250792 - SURFACE
      ?auto_250793 - SURFACE
    )
    :vars
    (
      ?auto_250799 - HOIST
      ?auto_250795 - PLACE
      ?auto_250794 - PLACE
      ?auto_250798 - HOIST
      ?auto_250796 - SURFACE
      ?auto_250797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250799 ?auto_250795 ) ( IS-CRATE ?auto_250793 ) ( not ( = ?auto_250792 ?auto_250793 ) ) ( not ( = ?auto_250791 ?auto_250792 ) ) ( not ( = ?auto_250791 ?auto_250793 ) ) ( not ( = ?auto_250794 ?auto_250795 ) ) ( HOIST-AT ?auto_250798 ?auto_250794 ) ( not ( = ?auto_250799 ?auto_250798 ) ) ( AVAILABLE ?auto_250798 ) ( SURFACE-AT ?auto_250793 ?auto_250794 ) ( ON ?auto_250793 ?auto_250796 ) ( CLEAR ?auto_250793 ) ( not ( = ?auto_250792 ?auto_250796 ) ) ( not ( = ?auto_250793 ?auto_250796 ) ) ( not ( = ?auto_250791 ?auto_250796 ) ) ( SURFACE-AT ?auto_250791 ?auto_250795 ) ( CLEAR ?auto_250791 ) ( IS-CRATE ?auto_250792 ) ( AVAILABLE ?auto_250799 ) ( IN ?auto_250792 ?auto_250797 ) ( TRUCK-AT ?auto_250797 ?auto_250794 ) ( ON ?auto_250790 ?auto_250789 ) ( ON ?auto_250791 ?auto_250790 ) ( not ( = ?auto_250789 ?auto_250790 ) ) ( not ( = ?auto_250789 ?auto_250791 ) ) ( not ( = ?auto_250789 ?auto_250792 ) ) ( not ( = ?auto_250789 ?auto_250793 ) ) ( not ( = ?auto_250789 ?auto_250796 ) ) ( not ( = ?auto_250790 ?auto_250791 ) ) ( not ( = ?auto_250790 ?auto_250792 ) ) ( not ( = ?auto_250790 ?auto_250793 ) ) ( not ( = ?auto_250790 ?auto_250796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250791 ?auto_250792 ?auto_250793 )
      ( MAKE-4CRATE-VERIFY ?auto_250789 ?auto_250790 ?auto_250791 ?auto_250792 ?auto_250793 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_250800 - SURFACE
      ?auto_250801 - SURFACE
      ?auto_250802 - SURFACE
      ?auto_250803 - SURFACE
      ?auto_250804 - SURFACE
      ?auto_250805 - SURFACE
    )
    :vars
    (
      ?auto_250811 - HOIST
      ?auto_250807 - PLACE
      ?auto_250806 - PLACE
      ?auto_250810 - HOIST
      ?auto_250808 - SURFACE
      ?auto_250809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250811 ?auto_250807 ) ( IS-CRATE ?auto_250805 ) ( not ( = ?auto_250804 ?auto_250805 ) ) ( not ( = ?auto_250803 ?auto_250804 ) ) ( not ( = ?auto_250803 ?auto_250805 ) ) ( not ( = ?auto_250806 ?auto_250807 ) ) ( HOIST-AT ?auto_250810 ?auto_250806 ) ( not ( = ?auto_250811 ?auto_250810 ) ) ( AVAILABLE ?auto_250810 ) ( SURFACE-AT ?auto_250805 ?auto_250806 ) ( ON ?auto_250805 ?auto_250808 ) ( CLEAR ?auto_250805 ) ( not ( = ?auto_250804 ?auto_250808 ) ) ( not ( = ?auto_250805 ?auto_250808 ) ) ( not ( = ?auto_250803 ?auto_250808 ) ) ( SURFACE-AT ?auto_250803 ?auto_250807 ) ( CLEAR ?auto_250803 ) ( IS-CRATE ?auto_250804 ) ( AVAILABLE ?auto_250811 ) ( IN ?auto_250804 ?auto_250809 ) ( TRUCK-AT ?auto_250809 ?auto_250806 ) ( ON ?auto_250801 ?auto_250800 ) ( ON ?auto_250802 ?auto_250801 ) ( ON ?auto_250803 ?auto_250802 ) ( not ( = ?auto_250800 ?auto_250801 ) ) ( not ( = ?auto_250800 ?auto_250802 ) ) ( not ( = ?auto_250800 ?auto_250803 ) ) ( not ( = ?auto_250800 ?auto_250804 ) ) ( not ( = ?auto_250800 ?auto_250805 ) ) ( not ( = ?auto_250800 ?auto_250808 ) ) ( not ( = ?auto_250801 ?auto_250802 ) ) ( not ( = ?auto_250801 ?auto_250803 ) ) ( not ( = ?auto_250801 ?auto_250804 ) ) ( not ( = ?auto_250801 ?auto_250805 ) ) ( not ( = ?auto_250801 ?auto_250808 ) ) ( not ( = ?auto_250802 ?auto_250803 ) ) ( not ( = ?auto_250802 ?auto_250804 ) ) ( not ( = ?auto_250802 ?auto_250805 ) ) ( not ( = ?auto_250802 ?auto_250808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250803 ?auto_250804 ?auto_250805 )
      ( MAKE-5CRATE-VERIFY ?auto_250800 ?auto_250801 ?auto_250802 ?auto_250803 ?auto_250804 ?auto_250805 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_250812 - SURFACE
      ?auto_250813 - SURFACE
      ?auto_250814 - SURFACE
      ?auto_250815 - SURFACE
      ?auto_250816 - SURFACE
      ?auto_250817 - SURFACE
      ?auto_250818 - SURFACE
    )
    :vars
    (
      ?auto_250824 - HOIST
      ?auto_250820 - PLACE
      ?auto_250819 - PLACE
      ?auto_250823 - HOIST
      ?auto_250821 - SURFACE
      ?auto_250822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250824 ?auto_250820 ) ( IS-CRATE ?auto_250818 ) ( not ( = ?auto_250817 ?auto_250818 ) ) ( not ( = ?auto_250816 ?auto_250817 ) ) ( not ( = ?auto_250816 ?auto_250818 ) ) ( not ( = ?auto_250819 ?auto_250820 ) ) ( HOIST-AT ?auto_250823 ?auto_250819 ) ( not ( = ?auto_250824 ?auto_250823 ) ) ( AVAILABLE ?auto_250823 ) ( SURFACE-AT ?auto_250818 ?auto_250819 ) ( ON ?auto_250818 ?auto_250821 ) ( CLEAR ?auto_250818 ) ( not ( = ?auto_250817 ?auto_250821 ) ) ( not ( = ?auto_250818 ?auto_250821 ) ) ( not ( = ?auto_250816 ?auto_250821 ) ) ( SURFACE-AT ?auto_250816 ?auto_250820 ) ( CLEAR ?auto_250816 ) ( IS-CRATE ?auto_250817 ) ( AVAILABLE ?auto_250824 ) ( IN ?auto_250817 ?auto_250822 ) ( TRUCK-AT ?auto_250822 ?auto_250819 ) ( ON ?auto_250813 ?auto_250812 ) ( ON ?auto_250814 ?auto_250813 ) ( ON ?auto_250815 ?auto_250814 ) ( ON ?auto_250816 ?auto_250815 ) ( not ( = ?auto_250812 ?auto_250813 ) ) ( not ( = ?auto_250812 ?auto_250814 ) ) ( not ( = ?auto_250812 ?auto_250815 ) ) ( not ( = ?auto_250812 ?auto_250816 ) ) ( not ( = ?auto_250812 ?auto_250817 ) ) ( not ( = ?auto_250812 ?auto_250818 ) ) ( not ( = ?auto_250812 ?auto_250821 ) ) ( not ( = ?auto_250813 ?auto_250814 ) ) ( not ( = ?auto_250813 ?auto_250815 ) ) ( not ( = ?auto_250813 ?auto_250816 ) ) ( not ( = ?auto_250813 ?auto_250817 ) ) ( not ( = ?auto_250813 ?auto_250818 ) ) ( not ( = ?auto_250813 ?auto_250821 ) ) ( not ( = ?auto_250814 ?auto_250815 ) ) ( not ( = ?auto_250814 ?auto_250816 ) ) ( not ( = ?auto_250814 ?auto_250817 ) ) ( not ( = ?auto_250814 ?auto_250818 ) ) ( not ( = ?auto_250814 ?auto_250821 ) ) ( not ( = ?auto_250815 ?auto_250816 ) ) ( not ( = ?auto_250815 ?auto_250817 ) ) ( not ( = ?auto_250815 ?auto_250818 ) ) ( not ( = ?auto_250815 ?auto_250821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250816 ?auto_250817 ?auto_250818 )
      ( MAKE-6CRATE-VERIFY ?auto_250812 ?auto_250813 ?auto_250814 ?auto_250815 ?auto_250816 ?auto_250817 ?auto_250818 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250825 - SURFACE
      ?auto_250826 - SURFACE
      ?auto_250827 - SURFACE
      ?auto_250828 - SURFACE
      ?auto_250829 - SURFACE
      ?auto_250830 - SURFACE
      ?auto_250831 - SURFACE
      ?auto_250832 - SURFACE
    )
    :vars
    (
      ?auto_250838 - HOIST
      ?auto_250834 - PLACE
      ?auto_250833 - PLACE
      ?auto_250837 - HOIST
      ?auto_250835 - SURFACE
      ?auto_250836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250838 ?auto_250834 ) ( IS-CRATE ?auto_250832 ) ( not ( = ?auto_250831 ?auto_250832 ) ) ( not ( = ?auto_250830 ?auto_250831 ) ) ( not ( = ?auto_250830 ?auto_250832 ) ) ( not ( = ?auto_250833 ?auto_250834 ) ) ( HOIST-AT ?auto_250837 ?auto_250833 ) ( not ( = ?auto_250838 ?auto_250837 ) ) ( AVAILABLE ?auto_250837 ) ( SURFACE-AT ?auto_250832 ?auto_250833 ) ( ON ?auto_250832 ?auto_250835 ) ( CLEAR ?auto_250832 ) ( not ( = ?auto_250831 ?auto_250835 ) ) ( not ( = ?auto_250832 ?auto_250835 ) ) ( not ( = ?auto_250830 ?auto_250835 ) ) ( SURFACE-AT ?auto_250830 ?auto_250834 ) ( CLEAR ?auto_250830 ) ( IS-CRATE ?auto_250831 ) ( AVAILABLE ?auto_250838 ) ( IN ?auto_250831 ?auto_250836 ) ( TRUCK-AT ?auto_250836 ?auto_250833 ) ( ON ?auto_250826 ?auto_250825 ) ( ON ?auto_250827 ?auto_250826 ) ( ON ?auto_250828 ?auto_250827 ) ( ON ?auto_250829 ?auto_250828 ) ( ON ?auto_250830 ?auto_250829 ) ( not ( = ?auto_250825 ?auto_250826 ) ) ( not ( = ?auto_250825 ?auto_250827 ) ) ( not ( = ?auto_250825 ?auto_250828 ) ) ( not ( = ?auto_250825 ?auto_250829 ) ) ( not ( = ?auto_250825 ?auto_250830 ) ) ( not ( = ?auto_250825 ?auto_250831 ) ) ( not ( = ?auto_250825 ?auto_250832 ) ) ( not ( = ?auto_250825 ?auto_250835 ) ) ( not ( = ?auto_250826 ?auto_250827 ) ) ( not ( = ?auto_250826 ?auto_250828 ) ) ( not ( = ?auto_250826 ?auto_250829 ) ) ( not ( = ?auto_250826 ?auto_250830 ) ) ( not ( = ?auto_250826 ?auto_250831 ) ) ( not ( = ?auto_250826 ?auto_250832 ) ) ( not ( = ?auto_250826 ?auto_250835 ) ) ( not ( = ?auto_250827 ?auto_250828 ) ) ( not ( = ?auto_250827 ?auto_250829 ) ) ( not ( = ?auto_250827 ?auto_250830 ) ) ( not ( = ?auto_250827 ?auto_250831 ) ) ( not ( = ?auto_250827 ?auto_250832 ) ) ( not ( = ?auto_250827 ?auto_250835 ) ) ( not ( = ?auto_250828 ?auto_250829 ) ) ( not ( = ?auto_250828 ?auto_250830 ) ) ( not ( = ?auto_250828 ?auto_250831 ) ) ( not ( = ?auto_250828 ?auto_250832 ) ) ( not ( = ?auto_250828 ?auto_250835 ) ) ( not ( = ?auto_250829 ?auto_250830 ) ) ( not ( = ?auto_250829 ?auto_250831 ) ) ( not ( = ?auto_250829 ?auto_250832 ) ) ( not ( = ?auto_250829 ?auto_250835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250830 ?auto_250831 ?auto_250832 )
      ( MAKE-7CRATE-VERIFY ?auto_250825 ?auto_250826 ?auto_250827 ?auto_250828 ?auto_250829 ?auto_250830 ?auto_250831 ?auto_250832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_250839 - SURFACE
      ?auto_250840 - SURFACE
    )
    :vars
    (
      ?auto_250847 - HOIST
      ?auto_250842 - PLACE
      ?auto_250845 - SURFACE
      ?auto_250841 - PLACE
      ?auto_250846 - HOIST
      ?auto_250843 - SURFACE
      ?auto_250844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250847 ?auto_250842 ) ( IS-CRATE ?auto_250840 ) ( not ( = ?auto_250839 ?auto_250840 ) ) ( not ( = ?auto_250845 ?auto_250839 ) ) ( not ( = ?auto_250845 ?auto_250840 ) ) ( not ( = ?auto_250841 ?auto_250842 ) ) ( HOIST-AT ?auto_250846 ?auto_250841 ) ( not ( = ?auto_250847 ?auto_250846 ) ) ( SURFACE-AT ?auto_250840 ?auto_250841 ) ( ON ?auto_250840 ?auto_250843 ) ( CLEAR ?auto_250840 ) ( not ( = ?auto_250839 ?auto_250843 ) ) ( not ( = ?auto_250840 ?auto_250843 ) ) ( not ( = ?auto_250845 ?auto_250843 ) ) ( SURFACE-AT ?auto_250845 ?auto_250842 ) ( CLEAR ?auto_250845 ) ( IS-CRATE ?auto_250839 ) ( AVAILABLE ?auto_250847 ) ( TRUCK-AT ?auto_250844 ?auto_250841 ) ( LIFTING ?auto_250846 ?auto_250839 ) )
    :subtasks
    ( ( !LOAD ?auto_250846 ?auto_250839 ?auto_250844 ?auto_250841 )
      ( MAKE-2CRATE ?auto_250845 ?auto_250839 ?auto_250840 )
      ( MAKE-1CRATE-VERIFY ?auto_250839 ?auto_250840 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_250848 - SURFACE
      ?auto_250849 - SURFACE
      ?auto_250850 - SURFACE
    )
    :vars
    (
      ?auto_250852 - HOIST
      ?auto_250855 - PLACE
      ?auto_250854 - PLACE
      ?auto_250856 - HOIST
      ?auto_250851 - SURFACE
      ?auto_250853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250852 ?auto_250855 ) ( IS-CRATE ?auto_250850 ) ( not ( = ?auto_250849 ?auto_250850 ) ) ( not ( = ?auto_250848 ?auto_250849 ) ) ( not ( = ?auto_250848 ?auto_250850 ) ) ( not ( = ?auto_250854 ?auto_250855 ) ) ( HOIST-AT ?auto_250856 ?auto_250854 ) ( not ( = ?auto_250852 ?auto_250856 ) ) ( SURFACE-AT ?auto_250850 ?auto_250854 ) ( ON ?auto_250850 ?auto_250851 ) ( CLEAR ?auto_250850 ) ( not ( = ?auto_250849 ?auto_250851 ) ) ( not ( = ?auto_250850 ?auto_250851 ) ) ( not ( = ?auto_250848 ?auto_250851 ) ) ( SURFACE-AT ?auto_250848 ?auto_250855 ) ( CLEAR ?auto_250848 ) ( IS-CRATE ?auto_250849 ) ( AVAILABLE ?auto_250852 ) ( TRUCK-AT ?auto_250853 ?auto_250854 ) ( LIFTING ?auto_250856 ?auto_250849 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_250849 ?auto_250850 )
      ( MAKE-2CRATE-VERIFY ?auto_250848 ?auto_250849 ?auto_250850 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_250857 - SURFACE
      ?auto_250858 - SURFACE
      ?auto_250859 - SURFACE
      ?auto_250860 - SURFACE
    )
    :vars
    (
      ?auto_250861 - HOIST
      ?auto_250862 - PLACE
      ?auto_250864 - PLACE
      ?auto_250866 - HOIST
      ?auto_250863 - SURFACE
      ?auto_250865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250861 ?auto_250862 ) ( IS-CRATE ?auto_250860 ) ( not ( = ?auto_250859 ?auto_250860 ) ) ( not ( = ?auto_250858 ?auto_250859 ) ) ( not ( = ?auto_250858 ?auto_250860 ) ) ( not ( = ?auto_250864 ?auto_250862 ) ) ( HOIST-AT ?auto_250866 ?auto_250864 ) ( not ( = ?auto_250861 ?auto_250866 ) ) ( SURFACE-AT ?auto_250860 ?auto_250864 ) ( ON ?auto_250860 ?auto_250863 ) ( CLEAR ?auto_250860 ) ( not ( = ?auto_250859 ?auto_250863 ) ) ( not ( = ?auto_250860 ?auto_250863 ) ) ( not ( = ?auto_250858 ?auto_250863 ) ) ( SURFACE-AT ?auto_250858 ?auto_250862 ) ( CLEAR ?auto_250858 ) ( IS-CRATE ?auto_250859 ) ( AVAILABLE ?auto_250861 ) ( TRUCK-AT ?auto_250865 ?auto_250864 ) ( LIFTING ?auto_250866 ?auto_250859 ) ( ON ?auto_250858 ?auto_250857 ) ( not ( = ?auto_250857 ?auto_250858 ) ) ( not ( = ?auto_250857 ?auto_250859 ) ) ( not ( = ?auto_250857 ?auto_250860 ) ) ( not ( = ?auto_250857 ?auto_250863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250858 ?auto_250859 ?auto_250860 )
      ( MAKE-3CRATE-VERIFY ?auto_250857 ?auto_250858 ?auto_250859 ?auto_250860 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_250867 - SURFACE
      ?auto_250868 - SURFACE
      ?auto_250869 - SURFACE
      ?auto_250870 - SURFACE
      ?auto_250871 - SURFACE
    )
    :vars
    (
      ?auto_250872 - HOIST
      ?auto_250873 - PLACE
      ?auto_250875 - PLACE
      ?auto_250877 - HOIST
      ?auto_250874 - SURFACE
      ?auto_250876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250872 ?auto_250873 ) ( IS-CRATE ?auto_250871 ) ( not ( = ?auto_250870 ?auto_250871 ) ) ( not ( = ?auto_250869 ?auto_250870 ) ) ( not ( = ?auto_250869 ?auto_250871 ) ) ( not ( = ?auto_250875 ?auto_250873 ) ) ( HOIST-AT ?auto_250877 ?auto_250875 ) ( not ( = ?auto_250872 ?auto_250877 ) ) ( SURFACE-AT ?auto_250871 ?auto_250875 ) ( ON ?auto_250871 ?auto_250874 ) ( CLEAR ?auto_250871 ) ( not ( = ?auto_250870 ?auto_250874 ) ) ( not ( = ?auto_250871 ?auto_250874 ) ) ( not ( = ?auto_250869 ?auto_250874 ) ) ( SURFACE-AT ?auto_250869 ?auto_250873 ) ( CLEAR ?auto_250869 ) ( IS-CRATE ?auto_250870 ) ( AVAILABLE ?auto_250872 ) ( TRUCK-AT ?auto_250876 ?auto_250875 ) ( LIFTING ?auto_250877 ?auto_250870 ) ( ON ?auto_250868 ?auto_250867 ) ( ON ?auto_250869 ?auto_250868 ) ( not ( = ?auto_250867 ?auto_250868 ) ) ( not ( = ?auto_250867 ?auto_250869 ) ) ( not ( = ?auto_250867 ?auto_250870 ) ) ( not ( = ?auto_250867 ?auto_250871 ) ) ( not ( = ?auto_250867 ?auto_250874 ) ) ( not ( = ?auto_250868 ?auto_250869 ) ) ( not ( = ?auto_250868 ?auto_250870 ) ) ( not ( = ?auto_250868 ?auto_250871 ) ) ( not ( = ?auto_250868 ?auto_250874 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250869 ?auto_250870 ?auto_250871 )
      ( MAKE-4CRATE-VERIFY ?auto_250867 ?auto_250868 ?auto_250869 ?auto_250870 ?auto_250871 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_250878 - SURFACE
      ?auto_250879 - SURFACE
      ?auto_250880 - SURFACE
      ?auto_250881 - SURFACE
      ?auto_250882 - SURFACE
      ?auto_250883 - SURFACE
    )
    :vars
    (
      ?auto_250884 - HOIST
      ?auto_250885 - PLACE
      ?auto_250887 - PLACE
      ?auto_250889 - HOIST
      ?auto_250886 - SURFACE
      ?auto_250888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250884 ?auto_250885 ) ( IS-CRATE ?auto_250883 ) ( not ( = ?auto_250882 ?auto_250883 ) ) ( not ( = ?auto_250881 ?auto_250882 ) ) ( not ( = ?auto_250881 ?auto_250883 ) ) ( not ( = ?auto_250887 ?auto_250885 ) ) ( HOIST-AT ?auto_250889 ?auto_250887 ) ( not ( = ?auto_250884 ?auto_250889 ) ) ( SURFACE-AT ?auto_250883 ?auto_250887 ) ( ON ?auto_250883 ?auto_250886 ) ( CLEAR ?auto_250883 ) ( not ( = ?auto_250882 ?auto_250886 ) ) ( not ( = ?auto_250883 ?auto_250886 ) ) ( not ( = ?auto_250881 ?auto_250886 ) ) ( SURFACE-AT ?auto_250881 ?auto_250885 ) ( CLEAR ?auto_250881 ) ( IS-CRATE ?auto_250882 ) ( AVAILABLE ?auto_250884 ) ( TRUCK-AT ?auto_250888 ?auto_250887 ) ( LIFTING ?auto_250889 ?auto_250882 ) ( ON ?auto_250879 ?auto_250878 ) ( ON ?auto_250880 ?auto_250879 ) ( ON ?auto_250881 ?auto_250880 ) ( not ( = ?auto_250878 ?auto_250879 ) ) ( not ( = ?auto_250878 ?auto_250880 ) ) ( not ( = ?auto_250878 ?auto_250881 ) ) ( not ( = ?auto_250878 ?auto_250882 ) ) ( not ( = ?auto_250878 ?auto_250883 ) ) ( not ( = ?auto_250878 ?auto_250886 ) ) ( not ( = ?auto_250879 ?auto_250880 ) ) ( not ( = ?auto_250879 ?auto_250881 ) ) ( not ( = ?auto_250879 ?auto_250882 ) ) ( not ( = ?auto_250879 ?auto_250883 ) ) ( not ( = ?auto_250879 ?auto_250886 ) ) ( not ( = ?auto_250880 ?auto_250881 ) ) ( not ( = ?auto_250880 ?auto_250882 ) ) ( not ( = ?auto_250880 ?auto_250883 ) ) ( not ( = ?auto_250880 ?auto_250886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250881 ?auto_250882 ?auto_250883 )
      ( MAKE-5CRATE-VERIFY ?auto_250878 ?auto_250879 ?auto_250880 ?auto_250881 ?auto_250882 ?auto_250883 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_250890 - SURFACE
      ?auto_250891 - SURFACE
      ?auto_250892 - SURFACE
      ?auto_250893 - SURFACE
      ?auto_250894 - SURFACE
      ?auto_250895 - SURFACE
      ?auto_250896 - SURFACE
    )
    :vars
    (
      ?auto_250897 - HOIST
      ?auto_250898 - PLACE
      ?auto_250900 - PLACE
      ?auto_250902 - HOIST
      ?auto_250899 - SURFACE
      ?auto_250901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250897 ?auto_250898 ) ( IS-CRATE ?auto_250896 ) ( not ( = ?auto_250895 ?auto_250896 ) ) ( not ( = ?auto_250894 ?auto_250895 ) ) ( not ( = ?auto_250894 ?auto_250896 ) ) ( not ( = ?auto_250900 ?auto_250898 ) ) ( HOIST-AT ?auto_250902 ?auto_250900 ) ( not ( = ?auto_250897 ?auto_250902 ) ) ( SURFACE-AT ?auto_250896 ?auto_250900 ) ( ON ?auto_250896 ?auto_250899 ) ( CLEAR ?auto_250896 ) ( not ( = ?auto_250895 ?auto_250899 ) ) ( not ( = ?auto_250896 ?auto_250899 ) ) ( not ( = ?auto_250894 ?auto_250899 ) ) ( SURFACE-AT ?auto_250894 ?auto_250898 ) ( CLEAR ?auto_250894 ) ( IS-CRATE ?auto_250895 ) ( AVAILABLE ?auto_250897 ) ( TRUCK-AT ?auto_250901 ?auto_250900 ) ( LIFTING ?auto_250902 ?auto_250895 ) ( ON ?auto_250891 ?auto_250890 ) ( ON ?auto_250892 ?auto_250891 ) ( ON ?auto_250893 ?auto_250892 ) ( ON ?auto_250894 ?auto_250893 ) ( not ( = ?auto_250890 ?auto_250891 ) ) ( not ( = ?auto_250890 ?auto_250892 ) ) ( not ( = ?auto_250890 ?auto_250893 ) ) ( not ( = ?auto_250890 ?auto_250894 ) ) ( not ( = ?auto_250890 ?auto_250895 ) ) ( not ( = ?auto_250890 ?auto_250896 ) ) ( not ( = ?auto_250890 ?auto_250899 ) ) ( not ( = ?auto_250891 ?auto_250892 ) ) ( not ( = ?auto_250891 ?auto_250893 ) ) ( not ( = ?auto_250891 ?auto_250894 ) ) ( not ( = ?auto_250891 ?auto_250895 ) ) ( not ( = ?auto_250891 ?auto_250896 ) ) ( not ( = ?auto_250891 ?auto_250899 ) ) ( not ( = ?auto_250892 ?auto_250893 ) ) ( not ( = ?auto_250892 ?auto_250894 ) ) ( not ( = ?auto_250892 ?auto_250895 ) ) ( not ( = ?auto_250892 ?auto_250896 ) ) ( not ( = ?auto_250892 ?auto_250899 ) ) ( not ( = ?auto_250893 ?auto_250894 ) ) ( not ( = ?auto_250893 ?auto_250895 ) ) ( not ( = ?auto_250893 ?auto_250896 ) ) ( not ( = ?auto_250893 ?auto_250899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250894 ?auto_250895 ?auto_250896 )
      ( MAKE-6CRATE-VERIFY ?auto_250890 ?auto_250891 ?auto_250892 ?auto_250893 ?auto_250894 ?auto_250895 ?auto_250896 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250903 - SURFACE
      ?auto_250904 - SURFACE
      ?auto_250905 - SURFACE
      ?auto_250906 - SURFACE
      ?auto_250907 - SURFACE
      ?auto_250908 - SURFACE
      ?auto_250909 - SURFACE
      ?auto_250910 - SURFACE
    )
    :vars
    (
      ?auto_250911 - HOIST
      ?auto_250912 - PLACE
      ?auto_250914 - PLACE
      ?auto_250916 - HOIST
      ?auto_250913 - SURFACE
      ?auto_250915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250911 ?auto_250912 ) ( IS-CRATE ?auto_250910 ) ( not ( = ?auto_250909 ?auto_250910 ) ) ( not ( = ?auto_250908 ?auto_250909 ) ) ( not ( = ?auto_250908 ?auto_250910 ) ) ( not ( = ?auto_250914 ?auto_250912 ) ) ( HOIST-AT ?auto_250916 ?auto_250914 ) ( not ( = ?auto_250911 ?auto_250916 ) ) ( SURFACE-AT ?auto_250910 ?auto_250914 ) ( ON ?auto_250910 ?auto_250913 ) ( CLEAR ?auto_250910 ) ( not ( = ?auto_250909 ?auto_250913 ) ) ( not ( = ?auto_250910 ?auto_250913 ) ) ( not ( = ?auto_250908 ?auto_250913 ) ) ( SURFACE-AT ?auto_250908 ?auto_250912 ) ( CLEAR ?auto_250908 ) ( IS-CRATE ?auto_250909 ) ( AVAILABLE ?auto_250911 ) ( TRUCK-AT ?auto_250915 ?auto_250914 ) ( LIFTING ?auto_250916 ?auto_250909 ) ( ON ?auto_250904 ?auto_250903 ) ( ON ?auto_250905 ?auto_250904 ) ( ON ?auto_250906 ?auto_250905 ) ( ON ?auto_250907 ?auto_250906 ) ( ON ?auto_250908 ?auto_250907 ) ( not ( = ?auto_250903 ?auto_250904 ) ) ( not ( = ?auto_250903 ?auto_250905 ) ) ( not ( = ?auto_250903 ?auto_250906 ) ) ( not ( = ?auto_250903 ?auto_250907 ) ) ( not ( = ?auto_250903 ?auto_250908 ) ) ( not ( = ?auto_250903 ?auto_250909 ) ) ( not ( = ?auto_250903 ?auto_250910 ) ) ( not ( = ?auto_250903 ?auto_250913 ) ) ( not ( = ?auto_250904 ?auto_250905 ) ) ( not ( = ?auto_250904 ?auto_250906 ) ) ( not ( = ?auto_250904 ?auto_250907 ) ) ( not ( = ?auto_250904 ?auto_250908 ) ) ( not ( = ?auto_250904 ?auto_250909 ) ) ( not ( = ?auto_250904 ?auto_250910 ) ) ( not ( = ?auto_250904 ?auto_250913 ) ) ( not ( = ?auto_250905 ?auto_250906 ) ) ( not ( = ?auto_250905 ?auto_250907 ) ) ( not ( = ?auto_250905 ?auto_250908 ) ) ( not ( = ?auto_250905 ?auto_250909 ) ) ( not ( = ?auto_250905 ?auto_250910 ) ) ( not ( = ?auto_250905 ?auto_250913 ) ) ( not ( = ?auto_250906 ?auto_250907 ) ) ( not ( = ?auto_250906 ?auto_250908 ) ) ( not ( = ?auto_250906 ?auto_250909 ) ) ( not ( = ?auto_250906 ?auto_250910 ) ) ( not ( = ?auto_250906 ?auto_250913 ) ) ( not ( = ?auto_250907 ?auto_250908 ) ) ( not ( = ?auto_250907 ?auto_250909 ) ) ( not ( = ?auto_250907 ?auto_250910 ) ) ( not ( = ?auto_250907 ?auto_250913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250908 ?auto_250909 ?auto_250910 )
      ( MAKE-7CRATE-VERIFY ?auto_250903 ?auto_250904 ?auto_250905 ?auto_250906 ?auto_250907 ?auto_250908 ?auto_250909 ?auto_250910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_250917 - SURFACE
      ?auto_250918 - SURFACE
    )
    :vars
    (
      ?auto_250919 - HOIST
      ?auto_250920 - PLACE
      ?auto_250921 - SURFACE
      ?auto_250923 - PLACE
      ?auto_250925 - HOIST
      ?auto_250922 - SURFACE
      ?auto_250924 - TRUCK
      ?auto_250926 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250919 ?auto_250920 ) ( IS-CRATE ?auto_250918 ) ( not ( = ?auto_250917 ?auto_250918 ) ) ( not ( = ?auto_250921 ?auto_250917 ) ) ( not ( = ?auto_250921 ?auto_250918 ) ) ( not ( = ?auto_250923 ?auto_250920 ) ) ( HOIST-AT ?auto_250925 ?auto_250923 ) ( not ( = ?auto_250919 ?auto_250925 ) ) ( SURFACE-AT ?auto_250918 ?auto_250923 ) ( ON ?auto_250918 ?auto_250922 ) ( CLEAR ?auto_250918 ) ( not ( = ?auto_250917 ?auto_250922 ) ) ( not ( = ?auto_250918 ?auto_250922 ) ) ( not ( = ?auto_250921 ?auto_250922 ) ) ( SURFACE-AT ?auto_250921 ?auto_250920 ) ( CLEAR ?auto_250921 ) ( IS-CRATE ?auto_250917 ) ( AVAILABLE ?auto_250919 ) ( TRUCK-AT ?auto_250924 ?auto_250923 ) ( AVAILABLE ?auto_250925 ) ( SURFACE-AT ?auto_250917 ?auto_250923 ) ( ON ?auto_250917 ?auto_250926 ) ( CLEAR ?auto_250917 ) ( not ( = ?auto_250917 ?auto_250926 ) ) ( not ( = ?auto_250918 ?auto_250926 ) ) ( not ( = ?auto_250921 ?auto_250926 ) ) ( not ( = ?auto_250922 ?auto_250926 ) ) )
    :subtasks
    ( ( !LIFT ?auto_250925 ?auto_250917 ?auto_250926 ?auto_250923 )
      ( MAKE-2CRATE ?auto_250921 ?auto_250917 ?auto_250918 )
      ( MAKE-1CRATE-VERIFY ?auto_250917 ?auto_250918 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_250927 - SURFACE
      ?auto_250928 - SURFACE
      ?auto_250929 - SURFACE
    )
    :vars
    (
      ?auto_250933 - HOIST
      ?auto_250932 - PLACE
      ?auto_250930 - PLACE
      ?auto_250935 - HOIST
      ?auto_250931 - SURFACE
      ?auto_250936 - TRUCK
      ?auto_250934 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250933 ?auto_250932 ) ( IS-CRATE ?auto_250929 ) ( not ( = ?auto_250928 ?auto_250929 ) ) ( not ( = ?auto_250927 ?auto_250928 ) ) ( not ( = ?auto_250927 ?auto_250929 ) ) ( not ( = ?auto_250930 ?auto_250932 ) ) ( HOIST-AT ?auto_250935 ?auto_250930 ) ( not ( = ?auto_250933 ?auto_250935 ) ) ( SURFACE-AT ?auto_250929 ?auto_250930 ) ( ON ?auto_250929 ?auto_250931 ) ( CLEAR ?auto_250929 ) ( not ( = ?auto_250928 ?auto_250931 ) ) ( not ( = ?auto_250929 ?auto_250931 ) ) ( not ( = ?auto_250927 ?auto_250931 ) ) ( SURFACE-AT ?auto_250927 ?auto_250932 ) ( CLEAR ?auto_250927 ) ( IS-CRATE ?auto_250928 ) ( AVAILABLE ?auto_250933 ) ( TRUCK-AT ?auto_250936 ?auto_250930 ) ( AVAILABLE ?auto_250935 ) ( SURFACE-AT ?auto_250928 ?auto_250930 ) ( ON ?auto_250928 ?auto_250934 ) ( CLEAR ?auto_250928 ) ( not ( = ?auto_250928 ?auto_250934 ) ) ( not ( = ?auto_250929 ?auto_250934 ) ) ( not ( = ?auto_250927 ?auto_250934 ) ) ( not ( = ?auto_250931 ?auto_250934 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_250928 ?auto_250929 )
      ( MAKE-2CRATE-VERIFY ?auto_250927 ?auto_250928 ?auto_250929 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_250937 - SURFACE
      ?auto_250938 - SURFACE
      ?auto_250939 - SURFACE
      ?auto_250940 - SURFACE
    )
    :vars
    (
      ?auto_250945 - HOIST
      ?auto_250943 - PLACE
      ?auto_250941 - PLACE
      ?auto_250946 - HOIST
      ?auto_250944 - SURFACE
      ?auto_250942 - TRUCK
      ?auto_250947 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250945 ?auto_250943 ) ( IS-CRATE ?auto_250940 ) ( not ( = ?auto_250939 ?auto_250940 ) ) ( not ( = ?auto_250938 ?auto_250939 ) ) ( not ( = ?auto_250938 ?auto_250940 ) ) ( not ( = ?auto_250941 ?auto_250943 ) ) ( HOIST-AT ?auto_250946 ?auto_250941 ) ( not ( = ?auto_250945 ?auto_250946 ) ) ( SURFACE-AT ?auto_250940 ?auto_250941 ) ( ON ?auto_250940 ?auto_250944 ) ( CLEAR ?auto_250940 ) ( not ( = ?auto_250939 ?auto_250944 ) ) ( not ( = ?auto_250940 ?auto_250944 ) ) ( not ( = ?auto_250938 ?auto_250944 ) ) ( SURFACE-AT ?auto_250938 ?auto_250943 ) ( CLEAR ?auto_250938 ) ( IS-CRATE ?auto_250939 ) ( AVAILABLE ?auto_250945 ) ( TRUCK-AT ?auto_250942 ?auto_250941 ) ( AVAILABLE ?auto_250946 ) ( SURFACE-AT ?auto_250939 ?auto_250941 ) ( ON ?auto_250939 ?auto_250947 ) ( CLEAR ?auto_250939 ) ( not ( = ?auto_250939 ?auto_250947 ) ) ( not ( = ?auto_250940 ?auto_250947 ) ) ( not ( = ?auto_250938 ?auto_250947 ) ) ( not ( = ?auto_250944 ?auto_250947 ) ) ( ON ?auto_250938 ?auto_250937 ) ( not ( = ?auto_250937 ?auto_250938 ) ) ( not ( = ?auto_250937 ?auto_250939 ) ) ( not ( = ?auto_250937 ?auto_250940 ) ) ( not ( = ?auto_250937 ?auto_250944 ) ) ( not ( = ?auto_250937 ?auto_250947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250938 ?auto_250939 ?auto_250940 )
      ( MAKE-3CRATE-VERIFY ?auto_250937 ?auto_250938 ?auto_250939 ?auto_250940 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_250948 - SURFACE
      ?auto_250949 - SURFACE
      ?auto_250950 - SURFACE
      ?auto_250951 - SURFACE
      ?auto_250952 - SURFACE
    )
    :vars
    (
      ?auto_250957 - HOIST
      ?auto_250955 - PLACE
      ?auto_250953 - PLACE
      ?auto_250958 - HOIST
      ?auto_250956 - SURFACE
      ?auto_250954 - TRUCK
      ?auto_250959 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250957 ?auto_250955 ) ( IS-CRATE ?auto_250952 ) ( not ( = ?auto_250951 ?auto_250952 ) ) ( not ( = ?auto_250950 ?auto_250951 ) ) ( not ( = ?auto_250950 ?auto_250952 ) ) ( not ( = ?auto_250953 ?auto_250955 ) ) ( HOIST-AT ?auto_250958 ?auto_250953 ) ( not ( = ?auto_250957 ?auto_250958 ) ) ( SURFACE-AT ?auto_250952 ?auto_250953 ) ( ON ?auto_250952 ?auto_250956 ) ( CLEAR ?auto_250952 ) ( not ( = ?auto_250951 ?auto_250956 ) ) ( not ( = ?auto_250952 ?auto_250956 ) ) ( not ( = ?auto_250950 ?auto_250956 ) ) ( SURFACE-AT ?auto_250950 ?auto_250955 ) ( CLEAR ?auto_250950 ) ( IS-CRATE ?auto_250951 ) ( AVAILABLE ?auto_250957 ) ( TRUCK-AT ?auto_250954 ?auto_250953 ) ( AVAILABLE ?auto_250958 ) ( SURFACE-AT ?auto_250951 ?auto_250953 ) ( ON ?auto_250951 ?auto_250959 ) ( CLEAR ?auto_250951 ) ( not ( = ?auto_250951 ?auto_250959 ) ) ( not ( = ?auto_250952 ?auto_250959 ) ) ( not ( = ?auto_250950 ?auto_250959 ) ) ( not ( = ?auto_250956 ?auto_250959 ) ) ( ON ?auto_250949 ?auto_250948 ) ( ON ?auto_250950 ?auto_250949 ) ( not ( = ?auto_250948 ?auto_250949 ) ) ( not ( = ?auto_250948 ?auto_250950 ) ) ( not ( = ?auto_250948 ?auto_250951 ) ) ( not ( = ?auto_250948 ?auto_250952 ) ) ( not ( = ?auto_250948 ?auto_250956 ) ) ( not ( = ?auto_250948 ?auto_250959 ) ) ( not ( = ?auto_250949 ?auto_250950 ) ) ( not ( = ?auto_250949 ?auto_250951 ) ) ( not ( = ?auto_250949 ?auto_250952 ) ) ( not ( = ?auto_250949 ?auto_250956 ) ) ( not ( = ?auto_250949 ?auto_250959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250950 ?auto_250951 ?auto_250952 )
      ( MAKE-4CRATE-VERIFY ?auto_250948 ?auto_250949 ?auto_250950 ?auto_250951 ?auto_250952 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_250960 - SURFACE
      ?auto_250961 - SURFACE
      ?auto_250962 - SURFACE
      ?auto_250963 - SURFACE
      ?auto_250964 - SURFACE
      ?auto_250965 - SURFACE
    )
    :vars
    (
      ?auto_250970 - HOIST
      ?auto_250968 - PLACE
      ?auto_250966 - PLACE
      ?auto_250971 - HOIST
      ?auto_250969 - SURFACE
      ?auto_250967 - TRUCK
      ?auto_250972 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250970 ?auto_250968 ) ( IS-CRATE ?auto_250965 ) ( not ( = ?auto_250964 ?auto_250965 ) ) ( not ( = ?auto_250963 ?auto_250964 ) ) ( not ( = ?auto_250963 ?auto_250965 ) ) ( not ( = ?auto_250966 ?auto_250968 ) ) ( HOIST-AT ?auto_250971 ?auto_250966 ) ( not ( = ?auto_250970 ?auto_250971 ) ) ( SURFACE-AT ?auto_250965 ?auto_250966 ) ( ON ?auto_250965 ?auto_250969 ) ( CLEAR ?auto_250965 ) ( not ( = ?auto_250964 ?auto_250969 ) ) ( not ( = ?auto_250965 ?auto_250969 ) ) ( not ( = ?auto_250963 ?auto_250969 ) ) ( SURFACE-AT ?auto_250963 ?auto_250968 ) ( CLEAR ?auto_250963 ) ( IS-CRATE ?auto_250964 ) ( AVAILABLE ?auto_250970 ) ( TRUCK-AT ?auto_250967 ?auto_250966 ) ( AVAILABLE ?auto_250971 ) ( SURFACE-AT ?auto_250964 ?auto_250966 ) ( ON ?auto_250964 ?auto_250972 ) ( CLEAR ?auto_250964 ) ( not ( = ?auto_250964 ?auto_250972 ) ) ( not ( = ?auto_250965 ?auto_250972 ) ) ( not ( = ?auto_250963 ?auto_250972 ) ) ( not ( = ?auto_250969 ?auto_250972 ) ) ( ON ?auto_250961 ?auto_250960 ) ( ON ?auto_250962 ?auto_250961 ) ( ON ?auto_250963 ?auto_250962 ) ( not ( = ?auto_250960 ?auto_250961 ) ) ( not ( = ?auto_250960 ?auto_250962 ) ) ( not ( = ?auto_250960 ?auto_250963 ) ) ( not ( = ?auto_250960 ?auto_250964 ) ) ( not ( = ?auto_250960 ?auto_250965 ) ) ( not ( = ?auto_250960 ?auto_250969 ) ) ( not ( = ?auto_250960 ?auto_250972 ) ) ( not ( = ?auto_250961 ?auto_250962 ) ) ( not ( = ?auto_250961 ?auto_250963 ) ) ( not ( = ?auto_250961 ?auto_250964 ) ) ( not ( = ?auto_250961 ?auto_250965 ) ) ( not ( = ?auto_250961 ?auto_250969 ) ) ( not ( = ?auto_250961 ?auto_250972 ) ) ( not ( = ?auto_250962 ?auto_250963 ) ) ( not ( = ?auto_250962 ?auto_250964 ) ) ( not ( = ?auto_250962 ?auto_250965 ) ) ( not ( = ?auto_250962 ?auto_250969 ) ) ( not ( = ?auto_250962 ?auto_250972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250963 ?auto_250964 ?auto_250965 )
      ( MAKE-5CRATE-VERIFY ?auto_250960 ?auto_250961 ?auto_250962 ?auto_250963 ?auto_250964 ?auto_250965 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_250973 - SURFACE
      ?auto_250974 - SURFACE
      ?auto_250975 - SURFACE
      ?auto_250976 - SURFACE
      ?auto_250977 - SURFACE
      ?auto_250978 - SURFACE
      ?auto_250979 - SURFACE
    )
    :vars
    (
      ?auto_250984 - HOIST
      ?auto_250982 - PLACE
      ?auto_250980 - PLACE
      ?auto_250985 - HOIST
      ?auto_250983 - SURFACE
      ?auto_250981 - TRUCK
      ?auto_250986 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250984 ?auto_250982 ) ( IS-CRATE ?auto_250979 ) ( not ( = ?auto_250978 ?auto_250979 ) ) ( not ( = ?auto_250977 ?auto_250978 ) ) ( not ( = ?auto_250977 ?auto_250979 ) ) ( not ( = ?auto_250980 ?auto_250982 ) ) ( HOIST-AT ?auto_250985 ?auto_250980 ) ( not ( = ?auto_250984 ?auto_250985 ) ) ( SURFACE-AT ?auto_250979 ?auto_250980 ) ( ON ?auto_250979 ?auto_250983 ) ( CLEAR ?auto_250979 ) ( not ( = ?auto_250978 ?auto_250983 ) ) ( not ( = ?auto_250979 ?auto_250983 ) ) ( not ( = ?auto_250977 ?auto_250983 ) ) ( SURFACE-AT ?auto_250977 ?auto_250982 ) ( CLEAR ?auto_250977 ) ( IS-CRATE ?auto_250978 ) ( AVAILABLE ?auto_250984 ) ( TRUCK-AT ?auto_250981 ?auto_250980 ) ( AVAILABLE ?auto_250985 ) ( SURFACE-AT ?auto_250978 ?auto_250980 ) ( ON ?auto_250978 ?auto_250986 ) ( CLEAR ?auto_250978 ) ( not ( = ?auto_250978 ?auto_250986 ) ) ( not ( = ?auto_250979 ?auto_250986 ) ) ( not ( = ?auto_250977 ?auto_250986 ) ) ( not ( = ?auto_250983 ?auto_250986 ) ) ( ON ?auto_250974 ?auto_250973 ) ( ON ?auto_250975 ?auto_250974 ) ( ON ?auto_250976 ?auto_250975 ) ( ON ?auto_250977 ?auto_250976 ) ( not ( = ?auto_250973 ?auto_250974 ) ) ( not ( = ?auto_250973 ?auto_250975 ) ) ( not ( = ?auto_250973 ?auto_250976 ) ) ( not ( = ?auto_250973 ?auto_250977 ) ) ( not ( = ?auto_250973 ?auto_250978 ) ) ( not ( = ?auto_250973 ?auto_250979 ) ) ( not ( = ?auto_250973 ?auto_250983 ) ) ( not ( = ?auto_250973 ?auto_250986 ) ) ( not ( = ?auto_250974 ?auto_250975 ) ) ( not ( = ?auto_250974 ?auto_250976 ) ) ( not ( = ?auto_250974 ?auto_250977 ) ) ( not ( = ?auto_250974 ?auto_250978 ) ) ( not ( = ?auto_250974 ?auto_250979 ) ) ( not ( = ?auto_250974 ?auto_250983 ) ) ( not ( = ?auto_250974 ?auto_250986 ) ) ( not ( = ?auto_250975 ?auto_250976 ) ) ( not ( = ?auto_250975 ?auto_250977 ) ) ( not ( = ?auto_250975 ?auto_250978 ) ) ( not ( = ?auto_250975 ?auto_250979 ) ) ( not ( = ?auto_250975 ?auto_250983 ) ) ( not ( = ?auto_250975 ?auto_250986 ) ) ( not ( = ?auto_250976 ?auto_250977 ) ) ( not ( = ?auto_250976 ?auto_250978 ) ) ( not ( = ?auto_250976 ?auto_250979 ) ) ( not ( = ?auto_250976 ?auto_250983 ) ) ( not ( = ?auto_250976 ?auto_250986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250977 ?auto_250978 ?auto_250979 )
      ( MAKE-6CRATE-VERIFY ?auto_250973 ?auto_250974 ?auto_250975 ?auto_250976 ?auto_250977 ?auto_250978 ?auto_250979 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250987 - SURFACE
      ?auto_250988 - SURFACE
      ?auto_250989 - SURFACE
      ?auto_250990 - SURFACE
      ?auto_250991 - SURFACE
      ?auto_250992 - SURFACE
      ?auto_250993 - SURFACE
      ?auto_250994 - SURFACE
    )
    :vars
    (
      ?auto_250999 - HOIST
      ?auto_250997 - PLACE
      ?auto_250995 - PLACE
      ?auto_251000 - HOIST
      ?auto_250998 - SURFACE
      ?auto_250996 - TRUCK
      ?auto_251001 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250999 ?auto_250997 ) ( IS-CRATE ?auto_250994 ) ( not ( = ?auto_250993 ?auto_250994 ) ) ( not ( = ?auto_250992 ?auto_250993 ) ) ( not ( = ?auto_250992 ?auto_250994 ) ) ( not ( = ?auto_250995 ?auto_250997 ) ) ( HOIST-AT ?auto_251000 ?auto_250995 ) ( not ( = ?auto_250999 ?auto_251000 ) ) ( SURFACE-AT ?auto_250994 ?auto_250995 ) ( ON ?auto_250994 ?auto_250998 ) ( CLEAR ?auto_250994 ) ( not ( = ?auto_250993 ?auto_250998 ) ) ( not ( = ?auto_250994 ?auto_250998 ) ) ( not ( = ?auto_250992 ?auto_250998 ) ) ( SURFACE-AT ?auto_250992 ?auto_250997 ) ( CLEAR ?auto_250992 ) ( IS-CRATE ?auto_250993 ) ( AVAILABLE ?auto_250999 ) ( TRUCK-AT ?auto_250996 ?auto_250995 ) ( AVAILABLE ?auto_251000 ) ( SURFACE-AT ?auto_250993 ?auto_250995 ) ( ON ?auto_250993 ?auto_251001 ) ( CLEAR ?auto_250993 ) ( not ( = ?auto_250993 ?auto_251001 ) ) ( not ( = ?auto_250994 ?auto_251001 ) ) ( not ( = ?auto_250992 ?auto_251001 ) ) ( not ( = ?auto_250998 ?auto_251001 ) ) ( ON ?auto_250988 ?auto_250987 ) ( ON ?auto_250989 ?auto_250988 ) ( ON ?auto_250990 ?auto_250989 ) ( ON ?auto_250991 ?auto_250990 ) ( ON ?auto_250992 ?auto_250991 ) ( not ( = ?auto_250987 ?auto_250988 ) ) ( not ( = ?auto_250987 ?auto_250989 ) ) ( not ( = ?auto_250987 ?auto_250990 ) ) ( not ( = ?auto_250987 ?auto_250991 ) ) ( not ( = ?auto_250987 ?auto_250992 ) ) ( not ( = ?auto_250987 ?auto_250993 ) ) ( not ( = ?auto_250987 ?auto_250994 ) ) ( not ( = ?auto_250987 ?auto_250998 ) ) ( not ( = ?auto_250987 ?auto_251001 ) ) ( not ( = ?auto_250988 ?auto_250989 ) ) ( not ( = ?auto_250988 ?auto_250990 ) ) ( not ( = ?auto_250988 ?auto_250991 ) ) ( not ( = ?auto_250988 ?auto_250992 ) ) ( not ( = ?auto_250988 ?auto_250993 ) ) ( not ( = ?auto_250988 ?auto_250994 ) ) ( not ( = ?auto_250988 ?auto_250998 ) ) ( not ( = ?auto_250988 ?auto_251001 ) ) ( not ( = ?auto_250989 ?auto_250990 ) ) ( not ( = ?auto_250989 ?auto_250991 ) ) ( not ( = ?auto_250989 ?auto_250992 ) ) ( not ( = ?auto_250989 ?auto_250993 ) ) ( not ( = ?auto_250989 ?auto_250994 ) ) ( not ( = ?auto_250989 ?auto_250998 ) ) ( not ( = ?auto_250989 ?auto_251001 ) ) ( not ( = ?auto_250990 ?auto_250991 ) ) ( not ( = ?auto_250990 ?auto_250992 ) ) ( not ( = ?auto_250990 ?auto_250993 ) ) ( not ( = ?auto_250990 ?auto_250994 ) ) ( not ( = ?auto_250990 ?auto_250998 ) ) ( not ( = ?auto_250990 ?auto_251001 ) ) ( not ( = ?auto_250991 ?auto_250992 ) ) ( not ( = ?auto_250991 ?auto_250993 ) ) ( not ( = ?auto_250991 ?auto_250994 ) ) ( not ( = ?auto_250991 ?auto_250998 ) ) ( not ( = ?auto_250991 ?auto_251001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250992 ?auto_250993 ?auto_250994 )
      ( MAKE-7CRATE-VERIFY ?auto_250987 ?auto_250988 ?auto_250989 ?auto_250990 ?auto_250991 ?auto_250992 ?auto_250993 ?auto_250994 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_251002 - SURFACE
      ?auto_251003 - SURFACE
    )
    :vars
    (
      ?auto_251008 - HOIST
      ?auto_251006 - PLACE
      ?auto_251010 - SURFACE
      ?auto_251004 - PLACE
      ?auto_251009 - HOIST
      ?auto_251007 - SURFACE
      ?auto_251011 - SURFACE
      ?auto_251005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251008 ?auto_251006 ) ( IS-CRATE ?auto_251003 ) ( not ( = ?auto_251002 ?auto_251003 ) ) ( not ( = ?auto_251010 ?auto_251002 ) ) ( not ( = ?auto_251010 ?auto_251003 ) ) ( not ( = ?auto_251004 ?auto_251006 ) ) ( HOIST-AT ?auto_251009 ?auto_251004 ) ( not ( = ?auto_251008 ?auto_251009 ) ) ( SURFACE-AT ?auto_251003 ?auto_251004 ) ( ON ?auto_251003 ?auto_251007 ) ( CLEAR ?auto_251003 ) ( not ( = ?auto_251002 ?auto_251007 ) ) ( not ( = ?auto_251003 ?auto_251007 ) ) ( not ( = ?auto_251010 ?auto_251007 ) ) ( SURFACE-AT ?auto_251010 ?auto_251006 ) ( CLEAR ?auto_251010 ) ( IS-CRATE ?auto_251002 ) ( AVAILABLE ?auto_251008 ) ( AVAILABLE ?auto_251009 ) ( SURFACE-AT ?auto_251002 ?auto_251004 ) ( ON ?auto_251002 ?auto_251011 ) ( CLEAR ?auto_251002 ) ( not ( = ?auto_251002 ?auto_251011 ) ) ( not ( = ?auto_251003 ?auto_251011 ) ) ( not ( = ?auto_251010 ?auto_251011 ) ) ( not ( = ?auto_251007 ?auto_251011 ) ) ( TRUCK-AT ?auto_251005 ?auto_251006 ) )
    :subtasks
    ( ( !DRIVE ?auto_251005 ?auto_251006 ?auto_251004 )
      ( MAKE-2CRATE ?auto_251010 ?auto_251002 ?auto_251003 )
      ( MAKE-1CRATE-VERIFY ?auto_251002 ?auto_251003 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_251012 - SURFACE
      ?auto_251013 - SURFACE
      ?auto_251014 - SURFACE
    )
    :vars
    (
      ?auto_251018 - HOIST
      ?auto_251016 - PLACE
      ?auto_251019 - PLACE
      ?auto_251020 - HOIST
      ?auto_251015 - SURFACE
      ?auto_251021 - SURFACE
      ?auto_251017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251018 ?auto_251016 ) ( IS-CRATE ?auto_251014 ) ( not ( = ?auto_251013 ?auto_251014 ) ) ( not ( = ?auto_251012 ?auto_251013 ) ) ( not ( = ?auto_251012 ?auto_251014 ) ) ( not ( = ?auto_251019 ?auto_251016 ) ) ( HOIST-AT ?auto_251020 ?auto_251019 ) ( not ( = ?auto_251018 ?auto_251020 ) ) ( SURFACE-AT ?auto_251014 ?auto_251019 ) ( ON ?auto_251014 ?auto_251015 ) ( CLEAR ?auto_251014 ) ( not ( = ?auto_251013 ?auto_251015 ) ) ( not ( = ?auto_251014 ?auto_251015 ) ) ( not ( = ?auto_251012 ?auto_251015 ) ) ( SURFACE-AT ?auto_251012 ?auto_251016 ) ( CLEAR ?auto_251012 ) ( IS-CRATE ?auto_251013 ) ( AVAILABLE ?auto_251018 ) ( AVAILABLE ?auto_251020 ) ( SURFACE-AT ?auto_251013 ?auto_251019 ) ( ON ?auto_251013 ?auto_251021 ) ( CLEAR ?auto_251013 ) ( not ( = ?auto_251013 ?auto_251021 ) ) ( not ( = ?auto_251014 ?auto_251021 ) ) ( not ( = ?auto_251012 ?auto_251021 ) ) ( not ( = ?auto_251015 ?auto_251021 ) ) ( TRUCK-AT ?auto_251017 ?auto_251016 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_251013 ?auto_251014 )
      ( MAKE-2CRATE-VERIFY ?auto_251012 ?auto_251013 ?auto_251014 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_251022 - SURFACE
      ?auto_251023 - SURFACE
      ?auto_251024 - SURFACE
      ?auto_251025 - SURFACE
    )
    :vars
    (
      ?auto_251030 - HOIST
      ?auto_251026 - PLACE
      ?auto_251028 - PLACE
      ?auto_251029 - HOIST
      ?auto_251032 - SURFACE
      ?auto_251031 - SURFACE
      ?auto_251027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251030 ?auto_251026 ) ( IS-CRATE ?auto_251025 ) ( not ( = ?auto_251024 ?auto_251025 ) ) ( not ( = ?auto_251023 ?auto_251024 ) ) ( not ( = ?auto_251023 ?auto_251025 ) ) ( not ( = ?auto_251028 ?auto_251026 ) ) ( HOIST-AT ?auto_251029 ?auto_251028 ) ( not ( = ?auto_251030 ?auto_251029 ) ) ( SURFACE-AT ?auto_251025 ?auto_251028 ) ( ON ?auto_251025 ?auto_251032 ) ( CLEAR ?auto_251025 ) ( not ( = ?auto_251024 ?auto_251032 ) ) ( not ( = ?auto_251025 ?auto_251032 ) ) ( not ( = ?auto_251023 ?auto_251032 ) ) ( SURFACE-AT ?auto_251023 ?auto_251026 ) ( CLEAR ?auto_251023 ) ( IS-CRATE ?auto_251024 ) ( AVAILABLE ?auto_251030 ) ( AVAILABLE ?auto_251029 ) ( SURFACE-AT ?auto_251024 ?auto_251028 ) ( ON ?auto_251024 ?auto_251031 ) ( CLEAR ?auto_251024 ) ( not ( = ?auto_251024 ?auto_251031 ) ) ( not ( = ?auto_251025 ?auto_251031 ) ) ( not ( = ?auto_251023 ?auto_251031 ) ) ( not ( = ?auto_251032 ?auto_251031 ) ) ( TRUCK-AT ?auto_251027 ?auto_251026 ) ( ON ?auto_251023 ?auto_251022 ) ( not ( = ?auto_251022 ?auto_251023 ) ) ( not ( = ?auto_251022 ?auto_251024 ) ) ( not ( = ?auto_251022 ?auto_251025 ) ) ( not ( = ?auto_251022 ?auto_251032 ) ) ( not ( = ?auto_251022 ?auto_251031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251023 ?auto_251024 ?auto_251025 )
      ( MAKE-3CRATE-VERIFY ?auto_251022 ?auto_251023 ?auto_251024 ?auto_251025 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_251033 - SURFACE
      ?auto_251034 - SURFACE
      ?auto_251035 - SURFACE
      ?auto_251036 - SURFACE
      ?auto_251037 - SURFACE
    )
    :vars
    (
      ?auto_251042 - HOIST
      ?auto_251038 - PLACE
      ?auto_251040 - PLACE
      ?auto_251041 - HOIST
      ?auto_251044 - SURFACE
      ?auto_251043 - SURFACE
      ?auto_251039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251042 ?auto_251038 ) ( IS-CRATE ?auto_251037 ) ( not ( = ?auto_251036 ?auto_251037 ) ) ( not ( = ?auto_251035 ?auto_251036 ) ) ( not ( = ?auto_251035 ?auto_251037 ) ) ( not ( = ?auto_251040 ?auto_251038 ) ) ( HOIST-AT ?auto_251041 ?auto_251040 ) ( not ( = ?auto_251042 ?auto_251041 ) ) ( SURFACE-AT ?auto_251037 ?auto_251040 ) ( ON ?auto_251037 ?auto_251044 ) ( CLEAR ?auto_251037 ) ( not ( = ?auto_251036 ?auto_251044 ) ) ( not ( = ?auto_251037 ?auto_251044 ) ) ( not ( = ?auto_251035 ?auto_251044 ) ) ( SURFACE-AT ?auto_251035 ?auto_251038 ) ( CLEAR ?auto_251035 ) ( IS-CRATE ?auto_251036 ) ( AVAILABLE ?auto_251042 ) ( AVAILABLE ?auto_251041 ) ( SURFACE-AT ?auto_251036 ?auto_251040 ) ( ON ?auto_251036 ?auto_251043 ) ( CLEAR ?auto_251036 ) ( not ( = ?auto_251036 ?auto_251043 ) ) ( not ( = ?auto_251037 ?auto_251043 ) ) ( not ( = ?auto_251035 ?auto_251043 ) ) ( not ( = ?auto_251044 ?auto_251043 ) ) ( TRUCK-AT ?auto_251039 ?auto_251038 ) ( ON ?auto_251034 ?auto_251033 ) ( ON ?auto_251035 ?auto_251034 ) ( not ( = ?auto_251033 ?auto_251034 ) ) ( not ( = ?auto_251033 ?auto_251035 ) ) ( not ( = ?auto_251033 ?auto_251036 ) ) ( not ( = ?auto_251033 ?auto_251037 ) ) ( not ( = ?auto_251033 ?auto_251044 ) ) ( not ( = ?auto_251033 ?auto_251043 ) ) ( not ( = ?auto_251034 ?auto_251035 ) ) ( not ( = ?auto_251034 ?auto_251036 ) ) ( not ( = ?auto_251034 ?auto_251037 ) ) ( not ( = ?auto_251034 ?auto_251044 ) ) ( not ( = ?auto_251034 ?auto_251043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251035 ?auto_251036 ?auto_251037 )
      ( MAKE-4CRATE-VERIFY ?auto_251033 ?auto_251034 ?auto_251035 ?auto_251036 ?auto_251037 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_251045 - SURFACE
      ?auto_251046 - SURFACE
      ?auto_251047 - SURFACE
      ?auto_251048 - SURFACE
      ?auto_251049 - SURFACE
      ?auto_251050 - SURFACE
    )
    :vars
    (
      ?auto_251055 - HOIST
      ?auto_251051 - PLACE
      ?auto_251053 - PLACE
      ?auto_251054 - HOIST
      ?auto_251057 - SURFACE
      ?auto_251056 - SURFACE
      ?auto_251052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251055 ?auto_251051 ) ( IS-CRATE ?auto_251050 ) ( not ( = ?auto_251049 ?auto_251050 ) ) ( not ( = ?auto_251048 ?auto_251049 ) ) ( not ( = ?auto_251048 ?auto_251050 ) ) ( not ( = ?auto_251053 ?auto_251051 ) ) ( HOIST-AT ?auto_251054 ?auto_251053 ) ( not ( = ?auto_251055 ?auto_251054 ) ) ( SURFACE-AT ?auto_251050 ?auto_251053 ) ( ON ?auto_251050 ?auto_251057 ) ( CLEAR ?auto_251050 ) ( not ( = ?auto_251049 ?auto_251057 ) ) ( not ( = ?auto_251050 ?auto_251057 ) ) ( not ( = ?auto_251048 ?auto_251057 ) ) ( SURFACE-AT ?auto_251048 ?auto_251051 ) ( CLEAR ?auto_251048 ) ( IS-CRATE ?auto_251049 ) ( AVAILABLE ?auto_251055 ) ( AVAILABLE ?auto_251054 ) ( SURFACE-AT ?auto_251049 ?auto_251053 ) ( ON ?auto_251049 ?auto_251056 ) ( CLEAR ?auto_251049 ) ( not ( = ?auto_251049 ?auto_251056 ) ) ( not ( = ?auto_251050 ?auto_251056 ) ) ( not ( = ?auto_251048 ?auto_251056 ) ) ( not ( = ?auto_251057 ?auto_251056 ) ) ( TRUCK-AT ?auto_251052 ?auto_251051 ) ( ON ?auto_251046 ?auto_251045 ) ( ON ?auto_251047 ?auto_251046 ) ( ON ?auto_251048 ?auto_251047 ) ( not ( = ?auto_251045 ?auto_251046 ) ) ( not ( = ?auto_251045 ?auto_251047 ) ) ( not ( = ?auto_251045 ?auto_251048 ) ) ( not ( = ?auto_251045 ?auto_251049 ) ) ( not ( = ?auto_251045 ?auto_251050 ) ) ( not ( = ?auto_251045 ?auto_251057 ) ) ( not ( = ?auto_251045 ?auto_251056 ) ) ( not ( = ?auto_251046 ?auto_251047 ) ) ( not ( = ?auto_251046 ?auto_251048 ) ) ( not ( = ?auto_251046 ?auto_251049 ) ) ( not ( = ?auto_251046 ?auto_251050 ) ) ( not ( = ?auto_251046 ?auto_251057 ) ) ( not ( = ?auto_251046 ?auto_251056 ) ) ( not ( = ?auto_251047 ?auto_251048 ) ) ( not ( = ?auto_251047 ?auto_251049 ) ) ( not ( = ?auto_251047 ?auto_251050 ) ) ( not ( = ?auto_251047 ?auto_251057 ) ) ( not ( = ?auto_251047 ?auto_251056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251048 ?auto_251049 ?auto_251050 )
      ( MAKE-5CRATE-VERIFY ?auto_251045 ?auto_251046 ?auto_251047 ?auto_251048 ?auto_251049 ?auto_251050 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_251058 - SURFACE
      ?auto_251059 - SURFACE
      ?auto_251060 - SURFACE
      ?auto_251061 - SURFACE
      ?auto_251062 - SURFACE
      ?auto_251063 - SURFACE
      ?auto_251064 - SURFACE
    )
    :vars
    (
      ?auto_251069 - HOIST
      ?auto_251065 - PLACE
      ?auto_251067 - PLACE
      ?auto_251068 - HOIST
      ?auto_251071 - SURFACE
      ?auto_251070 - SURFACE
      ?auto_251066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251069 ?auto_251065 ) ( IS-CRATE ?auto_251064 ) ( not ( = ?auto_251063 ?auto_251064 ) ) ( not ( = ?auto_251062 ?auto_251063 ) ) ( not ( = ?auto_251062 ?auto_251064 ) ) ( not ( = ?auto_251067 ?auto_251065 ) ) ( HOIST-AT ?auto_251068 ?auto_251067 ) ( not ( = ?auto_251069 ?auto_251068 ) ) ( SURFACE-AT ?auto_251064 ?auto_251067 ) ( ON ?auto_251064 ?auto_251071 ) ( CLEAR ?auto_251064 ) ( not ( = ?auto_251063 ?auto_251071 ) ) ( not ( = ?auto_251064 ?auto_251071 ) ) ( not ( = ?auto_251062 ?auto_251071 ) ) ( SURFACE-AT ?auto_251062 ?auto_251065 ) ( CLEAR ?auto_251062 ) ( IS-CRATE ?auto_251063 ) ( AVAILABLE ?auto_251069 ) ( AVAILABLE ?auto_251068 ) ( SURFACE-AT ?auto_251063 ?auto_251067 ) ( ON ?auto_251063 ?auto_251070 ) ( CLEAR ?auto_251063 ) ( not ( = ?auto_251063 ?auto_251070 ) ) ( not ( = ?auto_251064 ?auto_251070 ) ) ( not ( = ?auto_251062 ?auto_251070 ) ) ( not ( = ?auto_251071 ?auto_251070 ) ) ( TRUCK-AT ?auto_251066 ?auto_251065 ) ( ON ?auto_251059 ?auto_251058 ) ( ON ?auto_251060 ?auto_251059 ) ( ON ?auto_251061 ?auto_251060 ) ( ON ?auto_251062 ?auto_251061 ) ( not ( = ?auto_251058 ?auto_251059 ) ) ( not ( = ?auto_251058 ?auto_251060 ) ) ( not ( = ?auto_251058 ?auto_251061 ) ) ( not ( = ?auto_251058 ?auto_251062 ) ) ( not ( = ?auto_251058 ?auto_251063 ) ) ( not ( = ?auto_251058 ?auto_251064 ) ) ( not ( = ?auto_251058 ?auto_251071 ) ) ( not ( = ?auto_251058 ?auto_251070 ) ) ( not ( = ?auto_251059 ?auto_251060 ) ) ( not ( = ?auto_251059 ?auto_251061 ) ) ( not ( = ?auto_251059 ?auto_251062 ) ) ( not ( = ?auto_251059 ?auto_251063 ) ) ( not ( = ?auto_251059 ?auto_251064 ) ) ( not ( = ?auto_251059 ?auto_251071 ) ) ( not ( = ?auto_251059 ?auto_251070 ) ) ( not ( = ?auto_251060 ?auto_251061 ) ) ( not ( = ?auto_251060 ?auto_251062 ) ) ( not ( = ?auto_251060 ?auto_251063 ) ) ( not ( = ?auto_251060 ?auto_251064 ) ) ( not ( = ?auto_251060 ?auto_251071 ) ) ( not ( = ?auto_251060 ?auto_251070 ) ) ( not ( = ?auto_251061 ?auto_251062 ) ) ( not ( = ?auto_251061 ?auto_251063 ) ) ( not ( = ?auto_251061 ?auto_251064 ) ) ( not ( = ?auto_251061 ?auto_251071 ) ) ( not ( = ?auto_251061 ?auto_251070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251062 ?auto_251063 ?auto_251064 )
      ( MAKE-6CRATE-VERIFY ?auto_251058 ?auto_251059 ?auto_251060 ?auto_251061 ?auto_251062 ?auto_251063 ?auto_251064 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_251072 - SURFACE
      ?auto_251073 - SURFACE
      ?auto_251074 - SURFACE
      ?auto_251075 - SURFACE
      ?auto_251076 - SURFACE
      ?auto_251077 - SURFACE
      ?auto_251078 - SURFACE
      ?auto_251079 - SURFACE
    )
    :vars
    (
      ?auto_251084 - HOIST
      ?auto_251080 - PLACE
      ?auto_251082 - PLACE
      ?auto_251083 - HOIST
      ?auto_251086 - SURFACE
      ?auto_251085 - SURFACE
      ?auto_251081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251084 ?auto_251080 ) ( IS-CRATE ?auto_251079 ) ( not ( = ?auto_251078 ?auto_251079 ) ) ( not ( = ?auto_251077 ?auto_251078 ) ) ( not ( = ?auto_251077 ?auto_251079 ) ) ( not ( = ?auto_251082 ?auto_251080 ) ) ( HOIST-AT ?auto_251083 ?auto_251082 ) ( not ( = ?auto_251084 ?auto_251083 ) ) ( SURFACE-AT ?auto_251079 ?auto_251082 ) ( ON ?auto_251079 ?auto_251086 ) ( CLEAR ?auto_251079 ) ( not ( = ?auto_251078 ?auto_251086 ) ) ( not ( = ?auto_251079 ?auto_251086 ) ) ( not ( = ?auto_251077 ?auto_251086 ) ) ( SURFACE-AT ?auto_251077 ?auto_251080 ) ( CLEAR ?auto_251077 ) ( IS-CRATE ?auto_251078 ) ( AVAILABLE ?auto_251084 ) ( AVAILABLE ?auto_251083 ) ( SURFACE-AT ?auto_251078 ?auto_251082 ) ( ON ?auto_251078 ?auto_251085 ) ( CLEAR ?auto_251078 ) ( not ( = ?auto_251078 ?auto_251085 ) ) ( not ( = ?auto_251079 ?auto_251085 ) ) ( not ( = ?auto_251077 ?auto_251085 ) ) ( not ( = ?auto_251086 ?auto_251085 ) ) ( TRUCK-AT ?auto_251081 ?auto_251080 ) ( ON ?auto_251073 ?auto_251072 ) ( ON ?auto_251074 ?auto_251073 ) ( ON ?auto_251075 ?auto_251074 ) ( ON ?auto_251076 ?auto_251075 ) ( ON ?auto_251077 ?auto_251076 ) ( not ( = ?auto_251072 ?auto_251073 ) ) ( not ( = ?auto_251072 ?auto_251074 ) ) ( not ( = ?auto_251072 ?auto_251075 ) ) ( not ( = ?auto_251072 ?auto_251076 ) ) ( not ( = ?auto_251072 ?auto_251077 ) ) ( not ( = ?auto_251072 ?auto_251078 ) ) ( not ( = ?auto_251072 ?auto_251079 ) ) ( not ( = ?auto_251072 ?auto_251086 ) ) ( not ( = ?auto_251072 ?auto_251085 ) ) ( not ( = ?auto_251073 ?auto_251074 ) ) ( not ( = ?auto_251073 ?auto_251075 ) ) ( not ( = ?auto_251073 ?auto_251076 ) ) ( not ( = ?auto_251073 ?auto_251077 ) ) ( not ( = ?auto_251073 ?auto_251078 ) ) ( not ( = ?auto_251073 ?auto_251079 ) ) ( not ( = ?auto_251073 ?auto_251086 ) ) ( not ( = ?auto_251073 ?auto_251085 ) ) ( not ( = ?auto_251074 ?auto_251075 ) ) ( not ( = ?auto_251074 ?auto_251076 ) ) ( not ( = ?auto_251074 ?auto_251077 ) ) ( not ( = ?auto_251074 ?auto_251078 ) ) ( not ( = ?auto_251074 ?auto_251079 ) ) ( not ( = ?auto_251074 ?auto_251086 ) ) ( not ( = ?auto_251074 ?auto_251085 ) ) ( not ( = ?auto_251075 ?auto_251076 ) ) ( not ( = ?auto_251075 ?auto_251077 ) ) ( not ( = ?auto_251075 ?auto_251078 ) ) ( not ( = ?auto_251075 ?auto_251079 ) ) ( not ( = ?auto_251075 ?auto_251086 ) ) ( not ( = ?auto_251075 ?auto_251085 ) ) ( not ( = ?auto_251076 ?auto_251077 ) ) ( not ( = ?auto_251076 ?auto_251078 ) ) ( not ( = ?auto_251076 ?auto_251079 ) ) ( not ( = ?auto_251076 ?auto_251086 ) ) ( not ( = ?auto_251076 ?auto_251085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251077 ?auto_251078 ?auto_251079 )
      ( MAKE-7CRATE-VERIFY ?auto_251072 ?auto_251073 ?auto_251074 ?auto_251075 ?auto_251076 ?auto_251077 ?auto_251078 ?auto_251079 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_251087 - SURFACE
      ?auto_251088 - SURFACE
    )
    :vars
    (
      ?auto_251094 - HOIST
      ?auto_251089 - PLACE
      ?auto_251091 - SURFACE
      ?auto_251092 - PLACE
      ?auto_251093 - HOIST
      ?auto_251096 - SURFACE
      ?auto_251095 - SURFACE
      ?auto_251090 - TRUCK
      ?auto_251097 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_251094 ?auto_251089 ) ( IS-CRATE ?auto_251088 ) ( not ( = ?auto_251087 ?auto_251088 ) ) ( not ( = ?auto_251091 ?auto_251087 ) ) ( not ( = ?auto_251091 ?auto_251088 ) ) ( not ( = ?auto_251092 ?auto_251089 ) ) ( HOIST-AT ?auto_251093 ?auto_251092 ) ( not ( = ?auto_251094 ?auto_251093 ) ) ( SURFACE-AT ?auto_251088 ?auto_251092 ) ( ON ?auto_251088 ?auto_251096 ) ( CLEAR ?auto_251088 ) ( not ( = ?auto_251087 ?auto_251096 ) ) ( not ( = ?auto_251088 ?auto_251096 ) ) ( not ( = ?auto_251091 ?auto_251096 ) ) ( IS-CRATE ?auto_251087 ) ( AVAILABLE ?auto_251093 ) ( SURFACE-AT ?auto_251087 ?auto_251092 ) ( ON ?auto_251087 ?auto_251095 ) ( CLEAR ?auto_251087 ) ( not ( = ?auto_251087 ?auto_251095 ) ) ( not ( = ?auto_251088 ?auto_251095 ) ) ( not ( = ?auto_251091 ?auto_251095 ) ) ( not ( = ?auto_251096 ?auto_251095 ) ) ( TRUCK-AT ?auto_251090 ?auto_251089 ) ( SURFACE-AT ?auto_251097 ?auto_251089 ) ( CLEAR ?auto_251097 ) ( LIFTING ?auto_251094 ?auto_251091 ) ( IS-CRATE ?auto_251091 ) ( not ( = ?auto_251097 ?auto_251091 ) ) ( not ( = ?auto_251087 ?auto_251097 ) ) ( not ( = ?auto_251088 ?auto_251097 ) ) ( not ( = ?auto_251096 ?auto_251097 ) ) ( not ( = ?auto_251095 ?auto_251097 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_251097 ?auto_251091 )
      ( MAKE-2CRATE ?auto_251091 ?auto_251087 ?auto_251088 )
      ( MAKE-1CRATE-VERIFY ?auto_251087 ?auto_251088 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_251098 - SURFACE
      ?auto_251099 - SURFACE
      ?auto_251100 - SURFACE
    )
    :vars
    (
      ?auto_251103 - HOIST
      ?auto_251105 - PLACE
      ?auto_251102 - PLACE
      ?auto_251108 - HOIST
      ?auto_251107 - SURFACE
      ?auto_251106 - SURFACE
      ?auto_251101 - TRUCK
      ?auto_251104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_251103 ?auto_251105 ) ( IS-CRATE ?auto_251100 ) ( not ( = ?auto_251099 ?auto_251100 ) ) ( not ( = ?auto_251098 ?auto_251099 ) ) ( not ( = ?auto_251098 ?auto_251100 ) ) ( not ( = ?auto_251102 ?auto_251105 ) ) ( HOIST-AT ?auto_251108 ?auto_251102 ) ( not ( = ?auto_251103 ?auto_251108 ) ) ( SURFACE-AT ?auto_251100 ?auto_251102 ) ( ON ?auto_251100 ?auto_251107 ) ( CLEAR ?auto_251100 ) ( not ( = ?auto_251099 ?auto_251107 ) ) ( not ( = ?auto_251100 ?auto_251107 ) ) ( not ( = ?auto_251098 ?auto_251107 ) ) ( IS-CRATE ?auto_251099 ) ( AVAILABLE ?auto_251108 ) ( SURFACE-AT ?auto_251099 ?auto_251102 ) ( ON ?auto_251099 ?auto_251106 ) ( CLEAR ?auto_251099 ) ( not ( = ?auto_251099 ?auto_251106 ) ) ( not ( = ?auto_251100 ?auto_251106 ) ) ( not ( = ?auto_251098 ?auto_251106 ) ) ( not ( = ?auto_251107 ?auto_251106 ) ) ( TRUCK-AT ?auto_251101 ?auto_251105 ) ( SURFACE-AT ?auto_251104 ?auto_251105 ) ( CLEAR ?auto_251104 ) ( LIFTING ?auto_251103 ?auto_251098 ) ( IS-CRATE ?auto_251098 ) ( not ( = ?auto_251104 ?auto_251098 ) ) ( not ( = ?auto_251099 ?auto_251104 ) ) ( not ( = ?auto_251100 ?auto_251104 ) ) ( not ( = ?auto_251107 ?auto_251104 ) ) ( not ( = ?auto_251106 ?auto_251104 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_251099 ?auto_251100 )
      ( MAKE-2CRATE-VERIFY ?auto_251098 ?auto_251099 ?auto_251100 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_251109 - SURFACE
      ?auto_251110 - SURFACE
      ?auto_251111 - SURFACE
      ?auto_251112 - SURFACE
    )
    :vars
    (
      ?auto_251114 - HOIST
      ?auto_251119 - PLACE
      ?auto_251116 - PLACE
      ?auto_251115 - HOIST
      ?auto_251117 - SURFACE
      ?auto_251113 - SURFACE
      ?auto_251118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251114 ?auto_251119 ) ( IS-CRATE ?auto_251112 ) ( not ( = ?auto_251111 ?auto_251112 ) ) ( not ( = ?auto_251110 ?auto_251111 ) ) ( not ( = ?auto_251110 ?auto_251112 ) ) ( not ( = ?auto_251116 ?auto_251119 ) ) ( HOIST-AT ?auto_251115 ?auto_251116 ) ( not ( = ?auto_251114 ?auto_251115 ) ) ( SURFACE-AT ?auto_251112 ?auto_251116 ) ( ON ?auto_251112 ?auto_251117 ) ( CLEAR ?auto_251112 ) ( not ( = ?auto_251111 ?auto_251117 ) ) ( not ( = ?auto_251112 ?auto_251117 ) ) ( not ( = ?auto_251110 ?auto_251117 ) ) ( IS-CRATE ?auto_251111 ) ( AVAILABLE ?auto_251115 ) ( SURFACE-AT ?auto_251111 ?auto_251116 ) ( ON ?auto_251111 ?auto_251113 ) ( CLEAR ?auto_251111 ) ( not ( = ?auto_251111 ?auto_251113 ) ) ( not ( = ?auto_251112 ?auto_251113 ) ) ( not ( = ?auto_251110 ?auto_251113 ) ) ( not ( = ?auto_251117 ?auto_251113 ) ) ( TRUCK-AT ?auto_251118 ?auto_251119 ) ( SURFACE-AT ?auto_251109 ?auto_251119 ) ( CLEAR ?auto_251109 ) ( LIFTING ?auto_251114 ?auto_251110 ) ( IS-CRATE ?auto_251110 ) ( not ( = ?auto_251109 ?auto_251110 ) ) ( not ( = ?auto_251111 ?auto_251109 ) ) ( not ( = ?auto_251112 ?auto_251109 ) ) ( not ( = ?auto_251117 ?auto_251109 ) ) ( not ( = ?auto_251113 ?auto_251109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251110 ?auto_251111 ?auto_251112 )
      ( MAKE-3CRATE-VERIFY ?auto_251109 ?auto_251110 ?auto_251111 ?auto_251112 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_251120 - SURFACE
      ?auto_251121 - SURFACE
      ?auto_251122 - SURFACE
      ?auto_251123 - SURFACE
      ?auto_251124 - SURFACE
    )
    :vars
    (
      ?auto_251126 - HOIST
      ?auto_251131 - PLACE
      ?auto_251128 - PLACE
      ?auto_251127 - HOIST
      ?auto_251129 - SURFACE
      ?auto_251125 - SURFACE
      ?auto_251130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251126 ?auto_251131 ) ( IS-CRATE ?auto_251124 ) ( not ( = ?auto_251123 ?auto_251124 ) ) ( not ( = ?auto_251122 ?auto_251123 ) ) ( not ( = ?auto_251122 ?auto_251124 ) ) ( not ( = ?auto_251128 ?auto_251131 ) ) ( HOIST-AT ?auto_251127 ?auto_251128 ) ( not ( = ?auto_251126 ?auto_251127 ) ) ( SURFACE-AT ?auto_251124 ?auto_251128 ) ( ON ?auto_251124 ?auto_251129 ) ( CLEAR ?auto_251124 ) ( not ( = ?auto_251123 ?auto_251129 ) ) ( not ( = ?auto_251124 ?auto_251129 ) ) ( not ( = ?auto_251122 ?auto_251129 ) ) ( IS-CRATE ?auto_251123 ) ( AVAILABLE ?auto_251127 ) ( SURFACE-AT ?auto_251123 ?auto_251128 ) ( ON ?auto_251123 ?auto_251125 ) ( CLEAR ?auto_251123 ) ( not ( = ?auto_251123 ?auto_251125 ) ) ( not ( = ?auto_251124 ?auto_251125 ) ) ( not ( = ?auto_251122 ?auto_251125 ) ) ( not ( = ?auto_251129 ?auto_251125 ) ) ( TRUCK-AT ?auto_251130 ?auto_251131 ) ( SURFACE-AT ?auto_251121 ?auto_251131 ) ( CLEAR ?auto_251121 ) ( LIFTING ?auto_251126 ?auto_251122 ) ( IS-CRATE ?auto_251122 ) ( not ( = ?auto_251121 ?auto_251122 ) ) ( not ( = ?auto_251123 ?auto_251121 ) ) ( not ( = ?auto_251124 ?auto_251121 ) ) ( not ( = ?auto_251129 ?auto_251121 ) ) ( not ( = ?auto_251125 ?auto_251121 ) ) ( ON ?auto_251121 ?auto_251120 ) ( not ( = ?auto_251120 ?auto_251121 ) ) ( not ( = ?auto_251120 ?auto_251122 ) ) ( not ( = ?auto_251120 ?auto_251123 ) ) ( not ( = ?auto_251120 ?auto_251124 ) ) ( not ( = ?auto_251120 ?auto_251129 ) ) ( not ( = ?auto_251120 ?auto_251125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251122 ?auto_251123 ?auto_251124 )
      ( MAKE-4CRATE-VERIFY ?auto_251120 ?auto_251121 ?auto_251122 ?auto_251123 ?auto_251124 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_251132 - SURFACE
      ?auto_251133 - SURFACE
      ?auto_251134 - SURFACE
      ?auto_251135 - SURFACE
      ?auto_251136 - SURFACE
      ?auto_251137 - SURFACE
    )
    :vars
    (
      ?auto_251139 - HOIST
      ?auto_251144 - PLACE
      ?auto_251141 - PLACE
      ?auto_251140 - HOIST
      ?auto_251142 - SURFACE
      ?auto_251138 - SURFACE
      ?auto_251143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251139 ?auto_251144 ) ( IS-CRATE ?auto_251137 ) ( not ( = ?auto_251136 ?auto_251137 ) ) ( not ( = ?auto_251135 ?auto_251136 ) ) ( not ( = ?auto_251135 ?auto_251137 ) ) ( not ( = ?auto_251141 ?auto_251144 ) ) ( HOIST-AT ?auto_251140 ?auto_251141 ) ( not ( = ?auto_251139 ?auto_251140 ) ) ( SURFACE-AT ?auto_251137 ?auto_251141 ) ( ON ?auto_251137 ?auto_251142 ) ( CLEAR ?auto_251137 ) ( not ( = ?auto_251136 ?auto_251142 ) ) ( not ( = ?auto_251137 ?auto_251142 ) ) ( not ( = ?auto_251135 ?auto_251142 ) ) ( IS-CRATE ?auto_251136 ) ( AVAILABLE ?auto_251140 ) ( SURFACE-AT ?auto_251136 ?auto_251141 ) ( ON ?auto_251136 ?auto_251138 ) ( CLEAR ?auto_251136 ) ( not ( = ?auto_251136 ?auto_251138 ) ) ( not ( = ?auto_251137 ?auto_251138 ) ) ( not ( = ?auto_251135 ?auto_251138 ) ) ( not ( = ?auto_251142 ?auto_251138 ) ) ( TRUCK-AT ?auto_251143 ?auto_251144 ) ( SURFACE-AT ?auto_251134 ?auto_251144 ) ( CLEAR ?auto_251134 ) ( LIFTING ?auto_251139 ?auto_251135 ) ( IS-CRATE ?auto_251135 ) ( not ( = ?auto_251134 ?auto_251135 ) ) ( not ( = ?auto_251136 ?auto_251134 ) ) ( not ( = ?auto_251137 ?auto_251134 ) ) ( not ( = ?auto_251142 ?auto_251134 ) ) ( not ( = ?auto_251138 ?auto_251134 ) ) ( ON ?auto_251133 ?auto_251132 ) ( ON ?auto_251134 ?auto_251133 ) ( not ( = ?auto_251132 ?auto_251133 ) ) ( not ( = ?auto_251132 ?auto_251134 ) ) ( not ( = ?auto_251132 ?auto_251135 ) ) ( not ( = ?auto_251132 ?auto_251136 ) ) ( not ( = ?auto_251132 ?auto_251137 ) ) ( not ( = ?auto_251132 ?auto_251142 ) ) ( not ( = ?auto_251132 ?auto_251138 ) ) ( not ( = ?auto_251133 ?auto_251134 ) ) ( not ( = ?auto_251133 ?auto_251135 ) ) ( not ( = ?auto_251133 ?auto_251136 ) ) ( not ( = ?auto_251133 ?auto_251137 ) ) ( not ( = ?auto_251133 ?auto_251142 ) ) ( not ( = ?auto_251133 ?auto_251138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251135 ?auto_251136 ?auto_251137 )
      ( MAKE-5CRATE-VERIFY ?auto_251132 ?auto_251133 ?auto_251134 ?auto_251135 ?auto_251136 ?auto_251137 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_251145 - SURFACE
      ?auto_251146 - SURFACE
      ?auto_251147 - SURFACE
      ?auto_251148 - SURFACE
      ?auto_251149 - SURFACE
      ?auto_251150 - SURFACE
      ?auto_251151 - SURFACE
    )
    :vars
    (
      ?auto_251153 - HOIST
      ?auto_251158 - PLACE
      ?auto_251155 - PLACE
      ?auto_251154 - HOIST
      ?auto_251156 - SURFACE
      ?auto_251152 - SURFACE
      ?auto_251157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251153 ?auto_251158 ) ( IS-CRATE ?auto_251151 ) ( not ( = ?auto_251150 ?auto_251151 ) ) ( not ( = ?auto_251149 ?auto_251150 ) ) ( not ( = ?auto_251149 ?auto_251151 ) ) ( not ( = ?auto_251155 ?auto_251158 ) ) ( HOIST-AT ?auto_251154 ?auto_251155 ) ( not ( = ?auto_251153 ?auto_251154 ) ) ( SURFACE-AT ?auto_251151 ?auto_251155 ) ( ON ?auto_251151 ?auto_251156 ) ( CLEAR ?auto_251151 ) ( not ( = ?auto_251150 ?auto_251156 ) ) ( not ( = ?auto_251151 ?auto_251156 ) ) ( not ( = ?auto_251149 ?auto_251156 ) ) ( IS-CRATE ?auto_251150 ) ( AVAILABLE ?auto_251154 ) ( SURFACE-AT ?auto_251150 ?auto_251155 ) ( ON ?auto_251150 ?auto_251152 ) ( CLEAR ?auto_251150 ) ( not ( = ?auto_251150 ?auto_251152 ) ) ( not ( = ?auto_251151 ?auto_251152 ) ) ( not ( = ?auto_251149 ?auto_251152 ) ) ( not ( = ?auto_251156 ?auto_251152 ) ) ( TRUCK-AT ?auto_251157 ?auto_251158 ) ( SURFACE-AT ?auto_251148 ?auto_251158 ) ( CLEAR ?auto_251148 ) ( LIFTING ?auto_251153 ?auto_251149 ) ( IS-CRATE ?auto_251149 ) ( not ( = ?auto_251148 ?auto_251149 ) ) ( not ( = ?auto_251150 ?auto_251148 ) ) ( not ( = ?auto_251151 ?auto_251148 ) ) ( not ( = ?auto_251156 ?auto_251148 ) ) ( not ( = ?auto_251152 ?auto_251148 ) ) ( ON ?auto_251146 ?auto_251145 ) ( ON ?auto_251147 ?auto_251146 ) ( ON ?auto_251148 ?auto_251147 ) ( not ( = ?auto_251145 ?auto_251146 ) ) ( not ( = ?auto_251145 ?auto_251147 ) ) ( not ( = ?auto_251145 ?auto_251148 ) ) ( not ( = ?auto_251145 ?auto_251149 ) ) ( not ( = ?auto_251145 ?auto_251150 ) ) ( not ( = ?auto_251145 ?auto_251151 ) ) ( not ( = ?auto_251145 ?auto_251156 ) ) ( not ( = ?auto_251145 ?auto_251152 ) ) ( not ( = ?auto_251146 ?auto_251147 ) ) ( not ( = ?auto_251146 ?auto_251148 ) ) ( not ( = ?auto_251146 ?auto_251149 ) ) ( not ( = ?auto_251146 ?auto_251150 ) ) ( not ( = ?auto_251146 ?auto_251151 ) ) ( not ( = ?auto_251146 ?auto_251156 ) ) ( not ( = ?auto_251146 ?auto_251152 ) ) ( not ( = ?auto_251147 ?auto_251148 ) ) ( not ( = ?auto_251147 ?auto_251149 ) ) ( not ( = ?auto_251147 ?auto_251150 ) ) ( not ( = ?auto_251147 ?auto_251151 ) ) ( not ( = ?auto_251147 ?auto_251156 ) ) ( not ( = ?auto_251147 ?auto_251152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251149 ?auto_251150 ?auto_251151 )
      ( MAKE-6CRATE-VERIFY ?auto_251145 ?auto_251146 ?auto_251147 ?auto_251148 ?auto_251149 ?auto_251150 ?auto_251151 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_251159 - SURFACE
      ?auto_251160 - SURFACE
      ?auto_251161 - SURFACE
      ?auto_251162 - SURFACE
      ?auto_251163 - SURFACE
      ?auto_251164 - SURFACE
      ?auto_251165 - SURFACE
      ?auto_251166 - SURFACE
    )
    :vars
    (
      ?auto_251168 - HOIST
      ?auto_251173 - PLACE
      ?auto_251170 - PLACE
      ?auto_251169 - HOIST
      ?auto_251171 - SURFACE
      ?auto_251167 - SURFACE
      ?auto_251172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251168 ?auto_251173 ) ( IS-CRATE ?auto_251166 ) ( not ( = ?auto_251165 ?auto_251166 ) ) ( not ( = ?auto_251164 ?auto_251165 ) ) ( not ( = ?auto_251164 ?auto_251166 ) ) ( not ( = ?auto_251170 ?auto_251173 ) ) ( HOIST-AT ?auto_251169 ?auto_251170 ) ( not ( = ?auto_251168 ?auto_251169 ) ) ( SURFACE-AT ?auto_251166 ?auto_251170 ) ( ON ?auto_251166 ?auto_251171 ) ( CLEAR ?auto_251166 ) ( not ( = ?auto_251165 ?auto_251171 ) ) ( not ( = ?auto_251166 ?auto_251171 ) ) ( not ( = ?auto_251164 ?auto_251171 ) ) ( IS-CRATE ?auto_251165 ) ( AVAILABLE ?auto_251169 ) ( SURFACE-AT ?auto_251165 ?auto_251170 ) ( ON ?auto_251165 ?auto_251167 ) ( CLEAR ?auto_251165 ) ( not ( = ?auto_251165 ?auto_251167 ) ) ( not ( = ?auto_251166 ?auto_251167 ) ) ( not ( = ?auto_251164 ?auto_251167 ) ) ( not ( = ?auto_251171 ?auto_251167 ) ) ( TRUCK-AT ?auto_251172 ?auto_251173 ) ( SURFACE-AT ?auto_251163 ?auto_251173 ) ( CLEAR ?auto_251163 ) ( LIFTING ?auto_251168 ?auto_251164 ) ( IS-CRATE ?auto_251164 ) ( not ( = ?auto_251163 ?auto_251164 ) ) ( not ( = ?auto_251165 ?auto_251163 ) ) ( not ( = ?auto_251166 ?auto_251163 ) ) ( not ( = ?auto_251171 ?auto_251163 ) ) ( not ( = ?auto_251167 ?auto_251163 ) ) ( ON ?auto_251160 ?auto_251159 ) ( ON ?auto_251161 ?auto_251160 ) ( ON ?auto_251162 ?auto_251161 ) ( ON ?auto_251163 ?auto_251162 ) ( not ( = ?auto_251159 ?auto_251160 ) ) ( not ( = ?auto_251159 ?auto_251161 ) ) ( not ( = ?auto_251159 ?auto_251162 ) ) ( not ( = ?auto_251159 ?auto_251163 ) ) ( not ( = ?auto_251159 ?auto_251164 ) ) ( not ( = ?auto_251159 ?auto_251165 ) ) ( not ( = ?auto_251159 ?auto_251166 ) ) ( not ( = ?auto_251159 ?auto_251171 ) ) ( not ( = ?auto_251159 ?auto_251167 ) ) ( not ( = ?auto_251160 ?auto_251161 ) ) ( not ( = ?auto_251160 ?auto_251162 ) ) ( not ( = ?auto_251160 ?auto_251163 ) ) ( not ( = ?auto_251160 ?auto_251164 ) ) ( not ( = ?auto_251160 ?auto_251165 ) ) ( not ( = ?auto_251160 ?auto_251166 ) ) ( not ( = ?auto_251160 ?auto_251171 ) ) ( not ( = ?auto_251160 ?auto_251167 ) ) ( not ( = ?auto_251161 ?auto_251162 ) ) ( not ( = ?auto_251161 ?auto_251163 ) ) ( not ( = ?auto_251161 ?auto_251164 ) ) ( not ( = ?auto_251161 ?auto_251165 ) ) ( not ( = ?auto_251161 ?auto_251166 ) ) ( not ( = ?auto_251161 ?auto_251171 ) ) ( not ( = ?auto_251161 ?auto_251167 ) ) ( not ( = ?auto_251162 ?auto_251163 ) ) ( not ( = ?auto_251162 ?auto_251164 ) ) ( not ( = ?auto_251162 ?auto_251165 ) ) ( not ( = ?auto_251162 ?auto_251166 ) ) ( not ( = ?auto_251162 ?auto_251171 ) ) ( not ( = ?auto_251162 ?auto_251167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251164 ?auto_251165 ?auto_251166 )
      ( MAKE-7CRATE-VERIFY ?auto_251159 ?auto_251160 ?auto_251161 ?auto_251162 ?auto_251163 ?auto_251164 ?auto_251165 ?auto_251166 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_253624 - SURFACE
      ?auto_253625 - SURFACE
      ?auto_253626 - SURFACE
      ?auto_253627 - SURFACE
      ?auto_253628 - SURFACE
      ?auto_253629 - SURFACE
      ?auto_253630 - SURFACE
      ?auto_253631 - SURFACE
      ?auto_253632 - SURFACE
    )
    :vars
    (
      ?auto_253634 - HOIST
      ?auto_253633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253634 ?auto_253633 ) ( SURFACE-AT ?auto_253631 ?auto_253633 ) ( CLEAR ?auto_253631 ) ( LIFTING ?auto_253634 ?auto_253632 ) ( IS-CRATE ?auto_253632 ) ( not ( = ?auto_253631 ?auto_253632 ) ) ( ON ?auto_253625 ?auto_253624 ) ( ON ?auto_253626 ?auto_253625 ) ( ON ?auto_253627 ?auto_253626 ) ( ON ?auto_253628 ?auto_253627 ) ( ON ?auto_253629 ?auto_253628 ) ( ON ?auto_253630 ?auto_253629 ) ( ON ?auto_253631 ?auto_253630 ) ( not ( = ?auto_253624 ?auto_253625 ) ) ( not ( = ?auto_253624 ?auto_253626 ) ) ( not ( = ?auto_253624 ?auto_253627 ) ) ( not ( = ?auto_253624 ?auto_253628 ) ) ( not ( = ?auto_253624 ?auto_253629 ) ) ( not ( = ?auto_253624 ?auto_253630 ) ) ( not ( = ?auto_253624 ?auto_253631 ) ) ( not ( = ?auto_253624 ?auto_253632 ) ) ( not ( = ?auto_253625 ?auto_253626 ) ) ( not ( = ?auto_253625 ?auto_253627 ) ) ( not ( = ?auto_253625 ?auto_253628 ) ) ( not ( = ?auto_253625 ?auto_253629 ) ) ( not ( = ?auto_253625 ?auto_253630 ) ) ( not ( = ?auto_253625 ?auto_253631 ) ) ( not ( = ?auto_253625 ?auto_253632 ) ) ( not ( = ?auto_253626 ?auto_253627 ) ) ( not ( = ?auto_253626 ?auto_253628 ) ) ( not ( = ?auto_253626 ?auto_253629 ) ) ( not ( = ?auto_253626 ?auto_253630 ) ) ( not ( = ?auto_253626 ?auto_253631 ) ) ( not ( = ?auto_253626 ?auto_253632 ) ) ( not ( = ?auto_253627 ?auto_253628 ) ) ( not ( = ?auto_253627 ?auto_253629 ) ) ( not ( = ?auto_253627 ?auto_253630 ) ) ( not ( = ?auto_253627 ?auto_253631 ) ) ( not ( = ?auto_253627 ?auto_253632 ) ) ( not ( = ?auto_253628 ?auto_253629 ) ) ( not ( = ?auto_253628 ?auto_253630 ) ) ( not ( = ?auto_253628 ?auto_253631 ) ) ( not ( = ?auto_253628 ?auto_253632 ) ) ( not ( = ?auto_253629 ?auto_253630 ) ) ( not ( = ?auto_253629 ?auto_253631 ) ) ( not ( = ?auto_253629 ?auto_253632 ) ) ( not ( = ?auto_253630 ?auto_253631 ) ) ( not ( = ?auto_253630 ?auto_253632 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_253631 ?auto_253632 )
      ( MAKE-8CRATE-VERIFY ?auto_253624 ?auto_253625 ?auto_253626 ?auto_253627 ?auto_253628 ?auto_253629 ?auto_253630 ?auto_253631 ?auto_253632 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_253691 - SURFACE
      ?auto_253692 - SURFACE
      ?auto_253693 - SURFACE
      ?auto_253694 - SURFACE
      ?auto_253695 - SURFACE
      ?auto_253696 - SURFACE
      ?auto_253697 - SURFACE
      ?auto_253698 - SURFACE
      ?auto_253699 - SURFACE
    )
    :vars
    (
      ?auto_253700 - HOIST
      ?auto_253702 - PLACE
      ?auto_253701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_253700 ?auto_253702 ) ( SURFACE-AT ?auto_253698 ?auto_253702 ) ( CLEAR ?auto_253698 ) ( IS-CRATE ?auto_253699 ) ( not ( = ?auto_253698 ?auto_253699 ) ) ( TRUCK-AT ?auto_253701 ?auto_253702 ) ( AVAILABLE ?auto_253700 ) ( IN ?auto_253699 ?auto_253701 ) ( ON ?auto_253698 ?auto_253697 ) ( not ( = ?auto_253697 ?auto_253698 ) ) ( not ( = ?auto_253697 ?auto_253699 ) ) ( ON ?auto_253692 ?auto_253691 ) ( ON ?auto_253693 ?auto_253692 ) ( ON ?auto_253694 ?auto_253693 ) ( ON ?auto_253695 ?auto_253694 ) ( ON ?auto_253696 ?auto_253695 ) ( ON ?auto_253697 ?auto_253696 ) ( not ( = ?auto_253691 ?auto_253692 ) ) ( not ( = ?auto_253691 ?auto_253693 ) ) ( not ( = ?auto_253691 ?auto_253694 ) ) ( not ( = ?auto_253691 ?auto_253695 ) ) ( not ( = ?auto_253691 ?auto_253696 ) ) ( not ( = ?auto_253691 ?auto_253697 ) ) ( not ( = ?auto_253691 ?auto_253698 ) ) ( not ( = ?auto_253691 ?auto_253699 ) ) ( not ( = ?auto_253692 ?auto_253693 ) ) ( not ( = ?auto_253692 ?auto_253694 ) ) ( not ( = ?auto_253692 ?auto_253695 ) ) ( not ( = ?auto_253692 ?auto_253696 ) ) ( not ( = ?auto_253692 ?auto_253697 ) ) ( not ( = ?auto_253692 ?auto_253698 ) ) ( not ( = ?auto_253692 ?auto_253699 ) ) ( not ( = ?auto_253693 ?auto_253694 ) ) ( not ( = ?auto_253693 ?auto_253695 ) ) ( not ( = ?auto_253693 ?auto_253696 ) ) ( not ( = ?auto_253693 ?auto_253697 ) ) ( not ( = ?auto_253693 ?auto_253698 ) ) ( not ( = ?auto_253693 ?auto_253699 ) ) ( not ( = ?auto_253694 ?auto_253695 ) ) ( not ( = ?auto_253694 ?auto_253696 ) ) ( not ( = ?auto_253694 ?auto_253697 ) ) ( not ( = ?auto_253694 ?auto_253698 ) ) ( not ( = ?auto_253694 ?auto_253699 ) ) ( not ( = ?auto_253695 ?auto_253696 ) ) ( not ( = ?auto_253695 ?auto_253697 ) ) ( not ( = ?auto_253695 ?auto_253698 ) ) ( not ( = ?auto_253695 ?auto_253699 ) ) ( not ( = ?auto_253696 ?auto_253697 ) ) ( not ( = ?auto_253696 ?auto_253698 ) ) ( not ( = ?auto_253696 ?auto_253699 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_253697 ?auto_253698 ?auto_253699 )
      ( MAKE-8CRATE-VERIFY ?auto_253691 ?auto_253692 ?auto_253693 ?auto_253694 ?auto_253695 ?auto_253696 ?auto_253697 ?auto_253698 ?auto_253699 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_253767 - SURFACE
      ?auto_253768 - SURFACE
      ?auto_253769 - SURFACE
      ?auto_253770 - SURFACE
      ?auto_253771 - SURFACE
      ?auto_253772 - SURFACE
      ?auto_253773 - SURFACE
      ?auto_253774 - SURFACE
      ?auto_253775 - SURFACE
    )
    :vars
    (
      ?auto_253777 - HOIST
      ?auto_253778 - PLACE
      ?auto_253779 - TRUCK
      ?auto_253776 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253777 ?auto_253778 ) ( SURFACE-AT ?auto_253774 ?auto_253778 ) ( CLEAR ?auto_253774 ) ( IS-CRATE ?auto_253775 ) ( not ( = ?auto_253774 ?auto_253775 ) ) ( AVAILABLE ?auto_253777 ) ( IN ?auto_253775 ?auto_253779 ) ( ON ?auto_253774 ?auto_253773 ) ( not ( = ?auto_253773 ?auto_253774 ) ) ( not ( = ?auto_253773 ?auto_253775 ) ) ( TRUCK-AT ?auto_253779 ?auto_253776 ) ( not ( = ?auto_253776 ?auto_253778 ) ) ( ON ?auto_253768 ?auto_253767 ) ( ON ?auto_253769 ?auto_253768 ) ( ON ?auto_253770 ?auto_253769 ) ( ON ?auto_253771 ?auto_253770 ) ( ON ?auto_253772 ?auto_253771 ) ( ON ?auto_253773 ?auto_253772 ) ( not ( = ?auto_253767 ?auto_253768 ) ) ( not ( = ?auto_253767 ?auto_253769 ) ) ( not ( = ?auto_253767 ?auto_253770 ) ) ( not ( = ?auto_253767 ?auto_253771 ) ) ( not ( = ?auto_253767 ?auto_253772 ) ) ( not ( = ?auto_253767 ?auto_253773 ) ) ( not ( = ?auto_253767 ?auto_253774 ) ) ( not ( = ?auto_253767 ?auto_253775 ) ) ( not ( = ?auto_253768 ?auto_253769 ) ) ( not ( = ?auto_253768 ?auto_253770 ) ) ( not ( = ?auto_253768 ?auto_253771 ) ) ( not ( = ?auto_253768 ?auto_253772 ) ) ( not ( = ?auto_253768 ?auto_253773 ) ) ( not ( = ?auto_253768 ?auto_253774 ) ) ( not ( = ?auto_253768 ?auto_253775 ) ) ( not ( = ?auto_253769 ?auto_253770 ) ) ( not ( = ?auto_253769 ?auto_253771 ) ) ( not ( = ?auto_253769 ?auto_253772 ) ) ( not ( = ?auto_253769 ?auto_253773 ) ) ( not ( = ?auto_253769 ?auto_253774 ) ) ( not ( = ?auto_253769 ?auto_253775 ) ) ( not ( = ?auto_253770 ?auto_253771 ) ) ( not ( = ?auto_253770 ?auto_253772 ) ) ( not ( = ?auto_253770 ?auto_253773 ) ) ( not ( = ?auto_253770 ?auto_253774 ) ) ( not ( = ?auto_253770 ?auto_253775 ) ) ( not ( = ?auto_253771 ?auto_253772 ) ) ( not ( = ?auto_253771 ?auto_253773 ) ) ( not ( = ?auto_253771 ?auto_253774 ) ) ( not ( = ?auto_253771 ?auto_253775 ) ) ( not ( = ?auto_253772 ?auto_253773 ) ) ( not ( = ?auto_253772 ?auto_253774 ) ) ( not ( = ?auto_253772 ?auto_253775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_253773 ?auto_253774 ?auto_253775 )
      ( MAKE-8CRATE-VERIFY ?auto_253767 ?auto_253768 ?auto_253769 ?auto_253770 ?auto_253771 ?auto_253772 ?auto_253773 ?auto_253774 ?auto_253775 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_253851 - SURFACE
      ?auto_253852 - SURFACE
      ?auto_253853 - SURFACE
      ?auto_253854 - SURFACE
      ?auto_253855 - SURFACE
      ?auto_253856 - SURFACE
      ?auto_253857 - SURFACE
      ?auto_253858 - SURFACE
      ?auto_253859 - SURFACE
    )
    :vars
    (
      ?auto_253861 - HOIST
      ?auto_253864 - PLACE
      ?auto_253862 - TRUCK
      ?auto_253860 - PLACE
      ?auto_253863 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_253861 ?auto_253864 ) ( SURFACE-AT ?auto_253858 ?auto_253864 ) ( CLEAR ?auto_253858 ) ( IS-CRATE ?auto_253859 ) ( not ( = ?auto_253858 ?auto_253859 ) ) ( AVAILABLE ?auto_253861 ) ( ON ?auto_253858 ?auto_253857 ) ( not ( = ?auto_253857 ?auto_253858 ) ) ( not ( = ?auto_253857 ?auto_253859 ) ) ( TRUCK-AT ?auto_253862 ?auto_253860 ) ( not ( = ?auto_253860 ?auto_253864 ) ) ( HOIST-AT ?auto_253863 ?auto_253860 ) ( LIFTING ?auto_253863 ?auto_253859 ) ( not ( = ?auto_253861 ?auto_253863 ) ) ( ON ?auto_253852 ?auto_253851 ) ( ON ?auto_253853 ?auto_253852 ) ( ON ?auto_253854 ?auto_253853 ) ( ON ?auto_253855 ?auto_253854 ) ( ON ?auto_253856 ?auto_253855 ) ( ON ?auto_253857 ?auto_253856 ) ( not ( = ?auto_253851 ?auto_253852 ) ) ( not ( = ?auto_253851 ?auto_253853 ) ) ( not ( = ?auto_253851 ?auto_253854 ) ) ( not ( = ?auto_253851 ?auto_253855 ) ) ( not ( = ?auto_253851 ?auto_253856 ) ) ( not ( = ?auto_253851 ?auto_253857 ) ) ( not ( = ?auto_253851 ?auto_253858 ) ) ( not ( = ?auto_253851 ?auto_253859 ) ) ( not ( = ?auto_253852 ?auto_253853 ) ) ( not ( = ?auto_253852 ?auto_253854 ) ) ( not ( = ?auto_253852 ?auto_253855 ) ) ( not ( = ?auto_253852 ?auto_253856 ) ) ( not ( = ?auto_253852 ?auto_253857 ) ) ( not ( = ?auto_253852 ?auto_253858 ) ) ( not ( = ?auto_253852 ?auto_253859 ) ) ( not ( = ?auto_253853 ?auto_253854 ) ) ( not ( = ?auto_253853 ?auto_253855 ) ) ( not ( = ?auto_253853 ?auto_253856 ) ) ( not ( = ?auto_253853 ?auto_253857 ) ) ( not ( = ?auto_253853 ?auto_253858 ) ) ( not ( = ?auto_253853 ?auto_253859 ) ) ( not ( = ?auto_253854 ?auto_253855 ) ) ( not ( = ?auto_253854 ?auto_253856 ) ) ( not ( = ?auto_253854 ?auto_253857 ) ) ( not ( = ?auto_253854 ?auto_253858 ) ) ( not ( = ?auto_253854 ?auto_253859 ) ) ( not ( = ?auto_253855 ?auto_253856 ) ) ( not ( = ?auto_253855 ?auto_253857 ) ) ( not ( = ?auto_253855 ?auto_253858 ) ) ( not ( = ?auto_253855 ?auto_253859 ) ) ( not ( = ?auto_253856 ?auto_253857 ) ) ( not ( = ?auto_253856 ?auto_253858 ) ) ( not ( = ?auto_253856 ?auto_253859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_253857 ?auto_253858 ?auto_253859 )
      ( MAKE-8CRATE-VERIFY ?auto_253851 ?auto_253852 ?auto_253853 ?auto_253854 ?auto_253855 ?auto_253856 ?auto_253857 ?auto_253858 ?auto_253859 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_253943 - SURFACE
      ?auto_253944 - SURFACE
      ?auto_253945 - SURFACE
      ?auto_253946 - SURFACE
      ?auto_253947 - SURFACE
      ?auto_253948 - SURFACE
      ?auto_253949 - SURFACE
      ?auto_253950 - SURFACE
      ?auto_253951 - SURFACE
    )
    :vars
    (
      ?auto_253952 - HOIST
      ?auto_253955 - PLACE
      ?auto_253953 - TRUCK
      ?auto_253956 - PLACE
      ?auto_253954 - HOIST
      ?auto_253957 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253952 ?auto_253955 ) ( SURFACE-AT ?auto_253950 ?auto_253955 ) ( CLEAR ?auto_253950 ) ( IS-CRATE ?auto_253951 ) ( not ( = ?auto_253950 ?auto_253951 ) ) ( AVAILABLE ?auto_253952 ) ( ON ?auto_253950 ?auto_253949 ) ( not ( = ?auto_253949 ?auto_253950 ) ) ( not ( = ?auto_253949 ?auto_253951 ) ) ( TRUCK-AT ?auto_253953 ?auto_253956 ) ( not ( = ?auto_253956 ?auto_253955 ) ) ( HOIST-AT ?auto_253954 ?auto_253956 ) ( not ( = ?auto_253952 ?auto_253954 ) ) ( AVAILABLE ?auto_253954 ) ( SURFACE-AT ?auto_253951 ?auto_253956 ) ( ON ?auto_253951 ?auto_253957 ) ( CLEAR ?auto_253951 ) ( not ( = ?auto_253950 ?auto_253957 ) ) ( not ( = ?auto_253951 ?auto_253957 ) ) ( not ( = ?auto_253949 ?auto_253957 ) ) ( ON ?auto_253944 ?auto_253943 ) ( ON ?auto_253945 ?auto_253944 ) ( ON ?auto_253946 ?auto_253945 ) ( ON ?auto_253947 ?auto_253946 ) ( ON ?auto_253948 ?auto_253947 ) ( ON ?auto_253949 ?auto_253948 ) ( not ( = ?auto_253943 ?auto_253944 ) ) ( not ( = ?auto_253943 ?auto_253945 ) ) ( not ( = ?auto_253943 ?auto_253946 ) ) ( not ( = ?auto_253943 ?auto_253947 ) ) ( not ( = ?auto_253943 ?auto_253948 ) ) ( not ( = ?auto_253943 ?auto_253949 ) ) ( not ( = ?auto_253943 ?auto_253950 ) ) ( not ( = ?auto_253943 ?auto_253951 ) ) ( not ( = ?auto_253943 ?auto_253957 ) ) ( not ( = ?auto_253944 ?auto_253945 ) ) ( not ( = ?auto_253944 ?auto_253946 ) ) ( not ( = ?auto_253944 ?auto_253947 ) ) ( not ( = ?auto_253944 ?auto_253948 ) ) ( not ( = ?auto_253944 ?auto_253949 ) ) ( not ( = ?auto_253944 ?auto_253950 ) ) ( not ( = ?auto_253944 ?auto_253951 ) ) ( not ( = ?auto_253944 ?auto_253957 ) ) ( not ( = ?auto_253945 ?auto_253946 ) ) ( not ( = ?auto_253945 ?auto_253947 ) ) ( not ( = ?auto_253945 ?auto_253948 ) ) ( not ( = ?auto_253945 ?auto_253949 ) ) ( not ( = ?auto_253945 ?auto_253950 ) ) ( not ( = ?auto_253945 ?auto_253951 ) ) ( not ( = ?auto_253945 ?auto_253957 ) ) ( not ( = ?auto_253946 ?auto_253947 ) ) ( not ( = ?auto_253946 ?auto_253948 ) ) ( not ( = ?auto_253946 ?auto_253949 ) ) ( not ( = ?auto_253946 ?auto_253950 ) ) ( not ( = ?auto_253946 ?auto_253951 ) ) ( not ( = ?auto_253946 ?auto_253957 ) ) ( not ( = ?auto_253947 ?auto_253948 ) ) ( not ( = ?auto_253947 ?auto_253949 ) ) ( not ( = ?auto_253947 ?auto_253950 ) ) ( not ( = ?auto_253947 ?auto_253951 ) ) ( not ( = ?auto_253947 ?auto_253957 ) ) ( not ( = ?auto_253948 ?auto_253949 ) ) ( not ( = ?auto_253948 ?auto_253950 ) ) ( not ( = ?auto_253948 ?auto_253951 ) ) ( not ( = ?auto_253948 ?auto_253957 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_253949 ?auto_253950 ?auto_253951 )
      ( MAKE-8CRATE-VERIFY ?auto_253943 ?auto_253944 ?auto_253945 ?auto_253946 ?auto_253947 ?auto_253948 ?auto_253949 ?auto_253950 ?auto_253951 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254036 - SURFACE
      ?auto_254037 - SURFACE
      ?auto_254038 - SURFACE
      ?auto_254039 - SURFACE
      ?auto_254040 - SURFACE
      ?auto_254041 - SURFACE
      ?auto_254042 - SURFACE
      ?auto_254043 - SURFACE
      ?auto_254044 - SURFACE
    )
    :vars
    (
      ?auto_254050 - HOIST
      ?auto_254048 - PLACE
      ?auto_254047 - PLACE
      ?auto_254045 - HOIST
      ?auto_254046 - SURFACE
      ?auto_254049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_254050 ?auto_254048 ) ( SURFACE-AT ?auto_254043 ?auto_254048 ) ( CLEAR ?auto_254043 ) ( IS-CRATE ?auto_254044 ) ( not ( = ?auto_254043 ?auto_254044 ) ) ( AVAILABLE ?auto_254050 ) ( ON ?auto_254043 ?auto_254042 ) ( not ( = ?auto_254042 ?auto_254043 ) ) ( not ( = ?auto_254042 ?auto_254044 ) ) ( not ( = ?auto_254047 ?auto_254048 ) ) ( HOIST-AT ?auto_254045 ?auto_254047 ) ( not ( = ?auto_254050 ?auto_254045 ) ) ( AVAILABLE ?auto_254045 ) ( SURFACE-AT ?auto_254044 ?auto_254047 ) ( ON ?auto_254044 ?auto_254046 ) ( CLEAR ?auto_254044 ) ( not ( = ?auto_254043 ?auto_254046 ) ) ( not ( = ?auto_254044 ?auto_254046 ) ) ( not ( = ?auto_254042 ?auto_254046 ) ) ( TRUCK-AT ?auto_254049 ?auto_254048 ) ( ON ?auto_254037 ?auto_254036 ) ( ON ?auto_254038 ?auto_254037 ) ( ON ?auto_254039 ?auto_254038 ) ( ON ?auto_254040 ?auto_254039 ) ( ON ?auto_254041 ?auto_254040 ) ( ON ?auto_254042 ?auto_254041 ) ( not ( = ?auto_254036 ?auto_254037 ) ) ( not ( = ?auto_254036 ?auto_254038 ) ) ( not ( = ?auto_254036 ?auto_254039 ) ) ( not ( = ?auto_254036 ?auto_254040 ) ) ( not ( = ?auto_254036 ?auto_254041 ) ) ( not ( = ?auto_254036 ?auto_254042 ) ) ( not ( = ?auto_254036 ?auto_254043 ) ) ( not ( = ?auto_254036 ?auto_254044 ) ) ( not ( = ?auto_254036 ?auto_254046 ) ) ( not ( = ?auto_254037 ?auto_254038 ) ) ( not ( = ?auto_254037 ?auto_254039 ) ) ( not ( = ?auto_254037 ?auto_254040 ) ) ( not ( = ?auto_254037 ?auto_254041 ) ) ( not ( = ?auto_254037 ?auto_254042 ) ) ( not ( = ?auto_254037 ?auto_254043 ) ) ( not ( = ?auto_254037 ?auto_254044 ) ) ( not ( = ?auto_254037 ?auto_254046 ) ) ( not ( = ?auto_254038 ?auto_254039 ) ) ( not ( = ?auto_254038 ?auto_254040 ) ) ( not ( = ?auto_254038 ?auto_254041 ) ) ( not ( = ?auto_254038 ?auto_254042 ) ) ( not ( = ?auto_254038 ?auto_254043 ) ) ( not ( = ?auto_254038 ?auto_254044 ) ) ( not ( = ?auto_254038 ?auto_254046 ) ) ( not ( = ?auto_254039 ?auto_254040 ) ) ( not ( = ?auto_254039 ?auto_254041 ) ) ( not ( = ?auto_254039 ?auto_254042 ) ) ( not ( = ?auto_254039 ?auto_254043 ) ) ( not ( = ?auto_254039 ?auto_254044 ) ) ( not ( = ?auto_254039 ?auto_254046 ) ) ( not ( = ?auto_254040 ?auto_254041 ) ) ( not ( = ?auto_254040 ?auto_254042 ) ) ( not ( = ?auto_254040 ?auto_254043 ) ) ( not ( = ?auto_254040 ?auto_254044 ) ) ( not ( = ?auto_254040 ?auto_254046 ) ) ( not ( = ?auto_254041 ?auto_254042 ) ) ( not ( = ?auto_254041 ?auto_254043 ) ) ( not ( = ?auto_254041 ?auto_254044 ) ) ( not ( = ?auto_254041 ?auto_254046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254042 ?auto_254043 ?auto_254044 )
      ( MAKE-8CRATE-VERIFY ?auto_254036 ?auto_254037 ?auto_254038 ?auto_254039 ?auto_254040 ?auto_254041 ?auto_254042 ?auto_254043 ?auto_254044 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254129 - SURFACE
      ?auto_254130 - SURFACE
      ?auto_254131 - SURFACE
      ?auto_254132 - SURFACE
      ?auto_254133 - SURFACE
      ?auto_254134 - SURFACE
      ?auto_254135 - SURFACE
      ?auto_254136 - SURFACE
      ?auto_254137 - SURFACE
    )
    :vars
    (
      ?auto_254143 - HOIST
      ?auto_254141 - PLACE
      ?auto_254138 - PLACE
      ?auto_254139 - HOIST
      ?auto_254140 - SURFACE
      ?auto_254142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_254143 ?auto_254141 ) ( IS-CRATE ?auto_254137 ) ( not ( = ?auto_254136 ?auto_254137 ) ) ( not ( = ?auto_254135 ?auto_254136 ) ) ( not ( = ?auto_254135 ?auto_254137 ) ) ( not ( = ?auto_254138 ?auto_254141 ) ) ( HOIST-AT ?auto_254139 ?auto_254138 ) ( not ( = ?auto_254143 ?auto_254139 ) ) ( AVAILABLE ?auto_254139 ) ( SURFACE-AT ?auto_254137 ?auto_254138 ) ( ON ?auto_254137 ?auto_254140 ) ( CLEAR ?auto_254137 ) ( not ( = ?auto_254136 ?auto_254140 ) ) ( not ( = ?auto_254137 ?auto_254140 ) ) ( not ( = ?auto_254135 ?auto_254140 ) ) ( TRUCK-AT ?auto_254142 ?auto_254141 ) ( SURFACE-AT ?auto_254135 ?auto_254141 ) ( CLEAR ?auto_254135 ) ( LIFTING ?auto_254143 ?auto_254136 ) ( IS-CRATE ?auto_254136 ) ( ON ?auto_254130 ?auto_254129 ) ( ON ?auto_254131 ?auto_254130 ) ( ON ?auto_254132 ?auto_254131 ) ( ON ?auto_254133 ?auto_254132 ) ( ON ?auto_254134 ?auto_254133 ) ( ON ?auto_254135 ?auto_254134 ) ( not ( = ?auto_254129 ?auto_254130 ) ) ( not ( = ?auto_254129 ?auto_254131 ) ) ( not ( = ?auto_254129 ?auto_254132 ) ) ( not ( = ?auto_254129 ?auto_254133 ) ) ( not ( = ?auto_254129 ?auto_254134 ) ) ( not ( = ?auto_254129 ?auto_254135 ) ) ( not ( = ?auto_254129 ?auto_254136 ) ) ( not ( = ?auto_254129 ?auto_254137 ) ) ( not ( = ?auto_254129 ?auto_254140 ) ) ( not ( = ?auto_254130 ?auto_254131 ) ) ( not ( = ?auto_254130 ?auto_254132 ) ) ( not ( = ?auto_254130 ?auto_254133 ) ) ( not ( = ?auto_254130 ?auto_254134 ) ) ( not ( = ?auto_254130 ?auto_254135 ) ) ( not ( = ?auto_254130 ?auto_254136 ) ) ( not ( = ?auto_254130 ?auto_254137 ) ) ( not ( = ?auto_254130 ?auto_254140 ) ) ( not ( = ?auto_254131 ?auto_254132 ) ) ( not ( = ?auto_254131 ?auto_254133 ) ) ( not ( = ?auto_254131 ?auto_254134 ) ) ( not ( = ?auto_254131 ?auto_254135 ) ) ( not ( = ?auto_254131 ?auto_254136 ) ) ( not ( = ?auto_254131 ?auto_254137 ) ) ( not ( = ?auto_254131 ?auto_254140 ) ) ( not ( = ?auto_254132 ?auto_254133 ) ) ( not ( = ?auto_254132 ?auto_254134 ) ) ( not ( = ?auto_254132 ?auto_254135 ) ) ( not ( = ?auto_254132 ?auto_254136 ) ) ( not ( = ?auto_254132 ?auto_254137 ) ) ( not ( = ?auto_254132 ?auto_254140 ) ) ( not ( = ?auto_254133 ?auto_254134 ) ) ( not ( = ?auto_254133 ?auto_254135 ) ) ( not ( = ?auto_254133 ?auto_254136 ) ) ( not ( = ?auto_254133 ?auto_254137 ) ) ( not ( = ?auto_254133 ?auto_254140 ) ) ( not ( = ?auto_254134 ?auto_254135 ) ) ( not ( = ?auto_254134 ?auto_254136 ) ) ( not ( = ?auto_254134 ?auto_254137 ) ) ( not ( = ?auto_254134 ?auto_254140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254135 ?auto_254136 ?auto_254137 )
      ( MAKE-8CRATE-VERIFY ?auto_254129 ?auto_254130 ?auto_254131 ?auto_254132 ?auto_254133 ?auto_254134 ?auto_254135 ?auto_254136 ?auto_254137 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254222 - SURFACE
      ?auto_254223 - SURFACE
      ?auto_254224 - SURFACE
      ?auto_254225 - SURFACE
      ?auto_254226 - SURFACE
      ?auto_254227 - SURFACE
      ?auto_254228 - SURFACE
      ?auto_254229 - SURFACE
      ?auto_254230 - SURFACE
    )
    :vars
    (
      ?auto_254235 - HOIST
      ?auto_254234 - PLACE
      ?auto_254233 - PLACE
      ?auto_254231 - HOIST
      ?auto_254232 - SURFACE
      ?auto_254236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_254235 ?auto_254234 ) ( IS-CRATE ?auto_254230 ) ( not ( = ?auto_254229 ?auto_254230 ) ) ( not ( = ?auto_254228 ?auto_254229 ) ) ( not ( = ?auto_254228 ?auto_254230 ) ) ( not ( = ?auto_254233 ?auto_254234 ) ) ( HOIST-AT ?auto_254231 ?auto_254233 ) ( not ( = ?auto_254235 ?auto_254231 ) ) ( AVAILABLE ?auto_254231 ) ( SURFACE-AT ?auto_254230 ?auto_254233 ) ( ON ?auto_254230 ?auto_254232 ) ( CLEAR ?auto_254230 ) ( not ( = ?auto_254229 ?auto_254232 ) ) ( not ( = ?auto_254230 ?auto_254232 ) ) ( not ( = ?auto_254228 ?auto_254232 ) ) ( TRUCK-AT ?auto_254236 ?auto_254234 ) ( SURFACE-AT ?auto_254228 ?auto_254234 ) ( CLEAR ?auto_254228 ) ( IS-CRATE ?auto_254229 ) ( AVAILABLE ?auto_254235 ) ( IN ?auto_254229 ?auto_254236 ) ( ON ?auto_254223 ?auto_254222 ) ( ON ?auto_254224 ?auto_254223 ) ( ON ?auto_254225 ?auto_254224 ) ( ON ?auto_254226 ?auto_254225 ) ( ON ?auto_254227 ?auto_254226 ) ( ON ?auto_254228 ?auto_254227 ) ( not ( = ?auto_254222 ?auto_254223 ) ) ( not ( = ?auto_254222 ?auto_254224 ) ) ( not ( = ?auto_254222 ?auto_254225 ) ) ( not ( = ?auto_254222 ?auto_254226 ) ) ( not ( = ?auto_254222 ?auto_254227 ) ) ( not ( = ?auto_254222 ?auto_254228 ) ) ( not ( = ?auto_254222 ?auto_254229 ) ) ( not ( = ?auto_254222 ?auto_254230 ) ) ( not ( = ?auto_254222 ?auto_254232 ) ) ( not ( = ?auto_254223 ?auto_254224 ) ) ( not ( = ?auto_254223 ?auto_254225 ) ) ( not ( = ?auto_254223 ?auto_254226 ) ) ( not ( = ?auto_254223 ?auto_254227 ) ) ( not ( = ?auto_254223 ?auto_254228 ) ) ( not ( = ?auto_254223 ?auto_254229 ) ) ( not ( = ?auto_254223 ?auto_254230 ) ) ( not ( = ?auto_254223 ?auto_254232 ) ) ( not ( = ?auto_254224 ?auto_254225 ) ) ( not ( = ?auto_254224 ?auto_254226 ) ) ( not ( = ?auto_254224 ?auto_254227 ) ) ( not ( = ?auto_254224 ?auto_254228 ) ) ( not ( = ?auto_254224 ?auto_254229 ) ) ( not ( = ?auto_254224 ?auto_254230 ) ) ( not ( = ?auto_254224 ?auto_254232 ) ) ( not ( = ?auto_254225 ?auto_254226 ) ) ( not ( = ?auto_254225 ?auto_254227 ) ) ( not ( = ?auto_254225 ?auto_254228 ) ) ( not ( = ?auto_254225 ?auto_254229 ) ) ( not ( = ?auto_254225 ?auto_254230 ) ) ( not ( = ?auto_254225 ?auto_254232 ) ) ( not ( = ?auto_254226 ?auto_254227 ) ) ( not ( = ?auto_254226 ?auto_254228 ) ) ( not ( = ?auto_254226 ?auto_254229 ) ) ( not ( = ?auto_254226 ?auto_254230 ) ) ( not ( = ?auto_254226 ?auto_254232 ) ) ( not ( = ?auto_254227 ?auto_254228 ) ) ( not ( = ?auto_254227 ?auto_254229 ) ) ( not ( = ?auto_254227 ?auto_254230 ) ) ( not ( = ?auto_254227 ?auto_254232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254228 ?auto_254229 ?auto_254230 )
      ( MAKE-8CRATE-VERIFY ?auto_254222 ?auto_254223 ?auto_254224 ?auto_254225 ?auto_254226 ?auto_254227 ?auto_254228 ?auto_254229 ?auto_254230 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258313 - SURFACE
      ?auto_258314 - SURFACE
      ?auto_258315 - SURFACE
      ?auto_258316 - SURFACE
      ?auto_258317 - SURFACE
      ?auto_258318 - SURFACE
      ?auto_258319 - SURFACE
      ?auto_258320 - SURFACE
      ?auto_258321 - SURFACE
      ?auto_258322 - SURFACE
    )
    :vars
    (
      ?auto_258323 - HOIST
      ?auto_258324 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_258323 ?auto_258324 ) ( SURFACE-AT ?auto_258321 ?auto_258324 ) ( CLEAR ?auto_258321 ) ( LIFTING ?auto_258323 ?auto_258322 ) ( IS-CRATE ?auto_258322 ) ( not ( = ?auto_258321 ?auto_258322 ) ) ( ON ?auto_258314 ?auto_258313 ) ( ON ?auto_258315 ?auto_258314 ) ( ON ?auto_258316 ?auto_258315 ) ( ON ?auto_258317 ?auto_258316 ) ( ON ?auto_258318 ?auto_258317 ) ( ON ?auto_258319 ?auto_258318 ) ( ON ?auto_258320 ?auto_258319 ) ( ON ?auto_258321 ?auto_258320 ) ( not ( = ?auto_258313 ?auto_258314 ) ) ( not ( = ?auto_258313 ?auto_258315 ) ) ( not ( = ?auto_258313 ?auto_258316 ) ) ( not ( = ?auto_258313 ?auto_258317 ) ) ( not ( = ?auto_258313 ?auto_258318 ) ) ( not ( = ?auto_258313 ?auto_258319 ) ) ( not ( = ?auto_258313 ?auto_258320 ) ) ( not ( = ?auto_258313 ?auto_258321 ) ) ( not ( = ?auto_258313 ?auto_258322 ) ) ( not ( = ?auto_258314 ?auto_258315 ) ) ( not ( = ?auto_258314 ?auto_258316 ) ) ( not ( = ?auto_258314 ?auto_258317 ) ) ( not ( = ?auto_258314 ?auto_258318 ) ) ( not ( = ?auto_258314 ?auto_258319 ) ) ( not ( = ?auto_258314 ?auto_258320 ) ) ( not ( = ?auto_258314 ?auto_258321 ) ) ( not ( = ?auto_258314 ?auto_258322 ) ) ( not ( = ?auto_258315 ?auto_258316 ) ) ( not ( = ?auto_258315 ?auto_258317 ) ) ( not ( = ?auto_258315 ?auto_258318 ) ) ( not ( = ?auto_258315 ?auto_258319 ) ) ( not ( = ?auto_258315 ?auto_258320 ) ) ( not ( = ?auto_258315 ?auto_258321 ) ) ( not ( = ?auto_258315 ?auto_258322 ) ) ( not ( = ?auto_258316 ?auto_258317 ) ) ( not ( = ?auto_258316 ?auto_258318 ) ) ( not ( = ?auto_258316 ?auto_258319 ) ) ( not ( = ?auto_258316 ?auto_258320 ) ) ( not ( = ?auto_258316 ?auto_258321 ) ) ( not ( = ?auto_258316 ?auto_258322 ) ) ( not ( = ?auto_258317 ?auto_258318 ) ) ( not ( = ?auto_258317 ?auto_258319 ) ) ( not ( = ?auto_258317 ?auto_258320 ) ) ( not ( = ?auto_258317 ?auto_258321 ) ) ( not ( = ?auto_258317 ?auto_258322 ) ) ( not ( = ?auto_258318 ?auto_258319 ) ) ( not ( = ?auto_258318 ?auto_258320 ) ) ( not ( = ?auto_258318 ?auto_258321 ) ) ( not ( = ?auto_258318 ?auto_258322 ) ) ( not ( = ?auto_258319 ?auto_258320 ) ) ( not ( = ?auto_258319 ?auto_258321 ) ) ( not ( = ?auto_258319 ?auto_258322 ) ) ( not ( = ?auto_258320 ?auto_258321 ) ) ( not ( = ?auto_258320 ?auto_258322 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_258321 ?auto_258322 )
      ( MAKE-9CRATE-VERIFY ?auto_258313 ?auto_258314 ?auto_258315 ?auto_258316 ?auto_258317 ?auto_258318 ?auto_258319 ?auto_258320 ?auto_258321 ?auto_258322 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258393 - SURFACE
      ?auto_258394 - SURFACE
      ?auto_258395 - SURFACE
      ?auto_258396 - SURFACE
      ?auto_258397 - SURFACE
      ?auto_258398 - SURFACE
      ?auto_258399 - SURFACE
      ?auto_258400 - SURFACE
      ?auto_258401 - SURFACE
      ?auto_258402 - SURFACE
    )
    :vars
    (
      ?auto_258405 - HOIST
      ?auto_258404 - PLACE
      ?auto_258403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_258405 ?auto_258404 ) ( SURFACE-AT ?auto_258401 ?auto_258404 ) ( CLEAR ?auto_258401 ) ( IS-CRATE ?auto_258402 ) ( not ( = ?auto_258401 ?auto_258402 ) ) ( TRUCK-AT ?auto_258403 ?auto_258404 ) ( AVAILABLE ?auto_258405 ) ( IN ?auto_258402 ?auto_258403 ) ( ON ?auto_258401 ?auto_258400 ) ( not ( = ?auto_258400 ?auto_258401 ) ) ( not ( = ?auto_258400 ?auto_258402 ) ) ( ON ?auto_258394 ?auto_258393 ) ( ON ?auto_258395 ?auto_258394 ) ( ON ?auto_258396 ?auto_258395 ) ( ON ?auto_258397 ?auto_258396 ) ( ON ?auto_258398 ?auto_258397 ) ( ON ?auto_258399 ?auto_258398 ) ( ON ?auto_258400 ?auto_258399 ) ( not ( = ?auto_258393 ?auto_258394 ) ) ( not ( = ?auto_258393 ?auto_258395 ) ) ( not ( = ?auto_258393 ?auto_258396 ) ) ( not ( = ?auto_258393 ?auto_258397 ) ) ( not ( = ?auto_258393 ?auto_258398 ) ) ( not ( = ?auto_258393 ?auto_258399 ) ) ( not ( = ?auto_258393 ?auto_258400 ) ) ( not ( = ?auto_258393 ?auto_258401 ) ) ( not ( = ?auto_258393 ?auto_258402 ) ) ( not ( = ?auto_258394 ?auto_258395 ) ) ( not ( = ?auto_258394 ?auto_258396 ) ) ( not ( = ?auto_258394 ?auto_258397 ) ) ( not ( = ?auto_258394 ?auto_258398 ) ) ( not ( = ?auto_258394 ?auto_258399 ) ) ( not ( = ?auto_258394 ?auto_258400 ) ) ( not ( = ?auto_258394 ?auto_258401 ) ) ( not ( = ?auto_258394 ?auto_258402 ) ) ( not ( = ?auto_258395 ?auto_258396 ) ) ( not ( = ?auto_258395 ?auto_258397 ) ) ( not ( = ?auto_258395 ?auto_258398 ) ) ( not ( = ?auto_258395 ?auto_258399 ) ) ( not ( = ?auto_258395 ?auto_258400 ) ) ( not ( = ?auto_258395 ?auto_258401 ) ) ( not ( = ?auto_258395 ?auto_258402 ) ) ( not ( = ?auto_258396 ?auto_258397 ) ) ( not ( = ?auto_258396 ?auto_258398 ) ) ( not ( = ?auto_258396 ?auto_258399 ) ) ( not ( = ?auto_258396 ?auto_258400 ) ) ( not ( = ?auto_258396 ?auto_258401 ) ) ( not ( = ?auto_258396 ?auto_258402 ) ) ( not ( = ?auto_258397 ?auto_258398 ) ) ( not ( = ?auto_258397 ?auto_258399 ) ) ( not ( = ?auto_258397 ?auto_258400 ) ) ( not ( = ?auto_258397 ?auto_258401 ) ) ( not ( = ?auto_258397 ?auto_258402 ) ) ( not ( = ?auto_258398 ?auto_258399 ) ) ( not ( = ?auto_258398 ?auto_258400 ) ) ( not ( = ?auto_258398 ?auto_258401 ) ) ( not ( = ?auto_258398 ?auto_258402 ) ) ( not ( = ?auto_258399 ?auto_258400 ) ) ( not ( = ?auto_258399 ?auto_258401 ) ) ( not ( = ?auto_258399 ?auto_258402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258400 ?auto_258401 ?auto_258402 )
      ( MAKE-9CRATE-VERIFY ?auto_258393 ?auto_258394 ?auto_258395 ?auto_258396 ?auto_258397 ?auto_258398 ?auto_258399 ?auto_258400 ?auto_258401 ?auto_258402 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258483 - SURFACE
      ?auto_258484 - SURFACE
      ?auto_258485 - SURFACE
      ?auto_258486 - SURFACE
      ?auto_258487 - SURFACE
      ?auto_258488 - SURFACE
      ?auto_258489 - SURFACE
      ?auto_258490 - SURFACE
      ?auto_258491 - SURFACE
      ?auto_258492 - SURFACE
    )
    :vars
    (
      ?auto_258496 - HOIST
      ?auto_258495 - PLACE
      ?auto_258493 - TRUCK
      ?auto_258494 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_258496 ?auto_258495 ) ( SURFACE-AT ?auto_258491 ?auto_258495 ) ( CLEAR ?auto_258491 ) ( IS-CRATE ?auto_258492 ) ( not ( = ?auto_258491 ?auto_258492 ) ) ( AVAILABLE ?auto_258496 ) ( IN ?auto_258492 ?auto_258493 ) ( ON ?auto_258491 ?auto_258490 ) ( not ( = ?auto_258490 ?auto_258491 ) ) ( not ( = ?auto_258490 ?auto_258492 ) ) ( TRUCK-AT ?auto_258493 ?auto_258494 ) ( not ( = ?auto_258494 ?auto_258495 ) ) ( ON ?auto_258484 ?auto_258483 ) ( ON ?auto_258485 ?auto_258484 ) ( ON ?auto_258486 ?auto_258485 ) ( ON ?auto_258487 ?auto_258486 ) ( ON ?auto_258488 ?auto_258487 ) ( ON ?auto_258489 ?auto_258488 ) ( ON ?auto_258490 ?auto_258489 ) ( not ( = ?auto_258483 ?auto_258484 ) ) ( not ( = ?auto_258483 ?auto_258485 ) ) ( not ( = ?auto_258483 ?auto_258486 ) ) ( not ( = ?auto_258483 ?auto_258487 ) ) ( not ( = ?auto_258483 ?auto_258488 ) ) ( not ( = ?auto_258483 ?auto_258489 ) ) ( not ( = ?auto_258483 ?auto_258490 ) ) ( not ( = ?auto_258483 ?auto_258491 ) ) ( not ( = ?auto_258483 ?auto_258492 ) ) ( not ( = ?auto_258484 ?auto_258485 ) ) ( not ( = ?auto_258484 ?auto_258486 ) ) ( not ( = ?auto_258484 ?auto_258487 ) ) ( not ( = ?auto_258484 ?auto_258488 ) ) ( not ( = ?auto_258484 ?auto_258489 ) ) ( not ( = ?auto_258484 ?auto_258490 ) ) ( not ( = ?auto_258484 ?auto_258491 ) ) ( not ( = ?auto_258484 ?auto_258492 ) ) ( not ( = ?auto_258485 ?auto_258486 ) ) ( not ( = ?auto_258485 ?auto_258487 ) ) ( not ( = ?auto_258485 ?auto_258488 ) ) ( not ( = ?auto_258485 ?auto_258489 ) ) ( not ( = ?auto_258485 ?auto_258490 ) ) ( not ( = ?auto_258485 ?auto_258491 ) ) ( not ( = ?auto_258485 ?auto_258492 ) ) ( not ( = ?auto_258486 ?auto_258487 ) ) ( not ( = ?auto_258486 ?auto_258488 ) ) ( not ( = ?auto_258486 ?auto_258489 ) ) ( not ( = ?auto_258486 ?auto_258490 ) ) ( not ( = ?auto_258486 ?auto_258491 ) ) ( not ( = ?auto_258486 ?auto_258492 ) ) ( not ( = ?auto_258487 ?auto_258488 ) ) ( not ( = ?auto_258487 ?auto_258489 ) ) ( not ( = ?auto_258487 ?auto_258490 ) ) ( not ( = ?auto_258487 ?auto_258491 ) ) ( not ( = ?auto_258487 ?auto_258492 ) ) ( not ( = ?auto_258488 ?auto_258489 ) ) ( not ( = ?auto_258488 ?auto_258490 ) ) ( not ( = ?auto_258488 ?auto_258491 ) ) ( not ( = ?auto_258488 ?auto_258492 ) ) ( not ( = ?auto_258489 ?auto_258490 ) ) ( not ( = ?auto_258489 ?auto_258491 ) ) ( not ( = ?auto_258489 ?auto_258492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258490 ?auto_258491 ?auto_258492 )
      ( MAKE-9CRATE-VERIFY ?auto_258483 ?auto_258484 ?auto_258485 ?auto_258486 ?auto_258487 ?auto_258488 ?auto_258489 ?auto_258490 ?auto_258491 ?auto_258492 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258582 - SURFACE
      ?auto_258583 - SURFACE
      ?auto_258584 - SURFACE
      ?auto_258585 - SURFACE
      ?auto_258586 - SURFACE
      ?auto_258587 - SURFACE
      ?auto_258588 - SURFACE
      ?auto_258589 - SURFACE
      ?auto_258590 - SURFACE
      ?auto_258591 - SURFACE
    )
    :vars
    (
      ?auto_258594 - HOIST
      ?auto_258593 - PLACE
      ?auto_258595 - TRUCK
      ?auto_258592 - PLACE
      ?auto_258596 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_258594 ?auto_258593 ) ( SURFACE-AT ?auto_258590 ?auto_258593 ) ( CLEAR ?auto_258590 ) ( IS-CRATE ?auto_258591 ) ( not ( = ?auto_258590 ?auto_258591 ) ) ( AVAILABLE ?auto_258594 ) ( ON ?auto_258590 ?auto_258589 ) ( not ( = ?auto_258589 ?auto_258590 ) ) ( not ( = ?auto_258589 ?auto_258591 ) ) ( TRUCK-AT ?auto_258595 ?auto_258592 ) ( not ( = ?auto_258592 ?auto_258593 ) ) ( HOIST-AT ?auto_258596 ?auto_258592 ) ( LIFTING ?auto_258596 ?auto_258591 ) ( not ( = ?auto_258594 ?auto_258596 ) ) ( ON ?auto_258583 ?auto_258582 ) ( ON ?auto_258584 ?auto_258583 ) ( ON ?auto_258585 ?auto_258584 ) ( ON ?auto_258586 ?auto_258585 ) ( ON ?auto_258587 ?auto_258586 ) ( ON ?auto_258588 ?auto_258587 ) ( ON ?auto_258589 ?auto_258588 ) ( not ( = ?auto_258582 ?auto_258583 ) ) ( not ( = ?auto_258582 ?auto_258584 ) ) ( not ( = ?auto_258582 ?auto_258585 ) ) ( not ( = ?auto_258582 ?auto_258586 ) ) ( not ( = ?auto_258582 ?auto_258587 ) ) ( not ( = ?auto_258582 ?auto_258588 ) ) ( not ( = ?auto_258582 ?auto_258589 ) ) ( not ( = ?auto_258582 ?auto_258590 ) ) ( not ( = ?auto_258582 ?auto_258591 ) ) ( not ( = ?auto_258583 ?auto_258584 ) ) ( not ( = ?auto_258583 ?auto_258585 ) ) ( not ( = ?auto_258583 ?auto_258586 ) ) ( not ( = ?auto_258583 ?auto_258587 ) ) ( not ( = ?auto_258583 ?auto_258588 ) ) ( not ( = ?auto_258583 ?auto_258589 ) ) ( not ( = ?auto_258583 ?auto_258590 ) ) ( not ( = ?auto_258583 ?auto_258591 ) ) ( not ( = ?auto_258584 ?auto_258585 ) ) ( not ( = ?auto_258584 ?auto_258586 ) ) ( not ( = ?auto_258584 ?auto_258587 ) ) ( not ( = ?auto_258584 ?auto_258588 ) ) ( not ( = ?auto_258584 ?auto_258589 ) ) ( not ( = ?auto_258584 ?auto_258590 ) ) ( not ( = ?auto_258584 ?auto_258591 ) ) ( not ( = ?auto_258585 ?auto_258586 ) ) ( not ( = ?auto_258585 ?auto_258587 ) ) ( not ( = ?auto_258585 ?auto_258588 ) ) ( not ( = ?auto_258585 ?auto_258589 ) ) ( not ( = ?auto_258585 ?auto_258590 ) ) ( not ( = ?auto_258585 ?auto_258591 ) ) ( not ( = ?auto_258586 ?auto_258587 ) ) ( not ( = ?auto_258586 ?auto_258588 ) ) ( not ( = ?auto_258586 ?auto_258589 ) ) ( not ( = ?auto_258586 ?auto_258590 ) ) ( not ( = ?auto_258586 ?auto_258591 ) ) ( not ( = ?auto_258587 ?auto_258588 ) ) ( not ( = ?auto_258587 ?auto_258589 ) ) ( not ( = ?auto_258587 ?auto_258590 ) ) ( not ( = ?auto_258587 ?auto_258591 ) ) ( not ( = ?auto_258588 ?auto_258589 ) ) ( not ( = ?auto_258588 ?auto_258590 ) ) ( not ( = ?auto_258588 ?auto_258591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258589 ?auto_258590 ?auto_258591 )
      ( MAKE-9CRATE-VERIFY ?auto_258582 ?auto_258583 ?auto_258584 ?auto_258585 ?auto_258586 ?auto_258587 ?auto_258588 ?auto_258589 ?auto_258590 ?auto_258591 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258690 - SURFACE
      ?auto_258691 - SURFACE
      ?auto_258692 - SURFACE
      ?auto_258693 - SURFACE
      ?auto_258694 - SURFACE
      ?auto_258695 - SURFACE
      ?auto_258696 - SURFACE
      ?auto_258697 - SURFACE
      ?auto_258698 - SURFACE
      ?auto_258699 - SURFACE
    )
    :vars
    (
      ?auto_258703 - HOIST
      ?auto_258704 - PLACE
      ?auto_258700 - TRUCK
      ?auto_258701 - PLACE
      ?auto_258705 - HOIST
      ?auto_258702 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_258703 ?auto_258704 ) ( SURFACE-AT ?auto_258698 ?auto_258704 ) ( CLEAR ?auto_258698 ) ( IS-CRATE ?auto_258699 ) ( not ( = ?auto_258698 ?auto_258699 ) ) ( AVAILABLE ?auto_258703 ) ( ON ?auto_258698 ?auto_258697 ) ( not ( = ?auto_258697 ?auto_258698 ) ) ( not ( = ?auto_258697 ?auto_258699 ) ) ( TRUCK-AT ?auto_258700 ?auto_258701 ) ( not ( = ?auto_258701 ?auto_258704 ) ) ( HOIST-AT ?auto_258705 ?auto_258701 ) ( not ( = ?auto_258703 ?auto_258705 ) ) ( AVAILABLE ?auto_258705 ) ( SURFACE-AT ?auto_258699 ?auto_258701 ) ( ON ?auto_258699 ?auto_258702 ) ( CLEAR ?auto_258699 ) ( not ( = ?auto_258698 ?auto_258702 ) ) ( not ( = ?auto_258699 ?auto_258702 ) ) ( not ( = ?auto_258697 ?auto_258702 ) ) ( ON ?auto_258691 ?auto_258690 ) ( ON ?auto_258692 ?auto_258691 ) ( ON ?auto_258693 ?auto_258692 ) ( ON ?auto_258694 ?auto_258693 ) ( ON ?auto_258695 ?auto_258694 ) ( ON ?auto_258696 ?auto_258695 ) ( ON ?auto_258697 ?auto_258696 ) ( not ( = ?auto_258690 ?auto_258691 ) ) ( not ( = ?auto_258690 ?auto_258692 ) ) ( not ( = ?auto_258690 ?auto_258693 ) ) ( not ( = ?auto_258690 ?auto_258694 ) ) ( not ( = ?auto_258690 ?auto_258695 ) ) ( not ( = ?auto_258690 ?auto_258696 ) ) ( not ( = ?auto_258690 ?auto_258697 ) ) ( not ( = ?auto_258690 ?auto_258698 ) ) ( not ( = ?auto_258690 ?auto_258699 ) ) ( not ( = ?auto_258690 ?auto_258702 ) ) ( not ( = ?auto_258691 ?auto_258692 ) ) ( not ( = ?auto_258691 ?auto_258693 ) ) ( not ( = ?auto_258691 ?auto_258694 ) ) ( not ( = ?auto_258691 ?auto_258695 ) ) ( not ( = ?auto_258691 ?auto_258696 ) ) ( not ( = ?auto_258691 ?auto_258697 ) ) ( not ( = ?auto_258691 ?auto_258698 ) ) ( not ( = ?auto_258691 ?auto_258699 ) ) ( not ( = ?auto_258691 ?auto_258702 ) ) ( not ( = ?auto_258692 ?auto_258693 ) ) ( not ( = ?auto_258692 ?auto_258694 ) ) ( not ( = ?auto_258692 ?auto_258695 ) ) ( not ( = ?auto_258692 ?auto_258696 ) ) ( not ( = ?auto_258692 ?auto_258697 ) ) ( not ( = ?auto_258692 ?auto_258698 ) ) ( not ( = ?auto_258692 ?auto_258699 ) ) ( not ( = ?auto_258692 ?auto_258702 ) ) ( not ( = ?auto_258693 ?auto_258694 ) ) ( not ( = ?auto_258693 ?auto_258695 ) ) ( not ( = ?auto_258693 ?auto_258696 ) ) ( not ( = ?auto_258693 ?auto_258697 ) ) ( not ( = ?auto_258693 ?auto_258698 ) ) ( not ( = ?auto_258693 ?auto_258699 ) ) ( not ( = ?auto_258693 ?auto_258702 ) ) ( not ( = ?auto_258694 ?auto_258695 ) ) ( not ( = ?auto_258694 ?auto_258696 ) ) ( not ( = ?auto_258694 ?auto_258697 ) ) ( not ( = ?auto_258694 ?auto_258698 ) ) ( not ( = ?auto_258694 ?auto_258699 ) ) ( not ( = ?auto_258694 ?auto_258702 ) ) ( not ( = ?auto_258695 ?auto_258696 ) ) ( not ( = ?auto_258695 ?auto_258697 ) ) ( not ( = ?auto_258695 ?auto_258698 ) ) ( not ( = ?auto_258695 ?auto_258699 ) ) ( not ( = ?auto_258695 ?auto_258702 ) ) ( not ( = ?auto_258696 ?auto_258697 ) ) ( not ( = ?auto_258696 ?auto_258698 ) ) ( not ( = ?auto_258696 ?auto_258699 ) ) ( not ( = ?auto_258696 ?auto_258702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258697 ?auto_258698 ?auto_258699 )
      ( MAKE-9CRATE-VERIFY ?auto_258690 ?auto_258691 ?auto_258692 ?auto_258693 ?auto_258694 ?auto_258695 ?auto_258696 ?auto_258697 ?auto_258698 ?auto_258699 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258799 - SURFACE
      ?auto_258800 - SURFACE
      ?auto_258801 - SURFACE
      ?auto_258802 - SURFACE
      ?auto_258803 - SURFACE
      ?auto_258804 - SURFACE
      ?auto_258805 - SURFACE
      ?auto_258806 - SURFACE
      ?auto_258807 - SURFACE
      ?auto_258808 - SURFACE
    )
    :vars
    (
      ?auto_258814 - HOIST
      ?auto_258809 - PLACE
      ?auto_258813 - PLACE
      ?auto_258811 - HOIST
      ?auto_258812 - SURFACE
      ?auto_258810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_258814 ?auto_258809 ) ( SURFACE-AT ?auto_258807 ?auto_258809 ) ( CLEAR ?auto_258807 ) ( IS-CRATE ?auto_258808 ) ( not ( = ?auto_258807 ?auto_258808 ) ) ( AVAILABLE ?auto_258814 ) ( ON ?auto_258807 ?auto_258806 ) ( not ( = ?auto_258806 ?auto_258807 ) ) ( not ( = ?auto_258806 ?auto_258808 ) ) ( not ( = ?auto_258813 ?auto_258809 ) ) ( HOIST-AT ?auto_258811 ?auto_258813 ) ( not ( = ?auto_258814 ?auto_258811 ) ) ( AVAILABLE ?auto_258811 ) ( SURFACE-AT ?auto_258808 ?auto_258813 ) ( ON ?auto_258808 ?auto_258812 ) ( CLEAR ?auto_258808 ) ( not ( = ?auto_258807 ?auto_258812 ) ) ( not ( = ?auto_258808 ?auto_258812 ) ) ( not ( = ?auto_258806 ?auto_258812 ) ) ( TRUCK-AT ?auto_258810 ?auto_258809 ) ( ON ?auto_258800 ?auto_258799 ) ( ON ?auto_258801 ?auto_258800 ) ( ON ?auto_258802 ?auto_258801 ) ( ON ?auto_258803 ?auto_258802 ) ( ON ?auto_258804 ?auto_258803 ) ( ON ?auto_258805 ?auto_258804 ) ( ON ?auto_258806 ?auto_258805 ) ( not ( = ?auto_258799 ?auto_258800 ) ) ( not ( = ?auto_258799 ?auto_258801 ) ) ( not ( = ?auto_258799 ?auto_258802 ) ) ( not ( = ?auto_258799 ?auto_258803 ) ) ( not ( = ?auto_258799 ?auto_258804 ) ) ( not ( = ?auto_258799 ?auto_258805 ) ) ( not ( = ?auto_258799 ?auto_258806 ) ) ( not ( = ?auto_258799 ?auto_258807 ) ) ( not ( = ?auto_258799 ?auto_258808 ) ) ( not ( = ?auto_258799 ?auto_258812 ) ) ( not ( = ?auto_258800 ?auto_258801 ) ) ( not ( = ?auto_258800 ?auto_258802 ) ) ( not ( = ?auto_258800 ?auto_258803 ) ) ( not ( = ?auto_258800 ?auto_258804 ) ) ( not ( = ?auto_258800 ?auto_258805 ) ) ( not ( = ?auto_258800 ?auto_258806 ) ) ( not ( = ?auto_258800 ?auto_258807 ) ) ( not ( = ?auto_258800 ?auto_258808 ) ) ( not ( = ?auto_258800 ?auto_258812 ) ) ( not ( = ?auto_258801 ?auto_258802 ) ) ( not ( = ?auto_258801 ?auto_258803 ) ) ( not ( = ?auto_258801 ?auto_258804 ) ) ( not ( = ?auto_258801 ?auto_258805 ) ) ( not ( = ?auto_258801 ?auto_258806 ) ) ( not ( = ?auto_258801 ?auto_258807 ) ) ( not ( = ?auto_258801 ?auto_258808 ) ) ( not ( = ?auto_258801 ?auto_258812 ) ) ( not ( = ?auto_258802 ?auto_258803 ) ) ( not ( = ?auto_258802 ?auto_258804 ) ) ( not ( = ?auto_258802 ?auto_258805 ) ) ( not ( = ?auto_258802 ?auto_258806 ) ) ( not ( = ?auto_258802 ?auto_258807 ) ) ( not ( = ?auto_258802 ?auto_258808 ) ) ( not ( = ?auto_258802 ?auto_258812 ) ) ( not ( = ?auto_258803 ?auto_258804 ) ) ( not ( = ?auto_258803 ?auto_258805 ) ) ( not ( = ?auto_258803 ?auto_258806 ) ) ( not ( = ?auto_258803 ?auto_258807 ) ) ( not ( = ?auto_258803 ?auto_258808 ) ) ( not ( = ?auto_258803 ?auto_258812 ) ) ( not ( = ?auto_258804 ?auto_258805 ) ) ( not ( = ?auto_258804 ?auto_258806 ) ) ( not ( = ?auto_258804 ?auto_258807 ) ) ( not ( = ?auto_258804 ?auto_258808 ) ) ( not ( = ?auto_258804 ?auto_258812 ) ) ( not ( = ?auto_258805 ?auto_258806 ) ) ( not ( = ?auto_258805 ?auto_258807 ) ) ( not ( = ?auto_258805 ?auto_258808 ) ) ( not ( = ?auto_258805 ?auto_258812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258806 ?auto_258807 ?auto_258808 )
      ( MAKE-9CRATE-VERIFY ?auto_258799 ?auto_258800 ?auto_258801 ?auto_258802 ?auto_258803 ?auto_258804 ?auto_258805 ?auto_258806 ?auto_258807 ?auto_258808 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258908 - SURFACE
      ?auto_258909 - SURFACE
      ?auto_258910 - SURFACE
      ?auto_258911 - SURFACE
      ?auto_258912 - SURFACE
      ?auto_258913 - SURFACE
      ?auto_258914 - SURFACE
      ?auto_258915 - SURFACE
      ?auto_258916 - SURFACE
      ?auto_258917 - SURFACE
    )
    :vars
    (
      ?auto_258923 - HOIST
      ?auto_258919 - PLACE
      ?auto_258921 - PLACE
      ?auto_258922 - HOIST
      ?auto_258918 - SURFACE
      ?auto_258920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_258923 ?auto_258919 ) ( IS-CRATE ?auto_258917 ) ( not ( = ?auto_258916 ?auto_258917 ) ) ( not ( = ?auto_258915 ?auto_258916 ) ) ( not ( = ?auto_258915 ?auto_258917 ) ) ( not ( = ?auto_258921 ?auto_258919 ) ) ( HOIST-AT ?auto_258922 ?auto_258921 ) ( not ( = ?auto_258923 ?auto_258922 ) ) ( AVAILABLE ?auto_258922 ) ( SURFACE-AT ?auto_258917 ?auto_258921 ) ( ON ?auto_258917 ?auto_258918 ) ( CLEAR ?auto_258917 ) ( not ( = ?auto_258916 ?auto_258918 ) ) ( not ( = ?auto_258917 ?auto_258918 ) ) ( not ( = ?auto_258915 ?auto_258918 ) ) ( TRUCK-AT ?auto_258920 ?auto_258919 ) ( SURFACE-AT ?auto_258915 ?auto_258919 ) ( CLEAR ?auto_258915 ) ( LIFTING ?auto_258923 ?auto_258916 ) ( IS-CRATE ?auto_258916 ) ( ON ?auto_258909 ?auto_258908 ) ( ON ?auto_258910 ?auto_258909 ) ( ON ?auto_258911 ?auto_258910 ) ( ON ?auto_258912 ?auto_258911 ) ( ON ?auto_258913 ?auto_258912 ) ( ON ?auto_258914 ?auto_258913 ) ( ON ?auto_258915 ?auto_258914 ) ( not ( = ?auto_258908 ?auto_258909 ) ) ( not ( = ?auto_258908 ?auto_258910 ) ) ( not ( = ?auto_258908 ?auto_258911 ) ) ( not ( = ?auto_258908 ?auto_258912 ) ) ( not ( = ?auto_258908 ?auto_258913 ) ) ( not ( = ?auto_258908 ?auto_258914 ) ) ( not ( = ?auto_258908 ?auto_258915 ) ) ( not ( = ?auto_258908 ?auto_258916 ) ) ( not ( = ?auto_258908 ?auto_258917 ) ) ( not ( = ?auto_258908 ?auto_258918 ) ) ( not ( = ?auto_258909 ?auto_258910 ) ) ( not ( = ?auto_258909 ?auto_258911 ) ) ( not ( = ?auto_258909 ?auto_258912 ) ) ( not ( = ?auto_258909 ?auto_258913 ) ) ( not ( = ?auto_258909 ?auto_258914 ) ) ( not ( = ?auto_258909 ?auto_258915 ) ) ( not ( = ?auto_258909 ?auto_258916 ) ) ( not ( = ?auto_258909 ?auto_258917 ) ) ( not ( = ?auto_258909 ?auto_258918 ) ) ( not ( = ?auto_258910 ?auto_258911 ) ) ( not ( = ?auto_258910 ?auto_258912 ) ) ( not ( = ?auto_258910 ?auto_258913 ) ) ( not ( = ?auto_258910 ?auto_258914 ) ) ( not ( = ?auto_258910 ?auto_258915 ) ) ( not ( = ?auto_258910 ?auto_258916 ) ) ( not ( = ?auto_258910 ?auto_258917 ) ) ( not ( = ?auto_258910 ?auto_258918 ) ) ( not ( = ?auto_258911 ?auto_258912 ) ) ( not ( = ?auto_258911 ?auto_258913 ) ) ( not ( = ?auto_258911 ?auto_258914 ) ) ( not ( = ?auto_258911 ?auto_258915 ) ) ( not ( = ?auto_258911 ?auto_258916 ) ) ( not ( = ?auto_258911 ?auto_258917 ) ) ( not ( = ?auto_258911 ?auto_258918 ) ) ( not ( = ?auto_258912 ?auto_258913 ) ) ( not ( = ?auto_258912 ?auto_258914 ) ) ( not ( = ?auto_258912 ?auto_258915 ) ) ( not ( = ?auto_258912 ?auto_258916 ) ) ( not ( = ?auto_258912 ?auto_258917 ) ) ( not ( = ?auto_258912 ?auto_258918 ) ) ( not ( = ?auto_258913 ?auto_258914 ) ) ( not ( = ?auto_258913 ?auto_258915 ) ) ( not ( = ?auto_258913 ?auto_258916 ) ) ( not ( = ?auto_258913 ?auto_258917 ) ) ( not ( = ?auto_258913 ?auto_258918 ) ) ( not ( = ?auto_258914 ?auto_258915 ) ) ( not ( = ?auto_258914 ?auto_258916 ) ) ( not ( = ?auto_258914 ?auto_258917 ) ) ( not ( = ?auto_258914 ?auto_258918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258915 ?auto_258916 ?auto_258917 )
      ( MAKE-9CRATE-VERIFY ?auto_258908 ?auto_258909 ?auto_258910 ?auto_258911 ?auto_258912 ?auto_258913 ?auto_258914 ?auto_258915 ?auto_258916 ?auto_258917 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_259017 - SURFACE
      ?auto_259018 - SURFACE
      ?auto_259019 - SURFACE
      ?auto_259020 - SURFACE
      ?auto_259021 - SURFACE
      ?auto_259022 - SURFACE
      ?auto_259023 - SURFACE
      ?auto_259024 - SURFACE
      ?auto_259025 - SURFACE
      ?auto_259026 - SURFACE
    )
    :vars
    (
      ?auto_259031 - HOIST
      ?auto_259028 - PLACE
      ?auto_259029 - PLACE
      ?auto_259032 - HOIST
      ?auto_259027 - SURFACE
      ?auto_259030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_259031 ?auto_259028 ) ( IS-CRATE ?auto_259026 ) ( not ( = ?auto_259025 ?auto_259026 ) ) ( not ( = ?auto_259024 ?auto_259025 ) ) ( not ( = ?auto_259024 ?auto_259026 ) ) ( not ( = ?auto_259029 ?auto_259028 ) ) ( HOIST-AT ?auto_259032 ?auto_259029 ) ( not ( = ?auto_259031 ?auto_259032 ) ) ( AVAILABLE ?auto_259032 ) ( SURFACE-AT ?auto_259026 ?auto_259029 ) ( ON ?auto_259026 ?auto_259027 ) ( CLEAR ?auto_259026 ) ( not ( = ?auto_259025 ?auto_259027 ) ) ( not ( = ?auto_259026 ?auto_259027 ) ) ( not ( = ?auto_259024 ?auto_259027 ) ) ( TRUCK-AT ?auto_259030 ?auto_259028 ) ( SURFACE-AT ?auto_259024 ?auto_259028 ) ( CLEAR ?auto_259024 ) ( IS-CRATE ?auto_259025 ) ( AVAILABLE ?auto_259031 ) ( IN ?auto_259025 ?auto_259030 ) ( ON ?auto_259018 ?auto_259017 ) ( ON ?auto_259019 ?auto_259018 ) ( ON ?auto_259020 ?auto_259019 ) ( ON ?auto_259021 ?auto_259020 ) ( ON ?auto_259022 ?auto_259021 ) ( ON ?auto_259023 ?auto_259022 ) ( ON ?auto_259024 ?auto_259023 ) ( not ( = ?auto_259017 ?auto_259018 ) ) ( not ( = ?auto_259017 ?auto_259019 ) ) ( not ( = ?auto_259017 ?auto_259020 ) ) ( not ( = ?auto_259017 ?auto_259021 ) ) ( not ( = ?auto_259017 ?auto_259022 ) ) ( not ( = ?auto_259017 ?auto_259023 ) ) ( not ( = ?auto_259017 ?auto_259024 ) ) ( not ( = ?auto_259017 ?auto_259025 ) ) ( not ( = ?auto_259017 ?auto_259026 ) ) ( not ( = ?auto_259017 ?auto_259027 ) ) ( not ( = ?auto_259018 ?auto_259019 ) ) ( not ( = ?auto_259018 ?auto_259020 ) ) ( not ( = ?auto_259018 ?auto_259021 ) ) ( not ( = ?auto_259018 ?auto_259022 ) ) ( not ( = ?auto_259018 ?auto_259023 ) ) ( not ( = ?auto_259018 ?auto_259024 ) ) ( not ( = ?auto_259018 ?auto_259025 ) ) ( not ( = ?auto_259018 ?auto_259026 ) ) ( not ( = ?auto_259018 ?auto_259027 ) ) ( not ( = ?auto_259019 ?auto_259020 ) ) ( not ( = ?auto_259019 ?auto_259021 ) ) ( not ( = ?auto_259019 ?auto_259022 ) ) ( not ( = ?auto_259019 ?auto_259023 ) ) ( not ( = ?auto_259019 ?auto_259024 ) ) ( not ( = ?auto_259019 ?auto_259025 ) ) ( not ( = ?auto_259019 ?auto_259026 ) ) ( not ( = ?auto_259019 ?auto_259027 ) ) ( not ( = ?auto_259020 ?auto_259021 ) ) ( not ( = ?auto_259020 ?auto_259022 ) ) ( not ( = ?auto_259020 ?auto_259023 ) ) ( not ( = ?auto_259020 ?auto_259024 ) ) ( not ( = ?auto_259020 ?auto_259025 ) ) ( not ( = ?auto_259020 ?auto_259026 ) ) ( not ( = ?auto_259020 ?auto_259027 ) ) ( not ( = ?auto_259021 ?auto_259022 ) ) ( not ( = ?auto_259021 ?auto_259023 ) ) ( not ( = ?auto_259021 ?auto_259024 ) ) ( not ( = ?auto_259021 ?auto_259025 ) ) ( not ( = ?auto_259021 ?auto_259026 ) ) ( not ( = ?auto_259021 ?auto_259027 ) ) ( not ( = ?auto_259022 ?auto_259023 ) ) ( not ( = ?auto_259022 ?auto_259024 ) ) ( not ( = ?auto_259022 ?auto_259025 ) ) ( not ( = ?auto_259022 ?auto_259026 ) ) ( not ( = ?auto_259022 ?auto_259027 ) ) ( not ( = ?auto_259023 ?auto_259024 ) ) ( not ( = ?auto_259023 ?auto_259025 ) ) ( not ( = ?auto_259023 ?auto_259026 ) ) ( not ( = ?auto_259023 ?auto_259027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_259024 ?auto_259025 ?auto_259026 )
      ( MAKE-9CRATE-VERIFY ?auto_259017 ?auto_259018 ?auto_259019 ?auto_259020 ?auto_259021 ?auto_259022 ?auto_259023 ?auto_259024 ?auto_259025 ?auto_259026 ) )
  )

)

