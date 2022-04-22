( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_386701 - BLOCK
    )
    :vars
    (
      ?auto_386702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386701 ?auto_386702 ) ( CLEAR ?auto_386701 ) ( HAND-EMPTY ) ( not ( = ?auto_386701 ?auto_386702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386701 ?auto_386702 )
      ( !PUTDOWN ?auto_386701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_386708 - BLOCK
      ?auto_386709 - BLOCK
    )
    :vars
    (
      ?auto_386710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386708 ) ( ON ?auto_386709 ?auto_386710 ) ( CLEAR ?auto_386709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386708 ) ( not ( = ?auto_386708 ?auto_386709 ) ) ( not ( = ?auto_386708 ?auto_386710 ) ) ( not ( = ?auto_386709 ?auto_386710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386709 ?auto_386710 )
      ( !STACK ?auto_386709 ?auto_386708 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_386718 - BLOCK
      ?auto_386719 - BLOCK
    )
    :vars
    (
      ?auto_386720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386719 ?auto_386720 ) ( not ( = ?auto_386718 ?auto_386719 ) ) ( not ( = ?auto_386718 ?auto_386720 ) ) ( not ( = ?auto_386719 ?auto_386720 ) ) ( ON ?auto_386718 ?auto_386719 ) ( CLEAR ?auto_386718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386718 )
      ( MAKE-2PILE ?auto_386718 ?auto_386719 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_386729 - BLOCK
      ?auto_386730 - BLOCK
      ?auto_386731 - BLOCK
    )
    :vars
    (
      ?auto_386732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386730 ) ( ON ?auto_386731 ?auto_386732 ) ( CLEAR ?auto_386731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386729 ) ( ON ?auto_386730 ?auto_386729 ) ( not ( = ?auto_386729 ?auto_386730 ) ) ( not ( = ?auto_386729 ?auto_386731 ) ) ( not ( = ?auto_386729 ?auto_386732 ) ) ( not ( = ?auto_386730 ?auto_386731 ) ) ( not ( = ?auto_386730 ?auto_386732 ) ) ( not ( = ?auto_386731 ?auto_386732 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386731 ?auto_386732 )
      ( !STACK ?auto_386731 ?auto_386730 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_386743 - BLOCK
      ?auto_386744 - BLOCK
      ?auto_386745 - BLOCK
    )
    :vars
    (
      ?auto_386746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386745 ?auto_386746 ) ( ON-TABLE ?auto_386743 ) ( not ( = ?auto_386743 ?auto_386744 ) ) ( not ( = ?auto_386743 ?auto_386745 ) ) ( not ( = ?auto_386743 ?auto_386746 ) ) ( not ( = ?auto_386744 ?auto_386745 ) ) ( not ( = ?auto_386744 ?auto_386746 ) ) ( not ( = ?auto_386745 ?auto_386746 ) ) ( CLEAR ?auto_386743 ) ( ON ?auto_386744 ?auto_386745 ) ( CLEAR ?auto_386744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_386743 ?auto_386744 )
      ( MAKE-3PILE ?auto_386743 ?auto_386744 ?auto_386745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_386757 - BLOCK
      ?auto_386758 - BLOCK
      ?auto_386759 - BLOCK
    )
    :vars
    (
      ?auto_386760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386759 ?auto_386760 ) ( not ( = ?auto_386757 ?auto_386758 ) ) ( not ( = ?auto_386757 ?auto_386759 ) ) ( not ( = ?auto_386757 ?auto_386760 ) ) ( not ( = ?auto_386758 ?auto_386759 ) ) ( not ( = ?auto_386758 ?auto_386760 ) ) ( not ( = ?auto_386759 ?auto_386760 ) ) ( ON ?auto_386758 ?auto_386759 ) ( ON ?auto_386757 ?auto_386758 ) ( CLEAR ?auto_386757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386757 )
      ( MAKE-3PILE ?auto_386757 ?auto_386758 ?auto_386759 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386772 - BLOCK
      ?auto_386773 - BLOCK
      ?auto_386774 - BLOCK
      ?auto_386775 - BLOCK
    )
    :vars
    (
      ?auto_386776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386774 ) ( ON ?auto_386775 ?auto_386776 ) ( CLEAR ?auto_386775 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386772 ) ( ON ?auto_386773 ?auto_386772 ) ( ON ?auto_386774 ?auto_386773 ) ( not ( = ?auto_386772 ?auto_386773 ) ) ( not ( = ?auto_386772 ?auto_386774 ) ) ( not ( = ?auto_386772 ?auto_386775 ) ) ( not ( = ?auto_386772 ?auto_386776 ) ) ( not ( = ?auto_386773 ?auto_386774 ) ) ( not ( = ?auto_386773 ?auto_386775 ) ) ( not ( = ?auto_386773 ?auto_386776 ) ) ( not ( = ?auto_386774 ?auto_386775 ) ) ( not ( = ?auto_386774 ?auto_386776 ) ) ( not ( = ?auto_386775 ?auto_386776 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386775 ?auto_386776 )
      ( !STACK ?auto_386775 ?auto_386774 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386790 - BLOCK
      ?auto_386791 - BLOCK
      ?auto_386792 - BLOCK
      ?auto_386793 - BLOCK
    )
    :vars
    (
      ?auto_386794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386793 ?auto_386794 ) ( ON-TABLE ?auto_386790 ) ( ON ?auto_386791 ?auto_386790 ) ( not ( = ?auto_386790 ?auto_386791 ) ) ( not ( = ?auto_386790 ?auto_386792 ) ) ( not ( = ?auto_386790 ?auto_386793 ) ) ( not ( = ?auto_386790 ?auto_386794 ) ) ( not ( = ?auto_386791 ?auto_386792 ) ) ( not ( = ?auto_386791 ?auto_386793 ) ) ( not ( = ?auto_386791 ?auto_386794 ) ) ( not ( = ?auto_386792 ?auto_386793 ) ) ( not ( = ?auto_386792 ?auto_386794 ) ) ( not ( = ?auto_386793 ?auto_386794 ) ) ( CLEAR ?auto_386791 ) ( ON ?auto_386792 ?auto_386793 ) ( CLEAR ?auto_386792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_386790 ?auto_386791 ?auto_386792 )
      ( MAKE-4PILE ?auto_386790 ?auto_386791 ?auto_386792 ?auto_386793 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386808 - BLOCK
      ?auto_386809 - BLOCK
      ?auto_386810 - BLOCK
      ?auto_386811 - BLOCK
    )
    :vars
    (
      ?auto_386812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386811 ?auto_386812 ) ( ON-TABLE ?auto_386808 ) ( not ( = ?auto_386808 ?auto_386809 ) ) ( not ( = ?auto_386808 ?auto_386810 ) ) ( not ( = ?auto_386808 ?auto_386811 ) ) ( not ( = ?auto_386808 ?auto_386812 ) ) ( not ( = ?auto_386809 ?auto_386810 ) ) ( not ( = ?auto_386809 ?auto_386811 ) ) ( not ( = ?auto_386809 ?auto_386812 ) ) ( not ( = ?auto_386810 ?auto_386811 ) ) ( not ( = ?auto_386810 ?auto_386812 ) ) ( not ( = ?auto_386811 ?auto_386812 ) ) ( ON ?auto_386810 ?auto_386811 ) ( CLEAR ?auto_386808 ) ( ON ?auto_386809 ?auto_386810 ) ( CLEAR ?auto_386809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_386808 ?auto_386809 )
      ( MAKE-4PILE ?auto_386808 ?auto_386809 ?auto_386810 ?auto_386811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386826 - BLOCK
      ?auto_386827 - BLOCK
      ?auto_386828 - BLOCK
      ?auto_386829 - BLOCK
    )
    :vars
    (
      ?auto_386830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386829 ?auto_386830 ) ( not ( = ?auto_386826 ?auto_386827 ) ) ( not ( = ?auto_386826 ?auto_386828 ) ) ( not ( = ?auto_386826 ?auto_386829 ) ) ( not ( = ?auto_386826 ?auto_386830 ) ) ( not ( = ?auto_386827 ?auto_386828 ) ) ( not ( = ?auto_386827 ?auto_386829 ) ) ( not ( = ?auto_386827 ?auto_386830 ) ) ( not ( = ?auto_386828 ?auto_386829 ) ) ( not ( = ?auto_386828 ?auto_386830 ) ) ( not ( = ?auto_386829 ?auto_386830 ) ) ( ON ?auto_386828 ?auto_386829 ) ( ON ?auto_386827 ?auto_386828 ) ( ON ?auto_386826 ?auto_386827 ) ( CLEAR ?auto_386826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386826 )
      ( MAKE-4PILE ?auto_386826 ?auto_386827 ?auto_386828 ?auto_386829 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386845 - BLOCK
      ?auto_386846 - BLOCK
      ?auto_386847 - BLOCK
      ?auto_386848 - BLOCK
      ?auto_386849 - BLOCK
    )
    :vars
    (
      ?auto_386850 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386848 ) ( ON ?auto_386849 ?auto_386850 ) ( CLEAR ?auto_386849 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386845 ) ( ON ?auto_386846 ?auto_386845 ) ( ON ?auto_386847 ?auto_386846 ) ( ON ?auto_386848 ?auto_386847 ) ( not ( = ?auto_386845 ?auto_386846 ) ) ( not ( = ?auto_386845 ?auto_386847 ) ) ( not ( = ?auto_386845 ?auto_386848 ) ) ( not ( = ?auto_386845 ?auto_386849 ) ) ( not ( = ?auto_386845 ?auto_386850 ) ) ( not ( = ?auto_386846 ?auto_386847 ) ) ( not ( = ?auto_386846 ?auto_386848 ) ) ( not ( = ?auto_386846 ?auto_386849 ) ) ( not ( = ?auto_386846 ?auto_386850 ) ) ( not ( = ?auto_386847 ?auto_386848 ) ) ( not ( = ?auto_386847 ?auto_386849 ) ) ( not ( = ?auto_386847 ?auto_386850 ) ) ( not ( = ?auto_386848 ?auto_386849 ) ) ( not ( = ?auto_386848 ?auto_386850 ) ) ( not ( = ?auto_386849 ?auto_386850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386849 ?auto_386850 )
      ( !STACK ?auto_386849 ?auto_386848 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386867 - BLOCK
      ?auto_386868 - BLOCK
      ?auto_386869 - BLOCK
      ?auto_386870 - BLOCK
      ?auto_386871 - BLOCK
    )
    :vars
    (
      ?auto_386872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386871 ?auto_386872 ) ( ON-TABLE ?auto_386867 ) ( ON ?auto_386868 ?auto_386867 ) ( ON ?auto_386869 ?auto_386868 ) ( not ( = ?auto_386867 ?auto_386868 ) ) ( not ( = ?auto_386867 ?auto_386869 ) ) ( not ( = ?auto_386867 ?auto_386870 ) ) ( not ( = ?auto_386867 ?auto_386871 ) ) ( not ( = ?auto_386867 ?auto_386872 ) ) ( not ( = ?auto_386868 ?auto_386869 ) ) ( not ( = ?auto_386868 ?auto_386870 ) ) ( not ( = ?auto_386868 ?auto_386871 ) ) ( not ( = ?auto_386868 ?auto_386872 ) ) ( not ( = ?auto_386869 ?auto_386870 ) ) ( not ( = ?auto_386869 ?auto_386871 ) ) ( not ( = ?auto_386869 ?auto_386872 ) ) ( not ( = ?auto_386870 ?auto_386871 ) ) ( not ( = ?auto_386870 ?auto_386872 ) ) ( not ( = ?auto_386871 ?auto_386872 ) ) ( CLEAR ?auto_386869 ) ( ON ?auto_386870 ?auto_386871 ) ( CLEAR ?auto_386870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_386867 ?auto_386868 ?auto_386869 ?auto_386870 )
      ( MAKE-5PILE ?auto_386867 ?auto_386868 ?auto_386869 ?auto_386870 ?auto_386871 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386889 - BLOCK
      ?auto_386890 - BLOCK
      ?auto_386891 - BLOCK
      ?auto_386892 - BLOCK
      ?auto_386893 - BLOCK
    )
    :vars
    (
      ?auto_386894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386893 ?auto_386894 ) ( ON-TABLE ?auto_386889 ) ( ON ?auto_386890 ?auto_386889 ) ( not ( = ?auto_386889 ?auto_386890 ) ) ( not ( = ?auto_386889 ?auto_386891 ) ) ( not ( = ?auto_386889 ?auto_386892 ) ) ( not ( = ?auto_386889 ?auto_386893 ) ) ( not ( = ?auto_386889 ?auto_386894 ) ) ( not ( = ?auto_386890 ?auto_386891 ) ) ( not ( = ?auto_386890 ?auto_386892 ) ) ( not ( = ?auto_386890 ?auto_386893 ) ) ( not ( = ?auto_386890 ?auto_386894 ) ) ( not ( = ?auto_386891 ?auto_386892 ) ) ( not ( = ?auto_386891 ?auto_386893 ) ) ( not ( = ?auto_386891 ?auto_386894 ) ) ( not ( = ?auto_386892 ?auto_386893 ) ) ( not ( = ?auto_386892 ?auto_386894 ) ) ( not ( = ?auto_386893 ?auto_386894 ) ) ( ON ?auto_386892 ?auto_386893 ) ( CLEAR ?auto_386890 ) ( ON ?auto_386891 ?auto_386892 ) ( CLEAR ?auto_386891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_386889 ?auto_386890 ?auto_386891 )
      ( MAKE-5PILE ?auto_386889 ?auto_386890 ?auto_386891 ?auto_386892 ?auto_386893 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386911 - BLOCK
      ?auto_386912 - BLOCK
      ?auto_386913 - BLOCK
      ?auto_386914 - BLOCK
      ?auto_386915 - BLOCK
    )
    :vars
    (
      ?auto_386916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386915 ?auto_386916 ) ( ON-TABLE ?auto_386911 ) ( not ( = ?auto_386911 ?auto_386912 ) ) ( not ( = ?auto_386911 ?auto_386913 ) ) ( not ( = ?auto_386911 ?auto_386914 ) ) ( not ( = ?auto_386911 ?auto_386915 ) ) ( not ( = ?auto_386911 ?auto_386916 ) ) ( not ( = ?auto_386912 ?auto_386913 ) ) ( not ( = ?auto_386912 ?auto_386914 ) ) ( not ( = ?auto_386912 ?auto_386915 ) ) ( not ( = ?auto_386912 ?auto_386916 ) ) ( not ( = ?auto_386913 ?auto_386914 ) ) ( not ( = ?auto_386913 ?auto_386915 ) ) ( not ( = ?auto_386913 ?auto_386916 ) ) ( not ( = ?auto_386914 ?auto_386915 ) ) ( not ( = ?auto_386914 ?auto_386916 ) ) ( not ( = ?auto_386915 ?auto_386916 ) ) ( ON ?auto_386914 ?auto_386915 ) ( ON ?auto_386913 ?auto_386914 ) ( CLEAR ?auto_386911 ) ( ON ?auto_386912 ?auto_386913 ) ( CLEAR ?auto_386912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_386911 ?auto_386912 )
      ( MAKE-5PILE ?auto_386911 ?auto_386912 ?auto_386913 ?auto_386914 ?auto_386915 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386933 - BLOCK
      ?auto_386934 - BLOCK
      ?auto_386935 - BLOCK
      ?auto_386936 - BLOCK
      ?auto_386937 - BLOCK
    )
    :vars
    (
      ?auto_386938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386937 ?auto_386938 ) ( not ( = ?auto_386933 ?auto_386934 ) ) ( not ( = ?auto_386933 ?auto_386935 ) ) ( not ( = ?auto_386933 ?auto_386936 ) ) ( not ( = ?auto_386933 ?auto_386937 ) ) ( not ( = ?auto_386933 ?auto_386938 ) ) ( not ( = ?auto_386934 ?auto_386935 ) ) ( not ( = ?auto_386934 ?auto_386936 ) ) ( not ( = ?auto_386934 ?auto_386937 ) ) ( not ( = ?auto_386934 ?auto_386938 ) ) ( not ( = ?auto_386935 ?auto_386936 ) ) ( not ( = ?auto_386935 ?auto_386937 ) ) ( not ( = ?auto_386935 ?auto_386938 ) ) ( not ( = ?auto_386936 ?auto_386937 ) ) ( not ( = ?auto_386936 ?auto_386938 ) ) ( not ( = ?auto_386937 ?auto_386938 ) ) ( ON ?auto_386936 ?auto_386937 ) ( ON ?auto_386935 ?auto_386936 ) ( ON ?auto_386934 ?auto_386935 ) ( ON ?auto_386933 ?auto_386934 ) ( CLEAR ?auto_386933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386933 )
      ( MAKE-5PILE ?auto_386933 ?auto_386934 ?auto_386935 ?auto_386936 ?auto_386937 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_386956 - BLOCK
      ?auto_386957 - BLOCK
      ?auto_386958 - BLOCK
      ?auto_386959 - BLOCK
      ?auto_386960 - BLOCK
      ?auto_386961 - BLOCK
    )
    :vars
    (
      ?auto_386962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386960 ) ( ON ?auto_386961 ?auto_386962 ) ( CLEAR ?auto_386961 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386956 ) ( ON ?auto_386957 ?auto_386956 ) ( ON ?auto_386958 ?auto_386957 ) ( ON ?auto_386959 ?auto_386958 ) ( ON ?auto_386960 ?auto_386959 ) ( not ( = ?auto_386956 ?auto_386957 ) ) ( not ( = ?auto_386956 ?auto_386958 ) ) ( not ( = ?auto_386956 ?auto_386959 ) ) ( not ( = ?auto_386956 ?auto_386960 ) ) ( not ( = ?auto_386956 ?auto_386961 ) ) ( not ( = ?auto_386956 ?auto_386962 ) ) ( not ( = ?auto_386957 ?auto_386958 ) ) ( not ( = ?auto_386957 ?auto_386959 ) ) ( not ( = ?auto_386957 ?auto_386960 ) ) ( not ( = ?auto_386957 ?auto_386961 ) ) ( not ( = ?auto_386957 ?auto_386962 ) ) ( not ( = ?auto_386958 ?auto_386959 ) ) ( not ( = ?auto_386958 ?auto_386960 ) ) ( not ( = ?auto_386958 ?auto_386961 ) ) ( not ( = ?auto_386958 ?auto_386962 ) ) ( not ( = ?auto_386959 ?auto_386960 ) ) ( not ( = ?auto_386959 ?auto_386961 ) ) ( not ( = ?auto_386959 ?auto_386962 ) ) ( not ( = ?auto_386960 ?auto_386961 ) ) ( not ( = ?auto_386960 ?auto_386962 ) ) ( not ( = ?auto_386961 ?auto_386962 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386961 ?auto_386962 )
      ( !STACK ?auto_386961 ?auto_386960 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_386982 - BLOCK
      ?auto_386983 - BLOCK
      ?auto_386984 - BLOCK
      ?auto_386985 - BLOCK
      ?auto_386986 - BLOCK
      ?auto_386987 - BLOCK
    )
    :vars
    (
      ?auto_386988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386987 ?auto_386988 ) ( ON-TABLE ?auto_386982 ) ( ON ?auto_386983 ?auto_386982 ) ( ON ?auto_386984 ?auto_386983 ) ( ON ?auto_386985 ?auto_386984 ) ( not ( = ?auto_386982 ?auto_386983 ) ) ( not ( = ?auto_386982 ?auto_386984 ) ) ( not ( = ?auto_386982 ?auto_386985 ) ) ( not ( = ?auto_386982 ?auto_386986 ) ) ( not ( = ?auto_386982 ?auto_386987 ) ) ( not ( = ?auto_386982 ?auto_386988 ) ) ( not ( = ?auto_386983 ?auto_386984 ) ) ( not ( = ?auto_386983 ?auto_386985 ) ) ( not ( = ?auto_386983 ?auto_386986 ) ) ( not ( = ?auto_386983 ?auto_386987 ) ) ( not ( = ?auto_386983 ?auto_386988 ) ) ( not ( = ?auto_386984 ?auto_386985 ) ) ( not ( = ?auto_386984 ?auto_386986 ) ) ( not ( = ?auto_386984 ?auto_386987 ) ) ( not ( = ?auto_386984 ?auto_386988 ) ) ( not ( = ?auto_386985 ?auto_386986 ) ) ( not ( = ?auto_386985 ?auto_386987 ) ) ( not ( = ?auto_386985 ?auto_386988 ) ) ( not ( = ?auto_386986 ?auto_386987 ) ) ( not ( = ?auto_386986 ?auto_386988 ) ) ( not ( = ?auto_386987 ?auto_386988 ) ) ( CLEAR ?auto_386985 ) ( ON ?auto_386986 ?auto_386987 ) ( CLEAR ?auto_386986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_386982 ?auto_386983 ?auto_386984 ?auto_386985 ?auto_386986 )
      ( MAKE-6PILE ?auto_386982 ?auto_386983 ?auto_386984 ?auto_386985 ?auto_386986 ?auto_386987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387008 - BLOCK
      ?auto_387009 - BLOCK
      ?auto_387010 - BLOCK
      ?auto_387011 - BLOCK
      ?auto_387012 - BLOCK
      ?auto_387013 - BLOCK
    )
    :vars
    (
      ?auto_387014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387013 ?auto_387014 ) ( ON-TABLE ?auto_387008 ) ( ON ?auto_387009 ?auto_387008 ) ( ON ?auto_387010 ?auto_387009 ) ( not ( = ?auto_387008 ?auto_387009 ) ) ( not ( = ?auto_387008 ?auto_387010 ) ) ( not ( = ?auto_387008 ?auto_387011 ) ) ( not ( = ?auto_387008 ?auto_387012 ) ) ( not ( = ?auto_387008 ?auto_387013 ) ) ( not ( = ?auto_387008 ?auto_387014 ) ) ( not ( = ?auto_387009 ?auto_387010 ) ) ( not ( = ?auto_387009 ?auto_387011 ) ) ( not ( = ?auto_387009 ?auto_387012 ) ) ( not ( = ?auto_387009 ?auto_387013 ) ) ( not ( = ?auto_387009 ?auto_387014 ) ) ( not ( = ?auto_387010 ?auto_387011 ) ) ( not ( = ?auto_387010 ?auto_387012 ) ) ( not ( = ?auto_387010 ?auto_387013 ) ) ( not ( = ?auto_387010 ?auto_387014 ) ) ( not ( = ?auto_387011 ?auto_387012 ) ) ( not ( = ?auto_387011 ?auto_387013 ) ) ( not ( = ?auto_387011 ?auto_387014 ) ) ( not ( = ?auto_387012 ?auto_387013 ) ) ( not ( = ?auto_387012 ?auto_387014 ) ) ( not ( = ?auto_387013 ?auto_387014 ) ) ( ON ?auto_387012 ?auto_387013 ) ( CLEAR ?auto_387010 ) ( ON ?auto_387011 ?auto_387012 ) ( CLEAR ?auto_387011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387008 ?auto_387009 ?auto_387010 ?auto_387011 )
      ( MAKE-6PILE ?auto_387008 ?auto_387009 ?auto_387010 ?auto_387011 ?auto_387012 ?auto_387013 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387034 - BLOCK
      ?auto_387035 - BLOCK
      ?auto_387036 - BLOCK
      ?auto_387037 - BLOCK
      ?auto_387038 - BLOCK
      ?auto_387039 - BLOCK
    )
    :vars
    (
      ?auto_387040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387039 ?auto_387040 ) ( ON-TABLE ?auto_387034 ) ( ON ?auto_387035 ?auto_387034 ) ( not ( = ?auto_387034 ?auto_387035 ) ) ( not ( = ?auto_387034 ?auto_387036 ) ) ( not ( = ?auto_387034 ?auto_387037 ) ) ( not ( = ?auto_387034 ?auto_387038 ) ) ( not ( = ?auto_387034 ?auto_387039 ) ) ( not ( = ?auto_387034 ?auto_387040 ) ) ( not ( = ?auto_387035 ?auto_387036 ) ) ( not ( = ?auto_387035 ?auto_387037 ) ) ( not ( = ?auto_387035 ?auto_387038 ) ) ( not ( = ?auto_387035 ?auto_387039 ) ) ( not ( = ?auto_387035 ?auto_387040 ) ) ( not ( = ?auto_387036 ?auto_387037 ) ) ( not ( = ?auto_387036 ?auto_387038 ) ) ( not ( = ?auto_387036 ?auto_387039 ) ) ( not ( = ?auto_387036 ?auto_387040 ) ) ( not ( = ?auto_387037 ?auto_387038 ) ) ( not ( = ?auto_387037 ?auto_387039 ) ) ( not ( = ?auto_387037 ?auto_387040 ) ) ( not ( = ?auto_387038 ?auto_387039 ) ) ( not ( = ?auto_387038 ?auto_387040 ) ) ( not ( = ?auto_387039 ?auto_387040 ) ) ( ON ?auto_387038 ?auto_387039 ) ( ON ?auto_387037 ?auto_387038 ) ( CLEAR ?auto_387035 ) ( ON ?auto_387036 ?auto_387037 ) ( CLEAR ?auto_387036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387034 ?auto_387035 ?auto_387036 )
      ( MAKE-6PILE ?auto_387034 ?auto_387035 ?auto_387036 ?auto_387037 ?auto_387038 ?auto_387039 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387060 - BLOCK
      ?auto_387061 - BLOCK
      ?auto_387062 - BLOCK
      ?auto_387063 - BLOCK
      ?auto_387064 - BLOCK
      ?auto_387065 - BLOCK
    )
    :vars
    (
      ?auto_387066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387065 ?auto_387066 ) ( ON-TABLE ?auto_387060 ) ( not ( = ?auto_387060 ?auto_387061 ) ) ( not ( = ?auto_387060 ?auto_387062 ) ) ( not ( = ?auto_387060 ?auto_387063 ) ) ( not ( = ?auto_387060 ?auto_387064 ) ) ( not ( = ?auto_387060 ?auto_387065 ) ) ( not ( = ?auto_387060 ?auto_387066 ) ) ( not ( = ?auto_387061 ?auto_387062 ) ) ( not ( = ?auto_387061 ?auto_387063 ) ) ( not ( = ?auto_387061 ?auto_387064 ) ) ( not ( = ?auto_387061 ?auto_387065 ) ) ( not ( = ?auto_387061 ?auto_387066 ) ) ( not ( = ?auto_387062 ?auto_387063 ) ) ( not ( = ?auto_387062 ?auto_387064 ) ) ( not ( = ?auto_387062 ?auto_387065 ) ) ( not ( = ?auto_387062 ?auto_387066 ) ) ( not ( = ?auto_387063 ?auto_387064 ) ) ( not ( = ?auto_387063 ?auto_387065 ) ) ( not ( = ?auto_387063 ?auto_387066 ) ) ( not ( = ?auto_387064 ?auto_387065 ) ) ( not ( = ?auto_387064 ?auto_387066 ) ) ( not ( = ?auto_387065 ?auto_387066 ) ) ( ON ?auto_387064 ?auto_387065 ) ( ON ?auto_387063 ?auto_387064 ) ( ON ?auto_387062 ?auto_387063 ) ( CLEAR ?auto_387060 ) ( ON ?auto_387061 ?auto_387062 ) ( CLEAR ?auto_387061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387060 ?auto_387061 )
      ( MAKE-6PILE ?auto_387060 ?auto_387061 ?auto_387062 ?auto_387063 ?auto_387064 ?auto_387065 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387086 - BLOCK
      ?auto_387087 - BLOCK
      ?auto_387088 - BLOCK
      ?auto_387089 - BLOCK
      ?auto_387090 - BLOCK
      ?auto_387091 - BLOCK
    )
    :vars
    (
      ?auto_387092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387091 ?auto_387092 ) ( not ( = ?auto_387086 ?auto_387087 ) ) ( not ( = ?auto_387086 ?auto_387088 ) ) ( not ( = ?auto_387086 ?auto_387089 ) ) ( not ( = ?auto_387086 ?auto_387090 ) ) ( not ( = ?auto_387086 ?auto_387091 ) ) ( not ( = ?auto_387086 ?auto_387092 ) ) ( not ( = ?auto_387087 ?auto_387088 ) ) ( not ( = ?auto_387087 ?auto_387089 ) ) ( not ( = ?auto_387087 ?auto_387090 ) ) ( not ( = ?auto_387087 ?auto_387091 ) ) ( not ( = ?auto_387087 ?auto_387092 ) ) ( not ( = ?auto_387088 ?auto_387089 ) ) ( not ( = ?auto_387088 ?auto_387090 ) ) ( not ( = ?auto_387088 ?auto_387091 ) ) ( not ( = ?auto_387088 ?auto_387092 ) ) ( not ( = ?auto_387089 ?auto_387090 ) ) ( not ( = ?auto_387089 ?auto_387091 ) ) ( not ( = ?auto_387089 ?auto_387092 ) ) ( not ( = ?auto_387090 ?auto_387091 ) ) ( not ( = ?auto_387090 ?auto_387092 ) ) ( not ( = ?auto_387091 ?auto_387092 ) ) ( ON ?auto_387090 ?auto_387091 ) ( ON ?auto_387089 ?auto_387090 ) ( ON ?auto_387088 ?auto_387089 ) ( ON ?auto_387087 ?auto_387088 ) ( ON ?auto_387086 ?auto_387087 ) ( CLEAR ?auto_387086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387086 )
      ( MAKE-6PILE ?auto_387086 ?auto_387087 ?auto_387088 ?auto_387089 ?auto_387090 ?auto_387091 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387113 - BLOCK
      ?auto_387114 - BLOCK
      ?auto_387115 - BLOCK
      ?auto_387116 - BLOCK
      ?auto_387117 - BLOCK
      ?auto_387118 - BLOCK
      ?auto_387119 - BLOCK
    )
    :vars
    (
      ?auto_387120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387118 ) ( ON ?auto_387119 ?auto_387120 ) ( CLEAR ?auto_387119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387113 ) ( ON ?auto_387114 ?auto_387113 ) ( ON ?auto_387115 ?auto_387114 ) ( ON ?auto_387116 ?auto_387115 ) ( ON ?auto_387117 ?auto_387116 ) ( ON ?auto_387118 ?auto_387117 ) ( not ( = ?auto_387113 ?auto_387114 ) ) ( not ( = ?auto_387113 ?auto_387115 ) ) ( not ( = ?auto_387113 ?auto_387116 ) ) ( not ( = ?auto_387113 ?auto_387117 ) ) ( not ( = ?auto_387113 ?auto_387118 ) ) ( not ( = ?auto_387113 ?auto_387119 ) ) ( not ( = ?auto_387113 ?auto_387120 ) ) ( not ( = ?auto_387114 ?auto_387115 ) ) ( not ( = ?auto_387114 ?auto_387116 ) ) ( not ( = ?auto_387114 ?auto_387117 ) ) ( not ( = ?auto_387114 ?auto_387118 ) ) ( not ( = ?auto_387114 ?auto_387119 ) ) ( not ( = ?auto_387114 ?auto_387120 ) ) ( not ( = ?auto_387115 ?auto_387116 ) ) ( not ( = ?auto_387115 ?auto_387117 ) ) ( not ( = ?auto_387115 ?auto_387118 ) ) ( not ( = ?auto_387115 ?auto_387119 ) ) ( not ( = ?auto_387115 ?auto_387120 ) ) ( not ( = ?auto_387116 ?auto_387117 ) ) ( not ( = ?auto_387116 ?auto_387118 ) ) ( not ( = ?auto_387116 ?auto_387119 ) ) ( not ( = ?auto_387116 ?auto_387120 ) ) ( not ( = ?auto_387117 ?auto_387118 ) ) ( not ( = ?auto_387117 ?auto_387119 ) ) ( not ( = ?auto_387117 ?auto_387120 ) ) ( not ( = ?auto_387118 ?auto_387119 ) ) ( not ( = ?auto_387118 ?auto_387120 ) ) ( not ( = ?auto_387119 ?auto_387120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387119 ?auto_387120 )
      ( !STACK ?auto_387119 ?auto_387118 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387143 - BLOCK
      ?auto_387144 - BLOCK
      ?auto_387145 - BLOCK
      ?auto_387146 - BLOCK
      ?auto_387147 - BLOCK
      ?auto_387148 - BLOCK
      ?auto_387149 - BLOCK
    )
    :vars
    (
      ?auto_387150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387149 ?auto_387150 ) ( ON-TABLE ?auto_387143 ) ( ON ?auto_387144 ?auto_387143 ) ( ON ?auto_387145 ?auto_387144 ) ( ON ?auto_387146 ?auto_387145 ) ( ON ?auto_387147 ?auto_387146 ) ( not ( = ?auto_387143 ?auto_387144 ) ) ( not ( = ?auto_387143 ?auto_387145 ) ) ( not ( = ?auto_387143 ?auto_387146 ) ) ( not ( = ?auto_387143 ?auto_387147 ) ) ( not ( = ?auto_387143 ?auto_387148 ) ) ( not ( = ?auto_387143 ?auto_387149 ) ) ( not ( = ?auto_387143 ?auto_387150 ) ) ( not ( = ?auto_387144 ?auto_387145 ) ) ( not ( = ?auto_387144 ?auto_387146 ) ) ( not ( = ?auto_387144 ?auto_387147 ) ) ( not ( = ?auto_387144 ?auto_387148 ) ) ( not ( = ?auto_387144 ?auto_387149 ) ) ( not ( = ?auto_387144 ?auto_387150 ) ) ( not ( = ?auto_387145 ?auto_387146 ) ) ( not ( = ?auto_387145 ?auto_387147 ) ) ( not ( = ?auto_387145 ?auto_387148 ) ) ( not ( = ?auto_387145 ?auto_387149 ) ) ( not ( = ?auto_387145 ?auto_387150 ) ) ( not ( = ?auto_387146 ?auto_387147 ) ) ( not ( = ?auto_387146 ?auto_387148 ) ) ( not ( = ?auto_387146 ?auto_387149 ) ) ( not ( = ?auto_387146 ?auto_387150 ) ) ( not ( = ?auto_387147 ?auto_387148 ) ) ( not ( = ?auto_387147 ?auto_387149 ) ) ( not ( = ?auto_387147 ?auto_387150 ) ) ( not ( = ?auto_387148 ?auto_387149 ) ) ( not ( = ?auto_387148 ?auto_387150 ) ) ( not ( = ?auto_387149 ?auto_387150 ) ) ( CLEAR ?auto_387147 ) ( ON ?auto_387148 ?auto_387149 ) ( CLEAR ?auto_387148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_387143 ?auto_387144 ?auto_387145 ?auto_387146 ?auto_387147 ?auto_387148 )
      ( MAKE-7PILE ?auto_387143 ?auto_387144 ?auto_387145 ?auto_387146 ?auto_387147 ?auto_387148 ?auto_387149 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387173 - BLOCK
      ?auto_387174 - BLOCK
      ?auto_387175 - BLOCK
      ?auto_387176 - BLOCK
      ?auto_387177 - BLOCK
      ?auto_387178 - BLOCK
      ?auto_387179 - BLOCK
    )
    :vars
    (
      ?auto_387180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387179 ?auto_387180 ) ( ON-TABLE ?auto_387173 ) ( ON ?auto_387174 ?auto_387173 ) ( ON ?auto_387175 ?auto_387174 ) ( ON ?auto_387176 ?auto_387175 ) ( not ( = ?auto_387173 ?auto_387174 ) ) ( not ( = ?auto_387173 ?auto_387175 ) ) ( not ( = ?auto_387173 ?auto_387176 ) ) ( not ( = ?auto_387173 ?auto_387177 ) ) ( not ( = ?auto_387173 ?auto_387178 ) ) ( not ( = ?auto_387173 ?auto_387179 ) ) ( not ( = ?auto_387173 ?auto_387180 ) ) ( not ( = ?auto_387174 ?auto_387175 ) ) ( not ( = ?auto_387174 ?auto_387176 ) ) ( not ( = ?auto_387174 ?auto_387177 ) ) ( not ( = ?auto_387174 ?auto_387178 ) ) ( not ( = ?auto_387174 ?auto_387179 ) ) ( not ( = ?auto_387174 ?auto_387180 ) ) ( not ( = ?auto_387175 ?auto_387176 ) ) ( not ( = ?auto_387175 ?auto_387177 ) ) ( not ( = ?auto_387175 ?auto_387178 ) ) ( not ( = ?auto_387175 ?auto_387179 ) ) ( not ( = ?auto_387175 ?auto_387180 ) ) ( not ( = ?auto_387176 ?auto_387177 ) ) ( not ( = ?auto_387176 ?auto_387178 ) ) ( not ( = ?auto_387176 ?auto_387179 ) ) ( not ( = ?auto_387176 ?auto_387180 ) ) ( not ( = ?auto_387177 ?auto_387178 ) ) ( not ( = ?auto_387177 ?auto_387179 ) ) ( not ( = ?auto_387177 ?auto_387180 ) ) ( not ( = ?auto_387178 ?auto_387179 ) ) ( not ( = ?auto_387178 ?auto_387180 ) ) ( not ( = ?auto_387179 ?auto_387180 ) ) ( ON ?auto_387178 ?auto_387179 ) ( CLEAR ?auto_387176 ) ( ON ?auto_387177 ?auto_387178 ) ( CLEAR ?auto_387177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_387173 ?auto_387174 ?auto_387175 ?auto_387176 ?auto_387177 )
      ( MAKE-7PILE ?auto_387173 ?auto_387174 ?auto_387175 ?auto_387176 ?auto_387177 ?auto_387178 ?auto_387179 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387203 - BLOCK
      ?auto_387204 - BLOCK
      ?auto_387205 - BLOCK
      ?auto_387206 - BLOCK
      ?auto_387207 - BLOCK
      ?auto_387208 - BLOCK
      ?auto_387209 - BLOCK
    )
    :vars
    (
      ?auto_387210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387209 ?auto_387210 ) ( ON-TABLE ?auto_387203 ) ( ON ?auto_387204 ?auto_387203 ) ( ON ?auto_387205 ?auto_387204 ) ( not ( = ?auto_387203 ?auto_387204 ) ) ( not ( = ?auto_387203 ?auto_387205 ) ) ( not ( = ?auto_387203 ?auto_387206 ) ) ( not ( = ?auto_387203 ?auto_387207 ) ) ( not ( = ?auto_387203 ?auto_387208 ) ) ( not ( = ?auto_387203 ?auto_387209 ) ) ( not ( = ?auto_387203 ?auto_387210 ) ) ( not ( = ?auto_387204 ?auto_387205 ) ) ( not ( = ?auto_387204 ?auto_387206 ) ) ( not ( = ?auto_387204 ?auto_387207 ) ) ( not ( = ?auto_387204 ?auto_387208 ) ) ( not ( = ?auto_387204 ?auto_387209 ) ) ( not ( = ?auto_387204 ?auto_387210 ) ) ( not ( = ?auto_387205 ?auto_387206 ) ) ( not ( = ?auto_387205 ?auto_387207 ) ) ( not ( = ?auto_387205 ?auto_387208 ) ) ( not ( = ?auto_387205 ?auto_387209 ) ) ( not ( = ?auto_387205 ?auto_387210 ) ) ( not ( = ?auto_387206 ?auto_387207 ) ) ( not ( = ?auto_387206 ?auto_387208 ) ) ( not ( = ?auto_387206 ?auto_387209 ) ) ( not ( = ?auto_387206 ?auto_387210 ) ) ( not ( = ?auto_387207 ?auto_387208 ) ) ( not ( = ?auto_387207 ?auto_387209 ) ) ( not ( = ?auto_387207 ?auto_387210 ) ) ( not ( = ?auto_387208 ?auto_387209 ) ) ( not ( = ?auto_387208 ?auto_387210 ) ) ( not ( = ?auto_387209 ?auto_387210 ) ) ( ON ?auto_387208 ?auto_387209 ) ( ON ?auto_387207 ?auto_387208 ) ( CLEAR ?auto_387205 ) ( ON ?auto_387206 ?auto_387207 ) ( CLEAR ?auto_387206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387203 ?auto_387204 ?auto_387205 ?auto_387206 )
      ( MAKE-7PILE ?auto_387203 ?auto_387204 ?auto_387205 ?auto_387206 ?auto_387207 ?auto_387208 ?auto_387209 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387233 - BLOCK
      ?auto_387234 - BLOCK
      ?auto_387235 - BLOCK
      ?auto_387236 - BLOCK
      ?auto_387237 - BLOCK
      ?auto_387238 - BLOCK
      ?auto_387239 - BLOCK
    )
    :vars
    (
      ?auto_387240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387239 ?auto_387240 ) ( ON-TABLE ?auto_387233 ) ( ON ?auto_387234 ?auto_387233 ) ( not ( = ?auto_387233 ?auto_387234 ) ) ( not ( = ?auto_387233 ?auto_387235 ) ) ( not ( = ?auto_387233 ?auto_387236 ) ) ( not ( = ?auto_387233 ?auto_387237 ) ) ( not ( = ?auto_387233 ?auto_387238 ) ) ( not ( = ?auto_387233 ?auto_387239 ) ) ( not ( = ?auto_387233 ?auto_387240 ) ) ( not ( = ?auto_387234 ?auto_387235 ) ) ( not ( = ?auto_387234 ?auto_387236 ) ) ( not ( = ?auto_387234 ?auto_387237 ) ) ( not ( = ?auto_387234 ?auto_387238 ) ) ( not ( = ?auto_387234 ?auto_387239 ) ) ( not ( = ?auto_387234 ?auto_387240 ) ) ( not ( = ?auto_387235 ?auto_387236 ) ) ( not ( = ?auto_387235 ?auto_387237 ) ) ( not ( = ?auto_387235 ?auto_387238 ) ) ( not ( = ?auto_387235 ?auto_387239 ) ) ( not ( = ?auto_387235 ?auto_387240 ) ) ( not ( = ?auto_387236 ?auto_387237 ) ) ( not ( = ?auto_387236 ?auto_387238 ) ) ( not ( = ?auto_387236 ?auto_387239 ) ) ( not ( = ?auto_387236 ?auto_387240 ) ) ( not ( = ?auto_387237 ?auto_387238 ) ) ( not ( = ?auto_387237 ?auto_387239 ) ) ( not ( = ?auto_387237 ?auto_387240 ) ) ( not ( = ?auto_387238 ?auto_387239 ) ) ( not ( = ?auto_387238 ?auto_387240 ) ) ( not ( = ?auto_387239 ?auto_387240 ) ) ( ON ?auto_387238 ?auto_387239 ) ( ON ?auto_387237 ?auto_387238 ) ( ON ?auto_387236 ?auto_387237 ) ( CLEAR ?auto_387234 ) ( ON ?auto_387235 ?auto_387236 ) ( CLEAR ?auto_387235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387233 ?auto_387234 ?auto_387235 )
      ( MAKE-7PILE ?auto_387233 ?auto_387234 ?auto_387235 ?auto_387236 ?auto_387237 ?auto_387238 ?auto_387239 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387263 - BLOCK
      ?auto_387264 - BLOCK
      ?auto_387265 - BLOCK
      ?auto_387266 - BLOCK
      ?auto_387267 - BLOCK
      ?auto_387268 - BLOCK
      ?auto_387269 - BLOCK
    )
    :vars
    (
      ?auto_387270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387269 ?auto_387270 ) ( ON-TABLE ?auto_387263 ) ( not ( = ?auto_387263 ?auto_387264 ) ) ( not ( = ?auto_387263 ?auto_387265 ) ) ( not ( = ?auto_387263 ?auto_387266 ) ) ( not ( = ?auto_387263 ?auto_387267 ) ) ( not ( = ?auto_387263 ?auto_387268 ) ) ( not ( = ?auto_387263 ?auto_387269 ) ) ( not ( = ?auto_387263 ?auto_387270 ) ) ( not ( = ?auto_387264 ?auto_387265 ) ) ( not ( = ?auto_387264 ?auto_387266 ) ) ( not ( = ?auto_387264 ?auto_387267 ) ) ( not ( = ?auto_387264 ?auto_387268 ) ) ( not ( = ?auto_387264 ?auto_387269 ) ) ( not ( = ?auto_387264 ?auto_387270 ) ) ( not ( = ?auto_387265 ?auto_387266 ) ) ( not ( = ?auto_387265 ?auto_387267 ) ) ( not ( = ?auto_387265 ?auto_387268 ) ) ( not ( = ?auto_387265 ?auto_387269 ) ) ( not ( = ?auto_387265 ?auto_387270 ) ) ( not ( = ?auto_387266 ?auto_387267 ) ) ( not ( = ?auto_387266 ?auto_387268 ) ) ( not ( = ?auto_387266 ?auto_387269 ) ) ( not ( = ?auto_387266 ?auto_387270 ) ) ( not ( = ?auto_387267 ?auto_387268 ) ) ( not ( = ?auto_387267 ?auto_387269 ) ) ( not ( = ?auto_387267 ?auto_387270 ) ) ( not ( = ?auto_387268 ?auto_387269 ) ) ( not ( = ?auto_387268 ?auto_387270 ) ) ( not ( = ?auto_387269 ?auto_387270 ) ) ( ON ?auto_387268 ?auto_387269 ) ( ON ?auto_387267 ?auto_387268 ) ( ON ?auto_387266 ?auto_387267 ) ( ON ?auto_387265 ?auto_387266 ) ( CLEAR ?auto_387263 ) ( ON ?auto_387264 ?auto_387265 ) ( CLEAR ?auto_387264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387263 ?auto_387264 )
      ( MAKE-7PILE ?auto_387263 ?auto_387264 ?auto_387265 ?auto_387266 ?auto_387267 ?auto_387268 ?auto_387269 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387293 - BLOCK
      ?auto_387294 - BLOCK
      ?auto_387295 - BLOCK
      ?auto_387296 - BLOCK
      ?auto_387297 - BLOCK
      ?auto_387298 - BLOCK
      ?auto_387299 - BLOCK
    )
    :vars
    (
      ?auto_387300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387299 ?auto_387300 ) ( not ( = ?auto_387293 ?auto_387294 ) ) ( not ( = ?auto_387293 ?auto_387295 ) ) ( not ( = ?auto_387293 ?auto_387296 ) ) ( not ( = ?auto_387293 ?auto_387297 ) ) ( not ( = ?auto_387293 ?auto_387298 ) ) ( not ( = ?auto_387293 ?auto_387299 ) ) ( not ( = ?auto_387293 ?auto_387300 ) ) ( not ( = ?auto_387294 ?auto_387295 ) ) ( not ( = ?auto_387294 ?auto_387296 ) ) ( not ( = ?auto_387294 ?auto_387297 ) ) ( not ( = ?auto_387294 ?auto_387298 ) ) ( not ( = ?auto_387294 ?auto_387299 ) ) ( not ( = ?auto_387294 ?auto_387300 ) ) ( not ( = ?auto_387295 ?auto_387296 ) ) ( not ( = ?auto_387295 ?auto_387297 ) ) ( not ( = ?auto_387295 ?auto_387298 ) ) ( not ( = ?auto_387295 ?auto_387299 ) ) ( not ( = ?auto_387295 ?auto_387300 ) ) ( not ( = ?auto_387296 ?auto_387297 ) ) ( not ( = ?auto_387296 ?auto_387298 ) ) ( not ( = ?auto_387296 ?auto_387299 ) ) ( not ( = ?auto_387296 ?auto_387300 ) ) ( not ( = ?auto_387297 ?auto_387298 ) ) ( not ( = ?auto_387297 ?auto_387299 ) ) ( not ( = ?auto_387297 ?auto_387300 ) ) ( not ( = ?auto_387298 ?auto_387299 ) ) ( not ( = ?auto_387298 ?auto_387300 ) ) ( not ( = ?auto_387299 ?auto_387300 ) ) ( ON ?auto_387298 ?auto_387299 ) ( ON ?auto_387297 ?auto_387298 ) ( ON ?auto_387296 ?auto_387297 ) ( ON ?auto_387295 ?auto_387296 ) ( ON ?auto_387294 ?auto_387295 ) ( ON ?auto_387293 ?auto_387294 ) ( CLEAR ?auto_387293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387293 )
      ( MAKE-7PILE ?auto_387293 ?auto_387294 ?auto_387295 ?auto_387296 ?auto_387297 ?auto_387298 ?auto_387299 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387324 - BLOCK
      ?auto_387325 - BLOCK
      ?auto_387326 - BLOCK
      ?auto_387327 - BLOCK
      ?auto_387328 - BLOCK
      ?auto_387329 - BLOCK
      ?auto_387330 - BLOCK
      ?auto_387331 - BLOCK
    )
    :vars
    (
      ?auto_387332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387330 ) ( ON ?auto_387331 ?auto_387332 ) ( CLEAR ?auto_387331 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387324 ) ( ON ?auto_387325 ?auto_387324 ) ( ON ?auto_387326 ?auto_387325 ) ( ON ?auto_387327 ?auto_387326 ) ( ON ?auto_387328 ?auto_387327 ) ( ON ?auto_387329 ?auto_387328 ) ( ON ?auto_387330 ?auto_387329 ) ( not ( = ?auto_387324 ?auto_387325 ) ) ( not ( = ?auto_387324 ?auto_387326 ) ) ( not ( = ?auto_387324 ?auto_387327 ) ) ( not ( = ?auto_387324 ?auto_387328 ) ) ( not ( = ?auto_387324 ?auto_387329 ) ) ( not ( = ?auto_387324 ?auto_387330 ) ) ( not ( = ?auto_387324 ?auto_387331 ) ) ( not ( = ?auto_387324 ?auto_387332 ) ) ( not ( = ?auto_387325 ?auto_387326 ) ) ( not ( = ?auto_387325 ?auto_387327 ) ) ( not ( = ?auto_387325 ?auto_387328 ) ) ( not ( = ?auto_387325 ?auto_387329 ) ) ( not ( = ?auto_387325 ?auto_387330 ) ) ( not ( = ?auto_387325 ?auto_387331 ) ) ( not ( = ?auto_387325 ?auto_387332 ) ) ( not ( = ?auto_387326 ?auto_387327 ) ) ( not ( = ?auto_387326 ?auto_387328 ) ) ( not ( = ?auto_387326 ?auto_387329 ) ) ( not ( = ?auto_387326 ?auto_387330 ) ) ( not ( = ?auto_387326 ?auto_387331 ) ) ( not ( = ?auto_387326 ?auto_387332 ) ) ( not ( = ?auto_387327 ?auto_387328 ) ) ( not ( = ?auto_387327 ?auto_387329 ) ) ( not ( = ?auto_387327 ?auto_387330 ) ) ( not ( = ?auto_387327 ?auto_387331 ) ) ( not ( = ?auto_387327 ?auto_387332 ) ) ( not ( = ?auto_387328 ?auto_387329 ) ) ( not ( = ?auto_387328 ?auto_387330 ) ) ( not ( = ?auto_387328 ?auto_387331 ) ) ( not ( = ?auto_387328 ?auto_387332 ) ) ( not ( = ?auto_387329 ?auto_387330 ) ) ( not ( = ?auto_387329 ?auto_387331 ) ) ( not ( = ?auto_387329 ?auto_387332 ) ) ( not ( = ?auto_387330 ?auto_387331 ) ) ( not ( = ?auto_387330 ?auto_387332 ) ) ( not ( = ?auto_387331 ?auto_387332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387331 ?auto_387332 )
      ( !STACK ?auto_387331 ?auto_387330 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387358 - BLOCK
      ?auto_387359 - BLOCK
      ?auto_387360 - BLOCK
      ?auto_387361 - BLOCK
      ?auto_387362 - BLOCK
      ?auto_387363 - BLOCK
      ?auto_387364 - BLOCK
      ?auto_387365 - BLOCK
    )
    :vars
    (
      ?auto_387366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387365 ?auto_387366 ) ( ON-TABLE ?auto_387358 ) ( ON ?auto_387359 ?auto_387358 ) ( ON ?auto_387360 ?auto_387359 ) ( ON ?auto_387361 ?auto_387360 ) ( ON ?auto_387362 ?auto_387361 ) ( ON ?auto_387363 ?auto_387362 ) ( not ( = ?auto_387358 ?auto_387359 ) ) ( not ( = ?auto_387358 ?auto_387360 ) ) ( not ( = ?auto_387358 ?auto_387361 ) ) ( not ( = ?auto_387358 ?auto_387362 ) ) ( not ( = ?auto_387358 ?auto_387363 ) ) ( not ( = ?auto_387358 ?auto_387364 ) ) ( not ( = ?auto_387358 ?auto_387365 ) ) ( not ( = ?auto_387358 ?auto_387366 ) ) ( not ( = ?auto_387359 ?auto_387360 ) ) ( not ( = ?auto_387359 ?auto_387361 ) ) ( not ( = ?auto_387359 ?auto_387362 ) ) ( not ( = ?auto_387359 ?auto_387363 ) ) ( not ( = ?auto_387359 ?auto_387364 ) ) ( not ( = ?auto_387359 ?auto_387365 ) ) ( not ( = ?auto_387359 ?auto_387366 ) ) ( not ( = ?auto_387360 ?auto_387361 ) ) ( not ( = ?auto_387360 ?auto_387362 ) ) ( not ( = ?auto_387360 ?auto_387363 ) ) ( not ( = ?auto_387360 ?auto_387364 ) ) ( not ( = ?auto_387360 ?auto_387365 ) ) ( not ( = ?auto_387360 ?auto_387366 ) ) ( not ( = ?auto_387361 ?auto_387362 ) ) ( not ( = ?auto_387361 ?auto_387363 ) ) ( not ( = ?auto_387361 ?auto_387364 ) ) ( not ( = ?auto_387361 ?auto_387365 ) ) ( not ( = ?auto_387361 ?auto_387366 ) ) ( not ( = ?auto_387362 ?auto_387363 ) ) ( not ( = ?auto_387362 ?auto_387364 ) ) ( not ( = ?auto_387362 ?auto_387365 ) ) ( not ( = ?auto_387362 ?auto_387366 ) ) ( not ( = ?auto_387363 ?auto_387364 ) ) ( not ( = ?auto_387363 ?auto_387365 ) ) ( not ( = ?auto_387363 ?auto_387366 ) ) ( not ( = ?auto_387364 ?auto_387365 ) ) ( not ( = ?auto_387364 ?auto_387366 ) ) ( not ( = ?auto_387365 ?auto_387366 ) ) ( CLEAR ?auto_387363 ) ( ON ?auto_387364 ?auto_387365 ) ( CLEAR ?auto_387364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_387358 ?auto_387359 ?auto_387360 ?auto_387361 ?auto_387362 ?auto_387363 ?auto_387364 )
      ( MAKE-8PILE ?auto_387358 ?auto_387359 ?auto_387360 ?auto_387361 ?auto_387362 ?auto_387363 ?auto_387364 ?auto_387365 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387392 - BLOCK
      ?auto_387393 - BLOCK
      ?auto_387394 - BLOCK
      ?auto_387395 - BLOCK
      ?auto_387396 - BLOCK
      ?auto_387397 - BLOCK
      ?auto_387398 - BLOCK
      ?auto_387399 - BLOCK
    )
    :vars
    (
      ?auto_387400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387399 ?auto_387400 ) ( ON-TABLE ?auto_387392 ) ( ON ?auto_387393 ?auto_387392 ) ( ON ?auto_387394 ?auto_387393 ) ( ON ?auto_387395 ?auto_387394 ) ( ON ?auto_387396 ?auto_387395 ) ( not ( = ?auto_387392 ?auto_387393 ) ) ( not ( = ?auto_387392 ?auto_387394 ) ) ( not ( = ?auto_387392 ?auto_387395 ) ) ( not ( = ?auto_387392 ?auto_387396 ) ) ( not ( = ?auto_387392 ?auto_387397 ) ) ( not ( = ?auto_387392 ?auto_387398 ) ) ( not ( = ?auto_387392 ?auto_387399 ) ) ( not ( = ?auto_387392 ?auto_387400 ) ) ( not ( = ?auto_387393 ?auto_387394 ) ) ( not ( = ?auto_387393 ?auto_387395 ) ) ( not ( = ?auto_387393 ?auto_387396 ) ) ( not ( = ?auto_387393 ?auto_387397 ) ) ( not ( = ?auto_387393 ?auto_387398 ) ) ( not ( = ?auto_387393 ?auto_387399 ) ) ( not ( = ?auto_387393 ?auto_387400 ) ) ( not ( = ?auto_387394 ?auto_387395 ) ) ( not ( = ?auto_387394 ?auto_387396 ) ) ( not ( = ?auto_387394 ?auto_387397 ) ) ( not ( = ?auto_387394 ?auto_387398 ) ) ( not ( = ?auto_387394 ?auto_387399 ) ) ( not ( = ?auto_387394 ?auto_387400 ) ) ( not ( = ?auto_387395 ?auto_387396 ) ) ( not ( = ?auto_387395 ?auto_387397 ) ) ( not ( = ?auto_387395 ?auto_387398 ) ) ( not ( = ?auto_387395 ?auto_387399 ) ) ( not ( = ?auto_387395 ?auto_387400 ) ) ( not ( = ?auto_387396 ?auto_387397 ) ) ( not ( = ?auto_387396 ?auto_387398 ) ) ( not ( = ?auto_387396 ?auto_387399 ) ) ( not ( = ?auto_387396 ?auto_387400 ) ) ( not ( = ?auto_387397 ?auto_387398 ) ) ( not ( = ?auto_387397 ?auto_387399 ) ) ( not ( = ?auto_387397 ?auto_387400 ) ) ( not ( = ?auto_387398 ?auto_387399 ) ) ( not ( = ?auto_387398 ?auto_387400 ) ) ( not ( = ?auto_387399 ?auto_387400 ) ) ( ON ?auto_387398 ?auto_387399 ) ( CLEAR ?auto_387396 ) ( ON ?auto_387397 ?auto_387398 ) ( CLEAR ?auto_387397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_387392 ?auto_387393 ?auto_387394 ?auto_387395 ?auto_387396 ?auto_387397 )
      ( MAKE-8PILE ?auto_387392 ?auto_387393 ?auto_387394 ?auto_387395 ?auto_387396 ?auto_387397 ?auto_387398 ?auto_387399 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387426 - BLOCK
      ?auto_387427 - BLOCK
      ?auto_387428 - BLOCK
      ?auto_387429 - BLOCK
      ?auto_387430 - BLOCK
      ?auto_387431 - BLOCK
      ?auto_387432 - BLOCK
      ?auto_387433 - BLOCK
    )
    :vars
    (
      ?auto_387434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387433 ?auto_387434 ) ( ON-TABLE ?auto_387426 ) ( ON ?auto_387427 ?auto_387426 ) ( ON ?auto_387428 ?auto_387427 ) ( ON ?auto_387429 ?auto_387428 ) ( not ( = ?auto_387426 ?auto_387427 ) ) ( not ( = ?auto_387426 ?auto_387428 ) ) ( not ( = ?auto_387426 ?auto_387429 ) ) ( not ( = ?auto_387426 ?auto_387430 ) ) ( not ( = ?auto_387426 ?auto_387431 ) ) ( not ( = ?auto_387426 ?auto_387432 ) ) ( not ( = ?auto_387426 ?auto_387433 ) ) ( not ( = ?auto_387426 ?auto_387434 ) ) ( not ( = ?auto_387427 ?auto_387428 ) ) ( not ( = ?auto_387427 ?auto_387429 ) ) ( not ( = ?auto_387427 ?auto_387430 ) ) ( not ( = ?auto_387427 ?auto_387431 ) ) ( not ( = ?auto_387427 ?auto_387432 ) ) ( not ( = ?auto_387427 ?auto_387433 ) ) ( not ( = ?auto_387427 ?auto_387434 ) ) ( not ( = ?auto_387428 ?auto_387429 ) ) ( not ( = ?auto_387428 ?auto_387430 ) ) ( not ( = ?auto_387428 ?auto_387431 ) ) ( not ( = ?auto_387428 ?auto_387432 ) ) ( not ( = ?auto_387428 ?auto_387433 ) ) ( not ( = ?auto_387428 ?auto_387434 ) ) ( not ( = ?auto_387429 ?auto_387430 ) ) ( not ( = ?auto_387429 ?auto_387431 ) ) ( not ( = ?auto_387429 ?auto_387432 ) ) ( not ( = ?auto_387429 ?auto_387433 ) ) ( not ( = ?auto_387429 ?auto_387434 ) ) ( not ( = ?auto_387430 ?auto_387431 ) ) ( not ( = ?auto_387430 ?auto_387432 ) ) ( not ( = ?auto_387430 ?auto_387433 ) ) ( not ( = ?auto_387430 ?auto_387434 ) ) ( not ( = ?auto_387431 ?auto_387432 ) ) ( not ( = ?auto_387431 ?auto_387433 ) ) ( not ( = ?auto_387431 ?auto_387434 ) ) ( not ( = ?auto_387432 ?auto_387433 ) ) ( not ( = ?auto_387432 ?auto_387434 ) ) ( not ( = ?auto_387433 ?auto_387434 ) ) ( ON ?auto_387432 ?auto_387433 ) ( ON ?auto_387431 ?auto_387432 ) ( CLEAR ?auto_387429 ) ( ON ?auto_387430 ?auto_387431 ) ( CLEAR ?auto_387430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_387426 ?auto_387427 ?auto_387428 ?auto_387429 ?auto_387430 )
      ( MAKE-8PILE ?auto_387426 ?auto_387427 ?auto_387428 ?auto_387429 ?auto_387430 ?auto_387431 ?auto_387432 ?auto_387433 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387460 - BLOCK
      ?auto_387461 - BLOCK
      ?auto_387462 - BLOCK
      ?auto_387463 - BLOCK
      ?auto_387464 - BLOCK
      ?auto_387465 - BLOCK
      ?auto_387466 - BLOCK
      ?auto_387467 - BLOCK
    )
    :vars
    (
      ?auto_387468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387467 ?auto_387468 ) ( ON-TABLE ?auto_387460 ) ( ON ?auto_387461 ?auto_387460 ) ( ON ?auto_387462 ?auto_387461 ) ( not ( = ?auto_387460 ?auto_387461 ) ) ( not ( = ?auto_387460 ?auto_387462 ) ) ( not ( = ?auto_387460 ?auto_387463 ) ) ( not ( = ?auto_387460 ?auto_387464 ) ) ( not ( = ?auto_387460 ?auto_387465 ) ) ( not ( = ?auto_387460 ?auto_387466 ) ) ( not ( = ?auto_387460 ?auto_387467 ) ) ( not ( = ?auto_387460 ?auto_387468 ) ) ( not ( = ?auto_387461 ?auto_387462 ) ) ( not ( = ?auto_387461 ?auto_387463 ) ) ( not ( = ?auto_387461 ?auto_387464 ) ) ( not ( = ?auto_387461 ?auto_387465 ) ) ( not ( = ?auto_387461 ?auto_387466 ) ) ( not ( = ?auto_387461 ?auto_387467 ) ) ( not ( = ?auto_387461 ?auto_387468 ) ) ( not ( = ?auto_387462 ?auto_387463 ) ) ( not ( = ?auto_387462 ?auto_387464 ) ) ( not ( = ?auto_387462 ?auto_387465 ) ) ( not ( = ?auto_387462 ?auto_387466 ) ) ( not ( = ?auto_387462 ?auto_387467 ) ) ( not ( = ?auto_387462 ?auto_387468 ) ) ( not ( = ?auto_387463 ?auto_387464 ) ) ( not ( = ?auto_387463 ?auto_387465 ) ) ( not ( = ?auto_387463 ?auto_387466 ) ) ( not ( = ?auto_387463 ?auto_387467 ) ) ( not ( = ?auto_387463 ?auto_387468 ) ) ( not ( = ?auto_387464 ?auto_387465 ) ) ( not ( = ?auto_387464 ?auto_387466 ) ) ( not ( = ?auto_387464 ?auto_387467 ) ) ( not ( = ?auto_387464 ?auto_387468 ) ) ( not ( = ?auto_387465 ?auto_387466 ) ) ( not ( = ?auto_387465 ?auto_387467 ) ) ( not ( = ?auto_387465 ?auto_387468 ) ) ( not ( = ?auto_387466 ?auto_387467 ) ) ( not ( = ?auto_387466 ?auto_387468 ) ) ( not ( = ?auto_387467 ?auto_387468 ) ) ( ON ?auto_387466 ?auto_387467 ) ( ON ?auto_387465 ?auto_387466 ) ( ON ?auto_387464 ?auto_387465 ) ( CLEAR ?auto_387462 ) ( ON ?auto_387463 ?auto_387464 ) ( CLEAR ?auto_387463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387460 ?auto_387461 ?auto_387462 ?auto_387463 )
      ( MAKE-8PILE ?auto_387460 ?auto_387461 ?auto_387462 ?auto_387463 ?auto_387464 ?auto_387465 ?auto_387466 ?auto_387467 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387494 - BLOCK
      ?auto_387495 - BLOCK
      ?auto_387496 - BLOCK
      ?auto_387497 - BLOCK
      ?auto_387498 - BLOCK
      ?auto_387499 - BLOCK
      ?auto_387500 - BLOCK
      ?auto_387501 - BLOCK
    )
    :vars
    (
      ?auto_387502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387501 ?auto_387502 ) ( ON-TABLE ?auto_387494 ) ( ON ?auto_387495 ?auto_387494 ) ( not ( = ?auto_387494 ?auto_387495 ) ) ( not ( = ?auto_387494 ?auto_387496 ) ) ( not ( = ?auto_387494 ?auto_387497 ) ) ( not ( = ?auto_387494 ?auto_387498 ) ) ( not ( = ?auto_387494 ?auto_387499 ) ) ( not ( = ?auto_387494 ?auto_387500 ) ) ( not ( = ?auto_387494 ?auto_387501 ) ) ( not ( = ?auto_387494 ?auto_387502 ) ) ( not ( = ?auto_387495 ?auto_387496 ) ) ( not ( = ?auto_387495 ?auto_387497 ) ) ( not ( = ?auto_387495 ?auto_387498 ) ) ( not ( = ?auto_387495 ?auto_387499 ) ) ( not ( = ?auto_387495 ?auto_387500 ) ) ( not ( = ?auto_387495 ?auto_387501 ) ) ( not ( = ?auto_387495 ?auto_387502 ) ) ( not ( = ?auto_387496 ?auto_387497 ) ) ( not ( = ?auto_387496 ?auto_387498 ) ) ( not ( = ?auto_387496 ?auto_387499 ) ) ( not ( = ?auto_387496 ?auto_387500 ) ) ( not ( = ?auto_387496 ?auto_387501 ) ) ( not ( = ?auto_387496 ?auto_387502 ) ) ( not ( = ?auto_387497 ?auto_387498 ) ) ( not ( = ?auto_387497 ?auto_387499 ) ) ( not ( = ?auto_387497 ?auto_387500 ) ) ( not ( = ?auto_387497 ?auto_387501 ) ) ( not ( = ?auto_387497 ?auto_387502 ) ) ( not ( = ?auto_387498 ?auto_387499 ) ) ( not ( = ?auto_387498 ?auto_387500 ) ) ( not ( = ?auto_387498 ?auto_387501 ) ) ( not ( = ?auto_387498 ?auto_387502 ) ) ( not ( = ?auto_387499 ?auto_387500 ) ) ( not ( = ?auto_387499 ?auto_387501 ) ) ( not ( = ?auto_387499 ?auto_387502 ) ) ( not ( = ?auto_387500 ?auto_387501 ) ) ( not ( = ?auto_387500 ?auto_387502 ) ) ( not ( = ?auto_387501 ?auto_387502 ) ) ( ON ?auto_387500 ?auto_387501 ) ( ON ?auto_387499 ?auto_387500 ) ( ON ?auto_387498 ?auto_387499 ) ( ON ?auto_387497 ?auto_387498 ) ( CLEAR ?auto_387495 ) ( ON ?auto_387496 ?auto_387497 ) ( CLEAR ?auto_387496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387494 ?auto_387495 ?auto_387496 )
      ( MAKE-8PILE ?auto_387494 ?auto_387495 ?auto_387496 ?auto_387497 ?auto_387498 ?auto_387499 ?auto_387500 ?auto_387501 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387528 - BLOCK
      ?auto_387529 - BLOCK
      ?auto_387530 - BLOCK
      ?auto_387531 - BLOCK
      ?auto_387532 - BLOCK
      ?auto_387533 - BLOCK
      ?auto_387534 - BLOCK
      ?auto_387535 - BLOCK
    )
    :vars
    (
      ?auto_387536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387535 ?auto_387536 ) ( ON-TABLE ?auto_387528 ) ( not ( = ?auto_387528 ?auto_387529 ) ) ( not ( = ?auto_387528 ?auto_387530 ) ) ( not ( = ?auto_387528 ?auto_387531 ) ) ( not ( = ?auto_387528 ?auto_387532 ) ) ( not ( = ?auto_387528 ?auto_387533 ) ) ( not ( = ?auto_387528 ?auto_387534 ) ) ( not ( = ?auto_387528 ?auto_387535 ) ) ( not ( = ?auto_387528 ?auto_387536 ) ) ( not ( = ?auto_387529 ?auto_387530 ) ) ( not ( = ?auto_387529 ?auto_387531 ) ) ( not ( = ?auto_387529 ?auto_387532 ) ) ( not ( = ?auto_387529 ?auto_387533 ) ) ( not ( = ?auto_387529 ?auto_387534 ) ) ( not ( = ?auto_387529 ?auto_387535 ) ) ( not ( = ?auto_387529 ?auto_387536 ) ) ( not ( = ?auto_387530 ?auto_387531 ) ) ( not ( = ?auto_387530 ?auto_387532 ) ) ( not ( = ?auto_387530 ?auto_387533 ) ) ( not ( = ?auto_387530 ?auto_387534 ) ) ( not ( = ?auto_387530 ?auto_387535 ) ) ( not ( = ?auto_387530 ?auto_387536 ) ) ( not ( = ?auto_387531 ?auto_387532 ) ) ( not ( = ?auto_387531 ?auto_387533 ) ) ( not ( = ?auto_387531 ?auto_387534 ) ) ( not ( = ?auto_387531 ?auto_387535 ) ) ( not ( = ?auto_387531 ?auto_387536 ) ) ( not ( = ?auto_387532 ?auto_387533 ) ) ( not ( = ?auto_387532 ?auto_387534 ) ) ( not ( = ?auto_387532 ?auto_387535 ) ) ( not ( = ?auto_387532 ?auto_387536 ) ) ( not ( = ?auto_387533 ?auto_387534 ) ) ( not ( = ?auto_387533 ?auto_387535 ) ) ( not ( = ?auto_387533 ?auto_387536 ) ) ( not ( = ?auto_387534 ?auto_387535 ) ) ( not ( = ?auto_387534 ?auto_387536 ) ) ( not ( = ?auto_387535 ?auto_387536 ) ) ( ON ?auto_387534 ?auto_387535 ) ( ON ?auto_387533 ?auto_387534 ) ( ON ?auto_387532 ?auto_387533 ) ( ON ?auto_387531 ?auto_387532 ) ( ON ?auto_387530 ?auto_387531 ) ( CLEAR ?auto_387528 ) ( ON ?auto_387529 ?auto_387530 ) ( CLEAR ?auto_387529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387528 ?auto_387529 )
      ( MAKE-8PILE ?auto_387528 ?auto_387529 ?auto_387530 ?auto_387531 ?auto_387532 ?auto_387533 ?auto_387534 ?auto_387535 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387562 - BLOCK
      ?auto_387563 - BLOCK
      ?auto_387564 - BLOCK
      ?auto_387565 - BLOCK
      ?auto_387566 - BLOCK
      ?auto_387567 - BLOCK
      ?auto_387568 - BLOCK
      ?auto_387569 - BLOCK
    )
    :vars
    (
      ?auto_387570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387569 ?auto_387570 ) ( not ( = ?auto_387562 ?auto_387563 ) ) ( not ( = ?auto_387562 ?auto_387564 ) ) ( not ( = ?auto_387562 ?auto_387565 ) ) ( not ( = ?auto_387562 ?auto_387566 ) ) ( not ( = ?auto_387562 ?auto_387567 ) ) ( not ( = ?auto_387562 ?auto_387568 ) ) ( not ( = ?auto_387562 ?auto_387569 ) ) ( not ( = ?auto_387562 ?auto_387570 ) ) ( not ( = ?auto_387563 ?auto_387564 ) ) ( not ( = ?auto_387563 ?auto_387565 ) ) ( not ( = ?auto_387563 ?auto_387566 ) ) ( not ( = ?auto_387563 ?auto_387567 ) ) ( not ( = ?auto_387563 ?auto_387568 ) ) ( not ( = ?auto_387563 ?auto_387569 ) ) ( not ( = ?auto_387563 ?auto_387570 ) ) ( not ( = ?auto_387564 ?auto_387565 ) ) ( not ( = ?auto_387564 ?auto_387566 ) ) ( not ( = ?auto_387564 ?auto_387567 ) ) ( not ( = ?auto_387564 ?auto_387568 ) ) ( not ( = ?auto_387564 ?auto_387569 ) ) ( not ( = ?auto_387564 ?auto_387570 ) ) ( not ( = ?auto_387565 ?auto_387566 ) ) ( not ( = ?auto_387565 ?auto_387567 ) ) ( not ( = ?auto_387565 ?auto_387568 ) ) ( not ( = ?auto_387565 ?auto_387569 ) ) ( not ( = ?auto_387565 ?auto_387570 ) ) ( not ( = ?auto_387566 ?auto_387567 ) ) ( not ( = ?auto_387566 ?auto_387568 ) ) ( not ( = ?auto_387566 ?auto_387569 ) ) ( not ( = ?auto_387566 ?auto_387570 ) ) ( not ( = ?auto_387567 ?auto_387568 ) ) ( not ( = ?auto_387567 ?auto_387569 ) ) ( not ( = ?auto_387567 ?auto_387570 ) ) ( not ( = ?auto_387568 ?auto_387569 ) ) ( not ( = ?auto_387568 ?auto_387570 ) ) ( not ( = ?auto_387569 ?auto_387570 ) ) ( ON ?auto_387568 ?auto_387569 ) ( ON ?auto_387567 ?auto_387568 ) ( ON ?auto_387566 ?auto_387567 ) ( ON ?auto_387565 ?auto_387566 ) ( ON ?auto_387564 ?auto_387565 ) ( ON ?auto_387563 ?auto_387564 ) ( ON ?auto_387562 ?auto_387563 ) ( CLEAR ?auto_387562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387562 )
      ( MAKE-8PILE ?auto_387562 ?auto_387563 ?auto_387564 ?auto_387565 ?auto_387566 ?auto_387567 ?auto_387568 ?auto_387569 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387597 - BLOCK
      ?auto_387598 - BLOCK
      ?auto_387599 - BLOCK
      ?auto_387600 - BLOCK
      ?auto_387601 - BLOCK
      ?auto_387602 - BLOCK
      ?auto_387603 - BLOCK
      ?auto_387604 - BLOCK
      ?auto_387605 - BLOCK
    )
    :vars
    (
      ?auto_387606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387604 ) ( ON ?auto_387605 ?auto_387606 ) ( CLEAR ?auto_387605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387597 ) ( ON ?auto_387598 ?auto_387597 ) ( ON ?auto_387599 ?auto_387598 ) ( ON ?auto_387600 ?auto_387599 ) ( ON ?auto_387601 ?auto_387600 ) ( ON ?auto_387602 ?auto_387601 ) ( ON ?auto_387603 ?auto_387602 ) ( ON ?auto_387604 ?auto_387603 ) ( not ( = ?auto_387597 ?auto_387598 ) ) ( not ( = ?auto_387597 ?auto_387599 ) ) ( not ( = ?auto_387597 ?auto_387600 ) ) ( not ( = ?auto_387597 ?auto_387601 ) ) ( not ( = ?auto_387597 ?auto_387602 ) ) ( not ( = ?auto_387597 ?auto_387603 ) ) ( not ( = ?auto_387597 ?auto_387604 ) ) ( not ( = ?auto_387597 ?auto_387605 ) ) ( not ( = ?auto_387597 ?auto_387606 ) ) ( not ( = ?auto_387598 ?auto_387599 ) ) ( not ( = ?auto_387598 ?auto_387600 ) ) ( not ( = ?auto_387598 ?auto_387601 ) ) ( not ( = ?auto_387598 ?auto_387602 ) ) ( not ( = ?auto_387598 ?auto_387603 ) ) ( not ( = ?auto_387598 ?auto_387604 ) ) ( not ( = ?auto_387598 ?auto_387605 ) ) ( not ( = ?auto_387598 ?auto_387606 ) ) ( not ( = ?auto_387599 ?auto_387600 ) ) ( not ( = ?auto_387599 ?auto_387601 ) ) ( not ( = ?auto_387599 ?auto_387602 ) ) ( not ( = ?auto_387599 ?auto_387603 ) ) ( not ( = ?auto_387599 ?auto_387604 ) ) ( not ( = ?auto_387599 ?auto_387605 ) ) ( not ( = ?auto_387599 ?auto_387606 ) ) ( not ( = ?auto_387600 ?auto_387601 ) ) ( not ( = ?auto_387600 ?auto_387602 ) ) ( not ( = ?auto_387600 ?auto_387603 ) ) ( not ( = ?auto_387600 ?auto_387604 ) ) ( not ( = ?auto_387600 ?auto_387605 ) ) ( not ( = ?auto_387600 ?auto_387606 ) ) ( not ( = ?auto_387601 ?auto_387602 ) ) ( not ( = ?auto_387601 ?auto_387603 ) ) ( not ( = ?auto_387601 ?auto_387604 ) ) ( not ( = ?auto_387601 ?auto_387605 ) ) ( not ( = ?auto_387601 ?auto_387606 ) ) ( not ( = ?auto_387602 ?auto_387603 ) ) ( not ( = ?auto_387602 ?auto_387604 ) ) ( not ( = ?auto_387602 ?auto_387605 ) ) ( not ( = ?auto_387602 ?auto_387606 ) ) ( not ( = ?auto_387603 ?auto_387604 ) ) ( not ( = ?auto_387603 ?auto_387605 ) ) ( not ( = ?auto_387603 ?auto_387606 ) ) ( not ( = ?auto_387604 ?auto_387605 ) ) ( not ( = ?auto_387604 ?auto_387606 ) ) ( not ( = ?auto_387605 ?auto_387606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387605 ?auto_387606 )
      ( !STACK ?auto_387605 ?auto_387604 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387635 - BLOCK
      ?auto_387636 - BLOCK
      ?auto_387637 - BLOCK
      ?auto_387638 - BLOCK
      ?auto_387639 - BLOCK
      ?auto_387640 - BLOCK
      ?auto_387641 - BLOCK
      ?auto_387642 - BLOCK
      ?auto_387643 - BLOCK
    )
    :vars
    (
      ?auto_387644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387643 ?auto_387644 ) ( ON-TABLE ?auto_387635 ) ( ON ?auto_387636 ?auto_387635 ) ( ON ?auto_387637 ?auto_387636 ) ( ON ?auto_387638 ?auto_387637 ) ( ON ?auto_387639 ?auto_387638 ) ( ON ?auto_387640 ?auto_387639 ) ( ON ?auto_387641 ?auto_387640 ) ( not ( = ?auto_387635 ?auto_387636 ) ) ( not ( = ?auto_387635 ?auto_387637 ) ) ( not ( = ?auto_387635 ?auto_387638 ) ) ( not ( = ?auto_387635 ?auto_387639 ) ) ( not ( = ?auto_387635 ?auto_387640 ) ) ( not ( = ?auto_387635 ?auto_387641 ) ) ( not ( = ?auto_387635 ?auto_387642 ) ) ( not ( = ?auto_387635 ?auto_387643 ) ) ( not ( = ?auto_387635 ?auto_387644 ) ) ( not ( = ?auto_387636 ?auto_387637 ) ) ( not ( = ?auto_387636 ?auto_387638 ) ) ( not ( = ?auto_387636 ?auto_387639 ) ) ( not ( = ?auto_387636 ?auto_387640 ) ) ( not ( = ?auto_387636 ?auto_387641 ) ) ( not ( = ?auto_387636 ?auto_387642 ) ) ( not ( = ?auto_387636 ?auto_387643 ) ) ( not ( = ?auto_387636 ?auto_387644 ) ) ( not ( = ?auto_387637 ?auto_387638 ) ) ( not ( = ?auto_387637 ?auto_387639 ) ) ( not ( = ?auto_387637 ?auto_387640 ) ) ( not ( = ?auto_387637 ?auto_387641 ) ) ( not ( = ?auto_387637 ?auto_387642 ) ) ( not ( = ?auto_387637 ?auto_387643 ) ) ( not ( = ?auto_387637 ?auto_387644 ) ) ( not ( = ?auto_387638 ?auto_387639 ) ) ( not ( = ?auto_387638 ?auto_387640 ) ) ( not ( = ?auto_387638 ?auto_387641 ) ) ( not ( = ?auto_387638 ?auto_387642 ) ) ( not ( = ?auto_387638 ?auto_387643 ) ) ( not ( = ?auto_387638 ?auto_387644 ) ) ( not ( = ?auto_387639 ?auto_387640 ) ) ( not ( = ?auto_387639 ?auto_387641 ) ) ( not ( = ?auto_387639 ?auto_387642 ) ) ( not ( = ?auto_387639 ?auto_387643 ) ) ( not ( = ?auto_387639 ?auto_387644 ) ) ( not ( = ?auto_387640 ?auto_387641 ) ) ( not ( = ?auto_387640 ?auto_387642 ) ) ( not ( = ?auto_387640 ?auto_387643 ) ) ( not ( = ?auto_387640 ?auto_387644 ) ) ( not ( = ?auto_387641 ?auto_387642 ) ) ( not ( = ?auto_387641 ?auto_387643 ) ) ( not ( = ?auto_387641 ?auto_387644 ) ) ( not ( = ?auto_387642 ?auto_387643 ) ) ( not ( = ?auto_387642 ?auto_387644 ) ) ( not ( = ?auto_387643 ?auto_387644 ) ) ( CLEAR ?auto_387641 ) ( ON ?auto_387642 ?auto_387643 ) ( CLEAR ?auto_387642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_387635 ?auto_387636 ?auto_387637 ?auto_387638 ?auto_387639 ?auto_387640 ?auto_387641 ?auto_387642 )
      ( MAKE-9PILE ?auto_387635 ?auto_387636 ?auto_387637 ?auto_387638 ?auto_387639 ?auto_387640 ?auto_387641 ?auto_387642 ?auto_387643 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387673 - BLOCK
      ?auto_387674 - BLOCK
      ?auto_387675 - BLOCK
      ?auto_387676 - BLOCK
      ?auto_387677 - BLOCK
      ?auto_387678 - BLOCK
      ?auto_387679 - BLOCK
      ?auto_387680 - BLOCK
      ?auto_387681 - BLOCK
    )
    :vars
    (
      ?auto_387682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387681 ?auto_387682 ) ( ON-TABLE ?auto_387673 ) ( ON ?auto_387674 ?auto_387673 ) ( ON ?auto_387675 ?auto_387674 ) ( ON ?auto_387676 ?auto_387675 ) ( ON ?auto_387677 ?auto_387676 ) ( ON ?auto_387678 ?auto_387677 ) ( not ( = ?auto_387673 ?auto_387674 ) ) ( not ( = ?auto_387673 ?auto_387675 ) ) ( not ( = ?auto_387673 ?auto_387676 ) ) ( not ( = ?auto_387673 ?auto_387677 ) ) ( not ( = ?auto_387673 ?auto_387678 ) ) ( not ( = ?auto_387673 ?auto_387679 ) ) ( not ( = ?auto_387673 ?auto_387680 ) ) ( not ( = ?auto_387673 ?auto_387681 ) ) ( not ( = ?auto_387673 ?auto_387682 ) ) ( not ( = ?auto_387674 ?auto_387675 ) ) ( not ( = ?auto_387674 ?auto_387676 ) ) ( not ( = ?auto_387674 ?auto_387677 ) ) ( not ( = ?auto_387674 ?auto_387678 ) ) ( not ( = ?auto_387674 ?auto_387679 ) ) ( not ( = ?auto_387674 ?auto_387680 ) ) ( not ( = ?auto_387674 ?auto_387681 ) ) ( not ( = ?auto_387674 ?auto_387682 ) ) ( not ( = ?auto_387675 ?auto_387676 ) ) ( not ( = ?auto_387675 ?auto_387677 ) ) ( not ( = ?auto_387675 ?auto_387678 ) ) ( not ( = ?auto_387675 ?auto_387679 ) ) ( not ( = ?auto_387675 ?auto_387680 ) ) ( not ( = ?auto_387675 ?auto_387681 ) ) ( not ( = ?auto_387675 ?auto_387682 ) ) ( not ( = ?auto_387676 ?auto_387677 ) ) ( not ( = ?auto_387676 ?auto_387678 ) ) ( not ( = ?auto_387676 ?auto_387679 ) ) ( not ( = ?auto_387676 ?auto_387680 ) ) ( not ( = ?auto_387676 ?auto_387681 ) ) ( not ( = ?auto_387676 ?auto_387682 ) ) ( not ( = ?auto_387677 ?auto_387678 ) ) ( not ( = ?auto_387677 ?auto_387679 ) ) ( not ( = ?auto_387677 ?auto_387680 ) ) ( not ( = ?auto_387677 ?auto_387681 ) ) ( not ( = ?auto_387677 ?auto_387682 ) ) ( not ( = ?auto_387678 ?auto_387679 ) ) ( not ( = ?auto_387678 ?auto_387680 ) ) ( not ( = ?auto_387678 ?auto_387681 ) ) ( not ( = ?auto_387678 ?auto_387682 ) ) ( not ( = ?auto_387679 ?auto_387680 ) ) ( not ( = ?auto_387679 ?auto_387681 ) ) ( not ( = ?auto_387679 ?auto_387682 ) ) ( not ( = ?auto_387680 ?auto_387681 ) ) ( not ( = ?auto_387680 ?auto_387682 ) ) ( not ( = ?auto_387681 ?auto_387682 ) ) ( ON ?auto_387680 ?auto_387681 ) ( CLEAR ?auto_387678 ) ( ON ?auto_387679 ?auto_387680 ) ( CLEAR ?auto_387679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_387673 ?auto_387674 ?auto_387675 ?auto_387676 ?auto_387677 ?auto_387678 ?auto_387679 )
      ( MAKE-9PILE ?auto_387673 ?auto_387674 ?auto_387675 ?auto_387676 ?auto_387677 ?auto_387678 ?auto_387679 ?auto_387680 ?auto_387681 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387711 - BLOCK
      ?auto_387712 - BLOCK
      ?auto_387713 - BLOCK
      ?auto_387714 - BLOCK
      ?auto_387715 - BLOCK
      ?auto_387716 - BLOCK
      ?auto_387717 - BLOCK
      ?auto_387718 - BLOCK
      ?auto_387719 - BLOCK
    )
    :vars
    (
      ?auto_387720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387719 ?auto_387720 ) ( ON-TABLE ?auto_387711 ) ( ON ?auto_387712 ?auto_387711 ) ( ON ?auto_387713 ?auto_387712 ) ( ON ?auto_387714 ?auto_387713 ) ( ON ?auto_387715 ?auto_387714 ) ( not ( = ?auto_387711 ?auto_387712 ) ) ( not ( = ?auto_387711 ?auto_387713 ) ) ( not ( = ?auto_387711 ?auto_387714 ) ) ( not ( = ?auto_387711 ?auto_387715 ) ) ( not ( = ?auto_387711 ?auto_387716 ) ) ( not ( = ?auto_387711 ?auto_387717 ) ) ( not ( = ?auto_387711 ?auto_387718 ) ) ( not ( = ?auto_387711 ?auto_387719 ) ) ( not ( = ?auto_387711 ?auto_387720 ) ) ( not ( = ?auto_387712 ?auto_387713 ) ) ( not ( = ?auto_387712 ?auto_387714 ) ) ( not ( = ?auto_387712 ?auto_387715 ) ) ( not ( = ?auto_387712 ?auto_387716 ) ) ( not ( = ?auto_387712 ?auto_387717 ) ) ( not ( = ?auto_387712 ?auto_387718 ) ) ( not ( = ?auto_387712 ?auto_387719 ) ) ( not ( = ?auto_387712 ?auto_387720 ) ) ( not ( = ?auto_387713 ?auto_387714 ) ) ( not ( = ?auto_387713 ?auto_387715 ) ) ( not ( = ?auto_387713 ?auto_387716 ) ) ( not ( = ?auto_387713 ?auto_387717 ) ) ( not ( = ?auto_387713 ?auto_387718 ) ) ( not ( = ?auto_387713 ?auto_387719 ) ) ( not ( = ?auto_387713 ?auto_387720 ) ) ( not ( = ?auto_387714 ?auto_387715 ) ) ( not ( = ?auto_387714 ?auto_387716 ) ) ( not ( = ?auto_387714 ?auto_387717 ) ) ( not ( = ?auto_387714 ?auto_387718 ) ) ( not ( = ?auto_387714 ?auto_387719 ) ) ( not ( = ?auto_387714 ?auto_387720 ) ) ( not ( = ?auto_387715 ?auto_387716 ) ) ( not ( = ?auto_387715 ?auto_387717 ) ) ( not ( = ?auto_387715 ?auto_387718 ) ) ( not ( = ?auto_387715 ?auto_387719 ) ) ( not ( = ?auto_387715 ?auto_387720 ) ) ( not ( = ?auto_387716 ?auto_387717 ) ) ( not ( = ?auto_387716 ?auto_387718 ) ) ( not ( = ?auto_387716 ?auto_387719 ) ) ( not ( = ?auto_387716 ?auto_387720 ) ) ( not ( = ?auto_387717 ?auto_387718 ) ) ( not ( = ?auto_387717 ?auto_387719 ) ) ( not ( = ?auto_387717 ?auto_387720 ) ) ( not ( = ?auto_387718 ?auto_387719 ) ) ( not ( = ?auto_387718 ?auto_387720 ) ) ( not ( = ?auto_387719 ?auto_387720 ) ) ( ON ?auto_387718 ?auto_387719 ) ( ON ?auto_387717 ?auto_387718 ) ( CLEAR ?auto_387715 ) ( ON ?auto_387716 ?auto_387717 ) ( CLEAR ?auto_387716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_387711 ?auto_387712 ?auto_387713 ?auto_387714 ?auto_387715 ?auto_387716 )
      ( MAKE-9PILE ?auto_387711 ?auto_387712 ?auto_387713 ?auto_387714 ?auto_387715 ?auto_387716 ?auto_387717 ?auto_387718 ?auto_387719 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387749 - BLOCK
      ?auto_387750 - BLOCK
      ?auto_387751 - BLOCK
      ?auto_387752 - BLOCK
      ?auto_387753 - BLOCK
      ?auto_387754 - BLOCK
      ?auto_387755 - BLOCK
      ?auto_387756 - BLOCK
      ?auto_387757 - BLOCK
    )
    :vars
    (
      ?auto_387758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387757 ?auto_387758 ) ( ON-TABLE ?auto_387749 ) ( ON ?auto_387750 ?auto_387749 ) ( ON ?auto_387751 ?auto_387750 ) ( ON ?auto_387752 ?auto_387751 ) ( not ( = ?auto_387749 ?auto_387750 ) ) ( not ( = ?auto_387749 ?auto_387751 ) ) ( not ( = ?auto_387749 ?auto_387752 ) ) ( not ( = ?auto_387749 ?auto_387753 ) ) ( not ( = ?auto_387749 ?auto_387754 ) ) ( not ( = ?auto_387749 ?auto_387755 ) ) ( not ( = ?auto_387749 ?auto_387756 ) ) ( not ( = ?auto_387749 ?auto_387757 ) ) ( not ( = ?auto_387749 ?auto_387758 ) ) ( not ( = ?auto_387750 ?auto_387751 ) ) ( not ( = ?auto_387750 ?auto_387752 ) ) ( not ( = ?auto_387750 ?auto_387753 ) ) ( not ( = ?auto_387750 ?auto_387754 ) ) ( not ( = ?auto_387750 ?auto_387755 ) ) ( not ( = ?auto_387750 ?auto_387756 ) ) ( not ( = ?auto_387750 ?auto_387757 ) ) ( not ( = ?auto_387750 ?auto_387758 ) ) ( not ( = ?auto_387751 ?auto_387752 ) ) ( not ( = ?auto_387751 ?auto_387753 ) ) ( not ( = ?auto_387751 ?auto_387754 ) ) ( not ( = ?auto_387751 ?auto_387755 ) ) ( not ( = ?auto_387751 ?auto_387756 ) ) ( not ( = ?auto_387751 ?auto_387757 ) ) ( not ( = ?auto_387751 ?auto_387758 ) ) ( not ( = ?auto_387752 ?auto_387753 ) ) ( not ( = ?auto_387752 ?auto_387754 ) ) ( not ( = ?auto_387752 ?auto_387755 ) ) ( not ( = ?auto_387752 ?auto_387756 ) ) ( not ( = ?auto_387752 ?auto_387757 ) ) ( not ( = ?auto_387752 ?auto_387758 ) ) ( not ( = ?auto_387753 ?auto_387754 ) ) ( not ( = ?auto_387753 ?auto_387755 ) ) ( not ( = ?auto_387753 ?auto_387756 ) ) ( not ( = ?auto_387753 ?auto_387757 ) ) ( not ( = ?auto_387753 ?auto_387758 ) ) ( not ( = ?auto_387754 ?auto_387755 ) ) ( not ( = ?auto_387754 ?auto_387756 ) ) ( not ( = ?auto_387754 ?auto_387757 ) ) ( not ( = ?auto_387754 ?auto_387758 ) ) ( not ( = ?auto_387755 ?auto_387756 ) ) ( not ( = ?auto_387755 ?auto_387757 ) ) ( not ( = ?auto_387755 ?auto_387758 ) ) ( not ( = ?auto_387756 ?auto_387757 ) ) ( not ( = ?auto_387756 ?auto_387758 ) ) ( not ( = ?auto_387757 ?auto_387758 ) ) ( ON ?auto_387756 ?auto_387757 ) ( ON ?auto_387755 ?auto_387756 ) ( ON ?auto_387754 ?auto_387755 ) ( CLEAR ?auto_387752 ) ( ON ?auto_387753 ?auto_387754 ) ( CLEAR ?auto_387753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_387749 ?auto_387750 ?auto_387751 ?auto_387752 ?auto_387753 )
      ( MAKE-9PILE ?auto_387749 ?auto_387750 ?auto_387751 ?auto_387752 ?auto_387753 ?auto_387754 ?auto_387755 ?auto_387756 ?auto_387757 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387787 - BLOCK
      ?auto_387788 - BLOCK
      ?auto_387789 - BLOCK
      ?auto_387790 - BLOCK
      ?auto_387791 - BLOCK
      ?auto_387792 - BLOCK
      ?auto_387793 - BLOCK
      ?auto_387794 - BLOCK
      ?auto_387795 - BLOCK
    )
    :vars
    (
      ?auto_387796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387795 ?auto_387796 ) ( ON-TABLE ?auto_387787 ) ( ON ?auto_387788 ?auto_387787 ) ( ON ?auto_387789 ?auto_387788 ) ( not ( = ?auto_387787 ?auto_387788 ) ) ( not ( = ?auto_387787 ?auto_387789 ) ) ( not ( = ?auto_387787 ?auto_387790 ) ) ( not ( = ?auto_387787 ?auto_387791 ) ) ( not ( = ?auto_387787 ?auto_387792 ) ) ( not ( = ?auto_387787 ?auto_387793 ) ) ( not ( = ?auto_387787 ?auto_387794 ) ) ( not ( = ?auto_387787 ?auto_387795 ) ) ( not ( = ?auto_387787 ?auto_387796 ) ) ( not ( = ?auto_387788 ?auto_387789 ) ) ( not ( = ?auto_387788 ?auto_387790 ) ) ( not ( = ?auto_387788 ?auto_387791 ) ) ( not ( = ?auto_387788 ?auto_387792 ) ) ( not ( = ?auto_387788 ?auto_387793 ) ) ( not ( = ?auto_387788 ?auto_387794 ) ) ( not ( = ?auto_387788 ?auto_387795 ) ) ( not ( = ?auto_387788 ?auto_387796 ) ) ( not ( = ?auto_387789 ?auto_387790 ) ) ( not ( = ?auto_387789 ?auto_387791 ) ) ( not ( = ?auto_387789 ?auto_387792 ) ) ( not ( = ?auto_387789 ?auto_387793 ) ) ( not ( = ?auto_387789 ?auto_387794 ) ) ( not ( = ?auto_387789 ?auto_387795 ) ) ( not ( = ?auto_387789 ?auto_387796 ) ) ( not ( = ?auto_387790 ?auto_387791 ) ) ( not ( = ?auto_387790 ?auto_387792 ) ) ( not ( = ?auto_387790 ?auto_387793 ) ) ( not ( = ?auto_387790 ?auto_387794 ) ) ( not ( = ?auto_387790 ?auto_387795 ) ) ( not ( = ?auto_387790 ?auto_387796 ) ) ( not ( = ?auto_387791 ?auto_387792 ) ) ( not ( = ?auto_387791 ?auto_387793 ) ) ( not ( = ?auto_387791 ?auto_387794 ) ) ( not ( = ?auto_387791 ?auto_387795 ) ) ( not ( = ?auto_387791 ?auto_387796 ) ) ( not ( = ?auto_387792 ?auto_387793 ) ) ( not ( = ?auto_387792 ?auto_387794 ) ) ( not ( = ?auto_387792 ?auto_387795 ) ) ( not ( = ?auto_387792 ?auto_387796 ) ) ( not ( = ?auto_387793 ?auto_387794 ) ) ( not ( = ?auto_387793 ?auto_387795 ) ) ( not ( = ?auto_387793 ?auto_387796 ) ) ( not ( = ?auto_387794 ?auto_387795 ) ) ( not ( = ?auto_387794 ?auto_387796 ) ) ( not ( = ?auto_387795 ?auto_387796 ) ) ( ON ?auto_387794 ?auto_387795 ) ( ON ?auto_387793 ?auto_387794 ) ( ON ?auto_387792 ?auto_387793 ) ( ON ?auto_387791 ?auto_387792 ) ( CLEAR ?auto_387789 ) ( ON ?auto_387790 ?auto_387791 ) ( CLEAR ?auto_387790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387787 ?auto_387788 ?auto_387789 ?auto_387790 )
      ( MAKE-9PILE ?auto_387787 ?auto_387788 ?auto_387789 ?auto_387790 ?auto_387791 ?auto_387792 ?auto_387793 ?auto_387794 ?auto_387795 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387825 - BLOCK
      ?auto_387826 - BLOCK
      ?auto_387827 - BLOCK
      ?auto_387828 - BLOCK
      ?auto_387829 - BLOCK
      ?auto_387830 - BLOCK
      ?auto_387831 - BLOCK
      ?auto_387832 - BLOCK
      ?auto_387833 - BLOCK
    )
    :vars
    (
      ?auto_387834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387833 ?auto_387834 ) ( ON-TABLE ?auto_387825 ) ( ON ?auto_387826 ?auto_387825 ) ( not ( = ?auto_387825 ?auto_387826 ) ) ( not ( = ?auto_387825 ?auto_387827 ) ) ( not ( = ?auto_387825 ?auto_387828 ) ) ( not ( = ?auto_387825 ?auto_387829 ) ) ( not ( = ?auto_387825 ?auto_387830 ) ) ( not ( = ?auto_387825 ?auto_387831 ) ) ( not ( = ?auto_387825 ?auto_387832 ) ) ( not ( = ?auto_387825 ?auto_387833 ) ) ( not ( = ?auto_387825 ?auto_387834 ) ) ( not ( = ?auto_387826 ?auto_387827 ) ) ( not ( = ?auto_387826 ?auto_387828 ) ) ( not ( = ?auto_387826 ?auto_387829 ) ) ( not ( = ?auto_387826 ?auto_387830 ) ) ( not ( = ?auto_387826 ?auto_387831 ) ) ( not ( = ?auto_387826 ?auto_387832 ) ) ( not ( = ?auto_387826 ?auto_387833 ) ) ( not ( = ?auto_387826 ?auto_387834 ) ) ( not ( = ?auto_387827 ?auto_387828 ) ) ( not ( = ?auto_387827 ?auto_387829 ) ) ( not ( = ?auto_387827 ?auto_387830 ) ) ( not ( = ?auto_387827 ?auto_387831 ) ) ( not ( = ?auto_387827 ?auto_387832 ) ) ( not ( = ?auto_387827 ?auto_387833 ) ) ( not ( = ?auto_387827 ?auto_387834 ) ) ( not ( = ?auto_387828 ?auto_387829 ) ) ( not ( = ?auto_387828 ?auto_387830 ) ) ( not ( = ?auto_387828 ?auto_387831 ) ) ( not ( = ?auto_387828 ?auto_387832 ) ) ( not ( = ?auto_387828 ?auto_387833 ) ) ( not ( = ?auto_387828 ?auto_387834 ) ) ( not ( = ?auto_387829 ?auto_387830 ) ) ( not ( = ?auto_387829 ?auto_387831 ) ) ( not ( = ?auto_387829 ?auto_387832 ) ) ( not ( = ?auto_387829 ?auto_387833 ) ) ( not ( = ?auto_387829 ?auto_387834 ) ) ( not ( = ?auto_387830 ?auto_387831 ) ) ( not ( = ?auto_387830 ?auto_387832 ) ) ( not ( = ?auto_387830 ?auto_387833 ) ) ( not ( = ?auto_387830 ?auto_387834 ) ) ( not ( = ?auto_387831 ?auto_387832 ) ) ( not ( = ?auto_387831 ?auto_387833 ) ) ( not ( = ?auto_387831 ?auto_387834 ) ) ( not ( = ?auto_387832 ?auto_387833 ) ) ( not ( = ?auto_387832 ?auto_387834 ) ) ( not ( = ?auto_387833 ?auto_387834 ) ) ( ON ?auto_387832 ?auto_387833 ) ( ON ?auto_387831 ?auto_387832 ) ( ON ?auto_387830 ?auto_387831 ) ( ON ?auto_387829 ?auto_387830 ) ( ON ?auto_387828 ?auto_387829 ) ( CLEAR ?auto_387826 ) ( ON ?auto_387827 ?auto_387828 ) ( CLEAR ?auto_387827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387825 ?auto_387826 ?auto_387827 )
      ( MAKE-9PILE ?auto_387825 ?auto_387826 ?auto_387827 ?auto_387828 ?auto_387829 ?auto_387830 ?auto_387831 ?auto_387832 ?auto_387833 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387863 - BLOCK
      ?auto_387864 - BLOCK
      ?auto_387865 - BLOCK
      ?auto_387866 - BLOCK
      ?auto_387867 - BLOCK
      ?auto_387868 - BLOCK
      ?auto_387869 - BLOCK
      ?auto_387870 - BLOCK
      ?auto_387871 - BLOCK
    )
    :vars
    (
      ?auto_387872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387871 ?auto_387872 ) ( ON-TABLE ?auto_387863 ) ( not ( = ?auto_387863 ?auto_387864 ) ) ( not ( = ?auto_387863 ?auto_387865 ) ) ( not ( = ?auto_387863 ?auto_387866 ) ) ( not ( = ?auto_387863 ?auto_387867 ) ) ( not ( = ?auto_387863 ?auto_387868 ) ) ( not ( = ?auto_387863 ?auto_387869 ) ) ( not ( = ?auto_387863 ?auto_387870 ) ) ( not ( = ?auto_387863 ?auto_387871 ) ) ( not ( = ?auto_387863 ?auto_387872 ) ) ( not ( = ?auto_387864 ?auto_387865 ) ) ( not ( = ?auto_387864 ?auto_387866 ) ) ( not ( = ?auto_387864 ?auto_387867 ) ) ( not ( = ?auto_387864 ?auto_387868 ) ) ( not ( = ?auto_387864 ?auto_387869 ) ) ( not ( = ?auto_387864 ?auto_387870 ) ) ( not ( = ?auto_387864 ?auto_387871 ) ) ( not ( = ?auto_387864 ?auto_387872 ) ) ( not ( = ?auto_387865 ?auto_387866 ) ) ( not ( = ?auto_387865 ?auto_387867 ) ) ( not ( = ?auto_387865 ?auto_387868 ) ) ( not ( = ?auto_387865 ?auto_387869 ) ) ( not ( = ?auto_387865 ?auto_387870 ) ) ( not ( = ?auto_387865 ?auto_387871 ) ) ( not ( = ?auto_387865 ?auto_387872 ) ) ( not ( = ?auto_387866 ?auto_387867 ) ) ( not ( = ?auto_387866 ?auto_387868 ) ) ( not ( = ?auto_387866 ?auto_387869 ) ) ( not ( = ?auto_387866 ?auto_387870 ) ) ( not ( = ?auto_387866 ?auto_387871 ) ) ( not ( = ?auto_387866 ?auto_387872 ) ) ( not ( = ?auto_387867 ?auto_387868 ) ) ( not ( = ?auto_387867 ?auto_387869 ) ) ( not ( = ?auto_387867 ?auto_387870 ) ) ( not ( = ?auto_387867 ?auto_387871 ) ) ( not ( = ?auto_387867 ?auto_387872 ) ) ( not ( = ?auto_387868 ?auto_387869 ) ) ( not ( = ?auto_387868 ?auto_387870 ) ) ( not ( = ?auto_387868 ?auto_387871 ) ) ( not ( = ?auto_387868 ?auto_387872 ) ) ( not ( = ?auto_387869 ?auto_387870 ) ) ( not ( = ?auto_387869 ?auto_387871 ) ) ( not ( = ?auto_387869 ?auto_387872 ) ) ( not ( = ?auto_387870 ?auto_387871 ) ) ( not ( = ?auto_387870 ?auto_387872 ) ) ( not ( = ?auto_387871 ?auto_387872 ) ) ( ON ?auto_387870 ?auto_387871 ) ( ON ?auto_387869 ?auto_387870 ) ( ON ?auto_387868 ?auto_387869 ) ( ON ?auto_387867 ?auto_387868 ) ( ON ?auto_387866 ?auto_387867 ) ( ON ?auto_387865 ?auto_387866 ) ( CLEAR ?auto_387863 ) ( ON ?auto_387864 ?auto_387865 ) ( CLEAR ?auto_387864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387863 ?auto_387864 )
      ( MAKE-9PILE ?auto_387863 ?auto_387864 ?auto_387865 ?auto_387866 ?auto_387867 ?auto_387868 ?auto_387869 ?auto_387870 ?auto_387871 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387901 - BLOCK
      ?auto_387902 - BLOCK
      ?auto_387903 - BLOCK
      ?auto_387904 - BLOCK
      ?auto_387905 - BLOCK
      ?auto_387906 - BLOCK
      ?auto_387907 - BLOCK
      ?auto_387908 - BLOCK
      ?auto_387909 - BLOCK
    )
    :vars
    (
      ?auto_387910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387909 ?auto_387910 ) ( not ( = ?auto_387901 ?auto_387902 ) ) ( not ( = ?auto_387901 ?auto_387903 ) ) ( not ( = ?auto_387901 ?auto_387904 ) ) ( not ( = ?auto_387901 ?auto_387905 ) ) ( not ( = ?auto_387901 ?auto_387906 ) ) ( not ( = ?auto_387901 ?auto_387907 ) ) ( not ( = ?auto_387901 ?auto_387908 ) ) ( not ( = ?auto_387901 ?auto_387909 ) ) ( not ( = ?auto_387901 ?auto_387910 ) ) ( not ( = ?auto_387902 ?auto_387903 ) ) ( not ( = ?auto_387902 ?auto_387904 ) ) ( not ( = ?auto_387902 ?auto_387905 ) ) ( not ( = ?auto_387902 ?auto_387906 ) ) ( not ( = ?auto_387902 ?auto_387907 ) ) ( not ( = ?auto_387902 ?auto_387908 ) ) ( not ( = ?auto_387902 ?auto_387909 ) ) ( not ( = ?auto_387902 ?auto_387910 ) ) ( not ( = ?auto_387903 ?auto_387904 ) ) ( not ( = ?auto_387903 ?auto_387905 ) ) ( not ( = ?auto_387903 ?auto_387906 ) ) ( not ( = ?auto_387903 ?auto_387907 ) ) ( not ( = ?auto_387903 ?auto_387908 ) ) ( not ( = ?auto_387903 ?auto_387909 ) ) ( not ( = ?auto_387903 ?auto_387910 ) ) ( not ( = ?auto_387904 ?auto_387905 ) ) ( not ( = ?auto_387904 ?auto_387906 ) ) ( not ( = ?auto_387904 ?auto_387907 ) ) ( not ( = ?auto_387904 ?auto_387908 ) ) ( not ( = ?auto_387904 ?auto_387909 ) ) ( not ( = ?auto_387904 ?auto_387910 ) ) ( not ( = ?auto_387905 ?auto_387906 ) ) ( not ( = ?auto_387905 ?auto_387907 ) ) ( not ( = ?auto_387905 ?auto_387908 ) ) ( not ( = ?auto_387905 ?auto_387909 ) ) ( not ( = ?auto_387905 ?auto_387910 ) ) ( not ( = ?auto_387906 ?auto_387907 ) ) ( not ( = ?auto_387906 ?auto_387908 ) ) ( not ( = ?auto_387906 ?auto_387909 ) ) ( not ( = ?auto_387906 ?auto_387910 ) ) ( not ( = ?auto_387907 ?auto_387908 ) ) ( not ( = ?auto_387907 ?auto_387909 ) ) ( not ( = ?auto_387907 ?auto_387910 ) ) ( not ( = ?auto_387908 ?auto_387909 ) ) ( not ( = ?auto_387908 ?auto_387910 ) ) ( not ( = ?auto_387909 ?auto_387910 ) ) ( ON ?auto_387908 ?auto_387909 ) ( ON ?auto_387907 ?auto_387908 ) ( ON ?auto_387906 ?auto_387907 ) ( ON ?auto_387905 ?auto_387906 ) ( ON ?auto_387904 ?auto_387905 ) ( ON ?auto_387903 ?auto_387904 ) ( ON ?auto_387902 ?auto_387903 ) ( ON ?auto_387901 ?auto_387902 ) ( CLEAR ?auto_387901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387901 )
      ( MAKE-9PILE ?auto_387901 ?auto_387902 ?auto_387903 ?auto_387904 ?auto_387905 ?auto_387906 ?auto_387907 ?auto_387908 ?auto_387909 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_387940 - BLOCK
      ?auto_387941 - BLOCK
      ?auto_387942 - BLOCK
      ?auto_387943 - BLOCK
      ?auto_387944 - BLOCK
      ?auto_387945 - BLOCK
      ?auto_387946 - BLOCK
      ?auto_387947 - BLOCK
      ?auto_387948 - BLOCK
      ?auto_387949 - BLOCK
    )
    :vars
    (
      ?auto_387950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387948 ) ( ON ?auto_387949 ?auto_387950 ) ( CLEAR ?auto_387949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387940 ) ( ON ?auto_387941 ?auto_387940 ) ( ON ?auto_387942 ?auto_387941 ) ( ON ?auto_387943 ?auto_387942 ) ( ON ?auto_387944 ?auto_387943 ) ( ON ?auto_387945 ?auto_387944 ) ( ON ?auto_387946 ?auto_387945 ) ( ON ?auto_387947 ?auto_387946 ) ( ON ?auto_387948 ?auto_387947 ) ( not ( = ?auto_387940 ?auto_387941 ) ) ( not ( = ?auto_387940 ?auto_387942 ) ) ( not ( = ?auto_387940 ?auto_387943 ) ) ( not ( = ?auto_387940 ?auto_387944 ) ) ( not ( = ?auto_387940 ?auto_387945 ) ) ( not ( = ?auto_387940 ?auto_387946 ) ) ( not ( = ?auto_387940 ?auto_387947 ) ) ( not ( = ?auto_387940 ?auto_387948 ) ) ( not ( = ?auto_387940 ?auto_387949 ) ) ( not ( = ?auto_387940 ?auto_387950 ) ) ( not ( = ?auto_387941 ?auto_387942 ) ) ( not ( = ?auto_387941 ?auto_387943 ) ) ( not ( = ?auto_387941 ?auto_387944 ) ) ( not ( = ?auto_387941 ?auto_387945 ) ) ( not ( = ?auto_387941 ?auto_387946 ) ) ( not ( = ?auto_387941 ?auto_387947 ) ) ( not ( = ?auto_387941 ?auto_387948 ) ) ( not ( = ?auto_387941 ?auto_387949 ) ) ( not ( = ?auto_387941 ?auto_387950 ) ) ( not ( = ?auto_387942 ?auto_387943 ) ) ( not ( = ?auto_387942 ?auto_387944 ) ) ( not ( = ?auto_387942 ?auto_387945 ) ) ( not ( = ?auto_387942 ?auto_387946 ) ) ( not ( = ?auto_387942 ?auto_387947 ) ) ( not ( = ?auto_387942 ?auto_387948 ) ) ( not ( = ?auto_387942 ?auto_387949 ) ) ( not ( = ?auto_387942 ?auto_387950 ) ) ( not ( = ?auto_387943 ?auto_387944 ) ) ( not ( = ?auto_387943 ?auto_387945 ) ) ( not ( = ?auto_387943 ?auto_387946 ) ) ( not ( = ?auto_387943 ?auto_387947 ) ) ( not ( = ?auto_387943 ?auto_387948 ) ) ( not ( = ?auto_387943 ?auto_387949 ) ) ( not ( = ?auto_387943 ?auto_387950 ) ) ( not ( = ?auto_387944 ?auto_387945 ) ) ( not ( = ?auto_387944 ?auto_387946 ) ) ( not ( = ?auto_387944 ?auto_387947 ) ) ( not ( = ?auto_387944 ?auto_387948 ) ) ( not ( = ?auto_387944 ?auto_387949 ) ) ( not ( = ?auto_387944 ?auto_387950 ) ) ( not ( = ?auto_387945 ?auto_387946 ) ) ( not ( = ?auto_387945 ?auto_387947 ) ) ( not ( = ?auto_387945 ?auto_387948 ) ) ( not ( = ?auto_387945 ?auto_387949 ) ) ( not ( = ?auto_387945 ?auto_387950 ) ) ( not ( = ?auto_387946 ?auto_387947 ) ) ( not ( = ?auto_387946 ?auto_387948 ) ) ( not ( = ?auto_387946 ?auto_387949 ) ) ( not ( = ?auto_387946 ?auto_387950 ) ) ( not ( = ?auto_387947 ?auto_387948 ) ) ( not ( = ?auto_387947 ?auto_387949 ) ) ( not ( = ?auto_387947 ?auto_387950 ) ) ( not ( = ?auto_387948 ?auto_387949 ) ) ( not ( = ?auto_387948 ?auto_387950 ) ) ( not ( = ?auto_387949 ?auto_387950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387949 ?auto_387950 )
      ( !STACK ?auto_387949 ?auto_387948 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_387982 - BLOCK
      ?auto_387983 - BLOCK
      ?auto_387984 - BLOCK
      ?auto_387985 - BLOCK
      ?auto_387986 - BLOCK
      ?auto_387987 - BLOCK
      ?auto_387988 - BLOCK
      ?auto_387989 - BLOCK
      ?auto_387990 - BLOCK
      ?auto_387991 - BLOCK
    )
    :vars
    (
      ?auto_387992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387991 ?auto_387992 ) ( ON-TABLE ?auto_387982 ) ( ON ?auto_387983 ?auto_387982 ) ( ON ?auto_387984 ?auto_387983 ) ( ON ?auto_387985 ?auto_387984 ) ( ON ?auto_387986 ?auto_387985 ) ( ON ?auto_387987 ?auto_387986 ) ( ON ?auto_387988 ?auto_387987 ) ( ON ?auto_387989 ?auto_387988 ) ( not ( = ?auto_387982 ?auto_387983 ) ) ( not ( = ?auto_387982 ?auto_387984 ) ) ( not ( = ?auto_387982 ?auto_387985 ) ) ( not ( = ?auto_387982 ?auto_387986 ) ) ( not ( = ?auto_387982 ?auto_387987 ) ) ( not ( = ?auto_387982 ?auto_387988 ) ) ( not ( = ?auto_387982 ?auto_387989 ) ) ( not ( = ?auto_387982 ?auto_387990 ) ) ( not ( = ?auto_387982 ?auto_387991 ) ) ( not ( = ?auto_387982 ?auto_387992 ) ) ( not ( = ?auto_387983 ?auto_387984 ) ) ( not ( = ?auto_387983 ?auto_387985 ) ) ( not ( = ?auto_387983 ?auto_387986 ) ) ( not ( = ?auto_387983 ?auto_387987 ) ) ( not ( = ?auto_387983 ?auto_387988 ) ) ( not ( = ?auto_387983 ?auto_387989 ) ) ( not ( = ?auto_387983 ?auto_387990 ) ) ( not ( = ?auto_387983 ?auto_387991 ) ) ( not ( = ?auto_387983 ?auto_387992 ) ) ( not ( = ?auto_387984 ?auto_387985 ) ) ( not ( = ?auto_387984 ?auto_387986 ) ) ( not ( = ?auto_387984 ?auto_387987 ) ) ( not ( = ?auto_387984 ?auto_387988 ) ) ( not ( = ?auto_387984 ?auto_387989 ) ) ( not ( = ?auto_387984 ?auto_387990 ) ) ( not ( = ?auto_387984 ?auto_387991 ) ) ( not ( = ?auto_387984 ?auto_387992 ) ) ( not ( = ?auto_387985 ?auto_387986 ) ) ( not ( = ?auto_387985 ?auto_387987 ) ) ( not ( = ?auto_387985 ?auto_387988 ) ) ( not ( = ?auto_387985 ?auto_387989 ) ) ( not ( = ?auto_387985 ?auto_387990 ) ) ( not ( = ?auto_387985 ?auto_387991 ) ) ( not ( = ?auto_387985 ?auto_387992 ) ) ( not ( = ?auto_387986 ?auto_387987 ) ) ( not ( = ?auto_387986 ?auto_387988 ) ) ( not ( = ?auto_387986 ?auto_387989 ) ) ( not ( = ?auto_387986 ?auto_387990 ) ) ( not ( = ?auto_387986 ?auto_387991 ) ) ( not ( = ?auto_387986 ?auto_387992 ) ) ( not ( = ?auto_387987 ?auto_387988 ) ) ( not ( = ?auto_387987 ?auto_387989 ) ) ( not ( = ?auto_387987 ?auto_387990 ) ) ( not ( = ?auto_387987 ?auto_387991 ) ) ( not ( = ?auto_387987 ?auto_387992 ) ) ( not ( = ?auto_387988 ?auto_387989 ) ) ( not ( = ?auto_387988 ?auto_387990 ) ) ( not ( = ?auto_387988 ?auto_387991 ) ) ( not ( = ?auto_387988 ?auto_387992 ) ) ( not ( = ?auto_387989 ?auto_387990 ) ) ( not ( = ?auto_387989 ?auto_387991 ) ) ( not ( = ?auto_387989 ?auto_387992 ) ) ( not ( = ?auto_387990 ?auto_387991 ) ) ( not ( = ?auto_387990 ?auto_387992 ) ) ( not ( = ?auto_387991 ?auto_387992 ) ) ( CLEAR ?auto_387989 ) ( ON ?auto_387990 ?auto_387991 ) ( CLEAR ?auto_387990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_387982 ?auto_387983 ?auto_387984 ?auto_387985 ?auto_387986 ?auto_387987 ?auto_387988 ?auto_387989 ?auto_387990 )
      ( MAKE-10PILE ?auto_387982 ?auto_387983 ?auto_387984 ?auto_387985 ?auto_387986 ?auto_387987 ?auto_387988 ?auto_387989 ?auto_387990 ?auto_387991 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388024 - BLOCK
      ?auto_388025 - BLOCK
      ?auto_388026 - BLOCK
      ?auto_388027 - BLOCK
      ?auto_388028 - BLOCK
      ?auto_388029 - BLOCK
      ?auto_388030 - BLOCK
      ?auto_388031 - BLOCK
      ?auto_388032 - BLOCK
      ?auto_388033 - BLOCK
    )
    :vars
    (
      ?auto_388034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388033 ?auto_388034 ) ( ON-TABLE ?auto_388024 ) ( ON ?auto_388025 ?auto_388024 ) ( ON ?auto_388026 ?auto_388025 ) ( ON ?auto_388027 ?auto_388026 ) ( ON ?auto_388028 ?auto_388027 ) ( ON ?auto_388029 ?auto_388028 ) ( ON ?auto_388030 ?auto_388029 ) ( not ( = ?auto_388024 ?auto_388025 ) ) ( not ( = ?auto_388024 ?auto_388026 ) ) ( not ( = ?auto_388024 ?auto_388027 ) ) ( not ( = ?auto_388024 ?auto_388028 ) ) ( not ( = ?auto_388024 ?auto_388029 ) ) ( not ( = ?auto_388024 ?auto_388030 ) ) ( not ( = ?auto_388024 ?auto_388031 ) ) ( not ( = ?auto_388024 ?auto_388032 ) ) ( not ( = ?auto_388024 ?auto_388033 ) ) ( not ( = ?auto_388024 ?auto_388034 ) ) ( not ( = ?auto_388025 ?auto_388026 ) ) ( not ( = ?auto_388025 ?auto_388027 ) ) ( not ( = ?auto_388025 ?auto_388028 ) ) ( not ( = ?auto_388025 ?auto_388029 ) ) ( not ( = ?auto_388025 ?auto_388030 ) ) ( not ( = ?auto_388025 ?auto_388031 ) ) ( not ( = ?auto_388025 ?auto_388032 ) ) ( not ( = ?auto_388025 ?auto_388033 ) ) ( not ( = ?auto_388025 ?auto_388034 ) ) ( not ( = ?auto_388026 ?auto_388027 ) ) ( not ( = ?auto_388026 ?auto_388028 ) ) ( not ( = ?auto_388026 ?auto_388029 ) ) ( not ( = ?auto_388026 ?auto_388030 ) ) ( not ( = ?auto_388026 ?auto_388031 ) ) ( not ( = ?auto_388026 ?auto_388032 ) ) ( not ( = ?auto_388026 ?auto_388033 ) ) ( not ( = ?auto_388026 ?auto_388034 ) ) ( not ( = ?auto_388027 ?auto_388028 ) ) ( not ( = ?auto_388027 ?auto_388029 ) ) ( not ( = ?auto_388027 ?auto_388030 ) ) ( not ( = ?auto_388027 ?auto_388031 ) ) ( not ( = ?auto_388027 ?auto_388032 ) ) ( not ( = ?auto_388027 ?auto_388033 ) ) ( not ( = ?auto_388027 ?auto_388034 ) ) ( not ( = ?auto_388028 ?auto_388029 ) ) ( not ( = ?auto_388028 ?auto_388030 ) ) ( not ( = ?auto_388028 ?auto_388031 ) ) ( not ( = ?auto_388028 ?auto_388032 ) ) ( not ( = ?auto_388028 ?auto_388033 ) ) ( not ( = ?auto_388028 ?auto_388034 ) ) ( not ( = ?auto_388029 ?auto_388030 ) ) ( not ( = ?auto_388029 ?auto_388031 ) ) ( not ( = ?auto_388029 ?auto_388032 ) ) ( not ( = ?auto_388029 ?auto_388033 ) ) ( not ( = ?auto_388029 ?auto_388034 ) ) ( not ( = ?auto_388030 ?auto_388031 ) ) ( not ( = ?auto_388030 ?auto_388032 ) ) ( not ( = ?auto_388030 ?auto_388033 ) ) ( not ( = ?auto_388030 ?auto_388034 ) ) ( not ( = ?auto_388031 ?auto_388032 ) ) ( not ( = ?auto_388031 ?auto_388033 ) ) ( not ( = ?auto_388031 ?auto_388034 ) ) ( not ( = ?auto_388032 ?auto_388033 ) ) ( not ( = ?auto_388032 ?auto_388034 ) ) ( not ( = ?auto_388033 ?auto_388034 ) ) ( ON ?auto_388032 ?auto_388033 ) ( CLEAR ?auto_388030 ) ( ON ?auto_388031 ?auto_388032 ) ( CLEAR ?auto_388031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_388024 ?auto_388025 ?auto_388026 ?auto_388027 ?auto_388028 ?auto_388029 ?auto_388030 ?auto_388031 )
      ( MAKE-10PILE ?auto_388024 ?auto_388025 ?auto_388026 ?auto_388027 ?auto_388028 ?auto_388029 ?auto_388030 ?auto_388031 ?auto_388032 ?auto_388033 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388066 - BLOCK
      ?auto_388067 - BLOCK
      ?auto_388068 - BLOCK
      ?auto_388069 - BLOCK
      ?auto_388070 - BLOCK
      ?auto_388071 - BLOCK
      ?auto_388072 - BLOCK
      ?auto_388073 - BLOCK
      ?auto_388074 - BLOCK
      ?auto_388075 - BLOCK
    )
    :vars
    (
      ?auto_388076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388075 ?auto_388076 ) ( ON-TABLE ?auto_388066 ) ( ON ?auto_388067 ?auto_388066 ) ( ON ?auto_388068 ?auto_388067 ) ( ON ?auto_388069 ?auto_388068 ) ( ON ?auto_388070 ?auto_388069 ) ( ON ?auto_388071 ?auto_388070 ) ( not ( = ?auto_388066 ?auto_388067 ) ) ( not ( = ?auto_388066 ?auto_388068 ) ) ( not ( = ?auto_388066 ?auto_388069 ) ) ( not ( = ?auto_388066 ?auto_388070 ) ) ( not ( = ?auto_388066 ?auto_388071 ) ) ( not ( = ?auto_388066 ?auto_388072 ) ) ( not ( = ?auto_388066 ?auto_388073 ) ) ( not ( = ?auto_388066 ?auto_388074 ) ) ( not ( = ?auto_388066 ?auto_388075 ) ) ( not ( = ?auto_388066 ?auto_388076 ) ) ( not ( = ?auto_388067 ?auto_388068 ) ) ( not ( = ?auto_388067 ?auto_388069 ) ) ( not ( = ?auto_388067 ?auto_388070 ) ) ( not ( = ?auto_388067 ?auto_388071 ) ) ( not ( = ?auto_388067 ?auto_388072 ) ) ( not ( = ?auto_388067 ?auto_388073 ) ) ( not ( = ?auto_388067 ?auto_388074 ) ) ( not ( = ?auto_388067 ?auto_388075 ) ) ( not ( = ?auto_388067 ?auto_388076 ) ) ( not ( = ?auto_388068 ?auto_388069 ) ) ( not ( = ?auto_388068 ?auto_388070 ) ) ( not ( = ?auto_388068 ?auto_388071 ) ) ( not ( = ?auto_388068 ?auto_388072 ) ) ( not ( = ?auto_388068 ?auto_388073 ) ) ( not ( = ?auto_388068 ?auto_388074 ) ) ( not ( = ?auto_388068 ?auto_388075 ) ) ( not ( = ?auto_388068 ?auto_388076 ) ) ( not ( = ?auto_388069 ?auto_388070 ) ) ( not ( = ?auto_388069 ?auto_388071 ) ) ( not ( = ?auto_388069 ?auto_388072 ) ) ( not ( = ?auto_388069 ?auto_388073 ) ) ( not ( = ?auto_388069 ?auto_388074 ) ) ( not ( = ?auto_388069 ?auto_388075 ) ) ( not ( = ?auto_388069 ?auto_388076 ) ) ( not ( = ?auto_388070 ?auto_388071 ) ) ( not ( = ?auto_388070 ?auto_388072 ) ) ( not ( = ?auto_388070 ?auto_388073 ) ) ( not ( = ?auto_388070 ?auto_388074 ) ) ( not ( = ?auto_388070 ?auto_388075 ) ) ( not ( = ?auto_388070 ?auto_388076 ) ) ( not ( = ?auto_388071 ?auto_388072 ) ) ( not ( = ?auto_388071 ?auto_388073 ) ) ( not ( = ?auto_388071 ?auto_388074 ) ) ( not ( = ?auto_388071 ?auto_388075 ) ) ( not ( = ?auto_388071 ?auto_388076 ) ) ( not ( = ?auto_388072 ?auto_388073 ) ) ( not ( = ?auto_388072 ?auto_388074 ) ) ( not ( = ?auto_388072 ?auto_388075 ) ) ( not ( = ?auto_388072 ?auto_388076 ) ) ( not ( = ?auto_388073 ?auto_388074 ) ) ( not ( = ?auto_388073 ?auto_388075 ) ) ( not ( = ?auto_388073 ?auto_388076 ) ) ( not ( = ?auto_388074 ?auto_388075 ) ) ( not ( = ?auto_388074 ?auto_388076 ) ) ( not ( = ?auto_388075 ?auto_388076 ) ) ( ON ?auto_388074 ?auto_388075 ) ( ON ?auto_388073 ?auto_388074 ) ( CLEAR ?auto_388071 ) ( ON ?auto_388072 ?auto_388073 ) ( CLEAR ?auto_388072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_388066 ?auto_388067 ?auto_388068 ?auto_388069 ?auto_388070 ?auto_388071 ?auto_388072 )
      ( MAKE-10PILE ?auto_388066 ?auto_388067 ?auto_388068 ?auto_388069 ?auto_388070 ?auto_388071 ?auto_388072 ?auto_388073 ?auto_388074 ?auto_388075 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388108 - BLOCK
      ?auto_388109 - BLOCK
      ?auto_388110 - BLOCK
      ?auto_388111 - BLOCK
      ?auto_388112 - BLOCK
      ?auto_388113 - BLOCK
      ?auto_388114 - BLOCK
      ?auto_388115 - BLOCK
      ?auto_388116 - BLOCK
      ?auto_388117 - BLOCK
    )
    :vars
    (
      ?auto_388118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388117 ?auto_388118 ) ( ON-TABLE ?auto_388108 ) ( ON ?auto_388109 ?auto_388108 ) ( ON ?auto_388110 ?auto_388109 ) ( ON ?auto_388111 ?auto_388110 ) ( ON ?auto_388112 ?auto_388111 ) ( not ( = ?auto_388108 ?auto_388109 ) ) ( not ( = ?auto_388108 ?auto_388110 ) ) ( not ( = ?auto_388108 ?auto_388111 ) ) ( not ( = ?auto_388108 ?auto_388112 ) ) ( not ( = ?auto_388108 ?auto_388113 ) ) ( not ( = ?auto_388108 ?auto_388114 ) ) ( not ( = ?auto_388108 ?auto_388115 ) ) ( not ( = ?auto_388108 ?auto_388116 ) ) ( not ( = ?auto_388108 ?auto_388117 ) ) ( not ( = ?auto_388108 ?auto_388118 ) ) ( not ( = ?auto_388109 ?auto_388110 ) ) ( not ( = ?auto_388109 ?auto_388111 ) ) ( not ( = ?auto_388109 ?auto_388112 ) ) ( not ( = ?auto_388109 ?auto_388113 ) ) ( not ( = ?auto_388109 ?auto_388114 ) ) ( not ( = ?auto_388109 ?auto_388115 ) ) ( not ( = ?auto_388109 ?auto_388116 ) ) ( not ( = ?auto_388109 ?auto_388117 ) ) ( not ( = ?auto_388109 ?auto_388118 ) ) ( not ( = ?auto_388110 ?auto_388111 ) ) ( not ( = ?auto_388110 ?auto_388112 ) ) ( not ( = ?auto_388110 ?auto_388113 ) ) ( not ( = ?auto_388110 ?auto_388114 ) ) ( not ( = ?auto_388110 ?auto_388115 ) ) ( not ( = ?auto_388110 ?auto_388116 ) ) ( not ( = ?auto_388110 ?auto_388117 ) ) ( not ( = ?auto_388110 ?auto_388118 ) ) ( not ( = ?auto_388111 ?auto_388112 ) ) ( not ( = ?auto_388111 ?auto_388113 ) ) ( not ( = ?auto_388111 ?auto_388114 ) ) ( not ( = ?auto_388111 ?auto_388115 ) ) ( not ( = ?auto_388111 ?auto_388116 ) ) ( not ( = ?auto_388111 ?auto_388117 ) ) ( not ( = ?auto_388111 ?auto_388118 ) ) ( not ( = ?auto_388112 ?auto_388113 ) ) ( not ( = ?auto_388112 ?auto_388114 ) ) ( not ( = ?auto_388112 ?auto_388115 ) ) ( not ( = ?auto_388112 ?auto_388116 ) ) ( not ( = ?auto_388112 ?auto_388117 ) ) ( not ( = ?auto_388112 ?auto_388118 ) ) ( not ( = ?auto_388113 ?auto_388114 ) ) ( not ( = ?auto_388113 ?auto_388115 ) ) ( not ( = ?auto_388113 ?auto_388116 ) ) ( not ( = ?auto_388113 ?auto_388117 ) ) ( not ( = ?auto_388113 ?auto_388118 ) ) ( not ( = ?auto_388114 ?auto_388115 ) ) ( not ( = ?auto_388114 ?auto_388116 ) ) ( not ( = ?auto_388114 ?auto_388117 ) ) ( not ( = ?auto_388114 ?auto_388118 ) ) ( not ( = ?auto_388115 ?auto_388116 ) ) ( not ( = ?auto_388115 ?auto_388117 ) ) ( not ( = ?auto_388115 ?auto_388118 ) ) ( not ( = ?auto_388116 ?auto_388117 ) ) ( not ( = ?auto_388116 ?auto_388118 ) ) ( not ( = ?auto_388117 ?auto_388118 ) ) ( ON ?auto_388116 ?auto_388117 ) ( ON ?auto_388115 ?auto_388116 ) ( ON ?auto_388114 ?auto_388115 ) ( CLEAR ?auto_388112 ) ( ON ?auto_388113 ?auto_388114 ) ( CLEAR ?auto_388113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_388108 ?auto_388109 ?auto_388110 ?auto_388111 ?auto_388112 ?auto_388113 )
      ( MAKE-10PILE ?auto_388108 ?auto_388109 ?auto_388110 ?auto_388111 ?auto_388112 ?auto_388113 ?auto_388114 ?auto_388115 ?auto_388116 ?auto_388117 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388150 - BLOCK
      ?auto_388151 - BLOCK
      ?auto_388152 - BLOCK
      ?auto_388153 - BLOCK
      ?auto_388154 - BLOCK
      ?auto_388155 - BLOCK
      ?auto_388156 - BLOCK
      ?auto_388157 - BLOCK
      ?auto_388158 - BLOCK
      ?auto_388159 - BLOCK
    )
    :vars
    (
      ?auto_388160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388159 ?auto_388160 ) ( ON-TABLE ?auto_388150 ) ( ON ?auto_388151 ?auto_388150 ) ( ON ?auto_388152 ?auto_388151 ) ( ON ?auto_388153 ?auto_388152 ) ( not ( = ?auto_388150 ?auto_388151 ) ) ( not ( = ?auto_388150 ?auto_388152 ) ) ( not ( = ?auto_388150 ?auto_388153 ) ) ( not ( = ?auto_388150 ?auto_388154 ) ) ( not ( = ?auto_388150 ?auto_388155 ) ) ( not ( = ?auto_388150 ?auto_388156 ) ) ( not ( = ?auto_388150 ?auto_388157 ) ) ( not ( = ?auto_388150 ?auto_388158 ) ) ( not ( = ?auto_388150 ?auto_388159 ) ) ( not ( = ?auto_388150 ?auto_388160 ) ) ( not ( = ?auto_388151 ?auto_388152 ) ) ( not ( = ?auto_388151 ?auto_388153 ) ) ( not ( = ?auto_388151 ?auto_388154 ) ) ( not ( = ?auto_388151 ?auto_388155 ) ) ( not ( = ?auto_388151 ?auto_388156 ) ) ( not ( = ?auto_388151 ?auto_388157 ) ) ( not ( = ?auto_388151 ?auto_388158 ) ) ( not ( = ?auto_388151 ?auto_388159 ) ) ( not ( = ?auto_388151 ?auto_388160 ) ) ( not ( = ?auto_388152 ?auto_388153 ) ) ( not ( = ?auto_388152 ?auto_388154 ) ) ( not ( = ?auto_388152 ?auto_388155 ) ) ( not ( = ?auto_388152 ?auto_388156 ) ) ( not ( = ?auto_388152 ?auto_388157 ) ) ( not ( = ?auto_388152 ?auto_388158 ) ) ( not ( = ?auto_388152 ?auto_388159 ) ) ( not ( = ?auto_388152 ?auto_388160 ) ) ( not ( = ?auto_388153 ?auto_388154 ) ) ( not ( = ?auto_388153 ?auto_388155 ) ) ( not ( = ?auto_388153 ?auto_388156 ) ) ( not ( = ?auto_388153 ?auto_388157 ) ) ( not ( = ?auto_388153 ?auto_388158 ) ) ( not ( = ?auto_388153 ?auto_388159 ) ) ( not ( = ?auto_388153 ?auto_388160 ) ) ( not ( = ?auto_388154 ?auto_388155 ) ) ( not ( = ?auto_388154 ?auto_388156 ) ) ( not ( = ?auto_388154 ?auto_388157 ) ) ( not ( = ?auto_388154 ?auto_388158 ) ) ( not ( = ?auto_388154 ?auto_388159 ) ) ( not ( = ?auto_388154 ?auto_388160 ) ) ( not ( = ?auto_388155 ?auto_388156 ) ) ( not ( = ?auto_388155 ?auto_388157 ) ) ( not ( = ?auto_388155 ?auto_388158 ) ) ( not ( = ?auto_388155 ?auto_388159 ) ) ( not ( = ?auto_388155 ?auto_388160 ) ) ( not ( = ?auto_388156 ?auto_388157 ) ) ( not ( = ?auto_388156 ?auto_388158 ) ) ( not ( = ?auto_388156 ?auto_388159 ) ) ( not ( = ?auto_388156 ?auto_388160 ) ) ( not ( = ?auto_388157 ?auto_388158 ) ) ( not ( = ?auto_388157 ?auto_388159 ) ) ( not ( = ?auto_388157 ?auto_388160 ) ) ( not ( = ?auto_388158 ?auto_388159 ) ) ( not ( = ?auto_388158 ?auto_388160 ) ) ( not ( = ?auto_388159 ?auto_388160 ) ) ( ON ?auto_388158 ?auto_388159 ) ( ON ?auto_388157 ?auto_388158 ) ( ON ?auto_388156 ?auto_388157 ) ( ON ?auto_388155 ?auto_388156 ) ( CLEAR ?auto_388153 ) ( ON ?auto_388154 ?auto_388155 ) ( CLEAR ?auto_388154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_388150 ?auto_388151 ?auto_388152 ?auto_388153 ?auto_388154 )
      ( MAKE-10PILE ?auto_388150 ?auto_388151 ?auto_388152 ?auto_388153 ?auto_388154 ?auto_388155 ?auto_388156 ?auto_388157 ?auto_388158 ?auto_388159 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388192 - BLOCK
      ?auto_388193 - BLOCK
      ?auto_388194 - BLOCK
      ?auto_388195 - BLOCK
      ?auto_388196 - BLOCK
      ?auto_388197 - BLOCK
      ?auto_388198 - BLOCK
      ?auto_388199 - BLOCK
      ?auto_388200 - BLOCK
      ?auto_388201 - BLOCK
    )
    :vars
    (
      ?auto_388202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388201 ?auto_388202 ) ( ON-TABLE ?auto_388192 ) ( ON ?auto_388193 ?auto_388192 ) ( ON ?auto_388194 ?auto_388193 ) ( not ( = ?auto_388192 ?auto_388193 ) ) ( not ( = ?auto_388192 ?auto_388194 ) ) ( not ( = ?auto_388192 ?auto_388195 ) ) ( not ( = ?auto_388192 ?auto_388196 ) ) ( not ( = ?auto_388192 ?auto_388197 ) ) ( not ( = ?auto_388192 ?auto_388198 ) ) ( not ( = ?auto_388192 ?auto_388199 ) ) ( not ( = ?auto_388192 ?auto_388200 ) ) ( not ( = ?auto_388192 ?auto_388201 ) ) ( not ( = ?auto_388192 ?auto_388202 ) ) ( not ( = ?auto_388193 ?auto_388194 ) ) ( not ( = ?auto_388193 ?auto_388195 ) ) ( not ( = ?auto_388193 ?auto_388196 ) ) ( not ( = ?auto_388193 ?auto_388197 ) ) ( not ( = ?auto_388193 ?auto_388198 ) ) ( not ( = ?auto_388193 ?auto_388199 ) ) ( not ( = ?auto_388193 ?auto_388200 ) ) ( not ( = ?auto_388193 ?auto_388201 ) ) ( not ( = ?auto_388193 ?auto_388202 ) ) ( not ( = ?auto_388194 ?auto_388195 ) ) ( not ( = ?auto_388194 ?auto_388196 ) ) ( not ( = ?auto_388194 ?auto_388197 ) ) ( not ( = ?auto_388194 ?auto_388198 ) ) ( not ( = ?auto_388194 ?auto_388199 ) ) ( not ( = ?auto_388194 ?auto_388200 ) ) ( not ( = ?auto_388194 ?auto_388201 ) ) ( not ( = ?auto_388194 ?auto_388202 ) ) ( not ( = ?auto_388195 ?auto_388196 ) ) ( not ( = ?auto_388195 ?auto_388197 ) ) ( not ( = ?auto_388195 ?auto_388198 ) ) ( not ( = ?auto_388195 ?auto_388199 ) ) ( not ( = ?auto_388195 ?auto_388200 ) ) ( not ( = ?auto_388195 ?auto_388201 ) ) ( not ( = ?auto_388195 ?auto_388202 ) ) ( not ( = ?auto_388196 ?auto_388197 ) ) ( not ( = ?auto_388196 ?auto_388198 ) ) ( not ( = ?auto_388196 ?auto_388199 ) ) ( not ( = ?auto_388196 ?auto_388200 ) ) ( not ( = ?auto_388196 ?auto_388201 ) ) ( not ( = ?auto_388196 ?auto_388202 ) ) ( not ( = ?auto_388197 ?auto_388198 ) ) ( not ( = ?auto_388197 ?auto_388199 ) ) ( not ( = ?auto_388197 ?auto_388200 ) ) ( not ( = ?auto_388197 ?auto_388201 ) ) ( not ( = ?auto_388197 ?auto_388202 ) ) ( not ( = ?auto_388198 ?auto_388199 ) ) ( not ( = ?auto_388198 ?auto_388200 ) ) ( not ( = ?auto_388198 ?auto_388201 ) ) ( not ( = ?auto_388198 ?auto_388202 ) ) ( not ( = ?auto_388199 ?auto_388200 ) ) ( not ( = ?auto_388199 ?auto_388201 ) ) ( not ( = ?auto_388199 ?auto_388202 ) ) ( not ( = ?auto_388200 ?auto_388201 ) ) ( not ( = ?auto_388200 ?auto_388202 ) ) ( not ( = ?auto_388201 ?auto_388202 ) ) ( ON ?auto_388200 ?auto_388201 ) ( ON ?auto_388199 ?auto_388200 ) ( ON ?auto_388198 ?auto_388199 ) ( ON ?auto_388197 ?auto_388198 ) ( ON ?auto_388196 ?auto_388197 ) ( CLEAR ?auto_388194 ) ( ON ?auto_388195 ?auto_388196 ) ( CLEAR ?auto_388195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_388192 ?auto_388193 ?auto_388194 ?auto_388195 )
      ( MAKE-10PILE ?auto_388192 ?auto_388193 ?auto_388194 ?auto_388195 ?auto_388196 ?auto_388197 ?auto_388198 ?auto_388199 ?auto_388200 ?auto_388201 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388234 - BLOCK
      ?auto_388235 - BLOCK
      ?auto_388236 - BLOCK
      ?auto_388237 - BLOCK
      ?auto_388238 - BLOCK
      ?auto_388239 - BLOCK
      ?auto_388240 - BLOCK
      ?auto_388241 - BLOCK
      ?auto_388242 - BLOCK
      ?auto_388243 - BLOCK
    )
    :vars
    (
      ?auto_388244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388243 ?auto_388244 ) ( ON-TABLE ?auto_388234 ) ( ON ?auto_388235 ?auto_388234 ) ( not ( = ?auto_388234 ?auto_388235 ) ) ( not ( = ?auto_388234 ?auto_388236 ) ) ( not ( = ?auto_388234 ?auto_388237 ) ) ( not ( = ?auto_388234 ?auto_388238 ) ) ( not ( = ?auto_388234 ?auto_388239 ) ) ( not ( = ?auto_388234 ?auto_388240 ) ) ( not ( = ?auto_388234 ?auto_388241 ) ) ( not ( = ?auto_388234 ?auto_388242 ) ) ( not ( = ?auto_388234 ?auto_388243 ) ) ( not ( = ?auto_388234 ?auto_388244 ) ) ( not ( = ?auto_388235 ?auto_388236 ) ) ( not ( = ?auto_388235 ?auto_388237 ) ) ( not ( = ?auto_388235 ?auto_388238 ) ) ( not ( = ?auto_388235 ?auto_388239 ) ) ( not ( = ?auto_388235 ?auto_388240 ) ) ( not ( = ?auto_388235 ?auto_388241 ) ) ( not ( = ?auto_388235 ?auto_388242 ) ) ( not ( = ?auto_388235 ?auto_388243 ) ) ( not ( = ?auto_388235 ?auto_388244 ) ) ( not ( = ?auto_388236 ?auto_388237 ) ) ( not ( = ?auto_388236 ?auto_388238 ) ) ( not ( = ?auto_388236 ?auto_388239 ) ) ( not ( = ?auto_388236 ?auto_388240 ) ) ( not ( = ?auto_388236 ?auto_388241 ) ) ( not ( = ?auto_388236 ?auto_388242 ) ) ( not ( = ?auto_388236 ?auto_388243 ) ) ( not ( = ?auto_388236 ?auto_388244 ) ) ( not ( = ?auto_388237 ?auto_388238 ) ) ( not ( = ?auto_388237 ?auto_388239 ) ) ( not ( = ?auto_388237 ?auto_388240 ) ) ( not ( = ?auto_388237 ?auto_388241 ) ) ( not ( = ?auto_388237 ?auto_388242 ) ) ( not ( = ?auto_388237 ?auto_388243 ) ) ( not ( = ?auto_388237 ?auto_388244 ) ) ( not ( = ?auto_388238 ?auto_388239 ) ) ( not ( = ?auto_388238 ?auto_388240 ) ) ( not ( = ?auto_388238 ?auto_388241 ) ) ( not ( = ?auto_388238 ?auto_388242 ) ) ( not ( = ?auto_388238 ?auto_388243 ) ) ( not ( = ?auto_388238 ?auto_388244 ) ) ( not ( = ?auto_388239 ?auto_388240 ) ) ( not ( = ?auto_388239 ?auto_388241 ) ) ( not ( = ?auto_388239 ?auto_388242 ) ) ( not ( = ?auto_388239 ?auto_388243 ) ) ( not ( = ?auto_388239 ?auto_388244 ) ) ( not ( = ?auto_388240 ?auto_388241 ) ) ( not ( = ?auto_388240 ?auto_388242 ) ) ( not ( = ?auto_388240 ?auto_388243 ) ) ( not ( = ?auto_388240 ?auto_388244 ) ) ( not ( = ?auto_388241 ?auto_388242 ) ) ( not ( = ?auto_388241 ?auto_388243 ) ) ( not ( = ?auto_388241 ?auto_388244 ) ) ( not ( = ?auto_388242 ?auto_388243 ) ) ( not ( = ?auto_388242 ?auto_388244 ) ) ( not ( = ?auto_388243 ?auto_388244 ) ) ( ON ?auto_388242 ?auto_388243 ) ( ON ?auto_388241 ?auto_388242 ) ( ON ?auto_388240 ?auto_388241 ) ( ON ?auto_388239 ?auto_388240 ) ( ON ?auto_388238 ?auto_388239 ) ( ON ?auto_388237 ?auto_388238 ) ( CLEAR ?auto_388235 ) ( ON ?auto_388236 ?auto_388237 ) ( CLEAR ?auto_388236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_388234 ?auto_388235 ?auto_388236 )
      ( MAKE-10PILE ?auto_388234 ?auto_388235 ?auto_388236 ?auto_388237 ?auto_388238 ?auto_388239 ?auto_388240 ?auto_388241 ?auto_388242 ?auto_388243 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388276 - BLOCK
      ?auto_388277 - BLOCK
      ?auto_388278 - BLOCK
      ?auto_388279 - BLOCK
      ?auto_388280 - BLOCK
      ?auto_388281 - BLOCK
      ?auto_388282 - BLOCK
      ?auto_388283 - BLOCK
      ?auto_388284 - BLOCK
      ?auto_388285 - BLOCK
    )
    :vars
    (
      ?auto_388286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388285 ?auto_388286 ) ( ON-TABLE ?auto_388276 ) ( not ( = ?auto_388276 ?auto_388277 ) ) ( not ( = ?auto_388276 ?auto_388278 ) ) ( not ( = ?auto_388276 ?auto_388279 ) ) ( not ( = ?auto_388276 ?auto_388280 ) ) ( not ( = ?auto_388276 ?auto_388281 ) ) ( not ( = ?auto_388276 ?auto_388282 ) ) ( not ( = ?auto_388276 ?auto_388283 ) ) ( not ( = ?auto_388276 ?auto_388284 ) ) ( not ( = ?auto_388276 ?auto_388285 ) ) ( not ( = ?auto_388276 ?auto_388286 ) ) ( not ( = ?auto_388277 ?auto_388278 ) ) ( not ( = ?auto_388277 ?auto_388279 ) ) ( not ( = ?auto_388277 ?auto_388280 ) ) ( not ( = ?auto_388277 ?auto_388281 ) ) ( not ( = ?auto_388277 ?auto_388282 ) ) ( not ( = ?auto_388277 ?auto_388283 ) ) ( not ( = ?auto_388277 ?auto_388284 ) ) ( not ( = ?auto_388277 ?auto_388285 ) ) ( not ( = ?auto_388277 ?auto_388286 ) ) ( not ( = ?auto_388278 ?auto_388279 ) ) ( not ( = ?auto_388278 ?auto_388280 ) ) ( not ( = ?auto_388278 ?auto_388281 ) ) ( not ( = ?auto_388278 ?auto_388282 ) ) ( not ( = ?auto_388278 ?auto_388283 ) ) ( not ( = ?auto_388278 ?auto_388284 ) ) ( not ( = ?auto_388278 ?auto_388285 ) ) ( not ( = ?auto_388278 ?auto_388286 ) ) ( not ( = ?auto_388279 ?auto_388280 ) ) ( not ( = ?auto_388279 ?auto_388281 ) ) ( not ( = ?auto_388279 ?auto_388282 ) ) ( not ( = ?auto_388279 ?auto_388283 ) ) ( not ( = ?auto_388279 ?auto_388284 ) ) ( not ( = ?auto_388279 ?auto_388285 ) ) ( not ( = ?auto_388279 ?auto_388286 ) ) ( not ( = ?auto_388280 ?auto_388281 ) ) ( not ( = ?auto_388280 ?auto_388282 ) ) ( not ( = ?auto_388280 ?auto_388283 ) ) ( not ( = ?auto_388280 ?auto_388284 ) ) ( not ( = ?auto_388280 ?auto_388285 ) ) ( not ( = ?auto_388280 ?auto_388286 ) ) ( not ( = ?auto_388281 ?auto_388282 ) ) ( not ( = ?auto_388281 ?auto_388283 ) ) ( not ( = ?auto_388281 ?auto_388284 ) ) ( not ( = ?auto_388281 ?auto_388285 ) ) ( not ( = ?auto_388281 ?auto_388286 ) ) ( not ( = ?auto_388282 ?auto_388283 ) ) ( not ( = ?auto_388282 ?auto_388284 ) ) ( not ( = ?auto_388282 ?auto_388285 ) ) ( not ( = ?auto_388282 ?auto_388286 ) ) ( not ( = ?auto_388283 ?auto_388284 ) ) ( not ( = ?auto_388283 ?auto_388285 ) ) ( not ( = ?auto_388283 ?auto_388286 ) ) ( not ( = ?auto_388284 ?auto_388285 ) ) ( not ( = ?auto_388284 ?auto_388286 ) ) ( not ( = ?auto_388285 ?auto_388286 ) ) ( ON ?auto_388284 ?auto_388285 ) ( ON ?auto_388283 ?auto_388284 ) ( ON ?auto_388282 ?auto_388283 ) ( ON ?auto_388281 ?auto_388282 ) ( ON ?auto_388280 ?auto_388281 ) ( ON ?auto_388279 ?auto_388280 ) ( ON ?auto_388278 ?auto_388279 ) ( CLEAR ?auto_388276 ) ( ON ?auto_388277 ?auto_388278 ) ( CLEAR ?auto_388277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_388276 ?auto_388277 )
      ( MAKE-10PILE ?auto_388276 ?auto_388277 ?auto_388278 ?auto_388279 ?auto_388280 ?auto_388281 ?auto_388282 ?auto_388283 ?auto_388284 ?auto_388285 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388318 - BLOCK
      ?auto_388319 - BLOCK
      ?auto_388320 - BLOCK
      ?auto_388321 - BLOCK
      ?auto_388322 - BLOCK
      ?auto_388323 - BLOCK
      ?auto_388324 - BLOCK
      ?auto_388325 - BLOCK
      ?auto_388326 - BLOCK
      ?auto_388327 - BLOCK
    )
    :vars
    (
      ?auto_388328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388327 ?auto_388328 ) ( not ( = ?auto_388318 ?auto_388319 ) ) ( not ( = ?auto_388318 ?auto_388320 ) ) ( not ( = ?auto_388318 ?auto_388321 ) ) ( not ( = ?auto_388318 ?auto_388322 ) ) ( not ( = ?auto_388318 ?auto_388323 ) ) ( not ( = ?auto_388318 ?auto_388324 ) ) ( not ( = ?auto_388318 ?auto_388325 ) ) ( not ( = ?auto_388318 ?auto_388326 ) ) ( not ( = ?auto_388318 ?auto_388327 ) ) ( not ( = ?auto_388318 ?auto_388328 ) ) ( not ( = ?auto_388319 ?auto_388320 ) ) ( not ( = ?auto_388319 ?auto_388321 ) ) ( not ( = ?auto_388319 ?auto_388322 ) ) ( not ( = ?auto_388319 ?auto_388323 ) ) ( not ( = ?auto_388319 ?auto_388324 ) ) ( not ( = ?auto_388319 ?auto_388325 ) ) ( not ( = ?auto_388319 ?auto_388326 ) ) ( not ( = ?auto_388319 ?auto_388327 ) ) ( not ( = ?auto_388319 ?auto_388328 ) ) ( not ( = ?auto_388320 ?auto_388321 ) ) ( not ( = ?auto_388320 ?auto_388322 ) ) ( not ( = ?auto_388320 ?auto_388323 ) ) ( not ( = ?auto_388320 ?auto_388324 ) ) ( not ( = ?auto_388320 ?auto_388325 ) ) ( not ( = ?auto_388320 ?auto_388326 ) ) ( not ( = ?auto_388320 ?auto_388327 ) ) ( not ( = ?auto_388320 ?auto_388328 ) ) ( not ( = ?auto_388321 ?auto_388322 ) ) ( not ( = ?auto_388321 ?auto_388323 ) ) ( not ( = ?auto_388321 ?auto_388324 ) ) ( not ( = ?auto_388321 ?auto_388325 ) ) ( not ( = ?auto_388321 ?auto_388326 ) ) ( not ( = ?auto_388321 ?auto_388327 ) ) ( not ( = ?auto_388321 ?auto_388328 ) ) ( not ( = ?auto_388322 ?auto_388323 ) ) ( not ( = ?auto_388322 ?auto_388324 ) ) ( not ( = ?auto_388322 ?auto_388325 ) ) ( not ( = ?auto_388322 ?auto_388326 ) ) ( not ( = ?auto_388322 ?auto_388327 ) ) ( not ( = ?auto_388322 ?auto_388328 ) ) ( not ( = ?auto_388323 ?auto_388324 ) ) ( not ( = ?auto_388323 ?auto_388325 ) ) ( not ( = ?auto_388323 ?auto_388326 ) ) ( not ( = ?auto_388323 ?auto_388327 ) ) ( not ( = ?auto_388323 ?auto_388328 ) ) ( not ( = ?auto_388324 ?auto_388325 ) ) ( not ( = ?auto_388324 ?auto_388326 ) ) ( not ( = ?auto_388324 ?auto_388327 ) ) ( not ( = ?auto_388324 ?auto_388328 ) ) ( not ( = ?auto_388325 ?auto_388326 ) ) ( not ( = ?auto_388325 ?auto_388327 ) ) ( not ( = ?auto_388325 ?auto_388328 ) ) ( not ( = ?auto_388326 ?auto_388327 ) ) ( not ( = ?auto_388326 ?auto_388328 ) ) ( not ( = ?auto_388327 ?auto_388328 ) ) ( ON ?auto_388326 ?auto_388327 ) ( ON ?auto_388325 ?auto_388326 ) ( ON ?auto_388324 ?auto_388325 ) ( ON ?auto_388323 ?auto_388324 ) ( ON ?auto_388322 ?auto_388323 ) ( ON ?auto_388321 ?auto_388322 ) ( ON ?auto_388320 ?auto_388321 ) ( ON ?auto_388319 ?auto_388320 ) ( ON ?auto_388318 ?auto_388319 ) ( CLEAR ?auto_388318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_388318 )
      ( MAKE-10PILE ?auto_388318 ?auto_388319 ?auto_388320 ?auto_388321 ?auto_388322 ?auto_388323 ?auto_388324 ?auto_388325 ?auto_388326 ?auto_388327 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388361 - BLOCK
      ?auto_388362 - BLOCK
      ?auto_388363 - BLOCK
      ?auto_388364 - BLOCK
      ?auto_388365 - BLOCK
      ?auto_388366 - BLOCK
      ?auto_388367 - BLOCK
      ?auto_388368 - BLOCK
      ?auto_388369 - BLOCK
      ?auto_388370 - BLOCK
      ?auto_388371 - BLOCK
    )
    :vars
    (
      ?auto_388372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_388370 ) ( ON ?auto_388371 ?auto_388372 ) ( CLEAR ?auto_388371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_388361 ) ( ON ?auto_388362 ?auto_388361 ) ( ON ?auto_388363 ?auto_388362 ) ( ON ?auto_388364 ?auto_388363 ) ( ON ?auto_388365 ?auto_388364 ) ( ON ?auto_388366 ?auto_388365 ) ( ON ?auto_388367 ?auto_388366 ) ( ON ?auto_388368 ?auto_388367 ) ( ON ?auto_388369 ?auto_388368 ) ( ON ?auto_388370 ?auto_388369 ) ( not ( = ?auto_388361 ?auto_388362 ) ) ( not ( = ?auto_388361 ?auto_388363 ) ) ( not ( = ?auto_388361 ?auto_388364 ) ) ( not ( = ?auto_388361 ?auto_388365 ) ) ( not ( = ?auto_388361 ?auto_388366 ) ) ( not ( = ?auto_388361 ?auto_388367 ) ) ( not ( = ?auto_388361 ?auto_388368 ) ) ( not ( = ?auto_388361 ?auto_388369 ) ) ( not ( = ?auto_388361 ?auto_388370 ) ) ( not ( = ?auto_388361 ?auto_388371 ) ) ( not ( = ?auto_388361 ?auto_388372 ) ) ( not ( = ?auto_388362 ?auto_388363 ) ) ( not ( = ?auto_388362 ?auto_388364 ) ) ( not ( = ?auto_388362 ?auto_388365 ) ) ( not ( = ?auto_388362 ?auto_388366 ) ) ( not ( = ?auto_388362 ?auto_388367 ) ) ( not ( = ?auto_388362 ?auto_388368 ) ) ( not ( = ?auto_388362 ?auto_388369 ) ) ( not ( = ?auto_388362 ?auto_388370 ) ) ( not ( = ?auto_388362 ?auto_388371 ) ) ( not ( = ?auto_388362 ?auto_388372 ) ) ( not ( = ?auto_388363 ?auto_388364 ) ) ( not ( = ?auto_388363 ?auto_388365 ) ) ( not ( = ?auto_388363 ?auto_388366 ) ) ( not ( = ?auto_388363 ?auto_388367 ) ) ( not ( = ?auto_388363 ?auto_388368 ) ) ( not ( = ?auto_388363 ?auto_388369 ) ) ( not ( = ?auto_388363 ?auto_388370 ) ) ( not ( = ?auto_388363 ?auto_388371 ) ) ( not ( = ?auto_388363 ?auto_388372 ) ) ( not ( = ?auto_388364 ?auto_388365 ) ) ( not ( = ?auto_388364 ?auto_388366 ) ) ( not ( = ?auto_388364 ?auto_388367 ) ) ( not ( = ?auto_388364 ?auto_388368 ) ) ( not ( = ?auto_388364 ?auto_388369 ) ) ( not ( = ?auto_388364 ?auto_388370 ) ) ( not ( = ?auto_388364 ?auto_388371 ) ) ( not ( = ?auto_388364 ?auto_388372 ) ) ( not ( = ?auto_388365 ?auto_388366 ) ) ( not ( = ?auto_388365 ?auto_388367 ) ) ( not ( = ?auto_388365 ?auto_388368 ) ) ( not ( = ?auto_388365 ?auto_388369 ) ) ( not ( = ?auto_388365 ?auto_388370 ) ) ( not ( = ?auto_388365 ?auto_388371 ) ) ( not ( = ?auto_388365 ?auto_388372 ) ) ( not ( = ?auto_388366 ?auto_388367 ) ) ( not ( = ?auto_388366 ?auto_388368 ) ) ( not ( = ?auto_388366 ?auto_388369 ) ) ( not ( = ?auto_388366 ?auto_388370 ) ) ( not ( = ?auto_388366 ?auto_388371 ) ) ( not ( = ?auto_388366 ?auto_388372 ) ) ( not ( = ?auto_388367 ?auto_388368 ) ) ( not ( = ?auto_388367 ?auto_388369 ) ) ( not ( = ?auto_388367 ?auto_388370 ) ) ( not ( = ?auto_388367 ?auto_388371 ) ) ( not ( = ?auto_388367 ?auto_388372 ) ) ( not ( = ?auto_388368 ?auto_388369 ) ) ( not ( = ?auto_388368 ?auto_388370 ) ) ( not ( = ?auto_388368 ?auto_388371 ) ) ( not ( = ?auto_388368 ?auto_388372 ) ) ( not ( = ?auto_388369 ?auto_388370 ) ) ( not ( = ?auto_388369 ?auto_388371 ) ) ( not ( = ?auto_388369 ?auto_388372 ) ) ( not ( = ?auto_388370 ?auto_388371 ) ) ( not ( = ?auto_388370 ?auto_388372 ) ) ( not ( = ?auto_388371 ?auto_388372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_388371 ?auto_388372 )
      ( !STACK ?auto_388371 ?auto_388370 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388407 - BLOCK
      ?auto_388408 - BLOCK
      ?auto_388409 - BLOCK
      ?auto_388410 - BLOCK
      ?auto_388411 - BLOCK
      ?auto_388412 - BLOCK
      ?auto_388413 - BLOCK
      ?auto_388414 - BLOCK
      ?auto_388415 - BLOCK
      ?auto_388416 - BLOCK
      ?auto_388417 - BLOCK
    )
    :vars
    (
      ?auto_388418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388417 ?auto_388418 ) ( ON-TABLE ?auto_388407 ) ( ON ?auto_388408 ?auto_388407 ) ( ON ?auto_388409 ?auto_388408 ) ( ON ?auto_388410 ?auto_388409 ) ( ON ?auto_388411 ?auto_388410 ) ( ON ?auto_388412 ?auto_388411 ) ( ON ?auto_388413 ?auto_388412 ) ( ON ?auto_388414 ?auto_388413 ) ( ON ?auto_388415 ?auto_388414 ) ( not ( = ?auto_388407 ?auto_388408 ) ) ( not ( = ?auto_388407 ?auto_388409 ) ) ( not ( = ?auto_388407 ?auto_388410 ) ) ( not ( = ?auto_388407 ?auto_388411 ) ) ( not ( = ?auto_388407 ?auto_388412 ) ) ( not ( = ?auto_388407 ?auto_388413 ) ) ( not ( = ?auto_388407 ?auto_388414 ) ) ( not ( = ?auto_388407 ?auto_388415 ) ) ( not ( = ?auto_388407 ?auto_388416 ) ) ( not ( = ?auto_388407 ?auto_388417 ) ) ( not ( = ?auto_388407 ?auto_388418 ) ) ( not ( = ?auto_388408 ?auto_388409 ) ) ( not ( = ?auto_388408 ?auto_388410 ) ) ( not ( = ?auto_388408 ?auto_388411 ) ) ( not ( = ?auto_388408 ?auto_388412 ) ) ( not ( = ?auto_388408 ?auto_388413 ) ) ( not ( = ?auto_388408 ?auto_388414 ) ) ( not ( = ?auto_388408 ?auto_388415 ) ) ( not ( = ?auto_388408 ?auto_388416 ) ) ( not ( = ?auto_388408 ?auto_388417 ) ) ( not ( = ?auto_388408 ?auto_388418 ) ) ( not ( = ?auto_388409 ?auto_388410 ) ) ( not ( = ?auto_388409 ?auto_388411 ) ) ( not ( = ?auto_388409 ?auto_388412 ) ) ( not ( = ?auto_388409 ?auto_388413 ) ) ( not ( = ?auto_388409 ?auto_388414 ) ) ( not ( = ?auto_388409 ?auto_388415 ) ) ( not ( = ?auto_388409 ?auto_388416 ) ) ( not ( = ?auto_388409 ?auto_388417 ) ) ( not ( = ?auto_388409 ?auto_388418 ) ) ( not ( = ?auto_388410 ?auto_388411 ) ) ( not ( = ?auto_388410 ?auto_388412 ) ) ( not ( = ?auto_388410 ?auto_388413 ) ) ( not ( = ?auto_388410 ?auto_388414 ) ) ( not ( = ?auto_388410 ?auto_388415 ) ) ( not ( = ?auto_388410 ?auto_388416 ) ) ( not ( = ?auto_388410 ?auto_388417 ) ) ( not ( = ?auto_388410 ?auto_388418 ) ) ( not ( = ?auto_388411 ?auto_388412 ) ) ( not ( = ?auto_388411 ?auto_388413 ) ) ( not ( = ?auto_388411 ?auto_388414 ) ) ( not ( = ?auto_388411 ?auto_388415 ) ) ( not ( = ?auto_388411 ?auto_388416 ) ) ( not ( = ?auto_388411 ?auto_388417 ) ) ( not ( = ?auto_388411 ?auto_388418 ) ) ( not ( = ?auto_388412 ?auto_388413 ) ) ( not ( = ?auto_388412 ?auto_388414 ) ) ( not ( = ?auto_388412 ?auto_388415 ) ) ( not ( = ?auto_388412 ?auto_388416 ) ) ( not ( = ?auto_388412 ?auto_388417 ) ) ( not ( = ?auto_388412 ?auto_388418 ) ) ( not ( = ?auto_388413 ?auto_388414 ) ) ( not ( = ?auto_388413 ?auto_388415 ) ) ( not ( = ?auto_388413 ?auto_388416 ) ) ( not ( = ?auto_388413 ?auto_388417 ) ) ( not ( = ?auto_388413 ?auto_388418 ) ) ( not ( = ?auto_388414 ?auto_388415 ) ) ( not ( = ?auto_388414 ?auto_388416 ) ) ( not ( = ?auto_388414 ?auto_388417 ) ) ( not ( = ?auto_388414 ?auto_388418 ) ) ( not ( = ?auto_388415 ?auto_388416 ) ) ( not ( = ?auto_388415 ?auto_388417 ) ) ( not ( = ?auto_388415 ?auto_388418 ) ) ( not ( = ?auto_388416 ?auto_388417 ) ) ( not ( = ?auto_388416 ?auto_388418 ) ) ( not ( = ?auto_388417 ?auto_388418 ) ) ( CLEAR ?auto_388415 ) ( ON ?auto_388416 ?auto_388417 ) ( CLEAR ?auto_388416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_388407 ?auto_388408 ?auto_388409 ?auto_388410 ?auto_388411 ?auto_388412 ?auto_388413 ?auto_388414 ?auto_388415 ?auto_388416 )
      ( MAKE-11PILE ?auto_388407 ?auto_388408 ?auto_388409 ?auto_388410 ?auto_388411 ?auto_388412 ?auto_388413 ?auto_388414 ?auto_388415 ?auto_388416 ?auto_388417 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388453 - BLOCK
      ?auto_388454 - BLOCK
      ?auto_388455 - BLOCK
      ?auto_388456 - BLOCK
      ?auto_388457 - BLOCK
      ?auto_388458 - BLOCK
      ?auto_388459 - BLOCK
      ?auto_388460 - BLOCK
      ?auto_388461 - BLOCK
      ?auto_388462 - BLOCK
      ?auto_388463 - BLOCK
    )
    :vars
    (
      ?auto_388464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388463 ?auto_388464 ) ( ON-TABLE ?auto_388453 ) ( ON ?auto_388454 ?auto_388453 ) ( ON ?auto_388455 ?auto_388454 ) ( ON ?auto_388456 ?auto_388455 ) ( ON ?auto_388457 ?auto_388456 ) ( ON ?auto_388458 ?auto_388457 ) ( ON ?auto_388459 ?auto_388458 ) ( ON ?auto_388460 ?auto_388459 ) ( not ( = ?auto_388453 ?auto_388454 ) ) ( not ( = ?auto_388453 ?auto_388455 ) ) ( not ( = ?auto_388453 ?auto_388456 ) ) ( not ( = ?auto_388453 ?auto_388457 ) ) ( not ( = ?auto_388453 ?auto_388458 ) ) ( not ( = ?auto_388453 ?auto_388459 ) ) ( not ( = ?auto_388453 ?auto_388460 ) ) ( not ( = ?auto_388453 ?auto_388461 ) ) ( not ( = ?auto_388453 ?auto_388462 ) ) ( not ( = ?auto_388453 ?auto_388463 ) ) ( not ( = ?auto_388453 ?auto_388464 ) ) ( not ( = ?auto_388454 ?auto_388455 ) ) ( not ( = ?auto_388454 ?auto_388456 ) ) ( not ( = ?auto_388454 ?auto_388457 ) ) ( not ( = ?auto_388454 ?auto_388458 ) ) ( not ( = ?auto_388454 ?auto_388459 ) ) ( not ( = ?auto_388454 ?auto_388460 ) ) ( not ( = ?auto_388454 ?auto_388461 ) ) ( not ( = ?auto_388454 ?auto_388462 ) ) ( not ( = ?auto_388454 ?auto_388463 ) ) ( not ( = ?auto_388454 ?auto_388464 ) ) ( not ( = ?auto_388455 ?auto_388456 ) ) ( not ( = ?auto_388455 ?auto_388457 ) ) ( not ( = ?auto_388455 ?auto_388458 ) ) ( not ( = ?auto_388455 ?auto_388459 ) ) ( not ( = ?auto_388455 ?auto_388460 ) ) ( not ( = ?auto_388455 ?auto_388461 ) ) ( not ( = ?auto_388455 ?auto_388462 ) ) ( not ( = ?auto_388455 ?auto_388463 ) ) ( not ( = ?auto_388455 ?auto_388464 ) ) ( not ( = ?auto_388456 ?auto_388457 ) ) ( not ( = ?auto_388456 ?auto_388458 ) ) ( not ( = ?auto_388456 ?auto_388459 ) ) ( not ( = ?auto_388456 ?auto_388460 ) ) ( not ( = ?auto_388456 ?auto_388461 ) ) ( not ( = ?auto_388456 ?auto_388462 ) ) ( not ( = ?auto_388456 ?auto_388463 ) ) ( not ( = ?auto_388456 ?auto_388464 ) ) ( not ( = ?auto_388457 ?auto_388458 ) ) ( not ( = ?auto_388457 ?auto_388459 ) ) ( not ( = ?auto_388457 ?auto_388460 ) ) ( not ( = ?auto_388457 ?auto_388461 ) ) ( not ( = ?auto_388457 ?auto_388462 ) ) ( not ( = ?auto_388457 ?auto_388463 ) ) ( not ( = ?auto_388457 ?auto_388464 ) ) ( not ( = ?auto_388458 ?auto_388459 ) ) ( not ( = ?auto_388458 ?auto_388460 ) ) ( not ( = ?auto_388458 ?auto_388461 ) ) ( not ( = ?auto_388458 ?auto_388462 ) ) ( not ( = ?auto_388458 ?auto_388463 ) ) ( not ( = ?auto_388458 ?auto_388464 ) ) ( not ( = ?auto_388459 ?auto_388460 ) ) ( not ( = ?auto_388459 ?auto_388461 ) ) ( not ( = ?auto_388459 ?auto_388462 ) ) ( not ( = ?auto_388459 ?auto_388463 ) ) ( not ( = ?auto_388459 ?auto_388464 ) ) ( not ( = ?auto_388460 ?auto_388461 ) ) ( not ( = ?auto_388460 ?auto_388462 ) ) ( not ( = ?auto_388460 ?auto_388463 ) ) ( not ( = ?auto_388460 ?auto_388464 ) ) ( not ( = ?auto_388461 ?auto_388462 ) ) ( not ( = ?auto_388461 ?auto_388463 ) ) ( not ( = ?auto_388461 ?auto_388464 ) ) ( not ( = ?auto_388462 ?auto_388463 ) ) ( not ( = ?auto_388462 ?auto_388464 ) ) ( not ( = ?auto_388463 ?auto_388464 ) ) ( ON ?auto_388462 ?auto_388463 ) ( CLEAR ?auto_388460 ) ( ON ?auto_388461 ?auto_388462 ) ( CLEAR ?auto_388461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_388453 ?auto_388454 ?auto_388455 ?auto_388456 ?auto_388457 ?auto_388458 ?auto_388459 ?auto_388460 ?auto_388461 )
      ( MAKE-11PILE ?auto_388453 ?auto_388454 ?auto_388455 ?auto_388456 ?auto_388457 ?auto_388458 ?auto_388459 ?auto_388460 ?auto_388461 ?auto_388462 ?auto_388463 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388499 - BLOCK
      ?auto_388500 - BLOCK
      ?auto_388501 - BLOCK
      ?auto_388502 - BLOCK
      ?auto_388503 - BLOCK
      ?auto_388504 - BLOCK
      ?auto_388505 - BLOCK
      ?auto_388506 - BLOCK
      ?auto_388507 - BLOCK
      ?auto_388508 - BLOCK
      ?auto_388509 - BLOCK
    )
    :vars
    (
      ?auto_388510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388509 ?auto_388510 ) ( ON-TABLE ?auto_388499 ) ( ON ?auto_388500 ?auto_388499 ) ( ON ?auto_388501 ?auto_388500 ) ( ON ?auto_388502 ?auto_388501 ) ( ON ?auto_388503 ?auto_388502 ) ( ON ?auto_388504 ?auto_388503 ) ( ON ?auto_388505 ?auto_388504 ) ( not ( = ?auto_388499 ?auto_388500 ) ) ( not ( = ?auto_388499 ?auto_388501 ) ) ( not ( = ?auto_388499 ?auto_388502 ) ) ( not ( = ?auto_388499 ?auto_388503 ) ) ( not ( = ?auto_388499 ?auto_388504 ) ) ( not ( = ?auto_388499 ?auto_388505 ) ) ( not ( = ?auto_388499 ?auto_388506 ) ) ( not ( = ?auto_388499 ?auto_388507 ) ) ( not ( = ?auto_388499 ?auto_388508 ) ) ( not ( = ?auto_388499 ?auto_388509 ) ) ( not ( = ?auto_388499 ?auto_388510 ) ) ( not ( = ?auto_388500 ?auto_388501 ) ) ( not ( = ?auto_388500 ?auto_388502 ) ) ( not ( = ?auto_388500 ?auto_388503 ) ) ( not ( = ?auto_388500 ?auto_388504 ) ) ( not ( = ?auto_388500 ?auto_388505 ) ) ( not ( = ?auto_388500 ?auto_388506 ) ) ( not ( = ?auto_388500 ?auto_388507 ) ) ( not ( = ?auto_388500 ?auto_388508 ) ) ( not ( = ?auto_388500 ?auto_388509 ) ) ( not ( = ?auto_388500 ?auto_388510 ) ) ( not ( = ?auto_388501 ?auto_388502 ) ) ( not ( = ?auto_388501 ?auto_388503 ) ) ( not ( = ?auto_388501 ?auto_388504 ) ) ( not ( = ?auto_388501 ?auto_388505 ) ) ( not ( = ?auto_388501 ?auto_388506 ) ) ( not ( = ?auto_388501 ?auto_388507 ) ) ( not ( = ?auto_388501 ?auto_388508 ) ) ( not ( = ?auto_388501 ?auto_388509 ) ) ( not ( = ?auto_388501 ?auto_388510 ) ) ( not ( = ?auto_388502 ?auto_388503 ) ) ( not ( = ?auto_388502 ?auto_388504 ) ) ( not ( = ?auto_388502 ?auto_388505 ) ) ( not ( = ?auto_388502 ?auto_388506 ) ) ( not ( = ?auto_388502 ?auto_388507 ) ) ( not ( = ?auto_388502 ?auto_388508 ) ) ( not ( = ?auto_388502 ?auto_388509 ) ) ( not ( = ?auto_388502 ?auto_388510 ) ) ( not ( = ?auto_388503 ?auto_388504 ) ) ( not ( = ?auto_388503 ?auto_388505 ) ) ( not ( = ?auto_388503 ?auto_388506 ) ) ( not ( = ?auto_388503 ?auto_388507 ) ) ( not ( = ?auto_388503 ?auto_388508 ) ) ( not ( = ?auto_388503 ?auto_388509 ) ) ( not ( = ?auto_388503 ?auto_388510 ) ) ( not ( = ?auto_388504 ?auto_388505 ) ) ( not ( = ?auto_388504 ?auto_388506 ) ) ( not ( = ?auto_388504 ?auto_388507 ) ) ( not ( = ?auto_388504 ?auto_388508 ) ) ( not ( = ?auto_388504 ?auto_388509 ) ) ( not ( = ?auto_388504 ?auto_388510 ) ) ( not ( = ?auto_388505 ?auto_388506 ) ) ( not ( = ?auto_388505 ?auto_388507 ) ) ( not ( = ?auto_388505 ?auto_388508 ) ) ( not ( = ?auto_388505 ?auto_388509 ) ) ( not ( = ?auto_388505 ?auto_388510 ) ) ( not ( = ?auto_388506 ?auto_388507 ) ) ( not ( = ?auto_388506 ?auto_388508 ) ) ( not ( = ?auto_388506 ?auto_388509 ) ) ( not ( = ?auto_388506 ?auto_388510 ) ) ( not ( = ?auto_388507 ?auto_388508 ) ) ( not ( = ?auto_388507 ?auto_388509 ) ) ( not ( = ?auto_388507 ?auto_388510 ) ) ( not ( = ?auto_388508 ?auto_388509 ) ) ( not ( = ?auto_388508 ?auto_388510 ) ) ( not ( = ?auto_388509 ?auto_388510 ) ) ( ON ?auto_388508 ?auto_388509 ) ( ON ?auto_388507 ?auto_388508 ) ( CLEAR ?auto_388505 ) ( ON ?auto_388506 ?auto_388507 ) ( CLEAR ?auto_388506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_388499 ?auto_388500 ?auto_388501 ?auto_388502 ?auto_388503 ?auto_388504 ?auto_388505 ?auto_388506 )
      ( MAKE-11PILE ?auto_388499 ?auto_388500 ?auto_388501 ?auto_388502 ?auto_388503 ?auto_388504 ?auto_388505 ?auto_388506 ?auto_388507 ?auto_388508 ?auto_388509 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388545 - BLOCK
      ?auto_388546 - BLOCK
      ?auto_388547 - BLOCK
      ?auto_388548 - BLOCK
      ?auto_388549 - BLOCK
      ?auto_388550 - BLOCK
      ?auto_388551 - BLOCK
      ?auto_388552 - BLOCK
      ?auto_388553 - BLOCK
      ?auto_388554 - BLOCK
      ?auto_388555 - BLOCK
    )
    :vars
    (
      ?auto_388556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388555 ?auto_388556 ) ( ON-TABLE ?auto_388545 ) ( ON ?auto_388546 ?auto_388545 ) ( ON ?auto_388547 ?auto_388546 ) ( ON ?auto_388548 ?auto_388547 ) ( ON ?auto_388549 ?auto_388548 ) ( ON ?auto_388550 ?auto_388549 ) ( not ( = ?auto_388545 ?auto_388546 ) ) ( not ( = ?auto_388545 ?auto_388547 ) ) ( not ( = ?auto_388545 ?auto_388548 ) ) ( not ( = ?auto_388545 ?auto_388549 ) ) ( not ( = ?auto_388545 ?auto_388550 ) ) ( not ( = ?auto_388545 ?auto_388551 ) ) ( not ( = ?auto_388545 ?auto_388552 ) ) ( not ( = ?auto_388545 ?auto_388553 ) ) ( not ( = ?auto_388545 ?auto_388554 ) ) ( not ( = ?auto_388545 ?auto_388555 ) ) ( not ( = ?auto_388545 ?auto_388556 ) ) ( not ( = ?auto_388546 ?auto_388547 ) ) ( not ( = ?auto_388546 ?auto_388548 ) ) ( not ( = ?auto_388546 ?auto_388549 ) ) ( not ( = ?auto_388546 ?auto_388550 ) ) ( not ( = ?auto_388546 ?auto_388551 ) ) ( not ( = ?auto_388546 ?auto_388552 ) ) ( not ( = ?auto_388546 ?auto_388553 ) ) ( not ( = ?auto_388546 ?auto_388554 ) ) ( not ( = ?auto_388546 ?auto_388555 ) ) ( not ( = ?auto_388546 ?auto_388556 ) ) ( not ( = ?auto_388547 ?auto_388548 ) ) ( not ( = ?auto_388547 ?auto_388549 ) ) ( not ( = ?auto_388547 ?auto_388550 ) ) ( not ( = ?auto_388547 ?auto_388551 ) ) ( not ( = ?auto_388547 ?auto_388552 ) ) ( not ( = ?auto_388547 ?auto_388553 ) ) ( not ( = ?auto_388547 ?auto_388554 ) ) ( not ( = ?auto_388547 ?auto_388555 ) ) ( not ( = ?auto_388547 ?auto_388556 ) ) ( not ( = ?auto_388548 ?auto_388549 ) ) ( not ( = ?auto_388548 ?auto_388550 ) ) ( not ( = ?auto_388548 ?auto_388551 ) ) ( not ( = ?auto_388548 ?auto_388552 ) ) ( not ( = ?auto_388548 ?auto_388553 ) ) ( not ( = ?auto_388548 ?auto_388554 ) ) ( not ( = ?auto_388548 ?auto_388555 ) ) ( not ( = ?auto_388548 ?auto_388556 ) ) ( not ( = ?auto_388549 ?auto_388550 ) ) ( not ( = ?auto_388549 ?auto_388551 ) ) ( not ( = ?auto_388549 ?auto_388552 ) ) ( not ( = ?auto_388549 ?auto_388553 ) ) ( not ( = ?auto_388549 ?auto_388554 ) ) ( not ( = ?auto_388549 ?auto_388555 ) ) ( not ( = ?auto_388549 ?auto_388556 ) ) ( not ( = ?auto_388550 ?auto_388551 ) ) ( not ( = ?auto_388550 ?auto_388552 ) ) ( not ( = ?auto_388550 ?auto_388553 ) ) ( not ( = ?auto_388550 ?auto_388554 ) ) ( not ( = ?auto_388550 ?auto_388555 ) ) ( not ( = ?auto_388550 ?auto_388556 ) ) ( not ( = ?auto_388551 ?auto_388552 ) ) ( not ( = ?auto_388551 ?auto_388553 ) ) ( not ( = ?auto_388551 ?auto_388554 ) ) ( not ( = ?auto_388551 ?auto_388555 ) ) ( not ( = ?auto_388551 ?auto_388556 ) ) ( not ( = ?auto_388552 ?auto_388553 ) ) ( not ( = ?auto_388552 ?auto_388554 ) ) ( not ( = ?auto_388552 ?auto_388555 ) ) ( not ( = ?auto_388552 ?auto_388556 ) ) ( not ( = ?auto_388553 ?auto_388554 ) ) ( not ( = ?auto_388553 ?auto_388555 ) ) ( not ( = ?auto_388553 ?auto_388556 ) ) ( not ( = ?auto_388554 ?auto_388555 ) ) ( not ( = ?auto_388554 ?auto_388556 ) ) ( not ( = ?auto_388555 ?auto_388556 ) ) ( ON ?auto_388554 ?auto_388555 ) ( ON ?auto_388553 ?auto_388554 ) ( ON ?auto_388552 ?auto_388553 ) ( CLEAR ?auto_388550 ) ( ON ?auto_388551 ?auto_388552 ) ( CLEAR ?auto_388551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_388545 ?auto_388546 ?auto_388547 ?auto_388548 ?auto_388549 ?auto_388550 ?auto_388551 )
      ( MAKE-11PILE ?auto_388545 ?auto_388546 ?auto_388547 ?auto_388548 ?auto_388549 ?auto_388550 ?auto_388551 ?auto_388552 ?auto_388553 ?auto_388554 ?auto_388555 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388591 - BLOCK
      ?auto_388592 - BLOCK
      ?auto_388593 - BLOCK
      ?auto_388594 - BLOCK
      ?auto_388595 - BLOCK
      ?auto_388596 - BLOCK
      ?auto_388597 - BLOCK
      ?auto_388598 - BLOCK
      ?auto_388599 - BLOCK
      ?auto_388600 - BLOCK
      ?auto_388601 - BLOCK
    )
    :vars
    (
      ?auto_388602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388601 ?auto_388602 ) ( ON-TABLE ?auto_388591 ) ( ON ?auto_388592 ?auto_388591 ) ( ON ?auto_388593 ?auto_388592 ) ( ON ?auto_388594 ?auto_388593 ) ( ON ?auto_388595 ?auto_388594 ) ( not ( = ?auto_388591 ?auto_388592 ) ) ( not ( = ?auto_388591 ?auto_388593 ) ) ( not ( = ?auto_388591 ?auto_388594 ) ) ( not ( = ?auto_388591 ?auto_388595 ) ) ( not ( = ?auto_388591 ?auto_388596 ) ) ( not ( = ?auto_388591 ?auto_388597 ) ) ( not ( = ?auto_388591 ?auto_388598 ) ) ( not ( = ?auto_388591 ?auto_388599 ) ) ( not ( = ?auto_388591 ?auto_388600 ) ) ( not ( = ?auto_388591 ?auto_388601 ) ) ( not ( = ?auto_388591 ?auto_388602 ) ) ( not ( = ?auto_388592 ?auto_388593 ) ) ( not ( = ?auto_388592 ?auto_388594 ) ) ( not ( = ?auto_388592 ?auto_388595 ) ) ( not ( = ?auto_388592 ?auto_388596 ) ) ( not ( = ?auto_388592 ?auto_388597 ) ) ( not ( = ?auto_388592 ?auto_388598 ) ) ( not ( = ?auto_388592 ?auto_388599 ) ) ( not ( = ?auto_388592 ?auto_388600 ) ) ( not ( = ?auto_388592 ?auto_388601 ) ) ( not ( = ?auto_388592 ?auto_388602 ) ) ( not ( = ?auto_388593 ?auto_388594 ) ) ( not ( = ?auto_388593 ?auto_388595 ) ) ( not ( = ?auto_388593 ?auto_388596 ) ) ( not ( = ?auto_388593 ?auto_388597 ) ) ( not ( = ?auto_388593 ?auto_388598 ) ) ( not ( = ?auto_388593 ?auto_388599 ) ) ( not ( = ?auto_388593 ?auto_388600 ) ) ( not ( = ?auto_388593 ?auto_388601 ) ) ( not ( = ?auto_388593 ?auto_388602 ) ) ( not ( = ?auto_388594 ?auto_388595 ) ) ( not ( = ?auto_388594 ?auto_388596 ) ) ( not ( = ?auto_388594 ?auto_388597 ) ) ( not ( = ?auto_388594 ?auto_388598 ) ) ( not ( = ?auto_388594 ?auto_388599 ) ) ( not ( = ?auto_388594 ?auto_388600 ) ) ( not ( = ?auto_388594 ?auto_388601 ) ) ( not ( = ?auto_388594 ?auto_388602 ) ) ( not ( = ?auto_388595 ?auto_388596 ) ) ( not ( = ?auto_388595 ?auto_388597 ) ) ( not ( = ?auto_388595 ?auto_388598 ) ) ( not ( = ?auto_388595 ?auto_388599 ) ) ( not ( = ?auto_388595 ?auto_388600 ) ) ( not ( = ?auto_388595 ?auto_388601 ) ) ( not ( = ?auto_388595 ?auto_388602 ) ) ( not ( = ?auto_388596 ?auto_388597 ) ) ( not ( = ?auto_388596 ?auto_388598 ) ) ( not ( = ?auto_388596 ?auto_388599 ) ) ( not ( = ?auto_388596 ?auto_388600 ) ) ( not ( = ?auto_388596 ?auto_388601 ) ) ( not ( = ?auto_388596 ?auto_388602 ) ) ( not ( = ?auto_388597 ?auto_388598 ) ) ( not ( = ?auto_388597 ?auto_388599 ) ) ( not ( = ?auto_388597 ?auto_388600 ) ) ( not ( = ?auto_388597 ?auto_388601 ) ) ( not ( = ?auto_388597 ?auto_388602 ) ) ( not ( = ?auto_388598 ?auto_388599 ) ) ( not ( = ?auto_388598 ?auto_388600 ) ) ( not ( = ?auto_388598 ?auto_388601 ) ) ( not ( = ?auto_388598 ?auto_388602 ) ) ( not ( = ?auto_388599 ?auto_388600 ) ) ( not ( = ?auto_388599 ?auto_388601 ) ) ( not ( = ?auto_388599 ?auto_388602 ) ) ( not ( = ?auto_388600 ?auto_388601 ) ) ( not ( = ?auto_388600 ?auto_388602 ) ) ( not ( = ?auto_388601 ?auto_388602 ) ) ( ON ?auto_388600 ?auto_388601 ) ( ON ?auto_388599 ?auto_388600 ) ( ON ?auto_388598 ?auto_388599 ) ( ON ?auto_388597 ?auto_388598 ) ( CLEAR ?auto_388595 ) ( ON ?auto_388596 ?auto_388597 ) ( CLEAR ?auto_388596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_388591 ?auto_388592 ?auto_388593 ?auto_388594 ?auto_388595 ?auto_388596 )
      ( MAKE-11PILE ?auto_388591 ?auto_388592 ?auto_388593 ?auto_388594 ?auto_388595 ?auto_388596 ?auto_388597 ?auto_388598 ?auto_388599 ?auto_388600 ?auto_388601 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388637 - BLOCK
      ?auto_388638 - BLOCK
      ?auto_388639 - BLOCK
      ?auto_388640 - BLOCK
      ?auto_388641 - BLOCK
      ?auto_388642 - BLOCK
      ?auto_388643 - BLOCK
      ?auto_388644 - BLOCK
      ?auto_388645 - BLOCK
      ?auto_388646 - BLOCK
      ?auto_388647 - BLOCK
    )
    :vars
    (
      ?auto_388648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388647 ?auto_388648 ) ( ON-TABLE ?auto_388637 ) ( ON ?auto_388638 ?auto_388637 ) ( ON ?auto_388639 ?auto_388638 ) ( ON ?auto_388640 ?auto_388639 ) ( not ( = ?auto_388637 ?auto_388638 ) ) ( not ( = ?auto_388637 ?auto_388639 ) ) ( not ( = ?auto_388637 ?auto_388640 ) ) ( not ( = ?auto_388637 ?auto_388641 ) ) ( not ( = ?auto_388637 ?auto_388642 ) ) ( not ( = ?auto_388637 ?auto_388643 ) ) ( not ( = ?auto_388637 ?auto_388644 ) ) ( not ( = ?auto_388637 ?auto_388645 ) ) ( not ( = ?auto_388637 ?auto_388646 ) ) ( not ( = ?auto_388637 ?auto_388647 ) ) ( not ( = ?auto_388637 ?auto_388648 ) ) ( not ( = ?auto_388638 ?auto_388639 ) ) ( not ( = ?auto_388638 ?auto_388640 ) ) ( not ( = ?auto_388638 ?auto_388641 ) ) ( not ( = ?auto_388638 ?auto_388642 ) ) ( not ( = ?auto_388638 ?auto_388643 ) ) ( not ( = ?auto_388638 ?auto_388644 ) ) ( not ( = ?auto_388638 ?auto_388645 ) ) ( not ( = ?auto_388638 ?auto_388646 ) ) ( not ( = ?auto_388638 ?auto_388647 ) ) ( not ( = ?auto_388638 ?auto_388648 ) ) ( not ( = ?auto_388639 ?auto_388640 ) ) ( not ( = ?auto_388639 ?auto_388641 ) ) ( not ( = ?auto_388639 ?auto_388642 ) ) ( not ( = ?auto_388639 ?auto_388643 ) ) ( not ( = ?auto_388639 ?auto_388644 ) ) ( not ( = ?auto_388639 ?auto_388645 ) ) ( not ( = ?auto_388639 ?auto_388646 ) ) ( not ( = ?auto_388639 ?auto_388647 ) ) ( not ( = ?auto_388639 ?auto_388648 ) ) ( not ( = ?auto_388640 ?auto_388641 ) ) ( not ( = ?auto_388640 ?auto_388642 ) ) ( not ( = ?auto_388640 ?auto_388643 ) ) ( not ( = ?auto_388640 ?auto_388644 ) ) ( not ( = ?auto_388640 ?auto_388645 ) ) ( not ( = ?auto_388640 ?auto_388646 ) ) ( not ( = ?auto_388640 ?auto_388647 ) ) ( not ( = ?auto_388640 ?auto_388648 ) ) ( not ( = ?auto_388641 ?auto_388642 ) ) ( not ( = ?auto_388641 ?auto_388643 ) ) ( not ( = ?auto_388641 ?auto_388644 ) ) ( not ( = ?auto_388641 ?auto_388645 ) ) ( not ( = ?auto_388641 ?auto_388646 ) ) ( not ( = ?auto_388641 ?auto_388647 ) ) ( not ( = ?auto_388641 ?auto_388648 ) ) ( not ( = ?auto_388642 ?auto_388643 ) ) ( not ( = ?auto_388642 ?auto_388644 ) ) ( not ( = ?auto_388642 ?auto_388645 ) ) ( not ( = ?auto_388642 ?auto_388646 ) ) ( not ( = ?auto_388642 ?auto_388647 ) ) ( not ( = ?auto_388642 ?auto_388648 ) ) ( not ( = ?auto_388643 ?auto_388644 ) ) ( not ( = ?auto_388643 ?auto_388645 ) ) ( not ( = ?auto_388643 ?auto_388646 ) ) ( not ( = ?auto_388643 ?auto_388647 ) ) ( not ( = ?auto_388643 ?auto_388648 ) ) ( not ( = ?auto_388644 ?auto_388645 ) ) ( not ( = ?auto_388644 ?auto_388646 ) ) ( not ( = ?auto_388644 ?auto_388647 ) ) ( not ( = ?auto_388644 ?auto_388648 ) ) ( not ( = ?auto_388645 ?auto_388646 ) ) ( not ( = ?auto_388645 ?auto_388647 ) ) ( not ( = ?auto_388645 ?auto_388648 ) ) ( not ( = ?auto_388646 ?auto_388647 ) ) ( not ( = ?auto_388646 ?auto_388648 ) ) ( not ( = ?auto_388647 ?auto_388648 ) ) ( ON ?auto_388646 ?auto_388647 ) ( ON ?auto_388645 ?auto_388646 ) ( ON ?auto_388644 ?auto_388645 ) ( ON ?auto_388643 ?auto_388644 ) ( ON ?auto_388642 ?auto_388643 ) ( CLEAR ?auto_388640 ) ( ON ?auto_388641 ?auto_388642 ) ( CLEAR ?auto_388641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_388637 ?auto_388638 ?auto_388639 ?auto_388640 ?auto_388641 )
      ( MAKE-11PILE ?auto_388637 ?auto_388638 ?auto_388639 ?auto_388640 ?auto_388641 ?auto_388642 ?auto_388643 ?auto_388644 ?auto_388645 ?auto_388646 ?auto_388647 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388683 - BLOCK
      ?auto_388684 - BLOCK
      ?auto_388685 - BLOCK
      ?auto_388686 - BLOCK
      ?auto_388687 - BLOCK
      ?auto_388688 - BLOCK
      ?auto_388689 - BLOCK
      ?auto_388690 - BLOCK
      ?auto_388691 - BLOCK
      ?auto_388692 - BLOCK
      ?auto_388693 - BLOCK
    )
    :vars
    (
      ?auto_388694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388693 ?auto_388694 ) ( ON-TABLE ?auto_388683 ) ( ON ?auto_388684 ?auto_388683 ) ( ON ?auto_388685 ?auto_388684 ) ( not ( = ?auto_388683 ?auto_388684 ) ) ( not ( = ?auto_388683 ?auto_388685 ) ) ( not ( = ?auto_388683 ?auto_388686 ) ) ( not ( = ?auto_388683 ?auto_388687 ) ) ( not ( = ?auto_388683 ?auto_388688 ) ) ( not ( = ?auto_388683 ?auto_388689 ) ) ( not ( = ?auto_388683 ?auto_388690 ) ) ( not ( = ?auto_388683 ?auto_388691 ) ) ( not ( = ?auto_388683 ?auto_388692 ) ) ( not ( = ?auto_388683 ?auto_388693 ) ) ( not ( = ?auto_388683 ?auto_388694 ) ) ( not ( = ?auto_388684 ?auto_388685 ) ) ( not ( = ?auto_388684 ?auto_388686 ) ) ( not ( = ?auto_388684 ?auto_388687 ) ) ( not ( = ?auto_388684 ?auto_388688 ) ) ( not ( = ?auto_388684 ?auto_388689 ) ) ( not ( = ?auto_388684 ?auto_388690 ) ) ( not ( = ?auto_388684 ?auto_388691 ) ) ( not ( = ?auto_388684 ?auto_388692 ) ) ( not ( = ?auto_388684 ?auto_388693 ) ) ( not ( = ?auto_388684 ?auto_388694 ) ) ( not ( = ?auto_388685 ?auto_388686 ) ) ( not ( = ?auto_388685 ?auto_388687 ) ) ( not ( = ?auto_388685 ?auto_388688 ) ) ( not ( = ?auto_388685 ?auto_388689 ) ) ( not ( = ?auto_388685 ?auto_388690 ) ) ( not ( = ?auto_388685 ?auto_388691 ) ) ( not ( = ?auto_388685 ?auto_388692 ) ) ( not ( = ?auto_388685 ?auto_388693 ) ) ( not ( = ?auto_388685 ?auto_388694 ) ) ( not ( = ?auto_388686 ?auto_388687 ) ) ( not ( = ?auto_388686 ?auto_388688 ) ) ( not ( = ?auto_388686 ?auto_388689 ) ) ( not ( = ?auto_388686 ?auto_388690 ) ) ( not ( = ?auto_388686 ?auto_388691 ) ) ( not ( = ?auto_388686 ?auto_388692 ) ) ( not ( = ?auto_388686 ?auto_388693 ) ) ( not ( = ?auto_388686 ?auto_388694 ) ) ( not ( = ?auto_388687 ?auto_388688 ) ) ( not ( = ?auto_388687 ?auto_388689 ) ) ( not ( = ?auto_388687 ?auto_388690 ) ) ( not ( = ?auto_388687 ?auto_388691 ) ) ( not ( = ?auto_388687 ?auto_388692 ) ) ( not ( = ?auto_388687 ?auto_388693 ) ) ( not ( = ?auto_388687 ?auto_388694 ) ) ( not ( = ?auto_388688 ?auto_388689 ) ) ( not ( = ?auto_388688 ?auto_388690 ) ) ( not ( = ?auto_388688 ?auto_388691 ) ) ( not ( = ?auto_388688 ?auto_388692 ) ) ( not ( = ?auto_388688 ?auto_388693 ) ) ( not ( = ?auto_388688 ?auto_388694 ) ) ( not ( = ?auto_388689 ?auto_388690 ) ) ( not ( = ?auto_388689 ?auto_388691 ) ) ( not ( = ?auto_388689 ?auto_388692 ) ) ( not ( = ?auto_388689 ?auto_388693 ) ) ( not ( = ?auto_388689 ?auto_388694 ) ) ( not ( = ?auto_388690 ?auto_388691 ) ) ( not ( = ?auto_388690 ?auto_388692 ) ) ( not ( = ?auto_388690 ?auto_388693 ) ) ( not ( = ?auto_388690 ?auto_388694 ) ) ( not ( = ?auto_388691 ?auto_388692 ) ) ( not ( = ?auto_388691 ?auto_388693 ) ) ( not ( = ?auto_388691 ?auto_388694 ) ) ( not ( = ?auto_388692 ?auto_388693 ) ) ( not ( = ?auto_388692 ?auto_388694 ) ) ( not ( = ?auto_388693 ?auto_388694 ) ) ( ON ?auto_388692 ?auto_388693 ) ( ON ?auto_388691 ?auto_388692 ) ( ON ?auto_388690 ?auto_388691 ) ( ON ?auto_388689 ?auto_388690 ) ( ON ?auto_388688 ?auto_388689 ) ( ON ?auto_388687 ?auto_388688 ) ( CLEAR ?auto_388685 ) ( ON ?auto_388686 ?auto_388687 ) ( CLEAR ?auto_388686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_388683 ?auto_388684 ?auto_388685 ?auto_388686 )
      ( MAKE-11PILE ?auto_388683 ?auto_388684 ?auto_388685 ?auto_388686 ?auto_388687 ?auto_388688 ?auto_388689 ?auto_388690 ?auto_388691 ?auto_388692 ?auto_388693 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388729 - BLOCK
      ?auto_388730 - BLOCK
      ?auto_388731 - BLOCK
      ?auto_388732 - BLOCK
      ?auto_388733 - BLOCK
      ?auto_388734 - BLOCK
      ?auto_388735 - BLOCK
      ?auto_388736 - BLOCK
      ?auto_388737 - BLOCK
      ?auto_388738 - BLOCK
      ?auto_388739 - BLOCK
    )
    :vars
    (
      ?auto_388740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388739 ?auto_388740 ) ( ON-TABLE ?auto_388729 ) ( ON ?auto_388730 ?auto_388729 ) ( not ( = ?auto_388729 ?auto_388730 ) ) ( not ( = ?auto_388729 ?auto_388731 ) ) ( not ( = ?auto_388729 ?auto_388732 ) ) ( not ( = ?auto_388729 ?auto_388733 ) ) ( not ( = ?auto_388729 ?auto_388734 ) ) ( not ( = ?auto_388729 ?auto_388735 ) ) ( not ( = ?auto_388729 ?auto_388736 ) ) ( not ( = ?auto_388729 ?auto_388737 ) ) ( not ( = ?auto_388729 ?auto_388738 ) ) ( not ( = ?auto_388729 ?auto_388739 ) ) ( not ( = ?auto_388729 ?auto_388740 ) ) ( not ( = ?auto_388730 ?auto_388731 ) ) ( not ( = ?auto_388730 ?auto_388732 ) ) ( not ( = ?auto_388730 ?auto_388733 ) ) ( not ( = ?auto_388730 ?auto_388734 ) ) ( not ( = ?auto_388730 ?auto_388735 ) ) ( not ( = ?auto_388730 ?auto_388736 ) ) ( not ( = ?auto_388730 ?auto_388737 ) ) ( not ( = ?auto_388730 ?auto_388738 ) ) ( not ( = ?auto_388730 ?auto_388739 ) ) ( not ( = ?auto_388730 ?auto_388740 ) ) ( not ( = ?auto_388731 ?auto_388732 ) ) ( not ( = ?auto_388731 ?auto_388733 ) ) ( not ( = ?auto_388731 ?auto_388734 ) ) ( not ( = ?auto_388731 ?auto_388735 ) ) ( not ( = ?auto_388731 ?auto_388736 ) ) ( not ( = ?auto_388731 ?auto_388737 ) ) ( not ( = ?auto_388731 ?auto_388738 ) ) ( not ( = ?auto_388731 ?auto_388739 ) ) ( not ( = ?auto_388731 ?auto_388740 ) ) ( not ( = ?auto_388732 ?auto_388733 ) ) ( not ( = ?auto_388732 ?auto_388734 ) ) ( not ( = ?auto_388732 ?auto_388735 ) ) ( not ( = ?auto_388732 ?auto_388736 ) ) ( not ( = ?auto_388732 ?auto_388737 ) ) ( not ( = ?auto_388732 ?auto_388738 ) ) ( not ( = ?auto_388732 ?auto_388739 ) ) ( not ( = ?auto_388732 ?auto_388740 ) ) ( not ( = ?auto_388733 ?auto_388734 ) ) ( not ( = ?auto_388733 ?auto_388735 ) ) ( not ( = ?auto_388733 ?auto_388736 ) ) ( not ( = ?auto_388733 ?auto_388737 ) ) ( not ( = ?auto_388733 ?auto_388738 ) ) ( not ( = ?auto_388733 ?auto_388739 ) ) ( not ( = ?auto_388733 ?auto_388740 ) ) ( not ( = ?auto_388734 ?auto_388735 ) ) ( not ( = ?auto_388734 ?auto_388736 ) ) ( not ( = ?auto_388734 ?auto_388737 ) ) ( not ( = ?auto_388734 ?auto_388738 ) ) ( not ( = ?auto_388734 ?auto_388739 ) ) ( not ( = ?auto_388734 ?auto_388740 ) ) ( not ( = ?auto_388735 ?auto_388736 ) ) ( not ( = ?auto_388735 ?auto_388737 ) ) ( not ( = ?auto_388735 ?auto_388738 ) ) ( not ( = ?auto_388735 ?auto_388739 ) ) ( not ( = ?auto_388735 ?auto_388740 ) ) ( not ( = ?auto_388736 ?auto_388737 ) ) ( not ( = ?auto_388736 ?auto_388738 ) ) ( not ( = ?auto_388736 ?auto_388739 ) ) ( not ( = ?auto_388736 ?auto_388740 ) ) ( not ( = ?auto_388737 ?auto_388738 ) ) ( not ( = ?auto_388737 ?auto_388739 ) ) ( not ( = ?auto_388737 ?auto_388740 ) ) ( not ( = ?auto_388738 ?auto_388739 ) ) ( not ( = ?auto_388738 ?auto_388740 ) ) ( not ( = ?auto_388739 ?auto_388740 ) ) ( ON ?auto_388738 ?auto_388739 ) ( ON ?auto_388737 ?auto_388738 ) ( ON ?auto_388736 ?auto_388737 ) ( ON ?auto_388735 ?auto_388736 ) ( ON ?auto_388734 ?auto_388735 ) ( ON ?auto_388733 ?auto_388734 ) ( ON ?auto_388732 ?auto_388733 ) ( CLEAR ?auto_388730 ) ( ON ?auto_388731 ?auto_388732 ) ( CLEAR ?auto_388731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_388729 ?auto_388730 ?auto_388731 )
      ( MAKE-11PILE ?auto_388729 ?auto_388730 ?auto_388731 ?auto_388732 ?auto_388733 ?auto_388734 ?auto_388735 ?auto_388736 ?auto_388737 ?auto_388738 ?auto_388739 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388775 - BLOCK
      ?auto_388776 - BLOCK
      ?auto_388777 - BLOCK
      ?auto_388778 - BLOCK
      ?auto_388779 - BLOCK
      ?auto_388780 - BLOCK
      ?auto_388781 - BLOCK
      ?auto_388782 - BLOCK
      ?auto_388783 - BLOCK
      ?auto_388784 - BLOCK
      ?auto_388785 - BLOCK
    )
    :vars
    (
      ?auto_388786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388785 ?auto_388786 ) ( ON-TABLE ?auto_388775 ) ( not ( = ?auto_388775 ?auto_388776 ) ) ( not ( = ?auto_388775 ?auto_388777 ) ) ( not ( = ?auto_388775 ?auto_388778 ) ) ( not ( = ?auto_388775 ?auto_388779 ) ) ( not ( = ?auto_388775 ?auto_388780 ) ) ( not ( = ?auto_388775 ?auto_388781 ) ) ( not ( = ?auto_388775 ?auto_388782 ) ) ( not ( = ?auto_388775 ?auto_388783 ) ) ( not ( = ?auto_388775 ?auto_388784 ) ) ( not ( = ?auto_388775 ?auto_388785 ) ) ( not ( = ?auto_388775 ?auto_388786 ) ) ( not ( = ?auto_388776 ?auto_388777 ) ) ( not ( = ?auto_388776 ?auto_388778 ) ) ( not ( = ?auto_388776 ?auto_388779 ) ) ( not ( = ?auto_388776 ?auto_388780 ) ) ( not ( = ?auto_388776 ?auto_388781 ) ) ( not ( = ?auto_388776 ?auto_388782 ) ) ( not ( = ?auto_388776 ?auto_388783 ) ) ( not ( = ?auto_388776 ?auto_388784 ) ) ( not ( = ?auto_388776 ?auto_388785 ) ) ( not ( = ?auto_388776 ?auto_388786 ) ) ( not ( = ?auto_388777 ?auto_388778 ) ) ( not ( = ?auto_388777 ?auto_388779 ) ) ( not ( = ?auto_388777 ?auto_388780 ) ) ( not ( = ?auto_388777 ?auto_388781 ) ) ( not ( = ?auto_388777 ?auto_388782 ) ) ( not ( = ?auto_388777 ?auto_388783 ) ) ( not ( = ?auto_388777 ?auto_388784 ) ) ( not ( = ?auto_388777 ?auto_388785 ) ) ( not ( = ?auto_388777 ?auto_388786 ) ) ( not ( = ?auto_388778 ?auto_388779 ) ) ( not ( = ?auto_388778 ?auto_388780 ) ) ( not ( = ?auto_388778 ?auto_388781 ) ) ( not ( = ?auto_388778 ?auto_388782 ) ) ( not ( = ?auto_388778 ?auto_388783 ) ) ( not ( = ?auto_388778 ?auto_388784 ) ) ( not ( = ?auto_388778 ?auto_388785 ) ) ( not ( = ?auto_388778 ?auto_388786 ) ) ( not ( = ?auto_388779 ?auto_388780 ) ) ( not ( = ?auto_388779 ?auto_388781 ) ) ( not ( = ?auto_388779 ?auto_388782 ) ) ( not ( = ?auto_388779 ?auto_388783 ) ) ( not ( = ?auto_388779 ?auto_388784 ) ) ( not ( = ?auto_388779 ?auto_388785 ) ) ( not ( = ?auto_388779 ?auto_388786 ) ) ( not ( = ?auto_388780 ?auto_388781 ) ) ( not ( = ?auto_388780 ?auto_388782 ) ) ( not ( = ?auto_388780 ?auto_388783 ) ) ( not ( = ?auto_388780 ?auto_388784 ) ) ( not ( = ?auto_388780 ?auto_388785 ) ) ( not ( = ?auto_388780 ?auto_388786 ) ) ( not ( = ?auto_388781 ?auto_388782 ) ) ( not ( = ?auto_388781 ?auto_388783 ) ) ( not ( = ?auto_388781 ?auto_388784 ) ) ( not ( = ?auto_388781 ?auto_388785 ) ) ( not ( = ?auto_388781 ?auto_388786 ) ) ( not ( = ?auto_388782 ?auto_388783 ) ) ( not ( = ?auto_388782 ?auto_388784 ) ) ( not ( = ?auto_388782 ?auto_388785 ) ) ( not ( = ?auto_388782 ?auto_388786 ) ) ( not ( = ?auto_388783 ?auto_388784 ) ) ( not ( = ?auto_388783 ?auto_388785 ) ) ( not ( = ?auto_388783 ?auto_388786 ) ) ( not ( = ?auto_388784 ?auto_388785 ) ) ( not ( = ?auto_388784 ?auto_388786 ) ) ( not ( = ?auto_388785 ?auto_388786 ) ) ( ON ?auto_388784 ?auto_388785 ) ( ON ?auto_388783 ?auto_388784 ) ( ON ?auto_388782 ?auto_388783 ) ( ON ?auto_388781 ?auto_388782 ) ( ON ?auto_388780 ?auto_388781 ) ( ON ?auto_388779 ?auto_388780 ) ( ON ?auto_388778 ?auto_388779 ) ( ON ?auto_388777 ?auto_388778 ) ( CLEAR ?auto_388775 ) ( ON ?auto_388776 ?auto_388777 ) ( CLEAR ?auto_388776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_388775 ?auto_388776 )
      ( MAKE-11PILE ?auto_388775 ?auto_388776 ?auto_388777 ?auto_388778 ?auto_388779 ?auto_388780 ?auto_388781 ?auto_388782 ?auto_388783 ?auto_388784 ?auto_388785 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388821 - BLOCK
      ?auto_388822 - BLOCK
      ?auto_388823 - BLOCK
      ?auto_388824 - BLOCK
      ?auto_388825 - BLOCK
      ?auto_388826 - BLOCK
      ?auto_388827 - BLOCK
      ?auto_388828 - BLOCK
      ?auto_388829 - BLOCK
      ?auto_388830 - BLOCK
      ?auto_388831 - BLOCK
    )
    :vars
    (
      ?auto_388832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388831 ?auto_388832 ) ( not ( = ?auto_388821 ?auto_388822 ) ) ( not ( = ?auto_388821 ?auto_388823 ) ) ( not ( = ?auto_388821 ?auto_388824 ) ) ( not ( = ?auto_388821 ?auto_388825 ) ) ( not ( = ?auto_388821 ?auto_388826 ) ) ( not ( = ?auto_388821 ?auto_388827 ) ) ( not ( = ?auto_388821 ?auto_388828 ) ) ( not ( = ?auto_388821 ?auto_388829 ) ) ( not ( = ?auto_388821 ?auto_388830 ) ) ( not ( = ?auto_388821 ?auto_388831 ) ) ( not ( = ?auto_388821 ?auto_388832 ) ) ( not ( = ?auto_388822 ?auto_388823 ) ) ( not ( = ?auto_388822 ?auto_388824 ) ) ( not ( = ?auto_388822 ?auto_388825 ) ) ( not ( = ?auto_388822 ?auto_388826 ) ) ( not ( = ?auto_388822 ?auto_388827 ) ) ( not ( = ?auto_388822 ?auto_388828 ) ) ( not ( = ?auto_388822 ?auto_388829 ) ) ( not ( = ?auto_388822 ?auto_388830 ) ) ( not ( = ?auto_388822 ?auto_388831 ) ) ( not ( = ?auto_388822 ?auto_388832 ) ) ( not ( = ?auto_388823 ?auto_388824 ) ) ( not ( = ?auto_388823 ?auto_388825 ) ) ( not ( = ?auto_388823 ?auto_388826 ) ) ( not ( = ?auto_388823 ?auto_388827 ) ) ( not ( = ?auto_388823 ?auto_388828 ) ) ( not ( = ?auto_388823 ?auto_388829 ) ) ( not ( = ?auto_388823 ?auto_388830 ) ) ( not ( = ?auto_388823 ?auto_388831 ) ) ( not ( = ?auto_388823 ?auto_388832 ) ) ( not ( = ?auto_388824 ?auto_388825 ) ) ( not ( = ?auto_388824 ?auto_388826 ) ) ( not ( = ?auto_388824 ?auto_388827 ) ) ( not ( = ?auto_388824 ?auto_388828 ) ) ( not ( = ?auto_388824 ?auto_388829 ) ) ( not ( = ?auto_388824 ?auto_388830 ) ) ( not ( = ?auto_388824 ?auto_388831 ) ) ( not ( = ?auto_388824 ?auto_388832 ) ) ( not ( = ?auto_388825 ?auto_388826 ) ) ( not ( = ?auto_388825 ?auto_388827 ) ) ( not ( = ?auto_388825 ?auto_388828 ) ) ( not ( = ?auto_388825 ?auto_388829 ) ) ( not ( = ?auto_388825 ?auto_388830 ) ) ( not ( = ?auto_388825 ?auto_388831 ) ) ( not ( = ?auto_388825 ?auto_388832 ) ) ( not ( = ?auto_388826 ?auto_388827 ) ) ( not ( = ?auto_388826 ?auto_388828 ) ) ( not ( = ?auto_388826 ?auto_388829 ) ) ( not ( = ?auto_388826 ?auto_388830 ) ) ( not ( = ?auto_388826 ?auto_388831 ) ) ( not ( = ?auto_388826 ?auto_388832 ) ) ( not ( = ?auto_388827 ?auto_388828 ) ) ( not ( = ?auto_388827 ?auto_388829 ) ) ( not ( = ?auto_388827 ?auto_388830 ) ) ( not ( = ?auto_388827 ?auto_388831 ) ) ( not ( = ?auto_388827 ?auto_388832 ) ) ( not ( = ?auto_388828 ?auto_388829 ) ) ( not ( = ?auto_388828 ?auto_388830 ) ) ( not ( = ?auto_388828 ?auto_388831 ) ) ( not ( = ?auto_388828 ?auto_388832 ) ) ( not ( = ?auto_388829 ?auto_388830 ) ) ( not ( = ?auto_388829 ?auto_388831 ) ) ( not ( = ?auto_388829 ?auto_388832 ) ) ( not ( = ?auto_388830 ?auto_388831 ) ) ( not ( = ?auto_388830 ?auto_388832 ) ) ( not ( = ?auto_388831 ?auto_388832 ) ) ( ON ?auto_388830 ?auto_388831 ) ( ON ?auto_388829 ?auto_388830 ) ( ON ?auto_388828 ?auto_388829 ) ( ON ?auto_388827 ?auto_388828 ) ( ON ?auto_388826 ?auto_388827 ) ( ON ?auto_388825 ?auto_388826 ) ( ON ?auto_388824 ?auto_388825 ) ( ON ?auto_388823 ?auto_388824 ) ( ON ?auto_388822 ?auto_388823 ) ( ON ?auto_388821 ?auto_388822 ) ( CLEAR ?auto_388821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_388821 )
      ( MAKE-11PILE ?auto_388821 ?auto_388822 ?auto_388823 ?auto_388824 ?auto_388825 ?auto_388826 ?auto_388827 ?auto_388828 ?auto_388829 ?auto_388830 ?auto_388831 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_388868 - BLOCK
      ?auto_388869 - BLOCK
      ?auto_388870 - BLOCK
      ?auto_388871 - BLOCK
      ?auto_388872 - BLOCK
      ?auto_388873 - BLOCK
      ?auto_388874 - BLOCK
      ?auto_388875 - BLOCK
      ?auto_388876 - BLOCK
      ?auto_388877 - BLOCK
      ?auto_388878 - BLOCK
      ?auto_388879 - BLOCK
    )
    :vars
    (
      ?auto_388880 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_388878 ) ( ON ?auto_388879 ?auto_388880 ) ( CLEAR ?auto_388879 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_388868 ) ( ON ?auto_388869 ?auto_388868 ) ( ON ?auto_388870 ?auto_388869 ) ( ON ?auto_388871 ?auto_388870 ) ( ON ?auto_388872 ?auto_388871 ) ( ON ?auto_388873 ?auto_388872 ) ( ON ?auto_388874 ?auto_388873 ) ( ON ?auto_388875 ?auto_388874 ) ( ON ?auto_388876 ?auto_388875 ) ( ON ?auto_388877 ?auto_388876 ) ( ON ?auto_388878 ?auto_388877 ) ( not ( = ?auto_388868 ?auto_388869 ) ) ( not ( = ?auto_388868 ?auto_388870 ) ) ( not ( = ?auto_388868 ?auto_388871 ) ) ( not ( = ?auto_388868 ?auto_388872 ) ) ( not ( = ?auto_388868 ?auto_388873 ) ) ( not ( = ?auto_388868 ?auto_388874 ) ) ( not ( = ?auto_388868 ?auto_388875 ) ) ( not ( = ?auto_388868 ?auto_388876 ) ) ( not ( = ?auto_388868 ?auto_388877 ) ) ( not ( = ?auto_388868 ?auto_388878 ) ) ( not ( = ?auto_388868 ?auto_388879 ) ) ( not ( = ?auto_388868 ?auto_388880 ) ) ( not ( = ?auto_388869 ?auto_388870 ) ) ( not ( = ?auto_388869 ?auto_388871 ) ) ( not ( = ?auto_388869 ?auto_388872 ) ) ( not ( = ?auto_388869 ?auto_388873 ) ) ( not ( = ?auto_388869 ?auto_388874 ) ) ( not ( = ?auto_388869 ?auto_388875 ) ) ( not ( = ?auto_388869 ?auto_388876 ) ) ( not ( = ?auto_388869 ?auto_388877 ) ) ( not ( = ?auto_388869 ?auto_388878 ) ) ( not ( = ?auto_388869 ?auto_388879 ) ) ( not ( = ?auto_388869 ?auto_388880 ) ) ( not ( = ?auto_388870 ?auto_388871 ) ) ( not ( = ?auto_388870 ?auto_388872 ) ) ( not ( = ?auto_388870 ?auto_388873 ) ) ( not ( = ?auto_388870 ?auto_388874 ) ) ( not ( = ?auto_388870 ?auto_388875 ) ) ( not ( = ?auto_388870 ?auto_388876 ) ) ( not ( = ?auto_388870 ?auto_388877 ) ) ( not ( = ?auto_388870 ?auto_388878 ) ) ( not ( = ?auto_388870 ?auto_388879 ) ) ( not ( = ?auto_388870 ?auto_388880 ) ) ( not ( = ?auto_388871 ?auto_388872 ) ) ( not ( = ?auto_388871 ?auto_388873 ) ) ( not ( = ?auto_388871 ?auto_388874 ) ) ( not ( = ?auto_388871 ?auto_388875 ) ) ( not ( = ?auto_388871 ?auto_388876 ) ) ( not ( = ?auto_388871 ?auto_388877 ) ) ( not ( = ?auto_388871 ?auto_388878 ) ) ( not ( = ?auto_388871 ?auto_388879 ) ) ( not ( = ?auto_388871 ?auto_388880 ) ) ( not ( = ?auto_388872 ?auto_388873 ) ) ( not ( = ?auto_388872 ?auto_388874 ) ) ( not ( = ?auto_388872 ?auto_388875 ) ) ( not ( = ?auto_388872 ?auto_388876 ) ) ( not ( = ?auto_388872 ?auto_388877 ) ) ( not ( = ?auto_388872 ?auto_388878 ) ) ( not ( = ?auto_388872 ?auto_388879 ) ) ( not ( = ?auto_388872 ?auto_388880 ) ) ( not ( = ?auto_388873 ?auto_388874 ) ) ( not ( = ?auto_388873 ?auto_388875 ) ) ( not ( = ?auto_388873 ?auto_388876 ) ) ( not ( = ?auto_388873 ?auto_388877 ) ) ( not ( = ?auto_388873 ?auto_388878 ) ) ( not ( = ?auto_388873 ?auto_388879 ) ) ( not ( = ?auto_388873 ?auto_388880 ) ) ( not ( = ?auto_388874 ?auto_388875 ) ) ( not ( = ?auto_388874 ?auto_388876 ) ) ( not ( = ?auto_388874 ?auto_388877 ) ) ( not ( = ?auto_388874 ?auto_388878 ) ) ( not ( = ?auto_388874 ?auto_388879 ) ) ( not ( = ?auto_388874 ?auto_388880 ) ) ( not ( = ?auto_388875 ?auto_388876 ) ) ( not ( = ?auto_388875 ?auto_388877 ) ) ( not ( = ?auto_388875 ?auto_388878 ) ) ( not ( = ?auto_388875 ?auto_388879 ) ) ( not ( = ?auto_388875 ?auto_388880 ) ) ( not ( = ?auto_388876 ?auto_388877 ) ) ( not ( = ?auto_388876 ?auto_388878 ) ) ( not ( = ?auto_388876 ?auto_388879 ) ) ( not ( = ?auto_388876 ?auto_388880 ) ) ( not ( = ?auto_388877 ?auto_388878 ) ) ( not ( = ?auto_388877 ?auto_388879 ) ) ( not ( = ?auto_388877 ?auto_388880 ) ) ( not ( = ?auto_388878 ?auto_388879 ) ) ( not ( = ?auto_388878 ?auto_388880 ) ) ( not ( = ?auto_388879 ?auto_388880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_388879 ?auto_388880 )
      ( !STACK ?auto_388879 ?auto_388878 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_388918 - BLOCK
      ?auto_388919 - BLOCK
      ?auto_388920 - BLOCK
      ?auto_388921 - BLOCK
      ?auto_388922 - BLOCK
      ?auto_388923 - BLOCK
      ?auto_388924 - BLOCK
      ?auto_388925 - BLOCK
      ?auto_388926 - BLOCK
      ?auto_388927 - BLOCK
      ?auto_388928 - BLOCK
      ?auto_388929 - BLOCK
    )
    :vars
    (
      ?auto_388930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388929 ?auto_388930 ) ( ON-TABLE ?auto_388918 ) ( ON ?auto_388919 ?auto_388918 ) ( ON ?auto_388920 ?auto_388919 ) ( ON ?auto_388921 ?auto_388920 ) ( ON ?auto_388922 ?auto_388921 ) ( ON ?auto_388923 ?auto_388922 ) ( ON ?auto_388924 ?auto_388923 ) ( ON ?auto_388925 ?auto_388924 ) ( ON ?auto_388926 ?auto_388925 ) ( ON ?auto_388927 ?auto_388926 ) ( not ( = ?auto_388918 ?auto_388919 ) ) ( not ( = ?auto_388918 ?auto_388920 ) ) ( not ( = ?auto_388918 ?auto_388921 ) ) ( not ( = ?auto_388918 ?auto_388922 ) ) ( not ( = ?auto_388918 ?auto_388923 ) ) ( not ( = ?auto_388918 ?auto_388924 ) ) ( not ( = ?auto_388918 ?auto_388925 ) ) ( not ( = ?auto_388918 ?auto_388926 ) ) ( not ( = ?auto_388918 ?auto_388927 ) ) ( not ( = ?auto_388918 ?auto_388928 ) ) ( not ( = ?auto_388918 ?auto_388929 ) ) ( not ( = ?auto_388918 ?auto_388930 ) ) ( not ( = ?auto_388919 ?auto_388920 ) ) ( not ( = ?auto_388919 ?auto_388921 ) ) ( not ( = ?auto_388919 ?auto_388922 ) ) ( not ( = ?auto_388919 ?auto_388923 ) ) ( not ( = ?auto_388919 ?auto_388924 ) ) ( not ( = ?auto_388919 ?auto_388925 ) ) ( not ( = ?auto_388919 ?auto_388926 ) ) ( not ( = ?auto_388919 ?auto_388927 ) ) ( not ( = ?auto_388919 ?auto_388928 ) ) ( not ( = ?auto_388919 ?auto_388929 ) ) ( not ( = ?auto_388919 ?auto_388930 ) ) ( not ( = ?auto_388920 ?auto_388921 ) ) ( not ( = ?auto_388920 ?auto_388922 ) ) ( not ( = ?auto_388920 ?auto_388923 ) ) ( not ( = ?auto_388920 ?auto_388924 ) ) ( not ( = ?auto_388920 ?auto_388925 ) ) ( not ( = ?auto_388920 ?auto_388926 ) ) ( not ( = ?auto_388920 ?auto_388927 ) ) ( not ( = ?auto_388920 ?auto_388928 ) ) ( not ( = ?auto_388920 ?auto_388929 ) ) ( not ( = ?auto_388920 ?auto_388930 ) ) ( not ( = ?auto_388921 ?auto_388922 ) ) ( not ( = ?auto_388921 ?auto_388923 ) ) ( not ( = ?auto_388921 ?auto_388924 ) ) ( not ( = ?auto_388921 ?auto_388925 ) ) ( not ( = ?auto_388921 ?auto_388926 ) ) ( not ( = ?auto_388921 ?auto_388927 ) ) ( not ( = ?auto_388921 ?auto_388928 ) ) ( not ( = ?auto_388921 ?auto_388929 ) ) ( not ( = ?auto_388921 ?auto_388930 ) ) ( not ( = ?auto_388922 ?auto_388923 ) ) ( not ( = ?auto_388922 ?auto_388924 ) ) ( not ( = ?auto_388922 ?auto_388925 ) ) ( not ( = ?auto_388922 ?auto_388926 ) ) ( not ( = ?auto_388922 ?auto_388927 ) ) ( not ( = ?auto_388922 ?auto_388928 ) ) ( not ( = ?auto_388922 ?auto_388929 ) ) ( not ( = ?auto_388922 ?auto_388930 ) ) ( not ( = ?auto_388923 ?auto_388924 ) ) ( not ( = ?auto_388923 ?auto_388925 ) ) ( not ( = ?auto_388923 ?auto_388926 ) ) ( not ( = ?auto_388923 ?auto_388927 ) ) ( not ( = ?auto_388923 ?auto_388928 ) ) ( not ( = ?auto_388923 ?auto_388929 ) ) ( not ( = ?auto_388923 ?auto_388930 ) ) ( not ( = ?auto_388924 ?auto_388925 ) ) ( not ( = ?auto_388924 ?auto_388926 ) ) ( not ( = ?auto_388924 ?auto_388927 ) ) ( not ( = ?auto_388924 ?auto_388928 ) ) ( not ( = ?auto_388924 ?auto_388929 ) ) ( not ( = ?auto_388924 ?auto_388930 ) ) ( not ( = ?auto_388925 ?auto_388926 ) ) ( not ( = ?auto_388925 ?auto_388927 ) ) ( not ( = ?auto_388925 ?auto_388928 ) ) ( not ( = ?auto_388925 ?auto_388929 ) ) ( not ( = ?auto_388925 ?auto_388930 ) ) ( not ( = ?auto_388926 ?auto_388927 ) ) ( not ( = ?auto_388926 ?auto_388928 ) ) ( not ( = ?auto_388926 ?auto_388929 ) ) ( not ( = ?auto_388926 ?auto_388930 ) ) ( not ( = ?auto_388927 ?auto_388928 ) ) ( not ( = ?auto_388927 ?auto_388929 ) ) ( not ( = ?auto_388927 ?auto_388930 ) ) ( not ( = ?auto_388928 ?auto_388929 ) ) ( not ( = ?auto_388928 ?auto_388930 ) ) ( not ( = ?auto_388929 ?auto_388930 ) ) ( CLEAR ?auto_388927 ) ( ON ?auto_388928 ?auto_388929 ) ( CLEAR ?auto_388928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_388918 ?auto_388919 ?auto_388920 ?auto_388921 ?auto_388922 ?auto_388923 ?auto_388924 ?auto_388925 ?auto_388926 ?auto_388927 ?auto_388928 )
      ( MAKE-12PILE ?auto_388918 ?auto_388919 ?auto_388920 ?auto_388921 ?auto_388922 ?auto_388923 ?auto_388924 ?auto_388925 ?auto_388926 ?auto_388927 ?auto_388928 ?auto_388929 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_388968 - BLOCK
      ?auto_388969 - BLOCK
      ?auto_388970 - BLOCK
      ?auto_388971 - BLOCK
      ?auto_388972 - BLOCK
      ?auto_388973 - BLOCK
      ?auto_388974 - BLOCK
      ?auto_388975 - BLOCK
      ?auto_388976 - BLOCK
      ?auto_388977 - BLOCK
      ?auto_388978 - BLOCK
      ?auto_388979 - BLOCK
    )
    :vars
    (
      ?auto_388980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388979 ?auto_388980 ) ( ON-TABLE ?auto_388968 ) ( ON ?auto_388969 ?auto_388968 ) ( ON ?auto_388970 ?auto_388969 ) ( ON ?auto_388971 ?auto_388970 ) ( ON ?auto_388972 ?auto_388971 ) ( ON ?auto_388973 ?auto_388972 ) ( ON ?auto_388974 ?auto_388973 ) ( ON ?auto_388975 ?auto_388974 ) ( ON ?auto_388976 ?auto_388975 ) ( not ( = ?auto_388968 ?auto_388969 ) ) ( not ( = ?auto_388968 ?auto_388970 ) ) ( not ( = ?auto_388968 ?auto_388971 ) ) ( not ( = ?auto_388968 ?auto_388972 ) ) ( not ( = ?auto_388968 ?auto_388973 ) ) ( not ( = ?auto_388968 ?auto_388974 ) ) ( not ( = ?auto_388968 ?auto_388975 ) ) ( not ( = ?auto_388968 ?auto_388976 ) ) ( not ( = ?auto_388968 ?auto_388977 ) ) ( not ( = ?auto_388968 ?auto_388978 ) ) ( not ( = ?auto_388968 ?auto_388979 ) ) ( not ( = ?auto_388968 ?auto_388980 ) ) ( not ( = ?auto_388969 ?auto_388970 ) ) ( not ( = ?auto_388969 ?auto_388971 ) ) ( not ( = ?auto_388969 ?auto_388972 ) ) ( not ( = ?auto_388969 ?auto_388973 ) ) ( not ( = ?auto_388969 ?auto_388974 ) ) ( not ( = ?auto_388969 ?auto_388975 ) ) ( not ( = ?auto_388969 ?auto_388976 ) ) ( not ( = ?auto_388969 ?auto_388977 ) ) ( not ( = ?auto_388969 ?auto_388978 ) ) ( not ( = ?auto_388969 ?auto_388979 ) ) ( not ( = ?auto_388969 ?auto_388980 ) ) ( not ( = ?auto_388970 ?auto_388971 ) ) ( not ( = ?auto_388970 ?auto_388972 ) ) ( not ( = ?auto_388970 ?auto_388973 ) ) ( not ( = ?auto_388970 ?auto_388974 ) ) ( not ( = ?auto_388970 ?auto_388975 ) ) ( not ( = ?auto_388970 ?auto_388976 ) ) ( not ( = ?auto_388970 ?auto_388977 ) ) ( not ( = ?auto_388970 ?auto_388978 ) ) ( not ( = ?auto_388970 ?auto_388979 ) ) ( not ( = ?auto_388970 ?auto_388980 ) ) ( not ( = ?auto_388971 ?auto_388972 ) ) ( not ( = ?auto_388971 ?auto_388973 ) ) ( not ( = ?auto_388971 ?auto_388974 ) ) ( not ( = ?auto_388971 ?auto_388975 ) ) ( not ( = ?auto_388971 ?auto_388976 ) ) ( not ( = ?auto_388971 ?auto_388977 ) ) ( not ( = ?auto_388971 ?auto_388978 ) ) ( not ( = ?auto_388971 ?auto_388979 ) ) ( not ( = ?auto_388971 ?auto_388980 ) ) ( not ( = ?auto_388972 ?auto_388973 ) ) ( not ( = ?auto_388972 ?auto_388974 ) ) ( not ( = ?auto_388972 ?auto_388975 ) ) ( not ( = ?auto_388972 ?auto_388976 ) ) ( not ( = ?auto_388972 ?auto_388977 ) ) ( not ( = ?auto_388972 ?auto_388978 ) ) ( not ( = ?auto_388972 ?auto_388979 ) ) ( not ( = ?auto_388972 ?auto_388980 ) ) ( not ( = ?auto_388973 ?auto_388974 ) ) ( not ( = ?auto_388973 ?auto_388975 ) ) ( not ( = ?auto_388973 ?auto_388976 ) ) ( not ( = ?auto_388973 ?auto_388977 ) ) ( not ( = ?auto_388973 ?auto_388978 ) ) ( not ( = ?auto_388973 ?auto_388979 ) ) ( not ( = ?auto_388973 ?auto_388980 ) ) ( not ( = ?auto_388974 ?auto_388975 ) ) ( not ( = ?auto_388974 ?auto_388976 ) ) ( not ( = ?auto_388974 ?auto_388977 ) ) ( not ( = ?auto_388974 ?auto_388978 ) ) ( not ( = ?auto_388974 ?auto_388979 ) ) ( not ( = ?auto_388974 ?auto_388980 ) ) ( not ( = ?auto_388975 ?auto_388976 ) ) ( not ( = ?auto_388975 ?auto_388977 ) ) ( not ( = ?auto_388975 ?auto_388978 ) ) ( not ( = ?auto_388975 ?auto_388979 ) ) ( not ( = ?auto_388975 ?auto_388980 ) ) ( not ( = ?auto_388976 ?auto_388977 ) ) ( not ( = ?auto_388976 ?auto_388978 ) ) ( not ( = ?auto_388976 ?auto_388979 ) ) ( not ( = ?auto_388976 ?auto_388980 ) ) ( not ( = ?auto_388977 ?auto_388978 ) ) ( not ( = ?auto_388977 ?auto_388979 ) ) ( not ( = ?auto_388977 ?auto_388980 ) ) ( not ( = ?auto_388978 ?auto_388979 ) ) ( not ( = ?auto_388978 ?auto_388980 ) ) ( not ( = ?auto_388979 ?auto_388980 ) ) ( ON ?auto_388978 ?auto_388979 ) ( CLEAR ?auto_388976 ) ( ON ?auto_388977 ?auto_388978 ) ( CLEAR ?auto_388977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_388968 ?auto_388969 ?auto_388970 ?auto_388971 ?auto_388972 ?auto_388973 ?auto_388974 ?auto_388975 ?auto_388976 ?auto_388977 )
      ( MAKE-12PILE ?auto_388968 ?auto_388969 ?auto_388970 ?auto_388971 ?auto_388972 ?auto_388973 ?auto_388974 ?auto_388975 ?auto_388976 ?auto_388977 ?auto_388978 ?auto_388979 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389018 - BLOCK
      ?auto_389019 - BLOCK
      ?auto_389020 - BLOCK
      ?auto_389021 - BLOCK
      ?auto_389022 - BLOCK
      ?auto_389023 - BLOCK
      ?auto_389024 - BLOCK
      ?auto_389025 - BLOCK
      ?auto_389026 - BLOCK
      ?auto_389027 - BLOCK
      ?auto_389028 - BLOCK
      ?auto_389029 - BLOCK
    )
    :vars
    (
      ?auto_389030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389029 ?auto_389030 ) ( ON-TABLE ?auto_389018 ) ( ON ?auto_389019 ?auto_389018 ) ( ON ?auto_389020 ?auto_389019 ) ( ON ?auto_389021 ?auto_389020 ) ( ON ?auto_389022 ?auto_389021 ) ( ON ?auto_389023 ?auto_389022 ) ( ON ?auto_389024 ?auto_389023 ) ( ON ?auto_389025 ?auto_389024 ) ( not ( = ?auto_389018 ?auto_389019 ) ) ( not ( = ?auto_389018 ?auto_389020 ) ) ( not ( = ?auto_389018 ?auto_389021 ) ) ( not ( = ?auto_389018 ?auto_389022 ) ) ( not ( = ?auto_389018 ?auto_389023 ) ) ( not ( = ?auto_389018 ?auto_389024 ) ) ( not ( = ?auto_389018 ?auto_389025 ) ) ( not ( = ?auto_389018 ?auto_389026 ) ) ( not ( = ?auto_389018 ?auto_389027 ) ) ( not ( = ?auto_389018 ?auto_389028 ) ) ( not ( = ?auto_389018 ?auto_389029 ) ) ( not ( = ?auto_389018 ?auto_389030 ) ) ( not ( = ?auto_389019 ?auto_389020 ) ) ( not ( = ?auto_389019 ?auto_389021 ) ) ( not ( = ?auto_389019 ?auto_389022 ) ) ( not ( = ?auto_389019 ?auto_389023 ) ) ( not ( = ?auto_389019 ?auto_389024 ) ) ( not ( = ?auto_389019 ?auto_389025 ) ) ( not ( = ?auto_389019 ?auto_389026 ) ) ( not ( = ?auto_389019 ?auto_389027 ) ) ( not ( = ?auto_389019 ?auto_389028 ) ) ( not ( = ?auto_389019 ?auto_389029 ) ) ( not ( = ?auto_389019 ?auto_389030 ) ) ( not ( = ?auto_389020 ?auto_389021 ) ) ( not ( = ?auto_389020 ?auto_389022 ) ) ( not ( = ?auto_389020 ?auto_389023 ) ) ( not ( = ?auto_389020 ?auto_389024 ) ) ( not ( = ?auto_389020 ?auto_389025 ) ) ( not ( = ?auto_389020 ?auto_389026 ) ) ( not ( = ?auto_389020 ?auto_389027 ) ) ( not ( = ?auto_389020 ?auto_389028 ) ) ( not ( = ?auto_389020 ?auto_389029 ) ) ( not ( = ?auto_389020 ?auto_389030 ) ) ( not ( = ?auto_389021 ?auto_389022 ) ) ( not ( = ?auto_389021 ?auto_389023 ) ) ( not ( = ?auto_389021 ?auto_389024 ) ) ( not ( = ?auto_389021 ?auto_389025 ) ) ( not ( = ?auto_389021 ?auto_389026 ) ) ( not ( = ?auto_389021 ?auto_389027 ) ) ( not ( = ?auto_389021 ?auto_389028 ) ) ( not ( = ?auto_389021 ?auto_389029 ) ) ( not ( = ?auto_389021 ?auto_389030 ) ) ( not ( = ?auto_389022 ?auto_389023 ) ) ( not ( = ?auto_389022 ?auto_389024 ) ) ( not ( = ?auto_389022 ?auto_389025 ) ) ( not ( = ?auto_389022 ?auto_389026 ) ) ( not ( = ?auto_389022 ?auto_389027 ) ) ( not ( = ?auto_389022 ?auto_389028 ) ) ( not ( = ?auto_389022 ?auto_389029 ) ) ( not ( = ?auto_389022 ?auto_389030 ) ) ( not ( = ?auto_389023 ?auto_389024 ) ) ( not ( = ?auto_389023 ?auto_389025 ) ) ( not ( = ?auto_389023 ?auto_389026 ) ) ( not ( = ?auto_389023 ?auto_389027 ) ) ( not ( = ?auto_389023 ?auto_389028 ) ) ( not ( = ?auto_389023 ?auto_389029 ) ) ( not ( = ?auto_389023 ?auto_389030 ) ) ( not ( = ?auto_389024 ?auto_389025 ) ) ( not ( = ?auto_389024 ?auto_389026 ) ) ( not ( = ?auto_389024 ?auto_389027 ) ) ( not ( = ?auto_389024 ?auto_389028 ) ) ( not ( = ?auto_389024 ?auto_389029 ) ) ( not ( = ?auto_389024 ?auto_389030 ) ) ( not ( = ?auto_389025 ?auto_389026 ) ) ( not ( = ?auto_389025 ?auto_389027 ) ) ( not ( = ?auto_389025 ?auto_389028 ) ) ( not ( = ?auto_389025 ?auto_389029 ) ) ( not ( = ?auto_389025 ?auto_389030 ) ) ( not ( = ?auto_389026 ?auto_389027 ) ) ( not ( = ?auto_389026 ?auto_389028 ) ) ( not ( = ?auto_389026 ?auto_389029 ) ) ( not ( = ?auto_389026 ?auto_389030 ) ) ( not ( = ?auto_389027 ?auto_389028 ) ) ( not ( = ?auto_389027 ?auto_389029 ) ) ( not ( = ?auto_389027 ?auto_389030 ) ) ( not ( = ?auto_389028 ?auto_389029 ) ) ( not ( = ?auto_389028 ?auto_389030 ) ) ( not ( = ?auto_389029 ?auto_389030 ) ) ( ON ?auto_389028 ?auto_389029 ) ( ON ?auto_389027 ?auto_389028 ) ( CLEAR ?auto_389025 ) ( ON ?auto_389026 ?auto_389027 ) ( CLEAR ?auto_389026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_389018 ?auto_389019 ?auto_389020 ?auto_389021 ?auto_389022 ?auto_389023 ?auto_389024 ?auto_389025 ?auto_389026 )
      ( MAKE-12PILE ?auto_389018 ?auto_389019 ?auto_389020 ?auto_389021 ?auto_389022 ?auto_389023 ?auto_389024 ?auto_389025 ?auto_389026 ?auto_389027 ?auto_389028 ?auto_389029 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389068 - BLOCK
      ?auto_389069 - BLOCK
      ?auto_389070 - BLOCK
      ?auto_389071 - BLOCK
      ?auto_389072 - BLOCK
      ?auto_389073 - BLOCK
      ?auto_389074 - BLOCK
      ?auto_389075 - BLOCK
      ?auto_389076 - BLOCK
      ?auto_389077 - BLOCK
      ?auto_389078 - BLOCK
      ?auto_389079 - BLOCK
    )
    :vars
    (
      ?auto_389080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389079 ?auto_389080 ) ( ON-TABLE ?auto_389068 ) ( ON ?auto_389069 ?auto_389068 ) ( ON ?auto_389070 ?auto_389069 ) ( ON ?auto_389071 ?auto_389070 ) ( ON ?auto_389072 ?auto_389071 ) ( ON ?auto_389073 ?auto_389072 ) ( ON ?auto_389074 ?auto_389073 ) ( not ( = ?auto_389068 ?auto_389069 ) ) ( not ( = ?auto_389068 ?auto_389070 ) ) ( not ( = ?auto_389068 ?auto_389071 ) ) ( not ( = ?auto_389068 ?auto_389072 ) ) ( not ( = ?auto_389068 ?auto_389073 ) ) ( not ( = ?auto_389068 ?auto_389074 ) ) ( not ( = ?auto_389068 ?auto_389075 ) ) ( not ( = ?auto_389068 ?auto_389076 ) ) ( not ( = ?auto_389068 ?auto_389077 ) ) ( not ( = ?auto_389068 ?auto_389078 ) ) ( not ( = ?auto_389068 ?auto_389079 ) ) ( not ( = ?auto_389068 ?auto_389080 ) ) ( not ( = ?auto_389069 ?auto_389070 ) ) ( not ( = ?auto_389069 ?auto_389071 ) ) ( not ( = ?auto_389069 ?auto_389072 ) ) ( not ( = ?auto_389069 ?auto_389073 ) ) ( not ( = ?auto_389069 ?auto_389074 ) ) ( not ( = ?auto_389069 ?auto_389075 ) ) ( not ( = ?auto_389069 ?auto_389076 ) ) ( not ( = ?auto_389069 ?auto_389077 ) ) ( not ( = ?auto_389069 ?auto_389078 ) ) ( not ( = ?auto_389069 ?auto_389079 ) ) ( not ( = ?auto_389069 ?auto_389080 ) ) ( not ( = ?auto_389070 ?auto_389071 ) ) ( not ( = ?auto_389070 ?auto_389072 ) ) ( not ( = ?auto_389070 ?auto_389073 ) ) ( not ( = ?auto_389070 ?auto_389074 ) ) ( not ( = ?auto_389070 ?auto_389075 ) ) ( not ( = ?auto_389070 ?auto_389076 ) ) ( not ( = ?auto_389070 ?auto_389077 ) ) ( not ( = ?auto_389070 ?auto_389078 ) ) ( not ( = ?auto_389070 ?auto_389079 ) ) ( not ( = ?auto_389070 ?auto_389080 ) ) ( not ( = ?auto_389071 ?auto_389072 ) ) ( not ( = ?auto_389071 ?auto_389073 ) ) ( not ( = ?auto_389071 ?auto_389074 ) ) ( not ( = ?auto_389071 ?auto_389075 ) ) ( not ( = ?auto_389071 ?auto_389076 ) ) ( not ( = ?auto_389071 ?auto_389077 ) ) ( not ( = ?auto_389071 ?auto_389078 ) ) ( not ( = ?auto_389071 ?auto_389079 ) ) ( not ( = ?auto_389071 ?auto_389080 ) ) ( not ( = ?auto_389072 ?auto_389073 ) ) ( not ( = ?auto_389072 ?auto_389074 ) ) ( not ( = ?auto_389072 ?auto_389075 ) ) ( not ( = ?auto_389072 ?auto_389076 ) ) ( not ( = ?auto_389072 ?auto_389077 ) ) ( not ( = ?auto_389072 ?auto_389078 ) ) ( not ( = ?auto_389072 ?auto_389079 ) ) ( not ( = ?auto_389072 ?auto_389080 ) ) ( not ( = ?auto_389073 ?auto_389074 ) ) ( not ( = ?auto_389073 ?auto_389075 ) ) ( not ( = ?auto_389073 ?auto_389076 ) ) ( not ( = ?auto_389073 ?auto_389077 ) ) ( not ( = ?auto_389073 ?auto_389078 ) ) ( not ( = ?auto_389073 ?auto_389079 ) ) ( not ( = ?auto_389073 ?auto_389080 ) ) ( not ( = ?auto_389074 ?auto_389075 ) ) ( not ( = ?auto_389074 ?auto_389076 ) ) ( not ( = ?auto_389074 ?auto_389077 ) ) ( not ( = ?auto_389074 ?auto_389078 ) ) ( not ( = ?auto_389074 ?auto_389079 ) ) ( not ( = ?auto_389074 ?auto_389080 ) ) ( not ( = ?auto_389075 ?auto_389076 ) ) ( not ( = ?auto_389075 ?auto_389077 ) ) ( not ( = ?auto_389075 ?auto_389078 ) ) ( not ( = ?auto_389075 ?auto_389079 ) ) ( not ( = ?auto_389075 ?auto_389080 ) ) ( not ( = ?auto_389076 ?auto_389077 ) ) ( not ( = ?auto_389076 ?auto_389078 ) ) ( not ( = ?auto_389076 ?auto_389079 ) ) ( not ( = ?auto_389076 ?auto_389080 ) ) ( not ( = ?auto_389077 ?auto_389078 ) ) ( not ( = ?auto_389077 ?auto_389079 ) ) ( not ( = ?auto_389077 ?auto_389080 ) ) ( not ( = ?auto_389078 ?auto_389079 ) ) ( not ( = ?auto_389078 ?auto_389080 ) ) ( not ( = ?auto_389079 ?auto_389080 ) ) ( ON ?auto_389078 ?auto_389079 ) ( ON ?auto_389077 ?auto_389078 ) ( ON ?auto_389076 ?auto_389077 ) ( CLEAR ?auto_389074 ) ( ON ?auto_389075 ?auto_389076 ) ( CLEAR ?auto_389075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_389068 ?auto_389069 ?auto_389070 ?auto_389071 ?auto_389072 ?auto_389073 ?auto_389074 ?auto_389075 )
      ( MAKE-12PILE ?auto_389068 ?auto_389069 ?auto_389070 ?auto_389071 ?auto_389072 ?auto_389073 ?auto_389074 ?auto_389075 ?auto_389076 ?auto_389077 ?auto_389078 ?auto_389079 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389118 - BLOCK
      ?auto_389119 - BLOCK
      ?auto_389120 - BLOCK
      ?auto_389121 - BLOCK
      ?auto_389122 - BLOCK
      ?auto_389123 - BLOCK
      ?auto_389124 - BLOCK
      ?auto_389125 - BLOCK
      ?auto_389126 - BLOCK
      ?auto_389127 - BLOCK
      ?auto_389128 - BLOCK
      ?auto_389129 - BLOCK
    )
    :vars
    (
      ?auto_389130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389129 ?auto_389130 ) ( ON-TABLE ?auto_389118 ) ( ON ?auto_389119 ?auto_389118 ) ( ON ?auto_389120 ?auto_389119 ) ( ON ?auto_389121 ?auto_389120 ) ( ON ?auto_389122 ?auto_389121 ) ( ON ?auto_389123 ?auto_389122 ) ( not ( = ?auto_389118 ?auto_389119 ) ) ( not ( = ?auto_389118 ?auto_389120 ) ) ( not ( = ?auto_389118 ?auto_389121 ) ) ( not ( = ?auto_389118 ?auto_389122 ) ) ( not ( = ?auto_389118 ?auto_389123 ) ) ( not ( = ?auto_389118 ?auto_389124 ) ) ( not ( = ?auto_389118 ?auto_389125 ) ) ( not ( = ?auto_389118 ?auto_389126 ) ) ( not ( = ?auto_389118 ?auto_389127 ) ) ( not ( = ?auto_389118 ?auto_389128 ) ) ( not ( = ?auto_389118 ?auto_389129 ) ) ( not ( = ?auto_389118 ?auto_389130 ) ) ( not ( = ?auto_389119 ?auto_389120 ) ) ( not ( = ?auto_389119 ?auto_389121 ) ) ( not ( = ?auto_389119 ?auto_389122 ) ) ( not ( = ?auto_389119 ?auto_389123 ) ) ( not ( = ?auto_389119 ?auto_389124 ) ) ( not ( = ?auto_389119 ?auto_389125 ) ) ( not ( = ?auto_389119 ?auto_389126 ) ) ( not ( = ?auto_389119 ?auto_389127 ) ) ( not ( = ?auto_389119 ?auto_389128 ) ) ( not ( = ?auto_389119 ?auto_389129 ) ) ( not ( = ?auto_389119 ?auto_389130 ) ) ( not ( = ?auto_389120 ?auto_389121 ) ) ( not ( = ?auto_389120 ?auto_389122 ) ) ( not ( = ?auto_389120 ?auto_389123 ) ) ( not ( = ?auto_389120 ?auto_389124 ) ) ( not ( = ?auto_389120 ?auto_389125 ) ) ( not ( = ?auto_389120 ?auto_389126 ) ) ( not ( = ?auto_389120 ?auto_389127 ) ) ( not ( = ?auto_389120 ?auto_389128 ) ) ( not ( = ?auto_389120 ?auto_389129 ) ) ( not ( = ?auto_389120 ?auto_389130 ) ) ( not ( = ?auto_389121 ?auto_389122 ) ) ( not ( = ?auto_389121 ?auto_389123 ) ) ( not ( = ?auto_389121 ?auto_389124 ) ) ( not ( = ?auto_389121 ?auto_389125 ) ) ( not ( = ?auto_389121 ?auto_389126 ) ) ( not ( = ?auto_389121 ?auto_389127 ) ) ( not ( = ?auto_389121 ?auto_389128 ) ) ( not ( = ?auto_389121 ?auto_389129 ) ) ( not ( = ?auto_389121 ?auto_389130 ) ) ( not ( = ?auto_389122 ?auto_389123 ) ) ( not ( = ?auto_389122 ?auto_389124 ) ) ( not ( = ?auto_389122 ?auto_389125 ) ) ( not ( = ?auto_389122 ?auto_389126 ) ) ( not ( = ?auto_389122 ?auto_389127 ) ) ( not ( = ?auto_389122 ?auto_389128 ) ) ( not ( = ?auto_389122 ?auto_389129 ) ) ( not ( = ?auto_389122 ?auto_389130 ) ) ( not ( = ?auto_389123 ?auto_389124 ) ) ( not ( = ?auto_389123 ?auto_389125 ) ) ( not ( = ?auto_389123 ?auto_389126 ) ) ( not ( = ?auto_389123 ?auto_389127 ) ) ( not ( = ?auto_389123 ?auto_389128 ) ) ( not ( = ?auto_389123 ?auto_389129 ) ) ( not ( = ?auto_389123 ?auto_389130 ) ) ( not ( = ?auto_389124 ?auto_389125 ) ) ( not ( = ?auto_389124 ?auto_389126 ) ) ( not ( = ?auto_389124 ?auto_389127 ) ) ( not ( = ?auto_389124 ?auto_389128 ) ) ( not ( = ?auto_389124 ?auto_389129 ) ) ( not ( = ?auto_389124 ?auto_389130 ) ) ( not ( = ?auto_389125 ?auto_389126 ) ) ( not ( = ?auto_389125 ?auto_389127 ) ) ( not ( = ?auto_389125 ?auto_389128 ) ) ( not ( = ?auto_389125 ?auto_389129 ) ) ( not ( = ?auto_389125 ?auto_389130 ) ) ( not ( = ?auto_389126 ?auto_389127 ) ) ( not ( = ?auto_389126 ?auto_389128 ) ) ( not ( = ?auto_389126 ?auto_389129 ) ) ( not ( = ?auto_389126 ?auto_389130 ) ) ( not ( = ?auto_389127 ?auto_389128 ) ) ( not ( = ?auto_389127 ?auto_389129 ) ) ( not ( = ?auto_389127 ?auto_389130 ) ) ( not ( = ?auto_389128 ?auto_389129 ) ) ( not ( = ?auto_389128 ?auto_389130 ) ) ( not ( = ?auto_389129 ?auto_389130 ) ) ( ON ?auto_389128 ?auto_389129 ) ( ON ?auto_389127 ?auto_389128 ) ( ON ?auto_389126 ?auto_389127 ) ( ON ?auto_389125 ?auto_389126 ) ( CLEAR ?auto_389123 ) ( ON ?auto_389124 ?auto_389125 ) ( CLEAR ?auto_389124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_389118 ?auto_389119 ?auto_389120 ?auto_389121 ?auto_389122 ?auto_389123 ?auto_389124 )
      ( MAKE-12PILE ?auto_389118 ?auto_389119 ?auto_389120 ?auto_389121 ?auto_389122 ?auto_389123 ?auto_389124 ?auto_389125 ?auto_389126 ?auto_389127 ?auto_389128 ?auto_389129 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389168 - BLOCK
      ?auto_389169 - BLOCK
      ?auto_389170 - BLOCK
      ?auto_389171 - BLOCK
      ?auto_389172 - BLOCK
      ?auto_389173 - BLOCK
      ?auto_389174 - BLOCK
      ?auto_389175 - BLOCK
      ?auto_389176 - BLOCK
      ?auto_389177 - BLOCK
      ?auto_389178 - BLOCK
      ?auto_389179 - BLOCK
    )
    :vars
    (
      ?auto_389180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389179 ?auto_389180 ) ( ON-TABLE ?auto_389168 ) ( ON ?auto_389169 ?auto_389168 ) ( ON ?auto_389170 ?auto_389169 ) ( ON ?auto_389171 ?auto_389170 ) ( ON ?auto_389172 ?auto_389171 ) ( not ( = ?auto_389168 ?auto_389169 ) ) ( not ( = ?auto_389168 ?auto_389170 ) ) ( not ( = ?auto_389168 ?auto_389171 ) ) ( not ( = ?auto_389168 ?auto_389172 ) ) ( not ( = ?auto_389168 ?auto_389173 ) ) ( not ( = ?auto_389168 ?auto_389174 ) ) ( not ( = ?auto_389168 ?auto_389175 ) ) ( not ( = ?auto_389168 ?auto_389176 ) ) ( not ( = ?auto_389168 ?auto_389177 ) ) ( not ( = ?auto_389168 ?auto_389178 ) ) ( not ( = ?auto_389168 ?auto_389179 ) ) ( not ( = ?auto_389168 ?auto_389180 ) ) ( not ( = ?auto_389169 ?auto_389170 ) ) ( not ( = ?auto_389169 ?auto_389171 ) ) ( not ( = ?auto_389169 ?auto_389172 ) ) ( not ( = ?auto_389169 ?auto_389173 ) ) ( not ( = ?auto_389169 ?auto_389174 ) ) ( not ( = ?auto_389169 ?auto_389175 ) ) ( not ( = ?auto_389169 ?auto_389176 ) ) ( not ( = ?auto_389169 ?auto_389177 ) ) ( not ( = ?auto_389169 ?auto_389178 ) ) ( not ( = ?auto_389169 ?auto_389179 ) ) ( not ( = ?auto_389169 ?auto_389180 ) ) ( not ( = ?auto_389170 ?auto_389171 ) ) ( not ( = ?auto_389170 ?auto_389172 ) ) ( not ( = ?auto_389170 ?auto_389173 ) ) ( not ( = ?auto_389170 ?auto_389174 ) ) ( not ( = ?auto_389170 ?auto_389175 ) ) ( not ( = ?auto_389170 ?auto_389176 ) ) ( not ( = ?auto_389170 ?auto_389177 ) ) ( not ( = ?auto_389170 ?auto_389178 ) ) ( not ( = ?auto_389170 ?auto_389179 ) ) ( not ( = ?auto_389170 ?auto_389180 ) ) ( not ( = ?auto_389171 ?auto_389172 ) ) ( not ( = ?auto_389171 ?auto_389173 ) ) ( not ( = ?auto_389171 ?auto_389174 ) ) ( not ( = ?auto_389171 ?auto_389175 ) ) ( not ( = ?auto_389171 ?auto_389176 ) ) ( not ( = ?auto_389171 ?auto_389177 ) ) ( not ( = ?auto_389171 ?auto_389178 ) ) ( not ( = ?auto_389171 ?auto_389179 ) ) ( not ( = ?auto_389171 ?auto_389180 ) ) ( not ( = ?auto_389172 ?auto_389173 ) ) ( not ( = ?auto_389172 ?auto_389174 ) ) ( not ( = ?auto_389172 ?auto_389175 ) ) ( not ( = ?auto_389172 ?auto_389176 ) ) ( not ( = ?auto_389172 ?auto_389177 ) ) ( not ( = ?auto_389172 ?auto_389178 ) ) ( not ( = ?auto_389172 ?auto_389179 ) ) ( not ( = ?auto_389172 ?auto_389180 ) ) ( not ( = ?auto_389173 ?auto_389174 ) ) ( not ( = ?auto_389173 ?auto_389175 ) ) ( not ( = ?auto_389173 ?auto_389176 ) ) ( not ( = ?auto_389173 ?auto_389177 ) ) ( not ( = ?auto_389173 ?auto_389178 ) ) ( not ( = ?auto_389173 ?auto_389179 ) ) ( not ( = ?auto_389173 ?auto_389180 ) ) ( not ( = ?auto_389174 ?auto_389175 ) ) ( not ( = ?auto_389174 ?auto_389176 ) ) ( not ( = ?auto_389174 ?auto_389177 ) ) ( not ( = ?auto_389174 ?auto_389178 ) ) ( not ( = ?auto_389174 ?auto_389179 ) ) ( not ( = ?auto_389174 ?auto_389180 ) ) ( not ( = ?auto_389175 ?auto_389176 ) ) ( not ( = ?auto_389175 ?auto_389177 ) ) ( not ( = ?auto_389175 ?auto_389178 ) ) ( not ( = ?auto_389175 ?auto_389179 ) ) ( not ( = ?auto_389175 ?auto_389180 ) ) ( not ( = ?auto_389176 ?auto_389177 ) ) ( not ( = ?auto_389176 ?auto_389178 ) ) ( not ( = ?auto_389176 ?auto_389179 ) ) ( not ( = ?auto_389176 ?auto_389180 ) ) ( not ( = ?auto_389177 ?auto_389178 ) ) ( not ( = ?auto_389177 ?auto_389179 ) ) ( not ( = ?auto_389177 ?auto_389180 ) ) ( not ( = ?auto_389178 ?auto_389179 ) ) ( not ( = ?auto_389178 ?auto_389180 ) ) ( not ( = ?auto_389179 ?auto_389180 ) ) ( ON ?auto_389178 ?auto_389179 ) ( ON ?auto_389177 ?auto_389178 ) ( ON ?auto_389176 ?auto_389177 ) ( ON ?auto_389175 ?auto_389176 ) ( ON ?auto_389174 ?auto_389175 ) ( CLEAR ?auto_389172 ) ( ON ?auto_389173 ?auto_389174 ) ( CLEAR ?auto_389173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_389168 ?auto_389169 ?auto_389170 ?auto_389171 ?auto_389172 ?auto_389173 )
      ( MAKE-12PILE ?auto_389168 ?auto_389169 ?auto_389170 ?auto_389171 ?auto_389172 ?auto_389173 ?auto_389174 ?auto_389175 ?auto_389176 ?auto_389177 ?auto_389178 ?auto_389179 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389218 - BLOCK
      ?auto_389219 - BLOCK
      ?auto_389220 - BLOCK
      ?auto_389221 - BLOCK
      ?auto_389222 - BLOCK
      ?auto_389223 - BLOCK
      ?auto_389224 - BLOCK
      ?auto_389225 - BLOCK
      ?auto_389226 - BLOCK
      ?auto_389227 - BLOCK
      ?auto_389228 - BLOCK
      ?auto_389229 - BLOCK
    )
    :vars
    (
      ?auto_389230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389229 ?auto_389230 ) ( ON-TABLE ?auto_389218 ) ( ON ?auto_389219 ?auto_389218 ) ( ON ?auto_389220 ?auto_389219 ) ( ON ?auto_389221 ?auto_389220 ) ( not ( = ?auto_389218 ?auto_389219 ) ) ( not ( = ?auto_389218 ?auto_389220 ) ) ( not ( = ?auto_389218 ?auto_389221 ) ) ( not ( = ?auto_389218 ?auto_389222 ) ) ( not ( = ?auto_389218 ?auto_389223 ) ) ( not ( = ?auto_389218 ?auto_389224 ) ) ( not ( = ?auto_389218 ?auto_389225 ) ) ( not ( = ?auto_389218 ?auto_389226 ) ) ( not ( = ?auto_389218 ?auto_389227 ) ) ( not ( = ?auto_389218 ?auto_389228 ) ) ( not ( = ?auto_389218 ?auto_389229 ) ) ( not ( = ?auto_389218 ?auto_389230 ) ) ( not ( = ?auto_389219 ?auto_389220 ) ) ( not ( = ?auto_389219 ?auto_389221 ) ) ( not ( = ?auto_389219 ?auto_389222 ) ) ( not ( = ?auto_389219 ?auto_389223 ) ) ( not ( = ?auto_389219 ?auto_389224 ) ) ( not ( = ?auto_389219 ?auto_389225 ) ) ( not ( = ?auto_389219 ?auto_389226 ) ) ( not ( = ?auto_389219 ?auto_389227 ) ) ( not ( = ?auto_389219 ?auto_389228 ) ) ( not ( = ?auto_389219 ?auto_389229 ) ) ( not ( = ?auto_389219 ?auto_389230 ) ) ( not ( = ?auto_389220 ?auto_389221 ) ) ( not ( = ?auto_389220 ?auto_389222 ) ) ( not ( = ?auto_389220 ?auto_389223 ) ) ( not ( = ?auto_389220 ?auto_389224 ) ) ( not ( = ?auto_389220 ?auto_389225 ) ) ( not ( = ?auto_389220 ?auto_389226 ) ) ( not ( = ?auto_389220 ?auto_389227 ) ) ( not ( = ?auto_389220 ?auto_389228 ) ) ( not ( = ?auto_389220 ?auto_389229 ) ) ( not ( = ?auto_389220 ?auto_389230 ) ) ( not ( = ?auto_389221 ?auto_389222 ) ) ( not ( = ?auto_389221 ?auto_389223 ) ) ( not ( = ?auto_389221 ?auto_389224 ) ) ( not ( = ?auto_389221 ?auto_389225 ) ) ( not ( = ?auto_389221 ?auto_389226 ) ) ( not ( = ?auto_389221 ?auto_389227 ) ) ( not ( = ?auto_389221 ?auto_389228 ) ) ( not ( = ?auto_389221 ?auto_389229 ) ) ( not ( = ?auto_389221 ?auto_389230 ) ) ( not ( = ?auto_389222 ?auto_389223 ) ) ( not ( = ?auto_389222 ?auto_389224 ) ) ( not ( = ?auto_389222 ?auto_389225 ) ) ( not ( = ?auto_389222 ?auto_389226 ) ) ( not ( = ?auto_389222 ?auto_389227 ) ) ( not ( = ?auto_389222 ?auto_389228 ) ) ( not ( = ?auto_389222 ?auto_389229 ) ) ( not ( = ?auto_389222 ?auto_389230 ) ) ( not ( = ?auto_389223 ?auto_389224 ) ) ( not ( = ?auto_389223 ?auto_389225 ) ) ( not ( = ?auto_389223 ?auto_389226 ) ) ( not ( = ?auto_389223 ?auto_389227 ) ) ( not ( = ?auto_389223 ?auto_389228 ) ) ( not ( = ?auto_389223 ?auto_389229 ) ) ( not ( = ?auto_389223 ?auto_389230 ) ) ( not ( = ?auto_389224 ?auto_389225 ) ) ( not ( = ?auto_389224 ?auto_389226 ) ) ( not ( = ?auto_389224 ?auto_389227 ) ) ( not ( = ?auto_389224 ?auto_389228 ) ) ( not ( = ?auto_389224 ?auto_389229 ) ) ( not ( = ?auto_389224 ?auto_389230 ) ) ( not ( = ?auto_389225 ?auto_389226 ) ) ( not ( = ?auto_389225 ?auto_389227 ) ) ( not ( = ?auto_389225 ?auto_389228 ) ) ( not ( = ?auto_389225 ?auto_389229 ) ) ( not ( = ?auto_389225 ?auto_389230 ) ) ( not ( = ?auto_389226 ?auto_389227 ) ) ( not ( = ?auto_389226 ?auto_389228 ) ) ( not ( = ?auto_389226 ?auto_389229 ) ) ( not ( = ?auto_389226 ?auto_389230 ) ) ( not ( = ?auto_389227 ?auto_389228 ) ) ( not ( = ?auto_389227 ?auto_389229 ) ) ( not ( = ?auto_389227 ?auto_389230 ) ) ( not ( = ?auto_389228 ?auto_389229 ) ) ( not ( = ?auto_389228 ?auto_389230 ) ) ( not ( = ?auto_389229 ?auto_389230 ) ) ( ON ?auto_389228 ?auto_389229 ) ( ON ?auto_389227 ?auto_389228 ) ( ON ?auto_389226 ?auto_389227 ) ( ON ?auto_389225 ?auto_389226 ) ( ON ?auto_389224 ?auto_389225 ) ( ON ?auto_389223 ?auto_389224 ) ( CLEAR ?auto_389221 ) ( ON ?auto_389222 ?auto_389223 ) ( CLEAR ?auto_389222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_389218 ?auto_389219 ?auto_389220 ?auto_389221 ?auto_389222 )
      ( MAKE-12PILE ?auto_389218 ?auto_389219 ?auto_389220 ?auto_389221 ?auto_389222 ?auto_389223 ?auto_389224 ?auto_389225 ?auto_389226 ?auto_389227 ?auto_389228 ?auto_389229 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389268 - BLOCK
      ?auto_389269 - BLOCK
      ?auto_389270 - BLOCK
      ?auto_389271 - BLOCK
      ?auto_389272 - BLOCK
      ?auto_389273 - BLOCK
      ?auto_389274 - BLOCK
      ?auto_389275 - BLOCK
      ?auto_389276 - BLOCK
      ?auto_389277 - BLOCK
      ?auto_389278 - BLOCK
      ?auto_389279 - BLOCK
    )
    :vars
    (
      ?auto_389280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389279 ?auto_389280 ) ( ON-TABLE ?auto_389268 ) ( ON ?auto_389269 ?auto_389268 ) ( ON ?auto_389270 ?auto_389269 ) ( not ( = ?auto_389268 ?auto_389269 ) ) ( not ( = ?auto_389268 ?auto_389270 ) ) ( not ( = ?auto_389268 ?auto_389271 ) ) ( not ( = ?auto_389268 ?auto_389272 ) ) ( not ( = ?auto_389268 ?auto_389273 ) ) ( not ( = ?auto_389268 ?auto_389274 ) ) ( not ( = ?auto_389268 ?auto_389275 ) ) ( not ( = ?auto_389268 ?auto_389276 ) ) ( not ( = ?auto_389268 ?auto_389277 ) ) ( not ( = ?auto_389268 ?auto_389278 ) ) ( not ( = ?auto_389268 ?auto_389279 ) ) ( not ( = ?auto_389268 ?auto_389280 ) ) ( not ( = ?auto_389269 ?auto_389270 ) ) ( not ( = ?auto_389269 ?auto_389271 ) ) ( not ( = ?auto_389269 ?auto_389272 ) ) ( not ( = ?auto_389269 ?auto_389273 ) ) ( not ( = ?auto_389269 ?auto_389274 ) ) ( not ( = ?auto_389269 ?auto_389275 ) ) ( not ( = ?auto_389269 ?auto_389276 ) ) ( not ( = ?auto_389269 ?auto_389277 ) ) ( not ( = ?auto_389269 ?auto_389278 ) ) ( not ( = ?auto_389269 ?auto_389279 ) ) ( not ( = ?auto_389269 ?auto_389280 ) ) ( not ( = ?auto_389270 ?auto_389271 ) ) ( not ( = ?auto_389270 ?auto_389272 ) ) ( not ( = ?auto_389270 ?auto_389273 ) ) ( not ( = ?auto_389270 ?auto_389274 ) ) ( not ( = ?auto_389270 ?auto_389275 ) ) ( not ( = ?auto_389270 ?auto_389276 ) ) ( not ( = ?auto_389270 ?auto_389277 ) ) ( not ( = ?auto_389270 ?auto_389278 ) ) ( not ( = ?auto_389270 ?auto_389279 ) ) ( not ( = ?auto_389270 ?auto_389280 ) ) ( not ( = ?auto_389271 ?auto_389272 ) ) ( not ( = ?auto_389271 ?auto_389273 ) ) ( not ( = ?auto_389271 ?auto_389274 ) ) ( not ( = ?auto_389271 ?auto_389275 ) ) ( not ( = ?auto_389271 ?auto_389276 ) ) ( not ( = ?auto_389271 ?auto_389277 ) ) ( not ( = ?auto_389271 ?auto_389278 ) ) ( not ( = ?auto_389271 ?auto_389279 ) ) ( not ( = ?auto_389271 ?auto_389280 ) ) ( not ( = ?auto_389272 ?auto_389273 ) ) ( not ( = ?auto_389272 ?auto_389274 ) ) ( not ( = ?auto_389272 ?auto_389275 ) ) ( not ( = ?auto_389272 ?auto_389276 ) ) ( not ( = ?auto_389272 ?auto_389277 ) ) ( not ( = ?auto_389272 ?auto_389278 ) ) ( not ( = ?auto_389272 ?auto_389279 ) ) ( not ( = ?auto_389272 ?auto_389280 ) ) ( not ( = ?auto_389273 ?auto_389274 ) ) ( not ( = ?auto_389273 ?auto_389275 ) ) ( not ( = ?auto_389273 ?auto_389276 ) ) ( not ( = ?auto_389273 ?auto_389277 ) ) ( not ( = ?auto_389273 ?auto_389278 ) ) ( not ( = ?auto_389273 ?auto_389279 ) ) ( not ( = ?auto_389273 ?auto_389280 ) ) ( not ( = ?auto_389274 ?auto_389275 ) ) ( not ( = ?auto_389274 ?auto_389276 ) ) ( not ( = ?auto_389274 ?auto_389277 ) ) ( not ( = ?auto_389274 ?auto_389278 ) ) ( not ( = ?auto_389274 ?auto_389279 ) ) ( not ( = ?auto_389274 ?auto_389280 ) ) ( not ( = ?auto_389275 ?auto_389276 ) ) ( not ( = ?auto_389275 ?auto_389277 ) ) ( not ( = ?auto_389275 ?auto_389278 ) ) ( not ( = ?auto_389275 ?auto_389279 ) ) ( not ( = ?auto_389275 ?auto_389280 ) ) ( not ( = ?auto_389276 ?auto_389277 ) ) ( not ( = ?auto_389276 ?auto_389278 ) ) ( not ( = ?auto_389276 ?auto_389279 ) ) ( not ( = ?auto_389276 ?auto_389280 ) ) ( not ( = ?auto_389277 ?auto_389278 ) ) ( not ( = ?auto_389277 ?auto_389279 ) ) ( not ( = ?auto_389277 ?auto_389280 ) ) ( not ( = ?auto_389278 ?auto_389279 ) ) ( not ( = ?auto_389278 ?auto_389280 ) ) ( not ( = ?auto_389279 ?auto_389280 ) ) ( ON ?auto_389278 ?auto_389279 ) ( ON ?auto_389277 ?auto_389278 ) ( ON ?auto_389276 ?auto_389277 ) ( ON ?auto_389275 ?auto_389276 ) ( ON ?auto_389274 ?auto_389275 ) ( ON ?auto_389273 ?auto_389274 ) ( ON ?auto_389272 ?auto_389273 ) ( CLEAR ?auto_389270 ) ( ON ?auto_389271 ?auto_389272 ) ( CLEAR ?auto_389271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_389268 ?auto_389269 ?auto_389270 ?auto_389271 )
      ( MAKE-12PILE ?auto_389268 ?auto_389269 ?auto_389270 ?auto_389271 ?auto_389272 ?auto_389273 ?auto_389274 ?auto_389275 ?auto_389276 ?auto_389277 ?auto_389278 ?auto_389279 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389318 - BLOCK
      ?auto_389319 - BLOCK
      ?auto_389320 - BLOCK
      ?auto_389321 - BLOCK
      ?auto_389322 - BLOCK
      ?auto_389323 - BLOCK
      ?auto_389324 - BLOCK
      ?auto_389325 - BLOCK
      ?auto_389326 - BLOCK
      ?auto_389327 - BLOCK
      ?auto_389328 - BLOCK
      ?auto_389329 - BLOCK
    )
    :vars
    (
      ?auto_389330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389329 ?auto_389330 ) ( ON-TABLE ?auto_389318 ) ( ON ?auto_389319 ?auto_389318 ) ( not ( = ?auto_389318 ?auto_389319 ) ) ( not ( = ?auto_389318 ?auto_389320 ) ) ( not ( = ?auto_389318 ?auto_389321 ) ) ( not ( = ?auto_389318 ?auto_389322 ) ) ( not ( = ?auto_389318 ?auto_389323 ) ) ( not ( = ?auto_389318 ?auto_389324 ) ) ( not ( = ?auto_389318 ?auto_389325 ) ) ( not ( = ?auto_389318 ?auto_389326 ) ) ( not ( = ?auto_389318 ?auto_389327 ) ) ( not ( = ?auto_389318 ?auto_389328 ) ) ( not ( = ?auto_389318 ?auto_389329 ) ) ( not ( = ?auto_389318 ?auto_389330 ) ) ( not ( = ?auto_389319 ?auto_389320 ) ) ( not ( = ?auto_389319 ?auto_389321 ) ) ( not ( = ?auto_389319 ?auto_389322 ) ) ( not ( = ?auto_389319 ?auto_389323 ) ) ( not ( = ?auto_389319 ?auto_389324 ) ) ( not ( = ?auto_389319 ?auto_389325 ) ) ( not ( = ?auto_389319 ?auto_389326 ) ) ( not ( = ?auto_389319 ?auto_389327 ) ) ( not ( = ?auto_389319 ?auto_389328 ) ) ( not ( = ?auto_389319 ?auto_389329 ) ) ( not ( = ?auto_389319 ?auto_389330 ) ) ( not ( = ?auto_389320 ?auto_389321 ) ) ( not ( = ?auto_389320 ?auto_389322 ) ) ( not ( = ?auto_389320 ?auto_389323 ) ) ( not ( = ?auto_389320 ?auto_389324 ) ) ( not ( = ?auto_389320 ?auto_389325 ) ) ( not ( = ?auto_389320 ?auto_389326 ) ) ( not ( = ?auto_389320 ?auto_389327 ) ) ( not ( = ?auto_389320 ?auto_389328 ) ) ( not ( = ?auto_389320 ?auto_389329 ) ) ( not ( = ?auto_389320 ?auto_389330 ) ) ( not ( = ?auto_389321 ?auto_389322 ) ) ( not ( = ?auto_389321 ?auto_389323 ) ) ( not ( = ?auto_389321 ?auto_389324 ) ) ( not ( = ?auto_389321 ?auto_389325 ) ) ( not ( = ?auto_389321 ?auto_389326 ) ) ( not ( = ?auto_389321 ?auto_389327 ) ) ( not ( = ?auto_389321 ?auto_389328 ) ) ( not ( = ?auto_389321 ?auto_389329 ) ) ( not ( = ?auto_389321 ?auto_389330 ) ) ( not ( = ?auto_389322 ?auto_389323 ) ) ( not ( = ?auto_389322 ?auto_389324 ) ) ( not ( = ?auto_389322 ?auto_389325 ) ) ( not ( = ?auto_389322 ?auto_389326 ) ) ( not ( = ?auto_389322 ?auto_389327 ) ) ( not ( = ?auto_389322 ?auto_389328 ) ) ( not ( = ?auto_389322 ?auto_389329 ) ) ( not ( = ?auto_389322 ?auto_389330 ) ) ( not ( = ?auto_389323 ?auto_389324 ) ) ( not ( = ?auto_389323 ?auto_389325 ) ) ( not ( = ?auto_389323 ?auto_389326 ) ) ( not ( = ?auto_389323 ?auto_389327 ) ) ( not ( = ?auto_389323 ?auto_389328 ) ) ( not ( = ?auto_389323 ?auto_389329 ) ) ( not ( = ?auto_389323 ?auto_389330 ) ) ( not ( = ?auto_389324 ?auto_389325 ) ) ( not ( = ?auto_389324 ?auto_389326 ) ) ( not ( = ?auto_389324 ?auto_389327 ) ) ( not ( = ?auto_389324 ?auto_389328 ) ) ( not ( = ?auto_389324 ?auto_389329 ) ) ( not ( = ?auto_389324 ?auto_389330 ) ) ( not ( = ?auto_389325 ?auto_389326 ) ) ( not ( = ?auto_389325 ?auto_389327 ) ) ( not ( = ?auto_389325 ?auto_389328 ) ) ( not ( = ?auto_389325 ?auto_389329 ) ) ( not ( = ?auto_389325 ?auto_389330 ) ) ( not ( = ?auto_389326 ?auto_389327 ) ) ( not ( = ?auto_389326 ?auto_389328 ) ) ( not ( = ?auto_389326 ?auto_389329 ) ) ( not ( = ?auto_389326 ?auto_389330 ) ) ( not ( = ?auto_389327 ?auto_389328 ) ) ( not ( = ?auto_389327 ?auto_389329 ) ) ( not ( = ?auto_389327 ?auto_389330 ) ) ( not ( = ?auto_389328 ?auto_389329 ) ) ( not ( = ?auto_389328 ?auto_389330 ) ) ( not ( = ?auto_389329 ?auto_389330 ) ) ( ON ?auto_389328 ?auto_389329 ) ( ON ?auto_389327 ?auto_389328 ) ( ON ?auto_389326 ?auto_389327 ) ( ON ?auto_389325 ?auto_389326 ) ( ON ?auto_389324 ?auto_389325 ) ( ON ?auto_389323 ?auto_389324 ) ( ON ?auto_389322 ?auto_389323 ) ( ON ?auto_389321 ?auto_389322 ) ( CLEAR ?auto_389319 ) ( ON ?auto_389320 ?auto_389321 ) ( CLEAR ?auto_389320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_389318 ?auto_389319 ?auto_389320 )
      ( MAKE-12PILE ?auto_389318 ?auto_389319 ?auto_389320 ?auto_389321 ?auto_389322 ?auto_389323 ?auto_389324 ?auto_389325 ?auto_389326 ?auto_389327 ?auto_389328 ?auto_389329 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389368 - BLOCK
      ?auto_389369 - BLOCK
      ?auto_389370 - BLOCK
      ?auto_389371 - BLOCK
      ?auto_389372 - BLOCK
      ?auto_389373 - BLOCK
      ?auto_389374 - BLOCK
      ?auto_389375 - BLOCK
      ?auto_389376 - BLOCK
      ?auto_389377 - BLOCK
      ?auto_389378 - BLOCK
      ?auto_389379 - BLOCK
    )
    :vars
    (
      ?auto_389380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389379 ?auto_389380 ) ( ON-TABLE ?auto_389368 ) ( not ( = ?auto_389368 ?auto_389369 ) ) ( not ( = ?auto_389368 ?auto_389370 ) ) ( not ( = ?auto_389368 ?auto_389371 ) ) ( not ( = ?auto_389368 ?auto_389372 ) ) ( not ( = ?auto_389368 ?auto_389373 ) ) ( not ( = ?auto_389368 ?auto_389374 ) ) ( not ( = ?auto_389368 ?auto_389375 ) ) ( not ( = ?auto_389368 ?auto_389376 ) ) ( not ( = ?auto_389368 ?auto_389377 ) ) ( not ( = ?auto_389368 ?auto_389378 ) ) ( not ( = ?auto_389368 ?auto_389379 ) ) ( not ( = ?auto_389368 ?auto_389380 ) ) ( not ( = ?auto_389369 ?auto_389370 ) ) ( not ( = ?auto_389369 ?auto_389371 ) ) ( not ( = ?auto_389369 ?auto_389372 ) ) ( not ( = ?auto_389369 ?auto_389373 ) ) ( not ( = ?auto_389369 ?auto_389374 ) ) ( not ( = ?auto_389369 ?auto_389375 ) ) ( not ( = ?auto_389369 ?auto_389376 ) ) ( not ( = ?auto_389369 ?auto_389377 ) ) ( not ( = ?auto_389369 ?auto_389378 ) ) ( not ( = ?auto_389369 ?auto_389379 ) ) ( not ( = ?auto_389369 ?auto_389380 ) ) ( not ( = ?auto_389370 ?auto_389371 ) ) ( not ( = ?auto_389370 ?auto_389372 ) ) ( not ( = ?auto_389370 ?auto_389373 ) ) ( not ( = ?auto_389370 ?auto_389374 ) ) ( not ( = ?auto_389370 ?auto_389375 ) ) ( not ( = ?auto_389370 ?auto_389376 ) ) ( not ( = ?auto_389370 ?auto_389377 ) ) ( not ( = ?auto_389370 ?auto_389378 ) ) ( not ( = ?auto_389370 ?auto_389379 ) ) ( not ( = ?auto_389370 ?auto_389380 ) ) ( not ( = ?auto_389371 ?auto_389372 ) ) ( not ( = ?auto_389371 ?auto_389373 ) ) ( not ( = ?auto_389371 ?auto_389374 ) ) ( not ( = ?auto_389371 ?auto_389375 ) ) ( not ( = ?auto_389371 ?auto_389376 ) ) ( not ( = ?auto_389371 ?auto_389377 ) ) ( not ( = ?auto_389371 ?auto_389378 ) ) ( not ( = ?auto_389371 ?auto_389379 ) ) ( not ( = ?auto_389371 ?auto_389380 ) ) ( not ( = ?auto_389372 ?auto_389373 ) ) ( not ( = ?auto_389372 ?auto_389374 ) ) ( not ( = ?auto_389372 ?auto_389375 ) ) ( not ( = ?auto_389372 ?auto_389376 ) ) ( not ( = ?auto_389372 ?auto_389377 ) ) ( not ( = ?auto_389372 ?auto_389378 ) ) ( not ( = ?auto_389372 ?auto_389379 ) ) ( not ( = ?auto_389372 ?auto_389380 ) ) ( not ( = ?auto_389373 ?auto_389374 ) ) ( not ( = ?auto_389373 ?auto_389375 ) ) ( not ( = ?auto_389373 ?auto_389376 ) ) ( not ( = ?auto_389373 ?auto_389377 ) ) ( not ( = ?auto_389373 ?auto_389378 ) ) ( not ( = ?auto_389373 ?auto_389379 ) ) ( not ( = ?auto_389373 ?auto_389380 ) ) ( not ( = ?auto_389374 ?auto_389375 ) ) ( not ( = ?auto_389374 ?auto_389376 ) ) ( not ( = ?auto_389374 ?auto_389377 ) ) ( not ( = ?auto_389374 ?auto_389378 ) ) ( not ( = ?auto_389374 ?auto_389379 ) ) ( not ( = ?auto_389374 ?auto_389380 ) ) ( not ( = ?auto_389375 ?auto_389376 ) ) ( not ( = ?auto_389375 ?auto_389377 ) ) ( not ( = ?auto_389375 ?auto_389378 ) ) ( not ( = ?auto_389375 ?auto_389379 ) ) ( not ( = ?auto_389375 ?auto_389380 ) ) ( not ( = ?auto_389376 ?auto_389377 ) ) ( not ( = ?auto_389376 ?auto_389378 ) ) ( not ( = ?auto_389376 ?auto_389379 ) ) ( not ( = ?auto_389376 ?auto_389380 ) ) ( not ( = ?auto_389377 ?auto_389378 ) ) ( not ( = ?auto_389377 ?auto_389379 ) ) ( not ( = ?auto_389377 ?auto_389380 ) ) ( not ( = ?auto_389378 ?auto_389379 ) ) ( not ( = ?auto_389378 ?auto_389380 ) ) ( not ( = ?auto_389379 ?auto_389380 ) ) ( ON ?auto_389378 ?auto_389379 ) ( ON ?auto_389377 ?auto_389378 ) ( ON ?auto_389376 ?auto_389377 ) ( ON ?auto_389375 ?auto_389376 ) ( ON ?auto_389374 ?auto_389375 ) ( ON ?auto_389373 ?auto_389374 ) ( ON ?auto_389372 ?auto_389373 ) ( ON ?auto_389371 ?auto_389372 ) ( ON ?auto_389370 ?auto_389371 ) ( CLEAR ?auto_389368 ) ( ON ?auto_389369 ?auto_389370 ) ( CLEAR ?auto_389369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_389368 ?auto_389369 )
      ( MAKE-12PILE ?auto_389368 ?auto_389369 ?auto_389370 ?auto_389371 ?auto_389372 ?auto_389373 ?auto_389374 ?auto_389375 ?auto_389376 ?auto_389377 ?auto_389378 ?auto_389379 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389418 - BLOCK
      ?auto_389419 - BLOCK
      ?auto_389420 - BLOCK
      ?auto_389421 - BLOCK
      ?auto_389422 - BLOCK
      ?auto_389423 - BLOCK
      ?auto_389424 - BLOCK
      ?auto_389425 - BLOCK
      ?auto_389426 - BLOCK
      ?auto_389427 - BLOCK
      ?auto_389428 - BLOCK
      ?auto_389429 - BLOCK
    )
    :vars
    (
      ?auto_389430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389429 ?auto_389430 ) ( not ( = ?auto_389418 ?auto_389419 ) ) ( not ( = ?auto_389418 ?auto_389420 ) ) ( not ( = ?auto_389418 ?auto_389421 ) ) ( not ( = ?auto_389418 ?auto_389422 ) ) ( not ( = ?auto_389418 ?auto_389423 ) ) ( not ( = ?auto_389418 ?auto_389424 ) ) ( not ( = ?auto_389418 ?auto_389425 ) ) ( not ( = ?auto_389418 ?auto_389426 ) ) ( not ( = ?auto_389418 ?auto_389427 ) ) ( not ( = ?auto_389418 ?auto_389428 ) ) ( not ( = ?auto_389418 ?auto_389429 ) ) ( not ( = ?auto_389418 ?auto_389430 ) ) ( not ( = ?auto_389419 ?auto_389420 ) ) ( not ( = ?auto_389419 ?auto_389421 ) ) ( not ( = ?auto_389419 ?auto_389422 ) ) ( not ( = ?auto_389419 ?auto_389423 ) ) ( not ( = ?auto_389419 ?auto_389424 ) ) ( not ( = ?auto_389419 ?auto_389425 ) ) ( not ( = ?auto_389419 ?auto_389426 ) ) ( not ( = ?auto_389419 ?auto_389427 ) ) ( not ( = ?auto_389419 ?auto_389428 ) ) ( not ( = ?auto_389419 ?auto_389429 ) ) ( not ( = ?auto_389419 ?auto_389430 ) ) ( not ( = ?auto_389420 ?auto_389421 ) ) ( not ( = ?auto_389420 ?auto_389422 ) ) ( not ( = ?auto_389420 ?auto_389423 ) ) ( not ( = ?auto_389420 ?auto_389424 ) ) ( not ( = ?auto_389420 ?auto_389425 ) ) ( not ( = ?auto_389420 ?auto_389426 ) ) ( not ( = ?auto_389420 ?auto_389427 ) ) ( not ( = ?auto_389420 ?auto_389428 ) ) ( not ( = ?auto_389420 ?auto_389429 ) ) ( not ( = ?auto_389420 ?auto_389430 ) ) ( not ( = ?auto_389421 ?auto_389422 ) ) ( not ( = ?auto_389421 ?auto_389423 ) ) ( not ( = ?auto_389421 ?auto_389424 ) ) ( not ( = ?auto_389421 ?auto_389425 ) ) ( not ( = ?auto_389421 ?auto_389426 ) ) ( not ( = ?auto_389421 ?auto_389427 ) ) ( not ( = ?auto_389421 ?auto_389428 ) ) ( not ( = ?auto_389421 ?auto_389429 ) ) ( not ( = ?auto_389421 ?auto_389430 ) ) ( not ( = ?auto_389422 ?auto_389423 ) ) ( not ( = ?auto_389422 ?auto_389424 ) ) ( not ( = ?auto_389422 ?auto_389425 ) ) ( not ( = ?auto_389422 ?auto_389426 ) ) ( not ( = ?auto_389422 ?auto_389427 ) ) ( not ( = ?auto_389422 ?auto_389428 ) ) ( not ( = ?auto_389422 ?auto_389429 ) ) ( not ( = ?auto_389422 ?auto_389430 ) ) ( not ( = ?auto_389423 ?auto_389424 ) ) ( not ( = ?auto_389423 ?auto_389425 ) ) ( not ( = ?auto_389423 ?auto_389426 ) ) ( not ( = ?auto_389423 ?auto_389427 ) ) ( not ( = ?auto_389423 ?auto_389428 ) ) ( not ( = ?auto_389423 ?auto_389429 ) ) ( not ( = ?auto_389423 ?auto_389430 ) ) ( not ( = ?auto_389424 ?auto_389425 ) ) ( not ( = ?auto_389424 ?auto_389426 ) ) ( not ( = ?auto_389424 ?auto_389427 ) ) ( not ( = ?auto_389424 ?auto_389428 ) ) ( not ( = ?auto_389424 ?auto_389429 ) ) ( not ( = ?auto_389424 ?auto_389430 ) ) ( not ( = ?auto_389425 ?auto_389426 ) ) ( not ( = ?auto_389425 ?auto_389427 ) ) ( not ( = ?auto_389425 ?auto_389428 ) ) ( not ( = ?auto_389425 ?auto_389429 ) ) ( not ( = ?auto_389425 ?auto_389430 ) ) ( not ( = ?auto_389426 ?auto_389427 ) ) ( not ( = ?auto_389426 ?auto_389428 ) ) ( not ( = ?auto_389426 ?auto_389429 ) ) ( not ( = ?auto_389426 ?auto_389430 ) ) ( not ( = ?auto_389427 ?auto_389428 ) ) ( not ( = ?auto_389427 ?auto_389429 ) ) ( not ( = ?auto_389427 ?auto_389430 ) ) ( not ( = ?auto_389428 ?auto_389429 ) ) ( not ( = ?auto_389428 ?auto_389430 ) ) ( not ( = ?auto_389429 ?auto_389430 ) ) ( ON ?auto_389428 ?auto_389429 ) ( ON ?auto_389427 ?auto_389428 ) ( ON ?auto_389426 ?auto_389427 ) ( ON ?auto_389425 ?auto_389426 ) ( ON ?auto_389424 ?auto_389425 ) ( ON ?auto_389423 ?auto_389424 ) ( ON ?auto_389422 ?auto_389423 ) ( ON ?auto_389421 ?auto_389422 ) ( ON ?auto_389420 ?auto_389421 ) ( ON ?auto_389419 ?auto_389420 ) ( ON ?auto_389418 ?auto_389419 ) ( CLEAR ?auto_389418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_389418 )
      ( MAKE-12PILE ?auto_389418 ?auto_389419 ?auto_389420 ?auto_389421 ?auto_389422 ?auto_389423 ?auto_389424 ?auto_389425 ?auto_389426 ?auto_389427 ?auto_389428 ?auto_389429 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389469 - BLOCK
      ?auto_389470 - BLOCK
      ?auto_389471 - BLOCK
      ?auto_389472 - BLOCK
      ?auto_389473 - BLOCK
      ?auto_389474 - BLOCK
      ?auto_389475 - BLOCK
      ?auto_389476 - BLOCK
      ?auto_389477 - BLOCK
      ?auto_389478 - BLOCK
      ?auto_389479 - BLOCK
      ?auto_389480 - BLOCK
      ?auto_389481 - BLOCK
    )
    :vars
    (
      ?auto_389482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_389480 ) ( ON ?auto_389481 ?auto_389482 ) ( CLEAR ?auto_389481 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_389469 ) ( ON ?auto_389470 ?auto_389469 ) ( ON ?auto_389471 ?auto_389470 ) ( ON ?auto_389472 ?auto_389471 ) ( ON ?auto_389473 ?auto_389472 ) ( ON ?auto_389474 ?auto_389473 ) ( ON ?auto_389475 ?auto_389474 ) ( ON ?auto_389476 ?auto_389475 ) ( ON ?auto_389477 ?auto_389476 ) ( ON ?auto_389478 ?auto_389477 ) ( ON ?auto_389479 ?auto_389478 ) ( ON ?auto_389480 ?auto_389479 ) ( not ( = ?auto_389469 ?auto_389470 ) ) ( not ( = ?auto_389469 ?auto_389471 ) ) ( not ( = ?auto_389469 ?auto_389472 ) ) ( not ( = ?auto_389469 ?auto_389473 ) ) ( not ( = ?auto_389469 ?auto_389474 ) ) ( not ( = ?auto_389469 ?auto_389475 ) ) ( not ( = ?auto_389469 ?auto_389476 ) ) ( not ( = ?auto_389469 ?auto_389477 ) ) ( not ( = ?auto_389469 ?auto_389478 ) ) ( not ( = ?auto_389469 ?auto_389479 ) ) ( not ( = ?auto_389469 ?auto_389480 ) ) ( not ( = ?auto_389469 ?auto_389481 ) ) ( not ( = ?auto_389469 ?auto_389482 ) ) ( not ( = ?auto_389470 ?auto_389471 ) ) ( not ( = ?auto_389470 ?auto_389472 ) ) ( not ( = ?auto_389470 ?auto_389473 ) ) ( not ( = ?auto_389470 ?auto_389474 ) ) ( not ( = ?auto_389470 ?auto_389475 ) ) ( not ( = ?auto_389470 ?auto_389476 ) ) ( not ( = ?auto_389470 ?auto_389477 ) ) ( not ( = ?auto_389470 ?auto_389478 ) ) ( not ( = ?auto_389470 ?auto_389479 ) ) ( not ( = ?auto_389470 ?auto_389480 ) ) ( not ( = ?auto_389470 ?auto_389481 ) ) ( not ( = ?auto_389470 ?auto_389482 ) ) ( not ( = ?auto_389471 ?auto_389472 ) ) ( not ( = ?auto_389471 ?auto_389473 ) ) ( not ( = ?auto_389471 ?auto_389474 ) ) ( not ( = ?auto_389471 ?auto_389475 ) ) ( not ( = ?auto_389471 ?auto_389476 ) ) ( not ( = ?auto_389471 ?auto_389477 ) ) ( not ( = ?auto_389471 ?auto_389478 ) ) ( not ( = ?auto_389471 ?auto_389479 ) ) ( not ( = ?auto_389471 ?auto_389480 ) ) ( not ( = ?auto_389471 ?auto_389481 ) ) ( not ( = ?auto_389471 ?auto_389482 ) ) ( not ( = ?auto_389472 ?auto_389473 ) ) ( not ( = ?auto_389472 ?auto_389474 ) ) ( not ( = ?auto_389472 ?auto_389475 ) ) ( not ( = ?auto_389472 ?auto_389476 ) ) ( not ( = ?auto_389472 ?auto_389477 ) ) ( not ( = ?auto_389472 ?auto_389478 ) ) ( not ( = ?auto_389472 ?auto_389479 ) ) ( not ( = ?auto_389472 ?auto_389480 ) ) ( not ( = ?auto_389472 ?auto_389481 ) ) ( not ( = ?auto_389472 ?auto_389482 ) ) ( not ( = ?auto_389473 ?auto_389474 ) ) ( not ( = ?auto_389473 ?auto_389475 ) ) ( not ( = ?auto_389473 ?auto_389476 ) ) ( not ( = ?auto_389473 ?auto_389477 ) ) ( not ( = ?auto_389473 ?auto_389478 ) ) ( not ( = ?auto_389473 ?auto_389479 ) ) ( not ( = ?auto_389473 ?auto_389480 ) ) ( not ( = ?auto_389473 ?auto_389481 ) ) ( not ( = ?auto_389473 ?auto_389482 ) ) ( not ( = ?auto_389474 ?auto_389475 ) ) ( not ( = ?auto_389474 ?auto_389476 ) ) ( not ( = ?auto_389474 ?auto_389477 ) ) ( not ( = ?auto_389474 ?auto_389478 ) ) ( not ( = ?auto_389474 ?auto_389479 ) ) ( not ( = ?auto_389474 ?auto_389480 ) ) ( not ( = ?auto_389474 ?auto_389481 ) ) ( not ( = ?auto_389474 ?auto_389482 ) ) ( not ( = ?auto_389475 ?auto_389476 ) ) ( not ( = ?auto_389475 ?auto_389477 ) ) ( not ( = ?auto_389475 ?auto_389478 ) ) ( not ( = ?auto_389475 ?auto_389479 ) ) ( not ( = ?auto_389475 ?auto_389480 ) ) ( not ( = ?auto_389475 ?auto_389481 ) ) ( not ( = ?auto_389475 ?auto_389482 ) ) ( not ( = ?auto_389476 ?auto_389477 ) ) ( not ( = ?auto_389476 ?auto_389478 ) ) ( not ( = ?auto_389476 ?auto_389479 ) ) ( not ( = ?auto_389476 ?auto_389480 ) ) ( not ( = ?auto_389476 ?auto_389481 ) ) ( not ( = ?auto_389476 ?auto_389482 ) ) ( not ( = ?auto_389477 ?auto_389478 ) ) ( not ( = ?auto_389477 ?auto_389479 ) ) ( not ( = ?auto_389477 ?auto_389480 ) ) ( not ( = ?auto_389477 ?auto_389481 ) ) ( not ( = ?auto_389477 ?auto_389482 ) ) ( not ( = ?auto_389478 ?auto_389479 ) ) ( not ( = ?auto_389478 ?auto_389480 ) ) ( not ( = ?auto_389478 ?auto_389481 ) ) ( not ( = ?auto_389478 ?auto_389482 ) ) ( not ( = ?auto_389479 ?auto_389480 ) ) ( not ( = ?auto_389479 ?auto_389481 ) ) ( not ( = ?auto_389479 ?auto_389482 ) ) ( not ( = ?auto_389480 ?auto_389481 ) ) ( not ( = ?auto_389480 ?auto_389482 ) ) ( not ( = ?auto_389481 ?auto_389482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_389481 ?auto_389482 )
      ( !STACK ?auto_389481 ?auto_389480 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389523 - BLOCK
      ?auto_389524 - BLOCK
      ?auto_389525 - BLOCK
      ?auto_389526 - BLOCK
      ?auto_389527 - BLOCK
      ?auto_389528 - BLOCK
      ?auto_389529 - BLOCK
      ?auto_389530 - BLOCK
      ?auto_389531 - BLOCK
      ?auto_389532 - BLOCK
      ?auto_389533 - BLOCK
      ?auto_389534 - BLOCK
      ?auto_389535 - BLOCK
    )
    :vars
    (
      ?auto_389536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389535 ?auto_389536 ) ( ON-TABLE ?auto_389523 ) ( ON ?auto_389524 ?auto_389523 ) ( ON ?auto_389525 ?auto_389524 ) ( ON ?auto_389526 ?auto_389525 ) ( ON ?auto_389527 ?auto_389526 ) ( ON ?auto_389528 ?auto_389527 ) ( ON ?auto_389529 ?auto_389528 ) ( ON ?auto_389530 ?auto_389529 ) ( ON ?auto_389531 ?auto_389530 ) ( ON ?auto_389532 ?auto_389531 ) ( ON ?auto_389533 ?auto_389532 ) ( not ( = ?auto_389523 ?auto_389524 ) ) ( not ( = ?auto_389523 ?auto_389525 ) ) ( not ( = ?auto_389523 ?auto_389526 ) ) ( not ( = ?auto_389523 ?auto_389527 ) ) ( not ( = ?auto_389523 ?auto_389528 ) ) ( not ( = ?auto_389523 ?auto_389529 ) ) ( not ( = ?auto_389523 ?auto_389530 ) ) ( not ( = ?auto_389523 ?auto_389531 ) ) ( not ( = ?auto_389523 ?auto_389532 ) ) ( not ( = ?auto_389523 ?auto_389533 ) ) ( not ( = ?auto_389523 ?auto_389534 ) ) ( not ( = ?auto_389523 ?auto_389535 ) ) ( not ( = ?auto_389523 ?auto_389536 ) ) ( not ( = ?auto_389524 ?auto_389525 ) ) ( not ( = ?auto_389524 ?auto_389526 ) ) ( not ( = ?auto_389524 ?auto_389527 ) ) ( not ( = ?auto_389524 ?auto_389528 ) ) ( not ( = ?auto_389524 ?auto_389529 ) ) ( not ( = ?auto_389524 ?auto_389530 ) ) ( not ( = ?auto_389524 ?auto_389531 ) ) ( not ( = ?auto_389524 ?auto_389532 ) ) ( not ( = ?auto_389524 ?auto_389533 ) ) ( not ( = ?auto_389524 ?auto_389534 ) ) ( not ( = ?auto_389524 ?auto_389535 ) ) ( not ( = ?auto_389524 ?auto_389536 ) ) ( not ( = ?auto_389525 ?auto_389526 ) ) ( not ( = ?auto_389525 ?auto_389527 ) ) ( not ( = ?auto_389525 ?auto_389528 ) ) ( not ( = ?auto_389525 ?auto_389529 ) ) ( not ( = ?auto_389525 ?auto_389530 ) ) ( not ( = ?auto_389525 ?auto_389531 ) ) ( not ( = ?auto_389525 ?auto_389532 ) ) ( not ( = ?auto_389525 ?auto_389533 ) ) ( not ( = ?auto_389525 ?auto_389534 ) ) ( not ( = ?auto_389525 ?auto_389535 ) ) ( not ( = ?auto_389525 ?auto_389536 ) ) ( not ( = ?auto_389526 ?auto_389527 ) ) ( not ( = ?auto_389526 ?auto_389528 ) ) ( not ( = ?auto_389526 ?auto_389529 ) ) ( not ( = ?auto_389526 ?auto_389530 ) ) ( not ( = ?auto_389526 ?auto_389531 ) ) ( not ( = ?auto_389526 ?auto_389532 ) ) ( not ( = ?auto_389526 ?auto_389533 ) ) ( not ( = ?auto_389526 ?auto_389534 ) ) ( not ( = ?auto_389526 ?auto_389535 ) ) ( not ( = ?auto_389526 ?auto_389536 ) ) ( not ( = ?auto_389527 ?auto_389528 ) ) ( not ( = ?auto_389527 ?auto_389529 ) ) ( not ( = ?auto_389527 ?auto_389530 ) ) ( not ( = ?auto_389527 ?auto_389531 ) ) ( not ( = ?auto_389527 ?auto_389532 ) ) ( not ( = ?auto_389527 ?auto_389533 ) ) ( not ( = ?auto_389527 ?auto_389534 ) ) ( not ( = ?auto_389527 ?auto_389535 ) ) ( not ( = ?auto_389527 ?auto_389536 ) ) ( not ( = ?auto_389528 ?auto_389529 ) ) ( not ( = ?auto_389528 ?auto_389530 ) ) ( not ( = ?auto_389528 ?auto_389531 ) ) ( not ( = ?auto_389528 ?auto_389532 ) ) ( not ( = ?auto_389528 ?auto_389533 ) ) ( not ( = ?auto_389528 ?auto_389534 ) ) ( not ( = ?auto_389528 ?auto_389535 ) ) ( not ( = ?auto_389528 ?auto_389536 ) ) ( not ( = ?auto_389529 ?auto_389530 ) ) ( not ( = ?auto_389529 ?auto_389531 ) ) ( not ( = ?auto_389529 ?auto_389532 ) ) ( not ( = ?auto_389529 ?auto_389533 ) ) ( not ( = ?auto_389529 ?auto_389534 ) ) ( not ( = ?auto_389529 ?auto_389535 ) ) ( not ( = ?auto_389529 ?auto_389536 ) ) ( not ( = ?auto_389530 ?auto_389531 ) ) ( not ( = ?auto_389530 ?auto_389532 ) ) ( not ( = ?auto_389530 ?auto_389533 ) ) ( not ( = ?auto_389530 ?auto_389534 ) ) ( not ( = ?auto_389530 ?auto_389535 ) ) ( not ( = ?auto_389530 ?auto_389536 ) ) ( not ( = ?auto_389531 ?auto_389532 ) ) ( not ( = ?auto_389531 ?auto_389533 ) ) ( not ( = ?auto_389531 ?auto_389534 ) ) ( not ( = ?auto_389531 ?auto_389535 ) ) ( not ( = ?auto_389531 ?auto_389536 ) ) ( not ( = ?auto_389532 ?auto_389533 ) ) ( not ( = ?auto_389532 ?auto_389534 ) ) ( not ( = ?auto_389532 ?auto_389535 ) ) ( not ( = ?auto_389532 ?auto_389536 ) ) ( not ( = ?auto_389533 ?auto_389534 ) ) ( not ( = ?auto_389533 ?auto_389535 ) ) ( not ( = ?auto_389533 ?auto_389536 ) ) ( not ( = ?auto_389534 ?auto_389535 ) ) ( not ( = ?auto_389534 ?auto_389536 ) ) ( not ( = ?auto_389535 ?auto_389536 ) ) ( CLEAR ?auto_389533 ) ( ON ?auto_389534 ?auto_389535 ) ( CLEAR ?auto_389534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_389523 ?auto_389524 ?auto_389525 ?auto_389526 ?auto_389527 ?auto_389528 ?auto_389529 ?auto_389530 ?auto_389531 ?auto_389532 ?auto_389533 ?auto_389534 )
      ( MAKE-13PILE ?auto_389523 ?auto_389524 ?auto_389525 ?auto_389526 ?auto_389527 ?auto_389528 ?auto_389529 ?auto_389530 ?auto_389531 ?auto_389532 ?auto_389533 ?auto_389534 ?auto_389535 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389577 - BLOCK
      ?auto_389578 - BLOCK
      ?auto_389579 - BLOCK
      ?auto_389580 - BLOCK
      ?auto_389581 - BLOCK
      ?auto_389582 - BLOCK
      ?auto_389583 - BLOCK
      ?auto_389584 - BLOCK
      ?auto_389585 - BLOCK
      ?auto_389586 - BLOCK
      ?auto_389587 - BLOCK
      ?auto_389588 - BLOCK
      ?auto_389589 - BLOCK
    )
    :vars
    (
      ?auto_389590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389589 ?auto_389590 ) ( ON-TABLE ?auto_389577 ) ( ON ?auto_389578 ?auto_389577 ) ( ON ?auto_389579 ?auto_389578 ) ( ON ?auto_389580 ?auto_389579 ) ( ON ?auto_389581 ?auto_389580 ) ( ON ?auto_389582 ?auto_389581 ) ( ON ?auto_389583 ?auto_389582 ) ( ON ?auto_389584 ?auto_389583 ) ( ON ?auto_389585 ?auto_389584 ) ( ON ?auto_389586 ?auto_389585 ) ( not ( = ?auto_389577 ?auto_389578 ) ) ( not ( = ?auto_389577 ?auto_389579 ) ) ( not ( = ?auto_389577 ?auto_389580 ) ) ( not ( = ?auto_389577 ?auto_389581 ) ) ( not ( = ?auto_389577 ?auto_389582 ) ) ( not ( = ?auto_389577 ?auto_389583 ) ) ( not ( = ?auto_389577 ?auto_389584 ) ) ( not ( = ?auto_389577 ?auto_389585 ) ) ( not ( = ?auto_389577 ?auto_389586 ) ) ( not ( = ?auto_389577 ?auto_389587 ) ) ( not ( = ?auto_389577 ?auto_389588 ) ) ( not ( = ?auto_389577 ?auto_389589 ) ) ( not ( = ?auto_389577 ?auto_389590 ) ) ( not ( = ?auto_389578 ?auto_389579 ) ) ( not ( = ?auto_389578 ?auto_389580 ) ) ( not ( = ?auto_389578 ?auto_389581 ) ) ( not ( = ?auto_389578 ?auto_389582 ) ) ( not ( = ?auto_389578 ?auto_389583 ) ) ( not ( = ?auto_389578 ?auto_389584 ) ) ( not ( = ?auto_389578 ?auto_389585 ) ) ( not ( = ?auto_389578 ?auto_389586 ) ) ( not ( = ?auto_389578 ?auto_389587 ) ) ( not ( = ?auto_389578 ?auto_389588 ) ) ( not ( = ?auto_389578 ?auto_389589 ) ) ( not ( = ?auto_389578 ?auto_389590 ) ) ( not ( = ?auto_389579 ?auto_389580 ) ) ( not ( = ?auto_389579 ?auto_389581 ) ) ( not ( = ?auto_389579 ?auto_389582 ) ) ( not ( = ?auto_389579 ?auto_389583 ) ) ( not ( = ?auto_389579 ?auto_389584 ) ) ( not ( = ?auto_389579 ?auto_389585 ) ) ( not ( = ?auto_389579 ?auto_389586 ) ) ( not ( = ?auto_389579 ?auto_389587 ) ) ( not ( = ?auto_389579 ?auto_389588 ) ) ( not ( = ?auto_389579 ?auto_389589 ) ) ( not ( = ?auto_389579 ?auto_389590 ) ) ( not ( = ?auto_389580 ?auto_389581 ) ) ( not ( = ?auto_389580 ?auto_389582 ) ) ( not ( = ?auto_389580 ?auto_389583 ) ) ( not ( = ?auto_389580 ?auto_389584 ) ) ( not ( = ?auto_389580 ?auto_389585 ) ) ( not ( = ?auto_389580 ?auto_389586 ) ) ( not ( = ?auto_389580 ?auto_389587 ) ) ( not ( = ?auto_389580 ?auto_389588 ) ) ( not ( = ?auto_389580 ?auto_389589 ) ) ( not ( = ?auto_389580 ?auto_389590 ) ) ( not ( = ?auto_389581 ?auto_389582 ) ) ( not ( = ?auto_389581 ?auto_389583 ) ) ( not ( = ?auto_389581 ?auto_389584 ) ) ( not ( = ?auto_389581 ?auto_389585 ) ) ( not ( = ?auto_389581 ?auto_389586 ) ) ( not ( = ?auto_389581 ?auto_389587 ) ) ( not ( = ?auto_389581 ?auto_389588 ) ) ( not ( = ?auto_389581 ?auto_389589 ) ) ( not ( = ?auto_389581 ?auto_389590 ) ) ( not ( = ?auto_389582 ?auto_389583 ) ) ( not ( = ?auto_389582 ?auto_389584 ) ) ( not ( = ?auto_389582 ?auto_389585 ) ) ( not ( = ?auto_389582 ?auto_389586 ) ) ( not ( = ?auto_389582 ?auto_389587 ) ) ( not ( = ?auto_389582 ?auto_389588 ) ) ( not ( = ?auto_389582 ?auto_389589 ) ) ( not ( = ?auto_389582 ?auto_389590 ) ) ( not ( = ?auto_389583 ?auto_389584 ) ) ( not ( = ?auto_389583 ?auto_389585 ) ) ( not ( = ?auto_389583 ?auto_389586 ) ) ( not ( = ?auto_389583 ?auto_389587 ) ) ( not ( = ?auto_389583 ?auto_389588 ) ) ( not ( = ?auto_389583 ?auto_389589 ) ) ( not ( = ?auto_389583 ?auto_389590 ) ) ( not ( = ?auto_389584 ?auto_389585 ) ) ( not ( = ?auto_389584 ?auto_389586 ) ) ( not ( = ?auto_389584 ?auto_389587 ) ) ( not ( = ?auto_389584 ?auto_389588 ) ) ( not ( = ?auto_389584 ?auto_389589 ) ) ( not ( = ?auto_389584 ?auto_389590 ) ) ( not ( = ?auto_389585 ?auto_389586 ) ) ( not ( = ?auto_389585 ?auto_389587 ) ) ( not ( = ?auto_389585 ?auto_389588 ) ) ( not ( = ?auto_389585 ?auto_389589 ) ) ( not ( = ?auto_389585 ?auto_389590 ) ) ( not ( = ?auto_389586 ?auto_389587 ) ) ( not ( = ?auto_389586 ?auto_389588 ) ) ( not ( = ?auto_389586 ?auto_389589 ) ) ( not ( = ?auto_389586 ?auto_389590 ) ) ( not ( = ?auto_389587 ?auto_389588 ) ) ( not ( = ?auto_389587 ?auto_389589 ) ) ( not ( = ?auto_389587 ?auto_389590 ) ) ( not ( = ?auto_389588 ?auto_389589 ) ) ( not ( = ?auto_389588 ?auto_389590 ) ) ( not ( = ?auto_389589 ?auto_389590 ) ) ( ON ?auto_389588 ?auto_389589 ) ( CLEAR ?auto_389586 ) ( ON ?auto_389587 ?auto_389588 ) ( CLEAR ?auto_389587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_389577 ?auto_389578 ?auto_389579 ?auto_389580 ?auto_389581 ?auto_389582 ?auto_389583 ?auto_389584 ?auto_389585 ?auto_389586 ?auto_389587 )
      ( MAKE-13PILE ?auto_389577 ?auto_389578 ?auto_389579 ?auto_389580 ?auto_389581 ?auto_389582 ?auto_389583 ?auto_389584 ?auto_389585 ?auto_389586 ?auto_389587 ?auto_389588 ?auto_389589 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389631 - BLOCK
      ?auto_389632 - BLOCK
      ?auto_389633 - BLOCK
      ?auto_389634 - BLOCK
      ?auto_389635 - BLOCK
      ?auto_389636 - BLOCK
      ?auto_389637 - BLOCK
      ?auto_389638 - BLOCK
      ?auto_389639 - BLOCK
      ?auto_389640 - BLOCK
      ?auto_389641 - BLOCK
      ?auto_389642 - BLOCK
      ?auto_389643 - BLOCK
    )
    :vars
    (
      ?auto_389644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389643 ?auto_389644 ) ( ON-TABLE ?auto_389631 ) ( ON ?auto_389632 ?auto_389631 ) ( ON ?auto_389633 ?auto_389632 ) ( ON ?auto_389634 ?auto_389633 ) ( ON ?auto_389635 ?auto_389634 ) ( ON ?auto_389636 ?auto_389635 ) ( ON ?auto_389637 ?auto_389636 ) ( ON ?auto_389638 ?auto_389637 ) ( ON ?auto_389639 ?auto_389638 ) ( not ( = ?auto_389631 ?auto_389632 ) ) ( not ( = ?auto_389631 ?auto_389633 ) ) ( not ( = ?auto_389631 ?auto_389634 ) ) ( not ( = ?auto_389631 ?auto_389635 ) ) ( not ( = ?auto_389631 ?auto_389636 ) ) ( not ( = ?auto_389631 ?auto_389637 ) ) ( not ( = ?auto_389631 ?auto_389638 ) ) ( not ( = ?auto_389631 ?auto_389639 ) ) ( not ( = ?auto_389631 ?auto_389640 ) ) ( not ( = ?auto_389631 ?auto_389641 ) ) ( not ( = ?auto_389631 ?auto_389642 ) ) ( not ( = ?auto_389631 ?auto_389643 ) ) ( not ( = ?auto_389631 ?auto_389644 ) ) ( not ( = ?auto_389632 ?auto_389633 ) ) ( not ( = ?auto_389632 ?auto_389634 ) ) ( not ( = ?auto_389632 ?auto_389635 ) ) ( not ( = ?auto_389632 ?auto_389636 ) ) ( not ( = ?auto_389632 ?auto_389637 ) ) ( not ( = ?auto_389632 ?auto_389638 ) ) ( not ( = ?auto_389632 ?auto_389639 ) ) ( not ( = ?auto_389632 ?auto_389640 ) ) ( not ( = ?auto_389632 ?auto_389641 ) ) ( not ( = ?auto_389632 ?auto_389642 ) ) ( not ( = ?auto_389632 ?auto_389643 ) ) ( not ( = ?auto_389632 ?auto_389644 ) ) ( not ( = ?auto_389633 ?auto_389634 ) ) ( not ( = ?auto_389633 ?auto_389635 ) ) ( not ( = ?auto_389633 ?auto_389636 ) ) ( not ( = ?auto_389633 ?auto_389637 ) ) ( not ( = ?auto_389633 ?auto_389638 ) ) ( not ( = ?auto_389633 ?auto_389639 ) ) ( not ( = ?auto_389633 ?auto_389640 ) ) ( not ( = ?auto_389633 ?auto_389641 ) ) ( not ( = ?auto_389633 ?auto_389642 ) ) ( not ( = ?auto_389633 ?auto_389643 ) ) ( not ( = ?auto_389633 ?auto_389644 ) ) ( not ( = ?auto_389634 ?auto_389635 ) ) ( not ( = ?auto_389634 ?auto_389636 ) ) ( not ( = ?auto_389634 ?auto_389637 ) ) ( not ( = ?auto_389634 ?auto_389638 ) ) ( not ( = ?auto_389634 ?auto_389639 ) ) ( not ( = ?auto_389634 ?auto_389640 ) ) ( not ( = ?auto_389634 ?auto_389641 ) ) ( not ( = ?auto_389634 ?auto_389642 ) ) ( not ( = ?auto_389634 ?auto_389643 ) ) ( not ( = ?auto_389634 ?auto_389644 ) ) ( not ( = ?auto_389635 ?auto_389636 ) ) ( not ( = ?auto_389635 ?auto_389637 ) ) ( not ( = ?auto_389635 ?auto_389638 ) ) ( not ( = ?auto_389635 ?auto_389639 ) ) ( not ( = ?auto_389635 ?auto_389640 ) ) ( not ( = ?auto_389635 ?auto_389641 ) ) ( not ( = ?auto_389635 ?auto_389642 ) ) ( not ( = ?auto_389635 ?auto_389643 ) ) ( not ( = ?auto_389635 ?auto_389644 ) ) ( not ( = ?auto_389636 ?auto_389637 ) ) ( not ( = ?auto_389636 ?auto_389638 ) ) ( not ( = ?auto_389636 ?auto_389639 ) ) ( not ( = ?auto_389636 ?auto_389640 ) ) ( not ( = ?auto_389636 ?auto_389641 ) ) ( not ( = ?auto_389636 ?auto_389642 ) ) ( not ( = ?auto_389636 ?auto_389643 ) ) ( not ( = ?auto_389636 ?auto_389644 ) ) ( not ( = ?auto_389637 ?auto_389638 ) ) ( not ( = ?auto_389637 ?auto_389639 ) ) ( not ( = ?auto_389637 ?auto_389640 ) ) ( not ( = ?auto_389637 ?auto_389641 ) ) ( not ( = ?auto_389637 ?auto_389642 ) ) ( not ( = ?auto_389637 ?auto_389643 ) ) ( not ( = ?auto_389637 ?auto_389644 ) ) ( not ( = ?auto_389638 ?auto_389639 ) ) ( not ( = ?auto_389638 ?auto_389640 ) ) ( not ( = ?auto_389638 ?auto_389641 ) ) ( not ( = ?auto_389638 ?auto_389642 ) ) ( not ( = ?auto_389638 ?auto_389643 ) ) ( not ( = ?auto_389638 ?auto_389644 ) ) ( not ( = ?auto_389639 ?auto_389640 ) ) ( not ( = ?auto_389639 ?auto_389641 ) ) ( not ( = ?auto_389639 ?auto_389642 ) ) ( not ( = ?auto_389639 ?auto_389643 ) ) ( not ( = ?auto_389639 ?auto_389644 ) ) ( not ( = ?auto_389640 ?auto_389641 ) ) ( not ( = ?auto_389640 ?auto_389642 ) ) ( not ( = ?auto_389640 ?auto_389643 ) ) ( not ( = ?auto_389640 ?auto_389644 ) ) ( not ( = ?auto_389641 ?auto_389642 ) ) ( not ( = ?auto_389641 ?auto_389643 ) ) ( not ( = ?auto_389641 ?auto_389644 ) ) ( not ( = ?auto_389642 ?auto_389643 ) ) ( not ( = ?auto_389642 ?auto_389644 ) ) ( not ( = ?auto_389643 ?auto_389644 ) ) ( ON ?auto_389642 ?auto_389643 ) ( ON ?auto_389641 ?auto_389642 ) ( CLEAR ?auto_389639 ) ( ON ?auto_389640 ?auto_389641 ) ( CLEAR ?auto_389640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_389631 ?auto_389632 ?auto_389633 ?auto_389634 ?auto_389635 ?auto_389636 ?auto_389637 ?auto_389638 ?auto_389639 ?auto_389640 )
      ( MAKE-13PILE ?auto_389631 ?auto_389632 ?auto_389633 ?auto_389634 ?auto_389635 ?auto_389636 ?auto_389637 ?auto_389638 ?auto_389639 ?auto_389640 ?auto_389641 ?auto_389642 ?auto_389643 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389685 - BLOCK
      ?auto_389686 - BLOCK
      ?auto_389687 - BLOCK
      ?auto_389688 - BLOCK
      ?auto_389689 - BLOCK
      ?auto_389690 - BLOCK
      ?auto_389691 - BLOCK
      ?auto_389692 - BLOCK
      ?auto_389693 - BLOCK
      ?auto_389694 - BLOCK
      ?auto_389695 - BLOCK
      ?auto_389696 - BLOCK
      ?auto_389697 - BLOCK
    )
    :vars
    (
      ?auto_389698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389697 ?auto_389698 ) ( ON-TABLE ?auto_389685 ) ( ON ?auto_389686 ?auto_389685 ) ( ON ?auto_389687 ?auto_389686 ) ( ON ?auto_389688 ?auto_389687 ) ( ON ?auto_389689 ?auto_389688 ) ( ON ?auto_389690 ?auto_389689 ) ( ON ?auto_389691 ?auto_389690 ) ( ON ?auto_389692 ?auto_389691 ) ( not ( = ?auto_389685 ?auto_389686 ) ) ( not ( = ?auto_389685 ?auto_389687 ) ) ( not ( = ?auto_389685 ?auto_389688 ) ) ( not ( = ?auto_389685 ?auto_389689 ) ) ( not ( = ?auto_389685 ?auto_389690 ) ) ( not ( = ?auto_389685 ?auto_389691 ) ) ( not ( = ?auto_389685 ?auto_389692 ) ) ( not ( = ?auto_389685 ?auto_389693 ) ) ( not ( = ?auto_389685 ?auto_389694 ) ) ( not ( = ?auto_389685 ?auto_389695 ) ) ( not ( = ?auto_389685 ?auto_389696 ) ) ( not ( = ?auto_389685 ?auto_389697 ) ) ( not ( = ?auto_389685 ?auto_389698 ) ) ( not ( = ?auto_389686 ?auto_389687 ) ) ( not ( = ?auto_389686 ?auto_389688 ) ) ( not ( = ?auto_389686 ?auto_389689 ) ) ( not ( = ?auto_389686 ?auto_389690 ) ) ( not ( = ?auto_389686 ?auto_389691 ) ) ( not ( = ?auto_389686 ?auto_389692 ) ) ( not ( = ?auto_389686 ?auto_389693 ) ) ( not ( = ?auto_389686 ?auto_389694 ) ) ( not ( = ?auto_389686 ?auto_389695 ) ) ( not ( = ?auto_389686 ?auto_389696 ) ) ( not ( = ?auto_389686 ?auto_389697 ) ) ( not ( = ?auto_389686 ?auto_389698 ) ) ( not ( = ?auto_389687 ?auto_389688 ) ) ( not ( = ?auto_389687 ?auto_389689 ) ) ( not ( = ?auto_389687 ?auto_389690 ) ) ( not ( = ?auto_389687 ?auto_389691 ) ) ( not ( = ?auto_389687 ?auto_389692 ) ) ( not ( = ?auto_389687 ?auto_389693 ) ) ( not ( = ?auto_389687 ?auto_389694 ) ) ( not ( = ?auto_389687 ?auto_389695 ) ) ( not ( = ?auto_389687 ?auto_389696 ) ) ( not ( = ?auto_389687 ?auto_389697 ) ) ( not ( = ?auto_389687 ?auto_389698 ) ) ( not ( = ?auto_389688 ?auto_389689 ) ) ( not ( = ?auto_389688 ?auto_389690 ) ) ( not ( = ?auto_389688 ?auto_389691 ) ) ( not ( = ?auto_389688 ?auto_389692 ) ) ( not ( = ?auto_389688 ?auto_389693 ) ) ( not ( = ?auto_389688 ?auto_389694 ) ) ( not ( = ?auto_389688 ?auto_389695 ) ) ( not ( = ?auto_389688 ?auto_389696 ) ) ( not ( = ?auto_389688 ?auto_389697 ) ) ( not ( = ?auto_389688 ?auto_389698 ) ) ( not ( = ?auto_389689 ?auto_389690 ) ) ( not ( = ?auto_389689 ?auto_389691 ) ) ( not ( = ?auto_389689 ?auto_389692 ) ) ( not ( = ?auto_389689 ?auto_389693 ) ) ( not ( = ?auto_389689 ?auto_389694 ) ) ( not ( = ?auto_389689 ?auto_389695 ) ) ( not ( = ?auto_389689 ?auto_389696 ) ) ( not ( = ?auto_389689 ?auto_389697 ) ) ( not ( = ?auto_389689 ?auto_389698 ) ) ( not ( = ?auto_389690 ?auto_389691 ) ) ( not ( = ?auto_389690 ?auto_389692 ) ) ( not ( = ?auto_389690 ?auto_389693 ) ) ( not ( = ?auto_389690 ?auto_389694 ) ) ( not ( = ?auto_389690 ?auto_389695 ) ) ( not ( = ?auto_389690 ?auto_389696 ) ) ( not ( = ?auto_389690 ?auto_389697 ) ) ( not ( = ?auto_389690 ?auto_389698 ) ) ( not ( = ?auto_389691 ?auto_389692 ) ) ( not ( = ?auto_389691 ?auto_389693 ) ) ( not ( = ?auto_389691 ?auto_389694 ) ) ( not ( = ?auto_389691 ?auto_389695 ) ) ( not ( = ?auto_389691 ?auto_389696 ) ) ( not ( = ?auto_389691 ?auto_389697 ) ) ( not ( = ?auto_389691 ?auto_389698 ) ) ( not ( = ?auto_389692 ?auto_389693 ) ) ( not ( = ?auto_389692 ?auto_389694 ) ) ( not ( = ?auto_389692 ?auto_389695 ) ) ( not ( = ?auto_389692 ?auto_389696 ) ) ( not ( = ?auto_389692 ?auto_389697 ) ) ( not ( = ?auto_389692 ?auto_389698 ) ) ( not ( = ?auto_389693 ?auto_389694 ) ) ( not ( = ?auto_389693 ?auto_389695 ) ) ( not ( = ?auto_389693 ?auto_389696 ) ) ( not ( = ?auto_389693 ?auto_389697 ) ) ( not ( = ?auto_389693 ?auto_389698 ) ) ( not ( = ?auto_389694 ?auto_389695 ) ) ( not ( = ?auto_389694 ?auto_389696 ) ) ( not ( = ?auto_389694 ?auto_389697 ) ) ( not ( = ?auto_389694 ?auto_389698 ) ) ( not ( = ?auto_389695 ?auto_389696 ) ) ( not ( = ?auto_389695 ?auto_389697 ) ) ( not ( = ?auto_389695 ?auto_389698 ) ) ( not ( = ?auto_389696 ?auto_389697 ) ) ( not ( = ?auto_389696 ?auto_389698 ) ) ( not ( = ?auto_389697 ?auto_389698 ) ) ( ON ?auto_389696 ?auto_389697 ) ( ON ?auto_389695 ?auto_389696 ) ( ON ?auto_389694 ?auto_389695 ) ( CLEAR ?auto_389692 ) ( ON ?auto_389693 ?auto_389694 ) ( CLEAR ?auto_389693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_389685 ?auto_389686 ?auto_389687 ?auto_389688 ?auto_389689 ?auto_389690 ?auto_389691 ?auto_389692 ?auto_389693 )
      ( MAKE-13PILE ?auto_389685 ?auto_389686 ?auto_389687 ?auto_389688 ?auto_389689 ?auto_389690 ?auto_389691 ?auto_389692 ?auto_389693 ?auto_389694 ?auto_389695 ?auto_389696 ?auto_389697 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389739 - BLOCK
      ?auto_389740 - BLOCK
      ?auto_389741 - BLOCK
      ?auto_389742 - BLOCK
      ?auto_389743 - BLOCK
      ?auto_389744 - BLOCK
      ?auto_389745 - BLOCK
      ?auto_389746 - BLOCK
      ?auto_389747 - BLOCK
      ?auto_389748 - BLOCK
      ?auto_389749 - BLOCK
      ?auto_389750 - BLOCK
      ?auto_389751 - BLOCK
    )
    :vars
    (
      ?auto_389752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389751 ?auto_389752 ) ( ON-TABLE ?auto_389739 ) ( ON ?auto_389740 ?auto_389739 ) ( ON ?auto_389741 ?auto_389740 ) ( ON ?auto_389742 ?auto_389741 ) ( ON ?auto_389743 ?auto_389742 ) ( ON ?auto_389744 ?auto_389743 ) ( ON ?auto_389745 ?auto_389744 ) ( not ( = ?auto_389739 ?auto_389740 ) ) ( not ( = ?auto_389739 ?auto_389741 ) ) ( not ( = ?auto_389739 ?auto_389742 ) ) ( not ( = ?auto_389739 ?auto_389743 ) ) ( not ( = ?auto_389739 ?auto_389744 ) ) ( not ( = ?auto_389739 ?auto_389745 ) ) ( not ( = ?auto_389739 ?auto_389746 ) ) ( not ( = ?auto_389739 ?auto_389747 ) ) ( not ( = ?auto_389739 ?auto_389748 ) ) ( not ( = ?auto_389739 ?auto_389749 ) ) ( not ( = ?auto_389739 ?auto_389750 ) ) ( not ( = ?auto_389739 ?auto_389751 ) ) ( not ( = ?auto_389739 ?auto_389752 ) ) ( not ( = ?auto_389740 ?auto_389741 ) ) ( not ( = ?auto_389740 ?auto_389742 ) ) ( not ( = ?auto_389740 ?auto_389743 ) ) ( not ( = ?auto_389740 ?auto_389744 ) ) ( not ( = ?auto_389740 ?auto_389745 ) ) ( not ( = ?auto_389740 ?auto_389746 ) ) ( not ( = ?auto_389740 ?auto_389747 ) ) ( not ( = ?auto_389740 ?auto_389748 ) ) ( not ( = ?auto_389740 ?auto_389749 ) ) ( not ( = ?auto_389740 ?auto_389750 ) ) ( not ( = ?auto_389740 ?auto_389751 ) ) ( not ( = ?auto_389740 ?auto_389752 ) ) ( not ( = ?auto_389741 ?auto_389742 ) ) ( not ( = ?auto_389741 ?auto_389743 ) ) ( not ( = ?auto_389741 ?auto_389744 ) ) ( not ( = ?auto_389741 ?auto_389745 ) ) ( not ( = ?auto_389741 ?auto_389746 ) ) ( not ( = ?auto_389741 ?auto_389747 ) ) ( not ( = ?auto_389741 ?auto_389748 ) ) ( not ( = ?auto_389741 ?auto_389749 ) ) ( not ( = ?auto_389741 ?auto_389750 ) ) ( not ( = ?auto_389741 ?auto_389751 ) ) ( not ( = ?auto_389741 ?auto_389752 ) ) ( not ( = ?auto_389742 ?auto_389743 ) ) ( not ( = ?auto_389742 ?auto_389744 ) ) ( not ( = ?auto_389742 ?auto_389745 ) ) ( not ( = ?auto_389742 ?auto_389746 ) ) ( not ( = ?auto_389742 ?auto_389747 ) ) ( not ( = ?auto_389742 ?auto_389748 ) ) ( not ( = ?auto_389742 ?auto_389749 ) ) ( not ( = ?auto_389742 ?auto_389750 ) ) ( not ( = ?auto_389742 ?auto_389751 ) ) ( not ( = ?auto_389742 ?auto_389752 ) ) ( not ( = ?auto_389743 ?auto_389744 ) ) ( not ( = ?auto_389743 ?auto_389745 ) ) ( not ( = ?auto_389743 ?auto_389746 ) ) ( not ( = ?auto_389743 ?auto_389747 ) ) ( not ( = ?auto_389743 ?auto_389748 ) ) ( not ( = ?auto_389743 ?auto_389749 ) ) ( not ( = ?auto_389743 ?auto_389750 ) ) ( not ( = ?auto_389743 ?auto_389751 ) ) ( not ( = ?auto_389743 ?auto_389752 ) ) ( not ( = ?auto_389744 ?auto_389745 ) ) ( not ( = ?auto_389744 ?auto_389746 ) ) ( not ( = ?auto_389744 ?auto_389747 ) ) ( not ( = ?auto_389744 ?auto_389748 ) ) ( not ( = ?auto_389744 ?auto_389749 ) ) ( not ( = ?auto_389744 ?auto_389750 ) ) ( not ( = ?auto_389744 ?auto_389751 ) ) ( not ( = ?auto_389744 ?auto_389752 ) ) ( not ( = ?auto_389745 ?auto_389746 ) ) ( not ( = ?auto_389745 ?auto_389747 ) ) ( not ( = ?auto_389745 ?auto_389748 ) ) ( not ( = ?auto_389745 ?auto_389749 ) ) ( not ( = ?auto_389745 ?auto_389750 ) ) ( not ( = ?auto_389745 ?auto_389751 ) ) ( not ( = ?auto_389745 ?auto_389752 ) ) ( not ( = ?auto_389746 ?auto_389747 ) ) ( not ( = ?auto_389746 ?auto_389748 ) ) ( not ( = ?auto_389746 ?auto_389749 ) ) ( not ( = ?auto_389746 ?auto_389750 ) ) ( not ( = ?auto_389746 ?auto_389751 ) ) ( not ( = ?auto_389746 ?auto_389752 ) ) ( not ( = ?auto_389747 ?auto_389748 ) ) ( not ( = ?auto_389747 ?auto_389749 ) ) ( not ( = ?auto_389747 ?auto_389750 ) ) ( not ( = ?auto_389747 ?auto_389751 ) ) ( not ( = ?auto_389747 ?auto_389752 ) ) ( not ( = ?auto_389748 ?auto_389749 ) ) ( not ( = ?auto_389748 ?auto_389750 ) ) ( not ( = ?auto_389748 ?auto_389751 ) ) ( not ( = ?auto_389748 ?auto_389752 ) ) ( not ( = ?auto_389749 ?auto_389750 ) ) ( not ( = ?auto_389749 ?auto_389751 ) ) ( not ( = ?auto_389749 ?auto_389752 ) ) ( not ( = ?auto_389750 ?auto_389751 ) ) ( not ( = ?auto_389750 ?auto_389752 ) ) ( not ( = ?auto_389751 ?auto_389752 ) ) ( ON ?auto_389750 ?auto_389751 ) ( ON ?auto_389749 ?auto_389750 ) ( ON ?auto_389748 ?auto_389749 ) ( ON ?auto_389747 ?auto_389748 ) ( CLEAR ?auto_389745 ) ( ON ?auto_389746 ?auto_389747 ) ( CLEAR ?auto_389746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_389739 ?auto_389740 ?auto_389741 ?auto_389742 ?auto_389743 ?auto_389744 ?auto_389745 ?auto_389746 )
      ( MAKE-13PILE ?auto_389739 ?auto_389740 ?auto_389741 ?auto_389742 ?auto_389743 ?auto_389744 ?auto_389745 ?auto_389746 ?auto_389747 ?auto_389748 ?auto_389749 ?auto_389750 ?auto_389751 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389793 - BLOCK
      ?auto_389794 - BLOCK
      ?auto_389795 - BLOCK
      ?auto_389796 - BLOCK
      ?auto_389797 - BLOCK
      ?auto_389798 - BLOCK
      ?auto_389799 - BLOCK
      ?auto_389800 - BLOCK
      ?auto_389801 - BLOCK
      ?auto_389802 - BLOCK
      ?auto_389803 - BLOCK
      ?auto_389804 - BLOCK
      ?auto_389805 - BLOCK
    )
    :vars
    (
      ?auto_389806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389805 ?auto_389806 ) ( ON-TABLE ?auto_389793 ) ( ON ?auto_389794 ?auto_389793 ) ( ON ?auto_389795 ?auto_389794 ) ( ON ?auto_389796 ?auto_389795 ) ( ON ?auto_389797 ?auto_389796 ) ( ON ?auto_389798 ?auto_389797 ) ( not ( = ?auto_389793 ?auto_389794 ) ) ( not ( = ?auto_389793 ?auto_389795 ) ) ( not ( = ?auto_389793 ?auto_389796 ) ) ( not ( = ?auto_389793 ?auto_389797 ) ) ( not ( = ?auto_389793 ?auto_389798 ) ) ( not ( = ?auto_389793 ?auto_389799 ) ) ( not ( = ?auto_389793 ?auto_389800 ) ) ( not ( = ?auto_389793 ?auto_389801 ) ) ( not ( = ?auto_389793 ?auto_389802 ) ) ( not ( = ?auto_389793 ?auto_389803 ) ) ( not ( = ?auto_389793 ?auto_389804 ) ) ( not ( = ?auto_389793 ?auto_389805 ) ) ( not ( = ?auto_389793 ?auto_389806 ) ) ( not ( = ?auto_389794 ?auto_389795 ) ) ( not ( = ?auto_389794 ?auto_389796 ) ) ( not ( = ?auto_389794 ?auto_389797 ) ) ( not ( = ?auto_389794 ?auto_389798 ) ) ( not ( = ?auto_389794 ?auto_389799 ) ) ( not ( = ?auto_389794 ?auto_389800 ) ) ( not ( = ?auto_389794 ?auto_389801 ) ) ( not ( = ?auto_389794 ?auto_389802 ) ) ( not ( = ?auto_389794 ?auto_389803 ) ) ( not ( = ?auto_389794 ?auto_389804 ) ) ( not ( = ?auto_389794 ?auto_389805 ) ) ( not ( = ?auto_389794 ?auto_389806 ) ) ( not ( = ?auto_389795 ?auto_389796 ) ) ( not ( = ?auto_389795 ?auto_389797 ) ) ( not ( = ?auto_389795 ?auto_389798 ) ) ( not ( = ?auto_389795 ?auto_389799 ) ) ( not ( = ?auto_389795 ?auto_389800 ) ) ( not ( = ?auto_389795 ?auto_389801 ) ) ( not ( = ?auto_389795 ?auto_389802 ) ) ( not ( = ?auto_389795 ?auto_389803 ) ) ( not ( = ?auto_389795 ?auto_389804 ) ) ( not ( = ?auto_389795 ?auto_389805 ) ) ( not ( = ?auto_389795 ?auto_389806 ) ) ( not ( = ?auto_389796 ?auto_389797 ) ) ( not ( = ?auto_389796 ?auto_389798 ) ) ( not ( = ?auto_389796 ?auto_389799 ) ) ( not ( = ?auto_389796 ?auto_389800 ) ) ( not ( = ?auto_389796 ?auto_389801 ) ) ( not ( = ?auto_389796 ?auto_389802 ) ) ( not ( = ?auto_389796 ?auto_389803 ) ) ( not ( = ?auto_389796 ?auto_389804 ) ) ( not ( = ?auto_389796 ?auto_389805 ) ) ( not ( = ?auto_389796 ?auto_389806 ) ) ( not ( = ?auto_389797 ?auto_389798 ) ) ( not ( = ?auto_389797 ?auto_389799 ) ) ( not ( = ?auto_389797 ?auto_389800 ) ) ( not ( = ?auto_389797 ?auto_389801 ) ) ( not ( = ?auto_389797 ?auto_389802 ) ) ( not ( = ?auto_389797 ?auto_389803 ) ) ( not ( = ?auto_389797 ?auto_389804 ) ) ( not ( = ?auto_389797 ?auto_389805 ) ) ( not ( = ?auto_389797 ?auto_389806 ) ) ( not ( = ?auto_389798 ?auto_389799 ) ) ( not ( = ?auto_389798 ?auto_389800 ) ) ( not ( = ?auto_389798 ?auto_389801 ) ) ( not ( = ?auto_389798 ?auto_389802 ) ) ( not ( = ?auto_389798 ?auto_389803 ) ) ( not ( = ?auto_389798 ?auto_389804 ) ) ( not ( = ?auto_389798 ?auto_389805 ) ) ( not ( = ?auto_389798 ?auto_389806 ) ) ( not ( = ?auto_389799 ?auto_389800 ) ) ( not ( = ?auto_389799 ?auto_389801 ) ) ( not ( = ?auto_389799 ?auto_389802 ) ) ( not ( = ?auto_389799 ?auto_389803 ) ) ( not ( = ?auto_389799 ?auto_389804 ) ) ( not ( = ?auto_389799 ?auto_389805 ) ) ( not ( = ?auto_389799 ?auto_389806 ) ) ( not ( = ?auto_389800 ?auto_389801 ) ) ( not ( = ?auto_389800 ?auto_389802 ) ) ( not ( = ?auto_389800 ?auto_389803 ) ) ( not ( = ?auto_389800 ?auto_389804 ) ) ( not ( = ?auto_389800 ?auto_389805 ) ) ( not ( = ?auto_389800 ?auto_389806 ) ) ( not ( = ?auto_389801 ?auto_389802 ) ) ( not ( = ?auto_389801 ?auto_389803 ) ) ( not ( = ?auto_389801 ?auto_389804 ) ) ( not ( = ?auto_389801 ?auto_389805 ) ) ( not ( = ?auto_389801 ?auto_389806 ) ) ( not ( = ?auto_389802 ?auto_389803 ) ) ( not ( = ?auto_389802 ?auto_389804 ) ) ( not ( = ?auto_389802 ?auto_389805 ) ) ( not ( = ?auto_389802 ?auto_389806 ) ) ( not ( = ?auto_389803 ?auto_389804 ) ) ( not ( = ?auto_389803 ?auto_389805 ) ) ( not ( = ?auto_389803 ?auto_389806 ) ) ( not ( = ?auto_389804 ?auto_389805 ) ) ( not ( = ?auto_389804 ?auto_389806 ) ) ( not ( = ?auto_389805 ?auto_389806 ) ) ( ON ?auto_389804 ?auto_389805 ) ( ON ?auto_389803 ?auto_389804 ) ( ON ?auto_389802 ?auto_389803 ) ( ON ?auto_389801 ?auto_389802 ) ( ON ?auto_389800 ?auto_389801 ) ( CLEAR ?auto_389798 ) ( ON ?auto_389799 ?auto_389800 ) ( CLEAR ?auto_389799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_389793 ?auto_389794 ?auto_389795 ?auto_389796 ?auto_389797 ?auto_389798 ?auto_389799 )
      ( MAKE-13PILE ?auto_389793 ?auto_389794 ?auto_389795 ?auto_389796 ?auto_389797 ?auto_389798 ?auto_389799 ?auto_389800 ?auto_389801 ?auto_389802 ?auto_389803 ?auto_389804 ?auto_389805 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389847 - BLOCK
      ?auto_389848 - BLOCK
      ?auto_389849 - BLOCK
      ?auto_389850 - BLOCK
      ?auto_389851 - BLOCK
      ?auto_389852 - BLOCK
      ?auto_389853 - BLOCK
      ?auto_389854 - BLOCK
      ?auto_389855 - BLOCK
      ?auto_389856 - BLOCK
      ?auto_389857 - BLOCK
      ?auto_389858 - BLOCK
      ?auto_389859 - BLOCK
    )
    :vars
    (
      ?auto_389860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389859 ?auto_389860 ) ( ON-TABLE ?auto_389847 ) ( ON ?auto_389848 ?auto_389847 ) ( ON ?auto_389849 ?auto_389848 ) ( ON ?auto_389850 ?auto_389849 ) ( ON ?auto_389851 ?auto_389850 ) ( not ( = ?auto_389847 ?auto_389848 ) ) ( not ( = ?auto_389847 ?auto_389849 ) ) ( not ( = ?auto_389847 ?auto_389850 ) ) ( not ( = ?auto_389847 ?auto_389851 ) ) ( not ( = ?auto_389847 ?auto_389852 ) ) ( not ( = ?auto_389847 ?auto_389853 ) ) ( not ( = ?auto_389847 ?auto_389854 ) ) ( not ( = ?auto_389847 ?auto_389855 ) ) ( not ( = ?auto_389847 ?auto_389856 ) ) ( not ( = ?auto_389847 ?auto_389857 ) ) ( not ( = ?auto_389847 ?auto_389858 ) ) ( not ( = ?auto_389847 ?auto_389859 ) ) ( not ( = ?auto_389847 ?auto_389860 ) ) ( not ( = ?auto_389848 ?auto_389849 ) ) ( not ( = ?auto_389848 ?auto_389850 ) ) ( not ( = ?auto_389848 ?auto_389851 ) ) ( not ( = ?auto_389848 ?auto_389852 ) ) ( not ( = ?auto_389848 ?auto_389853 ) ) ( not ( = ?auto_389848 ?auto_389854 ) ) ( not ( = ?auto_389848 ?auto_389855 ) ) ( not ( = ?auto_389848 ?auto_389856 ) ) ( not ( = ?auto_389848 ?auto_389857 ) ) ( not ( = ?auto_389848 ?auto_389858 ) ) ( not ( = ?auto_389848 ?auto_389859 ) ) ( not ( = ?auto_389848 ?auto_389860 ) ) ( not ( = ?auto_389849 ?auto_389850 ) ) ( not ( = ?auto_389849 ?auto_389851 ) ) ( not ( = ?auto_389849 ?auto_389852 ) ) ( not ( = ?auto_389849 ?auto_389853 ) ) ( not ( = ?auto_389849 ?auto_389854 ) ) ( not ( = ?auto_389849 ?auto_389855 ) ) ( not ( = ?auto_389849 ?auto_389856 ) ) ( not ( = ?auto_389849 ?auto_389857 ) ) ( not ( = ?auto_389849 ?auto_389858 ) ) ( not ( = ?auto_389849 ?auto_389859 ) ) ( not ( = ?auto_389849 ?auto_389860 ) ) ( not ( = ?auto_389850 ?auto_389851 ) ) ( not ( = ?auto_389850 ?auto_389852 ) ) ( not ( = ?auto_389850 ?auto_389853 ) ) ( not ( = ?auto_389850 ?auto_389854 ) ) ( not ( = ?auto_389850 ?auto_389855 ) ) ( not ( = ?auto_389850 ?auto_389856 ) ) ( not ( = ?auto_389850 ?auto_389857 ) ) ( not ( = ?auto_389850 ?auto_389858 ) ) ( not ( = ?auto_389850 ?auto_389859 ) ) ( not ( = ?auto_389850 ?auto_389860 ) ) ( not ( = ?auto_389851 ?auto_389852 ) ) ( not ( = ?auto_389851 ?auto_389853 ) ) ( not ( = ?auto_389851 ?auto_389854 ) ) ( not ( = ?auto_389851 ?auto_389855 ) ) ( not ( = ?auto_389851 ?auto_389856 ) ) ( not ( = ?auto_389851 ?auto_389857 ) ) ( not ( = ?auto_389851 ?auto_389858 ) ) ( not ( = ?auto_389851 ?auto_389859 ) ) ( not ( = ?auto_389851 ?auto_389860 ) ) ( not ( = ?auto_389852 ?auto_389853 ) ) ( not ( = ?auto_389852 ?auto_389854 ) ) ( not ( = ?auto_389852 ?auto_389855 ) ) ( not ( = ?auto_389852 ?auto_389856 ) ) ( not ( = ?auto_389852 ?auto_389857 ) ) ( not ( = ?auto_389852 ?auto_389858 ) ) ( not ( = ?auto_389852 ?auto_389859 ) ) ( not ( = ?auto_389852 ?auto_389860 ) ) ( not ( = ?auto_389853 ?auto_389854 ) ) ( not ( = ?auto_389853 ?auto_389855 ) ) ( not ( = ?auto_389853 ?auto_389856 ) ) ( not ( = ?auto_389853 ?auto_389857 ) ) ( not ( = ?auto_389853 ?auto_389858 ) ) ( not ( = ?auto_389853 ?auto_389859 ) ) ( not ( = ?auto_389853 ?auto_389860 ) ) ( not ( = ?auto_389854 ?auto_389855 ) ) ( not ( = ?auto_389854 ?auto_389856 ) ) ( not ( = ?auto_389854 ?auto_389857 ) ) ( not ( = ?auto_389854 ?auto_389858 ) ) ( not ( = ?auto_389854 ?auto_389859 ) ) ( not ( = ?auto_389854 ?auto_389860 ) ) ( not ( = ?auto_389855 ?auto_389856 ) ) ( not ( = ?auto_389855 ?auto_389857 ) ) ( not ( = ?auto_389855 ?auto_389858 ) ) ( not ( = ?auto_389855 ?auto_389859 ) ) ( not ( = ?auto_389855 ?auto_389860 ) ) ( not ( = ?auto_389856 ?auto_389857 ) ) ( not ( = ?auto_389856 ?auto_389858 ) ) ( not ( = ?auto_389856 ?auto_389859 ) ) ( not ( = ?auto_389856 ?auto_389860 ) ) ( not ( = ?auto_389857 ?auto_389858 ) ) ( not ( = ?auto_389857 ?auto_389859 ) ) ( not ( = ?auto_389857 ?auto_389860 ) ) ( not ( = ?auto_389858 ?auto_389859 ) ) ( not ( = ?auto_389858 ?auto_389860 ) ) ( not ( = ?auto_389859 ?auto_389860 ) ) ( ON ?auto_389858 ?auto_389859 ) ( ON ?auto_389857 ?auto_389858 ) ( ON ?auto_389856 ?auto_389857 ) ( ON ?auto_389855 ?auto_389856 ) ( ON ?auto_389854 ?auto_389855 ) ( ON ?auto_389853 ?auto_389854 ) ( CLEAR ?auto_389851 ) ( ON ?auto_389852 ?auto_389853 ) ( CLEAR ?auto_389852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_389847 ?auto_389848 ?auto_389849 ?auto_389850 ?auto_389851 ?auto_389852 )
      ( MAKE-13PILE ?auto_389847 ?auto_389848 ?auto_389849 ?auto_389850 ?auto_389851 ?auto_389852 ?auto_389853 ?auto_389854 ?auto_389855 ?auto_389856 ?auto_389857 ?auto_389858 ?auto_389859 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389901 - BLOCK
      ?auto_389902 - BLOCK
      ?auto_389903 - BLOCK
      ?auto_389904 - BLOCK
      ?auto_389905 - BLOCK
      ?auto_389906 - BLOCK
      ?auto_389907 - BLOCK
      ?auto_389908 - BLOCK
      ?auto_389909 - BLOCK
      ?auto_389910 - BLOCK
      ?auto_389911 - BLOCK
      ?auto_389912 - BLOCK
      ?auto_389913 - BLOCK
    )
    :vars
    (
      ?auto_389914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389913 ?auto_389914 ) ( ON-TABLE ?auto_389901 ) ( ON ?auto_389902 ?auto_389901 ) ( ON ?auto_389903 ?auto_389902 ) ( ON ?auto_389904 ?auto_389903 ) ( not ( = ?auto_389901 ?auto_389902 ) ) ( not ( = ?auto_389901 ?auto_389903 ) ) ( not ( = ?auto_389901 ?auto_389904 ) ) ( not ( = ?auto_389901 ?auto_389905 ) ) ( not ( = ?auto_389901 ?auto_389906 ) ) ( not ( = ?auto_389901 ?auto_389907 ) ) ( not ( = ?auto_389901 ?auto_389908 ) ) ( not ( = ?auto_389901 ?auto_389909 ) ) ( not ( = ?auto_389901 ?auto_389910 ) ) ( not ( = ?auto_389901 ?auto_389911 ) ) ( not ( = ?auto_389901 ?auto_389912 ) ) ( not ( = ?auto_389901 ?auto_389913 ) ) ( not ( = ?auto_389901 ?auto_389914 ) ) ( not ( = ?auto_389902 ?auto_389903 ) ) ( not ( = ?auto_389902 ?auto_389904 ) ) ( not ( = ?auto_389902 ?auto_389905 ) ) ( not ( = ?auto_389902 ?auto_389906 ) ) ( not ( = ?auto_389902 ?auto_389907 ) ) ( not ( = ?auto_389902 ?auto_389908 ) ) ( not ( = ?auto_389902 ?auto_389909 ) ) ( not ( = ?auto_389902 ?auto_389910 ) ) ( not ( = ?auto_389902 ?auto_389911 ) ) ( not ( = ?auto_389902 ?auto_389912 ) ) ( not ( = ?auto_389902 ?auto_389913 ) ) ( not ( = ?auto_389902 ?auto_389914 ) ) ( not ( = ?auto_389903 ?auto_389904 ) ) ( not ( = ?auto_389903 ?auto_389905 ) ) ( not ( = ?auto_389903 ?auto_389906 ) ) ( not ( = ?auto_389903 ?auto_389907 ) ) ( not ( = ?auto_389903 ?auto_389908 ) ) ( not ( = ?auto_389903 ?auto_389909 ) ) ( not ( = ?auto_389903 ?auto_389910 ) ) ( not ( = ?auto_389903 ?auto_389911 ) ) ( not ( = ?auto_389903 ?auto_389912 ) ) ( not ( = ?auto_389903 ?auto_389913 ) ) ( not ( = ?auto_389903 ?auto_389914 ) ) ( not ( = ?auto_389904 ?auto_389905 ) ) ( not ( = ?auto_389904 ?auto_389906 ) ) ( not ( = ?auto_389904 ?auto_389907 ) ) ( not ( = ?auto_389904 ?auto_389908 ) ) ( not ( = ?auto_389904 ?auto_389909 ) ) ( not ( = ?auto_389904 ?auto_389910 ) ) ( not ( = ?auto_389904 ?auto_389911 ) ) ( not ( = ?auto_389904 ?auto_389912 ) ) ( not ( = ?auto_389904 ?auto_389913 ) ) ( not ( = ?auto_389904 ?auto_389914 ) ) ( not ( = ?auto_389905 ?auto_389906 ) ) ( not ( = ?auto_389905 ?auto_389907 ) ) ( not ( = ?auto_389905 ?auto_389908 ) ) ( not ( = ?auto_389905 ?auto_389909 ) ) ( not ( = ?auto_389905 ?auto_389910 ) ) ( not ( = ?auto_389905 ?auto_389911 ) ) ( not ( = ?auto_389905 ?auto_389912 ) ) ( not ( = ?auto_389905 ?auto_389913 ) ) ( not ( = ?auto_389905 ?auto_389914 ) ) ( not ( = ?auto_389906 ?auto_389907 ) ) ( not ( = ?auto_389906 ?auto_389908 ) ) ( not ( = ?auto_389906 ?auto_389909 ) ) ( not ( = ?auto_389906 ?auto_389910 ) ) ( not ( = ?auto_389906 ?auto_389911 ) ) ( not ( = ?auto_389906 ?auto_389912 ) ) ( not ( = ?auto_389906 ?auto_389913 ) ) ( not ( = ?auto_389906 ?auto_389914 ) ) ( not ( = ?auto_389907 ?auto_389908 ) ) ( not ( = ?auto_389907 ?auto_389909 ) ) ( not ( = ?auto_389907 ?auto_389910 ) ) ( not ( = ?auto_389907 ?auto_389911 ) ) ( not ( = ?auto_389907 ?auto_389912 ) ) ( not ( = ?auto_389907 ?auto_389913 ) ) ( not ( = ?auto_389907 ?auto_389914 ) ) ( not ( = ?auto_389908 ?auto_389909 ) ) ( not ( = ?auto_389908 ?auto_389910 ) ) ( not ( = ?auto_389908 ?auto_389911 ) ) ( not ( = ?auto_389908 ?auto_389912 ) ) ( not ( = ?auto_389908 ?auto_389913 ) ) ( not ( = ?auto_389908 ?auto_389914 ) ) ( not ( = ?auto_389909 ?auto_389910 ) ) ( not ( = ?auto_389909 ?auto_389911 ) ) ( not ( = ?auto_389909 ?auto_389912 ) ) ( not ( = ?auto_389909 ?auto_389913 ) ) ( not ( = ?auto_389909 ?auto_389914 ) ) ( not ( = ?auto_389910 ?auto_389911 ) ) ( not ( = ?auto_389910 ?auto_389912 ) ) ( not ( = ?auto_389910 ?auto_389913 ) ) ( not ( = ?auto_389910 ?auto_389914 ) ) ( not ( = ?auto_389911 ?auto_389912 ) ) ( not ( = ?auto_389911 ?auto_389913 ) ) ( not ( = ?auto_389911 ?auto_389914 ) ) ( not ( = ?auto_389912 ?auto_389913 ) ) ( not ( = ?auto_389912 ?auto_389914 ) ) ( not ( = ?auto_389913 ?auto_389914 ) ) ( ON ?auto_389912 ?auto_389913 ) ( ON ?auto_389911 ?auto_389912 ) ( ON ?auto_389910 ?auto_389911 ) ( ON ?auto_389909 ?auto_389910 ) ( ON ?auto_389908 ?auto_389909 ) ( ON ?auto_389907 ?auto_389908 ) ( ON ?auto_389906 ?auto_389907 ) ( CLEAR ?auto_389904 ) ( ON ?auto_389905 ?auto_389906 ) ( CLEAR ?auto_389905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_389901 ?auto_389902 ?auto_389903 ?auto_389904 ?auto_389905 )
      ( MAKE-13PILE ?auto_389901 ?auto_389902 ?auto_389903 ?auto_389904 ?auto_389905 ?auto_389906 ?auto_389907 ?auto_389908 ?auto_389909 ?auto_389910 ?auto_389911 ?auto_389912 ?auto_389913 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389955 - BLOCK
      ?auto_389956 - BLOCK
      ?auto_389957 - BLOCK
      ?auto_389958 - BLOCK
      ?auto_389959 - BLOCK
      ?auto_389960 - BLOCK
      ?auto_389961 - BLOCK
      ?auto_389962 - BLOCK
      ?auto_389963 - BLOCK
      ?auto_389964 - BLOCK
      ?auto_389965 - BLOCK
      ?auto_389966 - BLOCK
      ?auto_389967 - BLOCK
    )
    :vars
    (
      ?auto_389968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389967 ?auto_389968 ) ( ON-TABLE ?auto_389955 ) ( ON ?auto_389956 ?auto_389955 ) ( ON ?auto_389957 ?auto_389956 ) ( not ( = ?auto_389955 ?auto_389956 ) ) ( not ( = ?auto_389955 ?auto_389957 ) ) ( not ( = ?auto_389955 ?auto_389958 ) ) ( not ( = ?auto_389955 ?auto_389959 ) ) ( not ( = ?auto_389955 ?auto_389960 ) ) ( not ( = ?auto_389955 ?auto_389961 ) ) ( not ( = ?auto_389955 ?auto_389962 ) ) ( not ( = ?auto_389955 ?auto_389963 ) ) ( not ( = ?auto_389955 ?auto_389964 ) ) ( not ( = ?auto_389955 ?auto_389965 ) ) ( not ( = ?auto_389955 ?auto_389966 ) ) ( not ( = ?auto_389955 ?auto_389967 ) ) ( not ( = ?auto_389955 ?auto_389968 ) ) ( not ( = ?auto_389956 ?auto_389957 ) ) ( not ( = ?auto_389956 ?auto_389958 ) ) ( not ( = ?auto_389956 ?auto_389959 ) ) ( not ( = ?auto_389956 ?auto_389960 ) ) ( not ( = ?auto_389956 ?auto_389961 ) ) ( not ( = ?auto_389956 ?auto_389962 ) ) ( not ( = ?auto_389956 ?auto_389963 ) ) ( not ( = ?auto_389956 ?auto_389964 ) ) ( not ( = ?auto_389956 ?auto_389965 ) ) ( not ( = ?auto_389956 ?auto_389966 ) ) ( not ( = ?auto_389956 ?auto_389967 ) ) ( not ( = ?auto_389956 ?auto_389968 ) ) ( not ( = ?auto_389957 ?auto_389958 ) ) ( not ( = ?auto_389957 ?auto_389959 ) ) ( not ( = ?auto_389957 ?auto_389960 ) ) ( not ( = ?auto_389957 ?auto_389961 ) ) ( not ( = ?auto_389957 ?auto_389962 ) ) ( not ( = ?auto_389957 ?auto_389963 ) ) ( not ( = ?auto_389957 ?auto_389964 ) ) ( not ( = ?auto_389957 ?auto_389965 ) ) ( not ( = ?auto_389957 ?auto_389966 ) ) ( not ( = ?auto_389957 ?auto_389967 ) ) ( not ( = ?auto_389957 ?auto_389968 ) ) ( not ( = ?auto_389958 ?auto_389959 ) ) ( not ( = ?auto_389958 ?auto_389960 ) ) ( not ( = ?auto_389958 ?auto_389961 ) ) ( not ( = ?auto_389958 ?auto_389962 ) ) ( not ( = ?auto_389958 ?auto_389963 ) ) ( not ( = ?auto_389958 ?auto_389964 ) ) ( not ( = ?auto_389958 ?auto_389965 ) ) ( not ( = ?auto_389958 ?auto_389966 ) ) ( not ( = ?auto_389958 ?auto_389967 ) ) ( not ( = ?auto_389958 ?auto_389968 ) ) ( not ( = ?auto_389959 ?auto_389960 ) ) ( not ( = ?auto_389959 ?auto_389961 ) ) ( not ( = ?auto_389959 ?auto_389962 ) ) ( not ( = ?auto_389959 ?auto_389963 ) ) ( not ( = ?auto_389959 ?auto_389964 ) ) ( not ( = ?auto_389959 ?auto_389965 ) ) ( not ( = ?auto_389959 ?auto_389966 ) ) ( not ( = ?auto_389959 ?auto_389967 ) ) ( not ( = ?auto_389959 ?auto_389968 ) ) ( not ( = ?auto_389960 ?auto_389961 ) ) ( not ( = ?auto_389960 ?auto_389962 ) ) ( not ( = ?auto_389960 ?auto_389963 ) ) ( not ( = ?auto_389960 ?auto_389964 ) ) ( not ( = ?auto_389960 ?auto_389965 ) ) ( not ( = ?auto_389960 ?auto_389966 ) ) ( not ( = ?auto_389960 ?auto_389967 ) ) ( not ( = ?auto_389960 ?auto_389968 ) ) ( not ( = ?auto_389961 ?auto_389962 ) ) ( not ( = ?auto_389961 ?auto_389963 ) ) ( not ( = ?auto_389961 ?auto_389964 ) ) ( not ( = ?auto_389961 ?auto_389965 ) ) ( not ( = ?auto_389961 ?auto_389966 ) ) ( not ( = ?auto_389961 ?auto_389967 ) ) ( not ( = ?auto_389961 ?auto_389968 ) ) ( not ( = ?auto_389962 ?auto_389963 ) ) ( not ( = ?auto_389962 ?auto_389964 ) ) ( not ( = ?auto_389962 ?auto_389965 ) ) ( not ( = ?auto_389962 ?auto_389966 ) ) ( not ( = ?auto_389962 ?auto_389967 ) ) ( not ( = ?auto_389962 ?auto_389968 ) ) ( not ( = ?auto_389963 ?auto_389964 ) ) ( not ( = ?auto_389963 ?auto_389965 ) ) ( not ( = ?auto_389963 ?auto_389966 ) ) ( not ( = ?auto_389963 ?auto_389967 ) ) ( not ( = ?auto_389963 ?auto_389968 ) ) ( not ( = ?auto_389964 ?auto_389965 ) ) ( not ( = ?auto_389964 ?auto_389966 ) ) ( not ( = ?auto_389964 ?auto_389967 ) ) ( not ( = ?auto_389964 ?auto_389968 ) ) ( not ( = ?auto_389965 ?auto_389966 ) ) ( not ( = ?auto_389965 ?auto_389967 ) ) ( not ( = ?auto_389965 ?auto_389968 ) ) ( not ( = ?auto_389966 ?auto_389967 ) ) ( not ( = ?auto_389966 ?auto_389968 ) ) ( not ( = ?auto_389967 ?auto_389968 ) ) ( ON ?auto_389966 ?auto_389967 ) ( ON ?auto_389965 ?auto_389966 ) ( ON ?auto_389964 ?auto_389965 ) ( ON ?auto_389963 ?auto_389964 ) ( ON ?auto_389962 ?auto_389963 ) ( ON ?auto_389961 ?auto_389962 ) ( ON ?auto_389960 ?auto_389961 ) ( ON ?auto_389959 ?auto_389960 ) ( CLEAR ?auto_389957 ) ( ON ?auto_389958 ?auto_389959 ) ( CLEAR ?auto_389958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_389955 ?auto_389956 ?auto_389957 ?auto_389958 )
      ( MAKE-13PILE ?auto_389955 ?auto_389956 ?auto_389957 ?auto_389958 ?auto_389959 ?auto_389960 ?auto_389961 ?auto_389962 ?auto_389963 ?auto_389964 ?auto_389965 ?auto_389966 ?auto_389967 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_390009 - BLOCK
      ?auto_390010 - BLOCK
      ?auto_390011 - BLOCK
      ?auto_390012 - BLOCK
      ?auto_390013 - BLOCK
      ?auto_390014 - BLOCK
      ?auto_390015 - BLOCK
      ?auto_390016 - BLOCK
      ?auto_390017 - BLOCK
      ?auto_390018 - BLOCK
      ?auto_390019 - BLOCK
      ?auto_390020 - BLOCK
      ?auto_390021 - BLOCK
    )
    :vars
    (
      ?auto_390022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390021 ?auto_390022 ) ( ON-TABLE ?auto_390009 ) ( ON ?auto_390010 ?auto_390009 ) ( not ( = ?auto_390009 ?auto_390010 ) ) ( not ( = ?auto_390009 ?auto_390011 ) ) ( not ( = ?auto_390009 ?auto_390012 ) ) ( not ( = ?auto_390009 ?auto_390013 ) ) ( not ( = ?auto_390009 ?auto_390014 ) ) ( not ( = ?auto_390009 ?auto_390015 ) ) ( not ( = ?auto_390009 ?auto_390016 ) ) ( not ( = ?auto_390009 ?auto_390017 ) ) ( not ( = ?auto_390009 ?auto_390018 ) ) ( not ( = ?auto_390009 ?auto_390019 ) ) ( not ( = ?auto_390009 ?auto_390020 ) ) ( not ( = ?auto_390009 ?auto_390021 ) ) ( not ( = ?auto_390009 ?auto_390022 ) ) ( not ( = ?auto_390010 ?auto_390011 ) ) ( not ( = ?auto_390010 ?auto_390012 ) ) ( not ( = ?auto_390010 ?auto_390013 ) ) ( not ( = ?auto_390010 ?auto_390014 ) ) ( not ( = ?auto_390010 ?auto_390015 ) ) ( not ( = ?auto_390010 ?auto_390016 ) ) ( not ( = ?auto_390010 ?auto_390017 ) ) ( not ( = ?auto_390010 ?auto_390018 ) ) ( not ( = ?auto_390010 ?auto_390019 ) ) ( not ( = ?auto_390010 ?auto_390020 ) ) ( not ( = ?auto_390010 ?auto_390021 ) ) ( not ( = ?auto_390010 ?auto_390022 ) ) ( not ( = ?auto_390011 ?auto_390012 ) ) ( not ( = ?auto_390011 ?auto_390013 ) ) ( not ( = ?auto_390011 ?auto_390014 ) ) ( not ( = ?auto_390011 ?auto_390015 ) ) ( not ( = ?auto_390011 ?auto_390016 ) ) ( not ( = ?auto_390011 ?auto_390017 ) ) ( not ( = ?auto_390011 ?auto_390018 ) ) ( not ( = ?auto_390011 ?auto_390019 ) ) ( not ( = ?auto_390011 ?auto_390020 ) ) ( not ( = ?auto_390011 ?auto_390021 ) ) ( not ( = ?auto_390011 ?auto_390022 ) ) ( not ( = ?auto_390012 ?auto_390013 ) ) ( not ( = ?auto_390012 ?auto_390014 ) ) ( not ( = ?auto_390012 ?auto_390015 ) ) ( not ( = ?auto_390012 ?auto_390016 ) ) ( not ( = ?auto_390012 ?auto_390017 ) ) ( not ( = ?auto_390012 ?auto_390018 ) ) ( not ( = ?auto_390012 ?auto_390019 ) ) ( not ( = ?auto_390012 ?auto_390020 ) ) ( not ( = ?auto_390012 ?auto_390021 ) ) ( not ( = ?auto_390012 ?auto_390022 ) ) ( not ( = ?auto_390013 ?auto_390014 ) ) ( not ( = ?auto_390013 ?auto_390015 ) ) ( not ( = ?auto_390013 ?auto_390016 ) ) ( not ( = ?auto_390013 ?auto_390017 ) ) ( not ( = ?auto_390013 ?auto_390018 ) ) ( not ( = ?auto_390013 ?auto_390019 ) ) ( not ( = ?auto_390013 ?auto_390020 ) ) ( not ( = ?auto_390013 ?auto_390021 ) ) ( not ( = ?auto_390013 ?auto_390022 ) ) ( not ( = ?auto_390014 ?auto_390015 ) ) ( not ( = ?auto_390014 ?auto_390016 ) ) ( not ( = ?auto_390014 ?auto_390017 ) ) ( not ( = ?auto_390014 ?auto_390018 ) ) ( not ( = ?auto_390014 ?auto_390019 ) ) ( not ( = ?auto_390014 ?auto_390020 ) ) ( not ( = ?auto_390014 ?auto_390021 ) ) ( not ( = ?auto_390014 ?auto_390022 ) ) ( not ( = ?auto_390015 ?auto_390016 ) ) ( not ( = ?auto_390015 ?auto_390017 ) ) ( not ( = ?auto_390015 ?auto_390018 ) ) ( not ( = ?auto_390015 ?auto_390019 ) ) ( not ( = ?auto_390015 ?auto_390020 ) ) ( not ( = ?auto_390015 ?auto_390021 ) ) ( not ( = ?auto_390015 ?auto_390022 ) ) ( not ( = ?auto_390016 ?auto_390017 ) ) ( not ( = ?auto_390016 ?auto_390018 ) ) ( not ( = ?auto_390016 ?auto_390019 ) ) ( not ( = ?auto_390016 ?auto_390020 ) ) ( not ( = ?auto_390016 ?auto_390021 ) ) ( not ( = ?auto_390016 ?auto_390022 ) ) ( not ( = ?auto_390017 ?auto_390018 ) ) ( not ( = ?auto_390017 ?auto_390019 ) ) ( not ( = ?auto_390017 ?auto_390020 ) ) ( not ( = ?auto_390017 ?auto_390021 ) ) ( not ( = ?auto_390017 ?auto_390022 ) ) ( not ( = ?auto_390018 ?auto_390019 ) ) ( not ( = ?auto_390018 ?auto_390020 ) ) ( not ( = ?auto_390018 ?auto_390021 ) ) ( not ( = ?auto_390018 ?auto_390022 ) ) ( not ( = ?auto_390019 ?auto_390020 ) ) ( not ( = ?auto_390019 ?auto_390021 ) ) ( not ( = ?auto_390019 ?auto_390022 ) ) ( not ( = ?auto_390020 ?auto_390021 ) ) ( not ( = ?auto_390020 ?auto_390022 ) ) ( not ( = ?auto_390021 ?auto_390022 ) ) ( ON ?auto_390020 ?auto_390021 ) ( ON ?auto_390019 ?auto_390020 ) ( ON ?auto_390018 ?auto_390019 ) ( ON ?auto_390017 ?auto_390018 ) ( ON ?auto_390016 ?auto_390017 ) ( ON ?auto_390015 ?auto_390016 ) ( ON ?auto_390014 ?auto_390015 ) ( ON ?auto_390013 ?auto_390014 ) ( ON ?auto_390012 ?auto_390013 ) ( CLEAR ?auto_390010 ) ( ON ?auto_390011 ?auto_390012 ) ( CLEAR ?auto_390011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_390009 ?auto_390010 ?auto_390011 )
      ( MAKE-13PILE ?auto_390009 ?auto_390010 ?auto_390011 ?auto_390012 ?auto_390013 ?auto_390014 ?auto_390015 ?auto_390016 ?auto_390017 ?auto_390018 ?auto_390019 ?auto_390020 ?auto_390021 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_390063 - BLOCK
      ?auto_390064 - BLOCK
      ?auto_390065 - BLOCK
      ?auto_390066 - BLOCK
      ?auto_390067 - BLOCK
      ?auto_390068 - BLOCK
      ?auto_390069 - BLOCK
      ?auto_390070 - BLOCK
      ?auto_390071 - BLOCK
      ?auto_390072 - BLOCK
      ?auto_390073 - BLOCK
      ?auto_390074 - BLOCK
      ?auto_390075 - BLOCK
    )
    :vars
    (
      ?auto_390076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390075 ?auto_390076 ) ( ON-TABLE ?auto_390063 ) ( not ( = ?auto_390063 ?auto_390064 ) ) ( not ( = ?auto_390063 ?auto_390065 ) ) ( not ( = ?auto_390063 ?auto_390066 ) ) ( not ( = ?auto_390063 ?auto_390067 ) ) ( not ( = ?auto_390063 ?auto_390068 ) ) ( not ( = ?auto_390063 ?auto_390069 ) ) ( not ( = ?auto_390063 ?auto_390070 ) ) ( not ( = ?auto_390063 ?auto_390071 ) ) ( not ( = ?auto_390063 ?auto_390072 ) ) ( not ( = ?auto_390063 ?auto_390073 ) ) ( not ( = ?auto_390063 ?auto_390074 ) ) ( not ( = ?auto_390063 ?auto_390075 ) ) ( not ( = ?auto_390063 ?auto_390076 ) ) ( not ( = ?auto_390064 ?auto_390065 ) ) ( not ( = ?auto_390064 ?auto_390066 ) ) ( not ( = ?auto_390064 ?auto_390067 ) ) ( not ( = ?auto_390064 ?auto_390068 ) ) ( not ( = ?auto_390064 ?auto_390069 ) ) ( not ( = ?auto_390064 ?auto_390070 ) ) ( not ( = ?auto_390064 ?auto_390071 ) ) ( not ( = ?auto_390064 ?auto_390072 ) ) ( not ( = ?auto_390064 ?auto_390073 ) ) ( not ( = ?auto_390064 ?auto_390074 ) ) ( not ( = ?auto_390064 ?auto_390075 ) ) ( not ( = ?auto_390064 ?auto_390076 ) ) ( not ( = ?auto_390065 ?auto_390066 ) ) ( not ( = ?auto_390065 ?auto_390067 ) ) ( not ( = ?auto_390065 ?auto_390068 ) ) ( not ( = ?auto_390065 ?auto_390069 ) ) ( not ( = ?auto_390065 ?auto_390070 ) ) ( not ( = ?auto_390065 ?auto_390071 ) ) ( not ( = ?auto_390065 ?auto_390072 ) ) ( not ( = ?auto_390065 ?auto_390073 ) ) ( not ( = ?auto_390065 ?auto_390074 ) ) ( not ( = ?auto_390065 ?auto_390075 ) ) ( not ( = ?auto_390065 ?auto_390076 ) ) ( not ( = ?auto_390066 ?auto_390067 ) ) ( not ( = ?auto_390066 ?auto_390068 ) ) ( not ( = ?auto_390066 ?auto_390069 ) ) ( not ( = ?auto_390066 ?auto_390070 ) ) ( not ( = ?auto_390066 ?auto_390071 ) ) ( not ( = ?auto_390066 ?auto_390072 ) ) ( not ( = ?auto_390066 ?auto_390073 ) ) ( not ( = ?auto_390066 ?auto_390074 ) ) ( not ( = ?auto_390066 ?auto_390075 ) ) ( not ( = ?auto_390066 ?auto_390076 ) ) ( not ( = ?auto_390067 ?auto_390068 ) ) ( not ( = ?auto_390067 ?auto_390069 ) ) ( not ( = ?auto_390067 ?auto_390070 ) ) ( not ( = ?auto_390067 ?auto_390071 ) ) ( not ( = ?auto_390067 ?auto_390072 ) ) ( not ( = ?auto_390067 ?auto_390073 ) ) ( not ( = ?auto_390067 ?auto_390074 ) ) ( not ( = ?auto_390067 ?auto_390075 ) ) ( not ( = ?auto_390067 ?auto_390076 ) ) ( not ( = ?auto_390068 ?auto_390069 ) ) ( not ( = ?auto_390068 ?auto_390070 ) ) ( not ( = ?auto_390068 ?auto_390071 ) ) ( not ( = ?auto_390068 ?auto_390072 ) ) ( not ( = ?auto_390068 ?auto_390073 ) ) ( not ( = ?auto_390068 ?auto_390074 ) ) ( not ( = ?auto_390068 ?auto_390075 ) ) ( not ( = ?auto_390068 ?auto_390076 ) ) ( not ( = ?auto_390069 ?auto_390070 ) ) ( not ( = ?auto_390069 ?auto_390071 ) ) ( not ( = ?auto_390069 ?auto_390072 ) ) ( not ( = ?auto_390069 ?auto_390073 ) ) ( not ( = ?auto_390069 ?auto_390074 ) ) ( not ( = ?auto_390069 ?auto_390075 ) ) ( not ( = ?auto_390069 ?auto_390076 ) ) ( not ( = ?auto_390070 ?auto_390071 ) ) ( not ( = ?auto_390070 ?auto_390072 ) ) ( not ( = ?auto_390070 ?auto_390073 ) ) ( not ( = ?auto_390070 ?auto_390074 ) ) ( not ( = ?auto_390070 ?auto_390075 ) ) ( not ( = ?auto_390070 ?auto_390076 ) ) ( not ( = ?auto_390071 ?auto_390072 ) ) ( not ( = ?auto_390071 ?auto_390073 ) ) ( not ( = ?auto_390071 ?auto_390074 ) ) ( not ( = ?auto_390071 ?auto_390075 ) ) ( not ( = ?auto_390071 ?auto_390076 ) ) ( not ( = ?auto_390072 ?auto_390073 ) ) ( not ( = ?auto_390072 ?auto_390074 ) ) ( not ( = ?auto_390072 ?auto_390075 ) ) ( not ( = ?auto_390072 ?auto_390076 ) ) ( not ( = ?auto_390073 ?auto_390074 ) ) ( not ( = ?auto_390073 ?auto_390075 ) ) ( not ( = ?auto_390073 ?auto_390076 ) ) ( not ( = ?auto_390074 ?auto_390075 ) ) ( not ( = ?auto_390074 ?auto_390076 ) ) ( not ( = ?auto_390075 ?auto_390076 ) ) ( ON ?auto_390074 ?auto_390075 ) ( ON ?auto_390073 ?auto_390074 ) ( ON ?auto_390072 ?auto_390073 ) ( ON ?auto_390071 ?auto_390072 ) ( ON ?auto_390070 ?auto_390071 ) ( ON ?auto_390069 ?auto_390070 ) ( ON ?auto_390068 ?auto_390069 ) ( ON ?auto_390067 ?auto_390068 ) ( ON ?auto_390066 ?auto_390067 ) ( ON ?auto_390065 ?auto_390066 ) ( CLEAR ?auto_390063 ) ( ON ?auto_390064 ?auto_390065 ) ( CLEAR ?auto_390064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_390063 ?auto_390064 )
      ( MAKE-13PILE ?auto_390063 ?auto_390064 ?auto_390065 ?auto_390066 ?auto_390067 ?auto_390068 ?auto_390069 ?auto_390070 ?auto_390071 ?auto_390072 ?auto_390073 ?auto_390074 ?auto_390075 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_390117 - BLOCK
      ?auto_390118 - BLOCK
      ?auto_390119 - BLOCK
      ?auto_390120 - BLOCK
      ?auto_390121 - BLOCK
      ?auto_390122 - BLOCK
      ?auto_390123 - BLOCK
      ?auto_390124 - BLOCK
      ?auto_390125 - BLOCK
      ?auto_390126 - BLOCK
      ?auto_390127 - BLOCK
      ?auto_390128 - BLOCK
      ?auto_390129 - BLOCK
    )
    :vars
    (
      ?auto_390130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390129 ?auto_390130 ) ( not ( = ?auto_390117 ?auto_390118 ) ) ( not ( = ?auto_390117 ?auto_390119 ) ) ( not ( = ?auto_390117 ?auto_390120 ) ) ( not ( = ?auto_390117 ?auto_390121 ) ) ( not ( = ?auto_390117 ?auto_390122 ) ) ( not ( = ?auto_390117 ?auto_390123 ) ) ( not ( = ?auto_390117 ?auto_390124 ) ) ( not ( = ?auto_390117 ?auto_390125 ) ) ( not ( = ?auto_390117 ?auto_390126 ) ) ( not ( = ?auto_390117 ?auto_390127 ) ) ( not ( = ?auto_390117 ?auto_390128 ) ) ( not ( = ?auto_390117 ?auto_390129 ) ) ( not ( = ?auto_390117 ?auto_390130 ) ) ( not ( = ?auto_390118 ?auto_390119 ) ) ( not ( = ?auto_390118 ?auto_390120 ) ) ( not ( = ?auto_390118 ?auto_390121 ) ) ( not ( = ?auto_390118 ?auto_390122 ) ) ( not ( = ?auto_390118 ?auto_390123 ) ) ( not ( = ?auto_390118 ?auto_390124 ) ) ( not ( = ?auto_390118 ?auto_390125 ) ) ( not ( = ?auto_390118 ?auto_390126 ) ) ( not ( = ?auto_390118 ?auto_390127 ) ) ( not ( = ?auto_390118 ?auto_390128 ) ) ( not ( = ?auto_390118 ?auto_390129 ) ) ( not ( = ?auto_390118 ?auto_390130 ) ) ( not ( = ?auto_390119 ?auto_390120 ) ) ( not ( = ?auto_390119 ?auto_390121 ) ) ( not ( = ?auto_390119 ?auto_390122 ) ) ( not ( = ?auto_390119 ?auto_390123 ) ) ( not ( = ?auto_390119 ?auto_390124 ) ) ( not ( = ?auto_390119 ?auto_390125 ) ) ( not ( = ?auto_390119 ?auto_390126 ) ) ( not ( = ?auto_390119 ?auto_390127 ) ) ( not ( = ?auto_390119 ?auto_390128 ) ) ( not ( = ?auto_390119 ?auto_390129 ) ) ( not ( = ?auto_390119 ?auto_390130 ) ) ( not ( = ?auto_390120 ?auto_390121 ) ) ( not ( = ?auto_390120 ?auto_390122 ) ) ( not ( = ?auto_390120 ?auto_390123 ) ) ( not ( = ?auto_390120 ?auto_390124 ) ) ( not ( = ?auto_390120 ?auto_390125 ) ) ( not ( = ?auto_390120 ?auto_390126 ) ) ( not ( = ?auto_390120 ?auto_390127 ) ) ( not ( = ?auto_390120 ?auto_390128 ) ) ( not ( = ?auto_390120 ?auto_390129 ) ) ( not ( = ?auto_390120 ?auto_390130 ) ) ( not ( = ?auto_390121 ?auto_390122 ) ) ( not ( = ?auto_390121 ?auto_390123 ) ) ( not ( = ?auto_390121 ?auto_390124 ) ) ( not ( = ?auto_390121 ?auto_390125 ) ) ( not ( = ?auto_390121 ?auto_390126 ) ) ( not ( = ?auto_390121 ?auto_390127 ) ) ( not ( = ?auto_390121 ?auto_390128 ) ) ( not ( = ?auto_390121 ?auto_390129 ) ) ( not ( = ?auto_390121 ?auto_390130 ) ) ( not ( = ?auto_390122 ?auto_390123 ) ) ( not ( = ?auto_390122 ?auto_390124 ) ) ( not ( = ?auto_390122 ?auto_390125 ) ) ( not ( = ?auto_390122 ?auto_390126 ) ) ( not ( = ?auto_390122 ?auto_390127 ) ) ( not ( = ?auto_390122 ?auto_390128 ) ) ( not ( = ?auto_390122 ?auto_390129 ) ) ( not ( = ?auto_390122 ?auto_390130 ) ) ( not ( = ?auto_390123 ?auto_390124 ) ) ( not ( = ?auto_390123 ?auto_390125 ) ) ( not ( = ?auto_390123 ?auto_390126 ) ) ( not ( = ?auto_390123 ?auto_390127 ) ) ( not ( = ?auto_390123 ?auto_390128 ) ) ( not ( = ?auto_390123 ?auto_390129 ) ) ( not ( = ?auto_390123 ?auto_390130 ) ) ( not ( = ?auto_390124 ?auto_390125 ) ) ( not ( = ?auto_390124 ?auto_390126 ) ) ( not ( = ?auto_390124 ?auto_390127 ) ) ( not ( = ?auto_390124 ?auto_390128 ) ) ( not ( = ?auto_390124 ?auto_390129 ) ) ( not ( = ?auto_390124 ?auto_390130 ) ) ( not ( = ?auto_390125 ?auto_390126 ) ) ( not ( = ?auto_390125 ?auto_390127 ) ) ( not ( = ?auto_390125 ?auto_390128 ) ) ( not ( = ?auto_390125 ?auto_390129 ) ) ( not ( = ?auto_390125 ?auto_390130 ) ) ( not ( = ?auto_390126 ?auto_390127 ) ) ( not ( = ?auto_390126 ?auto_390128 ) ) ( not ( = ?auto_390126 ?auto_390129 ) ) ( not ( = ?auto_390126 ?auto_390130 ) ) ( not ( = ?auto_390127 ?auto_390128 ) ) ( not ( = ?auto_390127 ?auto_390129 ) ) ( not ( = ?auto_390127 ?auto_390130 ) ) ( not ( = ?auto_390128 ?auto_390129 ) ) ( not ( = ?auto_390128 ?auto_390130 ) ) ( not ( = ?auto_390129 ?auto_390130 ) ) ( ON ?auto_390128 ?auto_390129 ) ( ON ?auto_390127 ?auto_390128 ) ( ON ?auto_390126 ?auto_390127 ) ( ON ?auto_390125 ?auto_390126 ) ( ON ?auto_390124 ?auto_390125 ) ( ON ?auto_390123 ?auto_390124 ) ( ON ?auto_390122 ?auto_390123 ) ( ON ?auto_390121 ?auto_390122 ) ( ON ?auto_390120 ?auto_390121 ) ( ON ?auto_390119 ?auto_390120 ) ( ON ?auto_390118 ?auto_390119 ) ( ON ?auto_390117 ?auto_390118 ) ( CLEAR ?auto_390117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_390117 )
      ( MAKE-13PILE ?auto_390117 ?auto_390118 ?auto_390119 ?auto_390120 ?auto_390121 ?auto_390122 ?auto_390123 ?auto_390124 ?auto_390125 ?auto_390126 ?auto_390127 ?auto_390128 ?auto_390129 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390172 - BLOCK
      ?auto_390173 - BLOCK
      ?auto_390174 - BLOCK
      ?auto_390175 - BLOCK
      ?auto_390176 - BLOCK
      ?auto_390177 - BLOCK
      ?auto_390178 - BLOCK
      ?auto_390179 - BLOCK
      ?auto_390180 - BLOCK
      ?auto_390181 - BLOCK
      ?auto_390182 - BLOCK
      ?auto_390183 - BLOCK
      ?auto_390184 - BLOCK
      ?auto_390185 - BLOCK
    )
    :vars
    (
      ?auto_390186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_390184 ) ( ON ?auto_390185 ?auto_390186 ) ( CLEAR ?auto_390185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_390172 ) ( ON ?auto_390173 ?auto_390172 ) ( ON ?auto_390174 ?auto_390173 ) ( ON ?auto_390175 ?auto_390174 ) ( ON ?auto_390176 ?auto_390175 ) ( ON ?auto_390177 ?auto_390176 ) ( ON ?auto_390178 ?auto_390177 ) ( ON ?auto_390179 ?auto_390178 ) ( ON ?auto_390180 ?auto_390179 ) ( ON ?auto_390181 ?auto_390180 ) ( ON ?auto_390182 ?auto_390181 ) ( ON ?auto_390183 ?auto_390182 ) ( ON ?auto_390184 ?auto_390183 ) ( not ( = ?auto_390172 ?auto_390173 ) ) ( not ( = ?auto_390172 ?auto_390174 ) ) ( not ( = ?auto_390172 ?auto_390175 ) ) ( not ( = ?auto_390172 ?auto_390176 ) ) ( not ( = ?auto_390172 ?auto_390177 ) ) ( not ( = ?auto_390172 ?auto_390178 ) ) ( not ( = ?auto_390172 ?auto_390179 ) ) ( not ( = ?auto_390172 ?auto_390180 ) ) ( not ( = ?auto_390172 ?auto_390181 ) ) ( not ( = ?auto_390172 ?auto_390182 ) ) ( not ( = ?auto_390172 ?auto_390183 ) ) ( not ( = ?auto_390172 ?auto_390184 ) ) ( not ( = ?auto_390172 ?auto_390185 ) ) ( not ( = ?auto_390172 ?auto_390186 ) ) ( not ( = ?auto_390173 ?auto_390174 ) ) ( not ( = ?auto_390173 ?auto_390175 ) ) ( not ( = ?auto_390173 ?auto_390176 ) ) ( not ( = ?auto_390173 ?auto_390177 ) ) ( not ( = ?auto_390173 ?auto_390178 ) ) ( not ( = ?auto_390173 ?auto_390179 ) ) ( not ( = ?auto_390173 ?auto_390180 ) ) ( not ( = ?auto_390173 ?auto_390181 ) ) ( not ( = ?auto_390173 ?auto_390182 ) ) ( not ( = ?auto_390173 ?auto_390183 ) ) ( not ( = ?auto_390173 ?auto_390184 ) ) ( not ( = ?auto_390173 ?auto_390185 ) ) ( not ( = ?auto_390173 ?auto_390186 ) ) ( not ( = ?auto_390174 ?auto_390175 ) ) ( not ( = ?auto_390174 ?auto_390176 ) ) ( not ( = ?auto_390174 ?auto_390177 ) ) ( not ( = ?auto_390174 ?auto_390178 ) ) ( not ( = ?auto_390174 ?auto_390179 ) ) ( not ( = ?auto_390174 ?auto_390180 ) ) ( not ( = ?auto_390174 ?auto_390181 ) ) ( not ( = ?auto_390174 ?auto_390182 ) ) ( not ( = ?auto_390174 ?auto_390183 ) ) ( not ( = ?auto_390174 ?auto_390184 ) ) ( not ( = ?auto_390174 ?auto_390185 ) ) ( not ( = ?auto_390174 ?auto_390186 ) ) ( not ( = ?auto_390175 ?auto_390176 ) ) ( not ( = ?auto_390175 ?auto_390177 ) ) ( not ( = ?auto_390175 ?auto_390178 ) ) ( not ( = ?auto_390175 ?auto_390179 ) ) ( not ( = ?auto_390175 ?auto_390180 ) ) ( not ( = ?auto_390175 ?auto_390181 ) ) ( not ( = ?auto_390175 ?auto_390182 ) ) ( not ( = ?auto_390175 ?auto_390183 ) ) ( not ( = ?auto_390175 ?auto_390184 ) ) ( not ( = ?auto_390175 ?auto_390185 ) ) ( not ( = ?auto_390175 ?auto_390186 ) ) ( not ( = ?auto_390176 ?auto_390177 ) ) ( not ( = ?auto_390176 ?auto_390178 ) ) ( not ( = ?auto_390176 ?auto_390179 ) ) ( not ( = ?auto_390176 ?auto_390180 ) ) ( not ( = ?auto_390176 ?auto_390181 ) ) ( not ( = ?auto_390176 ?auto_390182 ) ) ( not ( = ?auto_390176 ?auto_390183 ) ) ( not ( = ?auto_390176 ?auto_390184 ) ) ( not ( = ?auto_390176 ?auto_390185 ) ) ( not ( = ?auto_390176 ?auto_390186 ) ) ( not ( = ?auto_390177 ?auto_390178 ) ) ( not ( = ?auto_390177 ?auto_390179 ) ) ( not ( = ?auto_390177 ?auto_390180 ) ) ( not ( = ?auto_390177 ?auto_390181 ) ) ( not ( = ?auto_390177 ?auto_390182 ) ) ( not ( = ?auto_390177 ?auto_390183 ) ) ( not ( = ?auto_390177 ?auto_390184 ) ) ( not ( = ?auto_390177 ?auto_390185 ) ) ( not ( = ?auto_390177 ?auto_390186 ) ) ( not ( = ?auto_390178 ?auto_390179 ) ) ( not ( = ?auto_390178 ?auto_390180 ) ) ( not ( = ?auto_390178 ?auto_390181 ) ) ( not ( = ?auto_390178 ?auto_390182 ) ) ( not ( = ?auto_390178 ?auto_390183 ) ) ( not ( = ?auto_390178 ?auto_390184 ) ) ( not ( = ?auto_390178 ?auto_390185 ) ) ( not ( = ?auto_390178 ?auto_390186 ) ) ( not ( = ?auto_390179 ?auto_390180 ) ) ( not ( = ?auto_390179 ?auto_390181 ) ) ( not ( = ?auto_390179 ?auto_390182 ) ) ( not ( = ?auto_390179 ?auto_390183 ) ) ( not ( = ?auto_390179 ?auto_390184 ) ) ( not ( = ?auto_390179 ?auto_390185 ) ) ( not ( = ?auto_390179 ?auto_390186 ) ) ( not ( = ?auto_390180 ?auto_390181 ) ) ( not ( = ?auto_390180 ?auto_390182 ) ) ( not ( = ?auto_390180 ?auto_390183 ) ) ( not ( = ?auto_390180 ?auto_390184 ) ) ( not ( = ?auto_390180 ?auto_390185 ) ) ( not ( = ?auto_390180 ?auto_390186 ) ) ( not ( = ?auto_390181 ?auto_390182 ) ) ( not ( = ?auto_390181 ?auto_390183 ) ) ( not ( = ?auto_390181 ?auto_390184 ) ) ( not ( = ?auto_390181 ?auto_390185 ) ) ( not ( = ?auto_390181 ?auto_390186 ) ) ( not ( = ?auto_390182 ?auto_390183 ) ) ( not ( = ?auto_390182 ?auto_390184 ) ) ( not ( = ?auto_390182 ?auto_390185 ) ) ( not ( = ?auto_390182 ?auto_390186 ) ) ( not ( = ?auto_390183 ?auto_390184 ) ) ( not ( = ?auto_390183 ?auto_390185 ) ) ( not ( = ?auto_390183 ?auto_390186 ) ) ( not ( = ?auto_390184 ?auto_390185 ) ) ( not ( = ?auto_390184 ?auto_390186 ) ) ( not ( = ?auto_390185 ?auto_390186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_390185 ?auto_390186 )
      ( !STACK ?auto_390185 ?auto_390184 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390230 - BLOCK
      ?auto_390231 - BLOCK
      ?auto_390232 - BLOCK
      ?auto_390233 - BLOCK
      ?auto_390234 - BLOCK
      ?auto_390235 - BLOCK
      ?auto_390236 - BLOCK
      ?auto_390237 - BLOCK
      ?auto_390238 - BLOCK
      ?auto_390239 - BLOCK
      ?auto_390240 - BLOCK
      ?auto_390241 - BLOCK
      ?auto_390242 - BLOCK
      ?auto_390243 - BLOCK
    )
    :vars
    (
      ?auto_390244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390243 ?auto_390244 ) ( ON-TABLE ?auto_390230 ) ( ON ?auto_390231 ?auto_390230 ) ( ON ?auto_390232 ?auto_390231 ) ( ON ?auto_390233 ?auto_390232 ) ( ON ?auto_390234 ?auto_390233 ) ( ON ?auto_390235 ?auto_390234 ) ( ON ?auto_390236 ?auto_390235 ) ( ON ?auto_390237 ?auto_390236 ) ( ON ?auto_390238 ?auto_390237 ) ( ON ?auto_390239 ?auto_390238 ) ( ON ?auto_390240 ?auto_390239 ) ( ON ?auto_390241 ?auto_390240 ) ( not ( = ?auto_390230 ?auto_390231 ) ) ( not ( = ?auto_390230 ?auto_390232 ) ) ( not ( = ?auto_390230 ?auto_390233 ) ) ( not ( = ?auto_390230 ?auto_390234 ) ) ( not ( = ?auto_390230 ?auto_390235 ) ) ( not ( = ?auto_390230 ?auto_390236 ) ) ( not ( = ?auto_390230 ?auto_390237 ) ) ( not ( = ?auto_390230 ?auto_390238 ) ) ( not ( = ?auto_390230 ?auto_390239 ) ) ( not ( = ?auto_390230 ?auto_390240 ) ) ( not ( = ?auto_390230 ?auto_390241 ) ) ( not ( = ?auto_390230 ?auto_390242 ) ) ( not ( = ?auto_390230 ?auto_390243 ) ) ( not ( = ?auto_390230 ?auto_390244 ) ) ( not ( = ?auto_390231 ?auto_390232 ) ) ( not ( = ?auto_390231 ?auto_390233 ) ) ( not ( = ?auto_390231 ?auto_390234 ) ) ( not ( = ?auto_390231 ?auto_390235 ) ) ( not ( = ?auto_390231 ?auto_390236 ) ) ( not ( = ?auto_390231 ?auto_390237 ) ) ( not ( = ?auto_390231 ?auto_390238 ) ) ( not ( = ?auto_390231 ?auto_390239 ) ) ( not ( = ?auto_390231 ?auto_390240 ) ) ( not ( = ?auto_390231 ?auto_390241 ) ) ( not ( = ?auto_390231 ?auto_390242 ) ) ( not ( = ?auto_390231 ?auto_390243 ) ) ( not ( = ?auto_390231 ?auto_390244 ) ) ( not ( = ?auto_390232 ?auto_390233 ) ) ( not ( = ?auto_390232 ?auto_390234 ) ) ( not ( = ?auto_390232 ?auto_390235 ) ) ( not ( = ?auto_390232 ?auto_390236 ) ) ( not ( = ?auto_390232 ?auto_390237 ) ) ( not ( = ?auto_390232 ?auto_390238 ) ) ( not ( = ?auto_390232 ?auto_390239 ) ) ( not ( = ?auto_390232 ?auto_390240 ) ) ( not ( = ?auto_390232 ?auto_390241 ) ) ( not ( = ?auto_390232 ?auto_390242 ) ) ( not ( = ?auto_390232 ?auto_390243 ) ) ( not ( = ?auto_390232 ?auto_390244 ) ) ( not ( = ?auto_390233 ?auto_390234 ) ) ( not ( = ?auto_390233 ?auto_390235 ) ) ( not ( = ?auto_390233 ?auto_390236 ) ) ( not ( = ?auto_390233 ?auto_390237 ) ) ( not ( = ?auto_390233 ?auto_390238 ) ) ( not ( = ?auto_390233 ?auto_390239 ) ) ( not ( = ?auto_390233 ?auto_390240 ) ) ( not ( = ?auto_390233 ?auto_390241 ) ) ( not ( = ?auto_390233 ?auto_390242 ) ) ( not ( = ?auto_390233 ?auto_390243 ) ) ( not ( = ?auto_390233 ?auto_390244 ) ) ( not ( = ?auto_390234 ?auto_390235 ) ) ( not ( = ?auto_390234 ?auto_390236 ) ) ( not ( = ?auto_390234 ?auto_390237 ) ) ( not ( = ?auto_390234 ?auto_390238 ) ) ( not ( = ?auto_390234 ?auto_390239 ) ) ( not ( = ?auto_390234 ?auto_390240 ) ) ( not ( = ?auto_390234 ?auto_390241 ) ) ( not ( = ?auto_390234 ?auto_390242 ) ) ( not ( = ?auto_390234 ?auto_390243 ) ) ( not ( = ?auto_390234 ?auto_390244 ) ) ( not ( = ?auto_390235 ?auto_390236 ) ) ( not ( = ?auto_390235 ?auto_390237 ) ) ( not ( = ?auto_390235 ?auto_390238 ) ) ( not ( = ?auto_390235 ?auto_390239 ) ) ( not ( = ?auto_390235 ?auto_390240 ) ) ( not ( = ?auto_390235 ?auto_390241 ) ) ( not ( = ?auto_390235 ?auto_390242 ) ) ( not ( = ?auto_390235 ?auto_390243 ) ) ( not ( = ?auto_390235 ?auto_390244 ) ) ( not ( = ?auto_390236 ?auto_390237 ) ) ( not ( = ?auto_390236 ?auto_390238 ) ) ( not ( = ?auto_390236 ?auto_390239 ) ) ( not ( = ?auto_390236 ?auto_390240 ) ) ( not ( = ?auto_390236 ?auto_390241 ) ) ( not ( = ?auto_390236 ?auto_390242 ) ) ( not ( = ?auto_390236 ?auto_390243 ) ) ( not ( = ?auto_390236 ?auto_390244 ) ) ( not ( = ?auto_390237 ?auto_390238 ) ) ( not ( = ?auto_390237 ?auto_390239 ) ) ( not ( = ?auto_390237 ?auto_390240 ) ) ( not ( = ?auto_390237 ?auto_390241 ) ) ( not ( = ?auto_390237 ?auto_390242 ) ) ( not ( = ?auto_390237 ?auto_390243 ) ) ( not ( = ?auto_390237 ?auto_390244 ) ) ( not ( = ?auto_390238 ?auto_390239 ) ) ( not ( = ?auto_390238 ?auto_390240 ) ) ( not ( = ?auto_390238 ?auto_390241 ) ) ( not ( = ?auto_390238 ?auto_390242 ) ) ( not ( = ?auto_390238 ?auto_390243 ) ) ( not ( = ?auto_390238 ?auto_390244 ) ) ( not ( = ?auto_390239 ?auto_390240 ) ) ( not ( = ?auto_390239 ?auto_390241 ) ) ( not ( = ?auto_390239 ?auto_390242 ) ) ( not ( = ?auto_390239 ?auto_390243 ) ) ( not ( = ?auto_390239 ?auto_390244 ) ) ( not ( = ?auto_390240 ?auto_390241 ) ) ( not ( = ?auto_390240 ?auto_390242 ) ) ( not ( = ?auto_390240 ?auto_390243 ) ) ( not ( = ?auto_390240 ?auto_390244 ) ) ( not ( = ?auto_390241 ?auto_390242 ) ) ( not ( = ?auto_390241 ?auto_390243 ) ) ( not ( = ?auto_390241 ?auto_390244 ) ) ( not ( = ?auto_390242 ?auto_390243 ) ) ( not ( = ?auto_390242 ?auto_390244 ) ) ( not ( = ?auto_390243 ?auto_390244 ) ) ( CLEAR ?auto_390241 ) ( ON ?auto_390242 ?auto_390243 ) ( CLEAR ?auto_390242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_390230 ?auto_390231 ?auto_390232 ?auto_390233 ?auto_390234 ?auto_390235 ?auto_390236 ?auto_390237 ?auto_390238 ?auto_390239 ?auto_390240 ?auto_390241 ?auto_390242 )
      ( MAKE-14PILE ?auto_390230 ?auto_390231 ?auto_390232 ?auto_390233 ?auto_390234 ?auto_390235 ?auto_390236 ?auto_390237 ?auto_390238 ?auto_390239 ?auto_390240 ?auto_390241 ?auto_390242 ?auto_390243 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390288 - BLOCK
      ?auto_390289 - BLOCK
      ?auto_390290 - BLOCK
      ?auto_390291 - BLOCK
      ?auto_390292 - BLOCK
      ?auto_390293 - BLOCK
      ?auto_390294 - BLOCK
      ?auto_390295 - BLOCK
      ?auto_390296 - BLOCK
      ?auto_390297 - BLOCK
      ?auto_390298 - BLOCK
      ?auto_390299 - BLOCK
      ?auto_390300 - BLOCK
      ?auto_390301 - BLOCK
    )
    :vars
    (
      ?auto_390302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390301 ?auto_390302 ) ( ON-TABLE ?auto_390288 ) ( ON ?auto_390289 ?auto_390288 ) ( ON ?auto_390290 ?auto_390289 ) ( ON ?auto_390291 ?auto_390290 ) ( ON ?auto_390292 ?auto_390291 ) ( ON ?auto_390293 ?auto_390292 ) ( ON ?auto_390294 ?auto_390293 ) ( ON ?auto_390295 ?auto_390294 ) ( ON ?auto_390296 ?auto_390295 ) ( ON ?auto_390297 ?auto_390296 ) ( ON ?auto_390298 ?auto_390297 ) ( not ( = ?auto_390288 ?auto_390289 ) ) ( not ( = ?auto_390288 ?auto_390290 ) ) ( not ( = ?auto_390288 ?auto_390291 ) ) ( not ( = ?auto_390288 ?auto_390292 ) ) ( not ( = ?auto_390288 ?auto_390293 ) ) ( not ( = ?auto_390288 ?auto_390294 ) ) ( not ( = ?auto_390288 ?auto_390295 ) ) ( not ( = ?auto_390288 ?auto_390296 ) ) ( not ( = ?auto_390288 ?auto_390297 ) ) ( not ( = ?auto_390288 ?auto_390298 ) ) ( not ( = ?auto_390288 ?auto_390299 ) ) ( not ( = ?auto_390288 ?auto_390300 ) ) ( not ( = ?auto_390288 ?auto_390301 ) ) ( not ( = ?auto_390288 ?auto_390302 ) ) ( not ( = ?auto_390289 ?auto_390290 ) ) ( not ( = ?auto_390289 ?auto_390291 ) ) ( not ( = ?auto_390289 ?auto_390292 ) ) ( not ( = ?auto_390289 ?auto_390293 ) ) ( not ( = ?auto_390289 ?auto_390294 ) ) ( not ( = ?auto_390289 ?auto_390295 ) ) ( not ( = ?auto_390289 ?auto_390296 ) ) ( not ( = ?auto_390289 ?auto_390297 ) ) ( not ( = ?auto_390289 ?auto_390298 ) ) ( not ( = ?auto_390289 ?auto_390299 ) ) ( not ( = ?auto_390289 ?auto_390300 ) ) ( not ( = ?auto_390289 ?auto_390301 ) ) ( not ( = ?auto_390289 ?auto_390302 ) ) ( not ( = ?auto_390290 ?auto_390291 ) ) ( not ( = ?auto_390290 ?auto_390292 ) ) ( not ( = ?auto_390290 ?auto_390293 ) ) ( not ( = ?auto_390290 ?auto_390294 ) ) ( not ( = ?auto_390290 ?auto_390295 ) ) ( not ( = ?auto_390290 ?auto_390296 ) ) ( not ( = ?auto_390290 ?auto_390297 ) ) ( not ( = ?auto_390290 ?auto_390298 ) ) ( not ( = ?auto_390290 ?auto_390299 ) ) ( not ( = ?auto_390290 ?auto_390300 ) ) ( not ( = ?auto_390290 ?auto_390301 ) ) ( not ( = ?auto_390290 ?auto_390302 ) ) ( not ( = ?auto_390291 ?auto_390292 ) ) ( not ( = ?auto_390291 ?auto_390293 ) ) ( not ( = ?auto_390291 ?auto_390294 ) ) ( not ( = ?auto_390291 ?auto_390295 ) ) ( not ( = ?auto_390291 ?auto_390296 ) ) ( not ( = ?auto_390291 ?auto_390297 ) ) ( not ( = ?auto_390291 ?auto_390298 ) ) ( not ( = ?auto_390291 ?auto_390299 ) ) ( not ( = ?auto_390291 ?auto_390300 ) ) ( not ( = ?auto_390291 ?auto_390301 ) ) ( not ( = ?auto_390291 ?auto_390302 ) ) ( not ( = ?auto_390292 ?auto_390293 ) ) ( not ( = ?auto_390292 ?auto_390294 ) ) ( not ( = ?auto_390292 ?auto_390295 ) ) ( not ( = ?auto_390292 ?auto_390296 ) ) ( not ( = ?auto_390292 ?auto_390297 ) ) ( not ( = ?auto_390292 ?auto_390298 ) ) ( not ( = ?auto_390292 ?auto_390299 ) ) ( not ( = ?auto_390292 ?auto_390300 ) ) ( not ( = ?auto_390292 ?auto_390301 ) ) ( not ( = ?auto_390292 ?auto_390302 ) ) ( not ( = ?auto_390293 ?auto_390294 ) ) ( not ( = ?auto_390293 ?auto_390295 ) ) ( not ( = ?auto_390293 ?auto_390296 ) ) ( not ( = ?auto_390293 ?auto_390297 ) ) ( not ( = ?auto_390293 ?auto_390298 ) ) ( not ( = ?auto_390293 ?auto_390299 ) ) ( not ( = ?auto_390293 ?auto_390300 ) ) ( not ( = ?auto_390293 ?auto_390301 ) ) ( not ( = ?auto_390293 ?auto_390302 ) ) ( not ( = ?auto_390294 ?auto_390295 ) ) ( not ( = ?auto_390294 ?auto_390296 ) ) ( not ( = ?auto_390294 ?auto_390297 ) ) ( not ( = ?auto_390294 ?auto_390298 ) ) ( not ( = ?auto_390294 ?auto_390299 ) ) ( not ( = ?auto_390294 ?auto_390300 ) ) ( not ( = ?auto_390294 ?auto_390301 ) ) ( not ( = ?auto_390294 ?auto_390302 ) ) ( not ( = ?auto_390295 ?auto_390296 ) ) ( not ( = ?auto_390295 ?auto_390297 ) ) ( not ( = ?auto_390295 ?auto_390298 ) ) ( not ( = ?auto_390295 ?auto_390299 ) ) ( not ( = ?auto_390295 ?auto_390300 ) ) ( not ( = ?auto_390295 ?auto_390301 ) ) ( not ( = ?auto_390295 ?auto_390302 ) ) ( not ( = ?auto_390296 ?auto_390297 ) ) ( not ( = ?auto_390296 ?auto_390298 ) ) ( not ( = ?auto_390296 ?auto_390299 ) ) ( not ( = ?auto_390296 ?auto_390300 ) ) ( not ( = ?auto_390296 ?auto_390301 ) ) ( not ( = ?auto_390296 ?auto_390302 ) ) ( not ( = ?auto_390297 ?auto_390298 ) ) ( not ( = ?auto_390297 ?auto_390299 ) ) ( not ( = ?auto_390297 ?auto_390300 ) ) ( not ( = ?auto_390297 ?auto_390301 ) ) ( not ( = ?auto_390297 ?auto_390302 ) ) ( not ( = ?auto_390298 ?auto_390299 ) ) ( not ( = ?auto_390298 ?auto_390300 ) ) ( not ( = ?auto_390298 ?auto_390301 ) ) ( not ( = ?auto_390298 ?auto_390302 ) ) ( not ( = ?auto_390299 ?auto_390300 ) ) ( not ( = ?auto_390299 ?auto_390301 ) ) ( not ( = ?auto_390299 ?auto_390302 ) ) ( not ( = ?auto_390300 ?auto_390301 ) ) ( not ( = ?auto_390300 ?auto_390302 ) ) ( not ( = ?auto_390301 ?auto_390302 ) ) ( ON ?auto_390300 ?auto_390301 ) ( CLEAR ?auto_390298 ) ( ON ?auto_390299 ?auto_390300 ) ( CLEAR ?auto_390299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_390288 ?auto_390289 ?auto_390290 ?auto_390291 ?auto_390292 ?auto_390293 ?auto_390294 ?auto_390295 ?auto_390296 ?auto_390297 ?auto_390298 ?auto_390299 )
      ( MAKE-14PILE ?auto_390288 ?auto_390289 ?auto_390290 ?auto_390291 ?auto_390292 ?auto_390293 ?auto_390294 ?auto_390295 ?auto_390296 ?auto_390297 ?auto_390298 ?auto_390299 ?auto_390300 ?auto_390301 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390346 - BLOCK
      ?auto_390347 - BLOCK
      ?auto_390348 - BLOCK
      ?auto_390349 - BLOCK
      ?auto_390350 - BLOCK
      ?auto_390351 - BLOCK
      ?auto_390352 - BLOCK
      ?auto_390353 - BLOCK
      ?auto_390354 - BLOCK
      ?auto_390355 - BLOCK
      ?auto_390356 - BLOCK
      ?auto_390357 - BLOCK
      ?auto_390358 - BLOCK
      ?auto_390359 - BLOCK
    )
    :vars
    (
      ?auto_390360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390359 ?auto_390360 ) ( ON-TABLE ?auto_390346 ) ( ON ?auto_390347 ?auto_390346 ) ( ON ?auto_390348 ?auto_390347 ) ( ON ?auto_390349 ?auto_390348 ) ( ON ?auto_390350 ?auto_390349 ) ( ON ?auto_390351 ?auto_390350 ) ( ON ?auto_390352 ?auto_390351 ) ( ON ?auto_390353 ?auto_390352 ) ( ON ?auto_390354 ?auto_390353 ) ( ON ?auto_390355 ?auto_390354 ) ( not ( = ?auto_390346 ?auto_390347 ) ) ( not ( = ?auto_390346 ?auto_390348 ) ) ( not ( = ?auto_390346 ?auto_390349 ) ) ( not ( = ?auto_390346 ?auto_390350 ) ) ( not ( = ?auto_390346 ?auto_390351 ) ) ( not ( = ?auto_390346 ?auto_390352 ) ) ( not ( = ?auto_390346 ?auto_390353 ) ) ( not ( = ?auto_390346 ?auto_390354 ) ) ( not ( = ?auto_390346 ?auto_390355 ) ) ( not ( = ?auto_390346 ?auto_390356 ) ) ( not ( = ?auto_390346 ?auto_390357 ) ) ( not ( = ?auto_390346 ?auto_390358 ) ) ( not ( = ?auto_390346 ?auto_390359 ) ) ( not ( = ?auto_390346 ?auto_390360 ) ) ( not ( = ?auto_390347 ?auto_390348 ) ) ( not ( = ?auto_390347 ?auto_390349 ) ) ( not ( = ?auto_390347 ?auto_390350 ) ) ( not ( = ?auto_390347 ?auto_390351 ) ) ( not ( = ?auto_390347 ?auto_390352 ) ) ( not ( = ?auto_390347 ?auto_390353 ) ) ( not ( = ?auto_390347 ?auto_390354 ) ) ( not ( = ?auto_390347 ?auto_390355 ) ) ( not ( = ?auto_390347 ?auto_390356 ) ) ( not ( = ?auto_390347 ?auto_390357 ) ) ( not ( = ?auto_390347 ?auto_390358 ) ) ( not ( = ?auto_390347 ?auto_390359 ) ) ( not ( = ?auto_390347 ?auto_390360 ) ) ( not ( = ?auto_390348 ?auto_390349 ) ) ( not ( = ?auto_390348 ?auto_390350 ) ) ( not ( = ?auto_390348 ?auto_390351 ) ) ( not ( = ?auto_390348 ?auto_390352 ) ) ( not ( = ?auto_390348 ?auto_390353 ) ) ( not ( = ?auto_390348 ?auto_390354 ) ) ( not ( = ?auto_390348 ?auto_390355 ) ) ( not ( = ?auto_390348 ?auto_390356 ) ) ( not ( = ?auto_390348 ?auto_390357 ) ) ( not ( = ?auto_390348 ?auto_390358 ) ) ( not ( = ?auto_390348 ?auto_390359 ) ) ( not ( = ?auto_390348 ?auto_390360 ) ) ( not ( = ?auto_390349 ?auto_390350 ) ) ( not ( = ?auto_390349 ?auto_390351 ) ) ( not ( = ?auto_390349 ?auto_390352 ) ) ( not ( = ?auto_390349 ?auto_390353 ) ) ( not ( = ?auto_390349 ?auto_390354 ) ) ( not ( = ?auto_390349 ?auto_390355 ) ) ( not ( = ?auto_390349 ?auto_390356 ) ) ( not ( = ?auto_390349 ?auto_390357 ) ) ( not ( = ?auto_390349 ?auto_390358 ) ) ( not ( = ?auto_390349 ?auto_390359 ) ) ( not ( = ?auto_390349 ?auto_390360 ) ) ( not ( = ?auto_390350 ?auto_390351 ) ) ( not ( = ?auto_390350 ?auto_390352 ) ) ( not ( = ?auto_390350 ?auto_390353 ) ) ( not ( = ?auto_390350 ?auto_390354 ) ) ( not ( = ?auto_390350 ?auto_390355 ) ) ( not ( = ?auto_390350 ?auto_390356 ) ) ( not ( = ?auto_390350 ?auto_390357 ) ) ( not ( = ?auto_390350 ?auto_390358 ) ) ( not ( = ?auto_390350 ?auto_390359 ) ) ( not ( = ?auto_390350 ?auto_390360 ) ) ( not ( = ?auto_390351 ?auto_390352 ) ) ( not ( = ?auto_390351 ?auto_390353 ) ) ( not ( = ?auto_390351 ?auto_390354 ) ) ( not ( = ?auto_390351 ?auto_390355 ) ) ( not ( = ?auto_390351 ?auto_390356 ) ) ( not ( = ?auto_390351 ?auto_390357 ) ) ( not ( = ?auto_390351 ?auto_390358 ) ) ( not ( = ?auto_390351 ?auto_390359 ) ) ( not ( = ?auto_390351 ?auto_390360 ) ) ( not ( = ?auto_390352 ?auto_390353 ) ) ( not ( = ?auto_390352 ?auto_390354 ) ) ( not ( = ?auto_390352 ?auto_390355 ) ) ( not ( = ?auto_390352 ?auto_390356 ) ) ( not ( = ?auto_390352 ?auto_390357 ) ) ( not ( = ?auto_390352 ?auto_390358 ) ) ( not ( = ?auto_390352 ?auto_390359 ) ) ( not ( = ?auto_390352 ?auto_390360 ) ) ( not ( = ?auto_390353 ?auto_390354 ) ) ( not ( = ?auto_390353 ?auto_390355 ) ) ( not ( = ?auto_390353 ?auto_390356 ) ) ( not ( = ?auto_390353 ?auto_390357 ) ) ( not ( = ?auto_390353 ?auto_390358 ) ) ( not ( = ?auto_390353 ?auto_390359 ) ) ( not ( = ?auto_390353 ?auto_390360 ) ) ( not ( = ?auto_390354 ?auto_390355 ) ) ( not ( = ?auto_390354 ?auto_390356 ) ) ( not ( = ?auto_390354 ?auto_390357 ) ) ( not ( = ?auto_390354 ?auto_390358 ) ) ( not ( = ?auto_390354 ?auto_390359 ) ) ( not ( = ?auto_390354 ?auto_390360 ) ) ( not ( = ?auto_390355 ?auto_390356 ) ) ( not ( = ?auto_390355 ?auto_390357 ) ) ( not ( = ?auto_390355 ?auto_390358 ) ) ( not ( = ?auto_390355 ?auto_390359 ) ) ( not ( = ?auto_390355 ?auto_390360 ) ) ( not ( = ?auto_390356 ?auto_390357 ) ) ( not ( = ?auto_390356 ?auto_390358 ) ) ( not ( = ?auto_390356 ?auto_390359 ) ) ( not ( = ?auto_390356 ?auto_390360 ) ) ( not ( = ?auto_390357 ?auto_390358 ) ) ( not ( = ?auto_390357 ?auto_390359 ) ) ( not ( = ?auto_390357 ?auto_390360 ) ) ( not ( = ?auto_390358 ?auto_390359 ) ) ( not ( = ?auto_390358 ?auto_390360 ) ) ( not ( = ?auto_390359 ?auto_390360 ) ) ( ON ?auto_390358 ?auto_390359 ) ( ON ?auto_390357 ?auto_390358 ) ( CLEAR ?auto_390355 ) ( ON ?auto_390356 ?auto_390357 ) ( CLEAR ?auto_390356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_390346 ?auto_390347 ?auto_390348 ?auto_390349 ?auto_390350 ?auto_390351 ?auto_390352 ?auto_390353 ?auto_390354 ?auto_390355 ?auto_390356 )
      ( MAKE-14PILE ?auto_390346 ?auto_390347 ?auto_390348 ?auto_390349 ?auto_390350 ?auto_390351 ?auto_390352 ?auto_390353 ?auto_390354 ?auto_390355 ?auto_390356 ?auto_390357 ?auto_390358 ?auto_390359 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390404 - BLOCK
      ?auto_390405 - BLOCK
      ?auto_390406 - BLOCK
      ?auto_390407 - BLOCK
      ?auto_390408 - BLOCK
      ?auto_390409 - BLOCK
      ?auto_390410 - BLOCK
      ?auto_390411 - BLOCK
      ?auto_390412 - BLOCK
      ?auto_390413 - BLOCK
      ?auto_390414 - BLOCK
      ?auto_390415 - BLOCK
      ?auto_390416 - BLOCK
      ?auto_390417 - BLOCK
    )
    :vars
    (
      ?auto_390418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390417 ?auto_390418 ) ( ON-TABLE ?auto_390404 ) ( ON ?auto_390405 ?auto_390404 ) ( ON ?auto_390406 ?auto_390405 ) ( ON ?auto_390407 ?auto_390406 ) ( ON ?auto_390408 ?auto_390407 ) ( ON ?auto_390409 ?auto_390408 ) ( ON ?auto_390410 ?auto_390409 ) ( ON ?auto_390411 ?auto_390410 ) ( ON ?auto_390412 ?auto_390411 ) ( not ( = ?auto_390404 ?auto_390405 ) ) ( not ( = ?auto_390404 ?auto_390406 ) ) ( not ( = ?auto_390404 ?auto_390407 ) ) ( not ( = ?auto_390404 ?auto_390408 ) ) ( not ( = ?auto_390404 ?auto_390409 ) ) ( not ( = ?auto_390404 ?auto_390410 ) ) ( not ( = ?auto_390404 ?auto_390411 ) ) ( not ( = ?auto_390404 ?auto_390412 ) ) ( not ( = ?auto_390404 ?auto_390413 ) ) ( not ( = ?auto_390404 ?auto_390414 ) ) ( not ( = ?auto_390404 ?auto_390415 ) ) ( not ( = ?auto_390404 ?auto_390416 ) ) ( not ( = ?auto_390404 ?auto_390417 ) ) ( not ( = ?auto_390404 ?auto_390418 ) ) ( not ( = ?auto_390405 ?auto_390406 ) ) ( not ( = ?auto_390405 ?auto_390407 ) ) ( not ( = ?auto_390405 ?auto_390408 ) ) ( not ( = ?auto_390405 ?auto_390409 ) ) ( not ( = ?auto_390405 ?auto_390410 ) ) ( not ( = ?auto_390405 ?auto_390411 ) ) ( not ( = ?auto_390405 ?auto_390412 ) ) ( not ( = ?auto_390405 ?auto_390413 ) ) ( not ( = ?auto_390405 ?auto_390414 ) ) ( not ( = ?auto_390405 ?auto_390415 ) ) ( not ( = ?auto_390405 ?auto_390416 ) ) ( not ( = ?auto_390405 ?auto_390417 ) ) ( not ( = ?auto_390405 ?auto_390418 ) ) ( not ( = ?auto_390406 ?auto_390407 ) ) ( not ( = ?auto_390406 ?auto_390408 ) ) ( not ( = ?auto_390406 ?auto_390409 ) ) ( not ( = ?auto_390406 ?auto_390410 ) ) ( not ( = ?auto_390406 ?auto_390411 ) ) ( not ( = ?auto_390406 ?auto_390412 ) ) ( not ( = ?auto_390406 ?auto_390413 ) ) ( not ( = ?auto_390406 ?auto_390414 ) ) ( not ( = ?auto_390406 ?auto_390415 ) ) ( not ( = ?auto_390406 ?auto_390416 ) ) ( not ( = ?auto_390406 ?auto_390417 ) ) ( not ( = ?auto_390406 ?auto_390418 ) ) ( not ( = ?auto_390407 ?auto_390408 ) ) ( not ( = ?auto_390407 ?auto_390409 ) ) ( not ( = ?auto_390407 ?auto_390410 ) ) ( not ( = ?auto_390407 ?auto_390411 ) ) ( not ( = ?auto_390407 ?auto_390412 ) ) ( not ( = ?auto_390407 ?auto_390413 ) ) ( not ( = ?auto_390407 ?auto_390414 ) ) ( not ( = ?auto_390407 ?auto_390415 ) ) ( not ( = ?auto_390407 ?auto_390416 ) ) ( not ( = ?auto_390407 ?auto_390417 ) ) ( not ( = ?auto_390407 ?auto_390418 ) ) ( not ( = ?auto_390408 ?auto_390409 ) ) ( not ( = ?auto_390408 ?auto_390410 ) ) ( not ( = ?auto_390408 ?auto_390411 ) ) ( not ( = ?auto_390408 ?auto_390412 ) ) ( not ( = ?auto_390408 ?auto_390413 ) ) ( not ( = ?auto_390408 ?auto_390414 ) ) ( not ( = ?auto_390408 ?auto_390415 ) ) ( not ( = ?auto_390408 ?auto_390416 ) ) ( not ( = ?auto_390408 ?auto_390417 ) ) ( not ( = ?auto_390408 ?auto_390418 ) ) ( not ( = ?auto_390409 ?auto_390410 ) ) ( not ( = ?auto_390409 ?auto_390411 ) ) ( not ( = ?auto_390409 ?auto_390412 ) ) ( not ( = ?auto_390409 ?auto_390413 ) ) ( not ( = ?auto_390409 ?auto_390414 ) ) ( not ( = ?auto_390409 ?auto_390415 ) ) ( not ( = ?auto_390409 ?auto_390416 ) ) ( not ( = ?auto_390409 ?auto_390417 ) ) ( not ( = ?auto_390409 ?auto_390418 ) ) ( not ( = ?auto_390410 ?auto_390411 ) ) ( not ( = ?auto_390410 ?auto_390412 ) ) ( not ( = ?auto_390410 ?auto_390413 ) ) ( not ( = ?auto_390410 ?auto_390414 ) ) ( not ( = ?auto_390410 ?auto_390415 ) ) ( not ( = ?auto_390410 ?auto_390416 ) ) ( not ( = ?auto_390410 ?auto_390417 ) ) ( not ( = ?auto_390410 ?auto_390418 ) ) ( not ( = ?auto_390411 ?auto_390412 ) ) ( not ( = ?auto_390411 ?auto_390413 ) ) ( not ( = ?auto_390411 ?auto_390414 ) ) ( not ( = ?auto_390411 ?auto_390415 ) ) ( not ( = ?auto_390411 ?auto_390416 ) ) ( not ( = ?auto_390411 ?auto_390417 ) ) ( not ( = ?auto_390411 ?auto_390418 ) ) ( not ( = ?auto_390412 ?auto_390413 ) ) ( not ( = ?auto_390412 ?auto_390414 ) ) ( not ( = ?auto_390412 ?auto_390415 ) ) ( not ( = ?auto_390412 ?auto_390416 ) ) ( not ( = ?auto_390412 ?auto_390417 ) ) ( not ( = ?auto_390412 ?auto_390418 ) ) ( not ( = ?auto_390413 ?auto_390414 ) ) ( not ( = ?auto_390413 ?auto_390415 ) ) ( not ( = ?auto_390413 ?auto_390416 ) ) ( not ( = ?auto_390413 ?auto_390417 ) ) ( not ( = ?auto_390413 ?auto_390418 ) ) ( not ( = ?auto_390414 ?auto_390415 ) ) ( not ( = ?auto_390414 ?auto_390416 ) ) ( not ( = ?auto_390414 ?auto_390417 ) ) ( not ( = ?auto_390414 ?auto_390418 ) ) ( not ( = ?auto_390415 ?auto_390416 ) ) ( not ( = ?auto_390415 ?auto_390417 ) ) ( not ( = ?auto_390415 ?auto_390418 ) ) ( not ( = ?auto_390416 ?auto_390417 ) ) ( not ( = ?auto_390416 ?auto_390418 ) ) ( not ( = ?auto_390417 ?auto_390418 ) ) ( ON ?auto_390416 ?auto_390417 ) ( ON ?auto_390415 ?auto_390416 ) ( ON ?auto_390414 ?auto_390415 ) ( CLEAR ?auto_390412 ) ( ON ?auto_390413 ?auto_390414 ) ( CLEAR ?auto_390413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_390404 ?auto_390405 ?auto_390406 ?auto_390407 ?auto_390408 ?auto_390409 ?auto_390410 ?auto_390411 ?auto_390412 ?auto_390413 )
      ( MAKE-14PILE ?auto_390404 ?auto_390405 ?auto_390406 ?auto_390407 ?auto_390408 ?auto_390409 ?auto_390410 ?auto_390411 ?auto_390412 ?auto_390413 ?auto_390414 ?auto_390415 ?auto_390416 ?auto_390417 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390462 - BLOCK
      ?auto_390463 - BLOCK
      ?auto_390464 - BLOCK
      ?auto_390465 - BLOCK
      ?auto_390466 - BLOCK
      ?auto_390467 - BLOCK
      ?auto_390468 - BLOCK
      ?auto_390469 - BLOCK
      ?auto_390470 - BLOCK
      ?auto_390471 - BLOCK
      ?auto_390472 - BLOCK
      ?auto_390473 - BLOCK
      ?auto_390474 - BLOCK
      ?auto_390475 - BLOCK
    )
    :vars
    (
      ?auto_390476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390475 ?auto_390476 ) ( ON-TABLE ?auto_390462 ) ( ON ?auto_390463 ?auto_390462 ) ( ON ?auto_390464 ?auto_390463 ) ( ON ?auto_390465 ?auto_390464 ) ( ON ?auto_390466 ?auto_390465 ) ( ON ?auto_390467 ?auto_390466 ) ( ON ?auto_390468 ?auto_390467 ) ( ON ?auto_390469 ?auto_390468 ) ( not ( = ?auto_390462 ?auto_390463 ) ) ( not ( = ?auto_390462 ?auto_390464 ) ) ( not ( = ?auto_390462 ?auto_390465 ) ) ( not ( = ?auto_390462 ?auto_390466 ) ) ( not ( = ?auto_390462 ?auto_390467 ) ) ( not ( = ?auto_390462 ?auto_390468 ) ) ( not ( = ?auto_390462 ?auto_390469 ) ) ( not ( = ?auto_390462 ?auto_390470 ) ) ( not ( = ?auto_390462 ?auto_390471 ) ) ( not ( = ?auto_390462 ?auto_390472 ) ) ( not ( = ?auto_390462 ?auto_390473 ) ) ( not ( = ?auto_390462 ?auto_390474 ) ) ( not ( = ?auto_390462 ?auto_390475 ) ) ( not ( = ?auto_390462 ?auto_390476 ) ) ( not ( = ?auto_390463 ?auto_390464 ) ) ( not ( = ?auto_390463 ?auto_390465 ) ) ( not ( = ?auto_390463 ?auto_390466 ) ) ( not ( = ?auto_390463 ?auto_390467 ) ) ( not ( = ?auto_390463 ?auto_390468 ) ) ( not ( = ?auto_390463 ?auto_390469 ) ) ( not ( = ?auto_390463 ?auto_390470 ) ) ( not ( = ?auto_390463 ?auto_390471 ) ) ( not ( = ?auto_390463 ?auto_390472 ) ) ( not ( = ?auto_390463 ?auto_390473 ) ) ( not ( = ?auto_390463 ?auto_390474 ) ) ( not ( = ?auto_390463 ?auto_390475 ) ) ( not ( = ?auto_390463 ?auto_390476 ) ) ( not ( = ?auto_390464 ?auto_390465 ) ) ( not ( = ?auto_390464 ?auto_390466 ) ) ( not ( = ?auto_390464 ?auto_390467 ) ) ( not ( = ?auto_390464 ?auto_390468 ) ) ( not ( = ?auto_390464 ?auto_390469 ) ) ( not ( = ?auto_390464 ?auto_390470 ) ) ( not ( = ?auto_390464 ?auto_390471 ) ) ( not ( = ?auto_390464 ?auto_390472 ) ) ( not ( = ?auto_390464 ?auto_390473 ) ) ( not ( = ?auto_390464 ?auto_390474 ) ) ( not ( = ?auto_390464 ?auto_390475 ) ) ( not ( = ?auto_390464 ?auto_390476 ) ) ( not ( = ?auto_390465 ?auto_390466 ) ) ( not ( = ?auto_390465 ?auto_390467 ) ) ( not ( = ?auto_390465 ?auto_390468 ) ) ( not ( = ?auto_390465 ?auto_390469 ) ) ( not ( = ?auto_390465 ?auto_390470 ) ) ( not ( = ?auto_390465 ?auto_390471 ) ) ( not ( = ?auto_390465 ?auto_390472 ) ) ( not ( = ?auto_390465 ?auto_390473 ) ) ( not ( = ?auto_390465 ?auto_390474 ) ) ( not ( = ?auto_390465 ?auto_390475 ) ) ( not ( = ?auto_390465 ?auto_390476 ) ) ( not ( = ?auto_390466 ?auto_390467 ) ) ( not ( = ?auto_390466 ?auto_390468 ) ) ( not ( = ?auto_390466 ?auto_390469 ) ) ( not ( = ?auto_390466 ?auto_390470 ) ) ( not ( = ?auto_390466 ?auto_390471 ) ) ( not ( = ?auto_390466 ?auto_390472 ) ) ( not ( = ?auto_390466 ?auto_390473 ) ) ( not ( = ?auto_390466 ?auto_390474 ) ) ( not ( = ?auto_390466 ?auto_390475 ) ) ( not ( = ?auto_390466 ?auto_390476 ) ) ( not ( = ?auto_390467 ?auto_390468 ) ) ( not ( = ?auto_390467 ?auto_390469 ) ) ( not ( = ?auto_390467 ?auto_390470 ) ) ( not ( = ?auto_390467 ?auto_390471 ) ) ( not ( = ?auto_390467 ?auto_390472 ) ) ( not ( = ?auto_390467 ?auto_390473 ) ) ( not ( = ?auto_390467 ?auto_390474 ) ) ( not ( = ?auto_390467 ?auto_390475 ) ) ( not ( = ?auto_390467 ?auto_390476 ) ) ( not ( = ?auto_390468 ?auto_390469 ) ) ( not ( = ?auto_390468 ?auto_390470 ) ) ( not ( = ?auto_390468 ?auto_390471 ) ) ( not ( = ?auto_390468 ?auto_390472 ) ) ( not ( = ?auto_390468 ?auto_390473 ) ) ( not ( = ?auto_390468 ?auto_390474 ) ) ( not ( = ?auto_390468 ?auto_390475 ) ) ( not ( = ?auto_390468 ?auto_390476 ) ) ( not ( = ?auto_390469 ?auto_390470 ) ) ( not ( = ?auto_390469 ?auto_390471 ) ) ( not ( = ?auto_390469 ?auto_390472 ) ) ( not ( = ?auto_390469 ?auto_390473 ) ) ( not ( = ?auto_390469 ?auto_390474 ) ) ( not ( = ?auto_390469 ?auto_390475 ) ) ( not ( = ?auto_390469 ?auto_390476 ) ) ( not ( = ?auto_390470 ?auto_390471 ) ) ( not ( = ?auto_390470 ?auto_390472 ) ) ( not ( = ?auto_390470 ?auto_390473 ) ) ( not ( = ?auto_390470 ?auto_390474 ) ) ( not ( = ?auto_390470 ?auto_390475 ) ) ( not ( = ?auto_390470 ?auto_390476 ) ) ( not ( = ?auto_390471 ?auto_390472 ) ) ( not ( = ?auto_390471 ?auto_390473 ) ) ( not ( = ?auto_390471 ?auto_390474 ) ) ( not ( = ?auto_390471 ?auto_390475 ) ) ( not ( = ?auto_390471 ?auto_390476 ) ) ( not ( = ?auto_390472 ?auto_390473 ) ) ( not ( = ?auto_390472 ?auto_390474 ) ) ( not ( = ?auto_390472 ?auto_390475 ) ) ( not ( = ?auto_390472 ?auto_390476 ) ) ( not ( = ?auto_390473 ?auto_390474 ) ) ( not ( = ?auto_390473 ?auto_390475 ) ) ( not ( = ?auto_390473 ?auto_390476 ) ) ( not ( = ?auto_390474 ?auto_390475 ) ) ( not ( = ?auto_390474 ?auto_390476 ) ) ( not ( = ?auto_390475 ?auto_390476 ) ) ( ON ?auto_390474 ?auto_390475 ) ( ON ?auto_390473 ?auto_390474 ) ( ON ?auto_390472 ?auto_390473 ) ( ON ?auto_390471 ?auto_390472 ) ( CLEAR ?auto_390469 ) ( ON ?auto_390470 ?auto_390471 ) ( CLEAR ?auto_390470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_390462 ?auto_390463 ?auto_390464 ?auto_390465 ?auto_390466 ?auto_390467 ?auto_390468 ?auto_390469 ?auto_390470 )
      ( MAKE-14PILE ?auto_390462 ?auto_390463 ?auto_390464 ?auto_390465 ?auto_390466 ?auto_390467 ?auto_390468 ?auto_390469 ?auto_390470 ?auto_390471 ?auto_390472 ?auto_390473 ?auto_390474 ?auto_390475 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390520 - BLOCK
      ?auto_390521 - BLOCK
      ?auto_390522 - BLOCK
      ?auto_390523 - BLOCK
      ?auto_390524 - BLOCK
      ?auto_390525 - BLOCK
      ?auto_390526 - BLOCK
      ?auto_390527 - BLOCK
      ?auto_390528 - BLOCK
      ?auto_390529 - BLOCK
      ?auto_390530 - BLOCK
      ?auto_390531 - BLOCK
      ?auto_390532 - BLOCK
      ?auto_390533 - BLOCK
    )
    :vars
    (
      ?auto_390534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390533 ?auto_390534 ) ( ON-TABLE ?auto_390520 ) ( ON ?auto_390521 ?auto_390520 ) ( ON ?auto_390522 ?auto_390521 ) ( ON ?auto_390523 ?auto_390522 ) ( ON ?auto_390524 ?auto_390523 ) ( ON ?auto_390525 ?auto_390524 ) ( ON ?auto_390526 ?auto_390525 ) ( not ( = ?auto_390520 ?auto_390521 ) ) ( not ( = ?auto_390520 ?auto_390522 ) ) ( not ( = ?auto_390520 ?auto_390523 ) ) ( not ( = ?auto_390520 ?auto_390524 ) ) ( not ( = ?auto_390520 ?auto_390525 ) ) ( not ( = ?auto_390520 ?auto_390526 ) ) ( not ( = ?auto_390520 ?auto_390527 ) ) ( not ( = ?auto_390520 ?auto_390528 ) ) ( not ( = ?auto_390520 ?auto_390529 ) ) ( not ( = ?auto_390520 ?auto_390530 ) ) ( not ( = ?auto_390520 ?auto_390531 ) ) ( not ( = ?auto_390520 ?auto_390532 ) ) ( not ( = ?auto_390520 ?auto_390533 ) ) ( not ( = ?auto_390520 ?auto_390534 ) ) ( not ( = ?auto_390521 ?auto_390522 ) ) ( not ( = ?auto_390521 ?auto_390523 ) ) ( not ( = ?auto_390521 ?auto_390524 ) ) ( not ( = ?auto_390521 ?auto_390525 ) ) ( not ( = ?auto_390521 ?auto_390526 ) ) ( not ( = ?auto_390521 ?auto_390527 ) ) ( not ( = ?auto_390521 ?auto_390528 ) ) ( not ( = ?auto_390521 ?auto_390529 ) ) ( not ( = ?auto_390521 ?auto_390530 ) ) ( not ( = ?auto_390521 ?auto_390531 ) ) ( not ( = ?auto_390521 ?auto_390532 ) ) ( not ( = ?auto_390521 ?auto_390533 ) ) ( not ( = ?auto_390521 ?auto_390534 ) ) ( not ( = ?auto_390522 ?auto_390523 ) ) ( not ( = ?auto_390522 ?auto_390524 ) ) ( not ( = ?auto_390522 ?auto_390525 ) ) ( not ( = ?auto_390522 ?auto_390526 ) ) ( not ( = ?auto_390522 ?auto_390527 ) ) ( not ( = ?auto_390522 ?auto_390528 ) ) ( not ( = ?auto_390522 ?auto_390529 ) ) ( not ( = ?auto_390522 ?auto_390530 ) ) ( not ( = ?auto_390522 ?auto_390531 ) ) ( not ( = ?auto_390522 ?auto_390532 ) ) ( not ( = ?auto_390522 ?auto_390533 ) ) ( not ( = ?auto_390522 ?auto_390534 ) ) ( not ( = ?auto_390523 ?auto_390524 ) ) ( not ( = ?auto_390523 ?auto_390525 ) ) ( not ( = ?auto_390523 ?auto_390526 ) ) ( not ( = ?auto_390523 ?auto_390527 ) ) ( not ( = ?auto_390523 ?auto_390528 ) ) ( not ( = ?auto_390523 ?auto_390529 ) ) ( not ( = ?auto_390523 ?auto_390530 ) ) ( not ( = ?auto_390523 ?auto_390531 ) ) ( not ( = ?auto_390523 ?auto_390532 ) ) ( not ( = ?auto_390523 ?auto_390533 ) ) ( not ( = ?auto_390523 ?auto_390534 ) ) ( not ( = ?auto_390524 ?auto_390525 ) ) ( not ( = ?auto_390524 ?auto_390526 ) ) ( not ( = ?auto_390524 ?auto_390527 ) ) ( not ( = ?auto_390524 ?auto_390528 ) ) ( not ( = ?auto_390524 ?auto_390529 ) ) ( not ( = ?auto_390524 ?auto_390530 ) ) ( not ( = ?auto_390524 ?auto_390531 ) ) ( not ( = ?auto_390524 ?auto_390532 ) ) ( not ( = ?auto_390524 ?auto_390533 ) ) ( not ( = ?auto_390524 ?auto_390534 ) ) ( not ( = ?auto_390525 ?auto_390526 ) ) ( not ( = ?auto_390525 ?auto_390527 ) ) ( not ( = ?auto_390525 ?auto_390528 ) ) ( not ( = ?auto_390525 ?auto_390529 ) ) ( not ( = ?auto_390525 ?auto_390530 ) ) ( not ( = ?auto_390525 ?auto_390531 ) ) ( not ( = ?auto_390525 ?auto_390532 ) ) ( not ( = ?auto_390525 ?auto_390533 ) ) ( not ( = ?auto_390525 ?auto_390534 ) ) ( not ( = ?auto_390526 ?auto_390527 ) ) ( not ( = ?auto_390526 ?auto_390528 ) ) ( not ( = ?auto_390526 ?auto_390529 ) ) ( not ( = ?auto_390526 ?auto_390530 ) ) ( not ( = ?auto_390526 ?auto_390531 ) ) ( not ( = ?auto_390526 ?auto_390532 ) ) ( not ( = ?auto_390526 ?auto_390533 ) ) ( not ( = ?auto_390526 ?auto_390534 ) ) ( not ( = ?auto_390527 ?auto_390528 ) ) ( not ( = ?auto_390527 ?auto_390529 ) ) ( not ( = ?auto_390527 ?auto_390530 ) ) ( not ( = ?auto_390527 ?auto_390531 ) ) ( not ( = ?auto_390527 ?auto_390532 ) ) ( not ( = ?auto_390527 ?auto_390533 ) ) ( not ( = ?auto_390527 ?auto_390534 ) ) ( not ( = ?auto_390528 ?auto_390529 ) ) ( not ( = ?auto_390528 ?auto_390530 ) ) ( not ( = ?auto_390528 ?auto_390531 ) ) ( not ( = ?auto_390528 ?auto_390532 ) ) ( not ( = ?auto_390528 ?auto_390533 ) ) ( not ( = ?auto_390528 ?auto_390534 ) ) ( not ( = ?auto_390529 ?auto_390530 ) ) ( not ( = ?auto_390529 ?auto_390531 ) ) ( not ( = ?auto_390529 ?auto_390532 ) ) ( not ( = ?auto_390529 ?auto_390533 ) ) ( not ( = ?auto_390529 ?auto_390534 ) ) ( not ( = ?auto_390530 ?auto_390531 ) ) ( not ( = ?auto_390530 ?auto_390532 ) ) ( not ( = ?auto_390530 ?auto_390533 ) ) ( not ( = ?auto_390530 ?auto_390534 ) ) ( not ( = ?auto_390531 ?auto_390532 ) ) ( not ( = ?auto_390531 ?auto_390533 ) ) ( not ( = ?auto_390531 ?auto_390534 ) ) ( not ( = ?auto_390532 ?auto_390533 ) ) ( not ( = ?auto_390532 ?auto_390534 ) ) ( not ( = ?auto_390533 ?auto_390534 ) ) ( ON ?auto_390532 ?auto_390533 ) ( ON ?auto_390531 ?auto_390532 ) ( ON ?auto_390530 ?auto_390531 ) ( ON ?auto_390529 ?auto_390530 ) ( ON ?auto_390528 ?auto_390529 ) ( CLEAR ?auto_390526 ) ( ON ?auto_390527 ?auto_390528 ) ( CLEAR ?auto_390527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_390520 ?auto_390521 ?auto_390522 ?auto_390523 ?auto_390524 ?auto_390525 ?auto_390526 ?auto_390527 )
      ( MAKE-14PILE ?auto_390520 ?auto_390521 ?auto_390522 ?auto_390523 ?auto_390524 ?auto_390525 ?auto_390526 ?auto_390527 ?auto_390528 ?auto_390529 ?auto_390530 ?auto_390531 ?auto_390532 ?auto_390533 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390578 - BLOCK
      ?auto_390579 - BLOCK
      ?auto_390580 - BLOCK
      ?auto_390581 - BLOCK
      ?auto_390582 - BLOCK
      ?auto_390583 - BLOCK
      ?auto_390584 - BLOCK
      ?auto_390585 - BLOCK
      ?auto_390586 - BLOCK
      ?auto_390587 - BLOCK
      ?auto_390588 - BLOCK
      ?auto_390589 - BLOCK
      ?auto_390590 - BLOCK
      ?auto_390591 - BLOCK
    )
    :vars
    (
      ?auto_390592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390591 ?auto_390592 ) ( ON-TABLE ?auto_390578 ) ( ON ?auto_390579 ?auto_390578 ) ( ON ?auto_390580 ?auto_390579 ) ( ON ?auto_390581 ?auto_390580 ) ( ON ?auto_390582 ?auto_390581 ) ( ON ?auto_390583 ?auto_390582 ) ( not ( = ?auto_390578 ?auto_390579 ) ) ( not ( = ?auto_390578 ?auto_390580 ) ) ( not ( = ?auto_390578 ?auto_390581 ) ) ( not ( = ?auto_390578 ?auto_390582 ) ) ( not ( = ?auto_390578 ?auto_390583 ) ) ( not ( = ?auto_390578 ?auto_390584 ) ) ( not ( = ?auto_390578 ?auto_390585 ) ) ( not ( = ?auto_390578 ?auto_390586 ) ) ( not ( = ?auto_390578 ?auto_390587 ) ) ( not ( = ?auto_390578 ?auto_390588 ) ) ( not ( = ?auto_390578 ?auto_390589 ) ) ( not ( = ?auto_390578 ?auto_390590 ) ) ( not ( = ?auto_390578 ?auto_390591 ) ) ( not ( = ?auto_390578 ?auto_390592 ) ) ( not ( = ?auto_390579 ?auto_390580 ) ) ( not ( = ?auto_390579 ?auto_390581 ) ) ( not ( = ?auto_390579 ?auto_390582 ) ) ( not ( = ?auto_390579 ?auto_390583 ) ) ( not ( = ?auto_390579 ?auto_390584 ) ) ( not ( = ?auto_390579 ?auto_390585 ) ) ( not ( = ?auto_390579 ?auto_390586 ) ) ( not ( = ?auto_390579 ?auto_390587 ) ) ( not ( = ?auto_390579 ?auto_390588 ) ) ( not ( = ?auto_390579 ?auto_390589 ) ) ( not ( = ?auto_390579 ?auto_390590 ) ) ( not ( = ?auto_390579 ?auto_390591 ) ) ( not ( = ?auto_390579 ?auto_390592 ) ) ( not ( = ?auto_390580 ?auto_390581 ) ) ( not ( = ?auto_390580 ?auto_390582 ) ) ( not ( = ?auto_390580 ?auto_390583 ) ) ( not ( = ?auto_390580 ?auto_390584 ) ) ( not ( = ?auto_390580 ?auto_390585 ) ) ( not ( = ?auto_390580 ?auto_390586 ) ) ( not ( = ?auto_390580 ?auto_390587 ) ) ( not ( = ?auto_390580 ?auto_390588 ) ) ( not ( = ?auto_390580 ?auto_390589 ) ) ( not ( = ?auto_390580 ?auto_390590 ) ) ( not ( = ?auto_390580 ?auto_390591 ) ) ( not ( = ?auto_390580 ?auto_390592 ) ) ( not ( = ?auto_390581 ?auto_390582 ) ) ( not ( = ?auto_390581 ?auto_390583 ) ) ( not ( = ?auto_390581 ?auto_390584 ) ) ( not ( = ?auto_390581 ?auto_390585 ) ) ( not ( = ?auto_390581 ?auto_390586 ) ) ( not ( = ?auto_390581 ?auto_390587 ) ) ( not ( = ?auto_390581 ?auto_390588 ) ) ( not ( = ?auto_390581 ?auto_390589 ) ) ( not ( = ?auto_390581 ?auto_390590 ) ) ( not ( = ?auto_390581 ?auto_390591 ) ) ( not ( = ?auto_390581 ?auto_390592 ) ) ( not ( = ?auto_390582 ?auto_390583 ) ) ( not ( = ?auto_390582 ?auto_390584 ) ) ( not ( = ?auto_390582 ?auto_390585 ) ) ( not ( = ?auto_390582 ?auto_390586 ) ) ( not ( = ?auto_390582 ?auto_390587 ) ) ( not ( = ?auto_390582 ?auto_390588 ) ) ( not ( = ?auto_390582 ?auto_390589 ) ) ( not ( = ?auto_390582 ?auto_390590 ) ) ( not ( = ?auto_390582 ?auto_390591 ) ) ( not ( = ?auto_390582 ?auto_390592 ) ) ( not ( = ?auto_390583 ?auto_390584 ) ) ( not ( = ?auto_390583 ?auto_390585 ) ) ( not ( = ?auto_390583 ?auto_390586 ) ) ( not ( = ?auto_390583 ?auto_390587 ) ) ( not ( = ?auto_390583 ?auto_390588 ) ) ( not ( = ?auto_390583 ?auto_390589 ) ) ( not ( = ?auto_390583 ?auto_390590 ) ) ( not ( = ?auto_390583 ?auto_390591 ) ) ( not ( = ?auto_390583 ?auto_390592 ) ) ( not ( = ?auto_390584 ?auto_390585 ) ) ( not ( = ?auto_390584 ?auto_390586 ) ) ( not ( = ?auto_390584 ?auto_390587 ) ) ( not ( = ?auto_390584 ?auto_390588 ) ) ( not ( = ?auto_390584 ?auto_390589 ) ) ( not ( = ?auto_390584 ?auto_390590 ) ) ( not ( = ?auto_390584 ?auto_390591 ) ) ( not ( = ?auto_390584 ?auto_390592 ) ) ( not ( = ?auto_390585 ?auto_390586 ) ) ( not ( = ?auto_390585 ?auto_390587 ) ) ( not ( = ?auto_390585 ?auto_390588 ) ) ( not ( = ?auto_390585 ?auto_390589 ) ) ( not ( = ?auto_390585 ?auto_390590 ) ) ( not ( = ?auto_390585 ?auto_390591 ) ) ( not ( = ?auto_390585 ?auto_390592 ) ) ( not ( = ?auto_390586 ?auto_390587 ) ) ( not ( = ?auto_390586 ?auto_390588 ) ) ( not ( = ?auto_390586 ?auto_390589 ) ) ( not ( = ?auto_390586 ?auto_390590 ) ) ( not ( = ?auto_390586 ?auto_390591 ) ) ( not ( = ?auto_390586 ?auto_390592 ) ) ( not ( = ?auto_390587 ?auto_390588 ) ) ( not ( = ?auto_390587 ?auto_390589 ) ) ( not ( = ?auto_390587 ?auto_390590 ) ) ( not ( = ?auto_390587 ?auto_390591 ) ) ( not ( = ?auto_390587 ?auto_390592 ) ) ( not ( = ?auto_390588 ?auto_390589 ) ) ( not ( = ?auto_390588 ?auto_390590 ) ) ( not ( = ?auto_390588 ?auto_390591 ) ) ( not ( = ?auto_390588 ?auto_390592 ) ) ( not ( = ?auto_390589 ?auto_390590 ) ) ( not ( = ?auto_390589 ?auto_390591 ) ) ( not ( = ?auto_390589 ?auto_390592 ) ) ( not ( = ?auto_390590 ?auto_390591 ) ) ( not ( = ?auto_390590 ?auto_390592 ) ) ( not ( = ?auto_390591 ?auto_390592 ) ) ( ON ?auto_390590 ?auto_390591 ) ( ON ?auto_390589 ?auto_390590 ) ( ON ?auto_390588 ?auto_390589 ) ( ON ?auto_390587 ?auto_390588 ) ( ON ?auto_390586 ?auto_390587 ) ( ON ?auto_390585 ?auto_390586 ) ( CLEAR ?auto_390583 ) ( ON ?auto_390584 ?auto_390585 ) ( CLEAR ?auto_390584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_390578 ?auto_390579 ?auto_390580 ?auto_390581 ?auto_390582 ?auto_390583 ?auto_390584 )
      ( MAKE-14PILE ?auto_390578 ?auto_390579 ?auto_390580 ?auto_390581 ?auto_390582 ?auto_390583 ?auto_390584 ?auto_390585 ?auto_390586 ?auto_390587 ?auto_390588 ?auto_390589 ?auto_390590 ?auto_390591 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390636 - BLOCK
      ?auto_390637 - BLOCK
      ?auto_390638 - BLOCK
      ?auto_390639 - BLOCK
      ?auto_390640 - BLOCK
      ?auto_390641 - BLOCK
      ?auto_390642 - BLOCK
      ?auto_390643 - BLOCK
      ?auto_390644 - BLOCK
      ?auto_390645 - BLOCK
      ?auto_390646 - BLOCK
      ?auto_390647 - BLOCK
      ?auto_390648 - BLOCK
      ?auto_390649 - BLOCK
    )
    :vars
    (
      ?auto_390650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390649 ?auto_390650 ) ( ON-TABLE ?auto_390636 ) ( ON ?auto_390637 ?auto_390636 ) ( ON ?auto_390638 ?auto_390637 ) ( ON ?auto_390639 ?auto_390638 ) ( ON ?auto_390640 ?auto_390639 ) ( not ( = ?auto_390636 ?auto_390637 ) ) ( not ( = ?auto_390636 ?auto_390638 ) ) ( not ( = ?auto_390636 ?auto_390639 ) ) ( not ( = ?auto_390636 ?auto_390640 ) ) ( not ( = ?auto_390636 ?auto_390641 ) ) ( not ( = ?auto_390636 ?auto_390642 ) ) ( not ( = ?auto_390636 ?auto_390643 ) ) ( not ( = ?auto_390636 ?auto_390644 ) ) ( not ( = ?auto_390636 ?auto_390645 ) ) ( not ( = ?auto_390636 ?auto_390646 ) ) ( not ( = ?auto_390636 ?auto_390647 ) ) ( not ( = ?auto_390636 ?auto_390648 ) ) ( not ( = ?auto_390636 ?auto_390649 ) ) ( not ( = ?auto_390636 ?auto_390650 ) ) ( not ( = ?auto_390637 ?auto_390638 ) ) ( not ( = ?auto_390637 ?auto_390639 ) ) ( not ( = ?auto_390637 ?auto_390640 ) ) ( not ( = ?auto_390637 ?auto_390641 ) ) ( not ( = ?auto_390637 ?auto_390642 ) ) ( not ( = ?auto_390637 ?auto_390643 ) ) ( not ( = ?auto_390637 ?auto_390644 ) ) ( not ( = ?auto_390637 ?auto_390645 ) ) ( not ( = ?auto_390637 ?auto_390646 ) ) ( not ( = ?auto_390637 ?auto_390647 ) ) ( not ( = ?auto_390637 ?auto_390648 ) ) ( not ( = ?auto_390637 ?auto_390649 ) ) ( not ( = ?auto_390637 ?auto_390650 ) ) ( not ( = ?auto_390638 ?auto_390639 ) ) ( not ( = ?auto_390638 ?auto_390640 ) ) ( not ( = ?auto_390638 ?auto_390641 ) ) ( not ( = ?auto_390638 ?auto_390642 ) ) ( not ( = ?auto_390638 ?auto_390643 ) ) ( not ( = ?auto_390638 ?auto_390644 ) ) ( not ( = ?auto_390638 ?auto_390645 ) ) ( not ( = ?auto_390638 ?auto_390646 ) ) ( not ( = ?auto_390638 ?auto_390647 ) ) ( not ( = ?auto_390638 ?auto_390648 ) ) ( not ( = ?auto_390638 ?auto_390649 ) ) ( not ( = ?auto_390638 ?auto_390650 ) ) ( not ( = ?auto_390639 ?auto_390640 ) ) ( not ( = ?auto_390639 ?auto_390641 ) ) ( not ( = ?auto_390639 ?auto_390642 ) ) ( not ( = ?auto_390639 ?auto_390643 ) ) ( not ( = ?auto_390639 ?auto_390644 ) ) ( not ( = ?auto_390639 ?auto_390645 ) ) ( not ( = ?auto_390639 ?auto_390646 ) ) ( not ( = ?auto_390639 ?auto_390647 ) ) ( not ( = ?auto_390639 ?auto_390648 ) ) ( not ( = ?auto_390639 ?auto_390649 ) ) ( not ( = ?auto_390639 ?auto_390650 ) ) ( not ( = ?auto_390640 ?auto_390641 ) ) ( not ( = ?auto_390640 ?auto_390642 ) ) ( not ( = ?auto_390640 ?auto_390643 ) ) ( not ( = ?auto_390640 ?auto_390644 ) ) ( not ( = ?auto_390640 ?auto_390645 ) ) ( not ( = ?auto_390640 ?auto_390646 ) ) ( not ( = ?auto_390640 ?auto_390647 ) ) ( not ( = ?auto_390640 ?auto_390648 ) ) ( not ( = ?auto_390640 ?auto_390649 ) ) ( not ( = ?auto_390640 ?auto_390650 ) ) ( not ( = ?auto_390641 ?auto_390642 ) ) ( not ( = ?auto_390641 ?auto_390643 ) ) ( not ( = ?auto_390641 ?auto_390644 ) ) ( not ( = ?auto_390641 ?auto_390645 ) ) ( not ( = ?auto_390641 ?auto_390646 ) ) ( not ( = ?auto_390641 ?auto_390647 ) ) ( not ( = ?auto_390641 ?auto_390648 ) ) ( not ( = ?auto_390641 ?auto_390649 ) ) ( not ( = ?auto_390641 ?auto_390650 ) ) ( not ( = ?auto_390642 ?auto_390643 ) ) ( not ( = ?auto_390642 ?auto_390644 ) ) ( not ( = ?auto_390642 ?auto_390645 ) ) ( not ( = ?auto_390642 ?auto_390646 ) ) ( not ( = ?auto_390642 ?auto_390647 ) ) ( not ( = ?auto_390642 ?auto_390648 ) ) ( not ( = ?auto_390642 ?auto_390649 ) ) ( not ( = ?auto_390642 ?auto_390650 ) ) ( not ( = ?auto_390643 ?auto_390644 ) ) ( not ( = ?auto_390643 ?auto_390645 ) ) ( not ( = ?auto_390643 ?auto_390646 ) ) ( not ( = ?auto_390643 ?auto_390647 ) ) ( not ( = ?auto_390643 ?auto_390648 ) ) ( not ( = ?auto_390643 ?auto_390649 ) ) ( not ( = ?auto_390643 ?auto_390650 ) ) ( not ( = ?auto_390644 ?auto_390645 ) ) ( not ( = ?auto_390644 ?auto_390646 ) ) ( not ( = ?auto_390644 ?auto_390647 ) ) ( not ( = ?auto_390644 ?auto_390648 ) ) ( not ( = ?auto_390644 ?auto_390649 ) ) ( not ( = ?auto_390644 ?auto_390650 ) ) ( not ( = ?auto_390645 ?auto_390646 ) ) ( not ( = ?auto_390645 ?auto_390647 ) ) ( not ( = ?auto_390645 ?auto_390648 ) ) ( not ( = ?auto_390645 ?auto_390649 ) ) ( not ( = ?auto_390645 ?auto_390650 ) ) ( not ( = ?auto_390646 ?auto_390647 ) ) ( not ( = ?auto_390646 ?auto_390648 ) ) ( not ( = ?auto_390646 ?auto_390649 ) ) ( not ( = ?auto_390646 ?auto_390650 ) ) ( not ( = ?auto_390647 ?auto_390648 ) ) ( not ( = ?auto_390647 ?auto_390649 ) ) ( not ( = ?auto_390647 ?auto_390650 ) ) ( not ( = ?auto_390648 ?auto_390649 ) ) ( not ( = ?auto_390648 ?auto_390650 ) ) ( not ( = ?auto_390649 ?auto_390650 ) ) ( ON ?auto_390648 ?auto_390649 ) ( ON ?auto_390647 ?auto_390648 ) ( ON ?auto_390646 ?auto_390647 ) ( ON ?auto_390645 ?auto_390646 ) ( ON ?auto_390644 ?auto_390645 ) ( ON ?auto_390643 ?auto_390644 ) ( ON ?auto_390642 ?auto_390643 ) ( CLEAR ?auto_390640 ) ( ON ?auto_390641 ?auto_390642 ) ( CLEAR ?auto_390641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_390636 ?auto_390637 ?auto_390638 ?auto_390639 ?auto_390640 ?auto_390641 )
      ( MAKE-14PILE ?auto_390636 ?auto_390637 ?auto_390638 ?auto_390639 ?auto_390640 ?auto_390641 ?auto_390642 ?auto_390643 ?auto_390644 ?auto_390645 ?auto_390646 ?auto_390647 ?auto_390648 ?auto_390649 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390694 - BLOCK
      ?auto_390695 - BLOCK
      ?auto_390696 - BLOCK
      ?auto_390697 - BLOCK
      ?auto_390698 - BLOCK
      ?auto_390699 - BLOCK
      ?auto_390700 - BLOCK
      ?auto_390701 - BLOCK
      ?auto_390702 - BLOCK
      ?auto_390703 - BLOCK
      ?auto_390704 - BLOCK
      ?auto_390705 - BLOCK
      ?auto_390706 - BLOCK
      ?auto_390707 - BLOCK
    )
    :vars
    (
      ?auto_390708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390707 ?auto_390708 ) ( ON-TABLE ?auto_390694 ) ( ON ?auto_390695 ?auto_390694 ) ( ON ?auto_390696 ?auto_390695 ) ( ON ?auto_390697 ?auto_390696 ) ( not ( = ?auto_390694 ?auto_390695 ) ) ( not ( = ?auto_390694 ?auto_390696 ) ) ( not ( = ?auto_390694 ?auto_390697 ) ) ( not ( = ?auto_390694 ?auto_390698 ) ) ( not ( = ?auto_390694 ?auto_390699 ) ) ( not ( = ?auto_390694 ?auto_390700 ) ) ( not ( = ?auto_390694 ?auto_390701 ) ) ( not ( = ?auto_390694 ?auto_390702 ) ) ( not ( = ?auto_390694 ?auto_390703 ) ) ( not ( = ?auto_390694 ?auto_390704 ) ) ( not ( = ?auto_390694 ?auto_390705 ) ) ( not ( = ?auto_390694 ?auto_390706 ) ) ( not ( = ?auto_390694 ?auto_390707 ) ) ( not ( = ?auto_390694 ?auto_390708 ) ) ( not ( = ?auto_390695 ?auto_390696 ) ) ( not ( = ?auto_390695 ?auto_390697 ) ) ( not ( = ?auto_390695 ?auto_390698 ) ) ( not ( = ?auto_390695 ?auto_390699 ) ) ( not ( = ?auto_390695 ?auto_390700 ) ) ( not ( = ?auto_390695 ?auto_390701 ) ) ( not ( = ?auto_390695 ?auto_390702 ) ) ( not ( = ?auto_390695 ?auto_390703 ) ) ( not ( = ?auto_390695 ?auto_390704 ) ) ( not ( = ?auto_390695 ?auto_390705 ) ) ( not ( = ?auto_390695 ?auto_390706 ) ) ( not ( = ?auto_390695 ?auto_390707 ) ) ( not ( = ?auto_390695 ?auto_390708 ) ) ( not ( = ?auto_390696 ?auto_390697 ) ) ( not ( = ?auto_390696 ?auto_390698 ) ) ( not ( = ?auto_390696 ?auto_390699 ) ) ( not ( = ?auto_390696 ?auto_390700 ) ) ( not ( = ?auto_390696 ?auto_390701 ) ) ( not ( = ?auto_390696 ?auto_390702 ) ) ( not ( = ?auto_390696 ?auto_390703 ) ) ( not ( = ?auto_390696 ?auto_390704 ) ) ( not ( = ?auto_390696 ?auto_390705 ) ) ( not ( = ?auto_390696 ?auto_390706 ) ) ( not ( = ?auto_390696 ?auto_390707 ) ) ( not ( = ?auto_390696 ?auto_390708 ) ) ( not ( = ?auto_390697 ?auto_390698 ) ) ( not ( = ?auto_390697 ?auto_390699 ) ) ( not ( = ?auto_390697 ?auto_390700 ) ) ( not ( = ?auto_390697 ?auto_390701 ) ) ( not ( = ?auto_390697 ?auto_390702 ) ) ( not ( = ?auto_390697 ?auto_390703 ) ) ( not ( = ?auto_390697 ?auto_390704 ) ) ( not ( = ?auto_390697 ?auto_390705 ) ) ( not ( = ?auto_390697 ?auto_390706 ) ) ( not ( = ?auto_390697 ?auto_390707 ) ) ( not ( = ?auto_390697 ?auto_390708 ) ) ( not ( = ?auto_390698 ?auto_390699 ) ) ( not ( = ?auto_390698 ?auto_390700 ) ) ( not ( = ?auto_390698 ?auto_390701 ) ) ( not ( = ?auto_390698 ?auto_390702 ) ) ( not ( = ?auto_390698 ?auto_390703 ) ) ( not ( = ?auto_390698 ?auto_390704 ) ) ( not ( = ?auto_390698 ?auto_390705 ) ) ( not ( = ?auto_390698 ?auto_390706 ) ) ( not ( = ?auto_390698 ?auto_390707 ) ) ( not ( = ?auto_390698 ?auto_390708 ) ) ( not ( = ?auto_390699 ?auto_390700 ) ) ( not ( = ?auto_390699 ?auto_390701 ) ) ( not ( = ?auto_390699 ?auto_390702 ) ) ( not ( = ?auto_390699 ?auto_390703 ) ) ( not ( = ?auto_390699 ?auto_390704 ) ) ( not ( = ?auto_390699 ?auto_390705 ) ) ( not ( = ?auto_390699 ?auto_390706 ) ) ( not ( = ?auto_390699 ?auto_390707 ) ) ( not ( = ?auto_390699 ?auto_390708 ) ) ( not ( = ?auto_390700 ?auto_390701 ) ) ( not ( = ?auto_390700 ?auto_390702 ) ) ( not ( = ?auto_390700 ?auto_390703 ) ) ( not ( = ?auto_390700 ?auto_390704 ) ) ( not ( = ?auto_390700 ?auto_390705 ) ) ( not ( = ?auto_390700 ?auto_390706 ) ) ( not ( = ?auto_390700 ?auto_390707 ) ) ( not ( = ?auto_390700 ?auto_390708 ) ) ( not ( = ?auto_390701 ?auto_390702 ) ) ( not ( = ?auto_390701 ?auto_390703 ) ) ( not ( = ?auto_390701 ?auto_390704 ) ) ( not ( = ?auto_390701 ?auto_390705 ) ) ( not ( = ?auto_390701 ?auto_390706 ) ) ( not ( = ?auto_390701 ?auto_390707 ) ) ( not ( = ?auto_390701 ?auto_390708 ) ) ( not ( = ?auto_390702 ?auto_390703 ) ) ( not ( = ?auto_390702 ?auto_390704 ) ) ( not ( = ?auto_390702 ?auto_390705 ) ) ( not ( = ?auto_390702 ?auto_390706 ) ) ( not ( = ?auto_390702 ?auto_390707 ) ) ( not ( = ?auto_390702 ?auto_390708 ) ) ( not ( = ?auto_390703 ?auto_390704 ) ) ( not ( = ?auto_390703 ?auto_390705 ) ) ( not ( = ?auto_390703 ?auto_390706 ) ) ( not ( = ?auto_390703 ?auto_390707 ) ) ( not ( = ?auto_390703 ?auto_390708 ) ) ( not ( = ?auto_390704 ?auto_390705 ) ) ( not ( = ?auto_390704 ?auto_390706 ) ) ( not ( = ?auto_390704 ?auto_390707 ) ) ( not ( = ?auto_390704 ?auto_390708 ) ) ( not ( = ?auto_390705 ?auto_390706 ) ) ( not ( = ?auto_390705 ?auto_390707 ) ) ( not ( = ?auto_390705 ?auto_390708 ) ) ( not ( = ?auto_390706 ?auto_390707 ) ) ( not ( = ?auto_390706 ?auto_390708 ) ) ( not ( = ?auto_390707 ?auto_390708 ) ) ( ON ?auto_390706 ?auto_390707 ) ( ON ?auto_390705 ?auto_390706 ) ( ON ?auto_390704 ?auto_390705 ) ( ON ?auto_390703 ?auto_390704 ) ( ON ?auto_390702 ?auto_390703 ) ( ON ?auto_390701 ?auto_390702 ) ( ON ?auto_390700 ?auto_390701 ) ( ON ?auto_390699 ?auto_390700 ) ( CLEAR ?auto_390697 ) ( ON ?auto_390698 ?auto_390699 ) ( CLEAR ?auto_390698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_390694 ?auto_390695 ?auto_390696 ?auto_390697 ?auto_390698 )
      ( MAKE-14PILE ?auto_390694 ?auto_390695 ?auto_390696 ?auto_390697 ?auto_390698 ?auto_390699 ?auto_390700 ?auto_390701 ?auto_390702 ?auto_390703 ?auto_390704 ?auto_390705 ?auto_390706 ?auto_390707 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390752 - BLOCK
      ?auto_390753 - BLOCK
      ?auto_390754 - BLOCK
      ?auto_390755 - BLOCK
      ?auto_390756 - BLOCK
      ?auto_390757 - BLOCK
      ?auto_390758 - BLOCK
      ?auto_390759 - BLOCK
      ?auto_390760 - BLOCK
      ?auto_390761 - BLOCK
      ?auto_390762 - BLOCK
      ?auto_390763 - BLOCK
      ?auto_390764 - BLOCK
      ?auto_390765 - BLOCK
    )
    :vars
    (
      ?auto_390766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390765 ?auto_390766 ) ( ON-TABLE ?auto_390752 ) ( ON ?auto_390753 ?auto_390752 ) ( ON ?auto_390754 ?auto_390753 ) ( not ( = ?auto_390752 ?auto_390753 ) ) ( not ( = ?auto_390752 ?auto_390754 ) ) ( not ( = ?auto_390752 ?auto_390755 ) ) ( not ( = ?auto_390752 ?auto_390756 ) ) ( not ( = ?auto_390752 ?auto_390757 ) ) ( not ( = ?auto_390752 ?auto_390758 ) ) ( not ( = ?auto_390752 ?auto_390759 ) ) ( not ( = ?auto_390752 ?auto_390760 ) ) ( not ( = ?auto_390752 ?auto_390761 ) ) ( not ( = ?auto_390752 ?auto_390762 ) ) ( not ( = ?auto_390752 ?auto_390763 ) ) ( not ( = ?auto_390752 ?auto_390764 ) ) ( not ( = ?auto_390752 ?auto_390765 ) ) ( not ( = ?auto_390752 ?auto_390766 ) ) ( not ( = ?auto_390753 ?auto_390754 ) ) ( not ( = ?auto_390753 ?auto_390755 ) ) ( not ( = ?auto_390753 ?auto_390756 ) ) ( not ( = ?auto_390753 ?auto_390757 ) ) ( not ( = ?auto_390753 ?auto_390758 ) ) ( not ( = ?auto_390753 ?auto_390759 ) ) ( not ( = ?auto_390753 ?auto_390760 ) ) ( not ( = ?auto_390753 ?auto_390761 ) ) ( not ( = ?auto_390753 ?auto_390762 ) ) ( not ( = ?auto_390753 ?auto_390763 ) ) ( not ( = ?auto_390753 ?auto_390764 ) ) ( not ( = ?auto_390753 ?auto_390765 ) ) ( not ( = ?auto_390753 ?auto_390766 ) ) ( not ( = ?auto_390754 ?auto_390755 ) ) ( not ( = ?auto_390754 ?auto_390756 ) ) ( not ( = ?auto_390754 ?auto_390757 ) ) ( not ( = ?auto_390754 ?auto_390758 ) ) ( not ( = ?auto_390754 ?auto_390759 ) ) ( not ( = ?auto_390754 ?auto_390760 ) ) ( not ( = ?auto_390754 ?auto_390761 ) ) ( not ( = ?auto_390754 ?auto_390762 ) ) ( not ( = ?auto_390754 ?auto_390763 ) ) ( not ( = ?auto_390754 ?auto_390764 ) ) ( not ( = ?auto_390754 ?auto_390765 ) ) ( not ( = ?auto_390754 ?auto_390766 ) ) ( not ( = ?auto_390755 ?auto_390756 ) ) ( not ( = ?auto_390755 ?auto_390757 ) ) ( not ( = ?auto_390755 ?auto_390758 ) ) ( not ( = ?auto_390755 ?auto_390759 ) ) ( not ( = ?auto_390755 ?auto_390760 ) ) ( not ( = ?auto_390755 ?auto_390761 ) ) ( not ( = ?auto_390755 ?auto_390762 ) ) ( not ( = ?auto_390755 ?auto_390763 ) ) ( not ( = ?auto_390755 ?auto_390764 ) ) ( not ( = ?auto_390755 ?auto_390765 ) ) ( not ( = ?auto_390755 ?auto_390766 ) ) ( not ( = ?auto_390756 ?auto_390757 ) ) ( not ( = ?auto_390756 ?auto_390758 ) ) ( not ( = ?auto_390756 ?auto_390759 ) ) ( not ( = ?auto_390756 ?auto_390760 ) ) ( not ( = ?auto_390756 ?auto_390761 ) ) ( not ( = ?auto_390756 ?auto_390762 ) ) ( not ( = ?auto_390756 ?auto_390763 ) ) ( not ( = ?auto_390756 ?auto_390764 ) ) ( not ( = ?auto_390756 ?auto_390765 ) ) ( not ( = ?auto_390756 ?auto_390766 ) ) ( not ( = ?auto_390757 ?auto_390758 ) ) ( not ( = ?auto_390757 ?auto_390759 ) ) ( not ( = ?auto_390757 ?auto_390760 ) ) ( not ( = ?auto_390757 ?auto_390761 ) ) ( not ( = ?auto_390757 ?auto_390762 ) ) ( not ( = ?auto_390757 ?auto_390763 ) ) ( not ( = ?auto_390757 ?auto_390764 ) ) ( not ( = ?auto_390757 ?auto_390765 ) ) ( not ( = ?auto_390757 ?auto_390766 ) ) ( not ( = ?auto_390758 ?auto_390759 ) ) ( not ( = ?auto_390758 ?auto_390760 ) ) ( not ( = ?auto_390758 ?auto_390761 ) ) ( not ( = ?auto_390758 ?auto_390762 ) ) ( not ( = ?auto_390758 ?auto_390763 ) ) ( not ( = ?auto_390758 ?auto_390764 ) ) ( not ( = ?auto_390758 ?auto_390765 ) ) ( not ( = ?auto_390758 ?auto_390766 ) ) ( not ( = ?auto_390759 ?auto_390760 ) ) ( not ( = ?auto_390759 ?auto_390761 ) ) ( not ( = ?auto_390759 ?auto_390762 ) ) ( not ( = ?auto_390759 ?auto_390763 ) ) ( not ( = ?auto_390759 ?auto_390764 ) ) ( not ( = ?auto_390759 ?auto_390765 ) ) ( not ( = ?auto_390759 ?auto_390766 ) ) ( not ( = ?auto_390760 ?auto_390761 ) ) ( not ( = ?auto_390760 ?auto_390762 ) ) ( not ( = ?auto_390760 ?auto_390763 ) ) ( not ( = ?auto_390760 ?auto_390764 ) ) ( not ( = ?auto_390760 ?auto_390765 ) ) ( not ( = ?auto_390760 ?auto_390766 ) ) ( not ( = ?auto_390761 ?auto_390762 ) ) ( not ( = ?auto_390761 ?auto_390763 ) ) ( not ( = ?auto_390761 ?auto_390764 ) ) ( not ( = ?auto_390761 ?auto_390765 ) ) ( not ( = ?auto_390761 ?auto_390766 ) ) ( not ( = ?auto_390762 ?auto_390763 ) ) ( not ( = ?auto_390762 ?auto_390764 ) ) ( not ( = ?auto_390762 ?auto_390765 ) ) ( not ( = ?auto_390762 ?auto_390766 ) ) ( not ( = ?auto_390763 ?auto_390764 ) ) ( not ( = ?auto_390763 ?auto_390765 ) ) ( not ( = ?auto_390763 ?auto_390766 ) ) ( not ( = ?auto_390764 ?auto_390765 ) ) ( not ( = ?auto_390764 ?auto_390766 ) ) ( not ( = ?auto_390765 ?auto_390766 ) ) ( ON ?auto_390764 ?auto_390765 ) ( ON ?auto_390763 ?auto_390764 ) ( ON ?auto_390762 ?auto_390763 ) ( ON ?auto_390761 ?auto_390762 ) ( ON ?auto_390760 ?auto_390761 ) ( ON ?auto_390759 ?auto_390760 ) ( ON ?auto_390758 ?auto_390759 ) ( ON ?auto_390757 ?auto_390758 ) ( ON ?auto_390756 ?auto_390757 ) ( CLEAR ?auto_390754 ) ( ON ?auto_390755 ?auto_390756 ) ( CLEAR ?auto_390755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_390752 ?auto_390753 ?auto_390754 ?auto_390755 )
      ( MAKE-14PILE ?auto_390752 ?auto_390753 ?auto_390754 ?auto_390755 ?auto_390756 ?auto_390757 ?auto_390758 ?auto_390759 ?auto_390760 ?auto_390761 ?auto_390762 ?auto_390763 ?auto_390764 ?auto_390765 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390810 - BLOCK
      ?auto_390811 - BLOCK
      ?auto_390812 - BLOCK
      ?auto_390813 - BLOCK
      ?auto_390814 - BLOCK
      ?auto_390815 - BLOCK
      ?auto_390816 - BLOCK
      ?auto_390817 - BLOCK
      ?auto_390818 - BLOCK
      ?auto_390819 - BLOCK
      ?auto_390820 - BLOCK
      ?auto_390821 - BLOCK
      ?auto_390822 - BLOCK
      ?auto_390823 - BLOCK
    )
    :vars
    (
      ?auto_390824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390823 ?auto_390824 ) ( ON-TABLE ?auto_390810 ) ( ON ?auto_390811 ?auto_390810 ) ( not ( = ?auto_390810 ?auto_390811 ) ) ( not ( = ?auto_390810 ?auto_390812 ) ) ( not ( = ?auto_390810 ?auto_390813 ) ) ( not ( = ?auto_390810 ?auto_390814 ) ) ( not ( = ?auto_390810 ?auto_390815 ) ) ( not ( = ?auto_390810 ?auto_390816 ) ) ( not ( = ?auto_390810 ?auto_390817 ) ) ( not ( = ?auto_390810 ?auto_390818 ) ) ( not ( = ?auto_390810 ?auto_390819 ) ) ( not ( = ?auto_390810 ?auto_390820 ) ) ( not ( = ?auto_390810 ?auto_390821 ) ) ( not ( = ?auto_390810 ?auto_390822 ) ) ( not ( = ?auto_390810 ?auto_390823 ) ) ( not ( = ?auto_390810 ?auto_390824 ) ) ( not ( = ?auto_390811 ?auto_390812 ) ) ( not ( = ?auto_390811 ?auto_390813 ) ) ( not ( = ?auto_390811 ?auto_390814 ) ) ( not ( = ?auto_390811 ?auto_390815 ) ) ( not ( = ?auto_390811 ?auto_390816 ) ) ( not ( = ?auto_390811 ?auto_390817 ) ) ( not ( = ?auto_390811 ?auto_390818 ) ) ( not ( = ?auto_390811 ?auto_390819 ) ) ( not ( = ?auto_390811 ?auto_390820 ) ) ( not ( = ?auto_390811 ?auto_390821 ) ) ( not ( = ?auto_390811 ?auto_390822 ) ) ( not ( = ?auto_390811 ?auto_390823 ) ) ( not ( = ?auto_390811 ?auto_390824 ) ) ( not ( = ?auto_390812 ?auto_390813 ) ) ( not ( = ?auto_390812 ?auto_390814 ) ) ( not ( = ?auto_390812 ?auto_390815 ) ) ( not ( = ?auto_390812 ?auto_390816 ) ) ( not ( = ?auto_390812 ?auto_390817 ) ) ( not ( = ?auto_390812 ?auto_390818 ) ) ( not ( = ?auto_390812 ?auto_390819 ) ) ( not ( = ?auto_390812 ?auto_390820 ) ) ( not ( = ?auto_390812 ?auto_390821 ) ) ( not ( = ?auto_390812 ?auto_390822 ) ) ( not ( = ?auto_390812 ?auto_390823 ) ) ( not ( = ?auto_390812 ?auto_390824 ) ) ( not ( = ?auto_390813 ?auto_390814 ) ) ( not ( = ?auto_390813 ?auto_390815 ) ) ( not ( = ?auto_390813 ?auto_390816 ) ) ( not ( = ?auto_390813 ?auto_390817 ) ) ( not ( = ?auto_390813 ?auto_390818 ) ) ( not ( = ?auto_390813 ?auto_390819 ) ) ( not ( = ?auto_390813 ?auto_390820 ) ) ( not ( = ?auto_390813 ?auto_390821 ) ) ( not ( = ?auto_390813 ?auto_390822 ) ) ( not ( = ?auto_390813 ?auto_390823 ) ) ( not ( = ?auto_390813 ?auto_390824 ) ) ( not ( = ?auto_390814 ?auto_390815 ) ) ( not ( = ?auto_390814 ?auto_390816 ) ) ( not ( = ?auto_390814 ?auto_390817 ) ) ( not ( = ?auto_390814 ?auto_390818 ) ) ( not ( = ?auto_390814 ?auto_390819 ) ) ( not ( = ?auto_390814 ?auto_390820 ) ) ( not ( = ?auto_390814 ?auto_390821 ) ) ( not ( = ?auto_390814 ?auto_390822 ) ) ( not ( = ?auto_390814 ?auto_390823 ) ) ( not ( = ?auto_390814 ?auto_390824 ) ) ( not ( = ?auto_390815 ?auto_390816 ) ) ( not ( = ?auto_390815 ?auto_390817 ) ) ( not ( = ?auto_390815 ?auto_390818 ) ) ( not ( = ?auto_390815 ?auto_390819 ) ) ( not ( = ?auto_390815 ?auto_390820 ) ) ( not ( = ?auto_390815 ?auto_390821 ) ) ( not ( = ?auto_390815 ?auto_390822 ) ) ( not ( = ?auto_390815 ?auto_390823 ) ) ( not ( = ?auto_390815 ?auto_390824 ) ) ( not ( = ?auto_390816 ?auto_390817 ) ) ( not ( = ?auto_390816 ?auto_390818 ) ) ( not ( = ?auto_390816 ?auto_390819 ) ) ( not ( = ?auto_390816 ?auto_390820 ) ) ( not ( = ?auto_390816 ?auto_390821 ) ) ( not ( = ?auto_390816 ?auto_390822 ) ) ( not ( = ?auto_390816 ?auto_390823 ) ) ( not ( = ?auto_390816 ?auto_390824 ) ) ( not ( = ?auto_390817 ?auto_390818 ) ) ( not ( = ?auto_390817 ?auto_390819 ) ) ( not ( = ?auto_390817 ?auto_390820 ) ) ( not ( = ?auto_390817 ?auto_390821 ) ) ( not ( = ?auto_390817 ?auto_390822 ) ) ( not ( = ?auto_390817 ?auto_390823 ) ) ( not ( = ?auto_390817 ?auto_390824 ) ) ( not ( = ?auto_390818 ?auto_390819 ) ) ( not ( = ?auto_390818 ?auto_390820 ) ) ( not ( = ?auto_390818 ?auto_390821 ) ) ( not ( = ?auto_390818 ?auto_390822 ) ) ( not ( = ?auto_390818 ?auto_390823 ) ) ( not ( = ?auto_390818 ?auto_390824 ) ) ( not ( = ?auto_390819 ?auto_390820 ) ) ( not ( = ?auto_390819 ?auto_390821 ) ) ( not ( = ?auto_390819 ?auto_390822 ) ) ( not ( = ?auto_390819 ?auto_390823 ) ) ( not ( = ?auto_390819 ?auto_390824 ) ) ( not ( = ?auto_390820 ?auto_390821 ) ) ( not ( = ?auto_390820 ?auto_390822 ) ) ( not ( = ?auto_390820 ?auto_390823 ) ) ( not ( = ?auto_390820 ?auto_390824 ) ) ( not ( = ?auto_390821 ?auto_390822 ) ) ( not ( = ?auto_390821 ?auto_390823 ) ) ( not ( = ?auto_390821 ?auto_390824 ) ) ( not ( = ?auto_390822 ?auto_390823 ) ) ( not ( = ?auto_390822 ?auto_390824 ) ) ( not ( = ?auto_390823 ?auto_390824 ) ) ( ON ?auto_390822 ?auto_390823 ) ( ON ?auto_390821 ?auto_390822 ) ( ON ?auto_390820 ?auto_390821 ) ( ON ?auto_390819 ?auto_390820 ) ( ON ?auto_390818 ?auto_390819 ) ( ON ?auto_390817 ?auto_390818 ) ( ON ?auto_390816 ?auto_390817 ) ( ON ?auto_390815 ?auto_390816 ) ( ON ?auto_390814 ?auto_390815 ) ( ON ?auto_390813 ?auto_390814 ) ( CLEAR ?auto_390811 ) ( ON ?auto_390812 ?auto_390813 ) ( CLEAR ?auto_390812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_390810 ?auto_390811 ?auto_390812 )
      ( MAKE-14PILE ?auto_390810 ?auto_390811 ?auto_390812 ?auto_390813 ?auto_390814 ?auto_390815 ?auto_390816 ?auto_390817 ?auto_390818 ?auto_390819 ?auto_390820 ?auto_390821 ?auto_390822 ?auto_390823 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390868 - BLOCK
      ?auto_390869 - BLOCK
      ?auto_390870 - BLOCK
      ?auto_390871 - BLOCK
      ?auto_390872 - BLOCK
      ?auto_390873 - BLOCK
      ?auto_390874 - BLOCK
      ?auto_390875 - BLOCK
      ?auto_390876 - BLOCK
      ?auto_390877 - BLOCK
      ?auto_390878 - BLOCK
      ?auto_390879 - BLOCK
      ?auto_390880 - BLOCK
      ?auto_390881 - BLOCK
    )
    :vars
    (
      ?auto_390882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390881 ?auto_390882 ) ( ON-TABLE ?auto_390868 ) ( not ( = ?auto_390868 ?auto_390869 ) ) ( not ( = ?auto_390868 ?auto_390870 ) ) ( not ( = ?auto_390868 ?auto_390871 ) ) ( not ( = ?auto_390868 ?auto_390872 ) ) ( not ( = ?auto_390868 ?auto_390873 ) ) ( not ( = ?auto_390868 ?auto_390874 ) ) ( not ( = ?auto_390868 ?auto_390875 ) ) ( not ( = ?auto_390868 ?auto_390876 ) ) ( not ( = ?auto_390868 ?auto_390877 ) ) ( not ( = ?auto_390868 ?auto_390878 ) ) ( not ( = ?auto_390868 ?auto_390879 ) ) ( not ( = ?auto_390868 ?auto_390880 ) ) ( not ( = ?auto_390868 ?auto_390881 ) ) ( not ( = ?auto_390868 ?auto_390882 ) ) ( not ( = ?auto_390869 ?auto_390870 ) ) ( not ( = ?auto_390869 ?auto_390871 ) ) ( not ( = ?auto_390869 ?auto_390872 ) ) ( not ( = ?auto_390869 ?auto_390873 ) ) ( not ( = ?auto_390869 ?auto_390874 ) ) ( not ( = ?auto_390869 ?auto_390875 ) ) ( not ( = ?auto_390869 ?auto_390876 ) ) ( not ( = ?auto_390869 ?auto_390877 ) ) ( not ( = ?auto_390869 ?auto_390878 ) ) ( not ( = ?auto_390869 ?auto_390879 ) ) ( not ( = ?auto_390869 ?auto_390880 ) ) ( not ( = ?auto_390869 ?auto_390881 ) ) ( not ( = ?auto_390869 ?auto_390882 ) ) ( not ( = ?auto_390870 ?auto_390871 ) ) ( not ( = ?auto_390870 ?auto_390872 ) ) ( not ( = ?auto_390870 ?auto_390873 ) ) ( not ( = ?auto_390870 ?auto_390874 ) ) ( not ( = ?auto_390870 ?auto_390875 ) ) ( not ( = ?auto_390870 ?auto_390876 ) ) ( not ( = ?auto_390870 ?auto_390877 ) ) ( not ( = ?auto_390870 ?auto_390878 ) ) ( not ( = ?auto_390870 ?auto_390879 ) ) ( not ( = ?auto_390870 ?auto_390880 ) ) ( not ( = ?auto_390870 ?auto_390881 ) ) ( not ( = ?auto_390870 ?auto_390882 ) ) ( not ( = ?auto_390871 ?auto_390872 ) ) ( not ( = ?auto_390871 ?auto_390873 ) ) ( not ( = ?auto_390871 ?auto_390874 ) ) ( not ( = ?auto_390871 ?auto_390875 ) ) ( not ( = ?auto_390871 ?auto_390876 ) ) ( not ( = ?auto_390871 ?auto_390877 ) ) ( not ( = ?auto_390871 ?auto_390878 ) ) ( not ( = ?auto_390871 ?auto_390879 ) ) ( not ( = ?auto_390871 ?auto_390880 ) ) ( not ( = ?auto_390871 ?auto_390881 ) ) ( not ( = ?auto_390871 ?auto_390882 ) ) ( not ( = ?auto_390872 ?auto_390873 ) ) ( not ( = ?auto_390872 ?auto_390874 ) ) ( not ( = ?auto_390872 ?auto_390875 ) ) ( not ( = ?auto_390872 ?auto_390876 ) ) ( not ( = ?auto_390872 ?auto_390877 ) ) ( not ( = ?auto_390872 ?auto_390878 ) ) ( not ( = ?auto_390872 ?auto_390879 ) ) ( not ( = ?auto_390872 ?auto_390880 ) ) ( not ( = ?auto_390872 ?auto_390881 ) ) ( not ( = ?auto_390872 ?auto_390882 ) ) ( not ( = ?auto_390873 ?auto_390874 ) ) ( not ( = ?auto_390873 ?auto_390875 ) ) ( not ( = ?auto_390873 ?auto_390876 ) ) ( not ( = ?auto_390873 ?auto_390877 ) ) ( not ( = ?auto_390873 ?auto_390878 ) ) ( not ( = ?auto_390873 ?auto_390879 ) ) ( not ( = ?auto_390873 ?auto_390880 ) ) ( not ( = ?auto_390873 ?auto_390881 ) ) ( not ( = ?auto_390873 ?auto_390882 ) ) ( not ( = ?auto_390874 ?auto_390875 ) ) ( not ( = ?auto_390874 ?auto_390876 ) ) ( not ( = ?auto_390874 ?auto_390877 ) ) ( not ( = ?auto_390874 ?auto_390878 ) ) ( not ( = ?auto_390874 ?auto_390879 ) ) ( not ( = ?auto_390874 ?auto_390880 ) ) ( not ( = ?auto_390874 ?auto_390881 ) ) ( not ( = ?auto_390874 ?auto_390882 ) ) ( not ( = ?auto_390875 ?auto_390876 ) ) ( not ( = ?auto_390875 ?auto_390877 ) ) ( not ( = ?auto_390875 ?auto_390878 ) ) ( not ( = ?auto_390875 ?auto_390879 ) ) ( not ( = ?auto_390875 ?auto_390880 ) ) ( not ( = ?auto_390875 ?auto_390881 ) ) ( not ( = ?auto_390875 ?auto_390882 ) ) ( not ( = ?auto_390876 ?auto_390877 ) ) ( not ( = ?auto_390876 ?auto_390878 ) ) ( not ( = ?auto_390876 ?auto_390879 ) ) ( not ( = ?auto_390876 ?auto_390880 ) ) ( not ( = ?auto_390876 ?auto_390881 ) ) ( not ( = ?auto_390876 ?auto_390882 ) ) ( not ( = ?auto_390877 ?auto_390878 ) ) ( not ( = ?auto_390877 ?auto_390879 ) ) ( not ( = ?auto_390877 ?auto_390880 ) ) ( not ( = ?auto_390877 ?auto_390881 ) ) ( not ( = ?auto_390877 ?auto_390882 ) ) ( not ( = ?auto_390878 ?auto_390879 ) ) ( not ( = ?auto_390878 ?auto_390880 ) ) ( not ( = ?auto_390878 ?auto_390881 ) ) ( not ( = ?auto_390878 ?auto_390882 ) ) ( not ( = ?auto_390879 ?auto_390880 ) ) ( not ( = ?auto_390879 ?auto_390881 ) ) ( not ( = ?auto_390879 ?auto_390882 ) ) ( not ( = ?auto_390880 ?auto_390881 ) ) ( not ( = ?auto_390880 ?auto_390882 ) ) ( not ( = ?auto_390881 ?auto_390882 ) ) ( ON ?auto_390880 ?auto_390881 ) ( ON ?auto_390879 ?auto_390880 ) ( ON ?auto_390878 ?auto_390879 ) ( ON ?auto_390877 ?auto_390878 ) ( ON ?auto_390876 ?auto_390877 ) ( ON ?auto_390875 ?auto_390876 ) ( ON ?auto_390874 ?auto_390875 ) ( ON ?auto_390873 ?auto_390874 ) ( ON ?auto_390872 ?auto_390873 ) ( ON ?auto_390871 ?auto_390872 ) ( ON ?auto_390870 ?auto_390871 ) ( CLEAR ?auto_390868 ) ( ON ?auto_390869 ?auto_390870 ) ( CLEAR ?auto_390869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_390868 ?auto_390869 )
      ( MAKE-14PILE ?auto_390868 ?auto_390869 ?auto_390870 ?auto_390871 ?auto_390872 ?auto_390873 ?auto_390874 ?auto_390875 ?auto_390876 ?auto_390877 ?auto_390878 ?auto_390879 ?auto_390880 ?auto_390881 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390926 - BLOCK
      ?auto_390927 - BLOCK
      ?auto_390928 - BLOCK
      ?auto_390929 - BLOCK
      ?auto_390930 - BLOCK
      ?auto_390931 - BLOCK
      ?auto_390932 - BLOCK
      ?auto_390933 - BLOCK
      ?auto_390934 - BLOCK
      ?auto_390935 - BLOCK
      ?auto_390936 - BLOCK
      ?auto_390937 - BLOCK
      ?auto_390938 - BLOCK
      ?auto_390939 - BLOCK
    )
    :vars
    (
      ?auto_390940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390939 ?auto_390940 ) ( not ( = ?auto_390926 ?auto_390927 ) ) ( not ( = ?auto_390926 ?auto_390928 ) ) ( not ( = ?auto_390926 ?auto_390929 ) ) ( not ( = ?auto_390926 ?auto_390930 ) ) ( not ( = ?auto_390926 ?auto_390931 ) ) ( not ( = ?auto_390926 ?auto_390932 ) ) ( not ( = ?auto_390926 ?auto_390933 ) ) ( not ( = ?auto_390926 ?auto_390934 ) ) ( not ( = ?auto_390926 ?auto_390935 ) ) ( not ( = ?auto_390926 ?auto_390936 ) ) ( not ( = ?auto_390926 ?auto_390937 ) ) ( not ( = ?auto_390926 ?auto_390938 ) ) ( not ( = ?auto_390926 ?auto_390939 ) ) ( not ( = ?auto_390926 ?auto_390940 ) ) ( not ( = ?auto_390927 ?auto_390928 ) ) ( not ( = ?auto_390927 ?auto_390929 ) ) ( not ( = ?auto_390927 ?auto_390930 ) ) ( not ( = ?auto_390927 ?auto_390931 ) ) ( not ( = ?auto_390927 ?auto_390932 ) ) ( not ( = ?auto_390927 ?auto_390933 ) ) ( not ( = ?auto_390927 ?auto_390934 ) ) ( not ( = ?auto_390927 ?auto_390935 ) ) ( not ( = ?auto_390927 ?auto_390936 ) ) ( not ( = ?auto_390927 ?auto_390937 ) ) ( not ( = ?auto_390927 ?auto_390938 ) ) ( not ( = ?auto_390927 ?auto_390939 ) ) ( not ( = ?auto_390927 ?auto_390940 ) ) ( not ( = ?auto_390928 ?auto_390929 ) ) ( not ( = ?auto_390928 ?auto_390930 ) ) ( not ( = ?auto_390928 ?auto_390931 ) ) ( not ( = ?auto_390928 ?auto_390932 ) ) ( not ( = ?auto_390928 ?auto_390933 ) ) ( not ( = ?auto_390928 ?auto_390934 ) ) ( not ( = ?auto_390928 ?auto_390935 ) ) ( not ( = ?auto_390928 ?auto_390936 ) ) ( not ( = ?auto_390928 ?auto_390937 ) ) ( not ( = ?auto_390928 ?auto_390938 ) ) ( not ( = ?auto_390928 ?auto_390939 ) ) ( not ( = ?auto_390928 ?auto_390940 ) ) ( not ( = ?auto_390929 ?auto_390930 ) ) ( not ( = ?auto_390929 ?auto_390931 ) ) ( not ( = ?auto_390929 ?auto_390932 ) ) ( not ( = ?auto_390929 ?auto_390933 ) ) ( not ( = ?auto_390929 ?auto_390934 ) ) ( not ( = ?auto_390929 ?auto_390935 ) ) ( not ( = ?auto_390929 ?auto_390936 ) ) ( not ( = ?auto_390929 ?auto_390937 ) ) ( not ( = ?auto_390929 ?auto_390938 ) ) ( not ( = ?auto_390929 ?auto_390939 ) ) ( not ( = ?auto_390929 ?auto_390940 ) ) ( not ( = ?auto_390930 ?auto_390931 ) ) ( not ( = ?auto_390930 ?auto_390932 ) ) ( not ( = ?auto_390930 ?auto_390933 ) ) ( not ( = ?auto_390930 ?auto_390934 ) ) ( not ( = ?auto_390930 ?auto_390935 ) ) ( not ( = ?auto_390930 ?auto_390936 ) ) ( not ( = ?auto_390930 ?auto_390937 ) ) ( not ( = ?auto_390930 ?auto_390938 ) ) ( not ( = ?auto_390930 ?auto_390939 ) ) ( not ( = ?auto_390930 ?auto_390940 ) ) ( not ( = ?auto_390931 ?auto_390932 ) ) ( not ( = ?auto_390931 ?auto_390933 ) ) ( not ( = ?auto_390931 ?auto_390934 ) ) ( not ( = ?auto_390931 ?auto_390935 ) ) ( not ( = ?auto_390931 ?auto_390936 ) ) ( not ( = ?auto_390931 ?auto_390937 ) ) ( not ( = ?auto_390931 ?auto_390938 ) ) ( not ( = ?auto_390931 ?auto_390939 ) ) ( not ( = ?auto_390931 ?auto_390940 ) ) ( not ( = ?auto_390932 ?auto_390933 ) ) ( not ( = ?auto_390932 ?auto_390934 ) ) ( not ( = ?auto_390932 ?auto_390935 ) ) ( not ( = ?auto_390932 ?auto_390936 ) ) ( not ( = ?auto_390932 ?auto_390937 ) ) ( not ( = ?auto_390932 ?auto_390938 ) ) ( not ( = ?auto_390932 ?auto_390939 ) ) ( not ( = ?auto_390932 ?auto_390940 ) ) ( not ( = ?auto_390933 ?auto_390934 ) ) ( not ( = ?auto_390933 ?auto_390935 ) ) ( not ( = ?auto_390933 ?auto_390936 ) ) ( not ( = ?auto_390933 ?auto_390937 ) ) ( not ( = ?auto_390933 ?auto_390938 ) ) ( not ( = ?auto_390933 ?auto_390939 ) ) ( not ( = ?auto_390933 ?auto_390940 ) ) ( not ( = ?auto_390934 ?auto_390935 ) ) ( not ( = ?auto_390934 ?auto_390936 ) ) ( not ( = ?auto_390934 ?auto_390937 ) ) ( not ( = ?auto_390934 ?auto_390938 ) ) ( not ( = ?auto_390934 ?auto_390939 ) ) ( not ( = ?auto_390934 ?auto_390940 ) ) ( not ( = ?auto_390935 ?auto_390936 ) ) ( not ( = ?auto_390935 ?auto_390937 ) ) ( not ( = ?auto_390935 ?auto_390938 ) ) ( not ( = ?auto_390935 ?auto_390939 ) ) ( not ( = ?auto_390935 ?auto_390940 ) ) ( not ( = ?auto_390936 ?auto_390937 ) ) ( not ( = ?auto_390936 ?auto_390938 ) ) ( not ( = ?auto_390936 ?auto_390939 ) ) ( not ( = ?auto_390936 ?auto_390940 ) ) ( not ( = ?auto_390937 ?auto_390938 ) ) ( not ( = ?auto_390937 ?auto_390939 ) ) ( not ( = ?auto_390937 ?auto_390940 ) ) ( not ( = ?auto_390938 ?auto_390939 ) ) ( not ( = ?auto_390938 ?auto_390940 ) ) ( not ( = ?auto_390939 ?auto_390940 ) ) ( ON ?auto_390938 ?auto_390939 ) ( ON ?auto_390937 ?auto_390938 ) ( ON ?auto_390936 ?auto_390937 ) ( ON ?auto_390935 ?auto_390936 ) ( ON ?auto_390934 ?auto_390935 ) ( ON ?auto_390933 ?auto_390934 ) ( ON ?auto_390932 ?auto_390933 ) ( ON ?auto_390931 ?auto_390932 ) ( ON ?auto_390930 ?auto_390931 ) ( ON ?auto_390929 ?auto_390930 ) ( ON ?auto_390928 ?auto_390929 ) ( ON ?auto_390927 ?auto_390928 ) ( ON ?auto_390926 ?auto_390927 ) ( CLEAR ?auto_390926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_390926 )
      ( MAKE-14PILE ?auto_390926 ?auto_390927 ?auto_390928 ?auto_390929 ?auto_390930 ?auto_390931 ?auto_390932 ?auto_390933 ?auto_390934 ?auto_390935 ?auto_390936 ?auto_390937 ?auto_390938 ?auto_390939 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_390985 - BLOCK
      ?auto_390986 - BLOCK
      ?auto_390987 - BLOCK
      ?auto_390988 - BLOCK
      ?auto_390989 - BLOCK
      ?auto_390990 - BLOCK
      ?auto_390991 - BLOCK
      ?auto_390992 - BLOCK
      ?auto_390993 - BLOCK
      ?auto_390994 - BLOCK
      ?auto_390995 - BLOCK
      ?auto_390996 - BLOCK
      ?auto_390997 - BLOCK
      ?auto_390998 - BLOCK
      ?auto_390999 - BLOCK
    )
    :vars
    (
      ?auto_391000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_390998 ) ( ON ?auto_390999 ?auto_391000 ) ( CLEAR ?auto_390999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_390985 ) ( ON ?auto_390986 ?auto_390985 ) ( ON ?auto_390987 ?auto_390986 ) ( ON ?auto_390988 ?auto_390987 ) ( ON ?auto_390989 ?auto_390988 ) ( ON ?auto_390990 ?auto_390989 ) ( ON ?auto_390991 ?auto_390990 ) ( ON ?auto_390992 ?auto_390991 ) ( ON ?auto_390993 ?auto_390992 ) ( ON ?auto_390994 ?auto_390993 ) ( ON ?auto_390995 ?auto_390994 ) ( ON ?auto_390996 ?auto_390995 ) ( ON ?auto_390997 ?auto_390996 ) ( ON ?auto_390998 ?auto_390997 ) ( not ( = ?auto_390985 ?auto_390986 ) ) ( not ( = ?auto_390985 ?auto_390987 ) ) ( not ( = ?auto_390985 ?auto_390988 ) ) ( not ( = ?auto_390985 ?auto_390989 ) ) ( not ( = ?auto_390985 ?auto_390990 ) ) ( not ( = ?auto_390985 ?auto_390991 ) ) ( not ( = ?auto_390985 ?auto_390992 ) ) ( not ( = ?auto_390985 ?auto_390993 ) ) ( not ( = ?auto_390985 ?auto_390994 ) ) ( not ( = ?auto_390985 ?auto_390995 ) ) ( not ( = ?auto_390985 ?auto_390996 ) ) ( not ( = ?auto_390985 ?auto_390997 ) ) ( not ( = ?auto_390985 ?auto_390998 ) ) ( not ( = ?auto_390985 ?auto_390999 ) ) ( not ( = ?auto_390985 ?auto_391000 ) ) ( not ( = ?auto_390986 ?auto_390987 ) ) ( not ( = ?auto_390986 ?auto_390988 ) ) ( not ( = ?auto_390986 ?auto_390989 ) ) ( not ( = ?auto_390986 ?auto_390990 ) ) ( not ( = ?auto_390986 ?auto_390991 ) ) ( not ( = ?auto_390986 ?auto_390992 ) ) ( not ( = ?auto_390986 ?auto_390993 ) ) ( not ( = ?auto_390986 ?auto_390994 ) ) ( not ( = ?auto_390986 ?auto_390995 ) ) ( not ( = ?auto_390986 ?auto_390996 ) ) ( not ( = ?auto_390986 ?auto_390997 ) ) ( not ( = ?auto_390986 ?auto_390998 ) ) ( not ( = ?auto_390986 ?auto_390999 ) ) ( not ( = ?auto_390986 ?auto_391000 ) ) ( not ( = ?auto_390987 ?auto_390988 ) ) ( not ( = ?auto_390987 ?auto_390989 ) ) ( not ( = ?auto_390987 ?auto_390990 ) ) ( not ( = ?auto_390987 ?auto_390991 ) ) ( not ( = ?auto_390987 ?auto_390992 ) ) ( not ( = ?auto_390987 ?auto_390993 ) ) ( not ( = ?auto_390987 ?auto_390994 ) ) ( not ( = ?auto_390987 ?auto_390995 ) ) ( not ( = ?auto_390987 ?auto_390996 ) ) ( not ( = ?auto_390987 ?auto_390997 ) ) ( not ( = ?auto_390987 ?auto_390998 ) ) ( not ( = ?auto_390987 ?auto_390999 ) ) ( not ( = ?auto_390987 ?auto_391000 ) ) ( not ( = ?auto_390988 ?auto_390989 ) ) ( not ( = ?auto_390988 ?auto_390990 ) ) ( not ( = ?auto_390988 ?auto_390991 ) ) ( not ( = ?auto_390988 ?auto_390992 ) ) ( not ( = ?auto_390988 ?auto_390993 ) ) ( not ( = ?auto_390988 ?auto_390994 ) ) ( not ( = ?auto_390988 ?auto_390995 ) ) ( not ( = ?auto_390988 ?auto_390996 ) ) ( not ( = ?auto_390988 ?auto_390997 ) ) ( not ( = ?auto_390988 ?auto_390998 ) ) ( not ( = ?auto_390988 ?auto_390999 ) ) ( not ( = ?auto_390988 ?auto_391000 ) ) ( not ( = ?auto_390989 ?auto_390990 ) ) ( not ( = ?auto_390989 ?auto_390991 ) ) ( not ( = ?auto_390989 ?auto_390992 ) ) ( not ( = ?auto_390989 ?auto_390993 ) ) ( not ( = ?auto_390989 ?auto_390994 ) ) ( not ( = ?auto_390989 ?auto_390995 ) ) ( not ( = ?auto_390989 ?auto_390996 ) ) ( not ( = ?auto_390989 ?auto_390997 ) ) ( not ( = ?auto_390989 ?auto_390998 ) ) ( not ( = ?auto_390989 ?auto_390999 ) ) ( not ( = ?auto_390989 ?auto_391000 ) ) ( not ( = ?auto_390990 ?auto_390991 ) ) ( not ( = ?auto_390990 ?auto_390992 ) ) ( not ( = ?auto_390990 ?auto_390993 ) ) ( not ( = ?auto_390990 ?auto_390994 ) ) ( not ( = ?auto_390990 ?auto_390995 ) ) ( not ( = ?auto_390990 ?auto_390996 ) ) ( not ( = ?auto_390990 ?auto_390997 ) ) ( not ( = ?auto_390990 ?auto_390998 ) ) ( not ( = ?auto_390990 ?auto_390999 ) ) ( not ( = ?auto_390990 ?auto_391000 ) ) ( not ( = ?auto_390991 ?auto_390992 ) ) ( not ( = ?auto_390991 ?auto_390993 ) ) ( not ( = ?auto_390991 ?auto_390994 ) ) ( not ( = ?auto_390991 ?auto_390995 ) ) ( not ( = ?auto_390991 ?auto_390996 ) ) ( not ( = ?auto_390991 ?auto_390997 ) ) ( not ( = ?auto_390991 ?auto_390998 ) ) ( not ( = ?auto_390991 ?auto_390999 ) ) ( not ( = ?auto_390991 ?auto_391000 ) ) ( not ( = ?auto_390992 ?auto_390993 ) ) ( not ( = ?auto_390992 ?auto_390994 ) ) ( not ( = ?auto_390992 ?auto_390995 ) ) ( not ( = ?auto_390992 ?auto_390996 ) ) ( not ( = ?auto_390992 ?auto_390997 ) ) ( not ( = ?auto_390992 ?auto_390998 ) ) ( not ( = ?auto_390992 ?auto_390999 ) ) ( not ( = ?auto_390992 ?auto_391000 ) ) ( not ( = ?auto_390993 ?auto_390994 ) ) ( not ( = ?auto_390993 ?auto_390995 ) ) ( not ( = ?auto_390993 ?auto_390996 ) ) ( not ( = ?auto_390993 ?auto_390997 ) ) ( not ( = ?auto_390993 ?auto_390998 ) ) ( not ( = ?auto_390993 ?auto_390999 ) ) ( not ( = ?auto_390993 ?auto_391000 ) ) ( not ( = ?auto_390994 ?auto_390995 ) ) ( not ( = ?auto_390994 ?auto_390996 ) ) ( not ( = ?auto_390994 ?auto_390997 ) ) ( not ( = ?auto_390994 ?auto_390998 ) ) ( not ( = ?auto_390994 ?auto_390999 ) ) ( not ( = ?auto_390994 ?auto_391000 ) ) ( not ( = ?auto_390995 ?auto_390996 ) ) ( not ( = ?auto_390995 ?auto_390997 ) ) ( not ( = ?auto_390995 ?auto_390998 ) ) ( not ( = ?auto_390995 ?auto_390999 ) ) ( not ( = ?auto_390995 ?auto_391000 ) ) ( not ( = ?auto_390996 ?auto_390997 ) ) ( not ( = ?auto_390996 ?auto_390998 ) ) ( not ( = ?auto_390996 ?auto_390999 ) ) ( not ( = ?auto_390996 ?auto_391000 ) ) ( not ( = ?auto_390997 ?auto_390998 ) ) ( not ( = ?auto_390997 ?auto_390999 ) ) ( not ( = ?auto_390997 ?auto_391000 ) ) ( not ( = ?auto_390998 ?auto_390999 ) ) ( not ( = ?auto_390998 ?auto_391000 ) ) ( not ( = ?auto_390999 ?auto_391000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_390999 ?auto_391000 )
      ( !STACK ?auto_390999 ?auto_390998 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391016 - BLOCK
      ?auto_391017 - BLOCK
      ?auto_391018 - BLOCK
      ?auto_391019 - BLOCK
      ?auto_391020 - BLOCK
      ?auto_391021 - BLOCK
      ?auto_391022 - BLOCK
      ?auto_391023 - BLOCK
      ?auto_391024 - BLOCK
      ?auto_391025 - BLOCK
      ?auto_391026 - BLOCK
      ?auto_391027 - BLOCK
      ?auto_391028 - BLOCK
      ?auto_391029 - BLOCK
      ?auto_391030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_391029 ) ( ON-TABLE ?auto_391030 ) ( CLEAR ?auto_391030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_391016 ) ( ON ?auto_391017 ?auto_391016 ) ( ON ?auto_391018 ?auto_391017 ) ( ON ?auto_391019 ?auto_391018 ) ( ON ?auto_391020 ?auto_391019 ) ( ON ?auto_391021 ?auto_391020 ) ( ON ?auto_391022 ?auto_391021 ) ( ON ?auto_391023 ?auto_391022 ) ( ON ?auto_391024 ?auto_391023 ) ( ON ?auto_391025 ?auto_391024 ) ( ON ?auto_391026 ?auto_391025 ) ( ON ?auto_391027 ?auto_391026 ) ( ON ?auto_391028 ?auto_391027 ) ( ON ?auto_391029 ?auto_391028 ) ( not ( = ?auto_391016 ?auto_391017 ) ) ( not ( = ?auto_391016 ?auto_391018 ) ) ( not ( = ?auto_391016 ?auto_391019 ) ) ( not ( = ?auto_391016 ?auto_391020 ) ) ( not ( = ?auto_391016 ?auto_391021 ) ) ( not ( = ?auto_391016 ?auto_391022 ) ) ( not ( = ?auto_391016 ?auto_391023 ) ) ( not ( = ?auto_391016 ?auto_391024 ) ) ( not ( = ?auto_391016 ?auto_391025 ) ) ( not ( = ?auto_391016 ?auto_391026 ) ) ( not ( = ?auto_391016 ?auto_391027 ) ) ( not ( = ?auto_391016 ?auto_391028 ) ) ( not ( = ?auto_391016 ?auto_391029 ) ) ( not ( = ?auto_391016 ?auto_391030 ) ) ( not ( = ?auto_391017 ?auto_391018 ) ) ( not ( = ?auto_391017 ?auto_391019 ) ) ( not ( = ?auto_391017 ?auto_391020 ) ) ( not ( = ?auto_391017 ?auto_391021 ) ) ( not ( = ?auto_391017 ?auto_391022 ) ) ( not ( = ?auto_391017 ?auto_391023 ) ) ( not ( = ?auto_391017 ?auto_391024 ) ) ( not ( = ?auto_391017 ?auto_391025 ) ) ( not ( = ?auto_391017 ?auto_391026 ) ) ( not ( = ?auto_391017 ?auto_391027 ) ) ( not ( = ?auto_391017 ?auto_391028 ) ) ( not ( = ?auto_391017 ?auto_391029 ) ) ( not ( = ?auto_391017 ?auto_391030 ) ) ( not ( = ?auto_391018 ?auto_391019 ) ) ( not ( = ?auto_391018 ?auto_391020 ) ) ( not ( = ?auto_391018 ?auto_391021 ) ) ( not ( = ?auto_391018 ?auto_391022 ) ) ( not ( = ?auto_391018 ?auto_391023 ) ) ( not ( = ?auto_391018 ?auto_391024 ) ) ( not ( = ?auto_391018 ?auto_391025 ) ) ( not ( = ?auto_391018 ?auto_391026 ) ) ( not ( = ?auto_391018 ?auto_391027 ) ) ( not ( = ?auto_391018 ?auto_391028 ) ) ( not ( = ?auto_391018 ?auto_391029 ) ) ( not ( = ?auto_391018 ?auto_391030 ) ) ( not ( = ?auto_391019 ?auto_391020 ) ) ( not ( = ?auto_391019 ?auto_391021 ) ) ( not ( = ?auto_391019 ?auto_391022 ) ) ( not ( = ?auto_391019 ?auto_391023 ) ) ( not ( = ?auto_391019 ?auto_391024 ) ) ( not ( = ?auto_391019 ?auto_391025 ) ) ( not ( = ?auto_391019 ?auto_391026 ) ) ( not ( = ?auto_391019 ?auto_391027 ) ) ( not ( = ?auto_391019 ?auto_391028 ) ) ( not ( = ?auto_391019 ?auto_391029 ) ) ( not ( = ?auto_391019 ?auto_391030 ) ) ( not ( = ?auto_391020 ?auto_391021 ) ) ( not ( = ?auto_391020 ?auto_391022 ) ) ( not ( = ?auto_391020 ?auto_391023 ) ) ( not ( = ?auto_391020 ?auto_391024 ) ) ( not ( = ?auto_391020 ?auto_391025 ) ) ( not ( = ?auto_391020 ?auto_391026 ) ) ( not ( = ?auto_391020 ?auto_391027 ) ) ( not ( = ?auto_391020 ?auto_391028 ) ) ( not ( = ?auto_391020 ?auto_391029 ) ) ( not ( = ?auto_391020 ?auto_391030 ) ) ( not ( = ?auto_391021 ?auto_391022 ) ) ( not ( = ?auto_391021 ?auto_391023 ) ) ( not ( = ?auto_391021 ?auto_391024 ) ) ( not ( = ?auto_391021 ?auto_391025 ) ) ( not ( = ?auto_391021 ?auto_391026 ) ) ( not ( = ?auto_391021 ?auto_391027 ) ) ( not ( = ?auto_391021 ?auto_391028 ) ) ( not ( = ?auto_391021 ?auto_391029 ) ) ( not ( = ?auto_391021 ?auto_391030 ) ) ( not ( = ?auto_391022 ?auto_391023 ) ) ( not ( = ?auto_391022 ?auto_391024 ) ) ( not ( = ?auto_391022 ?auto_391025 ) ) ( not ( = ?auto_391022 ?auto_391026 ) ) ( not ( = ?auto_391022 ?auto_391027 ) ) ( not ( = ?auto_391022 ?auto_391028 ) ) ( not ( = ?auto_391022 ?auto_391029 ) ) ( not ( = ?auto_391022 ?auto_391030 ) ) ( not ( = ?auto_391023 ?auto_391024 ) ) ( not ( = ?auto_391023 ?auto_391025 ) ) ( not ( = ?auto_391023 ?auto_391026 ) ) ( not ( = ?auto_391023 ?auto_391027 ) ) ( not ( = ?auto_391023 ?auto_391028 ) ) ( not ( = ?auto_391023 ?auto_391029 ) ) ( not ( = ?auto_391023 ?auto_391030 ) ) ( not ( = ?auto_391024 ?auto_391025 ) ) ( not ( = ?auto_391024 ?auto_391026 ) ) ( not ( = ?auto_391024 ?auto_391027 ) ) ( not ( = ?auto_391024 ?auto_391028 ) ) ( not ( = ?auto_391024 ?auto_391029 ) ) ( not ( = ?auto_391024 ?auto_391030 ) ) ( not ( = ?auto_391025 ?auto_391026 ) ) ( not ( = ?auto_391025 ?auto_391027 ) ) ( not ( = ?auto_391025 ?auto_391028 ) ) ( not ( = ?auto_391025 ?auto_391029 ) ) ( not ( = ?auto_391025 ?auto_391030 ) ) ( not ( = ?auto_391026 ?auto_391027 ) ) ( not ( = ?auto_391026 ?auto_391028 ) ) ( not ( = ?auto_391026 ?auto_391029 ) ) ( not ( = ?auto_391026 ?auto_391030 ) ) ( not ( = ?auto_391027 ?auto_391028 ) ) ( not ( = ?auto_391027 ?auto_391029 ) ) ( not ( = ?auto_391027 ?auto_391030 ) ) ( not ( = ?auto_391028 ?auto_391029 ) ) ( not ( = ?auto_391028 ?auto_391030 ) ) ( not ( = ?auto_391029 ?auto_391030 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_391030 )
      ( !STACK ?auto_391030 ?auto_391029 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391046 - BLOCK
      ?auto_391047 - BLOCK
      ?auto_391048 - BLOCK
      ?auto_391049 - BLOCK
      ?auto_391050 - BLOCK
      ?auto_391051 - BLOCK
      ?auto_391052 - BLOCK
      ?auto_391053 - BLOCK
      ?auto_391054 - BLOCK
      ?auto_391055 - BLOCK
      ?auto_391056 - BLOCK
      ?auto_391057 - BLOCK
      ?auto_391058 - BLOCK
      ?auto_391059 - BLOCK
      ?auto_391060 - BLOCK
    )
    :vars
    (
      ?auto_391061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391060 ?auto_391061 ) ( ON-TABLE ?auto_391046 ) ( ON ?auto_391047 ?auto_391046 ) ( ON ?auto_391048 ?auto_391047 ) ( ON ?auto_391049 ?auto_391048 ) ( ON ?auto_391050 ?auto_391049 ) ( ON ?auto_391051 ?auto_391050 ) ( ON ?auto_391052 ?auto_391051 ) ( ON ?auto_391053 ?auto_391052 ) ( ON ?auto_391054 ?auto_391053 ) ( ON ?auto_391055 ?auto_391054 ) ( ON ?auto_391056 ?auto_391055 ) ( ON ?auto_391057 ?auto_391056 ) ( ON ?auto_391058 ?auto_391057 ) ( not ( = ?auto_391046 ?auto_391047 ) ) ( not ( = ?auto_391046 ?auto_391048 ) ) ( not ( = ?auto_391046 ?auto_391049 ) ) ( not ( = ?auto_391046 ?auto_391050 ) ) ( not ( = ?auto_391046 ?auto_391051 ) ) ( not ( = ?auto_391046 ?auto_391052 ) ) ( not ( = ?auto_391046 ?auto_391053 ) ) ( not ( = ?auto_391046 ?auto_391054 ) ) ( not ( = ?auto_391046 ?auto_391055 ) ) ( not ( = ?auto_391046 ?auto_391056 ) ) ( not ( = ?auto_391046 ?auto_391057 ) ) ( not ( = ?auto_391046 ?auto_391058 ) ) ( not ( = ?auto_391046 ?auto_391059 ) ) ( not ( = ?auto_391046 ?auto_391060 ) ) ( not ( = ?auto_391046 ?auto_391061 ) ) ( not ( = ?auto_391047 ?auto_391048 ) ) ( not ( = ?auto_391047 ?auto_391049 ) ) ( not ( = ?auto_391047 ?auto_391050 ) ) ( not ( = ?auto_391047 ?auto_391051 ) ) ( not ( = ?auto_391047 ?auto_391052 ) ) ( not ( = ?auto_391047 ?auto_391053 ) ) ( not ( = ?auto_391047 ?auto_391054 ) ) ( not ( = ?auto_391047 ?auto_391055 ) ) ( not ( = ?auto_391047 ?auto_391056 ) ) ( not ( = ?auto_391047 ?auto_391057 ) ) ( not ( = ?auto_391047 ?auto_391058 ) ) ( not ( = ?auto_391047 ?auto_391059 ) ) ( not ( = ?auto_391047 ?auto_391060 ) ) ( not ( = ?auto_391047 ?auto_391061 ) ) ( not ( = ?auto_391048 ?auto_391049 ) ) ( not ( = ?auto_391048 ?auto_391050 ) ) ( not ( = ?auto_391048 ?auto_391051 ) ) ( not ( = ?auto_391048 ?auto_391052 ) ) ( not ( = ?auto_391048 ?auto_391053 ) ) ( not ( = ?auto_391048 ?auto_391054 ) ) ( not ( = ?auto_391048 ?auto_391055 ) ) ( not ( = ?auto_391048 ?auto_391056 ) ) ( not ( = ?auto_391048 ?auto_391057 ) ) ( not ( = ?auto_391048 ?auto_391058 ) ) ( not ( = ?auto_391048 ?auto_391059 ) ) ( not ( = ?auto_391048 ?auto_391060 ) ) ( not ( = ?auto_391048 ?auto_391061 ) ) ( not ( = ?auto_391049 ?auto_391050 ) ) ( not ( = ?auto_391049 ?auto_391051 ) ) ( not ( = ?auto_391049 ?auto_391052 ) ) ( not ( = ?auto_391049 ?auto_391053 ) ) ( not ( = ?auto_391049 ?auto_391054 ) ) ( not ( = ?auto_391049 ?auto_391055 ) ) ( not ( = ?auto_391049 ?auto_391056 ) ) ( not ( = ?auto_391049 ?auto_391057 ) ) ( not ( = ?auto_391049 ?auto_391058 ) ) ( not ( = ?auto_391049 ?auto_391059 ) ) ( not ( = ?auto_391049 ?auto_391060 ) ) ( not ( = ?auto_391049 ?auto_391061 ) ) ( not ( = ?auto_391050 ?auto_391051 ) ) ( not ( = ?auto_391050 ?auto_391052 ) ) ( not ( = ?auto_391050 ?auto_391053 ) ) ( not ( = ?auto_391050 ?auto_391054 ) ) ( not ( = ?auto_391050 ?auto_391055 ) ) ( not ( = ?auto_391050 ?auto_391056 ) ) ( not ( = ?auto_391050 ?auto_391057 ) ) ( not ( = ?auto_391050 ?auto_391058 ) ) ( not ( = ?auto_391050 ?auto_391059 ) ) ( not ( = ?auto_391050 ?auto_391060 ) ) ( not ( = ?auto_391050 ?auto_391061 ) ) ( not ( = ?auto_391051 ?auto_391052 ) ) ( not ( = ?auto_391051 ?auto_391053 ) ) ( not ( = ?auto_391051 ?auto_391054 ) ) ( not ( = ?auto_391051 ?auto_391055 ) ) ( not ( = ?auto_391051 ?auto_391056 ) ) ( not ( = ?auto_391051 ?auto_391057 ) ) ( not ( = ?auto_391051 ?auto_391058 ) ) ( not ( = ?auto_391051 ?auto_391059 ) ) ( not ( = ?auto_391051 ?auto_391060 ) ) ( not ( = ?auto_391051 ?auto_391061 ) ) ( not ( = ?auto_391052 ?auto_391053 ) ) ( not ( = ?auto_391052 ?auto_391054 ) ) ( not ( = ?auto_391052 ?auto_391055 ) ) ( not ( = ?auto_391052 ?auto_391056 ) ) ( not ( = ?auto_391052 ?auto_391057 ) ) ( not ( = ?auto_391052 ?auto_391058 ) ) ( not ( = ?auto_391052 ?auto_391059 ) ) ( not ( = ?auto_391052 ?auto_391060 ) ) ( not ( = ?auto_391052 ?auto_391061 ) ) ( not ( = ?auto_391053 ?auto_391054 ) ) ( not ( = ?auto_391053 ?auto_391055 ) ) ( not ( = ?auto_391053 ?auto_391056 ) ) ( not ( = ?auto_391053 ?auto_391057 ) ) ( not ( = ?auto_391053 ?auto_391058 ) ) ( not ( = ?auto_391053 ?auto_391059 ) ) ( not ( = ?auto_391053 ?auto_391060 ) ) ( not ( = ?auto_391053 ?auto_391061 ) ) ( not ( = ?auto_391054 ?auto_391055 ) ) ( not ( = ?auto_391054 ?auto_391056 ) ) ( not ( = ?auto_391054 ?auto_391057 ) ) ( not ( = ?auto_391054 ?auto_391058 ) ) ( not ( = ?auto_391054 ?auto_391059 ) ) ( not ( = ?auto_391054 ?auto_391060 ) ) ( not ( = ?auto_391054 ?auto_391061 ) ) ( not ( = ?auto_391055 ?auto_391056 ) ) ( not ( = ?auto_391055 ?auto_391057 ) ) ( not ( = ?auto_391055 ?auto_391058 ) ) ( not ( = ?auto_391055 ?auto_391059 ) ) ( not ( = ?auto_391055 ?auto_391060 ) ) ( not ( = ?auto_391055 ?auto_391061 ) ) ( not ( = ?auto_391056 ?auto_391057 ) ) ( not ( = ?auto_391056 ?auto_391058 ) ) ( not ( = ?auto_391056 ?auto_391059 ) ) ( not ( = ?auto_391056 ?auto_391060 ) ) ( not ( = ?auto_391056 ?auto_391061 ) ) ( not ( = ?auto_391057 ?auto_391058 ) ) ( not ( = ?auto_391057 ?auto_391059 ) ) ( not ( = ?auto_391057 ?auto_391060 ) ) ( not ( = ?auto_391057 ?auto_391061 ) ) ( not ( = ?auto_391058 ?auto_391059 ) ) ( not ( = ?auto_391058 ?auto_391060 ) ) ( not ( = ?auto_391058 ?auto_391061 ) ) ( not ( = ?auto_391059 ?auto_391060 ) ) ( not ( = ?auto_391059 ?auto_391061 ) ) ( not ( = ?auto_391060 ?auto_391061 ) ) ( CLEAR ?auto_391058 ) ( ON ?auto_391059 ?auto_391060 ) ( CLEAR ?auto_391059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_391046 ?auto_391047 ?auto_391048 ?auto_391049 ?auto_391050 ?auto_391051 ?auto_391052 ?auto_391053 ?auto_391054 ?auto_391055 ?auto_391056 ?auto_391057 ?auto_391058 ?auto_391059 )
      ( MAKE-15PILE ?auto_391046 ?auto_391047 ?auto_391048 ?auto_391049 ?auto_391050 ?auto_391051 ?auto_391052 ?auto_391053 ?auto_391054 ?auto_391055 ?auto_391056 ?auto_391057 ?auto_391058 ?auto_391059 ?auto_391060 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391077 - BLOCK
      ?auto_391078 - BLOCK
      ?auto_391079 - BLOCK
      ?auto_391080 - BLOCK
      ?auto_391081 - BLOCK
      ?auto_391082 - BLOCK
      ?auto_391083 - BLOCK
      ?auto_391084 - BLOCK
      ?auto_391085 - BLOCK
      ?auto_391086 - BLOCK
      ?auto_391087 - BLOCK
      ?auto_391088 - BLOCK
      ?auto_391089 - BLOCK
      ?auto_391090 - BLOCK
      ?auto_391091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391091 ) ( ON-TABLE ?auto_391077 ) ( ON ?auto_391078 ?auto_391077 ) ( ON ?auto_391079 ?auto_391078 ) ( ON ?auto_391080 ?auto_391079 ) ( ON ?auto_391081 ?auto_391080 ) ( ON ?auto_391082 ?auto_391081 ) ( ON ?auto_391083 ?auto_391082 ) ( ON ?auto_391084 ?auto_391083 ) ( ON ?auto_391085 ?auto_391084 ) ( ON ?auto_391086 ?auto_391085 ) ( ON ?auto_391087 ?auto_391086 ) ( ON ?auto_391088 ?auto_391087 ) ( ON ?auto_391089 ?auto_391088 ) ( not ( = ?auto_391077 ?auto_391078 ) ) ( not ( = ?auto_391077 ?auto_391079 ) ) ( not ( = ?auto_391077 ?auto_391080 ) ) ( not ( = ?auto_391077 ?auto_391081 ) ) ( not ( = ?auto_391077 ?auto_391082 ) ) ( not ( = ?auto_391077 ?auto_391083 ) ) ( not ( = ?auto_391077 ?auto_391084 ) ) ( not ( = ?auto_391077 ?auto_391085 ) ) ( not ( = ?auto_391077 ?auto_391086 ) ) ( not ( = ?auto_391077 ?auto_391087 ) ) ( not ( = ?auto_391077 ?auto_391088 ) ) ( not ( = ?auto_391077 ?auto_391089 ) ) ( not ( = ?auto_391077 ?auto_391090 ) ) ( not ( = ?auto_391077 ?auto_391091 ) ) ( not ( = ?auto_391078 ?auto_391079 ) ) ( not ( = ?auto_391078 ?auto_391080 ) ) ( not ( = ?auto_391078 ?auto_391081 ) ) ( not ( = ?auto_391078 ?auto_391082 ) ) ( not ( = ?auto_391078 ?auto_391083 ) ) ( not ( = ?auto_391078 ?auto_391084 ) ) ( not ( = ?auto_391078 ?auto_391085 ) ) ( not ( = ?auto_391078 ?auto_391086 ) ) ( not ( = ?auto_391078 ?auto_391087 ) ) ( not ( = ?auto_391078 ?auto_391088 ) ) ( not ( = ?auto_391078 ?auto_391089 ) ) ( not ( = ?auto_391078 ?auto_391090 ) ) ( not ( = ?auto_391078 ?auto_391091 ) ) ( not ( = ?auto_391079 ?auto_391080 ) ) ( not ( = ?auto_391079 ?auto_391081 ) ) ( not ( = ?auto_391079 ?auto_391082 ) ) ( not ( = ?auto_391079 ?auto_391083 ) ) ( not ( = ?auto_391079 ?auto_391084 ) ) ( not ( = ?auto_391079 ?auto_391085 ) ) ( not ( = ?auto_391079 ?auto_391086 ) ) ( not ( = ?auto_391079 ?auto_391087 ) ) ( not ( = ?auto_391079 ?auto_391088 ) ) ( not ( = ?auto_391079 ?auto_391089 ) ) ( not ( = ?auto_391079 ?auto_391090 ) ) ( not ( = ?auto_391079 ?auto_391091 ) ) ( not ( = ?auto_391080 ?auto_391081 ) ) ( not ( = ?auto_391080 ?auto_391082 ) ) ( not ( = ?auto_391080 ?auto_391083 ) ) ( not ( = ?auto_391080 ?auto_391084 ) ) ( not ( = ?auto_391080 ?auto_391085 ) ) ( not ( = ?auto_391080 ?auto_391086 ) ) ( not ( = ?auto_391080 ?auto_391087 ) ) ( not ( = ?auto_391080 ?auto_391088 ) ) ( not ( = ?auto_391080 ?auto_391089 ) ) ( not ( = ?auto_391080 ?auto_391090 ) ) ( not ( = ?auto_391080 ?auto_391091 ) ) ( not ( = ?auto_391081 ?auto_391082 ) ) ( not ( = ?auto_391081 ?auto_391083 ) ) ( not ( = ?auto_391081 ?auto_391084 ) ) ( not ( = ?auto_391081 ?auto_391085 ) ) ( not ( = ?auto_391081 ?auto_391086 ) ) ( not ( = ?auto_391081 ?auto_391087 ) ) ( not ( = ?auto_391081 ?auto_391088 ) ) ( not ( = ?auto_391081 ?auto_391089 ) ) ( not ( = ?auto_391081 ?auto_391090 ) ) ( not ( = ?auto_391081 ?auto_391091 ) ) ( not ( = ?auto_391082 ?auto_391083 ) ) ( not ( = ?auto_391082 ?auto_391084 ) ) ( not ( = ?auto_391082 ?auto_391085 ) ) ( not ( = ?auto_391082 ?auto_391086 ) ) ( not ( = ?auto_391082 ?auto_391087 ) ) ( not ( = ?auto_391082 ?auto_391088 ) ) ( not ( = ?auto_391082 ?auto_391089 ) ) ( not ( = ?auto_391082 ?auto_391090 ) ) ( not ( = ?auto_391082 ?auto_391091 ) ) ( not ( = ?auto_391083 ?auto_391084 ) ) ( not ( = ?auto_391083 ?auto_391085 ) ) ( not ( = ?auto_391083 ?auto_391086 ) ) ( not ( = ?auto_391083 ?auto_391087 ) ) ( not ( = ?auto_391083 ?auto_391088 ) ) ( not ( = ?auto_391083 ?auto_391089 ) ) ( not ( = ?auto_391083 ?auto_391090 ) ) ( not ( = ?auto_391083 ?auto_391091 ) ) ( not ( = ?auto_391084 ?auto_391085 ) ) ( not ( = ?auto_391084 ?auto_391086 ) ) ( not ( = ?auto_391084 ?auto_391087 ) ) ( not ( = ?auto_391084 ?auto_391088 ) ) ( not ( = ?auto_391084 ?auto_391089 ) ) ( not ( = ?auto_391084 ?auto_391090 ) ) ( not ( = ?auto_391084 ?auto_391091 ) ) ( not ( = ?auto_391085 ?auto_391086 ) ) ( not ( = ?auto_391085 ?auto_391087 ) ) ( not ( = ?auto_391085 ?auto_391088 ) ) ( not ( = ?auto_391085 ?auto_391089 ) ) ( not ( = ?auto_391085 ?auto_391090 ) ) ( not ( = ?auto_391085 ?auto_391091 ) ) ( not ( = ?auto_391086 ?auto_391087 ) ) ( not ( = ?auto_391086 ?auto_391088 ) ) ( not ( = ?auto_391086 ?auto_391089 ) ) ( not ( = ?auto_391086 ?auto_391090 ) ) ( not ( = ?auto_391086 ?auto_391091 ) ) ( not ( = ?auto_391087 ?auto_391088 ) ) ( not ( = ?auto_391087 ?auto_391089 ) ) ( not ( = ?auto_391087 ?auto_391090 ) ) ( not ( = ?auto_391087 ?auto_391091 ) ) ( not ( = ?auto_391088 ?auto_391089 ) ) ( not ( = ?auto_391088 ?auto_391090 ) ) ( not ( = ?auto_391088 ?auto_391091 ) ) ( not ( = ?auto_391089 ?auto_391090 ) ) ( not ( = ?auto_391089 ?auto_391091 ) ) ( not ( = ?auto_391090 ?auto_391091 ) ) ( CLEAR ?auto_391089 ) ( ON ?auto_391090 ?auto_391091 ) ( CLEAR ?auto_391090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_391077 ?auto_391078 ?auto_391079 ?auto_391080 ?auto_391081 ?auto_391082 ?auto_391083 ?auto_391084 ?auto_391085 ?auto_391086 ?auto_391087 ?auto_391088 ?auto_391089 ?auto_391090 )
      ( MAKE-15PILE ?auto_391077 ?auto_391078 ?auto_391079 ?auto_391080 ?auto_391081 ?auto_391082 ?auto_391083 ?auto_391084 ?auto_391085 ?auto_391086 ?auto_391087 ?auto_391088 ?auto_391089 ?auto_391090 ?auto_391091 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391107 - BLOCK
      ?auto_391108 - BLOCK
      ?auto_391109 - BLOCK
      ?auto_391110 - BLOCK
      ?auto_391111 - BLOCK
      ?auto_391112 - BLOCK
      ?auto_391113 - BLOCK
      ?auto_391114 - BLOCK
      ?auto_391115 - BLOCK
      ?auto_391116 - BLOCK
      ?auto_391117 - BLOCK
      ?auto_391118 - BLOCK
      ?auto_391119 - BLOCK
      ?auto_391120 - BLOCK
      ?auto_391121 - BLOCK
    )
    :vars
    (
      ?auto_391122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391121 ?auto_391122 ) ( ON-TABLE ?auto_391107 ) ( ON ?auto_391108 ?auto_391107 ) ( ON ?auto_391109 ?auto_391108 ) ( ON ?auto_391110 ?auto_391109 ) ( ON ?auto_391111 ?auto_391110 ) ( ON ?auto_391112 ?auto_391111 ) ( ON ?auto_391113 ?auto_391112 ) ( ON ?auto_391114 ?auto_391113 ) ( ON ?auto_391115 ?auto_391114 ) ( ON ?auto_391116 ?auto_391115 ) ( ON ?auto_391117 ?auto_391116 ) ( ON ?auto_391118 ?auto_391117 ) ( not ( = ?auto_391107 ?auto_391108 ) ) ( not ( = ?auto_391107 ?auto_391109 ) ) ( not ( = ?auto_391107 ?auto_391110 ) ) ( not ( = ?auto_391107 ?auto_391111 ) ) ( not ( = ?auto_391107 ?auto_391112 ) ) ( not ( = ?auto_391107 ?auto_391113 ) ) ( not ( = ?auto_391107 ?auto_391114 ) ) ( not ( = ?auto_391107 ?auto_391115 ) ) ( not ( = ?auto_391107 ?auto_391116 ) ) ( not ( = ?auto_391107 ?auto_391117 ) ) ( not ( = ?auto_391107 ?auto_391118 ) ) ( not ( = ?auto_391107 ?auto_391119 ) ) ( not ( = ?auto_391107 ?auto_391120 ) ) ( not ( = ?auto_391107 ?auto_391121 ) ) ( not ( = ?auto_391107 ?auto_391122 ) ) ( not ( = ?auto_391108 ?auto_391109 ) ) ( not ( = ?auto_391108 ?auto_391110 ) ) ( not ( = ?auto_391108 ?auto_391111 ) ) ( not ( = ?auto_391108 ?auto_391112 ) ) ( not ( = ?auto_391108 ?auto_391113 ) ) ( not ( = ?auto_391108 ?auto_391114 ) ) ( not ( = ?auto_391108 ?auto_391115 ) ) ( not ( = ?auto_391108 ?auto_391116 ) ) ( not ( = ?auto_391108 ?auto_391117 ) ) ( not ( = ?auto_391108 ?auto_391118 ) ) ( not ( = ?auto_391108 ?auto_391119 ) ) ( not ( = ?auto_391108 ?auto_391120 ) ) ( not ( = ?auto_391108 ?auto_391121 ) ) ( not ( = ?auto_391108 ?auto_391122 ) ) ( not ( = ?auto_391109 ?auto_391110 ) ) ( not ( = ?auto_391109 ?auto_391111 ) ) ( not ( = ?auto_391109 ?auto_391112 ) ) ( not ( = ?auto_391109 ?auto_391113 ) ) ( not ( = ?auto_391109 ?auto_391114 ) ) ( not ( = ?auto_391109 ?auto_391115 ) ) ( not ( = ?auto_391109 ?auto_391116 ) ) ( not ( = ?auto_391109 ?auto_391117 ) ) ( not ( = ?auto_391109 ?auto_391118 ) ) ( not ( = ?auto_391109 ?auto_391119 ) ) ( not ( = ?auto_391109 ?auto_391120 ) ) ( not ( = ?auto_391109 ?auto_391121 ) ) ( not ( = ?auto_391109 ?auto_391122 ) ) ( not ( = ?auto_391110 ?auto_391111 ) ) ( not ( = ?auto_391110 ?auto_391112 ) ) ( not ( = ?auto_391110 ?auto_391113 ) ) ( not ( = ?auto_391110 ?auto_391114 ) ) ( not ( = ?auto_391110 ?auto_391115 ) ) ( not ( = ?auto_391110 ?auto_391116 ) ) ( not ( = ?auto_391110 ?auto_391117 ) ) ( not ( = ?auto_391110 ?auto_391118 ) ) ( not ( = ?auto_391110 ?auto_391119 ) ) ( not ( = ?auto_391110 ?auto_391120 ) ) ( not ( = ?auto_391110 ?auto_391121 ) ) ( not ( = ?auto_391110 ?auto_391122 ) ) ( not ( = ?auto_391111 ?auto_391112 ) ) ( not ( = ?auto_391111 ?auto_391113 ) ) ( not ( = ?auto_391111 ?auto_391114 ) ) ( not ( = ?auto_391111 ?auto_391115 ) ) ( not ( = ?auto_391111 ?auto_391116 ) ) ( not ( = ?auto_391111 ?auto_391117 ) ) ( not ( = ?auto_391111 ?auto_391118 ) ) ( not ( = ?auto_391111 ?auto_391119 ) ) ( not ( = ?auto_391111 ?auto_391120 ) ) ( not ( = ?auto_391111 ?auto_391121 ) ) ( not ( = ?auto_391111 ?auto_391122 ) ) ( not ( = ?auto_391112 ?auto_391113 ) ) ( not ( = ?auto_391112 ?auto_391114 ) ) ( not ( = ?auto_391112 ?auto_391115 ) ) ( not ( = ?auto_391112 ?auto_391116 ) ) ( not ( = ?auto_391112 ?auto_391117 ) ) ( not ( = ?auto_391112 ?auto_391118 ) ) ( not ( = ?auto_391112 ?auto_391119 ) ) ( not ( = ?auto_391112 ?auto_391120 ) ) ( not ( = ?auto_391112 ?auto_391121 ) ) ( not ( = ?auto_391112 ?auto_391122 ) ) ( not ( = ?auto_391113 ?auto_391114 ) ) ( not ( = ?auto_391113 ?auto_391115 ) ) ( not ( = ?auto_391113 ?auto_391116 ) ) ( not ( = ?auto_391113 ?auto_391117 ) ) ( not ( = ?auto_391113 ?auto_391118 ) ) ( not ( = ?auto_391113 ?auto_391119 ) ) ( not ( = ?auto_391113 ?auto_391120 ) ) ( not ( = ?auto_391113 ?auto_391121 ) ) ( not ( = ?auto_391113 ?auto_391122 ) ) ( not ( = ?auto_391114 ?auto_391115 ) ) ( not ( = ?auto_391114 ?auto_391116 ) ) ( not ( = ?auto_391114 ?auto_391117 ) ) ( not ( = ?auto_391114 ?auto_391118 ) ) ( not ( = ?auto_391114 ?auto_391119 ) ) ( not ( = ?auto_391114 ?auto_391120 ) ) ( not ( = ?auto_391114 ?auto_391121 ) ) ( not ( = ?auto_391114 ?auto_391122 ) ) ( not ( = ?auto_391115 ?auto_391116 ) ) ( not ( = ?auto_391115 ?auto_391117 ) ) ( not ( = ?auto_391115 ?auto_391118 ) ) ( not ( = ?auto_391115 ?auto_391119 ) ) ( not ( = ?auto_391115 ?auto_391120 ) ) ( not ( = ?auto_391115 ?auto_391121 ) ) ( not ( = ?auto_391115 ?auto_391122 ) ) ( not ( = ?auto_391116 ?auto_391117 ) ) ( not ( = ?auto_391116 ?auto_391118 ) ) ( not ( = ?auto_391116 ?auto_391119 ) ) ( not ( = ?auto_391116 ?auto_391120 ) ) ( not ( = ?auto_391116 ?auto_391121 ) ) ( not ( = ?auto_391116 ?auto_391122 ) ) ( not ( = ?auto_391117 ?auto_391118 ) ) ( not ( = ?auto_391117 ?auto_391119 ) ) ( not ( = ?auto_391117 ?auto_391120 ) ) ( not ( = ?auto_391117 ?auto_391121 ) ) ( not ( = ?auto_391117 ?auto_391122 ) ) ( not ( = ?auto_391118 ?auto_391119 ) ) ( not ( = ?auto_391118 ?auto_391120 ) ) ( not ( = ?auto_391118 ?auto_391121 ) ) ( not ( = ?auto_391118 ?auto_391122 ) ) ( not ( = ?auto_391119 ?auto_391120 ) ) ( not ( = ?auto_391119 ?auto_391121 ) ) ( not ( = ?auto_391119 ?auto_391122 ) ) ( not ( = ?auto_391120 ?auto_391121 ) ) ( not ( = ?auto_391120 ?auto_391122 ) ) ( not ( = ?auto_391121 ?auto_391122 ) ) ( ON ?auto_391120 ?auto_391121 ) ( CLEAR ?auto_391118 ) ( ON ?auto_391119 ?auto_391120 ) ( CLEAR ?auto_391119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_391107 ?auto_391108 ?auto_391109 ?auto_391110 ?auto_391111 ?auto_391112 ?auto_391113 ?auto_391114 ?auto_391115 ?auto_391116 ?auto_391117 ?auto_391118 ?auto_391119 )
      ( MAKE-15PILE ?auto_391107 ?auto_391108 ?auto_391109 ?auto_391110 ?auto_391111 ?auto_391112 ?auto_391113 ?auto_391114 ?auto_391115 ?auto_391116 ?auto_391117 ?auto_391118 ?auto_391119 ?auto_391120 ?auto_391121 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391138 - BLOCK
      ?auto_391139 - BLOCK
      ?auto_391140 - BLOCK
      ?auto_391141 - BLOCK
      ?auto_391142 - BLOCK
      ?auto_391143 - BLOCK
      ?auto_391144 - BLOCK
      ?auto_391145 - BLOCK
      ?auto_391146 - BLOCK
      ?auto_391147 - BLOCK
      ?auto_391148 - BLOCK
      ?auto_391149 - BLOCK
      ?auto_391150 - BLOCK
      ?auto_391151 - BLOCK
      ?auto_391152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391152 ) ( ON-TABLE ?auto_391138 ) ( ON ?auto_391139 ?auto_391138 ) ( ON ?auto_391140 ?auto_391139 ) ( ON ?auto_391141 ?auto_391140 ) ( ON ?auto_391142 ?auto_391141 ) ( ON ?auto_391143 ?auto_391142 ) ( ON ?auto_391144 ?auto_391143 ) ( ON ?auto_391145 ?auto_391144 ) ( ON ?auto_391146 ?auto_391145 ) ( ON ?auto_391147 ?auto_391146 ) ( ON ?auto_391148 ?auto_391147 ) ( ON ?auto_391149 ?auto_391148 ) ( not ( = ?auto_391138 ?auto_391139 ) ) ( not ( = ?auto_391138 ?auto_391140 ) ) ( not ( = ?auto_391138 ?auto_391141 ) ) ( not ( = ?auto_391138 ?auto_391142 ) ) ( not ( = ?auto_391138 ?auto_391143 ) ) ( not ( = ?auto_391138 ?auto_391144 ) ) ( not ( = ?auto_391138 ?auto_391145 ) ) ( not ( = ?auto_391138 ?auto_391146 ) ) ( not ( = ?auto_391138 ?auto_391147 ) ) ( not ( = ?auto_391138 ?auto_391148 ) ) ( not ( = ?auto_391138 ?auto_391149 ) ) ( not ( = ?auto_391138 ?auto_391150 ) ) ( not ( = ?auto_391138 ?auto_391151 ) ) ( not ( = ?auto_391138 ?auto_391152 ) ) ( not ( = ?auto_391139 ?auto_391140 ) ) ( not ( = ?auto_391139 ?auto_391141 ) ) ( not ( = ?auto_391139 ?auto_391142 ) ) ( not ( = ?auto_391139 ?auto_391143 ) ) ( not ( = ?auto_391139 ?auto_391144 ) ) ( not ( = ?auto_391139 ?auto_391145 ) ) ( not ( = ?auto_391139 ?auto_391146 ) ) ( not ( = ?auto_391139 ?auto_391147 ) ) ( not ( = ?auto_391139 ?auto_391148 ) ) ( not ( = ?auto_391139 ?auto_391149 ) ) ( not ( = ?auto_391139 ?auto_391150 ) ) ( not ( = ?auto_391139 ?auto_391151 ) ) ( not ( = ?auto_391139 ?auto_391152 ) ) ( not ( = ?auto_391140 ?auto_391141 ) ) ( not ( = ?auto_391140 ?auto_391142 ) ) ( not ( = ?auto_391140 ?auto_391143 ) ) ( not ( = ?auto_391140 ?auto_391144 ) ) ( not ( = ?auto_391140 ?auto_391145 ) ) ( not ( = ?auto_391140 ?auto_391146 ) ) ( not ( = ?auto_391140 ?auto_391147 ) ) ( not ( = ?auto_391140 ?auto_391148 ) ) ( not ( = ?auto_391140 ?auto_391149 ) ) ( not ( = ?auto_391140 ?auto_391150 ) ) ( not ( = ?auto_391140 ?auto_391151 ) ) ( not ( = ?auto_391140 ?auto_391152 ) ) ( not ( = ?auto_391141 ?auto_391142 ) ) ( not ( = ?auto_391141 ?auto_391143 ) ) ( not ( = ?auto_391141 ?auto_391144 ) ) ( not ( = ?auto_391141 ?auto_391145 ) ) ( not ( = ?auto_391141 ?auto_391146 ) ) ( not ( = ?auto_391141 ?auto_391147 ) ) ( not ( = ?auto_391141 ?auto_391148 ) ) ( not ( = ?auto_391141 ?auto_391149 ) ) ( not ( = ?auto_391141 ?auto_391150 ) ) ( not ( = ?auto_391141 ?auto_391151 ) ) ( not ( = ?auto_391141 ?auto_391152 ) ) ( not ( = ?auto_391142 ?auto_391143 ) ) ( not ( = ?auto_391142 ?auto_391144 ) ) ( not ( = ?auto_391142 ?auto_391145 ) ) ( not ( = ?auto_391142 ?auto_391146 ) ) ( not ( = ?auto_391142 ?auto_391147 ) ) ( not ( = ?auto_391142 ?auto_391148 ) ) ( not ( = ?auto_391142 ?auto_391149 ) ) ( not ( = ?auto_391142 ?auto_391150 ) ) ( not ( = ?auto_391142 ?auto_391151 ) ) ( not ( = ?auto_391142 ?auto_391152 ) ) ( not ( = ?auto_391143 ?auto_391144 ) ) ( not ( = ?auto_391143 ?auto_391145 ) ) ( not ( = ?auto_391143 ?auto_391146 ) ) ( not ( = ?auto_391143 ?auto_391147 ) ) ( not ( = ?auto_391143 ?auto_391148 ) ) ( not ( = ?auto_391143 ?auto_391149 ) ) ( not ( = ?auto_391143 ?auto_391150 ) ) ( not ( = ?auto_391143 ?auto_391151 ) ) ( not ( = ?auto_391143 ?auto_391152 ) ) ( not ( = ?auto_391144 ?auto_391145 ) ) ( not ( = ?auto_391144 ?auto_391146 ) ) ( not ( = ?auto_391144 ?auto_391147 ) ) ( not ( = ?auto_391144 ?auto_391148 ) ) ( not ( = ?auto_391144 ?auto_391149 ) ) ( not ( = ?auto_391144 ?auto_391150 ) ) ( not ( = ?auto_391144 ?auto_391151 ) ) ( not ( = ?auto_391144 ?auto_391152 ) ) ( not ( = ?auto_391145 ?auto_391146 ) ) ( not ( = ?auto_391145 ?auto_391147 ) ) ( not ( = ?auto_391145 ?auto_391148 ) ) ( not ( = ?auto_391145 ?auto_391149 ) ) ( not ( = ?auto_391145 ?auto_391150 ) ) ( not ( = ?auto_391145 ?auto_391151 ) ) ( not ( = ?auto_391145 ?auto_391152 ) ) ( not ( = ?auto_391146 ?auto_391147 ) ) ( not ( = ?auto_391146 ?auto_391148 ) ) ( not ( = ?auto_391146 ?auto_391149 ) ) ( not ( = ?auto_391146 ?auto_391150 ) ) ( not ( = ?auto_391146 ?auto_391151 ) ) ( not ( = ?auto_391146 ?auto_391152 ) ) ( not ( = ?auto_391147 ?auto_391148 ) ) ( not ( = ?auto_391147 ?auto_391149 ) ) ( not ( = ?auto_391147 ?auto_391150 ) ) ( not ( = ?auto_391147 ?auto_391151 ) ) ( not ( = ?auto_391147 ?auto_391152 ) ) ( not ( = ?auto_391148 ?auto_391149 ) ) ( not ( = ?auto_391148 ?auto_391150 ) ) ( not ( = ?auto_391148 ?auto_391151 ) ) ( not ( = ?auto_391148 ?auto_391152 ) ) ( not ( = ?auto_391149 ?auto_391150 ) ) ( not ( = ?auto_391149 ?auto_391151 ) ) ( not ( = ?auto_391149 ?auto_391152 ) ) ( not ( = ?auto_391150 ?auto_391151 ) ) ( not ( = ?auto_391150 ?auto_391152 ) ) ( not ( = ?auto_391151 ?auto_391152 ) ) ( ON ?auto_391151 ?auto_391152 ) ( CLEAR ?auto_391149 ) ( ON ?auto_391150 ?auto_391151 ) ( CLEAR ?auto_391150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_391138 ?auto_391139 ?auto_391140 ?auto_391141 ?auto_391142 ?auto_391143 ?auto_391144 ?auto_391145 ?auto_391146 ?auto_391147 ?auto_391148 ?auto_391149 ?auto_391150 )
      ( MAKE-15PILE ?auto_391138 ?auto_391139 ?auto_391140 ?auto_391141 ?auto_391142 ?auto_391143 ?auto_391144 ?auto_391145 ?auto_391146 ?auto_391147 ?auto_391148 ?auto_391149 ?auto_391150 ?auto_391151 ?auto_391152 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391168 - BLOCK
      ?auto_391169 - BLOCK
      ?auto_391170 - BLOCK
      ?auto_391171 - BLOCK
      ?auto_391172 - BLOCK
      ?auto_391173 - BLOCK
      ?auto_391174 - BLOCK
      ?auto_391175 - BLOCK
      ?auto_391176 - BLOCK
      ?auto_391177 - BLOCK
      ?auto_391178 - BLOCK
      ?auto_391179 - BLOCK
      ?auto_391180 - BLOCK
      ?auto_391181 - BLOCK
      ?auto_391182 - BLOCK
    )
    :vars
    (
      ?auto_391183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391182 ?auto_391183 ) ( ON-TABLE ?auto_391168 ) ( ON ?auto_391169 ?auto_391168 ) ( ON ?auto_391170 ?auto_391169 ) ( ON ?auto_391171 ?auto_391170 ) ( ON ?auto_391172 ?auto_391171 ) ( ON ?auto_391173 ?auto_391172 ) ( ON ?auto_391174 ?auto_391173 ) ( ON ?auto_391175 ?auto_391174 ) ( ON ?auto_391176 ?auto_391175 ) ( ON ?auto_391177 ?auto_391176 ) ( ON ?auto_391178 ?auto_391177 ) ( not ( = ?auto_391168 ?auto_391169 ) ) ( not ( = ?auto_391168 ?auto_391170 ) ) ( not ( = ?auto_391168 ?auto_391171 ) ) ( not ( = ?auto_391168 ?auto_391172 ) ) ( not ( = ?auto_391168 ?auto_391173 ) ) ( not ( = ?auto_391168 ?auto_391174 ) ) ( not ( = ?auto_391168 ?auto_391175 ) ) ( not ( = ?auto_391168 ?auto_391176 ) ) ( not ( = ?auto_391168 ?auto_391177 ) ) ( not ( = ?auto_391168 ?auto_391178 ) ) ( not ( = ?auto_391168 ?auto_391179 ) ) ( not ( = ?auto_391168 ?auto_391180 ) ) ( not ( = ?auto_391168 ?auto_391181 ) ) ( not ( = ?auto_391168 ?auto_391182 ) ) ( not ( = ?auto_391168 ?auto_391183 ) ) ( not ( = ?auto_391169 ?auto_391170 ) ) ( not ( = ?auto_391169 ?auto_391171 ) ) ( not ( = ?auto_391169 ?auto_391172 ) ) ( not ( = ?auto_391169 ?auto_391173 ) ) ( not ( = ?auto_391169 ?auto_391174 ) ) ( not ( = ?auto_391169 ?auto_391175 ) ) ( not ( = ?auto_391169 ?auto_391176 ) ) ( not ( = ?auto_391169 ?auto_391177 ) ) ( not ( = ?auto_391169 ?auto_391178 ) ) ( not ( = ?auto_391169 ?auto_391179 ) ) ( not ( = ?auto_391169 ?auto_391180 ) ) ( not ( = ?auto_391169 ?auto_391181 ) ) ( not ( = ?auto_391169 ?auto_391182 ) ) ( not ( = ?auto_391169 ?auto_391183 ) ) ( not ( = ?auto_391170 ?auto_391171 ) ) ( not ( = ?auto_391170 ?auto_391172 ) ) ( not ( = ?auto_391170 ?auto_391173 ) ) ( not ( = ?auto_391170 ?auto_391174 ) ) ( not ( = ?auto_391170 ?auto_391175 ) ) ( not ( = ?auto_391170 ?auto_391176 ) ) ( not ( = ?auto_391170 ?auto_391177 ) ) ( not ( = ?auto_391170 ?auto_391178 ) ) ( not ( = ?auto_391170 ?auto_391179 ) ) ( not ( = ?auto_391170 ?auto_391180 ) ) ( not ( = ?auto_391170 ?auto_391181 ) ) ( not ( = ?auto_391170 ?auto_391182 ) ) ( not ( = ?auto_391170 ?auto_391183 ) ) ( not ( = ?auto_391171 ?auto_391172 ) ) ( not ( = ?auto_391171 ?auto_391173 ) ) ( not ( = ?auto_391171 ?auto_391174 ) ) ( not ( = ?auto_391171 ?auto_391175 ) ) ( not ( = ?auto_391171 ?auto_391176 ) ) ( not ( = ?auto_391171 ?auto_391177 ) ) ( not ( = ?auto_391171 ?auto_391178 ) ) ( not ( = ?auto_391171 ?auto_391179 ) ) ( not ( = ?auto_391171 ?auto_391180 ) ) ( not ( = ?auto_391171 ?auto_391181 ) ) ( not ( = ?auto_391171 ?auto_391182 ) ) ( not ( = ?auto_391171 ?auto_391183 ) ) ( not ( = ?auto_391172 ?auto_391173 ) ) ( not ( = ?auto_391172 ?auto_391174 ) ) ( not ( = ?auto_391172 ?auto_391175 ) ) ( not ( = ?auto_391172 ?auto_391176 ) ) ( not ( = ?auto_391172 ?auto_391177 ) ) ( not ( = ?auto_391172 ?auto_391178 ) ) ( not ( = ?auto_391172 ?auto_391179 ) ) ( not ( = ?auto_391172 ?auto_391180 ) ) ( not ( = ?auto_391172 ?auto_391181 ) ) ( not ( = ?auto_391172 ?auto_391182 ) ) ( not ( = ?auto_391172 ?auto_391183 ) ) ( not ( = ?auto_391173 ?auto_391174 ) ) ( not ( = ?auto_391173 ?auto_391175 ) ) ( not ( = ?auto_391173 ?auto_391176 ) ) ( not ( = ?auto_391173 ?auto_391177 ) ) ( not ( = ?auto_391173 ?auto_391178 ) ) ( not ( = ?auto_391173 ?auto_391179 ) ) ( not ( = ?auto_391173 ?auto_391180 ) ) ( not ( = ?auto_391173 ?auto_391181 ) ) ( not ( = ?auto_391173 ?auto_391182 ) ) ( not ( = ?auto_391173 ?auto_391183 ) ) ( not ( = ?auto_391174 ?auto_391175 ) ) ( not ( = ?auto_391174 ?auto_391176 ) ) ( not ( = ?auto_391174 ?auto_391177 ) ) ( not ( = ?auto_391174 ?auto_391178 ) ) ( not ( = ?auto_391174 ?auto_391179 ) ) ( not ( = ?auto_391174 ?auto_391180 ) ) ( not ( = ?auto_391174 ?auto_391181 ) ) ( not ( = ?auto_391174 ?auto_391182 ) ) ( not ( = ?auto_391174 ?auto_391183 ) ) ( not ( = ?auto_391175 ?auto_391176 ) ) ( not ( = ?auto_391175 ?auto_391177 ) ) ( not ( = ?auto_391175 ?auto_391178 ) ) ( not ( = ?auto_391175 ?auto_391179 ) ) ( not ( = ?auto_391175 ?auto_391180 ) ) ( not ( = ?auto_391175 ?auto_391181 ) ) ( not ( = ?auto_391175 ?auto_391182 ) ) ( not ( = ?auto_391175 ?auto_391183 ) ) ( not ( = ?auto_391176 ?auto_391177 ) ) ( not ( = ?auto_391176 ?auto_391178 ) ) ( not ( = ?auto_391176 ?auto_391179 ) ) ( not ( = ?auto_391176 ?auto_391180 ) ) ( not ( = ?auto_391176 ?auto_391181 ) ) ( not ( = ?auto_391176 ?auto_391182 ) ) ( not ( = ?auto_391176 ?auto_391183 ) ) ( not ( = ?auto_391177 ?auto_391178 ) ) ( not ( = ?auto_391177 ?auto_391179 ) ) ( not ( = ?auto_391177 ?auto_391180 ) ) ( not ( = ?auto_391177 ?auto_391181 ) ) ( not ( = ?auto_391177 ?auto_391182 ) ) ( not ( = ?auto_391177 ?auto_391183 ) ) ( not ( = ?auto_391178 ?auto_391179 ) ) ( not ( = ?auto_391178 ?auto_391180 ) ) ( not ( = ?auto_391178 ?auto_391181 ) ) ( not ( = ?auto_391178 ?auto_391182 ) ) ( not ( = ?auto_391178 ?auto_391183 ) ) ( not ( = ?auto_391179 ?auto_391180 ) ) ( not ( = ?auto_391179 ?auto_391181 ) ) ( not ( = ?auto_391179 ?auto_391182 ) ) ( not ( = ?auto_391179 ?auto_391183 ) ) ( not ( = ?auto_391180 ?auto_391181 ) ) ( not ( = ?auto_391180 ?auto_391182 ) ) ( not ( = ?auto_391180 ?auto_391183 ) ) ( not ( = ?auto_391181 ?auto_391182 ) ) ( not ( = ?auto_391181 ?auto_391183 ) ) ( not ( = ?auto_391182 ?auto_391183 ) ) ( ON ?auto_391181 ?auto_391182 ) ( ON ?auto_391180 ?auto_391181 ) ( CLEAR ?auto_391178 ) ( ON ?auto_391179 ?auto_391180 ) ( CLEAR ?auto_391179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_391168 ?auto_391169 ?auto_391170 ?auto_391171 ?auto_391172 ?auto_391173 ?auto_391174 ?auto_391175 ?auto_391176 ?auto_391177 ?auto_391178 ?auto_391179 )
      ( MAKE-15PILE ?auto_391168 ?auto_391169 ?auto_391170 ?auto_391171 ?auto_391172 ?auto_391173 ?auto_391174 ?auto_391175 ?auto_391176 ?auto_391177 ?auto_391178 ?auto_391179 ?auto_391180 ?auto_391181 ?auto_391182 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391199 - BLOCK
      ?auto_391200 - BLOCK
      ?auto_391201 - BLOCK
      ?auto_391202 - BLOCK
      ?auto_391203 - BLOCK
      ?auto_391204 - BLOCK
      ?auto_391205 - BLOCK
      ?auto_391206 - BLOCK
      ?auto_391207 - BLOCK
      ?auto_391208 - BLOCK
      ?auto_391209 - BLOCK
      ?auto_391210 - BLOCK
      ?auto_391211 - BLOCK
      ?auto_391212 - BLOCK
      ?auto_391213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391213 ) ( ON-TABLE ?auto_391199 ) ( ON ?auto_391200 ?auto_391199 ) ( ON ?auto_391201 ?auto_391200 ) ( ON ?auto_391202 ?auto_391201 ) ( ON ?auto_391203 ?auto_391202 ) ( ON ?auto_391204 ?auto_391203 ) ( ON ?auto_391205 ?auto_391204 ) ( ON ?auto_391206 ?auto_391205 ) ( ON ?auto_391207 ?auto_391206 ) ( ON ?auto_391208 ?auto_391207 ) ( ON ?auto_391209 ?auto_391208 ) ( not ( = ?auto_391199 ?auto_391200 ) ) ( not ( = ?auto_391199 ?auto_391201 ) ) ( not ( = ?auto_391199 ?auto_391202 ) ) ( not ( = ?auto_391199 ?auto_391203 ) ) ( not ( = ?auto_391199 ?auto_391204 ) ) ( not ( = ?auto_391199 ?auto_391205 ) ) ( not ( = ?auto_391199 ?auto_391206 ) ) ( not ( = ?auto_391199 ?auto_391207 ) ) ( not ( = ?auto_391199 ?auto_391208 ) ) ( not ( = ?auto_391199 ?auto_391209 ) ) ( not ( = ?auto_391199 ?auto_391210 ) ) ( not ( = ?auto_391199 ?auto_391211 ) ) ( not ( = ?auto_391199 ?auto_391212 ) ) ( not ( = ?auto_391199 ?auto_391213 ) ) ( not ( = ?auto_391200 ?auto_391201 ) ) ( not ( = ?auto_391200 ?auto_391202 ) ) ( not ( = ?auto_391200 ?auto_391203 ) ) ( not ( = ?auto_391200 ?auto_391204 ) ) ( not ( = ?auto_391200 ?auto_391205 ) ) ( not ( = ?auto_391200 ?auto_391206 ) ) ( not ( = ?auto_391200 ?auto_391207 ) ) ( not ( = ?auto_391200 ?auto_391208 ) ) ( not ( = ?auto_391200 ?auto_391209 ) ) ( not ( = ?auto_391200 ?auto_391210 ) ) ( not ( = ?auto_391200 ?auto_391211 ) ) ( not ( = ?auto_391200 ?auto_391212 ) ) ( not ( = ?auto_391200 ?auto_391213 ) ) ( not ( = ?auto_391201 ?auto_391202 ) ) ( not ( = ?auto_391201 ?auto_391203 ) ) ( not ( = ?auto_391201 ?auto_391204 ) ) ( not ( = ?auto_391201 ?auto_391205 ) ) ( not ( = ?auto_391201 ?auto_391206 ) ) ( not ( = ?auto_391201 ?auto_391207 ) ) ( not ( = ?auto_391201 ?auto_391208 ) ) ( not ( = ?auto_391201 ?auto_391209 ) ) ( not ( = ?auto_391201 ?auto_391210 ) ) ( not ( = ?auto_391201 ?auto_391211 ) ) ( not ( = ?auto_391201 ?auto_391212 ) ) ( not ( = ?auto_391201 ?auto_391213 ) ) ( not ( = ?auto_391202 ?auto_391203 ) ) ( not ( = ?auto_391202 ?auto_391204 ) ) ( not ( = ?auto_391202 ?auto_391205 ) ) ( not ( = ?auto_391202 ?auto_391206 ) ) ( not ( = ?auto_391202 ?auto_391207 ) ) ( not ( = ?auto_391202 ?auto_391208 ) ) ( not ( = ?auto_391202 ?auto_391209 ) ) ( not ( = ?auto_391202 ?auto_391210 ) ) ( not ( = ?auto_391202 ?auto_391211 ) ) ( not ( = ?auto_391202 ?auto_391212 ) ) ( not ( = ?auto_391202 ?auto_391213 ) ) ( not ( = ?auto_391203 ?auto_391204 ) ) ( not ( = ?auto_391203 ?auto_391205 ) ) ( not ( = ?auto_391203 ?auto_391206 ) ) ( not ( = ?auto_391203 ?auto_391207 ) ) ( not ( = ?auto_391203 ?auto_391208 ) ) ( not ( = ?auto_391203 ?auto_391209 ) ) ( not ( = ?auto_391203 ?auto_391210 ) ) ( not ( = ?auto_391203 ?auto_391211 ) ) ( not ( = ?auto_391203 ?auto_391212 ) ) ( not ( = ?auto_391203 ?auto_391213 ) ) ( not ( = ?auto_391204 ?auto_391205 ) ) ( not ( = ?auto_391204 ?auto_391206 ) ) ( not ( = ?auto_391204 ?auto_391207 ) ) ( not ( = ?auto_391204 ?auto_391208 ) ) ( not ( = ?auto_391204 ?auto_391209 ) ) ( not ( = ?auto_391204 ?auto_391210 ) ) ( not ( = ?auto_391204 ?auto_391211 ) ) ( not ( = ?auto_391204 ?auto_391212 ) ) ( not ( = ?auto_391204 ?auto_391213 ) ) ( not ( = ?auto_391205 ?auto_391206 ) ) ( not ( = ?auto_391205 ?auto_391207 ) ) ( not ( = ?auto_391205 ?auto_391208 ) ) ( not ( = ?auto_391205 ?auto_391209 ) ) ( not ( = ?auto_391205 ?auto_391210 ) ) ( not ( = ?auto_391205 ?auto_391211 ) ) ( not ( = ?auto_391205 ?auto_391212 ) ) ( not ( = ?auto_391205 ?auto_391213 ) ) ( not ( = ?auto_391206 ?auto_391207 ) ) ( not ( = ?auto_391206 ?auto_391208 ) ) ( not ( = ?auto_391206 ?auto_391209 ) ) ( not ( = ?auto_391206 ?auto_391210 ) ) ( not ( = ?auto_391206 ?auto_391211 ) ) ( not ( = ?auto_391206 ?auto_391212 ) ) ( not ( = ?auto_391206 ?auto_391213 ) ) ( not ( = ?auto_391207 ?auto_391208 ) ) ( not ( = ?auto_391207 ?auto_391209 ) ) ( not ( = ?auto_391207 ?auto_391210 ) ) ( not ( = ?auto_391207 ?auto_391211 ) ) ( not ( = ?auto_391207 ?auto_391212 ) ) ( not ( = ?auto_391207 ?auto_391213 ) ) ( not ( = ?auto_391208 ?auto_391209 ) ) ( not ( = ?auto_391208 ?auto_391210 ) ) ( not ( = ?auto_391208 ?auto_391211 ) ) ( not ( = ?auto_391208 ?auto_391212 ) ) ( not ( = ?auto_391208 ?auto_391213 ) ) ( not ( = ?auto_391209 ?auto_391210 ) ) ( not ( = ?auto_391209 ?auto_391211 ) ) ( not ( = ?auto_391209 ?auto_391212 ) ) ( not ( = ?auto_391209 ?auto_391213 ) ) ( not ( = ?auto_391210 ?auto_391211 ) ) ( not ( = ?auto_391210 ?auto_391212 ) ) ( not ( = ?auto_391210 ?auto_391213 ) ) ( not ( = ?auto_391211 ?auto_391212 ) ) ( not ( = ?auto_391211 ?auto_391213 ) ) ( not ( = ?auto_391212 ?auto_391213 ) ) ( ON ?auto_391212 ?auto_391213 ) ( ON ?auto_391211 ?auto_391212 ) ( CLEAR ?auto_391209 ) ( ON ?auto_391210 ?auto_391211 ) ( CLEAR ?auto_391210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_391199 ?auto_391200 ?auto_391201 ?auto_391202 ?auto_391203 ?auto_391204 ?auto_391205 ?auto_391206 ?auto_391207 ?auto_391208 ?auto_391209 ?auto_391210 )
      ( MAKE-15PILE ?auto_391199 ?auto_391200 ?auto_391201 ?auto_391202 ?auto_391203 ?auto_391204 ?auto_391205 ?auto_391206 ?auto_391207 ?auto_391208 ?auto_391209 ?auto_391210 ?auto_391211 ?auto_391212 ?auto_391213 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391229 - BLOCK
      ?auto_391230 - BLOCK
      ?auto_391231 - BLOCK
      ?auto_391232 - BLOCK
      ?auto_391233 - BLOCK
      ?auto_391234 - BLOCK
      ?auto_391235 - BLOCK
      ?auto_391236 - BLOCK
      ?auto_391237 - BLOCK
      ?auto_391238 - BLOCK
      ?auto_391239 - BLOCK
      ?auto_391240 - BLOCK
      ?auto_391241 - BLOCK
      ?auto_391242 - BLOCK
      ?auto_391243 - BLOCK
    )
    :vars
    (
      ?auto_391244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391243 ?auto_391244 ) ( ON-TABLE ?auto_391229 ) ( ON ?auto_391230 ?auto_391229 ) ( ON ?auto_391231 ?auto_391230 ) ( ON ?auto_391232 ?auto_391231 ) ( ON ?auto_391233 ?auto_391232 ) ( ON ?auto_391234 ?auto_391233 ) ( ON ?auto_391235 ?auto_391234 ) ( ON ?auto_391236 ?auto_391235 ) ( ON ?auto_391237 ?auto_391236 ) ( ON ?auto_391238 ?auto_391237 ) ( not ( = ?auto_391229 ?auto_391230 ) ) ( not ( = ?auto_391229 ?auto_391231 ) ) ( not ( = ?auto_391229 ?auto_391232 ) ) ( not ( = ?auto_391229 ?auto_391233 ) ) ( not ( = ?auto_391229 ?auto_391234 ) ) ( not ( = ?auto_391229 ?auto_391235 ) ) ( not ( = ?auto_391229 ?auto_391236 ) ) ( not ( = ?auto_391229 ?auto_391237 ) ) ( not ( = ?auto_391229 ?auto_391238 ) ) ( not ( = ?auto_391229 ?auto_391239 ) ) ( not ( = ?auto_391229 ?auto_391240 ) ) ( not ( = ?auto_391229 ?auto_391241 ) ) ( not ( = ?auto_391229 ?auto_391242 ) ) ( not ( = ?auto_391229 ?auto_391243 ) ) ( not ( = ?auto_391229 ?auto_391244 ) ) ( not ( = ?auto_391230 ?auto_391231 ) ) ( not ( = ?auto_391230 ?auto_391232 ) ) ( not ( = ?auto_391230 ?auto_391233 ) ) ( not ( = ?auto_391230 ?auto_391234 ) ) ( not ( = ?auto_391230 ?auto_391235 ) ) ( not ( = ?auto_391230 ?auto_391236 ) ) ( not ( = ?auto_391230 ?auto_391237 ) ) ( not ( = ?auto_391230 ?auto_391238 ) ) ( not ( = ?auto_391230 ?auto_391239 ) ) ( not ( = ?auto_391230 ?auto_391240 ) ) ( not ( = ?auto_391230 ?auto_391241 ) ) ( not ( = ?auto_391230 ?auto_391242 ) ) ( not ( = ?auto_391230 ?auto_391243 ) ) ( not ( = ?auto_391230 ?auto_391244 ) ) ( not ( = ?auto_391231 ?auto_391232 ) ) ( not ( = ?auto_391231 ?auto_391233 ) ) ( not ( = ?auto_391231 ?auto_391234 ) ) ( not ( = ?auto_391231 ?auto_391235 ) ) ( not ( = ?auto_391231 ?auto_391236 ) ) ( not ( = ?auto_391231 ?auto_391237 ) ) ( not ( = ?auto_391231 ?auto_391238 ) ) ( not ( = ?auto_391231 ?auto_391239 ) ) ( not ( = ?auto_391231 ?auto_391240 ) ) ( not ( = ?auto_391231 ?auto_391241 ) ) ( not ( = ?auto_391231 ?auto_391242 ) ) ( not ( = ?auto_391231 ?auto_391243 ) ) ( not ( = ?auto_391231 ?auto_391244 ) ) ( not ( = ?auto_391232 ?auto_391233 ) ) ( not ( = ?auto_391232 ?auto_391234 ) ) ( not ( = ?auto_391232 ?auto_391235 ) ) ( not ( = ?auto_391232 ?auto_391236 ) ) ( not ( = ?auto_391232 ?auto_391237 ) ) ( not ( = ?auto_391232 ?auto_391238 ) ) ( not ( = ?auto_391232 ?auto_391239 ) ) ( not ( = ?auto_391232 ?auto_391240 ) ) ( not ( = ?auto_391232 ?auto_391241 ) ) ( not ( = ?auto_391232 ?auto_391242 ) ) ( not ( = ?auto_391232 ?auto_391243 ) ) ( not ( = ?auto_391232 ?auto_391244 ) ) ( not ( = ?auto_391233 ?auto_391234 ) ) ( not ( = ?auto_391233 ?auto_391235 ) ) ( not ( = ?auto_391233 ?auto_391236 ) ) ( not ( = ?auto_391233 ?auto_391237 ) ) ( not ( = ?auto_391233 ?auto_391238 ) ) ( not ( = ?auto_391233 ?auto_391239 ) ) ( not ( = ?auto_391233 ?auto_391240 ) ) ( not ( = ?auto_391233 ?auto_391241 ) ) ( not ( = ?auto_391233 ?auto_391242 ) ) ( not ( = ?auto_391233 ?auto_391243 ) ) ( not ( = ?auto_391233 ?auto_391244 ) ) ( not ( = ?auto_391234 ?auto_391235 ) ) ( not ( = ?auto_391234 ?auto_391236 ) ) ( not ( = ?auto_391234 ?auto_391237 ) ) ( not ( = ?auto_391234 ?auto_391238 ) ) ( not ( = ?auto_391234 ?auto_391239 ) ) ( not ( = ?auto_391234 ?auto_391240 ) ) ( not ( = ?auto_391234 ?auto_391241 ) ) ( not ( = ?auto_391234 ?auto_391242 ) ) ( not ( = ?auto_391234 ?auto_391243 ) ) ( not ( = ?auto_391234 ?auto_391244 ) ) ( not ( = ?auto_391235 ?auto_391236 ) ) ( not ( = ?auto_391235 ?auto_391237 ) ) ( not ( = ?auto_391235 ?auto_391238 ) ) ( not ( = ?auto_391235 ?auto_391239 ) ) ( not ( = ?auto_391235 ?auto_391240 ) ) ( not ( = ?auto_391235 ?auto_391241 ) ) ( not ( = ?auto_391235 ?auto_391242 ) ) ( not ( = ?auto_391235 ?auto_391243 ) ) ( not ( = ?auto_391235 ?auto_391244 ) ) ( not ( = ?auto_391236 ?auto_391237 ) ) ( not ( = ?auto_391236 ?auto_391238 ) ) ( not ( = ?auto_391236 ?auto_391239 ) ) ( not ( = ?auto_391236 ?auto_391240 ) ) ( not ( = ?auto_391236 ?auto_391241 ) ) ( not ( = ?auto_391236 ?auto_391242 ) ) ( not ( = ?auto_391236 ?auto_391243 ) ) ( not ( = ?auto_391236 ?auto_391244 ) ) ( not ( = ?auto_391237 ?auto_391238 ) ) ( not ( = ?auto_391237 ?auto_391239 ) ) ( not ( = ?auto_391237 ?auto_391240 ) ) ( not ( = ?auto_391237 ?auto_391241 ) ) ( not ( = ?auto_391237 ?auto_391242 ) ) ( not ( = ?auto_391237 ?auto_391243 ) ) ( not ( = ?auto_391237 ?auto_391244 ) ) ( not ( = ?auto_391238 ?auto_391239 ) ) ( not ( = ?auto_391238 ?auto_391240 ) ) ( not ( = ?auto_391238 ?auto_391241 ) ) ( not ( = ?auto_391238 ?auto_391242 ) ) ( not ( = ?auto_391238 ?auto_391243 ) ) ( not ( = ?auto_391238 ?auto_391244 ) ) ( not ( = ?auto_391239 ?auto_391240 ) ) ( not ( = ?auto_391239 ?auto_391241 ) ) ( not ( = ?auto_391239 ?auto_391242 ) ) ( not ( = ?auto_391239 ?auto_391243 ) ) ( not ( = ?auto_391239 ?auto_391244 ) ) ( not ( = ?auto_391240 ?auto_391241 ) ) ( not ( = ?auto_391240 ?auto_391242 ) ) ( not ( = ?auto_391240 ?auto_391243 ) ) ( not ( = ?auto_391240 ?auto_391244 ) ) ( not ( = ?auto_391241 ?auto_391242 ) ) ( not ( = ?auto_391241 ?auto_391243 ) ) ( not ( = ?auto_391241 ?auto_391244 ) ) ( not ( = ?auto_391242 ?auto_391243 ) ) ( not ( = ?auto_391242 ?auto_391244 ) ) ( not ( = ?auto_391243 ?auto_391244 ) ) ( ON ?auto_391242 ?auto_391243 ) ( ON ?auto_391241 ?auto_391242 ) ( ON ?auto_391240 ?auto_391241 ) ( CLEAR ?auto_391238 ) ( ON ?auto_391239 ?auto_391240 ) ( CLEAR ?auto_391239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_391229 ?auto_391230 ?auto_391231 ?auto_391232 ?auto_391233 ?auto_391234 ?auto_391235 ?auto_391236 ?auto_391237 ?auto_391238 ?auto_391239 )
      ( MAKE-15PILE ?auto_391229 ?auto_391230 ?auto_391231 ?auto_391232 ?auto_391233 ?auto_391234 ?auto_391235 ?auto_391236 ?auto_391237 ?auto_391238 ?auto_391239 ?auto_391240 ?auto_391241 ?auto_391242 ?auto_391243 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391260 - BLOCK
      ?auto_391261 - BLOCK
      ?auto_391262 - BLOCK
      ?auto_391263 - BLOCK
      ?auto_391264 - BLOCK
      ?auto_391265 - BLOCK
      ?auto_391266 - BLOCK
      ?auto_391267 - BLOCK
      ?auto_391268 - BLOCK
      ?auto_391269 - BLOCK
      ?auto_391270 - BLOCK
      ?auto_391271 - BLOCK
      ?auto_391272 - BLOCK
      ?auto_391273 - BLOCK
      ?auto_391274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391274 ) ( ON-TABLE ?auto_391260 ) ( ON ?auto_391261 ?auto_391260 ) ( ON ?auto_391262 ?auto_391261 ) ( ON ?auto_391263 ?auto_391262 ) ( ON ?auto_391264 ?auto_391263 ) ( ON ?auto_391265 ?auto_391264 ) ( ON ?auto_391266 ?auto_391265 ) ( ON ?auto_391267 ?auto_391266 ) ( ON ?auto_391268 ?auto_391267 ) ( ON ?auto_391269 ?auto_391268 ) ( not ( = ?auto_391260 ?auto_391261 ) ) ( not ( = ?auto_391260 ?auto_391262 ) ) ( not ( = ?auto_391260 ?auto_391263 ) ) ( not ( = ?auto_391260 ?auto_391264 ) ) ( not ( = ?auto_391260 ?auto_391265 ) ) ( not ( = ?auto_391260 ?auto_391266 ) ) ( not ( = ?auto_391260 ?auto_391267 ) ) ( not ( = ?auto_391260 ?auto_391268 ) ) ( not ( = ?auto_391260 ?auto_391269 ) ) ( not ( = ?auto_391260 ?auto_391270 ) ) ( not ( = ?auto_391260 ?auto_391271 ) ) ( not ( = ?auto_391260 ?auto_391272 ) ) ( not ( = ?auto_391260 ?auto_391273 ) ) ( not ( = ?auto_391260 ?auto_391274 ) ) ( not ( = ?auto_391261 ?auto_391262 ) ) ( not ( = ?auto_391261 ?auto_391263 ) ) ( not ( = ?auto_391261 ?auto_391264 ) ) ( not ( = ?auto_391261 ?auto_391265 ) ) ( not ( = ?auto_391261 ?auto_391266 ) ) ( not ( = ?auto_391261 ?auto_391267 ) ) ( not ( = ?auto_391261 ?auto_391268 ) ) ( not ( = ?auto_391261 ?auto_391269 ) ) ( not ( = ?auto_391261 ?auto_391270 ) ) ( not ( = ?auto_391261 ?auto_391271 ) ) ( not ( = ?auto_391261 ?auto_391272 ) ) ( not ( = ?auto_391261 ?auto_391273 ) ) ( not ( = ?auto_391261 ?auto_391274 ) ) ( not ( = ?auto_391262 ?auto_391263 ) ) ( not ( = ?auto_391262 ?auto_391264 ) ) ( not ( = ?auto_391262 ?auto_391265 ) ) ( not ( = ?auto_391262 ?auto_391266 ) ) ( not ( = ?auto_391262 ?auto_391267 ) ) ( not ( = ?auto_391262 ?auto_391268 ) ) ( not ( = ?auto_391262 ?auto_391269 ) ) ( not ( = ?auto_391262 ?auto_391270 ) ) ( not ( = ?auto_391262 ?auto_391271 ) ) ( not ( = ?auto_391262 ?auto_391272 ) ) ( not ( = ?auto_391262 ?auto_391273 ) ) ( not ( = ?auto_391262 ?auto_391274 ) ) ( not ( = ?auto_391263 ?auto_391264 ) ) ( not ( = ?auto_391263 ?auto_391265 ) ) ( not ( = ?auto_391263 ?auto_391266 ) ) ( not ( = ?auto_391263 ?auto_391267 ) ) ( not ( = ?auto_391263 ?auto_391268 ) ) ( not ( = ?auto_391263 ?auto_391269 ) ) ( not ( = ?auto_391263 ?auto_391270 ) ) ( not ( = ?auto_391263 ?auto_391271 ) ) ( not ( = ?auto_391263 ?auto_391272 ) ) ( not ( = ?auto_391263 ?auto_391273 ) ) ( not ( = ?auto_391263 ?auto_391274 ) ) ( not ( = ?auto_391264 ?auto_391265 ) ) ( not ( = ?auto_391264 ?auto_391266 ) ) ( not ( = ?auto_391264 ?auto_391267 ) ) ( not ( = ?auto_391264 ?auto_391268 ) ) ( not ( = ?auto_391264 ?auto_391269 ) ) ( not ( = ?auto_391264 ?auto_391270 ) ) ( not ( = ?auto_391264 ?auto_391271 ) ) ( not ( = ?auto_391264 ?auto_391272 ) ) ( not ( = ?auto_391264 ?auto_391273 ) ) ( not ( = ?auto_391264 ?auto_391274 ) ) ( not ( = ?auto_391265 ?auto_391266 ) ) ( not ( = ?auto_391265 ?auto_391267 ) ) ( not ( = ?auto_391265 ?auto_391268 ) ) ( not ( = ?auto_391265 ?auto_391269 ) ) ( not ( = ?auto_391265 ?auto_391270 ) ) ( not ( = ?auto_391265 ?auto_391271 ) ) ( not ( = ?auto_391265 ?auto_391272 ) ) ( not ( = ?auto_391265 ?auto_391273 ) ) ( not ( = ?auto_391265 ?auto_391274 ) ) ( not ( = ?auto_391266 ?auto_391267 ) ) ( not ( = ?auto_391266 ?auto_391268 ) ) ( not ( = ?auto_391266 ?auto_391269 ) ) ( not ( = ?auto_391266 ?auto_391270 ) ) ( not ( = ?auto_391266 ?auto_391271 ) ) ( not ( = ?auto_391266 ?auto_391272 ) ) ( not ( = ?auto_391266 ?auto_391273 ) ) ( not ( = ?auto_391266 ?auto_391274 ) ) ( not ( = ?auto_391267 ?auto_391268 ) ) ( not ( = ?auto_391267 ?auto_391269 ) ) ( not ( = ?auto_391267 ?auto_391270 ) ) ( not ( = ?auto_391267 ?auto_391271 ) ) ( not ( = ?auto_391267 ?auto_391272 ) ) ( not ( = ?auto_391267 ?auto_391273 ) ) ( not ( = ?auto_391267 ?auto_391274 ) ) ( not ( = ?auto_391268 ?auto_391269 ) ) ( not ( = ?auto_391268 ?auto_391270 ) ) ( not ( = ?auto_391268 ?auto_391271 ) ) ( not ( = ?auto_391268 ?auto_391272 ) ) ( not ( = ?auto_391268 ?auto_391273 ) ) ( not ( = ?auto_391268 ?auto_391274 ) ) ( not ( = ?auto_391269 ?auto_391270 ) ) ( not ( = ?auto_391269 ?auto_391271 ) ) ( not ( = ?auto_391269 ?auto_391272 ) ) ( not ( = ?auto_391269 ?auto_391273 ) ) ( not ( = ?auto_391269 ?auto_391274 ) ) ( not ( = ?auto_391270 ?auto_391271 ) ) ( not ( = ?auto_391270 ?auto_391272 ) ) ( not ( = ?auto_391270 ?auto_391273 ) ) ( not ( = ?auto_391270 ?auto_391274 ) ) ( not ( = ?auto_391271 ?auto_391272 ) ) ( not ( = ?auto_391271 ?auto_391273 ) ) ( not ( = ?auto_391271 ?auto_391274 ) ) ( not ( = ?auto_391272 ?auto_391273 ) ) ( not ( = ?auto_391272 ?auto_391274 ) ) ( not ( = ?auto_391273 ?auto_391274 ) ) ( ON ?auto_391273 ?auto_391274 ) ( ON ?auto_391272 ?auto_391273 ) ( ON ?auto_391271 ?auto_391272 ) ( CLEAR ?auto_391269 ) ( ON ?auto_391270 ?auto_391271 ) ( CLEAR ?auto_391270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_391260 ?auto_391261 ?auto_391262 ?auto_391263 ?auto_391264 ?auto_391265 ?auto_391266 ?auto_391267 ?auto_391268 ?auto_391269 ?auto_391270 )
      ( MAKE-15PILE ?auto_391260 ?auto_391261 ?auto_391262 ?auto_391263 ?auto_391264 ?auto_391265 ?auto_391266 ?auto_391267 ?auto_391268 ?auto_391269 ?auto_391270 ?auto_391271 ?auto_391272 ?auto_391273 ?auto_391274 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391290 - BLOCK
      ?auto_391291 - BLOCK
      ?auto_391292 - BLOCK
      ?auto_391293 - BLOCK
      ?auto_391294 - BLOCK
      ?auto_391295 - BLOCK
      ?auto_391296 - BLOCK
      ?auto_391297 - BLOCK
      ?auto_391298 - BLOCK
      ?auto_391299 - BLOCK
      ?auto_391300 - BLOCK
      ?auto_391301 - BLOCK
      ?auto_391302 - BLOCK
      ?auto_391303 - BLOCK
      ?auto_391304 - BLOCK
    )
    :vars
    (
      ?auto_391305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391304 ?auto_391305 ) ( ON-TABLE ?auto_391290 ) ( ON ?auto_391291 ?auto_391290 ) ( ON ?auto_391292 ?auto_391291 ) ( ON ?auto_391293 ?auto_391292 ) ( ON ?auto_391294 ?auto_391293 ) ( ON ?auto_391295 ?auto_391294 ) ( ON ?auto_391296 ?auto_391295 ) ( ON ?auto_391297 ?auto_391296 ) ( ON ?auto_391298 ?auto_391297 ) ( not ( = ?auto_391290 ?auto_391291 ) ) ( not ( = ?auto_391290 ?auto_391292 ) ) ( not ( = ?auto_391290 ?auto_391293 ) ) ( not ( = ?auto_391290 ?auto_391294 ) ) ( not ( = ?auto_391290 ?auto_391295 ) ) ( not ( = ?auto_391290 ?auto_391296 ) ) ( not ( = ?auto_391290 ?auto_391297 ) ) ( not ( = ?auto_391290 ?auto_391298 ) ) ( not ( = ?auto_391290 ?auto_391299 ) ) ( not ( = ?auto_391290 ?auto_391300 ) ) ( not ( = ?auto_391290 ?auto_391301 ) ) ( not ( = ?auto_391290 ?auto_391302 ) ) ( not ( = ?auto_391290 ?auto_391303 ) ) ( not ( = ?auto_391290 ?auto_391304 ) ) ( not ( = ?auto_391290 ?auto_391305 ) ) ( not ( = ?auto_391291 ?auto_391292 ) ) ( not ( = ?auto_391291 ?auto_391293 ) ) ( not ( = ?auto_391291 ?auto_391294 ) ) ( not ( = ?auto_391291 ?auto_391295 ) ) ( not ( = ?auto_391291 ?auto_391296 ) ) ( not ( = ?auto_391291 ?auto_391297 ) ) ( not ( = ?auto_391291 ?auto_391298 ) ) ( not ( = ?auto_391291 ?auto_391299 ) ) ( not ( = ?auto_391291 ?auto_391300 ) ) ( not ( = ?auto_391291 ?auto_391301 ) ) ( not ( = ?auto_391291 ?auto_391302 ) ) ( not ( = ?auto_391291 ?auto_391303 ) ) ( not ( = ?auto_391291 ?auto_391304 ) ) ( not ( = ?auto_391291 ?auto_391305 ) ) ( not ( = ?auto_391292 ?auto_391293 ) ) ( not ( = ?auto_391292 ?auto_391294 ) ) ( not ( = ?auto_391292 ?auto_391295 ) ) ( not ( = ?auto_391292 ?auto_391296 ) ) ( not ( = ?auto_391292 ?auto_391297 ) ) ( not ( = ?auto_391292 ?auto_391298 ) ) ( not ( = ?auto_391292 ?auto_391299 ) ) ( not ( = ?auto_391292 ?auto_391300 ) ) ( not ( = ?auto_391292 ?auto_391301 ) ) ( not ( = ?auto_391292 ?auto_391302 ) ) ( not ( = ?auto_391292 ?auto_391303 ) ) ( not ( = ?auto_391292 ?auto_391304 ) ) ( not ( = ?auto_391292 ?auto_391305 ) ) ( not ( = ?auto_391293 ?auto_391294 ) ) ( not ( = ?auto_391293 ?auto_391295 ) ) ( not ( = ?auto_391293 ?auto_391296 ) ) ( not ( = ?auto_391293 ?auto_391297 ) ) ( not ( = ?auto_391293 ?auto_391298 ) ) ( not ( = ?auto_391293 ?auto_391299 ) ) ( not ( = ?auto_391293 ?auto_391300 ) ) ( not ( = ?auto_391293 ?auto_391301 ) ) ( not ( = ?auto_391293 ?auto_391302 ) ) ( not ( = ?auto_391293 ?auto_391303 ) ) ( not ( = ?auto_391293 ?auto_391304 ) ) ( not ( = ?auto_391293 ?auto_391305 ) ) ( not ( = ?auto_391294 ?auto_391295 ) ) ( not ( = ?auto_391294 ?auto_391296 ) ) ( not ( = ?auto_391294 ?auto_391297 ) ) ( not ( = ?auto_391294 ?auto_391298 ) ) ( not ( = ?auto_391294 ?auto_391299 ) ) ( not ( = ?auto_391294 ?auto_391300 ) ) ( not ( = ?auto_391294 ?auto_391301 ) ) ( not ( = ?auto_391294 ?auto_391302 ) ) ( not ( = ?auto_391294 ?auto_391303 ) ) ( not ( = ?auto_391294 ?auto_391304 ) ) ( not ( = ?auto_391294 ?auto_391305 ) ) ( not ( = ?auto_391295 ?auto_391296 ) ) ( not ( = ?auto_391295 ?auto_391297 ) ) ( not ( = ?auto_391295 ?auto_391298 ) ) ( not ( = ?auto_391295 ?auto_391299 ) ) ( not ( = ?auto_391295 ?auto_391300 ) ) ( not ( = ?auto_391295 ?auto_391301 ) ) ( not ( = ?auto_391295 ?auto_391302 ) ) ( not ( = ?auto_391295 ?auto_391303 ) ) ( not ( = ?auto_391295 ?auto_391304 ) ) ( not ( = ?auto_391295 ?auto_391305 ) ) ( not ( = ?auto_391296 ?auto_391297 ) ) ( not ( = ?auto_391296 ?auto_391298 ) ) ( not ( = ?auto_391296 ?auto_391299 ) ) ( not ( = ?auto_391296 ?auto_391300 ) ) ( not ( = ?auto_391296 ?auto_391301 ) ) ( not ( = ?auto_391296 ?auto_391302 ) ) ( not ( = ?auto_391296 ?auto_391303 ) ) ( not ( = ?auto_391296 ?auto_391304 ) ) ( not ( = ?auto_391296 ?auto_391305 ) ) ( not ( = ?auto_391297 ?auto_391298 ) ) ( not ( = ?auto_391297 ?auto_391299 ) ) ( not ( = ?auto_391297 ?auto_391300 ) ) ( not ( = ?auto_391297 ?auto_391301 ) ) ( not ( = ?auto_391297 ?auto_391302 ) ) ( not ( = ?auto_391297 ?auto_391303 ) ) ( not ( = ?auto_391297 ?auto_391304 ) ) ( not ( = ?auto_391297 ?auto_391305 ) ) ( not ( = ?auto_391298 ?auto_391299 ) ) ( not ( = ?auto_391298 ?auto_391300 ) ) ( not ( = ?auto_391298 ?auto_391301 ) ) ( not ( = ?auto_391298 ?auto_391302 ) ) ( not ( = ?auto_391298 ?auto_391303 ) ) ( not ( = ?auto_391298 ?auto_391304 ) ) ( not ( = ?auto_391298 ?auto_391305 ) ) ( not ( = ?auto_391299 ?auto_391300 ) ) ( not ( = ?auto_391299 ?auto_391301 ) ) ( not ( = ?auto_391299 ?auto_391302 ) ) ( not ( = ?auto_391299 ?auto_391303 ) ) ( not ( = ?auto_391299 ?auto_391304 ) ) ( not ( = ?auto_391299 ?auto_391305 ) ) ( not ( = ?auto_391300 ?auto_391301 ) ) ( not ( = ?auto_391300 ?auto_391302 ) ) ( not ( = ?auto_391300 ?auto_391303 ) ) ( not ( = ?auto_391300 ?auto_391304 ) ) ( not ( = ?auto_391300 ?auto_391305 ) ) ( not ( = ?auto_391301 ?auto_391302 ) ) ( not ( = ?auto_391301 ?auto_391303 ) ) ( not ( = ?auto_391301 ?auto_391304 ) ) ( not ( = ?auto_391301 ?auto_391305 ) ) ( not ( = ?auto_391302 ?auto_391303 ) ) ( not ( = ?auto_391302 ?auto_391304 ) ) ( not ( = ?auto_391302 ?auto_391305 ) ) ( not ( = ?auto_391303 ?auto_391304 ) ) ( not ( = ?auto_391303 ?auto_391305 ) ) ( not ( = ?auto_391304 ?auto_391305 ) ) ( ON ?auto_391303 ?auto_391304 ) ( ON ?auto_391302 ?auto_391303 ) ( ON ?auto_391301 ?auto_391302 ) ( ON ?auto_391300 ?auto_391301 ) ( CLEAR ?auto_391298 ) ( ON ?auto_391299 ?auto_391300 ) ( CLEAR ?auto_391299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_391290 ?auto_391291 ?auto_391292 ?auto_391293 ?auto_391294 ?auto_391295 ?auto_391296 ?auto_391297 ?auto_391298 ?auto_391299 )
      ( MAKE-15PILE ?auto_391290 ?auto_391291 ?auto_391292 ?auto_391293 ?auto_391294 ?auto_391295 ?auto_391296 ?auto_391297 ?auto_391298 ?auto_391299 ?auto_391300 ?auto_391301 ?auto_391302 ?auto_391303 ?auto_391304 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391321 - BLOCK
      ?auto_391322 - BLOCK
      ?auto_391323 - BLOCK
      ?auto_391324 - BLOCK
      ?auto_391325 - BLOCK
      ?auto_391326 - BLOCK
      ?auto_391327 - BLOCK
      ?auto_391328 - BLOCK
      ?auto_391329 - BLOCK
      ?auto_391330 - BLOCK
      ?auto_391331 - BLOCK
      ?auto_391332 - BLOCK
      ?auto_391333 - BLOCK
      ?auto_391334 - BLOCK
      ?auto_391335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391335 ) ( ON-TABLE ?auto_391321 ) ( ON ?auto_391322 ?auto_391321 ) ( ON ?auto_391323 ?auto_391322 ) ( ON ?auto_391324 ?auto_391323 ) ( ON ?auto_391325 ?auto_391324 ) ( ON ?auto_391326 ?auto_391325 ) ( ON ?auto_391327 ?auto_391326 ) ( ON ?auto_391328 ?auto_391327 ) ( ON ?auto_391329 ?auto_391328 ) ( not ( = ?auto_391321 ?auto_391322 ) ) ( not ( = ?auto_391321 ?auto_391323 ) ) ( not ( = ?auto_391321 ?auto_391324 ) ) ( not ( = ?auto_391321 ?auto_391325 ) ) ( not ( = ?auto_391321 ?auto_391326 ) ) ( not ( = ?auto_391321 ?auto_391327 ) ) ( not ( = ?auto_391321 ?auto_391328 ) ) ( not ( = ?auto_391321 ?auto_391329 ) ) ( not ( = ?auto_391321 ?auto_391330 ) ) ( not ( = ?auto_391321 ?auto_391331 ) ) ( not ( = ?auto_391321 ?auto_391332 ) ) ( not ( = ?auto_391321 ?auto_391333 ) ) ( not ( = ?auto_391321 ?auto_391334 ) ) ( not ( = ?auto_391321 ?auto_391335 ) ) ( not ( = ?auto_391322 ?auto_391323 ) ) ( not ( = ?auto_391322 ?auto_391324 ) ) ( not ( = ?auto_391322 ?auto_391325 ) ) ( not ( = ?auto_391322 ?auto_391326 ) ) ( not ( = ?auto_391322 ?auto_391327 ) ) ( not ( = ?auto_391322 ?auto_391328 ) ) ( not ( = ?auto_391322 ?auto_391329 ) ) ( not ( = ?auto_391322 ?auto_391330 ) ) ( not ( = ?auto_391322 ?auto_391331 ) ) ( not ( = ?auto_391322 ?auto_391332 ) ) ( not ( = ?auto_391322 ?auto_391333 ) ) ( not ( = ?auto_391322 ?auto_391334 ) ) ( not ( = ?auto_391322 ?auto_391335 ) ) ( not ( = ?auto_391323 ?auto_391324 ) ) ( not ( = ?auto_391323 ?auto_391325 ) ) ( not ( = ?auto_391323 ?auto_391326 ) ) ( not ( = ?auto_391323 ?auto_391327 ) ) ( not ( = ?auto_391323 ?auto_391328 ) ) ( not ( = ?auto_391323 ?auto_391329 ) ) ( not ( = ?auto_391323 ?auto_391330 ) ) ( not ( = ?auto_391323 ?auto_391331 ) ) ( not ( = ?auto_391323 ?auto_391332 ) ) ( not ( = ?auto_391323 ?auto_391333 ) ) ( not ( = ?auto_391323 ?auto_391334 ) ) ( not ( = ?auto_391323 ?auto_391335 ) ) ( not ( = ?auto_391324 ?auto_391325 ) ) ( not ( = ?auto_391324 ?auto_391326 ) ) ( not ( = ?auto_391324 ?auto_391327 ) ) ( not ( = ?auto_391324 ?auto_391328 ) ) ( not ( = ?auto_391324 ?auto_391329 ) ) ( not ( = ?auto_391324 ?auto_391330 ) ) ( not ( = ?auto_391324 ?auto_391331 ) ) ( not ( = ?auto_391324 ?auto_391332 ) ) ( not ( = ?auto_391324 ?auto_391333 ) ) ( not ( = ?auto_391324 ?auto_391334 ) ) ( not ( = ?auto_391324 ?auto_391335 ) ) ( not ( = ?auto_391325 ?auto_391326 ) ) ( not ( = ?auto_391325 ?auto_391327 ) ) ( not ( = ?auto_391325 ?auto_391328 ) ) ( not ( = ?auto_391325 ?auto_391329 ) ) ( not ( = ?auto_391325 ?auto_391330 ) ) ( not ( = ?auto_391325 ?auto_391331 ) ) ( not ( = ?auto_391325 ?auto_391332 ) ) ( not ( = ?auto_391325 ?auto_391333 ) ) ( not ( = ?auto_391325 ?auto_391334 ) ) ( not ( = ?auto_391325 ?auto_391335 ) ) ( not ( = ?auto_391326 ?auto_391327 ) ) ( not ( = ?auto_391326 ?auto_391328 ) ) ( not ( = ?auto_391326 ?auto_391329 ) ) ( not ( = ?auto_391326 ?auto_391330 ) ) ( not ( = ?auto_391326 ?auto_391331 ) ) ( not ( = ?auto_391326 ?auto_391332 ) ) ( not ( = ?auto_391326 ?auto_391333 ) ) ( not ( = ?auto_391326 ?auto_391334 ) ) ( not ( = ?auto_391326 ?auto_391335 ) ) ( not ( = ?auto_391327 ?auto_391328 ) ) ( not ( = ?auto_391327 ?auto_391329 ) ) ( not ( = ?auto_391327 ?auto_391330 ) ) ( not ( = ?auto_391327 ?auto_391331 ) ) ( not ( = ?auto_391327 ?auto_391332 ) ) ( not ( = ?auto_391327 ?auto_391333 ) ) ( not ( = ?auto_391327 ?auto_391334 ) ) ( not ( = ?auto_391327 ?auto_391335 ) ) ( not ( = ?auto_391328 ?auto_391329 ) ) ( not ( = ?auto_391328 ?auto_391330 ) ) ( not ( = ?auto_391328 ?auto_391331 ) ) ( not ( = ?auto_391328 ?auto_391332 ) ) ( not ( = ?auto_391328 ?auto_391333 ) ) ( not ( = ?auto_391328 ?auto_391334 ) ) ( not ( = ?auto_391328 ?auto_391335 ) ) ( not ( = ?auto_391329 ?auto_391330 ) ) ( not ( = ?auto_391329 ?auto_391331 ) ) ( not ( = ?auto_391329 ?auto_391332 ) ) ( not ( = ?auto_391329 ?auto_391333 ) ) ( not ( = ?auto_391329 ?auto_391334 ) ) ( not ( = ?auto_391329 ?auto_391335 ) ) ( not ( = ?auto_391330 ?auto_391331 ) ) ( not ( = ?auto_391330 ?auto_391332 ) ) ( not ( = ?auto_391330 ?auto_391333 ) ) ( not ( = ?auto_391330 ?auto_391334 ) ) ( not ( = ?auto_391330 ?auto_391335 ) ) ( not ( = ?auto_391331 ?auto_391332 ) ) ( not ( = ?auto_391331 ?auto_391333 ) ) ( not ( = ?auto_391331 ?auto_391334 ) ) ( not ( = ?auto_391331 ?auto_391335 ) ) ( not ( = ?auto_391332 ?auto_391333 ) ) ( not ( = ?auto_391332 ?auto_391334 ) ) ( not ( = ?auto_391332 ?auto_391335 ) ) ( not ( = ?auto_391333 ?auto_391334 ) ) ( not ( = ?auto_391333 ?auto_391335 ) ) ( not ( = ?auto_391334 ?auto_391335 ) ) ( ON ?auto_391334 ?auto_391335 ) ( ON ?auto_391333 ?auto_391334 ) ( ON ?auto_391332 ?auto_391333 ) ( ON ?auto_391331 ?auto_391332 ) ( CLEAR ?auto_391329 ) ( ON ?auto_391330 ?auto_391331 ) ( CLEAR ?auto_391330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_391321 ?auto_391322 ?auto_391323 ?auto_391324 ?auto_391325 ?auto_391326 ?auto_391327 ?auto_391328 ?auto_391329 ?auto_391330 )
      ( MAKE-15PILE ?auto_391321 ?auto_391322 ?auto_391323 ?auto_391324 ?auto_391325 ?auto_391326 ?auto_391327 ?auto_391328 ?auto_391329 ?auto_391330 ?auto_391331 ?auto_391332 ?auto_391333 ?auto_391334 ?auto_391335 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391351 - BLOCK
      ?auto_391352 - BLOCK
      ?auto_391353 - BLOCK
      ?auto_391354 - BLOCK
      ?auto_391355 - BLOCK
      ?auto_391356 - BLOCK
      ?auto_391357 - BLOCK
      ?auto_391358 - BLOCK
      ?auto_391359 - BLOCK
      ?auto_391360 - BLOCK
      ?auto_391361 - BLOCK
      ?auto_391362 - BLOCK
      ?auto_391363 - BLOCK
      ?auto_391364 - BLOCK
      ?auto_391365 - BLOCK
    )
    :vars
    (
      ?auto_391366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391365 ?auto_391366 ) ( ON-TABLE ?auto_391351 ) ( ON ?auto_391352 ?auto_391351 ) ( ON ?auto_391353 ?auto_391352 ) ( ON ?auto_391354 ?auto_391353 ) ( ON ?auto_391355 ?auto_391354 ) ( ON ?auto_391356 ?auto_391355 ) ( ON ?auto_391357 ?auto_391356 ) ( ON ?auto_391358 ?auto_391357 ) ( not ( = ?auto_391351 ?auto_391352 ) ) ( not ( = ?auto_391351 ?auto_391353 ) ) ( not ( = ?auto_391351 ?auto_391354 ) ) ( not ( = ?auto_391351 ?auto_391355 ) ) ( not ( = ?auto_391351 ?auto_391356 ) ) ( not ( = ?auto_391351 ?auto_391357 ) ) ( not ( = ?auto_391351 ?auto_391358 ) ) ( not ( = ?auto_391351 ?auto_391359 ) ) ( not ( = ?auto_391351 ?auto_391360 ) ) ( not ( = ?auto_391351 ?auto_391361 ) ) ( not ( = ?auto_391351 ?auto_391362 ) ) ( not ( = ?auto_391351 ?auto_391363 ) ) ( not ( = ?auto_391351 ?auto_391364 ) ) ( not ( = ?auto_391351 ?auto_391365 ) ) ( not ( = ?auto_391351 ?auto_391366 ) ) ( not ( = ?auto_391352 ?auto_391353 ) ) ( not ( = ?auto_391352 ?auto_391354 ) ) ( not ( = ?auto_391352 ?auto_391355 ) ) ( not ( = ?auto_391352 ?auto_391356 ) ) ( not ( = ?auto_391352 ?auto_391357 ) ) ( not ( = ?auto_391352 ?auto_391358 ) ) ( not ( = ?auto_391352 ?auto_391359 ) ) ( not ( = ?auto_391352 ?auto_391360 ) ) ( not ( = ?auto_391352 ?auto_391361 ) ) ( not ( = ?auto_391352 ?auto_391362 ) ) ( not ( = ?auto_391352 ?auto_391363 ) ) ( not ( = ?auto_391352 ?auto_391364 ) ) ( not ( = ?auto_391352 ?auto_391365 ) ) ( not ( = ?auto_391352 ?auto_391366 ) ) ( not ( = ?auto_391353 ?auto_391354 ) ) ( not ( = ?auto_391353 ?auto_391355 ) ) ( not ( = ?auto_391353 ?auto_391356 ) ) ( not ( = ?auto_391353 ?auto_391357 ) ) ( not ( = ?auto_391353 ?auto_391358 ) ) ( not ( = ?auto_391353 ?auto_391359 ) ) ( not ( = ?auto_391353 ?auto_391360 ) ) ( not ( = ?auto_391353 ?auto_391361 ) ) ( not ( = ?auto_391353 ?auto_391362 ) ) ( not ( = ?auto_391353 ?auto_391363 ) ) ( not ( = ?auto_391353 ?auto_391364 ) ) ( not ( = ?auto_391353 ?auto_391365 ) ) ( not ( = ?auto_391353 ?auto_391366 ) ) ( not ( = ?auto_391354 ?auto_391355 ) ) ( not ( = ?auto_391354 ?auto_391356 ) ) ( not ( = ?auto_391354 ?auto_391357 ) ) ( not ( = ?auto_391354 ?auto_391358 ) ) ( not ( = ?auto_391354 ?auto_391359 ) ) ( not ( = ?auto_391354 ?auto_391360 ) ) ( not ( = ?auto_391354 ?auto_391361 ) ) ( not ( = ?auto_391354 ?auto_391362 ) ) ( not ( = ?auto_391354 ?auto_391363 ) ) ( not ( = ?auto_391354 ?auto_391364 ) ) ( not ( = ?auto_391354 ?auto_391365 ) ) ( not ( = ?auto_391354 ?auto_391366 ) ) ( not ( = ?auto_391355 ?auto_391356 ) ) ( not ( = ?auto_391355 ?auto_391357 ) ) ( not ( = ?auto_391355 ?auto_391358 ) ) ( not ( = ?auto_391355 ?auto_391359 ) ) ( not ( = ?auto_391355 ?auto_391360 ) ) ( not ( = ?auto_391355 ?auto_391361 ) ) ( not ( = ?auto_391355 ?auto_391362 ) ) ( not ( = ?auto_391355 ?auto_391363 ) ) ( not ( = ?auto_391355 ?auto_391364 ) ) ( not ( = ?auto_391355 ?auto_391365 ) ) ( not ( = ?auto_391355 ?auto_391366 ) ) ( not ( = ?auto_391356 ?auto_391357 ) ) ( not ( = ?auto_391356 ?auto_391358 ) ) ( not ( = ?auto_391356 ?auto_391359 ) ) ( not ( = ?auto_391356 ?auto_391360 ) ) ( not ( = ?auto_391356 ?auto_391361 ) ) ( not ( = ?auto_391356 ?auto_391362 ) ) ( not ( = ?auto_391356 ?auto_391363 ) ) ( not ( = ?auto_391356 ?auto_391364 ) ) ( not ( = ?auto_391356 ?auto_391365 ) ) ( not ( = ?auto_391356 ?auto_391366 ) ) ( not ( = ?auto_391357 ?auto_391358 ) ) ( not ( = ?auto_391357 ?auto_391359 ) ) ( not ( = ?auto_391357 ?auto_391360 ) ) ( not ( = ?auto_391357 ?auto_391361 ) ) ( not ( = ?auto_391357 ?auto_391362 ) ) ( not ( = ?auto_391357 ?auto_391363 ) ) ( not ( = ?auto_391357 ?auto_391364 ) ) ( not ( = ?auto_391357 ?auto_391365 ) ) ( not ( = ?auto_391357 ?auto_391366 ) ) ( not ( = ?auto_391358 ?auto_391359 ) ) ( not ( = ?auto_391358 ?auto_391360 ) ) ( not ( = ?auto_391358 ?auto_391361 ) ) ( not ( = ?auto_391358 ?auto_391362 ) ) ( not ( = ?auto_391358 ?auto_391363 ) ) ( not ( = ?auto_391358 ?auto_391364 ) ) ( not ( = ?auto_391358 ?auto_391365 ) ) ( not ( = ?auto_391358 ?auto_391366 ) ) ( not ( = ?auto_391359 ?auto_391360 ) ) ( not ( = ?auto_391359 ?auto_391361 ) ) ( not ( = ?auto_391359 ?auto_391362 ) ) ( not ( = ?auto_391359 ?auto_391363 ) ) ( not ( = ?auto_391359 ?auto_391364 ) ) ( not ( = ?auto_391359 ?auto_391365 ) ) ( not ( = ?auto_391359 ?auto_391366 ) ) ( not ( = ?auto_391360 ?auto_391361 ) ) ( not ( = ?auto_391360 ?auto_391362 ) ) ( not ( = ?auto_391360 ?auto_391363 ) ) ( not ( = ?auto_391360 ?auto_391364 ) ) ( not ( = ?auto_391360 ?auto_391365 ) ) ( not ( = ?auto_391360 ?auto_391366 ) ) ( not ( = ?auto_391361 ?auto_391362 ) ) ( not ( = ?auto_391361 ?auto_391363 ) ) ( not ( = ?auto_391361 ?auto_391364 ) ) ( not ( = ?auto_391361 ?auto_391365 ) ) ( not ( = ?auto_391361 ?auto_391366 ) ) ( not ( = ?auto_391362 ?auto_391363 ) ) ( not ( = ?auto_391362 ?auto_391364 ) ) ( not ( = ?auto_391362 ?auto_391365 ) ) ( not ( = ?auto_391362 ?auto_391366 ) ) ( not ( = ?auto_391363 ?auto_391364 ) ) ( not ( = ?auto_391363 ?auto_391365 ) ) ( not ( = ?auto_391363 ?auto_391366 ) ) ( not ( = ?auto_391364 ?auto_391365 ) ) ( not ( = ?auto_391364 ?auto_391366 ) ) ( not ( = ?auto_391365 ?auto_391366 ) ) ( ON ?auto_391364 ?auto_391365 ) ( ON ?auto_391363 ?auto_391364 ) ( ON ?auto_391362 ?auto_391363 ) ( ON ?auto_391361 ?auto_391362 ) ( ON ?auto_391360 ?auto_391361 ) ( CLEAR ?auto_391358 ) ( ON ?auto_391359 ?auto_391360 ) ( CLEAR ?auto_391359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_391351 ?auto_391352 ?auto_391353 ?auto_391354 ?auto_391355 ?auto_391356 ?auto_391357 ?auto_391358 ?auto_391359 )
      ( MAKE-15PILE ?auto_391351 ?auto_391352 ?auto_391353 ?auto_391354 ?auto_391355 ?auto_391356 ?auto_391357 ?auto_391358 ?auto_391359 ?auto_391360 ?auto_391361 ?auto_391362 ?auto_391363 ?auto_391364 ?auto_391365 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391382 - BLOCK
      ?auto_391383 - BLOCK
      ?auto_391384 - BLOCK
      ?auto_391385 - BLOCK
      ?auto_391386 - BLOCK
      ?auto_391387 - BLOCK
      ?auto_391388 - BLOCK
      ?auto_391389 - BLOCK
      ?auto_391390 - BLOCK
      ?auto_391391 - BLOCK
      ?auto_391392 - BLOCK
      ?auto_391393 - BLOCK
      ?auto_391394 - BLOCK
      ?auto_391395 - BLOCK
      ?auto_391396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391396 ) ( ON-TABLE ?auto_391382 ) ( ON ?auto_391383 ?auto_391382 ) ( ON ?auto_391384 ?auto_391383 ) ( ON ?auto_391385 ?auto_391384 ) ( ON ?auto_391386 ?auto_391385 ) ( ON ?auto_391387 ?auto_391386 ) ( ON ?auto_391388 ?auto_391387 ) ( ON ?auto_391389 ?auto_391388 ) ( not ( = ?auto_391382 ?auto_391383 ) ) ( not ( = ?auto_391382 ?auto_391384 ) ) ( not ( = ?auto_391382 ?auto_391385 ) ) ( not ( = ?auto_391382 ?auto_391386 ) ) ( not ( = ?auto_391382 ?auto_391387 ) ) ( not ( = ?auto_391382 ?auto_391388 ) ) ( not ( = ?auto_391382 ?auto_391389 ) ) ( not ( = ?auto_391382 ?auto_391390 ) ) ( not ( = ?auto_391382 ?auto_391391 ) ) ( not ( = ?auto_391382 ?auto_391392 ) ) ( not ( = ?auto_391382 ?auto_391393 ) ) ( not ( = ?auto_391382 ?auto_391394 ) ) ( not ( = ?auto_391382 ?auto_391395 ) ) ( not ( = ?auto_391382 ?auto_391396 ) ) ( not ( = ?auto_391383 ?auto_391384 ) ) ( not ( = ?auto_391383 ?auto_391385 ) ) ( not ( = ?auto_391383 ?auto_391386 ) ) ( not ( = ?auto_391383 ?auto_391387 ) ) ( not ( = ?auto_391383 ?auto_391388 ) ) ( not ( = ?auto_391383 ?auto_391389 ) ) ( not ( = ?auto_391383 ?auto_391390 ) ) ( not ( = ?auto_391383 ?auto_391391 ) ) ( not ( = ?auto_391383 ?auto_391392 ) ) ( not ( = ?auto_391383 ?auto_391393 ) ) ( not ( = ?auto_391383 ?auto_391394 ) ) ( not ( = ?auto_391383 ?auto_391395 ) ) ( not ( = ?auto_391383 ?auto_391396 ) ) ( not ( = ?auto_391384 ?auto_391385 ) ) ( not ( = ?auto_391384 ?auto_391386 ) ) ( not ( = ?auto_391384 ?auto_391387 ) ) ( not ( = ?auto_391384 ?auto_391388 ) ) ( not ( = ?auto_391384 ?auto_391389 ) ) ( not ( = ?auto_391384 ?auto_391390 ) ) ( not ( = ?auto_391384 ?auto_391391 ) ) ( not ( = ?auto_391384 ?auto_391392 ) ) ( not ( = ?auto_391384 ?auto_391393 ) ) ( not ( = ?auto_391384 ?auto_391394 ) ) ( not ( = ?auto_391384 ?auto_391395 ) ) ( not ( = ?auto_391384 ?auto_391396 ) ) ( not ( = ?auto_391385 ?auto_391386 ) ) ( not ( = ?auto_391385 ?auto_391387 ) ) ( not ( = ?auto_391385 ?auto_391388 ) ) ( not ( = ?auto_391385 ?auto_391389 ) ) ( not ( = ?auto_391385 ?auto_391390 ) ) ( not ( = ?auto_391385 ?auto_391391 ) ) ( not ( = ?auto_391385 ?auto_391392 ) ) ( not ( = ?auto_391385 ?auto_391393 ) ) ( not ( = ?auto_391385 ?auto_391394 ) ) ( not ( = ?auto_391385 ?auto_391395 ) ) ( not ( = ?auto_391385 ?auto_391396 ) ) ( not ( = ?auto_391386 ?auto_391387 ) ) ( not ( = ?auto_391386 ?auto_391388 ) ) ( not ( = ?auto_391386 ?auto_391389 ) ) ( not ( = ?auto_391386 ?auto_391390 ) ) ( not ( = ?auto_391386 ?auto_391391 ) ) ( not ( = ?auto_391386 ?auto_391392 ) ) ( not ( = ?auto_391386 ?auto_391393 ) ) ( not ( = ?auto_391386 ?auto_391394 ) ) ( not ( = ?auto_391386 ?auto_391395 ) ) ( not ( = ?auto_391386 ?auto_391396 ) ) ( not ( = ?auto_391387 ?auto_391388 ) ) ( not ( = ?auto_391387 ?auto_391389 ) ) ( not ( = ?auto_391387 ?auto_391390 ) ) ( not ( = ?auto_391387 ?auto_391391 ) ) ( not ( = ?auto_391387 ?auto_391392 ) ) ( not ( = ?auto_391387 ?auto_391393 ) ) ( not ( = ?auto_391387 ?auto_391394 ) ) ( not ( = ?auto_391387 ?auto_391395 ) ) ( not ( = ?auto_391387 ?auto_391396 ) ) ( not ( = ?auto_391388 ?auto_391389 ) ) ( not ( = ?auto_391388 ?auto_391390 ) ) ( not ( = ?auto_391388 ?auto_391391 ) ) ( not ( = ?auto_391388 ?auto_391392 ) ) ( not ( = ?auto_391388 ?auto_391393 ) ) ( not ( = ?auto_391388 ?auto_391394 ) ) ( not ( = ?auto_391388 ?auto_391395 ) ) ( not ( = ?auto_391388 ?auto_391396 ) ) ( not ( = ?auto_391389 ?auto_391390 ) ) ( not ( = ?auto_391389 ?auto_391391 ) ) ( not ( = ?auto_391389 ?auto_391392 ) ) ( not ( = ?auto_391389 ?auto_391393 ) ) ( not ( = ?auto_391389 ?auto_391394 ) ) ( not ( = ?auto_391389 ?auto_391395 ) ) ( not ( = ?auto_391389 ?auto_391396 ) ) ( not ( = ?auto_391390 ?auto_391391 ) ) ( not ( = ?auto_391390 ?auto_391392 ) ) ( not ( = ?auto_391390 ?auto_391393 ) ) ( not ( = ?auto_391390 ?auto_391394 ) ) ( not ( = ?auto_391390 ?auto_391395 ) ) ( not ( = ?auto_391390 ?auto_391396 ) ) ( not ( = ?auto_391391 ?auto_391392 ) ) ( not ( = ?auto_391391 ?auto_391393 ) ) ( not ( = ?auto_391391 ?auto_391394 ) ) ( not ( = ?auto_391391 ?auto_391395 ) ) ( not ( = ?auto_391391 ?auto_391396 ) ) ( not ( = ?auto_391392 ?auto_391393 ) ) ( not ( = ?auto_391392 ?auto_391394 ) ) ( not ( = ?auto_391392 ?auto_391395 ) ) ( not ( = ?auto_391392 ?auto_391396 ) ) ( not ( = ?auto_391393 ?auto_391394 ) ) ( not ( = ?auto_391393 ?auto_391395 ) ) ( not ( = ?auto_391393 ?auto_391396 ) ) ( not ( = ?auto_391394 ?auto_391395 ) ) ( not ( = ?auto_391394 ?auto_391396 ) ) ( not ( = ?auto_391395 ?auto_391396 ) ) ( ON ?auto_391395 ?auto_391396 ) ( ON ?auto_391394 ?auto_391395 ) ( ON ?auto_391393 ?auto_391394 ) ( ON ?auto_391392 ?auto_391393 ) ( ON ?auto_391391 ?auto_391392 ) ( CLEAR ?auto_391389 ) ( ON ?auto_391390 ?auto_391391 ) ( CLEAR ?auto_391390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_391382 ?auto_391383 ?auto_391384 ?auto_391385 ?auto_391386 ?auto_391387 ?auto_391388 ?auto_391389 ?auto_391390 )
      ( MAKE-15PILE ?auto_391382 ?auto_391383 ?auto_391384 ?auto_391385 ?auto_391386 ?auto_391387 ?auto_391388 ?auto_391389 ?auto_391390 ?auto_391391 ?auto_391392 ?auto_391393 ?auto_391394 ?auto_391395 ?auto_391396 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391412 - BLOCK
      ?auto_391413 - BLOCK
      ?auto_391414 - BLOCK
      ?auto_391415 - BLOCK
      ?auto_391416 - BLOCK
      ?auto_391417 - BLOCK
      ?auto_391418 - BLOCK
      ?auto_391419 - BLOCK
      ?auto_391420 - BLOCK
      ?auto_391421 - BLOCK
      ?auto_391422 - BLOCK
      ?auto_391423 - BLOCK
      ?auto_391424 - BLOCK
      ?auto_391425 - BLOCK
      ?auto_391426 - BLOCK
    )
    :vars
    (
      ?auto_391427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391426 ?auto_391427 ) ( ON-TABLE ?auto_391412 ) ( ON ?auto_391413 ?auto_391412 ) ( ON ?auto_391414 ?auto_391413 ) ( ON ?auto_391415 ?auto_391414 ) ( ON ?auto_391416 ?auto_391415 ) ( ON ?auto_391417 ?auto_391416 ) ( ON ?auto_391418 ?auto_391417 ) ( not ( = ?auto_391412 ?auto_391413 ) ) ( not ( = ?auto_391412 ?auto_391414 ) ) ( not ( = ?auto_391412 ?auto_391415 ) ) ( not ( = ?auto_391412 ?auto_391416 ) ) ( not ( = ?auto_391412 ?auto_391417 ) ) ( not ( = ?auto_391412 ?auto_391418 ) ) ( not ( = ?auto_391412 ?auto_391419 ) ) ( not ( = ?auto_391412 ?auto_391420 ) ) ( not ( = ?auto_391412 ?auto_391421 ) ) ( not ( = ?auto_391412 ?auto_391422 ) ) ( not ( = ?auto_391412 ?auto_391423 ) ) ( not ( = ?auto_391412 ?auto_391424 ) ) ( not ( = ?auto_391412 ?auto_391425 ) ) ( not ( = ?auto_391412 ?auto_391426 ) ) ( not ( = ?auto_391412 ?auto_391427 ) ) ( not ( = ?auto_391413 ?auto_391414 ) ) ( not ( = ?auto_391413 ?auto_391415 ) ) ( not ( = ?auto_391413 ?auto_391416 ) ) ( not ( = ?auto_391413 ?auto_391417 ) ) ( not ( = ?auto_391413 ?auto_391418 ) ) ( not ( = ?auto_391413 ?auto_391419 ) ) ( not ( = ?auto_391413 ?auto_391420 ) ) ( not ( = ?auto_391413 ?auto_391421 ) ) ( not ( = ?auto_391413 ?auto_391422 ) ) ( not ( = ?auto_391413 ?auto_391423 ) ) ( not ( = ?auto_391413 ?auto_391424 ) ) ( not ( = ?auto_391413 ?auto_391425 ) ) ( not ( = ?auto_391413 ?auto_391426 ) ) ( not ( = ?auto_391413 ?auto_391427 ) ) ( not ( = ?auto_391414 ?auto_391415 ) ) ( not ( = ?auto_391414 ?auto_391416 ) ) ( not ( = ?auto_391414 ?auto_391417 ) ) ( not ( = ?auto_391414 ?auto_391418 ) ) ( not ( = ?auto_391414 ?auto_391419 ) ) ( not ( = ?auto_391414 ?auto_391420 ) ) ( not ( = ?auto_391414 ?auto_391421 ) ) ( not ( = ?auto_391414 ?auto_391422 ) ) ( not ( = ?auto_391414 ?auto_391423 ) ) ( not ( = ?auto_391414 ?auto_391424 ) ) ( not ( = ?auto_391414 ?auto_391425 ) ) ( not ( = ?auto_391414 ?auto_391426 ) ) ( not ( = ?auto_391414 ?auto_391427 ) ) ( not ( = ?auto_391415 ?auto_391416 ) ) ( not ( = ?auto_391415 ?auto_391417 ) ) ( not ( = ?auto_391415 ?auto_391418 ) ) ( not ( = ?auto_391415 ?auto_391419 ) ) ( not ( = ?auto_391415 ?auto_391420 ) ) ( not ( = ?auto_391415 ?auto_391421 ) ) ( not ( = ?auto_391415 ?auto_391422 ) ) ( not ( = ?auto_391415 ?auto_391423 ) ) ( not ( = ?auto_391415 ?auto_391424 ) ) ( not ( = ?auto_391415 ?auto_391425 ) ) ( not ( = ?auto_391415 ?auto_391426 ) ) ( not ( = ?auto_391415 ?auto_391427 ) ) ( not ( = ?auto_391416 ?auto_391417 ) ) ( not ( = ?auto_391416 ?auto_391418 ) ) ( not ( = ?auto_391416 ?auto_391419 ) ) ( not ( = ?auto_391416 ?auto_391420 ) ) ( not ( = ?auto_391416 ?auto_391421 ) ) ( not ( = ?auto_391416 ?auto_391422 ) ) ( not ( = ?auto_391416 ?auto_391423 ) ) ( not ( = ?auto_391416 ?auto_391424 ) ) ( not ( = ?auto_391416 ?auto_391425 ) ) ( not ( = ?auto_391416 ?auto_391426 ) ) ( not ( = ?auto_391416 ?auto_391427 ) ) ( not ( = ?auto_391417 ?auto_391418 ) ) ( not ( = ?auto_391417 ?auto_391419 ) ) ( not ( = ?auto_391417 ?auto_391420 ) ) ( not ( = ?auto_391417 ?auto_391421 ) ) ( not ( = ?auto_391417 ?auto_391422 ) ) ( not ( = ?auto_391417 ?auto_391423 ) ) ( not ( = ?auto_391417 ?auto_391424 ) ) ( not ( = ?auto_391417 ?auto_391425 ) ) ( not ( = ?auto_391417 ?auto_391426 ) ) ( not ( = ?auto_391417 ?auto_391427 ) ) ( not ( = ?auto_391418 ?auto_391419 ) ) ( not ( = ?auto_391418 ?auto_391420 ) ) ( not ( = ?auto_391418 ?auto_391421 ) ) ( not ( = ?auto_391418 ?auto_391422 ) ) ( not ( = ?auto_391418 ?auto_391423 ) ) ( not ( = ?auto_391418 ?auto_391424 ) ) ( not ( = ?auto_391418 ?auto_391425 ) ) ( not ( = ?auto_391418 ?auto_391426 ) ) ( not ( = ?auto_391418 ?auto_391427 ) ) ( not ( = ?auto_391419 ?auto_391420 ) ) ( not ( = ?auto_391419 ?auto_391421 ) ) ( not ( = ?auto_391419 ?auto_391422 ) ) ( not ( = ?auto_391419 ?auto_391423 ) ) ( not ( = ?auto_391419 ?auto_391424 ) ) ( not ( = ?auto_391419 ?auto_391425 ) ) ( not ( = ?auto_391419 ?auto_391426 ) ) ( not ( = ?auto_391419 ?auto_391427 ) ) ( not ( = ?auto_391420 ?auto_391421 ) ) ( not ( = ?auto_391420 ?auto_391422 ) ) ( not ( = ?auto_391420 ?auto_391423 ) ) ( not ( = ?auto_391420 ?auto_391424 ) ) ( not ( = ?auto_391420 ?auto_391425 ) ) ( not ( = ?auto_391420 ?auto_391426 ) ) ( not ( = ?auto_391420 ?auto_391427 ) ) ( not ( = ?auto_391421 ?auto_391422 ) ) ( not ( = ?auto_391421 ?auto_391423 ) ) ( not ( = ?auto_391421 ?auto_391424 ) ) ( not ( = ?auto_391421 ?auto_391425 ) ) ( not ( = ?auto_391421 ?auto_391426 ) ) ( not ( = ?auto_391421 ?auto_391427 ) ) ( not ( = ?auto_391422 ?auto_391423 ) ) ( not ( = ?auto_391422 ?auto_391424 ) ) ( not ( = ?auto_391422 ?auto_391425 ) ) ( not ( = ?auto_391422 ?auto_391426 ) ) ( not ( = ?auto_391422 ?auto_391427 ) ) ( not ( = ?auto_391423 ?auto_391424 ) ) ( not ( = ?auto_391423 ?auto_391425 ) ) ( not ( = ?auto_391423 ?auto_391426 ) ) ( not ( = ?auto_391423 ?auto_391427 ) ) ( not ( = ?auto_391424 ?auto_391425 ) ) ( not ( = ?auto_391424 ?auto_391426 ) ) ( not ( = ?auto_391424 ?auto_391427 ) ) ( not ( = ?auto_391425 ?auto_391426 ) ) ( not ( = ?auto_391425 ?auto_391427 ) ) ( not ( = ?auto_391426 ?auto_391427 ) ) ( ON ?auto_391425 ?auto_391426 ) ( ON ?auto_391424 ?auto_391425 ) ( ON ?auto_391423 ?auto_391424 ) ( ON ?auto_391422 ?auto_391423 ) ( ON ?auto_391421 ?auto_391422 ) ( ON ?auto_391420 ?auto_391421 ) ( CLEAR ?auto_391418 ) ( ON ?auto_391419 ?auto_391420 ) ( CLEAR ?auto_391419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_391412 ?auto_391413 ?auto_391414 ?auto_391415 ?auto_391416 ?auto_391417 ?auto_391418 ?auto_391419 )
      ( MAKE-15PILE ?auto_391412 ?auto_391413 ?auto_391414 ?auto_391415 ?auto_391416 ?auto_391417 ?auto_391418 ?auto_391419 ?auto_391420 ?auto_391421 ?auto_391422 ?auto_391423 ?auto_391424 ?auto_391425 ?auto_391426 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391443 - BLOCK
      ?auto_391444 - BLOCK
      ?auto_391445 - BLOCK
      ?auto_391446 - BLOCK
      ?auto_391447 - BLOCK
      ?auto_391448 - BLOCK
      ?auto_391449 - BLOCK
      ?auto_391450 - BLOCK
      ?auto_391451 - BLOCK
      ?auto_391452 - BLOCK
      ?auto_391453 - BLOCK
      ?auto_391454 - BLOCK
      ?auto_391455 - BLOCK
      ?auto_391456 - BLOCK
      ?auto_391457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391457 ) ( ON-TABLE ?auto_391443 ) ( ON ?auto_391444 ?auto_391443 ) ( ON ?auto_391445 ?auto_391444 ) ( ON ?auto_391446 ?auto_391445 ) ( ON ?auto_391447 ?auto_391446 ) ( ON ?auto_391448 ?auto_391447 ) ( ON ?auto_391449 ?auto_391448 ) ( not ( = ?auto_391443 ?auto_391444 ) ) ( not ( = ?auto_391443 ?auto_391445 ) ) ( not ( = ?auto_391443 ?auto_391446 ) ) ( not ( = ?auto_391443 ?auto_391447 ) ) ( not ( = ?auto_391443 ?auto_391448 ) ) ( not ( = ?auto_391443 ?auto_391449 ) ) ( not ( = ?auto_391443 ?auto_391450 ) ) ( not ( = ?auto_391443 ?auto_391451 ) ) ( not ( = ?auto_391443 ?auto_391452 ) ) ( not ( = ?auto_391443 ?auto_391453 ) ) ( not ( = ?auto_391443 ?auto_391454 ) ) ( not ( = ?auto_391443 ?auto_391455 ) ) ( not ( = ?auto_391443 ?auto_391456 ) ) ( not ( = ?auto_391443 ?auto_391457 ) ) ( not ( = ?auto_391444 ?auto_391445 ) ) ( not ( = ?auto_391444 ?auto_391446 ) ) ( not ( = ?auto_391444 ?auto_391447 ) ) ( not ( = ?auto_391444 ?auto_391448 ) ) ( not ( = ?auto_391444 ?auto_391449 ) ) ( not ( = ?auto_391444 ?auto_391450 ) ) ( not ( = ?auto_391444 ?auto_391451 ) ) ( not ( = ?auto_391444 ?auto_391452 ) ) ( not ( = ?auto_391444 ?auto_391453 ) ) ( not ( = ?auto_391444 ?auto_391454 ) ) ( not ( = ?auto_391444 ?auto_391455 ) ) ( not ( = ?auto_391444 ?auto_391456 ) ) ( not ( = ?auto_391444 ?auto_391457 ) ) ( not ( = ?auto_391445 ?auto_391446 ) ) ( not ( = ?auto_391445 ?auto_391447 ) ) ( not ( = ?auto_391445 ?auto_391448 ) ) ( not ( = ?auto_391445 ?auto_391449 ) ) ( not ( = ?auto_391445 ?auto_391450 ) ) ( not ( = ?auto_391445 ?auto_391451 ) ) ( not ( = ?auto_391445 ?auto_391452 ) ) ( not ( = ?auto_391445 ?auto_391453 ) ) ( not ( = ?auto_391445 ?auto_391454 ) ) ( not ( = ?auto_391445 ?auto_391455 ) ) ( not ( = ?auto_391445 ?auto_391456 ) ) ( not ( = ?auto_391445 ?auto_391457 ) ) ( not ( = ?auto_391446 ?auto_391447 ) ) ( not ( = ?auto_391446 ?auto_391448 ) ) ( not ( = ?auto_391446 ?auto_391449 ) ) ( not ( = ?auto_391446 ?auto_391450 ) ) ( not ( = ?auto_391446 ?auto_391451 ) ) ( not ( = ?auto_391446 ?auto_391452 ) ) ( not ( = ?auto_391446 ?auto_391453 ) ) ( not ( = ?auto_391446 ?auto_391454 ) ) ( not ( = ?auto_391446 ?auto_391455 ) ) ( not ( = ?auto_391446 ?auto_391456 ) ) ( not ( = ?auto_391446 ?auto_391457 ) ) ( not ( = ?auto_391447 ?auto_391448 ) ) ( not ( = ?auto_391447 ?auto_391449 ) ) ( not ( = ?auto_391447 ?auto_391450 ) ) ( not ( = ?auto_391447 ?auto_391451 ) ) ( not ( = ?auto_391447 ?auto_391452 ) ) ( not ( = ?auto_391447 ?auto_391453 ) ) ( not ( = ?auto_391447 ?auto_391454 ) ) ( not ( = ?auto_391447 ?auto_391455 ) ) ( not ( = ?auto_391447 ?auto_391456 ) ) ( not ( = ?auto_391447 ?auto_391457 ) ) ( not ( = ?auto_391448 ?auto_391449 ) ) ( not ( = ?auto_391448 ?auto_391450 ) ) ( not ( = ?auto_391448 ?auto_391451 ) ) ( not ( = ?auto_391448 ?auto_391452 ) ) ( not ( = ?auto_391448 ?auto_391453 ) ) ( not ( = ?auto_391448 ?auto_391454 ) ) ( not ( = ?auto_391448 ?auto_391455 ) ) ( not ( = ?auto_391448 ?auto_391456 ) ) ( not ( = ?auto_391448 ?auto_391457 ) ) ( not ( = ?auto_391449 ?auto_391450 ) ) ( not ( = ?auto_391449 ?auto_391451 ) ) ( not ( = ?auto_391449 ?auto_391452 ) ) ( not ( = ?auto_391449 ?auto_391453 ) ) ( not ( = ?auto_391449 ?auto_391454 ) ) ( not ( = ?auto_391449 ?auto_391455 ) ) ( not ( = ?auto_391449 ?auto_391456 ) ) ( not ( = ?auto_391449 ?auto_391457 ) ) ( not ( = ?auto_391450 ?auto_391451 ) ) ( not ( = ?auto_391450 ?auto_391452 ) ) ( not ( = ?auto_391450 ?auto_391453 ) ) ( not ( = ?auto_391450 ?auto_391454 ) ) ( not ( = ?auto_391450 ?auto_391455 ) ) ( not ( = ?auto_391450 ?auto_391456 ) ) ( not ( = ?auto_391450 ?auto_391457 ) ) ( not ( = ?auto_391451 ?auto_391452 ) ) ( not ( = ?auto_391451 ?auto_391453 ) ) ( not ( = ?auto_391451 ?auto_391454 ) ) ( not ( = ?auto_391451 ?auto_391455 ) ) ( not ( = ?auto_391451 ?auto_391456 ) ) ( not ( = ?auto_391451 ?auto_391457 ) ) ( not ( = ?auto_391452 ?auto_391453 ) ) ( not ( = ?auto_391452 ?auto_391454 ) ) ( not ( = ?auto_391452 ?auto_391455 ) ) ( not ( = ?auto_391452 ?auto_391456 ) ) ( not ( = ?auto_391452 ?auto_391457 ) ) ( not ( = ?auto_391453 ?auto_391454 ) ) ( not ( = ?auto_391453 ?auto_391455 ) ) ( not ( = ?auto_391453 ?auto_391456 ) ) ( not ( = ?auto_391453 ?auto_391457 ) ) ( not ( = ?auto_391454 ?auto_391455 ) ) ( not ( = ?auto_391454 ?auto_391456 ) ) ( not ( = ?auto_391454 ?auto_391457 ) ) ( not ( = ?auto_391455 ?auto_391456 ) ) ( not ( = ?auto_391455 ?auto_391457 ) ) ( not ( = ?auto_391456 ?auto_391457 ) ) ( ON ?auto_391456 ?auto_391457 ) ( ON ?auto_391455 ?auto_391456 ) ( ON ?auto_391454 ?auto_391455 ) ( ON ?auto_391453 ?auto_391454 ) ( ON ?auto_391452 ?auto_391453 ) ( ON ?auto_391451 ?auto_391452 ) ( CLEAR ?auto_391449 ) ( ON ?auto_391450 ?auto_391451 ) ( CLEAR ?auto_391450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_391443 ?auto_391444 ?auto_391445 ?auto_391446 ?auto_391447 ?auto_391448 ?auto_391449 ?auto_391450 )
      ( MAKE-15PILE ?auto_391443 ?auto_391444 ?auto_391445 ?auto_391446 ?auto_391447 ?auto_391448 ?auto_391449 ?auto_391450 ?auto_391451 ?auto_391452 ?auto_391453 ?auto_391454 ?auto_391455 ?auto_391456 ?auto_391457 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391473 - BLOCK
      ?auto_391474 - BLOCK
      ?auto_391475 - BLOCK
      ?auto_391476 - BLOCK
      ?auto_391477 - BLOCK
      ?auto_391478 - BLOCK
      ?auto_391479 - BLOCK
      ?auto_391480 - BLOCK
      ?auto_391481 - BLOCK
      ?auto_391482 - BLOCK
      ?auto_391483 - BLOCK
      ?auto_391484 - BLOCK
      ?auto_391485 - BLOCK
      ?auto_391486 - BLOCK
      ?auto_391487 - BLOCK
    )
    :vars
    (
      ?auto_391488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391487 ?auto_391488 ) ( ON-TABLE ?auto_391473 ) ( ON ?auto_391474 ?auto_391473 ) ( ON ?auto_391475 ?auto_391474 ) ( ON ?auto_391476 ?auto_391475 ) ( ON ?auto_391477 ?auto_391476 ) ( ON ?auto_391478 ?auto_391477 ) ( not ( = ?auto_391473 ?auto_391474 ) ) ( not ( = ?auto_391473 ?auto_391475 ) ) ( not ( = ?auto_391473 ?auto_391476 ) ) ( not ( = ?auto_391473 ?auto_391477 ) ) ( not ( = ?auto_391473 ?auto_391478 ) ) ( not ( = ?auto_391473 ?auto_391479 ) ) ( not ( = ?auto_391473 ?auto_391480 ) ) ( not ( = ?auto_391473 ?auto_391481 ) ) ( not ( = ?auto_391473 ?auto_391482 ) ) ( not ( = ?auto_391473 ?auto_391483 ) ) ( not ( = ?auto_391473 ?auto_391484 ) ) ( not ( = ?auto_391473 ?auto_391485 ) ) ( not ( = ?auto_391473 ?auto_391486 ) ) ( not ( = ?auto_391473 ?auto_391487 ) ) ( not ( = ?auto_391473 ?auto_391488 ) ) ( not ( = ?auto_391474 ?auto_391475 ) ) ( not ( = ?auto_391474 ?auto_391476 ) ) ( not ( = ?auto_391474 ?auto_391477 ) ) ( not ( = ?auto_391474 ?auto_391478 ) ) ( not ( = ?auto_391474 ?auto_391479 ) ) ( not ( = ?auto_391474 ?auto_391480 ) ) ( not ( = ?auto_391474 ?auto_391481 ) ) ( not ( = ?auto_391474 ?auto_391482 ) ) ( not ( = ?auto_391474 ?auto_391483 ) ) ( not ( = ?auto_391474 ?auto_391484 ) ) ( not ( = ?auto_391474 ?auto_391485 ) ) ( not ( = ?auto_391474 ?auto_391486 ) ) ( not ( = ?auto_391474 ?auto_391487 ) ) ( not ( = ?auto_391474 ?auto_391488 ) ) ( not ( = ?auto_391475 ?auto_391476 ) ) ( not ( = ?auto_391475 ?auto_391477 ) ) ( not ( = ?auto_391475 ?auto_391478 ) ) ( not ( = ?auto_391475 ?auto_391479 ) ) ( not ( = ?auto_391475 ?auto_391480 ) ) ( not ( = ?auto_391475 ?auto_391481 ) ) ( not ( = ?auto_391475 ?auto_391482 ) ) ( not ( = ?auto_391475 ?auto_391483 ) ) ( not ( = ?auto_391475 ?auto_391484 ) ) ( not ( = ?auto_391475 ?auto_391485 ) ) ( not ( = ?auto_391475 ?auto_391486 ) ) ( not ( = ?auto_391475 ?auto_391487 ) ) ( not ( = ?auto_391475 ?auto_391488 ) ) ( not ( = ?auto_391476 ?auto_391477 ) ) ( not ( = ?auto_391476 ?auto_391478 ) ) ( not ( = ?auto_391476 ?auto_391479 ) ) ( not ( = ?auto_391476 ?auto_391480 ) ) ( not ( = ?auto_391476 ?auto_391481 ) ) ( not ( = ?auto_391476 ?auto_391482 ) ) ( not ( = ?auto_391476 ?auto_391483 ) ) ( not ( = ?auto_391476 ?auto_391484 ) ) ( not ( = ?auto_391476 ?auto_391485 ) ) ( not ( = ?auto_391476 ?auto_391486 ) ) ( not ( = ?auto_391476 ?auto_391487 ) ) ( not ( = ?auto_391476 ?auto_391488 ) ) ( not ( = ?auto_391477 ?auto_391478 ) ) ( not ( = ?auto_391477 ?auto_391479 ) ) ( not ( = ?auto_391477 ?auto_391480 ) ) ( not ( = ?auto_391477 ?auto_391481 ) ) ( not ( = ?auto_391477 ?auto_391482 ) ) ( not ( = ?auto_391477 ?auto_391483 ) ) ( not ( = ?auto_391477 ?auto_391484 ) ) ( not ( = ?auto_391477 ?auto_391485 ) ) ( not ( = ?auto_391477 ?auto_391486 ) ) ( not ( = ?auto_391477 ?auto_391487 ) ) ( not ( = ?auto_391477 ?auto_391488 ) ) ( not ( = ?auto_391478 ?auto_391479 ) ) ( not ( = ?auto_391478 ?auto_391480 ) ) ( not ( = ?auto_391478 ?auto_391481 ) ) ( not ( = ?auto_391478 ?auto_391482 ) ) ( not ( = ?auto_391478 ?auto_391483 ) ) ( not ( = ?auto_391478 ?auto_391484 ) ) ( not ( = ?auto_391478 ?auto_391485 ) ) ( not ( = ?auto_391478 ?auto_391486 ) ) ( not ( = ?auto_391478 ?auto_391487 ) ) ( not ( = ?auto_391478 ?auto_391488 ) ) ( not ( = ?auto_391479 ?auto_391480 ) ) ( not ( = ?auto_391479 ?auto_391481 ) ) ( not ( = ?auto_391479 ?auto_391482 ) ) ( not ( = ?auto_391479 ?auto_391483 ) ) ( not ( = ?auto_391479 ?auto_391484 ) ) ( not ( = ?auto_391479 ?auto_391485 ) ) ( not ( = ?auto_391479 ?auto_391486 ) ) ( not ( = ?auto_391479 ?auto_391487 ) ) ( not ( = ?auto_391479 ?auto_391488 ) ) ( not ( = ?auto_391480 ?auto_391481 ) ) ( not ( = ?auto_391480 ?auto_391482 ) ) ( not ( = ?auto_391480 ?auto_391483 ) ) ( not ( = ?auto_391480 ?auto_391484 ) ) ( not ( = ?auto_391480 ?auto_391485 ) ) ( not ( = ?auto_391480 ?auto_391486 ) ) ( not ( = ?auto_391480 ?auto_391487 ) ) ( not ( = ?auto_391480 ?auto_391488 ) ) ( not ( = ?auto_391481 ?auto_391482 ) ) ( not ( = ?auto_391481 ?auto_391483 ) ) ( not ( = ?auto_391481 ?auto_391484 ) ) ( not ( = ?auto_391481 ?auto_391485 ) ) ( not ( = ?auto_391481 ?auto_391486 ) ) ( not ( = ?auto_391481 ?auto_391487 ) ) ( not ( = ?auto_391481 ?auto_391488 ) ) ( not ( = ?auto_391482 ?auto_391483 ) ) ( not ( = ?auto_391482 ?auto_391484 ) ) ( not ( = ?auto_391482 ?auto_391485 ) ) ( not ( = ?auto_391482 ?auto_391486 ) ) ( not ( = ?auto_391482 ?auto_391487 ) ) ( not ( = ?auto_391482 ?auto_391488 ) ) ( not ( = ?auto_391483 ?auto_391484 ) ) ( not ( = ?auto_391483 ?auto_391485 ) ) ( not ( = ?auto_391483 ?auto_391486 ) ) ( not ( = ?auto_391483 ?auto_391487 ) ) ( not ( = ?auto_391483 ?auto_391488 ) ) ( not ( = ?auto_391484 ?auto_391485 ) ) ( not ( = ?auto_391484 ?auto_391486 ) ) ( not ( = ?auto_391484 ?auto_391487 ) ) ( not ( = ?auto_391484 ?auto_391488 ) ) ( not ( = ?auto_391485 ?auto_391486 ) ) ( not ( = ?auto_391485 ?auto_391487 ) ) ( not ( = ?auto_391485 ?auto_391488 ) ) ( not ( = ?auto_391486 ?auto_391487 ) ) ( not ( = ?auto_391486 ?auto_391488 ) ) ( not ( = ?auto_391487 ?auto_391488 ) ) ( ON ?auto_391486 ?auto_391487 ) ( ON ?auto_391485 ?auto_391486 ) ( ON ?auto_391484 ?auto_391485 ) ( ON ?auto_391483 ?auto_391484 ) ( ON ?auto_391482 ?auto_391483 ) ( ON ?auto_391481 ?auto_391482 ) ( ON ?auto_391480 ?auto_391481 ) ( CLEAR ?auto_391478 ) ( ON ?auto_391479 ?auto_391480 ) ( CLEAR ?auto_391479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_391473 ?auto_391474 ?auto_391475 ?auto_391476 ?auto_391477 ?auto_391478 ?auto_391479 )
      ( MAKE-15PILE ?auto_391473 ?auto_391474 ?auto_391475 ?auto_391476 ?auto_391477 ?auto_391478 ?auto_391479 ?auto_391480 ?auto_391481 ?auto_391482 ?auto_391483 ?auto_391484 ?auto_391485 ?auto_391486 ?auto_391487 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391504 - BLOCK
      ?auto_391505 - BLOCK
      ?auto_391506 - BLOCK
      ?auto_391507 - BLOCK
      ?auto_391508 - BLOCK
      ?auto_391509 - BLOCK
      ?auto_391510 - BLOCK
      ?auto_391511 - BLOCK
      ?auto_391512 - BLOCK
      ?auto_391513 - BLOCK
      ?auto_391514 - BLOCK
      ?auto_391515 - BLOCK
      ?auto_391516 - BLOCK
      ?auto_391517 - BLOCK
      ?auto_391518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391518 ) ( ON-TABLE ?auto_391504 ) ( ON ?auto_391505 ?auto_391504 ) ( ON ?auto_391506 ?auto_391505 ) ( ON ?auto_391507 ?auto_391506 ) ( ON ?auto_391508 ?auto_391507 ) ( ON ?auto_391509 ?auto_391508 ) ( not ( = ?auto_391504 ?auto_391505 ) ) ( not ( = ?auto_391504 ?auto_391506 ) ) ( not ( = ?auto_391504 ?auto_391507 ) ) ( not ( = ?auto_391504 ?auto_391508 ) ) ( not ( = ?auto_391504 ?auto_391509 ) ) ( not ( = ?auto_391504 ?auto_391510 ) ) ( not ( = ?auto_391504 ?auto_391511 ) ) ( not ( = ?auto_391504 ?auto_391512 ) ) ( not ( = ?auto_391504 ?auto_391513 ) ) ( not ( = ?auto_391504 ?auto_391514 ) ) ( not ( = ?auto_391504 ?auto_391515 ) ) ( not ( = ?auto_391504 ?auto_391516 ) ) ( not ( = ?auto_391504 ?auto_391517 ) ) ( not ( = ?auto_391504 ?auto_391518 ) ) ( not ( = ?auto_391505 ?auto_391506 ) ) ( not ( = ?auto_391505 ?auto_391507 ) ) ( not ( = ?auto_391505 ?auto_391508 ) ) ( not ( = ?auto_391505 ?auto_391509 ) ) ( not ( = ?auto_391505 ?auto_391510 ) ) ( not ( = ?auto_391505 ?auto_391511 ) ) ( not ( = ?auto_391505 ?auto_391512 ) ) ( not ( = ?auto_391505 ?auto_391513 ) ) ( not ( = ?auto_391505 ?auto_391514 ) ) ( not ( = ?auto_391505 ?auto_391515 ) ) ( not ( = ?auto_391505 ?auto_391516 ) ) ( not ( = ?auto_391505 ?auto_391517 ) ) ( not ( = ?auto_391505 ?auto_391518 ) ) ( not ( = ?auto_391506 ?auto_391507 ) ) ( not ( = ?auto_391506 ?auto_391508 ) ) ( not ( = ?auto_391506 ?auto_391509 ) ) ( not ( = ?auto_391506 ?auto_391510 ) ) ( not ( = ?auto_391506 ?auto_391511 ) ) ( not ( = ?auto_391506 ?auto_391512 ) ) ( not ( = ?auto_391506 ?auto_391513 ) ) ( not ( = ?auto_391506 ?auto_391514 ) ) ( not ( = ?auto_391506 ?auto_391515 ) ) ( not ( = ?auto_391506 ?auto_391516 ) ) ( not ( = ?auto_391506 ?auto_391517 ) ) ( not ( = ?auto_391506 ?auto_391518 ) ) ( not ( = ?auto_391507 ?auto_391508 ) ) ( not ( = ?auto_391507 ?auto_391509 ) ) ( not ( = ?auto_391507 ?auto_391510 ) ) ( not ( = ?auto_391507 ?auto_391511 ) ) ( not ( = ?auto_391507 ?auto_391512 ) ) ( not ( = ?auto_391507 ?auto_391513 ) ) ( not ( = ?auto_391507 ?auto_391514 ) ) ( not ( = ?auto_391507 ?auto_391515 ) ) ( not ( = ?auto_391507 ?auto_391516 ) ) ( not ( = ?auto_391507 ?auto_391517 ) ) ( not ( = ?auto_391507 ?auto_391518 ) ) ( not ( = ?auto_391508 ?auto_391509 ) ) ( not ( = ?auto_391508 ?auto_391510 ) ) ( not ( = ?auto_391508 ?auto_391511 ) ) ( not ( = ?auto_391508 ?auto_391512 ) ) ( not ( = ?auto_391508 ?auto_391513 ) ) ( not ( = ?auto_391508 ?auto_391514 ) ) ( not ( = ?auto_391508 ?auto_391515 ) ) ( not ( = ?auto_391508 ?auto_391516 ) ) ( not ( = ?auto_391508 ?auto_391517 ) ) ( not ( = ?auto_391508 ?auto_391518 ) ) ( not ( = ?auto_391509 ?auto_391510 ) ) ( not ( = ?auto_391509 ?auto_391511 ) ) ( not ( = ?auto_391509 ?auto_391512 ) ) ( not ( = ?auto_391509 ?auto_391513 ) ) ( not ( = ?auto_391509 ?auto_391514 ) ) ( not ( = ?auto_391509 ?auto_391515 ) ) ( not ( = ?auto_391509 ?auto_391516 ) ) ( not ( = ?auto_391509 ?auto_391517 ) ) ( not ( = ?auto_391509 ?auto_391518 ) ) ( not ( = ?auto_391510 ?auto_391511 ) ) ( not ( = ?auto_391510 ?auto_391512 ) ) ( not ( = ?auto_391510 ?auto_391513 ) ) ( not ( = ?auto_391510 ?auto_391514 ) ) ( not ( = ?auto_391510 ?auto_391515 ) ) ( not ( = ?auto_391510 ?auto_391516 ) ) ( not ( = ?auto_391510 ?auto_391517 ) ) ( not ( = ?auto_391510 ?auto_391518 ) ) ( not ( = ?auto_391511 ?auto_391512 ) ) ( not ( = ?auto_391511 ?auto_391513 ) ) ( not ( = ?auto_391511 ?auto_391514 ) ) ( not ( = ?auto_391511 ?auto_391515 ) ) ( not ( = ?auto_391511 ?auto_391516 ) ) ( not ( = ?auto_391511 ?auto_391517 ) ) ( not ( = ?auto_391511 ?auto_391518 ) ) ( not ( = ?auto_391512 ?auto_391513 ) ) ( not ( = ?auto_391512 ?auto_391514 ) ) ( not ( = ?auto_391512 ?auto_391515 ) ) ( not ( = ?auto_391512 ?auto_391516 ) ) ( not ( = ?auto_391512 ?auto_391517 ) ) ( not ( = ?auto_391512 ?auto_391518 ) ) ( not ( = ?auto_391513 ?auto_391514 ) ) ( not ( = ?auto_391513 ?auto_391515 ) ) ( not ( = ?auto_391513 ?auto_391516 ) ) ( not ( = ?auto_391513 ?auto_391517 ) ) ( not ( = ?auto_391513 ?auto_391518 ) ) ( not ( = ?auto_391514 ?auto_391515 ) ) ( not ( = ?auto_391514 ?auto_391516 ) ) ( not ( = ?auto_391514 ?auto_391517 ) ) ( not ( = ?auto_391514 ?auto_391518 ) ) ( not ( = ?auto_391515 ?auto_391516 ) ) ( not ( = ?auto_391515 ?auto_391517 ) ) ( not ( = ?auto_391515 ?auto_391518 ) ) ( not ( = ?auto_391516 ?auto_391517 ) ) ( not ( = ?auto_391516 ?auto_391518 ) ) ( not ( = ?auto_391517 ?auto_391518 ) ) ( ON ?auto_391517 ?auto_391518 ) ( ON ?auto_391516 ?auto_391517 ) ( ON ?auto_391515 ?auto_391516 ) ( ON ?auto_391514 ?auto_391515 ) ( ON ?auto_391513 ?auto_391514 ) ( ON ?auto_391512 ?auto_391513 ) ( ON ?auto_391511 ?auto_391512 ) ( CLEAR ?auto_391509 ) ( ON ?auto_391510 ?auto_391511 ) ( CLEAR ?auto_391510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_391504 ?auto_391505 ?auto_391506 ?auto_391507 ?auto_391508 ?auto_391509 ?auto_391510 )
      ( MAKE-15PILE ?auto_391504 ?auto_391505 ?auto_391506 ?auto_391507 ?auto_391508 ?auto_391509 ?auto_391510 ?auto_391511 ?auto_391512 ?auto_391513 ?auto_391514 ?auto_391515 ?auto_391516 ?auto_391517 ?auto_391518 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391534 - BLOCK
      ?auto_391535 - BLOCK
      ?auto_391536 - BLOCK
      ?auto_391537 - BLOCK
      ?auto_391538 - BLOCK
      ?auto_391539 - BLOCK
      ?auto_391540 - BLOCK
      ?auto_391541 - BLOCK
      ?auto_391542 - BLOCK
      ?auto_391543 - BLOCK
      ?auto_391544 - BLOCK
      ?auto_391545 - BLOCK
      ?auto_391546 - BLOCK
      ?auto_391547 - BLOCK
      ?auto_391548 - BLOCK
    )
    :vars
    (
      ?auto_391549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391548 ?auto_391549 ) ( ON-TABLE ?auto_391534 ) ( ON ?auto_391535 ?auto_391534 ) ( ON ?auto_391536 ?auto_391535 ) ( ON ?auto_391537 ?auto_391536 ) ( ON ?auto_391538 ?auto_391537 ) ( not ( = ?auto_391534 ?auto_391535 ) ) ( not ( = ?auto_391534 ?auto_391536 ) ) ( not ( = ?auto_391534 ?auto_391537 ) ) ( not ( = ?auto_391534 ?auto_391538 ) ) ( not ( = ?auto_391534 ?auto_391539 ) ) ( not ( = ?auto_391534 ?auto_391540 ) ) ( not ( = ?auto_391534 ?auto_391541 ) ) ( not ( = ?auto_391534 ?auto_391542 ) ) ( not ( = ?auto_391534 ?auto_391543 ) ) ( not ( = ?auto_391534 ?auto_391544 ) ) ( not ( = ?auto_391534 ?auto_391545 ) ) ( not ( = ?auto_391534 ?auto_391546 ) ) ( not ( = ?auto_391534 ?auto_391547 ) ) ( not ( = ?auto_391534 ?auto_391548 ) ) ( not ( = ?auto_391534 ?auto_391549 ) ) ( not ( = ?auto_391535 ?auto_391536 ) ) ( not ( = ?auto_391535 ?auto_391537 ) ) ( not ( = ?auto_391535 ?auto_391538 ) ) ( not ( = ?auto_391535 ?auto_391539 ) ) ( not ( = ?auto_391535 ?auto_391540 ) ) ( not ( = ?auto_391535 ?auto_391541 ) ) ( not ( = ?auto_391535 ?auto_391542 ) ) ( not ( = ?auto_391535 ?auto_391543 ) ) ( not ( = ?auto_391535 ?auto_391544 ) ) ( not ( = ?auto_391535 ?auto_391545 ) ) ( not ( = ?auto_391535 ?auto_391546 ) ) ( not ( = ?auto_391535 ?auto_391547 ) ) ( not ( = ?auto_391535 ?auto_391548 ) ) ( not ( = ?auto_391535 ?auto_391549 ) ) ( not ( = ?auto_391536 ?auto_391537 ) ) ( not ( = ?auto_391536 ?auto_391538 ) ) ( not ( = ?auto_391536 ?auto_391539 ) ) ( not ( = ?auto_391536 ?auto_391540 ) ) ( not ( = ?auto_391536 ?auto_391541 ) ) ( not ( = ?auto_391536 ?auto_391542 ) ) ( not ( = ?auto_391536 ?auto_391543 ) ) ( not ( = ?auto_391536 ?auto_391544 ) ) ( not ( = ?auto_391536 ?auto_391545 ) ) ( not ( = ?auto_391536 ?auto_391546 ) ) ( not ( = ?auto_391536 ?auto_391547 ) ) ( not ( = ?auto_391536 ?auto_391548 ) ) ( not ( = ?auto_391536 ?auto_391549 ) ) ( not ( = ?auto_391537 ?auto_391538 ) ) ( not ( = ?auto_391537 ?auto_391539 ) ) ( not ( = ?auto_391537 ?auto_391540 ) ) ( not ( = ?auto_391537 ?auto_391541 ) ) ( not ( = ?auto_391537 ?auto_391542 ) ) ( not ( = ?auto_391537 ?auto_391543 ) ) ( not ( = ?auto_391537 ?auto_391544 ) ) ( not ( = ?auto_391537 ?auto_391545 ) ) ( not ( = ?auto_391537 ?auto_391546 ) ) ( not ( = ?auto_391537 ?auto_391547 ) ) ( not ( = ?auto_391537 ?auto_391548 ) ) ( not ( = ?auto_391537 ?auto_391549 ) ) ( not ( = ?auto_391538 ?auto_391539 ) ) ( not ( = ?auto_391538 ?auto_391540 ) ) ( not ( = ?auto_391538 ?auto_391541 ) ) ( not ( = ?auto_391538 ?auto_391542 ) ) ( not ( = ?auto_391538 ?auto_391543 ) ) ( not ( = ?auto_391538 ?auto_391544 ) ) ( not ( = ?auto_391538 ?auto_391545 ) ) ( not ( = ?auto_391538 ?auto_391546 ) ) ( not ( = ?auto_391538 ?auto_391547 ) ) ( not ( = ?auto_391538 ?auto_391548 ) ) ( not ( = ?auto_391538 ?auto_391549 ) ) ( not ( = ?auto_391539 ?auto_391540 ) ) ( not ( = ?auto_391539 ?auto_391541 ) ) ( not ( = ?auto_391539 ?auto_391542 ) ) ( not ( = ?auto_391539 ?auto_391543 ) ) ( not ( = ?auto_391539 ?auto_391544 ) ) ( not ( = ?auto_391539 ?auto_391545 ) ) ( not ( = ?auto_391539 ?auto_391546 ) ) ( not ( = ?auto_391539 ?auto_391547 ) ) ( not ( = ?auto_391539 ?auto_391548 ) ) ( not ( = ?auto_391539 ?auto_391549 ) ) ( not ( = ?auto_391540 ?auto_391541 ) ) ( not ( = ?auto_391540 ?auto_391542 ) ) ( not ( = ?auto_391540 ?auto_391543 ) ) ( not ( = ?auto_391540 ?auto_391544 ) ) ( not ( = ?auto_391540 ?auto_391545 ) ) ( not ( = ?auto_391540 ?auto_391546 ) ) ( not ( = ?auto_391540 ?auto_391547 ) ) ( not ( = ?auto_391540 ?auto_391548 ) ) ( not ( = ?auto_391540 ?auto_391549 ) ) ( not ( = ?auto_391541 ?auto_391542 ) ) ( not ( = ?auto_391541 ?auto_391543 ) ) ( not ( = ?auto_391541 ?auto_391544 ) ) ( not ( = ?auto_391541 ?auto_391545 ) ) ( not ( = ?auto_391541 ?auto_391546 ) ) ( not ( = ?auto_391541 ?auto_391547 ) ) ( not ( = ?auto_391541 ?auto_391548 ) ) ( not ( = ?auto_391541 ?auto_391549 ) ) ( not ( = ?auto_391542 ?auto_391543 ) ) ( not ( = ?auto_391542 ?auto_391544 ) ) ( not ( = ?auto_391542 ?auto_391545 ) ) ( not ( = ?auto_391542 ?auto_391546 ) ) ( not ( = ?auto_391542 ?auto_391547 ) ) ( not ( = ?auto_391542 ?auto_391548 ) ) ( not ( = ?auto_391542 ?auto_391549 ) ) ( not ( = ?auto_391543 ?auto_391544 ) ) ( not ( = ?auto_391543 ?auto_391545 ) ) ( not ( = ?auto_391543 ?auto_391546 ) ) ( not ( = ?auto_391543 ?auto_391547 ) ) ( not ( = ?auto_391543 ?auto_391548 ) ) ( not ( = ?auto_391543 ?auto_391549 ) ) ( not ( = ?auto_391544 ?auto_391545 ) ) ( not ( = ?auto_391544 ?auto_391546 ) ) ( not ( = ?auto_391544 ?auto_391547 ) ) ( not ( = ?auto_391544 ?auto_391548 ) ) ( not ( = ?auto_391544 ?auto_391549 ) ) ( not ( = ?auto_391545 ?auto_391546 ) ) ( not ( = ?auto_391545 ?auto_391547 ) ) ( not ( = ?auto_391545 ?auto_391548 ) ) ( not ( = ?auto_391545 ?auto_391549 ) ) ( not ( = ?auto_391546 ?auto_391547 ) ) ( not ( = ?auto_391546 ?auto_391548 ) ) ( not ( = ?auto_391546 ?auto_391549 ) ) ( not ( = ?auto_391547 ?auto_391548 ) ) ( not ( = ?auto_391547 ?auto_391549 ) ) ( not ( = ?auto_391548 ?auto_391549 ) ) ( ON ?auto_391547 ?auto_391548 ) ( ON ?auto_391546 ?auto_391547 ) ( ON ?auto_391545 ?auto_391546 ) ( ON ?auto_391544 ?auto_391545 ) ( ON ?auto_391543 ?auto_391544 ) ( ON ?auto_391542 ?auto_391543 ) ( ON ?auto_391541 ?auto_391542 ) ( ON ?auto_391540 ?auto_391541 ) ( CLEAR ?auto_391538 ) ( ON ?auto_391539 ?auto_391540 ) ( CLEAR ?auto_391539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_391534 ?auto_391535 ?auto_391536 ?auto_391537 ?auto_391538 ?auto_391539 )
      ( MAKE-15PILE ?auto_391534 ?auto_391535 ?auto_391536 ?auto_391537 ?auto_391538 ?auto_391539 ?auto_391540 ?auto_391541 ?auto_391542 ?auto_391543 ?auto_391544 ?auto_391545 ?auto_391546 ?auto_391547 ?auto_391548 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391565 - BLOCK
      ?auto_391566 - BLOCK
      ?auto_391567 - BLOCK
      ?auto_391568 - BLOCK
      ?auto_391569 - BLOCK
      ?auto_391570 - BLOCK
      ?auto_391571 - BLOCK
      ?auto_391572 - BLOCK
      ?auto_391573 - BLOCK
      ?auto_391574 - BLOCK
      ?auto_391575 - BLOCK
      ?auto_391576 - BLOCK
      ?auto_391577 - BLOCK
      ?auto_391578 - BLOCK
      ?auto_391579 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391579 ) ( ON-TABLE ?auto_391565 ) ( ON ?auto_391566 ?auto_391565 ) ( ON ?auto_391567 ?auto_391566 ) ( ON ?auto_391568 ?auto_391567 ) ( ON ?auto_391569 ?auto_391568 ) ( not ( = ?auto_391565 ?auto_391566 ) ) ( not ( = ?auto_391565 ?auto_391567 ) ) ( not ( = ?auto_391565 ?auto_391568 ) ) ( not ( = ?auto_391565 ?auto_391569 ) ) ( not ( = ?auto_391565 ?auto_391570 ) ) ( not ( = ?auto_391565 ?auto_391571 ) ) ( not ( = ?auto_391565 ?auto_391572 ) ) ( not ( = ?auto_391565 ?auto_391573 ) ) ( not ( = ?auto_391565 ?auto_391574 ) ) ( not ( = ?auto_391565 ?auto_391575 ) ) ( not ( = ?auto_391565 ?auto_391576 ) ) ( not ( = ?auto_391565 ?auto_391577 ) ) ( not ( = ?auto_391565 ?auto_391578 ) ) ( not ( = ?auto_391565 ?auto_391579 ) ) ( not ( = ?auto_391566 ?auto_391567 ) ) ( not ( = ?auto_391566 ?auto_391568 ) ) ( not ( = ?auto_391566 ?auto_391569 ) ) ( not ( = ?auto_391566 ?auto_391570 ) ) ( not ( = ?auto_391566 ?auto_391571 ) ) ( not ( = ?auto_391566 ?auto_391572 ) ) ( not ( = ?auto_391566 ?auto_391573 ) ) ( not ( = ?auto_391566 ?auto_391574 ) ) ( not ( = ?auto_391566 ?auto_391575 ) ) ( not ( = ?auto_391566 ?auto_391576 ) ) ( not ( = ?auto_391566 ?auto_391577 ) ) ( not ( = ?auto_391566 ?auto_391578 ) ) ( not ( = ?auto_391566 ?auto_391579 ) ) ( not ( = ?auto_391567 ?auto_391568 ) ) ( not ( = ?auto_391567 ?auto_391569 ) ) ( not ( = ?auto_391567 ?auto_391570 ) ) ( not ( = ?auto_391567 ?auto_391571 ) ) ( not ( = ?auto_391567 ?auto_391572 ) ) ( not ( = ?auto_391567 ?auto_391573 ) ) ( not ( = ?auto_391567 ?auto_391574 ) ) ( not ( = ?auto_391567 ?auto_391575 ) ) ( not ( = ?auto_391567 ?auto_391576 ) ) ( not ( = ?auto_391567 ?auto_391577 ) ) ( not ( = ?auto_391567 ?auto_391578 ) ) ( not ( = ?auto_391567 ?auto_391579 ) ) ( not ( = ?auto_391568 ?auto_391569 ) ) ( not ( = ?auto_391568 ?auto_391570 ) ) ( not ( = ?auto_391568 ?auto_391571 ) ) ( not ( = ?auto_391568 ?auto_391572 ) ) ( not ( = ?auto_391568 ?auto_391573 ) ) ( not ( = ?auto_391568 ?auto_391574 ) ) ( not ( = ?auto_391568 ?auto_391575 ) ) ( not ( = ?auto_391568 ?auto_391576 ) ) ( not ( = ?auto_391568 ?auto_391577 ) ) ( not ( = ?auto_391568 ?auto_391578 ) ) ( not ( = ?auto_391568 ?auto_391579 ) ) ( not ( = ?auto_391569 ?auto_391570 ) ) ( not ( = ?auto_391569 ?auto_391571 ) ) ( not ( = ?auto_391569 ?auto_391572 ) ) ( not ( = ?auto_391569 ?auto_391573 ) ) ( not ( = ?auto_391569 ?auto_391574 ) ) ( not ( = ?auto_391569 ?auto_391575 ) ) ( not ( = ?auto_391569 ?auto_391576 ) ) ( not ( = ?auto_391569 ?auto_391577 ) ) ( not ( = ?auto_391569 ?auto_391578 ) ) ( not ( = ?auto_391569 ?auto_391579 ) ) ( not ( = ?auto_391570 ?auto_391571 ) ) ( not ( = ?auto_391570 ?auto_391572 ) ) ( not ( = ?auto_391570 ?auto_391573 ) ) ( not ( = ?auto_391570 ?auto_391574 ) ) ( not ( = ?auto_391570 ?auto_391575 ) ) ( not ( = ?auto_391570 ?auto_391576 ) ) ( not ( = ?auto_391570 ?auto_391577 ) ) ( not ( = ?auto_391570 ?auto_391578 ) ) ( not ( = ?auto_391570 ?auto_391579 ) ) ( not ( = ?auto_391571 ?auto_391572 ) ) ( not ( = ?auto_391571 ?auto_391573 ) ) ( not ( = ?auto_391571 ?auto_391574 ) ) ( not ( = ?auto_391571 ?auto_391575 ) ) ( not ( = ?auto_391571 ?auto_391576 ) ) ( not ( = ?auto_391571 ?auto_391577 ) ) ( not ( = ?auto_391571 ?auto_391578 ) ) ( not ( = ?auto_391571 ?auto_391579 ) ) ( not ( = ?auto_391572 ?auto_391573 ) ) ( not ( = ?auto_391572 ?auto_391574 ) ) ( not ( = ?auto_391572 ?auto_391575 ) ) ( not ( = ?auto_391572 ?auto_391576 ) ) ( not ( = ?auto_391572 ?auto_391577 ) ) ( not ( = ?auto_391572 ?auto_391578 ) ) ( not ( = ?auto_391572 ?auto_391579 ) ) ( not ( = ?auto_391573 ?auto_391574 ) ) ( not ( = ?auto_391573 ?auto_391575 ) ) ( not ( = ?auto_391573 ?auto_391576 ) ) ( not ( = ?auto_391573 ?auto_391577 ) ) ( not ( = ?auto_391573 ?auto_391578 ) ) ( not ( = ?auto_391573 ?auto_391579 ) ) ( not ( = ?auto_391574 ?auto_391575 ) ) ( not ( = ?auto_391574 ?auto_391576 ) ) ( not ( = ?auto_391574 ?auto_391577 ) ) ( not ( = ?auto_391574 ?auto_391578 ) ) ( not ( = ?auto_391574 ?auto_391579 ) ) ( not ( = ?auto_391575 ?auto_391576 ) ) ( not ( = ?auto_391575 ?auto_391577 ) ) ( not ( = ?auto_391575 ?auto_391578 ) ) ( not ( = ?auto_391575 ?auto_391579 ) ) ( not ( = ?auto_391576 ?auto_391577 ) ) ( not ( = ?auto_391576 ?auto_391578 ) ) ( not ( = ?auto_391576 ?auto_391579 ) ) ( not ( = ?auto_391577 ?auto_391578 ) ) ( not ( = ?auto_391577 ?auto_391579 ) ) ( not ( = ?auto_391578 ?auto_391579 ) ) ( ON ?auto_391578 ?auto_391579 ) ( ON ?auto_391577 ?auto_391578 ) ( ON ?auto_391576 ?auto_391577 ) ( ON ?auto_391575 ?auto_391576 ) ( ON ?auto_391574 ?auto_391575 ) ( ON ?auto_391573 ?auto_391574 ) ( ON ?auto_391572 ?auto_391573 ) ( ON ?auto_391571 ?auto_391572 ) ( CLEAR ?auto_391569 ) ( ON ?auto_391570 ?auto_391571 ) ( CLEAR ?auto_391570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_391565 ?auto_391566 ?auto_391567 ?auto_391568 ?auto_391569 ?auto_391570 )
      ( MAKE-15PILE ?auto_391565 ?auto_391566 ?auto_391567 ?auto_391568 ?auto_391569 ?auto_391570 ?auto_391571 ?auto_391572 ?auto_391573 ?auto_391574 ?auto_391575 ?auto_391576 ?auto_391577 ?auto_391578 ?auto_391579 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391595 - BLOCK
      ?auto_391596 - BLOCK
      ?auto_391597 - BLOCK
      ?auto_391598 - BLOCK
      ?auto_391599 - BLOCK
      ?auto_391600 - BLOCK
      ?auto_391601 - BLOCK
      ?auto_391602 - BLOCK
      ?auto_391603 - BLOCK
      ?auto_391604 - BLOCK
      ?auto_391605 - BLOCK
      ?auto_391606 - BLOCK
      ?auto_391607 - BLOCK
      ?auto_391608 - BLOCK
      ?auto_391609 - BLOCK
    )
    :vars
    (
      ?auto_391610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391609 ?auto_391610 ) ( ON-TABLE ?auto_391595 ) ( ON ?auto_391596 ?auto_391595 ) ( ON ?auto_391597 ?auto_391596 ) ( ON ?auto_391598 ?auto_391597 ) ( not ( = ?auto_391595 ?auto_391596 ) ) ( not ( = ?auto_391595 ?auto_391597 ) ) ( not ( = ?auto_391595 ?auto_391598 ) ) ( not ( = ?auto_391595 ?auto_391599 ) ) ( not ( = ?auto_391595 ?auto_391600 ) ) ( not ( = ?auto_391595 ?auto_391601 ) ) ( not ( = ?auto_391595 ?auto_391602 ) ) ( not ( = ?auto_391595 ?auto_391603 ) ) ( not ( = ?auto_391595 ?auto_391604 ) ) ( not ( = ?auto_391595 ?auto_391605 ) ) ( not ( = ?auto_391595 ?auto_391606 ) ) ( not ( = ?auto_391595 ?auto_391607 ) ) ( not ( = ?auto_391595 ?auto_391608 ) ) ( not ( = ?auto_391595 ?auto_391609 ) ) ( not ( = ?auto_391595 ?auto_391610 ) ) ( not ( = ?auto_391596 ?auto_391597 ) ) ( not ( = ?auto_391596 ?auto_391598 ) ) ( not ( = ?auto_391596 ?auto_391599 ) ) ( not ( = ?auto_391596 ?auto_391600 ) ) ( not ( = ?auto_391596 ?auto_391601 ) ) ( not ( = ?auto_391596 ?auto_391602 ) ) ( not ( = ?auto_391596 ?auto_391603 ) ) ( not ( = ?auto_391596 ?auto_391604 ) ) ( not ( = ?auto_391596 ?auto_391605 ) ) ( not ( = ?auto_391596 ?auto_391606 ) ) ( not ( = ?auto_391596 ?auto_391607 ) ) ( not ( = ?auto_391596 ?auto_391608 ) ) ( not ( = ?auto_391596 ?auto_391609 ) ) ( not ( = ?auto_391596 ?auto_391610 ) ) ( not ( = ?auto_391597 ?auto_391598 ) ) ( not ( = ?auto_391597 ?auto_391599 ) ) ( not ( = ?auto_391597 ?auto_391600 ) ) ( not ( = ?auto_391597 ?auto_391601 ) ) ( not ( = ?auto_391597 ?auto_391602 ) ) ( not ( = ?auto_391597 ?auto_391603 ) ) ( not ( = ?auto_391597 ?auto_391604 ) ) ( not ( = ?auto_391597 ?auto_391605 ) ) ( not ( = ?auto_391597 ?auto_391606 ) ) ( not ( = ?auto_391597 ?auto_391607 ) ) ( not ( = ?auto_391597 ?auto_391608 ) ) ( not ( = ?auto_391597 ?auto_391609 ) ) ( not ( = ?auto_391597 ?auto_391610 ) ) ( not ( = ?auto_391598 ?auto_391599 ) ) ( not ( = ?auto_391598 ?auto_391600 ) ) ( not ( = ?auto_391598 ?auto_391601 ) ) ( not ( = ?auto_391598 ?auto_391602 ) ) ( not ( = ?auto_391598 ?auto_391603 ) ) ( not ( = ?auto_391598 ?auto_391604 ) ) ( not ( = ?auto_391598 ?auto_391605 ) ) ( not ( = ?auto_391598 ?auto_391606 ) ) ( not ( = ?auto_391598 ?auto_391607 ) ) ( not ( = ?auto_391598 ?auto_391608 ) ) ( not ( = ?auto_391598 ?auto_391609 ) ) ( not ( = ?auto_391598 ?auto_391610 ) ) ( not ( = ?auto_391599 ?auto_391600 ) ) ( not ( = ?auto_391599 ?auto_391601 ) ) ( not ( = ?auto_391599 ?auto_391602 ) ) ( not ( = ?auto_391599 ?auto_391603 ) ) ( not ( = ?auto_391599 ?auto_391604 ) ) ( not ( = ?auto_391599 ?auto_391605 ) ) ( not ( = ?auto_391599 ?auto_391606 ) ) ( not ( = ?auto_391599 ?auto_391607 ) ) ( not ( = ?auto_391599 ?auto_391608 ) ) ( not ( = ?auto_391599 ?auto_391609 ) ) ( not ( = ?auto_391599 ?auto_391610 ) ) ( not ( = ?auto_391600 ?auto_391601 ) ) ( not ( = ?auto_391600 ?auto_391602 ) ) ( not ( = ?auto_391600 ?auto_391603 ) ) ( not ( = ?auto_391600 ?auto_391604 ) ) ( not ( = ?auto_391600 ?auto_391605 ) ) ( not ( = ?auto_391600 ?auto_391606 ) ) ( not ( = ?auto_391600 ?auto_391607 ) ) ( not ( = ?auto_391600 ?auto_391608 ) ) ( not ( = ?auto_391600 ?auto_391609 ) ) ( not ( = ?auto_391600 ?auto_391610 ) ) ( not ( = ?auto_391601 ?auto_391602 ) ) ( not ( = ?auto_391601 ?auto_391603 ) ) ( not ( = ?auto_391601 ?auto_391604 ) ) ( not ( = ?auto_391601 ?auto_391605 ) ) ( not ( = ?auto_391601 ?auto_391606 ) ) ( not ( = ?auto_391601 ?auto_391607 ) ) ( not ( = ?auto_391601 ?auto_391608 ) ) ( not ( = ?auto_391601 ?auto_391609 ) ) ( not ( = ?auto_391601 ?auto_391610 ) ) ( not ( = ?auto_391602 ?auto_391603 ) ) ( not ( = ?auto_391602 ?auto_391604 ) ) ( not ( = ?auto_391602 ?auto_391605 ) ) ( not ( = ?auto_391602 ?auto_391606 ) ) ( not ( = ?auto_391602 ?auto_391607 ) ) ( not ( = ?auto_391602 ?auto_391608 ) ) ( not ( = ?auto_391602 ?auto_391609 ) ) ( not ( = ?auto_391602 ?auto_391610 ) ) ( not ( = ?auto_391603 ?auto_391604 ) ) ( not ( = ?auto_391603 ?auto_391605 ) ) ( not ( = ?auto_391603 ?auto_391606 ) ) ( not ( = ?auto_391603 ?auto_391607 ) ) ( not ( = ?auto_391603 ?auto_391608 ) ) ( not ( = ?auto_391603 ?auto_391609 ) ) ( not ( = ?auto_391603 ?auto_391610 ) ) ( not ( = ?auto_391604 ?auto_391605 ) ) ( not ( = ?auto_391604 ?auto_391606 ) ) ( not ( = ?auto_391604 ?auto_391607 ) ) ( not ( = ?auto_391604 ?auto_391608 ) ) ( not ( = ?auto_391604 ?auto_391609 ) ) ( not ( = ?auto_391604 ?auto_391610 ) ) ( not ( = ?auto_391605 ?auto_391606 ) ) ( not ( = ?auto_391605 ?auto_391607 ) ) ( not ( = ?auto_391605 ?auto_391608 ) ) ( not ( = ?auto_391605 ?auto_391609 ) ) ( not ( = ?auto_391605 ?auto_391610 ) ) ( not ( = ?auto_391606 ?auto_391607 ) ) ( not ( = ?auto_391606 ?auto_391608 ) ) ( not ( = ?auto_391606 ?auto_391609 ) ) ( not ( = ?auto_391606 ?auto_391610 ) ) ( not ( = ?auto_391607 ?auto_391608 ) ) ( not ( = ?auto_391607 ?auto_391609 ) ) ( not ( = ?auto_391607 ?auto_391610 ) ) ( not ( = ?auto_391608 ?auto_391609 ) ) ( not ( = ?auto_391608 ?auto_391610 ) ) ( not ( = ?auto_391609 ?auto_391610 ) ) ( ON ?auto_391608 ?auto_391609 ) ( ON ?auto_391607 ?auto_391608 ) ( ON ?auto_391606 ?auto_391607 ) ( ON ?auto_391605 ?auto_391606 ) ( ON ?auto_391604 ?auto_391605 ) ( ON ?auto_391603 ?auto_391604 ) ( ON ?auto_391602 ?auto_391603 ) ( ON ?auto_391601 ?auto_391602 ) ( ON ?auto_391600 ?auto_391601 ) ( CLEAR ?auto_391598 ) ( ON ?auto_391599 ?auto_391600 ) ( CLEAR ?auto_391599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_391595 ?auto_391596 ?auto_391597 ?auto_391598 ?auto_391599 )
      ( MAKE-15PILE ?auto_391595 ?auto_391596 ?auto_391597 ?auto_391598 ?auto_391599 ?auto_391600 ?auto_391601 ?auto_391602 ?auto_391603 ?auto_391604 ?auto_391605 ?auto_391606 ?auto_391607 ?auto_391608 ?auto_391609 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391626 - BLOCK
      ?auto_391627 - BLOCK
      ?auto_391628 - BLOCK
      ?auto_391629 - BLOCK
      ?auto_391630 - BLOCK
      ?auto_391631 - BLOCK
      ?auto_391632 - BLOCK
      ?auto_391633 - BLOCK
      ?auto_391634 - BLOCK
      ?auto_391635 - BLOCK
      ?auto_391636 - BLOCK
      ?auto_391637 - BLOCK
      ?auto_391638 - BLOCK
      ?auto_391639 - BLOCK
      ?auto_391640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391640 ) ( ON-TABLE ?auto_391626 ) ( ON ?auto_391627 ?auto_391626 ) ( ON ?auto_391628 ?auto_391627 ) ( ON ?auto_391629 ?auto_391628 ) ( not ( = ?auto_391626 ?auto_391627 ) ) ( not ( = ?auto_391626 ?auto_391628 ) ) ( not ( = ?auto_391626 ?auto_391629 ) ) ( not ( = ?auto_391626 ?auto_391630 ) ) ( not ( = ?auto_391626 ?auto_391631 ) ) ( not ( = ?auto_391626 ?auto_391632 ) ) ( not ( = ?auto_391626 ?auto_391633 ) ) ( not ( = ?auto_391626 ?auto_391634 ) ) ( not ( = ?auto_391626 ?auto_391635 ) ) ( not ( = ?auto_391626 ?auto_391636 ) ) ( not ( = ?auto_391626 ?auto_391637 ) ) ( not ( = ?auto_391626 ?auto_391638 ) ) ( not ( = ?auto_391626 ?auto_391639 ) ) ( not ( = ?auto_391626 ?auto_391640 ) ) ( not ( = ?auto_391627 ?auto_391628 ) ) ( not ( = ?auto_391627 ?auto_391629 ) ) ( not ( = ?auto_391627 ?auto_391630 ) ) ( not ( = ?auto_391627 ?auto_391631 ) ) ( not ( = ?auto_391627 ?auto_391632 ) ) ( not ( = ?auto_391627 ?auto_391633 ) ) ( not ( = ?auto_391627 ?auto_391634 ) ) ( not ( = ?auto_391627 ?auto_391635 ) ) ( not ( = ?auto_391627 ?auto_391636 ) ) ( not ( = ?auto_391627 ?auto_391637 ) ) ( not ( = ?auto_391627 ?auto_391638 ) ) ( not ( = ?auto_391627 ?auto_391639 ) ) ( not ( = ?auto_391627 ?auto_391640 ) ) ( not ( = ?auto_391628 ?auto_391629 ) ) ( not ( = ?auto_391628 ?auto_391630 ) ) ( not ( = ?auto_391628 ?auto_391631 ) ) ( not ( = ?auto_391628 ?auto_391632 ) ) ( not ( = ?auto_391628 ?auto_391633 ) ) ( not ( = ?auto_391628 ?auto_391634 ) ) ( not ( = ?auto_391628 ?auto_391635 ) ) ( not ( = ?auto_391628 ?auto_391636 ) ) ( not ( = ?auto_391628 ?auto_391637 ) ) ( not ( = ?auto_391628 ?auto_391638 ) ) ( not ( = ?auto_391628 ?auto_391639 ) ) ( not ( = ?auto_391628 ?auto_391640 ) ) ( not ( = ?auto_391629 ?auto_391630 ) ) ( not ( = ?auto_391629 ?auto_391631 ) ) ( not ( = ?auto_391629 ?auto_391632 ) ) ( not ( = ?auto_391629 ?auto_391633 ) ) ( not ( = ?auto_391629 ?auto_391634 ) ) ( not ( = ?auto_391629 ?auto_391635 ) ) ( not ( = ?auto_391629 ?auto_391636 ) ) ( not ( = ?auto_391629 ?auto_391637 ) ) ( not ( = ?auto_391629 ?auto_391638 ) ) ( not ( = ?auto_391629 ?auto_391639 ) ) ( not ( = ?auto_391629 ?auto_391640 ) ) ( not ( = ?auto_391630 ?auto_391631 ) ) ( not ( = ?auto_391630 ?auto_391632 ) ) ( not ( = ?auto_391630 ?auto_391633 ) ) ( not ( = ?auto_391630 ?auto_391634 ) ) ( not ( = ?auto_391630 ?auto_391635 ) ) ( not ( = ?auto_391630 ?auto_391636 ) ) ( not ( = ?auto_391630 ?auto_391637 ) ) ( not ( = ?auto_391630 ?auto_391638 ) ) ( not ( = ?auto_391630 ?auto_391639 ) ) ( not ( = ?auto_391630 ?auto_391640 ) ) ( not ( = ?auto_391631 ?auto_391632 ) ) ( not ( = ?auto_391631 ?auto_391633 ) ) ( not ( = ?auto_391631 ?auto_391634 ) ) ( not ( = ?auto_391631 ?auto_391635 ) ) ( not ( = ?auto_391631 ?auto_391636 ) ) ( not ( = ?auto_391631 ?auto_391637 ) ) ( not ( = ?auto_391631 ?auto_391638 ) ) ( not ( = ?auto_391631 ?auto_391639 ) ) ( not ( = ?auto_391631 ?auto_391640 ) ) ( not ( = ?auto_391632 ?auto_391633 ) ) ( not ( = ?auto_391632 ?auto_391634 ) ) ( not ( = ?auto_391632 ?auto_391635 ) ) ( not ( = ?auto_391632 ?auto_391636 ) ) ( not ( = ?auto_391632 ?auto_391637 ) ) ( not ( = ?auto_391632 ?auto_391638 ) ) ( not ( = ?auto_391632 ?auto_391639 ) ) ( not ( = ?auto_391632 ?auto_391640 ) ) ( not ( = ?auto_391633 ?auto_391634 ) ) ( not ( = ?auto_391633 ?auto_391635 ) ) ( not ( = ?auto_391633 ?auto_391636 ) ) ( not ( = ?auto_391633 ?auto_391637 ) ) ( not ( = ?auto_391633 ?auto_391638 ) ) ( not ( = ?auto_391633 ?auto_391639 ) ) ( not ( = ?auto_391633 ?auto_391640 ) ) ( not ( = ?auto_391634 ?auto_391635 ) ) ( not ( = ?auto_391634 ?auto_391636 ) ) ( not ( = ?auto_391634 ?auto_391637 ) ) ( not ( = ?auto_391634 ?auto_391638 ) ) ( not ( = ?auto_391634 ?auto_391639 ) ) ( not ( = ?auto_391634 ?auto_391640 ) ) ( not ( = ?auto_391635 ?auto_391636 ) ) ( not ( = ?auto_391635 ?auto_391637 ) ) ( not ( = ?auto_391635 ?auto_391638 ) ) ( not ( = ?auto_391635 ?auto_391639 ) ) ( not ( = ?auto_391635 ?auto_391640 ) ) ( not ( = ?auto_391636 ?auto_391637 ) ) ( not ( = ?auto_391636 ?auto_391638 ) ) ( not ( = ?auto_391636 ?auto_391639 ) ) ( not ( = ?auto_391636 ?auto_391640 ) ) ( not ( = ?auto_391637 ?auto_391638 ) ) ( not ( = ?auto_391637 ?auto_391639 ) ) ( not ( = ?auto_391637 ?auto_391640 ) ) ( not ( = ?auto_391638 ?auto_391639 ) ) ( not ( = ?auto_391638 ?auto_391640 ) ) ( not ( = ?auto_391639 ?auto_391640 ) ) ( ON ?auto_391639 ?auto_391640 ) ( ON ?auto_391638 ?auto_391639 ) ( ON ?auto_391637 ?auto_391638 ) ( ON ?auto_391636 ?auto_391637 ) ( ON ?auto_391635 ?auto_391636 ) ( ON ?auto_391634 ?auto_391635 ) ( ON ?auto_391633 ?auto_391634 ) ( ON ?auto_391632 ?auto_391633 ) ( ON ?auto_391631 ?auto_391632 ) ( CLEAR ?auto_391629 ) ( ON ?auto_391630 ?auto_391631 ) ( CLEAR ?auto_391630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_391626 ?auto_391627 ?auto_391628 ?auto_391629 ?auto_391630 )
      ( MAKE-15PILE ?auto_391626 ?auto_391627 ?auto_391628 ?auto_391629 ?auto_391630 ?auto_391631 ?auto_391632 ?auto_391633 ?auto_391634 ?auto_391635 ?auto_391636 ?auto_391637 ?auto_391638 ?auto_391639 ?auto_391640 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391656 - BLOCK
      ?auto_391657 - BLOCK
      ?auto_391658 - BLOCK
      ?auto_391659 - BLOCK
      ?auto_391660 - BLOCK
      ?auto_391661 - BLOCK
      ?auto_391662 - BLOCK
      ?auto_391663 - BLOCK
      ?auto_391664 - BLOCK
      ?auto_391665 - BLOCK
      ?auto_391666 - BLOCK
      ?auto_391667 - BLOCK
      ?auto_391668 - BLOCK
      ?auto_391669 - BLOCK
      ?auto_391670 - BLOCK
    )
    :vars
    (
      ?auto_391671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391670 ?auto_391671 ) ( ON-TABLE ?auto_391656 ) ( ON ?auto_391657 ?auto_391656 ) ( ON ?auto_391658 ?auto_391657 ) ( not ( = ?auto_391656 ?auto_391657 ) ) ( not ( = ?auto_391656 ?auto_391658 ) ) ( not ( = ?auto_391656 ?auto_391659 ) ) ( not ( = ?auto_391656 ?auto_391660 ) ) ( not ( = ?auto_391656 ?auto_391661 ) ) ( not ( = ?auto_391656 ?auto_391662 ) ) ( not ( = ?auto_391656 ?auto_391663 ) ) ( not ( = ?auto_391656 ?auto_391664 ) ) ( not ( = ?auto_391656 ?auto_391665 ) ) ( not ( = ?auto_391656 ?auto_391666 ) ) ( not ( = ?auto_391656 ?auto_391667 ) ) ( not ( = ?auto_391656 ?auto_391668 ) ) ( not ( = ?auto_391656 ?auto_391669 ) ) ( not ( = ?auto_391656 ?auto_391670 ) ) ( not ( = ?auto_391656 ?auto_391671 ) ) ( not ( = ?auto_391657 ?auto_391658 ) ) ( not ( = ?auto_391657 ?auto_391659 ) ) ( not ( = ?auto_391657 ?auto_391660 ) ) ( not ( = ?auto_391657 ?auto_391661 ) ) ( not ( = ?auto_391657 ?auto_391662 ) ) ( not ( = ?auto_391657 ?auto_391663 ) ) ( not ( = ?auto_391657 ?auto_391664 ) ) ( not ( = ?auto_391657 ?auto_391665 ) ) ( not ( = ?auto_391657 ?auto_391666 ) ) ( not ( = ?auto_391657 ?auto_391667 ) ) ( not ( = ?auto_391657 ?auto_391668 ) ) ( not ( = ?auto_391657 ?auto_391669 ) ) ( not ( = ?auto_391657 ?auto_391670 ) ) ( not ( = ?auto_391657 ?auto_391671 ) ) ( not ( = ?auto_391658 ?auto_391659 ) ) ( not ( = ?auto_391658 ?auto_391660 ) ) ( not ( = ?auto_391658 ?auto_391661 ) ) ( not ( = ?auto_391658 ?auto_391662 ) ) ( not ( = ?auto_391658 ?auto_391663 ) ) ( not ( = ?auto_391658 ?auto_391664 ) ) ( not ( = ?auto_391658 ?auto_391665 ) ) ( not ( = ?auto_391658 ?auto_391666 ) ) ( not ( = ?auto_391658 ?auto_391667 ) ) ( not ( = ?auto_391658 ?auto_391668 ) ) ( not ( = ?auto_391658 ?auto_391669 ) ) ( not ( = ?auto_391658 ?auto_391670 ) ) ( not ( = ?auto_391658 ?auto_391671 ) ) ( not ( = ?auto_391659 ?auto_391660 ) ) ( not ( = ?auto_391659 ?auto_391661 ) ) ( not ( = ?auto_391659 ?auto_391662 ) ) ( not ( = ?auto_391659 ?auto_391663 ) ) ( not ( = ?auto_391659 ?auto_391664 ) ) ( not ( = ?auto_391659 ?auto_391665 ) ) ( not ( = ?auto_391659 ?auto_391666 ) ) ( not ( = ?auto_391659 ?auto_391667 ) ) ( not ( = ?auto_391659 ?auto_391668 ) ) ( not ( = ?auto_391659 ?auto_391669 ) ) ( not ( = ?auto_391659 ?auto_391670 ) ) ( not ( = ?auto_391659 ?auto_391671 ) ) ( not ( = ?auto_391660 ?auto_391661 ) ) ( not ( = ?auto_391660 ?auto_391662 ) ) ( not ( = ?auto_391660 ?auto_391663 ) ) ( not ( = ?auto_391660 ?auto_391664 ) ) ( not ( = ?auto_391660 ?auto_391665 ) ) ( not ( = ?auto_391660 ?auto_391666 ) ) ( not ( = ?auto_391660 ?auto_391667 ) ) ( not ( = ?auto_391660 ?auto_391668 ) ) ( not ( = ?auto_391660 ?auto_391669 ) ) ( not ( = ?auto_391660 ?auto_391670 ) ) ( not ( = ?auto_391660 ?auto_391671 ) ) ( not ( = ?auto_391661 ?auto_391662 ) ) ( not ( = ?auto_391661 ?auto_391663 ) ) ( not ( = ?auto_391661 ?auto_391664 ) ) ( not ( = ?auto_391661 ?auto_391665 ) ) ( not ( = ?auto_391661 ?auto_391666 ) ) ( not ( = ?auto_391661 ?auto_391667 ) ) ( not ( = ?auto_391661 ?auto_391668 ) ) ( not ( = ?auto_391661 ?auto_391669 ) ) ( not ( = ?auto_391661 ?auto_391670 ) ) ( not ( = ?auto_391661 ?auto_391671 ) ) ( not ( = ?auto_391662 ?auto_391663 ) ) ( not ( = ?auto_391662 ?auto_391664 ) ) ( not ( = ?auto_391662 ?auto_391665 ) ) ( not ( = ?auto_391662 ?auto_391666 ) ) ( not ( = ?auto_391662 ?auto_391667 ) ) ( not ( = ?auto_391662 ?auto_391668 ) ) ( not ( = ?auto_391662 ?auto_391669 ) ) ( not ( = ?auto_391662 ?auto_391670 ) ) ( not ( = ?auto_391662 ?auto_391671 ) ) ( not ( = ?auto_391663 ?auto_391664 ) ) ( not ( = ?auto_391663 ?auto_391665 ) ) ( not ( = ?auto_391663 ?auto_391666 ) ) ( not ( = ?auto_391663 ?auto_391667 ) ) ( not ( = ?auto_391663 ?auto_391668 ) ) ( not ( = ?auto_391663 ?auto_391669 ) ) ( not ( = ?auto_391663 ?auto_391670 ) ) ( not ( = ?auto_391663 ?auto_391671 ) ) ( not ( = ?auto_391664 ?auto_391665 ) ) ( not ( = ?auto_391664 ?auto_391666 ) ) ( not ( = ?auto_391664 ?auto_391667 ) ) ( not ( = ?auto_391664 ?auto_391668 ) ) ( not ( = ?auto_391664 ?auto_391669 ) ) ( not ( = ?auto_391664 ?auto_391670 ) ) ( not ( = ?auto_391664 ?auto_391671 ) ) ( not ( = ?auto_391665 ?auto_391666 ) ) ( not ( = ?auto_391665 ?auto_391667 ) ) ( not ( = ?auto_391665 ?auto_391668 ) ) ( not ( = ?auto_391665 ?auto_391669 ) ) ( not ( = ?auto_391665 ?auto_391670 ) ) ( not ( = ?auto_391665 ?auto_391671 ) ) ( not ( = ?auto_391666 ?auto_391667 ) ) ( not ( = ?auto_391666 ?auto_391668 ) ) ( not ( = ?auto_391666 ?auto_391669 ) ) ( not ( = ?auto_391666 ?auto_391670 ) ) ( not ( = ?auto_391666 ?auto_391671 ) ) ( not ( = ?auto_391667 ?auto_391668 ) ) ( not ( = ?auto_391667 ?auto_391669 ) ) ( not ( = ?auto_391667 ?auto_391670 ) ) ( not ( = ?auto_391667 ?auto_391671 ) ) ( not ( = ?auto_391668 ?auto_391669 ) ) ( not ( = ?auto_391668 ?auto_391670 ) ) ( not ( = ?auto_391668 ?auto_391671 ) ) ( not ( = ?auto_391669 ?auto_391670 ) ) ( not ( = ?auto_391669 ?auto_391671 ) ) ( not ( = ?auto_391670 ?auto_391671 ) ) ( ON ?auto_391669 ?auto_391670 ) ( ON ?auto_391668 ?auto_391669 ) ( ON ?auto_391667 ?auto_391668 ) ( ON ?auto_391666 ?auto_391667 ) ( ON ?auto_391665 ?auto_391666 ) ( ON ?auto_391664 ?auto_391665 ) ( ON ?auto_391663 ?auto_391664 ) ( ON ?auto_391662 ?auto_391663 ) ( ON ?auto_391661 ?auto_391662 ) ( ON ?auto_391660 ?auto_391661 ) ( CLEAR ?auto_391658 ) ( ON ?auto_391659 ?auto_391660 ) ( CLEAR ?auto_391659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_391656 ?auto_391657 ?auto_391658 ?auto_391659 )
      ( MAKE-15PILE ?auto_391656 ?auto_391657 ?auto_391658 ?auto_391659 ?auto_391660 ?auto_391661 ?auto_391662 ?auto_391663 ?auto_391664 ?auto_391665 ?auto_391666 ?auto_391667 ?auto_391668 ?auto_391669 ?auto_391670 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391687 - BLOCK
      ?auto_391688 - BLOCK
      ?auto_391689 - BLOCK
      ?auto_391690 - BLOCK
      ?auto_391691 - BLOCK
      ?auto_391692 - BLOCK
      ?auto_391693 - BLOCK
      ?auto_391694 - BLOCK
      ?auto_391695 - BLOCK
      ?auto_391696 - BLOCK
      ?auto_391697 - BLOCK
      ?auto_391698 - BLOCK
      ?auto_391699 - BLOCK
      ?auto_391700 - BLOCK
      ?auto_391701 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391701 ) ( ON-TABLE ?auto_391687 ) ( ON ?auto_391688 ?auto_391687 ) ( ON ?auto_391689 ?auto_391688 ) ( not ( = ?auto_391687 ?auto_391688 ) ) ( not ( = ?auto_391687 ?auto_391689 ) ) ( not ( = ?auto_391687 ?auto_391690 ) ) ( not ( = ?auto_391687 ?auto_391691 ) ) ( not ( = ?auto_391687 ?auto_391692 ) ) ( not ( = ?auto_391687 ?auto_391693 ) ) ( not ( = ?auto_391687 ?auto_391694 ) ) ( not ( = ?auto_391687 ?auto_391695 ) ) ( not ( = ?auto_391687 ?auto_391696 ) ) ( not ( = ?auto_391687 ?auto_391697 ) ) ( not ( = ?auto_391687 ?auto_391698 ) ) ( not ( = ?auto_391687 ?auto_391699 ) ) ( not ( = ?auto_391687 ?auto_391700 ) ) ( not ( = ?auto_391687 ?auto_391701 ) ) ( not ( = ?auto_391688 ?auto_391689 ) ) ( not ( = ?auto_391688 ?auto_391690 ) ) ( not ( = ?auto_391688 ?auto_391691 ) ) ( not ( = ?auto_391688 ?auto_391692 ) ) ( not ( = ?auto_391688 ?auto_391693 ) ) ( not ( = ?auto_391688 ?auto_391694 ) ) ( not ( = ?auto_391688 ?auto_391695 ) ) ( not ( = ?auto_391688 ?auto_391696 ) ) ( not ( = ?auto_391688 ?auto_391697 ) ) ( not ( = ?auto_391688 ?auto_391698 ) ) ( not ( = ?auto_391688 ?auto_391699 ) ) ( not ( = ?auto_391688 ?auto_391700 ) ) ( not ( = ?auto_391688 ?auto_391701 ) ) ( not ( = ?auto_391689 ?auto_391690 ) ) ( not ( = ?auto_391689 ?auto_391691 ) ) ( not ( = ?auto_391689 ?auto_391692 ) ) ( not ( = ?auto_391689 ?auto_391693 ) ) ( not ( = ?auto_391689 ?auto_391694 ) ) ( not ( = ?auto_391689 ?auto_391695 ) ) ( not ( = ?auto_391689 ?auto_391696 ) ) ( not ( = ?auto_391689 ?auto_391697 ) ) ( not ( = ?auto_391689 ?auto_391698 ) ) ( not ( = ?auto_391689 ?auto_391699 ) ) ( not ( = ?auto_391689 ?auto_391700 ) ) ( not ( = ?auto_391689 ?auto_391701 ) ) ( not ( = ?auto_391690 ?auto_391691 ) ) ( not ( = ?auto_391690 ?auto_391692 ) ) ( not ( = ?auto_391690 ?auto_391693 ) ) ( not ( = ?auto_391690 ?auto_391694 ) ) ( not ( = ?auto_391690 ?auto_391695 ) ) ( not ( = ?auto_391690 ?auto_391696 ) ) ( not ( = ?auto_391690 ?auto_391697 ) ) ( not ( = ?auto_391690 ?auto_391698 ) ) ( not ( = ?auto_391690 ?auto_391699 ) ) ( not ( = ?auto_391690 ?auto_391700 ) ) ( not ( = ?auto_391690 ?auto_391701 ) ) ( not ( = ?auto_391691 ?auto_391692 ) ) ( not ( = ?auto_391691 ?auto_391693 ) ) ( not ( = ?auto_391691 ?auto_391694 ) ) ( not ( = ?auto_391691 ?auto_391695 ) ) ( not ( = ?auto_391691 ?auto_391696 ) ) ( not ( = ?auto_391691 ?auto_391697 ) ) ( not ( = ?auto_391691 ?auto_391698 ) ) ( not ( = ?auto_391691 ?auto_391699 ) ) ( not ( = ?auto_391691 ?auto_391700 ) ) ( not ( = ?auto_391691 ?auto_391701 ) ) ( not ( = ?auto_391692 ?auto_391693 ) ) ( not ( = ?auto_391692 ?auto_391694 ) ) ( not ( = ?auto_391692 ?auto_391695 ) ) ( not ( = ?auto_391692 ?auto_391696 ) ) ( not ( = ?auto_391692 ?auto_391697 ) ) ( not ( = ?auto_391692 ?auto_391698 ) ) ( not ( = ?auto_391692 ?auto_391699 ) ) ( not ( = ?auto_391692 ?auto_391700 ) ) ( not ( = ?auto_391692 ?auto_391701 ) ) ( not ( = ?auto_391693 ?auto_391694 ) ) ( not ( = ?auto_391693 ?auto_391695 ) ) ( not ( = ?auto_391693 ?auto_391696 ) ) ( not ( = ?auto_391693 ?auto_391697 ) ) ( not ( = ?auto_391693 ?auto_391698 ) ) ( not ( = ?auto_391693 ?auto_391699 ) ) ( not ( = ?auto_391693 ?auto_391700 ) ) ( not ( = ?auto_391693 ?auto_391701 ) ) ( not ( = ?auto_391694 ?auto_391695 ) ) ( not ( = ?auto_391694 ?auto_391696 ) ) ( not ( = ?auto_391694 ?auto_391697 ) ) ( not ( = ?auto_391694 ?auto_391698 ) ) ( not ( = ?auto_391694 ?auto_391699 ) ) ( not ( = ?auto_391694 ?auto_391700 ) ) ( not ( = ?auto_391694 ?auto_391701 ) ) ( not ( = ?auto_391695 ?auto_391696 ) ) ( not ( = ?auto_391695 ?auto_391697 ) ) ( not ( = ?auto_391695 ?auto_391698 ) ) ( not ( = ?auto_391695 ?auto_391699 ) ) ( not ( = ?auto_391695 ?auto_391700 ) ) ( not ( = ?auto_391695 ?auto_391701 ) ) ( not ( = ?auto_391696 ?auto_391697 ) ) ( not ( = ?auto_391696 ?auto_391698 ) ) ( not ( = ?auto_391696 ?auto_391699 ) ) ( not ( = ?auto_391696 ?auto_391700 ) ) ( not ( = ?auto_391696 ?auto_391701 ) ) ( not ( = ?auto_391697 ?auto_391698 ) ) ( not ( = ?auto_391697 ?auto_391699 ) ) ( not ( = ?auto_391697 ?auto_391700 ) ) ( not ( = ?auto_391697 ?auto_391701 ) ) ( not ( = ?auto_391698 ?auto_391699 ) ) ( not ( = ?auto_391698 ?auto_391700 ) ) ( not ( = ?auto_391698 ?auto_391701 ) ) ( not ( = ?auto_391699 ?auto_391700 ) ) ( not ( = ?auto_391699 ?auto_391701 ) ) ( not ( = ?auto_391700 ?auto_391701 ) ) ( ON ?auto_391700 ?auto_391701 ) ( ON ?auto_391699 ?auto_391700 ) ( ON ?auto_391698 ?auto_391699 ) ( ON ?auto_391697 ?auto_391698 ) ( ON ?auto_391696 ?auto_391697 ) ( ON ?auto_391695 ?auto_391696 ) ( ON ?auto_391694 ?auto_391695 ) ( ON ?auto_391693 ?auto_391694 ) ( ON ?auto_391692 ?auto_391693 ) ( ON ?auto_391691 ?auto_391692 ) ( CLEAR ?auto_391689 ) ( ON ?auto_391690 ?auto_391691 ) ( CLEAR ?auto_391690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_391687 ?auto_391688 ?auto_391689 ?auto_391690 )
      ( MAKE-15PILE ?auto_391687 ?auto_391688 ?auto_391689 ?auto_391690 ?auto_391691 ?auto_391692 ?auto_391693 ?auto_391694 ?auto_391695 ?auto_391696 ?auto_391697 ?auto_391698 ?auto_391699 ?auto_391700 ?auto_391701 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391717 - BLOCK
      ?auto_391718 - BLOCK
      ?auto_391719 - BLOCK
      ?auto_391720 - BLOCK
      ?auto_391721 - BLOCK
      ?auto_391722 - BLOCK
      ?auto_391723 - BLOCK
      ?auto_391724 - BLOCK
      ?auto_391725 - BLOCK
      ?auto_391726 - BLOCK
      ?auto_391727 - BLOCK
      ?auto_391728 - BLOCK
      ?auto_391729 - BLOCK
      ?auto_391730 - BLOCK
      ?auto_391731 - BLOCK
    )
    :vars
    (
      ?auto_391732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391731 ?auto_391732 ) ( ON-TABLE ?auto_391717 ) ( ON ?auto_391718 ?auto_391717 ) ( not ( = ?auto_391717 ?auto_391718 ) ) ( not ( = ?auto_391717 ?auto_391719 ) ) ( not ( = ?auto_391717 ?auto_391720 ) ) ( not ( = ?auto_391717 ?auto_391721 ) ) ( not ( = ?auto_391717 ?auto_391722 ) ) ( not ( = ?auto_391717 ?auto_391723 ) ) ( not ( = ?auto_391717 ?auto_391724 ) ) ( not ( = ?auto_391717 ?auto_391725 ) ) ( not ( = ?auto_391717 ?auto_391726 ) ) ( not ( = ?auto_391717 ?auto_391727 ) ) ( not ( = ?auto_391717 ?auto_391728 ) ) ( not ( = ?auto_391717 ?auto_391729 ) ) ( not ( = ?auto_391717 ?auto_391730 ) ) ( not ( = ?auto_391717 ?auto_391731 ) ) ( not ( = ?auto_391717 ?auto_391732 ) ) ( not ( = ?auto_391718 ?auto_391719 ) ) ( not ( = ?auto_391718 ?auto_391720 ) ) ( not ( = ?auto_391718 ?auto_391721 ) ) ( not ( = ?auto_391718 ?auto_391722 ) ) ( not ( = ?auto_391718 ?auto_391723 ) ) ( not ( = ?auto_391718 ?auto_391724 ) ) ( not ( = ?auto_391718 ?auto_391725 ) ) ( not ( = ?auto_391718 ?auto_391726 ) ) ( not ( = ?auto_391718 ?auto_391727 ) ) ( not ( = ?auto_391718 ?auto_391728 ) ) ( not ( = ?auto_391718 ?auto_391729 ) ) ( not ( = ?auto_391718 ?auto_391730 ) ) ( not ( = ?auto_391718 ?auto_391731 ) ) ( not ( = ?auto_391718 ?auto_391732 ) ) ( not ( = ?auto_391719 ?auto_391720 ) ) ( not ( = ?auto_391719 ?auto_391721 ) ) ( not ( = ?auto_391719 ?auto_391722 ) ) ( not ( = ?auto_391719 ?auto_391723 ) ) ( not ( = ?auto_391719 ?auto_391724 ) ) ( not ( = ?auto_391719 ?auto_391725 ) ) ( not ( = ?auto_391719 ?auto_391726 ) ) ( not ( = ?auto_391719 ?auto_391727 ) ) ( not ( = ?auto_391719 ?auto_391728 ) ) ( not ( = ?auto_391719 ?auto_391729 ) ) ( not ( = ?auto_391719 ?auto_391730 ) ) ( not ( = ?auto_391719 ?auto_391731 ) ) ( not ( = ?auto_391719 ?auto_391732 ) ) ( not ( = ?auto_391720 ?auto_391721 ) ) ( not ( = ?auto_391720 ?auto_391722 ) ) ( not ( = ?auto_391720 ?auto_391723 ) ) ( not ( = ?auto_391720 ?auto_391724 ) ) ( not ( = ?auto_391720 ?auto_391725 ) ) ( not ( = ?auto_391720 ?auto_391726 ) ) ( not ( = ?auto_391720 ?auto_391727 ) ) ( not ( = ?auto_391720 ?auto_391728 ) ) ( not ( = ?auto_391720 ?auto_391729 ) ) ( not ( = ?auto_391720 ?auto_391730 ) ) ( not ( = ?auto_391720 ?auto_391731 ) ) ( not ( = ?auto_391720 ?auto_391732 ) ) ( not ( = ?auto_391721 ?auto_391722 ) ) ( not ( = ?auto_391721 ?auto_391723 ) ) ( not ( = ?auto_391721 ?auto_391724 ) ) ( not ( = ?auto_391721 ?auto_391725 ) ) ( not ( = ?auto_391721 ?auto_391726 ) ) ( not ( = ?auto_391721 ?auto_391727 ) ) ( not ( = ?auto_391721 ?auto_391728 ) ) ( not ( = ?auto_391721 ?auto_391729 ) ) ( not ( = ?auto_391721 ?auto_391730 ) ) ( not ( = ?auto_391721 ?auto_391731 ) ) ( not ( = ?auto_391721 ?auto_391732 ) ) ( not ( = ?auto_391722 ?auto_391723 ) ) ( not ( = ?auto_391722 ?auto_391724 ) ) ( not ( = ?auto_391722 ?auto_391725 ) ) ( not ( = ?auto_391722 ?auto_391726 ) ) ( not ( = ?auto_391722 ?auto_391727 ) ) ( not ( = ?auto_391722 ?auto_391728 ) ) ( not ( = ?auto_391722 ?auto_391729 ) ) ( not ( = ?auto_391722 ?auto_391730 ) ) ( not ( = ?auto_391722 ?auto_391731 ) ) ( not ( = ?auto_391722 ?auto_391732 ) ) ( not ( = ?auto_391723 ?auto_391724 ) ) ( not ( = ?auto_391723 ?auto_391725 ) ) ( not ( = ?auto_391723 ?auto_391726 ) ) ( not ( = ?auto_391723 ?auto_391727 ) ) ( not ( = ?auto_391723 ?auto_391728 ) ) ( not ( = ?auto_391723 ?auto_391729 ) ) ( not ( = ?auto_391723 ?auto_391730 ) ) ( not ( = ?auto_391723 ?auto_391731 ) ) ( not ( = ?auto_391723 ?auto_391732 ) ) ( not ( = ?auto_391724 ?auto_391725 ) ) ( not ( = ?auto_391724 ?auto_391726 ) ) ( not ( = ?auto_391724 ?auto_391727 ) ) ( not ( = ?auto_391724 ?auto_391728 ) ) ( not ( = ?auto_391724 ?auto_391729 ) ) ( not ( = ?auto_391724 ?auto_391730 ) ) ( not ( = ?auto_391724 ?auto_391731 ) ) ( not ( = ?auto_391724 ?auto_391732 ) ) ( not ( = ?auto_391725 ?auto_391726 ) ) ( not ( = ?auto_391725 ?auto_391727 ) ) ( not ( = ?auto_391725 ?auto_391728 ) ) ( not ( = ?auto_391725 ?auto_391729 ) ) ( not ( = ?auto_391725 ?auto_391730 ) ) ( not ( = ?auto_391725 ?auto_391731 ) ) ( not ( = ?auto_391725 ?auto_391732 ) ) ( not ( = ?auto_391726 ?auto_391727 ) ) ( not ( = ?auto_391726 ?auto_391728 ) ) ( not ( = ?auto_391726 ?auto_391729 ) ) ( not ( = ?auto_391726 ?auto_391730 ) ) ( not ( = ?auto_391726 ?auto_391731 ) ) ( not ( = ?auto_391726 ?auto_391732 ) ) ( not ( = ?auto_391727 ?auto_391728 ) ) ( not ( = ?auto_391727 ?auto_391729 ) ) ( not ( = ?auto_391727 ?auto_391730 ) ) ( not ( = ?auto_391727 ?auto_391731 ) ) ( not ( = ?auto_391727 ?auto_391732 ) ) ( not ( = ?auto_391728 ?auto_391729 ) ) ( not ( = ?auto_391728 ?auto_391730 ) ) ( not ( = ?auto_391728 ?auto_391731 ) ) ( not ( = ?auto_391728 ?auto_391732 ) ) ( not ( = ?auto_391729 ?auto_391730 ) ) ( not ( = ?auto_391729 ?auto_391731 ) ) ( not ( = ?auto_391729 ?auto_391732 ) ) ( not ( = ?auto_391730 ?auto_391731 ) ) ( not ( = ?auto_391730 ?auto_391732 ) ) ( not ( = ?auto_391731 ?auto_391732 ) ) ( ON ?auto_391730 ?auto_391731 ) ( ON ?auto_391729 ?auto_391730 ) ( ON ?auto_391728 ?auto_391729 ) ( ON ?auto_391727 ?auto_391728 ) ( ON ?auto_391726 ?auto_391727 ) ( ON ?auto_391725 ?auto_391726 ) ( ON ?auto_391724 ?auto_391725 ) ( ON ?auto_391723 ?auto_391724 ) ( ON ?auto_391722 ?auto_391723 ) ( ON ?auto_391721 ?auto_391722 ) ( ON ?auto_391720 ?auto_391721 ) ( CLEAR ?auto_391718 ) ( ON ?auto_391719 ?auto_391720 ) ( CLEAR ?auto_391719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_391717 ?auto_391718 ?auto_391719 )
      ( MAKE-15PILE ?auto_391717 ?auto_391718 ?auto_391719 ?auto_391720 ?auto_391721 ?auto_391722 ?auto_391723 ?auto_391724 ?auto_391725 ?auto_391726 ?auto_391727 ?auto_391728 ?auto_391729 ?auto_391730 ?auto_391731 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391748 - BLOCK
      ?auto_391749 - BLOCK
      ?auto_391750 - BLOCK
      ?auto_391751 - BLOCK
      ?auto_391752 - BLOCK
      ?auto_391753 - BLOCK
      ?auto_391754 - BLOCK
      ?auto_391755 - BLOCK
      ?auto_391756 - BLOCK
      ?auto_391757 - BLOCK
      ?auto_391758 - BLOCK
      ?auto_391759 - BLOCK
      ?auto_391760 - BLOCK
      ?auto_391761 - BLOCK
      ?auto_391762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391762 ) ( ON-TABLE ?auto_391748 ) ( ON ?auto_391749 ?auto_391748 ) ( not ( = ?auto_391748 ?auto_391749 ) ) ( not ( = ?auto_391748 ?auto_391750 ) ) ( not ( = ?auto_391748 ?auto_391751 ) ) ( not ( = ?auto_391748 ?auto_391752 ) ) ( not ( = ?auto_391748 ?auto_391753 ) ) ( not ( = ?auto_391748 ?auto_391754 ) ) ( not ( = ?auto_391748 ?auto_391755 ) ) ( not ( = ?auto_391748 ?auto_391756 ) ) ( not ( = ?auto_391748 ?auto_391757 ) ) ( not ( = ?auto_391748 ?auto_391758 ) ) ( not ( = ?auto_391748 ?auto_391759 ) ) ( not ( = ?auto_391748 ?auto_391760 ) ) ( not ( = ?auto_391748 ?auto_391761 ) ) ( not ( = ?auto_391748 ?auto_391762 ) ) ( not ( = ?auto_391749 ?auto_391750 ) ) ( not ( = ?auto_391749 ?auto_391751 ) ) ( not ( = ?auto_391749 ?auto_391752 ) ) ( not ( = ?auto_391749 ?auto_391753 ) ) ( not ( = ?auto_391749 ?auto_391754 ) ) ( not ( = ?auto_391749 ?auto_391755 ) ) ( not ( = ?auto_391749 ?auto_391756 ) ) ( not ( = ?auto_391749 ?auto_391757 ) ) ( not ( = ?auto_391749 ?auto_391758 ) ) ( not ( = ?auto_391749 ?auto_391759 ) ) ( not ( = ?auto_391749 ?auto_391760 ) ) ( not ( = ?auto_391749 ?auto_391761 ) ) ( not ( = ?auto_391749 ?auto_391762 ) ) ( not ( = ?auto_391750 ?auto_391751 ) ) ( not ( = ?auto_391750 ?auto_391752 ) ) ( not ( = ?auto_391750 ?auto_391753 ) ) ( not ( = ?auto_391750 ?auto_391754 ) ) ( not ( = ?auto_391750 ?auto_391755 ) ) ( not ( = ?auto_391750 ?auto_391756 ) ) ( not ( = ?auto_391750 ?auto_391757 ) ) ( not ( = ?auto_391750 ?auto_391758 ) ) ( not ( = ?auto_391750 ?auto_391759 ) ) ( not ( = ?auto_391750 ?auto_391760 ) ) ( not ( = ?auto_391750 ?auto_391761 ) ) ( not ( = ?auto_391750 ?auto_391762 ) ) ( not ( = ?auto_391751 ?auto_391752 ) ) ( not ( = ?auto_391751 ?auto_391753 ) ) ( not ( = ?auto_391751 ?auto_391754 ) ) ( not ( = ?auto_391751 ?auto_391755 ) ) ( not ( = ?auto_391751 ?auto_391756 ) ) ( not ( = ?auto_391751 ?auto_391757 ) ) ( not ( = ?auto_391751 ?auto_391758 ) ) ( not ( = ?auto_391751 ?auto_391759 ) ) ( not ( = ?auto_391751 ?auto_391760 ) ) ( not ( = ?auto_391751 ?auto_391761 ) ) ( not ( = ?auto_391751 ?auto_391762 ) ) ( not ( = ?auto_391752 ?auto_391753 ) ) ( not ( = ?auto_391752 ?auto_391754 ) ) ( not ( = ?auto_391752 ?auto_391755 ) ) ( not ( = ?auto_391752 ?auto_391756 ) ) ( not ( = ?auto_391752 ?auto_391757 ) ) ( not ( = ?auto_391752 ?auto_391758 ) ) ( not ( = ?auto_391752 ?auto_391759 ) ) ( not ( = ?auto_391752 ?auto_391760 ) ) ( not ( = ?auto_391752 ?auto_391761 ) ) ( not ( = ?auto_391752 ?auto_391762 ) ) ( not ( = ?auto_391753 ?auto_391754 ) ) ( not ( = ?auto_391753 ?auto_391755 ) ) ( not ( = ?auto_391753 ?auto_391756 ) ) ( not ( = ?auto_391753 ?auto_391757 ) ) ( not ( = ?auto_391753 ?auto_391758 ) ) ( not ( = ?auto_391753 ?auto_391759 ) ) ( not ( = ?auto_391753 ?auto_391760 ) ) ( not ( = ?auto_391753 ?auto_391761 ) ) ( not ( = ?auto_391753 ?auto_391762 ) ) ( not ( = ?auto_391754 ?auto_391755 ) ) ( not ( = ?auto_391754 ?auto_391756 ) ) ( not ( = ?auto_391754 ?auto_391757 ) ) ( not ( = ?auto_391754 ?auto_391758 ) ) ( not ( = ?auto_391754 ?auto_391759 ) ) ( not ( = ?auto_391754 ?auto_391760 ) ) ( not ( = ?auto_391754 ?auto_391761 ) ) ( not ( = ?auto_391754 ?auto_391762 ) ) ( not ( = ?auto_391755 ?auto_391756 ) ) ( not ( = ?auto_391755 ?auto_391757 ) ) ( not ( = ?auto_391755 ?auto_391758 ) ) ( not ( = ?auto_391755 ?auto_391759 ) ) ( not ( = ?auto_391755 ?auto_391760 ) ) ( not ( = ?auto_391755 ?auto_391761 ) ) ( not ( = ?auto_391755 ?auto_391762 ) ) ( not ( = ?auto_391756 ?auto_391757 ) ) ( not ( = ?auto_391756 ?auto_391758 ) ) ( not ( = ?auto_391756 ?auto_391759 ) ) ( not ( = ?auto_391756 ?auto_391760 ) ) ( not ( = ?auto_391756 ?auto_391761 ) ) ( not ( = ?auto_391756 ?auto_391762 ) ) ( not ( = ?auto_391757 ?auto_391758 ) ) ( not ( = ?auto_391757 ?auto_391759 ) ) ( not ( = ?auto_391757 ?auto_391760 ) ) ( not ( = ?auto_391757 ?auto_391761 ) ) ( not ( = ?auto_391757 ?auto_391762 ) ) ( not ( = ?auto_391758 ?auto_391759 ) ) ( not ( = ?auto_391758 ?auto_391760 ) ) ( not ( = ?auto_391758 ?auto_391761 ) ) ( not ( = ?auto_391758 ?auto_391762 ) ) ( not ( = ?auto_391759 ?auto_391760 ) ) ( not ( = ?auto_391759 ?auto_391761 ) ) ( not ( = ?auto_391759 ?auto_391762 ) ) ( not ( = ?auto_391760 ?auto_391761 ) ) ( not ( = ?auto_391760 ?auto_391762 ) ) ( not ( = ?auto_391761 ?auto_391762 ) ) ( ON ?auto_391761 ?auto_391762 ) ( ON ?auto_391760 ?auto_391761 ) ( ON ?auto_391759 ?auto_391760 ) ( ON ?auto_391758 ?auto_391759 ) ( ON ?auto_391757 ?auto_391758 ) ( ON ?auto_391756 ?auto_391757 ) ( ON ?auto_391755 ?auto_391756 ) ( ON ?auto_391754 ?auto_391755 ) ( ON ?auto_391753 ?auto_391754 ) ( ON ?auto_391752 ?auto_391753 ) ( ON ?auto_391751 ?auto_391752 ) ( CLEAR ?auto_391749 ) ( ON ?auto_391750 ?auto_391751 ) ( CLEAR ?auto_391750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_391748 ?auto_391749 ?auto_391750 )
      ( MAKE-15PILE ?auto_391748 ?auto_391749 ?auto_391750 ?auto_391751 ?auto_391752 ?auto_391753 ?auto_391754 ?auto_391755 ?auto_391756 ?auto_391757 ?auto_391758 ?auto_391759 ?auto_391760 ?auto_391761 ?auto_391762 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391778 - BLOCK
      ?auto_391779 - BLOCK
      ?auto_391780 - BLOCK
      ?auto_391781 - BLOCK
      ?auto_391782 - BLOCK
      ?auto_391783 - BLOCK
      ?auto_391784 - BLOCK
      ?auto_391785 - BLOCK
      ?auto_391786 - BLOCK
      ?auto_391787 - BLOCK
      ?auto_391788 - BLOCK
      ?auto_391789 - BLOCK
      ?auto_391790 - BLOCK
      ?auto_391791 - BLOCK
      ?auto_391792 - BLOCK
    )
    :vars
    (
      ?auto_391793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391792 ?auto_391793 ) ( ON-TABLE ?auto_391778 ) ( not ( = ?auto_391778 ?auto_391779 ) ) ( not ( = ?auto_391778 ?auto_391780 ) ) ( not ( = ?auto_391778 ?auto_391781 ) ) ( not ( = ?auto_391778 ?auto_391782 ) ) ( not ( = ?auto_391778 ?auto_391783 ) ) ( not ( = ?auto_391778 ?auto_391784 ) ) ( not ( = ?auto_391778 ?auto_391785 ) ) ( not ( = ?auto_391778 ?auto_391786 ) ) ( not ( = ?auto_391778 ?auto_391787 ) ) ( not ( = ?auto_391778 ?auto_391788 ) ) ( not ( = ?auto_391778 ?auto_391789 ) ) ( not ( = ?auto_391778 ?auto_391790 ) ) ( not ( = ?auto_391778 ?auto_391791 ) ) ( not ( = ?auto_391778 ?auto_391792 ) ) ( not ( = ?auto_391778 ?auto_391793 ) ) ( not ( = ?auto_391779 ?auto_391780 ) ) ( not ( = ?auto_391779 ?auto_391781 ) ) ( not ( = ?auto_391779 ?auto_391782 ) ) ( not ( = ?auto_391779 ?auto_391783 ) ) ( not ( = ?auto_391779 ?auto_391784 ) ) ( not ( = ?auto_391779 ?auto_391785 ) ) ( not ( = ?auto_391779 ?auto_391786 ) ) ( not ( = ?auto_391779 ?auto_391787 ) ) ( not ( = ?auto_391779 ?auto_391788 ) ) ( not ( = ?auto_391779 ?auto_391789 ) ) ( not ( = ?auto_391779 ?auto_391790 ) ) ( not ( = ?auto_391779 ?auto_391791 ) ) ( not ( = ?auto_391779 ?auto_391792 ) ) ( not ( = ?auto_391779 ?auto_391793 ) ) ( not ( = ?auto_391780 ?auto_391781 ) ) ( not ( = ?auto_391780 ?auto_391782 ) ) ( not ( = ?auto_391780 ?auto_391783 ) ) ( not ( = ?auto_391780 ?auto_391784 ) ) ( not ( = ?auto_391780 ?auto_391785 ) ) ( not ( = ?auto_391780 ?auto_391786 ) ) ( not ( = ?auto_391780 ?auto_391787 ) ) ( not ( = ?auto_391780 ?auto_391788 ) ) ( not ( = ?auto_391780 ?auto_391789 ) ) ( not ( = ?auto_391780 ?auto_391790 ) ) ( not ( = ?auto_391780 ?auto_391791 ) ) ( not ( = ?auto_391780 ?auto_391792 ) ) ( not ( = ?auto_391780 ?auto_391793 ) ) ( not ( = ?auto_391781 ?auto_391782 ) ) ( not ( = ?auto_391781 ?auto_391783 ) ) ( not ( = ?auto_391781 ?auto_391784 ) ) ( not ( = ?auto_391781 ?auto_391785 ) ) ( not ( = ?auto_391781 ?auto_391786 ) ) ( not ( = ?auto_391781 ?auto_391787 ) ) ( not ( = ?auto_391781 ?auto_391788 ) ) ( not ( = ?auto_391781 ?auto_391789 ) ) ( not ( = ?auto_391781 ?auto_391790 ) ) ( not ( = ?auto_391781 ?auto_391791 ) ) ( not ( = ?auto_391781 ?auto_391792 ) ) ( not ( = ?auto_391781 ?auto_391793 ) ) ( not ( = ?auto_391782 ?auto_391783 ) ) ( not ( = ?auto_391782 ?auto_391784 ) ) ( not ( = ?auto_391782 ?auto_391785 ) ) ( not ( = ?auto_391782 ?auto_391786 ) ) ( not ( = ?auto_391782 ?auto_391787 ) ) ( not ( = ?auto_391782 ?auto_391788 ) ) ( not ( = ?auto_391782 ?auto_391789 ) ) ( not ( = ?auto_391782 ?auto_391790 ) ) ( not ( = ?auto_391782 ?auto_391791 ) ) ( not ( = ?auto_391782 ?auto_391792 ) ) ( not ( = ?auto_391782 ?auto_391793 ) ) ( not ( = ?auto_391783 ?auto_391784 ) ) ( not ( = ?auto_391783 ?auto_391785 ) ) ( not ( = ?auto_391783 ?auto_391786 ) ) ( not ( = ?auto_391783 ?auto_391787 ) ) ( not ( = ?auto_391783 ?auto_391788 ) ) ( not ( = ?auto_391783 ?auto_391789 ) ) ( not ( = ?auto_391783 ?auto_391790 ) ) ( not ( = ?auto_391783 ?auto_391791 ) ) ( not ( = ?auto_391783 ?auto_391792 ) ) ( not ( = ?auto_391783 ?auto_391793 ) ) ( not ( = ?auto_391784 ?auto_391785 ) ) ( not ( = ?auto_391784 ?auto_391786 ) ) ( not ( = ?auto_391784 ?auto_391787 ) ) ( not ( = ?auto_391784 ?auto_391788 ) ) ( not ( = ?auto_391784 ?auto_391789 ) ) ( not ( = ?auto_391784 ?auto_391790 ) ) ( not ( = ?auto_391784 ?auto_391791 ) ) ( not ( = ?auto_391784 ?auto_391792 ) ) ( not ( = ?auto_391784 ?auto_391793 ) ) ( not ( = ?auto_391785 ?auto_391786 ) ) ( not ( = ?auto_391785 ?auto_391787 ) ) ( not ( = ?auto_391785 ?auto_391788 ) ) ( not ( = ?auto_391785 ?auto_391789 ) ) ( not ( = ?auto_391785 ?auto_391790 ) ) ( not ( = ?auto_391785 ?auto_391791 ) ) ( not ( = ?auto_391785 ?auto_391792 ) ) ( not ( = ?auto_391785 ?auto_391793 ) ) ( not ( = ?auto_391786 ?auto_391787 ) ) ( not ( = ?auto_391786 ?auto_391788 ) ) ( not ( = ?auto_391786 ?auto_391789 ) ) ( not ( = ?auto_391786 ?auto_391790 ) ) ( not ( = ?auto_391786 ?auto_391791 ) ) ( not ( = ?auto_391786 ?auto_391792 ) ) ( not ( = ?auto_391786 ?auto_391793 ) ) ( not ( = ?auto_391787 ?auto_391788 ) ) ( not ( = ?auto_391787 ?auto_391789 ) ) ( not ( = ?auto_391787 ?auto_391790 ) ) ( not ( = ?auto_391787 ?auto_391791 ) ) ( not ( = ?auto_391787 ?auto_391792 ) ) ( not ( = ?auto_391787 ?auto_391793 ) ) ( not ( = ?auto_391788 ?auto_391789 ) ) ( not ( = ?auto_391788 ?auto_391790 ) ) ( not ( = ?auto_391788 ?auto_391791 ) ) ( not ( = ?auto_391788 ?auto_391792 ) ) ( not ( = ?auto_391788 ?auto_391793 ) ) ( not ( = ?auto_391789 ?auto_391790 ) ) ( not ( = ?auto_391789 ?auto_391791 ) ) ( not ( = ?auto_391789 ?auto_391792 ) ) ( not ( = ?auto_391789 ?auto_391793 ) ) ( not ( = ?auto_391790 ?auto_391791 ) ) ( not ( = ?auto_391790 ?auto_391792 ) ) ( not ( = ?auto_391790 ?auto_391793 ) ) ( not ( = ?auto_391791 ?auto_391792 ) ) ( not ( = ?auto_391791 ?auto_391793 ) ) ( not ( = ?auto_391792 ?auto_391793 ) ) ( ON ?auto_391791 ?auto_391792 ) ( ON ?auto_391790 ?auto_391791 ) ( ON ?auto_391789 ?auto_391790 ) ( ON ?auto_391788 ?auto_391789 ) ( ON ?auto_391787 ?auto_391788 ) ( ON ?auto_391786 ?auto_391787 ) ( ON ?auto_391785 ?auto_391786 ) ( ON ?auto_391784 ?auto_391785 ) ( ON ?auto_391783 ?auto_391784 ) ( ON ?auto_391782 ?auto_391783 ) ( ON ?auto_391781 ?auto_391782 ) ( ON ?auto_391780 ?auto_391781 ) ( CLEAR ?auto_391778 ) ( ON ?auto_391779 ?auto_391780 ) ( CLEAR ?auto_391779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_391778 ?auto_391779 )
      ( MAKE-15PILE ?auto_391778 ?auto_391779 ?auto_391780 ?auto_391781 ?auto_391782 ?auto_391783 ?auto_391784 ?auto_391785 ?auto_391786 ?auto_391787 ?auto_391788 ?auto_391789 ?auto_391790 ?auto_391791 ?auto_391792 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391809 - BLOCK
      ?auto_391810 - BLOCK
      ?auto_391811 - BLOCK
      ?auto_391812 - BLOCK
      ?auto_391813 - BLOCK
      ?auto_391814 - BLOCK
      ?auto_391815 - BLOCK
      ?auto_391816 - BLOCK
      ?auto_391817 - BLOCK
      ?auto_391818 - BLOCK
      ?auto_391819 - BLOCK
      ?auto_391820 - BLOCK
      ?auto_391821 - BLOCK
      ?auto_391822 - BLOCK
      ?auto_391823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391823 ) ( ON-TABLE ?auto_391809 ) ( not ( = ?auto_391809 ?auto_391810 ) ) ( not ( = ?auto_391809 ?auto_391811 ) ) ( not ( = ?auto_391809 ?auto_391812 ) ) ( not ( = ?auto_391809 ?auto_391813 ) ) ( not ( = ?auto_391809 ?auto_391814 ) ) ( not ( = ?auto_391809 ?auto_391815 ) ) ( not ( = ?auto_391809 ?auto_391816 ) ) ( not ( = ?auto_391809 ?auto_391817 ) ) ( not ( = ?auto_391809 ?auto_391818 ) ) ( not ( = ?auto_391809 ?auto_391819 ) ) ( not ( = ?auto_391809 ?auto_391820 ) ) ( not ( = ?auto_391809 ?auto_391821 ) ) ( not ( = ?auto_391809 ?auto_391822 ) ) ( not ( = ?auto_391809 ?auto_391823 ) ) ( not ( = ?auto_391810 ?auto_391811 ) ) ( not ( = ?auto_391810 ?auto_391812 ) ) ( not ( = ?auto_391810 ?auto_391813 ) ) ( not ( = ?auto_391810 ?auto_391814 ) ) ( not ( = ?auto_391810 ?auto_391815 ) ) ( not ( = ?auto_391810 ?auto_391816 ) ) ( not ( = ?auto_391810 ?auto_391817 ) ) ( not ( = ?auto_391810 ?auto_391818 ) ) ( not ( = ?auto_391810 ?auto_391819 ) ) ( not ( = ?auto_391810 ?auto_391820 ) ) ( not ( = ?auto_391810 ?auto_391821 ) ) ( not ( = ?auto_391810 ?auto_391822 ) ) ( not ( = ?auto_391810 ?auto_391823 ) ) ( not ( = ?auto_391811 ?auto_391812 ) ) ( not ( = ?auto_391811 ?auto_391813 ) ) ( not ( = ?auto_391811 ?auto_391814 ) ) ( not ( = ?auto_391811 ?auto_391815 ) ) ( not ( = ?auto_391811 ?auto_391816 ) ) ( not ( = ?auto_391811 ?auto_391817 ) ) ( not ( = ?auto_391811 ?auto_391818 ) ) ( not ( = ?auto_391811 ?auto_391819 ) ) ( not ( = ?auto_391811 ?auto_391820 ) ) ( not ( = ?auto_391811 ?auto_391821 ) ) ( not ( = ?auto_391811 ?auto_391822 ) ) ( not ( = ?auto_391811 ?auto_391823 ) ) ( not ( = ?auto_391812 ?auto_391813 ) ) ( not ( = ?auto_391812 ?auto_391814 ) ) ( not ( = ?auto_391812 ?auto_391815 ) ) ( not ( = ?auto_391812 ?auto_391816 ) ) ( not ( = ?auto_391812 ?auto_391817 ) ) ( not ( = ?auto_391812 ?auto_391818 ) ) ( not ( = ?auto_391812 ?auto_391819 ) ) ( not ( = ?auto_391812 ?auto_391820 ) ) ( not ( = ?auto_391812 ?auto_391821 ) ) ( not ( = ?auto_391812 ?auto_391822 ) ) ( not ( = ?auto_391812 ?auto_391823 ) ) ( not ( = ?auto_391813 ?auto_391814 ) ) ( not ( = ?auto_391813 ?auto_391815 ) ) ( not ( = ?auto_391813 ?auto_391816 ) ) ( not ( = ?auto_391813 ?auto_391817 ) ) ( not ( = ?auto_391813 ?auto_391818 ) ) ( not ( = ?auto_391813 ?auto_391819 ) ) ( not ( = ?auto_391813 ?auto_391820 ) ) ( not ( = ?auto_391813 ?auto_391821 ) ) ( not ( = ?auto_391813 ?auto_391822 ) ) ( not ( = ?auto_391813 ?auto_391823 ) ) ( not ( = ?auto_391814 ?auto_391815 ) ) ( not ( = ?auto_391814 ?auto_391816 ) ) ( not ( = ?auto_391814 ?auto_391817 ) ) ( not ( = ?auto_391814 ?auto_391818 ) ) ( not ( = ?auto_391814 ?auto_391819 ) ) ( not ( = ?auto_391814 ?auto_391820 ) ) ( not ( = ?auto_391814 ?auto_391821 ) ) ( not ( = ?auto_391814 ?auto_391822 ) ) ( not ( = ?auto_391814 ?auto_391823 ) ) ( not ( = ?auto_391815 ?auto_391816 ) ) ( not ( = ?auto_391815 ?auto_391817 ) ) ( not ( = ?auto_391815 ?auto_391818 ) ) ( not ( = ?auto_391815 ?auto_391819 ) ) ( not ( = ?auto_391815 ?auto_391820 ) ) ( not ( = ?auto_391815 ?auto_391821 ) ) ( not ( = ?auto_391815 ?auto_391822 ) ) ( not ( = ?auto_391815 ?auto_391823 ) ) ( not ( = ?auto_391816 ?auto_391817 ) ) ( not ( = ?auto_391816 ?auto_391818 ) ) ( not ( = ?auto_391816 ?auto_391819 ) ) ( not ( = ?auto_391816 ?auto_391820 ) ) ( not ( = ?auto_391816 ?auto_391821 ) ) ( not ( = ?auto_391816 ?auto_391822 ) ) ( not ( = ?auto_391816 ?auto_391823 ) ) ( not ( = ?auto_391817 ?auto_391818 ) ) ( not ( = ?auto_391817 ?auto_391819 ) ) ( not ( = ?auto_391817 ?auto_391820 ) ) ( not ( = ?auto_391817 ?auto_391821 ) ) ( not ( = ?auto_391817 ?auto_391822 ) ) ( not ( = ?auto_391817 ?auto_391823 ) ) ( not ( = ?auto_391818 ?auto_391819 ) ) ( not ( = ?auto_391818 ?auto_391820 ) ) ( not ( = ?auto_391818 ?auto_391821 ) ) ( not ( = ?auto_391818 ?auto_391822 ) ) ( not ( = ?auto_391818 ?auto_391823 ) ) ( not ( = ?auto_391819 ?auto_391820 ) ) ( not ( = ?auto_391819 ?auto_391821 ) ) ( not ( = ?auto_391819 ?auto_391822 ) ) ( not ( = ?auto_391819 ?auto_391823 ) ) ( not ( = ?auto_391820 ?auto_391821 ) ) ( not ( = ?auto_391820 ?auto_391822 ) ) ( not ( = ?auto_391820 ?auto_391823 ) ) ( not ( = ?auto_391821 ?auto_391822 ) ) ( not ( = ?auto_391821 ?auto_391823 ) ) ( not ( = ?auto_391822 ?auto_391823 ) ) ( ON ?auto_391822 ?auto_391823 ) ( ON ?auto_391821 ?auto_391822 ) ( ON ?auto_391820 ?auto_391821 ) ( ON ?auto_391819 ?auto_391820 ) ( ON ?auto_391818 ?auto_391819 ) ( ON ?auto_391817 ?auto_391818 ) ( ON ?auto_391816 ?auto_391817 ) ( ON ?auto_391815 ?auto_391816 ) ( ON ?auto_391814 ?auto_391815 ) ( ON ?auto_391813 ?auto_391814 ) ( ON ?auto_391812 ?auto_391813 ) ( ON ?auto_391811 ?auto_391812 ) ( CLEAR ?auto_391809 ) ( ON ?auto_391810 ?auto_391811 ) ( CLEAR ?auto_391810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_391809 ?auto_391810 )
      ( MAKE-15PILE ?auto_391809 ?auto_391810 ?auto_391811 ?auto_391812 ?auto_391813 ?auto_391814 ?auto_391815 ?auto_391816 ?auto_391817 ?auto_391818 ?auto_391819 ?auto_391820 ?auto_391821 ?auto_391822 ?auto_391823 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391839 - BLOCK
      ?auto_391840 - BLOCK
      ?auto_391841 - BLOCK
      ?auto_391842 - BLOCK
      ?auto_391843 - BLOCK
      ?auto_391844 - BLOCK
      ?auto_391845 - BLOCK
      ?auto_391846 - BLOCK
      ?auto_391847 - BLOCK
      ?auto_391848 - BLOCK
      ?auto_391849 - BLOCK
      ?auto_391850 - BLOCK
      ?auto_391851 - BLOCK
      ?auto_391852 - BLOCK
      ?auto_391853 - BLOCK
    )
    :vars
    (
      ?auto_391854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391853 ?auto_391854 ) ( not ( = ?auto_391839 ?auto_391840 ) ) ( not ( = ?auto_391839 ?auto_391841 ) ) ( not ( = ?auto_391839 ?auto_391842 ) ) ( not ( = ?auto_391839 ?auto_391843 ) ) ( not ( = ?auto_391839 ?auto_391844 ) ) ( not ( = ?auto_391839 ?auto_391845 ) ) ( not ( = ?auto_391839 ?auto_391846 ) ) ( not ( = ?auto_391839 ?auto_391847 ) ) ( not ( = ?auto_391839 ?auto_391848 ) ) ( not ( = ?auto_391839 ?auto_391849 ) ) ( not ( = ?auto_391839 ?auto_391850 ) ) ( not ( = ?auto_391839 ?auto_391851 ) ) ( not ( = ?auto_391839 ?auto_391852 ) ) ( not ( = ?auto_391839 ?auto_391853 ) ) ( not ( = ?auto_391839 ?auto_391854 ) ) ( not ( = ?auto_391840 ?auto_391841 ) ) ( not ( = ?auto_391840 ?auto_391842 ) ) ( not ( = ?auto_391840 ?auto_391843 ) ) ( not ( = ?auto_391840 ?auto_391844 ) ) ( not ( = ?auto_391840 ?auto_391845 ) ) ( not ( = ?auto_391840 ?auto_391846 ) ) ( not ( = ?auto_391840 ?auto_391847 ) ) ( not ( = ?auto_391840 ?auto_391848 ) ) ( not ( = ?auto_391840 ?auto_391849 ) ) ( not ( = ?auto_391840 ?auto_391850 ) ) ( not ( = ?auto_391840 ?auto_391851 ) ) ( not ( = ?auto_391840 ?auto_391852 ) ) ( not ( = ?auto_391840 ?auto_391853 ) ) ( not ( = ?auto_391840 ?auto_391854 ) ) ( not ( = ?auto_391841 ?auto_391842 ) ) ( not ( = ?auto_391841 ?auto_391843 ) ) ( not ( = ?auto_391841 ?auto_391844 ) ) ( not ( = ?auto_391841 ?auto_391845 ) ) ( not ( = ?auto_391841 ?auto_391846 ) ) ( not ( = ?auto_391841 ?auto_391847 ) ) ( not ( = ?auto_391841 ?auto_391848 ) ) ( not ( = ?auto_391841 ?auto_391849 ) ) ( not ( = ?auto_391841 ?auto_391850 ) ) ( not ( = ?auto_391841 ?auto_391851 ) ) ( not ( = ?auto_391841 ?auto_391852 ) ) ( not ( = ?auto_391841 ?auto_391853 ) ) ( not ( = ?auto_391841 ?auto_391854 ) ) ( not ( = ?auto_391842 ?auto_391843 ) ) ( not ( = ?auto_391842 ?auto_391844 ) ) ( not ( = ?auto_391842 ?auto_391845 ) ) ( not ( = ?auto_391842 ?auto_391846 ) ) ( not ( = ?auto_391842 ?auto_391847 ) ) ( not ( = ?auto_391842 ?auto_391848 ) ) ( not ( = ?auto_391842 ?auto_391849 ) ) ( not ( = ?auto_391842 ?auto_391850 ) ) ( not ( = ?auto_391842 ?auto_391851 ) ) ( not ( = ?auto_391842 ?auto_391852 ) ) ( not ( = ?auto_391842 ?auto_391853 ) ) ( not ( = ?auto_391842 ?auto_391854 ) ) ( not ( = ?auto_391843 ?auto_391844 ) ) ( not ( = ?auto_391843 ?auto_391845 ) ) ( not ( = ?auto_391843 ?auto_391846 ) ) ( not ( = ?auto_391843 ?auto_391847 ) ) ( not ( = ?auto_391843 ?auto_391848 ) ) ( not ( = ?auto_391843 ?auto_391849 ) ) ( not ( = ?auto_391843 ?auto_391850 ) ) ( not ( = ?auto_391843 ?auto_391851 ) ) ( not ( = ?auto_391843 ?auto_391852 ) ) ( not ( = ?auto_391843 ?auto_391853 ) ) ( not ( = ?auto_391843 ?auto_391854 ) ) ( not ( = ?auto_391844 ?auto_391845 ) ) ( not ( = ?auto_391844 ?auto_391846 ) ) ( not ( = ?auto_391844 ?auto_391847 ) ) ( not ( = ?auto_391844 ?auto_391848 ) ) ( not ( = ?auto_391844 ?auto_391849 ) ) ( not ( = ?auto_391844 ?auto_391850 ) ) ( not ( = ?auto_391844 ?auto_391851 ) ) ( not ( = ?auto_391844 ?auto_391852 ) ) ( not ( = ?auto_391844 ?auto_391853 ) ) ( not ( = ?auto_391844 ?auto_391854 ) ) ( not ( = ?auto_391845 ?auto_391846 ) ) ( not ( = ?auto_391845 ?auto_391847 ) ) ( not ( = ?auto_391845 ?auto_391848 ) ) ( not ( = ?auto_391845 ?auto_391849 ) ) ( not ( = ?auto_391845 ?auto_391850 ) ) ( not ( = ?auto_391845 ?auto_391851 ) ) ( not ( = ?auto_391845 ?auto_391852 ) ) ( not ( = ?auto_391845 ?auto_391853 ) ) ( not ( = ?auto_391845 ?auto_391854 ) ) ( not ( = ?auto_391846 ?auto_391847 ) ) ( not ( = ?auto_391846 ?auto_391848 ) ) ( not ( = ?auto_391846 ?auto_391849 ) ) ( not ( = ?auto_391846 ?auto_391850 ) ) ( not ( = ?auto_391846 ?auto_391851 ) ) ( not ( = ?auto_391846 ?auto_391852 ) ) ( not ( = ?auto_391846 ?auto_391853 ) ) ( not ( = ?auto_391846 ?auto_391854 ) ) ( not ( = ?auto_391847 ?auto_391848 ) ) ( not ( = ?auto_391847 ?auto_391849 ) ) ( not ( = ?auto_391847 ?auto_391850 ) ) ( not ( = ?auto_391847 ?auto_391851 ) ) ( not ( = ?auto_391847 ?auto_391852 ) ) ( not ( = ?auto_391847 ?auto_391853 ) ) ( not ( = ?auto_391847 ?auto_391854 ) ) ( not ( = ?auto_391848 ?auto_391849 ) ) ( not ( = ?auto_391848 ?auto_391850 ) ) ( not ( = ?auto_391848 ?auto_391851 ) ) ( not ( = ?auto_391848 ?auto_391852 ) ) ( not ( = ?auto_391848 ?auto_391853 ) ) ( not ( = ?auto_391848 ?auto_391854 ) ) ( not ( = ?auto_391849 ?auto_391850 ) ) ( not ( = ?auto_391849 ?auto_391851 ) ) ( not ( = ?auto_391849 ?auto_391852 ) ) ( not ( = ?auto_391849 ?auto_391853 ) ) ( not ( = ?auto_391849 ?auto_391854 ) ) ( not ( = ?auto_391850 ?auto_391851 ) ) ( not ( = ?auto_391850 ?auto_391852 ) ) ( not ( = ?auto_391850 ?auto_391853 ) ) ( not ( = ?auto_391850 ?auto_391854 ) ) ( not ( = ?auto_391851 ?auto_391852 ) ) ( not ( = ?auto_391851 ?auto_391853 ) ) ( not ( = ?auto_391851 ?auto_391854 ) ) ( not ( = ?auto_391852 ?auto_391853 ) ) ( not ( = ?auto_391852 ?auto_391854 ) ) ( not ( = ?auto_391853 ?auto_391854 ) ) ( ON ?auto_391852 ?auto_391853 ) ( ON ?auto_391851 ?auto_391852 ) ( ON ?auto_391850 ?auto_391851 ) ( ON ?auto_391849 ?auto_391850 ) ( ON ?auto_391848 ?auto_391849 ) ( ON ?auto_391847 ?auto_391848 ) ( ON ?auto_391846 ?auto_391847 ) ( ON ?auto_391845 ?auto_391846 ) ( ON ?auto_391844 ?auto_391845 ) ( ON ?auto_391843 ?auto_391844 ) ( ON ?auto_391842 ?auto_391843 ) ( ON ?auto_391841 ?auto_391842 ) ( ON ?auto_391840 ?auto_391841 ) ( ON ?auto_391839 ?auto_391840 ) ( CLEAR ?auto_391839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_391839 )
      ( MAKE-15PILE ?auto_391839 ?auto_391840 ?auto_391841 ?auto_391842 ?auto_391843 ?auto_391844 ?auto_391845 ?auto_391846 ?auto_391847 ?auto_391848 ?auto_391849 ?auto_391850 ?auto_391851 ?auto_391852 ?auto_391853 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391870 - BLOCK
      ?auto_391871 - BLOCK
      ?auto_391872 - BLOCK
      ?auto_391873 - BLOCK
      ?auto_391874 - BLOCK
      ?auto_391875 - BLOCK
      ?auto_391876 - BLOCK
      ?auto_391877 - BLOCK
      ?auto_391878 - BLOCK
      ?auto_391879 - BLOCK
      ?auto_391880 - BLOCK
      ?auto_391881 - BLOCK
      ?auto_391882 - BLOCK
      ?auto_391883 - BLOCK
      ?auto_391884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391884 ) ( not ( = ?auto_391870 ?auto_391871 ) ) ( not ( = ?auto_391870 ?auto_391872 ) ) ( not ( = ?auto_391870 ?auto_391873 ) ) ( not ( = ?auto_391870 ?auto_391874 ) ) ( not ( = ?auto_391870 ?auto_391875 ) ) ( not ( = ?auto_391870 ?auto_391876 ) ) ( not ( = ?auto_391870 ?auto_391877 ) ) ( not ( = ?auto_391870 ?auto_391878 ) ) ( not ( = ?auto_391870 ?auto_391879 ) ) ( not ( = ?auto_391870 ?auto_391880 ) ) ( not ( = ?auto_391870 ?auto_391881 ) ) ( not ( = ?auto_391870 ?auto_391882 ) ) ( not ( = ?auto_391870 ?auto_391883 ) ) ( not ( = ?auto_391870 ?auto_391884 ) ) ( not ( = ?auto_391871 ?auto_391872 ) ) ( not ( = ?auto_391871 ?auto_391873 ) ) ( not ( = ?auto_391871 ?auto_391874 ) ) ( not ( = ?auto_391871 ?auto_391875 ) ) ( not ( = ?auto_391871 ?auto_391876 ) ) ( not ( = ?auto_391871 ?auto_391877 ) ) ( not ( = ?auto_391871 ?auto_391878 ) ) ( not ( = ?auto_391871 ?auto_391879 ) ) ( not ( = ?auto_391871 ?auto_391880 ) ) ( not ( = ?auto_391871 ?auto_391881 ) ) ( not ( = ?auto_391871 ?auto_391882 ) ) ( not ( = ?auto_391871 ?auto_391883 ) ) ( not ( = ?auto_391871 ?auto_391884 ) ) ( not ( = ?auto_391872 ?auto_391873 ) ) ( not ( = ?auto_391872 ?auto_391874 ) ) ( not ( = ?auto_391872 ?auto_391875 ) ) ( not ( = ?auto_391872 ?auto_391876 ) ) ( not ( = ?auto_391872 ?auto_391877 ) ) ( not ( = ?auto_391872 ?auto_391878 ) ) ( not ( = ?auto_391872 ?auto_391879 ) ) ( not ( = ?auto_391872 ?auto_391880 ) ) ( not ( = ?auto_391872 ?auto_391881 ) ) ( not ( = ?auto_391872 ?auto_391882 ) ) ( not ( = ?auto_391872 ?auto_391883 ) ) ( not ( = ?auto_391872 ?auto_391884 ) ) ( not ( = ?auto_391873 ?auto_391874 ) ) ( not ( = ?auto_391873 ?auto_391875 ) ) ( not ( = ?auto_391873 ?auto_391876 ) ) ( not ( = ?auto_391873 ?auto_391877 ) ) ( not ( = ?auto_391873 ?auto_391878 ) ) ( not ( = ?auto_391873 ?auto_391879 ) ) ( not ( = ?auto_391873 ?auto_391880 ) ) ( not ( = ?auto_391873 ?auto_391881 ) ) ( not ( = ?auto_391873 ?auto_391882 ) ) ( not ( = ?auto_391873 ?auto_391883 ) ) ( not ( = ?auto_391873 ?auto_391884 ) ) ( not ( = ?auto_391874 ?auto_391875 ) ) ( not ( = ?auto_391874 ?auto_391876 ) ) ( not ( = ?auto_391874 ?auto_391877 ) ) ( not ( = ?auto_391874 ?auto_391878 ) ) ( not ( = ?auto_391874 ?auto_391879 ) ) ( not ( = ?auto_391874 ?auto_391880 ) ) ( not ( = ?auto_391874 ?auto_391881 ) ) ( not ( = ?auto_391874 ?auto_391882 ) ) ( not ( = ?auto_391874 ?auto_391883 ) ) ( not ( = ?auto_391874 ?auto_391884 ) ) ( not ( = ?auto_391875 ?auto_391876 ) ) ( not ( = ?auto_391875 ?auto_391877 ) ) ( not ( = ?auto_391875 ?auto_391878 ) ) ( not ( = ?auto_391875 ?auto_391879 ) ) ( not ( = ?auto_391875 ?auto_391880 ) ) ( not ( = ?auto_391875 ?auto_391881 ) ) ( not ( = ?auto_391875 ?auto_391882 ) ) ( not ( = ?auto_391875 ?auto_391883 ) ) ( not ( = ?auto_391875 ?auto_391884 ) ) ( not ( = ?auto_391876 ?auto_391877 ) ) ( not ( = ?auto_391876 ?auto_391878 ) ) ( not ( = ?auto_391876 ?auto_391879 ) ) ( not ( = ?auto_391876 ?auto_391880 ) ) ( not ( = ?auto_391876 ?auto_391881 ) ) ( not ( = ?auto_391876 ?auto_391882 ) ) ( not ( = ?auto_391876 ?auto_391883 ) ) ( not ( = ?auto_391876 ?auto_391884 ) ) ( not ( = ?auto_391877 ?auto_391878 ) ) ( not ( = ?auto_391877 ?auto_391879 ) ) ( not ( = ?auto_391877 ?auto_391880 ) ) ( not ( = ?auto_391877 ?auto_391881 ) ) ( not ( = ?auto_391877 ?auto_391882 ) ) ( not ( = ?auto_391877 ?auto_391883 ) ) ( not ( = ?auto_391877 ?auto_391884 ) ) ( not ( = ?auto_391878 ?auto_391879 ) ) ( not ( = ?auto_391878 ?auto_391880 ) ) ( not ( = ?auto_391878 ?auto_391881 ) ) ( not ( = ?auto_391878 ?auto_391882 ) ) ( not ( = ?auto_391878 ?auto_391883 ) ) ( not ( = ?auto_391878 ?auto_391884 ) ) ( not ( = ?auto_391879 ?auto_391880 ) ) ( not ( = ?auto_391879 ?auto_391881 ) ) ( not ( = ?auto_391879 ?auto_391882 ) ) ( not ( = ?auto_391879 ?auto_391883 ) ) ( not ( = ?auto_391879 ?auto_391884 ) ) ( not ( = ?auto_391880 ?auto_391881 ) ) ( not ( = ?auto_391880 ?auto_391882 ) ) ( not ( = ?auto_391880 ?auto_391883 ) ) ( not ( = ?auto_391880 ?auto_391884 ) ) ( not ( = ?auto_391881 ?auto_391882 ) ) ( not ( = ?auto_391881 ?auto_391883 ) ) ( not ( = ?auto_391881 ?auto_391884 ) ) ( not ( = ?auto_391882 ?auto_391883 ) ) ( not ( = ?auto_391882 ?auto_391884 ) ) ( not ( = ?auto_391883 ?auto_391884 ) ) ( ON ?auto_391883 ?auto_391884 ) ( ON ?auto_391882 ?auto_391883 ) ( ON ?auto_391881 ?auto_391882 ) ( ON ?auto_391880 ?auto_391881 ) ( ON ?auto_391879 ?auto_391880 ) ( ON ?auto_391878 ?auto_391879 ) ( ON ?auto_391877 ?auto_391878 ) ( ON ?auto_391876 ?auto_391877 ) ( ON ?auto_391875 ?auto_391876 ) ( ON ?auto_391874 ?auto_391875 ) ( ON ?auto_391873 ?auto_391874 ) ( ON ?auto_391872 ?auto_391873 ) ( ON ?auto_391871 ?auto_391872 ) ( ON ?auto_391870 ?auto_391871 ) ( CLEAR ?auto_391870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_391870 )
      ( MAKE-15PILE ?auto_391870 ?auto_391871 ?auto_391872 ?auto_391873 ?auto_391874 ?auto_391875 ?auto_391876 ?auto_391877 ?auto_391878 ?auto_391879 ?auto_391880 ?auto_391881 ?auto_391882 ?auto_391883 ?auto_391884 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391900 - BLOCK
      ?auto_391901 - BLOCK
      ?auto_391902 - BLOCK
      ?auto_391903 - BLOCK
      ?auto_391904 - BLOCK
      ?auto_391905 - BLOCK
      ?auto_391906 - BLOCK
      ?auto_391907 - BLOCK
      ?auto_391908 - BLOCK
      ?auto_391909 - BLOCK
      ?auto_391910 - BLOCK
      ?auto_391911 - BLOCK
      ?auto_391912 - BLOCK
      ?auto_391913 - BLOCK
      ?auto_391914 - BLOCK
    )
    :vars
    (
      ?auto_391915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_391900 ?auto_391901 ) ) ( not ( = ?auto_391900 ?auto_391902 ) ) ( not ( = ?auto_391900 ?auto_391903 ) ) ( not ( = ?auto_391900 ?auto_391904 ) ) ( not ( = ?auto_391900 ?auto_391905 ) ) ( not ( = ?auto_391900 ?auto_391906 ) ) ( not ( = ?auto_391900 ?auto_391907 ) ) ( not ( = ?auto_391900 ?auto_391908 ) ) ( not ( = ?auto_391900 ?auto_391909 ) ) ( not ( = ?auto_391900 ?auto_391910 ) ) ( not ( = ?auto_391900 ?auto_391911 ) ) ( not ( = ?auto_391900 ?auto_391912 ) ) ( not ( = ?auto_391900 ?auto_391913 ) ) ( not ( = ?auto_391900 ?auto_391914 ) ) ( not ( = ?auto_391901 ?auto_391902 ) ) ( not ( = ?auto_391901 ?auto_391903 ) ) ( not ( = ?auto_391901 ?auto_391904 ) ) ( not ( = ?auto_391901 ?auto_391905 ) ) ( not ( = ?auto_391901 ?auto_391906 ) ) ( not ( = ?auto_391901 ?auto_391907 ) ) ( not ( = ?auto_391901 ?auto_391908 ) ) ( not ( = ?auto_391901 ?auto_391909 ) ) ( not ( = ?auto_391901 ?auto_391910 ) ) ( not ( = ?auto_391901 ?auto_391911 ) ) ( not ( = ?auto_391901 ?auto_391912 ) ) ( not ( = ?auto_391901 ?auto_391913 ) ) ( not ( = ?auto_391901 ?auto_391914 ) ) ( not ( = ?auto_391902 ?auto_391903 ) ) ( not ( = ?auto_391902 ?auto_391904 ) ) ( not ( = ?auto_391902 ?auto_391905 ) ) ( not ( = ?auto_391902 ?auto_391906 ) ) ( not ( = ?auto_391902 ?auto_391907 ) ) ( not ( = ?auto_391902 ?auto_391908 ) ) ( not ( = ?auto_391902 ?auto_391909 ) ) ( not ( = ?auto_391902 ?auto_391910 ) ) ( not ( = ?auto_391902 ?auto_391911 ) ) ( not ( = ?auto_391902 ?auto_391912 ) ) ( not ( = ?auto_391902 ?auto_391913 ) ) ( not ( = ?auto_391902 ?auto_391914 ) ) ( not ( = ?auto_391903 ?auto_391904 ) ) ( not ( = ?auto_391903 ?auto_391905 ) ) ( not ( = ?auto_391903 ?auto_391906 ) ) ( not ( = ?auto_391903 ?auto_391907 ) ) ( not ( = ?auto_391903 ?auto_391908 ) ) ( not ( = ?auto_391903 ?auto_391909 ) ) ( not ( = ?auto_391903 ?auto_391910 ) ) ( not ( = ?auto_391903 ?auto_391911 ) ) ( not ( = ?auto_391903 ?auto_391912 ) ) ( not ( = ?auto_391903 ?auto_391913 ) ) ( not ( = ?auto_391903 ?auto_391914 ) ) ( not ( = ?auto_391904 ?auto_391905 ) ) ( not ( = ?auto_391904 ?auto_391906 ) ) ( not ( = ?auto_391904 ?auto_391907 ) ) ( not ( = ?auto_391904 ?auto_391908 ) ) ( not ( = ?auto_391904 ?auto_391909 ) ) ( not ( = ?auto_391904 ?auto_391910 ) ) ( not ( = ?auto_391904 ?auto_391911 ) ) ( not ( = ?auto_391904 ?auto_391912 ) ) ( not ( = ?auto_391904 ?auto_391913 ) ) ( not ( = ?auto_391904 ?auto_391914 ) ) ( not ( = ?auto_391905 ?auto_391906 ) ) ( not ( = ?auto_391905 ?auto_391907 ) ) ( not ( = ?auto_391905 ?auto_391908 ) ) ( not ( = ?auto_391905 ?auto_391909 ) ) ( not ( = ?auto_391905 ?auto_391910 ) ) ( not ( = ?auto_391905 ?auto_391911 ) ) ( not ( = ?auto_391905 ?auto_391912 ) ) ( not ( = ?auto_391905 ?auto_391913 ) ) ( not ( = ?auto_391905 ?auto_391914 ) ) ( not ( = ?auto_391906 ?auto_391907 ) ) ( not ( = ?auto_391906 ?auto_391908 ) ) ( not ( = ?auto_391906 ?auto_391909 ) ) ( not ( = ?auto_391906 ?auto_391910 ) ) ( not ( = ?auto_391906 ?auto_391911 ) ) ( not ( = ?auto_391906 ?auto_391912 ) ) ( not ( = ?auto_391906 ?auto_391913 ) ) ( not ( = ?auto_391906 ?auto_391914 ) ) ( not ( = ?auto_391907 ?auto_391908 ) ) ( not ( = ?auto_391907 ?auto_391909 ) ) ( not ( = ?auto_391907 ?auto_391910 ) ) ( not ( = ?auto_391907 ?auto_391911 ) ) ( not ( = ?auto_391907 ?auto_391912 ) ) ( not ( = ?auto_391907 ?auto_391913 ) ) ( not ( = ?auto_391907 ?auto_391914 ) ) ( not ( = ?auto_391908 ?auto_391909 ) ) ( not ( = ?auto_391908 ?auto_391910 ) ) ( not ( = ?auto_391908 ?auto_391911 ) ) ( not ( = ?auto_391908 ?auto_391912 ) ) ( not ( = ?auto_391908 ?auto_391913 ) ) ( not ( = ?auto_391908 ?auto_391914 ) ) ( not ( = ?auto_391909 ?auto_391910 ) ) ( not ( = ?auto_391909 ?auto_391911 ) ) ( not ( = ?auto_391909 ?auto_391912 ) ) ( not ( = ?auto_391909 ?auto_391913 ) ) ( not ( = ?auto_391909 ?auto_391914 ) ) ( not ( = ?auto_391910 ?auto_391911 ) ) ( not ( = ?auto_391910 ?auto_391912 ) ) ( not ( = ?auto_391910 ?auto_391913 ) ) ( not ( = ?auto_391910 ?auto_391914 ) ) ( not ( = ?auto_391911 ?auto_391912 ) ) ( not ( = ?auto_391911 ?auto_391913 ) ) ( not ( = ?auto_391911 ?auto_391914 ) ) ( not ( = ?auto_391912 ?auto_391913 ) ) ( not ( = ?auto_391912 ?auto_391914 ) ) ( not ( = ?auto_391913 ?auto_391914 ) ) ( ON ?auto_391900 ?auto_391915 ) ( not ( = ?auto_391914 ?auto_391915 ) ) ( not ( = ?auto_391913 ?auto_391915 ) ) ( not ( = ?auto_391912 ?auto_391915 ) ) ( not ( = ?auto_391911 ?auto_391915 ) ) ( not ( = ?auto_391910 ?auto_391915 ) ) ( not ( = ?auto_391909 ?auto_391915 ) ) ( not ( = ?auto_391908 ?auto_391915 ) ) ( not ( = ?auto_391907 ?auto_391915 ) ) ( not ( = ?auto_391906 ?auto_391915 ) ) ( not ( = ?auto_391905 ?auto_391915 ) ) ( not ( = ?auto_391904 ?auto_391915 ) ) ( not ( = ?auto_391903 ?auto_391915 ) ) ( not ( = ?auto_391902 ?auto_391915 ) ) ( not ( = ?auto_391901 ?auto_391915 ) ) ( not ( = ?auto_391900 ?auto_391915 ) ) ( ON ?auto_391901 ?auto_391900 ) ( ON ?auto_391902 ?auto_391901 ) ( ON ?auto_391903 ?auto_391902 ) ( ON ?auto_391904 ?auto_391903 ) ( ON ?auto_391905 ?auto_391904 ) ( ON ?auto_391906 ?auto_391905 ) ( ON ?auto_391907 ?auto_391906 ) ( ON ?auto_391908 ?auto_391907 ) ( ON ?auto_391909 ?auto_391908 ) ( ON ?auto_391910 ?auto_391909 ) ( ON ?auto_391911 ?auto_391910 ) ( ON ?auto_391912 ?auto_391911 ) ( ON ?auto_391913 ?auto_391912 ) ( ON ?auto_391914 ?auto_391913 ) ( CLEAR ?auto_391914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_391914 ?auto_391913 ?auto_391912 ?auto_391911 ?auto_391910 ?auto_391909 ?auto_391908 ?auto_391907 ?auto_391906 ?auto_391905 ?auto_391904 ?auto_391903 ?auto_391902 ?auto_391901 ?auto_391900 )
      ( MAKE-15PILE ?auto_391900 ?auto_391901 ?auto_391902 ?auto_391903 ?auto_391904 ?auto_391905 ?auto_391906 ?auto_391907 ?auto_391908 ?auto_391909 ?auto_391910 ?auto_391911 ?auto_391912 ?auto_391913 ?auto_391914 ) )
  )

)

