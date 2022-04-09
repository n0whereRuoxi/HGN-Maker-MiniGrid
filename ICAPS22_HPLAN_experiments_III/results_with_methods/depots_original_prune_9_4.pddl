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
      ?auto_244741 - SURFACE
      ?auto_244742 - SURFACE
    )
    :vars
    (
      ?auto_244743 - HOIST
      ?auto_244744 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244743 ?auto_244744 ) ( SURFACE-AT ?auto_244741 ?auto_244744 ) ( CLEAR ?auto_244741 ) ( LIFTING ?auto_244743 ?auto_244742 ) ( IS-CRATE ?auto_244742 ) ( not ( = ?auto_244741 ?auto_244742 ) ) )
    :subtasks
    ( ( !DROP ?auto_244743 ?auto_244742 ?auto_244741 ?auto_244744 )
      ( MAKE-1CRATE-VERIFY ?auto_244741 ?auto_244742 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244745 - SURFACE
      ?auto_244746 - SURFACE
    )
    :vars
    (
      ?auto_244747 - HOIST
      ?auto_244748 - PLACE
      ?auto_244749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244747 ?auto_244748 ) ( SURFACE-AT ?auto_244745 ?auto_244748 ) ( CLEAR ?auto_244745 ) ( IS-CRATE ?auto_244746 ) ( not ( = ?auto_244745 ?auto_244746 ) ) ( TRUCK-AT ?auto_244749 ?auto_244748 ) ( AVAILABLE ?auto_244747 ) ( IN ?auto_244746 ?auto_244749 ) )
    :subtasks
    ( ( !UNLOAD ?auto_244747 ?auto_244746 ?auto_244749 ?auto_244748 )
      ( MAKE-1CRATE ?auto_244745 ?auto_244746 )
      ( MAKE-1CRATE-VERIFY ?auto_244745 ?auto_244746 ) )
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
      ?auto_244754 - PLACE
      ?auto_244753 - TRUCK
      ?auto_244755 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244752 ?auto_244754 ) ( SURFACE-AT ?auto_244750 ?auto_244754 ) ( CLEAR ?auto_244750 ) ( IS-CRATE ?auto_244751 ) ( not ( = ?auto_244750 ?auto_244751 ) ) ( AVAILABLE ?auto_244752 ) ( IN ?auto_244751 ?auto_244753 ) ( TRUCK-AT ?auto_244753 ?auto_244755 ) ( not ( = ?auto_244755 ?auto_244754 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_244753 ?auto_244755 ?auto_244754 )
      ( MAKE-1CRATE ?auto_244750 ?auto_244751 )
      ( MAKE-1CRATE-VERIFY ?auto_244750 ?auto_244751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244756 - SURFACE
      ?auto_244757 - SURFACE
    )
    :vars
    (
      ?auto_244761 - HOIST
      ?auto_244758 - PLACE
      ?auto_244760 - TRUCK
      ?auto_244759 - PLACE
      ?auto_244762 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_244761 ?auto_244758 ) ( SURFACE-AT ?auto_244756 ?auto_244758 ) ( CLEAR ?auto_244756 ) ( IS-CRATE ?auto_244757 ) ( not ( = ?auto_244756 ?auto_244757 ) ) ( AVAILABLE ?auto_244761 ) ( TRUCK-AT ?auto_244760 ?auto_244759 ) ( not ( = ?auto_244759 ?auto_244758 ) ) ( HOIST-AT ?auto_244762 ?auto_244759 ) ( LIFTING ?auto_244762 ?auto_244757 ) ( not ( = ?auto_244761 ?auto_244762 ) ) )
    :subtasks
    ( ( !LOAD ?auto_244762 ?auto_244757 ?auto_244760 ?auto_244759 )
      ( MAKE-1CRATE ?auto_244756 ?auto_244757 )
      ( MAKE-1CRATE-VERIFY ?auto_244756 ?auto_244757 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244763 - SURFACE
      ?auto_244764 - SURFACE
    )
    :vars
    (
      ?auto_244767 - HOIST
      ?auto_244768 - PLACE
      ?auto_244769 - TRUCK
      ?auto_244765 - PLACE
      ?auto_244766 - HOIST
      ?auto_244770 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244767 ?auto_244768 ) ( SURFACE-AT ?auto_244763 ?auto_244768 ) ( CLEAR ?auto_244763 ) ( IS-CRATE ?auto_244764 ) ( not ( = ?auto_244763 ?auto_244764 ) ) ( AVAILABLE ?auto_244767 ) ( TRUCK-AT ?auto_244769 ?auto_244765 ) ( not ( = ?auto_244765 ?auto_244768 ) ) ( HOIST-AT ?auto_244766 ?auto_244765 ) ( not ( = ?auto_244767 ?auto_244766 ) ) ( AVAILABLE ?auto_244766 ) ( SURFACE-AT ?auto_244764 ?auto_244765 ) ( ON ?auto_244764 ?auto_244770 ) ( CLEAR ?auto_244764 ) ( not ( = ?auto_244763 ?auto_244770 ) ) ( not ( = ?auto_244764 ?auto_244770 ) ) )
    :subtasks
    ( ( !LIFT ?auto_244766 ?auto_244764 ?auto_244770 ?auto_244765 )
      ( MAKE-1CRATE ?auto_244763 ?auto_244764 )
      ( MAKE-1CRATE-VERIFY ?auto_244763 ?auto_244764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244771 - SURFACE
      ?auto_244772 - SURFACE
    )
    :vars
    (
      ?auto_244774 - HOIST
      ?auto_244775 - PLACE
      ?auto_244773 - PLACE
      ?auto_244778 - HOIST
      ?auto_244777 - SURFACE
      ?auto_244776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244774 ?auto_244775 ) ( SURFACE-AT ?auto_244771 ?auto_244775 ) ( CLEAR ?auto_244771 ) ( IS-CRATE ?auto_244772 ) ( not ( = ?auto_244771 ?auto_244772 ) ) ( AVAILABLE ?auto_244774 ) ( not ( = ?auto_244773 ?auto_244775 ) ) ( HOIST-AT ?auto_244778 ?auto_244773 ) ( not ( = ?auto_244774 ?auto_244778 ) ) ( AVAILABLE ?auto_244778 ) ( SURFACE-AT ?auto_244772 ?auto_244773 ) ( ON ?auto_244772 ?auto_244777 ) ( CLEAR ?auto_244772 ) ( not ( = ?auto_244771 ?auto_244777 ) ) ( not ( = ?auto_244772 ?auto_244777 ) ) ( TRUCK-AT ?auto_244776 ?auto_244775 ) )
    :subtasks
    ( ( !DRIVE ?auto_244776 ?auto_244775 ?auto_244773 )
      ( MAKE-1CRATE ?auto_244771 ?auto_244772 )
      ( MAKE-1CRATE-VERIFY ?auto_244771 ?auto_244772 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244788 - SURFACE
      ?auto_244789 - SURFACE
      ?auto_244790 - SURFACE
    )
    :vars
    (
      ?auto_244791 - HOIST
      ?auto_244792 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244791 ?auto_244792 ) ( SURFACE-AT ?auto_244789 ?auto_244792 ) ( CLEAR ?auto_244789 ) ( LIFTING ?auto_244791 ?auto_244790 ) ( IS-CRATE ?auto_244790 ) ( not ( = ?auto_244789 ?auto_244790 ) ) ( ON ?auto_244789 ?auto_244788 ) ( not ( = ?auto_244788 ?auto_244789 ) ) ( not ( = ?auto_244788 ?auto_244790 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244789 ?auto_244790 )
      ( MAKE-2CRATE-VERIFY ?auto_244788 ?auto_244789 ?auto_244790 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244798 - SURFACE
      ?auto_244799 - SURFACE
      ?auto_244800 - SURFACE
    )
    :vars
    (
      ?auto_244801 - HOIST
      ?auto_244802 - PLACE
      ?auto_244803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244801 ?auto_244802 ) ( SURFACE-AT ?auto_244799 ?auto_244802 ) ( CLEAR ?auto_244799 ) ( IS-CRATE ?auto_244800 ) ( not ( = ?auto_244799 ?auto_244800 ) ) ( TRUCK-AT ?auto_244803 ?auto_244802 ) ( AVAILABLE ?auto_244801 ) ( IN ?auto_244800 ?auto_244803 ) ( ON ?auto_244799 ?auto_244798 ) ( not ( = ?auto_244798 ?auto_244799 ) ) ( not ( = ?auto_244798 ?auto_244800 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244799 ?auto_244800 )
      ( MAKE-2CRATE-VERIFY ?auto_244798 ?auto_244799 ?auto_244800 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244804 - SURFACE
      ?auto_244805 - SURFACE
    )
    :vars
    (
      ?auto_244806 - HOIST
      ?auto_244807 - PLACE
      ?auto_244808 - TRUCK
      ?auto_244809 - SURFACE
      ?auto_244810 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244806 ?auto_244807 ) ( SURFACE-AT ?auto_244804 ?auto_244807 ) ( CLEAR ?auto_244804 ) ( IS-CRATE ?auto_244805 ) ( not ( = ?auto_244804 ?auto_244805 ) ) ( AVAILABLE ?auto_244806 ) ( IN ?auto_244805 ?auto_244808 ) ( ON ?auto_244804 ?auto_244809 ) ( not ( = ?auto_244809 ?auto_244804 ) ) ( not ( = ?auto_244809 ?auto_244805 ) ) ( TRUCK-AT ?auto_244808 ?auto_244810 ) ( not ( = ?auto_244810 ?auto_244807 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_244808 ?auto_244810 ?auto_244807 )
      ( MAKE-2CRATE ?auto_244809 ?auto_244804 ?auto_244805 )
      ( MAKE-1CRATE-VERIFY ?auto_244804 ?auto_244805 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244811 - SURFACE
      ?auto_244812 - SURFACE
      ?auto_244813 - SURFACE
    )
    :vars
    (
      ?auto_244815 - HOIST
      ?auto_244817 - PLACE
      ?auto_244816 - TRUCK
      ?auto_244814 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244815 ?auto_244817 ) ( SURFACE-AT ?auto_244812 ?auto_244817 ) ( CLEAR ?auto_244812 ) ( IS-CRATE ?auto_244813 ) ( not ( = ?auto_244812 ?auto_244813 ) ) ( AVAILABLE ?auto_244815 ) ( IN ?auto_244813 ?auto_244816 ) ( ON ?auto_244812 ?auto_244811 ) ( not ( = ?auto_244811 ?auto_244812 ) ) ( not ( = ?auto_244811 ?auto_244813 ) ) ( TRUCK-AT ?auto_244816 ?auto_244814 ) ( not ( = ?auto_244814 ?auto_244817 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244812 ?auto_244813 )
      ( MAKE-2CRATE-VERIFY ?auto_244811 ?auto_244812 ?auto_244813 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244818 - SURFACE
      ?auto_244819 - SURFACE
    )
    :vars
    (
      ?auto_244822 - HOIST
      ?auto_244823 - PLACE
      ?auto_244820 - SURFACE
      ?auto_244821 - TRUCK
      ?auto_244824 - PLACE
      ?auto_244825 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_244822 ?auto_244823 ) ( SURFACE-AT ?auto_244818 ?auto_244823 ) ( CLEAR ?auto_244818 ) ( IS-CRATE ?auto_244819 ) ( not ( = ?auto_244818 ?auto_244819 ) ) ( AVAILABLE ?auto_244822 ) ( ON ?auto_244818 ?auto_244820 ) ( not ( = ?auto_244820 ?auto_244818 ) ) ( not ( = ?auto_244820 ?auto_244819 ) ) ( TRUCK-AT ?auto_244821 ?auto_244824 ) ( not ( = ?auto_244824 ?auto_244823 ) ) ( HOIST-AT ?auto_244825 ?auto_244824 ) ( LIFTING ?auto_244825 ?auto_244819 ) ( not ( = ?auto_244822 ?auto_244825 ) ) )
    :subtasks
    ( ( !LOAD ?auto_244825 ?auto_244819 ?auto_244821 ?auto_244824 )
      ( MAKE-2CRATE ?auto_244820 ?auto_244818 ?auto_244819 )
      ( MAKE-1CRATE-VERIFY ?auto_244818 ?auto_244819 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244826 - SURFACE
      ?auto_244827 - SURFACE
      ?auto_244828 - SURFACE
    )
    :vars
    (
      ?auto_244831 - HOIST
      ?auto_244833 - PLACE
      ?auto_244832 - TRUCK
      ?auto_244829 - PLACE
      ?auto_244830 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_244831 ?auto_244833 ) ( SURFACE-AT ?auto_244827 ?auto_244833 ) ( CLEAR ?auto_244827 ) ( IS-CRATE ?auto_244828 ) ( not ( = ?auto_244827 ?auto_244828 ) ) ( AVAILABLE ?auto_244831 ) ( ON ?auto_244827 ?auto_244826 ) ( not ( = ?auto_244826 ?auto_244827 ) ) ( not ( = ?auto_244826 ?auto_244828 ) ) ( TRUCK-AT ?auto_244832 ?auto_244829 ) ( not ( = ?auto_244829 ?auto_244833 ) ) ( HOIST-AT ?auto_244830 ?auto_244829 ) ( LIFTING ?auto_244830 ?auto_244828 ) ( not ( = ?auto_244831 ?auto_244830 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244827 ?auto_244828 )
      ( MAKE-2CRATE-VERIFY ?auto_244826 ?auto_244827 ?auto_244828 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244834 - SURFACE
      ?auto_244835 - SURFACE
    )
    :vars
    (
      ?auto_244837 - HOIST
      ?auto_244836 - PLACE
      ?auto_244838 - SURFACE
      ?auto_244839 - TRUCK
      ?auto_244840 - PLACE
      ?auto_244841 - HOIST
      ?auto_244842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244837 ?auto_244836 ) ( SURFACE-AT ?auto_244834 ?auto_244836 ) ( CLEAR ?auto_244834 ) ( IS-CRATE ?auto_244835 ) ( not ( = ?auto_244834 ?auto_244835 ) ) ( AVAILABLE ?auto_244837 ) ( ON ?auto_244834 ?auto_244838 ) ( not ( = ?auto_244838 ?auto_244834 ) ) ( not ( = ?auto_244838 ?auto_244835 ) ) ( TRUCK-AT ?auto_244839 ?auto_244840 ) ( not ( = ?auto_244840 ?auto_244836 ) ) ( HOIST-AT ?auto_244841 ?auto_244840 ) ( not ( = ?auto_244837 ?auto_244841 ) ) ( AVAILABLE ?auto_244841 ) ( SURFACE-AT ?auto_244835 ?auto_244840 ) ( ON ?auto_244835 ?auto_244842 ) ( CLEAR ?auto_244835 ) ( not ( = ?auto_244834 ?auto_244842 ) ) ( not ( = ?auto_244835 ?auto_244842 ) ) ( not ( = ?auto_244838 ?auto_244842 ) ) )
    :subtasks
    ( ( !LIFT ?auto_244841 ?auto_244835 ?auto_244842 ?auto_244840 )
      ( MAKE-2CRATE ?auto_244838 ?auto_244834 ?auto_244835 )
      ( MAKE-1CRATE-VERIFY ?auto_244834 ?auto_244835 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244843 - SURFACE
      ?auto_244844 - SURFACE
      ?auto_244845 - SURFACE
    )
    :vars
    (
      ?auto_244848 - HOIST
      ?auto_244847 - PLACE
      ?auto_244851 - TRUCK
      ?auto_244850 - PLACE
      ?auto_244849 - HOIST
      ?auto_244846 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244848 ?auto_244847 ) ( SURFACE-AT ?auto_244844 ?auto_244847 ) ( CLEAR ?auto_244844 ) ( IS-CRATE ?auto_244845 ) ( not ( = ?auto_244844 ?auto_244845 ) ) ( AVAILABLE ?auto_244848 ) ( ON ?auto_244844 ?auto_244843 ) ( not ( = ?auto_244843 ?auto_244844 ) ) ( not ( = ?auto_244843 ?auto_244845 ) ) ( TRUCK-AT ?auto_244851 ?auto_244850 ) ( not ( = ?auto_244850 ?auto_244847 ) ) ( HOIST-AT ?auto_244849 ?auto_244850 ) ( not ( = ?auto_244848 ?auto_244849 ) ) ( AVAILABLE ?auto_244849 ) ( SURFACE-AT ?auto_244845 ?auto_244850 ) ( ON ?auto_244845 ?auto_244846 ) ( CLEAR ?auto_244845 ) ( not ( = ?auto_244844 ?auto_244846 ) ) ( not ( = ?auto_244845 ?auto_244846 ) ) ( not ( = ?auto_244843 ?auto_244846 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244844 ?auto_244845 )
      ( MAKE-2CRATE-VERIFY ?auto_244843 ?auto_244844 ?auto_244845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244852 - SURFACE
      ?auto_244853 - SURFACE
    )
    :vars
    (
      ?auto_244854 - HOIST
      ?auto_244859 - PLACE
      ?auto_244860 - SURFACE
      ?auto_244855 - PLACE
      ?auto_244858 - HOIST
      ?auto_244857 - SURFACE
      ?auto_244856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244854 ?auto_244859 ) ( SURFACE-AT ?auto_244852 ?auto_244859 ) ( CLEAR ?auto_244852 ) ( IS-CRATE ?auto_244853 ) ( not ( = ?auto_244852 ?auto_244853 ) ) ( AVAILABLE ?auto_244854 ) ( ON ?auto_244852 ?auto_244860 ) ( not ( = ?auto_244860 ?auto_244852 ) ) ( not ( = ?auto_244860 ?auto_244853 ) ) ( not ( = ?auto_244855 ?auto_244859 ) ) ( HOIST-AT ?auto_244858 ?auto_244855 ) ( not ( = ?auto_244854 ?auto_244858 ) ) ( AVAILABLE ?auto_244858 ) ( SURFACE-AT ?auto_244853 ?auto_244855 ) ( ON ?auto_244853 ?auto_244857 ) ( CLEAR ?auto_244853 ) ( not ( = ?auto_244852 ?auto_244857 ) ) ( not ( = ?auto_244853 ?auto_244857 ) ) ( not ( = ?auto_244860 ?auto_244857 ) ) ( TRUCK-AT ?auto_244856 ?auto_244859 ) )
    :subtasks
    ( ( !DRIVE ?auto_244856 ?auto_244859 ?auto_244855 )
      ( MAKE-2CRATE ?auto_244860 ?auto_244852 ?auto_244853 )
      ( MAKE-1CRATE-VERIFY ?auto_244852 ?auto_244853 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244861 - SURFACE
      ?auto_244862 - SURFACE
      ?auto_244863 - SURFACE
    )
    :vars
    (
      ?auto_244866 - HOIST
      ?auto_244867 - PLACE
      ?auto_244868 - PLACE
      ?auto_244865 - HOIST
      ?auto_244864 - SURFACE
      ?auto_244869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244866 ?auto_244867 ) ( SURFACE-AT ?auto_244862 ?auto_244867 ) ( CLEAR ?auto_244862 ) ( IS-CRATE ?auto_244863 ) ( not ( = ?auto_244862 ?auto_244863 ) ) ( AVAILABLE ?auto_244866 ) ( ON ?auto_244862 ?auto_244861 ) ( not ( = ?auto_244861 ?auto_244862 ) ) ( not ( = ?auto_244861 ?auto_244863 ) ) ( not ( = ?auto_244868 ?auto_244867 ) ) ( HOIST-AT ?auto_244865 ?auto_244868 ) ( not ( = ?auto_244866 ?auto_244865 ) ) ( AVAILABLE ?auto_244865 ) ( SURFACE-AT ?auto_244863 ?auto_244868 ) ( ON ?auto_244863 ?auto_244864 ) ( CLEAR ?auto_244863 ) ( not ( = ?auto_244862 ?auto_244864 ) ) ( not ( = ?auto_244863 ?auto_244864 ) ) ( not ( = ?auto_244861 ?auto_244864 ) ) ( TRUCK-AT ?auto_244869 ?auto_244867 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244862 ?auto_244863 )
      ( MAKE-2CRATE-VERIFY ?auto_244861 ?auto_244862 ?auto_244863 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244870 - SURFACE
      ?auto_244871 - SURFACE
    )
    :vars
    (
      ?auto_244877 - HOIST
      ?auto_244878 - PLACE
      ?auto_244873 - SURFACE
      ?auto_244874 - PLACE
      ?auto_244872 - HOIST
      ?auto_244876 - SURFACE
      ?auto_244875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244877 ?auto_244878 ) ( IS-CRATE ?auto_244871 ) ( not ( = ?auto_244870 ?auto_244871 ) ) ( not ( = ?auto_244873 ?auto_244870 ) ) ( not ( = ?auto_244873 ?auto_244871 ) ) ( not ( = ?auto_244874 ?auto_244878 ) ) ( HOIST-AT ?auto_244872 ?auto_244874 ) ( not ( = ?auto_244877 ?auto_244872 ) ) ( AVAILABLE ?auto_244872 ) ( SURFACE-AT ?auto_244871 ?auto_244874 ) ( ON ?auto_244871 ?auto_244876 ) ( CLEAR ?auto_244871 ) ( not ( = ?auto_244870 ?auto_244876 ) ) ( not ( = ?auto_244871 ?auto_244876 ) ) ( not ( = ?auto_244873 ?auto_244876 ) ) ( TRUCK-AT ?auto_244875 ?auto_244878 ) ( SURFACE-AT ?auto_244873 ?auto_244878 ) ( CLEAR ?auto_244873 ) ( LIFTING ?auto_244877 ?auto_244870 ) ( IS-CRATE ?auto_244870 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244873 ?auto_244870 )
      ( MAKE-2CRATE ?auto_244873 ?auto_244870 ?auto_244871 )
      ( MAKE-1CRATE-VERIFY ?auto_244870 ?auto_244871 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244879 - SURFACE
      ?auto_244880 - SURFACE
      ?auto_244881 - SURFACE
    )
    :vars
    (
      ?auto_244887 - HOIST
      ?auto_244885 - PLACE
      ?auto_244883 - PLACE
      ?auto_244882 - HOIST
      ?auto_244884 - SURFACE
      ?auto_244886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244887 ?auto_244885 ) ( IS-CRATE ?auto_244881 ) ( not ( = ?auto_244880 ?auto_244881 ) ) ( not ( = ?auto_244879 ?auto_244880 ) ) ( not ( = ?auto_244879 ?auto_244881 ) ) ( not ( = ?auto_244883 ?auto_244885 ) ) ( HOIST-AT ?auto_244882 ?auto_244883 ) ( not ( = ?auto_244887 ?auto_244882 ) ) ( AVAILABLE ?auto_244882 ) ( SURFACE-AT ?auto_244881 ?auto_244883 ) ( ON ?auto_244881 ?auto_244884 ) ( CLEAR ?auto_244881 ) ( not ( = ?auto_244880 ?auto_244884 ) ) ( not ( = ?auto_244881 ?auto_244884 ) ) ( not ( = ?auto_244879 ?auto_244884 ) ) ( TRUCK-AT ?auto_244886 ?auto_244885 ) ( SURFACE-AT ?auto_244879 ?auto_244885 ) ( CLEAR ?auto_244879 ) ( LIFTING ?auto_244887 ?auto_244880 ) ( IS-CRATE ?auto_244880 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244880 ?auto_244881 )
      ( MAKE-2CRATE-VERIFY ?auto_244879 ?auto_244880 ?auto_244881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244888 - SURFACE
      ?auto_244889 - SURFACE
    )
    :vars
    (
      ?auto_244896 - HOIST
      ?auto_244894 - PLACE
      ?auto_244891 - SURFACE
      ?auto_244895 - PLACE
      ?auto_244892 - HOIST
      ?auto_244890 - SURFACE
      ?auto_244893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244896 ?auto_244894 ) ( IS-CRATE ?auto_244889 ) ( not ( = ?auto_244888 ?auto_244889 ) ) ( not ( = ?auto_244891 ?auto_244888 ) ) ( not ( = ?auto_244891 ?auto_244889 ) ) ( not ( = ?auto_244895 ?auto_244894 ) ) ( HOIST-AT ?auto_244892 ?auto_244895 ) ( not ( = ?auto_244896 ?auto_244892 ) ) ( AVAILABLE ?auto_244892 ) ( SURFACE-AT ?auto_244889 ?auto_244895 ) ( ON ?auto_244889 ?auto_244890 ) ( CLEAR ?auto_244889 ) ( not ( = ?auto_244888 ?auto_244890 ) ) ( not ( = ?auto_244889 ?auto_244890 ) ) ( not ( = ?auto_244891 ?auto_244890 ) ) ( TRUCK-AT ?auto_244893 ?auto_244894 ) ( SURFACE-AT ?auto_244891 ?auto_244894 ) ( CLEAR ?auto_244891 ) ( IS-CRATE ?auto_244888 ) ( AVAILABLE ?auto_244896 ) ( IN ?auto_244888 ?auto_244893 ) )
    :subtasks
    ( ( !UNLOAD ?auto_244896 ?auto_244888 ?auto_244893 ?auto_244894 )
      ( MAKE-2CRATE ?auto_244891 ?auto_244888 ?auto_244889 )
      ( MAKE-1CRATE-VERIFY ?auto_244888 ?auto_244889 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_244897 - SURFACE
      ?auto_244898 - SURFACE
      ?auto_244899 - SURFACE
    )
    :vars
    (
      ?auto_244902 - HOIST
      ?auto_244900 - PLACE
      ?auto_244901 - PLACE
      ?auto_244904 - HOIST
      ?auto_244905 - SURFACE
      ?auto_244903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_244902 ?auto_244900 ) ( IS-CRATE ?auto_244899 ) ( not ( = ?auto_244898 ?auto_244899 ) ) ( not ( = ?auto_244897 ?auto_244898 ) ) ( not ( = ?auto_244897 ?auto_244899 ) ) ( not ( = ?auto_244901 ?auto_244900 ) ) ( HOIST-AT ?auto_244904 ?auto_244901 ) ( not ( = ?auto_244902 ?auto_244904 ) ) ( AVAILABLE ?auto_244904 ) ( SURFACE-AT ?auto_244899 ?auto_244901 ) ( ON ?auto_244899 ?auto_244905 ) ( CLEAR ?auto_244899 ) ( not ( = ?auto_244898 ?auto_244905 ) ) ( not ( = ?auto_244899 ?auto_244905 ) ) ( not ( = ?auto_244897 ?auto_244905 ) ) ( TRUCK-AT ?auto_244903 ?auto_244900 ) ( SURFACE-AT ?auto_244897 ?auto_244900 ) ( CLEAR ?auto_244897 ) ( IS-CRATE ?auto_244898 ) ( AVAILABLE ?auto_244902 ) ( IN ?auto_244898 ?auto_244903 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244898 ?auto_244899 )
      ( MAKE-2CRATE-VERIFY ?auto_244897 ?auto_244898 ?auto_244899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_244942 - SURFACE
      ?auto_244943 - SURFACE
    )
    :vars
    (
      ?auto_244947 - HOIST
      ?auto_244948 - PLACE
      ?auto_244944 - SURFACE
      ?auto_244950 - PLACE
      ?auto_244946 - HOIST
      ?auto_244945 - SURFACE
      ?auto_244949 - TRUCK
      ?auto_244951 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244947 ?auto_244948 ) ( SURFACE-AT ?auto_244942 ?auto_244948 ) ( CLEAR ?auto_244942 ) ( IS-CRATE ?auto_244943 ) ( not ( = ?auto_244942 ?auto_244943 ) ) ( AVAILABLE ?auto_244947 ) ( ON ?auto_244942 ?auto_244944 ) ( not ( = ?auto_244944 ?auto_244942 ) ) ( not ( = ?auto_244944 ?auto_244943 ) ) ( not ( = ?auto_244950 ?auto_244948 ) ) ( HOIST-AT ?auto_244946 ?auto_244950 ) ( not ( = ?auto_244947 ?auto_244946 ) ) ( AVAILABLE ?auto_244946 ) ( SURFACE-AT ?auto_244943 ?auto_244950 ) ( ON ?auto_244943 ?auto_244945 ) ( CLEAR ?auto_244943 ) ( not ( = ?auto_244942 ?auto_244945 ) ) ( not ( = ?auto_244943 ?auto_244945 ) ) ( not ( = ?auto_244944 ?auto_244945 ) ) ( TRUCK-AT ?auto_244949 ?auto_244951 ) ( not ( = ?auto_244951 ?auto_244948 ) ) ( not ( = ?auto_244950 ?auto_244951 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_244949 ?auto_244951 ?auto_244948 )
      ( MAKE-1CRATE ?auto_244942 ?auto_244943 )
      ( MAKE-1CRATE-VERIFY ?auto_244942 ?auto_244943 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_244981 - SURFACE
      ?auto_244982 - SURFACE
      ?auto_244983 - SURFACE
      ?auto_244984 - SURFACE
    )
    :vars
    (
      ?auto_244985 - HOIST
      ?auto_244986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_244985 ?auto_244986 ) ( SURFACE-AT ?auto_244983 ?auto_244986 ) ( CLEAR ?auto_244983 ) ( LIFTING ?auto_244985 ?auto_244984 ) ( IS-CRATE ?auto_244984 ) ( not ( = ?auto_244983 ?auto_244984 ) ) ( ON ?auto_244982 ?auto_244981 ) ( ON ?auto_244983 ?auto_244982 ) ( not ( = ?auto_244981 ?auto_244982 ) ) ( not ( = ?auto_244981 ?auto_244983 ) ) ( not ( = ?auto_244981 ?auto_244984 ) ) ( not ( = ?auto_244982 ?auto_244983 ) ) ( not ( = ?auto_244982 ?auto_244984 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_244983 ?auto_244984 )
      ( MAKE-3CRATE-VERIFY ?auto_244981 ?auto_244982 ?auto_244983 ?auto_244984 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_244998 - SURFACE
      ?auto_244999 - SURFACE
      ?auto_245000 - SURFACE
      ?auto_245001 - SURFACE
    )
    :vars
    (
      ?auto_245003 - HOIST
      ?auto_245004 - PLACE
      ?auto_245002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245003 ?auto_245004 ) ( SURFACE-AT ?auto_245000 ?auto_245004 ) ( CLEAR ?auto_245000 ) ( IS-CRATE ?auto_245001 ) ( not ( = ?auto_245000 ?auto_245001 ) ) ( TRUCK-AT ?auto_245002 ?auto_245004 ) ( AVAILABLE ?auto_245003 ) ( IN ?auto_245001 ?auto_245002 ) ( ON ?auto_245000 ?auto_244999 ) ( not ( = ?auto_244999 ?auto_245000 ) ) ( not ( = ?auto_244999 ?auto_245001 ) ) ( ON ?auto_244999 ?auto_244998 ) ( not ( = ?auto_244998 ?auto_244999 ) ) ( not ( = ?auto_244998 ?auto_245000 ) ) ( not ( = ?auto_244998 ?auto_245001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_244999 ?auto_245000 ?auto_245001 )
      ( MAKE-3CRATE-VERIFY ?auto_244998 ?auto_244999 ?auto_245000 ?auto_245001 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245019 - SURFACE
      ?auto_245020 - SURFACE
      ?auto_245021 - SURFACE
      ?auto_245022 - SURFACE
    )
    :vars
    (
      ?auto_245025 - HOIST
      ?auto_245023 - PLACE
      ?auto_245024 - TRUCK
      ?auto_245026 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245025 ?auto_245023 ) ( SURFACE-AT ?auto_245021 ?auto_245023 ) ( CLEAR ?auto_245021 ) ( IS-CRATE ?auto_245022 ) ( not ( = ?auto_245021 ?auto_245022 ) ) ( AVAILABLE ?auto_245025 ) ( IN ?auto_245022 ?auto_245024 ) ( ON ?auto_245021 ?auto_245020 ) ( not ( = ?auto_245020 ?auto_245021 ) ) ( not ( = ?auto_245020 ?auto_245022 ) ) ( TRUCK-AT ?auto_245024 ?auto_245026 ) ( not ( = ?auto_245026 ?auto_245023 ) ) ( ON ?auto_245020 ?auto_245019 ) ( not ( = ?auto_245019 ?auto_245020 ) ) ( not ( = ?auto_245019 ?auto_245021 ) ) ( not ( = ?auto_245019 ?auto_245022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245020 ?auto_245021 ?auto_245022 )
      ( MAKE-3CRATE-VERIFY ?auto_245019 ?auto_245020 ?auto_245021 ?auto_245022 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245043 - SURFACE
      ?auto_245044 - SURFACE
      ?auto_245045 - SURFACE
      ?auto_245046 - SURFACE
    )
    :vars
    (
      ?auto_245047 - HOIST
      ?auto_245050 - PLACE
      ?auto_245051 - TRUCK
      ?auto_245048 - PLACE
      ?auto_245049 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_245047 ?auto_245050 ) ( SURFACE-AT ?auto_245045 ?auto_245050 ) ( CLEAR ?auto_245045 ) ( IS-CRATE ?auto_245046 ) ( not ( = ?auto_245045 ?auto_245046 ) ) ( AVAILABLE ?auto_245047 ) ( ON ?auto_245045 ?auto_245044 ) ( not ( = ?auto_245044 ?auto_245045 ) ) ( not ( = ?auto_245044 ?auto_245046 ) ) ( TRUCK-AT ?auto_245051 ?auto_245048 ) ( not ( = ?auto_245048 ?auto_245050 ) ) ( HOIST-AT ?auto_245049 ?auto_245048 ) ( LIFTING ?auto_245049 ?auto_245046 ) ( not ( = ?auto_245047 ?auto_245049 ) ) ( ON ?auto_245044 ?auto_245043 ) ( not ( = ?auto_245043 ?auto_245044 ) ) ( not ( = ?auto_245043 ?auto_245045 ) ) ( not ( = ?auto_245043 ?auto_245046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245044 ?auto_245045 ?auto_245046 )
      ( MAKE-3CRATE-VERIFY ?auto_245043 ?auto_245044 ?auto_245045 ?auto_245046 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245070 - SURFACE
      ?auto_245071 - SURFACE
      ?auto_245072 - SURFACE
      ?auto_245073 - SURFACE
    )
    :vars
    (
      ?auto_245077 - HOIST
      ?auto_245074 - PLACE
      ?auto_245078 - TRUCK
      ?auto_245079 - PLACE
      ?auto_245075 - HOIST
      ?auto_245076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245077 ?auto_245074 ) ( SURFACE-AT ?auto_245072 ?auto_245074 ) ( CLEAR ?auto_245072 ) ( IS-CRATE ?auto_245073 ) ( not ( = ?auto_245072 ?auto_245073 ) ) ( AVAILABLE ?auto_245077 ) ( ON ?auto_245072 ?auto_245071 ) ( not ( = ?auto_245071 ?auto_245072 ) ) ( not ( = ?auto_245071 ?auto_245073 ) ) ( TRUCK-AT ?auto_245078 ?auto_245079 ) ( not ( = ?auto_245079 ?auto_245074 ) ) ( HOIST-AT ?auto_245075 ?auto_245079 ) ( not ( = ?auto_245077 ?auto_245075 ) ) ( AVAILABLE ?auto_245075 ) ( SURFACE-AT ?auto_245073 ?auto_245079 ) ( ON ?auto_245073 ?auto_245076 ) ( CLEAR ?auto_245073 ) ( not ( = ?auto_245072 ?auto_245076 ) ) ( not ( = ?auto_245073 ?auto_245076 ) ) ( not ( = ?auto_245071 ?auto_245076 ) ) ( ON ?auto_245071 ?auto_245070 ) ( not ( = ?auto_245070 ?auto_245071 ) ) ( not ( = ?auto_245070 ?auto_245072 ) ) ( not ( = ?auto_245070 ?auto_245073 ) ) ( not ( = ?auto_245070 ?auto_245076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245071 ?auto_245072 ?auto_245073 )
      ( MAKE-3CRATE-VERIFY ?auto_245070 ?auto_245071 ?auto_245072 ?auto_245073 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245098 - SURFACE
      ?auto_245099 - SURFACE
      ?auto_245100 - SURFACE
      ?auto_245101 - SURFACE
    )
    :vars
    (
      ?auto_245105 - HOIST
      ?auto_245103 - PLACE
      ?auto_245102 - PLACE
      ?auto_245107 - HOIST
      ?auto_245104 - SURFACE
      ?auto_245106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245105 ?auto_245103 ) ( SURFACE-AT ?auto_245100 ?auto_245103 ) ( CLEAR ?auto_245100 ) ( IS-CRATE ?auto_245101 ) ( not ( = ?auto_245100 ?auto_245101 ) ) ( AVAILABLE ?auto_245105 ) ( ON ?auto_245100 ?auto_245099 ) ( not ( = ?auto_245099 ?auto_245100 ) ) ( not ( = ?auto_245099 ?auto_245101 ) ) ( not ( = ?auto_245102 ?auto_245103 ) ) ( HOIST-AT ?auto_245107 ?auto_245102 ) ( not ( = ?auto_245105 ?auto_245107 ) ) ( AVAILABLE ?auto_245107 ) ( SURFACE-AT ?auto_245101 ?auto_245102 ) ( ON ?auto_245101 ?auto_245104 ) ( CLEAR ?auto_245101 ) ( not ( = ?auto_245100 ?auto_245104 ) ) ( not ( = ?auto_245101 ?auto_245104 ) ) ( not ( = ?auto_245099 ?auto_245104 ) ) ( TRUCK-AT ?auto_245106 ?auto_245103 ) ( ON ?auto_245099 ?auto_245098 ) ( not ( = ?auto_245098 ?auto_245099 ) ) ( not ( = ?auto_245098 ?auto_245100 ) ) ( not ( = ?auto_245098 ?auto_245101 ) ) ( not ( = ?auto_245098 ?auto_245104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245099 ?auto_245100 ?auto_245101 )
      ( MAKE-3CRATE-VERIFY ?auto_245098 ?auto_245099 ?auto_245100 ?auto_245101 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245126 - SURFACE
      ?auto_245127 - SURFACE
      ?auto_245128 - SURFACE
      ?auto_245129 - SURFACE
    )
    :vars
    (
      ?auto_245130 - HOIST
      ?auto_245133 - PLACE
      ?auto_245131 - PLACE
      ?auto_245135 - HOIST
      ?auto_245134 - SURFACE
      ?auto_245132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245130 ?auto_245133 ) ( IS-CRATE ?auto_245129 ) ( not ( = ?auto_245128 ?auto_245129 ) ) ( not ( = ?auto_245127 ?auto_245128 ) ) ( not ( = ?auto_245127 ?auto_245129 ) ) ( not ( = ?auto_245131 ?auto_245133 ) ) ( HOIST-AT ?auto_245135 ?auto_245131 ) ( not ( = ?auto_245130 ?auto_245135 ) ) ( AVAILABLE ?auto_245135 ) ( SURFACE-AT ?auto_245129 ?auto_245131 ) ( ON ?auto_245129 ?auto_245134 ) ( CLEAR ?auto_245129 ) ( not ( = ?auto_245128 ?auto_245134 ) ) ( not ( = ?auto_245129 ?auto_245134 ) ) ( not ( = ?auto_245127 ?auto_245134 ) ) ( TRUCK-AT ?auto_245132 ?auto_245133 ) ( SURFACE-AT ?auto_245127 ?auto_245133 ) ( CLEAR ?auto_245127 ) ( LIFTING ?auto_245130 ?auto_245128 ) ( IS-CRATE ?auto_245128 ) ( ON ?auto_245127 ?auto_245126 ) ( not ( = ?auto_245126 ?auto_245127 ) ) ( not ( = ?auto_245126 ?auto_245128 ) ) ( not ( = ?auto_245126 ?auto_245129 ) ) ( not ( = ?auto_245126 ?auto_245134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245127 ?auto_245128 ?auto_245129 )
      ( MAKE-3CRATE-VERIFY ?auto_245126 ?auto_245127 ?auto_245128 ?auto_245129 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_245154 - SURFACE
      ?auto_245155 - SURFACE
      ?auto_245156 - SURFACE
      ?auto_245157 - SURFACE
    )
    :vars
    (
      ?auto_245159 - HOIST
      ?auto_245161 - PLACE
      ?auto_245163 - PLACE
      ?auto_245160 - HOIST
      ?auto_245158 - SURFACE
      ?auto_245162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245159 ?auto_245161 ) ( IS-CRATE ?auto_245157 ) ( not ( = ?auto_245156 ?auto_245157 ) ) ( not ( = ?auto_245155 ?auto_245156 ) ) ( not ( = ?auto_245155 ?auto_245157 ) ) ( not ( = ?auto_245163 ?auto_245161 ) ) ( HOIST-AT ?auto_245160 ?auto_245163 ) ( not ( = ?auto_245159 ?auto_245160 ) ) ( AVAILABLE ?auto_245160 ) ( SURFACE-AT ?auto_245157 ?auto_245163 ) ( ON ?auto_245157 ?auto_245158 ) ( CLEAR ?auto_245157 ) ( not ( = ?auto_245156 ?auto_245158 ) ) ( not ( = ?auto_245157 ?auto_245158 ) ) ( not ( = ?auto_245155 ?auto_245158 ) ) ( TRUCK-AT ?auto_245162 ?auto_245161 ) ( SURFACE-AT ?auto_245155 ?auto_245161 ) ( CLEAR ?auto_245155 ) ( IS-CRATE ?auto_245156 ) ( AVAILABLE ?auto_245159 ) ( IN ?auto_245156 ?auto_245162 ) ( ON ?auto_245155 ?auto_245154 ) ( not ( = ?auto_245154 ?auto_245155 ) ) ( not ( = ?auto_245154 ?auto_245156 ) ) ( not ( = ?auto_245154 ?auto_245157 ) ) ( not ( = ?auto_245154 ?auto_245158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245155 ?auto_245156 ?auto_245157 )
      ( MAKE-3CRATE-VERIFY ?auto_245154 ?auto_245155 ?auto_245156 ?auto_245157 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245445 - SURFACE
      ?auto_245446 - SURFACE
      ?auto_245447 - SURFACE
      ?auto_245449 - SURFACE
      ?auto_245448 - SURFACE
    )
    :vars
    (
      ?auto_245451 - HOIST
      ?auto_245450 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245451 ?auto_245450 ) ( SURFACE-AT ?auto_245449 ?auto_245450 ) ( CLEAR ?auto_245449 ) ( LIFTING ?auto_245451 ?auto_245448 ) ( IS-CRATE ?auto_245448 ) ( not ( = ?auto_245449 ?auto_245448 ) ) ( ON ?auto_245446 ?auto_245445 ) ( ON ?auto_245447 ?auto_245446 ) ( ON ?auto_245449 ?auto_245447 ) ( not ( = ?auto_245445 ?auto_245446 ) ) ( not ( = ?auto_245445 ?auto_245447 ) ) ( not ( = ?auto_245445 ?auto_245449 ) ) ( not ( = ?auto_245445 ?auto_245448 ) ) ( not ( = ?auto_245446 ?auto_245447 ) ) ( not ( = ?auto_245446 ?auto_245449 ) ) ( not ( = ?auto_245446 ?auto_245448 ) ) ( not ( = ?auto_245447 ?auto_245449 ) ) ( not ( = ?auto_245447 ?auto_245448 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_245449 ?auto_245448 )
      ( MAKE-4CRATE-VERIFY ?auto_245445 ?auto_245446 ?auto_245447 ?auto_245449 ?auto_245448 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245470 - SURFACE
      ?auto_245471 - SURFACE
      ?auto_245472 - SURFACE
      ?auto_245474 - SURFACE
      ?auto_245473 - SURFACE
    )
    :vars
    (
      ?auto_245476 - HOIST
      ?auto_245475 - PLACE
      ?auto_245477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245476 ?auto_245475 ) ( SURFACE-AT ?auto_245474 ?auto_245475 ) ( CLEAR ?auto_245474 ) ( IS-CRATE ?auto_245473 ) ( not ( = ?auto_245474 ?auto_245473 ) ) ( TRUCK-AT ?auto_245477 ?auto_245475 ) ( AVAILABLE ?auto_245476 ) ( IN ?auto_245473 ?auto_245477 ) ( ON ?auto_245474 ?auto_245472 ) ( not ( = ?auto_245472 ?auto_245474 ) ) ( not ( = ?auto_245472 ?auto_245473 ) ) ( ON ?auto_245471 ?auto_245470 ) ( ON ?auto_245472 ?auto_245471 ) ( not ( = ?auto_245470 ?auto_245471 ) ) ( not ( = ?auto_245470 ?auto_245472 ) ) ( not ( = ?auto_245470 ?auto_245474 ) ) ( not ( = ?auto_245470 ?auto_245473 ) ) ( not ( = ?auto_245471 ?auto_245472 ) ) ( not ( = ?auto_245471 ?auto_245474 ) ) ( not ( = ?auto_245471 ?auto_245473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245472 ?auto_245474 ?auto_245473 )
      ( MAKE-4CRATE-VERIFY ?auto_245470 ?auto_245471 ?auto_245472 ?auto_245474 ?auto_245473 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245500 - SURFACE
      ?auto_245501 - SURFACE
      ?auto_245502 - SURFACE
      ?auto_245504 - SURFACE
      ?auto_245503 - SURFACE
    )
    :vars
    (
      ?auto_245508 - HOIST
      ?auto_245505 - PLACE
      ?auto_245506 - TRUCK
      ?auto_245507 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245508 ?auto_245505 ) ( SURFACE-AT ?auto_245504 ?auto_245505 ) ( CLEAR ?auto_245504 ) ( IS-CRATE ?auto_245503 ) ( not ( = ?auto_245504 ?auto_245503 ) ) ( AVAILABLE ?auto_245508 ) ( IN ?auto_245503 ?auto_245506 ) ( ON ?auto_245504 ?auto_245502 ) ( not ( = ?auto_245502 ?auto_245504 ) ) ( not ( = ?auto_245502 ?auto_245503 ) ) ( TRUCK-AT ?auto_245506 ?auto_245507 ) ( not ( = ?auto_245507 ?auto_245505 ) ) ( ON ?auto_245501 ?auto_245500 ) ( ON ?auto_245502 ?auto_245501 ) ( not ( = ?auto_245500 ?auto_245501 ) ) ( not ( = ?auto_245500 ?auto_245502 ) ) ( not ( = ?auto_245500 ?auto_245504 ) ) ( not ( = ?auto_245500 ?auto_245503 ) ) ( not ( = ?auto_245501 ?auto_245502 ) ) ( not ( = ?auto_245501 ?auto_245504 ) ) ( not ( = ?auto_245501 ?auto_245503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245502 ?auto_245504 ?auto_245503 )
      ( MAKE-4CRATE-VERIFY ?auto_245500 ?auto_245501 ?auto_245502 ?auto_245504 ?auto_245503 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245534 - SURFACE
      ?auto_245535 - SURFACE
      ?auto_245536 - SURFACE
      ?auto_245538 - SURFACE
      ?auto_245537 - SURFACE
    )
    :vars
    (
      ?auto_245539 - HOIST
      ?auto_245543 - PLACE
      ?auto_245542 - TRUCK
      ?auto_245540 - PLACE
      ?auto_245541 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_245539 ?auto_245543 ) ( SURFACE-AT ?auto_245538 ?auto_245543 ) ( CLEAR ?auto_245538 ) ( IS-CRATE ?auto_245537 ) ( not ( = ?auto_245538 ?auto_245537 ) ) ( AVAILABLE ?auto_245539 ) ( ON ?auto_245538 ?auto_245536 ) ( not ( = ?auto_245536 ?auto_245538 ) ) ( not ( = ?auto_245536 ?auto_245537 ) ) ( TRUCK-AT ?auto_245542 ?auto_245540 ) ( not ( = ?auto_245540 ?auto_245543 ) ) ( HOIST-AT ?auto_245541 ?auto_245540 ) ( LIFTING ?auto_245541 ?auto_245537 ) ( not ( = ?auto_245539 ?auto_245541 ) ) ( ON ?auto_245535 ?auto_245534 ) ( ON ?auto_245536 ?auto_245535 ) ( not ( = ?auto_245534 ?auto_245535 ) ) ( not ( = ?auto_245534 ?auto_245536 ) ) ( not ( = ?auto_245534 ?auto_245538 ) ) ( not ( = ?auto_245534 ?auto_245537 ) ) ( not ( = ?auto_245535 ?auto_245536 ) ) ( not ( = ?auto_245535 ?auto_245538 ) ) ( not ( = ?auto_245535 ?auto_245537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245536 ?auto_245538 ?auto_245537 )
      ( MAKE-4CRATE-VERIFY ?auto_245534 ?auto_245535 ?auto_245536 ?auto_245538 ?auto_245537 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245572 - SURFACE
      ?auto_245573 - SURFACE
      ?auto_245574 - SURFACE
      ?auto_245576 - SURFACE
      ?auto_245575 - SURFACE
    )
    :vars
    (
      ?auto_245579 - HOIST
      ?auto_245581 - PLACE
      ?auto_245582 - TRUCK
      ?auto_245577 - PLACE
      ?auto_245580 - HOIST
      ?auto_245578 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_245579 ?auto_245581 ) ( SURFACE-AT ?auto_245576 ?auto_245581 ) ( CLEAR ?auto_245576 ) ( IS-CRATE ?auto_245575 ) ( not ( = ?auto_245576 ?auto_245575 ) ) ( AVAILABLE ?auto_245579 ) ( ON ?auto_245576 ?auto_245574 ) ( not ( = ?auto_245574 ?auto_245576 ) ) ( not ( = ?auto_245574 ?auto_245575 ) ) ( TRUCK-AT ?auto_245582 ?auto_245577 ) ( not ( = ?auto_245577 ?auto_245581 ) ) ( HOIST-AT ?auto_245580 ?auto_245577 ) ( not ( = ?auto_245579 ?auto_245580 ) ) ( AVAILABLE ?auto_245580 ) ( SURFACE-AT ?auto_245575 ?auto_245577 ) ( ON ?auto_245575 ?auto_245578 ) ( CLEAR ?auto_245575 ) ( not ( = ?auto_245576 ?auto_245578 ) ) ( not ( = ?auto_245575 ?auto_245578 ) ) ( not ( = ?auto_245574 ?auto_245578 ) ) ( ON ?auto_245573 ?auto_245572 ) ( ON ?auto_245574 ?auto_245573 ) ( not ( = ?auto_245572 ?auto_245573 ) ) ( not ( = ?auto_245572 ?auto_245574 ) ) ( not ( = ?auto_245572 ?auto_245576 ) ) ( not ( = ?auto_245572 ?auto_245575 ) ) ( not ( = ?auto_245572 ?auto_245578 ) ) ( not ( = ?auto_245573 ?auto_245574 ) ) ( not ( = ?auto_245573 ?auto_245576 ) ) ( not ( = ?auto_245573 ?auto_245575 ) ) ( not ( = ?auto_245573 ?auto_245578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245574 ?auto_245576 ?auto_245575 )
      ( MAKE-4CRATE-VERIFY ?auto_245572 ?auto_245573 ?auto_245574 ?auto_245576 ?auto_245575 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245611 - SURFACE
      ?auto_245612 - SURFACE
      ?auto_245613 - SURFACE
      ?auto_245615 - SURFACE
      ?auto_245614 - SURFACE
    )
    :vars
    (
      ?auto_245620 - HOIST
      ?auto_245617 - PLACE
      ?auto_245616 - PLACE
      ?auto_245621 - HOIST
      ?auto_245618 - SURFACE
      ?auto_245619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245620 ?auto_245617 ) ( SURFACE-AT ?auto_245615 ?auto_245617 ) ( CLEAR ?auto_245615 ) ( IS-CRATE ?auto_245614 ) ( not ( = ?auto_245615 ?auto_245614 ) ) ( AVAILABLE ?auto_245620 ) ( ON ?auto_245615 ?auto_245613 ) ( not ( = ?auto_245613 ?auto_245615 ) ) ( not ( = ?auto_245613 ?auto_245614 ) ) ( not ( = ?auto_245616 ?auto_245617 ) ) ( HOIST-AT ?auto_245621 ?auto_245616 ) ( not ( = ?auto_245620 ?auto_245621 ) ) ( AVAILABLE ?auto_245621 ) ( SURFACE-AT ?auto_245614 ?auto_245616 ) ( ON ?auto_245614 ?auto_245618 ) ( CLEAR ?auto_245614 ) ( not ( = ?auto_245615 ?auto_245618 ) ) ( not ( = ?auto_245614 ?auto_245618 ) ) ( not ( = ?auto_245613 ?auto_245618 ) ) ( TRUCK-AT ?auto_245619 ?auto_245617 ) ( ON ?auto_245612 ?auto_245611 ) ( ON ?auto_245613 ?auto_245612 ) ( not ( = ?auto_245611 ?auto_245612 ) ) ( not ( = ?auto_245611 ?auto_245613 ) ) ( not ( = ?auto_245611 ?auto_245615 ) ) ( not ( = ?auto_245611 ?auto_245614 ) ) ( not ( = ?auto_245611 ?auto_245618 ) ) ( not ( = ?auto_245612 ?auto_245613 ) ) ( not ( = ?auto_245612 ?auto_245615 ) ) ( not ( = ?auto_245612 ?auto_245614 ) ) ( not ( = ?auto_245612 ?auto_245618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245613 ?auto_245615 ?auto_245614 )
      ( MAKE-4CRATE-VERIFY ?auto_245611 ?auto_245612 ?auto_245613 ?auto_245615 ?auto_245614 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245650 - SURFACE
      ?auto_245651 - SURFACE
      ?auto_245652 - SURFACE
      ?auto_245654 - SURFACE
      ?auto_245653 - SURFACE
    )
    :vars
    (
      ?auto_245659 - HOIST
      ?auto_245657 - PLACE
      ?auto_245655 - PLACE
      ?auto_245656 - HOIST
      ?auto_245658 - SURFACE
      ?auto_245660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245659 ?auto_245657 ) ( IS-CRATE ?auto_245653 ) ( not ( = ?auto_245654 ?auto_245653 ) ) ( not ( = ?auto_245652 ?auto_245654 ) ) ( not ( = ?auto_245652 ?auto_245653 ) ) ( not ( = ?auto_245655 ?auto_245657 ) ) ( HOIST-AT ?auto_245656 ?auto_245655 ) ( not ( = ?auto_245659 ?auto_245656 ) ) ( AVAILABLE ?auto_245656 ) ( SURFACE-AT ?auto_245653 ?auto_245655 ) ( ON ?auto_245653 ?auto_245658 ) ( CLEAR ?auto_245653 ) ( not ( = ?auto_245654 ?auto_245658 ) ) ( not ( = ?auto_245653 ?auto_245658 ) ) ( not ( = ?auto_245652 ?auto_245658 ) ) ( TRUCK-AT ?auto_245660 ?auto_245657 ) ( SURFACE-AT ?auto_245652 ?auto_245657 ) ( CLEAR ?auto_245652 ) ( LIFTING ?auto_245659 ?auto_245654 ) ( IS-CRATE ?auto_245654 ) ( ON ?auto_245651 ?auto_245650 ) ( ON ?auto_245652 ?auto_245651 ) ( not ( = ?auto_245650 ?auto_245651 ) ) ( not ( = ?auto_245650 ?auto_245652 ) ) ( not ( = ?auto_245650 ?auto_245654 ) ) ( not ( = ?auto_245650 ?auto_245653 ) ) ( not ( = ?auto_245650 ?auto_245658 ) ) ( not ( = ?auto_245651 ?auto_245652 ) ) ( not ( = ?auto_245651 ?auto_245654 ) ) ( not ( = ?auto_245651 ?auto_245653 ) ) ( not ( = ?auto_245651 ?auto_245658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245652 ?auto_245654 ?auto_245653 )
      ( MAKE-4CRATE-VERIFY ?auto_245650 ?auto_245651 ?auto_245652 ?auto_245654 ?auto_245653 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_245689 - SURFACE
      ?auto_245690 - SURFACE
      ?auto_245691 - SURFACE
      ?auto_245693 - SURFACE
      ?auto_245692 - SURFACE
    )
    :vars
    (
      ?auto_245696 - HOIST
      ?auto_245697 - PLACE
      ?auto_245699 - PLACE
      ?auto_245695 - HOIST
      ?auto_245694 - SURFACE
      ?auto_245698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_245696 ?auto_245697 ) ( IS-CRATE ?auto_245692 ) ( not ( = ?auto_245693 ?auto_245692 ) ) ( not ( = ?auto_245691 ?auto_245693 ) ) ( not ( = ?auto_245691 ?auto_245692 ) ) ( not ( = ?auto_245699 ?auto_245697 ) ) ( HOIST-AT ?auto_245695 ?auto_245699 ) ( not ( = ?auto_245696 ?auto_245695 ) ) ( AVAILABLE ?auto_245695 ) ( SURFACE-AT ?auto_245692 ?auto_245699 ) ( ON ?auto_245692 ?auto_245694 ) ( CLEAR ?auto_245692 ) ( not ( = ?auto_245693 ?auto_245694 ) ) ( not ( = ?auto_245692 ?auto_245694 ) ) ( not ( = ?auto_245691 ?auto_245694 ) ) ( TRUCK-AT ?auto_245698 ?auto_245697 ) ( SURFACE-AT ?auto_245691 ?auto_245697 ) ( CLEAR ?auto_245691 ) ( IS-CRATE ?auto_245693 ) ( AVAILABLE ?auto_245696 ) ( IN ?auto_245693 ?auto_245698 ) ( ON ?auto_245690 ?auto_245689 ) ( ON ?auto_245691 ?auto_245690 ) ( not ( = ?auto_245689 ?auto_245690 ) ) ( not ( = ?auto_245689 ?auto_245691 ) ) ( not ( = ?auto_245689 ?auto_245693 ) ) ( not ( = ?auto_245689 ?auto_245692 ) ) ( not ( = ?auto_245689 ?auto_245694 ) ) ( not ( = ?auto_245690 ?auto_245691 ) ) ( not ( = ?auto_245690 ?auto_245693 ) ) ( not ( = ?auto_245690 ?auto_245692 ) ) ( not ( = ?auto_245690 ?auto_245694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_245691 ?auto_245693 ?auto_245692 )
      ( MAKE-4CRATE-VERIFY ?auto_245689 ?auto_245690 ?auto_245691 ?auto_245693 ?auto_245692 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246349 - SURFACE
      ?auto_246350 - SURFACE
      ?auto_246351 - SURFACE
      ?auto_246353 - SURFACE
      ?auto_246352 - SURFACE
      ?auto_246354 - SURFACE
    )
    :vars
    (
      ?auto_246356 - HOIST
      ?auto_246355 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246356 ?auto_246355 ) ( SURFACE-AT ?auto_246352 ?auto_246355 ) ( CLEAR ?auto_246352 ) ( LIFTING ?auto_246356 ?auto_246354 ) ( IS-CRATE ?auto_246354 ) ( not ( = ?auto_246352 ?auto_246354 ) ) ( ON ?auto_246350 ?auto_246349 ) ( ON ?auto_246351 ?auto_246350 ) ( ON ?auto_246353 ?auto_246351 ) ( ON ?auto_246352 ?auto_246353 ) ( not ( = ?auto_246349 ?auto_246350 ) ) ( not ( = ?auto_246349 ?auto_246351 ) ) ( not ( = ?auto_246349 ?auto_246353 ) ) ( not ( = ?auto_246349 ?auto_246352 ) ) ( not ( = ?auto_246349 ?auto_246354 ) ) ( not ( = ?auto_246350 ?auto_246351 ) ) ( not ( = ?auto_246350 ?auto_246353 ) ) ( not ( = ?auto_246350 ?auto_246352 ) ) ( not ( = ?auto_246350 ?auto_246354 ) ) ( not ( = ?auto_246351 ?auto_246353 ) ) ( not ( = ?auto_246351 ?auto_246352 ) ) ( not ( = ?auto_246351 ?auto_246354 ) ) ( not ( = ?auto_246353 ?auto_246352 ) ) ( not ( = ?auto_246353 ?auto_246354 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_246352 ?auto_246354 )
      ( MAKE-5CRATE-VERIFY ?auto_246349 ?auto_246350 ?auto_246351 ?auto_246353 ?auto_246352 ?auto_246354 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246383 - SURFACE
      ?auto_246384 - SURFACE
      ?auto_246385 - SURFACE
      ?auto_246387 - SURFACE
      ?auto_246386 - SURFACE
      ?auto_246388 - SURFACE
    )
    :vars
    (
      ?auto_246389 - HOIST
      ?auto_246391 - PLACE
      ?auto_246390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246389 ?auto_246391 ) ( SURFACE-AT ?auto_246386 ?auto_246391 ) ( CLEAR ?auto_246386 ) ( IS-CRATE ?auto_246388 ) ( not ( = ?auto_246386 ?auto_246388 ) ) ( TRUCK-AT ?auto_246390 ?auto_246391 ) ( AVAILABLE ?auto_246389 ) ( IN ?auto_246388 ?auto_246390 ) ( ON ?auto_246386 ?auto_246387 ) ( not ( = ?auto_246387 ?auto_246386 ) ) ( not ( = ?auto_246387 ?auto_246388 ) ) ( ON ?auto_246384 ?auto_246383 ) ( ON ?auto_246385 ?auto_246384 ) ( ON ?auto_246387 ?auto_246385 ) ( not ( = ?auto_246383 ?auto_246384 ) ) ( not ( = ?auto_246383 ?auto_246385 ) ) ( not ( = ?auto_246383 ?auto_246387 ) ) ( not ( = ?auto_246383 ?auto_246386 ) ) ( not ( = ?auto_246383 ?auto_246388 ) ) ( not ( = ?auto_246384 ?auto_246385 ) ) ( not ( = ?auto_246384 ?auto_246387 ) ) ( not ( = ?auto_246384 ?auto_246386 ) ) ( not ( = ?auto_246384 ?auto_246388 ) ) ( not ( = ?auto_246385 ?auto_246387 ) ) ( not ( = ?auto_246385 ?auto_246386 ) ) ( not ( = ?auto_246385 ?auto_246388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246387 ?auto_246386 ?auto_246388 )
      ( MAKE-5CRATE-VERIFY ?auto_246383 ?auto_246384 ?auto_246385 ?auto_246387 ?auto_246386 ?auto_246388 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246423 - SURFACE
      ?auto_246424 - SURFACE
      ?auto_246425 - SURFACE
      ?auto_246427 - SURFACE
      ?auto_246426 - SURFACE
      ?auto_246428 - SURFACE
    )
    :vars
    (
      ?auto_246430 - HOIST
      ?auto_246429 - PLACE
      ?auto_246432 - TRUCK
      ?auto_246431 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246430 ?auto_246429 ) ( SURFACE-AT ?auto_246426 ?auto_246429 ) ( CLEAR ?auto_246426 ) ( IS-CRATE ?auto_246428 ) ( not ( = ?auto_246426 ?auto_246428 ) ) ( AVAILABLE ?auto_246430 ) ( IN ?auto_246428 ?auto_246432 ) ( ON ?auto_246426 ?auto_246427 ) ( not ( = ?auto_246427 ?auto_246426 ) ) ( not ( = ?auto_246427 ?auto_246428 ) ) ( TRUCK-AT ?auto_246432 ?auto_246431 ) ( not ( = ?auto_246431 ?auto_246429 ) ) ( ON ?auto_246424 ?auto_246423 ) ( ON ?auto_246425 ?auto_246424 ) ( ON ?auto_246427 ?auto_246425 ) ( not ( = ?auto_246423 ?auto_246424 ) ) ( not ( = ?auto_246423 ?auto_246425 ) ) ( not ( = ?auto_246423 ?auto_246427 ) ) ( not ( = ?auto_246423 ?auto_246426 ) ) ( not ( = ?auto_246423 ?auto_246428 ) ) ( not ( = ?auto_246424 ?auto_246425 ) ) ( not ( = ?auto_246424 ?auto_246427 ) ) ( not ( = ?auto_246424 ?auto_246426 ) ) ( not ( = ?auto_246424 ?auto_246428 ) ) ( not ( = ?auto_246425 ?auto_246427 ) ) ( not ( = ?auto_246425 ?auto_246426 ) ) ( not ( = ?auto_246425 ?auto_246428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246427 ?auto_246426 ?auto_246428 )
      ( MAKE-5CRATE-VERIFY ?auto_246423 ?auto_246424 ?auto_246425 ?auto_246427 ?auto_246426 ?auto_246428 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246468 - SURFACE
      ?auto_246469 - SURFACE
      ?auto_246470 - SURFACE
      ?auto_246472 - SURFACE
      ?auto_246471 - SURFACE
      ?auto_246473 - SURFACE
    )
    :vars
    (
      ?auto_246475 - HOIST
      ?auto_246477 - PLACE
      ?auto_246474 - TRUCK
      ?auto_246478 - PLACE
      ?auto_246476 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_246475 ?auto_246477 ) ( SURFACE-AT ?auto_246471 ?auto_246477 ) ( CLEAR ?auto_246471 ) ( IS-CRATE ?auto_246473 ) ( not ( = ?auto_246471 ?auto_246473 ) ) ( AVAILABLE ?auto_246475 ) ( ON ?auto_246471 ?auto_246472 ) ( not ( = ?auto_246472 ?auto_246471 ) ) ( not ( = ?auto_246472 ?auto_246473 ) ) ( TRUCK-AT ?auto_246474 ?auto_246478 ) ( not ( = ?auto_246478 ?auto_246477 ) ) ( HOIST-AT ?auto_246476 ?auto_246478 ) ( LIFTING ?auto_246476 ?auto_246473 ) ( not ( = ?auto_246475 ?auto_246476 ) ) ( ON ?auto_246469 ?auto_246468 ) ( ON ?auto_246470 ?auto_246469 ) ( ON ?auto_246472 ?auto_246470 ) ( not ( = ?auto_246468 ?auto_246469 ) ) ( not ( = ?auto_246468 ?auto_246470 ) ) ( not ( = ?auto_246468 ?auto_246472 ) ) ( not ( = ?auto_246468 ?auto_246471 ) ) ( not ( = ?auto_246468 ?auto_246473 ) ) ( not ( = ?auto_246469 ?auto_246470 ) ) ( not ( = ?auto_246469 ?auto_246472 ) ) ( not ( = ?auto_246469 ?auto_246471 ) ) ( not ( = ?auto_246469 ?auto_246473 ) ) ( not ( = ?auto_246470 ?auto_246472 ) ) ( not ( = ?auto_246470 ?auto_246471 ) ) ( not ( = ?auto_246470 ?auto_246473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246472 ?auto_246471 ?auto_246473 )
      ( MAKE-5CRATE-VERIFY ?auto_246468 ?auto_246469 ?auto_246470 ?auto_246472 ?auto_246471 ?auto_246473 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246518 - SURFACE
      ?auto_246519 - SURFACE
      ?auto_246520 - SURFACE
      ?auto_246522 - SURFACE
      ?auto_246521 - SURFACE
      ?auto_246523 - SURFACE
    )
    :vars
    (
      ?auto_246525 - HOIST
      ?auto_246529 - PLACE
      ?auto_246528 - TRUCK
      ?auto_246526 - PLACE
      ?auto_246527 - HOIST
      ?auto_246524 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246525 ?auto_246529 ) ( SURFACE-AT ?auto_246521 ?auto_246529 ) ( CLEAR ?auto_246521 ) ( IS-CRATE ?auto_246523 ) ( not ( = ?auto_246521 ?auto_246523 ) ) ( AVAILABLE ?auto_246525 ) ( ON ?auto_246521 ?auto_246522 ) ( not ( = ?auto_246522 ?auto_246521 ) ) ( not ( = ?auto_246522 ?auto_246523 ) ) ( TRUCK-AT ?auto_246528 ?auto_246526 ) ( not ( = ?auto_246526 ?auto_246529 ) ) ( HOIST-AT ?auto_246527 ?auto_246526 ) ( not ( = ?auto_246525 ?auto_246527 ) ) ( AVAILABLE ?auto_246527 ) ( SURFACE-AT ?auto_246523 ?auto_246526 ) ( ON ?auto_246523 ?auto_246524 ) ( CLEAR ?auto_246523 ) ( not ( = ?auto_246521 ?auto_246524 ) ) ( not ( = ?auto_246523 ?auto_246524 ) ) ( not ( = ?auto_246522 ?auto_246524 ) ) ( ON ?auto_246519 ?auto_246518 ) ( ON ?auto_246520 ?auto_246519 ) ( ON ?auto_246522 ?auto_246520 ) ( not ( = ?auto_246518 ?auto_246519 ) ) ( not ( = ?auto_246518 ?auto_246520 ) ) ( not ( = ?auto_246518 ?auto_246522 ) ) ( not ( = ?auto_246518 ?auto_246521 ) ) ( not ( = ?auto_246518 ?auto_246523 ) ) ( not ( = ?auto_246518 ?auto_246524 ) ) ( not ( = ?auto_246519 ?auto_246520 ) ) ( not ( = ?auto_246519 ?auto_246522 ) ) ( not ( = ?auto_246519 ?auto_246521 ) ) ( not ( = ?auto_246519 ?auto_246523 ) ) ( not ( = ?auto_246519 ?auto_246524 ) ) ( not ( = ?auto_246520 ?auto_246522 ) ) ( not ( = ?auto_246520 ?auto_246521 ) ) ( not ( = ?auto_246520 ?auto_246523 ) ) ( not ( = ?auto_246520 ?auto_246524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246522 ?auto_246521 ?auto_246523 )
      ( MAKE-5CRATE-VERIFY ?auto_246518 ?auto_246519 ?auto_246520 ?auto_246522 ?auto_246521 ?auto_246523 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246569 - SURFACE
      ?auto_246570 - SURFACE
      ?auto_246571 - SURFACE
      ?auto_246573 - SURFACE
      ?auto_246572 - SURFACE
      ?auto_246574 - SURFACE
    )
    :vars
    (
      ?auto_246575 - HOIST
      ?auto_246576 - PLACE
      ?auto_246579 - PLACE
      ?auto_246577 - HOIST
      ?auto_246580 - SURFACE
      ?auto_246578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246575 ?auto_246576 ) ( SURFACE-AT ?auto_246572 ?auto_246576 ) ( CLEAR ?auto_246572 ) ( IS-CRATE ?auto_246574 ) ( not ( = ?auto_246572 ?auto_246574 ) ) ( AVAILABLE ?auto_246575 ) ( ON ?auto_246572 ?auto_246573 ) ( not ( = ?auto_246573 ?auto_246572 ) ) ( not ( = ?auto_246573 ?auto_246574 ) ) ( not ( = ?auto_246579 ?auto_246576 ) ) ( HOIST-AT ?auto_246577 ?auto_246579 ) ( not ( = ?auto_246575 ?auto_246577 ) ) ( AVAILABLE ?auto_246577 ) ( SURFACE-AT ?auto_246574 ?auto_246579 ) ( ON ?auto_246574 ?auto_246580 ) ( CLEAR ?auto_246574 ) ( not ( = ?auto_246572 ?auto_246580 ) ) ( not ( = ?auto_246574 ?auto_246580 ) ) ( not ( = ?auto_246573 ?auto_246580 ) ) ( TRUCK-AT ?auto_246578 ?auto_246576 ) ( ON ?auto_246570 ?auto_246569 ) ( ON ?auto_246571 ?auto_246570 ) ( ON ?auto_246573 ?auto_246571 ) ( not ( = ?auto_246569 ?auto_246570 ) ) ( not ( = ?auto_246569 ?auto_246571 ) ) ( not ( = ?auto_246569 ?auto_246573 ) ) ( not ( = ?auto_246569 ?auto_246572 ) ) ( not ( = ?auto_246569 ?auto_246574 ) ) ( not ( = ?auto_246569 ?auto_246580 ) ) ( not ( = ?auto_246570 ?auto_246571 ) ) ( not ( = ?auto_246570 ?auto_246573 ) ) ( not ( = ?auto_246570 ?auto_246572 ) ) ( not ( = ?auto_246570 ?auto_246574 ) ) ( not ( = ?auto_246570 ?auto_246580 ) ) ( not ( = ?auto_246571 ?auto_246573 ) ) ( not ( = ?auto_246571 ?auto_246572 ) ) ( not ( = ?auto_246571 ?auto_246574 ) ) ( not ( = ?auto_246571 ?auto_246580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246573 ?auto_246572 ?auto_246574 )
      ( MAKE-5CRATE-VERIFY ?auto_246569 ?auto_246570 ?auto_246571 ?auto_246573 ?auto_246572 ?auto_246574 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246620 - SURFACE
      ?auto_246621 - SURFACE
      ?auto_246622 - SURFACE
      ?auto_246624 - SURFACE
      ?auto_246623 - SURFACE
      ?auto_246625 - SURFACE
    )
    :vars
    (
      ?auto_246631 - HOIST
      ?auto_246628 - PLACE
      ?auto_246629 - PLACE
      ?auto_246627 - HOIST
      ?auto_246630 - SURFACE
      ?auto_246626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246631 ?auto_246628 ) ( IS-CRATE ?auto_246625 ) ( not ( = ?auto_246623 ?auto_246625 ) ) ( not ( = ?auto_246624 ?auto_246623 ) ) ( not ( = ?auto_246624 ?auto_246625 ) ) ( not ( = ?auto_246629 ?auto_246628 ) ) ( HOIST-AT ?auto_246627 ?auto_246629 ) ( not ( = ?auto_246631 ?auto_246627 ) ) ( AVAILABLE ?auto_246627 ) ( SURFACE-AT ?auto_246625 ?auto_246629 ) ( ON ?auto_246625 ?auto_246630 ) ( CLEAR ?auto_246625 ) ( not ( = ?auto_246623 ?auto_246630 ) ) ( not ( = ?auto_246625 ?auto_246630 ) ) ( not ( = ?auto_246624 ?auto_246630 ) ) ( TRUCK-AT ?auto_246626 ?auto_246628 ) ( SURFACE-AT ?auto_246624 ?auto_246628 ) ( CLEAR ?auto_246624 ) ( LIFTING ?auto_246631 ?auto_246623 ) ( IS-CRATE ?auto_246623 ) ( ON ?auto_246621 ?auto_246620 ) ( ON ?auto_246622 ?auto_246621 ) ( ON ?auto_246624 ?auto_246622 ) ( not ( = ?auto_246620 ?auto_246621 ) ) ( not ( = ?auto_246620 ?auto_246622 ) ) ( not ( = ?auto_246620 ?auto_246624 ) ) ( not ( = ?auto_246620 ?auto_246623 ) ) ( not ( = ?auto_246620 ?auto_246625 ) ) ( not ( = ?auto_246620 ?auto_246630 ) ) ( not ( = ?auto_246621 ?auto_246622 ) ) ( not ( = ?auto_246621 ?auto_246624 ) ) ( not ( = ?auto_246621 ?auto_246623 ) ) ( not ( = ?auto_246621 ?auto_246625 ) ) ( not ( = ?auto_246621 ?auto_246630 ) ) ( not ( = ?auto_246622 ?auto_246624 ) ) ( not ( = ?auto_246622 ?auto_246623 ) ) ( not ( = ?auto_246622 ?auto_246625 ) ) ( not ( = ?auto_246622 ?auto_246630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246624 ?auto_246623 ?auto_246625 )
      ( MAKE-5CRATE-VERIFY ?auto_246620 ?auto_246621 ?auto_246622 ?auto_246624 ?auto_246623 ?auto_246625 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246671 - SURFACE
      ?auto_246672 - SURFACE
      ?auto_246673 - SURFACE
      ?auto_246675 - SURFACE
      ?auto_246674 - SURFACE
      ?auto_246676 - SURFACE
    )
    :vars
    (
      ?auto_246679 - HOIST
      ?auto_246680 - PLACE
      ?auto_246682 - PLACE
      ?auto_246681 - HOIST
      ?auto_246677 - SURFACE
      ?auto_246678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246679 ?auto_246680 ) ( IS-CRATE ?auto_246676 ) ( not ( = ?auto_246674 ?auto_246676 ) ) ( not ( = ?auto_246675 ?auto_246674 ) ) ( not ( = ?auto_246675 ?auto_246676 ) ) ( not ( = ?auto_246682 ?auto_246680 ) ) ( HOIST-AT ?auto_246681 ?auto_246682 ) ( not ( = ?auto_246679 ?auto_246681 ) ) ( AVAILABLE ?auto_246681 ) ( SURFACE-AT ?auto_246676 ?auto_246682 ) ( ON ?auto_246676 ?auto_246677 ) ( CLEAR ?auto_246676 ) ( not ( = ?auto_246674 ?auto_246677 ) ) ( not ( = ?auto_246676 ?auto_246677 ) ) ( not ( = ?auto_246675 ?auto_246677 ) ) ( TRUCK-AT ?auto_246678 ?auto_246680 ) ( SURFACE-AT ?auto_246675 ?auto_246680 ) ( CLEAR ?auto_246675 ) ( IS-CRATE ?auto_246674 ) ( AVAILABLE ?auto_246679 ) ( IN ?auto_246674 ?auto_246678 ) ( ON ?auto_246672 ?auto_246671 ) ( ON ?auto_246673 ?auto_246672 ) ( ON ?auto_246675 ?auto_246673 ) ( not ( = ?auto_246671 ?auto_246672 ) ) ( not ( = ?auto_246671 ?auto_246673 ) ) ( not ( = ?auto_246671 ?auto_246675 ) ) ( not ( = ?auto_246671 ?auto_246674 ) ) ( not ( = ?auto_246671 ?auto_246676 ) ) ( not ( = ?auto_246671 ?auto_246677 ) ) ( not ( = ?auto_246672 ?auto_246673 ) ) ( not ( = ?auto_246672 ?auto_246675 ) ) ( not ( = ?auto_246672 ?auto_246674 ) ) ( not ( = ?auto_246672 ?auto_246676 ) ) ( not ( = ?auto_246672 ?auto_246677 ) ) ( not ( = ?auto_246673 ?auto_246675 ) ) ( not ( = ?auto_246673 ?auto_246674 ) ) ( not ( = ?auto_246673 ?auto_246676 ) ) ( not ( = ?auto_246673 ?auto_246677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246675 ?auto_246674 ?auto_246676 )
      ( MAKE-5CRATE-VERIFY ?auto_246671 ?auto_246672 ?auto_246673 ?auto_246675 ?auto_246674 ?auto_246676 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_246683 - SURFACE
      ?auto_246684 - SURFACE
    )
    :vars
    (
      ?auto_246688 - HOIST
      ?auto_246689 - PLACE
      ?auto_246686 - SURFACE
      ?auto_246691 - PLACE
      ?auto_246690 - HOIST
      ?auto_246685 - SURFACE
      ?auto_246687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246688 ?auto_246689 ) ( IS-CRATE ?auto_246684 ) ( not ( = ?auto_246683 ?auto_246684 ) ) ( not ( = ?auto_246686 ?auto_246683 ) ) ( not ( = ?auto_246686 ?auto_246684 ) ) ( not ( = ?auto_246691 ?auto_246689 ) ) ( HOIST-AT ?auto_246690 ?auto_246691 ) ( not ( = ?auto_246688 ?auto_246690 ) ) ( AVAILABLE ?auto_246690 ) ( SURFACE-AT ?auto_246684 ?auto_246691 ) ( ON ?auto_246684 ?auto_246685 ) ( CLEAR ?auto_246684 ) ( not ( = ?auto_246683 ?auto_246685 ) ) ( not ( = ?auto_246684 ?auto_246685 ) ) ( not ( = ?auto_246686 ?auto_246685 ) ) ( SURFACE-AT ?auto_246686 ?auto_246689 ) ( CLEAR ?auto_246686 ) ( IS-CRATE ?auto_246683 ) ( AVAILABLE ?auto_246688 ) ( IN ?auto_246683 ?auto_246687 ) ( TRUCK-AT ?auto_246687 ?auto_246691 ) )
    :subtasks
    ( ( !DRIVE ?auto_246687 ?auto_246691 ?auto_246689 )
      ( MAKE-2CRATE ?auto_246686 ?auto_246683 ?auto_246684 )
      ( MAKE-1CRATE-VERIFY ?auto_246683 ?auto_246684 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_246692 - SURFACE
      ?auto_246693 - SURFACE
      ?auto_246694 - SURFACE
    )
    :vars
    (
      ?auto_246695 - HOIST
      ?auto_246699 - PLACE
      ?auto_246698 - PLACE
      ?auto_246700 - HOIST
      ?auto_246697 - SURFACE
      ?auto_246696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246695 ?auto_246699 ) ( IS-CRATE ?auto_246694 ) ( not ( = ?auto_246693 ?auto_246694 ) ) ( not ( = ?auto_246692 ?auto_246693 ) ) ( not ( = ?auto_246692 ?auto_246694 ) ) ( not ( = ?auto_246698 ?auto_246699 ) ) ( HOIST-AT ?auto_246700 ?auto_246698 ) ( not ( = ?auto_246695 ?auto_246700 ) ) ( AVAILABLE ?auto_246700 ) ( SURFACE-AT ?auto_246694 ?auto_246698 ) ( ON ?auto_246694 ?auto_246697 ) ( CLEAR ?auto_246694 ) ( not ( = ?auto_246693 ?auto_246697 ) ) ( not ( = ?auto_246694 ?auto_246697 ) ) ( not ( = ?auto_246692 ?auto_246697 ) ) ( SURFACE-AT ?auto_246692 ?auto_246699 ) ( CLEAR ?auto_246692 ) ( IS-CRATE ?auto_246693 ) ( AVAILABLE ?auto_246695 ) ( IN ?auto_246693 ?auto_246696 ) ( TRUCK-AT ?auto_246696 ?auto_246698 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_246693 ?auto_246694 )
      ( MAKE-2CRATE-VERIFY ?auto_246692 ?auto_246693 ?auto_246694 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_246701 - SURFACE
      ?auto_246702 - SURFACE
      ?auto_246703 - SURFACE
      ?auto_246704 - SURFACE
    )
    :vars
    (
      ?auto_246710 - HOIST
      ?auto_246708 - PLACE
      ?auto_246706 - PLACE
      ?auto_246705 - HOIST
      ?auto_246709 - SURFACE
      ?auto_246707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246710 ?auto_246708 ) ( IS-CRATE ?auto_246704 ) ( not ( = ?auto_246703 ?auto_246704 ) ) ( not ( = ?auto_246702 ?auto_246703 ) ) ( not ( = ?auto_246702 ?auto_246704 ) ) ( not ( = ?auto_246706 ?auto_246708 ) ) ( HOIST-AT ?auto_246705 ?auto_246706 ) ( not ( = ?auto_246710 ?auto_246705 ) ) ( AVAILABLE ?auto_246705 ) ( SURFACE-AT ?auto_246704 ?auto_246706 ) ( ON ?auto_246704 ?auto_246709 ) ( CLEAR ?auto_246704 ) ( not ( = ?auto_246703 ?auto_246709 ) ) ( not ( = ?auto_246704 ?auto_246709 ) ) ( not ( = ?auto_246702 ?auto_246709 ) ) ( SURFACE-AT ?auto_246702 ?auto_246708 ) ( CLEAR ?auto_246702 ) ( IS-CRATE ?auto_246703 ) ( AVAILABLE ?auto_246710 ) ( IN ?auto_246703 ?auto_246707 ) ( TRUCK-AT ?auto_246707 ?auto_246706 ) ( ON ?auto_246702 ?auto_246701 ) ( not ( = ?auto_246701 ?auto_246702 ) ) ( not ( = ?auto_246701 ?auto_246703 ) ) ( not ( = ?auto_246701 ?auto_246704 ) ) ( not ( = ?auto_246701 ?auto_246709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246702 ?auto_246703 ?auto_246704 )
      ( MAKE-3CRATE-VERIFY ?auto_246701 ?auto_246702 ?auto_246703 ?auto_246704 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_246711 - SURFACE
      ?auto_246712 - SURFACE
      ?auto_246713 - SURFACE
      ?auto_246715 - SURFACE
      ?auto_246714 - SURFACE
    )
    :vars
    (
      ?auto_246721 - HOIST
      ?auto_246719 - PLACE
      ?auto_246717 - PLACE
      ?auto_246716 - HOIST
      ?auto_246720 - SURFACE
      ?auto_246718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246721 ?auto_246719 ) ( IS-CRATE ?auto_246714 ) ( not ( = ?auto_246715 ?auto_246714 ) ) ( not ( = ?auto_246713 ?auto_246715 ) ) ( not ( = ?auto_246713 ?auto_246714 ) ) ( not ( = ?auto_246717 ?auto_246719 ) ) ( HOIST-AT ?auto_246716 ?auto_246717 ) ( not ( = ?auto_246721 ?auto_246716 ) ) ( AVAILABLE ?auto_246716 ) ( SURFACE-AT ?auto_246714 ?auto_246717 ) ( ON ?auto_246714 ?auto_246720 ) ( CLEAR ?auto_246714 ) ( not ( = ?auto_246715 ?auto_246720 ) ) ( not ( = ?auto_246714 ?auto_246720 ) ) ( not ( = ?auto_246713 ?auto_246720 ) ) ( SURFACE-AT ?auto_246713 ?auto_246719 ) ( CLEAR ?auto_246713 ) ( IS-CRATE ?auto_246715 ) ( AVAILABLE ?auto_246721 ) ( IN ?auto_246715 ?auto_246718 ) ( TRUCK-AT ?auto_246718 ?auto_246717 ) ( ON ?auto_246712 ?auto_246711 ) ( ON ?auto_246713 ?auto_246712 ) ( not ( = ?auto_246711 ?auto_246712 ) ) ( not ( = ?auto_246711 ?auto_246713 ) ) ( not ( = ?auto_246711 ?auto_246715 ) ) ( not ( = ?auto_246711 ?auto_246714 ) ) ( not ( = ?auto_246711 ?auto_246720 ) ) ( not ( = ?auto_246712 ?auto_246713 ) ) ( not ( = ?auto_246712 ?auto_246715 ) ) ( not ( = ?auto_246712 ?auto_246714 ) ) ( not ( = ?auto_246712 ?auto_246720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246713 ?auto_246715 ?auto_246714 )
      ( MAKE-4CRATE-VERIFY ?auto_246711 ?auto_246712 ?auto_246713 ?auto_246715 ?auto_246714 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246722 - SURFACE
      ?auto_246723 - SURFACE
      ?auto_246724 - SURFACE
      ?auto_246726 - SURFACE
      ?auto_246725 - SURFACE
      ?auto_246727 - SURFACE
    )
    :vars
    (
      ?auto_246733 - HOIST
      ?auto_246731 - PLACE
      ?auto_246729 - PLACE
      ?auto_246728 - HOIST
      ?auto_246732 - SURFACE
      ?auto_246730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246733 ?auto_246731 ) ( IS-CRATE ?auto_246727 ) ( not ( = ?auto_246725 ?auto_246727 ) ) ( not ( = ?auto_246726 ?auto_246725 ) ) ( not ( = ?auto_246726 ?auto_246727 ) ) ( not ( = ?auto_246729 ?auto_246731 ) ) ( HOIST-AT ?auto_246728 ?auto_246729 ) ( not ( = ?auto_246733 ?auto_246728 ) ) ( AVAILABLE ?auto_246728 ) ( SURFACE-AT ?auto_246727 ?auto_246729 ) ( ON ?auto_246727 ?auto_246732 ) ( CLEAR ?auto_246727 ) ( not ( = ?auto_246725 ?auto_246732 ) ) ( not ( = ?auto_246727 ?auto_246732 ) ) ( not ( = ?auto_246726 ?auto_246732 ) ) ( SURFACE-AT ?auto_246726 ?auto_246731 ) ( CLEAR ?auto_246726 ) ( IS-CRATE ?auto_246725 ) ( AVAILABLE ?auto_246733 ) ( IN ?auto_246725 ?auto_246730 ) ( TRUCK-AT ?auto_246730 ?auto_246729 ) ( ON ?auto_246723 ?auto_246722 ) ( ON ?auto_246724 ?auto_246723 ) ( ON ?auto_246726 ?auto_246724 ) ( not ( = ?auto_246722 ?auto_246723 ) ) ( not ( = ?auto_246722 ?auto_246724 ) ) ( not ( = ?auto_246722 ?auto_246726 ) ) ( not ( = ?auto_246722 ?auto_246725 ) ) ( not ( = ?auto_246722 ?auto_246727 ) ) ( not ( = ?auto_246722 ?auto_246732 ) ) ( not ( = ?auto_246723 ?auto_246724 ) ) ( not ( = ?auto_246723 ?auto_246726 ) ) ( not ( = ?auto_246723 ?auto_246725 ) ) ( not ( = ?auto_246723 ?auto_246727 ) ) ( not ( = ?auto_246723 ?auto_246732 ) ) ( not ( = ?auto_246724 ?auto_246726 ) ) ( not ( = ?auto_246724 ?auto_246725 ) ) ( not ( = ?auto_246724 ?auto_246727 ) ) ( not ( = ?auto_246724 ?auto_246732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246726 ?auto_246725 ?auto_246727 )
      ( MAKE-5CRATE-VERIFY ?auto_246722 ?auto_246723 ?auto_246724 ?auto_246726 ?auto_246725 ?auto_246727 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_246734 - SURFACE
      ?auto_246735 - SURFACE
    )
    :vars
    (
      ?auto_246742 - HOIST
      ?auto_246740 - PLACE
      ?auto_246736 - SURFACE
      ?auto_246738 - PLACE
      ?auto_246737 - HOIST
      ?auto_246741 - SURFACE
      ?auto_246739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246742 ?auto_246740 ) ( IS-CRATE ?auto_246735 ) ( not ( = ?auto_246734 ?auto_246735 ) ) ( not ( = ?auto_246736 ?auto_246734 ) ) ( not ( = ?auto_246736 ?auto_246735 ) ) ( not ( = ?auto_246738 ?auto_246740 ) ) ( HOIST-AT ?auto_246737 ?auto_246738 ) ( not ( = ?auto_246742 ?auto_246737 ) ) ( SURFACE-AT ?auto_246735 ?auto_246738 ) ( ON ?auto_246735 ?auto_246741 ) ( CLEAR ?auto_246735 ) ( not ( = ?auto_246734 ?auto_246741 ) ) ( not ( = ?auto_246735 ?auto_246741 ) ) ( not ( = ?auto_246736 ?auto_246741 ) ) ( SURFACE-AT ?auto_246736 ?auto_246740 ) ( CLEAR ?auto_246736 ) ( IS-CRATE ?auto_246734 ) ( AVAILABLE ?auto_246742 ) ( TRUCK-AT ?auto_246739 ?auto_246738 ) ( LIFTING ?auto_246737 ?auto_246734 ) )
    :subtasks
    ( ( !LOAD ?auto_246737 ?auto_246734 ?auto_246739 ?auto_246738 )
      ( MAKE-2CRATE ?auto_246736 ?auto_246734 ?auto_246735 )
      ( MAKE-1CRATE-VERIFY ?auto_246734 ?auto_246735 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_246743 - SURFACE
      ?auto_246744 - SURFACE
      ?auto_246745 - SURFACE
    )
    :vars
    (
      ?auto_246749 - HOIST
      ?auto_246750 - PLACE
      ?auto_246747 - PLACE
      ?auto_246751 - HOIST
      ?auto_246748 - SURFACE
      ?auto_246746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246749 ?auto_246750 ) ( IS-CRATE ?auto_246745 ) ( not ( = ?auto_246744 ?auto_246745 ) ) ( not ( = ?auto_246743 ?auto_246744 ) ) ( not ( = ?auto_246743 ?auto_246745 ) ) ( not ( = ?auto_246747 ?auto_246750 ) ) ( HOIST-AT ?auto_246751 ?auto_246747 ) ( not ( = ?auto_246749 ?auto_246751 ) ) ( SURFACE-AT ?auto_246745 ?auto_246747 ) ( ON ?auto_246745 ?auto_246748 ) ( CLEAR ?auto_246745 ) ( not ( = ?auto_246744 ?auto_246748 ) ) ( not ( = ?auto_246745 ?auto_246748 ) ) ( not ( = ?auto_246743 ?auto_246748 ) ) ( SURFACE-AT ?auto_246743 ?auto_246750 ) ( CLEAR ?auto_246743 ) ( IS-CRATE ?auto_246744 ) ( AVAILABLE ?auto_246749 ) ( TRUCK-AT ?auto_246746 ?auto_246747 ) ( LIFTING ?auto_246751 ?auto_246744 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_246744 ?auto_246745 )
      ( MAKE-2CRATE-VERIFY ?auto_246743 ?auto_246744 ?auto_246745 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_246752 - SURFACE
      ?auto_246753 - SURFACE
      ?auto_246754 - SURFACE
      ?auto_246755 - SURFACE
    )
    :vars
    (
      ?auto_246757 - HOIST
      ?auto_246761 - PLACE
      ?auto_246756 - PLACE
      ?auto_246760 - HOIST
      ?auto_246759 - SURFACE
      ?auto_246758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246757 ?auto_246761 ) ( IS-CRATE ?auto_246755 ) ( not ( = ?auto_246754 ?auto_246755 ) ) ( not ( = ?auto_246753 ?auto_246754 ) ) ( not ( = ?auto_246753 ?auto_246755 ) ) ( not ( = ?auto_246756 ?auto_246761 ) ) ( HOIST-AT ?auto_246760 ?auto_246756 ) ( not ( = ?auto_246757 ?auto_246760 ) ) ( SURFACE-AT ?auto_246755 ?auto_246756 ) ( ON ?auto_246755 ?auto_246759 ) ( CLEAR ?auto_246755 ) ( not ( = ?auto_246754 ?auto_246759 ) ) ( not ( = ?auto_246755 ?auto_246759 ) ) ( not ( = ?auto_246753 ?auto_246759 ) ) ( SURFACE-AT ?auto_246753 ?auto_246761 ) ( CLEAR ?auto_246753 ) ( IS-CRATE ?auto_246754 ) ( AVAILABLE ?auto_246757 ) ( TRUCK-AT ?auto_246758 ?auto_246756 ) ( LIFTING ?auto_246760 ?auto_246754 ) ( ON ?auto_246753 ?auto_246752 ) ( not ( = ?auto_246752 ?auto_246753 ) ) ( not ( = ?auto_246752 ?auto_246754 ) ) ( not ( = ?auto_246752 ?auto_246755 ) ) ( not ( = ?auto_246752 ?auto_246759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246753 ?auto_246754 ?auto_246755 )
      ( MAKE-3CRATE-VERIFY ?auto_246752 ?auto_246753 ?auto_246754 ?auto_246755 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_246762 - SURFACE
      ?auto_246763 - SURFACE
      ?auto_246764 - SURFACE
      ?auto_246766 - SURFACE
      ?auto_246765 - SURFACE
    )
    :vars
    (
      ?auto_246768 - HOIST
      ?auto_246772 - PLACE
      ?auto_246767 - PLACE
      ?auto_246771 - HOIST
      ?auto_246770 - SURFACE
      ?auto_246769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246768 ?auto_246772 ) ( IS-CRATE ?auto_246765 ) ( not ( = ?auto_246766 ?auto_246765 ) ) ( not ( = ?auto_246764 ?auto_246766 ) ) ( not ( = ?auto_246764 ?auto_246765 ) ) ( not ( = ?auto_246767 ?auto_246772 ) ) ( HOIST-AT ?auto_246771 ?auto_246767 ) ( not ( = ?auto_246768 ?auto_246771 ) ) ( SURFACE-AT ?auto_246765 ?auto_246767 ) ( ON ?auto_246765 ?auto_246770 ) ( CLEAR ?auto_246765 ) ( not ( = ?auto_246766 ?auto_246770 ) ) ( not ( = ?auto_246765 ?auto_246770 ) ) ( not ( = ?auto_246764 ?auto_246770 ) ) ( SURFACE-AT ?auto_246764 ?auto_246772 ) ( CLEAR ?auto_246764 ) ( IS-CRATE ?auto_246766 ) ( AVAILABLE ?auto_246768 ) ( TRUCK-AT ?auto_246769 ?auto_246767 ) ( LIFTING ?auto_246771 ?auto_246766 ) ( ON ?auto_246763 ?auto_246762 ) ( ON ?auto_246764 ?auto_246763 ) ( not ( = ?auto_246762 ?auto_246763 ) ) ( not ( = ?auto_246762 ?auto_246764 ) ) ( not ( = ?auto_246762 ?auto_246766 ) ) ( not ( = ?auto_246762 ?auto_246765 ) ) ( not ( = ?auto_246762 ?auto_246770 ) ) ( not ( = ?auto_246763 ?auto_246764 ) ) ( not ( = ?auto_246763 ?auto_246766 ) ) ( not ( = ?auto_246763 ?auto_246765 ) ) ( not ( = ?auto_246763 ?auto_246770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246764 ?auto_246766 ?auto_246765 )
      ( MAKE-4CRATE-VERIFY ?auto_246762 ?auto_246763 ?auto_246764 ?auto_246766 ?auto_246765 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246773 - SURFACE
      ?auto_246774 - SURFACE
      ?auto_246775 - SURFACE
      ?auto_246777 - SURFACE
      ?auto_246776 - SURFACE
      ?auto_246778 - SURFACE
    )
    :vars
    (
      ?auto_246780 - HOIST
      ?auto_246784 - PLACE
      ?auto_246779 - PLACE
      ?auto_246783 - HOIST
      ?auto_246782 - SURFACE
      ?auto_246781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246780 ?auto_246784 ) ( IS-CRATE ?auto_246778 ) ( not ( = ?auto_246776 ?auto_246778 ) ) ( not ( = ?auto_246777 ?auto_246776 ) ) ( not ( = ?auto_246777 ?auto_246778 ) ) ( not ( = ?auto_246779 ?auto_246784 ) ) ( HOIST-AT ?auto_246783 ?auto_246779 ) ( not ( = ?auto_246780 ?auto_246783 ) ) ( SURFACE-AT ?auto_246778 ?auto_246779 ) ( ON ?auto_246778 ?auto_246782 ) ( CLEAR ?auto_246778 ) ( not ( = ?auto_246776 ?auto_246782 ) ) ( not ( = ?auto_246778 ?auto_246782 ) ) ( not ( = ?auto_246777 ?auto_246782 ) ) ( SURFACE-AT ?auto_246777 ?auto_246784 ) ( CLEAR ?auto_246777 ) ( IS-CRATE ?auto_246776 ) ( AVAILABLE ?auto_246780 ) ( TRUCK-AT ?auto_246781 ?auto_246779 ) ( LIFTING ?auto_246783 ?auto_246776 ) ( ON ?auto_246774 ?auto_246773 ) ( ON ?auto_246775 ?auto_246774 ) ( ON ?auto_246777 ?auto_246775 ) ( not ( = ?auto_246773 ?auto_246774 ) ) ( not ( = ?auto_246773 ?auto_246775 ) ) ( not ( = ?auto_246773 ?auto_246777 ) ) ( not ( = ?auto_246773 ?auto_246776 ) ) ( not ( = ?auto_246773 ?auto_246778 ) ) ( not ( = ?auto_246773 ?auto_246782 ) ) ( not ( = ?auto_246774 ?auto_246775 ) ) ( not ( = ?auto_246774 ?auto_246777 ) ) ( not ( = ?auto_246774 ?auto_246776 ) ) ( not ( = ?auto_246774 ?auto_246778 ) ) ( not ( = ?auto_246774 ?auto_246782 ) ) ( not ( = ?auto_246775 ?auto_246777 ) ) ( not ( = ?auto_246775 ?auto_246776 ) ) ( not ( = ?auto_246775 ?auto_246778 ) ) ( not ( = ?auto_246775 ?auto_246782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246777 ?auto_246776 ?auto_246778 )
      ( MAKE-5CRATE-VERIFY ?auto_246773 ?auto_246774 ?auto_246775 ?auto_246777 ?auto_246776 ?auto_246778 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_246785 - SURFACE
      ?auto_246786 - SURFACE
    )
    :vars
    (
      ?auto_246788 - HOIST
      ?auto_246793 - PLACE
      ?auto_246792 - SURFACE
      ?auto_246787 - PLACE
      ?auto_246791 - HOIST
      ?auto_246790 - SURFACE
      ?auto_246789 - TRUCK
      ?auto_246794 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246788 ?auto_246793 ) ( IS-CRATE ?auto_246786 ) ( not ( = ?auto_246785 ?auto_246786 ) ) ( not ( = ?auto_246792 ?auto_246785 ) ) ( not ( = ?auto_246792 ?auto_246786 ) ) ( not ( = ?auto_246787 ?auto_246793 ) ) ( HOIST-AT ?auto_246791 ?auto_246787 ) ( not ( = ?auto_246788 ?auto_246791 ) ) ( SURFACE-AT ?auto_246786 ?auto_246787 ) ( ON ?auto_246786 ?auto_246790 ) ( CLEAR ?auto_246786 ) ( not ( = ?auto_246785 ?auto_246790 ) ) ( not ( = ?auto_246786 ?auto_246790 ) ) ( not ( = ?auto_246792 ?auto_246790 ) ) ( SURFACE-AT ?auto_246792 ?auto_246793 ) ( CLEAR ?auto_246792 ) ( IS-CRATE ?auto_246785 ) ( AVAILABLE ?auto_246788 ) ( TRUCK-AT ?auto_246789 ?auto_246787 ) ( AVAILABLE ?auto_246791 ) ( SURFACE-AT ?auto_246785 ?auto_246787 ) ( ON ?auto_246785 ?auto_246794 ) ( CLEAR ?auto_246785 ) ( not ( = ?auto_246785 ?auto_246794 ) ) ( not ( = ?auto_246786 ?auto_246794 ) ) ( not ( = ?auto_246792 ?auto_246794 ) ) ( not ( = ?auto_246790 ?auto_246794 ) ) )
    :subtasks
    ( ( !LIFT ?auto_246791 ?auto_246785 ?auto_246794 ?auto_246787 )
      ( MAKE-2CRATE ?auto_246792 ?auto_246785 ?auto_246786 )
      ( MAKE-1CRATE-VERIFY ?auto_246785 ?auto_246786 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_246795 - SURFACE
      ?auto_246796 - SURFACE
      ?auto_246797 - SURFACE
    )
    :vars
    (
      ?auto_246798 - HOIST
      ?auto_246799 - PLACE
      ?auto_246804 - PLACE
      ?auto_246802 - HOIST
      ?auto_246803 - SURFACE
      ?auto_246800 - TRUCK
      ?auto_246801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246798 ?auto_246799 ) ( IS-CRATE ?auto_246797 ) ( not ( = ?auto_246796 ?auto_246797 ) ) ( not ( = ?auto_246795 ?auto_246796 ) ) ( not ( = ?auto_246795 ?auto_246797 ) ) ( not ( = ?auto_246804 ?auto_246799 ) ) ( HOIST-AT ?auto_246802 ?auto_246804 ) ( not ( = ?auto_246798 ?auto_246802 ) ) ( SURFACE-AT ?auto_246797 ?auto_246804 ) ( ON ?auto_246797 ?auto_246803 ) ( CLEAR ?auto_246797 ) ( not ( = ?auto_246796 ?auto_246803 ) ) ( not ( = ?auto_246797 ?auto_246803 ) ) ( not ( = ?auto_246795 ?auto_246803 ) ) ( SURFACE-AT ?auto_246795 ?auto_246799 ) ( CLEAR ?auto_246795 ) ( IS-CRATE ?auto_246796 ) ( AVAILABLE ?auto_246798 ) ( TRUCK-AT ?auto_246800 ?auto_246804 ) ( AVAILABLE ?auto_246802 ) ( SURFACE-AT ?auto_246796 ?auto_246804 ) ( ON ?auto_246796 ?auto_246801 ) ( CLEAR ?auto_246796 ) ( not ( = ?auto_246796 ?auto_246801 ) ) ( not ( = ?auto_246797 ?auto_246801 ) ) ( not ( = ?auto_246795 ?auto_246801 ) ) ( not ( = ?auto_246803 ?auto_246801 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_246796 ?auto_246797 )
      ( MAKE-2CRATE-VERIFY ?auto_246795 ?auto_246796 ?auto_246797 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_246805 - SURFACE
      ?auto_246806 - SURFACE
      ?auto_246807 - SURFACE
      ?auto_246808 - SURFACE
    )
    :vars
    (
      ?auto_246810 - HOIST
      ?auto_246811 - PLACE
      ?auto_246814 - PLACE
      ?auto_246815 - HOIST
      ?auto_246813 - SURFACE
      ?auto_246809 - TRUCK
      ?auto_246812 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246810 ?auto_246811 ) ( IS-CRATE ?auto_246808 ) ( not ( = ?auto_246807 ?auto_246808 ) ) ( not ( = ?auto_246806 ?auto_246807 ) ) ( not ( = ?auto_246806 ?auto_246808 ) ) ( not ( = ?auto_246814 ?auto_246811 ) ) ( HOIST-AT ?auto_246815 ?auto_246814 ) ( not ( = ?auto_246810 ?auto_246815 ) ) ( SURFACE-AT ?auto_246808 ?auto_246814 ) ( ON ?auto_246808 ?auto_246813 ) ( CLEAR ?auto_246808 ) ( not ( = ?auto_246807 ?auto_246813 ) ) ( not ( = ?auto_246808 ?auto_246813 ) ) ( not ( = ?auto_246806 ?auto_246813 ) ) ( SURFACE-AT ?auto_246806 ?auto_246811 ) ( CLEAR ?auto_246806 ) ( IS-CRATE ?auto_246807 ) ( AVAILABLE ?auto_246810 ) ( TRUCK-AT ?auto_246809 ?auto_246814 ) ( AVAILABLE ?auto_246815 ) ( SURFACE-AT ?auto_246807 ?auto_246814 ) ( ON ?auto_246807 ?auto_246812 ) ( CLEAR ?auto_246807 ) ( not ( = ?auto_246807 ?auto_246812 ) ) ( not ( = ?auto_246808 ?auto_246812 ) ) ( not ( = ?auto_246806 ?auto_246812 ) ) ( not ( = ?auto_246813 ?auto_246812 ) ) ( ON ?auto_246806 ?auto_246805 ) ( not ( = ?auto_246805 ?auto_246806 ) ) ( not ( = ?auto_246805 ?auto_246807 ) ) ( not ( = ?auto_246805 ?auto_246808 ) ) ( not ( = ?auto_246805 ?auto_246813 ) ) ( not ( = ?auto_246805 ?auto_246812 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246806 ?auto_246807 ?auto_246808 )
      ( MAKE-3CRATE-VERIFY ?auto_246805 ?auto_246806 ?auto_246807 ?auto_246808 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_246816 - SURFACE
      ?auto_246817 - SURFACE
      ?auto_246818 - SURFACE
      ?auto_246820 - SURFACE
      ?auto_246819 - SURFACE
    )
    :vars
    (
      ?auto_246822 - HOIST
      ?auto_246823 - PLACE
      ?auto_246826 - PLACE
      ?auto_246827 - HOIST
      ?auto_246825 - SURFACE
      ?auto_246821 - TRUCK
      ?auto_246824 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246822 ?auto_246823 ) ( IS-CRATE ?auto_246819 ) ( not ( = ?auto_246820 ?auto_246819 ) ) ( not ( = ?auto_246818 ?auto_246820 ) ) ( not ( = ?auto_246818 ?auto_246819 ) ) ( not ( = ?auto_246826 ?auto_246823 ) ) ( HOIST-AT ?auto_246827 ?auto_246826 ) ( not ( = ?auto_246822 ?auto_246827 ) ) ( SURFACE-AT ?auto_246819 ?auto_246826 ) ( ON ?auto_246819 ?auto_246825 ) ( CLEAR ?auto_246819 ) ( not ( = ?auto_246820 ?auto_246825 ) ) ( not ( = ?auto_246819 ?auto_246825 ) ) ( not ( = ?auto_246818 ?auto_246825 ) ) ( SURFACE-AT ?auto_246818 ?auto_246823 ) ( CLEAR ?auto_246818 ) ( IS-CRATE ?auto_246820 ) ( AVAILABLE ?auto_246822 ) ( TRUCK-AT ?auto_246821 ?auto_246826 ) ( AVAILABLE ?auto_246827 ) ( SURFACE-AT ?auto_246820 ?auto_246826 ) ( ON ?auto_246820 ?auto_246824 ) ( CLEAR ?auto_246820 ) ( not ( = ?auto_246820 ?auto_246824 ) ) ( not ( = ?auto_246819 ?auto_246824 ) ) ( not ( = ?auto_246818 ?auto_246824 ) ) ( not ( = ?auto_246825 ?auto_246824 ) ) ( ON ?auto_246817 ?auto_246816 ) ( ON ?auto_246818 ?auto_246817 ) ( not ( = ?auto_246816 ?auto_246817 ) ) ( not ( = ?auto_246816 ?auto_246818 ) ) ( not ( = ?auto_246816 ?auto_246820 ) ) ( not ( = ?auto_246816 ?auto_246819 ) ) ( not ( = ?auto_246816 ?auto_246825 ) ) ( not ( = ?auto_246816 ?auto_246824 ) ) ( not ( = ?auto_246817 ?auto_246818 ) ) ( not ( = ?auto_246817 ?auto_246820 ) ) ( not ( = ?auto_246817 ?auto_246819 ) ) ( not ( = ?auto_246817 ?auto_246825 ) ) ( not ( = ?auto_246817 ?auto_246824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246818 ?auto_246820 ?auto_246819 )
      ( MAKE-4CRATE-VERIFY ?auto_246816 ?auto_246817 ?auto_246818 ?auto_246820 ?auto_246819 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246828 - SURFACE
      ?auto_246829 - SURFACE
      ?auto_246830 - SURFACE
      ?auto_246832 - SURFACE
      ?auto_246831 - SURFACE
      ?auto_246833 - SURFACE
    )
    :vars
    (
      ?auto_246835 - HOIST
      ?auto_246836 - PLACE
      ?auto_246839 - PLACE
      ?auto_246840 - HOIST
      ?auto_246838 - SURFACE
      ?auto_246834 - TRUCK
      ?auto_246837 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246835 ?auto_246836 ) ( IS-CRATE ?auto_246833 ) ( not ( = ?auto_246831 ?auto_246833 ) ) ( not ( = ?auto_246832 ?auto_246831 ) ) ( not ( = ?auto_246832 ?auto_246833 ) ) ( not ( = ?auto_246839 ?auto_246836 ) ) ( HOIST-AT ?auto_246840 ?auto_246839 ) ( not ( = ?auto_246835 ?auto_246840 ) ) ( SURFACE-AT ?auto_246833 ?auto_246839 ) ( ON ?auto_246833 ?auto_246838 ) ( CLEAR ?auto_246833 ) ( not ( = ?auto_246831 ?auto_246838 ) ) ( not ( = ?auto_246833 ?auto_246838 ) ) ( not ( = ?auto_246832 ?auto_246838 ) ) ( SURFACE-AT ?auto_246832 ?auto_246836 ) ( CLEAR ?auto_246832 ) ( IS-CRATE ?auto_246831 ) ( AVAILABLE ?auto_246835 ) ( TRUCK-AT ?auto_246834 ?auto_246839 ) ( AVAILABLE ?auto_246840 ) ( SURFACE-AT ?auto_246831 ?auto_246839 ) ( ON ?auto_246831 ?auto_246837 ) ( CLEAR ?auto_246831 ) ( not ( = ?auto_246831 ?auto_246837 ) ) ( not ( = ?auto_246833 ?auto_246837 ) ) ( not ( = ?auto_246832 ?auto_246837 ) ) ( not ( = ?auto_246838 ?auto_246837 ) ) ( ON ?auto_246829 ?auto_246828 ) ( ON ?auto_246830 ?auto_246829 ) ( ON ?auto_246832 ?auto_246830 ) ( not ( = ?auto_246828 ?auto_246829 ) ) ( not ( = ?auto_246828 ?auto_246830 ) ) ( not ( = ?auto_246828 ?auto_246832 ) ) ( not ( = ?auto_246828 ?auto_246831 ) ) ( not ( = ?auto_246828 ?auto_246833 ) ) ( not ( = ?auto_246828 ?auto_246838 ) ) ( not ( = ?auto_246828 ?auto_246837 ) ) ( not ( = ?auto_246829 ?auto_246830 ) ) ( not ( = ?auto_246829 ?auto_246832 ) ) ( not ( = ?auto_246829 ?auto_246831 ) ) ( not ( = ?auto_246829 ?auto_246833 ) ) ( not ( = ?auto_246829 ?auto_246838 ) ) ( not ( = ?auto_246829 ?auto_246837 ) ) ( not ( = ?auto_246830 ?auto_246832 ) ) ( not ( = ?auto_246830 ?auto_246831 ) ) ( not ( = ?auto_246830 ?auto_246833 ) ) ( not ( = ?auto_246830 ?auto_246838 ) ) ( not ( = ?auto_246830 ?auto_246837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246832 ?auto_246831 ?auto_246833 )
      ( MAKE-5CRATE-VERIFY ?auto_246828 ?auto_246829 ?auto_246830 ?auto_246832 ?auto_246831 ?auto_246833 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_246841 - SURFACE
      ?auto_246842 - SURFACE
    )
    :vars
    (
      ?auto_246844 - HOIST
      ?auto_246845 - PLACE
      ?auto_246848 - SURFACE
      ?auto_246849 - PLACE
      ?auto_246850 - HOIST
      ?auto_246847 - SURFACE
      ?auto_246846 - SURFACE
      ?auto_246843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246844 ?auto_246845 ) ( IS-CRATE ?auto_246842 ) ( not ( = ?auto_246841 ?auto_246842 ) ) ( not ( = ?auto_246848 ?auto_246841 ) ) ( not ( = ?auto_246848 ?auto_246842 ) ) ( not ( = ?auto_246849 ?auto_246845 ) ) ( HOIST-AT ?auto_246850 ?auto_246849 ) ( not ( = ?auto_246844 ?auto_246850 ) ) ( SURFACE-AT ?auto_246842 ?auto_246849 ) ( ON ?auto_246842 ?auto_246847 ) ( CLEAR ?auto_246842 ) ( not ( = ?auto_246841 ?auto_246847 ) ) ( not ( = ?auto_246842 ?auto_246847 ) ) ( not ( = ?auto_246848 ?auto_246847 ) ) ( SURFACE-AT ?auto_246848 ?auto_246845 ) ( CLEAR ?auto_246848 ) ( IS-CRATE ?auto_246841 ) ( AVAILABLE ?auto_246844 ) ( AVAILABLE ?auto_246850 ) ( SURFACE-AT ?auto_246841 ?auto_246849 ) ( ON ?auto_246841 ?auto_246846 ) ( CLEAR ?auto_246841 ) ( not ( = ?auto_246841 ?auto_246846 ) ) ( not ( = ?auto_246842 ?auto_246846 ) ) ( not ( = ?auto_246848 ?auto_246846 ) ) ( not ( = ?auto_246847 ?auto_246846 ) ) ( TRUCK-AT ?auto_246843 ?auto_246845 ) )
    :subtasks
    ( ( !DRIVE ?auto_246843 ?auto_246845 ?auto_246849 )
      ( MAKE-2CRATE ?auto_246848 ?auto_246841 ?auto_246842 )
      ( MAKE-1CRATE-VERIFY ?auto_246841 ?auto_246842 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_246851 - SURFACE
      ?auto_246852 - SURFACE
      ?auto_246853 - SURFACE
    )
    :vars
    (
      ?auto_246855 - HOIST
      ?auto_246856 - PLACE
      ?auto_246860 - PLACE
      ?auto_246859 - HOIST
      ?auto_246858 - SURFACE
      ?auto_246854 - SURFACE
      ?auto_246857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246855 ?auto_246856 ) ( IS-CRATE ?auto_246853 ) ( not ( = ?auto_246852 ?auto_246853 ) ) ( not ( = ?auto_246851 ?auto_246852 ) ) ( not ( = ?auto_246851 ?auto_246853 ) ) ( not ( = ?auto_246860 ?auto_246856 ) ) ( HOIST-AT ?auto_246859 ?auto_246860 ) ( not ( = ?auto_246855 ?auto_246859 ) ) ( SURFACE-AT ?auto_246853 ?auto_246860 ) ( ON ?auto_246853 ?auto_246858 ) ( CLEAR ?auto_246853 ) ( not ( = ?auto_246852 ?auto_246858 ) ) ( not ( = ?auto_246853 ?auto_246858 ) ) ( not ( = ?auto_246851 ?auto_246858 ) ) ( SURFACE-AT ?auto_246851 ?auto_246856 ) ( CLEAR ?auto_246851 ) ( IS-CRATE ?auto_246852 ) ( AVAILABLE ?auto_246855 ) ( AVAILABLE ?auto_246859 ) ( SURFACE-AT ?auto_246852 ?auto_246860 ) ( ON ?auto_246852 ?auto_246854 ) ( CLEAR ?auto_246852 ) ( not ( = ?auto_246852 ?auto_246854 ) ) ( not ( = ?auto_246853 ?auto_246854 ) ) ( not ( = ?auto_246851 ?auto_246854 ) ) ( not ( = ?auto_246858 ?auto_246854 ) ) ( TRUCK-AT ?auto_246857 ?auto_246856 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_246852 ?auto_246853 )
      ( MAKE-2CRATE-VERIFY ?auto_246851 ?auto_246852 ?auto_246853 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_246861 - SURFACE
      ?auto_246862 - SURFACE
      ?auto_246863 - SURFACE
      ?auto_246864 - SURFACE
    )
    :vars
    (
      ?auto_246871 - HOIST
      ?auto_246868 - PLACE
      ?auto_246865 - PLACE
      ?auto_246866 - HOIST
      ?auto_246867 - SURFACE
      ?auto_246869 - SURFACE
      ?auto_246870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246871 ?auto_246868 ) ( IS-CRATE ?auto_246864 ) ( not ( = ?auto_246863 ?auto_246864 ) ) ( not ( = ?auto_246862 ?auto_246863 ) ) ( not ( = ?auto_246862 ?auto_246864 ) ) ( not ( = ?auto_246865 ?auto_246868 ) ) ( HOIST-AT ?auto_246866 ?auto_246865 ) ( not ( = ?auto_246871 ?auto_246866 ) ) ( SURFACE-AT ?auto_246864 ?auto_246865 ) ( ON ?auto_246864 ?auto_246867 ) ( CLEAR ?auto_246864 ) ( not ( = ?auto_246863 ?auto_246867 ) ) ( not ( = ?auto_246864 ?auto_246867 ) ) ( not ( = ?auto_246862 ?auto_246867 ) ) ( SURFACE-AT ?auto_246862 ?auto_246868 ) ( CLEAR ?auto_246862 ) ( IS-CRATE ?auto_246863 ) ( AVAILABLE ?auto_246871 ) ( AVAILABLE ?auto_246866 ) ( SURFACE-AT ?auto_246863 ?auto_246865 ) ( ON ?auto_246863 ?auto_246869 ) ( CLEAR ?auto_246863 ) ( not ( = ?auto_246863 ?auto_246869 ) ) ( not ( = ?auto_246864 ?auto_246869 ) ) ( not ( = ?auto_246862 ?auto_246869 ) ) ( not ( = ?auto_246867 ?auto_246869 ) ) ( TRUCK-AT ?auto_246870 ?auto_246868 ) ( ON ?auto_246862 ?auto_246861 ) ( not ( = ?auto_246861 ?auto_246862 ) ) ( not ( = ?auto_246861 ?auto_246863 ) ) ( not ( = ?auto_246861 ?auto_246864 ) ) ( not ( = ?auto_246861 ?auto_246867 ) ) ( not ( = ?auto_246861 ?auto_246869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246862 ?auto_246863 ?auto_246864 )
      ( MAKE-3CRATE-VERIFY ?auto_246861 ?auto_246862 ?auto_246863 ?auto_246864 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_246872 - SURFACE
      ?auto_246873 - SURFACE
      ?auto_246874 - SURFACE
      ?auto_246876 - SURFACE
      ?auto_246875 - SURFACE
    )
    :vars
    (
      ?auto_246883 - HOIST
      ?auto_246880 - PLACE
      ?auto_246877 - PLACE
      ?auto_246878 - HOIST
      ?auto_246879 - SURFACE
      ?auto_246881 - SURFACE
      ?auto_246882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246883 ?auto_246880 ) ( IS-CRATE ?auto_246875 ) ( not ( = ?auto_246876 ?auto_246875 ) ) ( not ( = ?auto_246874 ?auto_246876 ) ) ( not ( = ?auto_246874 ?auto_246875 ) ) ( not ( = ?auto_246877 ?auto_246880 ) ) ( HOIST-AT ?auto_246878 ?auto_246877 ) ( not ( = ?auto_246883 ?auto_246878 ) ) ( SURFACE-AT ?auto_246875 ?auto_246877 ) ( ON ?auto_246875 ?auto_246879 ) ( CLEAR ?auto_246875 ) ( not ( = ?auto_246876 ?auto_246879 ) ) ( not ( = ?auto_246875 ?auto_246879 ) ) ( not ( = ?auto_246874 ?auto_246879 ) ) ( SURFACE-AT ?auto_246874 ?auto_246880 ) ( CLEAR ?auto_246874 ) ( IS-CRATE ?auto_246876 ) ( AVAILABLE ?auto_246883 ) ( AVAILABLE ?auto_246878 ) ( SURFACE-AT ?auto_246876 ?auto_246877 ) ( ON ?auto_246876 ?auto_246881 ) ( CLEAR ?auto_246876 ) ( not ( = ?auto_246876 ?auto_246881 ) ) ( not ( = ?auto_246875 ?auto_246881 ) ) ( not ( = ?auto_246874 ?auto_246881 ) ) ( not ( = ?auto_246879 ?auto_246881 ) ) ( TRUCK-AT ?auto_246882 ?auto_246880 ) ( ON ?auto_246873 ?auto_246872 ) ( ON ?auto_246874 ?auto_246873 ) ( not ( = ?auto_246872 ?auto_246873 ) ) ( not ( = ?auto_246872 ?auto_246874 ) ) ( not ( = ?auto_246872 ?auto_246876 ) ) ( not ( = ?auto_246872 ?auto_246875 ) ) ( not ( = ?auto_246872 ?auto_246879 ) ) ( not ( = ?auto_246872 ?auto_246881 ) ) ( not ( = ?auto_246873 ?auto_246874 ) ) ( not ( = ?auto_246873 ?auto_246876 ) ) ( not ( = ?auto_246873 ?auto_246875 ) ) ( not ( = ?auto_246873 ?auto_246879 ) ) ( not ( = ?auto_246873 ?auto_246881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246874 ?auto_246876 ?auto_246875 )
      ( MAKE-4CRATE-VERIFY ?auto_246872 ?auto_246873 ?auto_246874 ?auto_246876 ?auto_246875 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246884 - SURFACE
      ?auto_246885 - SURFACE
      ?auto_246886 - SURFACE
      ?auto_246888 - SURFACE
      ?auto_246887 - SURFACE
      ?auto_246889 - SURFACE
    )
    :vars
    (
      ?auto_246896 - HOIST
      ?auto_246893 - PLACE
      ?auto_246890 - PLACE
      ?auto_246891 - HOIST
      ?auto_246892 - SURFACE
      ?auto_246894 - SURFACE
      ?auto_246895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246896 ?auto_246893 ) ( IS-CRATE ?auto_246889 ) ( not ( = ?auto_246887 ?auto_246889 ) ) ( not ( = ?auto_246888 ?auto_246887 ) ) ( not ( = ?auto_246888 ?auto_246889 ) ) ( not ( = ?auto_246890 ?auto_246893 ) ) ( HOIST-AT ?auto_246891 ?auto_246890 ) ( not ( = ?auto_246896 ?auto_246891 ) ) ( SURFACE-AT ?auto_246889 ?auto_246890 ) ( ON ?auto_246889 ?auto_246892 ) ( CLEAR ?auto_246889 ) ( not ( = ?auto_246887 ?auto_246892 ) ) ( not ( = ?auto_246889 ?auto_246892 ) ) ( not ( = ?auto_246888 ?auto_246892 ) ) ( SURFACE-AT ?auto_246888 ?auto_246893 ) ( CLEAR ?auto_246888 ) ( IS-CRATE ?auto_246887 ) ( AVAILABLE ?auto_246896 ) ( AVAILABLE ?auto_246891 ) ( SURFACE-AT ?auto_246887 ?auto_246890 ) ( ON ?auto_246887 ?auto_246894 ) ( CLEAR ?auto_246887 ) ( not ( = ?auto_246887 ?auto_246894 ) ) ( not ( = ?auto_246889 ?auto_246894 ) ) ( not ( = ?auto_246888 ?auto_246894 ) ) ( not ( = ?auto_246892 ?auto_246894 ) ) ( TRUCK-AT ?auto_246895 ?auto_246893 ) ( ON ?auto_246885 ?auto_246884 ) ( ON ?auto_246886 ?auto_246885 ) ( ON ?auto_246888 ?auto_246886 ) ( not ( = ?auto_246884 ?auto_246885 ) ) ( not ( = ?auto_246884 ?auto_246886 ) ) ( not ( = ?auto_246884 ?auto_246888 ) ) ( not ( = ?auto_246884 ?auto_246887 ) ) ( not ( = ?auto_246884 ?auto_246889 ) ) ( not ( = ?auto_246884 ?auto_246892 ) ) ( not ( = ?auto_246884 ?auto_246894 ) ) ( not ( = ?auto_246885 ?auto_246886 ) ) ( not ( = ?auto_246885 ?auto_246888 ) ) ( not ( = ?auto_246885 ?auto_246887 ) ) ( not ( = ?auto_246885 ?auto_246889 ) ) ( not ( = ?auto_246885 ?auto_246892 ) ) ( not ( = ?auto_246885 ?auto_246894 ) ) ( not ( = ?auto_246886 ?auto_246888 ) ) ( not ( = ?auto_246886 ?auto_246887 ) ) ( not ( = ?auto_246886 ?auto_246889 ) ) ( not ( = ?auto_246886 ?auto_246892 ) ) ( not ( = ?auto_246886 ?auto_246894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246888 ?auto_246887 ?auto_246889 )
      ( MAKE-5CRATE-VERIFY ?auto_246884 ?auto_246885 ?auto_246886 ?auto_246888 ?auto_246887 ?auto_246889 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_246897 - SURFACE
      ?auto_246898 - SURFACE
    )
    :vars
    (
      ?auto_246906 - HOIST
      ?auto_246903 - PLACE
      ?auto_246899 - SURFACE
      ?auto_246900 - PLACE
      ?auto_246901 - HOIST
      ?auto_246902 - SURFACE
      ?auto_246904 - SURFACE
      ?auto_246905 - TRUCK
      ?auto_246907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246906 ?auto_246903 ) ( IS-CRATE ?auto_246898 ) ( not ( = ?auto_246897 ?auto_246898 ) ) ( not ( = ?auto_246899 ?auto_246897 ) ) ( not ( = ?auto_246899 ?auto_246898 ) ) ( not ( = ?auto_246900 ?auto_246903 ) ) ( HOIST-AT ?auto_246901 ?auto_246900 ) ( not ( = ?auto_246906 ?auto_246901 ) ) ( SURFACE-AT ?auto_246898 ?auto_246900 ) ( ON ?auto_246898 ?auto_246902 ) ( CLEAR ?auto_246898 ) ( not ( = ?auto_246897 ?auto_246902 ) ) ( not ( = ?auto_246898 ?auto_246902 ) ) ( not ( = ?auto_246899 ?auto_246902 ) ) ( IS-CRATE ?auto_246897 ) ( AVAILABLE ?auto_246901 ) ( SURFACE-AT ?auto_246897 ?auto_246900 ) ( ON ?auto_246897 ?auto_246904 ) ( CLEAR ?auto_246897 ) ( not ( = ?auto_246897 ?auto_246904 ) ) ( not ( = ?auto_246898 ?auto_246904 ) ) ( not ( = ?auto_246899 ?auto_246904 ) ) ( not ( = ?auto_246902 ?auto_246904 ) ) ( TRUCK-AT ?auto_246905 ?auto_246903 ) ( SURFACE-AT ?auto_246907 ?auto_246903 ) ( CLEAR ?auto_246907 ) ( LIFTING ?auto_246906 ?auto_246899 ) ( IS-CRATE ?auto_246899 ) ( not ( = ?auto_246907 ?auto_246899 ) ) ( not ( = ?auto_246897 ?auto_246907 ) ) ( not ( = ?auto_246898 ?auto_246907 ) ) ( not ( = ?auto_246902 ?auto_246907 ) ) ( not ( = ?auto_246904 ?auto_246907 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_246907 ?auto_246899 )
      ( MAKE-2CRATE ?auto_246899 ?auto_246897 ?auto_246898 )
      ( MAKE-1CRATE-VERIFY ?auto_246897 ?auto_246898 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_246908 - SURFACE
      ?auto_246909 - SURFACE
      ?auto_246910 - SURFACE
    )
    :vars
    (
      ?auto_246915 - HOIST
      ?auto_246912 - PLACE
      ?auto_246913 - PLACE
      ?auto_246911 - HOIST
      ?auto_246918 - SURFACE
      ?auto_246916 - SURFACE
      ?auto_246914 - TRUCK
      ?auto_246917 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_246915 ?auto_246912 ) ( IS-CRATE ?auto_246910 ) ( not ( = ?auto_246909 ?auto_246910 ) ) ( not ( = ?auto_246908 ?auto_246909 ) ) ( not ( = ?auto_246908 ?auto_246910 ) ) ( not ( = ?auto_246913 ?auto_246912 ) ) ( HOIST-AT ?auto_246911 ?auto_246913 ) ( not ( = ?auto_246915 ?auto_246911 ) ) ( SURFACE-AT ?auto_246910 ?auto_246913 ) ( ON ?auto_246910 ?auto_246918 ) ( CLEAR ?auto_246910 ) ( not ( = ?auto_246909 ?auto_246918 ) ) ( not ( = ?auto_246910 ?auto_246918 ) ) ( not ( = ?auto_246908 ?auto_246918 ) ) ( IS-CRATE ?auto_246909 ) ( AVAILABLE ?auto_246911 ) ( SURFACE-AT ?auto_246909 ?auto_246913 ) ( ON ?auto_246909 ?auto_246916 ) ( CLEAR ?auto_246909 ) ( not ( = ?auto_246909 ?auto_246916 ) ) ( not ( = ?auto_246910 ?auto_246916 ) ) ( not ( = ?auto_246908 ?auto_246916 ) ) ( not ( = ?auto_246918 ?auto_246916 ) ) ( TRUCK-AT ?auto_246914 ?auto_246912 ) ( SURFACE-AT ?auto_246917 ?auto_246912 ) ( CLEAR ?auto_246917 ) ( LIFTING ?auto_246915 ?auto_246908 ) ( IS-CRATE ?auto_246908 ) ( not ( = ?auto_246917 ?auto_246908 ) ) ( not ( = ?auto_246909 ?auto_246917 ) ) ( not ( = ?auto_246910 ?auto_246917 ) ) ( not ( = ?auto_246918 ?auto_246917 ) ) ( not ( = ?auto_246916 ?auto_246917 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_246909 ?auto_246910 )
      ( MAKE-2CRATE-VERIFY ?auto_246908 ?auto_246909 ?auto_246910 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_246919 - SURFACE
      ?auto_246920 - SURFACE
      ?auto_246921 - SURFACE
      ?auto_246922 - SURFACE
    )
    :vars
    (
      ?auto_246929 - HOIST
      ?auto_246928 - PLACE
      ?auto_246926 - PLACE
      ?auto_246925 - HOIST
      ?auto_246923 - SURFACE
      ?auto_246924 - SURFACE
      ?auto_246927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246929 ?auto_246928 ) ( IS-CRATE ?auto_246922 ) ( not ( = ?auto_246921 ?auto_246922 ) ) ( not ( = ?auto_246920 ?auto_246921 ) ) ( not ( = ?auto_246920 ?auto_246922 ) ) ( not ( = ?auto_246926 ?auto_246928 ) ) ( HOIST-AT ?auto_246925 ?auto_246926 ) ( not ( = ?auto_246929 ?auto_246925 ) ) ( SURFACE-AT ?auto_246922 ?auto_246926 ) ( ON ?auto_246922 ?auto_246923 ) ( CLEAR ?auto_246922 ) ( not ( = ?auto_246921 ?auto_246923 ) ) ( not ( = ?auto_246922 ?auto_246923 ) ) ( not ( = ?auto_246920 ?auto_246923 ) ) ( IS-CRATE ?auto_246921 ) ( AVAILABLE ?auto_246925 ) ( SURFACE-AT ?auto_246921 ?auto_246926 ) ( ON ?auto_246921 ?auto_246924 ) ( CLEAR ?auto_246921 ) ( not ( = ?auto_246921 ?auto_246924 ) ) ( not ( = ?auto_246922 ?auto_246924 ) ) ( not ( = ?auto_246920 ?auto_246924 ) ) ( not ( = ?auto_246923 ?auto_246924 ) ) ( TRUCK-AT ?auto_246927 ?auto_246928 ) ( SURFACE-AT ?auto_246919 ?auto_246928 ) ( CLEAR ?auto_246919 ) ( LIFTING ?auto_246929 ?auto_246920 ) ( IS-CRATE ?auto_246920 ) ( not ( = ?auto_246919 ?auto_246920 ) ) ( not ( = ?auto_246921 ?auto_246919 ) ) ( not ( = ?auto_246922 ?auto_246919 ) ) ( not ( = ?auto_246923 ?auto_246919 ) ) ( not ( = ?auto_246924 ?auto_246919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246920 ?auto_246921 ?auto_246922 )
      ( MAKE-3CRATE-VERIFY ?auto_246919 ?auto_246920 ?auto_246921 ?auto_246922 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_246930 - SURFACE
      ?auto_246931 - SURFACE
      ?auto_246932 - SURFACE
      ?auto_246934 - SURFACE
      ?auto_246933 - SURFACE
    )
    :vars
    (
      ?auto_246941 - HOIST
      ?auto_246940 - PLACE
      ?auto_246938 - PLACE
      ?auto_246937 - HOIST
      ?auto_246935 - SURFACE
      ?auto_246936 - SURFACE
      ?auto_246939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246941 ?auto_246940 ) ( IS-CRATE ?auto_246933 ) ( not ( = ?auto_246934 ?auto_246933 ) ) ( not ( = ?auto_246932 ?auto_246934 ) ) ( not ( = ?auto_246932 ?auto_246933 ) ) ( not ( = ?auto_246938 ?auto_246940 ) ) ( HOIST-AT ?auto_246937 ?auto_246938 ) ( not ( = ?auto_246941 ?auto_246937 ) ) ( SURFACE-AT ?auto_246933 ?auto_246938 ) ( ON ?auto_246933 ?auto_246935 ) ( CLEAR ?auto_246933 ) ( not ( = ?auto_246934 ?auto_246935 ) ) ( not ( = ?auto_246933 ?auto_246935 ) ) ( not ( = ?auto_246932 ?auto_246935 ) ) ( IS-CRATE ?auto_246934 ) ( AVAILABLE ?auto_246937 ) ( SURFACE-AT ?auto_246934 ?auto_246938 ) ( ON ?auto_246934 ?auto_246936 ) ( CLEAR ?auto_246934 ) ( not ( = ?auto_246934 ?auto_246936 ) ) ( not ( = ?auto_246933 ?auto_246936 ) ) ( not ( = ?auto_246932 ?auto_246936 ) ) ( not ( = ?auto_246935 ?auto_246936 ) ) ( TRUCK-AT ?auto_246939 ?auto_246940 ) ( SURFACE-AT ?auto_246931 ?auto_246940 ) ( CLEAR ?auto_246931 ) ( LIFTING ?auto_246941 ?auto_246932 ) ( IS-CRATE ?auto_246932 ) ( not ( = ?auto_246931 ?auto_246932 ) ) ( not ( = ?auto_246934 ?auto_246931 ) ) ( not ( = ?auto_246933 ?auto_246931 ) ) ( not ( = ?auto_246935 ?auto_246931 ) ) ( not ( = ?auto_246936 ?auto_246931 ) ) ( ON ?auto_246931 ?auto_246930 ) ( not ( = ?auto_246930 ?auto_246931 ) ) ( not ( = ?auto_246930 ?auto_246932 ) ) ( not ( = ?auto_246930 ?auto_246934 ) ) ( not ( = ?auto_246930 ?auto_246933 ) ) ( not ( = ?auto_246930 ?auto_246935 ) ) ( not ( = ?auto_246930 ?auto_246936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246932 ?auto_246934 ?auto_246933 )
      ( MAKE-4CRATE-VERIFY ?auto_246930 ?auto_246931 ?auto_246932 ?auto_246934 ?auto_246933 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_246942 - SURFACE
      ?auto_246943 - SURFACE
      ?auto_246944 - SURFACE
      ?auto_246946 - SURFACE
      ?auto_246945 - SURFACE
      ?auto_246947 - SURFACE
    )
    :vars
    (
      ?auto_246954 - HOIST
      ?auto_246953 - PLACE
      ?auto_246951 - PLACE
      ?auto_246950 - HOIST
      ?auto_246948 - SURFACE
      ?auto_246949 - SURFACE
      ?auto_246952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246954 ?auto_246953 ) ( IS-CRATE ?auto_246947 ) ( not ( = ?auto_246945 ?auto_246947 ) ) ( not ( = ?auto_246946 ?auto_246945 ) ) ( not ( = ?auto_246946 ?auto_246947 ) ) ( not ( = ?auto_246951 ?auto_246953 ) ) ( HOIST-AT ?auto_246950 ?auto_246951 ) ( not ( = ?auto_246954 ?auto_246950 ) ) ( SURFACE-AT ?auto_246947 ?auto_246951 ) ( ON ?auto_246947 ?auto_246948 ) ( CLEAR ?auto_246947 ) ( not ( = ?auto_246945 ?auto_246948 ) ) ( not ( = ?auto_246947 ?auto_246948 ) ) ( not ( = ?auto_246946 ?auto_246948 ) ) ( IS-CRATE ?auto_246945 ) ( AVAILABLE ?auto_246950 ) ( SURFACE-AT ?auto_246945 ?auto_246951 ) ( ON ?auto_246945 ?auto_246949 ) ( CLEAR ?auto_246945 ) ( not ( = ?auto_246945 ?auto_246949 ) ) ( not ( = ?auto_246947 ?auto_246949 ) ) ( not ( = ?auto_246946 ?auto_246949 ) ) ( not ( = ?auto_246948 ?auto_246949 ) ) ( TRUCK-AT ?auto_246952 ?auto_246953 ) ( SURFACE-AT ?auto_246944 ?auto_246953 ) ( CLEAR ?auto_246944 ) ( LIFTING ?auto_246954 ?auto_246946 ) ( IS-CRATE ?auto_246946 ) ( not ( = ?auto_246944 ?auto_246946 ) ) ( not ( = ?auto_246945 ?auto_246944 ) ) ( not ( = ?auto_246947 ?auto_246944 ) ) ( not ( = ?auto_246948 ?auto_246944 ) ) ( not ( = ?auto_246949 ?auto_246944 ) ) ( ON ?auto_246943 ?auto_246942 ) ( ON ?auto_246944 ?auto_246943 ) ( not ( = ?auto_246942 ?auto_246943 ) ) ( not ( = ?auto_246942 ?auto_246944 ) ) ( not ( = ?auto_246942 ?auto_246946 ) ) ( not ( = ?auto_246942 ?auto_246945 ) ) ( not ( = ?auto_246942 ?auto_246947 ) ) ( not ( = ?auto_246942 ?auto_246948 ) ) ( not ( = ?auto_246942 ?auto_246949 ) ) ( not ( = ?auto_246943 ?auto_246944 ) ) ( not ( = ?auto_246943 ?auto_246946 ) ) ( not ( = ?auto_246943 ?auto_246945 ) ) ( not ( = ?auto_246943 ?auto_246947 ) ) ( not ( = ?auto_246943 ?auto_246948 ) ) ( not ( = ?auto_246943 ?auto_246949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_246946 ?auto_246945 ?auto_246947 )
      ( MAKE-5CRATE-VERIFY ?auto_246942 ?auto_246943 ?auto_246944 ?auto_246946 ?auto_246945 ?auto_246947 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_247863 - SURFACE
      ?auto_247864 - SURFACE
      ?auto_247865 - SURFACE
      ?auto_247867 - SURFACE
      ?auto_247866 - SURFACE
      ?auto_247868 - SURFACE
      ?auto_247869 - SURFACE
    )
    :vars
    (
      ?auto_247871 - HOIST
      ?auto_247870 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_247871 ?auto_247870 ) ( SURFACE-AT ?auto_247868 ?auto_247870 ) ( CLEAR ?auto_247868 ) ( LIFTING ?auto_247871 ?auto_247869 ) ( IS-CRATE ?auto_247869 ) ( not ( = ?auto_247868 ?auto_247869 ) ) ( ON ?auto_247864 ?auto_247863 ) ( ON ?auto_247865 ?auto_247864 ) ( ON ?auto_247867 ?auto_247865 ) ( ON ?auto_247866 ?auto_247867 ) ( ON ?auto_247868 ?auto_247866 ) ( not ( = ?auto_247863 ?auto_247864 ) ) ( not ( = ?auto_247863 ?auto_247865 ) ) ( not ( = ?auto_247863 ?auto_247867 ) ) ( not ( = ?auto_247863 ?auto_247866 ) ) ( not ( = ?auto_247863 ?auto_247868 ) ) ( not ( = ?auto_247863 ?auto_247869 ) ) ( not ( = ?auto_247864 ?auto_247865 ) ) ( not ( = ?auto_247864 ?auto_247867 ) ) ( not ( = ?auto_247864 ?auto_247866 ) ) ( not ( = ?auto_247864 ?auto_247868 ) ) ( not ( = ?auto_247864 ?auto_247869 ) ) ( not ( = ?auto_247865 ?auto_247867 ) ) ( not ( = ?auto_247865 ?auto_247866 ) ) ( not ( = ?auto_247865 ?auto_247868 ) ) ( not ( = ?auto_247865 ?auto_247869 ) ) ( not ( = ?auto_247867 ?auto_247866 ) ) ( not ( = ?auto_247867 ?auto_247868 ) ) ( not ( = ?auto_247867 ?auto_247869 ) ) ( not ( = ?auto_247866 ?auto_247868 ) ) ( not ( = ?auto_247866 ?auto_247869 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_247868 ?auto_247869 )
      ( MAKE-6CRATE-VERIFY ?auto_247863 ?auto_247864 ?auto_247865 ?auto_247867 ?auto_247866 ?auto_247868 ?auto_247869 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_247907 - SURFACE
      ?auto_247908 - SURFACE
      ?auto_247909 - SURFACE
      ?auto_247911 - SURFACE
      ?auto_247910 - SURFACE
      ?auto_247912 - SURFACE
      ?auto_247913 - SURFACE
    )
    :vars
    (
      ?auto_247914 - HOIST
      ?auto_247916 - PLACE
      ?auto_247915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_247914 ?auto_247916 ) ( SURFACE-AT ?auto_247912 ?auto_247916 ) ( CLEAR ?auto_247912 ) ( IS-CRATE ?auto_247913 ) ( not ( = ?auto_247912 ?auto_247913 ) ) ( TRUCK-AT ?auto_247915 ?auto_247916 ) ( AVAILABLE ?auto_247914 ) ( IN ?auto_247913 ?auto_247915 ) ( ON ?auto_247912 ?auto_247910 ) ( not ( = ?auto_247910 ?auto_247912 ) ) ( not ( = ?auto_247910 ?auto_247913 ) ) ( ON ?auto_247908 ?auto_247907 ) ( ON ?auto_247909 ?auto_247908 ) ( ON ?auto_247911 ?auto_247909 ) ( ON ?auto_247910 ?auto_247911 ) ( not ( = ?auto_247907 ?auto_247908 ) ) ( not ( = ?auto_247907 ?auto_247909 ) ) ( not ( = ?auto_247907 ?auto_247911 ) ) ( not ( = ?auto_247907 ?auto_247910 ) ) ( not ( = ?auto_247907 ?auto_247912 ) ) ( not ( = ?auto_247907 ?auto_247913 ) ) ( not ( = ?auto_247908 ?auto_247909 ) ) ( not ( = ?auto_247908 ?auto_247911 ) ) ( not ( = ?auto_247908 ?auto_247910 ) ) ( not ( = ?auto_247908 ?auto_247912 ) ) ( not ( = ?auto_247908 ?auto_247913 ) ) ( not ( = ?auto_247909 ?auto_247911 ) ) ( not ( = ?auto_247909 ?auto_247910 ) ) ( not ( = ?auto_247909 ?auto_247912 ) ) ( not ( = ?auto_247909 ?auto_247913 ) ) ( not ( = ?auto_247911 ?auto_247910 ) ) ( not ( = ?auto_247911 ?auto_247912 ) ) ( not ( = ?auto_247911 ?auto_247913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_247910 ?auto_247912 ?auto_247913 )
      ( MAKE-6CRATE-VERIFY ?auto_247907 ?auto_247908 ?auto_247909 ?auto_247911 ?auto_247910 ?auto_247912 ?auto_247913 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_247958 - SURFACE
      ?auto_247959 - SURFACE
      ?auto_247960 - SURFACE
      ?auto_247962 - SURFACE
      ?auto_247961 - SURFACE
      ?auto_247963 - SURFACE
      ?auto_247964 - SURFACE
    )
    :vars
    (
      ?auto_247966 - HOIST
      ?auto_247968 - PLACE
      ?auto_247967 - TRUCK
      ?auto_247965 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_247966 ?auto_247968 ) ( SURFACE-AT ?auto_247963 ?auto_247968 ) ( CLEAR ?auto_247963 ) ( IS-CRATE ?auto_247964 ) ( not ( = ?auto_247963 ?auto_247964 ) ) ( AVAILABLE ?auto_247966 ) ( IN ?auto_247964 ?auto_247967 ) ( ON ?auto_247963 ?auto_247961 ) ( not ( = ?auto_247961 ?auto_247963 ) ) ( not ( = ?auto_247961 ?auto_247964 ) ) ( TRUCK-AT ?auto_247967 ?auto_247965 ) ( not ( = ?auto_247965 ?auto_247968 ) ) ( ON ?auto_247959 ?auto_247958 ) ( ON ?auto_247960 ?auto_247959 ) ( ON ?auto_247962 ?auto_247960 ) ( ON ?auto_247961 ?auto_247962 ) ( not ( = ?auto_247958 ?auto_247959 ) ) ( not ( = ?auto_247958 ?auto_247960 ) ) ( not ( = ?auto_247958 ?auto_247962 ) ) ( not ( = ?auto_247958 ?auto_247961 ) ) ( not ( = ?auto_247958 ?auto_247963 ) ) ( not ( = ?auto_247958 ?auto_247964 ) ) ( not ( = ?auto_247959 ?auto_247960 ) ) ( not ( = ?auto_247959 ?auto_247962 ) ) ( not ( = ?auto_247959 ?auto_247961 ) ) ( not ( = ?auto_247959 ?auto_247963 ) ) ( not ( = ?auto_247959 ?auto_247964 ) ) ( not ( = ?auto_247960 ?auto_247962 ) ) ( not ( = ?auto_247960 ?auto_247961 ) ) ( not ( = ?auto_247960 ?auto_247963 ) ) ( not ( = ?auto_247960 ?auto_247964 ) ) ( not ( = ?auto_247962 ?auto_247961 ) ) ( not ( = ?auto_247962 ?auto_247963 ) ) ( not ( = ?auto_247962 ?auto_247964 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_247961 ?auto_247963 ?auto_247964 )
      ( MAKE-6CRATE-VERIFY ?auto_247958 ?auto_247959 ?auto_247960 ?auto_247962 ?auto_247961 ?auto_247963 ?auto_247964 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248015 - SURFACE
      ?auto_248016 - SURFACE
      ?auto_248017 - SURFACE
      ?auto_248019 - SURFACE
      ?auto_248018 - SURFACE
      ?auto_248020 - SURFACE
      ?auto_248021 - SURFACE
    )
    :vars
    (
      ?auto_248025 - HOIST
      ?auto_248026 - PLACE
      ?auto_248024 - TRUCK
      ?auto_248022 - PLACE
      ?auto_248023 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_248025 ?auto_248026 ) ( SURFACE-AT ?auto_248020 ?auto_248026 ) ( CLEAR ?auto_248020 ) ( IS-CRATE ?auto_248021 ) ( not ( = ?auto_248020 ?auto_248021 ) ) ( AVAILABLE ?auto_248025 ) ( ON ?auto_248020 ?auto_248018 ) ( not ( = ?auto_248018 ?auto_248020 ) ) ( not ( = ?auto_248018 ?auto_248021 ) ) ( TRUCK-AT ?auto_248024 ?auto_248022 ) ( not ( = ?auto_248022 ?auto_248026 ) ) ( HOIST-AT ?auto_248023 ?auto_248022 ) ( LIFTING ?auto_248023 ?auto_248021 ) ( not ( = ?auto_248025 ?auto_248023 ) ) ( ON ?auto_248016 ?auto_248015 ) ( ON ?auto_248017 ?auto_248016 ) ( ON ?auto_248019 ?auto_248017 ) ( ON ?auto_248018 ?auto_248019 ) ( not ( = ?auto_248015 ?auto_248016 ) ) ( not ( = ?auto_248015 ?auto_248017 ) ) ( not ( = ?auto_248015 ?auto_248019 ) ) ( not ( = ?auto_248015 ?auto_248018 ) ) ( not ( = ?auto_248015 ?auto_248020 ) ) ( not ( = ?auto_248015 ?auto_248021 ) ) ( not ( = ?auto_248016 ?auto_248017 ) ) ( not ( = ?auto_248016 ?auto_248019 ) ) ( not ( = ?auto_248016 ?auto_248018 ) ) ( not ( = ?auto_248016 ?auto_248020 ) ) ( not ( = ?auto_248016 ?auto_248021 ) ) ( not ( = ?auto_248017 ?auto_248019 ) ) ( not ( = ?auto_248017 ?auto_248018 ) ) ( not ( = ?auto_248017 ?auto_248020 ) ) ( not ( = ?auto_248017 ?auto_248021 ) ) ( not ( = ?auto_248019 ?auto_248018 ) ) ( not ( = ?auto_248019 ?auto_248020 ) ) ( not ( = ?auto_248019 ?auto_248021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248018 ?auto_248020 ?auto_248021 )
      ( MAKE-6CRATE-VERIFY ?auto_248015 ?auto_248016 ?auto_248017 ?auto_248019 ?auto_248018 ?auto_248020 ?auto_248021 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248078 - SURFACE
      ?auto_248079 - SURFACE
      ?auto_248080 - SURFACE
      ?auto_248082 - SURFACE
      ?auto_248081 - SURFACE
      ?auto_248083 - SURFACE
      ?auto_248084 - SURFACE
    )
    :vars
    (
      ?auto_248087 - HOIST
      ?auto_248085 - PLACE
      ?auto_248088 - TRUCK
      ?auto_248090 - PLACE
      ?auto_248089 - HOIST
      ?auto_248086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_248087 ?auto_248085 ) ( SURFACE-AT ?auto_248083 ?auto_248085 ) ( CLEAR ?auto_248083 ) ( IS-CRATE ?auto_248084 ) ( not ( = ?auto_248083 ?auto_248084 ) ) ( AVAILABLE ?auto_248087 ) ( ON ?auto_248083 ?auto_248081 ) ( not ( = ?auto_248081 ?auto_248083 ) ) ( not ( = ?auto_248081 ?auto_248084 ) ) ( TRUCK-AT ?auto_248088 ?auto_248090 ) ( not ( = ?auto_248090 ?auto_248085 ) ) ( HOIST-AT ?auto_248089 ?auto_248090 ) ( not ( = ?auto_248087 ?auto_248089 ) ) ( AVAILABLE ?auto_248089 ) ( SURFACE-AT ?auto_248084 ?auto_248090 ) ( ON ?auto_248084 ?auto_248086 ) ( CLEAR ?auto_248084 ) ( not ( = ?auto_248083 ?auto_248086 ) ) ( not ( = ?auto_248084 ?auto_248086 ) ) ( not ( = ?auto_248081 ?auto_248086 ) ) ( ON ?auto_248079 ?auto_248078 ) ( ON ?auto_248080 ?auto_248079 ) ( ON ?auto_248082 ?auto_248080 ) ( ON ?auto_248081 ?auto_248082 ) ( not ( = ?auto_248078 ?auto_248079 ) ) ( not ( = ?auto_248078 ?auto_248080 ) ) ( not ( = ?auto_248078 ?auto_248082 ) ) ( not ( = ?auto_248078 ?auto_248081 ) ) ( not ( = ?auto_248078 ?auto_248083 ) ) ( not ( = ?auto_248078 ?auto_248084 ) ) ( not ( = ?auto_248078 ?auto_248086 ) ) ( not ( = ?auto_248079 ?auto_248080 ) ) ( not ( = ?auto_248079 ?auto_248082 ) ) ( not ( = ?auto_248079 ?auto_248081 ) ) ( not ( = ?auto_248079 ?auto_248083 ) ) ( not ( = ?auto_248079 ?auto_248084 ) ) ( not ( = ?auto_248079 ?auto_248086 ) ) ( not ( = ?auto_248080 ?auto_248082 ) ) ( not ( = ?auto_248080 ?auto_248081 ) ) ( not ( = ?auto_248080 ?auto_248083 ) ) ( not ( = ?auto_248080 ?auto_248084 ) ) ( not ( = ?auto_248080 ?auto_248086 ) ) ( not ( = ?auto_248082 ?auto_248081 ) ) ( not ( = ?auto_248082 ?auto_248083 ) ) ( not ( = ?auto_248082 ?auto_248084 ) ) ( not ( = ?auto_248082 ?auto_248086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248081 ?auto_248083 ?auto_248084 )
      ( MAKE-6CRATE-VERIFY ?auto_248078 ?auto_248079 ?auto_248080 ?auto_248082 ?auto_248081 ?auto_248083 ?auto_248084 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248142 - SURFACE
      ?auto_248143 - SURFACE
      ?auto_248144 - SURFACE
      ?auto_248146 - SURFACE
      ?auto_248145 - SURFACE
      ?auto_248147 - SURFACE
      ?auto_248148 - SURFACE
    )
    :vars
    (
      ?auto_248151 - HOIST
      ?auto_248152 - PLACE
      ?auto_248154 - PLACE
      ?auto_248153 - HOIST
      ?auto_248149 - SURFACE
      ?auto_248150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_248151 ?auto_248152 ) ( SURFACE-AT ?auto_248147 ?auto_248152 ) ( CLEAR ?auto_248147 ) ( IS-CRATE ?auto_248148 ) ( not ( = ?auto_248147 ?auto_248148 ) ) ( AVAILABLE ?auto_248151 ) ( ON ?auto_248147 ?auto_248145 ) ( not ( = ?auto_248145 ?auto_248147 ) ) ( not ( = ?auto_248145 ?auto_248148 ) ) ( not ( = ?auto_248154 ?auto_248152 ) ) ( HOIST-AT ?auto_248153 ?auto_248154 ) ( not ( = ?auto_248151 ?auto_248153 ) ) ( AVAILABLE ?auto_248153 ) ( SURFACE-AT ?auto_248148 ?auto_248154 ) ( ON ?auto_248148 ?auto_248149 ) ( CLEAR ?auto_248148 ) ( not ( = ?auto_248147 ?auto_248149 ) ) ( not ( = ?auto_248148 ?auto_248149 ) ) ( not ( = ?auto_248145 ?auto_248149 ) ) ( TRUCK-AT ?auto_248150 ?auto_248152 ) ( ON ?auto_248143 ?auto_248142 ) ( ON ?auto_248144 ?auto_248143 ) ( ON ?auto_248146 ?auto_248144 ) ( ON ?auto_248145 ?auto_248146 ) ( not ( = ?auto_248142 ?auto_248143 ) ) ( not ( = ?auto_248142 ?auto_248144 ) ) ( not ( = ?auto_248142 ?auto_248146 ) ) ( not ( = ?auto_248142 ?auto_248145 ) ) ( not ( = ?auto_248142 ?auto_248147 ) ) ( not ( = ?auto_248142 ?auto_248148 ) ) ( not ( = ?auto_248142 ?auto_248149 ) ) ( not ( = ?auto_248143 ?auto_248144 ) ) ( not ( = ?auto_248143 ?auto_248146 ) ) ( not ( = ?auto_248143 ?auto_248145 ) ) ( not ( = ?auto_248143 ?auto_248147 ) ) ( not ( = ?auto_248143 ?auto_248148 ) ) ( not ( = ?auto_248143 ?auto_248149 ) ) ( not ( = ?auto_248144 ?auto_248146 ) ) ( not ( = ?auto_248144 ?auto_248145 ) ) ( not ( = ?auto_248144 ?auto_248147 ) ) ( not ( = ?auto_248144 ?auto_248148 ) ) ( not ( = ?auto_248144 ?auto_248149 ) ) ( not ( = ?auto_248146 ?auto_248145 ) ) ( not ( = ?auto_248146 ?auto_248147 ) ) ( not ( = ?auto_248146 ?auto_248148 ) ) ( not ( = ?auto_248146 ?auto_248149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248145 ?auto_248147 ?auto_248148 )
      ( MAKE-6CRATE-VERIFY ?auto_248142 ?auto_248143 ?auto_248144 ?auto_248146 ?auto_248145 ?auto_248147 ?auto_248148 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248206 - SURFACE
      ?auto_248207 - SURFACE
      ?auto_248208 - SURFACE
      ?auto_248210 - SURFACE
      ?auto_248209 - SURFACE
      ?auto_248211 - SURFACE
      ?auto_248212 - SURFACE
    )
    :vars
    (
      ?auto_248213 - HOIST
      ?auto_248214 - PLACE
      ?auto_248218 - PLACE
      ?auto_248217 - HOIST
      ?auto_248216 - SURFACE
      ?auto_248215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_248213 ?auto_248214 ) ( IS-CRATE ?auto_248212 ) ( not ( = ?auto_248211 ?auto_248212 ) ) ( not ( = ?auto_248209 ?auto_248211 ) ) ( not ( = ?auto_248209 ?auto_248212 ) ) ( not ( = ?auto_248218 ?auto_248214 ) ) ( HOIST-AT ?auto_248217 ?auto_248218 ) ( not ( = ?auto_248213 ?auto_248217 ) ) ( AVAILABLE ?auto_248217 ) ( SURFACE-AT ?auto_248212 ?auto_248218 ) ( ON ?auto_248212 ?auto_248216 ) ( CLEAR ?auto_248212 ) ( not ( = ?auto_248211 ?auto_248216 ) ) ( not ( = ?auto_248212 ?auto_248216 ) ) ( not ( = ?auto_248209 ?auto_248216 ) ) ( TRUCK-AT ?auto_248215 ?auto_248214 ) ( SURFACE-AT ?auto_248209 ?auto_248214 ) ( CLEAR ?auto_248209 ) ( LIFTING ?auto_248213 ?auto_248211 ) ( IS-CRATE ?auto_248211 ) ( ON ?auto_248207 ?auto_248206 ) ( ON ?auto_248208 ?auto_248207 ) ( ON ?auto_248210 ?auto_248208 ) ( ON ?auto_248209 ?auto_248210 ) ( not ( = ?auto_248206 ?auto_248207 ) ) ( not ( = ?auto_248206 ?auto_248208 ) ) ( not ( = ?auto_248206 ?auto_248210 ) ) ( not ( = ?auto_248206 ?auto_248209 ) ) ( not ( = ?auto_248206 ?auto_248211 ) ) ( not ( = ?auto_248206 ?auto_248212 ) ) ( not ( = ?auto_248206 ?auto_248216 ) ) ( not ( = ?auto_248207 ?auto_248208 ) ) ( not ( = ?auto_248207 ?auto_248210 ) ) ( not ( = ?auto_248207 ?auto_248209 ) ) ( not ( = ?auto_248207 ?auto_248211 ) ) ( not ( = ?auto_248207 ?auto_248212 ) ) ( not ( = ?auto_248207 ?auto_248216 ) ) ( not ( = ?auto_248208 ?auto_248210 ) ) ( not ( = ?auto_248208 ?auto_248209 ) ) ( not ( = ?auto_248208 ?auto_248211 ) ) ( not ( = ?auto_248208 ?auto_248212 ) ) ( not ( = ?auto_248208 ?auto_248216 ) ) ( not ( = ?auto_248210 ?auto_248209 ) ) ( not ( = ?auto_248210 ?auto_248211 ) ) ( not ( = ?auto_248210 ?auto_248212 ) ) ( not ( = ?auto_248210 ?auto_248216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248209 ?auto_248211 ?auto_248212 )
      ( MAKE-6CRATE-VERIFY ?auto_248206 ?auto_248207 ?auto_248208 ?auto_248210 ?auto_248209 ?auto_248211 ?auto_248212 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_248270 - SURFACE
      ?auto_248271 - SURFACE
      ?auto_248272 - SURFACE
      ?auto_248274 - SURFACE
      ?auto_248273 - SURFACE
      ?auto_248275 - SURFACE
      ?auto_248276 - SURFACE
    )
    :vars
    (
      ?auto_248278 - HOIST
      ?auto_248280 - PLACE
      ?auto_248279 - PLACE
      ?auto_248282 - HOIST
      ?auto_248277 - SURFACE
      ?auto_248281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_248278 ?auto_248280 ) ( IS-CRATE ?auto_248276 ) ( not ( = ?auto_248275 ?auto_248276 ) ) ( not ( = ?auto_248273 ?auto_248275 ) ) ( not ( = ?auto_248273 ?auto_248276 ) ) ( not ( = ?auto_248279 ?auto_248280 ) ) ( HOIST-AT ?auto_248282 ?auto_248279 ) ( not ( = ?auto_248278 ?auto_248282 ) ) ( AVAILABLE ?auto_248282 ) ( SURFACE-AT ?auto_248276 ?auto_248279 ) ( ON ?auto_248276 ?auto_248277 ) ( CLEAR ?auto_248276 ) ( not ( = ?auto_248275 ?auto_248277 ) ) ( not ( = ?auto_248276 ?auto_248277 ) ) ( not ( = ?auto_248273 ?auto_248277 ) ) ( TRUCK-AT ?auto_248281 ?auto_248280 ) ( SURFACE-AT ?auto_248273 ?auto_248280 ) ( CLEAR ?auto_248273 ) ( IS-CRATE ?auto_248275 ) ( AVAILABLE ?auto_248278 ) ( IN ?auto_248275 ?auto_248281 ) ( ON ?auto_248271 ?auto_248270 ) ( ON ?auto_248272 ?auto_248271 ) ( ON ?auto_248274 ?auto_248272 ) ( ON ?auto_248273 ?auto_248274 ) ( not ( = ?auto_248270 ?auto_248271 ) ) ( not ( = ?auto_248270 ?auto_248272 ) ) ( not ( = ?auto_248270 ?auto_248274 ) ) ( not ( = ?auto_248270 ?auto_248273 ) ) ( not ( = ?auto_248270 ?auto_248275 ) ) ( not ( = ?auto_248270 ?auto_248276 ) ) ( not ( = ?auto_248270 ?auto_248277 ) ) ( not ( = ?auto_248271 ?auto_248272 ) ) ( not ( = ?auto_248271 ?auto_248274 ) ) ( not ( = ?auto_248271 ?auto_248273 ) ) ( not ( = ?auto_248271 ?auto_248275 ) ) ( not ( = ?auto_248271 ?auto_248276 ) ) ( not ( = ?auto_248271 ?auto_248277 ) ) ( not ( = ?auto_248272 ?auto_248274 ) ) ( not ( = ?auto_248272 ?auto_248273 ) ) ( not ( = ?auto_248272 ?auto_248275 ) ) ( not ( = ?auto_248272 ?auto_248276 ) ) ( not ( = ?auto_248272 ?auto_248277 ) ) ( not ( = ?auto_248274 ?auto_248273 ) ) ( not ( = ?auto_248274 ?auto_248275 ) ) ( not ( = ?auto_248274 ?auto_248276 ) ) ( not ( = ?auto_248274 ?auto_248277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_248273 ?auto_248275 ?auto_248276 )
      ( MAKE-6CRATE-VERIFY ?auto_248270 ?auto_248271 ?auto_248272 ?auto_248274 ?auto_248273 ?auto_248275 ?auto_248276 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_248740 - SURFACE
      ?auto_248741 - SURFACE
    )
    :vars
    (
      ?auto_248747 - HOIST
      ?auto_248746 - PLACE
      ?auto_248748 - SURFACE
      ?auto_248745 - PLACE
      ?auto_248743 - HOIST
      ?auto_248744 - SURFACE
      ?auto_248742 - TRUCK
      ?auto_248749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_248747 ?auto_248746 ) ( SURFACE-AT ?auto_248740 ?auto_248746 ) ( CLEAR ?auto_248740 ) ( IS-CRATE ?auto_248741 ) ( not ( = ?auto_248740 ?auto_248741 ) ) ( ON ?auto_248740 ?auto_248748 ) ( not ( = ?auto_248748 ?auto_248740 ) ) ( not ( = ?auto_248748 ?auto_248741 ) ) ( not ( = ?auto_248745 ?auto_248746 ) ) ( HOIST-AT ?auto_248743 ?auto_248745 ) ( not ( = ?auto_248747 ?auto_248743 ) ) ( AVAILABLE ?auto_248743 ) ( SURFACE-AT ?auto_248741 ?auto_248745 ) ( ON ?auto_248741 ?auto_248744 ) ( CLEAR ?auto_248741 ) ( not ( = ?auto_248740 ?auto_248744 ) ) ( not ( = ?auto_248741 ?auto_248744 ) ) ( not ( = ?auto_248748 ?auto_248744 ) ) ( TRUCK-AT ?auto_248742 ?auto_248746 ) ( LIFTING ?auto_248747 ?auto_248749 ) ( IS-CRATE ?auto_248749 ) ( not ( = ?auto_248740 ?auto_248749 ) ) ( not ( = ?auto_248741 ?auto_248749 ) ) ( not ( = ?auto_248748 ?auto_248749 ) ) ( not ( = ?auto_248744 ?auto_248749 ) ) )
    :subtasks
    ( ( !LOAD ?auto_248747 ?auto_248749 ?auto_248742 ?auto_248746 )
      ( MAKE-1CRATE ?auto_248740 ?auto_248741 )
      ( MAKE-1CRATE-VERIFY ?auto_248740 ?auto_248741 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_249939 - SURFACE
      ?auto_249940 - SURFACE
    )
    :vars
    (
      ?auto_249942 - HOIST
      ?auto_249944 - PLACE
      ?auto_249947 - SURFACE
      ?auto_249946 - TRUCK
      ?auto_249943 - PLACE
      ?auto_249945 - HOIST
      ?auto_249941 - SURFACE
      ?auto_249948 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_249942 ?auto_249944 ) ( SURFACE-AT ?auto_249939 ?auto_249944 ) ( CLEAR ?auto_249939 ) ( IS-CRATE ?auto_249940 ) ( not ( = ?auto_249939 ?auto_249940 ) ) ( AVAILABLE ?auto_249942 ) ( ON ?auto_249939 ?auto_249947 ) ( not ( = ?auto_249947 ?auto_249939 ) ) ( not ( = ?auto_249947 ?auto_249940 ) ) ( TRUCK-AT ?auto_249946 ?auto_249943 ) ( not ( = ?auto_249943 ?auto_249944 ) ) ( HOIST-AT ?auto_249945 ?auto_249943 ) ( not ( = ?auto_249942 ?auto_249945 ) ) ( SURFACE-AT ?auto_249940 ?auto_249943 ) ( ON ?auto_249940 ?auto_249941 ) ( CLEAR ?auto_249940 ) ( not ( = ?auto_249939 ?auto_249941 ) ) ( not ( = ?auto_249940 ?auto_249941 ) ) ( not ( = ?auto_249947 ?auto_249941 ) ) ( LIFTING ?auto_249945 ?auto_249948 ) ( IS-CRATE ?auto_249948 ) ( not ( = ?auto_249939 ?auto_249948 ) ) ( not ( = ?auto_249940 ?auto_249948 ) ) ( not ( = ?auto_249947 ?auto_249948 ) ) ( not ( = ?auto_249941 ?auto_249948 ) ) )
    :subtasks
    ( ( !LOAD ?auto_249945 ?auto_249948 ?auto_249946 ?auto_249943 )
      ( MAKE-1CRATE ?auto_249939 ?auto_249940 )
      ( MAKE-1CRATE-VERIFY ?auto_249939 ?auto_249940 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250215 - SURFACE
      ?auto_250216 - SURFACE
      ?auto_250217 - SURFACE
      ?auto_250219 - SURFACE
      ?auto_250218 - SURFACE
      ?auto_250220 - SURFACE
      ?auto_250221 - SURFACE
      ?auto_250222 - SURFACE
    )
    :vars
    (
      ?auto_250224 - HOIST
      ?auto_250223 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250224 ?auto_250223 ) ( SURFACE-AT ?auto_250221 ?auto_250223 ) ( CLEAR ?auto_250221 ) ( LIFTING ?auto_250224 ?auto_250222 ) ( IS-CRATE ?auto_250222 ) ( not ( = ?auto_250221 ?auto_250222 ) ) ( ON ?auto_250216 ?auto_250215 ) ( ON ?auto_250217 ?auto_250216 ) ( ON ?auto_250219 ?auto_250217 ) ( ON ?auto_250218 ?auto_250219 ) ( ON ?auto_250220 ?auto_250218 ) ( ON ?auto_250221 ?auto_250220 ) ( not ( = ?auto_250215 ?auto_250216 ) ) ( not ( = ?auto_250215 ?auto_250217 ) ) ( not ( = ?auto_250215 ?auto_250219 ) ) ( not ( = ?auto_250215 ?auto_250218 ) ) ( not ( = ?auto_250215 ?auto_250220 ) ) ( not ( = ?auto_250215 ?auto_250221 ) ) ( not ( = ?auto_250215 ?auto_250222 ) ) ( not ( = ?auto_250216 ?auto_250217 ) ) ( not ( = ?auto_250216 ?auto_250219 ) ) ( not ( = ?auto_250216 ?auto_250218 ) ) ( not ( = ?auto_250216 ?auto_250220 ) ) ( not ( = ?auto_250216 ?auto_250221 ) ) ( not ( = ?auto_250216 ?auto_250222 ) ) ( not ( = ?auto_250217 ?auto_250219 ) ) ( not ( = ?auto_250217 ?auto_250218 ) ) ( not ( = ?auto_250217 ?auto_250220 ) ) ( not ( = ?auto_250217 ?auto_250221 ) ) ( not ( = ?auto_250217 ?auto_250222 ) ) ( not ( = ?auto_250219 ?auto_250218 ) ) ( not ( = ?auto_250219 ?auto_250220 ) ) ( not ( = ?auto_250219 ?auto_250221 ) ) ( not ( = ?auto_250219 ?auto_250222 ) ) ( not ( = ?auto_250218 ?auto_250220 ) ) ( not ( = ?auto_250218 ?auto_250221 ) ) ( not ( = ?auto_250218 ?auto_250222 ) ) ( not ( = ?auto_250220 ?auto_250221 ) ) ( not ( = ?auto_250220 ?auto_250222 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_250221 ?auto_250222 )
      ( MAKE-7CRATE-VERIFY ?auto_250215 ?auto_250216 ?auto_250217 ?auto_250219 ?auto_250218 ?auto_250220 ?auto_250221 ?auto_250222 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250270 - SURFACE
      ?auto_250271 - SURFACE
      ?auto_250272 - SURFACE
      ?auto_250274 - SURFACE
      ?auto_250273 - SURFACE
      ?auto_250275 - SURFACE
      ?auto_250276 - SURFACE
      ?auto_250277 - SURFACE
    )
    :vars
    (
      ?auto_250279 - HOIST
      ?auto_250278 - PLACE
      ?auto_250280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250279 ?auto_250278 ) ( SURFACE-AT ?auto_250276 ?auto_250278 ) ( CLEAR ?auto_250276 ) ( IS-CRATE ?auto_250277 ) ( not ( = ?auto_250276 ?auto_250277 ) ) ( TRUCK-AT ?auto_250280 ?auto_250278 ) ( AVAILABLE ?auto_250279 ) ( IN ?auto_250277 ?auto_250280 ) ( ON ?auto_250276 ?auto_250275 ) ( not ( = ?auto_250275 ?auto_250276 ) ) ( not ( = ?auto_250275 ?auto_250277 ) ) ( ON ?auto_250271 ?auto_250270 ) ( ON ?auto_250272 ?auto_250271 ) ( ON ?auto_250274 ?auto_250272 ) ( ON ?auto_250273 ?auto_250274 ) ( ON ?auto_250275 ?auto_250273 ) ( not ( = ?auto_250270 ?auto_250271 ) ) ( not ( = ?auto_250270 ?auto_250272 ) ) ( not ( = ?auto_250270 ?auto_250274 ) ) ( not ( = ?auto_250270 ?auto_250273 ) ) ( not ( = ?auto_250270 ?auto_250275 ) ) ( not ( = ?auto_250270 ?auto_250276 ) ) ( not ( = ?auto_250270 ?auto_250277 ) ) ( not ( = ?auto_250271 ?auto_250272 ) ) ( not ( = ?auto_250271 ?auto_250274 ) ) ( not ( = ?auto_250271 ?auto_250273 ) ) ( not ( = ?auto_250271 ?auto_250275 ) ) ( not ( = ?auto_250271 ?auto_250276 ) ) ( not ( = ?auto_250271 ?auto_250277 ) ) ( not ( = ?auto_250272 ?auto_250274 ) ) ( not ( = ?auto_250272 ?auto_250273 ) ) ( not ( = ?auto_250272 ?auto_250275 ) ) ( not ( = ?auto_250272 ?auto_250276 ) ) ( not ( = ?auto_250272 ?auto_250277 ) ) ( not ( = ?auto_250274 ?auto_250273 ) ) ( not ( = ?auto_250274 ?auto_250275 ) ) ( not ( = ?auto_250274 ?auto_250276 ) ) ( not ( = ?auto_250274 ?auto_250277 ) ) ( not ( = ?auto_250273 ?auto_250275 ) ) ( not ( = ?auto_250273 ?auto_250276 ) ) ( not ( = ?auto_250273 ?auto_250277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250275 ?auto_250276 ?auto_250277 )
      ( MAKE-7CRATE-VERIFY ?auto_250270 ?auto_250271 ?auto_250272 ?auto_250274 ?auto_250273 ?auto_250275 ?auto_250276 ?auto_250277 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250333 - SURFACE
      ?auto_250334 - SURFACE
      ?auto_250335 - SURFACE
      ?auto_250337 - SURFACE
      ?auto_250336 - SURFACE
      ?auto_250338 - SURFACE
      ?auto_250339 - SURFACE
      ?auto_250340 - SURFACE
    )
    :vars
    (
      ?auto_250341 - HOIST
      ?auto_250344 - PLACE
      ?auto_250343 - TRUCK
      ?auto_250342 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250341 ?auto_250344 ) ( SURFACE-AT ?auto_250339 ?auto_250344 ) ( CLEAR ?auto_250339 ) ( IS-CRATE ?auto_250340 ) ( not ( = ?auto_250339 ?auto_250340 ) ) ( AVAILABLE ?auto_250341 ) ( IN ?auto_250340 ?auto_250343 ) ( ON ?auto_250339 ?auto_250338 ) ( not ( = ?auto_250338 ?auto_250339 ) ) ( not ( = ?auto_250338 ?auto_250340 ) ) ( TRUCK-AT ?auto_250343 ?auto_250342 ) ( not ( = ?auto_250342 ?auto_250344 ) ) ( ON ?auto_250334 ?auto_250333 ) ( ON ?auto_250335 ?auto_250334 ) ( ON ?auto_250337 ?auto_250335 ) ( ON ?auto_250336 ?auto_250337 ) ( ON ?auto_250338 ?auto_250336 ) ( not ( = ?auto_250333 ?auto_250334 ) ) ( not ( = ?auto_250333 ?auto_250335 ) ) ( not ( = ?auto_250333 ?auto_250337 ) ) ( not ( = ?auto_250333 ?auto_250336 ) ) ( not ( = ?auto_250333 ?auto_250338 ) ) ( not ( = ?auto_250333 ?auto_250339 ) ) ( not ( = ?auto_250333 ?auto_250340 ) ) ( not ( = ?auto_250334 ?auto_250335 ) ) ( not ( = ?auto_250334 ?auto_250337 ) ) ( not ( = ?auto_250334 ?auto_250336 ) ) ( not ( = ?auto_250334 ?auto_250338 ) ) ( not ( = ?auto_250334 ?auto_250339 ) ) ( not ( = ?auto_250334 ?auto_250340 ) ) ( not ( = ?auto_250335 ?auto_250337 ) ) ( not ( = ?auto_250335 ?auto_250336 ) ) ( not ( = ?auto_250335 ?auto_250338 ) ) ( not ( = ?auto_250335 ?auto_250339 ) ) ( not ( = ?auto_250335 ?auto_250340 ) ) ( not ( = ?auto_250337 ?auto_250336 ) ) ( not ( = ?auto_250337 ?auto_250338 ) ) ( not ( = ?auto_250337 ?auto_250339 ) ) ( not ( = ?auto_250337 ?auto_250340 ) ) ( not ( = ?auto_250336 ?auto_250338 ) ) ( not ( = ?auto_250336 ?auto_250339 ) ) ( not ( = ?auto_250336 ?auto_250340 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250338 ?auto_250339 ?auto_250340 )
      ( MAKE-7CRATE-VERIFY ?auto_250333 ?auto_250334 ?auto_250335 ?auto_250337 ?auto_250336 ?auto_250338 ?auto_250339 ?auto_250340 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250403 - SURFACE
      ?auto_250404 - SURFACE
      ?auto_250405 - SURFACE
      ?auto_250407 - SURFACE
      ?auto_250406 - SURFACE
      ?auto_250408 - SURFACE
      ?auto_250409 - SURFACE
      ?auto_250410 - SURFACE
    )
    :vars
    (
      ?auto_250412 - HOIST
      ?auto_250411 - PLACE
      ?auto_250414 - TRUCK
      ?auto_250415 - PLACE
      ?auto_250413 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_250412 ?auto_250411 ) ( SURFACE-AT ?auto_250409 ?auto_250411 ) ( CLEAR ?auto_250409 ) ( IS-CRATE ?auto_250410 ) ( not ( = ?auto_250409 ?auto_250410 ) ) ( AVAILABLE ?auto_250412 ) ( ON ?auto_250409 ?auto_250408 ) ( not ( = ?auto_250408 ?auto_250409 ) ) ( not ( = ?auto_250408 ?auto_250410 ) ) ( TRUCK-AT ?auto_250414 ?auto_250415 ) ( not ( = ?auto_250415 ?auto_250411 ) ) ( HOIST-AT ?auto_250413 ?auto_250415 ) ( LIFTING ?auto_250413 ?auto_250410 ) ( not ( = ?auto_250412 ?auto_250413 ) ) ( ON ?auto_250404 ?auto_250403 ) ( ON ?auto_250405 ?auto_250404 ) ( ON ?auto_250407 ?auto_250405 ) ( ON ?auto_250406 ?auto_250407 ) ( ON ?auto_250408 ?auto_250406 ) ( not ( = ?auto_250403 ?auto_250404 ) ) ( not ( = ?auto_250403 ?auto_250405 ) ) ( not ( = ?auto_250403 ?auto_250407 ) ) ( not ( = ?auto_250403 ?auto_250406 ) ) ( not ( = ?auto_250403 ?auto_250408 ) ) ( not ( = ?auto_250403 ?auto_250409 ) ) ( not ( = ?auto_250403 ?auto_250410 ) ) ( not ( = ?auto_250404 ?auto_250405 ) ) ( not ( = ?auto_250404 ?auto_250407 ) ) ( not ( = ?auto_250404 ?auto_250406 ) ) ( not ( = ?auto_250404 ?auto_250408 ) ) ( not ( = ?auto_250404 ?auto_250409 ) ) ( not ( = ?auto_250404 ?auto_250410 ) ) ( not ( = ?auto_250405 ?auto_250407 ) ) ( not ( = ?auto_250405 ?auto_250406 ) ) ( not ( = ?auto_250405 ?auto_250408 ) ) ( not ( = ?auto_250405 ?auto_250409 ) ) ( not ( = ?auto_250405 ?auto_250410 ) ) ( not ( = ?auto_250407 ?auto_250406 ) ) ( not ( = ?auto_250407 ?auto_250408 ) ) ( not ( = ?auto_250407 ?auto_250409 ) ) ( not ( = ?auto_250407 ?auto_250410 ) ) ( not ( = ?auto_250406 ?auto_250408 ) ) ( not ( = ?auto_250406 ?auto_250409 ) ) ( not ( = ?auto_250406 ?auto_250410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250408 ?auto_250409 ?auto_250410 )
      ( MAKE-7CRATE-VERIFY ?auto_250403 ?auto_250404 ?auto_250405 ?auto_250407 ?auto_250406 ?auto_250408 ?auto_250409 ?auto_250410 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250480 - SURFACE
      ?auto_250481 - SURFACE
      ?auto_250482 - SURFACE
      ?auto_250484 - SURFACE
      ?auto_250483 - SURFACE
      ?auto_250485 - SURFACE
      ?auto_250486 - SURFACE
      ?auto_250487 - SURFACE
    )
    :vars
    (
      ?auto_250491 - HOIST
      ?auto_250493 - PLACE
      ?auto_250492 - TRUCK
      ?auto_250489 - PLACE
      ?auto_250490 - HOIST
      ?auto_250488 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250491 ?auto_250493 ) ( SURFACE-AT ?auto_250486 ?auto_250493 ) ( CLEAR ?auto_250486 ) ( IS-CRATE ?auto_250487 ) ( not ( = ?auto_250486 ?auto_250487 ) ) ( AVAILABLE ?auto_250491 ) ( ON ?auto_250486 ?auto_250485 ) ( not ( = ?auto_250485 ?auto_250486 ) ) ( not ( = ?auto_250485 ?auto_250487 ) ) ( TRUCK-AT ?auto_250492 ?auto_250489 ) ( not ( = ?auto_250489 ?auto_250493 ) ) ( HOIST-AT ?auto_250490 ?auto_250489 ) ( not ( = ?auto_250491 ?auto_250490 ) ) ( AVAILABLE ?auto_250490 ) ( SURFACE-AT ?auto_250487 ?auto_250489 ) ( ON ?auto_250487 ?auto_250488 ) ( CLEAR ?auto_250487 ) ( not ( = ?auto_250486 ?auto_250488 ) ) ( not ( = ?auto_250487 ?auto_250488 ) ) ( not ( = ?auto_250485 ?auto_250488 ) ) ( ON ?auto_250481 ?auto_250480 ) ( ON ?auto_250482 ?auto_250481 ) ( ON ?auto_250484 ?auto_250482 ) ( ON ?auto_250483 ?auto_250484 ) ( ON ?auto_250485 ?auto_250483 ) ( not ( = ?auto_250480 ?auto_250481 ) ) ( not ( = ?auto_250480 ?auto_250482 ) ) ( not ( = ?auto_250480 ?auto_250484 ) ) ( not ( = ?auto_250480 ?auto_250483 ) ) ( not ( = ?auto_250480 ?auto_250485 ) ) ( not ( = ?auto_250480 ?auto_250486 ) ) ( not ( = ?auto_250480 ?auto_250487 ) ) ( not ( = ?auto_250480 ?auto_250488 ) ) ( not ( = ?auto_250481 ?auto_250482 ) ) ( not ( = ?auto_250481 ?auto_250484 ) ) ( not ( = ?auto_250481 ?auto_250483 ) ) ( not ( = ?auto_250481 ?auto_250485 ) ) ( not ( = ?auto_250481 ?auto_250486 ) ) ( not ( = ?auto_250481 ?auto_250487 ) ) ( not ( = ?auto_250481 ?auto_250488 ) ) ( not ( = ?auto_250482 ?auto_250484 ) ) ( not ( = ?auto_250482 ?auto_250483 ) ) ( not ( = ?auto_250482 ?auto_250485 ) ) ( not ( = ?auto_250482 ?auto_250486 ) ) ( not ( = ?auto_250482 ?auto_250487 ) ) ( not ( = ?auto_250482 ?auto_250488 ) ) ( not ( = ?auto_250484 ?auto_250483 ) ) ( not ( = ?auto_250484 ?auto_250485 ) ) ( not ( = ?auto_250484 ?auto_250486 ) ) ( not ( = ?auto_250484 ?auto_250487 ) ) ( not ( = ?auto_250484 ?auto_250488 ) ) ( not ( = ?auto_250483 ?auto_250485 ) ) ( not ( = ?auto_250483 ?auto_250486 ) ) ( not ( = ?auto_250483 ?auto_250487 ) ) ( not ( = ?auto_250483 ?auto_250488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250485 ?auto_250486 ?auto_250487 )
      ( MAKE-7CRATE-VERIFY ?auto_250480 ?auto_250481 ?auto_250482 ?auto_250484 ?auto_250483 ?auto_250485 ?auto_250486 ?auto_250487 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250558 - SURFACE
      ?auto_250559 - SURFACE
      ?auto_250560 - SURFACE
      ?auto_250562 - SURFACE
      ?auto_250561 - SURFACE
      ?auto_250563 - SURFACE
      ?auto_250564 - SURFACE
      ?auto_250565 - SURFACE
    )
    :vars
    (
      ?auto_250570 - HOIST
      ?auto_250571 - PLACE
      ?auto_250569 - PLACE
      ?auto_250566 - HOIST
      ?auto_250567 - SURFACE
      ?auto_250568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250570 ?auto_250571 ) ( SURFACE-AT ?auto_250564 ?auto_250571 ) ( CLEAR ?auto_250564 ) ( IS-CRATE ?auto_250565 ) ( not ( = ?auto_250564 ?auto_250565 ) ) ( AVAILABLE ?auto_250570 ) ( ON ?auto_250564 ?auto_250563 ) ( not ( = ?auto_250563 ?auto_250564 ) ) ( not ( = ?auto_250563 ?auto_250565 ) ) ( not ( = ?auto_250569 ?auto_250571 ) ) ( HOIST-AT ?auto_250566 ?auto_250569 ) ( not ( = ?auto_250570 ?auto_250566 ) ) ( AVAILABLE ?auto_250566 ) ( SURFACE-AT ?auto_250565 ?auto_250569 ) ( ON ?auto_250565 ?auto_250567 ) ( CLEAR ?auto_250565 ) ( not ( = ?auto_250564 ?auto_250567 ) ) ( not ( = ?auto_250565 ?auto_250567 ) ) ( not ( = ?auto_250563 ?auto_250567 ) ) ( TRUCK-AT ?auto_250568 ?auto_250571 ) ( ON ?auto_250559 ?auto_250558 ) ( ON ?auto_250560 ?auto_250559 ) ( ON ?auto_250562 ?auto_250560 ) ( ON ?auto_250561 ?auto_250562 ) ( ON ?auto_250563 ?auto_250561 ) ( not ( = ?auto_250558 ?auto_250559 ) ) ( not ( = ?auto_250558 ?auto_250560 ) ) ( not ( = ?auto_250558 ?auto_250562 ) ) ( not ( = ?auto_250558 ?auto_250561 ) ) ( not ( = ?auto_250558 ?auto_250563 ) ) ( not ( = ?auto_250558 ?auto_250564 ) ) ( not ( = ?auto_250558 ?auto_250565 ) ) ( not ( = ?auto_250558 ?auto_250567 ) ) ( not ( = ?auto_250559 ?auto_250560 ) ) ( not ( = ?auto_250559 ?auto_250562 ) ) ( not ( = ?auto_250559 ?auto_250561 ) ) ( not ( = ?auto_250559 ?auto_250563 ) ) ( not ( = ?auto_250559 ?auto_250564 ) ) ( not ( = ?auto_250559 ?auto_250565 ) ) ( not ( = ?auto_250559 ?auto_250567 ) ) ( not ( = ?auto_250560 ?auto_250562 ) ) ( not ( = ?auto_250560 ?auto_250561 ) ) ( not ( = ?auto_250560 ?auto_250563 ) ) ( not ( = ?auto_250560 ?auto_250564 ) ) ( not ( = ?auto_250560 ?auto_250565 ) ) ( not ( = ?auto_250560 ?auto_250567 ) ) ( not ( = ?auto_250562 ?auto_250561 ) ) ( not ( = ?auto_250562 ?auto_250563 ) ) ( not ( = ?auto_250562 ?auto_250564 ) ) ( not ( = ?auto_250562 ?auto_250565 ) ) ( not ( = ?auto_250562 ?auto_250567 ) ) ( not ( = ?auto_250561 ?auto_250563 ) ) ( not ( = ?auto_250561 ?auto_250564 ) ) ( not ( = ?auto_250561 ?auto_250565 ) ) ( not ( = ?auto_250561 ?auto_250567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250563 ?auto_250564 ?auto_250565 )
      ( MAKE-7CRATE-VERIFY ?auto_250558 ?auto_250559 ?auto_250560 ?auto_250562 ?auto_250561 ?auto_250563 ?auto_250564 ?auto_250565 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250636 - SURFACE
      ?auto_250637 - SURFACE
      ?auto_250638 - SURFACE
      ?auto_250640 - SURFACE
      ?auto_250639 - SURFACE
      ?auto_250641 - SURFACE
      ?auto_250642 - SURFACE
      ?auto_250643 - SURFACE
    )
    :vars
    (
      ?auto_250645 - HOIST
      ?auto_250648 - PLACE
      ?auto_250646 - PLACE
      ?auto_250644 - HOIST
      ?auto_250649 - SURFACE
      ?auto_250647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250645 ?auto_250648 ) ( IS-CRATE ?auto_250643 ) ( not ( = ?auto_250642 ?auto_250643 ) ) ( not ( = ?auto_250641 ?auto_250642 ) ) ( not ( = ?auto_250641 ?auto_250643 ) ) ( not ( = ?auto_250646 ?auto_250648 ) ) ( HOIST-AT ?auto_250644 ?auto_250646 ) ( not ( = ?auto_250645 ?auto_250644 ) ) ( AVAILABLE ?auto_250644 ) ( SURFACE-AT ?auto_250643 ?auto_250646 ) ( ON ?auto_250643 ?auto_250649 ) ( CLEAR ?auto_250643 ) ( not ( = ?auto_250642 ?auto_250649 ) ) ( not ( = ?auto_250643 ?auto_250649 ) ) ( not ( = ?auto_250641 ?auto_250649 ) ) ( TRUCK-AT ?auto_250647 ?auto_250648 ) ( SURFACE-AT ?auto_250641 ?auto_250648 ) ( CLEAR ?auto_250641 ) ( LIFTING ?auto_250645 ?auto_250642 ) ( IS-CRATE ?auto_250642 ) ( ON ?auto_250637 ?auto_250636 ) ( ON ?auto_250638 ?auto_250637 ) ( ON ?auto_250640 ?auto_250638 ) ( ON ?auto_250639 ?auto_250640 ) ( ON ?auto_250641 ?auto_250639 ) ( not ( = ?auto_250636 ?auto_250637 ) ) ( not ( = ?auto_250636 ?auto_250638 ) ) ( not ( = ?auto_250636 ?auto_250640 ) ) ( not ( = ?auto_250636 ?auto_250639 ) ) ( not ( = ?auto_250636 ?auto_250641 ) ) ( not ( = ?auto_250636 ?auto_250642 ) ) ( not ( = ?auto_250636 ?auto_250643 ) ) ( not ( = ?auto_250636 ?auto_250649 ) ) ( not ( = ?auto_250637 ?auto_250638 ) ) ( not ( = ?auto_250637 ?auto_250640 ) ) ( not ( = ?auto_250637 ?auto_250639 ) ) ( not ( = ?auto_250637 ?auto_250641 ) ) ( not ( = ?auto_250637 ?auto_250642 ) ) ( not ( = ?auto_250637 ?auto_250643 ) ) ( not ( = ?auto_250637 ?auto_250649 ) ) ( not ( = ?auto_250638 ?auto_250640 ) ) ( not ( = ?auto_250638 ?auto_250639 ) ) ( not ( = ?auto_250638 ?auto_250641 ) ) ( not ( = ?auto_250638 ?auto_250642 ) ) ( not ( = ?auto_250638 ?auto_250643 ) ) ( not ( = ?auto_250638 ?auto_250649 ) ) ( not ( = ?auto_250640 ?auto_250639 ) ) ( not ( = ?auto_250640 ?auto_250641 ) ) ( not ( = ?auto_250640 ?auto_250642 ) ) ( not ( = ?auto_250640 ?auto_250643 ) ) ( not ( = ?auto_250640 ?auto_250649 ) ) ( not ( = ?auto_250639 ?auto_250641 ) ) ( not ( = ?auto_250639 ?auto_250642 ) ) ( not ( = ?auto_250639 ?auto_250643 ) ) ( not ( = ?auto_250639 ?auto_250649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250641 ?auto_250642 ?auto_250643 )
      ( MAKE-7CRATE-VERIFY ?auto_250636 ?auto_250637 ?auto_250638 ?auto_250640 ?auto_250639 ?auto_250641 ?auto_250642 ?auto_250643 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250714 - SURFACE
      ?auto_250715 - SURFACE
      ?auto_250716 - SURFACE
      ?auto_250718 - SURFACE
      ?auto_250717 - SURFACE
      ?auto_250719 - SURFACE
      ?auto_250720 - SURFACE
      ?auto_250721 - SURFACE
    )
    :vars
    (
      ?auto_250727 - HOIST
      ?auto_250726 - PLACE
      ?auto_250724 - PLACE
      ?auto_250723 - HOIST
      ?auto_250725 - SURFACE
      ?auto_250722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250727 ?auto_250726 ) ( IS-CRATE ?auto_250721 ) ( not ( = ?auto_250720 ?auto_250721 ) ) ( not ( = ?auto_250719 ?auto_250720 ) ) ( not ( = ?auto_250719 ?auto_250721 ) ) ( not ( = ?auto_250724 ?auto_250726 ) ) ( HOIST-AT ?auto_250723 ?auto_250724 ) ( not ( = ?auto_250727 ?auto_250723 ) ) ( AVAILABLE ?auto_250723 ) ( SURFACE-AT ?auto_250721 ?auto_250724 ) ( ON ?auto_250721 ?auto_250725 ) ( CLEAR ?auto_250721 ) ( not ( = ?auto_250720 ?auto_250725 ) ) ( not ( = ?auto_250721 ?auto_250725 ) ) ( not ( = ?auto_250719 ?auto_250725 ) ) ( TRUCK-AT ?auto_250722 ?auto_250726 ) ( SURFACE-AT ?auto_250719 ?auto_250726 ) ( CLEAR ?auto_250719 ) ( IS-CRATE ?auto_250720 ) ( AVAILABLE ?auto_250727 ) ( IN ?auto_250720 ?auto_250722 ) ( ON ?auto_250715 ?auto_250714 ) ( ON ?auto_250716 ?auto_250715 ) ( ON ?auto_250718 ?auto_250716 ) ( ON ?auto_250717 ?auto_250718 ) ( ON ?auto_250719 ?auto_250717 ) ( not ( = ?auto_250714 ?auto_250715 ) ) ( not ( = ?auto_250714 ?auto_250716 ) ) ( not ( = ?auto_250714 ?auto_250718 ) ) ( not ( = ?auto_250714 ?auto_250717 ) ) ( not ( = ?auto_250714 ?auto_250719 ) ) ( not ( = ?auto_250714 ?auto_250720 ) ) ( not ( = ?auto_250714 ?auto_250721 ) ) ( not ( = ?auto_250714 ?auto_250725 ) ) ( not ( = ?auto_250715 ?auto_250716 ) ) ( not ( = ?auto_250715 ?auto_250718 ) ) ( not ( = ?auto_250715 ?auto_250717 ) ) ( not ( = ?auto_250715 ?auto_250719 ) ) ( not ( = ?auto_250715 ?auto_250720 ) ) ( not ( = ?auto_250715 ?auto_250721 ) ) ( not ( = ?auto_250715 ?auto_250725 ) ) ( not ( = ?auto_250716 ?auto_250718 ) ) ( not ( = ?auto_250716 ?auto_250717 ) ) ( not ( = ?auto_250716 ?auto_250719 ) ) ( not ( = ?auto_250716 ?auto_250720 ) ) ( not ( = ?auto_250716 ?auto_250721 ) ) ( not ( = ?auto_250716 ?auto_250725 ) ) ( not ( = ?auto_250718 ?auto_250717 ) ) ( not ( = ?auto_250718 ?auto_250719 ) ) ( not ( = ?auto_250718 ?auto_250720 ) ) ( not ( = ?auto_250718 ?auto_250721 ) ) ( not ( = ?auto_250718 ?auto_250725 ) ) ( not ( = ?auto_250717 ?auto_250719 ) ) ( not ( = ?auto_250717 ?auto_250720 ) ) ( not ( = ?auto_250717 ?auto_250721 ) ) ( not ( = ?auto_250717 ?auto_250725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250719 ?auto_250720 ?auto_250721 )
      ( MAKE-7CRATE-VERIFY ?auto_250714 ?auto_250715 ?auto_250716 ?auto_250718 ?auto_250717 ?auto_250719 ?auto_250720 ?auto_250721 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_250779 - SURFACE
      ?auto_250780 - SURFACE
      ?auto_250781 - SURFACE
      ?auto_250783 - SURFACE
      ?auto_250782 - SURFACE
      ?auto_250784 - SURFACE
      ?auto_250785 - SURFACE
    )
    :vars
    (
      ?auto_250790 - HOIST
      ?auto_250788 - PLACE
      ?auto_250787 - PLACE
      ?auto_250791 - HOIST
      ?auto_250789 - SURFACE
      ?auto_250786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250790 ?auto_250788 ) ( IS-CRATE ?auto_250785 ) ( not ( = ?auto_250784 ?auto_250785 ) ) ( not ( = ?auto_250782 ?auto_250784 ) ) ( not ( = ?auto_250782 ?auto_250785 ) ) ( not ( = ?auto_250787 ?auto_250788 ) ) ( HOIST-AT ?auto_250791 ?auto_250787 ) ( not ( = ?auto_250790 ?auto_250791 ) ) ( AVAILABLE ?auto_250791 ) ( SURFACE-AT ?auto_250785 ?auto_250787 ) ( ON ?auto_250785 ?auto_250789 ) ( CLEAR ?auto_250785 ) ( not ( = ?auto_250784 ?auto_250789 ) ) ( not ( = ?auto_250785 ?auto_250789 ) ) ( not ( = ?auto_250782 ?auto_250789 ) ) ( SURFACE-AT ?auto_250782 ?auto_250788 ) ( CLEAR ?auto_250782 ) ( IS-CRATE ?auto_250784 ) ( AVAILABLE ?auto_250790 ) ( IN ?auto_250784 ?auto_250786 ) ( TRUCK-AT ?auto_250786 ?auto_250787 ) ( ON ?auto_250780 ?auto_250779 ) ( ON ?auto_250781 ?auto_250780 ) ( ON ?auto_250783 ?auto_250781 ) ( ON ?auto_250782 ?auto_250783 ) ( not ( = ?auto_250779 ?auto_250780 ) ) ( not ( = ?auto_250779 ?auto_250781 ) ) ( not ( = ?auto_250779 ?auto_250783 ) ) ( not ( = ?auto_250779 ?auto_250782 ) ) ( not ( = ?auto_250779 ?auto_250784 ) ) ( not ( = ?auto_250779 ?auto_250785 ) ) ( not ( = ?auto_250779 ?auto_250789 ) ) ( not ( = ?auto_250780 ?auto_250781 ) ) ( not ( = ?auto_250780 ?auto_250783 ) ) ( not ( = ?auto_250780 ?auto_250782 ) ) ( not ( = ?auto_250780 ?auto_250784 ) ) ( not ( = ?auto_250780 ?auto_250785 ) ) ( not ( = ?auto_250780 ?auto_250789 ) ) ( not ( = ?auto_250781 ?auto_250783 ) ) ( not ( = ?auto_250781 ?auto_250782 ) ) ( not ( = ?auto_250781 ?auto_250784 ) ) ( not ( = ?auto_250781 ?auto_250785 ) ) ( not ( = ?auto_250781 ?auto_250789 ) ) ( not ( = ?auto_250783 ?auto_250782 ) ) ( not ( = ?auto_250783 ?auto_250784 ) ) ( not ( = ?auto_250783 ?auto_250785 ) ) ( not ( = ?auto_250783 ?auto_250789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250782 ?auto_250784 ?auto_250785 )
      ( MAKE-6CRATE-VERIFY ?auto_250779 ?auto_250780 ?auto_250781 ?auto_250783 ?auto_250782 ?auto_250784 ?auto_250785 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250792 - SURFACE
      ?auto_250793 - SURFACE
      ?auto_250794 - SURFACE
      ?auto_250796 - SURFACE
      ?auto_250795 - SURFACE
      ?auto_250797 - SURFACE
      ?auto_250798 - SURFACE
      ?auto_250799 - SURFACE
    )
    :vars
    (
      ?auto_250804 - HOIST
      ?auto_250802 - PLACE
      ?auto_250801 - PLACE
      ?auto_250805 - HOIST
      ?auto_250803 - SURFACE
      ?auto_250800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250804 ?auto_250802 ) ( IS-CRATE ?auto_250799 ) ( not ( = ?auto_250798 ?auto_250799 ) ) ( not ( = ?auto_250797 ?auto_250798 ) ) ( not ( = ?auto_250797 ?auto_250799 ) ) ( not ( = ?auto_250801 ?auto_250802 ) ) ( HOIST-AT ?auto_250805 ?auto_250801 ) ( not ( = ?auto_250804 ?auto_250805 ) ) ( AVAILABLE ?auto_250805 ) ( SURFACE-AT ?auto_250799 ?auto_250801 ) ( ON ?auto_250799 ?auto_250803 ) ( CLEAR ?auto_250799 ) ( not ( = ?auto_250798 ?auto_250803 ) ) ( not ( = ?auto_250799 ?auto_250803 ) ) ( not ( = ?auto_250797 ?auto_250803 ) ) ( SURFACE-AT ?auto_250797 ?auto_250802 ) ( CLEAR ?auto_250797 ) ( IS-CRATE ?auto_250798 ) ( AVAILABLE ?auto_250804 ) ( IN ?auto_250798 ?auto_250800 ) ( TRUCK-AT ?auto_250800 ?auto_250801 ) ( ON ?auto_250793 ?auto_250792 ) ( ON ?auto_250794 ?auto_250793 ) ( ON ?auto_250796 ?auto_250794 ) ( ON ?auto_250795 ?auto_250796 ) ( ON ?auto_250797 ?auto_250795 ) ( not ( = ?auto_250792 ?auto_250793 ) ) ( not ( = ?auto_250792 ?auto_250794 ) ) ( not ( = ?auto_250792 ?auto_250796 ) ) ( not ( = ?auto_250792 ?auto_250795 ) ) ( not ( = ?auto_250792 ?auto_250797 ) ) ( not ( = ?auto_250792 ?auto_250798 ) ) ( not ( = ?auto_250792 ?auto_250799 ) ) ( not ( = ?auto_250792 ?auto_250803 ) ) ( not ( = ?auto_250793 ?auto_250794 ) ) ( not ( = ?auto_250793 ?auto_250796 ) ) ( not ( = ?auto_250793 ?auto_250795 ) ) ( not ( = ?auto_250793 ?auto_250797 ) ) ( not ( = ?auto_250793 ?auto_250798 ) ) ( not ( = ?auto_250793 ?auto_250799 ) ) ( not ( = ?auto_250793 ?auto_250803 ) ) ( not ( = ?auto_250794 ?auto_250796 ) ) ( not ( = ?auto_250794 ?auto_250795 ) ) ( not ( = ?auto_250794 ?auto_250797 ) ) ( not ( = ?auto_250794 ?auto_250798 ) ) ( not ( = ?auto_250794 ?auto_250799 ) ) ( not ( = ?auto_250794 ?auto_250803 ) ) ( not ( = ?auto_250796 ?auto_250795 ) ) ( not ( = ?auto_250796 ?auto_250797 ) ) ( not ( = ?auto_250796 ?auto_250798 ) ) ( not ( = ?auto_250796 ?auto_250799 ) ) ( not ( = ?auto_250796 ?auto_250803 ) ) ( not ( = ?auto_250795 ?auto_250797 ) ) ( not ( = ?auto_250795 ?auto_250798 ) ) ( not ( = ?auto_250795 ?auto_250799 ) ) ( not ( = ?auto_250795 ?auto_250803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250797 ?auto_250798 ?auto_250799 )
      ( MAKE-7CRATE-VERIFY ?auto_250792 ?auto_250793 ?auto_250794 ?auto_250796 ?auto_250795 ?auto_250797 ?auto_250798 ?auto_250799 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_250857 - SURFACE
      ?auto_250858 - SURFACE
      ?auto_250859 - SURFACE
      ?auto_250861 - SURFACE
      ?auto_250860 - SURFACE
      ?auto_250862 - SURFACE
      ?auto_250863 - SURFACE
    )
    :vars
    (
      ?auto_250867 - HOIST
      ?auto_250869 - PLACE
      ?auto_250865 - PLACE
      ?auto_250866 - HOIST
      ?auto_250864 - SURFACE
      ?auto_250868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250867 ?auto_250869 ) ( IS-CRATE ?auto_250863 ) ( not ( = ?auto_250862 ?auto_250863 ) ) ( not ( = ?auto_250860 ?auto_250862 ) ) ( not ( = ?auto_250860 ?auto_250863 ) ) ( not ( = ?auto_250865 ?auto_250869 ) ) ( HOIST-AT ?auto_250866 ?auto_250865 ) ( not ( = ?auto_250867 ?auto_250866 ) ) ( SURFACE-AT ?auto_250863 ?auto_250865 ) ( ON ?auto_250863 ?auto_250864 ) ( CLEAR ?auto_250863 ) ( not ( = ?auto_250862 ?auto_250864 ) ) ( not ( = ?auto_250863 ?auto_250864 ) ) ( not ( = ?auto_250860 ?auto_250864 ) ) ( SURFACE-AT ?auto_250860 ?auto_250869 ) ( CLEAR ?auto_250860 ) ( IS-CRATE ?auto_250862 ) ( AVAILABLE ?auto_250867 ) ( TRUCK-AT ?auto_250868 ?auto_250865 ) ( LIFTING ?auto_250866 ?auto_250862 ) ( ON ?auto_250858 ?auto_250857 ) ( ON ?auto_250859 ?auto_250858 ) ( ON ?auto_250861 ?auto_250859 ) ( ON ?auto_250860 ?auto_250861 ) ( not ( = ?auto_250857 ?auto_250858 ) ) ( not ( = ?auto_250857 ?auto_250859 ) ) ( not ( = ?auto_250857 ?auto_250861 ) ) ( not ( = ?auto_250857 ?auto_250860 ) ) ( not ( = ?auto_250857 ?auto_250862 ) ) ( not ( = ?auto_250857 ?auto_250863 ) ) ( not ( = ?auto_250857 ?auto_250864 ) ) ( not ( = ?auto_250858 ?auto_250859 ) ) ( not ( = ?auto_250858 ?auto_250861 ) ) ( not ( = ?auto_250858 ?auto_250860 ) ) ( not ( = ?auto_250858 ?auto_250862 ) ) ( not ( = ?auto_250858 ?auto_250863 ) ) ( not ( = ?auto_250858 ?auto_250864 ) ) ( not ( = ?auto_250859 ?auto_250861 ) ) ( not ( = ?auto_250859 ?auto_250860 ) ) ( not ( = ?auto_250859 ?auto_250862 ) ) ( not ( = ?auto_250859 ?auto_250863 ) ) ( not ( = ?auto_250859 ?auto_250864 ) ) ( not ( = ?auto_250861 ?auto_250860 ) ) ( not ( = ?auto_250861 ?auto_250862 ) ) ( not ( = ?auto_250861 ?auto_250863 ) ) ( not ( = ?auto_250861 ?auto_250864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250860 ?auto_250862 ?auto_250863 )
      ( MAKE-6CRATE-VERIFY ?auto_250857 ?auto_250858 ?auto_250859 ?auto_250861 ?auto_250860 ?auto_250862 ?auto_250863 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250870 - SURFACE
      ?auto_250871 - SURFACE
      ?auto_250872 - SURFACE
      ?auto_250874 - SURFACE
      ?auto_250873 - SURFACE
      ?auto_250875 - SURFACE
      ?auto_250876 - SURFACE
      ?auto_250877 - SURFACE
    )
    :vars
    (
      ?auto_250881 - HOIST
      ?auto_250883 - PLACE
      ?auto_250879 - PLACE
      ?auto_250880 - HOIST
      ?auto_250878 - SURFACE
      ?auto_250882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250881 ?auto_250883 ) ( IS-CRATE ?auto_250877 ) ( not ( = ?auto_250876 ?auto_250877 ) ) ( not ( = ?auto_250875 ?auto_250876 ) ) ( not ( = ?auto_250875 ?auto_250877 ) ) ( not ( = ?auto_250879 ?auto_250883 ) ) ( HOIST-AT ?auto_250880 ?auto_250879 ) ( not ( = ?auto_250881 ?auto_250880 ) ) ( SURFACE-AT ?auto_250877 ?auto_250879 ) ( ON ?auto_250877 ?auto_250878 ) ( CLEAR ?auto_250877 ) ( not ( = ?auto_250876 ?auto_250878 ) ) ( not ( = ?auto_250877 ?auto_250878 ) ) ( not ( = ?auto_250875 ?auto_250878 ) ) ( SURFACE-AT ?auto_250875 ?auto_250883 ) ( CLEAR ?auto_250875 ) ( IS-CRATE ?auto_250876 ) ( AVAILABLE ?auto_250881 ) ( TRUCK-AT ?auto_250882 ?auto_250879 ) ( LIFTING ?auto_250880 ?auto_250876 ) ( ON ?auto_250871 ?auto_250870 ) ( ON ?auto_250872 ?auto_250871 ) ( ON ?auto_250874 ?auto_250872 ) ( ON ?auto_250873 ?auto_250874 ) ( ON ?auto_250875 ?auto_250873 ) ( not ( = ?auto_250870 ?auto_250871 ) ) ( not ( = ?auto_250870 ?auto_250872 ) ) ( not ( = ?auto_250870 ?auto_250874 ) ) ( not ( = ?auto_250870 ?auto_250873 ) ) ( not ( = ?auto_250870 ?auto_250875 ) ) ( not ( = ?auto_250870 ?auto_250876 ) ) ( not ( = ?auto_250870 ?auto_250877 ) ) ( not ( = ?auto_250870 ?auto_250878 ) ) ( not ( = ?auto_250871 ?auto_250872 ) ) ( not ( = ?auto_250871 ?auto_250874 ) ) ( not ( = ?auto_250871 ?auto_250873 ) ) ( not ( = ?auto_250871 ?auto_250875 ) ) ( not ( = ?auto_250871 ?auto_250876 ) ) ( not ( = ?auto_250871 ?auto_250877 ) ) ( not ( = ?auto_250871 ?auto_250878 ) ) ( not ( = ?auto_250872 ?auto_250874 ) ) ( not ( = ?auto_250872 ?auto_250873 ) ) ( not ( = ?auto_250872 ?auto_250875 ) ) ( not ( = ?auto_250872 ?auto_250876 ) ) ( not ( = ?auto_250872 ?auto_250877 ) ) ( not ( = ?auto_250872 ?auto_250878 ) ) ( not ( = ?auto_250874 ?auto_250873 ) ) ( not ( = ?auto_250874 ?auto_250875 ) ) ( not ( = ?auto_250874 ?auto_250876 ) ) ( not ( = ?auto_250874 ?auto_250877 ) ) ( not ( = ?auto_250874 ?auto_250878 ) ) ( not ( = ?auto_250873 ?auto_250875 ) ) ( not ( = ?auto_250873 ?auto_250876 ) ) ( not ( = ?auto_250873 ?auto_250877 ) ) ( not ( = ?auto_250873 ?auto_250878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250875 ?auto_250876 ?auto_250877 )
      ( MAKE-7CRATE-VERIFY ?auto_250870 ?auto_250871 ?auto_250872 ?auto_250874 ?auto_250873 ?auto_250875 ?auto_250876 ?auto_250877 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_250940 - SURFACE
      ?auto_250941 - SURFACE
      ?auto_250942 - SURFACE
      ?auto_250944 - SURFACE
      ?auto_250943 - SURFACE
      ?auto_250945 - SURFACE
      ?auto_250946 - SURFACE
    )
    :vars
    (
      ?auto_250953 - HOIST
      ?auto_250951 - PLACE
      ?auto_250950 - PLACE
      ?auto_250947 - HOIST
      ?auto_250949 - SURFACE
      ?auto_250952 - TRUCK
      ?auto_250948 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250953 ?auto_250951 ) ( IS-CRATE ?auto_250946 ) ( not ( = ?auto_250945 ?auto_250946 ) ) ( not ( = ?auto_250943 ?auto_250945 ) ) ( not ( = ?auto_250943 ?auto_250946 ) ) ( not ( = ?auto_250950 ?auto_250951 ) ) ( HOIST-AT ?auto_250947 ?auto_250950 ) ( not ( = ?auto_250953 ?auto_250947 ) ) ( SURFACE-AT ?auto_250946 ?auto_250950 ) ( ON ?auto_250946 ?auto_250949 ) ( CLEAR ?auto_250946 ) ( not ( = ?auto_250945 ?auto_250949 ) ) ( not ( = ?auto_250946 ?auto_250949 ) ) ( not ( = ?auto_250943 ?auto_250949 ) ) ( SURFACE-AT ?auto_250943 ?auto_250951 ) ( CLEAR ?auto_250943 ) ( IS-CRATE ?auto_250945 ) ( AVAILABLE ?auto_250953 ) ( TRUCK-AT ?auto_250952 ?auto_250950 ) ( AVAILABLE ?auto_250947 ) ( SURFACE-AT ?auto_250945 ?auto_250950 ) ( ON ?auto_250945 ?auto_250948 ) ( CLEAR ?auto_250945 ) ( not ( = ?auto_250945 ?auto_250948 ) ) ( not ( = ?auto_250946 ?auto_250948 ) ) ( not ( = ?auto_250943 ?auto_250948 ) ) ( not ( = ?auto_250949 ?auto_250948 ) ) ( ON ?auto_250941 ?auto_250940 ) ( ON ?auto_250942 ?auto_250941 ) ( ON ?auto_250944 ?auto_250942 ) ( ON ?auto_250943 ?auto_250944 ) ( not ( = ?auto_250940 ?auto_250941 ) ) ( not ( = ?auto_250940 ?auto_250942 ) ) ( not ( = ?auto_250940 ?auto_250944 ) ) ( not ( = ?auto_250940 ?auto_250943 ) ) ( not ( = ?auto_250940 ?auto_250945 ) ) ( not ( = ?auto_250940 ?auto_250946 ) ) ( not ( = ?auto_250940 ?auto_250949 ) ) ( not ( = ?auto_250940 ?auto_250948 ) ) ( not ( = ?auto_250941 ?auto_250942 ) ) ( not ( = ?auto_250941 ?auto_250944 ) ) ( not ( = ?auto_250941 ?auto_250943 ) ) ( not ( = ?auto_250941 ?auto_250945 ) ) ( not ( = ?auto_250941 ?auto_250946 ) ) ( not ( = ?auto_250941 ?auto_250949 ) ) ( not ( = ?auto_250941 ?auto_250948 ) ) ( not ( = ?auto_250942 ?auto_250944 ) ) ( not ( = ?auto_250942 ?auto_250943 ) ) ( not ( = ?auto_250942 ?auto_250945 ) ) ( not ( = ?auto_250942 ?auto_250946 ) ) ( not ( = ?auto_250942 ?auto_250949 ) ) ( not ( = ?auto_250942 ?auto_250948 ) ) ( not ( = ?auto_250944 ?auto_250943 ) ) ( not ( = ?auto_250944 ?auto_250945 ) ) ( not ( = ?auto_250944 ?auto_250946 ) ) ( not ( = ?auto_250944 ?auto_250949 ) ) ( not ( = ?auto_250944 ?auto_250948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250943 ?auto_250945 ?auto_250946 )
      ( MAKE-6CRATE-VERIFY ?auto_250940 ?auto_250941 ?auto_250942 ?auto_250944 ?auto_250943 ?auto_250945 ?auto_250946 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_250954 - SURFACE
      ?auto_250955 - SURFACE
      ?auto_250956 - SURFACE
      ?auto_250958 - SURFACE
      ?auto_250957 - SURFACE
      ?auto_250959 - SURFACE
      ?auto_250960 - SURFACE
      ?auto_250961 - SURFACE
    )
    :vars
    (
      ?auto_250968 - HOIST
      ?auto_250966 - PLACE
      ?auto_250965 - PLACE
      ?auto_250962 - HOIST
      ?auto_250964 - SURFACE
      ?auto_250967 - TRUCK
      ?auto_250963 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_250968 ?auto_250966 ) ( IS-CRATE ?auto_250961 ) ( not ( = ?auto_250960 ?auto_250961 ) ) ( not ( = ?auto_250959 ?auto_250960 ) ) ( not ( = ?auto_250959 ?auto_250961 ) ) ( not ( = ?auto_250965 ?auto_250966 ) ) ( HOIST-AT ?auto_250962 ?auto_250965 ) ( not ( = ?auto_250968 ?auto_250962 ) ) ( SURFACE-AT ?auto_250961 ?auto_250965 ) ( ON ?auto_250961 ?auto_250964 ) ( CLEAR ?auto_250961 ) ( not ( = ?auto_250960 ?auto_250964 ) ) ( not ( = ?auto_250961 ?auto_250964 ) ) ( not ( = ?auto_250959 ?auto_250964 ) ) ( SURFACE-AT ?auto_250959 ?auto_250966 ) ( CLEAR ?auto_250959 ) ( IS-CRATE ?auto_250960 ) ( AVAILABLE ?auto_250968 ) ( TRUCK-AT ?auto_250967 ?auto_250965 ) ( AVAILABLE ?auto_250962 ) ( SURFACE-AT ?auto_250960 ?auto_250965 ) ( ON ?auto_250960 ?auto_250963 ) ( CLEAR ?auto_250960 ) ( not ( = ?auto_250960 ?auto_250963 ) ) ( not ( = ?auto_250961 ?auto_250963 ) ) ( not ( = ?auto_250959 ?auto_250963 ) ) ( not ( = ?auto_250964 ?auto_250963 ) ) ( ON ?auto_250955 ?auto_250954 ) ( ON ?auto_250956 ?auto_250955 ) ( ON ?auto_250958 ?auto_250956 ) ( ON ?auto_250957 ?auto_250958 ) ( ON ?auto_250959 ?auto_250957 ) ( not ( = ?auto_250954 ?auto_250955 ) ) ( not ( = ?auto_250954 ?auto_250956 ) ) ( not ( = ?auto_250954 ?auto_250958 ) ) ( not ( = ?auto_250954 ?auto_250957 ) ) ( not ( = ?auto_250954 ?auto_250959 ) ) ( not ( = ?auto_250954 ?auto_250960 ) ) ( not ( = ?auto_250954 ?auto_250961 ) ) ( not ( = ?auto_250954 ?auto_250964 ) ) ( not ( = ?auto_250954 ?auto_250963 ) ) ( not ( = ?auto_250955 ?auto_250956 ) ) ( not ( = ?auto_250955 ?auto_250958 ) ) ( not ( = ?auto_250955 ?auto_250957 ) ) ( not ( = ?auto_250955 ?auto_250959 ) ) ( not ( = ?auto_250955 ?auto_250960 ) ) ( not ( = ?auto_250955 ?auto_250961 ) ) ( not ( = ?auto_250955 ?auto_250964 ) ) ( not ( = ?auto_250955 ?auto_250963 ) ) ( not ( = ?auto_250956 ?auto_250958 ) ) ( not ( = ?auto_250956 ?auto_250957 ) ) ( not ( = ?auto_250956 ?auto_250959 ) ) ( not ( = ?auto_250956 ?auto_250960 ) ) ( not ( = ?auto_250956 ?auto_250961 ) ) ( not ( = ?auto_250956 ?auto_250964 ) ) ( not ( = ?auto_250956 ?auto_250963 ) ) ( not ( = ?auto_250958 ?auto_250957 ) ) ( not ( = ?auto_250958 ?auto_250959 ) ) ( not ( = ?auto_250958 ?auto_250960 ) ) ( not ( = ?auto_250958 ?auto_250961 ) ) ( not ( = ?auto_250958 ?auto_250964 ) ) ( not ( = ?auto_250958 ?auto_250963 ) ) ( not ( = ?auto_250957 ?auto_250959 ) ) ( not ( = ?auto_250957 ?auto_250960 ) ) ( not ( = ?auto_250957 ?auto_250961 ) ) ( not ( = ?auto_250957 ?auto_250964 ) ) ( not ( = ?auto_250957 ?auto_250963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_250959 ?auto_250960 ?auto_250961 )
      ( MAKE-7CRATE-VERIFY ?auto_250954 ?auto_250955 ?auto_250956 ?auto_250958 ?auto_250957 ?auto_250959 ?auto_250960 ?auto_250961 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_251025 - SURFACE
      ?auto_251026 - SURFACE
      ?auto_251027 - SURFACE
      ?auto_251029 - SURFACE
      ?auto_251028 - SURFACE
      ?auto_251030 - SURFACE
      ?auto_251031 - SURFACE
    )
    :vars
    (
      ?auto_251032 - HOIST
      ?auto_251037 - PLACE
      ?auto_251035 - PLACE
      ?auto_251036 - HOIST
      ?auto_251033 - SURFACE
      ?auto_251038 - SURFACE
      ?auto_251034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251032 ?auto_251037 ) ( IS-CRATE ?auto_251031 ) ( not ( = ?auto_251030 ?auto_251031 ) ) ( not ( = ?auto_251028 ?auto_251030 ) ) ( not ( = ?auto_251028 ?auto_251031 ) ) ( not ( = ?auto_251035 ?auto_251037 ) ) ( HOIST-AT ?auto_251036 ?auto_251035 ) ( not ( = ?auto_251032 ?auto_251036 ) ) ( SURFACE-AT ?auto_251031 ?auto_251035 ) ( ON ?auto_251031 ?auto_251033 ) ( CLEAR ?auto_251031 ) ( not ( = ?auto_251030 ?auto_251033 ) ) ( not ( = ?auto_251031 ?auto_251033 ) ) ( not ( = ?auto_251028 ?auto_251033 ) ) ( SURFACE-AT ?auto_251028 ?auto_251037 ) ( CLEAR ?auto_251028 ) ( IS-CRATE ?auto_251030 ) ( AVAILABLE ?auto_251032 ) ( AVAILABLE ?auto_251036 ) ( SURFACE-AT ?auto_251030 ?auto_251035 ) ( ON ?auto_251030 ?auto_251038 ) ( CLEAR ?auto_251030 ) ( not ( = ?auto_251030 ?auto_251038 ) ) ( not ( = ?auto_251031 ?auto_251038 ) ) ( not ( = ?auto_251028 ?auto_251038 ) ) ( not ( = ?auto_251033 ?auto_251038 ) ) ( TRUCK-AT ?auto_251034 ?auto_251037 ) ( ON ?auto_251026 ?auto_251025 ) ( ON ?auto_251027 ?auto_251026 ) ( ON ?auto_251029 ?auto_251027 ) ( ON ?auto_251028 ?auto_251029 ) ( not ( = ?auto_251025 ?auto_251026 ) ) ( not ( = ?auto_251025 ?auto_251027 ) ) ( not ( = ?auto_251025 ?auto_251029 ) ) ( not ( = ?auto_251025 ?auto_251028 ) ) ( not ( = ?auto_251025 ?auto_251030 ) ) ( not ( = ?auto_251025 ?auto_251031 ) ) ( not ( = ?auto_251025 ?auto_251033 ) ) ( not ( = ?auto_251025 ?auto_251038 ) ) ( not ( = ?auto_251026 ?auto_251027 ) ) ( not ( = ?auto_251026 ?auto_251029 ) ) ( not ( = ?auto_251026 ?auto_251028 ) ) ( not ( = ?auto_251026 ?auto_251030 ) ) ( not ( = ?auto_251026 ?auto_251031 ) ) ( not ( = ?auto_251026 ?auto_251033 ) ) ( not ( = ?auto_251026 ?auto_251038 ) ) ( not ( = ?auto_251027 ?auto_251029 ) ) ( not ( = ?auto_251027 ?auto_251028 ) ) ( not ( = ?auto_251027 ?auto_251030 ) ) ( not ( = ?auto_251027 ?auto_251031 ) ) ( not ( = ?auto_251027 ?auto_251033 ) ) ( not ( = ?auto_251027 ?auto_251038 ) ) ( not ( = ?auto_251029 ?auto_251028 ) ) ( not ( = ?auto_251029 ?auto_251030 ) ) ( not ( = ?auto_251029 ?auto_251031 ) ) ( not ( = ?auto_251029 ?auto_251033 ) ) ( not ( = ?auto_251029 ?auto_251038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251028 ?auto_251030 ?auto_251031 )
      ( MAKE-6CRATE-VERIFY ?auto_251025 ?auto_251026 ?auto_251027 ?auto_251029 ?auto_251028 ?auto_251030 ?auto_251031 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_251039 - SURFACE
      ?auto_251040 - SURFACE
      ?auto_251041 - SURFACE
      ?auto_251043 - SURFACE
      ?auto_251042 - SURFACE
      ?auto_251044 - SURFACE
      ?auto_251045 - SURFACE
      ?auto_251046 - SURFACE
    )
    :vars
    (
      ?auto_251047 - HOIST
      ?auto_251052 - PLACE
      ?auto_251050 - PLACE
      ?auto_251051 - HOIST
      ?auto_251048 - SURFACE
      ?auto_251053 - SURFACE
      ?auto_251049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251047 ?auto_251052 ) ( IS-CRATE ?auto_251046 ) ( not ( = ?auto_251045 ?auto_251046 ) ) ( not ( = ?auto_251044 ?auto_251045 ) ) ( not ( = ?auto_251044 ?auto_251046 ) ) ( not ( = ?auto_251050 ?auto_251052 ) ) ( HOIST-AT ?auto_251051 ?auto_251050 ) ( not ( = ?auto_251047 ?auto_251051 ) ) ( SURFACE-AT ?auto_251046 ?auto_251050 ) ( ON ?auto_251046 ?auto_251048 ) ( CLEAR ?auto_251046 ) ( not ( = ?auto_251045 ?auto_251048 ) ) ( not ( = ?auto_251046 ?auto_251048 ) ) ( not ( = ?auto_251044 ?auto_251048 ) ) ( SURFACE-AT ?auto_251044 ?auto_251052 ) ( CLEAR ?auto_251044 ) ( IS-CRATE ?auto_251045 ) ( AVAILABLE ?auto_251047 ) ( AVAILABLE ?auto_251051 ) ( SURFACE-AT ?auto_251045 ?auto_251050 ) ( ON ?auto_251045 ?auto_251053 ) ( CLEAR ?auto_251045 ) ( not ( = ?auto_251045 ?auto_251053 ) ) ( not ( = ?auto_251046 ?auto_251053 ) ) ( not ( = ?auto_251044 ?auto_251053 ) ) ( not ( = ?auto_251048 ?auto_251053 ) ) ( TRUCK-AT ?auto_251049 ?auto_251052 ) ( ON ?auto_251040 ?auto_251039 ) ( ON ?auto_251041 ?auto_251040 ) ( ON ?auto_251043 ?auto_251041 ) ( ON ?auto_251042 ?auto_251043 ) ( ON ?auto_251044 ?auto_251042 ) ( not ( = ?auto_251039 ?auto_251040 ) ) ( not ( = ?auto_251039 ?auto_251041 ) ) ( not ( = ?auto_251039 ?auto_251043 ) ) ( not ( = ?auto_251039 ?auto_251042 ) ) ( not ( = ?auto_251039 ?auto_251044 ) ) ( not ( = ?auto_251039 ?auto_251045 ) ) ( not ( = ?auto_251039 ?auto_251046 ) ) ( not ( = ?auto_251039 ?auto_251048 ) ) ( not ( = ?auto_251039 ?auto_251053 ) ) ( not ( = ?auto_251040 ?auto_251041 ) ) ( not ( = ?auto_251040 ?auto_251043 ) ) ( not ( = ?auto_251040 ?auto_251042 ) ) ( not ( = ?auto_251040 ?auto_251044 ) ) ( not ( = ?auto_251040 ?auto_251045 ) ) ( not ( = ?auto_251040 ?auto_251046 ) ) ( not ( = ?auto_251040 ?auto_251048 ) ) ( not ( = ?auto_251040 ?auto_251053 ) ) ( not ( = ?auto_251041 ?auto_251043 ) ) ( not ( = ?auto_251041 ?auto_251042 ) ) ( not ( = ?auto_251041 ?auto_251044 ) ) ( not ( = ?auto_251041 ?auto_251045 ) ) ( not ( = ?auto_251041 ?auto_251046 ) ) ( not ( = ?auto_251041 ?auto_251048 ) ) ( not ( = ?auto_251041 ?auto_251053 ) ) ( not ( = ?auto_251043 ?auto_251042 ) ) ( not ( = ?auto_251043 ?auto_251044 ) ) ( not ( = ?auto_251043 ?auto_251045 ) ) ( not ( = ?auto_251043 ?auto_251046 ) ) ( not ( = ?auto_251043 ?auto_251048 ) ) ( not ( = ?auto_251043 ?auto_251053 ) ) ( not ( = ?auto_251042 ?auto_251044 ) ) ( not ( = ?auto_251042 ?auto_251045 ) ) ( not ( = ?auto_251042 ?auto_251046 ) ) ( not ( = ?auto_251042 ?auto_251048 ) ) ( not ( = ?auto_251042 ?auto_251053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251044 ?auto_251045 ?auto_251046 )
      ( MAKE-7CRATE-VERIFY ?auto_251039 ?auto_251040 ?auto_251041 ?auto_251043 ?auto_251042 ?auto_251044 ?auto_251045 ?auto_251046 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_251112 - SURFACE
      ?auto_251113 - SURFACE
      ?auto_251114 - SURFACE
      ?auto_251116 - SURFACE
      ?auto_251115 - SURFACE
      ?auto_251117 - SURFACE
      ?auto_251118 - SURFACE
    )
    :vars
    (
      ?auto_251119 - HOIST
      ?auto_251123 - PLACE
      ?auto_251124 - PLACE
      ?auto_251122 - HOIST
      ?auto_251120 - SURFACE
      ?auto_251125 - SURFACE
      ?auto_251121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251119 ?auto_251123 ) ( IS-CRATE ?auto_251118 ) ( not ( = ?auto_251117 ?auto_251118 ) ) ( not ( = ?auto_251115 ?auto_251117 ) ) ( not ( = ?auto_251115 ?auto_251118 ) ) ( not ( = ?auto_251124 ?auto_251123 ) ) ( HOIST-AT ?auto_251122 ?auto_251124 ) ( not ( = ?auto_251119 ?auto_251122 ) ) ( SURFACE-AT ?auto_251118 ?auto_251124 ) ( ON ?auto_251118 ?auto_251120 ) ( CLEAR ?auto_251118 ) ( not ( = ?auto_251117 ?auto_251120 ) ) ( not ( = ?auto_251118 ?auto_251120 ) ) ( not ( = ?auto_251115 ?auto_251120 ) ) ( IS-CRATE ?auto_251117 ) ( AVAILABLE ?auto_251122 ) ( SURFACE-AT ?auto_251117 ?auto_251124 ) ( ON ?auto_251117 ?auto_251125 ) ( CLEAR ?auto_251117 ) ( not ( = ?auto_251117 ?auto_251125 ) ) ( not ( = ?auto_251118 ?auto_251125 ) ) ( not ( = ?auto_251115 ?auto_251125 ) ) ( not ( = ?auto_251120 ?auto_251125 ) ) ( TRUCK-AT ?auto_251121 ?auto_251123 ) ( SURFACE-AT ?auto_251116 ?auto_251123 ) ( CLEAR ?auto_251116 ) ( LIFTING ?auto_251119 ?auto_251115 ) ( IS-CRATE ?auto_251115 ) ( not ( = ?auto_251116 ?auto_251115 ) ) ( not ( = ?auto_251117 ?auto_251116 ) ) ( not ( = ?auto_251118 ?auto_251116 ) ) ( not ( = ?auto_251120 ?auto_251116 ) ) ( not ( = ?auto_251125 ?auto_251116 ) ) ( ON ?auto_251113 ?auto_251112 ) ( ON ?auto_251114 ?auto_251113 ) ( ON ?auto_251116 ?auto_251114 ) ( not ( = ?auto_251112 ?auto_251113 ) ) ( not ( = ?auto_251112 ?auto_251114 ) ) ( not ( = ?auto_251112 ?auto_251116 ) ) ( not ( = ?auto_251112 ?auto_251115 ) ) ( not ( = ?auto_251112 ?auto_251117 ) ) ( not ( = ?auto_251112 ?auto_251118 ) ) ( not ( = ?auto_251112 ?auto_251120 ) ) ( not ( = ?auto_251112 ?auto_251125 ) ) ( not ( = ?auto_251113 ?auto_251114 ) ) ( not ( = ?auto_251113 ?auto_251116 ) ) ( not ( = ?auto_251113 ?auto_251115 ) ) ( not ( = ?auto_251113 ?auto_251117 ) ) ( not ( = ?auto_251113 ?auto_251118 ) ) ( not ( = ?auto_251113 ?auto_251120 ) ) ( not ( = ?auto_251113 ?auto_251125 ) ) ( not ( = ?auto_251114 ?auto_251116 ) ) ( not ( = ?auto_251114 ?auto_251115 ) ) ( not ( = ?auto_251114 ?auto_251117 ) ) ( not ( = ?auto_251114 ?auto_251118 ) ) ( not ( = ?auto_251114 ?auto_251120 ) ) ( not ( = ?auto_251114 ?auto_251125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251115 ?auto_251117 ?auto_251118 )
      ( MAKE-6CRATE-VERIFY ?auto_251112 ?auto_251113 ?auto_251114 ?auto_251116 ?auto_251115 ?auto_251117 ?auto_251118 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_251126 - SURFACE
      ?auto_251127 - SURFACE
      ?auto_251128 - SURFACE
      ?auto_251130 - SURFACE
      ?auto_251129 - SURFACE
      ?auto_251131 - SURFACE
      ?auto_251132 - SURFACE
      ?auto_251133 - SURFACE
    )
    :vars
    (
      ?auto_251134 - HOIST
      ?auto_251138 - PLACE
      ?auto_251139 - PLACE
      ?auto_251137 - HOIST
      ?auto_251135 - SURFACE
      ?auto_251140 - SURFACE
      ?auto_251136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_251134 ?auto_251138 ) ( IS-CRATE ?auto_251133 ) ( not ( = ?auto_251132 ?auto_251133 ) ) ( not ( = ?auto_251131 ?auto_251132 ) ) ( not ( = ?auto_251131 ?auto_251133 ) ) ( not ( = ?auto_251139 ?auto_251138 ) ) ( HOIST-AT ?auto_251137 ?auto_251139 ) ( not ( = ?auto_251134 ?auto_251137 ) ) ( SURFACE-AT ?auto_251133 ?auto_251139 ) ( ON ?auto_251133 ?auto_251135 ) ( CLEAR ?auto_251133 ) ( not ( = ?auto_251132 ?auto_251135 ) ) ( not ( = ?auto_251133 ?auto_251135 ) ) ( not ( = ?auto_251131 ?auto_251135 ) ) ( IS-CRATE ?auto_251132 ) ( AVAILABLE ?auto_251137 ) ( SURFACE-AT ?auto_251132 ?auto_251139 ) ( ON ?auto_251132 ?auto_251140 ) ( CLEAR ?auto_251132 ) ( not ( = ?auto_251132 ?auto_251140 ) ) ( not ( = ?auto_251133 ?auto_251140 ) ) ( not ( = ?auto_251131 ?auto_251140 ) ) ( not ( = ?auto_251135 ?auto_251140 ) ) ( TRUCK-AT ?auto_251136 ?auto_251138 ) ( SURFACE-AT ?auto_251129 ?auto_251138 ) ( CLEAR ?auto_251129 ) ( LIFTING ?auto_251134 ?auto_251131 ) ( IS-CRATE ?auto_251131 ) ( not ( = ?auto_251129 ?auto_251131 ) ) ( not ( = ?auto_251132 ?auto_251129 ) ) ( not ( = ?auto_251133 ?auto_251129 ) ) ( not ( = ?auto_251135 ?auto_251129 ) ) ( not ( = ?auto_251140 ?auto_251129 ) ) ( ON ?auto_251127 ?auto_251126 ) ( ON ?auto_251128 ?auto_251127 ) ( ON ?auto_251130 ?auto_251128 ) ( ON ?auto_251129 ?auto_251130 ) ( not ( = ?auto_251126 ?auto_251127 ) ) ( not ( = ?auto_251126 ?auto_251128 ) ) ( not ( = ?auto_251126 ?auto_251130 ) ) ( not ( = ?auto_251126 ?auto_251129 ) ) ( not ( = ?auto_251126 ?auto_251131 ) ) ( not ( = ?auto_251126 ?auto_251132 ) ) ( not ( = ?auto_251126 ?auto_251133 ) ) ( not ( = ?auto_251126 ?auto_251135 ) ) ( not ( = ?auto_251126 ?auto_251140 ) ) ( not ( = ?auto_251127 ?auto_251128 ) ) ( not ( = ?auto_251127 ?auto_251130 ) ) ( not ( = ?auto_251127 ?auto_251129 ) ) ( not ( = ?auto_251127 ?auto_251131 ) ) ( not ( = ?auto_251127 ?auto_251132 ) ) ( not ( = ?auto_251127 ?auto_251133 ) ) ( not ( = ?auto_251127 ?auto_251135 ) ) ( not ( = ?auto_251127 ?auto_251140 ) ) ( not ( = ?auto_251128 ?auto_251130 ) ) ( not ( = ?auto_251128 ?auto_251129 ) ) ( not ( = ?auto_251128 ?auto_251131 ) ) ( not ( = ?auto_251128 ?auto_251132 ) ) ( not ( = ?auto_251128 ?auto_251133 ) ) ( not ( = ?auto_251128 ?auto_251135 ) ) ( not ( = ?auto_251128 ?auto_251140 ) ) ( not ( = ?auto_251130 ?auto_251129 ) ) ( not ( = ?auto_251130 ?auto_251131 ) ) ( not ( = ?auto_251130 ?auto_251132 ) ) ( not ( = ?auto_251130 ?auto_251133 ) ) ( not ( = ?auto_251130 ?auto_251135 ) ) ( not ( = ?auto_251130 ?auto_251140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_251131 ?auto_251132 ?auto_251133 )
      ( MAKE-7CRATE-VERIFY ?auto_251126 ?auto_251127 ?auto_251128 ?auto_251130 ?auto_251129 ?auto_251131 ?auto_251132 ?auto_251133 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_253209 - SURFACE
      ?auto_253210 - SURFACE
    )
    :vars
    (
      ?auto_253211 - HOIST
      ?auto_253217 - PLACE
      ?auto_253212 - SURFACE
      ?auto_253213 - PLACE
      ?auto_253216 - HOIST
      ?auto_253215 - SURFACE
      ?auto_253218 - TRUCK
      ?auto_253214 - SURFACE
      ?auto_253219 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253211 ?auto_253217 ) ( IS-CRATE ?auto_253210 ) ( not ( = ?auto_253209 ?auto_253210 ) ) ( not ( = ?auto_253212 ?auto_253209 ) ) ( not ( = ?auto_253212 ?auto_253210 ) ) ( not ( = ?auto_253213 ?auto_253217 ) ) ( HOIST-AT ?auto_253216 ?auto_253213 ) ( not ( = ?auto_253211 ?auto_253216 ) ) ( SURFACE-AT ?auto_253210 ?auto_253213 ) ( ON ?auto_253210 ?auto_253215 ) ( CLEAR ?auto_253210 ) ( not ( = ?auto_253209 ?auto_253215 ) ) ( not ( = ?auto_253210 ?auto_253215 ) ) ( not ( = ?auto_253212 ?auto_253215 ) ) ( SURFACE-AT ?auto_253212 ?auto_253217 ) ( CLEAR ?auto_253212 ) ( IS-CRATE ?auto_253209 ) ( AVAILABLE ?auto_253211 ) ( TRUCK-AT ?auto_253218 ?auto_253213 ) ( SURFACE-AT ?auto_253209 ?auto_253213 ) ( ON ?auto_253209 ?auto_253214 ) ( CLEAR ?auto_253209 ) ( not ( = ?auto_253209 ?auto_253214 ) ) ( not ( = ?auto_253210 ?auto_253214 ) ) ( not ( = ?auto_253212 ?auto_253214 ) ) ( not ( = ?auto_253215 ?auto_253214 ) ) ( LIFTING ?auto_253216 ?auto_253219 ) ( IS-CRATE ?auto_253219 ) ( not ( = ?auto_253209 ?auto_253219 ) ) ( not ( = ?auto_253210 ?auto_253219 ) ) ( not ( = ?auto_253212 ?auto_253219 ) ) ( not ( = ?auto_253215 ?auto_253219 ) ) ( not ( = ?auto_253214 ?auto_253219 ) ) )
    :subtasks
    ( ( !LOAD ?auto_253216 ?auto_253219 ?auto_253218 ?auto_253213 )
      ( MAKE-2CRATE ?auto_253212 ?auto_253209 ?auto_253210 )
      ( MAKE-1CRATE-VERIFY ?auto_253209 ?auto_253210 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_253220 - SURFACE
      ?auto_253221 - SURFACE
      ?auto_253222 - SURFACE
    )
    :vars
    (
      ?auto_253229 - HOIST
      ?auto_253226 - PLACE
      ?auto_253223 - PLACE
      ?auto_253225 - HOIST
      ?auto_253224 - SURFACE
      ?auto_253227 - TRUCK
      ?auto_253228 - SURFACE
      ?auto_253230 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253229 ?auto_253226 ) ( IS-CRATE ?auto_253222 ) ( not ( = ?auto_253221 ?auto_253222 ) ) ( not ( = ?auto_253220 ?auto_253221 ) ) ( not ( = ?auto_253220 ?auto_253222 ) ) ( not ( = ?auto_253223 ?auto_253226 ) ) ( HOIST-AT ?auto_253225 ?auto_253223 ) ( not ( = ?auto_253229 ?auto_253225 ) ) ( SURFACE-AT ?auto_253222 ?auto_253223 ) ( ON ?auto_253222 ?auto_253224 ) ( CLEAR ?auto_253222 ) ( not ( = ?auto_253221 ?auto_253224 ) ) ( not ( = ?auto_253222 ?auto_253224 ) ) ( not ( = ?auto_253220 ?auto_253224 ) ) ( SURFACE-AT ?auto_253220 ?auto_253226 ) ( CLEAR ?auto_253220 ) ( IS-CRATE ?auto_253221 ) ( AVAILABLE ?auto_253229 ) ( TRUCK-AT ?auto_253227 ?auto_253223 ) ( SURFACE-AT ?auto_253221 ?auto_253223 ) ( ON ?auto_253221 ?auto_253228 ) ( CLEAR ?auto_253221 ) ( not ( = ?auto_253221 ?auto_253228 ) ) ( not ( = ?auto_253222 ?auto_253228 ) ) ( not ( = ?auto_253220 ?auto_253228 ) ) ( not ( = ?auto_253224 ?auto_253228 ) ) ( LIFTING ?auto_253225 ?auto_253230 ) ( IS-CRATE ?auto_253230 ) ( not ( = ?auto_253221 ?auto_253230 ) ) ( not ( = ?auto_253222 ?auto_253230 ) ) ( not ( = ?auto_253220 ?auto_253230 ) ) ( not ( = ?auto_253224 ?auto_253230 ) ) ( not ( = ?auto_253228 ?auto_253230 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_253221 ?auto_253222 )
      ( MAKE-2CRATE-VERIFY ?auto_253220 ?auto_253221 ?auto_253222 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_253544 - SURFACE
      ?auto_253545 - SURFACE
      ?auto_253546 - SURFACE
      ?auto_253548 - SURFACE
      ?auto_253547 - SURFACE
      ?auto_253549 - SURFACE
      ?auto_253550 - SURFACE
      ?auto_253551 - SURFACE
      ?auto_253552 - SURFACE
    )
    :vars
    (
      ?auto_253554 - HOIST
      ?auto_253553 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253554 ?auto_253553 ) ( SURFACE-AT ?auto_253551 ?auto_253553 ) ( CLEAR ?auto_253551 ) ( LIFTING ?auto_253554 ?auto_253552 ) ( IS-CRATE ?auto_253552 ) ( not ( = ?auto_253551 ?auto_253552 ) ) ( ON ?auto_253545 ?auto_253544 ) ( ON ?auto_253546 ?auto_253545 ) ( ON ?auto_253548 ?auto_253546 ) ( ON ?auto_253547 ?auto_253548 ) ( ON ?auto_253549 ?auto_253547 ) ( ON ?auto_253550 ?auto_253549 ) ( ON ?auto_253551 ?auto_253550 ) ( not ( = ?auto_253544 ?auto_253545 ) ) ( not ( = ?auto_253544 ?auto_253546 ) ) ( not ( = ?auto_253544 ?auto_253548 ) ) ( not ( = ?auto_253544 ?auto_253547 ) ) ( not ( = ?auto_253544 ?auto_253549 ) ) ( not ( = ?auto_253544 ?auto_253550 ) ) ( not ( = ?auto_253544 ?auto_253551 ) ) ( not ( = ?auto_253544 ?auto_253552 ) ) ( not ( = ?auto_253545 ?auto_253546 ) ) ( not ( = ?auto_253545 ?auto_253548 ) ) ( not ( = ?auto_253545 ?auto_253547 ) ) ( not ( = ?auto_253545 ?auto_253549 ) ) ( not ( = ?auto_253545 ?auto_253550 ) ) ( not ( = ?auto_253545 ?auto_253551 ) ) ( not ( = ?auto_253545 ?auto_253552 ) ) ( not ( = ?auto_253546 ?auto_253548 ) ) ( not ( = ?auto_253546 ?auto_253547 ) ) ( not ( = ?auto_253546 ?auto_253549 ) ) ( not ( = ?auto_253546 ?auto_253550 ) ) ( not ( = ?auto_253546 ?auto_253551 ) ) ( not ( = ?auto_253546 ?auto_253552 ) ) ( not ( = ?auto_253548 ?auto_253547 ) ) ( not ( = ?auto_253548 ?auto_253549 ) ) ( not ( = ?auto_253548 ?auto_253550 ) ) ( not ( = ?auto_253548 ?auto_253551 ) ) ( not ( = ?auto_253548 ?auto_253552 ) ) ( not ( = ?auto_253547 ?auto_253549 ) ) ( not ( = ?auto_253547 ?auto_253550 ) ) ( not ( = ?auto_253547 ?auto_253551 ) ) ( not ( = ?auto_253547 ?auto_253552 ) ) ( not ( = ?auto_253549 ?auto_253550 ) ) ( not ( = ?auto_253549 ?auto_253551 ) ) ( not ( = ?auto_253549 ?auto_253552 ) ) ( not ( = ?auto_253550 ?auto_253551 ) ) ( not ( = ?auto_253550 ?auto_253552 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_253551 ?auto_253552 )
      ( MAKE-8CRATE-VERIFY ?auto_253544 ?auto_253545 ?auto_253546 ?auto_253548 ?auto_253547 ?auto_253549 ?auto_253550 ?auto_253551 ?auto_253552 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_253611 - SURFACE
      ?auto_253612 - SURFACE
      ?auto_253613 - SURFACE
      ?auto_253615 - SURFACE
      ?auto_253614 - SURFACE
      ?auto_253616 - SURFACE
      ?auto_253617 - SURFACE
      ?auto_253618 - SURFACE
      ?auto_253619 - SURFACE
    )
    :vars
    (
      ?auto_253620 - HOIST
      ?auto_253622 - PLACE
      ?auto_253621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_253620 ?auto_253622 ) ( SURFACE-AT ?auto_253618 ?auto_253622 ) ( CLEAR ?auto_253618 ) ( IS-CRATE ?auto_253619 ) ( not ( = ?auto_253618 ?auto_253619 ) ) ( TRUCK-AT ?auto_253621 ?auto_253622 ) ( AVAILABLE ?auto_253620 ) ( IN ?auto_253619 ?auto_253621 ) ( ON ?auto_253618 ?auto_253617 ) ( not ( = ?auto_253617 ?auto_253618 ) ) ( not ( = ?auto_253617 ?auto_253619 ) ) ( ON ?auto_253612 ?auto_253611 ) ( ON ?auto_253613 ?auto_253612 ) ( ON ?auto_253615 ?auto_253613 ) ( ON ?auto_253614 ?auto_253615 ) ( ON ?auto_253616 ?auto_253614 ) ( ON ?auto_253617 ?auto_253616 ) ( not ( = ?auto_253611 ?auto_253612 ) ) ( not ( = ?auto_253611 ?auto_253613 ) ) ( not ( = ?auto_253611 ?auto_253615 ) ) ( not ( = ?auto_253611 ?auto_253614 ) ) ( not ( = ?auto_253611 ?auto_253616 ) ) ( not ( = ?auto_253611 ?auto_253617 ) ) ( not ( = ?auto_253611 ?auto_253618 ) ) ( not ( = ?auto_253611 ?auto_253619 ) ) ( not ( = ?auto_253612 ?auto_253613 ) ) ( not ( = ?auto_253612 ?auto_253615 ) ) ( not ( = ?auto_253612 ?auto_253614 ) ) ( not ( = ?auto_253612 ?auto_253616 ) ) ( not ( = ?auto_253612 ?auto_253617 ) ) ( not ( = ?auto_253612 ?auto_253618 ) ) ( not ( = ?auto_253612 ?auto_253619 ) ) ( not ( = ?auto_253613 ?auto_253615 ) ) ( not ( = ?auto_253613 ?auto_253614 ) ) ( not ( = ?auto_253613 ?auto_253616 ) ) ( not ( = ?auto_253613 ?auto_253617 ) ) ( not ( = ?auto_253613 ?auto_253618 ) ) ( not ( = ?auto_253613 ?auto_253619 ) ) ( not ( = ?auto_253615 ?auto_253614 ) ) ( not ( = ?auto_253615 ?auto_253616 ) ) ( not ( = ?auto_253615 ?auto_253617 ) ) ( not ( = ?auto_253615 ?auto_253618 ) ) ( not ( = ?auto_253615 ?auto_253619 ) ) ( not ( = ?auto_253614 ?auto_253616 ) ) ( not ( = ?auto_253614 ?auto_253617 ) ) ( not ( = ?auto_253614 ?auto_253618 ) ) ( not ( = ?auto_253614 ?auto_253619 ) ) ( not ( = ?auto_253616 ?auto_253617 ) ) ( not ( = ?auto_253616 ?auto_253618 ) ) ( not ( = ?auto_253616 ?auto_253619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_253617 ?auto_253618 ?auto_253619 )
      ( MAKE-8CRATE-VERIFY ?auto_253611 ?auto_253612 ?auto_253613 ?auto_253615 ?auto_253614 ?auto_253616 ?auto_253617 ?auto_253618 ?auto_253619 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_253687 - SURFACE
      ?auto_253688 - SURFACE
      ?auto_253689 - SURFACE
      ?auto_253691 - SURFACE
      ?auto_253690 - SURFACE
      ?auto_253692 - SURFACE
      ?auto_253693 - SURFACE
      ?auto_253694 - SURFACE
      ?auto_253695 - SURFACE
    )
    :vars
    (
      ?auto_253697 - HOIST
      ?auto_253699 - PLACE
      ?auto_253696 - TRUCK
      ?auto_253698 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253697 ?auto_253699 ) ( SURFACE-AT ?auto_253694 ?auto_253699 ) ( CLEAR ?auto_253694 ) ( IS-CRATE ?auto_253695 ) ( not ( = ?auto_253694 ?auto_253695 ) ) ( AVAILABLE ?auto_253697 ) ( IN ?auto_253695 ?auto_253696 ) ( ON ?auto_253694 ?auto_253693 ) ( not ( = ?auto_253693 ?auto_253694 ) ) ( not ( = ?auto_253693 ?auto_253695 ) ) ( TRUCK-AT ?auto_253696 ?auto_253698 ) ( not ( = ?auto_253698 ?auto_253699 ) ) ( ON ?auto_253688 ?auto_253687 ) ( ON ?auto_253689 ?auto_253688 ) ( ON ?auto_253691 ?auto_253689 ) ( ON ?auto_253690 ?auto_253691 ) ( ON ?auto_253692 ?auto_253690 ) ( ON ?auto_253693 ?auto_253692 ) ( not ( = ?auto_253687 ?auto_253688 ) ) ( not ( = ?auto_253687 ?auto_253689 ) ) ( not ( = ?auto_253687 ?auto_253691 ) ) ( not ( = ?auto_253687 ?auto_253690 ) ) ( not ( = ?auto_253687 ?auto_253692 ) ) ( not ( = ?auto_253687 ?auto_253693 ) ) ( not ( = ?auto_253687 ?auto_253694 ) ) ( not ( = ?auto_253687 ?auto_253695 ) ) ( not ( = ?auto_253688 ?auto_253689 ) ) ( not ( = ?auto_253688 ?auto_253691 ) ) ( not ( = ?auto_253688 ?auto_253690 ) ) ( not ( = ?auto_253688 ?auto_253692 ) ) ( not ( = ?auto_253688 ?auto_253693 ) ) ( not ( = ?auto_253688 ?auto_253694 ) ) ( not ( = ?auto_253688 ?auto_253695 ) ) ( not ( = ?auto_253689 ?auto_253691 ) ) ( not ( = ?auto_253689 ?auto_253690 ) ) ( not ( = ?auto_253689 ?auto_253692 ) ) ( not ( = ?auto_253689 ?auto_253693 ) ) ( not ( = ?auto_253689 ?auto_253694 ) ) ( not ( = ?auto_253689 ?auto_253695 ) ) ( not ( = ?auto_253691 ?auto_253690 ) ) ( not ( = ?auto_253691 ?auto_253692 ) ) ( not ( = ?auto_253691 ?auto_253693 ) ) ( not ( = ?auto_253691 ?auto_253694 ) ) ( not ( = ?auto_253691 ?auto_253695 ) ) ( not ( = ?auto_253690 ?auto_253692 ) ) ( not ( = ?auto_253690 ?auto_253693 ) ) ( not ( = ?auto_253690 ?auto_253694 ) ) ( not ( = ?auto_253690 ?auto_253695 ) ) ( not ( = ?auto_253692 ?auto_253693 ) ) ( not ( = ?auto_253692 ?auto_253694 ) ) ( not ( = ?auto_253692 ?auto_253695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_253693 ?auto_253694 ?auto_253695 )
      ( MAKE-8CRATE-VERIFY ?auto_253687 ?auto_253688 ?auto_253689 ?auto_253691 ?auto_253690 ?auto_253692 ?auto_253693 ?auto_253694 ?auto_253695 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_253771 - SURFACE
      ?auto_253772 - SURFACE
      ?auto_253773 - SURFACE
      ?auto_253775 - SURFACE
      ?auto_253774 - SURFACE
      ?auto_253776 - SURFACE
      ?auto_253777 - SURFACE
      ?auto_253778 - SURFACE
      ?auto_253779 - SURFACE
    )
    :vars
    (
      ?auto_253781 - HOIST
      ?auto_253780 - PLACE
      ?auto_253784 - TRUCK
      ?auto_253783 - PLACE
      ?auto_253782 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_253781 ?auto_253780 ) ( SURFACE-AT ?auto_253778 ?auto_253780 ) ( CLEAR ?auto_253778 ) ( IS-CRATE ?auto_253779 ) ( not ( = ?auto_253778 ?auto_253779 ) ) ( AVAILABLE ?auto_253781 ) ( ON ?auto_253778 ?auto_253777 ) ( not ( = ?auto_253777 ?auto_253778 ) ) ( not ( = ?auto_253777 ?auto_253779 ) ) ( TRUCK-AT ?auto_253784 ?auto_253783 ) ( not ( = ?auto_253783 ?auto_253780 ) ) ( HOIST-AT ?auto_253782 ?auto_253783 ) ( LIFTING ?auto_253782 ?auto_253779 ) ( not ( = ?auto_253781 ?auto_253782 ) ) ( ON ?auto_253772 ?auto_253771 ) ( ON ?auto_253773 ?auto_253772 ) ( ON ?auto_253775 ?auto_253773 ) ( ON ?auto_253774 ?auto_253775 ) ( ON ?auto_253776 ?auto_253774 ) ( ON ?auto_253777 ?auto_253776 ) ( not ( = ?auto_253771 ?auto_253772 ) ) ( not ( = ?auto_253771 ?auto_253773 ) ) ( not ( = ?auto_253771 ?auto_253775 ) ) ( not ( = ?auto_253771 ?auto_253774 ) ) ( not ( = ?auto_253771 ?auto_253776 ) ) ( not ( = ?auto_253771 ?auto_253777 ) ) ( not ( = ?auto_253771 ?auto_253778 ) ) ( not ( = ?auto_253771 ?auto_253779 ) ) ( not ( = ?auto_253772 ?auto_253773 ) ) ( not ( = ?auto_253772 ?auto_253775 ) ) ( not ( = ?auto_253772 ?auto_253774 ) ) ( not ( = ?auto_253772 ?auto_253776 ) ) ( not ( = ?auto_253772 ?auto_253777 ) ) ( not ( = ?auto_253772 ?auto_253778 ) ) ( not ( = ?auto_253772 ?auto_253779 ) ) ( not ( = ?auto_253773 ?auto_253775 ) ) ( not ( = ?auto_253773 ?auto_253774 ) ) ( not ( = ?auto_253773 ?auto_253776 ) ) ( not ( = ?auto_253773 ?auto_253777 ) ) ( not ( = ?auto_253773 ?auto_253778 ) ) ( not ( = ?auto_253773 ?auto_253779 ) ) ( not ( = ?auto_253775 ?auto_253774 ) ) ( not ( = ?auto_253775 ?auto_253776 ) ) ( not ( = ?auto_253775 ?auto_253777 ) ) ( not ( = ?auto_253775 ?auto_253778 ) ) ( not ( = ?auto_253775 ?auto_253779 ) ) ( not ( = ?auto_253774 ?auto_253776 ) ) ( not ( = ?auto_253774 ?auto_253777 ) ) ( not ( = ?auto_253774 ?auto_253778 ) ) ( not ( = ?auto_253774 ?auto_253779 ) ) ( not ( = ?auto_253776 ?auto_253777 ) ) ( not ( = ?auto_253776 ?auto_253778 ) ) ( not ( = ?auto_253776 ?auto_253779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_253777 ?auto_253778 ?auto_253779 )
      ( MAKE-8CRATE-VERIFY ?auto_253771 ?auto_253772 ?auto_253773 ?auto_253775 ?auto_253774 ?auto_253776 ?auto_253777 ?auto_253778 ?auto_253779 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_253863 - SURFACE
      ?auto_253864 - SURFACE
      ?auto_253865 - SURFACE
      ?auto_253867 - SURFACE
      ?auto_253866 - SURFACE
      ?auto_253868 - SURFACE
      ?auto_253869 - SURFACE
      ?auto_253870 - SURFACE
      ?auto_253871 - SURFACE
    )
    :vars
    (
      ?auto_253875 - HOIST
      ?auto_253873 - PLACE
      ?auto_253874 - TRUCK
      ?auto_253872 - PLACE
      ?auto_253876 - HOIST
      ?auto_253877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_253875 ?auto_253873 ) ( SURFACE-AT ?auto_253870 ?auto_253873 ) ( CLEAR ?auto_253870 ) ( IS-CRATE ?auto_253871 ) ( not ( = ?auto_253870 ?auto_253871 ) ) ( AVAILABLE ?auto_253875 ) ( ON ?auto_253870 ?auto_253869 ) ( not ( = ?auto_253869 ?auto_253870 ) ) ( not ( = ?auto_253869 ?auto_253871 ) ) ( TRUCK-AT ?auto_253874 ?auto_253872 ) ( not ( = ?auto_253872 ?auto_253873 ) ) ( HOIST-AT ?auto_253876 ?auto_253872 ) ( not ( = ?auto_253875 ?auto_253876 ) ) ( AVAILABLE ?auto_253876 ) ( SURFACE-AT ?auto_253871 ?auto_253872 ) ( ON ?auto_253871 ?auto_253877 ) ( CLEAR ?auto_253871 ) ( not ( = ?auto_253870 ?auto_253877 ) ) ( not ( = ?auto_253871 ?auto_253877 ) ) ( not ( = ?auto_253869 ?auto_253877 ) ) ( ON ?auto_253864 ?auto_253863 ) ( ON ?auto_253865 ?auto_253864 ) ( ON ?auto_253867 ?auto_253865 ) ( ON ?auto_253866 ?auto_253867 ) ( ON ?auto_253868 ?auto_253866 ) ( ON ?auto_253869 ?auto_253868 ) ( not ( = ?auto_253863 ?auto_253864 ) ) ( not ( = ?auto_253863 ?auto_253865 ) ) ( not ( = ?auto_253863 ?auto_253867 ) ) ( not ( = ?auto_253863 ?auto_253866 ) ) ( not ( = ?auto_253863 ?auto_253868 ) ) ( not ( = ?auto_253863 ?auto_253869 ) ) ( not ( = ?auto_253863 ?auto_253870 ) ) ( not ( = ?auto_253863 ?auto_253871 ) ) ( not ( = ?auto_253863 ?auto_253877 ) ) ( not ( = ?auto_253864 ?auto_253865 ) ) ( not ( = ?auto_253864 ?auto_253867 ) ) ( not ( = ?auto_253864 ?auto_253866 ) ) ( not ( = ?auto_253864 ?auto_253868 ) ) ( not ( = ?auto_253864 ?auto_253869 ) ) ( not ( = ?auto_253864 ?auto_253870 ) ) ( not ( = ?auto_253864 ?auto_253871 ) ) ( not ( = ?auto_253864 ?auto_253877 ) ) ( not ( = ?auto_253865 ?auto_253867 ) ) ( not ( = ?auto_253865 ?auto_253866 ) ) ( not ( = ?auto_253865 ?auto_253868 ) ) ( not ( = ?auto_253865 ?auto_253869 ) ) ( not ( = ?auto_253865 ?auto_253870 ) ) ( not ( = ?auto_253865 ?auto_253871 ) ) ( not ( = ?auto_253865 ?auto_253877 ) ) ( not ( = ?auto_253867 ?auto_253866 ) ) ( not ( = ?auto_253867 ?auto_253868 ) ) ( not ( = ?auto_253867 ?auto_253869 ) ) ( not ( = ?auto_253867 ?auto_253870 ) ) ( not ( = ?auto_253867 ?auto_253871 ) ) ( not ( = ?auto_253867 ?auto_253877 ) ) ( not ( = ?auto_253866 ?auto_253868 ) ) ( not ( = ?auto_253866 ?auto_253869 ) ) ( not ( = ?auto_253866 ?auto_253870 ) ) ( not ( = ?auto_253866 ?auto_253871 ) ) ( not ( = ?auto_253866 ?auto_253877 ) ) ( not ( = ?auto_253868 ?auto_253869 ) ) ( not ( = ?auto_253868 ?auto_253870 ) ) ( not ( = ?auto_253868 ?auto_253871 ) ) ( not ( = ?auto_253868 ?auto_253877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_253869 ?auto_253870 ?auto_253871 )
      ( MAKE-8CRATE-VERIFY ?auto_253863 ?auto_253864 ?auto_253865 ?auto_253867 ?auto_253866 ?auto_253868 ?auto_253869 ?auto_253870 ?auto_253871 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_253956 - SURFACE
      ?auto_253957 - SURFACE
      ?auto_253958 - SURFACE
      ?auto_253960 - SURFACE
      ?auto_253959 - SURFACE
      ?auto_253961 - SURFACE
      ?auto_253962 - SURFACE
      ?auto_253963 - SURFACE
      ?auto_253964 - SURFACE
    )
    :vars
    (
      ?auto_253967 - HOIST
      ?auto_253969 - PLACE
      ?auto_253966 - PLACE
      ?auto_253970 - HOIST
      ?auto_253965 - SURFACE
      ?auto_253968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_253967 ?auto_253969 ) ( SURFACE-AT ?auto_253963 ?auto_253969 ) ( CLEAR ?auto_253963 ) ( IS-CRATE ?auto_253964 ) ( not ( = ?auto_253963 ?auto_253964 ) ) ( AVAILABLE ?auto_253967 ) ( ON ?auto_253963 ?auto_253962 ) ( not ( = ?auto_253962 ?auto_253963 ) ) ( not ( = ?auto_253962 ?auto_253964 ) ) ( not ( = ?auto_253966 ?auto_253969 ) ) ( HOIST-AT ?auto_253970 ?auto_253966 ) ( not ( = ?auto_253967 ?auto_253970 ) ) ( AVAILABLE ?auto_253970 ) ( SURFACE-AT ?auto_253964 ?auto_253966 ) ( ON ?auto_253964 ?auto_253965 ) ( CLEAR ?auto_253964 ) ( not ( = ?auto_253963 ?auto_253965 ) ) ( not ( = ?auto_253964 ?auto_253965 ) ) ( not ( = ?auto_253962 ?auto_253965 ) ) ( TRUCK-AT ?auto_253968 ?auto_253969 ) ( ON ?auto_253957 ?auto_253956 ) ( ON ?auto_253958 ?auto_253957 ) ( ON ?auto_253960 ?auto_253958 ) ( ON ?auto_253959 ?auto_253960 ) ( ON ?auto_253961 ?auto_253959 ) ( ON ?auto_253962 ?auto_253961 ) ( not ( = ?auto_253956 ?auto_253957 ) ) ( not ( = ?auto_253956 ?auto_253958 ) ) ( not ( = ?auto_253956 ?auto_253960 ) ) ( not ( = ?auto_253956 ?auto_253959 ) ) ( not ( = ?auto_253956 ?auto_253961 ) ) ( not ( = ?auto_253956 ?auto_253962 ) ) ( not ( = ?auto_253956 ?auto_253963 ) ) ( not ( = ?auto_253956 ?auto_253964 ) ) ( not ( = ?auto_253956 ?auto_253965 ) ) ( not ( = ?auto_253957 ?auto_253958 ) ) ( not ( = ?auto_253957 ?auto_253960 ) ) ( not ( = ?auto_253957 ?auto_253959 ) ) ( not ( = ?auto_253957 ?auto_253961 ) ) ( not ( = ?auto_253957 ?auto_253962 ) ) ( not ( = ?auto_253957 ?auto_253963 ) ) ( not ( = ?auto_253957 ?auto_253964 ) ) ( not ( = ?auto_253957 ?auto_253965 ) ) ( not ( = ?auto_253958 ?auto_253960 ) ) ( not ( = ?auto_253958 ?auto_253959 ) ) ( not ( = ?auto_253958 ?auto_253961 ) ) ( not ( = ?auto_253958 ?auto_253962 ) ) ( not ( = ?auto_253958 ?auto_253963 ) ) ( not ( = ?auto_253958 ?auto_253964 ) ) ( not ( = ?auto_253958 ?auto_253965 ) ) ( not ( = ?auto_253960 ?auto_253959 ) ) ( not ( = ?auto_253960 ?auto_253961 ) ) ( not ( = ?auto_253960 ?auto_253962 ) ) ( not ( = ?auto_253960 ?auto_253963 ) ) ( not ( = ?auto_253960 ?auto_253964 ) ) ( not ( = ?auto_253960 ?auto_253965 ) ) ( not ( = ?auto_253959 ?auto_253961 ) ) ( not ( = ?auto_253959 ?auto_253962 ) ) ( not ( = ?auto_253959 ?auto_253963 ) ) ( not ( = ?auto_253959 ?auto_253964 ) ) ( not ( = ?auto_253959 ?auto_253965 ) ) ( not ( = ?auto_253961 ?auto_253962 ) ) ( not ( = ?auto_253961 ?auto_253963 ) ) ( not ( = ?auto_253961 ?auto_253964 ) ) ( not ( = ?auto_253961 ?auto_253965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_253962 ?auto_253963 ?auto_253964 )
      ( MAKE-8CRATE-VERIFY ?auto_253956 ?auto_253957 ?auto_253958 ?auto_253960 ?auto_253959 ?auto_253961 ?auto_253962 ?auto_253963 ?auto_253964 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254049 - SURFACE
      ?auto_254050 - SURFACE
      ?auto_254051 - SURFACE
      ?auto_254053 - SURFACE
      ?auto_254052 - SURFACE
      ?auto_254054 - SURFACE
      ?auto_254055 - SURFACE
      ?auto_254056 - SURFACE
      ?auto_254057 - SURFACE
    )
    :vars
    (
      ?auto_254062 - HOIST
      ?auto_254058 - PLACE
      ?auto_254061 - PLACE
      ?auto_254059 - HOIST
      ?auto_254060 - SURFACE
      ?auto_254063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_254062 ?auto_254058 ) ( IS-CRATE ?auto_254057 ) ( not ( = ?auto_254056 ?auto_254057 ) ) ( not ( = ?auto_254055 ?auto_254056 ) ) ( not ( = ?auto_254055 ?auto_254057 ) ) ( not ( = ?auto_254061 ?auto_254058 ) ) ( HOIST-AT ?auto_254059 ?auto_254061 ) ( not ( = ?auto_254062 ?auto_254059 ) ) ( AVAILABLE ?auto_254059 ) ( SURFACE-AT ?auto_254057 ?auto_254061 ) ( ON ?auto_254057 ?auto_254060 ) ( CLEAR ?auto_254057 ) ( not ( = ?auto_254056 ?auto_254060 ) ) ( not ( = ?auto_254057 ?auto_254060 ) ) ( not ( = ?auto_254055 ?auto_254060 ) ) ( TRUCK-AT ?auto_254063 ?auto_254058 ) ( SURFACE-AT ?auto_254055 ?auto_254058 ) ( CLEAR ?auto_254055 ) ( LIFTING ?auto_254062 ?auto_254056 ) ( IS-CRATE ?auto_254056 ) ( ON ?auto_254050 ?auto_254049 ) ( ON ?auto_254051 ?auto_254050 ) ( ON ?auto_254053 ?auto_254051 ) ( ON ?auto_254052 ?auto_254053 ) ( ON ?auto_254054 ?auto_254052 ) ( ON ?auto_254055 ?auto_254054 ) ( not ( = ?auto_254049 ?auto_254050 ) ) ( not ( = ?auto_254049 ?auto_254051 ) ) ( not ( = ?auto_254049 ?auto_254053 ) ) ( not ( = ?auto_254049 ?auto_254052 ) ) ( not ( = ?auto_254049 ?auto_254054 ) ) ( not ( = ?auto_254049 ?auto_254055 ) ) ( not ( = ?auto_254049 ?auto_254056 ) ) ( not ( = ?auto_254049 ?auto_254057 ) ) ( not ( = ?auto_254049 ?auto_254060 ) ) ( not ( = ?auto_254050 ?auto_254051 ) ) ( not ( = ?auto_254050 ?auto_254053 ) ) ( not ( = ?auto_254050 ?auto_254052 ) ) ( not ( = ?auto_254050 ?auto_254054 ) ) ( not ( = ?auto_254050 ?auto_254055 ) ) ( not ( = ?auto_254050 ?auto_254056 ) ) ( not ( = ?auto_254050 ?auto_254057 ) ) ( not ( = ?auto_254050 ?auto_254060 ) ) ( not ( = ?auto_254051 ?auto_254053 ) ) ( not ( = ?auto_254051 ?auto_254052 ) ) ( not ( = ?auto_254051 ?auto_254054 ) ) ( not ( = ?auto_254051 ?auto_254055 ) ) ( not ( = ?auto_254051 ?auto_254056 ) ) ( not ( = ?auto_254051 ?auto_254057 ) ) ( not ( = ?auto_254051 ?auto_254060 ) ) ( not ( = ?auto_254053 ?auto_254052 ) ) ( not ( = ?auto_254053 ?auto_254054 ) ) ( not ( = ?auto_254053 ?auto_254055 ) ) ( not ( = ?auto_254053 ?auto_254056 ) ) ( not ( = ?auto_254053 ?auto_254057 ) ) ( not ( = ?auto_254053 ?auto_254060 ) ) ( not ( = ?auto_254052 ?auto_254054 ) ) ( not ( = ?auto_254052 ?auto_254055 ) ) ( not ( = ?auto_254052 ?auto_254056 ) ) ( not ( = ?auto_254052 ?auto_254057 ) ) ( not ( = ?auto_254052 ?auto_254060 ) ) ( not ( = ?auto_254054 ?auto_254055 ) ) ( not ( = ?auto_254054 ?auto_254056 ) ) ( not ( = ?auto_254054 ?auto_254057 ) ) ( not ( = ?auto_254054 ?auto_254060 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254055 ?auto_254056 ?auto_254057 )
      ( MAKE-8CRATE-VERIFY ?auto_254049 ?auto_254050 ?auto_254051 ?auto_254053 ?auto_254052 ?auto_254054 ?auto_254055 ?auto_254056 ?auto_254057 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_254142 - SURFACE
      ?auto_254143 - SURFACE
      ?auto_254144 - SURFACE
      ?auto_254146 - SURFACE
      ?auto_254145 - SURFACE
      ?auto_254147 - SURFACE
      ?auto_254148 - SURFACE
      ?auto_254149 - SURFACE
      ?auto_254150 - SURFACE
    )
    :vars
    (
      ?auto_254152 - HOIST
      ?auto_254155 - PLACE
      ?auto_254151 - PLACE
      ?auto_254154 - HOIST
      ?auto_254153 - SURFACE
      ?auto_254156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_254152 ?auto_254155 ) ( IS-CRATE ?auto_254150 ) ( not ( = ?auto_254149 ?auto_254150 ) ) ( not ( = ?auto_254148 ?auto_254149 ) ) ( not ( = ?auto_254148 ?auto_254150 ) ) ( not ( = ?auto_254151 ?auto_254155 ) ) ( HOIST-AT ?auto_254154 ?auto_254151 ) ( not ( = ?auto_254152 ?auto_254154 ) ) ( AVAILABLE ?auto_254154 ) ( SURFACE-AT ?auto_254150 ?auto_254151 ) ( ON ?auto_254150 ?auto_254153 ) ( CLEAR ?auto_254150 ) ( not ( = ?auto_254149 ?auto_254153 ) ) ( not ( = ?auto_254150 ?auto_254153 ) ) ( not ( = ?auto_254148 ?auto_254153 ) ) ( TRUCK-AT ?auto_254156 ?auto_254155 ) ( SURFACE-AT ?auto_254148 ?auto_254155 ) ( CLEAR ?auto_254148 ) ( IS-CRATE ?auto_254149 ) ( AVAILABLE ?auto_254152 ) ( IN ?auto_254149 ?auto_254156 ) ( ON ?auto_254143 ?auto_254142 ) ( ON ?auto_254144 ?auto_254143 ) ( ON ?auto_254146 ?auto_254144 ) ( ON ?auto_254145 ?auto_254146 ) ( ON ?auto_254147 ?auto_254145 ) ( ON ?auto_254148 ?auto_254147 ) ( not ( = ?auto_254142 ?auto_254143 ) ) ( not ( = ?auto_254142 ?auto_254144 ) ) ( not ( = ?auto_254142 ?auto_254146 ) ) ( not ( = ?auto_254142 ?auto_254145 ) ) ( not ( = ?auto_254142 ?auto_254147 ) ) ( not ( = ?auto_254142 ?auto_254148 ) ) ( not ( = ?auto_254142 ?auto_254149 ) ) ( not ( = ?auto_254142 ?auto_254150 ) ) ( not ( = ?auto_254142 ?auto_254153 ) ) ( not ( = ?auto_254143 ?auto_254144 ) ) ( not ( = ?auto_254143 ?auto_254146 ) ) ( not ( = ?auto_254143 ?auto_254145 ) ) ( not ( = ?auto_254143 ?auto_254147 ) ) ( not ( = ?auto_254143 ?auto_254148 ) ) ( not ( = ?auto_254143 ?auto_254149 ) ) ( not ( = ?auto_254143 ?auto_254150 ) ) ( not ( = ?auto_254143 ?auto_254153 ) ) ( not ( = ?auto_254144 ?auto_254146 ) ) ( not ( = ?auto_254144 ?auto_254145 ) ) ( not ( = ?auto_254144 ?auto_254147 ) ) ( not ( = ?auto_254144 ?auto_254148 ) ) ( not ( = ?auto_254144 ?auto_254149 ) ) ( not ( = ?auto_254144 ?auto_254150 ) ) ( not ( = ?auto_254144 ?auto_254153 ) ) ( not ( = ?auto_254146 ?auto_254145 ) ) ( not ( = ?auto_254146 ?auto_254147 ) ) ( not ( = ?auto_254146 ?auto_254148 ) ) ( not ( = ?auto_254146 ?auto_254149 ) ) ( not ( = ?auto_254146 ?auto_254150 ) ) ( not ( = ?auto_254146 ?auto_254153 ) ) ( not ( = ?auto_254145 ?auto_254147 ) ) ( not ( = ?auto_254145 ?auto_254148 ) ) ( not ( = ?auto_254145 ?auto_254149 ) ) ( not ( = ?auto_254145 ?auto_254150 ) ) ( not ( = ?auto_254145 ?auto_254153 ) ) ( not ( = ?auto_254147 ?auto_254148 ) ) ( not ( = ?auto_254147 ?auto_254149 ) ) ( not ( = ?auto_254147 ?auto_254150 ) ) ( not ( = ?auto_254147 ?auto_254153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_254148 ?auto_254149 ?auto_254150 )
      ( MAKE-8CRATE-VERIFY ?auto_254142 ?auto_254143 ?auto_254144 ?auto_254146 ?auto_254145 ?auto_254147 ?auto_254148 ?auto_254149 ?auto_254150 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258229 - SURFACE
      ?auto_258230 - SURFACE
      ?auto_258231 - SURFACE
      ?auto_258233 - SURFACE
      ?auto_258232 - SURFACE
      ?auto_258234 - SURFACE
      ?auto_258235 - SURFACE
      ?auto_258236 - SURFACE
      ?auto_258237 - SURFACE
      ?auto_258238 - SURFACE
    )
    :vars
    (
      ?auto_258239 - HOIST
      ?auto_258240 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_258239 ?auto_258240 ) ( SURFACE-AT ?auto_258237 ?auto_258240 ) ( CLEAR ?auto_258237 ) ( LIFTING ?auto_258239 ?auto_258238 ) ( IS-CRATE ?auto_258238 ) ( not ( = ?auto_258237 ?auto_258238 ) ) ( ON ?auto_258230 ?auto_258229 ) ( ON ?auto_258231 ?auto_258230 ) ( ON ?auto_258233 ?auto_258231 ) ( ON ?auto_258232 ?auto_258233 ) ( ON ?auto_258234 ?auto_258232 ) ( ON ?auto_258235 ?auto_258234 ) ( ON ?auto_258236 ?auto_258235 ) ( ON ?auto_258237 ?auto_258236 ) ( not ( = ?auto_258229 ?auto_258230 ) ) ( not ( = ?auto_258229 ?auto_258231 ) ) ( not ( = ?auto_258229 ?auto_258233 ) ) ( not ( = ?auto_258229 ?auto_258232 ) ) ( not ( = ?auto_258229 ?auto_258234 ) ) ( not ( = ?auto_258229 ?auto_258235 ) ) ( not ( = ?auto_258229 ?auto_258236 ) ) ( not ( = ?auto_258229 ?auto_258237 ) ) ( not ( = ?auto_258229 ?auto_258238 ) ) ( not ( = ?auto_258230 ?auto_258231 ) ) ( not ( = ?auto_258230 ?auto_258233 ) ) ( not ( = ?auto_258230 ?auto_258232 ) ) ( not ( = ?auto_258230 ?auto_258234 ) ) ( not ( = ?auto_258230 ?auto_258235 ) ) ( not ( = ?auto_258230 ?auto_258236 ) ) ( not ( = ?auto_258230 ?auto_258237 ) ) ( not ( = ?auto_258230 ?auto_258238 ) ) ( not ( = ?auto_258231 ?auto_258233 ) ) ( not ( = ?auto_258231 ?auto_258232 ) ) ( not ( = ?auto_258231 ?auto_258234 ) ) ( not ( = ?auto_258231 ?auto_258235 ) ) ( not ( = ?auto_258231 ?auto_258236 ) ) ( not ( = ?auto_258231 ?auto_258237 ) ) ( not ( = ?auto_258231 ?auto_258238 ) ) ( not ( = ?auto_258233 ?auto_258232 ) ) ( not ( = ?auto_258233 ?auto_258234 ) ) ( not ( = ?auto_258233 ?auto_258235 ) ) ( not ( = ?auto_258233 ?auto_258236 ) ) ( not ( = ?auto_258233 ?auto_258237 ) ) ( not ( = ?auto_258233 ?auto_258238 ) ) ( not ( = ?auto_258232 ?auto_258234 ) ) ( not ( = ?auto_258232 ?auto_258235 ) ) ( not ( = ?auto_258232 ?auto_258236 ) ) ( not ( = ?auto_258232 ?auto_258237 ) ) ( not ( = ?auto_258232 ?auto_258238 ) ) ( not ( = ?auto_258234 ?auto_258235 ) ) ( not ( = ?auto_258234 ?auto_258236 ) ) ( not ( = ?auto_258234 ?auto_258237 ) ) ( not ( = ?auto_258234 ?auto_258238 ) ) ( not ( = ?auto_258235 ?auto_258236 ) ) ( not ( = ?auto_258235 ?auto_258237 ) ) ( not ( = ?auto_258235 ?auto_258238 ) ) ( not ( = ?auto_258236 ?auto_258237 ) ) ( not ( = ?auto_258236 ?auto_258238 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_258237 ?auto_258238 )
      ( MAKE-9CRATE-VERIFY ?auto_258229 ?auto_258230 ?auto_258231 ?auto_258233 ?auto_258232 ?auto_258234 ?auto_258235 ?auto_258236 ?auto_258237 ?auto_258238 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258309 - SURFACE
      ?auto_258310 - SURFACE
      ?auto_258311 - SURFACE
      ?auto_258313 - SURFACE
      ?auto_258312 - SURFACE
      ?auto_258314 - SURFACE
      ?auto_258315 - SURFACE
      ?auto_258316 - SURFACE
      ?auto_258317 - SURFACE
      ?auto_258318 - SURFACE
    )
    :vars
    (
      ?auto_258319 - HOIST
      ?auto_258321 - PLACE
      ?auto_258320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_258319 ?auto_258321 ) ( SURFACE-AT ?auto_258317 ?auto_258321 ) ( CLEAR ?auto_258317 ) ( IS-CRATE ?auto_258318 ) ( not ( = ?auto_258317 ?auto_258318 ) ) ( TRUCK-AT ?auto_258320 ?auto_258321 ) ( AVAILABLE ?auto_258319 ) ( IN ?auto_258318 ?auto_258320 ) ( ON ?auto_258317 ?auto_258316 ) ( not ( = ?auto_258316 ?auto_258317 ) ) ( not ( = ?auto_258316 ?auto_258318 ) ) ( ON ?auto_258310 ?auto_258309 ) ( ON ?auto_258311 ?auto_258310 ) ( ON ?auto_258313 ?auto_258311 ) ( ON ?auto_258312 ?auto_258313 ) ( ON ?auto_258314 ?auto_258312 ) ( ON ?auto_258315 ?auto_258314 ) ( ON ?auto_258316 ?auto_258315 ) ( not ( = ?auto_258309 ?auto_258310 ) ) ( not ( = ?auto_258309 ?auto_258311 ) ) ( not ( = ?auto_258309 ?auto_258313 ) ) ( not ( = ?auto_258309 ?auto_258312 ) ) ( not ( = ?auto_258309 ?auto_258314 ) ) ( not ( = ?auto_258309 ?auto_258315 ) ) ( not ( = ?auto_258309 ?auto_258316 ) ) ( not ( = ?auto_258309 ?auto_258317 ) ) ( not ( = ?auto_258309 ?auto_258318 ) ) ( not ( = ?auto_258310 ?auto_258311 ) ) ( not ( = ?auto_258310 ?auto_258313 ) ) ( not ( = ?auto_258310 ?auto_258312 ) ) ( not ( = ?auto_258310 ?auto_258314 ) ) ( not ( = ?auto_258310 ?auto_258315 ) ) ( not ( = ?auto_258310 ?auto_258316 ) ) ( not ( = ?auto_258310 ?auto_258317 ) ) ( not ( = ?auto_258310 ?auto_258318 ) ) ( not ( = ?auto_258311 ?auto_258313 ) ) ( not ( = ?auto_258311 ?auto_258312 ) ) ( not ( = ?auto_258311 ?auto_258314 ) ) ( not ( = ?auto_258311 ?auto_258315 ) ) ( not ( = ?auto_258311 ?auto_258316 ) ) ( not ( = ?auto_258311 ?auto_258317 ) ) ( not ( = ?auto_258311 ?auto_258318 ) ) ( not ( = ?auto_258313 ?auto_258312 ) ) ( not ( = ?auto_258313 ?auto_258314 ) ) ( not ( = ?auto_258313 ?auto_258315 ) ) ( not ( = ?auto_258313 ?auto_258316 ) ) ( not ( = ?auto_258313 ?auto_258317 ) ) ( not ( = ?auto_258313 ?auto_258318 ) ) ( not ( = ?auto_258312 ?auto_258314 ) ) ( not ( = ?auto_258312 ?auto_258315 ) ) ( not ( = ?auto_258312 ?auto_258316 ) ) ( not ( = ?auto_258312 ?auto_258317 ) ) ( not ( = ?auto_258312 ?auto_258318 ) ) ( not ( = ?auto_258314 ?auto_258315 ) ) ( not ( = ?auto_258314 ?auto_258316 ) ) ( not ( = ?auto_258314 ?auto_258317 ) ) ( not ( = ?auto_258314 ?auto_258318 ) ) ( not ( = ?auto_258315 ?auto_258316 ) ) ( not ( = ?auto_258315 ?auto_258317 ) ) ( not ( = ?auto_258315 ?auto_258318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258316 ?auto_258317 ?auto_258318 )
      ( MAKE-9CRATE-VERIFY ?auto_258309 ?auto_258310 ?auto_258311 ?auto_258313 ?auto_258312 ?auto_258314 ?auto_258315 ?auto_258316 ?auto_258317 ?auto_258318 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258399 - SURFACE
      ?auto_258400 - SURFACE
      ?auto_258401 - SURFACE
      ?auto_258403 - SURFACE
      ?auto_258402 - SURFACE
      ?auto_258404 - SURFACE
      ?auto_258405 - SURFACE
      ?auto_258406 - SURFACE
      ?auto_258407 - SURFACE
      ?auto_258408 - SURFACE
    )
    :vars
    (
      ?auto_258410 - HOIST
      ?auto_258412 - PLACE
      ?auto_258411 - TRUCK
      ?auto_258409 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_258410 ?auto_258412 ) ( SURFACE-AT ?auto_258407 ?auto_258412 ) ( CLEAR ?auto_258407 ) ( IS-CRATE ?auto_258408 ) ( not ( = ?auto_258407 ?auto_258408 ) ) ( AVAILABLE ?auto_258410 ) ( IN ?auto_258408 ?auto_258411 ) ( ON ?auto_258407 ?auto_258406 ) ( not ( = ?auto_258406 ?auto_258407 ) ) ( not ( = ?auto_258406 ?auto_258408 ) ) ( TRUCK-AT ?auto_258411 ?auto_258409 ) ( not ( = ?auto_258409 ?auto_258412 ) ) ( ON ?auto_258400 ?auto_258399 ) ( ON ?auto_258401 ?auto_258400 ) ( ON ?auto_258403 ?auto_258401 ) ( ON ?auto_258402 ?auto_258403 ) ( ON ?auto_258404 ?auto_258402 ) ( ON ?auto_258405 ?auto_258404 ) ( ON ?auto_258406 ?auto_258405 ) ( not ( = ?auto_258399 ?auto_258400 ) ) ( not ( = ?auto_258399 ?auto_258401 ) ) ( not ( = ?auto_258399 ?auto_258403 ) ) ( not ( = ?auto_258399 ?auto_258402 ) ) ( not ( = ?auto_258399 ?auto_258404 ) ) ( not ( = ?auto_258399 ?auto_258405 ) ) ( not ( = ?auto_258399 ?auto_258406 ) ) ( not ( = ?auto_258399 ?auto_258407 ) ) ( not ( = ?auto_258399 ?auto_258408 ) ) ( not ( = ?auto_258400 ?auto_258401 ) ) ( not ( = ?auto_258400 ?auto_258403 ) ) ( not ( = ?auto_258400 ?auto_258402 ) ) ( not ( = ?auto_258400 ?auto_258404 ) ) ( not ( = ?auto_258400 ?auto_258405 ) ) ( not ( = ?auto_258400 ?auto_258406 ) ) ( not ( = ?auto_258400 ?auto_258407 ) ) ( not ( = ?auto_258400 ?auto_258408 ) ) ( not ( = ?auto_258401 ?auto_258403 ) ) ( not ( = ?auto_258401 ?auto_258402 ) ) ( not ( = ?auto_258401 ?auto_258404 ) ) ( not ( = ?auto_258401 ?auto_258405 ) ) ( not ( = ?auto_258401 ?auto_258406 ) ) ( not ( = ?auto_258401 ?auto_258407 ) ) ( not ( = ?auto_258401 ?auto_258408 ) ) ( not ( = ?auto_258403 ?auto_258402 ) ) ( not ( = ?auto_258403 ?auto_258404 ) ) ( not ( = ?auto_258403 ?auto_258405 ) ) ( not ( = ?auto_258403 ?auto_258406 ) ) ( not ( = ?auto_258403 ?auto_258407 ) ) ( not ( = ?auto_258403 ?auto_258408 ) ) ( not ( = ?auto_258402 ?auto_258404 ) ) ( not ( = ?auto_258402 ?auto_258405 ) ) ( not ( = ?auto_258402 ?auto_258406 ) ) ( not ( = ?auto_258402 ?auto_258407 ) ) ( not ( = ?auto_258402 ?auto_258408 ) ) ( not ( = ?auto_258404 ?auto_258405 ) ) ( not ( = ?auto_258404 ?auto_258406 ) ) ( not ( = ?auto_258404 ?auto_258407 ) ) ( not ( = ?auto_258404 ?auto_258408 ) ) ( not ( = ?auto_258405 ?auto_258406 ) ) ( not ( = ?auto_258405 ?auto_258407 ) ) ( not ( = ?auto_258405 ?auto_258408 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258406 ?auto_258407 ?auto_258408 )
      ( MAKE-9CRATE-VERIFY ?auto_258399 ?auto_258400 ?auto_258401 ?auto_258403 ?auto_258402 ?auto_258404 ?auto_258405 ?auto_258406 ?auto_258407 ?auto_258408 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258498 - SURFACE
      ?auto_258499 - SURFACE
      ?auto_258500 - SURFACE
      ?auto_258502 - SURFACE
      ?auto_258501 - SURFACE
      ?auto_258503 - SURFACE
      ?auto_258504 - SURFACE
      ?auto_258505 - SURFACE
      ?auto_258506 - SURFACE
      ?auto_258507 - SURFACE
    )
    :vars
    (
      ?auto_258509 - HOIST
      ?auto_258511 - PLACE
      ?auto_258508 - TRUCK
      ?auto_258510 - PLACE
      ?auto_258512 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_258509 ?auto_258511 ) ( SURFACE-AT ?auto_258506 ?auto_258511 ) ( CLEAR ?auto_258506 ) ( IS-CRATE ?auto_258507 ) ( not ( = ?auto_258506 ?auto_258507 ) ) ( AVAILABLE ?auto_258509 ) ( ON ?auto_258506 ?auto_258505 ) ( not ( = ?auto_258505 ?auto_258506 ) ) ( not ( = ?auto_258505 ?auto_258507 ) ) ( TRUCK-AT ?auto_258508 ?auto_258510 ) ( not ( = ?auto_258510 ?auto_258511 ) ) ( HOIST-AT ?auto_258512 ?auto_258510 ) ( LIFTING ?auto_258512 ?auto_258507 ) ( not ( = ?auto_258509 ?auto_258512 ) ) ( ON ?auto_258499 ?auto_258498 ) ( ON ?auto_258500 ?auto_258499 ) ( ON ?auto_258502 ?auto_258500 ) ( ON ?auto_258501 ?auto_258502 ) ( ON ?auto_258503 ?auto_258501 ) ( ON ?auto_258504 ?auto_258503 ) ( ON ?auto_258505 ?auto_258504 ) ( not ( = ?auto_258498 ?auto_258499 ) ) ( not ( = ?auto_258498 ?auto_258500 ) ) ( not ( = ?auto_258498 ?auto_258502 ) ) ( not ( = ?auto_258498 ?auto_258501 ) ) ( not ( = ?auto_258498 ?auto_258503 ) ) ( not ( = ?auto_258498 ?auto_258504 ) ) ( not ( = ?auto_258498 ?auto_258505 ) ) ( not ( = ?auto_258498 ?auto_258506 ) ) ( not ( = ?auto_258498 ?auto_258507 ) ) ( not ( = ?auto_258499 ?auto_258500 ) ) ( not ( = ?auto_258499 ?auto_258502 ) ) ( not ( = ?auto_258499 ?auto_258501 ) ) ( not ( = ?auto_258499 ?auto_258503 ) ) ( not ( = ?auto_258499 ?auto_258504 ) ) ( not ( = ?auto_258499 ?auto_258505 ) ) ( not ( = ?auto_258499 ?auto_258506 ) ) ( not ( = ?auto_258499 ?auto_258507 ) ) ( not ( = ?auto_258500 ?auto_258502 ) ) ( not ( = ?auto_258500 ?auto_258501 ) ) ( not ( = ?auto_258500 ?auto_258503 ) ) ( not ( = ?auto_258500 ?auto_258504 ) ) ( not ( = ?auto_258500 ?auto_258505 ) ) ( not ( = ?auto_258500 ?auto_258506 ) ) ( not ( = ?auto_258500 ?auto_258507 ) ) ( not ( = ?auto_258502 ?auto_258501 ) ) ( not ( = ?auto_258502 ?auto_258503 ) ) ( not ( = ?auto_258502 ?auto_258504 ) ) ( not ( = ?auto_258502 ?auto_258505 ) ) ( not ( = ?auto_258502 ?auto_258506 ) ) ( not ( = ?auto_258502 ?auto_258507 ) ) ( not ( = ?auto_258501 ?auto_258503 ) ) ( not ( = ?auto_258501 ?auto_258504 ) ) ( not ( = ?auto_258501 ?auto_258505 ) ) ( not ( = ?auto_258501 ?auto_258506 ) ) ( not ( = ?auto_258501 ?auto_258507 ) ) ( not ( = ?auto_258503 ?auto_258504 ) ) ( not ( = ?auto_258503 ?auto_258505 ) ) ( not ( = ?auto_258503 ?auto_258506 ) ) ( not ( = ?auto_258503 ?auto_258507 ) ) ( not ( = ?auto_258504 ?auto_258505 ) ) ( not ( = ?auto_258504 ?auto_258506 ) ) ( not ( = ?auto_258504 ?auto_258507 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258505 ?auto_258506 ?auto_258507 )
      ( MAKE-9CRATE-VERIFY ?auto_258498 ?auto_258499 ?auto_258500 ?auto_258502 ?auto_258501 ?auto_258503 ?auto_258504 ?auto_258505 ?auto_258506 ?auto_258507 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258606 - SURFACE
      ?auto_258607 - SURFACE
      ?auto_258608 - SURFACE
      ?auto_258610 - SURFACE
      ?auto_258609 - SURFACE
      ?auto_258611 - SURFACE
      ?auto_258612 - SURFACE
      ?auto_258613 - SURFACE
      ?auto_258614 - SURFACE
      ?auto_258615 - SURFACE
    )
    :vars
    (
      ?auto_258617 - HOIST
      ?auto_258619 - PLACE
      ?auto_258620 - TRUCK
      ?auto_258616 - PLACE
      ?auto_258621 - HOIST
      ?auto_258618 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_258617 ?auto_258619 ) ( SURFACE-AT ?auto_258614 ?auto_258619 ) ( CLEAR ?auto_258614 ) ( IS-CRATE ?auto_258615 ) ( not ( = ?auto_258614 ?auto_258615 ) ) ( AVAILABLE ?auto_258617 ) ( ON ?auto_258614 ?auto_258613 ) ( not ( = ?auto_258613 ?auto_258614 ) ) ( not ( = ?auto_258613 ?auto_258615 ) ) ( TRUCK-AT ?auto_258620 ?auto_258616 ) ( not ( = ?auto_258616 ?auto_258619 ) ) ( HOIST-AT ?auto_258621 ?auto_258616 ) ( not ( = ?auto_258617 ?auto_258621 ) ) ( AVAILABLE ?auto_258621 ) ( SURFACE-AT ?auto_258615 ?auto_258616 ) ( ON ?auto_258615 ?auto_258618 ) ( CLEAR ?auto_258615 ) ( not ( = ?auto_258614 ?auto_258618 ) ) ( not ( = ?auto_258615 ?auto_258618 ) ) ( not ( = ?auto_258613 ?auto_258618 ) ) ( ON ?auto_258607 ?auto_258606 ) ( ON ?auto_258608 ?auto_258607 ) ( ON ?auto_258610 ?auto_258608 ) ( ON ?auto_258609 ?auto_258610 ) ( ON ?auto_258611 ?auto_258609 ) ( ON ?auto_258612 ?auto_258611 ) ( ON ?auto_258613 ?auto_258612 ) ( not ( = ?auto_258606 ?auto_258607 ) ) ( not ( = ?auto_258606 ?auto_258608 ) ) ( not ( = ?auto_258606 ?auto_258610 ) ) ( not ( = ?auto_258606 ?auto_258609 ) ) ( not ( = ?auto_258606 ?auto_258611 ) ) ( not ( = ?auto_258606 ?auto_258612 ) ) ( not ( = ?auto_258606 ?auto_258613 ) ) ( not ( = ?auto_258606 ?auto_258614 ) ) ( not ( = ?auto_258606 ?auto_258615 ) ) ( not ( = ?auto_258606 ?auto_258618 ) ) ( not ( = ?auto_258607 ?auto_258608 ) ) ( not ( = ?auto_258607 ?auto_258610 ) ) ( not ( = ?auto_258607 ?auto_258609 ) ) ( not ( = ?auto_258607 ?auto_258611 ) ) ( not ( = ?auto_258607 ?auto_258612 ) ) ( not ( = ?auto_258607 ?auto_258613 ) ) ( not ( = ?auto_258607 ?auto_258614 ) ) ( not ( = ?auto_258607 ?auto_258615 ) ) ( not ( = ?auto_258607 ?auto_258618 ) ) ( not ( = ?auto_258608 ?auto_258610 ) ) ( not ( = ?auto_258608 ?auto_258609 ) ) ( not ( = ?auto_258608 ?auto_258611 ) ) ( not ( = ?auto_258608 ?auto_258612 ) ) ( not ( = ?auto_258608 ?auto_258613 ) ) ( not ( = ?auto_258608 ?auto_258614 ) ) ( not ( = ?auto_258608 ?auto_258615 ) ) ( not ( = ?auto_258608 ?auto_258618 ) ) ( not ( = ?auto_258610 ?auto_258609 ) ) ( not ( = ?auto_258610 ?auto_258611 ) ) ( not ( = ?auto_258610 ?auto_258612 ) ) ( not ( = ?auto_258610 ?auto_258613 ) ) ( not ( = ?auto_258610 ?auto_258614 ) ) ( not ( = ?auto_258610 ?auto_258615 ) ) ( not ( = ?auto_258610 ?auto_258618 ) ) ( not ( = ?auto_258609 ?auto_258611 ) ) ( not ( = ?auto_258609 ?auto_258612 ) ) ( not ( = ?auto_258609 ?auto_258613 ) ) ( not ( = ?auto_258609 ?auto_258614 ) ) ( not ( = ?auto_258609 ?auto_258615 ) ) ( not ( = ?auto_258609 ?auto_258618 ) ) ( not ( = ?auto_258611 ?auto_258612 ) ) ( not ( = ?auto_258611 ?auto_258613 ) ) ( not ( = ?auto_258611 ?auto_258614 ) ) ( not ( = ?auto_258611 ?auto_258615 ) ) ( not ( = ?auto_258611 ?auto_258618 ) ) ( not ( = ?auto_258612 ?auto_258613 ) ) ( not ( = ?auto_258612 ?auto_258614 ) ) ( not ( = ?auto_258612 ?auto_258615 ) ) ( not ( = ?auto_258612 ?auto_258618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258613 ?auto_258614 ?auto_258615 )
      ( MAKE-9CRATE-VERIFY ?auto_258606 ?auto_258607 ?auto_258608 ?auto_258610 ?auto_258609 ?auto_258611 ?auto_258612 ?auto_258613 ?auto_258614 ?auto_258615 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258715 - SURFACE
      ?auto_258716 - SURFACE
      ?auto_258717 - SURFACE
      ?auto_258719 - SURFACE
      ?auto_258718 - SURFACE
      ?auto_258720 - SURFACE
      ?auto_258721 - SURFACE
      ?auto_258722 - SURFACE
      ?auto_258723 - SURFACE
      ?auto_258724 - SURFACE
    )
    :vars
    (
      ?auto_258728 - HOIST
      ?auto_258729 - PLACE
      ?auto_258726 - PLACE
      ?auto_258730 - HOIST
      ?auto_258725 - SURFACE
      ?auto_258727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_258728 ?auto_258729 ) ( SURFACE-AT ?auto_258723 ?auto_258729 ) ( CLEAR ?auto_258723 ) ( IS-CRATE ?auto_258724 ) ( not ( = ?auto_258723 ?auto_258724 ) ) ( AVAILABLE ?auto_258728 ) ( ON ?auto_258723 ?auto_258722 ) ( not ( = ?auto_258722 ?auto_258723 ) ) ( not ( = ?auto_258722 ?auto_258724 ) ) ( not ( = ?auto_258726 ?auto_258729 ) ) ( HOIST-AT ?auto_258730 ?auto_258726 ) ( not ( = ?auto_258728 ?auto_258730 ) ) ( AVAILABLE ?auto_258730 ) ( SURFACE-AT ?auto_258724 ?auto_258726 ) ( ON ?auto_258724 ?auto_258725 ) ( CLEAR ?auto_258724 ) ( not ( = ?auto_258723 ?auto_258725 ) ) ( not ( = ?auto_258724 ?auto_258725 ) ) ( not ( = ?auto_258722 ?auto_258725 ) ) ( TRUCK-AT ?auto_258727 ?auto_258729 ) ( ON ?auto_258716 ?auto_258715 ) ( ON ?auto_258717 ?auto_258716 ) ( ON ?auto_258719 ?auto_258717 ) ( ON ?auto_258718 ?auto_258719 ) ( ON ?auto_258720 ?auto_258718 ) ( ON ?auto_258721 ?auto_258720 ) ( ON ?auto_258722 ?auto_258721 ) ( not ( = ?auto_258715 ?auto_258716 ) ) ( not ( = ?auto_258715 ?auto_258717 ) ) ( not ( = ?auto_258715 ?auto_258719 ) ) ( not ( = ?auto_258715 ?auto_258718 ) ) ( not ( = ?auto_258715 ?auto_258720 ) ) ( not ( = ?auto_258715 ?auto_258721 ) ) ( not ( = ?auto_258715 ?auto_258722 ) ) ( not ( = ?auto_258715 ?auto_258723 ) ) ( not ( = ?auto_258715 ?auto_258724 ) ) ( not ( = ?auto_258715 ?auto_258725 ) ) ( not ( = ?auto_258716 ?auto_258717 ) ) ( not ( = ?auto_258716 ?auto_258719 ) ) ( not ( = ?auto_258716 ?auto_258718 ) ) ( not ( = ?auto_258716 ?auto_258720 ) ) ( not ( = ?auto_258716 ?auto_258721 ) ) ( not ( = ?auto_258716 ?auto_258722 ) ) ( not ( = ?auto_258716 ?auto_258723 ) ) ( not ( = ?auto_258716 ?auto_258724 ) ) ( not ( = ?auto_258716 ?auto_258725 ) ) ( not ( = ?auto_258717 ?auto_258719 ) ) ( not ( = ?auto_258717 ?auto_258718 ) ) ( not ( = ?auto_258717 ?auto_258720 ) ) ( not ( = ?auto_258717 ?auto_258721 ) ) ( not ( = ?auto_258717 ?auto_258722 ) ) ( not ( = ?auto_258717 ?auto_258723 ) ) ( not ( = ?auto_258717 ?auto_258724 ) ) ( not ( = ?auto_258717 ?auto_258725 ) ) ( not ( = ?auto_258719 ?auto_258718 ) ) ( not ( = ?auto_258719 ?auto_258720 ) ) ( not ( = ?auto_258719 ?auto_258721 ) ) ( not ( = ?auto_258719 ?auto_258722 ) ) ( not ( = ?auto_258719 ?auto_258723 ) ) ( not ( = ?auto_258719 ?auto_258724 ) ) ( not ( = ?auto_258719 ?auto_258725 ) ) ( not ( = ?auto_258718 ?auto_258720 ) ) ( not ( = ?auto_258718 ?auto_258721 ) ) ( not ( = ?auto_258718 ?auto_258722 ) ) ( not ( = ?auto_258718 ?auto_258723 ) ) ( not ( = ?auto_258718 ?auto_258724 ) ) ( not ( = ?auto_258718 ?auto_258725 ) ) ( not ( = ?auto_258720 ?auto_258721 ) ) ( not ( = ?auto_258720 ?auto_258722 ) ) ( not ( = ?auto_258720 ?auto_258723 ) ) ( not ( = ?auto_258720 ?auto_258724 ) ) ( not ( = ?auto_258720 ?auto_258725 ) ) ( not ( = ?auto_258721 ?auto_258722 ) ) ( not ( = ?auto_258721 ?auto_258723 ) ) ( not ( = ?auto_258721 ?auto_258724 ) ) ( not ( = ?auto_258721 ?auto_258725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258722 ?auto_258723 ?auto_258724 )
      ( MAKE-9CRATE-VERIFY ?auto_258715 ?auto_258716 ?auto_258717 ?auto_258719 ?auto_258718 ?auto_258720 ?auto_258721 ?auto_258722 ?auto_258723 ?auto_258724 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258824 - SURFACE
      ?auto_258825 - SURFACE
      ?auto_258826 - SURFACE
      ?auto_258828 - SURFACE
      ?auto_258827 - SURFACE
      ?auto_258829 - SURFACE
      ?auto_258830 - SURFACE
      ?auto_258831 - SURFACE
      ?auto_258832 - SURFACE
      ?auto_258833 - SURFACE
    )
    :vars
    (
      ?auto_258834 - HOIST
      ?auto_258838 - PLACE
      ?auto_258835 - PLACE
      ?auto_258839 - HOIST
      ?auto_258836 - SURFACE
      ?auto_258837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_258834 ?auto_258838 ) ( IS-CRATE ?auto_258833 ) ( not ( = ?auto_258832 ?auto_258833 ) ) ( not ( = ?auto_258831 ?auto_258832 ) ) ( not ( = ?auto_258831 ?auto_258833 ) ) ( not ( = ?auto_258835 ?auto_258838 ) ) ( HOIST-AT ?auto_258839 ?auto_258835 ) ( not ( = ?auto_258834 ?auto_258839 ) ) ( AVAILABLE ?auto_258839 ) ( SURFACE-AT ?auto_258833 ?auto_258835 ) ( ON ?auto_258833 ?auto_258836 ) ( CLEAR ?auto_258833 ) ( not ( = ?auto_258832 ?auto_258836 ) ) ( not ( = ?auto_258833 ?auto_258836 ) ) ( not ( = ?auto_258831 ?auto_258836 ) ) ( TRUCK-AT ?auto_258837 ?auto_258838 ) ( SURFACE-AT ?auto_258831 ?auto_258838 ) ( CLEAR ?auto_258831 ) ( LIFTING ?auto_258834 ?auto_258832 ) ( IS-CRATE ?auto_258832 ) ( ON ?auto_258825 ?auto_258824 ) ( ON ?auto_258826 ?auto_258825 ) ( ON ?auto_258828 ?auto_258826 ) ( ON ?auto_258827 ?auto_258828 ) ( ON ?auto_258829 ?auto_258827 ) ( ON ?auto_258830 ?auto_258829 ) ( ON ?auto_258831 ?auto_258830 ) ( not ( = ?auto_258824 ?auto_258825 ) ) ( not ( = ?auto_258824 ?auto_258826 ) ) ( not ( = ?auto_258824 ?auto_258828 ) ) ( not ( = ?auto_258824 ?auto_258827 ) ) ( not ( = ?auto_258824 ?auto_258829 ) ) ( not ( = ?auto_258824 ?auto_258830 ) ) ( not ( = ?auto_258824 ?auto_258831 ) ) ( not ( = ?auto_258824 ?auto_258832 ) ) ( not ( = ?auto_258824 ?auto_258833 ) ) ( not ( = ?auto_258824 ?auto_258836 ) ) ( not ( = ?auto_258825 ?auto_258826 ) ) ( not ( = ?auto_258825 ?auto_258828 ) ) ( not ( = ?auto_258825 ?auto_258827 ) ) ( not ( = ?auto_258825 ?auto_258829 ) ) ( not ( = ?auto_258825 ?auto_258830 ) ) ( not ( = ?auto_258825 ?auto_258831 ) ) ( not ( = ?auto_258825 ?auto_258832 ) ) ( not ( = ?auto_258825 ?auto_258833 ) ) ( not ( = ?auto_258825 ?auto_258836 ) ) ( not ( = ?auto_258826 ?auto_258828 ) ) ( not ( = ?auto_258826 ?auto_258827 ) ) ( not ( = ?auto_258826 ?auto_258829 ) ) ( not ( = ?auto_258826 ?auto_258830 ) ) ( not ( = ?auto_258826 ?auto_258831 ) ) ( not ( = ?auto_258826 ?auto_258832 ) ) ( not ( = ?auto_258826 ?auto_258833 ) ) ( not ( = ?auto_258826 ?auto_258836 ) ) ( not ( = ?auto_258828 ?auto_258827 ) ) ( not ( = ?auto_258828 ?auto_258829 ) ) ( not ( = ?auto_258828 ?auto_258830 ) ) ( not ( = ?auto_258828 ?auto_258831 ) ) ( not ( = ?auto_258828 ?auto_258832 ) ) ( not ( = ?auto_258828 ?auto_258833 ) ) ( not ( = ?auto_258828 ?auto_258836 ) ) ( not ( = ?auto_258827 ?auto_258829 ) ) ( not ( = ?auto_258827 ?auto_258830 ) ) ( not ( = ?auto_258827 ?auto_258831 ) ) ( not ( = ?auto_258827 ?auto_258832 ) ) ( not ( = ?auto_258827 ?auto_258833 ) ) ( not ( = ?auto_258827 ?auto_258836 ) ) ( not ( = ?auto_258829 ?auto_258830 ) ) ( not ( = ?auto_258829 ?auto_258831 ) ) ( not ( = ?auto_258829 ?auto_258832 ) ) ( not ( = ?auto_258829 ?auto_258833 ) ) ( not ( = ?auto_258829 ?auto_258836 ) ) ( not ( = ?auto_258830 ?auto_258831 ) ) ( not ( = ?auto_258830 ?auto_258832 ) ) ( not ( = ?auto_258830 ?auto_258833 ) ) ( not ( = ?auto_258830 ?auto_258836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258831 ?auto_258832 ?auto_258833 )
      ( MAKE-9CRATE-VERIFY ?auto_258824 ?auto_258825 ?auto_258826 ?auto_258828 ?auto_258827 ?auto_258829 ?auto_258830 ?auto_258831 ?auto_258832 ?auto_258833 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_258933 - SURFACE
      ?auto_258934 - SURFACE
      ?auto_258935 - SURFACE
      ?auto_258937 - SURFACE
      ?auto_258936 - SURFACE
      ?auto_258938 - SURFACE
      ?auto_258939 - SURFACE
      ?auto_258940 - SURFACE
      ?auto_258941 - SURFACE
      ?auto_258942 - SURFACE
    )
    :vars
    (
      ?auto_258946 - HOIST
      ?auto_258947 - PLACE
      ?auto_258948 - PLACE
      ?auto_258945 - HOIST
      ?auto_258944 - SURFACE
      ?auto_258943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_258946 ?auto_258947 ) ( IS-CRATE ?auto_258942 ) ( not ( = ?auto_258941 ?auto_258942 ) ) ( not ( = ?auto_258940 ?auto_258941 ) ) ( not ( = ?auto_258940 ?auto_258942 ) ) ( not ( = ?auto_258948 ?auto_258947 ) ) ( HOIST-AT ?auto_258945 ?auto_258948 ) ( not ( = ?auto_258946 ?auto_258945 ) ) ( AVAILABLE ?auto_258945 ) ( SURFACE-AT ?auto_258942 ?auto_258948 ) ( ON ?auto_258942 ?auto_258944 ) ( CLEAR ?auto_258942 ) ( not ( = ?auto_258941 ?auto_258944 ) ) ( not ( = ?auto_258942 ?auto_258944 ) ) ( not ( = ?auto_258940 ?auto_258944 ) ) ( TRUCK-AT ?auto_258943 ?auto_258947 ) ( SURFACE-AT ?auto_258940 ?auto_258947 ) ( CLEAR ?auto_258940 ) ( IS-CRATE ?auto_258941 ) ( AVAILABLE ?auto_258946 ) ( IN ?auto_258941 ?auto_258943 ) ( ON ?auto_258934 ?auto_258933 ) ( ON ?auto_258935 ?auto_258934 ) ( ON ?auto_258937 ?auto_258935 ) ( ON ?auto_258936 ?auto_258937 ) ( ON ?auto_258938 ?auto_258936 ) ( ON ?auto_258939 ?auto_258938 ) ( ON ?auto_258940 ?auto_258939 ) ( not ( = ?auto_258933 ?auto_258934 ) ) ( not ( = ?auto_258933 ?auto_258935 ) ) ( not ( = ?auto_258933 ?auto_258937 ) ) ( not ( = ?auto_258933 ?auto_258936 ) ) ( not ( = ?auto_258933 ?auto_258938 ) ) ( not ( = ?auto_258933 ?auto_258939 ) ) ( not ( = ?auto_258933 ?auto_258940 ) ) ( not ( = ?auto_258933 ?auto_258941 ) ) ( not ( = ?auto_258933 ?auto_258942 ) ) ( not ( = ?auto_258933 ?auto_258944 ) ) ( not ( = ?auto_258934 ?auto_258935 ) ) ( not ( = ?auto_258934 ?auto_258937 ) ) ( not ( = ?auto_258934 ?auto_258936 ) ) ( not ( = ?auto_258934 ?auto_258938 ) ) ( not ( = ?auto_258934 ?auto_258939 ) ) ( not ( = ?auto_258934 ?auto_258940 ) ) ( not ( = ?auto_258934 ?auto_258941 ) ) ( not ( = ?auto_258934 ?auto_258942 ) ) ( not ( = ?auto_258934 ?auto_258944 ) ) ( not ( = ?auto_258935 ?auto_258937 ) ) ( not ( = ?auto_258935 ?auto_258936 ) ) ( not ( = ?auto_258935 ?auto_258938 ) ) ( not ( = ?auto_258935 ?auto_258939 ) ) ( not ( = ?auto_258935 ?auto_258940 ) ) ( not ( = ?auto_258935 ?auto_258941 ) ) ( not ( = ?auto_258935 ?auto_258942 ) ) ( not ( = ?auto_258935 ?auto_258944 ) ) ( not ( = ?auto_258937 ?auto_258936 ) ) ( not ( = ?auto_258937 ?auto_258938 ) ) ( not ( = ?auto_258937 ?auto_258939 ) ) ( not ( = ?auto_258937 ?auto_258940 ) ) ( not ( = ?auto_258937 ?auto_258941 ) ) ( not ( = ?auto_258937 ?auto_258942 ) ) ( not ( = ?auto_258937 ?auto_258944 ) ) ( not ( = ?auto_258936 ?auto_258938 ) ) ( not ( = ?auto_258936 ?auto_258939 ) ) ( not ( = ?auto_258936 ?auto_258940 ) ) ( not ( = ?auto_258936 ?auto_258941 ) ) ( not ( = ?auto_258936 ?auto_258942 ) ) ( not ( = ?auto_258936 ?auto_258944 ) ) ( not ( = ?auto_258938 ?auto_258939 ) ) ( not ( = ?auto_258938 ?auto_258940 ) ) ( not ( = ?auto_258938 ?auto_258941 ) ) ( not ( = ?auto_258938 ?auto_258942 ) ) ( not ( = ?auto_258938 ?auto_258944 ) ) ( not ( = ?auto_258939 ?auto_258940 ) ) ( not ( = ?auto_258939 ?auto_258941 ) ) ( not ( = ?auto_258939 ?auto_258942 ) ) ( not ( = ?auto_258939 ?auto_258944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_258940 ?auto_258941 ?auto_258942 )
      ( MAKE-9CRATE-VERIFY ?auto_258933 ?auto_258934 ?auto_258935 ?auto_258937 ?auto_258936 ?auto_258938 ?auto_258939 ?auto_258940 ?auto_258941 ?auto_258942 ) )
  )

)

