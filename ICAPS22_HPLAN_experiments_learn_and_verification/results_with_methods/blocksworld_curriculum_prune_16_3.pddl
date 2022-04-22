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
      ?auto_483760 - BLOCK
    )
    :vars
    (
      ?auto_483761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483760 ?auto_483761 ) ( CLEAR ?auto_483760 ) ( HAND-EMPTY ) ( not ( = ?auto_483760 ?auto_483761 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_483760 ?auto_483761 )
      ( !PUTDOWN ?auto_483760 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_483767 - BLOCK
      ?auto_483768 - BLOCK
    )
    :vars
    (
      ?auto_483769 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_483767 ) ( ON ?auto_483768 ?auto_483769 ) ( CLEAR ?auto_483768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_483767 ) ( not ( = ?auto_483767 ?auto_483768 ) ) ( not ( = ?auto_483767 ?auto_483769 ) ) ( not ( = ?auto_483768 ?auto_483769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_483768 ?auto_483769 )
      ( !STACK ?auto_483768 ?auto_483767 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_483777 - BLOCK
      ?auto_483778 - BLOCK
    )
    :vars
    (
      ?auto_483779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483778 ?auto_483779 ) ( not ( = ?auto_483777 ?auto_483778 ) ) ( not ( = ?auto_483777 ?auto_483779 ) ) ( not ( = ?auto_483778 ?auto_483779 ) ) ( ON ?auto_483777 ?auto_483778 ) ( CLEAR ?auto_483777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_483777 )
      ( MAKE-2PILE ?auto_483777 ?auto_483778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_483788 - BLOCK
      ?auto_483789 - BLOCK
      ?auto_483790 - BLOCK
    )
    :vars
    (
      ?auto_483791 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_483789 ) ( ON ?auto_483790 ?auto_483791 ) ( CLEAR ?auto_483790 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_483788 ) ( ON ?auto_483789 ?auto_483788 ) ( not ( = ?auto_483788 ?auto_483789 ) ) ( not ( = ?auto_483788 ?auto_483790 ) ) ( not ( = ?auto_483788 ?auto_483791 ) ) ( not ( = ?auto_483789 ?auto_483790 ) ) ( not ( = ?auto_483789 ?auto_483791 ) ) ( not ( = ?auto_483790 ?auto_483791 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_483790 ?auto_483791 )
      ( !STACK ?auto_483790 ?auto_483789 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_483802 - BLOCK
      ?auto_483803 - BLOCK
      ?auto_483804 - BLOCK
    )
    :vars
    (
      ?auto_483805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483804 ?auto_483805 ) ( ON-TABLE ?auto_483802 ) ( not ( = ?auto_483802 ?auto_483803 ) ) ( not ( = ?auto_483802 ?auto_483804 ) ) ( not ( = ?auto_483802 ?auto_483805 ) ) ( not ( = ?auto_483803 ?auto_483804 ) ) ( not ( = ?auto_483803 ?auto_483805 ) ) ( not ( = ?auto_483804 ?auto_483805 ) ) ( CLEAR ?auto_483802 ) ( ON ?auto_483803 ?auto_483804 ) ( CLEAR ?auto_483803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_483802 ?auto_483803 )
      ( MAKE-3PILE ?auto_483802 ?auto_483803 ?auto_483804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_483816 - BLOCK
      ?auto_483817 - BLOCK
      ?auto_483818 - BLOCK
    )
    :vars
    (
      ?auto_483819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483818 ?auto_483819 ) ( not ( = ?auto_483816 ?auto_483817 ) ) ( not ( = ?auto_483816 ?auto_483818 ) ) ( not ( = ?auto_483816 ?auto_483819 ) ) ( not ( = ?auto_483817 ?auto_483818 ) ) ( not ( = ?auto_483817 ?auto_483819 ) ) ( not ( = ?auto_483818 ?auto_483819 ) ) ( ON ?auto_483817 ?auto_483818 ) ( ON ?auto_483816 ?auto_483817 ) ( CLEAR ?auto_483816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_483816 )
      ( MAKE-3PILE ?auto_483816 ?auto_483817 ?auto_483818 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_483831 - BLOCK
      ?auto_483832 - BLOCK
      ?auto_483833 - BLOCK
      ?auto_483834 - BLOCK
    )
    :vars
    (
      ?auto_483835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_483833 ) ( ON ?auto_483834 ?auto_483835 ) ( CLEAR ?auto_483834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_483831 ) ( ON ?auto_483832 ?auto_483831 ) ( ON ?auto_483833 ?auto_483832 ) ( not ( = ?auto_483831 ?auto_483832 ) ) ( not ( = ?auto_483831 ?auto_483833 ) ) ( not ( = ?auto_483831 ?auto_483834 ) ) ( not ( = ?auto_483831 ?auto_483835 ) ) ( not ( = ?auto_483832 ?auto_483833 ) ) ( not ( = ?auto_483832 ?auto_483834 ) ) ( not ( = ?auto_483832 ?auto_483835 ) ) ( not ( = ?auto_483833 ?auto_483834 ) ) ( not ( = ?auto_483833 ?auto_483835 ) ) ( not ( = ?auto_483834 ?auto_483835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_483834 ?auto_483835 )
      ( !STACK ?auto_483834 ?auto_483833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_483849 - BLOCK
      ?auto_483850 - BLOCK
      ?auto_483851 - BLOCK
      ?auto_483852 - BLOCK
    )
    :vars
    (
      ?auto_483853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483852 ?auto_483853 ) ( ON-TABLE ?auto_483849 ) ( ON ?auto_483850 ?auto_483849 ) ( not ( = ?auto_483849 ?auto_483850 ) ) ( not ( = ?auto_483849 ?auto_483851 ) ) ( not ( = ?auto_483849 ?auto_483852 ) ) ( not ( = ?auto_483849 ?auto_483853 ) ) ( not ( = ?auto_483850 ?auto_483851 ) ) ( not ( = ?auto_483850 ?auto_483852 ) ) ( not ( = ?auto_483850 ?auto_483853 ) ) ( not ( = ?auto_483851 ?auto_483852 ) ) ( not ( = ?auto_483851 ?auto_483853 ) ) ( not ( = ?auto_483852 ?auto_483853 ) ) ( CLEAR ?auto_483850 ) ( ON ?auto_483851 ?auto_483852 ) ( CLEAR ?auto_483851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_483849 ?auto_483850 ?auto_483851 )
      ( MAKE-4PILE ?auto_483849 ?auto_483850 ?auto_483851 ?auto_483852 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_483867 - BLOCK
      ?auto_483868 - BLOCK
      ?auto_483869 - BLOCK
      ?auto_483870 - BLOCK
    )
    :vars
    (
      ?auto_483871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483870 ?auto_483871 ) ( ON-TABLE ?auto_483867 ) ( not ( = ?auto_483867 ?auto_483868 ) ) ( not ( = ?auto_483867 ?auto_483869 ) ) ( not ( = ?auto_483867 ?auto_483870 ) ) ( not ( = ?auto_483867 ?auto_483871 ) ) ( not ( = ?auto_483868 ?auto_483869 ) ) ( not ( = ?auto_483868 ?auto_483870 ) ) ( not ( = ?auto_483868 ?auto_483871 ) ) ( not ( = ?auto_483869 ?auto_483870 ) ) ( not ( = ?auto_483869 ?auto_483871 ) ) ( not ( = ?auto_483870 ?auto_483871 ) ) ( ON ?auto_483869 ?auto_483870 ) ( CLEAR ?auto_483867 ) ( ON ?auto_483868 ?auto_483869 ) ( CLEAR ?auto_483868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_483867 ?auto_483868 )
      ( MAKE-4PILE ?auto_483867 ?auto_483868 ?auto_483869 ?auto_483870 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_483885 - BLOCK
      ?auto_483886 - BLOCK
      ?auto_483887 - BLOCK
      ?auto_483888 - BLOCK
    )
    :vars
    (
      ?auto_483889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483888 ?auto_483889 ) ( not ( = ?auto_483885 ?auto_483886 ) ) ( not ( = ?auto_483885 ?auto_483887 ) ) ( not ( = ?auto_483885 ?auto_483888 ) ) ( not ( = ?auto_483885 ?auto_483889 ) ) ( not ( = ?auto_483886 ?auto_483887 ) ) ( not ( = ?auto_483886 ?auto_483888 ) ) ( not ( = ?auto_483886 ?auto_483889 ) ) ( not ( = ?auto_483887 ?auto_483888 ) ) ( not ( = ?auto_483887 ?auto_483889 ) ) ( not ( = ?auto_483888 ?auto_483889 ) ) ( ON ?auto_483887 ?auto_483888 ) ( ON ?auto_483886 ?auto_483887 ) ( ON ?auto_483885 ?auto_483886 ) ( CLEAR ?auto_483885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_483885 )
      ( MAKE-4PILE ?auto_483885 ?auto_483886 ?auto_483887 ?auto_483888 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_483904 - BLOCK
      ?auto_483905 - BLOCK
      ?auto_483906 - BLOCK
      ?auto_483907 - BLOCK
      ?auto_483908 - BLOCK
    )
    :vars
    (
      ?auto_483909 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_483907 ) ( ON ?auto_483908 ?auto_483909 ) ( CLEAR ?auto_483908 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_483904 ) ( ON ?auto_483905 ?auto_483904 ) ( ON ?auto_483906 ?auto_483905 ) ( ON ?auto_483907 ?auto_483906 ) ( not ( = ?auto_483904 ?auto_483905 ) ) ( not ( = ?auto_483904 ?auto_483906 ) ) ( not ( = ?auto_483904 ?auto_483907 ) ) ( not ( = ?auto_483904 ?auto_483908 ) ) ( not ( = ?auto_483904 ?auto_483909 ) ) ( not ( = ?auto_483905 ?auto_483906 ) ) ( not ( = ?auto_483905 ?auto_483907 ) ) ( not ( = ?auto_483905 ?auto_483908 ) ) ( not ( = ?auto_483905 ?auto_483909 ) ) ( not ( = ?auto_483906 ?auto_483907 ) ) ( not ( = ?auto_483906 ?auto_483908 ) ) ( not ( = ?auto_483906 ?auto_483909 ) ) ( not ( = ?auto_483907 ?auto_483908 ) ) ( not ( = ?auto_483907 ?auto_483909 ) ) ( not ( = ?auto_483908 ?auto_483909 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_483908 ?auto_483909 )
      ( !STACK ?auto_483908 ?auto_483907 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_483926 - BLOCK
      ?auto_483927 - BLOCK
      ?auto_483928 - BLOCK
      ?auto_483929 - BLOCK
      ?auto_483930 - BLOCK
    )
    :vars
    (
      ?auto_483931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483930 ?auto_483931 ) ( ON-TABLE ?auto_483926 ) ( ON ?auto_483927 ?auto_483926 ) ( ON ?auto_483928 ?auto_483927 ) ( not ( = ?auto_483926 ?auto_483927 ) ) ( not ( = ?auto_483926 ?auto_483928 ) ) ( not ( = ?auto_483926 ?auto_483929 ) ) ( not ( = ?auto_483926 ?auto_483930 ) ) ( not ( = ?auto_483926 ?auto_483931 ) ) ( not ( = ?auto_483927 ?auto_483928 ) ) ( not ( = ?auto_483927 ?auto_483929 ) ) ( not ( = ?auto_483927 ?auto_483930 ) ) ( not ( = ?auto_483927 ?auto_483931 ) ) ( not ( = ?auto_483928 ?auto_483929 ) ) ( not ( = ?auto_483928 ?auto_483930 ) ) ( not ( = ?auto_483928 ?auto_483931 ) ) ( not ( = ?auto_483929 ?auto_483930 ) ) ( not ( = ?auto_483929 ?auto_483931 ) ) ( not ( = ?auto_483930 ?auto_483931 ) ) ( CLEAR ?auto_483928 ) ( ON ?auto_483929 ?auto_483930 ) ( CLEAR ?auto_483929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_483926 ?auto_483927 ?auto_483928 ?auto_483929 )
      ( MAKE-5PILE ?auto_483926 ?auto_483927 ?auto_483928 ?auto_483929 ?auto_483930 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_483948 - BLOCK
      ?auto_483949 - BLOCK
      ?auto_483950 - BLOCK
      ?auto_483951 - BLOCK
      ?auto_483952 - BLOCK
    )
    :vars
    (
      ?auto_483953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483952 ?auto_483953 ) ( ON-TABLE ?auto_483948 ) ( ON ?auto_483949 ?auto_483948 ) ( not ( = ?auto_483948 ?auto_483949 ) ) ( not ( = ?auto_483948 ?auto_483950 ) ) ( not ( = ?auto_483948 ?auto_483951 ) ) ( not ( = ?auto_483948 ?auto_483952 ) ) ( not ( = ?auto_483948 ?auto_483953 ) ) ( not ( = ?auto_483949 ?auto_483950 ) ) ( not ( = ?auto_483949 ?auto_483951 ) ) ( not ( = ?auto_483949 ?auto_483952 ) ) ( not ( = ?auto_483949 ?auto_483953 ) ) ( not ( = ?auto_483950 ?auto_483951 ) ) ( not ( = ?auto_483950 ?auto_483952 ) ) ( not ( = ?auto_483950 ?auto_483953 ) ) ( not ( = ?auto_483951 ?auto_483952 ) ) ( not ( = ?auto_483951 ?auto_483953 ) ) ( not ( = ?auto_483952 ?auto_483953 ) ) ( ON ?auto_483951 ?auto_483952 ) ( CLEAR ?auto_483949 ) ( ON ?auto_483950 ?auto_483951 ) ( CLEAR ?auto_483950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_483948 ?auto_483949 ?auto_483950 )
      ( MAKE-5PILE ?auto_483948 ?auto_483949 ?auto_483950 ?auto_483951 ?auto_483952 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_483970 - BLOCK
      ?auto_483971 - BLOCK
      ?auto_483972 - BLOCK
      ?auto_483973 - BLOCK
      ?auto_483974 - BLOCK
    )
    :vars
    (
      ?auto_483975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483974 ?auto_483975 ) ( ON-TABLE ?auto_483970 ) ( not ( = ?auto_483970 ?auto_483971 ) ) ( not ( = ?auto_483970 ?auto_483972 ) ) ( not ( = ?auto_483970 ?auto_483973 ) ) ( not ( = ?auto_483970 ?auto_483974 ) ) ( not ( = ?auto_483970 ?auto_483975 ) ) ( not ( = ?auto_483971 ?auto_483972 ) ) ( not ( = ?auto_483971 ?auto_483973 ) ) ( not ( = ?auto_483971 ?auto_483974 ) ) ( not ( = ?auto_483971 ?auto_483975 ) ) ( not ( = ?auto_483972 ?auto_483973 ) ) ( not ( = ?auto_483972 ?auto_483974 ) ) ( not ( = ?auto_483972 ?auto_483975 ) ) ( not ( = ?auto_483973 ?auto_483974 ) ) ( not ( = ?auto_483973 ?auto_483975 ) ) ( not ( = ?auto_483974 ?auto_483975 ) ) ( ON ?auto_483973 ?auto_483974 ) ( ON ?auto_483972 ?auto_483973 ) ( CLEAR ?auto_483970 ) ( ON ?auto_483971 ?auto_483972 ) ( CLEAR ?auto_483971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_483970 ?auto_483971 )
      ( MAKE-5PILE ?auto_483970 ?auto_483971 ?auto_483972 ?auto_483973 ?auto_483974 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_483992 - BLOCK
      ?auto_483993 - BLOCK
      ?auto_483994 - BLOCK
      ?auto_483995 - BLOCK
      ?auto_483996 - BLOCK
    )
    :vars
    (
      ?auto_483997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_483996 ?auto_483997 ) ( not ( = ?auto_483992 ?auto_483993 ) ) ( not ( = ?auto_483992 ?auto_483994 ) ) ( not ( = ?auto_483992 ?auto_483995 ) ) ( not ( = ?auto_483992 ?auto_483996 ) ) ( not ( = ?auto_483992 ?auto_483997 ) ) ( not ( = ?auto_483993 ?auto_483994 ) ) ( not ( = ?auto_483993 ?auto_483995 ) ) ( not ( = ?auto_483993 ?auto_483996 ) ) ( not ( = ?auto_483993 ?auto_483997 ) ) ( not ( = ?auto_483994 ?auto_483995 ) ) ( not ( = ?auto_483994 ?auto_483996 ) ) ( not ( = ?auto_483994 ?auto_483997 ) ) ( not ( = ?auto_483995 ?auto_483996 ) ) ( not ( = ?auto_483995 ?auto_483997 ) ) ( not ( = ?auto_483996 ?auto_483997 ) ) ( ON ?auto_483995 ?auto_483996 ) ( ON ?auto_483994 ?auto_483995 ) ( ON ?auto_483993 ?auto_483994 ) ( ON ?auto_483992 ?auto_483993 ) ( CLEAR ?auto_483992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_483992 )
      ( MAKE-5PILE ?auto_483992 ?auto_483993 ?auto_483994 ?auto_483995 ?auto_483996 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_484015 - BLOCK
      ?auto_484016 - BLOCK
      ?auto_484017 - BLOCK
      ?auto_484018 - BLOCK
      ?auto_484019 - BLOCK
      ?auto_484020 - BLOCK
    )
    :vars
    (
      ?auto_484021 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_484019 ) ( ON ?auto_484020 ?auto_484021 ) ( CLEAR ?auto_484020 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_484015 ) ( ON ?auto_484016 ?auto_484015 ) ( ON ?auto_484017 ?auto_484016 ) ( ON ?auto_484018 ?auto_484017 ) ( ON ?auto_484019 ?auto_484018 ) ( not ( = ?auto_484015 ?auto_484016 ) ) ( not ( = ?auto_484015 ?auto_484017 ) ) ( not ( = ?auto_484015 ?auto_484018 ) ) ( not ( = ?auto_484015 ?auto_484019 ) ) ( not ( = ?auto_484015 ?auto_484020 ) ) ( not ( = ?auto_484015 ?auto_484021 ) ) ( not ( = ?auto_484016 ?auto_484017 ) ) ( not ( = ?auto_484016 ?auto_484018 ) ) ( not ( = ?auto_484016 ?auto_484019 ) ) ( not ( = ?auto_484016 ?auto_484020 ) ) ( not ( = ?auto_484016 ?auto_484021 ) ) ( not ( = ?auto_484017 ?auto_484018 ) ) ( not ( = ?auto_484017 ?auto_484019 ) ) ( not ( = ?auto_484017 ?auto_484020 ) ) ( not ( = ?auto_484017 ?auto_484021 ) ) ( not ( = ?auto_484018 ?auto_484019 ) ) ( not ( = ?auto_484018 ?auto_484020 ) ) ( not ( = ?auto_484018 ?auto_484021 ) ) ( not ( = ?auto_484019 ?auto_484020 ) ) ( not ( = ?auto_484019 ?auto_484021 ) ) ( not ( = ?auto_484020 ?auto_484021 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_484020 ?auto_484021 )
      ( !STACK ?auto_484020 ?auto_484019 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_484041 - BLOCK
      ?auto_484042 - BLOCK
      ?auto_484043 - BLOCK
      ?auto_484044 - BLOCK
      ?auto_484045 - BLOCK
      ?auto_484046 - BLOCK
    )
    :vars
    (
      ?auto_484047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484046 ?auto_484047 ) ( ON-TABLE ?auto_484041 ) ( ON ?auto_484042 ?auto_484041 ) ( ON ?auto_484043 ?auto_484042 ) ( ON ?auto_484044 ?auto_484043 ) ( not ( = ?auto_484041 ?auto_484042 ) ) ( not ( = ?auto_484041 ?auto_484043 ) ) ( not ( = ?auto_484041 ?auto_484044 ) ) ( not ( = ?auto_484041 ?auto_484045 ) ) ( not ( = ?auto_484041 ?auto_484046 ) ) ( not ( = ?auto_484041 ?auto_484047 ) ) ( not ( = ?auto_484042 ?auto_484043 ) ) ( not ( = ?auto_484042 ?auto_484044 ) ) ( not ( = ?auto_484042 ?auto_484045 ) ) ( not ( = ?auto_484042 ?auto_484046 ) ) ( not ( = ?auto_484042 ?auto_484047 ) ) ( not ( = ?auto_484043 ?auto_484044 ) ) ( not ( = ?auto_484043 ?auto_484045 ) ) ( not ( = ?auto_484043 ?auto_484046 ) ) ( not ( = ?auto_484043 ?auto_484047 ) ) ( not ( = ?auto_484044 ?auto_484045 ) ) ( not ( = ?auto_484044 ?auto_484046 ) ) ( not ( = ?auto_484044 ?auto_484047 ) ) ( not ( = ?auto_484045 ?auto_484046 ) ) ( not ( = ?auto_484045 ?auto_484047 ) ) ( not ( = ?auto_484046 ?auto_484047 ) ) ( CLEAR ?auto_484044 ) ( ON ?auto_484045 ?auto_484046 ) ( CLEAR ?auto_484045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_484041 ?auto_484042 ?auto_484043 ?auto_484044 ?auto_484045 )
      ( MAKE-6PILE ?auto_484041 ?auto_484042 ?auto_484043 ?auto_484044 ?auto_484045 ?auto_484046 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_484067 - BLOCK
      ?auto_484068 - BLOCK
      ?auto_484069 - BLOCK
      ?auto_484070 - BLOCK
      ?auto_484071 - BLOCK
      ?auto_484072 - BLOCK
    )
    :vars
    (
      ?auto_484073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484072 ?auto_484073 ) ( ON-TABLE ?auto_484067 ) ( ON ?auto_484068 ?auto_484067 ) ( ON ?auto_484069 ?auto_484068 ) ( not ( = ?auto_484067 ?auto_484068 ) ) ( not ( = ?auto_484067 ?auto_484069 ) ) ( not ( = ?auto_484067 ?auto_484070 ) ) ( not ( = ?auto_484067 ?auto_484071 ) ) ( not ( = ?auto_484067 ?auto_484072 ) ) ( not ( = ?auto_484067 ?auto_484073 ) ) ( not ( = ?auto_484068 ?auto_484069 ) ) ( not ( = ?auto_484068 ?auto_484070 ) ) ( not ( = ?auto_484068 ?auto_484071 ) ) ( not ( = ?auto_484068 ?auto_484072 ) ) ( not ( = ?auto_484068 ?auto_484073 ) ) ( not ( = ?auto_484069 ?auto_484070 ) ) ( not ( = ?auto_484069 ?auto_484071 ) ) ( not ( = ?auto_484069 ?auto_484072 ) ) ( not ( = ?auto_484069 ?auto_484073 ) ) ( not ( = ?auto_484070 ?auto_484071 ) ) ( not ( = ?auto_484070 ?auto_484072 ) ) ( not ( = ?auto_484070 ?auto_484073 ) ) ( not ( = ?auto_484071 ?auto_484072 ) ) ( not ( = ?auto_484071 ?auto_484073 ) ) ( not ( = ?auto_484072 ?auto_484073 ) ) ( ON ?auto_484071 ?auto_484072 ) ( CLEAR ?auto_484069 ) ( ON ?auto_484070 ?auto_484071 ) ( CLEAR ?auto_484070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_484067 ?auto_484068 ?auto_484069 ?auto_484070 )
      ( MAKE-6PILE ?auto_484067 ?auto_484068 ?auto_484069 ?auto_484070 ?auto_484071 ?auto_484072 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_484093 - BLOCK
      ?auto_484094 - BLOCK
      ?auto_484095 - BLOCK
      ?auto_484096 - BLOCK
      ?auto_484097 - BLOCK
      ?auto_484098 - BLOCK
    )
    :vars
    (
      ?auto_484099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484098 ?auto_484099 ) ( ON-TABLE ?auto_484093 ) ( ON ?auto_484094 ?auto_484093 ) ( not ( = ?auto_484093 ?auto_484094 ) ) ( not ( = ?auto_484093 ?auto_484095 ) ) ( not ( = ?auto_484093 ?auto_484096 ) ) ( not ( = ?auto_484093 ?auto_484097 ) ) ( not ( = ?auto_484093 ?auto_484098 ) ) ( not ( = ?auto_484093 ?auto_484099 ) ) ( not ( = ?auto_484094 ?auto_484095 ) ) ( not ( = ?auto_484094 ?auto_484096 ) ) ( not ( = ?auto_484094 ?auto_484097 ) ) ( not ( = ?auto_484094 ?auto_484098 ) ) ( not ( = ?auto_484094 ?auto_484099 ) ) ( not ( = ?auto_484095 ?auto_484096 ) ) ( not ( = ?auto_484095 ?auto_484097 ) ) ( not ( = ?auto_484095 ?auto_484098 ) ) ( not ( = ?auto_484095 ?auto_484099 ) ) ( not ( = ?auto_484096 ?auto_484097 ) ) ( not ( = ?auto_484096 ?auto_484098 ) ) ( not ( = ?auto_484096 ?auto_484099 ) ) ( not ( = ?auto_484097 ?auto_484098 ) ) ( not ( = ?auto_484097 ?auto_484099 ) ) ( not ( = ?auto_484098 ?auto_484099 ) ) ( ON ?auto_484097 ?auto_484098 ) ( ON ?auto_484096 ?auto_484097 ) ( CLEAR ?auto_484094 ) ( ON ?auto_484095 ?auto_484096 ) ( CLEAR ?auto_484095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_484093 ?auto_484094 ?auto_484095 )
      ( MAKE-6PILE ?auto_484093 ?auto_484094 ?auto_484095 ?auto_484096 ?auto_484097 ?auto_484098 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_484119 - BLOCK
      ?auto_484120 - BLOCK
      ?auto_484121 - BLOCK
      ?auto_484122 - BLOCK
      ?auto_484123 - BLOCK
      ?auto_484124 - BLOCK
    )
    :vars
    (
      ?auto_484125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484124 ?auto_484125 ) ( ON-TABLE ?auto_484119 ) ( not ( = ?auto_484119 ?auto_484120 ) ) ( not ( = ?auto_484119 ?auto_484121 ) ) ( not ( = ?auto_484119 ?auto_484122 ) ) ( not ( = ?auto_484119 ?auto_484123 ) ) ( not ( = ?auto_484119 ?auto_484124 ) ) ( not ( = ?auto_484119 ?auto_484125 ) ) ( not ( = ?auto_484120 ?auto_484121 ) ) ( not ( = ?auto_484120 ?auto_484122 ) ) ( not ( = ?auto_484120 ?auto_484123 ) ) ( not ( = ?auto_484120 ?auto_484124 ) ) ( not ( = ?auto_484120 ?auto_484125 ) ) ( not ( = ?auto_484121 ?auto_484122 ) ) ( not ( = ?auto_484121 ?auto_484123 ) ) ( not ( = ?auto_484121 ?auto_484124 ) ) ( not ( = ?auto_484121 ?auto_484125 ) ) ( not ( = ?auto_484122 ?auto_484123 ) ) ( not ( = ?auto_484122 ?auto_484124 ) ) ( not ( = ?auto_484122 ?auto_484125 ) ) ( not ( = ?auto_484123 ?auto_484124 ) ) ( not ( = ?auto_484123 ?auto_484125 ) ) ( not ( = ?auto_484124 ?auto_484125 ) ) ( ON ?auto_484123 ?auto_484124 ) ( ON ?auto_484122 ?auto_484123 ) ( ON ?auto_484121 ?auto_484122 ) ( CLEAR ?auto_484119 ) ( ON ?auto_484120 ?auto_484121 ) ( CLEAR ?auto_484120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_484119 ?auto_484120 )
      ( MAKE-6PILE ?auto_484119 ?auto_484120 ?auto_484121 ?auto_484122 ?auto_484123 ?auto_484124 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_484145 - BLOCK
      ?auto_484146 - BLOCK
      ?auto_484147 - BLOCK
      ?auto_484148 - BLOCK
      ?auto_484149 - BLOCK
      ?auto_484150 - BLOCK
    )
    :vars
    (
      ?auto_484151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484150 ?auto_484151 ) ( not ( = ?auto_484145 ?auto_484146 ) ) ( not ( = ?auto_484145 ?auto_484147 ) ) ( not ( = ?auto_484145 ?auto_484148 ) ) ( not ( = ?auto_484145 ?auto_484149 ) ) ( not ( = ?auto_484145 ?auto_484150 ) ) ( not ( = ?auto_484145 ?auto_484151 ) ) ( not ( = ?auto_484146 ?auto_484147 ) ) ( not ( = ?auto_484146 ?auto_484148 ) ) ( not ( = ?auto_484146 ?auto_484149 ) ) ( not ( = ?auto_484146 ?auto_484150 ) ) ( not ( = ?auto_484146 ?auto_484151 ) ) ( not ( = ?auto_484147 ?auto_484148 ) ) ( not ( = ?auto_484147 ?auto_484149 ) ) ( not ( = ?auto_484147 ?auto_484150 ) ) ( not ( = ?auto_484147 ?auto_484151 ) ) ( not ( = ?auto_484148 ?auto_484149 ) ) ( not ( = ?auto_484148 ?auto_484150 ) ) ( not ( = ?auto_484148 ?auto_484151 ) ) ( not ( = ?auto_484149 ?auto_484150 ) ) ( not ( = ?auto_484149 ?auto_484151 ) ) ( not ( = ?auto_484150 ?auto_484151 ) ) ( ON ?auto_484149 ?auto_484150 ) ( ON ?auto_484148 ?auto_484149 ) ( ON ?auto_484147 ?auto_484148 ) ( ON ?auto_484146 ?auto_484147 ) ( ON ?auto_484145 ?auto_484146 ) ( CLEAR ?auto_484145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_484145 )
      ( MAKE-6PILE ?auto_484145 ?auto_484146 ?auto_484147 ?auto_484148 ?auto_484149 ?auto_484150 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_484172 - BLOCK
      ?auto_484173 - BLOCK
      ?auto_484174 - BLOCK
      ?auto_484175 - BLOCK
      ?auto_484176 - BLOCK
      ?auto_484177 - BLOCK
      ?auto_484178 - BLOCK
    )
    :vars
    (
      ?auto_484179 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_484177 ) ( ON ?auto_484178 ?auto_484179 ) ( CLEAR ?auto_484178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_484172 ) ( ON ?auto_484173 ?auto_484172 ) ( ON ?auto_484174 ?auto_484173 ) ( ON ?auto_484175 ?auto_484174 ) ( ON ?auto_484176 ?auto_484175 ) ( ON ?auto_484177 ?auto_484176 ) ( not ( = ?auto_484172 ?auto_484173 ) ) ( not ( = ?auto_484172 ?auto_484174 ) ) ( not ( = ?auto_484172 ?auto_484175 ) ) ( not ( = ?auto_484172 ?auto_484176 ) ) ( not ( = ?auto_484172 ?auto_484177 ) ) ( not ( = ?auto_484172 ?auto_484178 ) ) ( not ( = ?auto_484172 ?auto_484179 ) ) ( not ( = ?auto_484173 ?auto_484174 ) ) ( not ( = ?auto_484173 ?auto_484175 ) ) ( not ( = ?auto_484173 ?auto_484176 ) ) ( not ( = ?auto_484173 ?auto_484177 ) ) ( not ( = ?auto_484173 ?auto_484178 ) ) ( not ( = ?auto_484173 ?auto_484179 ) ) ( not ( = ?auto_484174 ?auto_484175 ) ) ( not ( = ?auto_484174 ?auto_484176 ) ) ( not ( = ?auto_484174 ?auto_484177 ) ) ( not ( = ?auto_484174 ?auto_484178 ) ) ( not ( = ?auto_484174 ?auto_484179 ) ) ( not ( = ?auto_484175 ?auto_484176 ) ) ( not ( = ?auto_484175 ?auto_484177 ) ) ( not ( = ?auto_484175 ?auto_484178 ) ) ( not ( = ?auto_484175 ?auto_484179 ) ) ( not ( = ?auto_484176 ?auto_484177 ) ) ( not ( = ?auto_484176 ?auto_484178 ) ) ( not ( = ?auto_484176 ?auto_484179 ) ) ( not ( = ?auto_484177 ?auto_484178 ) ) ( not ( = ?auto_484177 ?auto_484179 ) ) ( not ( = ?auto_484178 ?auto_484179 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_484178 ?auto_484179 )
      ( !STACK ?auto_484178 ?auto_484177 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_484202 - BLOCK
      ?auto_484203 - BLOCK
      ?auto_484204 - BLOCK
      ?auto_484205 - BLOCK
      ?auto_484206 - BLOCK
      ?auto_484207 - BLOCK
      ?auto_484208 - BLOCK
    )
    :vars
    (
      ?auto_484209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484208 ?auto_484209 ) ( ON-TABLE ?auto_484202 ) ( ON ?auto_484203 ?auto_484202 ) ( ON ?auto_484204 ?auto_484203 ) ( ON ?auto_484205 ?auto_484204 ) ( ON ?auto_484206 ?auto_484205 ) ( not ( = ?auto_484202 ?auto_484203 ) ) ( not ( = ?auto_484202 ?auto_484204 ) ) ( not ( = ?auto_484202 ?auto_484205 ) ) ( not ( = ?auto_484202 ?auto_484206 ) ) ( not ( = ?auto_484202 ?auto_484207 ) ) ( not ( = ?auto_484202 ?auto_484208 ) ) ( not ( = ?auto_484202 ?auto_484209 ) ) ( not ( = ?auto_484203 ?auto_484204 ) ) ( not ( = ?auto_484203 ?auto_484205 ) ) ( not ( = ?auto_484203 ?auto_484206 ) ) ( not ( = ?auto_484203 ?auto_484207 ) ) ( not ( = ?auto_484203 ?auto_484208 ) ) ( not ( = ?auto_484203 ?auto_484209 ) ) ( not ( = ?auto_484204 ?auto_484205 ) ) ( not ( = ?auto_484204 ?auto_484206 ) ) ( not ( = ?auto_484204 ?auto_484207 ) ) ( not ( = ?auto_484204 ?auto_484208 ) ) ( not ( = ?auto_484204 ?auto_484209 ) ) ( not ( = ?auto_484205 ?auto_484206 ) ) ( not ( = ?auto_484205 ?auto_484207 ) ) ( not ( = ?auto_484205 ?auto_484208 ) ) ( not ( = ?auto_484205 ?auto_484209 ) ) ( not ( = ?auto_484206 ?auto_484207 ) ) ( not ( = ?auto_484206 ?auto_484208 ) ) ( not ( = ?auto_484206 ?auto_484209 ) ) ( not ( = ?auto_484207 ?auto_484208 ) ) ( not ( = ?auto_484207 ?auto_484209 ) ) ( not ( = ?auto_484208 ?auto_484209 ) ) ( CLEAR ?auto_484206 ) ( ON ?auto_484207 ?auto_484208 ) ( CLEAR ?auto_484207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_484202 ?auto_484203 ?auto_484204 ?auto_484205 ?auto_484206 ?auto_484207 )
      ( MAKE-7PILE ?auto_484202 ?auto_484203 ?auto_484204 ?auto_484205 ?auto_484206 ?auto_484207 ?auto_484208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_484232 - BLOCK
      ?auto_484233 - BLOCK
      ?auto_484234 - BLOCK
      ?auto_484235 - BLOCK
      ?auto_484236 - BLOCK
      ?auto_484237 - BLOCK
      ?auto_484238 - BLOCK
    )
    :vars
    (
      ?auto_484239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484238 ?auto_484239 ) ( ON-TABLE ?auto_484232 ) ( ON ?auto_484233 ?auto_484232 ) ( ON ?auto_484234 ?auto_484233 ) ( ON ?auto_484235 ?auto_484234 ) ( not ( = ?auto_484232 ?auto_484233 ) ) ( not ( = ?auto_484232 ?auto_484234 ) ) ( not ( = ?auto_484232 ?auto_484235 ) ) ( not ( = ?auto_484232 ?auto_484236 ) ) ( not ( = ?auto_484232 ?auto_484237 ) ) ( not ( = ?auto_484232 ?auto_484238 ) ) ( not ( = ?auto_484232 ?auto_484239 ) ) ( not ( = ?auto_484233 ?auto_484234 ) ) ( not ( = ?auto_484233 ?auto_484235 ) ) ( not ( = ?auto_484233 ?auto_484236 ) ) ( not ( = ?auto_484233 ?auto_484237 ) ) ( not ( = ?auto_484233 ?auto_484238 ) ) ( not ( = ?auto_484233 ?auto_484239 ) ) ( not ( = ?auto_484234 ?auto_484235 ) ) ( not ( = ?auto_484234 ?auto_484236 ) ) ( not ( = ?auto_484234 ?auto_484237 ) ) ( not ( = ?auto_484234 ?auto_484238 ) ) ( not ( = ?auto_484234 ?auto_484239 ) ) ( not ( = ?auto_484235 ?auto_484236 ) ) ( not ( = ?auto_484235 ?auto_484237 ) ) ( not ( = ?auto_484235 ?auto_484238 ) ) ( not ( = ?auto_484235 ?auto_484239 ) ) ( not ( = ?auto_484236 ?auto_484237 ) ) ( not ( = ?auto_484236 ?auto_484238 ) ) ( not ( = ?auto_484236 ?auto_484239 ) ) ( not ( = ?auto_484237 ?auto_484238 ) ) ( not ( = ?auto_484237 ?auto_484239 ) ) ( not ( = ?auto_484238 ?auto_484239 ) ) ( ON ?auto_484237 ?auto_484238 ) ( CLEAR ?auto_484235 ) ( ON ?auto_484236 ?auto_484237 ) ( CLEAR ?auto_484236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_484232 ?auto_484233 ?auto_484234 ?auto_484235 ?auto_484236 )
      ( MAKE-7PILE ?auto_484232 ?auto_484233 ?auto_484234 ?auto_484235 ?auto_484236 ?auto_484237 ?auto_484238 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_484262 - BLOCK
      ?auto_484263 - BLOCK
      ?auto_484264 - BLOCK
      ?auto_484265 - BLOCK
      ?auto_484266 - BLOCK
      ?auto_484267 - BLOCK
      ?auto_484268 - BLOCK
    )
    :vars
    (
      ?auto_484269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484268 ?auto_484269 ) ( ON-TABLE ?auto_484262 ) ( ON ?auto_484263 ?auto_484262 ) ( ON ?auto_484264 ?auto_484263 ) ( not ( = ?auto_484262 ?auto_484263 ) ) ( not ( = ?auto_484262 ?auto_484264 ) ) ( not ( = ?auto_484262 ?auto_484265 ) ) ( not ( = ?auto_484262 ?auto_484266 ) ) ( not ( = ?auto_484262 ?auto_484267 ) ) ( not ( = ?auto_484262 ?auto_484268 ) ) ( not ( = ?auto_484262 ?auto_484269 ) ) ( not ( = ?auto_484263 ?auto_484264 ) ) ( not ( = ?auto_484263 ?auto_484265 ) ) ( not ( = ?auto_484263 ?auto_484266 ) ) ( not ( = ?auto_484263 ?auto_484267 ) ) ( not ( = ?auto_484263 ?auto_484268 ) ) ( not ( = ?auto_484263 ?auto_484269 ) ) ( not ( = ?auto_484264 ?auto_484265 ) ) ( not ( = ?auto_484264 ?auto_484266 ) ) ( not ( = ?auto_484264 ?auto_484267 ) ) ( not ( = ?auto_484264 ?auto_484268 ) ) ( not ( = ?auto_484264 ?auto_484269 ) ) ( not ( = ?auto_484265 ?auto_484266 ) ) ( not ( = ?auto_484265 ?auto_484267 ) ) ( not ( = ?auto_484265 ?auto_484268 ) ) ( not ( = ?auto_484265 ?auto_484269 ) ) ( not ( = ?auto_484266 ?auto_484267 ) ) ( not ( = ?auto_484266 ?auto_484268 ) ) ( not ( = ?auto_484266 ?auto_484269 ) ) ( not ( = ?auto_484267 ?auto_484268 ) ) ( not ( = ?auto_484267 ?auto_484269 ) ) ( not ( = ?auto_484268 ?auto_484269 ) ) ( ON ?auto_484267 ?auto_484268 ) ( ON ?auto_484266 ?auto_484267 ) ( CLEAR ?auto_484264 ) ( ON ?auto_484265 ?auto_484266 ) ( CLEAR ?auto_484265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_484262 ?auto_484263 ?auto_484264 ?auto_484265 )
      ( MAKE-7PILE ?auto_484262 ?auto_484263 ?auto_484264 ?auto_484265 ?auto_484266 ?auto_484267 ?auto_484268 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_484292 - BLOCK
      ?auto_484293 - BLOCK
      ?auto_484294 - BLOCK
      ?auto_484295 - BLOCK
      ?auto_484296 - BLOCK
      ?auto_484297 - BLOCK
      ?auto_484298 - BLOCK
    )
    :vars
    (
      ?auto_484299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484298 ?auto_484299 ) ( ON-TABLE ?auto_484292 ) ( ON ?auto_484293 ?auto_484292 ) ( not ( = ?auto_484292 ?auto_484293 ) ) ( not ( = ?auto_484292 ?auto_484294 ) ) ( not ( = ?auto_484292 ?auto_484295 ) ) ( not ( = ?auto_484292 ?auto_484296 ) ) ( not ( = ?auto_484292 ?auto_484297 ) ) ( not ( = ?auto_484292 ?auto_484298 ) ) ( not ( = ?auto_484292 ?auto_484299 ) ) ( not ( = ?auto_484293 ?auto_484294 ) ) ( not ( = ?auto_484293 ?auto_484295 ) ) ( not ( = ?auto_484293 ?auto_484296 ) ) ( not ( = ?auto_484293 ?auto_484297 ) ) ( not ( = ?auto_484293 ?auto_484298 ) ) ( not ( = ?auto_484293 ?auto_484299 ) ) ( not ( = ?auto_484294 ?auto_484295 ) ) ( not ( = ?auto_484294 ?auto_484296 ) ) ( not ( = ?auto_484294 ?auto_484297 ) ) ( not ( = ?auto_484294 ?auto_484298 ) ) ( not ( = ?auto_484294 ?auto_484299 ) ) ( not ( = ?auto_484295 ?auto_484296 ) ) ( not ( = ?auto_484295 ?auto_484297 ) ) ( not ( = ?auto_484295 ?auto_484298 ) ) ( not ( = ?auto_484295 ?auto_484299 ) ) ( not ( = ?auto_484296 ?auto_484297 ) ) ( not ( = ?auto_484296 ?auto_484298 ) ) ( not ( = ?auto_484296 ?auto_484299 ) ) ( not ( = ?auto_484297 ?auto_484298 ) ) ( not ( = ?auto_484297 ?auto_484299 ) ) ( not ( = ?auto_484298 ?auto_484299 ) ) ( ON ?auto_484297 ?auto_484298 ) ( ON ?auto_484296 ?auto_484297 ) ( ON ?auto_484295 ?auto_484296 ) ( CLEAR ?auto_484293 ) ( ON ?auto_484294 ?auto_484295 ) ( CLEAR ?auto_484294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_484292 ?auto_484293 ?auto_484294 )
      ( MAKE-7PILE ?auto_484292 ?auto_484293 ?auto_484294 ?auto_484295 ?auto_484296 ?auto_484297 ?auto_484298 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_484322 - BLOCK
      ?auto_484323 - BLOCK
      ?auto_484324 - BLOCK
      ?auto_484325 - BLOCK
      ?auto_484326 - BLOCK
      ?auto_484327 - BLOCK
      ?auto_484328 - BLOCK
    )
    :vars
    (
      ?auto_484329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484328 ?auto_484329 ) ( ON-TABLE ?auto_484322 ) ( not ( = ?auto_484322 ?auto_484323 ) ) ( not ( = ?auto_484322 ?auto_484324 ) ) ( not ( = ?auto_484322 ?auto_484325 ) ) ( not ( = ?auto_484322 ?auto_484326 ) ) ( not ( = ?auto_484322 ?auto_484327 ) ) ( not ( = ?auto_484322 ?auto_484328 ) ) ( not ( = ?auto_484322 ?auto_484329 ) ) ( not ( = ?auto_484323 ?auto_484324 ) ) ( not ( = ?auto_484323 ?auto_484325 ) ) ( not ( = ?auto_484323 ?auto_484326 ) ) ( not ( = ?auto_484323 ?auto_484327 ) ) ( not ( = ?auto_484323 ?auto_484328 ) ) ( not ( = ?auto_484323 ?auto_484329 ) ) ( not ( = ?auto_484324 ?auto_484325 ) ) ( not ( = ?auto_484324 ?auto_484326 ) ) ( not ( = ?auto_484324 ?auto_484327 ) ) ( not ( = ?auto_484324 ?auto_484328 ) ) ( not ( = ?auto_484324 ?auto_484329 ) ) ( not ( = ?auto_484325 ?auto_484326 ) ) ( not ( = ?auto_484325 ?auto_484327 ) ) ( not ( = ?auto_484325 ?auto_484328 ) ) ( not ( = ?auto_484325 ?auto_484329 ) ) ( not ( = ?auto_484326 ?auto_484327 ) ) ( not ( = ?auto_484326 ?auto_484328 ) ) ( not ( = ?auto_484326 ?auto_484329 ) ) ( not ( = ?auto_484327 ?auto_484328 ) ) ( not ( = ?auto_484327 ?auto_484329 ) ) ( not ( = ?auto_484328 ?auto_484329 ) ) ( ON ?auto_484327 ?auto_484328 ) ( ON ?auto_484326 ?auto_484327 ) ( ON ?auto_484325 ?auto_484326 ) ( ON ?auto_484324 ?auto_484325 ) ( CLEAR ?auto_484322 ) ( ON ?auto_484323 ?auto_484324 ) ( CLEAR ?auto_484323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_484322 ?auto_484323 )
      ( MAKE-7PILE ?auto_484322 ?auto_484323 ?auto_484324 ?auto_484325 ?auto_484326 ?auto_484327 ?auto_484328 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_484352 - BLOCK
      ?auto_484353 - BLOCK
      ?auto_484354 - BLOCK
      ?auto_484355 - BLOCK
      ?auto_484356 - BLOCK
      ?auto_484357 - BLOCK
      ?auto_484358 - BLOCK
    )
    :vars
    (
      ?auto_484359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484358 ?auto_484359 ) ( not ( = ?auto_484352 ?auto_484353 ) ) ( not ( = ?auto_484352 ?auto_484354 ) ) ( not ( = ?auto_484352 ?auto_484355 ) ) ( not ( = ?auto_484352 ?auto_484356 ) ) ( not ( = ?auto_484352 ?auto_484357 ) ) ( not ( = ?auto_484352 ?auto_484358 ) ) ( not ( = ?auto_484352 ?auto_484359 ) ) ( not ( = ?auto_484353 ?auto_484354 ) ) ( not ( = ?auto_484353 ?auto_484355 ) ) ( not ( = ?auto_484353 ?auto_484356 ) ) ( not ( = ?auto_484353 ?auto_484357 ) ) ( not ( = ?auto_484353 ?auto_484358 ) ) ( not ( = ?auto_484353 ?auto_484359 ) ) ( not ( = ?auto_484354 ?auto_484355 ) ) ( not ( = ?auto_484354 ?auto_484356 ) ) ( not ( = ?auto_484354 ?auto_484357 ) ) ( not ( = ?auto_484354 ?auto_484358 ) ) ( not ( = ?auto_484354 ?auto_484359 ) ) ( not ( = ?auto_484355 ?auto_484356 ) ) ( not ( = ?auto_484355 ?auto_484357 ) ) ( not ( = ?auto_484355 ?auto_484358 ) ) ( not ( = ?auto_484355 ?auto_484359 ) ) ( not ( = ?auto_484356 ?auto_484357 ) ) ( not ( = ?auto_484356 ?auto_484358 ) ) ( not ( = ?auto_484356 ?auto_484359 ) ) ( not ( = ?auto_484357 ?auto_484358 ) ) ( not ( = ?auto_484357 ?auto_484359 ) ) ( not ( = ?auto_484358 ?auto_484359 ) ) ( ON ?auto_484357 ?auto_484358 ) ( ON ?auto_484356 ?auto_484357 ) ( ON ?auto_484355 ?auto_484356 ) ( ON ?auto_484354 ?auto_484355 ) ( ON ?auto_484353 ?auto_484354 ) ( ON ?auto_484352 ?auto_484353 ) ( CLEAR ?auto_484352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_484352 )
      ( MAKE-7PILE ?auto_484352 ?auto_484353 ?auto_484354 ?auto_484355 ?auto_484356 ?auto_484357 ?auto_484358 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_484383 - BLOCK
      ?auto_484384 - BLOCK
      ?auto_484385 - BLOCK
      ?auto_484386 - BLOCK
      ?auto_484387 - BLOCK
      ?auto_484388 - BLOCK
      ?auto_484389 - BLOCK
      ?auto_484390 - BLOCK
    )
    :vars
    (
      ?auto_484391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_484389 ) ( ON ?auto_484390 ?auto_484391 ) ( CLEAR ?auto_484390 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_484383 ) ( ON ?auto_484384 ?auto_484383 ) ( ON ?auto_484385 ?auto_484384 ) ( ON ?auto_484386 ?auto_484385 ) ( ON ?auto_484387 ?auto_484386 ) ( ON ?auto_484388 ?auto_484387 ) ( ON ?auto_484389 ?auto_484388 ) ( not ( = ?auto_484383 ?auto_484384 ) ) ( not ( = ?auto_484383 ?auto_484385 ) ) ( not ( = ?auto_484383 ?auto_484386 ) ) ( not ( = ?auto_484383 ?auto_484387 ) ) ( not ( = ?auto_484383 ?auto_484388 ) ) ( not ( = ?auto_484383 ?auto_484389 ) ) ( not ( = ?auto_484383 ?auto_484390 ) ) ( not ( = ?auto_484383 ?auto_484391 ) ) ( not ( = ?auto_484384 ?auto_484385 ) ) ( not ( = ?auto_484384 ?auto_484386 ) ) ( not ( = ?auto_484384 ?auto_484387 ) ) ( not ( = ?auto_484384 ?auto_484388 ) ) ( not ( = ?auto_484384 ?auto_484389 ) ) ( not ( = ?auto_484384 ?auto_484390 ) ) ( not ( = ?auto_484384 ?auto_484391 ) ) ( not ( = ?auto_484385 ?auto_484386 ) ) ( not ( = ?auto_484385 ?auto_484387 ) ) ( not ( = ?auto_484385 ?auto_484388 ) ) ( not ( = ?auto_484385 ?auto_484389 ) ) ( not ( = ?auto_484385 ?auto_484390 ) ) ( not ( = ?auto_484385 ?auto_484391 ) ) ( not ( = ?auto_484386 ?auto_484387 ) ) ( not ( = ?auto_484386 ?auto_484388 ) ) ( not ( = ?auto_484386 ?auto_484389 ) ) ( not ( = ?auto_484386 ?auto_484390 ) ) ( not ( = ?auto_484386 ?auto_484391 ) ) ( not ( = ?auto_484387 ?auto_484388 ) ) ( not ( = ?auto_484387 ?auto_484389 ) ) ( not ( = ?auto_484387 ?auto_484390 ) ) ( not ( = ?auto_484387 ?auto_484391 ) ) ( not ( = ?auto_484388 ?auto_484389 ) ) ( not ( = ?auto_484388 ?auto_484390 ) ) ( not ( = ?auto_484388 ?auto_484391 ) ) ( not ( = ?auto_484389 ?auto_484390 ) ) ( not ( = ?auto_484389 ?auto_484391 ) ) ( not ( = ?auto_484390 ?auto_484391 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_484390 ?auto_484391 )
      ( !STACK ?auto_484390 ?auto_484389 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_484417 - BLOCK
      ?auto_484418 - BLOCK
      ?auto_484419 - BLOCK
      ?auto_484420 - BLOCK
      ?auto_484421 - BLOCK
      ?auto_484422 - BLOCK
      ?auto_484423 - BLOCK
      ?auto_484424 - BLOCK
    )
    :vars
    (
      ?auto_484425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484424 ?auto_484425 ) ( ON-TABLE ?auto_484417 ) ( ON ?auto_484418 ?auto_484417 ) ( ON ?auto_484419 ?auto_484418 ) ( ON ?auto_484420 ?auto_484419 ) ( ON ?auto_484421 ?auto_484420 ) ( ON ?auto_484422 ?auto_484421 ) ( not ( = ?auto_484417 ?auto_484418 ) ) ( not ( = ?auto_484417 ?auto_484419 ) ) ( not ( = ?auto_484417 ?auto_484420 ) ) ( not ( = ?auto_484417 ?auto_484421 ) ) ( not ( = ?auto_484417 ?auto_484422 ) ) ( not ( = ?auto_484417 ?auto_484423 ) ) ( not ( = ?auto_484417 ?auto_484424 ) ) ( not ( = ?auto_484417 ?auto_484425 ) ) ( not ( = ?auto_484418 ?auto_484419 ) ) ( not ( = ?auto_484418 ?auto_484420 ) ) ( not ( = ?auto_484418 ?auto_484421 ) ) ( not ( = ?auto_484418 ?auto_484422 ) ) ( not ( = ?auto_484418 ?auto_484423 ) ) ( not ( = ?auto_484418 ?auto_484424 ) ) ( not ( = ?auto_484418 ?auto_484425 ) ) ( not ( = ?auto_484419 ?auto_484420 ) ) ( not ( = ?auto_484419 ?auto_484421 ) ) ( not ( = ?auto_484419 ?auto_484422 ) ) ( not ( = ?auto_484419 ?auto_484423 ) ) ( not ( = ?auto_484419 ?auto_484424 ) ) ( not ( = ?auto_484419 ?auto_484425 ) ) ( not ( = ?auto_484420 ?auto_484421 ) ) ( not ( = ?auto_484420 ?auto_484422 ) ) ( not ( = ?auto_484420 ?auto_484423 ) ) ( not ( = ?auto_484420 ?auto_484424 ) ) ( not ( = ?auto_484420 ?auto_484425 ) ) ( not ( = ?auto_484421 ?auto_484422 ) ) ( not ( = ?auto_484421 ?auto_484423 ) ) ( not ( = ?auto_484421 ?auto_484424 ) ) ( not ( = ?auto_484421 ?auto_484425 ) ) ( not ( = ?auto_484422 ?auto_484423 ) ) ( not ( = ?auto_484422 ?auto_484424 ) ) ( not ( = ?auto_484422 ?auto_484425 ) ) ( not ( = ?auto_484423 ?auto_484424 ) ) ( not ( = ?auto_484423 ?auto_484425 ) ) ( not ( = ?auto_484424 ?auto_484425 ) ) ( CLEAR ?auto_484422 ) ( ON ?auto_484423 ?auto_484424 ) ( CLEAR ?auto_484423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_484417 ?auto_484418 ?auto_484419 ?auto_484420 ?auto_484421 ?auto_484422 ?auto_484423 )
      ( MAKE-8PILE ?auto_484417 ?auto_484418 ?auto_484419 ?auto_484420 ?auto_484421 ?auto_484422 ?auto_484423 ?auto_484424 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_484451 - BLOCK
      ?auto_484452 - BLOCK
      ?auto_484453 - BLOCK
      ?auto_484454 - BLOCK
      ?auto_484455 - BLOCK
      ?auto_484456 - BLOCK
      ?auto_484457 - BLOCK
      ?auto_484458 - BLOCK
    )
    :vars
    (
      ?auto_484459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484458 ?auto_484459 ) ( ON-TABLE ?auto_484451 ) ( ON ?auto_484452 ?auto_484451 ) ( ON ?auto_484453 ?auto_484452 ) ( ON ?auto_484454 ?auto_484453 ) ( ON ?auto_484455 ?auto_484454 ) ( not ( = ?auto_484451 ?auto_484452 ) ) ( not ( = ?auto_484451 ?auto_484453 ) ) ( not ( = ?auto_484451 ?auto_484454 ) ) ( not ( = ?auto_484451 ?auto_484455 ) ) ( not ( = ?auto_484451 ?auto_484456 ) ) ( not ( = ?auto_484451 ?auto_484457 ) ) ( not ( = ?auto_484451 ?auto_484458 ) ) ( not ( = ?auto_484451 ?auto_484459 ) ) ( not ( = ?auto_484452 ?auto_484453 ) ) ( not ( = ?auto_484452 ?auto_484454 ) ) ( not ( = ?auto_484452 ?auto_484455 ) ) ( not ( = ?auto_484452 ?auto_484456 ) ) ( not ( = ?auto_484452 ?auto_484457 ) ) ( not ( = ?auto_484452 ?auto_484458 ) ) ( not ( = ?auto_484452 ?auto_484459 ) ) ( not ( = ?auto_484453 ?auto_484454 ) ) ( not ( = ?auto_484453 ?auto_484455 ) ) ( not ( = ?auto_484453 ?auto_484456 ) ) ( not ( = ?auto_484453 ?auto_484457 ) ) ( not ( = ?auto_484453 ?auto_484458 ) ) ( not ( = ?auto_484453 ?auto_484459 ) ) ( not ( = ?auto_484454 ?auto_484455 ) ) ( not ( = ?auto_484454 ?auto_484456 ) ) ( not ( = ?auto_484454 ?auto_484457 ) ) ( not ( = ?auto_484454 ?auto_484458 ) ) ( not ( = ?auto_484454 ?auto_484459 ) ) ( not ( = ?auto_484455 ?auto_484456 ) ) ( not ( = ?auto_484455 ?auto_484457 ) ) ( not ( = ?auto_484455 ?auto_484458 ) ) ( not ( = ?auto_484455 ?auto_484459 ) ) ( not ( = ?auto_484456 ?auto_484457 ) ) ( not ( = ?auto_484456 ?auto_484458 ) ) ( not ( = ?auto_484456 ?auto_484459 ) ) ( not ( = ?auto_484457 ?auto_484458 ) ) ( not ( = ?auto_484457 ?auto_484459 ) ) ( not ( = ?auto_484458 ?auto_484459 ) ) ( ON ?auto_484457 ?auto_484458 ) ( CLEAR ?auto_484455 ) ( ON ?auto_484456 ?auto_484457 ) ( CLEAR ?auto_484456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_484451 ?auto_484452 ?auto_484453 ?auto_484454 ?auto_484455 ?auto_484456 )
      ( MAKE-8PILE ?auto_484451 ?auto_484452 ?auto_484453 ?auto_484454 ?auto_484455 ?auto_484456 ?auto_484457 ?auto_484458 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_484485 - BLOCK
      ?auto_484486 - BLOCK
      ?auto_484487 - BLOCK
      ?auto_484488 - BLOCK
      ?auto_484489 - BLOCK
      ?auto_484490 - BLOCK
      ?auto_484491 - BLOCK
      ?auto_484492 - BLOCK
    )
    :vars
    (
      ?auto_484493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484492 ?auto_484493 ) ( ON-TABLE ?auto_484485 ) ( ON ?auto_484486 ?auto_484485 ) ( ON ?auto_484487 ?auto_484486 ) ( ON ?auto_484488 ?auto_484487 ) ( not ( = ?auto_484485 ?auto_484486 ) ) ( not ( = ?auto_484485 ?auto_484487 ) ) ( not ( = ?auto_484485 ?auto_484488 ) ) ( not ( = ?auto_484485 ?auto_484489 ) ) ( not ( = ?auto_484485 ?auto_484490 ) ) ( not ( = ?auto_484485 ?auto_484491 ) ) ( not ( = ?auto_484485 ?auto_484492 ) ) ( not ( = ?auto_484485 ?auto_484493 ) ) ( not ( = ?auto_484486 ?auto_484487 ) ) ( not ( = ?auto_484486 ?auto_484488 ) ) ( not ( = ?auto_484486 ?auto_484489 ) ) ( not ( = ?auto_484486 ?auto_484490 ) ) ( not ( = ?auto_484486 ?auto_484491 ) ) ( not ( = ?auto_484486 ?auto_484492 ) ) ( not ( = ?auto_484486 ?auto_484493 ) ) ( not ( = ?auto_484487 ?auto_484488 ) ) ( not ( = ?auto_484487 ?auto_484489 ) ) ( not ( = ?auto_484487 ?auto_484490 ) ) ( not ( = ?auto_484487 ?auto_484491 ) ) ( not ( = ?auto_484487 ?auto_484492 ) ) ( not ( = ?auto_484487 ?auto_484493 ) ) ( not ( = ?auto_484488 ?auto_484489 ) ) ( not ( = ?auto_484488 ?auto_484490 ) ) ( not ( = ?auto_484488 ?auto_484491 ) ) ( not ( = ?auto_484488 ?auto_484492 ) ) ( not ( = ?auto_484488 ?auto_484493 ) ) ( not ( = ?auto_484489 ?auto_484490 ) ) ( not ( = ?auto_484489 ?auto_484491 ) ) ( not ( = ?auto_484489 ?auto_484492 ) ) ( not ( = ?auto_484489 ?auto_484493 ) ) ( not ( = ?auto_484490 ?auto_484491 ) ) ( not ( = ?auto_484490 ?auto_484492 ) ) ( not ( = ?auto_484490 ?auto_484493 ) ) ( not ( = ?auto_484491 ?auto_484492 ) ) ( not ( = ?auto_484491 ?auto_484493 ) ) ( not ( = ?auto_484492 ?auto_484493 ) ) ( ON ?auto_484491 ?auto_484492 ) ( ON ?auto_484490 ?auto_484491 ) ( CLEAR ?auto_484488 ) ( ON ?auto_484489 ?auto_484490 ) ( CLEAR ?auto_484489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_484485 ?auto_484486 ?auto_484487 ?auto_484488 ?auto_484489 )
      ( MAKE-8PILE ?auto_484485 ?auto_484486 ?auto_484487 ?auto_484488 ?auto_484489 ?auto_484490 ?auto_484491 ?auto_484492 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_484519 - BLOCK
      ?auto_484520 - BLOCK
      ?auto_484521 - BLOCK
      ?auto_484522 - BLOCK
      ?auto_484523 - BLOCK
      ?auto_484524 - BLOCK
      ?auto_484525 - BLOCK
      ?auto_484526 - BLOCK
    )
    :vars
    (
      ?auto_484527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484526 ?auto_484527 ) ( ON-TABLE ?auto_484519 ) ( ON ?auto_484520 ?auto_484519 ) ( ON ?auto_484521 ?auto_484520 ) ( not ( = ?auto_484519 ?auto_484520 ) ) ( not ( = ?auto_484519 ?auto_484521 ) ) ( not ( = ?auto_484519 ?auto_484522 ) ) ( not ( = ?auto_484519 ?auto_484523 ) ) ( not ( = ?auto_484519 ?auto_484524 ) ) ( not ( = ?auto_484519 ?auto_484525 ) ) ( not ( = ?auto_484519 ?auto_484526 ) ) ( not ( = ?auto_484519 ?auto_484527 ) ) ( not ( = ?auto_484520 ?auto_484521 ) ) ( not ( = ?auto_484520 ?auto_484522 ) ) ( not ( = ?auto_484520 ?auto_484523 ) ) ( not ( = ?auto_484520 ?auto_484524 ) ) ( not ( = ?auto_484520 ?auto_484525 ) ) ( not ( = ?auto_484520 ?auto_484526 ) ) ( not ( = ?auto_484520 ?auto_484527 ) ) ( not ( = ?auto_484521 ?auto_484522 ) ) ( not ( = ?auto_484521 ?auto_484523 ) ) ( not ( = ?auto_484521 ?auto_484524 ) ) ( not ( = ?auto_484521 ?auto_484525 ) ) ( not ( = ?auto_484521 ?auto_484526 ) ) ( not ( = ?auto_484521 ?auto_484527 ) ) ( not ( = ?auto_484522 ?auto_484523 ) ) ( not ( = ?auto_484522 ?auto_484524 ) ) ( not ( = ?auto_484522 ?auto_484525 ) ) ( not ( = ?auto_484522 ?auto_484526 ) ) ( not ( = ?auto_484522 ?auto_484527 ) ) ( not ( = ?auto_484523 ?auto_484524 ) ) ( not ( = ?auto_484523 ?auto_484525 ) ) ( not ( = ?auto_484523 ?auto_484526 ) ) ( not ( = ?auto_484523 ?auto_484527 ) ) ( not ( = ?auto_484524 ?auto_484525 ) ) ( not ( = ?auto_484524 ?auto_484526 ) ) ( not ( = ?auto_484524 ?auto_484527 ) ) ( not ( = ?auto_484525 ?auto_484526 ) ) ( not ( = ?auto_484525 ?auto_484527 ) ) ( not ( = ?auto_484526 ?auto_484527 ) ) ( ON ?auto_484525 ?auto_484526 ) ( ON ?auto_484524 ?auto_484525 ) ( ON ?auto_484523 ?auto_484524 ) ( CLEAR ?auto_484521 ) ( ON ?auto_484522 ?auto_484523 ) ( CLEAR ?auto_484522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_484519 ?auto_484520 ?auto_484521 ?auto_484522 )
      ( MAKE-8PILE ?auto_484519 ?auto_484520 ?auto_484521 ?auto_484522 ?auto_484523 ?auto_484524 ?auto_484525 ?auto_484526 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_484553 - BLOCK
      ?auto_484554 - BLOCK
      ?auto_484555 - BLOCK
      ?auto_484556 - BLOCK
      ?auto_484557 - BLOCK
      ?auto_484558 - BLOCK
      ?auto_484559 - BLOCK
      ?auto_484560 - BLOCK
    )
    :vars
    (
      ?auto_484561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484560 ?auto_484561 ) ( ON-TABLE ?auto_484553 ) ( ON ?auto_484554 ?auto_484553 ) ( not ( = ?auto_484553 ?auto_484554 ) ) ( not ( = ?auto_484553 ?auto_484555 ) ) ( not ( = ?auto_484553 ?auto_484556 ) ) ( not ( = ?auto_484553 ?auto_484557 ) ) ( not ( = ?auto_484553 ?auto_484558 ) ) ( not ( = ?auto_484553 ?auto_484559 ) ) ( not ( = ?auto_484553 ?auto_484560 ) ) ( not ( = ?auto_484553 ?auto_484561 ) ) ( not ( = ?auto_484554 ?auto_484555 ) ) ( not ( = ?auto_484554 ?auto_484556 ) ) ( not ( = ?auto_484554 ?auto_484557 ) ) ( not ( = ?auto_484554 ?auto_484558 ) ) ( not ( = ?auto_484554 ?auto_484559 ) ) ( not ( = ?auto_484554 ?auto_484560 ) ) ( not ( = ?auto_484554 ?auto_484561 ) ) ( not ( = ?auto_484555 ?auto_484556 ) ) ( not ( = ?auto_484555 ?auto_484557 ) ) ( not ( = ?auto_484555 ?auto_484558 ) ) ( not ( = ?auto_484555 ?auto_484559 ) ) ( not ( = ?auto_484555 ?auto_484560 ) ) ( not ( = ?auto_484555 ?auto_484561 ) ) ( not ( = ?auto_484556 ?auto_484557 ) ) ( not ( = ?auto_484556 ?auto_484558 ) ) ( not ( = ?auto_484556 ?auto_484559 ) ) ( not ( = ?auto_484556 ?auto_484560 ) ) ( not ( = ?auto_484556 ?auto_484561 ) ) ( not ( = ?auto_484557 ?auto_484558 ) ) ( not ( = ?auto_484557 ?auto_484559 ) ) ( not ( = ?auto_484557 ?auto_484560 ) ) ( not ( = ?auto_484557 ?auto_484561 ) ) ( not ( = ?auto_484558 ?auto_484559 ) ) ( not ( = ?auto_484558 ?auto_484560 ) ) ( not ( = ?auto_484558 ?auto_484561 ) ) ( not ( = ?auto_484559 ?auto_484560 ) ) ( not ( = ?auto_484559 ?auto_484561 ) ) ( not ( = ?auto_484560 ?auto_484561 ) ) ( ON ?auto_484559 ?auto_484560 ) ( ON ?auto_484558 ?auto_484559 ) ( ON ?auto_484557 ?auto_484558 ) ( ON ?auto_484556 ?auto_484557 ) ( CLEAR ?auto_484554 ) ( ON ?auto_484555 ?auto_484556 ) ( CLEAR ?auto_484555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_484553 ?auto_484554 ?auto_484555 )
      ( MAKE-8PILE ?auto_484553 ?auto_484554 ?auto_484555 ?auto_484556 ?auto_484557 ?auto_484558 ?auto_484559 ?auto_484560 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_484587 - BLOCK
      ?auto_484588 - BLOCK
      ?auto_484589 - BLOCK
      ?auto_484590 - BLOCK
      ?auto_484591 - BLOCK
      ?auto_484592 - BLOCK
      ?auto_484593 - BLOCK
      ?auto_484594 - BLOCK
    )
    :vars
    (
      ?auto_484595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484594 ?auto_484595 ) ( ON-TABLE ?auto_484587 ) ( not ( = ?auto_484587 ?auto_484588 ) ) ( not ( = ?auto_484587 ?auto_484589 ) ) ( not ( = ?auto_484587 ?auto_484590 ) ) ( not ( = ?auto_484587 ?auto_484591 ) ) ( not ( = ?auto_484587 ?auto_484592 ) ) ( not ( = ?auto_484587 ?auto_484593 ) ) ( not ( = ?auto_484587 ?auto_484594 ) ) ( not ( = ?auto_484587 ?auto_484595 ) ) ( not ( = ?auto_484588 ?auto_484589 ) ) ( not ( = ?auto_484588 ?auto_484590 ) ) ( not ( = ?auto_484588 ?auto_484591 ) ) ( not ( = ?auto_484588 ?auto_484592 ) ) ( not ( = ?auto_484588 ?auto_484593 ) ) ( not ( = ?auto_484588 ?auto_484594 ) ) ( not ( = ?auto_484588 ?auto_484595 ) ) ( not ( = ?auto_484589 ?auto_484590 ) ) ( not ( = ?auto_484589 ?auto_484591 ) ) ( not ( = ?auto_484589 ?auto_484592 ) ) ( not ( = ?auto_484589 ?auto_484593 ) ) ( not ( = ?auto_484589 ?auto_484594 ) ) ( not ( = ?auto_484589 ?auto_484595 ) ) ( not ( = ?auto_484590 ?auto_484591 ) ) ( not ( = ?auto_484590 ?auto_484592 ) ) ( not ( = ?auto_484590 ?auto_484593 ) ) ( not ( = ?auto_484590 ?auto_484594 ) ) ( not ( = ?auto_484590 ?auto_484595 ) ) ( not ( = ?auto_484591 ?auto_484592 ) ) ( not ( = ?auto_484591 ?auto_484593 ) ) ( not ( = ?auto_484591 ?auto_484594 ) ) ( not ( = ?auto_484591 ?auto_484595 ) ) ( not ( = ?auto_484592 ?auto_484593 ) ) ( not ( = ?auto_484592 ?auto_484594 ) ) ( not ( = ?auto_484592 ?auto_484595 ) ) ( not ( = ?auto_484593 ?auto_484594 ) ) ( not ( = ?auto_484593 ?auto_484595 ) ) ( not ( = ?auto_484594 ?auto_484595 ) ) ( ON ?auto_484593 ?auto_484594 ) ( ON ?auto_484592 ?auto_484593 ) ( ON ?auto_484591 ?auto_484592 ) ( ON ?auto_484590 ?auto_484591 ) ( ON ?auto_484589 ?auto_484590 ) ( CLEAR ?auto_484587 ) ( ON ?auto_484588 ?auto_484589 ) ( CLEAR ?auto_484588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_484587 ?auto_484588 )
      ( MAKE-8PILE ?auto_484587 ?auto_484588 ?auto_484589 ?auto_484590 ?auto_484591 ?auto_484592 ?auto_484593 ?auto_484594 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_484621 - BLOCK
      ?auto_484622 - BLOCK
      ?auto_484623 - BLOCK
      ?auto_484624 - BLOCK
      ?auto_484625 - BLOCK
      ?auto_484626 - BLOCK
      ?auto_484627 - BLOCK
      ?auto_484628 - BLOCK
    )
    :vars
    (
      ?auto_484629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484628 ?auto_484629 ) ( not ( = ?auto_484621 ?auto_484622 ) ) ( not ( = ?auto_484621 ?auto_484623 ) ) ( not ( = ?auto_484621 ?auto_484624 ) ) ( not ( = ?auto_484621 ?auto_484625 ) ) ( not ( = ?auto_484621 ?auto_484626 ) ) ( not ( = ?auto_484621 ?auto_484627 ) ) ( not ( = ?auto_484621 ?auto_484628 ) ) ( not ( = ?auto_484621 ?auto_484629 ) ) ( not ( = ?auto_484622 ?auto_484623 ) ) ( not ( = ?auto_484622 ?auto_484624 ) ) ( not ( = ?auto_484622 ?auto_484625 ) ) ( not ( = ?auto_484622 ?auto_484626 ) ) ( not ( = ?auto_484622 ?auto_484627 ) ) ( not ( = ?auto_484622 ?auto_484628 ) ) ( not ( = ?auto_484622 ?auto_484629 ) ) ( not ( = ?auto_484623 ?auto_484624 ) ) ( not ( = ?auto_484623 ?auto_484625 ) ) ( not ( = ?auto_484623 ?auto_484626 ) ) ( not ( = ?auto_484623 ?auto_484627 ) ) ( not ( = ?auto_484623 ?auto_484628 ) ) ( not ( = ?auto_484623 ?auto_484629 ) ) ( not ( = ?auto_484624 ?auto_484625 ) ) ( not ( = ?auto_484624 ?auto_484626 ) ) ( not ( = ?auto_484624 ?auto_484627 ) ) ( not ( = ?auto_484624 ?auto_484628 ) ) ( not ( = ?auto_484624 ?auto_484629 ) ) ( not ( = ?auto_484625 ?auto_484626 ) ) ( not ( = ?auto_484625 ?auto_484627 ) ) ( not ( = ?auto_484625 ?auto_484628 ) ) ( not ( = ?auto_484625 ?auto_484629 ) ) ( not ( = ?auto_484626 ?auto_484627 ) ) ( not ( = ?auto_484626 ?auto_484628 ) ) ( not ( = ?auto_484626 ?auto_484629 ) ) ( not ( = ?auto_484627 ?auto_484628 ) ) ( not ( = ?auto_484627 ?auto_484629 ) ) ( not ( = ?auto_484628 ?auto_484629 ) ) ( ON ?auto_484627 ?auto_484628 ) ( ON ?auto_484626 ?auto_484627 ) ( ON ?auto_484625 ?auto_484626 ) ( ON ?auto_484624 ?auto_484625 ) ( ON ?auto_484623 ?auto_484624 ) ( ON ?auto_484622 ?auto_484623 ) ( ON ?auto_484621 ?auto_484622 ) ( CLEAR ?auto_484621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_484621 )
      ( MAKE-8PILE ?auto_484621 ?auto_484622 ?auto_484623 ?auto_484624 ?auto_484625 ?auto_484626 ?auto_484627 ?auto_484628 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_484656 - BLOCK
      ?auto_484657 - BLOCK
      ?auto_484658 - BLOCK
      ?auto_484659 - BLOCK
      ?auto_484660 - BLOCK
      ?auto_484661 - BLOCK
      ?auto_484662 - BLOCK
      ?auto_484663 - BLOCK
      ?auto_484664 - BLOCK
    )
    :vars
    (
      ?auto_484665 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_484663 ) ( ON ?auto_484664 ?auto_484665 ) ( CLEAR ?auto_484664 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_484656 ) ( ON ?auto_484657 ?auto_484656 ) ( ON ?auto_484658 ?auto_484657 ) ( ON ?auto_484659 ?auto_484658 ) ( ON ?auto_484660 ?auto_484659 ) ( ON ?auto_484661 ?auto_484660 ) ( ON ?auto_484662 ?auto_484661 ) ( ON ?auto_484663 ?auto_484662 ) ( not ( = ?auto_484656 ?auto_484657 ) ) ( not ( = ?auto_484656 ?auto_484658 ) ) ( not ( = ?auto_484656 ?auto_484659 ) ) ( not ( = ?auto_484656 ?auto_484660 ) ) ( not ( = ?auto_484656 ?auto_484661 ) ) ( not ( = ?auto_484656 ?auto_484662 ) ) ( not ( = ?auto_484656 ?auto_484663 ) ) ( not ( = ?auto_484656 ?auto_484664 ) ) ( not ( = ?auto_484656 ?auto_484665 ) ) ( not ( = ?auto_484657 ?auto_484658 ) ) ( not ( = ?auto_484657 ?auto_484659 ) ) ( not ( = ?auto_484657 ?auto_484660 ) ) ( not ( = ?auto_484657 ?auto_484661 ) ) ( not ( = ?auto_484657 ?auto_484662 ) ) ( not ( = ?auto_484657 ?auto_484663 ) ) ( not ( = ?auto_484657 ?auto_484664 ) ) ( not ( = ?auto_484657 ?auto_484665 ) ) ( not ( = ?auto_484658 ?auto_484659 ) ) ( not ( = ?auto_484658 ?auto_484660 ) ) ( not ( = ?auto_484658 ?auto_484661 ) ) ( not ( = ?auto_484658 ?auto_484662 ) ) ( not ( = ?auto_484658 ?auto_484663 ) ) ( not ( = ?auto_484658 ?auto_484664 ) ) ( not ( = ?auto_484658 ?auto_484665 ) ) ( not ( = ?auto_484659 ?auto_484660 ) ) ( not ( = ?auto_484659 ?auto_484661 ) ) ( not ( = ?auto_484659 ?auto_484662 ) ) ( not ( = ?auto_484659 ?auto_484663 ) ) ( not ( = ?auto_484659 ?auto_484664 ) ) ( not ( = ?auto_484659 ?auto_484665 ) ) ( not ( = ?auto_484660 ?auto_484661 ) ) ( not ( = ?auto_484660 ?auto_484662 ) ) ( not ( = ?auto_484660 ?auto_484663 ) ) ( not ( = ?auto_484660 ?auto_484664 ) ) ( not ( = ?auto_484660 ?auto_484665 ) ) ( not ( = ?auto_484661 ?auto_484662 ) ) ( not ( = ?auto_484661 ?auto_484663 ) ) ( not ( = ?auto_484661 ?auto_484664 ) ) ( not ( = ?auto_484661 ?auto_484665 ) ) ( not ( = ?auto_484662 ?auto_484663 ) ) ( not ( = ?auto_484662 ?auto_484664 ) ) ( not ( = ?auto_484662 ?auto_484665 ) ) ( not ( = ?auto_484663 ?auto_484664 ) ) ( not ( = ?auto_484663 ?auto_484665 ) ) ( not ( = ?auto_484664 ?auto_484665 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_484664 ?auto_484665 )
      ( !STACK ?auto_484664 ?auto_484663 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_484694 - BLOCK
      ?auto_484695 - BLOCK
      ?auto_484696 - BLOCK
      ?auto_484697 - BLOCK
      ?auto_484698 - BLOCK
      ?auto_484699 - BLOCK
      ?auto_484700 - BLOCK
      ?auto_484701 - BLOCK
      ?auto_484702 - BLOCK
    )
    :vars
    (
      ?auto_484703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484702 ?auto_484703 ) ( ON-TABLE ?auto_484694 ) ( ON ?auto_484695 ?auto_484694 ) ( ON ?auto_484696 ?auto_484695 ) ( ON ?auto_484697 ?auto_484696 ) ( ON ?auto_484698 ?auto_484697 ) ( ON ?auto_484699 ?auto_484698 ) ( ON ?auto_484700 ?auto_484699 ) ( not ( = ?auto_484694 ?auto_484695 ) ) ( not ( = ?auto_484694 ?auto_484696 ) ) ( not ( = ?auto_484694 ?auto_484697 ) ) ( not ( = ?auto_484694 ?auto_484698 ) ) ( not ( = ?auto_484694 ?auto_484699 ) ) ( not ( = ?auto_484694 ?auto_484700 ) ) ( not ( = ?auto_484694 ?auto_484701 ) ) ( not ( = ?auto_484694 ?auto_484702 ) ) ( not ( = ?auto_484694 ?auto_484703 ) ) ( not ( = ?auto_484695 ?auto_484696 ) ) ( not ( = ?auto_484695 ?auto_484697 ) ) ( not ( = ?auto_484695 ?auto_484698 ) ) ( not ( = ?auto_484695 ?auto_484699 ) ) ( not ( = ?auto_484695 ?auto_484700 ) ) ( not ( = ?auto_484695 ?auto_484701 ) ) ( not ( = ?auto_484695 ?auto_484702 ) ) ( not ( = ?auto_484695 ?auto_484703 ) ) ( not ( = ?auto_484696 ?auto_484697 ) ) ( not ( = ?auto_484696 ?auto_484698 ) ) ( not ( = ?auto_484696 ?auto_484699 ) ) ( not ( = ?auto_484696 ?auto_484700 ) ) ( not ( = ?auto_484696 ?auto_484701 ) ) ( not ( = ?auto_484696 ?auto_484702 ) ) ( not ( = ?auto_484696 ?auto_484703 ) ) ( not ( = ?auto_484697 ?auto_484698 ) ) ( not ( = ?auto_484697 ?auto_484699 ) ) ( not ( = ?auto_484697 ?auto_484700 ) ) ( not ( = ?auto_484697 ?auto_484701 ) ) ( not ( = ?auto_484697 ?auto_484702 ) ) ( not ( = ?auto_484697 ?auto_484703 ) ) ( not ( = ?auto_484698 ?auto_484699 ) ) ( not ( = ?auto_484698 ?auto_484700 ) ) ( not ( = ?auto_484698 ?auto_484701 ) ) ( not ( = ?auto_484698 ?auto_484702 ) ) ( not ( = ?auto_484698 ?auto_484703 ) ) ( not ( = ?auto_484699 ?auto_484700 ) ) ( not ( = ?auto_484699 ?auto_484701 ) ) ( not ( = ?auto_484699 ?auto_484702 ) ) ( not ( = ?auto_484699 ?auto_484703 ) ) ( not ( = ?auto_484700 ?auto_484701 ) ) ( not ( = ?auto_484700 ?auto_484702 ) ) ( not ( = ?auto_484700 ?auto_484703 ) ) ( not ( = ?auto_484701 ?auto_484702 ) ) ( not ( = ?auto_484701 ?auto_484703 ) ) ( not ( = ?auto_484702 ?auto_484703 ) ) ( CLEAR ?auto_484700 ) ( ON ?auto_484701 ?auto_484702 ) ( CLEAR ?auto_484701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_484694 ?auto_484695 ?auto_484696 ?auto_484697 ?auto_484698 ?auto_484699 ?auto_484700 ?auto_484701 )
      ( MAKE-9PILE ?auto_484694 ?auto_484695 ?auto_484696 ?auto_484697 ?auto_484698 ?auto_484699 ?auto_484700 ?auto_484701 ?auto_484702 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_484732 - BLOCK
      ?auto_484733 - BLOCK
      ?auto_484734 - BLOCK
      ?auto_484735 - BLOCK
      ?auto_484736 - BLOCK
      ?auto_484737 - BLOCK
      ?auto_484738 - BLOCK
      ?auto_484739 - BLOCK
      ?auto_484740 - BLOCK
    )
    :vars
    (
      ?auto_484741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484740 ?auto_484741 ) ( ON-TABLE ?auto_484732 ) ( ON ?auto_484733 ?auto_484732 ) ( ON ?auto_484734 ?auto_484733 ) ( ON ?auto_484735 ?auto_484734 ) ( ON ?auto_484736 ?auto_484735 ) ( ON ?auto_484737 ?auto_484736 ) ( not ( = ?auto_484732 ?auto_484733 ) ) ( not ( = ?auto_484732 ?auto_484734 ) ) ( not ( = ?auto_484732 ?auto_484735 ) ) ( not ( = ?auto_484732 ?auto_484736 ) ) ( not ( = ?auto_484732 ?auto_484737 ) ) ( not ( = ?auto_484732 ?auto_484738 ) ) ( not ( = ?auto_484732 ?auto_484739 ) ) ( not ( = ?auto_484732 ?auto_484740 ) ) ( not ( = ?auto_484732 ?auto_484741 ) ) ( not ( = ?auto_484733 ?auto_484734 ) ) ( not ( = ?auto_484733 ?auto_484735 ) ) ( not ( = ?auto_484733 ?auto_484736 ) ) ( not ( = ?auto_484733 ?auto_484737 ) ) ( not ( = ?auto_484733 ?auto_484738 ) ) ( not ( = ?auto_484733 ?auto_484739 ) ) ( not ( = ?auto_484733 ?auto_484740 ) ) ( not ( = ?auto_484733 ?auto_484741 ) ) ( not ( = ?auto_484734 ?auto_484735 ) ) ( not ( = ?auto_484734 ?auto_484736 ) ) ( not ( = ?auto_484734 ?auto_484737 ) ) ( not ( = ?auto_484734 ?auto_484738 ) ) ( not ( = ?auto_484734 ?auto_484739 ) ) ( not ( = ?auto_484734 ?auto_484740 ) ) ( not ( = ?auto_484734 ?auto_484741 ) ) ( not ( = ?auto_484735 ?auto_484736 ) ) ( not ( = ?auto_484735 ?auto_484737 ) ) ( not ( = ?auto_484735 ?auto_484738 ) ) ( not ( = ?auto_484735 ?auto_484739 ) ) ( not ( = ?auto_484735 ?auto_484740 ) ) ( not ( = ?auto_484735 ?auto_484741 ) ) ( not ( = ?auto_484736 ?auto_484737 ) ) ( not ( = ?auto_484736 ?auto_484738 ) ) ( not ( = ?auto_484736 ?auto_484739 ) ) ( not ( = ?auto_484736 ?auto_484740 ) ) ( not ( = ?auto_484736 ?auto_484741 ) ) ( not ( = ?auto_484737 ?auto_484738 ) ) ( not ( = ?auto_484737 ?auto_484739 ) ) ( not ( = ?auto_484737 ?auto_484740 ) ) ( not ( = ?auto_484737 ?auto_484741 ) ) ( not ( = ?auto_484738 ?auto_484739 ) ) ( not ( = ?auto_484738 ?auto_484740 ) ) ( not ( = ?auto_484738 ?auto_484741 ) ) ( not ( = ?auto_484739 ?auto_484740 ) ) ( not ( = ?auto_484739 ?auto_484741 ) ) ( not ( = ?auto_484740 ?auto_484741 ) ) ( ON ?auto_484739 ?auto_484740 ) ( CLEAR ?auto_484737 ) ( ON ?auto_484738 ?auto_484739 ) ( CLEAR ?auto_484738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_484732 ?auto_484733 ?auto_484734 ?auto_484735 ?auto_484736 ?auto_484737 ?auto_484738 )
      ( MAKE-9PILE ?auto_484732 ?auto_484733 ?auto_484734 ?auto_484735 ?auto_484736 ?auto_484737 ?auto_484738 ?auto_484739 ?auto_484740 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_484770 - BLOCK
      ?auto_484771 - BLOCK
      ?auto_484772 - BLOCK
      ?auto_484773 - BLOCK
      ?auto_484774 - BLOCK
      ?auto_484775 - BLOCK
      ?auto_484776 - BLOCK
      ?auto_484777 - BLOCK
      ?auto_484778 - BLOCK
    )
    :vars
    (
      ?auto_484779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484778 ?auto_484779 ) ( ON-TABLE ?auto_484770 ) ( ON ?auto_484771 ?auto_484770 ) ( ON ?auto_484772 ?auto_484771 ) ( ON ?auto_484773 ?auto_484772 ) ( ON ?auto_484774 ?auto_484773 ) ( not ( = ?auto_484770 ?auto_484771 ) ) ( not ( = ?auto_484770 ?auto_484772 ) ) ( not ( = ?auto_484770 ?auto_484773 ) ) ( not ( = ?auto_484770 ?auto_484774 ) ) ( not ( = ?auto_484770 ?auto_484775 ) ) ( not ( = ?auto_484770 ?auto_484776 ) ) ( not ( = ?auto_484770 ?auto_484777 ) ) ( not ( = ?auto_484770 ?auto_484778 ) ) ( not ( = ?auto_484770 ?auto_484779 ) ) ( not ( = ?auto_484771 ?auto_484772 ) ) ( not ( = ?auto_484771 ?auto_484773 ) ) ( not ( = ?auto_484771 ?auto_484774 ) ) ( not ( = ?auto_484771 ?auto_484775 ) ) ( not ( = ?auto_484771 ?auto_484776 ) ) ( not ( = ?auto_484771 ?auto_484777 ) ) ( not ( = ?auto_484771 ?auto_484778 ) ) ( not ( = ?auto_484771 ?auto_484779 ) ) ( not ( = ?auto_484772 ?auto_484773 ) ) ( not ( = ?auto_484772 ?auto_484774 ) ) ( not ( = ?auto_484772 ?auto_484775 ) ) ( not ( = ?auto_484772 ?auto_484776 ) ) ( not ( = ?auto_484772 ?auto_484777 ) ) ( not ( = ?auto_484772 ?auto_484778 ) ) ( not ( = ?auto_484772 ?auto_484779 ) ) ( not ( = ?auto_484773 ?auto_484774 ) ) ( not ( = ?auto_484773 ?auto_484775 ) ) ( not ( = ?auto_484773 ?auto_484776 ) ) ( not ( = ?auto_484773 ?auto_484777 ) ) ( not ( = ?auto_484773 ?auto_484778 ) ) ( not ( = ?auto_484773 ?auto_484779 ) ) ( not ( = ?auto_484774 ?auto_484775 ) ) ( not ( = ?auto_484774 ?auto_484776 ) ) ( not ( = ?auto_484774 ?auto_484777 ) ) ( not ( = ?auto_484774 ?auto_484778 ) ) ( not ( = ?auto_484774 ?auto_484779 ) ) ( not ( = ?auto_484775 ?auto_484776 ) ) ( not ( = ?auto_484775 ?auto_484777 ) ) ( not ( = ?auto_484775 ?auto_484778 ) ) ( not ( = ?auto_484775 ?auto_484779 ) ) ( not ( = ?auto_484776 ?auto_484777 ) ) ( not ( = ?auto_484776 ?auto_484778 ) ) ( not ( = ?auto_484776 ?auto_484779 ) ) ( not ( = ?auto_484777 ?auto_484778 ) ) ( not ( = ?auto_484777 ?auto_484779 ) ) ( not ( = ?auto_484778 ?auto_484779 ) ) ( ON ?auto_484777 ?auto_484778 ) ( ON ?auto_484776 ?auto_484777 ) ( CLEAR ?auto_484774 ) ( ON ?auto_484775 ?auto_484776 ) ( CLEAR ?auto_484775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_484770 ?auto_484771 ?auto_484772 ?auto_484773 ?auto_484774 ?auto_484775 )
      ( MAKE-9PILE ?auto_484770 ?auto_484771 ?auto_484772 ?auto_484773 ?auto_484774 ?auto_484775 ?auto_484776 ?auto_484777 ?auto_484778 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_484808 - BLOCK
      ?auto_484809 - BLOCK
      ?auto_484810 - BLOCK
      ?auto_484811 - BLOCK
      ?auto_484812 - BLOCK
      ?auto_484813 - BLOCK
      ?auto_484814 - BLOCK
      ?auto_484815 - BLOCK
      ?auto_484816 - BLOCK
    )
    :vars
    (
      ?auto_484817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484816 ?auto_484817 ) ( ON-TABLE ?auto_484808 ) ( ON ?auto_484809 ?auto_484808 ) ( ON ?auto_484810 ?auto_484809 ) ( ON ?auto_484811 ?auto_484810 ) ( not ( = ?auto_484808 ?auto_484809 ) ) ( not ( = ?auto_484808 ?auto_484810 ) ) ( not ( = ?auto_484808 ?auto_484811 ) ) ( not ( = ?auto_484808 ?auto_484812 ) ) ( not ( = ?auto_484808 ?auto_484813 ) ) ( not ( = ?auto_484808 ?auto_484814 ) ) ( not ( = ?auto_484808 ?auto_484815 ) ) ( not ( = ?auto_484808 ?auto_484816 ) ) ( not ( = ?auto_484808 ?auto_484817 ) ) ( not ( = ?auto_484809 ?auto_484810 ) ) ( not ( = ?auto_484809 ?auto_484811 ) ) ( not ( = ?auto_484809 ?auto_484812 ) ) ( not ( = ?auto_484809 ?auto_484813 ) ) ( not ( = ?auto_484809 ?auto_484814 ) ) ( not ( = ?auto_484809 ?auto_484815 ) ) ( not ( = ?auto_484809 ?auto_484816 ) ) ( not ( = ?auto_484809 ?auto_484817 ) ) ( not ( = ?auto_484810 ?auto_484811 ) ) ( not ( = ?auto_484810 ?auto_484812 ) ) ( not ( = ?auto_484810 ?auto_484813 ) ) ( not ( = ?auto_484810 ?auto_484814 ) ) ( not ( = ?auto_484810 ?auto_484815 ) ) ( not ( = ?auto_484810 ?auto_484816 ) ) ( not ( = ?auto_484810 ?auto_484817 ) ) ( not ( = ?auto_484811 ?auto_484812 ) ) ( not ( = ?auto_484811 ?auto_484813 ) ) ( not ( = ?auto_484811 ?auto_484814 ) ) ( not ( = ?auto_484811 ?auto_484815 ) ) ( not ( = ?auto_484811 ?auto_484816 ) ) ( not ( = ?auto_484811 ?auto_484817 ) ) ( not ( = ?auto_484812 ?auto_484813 ) ) ( not ( = ?auto_484812 ?auto_484814 ) ) ( not ( = ?auto_484812 ?auto_484815 ) ) ( not ( = ?auto_484812 ?auto_484816 ) ) ( not ( = ?auto_484812 ?auto_484817 ) ) ( not ( = ?auto_484813 ?auto_484814 ) ) ( not ( = ?auto_484813 ?auto_484815 ) ) ( not ( = ?auto_484813 ?auto_484816 ) ) ( not ( = ?auto_484813 ?auto_484817 ) ) ( not ( = ?auto_484814 ?auto_484815 ) ) ( not ( = ?auto_484814 ?auto_484816 ) ) ( not ( = ?auto_484814 ?auto_484817 ) ) ( not ( = ?auto_484815 ?auto_484816 ) ) ( not ( = ?auto_484815 ?auto_484817 ) ) ( not ( = ?auto_484816 ?auto_484817 ) ) ( ON ?auto_484815 ?auto_484816 ) ( ON ?auto_484814 ?auto_484815 ) ( ON ?auto_484813 ?auto_484814 ) ( CLEAR ?auto_484811 ) ( ON ?auto_484812 ?auto_484813 ) ( CLEAR ?auto_484812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_484808 ?auto_484809 ?auto_484810 ?auto_484811 ?auto_484812 )
      ( MAKE-9PILE ?auto_484808 ?auto_484809 ?auto_484810 ?auto_484811 ?auto_484812 ?auto_484813 ?auto_484814 ?auto_484815 ?auto_484816 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_484846 - BLOCK
      ?auto_484847 - BLOCK
      ?auto_484848 - BLOCK
      ?auto_484849 - BLOCK
      ?auto_484850 - BLOCK
      ?auto_484851 - BLOCK
      ?auto_484852 - BLOCK
      ?auto_484853 - BLOCK
      ?auto_484854 - BLOCK
    )
    :vars
    (
      ?auto_484855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484854 ?auto_484855 ) ( ON-TABLE ?auto_484846 ) ( ON ?auto_484847 ?auto_484846 ) ( ON ?auto_484848 ?auto_484847 ) ( not ( = ?auto_484846 ?auto_484847 ) ) ( not ( = ?auto_484846 ?auto_484848 ) ) ( not ( = ?auto_484846 ?auto_484849 ) ) ( not ( = ?auto_484846 ?auto_484850 ) ) ( not ( = ?auto_484846 ?auto_484851 ) ) ( not ( = ?auto_484846 ?auto_484852 ) ) ( not ( = ?auto_484846 ?auto_484853 ) ) ( not ( = ?auto_484846 ?auto_484854 ) ) ( not ( = ?auto_484846 ?auto_484855 ) ) ( not ( = ?auto_484847 ?auto_484848 ) ) ( not ( = ?auto_484847 ?auto_484849 ) ) ( not ( = ?auto_484847 ?auto_484850 ) ) ( not ( = ?auto_484847 ?auto_484851 ) ) ( not ( = ?auto_484847 ?auto_484852 ) ) ( not ( = ?auto_484847 ?auto_484853 ) ) ( not ( = ?auto_484847 ?auto_484854 ) ) ( not ( = ?auto_484847 ?auto_484855 ) ) ( not ( = ?auto_484848 ?auto_484849 ) ) ( not ( = ?auto_484848 ?auto_484850 ) ) ( not ( = ?auto_484848 ?auto_484851 ) ) ( not ( = ?auto_484848 ?auto_484852 ) ) ( not ( = ?auto_484848 ?auto_484853 ) ) ( not ( = ?auto_484848 ?auto_484854 ) ) ( not ( = ?auto_484848 ?auto_484855 ) ) ( not ( = ?auto_484849 ?auto_484850 ) ) ( not ( = ?auto_484849 ?auto_484851 ) ) ( not ( = ?auto_484849 ?auto_484852 ) ) ( not ( = ?auto_484849 ?auto_484853 ) ) ( not ( = ?auto_484849 ?auto_484854 ) ) ( not ( = ?auto_484849 ?auto_484855 ) ) ( not ( = ?auto_484850 ?auto_484851 ) ) ( not ( = ?auto_484850 ?auto_484852 ) ) ( not ( = ?auto_484850 ?auto_484853 ) ) ( not ( = ?auto_484850 ?auto_484854 ) ) ( not ( = ?auto_484850 ?auto_484855 ) ) ( not ( = ?auto_484851 ?auto_484852 ) ) ( not ( = ?auto_484851 ?auto_484853 ) ) ( not ( = ?auto_484851 ?auto_484854 ) ) ( not ( = ?auto_484851 ?auto_484855 ) ) ( not ( = ?auto_484852 ?auto_484853 ) ) ( not ( = ?auto_484852 ?auto_484854 ) ) ( not ( = ?auto_484852 ?auto_484855 ) ) ( not ( = ?auto_484853 ?auto_484854 ) ) ( not ( = ?auto_484853 ?auto_484855 ) ) ( not ( = ?auto_484854 ?auto_484855 ) ) ( ON ?auto_484853 ?auto_484854 ) ( ON ?auto_484852 ?auto_484853 ) ( ON ?auto_484851 ?auto_484852 ) ( ON ?auto_484850 ?auto_484851 ) ( CLEAR ?auto_484848 ) ( ON ?auto_484849 ?auto_484850 ) ( CLEAR ?auto_484849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_484846 ?auto_484847 ?auto_484848 ?auto_484849 )
      ( MAKE-9PILE ?auto_484846 ?auto_484847 ?auto_484848 ?auto_484849 ?auto_484850 ?auto_484851 ?auto_484852 ?auto_484853 ?auto_484854 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_484884 - BLOCK
      ?auto_484885 - BLOCK
      ?auto_484886 - BLOCK
      ?auto_484887 - BLOCK
      ?auto_484888 - BLOCK
      ?auto_484889 - BLOCK
      ?auto_484890 - BLOCK
      ?auto_484891 - BLOCK
      ?auto_484892 - BLOCK
    )
    :vars
    (
      ?auto_484893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484892 ?auto_484893 ) ( ON-TABLE ?auto_484884 ) ( ON ?auto_484885 ?auto_484884 ) ( not ( = ?auto_484884 ?auto_484885 ) ) ( not ( = ?auto_484884 ?auto_484886 ) ) ( not ( = ?auto_484884 ?auto_484887 ) ) ( not ( = ?auto_484884 ?auto_484888 ) ) ( not ( = ?auto_484884 ?auto_484889 ) ) ( not ( = ?auto_484884 ?auto_484890 ) ) ( not ( = ?auto_484884 ?auto_484891 ) ) ( not ( = ?auto_484884 ?auto_484892 ) ) ( not ( = ?auto_484884 ?auto_484893 ) ) ( not ( = ?auto_484885 ?auto_484886 ) ) ( not ( = ?auto_484885 ?auto_484887 ) ) ( not ( = ?auto_484885 ?auto_484888 ) ) ( not ( = ?auto_484885 ?auto_484889 ) ) ( not ( = ?auto_484885 ?auto_484890 ) ) ( not ( = ?auto_484885 ?auto_484891 ) ) ( not ( = ?auto_484885 ?auto_484892 ) ) ( not ( = ?auto_484885 ?auto_484893 ) ) ( not ( = ?auto_484886 ?auto_484887 ) ) ( not ( = ?auto_484886 ?auto_484888 ) ) ( not ( = ?auto_484886 ?auto_484889 ) ) ( not ( = ?auto_484886 ?auto_484890 ) ) ( not ( = ?auto_484886 ?auto_484891 ) ) ( not ( = ?auto_484886 ?auto_484892 ) ) ( not ( = ?auto_484886 ?auto_484893 ) ) ( not ( = ?auto_484887 ?auto_484888 ) ) ( not ( = ?auto_484887 ?auto_484889 ) ) ( not ( = ?auto_484887 ?auto_484890 ) ) ( not ( = ?auto_484887 ?auto_484891 ) ) ( not ( = ?auto_484887 ?auto_484892 ) ) ( not ( = ?auto_484887 ?auto_484893 ) ) ( not ( = ?auto_484888 ?auto_484889 ) ) ( not ( = ?auto_484888 ?auto_484890 ) ) ( not ( = ?auto_484888 ?auto_484891 ) ) ( not ( = ?auto_484888 ?auto_484892 ) ) ( not ( = ?auto_484888 ?auto_484893 ) ) ( not ( = ?auto_484889 ?auto_484890 ) ) ( not ( = ?auto_484889 ?auto_484891 ) ) ( not ( = ?auto_484889 ?auto_484892 ) ) ( not ( = ?auto_484889 ?auto_484893 ) ) ( not ( = ?auto_484890 ?auto_484891 ) ) ( not ( = ?auto_484890 ?auto_484892 ) ) ( not ( = ?auto_484890 ?auto_484893 ) ) ( not ( = ?auto_484891 ?auto_484892 ) ) ( not ( = ?auto_484891 ?auto_484893 ) ) ( not ( = ?auto_484892 ?auto_484893 ) ) ( ON ?auto_484891 ?auto_484892 ) ( ON ?auto_484890 ?auto_484891 ) ( ON ?auto_484889 ?auto_484890 ) ( ON ?auto_484888 ?auto_484889 ) ( ON ?auto_484887 ?auto_484888 ) ( CLEAR ?auto_484885 ) ( ON ?auto_484886 ?auto_484887 ) ( CLEAR ?auto_484886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_484884 ?auto_484885 ?auto_484886 )
      ( MAKE-9PILE ?auto_484884 ?auto_484885 ?auto_484886 ?auto_484887 ?auto_484888 ?auto_484889 ?auto_484890 ?auto_484891 ?auto_484892 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_484922 - BLOCK
      ?auto_484923 - BLOCK
      ?auto_484924 - BLOCK
      ?auto_484925 - BLOCK
      ?auto_484926 - BLOCK
      ?auto_484927 - BLOCK
      ?auto_484928 - BLOCK
      ?auto_484929 - BLOCK
      ?auto_484930 - BLOCK
    )
    :vars
    (
      ?auto_484931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484930 ?auto_484931 ) ( ON-TABLE ?auto_484922 ) ( not ( = ?auto_484922 ?auto_484923 ) ) ( not ( = ?auto_484922 ?auto_484924 ) ) ( not ( = ?auto_484922 ?auto_484925 ) ) ( not ( = ?auto_484922 ?auto_484926 ) ) ( not ( = ?auto_484922 ?auto_484927 ) ) ( not ( = ?auto_484922 ?auto_484928 ) ) ( not ( = ?auto_484922 ?auto_484929 ) ) ( not ( = ?auto_484922 ?auto_484930 ) ) ( not ( = ?auto_484922 ?auto_484931 ) ) ( not ( = ?auto_484923 ?auto_484924 ) ) ( not ( = ?auto_484923 ?auto_484925 ) ) ( not ( = ?auto_484923 ?auto_484926 ) ) ( not ( = ?auto_484923 ?auto_484927 ) ) ( not ( = ?auto_484923 ?auto_484928 ) ) ( not ( = ?auto_484923 ?auto_484929 ) ) ( not ( = ?auto_484923 ?auto_484930 ) ) ( not ( = ?auto_484923 ?auto_484931 ) ) ( not ( = ?auto_484924 ?auto_484925 ) ) ( not ( = ?auto_484924 ?auto_484926 ) ) ( not ( = ?auto_484924 ?auto_484927 ) ) ( not ( = ?auto_484924 ?auto_484928 ) ) ( not ( = ?auto_484924 ?auto_484929 ) ) ( not ( = ?auto_484924 ?auto_484930 ) ) ( not ( = ?auto_484924 ?auto_484931 ) ) ( not ( = ?auto_484925 ?auto_484926 ) ) ( not ( = ?auto_484925 ?auto_484927 ) ) ( not ( = ?auto_484925 ?auto_484928 ) ) ( not ( = ?auto_484925 ?auto_484929 ) ) ( not ( = ?auto_484925 ?auto_484930 ) ) ( not ( = ?auto_484925 ?auto_484931 ) ) ( not ( = ?auto_484926 ?auto_484927 ) ) ( not ( = ?auto_484926 ?auto_484928 ) ) ( not ( = ?auto_484926 ?auto_484929 ) ) ( not ( = ?auto_484926 ?auto_484930 ) ) ( not ( = ?auto_484926 ?auto_484931 ) ) ( not ( = ?auto_484927 ?auto_484928 ) ) ( not ( = ?auto_484927 ?auto_484929 ) ) ( not ( = ?auto_484927 ?auto_484930 ) ) ( not ( = ?auto_484927 ?auto_484931 ) ) ( not ( = ?auto_484928 ?auto_484929 ) ) ( not ( = ?auto_484928 ?auto_484930 ) ) ( not ( = ?auto_484928 ?auto_484931 ) ) ( not ( = ?auto_484929 ?auto_484930 ) ) ( not ( = ?auto_484929 ?auto_484931 ) ) ( not ( = ?auto_484930 ?auto_484931 ) ) ( ON ?auto_484929 ?auto_484930 ) ( ON ?auto_484928 ?auto_484929 ) ( ON ?auto_484927 ?auto_484928 ) ( ON ?auto_484926 ?auto_484927 ) ( ON ?auto_484925 ?auto_484926 ) ( ON ?auto_484924 ?auto_484925 ) ( CLEAR ?auto_484922 ) ( ON ?auto_484923 ?auto_484924 ) ( CLEAR ?auto_484923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_484922 ?auto_484923 )
      ( MAKE-9PILE ?auto_484922 ?auto_484923 ?auto_484924 ?auto_484925 ?auto_484926 ?auto_484927 ?auto_484928 ?auto_484929 ?auto_484930 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_484960 - BLOCK
      ?auto_484961 - BLOCK
      ?auto_484962 - BLOCK
      ?auto_484963 - BLOCK
      ?auto_484964 - BLOCK
      ?auto_484965 - BLOCK
      ?auto_484966 - BLOCK
      ?auto_484967 - BLOCK
      ?auto_484968 - BLOCK
    )
    :vars
    (
      ?auto_484969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_484968 ?auto_484969 ) ( not ( = ?auto_484960 ?auto_484961 ) ) ( not ( = ?auto_484960 ?auto_484962 ) ) ( not ( = ?auto_484960 ?auto_484963 ) ) ( not ( = ?auto_484960 ?auto_484964 ) ) ( not ( = ?auto_484960 ?auto_484965 ) ) ( not ( = ?auto_484960 ?auto_484966 ) ) ( not ( = ?auto_484960 ?auto_484967 ) ) ( not ( = ?auto_484960 ?auto_484968 ) ) ( not ( = ?auto_484960 ?auto_484969 ) ) ( not ( = ?auto_484961 ?auto_484962 ) ) ( not ( = ?auto_484961 ?auto_484963 ) ) ( not ( = ?auto_484961 ?auto_484964 ) ) ( not ( = ?auto_484961 ?auto_484965 ) ) ( not ( = ?auto_484961 ?auto_484966 ) ) ( not ( = ?auto_484961 ?auto_484967 ) ) ( not ( = ?auto_484961 ?auto_484968 ) ) ( not ( = ?auto_484961 ?auto_484969 ) ) ( not ( = ?auto_484962 ?auto_484963 ) ) ( not ( = ?auto_484962 ?auto_484964 ) ) ( not ( = ?auto_484962 ?auto_484965 ) ) ( not ( = ?auto_484962 ?auto_484966 ) ) ( not ( = ?auto_484962 ?auto_484967 ) ) ( not ( = ?auto_484962 ?auto_484968 ) ) ( not ( = ?auto_484962 ?auto_484969 ) ) ( not ( = ?auto_484963 ?auto_484964 ) ) ( not ( = ?auto_484963 ?auto_484965 ) ) ( not ( = ?auto_484963 ?auto_484966 ) ) ( not ( = ?auto_484963 ?auto_484967 ) ) ( not ( = ?auto_484963 ?auto_484968 ) ) ( not ( = ?auto_484963 ?auto_484969 ) ) ( not ( = ?auto_484964 ?auto_484965 ) ) ( not ( = ?auto_484964 ?auto_484966 ) ) ( not ( = ?auto_484964 ?auto_484967 ) ) ( not ( = ?auto_484964 ?auto_484968 ) ) ( not ( = ?auto_484964 ?auto_484969 ) ) ( not ( = ?auto_484965 ?auto_484966 ) ) ( not ( = ?auto_484965 ?auto_484967 ) ) ( not ( = ?auto_484965 ?auto_484968 ) ) ( not ( = ?auto_484965 ?auto_484969 ) ) ( not ( = ?auto_484966 ?auto_484967 ) ) ( not ( = ?auto_484966 ?auto_484968 ) ) ( not ( = ?auto_484966 ?auto_484969 ) ) ( not ( = ?auto_484967 ?auto_484968 ) ) ( not ( = ?auto_484967 ?auto_484969 ) ) ( not ( = ?auto_484968 ?auto_484969 ) ) ( ON ?auto_484967 ?auto_484968 ) ( ON ?auto_484966 ?auto_484967 ) ( ON ?auto_484965 ?auto_484966 ) ( ON ?auto_484964 ?auto_484965 ) ( ON ?auto_484963 ?auto_484964 ) ( ON ?auto_484962 ?auto_484963 ) ( ON ?auto_484961 ?auto_484962 ) ( ON ?auto_484960 ?auto_484961 ) ( CLEAR ?auto_484960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_484960 )
      ( MAKE-9PILE ?auto_484960 ?auto_484961 ?auto_484962 ?auto_484963 ?auto_484964 ?auto_484965 ?auto_484966 ?auto_484967 ?auto_484968 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_484999 - BLOCK
      ?auto_485000 - BLOCK
      ?auto_485001 - BLOCK
      ?auto_485002 - BLOCK
      ?auto_485003 - BLOCK
      ?auto_485004 - BLOCK
      ?auto_485005 - BLOCK
      ?auto_485006 - BLOCK
      ?auto_485007 - BLOCK
      ?auto_485008 - BLOCK
    )
    :vars
    (
      ?auto_485009 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_485007 ) ( ON ?auto_485008 ?auto_485009 ) ( CLEAR ?auto_485008 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_484999 ) ( ON ?auto_485000 ?auto_484999 ) ( ON ?auto_485001 ?auto_485000 ) ( ON ?auto_485002 ?auto_485001 ) ( ON ?auto_485003 ?auto_485002 ) ( ON ?auto_485004 ?auto_485003 ) ( ON ?auto_485005 ?auto_485004 ) ( ON ?auto_485006 ?auto_485005 ) ( ON ?auto_485007 ?auto_485006 ) ( not ( = ?auto_484999 ?auto_485000 ) ) ( not ( = ?auto_484999 ?auto_485001 ) ) ( not ( = ?auto_484999 ?auto_485002 ) ) ( not ( = ?auto_484999 ?auto_485003 ) ) ( not ( = ?auto_484999 ?auto_485004 ) ) ( not ( = ?auto_484999 ?auto_485005 ) ) ( not ( = ?auto_484999 ?auto_485006 ) ) ( not ( = ?auto_484999 ?auto_485007 ) ) ( not ( = ?auto_484999 ?auto_485008 ) ) ( not ( = ?auto_484999 ?auto_485009 ) ) ( not ( = ?auto_485000 ?auto_485001 ) ) ( not ( = ?auto_485000 ?auto_485002 ) ) ( not ( = ?auto_485000 ?auto_485003 ) ) ( not ( = ?auto_485000 ?auto_485004 ) ) ( not ( = ?auto_485000 ?auto_485005 ) ) ( not ( = ?auto_485000 ?auto_485006 ) ) ( not ( = ?auto_485000 ?auto_485007 ) ) ( not ( = ?auto_485000 ?auto_485008 ) ) ( not ( = ?auto_485000 ?auto_485009 ) ) ( not ( = ?auto_485001 ?auto_485002 ) ) ( not ( = ?auto_485001 ?auto_485003 ) ) ( not ( = ?auto_485001 ?auto_485004 ) ) ( not ( = ?auto_485001 ?auto_485005 ) ) ( not ( = ?auto_485001 ?auto_485006 ) ) ( not ( = ?auto_485001 ?auto_485007 ) ) ( not ( = ?auto_485001 ?auto_485008 ) ) ( not ( = ?auto_485001 ?auto_485009 ) ) ( not ( = ?auto_485002 ?auto_485003 ) ) ( not ( = ?auto_485002 ?auto_485004 ) ) ( not ( = ?auto_485002 ?auto_485005 ) ) ( not ( = ?auto_485002 ?auto_485006 ) ) ( not ( = ?auto_485002 ?auto_485007 ) ) ( not ( = ?auto_485002 ?auto_485008 ) ) ( not ( = ?auto_485002 ?auto_485009 ) ) ( not ( = ?auto_485003 ?auto_485004 ) ) ( not ( = ?auto_485003 ?auto_485005 ) ) ( not ( = ?auto_485003 ?auto_485006 ) ) ( not ( = ?auto_485003 ?auto_485007 ) ) ( not ( = ?auto_485003 ?auto_485008 ) ) ( not ( = ?auto_485003 ?auto_485009 ) ) ( not ( = ?auto_485004 ?auto_485005 ) ) ( not ( = ?auto_485004 ?auto_485006 ) ) ( not ( = ?auto_485004 ?auto_485007 ) ) ( not ( = ?auto_485004 ?auto_485008 ) ) ( not ( = ?auto_485004 ?auto_485009 ) ) ( not ( = ?auto_485005 ?auto_485006 ) ) ( not ( = ?auto_485005 ?auto_485007 ) ) ( not ( = ?auto_485005 ?auto_485008 ) ) ( not ( = ?auto_485005 ?auto_485009 ) ) ( not ( = ?auto_485006 ?auto_485007 ) ) ( not ( = ?auto_485006 ?auto_485008 ) ) ( not ( = ?auto_485006 ?auto_485009 ) ) ( not ( = ?auto_485007 ?auto_485008 ) ) ( not ( = ?auto_485007 ?auto_485009 ) ) ( not ( = ?auto_485008 ?auto_485009 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_485008 ?auto_485009 )
      ( !STACK ?auto_485008 ?auto_485007 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_485041 - BLOCK
      ?auto_485042 - BLOCK
      ?auto_485043 - BLOCK
      ?auto_485044 - BLOCK
      ?auto_485045 - BLOCK
      ?auto_485046 - BLOCK
      ?auto_485047 - BLOCK
      ?auto_485048 - BLOCK
      ?auto_485049 - BLOCK
      ?auto_485050 - BLOCK
    )
    :vars
    (
      ?auto_485051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485050 ?auto_485051 ) ( ON-TABLE ?auto_485041 ) ( ON ?auto_485042 ?auto_485041 ) ( ON ?auto_485043 ?auto_485042 ) ( ON ?auto_485044 ?auto_485043 ) ( ON ?auto_485045 ?auto_485044 ) ( ON ?auto_485046 ?auto_485045 ) ( ON ?auto_485047 ?auto_485046 ) ( ON ?auto_485048 ?auto_485047 ) ( not ( = ?auto_485041 ?auto_485042 ) ) ( not ( = ?auto_485041 ?auto_485043 ) ) ( not ( = ?auto_485041 ?auto_485044 ) ) ( not ( = ?auto_485041 ?auto_485045 ) ) ( not ( = ?auto_485041 ?auto_485046 ) ) ( not ( = ?auto_485041 ?auto_485047 ) ) ( not ( = ?auto_485041 ?auto_485048 ) ) ( not ( = ?auto_485041 ?auto_485049 ) ) ( not ( = ?auto_485041 ?auto_485050 ) ) ( not ( = ?auto_485041 ?auto_485051 ) ) ( not ( = ?auto_485042 ?auto_485043 ) ) ( not ( = ?auto_485042 ?auto_485044 ) ) ( not ( = ?auto_485042 ?auto_485045 ) ) ( not ( = ?auto_485042 ?auto_485046 ) ) ( not ( = ?auto_485042 ?auto_485047 ) ) ( not ( = ?auto_485042 ?auto_485048 ) ) ( not ( = ?auto_485042 ?auto_485049 ) ) ( not ( = ?auto_485042 ?auto_485050 ) ) ( not ( = ?auto_485042 ?auto_485051 ) ) ( not ( = ?auto_485043 ?auto_485044 ) ) ( not ( = ?auto_485043 ?auto_485045 ) ) ( not ( = ?auto_485043 ?auto_485046 ) ) ( not ( = ?auto_485043 ?auto_485047 ) ) ( not ( = ?auto_485043 ?auto_485048 ) ) ( not ( = ?auto_485043 ?auto_485049 ) ) ( not ( = ?auto_485043 ?auto_485050 ) ) ( not ( = ?auto_485043 ?auto_485051 ) ) ( not ( = ?auto_485044 ?auto_485045 ) ) ( not ( = ?auto_485044 ?auto_485046 ) ) ( not ( = ?auto_485044 ?auto_485047 ) ) ( not ( = ?auto_485044 ?auto_485048 ) ) ( not ( = ?auto_485044 ?auto_485049 ) ) ( not ( = ?auto_485044 ?auto_485050 ) ) ( not ( = ?auto_485044 ?auto_485051 ) ) ( not ( = ?auto_485045 ?auto_485046 ) ) ( not ( = ?auto_485045 ?auto_485047 ) ) ( not ( = ?auto_485045 ?auto_485048 ) ) ( not ( = ?auto_485045 ?auto_485049 ) ) ( not ( = ?auto_485045 ?auto_485050 ) ) ( not ( = ?auto_485045 ?auto_485051 ) ) ( not ( = ?auto_485046 ?auto_485047 ) ) ( not ( = ?auto_485046 ?auto_485048 ) ) ( not ( = ?auto_485046 ?auto_485049 ) ) ( not ( = ?auto_485046 ?auto_485050 ) ) ( not ( = ?auto_485046 ?auto_485051 ) ) ( not ( = ?auto_485047 ?auto_485048 ) ) ( not ( = ?auto_485047 ?auto_485049 ) ) ( not ( = ?auto_485047 ?auto_485050 ) ) ( not ( = ?auto_485047 ?auto_485051 ) ) ( not ( = ?auto_485048 ?auto_485049 ) ) ( not ( = ?auto_485048 ?auto_485050 ) ) ( not ( = ?auto_485048 ?auto_485051 ) ) ( not ( = ?auto_485049 ?auto_485050 ) ) ( not ( = ?auto_485049 ?auto_485051 ) ) ( not ( = ?auto_485050 ?auto_485051 ) ) ( CLEAR ?auto_485048 ) ( ON ?auto_485049 ?auto_485050 ) ( CLEAR ?auto_485049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_485041 ?auto_485042 ?auto_485043 ?auto_485044 ?auto_485045 ?auto_485046 ?auto_485047 ?auto_485048 ?auto_485049 )
      ( MAKE-10PILE ?auto_485041 ?auto_485042 ?auto_485043 ?auto_485044 ?auto_485045 ?auto_485046 ?auto_485047 ?auto_485048 ?auto_485049 ?auto_485050 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_485083 - BLOCK
      ?auto_485084 - BLOCK
      ?auto_485085 - BLOCK
      ?auto_485086 - BLOCK
      ?auto_485087 - BLOCK
      ?auto_485088 - BLOCK
      ?auto_485089 - BLOCK
      ?auto_485090 - BLOCK
      ?auto_485091 - BLOCK
      ?auto_485092 - BLOCK
    )
    :vars
    (
      ?auto_485093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485092 ?auto_485093 ) ( ON-TABLE ?auto_485083 ) ( ON ?auto_485084 ?auto_485083 ) ( ON ?auto_485085 ?auto_485084 ) ( ON ?auto_485086 ?auto_485085 ) ( ON ?auto_485087 ?auto_485086 ) ( ON ?auto_485088 ?auto_485087 ) ( ON ?auto_485089 ?auto_485088 ) ( not ( = ?auto_485083 ?auto_485084 ) ) ( not ( = ?auto_485083 ?auto_485085 ) ) ( not ( = ?auto_485083 ?auto_485086 ) ) ( not ( = ?auto_485083 ?auto_485087 ) ) ( not ( = ?auto_485083 ?auto_485088 ) ) ( not ( = ?auto_485083 ?auto_485089 ) ) ( not ( = ?auto_485083 ?auto_485090 ) ) ( not ( = ?auto_485083 ?auto_485091 ) ) ( not ( = ?auto_485083 ?auto_485092 ) ) ( not ( = ?auto_485083 ?auto_485093 ) ) ( not ( = ?auto_485084 ?auto_485085 ) ) ( not ( = ?auto_485084 ?auto_485086 ) ) ( not ( = ?auto_485084 ?auto_485087 ) ) ( not ( = ?auto_485084 ?auto_485088 ) ) ( not ( = ?auto_485084 ?auto_485089 ) ) ( not ( = ?auto_485084 ?auto_485090 ) ) ( not ( = ?auto_485084 ?auto_485091 ) ) ( not ( = ?auto_485084 ?auto_485092 ) ) ( not ( = ?auto_485084 ?auto_485093 ) ) ( not ( = ?auto_485085 ?auto_485086 ) ) ( not ( = ?auto_485085 ?auto_485087 ) ) ( not ( = ?auto_485085 ?auto_485088 ) ) ( not ( = ?auto_485085 ?auto_485089 ) ) ( not ( = ?auto_485085 ?auto_485090 ) ) ( not ( = ?auto_485085 ?auto_485091 ) ) ( not ( = ?auto_485085 ?auto_485092 ) ) ( not ( = ?auto_485085 ?auto_485093 ) ) ( not ( = ?auto_485086 ?auto_485087 ) ) ( not ( = ?auto_485086 ?auto_485088 ) ) ( not ( = ?auto_485086 ?auto_485089 ) ) ( not ( = ?auto_485086 ?auto_485090 ) ) ( not ( = ?auto_485086 ?auto_485091 ) ) ( not ( = ?auto_485086 ?auto_485092 ) ) ( not ( = ?auto_485086 ?auto_485093 ) ) ( not ( = ?auto_485087 ?auto_485088 ) ) ( not ( = ?auto_485087 ?auto_485089 ) ) ( not ( = ?auto_485087 ?auto_485090 ) ) ( not ( = ?auto_485087 ?auto_485091 ) ) ( not ( = ?auto_485087 ?auto_485092 ) ) ( not ( = ?auto_485087 ?auto_485093 ) ) ( not ( = ?auto_485088 ?auto_485089 ) ) ( not ( = ?auto_485088 ?auto_485090 ) ) ( not ( = ?auto_485088 ?auto_485091 ) ) ( not ( = ?auto_485088 ?auto_485092 ) ) ( not ( = ?auto_485088 ?auto_485093 ) ) ( not ( = ?auto_485089 ?auto_485090 ) ) ( not ( = ?auto_485089 ?auto_485091 ) ) ( not ( = ?auto_485089 ?auto_485092 ) ) ( not ( = ?auto_485089 ?auto_485093 ) ) ( not ( = ?auto_485090 ?auto_485091 ) ) ( not ( = ?auto_485090 ?auto_485092 ) ) ( not ( = ?auto_485090 ?auto_485093 ) ) ( not ( = ?auto_485091 ?auto_485092 ) ) ( not ( = ?auto_485091 ?auto_485093 ) ) ( not ( = ?auto_485092 ?auto_485093 ) ) ( ON ?auto_485091 ?auto_485092 ) ( CLEAR ?auto_485089 ) ( ON ?auto_485090 ?auto_485091 ) ( CLEAR ?auto_485090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_485083 ?auto_485084 ?auto_485085 ?auto_485086 ?auto_485087 ?auto_485088 ?auto_485089 ?auto_485090 )
      ( MAKE-10PILE ?auto_485083 ?auto_485084 ?auto_485085 ?auto_485086 ?auto_485087 ?auto_485088 ?auto_485089 ?auto_485090 ?auto_485091 ?auto_485092 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_485125 - BLOCK
      ?auto_485126 - BLOCK
      ?auto_485127 - BLOCK
      ?auto_485128 - BLOCK
      ?auto_485129 - BLOCK
      ?auto_485130 - BLOCK
      ?auto_485131 - BLOCK
      ?auto_485132 - BLOCK
      ?auto_485133 - BLOCK
      ?auto_485134 - BLOCK
    )
    :vars
    (
      ?auto_485135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485134 ?auto_485135 ) ( ON-TABLE ?auto_485125 ) ( ON ?auto_485126 ?auto_485125 ) ( ON ?auto_485127 ?auto_485126 ) ( ON ?auto_485128 ?auto_485127 ) ( ON ?auto_485129 ?auto_485128 ) ( ON ?auto_485130 ?auto_485129 ) ( not ( = ?auto_485125 ?auto_485126 ) ) ( not ( = ?auto_485125 ?auto_485127 ) ) ( not ( = ?auto_485125 ?auto_485128 ) ) ( not ( = ?auto_485125 ?auto_485129 ) ) ( not ( = ?auto_485125 ?auto_485130 ) ) ( not ( = ?auto_485125 ?auto_485131 ) ) ( not ( = ?auto_485125 ?auto_485132 ) ) ( not ( = ?auto_485125 ?auto_485133 ) ) ( not ( = ?auto_485125 ?auto_485134 ) ) ( not ( = ?auto_485125 ?auto_485135 ) ) ( not ( = ?auto_485126 ?auto_485127 ) ) ( not ( = ?auto_485126 ?auto_485128 ) ) ( not ( = ?auto_485126 ?auto_485129 ) ) ( not ( = ?auto_485126 ?auto_485130 ) ) ( not ( = ?auto_485126 ?auto_485131 ) ) ( not ( = ?auto_485126 ?auto_485132 ) ) ( not ( = ?auto_485126 ?auto_485133 ) ) ( not ( = ?auto_485126 ?auto_485134 ) ) ( not ( = ?auto_485126 ?auto_485135 ) ) ( not ( = ?auto_485127 ?auto_485128 ) ) ( not ( = ?auto_485127 ?auto_485129 ) ) ( not ( = ?auto_485127 ?auto_485130 ) ) ( not ( = ?auto_485127 ?auto_485131 ) ) ( not ( = ?auto_485127 ?auto_485132 ) ) ( not ( = ?auto_485127 ?auto_485133 ) ) ( not ( = ?auto_485127 ?auto_485134 ) ) ( not ( = ?auto_485127 ?auto_485135 ) ) ( not ( = ?auto_485128 ?auto_485129 ) ) ( not ( = ?auto_485128 ?auto_485130 ) ) ( not ( = ?auto_485128 ?auto_485131 ) ) ( not ( = ?auto_485128 ?auto_485132 ) ) ( not ( = ?auto_485128 ?auto_485133 ) ) ( not ( = ?auto_485128 ?auto_485134 ) ) ( not ( = ?auto_485128 ?auto_485135 ) ) ( not ( = ?auto_485129 ?auto_485130 ) ) ( not ( = ?auto_485129 ?auto_485131 ) ) ( not ( = ?auto_485129 ?auto_485132 ) ) ( not ( = ?auto_485129 ?auto_485133 ) ) ( not ( = ?auto_485129 ?auto_485134 ) ) ( not ( = ?auto_485129 ?auto_485135 ) ) ( not ( = ?auto_485130 ?auto_485131 ) ) ( not ( = ?auto_485130 ?auto_485132 ) ) ( not ( = ?auto_485130 ?auto_485133 ) ) ( not ( = ?auto_485130 ?auto_485134 ) ) ( not ( = ?auto_485130 ?auto_485135 ) ) ( not ( = ?auto_485131 ?auto_485132 ) ) ( not ( = ?auto_485131 ?auto_485133 ) ) ( not ( = ?auto_485131 ?auto_485134 ) ) ( not ( = ?auto_485131 ?auto_485135 ) ) ( not ( = ?auto_485132 ?auto_485133 ) ) ( not ( = ?auto_485132 ?auto_485134 ) ) ( not ( = ?auto_485132 ?auto_485135 ) ) ( not ( = ?auto_485133 ?auto_485134 ) ) ( not ( = ?auto_485133 ?auto_485135 ) ) ( not ( = ?auto_485134 ?auto_485135 ) ) ( ON ?auto_485133 ?auto_485134 ) ( ON ?auto_485132 ?auto_485133 ) ( CLEAR ?auto_485130 ) ( ON ?auto_485131 ?auto_485132 ) ( CLEAR ?auto_485131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_485125 ?auto_485126 ?auto_485127 ?auto_485128 ?auto_485129 ?auto_485130 ?auto_485131 )
      ( MAKE-10PILE ?auto_485125 ?auto_485126 ?auto_485127 ?auto_485128 ?auto_485129 ?auto_485130 ?auto_485131 ?auto_485132 ?auto_485133 ?auto_485134 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_485167 - BLOCK
      ?auto_485168 - BLOCK
      ?auto_485169 - BLOCK
      ?auto_485170 - BLOCK
      ?auto_485171 - BLOCK
      ?auto_485172 - BLOCK
      ?auto_485173 - BLOCK
      ?auto_485174 - BLOCK
      ?auto_485175 - BLOCK
      ?auto_485176 - BLOCK
    )
    :vars
    (
      ?auto_485177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485176 ?auto_485177 ) ( ON-TABLE ?auto_485167 ) ( ON ?auto_485168 ?auto_485167 ) ( ON ?auto_485169 ?auto_485168 ) ( ON ?auto_485170 ?auto_485169 ) ( ON ?auto_485171 ?auto_485170 ) ( not ( = ?auto_485167 ?auto_485168 ) ) ( not ( = ?auto_485167 ?auto_485169 ) ) ( not ( = ?auto_485167 ?auto_485170 ) ) ( not ( = ?auto_485167 ?auto_485171 ) ) ( not ( = ?auto_485167 ?auto_485172 ) ) ( not ( = ?auto_485167 ?auto_485173 ) ) ( not ( = ?auto_485167 ?auto_485174 ) ) ( not ( = ?auto_485167 ?auto_485175 ) ) ( not ( = ?auto_485167 ?auto_485176 ) ) ( not ( = ?auto_485167 ?auto_485177 ) ) ( not ( = ?auto_485168 ?auto_485169 ) ) ( not ( = ?auto_485168 ?auto_485170 ) ) ( not ( = ?auto_485168 ?auto_485171 ) ) ( not ( = ?auto_485168 ?auto_485172 ) ) ( not ( = ?auto_485168 ?auto_485173 ) ) ( not ( = ?auto_485168 ?auto_485174 ) ) ( not ( = ?auto_485168 ?auto_485175 ) ) ( not ( = ?auto_485168 ?auto_485176 ) ) ( not ( = ?auto_485168 ?auto_485177 ) ) ( not ( = ?auto_485169 ?auto_485170 ) ) ( not ( = ?auto_485169 ?auto_485171 ) ) ( not ( = ?auto_485169 ?auto_485172 ) ) ( not ( = ?auto_485169 ?auto_485173 ) ) ( not ( = ?auto_485169 ?auto_485174 ) ) ( not ( = ?auto_485169 ?auto_485175 ) ) ( not ( = ?auto_485169 ?auto_485176 ) ) ( not ( = ?auto_485169 ?auto_485177 ) ) ( not ( = ?auto_485170 ?auto_485171 ) ) ( not ( = ?auto_485170 ?auto_485172 ) ) ( not ( = ?auto_485170 ?auto_485173 ) ) ( not ( = ?auto_485170 ?auto_485174 ) ) ( not ( = ?auto_485170 ?auto_485175 ) ) ( not ( = ?auto_485170 ?auto_485176 ) ) ( not ( = ?auto_485170 ?auto_485177 ) ) ( not ( = ?auto_485171 ?auto_485172 ) ) ( not ( = ?auto_485171 ?auto_485173 ) ) ( not ( = ?auto_485171 ?auto_485174 ) ) ( not ( = ?auto_485171 ?auto_485175 ) ) ( not ( = ?auto_485171 ?auto_485176 ) ) ( not ( = ?auto_485171 ?auto_485177 ) ) ( not ( = ?auto_485172 ?auto_485173 ) ) ( not ( = ?auto_485172 ?auto_485174 ) ) ( not ( = ?auto_485172 ?auto_485175 ) ) ( not ( = ?auto_485172 ?auto_485176 ) ) ( not ( = ?auto_485172 ?auto_485177 ) ) ( not ( = ?auto_485173 ?auto_485174 ) ) ( not ( = ?auto_485173 ?auto_485175 ) ) ( not ( = ?auto_485173 ?auto_485176 ) ) ( not ( = ?auto_485173 ?auto_485177 ) ) ( not ( = ?auto_485174 ?auto_485175 ) ) ( not ( = ?auto_485174 ?auto_485176 ) ) ( not ( = ?auto_485174 ?auto_485177 ) ) ( not ( = ?auto_485175 ?auto_485176 ) ) ( not ( = ?auto_485175 ?auto_485177 ) ) ( not ( = ?auto_485176 ?auto_485177 ) ) ( ON ?auto_485175 ?auto_485176 ) ( ON ?auto_485174 ?auto_485175 ) ( ON ?auto_485173 ?auto_485174 ) ( CLEAR ?auto_485171 ) ( ON ?auto_485172 ?auto_485173 ) ( CLEAR ?auto_485172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_485167 ?auto_485168 ?auto_485169 ?auto_485170 ?auto_485171 ?auto_485172 )
      ( MAKE-10PILE ?auto_485167 ?auto_485168 ?auto_485169 ?auto_485170 ?auto_485171 ?auto_485172 ?auto_485173 ?auto_485174 ?auto_485175 ?auto_485176 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_485209 - BLOCK
      ?auto_485210 - BLOCK
      ?auto_485211 - BLOCK
      ?auto_485212 - BLOCK
      ?auto_485213 - BLOCK
      ?auto_485214 - BLOCK
      ?auto_485215 - BLOCK
      ?auto_485216 - BLOCK
      ?auto_485217 - BLOCK
      ?auto_485218 - BLOCK
    )
    :vars
    (
      ?auto_485219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485218 ?auto_485219 ) ( ON-TABLE ?auto_485209 ) ( ON ?auto_485210 ?auto_485209 ) ( ON ?auto_485211 ?auto_485210 ) ( ON ?auto_485212 ?auto_485211 ) ( not ( = ?auto_485209 ?auto_485210 ) ) ( not ( = ?auto_485209 ?auto_485211 ) ) ( not ( = ?auto_485209 ?auto_485212 ) ) ( not ( = ?auto_485209 ?auto_485213 ) ) ( not ( = ?auto_485209 ?auto_485214 ) ) ( not ( = ?auto_485209 ?auto_485215 ) ) ( not ( = ?auto_485209 ?auto_485216 ) ) ( not ( = ?auto_485209 ?auto_485217 ) ) ( not ( = ?auto_485209 ?auto_485218 ) ) ( not ( = ?auto_485209 ?auto_485219 ) ) ( not ( = ?auto_485210 ?auto_485211 ) ) ( not ( = ?auto_485210 ?auto_485212 ) ) ( not ( = ?auto_485210 ?auto_485213 ) ) ( not ( = ?auto_485210 ?auto_485214 ) ) ( not ( = ?auto_485210 ?auto_485215 ) ) ( not ( = ?auto_485210 ?auto_485216 ) ) ( not ( = ?auto_485210 ?auto_485217 ) ) ( not ( = ?auto_485210 ?auto_485218 ) ) ( not ( = ?auto_485210 ?auto_485219 ) ) ( not ( = ?auto_485211 ?auto_485212 ) ) ( not ( = ?auto_485211 ?auto_485213 ) ) ( not ( = ?auto_485211 ?auto_485214 ) ) ( not ( = ?auto_485211 ?auto_485215 ) ) ( not ( = ?auto_485211 ?auto_485216 ) ) ( not ( = ?auto_485211 ?auto_485217 ) ) ( not ( = ?auto_485211 ?auto_485218 ) ) ( not ( = ?auto_485211 ?auto_485219 ) ) ( not ( = ?auto_485212 ?auto_485213 ) ) ( not ( = ?auto_485212 ?auto_485214 ) ) ( not ( = ?auto_485212 ?auto_485215 ) ) ( not ( = ?auto_485212 ?auto_485216 ) ) ( not ( = ?auto_485212 ?auto_485217 ) ) ( not ( = ?auto_485212 ?auto_485218 ) ) ( not ( = ?auto_485212 ?auto_485219 ) ) ( not ( = ?auto_485213 ?auto_485214 ) ) ( not ( = ?auto_485213 ?auto_485215 ) ) ( not ( = ?auto_485213 ?auto_485216 ) ) ( not ( = ?auto_485213 ?auto_485217 ) ) ( not ( = ?auto_485213 ?auto_485218 ) ) ( not ( = ?auto_485213 ?auto_485219 ) ) ( not ( = ?auto_485214 ?auto_485215 ) ) ( not ( = ?auto_485214 ?auto_485216 ) ) ( not ( = ?auto_485214 ?auto_485217 ) ) ( not ( = ?auto_485214 ?auto_485218 ) ) ( not ( = ?auto_485214 ?auto_485219 ) ) ( not ( = ?auto_485215 ?auto_485216 ) ) ( not ( = ?auto_485215 ?auto_485217 ) ) ( not ( = ?auto_485215 ?auto_485218 ) ) ( not ( = ?auto_485215 ?auto_485219 ) ) ( not ( = ?auto_485216 ?auto_485217 ) ) ( not ( = ?auto_485216 ?auto_485218 ) ) ( not ( = ?auto_485216 ?auto_485219 ) ) ( not ( = ?auto_485217 ?auto_485218 ) ) ( not ( = ?auto_485217 ?auto_485219 ) ) ( not ( = ?auto_485218 ?auto_485219 ) ) ( ON ?auto_485217 ?auto_485218 ) ( ON ?auto_485216 ?auto_485217 ) ( ON ?auto_485215 ?auto_485216 ) ( ON ?auto_485214 ?auto_485215 ) ( CLEAR ?auto_485212 ) ( ON ?auto_485213 ?auto_485214 ) ( CLEAR ?auto_485213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_485209 ?auto_485210 ?auto_485211 ?auto_485212 ?auto_485213 )
      ( MAKE-10PILE ?auto_485209 ?auto_485210 ?auto_485211 ?auto_485212 ?auto_485213 ?auto_485214 ?auto_485215 ?auto_485216 ?auto_485217 ?auto_485218 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_485251 - BLOCK
      ?auto_485252 - BLOCK
      ?auto_485253 - BLOCK
      ?auto_485254 - BLOCK
      ?auto_485255 - BLOCK
      ?auto_485256 - BLOCK
      ?auto_485257 - BLOCK
      ?auto_485258 - BLOCK
      ?auto_485259 - BLOCK
      ?auto_485260 - BLOCK
    )
    :vars
    (
      ?auto_485261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485260 ?auto_485261 ) ( ON-TABLE ?auto_485251 ) ( ON ?auto_485252 ?auto_485251 ) ( ON ?auto_485253 ?auto_485252 ) ( not ( = ?auto_485251 ?auto_485252 ) ) ( not ( = ?auto_485251 ?auto_485253 ) ) ( not ( = ?auto_485251 ?auto_485254 ) ) ( not ( = ?auto_485251 ?auto_485255 ) ) ( not ( = ?auto_485251 ?auto_485256 ) ) ( not ( = ?auto_485251 ?auto_485257 ) ) ( not ( = ?auto_485251 ?auto_485258 ) ) ( not ( = ?auto_485251 ?auto_485259 ) ) ( not ( = ?auto_485251 ?auto_485260 ) ) ( not ( = ?auto_485251 ?auto_485261 ) ) ( not ( = ?auto_485252 ?auto_485253 ) ) ( not ( = ?auto_485252 ?auto_485254 ) ) ( not ( = ?auto_485252 ?auto_485255 ) ) ( not ( = ?auto_485252 ?auto_485256 ) ) ( not ( = ?auto_485252 ?auto_485257 ) ) ( not ( = ?auto_485252 ?auto_485258 ) ) ( not ( = ?auto_485252 ?auto_485259 ) ) ( not ( = ?auto_485252 ?auto_485260 ) ) ( not ( = ?auto_485252 ?auto_485261 ) ) ( not ( = ?auto_485253 ?auto_485254 ) ) ( not ( = ?auto_485253 ?auto_485255 ) ) ( not ( = ?auto_485253 ?auto_485256 ) ) ( not ( = ?auto_485253 ?auto_485257 ) ) ( not ( = ?auto_485253 ?auto_485258 ) ) ( not ( = ?auto_485253 ?auto_485259 ) ) ( not ( = ?auto_485253 ?auto_485260 ) ) ( not ( = ?auto_485253 ?auto_485261 ) ) ( not ( = ?auto_485254 ?auto_485255 ) ) ( not ( = ?auto_485254 ?auto_485256 ) ) ( not ( = ?auto_485254 ?auto_485257 ) ) ( not ( = ?auto_485254 ?auto_485258 ) ) ( not ( = ?auto_485254 ?auto_485259 ) ) ( not ( = ?auto_485254 ?auto_485260 ) ) ( not ( = ?auto_485254 ?auto_485261 ) ) ( not ( = ?auto_485255 ?auto_485256 ) ) ( not ( = ?auto_485255 ?auto_485257 ) ) ( not ( = ?auto_485255 ?auto_485258 ) ) ( not ( = ?auto_485255 ?auto_485259 ) ) ( not ( = ?auto_485255 ?auto_485260 ) ) ( not ( = ?auto_485255 ?auto_485261 ) ) ( not ( = ?auto_485256 ?auto_485257 ) ) ( not ( = ?auto_485256 ?auto_485258 ) ) ( not ( = ?auto_485256 ?auto_485259 ) ) ( not ( = ?auto_485256 ?auto_485260 ) ) ( not ( = ?auto_485256 ?auto_485261 ) ) ( not ( = ?auto_485257 ?auto_485258 ) ) ( not ( = ?auto_485257 ?auto_485259 ) ) ( not ( = ?auto_485257 ?auto_485260 ) ) ( not ( = ?auto_485257 ?auto_485261 ) ) ( not ( = ?auto_485258 ?auto_485259 ) ) ( not ( = ?auto_485258 ?auto_485260 ) ) ( not ( = ?auto_485258 ?auto_485261 ) ) ( not ( = ?auto_485259 ?auto_485260 ) ) ( not ( = ?auto_485259 ?auto_485261 ) ) ( not ( = ?auto_485260 ?auto_485261 ) ) ( ON ?auto_485259 ?auto_485260 ) ( ON ?auto_485258 ?auto_485259 ) ( ON ?auto_485257 ?auto_485258 ) ( ON ?auto_485256 ?auto_485257 ) ( ON ?auto_485255 ?auto_485256 ) ( CLEAR ?auto_485253 ) ( ON ?auto_485254 ?auto_485255 ) ( CLEAR ?auto_485254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_485251 ?auto_485252 ?auto_485253 ?auto_485254 )
      ( MAKE-10PILE ?auto_485251 ?auto_485252 ?auto_485253 ?auto_485254 ?auto_485255 ?auto_485256 ?auto_485257 ?auto_485258 ?auto_485259 ?auto_485260 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_485293 - BLOCK
      ?auto_485294 - BLOCK
      ?auto_485295 - BLOCK
      ?auto_485296 - BLOCK
      ?auto_485297 - BLOCK
      ?auto_485298 - BLOCK
      ?auto_485299 - BLOCK
      ?auto_485300 - BLOCK
      ?auto_485301 - BLOCK
      ?auto_485302 - BLOCK
    )
    :vars
    (
      ?auto_485303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485302 ?auto_485303 ) ( ON-TABLE ?auto_485293 ) ( ON ?auto_485294 ?auto_485293 ) ( not ( = ?auto_485293 ?auto_485294 ) ) ( not ( = ?auto_485293 ?auto_485295 ) ) ( not ( = ?auto_485293 ?auto_485296 ) ) ( not ( = ?auto_485293 ?auto_485297 ) ) ( not ( = ?auto_485293 ?auto_485298 ) ) ( not ( = ?auto_485293 ?auto_485299 ) ) ( not ( = ?auto_485293 ?auto_485300 ) ) ( not ( = ?auto_485293 ?auto_485301 ) ) ( not ( = ?auto_485293 ?auto_485302 ) ) ( not ( = ?auto_485293 ?auto_485303 ) ) ( not ( = ?auto_485294 ?auto_485295 ) ) ( not ( = ?auto_485294 ?auto_485296 ) ) ( not ( = ?auto_485294 ?auto_485297 ) ) ( not ( = ?auto_485294 ?auto_485298 ) ) ( not ( = ?auto_485294 ?auto_485299 ) ) ( not ( = ?auto_485294 ?auto_485300 ) ) ( not ( = ?auto_485294 ?auto_485301 ) ) ( not ( = ?auto_485294 ?auto_485302 ) ) ( not ( = ?auto_485294 ?auto_485303 ) ) ( not ( = ?auto_485295 ?auto_485296 ) ) ( not ( = ?auto_485295 ?auto_485297 ) ) ( not ( = ?auto_485295 ?auto_485298 ) ) ( not ( = ?auto_485295 ?auto_485299 ) ) ( not ( = ?auto_485295 ?auto_485300 ) ) ( not ( = ?auto_485295 ?auto_485301 ) ) ( not ( = ?auto_485295 ?auto_485302 ) ) ( not ( = ?auto_485295 ?auto_485303 ) ) ( not ( = ?auto_485296 ?auto_485297 ) ) ( not ( = ?auto_485296 ?auto_485298 ) ) ( not ( = ?auto_485296 ?auto_485299 ) ) ( not ( = ?auto_485296 ?auto_485300 ) ) ( not ( = ?auto_485296 ?auto_485301 ) ) ( not ( = ?auto_485296 ?auto_485302 ) ) ( not ( = ?auto_485296 ?auto_485303 ) ) ( not ( = ?auto_485297 ?auto_485298 ) ) ( not ( = ?auto_485297 ?auto_485299 ) ) ( not ( = ?auto_485297 ?auto_485300 ) ) ( not ( = ?auto_485297 ?auto_485301 ) ) ( not ( = ?auto_485297 ?auto_485302 ) ) ( not ( = ?auto_485297 ?auto_485303 ) ) ( not ( = ?auto_485298 ?auto_485299 ) ) ( not ( = ?auto_485298 ?auto_485300 ) ) ( not ( = ?auto_485298 ?auto_485301 ) ) ( not ( = ?auto_485298 ?auto_485302 ) ) ( not ( = ?auto_485298 ?auto_485303 ) ) ( not ( = ?auto_485299 ?auto_485300 ) ) ( not ( = ?auto_485299 ?auto_485301 ) ) ( not ( = ?auto_485299 ?auto_485302 ) ) ( not ( = ?auto_485299 ?auto_485303 ) ) ( not ( = ?auto_485300 ?auto_485301 ) ) ( not ( = ?auto_485300 ?auto_485302 ) ) ( not ( = ?auto_485300 ?auto_485303 ) ) ( not ( = ?auto_485301 ?auto_485302 ) ) ( not ( = ?auto_485301 ?auto_485303 ) ) ( not ( = ?auto_485302 ?auto_485303 ) ) ( ON ?auto_485301 ?auto_485302 ) ( ON ?auto_485300 ?auto_485301 ) ( ON ?auto_485299 ?auto_485300 ) ( ON ?auto_485298 ?auto_485299 ) ( ON ?auto_485297 ?auto_485298 ) ( ON ?auto_485296 ?auto_485297 ) ( CLEAR ?auto_485294 ) ( ON ?auto_485295 ?auto_485296 ) ( CLEAR ?auto_485295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_485293 ?auto_485294 ?auto_485295 )
      ( MAKE-10PILE ?auto_485293 ?auto_485294 ?auto_485295 ?auto_485296 ?auto_485297 ?auto_485298 ?auto_485299 ?auto_485300 ?auto_485301 ?auto_485302 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_485335 - BLOCK
      ?auto_485336 - BLOCK
      ?auto_485337 - BLOCK
      ?auto_485338 - BLOCK
      ?auto_485339 - BLOCK
      ?auto_485340 - BLOCK
      ?auto_485341 - BLOCK
      ?auto_485342 - BLOCK
      ?auto_485343 - BLOCK
      ?auto_485344 - BLOCK
    )
    :vars
    (
      ?auto_485345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485344 ?auto_485345 ) ( ON-TABLE ?auto_485335 ) ( not ( = ?auto_485335 ?auto_485336 ) ) ( not ( = ?auto_485335 ?auto_485337 ) ) ( not ( = ?auto_485335 ?auto_485338 ) ) ( not ( = ?auto_485335 ?auto_485339 ) ) ( not ( = ?auto_485335 ?auto_485340 ) ) ( not ( = ?auto_485335 ?auto_485341 ) ) ( not ( = ?auto_485335 ?auto_485342 ) ) ( not ( = ?auto_485335 ?auto_485343 ) ) ( not ( = ?auto_485335 ?auto_485344 ) ) ( not ( = ?auto_485335 ?auto_485345 ) ) ( not ( = ?auto_485336 ?auto_485337 ) ) ( not ( = ?auto_485336 ?auto_485338 ) ) ( not ( = ?auto_485336 ?auto_485339 ) ) ( not ( = ?auto_485336 ?auto_485340 ) ) ( not ( = ?auto_485336 ?auto_485341 ) ) ( not ( = ?auto_485336 ?auto_485342 ) ) ( not ( = ?auto_485336 ?auto_485343 ) ) ( not ( = ?auto_485336 ?auto_485344 ) ) ( not ( = ?auto_485336 ?auto_485345 ) ) ( not ( = ?auto_485337 ?auto_485338 ) ) ( not ( = ?auto_485337 ?auto_485339 ) ) ( not ( = ?auto_485337 ?auto_485340 ) ) ( not ( = ?auto_485337 ?auto_485341 ) ) ( not ( = ?auto_485337 ?auto_485342 ) ) ( not ( = ?auto_485337 ?auto_485343 ) ) ( not ( = ?auto_485337 ?auto_485344 ) ) ( not ( = ?auto_485337 ?auto_485345 ) ) ( not ( = ?auto_485338 ?auto_485339 ) ) ( not ( = ?auto_485338 ?auto_485340 ) ) ( not ( = ?auto_485338 ?auto_485341 ) ) ( not ( = ?auto_485338 ?auto_485342 ) ) ( not ( = ?auto_485338 ?auto_485343 ) ) ( not ( = ?auto_485338 ?auto_485344 ) ) ( not ( = ?auto_485338 ?auto_485345 ) ) ( not ( = ?auto_485339 ?auto_485340 ) ) ( not ( = ?auto_485339 ?auto_485341 ) ) ( not ( = ?auto_485339 ?auto_485342 ) ) ( not ( = ?auto_485339 ?auto_485343 ) ) ( not ( = ?auto_485339 ?auto_485344 ) ) ( not ( = ?auto_485339 ?auto_485345 ) ) ( not ( = ?auto_485340 ?auto_485341 ) ) ( not ( = ?auto_485340 ?auto_485342 ) ) ( not ( = ?auto_485340 ?auto_485343 ) ) ( not ( = ?auto_485340 ?auto_485344 ) ) ( not ( = ?auto_485340 ?auto_485345 ) ) ( not ( = ?auto_485341 ?auto_485342 ) ) ( not ( = ?auto_485341 ?auto_485343 ) ) ( not ( = ?auto_485341 ?auto_485344 ) ) ( not ( = ?auto_485341 ?auto_485345 ) ) ( not ( = ?auto_485342 ?auto_485343 ) ) ( not ( = ?auto_485342 ?auto_485344 ) ) ( not ( = ?auto_485342 ?auto_485345 ) ) ( not ( = ?auto_485343 ?auto_485344 ) ) ( not ( = ?auto_485343 ?auto_485345 ) ) ( not ( = ?auto_485344 ?auto_485345 ) ) ( ON ?auto_485343 ?auto_485344 ) ( ON ?auto_485342 ?auto_485343 ) ( ON ?auto_485341 ?auto_485342 ) ( ON ?auto_485340 ?auto_485341 ) ( ON ?auto_485339 ?auto_485340 ) ( ON ?auto_485338 ?auto_485339 ) ( ON ?auto_485337 ?auto_485338 ) ( CLEAR ?auto_485335 ) ( ON ?auto_485336 ?auto_485337 ) ( CLEAR ?auto_485336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_485335 ?auto_485336 )
      ( MAKE-10PILE ?auto_485335 ?auto_485336 ?auto_485337 ?auto_485338 ?auto_485339 ?auto_485340 ?auto_485341 ?auto_485342 ?auto_485343 ?auto_485344 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_485377 - BLOCK
      ?auto_485378 - BLOCK
      ?auto_485379 - BLOCK
      ?auto_485380 - BLOCK
      ?auto_485381 - BLOCK
      ?auto_485382 - BLOCK
      ?auto_485383 - BLOCK
      ?auto_485384 - BLOCK
      ?auto_485385 - BLOCK
      ?auto_485386 - BLOCK
    )
    :vars
    (
      ?auto_485387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485386 ?auto_485387 ) ( not ( = ?auto_485377 ?auto_485378 ) ) ( not ( = ?auto_485377 ?auto_485379 ) ) ( not ( = ?auto_485377 ?auto_485380 ) ) ( not ( = ?auto_485377 ?auto_485381 ) ) ( not ( = ?auto_485377 ?auto_485382 ) ) ( not ( = ?auto_485377 ?auto_485383 ) ) ( not ( = ?auto_485377 ?auto_485384 ) ) ( not ( = ?auto_485377 ?auto_485385 ) ) ( not ( = ?auto_485377 ?auto_485386 ) ) ( not ( = ?auto_485377 ?auto_485387 ) ) ( not ( = ?auto_485378 ?auto_485379 ) ) ( not ( = ?auto_485378 ?auto_485380 ) ) ( not ( = ?auto_485378 ?auto_485381 ) ) ( not ( = ?auto_485378 ?auto_485382 ) ) ( not ( = ?auto_485378 ?auto_485383 ) ) ( not ( = ?auto_485378 ?auto_485384 ) ) ( not ( = ?auto_485378 ?auto_485385 ) ) ( not ( = ?auto_485378 ?auto_485386 ) ) ( not ( = ?auto_485378 ?auto_485387 ) ) ( not ( = ?auto_485379 ?auto_485380 ) ) ( not ( = ?auto_485379 ?auto_485381 ) ) ( not ( = ?auto_485379 ?auto_485382 ) ) ( not ( = ?auto_485379 ?auto_485383 ) ) ( not ( = ?auto_485379 ?auto_485384 ) ) ( not ( = ?auto_485379 ?auto_485385 ) ) ( not ( = ?auto_485379 ?auto_485386 ) ) ( not ( = ?auto_485379 ?auto_485387 ) ) ( not ( = ?auto_485380 ?auto_485381 ) ) ( not ( = ?auto_485380 ?auto_485382 ) ) ( not ( = ?auto_485380 ?auto_485383 ) ) ( not ( = ?auto_485380 ?auto_485384 ) ) ( not ( = ?auto_485380 ?auto_485385 ) ) ( not ( = ?auto_485380 ?auto_485386 ) ) ( not ( = ?auto_485380 ?auto_485387 ) ) ( not ( = ?auto_485381 ?auto_485382 ) ) ( not ( = ?auto_485381 ?auto_485383 ) ) ( not ( = ?auto_485381 ?auto_485384 ) ) ( not ( = ?auto_485381 ?auto_485385 ) ) ( not ( = ?auto_485381 ?auto_485386 ) ) ( not ( = ?auto_485381 ?auto_485387 ) ) ( not ( = ?auto_485382 ?auto_485383 ) ) ( not ( = ?auto_485382 ?auto_485384 ) ) ( not ( = ?auto_485382 ?auto_485385 ) ) ( not ( = ?auto_485382 ?auto_485386 ) ) ( not ( = ?auto_485382 ?auto_485387 ) ) ( not ( = ?auto_485383 ?auto_485384 ) ) ( not ( = ?auto_485383 ?auto_485385 ) ) ( not ( = ?auto_485383 ?auto_485386 ) ) ( not ( = ?auto_485383 ?auto_485387 ) ) ( not ( = ?auto_485384 ?auto_485385 ) ) ( not ( = ?auto_485384 ?auto_485386 ) ) ( not ( = ?auto_485384 ?auto_485387 ) ) ( not ( = ?auto_485385 ?auto_485386 ) ) ( not ( = ?auto_485385 ?auto_485387 ) ) ( not ( = ?auto_485386 ?auto_485387 ) ) ( ON ?auto_485385 ?auto_485386 ) ( ON ?auto_485384 ?auto_485385 ) ( ON ?auto_485383 ?auto_485384 ) ( ON ?auto_485382 ?auto_485383 ) ( ON ?auto_485381 ?auto_485382 ) ( ON ?auto_485380 ?auto_485381 ) ( ON ?auto_485379 ?auto_485380 ) ( ON ?auto_485378 ?auto_485379 ) ( ON ?auto_485377 ?auto_485378 ) ( CLEAR ?auto_485377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_485377 )
      ( MAKE-10PILE ?auto_485377 ?auto_485378 ?auto_485379 ?auto_485380 ?auto_485381 ?auto_485382 ?auto_485383 ?auto_485384 ?auto_485385 ?auto_485386 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_485420 - BLOCK
      ?auto_485421 - BLOCK
      ?auto_485422 - BLOCK
      ?auto_485423 - BLOCK
      ?auto_485424 - BLOCK
      ?auto_485425 - BLOCK
      ?auto_485426 - BLOCK
      ?auto_485427 - BLOCK
      ?auto_485428 - BLOCK
      ?auto_485429 - BLOCK
      ?auto_485430 - BLOCK
    )
    :vars
    (
      ?auto_485431 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_485429 ) ( ON ?auto_485430 ?auto_485431 ) ( CLEAR ?auto_485430 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_485420 ) ( ON ?auto_485421 ?auto_485420 ) ( ON ?auto_485422 ?auto_485421 ) ( ON ?auto_485423 ?auto_485422 ) ( ON ?auto_485424 ?auto_485423 ) ( ON ?auto_485425 ?auto_485424 ) ( ON ?auto_485426 ?auto_485425 ) ( ON ?auto_485427 ?auto_485426 ) ( ON ?auto_485428 ?auto_485427 ) ( ON ?auto_485429 ?auto_485428 ) ( not ( = ?auto_485420 ?auto_485421 ) ) ( not ( = ?auto_485420 ?auto_485422 ) ) ( not ( = ?auto_485420 ?auto_485423 ) ) ( not ( = ?auto_485420 ?auto_485424 ) ) ( not ( = ?auto_485420 ?auto_485425 ) ) ( not ( = ?auto_485420 ?auto_485426 ) ) ( not ( = ?auto_485420 ?auto_485427 ) ) ( not ( = ?auto_485420 ?auto_485428 ) ) ( not ( = ?auto_485420 ?auto_485429 ) ) ( not ( = ?auto_485420 ?auto_485430 ) ) ( not ( = ?auto_485420 ?auto_485431 ) ) ( not ( = ?auto_485421 ?auto_485422 ) ) ( not ( = ?auto_485421 ?auto_485423 ) ) ( not ( = ?auto_485421 ?auto_485424 ) ) ( not ( = ?auto_485421 ?auto_485425 ) ) ( not ( = ?auto_485421 ?auto_485426 ) ) ( not ( = ?auto_485421 ?auto_485427 ) ) ( not ( = ?auto_485421 ?auto_485428 ) ) ( not ( = ?auto_485421 ?auto_485429 ) ) ( not ( = ?auto_485421 ?auto_485430 ) ) ( not ( = ?auto_485421 ?auto_485431 ) ) ( not ( = ?auto_485422 ?auto_485423 ) ) ( not ( = ?auto_485422 ?auto_485424 ) ) ( not ( = ?auto_485422 ?auto_485425 ) ) ( not ( = ?auto_485422 ?auto_485426 ) ) ( not ( = ?auto_485422 ?auto_485427 ) ) ( not ( = ?auto_485422 ?auto_485428 ) ) ( not ( = ?auto_485422 ?auto_485429 ) ) ( not ( = ?auto_485422 ?auto_485430 ) ) ( not ( = ?auto_485422 ?auto_485431 ) ) ( not ( = ?auto_485423 ?auto_485424 ) ) ( not ( = ?auto_485423 ?auto_485425 ) ) ( not ( = ?auto_485423 ?auto_485426 ) ) ( not ( = ?auto_485423 ?auto_485427 ) ) ( not ( = ?auto_485423 ?auto_485428 ) ) ( not ( = ?auto_485423 ?auto_485429 ) ) ( not ( = ?auto_485423 ?auto_485430 ) ) ( not ( = ?auto_485423 ?auto_485431 ) ) ( not ( = ?auto_485424 ?auto_485425 ) ) ( not ( = ?auto_485424 ?auto_485426 ) ) ( not ( = ?auto_485424 ?auto_485427 ) ) ( not ( = ?auto_485424 ?auto_485428 ) ) ( not ( = ?auto_485424 ?auto_485429 ) ) ( not ( = ?auto_485424 ?auto_485430 ) ) ( not ( = ?auto_485424 ?auto_485431 ) ) ( not ( = ?auto_485425 ?auto_485426 ) ) ( not ( = ?auto_485425 ?auto_485427 ) ) ( not ( = ?auto_485425 ?auto_485428 ) ) ( not ( = ?auto_485425 ?auto_485429 ) ) ( not ( = ?auto_485425 ?auto_485430 ) ) ( not ( = ?auto_485425 ?auto_485431 ) ) ( not ( = ?auto_485426 ?auto_485427 ) ) ( not ( = ?auto_485426 ?auto_485428 ) ) ( not ( = ?auto_485426 ?auto_485429 ) ) ( not ( = ?auto_485426 ?auto_485430 ) ) ( not ( = ?auto_485426 ?auto_485431 ) ) ( not ( = ?auto_485427 ?auto_485428 ) ) ( not ( = ?auto_485427 ?auto_485429 ) ) ( not ( = ?auto_485427 ?auto_485430 ) ) ( not ( = ?auto_485427 ?auto_485431 ) ) ( not ( = ?auto_485428 ?auto_485429 ) ) ( not ( = ?auto_485428 ?auto_485430 ) ) ( not ( = ?auto_485428 ?auto_485431 ) ) ( not ( = ?auto_485429 ?auto_485430 ) ) ( not ( = ?auto_485429 ?auto_485431 ) ) ( not ( = ?auto_485430 ?auto_485431 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_485430 ?auto_485431 )
      ( !STACK ?auto_485430 ?auto_485429 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_485466 - BLOCK
      ?auto_485467 - BLOCK
      ?auto_485468 - BLOCK
      ?auto_485469 - BLOCK
      ?auto_485470 - BLOCK
      ?auto_485471 - BLOCK
      ?auto_485472 - BLOCK
      ?auto_485473 - BLOCK
      ?auto_485474 - BLOCK
      ?auto_485475 - BLOCK
      ?auto_485476 - BLOCK
    )
    :vars
    (
      ?auto_485477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485476 ?auto_485477 ) ( ON-TABLE ?auto_485466 ) ( ON ?auto_485467 ?auto_485466 ) ( ON ?auto_485468 ?auto_485467 ) ( ON ?auto_485469 ?auto_485468 ) ( ON ?auto_485470 ?auto_485469 ) ( ON ?auto_485471 ?auto_485470 ) ( ON ?auto_485472 ?auto_485471 ) ( ON ?auto_485473 ?auto_485472 ) ( ON ?auto_485474 ?auto_485473 ) ( not ( = ?auto_485466 ?auto_485467 ) ) ( not ( = ?auto_485466 ?auto_485468 ) ) ( not ( = ?auto_485466 ?auto_485469 ) ) ( not ( = ?auto_485466 ?auto_485470 ) ) ( not ( = ?auto_485466 ?auto_485471 ) ) ( not ( = ?auto_485466 ?auto_485472 ) ) ( not ( = ?auto_485466 ?auto_485473 ) ) ( not ( = ?auto_485466 ?auto_485474 ) ) ( not ( = ?auto_485466 ?auto_485475 ) ) ( not ( = ?auto_485466 ?auto_485476 ) ) ( not ( = ?auto_485466 ?auto_485477 ) ) ( not ( = ?auto_485467 ?auto_485468 ) ) ( not ( = ?auto_485467 ?auto_485469 ) ) ( not ( = ?auto_485467 ?auto_485470 ) ) ( not ( = ?auto_485467 ?auto_485471 ) ) ( not ( = ?auto_485467 ?auto_485472 ) ) ( not ( = ?auto_485467 ?auto_485473 ) ) ( not ( = ?auto_485467 ?auto_485474 ) ) ( not ( = ?auto_485467 ?auto_485475 ) ) ( not ( = ?auto_485467 ?auto_485476 ) ) ( not ( = ?auto_485467 ?auto_485477 ) ) ( not ( = ?auto_485468 ?auto_485469 ) ) ( not ( = ?auto_485468 ?auto_485470 ) ) ( not ( = ?auto_485468 ?auto_485471 ) ) ( not ( = ?auto_485468 ?auto_485472 ) ) ( not ( = ?auto_485468 ?auto_485473 ) ) ( not ( = ?auto_485468 ?auto_485474 ) ) ( not ( = ?auto_485468 ?auto_485475 ) ) ( not ( = ?auto_485468 ?auto_485476 ) ) ( not ( = ?auto_485468 ?auto_485477 ) ) ( not ( = ?auto_485469 ?auto_485470 ) ) ( not ( = ?auto_485469 ?auto_485471 ) ) ( not ( = ?auto_485469 ?auto_485472 ) ) ( not ( = ?auto_485469 ?auto_485473 ) ) ( not ( = ?auto_485469 ?auto_485474 ) ) ( not ( = ?auto_485469 ?auto_485475 ) ) ( not ( = ?auto_485469 ?auto_485476 ) ) ( not ( = ?auto_485469 ?auto_485477 ) ) ( not ( = ?auto_485470 ?auto_485471 ) ) ( not ( = ?auto_485470 ?auto_485472 ) ) ( not ( = ?auto_485470 ?auto_485473 ) ) ( not ( = ?auto_485470 ?auto_485474 ) ) ( not ( = ?auto_485470 ?auto_485475 ) ) ( not ( = ?auto_485470 ?auto_485476 ) ) ( not ( = ?auto_485470 ?auto_485477 ) ) ( not ( = ?auto_485471 ?auto_485472 ) ) ( not ( = ?auto_485471 ?auto_485473 ) ) ( not ( = ?auto_485471 ?auto_485474 ) ) ( not ( = ?auto_485471 ?auto_485475 ) ) ( not ( = ?auto_485471 ?auto_485476 ) ) ( not ( = ?auto_485471 ?auto_485477 ) ) ( not ( = ?auto_485472 ?auto_485473 ) ) ( not ( = ?auto_485472 ?auto_485474 ) ) ( not ( = ?auto_485472 ?auto_485475 ) ) ( not ( = ?auto_485472 ?auto_485476 ) ) ( not ( = ?auto_485472 ?auto_485477 ) ) ( not ( = ?auto_485473 ?auto_485474 ) ) ( not ( = ?auto_485473 ?auto_485475 ) ) ( not ( = ?auto_485473 ?auto_485476 ) ) ( not ( = ?auto_485473 ?auto_485477 ) ) ( not ( = ?auto_485474 ?auto_485475 ) ) ( not ( = ?auto_485474 ?auto_485476 ) ) ( not ( = ?auto_485474 ?auto_485477 ) ) ( not ( = ?auto_485475 ?auto_485476 ) ) ( not ( = ?auto_485475 ?auto_485477 ) ) ( not ( = ?auto_485476 ?auto_485477 ) ) ( CLEAR ?auto_485474 ) ( ON ?auto_485475 ?auto_485476 ) ( CLEAR ?auto_485475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_485466 ?auto_485467 ?auto_485468 ?auto_485469 ?auto_485470 ?auto_485471 ?auto_485472 ?auto_485473 ?auto_485474 ?auto_485475 )
      ( MAKE-11PILE ?auto_485466 ?auto_485467 ?auto_485468 ?auto_485469 ?auto_485470 ?auto_485471 ?auto_485472 ?auto_485473 ?auto_485474 ?auto_485475 ?auto_485476 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_485512 - BLOCK
      ?auto_485513 - BLOCK
      ?auto_485514 - BLOCK
      ?auto_485515 - BLOCK
      ?auto_485516 - BLOCK
      ?auto_485517 - BLOCK
      ?auto_485518 - BLOCK
      ?auto_485519 - BLOCK
      ?auto_485520 - BLOCK
      ?auto_485521 - BLOCK
      ?auto_485522 - BLOCK
    )
    :vars
    (
      ?auto_485523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485522 ?auto_485523 ) ( ON-TABLE ?auto_485512 ) ( ON ?auto_485513 ?auto_485512 ) ( ON ?auto_485514 ?auto_485513 ) ( ON ?auto_485515 ?auto_485514 ) ( ON ?auto_485516 ?auto_485515 ) ( ON ?auto_485517 ?auto_485516 ) ( ON ?auto_485518 ?auto_485517 ) ( ON ?auto_485519 ?auto_485518 ) ( not ( = ?auto_485512 ?auto_485513 ) ) ( not ( = ?auto_485512 ?auto_485514 ) ) ( not ( = ?auto_485512 ?auto_485515 ) ) ( not ( = ?auto_485512 ?auto_485516 ) ) ( not ( = ?auto_485512 ?auto_485517 ) ) ( not ( = ?auto_485512 ?auto_485518 ) ) ( not ( = ?auto_485512 ?auto_485519 ) ) ( not ( = ?auto_485512 ?auto_485520 ) ) ( not ( = ?auto_485512 ?auto_485521 ) ) ( not ( = ?auto_485512 ?auto_485522 ) ) ( not ( = ?auto_485512 ?auto_485523 ) ) ( not ( = ?auto_485513 ?auto_485514 ) ) ( not ( = ?auto_485513 ?auto_485515 ) ) ( not ( = ?auto_485513 ?auto_485516 ) ) ( not ( = ?auto_485513 ?auto_485517 ) ) ( not ( = ?auto_485513 ?auto_485518 ) ) ( not ( = ?auto_485513 ?auto_485519 ) ) ( not ( = ?auto_485513 ?auto_485520 ) ) ( not ( = ?auto_485513 ?auto_485521 ) ) ( not ( = ?auto_485513 ?auto_485522 ) ) ( not ( = ?auto_485513 ?auto_485523 ) ) ( not ( = ?auto_485514 ?auto_485515 ) ) ( not ( = ?auto_485514 ?auto_485516 ) ) ( not ( = ?auto_485514 ?auto_485517 ) ) ( not ( = ?auto_485514 ?auto_485518 ) ) ( not ( = ?auto_485514 ?auto_485519 ) ) ( not ( = ?auto_485514 ?auto_485520 ) ) ( not ( = ?auto_485514 ?auto_485521 ) ) ( not ( = ?auto_485514 ?auto_485522 ) ) ( not ( = ?auto_485514 ?auto_485523 ) ) ( not ( = ?auto_485515 ?auto_485516 ) ) ( not ( = ?auto_485515 ?auto_485517 ) ) ( not ( = ?auto_485515 ?auto_485518 ) ) ( not ( = ?auto_485515 ?auto_485519 ) ) ( not ( = ?auto_485515 ?auto_485520 ) ) ( not ( = ?auto_485515 ?auto_485521 ) ) ( not ( = ?auto_485515 ?auto_485522 ) ) ( not ( = ?auto_485515 ?auto_485523 ) ) ( not ( = ?auto_485516 ?auto_485517 ) ) ( not ( = ?auto_485516 ?auto_485518 ) ) ( not ( = ?auto_485516 ?auto_485519 ) ) ( not ( = ?auto_485516 ?auto_485520 ) ) ( not ( = ?auto_485516 ?auto_485521 ) ) ( not ( = ?auto_485516 ?auto_485522 ) ) ( not ( = ?auto_485516 ?auto_485523 ) ) ( not ( = ?auto_485517 ?auto_485518 ) ) ( not ( = ?auto_485517 ?auto_485519 ) ) ( not ( = ?auto_485517 ?auto_485520 ) ) ( not ( = ?auto_485517 ?auto_485521 ) ) ( not ( = ?auto_485517 ?auto_485522 ) ) ( not ( = ?auto_485517 ?auto_485523 ) ) ( not ( = ?auto_485518 ?auto_485519 ) ) ( not ( = ?auto_485518 ?auto_485520 ) ) ( not ( = ?auto_485518 ?auto_485521 ) ) ( not ( = ?auto_485518 ?auto_485522 ) ) ( not ( = ?auto_485518 ?auto_485523 ) ) ( not ( = ?auto_485519 ?auto_485520 ) ) ( not ( = ?auto_485519 ?auto_485521 ) ) ( not ( = ?auto_485519 ?auto_485522 ) ) ( not ( = ?auto_485519 ?auto_485523 ) ) ( not ( = ?auto_485520 ?auto_485521 ) ) ( not ( = ?auto_485520 ?auto_485522 ) ) ( not ( = ?auto_485520 ?auto_485523 ) ) ( not ( = ?auto_485521 ?auto_485522 ) ) ( not ( = ?auto_485521 ?auto_485523 ) ) ( not ( = ?auto_485522 ?auto_485523 ) ) ( ON ?auto_485521 ?auto_485522 ) ( CLEAR ?auto_485519 ) ( ON ?auto_485520 ?auto_485521 ) ( CLEAR ?auto_485520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_485512 ?auto_485513 ?auto_485514 ?auto_485515 ?auto_485516 ?auto_485517 ?auto_485518 ?auto_485519 ?auto_485520 )
      ( MAKE-11PILE ?auto_485512 ?auto_485513 ?auto_485514 ?auto_485515 ?auto_485516 ?auto_485517 ?auto_485518 ?auto_485519 ?auto_485520 ?auto_485521 ?auto_485522 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_485558 - BLOCK
      ?auto_485559 - BLOCK
      ?auto_485560 - BLOCK
      ?auto_485561 - BLOCK
      ?auto_485562 - BLOCK
      ?auto_485563 - BLOCK
      ?auto_485564 - BLOCK
      ?auto_485565 - BLOCK
      ?auto_485566 - BLOCK
      ?auto_485567 - BLOCK
      ?auto_485568 - BLOCK
    )
    :vars
    (
      ?auto_485569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485568 ?auto_485569 ) ( ON-TABLE ?auto_485558 ) ( ON ?auto_485559 ?auto_485558 ) ( ON ?auto_485560 ?auto_485559 ) ( ON ?auto_485561 ?auto_485560 ) ( ON ?auto_485562 ?auto_485561 ) ( ON ?auto_485563 ?auto_485562 ) ( ON ?auto_485564 ?auto_485563 ) ( not ( = ?auto_485558 ?auto_485559 ) ) ( not ( = ?auto_485558 ?auto_485560 ) ) ( not ( = ?auto_485558 ?auto_485561 ) ) ( not ( = ?auto_485558 ?auto_485562 ) ) ( not ( = ?auto_485558 ?auto_485563 ) ) ( not ( = ?auto_485558 ?auto_485564 ) ) ( not ( = ?auto_485558 ?auto_485565 ) ) ( not ( = ?auto_485558 ?auto_485566 ) ) ( not ( = ?auto_485558 ?auto_485567 ) ) ( not ( = ?auto_485558 ?auto_485568 ) ) ( not ( = ?auto_485558 ?auto_485569 ) ) ( not ( = ?auto_485559 ?auto_485560 ) ) ( not ( = ?auto_485559 ?auto_485561 ) ) ( not ( = ?auto_485559 ?auto_485562 ) ) ( not ( = ?auto_485559 ?auto_485563 ) ) ( not ( = ?auto_485559 ?auto_485564 ) ) ( not ( = ?auto_485559 ?auto_485565 ) ) ( not ( = ?auto_485559 ?auto_485566 ) ) ( not ( = ?auto_485559 ?auto_485567 ) ) ( not ( = ?auto_485559 ?auto_485568 ) ) ( not ( = ?auto_485559 ?auto_485569 ) ) ( not ( = ?auto_485560 ?auto_485561 ) ) ( not ( = ?auto_485560 ?auto_485562 ) ) ( not ( = ?auto_485560 ?auto_485563 ) ) ( not ( = ?auto_485560 ?auto_485564 ) ) ( not ( = ?auto_485560 ?auto_485565 ) ) ( not ( = ?auto_485560 ?auto_485566 ) ) ( not ( = ?auto_485560 ?auto_485567 ) ) ( not ( = ?auto_485560 ?auto_485568 ) ) ( not ( = ?auto_485560 ?auto_485569 ) ) ( not ( = ?auto_485561 ?auto_485562 ) ) ( not ( = ?auto_485561 ?auto_485563 ) ) ( not ( = ?auto_485561 ?auto_485564 ) ) ( not ( = ?auto_485561 ?auto_485565 ) ) ( not ( = ?auto_485561 ?auto_485566 ) ) ( not ( = ?auto_485561 ?auto_485567 ) ) ( not ( = ?auto_485561 ?auto_485568 ) ) ( not ( = ?auto_485561 ?auto_485569 ) ) ( not ( = ?auto_485562 ?auto_485563 ) ) ( not ( = ?auto_485562 ?auto_485564 ) ) ( not ( = ?auto_485562 ?auto_485565 ) ) ( not ( = ?auto_485562 ?auto_485566 ) ) ( not ( = ?auto_485562 ?auto_485567 ) ) ( not ( = ?auto_485562 ?auto_485568 ) ) ( not ( = ?auto_485562 ?auto_485569 ) ) ( not ( = ?auto_485563 ?auto_485564 ) ) ( not ( = ?auto_485563 ?auto_485565 ) ) ( not ( = ?auto_485563 ?auto_485566 ) ) ( not ( = ?auto_485563 ?auto_485567 ) ) ( not ( = ?auto_485563 ?auto_485568 ) ) ( not ( = ?auto_485563 ?auto_485569 ) ) ( not ( = ?auto_485564 ?auto_485565 ) ) ( not ( = ?auto_485564 ?auto_485566 ) ) ( not ( = ?auto_485564 ?auto_485567 ) ) ( not ( = ?auto_485564 ?auto_485568 ) ) ( not ( = ?auto_485564 ?auto_485569 ) ) ( not ( = ?auto_485565 ?auto_485566 ) ) ( not ( = ?auto_485565 ?auto_485567 ) ) ( not ( = ?auto_485565 ?auto_485568 ) ) ( not ( = ?auto_485565 ?auto_485569 ) ) ( not ( = ?auto_485566 ?auto_485567 ) ) ( not ( = ?auto_485566 ?auto_485568 ) ) ( not ( = ?auto_485566 ?auto_485569 ) ) ( not ( = ?auto_485567 ?auto_485568 ) ) ( not ( = ?auto_485567 ?auto_485569 ) ) ( not ( = ?auto_485568 ?auto_485569 ) ) ( ON ?auto_485567 ?auto_485568 ) ( ON ?auto_485566 ?auto_485567 ) ( CLEAR ?auto_485564 ) ( ON ?auto_485565 ?auto_485566 ) ( CLEAR ?auto_485565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_485558 ?auto_485559 ?auto_485560 ?auto_485561 ?auto_485562 ?auto_485563 ?auto_485564 ?auto_485565 )
      ( MAKE-11PILE ?auto_485558 ?auto_485559 ?auto_485560 ?auto_485561 ?auto_485562 ?auto_485563 ?auto_485564 ?auto_485565 ?auto_485566 ?auto_485567 ?auto_485568 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_485604 - BLOCK
      ?auto_485605 - BLOCK
      ?auto_485606 - BLOCK
      ?auto_485607 - BLOCK
      ?auto_485608 - BLOCK
      ?auto_485609 - BLOCK
      ?auto_485610 - BLOCK
      ?auto_485611 - BLOCK
      ?auto_485612 - BLOCK
      ?auto_485613 - BLOCK
      ?auto_485614 - BLOCK
    )
    :vars
    (
      ?auto_485615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485614 ?auto_485615 ) ( ON-TABLE ?auto_485604 ) ( ON ?auto_485605 ?auto_485604 ) ( ON ?auto_485606 ?auto_485605 ) ( ON ?auto_485607 ?auto_485606 ) ( ON ?auto_485608 ?auto_485607 ) ( ON ?auto_485609 ?auto_485608 ) ( not ( = ?auto_485604 ?auto_485605 ) ) ( not ( = ?auto_485604 ?auto_485606 ) ) ( not ( = ?auto_485604 ?auto_485607 ) ) ( not ( = ?auto_485604 ?auto_485608 ) ) ( not ( = ?auto_485604 ?auto_485609 ) ) ( not ( = ?auto_485604 ?auto_485610 ) ) ( not ( = ?auto_485604 ?auto_485611 ) ) ( not ( = ?auto_485604 ?auto_485612 ) ) ( not ( = ?auto_485604 ?auto_485613 ) ) ( not ( = ?auto_485604 ?auto_485614 ) ) ( not ( = ?auto_485604 ?auto_485615 ) ) ( not ( = ?auto_485605 ?auto_485606 ) ) ( not ( = ?auto_485605 ?auto_485607 ) ) ( not ( = ?auto_485605 ?auto_485608 ) ) ( not ( = ?auto_485605 ?auto_485609 ) ) ( not ( = ?auto_485605 ?auto_485610 ) ) ( not ( = ?auto_485605 ?auto_485611 ) ) ( not ( = ?auto_485605 ?auto_485612 ) ) ( not ( = ?auto_485605 ?auto_485613 ) ) ( not ( = ?auto_485605 ?auto_485614 ) ) ( not ( = ?auto_485605 ?auto_485615 ) ) ( not ( = ?auto_485606 ?auto_485607 ) ) ( not ( = ?auto_485606 ?auto_485608 ) ) ( not ( = ?auto_485606 ?auto_485609 ) ) ( not ( = ?auto_485606 ?auto_485610 ) ) ( not ( = ?auto_485606 ?auto_485611 ) ) ( not ( = ?auto_485606 ?auto_485612 ) ) ( not ( = ?auto_485606 ?auto_485613 ) ) ( not ( = ?auto_485606 ?auto_485614 ) ) ( not ( = ?auto_485606 ?auto_485615 ) ) ( not ( = ?auto_485607 ?auto_485608 ) ) ( not ( = ?auto_485607 ?auto_485609 ) ) ( not ( = ?auto_485607 ?auto_485610 ) ) ( not ( = ?auto_485607 ?auto_485611 ) ) ( not ( = ?auto_485607 ?auto_485612 ) ) ( not ( = ?auto_485607 ?auto_485613 ) ) ( not ( = ?auto_485607 ?auto_485614 ) ) ( not ( = ?auto_485607 ?auto_485615 ) ) ( not ( = ?auto_485608 ?auto_485609 ) ) ( not ( = ?auto_485608 ?auto_485610 ) ) ( not ( = ?auto_485608 ?auto_485611 ) ) ( not ( = ?auto_485608 ?auto_485612 ) ) ( not ( = ?auto_485608 ?auto_485613 ) ) ( not ( = ?auto_485608 ?auto_485614 ) ) ( not ( = ?auto_485608 ?auto_485615 ) ) ( not ( = ?auto_485609 ?auto_485610 ) ) ( not ( = ?auto_485609 ?auto_485611 ) ) ( not ( = ?auto_485609 ?auto_485612 ) ) ( not ( = ?auto_485609 ?auto_485613 ) ) ( not ( = ?auto_485609 ?auto_485614 ) ) ( not ( = ?auto_485609 ?auto_485615 ) ) ( not ( = ?auto_485610 ?auto_485611 ) ) ( not ( = ?auto_485610 ?auto_485612 ) ) ( not ( = ?auto_485610 ?auto_485613 ) ) ( not ( = ?auto_485610 ?auto_485614 ) ) ( not ( = ?auto_485610 ?auto_485615 ) ) ( not ( = ?auto_485611 ?auto_485612 ) ) ( not ( = ?auto_485611 ?auto_485613 ) ) ( not ( = ?auto_485611 ?auto_485614 ) ) ( not ( = ?auto_485611 ?auto_485615 ) ) ( not ( = ?auto_485612 ?auto_485613 ) ) ( not ( = ?auto_485612 ?auto_485614 ) ) ( not ( = ?auto_485612 ?auto_485615 ) ) ( not ( = ?auto_485613 ?auto_485614 ) ) ( not ( = ?auto_485613 ?auto_485615 ) ) ( not ( = ?auto_485614 ?auto_485615 ) ) ( ON ?auto_485613 ?auto_485614 ) ( ON ?auto_485612 ?auto_485613 ) ( ON ?auto_485611 ?auto_485612 ) ( CLEAR ?auto_485609 ) ( ON ?auto_485610 ?auto_485611 ) ( CLEAR ?auto_485610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_485604 ?auto_485605 ?auto_485606 ?auto_485607 ?auto_485608 ?auto_485609 ?auto_485610 )
      ( MAKE-11PILE ?auto_485604 ?auto_485605 ?auto_485606 ?auto_485607 ?auto_485608 ?auto_485609 ?auto_485610 ?auto_485611 ?auto_485612 ?auto_485613 ?auto_485614 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_485650 - BLOCK
      ?auto_485651 - BLOCK
      ?auto_485652 - BLOCK
      ?auto_485653 - BLOCK
      ?auto_485654 - BLOCK
      ?auto_485655 - BLOCK
      ?auto_485656 - BLOCK
      ?auto_485657 - BLOCK
      ?auto_485658 - BLOCK
      ?auto_485659 - BLOCK
      ?auto_485660 - BLOCK
    )
    :vars
    (
      ?auto_485661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485660 ?auto_485661 ) ( ON-TABLE ?auto_485650 ) ( ON ?auto_485651 ?auto_485650 ) ( ON ?auto_485652 ?auto_485651 ) ( ON ?auto_485653 ?auto_485652 ) ( ON ?auto_485654 ?auto_485653 ) ( not ( = ?auto_485650 ?auto_485651 ) ) ( not ( = ?auto_485650 ?auto_485652 ) ) ( not ( = ?auto_485650 ?auto_485653 ) ) ( not ( = ?auto_485650 ?auto_485654 ) ) ( not ( = ?auto_485650 ?auto_485655 ) ) ( not ( = ?auto_485650 ?auto_485656 ) ) ( not ( = ?auto_485650 ?auto_485657 ) ) ( not ( = ?auto_485650 ?auto_485658 ) ) ( not ( = ?auto_485650 ?auto_485659 ) ) ( not ( = ?auto_485650 ?auto_485660 ) ) ( not ( = ?auto_485650 ?auto_485661 ) ) ( not ( = ?auto_485651 ?auto_485652 ) ) ( not ( = ?auto_485651 ?auto_485653 ) ) ( not ( = ?auto_485651 ?auto_485654 ) ) ( not ( = ?auto_485651 ?auto_485655 ) ) ( not ( = ?auto_485651 ?auto_485656 ) ) ( not ( = ?auto_485651 ?auto_485657 ) ) ( not ( = ?auto_485651 ?auto_485658 ) ) ( not ( = ?auto_485651 ?auto_485659 ) ) ( not ( = ?auto_485651 ?auto_485660 ) ) ( not ( = ?auto_485651 ?auto_485661 ) ) ( not ( = ?auto_485652 ?auto_485653 ) ) ( not ( = ?auto_485652 ?auto_485654 ) ) ( not ( = ?auto_485652 ?auto_485655 ) ) ( not ( = ?auto_485652 ?auto_485656 ) ) ( not ( = ?auto_485652 ?auto_485657 ) ) ( not ( = ?auto_485652 ?auto_485658 ) ) ( not ( = ?auto_485652 ?auto_485659 ) ) ( not ( = ?auto_485652 ?auto_485660 ) ) ( not ( = ?auto_485652 ?auto_485661 ) ) ( not ( = ?auto_485653 ?auto_485654 ) ) ( not ( = ?auto_485653 ?auto_485655 ) ) ( not ( = ?auto_485653 ?auto_485656 ) ) ( not ( = ?auto_485653 ?auto_485657 ) ) ( not ( = ?auto_485653 ?auto_485658 ) ) ( not ( = ?auto_485653 ?auto_485659 ) ) ( not ( = ?auto_485653 ?auto_485660 ) ) ( not ( = ?auto_485653 ?auto_485661 ) ) ( not ( = ?auto_485654 ?auto_485655 ) ) ( not ( = ?auto_485654 ?auto_485656 ) ) ( not ( = ?auto_485654 ?auto_485657 ) ) ( not ( = ?auto_485654 ?auto_485658 ) ) ( not ( = ?auto_485654 ?auto_485659 ) ) ( not ( = ?auto_485654 ?auto_485660 ) ) ( not ( = ?auto_485654 ?auto_485661 ) ) ( not ( = ?auto_485655 ?auto_485656 ) ) ( not ( = ?auto_485655 ?auto_485657 ) ) ( not ( = ?auto_485655 ?auto_485658 ) ) ( not ( = ?auto_485655 ?auto_485659 ) ) ( not ( = ?auto_485655 ?auto_485660 ) ) ( not ( = ?auto_485655 ?auto_485661 ) ) ( not ( = ?auto_485656 ?auto_485657 ) ) ( not ( = ?auto_485656 ?auto_485658 ) ) ( not ( = ?auto_485656 ?auto_485659 ) ) ( not ( = ?auto_485656 ?auto_485660 ) ) ( not ( = ?auto_485656 ?auto_485661 ) ) ( not ( = ?auto_485657 ?auto_485658 ) ) ( not ( = ?auto_485657 ?auto_485659 ) ) ( not ( = ?auto_485657 ?auto_485660 ) ) ( not ( = ?auto_485657 ?auto_485661 ) ) ( not ( = ?auto_485658 ?auto_485659 ) ) ( not ( = ?auto_485658 ?auto_485660 ) ) ( not ( = ?auto_485658 ?auto_485661 ) ) ( not ( = ?auto_485659 ?auto_485660 ) ) ( not ( = ?auto_485659 ?auto_485661 ) ) ( not ( = ?auto_485660 ?auto_485661 ) ) ( ON ?auto_485659 ?auto_485660 ) ( ON ?auto_485658 ?auto_485659 ) ( ON ?auto_485657 ?auto_485658 ) ( ON ?auto_485656 ?auto_485657 ) ( CLEAR ?auto_485654 ) ( ON ?auto_485655 ?auto_485656 ) ( CLEAR ?auto_485655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_485650 ?auto_485651 ?auto_485652 ?auto_485653 ?auto_485654 ?auto_485655 )
      ( MAKE-11PILE ?auto_485650 ?auto_485651 ?auto_485652 ?auto_485653 ?auto_485654 ?auto_485655 ?auto_485656 ?auto_485657 ?auto_485658 ?auto_485659 ?auto_485660 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_485696 - BLOCK
      ?auto_485697 - BLOCK
      ?auto_485698 - BLOCK
      ?auto_485699 - BLOCK
      ?auto_485700 - BLOCK
      ?auto_485701 - BLOCK
      ?auto_485702 - BLOCK
      ?auto_485703 - BLOCK
      ?auto_485704 - BLOCK
      ?auto_485705 - BLOCK
      ?auto_485706 - BLOCK
    )
    :vars
    (
      ?auto_485707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485706 ?auto_485707 ) ( ON-TABLE ?auto_485696 ) ( ON ?auto_485697 ?auto_485696 ) ( ON ?auto_485698 ?auto_485697 ) ( ON ?auto_485699 ?auto_485698 ) ( not ( = ?auto_485696 ?auto_485697 ) ) ( not ( = ?auto_485696 ?auto_485698 ) ) ( not ( = ?auto_485696 ?auto_485699 ) ) ( not ( = ?auto_485696 ?auto_485700 ) ) ( not ( = ?auto_485696 ?auto_485701 ) ) ( not ( = ?auto_485696 ?auto_485702 ) ) ( not ( = ?auto_485696 ?auto_485703 ) ) ( not ( = ?auto_485696 ?auto_485704 ) ) ( not ( = ?auto_485696 ?auto_485705 ) ) ( not ( = ?auto_485696 ?auto_485706 ) ) ( not ( = ?auto_485696 ?auto_485707 ) ) ( not ( = ?auto_485697 ?auto_485698 ) ) ( not ( = ?auto_485697 ?auto_485699 ) ) ( not ( = ?auto_485697 ?auto_485700 ) ) ( not ( = ?auto_485697 ?auto_485701 ) ) ( not ( = ?auto_485697 ?auto_485702 ) ) ( not ( = ?auto_485697 ?auto_485703 ) ) ( not ( = ?auto_485697 ?auto_485704 ) ) ( not ( = ?auto_485697 ?auto_485705 ) ) ( not ( = ?auto_485697 ?auto_485706 ) ) ( not ( = ?auto_485697 ?auto_485707 ) ) ( not ( = ?auto_485698 ?auto_485699 ) ) ( not ( = ?auto_485698 ?auto_485700 ) ) ( not ( = ?auto_485698 ?auto_485701 ) ) ( not ( = ?auto_485698 ?auto_485702 ) ) ( not ( = ?auto_485698 ?auto_485703 ) ) ( not ( = ?auto_485698 ?auto_485704 ) ) ( not ( = ?auto_485698 ?auto_485705 ) ) ( not ( = ?auto_485698 ?auto_485706 ) ) ( not ( = ?auto_485698 ?auto_485707 ) ) ( not ( = ?auto_485699 ?auto_485700 ) ) ( not ( = ?auto_485699 ?auto_485701 ) ) ( not ( = ?auto_485699 ?auto_485702 ) ) ( not ( = ?auto_485699 ?auto_485703 ) ) ( not ( = ?auto_485699 ?auto_485704 ) ) ( not ( = ?auto_485699 ?auto_485705 ) ) ( not ( = ?auto_485699 ?auto_485706 ) ) ( not ( = ?auto_485699 ?auto_485707 ) ) ( not ( = ?auto_485700 ?auto_485701 ) ) ( not ( = ?auto_485700 ?auto_485702 ) ) ( not ( = ?auto_485700 ?auto_485703 ) ) ( not ( = ?auto_485700 ?auto_485704 ) ) ( not ( = ?auto_485700 ?auto_485705 ) ) ( not ( = ?auto_485700 ?auto_485706 ) ) ( not ( = ?auto_485700 ?auto_485707 ) ) ( not ( = ?auto_485701 ?auto_485702 ) ) ( not ( = ?auto_485701 ?auto_485703 ) ) ( not ( = ?auto_485701 ?auto_485704 ) ) ( not ( = ?auto_485701 ?auto_485705 ) ) ( not ( = ?auto_485701 ?auto_485706 ) ) ( not ( = ?auto_485701 ?auto_485707 ) ) ( not ( = ?auto_485702 ?auto_485703 ) ) ( not ( = ?auto_485702 ?auto_485704 ) ) ( not ( = ?auto_485702 ?auto_485705 ) ) ( not ( = ?auto_485702 ?auto_485706 ) ) ( not ( = ?auto_485702 ?auto_485707 ) ) ( not ( = ?auto_485703 ?auto_485704 ) ) ( not ( = ?auto_485703 ?auto_485705 ) ) ( not ( = ?auto_485703 ?auto_485706 ) ) ( not ( = ?auto_485703 ?auto_485707 ) ) ( not ( = ?auto_485704 ?auto_485705 ) ) ( not ( = ?auto_485704 ?auto_485706 ) ) ( not ( = ?auto_485704 ?auto_485707 ) ) ( not ( = ?auto_485705 ?auto_485706 ) ) ( not ( = ?auto_485705 ?auto_485707 ) ) ( not ( = ?auto_485706 ?auto_485707 ) ) ( ON ?auto_485705 ?auto_485706 ) ( ON ?auto_485704 ?auto_485705 ) ( ON ?auto_485703 ?auto_485704 ) ( ON ?auto_485702 ?auto_485703 ) ( ON ?auto_485701 ?auto_485702 ) ( CLEAR ?auto_485699 ) ( ON ?auto_485700 ?auto_485701 ) ( CLEAR ?auto_485700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_485696 ?auto_485697 ?auto_485698 ?auto_485699 ?auto_485700 )
      ( MAKE-11PILE ?auto_485696 ?auto_485697 ?auto_485698 ?auto_485699 ?auto_485700 ?auto_485701 ?auto_485702 ?auto_485703 ?auto_485704 ?auto_485705 ?auto_485706 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_485742 - BLOCK
      ?auto_485743 - BLOCK
      ?auto_485744 - BLOCK
      ?auto_485745 - BLOCK
      ?auto_485746 - BLOCK
      ?auto_485747 - BLOCK
      ?auto_485748 - BLOCK
      ?auto_485749 - BLOCK
      ?auto_485750 - BLOCK
      ?auto_485751 - BLOCK
      ?auto_485752 - BLOCK
    )
    :vars
    (
      ?auto_485753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485752 ?auto_485753 ) ( ON-TABLE ?auto_485742 ) ( ON ?auto_485743 ?auto_485742 ) ( ON ?auto_485744 ?auto_485743 ) ( not ( = ?auto_485742 ?auto_485743 ) ) ( not ( = ?auto_485742 ?auto_485744 ) ) ( not ( = ?auto_485742 ?auto_485745 ) ) ( not ( = ?auto_485742 ?auto_485746 ) ) ( not ( = ?auto_485742 ?auto_485747 ) ) ( not ( = ?auto_485742 ?auto_485748 ) ) ( not ( = ?auto_485742 ?auto_485749 ) ) ( not ( = ?auto_485742 ?auto_485750 ) ) ( not ( = ?auto_485742 ?auto_485751 ) ) ( not ( = ?auto_485742 ?auto_485752 ) ) ( not ( = ?auto_485742 ?auto_485753 ) ) ( not ( = ?auto_485743 ?auto_485744 ) ) ( not ( = ?auto_485743 ?auto_485745 ) ) ( not ( = ?auto_485743 ?auto_485746 ) ) ( not ( = ?auto_485743 ?auto_485747 ) ) ( not ( = ?auto_485743 ?auto_485748 ) ) ( not ( = ?auto_485743 ?auto_485749 ) ) ( not ( = ?auto_485743 ?auto_485750 ) ) ( not ( = ?auto_485743 ?auto_485751 ) ) ( not ( = ?auto_485743 ?auto_485752 ) ) ( not ( = ?auto_485743 ?auto_485753 ) ) ( not ( = ?auto_485744 ?auto_485745 ) ) ( not ( = ?auto_485744 ?auto_485746 ) ) ( not ( = ?auto_485744 ?auto_485747 ) ) ( not ( = ?auto_485744 ?auto_485748 ) ) ( not ( = ?auto_485744 ?auto_485749 ) ) ( not ( = ?auto_485744 ?auto_485750 ) ) ( not ( = ?auto_485744 ?auto_485751 ) ) ( not ( = ?auto_485744 ?auto_485752 ) ) ( not ( = ?auto_485744 ?auto_485753 ) ) ( not ( = ?auto_485745 ?auto_485746 ) ) ( not ( = ?auto_485745 ?auto_485747 ) ) ( not ( = ?auto_485745 ?auto_485748 ) ) ( not ( = ?auto_485745 ?auto_485749 ) ) ( not ( = ?auto_485745 ?auto_485750 ) ) ( not ( = ?auto_485745 ?auto_485751 ) ) ( not ( = ?auto_485745 ?auto_485752 ) ) ( not ( = ?auto_485745 ?auto_485753 ) ) ( not ( = ?auto_485746 ?auto_485747 ) ) ( not ( = ?auto_485746 ?auto_485748 ) ) ( not ( = ?auto_485746 ?auto_485749 ) ) ( not ( = ?auto_485746 ?auto_485750 ) ) ( not ( = ?auto_485746 ?auto_485751 ) ) ( not ( = ?auto_485746 ?auto_485752 ) ) ( not ( = ?auto_485746 ?auto_485753 ) ) ( not ( = ?auto_485747 ?auto_485748 ) ) ( not ( = ?auto_485747 ?auto_485749 ) ) ( not ( = ?auto_485747 ?auto_485750 ) ) ( not ( = ?auto_485747 ?auto_485751 ) ) ( not ( = ?auto_485747 ?auto_485752 ) ) ( not ( = ?auto_485747 ?auto_485753 ) ) ( not ( = ?auto_485748 ?auto_485749 ) ) ( not ( = ?auto_485748 ?auto_485750 ) ) ( not ( = ?auto_485748 ?auto_485751 ) ) ( not ( = ?auto_485748 ?auto_485752 ) ) ( not ( = ?auto_485748 ?auto_485753 ) ) ( not ( = ?auto_485749 ?auto_485750 ) ) ( not ( = ?auto_485749 ?auto_485751 ) ) ( not ( = ?auto_485749 ?auto_485752 ) ) ( not ( = ?auto_485749 ?auto_485753 ) ) ( not ( = ?auto_485750 ?auto_485751 ) ) ( not ( = ?auto_485750 ?auto_485752 ) ) ( not ( = ?auto_485750 ?auto_485753 ) ) ( not ( = ?auto_485751 ?auto_485752 ) ) ( not ( = ?auto_485751 ?auto_485753 ) ) ( not ( = ?auto_485752 ?auto_485753 ) ) ( ON ?auto_485751 ?auto_485752 ) ( ON ?auto_485750 ?auto_485751 ) ( ON ?auto_485749 ?auto_485750 ) ( ON ?auto_485748 ?auto_485749 ) ( ON ?auto_485747 ?auto_485748 ) ( ON ?auto_485746 ?auto_485747 ) ( CLEAR ?auto_485744 ) ( ON ?auto_485745 ?auto_485746 ) ( CLEAR ?auto_485745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_485742 ?auto_485743 ?auto_485744 ?auto_485745 )
      ( MAKE-11PILE ?auto_485742 ?auto_485743 ?auto_485744 ?auto_485745 ?auto_485746 ?auto_485747 ?auto_485748 ?auto_485749 ?auto_485750 ?auto_485751 ?auto_485752 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_485788 - BLOCK
      ?auto_485789 - BLOCK
      ?auto_485790 - BLOCK
      ?auto_485791 - BLOCK
      ?auto_485792 - BLOCK
      ?auto_485793 - BLOCK
      ?auto_485794 - BLOCK
      ?auto_485795 - BLOCK
      ?auto_485796 - BLOCK
      ?auto_485797 - BLOCK
      ?auto_485798 - BLOCK
    )
    :vars
    (
      ?auto_485799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485798 ?auto_485799 ) ( ON-TABLE ?auto_485788 ) ( ON ?auto_485789 ?auto_485788 ) ( not ( = ?auto_485788 ?auto_485789 ) ) ( not ( = ?auto_485788 ?auto_485790 ) ) ( not ( = ?auto_485788 ?auto_485791 ) ) ( not ( = ?auto_485788 ?auto_485792 ) ) ( not ( = ?auto_485788 ?auto_485793 ) ) ( not ( = ?auto_485788 ?auto_485794 ) ) ( not ( = ?auto_485788 ?auto_485795 ) ) ( not ( = ?auto_485788 ?auto_485796 ) ) ( not ( = ?auto_485788 ?auto_485797 ) ) ( not ( = ?auto_485788 ?auto_485798 ) ) ( not ( = ?auto_485788 ?auto_485799 ) ) ( not ( = ?auto_485789 ?auto_485790 ) ) ( not ( = ?auto_485789 ?auto_485791 ) ) ( not ( = ?auto_485789 ?auto_485792 ) ) ( not ( = ?auto_485789 ?auto_485793 ) ) ( not ( = ?auto_485789 ?auto_485794 ) ) ( not ( = ?auto_485789 ?auto_485795 ) ) ( not ( = ?auto_485789 ?auto_485796 ) ) ( not ( = ?auto_485789 ?auto_485797 ) ) ( not ( = ?auto_485789 ?auto_485798 ) ) ( not ( = ?auto_485789 ?auto_485799 ) ) ( not ( = ?auto_485790 ?auto_485791 ) ) ( not ( = ?auto_485790 ?auto_485792 ) ) ( not ( = ?auto_485790 ?auto_485793 ) ) ( not ( = ?auto_485790 ?auto_485794 ) ) ( not ( = ?auto_485790 ?auto_485795 ) ) ( not ( = ?auto_485790 ?auto_485796 ) ) ( not ( = ?auto_485790 ?auto_485797 ) ) ( not ( = ?auto_485790 ?auto_485798 ) ) ( not ( = ?auto_485790 ?auto_485799 ) ) ( not ( = ?auto_485791 ?auto_485792 ) ) ( not ( = ?auto_485791 ?auto_485793 ) ) ( not ( = ?auto_485791 ?auto_485794 ) ) ( not ( = ?auto_485791 ?auto_485795 ) ) ( not ( = ?auto_485791 ?auto_485796 ) ) ( not ( = ?auto_485791 ?auto_485797 ) ) ( not ( = ?auto_485791 ?auto_485798 ) ) ( not ( = ?auto_485791 ?auto_485799 ) ) ( not ( = ?auto_485792 ?auto_485793 ) ) ( not ( = ?auto_485792 ?auto_485794 ) ) ( not ( = ?auto_485792 ?auto_485795 ) ) ( not ( = ?auto_485792 ?auto_485796 ) ) ( not ( = ?auto_485792 ?auto_485797 ) ) ( not ( = ?auto_485792 ?auto_485798 ) ) ( not ( = ?auto_485792 ?auto_485799 ) ) ( not ( = ?auto_485793 ?auto_485794 ) ) ( not ( = ?auto_485793 ?auto_485795 ) ) ( not ( = ?auto_485793 ?auto_485796 ) ) ( not ( = ?auto_485793 ?auto_485797 ) ) ( not ( = ?auto_485793 ?auto_485798 ) ) ( not ( = ?auto_485793 ?auto_485799 ) ) ( not ( = ?auto_485794 ?auto_485795 ) ) ( not ( = ?auto_485794 ?auto_485796 ) ) ( not ( = ?auto_485794 ?auto_485797 ) ) ( not ( = ?auto_485794 ?auto_485798 ) ) ( not ( = ?auto_485794 ?auto_485799 ) ) ( not ( = ?auto_485795 ?auto_485796 ) ) ( not ( = ?auto_485795 ?auto_485797 ) ) ( not ( = ?auto_485795 ?auto_485798 ) ) ( not ( = ?auto_485795 ?auto_485799 ) ) ( not ( = ?auto_485796 ?auto_485797 ) ) ( not ( = ?auto_485796 ?auto_485798 ) ) ( not ( = ?auto_485796 ?auto_485799 ) ) ( not ( = ?auto_485797 ?auto_485798 ) ) ( not ( = ?auto_485797 ?auto_485799 ) ) ( not ( = ?auto_485798 ?auto_485799 ) ) ( ON ?auto_485797 ?auto_485798 ) ( ON ?auto_485796 ?auto_485797 ) ( ON ?auto_485795 ?auto_485796 ) ( ON ?auto_485794 ?auto_485795 ) ( ON ?auto_485793 ?auto_485794 ) ( ON ?auto_485792 ?auto_485793 ) ( ON ?auto_485791 ?auto_485792 ) ( CLEAR ?auto_485789 ) ( ON ?auto_485790 ?auto_485791 ) ( CLEAR ?auto_485790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_485788 ?auto_485789 ?auto_485790 )
      ( MAKE-11PILE ?auto_485788 ?auto_485789 ?auto_485790 ?auto_485791 ?auto_485792 ?auto_485793 ?auto_485794 ?auto_485795 ?auto_485796 ?auto_485797 ?auto_485798 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_485834 - BLOCK
      ?auto_485835 - BLOCK
      ?auto_485836 - BLOCK
      ?auto_485837 - BLOCK
      ?auto_485838 - BLOCK
      ?auto_485839 - BLOCK
      ?auto_485840 - BLOCK
      ?auto_485841 - BLOCK
      ?auto_485842 - BLOCK
      ?auto_485843 - BLOCK
      ?auto_485844 - BLOCK
    )
    :vars
    (
      ?auto_485845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485844 ?auto_485845 ) ( ON-TABLE ?auto_485834 ) ( not ( = ?auto_485834 ?auto_485835 ) ) ( not ( = ?auto_485834 ?auto_485836 ) ) ( not ( = ?auto_485834 ?auto_485837 ) ) ( not ( = ?auto_485834 ?auto_485838 ) ) ( not ( = ?auto_485834 ?auto_485839 ) ) ( not ( = ?auto_485834 ?auto_485840 ) ) ( not ( = ?auto_485834 ?auto_485841 ) ) ( not ( = ?auto_485834 ?auto_485842 ) ) ( not ( = ?auto_485834 ?auto_485843 ) ) ( not ( = ?auto_485834 ?auto_485844 ) ) ( not ( = ?auto_485834 ?auto_485845 ) ) ( not ( = ?auto_485835 ?auto_485836 ) ) ( not ( = ?auto_485835 ?auto_485837 ) ) ( not ( = ?auto_485835 ?auto_485838 ) ) ( not ( = ?auto_485835 ?auto_485839 ) ) ( not ( = ?auto_485835 ?auto_485840 ) ) ( not ( = ?auto_485835 ?auto_485841 ) ) ( not ( = ?auto_485835 ?auto_485842 ) ) ( not ( = ?auto_485835 ?auto_485843 ) ) ( not ( = ?auto_485835 ?auto_485844 ) ) ( not ( = ?auto_485835 ?auto_485845 ) ) ( not ( = ?auto_485836 ?auto_485837 ) ) ( not ( = ?auto_485836 ?auto_485838 ) ) ( not ( = ?auto_485836 ?auto_485839 ) ) ( not ( = ?auto_485836 ?auto_485840 ) ) ( not ( = ?auto_485836 ?auto_485841 ) ) ( not ( = ?auto_485836 ?auto_485842 ) ) ( not ( = ?auto_485836 ?auto_485843 ) ) ( not ( = ?auto_485836 ?auto_485844 ) ) ( not ( = ?auto_485836 ?auto_485845 ) ) ( not ( = ?auto_485837 ?auto_485838 ) ) ( not ( = ?auto_485837 ?auto_485839 ) ) ( not ( = ?auto_485837 ?auto_485840 ) ) ( not ( = ?auto_485837 ?auto_485841 ) ) ( not ( = ?auto_485837 ?auto_485842 ) ) ( not ( = ?auto_485837 ?auto_485843 ) ) ( not ( = ?auto_485837 ?auto_485844 ) ) ( not ( = ?auto_485837 ?auto_485845 ) ) ( not ( = ?auto_485838 ?auto_485839 ) ) ( not ( = ?auto_485838 ?auto_485840 ) ) ( not ( = ?auto_485838 ?auto_485841 ) ) ( not ( = ?auto_485838 ?auto_485842 ) ) ( not ( = ?auto_485838 ?auto_485843 ) ) ( not ( = ?auto_485838 ?auto_485844 ) ) ( not ( = ?auto_485838 ?auto_485845 ) ) ( not ( = ?auto_485839 ?auto_485840 ) ) ( not ( = ?auto_485839 ?auto_485841 ) ) ( not ( = ?auto_485839 ?auto_485842 ) ) ( not ( = ?auto_485839 ?auto_485843 ) ) ( not ( = ?auto_485839 ?auto_485844 ) ) ( not ( = ?auto_485839 ?auto_485845 ) ) ( not ( = ?auto_485840 ?auto_485841 ) ) ( not ( = ?auto_485840 ?auto_485842 ) ) ( not ( = ?auto_485840 ?auto_485843 ) ) ( not ( = ?auto_485840 ?auto_485844 ) ) ( not ( = ?auto_485840 ?auto_485845 ) ) ( not ( = ?auto_485841 ?auto_485842 ) ) ( not ( = ?auto_485841 ?auto_485843 ) ) ( not ( = ?auto_485841 ?auto_485844 ) ) ( not ( = ?auto_485841 ?auto_485845 ) ) ( not ( = ?auto_485842 ?auto_485843 ) ) ( not ( = ?auto_485842 ?auto_485844 ) ) ( not ( = ?auto_485842 ?auto_485845 ) ) ( not ( = ?auto_485843 ?auto_485844 ) ) ( not ( = ?auto_485843 ?auto_485845 ) ) ( not ( = ?auto_485844 ?auto_485845 ) ) ( ON ?auto_485843 ?auto_485844 ) ( ON ?auto_485842 ?auto_485843 ) ( ON ?auto_485841 ?auto_485842 ) ( ON ?auto_485840 ?auto_485841 ) ( ON ?auto_485839 ?auto_485840 ) ( ON ?auto_485838 ?auto_485839 ) ( ON ?auto_485837 ?auto_485838 ) ( ON ?auto_485836 ?auto_485837 ) ( CLEAR ?auto_485834 ) ( ON ?auto_485835 ?auto_485836 ) ( CLEAR ?auto_485835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_485834 ?auto_485835 )
      ( MAKE-11PILE ?auto_485834 ?auto_485835 ?auto_485836 ?auto_485837 ?auto_485838 ?auto_485839 ?auto_485840 ?auto_485841 ?auto_485842 ?auto_485843 ?auto_485844 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_485880 - BLOCK
      ?auto_485881 - BLOCK
      ?auto_485882 - BLOCK
      ?auto_485883 - BLOCK
      ?auto_485884 - BLOCK
      ?auto_485885 - BLOCK
      ?auto_485886 - BLOCK
      ?auto_485887 - BLOCK
      ?auto_485888 - BLOCK
      ?auto_485889 - BLOCK
      ?auto_485890 - BLOCK
    )
    :vars
    (
      ?auto_485891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485890 ?auto_485891 ) ( not ( = ?auto_485880 ?auto_485881 ) ) ( not ( = ?auto_485880 ?auto_485882 ) ) ( not ( = ?auto_485880 ?auto_485883 ) ) ( not ( = ?auto_485880 ?auto_485884 ) ) ( not ( = ?auto_485880 ?auto_485885 ) ) ( not ( = ?auto_485880 ?auto_485886 ) ) ( not ( = ?auto_485880 ?auto_485887 ) ) ( not ( = ?auto_485880 ?auto_485888 ) ) ( not ( = ?auto_485880 ?auto_485889 ) ) ( not ( = ?auto_485880 ?auto_485890 ) ) ( not ( = ?auto_485880 ?auto_485891 ) ) ( not ( = ?auto_485881 ?auto_485882 ) ) ( not ( = ?auto_485881 ?auto_485883 ) ) ( not ( = ?auto_485881 ?auto_485884 ) ) ( not ( = ?auto_485881 ?auto_485885 ) ) ( not ( = ?auto_485881 ?auto_485886 ) ) ( not ( = ?auto_485881 ?auto_485887 ) ) ( not ( = ?auto_485881 ?auto_485888 ) ) ( not ( = ?auto_485881 ?auto_485889 ) ) ( not ( = ?auto_485881 ?auto_485890 ) ) ( not ( = ?auto_485881 ?auto_485891 ) ) ( not ( = ?auto_485882 ?auto_485883 ) ) ( not ( = ?auto_485882 ?auto_485884 ) ) ( not ( = ?auto_485882 ?auto_485885 ) ) ( not ( = ?auto_485882 ?auto_485886 ) ) ( not ( = ?auto_485882 ?auto_485887 ) ) ( not ( = ?auto_485882 ?auto_485888 ) ) ( not ( = ?auto_485882 ?auto_485889 ) ) ( not ( = ?auto_485882 ?auto_485890 ) ) ( not ( = ?auto_485882 ?auto_485891 ) ) ( not ( = ?auto_485883 ?auto_485884 ) ) ( not ( = ?auto_485883 ?auto_485885 ) ) ( not ( = ?auto_485883 ?auto_485886 ) ) ( not ( = ?auto_485883 ?auto_485887 ) ) ( not ( = ?auto_485883 ?auto_485888 ) ) ( not ( = ?auto_485883 ?auto_485889 ) ) ( not ( = ?auto_485883 ?auto_485890 ) ) ( not ( = ?auto_485883 ?auto_485891 ) ) ( not ( = ?auto_485884 ?auto_485885 ) ) ( not ( = ?auto_485884 ?auto_485886 ) ) ( not ( = ?auto_485884 ?auto_485887 ) ) ( not ( = ?auto_485884 ?auto_485888 ) ) ( not ( = ?auto_485884 ?auto_485889 ) ) ( not ( = ?auto_485884 ?auto_485890 ) ) ( not ( = ?auto_485884 ?auto_485891 ) ) ( not ( = ?auto_485885 ?auto_485886 ) ) ( not ( = ?auto_485885 ?auto_485887 ) ) ( not ( = ?auto_485885 ?auto_485888 ) ) ( not ( = ?auto_485885 ?auto_485889 ) ) ( not ( = ?auto_485885 ?auto_485890 ) ) ( not ( = ?auto_485885 ?auto_485891 ) ) ( not ( = ?auto_485886 ?auto_485887 ) ) ( not ( = ?auto_485886 ?auto_485888 ) ) ( not ( = ?auto_485886 ?auto_485889 ) ) ( not ( = ?auto_485886 ?auto_485890 ) ) ( not ( = ?auto_485886 ?auto_485891 ) ) ( not ( = ?auto_485887 ?auto_485888 ) ) ( not ( = ?auto_485887 ?auto_485889 ) ) ( not ( = ?auto_485887 ?auto_485890 ) ) ( not ( = ?auto_485887 ?auto_485891 ) ) ( not ( = ?auto_485888 ?auto_485889 ) ) ( not ( = ?auto_485888 ?auto_485890 ) ) ( not ( = ?auto_485888 ?auto_485891 ) ) ( not ( = ?auto_485889 ?auto_485890 ) ) ( not ( = ?auto_485889 ?auto_485891 ) ) ( not ( = ?auto_485890 ?auto_485891 ) ) ( ON ?auto_485889 ?auto_485890 ) ( ON ?auto_485888 ?auto_485889 ) ( ON ?auto_485887 ?auto_485888 ) ( ON ?auto_485886 ?auto_485887 ) ( ON ?auto_485885 ?auto_485886 ) ( ON ?auto_485884 ?auto_485885 ) ( ON ?auto_485883 ?auto_485884 ) ( ON ?auto_485882 ?auto_485883 ) ( ON ?auto_485881 ?auto_485882 ) ( ON ?auto_485880 ?auto_485881 ) ( CLEAR ?auto_485880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_485880 )
      ( MAKE-11PILE ?auto_485880 ?auto_485881 ?auto_485882 ?auto_485883 ?auto_485884 ?auto_485885 ?auto_485886 ?auto_485887 ?auto_485888 ?auto_485889 ?auto_485890 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_485927 - BLOCK
      ?auto_485928 - BLOCK
      ?auto_485929 - BLOCK
      ?auto_485930 - BLOCK
      ?auto_485931 - BLOCK
      ?auto_485932 - BLOCK
      ?auto_485933 - BLOCK
      ?auto_485934 - BLOCK
      ?auto_485935 - BLOCK
      ?auto_485936 - BLOCK
      ?auto_485937 - BLOCK
      ?auto_485938 - BLOCK
    )
    :vars
    (
      ?auto_485939 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_485937 ) ( ON ?auto_485938 ?auto_485939 ) ( CLEAR ?auto_485938 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_485927 ) ( ON ?auto_485928 ?auto_485927 ) ( ON ?auto_485929 ?auto_485928 ) ( ON ?auto_485930 ?auto_485929 ) ( ON ?auto_485931 ?auto_485930 ) ( ON ?auto_485932 ?auto_485931 ) ( ON ?auto_485933 ?auto_485932 ) ( ON ?auto_485934 ?auto_485933 ) ( ON ?auto_485935 ?auto_485934 ) ( ON ?auto_485936 ?auto_485935 ) ( ON ?auto_485937 ?auto_485936 ) ( not ( = ?auto_485927 ?auto_485928 ) ) ( not ( = ?auto_485927 ?auto_485929 ) ) ( not ( = ?auto_485927 ?auto_485930 ) ) ( not ( = ?auto_485927 ?auto_485931 ) ) ( not ( = ?auto_485927 ?auto_485932 ) ) ( not ( = ?auto_485927 ?auto_485933 ) ) ( not ( = ?auto_485927 ?auto_485934 ) ) ( not ( = ?auto_485927 ?auto_485935 ) ) ( not ( = ?auto_485927 ?auto_485936 ) ) ( not ( = ?auto_485927 ?auto_485937 ) ) ( not ( = ?auto_485927 ?auto_485938 ) ) ( not ( = ?auto_485927 ?auto_485939 ) ) ( not ( = ?auto_485928 ?auto_485929 ) ) ( not ( = ?auto_485928 ?auto_485930 ) ) ( not ( = ?auto_485928 ?auto_485931 ) ) ( not ( = ?auto_485928 ?auto_485932 ) ) ( not ( = ?auto_485928 ?auto_485933 ) ) ( not ( = ?auto_485928 ?auto_485934 ) ) ( not ( = ?auto_485928 ?auto_485935 ) ) ( not ( = ?auto_485928 ?auto_485936 ) ) ( not ( = ?auto_485928 ?auto_485937 ) ) ( not ( = ?auto_485928 ?auto_485938 ) ) ( not ( = ?auto_485928 ?auto_485939 ) ) ( not ( = ?auto_485929 ?auto_485930 ) ) ( not ( = ?auto_485929 ?auto_485931 ) ) ( not ( = ?auto_485929 ?auto_485932 ) ) ( not ( = ?auto_485929 ?auto_485933 ) ) ( not ( = ?auto_485929 ?auto_485934 ) ) ( not ( = ?auto_485929 ?auto_485935 ) ) ( not ( = ?auto_485929 ?auto_485936 ) ) ( not ( = ?auto_485929 ?auto_485937 ) ) ( not ( = ?auto_485929 ?auto_485938 ) ) ( not ( = ?auto_485929 ?auto_485939 ) ) ( not ( = ?auto_485930 ?auto_485931 ) ) ( not ( = ?auto_485930 ?auto_485932 ) ) ( not ( = ?auto_485930 ?auto_485933 ) ) ( not ( = ?auto_485930 ?auto_485934 ) ) ( not ( = ?auto_485930 ?auto_485935 ) ) ( not ( = ?auto_485930 ?auto_485936 ) ) ( not ( = ?auto_485930 ?auto_485937 ) ) ( not ( = ?auto_485930 ?auto_485938 ) ) ( not ( = ?auto_485930 ?auto_485939 ) ) ( not ( = ?auto_485931 ?auto_485932 ) ) ( not ( = ?auto_485931 ?auto_485933 ) ) ( not ( = ?auto_485931 ?auto_485934 ) ) ( not ( = ?auto_485931 ?auto_485935 ) ) ( not ( = ?auto_485931 ?auto_485936 ) ) ( not ( = ?auto_485931 ?auto_485937 ) ) ( not ( = ?auto_485931 ?auto_485938 ) ) ( not ( = ?auto_485931 ?auto_485939 ) ) ( not ( = ?auto_485932 ?auto_485933 ) ) ( not ( = ?auto_485932 ?auto_485934 ) ) ( not ( = ?auto_485932 ?auto_485935 ) ) ( not ( = ?auto_485932 ?auto_485936 ) ) ( not ( = ?auto_485932 ?auto_485937 ) ) ( not ( = ?auto_485932 ?auto_485938 ) ) ( not ( = ?auto_485932 ?auto_485939 ) ) ( not ( = ?auto_485933 ?auto_485934 ) ) ( not ( = ?auto_485933 ?auto_485935 ) ) ( not ( = ?auto_485933 ?auto_485936 ) ) ( not ( = ?auto_485933 ?auto_485937 ) ) ( not ( = ?auto_485933 ?auto_485938 ) ) ( not ( = ?auto_485933 ?auto_485939 ) ) ( not ( = ?auto_485934 ?auto_485935 ) ) ( not ( = ?auto_485934 ?auto_485936 ) ) ( not ( = ?auto_485934 ?auto_485937 ) ) ( not ( = ?auto_485934 ?auto_485938 ) ) ( not ( = ?auto_485934 ?auto_485939 ) ) ( not ( = ?auto_485935 ?auto_485936 ) ) ( not ( = ?auto_485935 ?auto_485937 ) ) ( not ( = ?auto_485935 ?auto_485938 ) ) ( not ( = ?auto_485935 ?auto_485939 ) ) ( not ( = ?auto_485936 ?auto_485937 ) ) ( not ( = ?auto_485936 ?auto_485938 ) ) ( not ( = ?auto_485936 ?auto_485939 ) ) ( not ( = ?auto_485937 ?auto_485938 ) ) ( not ( = ?auto_485937 ?auto_485939 ) ) ( not ( = ?auto_485938 ?auto_485939 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_485938 ?auto_485939 )
      ( !STACK ?auto_485938 ?auto_485937 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_485977 - BLOCK
      ?auto_485978 - BLOCK
      ?auto_485979 - BLOCK
      ?auto_485980 - BLOCK
      ?auto_485981 - BLOCK
      ?auto_485982 - BLOCK
      ?auto_485983 - BLOCK
      ?auto_485984 - BLOCK
      ?auto_485985 - BLOCK
      ?auto_485986 - BLOCK
      ?auto_485987 - BLOCK
      ?auto_485988 - BLOCK
    )
    :vars
    (
      ?auto_485989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_485988 ?auto_485989 ) ( ON-TABLE ?auto_485977 ) ( ON ?auto_485978 ?auto_485977 ) ( ON ?auto_485979 ?auto_485978 ) ( ON ?auto_485980 ?auto_485979 ) ( ON ?auto_485981 ?auto_485980 ) ( ON ?auto_485982 ?auto_485981 ) ( ON ?auto_485983 ?auto_485982 ) ( ON ?auto_485984 ?auto_485983 ) ( ON ?auto_485985 ?auto_485984 ) ( ON ?auto_485986 ?auto_485985 ) ( not ( = ?auto_485977 ?auto_485978 ) ) ( not ( = ?auto_485977 ?auto_485979 ) ) ( not ( = ?auto_485977 ?auto_485980 ) ) ( not ( = ?auto_485977 ?auto_485981 ) ) ( not ( = ?auto_485977 ?auto_485982 ) ) ( not ( = ?auto_485977 ?auto_485983 ) ) ( not ( = ?auto_485977 ?auto_485984 ) ) ( not ( = ?auto_485977 ?auto_485985 ) ) ( not ( = ?auto_485977 ?auto_485986 ) ) ( not ( = ?auto_485977 ?auto_485987 ) ) ( not ( = ?auto_485977 ?auto_485988 ) ) ( not ( = ?auto_485977 ?auto_485989 ) ) ( not ( = ?auto_485978 ?auto_485979 ) ) ( not ( = ?auto_485978 ?auto_485980 ) ) ( not ( = ?auto_485978 ?auto_485981 ) ) ( not ( = ?auto_485978 ?auto_485982 ) ) ( not ( = ?auto_485978 ?auto_485983 ) ) ( not ( = ?auto_485978 ?auto_485984 ) ) ( not ( = ?auto_485978 ?auto_485985 ) ) ( not ( = ?auto_485978 ?auto_485986 ) ) ( not ( = ?auto_485978 ?auto_485987 ) ) ( not ( = ?auto_485978 ?auto_485988 ) ) ( not ( = ?auto_485978 ?auto_485989 ) ) ( not ( = ?auto_485979 ?auto_485980 ) ) ( not ( = ?auto_485979 ?auto_485981 ) ) ( not ( = ?auto_485979 ?auto_485982 ) ) ( not ( = ?auto_485979 ?auto_485983 ) ) ( not ( = ?auto_485979 ?auto_485984 ) ) ( not ( = ?auto_485979 ?auto_485985 ) ) ( not ( = ?auto_485979 ?auto_485986 ) ) ( not ( = ?auto_485979 ?auto_485987 ) ) ( not ( = ?auto_485979 ?auto_485988 ) ) ( not ( = ?auto_485979 ?auto_485989 ) ) ( not ( = ?auto_485980 ?auto_485981 ) ) ( not ( = ?auto_485980 ?auto_485982 ) ) ( not ( = ?auto_485980 ?auto_485983 ) ) ( not ( = ?auto_485980 ?auto_485984 ) ) ( not ( = ?auto_485980 ?auto_485985 ) ) ( not ( = ?auto_485980 ?auto_485986 ) ) ( not ( = ?auto_485980 ?auto_485987 ) ) ( not ( = ?auto_485980 ?auto_485988 ) ) ( not ( = ?auto_485980 ?auto_485989 ) ) ( not ( = ?auto_485981 ?auto_485982 ) ) ( not ( = ?auto_485981 ?auto_485983 ) ) ( not ( = ?auto_485981 ?auto_485984 ) ) ( not ( = ?auto_485981 ?auto_485985 ) ) ( not ( = ?auto_485981 ?auto_485986 ) ) ( not ( = ?auto_485981 ?auto_485987 ) ) ( not ( = ?auto_485981 ?auto_485988 ) ) ( not ( = ?auto_485981 ?auto_485989 ) ) ( not ( = ?auto_485982 ?auto_485983 ) ) ( not ( = ?auto_485982 ?auto_485984 ) ) ( not ( = ?auto_485982 ?auto_485985 ) ) ( not ( = ?auto_485982 ?auto_485986 ) ) ( not ( = ?auto_485982 ?auto_485987 ) ) ( not ( = ?auto_485982 ?auto_485988 ) ) ( not ( = ?auto_485982 ?auto_485989 ) ) ( not ( = ?auto_485983 ?auto_485984 ) ) ( not ( = ?auto_485983 ?auto_485985 ) ) ( not ( = ?auto_485983 ?auto_485986 ) ) ( not ( = ?auto_485983 ?auto_485987 ) ) ( not ( = ?auto_485983 ?auto_485988 ) ) ( not ( = ?auto_485983 ?auto_485989 ) ) ( not ( = ?auto_485984 ?auto_485985 ) ) ( not ( = ?auto_485984 ?auto_485986 ) ) ( not ( = ?auto_485984 ?auto_485987 ) ) ( not ( = ?auto_485984 ?auto_485988 ) ) ( not ( = ?auto_485984 ?auto_485989 ) ) ( not ( = ?auto_485985 ?auto_485986 ) ) ( not ( = ?auto_485985 ?auto_485987 ) ) ( not ( = ?auto_485985 ?auto_485988 ) ) ( not ( = ?auto_485985 ?auto_485989 ) ) ( not ( = ?auto_485986 ?auto_485987 ) ) ( not ( = ?auto_485986 ?auto_485988 ) ) ( not ( = ?auto_485986 ?auto_485989 ) ) ( not ( = ?auto_485987 ?auto_485988 ) ) ( not ( = ?auto_485987 ?auto_485989 ) ) ( not ( = ?auto_485988 ?auto_485989 ) ) ( CLEAR ?auto_485986 ) ( ON ?auto_485987 ?auto_485988 ) ( CLEAR ?auto_485987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_485977 ?auto_485978 ?auto_485979 ?auto_485980 ?auto_485981 ?auto_485982 ?auto_485983 ?auto_485984 ?auto_485985 ?auto_485986 ?auto_485987 )
      ( MAKE-12PILE ?auto_485977 ?auto_485978 ?auto_485979 ?auto_485980 ?auto_485981 ?auto_485982 ?auto_485983 ?auto_485984 ?auto_485985 ?auto_485986 ?auto_485987 ?auto_485988 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_486027 - BLOCK
      ?auto_486028 - BLOCK
      ?auto_486029 - BLOCK
      ?auto_486030 - BLOCK
      ?auto_486031 - BLOCK
      ?auto_486032 - BLOCK
      ?auto_486033 - BLOCK
      ?auto_486034 - BLOCK
      ?auto_486035 - BLOCK
      ?auto_486036 - BLOCK
      ?auto_486037 - BLOCK
      ?auto_486038 - BLOCK
    )
    :vars
    (
      ?auto_486039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486038 ?auto_486039 ) ( ON-TABLE ?auto_486027 ) ( ON ?auto_486028 ?auto_486027 ) ( ON ?auto_486029 ?auto_486028 ) ( ON ?auto_486030 ?auto_486029 ) ( ON ?auto_486031 ?auto_486030 ) ( ON ?auto_486032 ?auto_486031 ) ( ON ?auto_486033 ?auto_486032 ) ( ON ?auto_486034 ?auto_486033 ) ( ON ?auto_486035 ?auto_486034 ) ( not ( = ?auto_486027 ?auto_486028 ) ) ( not ( = ?auto_486027 ?auto_486029 ) ) ( not ( = ?auto_486027 ?auto_486030 ) ) ( not ( = ?auto_486027 ?auto_486031 ) ) ( not ( = ?auto_486027 ?auto_486032 ) ) ( not ( = ?auto_486027 ?auto_486033 ) ) ( not ( = ?auto_486027 ?auto_486034 ) ) ( not ( = ?auto_486027 ?auto_486035 ) ) ( not ( = ?auto_486027 ?auto_486036 ) ) ( not ( = ?auto_486027 ?auto_486037 ) ) ( not ( = ?auto_486027 ?auto_486038 ) ) ( not ( = ?auto_486027 ?auto_486039 ) ) ( not ( = ?auto_486028 ?auto_486029 ) ) ( not ( = ?auto_486028 ?auto_486030 ) ) ( not ( = ?auto_486028 ?auto_486031 ) ) ( not ( = ?auto_486028 ?auto_486032 ) ) ( not ( = ?auto_486028 ?auto_486033 ) ) ( not ( = ?auto_486028 ?auto_486034 ) ) ( not ( = ?auto_486028 ?auto_486035 ) ) ( not ( = ?auto_486028 ?auto_486036 ) ) ( not ( = ?auto_486028 ?auto_486037 ) ) ( not ( = ?auto_486028 ?auto_486038 ) ) ( not ( = ?auto_486028 ?auto_486039 ) ) ( not ( = ?auto_486029 ?auto_486030 ) ) ( not ( = ?auto_486029 ?auto_486031 ) ) ( not ( = ?auto_486029 ?auto_486032 ) ) ( not ( = ?auto_486029 ?auto_486033 ) ) ( not ( = ?auto_486029 ?auto_486034 ) ) ( not ( = ?auto_486029 ?auto_486035 ) ) ( not ( = ?auto_486029 ?auto_486036 ) ) ( not ( = ?auto_486029 ?auto_486037 ) ) ( not ( = ?auto_486029 ?auto_486038 ) ) ( not ( = ?auto_486029 ?auto_486039 ) ) ( not ( = ?auto_486030 ?auto_486031 ) ) ( not ( = ?auto_486030 ?auto_486032 ) ) ( not ( = ?auto_486030 ?auto_486033 ) ) ( not ( = ?auto_486030 ?auto_486034 ) ) ( not ( = ?auto_486030 ?auto_486035 ) ) ( not ( = ?auto_486030 ?auto_486036 ) ) ( not ( = ?auto_486030 ?auto_486037 ) ) ( not ( = ?auto_486030 ?auto_486038 ) ) ( not ( = ?auto_486030 ?auto_486039 ) ) ( not ( = ?auto_486031 ?auto_486032 ) ) ( not ( = ?auto_486031 ?auto_486033 ) ) ( not ( = ?auto_486031 ?auto_486034 ) ) ( not ( = ?auto_486031 ?auto_486035 ) ) ( not ( = ?auto_486031 ?auto_486036 ) ) ( not ( = ?auto_486031 ?auto_486037 ) ) ( not ( = ?auto_486031 ?auto_486038 ) ) ( not ( = ?auto_486031 ?auto_486039 ) ) ( not ( = ?auto_486032 ?auto_486033 ) ) ( not ( = ?auto_486032 ?auto_486034 ) ) ( not ( = ?auto_486032 ?auto_486035 ) ) ( not ( = ?auto_486032 ?auto_486036 ) ) ( not ( = ?auto_486032 ?auto_486037 ) ) ( not ( = ?auto_486032 ?auto_486038 ) ) ( not ( = ?auto_486032 ?auto_486039 ) ) ( not ( = ?auto_486033 ?auto_486034 ) ) ( not ( = ?auto_486033 ?auto_486035 ) ) ( not ( = ?auto_486033 ?auto_486036 ) ) ( not ( = ?auto_486033 ?auto_486037 ) ) ( not ( = ?auto_486033 ?auto_486038 ) ) ( not ( = ?auto_486033 ?auto_486039 ) ) ( not ( = ?auto_486034 ?auto_486035 ) ) ( not ( = ?auto_486034 ?auto_486036 ) ) ( not ( = ?auto_486034 ?auto_486037 ) ) ( not ( = ?auto_486034 ?auto_486038 ) ) ( not ( = ?auto_486034 ?auto_486039 ) ) ( not ( = ?auto_486035 ?auto_486036 ) ) ( not ( = ?auto_486035 ?auto_486037 ) ) ( not ( = ?auto_486035 ?auto_486038 ) ) ( not ( = ?auto_486035 ?auto_486039 ) ) ( not ( = ?auto_486036 ?auto_486037 ) ) ( not ( = ?auto_486036 ?auto_486038 ) ) ( not ( = ?auto_486036 ?auto_486039 ) ) ( not ( = ?auto_486037 ?auto_486038 ) ) ( not ( = ?auto_486037 ?auto_486039 ) ) ( not ( = ?auto_486038 ?auto_486039 ) ) ( ON ?auto_486037 ?auto_486038 ) ( CLEAR ?auto_486035 ) ( ON ?auto_486036 ?auto_486037 ) ( CLEAR ?auto_486036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_486027 ?auto_486028 ?auto_486029 ?auto_486030 ?auto_486031 ?auto_486032 ?auto_486033 ?auto_486034 ?auto_486035 ?auto_486036 )
      ( MAKE-12PILE ?auto_486027 ?auto_486028 ?auto_486029 ?auto_486030 ?auto_486031 ?auto_486032 ?auto_486033 ?auto_486034 ?auto_486035 ?auto_486036 ?auto_486037 ?auto_486038 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_486077 - BLOCK
      ?auto_486078 - BLOCK
      ?auto_486079 - BLOCK
      ?auto_486080 - BLOCK
      ?auto_486081 - BLOCK
      ?auto_486082 - BLOCK
      ?auto_486083 - BLOCK
      ?auto_486084 - BLOCK
      ?auto_486085 - BLOCK
      ?auto_486086 - BLOCK
      ?auto_486087 - BLOCK
      ?auto_486088 - BLOCK
    )
    :vars
    (
      ?auto_486089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486088 ?auto_486089 ) ( ON-TABLE ?auto_486077 ) ( ON ?auto_486078 ?auto_486077 ) ( ON ?auto_486079 ?auto_486078 ) ( ON ?auto_486080 ?auto_486079 ) ( ON ?auto_486081 ?auto_486080 ) ( ON ?auto_486082 ?auto_486081 ) ( ON ?auto_486083 ?auto_486082 ) ( ON ?auto_486084 ?auto_486083 ) ( not ( = ?auto_486077 ?auto_486078 ) ) ( not ( = ?auto_486077 ?auto_486079 ) ) ( not ( = ?auto_486077 ?auto_486080 ) ) ( not ( = ?auto_486077 ?auto_486081 ) ) ( not ( = ?auto_486077 ?auto_486082 ) ) ( not ( = ?auto_486077 ?auto_486083 ) ) ( not ( = ?auto_486077 ?auto_486084 ) ) ( not ( = ?auto_486077 ?auto_486085 ) ) ( not ( = ?auto_486077 ?auto_486086 ) ) ( not ( = ?auto_486077 ?auto_486087 ) ) ( not ( = ?auto_486077 ?auto_486088 ) ) ( not ( = ?auto_486077 ?auto_486089 ) ) ( not ( = ?auto_486078 ?auto_486079 ) ) ( not ( = ?auto_486078 ?auto_486080 ) ) ( not ( = ?auto_486078 ?auto_486081 ) ) ( not ( = ?auto_486078 ?auto_486082 ) ) ( not ( = ?auto_486078 ?auto_486083 ) ) ( not ( = ?auto_486078 ?auto_486084 ) ) ( not ( = ?auto_486078 ?auto_486085 ) ) ( not ( = ?auto_486078 ?auto_486086 ) ) ( not ( = ?auto_486078 ?auto_486087 ) ) ( not ( = ?auto_486078 ?auto_486088 ) ) ( not ( = ?auto_486078 ?auto_486089 ) ) ( not ( = ?auto_486079 ?auto_486080 ) ) ( not ( = ?auto_486079 ?auto_486081 ) ) ( not ( = ?auto_486079 ?auto_486082 ) ) ( not ( = ?auto_486079 ?auto_486083 ) ) ( not ( = ?auto_486079 ?auto_486084 ) ) ( not ( = ?auto_486079 ?auto_486085 ) ) ( not ( = ?auto_486079 ?auto_486086 ) ) ( not ( = ?auto_486079 ?auto_486087 ) ) ( not ( = ?auto_486079 ?auto_486088 ) ) ( not ( = ?auto_486079 ?auto_486089 ) ) ( not ( = ?auto_486080 ?auto_486081 ) ) ( not ( = ?auto_486080 ?auto_486082 ) ) ( not ( = ?auto_486080 ?auto_486083 ) ) ( not ( = ?auto_486080 ?auto_486084 ) ) ( not ( = ?auto_486080 ?auto_486085 ) ) ( not ( = ?auto_486080 ?auto_486086 ) ) ( not ( = ?auto_486080 ?auto_486087 ) ) ( not ( = ?auto_486080 ?auto_486088 ) ) ( not ( = ?auto_486080 ?auto_486089 ) ) ( not ( = ?auto_486081 ?auto_486082 ) ) ( not ( = ?auto_486081 ?auto_486083 ) ) ( not ( = ?auto_486081 ?auto_486084 ) ) ( not ( = ?auto_486081 ?auto_486085 ) ) ( not ( = ?auto_486081 ?auto_486086 ) ) ( not ( = ?auto_486081 ?auto_486087 ) ) ( not ( = ?auto_486081 ?auto_486088 ) ) ( not ( = ?auto_486081 ?auto_486089 ) ) ( not ( = ?auto_486082 ?auto_486083 ) ) ( not ( = ?auto_486082 ?auto_486084 ) ) ( not ( = ?auto_486082 ?auto_486085 ) ) ( not ( = ?auto_486082 ?auto_486086 ) ) ( not ( = ?auto_486082 ?auto_486087 ) ) ( not ( = ?auto_486082 ?auto_486088 ) ) ( not ( = ?auto_486082 ?auto_486089 ) ) ( not ( = ?auto_486083 ?auto_486084 ) ) ( not ( = ?auto_486083 ?auto_486085 ) ) ( not ( = ?auto_486083 ?auto_486086 ) ) ( not ( = ?auto_486083 ?auto_486087 ) ) ( not ( = ?auto_486083 ?auto_486088 ) ) ( not ( = ?auto_486083 ?auto_486089 ) ) ( not ( = ?auto_486084 ?auto_486085 ) ) ( not ( = ?auto_486084 ?auto_486086 ) ) ( not ( = ?auto_486084 ?auto_486087 ) ) ( not ( = ?auto_486084 ?auto_486088 ) ) ( not ( = ?auto_486084 ?auto_486089 ) ) ( not ( = ?auto_486085 ?auto_486086 ) ) ( not ( = ?auto_486085 ?auto_486087 ) ) ( not ( = ?auto_486085 ?auto_486088 ) ) ( not ( = ?auto_486085 ?auto_486089 ) ) ( not ( = ?auto_486086 ?auto_486087 ) ) ( not ( = ?auto_486086 ?auto_486088 ) ) ( not ( = ?auto_486086 ?auto_486089 ) ) ( not ( = ?auto_486087 ?auto_486088 ) ) ( not ( = ?auto_486087 ?auto_486089 ) ) ( not ( = ?auto_486088 ?auto_486089 ) ) ( ON ?auto_486087 ?auto_486088 ) ( ON ?auto_486086 ?auto_486087 ) ( CLEAR ?auto_486084 ) ( ON ?auto_486085 ?auto_486086 ) ( CLEAR ?auto_486085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_486077 ?auto_486078 ?auto_486079 ?auto_486080 ?auto_486081 ?auto_486082 ?auto_486083 ?auto_486084 ?auto_486085 )
      ( MAKE-12PILE ?auto_486077 ?auto_486078 ?auto_486079 ?auto_486080 ?auto_486081 ?auto_486082 ?auto_486083 ?auto_486084 ?auto_486085 ?auto_486086 ?auto_486087 ?auto_486088 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_486127 - BLOCK
      ?auto_486128 - BLOCK
      ?auto_486129 - BLOCK
      ?auto_486130 - BLOCK
      ?auto_486131 - BLOCK
      ?auto_486132 - BLOCK
      ?auto_486133 - BLOCK
      ?auto_486134 - BLOCK
      ?auto_486135 - BLOCK
      ?auto_486136 - BLOCK
      ?auto_486137 - BLOCK
      ?auto_486138 - BLOCK
    )
    :vars
    (
      ?auto_486139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486138 ?auto_486139 ) ( ON-TABLE ?auto_486127 ) ( ON ?auto_486128 ?auto_486127 ) ( ON ?auto_486129 ?auto_486128 ) ( ON ?auto_486130 ?auto_486129 ) ( ON ?auto_486131 ?auto_486130 ) ( ON ?auto_486132 ?auto_486131 ) ( ON ?auto_486133 ?auto_486132 ) ( not ( = ?auto_486127 ?auto_486128 ) ) ( not ( = ?auto_486127 ?auto_486129 ) ) ( not ( = ?auto_486127 ?auto_486130 ) ) ( not ( = ?auto_486127 ?auto_486131 ) ) ( not ( = ?auto_486127 ?auto_486132 ) ) ( not ( = ?auto_486127 ?auto_486133 ) ) ( not ( = ?auto_486127 ?auto_486134 ) ) ( not ( = ?auto_486127 ?auto_486135 ) ) ( not ( = ?auto_486127 ?auto_486136 ) ) ( not ( = ?auto_486127 ?auto_486137 ) ) ( not ( = ?auto_486127 ?auto_486138 ) ) ( not ( = ?auto_486127 ?auto_486139 ) ) ( not ( = ?auto_486128 ?auto_486129 ) ) ( not ( = ?auto_486128 ?auto_486130 ) ) ( not ( = ?auto_486128 ?auto_486131 ) ) ( not ( = ?auto_486128 ?auto_486132 ) ) ( not ( = ?auto_486128 ?auto_486133 ) ) ( not ( = ?auto_486128 ?auto_486134 ) ) ( not ( = ?auto_486128 ?auto_486135 ) ) ( not ( = ?auto_486128 ?auto_486136 ) ) ( not ( = ?auto_486128 ?auto_486137 ) ) ( not ( = ?auto_486128 ?auto_486138 ) ) ( not ( = ?auto_486128 ?auto_486139 ) ) ( not ( = ?auto_486129 ?auto_486130 ) ) ( not ( = ?auto_486129 ?auto_486131 ) ) ( not ( = ?auto_486129 ?auto_486132 ) ) ( not ( = ?auto_486129 ?auto_486133 ) ) ( not ( = ?auto_486129 ?auto_486134 ) ) ( not ( = ?auto_486129 ?auto_486135 ) ) ( not ( = ?auto_486129 ?auto_486136 ) ) ( not ( = ?auto_486129 ?auto_486137 ) ) ( not ( = ?auto_486129 ?auto_486138 ) ) ( not ( = ?auto_486129 ?auto_486139 ) ) ( not ( = ?auto_486130 ?auto_486131 ) ) ( not ( = ?auto_486130 ?auto_486132 ) ) ( not ( = ?auto_486130 ?auto_486133 ) ) ( not ( = ?auto_486130 ?auto_486134 ) ) ( not ( = ?auto_486130 ?auto_486135 ) ) ( not ( = ?auto_486130 ?auto_486136 ) ) ( not ( = ?auto_486130 ?auto_486137 ) ) ( not ( = ?auto_486130 ?auto_486138 ) ) ( not ( = ?auto_486130 ?auto_486139 ) ) ( not ( = ?auto_486131 ?auto_486132 ) ) ( not ( = ?auto_486131 ?auto_486133 ) ) ( not ( = ?auto_486131 ?auto_486134 ) ) ( not ( = ?auto_486131 ?auto_486135 ) ) ( not ( = ?auto_486131 ?auto_486136 ) ) ( not ( = ?auto_486131 ?auto_486137 ) ) ( not ( = ?auto_486131 ?auto_486138 ) ) ( not ( = ?auto_486131 ?auto_486139 ) ) ( not ( = ?auto_486132 ?auto_486133 ) ) ( not ( = ?auto_486132 ?auto_486134 ) ) ( not ( = ?auto_486132 ?auto_486135 ) ) ( not ( = ?auto_486132 ?auto_486136 ) ) ( not ( = ?auto_486132 ?auto_486137 ) ) ( not ( = ?auto_486132 ?auto_486138 ) ) ( not ( = ?auto_486132 ?auto_486139 ) ) ( not ( = ?auto_486133 ?auto_486134 ) ) ( not ( = ?auto_486133 ?auto_486135 ) ) ( not ( = ?auto_486133 ?auto_486136 ) ) ( not ( = ?auto_486133 ?auto_486137 ) ) ( not ( = ?auto_486133 ?auto_486138 ) ) ( not ( = ?auto_486133 ?auto_486139 ) ) ( not ( = ?auto_486134 ?auto_486135 ) ) ( not ( = ?auto_486134 ?auto_486136 ) ) ( not ( = ?auto_486134 ?auto_486137 ) ) ( not ( = ?auto_486134 ?auto_486138 ) ) ( not ( = ?auto_486134 ?auto_486139 ) ) ( not ( = ?auto_486135 ?auto_486136 ) ) ( not ( = ?auto_486135 ?auto_486137 ) ) ( not ( = ?auto_486135 ?auto_486138 ) ) ( not ( = ?auto_486135 ?auto_486139 ) ) ( not ( = ?auto_486136 ?auto_486137 ) ) ( not ( = ?auto_486136 ?auto_486138 ) ) ( not ( = ?auto_486136 ?auto_486139 ) ) ( not ( = ?auto_486137 ?auto_486138 ) ) ( not ( = ?auto_486137 ?auto_486139 ) ) ( not ( = ?auto_486138 ?auto_486139 ) ) ( ON ?auto_486137 ?auto_486138 ) ( ON ?auto_486136 ?auto_486137 ) ( ON ?auto_486135 ?auto_486136 ) ( CLEAR ?auto_486133 ) ( ON ?auto_486134 ?auto_486135 ) ( CLEAR ?auto_486134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_486127 ?auto_486128 ?auto_486129 ?auto_486130 ?auto_486131 ?auto_486132 ?auto_486133 ?auto_486134 )
      ( MAKE-12PILE ?auto_486127 ?auto_486128 ?auto_486129 ?auto_486130 ?auto_486131 ?auto_486132 ?auto_486133 ?auto_486134 ?auto_486135 ?auto_486136 ?auto_486137 ?auto_486138 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_486177 - BLOCK
      ?auto_486178 - BLOCK
      ?auto_486179 - BLOCK
      ?auto_486180 - BLOCK
      ?auto_486181 - BLOCK
      ?auto_486182 - BLOCK
      ?auto_486183 - BLOCK
      ?auto_486184 - BLOCK
      ?auto_486185 - BLOCK
      ?auto_486186 - BLOCK
      ?auto_486187 - BLOCK
      ?auto_486188 - BLOCK
    )
    :vars
    (
      ?auto_486189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486188 ?auto_486189 ) ( ON-TABLE ?auto_486177 ) ( ON ?auto_486178 ?auto_486177 ) ( ON ?auto_486179 ?auto_486178 ) ( ON ?auto_486180 ?auto_486179 ) ( ON ?auto_486181 ?auto_486180 ) ( ON ?auto_486182 ?auto_486181 ) ( not ( = ?auto_486177 ?auto_486178 ) ) ( not ( = ?auto_486177 ?auto_486179 ) ) ( not ( = ?auto_486177 ?auto_486180 ) ) ( not ( = ?auto_486177 ?auto_486181 ) ) ( not ( = ?auto_486177 ?auto_486182 ) ) ( not ( = ?auto_486177 ?auto_486183 ) ) ( not ( = ?auto_486177 ?auto_486184 ) ) ( not ( = ?auto_486177 ?auto_486185 ) ) ( not ( = ?auto_486177 ?auto_486186 ) ) ( not ( = ?auto_486177 ?auto_486187 ) ) ( not ( = ?auto_486177 ?auto_486188 ) ) ( not ( = ?auto_486177 ?auto_486189 ) ) ( not ( = ?auto_486178 ?auto_486179 ) ) ( not ( = ?auto_486178 ?auto_486180 ) ) ( not ( = ?auto_486178 ?auto_486181 ) ) ( not ( = ?auto_486178 ?auto_486182 ) ) ( not ( = ?auto_486178 ?auto_486183 ) ) ( not ( = ?auto_486178 ?auto_486184 ) ) ( not ( = ?auto_486178 ?auto_486185 ) ) ( not ( = ?auto_486178 ?auto_486186 ) ) ( not ( = ?auto_486178 ?auto_486187 ) ) ( not ( = ?auto_486178 ?auto_486188 ) ) ( not ( = ?auto_486178 ?auto_486189 ) ) ( not ( = ?auto_486179 ?auto_486180 ) ) ( not ( = ?auto_486179 ?auto_486181 ) ) ( not ( = ?auto_486179 ?auto_486182 ) ) ( not ( = ?auto_486179 ?auto_486183 ) ) ( not ( = ?auto_486179 ?auto_486184 ) ) ( not ( = ?auto_486179 ?auto_486185 ) ) ( not ( = ?auto_486179 ?auto_486186 ) ) ( not ( = ?auto_486179 ?auto_486187 ) ) ( not ( = ?auto_486179 ?auto_486188 ) ) ( not ( = ?auto_486179 ?auto_486189 ) ) ( not ( = ?auto_486180 ?auto_486181 ) ) ( not ( = ?auto_486180 ?auto_486182 ) ) ( not ( = ?auto_486180 ?auto_486183 ) ) ( not ( = ?auto_486180 ?auto_486184 ) ) ( not ( = ?auto_486180 ?auto_486185 ) ) ( not ( = ?auto_486180 ?auto_486186 ) ) ( not ( = ?auto_486180 ?auto_486187 ) ) ( not ( = ?auto_486180 ?auto_486188 ) ) ( not ( = ?auto_486180 ?auto_486189 ) ) ( not ( = ?auto_486181 ?auto_486182 ) ) ( not ( = ?auto_486181 ?auto_486183 ) ) ( not ( = ?auto_486181 ?auto_486184 ) ) ( not ( = ?auto_486181 ?auto_486185 ) ) ( not ( = ?auto_486181 ?auto_486186 ) ) ( not ( = ?auto_486181 ?auto_486187 ) ) ( not ( = ?auto_486181 ?auto_486188 ) ) ( not ( = ?auto_486181 ?auto_486189 ) ) ( not ( = ?auto_486182 ?auto_486183 ) ) ( not ( = ?auto_486182 ?auto_486184 ) ) ( not ( = ?auto_486182 ?auto_486185 ) ) ( not ( = ?auto_486182 ?auto_486186 ) ) ( not ( = ?auto_486182 ?auto_486187 ) ) ( not ( = ?auto_486182 ?auto_486188 ) ) ( not ( = ?auto_486182 ?auto_486189 ) ) ( not ( = ?auto_486183 ?auto_486184 ) ) ( not ( = ?auto_486183 ?auto_486185 ) ) ( not ( = ?auto_486183 ?auto_486186 ) ) ( not ( = ?auto_486183 ?auto_486187 ) ) ( not ( = ?auto_486183 ?auto_486188 ) ) ( not ( = ?auto_486183 ?auto_486189 ) ) ( not ( = ?auto_486184 ?auto_486185 ) ) ( not ( = ?auto_486184 ?auto_486186 ) ) ( not ( = ?auto_486184 ?auto_486187 ) ) ( not ( = ?auto_486184 ?auto_486188 ) ) ( not ( = ?auto_486184 ?auto_486189 ) ) ( not ( = ?auto_486185 ?auto_486186 ) ) ( not ( = ?auto_486185 ?auto_486187 ) ) ( not ( = ?auto_486185 ?auto_486188 ) ) ( not ( = ?auto_486185 ?auto_486189 ) ) ( not ( = ?auto_486186 ?auto_486187 ) ) ( not ( = ?auto_486186 ?auto_486188 ) ) ( not ( = ?auto_486186 ?auto_486189 ) ) ( not ( = ?auto_486187 ?auto_486188 ) ) ( not ( = ?auto_486187 ?auto_486189 ) ) ( not ( = ?auto_486188 ?auto_486189 ) ) ( ON ?auto_486187 ?auto_486188 ) ( ON ?auto_486186 ?auto_486187 ) ( ON ?auto_486185 ?auto_486186 ) ( ON ?auto_486184 ?auto_486185 ) ( CLEAR ?auto_486182 ) ( ON ?auto_486183 ?auto_486184 ) ( CLEAR ?auto_486183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_486177 ?auto_486178 ?auto_486179 ?auto_486180 ?auto_486181 ?auto_486182 ?auto_486183 )
      ( MAKE-12PILE ?auto_486177 ?auto_486178 ?auto_486179 ?auto_486180 ?auto_486181 ?auto_486182 ?auto_486183 ?auto_486184 ?auto_486185 ?auto_486186 ?auto_486187 ?auto_486188 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_486227 - BLOCK
      ?auto_486228 - BLOCK
      ?auto_486229 - BLOCK
      ?auto_486230 - BLOCK
      ?auto_486231 - BLOCK
      ?auto_486232 - BLOCK
      ?auto_486233 - BLOCK
      ?auto_486234 - BLOCK
      ?auto_486235 - BLOCK
      ?auto_486236 - BLOCK
      ?auto_486237 - BLOCK
      ?auto_486238 - BLOCK
    )
    :vars
    (
      ?auto_486239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486238 ?auto_486239 ) ( ON-TABLE ?auto_486227 ) ( ON ?auto_486228 ?auto_486227 ) ( ON ?auto_486229 ?auto_486228 ) ( ON ?auto_486230 ?auto_486229 ) ( ON ?auto_486231 ?auto_486230 ) ( not ( = ?auto_486227 ?auto_486228 ) ) ( not ( = ?auto_486227 ?auto_486229 ) ) ( not ( = ?auto_486227 ?auto_486230 ) ) ( not ( = ?auto_486227 ?auto_486231 ) ) ( not ( = ?auto_486227 ?auto_486232 ) ) ( not ( = ?auto_486227 ?auto_486233 ) ) ( not ( = ?auto_486227 ?auto_486234 ) ) ( not ( = ?auto_486227 ?auto_486235 ) ) ( not ( = ?auto_486227 ?auto_486236 ) ) ( not ( = ?auto_486227 ?auto_486237 ) ) ( not ( = ?auto_486227 ?auto_486238 ) ) ( not ( = ?auto_486227 ?auto_486239 ) ) ( not ( = ?auto_486228 ?auto_486229 ) ) ( not ( = ?auto_486228 ?auto_486230 ) ) ( not ( = ?auto_486228 ?auto_486231 ) ) ( not ( = ?auto_486228 ?auto_486232 ) ) ( not ( = ?auto_486228 ?auto_486233 ) ) ( not ( = ?auto_486228 ?auto_486234 ) ) ( not ( = ?auto_486228 ?auto_486235 ) ) ( not ( = ?auto_486228 ?auto_486236 ) ) ( not ( = ?auto_486228 ?auto_486237 ) ) ( not ( = ?auto_486228 ?auto_486238 ) ) ( not ( = ?auto_486228 ?auto_486239 ) ) ( not ( = ?auto_486229 ?auto_486230 ) ) ( not ( = ?auto_486229 ?auto_486231 ) ) ( not ( = ?auto_486229 ?auto_486232 ) ) ( not ( = ?auto_486229 ?auto_486233 ) ) ( not ( = ?auto_486229 ?auto_486234 ) ) ( not ( = ?auto_486229 ?auto_486235 ) ) ( not ( = ?auto_486229 ?auto_486236 ) ) ( not ( = ?auto_486229 ?auto_486237 ) ) ( not ( = ?auto_486229 ?auto_486238 ) ) ( not ( = ?auto_486229 ?auto_486239 ) ) ( not ( = ?auto_486230 ?auto_486231 ) ) ( not ( = ?auto_486230 ?auto_486232 ) ) ( not ( = ?auto_486230 ?auto_486233 ) ) ( not ( = ?auto_486230 ?auto_486234 ) ) ( not ( = ?auto_486230 ?auto_486235 ) ) ( not ( = ?auto_486230 ?auto_486236 ) ) ( not ( = ?auto_486230 ?auto_486237 ) ) ( not ( = ?auto_486230 ?auto_486238 ) ) ( not ( = ?auto_486230 ?auto_486239 ) ) ( not ( = ?auto_486231 ?auto_486232 ) ) ( not ( = ?auto_486231 ?auto_486233 ) ) ( not ( = ?auto_486231 ?auto_486234 ) ) ( not ( = ?auto_486231 ?auto_486235 ) ) ( not ( = ?auto_486231 ?auto_486236 ) ) ( not ( = ?auto_486231 ?auto_486237 ) ) ( not ( = ?auto_486231 ?auto_486238 ) ) ( not ( = ?auto_486231 ?auto_486239 ) ) ( not ( = ?auto_486232 ?auto_486233 ) ) ( not ( = ?auto_486232 ?auto_486234 ) ) ( not ( = ?auto_486232 ?auto_486235 ) ) ( not ( = ?auto_486232 ?auto_486236 ) ) ( not ( = ?auto_486232 ?auto_486237 ) ) ( not ( = ?auto_486232 ?auto_486238 ) ) ( not ( = ?auto_486232 ?auto_486239 ) ) ( not ( = ?auto_486233 ?auto_486234 ) ) ( not ( = ?auto_486233 ?auto_486235 ) ) ( not ( = ?auto_486233 ?auto_486236 ) ) ( not ( = ?auto_486233 ?auto_486237 ) ) ( not ( = ?auto_486233 ?auto_486238 ) ) ( not ( = ?auto_486233 ?auto_486239 ) ) ( not ( = ?auto_486234 ?auto_486235 ) ) ( not ( = ?auto_486234 ?auto_486236 ) ) ( not ( = ?auto_486234 ?auto_486237 ) ) ( not ( = ?auto_486234 ?auto_486238 ) ) ( not ( = ?auto_486234 ?auto_486239 ) ) ( not ( = ?auto_486235 ?auto_486236 ) ) ( not ( = ?auto_486235 ?auto_486237 ) ) ( not ( = ?auto_486235 ?auto_486238 ) ) ( not ( = ?auto_486235 ?auto_486239 ) ) ( not ( = ?auto_486236 ?auto_486237 ) ) ( not ( = ?auto_486236 ?auto_486238 ) ) ( not ( = ?auto_486236 ?auto_486239 ) ) ( not ( = ?auto_486237 ?auto_486238 ) ) ( not ( = ?auto_486237 ?auto_486239 ) ) ( not ( = ?auto_486238 ?auto_486239 ) ) ( ON ?auto_486237 ?auto_486238 ) ( ON ?auto_486236 ?auto_486237 ) ( ON ?auto_486235 ?auto_486236 ) ( ON ?auto_486234 ?auto_486235 ) ( ON ?auto_486233 ?auto_486234 ) ( CLEAR ?auto_486231 ) ( ON ?auto_486232 ?auto_486233 ) ( CLEAR ?auto_486232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_486227 ?auto_486228 ?auto_486229 ?auto_486230 ?auto_486231 ?auto_486232 )
      ( MAKE-12PILE ?auto_486227 ?auto_486228 ?auto_486229 ?auto_486230 ?auto_486231 ?auto_486232 ?auto_486233 ?auto_486234 ?auto_486235 ?auto_486236 ?auto_486237 ?auto_486238 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_486277 - BLOCK
      ?auto_486278 - BLOCK
      ?auto_486279 - BLOCK
      ?auto_486280 - BLOCK
      ?auto_486281 - BLOCK
      ?auto_486282 - BLOCK
      ?auto_486283 - BLOCK
      ?auto_486284 - BLOCK
      ?auto_486285 - BLOCK
      ?auto_486286 - BLOCK
      ?auto_486287 - BLOCK
      ?auto_486288 - BLOCK
    )
    :vars
    (
      ?auto_486289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486288 ?auto_486289 ) ( ON-TABLE ?auto_486277 ) ( ON ?auto_486278 ?auto_486277 ) ( ON ?auto_486279 ?auto_486278 ) ( ON ?auto_486280 ?auto_486279 ) ( not ( = ?auto_486277 ?auto_486278 ) ) ( not ( = ?auto_486277 ?auto_486279 ) ) ( not ( = ?auto_486277 ?auto_486280 ) ) ( not ( = ?auto_486277 ?auto_486281 ) ) ( not ( = ?auto_486277 ?auto_486282 ) ) ( not ( = ?auto_486277 ?auto_486283 ) ) ( not ( = ?auto_486277 ?auto_486284 ) ) ( not ( = ?auto_486277 ?auto_486285 ) ) ( not ( = ?auto_486277 ?auto_486286 ) ) ( not ( = ?auto_486277 ?auto_486287 ) ) ( not ( = ?auto_486277 ?auto_486288 ) ) ( not ( = ?auto_486277 ?auto_486289 ) ) ( not ( = ?auto_486278 ?auto_486279 ) ) ( not ( = ?auto_486278 ?auto_486280 ) ) ( not ( = ?auto_486278 ?auto_486281 ) ) ( not ( = ?auto_486278 ?auto_486282 ) ) ( not ( = ?auto_486278 ?auto_486283 ) ) ( not ( = ?auto_486278 ?auto_486284 ) ) ( not ( = ?auto_486278 ?auto_486285 ) ) ( not ( = ?auto_486278 ?auto_486286 ) ) ( not ( = ?auto_486278 ?auto_486287 ) ) ( not ( = ?auto_486278 ?auto_486288 ) ) ( not ( = ?auto_486278 ?auto_486289 ) ) ( not ( = ?auto_486279 ?auto_486280 ) ) ( not ( = ?auto_486279 ?auto_486281 ) ) ( not ( = ?auto_486279 ?auto_486282 ) ) ( not ( = ?auto_486279 ?auto_486283 ) ) ( not ( = ?auto_486279 ?auto_486284 ) ) ( not ( = ?auto_486279 ?auto_486285 ) ) ( not ( = ?auto_486279 ?auto_486286 ) ) ( not ( = ?auto_486279 ?auto_486287 ) ) ( not ( = ?auto_486279 ?auto_486288 ) ) ( not ( = ?auto_486279 ?auto_486289 ) ) ( not ( = ?auto_486280 ?auto_486281 ) ) ( not ( = ?auto_486280 ?auto_486282 ) ) ( not ( = ?auto_486280 ?auto_486283 ) ) ( not ( = ?auto_486280 ?auto_486284 ) ) ( not ( = ?auto_486280 ?auto_486285 ) ) ( not ( = ?auto_486280 ?auto_486286 ) ) ( not ( = ?auto_486280 ?auto_486287 ) ) ( not ( = ?auto_486280 ?auto_486288 ) ) ( not ( = ?auto_486280 ?auto_486289 ) ) ( not ( = ?auto_486281 ?auto_486282 ) ) ( not ( = ?auto_486281 ?auto_486283 ) ) ( not ( = ?auto_486281 ?auto_486284 ) ) ( not ( = ?auto_486281 ?auto_486285 ) ) ( not ( = ?auto_486281 ?auto_486286 ) ) ( not ( = ?auto_486281 ?auto_486287 ) ) ( not ( = ?auto_486281 ?auto_486288 ) ) ( not ( = ?auto_486281 ?auto_486289 ) ) ( not ( = ?auto_486282 ?auto_486283 ) ) ( not ( = ?auto_486282 ?auto_486284 ) ) ( not ( = ?auto_486282 ?auto_486285 ) ) ( not ( = ?auto_486282 ?auto_486286 ) ) ( not ( = ?auto_486282 ?auto_486287 ) ) ( not ( = ?auto_486282 ?auto_486288 ) ) ( not ( = ?auto_486282 ?auto_486289 ) ) ( not ( = ?auto_486283 ?auto_486284 ) ) ( not ( = ?auto_486283 ?auto_486285 ) ) ( not ( = ?auto_486283 ?auto_486286 ) ) ( not ( = ?auto_486283 ?auto_486287 ) ) ( not ( = ?auto_486283 ?auto_486288 ) ) ( not ( = ?auto_486283 ?auto_486289 ) ) ( not ( = ?auto_486284 ?auto_486285 ) ) ( not ( = ?auto_486284 ?auto_486286 ) ) ( not ( = ?auto_486284 ?auto_486287 ) ) ( not ( = ?auto_486284 ?auto_486288 ) ) ( not ( = ?auto_486284 ?auto_486289 ) ) ( not ( = ?auto_486285 ?auto_486286 ) ) ( not ( = ?auto_486285 ?auto_486287 ) ) ( not ( = ?auto_486285 ?auto_486288 ) ) ( not ( = ?auto_486285 ?auto_486289 ) ) ( not ( = ?auto_486286 ?auto_486287 ) ) ( not ( = ?auto_486286 ?auto_486288 ) ) ( not ( = ?auto_486286 ?auto_486289 ) ) ( not ( = ?auto_486287 ?auto_486288 ) ) ( not ( = ?auto_486287 ?auto_486289 ) ) ( not ( = ?auto_486288 ?auto_486289 ) ) ( ON ?auto_486287 ?auto_486288 ) ( ON ?auto_486286 ?auto_486287 ) ( ON ?auto_486285 ?auto_486286 ) ( ON ?auto_486284 ?auto_486285 ) ( ON ?auto_486283 ?auto_486284 ) ( ON ?auto_486282 ?auto_486283 ) ( CLEAR ?auto_486280 ) ( ON ?auto_486281 ?auto_486282 ) ( CLEAR ?auto_486281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_486277 ?auto_486278 ?auto_486279 ?auto_486280 ?auto_486281 )
      ( MAKE-12PILE ?auto_486277 ?auto_486278 ?auto_486279 ?auto_486280 ?auto_486281 ?auto_486282 ?auto_486283 ?auto_486284 ?auto_486285 ?auto_486286 ?auto_486287 ?auto_486288 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_486327 - BLOCK
      ?auto_486328 - BLOCK
      ?auto_486329 - BLOCK
      ?auto_486330 - BLOCK
      ?auto_486331 - BLOCK
      ?auto_486332 - BLOCK
      ?auto_486333 - BLOCK
      ?auto_486334 - BLOCK
      ?auto_486335 - BLOCK
      ?auto_486336 - BLOCK
      ?auto_486337 - BLOCK
      ?auto_486338 - BLOCK
    )
    :vars
    (
      ?auto_486339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486338 ?auto_486339 ) ( ON-TABLE ?auto_486327 ) ( ON ?auto_486328 ?auto_486327 ) ( ON ?auto_486329 ?auto_486328 ) ( not ( = ?auto_486327 ?auto_486328 ) ) ( not ( = ?auto_486327 ?auto_486329 ) ) ( not ( = ?auto_486327 ?auto_486330 ) ) ( not ( = ?auto_486327 ?auto_486331 ) ) ( not ( = ?auto_486327 ?auto_486332 ) ) ( not ( = ?auto_486327 ?auto_486333 ) ) ( not ( = ?auto_486327 ?auto_486334 ) ) ( not ( = ?auto_486327 ?auto_486335 ) ) ( not ( = ?auto_486327 ?auto_486336 ) ) ( not ( = ?auto_486327 ?auto_486337 ) ) ( not ( = ?auto_486327 ?auto_486338 ) ) ( not ( = ?auto_486327 ?auto_486339 ) ) ( not ( = ?auto_486328 ?auto_486329 ) ) ( not ( = ?auto_486328 ?auto_486330 ) ) ( not ( = ?auto_486328 ?auto_486331 ) ) ( not ( = ?auto_486328 ?auto_486332 ) ) ( not ( = ?auto_486328 ?auto_486333 ) ) ( not ( = ?auto_486328 ?auto_486334 ) ) ( not ( = ?auto_486328 ?auto_486335 ) ) ( not ( = ?auto_486328 ?auto_486336 ) ) ( not ( = ?auto_486328 ?auto_486337 ) ) ( not ( = ?auto_486328 ?auto_486338 ) ) ( not ( = ?auto_486328 ?auto_486339 ) ) ( not ( = ?auto_486329 ?auto_486330 ) ) ( not ( = ?auto_486329 ?auto_486331 ) ) ( not ( = ?auto_486329 ?auto_486332 ) ) ( not ( = ?auto_486329 ?auto_486333 ) ) ( not ( = ?auto_486329 ?auto_486334 ) ) ( not ( = ?auto_486329 ?auto_486335 ) ) ( not ( = ?auto_486329 ?auto_486336 ) ) ( not ( = ?auto_486329 ?auto_486337 ) ) ( not ( = ?auto_486329 ?auto_486338 ) ) ( not ( = ?auto_486329 ?auto_486339 ) ) ( not ( = ?auto_486330 ?auto_486331 ) ) ( not ( = ?auto_486330 ?auto_486332 ) ) ( not ( = ?auto_486330 ?auto_486333 ) ) ( not ( = ?auto_486330 ?auto_486334 ) ) ( not ( = ?auto_486330 ?auto_486335 ) ) ( not ( = ?auto_486330 ?auto_486336 ) ) ( not ( = ?auto_486330 ?auto_486337 ) ) ( not ( = ?auto_486330 ?auto_486338 ) ) ( not ( = ?auto_486330 ?auto_486339 ) ) ( not ( = ?auto_486331 ?auto_486332 ) ) ( not ( = ?auto_486331 ?auto_486333 ) ) ( not ( = ?auto_486331 ?auto_486334 ) ) ( not ( = ?auto_486331 ?auto_486335 ) ) ( not ( = ?auto_486331 ?auto_486336 ) ) ( not ( = ?auto_486331 ?auto_486337 ) ) ( not ( = ?auto_486331 ?auto_486338 ) ) ( not ( = ?auto_486331 ?auto_486339 ) ) ( not ( = ?auto_486332 ?auto_486333 ) ) ( not ( = ?auto_486332 ?auto_486334 ) ) ( not ( = ?auto_486332 ?auto_486335 ) ) ( not ( = ?auto_486332 ?auto_486336 ) ) ( not ( = ?auto_486332 ?auto_486337 ) ) ( not ( = ?auto_486332 ?auto_486338 ) ) ( not ( = ?auto_486332 ?auto_486339 ) ) ( not ( = ?auto_486333 ?auto_486334 ) ) ( not ( = ?auto_486333 ?auto_486335 ) ) ( not ( = ?auto_486333 ?auto_486336 ) ) ( not ( = ?auto_486333 ?auto_486337 ) ) ( not ( = ?auto_486333 ?auto_486338 ) ) ( not ( = ?auto_486333 ?auto_486339 ) ) ( not ( = ?auto_486334 ?auto_486335 ) ) ( not ( = ?auto_486334 ?auto_486336 ) ) ( not ( = ?auto_486334 ?auto_486337 ) ) ( not ( = ?auto_486334 ?auto_486338 ) ) ( not ( = ?auto_486334 ?auto_486339 ) ) ( not ( = ?auto_486335 ?auto_486336 ) ) ( not ( = ?auto_486335 ?auto_486337 ) ) ( not ( = ?auto_486335 ?auto_486338 ) ) ( not ( = ?auto_486335 ?auto_486339 ) ) ( not ( = ?auto_486336 ?auto_486337 ) ) ( not ( = ?auto_486336 ?auto_486338 ) ) ( not ( = ?auto_486336 ?auto_486339 ) ) ( not ( = ?auto_486337 ?auto_486338 ) ) ( not ( = ?auto_486337 ?auto_486339 ) ) ( not ( = ?auto_486338 ?auto_486339 ) ) ( ON ?auto_486337 ?auto_486338 ) ( ON ?auto_486336 ?auto_486337 ) ( ON ?auto_486335 ?auto_486336 ) ( ON ?auto_486334 ?auto_486335 ) ( ON ?auto_486333 ?auto_486334 ) ( ON ?auto_486332 ?auto_486333 ) ( ON ?auto_486331 ?auto_486332 ) ( CLEAR ?auto_486329 ) ( ON ?auto_486330 ?auto_486331 ) ( CLEAR ?auto_486330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_486327 ?auto_486328 ?auto_486329 ?auto_486330 )
      ( MAKE-12PILE ?auto_486327 ?auto_486328 ?auto_486329 ?auto_486330 ?auto_486331 ?auto_486332 ?auto_486333 ?auto_486334 ?auto_486335 ?auto_486336 ?auto_486337 ?auto_486338 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_486377 - BLOCK
      ?auto_486378 - BLOCK
      ?auto_486379 - BLOCK
      ?auto_486380 - BLOCK
      ?auto_486381 - BLOCK
      ?auto_486382 - BLOCK
      ?auto_486383 - BLOCK
      ?auto_486384 - BLOCK
      ?auto_486385 - BLOCK
      ?auto_486386 - BLOCK
      ?auto_486387 - BLOCK
      ?auto_486388 - BLOCK
    )
    :vars
    (
      ?auto_486389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486388 ?auto_486389 ) ( ON-TABLE ?auto_486377 ) ( ON ?auto_486378 ?auto_486377 ) ( not ( = ?auto_486377 ?auto_486378 ) ) ( not ( = ?auto_486377 ?auto_486379 ) ) ( not ( = ?auto_486377 ?auto_486380 ) ) ( not ( = ?auto_486377 ?auto_486381 ) ) ( not ( = ?auto_486377 ?auto_486382 ) ) ( not ( = ?auto_486377 ?auto_486383 ) ) ( not ( = ?auto_486377 ?auto_486384 ) ) ( not ( = ?auto_486377 ?auto_486385 ) ) ( not ( = ?auto_486377 ?auto_486386 ) ) ( not ( = ?auto_486377 ?auto_486387 ) ) ( not ( = ?auto_486377 ?auto_486388 ) ) ( not ( = ?auto_486377 ?auto_486389 ) ) ( not ( = ?auto_486378 ?auto_486379 ) ) ( not ( = ?auto_486378 ?auto_486380 ) ) ( not ( = ?auto_486378 ?auto_486381 ) ) ( not ( = ?auto_486378 ?auto_486382 ) ) ( not ( = ?auto_486378 ?auto_486383 ) ) ( not ( = ?auto_486378 ?auto_486384 ) ) ( not ( = ?auto_486378 ?auto_486385 ) ) ( not ( = ?auto_486378 ?auto_486386 ) ) ( not ( = ?auto_486378 ?auto_486387 ) ) ( not ( = ?auto_486378 ?auto_486388 ) ) ( not ( = ?auto_486378 ?auto_486389 ) ) ( not ( = ?auto_486379 ?auto_486380 ) ) ( not ( = ?auto_486379 ?auto_486381 ) ) ( not ( = ?auto_486379 ?auto_486382 ) ) ( not ( = ?auto_486379 ?auto_486383 ) ) ( not ( = ?auto_486379 ?auto_486384 ) ) ( not ( = ?auto_486379 ?auto_486385 ) ) ( not ( = ?auto_486379 ?auto_486386 ) ) ( not ( = ?auto_486379 ?auto_486387 ) ) ( not ( = ?auto_486379 ?auto_486388 ) ) ( not ( = ?auto_486379 ?auto_486389 ) ) ( not ( = ?auto_486380 ?auto_486381 ) ) ( not ( = ?auto_486380 ?auto_486382 ) ) ( not ( = ?auto_486380 ?auto_486383 ) ) ( not ( = ?auto_486380 ?auto_486384 ) ) ( not ( = ?auto_486380 ?auto_486385 ) ) ( not ( = ?auto_486380 ?auto_486386 ) ) ( not ( = ?auto_486380 ?auto_486387 ) ) ( not ( = ?auto_486380 ?auto_486388 ) ) ( not ( = ?auto_486380 ?auto_486389 ) ) ( not ( = ?auto_486381 ?auto_486382 ) ) ( not ( = ?auto_486381 ?auto_486383 ) ) ( not ( = ?auto_486381 ?auto_486384 ) ) ( not ( = ?auto_486381 ?auto_486385 ) ) ( not ( = ?auto_486381 ?auto_486386 ) ) ( not ( = ?auto_486381 ?auto_486387 ) ) ( not ( = ?auto_486381 ?auto_486388 ) ) ( not ( = ?auto_486381 ?auto_486389 ) ) ( not ( = ?auto_486382 ?auto_486383 ) ) ( not ( = ?auto_486382 ?auto_486384 ) ) ( not ( = ?auto_486382 ?auto_486385 ) ) ( not ( = ?auto_486382 ?auto_486386 ) ) ( not ( = ?auto_486382 ?auto_486387 ) ) ( not ( = ?auto_486382 ?auto_486388 ) ) ( not ( = ?auto_486382 ?auto_486389 ) ) ( not ( = ?auto_486383 ?auto_486384 ) ) ( not ( = ?auto_486383 ?auto_486385 ) ) ( not ( = ?auto_486383 ?auto_486386 ) ) ( not ( = ?auto_486383 ?auto_486387 ) ) ( not ( = ?auto_486383 ?auto_486388 ) ) ( not ( = ?auto_486383 ?auto_486389 ) ) ( not ( = ?auto_486384 ?auto_486385 ) ) ( not ( = ?auto_486384 ?auto_486386 ) ) ( not ( = ?auto_486384 ?auto_486387 ) ) ( not ( = ?auto_486384 ?auto_486388 ) ) ( not ( = ?auto_486384 ?auto_486389 ) ) ( not ( = ?auto_486385 ?auto_486386 ) ) ( not ( = ?auto_486385 ?auto_486387 ) ) ( not ( = ?auto_486385 ?auto_486388 ) ) ( not ( = ?auto_486385 ?auto_486389 ) ) ( not ( = ?auto_486386 ?auto_486387 ) ) ( not ( = ?auto_486386 ?auto_486388 ) ) ( not ( = ?auto_486386 ?auto_486389 ) ) ( not ( = ?auto_486387 ?auto_486388 ) ) ( not ( = ?auto_486387 ?auto_486389 ) ) ( not ( = ?auto_486388 ?auto_486389 ) ) ( ON ?auto_486387 ?auto_486388 ) ( ON ?auto_486386 ?auto_486387 ) ( ON ?auto_486385 ?auto_486386 ) ( ON ?auto_486384 ?auto_486385 ) ( ON ?auto_486383 ?auto_486384 ) ( ON ?auto_486382 ?auto_486383 ) ( ON ?auto_486381 ?auto_486382 ) ( ON ?auto_486380 ?auto_486381 ) ( CLEAR ?auto_486378 ) ( ON ?auto_486379 ?auto_486380 ) ( CLEAR ?auto_486379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_486377 ?auto_486378 ?auto_486379 )
      ( MAKE-12PILE ?auto_486377 ?auto_486378 ?auto_486379 ?auto_486380 ?auto_486381 ?auto_486382 ?auto_486383 ?auto_486384 ?auto_486385 ?auto_486386 ?auto_486387 ?auto_486388 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_486427 - BLOCK
      ?auto_486428 - BLOCK
      ?auto_486429 - BLOCK
      ?auto_486430 - BLOCK
      ?auto_486431 - BLOCK
      ?auto_486432 - BLOCK
      ?auto_486433 - BLOCK
      ?auto_486434 - BLOCK
      ?auto_486435 - BLOCK
      ?auto_486436 - BLOCK
      ?auto_486437 - BLOCK
      ?auto_486438 - BLOCK
    )
    :vars
    (
      ?auto_486439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486438 ?auto_486439 ) ( ON-TABLE ?auto_486427 ) ( not ( = ?auto_486427 ?auto_486428 ) ) ( not ( = ?auto_486427 ?auto_486429 ) ) ( not ( = ?auto_486427 ?auto_486430 ) ) ( not ( = ?auto_486427 ?auto_486431 ) ) ( not ( = ?auto_486427 ?auto_486432 ) ) ( not ( = ?auto_486427 ?auto_486433 ) ) ( not ( = ?auto_486427 ?auto_486434 ) ) ( not ( = ?auto_486427 ?auto_486435 ) ) ( not ( = ?auto_486427 ?auto_486436 ) ) ( not ( = ?auto_486427 ?auto_486437 ) ) ( not ( = ?auto_486427 ?auto_486438 ) ) ( not ( = ?auto_486427 ?auto_486439 ) ) ( not ( = ?auto_486428 ?auto_486429 ) ) ( not ( = ?auto_486428 ?auto_486430 ) ) ( not ( = ?auto_486428 ?auto_486431 ) ) ( not ( = ?auto_486428 ?auto_486432 ) ) ( not ( = ?auto_486428 ?auto_486433 ) ) ( not ( = ?auto_486428 ?auto_486434 ) ) ( not ( = ?auto_486428 ?auto_486435 ) ) ( not ( = ?auto_486428 ?auto_486436 ) ) ( not ( = ?auto_486428 ?auto_486437 ) ) ( not ( = ?auto_486428 ?auto_486438 ) ) ( not ( = ?auto_486428 ?auto_486439 ) ) ( not ( = ?auto_486429 ?auto_486430 ) ) ( not ( = ?auto_486429 ?auto_486431 ) ) ( not ( = ?auto_486429 ?auto_486432 ) ) ( not ( = ?auto_486429 ?auto_486433 ) ) ( not ( = ?auto_486429 ?auto_486434 ) ) ( not ( = ?auto_486429 ?auto_486435 ) ) ( not ( = ?auto_486429 ?auto_486436 ) ) ( not ( = ?auto_486429 ?auto_486437 ) ) ( not ( = ?auto_486429 ?auto_486438 ) ) ( not ( = ?auto_486429 ?auto_486439 ) ) ( not ( = ?auto_486430 ?auto_486431 ) ) ( not ( = ?auto_486430 ?auto_486432 ) ) ( not ( = ?auto_486430 ?auto_486433 ) ) ( not ( = ?auto_486430 ?auto_486434 ) ) ( not ( = ?auto_486430 ?auto_486435 ) ) ( not ( = ?auto_486430 ?auto_486436 ) ) ( not ( = ?auto_486430 ?auto_486437 ) ) ( not ( = ?auto_486430 ?auto_486438 ) ) ( not ( = ?auto_486430 ?auto_486439 ) ) ( not ( = ?auto_486431 ?auto_486432 ) ) ( not ( = ?auto_486431 ?auto_486433 ) ) ( not ( = ?auto_486431 ?auto_486434 ) ) ( not ( = ?auto_486431 ?auto_486435 ) ) ( not ( = ?auto_486431 ?auto_486436 ) ) ( not ( = ?auto_486431 ?auto_486437 ) ) ( not ( = ?auto_486431 ?auto_486438 ) ) ( not ( = ?auto_486431 ?auto_486439 ) ) ( not ( = ?auto_486432 ?auto_486433 ) ) ( not ( = ?auto_486432 ?auto_486434 ) ) ( not ( = ?auto_486432 ?auto_486435 ) ) ( not ( = ?auto_486432 ?auto_486436 ) ) ( not ( = ?auto_486432 ?auto_486437 ) ) ( not ( = ?auto_486432 ?auto_486438 ) ) ( not ( = ?auto_486432 ?auto_486439 ) ) ( not ( = ?auto_486433 ?auto_486434 ) ) ( not ( = ?auto_486433 ?auto_486435 ) ) ( not ( = ?auto_486433 ?auto_486436 ) ) ( not ( = ?auto_486433 ?auto_486437 ) ) ( not ( = ?auto_486433 ?auto_486438 ) ) ( not ( = ?auto_486433 ?auto_486439 ) ) ( not ( = ?auto_486434 ?auto_486435 ) ) ( not ( = ?auto_486434 ?auto_486436 ) ) ( not ( = ?auto_486434 ?auto_486437 ) ) ( not ( = ?auto_486434 ?auto_486438 ) ) ( not ( = ?auto_486434 ?auto_486439 ) ) ( not ( = ?auto_486435 ?auto_486436 ) ) ( not ( = ?auto_486435 ?auto_486437 ) ) ( not ( = ?auto_486435 ?auto_486438 ) ) ( not ( = ?auto_486435 ?auto_486439 ) ) ( not ( = ?auto_486436 ?auto_486437 ) ) ( not ( = ?auto_486436 ?auto_486438 ) ) ( not ( = ?auto_486436 ?auto_486439 ) ) ( not ( = ?auto_486437 ?auto_486438 ) ) ( not ( = ?auto_486437 ?auto_486439 ) ) ( not ( = ?auto_486438 ?auto_486439 ) ) ( ON ?auto_486437 ?auto_486438 ) ( ON ?auto_486436 ?auto_486437 ) ( ON ?auto_486435 ?auto_486436 ) ( ON ?auto_486434 ?auto_486435 ) ( ON ?auto_486433 ?auto_486434 ) ( ON ?auto_486432 ?auto_486433 ) ( ON ?auto_486431 ?auto_486432 ) ( ON ?auto_486430 ?auto_486431 ) ( ON ?auto_486429 ?auto_486430 ) ( CLEAR ?auto_486427 ) ( ON ?auto_486428 ?auto_486429 ) ( CLEAR ?auto_486428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_486427 ?auto_486428 )
      ( MAKE-12PILE ?auto_486427 ?auto_486428 ?auto_486429 ?auto_486430 ?auto_486431 ?auto_486432 ?auto_486433 ?auto_486434 ?auto_486435 ?auto_486436 ?auto_486437 ?auto_486438 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_486477 - BLOCK
      ?auto_486478 - BLOCK
      ?auto_486479 - BLOCK
      ?auto_486480 - BLOCK
      ?auto_486481 - BLOCK
      ?auto_486482 - BLOCK
      ?auto_486483 - BLOCK
      ?auto_486484 - BLOCK
      ?auto_486485 - BLOCK
      ?auto_486486 - BLOCK
      ?auto_486487 - BLOCK
      ?auto_486488 - BLOCK
    )
    :vars
    (
      ?auto_486489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486488 ?auto_486489 ) ( not ( = ?auto_486477 ?auto_486478 ) ) ( not ( = ?auto_486477 ?auto_486479 ) ) ( not ( = ?auto_486477 ?auto_486480 ) ) ( not ( = ?auto_486477 ?auto_486481 ) ) ( not ( = ?auto_486477 ?auto_486482 ) ) ( not ( = ?auto_486477 ?auto_486483 ) ) ( not ( = ?auto_486477 ?auto_486484 ) ) ( not ( = ?auto_486477 ?auto_486485 ) ) ( not ( = ?auto_486477 ?auto_486486 ) ) ( not ( = ?auto_486477 ?auto_486487 ) ) ( not ( = ?auto_486477 ?auto_486488 ) ) ( not ( = ?auto_486477 ?auto_486489 ) ) ( not ( = ?auto_486478 ?auto_486479 ) ) ( not ( = ?auto_486478 ?auto_486480 ) ) ( not ( = ?auto_486478 ?auto_486481 ) ) ( not ( = ?auto_486478 ?auto_486482 ) ) ( not ( = ?auto_486478 ?auto_486483 ) ) ( not ( = ?auto_486478 ?auto_486484 ) ) ( not ( = ?auto_486478 ?auto_486485 ) ) ( not ( = ?auto_486478 ?auto_486486 ) ) ( not ( = ?auto_486478 ?auto_486487 ) ) ( not ( = ?auto_486478 ?auto_486488 ) ) ( not ( = ?auto_486478 ?auto_486489 ) ) ( not ( = ?auto_486479 ?auto_486480 ) ) ( not ( = ?auto_486479 ?auto_486481 ) ) ( not ( = ?auto_486479 ?auto_486482 ) ) ( not ( = ?auto_486479 ?auto_486483 ) ) ( not ( = ?auto_486479 ?auto_486484 ) ) ( not ( = ?auto_486479 ?auto_486485 ) ) ( not ( = ?auto_486479 ?auto_486486 ) ) ( not ( = ?auto_486479 ?auto_486487 ) ) ( not ( = ?auto_486479 ?auto_486488 ) ) ( not ( = ?auto_486479 ?auto_486489 ) ) ( not ( = ?auto_486480 ?auto_486481 ) ) ( not ( = ?auto_486480 ?auto_486482 ) ) ( not ( = ?auto_486480 ?auto_486483 ) ) ( not ( = ?auto_486480 ?auto_486484 ) ) ( not ( = ?auto_486480 ?auto_486485 ) ) ( not ( = ?auto_486480 ?auto_486486 ) ) ( not ( = ?auto_486480 ?auto_486487 ) ) ( not ( = ?auto_486480 ?auto_486488 ) ) ( not ( = ?auto_486480 ?auto_486489 ) ) ( not ( = ?auto_486481 ?auto_486482 ) ) ( not ( = ?auto_486481 ?auto_486483 ) ) ( not ( = ?auto_486481 ?auto_486484 ) ) ( not ( = ?auto_486481 ?auto_486485 ) ) ( not ( = ?auto_486481 ?auto_486486 ) ) ( not ( = ?auto_486481 ?auto_486487 ) ) ( not ( = ?auto_486481 ?auto_486488 ) ) ( not ( = ?auto_486481 ?auto_486489 ) ) ( not ( = ?auto_486482 ?auto_486483 ) ) ( not ( = ?auto_486482 ?auto_486484 ) ) ( not ( = ?auto_486482 ?auto_486485 ) ) ( not ( = ?auto_486482 ?auto_486486 ) ) ( not ( = ?auto_486482 ?auto_486487 ) ) ( not ( = ?auto_486482 ?auto_486488 ) ) ( not ( = ?auto_486482 ?auto_486489 ) ) ( not ( = ?auto_486483 ?auto_486484 ) ) ( not ( = ?auto_486483 ?auto_486485 ) ) ( not ( = ?auto_486483 ?auto_486486 ) ) ( not ( = ?auto_486483 ?auto_486487 ) ) ( not ( = ?auto_486483 ?auto_486488 ) ) ( not ( = ?auto_486483 ?auto_486489 ) ) ( not ( = ?auto_486484 ?auto_486485 ) ) ( not ( = ?auto_486484 ?auto_486486 ) ) ( not ( = ?auto_486484 ?auto_486487 ) ) ( not ( = ?auto_486484 ?auto_486488 ) ) ( not ( = ?auto_486484 ?auto_486489 ) ) ( not ( = ?auto_486485 ?auto_486486 ) ) ( not ( = ?auto_486485 ?auto_486487 ) ) ( not ( = ?auto_486485 ?auto_486488 ) ) ( not ( = ?auto_486485 ?auto_486489 ) ) ( not ( = ?auto_486486 ?auto_486487 ) ) ( not ( = ?auto_486486 ?auto_486488 ) ) ( not ( = ?auto_486486 ?auto_486489 ) ) ( not ( = ?auto_486487 ?auto_486488 ) ) ( not ( = ?auto_486487 ?auto_486489 ) ) ( not ( = ?auto_486488 ?auto_486489 ) ) ( ON ?auto_486487 ?auto_486488 ) ( ON ?auto_486486 ?auto_486487 ) ( ON ?auto_486485 ?auto_486486 ) ( ON ?auto_486484 ?auto_486485 ) ( ON ?auto_486483 ?auto_486484 ) ( ON ?auto_486482 ?auto_486483 ) ( ON ?auto_486481 ?auto_486482 ) ( ON ?auto_486480 ?auto_486481 ) ( ON ?auto_486479 ?auto_486480 ) ( ON ?auto_486478 ?auto_486479 ) ( ON ?auto_486477 ?auto_486478 ) ( CLEAR ?auto_486477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_486477 )
      ( MAKE-12PILE ?auto_486477 ?auto_486478 ?auto_486479 ?auto_486480 ?auto_486481 ?auto_486482 ?auto_486483 ?auto_486484 ?auto_486485 ?auto_486486 ?auto_486487 ?auto_486488 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_486528 - BLOCK
      ?auto_486529 - BLOCK
      ?auto_486530 - BLOCK
      ?auto_486531 - BLOCK
      ?auto_486532 - BLOCK
      ?auto_486533 - BLOCK
      ?auto_486534 - BLOCK
      ?auto_486535 - BLOCK
      ?auto_486536 - BLOCK
      ?auto_486537 - BLOCK
      ?auto_486538 - BLOCK
      ?auto_486539 - BLOCK
      ?auto_486540 - BLOCK
    )
    :vars
    (
      ?auto_486541 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_486539 ) ( ON ?auto_486540 ?auto_486541 ) ( CLEAR ?auto_486540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_486528 ) ( ON ?auto_486529 ?auto_486528 ) ( ON ?auto_486530 ?auto_486529 ) ( ON ?auto_486531 ?auto_486530 ) ( ON ?auto_486532 ?auto_486531 ) ( ON ?auto_486533 ?auto_486532 ) ( ON ?auto_486534 ?auto_486533 ) ( ON ?auto_486535 ?auto_486534 ) ( ON ?auto_486536 ?auto_486535 ) ( ON ?auto_486537 ?auto_486536 ) ( ON ?auto_486538 ?auto_486537 ) ( ON ?auto_486539 ?auto_486538 ) ( not ( = ?auto_486528 ?auto_486529 ) ) ( not ( = ?auto_486528 ?auto_486530 ) ) ( not ( = ?auto_486528 ?auto_486531 ) ) ( not ( = ?auto_486528 ?auto_486532 ) ) ( not ( = ?auto_486528 ?auto_486533 ) ) ( not ( = ?auto_486528 ?auto_486534 ) ) ( not ( = ?auto_486528 ?auto_486535 ) ) ( not ( = ?auto_486528 ?auto_486536 ) ) ( not ( = ?auto_486528 ?auto_486537 ) ) ( not ( = ?auto_486528 ?auto_486538 ) ) ( not ( = ?auto_486528 ?auto_486539 ) ) ( not ( = ?auto_486528 ?auto_486540 ) ) ( not ( = ?auto_486528 ?auto_486541 ) ) ( not ( = ?auto_486529 ?auto_486530 ) ) ( not ( = ?auto_486529 ?auto_486531 ) ) ( not ( = ?auto_486529 ?auto_486532 ) ) ( not ( = ?auto_486529 ?auto_486533 ) ) ( not ( = ?auto_486529 ?auto_486534 ) ) ( not ( = ?auto_486529 ?auto_486535 ) ) ( not ( = ?auto_486529 ?auto_486536 ) ) ( not ( = ?auto_486529 ?auto_486537 ) ) ( not ( = ?auto_486529 ?auto_486538 ) ) ( not ( = ?auto_486529 ?auto_486539 ) ) ( not ( = ?auto_486529 ?auto_486540 ) ) ( not ( = ?auto_486529 ?auto_486541 ) ) ( not ( = ?auto_486530 ?auto_486531 ) ) ( not ( = ?auto_486530 ?auto_486532 ) ) ( not ( = ?auto_486530 ?auto_486533 ) ) ( not ( = ?auto_486530 ?auto_486534 ) ) ( not ( = ?auto_486530 ?auto_486535 ) ) ( not ( = ?auto_486530 ?auto_486536 ) ) ( not ( = ?auto_486530 ?auto_486537 ) ) ( not ( = ?auto_486530 ?auto_486538 ) ) ( not ( = ?auto_486530 ?auto_486539 ) ) ( not ( = ?auto_486530 ?auto_486540 ) ) ( not ( = ?auto_486530 ?auto_486541 ) ) ( not ( = ?auto_486531 ?auto_486532 ) ) ( not ( = ?auto_486531 ?auto_486533 ) ) ( not ( = ?auto_486531 ?auto_486534 ) ) ( not ( = ?auto_486531 ?auto_486535 ) ) ( not ( = ?auto_486531 ?auto_486536 ) ) ( not ( = ?auto_486531 ?auto_486537 ) ) ( not ( = ?auto_486531 ?auto_486538 ) ) ( not ( = ?auto_486531 ?auto_486539 ) ) ( not ( = ?auto_486531 ?auto_486540 ) ) ( not ( = ?auto_486531 ?auto_486541 ) ) ( not ( = ?auto_486532 ?auto_486533 ) ) ( not ( = ?auto_486532 ?auto_486534 ) ) ( not ( = ?auto_486532 ?auto_486535 ) ) ( not ( = ?auto_486532 ?auto_486536 ) ) ( not ( = ?auto_486532 ?auto_486537 ) ) ( not ( = ?auto_486532 ?auto_486538 ) ) ( not ( = ?auto_486532 ?auto_486539 ) ) ( not ( = ?auto_486532 ?auto_486540 ) ) ( not ( = ?auto_486532 ?auto_486541 ) ) ( not ( = ?auto_486533 ?auto_486534 ) ) ( not ( = ?auto_486533 ?auto_486535 ) ) ( not ( = ?auto_486533 ?auto_486536 ) ) ( not ( = ?auto_486533 ?auto_486537 ) ) ( not ( = ?auto_486533 ?auto_486538 ) ) ( not ( = ?auto_486533 ?auto_486539 ) ) ( not ( = ?auto_486533 ?auto_486540 ) ) ( not ( = ?auto_486533 ?auto_486541 ) ) ( not ( = ?auto_486534 ?auto_486535 ) ) ( not ( = ?auto_486534 ?auto_486536 ) ) ( not ( = ?auto_486534 ?auto_486537 ) ) ( not ( = ?auto_486534 ?auto_486538 ) ) ( not ( = ?auto_486534 ?auto_486539 ) ) ( not ( = ?auto_486534 ?auto_486540 ) ) ( not ( = ?auto_486534 ?auto_486541 ) ) ( not ( = ?auto_486535 ?auto_486536 ) ) ( not ( = ?auto_486535 ?auto_486537 ) ) ( not ( = ?auto_486535 ?auto_486538 ) ) ( not ( = ?auto_486535 ?auto_486539 ) ) ( not ( = ?auto_486535 ?auto_486540 ) ) ( not ( = ?auto_486535 ?auto_486541 ) ) ( not ( = ?auto_486536 ?auto_486537 ) ) ( not ( = ?auto_486536 ?auto_486538 ) ) ( not ( = ?auto_486536 ?auto_486539 ) ) ( not ( = ?auto_486536 ?auto_486540 ) ) ( not ( = ?auto_486536 ?auto_486541 ) ) ( not ( = ?auto_486537 ?auto_486538 ) ) ( not ( = ?auto_486537 ?auto_486539 ) ) ( not ( = ?auto_486537 ?auto_486540 ) ) ( not ( = ?auto_486537 ?auto_486541 ) ) ( not ( = ?auto_486538 ?auto_486539 ) ) ( not ( = ?auto_486538 ?auto_486540 ) ) ( not ( = ?auto_486538 ?auto_486541 ) ) ( not ( = ?auto_486539 ?auto_486540 ) ) ( not ( = ?auto_486539 ?auto_486541 ) ) ( not ( = ?auto_486540 ?auto_486541 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_486540 ?auto_486541 )
      ( !STACK ?auto_486540 ?auto_486539 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_486582 - BLOCK
      ?auto_486583 - BLOCK
      ?auto_486584 - BLOCK
      ?auto_486585 - BLOCK
      ?auto_486586 - BLOCK
      ?auto_486587 - BLOCK
      ?auto_486588 - BLOCK
      ?auto_486589 - BLOCK
      ?auto_486590 - BLOCK
      ?auto_486591 - BLOCK
      ?auto_486592 - BLOCK
      ?auto_486593 - BLOCK
      ?auto_486594 - BLOCK
    )
    :vars
    (
      ?auto_486595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486594 ?auto_486595 ) ( ON-TABLE ?auto_486582 ) ( ON ?auto_486583 ?auto_486582 ) ( ON ?auto_486584 ?auto_486583 ) ( ON ?auto_486585 ?auto_486584 ) ( ON ?auto_486586 ?auto_486585 ) ( ON ?auto_486587 ?auto_486586 ) ( ON ?auto_486588 ?auto_486587 ) ( ON ?auto_486589 ?auto_486588 ) ( ON ?auto_486590 ?auto_486589 ) ( ON ?auto_486591 ?auto_486590 ) ( ON ?auto_486592 ?auto_486591 ) ( not ( = ?auto_486582 ?auto_486583 ) ) ( not ( = ?auto_486582 ?auto_486584 ) ) ( not ( = ?auto_486582 ?auto_486585 ) ) ( not ( = ?auto_486582 ?auto_486586 ) ) ( not ( = ?auto_486582 ?auto_486587 ) ) ( not ( = ?auto_486582 ?auto_486588 ) ) ( not ( = ?auto_486582 ?auto_486589 ) ) ( not ( = ?auto_486582 ?auto_486590 ) ) ( not ( = ?auto_486582 ?auto_486591 ) ) ( not ( = ?auto_486582 ?auto_486592 ) ) ( not ( = ?auto_486582 ?auto_486593 ) ) ( not ( = ?auto_486582 ?auto_486594 ) ) ( not ( = ?auto_486582 ?auto_486595 ) ) ( not ( = ?auto_486583 ?auto_486584 ) ) ( not ( = ?auto_486583 ?auto_486585 ) ) ( not ( = ?auto_486583 ?auto_486586 ) ) ( not ( = ?auto_486583 ?auto_486587 ) ) ( not ( = ?auto_486583 ?auto_486588 ) ) ( not ( = ?auto_486583 ?auto_486589 ) ) ( not ( = ?auto_486583 ?auto_486590 ) ) ( not ( = ?auto_486583 ?auto_486591 ) ) ( not ( = ?auto_486583 ?auto_486592 ) ) ( not ( = ?auto_486583 ?auto_486593 ) ) ( not ( = ?auto_486583 ?auto_486594 ) ) ( not ( = ?auto_486583 ?auto_486595 ) ) ( not ( = ?auto_486584 ?auto_486585 ) ) ( not ( = ?auto_486584 ?auto_486586 ) ) ( not ( = ?auto_486584 ?auto_486587 ) ) ( not ( = ?auto_486584 ?auto_486588 ) ) ( not ( = ?auto_486584 ?auto_486589 ) ) ( not ( = ?auto_486584 ?auto_486590 ) ) ( not ( = ?auto_486584 ?auto_486591 ) ) ( not ( = ?auto_486584 ?auto_486592 ) ) ( not ( = ?auto_486584 ?auto_486593 ) ) ( not ( = ?auto_486584 ?auto_486594 ) ) ( not ( = ?auto_486584 ?auto_486595 ) ) ( not ( = ?auto_486585 ?auto_486586 ) ) ( not ( = ?auto_486585 ?auto_486587 ) ) ( not ( = ?auto_486585 ?auto_486588 ) ) ( not ( = ?auto_486585 ?auto_486589 ) ) ( not ( = ?auto_486585 ?auto_486590 ) ) ( not ( = ?auto_486585 ?auto_486591 ) ) ( not ( = ?auto_486585 ?auto_486592 ) ) ( not ( = ?auto_486585 ?auto_486593 ) ) ( not ( = ?auto_486585 ?auto_486594 ) ) ( not ( = ?auto_486585 ?auto_486595 ) ) ( not ( = ?auto_486586 ?auto_486587 ) ) ( not ( = ?auto_486586 ?auto_486588 ) ) ( not ( = ?auto_486586 ?auto_486589 ) ) ( not ( = ?auto_486586 ?auto_486590 ) ) ( not ( = ?auto_486586 ?auto_486591 ) ) ( not ( = ?auto_486586 ?auto_486592 ) ) ( not ( = ?auto_486586 ?auto_486593 ) ) ( not ( = ?auto_486586 ?auto_486594 ) ) ( not ( = ?auto_486586 ?auto_486595 ) ) ( not ( = ?auto_486587 ?auto_486588 ) ) ( not ( = ?auto_486587 ?auto_486589 ) ) ( not ( = ?auto_486587 ?auto_486590 ) ) ( not ( = ?auto_486587 ?auto_486591 ) ) ( not ( = ?auto_486587 ?auto_486592 ) ) ( not ( = ?auto_486587 ?auto_486593 ) ) ( not ( = ?auto_486587 ?auto_486594 ) ) ( not ( = ?auto_486587 ?auto_486595 ) ) ( not ( = ?auto_486588 ?auto_486589 ) ) ( not ( = ?auto_486588 ?auto_486590 ) ) ( not ( = ?auto_486588 ?auto_486591 ) ) ( not ( = ?auto_486588 ?auto_486592 ) ) ( not ( = ?auto_486588 ?auto_486593 ) ) ( not ( = ?auto_486588 ?auto_486594 ) ) ( not ( = ?auto_486588 ?auto_486595 ) ) ( not ( = ?auto_486589 ?auto_486590 ) ) ( not ( = ?auto_486589 ?auto_486591 ) ) ( not ( = ?auto_486589 ?auto_486592 ) ) ( not ( = ?auto_486589 ?auto_486593 ) ) ( not ( = ?auto_486589 ?auto_486594 ) ) ( not ( = ?auto_486589 ?auto_486595 ) ) ( not ( = ?auto_486590 ?auto_486591 ) ) ( not ( = ?auto_486590 ?auto_486592 ) ) ( not ( = ?auto_486590 ?auto_486593 ) ) ( not ( = ?auto_486590 ?auto_486594 ) ) ( not ( = ?auto_486590 ?auto_486595 ) ) ( not ( = ?auto_486591 ?auto_486592 ) ) ( not ( = ?auto_486591 ?auto_486593 ) ) ( not ( = ?auto_486591 ?auto_486594 ) ) ( not ( = ?auto_486591 ?auto_486595 ) ) ( not ( = ?auto_486592 ?auto_486593 ) ) ( not ( = ?auto_486592 ?auto_486594 ) ) ( not ( = ?auto_486592 ?auto_486595 ) ) ( not ( = ?auto_486593 ?auto_486594 ) ) ( not ( = ?auto_486593 ?auto_486595 ) ) ( not ( = ?auto_486594 ?auto_486595 ) ) ( CLEAR ?auto_486592 ) ( ON ?auto_486593 ?auto_486594 ) ( CLEAR ?auto_486593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_486582 ?auto_486583 ?auto_486584 ?auto_486585 ?auto_486586 ?auto_486587 ?auto_486588 ?auto_486589 ?auto_486590 ?auto_486591 ?auto_486592 ?auto_486593 )
      ( MAKE-13PILE ?auto_486582 ?auto_486583 ?auto_486584 ?auto_486585 ?auto_486586 ?auto_486587 ?auto_486588 ?auto_486589 ?auto_486590 ?auto_486591 ?auto_486592 ?auto_486593 ?auto_486594 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_486636 - BLOCK
      ?auto_486637 - BLOCK
      ?auto_486638 - BLOCK
      ?auto_486639 - BLOCK
      ?auto_486640 - BLOCK
      ?auto_486641 - BLOCK
      ?auto_486642 - BLOCK
      ?auto_486643 - BLOCK
      ?auto_486644 - BLOCK
      ?auto_486645 - BLOCK
      ?auto_486646 - BLOCK
      ?auto_486647 - BLOCK
      ?auto_486648 - BLOCK
    )
    :vars
    (
      ?auto_486649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486648 ?auto_486649 ) ( ON-TABLE ?auto_486636 ) ( ON ?auto_486637 ?auto_486636 ) ( ON ?auto_486638 ?auto_486637 ) ( ON ?auto_486639 ?auto_486638 ) ( ON ?auto_486640 ?auto_486639 ) ( ON ?auto_486641 ?auto_486640 ) ( ON ?auto_486642 ?auto_486641 ) ( ON ?auto_486643 ?auto_486642 ) ( ON ?auto_486644 ?auto_486643 ) ( ON ?auto_486645 ?auto_486644 ) ( not ( = ?auto_486636 ?auto_486637 ) ) ( not ( = ?auto_486636 ?auto_486638 ) ) ( not ( = ?auto_486636 ?auto_486639 ) ) ( not ( = ?auto_486636 ?auto_486640 ) ) ( not ( = ?auto_486636 ?auto_486641 ) ) ( not ( = ?auto_486636 ?auto_486642 ) ) ( not ( = ?auto_486636 ?auto_486643 ) ) ( not ( = ?auto_486636 ?auto_486644 ) ) ( not ( = ?auto_486636 ?auto_486645 ) ) ( not ( = ?auto_486636 ?auto_486646 ) ) ( not ( = ?auto_486636 ?auto_486647 ) ) ( not ( = ?auto_486636 ?auto_486648 ) ) ( not ( = ?auto_486636 ?auto_486649 ) ) ( not ( = ?auto_486637 ?auto_486638 ) ) ( not ( = ?auto_486637 ?auto_486639 ) ) ( not ( = ?auto_486637 ?auto_486640 ) ) ( not ( = ?auto_486637 ?auto_486641 ) ) ( not ( = ?auto_486637 ?auto_486642 ) ) ( not ( = ?auto_486637 ?auto_486643 ) ) ( not ( = ?auto_486637 ?auto_486644 ) ) ( not ( = ?auto_486637 ?auto_486645 ) ) ( not ( = ?auto_486637 ?auto_486646 ) ) ( not ( = ?auto_486637 ?auto_486647 ) ) ( not ( = ?auto_486637 ?auto_486648 ) ) ( not ( = ?auto_486637 ?auto_486649 ) ) ( not ( = ?auto_486638 ?auto_486639 ) ) ( not ( = ?auto_486638 ?auto_486640 ) ) ( not ( = ?auto_486638 ?auto_486641 ) ) ( not ( = ?auto_486638 ?auto_486642 ) ) ( not ( = ?auto_486638 ?auto_486643 ) ) ( not ( = ?auto_486638 ?auto_486644 ) ) ( not ( = ?auto_486638 ?auto_486645 ) ) ( not ( = ?auto_486638 ?auto_486646 ) ) ( not ( = ?auto_486638 ?auto_486647 ) ) ( not ( = ?auto_486638 ?auto_486648 ) ) ( not ( = ?auto_486638 ?auto_486649 ) ) ( not ( = ?auto_486639 ?auto_486640 ) ) ( not ( = ?auto_486639 ?auto_486641 ) ) ( not ( = ?auto_486639 ?auto_486642 ) ) ( not ( = ?auto_486639 ?auto_486643 ) ) ( not ( = ?auto_486639 ?auto_486644 ) ) ( not ( = ?auto_486639 ?auto_486645 ) ) ( not ( = ?auto_486639 ?auto_486646 ) ) ( not ( = ?auto_486639 ?auto_486647 ) ) ( not ( = ?auto_486639 ?auto_486648 ) ) ( not ( = ?auto_486639 ?auto_486649 ) ) ( not ( = ?auto_486640 ?auto_486641 ) ) ( not ( = ?auto_486640 ?auto_486642 ) ) ( not ( = ?auto_486640 ?auto_486643 ) ) ( not ( = ?auto_486640 ?auto_486644 ) ) ( not ( = ?auto_486640 ?auto_486645 ) ) ( not ( = ?auto_486640 ?auto_486646 ) ) ( not ( = ?auto_486640 ?auto_486647 ) ) ( not ( = ?auto_486640 ?auto_486648 ) ) ( not ( = ?auto_486640 ?auto_486649 ) ) ( not ( = ?auto_486641 ?auto_486642 ) ) ( not ( = ?auto_486641 ?auto_486643 ) ) ( not ( = ?auto_486641 ?auto_486644 ) ) ( not ( = ?auto_486641 ?auto_486645 ) ) ( not ( = ?auto_486641 ?auto_486646 ) ) ( not ( = ?auto_486641 ?auto_486647 ) ) ( not ( = ?auto_486641 ?auto_486648 ) ) ( not ( = ?auto_486641 ?auto_486649 ) ) ( not ( = ?auto_486642 ?auto_486643 ) ) ( not ( = ?auto_486642 ?auto_486644 ) ) ( not ( = ?auto_486642 ?auto_486645 ) ) ( not ( = ?auto_486642 ?auto_486646 ) ) ( not ( = ?auto_486642 ?auto_486647 ) ) ( not ( = ?auto_486642 ?auto_486648 ) ) ( not ( = ?auto_486642 ?auto_486649 ) ) ( not ( = ?auto_486643 ?auto_486644 ) ) ( not ( = ?auto_486643 ?auto_486645 ) ) ( not ( = ?auto_486643 ?auto_486646 ) ) ( not ( = ?auto_486643 ?auto_486647 ) ) ( not ( = ?auto_486643 ?auto_486648 ) ) ( not ( = ?auto_486643 ?auto_486649 ) ) ( not ( = ?auto_486644 ?auto_486645 ) ) ( not ( = ?auto_486644 ?auto_486646 ) ) ( not ( = ?auto_486644 ?auto_486647 ) ) ( not ( = ?auto_486644 ?auto_486648 ) ) ( not ( = ?auto_486644 ?auto_486649 ) ) ( not ( = ?auto_486645 ?auto_486646 ) ) ( not ( = ?auto_486645 ?auto_486647 ) ) ( not ( = ?auto_486645 ?auto_486648 ) ) ( not ( = ?auto_486645 ?auto_486649 ) ) ( not ( = ?auto_486646 ?auto_486647 ) ) ( not ( = ?auto_486646 ?auto_486648 ) ) ( not ( = ?auto_486646 ?auto_486649 ) ) ( not ( = ?auto_486647 ?auto_486648 ) ) ( not ( = ?auto_486647 ?auto_486649 ) ) ( not ( = ?auto_486648 ?auto_486649 ) ) ( ON ?auto_486647 ?auto_486648 ) ( CLEAR ?auto_486645 ) ( ON ?auto_486646 ?auto_486647 ) ( CLEAR ?auto_486646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_486636 ?auto_486637 ?auto_486638 ?auto_486639 ?auto_486640 ?auto_486641 ?auto_486642 ?auto_486643 ?auto_486644 ?auto_486645 ?auto_486646 )
      ( MAKE-13PILE ?auto_486636 ?auto_486637 ?auto_486638 ?auto_486639 ?auto_486640 ?auto_486641 ?auto_486642 ?auto_486643 ?auto_486644 ?auto_486645 ?auto_486646 ?auto_486647 ?auto_486648 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_486690 - BLOCK
      ?auto_486691 - BLOCK
      ?auto_486692 - BLOCK
      ?auto_486693 - BLOCK
      ?auto_486694 - BLOCK
      ?auto_486695 - BLOCK
      ?auto_486696 - BLOCK
      ?auto_486697 - BLOCK
      ?auto_486698 - BLOCK
      ?auto_486699 - BLOCK
      ?auto_486700 - BLOCK
      ?auto_486701 - BLOCK
      ?auto_486702 - BLOCK
    )
    :vars
    (
      ?auto_486703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486702 ?auto_486703 ) ( ON-TABLE ?auto_486690 ) ( ON ?auto_486691 ?auto_486690 ) ( ON ?auto_486692 ?auto_486691 ) ( ON ?auto_486693 ?auto_486692 ) ( ON ?auto_486694 ?auto_486693 ) ( ON ?auto_486695 ?auto_486694 ) ( ON ?auto_486696 ?auto_486695 ) ( ON ?auto_486697 ?auto_486696 ) ( ON ?auto_486698 ?auto_486697 ) ( not ( = ?auto_486690 ?auto_486691 ) ) ( not ( = ?auto_486690 ?auto_486692 ) ) ( not ( = ?auto_486690 ?auto_486693 ) ) ( not ( = ?auto_486690 ?auto_486694 ) ) ( not ( = ?auto_486690 ?auto_486695 ) ) ( not ( = ?auto_486690 ?auto_486696 ) ) ( not ( = ?auto_486690 ?auto_486697 ) ) ( not ( = ?auto_486690 ?auto_486698 ) ) ( not ( = ?auto_486690 ?auto_486699 ) ) ( not ( = ?auto_486690 ?auto_486700 ) ) ( not ( = ?auto_486690 ?auto_486701 ) ) ( not ( = ?auto_486690 ?auto_486702 ) ) ( not ( = ?auto_486690 ?auto_486703 ) ) ( not ( = ?auto_486691 ?auto_486692 ) ) ( not ( = ?auto_486691 ?auto_486693 ) ) ( not ( = ?auto_486691 ?auto_486694 ) ) ( not ( = ?auto_486691 ?auto_486695 ) ) ( not ( = ?auto_486691 ?auto_486696 ) ) ( not ( = ?auto_486691 ?auto_486697 ) ) ( not ( = ?auto_486691 ?auto_486698 ) ) ( not ( = ?auto_486691 ?auto_486699 ) ) ( not ( = ?auto_486691 ?auto_486700 ) ) ( not ( = ?auto_486691 ?auto_486701 ) ) ( not ( = ?auto_486691 ?auto_486702 ) ) ( not ( = ?auto_486691 ?auto_486703 ) ) ( not ( = ?auto_486692 ?auto_486693 ) ) ( not ( = ?auto_486692 ?auto_486694 ) ) ( not ( = ?auto_486692 ?auto_486695 ) ) ( not ( = ?auto_486692 ?auto_486696 ) ) ( not ( = ?auto_486692 ?auto_486697 ) ) ( not ( = ?auto_486692 ?auto_486698 ) ) ( not ( = ?auto_486692 ?auto_486699 ) ) ( not ( = ?auto_486692 ?auto_486700 ) ) ( not ( = ?auto_486692 ?auto_486701 ) ) ( not ( = ?auto_486692 ?auto_486702 ) ) ( not ( = ?auto_486692 ?auto_486703 ) ) ( not ( = ?auto_486693 ?auto_486694 ) ) ( not ( = ?auto_486693 ?auto_486695 ) ) ( not ( = ?auto_486693 ?auto_486696 ) ) ( not ( = ?auto_486693 ?auto_486697 ) ) ( not ( = ?auto_486693 ?auto_486698 ) ) ( not ( = ?auto_486693 ?auto_486699 ) ) ( not ( = ?auto_486693 ?auto_486700 ) ) ( not ( = ?auto_486693 ?auto_486701 ) ) ( not ( = ?auto_486693 ?auto_486702 ) ) ( not ( = ?auto_486693 ?auto_486703 ) ) ( not ( = ?auto_486694 ?auto_486695 ) ) ( not ( = ?auto_486694 ?auto_486696 ) ) ( not ( = ?auto_486694 ?auto_486697 ) ) ( not ( = ?auto_486694 ?auto_486698 ) ) ( not ( = ?auto_486694 ?auto_486699 ) ) ( not ( = ?auto_486694 ?auto_486700 ) ) ( not ( = ?auto_486694 ?auto_486701 ) ) ( not ( = ?auto_486694 ?auto_486702 ) ) ( not ( = ?auto_486694 ?auto_486703 ) ) ( not ( = ?auto_486695 ?auto_486696 ) ) ( not ( = ?auto_486695 ?auto_486697 ) ) ( not ( = ?auto_486695 ?auto_486698 ) ) ( not ( = ?auto_486695 ?auto_486699 ) ) ( not ( = ?auto_486695 ?auto_486700 ) ) ( not ( = ?auto_486695 ?auto_486701 ) ) ( not ( = ?auto_486695 ?auto_486702 ) ) ( not ( = ?auto_486695 ?auto_486703 ) ) ( not ( = ?auto_486696 ?auto_486697 ) ) ( not ( = ?auto_486696 ?auto_486698 ) ) ( not ( = ?auto_486696 ?auto_486699 ) ) ( not ( = ?auto_486696 ?auto_486700 ) ) ( not ( = ?auto_486696 ?auto_486701 ) ) ( not ( = ?auto_486696 ?auto_486702 ) ) ( not ( = ?auto_486696 ?auto_486703 ) ) ( not ( = ?auto_486697 ?auto_486698 ) ) ( not ( = ?auto_486697 ?auto_486699 ) ) ( not ( = ?auto_486697 ?auto_486700 ) ) ( not ( = ?auto_486697 ?auto_486701 ) ) ( not ( = ?auto_486697 ?auto_486702 ) ) ( not ( = ?auto_486697 ?auto_486703 ) ) ( not ( = ?auto_486698 ?auto_486699 ) ) ( not ( = ?auto_486698 ?auto_486700 ) ) ( not ( = ?auto_486698 ?auto_486701 ) ) ( not ( = ?auto_486698 ?auto_486702 ) ) ( not ( = ?auto_486698 ?auto_486703 ) ) ( not ( = ?auto_486699 ?auto_486700 ) ) ( not ( = ?auto_486699 ?auto_486701 ) ) ( not ( = ?auto_486699 ?auto_486702 ) ) ( not ( = ?auto_486699 ?auto_486703 ) ) ( not ( = ?auto_486700 ?auto_486701 ) ) ( not ( = ?auto_486700 ?auto_486702 ) ) ( not ( = ?auto_486700 ?auto_486703 ) ) ( not ( = ?auto_486701 ?auto_486702 ) ) ( not ( = ?auto_486701 ?auto_486703 ) ) ( not ( = ?auto_486702 ?auto_486703 ) ) ( ON ?auto_486701 ?auto_486702 ) ( ON ?auto_486700 ?auto_486701 ) ( CLEAR ?auto_486698 ) ( ON ?auto_486699 ?auto_486700 ) ( CLEAR ?auto_486699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_486690 ?auto_486691 ?auto_486692 ?auto_486693 ?auto_486694 ?auto_486695 ?auto_486696 ?auto_486697 ?auto_486698 ?auto_486699 )
      ( MAKE-13PILE ?auto_486690 ?auto_486691 ?auto_486692 ?auto_486693 ?auto_486694 ?auto_486695 ?auto_486696 ?auto_486697 ?auto_486698 ?auto_486699 ?auto_486700 ?auto_486701 ?auto_486702 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_486744 - BLOCK
      ?auto_486745 - BLOCK
      ?auto_486746 - BLOCK
      ?auto_486747 - BLOCK
      ?auto_486748 - BLOCK
      ?auto_486749 - BLOCK
      ?auto_486750 - BLOCK
      ?auto_486751 - BLOCK
      ?auto_486752 - BLOCK
      ?auto_486753 - BLOCK
      ?auto_486754 - BLOCK
      ?auto_486755 - BLOCK
      ?auto_486756 - BLOCK
    )
    :vars
    (
      ?auto_486757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486756 ?auto_486757 ) ( ON-TABLE ?auto_486744 ) ( ON ?auto_486745 ?auto_486744 ) ( ON ?auto_486746 ?auto_486745 ) ( ON ?auto_486747 ?auto_486746 ) ( ON ?auto_486748 ?auto_486747 ) ( ON ?auto_486749 ?auto_486748 ) ( ON ?auto_486750 ?auto_486749 ) ( ON ?auto_486751 ?auto_486750 ) ( not ( = ?auto_486744 ?auto_486745 ) ) ( not ( = ?auto_486744 ?auto_486746 ) ) ( not ( = ?auto_486744 ?auto_486747 ) ) ( not ( = ?auto_486744 ?auto_486748 ) ) ( not ( = ?auto_486744 ?auto_486749 ) ) ( not ( = ?auto_486744 ?auto_486750 ) ) ( not ( = ?auto_486744 ?auto_486751 ) ) ( not ( = ?auto_486744 ?auto_486752 ) ) ( not ( = ?auto_486744 ?auto_486753 ) ) ( not ( = ?auto_486744 ?auto_486754 ) ) ( not ( = ?auto_486744 ?auto_486755 ) ) ( not ( = ?auto_486744 ?auto_486756 ) ) ( not ( = ?auto_486744 ?auto_486757 ) ) ( not ( = ?auto_486745 ?auto_486746 ) ) ( not ( = ?auto_486745 ?auto_486747 ) ) ( not ( = ?auto_486745 ?auto_486748 ) ) ( not ( = ?auto_486745 ?auto_486749 ) ) ( not ( = ?auto_486745 ?auto_486750 ) ) ( not ( = ?auto_486745 ?auto_486751 ) ) ( not ( = ?auto_486745 ?auto_486752 ) ) ( not ( = ?auto_486745 ?auto_486753 ) ) ( not ( = ?auto_486745 ?auto_486754 ) ) ( not ( = ?auto_486745 ?auto_486755 ) ) ( not ( = ?auto_486745 ?auto_486756 ) ) ( not ( = ?auto_486745 ?auto_486757 ) ) ( not ( = ?auto_486746 ?auto_486747 ) ) ( not ( = ?auto_486746 ?auto_486748 ) ) ( not ( = ?auto_486746 ?auto_486749 ) ) ( not ( = ?auto_486746 ?auto_486750 ) ) ( not ( = ?auto_486746 ?auto_486751 ) ) ( not ( = ?auto_486746 ?auto_486752 ) ) ( not ( = ?auto_486746 ?auto_486753 ) ) ( not ( = ?auto_486746 ?auto_486754 ) ) ( not ( = ?auto_486746 ?auto_486755 ) ) ( not ( = ?auto_486746 ?auto_486756 ) ) ( not ( = ?auto_486746 ?auto_486757 ) ) ( not ( = ?auto_486747 ?auto_486748 ) ) ( not ( = ?auto_486747 ?auto_486749 ) ) ( not ( = ?auto_486747 ?auto_486750 ) ) ( not ( = ?auto_486747 ?auto_486751 ) ) ( not ( = ?auto_486747 ?auto_486752 ) ) ( not ( = ?auto_486747 ?auto_486753 ) ) ( not ( = ?auto_486747 ?auto_486754 ) ) ( not ( = ?auto_486747 ?auto_486755 ) ) ( not ( = ?auto_486747 ?auto_486756 ) ) ( not ( = ?auto_486747 ?auto_486757 ) ) ( not ( = ?auto_486748 ?auto_486749 ) ) ( not ( = ?auto_486748 ?auto_486750 ) ) ( not ( = ?auto_486748 ?auto_486751 ) ) ( not ( = ?auto_486748 ?auto_486752 ) ) ( not ( = ?auto_486748 ?auto_486753 ) ) ( not ( = ?auto_486748 ?auto_486754 ) ) ( not ( = ?auto_486748 ?auto_486755 ) ) ( not ( = ?auto_486748 ?auto_486756 ) ) ( not ( = ?auto_486748 ?auto_486757 ) ) ( not ( = ?auto_486749 ?auto_486750 ) ) ( not ( = ?auto_486749 ?auto_486751 ) ) ( not ( = ?auto_486749 ?auto_486752 ) ) ( not ( = ?auto_486749 ?auto_486753 ) ) ( not ( = ?auto_486749 ?auto_486754 ) ) ( not ( = ?auto_486749 ?auto_486755 ) ) ( not ( = ?auto_486749 ?auto_486756 ) ) ( not ( = ?auto_486749 ?auto_486757 ) ) ( not ( = ?auto_486750 ?auto_486751 ) ) ( not ( = ?auto_486750 ?auto_486752 ) ) ( not ( = ?auto_486750 ?auto_486753 ) ) ( not ( = ?auto_486750 ?auto_486754 ) ) ( not ( = ?auto_486750 ?auto_486755 ) ) ( not ( = ?auto_486750 ?auto_486756 ) ) ( not ( = ?auto_486750 ?auto_486757 ) ) ( not ( = ?auto_486751 ?auto_486752 ) ) ( not ( = ?auto_486751 ?auto_486753 ) ) ( not ( = ?auto_486751 ?auto_486754 ) ) ( not ( = ?auto_486751 ?auto_486755 ) ) ( not ( = ?auto_486751 ?auto_486756 ) ) ( not ( = ?auto_486751 ?auto_486757 ) ) ( not ( = ?auto_486752 ?auto_486753 ) ) ( not ( = ?auto_486752 ?auto_486754 ) ) ( not ( = ?auto_486752 ?auto_486755 ) ) ( not ( = ?auto_486752 ?auto_486756 ) ) ( not ( = ?auto_486752 ?auto_486757 ) ) ( not ( = ?auto_486753 ?auto_486754 ) ) ( not ( = ?auto_486753 ?auto_486755 ) ) ( not ( = ?auto_486753 ?auto_486756 ) ) ( not ( = ?auto_486753 ?auto_486757 ) ) ( not ( = ?auto_486754 ?auto_486755 ) ) ( not ( = ?auto_486754 ?auto_486756 ) ) ( not ( = ?auto_486754 ?auto_486757 ) ) ( not ( = ?auto_486755 ?auto_486756 ) ) ( not ( = ?auto_486755 ?auto_486757 ) ) ( not ( = ?auto_486756 ?auto_486757 ) ) ( ON ?auto_486755 ?auto_486756 ) ( ON ?auto_486754 ?auto_486755 ) ( ON ?auto_486753 ?auto_486754 ) ( CLEAR ?auto_486751 ) ( ON ?auto_486752 ?auto_486753 ) ( CLEAR ?auto_486752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_486744 ?auto_486745 ?auto_486746 ?auto_486747 ?auto_486748 ?auto_486749 ?auto_486750 ?auto_486751 ?auto_486752 )
      ( MAKE-13PILE ?auto_486744 ?auto_486745 ?auto_486746 ?auto_486747 ?auto_486748 ?auto_486749 ?auto_486750 ?auto_486751 ?auto_486752 ?auto_486753 ?auto_486754 ?auto_486755 ?auto_486756 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_486798 - BLOCK
      ?auto_486799 - BLOCK
      ?auto_486800 - BLOCK
      ?auto_486801 - BLOCK
      ?auto_486802 - BLOCK
      ?auto_486803 - BLOCK
      ?auto_486804 - BLOCK
      ?auto_486805 - BLOCK
      ?auto_486806 - BLOCK
      ?auto_486807 - BLOCK
      ?auto_486808 - BLOCK
      ?auto_486809 - BLOCK
      ?auto_486810 - BLOCK
    )
    :vars
    (
      ?auto_486811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486810 ?auto_486811 ) ( ON-TABLE ?auto_486798 ) ( ON ?auto_486799 ?auto_486798 ) ( ON ?auto_486800 ?auto_486799 ) ( ON ?auto_486801 ?auto_486800 ) ( ON ?auto_486802 ?auto_486801 ) ( ON ?auto_486803 ?auto_486802 ) ( ON ?auto_486804 ?auto_486803 ) ( not ( = ?auto_486798 ?auto_486799 ) ) ( not ( = ?auto_486798 ?auto_486800 ) ) ( not ( = ?auto_486798 ?auto_486801 ) ) ( not ( = ?auto_486798 ?auto_486802 ) ) ( not ( = ?auto_486798 ?auto_486803 ) ) ( not ( = ?auto_486798 ?auto_486804 ) ) ( not ( = ?auto_486798 ?auto_486805 ) ) ( not ( = ?auto_486798 ?auto_486806 ) ) ( not ( = ?auto_486798 ?auto_486807 ) ) ( not ( = ?auto_486798 ?auto_486808 ) ) ( not ( = ?auto_486798 ?auto_486809 ) ) ( not ( = ?auto_486798 ?auto_486810 ) ) ( not ( = ?auto_486798 ?auto_486811 ) ) ( not ( = ?auto_486799 ?auto_486800 ) ) ( not ( = ?auto_486799 ?auto_486801 ) ) ( not ( = ?auto_486799 ?auto_486802 ) ) ( not ( = ?auto_486799 ?auto_486803 ) ) ( not ( = ?auto_486799 ?auto_486804 ) ) ( not ( = ?auto_486799 ?auto_486805 ) ) ( not ( = ?auto_486799 ?auto_486806 ) ) ( not ( = ?auto_486799 ?auto_486807 ) ) ( not ( = ?auto_486799 ?auto_486808 ) ) ( not ( = ?auto_486799 ?auto_486809 ) ) ( not ( = ?auto_486799 ?auto_486810 ) ) ( not ( = ?auto_486799 ?auto_486811 ) ) ( not ( = ?auto_486800 ?auto_486801 ) ) ( not ( = ?auto_486800 ?auto_486802 ) ) ( not ( = ?auto_486800 ?auto_486803 ) ) ( not ( = ?auto_486800 ?auto_486804 ) ) ( not ( = ?auto_486800 ?auto_486805 ) ) ( not ( = ?auto_486800 ?auto_486806 ) ) ( not ( = ?auto_486800 ?auto_486807 ) ) ( not ( = ?auto_486800 ?auto_486808 ) ) ( not ( = ?auto_486800 ?auto_486809 ) ) ( not ( = ?auto_486800 ?auto_486810 ) ) ( not ( = ?auto_486800 ?auto_486811 ) ) ( not ( = ?auto_486801 ?auto_486802 ) ) ( not ( = ?auto_486801 ?auto_486803 ) ) ( not ( = ?auto_486801 ?auto_486804 ) ) ( not ( = ?auto_486801 ?auto_486805 ) ) ( not ( = ?auto_486801 ?auto_486806 ) ) ( not ( = ?auto_486801 ?auto_486807 ) ) ( not ( = ?auto_486801 ?auto_486808 ) ) ( not ( = ?auto_486801 ?auto_486809 ) ) ( not ( = ?auto_486801 ?auto_486810 ) ) ( not ( = ?auto_486801 ?auto_486811 ) ) ( not ( = ?auto_486802 ?auto_486803 ) ) ( not ( = ?auto_486802 ?auto_486804 ) ) ( not ( = ?auto_486802 ?auto_486805 ) ) ( not ( = ?auto_486802 ?auto_486806 ) ) ( not ( = ?auto_486802 ?auto_486807 ) ) ( not ( = ?auto_486802 ?auto_486808 ) ) ( not ( = ?auto_486802 ?auto_486809 ) ) ( not ( = ?auto_486802 ?auto_486810 ) ) ( not ( = ?auto_486802 ?auto_486811 ) ) ( not ( = ?auto_486803 ?auto_486804 ) ) ( not ( = ?auto_486803 ?auto_486805 ) ) ( not ( = ?auto_486803 ?auto_486806 ) ) ( not ( = ?auto_486803 ?auto_486807 ) ) ( not ( = ?auto_486803 ?auto_486808 ) ) ( not ( = ?auto_486803 ?auto_486809 ) ) ( not ( = ?auto_486803 ?auto_486810 ) ) ( not ( = ?auto_486803 ?auto_486811 ) ) ( not ( = ?auto_486804 ?auto_486805 ) ) ( not ( = ?auto_486804 ?auto_486806 ) ) ( not ( = ?auto_486804 ?auto_486807 ) ) ( not ( = ?auto_486804 ?auto_486808 ) ) ( not ( = ?auto_486804 ?auto_486809 ) ) ( not ( = ?auto_486804 ?auto_486810 ) ) ( not ( = ?auto_486804 ?auto_486811 ) ) ( not ( = ?auto_486805 ?auto_486806 ) ) ( not ( = ?auto_486805 ?auto_486807 ) ) ( not ( = ?auto_486805 ?auto_486808 ) ) ( not ( = ?auto_486805 ?auto_486809 ) ) ( not ( = ?auto_486805 ?auto_486810 ) ) ( not ( = ?auto_486805 ?auto_486811 ) ) ( not ( = ?auto_486806 ?auto_486807 ) ) ( not ( = ?auto_486806 ?auto_486808 ) ) ( not ( = ?auto_486806 ?auto_486809 ) ) ( not ( = ?auto_486806 ?auto_486810 ) ) ( not ( = ?auto_486806 ?auto_486811 ) ) ( not ( = ?auto_486807 ?auto_486808 ) ) ( not ( = ?auto_486807 ?auto_486809 ) ) ( not ( = ?auto_486807 ?auto_486810 ) ) ( not ( = ?auto_486807 ?auto_486811 ) ) ( not ( = ?auto_486808 ?auto_486809 ) ) ( not ( = ?auto_486808 ?auto_486810 ) ) ( not ( = ?auto_486808 ?auto_486811 ) ) ( not ( = ?auto_486809 ?auto_486810 ) ) ( not ( = ?auto_486809 ?auto_486811 ) ) ( not ( = ?auto_486810 ?auto_486811 ) ) ( ON ?auto_486809 ?auto_486810 ) ( ON ?auto_486808 ?auto_486809 ) ( ON ?auto_486807 ?auto_486808 ) ( ON ?auto_486806 ?auto_486807 ) ( CLEAR ?auto_486804 ) ( ON ?auto_486805 ?auto_486806 ) ( CLEAR ?auto_486805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_486798 ?auto_486799 ?auto_486800 ?auto_486801 ?auto_486802 ?auto_486803 ?auto_486804 ?auto_486805 )
      ( MAKE-13PILE ?auto_486798 ?auto_486799 ?auto_486800 ?auto_486801 ?auto_486802 ?auto_486803 ?auto_486804 ?auto_486805 ?auto_486806 ?auto_486807 ?auto_486808 ?auto_486809 ?auto_486810 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_486852 - BLOCK
      ?auto_486853 - BLOCK
      ?auto_486854 - BLOCK
      ?auto_486855 - BLOCK
      ?auto_486856 - BLOCK
      ?auto_486857 - BLOCK
      ?auto_486858 - BLOCK
      ?auto_486859 - BLOCK
      ?auto_486860 - BLOCK
      ?auto_486861 - BLOCK
      ?auto_486862 - BLOCK
      ?auto_486863 - BLOCK
      ?auto_486864 - BLOCK
    )
    :vars
    (
      ?auto_486865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486864 ?auto_486865 ) ( ON-TABLE ?auto_486852 ) ( ON ?auto_486853 ?auto_486852 ) ( ON ?auto_486854 ?auto_486853 ) ( ON ?auto_486855 ?auto_486854 ) ( ON ?auto_486856 ?auto_486855 ) ( ON ?auto_486857 ?auto_486856 ) ( not ( = ?auto_486852 ?auto_486853 ) ) ( not ( = ?auto_486852 ?auto_486854 ) ) ( not ( = ?auto_486852 ?auto_486855 ) ) ( not ( = ?auto_486852 ?auto_486856 ) ) ( not ( = ?auto_486852 ?auto_486857 ) ) ( not ( = ?auto_486852 ?auto_486858 ) ) ( not ( = ?auto_486852 ?auto_486859 ) ) ( not ( = ?auto_486852 ?auto_486860 ) ) ( not ( = ?auto_486852 ?auto_486861 ) ) ( not ( = ?auto_486852 ?auto_486862 ) ) ( not ( = ?auto_486852 ?auto_486863 ) ) ( not ( = ?auto_486852 ?auto_486864 ) ) ( not ( = ?auto_486852 ?auto_486865 ) ) ( not ( = ?auto_486853 ?auto_486854 ) ) ( not ( = ?auto_486853 ?auto_486855 ) ) ( not ( = ?auto_486853 ?auto_486856 ) ) ( not ( = ?auto_486853 ?auto_486857 ) ) ( not ( = ?auto_486853 ?auto_486858 ) ) ( not ( = ?auto_486853 ?auto_486859 ) ) ( not ( = ?auto_486853 ?auto_486860 ) ) ( not ( = ?auto_486853 ?auto_486861 ) ) ( not ( = ?auto_486853 ?auto_486862 ) ) ( not ( = ?auto_486853 ?auto_486863 ) ) ( not ( = ?auto_486853 ?auto_486864 ) ) ( not ( = ?auto_486853 ?auto_486865 ) ) ( not ( = ?auto_486854 ?auto_486855 ) ) ( not ( = ?auto_486854 ?auto_486856 ) ) ( not ( = ?auto_486854 ?auto_486857 ) ) ( not ( = ?auto_486854 ?auto_486858 ) ) ( not ( = ?auto_486854 ?auto_486859 ) ) ( not ( = ?auto_486854 ?auto_486860 ) ) ( not ( = ?auto_486854 ?auto_486861 ) ) ( not ( = ?auto_486854 ?auto_486862 ) ) ( not ( = ?auto_486854 ?auto_486863 ) ) ( not ( = ?auto_486854 ?auto_486864 ) ) ( not ( = ?auto_486854 ?auto_486865 ) ) ( not ( = ?auto_486855 ?auto_486856 ) ) ( not ( = ?auto_486855 ?auto_486857 ) ) ( not ( = ?auto_486855 ?auto_486858 ) ) ( not ( = ?auto_486855 ?auto_486859 ) ) ( not ( = ?auto_486855 ?auto_486860 ) ) ( not ( = ?auto_486855 ?auto_486861 ) ) ( not ( = ?auto_486855 ?auto_486862 ) ) ( not ( = ?auto_486855 ?auto_486863 ) ) ( not ( = ?auto_486855 ?auto_486864 ) ) ( not ( = ?auto_486855 ?auto_486865 ) ) ( not ( = ?auto_486856 ?auto_486857 ) ) ( not ( = ?auto_486856 ?auto_486858 ) ) ( not ( = ?auto_486856 ?auto_486859 ) ) ( not ( = ?auto_486856 ?auto_486860 ) ) ( not ( = ?auto_486856 ?auto_486861 ) ) ( not ( = ?auto_486856 ?auto_486862 ) ) ( not ( = ?auto_486856 ?auto_486863 ) ) ( not ( = ?auto_486856 ?auto_486864 ) ) ( not ( = ?auto_486856 ?auto_486865 ) ) ( not ( = ?auto_486857 ?auto_486858 ) ) ( not ( = ?auto_486857 ?auto_486859 ) ) ( not ( = ?auto_486857 ?auto_486860 ) ) ( not ( = ?auto_486857 ?auto_486861 ) ) ( not ( = ?auto_486857 ?auto_486862 ) ) ( not ( = ?auto_486857 ?auto_486863 ) ) ( not ( = ?auto_486857 ?auto_486864 ) ) ( not ( = ?auto_486857 ?auto_486865 ) ) ( not ( = ?auto_486858 ?auto_486859 ) ) ( not ( = ?auto_486858 ?auto_486860 ) ) ( not ( = ?auto_486858 ?auto_486861 ) ) ( not ( = ?auto_486858 ?auto_486862 ) ) ( not ( = ?auto_486858 ?auto_486863 ) ) ( not ( = ?auto_486858 ?auto_486864 ) ) ( not ( = ?auto_486858 ?auto_486865 ) ) ( not ( = ?auto_486859 ?auto_486860 ) ) ( not ( = ?auto_486859 ?auto_486861 ) ) ( not ( = ?auto_486859 ?auto_486862 ) ) ( not ( = ?auto_486859 ?auto_486863 ) ) ( not ( = ?auto_486859 ?auto_486864 ) ) ( not ( = ?auto_486859 ?auto_486865 ) ) ( not ( = ?auto_486860 ?auto_486861 ) ) ( not ( = ?auto_486860 ?auto_486862 ) ) ( not ( = ?auto_486860 ?auto_486863 ) ) ( not ( = ?auto_486860 ?auto_486864 ) ) ( not ( = ?auto_486860 ?auto_486865 ) ) ( not ( = ?auto_486861 ?auto_486862 ) ) ( not ( = ?auto_486861 ?auto_486863 ) ) ( not ( = ?auto_486861 ?auto_486864 ) ) ( not ( = ?auto_486861 ?auto_486865 ) ) ( not ( = ?auto_486862 ?auto_486863 ) ) ( not ( = ?auto_486862 ?auto_486864 ) ) ( not ( = ?auto_486862 ?auto_486865 ) ) ( not ( = ?auto_486863 ?auto_486864 ) ) ( not ( = ?auto_486863 ?auto_486865 ) ) ( not ( = ?auto_486864 ?auto_486865 ) ) ( ON ?auto_486863 ?auto_486864 ) ( ON ?auto_486862 ?auto_486863 ) ( ON ?auto_486861 ?auto_486862 ) ( ON ?auto_486860 ?auto_486861 ) ( ON ?auto_486859 ?auto_486860 ) ( CLEAR ?auto_486857 ) ( ON ?auto_486858 ?auto_486859 ) ( CLEAR ?auto_486858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_486852 ?auto_486853 ?auto_486854 ?auto_486855 ?auto_486856 ?auto_486857 ?auto_486858 )
      ( MAKE-13PILE ?auto_486852 ?auto_486853 ?auto_486854 ?auto_486855 ?auto_486856 ?auto_486857 ?auto_486858 ?auto_486859 ?auto_486860 ?auto_486861 ?auto_486862 ?auto_486863 ?auto_486864 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_486906 - BLOCK
      ?auto_486907 - BLOCK
      ?auto_486908 - BLOCK
      ?auto_486909 - BLOCK
      ?auto_486910 - BLOCK
      ?auto_486911 - BLOCK
      ?auto_486912 - BLOCK
      ?auto_486913 - BLOCK
      ?auto_486914 - BLOCK
      ?auto_486915 - BLOCK
      ?auto_486916 - BLOCK
      ?auto_486917 - BLOCK
      ?auto_486918 - BLOCK
    )
    :vars
    (
      ?auto_486919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486918 ?auto_486919 ) ( ON-TABLE ?auto_486906 ) ( ON ?auto_486907 ?auto_486906 ) ( ON ?auto_486908 ?auto_486907 ) ( ON ?auto_486909 ?auto_486908 ) ( ON ?auto_486910 ?auto_486909 ) ( not ( = ?auto_486906 ?auto_486907 ) ) ( not ( = ?auto_486906 ?auto_486908 ) ) ( not ( = ?auto_486906 ?auto_486909 ) ) ( not ( = ?auto_486906 ?auto_486910 ) ) ( not ( = ?auto_486906 ?auto_486911 ) ) ( not ( = ?auto_486906 ?auto_486912 ) ) ( not ( = ?auto_486906 ?auto_486913 ) ) ( not ( = ?auto_486906 ?auto_486914 ) ) ( not ( = ?auto_486906 ?auto_486915 ) ) ( not ( = ?auto_486906 ?auto_486916 ) ) ( not ( = ?auto_486906 ?auto_486917 ) ) ( not ( = ?auto_486906 ?auto_486918 ) ) ( not ( = ?auto_486906 ?auto_486919 ) ) ( not ( = ?auto_486907 ?auto_486908 ) ) ( not ( = ?auto_486907 ?auto_486909 ) ) ( not ( = ?auto_486907 ?auto_486910 ) ) ( not ( = ?auto_486907 ?auto_486911 ) ) ( not ( = ?auto_486907 ?auto_486912 ) ) ( not ( = ?auto_486907 ?auto_486913 ) ) ( not ( = ?auto_486907 ?auto_486914 ) ) ( not ( = ?auto_486907 ?auto_486915 ) ) ( not ( = ?auto_486907 ?auto_486916 ) ) ( not ( = ?auto_486907 ?auto_486917 ) ) ( not ( = ?auto_486907 ?auto_486918 ) ) ( not ( = ?auto_486907 ?auto_486919 ) ) ( not ( = ?auto_486908 ?auto_486909 ) ) ( not ( = ?auto_486908 ?auto_486910 ) ) ( not ( = ?auto_486908 ?auto_486911 ) ) ( not ( = ?auto_486908 ?auto_486912 ) ) ( not ( = ?auto_486908 ?auto_486913 ) ) ( not ( = ?auto_486908 ?auto_486914 ) ) ( not ( = ?auto_486908 ?auto_486915 ) ) ( not ( = ?auto_486908 ?auto_486916 ) ) ( not ( = ?auto_486908 ?auto_486917 ) ) ( not ( = ?auto_486908 ?auto_486918 ) ) ( not ( = ?auto_486908 ?auto_486919 ) ) ( not ( = ?auto_486909 ?auto_486910 ) ) ( not ( = ?auto_486909 ?auto_486911 ) ) ( not ( = ?auto_486909 ?auto_486912 ) ) ( not ( = ?auto_486909 ?auto_486913 ) ) ( not ( = ?auto_486909 ?auto_486914 ) ) ( not ( = ?auto_486909 ?auto_486915 ) ) ( not ( = ?auto_486909 ?auto_486916 ) ) ( not ( = ?auto_486909 ?auto_486917 ) ) ( not ( = ?auto_486909 ?auto_486918 ) ) ( not ( = ?auto_486909 ?auto_486919 ) ) ( not ( = ?auto_486910 ?auto_486911 ) ) ( not ( = ?auto_486910 ?auto_486912 ) ) ( not ( = ?auto_486910 ?auto_486913 ) ) ( not ( = ?auto_486910 ?auto_486914 ) ) ( not ( = ?auto_486910 ?auto_486915 ) ) ( not ( = ?auto_486910 ?auto_486916 ) ) ( not ( = ?auto_486910 ?auto_486917 ) ) ( not ( = ?auto_486910 ?auto_486918 ) ) ( not ( = ?auto_486910 ?auto_486919 ) ) ( not ( = ?auto_486911 ?auto_486912 ) ) ( not ( = ?auto_486911 ?auto_486913 ) ) ( not ( = ?auto_486911 ?auto_486914 ) ) ( not ( = ?auto_486911 ?auto_486915 ) ) ( not ( = ?auto_486911 ?auto_486916 ) ) ( not ( = ?auto_486911 ?auto_486917 ) ) ( not ( = ?auto_486911 ?auto_486918 ) ) ( not ( = ?auto_486911 ?auto_486919 ) ) ( not ( = ?auto_486912 ?auto_486913 ) ) ( not ( = ?auto_486912 ?auto_486914 ) ) ( not ( = ?auto_486912 ?auto_486915 ) ) ( not ( = ?auto_486912 ?auto_486916 ) ) ( not ( = ?auto_486912 ?auto_486917 ) ) ( not ( = ?auto_486912 ?auto_486918 ) ) ( not ( = ?auto_486912 ?auto_486919 ) ) ( not ( = ?auto_486913 ?auto_486914 ) ) ( not ( = ?auto_486913 ?auto_486915 ) ) ( not ( = ?auto_486913 ?auto_486916 ) ) ( not ( = ?auto_486913 ?auto_486917 ) ) ( not ( = ?auto_486913 ?auto_486918 ) ) ( not ( = ?auto_486913 ?auto_486919 ) ) ( not ( = ?auto_486914 ?auto_486915 ) ) ( not ( = ?auto_486914 ?auto_486916 ) ) ( not ( = ?auto_486914 ?auto_486917 ) ) ( not ( = ?auto_486914 ?auto_486918 ) ) ( not ( = ?auto_486914 ?auto_486919 ) ) ( not ( = ?auto_486915 ?auto_486916 ) ) ( not ( = ?auto_486915 ?auto_486917 ) ) ( not ( = ?auto_486915 ?auto_486918 ) ) ( not ( = ?auto_486915 ?auto_486919 ) ) ( not ( = ?auto_486916 ?auto_486917 ) ) ( not ( = ?auto_486916 ?auto_486918 ) ) ( not ( = ?auto_486916 ?auto_486919 ) ) ( not ( = ?auto_486917 ?auto_486918 ) ) ( not ( = ?auto_486917 ?auto_486919 ) ) ( not ( = ?auto_486918 ?auto_486919 ) ) ( ON ?auto_486917 ?auto_486918 ) ( ON ?auto_486916 ?auto_486917 ) ( ON ?auto_486915 ?auto_486916 ) ( ON ?auto_486914 ?auto_486915 ) ( ON ?auto_486913 ?auto_486914 ) ( ON ?auto_486912 ?auto_486913 ) ( CLEAR ?auto_486910 ) ( ON ?auto_486911 ?auto_486912 ) ( CLEAR ?auto_486911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_486906 ?auto_486907 ?auto_486908 ?auto_486909 ?auto_486910 ?auto_486911 )
      ( MAKE-13PILE ?auto_486906 ?auto_486907 ?auto_486908 ?auto_486909 ?auto_486910 ?auto_486911 ?auto_486912 ?auto_486913 ?auto_486914 ?auto_486915 ?auto_486916 ?auto_486917 ?auto_486918 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_486960 - BLOCK
      ?auto_486961 - BLOCK
      ?auto_486962 - BLOCK
      ?auto_486963 - BLOCK
      ?auto_486964 - BLOCK
      ?auto_486965 - BLOCK
      ?auto_486966 - BLOCK
      ?auto_486967 - BLOCK
      ?auto_486968 - BLOCK
      ?auto_486969 - BLOCK
      ?auto_486970 - BLOCK
      ?auto_486971 - BLOCK
      ?auto_486972 - BLOCK
    )
    :vars
    (
      ?auto_486973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_486972 ?auto_486973 ) ( ON-TABLE ?auto_486960 ) ( ON ?auto_486961 ?auto_486960 ) ( ON ?auto_486962 ?auto_486961 ) ( ON ?auto_486963 ?auto_486962 ) ( not ( = ?auto_486960 ?auto_486961 ) ) ( not ( = ?auto_486960 ?auto_486962 ) ) ( not ( = ?auto_486960 ?auto_486963 ) ) ( not ( = ?auto_486960 ?auto_486964 ) ) ( not ( = ?auto_486960 ?auto_486965 ) ) ( not ( = ?auto_486960 ?auto_486966 ) ) ( not ( = ?auto_486960 ?auto_486967 ) ) ( not ( = ?auto_486960 ?auto_486968 ) ) ( not ( = ?auto_486960 ?auto_486969 ) ) ( not ( = ?auto_486960 ?auto_486970 ) ) ( not ( = ?auto_486960 ?auto_486971 ) ) ( not ( = ?auto_486960 ?auto_486972 ) ) ( not ( = ?auto_486960 ?auto_486973 ) ) ( not ( = ?auto_486961 ?auto_486962 ) ) ( not ( = ?auto_486961 ?auto_486963 ) ) ( not ( = ?auto_486961 ?auto_486964 ) ) ( not ( = ?auto_486961 ?auto_486965 ) ) ( not ( = ?auto_486961 ?auto_486966 ) ) ( not ( = ?auto_486961 ?auto_486967 ) ) ( not ( = ?auto_486961 ?auto_486968 ) ) ( not ( = ?auto_486961 ?auto_486969 ) ) ( not ( = ?auto_486961 ?auto_486970 ) ) ( not ( = ?auto_486961 ?auto_486971 ) ) ( not ( = ?auto_486961 ?auto_486972 ) ) ( not ( = ?auto_486961 ?auto_486973 ) ) ( not ( = ?auto_486962 ?auto_486963 ) ) ( not ( = ?auto_486962 ?auto_486964 ) ) ( not ( = ?auto_486962 ?auto_486965 ) ) ( not ( = ?auto_486962 ?auto_486966 ) ) ( not ( = ?auto_486962 ?auto_486967 ) ) ( not ( = ?auto_486962 ?auto_486968 ) ) ( not ( = ?auto_486962 ?auto_486969 ) ) ( not ( = ?auto_486962 ?auto_486970 ) ) ( not ( = ?auto_486962 ?auto_486971 ) ) ( not ( = ?auto_486962 ?auto_486972 ) ) ( not ( = ?auto_486962 ?auto_486973 ) ) ( not ( = ?auto_486963 ?auto_486964 ) ) ( not ( = ?auto_486963 ?auto_486965 ) ) ( not ( = ?auto_486963 ?auto_486966 ) ) ( not ( = ?auto_486963 ?auto_486967 ) ) ( not ( = ?auto_486963 ?auto_486968 ) ) ( not ( = ?auto_486963 ?auto_486969 ) ) ( not ( = ?auto_486963 ?auto_486970 ) ) ( not ( = ?auto_486963 ?auto_486971 ) ) ( not ( = ?auto_486963 ?auto_486972 ) ) ( not ( = ?auto_486963 ?auto_486973 ) ) ( not ( = ?auto_486964 ?auto_486965 ) ) ( not ( = ?auto_486964 ?auto_486966 ) ) ( not ( = ?auto_486964 ?auto_486967 ) ) ( not ( = ?auto_486964 ?auto_486968 ) ) ( not ( = ?auto_486964 ?auto_486969 ) ) ( not ( = ?auto_486964 ?auto_486970 ) ) ( not ( = ?auto_486964 ?auto_486971 ) ) ( not ( = ?auto_486964 ?auto_486972 ) ) ( not ( = ?auto_486964 ?auto_486973 ) ) ( not ( = ?auto_486965 ?auto_486966 ) ) ( not ( = ?auto_486965 ?auto_486967 ) ) ( not ( = ?auto_486965 ?auto_486968 ) ) ( not ( = ?auto_486965 ?auto_486969 ) ) ( not ( = ?auto_486965 ?auto_486970 ) ) ( not ( = ?auto_486965 ?auto_486971 ) ) ( not ( = ?auto_486965 ?auto_486972 ) ) ( not ( = ?auto_486965 ?auto_486973 ) ) ( not ( = ?auto_486966 ?auto_486967 ) ) ( not ( = ?auto_486966 ?auto_486968 ) ) ( not ( = ?auto_486966 ?auto_486969 ) ) ( not ( = ?auto_486966 ?auto_486970 ) ) ( not ( = ?auto_486966 ?auto_486971 ) ) ( not ( = ?auto_486966 ?auto_486972 ) ) ( not ( = ?auto_486966 ?auto_486973 ) ) ( not ( = ?auto_486967 ?auto_486968 ) ) ( not ( = ?auto_486967 ?auto_486969 ) ) ( not ( = ?auto_486967 ?auto_486970 ) ) ( not ( = ?auto_486967 ?auto_486971 ) ) ( not ( = ?auto_486967 ?auto_486972 ) ) ( not ( = ?auto_486967 ?auto_486973 ) ) ( not ( = ?auto_486968 ?auto_486969 ) ) ( not ( = ?auto_486968 ?auto_486970 ) ) ( not ( = ?auto_486968 ?auto_486971 ) ) ( not ( = ?auto_486968 ?auto_486972 ) ) ( not ( = ?auto_486968 ?auto_486973 ) ) ( not ( = ?auto_486969 ?auto_486970 ) ) ( not ( = ?auto_486969 ?auto_486971 ) ) ( not ( = ?auto_486969 ?auto_486972 ) ) ( not ( = ?auto_486969 ?auto_486973 ) ) ( not ( = ?auto_486970 ?auto_486971 ) ) ( not ( = ?auto_486970 ?auto_486972 ) ) ( not ( = ?auto_486970 ?auto_486973 ) ) ( not ( = ?auto_486971 ?auto_486972 ) ) ( not ( = ?auto_486971 ?auto_486973 ) ) ( not ( = ?auto_486972 ?auto_486973 ) ) ( ON ?auto_486971 ?auto_486972 ) ( ON ?auto_486970 ?auto_486971 ) ( ON ?auto_486969 ?auto_486970 ) ( ON ?auto_486968 ?auto_486969 ) ( ON ?auto_486967 ?auto_486968 ) ( ON ?auto_486966 ?auto_486967 ) ( ON ?auto_486965 ?auto_486966 ) ( CLEAR ?auto_486963 ) ( ON ?auto_486964 ?auto_486965 ) ( CLEAR ?auto_486964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_486960 ?auto_486961 ?auto_486962 ?auto_486963 ?auto_486964 )
      ( MAKE-13PILE ?auto_486960 ?auto_486961 ?auto_486962 ?auto_486963 ?auto_486964 ?auto_486965 ?auto_486966 ?auto_486967 ?auto_486968 ?auto_486969 ?auto_486970 ?auto_486971 ?auto_486972 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_487014 - BLOCK
      ?auto_487015 - BLOCK
      ?auto_487016 - BLOCK
      ?auto_487017 - BLOCK
      ?auto_487018 - BLOCK
      ?auto_487019 - BLOCK
      ?auto_487020 - BLOCK
      ?auto_487021 - BLOCK
      ?auto_487022 - BLOCK
      ?auto_487023 - BLOCK
      ?auto_487024 - BLOCK
      ?auto_487025 - BLOCK
      ?auto_487026 - BLOCK
    )
    :vars
    (
      ?auto_487027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487026 ?auto_487027 ) ( ON-TABLE ?auto_487014 ) ( ON ?auto_487015 ?auto_487014 ) ( ON ?auto_487016 ?auto_487015 ) ( not ( = ?auto_487014 ?auto_487015 ) ) ( not ( = ?auto_487014 ?auto_487016 ) ) ( not ( = ?auto_487014 ?auto_487017 ) ) ( not ( = ?auto_487014 ?auto_487018 ) ) ( not ( = ?auto_487014 ?auto_487019 ) ) ( not ( = ?auto_487014 ?auto_487020 ) ) ( not ( = ?auto_487014 ?auto_487021 ) ) ( not ( = ?auto_487014 ?auto_487022 ) ) ( not ( = ?auto_487014 ?auto_487023 ) ) ( not ( = ?auto_487014 ?auto_487024 ) ) ( not ( = ?auto_487014 ?auto_487025 ) ) ( not ( = ?auto_487014 ?auto_487026 ) ) ( not ( = ?auto_487014 ?auto_487027 ) ) ( not ( = ?auto_487015 ?auto_487016 ) ) ( not ( = ?auto_487015 ?auto_487017 ) ) ( not ( = ?auto_487015 ?auto_487018 ) ) ( not ( = ?auto_487015 ?auto_487019 ) ) ( not ( = ?auto_487015 ?auto_487020 ) ) ( not ( = ?auto_487015 ?auto_487021 ) ) ( not ( = ?auto_487015 ?auto_487022 ) ) ( not ( = ?auto_487015 ?auto_487023 ) ) ( not ( = ?auto_487015 ?auto_487024 ) ) ( not ( = ?auto_487015 ?auto_487025 ) ) ( not ( = ?auto_487015 ?auto_487026 ) ) ( not ( = ?auto_487015 ?auto_487027 ) ) ( not ( = ?auto_487016 ?auto_487017 ) ) ( not ( = ?auto_487016 ?auto_487018 ) ) ( not ( = ?auto_487016 ?auto_487019 ) ) ( not ( = ?auto_487016 ?auto_487020 ) ) ( not ( = ?auto_487016 ?auto_487021 ) ) ( not ( = ?auto_487016 ?auto_487022 ) ) ( not ( = ?auto_487016 ?auto_487023 ) ) ( not ( = ?auto_487016 ?auto_487024 ) ) ( not ( = ?auto_487016 ?auto_487025 ) ) ( not ( = ?auto_487016 ?auto_487026 ) ) ( not ( = ?auto_487016 ?auto_487027 ) ) ( not ( = ?auto_487017 ?auto_487018 ) ) ( not ( = ?auto_487017 ?auto_487019 ) ) ( not ( = ?auto_487017 ?auto_487020 ) ) ( not ( = ?auto_487017 ?auto_487021 ) ) ( not ( = ?auto_487017 ?auto_487022 ) ) ( not ( = ?auto_487017 ?auto_487023 ) ) ( not ( = ?auto_487017 ?auto_487024 ) ) ( not ( = ?auto_487017 ?auto_487025 ) ) ( not ( = ?auto_487017 ?auto_487026 ) ) ( not ( = ?auto_487017 ?auto_487027 ) ) ( not ( = ?auto_487018 ?auto_487019 ) ) ( not ( = ?auto_487018 ?auto_487020 ) ) ( not ( = ?auto_487018 ?auto_487021 ) ) ( not ( = ?auto_487018 ?auto_487022 ) ) ( not ( = ?auto_487018 ?auto_487023 ) ) ( not ( = ?auto_487018 ?auto_487024 ) ) ( not ( = ?auto_487018 ?auto_487025 ) ) ( not ( = ?auto_487018 ?auto_487026 ) ) ( not ( = ?auto_487018 ?auto_487027 ) ) ( not ( = ?auto_487019 ?auto_487020 ) ) ( not ( = ?auto_487019 ?auto_487021 ) ) ( not ( = ?auto_487019 ?auto_487022 ) ) ( not ( = ?auto_487019 ?auto_487023 ) ) ( not ( = ?auto_487019 ?auto_487024 ) ) ( not ( = ?auto_487019 ?auto_487025 ) ) ( not ( = ?auto_487019 ?auto_487026 ) ) ( not ( = ?auto_487019 ?auto_487027 ) ) ( not ( = ?auto_487020 ?auto_487021 ) ) ( not ( = ?auto_487020 ?auto_487022 ) ) ( not ( = ?auto_487020 ?auto_487023 ) ) ( not ( = ?auto_487020 ?auto_487024 ) ) ( not ( = ?auto_487020 ?auto_487025 ) ) ( not ( = ?auto_487020 ?auto_487026 ) ) ( not ( = ?auto_487020 ?auto_487027 ) ) ( not ( = ?auto_487021 ?auto_487022 ) ) ( not ( = ?auto_487021 ?auto_487023 ) ) ( not ( = ?auto_487021 ?auto_487024 ) ) ( not ( = ?auto_487021 ?auto_487025 ) ) ( not ( = ?auto_487021 ?auto_487026 ) ) ( not ( = ?auto_487021 ?auto_487027 ) ) ( not ( = ?auto_487022 ?auto_487023 ) ) ( not ( = ?auto_487022 ?auto_487024 ) ) ( not ( = ?auto_487022 ?auto_487025 ) ) ( not ( = ?auto_487022 ?auto_487026 ) ) ( not ( = ?auto_487022 ?auto_487027 ) ) ( not ( = ?auto_487023 ?auto_487024 ) ) ( not ( = ?auto_487023 ?auto_487025 ) ) ( not ( = ?auto_487023 ?auto_487026 ) ) ( not ( = ?auto_487023 ?auto_487027 ) ) ( not ( = ?auto_487024 ?auto_487025 ) ) ( not ( = ?auto_487024 ?auto_487026 ) ) ( not ( = ?auto_487024 ?auto_487027 ) ) ( not ( = ?auto_487025 ?auto_487026 ) ) ( not ( = ?auto_487025 ?auto_487027 ) ) ( not ( = ?auto_487026 ?auto_487027 ) ) ( ON ?auto_487025 ?auto_487026 ) ( ON ?auto_487024 ?auto_487025 ) ( ON ?auto_487023 ?auto_487024 ) ( ON ?auto_487022 ?auto_487023 ) ( ON ?auto_487021 ?auto_487022 ) ( ON ?auto_487020 ?auto_487021 ) ( ON ?auto_487019 ?auto_487020 ) ( ON ?auto_487018 ?auto_487019 ) ( CLEAR ?auto_487016 ) ( ON ?auto_487017 ?auto_487018 ) ( CLEAR ?auto_487017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_487014 ?auto_487015 ?auto_487016 ?auto_487017 )
      ( MAKE-13PILE ?auto_487014 ?auto_487015 ?auto_487016 ?auto_487017 ?auto_487018 ?auto_487019 ?auto_487020 ?auto_487021 ?auto_487022 ?auto_487023 ?auto_487024 ?auto_487025 ?auto_487026 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_487068 - BLOCK
      ?auto_487069 - BLOCK
      ?auto_487070 - BLOCK
      ?auto_487071 - BLOCK
      ?auto_487072 - BLOCK
      ?auto_487073 - BLOCK
      ?auto_487074 - BLOCK
      ?auto_487075 - BLOCK
      ?auto_487076 - BLOCK
      ?auto_487077 - BLOCK
      ?auto_487078 - BLOCK
      ?auto_487079 - BLOCK
      ?auto_487080 - BLOCK
    )
    :vars
    (
      ?auto_487081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487080 ?auto_487081 ) ( ON-TABLE ?auto_487068 ) ( ON ?auto_487069 ?auto_487068 ) ( not ( = ?auto_487068 ?auto_487069 ) ) ( not ( = ?auto_487068 ?auto_487070 ) ) ( not ( = ?auto_487068 ?auto_487071 ) ) ( not ( = ?auto_487068 ?auto_487072 ) ) ( not ( = ?auto_487068 ?auto_487073 ) ) ( not ( = ?auto_487068 ?auto_487074 ) ) ( not ( = ?auto_487068 ?auto_487075 ) ) ( not ( = ?auto_487068 ?auto_487076 ) ) ( not ( = ?auto_487068 ?auto_487077 ) ) ( not ( = ?auto_487068 ?auto_487078 ) ) ( not ( = ?auto_487068 ?auto_487079 ) ) ( not ( = ?auto_487068 ?auto_487080 ) ) ( not ( = ?auto_487068 ?auto_487081 ) ) ( not ( = ?auto_487069 ?auto_487070 ) ) ( not ( = ?auto_487069 ?auto_487071 ) ) ( not ( = ?auto_487069 ?auto_487072 ) ) ( not ( = ?auto_487069 ?auto_487073 ) ) ( not ( = ?auto_487069 ?auto_487074 ) ) ( not ( = ?auto_487069 ?auto_487075 ) ) ( not ( = ?auto_487069 ?auto_487076 ) ) ( not ( = ?auto_487069 ?auto_487077 ) ) ( not ( = ?auto_487069 ?auto_487078 ) ) ( not ( = ?auto_487069 ?auto_487079 ) ) ( not ( = ?auto_487069 ?auto_487080 ) ) ( not ( = ?auto_487069 ?auto_487081 ) ) ( not ( = ?auto_487070 ?auto_487071 ) ) ( not ( = ?auto_487070 ?auto_487072 ) ) ( not ( = ?auto_487070 ?auto_487073 ) ) ( not ( = ?auto_487070 ?auto_487074 ) ) ( not ( = ?auto_487070 ?auto_487075 ) ) ( not ( = ?auto_487070 ?auto_487076 ) ) ( not ( = ?auto_487070 ?auto_487077 ) ) ( not ( = ?auto_487070 ?auto_487078 ) ) ( not ( = ?auto_487070 ?auto_487079 ) ) ( not ( = ?auto_487070 ?auto_487080 ) ) ( not ( = ?auto_487070 ?auto_487081 ) ) ( not ( = ?auto_487071 ?auto_487072 ) ) ( not ( = ?auto_487071 ?auto_487073 ) ) ( not ( = ?auto_487071 ?auto_487074 ) ) ( not ( = ?auto_487071 ?auto_487075 ) ) ( not ( = ?auto_487071 ?auto_487076 ) ) ( not ( = ?auto_487071 ?auto_487077 ) ) ( not ( = ?auto_487071 ?auto_487078 ) ) ( not ( = ?auto_487071 ?auto_487079 ) ) ( not ( = ?auto_487071 ?auto_487080 ) ) ( not ( = ?auto_487071 ?auto_487081 ) ) ( not ( = ?auto_487072 ?auto_487073 ) ) ( not ( = ?auto_487072 ?auto_487074 ) ) ( not ( = ?auto_487072 ?auto_487075 ) ) ( not ( = ?auto_487072 ?auto_487076 ) ) ( not ( = ?auto_487072 ?auto_487077 ) ) ( not ( = ?auto_487072 ?auto_487078 ) ) ( not ( = ?auto_487072 ?auto_487079 ) ) ( not ( = ?auto_487072 ?auto_487080 ) ) ( not ( = ?auto_487072 ?auto_487081 ) ) ( not ( = ?auto_487073 ?auto_487074 ) ) ( not ( = ?auto_487073 ?auto_487075 ) ) ( not ( = ?auto_487073 ?auto_487076 ) ) ( not ( = ?auto_487073 ?auto_487077 ) ) ( not ( = ?auto_487073 ?auto_487078 ) ) ( not ( = ?auto_487073 ?auto_487079 ) ) ( not ( = ?auto_487073 ?auto_487080 ) ) ( not ( = ?auto_487073 ?auto_487081 ) ) ( not ( = ?auto_487074 ?auto_487075 ) ) ( not ( = ?auto_487074 ?auto_487076 ) ) ( not ( = ?auto_487074 ?auto_487077 ) ) ( not ( = ?auto_487074 ?auto_487078 ) ) ( not ( = ?auto_487074 ?auto_487079 ) ) ( not ( = ?auto_487074 ?auto_487080 ) ) ( not ( = ?auto_487074 ?auto_487081 ) ) ( not ( = ?auto_487075 ?auto_487076 ) ) ( not ( = ?auto_487075 ?auto_487077 ) ) ( not ( = ?auto_487075 ?auto_487078 ) ) ( not ( = ?auto_487075 ?auto_487079 ) ) ( not ( = ?auto_487075 ?auto_487080 ) ) ( not ( = ?auto_487075 ?auto_487081 ) ) ( not ( = ?auto_487076 ?auto_487077 ) ) ( not ( = ?auto_487076 ?auto_487078 ) ) ( not ( = ?auto_487076 ?auto_487079 ) ) ( not ( = ?auto_487076 ?auto_487080 ) ) ( not ( = ?auto_487076 ?auto_487081 ) ) ( not ( = ?auto_487077 ?auto_487078 ) ) ( not ( = ?auto_487077 ?auto_487079 ) ) ( not ( = ?auto_487077 ?auto_487080 ) ) ( not ( = ?auto_487077 ?auto_487081 ) ) ( not ( = ?auto_487078 ?auto_487079 ) ) ( not ( = ?auto_487078 ?auto_487080 ) ) ( not ( = ?auto_487078 ?auto_487081 ) ) ( not ( = ?auto_487079 ?auto_487080 ) ) ( not ( = ?auto_487079 ?auto_487081 ) ) ( not ( = ?auto_487080 ?auto_487081 ) ) ( ON ?auto_487079 ?auto_487080 ) ( ON ?auto_487078 ?auto_487079 ) ( ON ?auto_487077 ?auto_487078 ) ( ON ?auto_487076 ?auto_487077 ) ( ON ?auto_487075 ?auto_487076 ) ( ON ?auto_487074 ?auto_487075 ) ( ON ?auto_487073 ?auto_487074 ) ( ON ?auto_487072 ?auto_487073 ) ( ON ?auto_487071 ?auto_487072 ) ( CLEAR ?auto_487069 ) ( ON ?auto_487070 ?auto_487071 ) ( CLEAR ?auto_487070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_487068 ?auto_487069 ?auto_487070 )
      ( MAKE-13PILE ?auto_487068 ?auto_487069 ?auto_487070 ?auto_487071 ?auto_487072 ?auto_487073 ?auto_487074 ?auto_487075 ?auto_487076 ?auto_487077 ?auto_487078 ?auto_487079 ?auto_487080 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_487122 - BLOCK
      ?auto_487123 - BLOCK
      ?auto_487124 - BLOCK
      ?auto_487125 - BLOCK
      ?auto_487126 - BLOCK
      ?auto_487127 - BLOCK
      ?auto_487128 - BLOCK
      ?auto_487129 - BLOCK
      ?auto_487130 - BLOCK
      ?auto_487131 - BLOCK
      ?auto_487132 - BLOCK
      ?auto_487133 - BLOCK
      ?auto_487134 - BLOCK
    )
    :vars
    (
      ?auto_487135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487134 ?auto_487135 ) ( ON-TABLE ?auto_487122 ) ( not ( = ?auto_487122 ?auto_487123 ) ) ( not ( = ?auto_487122 ?auto_487124 ) ) ( not ( = ?auto_487122 ?auto_487125 ) ) ( not ( = ?auto_487122 ?auto_487126 ) ) ( not ( = ?auto_487122 ?auto_487127 ) ) ( not ( = ?auto_487122 ?auto_487128 ) ) ( not ( = ?auto_487122 ?auto_487129 ) ) ( not ( = ?auto_487122 ?auto_487130 ) ) ( not ( = ?auto_487122 ?auto_487131 ) ) ( not ( = ?auto_487122 ?auto_487132 ) ) ( not ( = ?auto_487122 ?auto_487133 ) ) ( not ( = ?auto_487122 ?auto_487134 ) ) ( not ( = ?auto_487122 ?auto_487135 ) ) ( not ( = ?auto_487123 ?auto_487124 ) ) ( not ( = ?auto_487123 ?auto_487125 ) ) ( not ( = ?auto_487123 ?auto_487126 ) ) ( not ( = ?auto_487123 ?auto_487127 ) ) ( not ( = ?auto_487123 ?auto_487128 ) ) ( not ( = ?auto_487123 ?auto_487129 ) ) ( not ( = ?auto_487123 ?auto_487130 ) ) ( not ( = ?auto_487123 ?auto_487131 ) ) ( not ( = ?auto_487123 ?auto_487132 ) ) ( not ( = ?auto_487123 ?auto_487133 ) ) ( not ( = ?auto_487123 ?auto_487134 ) ) ( not ( = ?auto_487123 ?auto_487135 ) ) ( not ( = ?auto_487124 ?auto_487125 ) ) ( not ( = ?auto_487124 ?auto_487126 ) ) ( not ( = ?auto_487124 ?auto_487127 ) ) ( not ( = ?auto_487124 ?auto_487128 ) ) ( not ( = ?auto_487124 ?auto_487129 ) ) ( not ( = ?auto_487124 ?auto_487130 ) ) ( not ( = ?auto_487124 ?auto_487131 ) ) ( not ( = ?auto_487124 ?auto_487132 ) ) ( not ( = ?auto_487124 ?auto_487133 ) ) ( not ( = ?auto_487124 ?auto_487134 ) ) ( not ( = ?auto_487124 ?auto_487135 ) ) ( not ( = ?auto_487125 ?auto_487126 ) ) ( not ( = ?auto_487125 ?auto_487127 ) ) ( not ( = ?auto_487125 ?auto_487128 ) ) ( not ( = ?auto_487125 ?auto_487129 ) ) ( not ( = ?auto_487125 ?auto_487130 ) ) ( not ( = ?auto_487125 ?auto_487131 ) ) ( not ( = ?auto_487125 ?auto_487132 ) ) ( not ( = ?auto_487125 ?auto_487133 ) ) ( not ( = ?auto_487125 ?auto_487134 ) ) ( not ( = ?auto_487125 ?auto_487135 ) ) ( not ( = ?auto_487126 ?auto_487127 ) ) ( not ( = ?auto_487126 ?auto_487128 ) ) ( not ( = ?auto_487126 ?auto_487129 ) ) ( not ( = ?auto_487126 ?auto_487130 ) ) ( not ( = ?auto_487126 ?auto_487131 ) ) ( not ( = ?auto_487126 ?auto_487132 ) ) ( not ( = ?auto_487126 ?auto_487133 ) ) ( not ( = ?auto_487126 ?auto_487134 ) ) ( not ( = ?auto_487126 ?auto_487135 ) ) ( not ( = ?auto_487127 ?auto_487128 ) ) ( not ( = ?auto_487127 ?auto_487129 ) ) ( not ( = ?auto_487127 ?auto_487130 ) ) ( not ( = ?auto_487127 ?auto_487131 ) ) ( not ( = ?auto_487127 ?auto_487132 ) ) ( not ( = ?auto_487127 ?auto_487133 ) ) ( not ( = ?auto_487127 ?auto_487134 ) ) ( not ( = ?auto_487127 ?auto_487135 ) ) ( not ( = ?auto_487128 ?auto_487129 ) ) ( not ( = ?auto_487128 ?auto_487130 ) ) ( not ( = ?auto_487128 ?auto_487131 ) ) ( not ( = ?auto_487128 ?auto_487132 ) ) ( not ( = ?auto_487128 ?auto_487133 ) ) ( not ( = ?auto_487128 ?auto_487134 ) ) ( not ( = ?auto_487128 ?auto_487135 ) ) ( not ( = ?auto_487129 ?auto_487130 ) ) ( not ( = ?auto_487129 ?auto_487131 ) ) ( not ( = ?auto_487129 ?auto_487132 ) ) ( not ( = ?auto_487129 ?auto_487133 ) ) ( not ( = ?auto_487129 ?auto_487134 ) ) ( not ( = ?auto_487129 ?auto_487135 ) ) ( not ( = ?auto_487130 ?auto_487131 ) ) ( not ( = ?auto_487130 ?auto_487132 ) ) ( not ( = ?auto_487130 ?auto_487133 ) ) ( not ( = ?auto_487130 ?auto_487134 ) ) ( not ( = ?auto_487130 ?auto_487135 ) ) ( not ( = ?auto_487131 ?auto_487132 ) ) ( not ( = ?auto_487131 ?auto_487133 ) ) ( not ( = ?auto_487131 ?auto_487134 ) ) ( not ( = ?auto_487131 ?auto_487135 ) ) ( not ( = ?auto_487132 ?auto_487133 ) ) ( not ( = ?auto_487132 ?auto_487134 ) ) ( not ( = ?auto_487132 ?auto_487135 ) ) ( not ( = ?auto_487133 ?auto_487134 ) ) ( not ( = ?auto_487133 ?auto_487135 ) ) ( not ( = ?auto_487134 ?auto_487135 ) ) ( ON ?auto_487133 ?auto_487134 ) ( ON ?auto_487132 ?auto_487133 ) ( ON ?auto_487131 ?auto_487132 ) ( ON ?auto_487130 ?auto_487131 ) ( ON ?auto_487129 ?auto_487130 ) ( ON ?auto_487128 ?auto_487129 ) ( ON ?auto_487127 ?auto_487128 ) ( ON ?auto_487126 ?auto_487127 ) ( ON ?auto_487125 ?auto_487126 ) ( ON ?auto_487124 ?auto_487125 ) ( CLEAR ?auto_487122 ) ( ON ?auto_487123 ?auto_487124 ) ( CLEAR ?auto_487123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_487122 ?auto_487123 )
      ( MAKE-13PILE ?auto_487122 ?auto_487123 ?auto_487124 ?auto_487125 ?auto_487126 ?auto_487127 ?auto_487128 ?auto_487129 ?auto_487130 ?auto_487131 ?auto_487132 ?auto_487133 ?auto_487134 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_487176 - BLOCK
      ?auto_487177 - BLOCK
      ?auto_487178 - BLOCK
      ?auto_487179 - BLOCK
      ?auto_487180 - BLOCK
      ?auto_487181 - BLOCK
      ?auto_487182 - BLOCK
      ?auto_487183 - BLOCK
      ?auto_487184 - BLOCK
      ?auto_487185 - BLOCK
      ?auto_487186 - BLOCK
      ?auto_487187 - BLOCK
      ?auto_487188 - BLOCK
    )
    :vars
    (
      ?auto_487189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487188 ?auto_487189 ) ( not ( = ?auto_487176 ?auto_487177 ) ) ( not ( = ?auto_487176 ?auto_487178 ) ) ( not ( = ?auto_487176 ?auto_487179 ) ) ( not ( = ?auto_487176 ?auto_487180 ) ) ( not ( = ?auto_487176 ?auto_487181 ) ) ( not ( = ?auto_487176 ?auto_487182 ) ) ( not ( = ?auto_487176 ?auto_487183 ) ) ( not ( = ?auto_487176 ?auto_487184 ) ) ( not ( = ?auto_487176 ?auto_487185 ) ) ( not ( = ?auto_487176 ?auto_487186 ) ) ( not ( = ?auto_487176 ?auto_487187 ) ) ( not ( = ?auto_487176 ?auto_487188 ) ) ( not ( = ?auto_487176 ?auto_487189 ) ) ( not ( = ?auto_487177 ?auto_487178 ) ) ( not ( = ?auto_487177 ?auto_487179 ) ) ( not ( = ?auto_487177 ?auto_487180 ) ) ( not ( = ?auto_487177 ?auto_487181 ) ) ( not ( = ?auto_487177 ?auto_487182 ) ) ( not ( = ?auto_487177 ?auto_487183 ) ) ( not ( = ?auto_487177 ?auto_487184 ) ) ( not ( = ?auto_487177 ?auto_487185 ) ) ( not ( = ?auto_487177 ?auto_487186 ) ) ( not ( = ?auto_487177 ?auto_487187 ) ) ( not ( = ?auto_487177 ?auto_487188 ) ) ( not ( = ?auto_487177 ?auto_487189 ) ) ( not ( = ?auto_487178 ?auto_487179 ) ) ( not ( = ?auto_487178 ?auto_487180 ) ) ( not ( = ?auto_487178 ?auto_487181 ) ) ( not ( = ?auto_487178 ?auto_487182 ) ) ( not ( = ?auto_487178 ?auto_487183 ) ) ( not ( = ?auto_487178 ?auto_487184 ) ) ( not ( = ?auto_487178 ?auto_487185 ) ) ( not ( = ?auto_487178 ?auto_487186 ) ) ( not ( = ?auto_487178 ?auto_487187 ) ) ( not ( = ?auto_487178 ?auto_487188 ) ) ( not ( = ?auto_487178 ?auto_487189 ) ) ( not ( = ?auto_487179 ?auto_487180 ) ) ( not ( = ?auto_487179 ?auto_487181 ) ) ( not ( = ?auto_487179 ?auto_487182 ) ) ( not ( = ?auto_487179 ?auto_487183 ) ) ( not ( = ?auto_487179 ?auto_487184 ) ) ( not ( = ?auto_487179 ?auto_487185 ) ) ( not ( = ?auto_487179 ?auto_487186 ) ) ( not ( = ?auto_487179 ?auto_487187 ) ) ( not ( = ?auto_487179 ?auto_487188 ) ) ( not ( = ?auto_487179 ?auto_487189 ) ) ( not ( = ?auto_487180 ?auto_487181 ) ) ( not ( = ?auto_487180 ?auto_487182 ) ) ( not ( = ?auto_487180 ?auto_487183 ) ) ( not ( = ?auto_487180 ?auto_487184 ) ) ( not ( = ?auto_487180 ?auto_487185 ) ) ( not ( = ?auto_487180 ?auto_487186 ) ) ( not ( = ?auto_487180 ?auto_487187 ) ) ( not ( = ?auto_487180 ?auto_487188 ) ) ( not ( = ?auto_487180 ?auto_487189 ) ) ( not ( = ?auto_487181 ?auto_487182 ) ) ( not ( = ?auto_487181 ?auto_487183 ) ) ( not ( = ?auto_487181 ?auto_487184 ) ) ( not ( = ?auto_487181 ?auto_487185 ) ) ( not ( = ?auto_487181 ?auto_487186 ) ) ( not ( = ?auto_487181 ?auto_487187 ) ) ( not ( = ?auto_487181 ?auto_487188 ) ) ( not ( = ?auto_487181 ?auto_487189 ) ) ( not ( = ?auto_487182 ?auto_487183 ) ) ( not ( = ?auto_487182 ?auto_487184 ) ) ( not ( = ?auto_487182 ?auto_487185 ) ) ( not ( = ?auto_487182 ?auto_487186 ) ) ( not ( = ?auto_487182 ?auto_487187 ) ) ( not ( = ?auto_487182 ?auto_487188 ) ) ( not ( = ?auto_487182 ?auto_487189 ) ) ( not ( = ?auto_487183 ?auto_487184 ) ) ( not ( = ?auto_487183 ?auto_487185 ) ) ( not ( = ?auto_487183 ?auto_487186 ) ) ( not ( = ?auto_487183 ?auto_487187 ) ) ( not ( = ?auto_487183 ?auto_487188 ) ) ( not ( = ?auto_487183 ?auto_487189 ) ) ( not ( = ?auto_487184 ?auto_487185 ) ) ( not ( = ?auto_487184 ?auto_487186 ) ) ( not ( = ?auto_487184 ?auto_487187 ) ) ( not ( = ?auto_487184 ?auto_487188 ) ) ( not ( = ?auto_487184 ?auto_487189 ) ) ( not ( = ?auto_487185 ?auto_487186 ) ) ( not ( = ?auto_487185 ?auto_487187 ) ) ( not ( = ?auto_487185 ?auto_487188 ) ) ( not ( = ?auto_487185 ?auto_487189 ) ) ( not ( = ?auto_487186 ?auto_487187 ) ) ( not ( = ?auto_487186 ?auto_487188 ) ) ( not ( = ?auto_487186 ?auto_487189 ) ) ( not ( = ?auto_487187 ?auto_487188 ) ) ( not ( = ?auto_487187 ?auto_487189 ) ) ( not ( = ?auto_487188 ?auto_487189 ) ) ( ON ?auto_487187 ?auto_487188 ) ( ON ?auto_487186 ?auto_487187 ) ( ON ?auto_487185 ?auto_487186 ) ( ON ?auto_487184 ?auto_487185 ) ( ON ?auto_487183 ?auto_487184 ) ( ON ?auto_487182 ?auto_487183 ) ( ON ?auto_487181 ?auto_487182 ) ( ON ?auto_487180 ?auto_487181 ) ( ON ?auto_487179 ?auto_487180 ) ( ON ?auto_487178 ?auto_487179 ) ( ON ?auto_487177 ?auto_487178 ) ( ON ?auto_487176 ?auto_487177 ) ( CLEAR ?auto_487176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_487176 )
      ( MAKE-13PILE ?auto_487176 ?auto_487177 ?auto_487178 ?auto_487179 ?auto_487180 ?auto_487181 ?auto_487182 ?auto_487183 ?auto_487184 ?auto_487185 ?auto_487186 ?auto_487187 ?auto_487188 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487231 - BLOCK
      ?auto_487232 - BLOCK
      ?auto_487233 - BLOCK
      ?auto_487234 - BLOCK
      ?auto_487235 - BLOCK
      ?auto_487236 - BLOCK
      ?auto_487237 - BLOCK
      ?auto_487238 - BLOCK
      ?auto_487239 - BLOCK
      ?auto_487240 - BLOCK
      ?auto_487241 - BLOCK
      ?auto_487242 - BLOCK
      ?auto_487243 - BLOCK
      ?auto_487244 - BLOCK
    )
    :vars
    (
      ?auto_487245 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_487243 ) ( ON ?auto_487244 ?auto_487245 ) ( CLEAR ?auto_487244 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_487231 ) ( ON ?auto_487232 ?auto_487231 ) ( ON ?auto_487233 ?auto_487232 ) ( ON ?auto_487234 ?auto_487233 ) ( ON ?auto_487235 ?auto_487234 ) ( ON ?auto_487236 ?auto_487235 ) ( ON ?auto_487237 ?auto_487236 ) ( ON ?auto_487238 ?auto_487237 ) ( ON ?auto_487239 ?auto_487238 ) ( ON ?auto_487240 ?auto_487239 ) ( ON ?auto_487241 ?auto_487240 ) ( ON ?auto_487242 ?auto_487241 ) ( ON ?auto_487243 ?auto_487242 ) ( not ( = ?auto_487231 ?auto_487232 ) ) ( not ( = ?auto_487231 ?auto_487233 ) ) ( not ( = ?auto_487231 ?auto_487234 ) ) ( not ( = ?auto_487231 ?auto_487235 ) ) ( not ( = ?auto_487231 ?auto_487236 ) ) ( not ( = ?auto_487231 ?auto_487237 ) ) ( not ( = ?auto_487231 ?auto_487238 ) ) ( not ( = ?auto_487231 ?auto_487239 ) ) ( not ( = ?auto_487231 ?auto_487240 ) ) ( not ( = ?auto_487231 ?auto_487241 ) ) ( not ( = ?auto_487231 ?auto_487242 ) ) ( not ( = ?auto_487231 ?auto_487243 ) ) ( not ( = ?auto_487231 ?auto_487244 ) ) ( not ( = ?auto_487231 ?auto_487245 ) ) ( not ( = ?auto_487232 ?auto_487233 ) ) ( not ( = ?auto_487232 ?auto_487234 ) ) ( not ( = ?auto_487232 ?auto_487235 ) ) ( not ( = ?auto_487232 ?auto_487236 ) ) ( not ( = ?auto_487232 ?auto_487237 ) ) ( not ( = ?auto_487232 ?auto_487238 ) ) ( not ( = ?auto_487232 ?auto_487239 ) ) ( not ( = ?auto_487232 ?auto_487240 ) ) ( not ( = ?auto_487232 ?auto_487241 ) ) ( not ( = ?auto_487232 ?auto_487242 ) ) ( not ( = ?auto_487232 ?auto_487243 ) ) ( not ( = ?auto_487232 ?auto_487244 ) ) ( not ( = ?auto_487232 ?auto_487245 ) ) ( not ( = ?auto_487233 ?auto_487234 ) ) ( not ( = ?auto_487233 ?auto_487235 ) ) ( not ( = ?auto_487233 ?auto_487236 ) ) ( not ( = ?auto_487233 ?auto_487237 ) ) ( not ( = ?auto_487233 ?auto_487238 ) ) ( not ( = ?auto_487233 ?auto_487239 ) ) ( not ( = ?auto_487233 ?auto_487240 ) ) ( not ( = ?auto_487233 ?auto_487241 ) ) ( not ( = ?auto_487233 ?auto_487242 ) ) ( not ( = ?auto_487233 ?auto_487243 ) ) ( not ( = ?auto_487233 ?auto_487244 ) ) ( not ( = ?auto_487233 ?auto_487245 ) ) ( not ( = ?auto_487234 ?auto_487235 ) ) ( not ( = ?auto_487234 ?auto_487236 ) ) ( not ( = ?auto_487234 ?auto_487237 ) ) ( not ( = ?auto_487234 ?auto_487238 ) ) ( not ( = ?auto_487234 ?auto_487239 ) ) ( not ( = ?auto_487234 ?auto_487240 ) ) ( not ( = ?auto_487234 ?auto_487241 ) ) ( not ( = ?auto_487234 ?auto_487242 ) ) ( not ( = ?auto_487234 ?auto_487243 ) ) ( not ( = ?auto_487234 ?auto_487244 ) ) ( not ( = ?auto_487234 ?auto_487245 ) ) ( not ( = ?auto_487235 ?auto_487236 ) ) ( not ( = ?auto_487235 ?auto_487237 ) ) ( not ( = ?auto_487235 ?auto_487238 ) ) ( not ( = ?auto_487235 ?auto_487239 ) ) ( not ( = ?auto_487235 ?auto_487240 ) ) ( not ( = ?auto_487235 ?auto_487241 ) ) ( not ( = ?auto_487235 ?auto_487242 ) ) ( not ( = ?auto_487235 ?auto_487243 ) ) ( not ( = ?auto_487235 ?auto_487244 ) ) ( not ( = ?auto_487235 ?auto_487245 ) ) ( not ( = ?auto_487236 ?auto_487237 ) ) ( not ( = ?auto_487236 ?auto_487238 ) ) ( not ( = ?auto_487236 ?auto_487239 ) ) ( not ( = ?auto_487236 ?auto_487240 ) ) ( not ( = ?auto_487236 ?auto_487241 ) ) ( not ( = ?auto_487236 ?auto_487242 ) ) ( not ( = ?auto_487236 ?auto_487243 ) ) ( not ( = ?auto_487236 ?auto_487244 ) ) ( not ( = ?auto_487236 ?auto_487245 ) ) ( not ( = ?auto_487237 ?auto_487238 ) ) ( not ( = ?auto_487237 ?auto_487239 ) ) ( not ( = ?auto_487237 ?auto_487240 ) ) ( not ( = ?auto_487237 ?auto_487241 ) ) ( not ( = ?auto_487237 ?auto_487242 ) ) ( not ( = ?auto_487237 ?auto_487243 ) ) ( not ( = ?auto_487237 ?auto_487244 ) ) ( not ( = ?auto_487237 ?auto_487245 ) ) ( not ( = ?auto_487238 ?auto_487239 ) ) ( not ( = ?auto_487238 ?auto_487240 ) ) ( not ( = ?auto_487238 ?auto_487241 ) ) ( not ( = ?auto_487238 ?auto_487242 ) ) ( not ( = ?auto_487238 ?auto_487243 ) ) ( not ( = ?auto_487238 ?auto_487244 ) ) ( not ( = ?auto_487238 ?auto_487245 ) ) ( not ( = ?auto_487239 ?auto_487240 ) ) ( not ( = ?auto_487239 ?auto_487241 ) ) ( not ( = ?auto_487239 ?auto_487242 ) ) ( not ( = ?auto_487239 ?auto_487243 ) ) ( not ( = ?auto_487239 ?auto_487244 ) ) ( not ( = ?auto_487239 ?auto_487245 ) ) ( not ( = ?auto_487240 ?auto_487241 ) ) ( not ( = ?auto_487240 ?auto_487242 ) ) ( not ( = ?auto_487240 ?auto_487243 ) ) ( not ( = ?auto_487240 ?auto_487244 ) ) ( not ( = ?auto_487240 ?auto_487245 ) ) ( not ( = ?auto_487241 ?auto_487242 ) ) ( not ( = ?auto_487241 ?auto_487243 ) ) ( not ( = ?auto_487241 ?auto_487244 ) ) ( not ( = ?auto_487241 ?auto_487245 ) ) ( not ( = ?auto_487242 ?auto_487243 ) ) ( not ( = ?auto_487242 ?auto_487244 ) ) ( not ( = ?auto_487242 ?auto_487245 ) ) ( not ( = ?auto_487243 ?auto_487244 ) ) ( not ( = ?auto_487243 ?auto_487245 ) ) ( not ( = ?auto_487244 ?auto_487245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_487244 ?auto_487245 )
      ( !STACK ?auto_487244 ?auto_487243 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487289 - BLOCK
      ?auto_487290 - BLOCK
      ?auto_487291 - BLOCK
      ?auto_487292 - BLOCK
      ?auto_487293 - BLOCK
      ?auto_487294 - BLOCK
      ?auto_487295 - BLOCK
      ?auto_487296 - BLOCK
      ?auto_487297 - BLOCK
      ?auto_487298 - BLOCK
      ?auto_487299 - BLOCK
      ?auto_487300 - BLOCK
      ?auto_487301 - BLOCK
      ?auto_487302 - BLOCK
    )
    :vars
    (
      ?auto_487303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487302 ?auto_487303 ) ( ON-TABLE ?auto_487289 ) ( ON ?auto_487290 ?auto_487289 ) ( ON ?auto_487291 ?auto_487290 ) ( ON ?auto_487292 ?auto_487291 ) ( ON ?auto_487293 ?auto_487292 ) ( ON ?auto_487294 ?auto_487293 ) ( ON ?auto_487295 ?auto_487294 ) ( ON ?auto_487296 ?auto_487295 ) ( ON ?auto_487297 ?auto_487296 ) ( ON ?auto_487298 ?auto_487297 ) ( ON ?auto_487299 ?auto_487298 ) ( ON ?auto_487300 ?auto_487299 ) ( not ( = ?auto_487289 ?auto_487290 ) ) ( not ( = ?auto_487289 ?auto_487291 ) ) ( not ( = ?auto_487289 ?auto_487292 ) ) ( not ( = ?auto_487289 ?auto_487293 ) ) ( not ( = ?auto_487289 ?auto_487294 ) ) ( not ( = ?auto_487289 ?auto_487295 ) ) ( not ( = ?auto_487289 ?auto_487296 ) ) ( not ( = ?auto_487289 ?auto_487297 ) ) ( not ( = ?auto_487289 ?auto_487298 ) ) ( not ( = ?auto_487289 ?auto_487299 ) ) ( not ( = ?auto_487289 ?auto_487300 ) ) ( not ( = ?auto_487289 ?auto_487301 ) ) ( not ( = ?auto_487289 ?auto_487302 ) ) ( not ( = ?auto_487289 ?auto_487303 ) ) ( not ( = ?auto_487290 ?auto_487291 ) ) ( not ( = ?auto_487290 ?auto_487292 ) ) ( not ( = ?auto_487290 ?auto_487293 ) ) ( not ( = ?auto_487290 ?auto_487294 ) ) ( not ( = ?auto_487290 ?auto_487295 ) ) ( not ( = ?auto_487290 ?auto_487296 ) ) ( not ( = ?auto_487290 ?auto_487297 ) ) ( not ( = ?auto_487290 ?auto_487298 ) ) ( not ( = ?auto_487290 ?auto_487299 ) ) ( not ( = ?auto_487290 ?auto_487300 ) ) ( not ( = ?auto_487290 ?auto_487301 ) ) ( not ( = ?auto_487290 ?auto_487302 ) ) ( not ( = ?auto_487290 ?auto_487303 ) ) ( not ( = ?auto_487291 ?auto_487292 ) ) ( not ( = ?auto_487291 ?auto_487293 ) ) ( not ( = ?auto_487291 ?auto_487294 ) ) ( not ( = ?auto_487291 ?auto_487295 ) ) ( not ( = ?auto_487291 ?auto_487296 ) ) ( not ( = ?auto_487291 ?auto_487297 ) ) ( not ( = ?auto_487291 ?auto_487298 ) ) ( not ( = ?auto_487291 ?auto_487299 ) ) ( not ( = ?auto_487291 ?auto_487300 ) ) ( not ( = ?auto_487291 ?auto_487301 ) ) ( not ( = ?auto_487291 ?auto_487302 ) ) ( not ( = ?auto_487291 ?auto_487303 ) ) ( not ( = ?auto_487292 ?auto_487293 ) ) ( not ( = ?auto_487292 ?auto_487294 ) ) ( not ( = ?auto_487292 ?auto_487295 ) ) ( not ( = ?auto_487292 ?auto_487296 ) ) ( not ( = ?auto_487292 ?auto_487297 ) ) ( not ( = ?auto_487292 ?auto_487298 ) ) ( not ( = ?auto_487292 ?auto_487299 ) ) ( not ( = ?auto_487292 ?auto_487300 ) ) ( not ( = ?auto_487292 ?auto_487301 ) ) ( not ( = ?auto_487292 ?auto_487302 ) ) ( not ( = ?auto_487292 ?auto_487303 ) ) ( not ( = ?auto_487293 ?auto_487294 ) ) ( not ( = ?auto_487293 ?auto_487295 ) ) ( not ( = ?auto_487293 ?auto_487296 ) ) ( not ( = ?auto_487293 ?auto_487297 ) ) ( not ( = ?auto_487293 ?auto_487298 ) ) ( not ( = ?auto_487293 ?auto_487299 ) ) ( not ( = ?auto_487293 ?auto_487300 ) ) ( not ( = ?auto_487293 ?auto_487301 ) ) ( not ( = ?auto_487293 ?auto_487302 ) ) ( not ( = ?auto_487293 ?auto_487303 ) ) ( not ( = ?auto_487294 ?auto_487295 ) ) ( not ( = ?auto_487294 ?auto_487296 ) ) ( not ( = ?auto_487294 ?auto_487297 ) ) ( not ( = ?auto_487294 ?auto_487298 ) ) ( not ( = ?auto_487294 ?auto_487299 ) ) ( not ( = ?auto_487294 ?auto_487300 ) ) ( not ( = ?auto_487294 ?auto_487301 ) ) ( not ( = ?auto_487294 ?auto_487302 ) ) ( not ( = ?auto_487294 ?auto_487303 ) ) ( not ( = ?auto_487295 ?auto_487296 ) ) ( not ( = ?auto_487295 ?auto_487297 ) ) ( not ( = ?auto_487295 ?auto_487298 ) ) ( not ( = ?auto_487295 ?auto_487299 ) ) ( not ( = ?auto_487295 ?auto_487300 ) ) ( not ( = ?auto_487295 ?auto_487301 ) ) ( not ( = ?auto_487295 ?auto_487302 ) ) ( not ( = ?auto_487295 ?auto_487303 ) ) ( not ( = ?auto_487296 ?auto_487297 ) ) ( not ( = ?auto_487296 ?auto_487298 ) ) ( not ( = ?auto_487296 ?auto_487299 ) ) ( not ( = ?auto_487296 ?auto_487300 ) ) ( not ( = ?auto_487296 ?auto_487301 ) ) ( not ( = ?auto_487296 ?auto_487302 ) ) ( not ( = ?auto_487296 ?auto_487303 ) ) ( not ( = ?auto_487297 ?auto_487298 ) ) ( not ( = ?auto_487297 ?auto_487299 ) ) ( not ( = ?auto_487297 ?auto_487300 ) ) ( not ( = ?auto_487297 ?auto_487301 ) ) ( not ( = ?auto_487297 ?auto_487302 ) ) ( not ( = ?auto_487297 ?auto_487303 ) ) ( not ( = ?auto_487298 ?auto_487299 ) ) ( not ( = ?auto_487298 ?auto_487300 ) ) ( not ( = ?auto_487298 ?auto_487301 ) ) ( not ( = ?auto_487298 ?auto_487302 ) ) ( not ( = ?auto_487298 ?auto_487303 ) ) ( not ( = ?auto_487299 ?auto_487300 ) ) ( not ( = ?auto_487299 ?auto_487301 ) ) ( not ( = ?auto_487299 ?auto_487302 ) ) ( not ( = ?auto_487299 ?auto_487303 ) ) ( not ( = ?auto_487300 ?auto_487301 ) ) ( not ( = ?auto_487300 ?auto_487302 ) ) ( not ( = ?auto_487300 ?auto_487303 ) ) ( not ( = ?auto_487301 ?auto_487302 ) ) ( not ( = ?auto_487301 ?auto_487303 ) ) ( not ( = ?auto_487302 ?auto_487303 ) ) ( CLEAR ?auto_487300 ) ( ON ?auto_487301 ?auto_487302 ) ( CLEAR ?auto_487301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_487289 ?auto_487290 ?auto_487291 ?auto_487292 ?auto_487293 ?auto_487294 ?auto_487295 ?auto_487296 ?auto_487297 ?auto_487298 ?auto_487299 ?auto_487300 ?auto_487301 )
      ( MAKE-14PILE ?auto_487289 ?auto_487290 ?auto_487291 ?auto_487292 ?auto_487293 ?auto_487294 ?auto_487295 ?auto_487296 ?auto_487297 ?auto_487298 ?auto_487299 ?auto_487300 ?auto_487301 ?auto_487302 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487347 - BLOCK
      ?auto_487348 - BLOCK
      ?auto_487349 - BLOCK
      ?auto_487350 - BLOCK
      ?auto_487351 - BLOCK
      ?auto_487352 - BLOCK
      ?auto_487353 - BLOCK
      ?auto_487354 - BLOCK
      ?auto_487355 - BLOCK
      ?auto_487356 - BLOCK
      ?auto_487357 - BLOCK
      ?auto_487358 - BLOCK
      ?auto_487359 - BLOCK
      ?auto_487360 - BLOCK
    )
    :vars
    (
      ?auto_487361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487360 ?auto_487361 ) ( ON-TABLE ?auto_487347 ) ( ON ?auto_487348 ?auto_487347 ) ( ON ?auto_487349 ?auto_487348 ) ( ON ?auto_487350 ?auto_487349 ) ( ON ?auto_487351 ?auto_487350 ) ( ON ?auto_487352 ?auto_487351 ) ( ON ?auto_487353 ?auto_487352 ) ( ON ?auto_487354 ?auto_487353 ) ( ON ?auto_487355 ?auto_487354 ) ( ON ?auto_487356 ?auto_487355 ) ( ON ?auto_487357 ?auto_487356 ) ( not ( = ?auto_487347 ?auto_487348 ) ) ( not ( = ?auto_487347 ?auto_487349 ) ) ( not ( = ?auto_487347 ?auto_487350 ) ) ( not ( = ?auto_487347 ?auto_487351 ) ) ( not ( = ?auto_487347 ?auto_487352 ) ) ( not ( = ?auto_487347 ?auto_487353 ) ) ( not ( = ?auto_487347 ?auto_487354 ) ) ( not ( = ?auto_487347 ?auto_487355 ) ) ( not ( = ?auto_487347 ?auto_487356 ) ) ( not ( = ?auto_487347 ?auto_487357 ) ) ( not ( = ?auto_487347 ?auto_487358 ) ) ( not ( = ?auto_487347 ?auto_487359 ) ) ( not ( = ?auto_487347 ?auto_487360 ) ) ( not ( = ?auto_487347 ?auto_487361 ) ) ( not ( = ?auto_487348 ?auto_487349 ) ) ( not ( = ?auto_487348 ?auto_487350 ) ) ( not ( = ?auto_487348 ?auto_487351 ) ) ( not ( = ?auto_487348 ?auto_487352 ) ) ( not ( = ?auto_487348 ?auto_487353 ) ) ( not ( = ?auto_487348 ?auto_487354 ) ) ( not ( = ?auto_487348 ?auto_487355 ) ) ( not ( = ?auto_487348 ?auto_487356 ) ) ( not ( = ?auto_487348 ?auto_487357 ) ) ( not ( = ?auto_487348 ?auto_487358 ) ) ( not ( = ?auto_487348 ?auto_487359 ) ) ( not ( = ?auto_487348 ?auto_487360 ) ) ( not ( = ?auto_487348 ?auto_487361 ) ) ( not ( = ?auto_487349 ?auto_487350 ) ) ( not ( = ?auto_487349 ?auto_487351 ) ) ( not ( = ?auto_487349 ?auto_487352 ) ) ( not ( = ?auto_487349 ?auto_487353 ) ) ( not ( = ?auto_487349 ?auto_487354 ) ) ( not ( = ?auto_487349 ?auto_487355 ) ) ( not ( = ?auto_487349 ?auto_487356 ) ) ( not ( = ?auto_487349 ?auto_487357 ) ) ( not ( = ?auto_487349 ?auto_487358 ) ) ( not ( = ?auto_487349 ?auto_487359 ) ) ( not ( = ?auto_487349 ?auto_487360 ) ) ( not ( = ?auto_487349 ?auto_487361 ) ) ( not ( = ?auto_487350 ?auto_487351 ) ) ( not ( = ?auto_487350 ?auto_487352 ) ) ( not ( = ?auto_487350 ?auto_487353 ) ) ( not ( = ?auto_487350 ?auto_487354 ) ) ( not ( = ?auto_487350 ?auto_487355 ) ) ( not ( = ?auto_487350 ?auto_487356 ) ) ( not ( = ?auto_487350 ?auto_487357 ) ) ( not ( = ?auto_487350 ?auto_487358 ) ) ( not ( = ?auto_487350 ?auto_487359 ) ) ( not ( = ?auto_487350 ?auto_487360 ) ) ( not ( = ?auto_487350 ?auto_487361 ) ) ( not ( = ?auto_487351 ?auto_487352 ) ) ( not ( = ?auto_487351 ?auto_487353 ) ) ( not ( = ?auto_487351 ?auto_487354 ) ) ( not ( = ?auto_487351 ?auto_487355 ) ) ( not ( = ?auto_487351 ?auto_487356 ) ) ( not ( = ?auto_487351 ?auto_487357 ) ) ( not ( = ?auto_487351 ?auto_487358 ) ) ( not ( = ?auto_487351 ?auto_487359 ) ) ( not ( = ?auto_487351 ?auto_487360 ) ) ( not ( = ?auto_487351 ?auto_487361 ) ) ( not ( = ?auto_487352 ?auto_487353 ) ) ( not ( = ?auto_487352 ?auto_487354 ) ) ( not ( = ?auto_487352 ?auto_487355 ) ) ( not ( = ?auto_487352 ?auto_487356 ) ) ( not ( = ?auto_487352 ?auto_487357 ) ) ( not ( = ?auto_487352 ?auto_487358 ) ) ( not ( = ?auto_487352 ?auto_487359 ) ) ( not ( = ?auto_487352 ?auto_487360 ) ) ( not ( = ?auto_487352 ?auto_487361 ) ) ( not ( = ?auto_487353 ?auto_487354 ) ) ( not ( = ?auto_487353 ?auto_487355 ) ) ( not ( = ?auto_487353 ?auto_487356 ) ) ( not ( = ?auto_487353 ?auto_487357 ) ) ( not ( = ?auto_487353 ?auto_487358 ) ) ( not ( = ?auto_487353 ?auto_487359 ) ) ( not ( = ?auto_487353 ?auto_487360 ) ) ( not ( = ?auto_487353 ?auto_487361 ) ) ( not ( = ?auto_487354 ?auto_487355 ) ) ( not ( = ?auto_487354 ?auto_487356 ) ) ( not ( = ?auto_487354 ?auto_487357 ) ) ( not ( = ?auto_487354 ?auto_487358 ) ) ( not ( = ?auto_487354 ?auto_487359 ) ) ( not ( = ?auto_487354 ?auto_487360 ) ) ( not ( = ?auto_487354 ?auto_487361 ) ) ( not ( = ?auto_487355 ?auto_487356 ) ) ( not ( = ?auto_487355 ?auto_487357 ) ) ( not ( = ?auto_487355 ?auto_487358 ) ) ( not ( = ?auto_487355 ?auto_487359 ) ) ( not ( = ?auto_487355 ?auto_487360 ) ) ( not ( = ?auto_487355 ?auto_487361 ) ) ( not ( = ?auto_487356 ?auto_487357 ) ) ( not ( = ?auto_487356 ?auto_487358 ) ) ( not ( = ?auto_487356 ?auto_487359 ) ) ( not ( = ?auto_487356 ?auto_487360 ) ) ( not ( = ?auto_487356 ?auto_487361 ) ) ( not ( = ?auto_487357 ?auto_487358 ) ) ( not ( = ?auto_487357 ?auto_487359 ) ) ( not ( = ?auto_487357 ?auto_487360 ) ) ( not ( = ?auto_487357 ?auto_487361 ) ) ( not ( = ?auto_487358 ?auto_487359 ) ) ( not ( = ?auto_487358 ?auto_487360 ) ) ( not ( = ?auto_487358 ?auto_487361 ) ) ( not ( = ?auto_487359 ?auto_487360 ) ) ( not ( = ?auto_487359 ?auto_487361 ) ) ( not ( = ?auto_487360 ?auto_487361 ) ) ( ON ?auto_487359 ?auto_487360 ) ( CLEAR ?auto_487357 ) ( ON ?auto_487358 ?auto_487359 ) ( CLEAR ?auto_487358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_487347 ?auto_487348 ?auto_487349 ?auto_487350 ?auto_487351 ?auto_487352 ?auto_487353 ?auto_487354 ?auto_487355 ?auto_487356 ?auto_487357 ?auto_487358 )
      ( MAKE-14PILE ?auto_487347 ?auto_487348 ?auto_487349 ?auto_487350 ?auto_487351 ?auto_487352 ?auto_487353 ?auto_487354 ?auto_487355 ?auto_487356 ?auto_487357 ?auto_487358 ?auto_487359 ?auto_487360 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487405 - BLOCK
      ?auto_487406 - BLOCK
      ?auto_487407 - BLOCK
      ?auto_487408 - BLOCK
      ?auto_487409 - BLOCK
      ?auto_487410 - BLOCK
      ?auto_487411 - BLOCK
      ?auto_487412 - BLOCK
      ?auto_487413 - BLOCK
      ?auto_487414 - BLOCK
      ?auto_487415 - BLOCK
      ?auto_487416 - BLOCK
      ?auto_487417 - BLOCK
      ?auto_487418 - BLOCK
    )
    :vars
    (
      ?auto_487419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487418 ?auto_487419 ) ( ON-TABLE ?auto_487405 ) ( ON ?auto_487406 ?auto_487405 ) ( ON ?auto_487407 ?auto_487406 ) ( ON ?auto_487408 ?auto_487407 ) ( ON ?auto_487409 ?auto_487408 ) ( ON ?auto_487410 ?auto_487409 ) ( ON ?auto_487411 ?auto_487410 ) ( ON ?auto_487412 ?auto_487411 ) ( ON ?auto_487413 ?auto_487412 ) ( ON ?auto_487414 ?auto_487413 ) ( not ( = ?auto_487405 ?auto_487406 ) ) ( not ( = ?auto_487405 ?auto_487407 ) ) ( not ( = ?auto_487405 ?auto_487408 ) ) ( not ( = ?auto_487405 ?auto_487409 ) ) ( not ( = ?auto_487405 ?auto_487410 ) ) ( not ( = ?auto_487405 ?auto_487411 ) ) ( not ( = ?auto_487405 ?auto_487412 ) ) ( not ( = ?auto_487405 ?auto_487413 ) ) ( not ( = ?auto_487405 ?auto_487414 ) ) ( not ( = ?auto_487405 ?auto_487415 ) ) ( not ( = ?auto_487405 ?auto_487416 ) ) ( not ( = ?auto_487405 ?auto_487417 ) ) ( not ( = ?auto_487405 ?auto_487418 ) ) ( not ( = ?auto_487405 ?auto_487419 ) ) ( not ( = ?auto_487406 ?auto_487407 ) ) ( not ( = ?auto_487406 ?auto_487408 ) ) ( not ( = ?auto_487406 ?auto_487409 ) ) ( not ( = ?auto_487406 ?auto_487410 ) ) ( not ( = ?auto_487406 ?auto_487411 ) ) ( not ( = ?auto_487406 ?auto_487412 ) ) ( not ( = ?auto_487406 ?auto_487413 ) ) ( not ( = ?auto_487406 ?auto_487414 ) ) ( not ( = ?auto_487406 ?auto_487415 ) ) ( not ( = ?auto_487406 ?auto_487416 ) ) ( not ( = ?auto_487406 ?auto_487417 ) ) ( not ( = ?auto_487406 ?auto_487418 ) ) ( not ( = ?auto_487406 ?auto_487419 ) ) ( not ( = ?auto_487407 ?auto_487408 ) ) ( not ( = ?auto_487407 ?auto_487409 ) ) ( not ( = ?auto_487407 ?auto_487410 ) ) ( not ( = ?auto_487407 ?auto_487411 ) ) ( not ( = ?auto_487407 ?auto_487412 ) ) ( not ( = ?auto_487407 ?auto_487413 ) ) ( not ( = ?auto_487407 ?auto_487414 ) ) ( not ( = ?auto_487407 ?auto_487415 ) ) ( not ( = ?auto_487407 ?auto_487416 ) ) ( not ( = ?auto_487407 ?auto_487417 ) ) ( not ( = ?auto_487407 ?auto_487418 ) ) ( not ( = ?auto_487407 ?auto_487419 ) ) ( not ( = ?auto_487408 ?auto_487409 ) ) ( not ( = ?auto_487408 ?auto_487410 ) ) ( not ( = ?auto_487408 ?auto_487411 ) ) ( not ( = ?auto_487408 ?auto_487412 ) ) ( not ( = ?auto_487408 ?auto_487413 ) ) ( not ( = ?auto_487408 ?auto_487414 ) ) ( not ( = ?auto_487408 ?auto_487415 ) ) ( not ( = ?auto_487408 ?auto_487416 ) ) ( not ( = ?auto_487408 ?auto_487417 ) ) ( not ( = ?auto_487408 ?auto_487418 ) ) ( not ( = ?auto_487408 ?auto_487419 ) ) ( not ( = ?auto_487409 ?auto_487410 ) ) ( not ( = ?auto_487409 ?auto_487411 ) ) ( not ( = ?auto_487409 ?auto_487412 ) ) ( not ( = ?auto_487409 ?auto_487413 ) ) ( not ( = ?auto_487409 ?auto_487414 ) ) ( not ( = ?auto_487409 ?auto_487415 ) ) ( not ( = ?auto_487409 ?auto_487416 ) ) ( not ( = ?auto_487409 ?auto_487417 ) ) ( not ( = ?auto_487409 ?auto_487418 ) ) ( not ( = ?auto_487409 ?auto_487419 ) ) ( not ( = ?auto_487410 ?auto_487411 ) ) ( not ( = ?auto_487410 ?auto_487412 ) ) ( not ( = ?auto_487410 ?auto_487413 ) ) ( not ( = ?auto_487410 ?auto_487414 ) ) ( not ( = ?auto_487410 ?auto_487415 ) ) ( not ( = ?auto_487410 ?auto_487416 ) ) ( not ( = ?auto_487410 ?auto_487417 ) ) ( not ( = ?auto_487410 ?auto_487418 ) ) ( not ( = ?auto_487410 ?auto_487419 ) ) ( not ( = ?auto_487411 ?auto_487412 ) ) ( not ( = ?auto_487411 ?auto_487413 ) ) ( not ( = ?auto_487411 ?auto_487414 ) ) ( not ( = ?auto_487411 ?auto_487415 ) ) ( not ( = ?auto_487411 ?auto_487416 ) ) ( not ( = ?auto_487411 ?auto_487417 ) ) ( not ( = ?auto_487411 ?auto_487418 ) ) ( not ( = ?auto_487411 ?auto_487419 ) ) ( not ( = ?auto_487412 ?auto_487413 ) ) ( not ( = ?auto_487412 ?auto_487414 ) ) ( not ( = ?auto_487412 ?auto_487415 ) ) ( not ( = ?auto_487412 ?auto_487416 ) ) ( not ( = ?auto_487412 ?auto_487417 ) ) ( not ( = ?auto_487412 ?auto_487418 ) ) ( not ( = ?auto_487412 ?auto_487419 ) ) ( not ( = ?auto_487413 ?auto_487414 ) ) ( not ( = ?auto_487413 ?auto_487415 ) ) ( not ( = ?auto_487413 ?auto_487416 ) ) ( not ( = ?auto_487413 ?auto_487417 ) ) ( not ( = ?auto_487413 ?auto_487418 ) ) ( not ( = ?auto_487413 ?auto_487419 ) ) ( not ( = ?auto_487414 ?auto_487415 ) ) ( not ( = ?auto_487414 ?auto_487416 ) ) ( not ( = ?auto_487414 ?auto_487417 ) ) ( not ( = ?auto_487414 ?auto_487418 ) ) ( not ( = ?auto_487414 ?auto_487419 ) ) ( not ( = ?auto_487415 ?auto_487416 ) ) ( not ( = ?auto_487415 ?auto_487417 ) ) ( not ( = ?auto_487415 ?auto_487418 ) ) ( not ( = ?auto_487415 ?auto_487419 ) ) ( not ( = ?auto_487416 ?auto_487417 ) ) ( not ( = ?auto_487416 ?auto_487418 ) ) ( not ( = ?auto_487416 ?auto_487419 ) ) ( not ( = ?auto_487417 ?auto_487418 ) ) ( not ( = ?auto_487417 ?auto_487419 ) ) ( not ( = ?auto_487418 ?auto_487419 ) ) ( ON ?auto_487417 ?auto_487418 ) ( ON ?auto_487416 ?auto_487417 ) ( CLEAR ?auto_487414 ) ( ON ?auto_487415 ?auto_487416 ) ( CLEAR ?auto_487415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_487405 ?auto_487406 ?auto_487407 ?auto_487408 ?auto_487409 ?auto_487410 ?auto_487411 ?auto_487412 ?auto_487413 ?auto_487414 ?auto_487415 )
      ( MAKE-14PILE ?auto_487405 ?auto_487406 ?auto_487407 ?auto_487408 ?auto_487409 ?auto_487410 ?auto_487411 ?auto_487412 ?auto_487413 ?auto_487414 ?auto_487415 ?auto_487416 ?auto_487417 ?auto_487418 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487463 - BLOCK
      ?auto_487464 - BLOCK
      ?auto_487465 - BLOCK
      ?auto_487466 - BLOCK
      ?auto_487467 - BLOCK
      ?auto_487468 - BLOCK
      ?auto_487469 - BLOCK
      ?auto_487470 - BLOCK
      ?auto_487471 - BLOCK
      ?auto_487472 - BLOCK
      ?auto_487473 - BLOCK
      ?auto_487474 - BLOCK
      ?auto_487475 - BLOCK
      ?auto_487476 - BLOCK
    )
    :vars
    (
      ?auto_487477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487476 ?auto_487477 ) ( ON-TABLE ?auto_487463 ) ( ON ?auto_487464 ?auto_487463 ) ( ON ?auto_487465 ?auto_487464 ) ( ON ?auto_487466 ?auto_487465 ) ( ON ?auto_487467 ?auto_487466 ) ( ON ?auto_487468 ?auto_487467 ) ( ON ?auto_487469 ?auto_487468 ) ( ON ?auto_487470 ?auto_487469 ) ( ON ?auto_487471 ?auto_487470 ) ( not ( = ?auto_487463 ?auto_487464 ) ) ( not ( = ?auto_487463 ?auto_487465 ) ) ( not ( = ?auto_487463 ?auto_487466 ) ) ( not ( = ?auto_487463 ?auto_487467 ) ) ( not ( = ?auto_487463 ?auto_487468 ) ) ( not ( = ?auto_487463 ?auto_487469 ) ) ( not ( = ?auto_487463 ?auto_487470 ) ) ( not ( = ?auto_487463 ?auto_487471 ) ) ( not ( = ?auto_487463 ?auto_487472 ) ) ( not ( = ?auto_487463 ?auto_487473 ) ) ( not ( = ?auto_487463 ?auto_487474 ) ) ( not ( = ?auto_487463 ?auto_487475 ) ) ( not ( = ?auto_487463 ?auto_487476 ) ) ( not ( = ?auto_487463 ?auto_487477 ) ) ( not ( = ?auto_487464 ?auto_487465 ) ) ( not ( = ?auto_487464 ?auto_487466 ) ) ( not ( = ?auto_487464 ?auto_487467 ) ) ( not ( = ?auto_487464 ?auto_487468 ) ) ( not ( = ?auto_487464 ?auto_487469 ) ) ( not ( = ?auto_487464 ?auto_487470 ) ) ( not ( = ?auto_487464 ?auto_487471 ) ) ( not ( = ?auto_487464 ?auto_487472 ) ) ( not ( = ?auto_487464 ?auto_487473 ) ) ( not ( = ?auto_487464 ?auto_487474 ) ) ( not ( = ?auto_487464 ?auto_487475 ) ) ( not ( = ?auto_487464 ?auto_487476 ) ) ( not ( = ?auto_487464 ?auto_487477 ) ) ( not ( = ?auto_487465 ?auto_487466 ) ) ( not ( = ?auto_487465 ?auto_487467 ) ) ( not ( = ?auto_487465 ?auto_487468 ) ) ( not ( = ?auto_487465 ?auto_487469 ) ) ( not ( = ?auto_487465 ?auto_487470 ) ) ( not ( = ?auto_487465 ?auto_487471 ) ) ( not ( = ?auto_487465 ?auto_487472 ) ) ( not ( = ?auto_487465 ?auto_487473 ) ) ( not ( = ?auto_487465 ?auto_487474 ) ) ( not ( = ?auto_487465 ?auto_487475 ) ) ( not ( = ?auto_487465 ?auto_487476 ) ) ( not ( = ?auto_487465 ?auto_487477 ) ) ( not ( = ?auto_487466 ?auto_487467 ) ) ( not ( = ?auto_487466 ?auto_487468 ) ) ( not ( = ?auto_487466 ?auto_487469 ) ) ( not ( = ?auto_487466 ?auto_487470 ) ) ( not ( = ?auto_487466 ?auto_487471 ) ) ( not ( = ?auto_487466 ?auto_487472 ) ) ( not ( = ?auto_487466 ?auto_487473 ) ) ( not ( = ?auto_487466 ?auto_487474 ) ) ( not ( = ?auto_487466 ?auto_487475 ) ) ( not ( = ?auto_487466 ?auto_487476 ) ) ( not ( = ?auto_487466 ?auto_487477 ) ) ( not ( = ?auto_487467 ?auto_487468 ) ) ( not ( = ?auto_487467 ?auto_487469 ) ) ( not ( = ?auto_487467 ?auto_487470 ) ) ( not ( = ?auto_487467 ?auto_487471 ) ) ( not ( = ?auto_487467 ?auto_487472 ) ) ( not ( = ?auto_487467 ?auto_487473 ) ) ( not ( = ?auto_487467 ?auto_487474 ) ) ( not ( = ?auto_487467 ?auto_487475 ) ) ( not ( = ?auto_487467 ?auto_487476 ) ) ( not ( = ?auto_487467 ?auto_487477 ) ) ( not ( = ?auto_487468 ?auto_487469 ) ) ( not ( = ?auto_487468 ?auto_487470 ) ) ( not ( = ?auto_487468 ?auto_487471 ) ) ( not ( = ?auto_487468 ?auto_487472 ) ) ( not ( = ?auto_487468 ?auto_487473 ) ) ( not ( = ?auto_487468 ?auto_487474 ) ) ( not ( = ?auto_487468 ?auto_487475 ) ) ( not ( = ?auto_487468 ?auto_487476 ) ) ( not ( = ?auto_487468 ?auto_487477 ) ) ( not ( = ?auto_487469 ?auto_487470 ) ) ( not ( = ?auto_487469 ?auto_487471 ) ) ( not ( = ?auto_487469 ?auto_487472 ) ) ( not ( = ?auto_487469 ?auto_487473 ) ) ( not ( = ?auto_487469 ?auto_487474 ) ) ( not ( = ?auto_487469 ?auto_487475 ) ) ( not ( = ?auto_487469 ?auto_487476 ) ) ( not ( = ?auto_487469 ?auto_487477 ) ) ( not ( = ?auto_487470 ?auto_487471 ) ) ( not ( = ?auto_487470 ?auto_487472 ) ) ( not ( = ?auto_487470 ?auto_487473 ) ) ( not ( = ?auto_487470 ?auto_487474 ) ) ( not ( = ?auto_487470 ?auto_487475 ) ) ( not ( = ?auto_487470 ?auto_487476 ) ) ( not ( = ?auto_487470 ?auto_487477 ) ) ( not ( = ?auto_487471 ?auto_487472 ) ) ( not ( = ?auto_487471 ?auto_487473 ) ) ( not ( = ?auto_487471 ?auto_487474 ) ) ( not ( = ?auto_487471 ?auto_487475 ) ) ( not ( = ?auto_487471 ?auto_487476 ) ) ( not ( = ?auto_487471 ?auto_487477 ) ) ( not ( = ?auto_487472 ?auto_487473 ) ) ( not ( = ?auto_487472 ?auto_487474 ) ) ( not ( = ?auto_487472 ?auto_487475 ) ) ( not ( = ?auto_487472 ?auto_487476 ) ) ( not ( = ?auto_487472 ?auto_487477 ) ) ( not ( = ?auto_487473 ?auto_487474 ) ) ( not ( = ?auto_487473 ?auto_487475 ) ) ( not ( = ?auto_487473 ?auto_487476 ) ) ( not ( = ?auto_487473 ?auto_487477 ) ) ( not ( = ?auto_487474 ?auto_487475 ) ) ( not ( = ?auto_487474 ?auto_487476 ) ) ( not ( = ?auto_487474 ?auto_487477 ) ) ( not ( = ?auto_487475 ?auto_487476 ) ) ( not ( = ?auto_487475 ?auto_487477 ) ) ( not ( = ?auto_487476 ?auto_487477 ) ) ( ON ?auto_487475 ?auto_487476 ) ( ON ?auto_487474 ?auto_487475 ) ( ON ?auto_487473 ?auto_487474 ) ( CLEAR ?auto_487471 ) ( ON ?auto_487472 ?auto_487473 ) ( CLEAR ?auto_487472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_487463 ?auto_487464 ?auto_487465 ?auto_487466 ?auto_487467 ?auto_487468 ?auto_487469 ?auto_487470 ?auto_487471 ?auto_487472 )
      ( MAKE-14PILE ?auto_487463 ?auto_487464 ?auto_487465 ?auto_487466 ?auto_487467 ?auto_487468 ?auto_487469 ?auto_487470 ?auto_487471 ?auto_487472 ?auto_487473 ?auto_487474 ?auto_487475 ?auto_487476 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487521 - BLOCK
      ?auto_487522 - BLOCK
      ?auto_487523 - BLOCK
      ?auto_487524 - BLOCK
      ?auto_487525 - BLOCK
      ?auto_487526 - BLOCK
      ?auto_487527 - BLOCK
      ?auto_487528 - BLOCK
      ?auto_487529 - BLOCK
      ?auto_487530 - BLOCK
      ?auto_487531 - BLOCK
      ?auto_487532 - BLOCK
      ?auto_487533 - BLOCK
      ?auto_487534 - BLOCK
    )
    :vars
    (
      ?auto_487535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487534 ?auto_487535 ) ( ON-TABLE ?auto_487521 ) ( ON ?auto_487522 ?auto_487521 ) ( ON ?auto_487523 ?auto_487522 ) ( ON ?auto_487524 ?auto_487523 ) ( ON ?auto_487525 ?auto_487524 ) ( ON ?auto_487526 ?auto_487525 ) ( ON ?auto_487527 ?auto_487526 ) ( ON ?auto_487528 ?auto_487527 ) ( not ( = ?auto_487521 ?auto_487522 ) ) ( not ( = ?auto_487521 ?auto_487523 ) ) ( not ( = ?auto_487521 ?auto_487524 ) ) ( not ( = ?auto_487521 ?auto_487525 ) ) ( not ( = ?auto_487521 ?auto_487526 ) ) ( not ( = ?auto_487521 ?auto_487527 ) ) ( not ( = ?auto_487521 ?auto_487528 ) ) ( not ( = ?auto_487521 ?auto_487529 ) ) ( not ( = ?auto_487521 ?auto_487530 ) ) ( not ( = ?auto_487521 ?auto_487531 ) ) ( not ( = ?auto_487521 ?auto_487532 ) ) ( not ( = ?auto_487521 ?auto_487533 ) ) ( not ( = ?auto_487521 ?auto_487534 ) ) ( not ( = ?auto_487521 ?auto_487535 ) ) ( not ( = ?auto_487522 ?auto_487523 ) ) ( not ( = ?auto_487522 ?auto_487524 ) ) ( not ( = ?auto_487522 ?auto_487525 ) ) ( not ( = ?auto_487522 ?auto_487526 ) ) ( not ( = ?auto_487522 ?auto_487527 ) ) ( not ( = ?auto_487522 ?auto_487528 ) ) ( not ( = ?auto_487522 ?auto_487529 ) ) ( not ( = ?auto_487522 ?auto_487530 ) ) ( not ( = ?auto_487522 ?auto_487531 ) ) ( not ( = ?auto_487522 ?auto_487532 ) ) ( not ( = ?auto_487522 ?auto_487533 ) ) ( not ( = ?auto_487522 ?auto_487534 ) ) ( not ( = ?auto_487522 ?auto_487535 ) ) ( not ( = ?auto_487523 ?auto_487524 ) ) ( not ( = ?auto_487523 ?auto_487525 ) ) ( not ( = ?auto_487523 ?auto_487526 ) ) ( not ( = ?auto_487523 ?auto_487527 ) ) ( not ( = ?auto_487523 ?auto_487528 ) ) ( not ( = ?auto_487523 ?auto_487529 ) ) ( not ( = ?auto_487523 ?auto_487530 ) ) ( not ( = ?auto_487523 ?auto_487531 ) ) ( not ( = ?auto_487523 ?auto_487532 ) ) ( not ( = ?auto_487523 ?auto_487533 ) ) ( not ( = ?auto_487523 ?auto_487534 ) ) ( not ( = ?auto_487523 ?auto_487535 ) ) ( not ( = ?auto_487524 ?auto_487525 ) ) ( not ( = ?auto_487524 ?auto_487526 ) ) ( not ( = ?auto_487524 ?auto_487527 ) ) ( not ( = ?auto_487524 ?auto_487528 ) ) ( not ( = ?auto_487524 ?auto_487529 ) ) ( not ( = ?auto_487524 ?auto_487530 ) ) ( not ( = ?auto_487524 ?auto_487531 ) ) ( not ( = ?auto_487524 ?auto_487532 ) ) ( not ( = ?auto_487524 ?auto_487533 ) ) ( not ( = ?auto_487524 ?auto_487534 ) ) ( not ( = ?auto_487524 ?auto_487535 ) ) ( not ( = ?auto_487525 ?auto_487526 ) ) ( not ( = ?auto_487525 ?auto_487527 ) ) ( not ( = ?auto_487525 ?auto_487528 ) ) ( not ( = ?auto_487525 ?auto_487529 ) ) ( not ( = ?auto_487525 ?auto_487530 ) ) ( not ( = ?auto_487525 ?auto_487531 ) ) ( not ( = ?auto_487525 ?auto_487532 ) ) ( not ( = ?auto_487525 ?auto_487533 ) ) ( not ( = ?auto_487525 ?auto_487534 ) ) ( not ( = ?auto_487525 ?auto_487535 ) ) ( not ( = ?auto_487526 ?auto_487527 ) ) ( not ( = ?auto_487526 ?auto_487528 ) ) ( not ( = ?auto_487526 ?auto_487529 ) ) ( not ( = ?auto_487526 ?auto_487530 ) ) ( not ( = ?auto_487526 ?auto_487531 ) ) ( not ( = ?auto_487526 ?auto_487532 ) ) ( not ( = ?auto_487526 ?auto_487533 ) ) ( not ( = ?auto_487526 ?auto_487534 ) ) ( not ( = ?auto_487526 ?auto_487535 ) ) ( not ( = ?auto_487527 ?auto_487528 ) ) ( not ( = ?auto_487527 ?auto_487529 ) ) ( not ( = ?auto_487527 ?auto_487530 ) ) ( not ( = ?auto_487527 ?auto_487531 ) ) ( not ( = ?auto_487527 ?auto_487532 ) ) ( not ( = ?auto_487527 ?auto_487533 ) ) ( not ( = ?auto_487527 ?auto_487534 ) ) ( not ( = ?auto_487527 ?auto_487535 ) ) ( not ( = ?auto_487528 ?auto_487529 ) ) ( not ( = ?auto_487528 ?auto_487530 ) ) ( not ( = ?auto_487528 ?auto_487531 ) ) ( not ( = ?auto_487528 ?auto_487532 ) ) ( not ( = ?auto_487528 ?auto_487533 ) ) ( not ( = ?auto_487528 ?auto_487534 ) ) ( not ( = ?auto_487528 ?auto_487535 ) ) ( not ( = ?auto_487529 ?auto_487530 ) ) ( not ( = ?auto_487529 ?auto_487531 ) ) ( not ( = ?auto_487529 ?auto_487532 ) ) ( not ( = ?auto_487529 ?auto_487533 ) ) ( not ( = ?auto_487529 ?auto_487534 ) ) ( not ( = ?auto_487529 ?auto_487535 ) ) ( not ( = ?auto_487530 ?auto_487531 ) ) ( not ( = ?auto_487530 ?auto_487532 ) ) ( not ( = ?auto_487530 ?auto_487533 ) ) ( not ( = ?auto_487530 ?auto_487534 ) ) ( not ( = ?auto_487530 ?auto_487535 ) ) ( not ( = ?auto_487531 ?auto_487532 ) ) ( not ( = ?auto_487531 ?auto_487533 ) ) ( not ( = ?auto_487531 ?auto_487534 ) ) ( not ( = ?auto_487531 ?auto_487535 ) ) ( not ( = ?auto_487532 ?auto_487533 ) ) ( not ( = ?auto_487532 ?auto_487534 ) ) ( not ( = ?auto_487532 ?auto_487535 ) ) ( not ( = ?auto_487533 ?auto_487534 ) ) ( not ( = ?auto_487533 ?auto_487535 ) ) ( not ( = ?auto_487534 ?auto_487535 ) ) ( ON ?auto_487533 ?auto_487534 ) ( ON ?auto_487532 ?auto_487533 ) ( ON ?auto_487531 ?auto_487532 ) ( ON ?auto_487530 ?auto_487531 ) ( CLEAR ?auto_487528 ) ( ON ?auto_487529 ?auto_487530 ) ( CLEAR ?auto_487529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_487521 ?auto_487522 ?auto_487523 ?auto_487524 ?auto_487525 ?auto_487526 ?auto_487527 ?auto_487528 ?auto_487529 )
      ( MAKE-14PILE ?auto_487521 ?auto_487522 ?auto_487523 ?auto_487524 ?auto_487525 ?auto_487526 ?auto_487527 ?auto_487528 ?auto_487529 ?auto_487530 ?auto_487531 ?auto_487532 ?auto_487533 ?auto_487534 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487579 - BLOCK
      ?auto_487580 - BLOCK
      ?auto_487581 - BLOCK
      ?auto_487582 - BLOCK
      ?auto_487583 - BLOCK
      ?auto_487584 - BLOCK
      ?auto_487585 - BLOCK
      ?auto_487586 - BLOCK
      ?auto_487587 - BLOCK
      ?auto_487588 - BLOCK
      ?auto_487589 - BLOCK
      ?auto_487590 - BLOCK
      ?auto_487591 - BLOCK
      ?auto_487592 - BLOCK
    )
    :vars
    (
      ?auto_487593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487592 ?auto_487593 ) ( ON-TABLE ?auto_487579 ) ( ON ?auto_487580 ?auto_487579 ) ( ON ?auto_487581 ?auto_487580 ) ( ON ?auto_487582 ?auto_487581 ) ( ON ?auto_487583 ?auto_487582 ) ( ON ?auto_487584 ?auto_487583 ) ( ON ?auto_487585 ?auto_487584 ) ( not ( = ?auto_487579 ?auto_487580 ) ) ( not ( = ?auto_487579 ?auto_487581 ) ) ( not ( = ?auto_487579 ?auto_487582 ) ) ( not ( = ?auto_487579 ?auto_487583 ) ) ( not ( = ?auto_487579 ?auto_487584 ) ) ( not ( = ?auto_487579 ?auto_487585 ) ) ( not ( = ?auto_487579 ?auto_487586 ) ) ( not ( = ?auto_487579 ?auto_487587 ) ) ( not ( = ?auto_487579 ?auto_487588 ) ) ( not ( = ?auto_487579 ?auto_487589 ) ) ( not ( = ?auto_487579 ?auto_487590 ) ) ( not ( = ?auto_487579 ?auto_487591 ) ) ( not ( = ?auto_487579 ?auto_487592 ) ) ( not ( = ?auto_487579 ?auto_487593 ) ) ( not ( = ?auto_487580 ?auto_487581 ) ) ( not ( = ?auto_487580 ?auto_487582 ) ) ( not ( = ?auto_487580 ?auto_487583 ) ) ( not ( = ?auto_487580 ?auto_487584 ) ) ( not ( = ?auto_487580 ?auto_487585 ) ) ( not ( = ?auto_487580 ?auto_487586 ) ) ( not ( = ?auto_487580 ?auto_487587 ) ) ( not ( = ?auto_487580 ?auto_487588 ) ) ( not ( = ?auto_487580 ?auto_487589 ) ) ( not ( = ?auto_487580 ?auto_487590 ) ) ( not ( = ?auto_487580 ?auto_487591 ) ) ( not ( = ?auto_487580 ?auto_487592 ) ) ( not ( = ?auto_487580 ?auto_487593 ) ) ( not ( = ?auto_487581 ?auto_487582 ) ) ( not ( = ?auto_487581 ?auto_487583 ) ) ( not ( = ?auto_487581 ?auto_487584 ) ) ( not ( = ?auto_487581 ?auto_487585 ) ) ( not ( = ?auto_487581 ?auto_487586 ) ) ( not ( = ?auto_487581 ?auto_487587 ) ) ( not ( = ?auto_487581 ?auto_487588 ) ) ( not ( = ?auto_487581 ?auto_487589 ) ) ( not ( = ?auto_487581 ?auto_487590 ) ) ( not ( = ?auto_487581 ?auto_487591 ) ) ( not ( = ?auto_487581 ?auto_487592 ) ) ( not ( = ?auto_487581 ?auto_487593 ) ) ( not ( = ?auto_487582 ?auto_487583 ) ) ( not ( = ?auto_487582 ?auto_487584 ) ) ( not ( = ?auto_487582 ?auto_487585 ) ) ( not ( = ?auto_487582 ?auto_487586 ) ) ( not ( = ?auto_487582 ?auto_487587 ) ) ( not ( = ?auto_487582 ?auto_487588 ) ) ( not ( = ?auto_487582 ?auto_487589 ) ) ( not ( = ?auto_487582 ?auto_487590 ) ) ( not ( = ?auto_487582 ?auto_487591 ) ) ( not ( = ?auto_487582 ?auto_487592 ) ) ( not ( = ?auto_487582 ?auto_487593 ) ) ( not ( = ?auto_487583 ?auto_487584 ) ) ( not ( = ?auto_487583 ?auto_487585 ) ) ( not ( = ?auto_487583 ?auto_487586 ) ) ( not ( = ?auto_487583 ?auto_487587 ) ) ( not ( = ?auto_487583 ?auto_487588 ) ) ( not ( = ?auto_487583 ?auto_487589 ) ) ( not ( = ?auto_487583 ?auto_487590 ) ) ( not ( = ?auto_487583 ?auto_487591 ) ) ( not ( = ?auto_487583 ?auto_487592 ) ) ( not ( = ?auto_487583 ?auto_487593 ) ) ( not ( = ?auto_487584 ?auto_487585 ) ) ( not ( = ?auto_487584 ?auto_487586 ) ) ( not ( = ?auto_487584 ?auto_487587 ) ) ( not ( = ?auto_487584 ?auto_487588 ) ) ( not ( = ?auto_487584 ?auto_487589 ) ) ( not ( = ?auto_487584 ?auto_487590 ) ) ( not ( = ?auto_487584 ?auto_487591 ) ) ( not ( = ?auto_487584 ?auto_487592 ) ) ( not ( = ?auto_487584 ?auto_487593 ) ) ( not ( = ?auto_487585 ?auto_487586 ) ) ( not ( = ?auto_487585 ?auto_487587 ) ) ( not ( = ?auto_487585 ?auto_487588 ) ) ( not ( = ?auto_487585 ?auto_487589 ) ) ( not ( = ?auto_487585 ?auto_487590 ) ) ( not ( = ?auto_487585 ?auto_487591 ) ) ( not ( = ?auto_487585 ?auto_487592 ) ) ( not ( = ?auto_487585 ?auto_487593 ) ) ( not ( = ?auto_487586 ?auto_487587 ) ) ( not ( = ?auto_487586 ?auto_487588 ) ) ( not ( = ?auto_487586 ?auto_487589 ) ) ( not ( = ?auto_487586 ?auto_487590 ) ) ( not ( = ?auto_487586 ?auto_487591 ) ) ( not ( = ?auto_487586 ?auto_487592 ) ) ( not ( = ?auto_487586 ?auto_487593 ) ) ( not ( = ?auto_487587 ?auto_487588 ) ) ( not ( = ?auto_487587 ?auto_487589 ) ) ( not ( = ?auto_487587 ?auto_487590 ) ) ( not ( = ?auto_487587 ?auto_487591 ) ) ( not ( = ?auto_487587 ?auto_487592 ) ) ( not ( = ?auto_487587 ?auto_487593 ) ) ( not ( = ?auto_487588 ?auto_487589 ) ) ( not ( = ?auto_487588 ?auto_487590 ) ) ( not ( = ?auto_487588 ?auto_487591 ) ) ( not ( = ?auto_487588 ?auto_487592 ) ) ( not ( = ?auto_487588 ?auto_487593 ) ) ( not ( = ?auto_487589 ?auto_487590 ) ) ( not ( = ?auto_487589 ?auto_487591 ) ) ( not ( = ?auto_487589 ?auto_487592 ) ) ( not ( = ?auto_487589 ?auto_487593 ) ) ( not ( = ?auto_487590 ?auto_487591 ) ) ( not ( = ?auto_487590 ?auto_487592 ) ) ( not ( = ?auto_487590 ?auto_487593 ) ) ( not ( = ?auto_487591 ?auto_487592 ) ) ( not ( = ?auto_487591 ?auto_487593 ) ) ( not ( = ?auto_487592 ?auto_487593 ) ) ( ON ?auto_487591 ?auto_487592 ) ( ON ?auto_487590 ?auto_487591 ) ( ON ?auto_487589 ?auto_487590 ) ( ON ?auto_487588 ?auto_487589 ) ( ON ?auto_487587 ?auto_487588 ) ( CLEAR ?auto_487585 ) ( ON ?auto_487586 ?auto_487587 ) ( CLEAR ?auto_487586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_487579 ?auto_487580 ?auto_487581 ?auto_487582 ?auto_487583 ?auto_487584 ?auto_487585 ?auto_487586 )
      ( MAKE-14PILE ?auto_487579 ?auto_487580 ?auto_487581 ?auto_487582 ?auto_487583 ?auto_487584 ?auto_487585 ?auto_487586 ?auto_487587 ?auto_487588 ?auto_487589 ?auto_487590 ?auto_487591 ?auto_487592 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487637 - BLOCK
      ?auto_487638 - BLOCK
      ?auto_487639 - BLOCK
      ?auto_487640 - BLOCK
      ?auto_487641 - BLOCK
      ?auto_487642 - BLOCK
      ?auto_487643 - BLOCK
      ?auto_487644 - BLOCK
      ?auto_487645 - BLOCK
      ?auto_487646 - BLOCK
      ?auto_487647 - BLOCK
      ?auto_487648 - BLOCK
      ?auto_487649 - BLOCK
      ?auto_487650 - BLOCK
    )
    :vars
    (
      ?auto_487651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487650 ?auto_487651 ) ( ON-TABLE ?auto_487637 ) ( ON ?auto_487638 ?auto_487637 ) ( ON ?auto_487639 ?auto_487638 ) ( ON ?auto_487640 ?auto_487639 ) ( ON ?auto_487641 ?auto_487640 ) ( ON ?auto_487642 ?auto_487641 ) ( not ( = ?auto_487637 ?auto_487638 ) ) ( not ( = ?auto_487637 ?auto_487639 ) ) ( not ( = ?auto_487637 ?auto_487640 ) ) ( not ( = ?auto_487637 ?auto_487641 ) ) ( not ( = ?auto_487637 ?auto_487642 ) ) ( not ( = ?auto_487637 ?auto_487643 ) ) ( not ( = ?auto_487637 ?auto_487644 ) ) ( not ( = ?auto_487637 ?auto_487645 ) ) ( not ( = ?auto_487637 ?auto_487646 ) ) ( not ( = ?auto_487637 ?auto_487647 ) ) ( not ( = ?auto_487637 ?auto_487648 ) ) ( not ( = ?auto_487637 ?auto_487649 ) ) ( not ( = ?auto_487637 ?auto_487650 ) ) ( not ( = ?auto_487637 ?auto_487651 ) ) ( not ( = ?auto_487638 ?auto_487639 ) ) ( not ( = ?auto_487638 ?auto_487640 ) ) ( not ( = ?auto_487638 ?auto_487641 ) ) ( not ( = ?auto_487638 ?auto_487642 ) ) ( not ( = ?auto_487638 ?auto_487643 ) ) ( not ( = ?auto_487638 ?auto_487644 ) ) ( not ( = ?auto_487638 ?auto_487645 ) ) ( not ( = ?auto_487638 ?auto_487646 ) ) ( not ( = ?auto_487638 ?auto_487647 ) ) ( not ( = ?auto_487638 ?auto_487648 ) ) ( not ( = ?auto_487638 ?auto_487649 ) ) ( not ( = ?auto_487638 ?auto_487650 ) ) ( not ( = ?auto_487638 ?auto_487651 ) ) ( not ( = ?auto_487639 ?auto_487640 ) ) ( not ( = ?auto_487639 ?auto_487641 ) ) ( not ( = ?auto_487639 ?auto_487642 ) ) ( not ( = ?auto_487639 ?auto_487643 ) ) ( not ( = ?auto_487639 ?auto_487644 ) ) ( not ( = ?auto_487639 ?auto_487645 ) ) ( not ( = ?auto_487639 ?auto_487646 ) ) ( not ( = ?auto_487639 ?auto_487647 ) ) ( not ( = ?auto_487639 ?auto_487648 ) ) ( not ( = ?auto_487639 ?auto_487649 ) ) ( not ( = ?auto_487639 ?auto_487650 ) ) ( not ( = ?auto_487639 ?auto_487651 ) ) ( not ( = ?auto_487640 ?auto_487641 ) ) ( not ( = ?auto_487640 ?auto_487642 ) ) ( not ( = ?auto_487640 ?auto_487643 ) ) ( not ( = ?auto_487640 ?auto_487644 ) ) ( not ( = ?auto_487640 ?auto_487645 ) ) ( not ( = ?auto_487640 ?auto_487646 ) ) ( not ( = ?auto_487640 ?auto_487647 ) ) ( not ( = ?auto_487640 ?auto_487648 ) ) ( not ( = ?auto_487640 ?auto_487649 ) ) ( not ( = ?auto_487640 ?auto_487650 ) ) ( not ( = ?auto_487640 ?auto_487651 ) ) ( not ( = ?auto_487641 ?auto_487642 ) ) ( not ( = ?auto_487641 ?auto_487643 ) ) ( not ( = ?auto_487641 ?auto_487644 ) ) ( not ( = ?auto_487641 ?auto_487645 ) ) ( not ( = ?auto_487641 ?auto_487646 ) ) ( not ( = ?auto_487641 ?auto_487647 ) ) ( not ( = ?auto_487641 ?auto_487648 ) ) ( not ( = ?auto_487641 ?auto_487649 ) ) ( not ( = ?auto_487641 ?auto_487650 ) ) ( not ( = ?auto_487641 ?auto_487651 ) ) ( not ( = ?auto_487642 ?auto_487643 ) ) ( not ( = ?auto_487642 ?auto_487644 ) ) ( not ( = ?auto_487642 ?auto_487645 ) ) ( not ( = ?auto_487642 ?auto_487646 ) ) ( not ( = ?auto_487642 ?auto_487647 ) ) ( not ( = ?auto_487642 ?auto_487648 ) ) ( not ( = ?auto_487642 ?auto_487649 ) ) ( not ( = ?auto_487642 ?auto_487650 ) ) ( not ( = ?auto_487642 ?auto_487651 ) ) ( not ( = ?auto_487643 ?auto_487644 ) ) ( not ( = ?auto_487643 ?auto_487645 ) ) ( not ( = ?auto_487643 ?auto_487646 ) ) ( not ( = ?auto_487643 ?auto_487647 ) ) ( not ( = ?auto_487643 ?auto_487648 ) ) ( not ( = ?auto_487643 ?auto_487649 ) ) ( not ( = ?auto_487643 ?auto_487650 ) ) ( not ( = ?auto_487643 ?auto_487651 ) ) ( not ( = ?auto_487644 ?auto_487645 ) ) ( not ( = ?auto_487644 ?auto_487646 ) ) ( not ( = ?auto_487644 ?auto_487647 ) ) ( not ( = ?auto_487644 ?auto_487648 ) ) ( not ( = ?auto_487644 ?auto_487649 ) ) ( not ( = ?auto_487644 ?auto_487650 ) ) ( not ( = ?auto_487644 ?auto_487651 ) ) ( not ( = ?auto_487645 ?auto_487646 ) ) ( not ( = ?auto_487645 ?auto_487647 ) ) ( not ( = ?auto_487645 ?auto_487648 ) ) ( not ( = ?auto_487645 ?auto_487649 ) ) ( not ( = ?auto_487645 ?auto_487650 ) ) ( not ( = ?auto_487645 ?auto_487651 ) ) ( not ( = ?auto_487646 ?auto_487647 ) ) ( not ( = ?auto_487646 ?auto_487648 ) ) ( not ( = ?auto_487646 ?auto_487649 ) ) ( not ( = ?auto_487646 ?auto_487650 ) ) ( not ( = ?auto_487646 ?auto_487651 ) ) ( not ( = ?auto_487647 ?auto_487648 ) ) ( not ( = ?auto_487647 ?auto_487649 ) ) ( not ( = ?auto_487647 ?auto_487650 ) ) ( not ( = ?auto_487647 ?auto_487651 ) ) ( not ( = ?auto_487648 ?auto_487649 ) ) ( not ( = ?auto_487648 ?auto_487650 ) ) ( not ( = ?auto_487648 ?auto_487651 ) ) ( not ( = ?auto_487649 ?auto_487650 ) ) ( not ( = ?auto_487649 ?auto_487651 ) ) ( not ( = ?auto_487650 ?auto_487651 ) ) ( ON ?auto_487649 ?auto_487650 ) ( ON ?auto_487648 ?auto_487649 ) ( ON ?auto_487647 ?auto_487648 ) ( ON ?auto_487646 ?auto_487647 ) ( ON ?auto_487645 ?auto_487646 ) ( ON ?auto_487644 ?auto_487645 ) ( CLEAR ?auto_487642 ) ( ON ?auto_487643 ?auto_487644 ) ( CLEAR ?auto_487643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_487637 ?auto_487638 ?auto_487639 ?auto_487640 ?auto_487641 ?auto_487642 ?auto_487643 )
      ( MAKE-14PILE ?auto_487637 ?auto_487638 ?auto_487639 ?auto_487640 ?auto_487641 ?auto_487642 ?auto_487643 ?auto_487644 ?auto_487645 ?auto_487646 ?auto_487647 ?auto_487648 ?auto_487649 ?auto_487650 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487695 - BLOCK
      ?auto_487696 - BLOCK
      ?auto_487697 - BLOCK
      ?auto_487698 - BLOCK
      ?auto_487699 - BLOCK
      ?auto_487700 - BLOCK
      ?auto_487701 - BLOCK
      ?auto_487702 - BLOCK
      ?auto_487703 - BLOCK
      ?auto_487704 - BLOCK
      ?auto_487705 - BLOCK
      ?auto_487706 - BLOCK
      ?auto_487707 - BLOCK
      ?auto_487708 - BLOCK
    )
    :vars
    (
      ?auto_487709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487708 ?auto_487709 ) ( ON-TABLE ?auto_487695 ) ( ON ?auto_487696 ?auto_487695 ) ( ON ?auto_487697 ?auto_487696 ) ( ON ?auto_487698 ?auto_487697 ) ( ON ?auto_487699 ?auto_487698 ) ( not ( = ?auto_487695 ?auto_487696 ) ) ( not ( = ?auto_487695 ?auto_487697 ) ) ( not ( = ?auto_487695 ?auto_487698 ) ) ( not ( = ?auto_487695 ?auto_487699 ) ) ( not ( = ?auto_487695 ?auto_487700 ) ) ( not ( = ?auto_487695 ?auto_487701 ) ) ( not ( = ?auto_487695 ?auto_487702 ) ) ( not ( = ?auto_487695 ?auto_487703 ) ) ( not ( = ?auto_487695 ?auto_487704 ) ) ( not ( = ?auto_487695 ?auto_487705 ) ) ( not ( = ?auto_487695 ?auto_487706 ) ) ( not ( = ?auto_487695 ?auto_487707 ) ) ( not ( = ?auto_487695 ?auto_487708 ) ) ( not ( = ?auto_487695 ?auto_487709 ) ) ( not ( = ?auto_487696 ?auto_487697 ) ) ( not ( = ?auto_487696 ?auto_487698 ) ) ( not ( = ?auto_487696 ?auto_487699 ) ) ( not ( = ?auto_487696 ?auto_487700 ) ) ( not ( = ?auto_487696 ?auto_487701 ) ) ( not ( = ?auto_487696 ?auto_487702 ) ) ( not ( = ?auto_487696 ?auto_487703 ) ) ( not ( = ?auto_487696 ?auto_487704 ) ) ( not ( = ?auto_487696 ?auto_487705 ) ) ( not ( = ?auto_487696 ?auto_487706 ) ) ( not ( = ?auto_487696 ?auto_487707 ) ) ( not ( = ?auto_487696 ?auto_487708 ) ) ( not ( = ?auto_487696 ?auto_487709 ) ) ( not ( = ?auto_487697 ?auto_487698 ) ) ( not ( = ?auto_487697 ?auto_487699 ) ) ( not ( = ?auto_487697 ?auto_487700 ) ) ( not ( = ?auto_487697 ?auto_487701 ) ) ( not ( = ?auto_487697 ?auto_487702 ) ) ( not ( = ?auto_487697 ?auto_487703 ) ) ( not ( = ?auto_487697 ?auto_487704 ) ) ( not ( = ?auto_487697 ?auto_487705 ) ) ( not ( = ?auto_487697 ?auto_487706 ) ) ( not ( = ?auto_487697 ?auto_487707 ) ) ( not ( = ?auto_487697 ?auto_487708 ) ) ( not ( = ?auto_487697 ?auto_487709 ) ) ( not ( = ?auto_487698 ?auto_487699 ) ) ( not ( = ?auto_487698 ?auto_487700 ) ) ( not ( = ?auto_487698 ?auto_487701 ) ) ( not ( = ?auto_487698 ?auto_487702 ) ) ( not ( = ?auto_487698 ?auto_487703 ) ) ( not ( = ?auto_487698 ?auto_487704 ) ) ( not ( = ?auto_487698 ?auto_487705 ) ) ( not ( = ?auto_487698 ?auto_487706 ) ) ( not ( = ?auto_487698 ?auto_487707 ) ) ( not ( = ?auto_487698 ?auto_487708 ) ) ( not ( = ?auto_487698 ?auto_487709 ) ) ( not ( = ?auto_487699 ?auto_487700 ) ) ( not ( = ?auto_487699 ?auto_487701 ) ) ( not ( = ?auto_487699 ?auto_487702 ) ) ( not ( = ?auto_487699 ?auto_487703 ) ) ( not ( = ?auto_487699 ?auto_487704 ) ) ( not ( = ?auto_487699 ?auto_487705 ) ) ( not ( = ?auto_487699 ?auto_487706 ) ) ( not ( = ?auto_487699 ?auto_487707 ) ) ( not ( = ?auto_487699 ?auto_487708 ) ) ( not ( = ?auto_487699 ?auto_487709 ) ) ( not ( = ?auto_487700 ?auto_487701 ) ) ( not ( = ?auto_487700 ?auto_487702 ) ) ( not ( = ?auto_487700 ?auto_487703 ) ) ( not ( = ?auto_487700 ?auto_487704 ) ) ( not ( = ?auto_487700 ?auto_487705 ) ) ( not ( = ?auto_487700 ?auto_487706 ) ) ( not ( = ?auto_487700 ?auto_487707 ) ) ( not ( = ?auto_487700 ?auto_487708 ) ) ( not ( = ?auto_487700 ?auto_487709 ) ) ( not ( = ?auto_487701 ?auto_487702 ) ) ( not ( = ?auto_487701 ?auto_487703 ) ) ( not ( = ?auto_487701 ?auto_487704 ) ) ( not ( = ?auto_487701 ?auto_487705 ) ) ( not ( = ?auto_487701 ?auto_487706 ) ) ( not ( = ?auto_487701 ?auto_487707 ) ) ( not ( = ?auto_487701 ?auto_487708 ) ) ( not ( = ?auto_487701 ?auto_487709 ) ) ( not ( = ?auto_487702 ?auto_487703 ) ) ( not ( = ?auto_487702 ?auto_487704 ) ) ( not ( = ?auto_487702 ?auto_487705 ) ) ( not ( = ?auto_487702 ?auto_487706 ) ) ( not ( = ?auto_487702 ?auto_487707 ) ) ( not ( = ?auto_487702 ?auto_487708 ) ) ( not ( = ?auto_487702 ?auto_487709 ) ) ( not ( = ?auto_487703 ?auto_487704 ) ) ( not ( = ?auto_487703 ?auto_487705 ) ) ( not ( = ?auto_487703 ?auto_487706 ) ) ( not ( = ?auto_487703 ?auto_487707 ) ) ( not ( = ?auto_487703 ?auto_487708 ) ) ( not ( = ?auto_487703 ?auto_487709 ) ) ( not ( = ?auto_487704 ?auto_487705 ) ) ( not ( = ?auto_487704 ?auto_487706 ) ) ( not ( = ?auto_487704 ?auto_487707 ) ) ( not ( = ?auto_487704 ?auto_487708 ) ) ( not ( = ?auto_487704 ?auto_487709 ) ) ( not ( = ?auto_487705 ?auto_487706 ) ) ( not ( = ?auto_487705 ?auto_487707 ) ) ( not ( = ?auto_487705 ?auto_487708 ) ) ( not ( = ?auto_487705 ?auto_487709 ) ) ( not ( = ?auto_487706 ?auto_487707 ) ) ( not ( = ?auto_487706 ?auto_487708 ) ) ( not ( = ?auto_487706 ?auto_487709 ) ) ( not ( = ?auto_487707 ?auto_487708 ) ) ( not ( = ?auto_487707 ?auto_487709 ) ) ( not ( = ?auto_487708 ?auto_487709 ) ) ( ON ?auto_487707 ?auto_487708 ) ( ON ?auto_487706 ?auto_487707 ) ( ON ?auto_487705 ?auto_487706 ) ( ON ?auto_487704 ?auto_487705 ) ( ON ?auto_487703 ?auto_487704 ) ( ON ?auto_487702 ?auto_487703 ) ( ON ?auto_487701 ?auto_487702 ) ( CLEAR ?auto_487699 ) ( ON ?auto_487700 ?auto_487701 ) ( CLEAR ?auto_487700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_487695 ?auto_487696 ?auto_487697 ?auto_487698 ?auto_487699 ?auto_487700 )
      ( MAKE-14PILE ?auto_487695 ?auto_487696 ?auto_487697 ?auto_487698 ?auto_487699 ?auto_487700 ?auto_487701 ?auto_487702 ?auto_487703 ?auto_487704 ?auto_487705 ?auto_487706 ?auto_487707 ?auto_487708 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487753 - BLOCK
      ?auto_487754 - BLOCK
      ?auto_487755 - BLOCK
      ?auto_487756 - BLOCK
      ?auto_487757 - BLOCK
      ?auto_487758 - BLOCK
      ?auto_487759 - BLOCK
      ?auto_487760 - BLOCK
      ?auto_487761 - BLOCK
      ?auto_487762 - BLOCK
      ?auto_487763 - BLOCK
      ?auto_487764 - BLOCK
      ?auto_487765 - BLOCK
      ?auto_487766 - BLOCK
    )
    :vars
    (
      ?auto_487767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487766 ?auto_487767 ) ( ON-TABLE ?auto_487753 ) ( ON ?auto_487754 ?auto_487753 ) ( ON ?auto_487755 ?auto_487754 ) ( ON ?auto_487756 ?auto_487755 ) ( not ( = ?auto_487753 ?auto_487754 ) ) ( not ( = ?auto_487753 ?auto_487755 ) ) ( not ( = ?auto_487753 ?auto_487756 ) ) ( not ( = ?auto_487753 ?auto_487757 ) ) ( not ( = ?auto_487753 ?auto_487758 ) ) ( not ( = ?auto_487753 ?auto_487759 ) ) ( not ( = ?auto_487753 ?auto_487760 ) ) ( not ( = ?auto_487753 ?auto_487761 ) ) ( not ( = ?auto_487753 ?auto_487762 ) ) ( not ( = ?auto_487753 ?auto_487763 ) ) ( not ( = ?auto_487753 ?auto_487764 ) ) ( not ( = ?auto_487753 ?auto_487765 ) ) ( not ( = ?auto_487753 ?auto_487766 ) ) ( not ( = ?auto_487753 ?auto_487767 ) ) ( not ( = ?auto_487754 ?auto_487755 ) ) ( not ( = ?auto_487754 ?auto_487756 ) ) ( not ( = ?auto_487754 ?auto_487757 ) ) ( not ( = ?auto_487754 ?auto_487758 ) ) ( not ( = ?auto_487754 ?auto_487759 ) ) ( not ( = ?auto_487754 ?auto_487760 ) ) ( not ( = ?auto_487754 ?auto_487761 ) ) ( not ( = ?auto_487754 ?auto_487762 ) ) ( not ( = ?auto_487754 ?auto_487763 ) ) ( not ( = ?auto_487754 ?auto_487764 ) ) ( not ( = ?auto_487754 ?auto_487765 ) ) ( not ( = ?auto_487754 ?auto_487766 ) ) ( not ( = ?auto_487754 ?auto_487767 ) ) ( not ( = ?auto_487755 ?auto_487756 ) ) ( not ( = ?auto_487755 ?auto_487757 ) ) ( not ( = ?auto_487755 ?auto_487758 ) ) ( not ( = ?auto_487755 ?auto_487759 ) ) ( not ( = ?auto_487755 ?auto_487760 ) ) ( not ( = ?auto_487755 ?auto_487761 ) ) ( not ( = ?auto_487755 ?auto_487762 ) ) ( not ( = ?auto_487755 ?auto_487763 ) ) ( not ( = ?auto_487755 ?auto_487764 ) ) ( not ( = ?auto_487755 ?auto_487765 ) ) ( not ( = ?auto_487755 ?auto_487766 ) ) ( not ( = ?auto_487755 ?auto_487767 ) ) ( not ( = ?auto_487756 ?auto_487757 ) ) ( not ( = ?auto_487756 ?auto_487758 ) ) ( not ( = ?auto_487756 ?auto_487759 ) ) ( not ( = ?auto_487756 ?auto_487760 ) ) ( not ( = ?auto_487756 ?auto_487761 ) ) ( not ( = ?auto_487756 ?auto_487762 ) ) ( not ( = ?auto_487756 ?auto_487763 ) ) ( not ( = ?auto_487756 ?auto_487764 ) ) ( not ( = ?auto_487756 ?auto_487765 ) ) ( not ( = ?auto_487756 ?auto_487766 ) ) ( not ( = ?auto_487756 ?auto_487767 ) ) ( not ( = ?auto_487757 ?auto_487758 ) ) ( not ( = ?auto_487757 ?auto_487759 ) ) ( not ( = ?auto_487757 ?auto_487760 ) ) ( not ( = ?auto_487757 ?auto_487761 ) ) ( not ( = ?auto_487757 ?auto_487762 ) ) ( not ( = ?auto_487757 ?auto_487763 ) ) ( not ( = ?auto_487757 ?auto_487764 ) ) ( not ( = ?auto_487757 ?auto_487765 ) ) ( not ( = ?auto_487757 ?auto_487766 ) ) ( not ( = ?auto_487757 ?auto_487767 ) ) ( not ( = ?auto_487758 ?auto_487759 ) ) ( not ( = ?auto_487758 ?auto_487760 ) ) ( not ( = ?auto_487758 ?auto_487761 ) ) ( not ( = ?auto_487758 ?auto_487762 ) ) ( not ( = ?auto_487758 ?auto_487763 ) ) ( not ( = ?auto_487758 ?auto_487764 ) ) ( not ( = ?auto_487758 ?auto_487765 ) ) ( not ( = ?auto_487758 ?auto_487766 ) ) ( not ( = ?auto_487758 ?auto_487767 ) ) ( not ( = ?auto_487759 ?auto_487760 ) ) ( not ( = ?auto_487759 ?auto_487761 ) ) ( not ( = ?auto_487759 ?auto_487762 ) ) ( not ( = ?auto_487759 ?auto_487763 ) ) ( not ( = ?auto_487759 ?auto_487764 ) ) ( not ( = ?auto_487759 ?auto_487765 ) ) ( not ( = ?auto_487759 ?auto_487766 ) ) ( not ( = ?auto_487759 ?auto_487767 ) ) ( not ( = ?auto_487760 ?auto_487761 ) ) ( not ( = ?auto_487760 ?auto_487762 ) ) ( not ( = ?auto_487760 ?auto_487763 ) ) ( not ( = ?auto_487760 ?auto_487764 ) ) ( not ( = ?auto_487760 ?auto_487765 ) ) ( not ( = ?auto_487760 ?auto_487766 ) ) ( not ( = ?auto_487760 ?auto_487767 ) ) ( not ( = ?auto_487761 ?auto_487762 ) ) ( not ( = ?auto_487761 ?auto_487763 ) ) ( not ( = ?auto_487761 ?auto_487764 ) ) ( not ( = ?auto_487761 ?auto_487765 ) ) ( not ( = ?auto_487761 ?auto_487766 ) ) ( not ( = ?auto_487761 ?auto_487767 ) ) ( not ( = ?auto_487762 ?auto_487763 ) ) ( not ( = ?auto_487762 ?auto_487764 ) ) ( not ( = ?auto_487762 ?auto_487765 ) ) ( not ( = ?auto_487762 ?auto_487766 ) ) ( not ( = ?auto_487762 ?auto_487767 ) ) ( not ( = ?auto_487763 ?auto_487764 ) ) ( not ( = ?auto_487763 ?auto_487765 ) ) ( not ( = ?auto_487763 ?auto_487766 ) ) ( not ( = ?auto_487763 ?auto_487767 ) ) ( not ( = ?auto_487764 ?auto_487765 ) ) ( not ( = ?auto_487764 ?auto_487766 ) ) ( not ( = ?auto_487764 ?auto_487767 ) ) ( not ( = ?auto_487765 ?auto_487766 ) ) ( not ( = ?auto_487765 ?auto_487767 ) ) ( not ( = ?auto_487766 ?auto_487767 ) ) ( ON ?auto_487765 ?auto_487766 ) ( ON ?auto_487764 ?auto_487765 ) ( ON ?auto_487763 ?auto_487764 ) ( ON ?auto_487762 ?auto_487763 ) ( ON ?auto_487761 ?auto_487762 ) ( ON ?auto_487760 ?auto_487761 ) ( ON ?auto_487759 ?auto_487760 ) ( ON ?auto_487758 ?auto_487759 ) ( CLEAR ?auto_487756 ) ( ON ?auto_487757 ?auto_487758 ) ( CLEAR ?auto_487757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_487753 ?auto_487754 ?auto_487755 ?auto_487756 ?auto_487757 )
      ( MAKE-14PILE ?auto_487753 ?auto_487754 ?auto_487755 ?auto_487756 ?auto_487757 ?auto_487758 ?auto_487759 ?auto_487760 ?auto_487761 ?auto_487762 ?auto_487763 ?auto_487764 ?auto_487765 ?auto_487766 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487811 - BLOCK
      ?auto_487812 - BLOCK
      ?auto_487813 - BLOCK
      ?auto_487814 - BLOCK
      ?auto_487815 - BLOCK
      ?auto_487816 - BLOCK
      ?auto_487817 - BLOCK
      ?auto_487818 - BLOCK
      ?auto_487819 - BLOCK
      ?auto_487820 - BLOCK
      ?auto_487821 - BLOCK
      ?auto_487822 - BLOCK
      ?auto_487823 - BLOCK
      ?auto_487824 - BLOCK
    )
    :vars
    (
      ?auto_487825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487824 ?auto_487825 ) ( ON-TABLE ?auto_487811 ) ( ON ?auto_487812 ?auto_487811 ) ( ON ?auto_487813 ?auto_487812 ) ( not ( = ?auto_487811 ?auto_487812 ) ) ( not ( = ?auto_487811 ?auto_487813 ) ) ( not ( = ?auto_487811 ?auto_487814 ) ) ( not ( = ?auto_487811 ?auto_487815 ) ) ( not ( = ?auto_487811 ?auto_487816 ) ) ( not ( = ?auto_487811 ?auto_487817 ) ) ( not ( = ?auto_487811 ?auto_487818 ) ) ( not ( = ?auto_487811 ?auto_487819 ) ) ( not ( = ?auto_487811 ?auto_487820 ) ) ( not ( = ?auto_487811 ?auto_487821 ) ) ( not ( = ?auto_487811 ?auto_487822 ) ) ( not ( = ?auto_487811 ?auto_487823 ) ) ( not ( = ?auto_487811 ?auto_487824 ) ) ( not ( = ?auto_487811 ?auto_487825 ) ) ( not ( = ?auto_487812 ?auto_487813 ) ) ( not ( = ?auto_487812 ?auto_487814 ) ) ( not ( = ?auto_487812 ?auto_487815 ) ) ( not ( = ?auto_487812 ?auto_487816 ) ) ( not ( = ?auto_487812 ?auto_487817 ) ) ( not ( = ?auto_487812 ?auto_487818 ) ) ( not ( = ?auto_487812 ?auto_487819 ) ) ( not ( = ?auto_487812 ?auto_487820 ) ) ( not ( = ?auto_487812 ?auto_487821 ) ) ( not ( = ?auto_487812 ?auto_487822 ) ) ( not ( = ?auto_487812 ?auto_487823 ) ) ( not ( = ?auto_487812 ?auto_487824 ) ) ( not ( = ?auto_487812 ?auto_487825 ) ) ( not ( = ?auto_487813 ?auto_487814 ) ) ( not ( = ?auto_487813 ?auto_487815 ) ) ( not ( = ?auto_487813 ?auto_487816 ) ) ( not ( = ?auto_487813 ?auto_487817 ) ) ( not ( = ?auto_487813 ?auto_487818 ) ) ( not ( = ?auto_487813 ?auto_487819 ) ) ( not ( = ?auto_487813 ?auto_487820 ) ) ( not ( = ?auto_487813 ?auto_487821 ) ) ( not ( = ?auto_487813 ?auto_487822 ) ) ( not ( = ?auto_487813 ?auto_487823 ) ) ( not ( = ?auto_487813 ?auto_487824 ) ) ( not ( = ?auto_487813 ?auto_487825 ) ) ( not ( = ?auto_487814 ?auto_487815 ) ) ( not ( = ?auto_487814 ?auto_487816 ) ) ( not ( = ?auto_487814 ?auto_487817 ) ) ( not ( = ?auto_487814 ?auto_487818 ) ) ( not ( = ?auto_487814 ?auto_487819 ) ) ( not ( = ?auto_487814 ?auto_487820 ) ) ( not ( = ?auto_487814 ?auto_487821 ) ) ( not ( = ?auto_487814 ?auto_487822 ) ) ( not ( = ?auto_487814 ?auto_487823 ) ) ( not ( = ?auto_487814 ?auto_487824 ) ) ( not ( = ?auto_487814 ?auto_487825 ) ) ( not ( = ?auto_487815 ?auto_487816 ) ) ( not ( = ?auto_487815 ?auto_487817 ) ) ( not ( = ?auto_487815 ?auto_487818 ) ) ( not ( = ?auto_487815 ?auto_487819 ) ) ( not ( = ?auto_487815 ?auto_487820 ) ) ( not ( = ?auto_487815 ?auto_487821 ) ) ( not ( = ?auto_487815 ?auto_487822 ) ) ( not ( = ?auto_487815 ?auto_487823 ) ) ( not ( = ?auto_487815 ?auto_487824 ) ) ( not ( = ?auto_487815 ?auto_487825 ) ) ( not ( = ?auto_487816 ?auto_487817 ) ) ( not ( = ?auto_487816 ?auto_487818 ) ) ( not ( = ?auto_487816 ?auto_487819 ) ) ( not ( = ?auto_487816 ?auto_487820 ) ) ( not ( = ?auto_487816 ?auto_487821 ) ) ( not ( = ?auto_487816 ?auto_487822 ) ) ( not ( = ?auto_487816 ?auto_487823 ) ) ( not ( = ?auto_487816 ?auto_487824 ) ) ( not ( = ?auto_487816 ?auto_487825 ) ) ( not ( = ?auto_487817 ?auto_487818 ) ) ( not ( = ?auto_487817 ?auto_487819 ) ) ( not ( = ?auto_487817 ?auto_487820 ) ) ( not ( = ?auto_487817 ?auto_487821 ) ) ( not ( = ?auto_487817 ?auto_487822 ) ) ( not ( = ?auto_487817 ?auto_487823 ) ) ( not ( = ?auto_487817 ?auto_487824 ) ) ( not ( = ?auto_487817 ?auto_487825 ) ) ( not ( = ?auto_487818 ?auto_487819 ) ) ( not ( = ?auto_487818 ?auto_487820 ) ) ( not ( = ?auto_487818 ?auto_487821 ) ) ( not ( = ?auto_487818 ?auto_487822 ) ) ( not ( = ?auto_487818 ?auto_487823 ) ) ( not ( = ?auto_487818 ?auto_487824 ) ) ( not ( = ?auto_487818 ?auto_487825 ) ) ( not ( = ?auto_487819 ?auto_487820 ) ) ( not ( = ?auto_487819 ?auto_487821 ) ) ( not ( = ?auto_487819 ?auto_487822 ) ) ( not ( = ?auto_487819 ?auto_487823 ) ) ( not ( = ?auto_487819 ?auto_487824 ) ) ( not ( = ?auto_487819 ?auto_487825 ) ) ( not ( = ?auto_487820 ?auto_487821 ) ) ( not ( = ?auto_487820 ?auto_487822 ) ) ( not ( = ?auto_487820 ?auto_487823 ) ) ( not ( = ?auto_487820 ?auto_487824 ) ) ( not ( = ?auto_487820 ?auto_487825 ) ) ( not ( = ?auto_487821 ?auto_487822 ) ) ( not ( = ?auto_487821 ?auto_487823 ) ) ( not ( = ?auto_487821 ?auto_487824 ) ) ( not ( = ?auto_487821 ?auto_487825 ) ) ( not ( = ?auto_487822 ?auto_487823 ) ) ( not ( = ?auto_487822 ?auto_487824 ) ) ( not ( = ?auto_487822 ?auto_487825 ) ) ( not ( = ?auto_487823 ?auto_487824 ) ) ( not ( = ?auto_487823 ?auto_487825 ) ) ( not ( = ?auto_487824 ?auto_487825 ) ) ( ON ?auto_487823 ?auto_487824 ) ( ON ?auto_487822 ?auto_487823 ) ( ON ?auto_487821 ?auto_487822 ) ( ON ?auto_487820 ?auto_487821 ) ( ON ?auto_487819 ?auto_487820 ) ( ON ?auto_487818 ?auto_487819 ) ( ON ?auto_487817 ?auto_487818 ) ( ON ?auto_487816 ?auto_487817 ) ( ON ?auto_487815 ?auto_487816 ) ( CLEAR ?auto_487813 ) ( ON ?auto_487814 ?auto_487815 ) ( CLEAR ?auto_487814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_487811 ?auto_487812 ?auto_487813 ?auto_487814 )
      ( MAKE-14PILE ?auto_487811 ?auto_487812 ?auto_487813 ?auto_487814 ?auto_487815 ?auto_487816 ?auto_487817 ?auto_487818 ?auto_487819 ?auto_487820 ?auto_487821 ?auto_487822 ?auto_487823 ?auto_487824 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487869 - BLOCK
      ?auto_487870 - BLOCK
      ?auto_487871 - BLOCK
      ?auto_487872 - BLOCK
      ?auto_487873 - BLOCK
      ?auto_487874 - BLOCK
      ?auto_487875 - BLOCK
      ?auto_487876 - BLOCK
      ?auto_487877 - BLOCK
      ?auto_487878 - BLOCK
      ?auto_487879 - BLOCK
      ?auto_487880 - BLOCK
      ?auto_487881 - BLOCK
      ?auto_487882 - BLOCK
    )
    :vars
    (
      ?auto_487883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487882 ?auto_487883 ) ( ON-TABLE ?auto_487869 ) ( ON ?auto_487870 ?auto_487869 ) ( not ( = ?auto_487869 ?auto_487870 ) ) ( not ( = ?auto_487869 ?auto_487871 ) ) ( not ( = ?auto_487869 ?auto_487872 ) ) ( not ( = ?auto_487869 ?auto_487873 ) ) ( not ( = ?auto_487869 ?auto_487874 ) ) ( not ( = ?auto_487869 ?auto_487875 ) ) ( not ( = ?auto_487869 ?auto_487876 ) ) ( not ( = ?auto_487869 ?auto_487877 ) ) ( not ( = ?auto_487869 ?auto_487878 ) ) ( not ( = ?auto_487869 ?auto_487879 ) ) ( not ( = ?auto_487869 ?auto_487880 ) ) ( not ( = ?auto_487869 ?auto_487881 ) ) ( not ( = ?auto_487869 ?auto_487882 ) ) ( not ( = ?auto_487869 ?auto_487883 ) ) ( not ( = ?auto_487870 ?auto_487871 ) ) ( not ( = ?auto_487870 ?auto_487872 ) ) ( not ( = ?auto_487870 ?auto_487873 ) ) ( not ( = ?auto_487870 ?auto_487874 ) ) ( not ( = ?auto_487870 ?auto_487875 ) ) ( not ( = ?auto_487870 ?auto_487876 ) ) ( not ( = ?auto_487870 ?auto_487877 ) ) ( not ( = ?auto_487870 ?auto_487878 ) ) ( not ( = ?auto_487870 ?auto_487879 ) ) ( not ( = ?auto_487870 ?auto_487880 ) ) ( not ( = ?auto_487870 ?auto_487881 ) ) ( not ( = ?auto_487870 ?auto_487882 ) ) ( not ( = ?auto_487870 ?auto_487883 ) ) ( not ( = ?auto_487871 ?auto_487872 ) ) ( not ( = ?auto_487871 ?auto_487873 ) ) ( not ( = ?auto_487871 ?auto_487874 ) ) ( not ( = ?auto_487871 ?auto_487875 ) ) ( not ( = ?auto_487871 ?auto_487876 ) ) ( not ( = ?auto_487871 ?auto_487877 ) ) ( not ( = ?auto_487871 ?auto_487878 ) ) ( not ( = ?auto_487871 ?auto_487879 ) ) ( not ( = ?auto_487871 ?auto_487880 ) ) ( not ( = ?auto_487871 ?auto_487881 ) ) ( not ( = ?auto_487871 ?auto_487882 ) ) ( not ( = ?auto_487871 ?auto_487883 ) ) ( not ( = ?auto_487872 ?auto_487873 ) ) ( not ( = ?auto_487872 ?auto_487874 ) ) ( not ( = ?auto_487872 ?auto_487875 ) ) ( not ( = ?auto_487872 ?auto_487876 ) ) ( not ( = ?auto_487872 ?auto_487877 ) ) ( not ( = ?auto_487872 ?auto_487878 ) ) ( not ( = ?auto_487872 ?auto_487879 ) ) ( not ( = ?auto_487872 ?auto_487880 ) ) ( not ( = ?auto_487872 ?auto_487881 ) ) ( not ( = ?auto_487872 ?auto_487882 ) ) ( not ( = ?auto_487872 ?auto_487883 ) ) ( not ( = ?auto_487873 ?auto_487874 ) ) ( not ( = ?auto_487873 ?auto_487875 ) ) ( not ( = ?auto_487873 ?auto_487876 ) ) ( not ( = ?auto_487873 ?auto_487877 ) ) ( not ( = ?auto_487873 ?auto_487878 ) ) ( not ( = ?auto_487873 ?auto_487879 ) ) ( not ( = ?auto_487873 ?auto_487880 ) ) ( not ( = ?auto_487873 ?auto_487881 ) ) ( not ( = ?auto_487873 ?auto_487882 ) ) ( not ( = ?auto_487873 ?auto_487883 ) ) ( not ( = ?auto_487874 ?auto_487875 ) ) ( not ( = ?auto_487874 ?auto_487876 ) ) ( not ( = ?auto_487874 ?auto_487877 ) ) ( not ( = ?auto_487874 ?auto_487878 ) ) ( not ( = ?auto_487874 ?auto_487879 ) ) ( not ( = ?auto_487874 ?auto_487880 ) ) ( not ( = ?auto_487874 ?auto_487881 ) ) ( not ( = ?auto_487874 ?auto_487882 ) ) ( not ( = ?auto_487874 ?auto_487883 ) ) ( not ( = ?auto_487875 ?auto_487876 ) ) ( not ( = ?auto_487875 ?auto_487877 ) ) ( not ( = ?auto_487875 ?auto_487878 ) ) ( not ( = ?auto_487875 ?auto_487879 ) ) ( not ( = ?auto_487875 ?auto_487880 ) ) ( not ( = ?auto_487875 ?auto_487881 ) ) ( not ( = ?auto_487875 ?auto_487882 ) ) ( not ( = ?auto_487875 ?auto_487883 ) ) ( not ( = ?auto_487876 ?auto_487877 ) ) ( not ( = ?auto_487876 ?auto_487878 ) ) ( not ( = ?auto_487876 ?auto_487879 ) ) ( not ( = ?auto_487876 ?auto_487880 ) ) ( not ( = ?auto_487876 ?auto_487881 ) ) ( not ( = ?auto_487876 ?auto_487882 ) ) ( not ( = ?auto_487876 ?auto_487883 ) ) ( not ( = ?auto_487877 ?auto_487878 ) ) ( not ( = ?auto_487877 ?auto_487879 ) ) ( not ( = ?auto_487877 ?auto_487880 ) ) ( not ( = ?auto_487877 ?auto_487881 ) ) ( not ( = ?auto_487877 ?auto_487882 ) ) ( not ( = ?auto_487877 ?auto_487883 ) ) ( not ( = ?auto_487878 ?auto_487879 ) ) ( not ( = ?auto_487878 ?auto_487880 ) ) ( not ( = ?auto_487878 ?auto_487881 ) ) ( not ( = ?auto_487878 ?auto_487882 ) ) ( not ( = ?auto_487878 ?auto_487883 ) ) ( not ( = ?auto_487879 ?auto_487880 ) ) ( not ( = ?auto_487879 ?auto_487881 ) ) ( not ( = ?auto_487879 ?auto_487882 ) ) ( not ( = ?auto_487879 ?auto_487883 ) ) ( not ( = ?auto_487880 ?auto_487881 ) ) ( not ( = ?auto_487880 ?auto_487882 ) ) ( not ( = ?auto_487880 ?auto_487883 ) ) ( not ( = ?auto_487881 ?auto_487882 ) ) ( not ( = ?auto_487881 ?auto_487883 ) ) ( not ( = ?auto_487882 ?auto_487883 ) ) ( ON ?auto_487881 ?auto_487882 ) ( ON ?auto_487880 ?auto_487881 ) ( ON ?auto_487879 ?auto_487880 ) ( ON ?auto_487878 ?auto_487879 ) ( ON ?auto_487877 ?auto_487878 ) ( ON ?auto_487876 ?auto_487877 ) ( ON ?auto_487875 ?auto_487876 ) ( ON ?auto_487874 ?auto_487875 ) ( ON ?auto_487873 ?auto_487874 ) ( ON ?auto_487872 ?auto_487873 ) ( CLEAR ?auto_487870 ) ( ON ?auto_487871 ?auto_487872 ) ( CLEAR ?auto_487871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_487869 ?auto_487870 ?auto_487871 )
      ( MAKE-14PILE ?auto_487869 ?auto_487870 ?auto_487871 ?auto_487872 ?auto_487873 ?auto_487874 ?auto_487875 ?auto_487876 ?auto_487877 ?auto_487878 ?auto_487879 ?auto_487880 ?auto_487881 ?auto_487882 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487927 - BLOCK
      ?auto_487928 - BLOCK
      ?auto_487929 - BLOCK
      ?auto_487930 - BLOCK
      ?auto_487931 - BLOCK
      ?auto_487932 - BLOCK
      ?auto_487933 - BLOCK
      ?auto_487934 - BLOCK
      ?auto_487935 - BLOCK
      ?auto_487936 - BLOCK
      ?auto_487937 - BLOCK
      ?auto_487938 - BLOCK
      ?auto_487939 - BLOCK
      ?auto_487940 - BLOCK
    )
    :vars
    (
      ?auto_487941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487940 ?auto_487941 ) ( ON-TABLE ?auto_487927 ) ( not ( = ?auto_487927 ?auto_487928 ) ) ( not ( = ?auto_487927 ?auto_487929 ) ) ( not ( = ?auto_487927 ?auto_487930 ) ) ( not ( = ?auto_487927 ?auto_487931 ) ) ( not ( = ?auto_487927 ?auto_487932 ) ) ( not ( = ?auto_487927 ?auto_487933 ) ) ( not ( = ?auto_487927 ?auto_487934 ) ) ( not ( = ?auto_487927 ?auto_487935 ) ) ( not ( = ?auto_487927 ?auto_487936 ) ) ( not ( = ?auto_487927 ?auto_487937 ) ) ( not ( = ?auto_487927 ?auto_487938 ) ) ( not ( = ?auto_487927 ?auto_487939 ) ) ( not ( = ?auto_487927 ?auto_487940 ) ) ( not ( = ?auto_487927 ?auto_487941 ) ) ( not ( = ?auto_487928 ?auto_487929 ) ) ( not ( = ?auto_487928 ?auto_487930 ) ) ( not ( = ?auto_487928 ?auto_487931 ) ) ( not ( = ?auto_487928 ?auto_487932 ) ) ( not ( = ?auto_487928 ?auto_487933 ) ) ( not ( = ?auto_487928 ?auto_487934 ) ) ( not ( = ?auto_487928 ?auto_487935 ) ) ( not ( = ?auto_487928 ?auto_487936 ) ) ( not ( = ?auto_487928 ?auto_487937 ) ) ( not ( = ?auto_487928 ?auto_487938 ) ) ( not ( = ?auto_487928 ?auto_487939 ) ) ( not ( = ?auto_487928 ?auto_487940 ) ) ( not ( = ?auto_487928 ?auto_487941 ) ) ( not ( = ?auto_487929 ?auto_487930 ) ) ( not ( = ?auto_487929 ?auto_487931 ) ) ( not ( = ?auto_487929 ?auto_487932 ) ) ( not ( = ?auto_487929 ?auto_487933 ) ) ( not ( = ?auto_487929 ?auto_487934 ) ) ( not ( = ?auto_487929 ?auto_487935 ) ) ( not ( = ?auto_487929 ?auto_487936 ) ) ( not ( = ?auto_487929 ?auto_487937 ) ) ( not ( = ?auto_487929 ?auto_487938 ) ) ( not ( = ?auto_487929 ?auto_487939 ) ) ( not ( = ?auto_487929 ?auto_487940 ) ) ( not ( = ?auto_487929 ?auto_487941 ) ) ( not ( = ?auto_487930 ?auto_487931 ) ) ( not ( = ?auto_487930 ?auto_487932 ) ) ( not ( = ?auto_487930 ?auto_487933 ) ) ( not ( = ?auto_487930 ?auto_487934 ) ) ( not ( = ?auto_487930 ?auto_487935 ) ) ( not ( = ?auto_487930 ?auto_487936 ) ) ( not ( = ?auto_487930 ?auto_487937 ) ) ( not ( = ?auto_487930 ?auto_487938 ) ) ( not ( = ?auto_487930 ?auto_487939 ) ) ( not ( = ?auto_487930 ?auto_487940 ) ) ( not ( = ?auto_487930 ?auto_487941 ) ) ( not ( = ?auto_487931 ?auto_487932 ) ) ( not ( = ?auto_487931 ?auto_487933 ) ) ( not ( = ?auto_487931 ?auto_487934 ) ) ( not ( = ?auto_487931 ?auto_487935 ) ) ( not ( = ?auto_487931 ?auto_487936 ) ) ( not ( = ?auto_487931 ?auto_487937 ) ) ( not ( = ?auto_487931 ?auto_487938 ) ) ( not ( = ?auto_487931 ?auto_487939 ) ) ( not ( = ?auto_487931 ?auto_487940 ) ) ( not ( = ?auto_487931 ?auto_487941 ) ) ( not ( = ?auto_487932 ?auto_487933 ) ) ( not ( = ?auto_487932 ?auto_487934 ) ) ( not ( = ?auto_487932 ?auto_487935 ) ) ( not ( = ?auto_487932 ?auto_487936 ) ) ( not ( = ?auto_487932 ?auto_487937 ) ) ( not ( = ?auto_487932 ?auto_487938 ) ) ( not ( = ?auto_487932 ?auto_487939 ) ) ( not ( = ?auto_487932 ?auto_487940 ) ) ( not ( = ?auto_487932 ?auto_487941 ) ) ( not ( = ?auto_487933 ?auto_487934 ) ) ( not ( = ?auto_487933 ?auto_487935 ) ) ( not ( = ?auto_487933 ?auto_487936 ) ) ( not ( = ?auto_487933 ?auto_487937 ) ) ( not ( = ?auto_487933 ?auto_487938 ) ) ( not ( = ?auto_487933 ?auto_487939 ) ) ( not ( = ?auto_487933 ?auto_487940 ) ) ( not ( = ?auto_487933 ?auto_487941 ) ) ( not ( = ?auto_487934 ?auto_487935 ) ) ( not ( = ?auto_487934 ?auto_487936 ) ) ( not ( = ?auto_487934 ?auto_487937 ) ) ( not ( = ?auto_487934 ?auto_487938 ) ) ( not ( = ?auto_487934 ?auto_487939 ) ) ( not ( = ?auto_487934 ?auto_487940 ) ) ( not ( = ?auto_487934 ?auto_487941 ) ) ( not ( = ?auto_487935 ?auto_487936 ) ) ( not ( = ?auto_487935 ?auto_487937 ) ) ( not ( = ?auto_487935 ?auto_487938 ) ) ( not ( = ?auto_487935 ?auto_487939 ) ) ( not ( = ?auto_487935 ?auto_487940 ) ) ( not ( = ?auto_487935 ?auto_487941 ) ) ( not ( = ?auto_487936 ?auto_487937 ) ) ( not ( = ?auto_487936 ?auto_487938 ) ) ( not ( = ?auto_487936 ?auto_487939 ) ) ( not ( = ?auto_487936 ?auto_487940 ) ) ( not ( = ?auto_487936 ?auto_487941 ) ) ( not ( = ?auto_487937 ?auto_487938 ) ) ( not ( = ?auto_487937 ?auto_487939 ) ) ( not ( = ?auto_487937 ?auto_487940 ) ) ( not ( = ?auto_487937 ?auto_487941 ) ) ( not ( = ?auto_487938 ?auto_487939 ) ) ( not ( = ?auto_487938 ?auto_487940 ) ) ( not ( = ?auto_487938 ?auto_487941 ) ) ( not ( = ?auto_487939 ?auto_487940 ) ) ( not ( = ?auto_487939 ?auto_487941 ) ) ( not ( = ?auto_487940 ?auto_487941 ) ) ( ON ?auto_487939 ?auto_487940 ) ( ON ?auto_487938 ?auto_487939 ) ( ON ?auto_487937 ?auto_487938 ) ( ON ?auto_487936 ?auto_487937 ) ( ON ?auto_487935 ?auto_487936 ) ( ON ?auto_487934 ?auto_487935 ) ( ON ?auto_487933 ?auto_487934 ) ( ON ?auto_487932 ?auto_487933 ) ( ON ?auto_487931 ?auto_487932 ) ( ON ?auto_487930 ?auto_487931 ) ( ON ?auto_487929 ?auto_487930 ) ( CLEAR ?auto_487927 ) ( ON ?auto_487928 ?auto_487929 ) ( CLEAR ?auto_487928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_487927 ?auto_487928 )
      ( MAKE-14PILE ?auto_487927 ?auto_487928 ?auto_487929 ?auto_487930 ?auto_487931 ?auto_487932 ?auto_487933 ?auto_487934 ?auto_487935 ?auto_487936 ?auto_487937 ?auto_487938 ?auto_487939 ?auto_487940 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_487985 - BLOCK
      ?auto_487986 - BLOCK
      ?auto_487987 - BLOCK
      ?auto_487988 - BLOCK
      ?auto_487989 - BLOCK
      ?auto_487990 - BLOCK
      ?auto_487991 - BLOCK
      ?auto_487992 - BLOCK
      ?auto_487993 - BLOCK
      ?auto_487994 - BLOCK
      ?auto_487995 - BLOCK
      ?auto_487996 - BLOCK
      ?auto_487997 - BLOCK
      ?auto_487998 - BLOCK
    )
    :vars
    (
      ?auto_487999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_487998 ?auto_487999 ) ( not ( = ?auto_487985 ?auto_487986 ) ) ( not ( = ?auto_487985 ?auto_487987 ) ) ( not ( = ?auto_487985 ?auto_487988 ) ) ( not ( = ?auto_487985 ?auto_487989 ) ) ( not ( = ?auto_487985 ?auto_487990 ) ) ( not ( = ?auto_487985 ?auto_487991 ) ) ( not ( = ?auto_487985 ?auto_487992 ) ) ( not ( = ?auto_487985 ?auto_487993 ) ) ( not ( = ?auto_487985 ?auto_487994 ) ) ( not ( = ?auto_487985 ?auto_487995 ) ) ( not ( = ?auto_487985 ?auto_487996 ) ) ( not ( = ?auto_487985 ?auto_487997 ) ) ( not ( = ?auto_487985 ?auto_487998 ) ) ( not ( = ?auto_487985 ?auto_487999 ) ) ( not ( = ?auto_487986 ?auto_487987 ) ) ( not ( = ?auto_487986 ?auto_487988 ) ) ( not ( = ?auto_487986 ?auto_487989 ) ) ( not ( = ?auto_487986 ?auto_487990 ) ) ( not ( = ?auto_487986 ?auto_487991 ) ) ( not ( = ?auto_487986 ?auto_487992 ) ) ( not ( = ?auto_487986 ?auto_487993 ) ) ( not ( = ?auto_487986 ?auto_487994 ) ) ( not ( = ?auto_487986 ?auto_487995 ) ) ( not ( = ?auto_487986 ?auto_487996 ) ) ( not ( = ?auto_487986 ?auto_487997 ) ) ( not ( = ?auto_487986 ?auto_487998 ) ) ( not ( = ?auto_487986 ?auto_487999 ) ) ( not ( = ?auto_487987 ?auto_487988 ) ) ( not ( = ?auto_487987 ?auto_487989 ) ) ( not ( = ?auto_487987 ?auto_487990 ) ) ( not ( = ?auto_487987 ?auto_487991 ) ) ( not ( = ?auto_487987 ?auto_487992 ) ) ( not ( = ?auto_487987 ?auto_487993 ) ) ( not ( = ?auto_487987 ?auto_487994 ) ) ( not ( = ?auto_487987 ?auto_487995 ) ) ( not ( = ?auto_487987 ?auto_487996 ) ) ( not ( = ?auto_487987 ?auto_487997 ) ) ( not ( = ?auto_487987 ?auto_487998 ) ) ( not ( = ?auto_487987 ?auto_487999 ) ) ( not ( = ?auto_487988 ?auto_487989 ) ) ( not ( = ?auto_487988 ?auto_487990 ) ) ( not ( = ?auto_487988 ?auto_487991 ) ) ( not ( = ?auto_487988 ?auto_487992 ) ) ( not ( = ?auto_487988 ?auto_487993 ) ) ( not ( = ?auto_487988 ?auto_487994 ) ) ( not ( = ?auto_487988 ?auto_487995 ) ) ( not ( = ?auto_487988 ?auto_487996 ) ) ( not ( = ?auto_487988 ?auto_487997 ) ) ( not ( = ?auto_487988 ?auto_487998 ) ) ( not ( = ?auto_487988 ?auto_487999 ) ) ( not ( = ?auto_487989 ?auto_487990 ) ) ( not ( = ?auto_487989 ?auto_487991 ) ) ( not ( = ?auto_487989 ?auto_487992 ) ) ( not ( = ?auto_487989 ?auto_487993 ) ) ( not ( = ?auto_487989 ?auto_487994 ) ) ( not ( = ?auto_487989 ?auto_487995 ) ) ( not ( = ?auto_487989 ?auto_487996 ) ) ( not ( = ?auto_487989 ?auto_487997 ) ) ( not ( = ?auto_487989 ?auto_487998 ) ) ( not ( = ?auto_487989 ?auto_487999 ) ) ( not ( = ?auto_487990 ?auto_487991 ) ) ( not ( = ?auto_487990 ?auto_487992 ) ) ( not ( = ?auto_487990 ?auto_487993 ) ) ( not ( = ?auto_487990 ?auto_487994 ) ) ( not ( = ?auto_487990 ?auto_487995 ) ) ( not ( = ?auto_487990 ?auto_487996 ) ) ( not ( = ?auto_487990 ?auto_487997 ) ) ( not ( = ?auto_487990 ?auto_487998 ) ) ( not ( = ?auto_487990 ?auto_487999 ) ) ( not ( = ?auto_487991 ?auto_487992 ) ) ( not ( = ?auto_487991 ?auto_487993 ) ) ( not ( = ?auto_487991 ?auto_487994 ) ) ( not ( = ?auto_487991 ?auto_487995 ) ) ( not ( = ?auto_487991 ?auto_487996 ) ) ( not ( = ?auto_487991 ?auto_487997 ) ) ( not ( = ?auto_487991 ?auto_487998 ) ) ( not ( = ?auto_487991 ?auto_487999 ) ) ( not ( = ?auto_487992 ?auto_487993 ) ) ( not ( = ?auto_487992 ?auto_487994 ) ) ( not ( = ?auto_487992 ?auto_487995 ) ) ( not ( = ?auto_487992 ?auto_487996 ) ) ( not ( = ?auto_487992 ?auto_487997 ) ) ( not ( = ?auto_487992 ?auto_487998 ) ) ( not ( = ?auto_487992 ?auto_487999 ) ) ( not ( = ?auto_487993 ?auto_487994 ) ) ( not ( = ?auto_487993 ?auto_487995 ) ) ( not ( = ?auto_487993 ?auto_487996 ) ) ( not ( = ?auto_487993 ?auto_487997 ) ) ( not ( = ?auto_487993 ?auto_487998 ) ) ( not ( = ?auto_487993 ?auto_487999 ) ) ( not ( = ?auto_487994 ?auto_487995 ) ) ( not ( = ?auto_487994 ?auto_487996 ) ) ( not ( = ?auto_487994 ?auto_487997 ) ) ( not ( = ?auto_487994 ?auto_487998 ) ) ( not ( = ?auto_487994 ?auto_487999 ) ) ( not ( = ?auto_487995 ?auto_487996 ) ) ( not ( = ?auto_487995 ?auto_487997 ) ) ( not ( = ?auto_487995 ?auto_487998 ) ) ( not ( = ?auto_487995 ?auto_487999 ) ) ( not ( = ?auto_487996 ?auto_487997 ) ) ( not ( = ?auto_487996 ?auto_487998 ) ) ( not ( = ?auto_487996 ?auto_487999 ) ) ( not ( = ?auto_487997 ?auto_487998 ) ) ( not ( = ?auto_487997 ?auto_487999 ) ) ( not ( = ?auto_487998 ?auto_487999 ) ) ( ON ?auto_487997 ?auto_487998 ) ( ON ?auto_487996 ?auto_487997 ) ( ON ?auto_487995 ?auto_487996 ) ( ON ?auto_487994 ?auto_487995 ) ( ON ?auto_487993 ?auto_487994 ) ( ON ?auto_487992 ?auto_487993 ) ( ON ?auto_487991 ?auto_487992 ) ( ON ?auto_487990 ?auto_487991 ) ( ON ?auto_487989 ?auto_487990 ) ( ON ?auto_487988 ?auto_487989 ) ( ON ?auto_487987 ?auto_487988 ) ( ON ?auto_487986 ?auto_487987 ) ( ON ?auto_487985 ?auto_487986 ) ( CLEAR ?auto_487985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_487985 )
      ( MAKE-14PILE ?auto_487985 ?auto_487986 ?auto_487987 ?auto_487988 ?auto_487989 ?auto_487990 ?auto_487991 ?auto_487992 ?auto_487993 ?auto_487994 ?auto_487995 ?auto_487996 ?auto_487997 ?auto_487998 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488044 - BLOCK
      ?auto_488045 - BLOCK
      ?auto_488046 - BLOCK
      ?auto_488047 - BLOCK
      ?auto_488048 - BLOCK
      ?auto_488049 - BLOCK
      ?auto_488050 - BLOCK
      ?auto_488051 - BLOCK
      ?auto_488052 - BLOCK
      ?auto_488053 - BLOCK
      ?auto_488054 - BLOCK
      ?auto_488055 - BLOCK
      ?auto_488056 - BLOCK
      ?auto_488057 - BLOCK
      ?auto_488058 - BLOCK
    )
    :vars
    (
      ?auto_488059 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_488057 ) ( ON ?auto_488058 ?auto_488059 ) ( CLEAR ?auto_488058 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_488044 ) ( ON ?auto_488045 ?auto_488044 ) ( ON ?auto_488046 ?auto_488045 ) ( ON ?auto_488047 ?auto_488046 ) ( ON ?auto_488048 ?auto_488047 ) ( ON ?auto_488049 ?auto_488048 ) ( ON ?auto_488050 ?auto_488049 ) ( ON ?auto_488051 ?auto_488050 ) ( ON ?auto_488052 ?auto_488051 ) ( ON ?auto_488053 ?auto_488052 ) ( ON ?auto_488054 ?auto_488053 ) ( ON ?auto_488055 ?auto_488054 ) ( ON ?auto_488056 ?auto_488055 ) ( ON ?auto_488057 ?auto_488056 ) ( not ( = ?auto_488044 ?auto_488045 ) ) ( not ( = ?auto_488044 ?auto_488046 ) ) ( not ( = ?auto_488044 ?auto_488047 ) ) ( not ( = ?auto_488044 ?auto_488048 ) ) ( not ( = ?auto_488044 ?auto_488049 ) ) ( not ( = ?auto_488044 ?auto_488050 ) ) ( not ( = ?auto_488044 ?auto_488051 ) ) ( not ( = ?auto_488044 ?auto_488052 ) ) ( not ( = ?auto_488044 ?auto_488053 ) ) ( not ( = ?auto_488044 ?auto_488054 ) ) ( not ( = ?auto_488044 ?auto_488055 ) ) ( not ( = ?auto_488044 ?auto_488056 ) ) ( not ( = ?auto_488044 ?auto_488057 ) ) ( not ( = ?auto_488044 ?auto_488058 ) ) ( not ( = ?auto_488044 ?auto_488059 ) ) ( not ( = ?auto_488045 ?auto_488046 ) ) ( not ( = ?auto_488045 ?auto_488047 ) ) ( not ( = ?auto_488045 ?auto_488048 ) ) ( not ( = ?auto_488045 ?auto_488049 ) ) ( not ( = ?auto_488045 ?auto_488050 ) ) ( not ( = ?auto_488045 ?auto_488051 ) ) ( not ( = ?auto_488045 ?auto_488052 ) ) ( not ( = ?auto_488045 ?auto_488053 ) ) ( not ( = ?auto_488045 ?auto_488054 ) ) ( not ( = ?auto_488045 ?auto_488055 ) ) ( not ( = ?auto_488045 ?auto_488056 ) ) ( not ( = ?auto_488045 ?auto_488057 ) ) ( not ( = ?auto_488045 ?auto_488058 ) ) ( not ( = ?auto_488045 ?auto_488059 ) ) ( not ( = ?auto_488046 ?auto_488047 ) ) ( not ( = ?auto_488046 ?auto_488048 ) ) ( not ( = ?auto_488046 ?auto_488049 ) ) ( not ( = ?auto_488046 ?auto_488050 ) ) ( not ( = ?auto_488046 ?auto_488051 ) ) ( not ( = ?auto_488046 ?auto_488052 ) ) ( not ( = ?auto_488046 ?auto_488053 ) ) ( not ( = ?auto_488046 ?auto_488054 ) ) ( not ( = ?auto_488046 ?auto_488055 ) ) ( not ( = ?auto_488046 ?auto_488056 ) ) ( not ( = ?auto_488046 ?auto_488057 ) ) ( not ( = ?auto_488046 ?auto_488058 ) ) ( not ( = ?auto_488046 ?auto_488059 ) ) ( not ( = ?auto_488047 ?auto_488048 ) ) ( not ( = ?auto_488047 ?auto_488049 ) ) ( not ( = ?auto_488047 ?auto_488050 ) ) ( not ( = ?auto_488047 ?auto_488051 ) ) ( not ( = ?auto_488047 ?auto_488052 ) ) ( not ( = ?auto_488047 ?auto_488053 ) ) ( not ( = ?auto_488047 ?auto_488054 ) ) ( not ( = ?auto_488047 ?auto_488055 ) ) ( not ( = ?auto_488047 ?auto_488056 ) ) ( not ( = ?auto_488047 ?auto_488057 ) ) ( not ( = ?auto_488047 ?auto_488058 ) ) ( not ( = ?auto_488047 ?auto_488059 ) ) ( not ( = ?auto_488048 ?auto_488049 ) ) ( not ( = ?auto_488048 ?auto_488050 ) ) ( not ( = ?auto_488048 ?auto_488051 ) ) ( not ( = ?auto_488048 ?auto_488052 ) ) ( not ( = ?auto_488048 ?auto_488053 ) ) ( not ( = ?auto_488048 ?auto_488054 ) ) ( not ( = ?auto_488048 ?auto_488055 ) ) ( not ( = ?auto_488048 ?auto_488056 ) ) ( not ( = ?auto_488048 ?auto_488057 ) ) ( not ( = ?auto_488048 ?auto_488058 ) ) ( not ( = ?auto_488048 ?auto_488059 ) ) ( not ( = ?auto_488049 ?auto_488050 ) ) ( not ( = ?auto_488049 ?auto_488051 ) ) ( not ( = ?auto_488049 ?auto_488052 ) ) ( not ( = ?auto_488049 ?auto_488053 ) ) ( not ( = ?auto_488049 ?auto_488054 ) ) ( not ( = ?auto_488049 ?auto_488055 ) ) ( not ( = ?auto_488049 ?auto_488056 ) ) ( not ( = ?auto_488049 ?auto_488057 ) ) ( not ( = ?auto_488049 ?auto_488058 ) ) ( not ( = ?auto_488049 ?auto_488059 ) ) ( not ( = ?auto_488050 ?auto_488051 ) ) ( not ( = ?auto_488050 ?auto_488052 ) ) ( not ( = ?auto_488050 ?auto_488053 ) ) ( not ( = ?auto_488050 ?auto_488054 ) ) ( not ( = ?auto_488050 ?auto_488055 ) ) ( not ( = ?auto_488050 ?auto_488056 ) ) ( not ( = ?auto_488050 ?auto_488057 ) ) ( not ( = ?auto_488050 ?auto_488058 ) ) ( not ( = ?auto_488050 ?auto_488059 ) ) ( not ( = ?auto_488051 ?auto_488052 ) ) ( not ( = ?auto_488051 ?auto_488053 ) ) ( not ( = ?auto_488051 ?auto_488054 ) ) ( not ( = ?auto_488051 ?auto_488055 ) ) ( not ( = ?auto_488051 ?auto_488056 ) ) ( not ( = ?auto_488051 ?auto_488057 ) ) ( not ( = ?auto_488051 ?auto_488058 ) ) ( not ( = ?auto_488051 ?auto_488059 ) ) ( not ( = ?auto_488052 ?auto_488053 ) ) ( not ( = ?auto_488052 ?auto_488054 ) ) ( not ( = ?auto_488052 ?auto_488055 ) ) ( not ( = ?auto_488052 ?auto_488056 ) ) ( not ( = ?auto_488052 ?auto_488057 ) ) ( not ( = ?auto_488052 ?auto_488058 ) ) ( not ( = ?auto_488052 ?auto_488059 ) ) ( not ( = ?auto_488053 ?auto_488054 ) ) ( not ( = ?auto_488053 ?auto_488055 ) ) ( not ( = ?auto_488053 ?auto_488056 ) ) ( not ( = ?auto_488053 ?auto_488057 ) ) ( not ( = ?auto_488053 ?auto_488058 ) ) ( not ( = ?auto_488053 ?auto_488059 ) ) ( not ( = ?auto_488054 ?auto_488055 ) ) ( not ( = ?auto_488054 ?auto_488056 ) ) ( not ( = ?auto_488054 ?auto_488057 ) ) ( not ( = ?auto_488054 ?auto_488058 ) ) ( not ( = ?auto_488054 ?auto_488059 ) ) ( not ( = ?auto_488055 ?auto_488056 ) ) ( not ( = ?auto_488055 ?auto_488057 ) ) ( not ( = ?auto_488055 ?auto_488058 ) ) ( not ( = ?auto_488055 ?auto_488059 ) ) ( not ( = ?auto_488056 ?auto_488057 ) ) ( not ( = ?auto_488056 ?auto_488058 ) ) ( not ( = ?auto_488056 ?auto_488059 ) ) ( not ( = ?auto_488057 ?auto_488058 ) ) ( not ( = ?auto_488057 ?auto_488059 ) ) ( not ( = ?auto_488058 ?auto_488059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_488058 ?auto_488059 )
      ( !STACK ?auto_488058 ?auto_488057 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488106 - BLOCK
      ?auto_488107 - BLOCK
      ?auto_488108 - BLOCK
      ?auto_488109 - BLOCK
      ?auto_488110 - BLOCK
      ?auto_488111 - BLOCK
      ?auto_488112 - BLOCK
      ?auto_488113 - BLOCK
      ?auto_488114 - BLOCK
      ?auto_488115 - BLOCK
      ?auto_488116 - BLOCK
      ?auto_488117 - BLOCK
      ?auto_488118 - BLOCK
      ?auto_488119 - BLOCK
      ?auto_488120 - BLOCK
    )
    :vars
    (
      ?auto_488121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488120 ?auto_488121 ) ( ON-TABLE ?auto_488106 ) ( ON ?auto_488107 ?auto_488106 ) ( ON ?auto_488108 ?auto_488107 ) ( ON ?auto_488109 ?auto_488108 ) ( ON ?auto_488110 ?auto_488109 ) ( ON ?auto_488111 ?auto_488110 ) ( ON ?auto_488112 ?auto_488111 ) ( ON ?auto_488113 ?auto_488112 ) ( ON ?auto_488114 ?auto_488113 ) ( ON ?auto_488115 ?auto_488114 ) ( ON ?auto_488116 ?auto_488115 ) ( ON ?auto_488117 ?auto_488116 ) ( ON ?auto_488118 ?auto_488117 ) ( not ( = ?auto_488106 ?auto_488107 ) ) ( not ( = ?auto_488106 ?auto_488108 ) ) ( not ( = ?auto_488106 ?auto_488109 ) ) ( not ( = ?auto_488106 ?auto_488110 ) ) ( not ( = ?auto_488106 ?auto_488111 ) ) ( not ( = ?auto_488106 ?auto_488112 ) ) ( not ( = ?auto_488106 ?auto_488113 ) ) ( not ( = ?auto_488106 ?auto_488114 ) ) ( not ( = ?auto_488106 ?auto_488115 ) ) ( not ( = ?auto_488106 ?auto_488116 ) ) ( not ( = ?auto_488106 ?auto_488117 ) ) ( not ( = ?auto_488106 ?auto_488118 ) ) ( not ( = ?auto_488106 ?auto_488119 ) ) ( not ( = ?auto_488106 ?auto_488120 ) ) ( not ( = ?auto_488106 ?auto_488121 ) ) ( not ( = ?auto_488107 ?auto_488108 ) ) ( not ( = ?auto_488107 ?auto_488109 ) ) ( not ( = ?auto_488107 ?auto_488110 ) ) ( not ( = ?auto_488107 ?auto_488111 ) ) ( not ( = ?auto_488107 ?auto_488112 ) ) ( not ( = ?auto_488107 ?auto_488113 ) ) ( not ( = ?auto_488107 ?auto_488114 ) ) ( not ( = ?auto_488107 ?auto_488115 ) ) ( not ( = ?auto_488107 ?auto_488116 ) ) ( not ( = ?auto_488107 ?auto_488117 ) ) ( not ( = ?auto_488107 ?auto_488118 ) ) ( not ( = ?auto_488107 ?auto_488119 ) ) ( not ( = ?auto_488107 ?auto_488120 ) ) ( not ( = ?auto_488107 ?auto_488121 ) ) ( not ( = ?auto_488108 ?auto_488109 ) ) ( not ( = ?auto_488108 ?auto_488110 ) ) ( not ( = ?auto_488108 ?auto_488111 ) ) ( not ( = ?auto_488108 ?auto_488112 ) ) ( not ( = ?auto_488108 ?auto_488113 ) ) ( not ( = ?auto_488108 ?auto_488114 ) ) ( not ( = ?auto_488108 ?auto_488115 ) ) ( not ( = ?auto_488108 ?auto_488116 ) ) ( not ( = ?auto_488108 ?auto_488117 ) ) ( not ( = ?auto_488108 ?auto_488118 ) ) ( not ( = ?auto_488108 ?auto_488119 ) ) ( not ( = ?auto_488108 ?auto_488120 ) ) ( not ( = ?auto_488108 ?auto_488121 ) ) ( not ( = ?auto_488109 ?auto_488110 ) ) ( not ( = ?auto_488109 ?auto_488111 ) ) ( not ( = ?auto_488109 ?auto_488112 ) ) ( not ( = ?auto_488109 ?auto_488113 ) ) ( not ( = ?auto_488109 ?auto_488114 ) ) ( not ( = ?auto_488109 ?auto_488115 ) ) ( not ( = ?auto_488109 ?auto_488116 ) ) ( not ( = ?auto_488109 ?auto_488117 ) ) ( not ( = ?auto_488109 ?auto_488118 ) ) ( not ( = ?auto_488109 ?auto_488119 ) ) ( not ( = ?auto_488109 ?auto_488120 ) ) ( not ( = ?auto_488109 ?auto_488121 ) ) ( not ( = ?auto_488110 ?auto_488111 ) ) ( not ( = ?auto_488110 ?auto_488112 ) ) ( not ( = ?auto_488110 ?auto_488113 ) ) ( not ( = ?auto_488110 ?auto_488114 ) ) ( not ( = ?auto_488110 ?auto_488115 ) ) ( not ( = ?auto_488110 ?auto_488116 ) ) ( not ( = ?auto_488110 ?auto_488117 ) ) ( not ( = ?auto_488110 ?auto_488118 ) ) ( not ( = ?auto_488110 ?auto_488119 ) ) ( not ( = ?auto_488110 ?auto_488120 ) ) ( not ( = ?auto_488110 ?auto_488121 ) ) ( not ( = ?auto_488111 ?auto_488112 ) ) ( not ( = ?auto_488111 ?auto_488113 ) ) ( not ( = ?auto_488111 ?auto_488114 ) ) ( not ( = ?auto_488111 ?auto_488115 ) ) ( not ( = ?auto_488111 ?auto_488116 ) ) ( not ( = ?auto_488111 ?auto_488117 ) ) ( not ( = ?auto_488111 ?auto_488118 ) ) ( not ( = ?auto_488111 ?auto_488119 ) ) ( not ( = ?auto_488111 ?auto_488120 ) ) ( not ( = ?auto_488111 ?auto_488121 ) ) ( not ( = ?auto_488112 ?auto_488113 ) ) ( not ( = ?auto_488112 ?auto_488114 ) ) ( not ( = ?auto_488112 ?auto_488115 ) ) ( not ( = ?auto_488112 ?auto_488116 ) ) ( not ( = ?auto_488112 ?auto_488117 ) ) ( not ( = ?auto_488112 ?auto_488118 ) ) ( not ( = ?auto_488112 ?auto_488119 ) ) ( not ( = ?auto_488112 ?auto_488120 ) ) ( not ( = ?auto_488112 ?auto_488121 ) ) ( not ( = ?auto_488113 ?auto_488114 ) ) ( not ( = ?auto_488113 ?auto_488115 ) ) ( not ( = ?auto_488113 ?auto_488116 ) ) ( not ( = ?auto_488113 ?auto_488117 ) ) ( not ( = ?auto_488113 ?auto_488118 ) ) ( not ( = ?auto_488113 ?auto_488119 ) ) ( not ( = ?auto_488113 ?auto_488120 ) ) ( not ( = ?auto_488113 ?auto_488121 ) ) ( not ( = ?auto_488114 ?auto_488115 ) ) ( not ( = ?auto_488114 ?auto_488116 ) ) ( not ( = ?auto_488114 ?auto_488117 ) ) ( not ( = ?auto_488114 ?auto_488118 ) ) ( not ( = ?auto_488114 ?auto_488119 ) ) ( not ( = ?auto_488114 ?auto_488120 ) ) ( not ( = ?auto_488114 ?auto_488121 ) ) ( not ( = ?auto_488115 ?auto_488116 ) ) ( not ( = ?auto_488115 ?auto_488117 ) ) ( not ( = ?auto_488115 ?auto_488118 ) ) ( not ( = ?auto_488115 ?auto_488119 ) ) ( not ( = ?auto_488115 ?auto_488120 ) ) ( not ( = ?auto_488115 ?auto_488121 ) ) ( not ( = ?auto_488116 ?auto_488117 ) ) ( not ( = ?auto_488116 ?auto_488118 ) ) ( not ( = ?auto_488116 ?auto_488119 ) ) ( not ( = ?auto_488116 ?auto_488120 ) ) ( not ( = ?auto_488116 ?auto_488121 ) ) ( not ( = ?auto_488117 ?auto_488118 ) ) ( not ( = ?auto_488117 ?auto_488119 ) ) ( not ( = ?auto_488117 ?auto_488120 ) ) ( not ( = ?auto_488117 ?auto_488121 ) ) ( not ( = ?auto_488118 ?auto_488119 ) ) ( not ( = ?auto_488118 ?auto_488120 ) ) ( not ( = ?auto_488118 ?auto_488121 ) ) ( not ( = ?auto_488119 ?auto_488120 ) ) ( not ( = ?auto_488119 ?auto_488121 ) ) ( not ( = ?auto_488120 ?auto_488121 ) ) ( CLEAR ?auto_488118 ) ( ON ?auto_488119 ?auto_488120 ) ( CLEAR ?auto_488119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_488106 ?auto_488107 ?auto_488108 ?auto_488109 ?auto_488110 ?auto_488111 ?auto_488112 ?auto_488113 ?auto_488114 ?auto_488115 ?auto_488116 ?auto_488117 ?auto_488118 ?auto_488119 )
      ( MAKE-15PILE ?auto_488106 ?auto_488107 ?auto_488108 ?auto_488109 ?auto_488110 ?auto_488111 ?auto_488112 ?auto_488113 ?auto_488114 ?auto_488115 ?auto_488116 ?auto_488117 ?auto_488118 ?auto_488119 ?auto_488120 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488168 - BLOCK
      ?auto_488169 - BLOCK
      ?auto_488170 - BLOCK
      ?auto_488171 - BLOCK
      ?auto_488172 - BLOCK
      ?auto_488173 - BLOCK
      ?auto_488174 - BLOCK
      ?auto_488175 - BLOCK
      ?auto_488176 - BLOCK
      ?auto_488177 - BLOCK
      ?auto_488178 - BLOCK
      ?auto_488179 - BLOCK
      ?auto_488180 - BLOCK
      ?auto_488181 - BLOCK
      ?auto_488182 - BLOCK
    )
    :vars
    (
      ?auto_488183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488182 ?auto_488183 ) ( ON-TABLE ?auto_488168 ) ( ON ?auto_488169 ?auto_488168 ) ( ON ?auto_488170 ?auto_488169 ) ( ON ?auto_488171 ?auto_488170 ) ( ON ?auto_488172 ?auto_488171 ) ( ON ?auto_488173 ?auto_488172 ) ( ON ?auto_488174 ?auto_488173 ) ( ON ?auto_488175 ?auto_488174 ) ( ON ?auto_488176 ?auto_488175 ) ( ON ?auto_488177 ?auto_488176 ) ( ON ?auto_488178 ?auto_488177 ) ( ON ?auto_488179 ?auto_488178 ) ( not ( = ?auto_488168 ?auto_488169 ) ) ( not ( = ?auto_488168 ?auto_488170 ) ) ( not ( = ?auto_488168 ?auto_488171 ) ) ( not ( = ?auto_488168 ?auto_488172 ) ) ( not ( = ?auto_488168 ?auto_488173 ) ) ( not ( = ?auto_488168 ?auto_488174 ) ) ( not ( = ?auto_488168 ?auto_488175 ) ) ( not ( = ?auto_488168 ?auto_488176 ) ) ( not ( = ?auto_488168 ?auto_488177 ) ) ( not ( = ?auto_488168 ?auto_488178 ) ) ( not ( = ?auto_488168 ?auto_488179 ) ) ( not ( = ?auto_488168 ?auto_488180 ) ) ( not ( = ?auto_488168 ?auto_488181 ) ) ( not ( = ?auto_488168 ?auto_488182 ) ) ( not ( = ?auto_488168 ?auto_488183 ) ) ( not ( = ?auto_488169 ?auto_488170 ) ) ( not ( = ?auto_488169 ?auto_488171 ) ) ( not ( = ?auto_488169 ?auto_488172 ) ) ( not ( = ?auto_488169 ?auto_488173 ) ) ( not ( = ?auto_488169 ?auto_488174 ) ) ( not ( = ?auto_488169 ?auto_488175 ) ) ( not ( = ?auto_488169 ?auto_488176 ) ) ( not ( = ?auto_488169 ?auto_488177 ) ) ( not ( = ?auto_488169 ?auto_488178 ) ) ( not ( = ?auto_488169 ?auto_488179 ) ) ( not ( = ?auto_488169 ?auto_488180 ) ) ( not ( = ?auto_488169 ?auto_488181 ) ) ( not ( = ?auto_488169 ?auto_488182 ) ) ( not ( = ?auto_488169 ?auto_488183 ) ) ( not ( = ?auto_488170 ?auto_488171 ) ) ( not ( = ?auto_488170 ?auto_488172 ) ) ( not ( = ?auto_488170 ?auto_488173 ) ) ( not ( = ?auto_488170 ?auto_488174 ) ) ( not ( = ?auto_488170 ?auto_488175 ) ) ( not ( = ?auto_488170 ?auto_488176 ) ) ( not ( = ?auto_488170 ?auto_488177 ) ) ( not ( = ?auto_488170 ?auto_488178 ) ) ( not ( = ?auto_488170 ?auto_488179 ) ) ( not ( = ?auto_488170 ?auto_488180 ) ) ( not ( = ?auto_488170 ?auto_488181 ) ) ( not ( = ?auto_488170 ?auto_488182 ) ) ( not ( = ?auto_488170 ?auto_488183 ) ) ( not ( = ?auto_488171 ?auto_488172 ) ) ( not ( = ?auto_488171 ?auto_488173 ) ) ( not ( = ?auto_488171 ?auto_488174 ) ) ( not ( = ?auto_488171 ?auto_488175 ) ) ( not ( = ?auto_488171 ?auto_488176 ) ) ( not ( = ?auto_488171 ?auto_488177 ) ) ( not ( = ?auto_488171 ?auto_488178 ) ) ( not ( = ?auto_488171 ?auto_488179 ) ) ( not ( = ?auto_488171 ?auto_488180 ) ) ( not ( = ?auto_488171 ?auto_488181 ) ) ( not ( = ?auto_488171 ?auto_488182 ) ) ( not ( = ?auto_488171 ?auto_488183 ) ) ( not ( = ?auto_488172 ?auto_488173 ) ) ( not ( = ?auto_488172 ?auto_488174 ) ) ( not ( = ?auto_488172 ?auto_488175 ) ) ( not ( = ?auto_488172 ?auto_488176 ) ) ( not ( = ?auto_488172 ?auto_488177 ) ) ( not ( = ?auto_488172 ?auto_488178 ) ) ( not ( = ?auto_488172 ?auto_488179 ) ) ( not ( = ?auto_488172 ?auto_488180 ) ) ( not ( = ?auto_488172 ?auto_488181 ) ) ( not ( = ?auto_488172 ?auto_488182 ) ) ( not ( = ?auto_488172 ?auto_488183 ) ) ( not ( = ?auto_488173 ?auto_488174 ) ) ( not ( = ?auto_488173 ?auto_488175 ) ) ( not ( = ?auto_488173 ?auto_488176 ) ) ( not ( = ?auto_488173 ?auto_488177 ) ) ( not ( = ?auto_488173 ?auto_488178 ) ) ( not ( = ?auto_488173 ?auto_488179 ) ) ( not ( = ?auto_488173 ?auto_488180 ) ) ( not ( = ?auto_488173 ?auto_488181 ) ) ( not ( = ?auto_488173 ?auto_488182 ) ) ( not ( = ?auto_488173 ?auto_488183 ) ) ( not ( = ?auto_488174 ?auto_488175 ) ) ( not ( = ?auto_488174 ?auto_488176 ) ) ( not ( = ?auto_488174 ?auto_488177 ) ) ( not ( = ?auto_488174 ?auto_488178 ) ) ( not ( = ?auto_488174 ?auto_488179 ) ) ( not ( = ?auto_488174 ?auto_488180 ) ) ( not ( = ?auto_488174 ?auto_488181 ) ) ( not ( = ?auto_488174 ?auto_488182 ) ) ( not ( = ?auto_488174 ?auto_488183 ) ) ( not ( = ?auto_488175 ?auto_488176 ) ) ( not ( = ?auto_488175 ?auto_488177 ) ) ( not ( = ?auto_488175 ?auto_488178 ) ) ( not ( = ?auto_488175 ?auto_488179 ) ) ( not ( = ?auto_488175 ?auto_488180 ) ) ( not ( = ?auto_488175 ?auto_488181 ) ) ( not ( = ?auto_488175 ?auto_488182 ) ) ( not ( = ?auto_488175 ?auto_488183 ) ) ( not ( = ?auto_488176 ?auto_488177 ) ) ( not ( = ?auto_488176 ?auto_488178 ) ) ( not ( = ?auto_488176 ?auto_488179 ) ) ( not ( = ?auto_488176 ?auto_488180 ) ) ( not ( = ?auto_488176 ?auto_488181 ) ) ( not ( = ?auto_488176 ?auto_488182 ) ) ( not ( = ?auto_488176 ?auto_488183 ) ) ( not ( = ?auto_488177 ?auto_488178 ) ) ( not ( = ?auto_488177 ?auto_488179 ) ) ( not ( = ?auto_488177 ?auto_488180 ) ) ( not ( = ?auto_488177 ?auto_488181 ) ) ( not ( = ?auto_488177 ?auto_488182 ) ) ( not ( = ?auto_488177 ?auto_488183 ) ) ( not ( = ?auto_488178 ?auto_488179 ) ) ( not ( = ?auto_488178 ?auto_488180 ) ) ( not ( = ?auto_488178 ?auto_488181 ) ) ( not ( = ?auto_488178 ?auto_488182 ) ) ( not ( = ?auto_488178 ?auto_488183 ) ) ( not ( = ?auto_488179 ?auto_488180 ) ) ( not ( = ?auto_488179 ?auto_488181 ) ) ( not ( = ?auto_488179 ?auto_488182 ) ) ( not ( = ?auto_488179 ?auto_488183 ) ) ( not ( = ?auto_488180 ?auto_488181 ) ) ( not ( = ?auto_488180 ?auto_488182 ) ) ( not ( = ?auto_488180 ?auto_488183 ) ) ( not ( = ?auto_488181 ?auto_488182 ) ) ( not ( = ?auto_488181 ?auto_488183 ) ) ( not ( = ?auto_488182 ?auto_488183 ) ) ( ON ?auto_488181 ?auto_488182 ) ( CLEAR ?auto_488179 ) ( ON ?auto_488180 ?auto_488181 ) ( CLEAR ?auto_488180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_488168 ?auto_488169 ?auto_488170 ?auto_488171 ?auto_488172 ?auto_488173 ?auto_488174 ?auto_488175 ?auto_488176 ?auto_488177 ?auto_488178 ?auto_488179 ?auto_488180 )
      ( MAKE-15PILE ?auto_488168 ?auto_488169 ?auto_488170 ?auto_488171 ?auto_488172 ?auto_488173 ?auto_488174 ?auto_488175 ?auto_488176 ?auto_488177 ?auto_488178 ?auto_488179 ?auto_488180 ?auto_488181 ?auto_488182 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488230 - BLOCK
      ?auto_488231 - BLOCK
      ?auto_488232 - BLOCK
      ?auto_488233 - BLOCK
      ?auto_488234 - BLOCK
      ?auto_488235 - BLOCK
      ?auto_488236 - BLOCK
      ?auto_488237 - BLOCK
      ?auto_488238 - BLOCK
      ?auto_488239 - BLOCK
      ?auto_488240 - BLOCK
      ?auto_488241 - BLOCK
      ?auto_488242 - BLOCK
      ?auto_488243 - BLOCK
      ?auto_488244 - BLOCK
    )
    :vars
    (
      ?auto_488245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488244 ?auto_488245 ) ( ON-TABLE ?auto_488230 ) ( ON ?auto_488231 ?auto_488230 ) ( ON ?auto_488232 ?auto_488231 ) ( ON ?auto_488233 ?auto_488232 ) ( ON ?auto_488234 ?auto_488233 ) ( ON ?auto_488235 ?auto_488234 ) ( ON ?auto_488236 ?auto_488235 ) ( ON ?auto_488237 ?auto_488236 ) ( ON ?auto_488238 ?auto_488237 ) ( ON ?auto_488239 ?auto_488238 ) ( ON ?auto_488240 ?auto_488239 ) ( not ( = ?auto_488230 ?auto_488231 ) ) ( not ( = ?auto_488230 ?auto_488232 ) ) ( not ( = ?auto_488230 ?auto_488233 ) ) ( not ( = ?auto_488230 ?auto_488234 ) ) ( not ( = ?auto_488230 ?auto_488235 ) ) ( not ( = ?auto_488230 ?auto_488236 ) ) ( not ( = ?auto_488230 ?auto_488237 ) ) ( not ( = ?auto_488230 ?auto_488238 ) ) ( not ( = ?auto_488230 ?auto_488239 ) ) ( not ( = ?auto_488230 ?auto_488240 ) ) ( not ( = ?auto_488230 ?auto_488241 ) ) ( not ( = ?auto_488230 ?auto_488242 ) ) ( not ( = ?auto_488230 ?auto_488243 ) ) ( not ( = ?auto_488230 ?auto_488244 ) ) ( not ( = ?auto_488230 ?auto_488245 ) ) ( not ( = ?auto_488231 ?auto_488232 ) ) ( not ( = ?auto_488231 ?auto_488233 ) ) ( not ( = ?auto_488231 ?auto_488234 ) ) ( not ( = ?auto_488231 ?auto_488235 ) ) ( not ( = ?auto_488231 ?auto_488236 ) ) ( not ( = ?auto_488231 ?auto_488237 ) ) ( not ( = ?auto_488231 ?auto_488238 ) ) ( not ( = ?auto_488231 ?auto_488239 ) ) ( not ( = ?auto_488231 ?auto_488240 ) ) ( not ( = ?auto_488231 ?auto_488241 ) ) ( not ( = ?auto_488231 ?auto_488242 ) ) ( not ( = ?auto_488231 ?auto_488243 ) ) ( not ( = ?auto_488231 ?auto_488244 ) ) ( not ( = ?auto_488231 ?auto_488245 ) ) ( not ( = ?auto_488232 ?auto_488233 ) ) ( not ( = ?auto_488232 ?auto_488234 ) ) ( not ( = ?auto_488232 ?auto_488235 ) ) ( not ( = ?auto_488232 ?auto_488236 ) ) ( not ( = ?auto_488232 ?auto_488237 ) ) ( not ( = ?auto_488232 ?auto_488238 ) ) ( not ( = ?auto_488232 ?auto_488239 ) ) ( not ( = ?auto_488232 ?auto_488240 ) ) ( not ( = ?auto_488232 ?auto_488241 ) ) ( not ( = ?auto_488232 ?auto_488242 ) ) ( not ( = ?auto_488232 ?auto_488243 ) ) ( not ( = ?auto_488232 ?auto_488244 ) ) ( not ( = ?auto_488232 ?auto_488245 ) ) ( not ( = ?auto_488233 ?auto_488234 ) ) ( not ( = ?auto_488233 ?auto_488235 ) ) ( not ( = ?auto_488233 ?auto_488236 ) ) ( not ( = ?auto_488233 ?auto_488237 ) ) ( not ( = ?auto_488233 ?auto_488238 ) ) ( not ( = ?auto_488233 ?auto_488239 ) ) ( not ( = ?auto_488233 ?auto_488240 ) ) ( not ( = ?auto_488233 ?auto_488241 ) ) ( not ( = ?auto_488233 ?auto_488242 ) ) ( not ( = ?auto_488233 ?auto_488243 ) ) ( not ( = ?auto_488233 ?auto_488244 ) ) ( not ( = ?auto_488233 ?auto_488245 ) ) ( not ( = ?auto_488234 ?auto_488235 ) ) ( not ( = ?auto_488234 ?auto_488236 ) ) ( not ( = ?auto_488234 ?auto_488237 ) ) ( not ( = ?auto_488234 ?auto_488238 ) ) ( not ( = ?auto_488234 ?auto_488239 ) ) ( not ( = ?auto_488234 ?auto_488240 ) ) ( not ( = ?auto_488234 ?auto_488241 ) ) ( not ( = ?auto_488234 ?auto_488242 ) ) ( not ( = ?auto_488234 ?auto_488243 ) ) ( not ( = ?auto_488234 ?auto_488244 ) ) ( not ( = ?auto_488234 ?auto_488245 ) ) ( not ( = ?auto_488235 ?auto_488236 ) ) ( not ( = ?auto_488235 ?auto_488237 ) ) ( not ( = ?auto_488235 ?auto_488238 ) ) ( not ( = ?auto_488235 ?auto_488239 ) ) ( not ( = ?auto_488235 ?auto_488240 ) ) ( not ( = ?auto_488235 ?auto_488241 ) ) ( not ( = ?auto_488235 ?auto_488242 ) ) ( not ( = ?auto_488235 ?auto_488243 ) ) ( not ( = ?auto_488235 ?auto_488244 ) ) ( not ( = ?auto_488235 ?auto_488245 ) ) ( not ( = ?auto_488236 ?auto_488237 ) ) ( not ( = ?auto_488236 ?auto_488238 ) ) ( not ( = ?auto_488236 ?auto_488239 ) ) ( not ( = ?auto_488236 ?auto_488240 ) ) ( not ( = ?auto_488236 ?auto_488241 ) ) ( not ( = ?auto_488236 ?auto_488242 ) ) ( not ( = ?auto_488236 ?auto_488243 ) ) ( not ( = ?auto_488236 ?auto_488244 ) ) ( not ( = ?auto_488236 ?auto_488245 ) ) ( not ( = ?auto_488237 ?auto_488238 ) ) ( not ( = ?auto_488237 ?auto_488239 ) ) ( not ( = ?auto_488237 ?auto_488240 ) ) ( not ( = ?auto_488237 ?auto_488241 ) ) ( not ( = ?auto_488237 ?auto_488242 ) ) ( not ( = ?auto_488237 ?auto_488243 ) ) ( not ( = ?auto_488237 ?auto_488244 ) ) ( not ( = ?auto_488237 ?auto_488245 ) ) ( not ( = ?auto_488238 ?auto_488239 ) ) ( not ( = ?auto_488238 ?auto_488240 ) ) ( not ( = ?auto_488238 ?auto_488241 ) ) ( not ( = ?auto_488238 ?auto_488242 ) ) ( not ( = ?auto_488238 ?auto_488243 ) ) ( not ( = ?auto_488238 ?auto_488244 ) ) ( not ( = ?auto_488238 ?auto_488245 ) ) ( not ( = ?auto_488239 ?auto_488240 ) ) ( not ( = ?auto_488239 ?auto_488241 ) ) ( not ( = ?auto_488239 ?auto_488242 ) ) ( not ( = ?auto_488239 ?auto_488243 ) ) ( not ( = ?auto_488239 ?auto_488244 ) ) ( not ( = ?auto_488239 ?auto_488245 ) ) ( not ( = ?auto_488240 ?auto_488241 ) ) ( not ( = ?auto_488240 ?auto_488242 ) ) ( not ( = ?auto_488240 ?auto_488243 ) ) ( not ( = ?auto_488240 ?auto_488244 ) ) ( not ( = ?auto_488240 ?auto_488245 ) ) ( not ( = ?auto_488241 ?auto_488242 ) ) ( not ( = ?auto_488241 ?auto_488243 ) ) ( not ( = ?auto_488241 ?auto_488244 ) ) ( not ( = ?auto_488241 ?auto_488245 ) ) ( not ( = ?auto_488242 ?auto_488243 ) ) ( not ( = ?auto_488242 ?auto_488244 ) ) ( not ( = ?auto_488242 ?auto_488245 ) ) ( not ( = ?auto_488243 ?auto_488244 ) ) ( not ( = ?auto_488243 ?auto_488245 ) ) ( not ( = ?auto_488244 ?auto_488245 ) ) ( ON ?auto_488243 ?auto_488244 ) ( ON ?auto_488242 ?auto_488243 ) ( CLEAR ?auto_488240 ) ( ON ?auto_488241 ?auto_488242 ) ( CLEAR ?auto_488241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_488230 ?auto_488231 ?auto_488232 ?auto_488233 ?auto_488234 ?auto_488235 ?auto_488236 ?auto_488237 ?auto_488238 ?auto_488239 ?auto_488240 ?auto_488241 )
      ( MAKE-15PILE ?auto_488230 ?auto_488231 ?auto_488232 ?auto_488233 ?auto_488234 ?auto_488235 ?auto_488236 ?auto_488237 ?auto_488238 ?auto_488239 ?auto_488240 ?auto_488241 ?auto_488242 ?auto_488243 ?auto_488244 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488292 - BLOCK
      ?auto_488293 - BLOCK
      ?auto_488294 - BLOCK
      ?auto_488295 - BLOCK
      ?auto_488296 - BLOCK
      ?auto_488297 - BLOCK
      ?auto_488298 - BLOCK
      ?auto_488299 - BLOCK
      ?auto_488300 - BLOCK
      ?auto_488301 - BLOCK
      ?auto_488302 - BLOCK
      ?auto_488303 - BLOCK
      ?auto_488304 - BLOCK
      ?auto_488305 - BLOCK
      ?auto_488306 - BLOCK
    )
    :vars
    (
      ?auto_488307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488306 ?auto_488307 ) ( ON-TABLE ?auto_488292 ) ( ON ?auto_488293 ?auto_488292 ) ( ON ?auto_488294 ?auto_488293 ) ( ON ?auto_488295 ?auto_488294 ) ( ON ?auto_488296 ?auto_488295 ) ( ON ?auto_488297 ?auto_488296 ) ( ON ?auto_488298 ?auto_488297 ) ( ON ?auto_488299 ?auto_488298 ) ( ON ?auto_488300 ?auto_488299 ) ( ON ?auto_488301 ?auto_488300 ) ( not ( = ?auto_488292 ?auto_488293 ) ) ( not ( = ?auto_488292 ?auto_488294 ) ) ( not ( = ?auto_488292 ?auto_488295 ) ) ( not ( = ?auto_488292 ?auto_488296 ) ) ( not ( = ?auto_488292 ?auto_488297 ) ) ( not ( = ?auto_488292 ?auto_488298 ) ) ( not ( = ?auto_488292 ?auto_488299 ) ) ( not ( = ?auto_488292 ?auto_488300 ) ) ( not ( = ?auto_488292 ?auto_488301 ) ) ( not ( = ?auto_488292 ?auto_488302 ) ) ( not ( = ?auto_488292 ?auto_488303 ) ) ( not ( = ?auto_488292 ?auto_488304 ) ) ( not ( = ?auto_488292 ?auto_488305 ) ) ( not ( = ?auto_488292 ?auto_488306 ) ) ( not ( = ?auto_488292 ?auto_488307 ) ) ( not ( = ?auto_488293 ?auto_488294 ) ) ( not ( = ?auto_488293 ?auto_488295 ) ) ( not ( = ?auto_488293 ?auto_488296 ) ) ( not ( = ?auto_488293 ?auto_488297 ) ) ( not ( = ?auto_488293 ?auto_488298 ) ) ( not ( = ?auto_488293 ?auto_488299 ) ) ( not ( = ?auto_488293 ?auto_488300 ) ) ( not ( = ?auto_488293 ?auto_488301 ) ) ( not ( = ?auto_488293 ?auto_488302 ) ) ( not ( = ?auto_488293 ?auto_488303 ) ) ( not ( = ?auto_488293 ?auto_488304 ) ) ( not ( = ?auto_488293 ?auto_488305 ) ) ( not ( = ?auto_488293 ?auto_488306 ) ) ( not ( = ?auto_488293 ?auto_488307 ) ) ( not ( = ?auto_488294 ?auto_488295 ) ) ( not ( = ?auto_488294 ?auto_488296 ) ) ( not ( = ?auto_488294 ?auto_488297 ) ) ( not ( = ?auto_488294 ?auto_488298 ) ) ( not ( = ?auto_488294 ?auto_488299 ) ) ( not ( = ?auto_488294 ?auto_488300 ) ) ( not ( = ?auto_488294 ?auto_488301 ) ) ( not ( = ?auto_488294 ?auto_488302 ) ) ( not ( = ?auto_488294 ?auto_488303 ) ) ( not ( = ?auto_488294 ?auto_488304 ) ) ( not ( = ?auto_488294 ?auto_488305 ) ) ( not ( = ?auto_488294 ?auto_488306 ) ) ( not ( = ?auto_488294 ?auto_488307 ) ) ( not ( = ?auto_488295 ?auto_488296 ) ) ( not ( = ?auto_488295 ?auto_488297 ) ) ( not ( = ?auto_488295 ?auto_488298 ) ) ( not ( = ?auto_488295 ?auto_488299 ) ) ( not ( = ?auto_488295 ?auto_488300 ) ) ( not ( = ?auto_488295 ?auto_488301 ) ) ( not ( = ?auto_488295 ?auto_488302 ) ) ( not ( = ?auto_488295 ?auto_488303 ) ) ( not ( = ?auto_488295 ?auto_488304 ) ) ( not ( = ?auto_488295 ?auto_488305 ) ) ( not ( = ?auto_488295 ?auto_488306 ) ) ( not ( = ?auto_488295 ?auto_488307 ) ) ( not ( = ?auto_488296 ?auto_488297 ) ) ( not ( = ?auto_488296 ?auto_488298 ) ) ( not ( = ?auto_488296 ?auto_488299 ) ) ( not ( = ?auto_488296 ?auto_488300 ) ) ( not ( = ?auto_488296 ?auto_488301 ) ) ( not ( = ?auto_488296 ?auto_488302 ) ) ( not ( = ?auto_488296 ?auto_488303 ) ) ( not ( = ?auto_488296 ?auto_488304 ) ) ( not ( = ?auto_488296 ?auto_488305 ) ) ( not ( = ?auto_488296 ?auto_488306 ) ) ( not ( = ?auto_488296 ?auto_488307 ) ) ( not ( = ?auto_488297 ?auto_488298 ) ) ( not ( = ?auto_488297 ?auto_488299 ) ) ( not ( = ?auto_488297 ?auto_488300 ) ) ( not ( = ?auto_488297 ?auto_488301 ) ) ( not ( = ?auto_488297 ?auto_488302 ) ) ( not ( = ?auto_488297 ?auto_488303 ) ) ( not ( = ?auto_488297 ?auto_488304 ) ) ( not ( = ?auto_488297 ?auto_488305 ) ) ( not ( = ?auto_488297 ?auto_488306 ) ) ( not ( = ?auto_488297 ?auto_488307 ) ) ( not ( = ?auto_488298 ?auto_488299 ) ) ( not ( = ?auto_488298 ?auto_488300 ) ) ( not ( = ?auto_488298 ?auto_488301 ) ) ( not ( = ?auto_488298 ?auto_488302 ) ) ( not ( = ?auto_488298 ?auto_488303 ) ) ( not ( = ?auto_488298 ?auto_488304 ) ) ( not ( = ?auto_488298 ?auto_488305 ) ) ( not ( = ?auto_488298 ?auto_488306 ) ) ( not ( = ?auto_488298 ?auto_488307 ) ) ( not ( = ?auto_488299 ?auto_488300 ) ) ( not ( = ?auto_488299 ?auto_488301 ) ) ( not ( = ?auto_488299 ?auto_488302 ) ) ( not ( = ?auto_488299 ?auto_488303 ) ) ( not ( = ?auto_488299 ?auto_488304 ) ) ( not ( = ?auto_488299 ?auto_488305 ) ) ( not ( = ?auto_488299 ?auto_488306 ) ) ( not ( = ?auto_488299 ?auto_488307 ) ) ( not ( = ?auto_488300 ?auto_488301 ) ) ( not ( = ?auto_488300 ?auto_488302 ) ) ( not ( = ?auto_488300 ?auto_488303 ) ) ( not ( = ?auto_488300 ?auto_488304 ) ) ( not ( = ?auto_488300 ?auto_488305 ) ) ( not ( = ?auto_488300 ?auto_488306 ) ) ( not ( = ?auto_488300 ?auto_488307 ) ) ( not ( = ?auto_488301 ?auto_488302 ) ) ( not ( = ?auto_488301 ?auto_488303 ) ) ( not ( = ?auto_488301 ?auto_488304 ) ) ( not ( = ?auto_488301 ?auto_488305 ) ) ( not ( = ?auto_488301 ?auto_488306 ) ) ( not ( = ?auto_488301 ?auto_488307 ) ) ( not ( = ?auto_488302 ?auto_488303 ) ) ( not ( = ?auto_488302 ?auto_488304 ) ) ( not ( = ?auto_488302 ?auto_488305 ) ) ( not ( = ?auto_488302 ?auto_488306 ) ) ( not ( = ?auto_488302 ?auto_488307 ) ) ( not ( = ?auto_488303 ?auto_488304 ) ) ( not ( = ?auto_488303 ?auto_488305 ) ) ( not ( = ?auto_488303 ?auto_488306 ) ) ( not ( = ?auto_488303 ?auto_488307 ) ) ( not ( = ?auto_488304 ?auto_488305 ) ) ( not ( = ?auto_488304 ?auto_488306 ) ) ( not ( = ?auto_488304 ?auto_488307 ) ) ( not ( = ?auto_488305 ?auto_488306 ) ) ( not ( = ?auto_488305 ?auto_488307 ) ) ( not ( = ?auto_488306 ?auto_488307 ) ) ( ON ?auto_488305 ?auto_488306 ) ( ON ?auto_488304 ?auto_488305 ) ( ON ?auto_488303 ?auto_488304 ) ( CLEAR ?auto_488301 ) ( ON ?auto_488302 ?auto_488303 ) ( CLEAR ?auto_488302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_488292 ?auto_488293 ?auto_488294 ?auto_488295 ?auto_488296 ?auto_488297 ?auto_488298 ?auto_488299 ?auto_488300 ?auto_488301 ?auto_488302 )
      ( MAKE-15PILE ?auto_488292 ?auto_488293 ?auto_488294 ?auto_488295 ?auto_488296 ?auto_488297 ?auto_488298 ?auto_488299 ?auto_488300 ?auto_488301 ?auto_488302 ?auto_488303 ?auto_488304 ?auto_488305 ?auto_488306 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488354 - BLOCK
      ?auto_488355 - BLOCK
      ?auto_488356 - BLOCK
      ?auto_488357 - BLOCK
      ?auto_488358 - BLOCK
      ?auto_488359 - BLOCK
      ?auto_488360 - BLOCK
      ?auto_488361 - BLOCK
      ?auto_488362 - BLOCK
      ?auto_488363 - BLOCK
      ?auto_488364 - BLOCK
      ?auto_488365 - BLOCK
      ?auto_488366 - BLOCK
      ?auto_488367 - BLOCK
      ?auto_488368 - BLOCK
    )
    :vars
    (
      ?auto_488369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488368 ?auto_488369 ) ( ON-TABLE ?auto_488354 ) ( ON ?auto_488355 ?auto_488354 ) ( ON ?auto_488356 ?auto_488355 ) ( ON ?auto_488357 ?auto_488356 ) ( ON ?auto_488358 ?auto_488357 ) ( ON ?auto_488359 ?auto_488358 ) ( ON ?auto_488360 ?auto_488359 ) ( ON ?auto_488361 ?auto_488360 ) ( ON ?auto_488362 ?auto_488361 ) ( not ( = ?auto_488354 ?auto_488355 ) ) ( not ( = ?auto_488354 ?auto_488356 ) ) ( not ( = ?auto_488354 ?auto_488357 ) ) ( not ( = ?auto_488354 ?auto_488358 ) ) ( not ( = ?auto_488354 ?auto_488359 ) ) ( not ( = ?auto_488354 ?auto_488360 ) ) ( not ( = ?auto_488354 ?auto_488361 ) ) ( not ( = ?auto_488354 ?auto_488362 ) ) ( not ( = ?auto_488354 ?auto_488363 ) ) ( not ( = ?auto_488354 ?auto_488364 ) ) ( not ( = ?auto_488354 ?auto_488365 ) ) ( not ( = ?auto_488354 ?auto_488366 ) ) ( not ( = ?auto_488354 ?auto_488367 ) ) ( not ( = ?auto_488354 ?auto_488368 ) ) ( not ( = ?auto_488354 ?auto_488369 ) ) ( not ( = ?auto_488355 ?auto_488356 ) ) ( not ( = ?auto_488355 ?auto_488357 ) ) ( not ( = ?auto_488355 ?auto_488358 ) ) ( not ( = ?auto_488355 ?auto_488359 ) ) ( not ( = ?auto_488355 ?auto_488360 ) ) ( not ( = ?auto_488355 ?auto_488361 ) ) ( not ( = ?auto_488355 ?auto_488362 ) ) ( not ( = ?auto_488355 ?auto_488363 ) ) ( not ( = ?auto_488355 ?auto_488364 ) ) ( not ( = ?auto_488355 ?auto_488365 ) ) ( not ( = ?auto_488355 ?auto_488366 ) ) ( not ( = ?auto_488355 ?auto_488367 ) ) ( not ( = ?auto_488355 ?auto_488368 ) ) ( not ( = ?auto_488355 ?auto_488369 ) ) ( not ( = ?auto_488356 ?auto_488357 ) ) ( not ( = ?auto_488356 ?auto_488358 ) ) ( not ( = ?auto_488356 ?auto_488359 ) ) ( not ( = ?auto_488356 ?auto_488360 ) ) ( not ( = ?auto_488356 ?auto_488361 ) ) ( not ( = ?auto_488356 ?auto_488362 ) ) ( not ( = ?auto_488356 ?auto_488363 ) ) ( not ( = ?auto_488356 ?auto_488364 ) ) ( not ( = ?auto_488356 ?auto_488365 ) ) ( not ( = ?auto_488356 ?auto_488366 ) ) ( not ( = ?auto_488356 ?auto_488367 ) ) ( not ( = ?auto_488356 ?auto_488368 ) ) ( not ( = ?auto_488356 ?auto_488369 ) ) ( not ( = ?auto_488357 ?auto_488358 ) ) ( not ( = ?auto_488357 ?auto_488359 ) ) ( not ( = ?auto_488357 ?auto_488360 ) ) ( not ( = ?auto_488357 ?auto_488361 ) ) ( not ( = ?auto_488357 ?auto_488362 ) ) ( not ( = ?auto_488357 ?auto_488363 ) ) ( not ( = ?auto_488357 ?auto_488364 ) ) ( not ( = ?auto_488357 ?auto_488365 ) ) ( not ( = ?auto_488357 ?auto_488366 ) ) ( not ( = ?auto_488357 ?auto_488367 ) ) ( not ( = ?auto_488357 ?auto_488368 ) ) ( not ( = ?auto_488357 ?auto_488369 ) ) ( not ( = ?auto_488358 ?auto_488359 ) ) ( not ( = ?auto_488358 ?auto_488360 ) ) ( not ( = ?auto_488358 ?auto_488361 ) ) ( not ( = ?auto_488358 ?auto_488362 ) ) ( not ( = ?auto_488358 ?auto_488363 ) ) ( not ( = ?auto_488358 ?auto_488364 ) ) ( not ( = ?auto_488358 ?auto_488365 ) ) ( not ( = ?auto_488358 ?auto_488366 ) ) ( not ( = ?auto_488358 ?auto_488367 ) ) ( not ( = ?auto_488358 ?auto_488368 ) ) ( not ( = ?auto_488358 ?auto_488369 ) ) ( not ( = ?auto_488359 ?auto_488360 ) ) ( not ( = ?auto_488359 ?auto_488361 ) ) ( not ( = ?auto_488359 ?auto_488362 ) ) ( not ( = ?auto_488359 ?auto_488363 ) ) ( not ( = ?auto_488359 ?auto_488364 ) ) ( not ( = ?auto_488359 ?auto_488365 ) ) ( not ( = ?auto_488359 ?auto_488366 ) ) ( not ( = ?auto_488359 ?auto_488367 ) ) ( not ( = ?auto_488359 ?auto_488368 ) ) ( not ( = ?auto_488359 ?auto_488369 ) ) ( not ( = ?auto_488360 ?auto_488361 ) ) ( not ( = ?auto_488360 ?auto_488362 ) ) ( not ( = ?auto_488360 ?auto_488363 ) ) ( not ( = ?auto_488360 ?auto_488364 ) ) ( not ( = ?auto_488360 ?auto_488365 ) ) ( not ( = ?auto_488360 ?auto_488366 ) ) ( not ( = ?auto_488360 ?auto_488367 ) ) ( not ( = ?auto_488360 ?auto_488368 ) ) ( not ( = ?auto_488360 ?auto_488369 ) ) ( not ( = ?auto_488361 ?auto_488362 ) ) ( not ( = ?auto_488361 ?auto_488363 ) ) ( not ( = ?auto_488361 ?auto_488364 ) ) ( not ( = ?auto_488361 ?auto_488365 ) ) ( not ( = ?auto_488361 ?auto_488366 ) ) ( not ( = ?auto_488361 ?auto_488367 ) ) ( not ( = ?auto_488361 ?auto_488368 ) ) ( not ( = ?auto_488361 ?auto_488369 ) ) ( not ( = ?auto_488362 ?auto_488363 ) ) ( not ( = ?auto_488362 ?auto_488364 ) ) ( not ( = ?auto_488362 ?auto_488365 ) ) ( not ( = ?auto_488362 ?auto_488366 ) ) ( not ( = ?auto_488362 ?auto_488367 ) ) ( not ( = ?auto_488362 ?auto_488368 ) ) ( not ( = ?auto_488362 ?auto_488369 ) ) ( not ( = ?auto_488363 ?auto_488364 ) ) ( not ( = ?auto_488363 ?auto_488365 ) ) ( not ( = ?auto_488363 ?auto_488366 ) ) ( not ( = ?auto_488363 ?auto_488367 ) ) ( not ( = ?auto_488363 ?auto_488368 ) ) ( not ( = ?auto_488363 ?auto_488369 ) ) ( not ( = ?auto_488364 ?auto_488365 ) ) ( not ( = ?auto_488364 ?auto_488366 ) ) ( not ( = ?auto_488364 ?auto_488367 ) ) ( not ( = ?auto_488364 ?auto_488368 ) ) ( not ( = ?auto_488364 ?auto_488369 ) ) ( not ( = ?auto_488365 ?auto_488366 ) ) ( not ( = ?auto_488365 ?auto_488367 ) ) ( not ( = ?auto_488365 ?auto_488368 ) ) ( not ( = ?auto_488365 ?auto_488369 ) ) ( not ( = ?auto_488366 ?auto_488367 ) ) ( not ( = ?auto_488366 ?auto_488368 ) ) ( not ( = ?auto_488366 ?auto_488369 ) ) ( not ( = ?auto_488367 ?auto_488368 ) ) ( not ( = ?auto_488367 ?auto_488369 ) ) ( not ( = ?auto_488368 ?auto_488369 ) ) ( ON ?auto_488367 ?auto_488368 ) ( ON ?auto_488366 ?auto_488367 ) ( ON ?auto_488365 ?auto_488366 ) ( ON ?auto_488364 ?auto_488365 ) ( CLEAR ?auto_488362 ) ( ON ?auto_488363 ?auto_488364 ) ( CLEAR ?auto_488363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_488354 ?auto_488355 ?auto_488356 ?auto_488357 ?auto_488358 ?auto_488359 ?auto_488360 ?auto_488361 ?auto_488362 ?auto_488363 )
      ( MAKE-15PILE ?auto_488354 ?auto_488355 ?auto_488356 ?auto_488357 ?auto_488358 ?auto_488359 ?auto_488360 ?auto_488361 ?auto_488362 ?auto_488363 ?auto_488364 ?auto_488365 ?auto_488366 ?auto_488367 ?auto_488368 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488416 - BLOCK
      ?auto_488417 - BLOCK
      ?auto_488418 - BLOCK
      ?auto_488419 - BLOCK
      ?auto_488420 - BLOCK
      ?auto_488421 - BLOCK
      ?auto_488422 - BLOCK
      ?auto_488423 - BLOCK
      ?auto_488424 - BLOCK
      ?auto_488425 - BLOCK
      ?auto_488426 - BLOCK
      ?auto_488427 - BLOCK
      ?auto_488428 - BLOCK
      ?auto_488429 - BLOCK
      ?auto_488430 - BLOCK
    )
    :vars
    (
      ?auto_488431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488430 ?auto_488431 ) ( ON-TABLE ?auto_488416 ) ( ON ?auto_488417 ?auto_488416 ) ( ON ?auto_488418 ?auto_488417 ) ( ON ?auto_488419 ?auto_488418 ) ( ON ?auto_488420 ?auto_488419 ) ( ON ?auto_488421 ?auto_488420 ) ( ON ?auto_488422 ?auto_488421 ) ( ON ?auto_488423 ?auto_488422 ) ( not ( = ?auto_488416 ?auto_488417 ) ) ( not ( = ?auto_488416 ?auto_488418 ) ) ( not ( = ?auto_488416 ?auto_488419 ) ) ( not ( = ?auto_488416 ?auto_488420 ) ) ( not ( = ?auto_488416 ?auto_488421 ) ) ( not ( = ?auto_488416 ?auto_488422 ) ) ( not ( = ?auto_488416 ?auto_488423 ) ) ( not ( = ?auto_488416 ?auto_488424 ) ) ( not ( = ?auto_488416 ?auto_488425 ) ) ( not ( = ?auto_488416 ?auto_488426 ) ) ( not ( = ?auto_488416 ?auto_488427 ) ) ( not ( = ?auto_488416 ?auto_488428 ) ) ( not ( = ?auto_488416 ?auto_488429 ) ) ( not ( = ?auto_488416 ?auto_488430 ) ) ( not ( = ?auto_488416 ?auto_488431 ) ) ( not ( = ?auto_488417 ?auto_488418 ) ) ( not ( = ?auto_488417 ?auto_488419 ) ) ( not ( = ?auto_488417 ?auto_488420 ) ) ( not ( = ?auto_488417 ?auto_488421 ) ) ( not ( = ?auto_488417 ?auto_488422 ) ) ( not ( = ?auto_488417 ?auto_488423 ) ) ( not ( = ?auto_488417 ?auto_488424 ) ) ( not ( = ?auto_488417 ?auto_488425 ) ) ( not ( = ?auto_488417 ?auto_488426 ) ) ( not ( = ?auto_488417 ?auto_488427 ) ) ( not ( = ?auto_488417 ?auto_488428 ) ) ( not ( = ?auto_488417 ?auto_488429 ) ) ( not ( = ?auto_488417 ?auto_488430 ) ) ( not ( = ?auto_488417 ?auto_488431 ) ) ( not ( = ?auto_488418 ?auto_488419 ) ) ( not ( = ?auto_488418 ?auto_488420 ) ) ( not ( = ?auto_488418 ?auto_488421 ) ) ( not ( = ?auto_488418 ?auto_488422 ) ) ( not ( = ?auto_488418 ?auto_488423 ) ) ( not ( = ?auto_488418 ?auto_488424 ) ) ( not ( = ?auto_488418 ?auto_488425 ) ) ( not ( = ?auto_488418 ?auto_488426 ) ) ( not ( = ?auto_488418 ?auto_488427 ) ) ( not ( = ?auto_488418 ?auto_488428 ) ) ( not ( = ?auto_488418 ?auto_488429 ) ) ( not ( = ?auto_488418 ?auto_488430 ) ) ( not ( = ?auto_488418 ?auto_488431 ) ) ( not ( = ?auto_488419 ?auto_488420 ) ) ( not ( = ?auto_488419 ?auto_488421 ) ) ( not ( = ?auto_488419 ?auto_488422 ) ) ( not ( = ?auto_488419 ?auto_488423 ) ) ( not ( = ?auto_488419 ?auto_488424 ) ) ( not ( = ?auto_488419 ?auto_488425 ) ) ( not ( = ?auto_488419 ?auto_488426 ) ) ( not ( = ?auto_488419 ?auto_488427 ) ) ( not ( = ?auto_488419 ?auto_488428 ) ) ( not ( = ?auto_488419 ?auto_488429 ) ) ( not ( = ?auto_488419 ?auto_488430 ) ) ( not ( = ?auto_488419 ?auto_488431 ) ) ( not ( = ?auto_488420 ?auto_488421 ) ) ( not ( = ?auto_488420 ?auto_488422 ) ) ( not ( = ?auto_488420 ?auto_488423 ) ) ( not ( = ?auto_488420 ?auto_488424 ) ) ( not ( = ?auto_488420 ?auto_488425 ) ) ( not ( = ?auto_488420 ?auto_488426 ) ) ( not ( = ?auto_488420 ?auto_488427 ) ) ( not ( = ?auto_488420 ?auto_488428 ) ) ( not ( = ?auto_488420 ?auto_488429 ) ) ( not ( = ?auto_488420 ?auto_488430 ) ) ( not ( = ?auto_488420 ?auto_488431 ) ) ( not ( = ?auto_488421 ?auto_488422 ) ) ( not ( = ?auto_488421 ?auto_488423 ) ) ( not ( = ?auto_488421 ?auto_488424 ) ) ( not ( = ?auto_488421 ?auto_488425 ) ) ( not ( = ?auto_488421 ?auto_488426 ) ) ( not ( = ?auto_488421 ?auto_488427 ) ) ( not ( = ?auto_488421 ?auto_488428 ) ) ( not ( = ?auto_488421 ?auto_488429 ) ) ( not ( = ?auto_488421 ?auto_488430 ) ) ( not ( = ?auto_488421 ?auto_488431 ) ) ( not ( = ?auto_488422 ?auto_488423 ) ) ( not ( = ?auto_488422 ?auto_488424 ) ) ( not ( = ?auto_488422 ?auto_488425 ) ) ( not ( = ?auto_488422 ?auto_488426 ) ) ( not ( = ?auto_488422 ?auto_488427 ) ) ( not ( = ?auto_488422 ?auto_488428 ) ) ( not ( = ?auto_488422 ?auto_488429 ) ) ( not ( = ?auto_488422 ?auto_488430 ) ) ( not ( = ?auto_488422 ?auto_488431 ) ) ( not ( = ?auto_488423 ?auto_488424 ) ) ( not ( = ?auto_488423 ?auto_488425 ) ) ( not ( = ?auto_488423 ?auto_488426 ) ) ( not ( = ?auto_488423 ?auto_488427 ) ) ( not ( = ?auto_488423 ?auto_488428 ) ) ( not ( = ?auto_488423 ?auto_488429 ) ) ( not ( = ?auto_488423 ?auto_488430 ) ) ( not ( = ?auto_488423 ?auto_488431 ) ) ( not ( = ?auto_488424 ?auto_488425 ) ) ( not ( = ?auto_488424 ?auto_488426 ) ) ( not ( = ?auto_488424 ?auto_488427 ) ) ( not ( = ?auto_488424 ?auto_488428 ) ) ( not ( = ?auto_488424 ?auto_488429 ) ) ( not ( = ?auto_488424 ?auto_488430 ) ) ( not ( = ?auto_488424 ?auto_488431 ) ) ( not ( = ?auto_488425 ?auto_488426 ) ) ( not ( = ?auto_488425 ?auto_488427 ) ) ( not ( = ?auto_488425 ?auto_488428 ) ) ( not ( = ?auto_488425 ?auto_488429 ) ) ( not ( = ?auto_488425 ?auto_488430 ) ) ( not ( = ?auto_488425 ?auto_488431 ) ) ( not ( = ?auto_488426 ?auto_488427 ) ) ( not ( = ?auto_488426 ?auto_488428 ) ) ( not ( = ?auto_488426 ?auto_488429 ) ) ( not ( = ?auto_488426 ?auto_488430 ) ) ( not ( = ?auto_488426 ?auto_488431 ) ) ( not ( = ?auto_488427 ?auto_488428 ) ) ( not ( = ?auto_488427 ?auto_488429 ) ) ( not ( = ?auto_488427 ?auto_488430 ) ) ( not ( = ?auto_488427 ?auto_488431 ) ) ( not ( = ?auto_488428 ?auto_488429 ) ) ( not ( = ?auto_488428 ?auto_488430 ) ) ( not ( = ?auto_488428 ?auto_488431 ) ) ( not ( = ?auto_488429 ?auto_488430 ) ) ( not ( = ?auto_488429 ?auto_488431 ) ) ( not ( = ?auto_488430 ?auto_488431 ) ) ( ON ?auto_488429 ?auto_488430 ) ( ON ?auto_488428 ?auto_488429 ) ( ON ?auto_488427 ?auto_488428 ) ( ON ?auto_488426 ?auto_488427 ) ( ON ?auto_488425 ?auto_488426 ) ( CLEAR ?auto_488423 ) ( ON ?auto_488424 ?auto_488425 ) ( CLEAR ?auto_488424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_488416 ?auto_488417 ?auto_488418 ?auto_488419 ?auto_488420 ?auto_488421 ?auto_488422 ?auto_488423 ?auto_488424 )
      ( MAKE-15PILE ?auto_488416 ?auto_488417 ?auto_488418 ?auto_488419 ?auto_488420 ?auto_488421 ?auto_488422 ?auto_488423 ?auto_488424 ?auto_488425 ?auto_488426 ?auto_488427 ?auto_488428 ?auto_488429 ?auto_488430 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488478 - BLOCK
      ?auto_488479 - BLOCK
      ?auto_488480 - BLOCK
      ?auto_488481 - BLOCK
      ?auto_488482 - BLOCK
      ?auto_488483 - BLOCK
      ?auto_488484 - BLOCK
      ?auto_488485 - BLOCK
      ?auto_488486 - BLOCK
      ?auto_488487 - BLOCK
      ?auto_488488 - BLOCK
      ?auto_488489 - BLOCK
      ?auto_488490 - BLOCK
      ?auto_488491 - BLOCK
      ?auto_488492 - BLOCK
    )
    :vars
    (
      ?auto_488493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488492 ?auto_488493 ) ( ON-TABLE ?auto_488478 ) ( ON ?auto_488479 ?auto_488478 ) ( ON ?auto_488480 ?auto_488479 ) ( ON ?auto_488481 ?auto_488480 ) ( ON ?auto_488482 ?auto_488481 ) ( ON ?auto_488483 ?auto_488482 ) ( ON ?auto_488484 ?auto_488483 ) ( not ( = ?auto_488478 ?auto_488479 ) ) ( not ( = ?auto_488478 ?auto_488480 ) ) ( not ( = ?auto_488478 ?auto_488481 ) ) ( not ( = ?auto_488478 ?auto_488482 ) ) ( not ( = ?auto_488478 ?auto_488483 ) ) ( not ( = ?auto_488478 ?auto_488484 ) ) ( not ( = ?auto_488478 ?auto_488485 ) ) ( not ( = ?auto_488478 ?auto_488486 ) ) ( not ( = ?auto_488478 ?auto_488487 ) ) ( not ( = ?auto_488478 ?auto_488488 ) ) ( not ( = ?auto_488478 ?auto_488489 ) ) ( not ( = ?auto_488478 ?auto_488490 ) ) ( not ( = ?auto_488478 ?auto_488491 ) ) ( not ( = ?auto_488478 ?auto_488492 ) ) ( not ( = ?auto_488478 ?auto_488493 ) ) ( not ( = ?auto_488479 ?auto_488480 ) ) ( not ( = ?auto_488479 ?auto_488481 ) ) ( not ( = ?auto_488479 ?auto_488482 ) ) ( not ( = ?auto_488479 ?auto_488483 ) ) ( not ( = ?auto_488479 ?auto_488484 ) ) ( not ( = ?auto_488479 ?auto_488485 ) ) ( not ( = ?auto_488479 ?auto_488486 ) ) ( not ( = ?auto_488479 ?auto_488487 ) ) ( not ( = ?auto_488479 ?auto_488488 ) ) ( not ( = ?auto_488479 ?auto_488489 ) ) ( not ( = ?auto_488479 ?auto_488490 ) ) ( not ( = ?auto_488479 ?auto_488491 ) ) ( not ( = ?auto_488479 ?auto_488492 ) ) ( not ( = ?auto_488479 ?auto_488493 ) ) ( not ( = ?auto_488480 ?auto_488481 ) ) ( not ( = ?auto_488480 ?auto_488482 ) ) ( not ( = ?auto_488480 ?auto_488483 ) ) ( not ( = ?auto_488480 ?auto_488484 ) ) ( not ( = ?auto_488480 ?auto_488485 ) ) ( not ( = ?auto_488480 ?auto_488486 ) ) ( not ( = ?auto_488480 ?auto_488487 ) ) ( not ( = ?auto_488480 ?auto_488488 ) ) ( not ( = ?auto_488480 ?auto_488489 ) ) ( not ( = ?auto_488480 ?auto_488490 ) ) ( not ( = ?auto_488480 ?auto_488491 ) ) ( not ( = ?auto_488480 ?auto_488492 ) ) ( not ( = ?auto_488480 ?auto_488493 ) ) ( not ( = ?auto_488481 ?auto_488482 ) ) ( not ( = ?auto_488481 ?auto_488483 ) ) ( not ( = ?auto_488481 ?auto_488484 ) ) ( not ( = ?auto_488481 ?auto_488485 ) ) ( not ( = ?auto_488481 ?auto_488486 ) ) ( not ( = ?auto_488481 ?auto_488487 ) ) ( not ( = ?auto_488481 ?auto_488488 ) ) ( not ( = ?auto_488481 ?auto_488489 ) ) ( not ( = ?auto_488481 ?auto_488490 ) ) ( not ( = ?auto_488481 ?auto_488491 ) ) ( not ( = ?auto_488481 ?auto_488492 ) ) ( not ( = ?auto_488481 ?auto_488493 ) ) ( not ( = ?auto_488482 ?auto_488483 ) ) ( not ( = ?auto_488482 ?auto_488484 ) ) ( not ( = ?auto_488482 ?auto_488485 ) ) ( not ( = ?auto_488482 ?auto_488486 ) ) ( not ( = ?auto_488482 ?auto_488487 ) ) ( not ( = ?auto_488482 ?auto_488488 ) ) ( not ( = ?auto_488482 ?auto_488489 ) ) ( not ( = ?auto_488482 ?auto_488490 ) ) ( not ( = ?auto_488482 ?auto_488491 ) ) ( not ( = ?auto_488482 ?auto_488492 ) ) ( not ( = ?auto_488482 ?auto_488493 ) ) ( not ( = ?auto_488483 ?auto_488484 ) ) ( not ( = ?auto_488483 ?auto_488485 ) ) ( not ( = ?auto_488483 ?auto_488486 ) ) ( not ( = ?auto_488483 ?auto_488487 ) ) ( not ( = ?auto_488483 ?auto_488488 ) ) ( not ( = ?auto_488483 ?auto_488489 ) ) ( not ( = ?auto_488483 ?auto_488490 ) ) ( not ( = ?auto_488483 ?auto_488491 ) ) ( not ( = ?auto_488483 ?auto_488492 ) ) ( not ( = ?auto_488483 ?auto_488493 ) ) ( not ( = ?auto_488484 ?auto_488485 ) ) ( not ( = ?auto_488484 ?auto_488486 ) ) ( not ( = ?auto_488484 ?auto_488487 ) ) ( not ( = ?auto_488484 ?auto_488488 ) ) ( not ( = ?auto_488484 ?auto_488489 ) ) ( not ( = ?auto_488484 ?auto_488490 ) ) ( not ( = ?auto_488484 ?auto_488491 ) ) ( not ( = ?auto_488484 ?auto_488492 ) ) ( not ( = ?auto_488484 ?auto_488493 ) ) ( not ( = ?auto_488485 ?auto_488486 ) ) ( not ( = ?auto_488485 ?auto_488487 ) ) ( not ( = ?auto_488485 ?auto_488488 ) ) ( not ( = ?auto_488485 ?auto_488489 ) ) ( not ( = ?auto_488485 ?auto_488490 ) ) ( not ( = ?auto_488485 ?auto_488491 ) ) ( not ( = ?auto_488485 ?auto_488492 ) ) ( not ( = ?auto_488485 ?auto_488493 ) ) ( not ( = ?auto_488486 ?auto_488487 ) ) ( not ( = ?auto_488486 ?auto_488488 ) ) ( not ( = ?auto_488486 ?auto_488489 ) ) ( not ( = ?auto_488486 ?auto_488490 ) ) ( not ( = ?auto_488486 ?auto_488491 ) ) ( not ( = ?auto_488486 ?auto_488492 ) ) ( not ( = ?auto_488486 ?auto_488493 ) ) ( not ( = ?auto_488487 ?auto_488488 ) ) ( not ( = ?auto_488487 ?auto_488489 ) ) ( not ( = ?auto_488487 ?auto_488490 ) ) ( not ( = ?auto_488487 ?auto_488491 ) ) ( not ( = ?auto_488487 ?auto_488492 ) ) ( not ( = ?auto_488487 ?auto_488493 ) ) ( not ( = ?auto_488488 ?auto_488489 ) ) ( not ( = ?auto_488488 ?auto_488490 ) ) ( not ( = ?auto_488488 ?auto_488491 ) ) ( not ( = ?auto_488488 ?auto_488492 ) ) ( not ( = ?auto_488488 ?auto_488493 ) ) ( not ( = ?auto_488489 ?auto_488490 ) ) ( not ( = ?auto_488489 ?auto_488491 ) ) ( not ( = ?auto_488489 ?auto_488492 ) ) ( not ( = ?auto_488489 ?auto_488493 ) ) ( not ( = ?auto_488490 ?auto_488491 ) ) ( not ( = ?auto_488490 ?auto_488492 ) ) ( not ( = ?auto_488490 ?auto_488493 ) ) ( not ( = ?auto_488491 ?auto_488492 ) ) ( not ( = ?auto_488491 ?auto_488493 ) ) ( not ( = ?auto_488492 ?auto_488493 ) ) ( ON ?auto_488491 ?auto_488492 ) ( ON ?auto_488490 ?auto_488491 ) ( ON ?auto_488489 ?auto_488490 ) ( ON ?auto_488488 ?auto_488489 ) ( ON ?auto_488487 ?auto_488488 ) ( ON ?auto_488486 ?auto_488487 ) ( CLEAR ?auto_488484 ) ( ON ?auto_488485 ?auto_488486 ) ( CLEAR ?auto_488485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_488478 ?auto_488479 ?auto_488480 ?auto_488481 ?auto_488482 ?auto_488483 ?auto_488484 ?auto_488485 )
      ( MAKE-15PILE ?auto_488478 ?auto_488479 ?auto_488480 ?auto_488481 ?auto_488482 ?auto_488483 ?auto_488484 ?auto_488485 ?auto_488486 ?auto_488487 ?auto_488488 ?auto_488489 ?auto_488490 ?auto_488491 ?auto_488492 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488540 - BLOCK
      ?auto_488541 - BLOCK
      ?auto_488542 - BLOCK
      ?auto_488543 - BLOCK
      ?auto_488544 - BLOCK
      ?auto_488545 - BLOCK
      ?auto_488546 - BLOCK
      ?auto_488547 - BLOCK
      ?auto_488548 - BLOCK
      ?auto_488549 - BLOCK
      ?auto_488550 - BLOCK
      ?auto_488551 - BLOCK
      ?auto_488552 - BLOCK
      ?auto_488553 - BLOCK
      ?auto_488554 - BLOCK
    )
    :vars
    (
      ?auto_488555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488554 ?auto_488555 ) ( ON-TABLE ?auto_488540 ) ( ON ?auto_488541 ?auto_488540 ) ( ON ?auto_488542 ?auto_488541 ) ( ON ?auto_488543 ?auto_488542 ) ( ON ?auto_488544 ?auto_488543 ) ( ON ?auto_488545 ?auto_488544 ) ( not ( = ?auto_488540 ?auto_488541 ) ) ( not ( = ?auto_488540 ?auto_488542 ) ) ( not ( = ?auto_488540 ?auto_488543 ) ) ( not ( = ?auto_488540 ?auto_488544 ) ) ( not ( = ?auto_488540 ?auto_488545 ) ) ( not ( = ?auto_488540 ?auto_488546 ) ) ( not ( = ?auto_488540 ?auto_488547 ) ) ( not ( = ?auto_488540 ?auto_488548 ) ) ( not ( = ?auto_488540 ?auto_488549 ) ) ( not ( = ?auto_488540 ?auto_488550 ) ) ( not ( = ?auto_488540 ?auto_488551 ) ) ( not ( = ?auto_488540 ?auto_488552 ) ) ( not ( = ?auto_488540 ?auto_488553 ) ) ( not ( = ?auto_488540 ?auto_488554 ) ) ( not ( = ?auto_488540 ?auto_488555 ) ) ( not ( = ?auto_488541 ?auto_488542 ) ) ( not ( = ?auto_488541 ?auto_488543 ) ) ( not ( = ?auto_488541 ?auto_488544 ) ) ( not ( = ?auto_488541 ?auto_488545 ) ) ( not ( = ?auto_488541 ?auto_488546 ) ) ( not ( = ?auto_488541 ?auto_488547 ) ) ( not ( = ?auto_488541 ?auto_488548 ) ) ( not ( = ?auto_488541 ?auto_488549 ) ) ( not ( = ?auto_488541 ?auto_488550 ) ) ( not ( = ?auto_488541 ?auto_488551 ) ) ( not ( = ?auto_488541 ?auto_488552 ) ) ( not ( = ?auto_488541 ?auto_488553 ) ) ( not ( = ?auto_488541 ?auto_488554 ) ) ( not ( = ?auto_488541 ?auto_488555 ) ) ( not ( = ?auto_488542 ?auto_488543 ) ) ( not ( = ?auto_488542 ?auto_488544 ) ) ( not ( = ?auto_488542 ?auto_488545 ) ) ( not ( = ?auto_488542 ?auto_488546 ) ) ( not ( = ?auto_488542 ?auto_488547 ) ) ( not ( = ?auto_488542 ?auto_488548 ) ) ( not ( = ?auto_488542 ?auto_488549 ) ) ( not ( = ?auto_488542 ?auto_488550 ) ) ( not ( = ?auto_488542 ?auto_488551 ) ) ( not ( = ?auto_488542 ?auto_488552 ) ) ( not ( = ?auto_488542 ?auto_488553 ) ) ( not ( = ?auto_488542 ?auto_488554 ) ) ( not ( = ?auto_488542 ?auto_488555 ) ) ( not ( = ?auto_488543 ?auto_488544 ) ) ( not ( = ?auto_488543 ?auto_488545 ) ) ( not ( = ?auto_488543 ?auto_488546 ) ) ( not ( = ?auto_488543 ?auto_488547 ) ) ( not ( = ?auto_488543 ?auto_488548 ) ) ( not ( = ?auto_488543 ?auto_488549 ) ) ( not ( = ?auto_488543 ?auto_488550 ) ) ( not ( = ?auto_488543 ?auto_488551 ) ) ( not ( = ?auto_488543 ?auto_488552 ) ) ( not ( = ?auto_488543 ?auto_488553 ) ) ( not ( = ?auto_488543 ?auto_488554 ) ) ( not ( = ?auto_488543 ?auto_488555 ) ) ( not ( = ?auto_488544 ?auto_488545 ) ) ( not ( = ?auto_488544 ?auto_488546 ) ) ( not ( = ?auto_488544 ?auto_488547 ) ) ( not ( = ?auto_488544 ?auto_488548 ) ) ( not ( = ?auto_488544 ?auto_488549 ) ) ( not ( = ?auto_488544 ?auto_488550 ) ) ( not ( = ?auto_488544 ?auto_488551 ) ) ( not ( = ?auto_488544 ?auto_488552 ) ) ( not ( = ?auto_488544 ?auto_488553 ) ) ( not ( = ?auto_488544 ?auto_488554 ) ) ( not ( = ?auto_488544 ?auto_488555 ) ) ( not ( = ?auto_488545 ?auto_488546 ) ) ( not ( = ?auto_488545 ?auto_488547 ) ) ( not ( = ?auto_488545 ?auto_488548 ) ) ( not ( = ?auto_488545 ?auto_488549 ) ) ( not ( = ?auto_488545 ?auto_488550 ) ) ( not ( = ?auto_488545 ?auto_488551 ) ) ( not ( = ?auto_488545 ?auto_488552 ) ) ( not ( = ?auto_488545 ?auto_488553 ) ) ( not ( = ?auto_488545 ?auto_488554 ) ) ( not ( = ?auto_488545 ?auto_488555 ) ) ( not ( = ?auto_488546 ?auto_488547 ) ) ( not ( = ?auto_488546 ?auto_488548 ) ) ( not ( = ?auto_488546 ?auto_488549 ) ) ( not ( = ?auto_488546 ?auto_488550 ) ) ( not ( = ?auto_488546 ?auto_488551 ) ) ( not ( = ?auto_488546 ?auto_488552 ) ) ( not ( = ?auto_488546 ?auto_488553 ) ) ( not ( = ?auto_488546 ?auto_488554 ) ) ( not ( = ?auto_488546 ?auto_488555 ) ) ( not ( = ?auto_488547 ?auto_488548 ) ) ( not ( = ?auto_488547 ?auto_488549 ) ) ( not ( = ?auto_488547 ?auto_488550 ) ) ( not ( = ?auto_488547 ?auto_488551 ) ) ( not ( = ?auto_488547 ?auto_488552 ) ) ( not ( = ?auto_488547 ?auto_488553 ) ) ( not ( = ?auto_488547 ?auto_488554 ) ) ( not ( = ?auto_488547 ?auto_488555 ) ) ( not ( = ?auto_488548 ?auto_488549 ) ) ( not ( = ?auto_488548 ?auto_488550 ) ) ( not ( = ?auto_488548 ?auto_488551 ) ) ( not ( = ?auto_488548 ?auto_488552 ) ) ( not ( = ?auto_488548 ?auto_488553 ) ) ( not ( = ?auto_488548 ?auto_488554 ) ) ( not ( = ?auto_488548 ?auto_488555 ) ) ( not ( = ?auto_488549 ?auto_488550 ) ) ( not ( = ?auto_488549 ?auto_488551 ) ) ( not ( = ?auto_488549 ?auto_488552 ) ) ( not ( = ?auto_488549 ?auto_488553 ) ) ( not ( = ?auto_488549 ?auto_488554 ) ) ( not ( = ?auto_488549 ?auto_488555 ) ) ( not ( = ?auto_488550 ?auto_488551 ) ) ( not ( = ?auto_488550 ?auto_488552 ) ) ( not ( = ?auto_488550 ?auto_488553 ) ) ( not ( = ?auto_488550 ?auto_488554 ) ) ( not ( = ?auto_488550 ?auto_488555 ) ) ( not ( = ?auto_488551 ?auto_488552 ) ) ( not ( = ?auto_488551 ?auto_488553 ) ) ( not ( = ?auto_488551 ?auto_488554 ) ) ( not ( = ?auto_488551 ?auto_488555 ) ) ( not ( = ?auto_488552 ?auto_488553 ) ) ( not ( = ?auto_488552 ?auto_488554 ) ) ( not ( = ?auto_488552 ?auto_488555 ) ) ( not ( = ?auto_488553 ?auto_488554 ) ) ( not ( = ?auto_488553 ?auto_488555 ) ) ( not ( = ?auto_488554 ?auto_488555 ) ) ( ON ?auto_488553 ?auto_488554 ) ( ON ?auto_488552 ?auto_488553 ) ( ON ?auto_488551 ?auto_488552 ) ( ON ?auto_488550 ?auto_488551 ) ( ON ?auto_488549 ?auto_488550 ) ( ON ?auto_488548 ?auto_488549 ) ( ON ?auto_488547 ?auto_488548 ) ( CLEAR ?auto_488545 ) ( ON ?auto_488546 ?auto_488547 ) ( CLEAR ?auto_488546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_488540 ?auto_488541 ?auto_488542 ?auto_488543 ?auto_488544 ?auto_488545 ?auto_488546 )
      ( MAKE-15PILE ?auto_488540 ?auto_488541 ?auto_488542 ?auto_488543 ?auto_488544 ?auto_488545 ?auto_488546 ?auto_488547 ?auto_488548 ?auto_488549 ?auto_488550 ?auto_488551 ?auto_488552 ?auto_488553 ?auto_488554 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488602 - BLOCK
      ?auto_488603 - BLOCK
      ?auto_488604 - BLOCK
      ?auto_488605 - BLOCK
      ?auto_488606 - BLOCK
      ?auto_488607 - BLOCK
      ?auto_488608 - BLOCK
      ?auto_488609 - BLOCK
      ?auto_488610 - BLOCK
      ?auto_488611 - BLOCK
      ?auto_488612 - BLOCK
      ?auto_488613 - BLOCK
      ?auto_488614 - BLOCK
      ?auto_488615 - BLOCK
      ?auto_488616 - BLOCK
    )
    :vars
    (
      ?auto_488617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488616 ?auto_488617 ) ( ON-TABLE ?auto_488602 ) ( ON ?auto_488603 ?auto_488602 ) ( ON ?auto_488604 ?auto_488603 ) ( ON ?auto_488605 ?auto_488604 ) ( ON ?auto_488606 ?auto_488605 ) ( not ( = ?auto_488602 ?auto_488603 ) ) ( not ( = ?auto_488602 ?auto_488604 ) ) ( not ( = ?auto_488602 ?auto_488605 ) ) ( not ( = ?auto_488602 ?auto_488606 ) ) ( not ( = ?auto_488602 ?auto_488607 ) ) ( not ( = ?auto_488602 ?auto_488608 ) ) ( not ( = ?auto_488602 ?auto_488609 ) ) ( not ( = ?auto_488602 ?auto_488610 ) ) ( not ( = ?auto_488602 ?auto_488611 ) ) ( not ( = ?auto_488602 ?auto_488612 ) ) ( not ( = ?auto_488602 ?auto_488613 ) ) ( not ( = ?auto_488602 ?auto_488614 ) ) ( not ( = ?auto_488602 ?auto_488615 ) ) ( not ( = ?auto_488602 ?auto_488616 ) ) ( not ( = ?auto_488602 ?auto_488617 ) ) ( not ( = ?auto_488603 ?auto_488604 ) ) ( not ( = ?auto_488603 ?auto_488605 ) ) ( not ( = ?auto_488603 ?auto_488606 ) ) ( not ( = ?auto_488603 ?auto_488607 ) ) ( not ( = ?auto_488603 ?auto_488608 ) ) ( not ( = ?auto_488603 ?auto_488609 ) ) ( not ( = ?auto_488603 ?auto_488610 ) ) ( not ( = ?auto_488603 ?auto_488611 ) ) ( not ( = ?auto_488603 ?auto_488612 ) ) ( not ( = ?auto_488603 ?auto_488613 ) ) ( not ( = ?auto_488603 ?auto_488614 ) ) ( not ( = ?auto_488603 ?auto_488615 ) ) ( not ( = ?auto_488603 ?auto_488616 ) ) ( not ( = ?auto_488603 ?auto_488617 ) ) ( not ( = ?auto_488604 ?auto_488605 ) ) ( not ( = ?auto_488604 ?auto_488606 ) ) ( not ( = ?auto_488604 ?auto_488607 ) ) ( not ( = ?auto_488604 ?auto_488608 ) ) ( not ( = ?auto_488604 ?auto_488609 ) ) ( not ( = ?auto_488604 ?auto_488610 ) ) ( not ( = ?auto_488604 ?auto_488611 ) ) ( not ( = ?auto_488604 ?auto_488612 ) ) ( not ( = ?auto_488604 ?auto_488613 ) ) ( not ( = ?auto_488604 ?auto_488614 ) ) ( not ( = ?auto_488604 ?auto_488615 ) ) ( not ( = ?auto_488604 ?auto_488616 ) ) ( not ( = ?auto_488604 ?auto_488617 ) ) ( not ( = ?auto_488605 ?auto_488606 ) ) ( not ( = ?auto_488605 ?auto_488607 ) ) ( not ( = ?auto_488605 ?auto_488608 ) ) ( not ( = ?auto_488605 ?auto_488609 ) ) ( not ( = ?auto_488605 ?auto_488610 ) ) ( not ( = ?auto_488605 ?auto_488611 ) ) ( not ( = ?auto_488605 ?auto_488612 ) ) ( not ( = ?auto_488605 ?auto_488613 ) ) ( not ( = ?auto_488605 ?auto_488614 ) ) ( not ( = ?auto_488605 ?auto_488615 ) ) ( not ( = ?auto_488605 ?auto_488616 ) ) ( not ( = ?auto_488605 ?auto_488617 ) ) ( not ( = ?auto_488606 ?auto_488607 ) ) ( not ( = ?auto_488606 ?auto_488608 ) ) ( not ( = ?auto_488606 ?auto_488609 ) ) ( not ( = ?auto_488606 ?auto_488610 ) ) ( not ( = ?auto_488606 ?auto_488611 ) ) ( not ( = ?auto_488606 ?auto_488612 ) ) ( not ( = ?auto_488606 ?auto_488613 ) ) ( not ( = ?auto_488606 ?auto_488614 ) ) ( not ( = ?auto_488606 ?auto_488615 ) ) ( not ( = ?auto_488606 ?auto_488616 ) ) ( not ( = ?auto_488606 ?auto_488617 ) ) ( not ( = ?auto_488607 ?auto_488608 ) ) ( not ( = ?auto_488607 ?auto_488609 ) ) ( not ( = ?auto_488607 ?auto_488610 ) ) ( not ( = ?auto_488607 ?auto_488611 ) ) ( not ( = ?auto_488607 ?auto_488612 ) ) ( not ( = ?auto_488607 ?auto_488613 ) ) ( not ( = ?auto_488607 ?auto_488614 ) ) ( not ( = ?auto_488607 ?auto_488615 ) ) ( not ( = ?auto_488607 ?auto_488616 ) ) ( not ( = ?auto_488607 ?auto_488617 ) ) ( not ( = ?auto_488608 ?auto_488609 ) ) ( not ( = ?auto_488608 ?auto_488610 ) ) ( not ( = ?auto_488608 ?auto_488611 ) ) ( not ( = ?auto_488608 ?auto_488612 ) ) ( not ( = ?auto_488608 ?auto_488613 ) ) ( not ( = ?auto_488608 ?auto_488614 ) ) ( not ( = ?auto_488608 ?auto_488615 ) ) ( not ( = ?auto_488608 ?auto_488616 ) ) ( not ( = ?auto_488608 ?auto_488617 ) ) ( not ( = ?auto_488609 ?auto_488610 ) ) ( not ( = ?auto_488609 ?auto_488611 ) ) ( not ( = ?auto_488609 ?auto_488612 ) ) ( not ( = ?auto_488609 ?auto_488613 ) ) ( not ( = ?auto_488609 ?auto_488614 ) ) ( not ( = ?auto_488609 ?auto_488615 ) ) ( not ( = ?auto_488609 ?auto_488616 ) ) ( not ( = ?auto_488609 ?auto_488617 ) ) ( not ( = ?auto_488610 ?auto_488611 ) ) ( not ( = ?auto_488610 ?auto_488612 ) ) ( not ( = ?auto_488610 ?auto_488613 ) ) ( not ( = ?auto_488610 ?auto_488614 ) ) ( not ( = ?auto_488610 ?auto_488615 ) ) ( not ( = ?auto_488610 ?auto_488616 ) ) ( not ( = ?auto_488610 ?auto_488617 ) ) ( not ( = ?auto_488611 ?auto_488612 ) ) ( not ( = ?auto_488611 ?auto_488613 ) ) ( not ( = ?auto_488611 ?auto_488614 ) ) ( not ( = ?auto_488611 ?auto_488615 ) ) ( not ( = ?auto_488611 ?auto_488616 ) ) ( not ( = ?auto_488611 ?auto_488617 ) ) ( not ( = ?auto_488612 ?auto_488613 ) ) ( not ( = ?auto_488612 ?auto_488614 ) ) ( not ( = ?auto_488612 ?auto_488615 ) ) ( not ( = ?auto_488612 ?auto_488616 ) ) ( not ( = ?auto_488612 ?auto_488617 ) ) ( not ( = ?auto_488613 ?auto_488614 ) ) ( not ( = ?auto_488613 ?auto_488615 ) ) ( not ( = ?auto_488613 ?auto_488616 ) ) ( not ( = ?auto_488613 ?auto_488617 ) ) ( not ( = ?auto_488614 ?auto_488615 ) ) ( not ( = ?auto_488614 ?auto_488616 ) ) ( not ( = ?auto_488614 ?auto_488617 ) ) ( not ( = ?auto_488615 ?auto_488616 ) ) ( not ( = ?auto_488615 ?auto_488617 ) ) ( not ( = ?auto_488616 ?auto_488617 ) ) ( ON ?auto_488615 ?auto_488616 ) ( ON ?auto_488614 ?auto_488615 ) ( ON ?auto_488613 ?auto_488614 ) ( ON ?auto_488612 ?auto_488613 ) ( ON ?auto_488611 ?auto_488612 ) ( ON ?auto_488610 ?auto_488611 ) ( ON ?auto_488609 ?auto_488610 ) ( ON ?auto_488608 ?auto_488609 ) ( CLEAR ?auto_488606 ) ( ON ?auto_488607 ?auto_488608 ) ( CLEAR ?auto_488607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_488602 ?auto_488603 ?auto_488604 ?auto_488605 ?auto_488606 ?auto_488607 )
      ( MAKE-15PILE ?auto_488602 ?auto_488603 ?auto_488604 ?auto_488605 ?auto_488606 ?auto_488607 ?auto_488608 ?auto_488609 ?auto_488610 ?auto_488611 ?auto_488612 ?auto_488613 ?auto_488614 ?auto_488615 ?auto_488616 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488664 - BLOCK
      ?auto_488665 - BLOCK
      ?auto_488666 - BLOCK
      ?auto_488667 - BLOCK
      ?auto_488668 - BLOCK
      ?auto_488669 - BLOCK
      ?auto_488670 - BLOCK
      ?auto_488671 - BLOCK
      ?auto_488672 - BLOCK
      ?auto_488673 - BLOCK
      ?auto_488674 - BLOCK
      ?auto_488675 - BLOCK
      ?auto_488676 - BLOCK
      ?auto_488677 - BLOCK
      ?auto_488678 - BLOCK
    )
    :vars
    (
      ?auto_488679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488678 ?auto_488679 ) ( ON-TABLE ?auto_488664 ) ( ON ?auto_488665 ?auto_488664 ) ( ON ?auto_488666 ?auto_488665 ) ( ON ?auto_488667 ?auto_488666 ) ( not ( = ?auto_488664 ?auto_488665 ) ) ( not ( = ?auto_488664 ?auto_488666 ) ) ( not ( = ?auto_488664 ?auto_488667 ) ) ( not ( = ?auto_488664 ?auto_488668 ) ) ( not ( = ?auto_488664 ?auto_488669 ) ) ( not ( = ?auto_488664 ?auto_488670 ) ) ( not ( = ?auto_488664 ?auto_488671 ) ) ( not ( = ?auto_488664 ?auto_488672 ) ) ( not ( = ?auto_488664 ?auto_488673 ) ) ( not ( = ?auto_488664 ?auto_488674 ) ) ( not ( = ?auto_488664 ?auto_488675 ) ) ( not ( = ?auto_488664 ?auto_488676 ) ) ( not ( = ?auto_488664 ?auto_488677 ) ) ( not ( = ?auto_488664 ?auto_488678 ) ) ( not ( = ?auto_488664 ?auto_488679 ) ) ( not ( = ?auto_488665 ?auto_488666 ) ) ( not ( = ?auto_488665 ?auto_488667 ) ) ( not ( = ?auto_488665 ?auto_488668 ) ) ( not ( = ?auto_488665 ?auto_488669 ) ) ( not ( = ?auto_488665 ?auto_488670 ) ) ( not ( = ?auto_488665 ?auto_488671 ) ) ( not ( = ?auto_488665 ?auto_488672 ) ) ( not ( = ?auto_488665 ?auto_488673 ) ) ( not ( = ?auto_488665 ?auto_488674 ) ) ( not ( = ?auto_488665 ?auto_488675 ) ) ( not ( = ?auto_488665 ?auto_488676 ) ) ( not ( = ?auto_488665 ?auto_488677 ) ) ( not ( = ?auto_488665 ?auto_488678 ) ) ( not ( = ?auto_488665 ?auto_488679 ) ) ( not ( = ?auto_488666 ?auto_488667 ) ) ( not ( = ?auto_488666 ?auto_488668 ) ) ( not ( = ?auto_488666 ?auto_488669 ) ) ( not ( = ?auto_488666 ?auto_488670 ) ) ( not ( = ?auto_488666 ?auto_488671 ) ) ( not ( = ?auto_488666 ?auto_488672 ) ) ( not ( = ?auto_488666 ?auto_488673 ) ) ( not ( = ?auto_488666 ?auto_488674 ) ) ( not ( = ?auto_488666 ?auto_488675 ) ) ( not ( = ?auto_488666 ?auto_488676 ) ) ( not ( = ?auto_488666 ?auto_488677 ) ) ( not ( = ?auto_488666 ?auto_488678 ) ) ( not ( = ?auto_488666 ?auto_488679 ) ) ( not ( = ?auto_488667 ?auto_488668 ) ) ( not ( = ?auto_488667 ?auto_488669 ) ) ( not ( = ?auto_488667 ?auto_488670 ) ) ( not ( = ?auto_488667 ?auto_488671 ) ) ( not ( = ?auto_488667 ?auto_488672 ) ) ( not ( = ?auto_488667 ?auto_488673 ) ) ( not ( = ?auto_488667 ?auto_488674 ) ) ( not ( = ?auto_488667 ?auto_488675 ) ) ( not ( = ?auto_488667 ?auto_488676 ) ) ( not ( = ?auto_488667 ?auto_488677 ) ) ( not ( = ?auto_488667 ?auto_488678 ) ) ( not ( = ?auto_488667 ?auto_488679 ) ) ( not ( = ?auto_488668 ?auto_488669 ) ) ( not ( = ?auto_488668 ?auto_488670 ) ) ( not ( = ?auto_488668 ?auto_488671 ) ) ( not ( = ?auto_488668 ?auto_488672 ) ) ( not ( = ?auto_488668 ?auto_488673 ) ) ( not ( = ?auto_488668 ?auto_488674 ) ) ( not ( = ?auto_488668 ?auto_488675 ) ) ( not ( = ?auto_488668 ?auto_488676 ) ) ( not ( = ?auto_488668 ?auto_488677 ) ) ( not ( = ?auto_488668 ?auto_488678 ) ) ( not ( = ?auto_488668 ?auto_488679 ) ) ( not ( = ?auto_488669 ?auto_488670 ) ) ( not ( = ?auto_488669 ?auto_488671 ) ) ( not ( = ?auto_488669 ?auto_488672 ) ) ( not ( = ?auto_488669 ?auto_488673 ) ) ( not ( = ?auto_488669 ?auto_488674 ) ) ( not ( = ?auto_488669 ?auto_488675 ) ) ( not ( = ?auto_488669 ?auto_488676 ) ) ( not ( = ?auto_488669 ?auto_488677 ) ) ( not ( = ?auto_488669 ?auto_488678 ) ) ( not ( = ?auto_488669 ?auto_488679 ) ) ( not ( = ?auto_488670 ?auto_488671 ) ) ( not ( = ?auto_488670 ?auto_488672 ) ) ( not ( = ?auto_488670 ?auto_488673 ) ) ( not ( = ?auto_488670 ?auto_488674 ) ) ( not ( = ?auto_488670 ?auto_488675 ) ) ( not ( = ?auto_488670 ?auto_488676 ) ) ( not ( = ?auto_488670 ?auto_488677 ) ) ( not ( = ?auto_488670 ?auto_488678 ) ) ( not ( = ?auto_488670 ?auto_488679 ) ) ( not ( = ?auto_488671 ?auto_488672 ) ) ( not ( = ?auto_488671 ?auto_488673 ) ) ( not ( = ?auto_488671 ?auto_488674 ) ) ( not ( = ?auto_488671 ?auto_488675 ) ) ( not ( = ?auto_488671 ?auto_488676 ) ) ( not ( = ?auto_488671 ?auto_488677 ) ) ( not ( = ?auto_488671 ?auto_488678 ) ) ( not ( = ?auto_488671 ?auto_488679 ) ) ( not ( = ?auto_488672 ?auto_488673 ) ) ( not ( = ?auto_488672 ?auto_488674 ) ) ( not ( = ?auto_488672 ?auto_488675 ) ) ( not ( = ?auto_488672 ?auto_488676 ) ) ( not ( = ?auto_488672 ?auto_488677 ) ) ( not ( = ?auto_488672 ?auto_488678 ) ) ( not ( = ?auto_488672 ?auto_488679 ) ) ( not ( = ?auto_488673 ?auto_488674 ) ) ( not ( = ?auto_488673 ?auto_488675 ) ) ( not ( = ?auto_488673 ?auto_488676 ) ) ( not ( = ?auto_488673 ?auto_488677 ) ) ( not ( = ?auto_488673 ?auto_488678 ) ) ( not ( = ?auto_488673 ?auto_488679 ) ) ( not ( = ?auto_488674 ?auto_488675 ) ) ( not ( = ?auto_488674 ?auto_488676 ) ) ( not ( = ?auto_488674 ?auto_488677 ) ) ( not ( = ?auto_488674 ?auto_488678 ) ) ( not ( = ?auto_488674 ?auto_488679 ) ) ( not ( = ?auto_488675 ?auto_488676 ) ) ( not ( = ?auto_488675 ?auto_488677 ) ) ( not ( = ?auto_488675 ?auto_488678 ) ) ( not ( = ?auto_488675 ?auto_488679 ) ) ( not ( = ?auto_488676 ?auto_488677 ) ) ( not ( = ?auto_488676 ?auto_488678 ) ) ( not ( = ?auto_488676 ?auto_488679 ) ) ( not ( = ?auto_488677 ?auto_488678 ) ) ( not ( = ?auto_488677 ?auto_488679 ) ) ( not ( = ?auto_488678 ?auto_488679 ) ) ( ON ?auto_488677 ?auto_488678 ) ( ON ?auto_488676 ?auto_488677 ) ( ON ?auto_488675 ?auto_488676 ) ( ON ?auto_488674 ?auto_488675 ) ( ON ?auto_488673 ?auto_488674 ) ( ON ?auto_488672 ?auto_488673 ) ( ON ?auto_488671 ?auto_488672 ) ( ON ?auto_488670 ?auto_488671 ) ( ON ?auto_488669 ?auto_488670 ) ( CLEAR ?auto_488667 ) ( ON ?auto_488668 ?auto_488669 ) ( CLEAR ?auto_488668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_488664 ?auto_488665 ?auto_488666 ?auto_488667 ?auto_488668 )
      ( MAKE-15PILE ?auto_488664 ?auto_488665 ?auto_488666 ?auto_488667 ?auto_488668 ?auto_488669 ?auto_488670 ?auto_488671 ?auto_488672 ?auto_488673 ?auto_488674 ?auto_488675 ?auto_488676 ?auto_488677 ?auto_488678 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488726 - BLOCK
      ?auto_488727 - BLOCK
      ?auto_488728 - BLOCK
      ?auto_488729 - BLOCK
      ?auto_488730 - BLOCK
      ?auto_488731 - BLOCK
      ?auto_488732 - BLOCK
      ?auto_488733 - BLOCK
      ?auto_488734 - BLOCK
      ?auto_488735 - BLOCK
      ?auto_488736 - BLOCK
      ?auto_488737 - BLOCK
      ?auto_488738 - BLOCK
      ?auto_488739 - BLOCK
      ?auto_488740 - BLOCK
    )
    :vars
    (
      ?auto_488741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488740 ?auto_488741 ) ( ON-TABLE ?auto_488726 ) ( ON ?auto_488727 ?auto_488726 ) ( ON ?auto_488728 ?auto_488727 ) ( not ( = ?auto_488726 ?auto_488727 ) ) ( not ( = ?auto_488726 ?auto_488728 ) ) ( not ( = ?auto_488726 ?auto_488729 ) ) ( not ( = ?auto_488726 ?auto_488730 ) ) ( not ( = ?auto_488726 ?auto_488731 ) ) ( not ( = ?auto_488726 ?auto_488732 ) ) ( not ( = ?auto_488726 ?auto_488733 ) ) ( not ( = ?auto_488726 ?auto_488734 ) ) ( not ( = ?auto_488726 ?auto_488735 ) ) ( not ( = ?auto_488726 ?auto_488736 ) ) ( not ( = ?auto_488726 ?auto_488737 ) ) ( not ( = ?auto_488726 ?auto_488738 ) ) ( not ( = ?auto_488726 ?auto_488739 ) ) ( not ( = ?auto_488726 ?auto_488740 ) ) ( not ( = ?auto_488726 ?auto_488741 ) ) ( not ( = ?auto_488727 ?auto_488728 ) ) ( not ( = ?auto_488727 ?auto_488729 ) ) ( not ( = ?auto_488727 ?auto_488730 ) ) ( not ( = ?auto_488727 ?auto_488731 ) ) ( not ( = ?auto_488727 ?auto_488732 ) ) ( not ( = ?auto_488727 ?auto_488733 ) ) ( not ( = ?auto_488727 ?auto_488734 ) ) ( not ( = ?auto_488727 ?auto_488735 ) ) ( not ( = ?auto_488727 ?auto_488736 ) ) ( not ( = ?auto_488727 ?auto_488737 ) ) ( not ( = ?auto_488727 ?auto_488738 ) ) ( not ( = ?auto_488727 ?auto_488739 ) ) ( not ( = ?auto_488727 ?auto_488740 ) ) ( not ( = ?auto_488727 ?auto_488741 ) ) ( not ( = ?auto_488728 ?auto_488729 ) ) ( not ( = ?auto_488728 ?auto_488730 ) ) ( not ( = ?auto_488728 ?auto_488731 ) ) ( not ( = ?auto_488728 ?auto_488732 ) ) ( not ( = ?auto_488728 ?auto_488733 ) ) ( not ( = ?auto_488728 ?auto_488734 ) ) ( not ( = ?auto_488728 ?auto_488735 ) ) ( not ( = ?auto_488728 ?auto_488736 ) ) ( not ( = ?auto_488728 ?auto_488737 ) ) ( not ( = ?auto_488728 ?auto_488738 ) ) ( not ( = ?auto_488728 ?auto_488739 ) ) ( not ( = ?auto_488728 ?auto_488740 ) ) ( not ( = ?auto_488728 ?auto_488741 ) ) ( not ( = ?auto_488729 ?auto_488730 ) ) ( not ( = ?auto_488729 ?auto_488731 ) ) ( not ( = ?auto_488729 ?auto_488732 ) ) ( not ( = ?auto_488729 ?auto_488733 ) ) ( not ( = ?auto_488729 ?auto_488734 ) ) ( not ( = ?auto_488729 ?auto_488735 ) ) ( not ( = ?auto_488729 ?auto_488736 ) ) ( not ( = ?auto_488729 ?auto_488737 ) ) ( not ( = ?auto_488729 ?auto_488738 ) ) ( not ( = ?auto_488729 ?auto_488739 ) ) ( not ( = ?auto_488729 ?auto_488740 ) ) ( not ( = ?auto_488729 ?auto_488741 ) ) ( not ( = ?auto_488730 ?auto_488731 ) ) ( not ( = ?auto_488730 ?auto_488732 ) ) ( not ( = ?auto_488730 ?auto_488733 ) ) ( not ( = ?auto_488730 ?auto_488734 ) ) ( not ( = ?auto_488730 ?auto_488735 ) ) ( not ( = ?auto_488730 ?auto_488736 ) ) ( not ( = ?auto_488730 ?auto_488737 ) ) ( not ( = ?auto_488730 ?auto_488738 ) ) ( not ( = ?auto_488730 ?auto_488739 ) ) ( not ( = ?auto_488730 ?auto_488740 ) ) ( not ( = ?auto_488730 ?auto_488741 ) ) ( not ( = ?auto_488731 ?auto_488732 ) ) ( not ( = ?auto_488731 ?auto_488733 ) ) ( not ( = ?auto_488731 ?auto_488734 ) ) ( not ( = ?auto_488731 ?auto_488735 ) ) ( not ( = ?auto_488731 ?auto_488736 ) ) ( not ( = ?auto_488731 ?auto_488737 ) ) ( not ( = ?auto_488731 ?auto_488738 ) ) ( not ( = ?auto_488731 ?auto_488739 ) ) ( not ( = ?auto_488731 ?auto_488740 ) ) ( not ( = ?auto_488731 ?auto_488741 ) ) ( not ( = ?auto_488732 ?auto_488733 ) ) ( not ( = ?auto_488732 ?auto_488734 ) ) ( not ( = ?auto_488732 ?auto_488735 ) ) ( not ( = ?auto_488732 ?auto_488736 ) ) ( not ( = ?auto_488732 ?auto_488737 ) ) ( not ( = ?auto_488732 ?auto_488738 ) ) ( not ( = ?auto_488732 ?auto_488739 ) ) ( not ( = ?auto_488732 ?auto_488740 ) ) ( not ( = ?auto_488732 ?auto_488741 ) ) ( not ( = ?auto_488733 ?auto_488734 ) ) ( not ( = ?auto_488733 ?auto_488735 ) ) ( not ( = ?auto_488733 ?auto_488736 ) ) ( not ( = ?auto_488733 ?auto_488737 ) ) ( not ( = ?auto_488733 ?auto_488738 ) ) ( not ( = ?auto_488733 ?auto_488739 ) ) ( not ( = ?auto_488733 ?auto_488740 ) ) ( not ( = ?auto_488733 ?auto_488741 ) ) ( not ( = ?auto_488734 ?auto_488735 ) ) ( not ( = ?auto_488734 ?auto_488736 ) ) ( not ( = ?auto_488734 ?auto_488737 ) ) ( not ( = ?auto_488734 ?auto_488738 ) ) ( not ( = ?auto_488734 ?auto_488739 ) ) ( not ( = ?auto_488734 ?auto_488740 ) ) ( not ( = ?auto_488734 ?auto_488741 ) ) ( not ( = ?auto_488735 ?auto_488736 ) ) ( not ( = ?auto_488735 ?auto_488737 ) ) ( not ( = ?auto_488735 ?auto_488738 ) ) ( not ( = ?auto_488735 ?auto_488739 ) ) ( not ( = ?auto_488735 ?auto_488740 ) ) ( not ( = ?auto_488735 ?auto_488741 ) ) ( not ( = ?auto_488736 ?auto_488737 ) ) ( not ( = ?auto_488736 ?auto_488738 ) ) ( not ( = ?auto_488736 ?auto_488739 ) ) ( not ( = ?auto_488736 ?auto_488740 ) ) ( not ( = ?auto_488736 ?auto_488741 ) ) ( not ( = ?auto_488737 ?auto_488738 ) ) ( not ( = ?auto_488737 ?auto_488739 ) ) ( not ( = ?auto_488737 ?auto_488740 ) ) ( not ( = ?auto_488737 ?auto_488741 ) ) ( not ( = ?auto_488738 ?auto_488739 ) ) ( not ( = ?auto_488738 ?auto_488740 ) ) ( not ( = ?auto_488738 ?auto_488741 ) ) ( not ( = ?auto_488739 ?auto_488740 ) ) ( not ( = ?auto_488739 ?auto_488741 ) ) ( not ( = ?auto_488740 ?auto_488741 ) ) ( ON ?auto_488739 ?auto_488740 ) ( ON ?auto_488738 ?auto_488739 ) ( ON ?auto_488737 ?auto_488738 ) ( ON ?auto_488736 ?auto_488737 ) ( ON ?auto_488735 ?auto_488736 ) ( ON ?auto_488734 ?auto_488735 ) ( ON ?auto_488733 ?auto_488734 ) ( ON ?auto_488732 ?auto_488733 ) ( ON ?auto_488731 ?auto_488732 ) ( ON ?auto_488730 ?auto_488731 ) ( CLEAR ?auto_488728 ) ( ON ?auto_488729 ?auto_488730 ) ( CLEAR ?auto_488729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_488726 ?auto_488727 ?auto_488728 ?auto_488729 )
      ( MAKE-15PILE ?auto_488726 ?auto_488727 ?auto_488728 ?auto_488729 ?auto_488730 ?auto_488731 ?auto_488732 ?auto_488733 ?auto_488734 ?auto_488735 ?auto_488736 ?auto_488737 ?auto_488738 ?auto_488739 ?auto_488740 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488788 - BLOCK
      ?auto_488789 - BLOCK
      ?auto_488790 - BLOCK
      ?auto_488791 - BLOCK
      ?auto_488792 - BLOCK
      ?auto_488793 - BLOCK
      ?auto_488794 - BLOCK
      ?auto_488795 - BLOCK
      ?auto_488796 - BLOCK
      ?auto_488797 - BLOCK
      ?auto_488798 - BLOCK
      ?auto_488799 - BLOCK
      ?auto_488800 - BLOCK
      ?auto_488801 - BLOCK
      ?auto_488802 - BLOCK
    )
    :vars
    (
      ?auto_488803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488802 ?auto_488803 ) ( ON-TABLE ?auto_488788 ) ( ON ?auto_488789 ?auto_488788 ) ( not ( = ?auto_488788 ?auto_488789 ) ) ( not ( = ?auto_488788 ?auto_488790 ) ) ( not ( = ?auto_488788 ?auto_488791 ) ) ( not ( = ?auto_488788 ?auto_488792 ) ) ( not ( = ?auto_488788 ?auto_488793 ) ) ( not ( = ?auto_488788 ?auto_488794 ) ) ( not ( = ?auto_488788 ?auto_488795 ) ) ( not ( = ?auto_488788 ?auto_488796 ) ) ( not ( = ?auto_488788 ?auto_488797 ) ) ( not ( = ?auto_488788 ?auto_488798 ) ) ( not ( = ?auto_488788 ?auto_488799 ) ) ( not ( = ?auto_488788 ?auto_488800 ) ) ( not ( = ?auto_488788 ?auto_488801 ) ) ( not ( = ?auto_488788 ?auto_488802 ) ) ( not ( = ?auto_488788 ?auto_488803 ) ) ( not ( = ?auto_488789 ?auto_488790 ) ) ( not ( = ?auto_488789 ?auto_488791 ) ) ( not ( = ?auto_488789 ?auto_488792 ) ) ( not ( = ?auto_488789 ?auto_488793 ) ) ( not ( = ?auto_488789 ?auto_488794 ) ) ( not ( = ?auto_488789 ?auto_488795 ) ) ( not ( = ?auto_488789 ?auto_488796 ) ) ( not ( = ?auto_488789 ?auto_488797 ) ) ( not ( = ?auto_488789 ?auto_488798 ) ) ( not ( = ?auto_488789 ?auto_488799 ) ) ( not ( = ?auto_488789 ?auto_488800 ) ) ( not ( = ?auto_488789 ?auto_488801 ) ) ( not ( = ?auto_488789 ?auto_488802 ) ) ( not ( = ?auto_488789 ?auto_488803 ) ) ( not ( = ?auto_488790 ?auto_488791 ) ) ( not ( = ?auto_488790 ?auto_488792 ) ) ( not ( = ?auto_488790 ?auto_488793 ) ) ( not ( = ?auto_488790 ?auto_488794 ) ) ( not ( = ?auto_488790 ?auto_488795 ) ) ( not ( = ?auto_488790 ?auto_488796 ) ) ( not ( = ?auto_488790 ?auto_488797 ) ) ( not ( = ?auto_488790 ?auto_488798 ) ) ( not ( = ?auto_488790 ?auto_488799 ) ) ( not ( = ?auto_488790 ?auto_488800 ) ) ( not ( = ?auto_488790 ?auto_488801 ) ) ( not ( = ?auto_488790 ?auto_488802 ) ) ( not ( = ?auto_488790 ?auto_488803 ) ) ( not ( = ?auto_488791 ?auto_488792 ) ) ( not ( = ?auto_488791 ?auto_488793 ) ) ( not ( = ?auto_488791 ?auto_488794 ) ) ( not ( = ?auto_488791 ?auto_488795 ) ) ( not ( = ?auto_488791 ?auto_488796 ) ) ( not ( = ?auto_488791 ?auto_488797 ) ) ( not ( = ?auto_488791 ?auto_488798 ) ) ( not ( = ?auto_488791 ?auto_488799 ) ) ( not ( = ?auto_488791 ?auto_488800 ) ) ( not ( = ?auto_488791 ?auto_488801 ) ) ( not ( = ?auto_488791 ?auto_488802 ) ) ( not ( = ?auto_488791 ?auto_488803 ) ) ( not ( = ?auto_488792 ?auto_488793 ) ) ( not ( = ?auto_488792 ?auto_488794 ) ) ( not ( = ?auto_488792 ?auto_488795 ) ) ( not ( = ?auto_488792 ?auto_488796 ) ) ( not ( = ?auto_488792 ?auto_488797 ) ) ( not ( = ?auto_488792 ?auto_488798 ) ) ( not ( = ?auto_488792 ?auto_488799 ) ) ( not ( = ?auto_488792 ?auto_488800 ) ) ( not ( = ?auto_488792 ?auto_488801 ) ) ( not ( = ?auto_488792 ?auto_488802 ) ) ( not ( = ?auto_488792 ?auto_488803 ) ) ( not ( = ?auto_488793 ?auto_488794 ) ) ( not ( = ?auto_488793 ?auto_488795 ) ) ( not ( = ?auto_488793 ?auto_488796 ) ) ( not ( = ?auto_488793 ?auto_488797 ) ) ( not ( = ?auto_488793 ?auto_488798 ) ) ( not ( = ?auto_488793 ?auto_488799 ) ) ( not ( = ?auto_488793 ?auto_488800 ) ) ( not ( = ?auto_488793 ?auto_488801 ) ) ( not ( = ?auto_488793 ?auto_488802 ) ) ( not ( = ?auto_488793 ?auto_488803 ) ) ( not ( = ?auto_488794 ?auto_488795 ) ) ( not ( = ?auto_488794 ?auto_488796 ) ) ( not ( = ?auto_488794 ?auto_488797 ) ) ( not ( = ?auto_488794 ?auto_488798 ) ) ( not ( = ?auto_488794 ?auto_488799 ) ) ( not ( = ?auto_488794 ?auto_488800 ) ) ( not ( = ?auto_488794 ?auto_488801 ) ) ( not ( = ?auto_488794 ?auto_488802 ) ) ( not ( = ?auto_488794 ?auto_488803 ) ) ( not ( = ?auto_488795 ?auto_488796 ) ) ( not ( = ?auto_488795 ?auto_488797 ) ) ( not ( = ?auto_488795 ?auto_488798 ) ) ( not ( = ?auto_488795 ?auto_488799 ) ) ( not ( = ?auto_488795 ?auto_488800 ) ) ( not ( = ?auto_488795 ?auto_488801 ) ) ( not ( = ?auto_488795 ?auto_488802 ) ) ( not ( = ?auto_488795 ?auto_488803 ) ) ( not ( = ?auto_488796 ?auto_488797 ) ) ( not ( = ?auto_488796 ?auto_488798 ) ) ( not ( = ?auto_488796 ?auto_488799 ) ) ( not ( = ?auto_488796 ?auto_488800 ) ) ( not ( = ?auto_488796 ?auto_488801 ) ) ( not ( = ?auto_488796 ?auto_488802 ) ) ( not ( = ?auto_488796 ?auto_488803 ) ) ( not ( = ?auto_488797 ?auto_488798 ) ) ( not ( = ?auto_488797 ?auto_488799 ) ) ( not ( = ?auto_488797 ?auto_488800 ) ) ( not ( = ?auto_488797 ?auto_488801 ) ) ( not ( = ?auto_488797 ?auto_488802 ) ) ( not ( = ?auto_488797 ?auto_488803 ) ) ( not ( = ?auto_488798 ?auto_488799 ) ) ( not ( = ?auto_488798 ?auto_488800 ) ) ( not ( = ?auto_488798 ?auto_488801 ) ) ( not ( = ?auto_488798 ?auto_488802 ) ) ( not ( = ?auto_488798 ?auto_488803 ) ) ( not ( = ?auto_488799 ?auto_488800 ) ) ( not ( = ?auto_488799 ?auto_488801 ) ) ( not ( = ?auto_488799 ?auto_488802 ) ) ( not ( = ?auto_488799 ?auto_488803 ) ) ( not ( = ?auto_488800 ?auto_488801 ) ) ( not ( = ?auto_488800 ?auto_488802 ) ) ( not ( = ?auto_488800 ?auto_488803 ) ) ( not ( = ?auto_488801 ?auto_488802 ) ) ( not ( = ?auto_488801 ?auto_488803 ) ) ( not ( = ?auto_488802 ?auto_488803 ) ) ( ON ?auto_488801 ?auto_488802 ) ( ON ?auto_488800 ?auto_488801 ) ( ON ?auto_488799 ?auto_488800 ) ( ON ?auto_488798 ?auto_488799 ) ( ON ?auto_488797 ?auto_488798 ) ( ON ?auto_488796 ?auto_488797 ) ( ON ?auto_488795 ?auto_488796 ) ( ON ?auto_488794 ?auto_488795 ) ( ON ?auto_488793 ?auto_488794 ) ( ON ?auto_488792 ?auto_488793 ) ( ON ?auto_488791 ?auto_488792 ) ( CLEAR ?auto_488789 ) ( ON ?auto_488790 ?auto_488791 ) ( CLEAR ?auto_488790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_488788 ?auto_488789 ?auto_488790 )
      ( MAKE-15PILE ?auto_488788 ?auto_488789 ?auto_488790 ?auto_488791 ?auto_488792 ?auto_488793 ?auto_488794 ?auto_488795 ?auto_488796 ?auto_488797 ?auto_488798 ?auto_488799 ?auto_488800 ?auto_488801 ?auto_488802 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488850 - BLOCK
      ?auto_488851 - BLOCK
      ?auto_488852 - BLOCK
      ?auto_488853 - BLOCK
      ?auto_488854 - BLOCK
      ?auto_488855 - BLOCK
      ?auto_488856 - BLOCK
      ?auto_488857 - BLOCK
      ?auto_488858 - BLOCK
      ?auto_488859 - BLOCK
      ?auto_488860 - BLOCK
      ?auto_488861 - BLOCK
      ?auto_488862 - BLOCK
      ?auto_488863 - BLOCK
      ?auto_488864 - BLOCK
    )
    :vars
    (
      ?auto_488865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488864 ?auto_488865 ) ( ON-TABLE ?auto_488850 ) ( not ( = ?auto_488850 ?auto_488851 ) ) ( not ( = ?auto_488850 ?auto_488852 ) ) ( not ( = ?auto_488850 ?auto_488853 ) ) ( not ( = ?auto_488850 ?auto_488854 ) ) ( not ( = ?auto_488850 ?auto_488855 ) ) ( not ( = ?auto_488850 ?auto_488856 ) ) ( not ( = ?auto_488850 ?auto_488857 ) ) ( not ( = ?auto_488850 ?auto_488858 ) ) ( not ( = ?auto_488850 ?auto_488859 ) ) ( not ( = ?auto_488850 ?auto_488860 ) ) ( not ( = ?auto_488850 ?auto_488861 ) ) ( not ( = ?auto_488850 ?auto_488862 ) ) ( not ( = ?auto_488850 ?auto_488863 ) ) ( not ( = ?auto_488850 ?auto_488864 ) ) ( not ( = ?auto_488850 ?auto_488865 ) ) ( not ( = ?auto_488851 ?auto_488852 ) ) ( not ( = ?auto_488851 ?auto_488853 ) ) ( not ( = ?auto_488851 ?auto_488854 ) ) ( not ( = ?auto_488851 ?auto_488855 ) ) ( not ( = ?auto_488851 ?auto_488856 ) ) ( not ( = ?auto_488851 ?auto_488857 ) ) ( not ( = ?auto_488851 ?auto_488858 ) ) ( not ( = ?auto_488851 ?auto_488859 ) ) ( not ( = ?auto_488851 ?auto_488860 ) ) ( not ( = ?auto_488851 ?auto_488861 ) ) ( not ( = ?auto_488851 ?auto_488862 ) ) ( not ( = ?auto_488851 ?auto_488863 ) ) ( not ( = ?auto_488851 ?auto_488864 ) ) ( not ( = ?auto_488851 ?auto_488865 ) ) ( not ( = ?auto_488852 ?auto_488853 ) ) ( not ( = ?auto_488852 ?auto_488854 ) ) ( not ( = ?auto_488852 ?auto_488855 ) ) ( not ( = ?auto_488852 ?auto_488856 ) ) ( not ( = ?auto_488852 ?auto_488857 ) ) ( not ( = ?auto_488852 ?auto_488858 ) ) ( not ( = ?auto_488852 ?auto_488859 ) ) ( not ( = ?auto_488852 ?auto_488860 ) ) ( not ( = ?auto_488852 ?auto_488861 ) ) ( not ( = ?auto_488852 ?auto_488862 ) ) ( not ( = ?auto_488852 ?auto_488863 ) ) ( not ( = ?auto_488852 ?auto_488864 ) ) ( not ( = ?auto_488852 ?auto_488865 ) ) ( not ( = ?auto_488853 ?auto_488854 ) ) ( not ( = ?auto_488853 ?auto_488855 ) ) ( not ( = ?auto_488853 ?auto_488856 ) ) ( not ( = ?auto_488853 ?auto_488857 ) ) ( not ( = ?auto_488853 ?auto_488858 ) ) ( not ( = ?auto_488853 ?auto_488859 ) ) ( not ( = ?auto_488853 ?auto_488860 ) ) ( not ( = ?auto_488853 ?auto_488861 ) ) ( not ( = ?auto_488853 ?auto_488862 ) ) ( not ( = ?auto_488853 ?auto_488863 ) ) ( not ( = ?auto_488853 ?auto_488864 ) ) ( not ( = ?auto_488853 ?auto_488865 ) ) ( not ( = ?auto_488854 ?auto_488855 ) ) ( not ( = ?auto_488854 ?auto_488856 ) ) ( not ( = ?auto_488854 ?auto_488857 ) ) ( not ( = ?auto_488854 ?auto_488858 ) ) ( not ( = ?auto_488854 ?auto_488859 ) ) ( not ( = ?auto_488854 ?auto_488860 ) ) ( not ( = ?auto_488854 ?auto_488861 ) ) ( not ( = ?auto_488854 ?auto_488862 ) ) ( not ( = ?auto_488854 ?auto_488863 ) ) ( not ( = ?auto_488854 ?auto_488864 ) ) ( not ( = ?auto_488854 ?auto_488865 ) ) ( not ( = ?auto_488855 ?auto_488856 ) ) ( not ( = ?auto_488855 ?auto_488857 ) ) ( not ( = ?auto_488855 ?auto_488858 ) ) ( not ( = ?auto_488855 ?auto_488859 ) ) ( not ( = ?auto_488855 ?auto_488860 ) ) ( not ( = ?auto_488855 ?auto_488861 ) ) ( not ( = ?auto_488855 ?auto_488862 ) ) ( not ( = ?auto_488855 ?auto_488863 ) ) ( not ( = ?auto_488855 ?auto_488864 ) ) ( not ( = ?auto_488855 ?auto_488865 ) ) ( not ( = ?auto_488856 ?auto_488857 ) ) ( not ( = ?auto_488856 ?auto_488858 ) ) ( not ( = ?auto_488856 ?auto_488859 ) ) ( not ( = ?auto_488856 ?auto_488860 ) ) ( not ( = ?auto_488856 ?auto_488861 ) ) ( not ( = ?auto_488856 ?auto_488862 ) ) ( not ( = ?auto_488856 ?auto_488863 ) ) ( not ( = ?auto_488856 ?auto_488864 ) ) ( not ( = ?auto_488856 ?auto_488865 ) ) ( not ( = ?auto_488857 ?auto_488858 ) ) ( not ( = ?auto_488857 ?auto_488859 ) ) ( not ( = ?auto_488857 ?auto_488860 ) ) ( not ( = ?auto_488857 ?auto_488861 ) ) ( not ( = ?auto_488857 ?auto_488862 ) ) ( not ( = ?auto_488857 ?auto_488863 ) ) ( not ( = ?auto_488857 ?auto_488864 ) ) ( not ( = ?auto_488857 ?auto_488865 ) ) ( not ( = ?auto_488858 ?auto_488859 ) ) ( not ( = ?auto_488858 ?auto_488860 ) ) ( not ( = ?auto_488858 ?auto_488861 ) ) ( not ( = ?auto_488858 ?auto_488862 ) ) ( not ( = ?auto_488858 ?auto_488863 ) ) ( not ( = ?auto_488858 ?auto_488864 ) ) ( not ( = ?auto_488858 ?auto_488865 ) ) ( not ( = ?auto_488859 ?auto_488860 ) ) ( not ( = ?auto_488859 ?auto_488861 ) ) ( not ( = ?auto_488859 ?auto_488862 ) ) ( not ( = ?auto_488859 ?auto_488863 ) ) ( not ( = ?auto_488859 ?auto_488864 ) ) ( not ( = ?auto_488859 ?auto_488865 ) ) ( not ( = ?auto_488860 ?auto_488861 ) ) ( not ( = ?auto_488860 ?auto_488862 ) ) ( not ( = ?auto_488860 ?auto_488863 ) ) ( not ( = ?auto_488860 ?auto_488864 ) ) ( not ( = ?auto_488860 ?auto_488865 ) ) ( not ( = ?auto_488861 ?auto_488862 ) ) ( not ( = ?auto_488861 ?auto_488863 ) ) ( not ( = ?auto_488861 ?auto_488864 ) ) ( not ( = ?auto_488861 ?auto_488865 ) ) ( not ( = ?auto_488862 ?auto_488863 ) ) ( not ( = ?auto_488862 ?auto_488864 ) ) ( not ( = ?auto_488862 ?auto_488865 ) ) ( not ( = ?auto_488863 ?auto_488864 ) ) ( not ( = ?auto_488863 ?auto_488865 ) ) ( not ( = ?auto_488864 ?auto_488865 ) ) ( ON ?auto_488863 ?auto_488864 ) ( ON ?auto_488862 ?auto_488863 ) ( ON ?auto_488861 ?auto_488862 ) ( ON ?auto_488860 ?auto_488861 ) ( ON ?auto_488859 ?auto_488860 ) ( ON ?auto_488858 ?auto_488859 ) ( ON ?auto_488857 ?auto_488858 ) ( ON ?auto_488856 ?auto_488857 ) ( ON ?auto_488855 ?auto_488856 ) ( ON ?auto_488854 ?auto_488855 ) ( ON ?auto_488853 ?auto_488854 ) ( ON ?auto_488852 ?auto_488853 ) ( CLEAR ?auto_488850 ) ( ON ?auto_488851 ?auto_488852 ) ( CLEAR ?auto_488851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_488850 ?auto_488851 )
      ( MAKE-15PILE ?auto_488850 ?auto_488851 ?auto_488852 ?auto_488853 ?auto_488854 ?auto_488855 ?auto_488856 ?auto_488857 ?auto_488858 ?auto_488859 ?auto_488860 ?auto_488861 ?auto_488862 ?auto_488863 ?auto_488864 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_488912 - BLOCK
      ?auto_488913 - BLOCK
      ?auto_488914 - BLOCK
      ?auto_488915 - BLOCK
      ?auto_488916 - BLOCK
      ?auto_488917 - BLOCK
      ?auto_488918 - BLOCK
      ?auto_488919 - BLOCK
      ?auto_488920 - BLOCK
      ?auto_488921 - BLOCK
      ?auto_488922 - BLOCK
      ?auto_488923 - BLOCK
      ?auto_488924 - BLOCK
      ?auto_488925 - BLOCK
      ?auto_488926 - BLOCK
    )
    :vars
    (
      ?auto_488927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_488926 ?auto_488927 ) ( not ( = ?auto_488912 ?auto_488913 ) ) ( not ( = ?auto_488912 ?auto_488914 ) ) ( not ( = ?auto_488912 ?auto_488915 ) ) ( not ( = ?auto_488912 ?auto_488916 ) ) ( not ( = ?auto_488912 ?auto_488917 ) ) ( not ( = ?auto_488912 ?auto_488918 ) ) ( not ( = ?auto_488912 ?auto_488919 ) ) ( not ( = ?auto_488912 ?auto_488920 ) ) ( not ( = ?auto_488912 ?auto_488921 ) ) ( not ( = ?auto_488912 ?auto_488922 ) ) ( not ( = ?auto_488912 ?auto_488923 ) ) ( not ( = ?auto_488912 ?auto_488924 ) ) ( not ( = ?auto_488912 ?auto_488925 ) ) ( not ( = ?auto_488912 ?auto_488926 ) ) ( not ( = ?auto_488912 ?auto_488927 ) ) ( not ( = ?auto_488913 ?auto_488914 ) ) ( not ( = ?auto_488913 ?auto_488915 ) ) ( not ( = ?auto_488913 ?auto_488916 ) ) ( not ( = ?auto_488913 ?auto_488917 ) ) ( not ( = ?auto_488913 ?auto_488918 ) ) ( not ( = ?auto_488913 ?auto_488919 ) ) ( not ( = ?auto_488913 ?auto_488920 ) ) ( not ( = ?auto_488913 ?auto_488921 ) ) ( not ( = ?auto_488913 ?auto_488922 ) ) ( not ( = ?auto_488913 ?auto_488923 ) ) ( not ( = ?auto_488913 ?auto_488924 ) ) ( not ( = ?auto_488913 ?auto_488925 ) ) ( not ( = ?auto_488913 ?auto_488926 ) ) ( not ( = ?auto_488913 ?auto_488927 ) ) ( not ( = ?auto_488914 ?auto_488915 ) ) ( not ( = ?auto_488914 ?auto_488916 ) ) ( not ( = ?auto_488914 ?auto_488917 ) ) ( not ( = ?auto_488914 ?auto_488918 ) ) ( not ( = ?auto_488914 ?auto_488919 ) ) ( not ( = ?auto_488914 ?auto_488920 ) ) ( not ( = ?auto_488914 ?auto_488921 ) ) ( not ( = ?auto_488914 ?auto_488922 ) ) ( not ( = ?auto_488914 ?auto_488923 ) ) ( not ( = ?auto_488914 ?auto_488924 ) ) ( not ( = ?auto_488914 ?auto_488925 ) ) ( not ( = ?auto_488914 ?auto_488926 ) ) ( not ( = ?auto_488914 ?auto_488927 ) ) ( not ( = ?auto_488915 ?auto_488916 ) ) ( not ( = ?auto_488915 ?auto_488917 ) ) ( not ( = ?auto_488915 ?auto_488918 ) ) ( not ( = ?auto_488915 ?auto_488919 ) ) ( not ( = ?auto_488915 ?auto_488920 ) ) ( not ( = ?auto_488915 ?auto_488921 ) ) ( not ( = ?auto_488915 ?auto_488922 ) ) ( not ( = ?auto_488915 ?auto_488923 ) ) ( not ( = ?auto_488915 ?auto_488924 ) ) ( not ( = ?auto_488915 ?auto_488925 ) ) ( not ( = ?auto_488915 ?auto_488926 ) ) ( not ( = ?auto_488915 ?auto_488927 ) ) ( not ( = ?auto_488916 ?auto_488917 ) ) ( not ( = ?auto_488916 ?auto_488918 ) ) ( not ( = ?auto_488916 ?auto_488919 ) ) ( not ( = ?auto_488916 ?auto_488920 ) ) ( not ( = ?auto_488916 ?auto_488921 ) ) ( not ( = ?auto_488916 ?auto_488922 ) ) ( not ( = ?auto_488916 ?auto_488923 ) ) ( not ( = ?auto_488916 ?auto_488924 ) ) ( not ( = ?auto_488916 ?auto_488925 ) ) ( not ( = ?auto_488916 ?auto_488926 ) ) ( not ( = ?auto_488916 ?auto_488927 ) ) ( not ( = ?auto_488917 ?auto_488918 ) ) ( not ( = ?auto_488917 ?auto_488919 ) ) ( not ( = ?auto_488917 ?auto_488920 ) ) ( not ( = ?auto_488917 ?auto_488921 ) ) ( not ( = ?auto_488917 ?auto_488922 ) ) ( not ( = ?auto_488917 ?auto_488923 ) ) ( not ( = ?auto_488917 ?auto_488924 ) ) ( not ( = ?auto_488917 ?auto_488925 ) ) ( not ( = ?auto_488917 ?auto_488926 ) ) ( not ( = ?auto_488917 ?auto_488927 ) ) ( not ( = ?auto_488918 ?auto_488919 ) ) ( not ( = ?auto_488918 ?auto_488920 ) ) ( not ( = ?auto_488918 ?auto_488921 ) ) ( not ( = ?auto_488918 ?auto_488922 ) ) ( not ( = ?auto_488918 ?auto_488923 ) ) ( not ( = ?auto_488918 ?auto_488924 ) ) ( not ( = ?auto_488918 ?auto_488925 ) ) ( not ( = ?auto_488918 ?auto_488926 ) ) ( not ( = ?auto_488918 ?auto_488927 ) ) ( not ( = ?auto_488919 ?auto_488920 ) ) ( not ( = ?auto_488919 ?auto_488921 ) ) ( not ( = ?auto_488919 ?auto_488922 ) ) ( not ( = ?auto_488919 ?auto_488923 ) ) ( not ( = ?auto_488919 ?auto_488924 ) ) ( not ( = ?auto_488919 ?auto_488925 ) ) ( not ( = ?auto_488919 ?auto_488926 ) ) ( not ( = ?auto_488919 ?auto_488927 ) ) ( not ( = ?auto_488920 ?auto_488921 ) ) ( not ( = ?auto_488920 ?auto_488922 ) ) ( not ( = ?auto_488920 ?auto_488923 ) ) ( not ( = ?auto_488920 ?auto_488924 ) ) ( not ( = ?auto_488920 ?auto_488925 ) ) ( not ( = ?auto_488920 ?auto_488926 ) ) ( not ( = ?auto_488920 ?auto_488927 ) ) ( not ( = ?auto_488921 ?auto_488922 ) ) ( not ( = ?auto_488921 ?auto_488923 ) ) ( not ( = ?auto_488921 ?auto_488924 ) ) ( not ( = ?auto_488921 ?auto_488925 ) ) ( not ( = ?auto_488921 ?auto_488926 ) ) ( not ( = ?auto_488921 ?auto_488927 ) ) ( not ( = ?auto_488922 ?auto_488923 ) ) ( not ( = ?auto_488922 ?auto_488924 ) ) ( not ( = ?auto_488922 ?auto_488925 ) ) ( not ( = ?auto_488922 ?auto_488926 ) ) ( not ( = ?auto_488922 ?auto_488927 ) ) ( not ( = ?auto_488923 ?auto_488924 ) ) ( not ( = ?auto_488923 ?auto_488925 ) ) ( not ( = ?auto_488923 ?auto_488926 ) ) ( not ( = ?auto_488923 ?auto_488927 ) ) ( not ( = ?auto_488924 ?auto_488925 ) ) ( not ( = ?auto_488924 ?auto_488926 ) ) ( not ( = ?auto_488924 ?auto_488927 ) ) ( not ( = ?auto_488925 ?auto_488926 ) ) ( not ( = ?auto_488925 ?auto_488927 ) ) ( not ( = ?auto_488926 ?auto_488927 ) ) ( ON ?auto_488925 ?auto_488926 ) ( ON ?auto_488924 ?auto_488925 ) ( ON ?auto_488923 ?auto_488924 ) ( ON ?auto_488922 ?auto_488923 ) ( ON ?auto_488921 ?auto_488922 ) ( ON ?auto_488920 ?auto_488921 ) ( ON ?auto_488919 ?auto_488920 ) ( ON ?auto_488918 ?auto_488919 ) ( ON ?auto_488917 ?auto_488918 ) ( ON ?auto_488916 ?auto_488917 ) ( ON ?auto_488915 ?auto_488916 ) ( ON ?auto_488914 ?auto_488915 ) ( ON ?auto_488913 ?auto_488914 ) ( ON ?auto_488912 ?auto_488913 ) ( CLEAR ?auto_488912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_488912 )
      ( MAKE-15PILE ?auto_488912 ?auto_488913 ?auto_488914 ?auto_488915 ?auto_488916 ?auto_488917 ?auto_488918 ?auto_488919 ?auto_488920 ?auto_488921 ?auto_488922 ?auto_488923 ?auto_488924 ?auto_488925 ?auto_488926 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_488975 - BLOCK
      ?auto_488976 - BLOCK
      ?auto_488977 - BLOCK
      ?auto_488978 - BLOCK
      ?auto_488979 - BLOCK
      ?auto_488980 - BLOCK
      ?auto_488981 - BLOCK
      ?auto_488982 - BLOCK
      ?auto_488983 - BLOCK
      ?auto_488984 - BLOCK
      ?auto_488985 - BLOCK
      ?auto_488986 - BLOCK
      ?auto_488987 - BLOCK
      ?auto_488988 - BLOCK
      ?auto_488989 - BLOCK
      ?auto_488990 - BLOCK
    )
    :vars
    (
      ?auto_488991 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_488989 ) ( ON ?auto_488990 ?auto_488991 ) ( CLEAR ?auto_488990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_488975 ) ( ON ?auto_488976 ?auto_488975 ) ( ON ?auto_488977 ?auto_488976 ) ( ON ?auto_488978 ?auto_488977 ) ( ON ?auto_488979 ?auto_488978 ) ( ON ?auto_488980 ?auto_488979 ) ( ON ?auto_488981 ?auto_488980 ) ( ON ?auto_488982 ?auto_488981 ) ( ON ?auto_488983 ?auto_488982 ) ( ON ?auto_488984 ?auto_488983 ) ( ON ?auto_488985 ?auto_488984 ) ( ON ?auto_488986 ?auto_488985 ) ( ON ?auto_488987 ?auto_488986 ) ( ON ?auto_488988 ?auto_488987 ) ( ON ?auto_488989 ?auto_488988 ) ( not ( = ?auto_488975 ?auto_488976 ) ) ( not ( = ?auto_488975 ?auto_488977 ) ) ( not ( = ?auto_488975 ?auto_488978 ) ) ( not ( = ?auto_488975 ?auto_488979 ) ) ( not ( = ?auto_488975 ?auto_488980 ) ) ( not ( = ?auto_488975 ?auto_488981 ) ) ( not ( = ?auto_488975 ?auto_488982 ) ) ( not ( = ?auto_488975 ?auto_488983 ) ) ( not ( = ?auto_488975 ?auto_488984 ) ) ( not ( = ?auto_488975 ?auto_488985 ) ) ( not ( = ?auto_488975 ?auto_488986 ) ) ( not ( = ?auto_488975 ?auto_488987 ) ) ( not ( = ?auto_488975 ?auto_488988 ) ) ( not ( = ?auto_488975 ?auto_488989 ) ) ( not ( = ?auto_488975 ?auto_488990 ) ) ( not ( = ?auto_488975 ?auto_488991 ) ) ( not ( = ?auto_488976 ?auto_488977 ) ) ( not ( = ?auto_488976 ?auto_488978 ) ) ( not ( = ?auto_488976 ?auto_488979 ) ) ( not ( = ?auto_488976 ?auto_488980 ) ) ( not ( = ?auto_488976 ?auto_488981 ) ) ( not ( = ?auto_488976 ?auto_488982 ) ) ( not ( = ?auto_488976 ?auto_488983 ) ) ( not ( = ?auto_488976 ?auto_488984 ) ) ( not ( = ?auto_488976 ?auto_488985 ) ) ( not ( = ?auto_488976 ?auto_488986 ) ) ( not ( = ?auto_488976 ?auto_488987 ) ) ( not ( = ?auto_488976 ?auto_488988 ) ) ( not ( = ?auto_488976 ?auto_488989 ) ) ( not ( = ?auto_488976 ?auto_488990 ) ) ( not ( = ?auto_488976 ?auto_488991 ) ) ( not ( = ?auto_488977 ?auto_488978 ) ) ( not ( = ?auto_488977 ?auto_488979 ) ) ( not ( = ?auto_488977 ?auto_488980 ) ) ( not ( = ?auto_488977 ?auto_488981 ) ) ( not ( = ?auto_488977 ?auto_488982 ) ) ( not ( = ?auto_488977 ?auto_488983 ) ) ( not ( = ?auto_488977 ?auto_488984 ) ) ( not ( = ?auto_488977 ?auto_488985 ) ) ( not ( = ?auto_488977 ?auto_488986 ) ) ( not ( = ?auto_488977 ?auto_488987 ) ) ( not ( = ?auto_488977 ?auto_488988 ) ) ( not ( = ?auto_488977 ?auto_488989 ) ) ( not ( = ?auto_488977 ?auto_488990 ) ) ( not ( = ?auto_488977 ?auto_488991 ) ) ( not ( = ?auto_488978 ?auto_488979 ) ) ( not ( = ?auto_488978 ?auto_488980 ) ) ( not ( = ?auto_488978 ?auto_488981 ) ) ( not ( = ?auto_488978 ?auto_488982 ) ) ( not ( = ?auto_488978 ?auto_488983 ) ) ( not ( = ?auto_488978 ?auto_488984 ) ) ( not ( = ?auto_488978 ?auto_488985 ) ) ( not ( = ?auto_488978 ?auto_488986 ) ) ( not ( = ?auto_488978 ?auto_488987 ) ) ( not ( = ?auto_488978 ?auto_488988 ) ) ( not ( = ?auto_488978 ?auto_488989 ) ) ( not ( = ?auto_488978 ?auto_488990 ) ) ( not ( = ?auto_488978 ?auto_488991 ) ) ( not ( = ?auto_488979 ?auto_488980 ) ) ( not ( = ?auto_488979 ?auto_488981 ) ) ( not ( = ?auto_488979 ?auto_488982 ) ) ( not ( = ?auto_488979 ?auto_488983 ) ) ( not ( = ?auto_488979 ?auto_488984 ) ) ( not ( = ?auto_488979 ?auto_488985 ) ) ( not ( = ?auto_488979 ?auto_488986 ) ) ( not ( = ?auto_488979 ?auto_488987 ) ) ( not ( = ?auto_488979 ?auto_488988 ) ) ( not ( = ?auto_488979 ?auto_488989 ) ) ( not ( = ?auto_488979 ?auto_488990 ) ) ( not ( = ?auto_488979 ?auto_488991 ) ) ( not ( = ?auto_488980 ?auto_488981 ) ) ( not ( = ?auto_488980 ?auto_488982 ) ) ( not ( = ?auto_488980 ?auto_488983 ) ) ( not ( = ?auto_488980 ?auto_488984 ) ) ( not ( = ?auto_488980 ?auto_488985 ) ) ( not ( = ?auto_488980 ?auto_488986 ) ) ( not ( = ?auto_488980 ?auto_488987 ) ) ( not ( = ?auto_488980 ?auto_488988 ) ) ( not ( = ?auto_488980 ?auto_488989 ) ) ( not ( = ?auto_488980 ?auto_488990 ) ) ( not ( = ?auto_488980 ?auto_488991 ) ) ( not ( = ?auto_488981 ?auto_488982 ) ) ( not ( = ?auto_488981 ?auto_488983 ) ) ( not ( = ?auto_488981 ?auto_488984 ) ) ( not ( = ?auto_488981 ?auto_488985 ) ) ( not ( = ?auto_488981 ?auto_488986 ) ) ( not ( = ?auto_488981 ?auto_488987 ) ) ( not ( = ?auto_488981 ?auto_488988 ) ) ( not ( = ?auto_488981 ?auto_488989 ) ) ( not ( = ?auto_488981 ?auto_488990 ) ) ( not ( = ?auto_488981 ?auto_488991 ) ) ( not ( = ?auto_488982 ?auto_488983 ) ) ( not ( = ?auto_488982 ?auto_488984 ) ) ( not ( = ?auto_488982 ?auto_488985 ) ) ( not ( = ?auto_488982 ?auto_488986 ) ) ( not ( = ?auto_488982 ?auto_488987 ) ) ( not ( = ?auto_488982 ?auto_488988 ) ) ( not ( = ?auto_488982 ?auto_488989 ) ) ( not ( = ?auto_488982 ?auto_488990 ) ) ( not ( = ?auto_488982 ?auto_488991 ) ) ( not ( = ?auto_488983 ?auto_488984 ) ) ( not ( = ?auto_488983 ?auto_488985 ) ) ( not ( = ?auto_488983 ?auto_488986 ) ) ( not ( = ?auto_488983 ?auto_488987 ) ) ( not ( = ?auto_488983 ?auto_488988 ) ) ( not ( = ?auto_488983 ?auto_488989 ) ) ( not ( = ?auto_488983 ?auto_488990 ) ) ( not ( = ?auto_488983 ?auto_488991 ) ) ( not ( = ?auto_488984 ?auto_488985 ) ) ( not ( = ?auto_488984 ?auto_488986 ) ) ( not ( = ?auto_488984 ?auto_488987 ) ) ( not ( = ?auto_488984 ?auto_488988 ) ) ( not ( = ?auto_488984 ?auto_488989 ) ) ( not ( = ?auto_488984 ?auto_488990 ) ) ( not ( = ?auto_488984 ?auto_488991 ) ) ( not ( = ?auto_488985 ?auto_488986 ) ) ( not ( = ?auto_488985 ?auto_488987 ) ) ( not ( = ?auto_488985 ?auto_488988 ) ) ( not ( = ?auto_488985 ?auto_488989 ) ) ( not ( = ?auto_488985 ?auto_488990 ) ) ( not ( = ?auto_488985 ?auto_488991 ) ) ( not ( = ?auto_488986 ?auto_488987 ) ) ( not ( = ?auto_488986 ?auto_488988 ) ) ( not ( = ?auto_488986 ?auto_488989 ) ) ( not ( = ?auto_488986 ?auto_488990 ) ) ( not ( = ?auto_488986 ?auto_488991 ) ) ( not ( = ?auto_488987 ?auto_488988 ) ) ( not ( = ?auto_488987 ?auto_488989 ) ) ( not ( = ?auto_488987 ?auto_488990 ) ) ( not ( = ?auto_488987 ?auto_488991 ) ) ( not ( = ?auto_488988 ?auto_488989 ) ) ( not ( = ?auto_488988 ?auto_488990 ) ) ( not ( = ?auto_488988 ?auto_488991 ) ) ( not ( = ?auto_488989 ?auto_488990 ) ) ( not ( = ?auto_488989 ?auto_488991 ) ) ( not ( = ?auto_488990 ?auto_488991 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_488990 ?auto_488991 )
      ( !STACK ?auto_488990 ?auto_488989 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489008 - BLOCK
      ?auto_489009 - BLOCK
      ?auto_489010 - BLOCK
      ?auto_489011 - BLOCK
      ?auto_489012 - BLOCK
      ?auto_489013 - BLOCK
      ?auto_489014 - BLOCK
      ?auto_489015 - BLOCK
      ?auto_489016 - BLOCK
      ?auto_489017 - BLOCK
      ?auto_489018 - BLOCK
      ?auto_489019 - BLOCK
      ?auto_489020 - BLOCK
      ?auto_489021 - BLOCK
      ?auto_489022 - BLOCK
      ?auto_489023 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_489022 ) ( ON-TABLE ?auto_489023 ) ( CLEAR ?auto_489023 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_489008 ) ( ON ?auto_489009 ?auto_489008 ) ( ON ?auto_489010 ?auto_489009 ) ( ON ?auto_489011 ?auto_489010 ) ( ON ?auto_489012 ?auto_489011 ) ( ON ?auto_489013 ?auto_489012 ) ( ON ?auto_489014 ?auto_489013 ) ( ON ?auto_489015 ?auto_489014 ) ( ON ?auto_489016 ?auto_489015 ) ( ON ?auto_489017 ?auto_489016 ) ( ON ?auto_489018 ?auto_489017 ) ( ON ?auto_489019 ?auto_489018 ) ( ON ?auto_489020 ?auto_489019 ) ( ON ?auto_489021 ?auto_489020 ) ( ON ?auto_489022 ?auto_489021 ) ( not ( = ?auto_489008 ?auto_489009 ) ) ( not ( = ?auto_489008 ?auto_489010 ) ) ( not ( = ?auto_489008 ?auto_489011 ) ) ( not ( = ?auto_489008 ?auto_489012 ) ) ( not ( = ?auto_489008 ?auto_489013 ) ) ( not ( = ?auto_489008 ?auto_489014 ) ) ( not ( = ?auto_489008 ?auto_489015 ) ) ( not ( = ?auto_489008 ?auto_489016 ) ) ( not ( = ?auto_489008 ?auto_489017 ) ) ( not ( = ?auto_489008 ?auto_489018 ) ) ( not ( = ?auto_489008 ?auto_489019 ) ) ( not ( = ?auto_489008 ?auto_489020 ) ) ( not ( = ?auto_489008 ?auto_489021 ) ) ( not ( = ?auto_489008 ?auto_489022 ) ) ( not ( = ?auto_489008 ?auto_489023 ) ) ( not ( = ?auto_489009 ?auto_489010 ) ) ( not ( = ?auto_489009 ?auto_489011 ) ) ( not ( = ?auto_489009 ?auto_489012 ) ) ( not ( = ?auto_489009 ?auto_489013 ) ) ( not ( = ?auto_489009 ?auto_489014 ) ) ( not ( = ?auto_489009 ?auto_489015 ) ) ( not ( = ?auto_489009 ?auto_489016 ) ) ( not ( = ?auto_489009 ?auto_489017 ) ) ( not ( = ?auto_489009 ?auto_489018 ) ) ( not ( = ?auto_489009 ?auto_489019 ) ) ( not ( = ?auto_489009 ?auto_489020 ) ) ( not ( = ?auto_489009 ?auto_489021 ) ) ( not ( = ?auto_489009 ?auto_489022 ) ) ( not ( = ?auto_489009 ?auto_489023 ) ) ( not ( = ?auto_489010 ?auto_489011 ) ) ( not ( = ?auto_489010 ?auto_489012 ) ) ( not ( = ?auto_489010 ?auto_489013 ) ) ( not ( = ?auto_489010 ?auto_489014 ) ) ( not ( = ?auto_489010 ?auto_489015 ) ) ( not ( = ?auto_489010 ?auto_489016 ) ) ( not ( = ?auto_489010 ?auto_489017 ) ) ( not ( = ?auto_489010 ?auto_489018 ) ) ( not ( = ?auto_489010 ?auto_489019 ) ) ( not ( = ?auto_489010 ?auto_489020 ) ) ( not ( = ?auto_489010 ?auto_489021 ) ) ( not ( = ?auto_489010 ?auto_489022 ) ) ( not ( = ?auto_489010 ?auto_489023 ) ) ( not ( = ?auto_489011 ?auto_489012 ) ) ( not ( = ?auto_489011 ?auto_489013 ) ) ( not ( = ?auto_489011 ?auto_489014 ) ) ( not ( = ?auto_489011 ?auto_489015 ) ) ( not ( = ?auto_489011 ?auto_489016 ) ) ( not ( = ?auto_489011 ?auto_489017 ) ) ( not ( = ?auto_489011 ?auto_489018 ) ) ( not ( = ?auto_489011 ?auto_489019 ) ) ( not ( = ?auto_489011 ?auto_489020 ) ) ( not ( = ?auto_489011 ?auto_489021 ) ) ( not ( = ?auto_489011 ?auto_489022 ) ) ( not ( = ?auto_489011 ?auto_489023 ) ) ( not ( = ?auto_489012 ?auto_489013 ) ) ( not ( = ?auto_489012 ?auto_489014 ) ) ( not ( = ?auto_489012 ?auto_489015 ) ) ( not ( = ?auto_489012 ?auto_489016 ) ) ( not ( = ?auto_489012 ?auto_489017 ) ) ( not ( = ?auto_489012 ?auto_489018 ) ) ( not ( = ?auto_489012 ?auto_489019 ) ) ( not ( = ?auto_489012 ?auto_489020 ) ) ( not ( = ?auto_489012 ?auto_489021 ) ) ( not ( = ?auto_489012 ?auto_489022 ) ) ( not ( = ?auto_489012 ?auto_489023 ) ) ( not ( = ?auto_489013 ?auto_489014 ) ) ( not ( = ?auto_489013 ?auto_489015 ) ) ( not ( = ?auto_489013 ?auto_489016 ) ) ( not ( = ?auto_489013 ?auto_489017 ) ) ( not ( = ?auto_489013 ?auto_489018 ) ) ( not ( = ?auto_489013 ?auto_489019 ) ) ( not ( = ?auto_489013 ?auto_489020 ) ) ( not ( = ?auto_489013 ?auto_489021 ) ) ( not ( = ?auto_489013 ?auto_489022 ) ) ( not ( = ?auto_489013 ?auto_489023 ) ) ( not ( = ?auto_489014 ?auto_489015 ) ) ( not ( = ?auto_489014 ?auto_489016 ) ) ( not ( = ?auto_489014 ?auto_489017 ) ) ( not ( = ?auto_489014 ?auto_489018 ) ) ( not ( = ?auto_489014 ?auto_489019 ) ) ( not ( = ?auto_489014 ?auto_489020 ) ) ( not ( = ?auto_489014 ?auto_489021 ) ) ( not ( = ?auto_489014 ?auto_489022 ) ) ( not ( = ?auto_489014 ?auto_489023 ) ) ( not ( = ?auto_489015 ?auto_489016 ) ) ( not ( = ?auto_489015 ?auto_489017 ) ) ( not ( = ?auto_489015 ?auto_489018 ) ) ( not ( = ?auto_489015 ?auto_489019 ) ) ( not ( = ?auto_489015 ?auto_489020 ) ) ( not ( = ?auto_489015 ?auto_489021 ) ) ( not ( = ?auto_489015 ?auto_489022 ) ) ( not ( = ?auto_489015 ?auto_489023 ) ) ( not ( = ?auto_489016 ?auto_489017 ) ) ( not ( = ?auto_489016 ?auto_489018 ) ) ( not ( = ?auto_489016 ?auto_489019 ) ) ( not ( = ?auto_489016 ?auto_489020 ) ) ( not ( = ?auto_489016 ?auto_489021 ) ) ( not ( = ?auto_489016 ?auto_489022 ) ) ( not ( = ?auto_489016 ?auto_489023 ) ) ( not ( = ?auto_489017 ?auto_489018 ) ) ( not ( = ?auto_489017 ?auto_489019 ) ) ( not ( = ?auto_489017 ?auto_489020 ) ) ( not ( = ?auto_489017 ?auto_489021 ) ) ( not ( = ?auto_489017 ?auto_489022 ) ) ( not ( = ?auto_489017 ?auto_489023 ) ) ( not ( = ?auto_489018 ?auto_489019 ) ) ( not ( = ?auto_489018 ?auto_489020 ) ) ( not ( = ?auto_489018 ?auto_489021 ) ) ( not ( = ?auto_489018 ?auto_489022 ) ) ( not ( = ?auto_489018 ?auto_489023 ) ) ( not ( = ?auto_489019 ?auto_489020 ) ) ( not ( = ?auto_489019 ?auto_489021 ) ) ( not ( = ?auto_489019 ?auto_489022 ) ) ( not ( = ?auto_489019 ?auto_489023 ) ) ( not ( = ?auto_489020 ?auto_489021 ) ) ( not ( = ?auto_489020 ?auto_489022 ) ) ( not ( = ?auto_489020 ?auto_489023 ) ) ( not ( = ?auto_489021 ?auto_489022 ) ) ( not ( = ?auto_489021 ?auto_489023 ) ) ( not ( = ?auto_489022 ?auto_489023 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_489023 )
      ( !STACK ?auto_489023 ?auto_489022 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489040 - BLOCK
      ?auto_489041 - BLOCK
      ?auto_489042 - BLOCK
      ?auto_489043 - BLOCK
      ?auto_489044 - BLOCK
      ?auto_489045 - BLOCK
      ?auto_489046 - BLOCK
      ?auto_489047 - BLOCK
      ?auto_489048 - BLOCK
      ?auto_489049 - BLOCK
      ?auto_489050 - BLOCK
      ?auto_489051 - BLOCK
      ?auto_489052 - BLOCK
      ?auto_489053 - BLOCK
      ?auto_489054 - BLOCK
      ?auto_489055 - BLOCK
    )
    :vars
    (
      ?auto_489056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489055 ?auto_489056 ) ( ON-TABLE ?auto_489040 ) ( ON ?auto_489041 ?auto_489040 ) ( ON ?auto_489042 ?auto_489041 ) ( ON ?auto_489043 ?auto_489042 ) ( ON ?auto_489044 ?auto_489043 ) ( ON ?auto_489045 ?auto_489044 ) ( ON ?auto_489046 ?auto_489045 ) ( ON ?auto_489047 ?auto_489046 ) ( ON ?auto_489048 ?auto_489047 ) ( ON ?auto_489049 ?auto_489048 ) ( ON ?auto_489050 ?auto_489049 ) ( ON ?auto_489051 ?auto_489050 ) ( ON ?auto_489052 ?auto_489051 ) ( ON ?auto_489053 ?auto_489052 ) ( not ( = ?auto_489040 ?auto_489041 ) ) ( not ( = ?auto_489040 ?auto_489042 ) ) ( not ( = ?auto_489040 ?auto_489043 ) ) ( not ( = ?auto_489040 ?auto_489044 ) ) ( not ( = ?auto_489040 ?auto_489045 ) ) ( not ( = ?auto_489040 ?auto_489046 ) ) ( not ( = ?auto_489040 ?auto_489047 ) ) ( not ( = ?auto_489040 ?auto_489048 ) ) ( not ( = ?auto_489040 ?auto_489049 ) ) ( not ( = ?auto_489040 ?auto_489050 ) ) ( not ( = ?auto_489040 ?auto_489051 ) ) ( not ( = ?auto_489040 ?auto_489052 ) ) ( not ( = ?auto_489040 ?auto_489053 ) ) ( not ( = ?auto_489040 ?auto_489054 ) ) ( not ( = ?auto_489040 ?auto_489055 ) ) ( not ( = ?auto_489040 ?auto_489056 ) ) ( not ( = ?auto_489041 ?auto_489042 ) ) ( not ( = ?auto_489041 ?auto_489043 ) ) ( not ( = ?auto_489041 ?auto_489044 ) ) ( not ( = ?auto_489041 ?auto_489045 ) ) ( not ( = ?auto_489041 ?auto_489046 ) ) ( not ( = ?auto_489041 ?auto_489047 ) ) ( not ( = ?auto_489041 ?auto_489048 ) ) ( not ( = ?auto_489041 ?auto_489049 ) ) ( not ( = ?auto_489041 ?auto_489050 ) ) ( not ( = ?auto_489041 ?auto_489051 ) ) ( not ( = ?auto_489041 ?auto_489052 ) ) ( not ( = ?auto_489041 ?auto_489053 ) ) ( not ( = ?auto_489041 ?auto_489054 ) ) ( not ( = ?auto_489041 ?auto_489055 ) ) ( not ( = ?auto_489041 ?auto_489056 ) ) ( not ( = ?auto_489042 ?auto_489043 ) ) ( not ( = ?auto_489042 ?auto_489044 ) ) ( not ( = ?auto_489042 ?auto_489045 ) ) ( not ( = ?auto_489042 ?auto_489046 ) ) ( not ( = ?auto_489042 ?auto_489047 ) ) ( not ( = ?auto_489042 ?auto_489048 ) ) ( not ( = ?auto_489042 ?auto_489049 ) ) ( not ( = ?auto_489042 ?auto_489050 ) ) ( not ( = ?auto_489042 ?auto_489051 ) ) ( not ( = ?auto_489042 ?auto_489052 ) ) ( not ( = ?auto_489042 ?auto_489053 ) ) ( not ( = ?auto_489042 ?auto_489054 ) ) ( not ( = ?auto_489042 ?auto_489055 ) ) ( not ( = ?auto_489042 ?auto_489056 ) ) ( not ( = ?auto_489043 ?auto_489044 ) ) ( not ( = ?auto_489043 ?auto_489045 ) ) ( not ( = ?auto_489043 ?auto_489046 ) ) ( not ( = ?auto_489043 ?auto_489047 ) ) ( not ( = ?auto_489043 ?auto_489048 ) ) ( not ( = ?auto_489043 ?auto_489049 ) ) ( not ( = ?auto_489043 ?auto_489050 ) ) ( not ( = ?auto_489043 ?auto_489051 ) ) ( not ( = ?auto_489043 ?auto_489052 ) ) ( not ( = ?auto_489043 ?auto_489053 ) ) ( not ( = ?auto_489043 ?auto_489054 ) ) ( not ( = ?auto_489043 ?auto_489055 ) ) ( not ( = ?auto_489043 ?auto_489056 ) ) ( not ( = ?auto_489044 ?auto_489045 ) ) ( not ( = ?auto_489044 ?auto_489046 ) ) ( not ( = ?auto_489044 ?auto_489047 ) ) ( not ( = ?auto_489044 ?auto_489048 ) ) ( not ( = ?auto_489044 ?auto_489049 ) ) ( not ( = ?auto_489044 ?auto_489050 ) ) ( not ( = ?auto_489044 ?auto_489051 ) ) ( not ( = ?auto_489044 ?auto_489052 ) ) ( not ( = ?auto_489044 ?auto_489053 ) ) ( not ( = ?auto_489044 ?auto_489054 ) ) ( not ( = ?auto_489044 ?auto_489055 ) ) ( not ( = ?auto_489044 ?auto_489056 ) ) ( not ( = ?auto_489045 ?auto_489046 ) ) ( not ( = ?auto_489045 ?auto_489047 ) ) ( not ( = ?auto_489045 ?auto_489048 ) ) ( not ( = ?auto_489045 ?auto_489049 ) ) ( not ( = ?auto_489045 ?auto_489050 ) ) ( not ( = ?auto_489045 ?auto_489051 ) ) ( not ( = ?auto_489045 ?auto_489052 ) ) ( not ( = ?auto_489045 ?auto_489053 ) ) ( not ( = ?auto_489045 ?auto_489054 ) ) ( not ( = ?auto_489045 ?auto_489055 ) ) ( not ( = ?auto_489045 ?auto_489056 ) ) ( not ( = ?auto_489046 ?auto_489047 ) ) ( not ( = ?auto_489046 ?auto_489048 ) ) ( not ( = ?auto_489046 ?auto_489049 ) ) ( not ( = ?auto_489046 ?auto_489050 ) ) ( not ( = ?auto_489046 ?auto_489051 ) ) ( not ( = ?auto_489046 ?auto_489052 ) ) ( not ( = ?auto_489046 ?auto_489053 ) ) ( not ( = ?auto_489046 ?auto_489054 ) ) ( not ( = ?auto_489046 ?auto_489055 ) ) ( not ( = ?auto_489046 ?auto_489056 ) ) ( not ( = ?auto_489047 ?auto_489048 ) ) ( not ( = ?auto_489047 ?auto_489049 ) ) ( not ( = ?auto_489047 ?auto_489050 ) ) ( not ( = ?auto_489047 ?auto_489051 ) ) ( not ( = ?auto_489047 ?auto_489052 ) ) ( not ( = ?auto_489047 ?auto_489053 ) ) ( not ( = ?auto_489047 ?auto_489054 ) ) ( not ( = ?auto_489047 ?auto_489055 ) ) ( not ( = ?auto_489047 ?auto_489056 ) ) ( not ( = ?auto_489048 ?auto_489049 ) ) ( not ( = ?auto_489048 ?auto_489050 ) ) ( not ( = ?auto_489048 ?auto_489051 ) ) ( not ( = ?auto_489048 ?auto_489052 ) ) ( not ( = ?auto_489048 ?auto_489053 ) ) ( not ( = ?auto_489048 ?auto_489054 ) ) ( not ( = ?auto_489048 ?auto_489055 ) ) ( not ( = ?auto_489048 ?auto_489056 ) ) ( not ( = ?auto_489049 ?auto_489050 ) ) ( not ( = ?auto_489049 ?auto_489051 ) ) ( not ( = ?auto_489049 ?auto_489052 ) ) ( not ( = ?auto_489049 ?auto_489053 ) ) ( not ( = ?auto_489049 ?auto_489054 ) ) ( not ( = ?auto_489049 ?auto_489055 ) ) ( not ( = ?auto_489049 ?auto_489056 ) ) ( not ( = ?auto_489050 ?auto_489051 ) ) ( not ( = ?auto_489050 ?auto_489052 ) ) ( not ( = ?auto_489050 ?auto_489053 ) ) ( not ( = ?auto_489050 ?auto_489054 ) ) ( not ( = ?auto_489050 ?auto_489055 ) ) ( not ( = ?auto_489050 ?auto_489056 ) ) ( not ( = ?auto_489051 ?auto_489052 ) ) ( not ( = ?auto_489051 ?auto_489053 ) ) ( not ( = ?auto_489051 ?auto_489054 ) ) ( not ( = ?auto_489051 ?auto_489055 ) ) ( not ( = ?auto_489051 ?auto_489056 ) ) ( not ( = ?auto_489052 ?auto_489053 ) ) ( not ( = ?auto_489052 ?auto_489054 ) ) ( not ( = ?auto_489052 ?auto_489055 ) ) ( not ( = ?auto_489052 ?auto_489056 ) ) ( not ( = ?auto_489053 ?auto_489054 ) ) ( not ( = ?auto_489053 ?auto_489055 ) ) ( not ( = ?auto_489053 ?auto_489056 ) ) ( not ( = ?auto_489054 ?auto_489055 ) ) ( not ( = ?auto_489054 ?auto_489056 ) ) ( not ( = ?auto_489055 ?auto_489056 ) ) ( CLEAR ?auto_489053 ) ( ON ?auto_489054 ?auto_489055 ) ( CLEAR ?auto_489054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_489040 ?auto_489041 ?auto_489042 ?auto_489043 ?auto_489044 ?auto_489045 ?auto_489046 ?auto_489047 ?auto_489048 ?auto_489049 ?auto_489050 ?auto_489051 ?auto_489052 ?auto_489053 ?auto_489054 )
      ( MAKE-16PILE ?auto_489040 ?auto_489041 ?auto_489042 ?auto_489043 ?auto_489044 ?auto_489045 ?auto_489046 ?auto_489047 ?auto_489048 ?auto_489049 ?auto_489050 ?auto_489051 ?auto_489052 ?auto_489053 ?auto_489054 ?auto_489055 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489073 - BLOCK
      ?auto_489074 - BLOCK
      ?auto_489075 - BLOCK
      ?auto_489076 - BLOCK
      ?auto_489077 - BLOCK
      ?auto_489078 - BLOCK
      ?auto_489079 - BLOCK
      ?auto_489080 - BLOCK
      ?auto_489081 - BLOCK
      ?auto_489082 - BLOCK
      ?auto_489083 - BLOCK
      ?auto_489084 - BLOCK
      ?auto_489085 - BLOCK
      ?auto_489086 - BLOCK
      ?auto_489087 - BLOCK
      ?auto_489088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489088 ) ( ON-TABLE ?auto_489073 ) ( ON ?auto_489074 ?auto_489073 ) ( ON ?auto_489075 ?auto_489074 ) ( ON ?auto_489076 ?auto_489075 ) ( ON ?auto_489077 ?auto_489076 ) ( ON ?auto_489078 ?auto_489077 ) ( ON ?auto_489079 ?auto_489078 ) ( ON ?auto_489080 ?auto_489079 ) ( ON ?auto_489081 ?auto_489080 ) ( ON ?auto_489082 ?auto_489081 ) ( ON ?auto_489083 ?auto_489082 ) ( ON ?auto_489084 ?auto_489083 ) ( ON ?auto_489085 ?auto_489084 ) ( ON ?auto_489086 ?auto_489085 ) ( not ( = ?auto_489073 ?auto_489074 ) ) ( not ( = ?auto_489073 ?auto_489075 ) ) ( not ( = ?auto_489073 ?auto_489076 ) ) ( not ( = ?auto_489073 ?auto_489077 ) ) ( not ( = ?auto_489073 ?auto_489078 ) ) ( not ( = ?auto_489073 ?auto_489079 ) ) ( not ( = ?auto_489073 ?auto_489080 ) ) ( not ( = ?auto_489073 ?auto_489081 ) ) ( not ( = ?auto_489073 ?auto_489082 ) ) ( not ( = ?auto_489073 ?auto_489083 ) ) ( not ( = ?auto_489073 ?auto_489084 ) ) ( not ( = ?auto_489073 ?auto_489085 ) ) ( not ( = ?auto_489073 ?auto_489086 ) ) ( not ( = ?auto_489073 ?auto_489087 ) ) ( not ( = ?auto_489073 ?auto_489088 ) ) ( not ( = ?auto_489074 ?auto_489075 ) ) ( not ( = ?auto_489074 ?auto_489076 ) ) ( not ( = ?auto_489074 ?auto_489077 ) ) ( not ( = ?auto_489074 ?auto_489078 ) ) ( not ( = ?auto_489074 ?auto_489079 ) ) ( not ( = ?auto_489074 ?auto_489080 ) ) ( not ( = ?auto_489074 ?auto_489081 ) ) ( not ( = ?auto_489074 ?auto_489082 ) ) ( not ( = ?auto_489074 ?auto_489083 ) ) ( not ( = ?auto_489074 ?auto_489084 ) ) ( not ( = ?auto_489074 ?auto_489085 ) ) ( not ( = ?auto_489074 ?auto_489086 ) ) ( not ( = ?auto_489074 ?auto_489087 ) ) ( not ( = ?auto_489074 ?auto_489088 ) ) ( not ( = ?auto_489075 ?auto_489076 ) ) ( not ( = ?auto_489075 ?auto_489077 ) ) ( not ( = ?auto_489075 ?auto_489078 ) ) ( not ( = ?auto_489075 ?auto_489079 ) ) ( not ( = ?auto_489075 ?auto_489080 ) ) ( not ( = ?auto_489075 ?auto_489081 ) ) ( not ( = ?auto_489075 ?auto_489082 ) ) ( not ( = ?auto_489075 ?auto_489083 ) ) ( not ( = ?auto_489075 ?auto_489084 ) ) ( not ( = ?auto_489075 ?auto_489085 ) ) ( not ( = ?auto_489075 ?auto_489086 ) ) ( not ( = ?auto_489075 ?auto_489087 ) ) ( not ( = ?auto_489075 ?auto_489088 ) ) ( not ( = ?auto_489076 ?auto_489077 ) ) ( not ( = ?auto_489076 ?auto_489078 ) ) ( not ( = ?auto_489076 ?auto_489079 ) ) ( not ( = ?auto_489076 ?auto_489080 ) ) ( not ( = ?auto_489076 ?auto_489081 ) ) ( not ( = ?auto_489076 ?auto_489082 ) ) ( not ( = ?auto_489076 ?auto_489083 ) ) ( not ( = ?auto_489076 ?auto_489084 ) ) ( not ( = ?auto_489076 ?auto_489085 ) ) ( not ( = ?auto_489076 ?auto_489086 ) ) ( not ( = ?auto_489076 ?auto_489087 ) ) ( not ( = ?auto_489076 ?auto_489088 ) ) ( not ( = ?auto_489077 ?auto_489078 ) ) ( not ( = ?auto_489077 ?auto_489079 ) ) ( not ( = ?auto_489077 ?auto_489080 ) ) ( not ( = ?auto_489077 ?auto_489081 ) ) ( not ( = ?auto_489077 ?auto_489082 ) ) ( not ( = ?auto_489077 ?auto_489083 ) ) ( not ( = ?auto_489077 ?auto_489084 ) ) ( not ( = ?auto_489077 ?auto_489085 ) ) ( not ( = ?auto_489077 ?auto_489086 ) ) ( not ( = ?auto_489077 ?auto_489087 ) ) ( not ( = ?auto_489077 ?auto_489088 ) ) ( not ( = ?auto_489078 ?auto_489079 ) ) ( not ( = ?auto_489078 ?auto_489080 ) ) ( not ( = ?auto_489078 ?auto_489081 ) ) ( not ( = ?auto_489078 ?auto_489082 ) ) ( not ( = ?auto_489078 ?auto_489083 ) ) ( not ( = ?auto_489078 ?auto_489084 ) ) ( not ( = ?auto_489078 ?auto_489085 ) ) ( not ( = ?auto_489078 ?auto_489086 ) ) ( not ( = ?auto_489078 ?auto_489087 ) ) ( not ( = ?auto_489078 ?auto_489088 ) ) ( not ( = ?auto_489079 ?auto_489080 ) ) ( not ( = ?auto_489079 ?auto_489081 ) ) ( not ( = ?auto_489079 ?auto_489082 ) ) ( not ( = ?auto_489079 ?auto_489083 ) ) ( not ( = ?auto_489079 ?auto_489084 ) ) ( not ( = ?auto_489079 ?auto_489085 ) ) ( not ( = ?auto_489079 ?auto_489086 ) ) ( not ( = ?auto_489079 ?auto_489087 ) ) ( not ( = ?auto_489079 ?auto_489088 ) ) ( not ( = ?auto_489080 ?auto_489081 ) ) ( not ( = ?auto_489080 ?auto_489082 ) ) ( not ( = ?auto_489080 ?auto_489083 ) ) ( not ( = ?auto_489080 ?auto_489084 ) ) ( not ( = ?auto_489080 ?auto_489085 ) ) ( not ( = ?auto_489080 ?auto_489086 ) ) ( not ( = ?auto_489080 ?auto_489087 ) ) ( not ( = ?auto_489080 ?auto_489088 ) ) ( not ( = ?auto_489081 ?auto_489082 ) ) ( not ( = ?auto_489081 ?auto_489083 ) ) ( not ( = ?auto_489081 ?auto_489084 ) ) ( not ( = ?auto_489081 ?auto_489085 ) ) ( not ( = ?auto_489081 ?auto_489086 ) ) ( not ( = ?auto_489081 ?auto_489087 ) ) ( not ( = ?auto_489081 ?auto_489088 ) ) ( not ( = ?auto_489082 ?auto_489083 ) ) ( not ( = ?auto_489082 ?auto_489084 ) ) ( not ( = ?auto_489082 ?auto_489085 ) ) ( not ( = ?auto_489082 ?auto_489086 ) ) ( not ( = ?auto_489082 ?auto_489087 ) ) ( not ( = ?auto_489082 ?auto_489088 ) ) ( not ( = ?auto_489083 ?auto_489084 ) ) ( not ( = ?auto_489083 ?auto_489085 ) ) ( not ( = ?auto_489083 ?auto_489086 ) ) ( not ( = ?auto_489083 ?auto_489087 ) ) ( not ( = ?auto_489083 ?auto_489088 ) ) ( not ( = ?auto_489084 ?auto_489085 ) ) ( not ( = ?auto_489084 ?auto_489086 ) ) ( not ( = ?auto_489084 ?auto_489087 ) ) ( not ( = ?auto_489084 ?auto_489088 ) ) ( not ( = ?auto_489085 ?auto_489086 ) ) ( not ( = ?auto_489085 ?auto_489087 ) ) ( not ( = ?auto_489085 ?auto_489088 ) ) ( not ( = ?auto_489086 ?auto_489087 ) ) ( not ( = ?auto_489086 ?auto_489088 ) ) ( not ( = ?auto_489087 ?auto_489088 ) ) ( CLEAR ?auto_489086 ) ( ON ?auto_489087 ?auto_489088 ) ( CLEAR ?auto_489087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_489073 ?auto_489074 ?auto_489075 ?auto_489076 ?auto_489077 ?auto_489078 ?auto_489079 ?auto_489080 ?auto_489081 ?auto_489082 ?auto_489083 ?auto_489084 ?auto_489085 ?auto_489086 ?auto_489087 )
      ( MAKE-16PILE ?auto_489073 ?auto_489074 ?auto_489075 ?auto_489076 ?auto_489077 ?auto_489078 ?auto_489079 ?auto_489080 ?auto_489081 ?auto_489082 ?auto_489083 ?auto_489084 ?auto_489085 ?auto_489086 ?auto_489087 ?auto_489088 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489105 - BLOCK
      ?auto_489106 - BLOCK
      ?auto_489107 - BLOCK
      ?auto_489108 - BLOCK
      ?auto_489109 - BLOCK
      ?auto_489110 - BLOCK
      ?auto_489111 - BLOCK
      ?auto_489112 - BLOCK
      ?auto_489113 - BLOCK
      ?auto_489114 - BLOCK
      ?auto_489115 - BLOCK
      ?auto_489116 - BLOCK
      ?auto_489117 - BLOCK
      ?auto_489118 - BLOCK
      ?auto_489119 - BLOCK
      ?auto_489120 - BLOCK
    )
    :vars
    (
      ?auto_489121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489120 ?auto_489121 ) ( ON-TABLE ?auto_489105 ) ( ON ?auto_489106 ?auto_489105 ) ( ON ?auto_489107 ?auto_489106 ) ( ON ?auto_489108 ?auto_489107 ) ( ON ?auto_489109 ?auto_489108 ) ( ON ?auto_489110 ?auto_489109 ) ( ON ?auto_489111 ?auto_489110 ) ( ON ?auto_489112 ?auto_489111 ) ( ON ?auto_489113 ?auto_489112 ) ( ON ?auto_489114 ?auto_489113 ) ( ON ?auto_489115 ?auto_489114 ) ( ON ?auto_489116 ?auto_489115 ) ( ON ?auto_489117 ?auto_489116 ) ( not ( = ?auto_489105 ?auto_489106 ) ) ( not ( = ?auto_489105 ?auto_489107 ) ) ( not ( = ?auto_489105 ?auto_489108 ) ) ( not ( = ?auto_489105 ?auto_489109 ) ) ( not ( = ?auto_489105 ?auto_489110 ) ) ( not ( = ?auto_489105 ?auto_489111 ) ) ( not ( = ?auto_489105 ?auto_489112 ) ) ( not ( = ?auto_489105 ?auto_489113 ) ) ( not ( = ?auto_489105 ?auto_489114 ) ) ( not ( = ?auto_489105 ?auto_489115 ) ) ( not ( = ?auto_489105 ?auto_489116 ) ) ( not ( = ?auto_489105 ?auto_489117 ) ) ( not ( = ?auto_489105 ?auto_489118 ) ) ( not ( = ?auto_489105 ?auto_489119 ) ) ( not ( = ?auto_489105 ?auto_489120 ) ) ( not ( = ?auto_489105 ?auto_489121 ) ) ( not ( = ?auto_489106 ?auto_489107 ) ) ( not ( = ?auto_489106 ?auto_489108 ) ) ( not ( = ?auto_489106 ?auto_489109 ) ) ( not ( = ?auto_489106 ?auto_489110 ) ) ( not ( = ?auto_489106 ?auto_489111 ) ) ( not ( = ?auto_489106 ?auto_489112 ) ) ( not ( = ?auto_489106 ?auto_489113 ) ) ( not ( = ?auto_489106 ?auto_489114 ) ) ( not ( = ?auto_489106 ?auto_489115 ) ) ( not ( = ?auto_489106 ?auto_489116 ) ) ( not ( = ?auto_489106 ?auto_489117 ) ) ( not ( = ?auto_489106 ?auto_489118 ) ) ( not ( = ?auto_489106 ?auto_489119 ) ) ( not ( = ?auto_489106 ?auto_489120 ) ) ( not ( = ?auto_489106 ?auto_489121 ) ) ( not ( = ?auto_489107 ?auto_489108 ) ) ( not ( = ?auto_489107 ?auto_489109 ) ) ( not ( = ?auto_489107 ?auto_489110 ) ) ( not ( = ?auto_489107 ?auto_489111 ) ) ( not ( = ?auto_489107 ?auto_489112 ) ) ( not ( = ?auto_489107 ?auto_489113 ) ) ( not ( = ?auto_489107 ?auto_489114 ) ) ( not ( = ?auto_489107 ?auto_489115 ) ) ( not ( = ?auto_489107 ?auto_489116 ) ) ( not ( = ?auto_489107 ?auto_489117 ) ) ( not ( = ?auto_489107 ?auto_489118 ) ) ( not ( = ?auto_489107 ?auto_489119 ) ) ( not ( = ?auto_489107 ?auto_489120 ) ) ( not ( = ?auto_489107 ?auto_489121 ) ) ( not ( = ?auto_489108 ?auto_489109 ) ) ( not ( = ?auto_489108 ?auto_489110 ) ) ( not ( = ?auto_489108 ?auto_489111 ) ) ( not ( = ?auto_489108 ?auto_489112 ) ) ( not ( = ?auto_489108 ?auto_489113 ) ) ( not ( = ?auto_489108 ?auto_489114 ) ) ( not ( = ?auto_489108 ?auto_489115 ) ) ( not ( = ?auto_489108 ?auto_489116 ) ) ( not ( = ?auto_489108 ?auto_489117 ) ) ( not ( = ?auto_489108 ?auto_489118 ) ) ( not ( = ?auto_489108 ?auto_489119 ) ) ( not ( = ?auto_489108 ?auto_489120 ) ) ( not ( = ?auto_489108 ?auto_489121 ) ) ( not ( = ?auto_489109 ?auto_489110 ) ) ( not ( = ?auto_489109 ?auto_489111 ) ) ( not ( = ?auto_489109 ?auto_489112 ) ) ( not ( = ?auto_489109 ?auto_489113 ) ) ( not ( = ?auto_489109 ?auto_489114 ) ) ( not ( = ?auto_489109 ?auto_489115 ) ) ( not ( = ?auto_489109 ?auto_489116 ) ) ( not ( = ?auto_489109 ?auto_489117 ) ) ( not ( = ?auto_489109 ?auto_489118 ) ) ( not ( = ?auto_489109 ?auto_489119 ) ) ( not ( = ?auto_489109 ?auto_489120 ) ) ( not ( = ?auto_489109 ?auto_489121 ) ) ( not ( = ?auto_489110 ?auto_489111 ) ) ( not ( = ?auto_489110 ?auto_489112 ) ) ( not ( = ?auto_489110 ?auto_489113 ) ) ( not ( = ?auto_489110 ?auto_489114 ) ) ( not ( = ?auto_489110 ?auto_489115 ) ) ( not ( = ?auto_489110 ?auto_489116 ) ) ( not ( = ?auto_489110 ?auto_489117 ) ) ( not ( = ?auto_489110 ?auto_489118 ) ) ( not ( = ?auto_489110 ?auto_489119 ) ) ( not ( = ?auto_489110 ?auto_489120 ) ) ( not ( = ?auto_489110 ?auto_489121 ) ) ( not ( = ?auto_489111 ?auto_489112 ) ) ( not ( = ?auto_489111 ?auto_489113 ) ) ( not ( = ?auto_489111 ?auto_489114 ) ) ( not ( = ?auto_489111 ?auto_489115 ) ) ( not ( = ?auto_489111 ?auto_489116 ) ) ( not ( = ?auto_489111 ?auto_489117 ) ) ( not ( = ?auto_489111 ?auto_489118 ) ) ( not ( = ?auto_489111 ?auto_489119 ) ) ( not ( = ?auto_489111 ?auto_489120 ) ) ( not ( = ?auto_489111 ?auto_489121 ) ) ( not ( = ?auto_489112 ?auto_489113 ) ) ( not ( = ?auto_489112 ?auto_489114 ) ) ( not ( = ?auto_489112 ?auto_489115 ) ) ( not ( = ?auto_489112 ?auto_489116 ) ) ( not ( = ?auto_489112 ?auto_489117 ) ) ( not ( = ?auto_489112 ?auto_489118 ) ) ( not ( = ?auto_489112 ?auto_489119 ) ) ( not ( = ?auto_489112 ?auto_489120 ) ) ( not ( = ?auto_489112 ?auto_489121 ) ) ( not ( = ?auto_489113 ?auto_489114 ) ) ( not ( = ?auto_489113 ?auto_489115 ) ) ( not ( = ?auto_489113 ?auto_489116 ) ) ( not ( = ?auto_489113 ?auto_489117 ) ) ( not ( = ?auto_489113 ?auto_489118 ) ) ( not ( = ?auto_489113 ?auto_489119 ) ) ( not ( = ?auto_489113 ?auto_489120 ) ) ( not ( = ?auto_489113 ?auto_489121 ) ) ( not ( = ?auto_489114 ?auto_489115 ) ) ( not ( = ?auto_489114 ?auto_489116 ) ) ( not ( = ?auto_489114 ?auto_489117 ) ) ( not ( = ?auto_489114 ?auto_489118 ) ) ( not ( = ?auto_489114 ?auto_489119 ) ) ( not ( = ?auto_489114 ?auto_489120 ) ) ( not ( = ?auto_489114 ?auto_489121 ) ) ( not ( = ?auto_489115 ?auto_489116 ) ) ( not ( = ?auto_489115 ?auto_489117 ) ) ( not ( = ?auto_489115 ?auto_489118 ) ) ( not ( = ?auto_489115 ?auto_489119 ) ) ( not ( = ?auto_489115 ?auto_489120 ) ) ( not ( = ?auto_489115 ?auto_489121 ) ) ( not ( = ?auto_489116 ?auto_489117 ) ) ( not ( = ?auto_489116 ?auto_489118 ) ) ( not ( = ?auto_489116 ?auto_489119 ) ) ( not ( = ?auto_489116 ?auto_489120 ) ) ( not ( = ?auto_489116 ?auto_489121 ) ) ( not ( = ?auto_489117 ?auto_489118 ) ) ( not ( = ?auto_489117 ?auto_489119 ) ) ( not ( = ?auto_489117 ?auto_489120 ) ) ( not ( = ?auto_489117 ?auto_489121 ) ) ( not ( = ?auto_489118 ?auto_489119 ) ) ( not ( = ?auto_489118 ?auto_489120 ) ) ( not ( = ?auto_489118 ?auto_489121 ) ) ( not ( = ?auto_489119 ?auto_489120 ) ) ( not ( = ?auto_489119 ?auto_489121 ) ) ( not ( = ?auto_489120 ?auto_489121 ) ) ( ON ?auto_489119 ?auto_489120 ) ( CLEAR ?auto_489117 ) ( ON ?auto_489118 ?auto_489119 ) ( CLEAR ?auto_489118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_489105 ?auto_489106 ?auto_489107 ?auto_489108 ?auto_489109 ?auto_489110 ?auto_489111 ?auto_489112 ?auto_489113 ?auto_489114 ?auto_489115 ?auto_489116 ?auto_489117 ?auto_489118 )
      ( MAKE-16PILE ?auto_489105 ?auto_489106 ?auto_489107 ?auto_489108 ?auto_489109 ?auto_489110 ?auto_489111 ?auto_489112 ?auto_489113 ?auto_489114 ?auto_489115 ?auto_489116 ?auto_489117 ?auto_489118 ?auto_489119 ?auto_489120 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489138 - BLOCK
      ?auto_489139 - BLOCK
      ?auto_489140 - BLOCK
      ?auto_489141 - BLOCK
      ?auto_489142 - BLOCK
      ?auto_489143 - BLOCK
      ?auto_489144 - BLOCK
      ?auto_489145 - BLOCK
      ?auto_489146 - BLOCK
      ?auto_489147 - BLOCK
      ?auto_489148 - BLOCK
      ?auto_489149 - BLOCK
      ?auto_489150 - BLOCK
      ?auto_489151 - BLOCK
      ?auto_489152 - BLOCK
      ?auto_489153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489153 ) ( ON-TABLE ?auto_489138 ) ( ON ?auto_489139 ?auto_489138 ) ( ON ?auto_489140 ?auto_489139 ) ( ON ?auto_489141 ?auto_489140 ) ( ON ?auto_489142 ?auto_489141 ) ( ON ?auto_489143 ?auto_489142 ) ( ON ?auto_489144 ?auto_489143 ) ( ON ?auto_489145 ?auto_489144 ) ( ON ?auto_489146 ?auto_489145 ) ( ON ?auto_489147 ?auto_489146 ) ( ON ?auto_489148 ?auto_489147 ) ( ON ?auto_489149 ?auto_489148 ) ( ON ?auto_489150 ?auto_489149 ) ( not ( = ?auto_489138 ?auto_489139 ) ) ( not ( = ?auto_489138 ?auto_489140 ) ) ( not ( = ?auto_489138 ?auto_489141 ) ) ( not ( = ?auto_489138 ?auto_489142 ) ) ( not ( = ?auto_489138 ?auto_489143 ) ) ( not ( = ?auto_489138 ?auto_489144 ) ) ( not ( = ?auto_489138 ?auto_489145 ) ) ( not ( = ?auto_489138 ?auto_489146 ) ) ( not ( = ?auto_489138 ?auto_489147 ) ) ( not ( = ?auto_489138 ?auto_489148 ) ) ( not ( = ?auto_489138 ?auto_489149 ) ) ( not ( = ?auto_489138 ?auto_489150 ) ) ( not ( = ?auto_489138 ?auto_489151 ) ) ( not ( = ?auto_489138 ?auto_489152 ) ) ( not ( = ?auto_489138 ?auto_489153 ) ) ( not ( = ?auto_489139 ?auto_489140 ) ) ( not ( = ?auto_489139 ?auto_489141 ) ) ( not ( = ?auto_489139 ?auto_489142 ) ) ( not ( = ?auto_489139 ?auto_489143 ) ) ( not ( = ?auto_489139 ?auto_489144 ) ) ( not ( = ?auto_489139 ?auto_489145 ) ) ( not ( = ?auto_489139 ?auto_489146 ) ) ( not ( = ?auto_489139 ?auto_489147 ) ) ( not ( = ?auto_489139 ?auto_489148 ) ) ( not ( = ?auto_489139 ?auto_489149 ) ) ( not ( = ?auto_489139 ?auto_489150 ) ) ( not ( = ?auto_489139 ?auto_489151 ) ) ( not ( = ?auto_489139 ?auto_489152 ) ) ( not ( = ?auto_489139 ?auto_489153 ) ) ( not ( = ?auto_489140 ?auto_489141 ) ) ( not ( = ?auto_489140 ?auto_489142 ) ) ( not ( = ?auto_489140 ?auto_489143 ) ) ( not ( = ?auto_489140 ?auto_489144 ) ) ( not ( = ?auto_489140 ?auto_489145 ) ) ( not ( = ?auto_489140 ?auto_489146 ) ) ( not ( = ?auto_489140 ?auto_489147 ) ) ( not ( = ?auto_489140 ?auto_489148 ) ) ( not ( = ?auto_489140 ?auto_489149 ) ) ( not ( = ?auto_489140 ?auto_489150 ) ) ( not ( = ?auto_489140 ?auto_489151 ) ) ( not ( = ?auto_489140 ?auto_489152 ) ) ( not ( = ?auto_489140 ?auto_489153 ) ) ( not ( = ?auto_489141 ?auto_489142 ) ) ( not ( = ?auto_489141 ?auto_489143 ) ) ( not ( = ?auto_489141 ?auto_489144 ) ) ( not ( = ?auto_489141 ?auto_489145 ) ) ( not ( = ?auto_489141 ?auto_489146 ) ) ( not ( = ?auto_489141 ?auto_489147 ) ) ( not ( = ?auto_489141 ?auto_489148 ) ) ( not ( = ?auto_489141 ?auto_489149 ) ) ( not ( = ?auto_489141 ?auto_489150 ) ) ( not ( = ?auto_489141 ?auto_489151 ) ) ( not ( = ?auto_489141 ?auto_489152 ) ) ( not ( = ?auto_489141 ?auto_489153 ) ) ( not ( = ?auto_489142 ?auto_489143 ) ) ( not ( = ?auto_489142 ?auto_489144 ) ) ( not ( = ?auto_489142 ?auto_489145 ) ) ( not ( = ?auto_489142 ?auto_489146 ) ) ( not ( = ?auto_489142 ?auto_489147 ) ) ( not ( = ?auto_489142 ?auto_489148 ) ) ( not ( = ?auto_489142 ?auto_489149 ) ) ( not ( = ?auto_489142 ?auto_489150 ) ) ( not ( = ?auto_489142 ?auto_489151 ) ) ( not ( = ?auto_489142 ?auto_489152 ) ) ( not ( = ?auto_489142 ?auto_489153 ) ) ( not ( = ?auto_489143 ?auto_489144 ) ) ( not ( = ?auto_489143 ?auto_489145 ) ) ( not ( = ?auto_489143 ?auto_489146 ) ) ( not ( = ?auto_489143 ?auto_489147 ) ) ( not ( = ?auto_489143 ?auto_489148 ) ) ( not ( = ?auto_489143 ?auto_489149 ) ) ( not ( = ?auto_489143 ?auto_489150 ) ) ( not ( = ?auto_489143 ?auto_489151 ) ) ( not ( = ?auto_489143 ?auto_489152 ) ) ( not ( = ?auto_489143 ?auto_489153 ) ) ( not ( = ?auto_489144 ?auto_489145 ) ) ( not ( = ?auto_489144 ?auto_489146 ) ) ( not ( = ?auto_489144 ?auto_489147 ) ) ( not ( = ?auto_489144 ?auto_489148 ) ) ( not ( = ?auto_489144 ?auto_489149 ) ) ( not ( = ?auto_489144 ?auto_489150 ) ) ( not ( = ?auto_489144 ?auto_489151 ) ) ( not ( = ?auto_489144 ?auto_489152 ) ) ( not ( = ?auto_489144 ?auto_489153 ) ) ( not ( = ?auto_489145 ?auto_489146 ) ) ( not ( = ?auto_489145 ?auto_489147 ) ) ( not ( = ?auto_489145 ?auto_489148 ) ) ( not ( = ?auto_489145 ?auto_489149 ) ) ( not ( = ?auto_489145 ?auto_489150 ) ) ( not ( = ?auto_489145 ?auto_489151 ) ) ( not ( = ?auto_489145 ?auto_489152 ) ) ( not ( = ?auto_489145 ?auto_489153 ) ) ( not ( = ?auto_489146 ?auto_489147 ) ) ( not ( = ?auto_489146 ?auto_489148 ) ) ( not ( = ?auto_489146 ?auto_489149 ) ) ( not ( = ?auto_489146 ?auto_489150 ) ) ( not ( = ?auto_489146 ?auto_489151 ) ) ( not ( = ?auto_489146 ?auto_489152 ) ) ( not ( = ?auto_489146 ?auto_489153 ) ) ( not ( = ?auto_489147 ?auto_489148 ) ) ( not ( = ?auto_489147 ?auto_489149 ) ) ( not ( = ?auto_489147 ?auto_489150 ) ) ( not ( = ?auto_489147 ?auto_489151 ) ) ( not ( = ?auto_489147 ?auto_489152 ) ) ( not ( = ?auto_489147 ?auto_489153 ) ) ( not ( = ?auto_489148 ?auto_489149 ) ) ( not ( = ?auto_489148 ?auto_489150 ) ) ( not ( = ?auto_489148 ?auto_489151 ) ) ( not ( = ?auto_489148 ?auto_489152 ) ) ( not ( = ?auto_489148 ?auto_489153 ) ) ( not ( = ?auto_489149 ?auto_489150 ) ) ( not ( = ?auto_489149 ?auto_489151 ) ) ( not ( = ?auto_489149 ?auto_489152 ) ) ( not ( = ?auto_489149 ?auto_489153 ) ) ( not ( = ?auto_489150 ?auto_489151 ) ) ( not ( = ?auto_489150 ?auto_489152 ) ) ( not ( = ?auto_489150 ?auto_489153 ) ) ( not ( = ?auto_489151 ?auto_489152 ) ) ( not ( = ?auto_489151 ?auto_489153 ) ) ( not ( = ?auto_489152 ?auto_489153 ) ) ( ON ?auto_489152 ?auto_489153 ) ( CLEAR ?auto_489150 ) ( ON ?auto_489151 ?auto_489152 ) ( CLEAR ?auto_489151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_489138 ?auto_489139 ?auto_489140 ?auto_489141 ?auto_489142 ?auto_489143 ?auto_489144 ?auto_489145 ?auto_489146 ?auto_489147 ?auto_489148 ?auto_489149 ?auto_489150 ?auto_489151 )
      ( MAKE-16PILE ?auto_489138 ?auto_489139 ?auto_489140 ?auto_489141 ?auto_489142 ?auto_489143 ?auto_489144 ?auto_489145 ?auto_489146 ?auto_489147 ?auto_489148 ?auto_489149 ?auto_489150 ?auto_489151 ?auto_489152 ?auto_489153 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489170 - BLOCK
      ?auto_489171 - BLOCK
      ?auto_489172 - BLOCK
      ?auto_489173 - BLOCK
      ?auto_489174 - BLOCK
      ?auto_489175 - BLOCK
      ?auto_489176 - BLOCK
      ?auto_489177 - BLOCK
      ?auto_489178 - BLOCK
      ?auto_489179 - BLOCK
      ?auto_489180 - BLOCK
      ?auto_489181 - BLOCK
      ?auto_489182 - BLOCK
      ?auto_489183 - BLOCK
      ?auto_489184 - BLOCK
      ?auto_489185 - BLOCK
    )
    :vars
    (
      ?auto_489186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489185 ?auto_489186 ) ( ON-TABLE ?auto_489170 ) ( ON ?auto_489171 ?auto_489170 ) ( ON ?auto_489172 ?auto_489171 ) ( ON ?auto_489173 ?auto_489172 ) ( ON ?auto_489174 ?auto_489173 ) ( ON ?auto_489175 ?auto_489174 ) ( ON ?auto_489176 ?auto_489175 ) ( ON ?auto_489177 ?auto_489176 ) ( ON ?auto_489178 ?auto_489177 ) ( ON ?auto_489179 ?auto_489178 ) ( ON ?auto_489180 ?auto_489179 ) ( ON ?auto_489181 ?auto_489180 ) ( not ( = ?auto_489170 ?auto_489171 ) ) ( not ( = ?auto_489170 ?auto_489172 ) ) ( not ( = ?auto_489170 ?auto_489173 ) ) ( not ( = ?auto_489170 ?auto_489174 ) ) ( not ( = ?auto_489170 ?auto_489175 ) ) ( not ( = ?auto_489170 ?auto_489176 ) ) ( not ( = ?auto_489170 ?auto_489177 ) ) ( not ( = ?auto_489170 ?auto_489178 ) ) ( not ( = ?auto_489170 ?auto_489179 ) ) ( not ( = ?auto_489170 ?auto_489180 ) ) ( not ( = ?auto_489170 ?auto_489181 ) ) ( not ( = ?auto_489170 ?auto_489182 ) ) ( not ( = ?auto_489170 ?auto_489183 ) ) ( not ( = ?auto_489170 ?auto_489184 ) ) ( not ( = ?auto_489170 ?auto_489185 ) ) ( not ( = ?auto_489170 ?auto_489186 ) ) ( not ( = ?auto_489171 ?auto_489172 ) ) ( not ( = ?auto_489171 ?auto_489173 ) ) ( not ( = ?auto_489171 ?auto_489174 ) ) ( not ( = ?auto_489171 ?auto_489175 ) ) ( not ( = ?auto_489171 ?auto_489176 ) ) ( not ( = ?auto_489171 ?auto_489177 ) ) ( not ( = ?auto_489171 ?auto_489178 ) ) ( not ( = ?auto_489171 ?auto_489179 ) ) ( not ( = ?auto_489171 ?auto_489180 ) ) ( not ( = ?auto_489171 ?auto_489181 ) ) ( not ( = ?auto_489171 ?auto_489182 ) ) ( not ( = ?auto_489171 ?auto_489183 ) ) ( not ( = ?auto_489171 ?auto_489184 ) ) ( not ( = ?auto_489171 ?auto_489185 ) ) ( not ( = ?auto_489171 ?auto_489186 ) ) ( not ( = ?auto_489172 ?auto_489173 ) ) ( not ( = ?auto_489172 ?auto_489174 ) ) ( not ( = ?auto_489172 ?auto_489175 ) ) ( not ( = ?auto_489172 ?auto_489176 ) ) ( not ( = ?auto_489172 ?auto_489177 ) ) ( not ( = ?auto_489172 ?auto_489178 ) ) ( not ( = ?auto_489172 ?auto_489179 ) ) ( not ( = ?auto_489172 ?auto_489180 ) ) ( not ( = ?auto_489172 ?auto_489181 ) ) ( not ( = ?auto_489172 ?auto_489182 ) ) ( not ( = ?auto_489172 ?auto_489183 ) ) ( not ( = ?auto_489172 ?auto_489184 ) ) ( not ( = ?auto_489172 ?auto_489185 ) ) ( not ( = ?auto_489172 ?auto_489186 ) ) ( not ( = ?auto_489173 ?auto_489174 ) ) ( not ( = ?auto_489173 ?auto_489175 ) ) ( not ( = ?auto_489173 ?auto_489176 ) ) ( not ( = ?auto_489173 ?auto_489177 ) ) ( not ( = ?auto_489173 ?auto_489178 ) ) ( not ( = ?auto_489173 ?auto_489179 ) ) ( not ( = ?auto_489173 ?auto_489180 ) ) ( not ( = ?auto_489173 ?auto_489181 ) ) ( not ( = ?auto_489173 ?auto_489182 ) ) ( not ( = ?auto_489173 ?auto_489183 ) ) ( not ( = ?auto_489173 ?auto_489184 ) ) ( not ( = ?auto_489173 ?auto_489185 ) ) ( not ( = ?auto_489173 ?auto_489186 ) ) ( not ( = ?auto_489174 ?auto_489175 ) ) ( not ( = ?auto_489174 ?auto_489176 ) ) ( not ( = ?auto_489174 ?auto_489177 ) ) ( not ( = ?auto_489174 ?auto_489178 ) ) ( not ( = ?auto_489174 ?auto_489179 ) ) ( not ( = ?auto_489174 ?auto_489180 ) ) ( not ( = ?auto_489174 ?auto_489181 ) ) ( not ( = ?auto_489174 ?auto_489182 ) ) ( not ( = ?auto_489174 ?auto_489183 ) ) ( not ( = ?auto_489174 ?auto_489184 ) ) ( not ( = ?auto_489174 ?auto_489185 ) ) ( not ( = ?auto_489174 ?auto_489186 ) ) ( not ( = ?auto_489175 ?auto_489176 ) ) ( not ( = ?auto_489175 ?auto_489177 ) ) ( not ( = ?auto_489175 ?auto_489178 ) ) ( not ( = ?auto_489175 ?auto_489179 ) ) ( not ( = ?auto_489175 ?auto_489180 ) ) ( not ( = ?auto_489175 ?auto_489181 ) ) ( not ( = ?auto_489175 ?auto_489182 ) ) ( not ( = ?auto_489175 ?auto_489183 ) ) ( not ( = ?auto_489175 ?auto_489184 ) ) ( not ( = ?auto_489175 ?auto_489185 ) ) ( not ( = ?auto_489175 ?auto_489186 ) ) ( not ( = ?auto_489176 ?auto_489177 ) ) ( not ( = ?auto_489176 ?auto_489178 ) ) ( not ( = ?auto_489176 ?auto_489179 ) ) ( not ( = ?auto_489176 ?auto_489180 ) ) ( not ( = ?auto_489176 ?auto_489181 ) ) ( not ( = ?auto_489176 ?auto_489182 ) ) ( not ( = ?auto_489176 ?auto_489183 ) ) ( not ( = ?auto_489176 ?auto_489184 ) ) ( not ( = ?auto_489176 ?auto_489185 ) ) ( not ( = ?auto_489176 ?auto_489186 ) ) ( not ( = ?auto_489177 ?auto_489178 ) ) ( not ( = ?auto_489177 ?auto_489179 ) ) ( not ( = ?auto_489177 ?auto_489180 ) ) ( not ( = ?auto_489177 ?auto_489181 ) ) ( not ( = ?auto_489177 ?auto_489182 ) ) ( not ( = ?auto_489177 ?auto_489183 ) ) ( not ( = ?auto_489177 ?auto_489184 ) ) ( not ( = ?auto_489177 ?auto_489185 ) ) ( not ( = ?auto_489177 ?auto_489186 ) ) ( not ( = ?auto_489178 ?auto_489179 ) ) ( not ( = ?auto_489178 ?auto_489180 ) ) ( not ( = ?auto_489178 ?auto_489181 ) ) ( not ( = ?auto_489178 ?auto_489182 ) ) ( not ( = ?auto_489178 ?auto_489183 ) ) ( not ( = ?auto_489178 ?auto_489184 ) ) ( not ( = ?auto_489178 ?auto_489185 ) ) ( not ( = ?auto_489178 ?auto_489186 ) ) ( not ( = ?auto_489179 ?auto_489180 ) ) ( not ( = ?auto_489179 ?auto_489181 ) ) ( not ( = ?auto_489179 ?auto_489182 ) ) ( not ( = ?auto_489179 ?auto_489183 ) ) ( not ( = ?auto_489179 ?auto_489184 ) ) ( not ( = ?auto_489179 ?auto_489185 ) ) ( not ( = ?auto_489179 ?auto_489186 ) ) ( not ( = ?auto_489180 ?auto_489181 ) ) ( not ( = ?auto_489180 ?auto_489182 ) ) ( not ( = ?auto_489180 ?auto_489183 ) ) ( not ( = ?auto_489180 ?auto_489184 ) ) ( not ( = ?auto_489180 ?auto_489185 ) ) ( not ( = ?auto_489180 ?auto_489186 ) ) ( not ( = ?auto_489181 ?auto_489182 ) ) ( not ( = ?auto_489181 ?auto_489183 ) ) ( not ( = ?auto_489181 ?auto_489184 ) ) ( not ( = ?auto_489181 ?auto_489185 ) ) ( not ( = ?auto_489181 ?auto_489186 ) ) ( not ( = ?auto_489182 ?auto_489183 ) ) ( not ( = ?auto_489182 ?auto_489184 ) ) ( not ( = ?auto_489182 ?auto_489185 ) ) ( not ( = ?auto_489182 ?auto_489186 ) ) ( not ( = ?auto_489183 ?auto_489184 ) ) ( not ( = ?auto_489183 ?auto_489185 ) ) ( not ( = ?auto_489183 ?auto_489186 ) ) ( not ( = ?auto_489184 ?auto_489185 ) ) ( not ( = ?auto_489184 ?auto_489186 ) ) ( not ( = ?auto_489185 ?auto_489186 ) ) ( ON ?auto_489184 ?auto_489185 ) ( ON ?auto_489183 ?auto_489184 ) ( CLEAR ?auto_489181 ) ( ON ?auto_489182 ?auto_489183 ) ( CLEAR ?auto_489182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_489170 ?auto_489171 ?auto_489172 ?auto_489173 ?auto_489174 ?auto_489175 ?auto_489176 ?auto_489177 ?auto_489178 ?auto_489179 ?auto_489180 ?auto_489181 ?auto_489182 )
      ( MAKE-16PILE ?auto_489170 ?auto_489171 ?auto_489172 ?auto_489173 ?auto_489174 ?auto_489175 ?auto_489176 ?auto_489177 ?auto_489178 ?auto_489179 ?auto_489180 ?auto_489181 ?auto_489182 ?auto_489183 ?auto_489184 ?auto_489185 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489203 - BLOCK
      ?auto_489204 - BLOCK
      ?auto_489205 - BLOCK
      ?auto_489206 - BLOCK
      ?auto_489207 - BLOCK
      ?auto_489208 - BLOCK
      ?auto_489209 - BLOCK
      ?auto_489210 - BLOCK
      ?auto_489211 - BLOCK
      ?auto_489212 - BLOCK
      ?auto_489213 - BLOCK
      ?auto_489214 - BLOCK
      ?auto_489215 - BLOCK
      ?auto_489216 - BLOCK
      ?auto_489217 - BLOCK
      ?auto_489218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489218 ) ( ON-TABLE ?auto_489203 ) ( ON ?auto_489204 ?auto_489203 ) ( ON ?auto_489205 ?auto_489204 ) ( ON ?auto_489206 ?auto_489205 ) ( ON ?auto_489207 ?auto_489206 ) ( ON ?auto_489208 ?auto_489207 ) ( ON ?auto_489209 ?auto_489208 ) ( ON ?auto_489210 ?auto_489209 ) ( ON ?auto_489211 ?auto_489210 ) ( ON ?auto_489212 ?auto_489211 ) ( ON ?auto_489213 ?auto_489212 ) ( ON ?auto_489214 ?auto_489213 ) ( not ( = ?auto_489203 ?auto_489204 ) ) ( not ( = ?auto_489203 ?auto_489205 ) ) ( not ( = ?auto_489203 ?auto_489206 ) ) ( not ( = ?auto_489203 ?auto_489207 ) ) ( not ( = ?auto_489203 ?auto_489208 ) ) ( not ( = ?auto_489203 ?auto_489209 ) ) ( not ( = ?auto_489203 ?auto_489210 ) ) ( not ( = ?auto_489203 ?auto_489211 ) ) ( not ( = ?auto_489203 ?auto_489212 ) ) ( not ( = ?auto_489203 ?auto_489213 ) ) ( not ( = ?auto_489203 ?auto_489214 ) ) ( not ( = ?auto_489203 ?auto_489215 ) ) ( not ( = ?auto_489203 ?auto_489216 ) ) ( not ( = ?auto_489203 ?auto_489217 ) ) ( not ( = ?auto_489203 ?auto_489218 ) ) ( not ( = ?auto_489204 ?auto_489205 ) ) ( not ( = ?auto_489204 ?auto_489206 ) ) ( not ( = ?auto_489204 ?auto_489207 ) ) ( not ( = ?auto_489204 ?auto_489208 ) ) ( not ( = ?auto_489204 ?auto_489209 ) ) ( not ( = ?auto_489204 ?auto_489210 ) ) ( not ( = ?auto_489204 ?auto_489211 ) ) ( not ( = ?auto_489204 ?auto_489212 ) ) ( not ( = ?auto_489204 ?auto_489213 ) ) ( not ( = ?auto_489204 ?auto_489214 ) ) ( not ( = ?auto_489204 ?auto_489215 ) ) ( not ( = ?auto_489204 ?auto_489216 ) ) ( not ( = ?auto_489204 ?auto_489217 ) ) ( not ( = ?auto_489204 ?auto_489218 ) ) ( not ( = ?auto_489205 ?auto_489206 ) ) ( not ( = ?auto_489205 ?auto_489207 ) ) ( not ( = ?auto_489205 ?auto_489208 ) ) ( not ( = ?auto_489205 ?auto_489209 ) ) ( not ( = ?auto_489205 ?auto_489210 ) ) ( not ( = ?auto_489205 ?auto_489211 ) ) ( not ( = ?auto_489205 ?auto_489212 ) ) ( not ( = ?auto_489205 ?auto_489213 ) ) ( not ( = ?auto_489205 ?auto_489214 ) ) ( not ( = ?auto_489205 ?auto_489215 ) ) ( not ( = ?auto_489205 ?auto_489216 ) ) ( not ( = ?auto_489205 ?auto_489217 ) ) ( not ( = ?auto_489205 ?auto_489218 ) ) ( not ( = ?auto_489206 ?auto_489207 ) ) ( not ( = ?auto_489206 ?auto_489208 ) ) ( not ( = ?auto_489206 ?auto_489209 ) ) ( not ( = ?auto_489206 ?auto_489210 ) ) ( not ( = ?auto_489206 ?auto_489211 ) ) ( not ( = ?auto_489206 ?auto_489212 ) ) ( not ( = ?auto_489206 ?auto_489213 ) ) ( not ( = ?auto_489206 ?auto_489214 ) ) ( not ( = ?auto_489206 ?auto_489215 ) ) ( not ( = ?auto_489206 ?auto_489216 ) ) ( not ( = ?auto_489206 ?auto_489217 ) ) ( not ( = ?auto_489206 ?auto_489218 ) ) ( not ( = ?auto_489207 ?auto_489208 ) ) ( not ( = ?auto_489207 ?auto_489209 ) ) ( not ( = ?auto_489207 ?auto_489210 ) ) ( not ( = ?auto_489207 ?auto_489211 ) ) ( not ( = ?auto_489207 ?auto_489212 ) ) ( not ( = ?auto_489207 ?auto_489213 ) ) ( not ( = ?auto_489207 ?auto_489214 ) ) ( not ( = ?auto_489207 ?auto_489215 ) ) ( not ( = ?auto_489207 ?auto_489216 ) ) ( not ( = ?auto_489207 ?auto_489217 ) ) ( not ( = ?auto_489207 ?auto_489218 ) ) ( not ( = ?auto_489208 ?auto_489209 ) ) ( not ( = ?auto_489208 ?auto_489210 ) ) ( not ( = ?auto_489208 ?auto_489211 ) ) ( not ( = ?auto_489208 ?auto_489212 ) ) ( not ( = ?auto_489208 ?auto_489213 ) ) ( not ( = ?auto_489208 ?auto_489214 ) ) ( not ( = ?auto_489208 ?auto_489215 ) ) ( not ( = ?auto_489208 ?auto_489216 ) ) ( not ( = ?auto_489208 ?auto_489217 ) ) ( not ( = ?auto_489208 ?auto_489218 ) ) ( not ( = ?auto_489209 ?auto_489210 ) ) ( not ( = ?auto_489209 ?auto_489211 ) ) ( not ( = ?auto_489209 ?auto_489212 ) ) ( not ( = ?auto_489209 ?auto_489213 ) ) ( not ( = ?auto_489209 ?auto_489214 ) ) ( not ( = ?auto_489209 ?auto_489215 ) ) ( not ( = ?auto_489209 ?auto_489216 ) ) ( not ( = ?auto_489209 ?auto_489217 ) ) ( not ( = ?auto_489209 ?auto_489218 ) ) ( not ( = ?auto_489210 ?auto_489211 ) ) ( not ( = ?auto_489210 ?auto_489212 ) ) ( not ( = ?auto_489210 ?auto_489213 ) ) ( not ( = ?auto_489210 ?auto_489214 ) ) ( not ( = ?auto_489210 ?auto_489215 ) ) ( not ( = ?auto_489210 ?auto_489216 ) ) ( not ( = ?auto_489210 ?auto_489217 ) ) ( not ( = ?auto_489210 ?auto_489218 ) ) ( not ( = ?auto_489211 ?auto_489212 ) ) ( not ( = ?auto_489211 ?auto_489213 ) ) ( not ( = ?auto_489211 ?auto_489214 ) ) ( not ( = ?auto_489211 ?auto_489215 ) ) ( not ( = ?auto_489211 ?auto_489216 ) ) ( not ( = ?auto_489211 ?auto_489217 ) ) ( not ( = ?auto_489211 ?auto_489218 ) ) ( not ( = ?auto_489212 ?auto_489213 ) ) ( not ( = ?auto_489212 ?auto_489214 ) ) ( not ( = ?auto_489212 ?auto_489215 ) ) ( not ( = ?auto_489212 ?auto_489216 ) ) ( not ( = ?auto_489212 ?auto_489217 ) ) ( not ( = ?auto_489212 ?auto_489218 ) ) ( not ( = ?auto_489213 ?auto_489214 ) ) ( not ( = ?auto_489213 ?auto_489215 ) ) ( not ( = ?auto_489213 ?auto_489216 ) ) ( not ( = ?auto_489213 ?auto_489217 ) ) ( not ( = ?auto_489213 ?auto_489218 ) ) ( not ( = ?auto_489214 ?auto_489215 ) ) ( not ( = ?auto_489214 ?auto_489216 ) ) ( not ( = ?auto_489214 ?auto_489217 ) ) ( not ( = ?auto_489214 ?auto_489218 ) ) ( not ( = ?auto_489215 ?auto_489216 ) ) ( not ( = ?auto_489215 ?auto_489217 ) ) ( not ( = ?auto_489215 ?auto_489218 ) ) ( not ( = ?auto_489216 ?auto_489217 ) ) ( not ( = ?auto_489216 ?auto_489218 ) ) ( not ( = ?auto_489217 ?auto_489218 ) ) ( ON ?auto_489217 ?auto_489218 ) ( ON ?auto_489216 ?auto_489217 ) ( CLEAR ?auto_489214 ) ( ON ?auto_489215 ?auto_489216 ) ( CLEAR ?auto_489215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_489203 ?auto_489204 ?auto_489205 ?auto_489206 ?auto_489207 ?auto_489208 ?auto_489209 ?auto_489210 ?auto_489211 ?auto_489212 ?auto_489213 ?auto_489214 ?auto_489215 )
      ( MAKE-16PILE ?auto_489203 ?auto_489204 ?auto_489205 ?auto_489206 ?auto_489207 ?auto_489208 ?auto_489209 ?auto_489210 ?auto_489211 ?auto_489212 ?auto_489213 ?auto_489214 ?auto_489215 ?auto_489216 ?auto_489217 ?auto_489218 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489235 - BLOCK
      ?auto_489236 - BLOCK
      ?auto_489237 - BLOCK
      ?auto_489238 - BLOCK
      ?auto_489239 - BLOCK
      ?auto_489240 - BLOCK
      ?auto_489241 - BLOCK
      ?auto_489242 - BLOCK
      ?auto_489243 - BLOCK
      ?auto_489244 - BLOCK
      ?auto_489245 - BLOCK
      ?auto_489246 - BLOCK
      ?auto_489247 - BLOCK
      ?auto_489248 - BLOCK
      ?auto_489249 - BLOCK
      ?auto_489250 - BLOCK
    )
    :vars
    (
      ?auto_489251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489250 ?auto_489251 ) ( ON-TABLE ?auto_489235 ) ( ON ?auto_489236 ?auto_489235 ) ( ON ?auto_489237 ?auto_489236 ) ( ON ?auto_489238 ?auto_489237 ) ( ON ?auto_489239 ?auto_489238 ) ( ON ?auto_489240 ?auto_489239 ) ( ON ?auto_489241 ?auto_489240 ) ( ON ?auto_489242 ?auto_489241 ) ( ON ?auto_489243 ?auto_489242 ) ( ON ?auto_489244 ?auto_489243 ) ( ON ?auto_489245 ?auto_489244 ) ( not ( = ?auto_489235 ?auto_489236 ) ) ( not ( = ?auto_489235 ?auto_489237 ) ) ( not ( = ?auto_489235 ?auto_489238 ) ) ( not ( = ?auto_489235 ?auto_489239 ) ) ( not ( = ?auto_489235 ?auto_489240 ) ) ( not ( = ?auto_489235 ?auto_489241 ) ) ( not ( = ?auto_489235 ?auto_489242 ) ) ( not ( = ?auto_489235 ?auto_489243 ) ) ( not ( = ?auto_489235 ?auto_489244 ) ) ( not ( = ?auto_489235 ?auto_489245 ) ) ( not ( = ?auto_489235 ?auto_489246 ) ) ( not ( = ?auto_489235 ?auto_489247 ) ) ( not ( = ?auto_489235 ?auto_489248 ) ) ( not ( = ?auto_489235 ?auto_489249 ) ) ( not ( = ?auto_489235 ?auto_489250 ) ) ( not ( = ?auto_489235 ?auto_489251 ) ) ( not ( = ?auto_489236 ?auto_489237 ) ) ( not ( = ?auto_489236 ?auto_489238 ) ) ( not ( = ?auto_489236 ?auto_489239 ) ) ( not ( = ?auto_489236 ?auto_489240 ) ) ( not ( = ?auto_489236 ?auto_489241 ) ) ( not ( = ?auto_489236 ?auto_489242 ) ) ( not ( = ?auto_489236 ?auto_489243 ) ) ( not ( = ?auto_489236 ?auto_489244 ) ) ( not ( = ?auto_489236 ?auto_489245 ) ) ( not ( = ?auto_489236 ?auto_489246 ) ) ( not ( = ?auto_489236 ?auto_489247 ) ) ( not ( = ?auto_489236 ?auto_489248 ) ) ( not ( = ?auto_489236 ?auto_489249 ) ) ( not ( = ?auto_489236 ?auto_489250 ) ) ( not ( = ?auto_489236 ?auto_489251 ) ) ( not ( = ?auto_489237 ?auto_489238 ) ) ( not ( = ?auto_489237 ?auto_489239 ) ) ( not ( = ?auto_489237 ?auto_489240 ) ) ( not ( = ?auto_489237 ?auto_489241 ) ) ( not ( = ?auto_489237 ?auto_489242 ) ) ( not ( = ?auto_489237 ?auto_489243 ) ) ( not ( = ?auto_489237 ?auto_489244 ) ) ( not ( = ?auto_489237 ?auto_489245 ) ) ( not ( = ?auto_489237 ?auto_489246 ) ) ( not ( = ?auto_489237 ?auto_489247 ) ) ( not ( = ?auto_489237 ?auto_489248 ) ) ( not ( = ?auto_489237 ?auto_489249 ) ) ( not ( = ?auto_489237 ?auto_489250 ) ) ( not ( = ?auto_489237 ?auto_489251 ) ) ( not ( = ?auto_489238 ?auto_489239 ) ) ( not ( = ?auto_489238 ?auto_489240 ) ) ( not ( = ?auto_489238 ?auto_489241 ) ) ( not ( = ?auto_489238 ?auto_489242 ) ) ( not ( = ?auto_489238 ?auto_489243 ) ) ( not ( = ?auto_489238 ?auto_489244 ) ) ( not ( = ?auto_489238 ?auto_489245 ) ) ( not ( = ?auto_489238 ?auto_489246 ) ) ( not ( = ?auto_489238 ?auto_489247 ) ) ( not ( = ?auto_489238 ?auto_489248 ) ) ( not ( = ?auto_489238 ?auto_489249 ) ) ( not ( = ?auto_489238 ?auto_489250 ) ) ( not ( = ?auto_489238 ?auto_489251 ) ) ( not ( = ?auto_489239 ?auto_489240 ) ) ( not ( = ?auto_489239 ?auto_489241 ) ) ( not ( = ?auto_489239 ?auto_489242 ) ) ( not ( = ?auto_489239 ?auto_489243 ) ) ( not ( = ?auto_489239 ?auto_489244 ) ) ( not ( = ?auto_489239 ?auto_489245 ) ) ( not ( = ?auto_489239 ?auto_489246 ) ) ( not ( = ?auto_489239 ?auto_489247 ) ) ( not ( = ?auto_489239 ?auto_489248 ) ) ( not ( = ?auto_489239 ?auto_489249 ) ) ( not ( = ?auto_489239 ?auto_489250 ) ) ( not ( = ?auto_489239 ?auto_489251 ) ) ( not ( = ?auto_489240 ?auto_489241 ) ) ( not ( = ?auto_489240 ?auto_489242 ) ) ( not ( = ?auto_489240 ?auto_489243 ) ) ( not ( = ?auto_489240 ?auto_489244 ) ) ( not ( = ?auto_489240 ?auto_489245 ) ) ( not ( = ?auto_489240 ?auto_489246 ) ) ( not ( = ?auto_489240 ?auto_489247 ) ) ( not ( = ?auto_489240 ?auto_489248 ) ) ( not ( = ?auto_489240 ?auto_489249 ) ) ( not ( = ?auto_489240 ?auto_489250 ) ) ( not ( = ?auto_489240 ?auto_489251 ) ) ( not ( = ?auto_489241 ?auto_489242 ) ) ( not ( = ?auto_489241 ?auto_489243 ) ) ( not ( = ?auto_489241 ?auto_489244 ) ) ( not ( = ?auto_489241 ?auto_489245 ) ) ( not ( = ?auto_489241 ?auto_489246 ) ) ( not ( = ?auto_489241 ?auto_489247 ) ) ( not ( = ?auto_489241 ?auto_489248 ) ) ( not ( = ?auto_489241 ?auto_489249 ) ) ( not ( = ?auto_489241 ?auto_489250 ) ) ( not ( = ?auto_489241 ?auto_489251 ) ) ( not ( = ?auto_489242 ?auto_489243 ) ) ( not ( = ?auto_489242 ?auto_489244 ) ) ( not ( = ?auto_489242 ?auto_489245 ) ) ( not ( = ?auto_489242 ?auto_489246 ) ) ( not ( = ?auto_489242 ?auto_489247 ) ) ( not ( = ?auto_489242 ?auto_489248 ) ) ( not ( = ?auto_489242 ?auto_489249 ) ) ( not ( = ?auto_489242 ?auto_489250 ) ) ( not ( = ?auto_489242 ?auto_489251 ) ) ( not ( = ?auto_489243 ?auto_489244 ) ) ( not ( = ?auto_489243 ?auto_489245 ) ) ( not ( = ?auto_489243 ?auto_489246 ) ) ( not ( = ?auto_489243 ?auto_489247 ) ) ( not ( = ?auto_489243 ?auto_489248 ) ) ( not ( = ?auto_489243 ?auto_489249 ) ) ( not ( = ?auto_489243 ?auto_489250 ) ) ( not ( = ?auto_489243 ?auto_489251 ) ) ( not ( = ?auto_489244 ?auto_489245 ) ) ( not ( = ?auto_489244 ?auto_489246 ) ) ( not ( = ?auto_489244 ?auto_489247 ) ) ( not ( = ?auto_489244 ?auto_489248 ) ) ( not ( = ?auto_489244 ?auto_489249 ) ) ( not ( = ?auto_489244 ?auto_489250 ) ) ( not ( = ?auto_489244 ?auto_489251 ) ) ( not ( = ?auto_489245 ?auto_489246 ) ) ( not ( = ?auto_489245 ?auto_489247 ) ) ( not ( = ?auto_489245 ?auto_489248 ) ) ( not ( = ?auto_489245 ?auto_489249 ) ) ( not ( = ?auto_489245 ?auto_489250 ) ) ( not ( = ?auto_489245 ?auto_489251 ) ) ( not ( = ?auto_489246 ?auto_489247 ) ) ( not ( = ?auto_489246 ?auto_489248 ) ) ( not ( = ?auto_489246 ?auto_489249 ) ) ( not ( = ?auto_489246 ?auto_489250 ) ) ( not ( = ?auto_489246 ?auto_489251 ) ) ( not ( = ?auto_489247 ?auto_489248 ) ) ( not ( = ?auto_489247 ?auto_489249 ) ) ( not ( = ?auto_489247 ?auto_489250 ) ) ( not ( = ?auto_489247 ?auto_489251 ) ) ( not ( = ?auto_489248 ?auto_489249 ) ) ( not ( = ?auto_489248 ?auto_489250 ) ) ( not ( = ?auto_489248 ?auto_489251 ) ) ( not ( = ?auto_489249 ?auto_489250 ) ) ( not ( = ?auto_489249 ?auto_489251 ) ) ( not ( = ?auto_489250 ?auto_489251 ) ) ( ON ?auto_489249 ?auto_489250 ) ( ON ?auto_489248 ?auto_489249 ) ( ON ?auto_489247 ?auto_489248 ) ( CLEAR ?auto_489245 ) ( ON ?auto_489246 ?auto_489247 ) ( CLEAR ?auto_489246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_489235 ?auto_489236 ?auto_489237 ?auto_489238 ?auto_489239 ?auto_489240 ?auto_489241 ?auto_489242 ?auto_489243 ?auto_489244 ?auto_489245 ?auto_489246 )
      ( MAKE-16PILE ?auto_489235 ?auto_489236 ?auto_489237 ?auto_489238 ?auto_489239 ?auto_489240 ?auto_489241 ?auto_489242 ?auto_489243 ?auto_489244 ?auto_489245 ?auto_489246 ?auto_489247 ?auto_489248 ?auto_489249 ?auto_489250 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489268 - BLOCK
      ?auto_489269 - BLOCK
      ?auto_489270 - BLOCK
      ?auto_489271 - BLOCK
      ?auto_489272 - BLOCK
      ?auto_489273 - BLOCK
      ?auto_489274 - BLOCK
      ?auto_489275 - BLOCK
      ?auto_489276 - BLOCK
      ?auto_489277 - BLOCK
      ?auto_489278 - BLOCK
      ?auto_489279 - BLOCK
      ?auto_489280 - BLOCK
      ?auto_489281 - BLOCK
      ?auto_489282 - BLOCK
      ?auto_489283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489283 ) ( ON-TABLE ?auto_489268 ) ( ON ?auto_489269 ?auto_489268 ) ( ON ?auto_489270 ?auto_489269 ) ( ON ?auto_489271 ?auto_489270 ) ( ON ?auto_489272 ?auto_489271 ) ( ON ?auto_489273 ?auto_489272 ) ( ON ?auto_489274 ?auto_489273 ) ( ON ?auto_489275 ?auto_489274 ) ( ON ?auto_489276 ?auto_489275 ) ( ON ?auto_489277 ?auto_489276 ) ( ON ?auto_489278 ?auto_489277 ) ( not ( = ?auto_489268 ?auto_489269 ) ) ( not ( = ?auto_489268 ?auto_489270 ) ) ( not ( = ?auto_489268 ?auto_489271 ) ) ( not ( = ?auto_489268 ?auto_489272 ) ) ( not ( = ?auto_489268 ?auto_489273 ) ) ( not ( = ?auto_489268 ?auto_489274 ) ) ( not ( = ?auto_489268 ?auto_489275 ) ) ( not ( = ?auto_489268 ?auto_489276 ) ) ( not ( = ?auto_489268 ?auto_489277 ) ) ( not ( = ?auto_489268 ?auto_489278 ) ) ( not ( = ?auto_489268 ?auto_489279 ) ) ( not ( = ?auto_489268 ?auto_489280 ) ) ( not ( = ?auto_489268 ?auto_489281 ) ) ( not ( = ?auto_489268 ?auto_489282 ) ) ( not ( = ?auto_489268 ?auto_489283 ) ) ( not ( = ?auto_489269 ?auto_489270 ) ) ( not ( = ?auto_489269 ?auto_489271 ) ) ( not ( = ?auto_489269 ?auto_489272 ) ) ( not ( = ?auto_489269 ?auto_489273 ) ) ( not ( = ?auto_489269 ?auto_489274 ) ) ( not ( = ?auto_489269 ?auto_489275 ) ) ( not ( = ?auto_489269 ?auto_489276 ) ) ( not ( = ?auto_489269 ?auto_489277 ) ) ( not ( = ?auto_489269 ?auto_489278 ) ) ( not ( = ?auto_489269 ?auto_489279 ) ) ( not ( = ?auto_489269 ?auto_489280 ) ) ( not ( = ?auto_489269 ?auto_489281 ) ) ( not ( = ?auto_489269 ?auto_489282 ) ) ( not ( = ?auto_489269 ?auto_489283 ) ) ( not ( = ?auto_489270 ?auto_489271 ) ) ( not ( = ?auto_489270 ?auto_489272 ) ) ( not ( = ?auto_489270 ?auto_489273 ) ) ( not ( = ?auto_489270 ?auto_489274 ) ) ( not ( = ?auto_489270 ?auto_489275 ) ) ( not ( = ?auto_489270 ?auto_489276 ) ) ( not ( = ?auto_489270 ?auto_489277 ) ) ( not ( = ?auto_489270 ?auto_489278 ) ) ( not ( = ?auto_489270 ?auto_489279 ) ) ( not ( = ?auto_489270 ?auto_489280 ) ) ( not ( = ?auto_489270 ?auto_489281 ) ) ( not ( = ?auto_489270 ?auto_489282 ) ) ( not ( = ?auto_489270 ?auto_489283 ) ) ( not ( = ?auto_489271 ?auto_489272 ) ) ( not ( = ?auto_489271 ?auto_489273 ) ) ( not ( = ?auto_489271 ?auto_489274 ) ) ( not ( = ?auto_489271 ?auto_489275 ) ) ( not ( = ?auto_489271 ?auto_489276 ) ) ( not ( = ?auto_489271 ?auto_489277 ) ) ( not ( = ?auto_489271 ?auto_489278 ) ) ( not ( = ?auto_489271 ?auto_489279 ) ) ( not ( = ?auto_489271 ?auto_489280 ) ) ( not ( = ?auto_489271 ?auto_489281 ) ) ( not ( = ?auto_489271 ?auto_489282 ) ) ( not ( = ?auto_489271 ?auto_489283 ) ) ( not ( = ?auto_489272 ?auto_489273 ) ) ( not ( = ?auto_489272 ?auto_489274 ) ) ( not ( = ?auto_489272 ?auto_489275 ) ) ( not ( = ?auto_489272 ?auto_489276 ) ) ( not ( = ?auto_489272 ?auto_489277 ) ) ( not ( = ?auto_489272 ?auto_489278 ) ) ( not ( = ?auto_489272 ?auto_489279 ) ) ( not ( = ?auto_489272 ?auto_489280 ) ) ( not ( = ?auto_489272 ?auto_489281 ) ) ( not ( = ?auto_489272 ?auto_489282 ) ) ( not ( = ?auto_489272 ?auto_489283 ) ) ( not ( = ?auto_489273 ?auto_489274 ) ) ( not ( = ?auto_489273 ?auto_489275 ) ) ( not ( = ?auto_489273 ?auto_489276 ) ) ( not ( = ?auto_489273 ?auto_489277 ) ) ( not ( = ?auto_489273 ?auto_489278 ) ) ( not ( = ?auto_489273 ?auto_489279 ) ) ( not ( = ?auto_489273 ?auto_489280 ) ) ( not ( = ?auto_489273 ?auto_489281 ) ) ( not ( = ?auto_489273 ?auto_489282 ) ) ( not ( = ?auto_489273 ?auto_489283 ) ) ( not ( = ?auto_489274 ?auto_489275 ) ) ( not ( = ?auto_489274 ?auto_489276 ) ) ( not ( = ?auto_489274 ?auto_489277 ) ) ( not ( = ?auto_489274 ?auto_489278 ) ) ( not ( = ?auto_489274 ?auto_489279 ) ) ( not ( = ?auto_489274 ?auto_489280 ) ) ( not ( = ?auto_489274 ?auto_489281 ) ) ( not ( = ?auto_489274 ?auto_489282 ) ) ( not ( = ?auto_489274 ?auto_489283 ) ) ( not ( = ?auto_489275 ?auto_489276 ) ) ( not ( = ?auto_489275 ?auto_489277 ) ) ( not ( = ?auto_489275 ?auto_489278 ) ) ( not ( = ?auto_489275 ?auto_489279 ) ) ( not ( = ?auto_489275 ?auto_489280 ) ) ( not ( = ?auto_489275 ?auto_489281 ) ) ( not ( = ?auto_489275 ?auto_489282 ) ) ( not ( = ?auto_489275 ?auto_489283 ) ) ( not ( = ?auto_489276 ?auto_489277 ) ) ( not ( = ?auto_489276 ?auto_489278 ) ) ( not ( = ?auto_489276 ?auto_489279 ) ) ( not ( = ?auto_489276 ?auto_489280 ) ) ( not ( = ?auto_489276 ?auto_489281 ) ) ( not ( = ?auto_489276 ?auto_489282 ) ) ( not ( = ?auto_489276 ?auto_489283 ) ) ( not ( = ?auto_489277 ?auto_489278 ) ) ( not ( = ?auto_489277 ?auto_489279 ) ) ( not ( = ?auto_489277 ?auto_489280 ) ) ( not ( = ?auto_489277 ?auto_489281 ) ) ( not ( = ?auto_489277 ?auto_489282 ) ) ( not ( = ?auto_489277 ?auto_489283 ) ) ( not ( = ?auto_489278 ?auto_489279 ) ) ( not ( = ?auto_489278 ?auto_489280 ) ) ( not ( = ?auto_489278 ?auto_489281 ) ) ( not ( = ?auto_489278 ?auto_489282 ) ) ( not ( = ?auto_489278 ?auto_489283 ) ) ( not ( = ?auto_489279 ?auto_489280 ) ) ( not ( = ?auto_489279 ?auto_489281 ) ) ( not ( = ?auto_489279 ?auto_489282 ) ) ( not ( = ?auto_489279 ?auto_489283 ) ) ( not ( = ?auto_489280 ?auto_489281 ) ) ( not ( = ?auto_489280 ?auto_489282 ) ) ( not ( = ?auto_489280 ?auto_489283 ) ) ( not ( = ?auto_489281 ?auto_489282 ) ) ( not ( = ?auto_489281 ?auto_489283 ) ) ( not ( = ?auto_489282 ?auto_489283 ) ) ( ON ?auto_489282 ?auto_489283 ) ( ON ?auto_489281 ?auto_489282 ) ( ON ?auto_489280 ?auto_489281 ) ( CLEAR ?auto_489278 ) ( ON ?auto_489279 ?auto_489280 ) ( CLEAR ?auto_489279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_489268 ?auto_489269 ?auto_489270 ?auto_489271 ?auto_489272 ?auto_489273 ?auto_489274 ?auto_489275 ?auto_489276 ?auto_489277 ?auto_489278 ?auto_489279 )
      ( MAKE-16PILE ?auto_489268 ?auto_489269 ?auto_489270 ?auto_489271 ?auto_489272 ?auto_489273 ?auto_489274 ?auto_489275 ?auto_489276 ?auto_489277 ?auto_489278 ?auto_489279 ?auto_489280 ?auto_489281 ?auto_489282 ?auto_489283 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489300 - BLOCK
      ?auto_489301 - BLOCK
      ?auto_489302 - BLOCK
      ?auto_489303 - BLOCK
      ?auto_489304 - BLOCK
      ?auto_489305 - BLOCK
      ?auto_489306 - BLOCK
      ?auto_489307 - BLOCK
      ?auto_489308 - BLOCK
      ?auto_489309 - BLOCK
      ?auto_489310 - BLOCK
      ?auto_489311 - BLOCK
      ?auto_489312 - BLOCK
      ?auto_489313 - BLOCK
      ?auto_489314 - BLOCK
      ?auto_489315 - BLOCK
    )
    :vars
    (
      ?auto_489316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489315 ?auto_489316 ) ( ON-TABLE ?auto_489300 ) ( ON ?auto_489301 ?auto_489300 ) ( ON ?auto_489302 ?auto_489301 ) ( ON ?auto_489303 ?auto_489302 ) ( ON ?auto_489304 ?auto_489303 ) ( ON ?auto_489305 ?auto_489304 ) ( ON ?auto_489306 ?auto_489305 ) ( ON ?auto_489307 ?auto_489306 ) ( ON ?auto_489308 ?auto_489307 ) ( ON ?auto_489309 ?auto_489308 ) ( not ( = ?auto_489300 ?auto_489301 ) ) ( not ( = ?auto_489300 ?auto_489302 ) ) ( not ( = ?auto_489300 ?auto_489303 ) ) ( not ( = ?auto_489300 ?auto_489304 ) ) ( not ( = ?auto_489300 ?auto_489305 ) ) ( not ( = ?auto_489300 ?auto_489306 ) ) ( not ( = ?auto_489300 ?auto_489307 ) ) ( not ( = ?auto_489300 ?auto_489308 ) ) ( not ( = ?auto_489300 ?auto_489309 ) ) ( not ( = ?auto_489300 ?auto_489310 ) ) ( not ( = ?auto_489300 ?auto_489311 ) ) ( not ( = ?auto_489300 ?auto_489312 ) ) ( not ( = ?auto_489300 ?auto_489313 ) ) ( not ( = ?auto_489300 ?auto_489314 ) ) ( not ( = ?auto_489300 ?auto_489315 ) ) ( not ( = ?auto_489300 ?auto_489316 ) ) ( not ( = ?auto_489301 ?auto_489302 ) ) ( not ( = ?auto_489301 ?auto_489303 ) ) ( not ( = ?auto_489301 ?auto_489304 ) ) ( not ( = ?auto_489301 ?auto_489305 ) ) ( not ( = ?auto_489301 ?auto_489306 ) ) ( not ( = ?auto_489301 ?auto_489307 ) ) ( not ( = ?auto_489301 ?auto_489308 ) ) ( not ( = ?auto_489301 ?auto_489309 ) ) ( not ( = ?auto_489301 ?auto_489310 ) ) ( not ( = ?auto_489301 ?auto_489311 ) ) ( not ( = ?auto_489301 ?auto_489312 ) ) ( not ( = ?auto_489301 ?auto_489313 ) ) ( not ( = ?auto_489301 ?auto_489314 ) ) ( not ( = ?auto_489301 ?auto_489315 ) ) ( not ( = ?auto_489301 ?auto_489316 ) ) ( not ( = ?auto_489302 ?auto_489303 ) ) ( not ( = ?auto_489302 ?auto_489304 ) ) ( not ( = ?auto_489302 ?auto_489305 ) ) ( not ( = ?auto_489302 ?auto_489306 ) ) ( not ( = ?auto_489302 ?auto_489307 ) ) ( not ( = ?auto_489302 ?auto_489308 ) ) ( not ( = ?auto_489302 ?auto_489309 ) ) ( not ( = ?auto_489302 ?auto_489310 ) ) ( not ( = ?auto_489302 ?auto_489311 ) ) ( not ( = ?auto_489302 ?auto_489312 ) ) ( not ( = ?auto_489302 ?auto_489313 ) ) ( not ( = ?auto_489302 ?auto_489314 ) ) ( not ( = ?auto_489302 ?auto_489315 ) ) ( not ( = ?auto_489302 ?auto_489316 ) ) ( not ( = ?auto_489303 ?auto_489304 ) ) ( not ( = ?auto_489303 ?auto_489305 ) ) ( not ( = ?auto_489303 ?auto_489306 ) ) ( not ( = ?auto_489303 ?auto_489307 ) ) ( not ( = ?auto_489303 ?auto_489308 ) ) ( not ( = ?auto_489303 ?auto_489309 ) ) ( not ( = ?auto_489303 ?auto_489310 ) ) ( not ( = ?auto_489303 ?auto_489311 ) ) ( not ( = ?auto_489303 ?auto_489312 ) ) ( not ( = ?auto_489303 ?auto_489313 ) ) ( not ( = ?auto_489303 ?auto_489314 ) ) ( not ( = ?auto_489303 ?auto_489315 ) ) ( not ( = ?auto_489303 ?auto_489316 ) ) ( not ( = ?auto_489304 ?auto_489305 ) ) ( not ( = ?auto_489304 ?auto_489306 ) ) ( not ( = ?auto_489304 ?auto_489307 ) ) ( not ( = ?auto_489304 ?auto_489308 ) ) ( not ( = ?auto_489304 ?auto_489309 ) ) ( not ( = ?auto_489304 ?auto_489310 ) ) ( not ( = ?auto_489304 ?auto_489311 ) ) ( not ( = ?auto_489304 ?auto_489312 ) ) ( not ( = ?auto_489304 ?auto_489313 ) ) ( not ( = ?auto_489304 ?auto_489314 ) ) ( not ( = ?auto_489304 ?auto_489315 ) ) ( not ( = ?auto_489304 ?auto_489316 ) ) ( not ( = ?auto_489305 ?auto_489306 ) ) ( not ( = ?auto_489305 ?auto_489307 ) ) ( not ( = ?auto_489305 ?auto_489308 ) ) ( not ( = ?auto_489305 ?auto_489309 ) ) ( not ( = ?auto_489305 ?auto_489310 ) ) ( not ( = ?auto_489305 ?auto_489311 ) ) ( not ( = ?auto_489305 ?auto_489312 ) ) ( not ( = ?auto_489305 ?auto_489313 ) ) ( not ( = ?auto_489305 ?auto_489314 ) ) ( not ( = ?auto_489305 ?auto_489315 ) ) ( not ( = ?auto_489305 ?auto_489316 ) ) ( not ( = ?auto_489306 ?auto_489307 ) ) ( not ( = ?auto_489306 ?auto_489308 ) ) ( not ( = ?auto_489306 ?auto_489309 ) ) ( not ( = ?auto_489306 ?auto_489310 ) ) ( not ( = ?auto_489306 ?auto_489311 ) ) ( not ( = ?auto_489306 ?auto_489312 ) ) ( not ( = ?auto_489306 ?auto_489313 ) ) ( not ( = ?auto_489306 ?auto_489314 ) ) ( not ( = ?auto_489306 ?auto_489315 ) ) ( not ( = ?auto_489306 ?auto_489316 ) ) ( not ( = ?auto_489307 ?auto_489308 ) ) ( not ( = ?auto_489307 ?auto_489309 ) ) ( not ( = ?auto_489307 ?auto_489310 ) ) ( not ( = ?auto_489307 ?auto_489311 ) ) ( not ( = ?auto_489307 ?auto_489312 ) ) ( not ( = ?auto_489307 ?auto_489313 ) ) ( not ( = ?auto_489307 ?auto_489314 ) ) ( not ( = ?auto_489307 ?auto_489315 ) ) ( not ( = ?auto_489307 ?auto_489316 ) ) ( not ( = ?auto_489308 ?auto_489309 ) ) ( not ( = ?auto_489308 ?auto_489310 ) ) ( not ( = ?auto_489308 ?auto_489311 ) ) ( not ( = ?auto_489308 ?auto_489312 ) ) ( not ( = ?auto_489308 ?auto_489313 ) ) ( not ( = ?auto_489308 ?auto_489314 ) ) ( not ( = ?auto_489308 ?auto_489315 ) ) ( not ( = ?auto_489308 ?auto_489316 ) ) ( not ( = ?auto_489309 ?auto_489310 ) ) ( not ( = ?auto_489309 ?auto_489311 ) ) ( not ( = ?auto_489309 ?auto_489312 ) ) ( not ( = ?auto_489309 ?auto_489313 ) ) ( not ( = ?auto_489309 ?auto_489314 ) ) ( not ( = ?auto_489309 ?auto_489315 ) ) ( not ( = ?auto_489309 ?auto_489316 ) ) ( not ( = ?auto_489310 ?auto_489311 ) ) ( not ( = ?auto_489310 ?auto_489312 ) ) ( not ( = ?auto_489310 ?auto_489313 ) ) ( not ( = ?auto_489310 ?auto_489314 ) ) ( not ( = ?auto_489310 ?auto_489315 ) ) ( not ( = ?auto_489310 ?auto_489316 ) ) ( not ( = ?auto_489311 ?auto_489312 ) ) ( not ( = ?auto_489311 ?auto_489313 ) ) ( not ( = ?auto_489311 ?auto_489314 ) ) ( not ( = ?auto_489311 ?auto_489315 ) ) ( not ( = ?auto_489311 ?auto_489316 ) ) ( not ( = ?auto_489312 ?auto_489313 ) ) ( not ( = ?auto_489312 ?auto_489314 ) ) ( not ( = ?auto_489312 ?auto_489315 ) ) ( not ( = ?auto_489312 ?auto_489316 ) ) ( not ( = ?auto_489313 ?auto_489314 ) ) ( not ( = ?auto_489313 ?auto_489315 ) ) ( not ( = ?auto_489313 ?auto_489316 ) ) ( not ( = ?auto_489314 ?auto_489315 ) ) ( not ( = ?auto_489314 ?auto_489316 ) ) ( not ( = ?auto_489315 ?auto_489316 ) ) ( ON ?auto_489314 ?auto_489315 ) ( ON ?auto_489313 ?auto_489314 ) ( ON ?auto_489312 ?auto_489313 ) ( ON ?auto_489311 ?auto_489312 ) ( CLEAR ?auto_489309 ) ( ON ?auto_489310 ?auto_489311 ) ( CLEAR ?auto_489310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_489300 ?auto_489301 ?auto_489302 ?auto_489303 ?auto_489304 ?auto_489305 ?auto_489306 ?auto_489307 ?auto_489308 ?auto_489309 ?auto_489310 )
      ( MAKE-16PILE ?auto_489300 ?auto_489301 ?auto_489302 ?auto_489303 ?auto_489304 ?auto_489305 ?auto_489306 ?auto_489307 ?auto_489308 ?auto_489309 ?auto_489310 ?auto_489311 ?auto_489312 ?auto_489313 ?auto_489314 ?auto_489315 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489333 - BLOCK
      ?auto_489334 - BLOCK
      ?auto_489335 - BLOCK
      ?auto_489336 - BLOCK
      ?auto_489337 - BLOCK
      ?auto_489338 - BLOCK
      ?auto_489339 - BLOCK
      ?auto_489340 - BLOCK
      ?auto_489341 - BLOCK
      ?auto_489342 - BLOCK
      ?auto_489343 - BLOCK
      ?auto_489344 - BLOCK
      ?auto_489345 - BLOCK
      ?auto_489346 - BLOCK
      ?auto_489347 - BLOCK
      ?auto_489348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489348 ) ( ON-TABLE ?auto_489333 ) ( ON ?auto_489334 ?auto_489333 ) ( ON ?auto_489335 ?auto_489334 ) ( ON ?auto_489336 ?auto_489335 ) ( ON ?auto_489337 ?auto_489336 ) ( ON ?auto_489338 ?auto_489337 ) ( ON ?auto_489339 ?auto_489338 ) ( ON ?auto_489340 ?auto_489339 ) ( ON ?auto_489341 ?auto_489340 ) ( ON ?auto_489342 ?auto_489341 ) ( not ( = ?auto_489333 ?auto_489334 ) ) ( not ( = ?auto_489333 ?auto_489335 ) ) ( not ( = ?auto_489333 ?auto_489336 ) ) ( not ( = ?auto_489333 ?auto_489337 ) ) ( not ( = ?auto_489333 ?auto_489338 ) ) ( not ( = ?auto_489333 ?auto_489339 ) ) ( not ( = ?auto_489333 ?auto_489340 ) ) ( not ( = ?auto_489333 ?auto_489341 ) ) ( not ( = ?auto_489333 ?auto_489342 ) ) ( not ( = ?auto_489333 ?auto_489343 ) ) ( not ( = ?auto_489333 ?auto_489344 ) ) ( not ( = ?auto_489333 ?auto_489345 ) ) ( not ( = ?auto_489333 ?auto_489346 ) ) ( not ( = ?auto_489333 ?auto_489347 ) ) ( not ( = ?auto_489333 ?auto_489348 ) ) ( not ( = ?auto_489334 ?auto_489335 ) ) ( not ( = ?auto_489334 ?auto_489336 ) ) ( not ( = ?auto_489334 ?auto_489337 ) ) ( not ( = ?auto_489334 ?auto_489338 ) ) ( not ( = ?auto_489334 ?auto_489339 ) ) ( not ( = ?auto_489334 ?auto_489340 ) ) ( not ( = ?auto_489334 ?auto_489341 ) ) ( not ( = ?auto_489334 ?auto_489342 ) ) ( not ( = ?auto_489334 ?auto_489343 ) ) ( not ( = ?auto_489334 ?auto_489344 ) ) ( not ( = ?auto_489334 ?auto_489345 ) ) ( not ( = ?auto_489334 ?auto_489346 ) ) ( not ( = ?auto_489334 ?auto_489347 ) ) ( not ( = ?auto_489334 ?auto_489348 ) ) ( not ( = ?auto_489335 ?auto_489336 ) ) ( not ( = ?auto_489335 ?auto_489337 ) ) ( not ( = ?auto_489335 ?auto_489338 ) ) ( not ( = ?auto_489335 ?auto_489339 ) ) ( not ( = ?auto_489335 ?auto_489340 ) ) ( not ( = ?auto_489335 ?auto_489341 ) ) ( not ( = ?auto_489335 ?auto_489342 ) ) ( not ( = ?auto_489335 ?auto_489343 ) ) ( not ( = ?auto_489335 ?auto_489344 ) ) ( not ( = ?auto_489335 ?auto_489345 ) ) ( not ( = ?auto_489335 ?auto_489346 ) ) ( not ( = ?auto_489335 ?auto_489347 ) ) ( not ( = ?auto_489335 ?auto_489348 ) ) ( not ( = ?auto_489336 ?auto_489337 ) ) ( not ( = ?auto_489336 ?auto_489338 ) ) ( not ( = ?auto_489336 ?auto_489339 ) ) ( not ( = ?auto_489336 ?auto_489340 ) ) ( not ( = ?auto_489336 ?auto_489341 ) ) ( not ( = ?auto_489336 ?auto_489342 ) ) ( not ( = ?auto_489336 ?auto_489343 ) ) ( not ( = ?auto_489336 ?auto_489344 ) ) ( not ( = ?auto_489336 ?auto_489345 ) ) ( not ( = ?auto_489336 ?auto_489346 ) ) ( not ( = ?auto_489336 ?auto_489347 ) ) ( not ( = ?auto_489336 ?auto_489348 ) ) ( not ( = ?auto_489337 ?auto_489338 ) ) ( not ( = ?auto_489337 ?auto_489339 ) ) ( not ( = ?auto_489337 ?auto_489340 ) ) ( not ( = ?auto_489337 ?auto_489341 ) ) ( not ( = ?auto_489337 ?auto_489342 ) ) ( not ( = ?auto_489337 ?auto_489343 ) ) ( not ( = ?auto_489337 ?auto_489344 ) ) ( not ( = ?auto_489337 ?auto_489345 ) ) ( not ( = ?auto_489337 ?auto_489346 ) ) ( not ( = ?auto_489337 ?auto_489347 ) ) ( not ( = ?auto_489337 ?auto_489348 ) ) ( not ( = ?auto_489338 ?auto_489339 ) ) ( not ( = ?auto_489338 ?auto_489340 ) ) ( not ( = ?auto_489338 ?auto_489341 ) ) ( not ( = ?auto_489338 ?auto_489342 ) ) ( not ( = ?auto_489338 ?auto_489343 ) ) ( not ( = ?auto_489338 ?auto_489344 ) ) ( not ( = ?auto_489338 ?auto_489345 ) ) ( not ( = ?auto_489338 ?auto_489346 ) ) ( not ( = ?auto_489338 ?auto_489347 ) ) ( not ( = ?auto_489338 ?auto_489348 ) ) ( not ( = ?auto_489339 ?auto_489340 ) ) ( not ( = ?auto_489339 ?auto_489341 ) ) ( not ( = ?auto_489339 ?auto_489342 ) ) ( not ( = ?auto_489339 ?auto_489343 ) ) ( not ( = ?auto_489339 ?auto_489344 ) ) ( not ( = ?auto_489339 ?auto_489345 ) ) ( not ( = ?auto_489339 ?auto_489346 ) ) ( not ( = ?auto_489339 ?auto_489347 ) ) ( not ( = ?auto_489339 ?auto_489348 ) ) ( not ( = ?auto_489340 ?auto_489341 ) ) ( not ( = ?auto_489340 ?auto_489342 ) ) ( not ( = ?auto_489340 ?auto_489343 ) ) ( not ( = ?auto_489340 ?auto_489344 ) ) ( not ( = ?auto_489340 ?auto_489345 ) ) ( not ( = ?auto_489340 ?auto_489346 ) ) ( not ( = ?auto_489340 ?auto_489347 ) ) ( not ( = ?auto_489340 ?auto_489348 ) ) ( not ( = ?auto_489341 ?auto_489342 ) ) ( not ( = ?auto_489341 ?auto_489343 ) ) ( not ( = ?auto_489341 ?auto_489344 ) ) ( not ( = ?auto_489341 ?auto_489345 ) ) ( not ( = ?auto_489341 ?auto_489346 ) ) ( not ( = ?auto_489341 ?auto_489347 ) ) ( not ( = ?auto_489341 ?auto_489348 ) ) ( not ( = ?auto_489342 ?auto_489343 ) ) ( not ( = ?auto_489342 ?auto_489344 ) ) ( not ( = ?auto_489342 ?auto_489345 ) ) ( not ( = ?auto_489342 ?auto_489346 ) ) ( not ( = ?auto_489342 ?auto_489347 ) ) ( not ( = ?auto_489342 ?auto_489348 ) ) ( not ( = ?auto_489343 ?auto_489344 ) ) ( not ( = ?auto_489343 ?auto_489345 ) ) ( not ( = ?auto_489343 ?auto_489346 ) ) ( not ( = ?auto_489343 ?auto_489347 ) ) ( not ( = ?auto_489343 ?auto_489348 ) ) ( not ( = ?auto_489344 ?auto_489345 ) ) ( not ( = ?auto_489344 ?auto_489346 ) ) ( not ( = ?auto_489344 ?auto_489347 ) ) ( not ( = ?auto_489344 ?auto_489348 ) ) ( not ( = ?auto_489345 ?auto_489346 ) ) ( not ( = ?auto_489345 ?auto_489347 ) ) ( not ( = ?auto_489345 ?auto_489348 ) ) ( not ( = ?auto_489346 ?auto_489347 ) ) ( not ( = ?auto_489346 ?auto_489348 ) ) ( not ( = ?auto_489347 ?auto_489348 ) ) ( ON ?auto_489347 ?auto_489348 ) ( ON ?auto_489346 ?auto_489347 ) ( ON ?auto_489345 ?auto_489346 ) ( ON ?auto_489344 ?auto_489345 ) ( CLEAR ?auto_489342 ) ( ON ?auto_489343 ?auto_489344 ) ( CLEAR ?auto_489343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_489333 ?auto_489334 ?auto_489335 ?auto_489336 ?auto_489337 ?auto_489338 ?auto_489339 ?auto_489340 ?auto_489341 ?auto_489342 ?auto_489343 )
      ( MAKE-16PILE ?auto_489333 ?auto_489334 ?auto_489335 ?auto_489336 ?auto_489337 ?auto_489338 ?auto_489339 ?auto_489340 ?auto_489341 ?auto_489342 ?auto_489343 ?auto_489344 ?auto_489345 ?auto_489346 ?auto_489347 ?auto_489348 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489365 - BLOCK
      ?auto_489366 - BLOCK
      ?auto_489367 - BLOCK
      ?auto_489368 - BLOCK
      ?auto_489369 - BLOCK
      ?auto_489370 - BLOCK
      ?auto_489371 - BLOCK
      ?auto_489372 - BLOCK
      ?auto_489373 - BLOCK
      ?auto_489374 - BLOCK
      ?auto_489375 - BLOCK
      ?auto_489376 - BLOCK
      ?auto_489377 - BLOCK
      ?auto_489378 - BLOCK
      ?auto_489379 - BLOCK
      ?auto_489380 - BLOCK
    )
    :vars
    (
      ?auto_489381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489380 ?auto_489381 ) ( ON-TABLE ?auto_489365 ) ( ON ?auto_489366 ?auto_489365 ) ( ON ?auto_489367 ?auto_489366 ) ( ON ?auto_489368 ?auto_489367 ) ( ON ?auto_489369 ?auto_489368 ) ( ON ?auto_489370 ?auto_489369 ) ( ON ?auto_489371 ?auto_489370 ) ( ON ?auto_489372 ?auto_489371 ) ( ON ?auto_489373 ?auto_489372 ) ( not ( = ?auto_489365 ?auto_489366 ) ) ( not ( = ?auto_489365 ?auto_489367 ) ) ( not ( = ?auto_489365 ?auto_489368 ) ) ( not ( = ?auto_489365 ?auto_489369 ) ) ( not ( = ?auto_489365 ?auto_489370 ) ) ( not ( = ?auto_489365 ?auto_489371 ) ) ( not ( = ?auto_489365 ?auto_489372 ) ) ( not ( = ?auto_489365 ?auto_489373 ) ) ( not ( = ?auto_489365 ?auto_489374 ) ) ( not ( = ?auto_489365 ?auto_489375 ) ) ( not ( = ?auto_489365 ?auto_489376 ) ) ( not ( = ?auto_489365 ?auto_489377 ) ) ( not ( = ?auto_489365 ?auto_489378 ) ) ( not ( = ?auto_489365 ?auto_489379 ) ) ( not ( = ?auto_489365 ?auto_489380 ) ) ( not ( = ?auto_489365 ?auto_489381 ) ) ( not ( = ?auto_489366 ?auto_489367 ) ) ( not ( = ?auto_489366 ?auto_489368 ) ) ( not ( = ?auto_489366 ?auto_489369 ) ) ( not ( = ?auto_489366 ?auto_489370 ) ) ( not ( = ?auto_489366 ?auto_489371 ) ) ( not ( = ?auto_489366 ?auto_489372 ) ) ( not ( = ?auto_489366 ?auto_489373 ) ) ( not ( = ?auto_489366 ?auto_489374 ) ) ( not ( = ?auto_489366 ?auto_489375 ) ) ( not ( = ?auto_489366 ?auto_489376 ) ) ( not ( = ?auto_489366 ?auto_489377 ) ) ( not ( = ?auto_489366 ?auto_489378 ) ) ( not ( = ?auto_489366 ?auto_489379 ) ) ( not ( = ?auto_489366 ?auto_489380 ) ) ( not ( = ?auto_489366 ?auto_489381 ) ) ( not ( = ?auto_489367 ?auto_489368 ) ) ( not ( = ?auto_489367 ?auto_489369 ) ) ( not ( = ?auto_489367 ?auto_489370 ) ) ( not ( = ?auto_489367 ?auto_489371 ) ) ( not ( = ?auto_489367 ?auto_489372 ) ) ( not ( = ?auto_489367 ?auto_489373 ) ) ( not ( = ?auto_489367 ?auto_489374 ) ) ( not ( = ?auto_489367 ?auto_489375 ) ) ( not ( = ?auto_489367 ?auto_489376 ) ) ( not ( = ?auto_489367 ?auto_489377 ) ) ( not ( = ?auto_489367 ?auto_489378 ) ) ( not ( = ?auto_489367 ?auto_489379 ) ) ( not ( = ?auto_489367 ?auto_489380 ) ) ( not ( = ?auto_489367 ?auto_489381 ) ) ( not ( = ?auto_489368 ?auto_489369 ) ) ( not ( = ?auto_489368 ?auto_489370 ) ) ( not ( = ?auto_489368 ?auto_489371 ) ) ( not ( = ?auto_489368 ?auto_489372 ) ) ( not ( = ?auto_489368 ?auto_489373 ) ) ( not ( = ?auto_489368 ?auto_489374 ) ) ( not ( = ?auto_489368 ?auto_489375 ) ) ( not ( = ?auto_489368 ?auto_489376 ) ) ( not ( = ?auto_489368 ?auto_489377 ) ) ( not ( = ?auto_489368 ?auto_489378 ) ) ( not ( = ?auto_489368 ?auto_489379 ) ) ( not ( = ?auto_489368 ?auto_489380 ) ) ( not ( = ?auto_489368 ?auto_489381 ) ) ( not ( = ?auto_489369 ?auto_489370 ) ) ( not ( = ?auto_489369 ?auto_489371 ) ) ( not ( = ?auto_489369 ?auto_489372 ) ) ( not ( = ?auto_489369 ?auto_489373 ) ) ( not ( = ?auto_489369 ?auto_489374 ) ) ( not ( = ?auto_489369 ?auto_489375 ) ) ( not ( = ?auto_489369 ?auto_489376 ) ) ( not ( = ?auto_489369 ?auto_489377 ) ) ( not ( = ?auto_489369 ?auto_489378 ) ) ( not ( = ?auto_489369 ?auto_489379 ) ) ( not ( = ?auto_489369 ?auto_489380 ) ) ( not ( = ?auto_489369 ?auto_489381 ) ) ( not ( = ?auto_489370 ?auto_489371 ) ) ( not ( = ?auto_489370 ?auto_489372 ) ) ( not ( = ?auto_489370 ?auto_489373 ) ) ( not ( = ?auto_489370 ?auto_489374 ) ) ( not ( = ?auto_489370 ?auto_489375 ) ) ( not ( = ?auto_489370 ?auto_489376 ) ) ( not ( = ?auto_489370 ?auto_489377 ) ) ( not ( = ?auto_489370 ?auto_489378 ) ) ( not ( = ?auto_489370 ?auto_489379 ) ) ( not ( = ?auto_489370 ?auto_489380 ) ) ( not ( = ?auto_489370 ?auto_489381 ) ) ( not ( = ?auto_489371 ?auto_489372 ) ) ( not ( = ?auto_489371 ?auto_489373 ) ) ( not ( = ?auto_489371 ?auto_489374 ) ) ( not ( = ?auto_489371 ?auto_489375 ) ) ( not ( = ?auto_489371 ?auto_489376 ) ) ( not ( = ?auto_489371 ?auto_489377 ) ) ( not ( = ?auto_489371 ?auto_489378 ) ) ( not ( = ?auto_489371 ?auto_489379 ) ) ( not ( = ?auto_489371 ?auto_489380 ) ) ( not ( = ?auto_489371 ?auto_489381 ) ) ( not ( = ?auto_489372 ?auto_489373 ) ) ( not ( = ?auto_489372 ?auto_489374 ) ) ( not ( = ?auto_489372 ?auto_489375 ) ) ( not ( = ?auto_489372 ?auto_489376 ) ) ( not ( = ?auto_489372 ?auto_489377 ) ) ( not ( = ?auto_489372 ?auto_489378 ) ) ( not ( = ?auto_489372 ?auto_489379 ) ) ( not ( = ?auto_489372 ?auto_489380 ) ) ( not ( = ?auto_489372 ?auto_489381 ) ) ( not ( = ?auto_489373 ?auto_489374 ) ) ( not ( = ?auto_489373 ?auto_489375 ) ) ( not ( = ?auto_489373 ?auto_489376 ) ) ( not ( = ?auto_489373 ?auto_489377 ) ) ( not ( = ?auto_489373 ?auto_489378 ) ) ( not ( = ?auto_489373 ?auto_489379 ) ) ( not ( = ?auto_489373 ?auto_489380 ) ) ( not ( = ?auto_489373 ?auto_489381 ) ) ( not ( = ?auto_489374 ?auto_489375 ) ) ( not ( = ?auto_489374 ?auto_489376 ) ) ( not ( = ?auto_489374 ?auto_489377 ) ) ( not ( = ?auto_489374 ?auto_489378 ) ) ( not ( = ?auto_489374 ?auto_489379 ) ) ( not ( = ?auto_489374 ?auto_489380 ) ) ( not ( = ?auto_489374 ?auto_489381 ) ) ( not ( = ?auto_489375 ?auto_489376 ) ) ( not ( = ?auto_489375 ?auto_489377 ) ) ( not ( = ?auto_489375 ?auto_489378 ) ) ( not ( = ?auto_489375 ?auto_489379 ) ) ( not ( = ?auto_489375 ?auto_489380 ) ) ( not ( = ?auto_489375 ?auto_489381 ) ) ( not ( = ?auto_489376 ?auto_489377 ) ) ( not ( = ?auto_489376 ?auto_489378 ) ) ( not ( = ?auto_489376 ?auto_489379 ) ) ( not ( = ?auto_489376 ?auto_489380 ) ) ( not ( = ?auto_489376 ?auto_489381 ) ) ( not ( = ?auto_489377 ?auto_489378 ) ) ( not ( = ?auto_489377 ?auto_489379 ) ) ( not ( = ?auto_489377 ?auto_489380 ) ) ( not ( = ?auto_489377 ?auto_489381 ) ) ( not ( = ?auto_489378 ?auto_489379 ) ) ( not ( = ?auto_489378 ?auto_489380 ) ) ( not ( = ?auto_489378 ?auto_489381 ) ) ( not ( = ?auto_489379 ?auto_489380 ) ) ( not ( = ?auto_489379 ?auto_489381 ) ) ( not ( = ?auto_489380 ?auto_489381 ) ) ( ON ?auto_489379 ?auto_489380 ) ( ON ?auto_489378 ?auto_489379 ) ( ON ?auto_489377 ?auto_489378 ) ( ON ?auto_489376 ?auto_489377 ) ( ON ?auto_489375 ?auto_489376 ) ( CLEAR ?auto_489373 ) ( ON ?auto_489374 ?auto_489375 ) ( CLEAR ?auto_489374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_489365 ?auto_489366 ?auto_489367 ?auto_489368 ?auto_489369 ?auto_489370 ?auto_489371 ?auto_489372 ?auto_489373 ?auto_489374 )
      ( MAKE-16PILE ?auto_489365 ?auto_489366 ?auto_489367 ?auto_489368 ?auto_489369 ?auto_489370 ?auto_489371 ?auto_489372 ?auto_489373 ?auto_489374 ?auto_489375 ?auto_489376 ?auto_489377 ?auto_489378 ?auto_489379 ?auto_489380 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489398 - BLOCK
      ?auto_489399 - BLOCK
      ?auto_489400 - BLOCK
      ?auto_489401 - BLOCK
      ?auto_489402 - BLOCK
      ?auto_489403 - BLOCK
      ?auto_489404 - BLOCK
      ?auto_489405 - BLOCK
      ?auto_489406 - BLOCK
      ?auto_489407 - BLOCK
      ?auto_489408 - BLOCK
      ?auto_489409 - BLOCK
      ?auto_489410 - BLOCK
      ?auto_489411 - BLOCK
      ?auto_489412 - BLOCK
      ?auto_489413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489413 ) ( ON-TABLE ?auto_489398 ) ( ON ?auto_489399 ?auto_489398 ) ( ON ?auto_489400 ?auto_489399 ) ( ON ?auto_489401 ?auto_489400 ) ( ON ?auto_489402 ?auto_489401 ) ( ON ?auto_489403 ?auto_489402 ) ( ON ?auto_489404 ?auto_489403 ) ( ON ?auto_489405 ?auto_489404 ) ( ON ?auto_489406 ?auto_489405 ) ( not ( = ?auto_489398 ?auto_489399 ) ) ( not ( = ?auto_489398 ?auto_489400 ) ) ( not ( = ?auto_489398 ?auto_489401 ) ) ( not ( = ?auto_489398 ?auto_489402 ) ) ( not ( = ?auto_489398 ?auto_489403 ) ) ( not ( = ?auto_489398 ?auto_489404 ) ) ( not ( = ?auto_489398 ?auto_489405 ) ) ( not ( = ?auto_489398 ?auto_489406 ) ) ( not ( = ?auto_489398 ?auto_489407 ) ) ( not ( = ?auto_489398 ?auto_489408 ) ) ( not ( = ?auto_489398 ?auto_489409 ) ) ( not ( = ?auto_489398 ?auto_489410 ) ) ( not ( = ?auto_489398 ?auto_489411 ) ) ( not ( = ?auto_489398 ?auto_489412 ) ) ( not ( = ?auto_489398 ?auto_489413 ) ) ( not ( = ?auto_489399 ?auto_489400 ) ) ( not ( = ?auto_489399 ?auto_489401 ) ) ( not ( = ?auto_489399 ?auto_489402 ) ) ( not ( = ?auto_489399 ?auto_489403 ) ) ( not ( = ?auto_489399 ?auto_489404 ) ) ( not ( = ?auto_489399 ?auto_489405 ) ) ( not ( = ?auto_489399 ?auto_489406 ) ) ( not ( = ?auto_489399 ?auto_489407 ) ) ( not ( = ?auto_489399 ?auto_489408 ) ) ( not ( = ?auto_489399 ?auto_489409 ) ) ( not ( = ?auto_489399 ?auto_489410 ) ) ( not ( = ?auto_489399 ?auto_489411 ) ) ( not ( = ?auto_489399 ?auto_489412 ) ) ( not ( = ?auto_489399 ?auto_489413 ) ) ( not ( = ?auto_489400 ?auto_489401 ) ) ( not ( = ?auto_489400 ?auto_489402 ) ) ( not ( = ?auto_489400 ?auto_489403 ) ) ( not ( = ?auto_489400 ?auto_489404 ) ) ( not ( = ?auto_489400 ?auto_489405 ) ) ( not ( = ?auto_489400 ?auto_489406 ) ) ( not ( = ?auto_489400 ?auto_489407 ) ) ( not ( = ?auto_489400 ?auto_489408 ) ) ( not ( = ?auto_489400 ?auto_489409 ) ) ( not ( = ?auto_489400 ?auto_489410 ) ) ( not ( = ?auto_489400 ?auto_489411 ) ) ( not ( = ?auto_489400 ?auto_489412 ) ) ( not ( = ?auto_489400 ?auto_489413 ) ) ( not ( = ?auto_489401 ?auto_489402 ) ) ( not ( = ?auto_489401 ?auto_489403 ) ) ( not ( = ?auto_489401 ?auto_489404 ) ) ( not ( = ?auto_489401 ?auto_489405 ) ) ( not ( = ?auto_489401 ?auto_489406 ) ) ( not ( = ?auto_489401 ?auto_489407 ) ) ( not ( = ?auto_489401 ?auto_489408 ) ) ( not ( = ?auto_489401 ?auto_489409 ) ) ( not ( = ?auto_489401 ?auto_489410 ) ) ( not ( = ?auto_489401 ?auto_489411 ) ) ( not ( = ?auto_489401 ?auto_489412 ) ) ( not ( = ?auto_489401 ?auto_489413 ) ) ( not ( = ?auto_489402 ?auto_489403 ) ) ( not ( = ?auto_489402 ?auto_489404 ) ) ( not ( = ?auto_489402 ?auto_489405 ) ) ( not ( = ?auto_489402 ?auto_489406 ) ) ( not ( = ?auto_489402 ?auto_489407 ) ) ( not ( = ?auto_489402 ?auto_489408 ) ) ( not ( = ?auto_489402 ?auto_489409 ) ) ( not ( = ?auto_489402 ?auto_489410 ) ) ( not ( = ?auto_489402 ?auto_489411 ) ) ( not ( = ?auto_489402 ?auto_489412 ) ) ( not ( = ?auto_489402 ?auto_489413 ) ) ( not ( = ?auto_489403 ?auto_489404 ) ) ( not ( = ?auto_489403 ?auto_489405 ) ) ( not ( = ?auto_489403 ?auto_489406 ) ) ( not ( = ?auto_489403 ?auto_489407 ) ) ( not ( = ?auto_489403 ?auto_489408 ) ) ( not ( = ?auto_489403 ?auto_489409 ) ) ( not ( = ?auto_489403 ?auto_489410 ) ) ( not ( = ?auto_489403 ?auto_489411 ) ) ( not ( = ?auto_489403 ?auto_489412 ) ) ( not ( = ?auto_489403 ?auto_489413 ) ) ( not ( = ?auto_489404 ?auto_489405 ) ) ( not ( = ?auto_489404 ?auto_489406 ) ) ( not ( = ?auto_489404 ?auto_489407 ) ) ( not ( = ?auto_489404 ?auto_489408 ) ) ( not ( = ?auto_489404 ?auto_489409 ) ) ( not ( = ?auto_489404 ?auto_489410 ) ) ( not ( = ?auto_489404 ?auto_489411 ) ) ( not ( = ?auto_489404 ?auto_489412 ) ) ( not ( = ?auto_489404 ?auto_489413 ) ) ( not ( = ?auto_489405 ?auto_489406 ) ) ( not ( = ?auto_489405 ?auto_489407 ) ) ( not ( = ?auto_489405 ?auto_489408 ) ) ( not ( = ?auto_489405 ?auto_489409 ) ) ( not ( = ?auto_489405 ?auto_489410 ) ) ( not ( = ?auto_489405 ?auto_489411 ) ) ( not ( = ?auto_489405 ?auto_489412 ) ) ( not ( = ?auto_489405 ?auto_489413 ) ) ( not ( = ?auto_489406 ?auto_489407 ) ) ( not ( = ?auto_489406 ?auto_489408 ) ) ( not ( = ?auto_489406 ?auto_489409 ) ) ( not ( = ?auto_489406 ?auto_489410 ) ) ( not ( = ?auto_489406 ?auto_489411 ) ) ( not ( = ?auto_489406 ?auto_489412 ) ) ( not ( = ?auto_489406 ?auto_489413 ) ) ( not ( = ?auto_489407 ?auto_489408 ) ) ( not ( = ?auto_489407 ?auto_489409 ) ) ( not ( = ?auto_489407 ?auto_489410 ) ) ( not ( = ?auto_489407 ?auto_489411 ) ) ( not ( = ?auto_489407 ?auto_489412 ) ) ( not ( = ?auto_489407 ?auto_489413 ) ) ( not ( = ?auto_489408 ?auto_489409 ) ) ( not ( = ?auto_489408 ?auto_489410 ) ) ( not ( = ?auto_489408 ?auto_489411 ) ) ( not ( = ?auto_489408 ?auto_489412 ) ) ( not ( = ?auto_489408 ?auto_489413 ) ) ( not ( = ?auto_489409 ?auto_489410 ) ) ( not ( = ?auto_489409 ?auto_489411 ) ) ( not ( = ?auto_489409 ?auto_489412 ) ) ( not ( = ?auto_489409 ?auto_489413 ) ) ( not ( = ?auto_489410 ?auto_489411 ) ) ( not ( = ?auto_489410 ?auto_489412 ) ) ( not ( = ?auto_489410 ?auto_489413 ) ) ( not ( = ?auto_489411 ?auto_489412 ) ) ( not ( = ?auto_489411 ?auto_489413 ) ) ( not ( = ?auto_489412 ?auto_489413 ) ) ( ON ?auto_489412 ?auto_489413 ) ( ON ?auto_489411 ?auto_489412 ) ( ON ?auto_489410 ?auto_489411 ) ( ON ?auto_489409 ?auto_489410 ) ( ON ?auto_489408 ?auto_489409 ) ( CLEAR ?auto_489406 ) ( ON ?auto_489407 ?auto_489408 ) ( CLEAR ?auto_489407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_489398 ?auto_489399 ?auto_489400 ?auto_489401 ?auto_489402 ?auto_489403 ?auto_489404 ?auto_489405 ?auto_489406 ?auto_489407 )
      ( MAKE-16PILE ?auto_489398 ?auto_489399 ?auto_489400 ?auto_489401 ?auto_489402 ?auto_489403 ?auto_489404 ?auto_489405 ?auto_489406 ?auto_489407 ?auto_489408 ?auto_489409 ?auto_489410 ?auto_489411 ?auto_489412 ?auto_489413 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489430 - BLOCK
      ?auto_489431 - BLOCK
      ?auto_489432 - BLOCK
      ?auto_489433 - BLOCK
      ?auto_489434 - BLOCK
      ?auto_489435 - BLOCK
      ?auto_489436 - BLOCK
      ?auto_489437 - BLOCK
      ?auto_489438 - BLOCK
      ?auto_489439 - BLOCK
      ?auto_489440 - BLOCK
      ?auto_489441 - BLOCK
      ?auto_489442 - BLOCK
      ?auto_489443 - BLOCK
      ?auto_489444 - BLOCK
      ?auto_489445 - BLOCK
    )
    :vars
    (
      ?auto_489446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489445 ?auto_489446 ) ( ON-TABLE ?auto_489430 ) ( ON ?auto_489431 ?auto_489430 ) ( ON ?auto_489432 ?auto_489431 ) ( ON ?auto_489433 ?auto_489432 ) ( ON ?auto_489434 ?auto_489433 ) ( ON ?auto_489435 ?auto_489434 ) ( ON ?auto_489436 ?auto_489435 ) ( ON ?auto_489437 ?auto_489436 ) ( not ( = ?auto_489430 ?auto_489431 ) ) ( not ( = ?auto_489430 ?auto_489432 ) ) ( not ( = ?auto_489430 ?auto_489433 ) ) ( not ( = ?auto_489430 ?auto_489434 ) ) ( not ( = ?auto_489430 ?auto_489435 ) ) ( not ( = ?auto_489430 ?auto_489436 ) ) ( not ( = ?auto_489430 ?auto_489437 ) ) ( not ( = ?auto_489430 ?auto_489438 ) ) ( not ( = ?auto_489430 ?auto_489439 ) ) ( not ( = ?auto_489430 ?auto_489440 ) ) ( not ( = ?auto_489430 ?auto_489441 ) ) ( not ( = ?auto_489430 ?auto_489442 ) ) ( not ( = ?auto_489430 ?auto_489443 ) ) ( not ( = ?auto_489430 ?auto_489444 ) ) ( not ( = ?auto_489430 ?auto_489445 ) ) ( not ( = ?auto_489430 ?auto_489446 ) ) ( not ( = ?auto_489431 ?auto_489432 ) ) ( not ( = ?auto_489431 ?auto_489433 ) ) ( not ( = ?auto_489431 ?auto_489434 ) ) ( not ( = ?auto_489431 ?auto_489435 ) ) ( not ( = ?auto_489431 ?auto_489436 ) ) ( not ( = ?auto_489431 ?auto_489437 ) ) ( not ( = ?auto_489431 ?auto_489438 ) ) ( not ( = ?auto_489431 ?auto_489439 ) ) ( not ( = ?auto_489431 ?auto_489440 ) ) ( not ( = ?auto_489431 ?auto_489441 ) ) ( not ( = ?auto_489431 ?auto_489442 ) ) ( not ( = ?auto_489431 ?auto_489443 ) ) ( not ( = ?auto_489431 ?auto_489444 ) ) ( not ( = ?auto_489431 ?auto_489445 ) ) ( not ( = ?auto_489431 ?auto_489446 ) ) ( not ( = ?auto_489432 ?auto_489433 ) ) ( not ( = ?auto_489432 ?auto_489434 ) ) ( not ( = ?auto_489432 ?auto_489435 ) ) ( not ( = ?auto_489432 ?auto_489436 ) ) ( not ( = ?auto_489432 ?auto_489437 ) ) ( not ( = ?auto_489432 ?auto_489438 ) ) ( not ( = ?auto_489432 ?auto_489439 ) ) ( not ( = ?auto_489432 ?auto_489440 ) ) ( not ( = ?auto_489432 ?auto_489441 ) ) ( not ( = ?auto_489432 ?auto_489442 ) ) ( not ( = ?auto_489432 ?auto_489443 ) ) ( not ( = ?auto_489432 ?auto_489444 ) ) ( not ( = ?auto_489432 ?auto_489445 ) ) ( not ( = ?auto_489432 ?auto_489446 ) ) ( not ( = ?auto_489433 ?auto_489434 ) ) ( not ( = ?auto_489433 ?auto_489435 ) ) ( not ( = ?auto_489433 ?auto_489436 ) ) ( not ( = ?auto_489433 ?auto_489437 ) ) ( not ( = ?auto_489433 ?auto_489438 ) ) ( not ( = ?auto_489433 ?auto_489439 ) ) ( not ( = ?auto_489433 ?auto_489440 ) ) ( not ( = ?auto_489433 ?auto_489441 ) ) ( not ( = ?auto_489433 ?auto_489442 ) ) ( not ( = ?auto_489433 ?auto_489443 ) ) ( not ( = ?auto_489433 ?auto_489444 ) ) ( not ( = ?auto_489433 ?auto_489445 ) ) ( not ( = ?auto_489433 ?auto_489446 ) ) ( not ( = ?auto_489434 ?auto_489435 ) ) ( not ( = ?auto_489434 ?auto_489436 ) ) ( not ( = ?auto_489434 ?auto_489437 ) ) ( not ( = ?auto_489434 ?auto_489438 ) ) ( not ( = ?auto_489434 ?auto_489439 ) ) ( not ( = ?auto_489434 ?auto_489440 ) ) ( not ( = ?auto_489434 ?auto_489441 ) ) ( not ( = ?auto_489434 ?auto_489442 ) ) ( not ( = ?auto_489434 ?auto_489443 ) ) ( not ( = ?auto_489434 ?auto_489444 ) ) ( not ( = ?auto_489434 ?auto_489445 ) ) ( not ( = ?auto_489434 ?auto_489446 ) ) ( not ( = ?auto_489435 ?auto_489436 ) ) ( not ( = ?auto_489435 ?auto_489437 ) ) ( not ( = ?auto_489435 ?auto_489438 ) ) ( not ( = ?auto_489435 ?auto_489439 ) ) ( not ( = ?auto_489435 ?auto_489440 ) ) ( not ( = ?auto_489435 ?auto_489441 ) ) ( not ( = ?auto_489435 ?auto_489442 ) ) ( not ( = ?auto_489435 ?auto_489443 ) ) ( not ( = ?auto_489435 ?auto_489444 ) ) ( not ( = ?auto_489435 ?auto_489445 ) ) ( not ( = ?auto_489435 ?auto_489446 ) ) ( not ( = ?auto_489436 ?auto_489437 ) ) ( not ( = ?auto_489436 ?auto_489438 ) ) ( not ( = ?auto_489436 ?auto_489439 ) ) ( not ( = ?auto_489436 ?auto_489440 ) ) ( not ( = ?auto_489436 ?auto_489441 ) ) ( not ( = ?auto_489436 ?auto_489442 ) ) ( not ( = ?auto_489436 ?auto_489443 ) ) ( not ( = ?auto_489436 ?auto_489444 ) ) ( not ( = ?auto_489436 ?auto_489445 ) ) ( not ( = ?auto_489436 ?auto_489446 ) ) ( not ( = ?auto_489437 ?auto_489438 ) ) ( not ( = ?auto_489437 ?auto_489439 ) ) ( not ( = ?auto_489437 ?auto_489440 ) ) ( not ( = ?auto_489437 ?auto_489441 ) ) ( not ( = ?auto_489437 ?auto_489442 ) ) ( not ( = ?auto_489437 ?auto_489443 ) ) ( not ( = ?auto_489437 ?auto_489444 ) ) ( not ( = ?auto_489437 ?auto_489445 ) ) ( not ( = ?auto_489437 ?auto_489446 ) ) ( not ( = ?auto_489438 ?auto_489439 ) ) ( not ( = ?auto_489438 ?auto_489440 ) ) ( not ( = ?auto_489438 ?auto_489441 ) ) ( not ( = ?auto_489438 ?auto_489442 ) ) ( not ( = ?auto_489438 ?auto_489443 ) ) ( not ( = ?auto_489438 ?auto_489444 ) ) ( not ( = ?auto_489438 ?auto_489445 ) ) ( not ( = ?auto_489438 ?auto_489446 ) ) ( not ( = ?auto_489439 ?auto_489440 ) ) ( not ( = ?auto_489439 ?auto_489441 ) ) ( not ( = ?auto_489439 ?auto_489442 ) ) ( not ( = ?auto_489439 ?auto_489443 ) ) ( not ( = ?auto_489439 ?auto_489444 ) ) ( not ( = ?auto_489439 ?auto_489445 ) ) ( not ( = ?auto_489439 ?auto_489446 ) ) ( not ( = ?auto_489440 ?auto_489441 ) ) ( not ( = ?auto_489440 ?auto_489442 ) ) ( not ( = ?auto_489440 ?auto_489443 ) ) ( not ( = ?auto_489440 ?auto_489444 ) ) ( not ( = ?auto_489440 ?auto_489445 ) ) ( not ( = ?auto_489440 ?auto_489446 ) ) ( not ( = ?auto_489441 ?auto_489442 ) ) ( not ( = ?auto_489441 ?auto_489443 ) ) ( not ( = ?auto_489441 ?auto_489444 ) ) ( not ( = ?auto_489441 ?auto_489445 ) ) ( not ( = ?auto_489441 ?auto_489446 ) ) ( not ( = ?auto_489442 ?auto_489443 ) ) ( not ( = ?auto_489442 ?auto_489444 ) ) ( not ( = ?auto_489442 ?auto_489445 ) ) ( not ( = ?auto_489442 ?auto_489446 ) ) ( not ( = ?auto_489443 ?auto_489444 ) ) ( not ( = ?auto_489443 ?auto_489445 ) ) ( not ( = ?auto_489443 ?auto_489446 ) ) ( not ( = ?auto_489444 ?auto_489445 ) ) ( not ( = ?auto_489444 ?auto_489446 ) ) ( not ( = ?auto_489445 ?auto_489446 ) ) ( ON ?auto_489444 ?auto_489445 ) ( ON ?auto_489443 ?auto_489444 ) ( ON ?auto_489442 ?auto_489443 ) ( ON ?auto_489441 ?auto_489442 ) ( ON ?auto_489440 ?auto_489441 ) ( ON ?auto_489439 ?auto_489440 ) ( CLEAR ?auto_489437 ) ( ON ?auto_489438 ?auto_489439 ) ( CLEAR ?auto_489438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_489430 ?auto_489431 ?auto_489432 ?auto_489433 ?auto_489434 ?auto_489435 ?auto_489436 ?auto_489437 ?auto_489438 )
      ( MAKE-16PILE ?auto_489430 ?auto_489431 ?auto_489432 ?auto_489433 ?auto_489434 ?auto_489435 ?auto_489436 ?auto_489437 ?auto_489438 ?auto_489439 ?auto_489440 ?auto_489441 ?auto_489442 ?auto_489443 ?auto_489444 ?auto_489445 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489463 - BLOCK
      ?auto_489464 - BLOCK
      ?auto_489465 - BLOCK
      ?auto_489466 - BLOCK
      ?auto_489467 - BLOCK
      ?auto_489468 - BLOCK
      ?auto_489469 - BLOCK
      ?auto_489470 - BLOCK
      ?auto_489471 - BLOCK
      ?auto_489472 - BLOCK
      ?auto_489473 - BLOCK
      ?auto_489474 - BLOCK
      ?auto_489475 - BLOCK
      ?auto_489476 - BLOCK
      ?auto_489477 - BLOCK
      ?auto_489478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489478 ) ( ON-TABLE ?auto_489463 ) ( ON ?auto_489464 ?auto_489463 ) ( ON ?auto_489465 ?auto_489464 ) ( ON ?auto_489466 ?auto_489465 ) ( ON ?auto_489467 ?auto_489466 ) ( ON ?auto_489468 ?auto_489467 ) ( ON ?auto_489469 ?auto_489468 ) ( ON ?auto_489470 ?auto_489469 ) ( not ( = ?auto_489463 ?auto_489464 ) ) ( not ( = ?auto_489463 ?auto_489465 ) ) ( not ( = ?auto_489463 ?auto_489466 ) ) ( not ( = ?auto_489463 ?auto_489467 ) ) ( not ( = ?auto_489463 ?auto_489468 ) ) ( not ( = ?auto_489463 ?auto_489469 ) ) ( not ( = ?auto_489463 ?auto_489470 ) ) ( not ( = ?auto_489463 ?auto_489471 ) ) ( not ( = ?auto_489463 ?auto_489472 ) ) ( not ( = ?auto_489463 ?auto_489473 ) ) ( not ( = ?auto_489463 ?auto_489474 ) ) ( not ( = ?auto_489463 ?auto_489475 ) ) ( not ( = ?auto_489463 ?auto_489476 ) ) ( not ( = ?auto_489463 ?auto_489477 ) ) ( not ( = ?auto_489463 ?auto_489478 ) ) ( not ( = ?auto_489464 ?auto_489465 ) ) ( not ( = ?auto_489464 ?auto_489466 ) ) ( not ( = ?auto_489464 ?auto_489467 ) ) ( not ( = ?auto_489464 ?auto_489468 ) ) ( not ( = ?auto_489464 ?auto_489469 ) ) ( not ( = ?auto_489464 ?auto_489470 ) ) ( not ( = ?auto_489464 ?auto_489471 ) ) ( not ( = ?auto_489464 ?auto_489472 ) ) ( not ( = ?auto_489464 ?auto_489473 ) ) ( not ( = ?auto_489464 ?auto_489474 ) ) ( not ( = ?auto_489464 ?auto_489475 ) ) ( not ( = ?auto_489464 ?auto_489476 ) ) ( not ( = ?auto_489464 ?auto_489477 ) ) ( not ( = ?auto_489464 ?auto_489478 ) ) ( not ( = ?auto_489465 ?auto_489466 ) ) ( not ( = ?auto_489465 ?auto_489467 ) ) ( not ( = ?auto_489465 ?auto_489468 ) ) ( not ( = ?auto_489465 ?auto_489469 ) ) ( not ( = ?auto_489465 ?auto_489470 ) ) ( not ( = ?auto_489465 ?auto_489471 ) ) ( not ( = ?auto_489465 ?auto_489472 ) ) ( not ( = ?auto_489465 ?auto_489473 ) ) ( not ( = ?auto_489465 ?auto_489474 ) ) ( not ( = ?auto_489465 ?auto_489475 ) ) ( not ( = ?auto_489465 ?auto_489476 ) ) ( not ( = ?auto_489465 ?auto_489477 ) ) ( not ( = ?auto_489465 ?auto_489478 ) ) ( not ( = ?auto_489466 ?auto_489467 ) ) ( not ( = ?auto_489466 ?auto_489468 ) ) ( not ( = ?auto_489466 ?auto_489469 ) ) ( not ( = ?auto_489466 ?auto_489470 ) ) ( not ( = ?auto_489466 ?auto_489471 ) ) ( not ( = ?auto_489466 ?auto_489472 ) ) ( not ( = ?auto_489466 ?auto_489473 ) ) ( not ( = ?auto_489466 ?auto_489474 ) ) ( not ( = ?auto_489466 ?auto_489475 ) ) ( not ( = ?auto_489466 ?auto_489476 ) ) ( not ( = ?auto_489466 ?auto_489477 ) ) ( not ( = ?auto_489466 ?auto_489478 ) ) ( not ( = ?auto_489467 ?auto_489468 ) ) ( not ( = ?auto_489467 ?auto_489469 ) ) ( not ( = ?auto_489467 ?auto_489470 ) ) ( not ( = ?auto_489467 ?auto_489471 ) ) ( not ( = ?auto_489467 ?auto_489472 ) ) ( not ( = ?auto_489467 ?auto_489473 ) ) ( not ( = ?auto_489467 ?auto_489474 ) ) ( not ( = ?auto_489467 ?auto_489475 ) ) ( not ( = ?auto_489467 ?auto_489476 ) ) ( not ( = ?auto_489467 ?auto_489477 ) ) ( not ( = ?auto_489467 ?auto_489478 ) ) ( not ( = ?auto_489468 ?auto_489469 ) ) ( not ( = ?auto_489468 ?auto_489470 ) ) ( not ( = ?auto_489468 ?auto_489471 ) ) ( not ( = ?auto_489468 ?auto_489472 ) ) ( not ( = ?auto_489468 ?auto_489473 ) ) ( not ( = ?auto_489468 ?auto_489474 ) ) ( not ( = ?auto_489468 ?auto_489475 ) ) ( not ( = ?auto_489468 ?auto_489476 ) ) ( not ( = ?auto_489468 ?auto_489477 ) ) ( not ( = ?auto_489468 ?auto_489478 ) ) ( not ( = ?auto_489469 ?auto_489470 ) ) ( not ( = ?auto_489469 ?auto_489471 ) ) ( not ( = ?auto_489469 ?auto_489472 ) ) ( not ( = ?auto_489469 ?auto_489473 ) ) ( not ( = ?auto_489469 ?auto_489474 ) ) ( not ( = ?auto_489469 ?auto_489475 ) ) ( not ( = ?auto_489469 ?auto_489476 ) ) ( not ( = ?auto_489469 ?auto_489477 ) ) ( not ( = ?auto_489469 ?auto_489478 ) ) ( not ( = ?auto_489470 ?auto_489471 ) ) ( not ( = ?auto_489470 ?auto_489472 ) ) ( not ( = ?auto_489470 ?auto_489473 ) ) ( not ( = ?auto_489470 ?auto_489474 ) ) ( not ( = ?auto_489470 ?auto_489475 ) ) ( not ( = ?auto_489470 ?auto_489476 ) ) ( not ( = ?auto_489470 ?auto_489477 ) ) ( not ( = ?auto_489470 ?auto_489478 ) ) ( not ( = ?auto_489471 ?auto_489472 ) ) ( not ( = ?auto_489471 ?auto_489473 ) ) ( not ( = ?auto_489471 ?auto_489474 ) ) ( not ( = ?auto_489471 ?auto_489475 ) ) ( not ( = ?auto_489471 ?auto_489476 ) ) ( not ( = ?auto_489471 ?auto_489477 ) ) ( not ( = ?auto_489471 ?auto_489478 ) ) ( not ( = ?auto_489472 ?auto_489473 ) ) ( not ( = ?auto_489472 ?auto_489474 ) ) ( not ( = ?auto_489472 ?auto_489475 ) ) ( not ( = ?auto_489472 ?auto_489476 ) ) ( not ( = ?auto_489472 ?auto_489477 ) ) ( not ( = ?auto_489472 ?auto_489478 ) ) ( not ( = ?auto_489473 ?auto_489474 ) ) ( not ( = ?auto_489473 ?auto_489475 ) ) ( not ( = ?auto_489473 ?auto_489476 ) ) ( not ( = ?auto_489473 ?auto_489477 ) ) ( not ( = ?auto_489473 ?auto_489478 ) ) ( not ( = ?auto_489474 ?auto_489475 ) ) ( not ( = ?auto_489474 ?auto_489476 ) ) ( not ( = ?auto_489474 ?auto_489477 ) ) ( not ( = ?auto_489474 ?auto_489478 ) ) ( not ( = ?auto_489475 ?auto_489476 ) ) ( not ( = ?auto_489475 ?auto_489477 ) ) ( not ( = ?auto_489475 ?auto_489478 ) ) ( not ( = ?auto_489476 ?auto_489477 ) ) ( not ( = ?auto_489476 ?auto_489478 ) ) ( not ( = ?auto_489477 ?auto_489478 ) ) ( ON ?auto_489477 ?auto_489478 ) ( ON ?auto_489476 ?auto_489477 ) ( ON ?auto_489475 ?auto_489476 ) ( ON ?auto_489474 ?auto_489475 ) ( ON ?auto_489473 ?auto_489474 ) ( ON ?auto_489472 ?auto_489473 ) ( CLEAR ?auto_489470 ) ( ON ?auto_489471 ?auto_489472 ) ( CLEAR ?auto_489471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_489463 ?auto_489464 ?auto_489465 ?auto_489466 ?auto_489467 ?auto_489468 ?auto_489469 ?auto_489470 ?auto_489471 )
      ( MAKE-16PILE ?auto_489463 ?auto_489464 ?auto_489465 ?auto_489466 ?auto_489467 ?auto_489468 ?auto_489469 ?auto_489470 ?auto_489471 ?auto_489472 ?auto_489473 ?auto_489474 ?auto_489475 ?auto_489476 ?auto_489477 ?auto_489478 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489495 - BLOCK
      ?auto_489496 - BLOCK
      ?auto_489497 - BLOCK
      ?auto_489498 - BLOCK
      ?auto_489499 - BLOCK
      ?auto_489500 - BLOCK
      ?auto_489501 - BLOCK
      ?auto_489502 - BLOCK
      ?auto_489503 - BLOCK
      ?auto_489504 - BLOCK
      ?auto_489505 - BLOCK
      ?auto_489506 - BLOCK
      ?auto_489507 - BLOCK
      ?auto_489508 - BLOCK
      ?auto_489509 - BLOCK
      ?auto_489510 - BLOCK
    )
    :vars
    (
      ?auto_489511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489510 ?auto_489511 ) ( ON-TABLE ?auto_489495 ) ( ON ?auto_489496 ?auto_489495 ) ( ON ?auto_489497 ?auto_489496 ) ( ON ?auto_489498 ?auto_489497 ) ( ON ?auto_489499 ?auto_489498 ) ( ON ?auto_489500 ?auto_489499 ) ( ON ?auto_489501 ?auto_489500 ) ( not ( = ?auto_489495 ?auto_489496 ) ) ( not ( = ?auto_489495 ?auto_489497 ) ) ( not ( = ?auto_489495 ?auto_489498 ) ) ( not ( = ?auto_489495 ?auto_489499 ) ) ( not ( = ?auto_489495 ?auto_489500 ) ) ( not ( = ?auto_489495 ?auto_489501 ) ) ( not ( = ?auto_489495 ?auto_489502 ) ) ( not ( = ?auto_489495 ?auto_489503 ) ) ( not ( = ?auto_489495 ?auto_489504 ) ) ( not ( = ?auto_489495 ?auto_489505 ) ) ( not ( = ?auto_489495 ?auto_489506 ) ) ( not ( = ?auto_489495 ?auto_489507 ) ) ( not ( = ?auto_489495 ?auto_489508 ) ) ( not ( = ?auto_489495 ?auto_489509 ) ) ( not ( = ?auto_489495 ?auto_489510 ) ) ( not ( = ?auto_489495 ?auto_489511 ) ) ( not ( = ?auto_489496 ?auto_489497 ) ) ( not ( = ?auto_489496 ?auto_489498 ) ) ( not ( = ?auto_489496 ?auto_489499 ) ) ( not ( = ?auto_489496 ?auto_489500 ) ) ( not ( = ?auto_489496 ?auto_489501 ) ) ( not ( = ?auto_489496 ?auto_489502 ) ) ( not ( = ?auto_489496 ?auto_489503 ) ) ( not ( = ?auto_489496 ?auto_489504 ) ) ( not ( = ?auto_489496 ?auto_489505 ) ) ( not ( = ?auto_489496 ?auto_489506 ) ) ( not ( = ?auto_489496 ?auto_489507 ) ) ( not ( = ?auto_489496 ?auto_489508 ) ) ( not ( = ?auto_489496 ?auto_489509 ) ) ( not ( = ?auto_489496 ?auto_489510 ) ) ( not ( = ?auto_489496 ?auto_489511 ) ) ( not ( = ?auto_489497 ?auto_489498 ) ) ( not ( = ?auto_489497 ?auto_489499 ) ) ( not ( = ?auto_489497 ?auto_489500 ) ) ( not ( = ?auto_489497 ?auto_489501 ) ) ( not ( = ?auto_489497 ?auto_489502 ) ) ( not ( = ?auto_489497 ?auto_489503 ) ) ( not ( = ?auto_489497 ?auto_489504 ) ) ( not ( = ?auto_489497 ?auto_489505 ) ) ( not ( = ?auto_489497 ?auto_489506 ) ) ( not ( = ?auto_489497 ?auto_489507 ) ) ( not ( = ?auto_489497 ?auto_489508 ) ) ( not ( = ?auto_489497 ?auto_489509 ) ) ( not ( = ?auto_489497 ?auto_489510 ) ) ( not ( = ?auto_489497 ?auto_489511 ) ) ( not ( = ?auto_489498 ?auto_489499 ) ) ( not ( = ?auto_489498 ?auto_489500 ) ) ( not ( = ?auto_489498 ?auto_489501 ) ) ( not ( = ?auto_489498 ?auto_489502 ) ) ( not ( = ?auto_489498 ?auto_489503 ) ) ( not ( = ?auto_489498 ?auto_489504 ) ) ( not ( = ?auto_489498 ?auto_489505 ) ) ( not ( = ?auto_489498 ?auto_489506 ) ) ( not ( = ?auto_489498 ?auto_489507 ) ) ( not ( = ?auto_489498 ?auto_489508 ) ) ( not ( = ?auto_489498 ?auto_489509 ) ) ( not ( = ?auto_489498 ?auto_489510 ) ) ( not ( = ?auto_489498 ?auto_489511 ) ) ( not ( = ?auto_489499 ?auto_489500 ) ) ( not ( = ?auto_489499 ?auto_489501 ) ) ( not ( = ?auto_489499 ?auto_489502 ) ) ( not ( = ?auto_489499 ?auto_489503 ) ) ( not ( = ?auto_489499 ?auto_489504 ) ) ( not ( = ?auto_489499 ?auto_489505 ) ) ( not ( = ?auto_489499 ?auto_489506 ) ) ( not ( = ?auto_489499 ?auto_489507 ) ) ( not ( = ?auto_489499 ?auto_489508 ) ) ( not ( = ?auto_489499 ?auto_489509 ) ) ( not ( = ?auto_489499 ?auto_489510 ) ) ( not ( = ?auto_489499 ?auto_489511 ) ) ( not ( = ?auto_489500 ?auto_489501 ) ) ( not ( = ?auto_489500 ?auto_489502 ) ) ( not ( = ?auto_489500 ?auto_489503 ) ) ( not ( = ?auto_489500 ?auto_489504 ) ) ( not ( = ?auto_489500 ?auto_489505 ) ) ( not ( = ?auto_489500 ?auto_489506 ) ) ( not ( = ?auto_489500 ?auto_489507 ) ) ( not ( = ?auto_489500 ?auto_489508 ) ) ( not ( = ?auto_489500 ?auto_489509 ) ) ( not ( = ?auto_489500 ?auto_489510 ) ) ( not ( = ?auto_489500 ?auto_489511 ) ) ( not ( = ?auto_489501 ?auto_489502 ) ) ( not ( = ?auto_489501 ?auto_489503 ) ) ( not ( = ?auto_489501 ?auto_489504 ) ) ( not ( = ?auto_489501 ?auto_489505 ) ) ( not ( = ?auto_489501 ?auto_489506 ) ) ( not ( = ?auto_489501 ?auto_489507 ) ) ( not ( = ?auto_489501 ?auto_489508 ) ) ( not ( = ?auto_489501 ?auto_489509 ) ) ( not ( = ?auto_489501 ?auto_489510 ) ) ( not ( = ?auto_489501 ?auto_489511 ) ) ( not ( = ?auto_489502 ?auto_489503 ) ) ( not ( = ?auto_489502 ?auto_489504 ) ) ( not ( = ?auto_489502 ?auto_489505 ) ) ( not ( = ?auto_489502 ?auto_489506 ) ) ( not ( = ?auto_489502 ?auto_489507 ) ) ( not ( = ?auto_489502 ?auto_489508 ) ) ( not ( = ?auto_489502 ?auto_489509 ) ) ( not ( = ?auto_489502 ?auto_489510 ) ) ( not ( = ?auto_489502 ?auto_489511 ) ) ( not ( = ?auto_489503 ?auto_489504 ) ) ( not ( = ?auto_489503 ?auto_489505 ) ) ( not ( = ?auto_489503 ?auto_489506 ) ) ( not ( = ?auto_489503 ?auto_489507 ) ) ( not ( = ?auto_489503 ?auto_489508 ) ) ( not ( = ?auto_489503 ?auto_489509 ) ) ( not ( = ?auto_489503 ?auto_489510 ) ) ( not ( = ?auto_489503 ?auto_489511 ) ) ( not ( = ?auto_489504 ?auto_489505 ) ) ( not ( = ?auto_489504 ?auto_489506 ) ) ( not ( = ?auto_489504 ?auto_489507 ) ) ( not ( = ?auto_489504 ?auto_489508 ) ) ( not ( = ?auto_489504 ?auto_489509 ) ) ( not ( = ?auto_489504 ?auto_489510 ) ) ( not ( = ?auto_489504 ?auto_489511 ) ) ( not ( = ?auto_489505 ?auto_489506 ) ) ( not ( = ?auto_489505 ?auto_489507 ) ) ( not ( = ?auto_489505 ?auto_489508 ) ) ( not ( = ?auto_489505 ?auto_489509 ) ) ( not ( = ?auto_489505 ?auto_489510 ) ) ( not ( = ?auto_489505 ?auto_489511 ) ) ( not ( = ?auto_489506 ?auto_489507 ) ) ( not ( = ?auto_489506 ?auto_489508 ) ) ( not ( = ?auto_489506 ?auto_489509 ) ) ( not ( = ?auto_489506 ?auto_489510 ) ) ( not ( = ?auto_489506 ?auto_489511 ) ) ( not ( = ?auto_489507 ?auto_489508 ) ) ( not ( = ?auto_489507 ?auto_489509 ) ) ( not ( = ?auto_489507 ?auto_489510 ) ) ( not ( = ?auto_489507 ?auto_489511 ) ) ( not ( = ?auto_489508 ?auto_489509 ) ) ( not ( = ?auto_489508 ?auto_489510 ) ) ( not ( = ?auto_489508 ?auto_489511 ) ) ( not ( = ?auto_489509 ?auto_489510 ) ) ( not ( = ?auto_489509 ?auto_489511 ) ) ( not ( = ?auto_489510 ?auto_489511 ) ) ( ON ?auto_489509 ?auto_489510 ) ( ON ?auto_489508 ?auto_489509 ) ( ON ?auto_489507 ?auto_489508 ) ( ON ?auto_489506 ?auto_489507 ) ( ON ?auto_489505 ?auto_489506 ) ( ON ?auto_489504 ?auto_489505 ) ( ON ?auto_489503 ?auto_489504 ) ( CLEAR ?auto_489501 ) ( ON ?auto_489502 ?auto_489503 ) ( CLEAR ?auto_489502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_489495 ?auto_489496 ?auto_489497 ?auto_489498 ?auto_489499 ?auto_489500 ?auto_489501 ?auto_489502 )
      ( MAKE-16PILE ?auto_489495 ?auto_489496 ?auto_489497 ?auto_489498 ?auto_489499 ?auto_489500 ?auto_489501 ?auto_489502 ?auto_489503 ?auto_489504 ?auto_489505 ?auto_489506 ?auto_489507 ?auto_489508 ?auto_489509 ?auto_489510 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489528 - BLOCK
      ?auto_489529 - BLOCK
      ?auto_489530 - BLOCK
      ?auto_489531 - BLOCK
      ?auto_489532 - BLOCK
      ?auto_489533 - BLOCK
      ?auto_489534 - BLOCK
      ?auto_489535 - BLOCK
      ?auto_489536 - BLOCK
      ?auto_489537 - BLOCK
      ?auto_489538 - BLOCK
      ?auto_489539 - BLOCK
      ?auto_489540 - BLOCK
      ?auto_489541 - BLOCK
      ?auto_489542 - BLOCK
      ?auto_489543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489543 ) ( ON-TABLE ?auto_489528 ) ( ON ?auto_489529 ?auto_489528 ) ( ON ?auto_489530 ?auto_489529 ) ( ON ?auto_489531 ?auto_489530 ) ( ON ?auto_489532 ?auto_489531 ) ( ON ?auto_489533 ?auto_489532 ) ( ON ?auto_489534 ?auto_489533 ) ( not ( = ?auto_489528 ?auto_489529 ) ) ( not ( = ?auto_489528 ?auto_489530 ) ) ( not ( = ?auto_489528 ?auto_489531 ) ) ( not ( = ?auto_489528 ?auto_489532 ) ) ( not ( = ?auto_489528 ?auto_489533 ) ) ( not ( = ?auto_489528 ?auto_489534 ) ) ( not ( = ?auto_489528 ?auto_489535 ) ) ( not ( = ?auto_489528 ?auto_489536 ) ) ( not ( = ?auto_489528 ?auto_489537 ) ) ( not ( = ?auto_489528 ?auto_489538 ) ) ( not ( = ?auto_489528 ?auto_489539 ) ) ( not ( = ?auto_489528 ?auto_489540 ) ) ( not ( = ?auto_489528 ?auto_489541 ) ) ( not ( = ?auto_489528 ?auto_489542 ) ) ( not ( = ?auto_489528 ?auto_489543 ) ) ( not ( = ?auto_489529 ?auto_489530 ) ) ( not ( = ?auto_489529 ?auto_489531 ) ) ( not ( = ?auto_489529 ?auto_489532 ) ) ( not ( = ?auto_489529 ?auto_489533 ) ) ( not ( = ?auto_489529 ?auto_489534 ) ) ( not ( = ?auto_489529 ?auto_489535 ) ) ( not ( = ?auto_489529 ?auto_489536 ) ) ( not ( = ?auto_489529 ?auto_489537 ) ) ( not ( = ?auto_489529 ?auto_489538 ) ) ( not ( = ?auto_489529 ?auto_489539 ) ) ( not ( = ?auto_489529 ?auto_489540 ) ) ( not ( = ?auto_489529 ?auto_489541 ) ) ( not ( = ?auto_489529 ?auto_489542 ) ) ( not ( = ?auto_489529 ?auto_489543 ) ) ( not ( = ?auto_489530 ?auto_489531 ) ) ( not ( = ?auto_489530 ?auto_489532 ) ) ( not ( = ?auto_489530 ?auto_489533 ) ) ( not ( = ?auto_489530 ?auto_489534 ) ) ( not ( = ?auto_489530 ?auto_489535 ) ) ( not ( = ?auto_489530 ?auto_489536 ) ) ( not ( = ?auto_489530 ?auto_489537 ) ) ( not ( = ?auto_489530 ?auto_489538 ) ) ( not ( = ?auto_489530 ?auto_489539 ) ) ( not ( = ?auto_489530 ?auto_489540 ) ) ( not ( = ?auto_489530 ?auto_489541 ) ) ( not ( = ?auto_489530 ?auto_489542 ) ) ( not ( = ?auto_489530 ?auto_489543 ) ) ( not ( = ?auto_489531 ?auto_489532 ) ) ( not ( = ?auto_489531 ?auto_489533 ) ) ( not ( = ?auto_489531 ?auto_489534 ) ) ( not ( = ?auto_489531 ?auto_489535 ) ) ( not ( = ?auto_489531 ?auto_489536 ) ) ( not ( = ?auto_489531 ?auto_489537 ) ) ( not ( = ?auto_489531 ?auto_489538 ) ) ( not ( = ?auto_489531 ?auto_489539 ) ) ( not ( = ?auto_489531 ?auto_489540 ) ) ( not ( = ?auto_489531 ?auto_489541 ) ) ( not ( = ?auto_489531 ?auto_489542 ) ) ( not ( = ?auto_489531 ?auto_489543 ) ) ( not ( = ?auto_489532 ?auto_489533 ) ) ( not ( = ?auto_489532 ?auto_489534 ) ) ( not ( = ?auto_489532 ?auto_489535 ) ) ( not ( = ?auto_489532 ?auto_489536 ) ) ( not ( = ?auto_489532 ?auto_489537 ) ) ( not ( = ?auto_489532 ?auto_489538 ) ) ( not ( = ?auto_489532 ?auto_489539 ) ) ( not ( = ?auto_489532 ?auto_489540 ) ) ( not ( = ?auto_489532 ?auto_489541 ) ) ( not ( = ?auto_489532 ?auto_489542 ) ) ( not ( = ?auto_489532 ?auto_489543 ) ) ( not ( = ?auto_489533 ?auto_489534 ) ) ( not ( = ?auto_489533 ?auto_489535 ) ) ( not ( = ?auto_489533 ?auto_489536 ) ) ( not ( = ?auto_489533 ?auto_489537 ) ) ( not ( = ?auto_489533 ?auto_489538 ) ) ( not ( = ?auto_489533 ?auto_489539 ) ) ( not ( = ?auto_489533 ?auto_489540 ) ) ( not ( = ?auto_489533 ?auto_489541 ) ) ( not ( = ?auto_489533 ?auto_489542 ) ) ( not ( = ?auto_489533 ?auto_489543 ) ) ( not ( = ?auto_489534 ?auto_489535 ) ) ( not ( = ?auto_489534 ?auto_489536 ) ) ( not ( = ?auto_489534 ?auto_489537 ) ) ( not ( = ?auto_489534 ?auto_489538 ) ) ( not ( = ?auto_489534 ?auto_489539 ) ) ( not ( = ?auto_489534 ?auto_489540 ) ) ( not ( = ?auto_489534 ?auto_489541 ) ) ( not ( = ?auto_489534 ?auto_489542 ) ) ( not ( = ?auto_489534 ?auto_489543 ) ) ( not ( = ?auto_489535 ?auto_489536 ) ) ( not ( = ?auto_489535 ?auto_489537 ) ) ( not ( = ?auto_489535 ?auto_489538 ) ) ( not ( = ?auto_489535 ?auto_489539 ) ) ( not ( = ?auto_489535 ?auto_489540 ) ) ( not ( = ?auto_489535 ?auto_489541 ) ) ( not ( = ?auto_489535 ?auto_489542 ) ) ( not ( = ?auto_489535 ?auto_489543 ) ) ( not ( = ?auto_489536 ?auto_489537 ) ) ( not ( = ?auto_489536 ?auto_489538 ) ) ( not ( = ?auto_489536 ?auto_489539 ) ) ( not ( = ?auto_489536 ?auto_489540 ) ) ( not ( = ?auto_489536 ?auto_489541 ) ) ( not ( = ?auto_489536 ?auto_489542 ) ) ( not ( = ?auto_489536 ?auto_489543 ) ) ( not ( = ?auto_489537 ?auto_489538 ) ) ( not ( = ?auto_489537 ?auto_489539 ) ) ( not ( = ?auto_489537 ?auto_489540 ) ) ( not ( = ?auto_489537 ?auto_489541 ) ) ( not ( = ?auto_489537 ?auto_489542 ) ) ( not ( = ?auto_489537 ?auto_489543 ) ) ( not ( = ?auto_489538 ?auto_489539 ) ) ( not ( = ?auto_489538 ?auto_489540 ) ) ( not ( = ?auto_489538 ?auto_489541 ) ) ( not ( = ?auto_489538 ?auto_489542 ) ) ( not ( = ?auto_489538 ?auto_489543 ) ) ( not ( = ?auto_489539 ?auto_489540 ) ) ( not ( = ?auto_489539 ?auto_489541 ) ) ( not ( = ?auto_489539 ?auto_489542 ) ) ( not ( = ?auto_489539 ?auto_489543 ) ) ( not ( = ?auto_489540 ?auto_489541 ) ) ( not ( = ?auto_489540 ?auto_489542 ) ) ( not ( = ?auto_489540 ?auto_489543 ) ) ( not ( = ?auto_489541 ?auto_489542 ) ) ( not ( = ?auto_489541 ?auto_489543 ) ) ( not ( = ?auto_489542 ?auto_489543 ) ) ( ON ?auto_489542 ?auto_489543 ) ( ON ?auto_489541 ?auto_489542 ) ( ON ?auto_489540 ?auto_489541 ) ( ON ?auto_489539 ?auto_489540 ) ( ON ?auto_489538 ?auto_489539 ) ( ON ?auto_489537 ?auto_489538 ) ( ON ?auto_489536 ?auto_489537 ) ( CLEAR ?auto_489534 ) ( ON ?auto_489535 ?auto_489536 ) ( CLEAR ?auto_489535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_489528 ?auto_489529 ?auto_489530 ?auto_489531 ?auto_489532 ?auto_489533 ?auto_489534 ?auto_489535 )
      ( MAKE-16PILE ?auto_489528 ?auto_489529 ?auto_489530 ?auto_489531 ?auto_489532 ?auto_489533 ?auto_489534 ?auto_489535 ?auto_489536 ?auto_489537 ?auto_489538 ?auto_489539 ?auto_489540 ?auto_489541 ?auto_489542 ?auto_489543 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489560 - BLOCK
      ?auto_489561 - BLOCK
      ?auto_489562 - BLOCK
      ?auto_489563 - BLOCK
      ?auto_489564 - BLOCK
      ?auto_489565 - BLOCK
      ?auto_489566 - BLOCK
      ?auto_489567 - BLOCK
      ?auto_489568 - BLOCK
      ?auto_489569 - BLOCK
      ?auto_489570 - BLOCK
      ?auto_489571 - BLOCK
      ?auto_489572 - BLOCK
      ?auto_489573 - BLOCK
      ?auto_489574 - BLOCK
      ?auto_489575 - BLOCK
    )
    :vars
    (
      ?auto_489576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489575 ?auto_489576 ) ( ON-TABLE ?auto_489560 ) ( ON ?auto_489561 ?auto_489560 ) ( ON ?auto_489562 ?auto_489561 ) ( ON ?auto_489563 ?auto_489562 ) ( ON ?auto_489564 ?auto_489563 ) ( ON ?auto_489565 ?auto_489564 ) ( not ( = ?auto_489560 ?auto_489561 ) ) ( not ( = ?auto_489560 ?auto_489562 ) ) ( not ( = ?auto_489560 ?auto_489563 ) ) ( not ( = ?auto_489560 ?auto_489564 ) ) ( not ( = ?auto_489560 ?auto_489565 ) ) ( not ( = ?auto_489560 ?auto_489566 ) ) ( not ( = ?auto_489560 ?auto_489567 ) ) ( not ( = ?auto_489560 ?auto_489568 ) ) ( not ( = ?auto_489560 ?auto_489569 ) ) ( not ( = ?auto_489560 ?auto_489570 ) ) ( not ( = ?auto_489560 ?auto_489571 ) ) ( not ( = ?auto_489560 ?auto_489572 ) ) ( not ( = ?auto_489560 ?auto_489573 ) ) ( not ( = ?auto_489560 ?auto_489574 ) ) ( not ( = ?auto_489560 ?auto_489575 ) ) ( not ( = ?auto_489560 ?auto_489576 ) ) ( not ( = ?auto_489561 ?auto_489562 ) ) ( not ( = ?auto_489561 ?auto_489563 ) ) ( not ( = ?auto_489561 ?auto_489564 ) ) ( not ( = ?auto_489561 ?auto_489565 ) ) ( not ( = ?auto_489561 ?auto_489566 ) ) ( not ( = ?auto_489561 ?auto_489567 ) ) ( not ( = ?auto_489561 ?auto_489568 ) ) ( not ( = ?auto_489561 ?auto_489569 ) ) ( not ( = ?auto_489561 ?auto_489570 ) ) ( not ( = ?auto_489561 ?auto_489571 ) ) ( not ( = ?auto_489561 ?auto_489572 ) ) ( not ( = ?auto_489561 ?auto_489573 ) ) ( not ( = ?auto_489561 ?auto_489574 ) ) ( not ( = ?auto_489561 ?auto_489575 ) ) ( not ( = ?auto_489561 ?auto_489576 ) ) ( not ( = ?auto_489562 ?auto_489563 ) ) ( not ( = ?auto_489562 ?auto_489564 ) ) ( not ( = ?auto_489562 ?auto_489565 ) ) ( not ( = ?auto_489562 ?auto_489566 ) ) ( not ( = ?auto_489562 ?auto_489567 ) ) ( not ( = ?auto_489562 ?auto_489568 ) ) ( not ( = ?auto_489562 ?auto_489569 ) ) ( not ( = ?auto_489562 ?auto_489570 ) ) ( not ( = ?auto_489562 ?auto_489571 ) ) ( not ( = ?auto_489562 ?auto_489572 ) ) ( not ( = ?auto_489562 ?auto_489573 ) ) ( not ( = ?auto_489562 ?auto_489574 ) ) ( not ( = ?auto_489562 ?auto_489575 ) ) ( not ( = ?auto_489562 ?auto_489576 ) ) ( not ( = ?auto_489563 ?auto_489564 ) ) ( not ( = ?auto_489563 ?auto_489565 ) ) ( not ( = ?auto_489563 ?auto_489566 ) ) ( not ( = ?auto_489563 ?auto_489567 ) ) ( not ( = ?auto_489563 ?auto_489568 ) ) ( not ( = ?auto_489563 ?auto_489569 ) ) ( not ( = ?auto_489563 ?auto_489570 ) ) ( not ( = ?auto_489563 ?auto_489571 ) ) ( not ( = ?auto_489563 ?auto_489572 ) ) ( not ( = ?auto_489563 ?auto_489573 ) ) ( not ( = ?auto_489563 ?auto_489574 ) ) ( not ( = ?auto_489563 ?auto_489575 ) ) ( not ( = ?auto_489563 ?auto_489576 ) ) ( not ( = ?auto_489564 ?auto_489565 ) ) ( not ( = ?auto_489564 ?auto_489566 ) ) ( not ( = ?auto_489564 ?auto_489567 ) ) ( not ( = ?auto_489564 ?auto_489568 ) ) ( not ( = ?auto_489564 ?auto_489569 ) ) ( not ( = ?auto_489564 ?auto_489570 ) ) ( not ( = ?auto_489564 ?auto_489571 ) ) ( not ( = ?auto_489564 ?auto_489572 ) ) ( not ( = ?auto_489564 ?auto_489573 ) ) ( not ( = ?auto_489564 ?auto_489574 ) ) ( not ( = ?auto_489564 ?auto_489575 ) ) ( not ( = ?auto_489564 ?auto_489576 ) ) ( not ( = ?auto_489565 ?auto_489566 ) ) ( not ( = ?auto_489565 ?auto_489567 ) ) ( not ( = ?auto_489565 ?auto_489568 ) ) ( not ( = ?auto_489565 ?auto_489569 ) ) ( not ( = ?auto_489565 ?auto_489570 ) ) ( not ( = ?auto_489565 ?auto_489571 ) ) ( not ( = ?auto_489565 ?auto_489572 ) ) ( not ( = ?auto_489565 ?auto_489573 ) ) ( not ( = ?auto_489565 ?auto_489574 ) ) ( not ( = ?auto_489565 ?auto_489575 ) ) ( not ( = ?auto_489565 ?auto_489576 ) ) ( not ( = ?auto_489566 ?auto_489567 ) ) ( not ( = ?auto_489566 ?auto_489568 ) ) ( not ( = ?auto_489566 ?auto_489569 ) ) ( not ( = ?auto_489566 ?auto_489570 ) ) ( not ( = ?auto_489566 ?auto_489571 ) ) ( not ( = ?auto_489566 ?auto_489572 ) ) ( not ( = ?auto_489566 ?auto_489573 ) ) ( not ( = ?auto_489566 ?auto_489574 ) ) ( not ( = ?auto_489566 ?auto_489575 ) ) ( not ( = ?auto_489566 ?auto_489576 ) ) ( not ( = ?auto_489567 ?auto_489568 ) ) ( not ( = ?auto_489567 ?auto_489569 ) ) ( not ( = ?auto_489567 ?auto_489570 ) ) ( not ( = ?auto_489567 ?auto_489571 ) ) ( not ( = ?auto_489567 ?auto_489572 ) ) ( not ( = ?auto_489567 ?auto_489573 ) ) ( not ( = ?auto_489567 ?auto_489574 ) ) ( not ( = ?auto_489567 ?auto_489575 ) ) ( not ( = ?auto_489567 ?auto_489576 ) ) ( not ( = ?auto_489568 ?auto_489569 ) ) ( not ( = ?auto_489568 ?auto_489570 ) ) ( not ( = ?auto_489568 ?auto_489571 ) ) ( not ( = ?auto_489568 ?auto_489572 ) ) ( not ( = ?auto_489568 ?auto_489573 ) ) ( not ( = ?auto_489568 ?auto_489574 ) ) ( not ( = ?auto_489568 ?auto_489575 ) ) ( not ( = ?auto_489568 ?auto_489576 ) ) ( not ( = ?auto_489569 ?auto_489570 ) ) ( not ( = ?auto_489569 ?auto_489571 ) ) ( not ( = ?auto_489569 ?auto_489572 ) ) ( not ( = ?auto_489569 ?auto_489573 ) ) ( not ( = ?auto_489569 ?auto_489574 ) ) ( not ( = ?auto_489569 ?auto_489575 ) ) ( not ( = ?auto_489569 ?auto_489576 ) ) ( not ( = ?auto_489570 ?auto_489571 ) ) ( not ( = ?auto_489570 ?auto_489572 ) ) ( not ( = ?auto_489570 ?auto_489573 ) ) ( not ( = ?auto_489570 ?auto_489574 ) ) ( not ( = ?auto_489570 ?auto_489575 ) ) ( not ( = ?auto_489570 ?auto_489576 ) ) ( not ( = ?auto_489571 ?auto_489572 ) ) ( not ( = ?auto_489571 ?auto_489573 ) ) ( not ( = ?auto_489571 ?auto_489574 ) ) ( not ( = ?auto_489571 ?auto_489575 ) ) ( not ( = ?auto_489571 ?auto_489576 ) ) ( not ( = ?auto_489572 ?auto_489573 ) ) ( not ( = ?auto_489572 ?auto_489574 ) ) ( not ( = ?auto_489572 ?auto_489575 ) ) ( not ( = ?auto_489572 ?auto_489576 ) ) ( not ( = ?auto_489573 ?auto_489574 ) ) ( not ( = ?auto_489573 ?auto_489575 ) ) ( not ( = ?auto_489573 ?auto_489576 ) ) ( not ( = ?auto_489574 ?auto_489575 ) ) ( not ( = ?auto_489574 ?auto_489576 ) ) ( not ( = ?auto_489575 ?auto_489576 ) ) ( ON ?auto_489574 ?auto_489575 ) ( ON ?auto_489573 ?auto_489574 ) ( ON ?auto_489572 ?auto_489573 ) ( ON ?auto_489571 ?auto_489572 ) ( ON ?auto_489570 ?auto_489571 ) ( ON ?auto_489569 ?auto_489570 ) ( ON ?auto_489568 ?auto_489569 ) ( ON ?auto_489567 ?auto_489568 ) ( CLEAR ?auto_489565 ) ( ON ?auto_489566 ?auto_489567 ) ( CLEAR ?auto_489566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_489560 ?auto_489561 ?auto_489562 ?auto_489563 ?auto_489564 ?auto_489565 ?auto_489566 )
      ( MAKE-16PILE ?auto_489560 ?auto_489561 ?auto_489562 ?auto_489563 ?auto_489564 ?auto_489565 ?auto_489566 ?auto_489567 ?auto_489568 ?auto_489569 ?auto_489570 ?auto_489571 ?auto_489572 ?auto_489573 ?auto_489574 ?auto_489575 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489593 - BLOCK
      ?auto_489594 - BLOCK
      ?auto_489595 - BLOCK
      ?auto_489596 - BLOCK
      ?auto_489597 - BLOCK
      ?auto_489598 - BLOCK
      ?auto_489599 - BLOCK
      ?auto_489600 - BLOCK
      ?auto_489601 - BLOCK
      ?auto_489602 - BLOCK
      ?auto_489603 - BLOCK
      ?auto_489604 - BLOCK
      ?auto_489605 - BLOCK
      ?auto_489606 - BLOCK
      ?auto_489607 - BLOCK
      ?auto_489608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489608 ) ( ON-TABLE ?auto_489593 ) ( ON ?auto_489594 ?auto_489593 ) ( ON ?auto_489595 ?auto_489594 ) ( ON ?auto_489596 ?auto_489595 ) ( ON ?auto_489597 ?auto_489596 ) ( ON ?auto_489598 ?auto_489597 ) ( not ( = ?auto_489593 ?auto_489594 ) ) ( not ( = ?auto_489593 ?auto_489595 ) ) ( not ( = ?auto_489593 ?auto_489596 ) ) ( not ( = ?auto_489593 ?auto_489597 ) ) ( not ( = ?auto_489593 ?auto_489598 ) ) ( not ( = ?auto_489593 ?auto_489599 ) ) ( not ( = ?auto_489593 ?auto_489600 ) ) ( not ( = ?auto_489593 ?auto_489601 ) ) ( not ( = ?auto_489593 ?auto_489602 ) ) ( not ( = ?auto_489593 ?auto_489603 ) ) ( not ( = ?auto_489593 ?auto_489604 ) ) ( not ( = ?auto_489593 ?auto_489605 ) ) ( not ( = ?auto_489593 ?auto_489606 ) ) ( not ( = ?auto_489593 ?auto_489607 ) ) ( not ( = ?auto_489593 ?auto_489608 ) ) ( not ( = ?auto_489594 ?auto_489595 ) ) ( not ( = ?auto_489594 ?auto_489596 ) ) ( not ( = ?auto_489594 ?auto_489597 ) ) ( not ( = ?auto_489594 ?auto_489598 ) ) ( not ( = ?auto_489594 ?auto_489599 ) ) ( not ( = ?auto_489594 ?auto_489600 ) ) ( not ( = ?auto_489594 ?auto_489601 ) ) ( not ( = ?auto_489594 ?auto_489602 ) ) ( not ( = ?auto_489594 ?auto_489603 ) ) ( not ( = ?auto_489594 ?auto_489604 ) ) ( not ( = ?auto_489594 ?auto_489605 ) ) ( not ( = ?auto_489594 ?auto_489606 ) ) ( not ( = ?auto_489594 ?auto_489607 ) ) ( not ( = ?auto_489594 ?auto_489608 ) ) ( not ( = ?auto_489595 ?auto_489596 ) ) ( not ( = ?auto_489595 ?auto_489597 ) ) ( not ( = ?auto_489595 ?auto_489598 ) ) ( not ( = ?auto_489595 ?auto_489599 ) ) ( not ( = ?auto_489595 ?auto_489600 ) ) ( not ( = ?auto_489595 ?auto_489601 ) ) ( not ( = ?auto_489595 ?auto_489602 ) ) ( not ( = ?auto_489595 ?auto_489603 ) ) ( not ( = ?auto_489595 ?auto_489604 ) ) ( not ( = ?auto_489595 ?auto_489605 ) ) ( not ( = ?auto_489595 ?auto_489606 ) ) ( not ( = ?auto_489595 ?auto_489607 ) ) ( not ( = ?auto_489595 ?auto_489608 ) ) ( not ( = ?auto_489596 ?auto_489597 ) ) ( not ( = ?auto_489596 ?auto_489598 ) ) ( not ( = ?auto_489596 ?auto_489599 ) ) ( not ( = ?auto_489596 ?auto_489600 ) ) ( not ( = ?auto_489596 ?auto_489601 ) ) ( not ( = ?auto_489596 ?auto_489602 ) ) ( not ( = ?auto_489596 ?auto_489603 ) ) ( not ( = ?auto_489596 ?auto_489604 ) ) ( not ( = ?auto_489596 ?auto_489605 ) ) ( not ( = ?auto_489596 ?auto_489606 ) ) ( not ( = ?auto_489596 ?auto_489607 ) ) ( not ( = ?auto_489596 ?auto_489608 ) ) ( not ( = ?auto_489597 ?auto_489598 ) ) ( not ( = ?auto_489597 ?auto_489599 ) ) ( not ( = ?auto_489597 ?auto_489600 ) ) ( not ( = ?auto_489597 ?auto_489601 ) ) ( not ( = ?auto_489597 ?auto_489602 ) ) ( not ( = ?auto_489597 ?auto_489603 ) ) ( not ( = ?auto_489597 ?auto_489604 ) ) ( not ( = ?auto_489597 ?auto_489605 ) ) ( not ( = ?auto_489597 ?auto_489606 ) ) ( not ( = ?auto_489597 ?auto_489607 ) ) ( not ( = ?auto_489597 ?auto_489608 ) ) ( not ( = ?auto_489598 ?auto_489599 ) ) ( not ( = ?auto_489598 ?auto_489600 ) ) ( not ( = ?auto_489598 ?auto_489601 ) ) ( not ( = ?auto_489598 ?auto_489602 ) ) ( not ( = ?auto_489598 ?auto_489603 ) ) ( not ( = ?auto_489598 ?auto_489604 ) ) ( not ( = ?auto_489598 ?auto_489605 ) ) ( not ( = ?auto_489598 ?auto_489606 ) ) ( not ( = ?auto_489598 ?auto_489607 ) ) ( not ( = ?auto_489598 ?auto_489608 ) ) ( not ( = ?auto_489599 ?auto_489600 ) ) ( not ( = ?auto_489599 ?auto_489601 ) ) ( not ( = ?auto_489599 ?auto_489602 ) ) ( not ( = ?auto_489599 ?auto_489603 ) ) ( not ( = ?auto_489599 ?auto_489604 ) ) ( not ( = ?auto_489599 ?auto_489605 ) ) ( not ( = ?auto_489599 ?auto_489606 ) ) ( not ( = ?auto_489599 ?auto_489607 ) ) ( not ( = ?auto_489599 ?auto_489608 ) ) ( not ( = ?auto_489600 ?auto_489601 ) ) ( not ( = ?auto_489600 ?auto_489602 ) ) ( not ( = ?auto_489600 ?auto_489603 ) ) ( not ( = ?auto_489600 ?auto_489604 ) ) ( not ( = ?auto_489600 ?auto_489605 ) ) ( not ( = ?auto_489600 ?auto_489606 ) ) ( not ( = ?auto_489600 ?auto_489607 ) ) ( not ( = ?auto_489600 ?auto_489608 ) ) ( not ( = ?auto_489601 ?auto_489602 ) ) ( not ( = ?auto_489601 ?auto_489603 ) ) ( not ( = ?auto_489601 ?auto_489604 ) ) ( not ( = ?auto_489601 ?auto_489605 ) ) ( not ( = ?auto_489601 ?auto_489606 ) ) ( not ( = ?auto_489601 ?auto_489607 ) ) ( not ( = ?auto_489601 ?auto_489608 ) ) ( not ( = ?auto_489602 ?auto_489603 ) ) ( not ( = ?auto_489602 ?auto_489604 ) ) ( not ( = ?auto_489602 ?auto_489605 ) ) ( not ( = ?auto_489602 ?auto_489606 ) ) ( not ( = ?auto_489602 ?auto_489607 ) ) ( not ( = ?auto_489602 ?auto_489608 ) ) ( not ( = ?auto_489603 ?auto_489604 ) ) ( not ( = ?auto_489603 ?auto_489605 ) ) ( not ( = ?auto_489603 ?auto_489606 ) ) ( not ( = ?auto_489603 ?auto_489607 ) ) ( not ( = ?auto_489603 ?auto_489608 ) ) ( not ( = ?auto_489604 ?auto_489605 ) ) ( not ( = ?auto_489604 ?auto_489606 ) ) ( not ( = ?auto_489604 ?auto_489607 ) ) ( not ( = ?auto_489604 ?auto_489608 ) ) ( not ( = ?auto_489605 ?auto_489606 ) ) ( not ( = ?auto_489605 ?auto_489607 ) ) ( not ( = ?auto_489605 ?auto_489608 ) ) ( not ( = ?auto_489606 ?auto_489607 ) ) ( not ( = ?auto_489606 ?auto_489608 ) ) ( not ( = ?auto_489607 ?auto_489608 ) ) ( ON ?auto_489607 ?auto_489608 ) ( ON ?auto_489606 ?auto_489607 ) ( ON ?auto_489605 ?auto_489606 ) ( ON ?auto_489604 ?auto_489605 ) ( ON ?auto_489603 ?auto_489604 ) ( ON ?auto_489602 ?auto_489603 ) ( ON ?auto_489601 ?auto_489602 ) ( ON ?auto_489600 ?auto_489601 ) ( CLEAR ?auto_489598 ) ( ON ?auto_489599 ?auto_489600 ) ( CLEAR ?auto_489599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_489593 ?auto_489594 ?auto_489595 ?auto_489596 ?auto_489597 ?auto_489598 ?auto_489599 )
      ( MAKE-16PILE ?auto_489593 ?auto_489594 ?auto_489595 ?auto_489596 ?auto_489597 ?auto_489598 ?auto_489599 ?auto_489600 ?auto_489601 ?auto_489602 ?auto_489603 ?auto_489604 ?auto_489605 ?auto_489606 ?auto_489607 ?auto_489608 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489625 - BLOCK
      ?auto_489626 - BLOCK
      ?auto_489627 - BLOCK
      ?auto_489628 - BLOCK
      ?auto_489629 - BLOCK
      ?auto_489630 - BLOCK
      ?auto_489631 - BLOCK
      ?auto_489632 - BLOCK
      ?auto_489633 - BLOCK
      ?auto_489634 - BLOCK
      ?auto_489635 - BLOCK
      ?auto_489636 - BLOCK
      ?auto_489637 - BLOCK
      ?auto_489638 - BLOCK
      ?auto_489639 - BLOCK
      ?auto_489640 - BLOCK
    )
    :vars
    (
      ?auto_489641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489640 ?auto_489641 ) ( ON-TABLE ?auto_489625 ) ( ON ?auto_489626 ?auto_489625 ) ( ON ?auto_489627 ?auto_489626 ) ( ON ?auto_489628 ?auto_489627 ) ( ON ?auto_489629 ?auto_489628 ) ( not ( = ?auto_489625 ?auto_489626 ) ) ( not ( = ?auto_489625 ?auto_489627 ) ) ( not ( = ?auto_489625 ?auto_489628 ) ) ( not ( = ?auto_489625 ?auto_489629 ) ) ( not ( = ?auto_489625 ?auto_489630 ) ) ( not ( = ?auto_489625 ?auto_489631 ) ) ( not ( = ?auto_489625 ?auto_489632 ) ) ( not ( = ?auto_489625 ?auto_489633 ) ) ( not ( = ?auto_489625 ?auto_489634 ) ) ( not ( = ?auto_489625 ?auto_489635 ) ) ( not ( = ?auto_489625 ?auto_489636 ) ) ( not ( = ?auto_489625 ?auto_489637 ) ) ( not ( = ?auto_489625 ?auto_489638 ) ) ( not ( = ?auto_489625 ?auto_489639 ) ) ( not ( = ?auto_489625 ?auto_489640 ) ) ( not ( = ?auto_489625 ?auto_489641 ) ) ( not ( = ?auto_489626 ?auto_489627 ) ) ( not ( = ?auto_489626 ?auto_489628 ) ) ( not ( = ?auto_489626 ?auto_489629 ) ) ( not ( = ?auto_489626 ?auto_489630 ) ) ( not ( = ?auto_489626 ?auto_489631 ) ) ( not ( = ?auto_489626 ?auto_489632 ) ) ( not ( = ?auto_489626 ?auto_489633 ) ) ( not ( = ?auto_489626 ?auto_489634 ) ) ( not ( = ?auto_489626 ?auto_489635 ) ) ( not ( = ?auto_489626 ?auto_489636 ) ) ( not ( = ?auto_489626 ?auto_489637 ) ) ( not ( = ?auto_489626 ?auto_489638 ) ) ( not ( = ?auto_489626 ?auto_489639 ) ) ( not ( = ?auto_489626 ?auto_489640 ) ) ( not ( = ?auto_489626 ?auto_489641 ) ) ( not ( = ?auto_489627 ?auto_489628 ) ) ( not ( = ?auto_489627 ?auto_489629 ) ) ( not ( = ?auto_489627 ?auto_489630 ) ) ( not ( = ?auto_489627 ?auto_489631 ) ) ( not ( = ?auto_489627 ?auto_489632 ) ) ( not ( = ?auto_489627 ?auto_489633 ) ) ( not ( = ?auto_489627 ?auto_489634 ) ) ( not ( = ?auto_489627 ?auto_489635 ) ) ( not ( = ?auto_489627 ?auto_489636 ) ) ( not ( = ?auto_489627 ?auto_489637 ) ) ( not ( = ?auto_489627 ?auto_489638 ) ) ( not ( = ?auto_489627 ?auto_489639 ) ) ( not ( = ?auto_489627 ?auto_489640 ) ) ( not ( = ?auto_489627 ?auto_489641 ) ) ( not ( = ?auto_489628 ?auto_489629 ) ) ( not ( = ?auto_489628 ?auto_489630 ) ) ( not ( = ?auto_489628 ?auto_489631 ) ) ( not ( = ?auto_489628 ?auto_489632 ) ) ( not ( = ?auto_489628 ?auto_489633 ) ) ( not ( = ?auto_489628 ?auto_489634 ) ) ( not ( = ?auto_489628 ?auto_489635 ) ) ( not ( = ?auto_489628 ?auto_489636 ) ) ( not ( = ?auto_489628 ?auto_489637 ) ) ( not ( = ?auto_489628 ?auto_489638 ) ) ( not ( = ?auto_489628 ?auto_489639 ) ) ( not ( = ?auto_489628 ?auto_489640 ) ) ( not ( = ?auto_489628 ?auto_489641 ) ) ( not ( = ?auto_489629 ?auto_489630 ) ) ( not ( = ?auto_489629 ?auto_489631 ) ) ( not ( = ?auto_489629 ?auto_489632 ) ) ( not ( = ?auto_489629 ?auto_489633 ) ) ( not ( = ?auto_489629 ?auto_489634 ) ) ( not ( = ?auto_489629 ?auto_489635 ) ) ( not ( = ?auto_489629 ?auto_489636 ) ) ( not ( = ?auto_489629 ?auto_489637 ) ) ( not ( = ?auto_489629 ?auto_489638 ) ) ( not ( = ?auto_489629 ?auto_489639 ) ) ( not ( = ?auto_489629 ?auto_489640 ) ) ( not ( = ?auto_489629 ?auto_489641 ) ) ( not ( = ?auto_489630 ?auto_489631 ) ) ( not ( = ?auto_489630 ?auto_489632 ) ) ( not ( = ?auto_489630 ?auto_489633 ) ) ( not ( = ?auto_489630 ?auto_489634 ) ) ( not ( = ?auto_489630 ?auto_489635 ) ) ( not ( = ?auto_489630 ?auto_489636 ) ) ( not ( = ?auto_489630 ?auto_489637 ) ) ( not ( = ?auto_489630 ?auto_489638 ) ) ( not ( = ?auto_489630 ?auto_489639 ) ) ( not ( = ?auto_489630 ?auto_489640 ) ) ( not ( = ?auto_489630 ?auto_489641 ) ) ( not ( = ?auto_489631 ?auto_489632 ) ) ( not ( = ?auto_489631 ?auto_489633 ) ) ( not ( = ?auto_489631 ?auto_489634 ) ) ( not ( = ?auto_489631 ?auto_489635 ) ) ( not ( = ?auto_489631 ?auto_489636 ) ) ( not ( = ?auto_489631 ?auto_489637 ) ) ( not ( = ?auto_489631 ?auto_489638 ) ) ( not ( = ?auto_489631 ?auto_489639 ) ) ( not ( = ?auto_489631 ?auto_489640 ) ) ( not ( = ?auto_489631 ?auto_489641 ) ) ( not ( = ?auto_489632 ?auto_489633 ) ) ( not ( = ?auto_489632 ?auto_489634 ) ) ( not ( = ?auto_489632 ?auto_489635 ) ) ( not ( = ?auto_489632 ?auto_489636 ) ) ( not ( = ?auto_489632 ?auto_489637 ) ) ( not ( = ?auto_489632 ?auto_489638 ) ) ( not ( = ?auto_489632 ?auto_489639 ) ) ( not ( = ?auto_489632 ?auto_489640 ) ) ( not ( = ?auto_489632 ?auto_489641 ) ) ( not ( = ?auto_489633 ?auto_489634 ) ) ( not ( = ?auto_489633 ?auto_489635 ) ) ( not ( = ?auto_489633 ?auto_489636 ) ) ( not ( = ?auto_489633 ?auto_489637 ) ) ( not ( = ?auto_489633 ?auto_489638 ) ) ( not ( = ?auto_489633 ?auto_489639 ) ) ( not ( = ?auto_489633 ?auto_489640 ) ) ( not ( = ?auto_489633 ?auto_489641 ) ) ( not ( = ?auto_489634 ?auto_489635 ) ) ( not ( = ?auto_489634 ?auto_489636 ) ) ( not ( = ?auto_489634 ?auto_489637 ) ) ( not ( = ?auto_489634 ?auto_489638 ) ) ( not ( = ?auto_489634 ?auto_489639 ) ) ( not ( = ?auto_489634 ?auto_489640 ) ) ( not ( = ?auto_489634 ?auto_489641 ) ) ( not ( = ?auto_489635 ?auto_489636 ) ) ( not ( = ?auto_489635 ?auto_489637 ) ) ( not ( = ?auto_489635 ?auto_489638 ) ) ( not ( = ?auto_489635 ?auto_489639 ) ) ( not ( = ?auto_489635 ?auto_489640 ) ) ( not ( = ?auto_489635 ?auto_489641 ) ) ( not ( = ?auto_489636 ?auto_489637 ) ) ( not ( = ?auto_489636 ?auto_489638 ) ) ( not ( = ?auto_489636 ?auto_489639 ) ) ( not ( = ?auto_489636 ?auto_489640 ) ) ( not ( = ?auto_489636 ?auto_489641 ) ) ( not ( = ?auto_489637 ?auto_489638 ) ) ( not ( = ?auto_489637 ?auto_489639 ) ) ( not ( = ?auto_489637 ?auto_489640 ) ) ( not ( = ?auto_489637 ?auto_489641 ) ) ( not ( = ?auto_489638 ?auto_489639 ) ) ( not ( = ?auto_489638 ?auto_489640 ) ) ( not ( = ?auto_489638 ?auto_489641 ) ) ( not ( = ?auto_489639 ?auto_489640 ) ) ( not ( = ?auto_489639 ?auto_489641 ) ) ( not ( = ?auto_489640 ?auto_489641 ) ) ( ON ?auto_489639 ?auto_489640 ) ( ON ?auto_489638 ?auto_489639 ) ( ON ?auto_489637 ?auto_489638 ) ( ON ?auto_489636 ?auto_489637 ) ( ON ?auto_489635 ?auto_489636 ) ( ON ?auto_489634 ?auto_489635 ) ( ON ?auto_489633 ?auto_489634 ) ( ON ?auto_489632 ?auto_489633 ) ( ON ?auto_489631 ?auto_489632 ) ( CLEAR ?auto_489629 ) ( ON ?auto_489630 ?auto_489631 ) ( CLEAR ?auto_489630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_489625 ?auto_489626 ?auto_489627 ?auto_489628 ?auto_489629 ?auto_489630 )
      ( MAKE-16PILE ?auto_489625 ?auto_489626 ?auto_489627 ?auto_489628 ?auto_489629 ?auto_489630 ?auto_489631 ?auto_489632 ?auto_489633 ?auto_489634 ?auto_489635 ?auto_489636 ?auto_489637 ?auto_489638 ?auto_489639 ?auto_489640 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489658 - BLOCK
      ?auto_489659 - BLOCK
      ?auto_489660 - BLOCK
      ?auto_489661 - BLOCK
      ?auto_489662 - BLOCK
      ?auto_489663 - BLOCK
      ?auto_489664 - BLOCK
      ?auto_489665 - BLOCK
      ?auto_489666 - BLOCK
      ?auto_489667 - BLOCK
      ?auto_489668 - BLOCK
      ?auto_489669 - BLOCK
      ?auto_489670 - BLOCK
      ?auto_489671 - BLOCK
      ?auto_489672 - BLOCK
      ?auto_489673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489673 ) ( ON-TABLE ?auto_489658 ) ( ON ?auto_489659 ?auto_489658 ) ( ON ?auto_489660 ?auto_489659 ) ( ON ?auto_489661 ?auto_489660 ) ( ON ?auto_489662 ?auto_489661 ) ( not ( = ?auto_489658 ?auto_489659 ) ) ( not ( = ?auto_489658 ?auto_489660 ) ) ( not ( = ?auto_489658 ?auto_489661 ) ) ( not ( = ?auto_489658 ?auto_489662 ) ) ( not ( = ?auto_489658 ?auto_489663 ) ) ( not ( = ?auto_489658 ?auto_489664 ) ) ( not ( = ?auto_489658 ?auto_489665 ) ) ( not ( = ?auto_489658 ?auto_489666 ) ) ( not ( = ?auto_489658 ?auto_489667 ) ) ( not ( = ?auto_489658 ?auto_489668 ) ) ( not ( = ?auto_489658 ?auto_489669 ) ) ( not ( = ?auto_489658 ?auto_489670 ) ) ( not ( = ?auto_489658 ?auto_489671 ) ) ( not ( = ?auto_489658 ?auto_489672 ) ) ( not ( = ?auto_489658 ?auto_489673 ) ) ( not ( = ?auto_489659 ?auto_489660 ) ) ( not ( = ?auto_489659 ?auto_489661 ) ) ( not ( = ?auto_489659 ?auto_489662 ) ) ( not ( = ?auto_489659 ?auto_489663 ) ) ( not ( = ?auto_489659 ?auto_489664 ) ) ( not ( = ?auto_489659 ?auto_489665 ) ) ( not ( = ?auto_489659 ?auto_489666 ) ) ( not ( = ?auto_489659 ?auto_489667 ) ) ( not ( = ?auto_489659 ?auto_489668 ) ) ( not ( = ?auto_489659 ?auto_489669 ) ) ( not ( = ?auto_489659 ?auto_489670 ) ) ( not ( = ?auto_489659 ?auto_489671 ) ) ( not ( = ?auto_489659 ?auto_489672 ) ) ( not ( = ?auto_489659 ?auto_489673 ) ) ( not ( = ?auto_489660 ?auto_489661 ) ) ( not ( = ?auto_489660 ?auto_489662 ) ) ( not ( = ?auto_489660 ?auto_489663 ) ) ( not ( = ?auto_489660 ?auto_489664 ) ) ( not ( = ?auto_489660 ?auto_489665 ) ) ( not ( = ?auto_489660 ?auto_489666 ) ) ( not ( = ?auto_489660 ?auto_489667 ) ) ( not ( = ?auto_489660 ?auto_489668 ) ) ( not ( = ?auto_489660 ?auto_489669 ) ) ( not ( = ?auto_489660 ?auto_489670 ) ) ( not ( = ?auto_489660 ?auto_489671 ) ) ( not ( = ?auto_489660 ?auto_489672 ) ) ( not ( = ?auto_489660 ?auto_489673 ) ) ( not ( = ?auto_489661 ?auto_489662 ) ) ( not ( = ?auto_489661 ?auto_489663 ) ) ( not ( = ?auto_489661 ?auto_489664 ) ) ( not ( = ?auto_489661 ?auto_489665 ) ) ( not ( = ?auto_489661 ?auto_489666 ) ) ( not ( = ?auto_489661 ?auto_489667 ) ) ( not ( = ?auto_489661 ?auto_489668 ) ) ( not ( = ?auto_489661 ?auto_489669 ) ) ( not ( = ?auto_489661 ?auto_489670 ) ) ( not ( = ?auto_489661 ?auto_489671 ) ) ( not ( = ?auto_489661 ?auto_489672 ) ) ( not ( = ?auto_489661 ?auto_489673 ) ) ( not ( = ?auto_489662 ?auto_489663 ) ) ( not ( = ?auto_489662 ?auto_489664 ) ) ( not ( = ?auto_489662 ?auto_489665 ) ) ( not ( = ?auto_489662 ?auto_489666 ) ) ( not ( = ?auto_489662 ?auto_489667 ) ) ( not ( = ?auto_489662 ?auto_489668 ) ) ( not ( = ?auto_489662 ?auto_489669 ) ) ( not ( = ?auto_489662 ?auto_489670 ) ) ( not ( = ?auto_489662 ?auto_489671 ) ) ( not ( = ?auto_489662 ?auto_489672 ) ) ( not ( = ?auto_489662 ?auto_489673 ) ) ( not ( = ?auto_489663 ?auto_489664 ) ) ( not ( = ?auto_489663 ?auto_489665 ) ) ( not ( = ?auto_489663 ?auto_489666 ) ) ( not ( = ?auto_489663 ?auto_489667 ) ) ( not ( = ?auto_489663 ?auto_489668 ) ) ( not ( = ?auto_489663 ?auto_489669 ) ) ( not ( = ?auto_489663 ?auto_489670 ) ) ( not ( = ?auto_489663 ?auto_489671 ) ) ( not ( = ?auto_489663 ?auto_489672 ) ) ( not ( = ?auto_489663 ?auto_489673 ) ) ( not ( = ?auto_489664 ?auto_489665 ) ) ( not ( = ?auto_489664 ?auto_489666 ) ) ( not ( = ?auto_489664 ?auto_489667 ) ) ( not ( = ?auto_489664 ?auto_489668 ) ) ( not ( = ?auto_489664 ?auto_489669 ) ) ( not ( = ?auto_489664 ?auto_489670 ) ) ( not ( = ?auto_489664 ?auto_489671 ) ) ( not ( = ?auto_489664 ?auto_489672 ) ) ( not ( = ?auto_489664 ?auto_489673 ) ) ( not ( = ?auto_489665 ?auto_489666 ) ) ( not ( = ?auto_489665 ?auto_489667 ) ) ( not ( = ?auto_489665 ?auto_489668 ) ) ( not ( = ?auto_489665 ?auto_489669 ) ) ( not ( = ?auto_489665 ?auto_489670 ) ) ( not ( = ?auto_489665 ?auto_489671 ) ) ( not ( = ?auto_489665 ?auto_489672 ) ) ( not ( = ?auto_489665 ?auto_489673 ) ) ( not ( = ?auto_489666 ?auto_489667 ) ) ( not ( = ?auto_489666 ?auto_489668 ) ) ( not ( = ?auto_489666 ?auto_489669 ) ) ( not ( = ?auto_489666 ?auto_489670 ) ) ( not ( = ?auto_489666 ?auto_489671 ) ) ( not ( = ?auto_489666 ?auto_489672 ) ) ( not ( = ?auto_489666 ?auto_489673 ) ) ( not ( = ?auto_489667 ?auto_489668 ) ) ( not ( = ?auto_489667 ?auto_489669 ) ) ( not ( = ?auto_489667 ?auto_489670 ) ) ( not ( = ?auto_489667 ?auto_489671 ) ) ( not ( = ?auto_489667 ?auto_489672 ) ) ( not ( = ?auto_489667 ?auto_489673 ) ) ( not ( = ?auto_489668 ?auto_489669 ) ) ( not ( = ?auto_489668 ?auto_489670 ) ) ( not ( = ?auto_489668 ?auto_489671 ) ) ( not ( = ?auto_489668 ?auto_489672 ) ) ( not ( = ?auto_489668 ?auto_489673 ) ) ( not ( = ?auto_489669 ?auto_489670 ) ) ( not ( = ?auto_489669 ?auto_489671 ) ) ( not ( = ?auto_489669 ?auto_489672 ) ) ( not ( = ?auto_489669 ?auto_489673 ) ) ( not ( = ?auto_489670 ?auto_489671 ) ) ( not ( = ?auto_489670 ?auto_489672 ) ) ( not ( = ?auto_489670 ?auto_489673 ) ) ( not ( = ?auto_489671 ?auto_489672 ) ) ( not ( = ?auto_489671 ?auto_489673 ) ) ( not ( = ?auto_489672 ?auto_489673 ) ) ( ON ?auto_489672 ?auto_489673 ) ( ON ?auto_489671 ?auto_489672 ) ( ON ?auto_489670 ?auto_489671 ) ( ON ?auto_489669 ?auto_489670 ) ( ON ?auto_489668 ?auto_489669 ) ( ON ?auto_489667 ?auto_489668 ) ( ON ?auto_489666 ?auto_489667 ) ( ON ?auto_489665 ?auto_489666 ) ( ON ?auto_489664 ?auto_489665 ) ( CLEAR ?auto_489662 ) ( ON ?auto_489663 ?auto_489664 ) ( CLEAR ?auto_489663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_489658 ?auto_489659 ?auto_489660 ?auto_489661 ?auto_489662 ?auto_489663 )
      ( MAKE-16PILE ?auto_489658 ?auto_489659 ?auto_489660 ?auto_489661 ?auto_489662 ?auto_489663 ?auto_489664 ?auto_489665 ?auto_489666 ?auto_489667 ?auto_489668 ?auto_489669 ?auto_489670 ?auto_489671 ?auto_489672 ?auto_489673 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489690 - BLOCK
      ?auto_489691 - BLOCK
      ?auto_489692 - BLOCK
      ?auto_489693 - BLOCK
      ?auto_489694 - BLOCK
      ?auto_489695 - BLOCK
      ?auto_489696 - BLOCK
      ?auto_489697 - BLOCK
      ?auto_489698 - BLOCK
      ?auto_489699 - BLOCK
      ?auto_489700 - BLOCK
      ?auto_489701 - BLOCK
      ?auto_489702 - BLOCK
      ?auto_489703 - BLOCK
      ?auto_489704 - BLOCK
      ?auto_489705 - BLOCK
    )
    :vars
    (
      ?auto_489706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489705 ?auto_489706 ) ( ON-TABLE ?auto_489690 ) ( ON ?auto_489691 ?auto_489690 ) ( ON ?auto_489692 ?auto_489691 ) ( ON ?auto_489693 ?auto_489692 ) ( not ( = ?auto_489690 ?auto_489691 ) ) ( not ( = ?auto_489690 ?auto_489692 ) ) ( not ( = ?auto_489690 ?auto_489693 ) ) ( not ( = ?auto_489690 ?auto_489694 ) ) ( not ( = ?auto_489690 ?auto_489695 ) ) ( not ( = ?auto_489690 ?auto_489696 ) ) ( not ( = ?auto_489690 ?auto_489697 ) ) ( not ( = ?auto_489690 ?auto_489698 ) ) ( not ( = ?auto_489690 ?auto_489699 ) ) ( not ( = ?auto_489690 ?auto_489700 ) ) ( not ( = ?auto_489690 ?auto_489701 ) ) ( not ( = ?auto_489690 ?auto_489702 ) ) ( not ( = ?auto_489690 ?auto_489703 ) ) ( not ( = ?auto_489690 ?auto_489704 ) ) ( not ( = ?auto_489690 ?auto_489705 ) ) ( not ( = ?auto_489690 ?auto_489706 ) ) ( not ( = ?auto_489691 ?auto_489692 ) ) ( not ( = ?auto_489691 ?auto_489693 ) ) ( not ( = ?auto_489691 ?auto_489694 ) ) ( not ( = ?auto_489691 ?auto_489695 ) ) ( not ( = ?auto_489691 ?auto_489696 ) ) ( not ( = ?auto_489691 ?auto_489697 ) ) ( not ( = ?auto_489691 ?auto_489698 ) ) ( not ( = ?auto_489691 ?auto_489699 ) ) ( not ( = ?auto_489691 ?auto_489700 ) ) ( not ( = ?auto_489691 ?auto_489701 ) ) ( not ( = ?auto_489691 ?auto_489702 ) ) ( not ( = ?auto_489691 ?auto_489703 ) ) ( not ( = ?auto_489691 ?auto_489704 ) ) ( not ( = ?auto_489691 ?auto_489705 ) ) ( not ( = ?auto_489691 ?auto_489706 ) ) ( not ( = ?auto_489692 ?auto_489693 ) ) ( not ( = ?auto_489692 ?auto_489694 ) ) ( not ( = ?auto_489692 ?auto_489695 ) ) ( not ( = ?auto_489692 ?auto_489696 ) ) ( not ( = ?auto_489692 ?auto_489697 ) ) ( not ( = ?auto_489692 ?auto_489698 ) ) ( not ( = ?auto_489692 ?auto_489699 ) ) ( not ( = ?auto_489692 ?auto_489700 ) ) ( not ( = ?auto_489692 ?auto_489701 ) ) ( not ( = ?auto_489692 ?auto_489702 ) ) ( not ( = ?auto_489692 ?auto_489703 ) ) ( not ( = ?auto_489692 ?auto_489704 ) ) ( not ( = ?auto_489692 ?auto_489705 ) ) ( not ( = ?auto_489692 ?auto_489706 ) ) ( not ( = ?auto_489693 ?auto_489694 ) ) ( not ( = ?auto_489693 ?auto_489695 ) ) ( not ( = ?auto_489693 ?auto_489696 ) ) ( not ( = ?auto_489693 ?auto_489697 ) ) ( not ( = ?auto_489693 ?auto_489698 ) ) ( not ( = ?auto_489693 ?auto_489699 ) ) ( not ( = ?auto_489693 ?auto_489700 ) ) ( not ( = ?auto_489693 ?auto_489701 ) ) ( not ( = ?auto_489693 ?auto_489702 ) ) ( not ( = ?auto_489693 ?auto_489703 ) ) ( not ( = ?auto_489693 ?auto_489704 ) ) ( not ( = ?auto_489693 ?auto_489705 ) ) ( not ( = ?auto_489693 ?auto_489706 ) ) ( not ( = ?auto_489694 ?auto_489695 ) ) ( not ( = ?auto_489694 ?auto_489696 ) ) ( not ( = ?auto_489694 ?auto_489697 ) ) ( not ( = ?auto_489694 ?auto_489698 ) ) ( not ( = ?auto_489694 ?auto_489699 ) ) ( not ( = ?auto_489694 ?auto_489700 ) ) ( not ( = ?auto_489694 ?auto_489701 ) ) ( not ( = ?auto_489694 ?auto_489702 ) ) ( not ( = ?auto_489694 ?auto_489703 ) ) ( not ( = ?auto_489694 ?auto_489704 ) ) ( not ( = ?auto_489694 ?auto_489705 ) ) ( not ( = ?auto_489694 ?auto_489706 ) ) ( not ( = ?auto_489695 ?auto_489696 ) ) ( not ( = ?auto_489695 ?auto_489697 ) ) ( not ( = ?auto_489695 ?auto_489698 ) ) ( not ( = ?auto_489695 ?auto_489699 ) ) ( not ( = ?auto_489695 ?auto_489700 ) ) ( not ( = ?auto_489695 ?auto_489701 ) ) ( not ( = ?auto_489695 ?auto_489702 ) ) ( not ( = ?auto_489695 ?auto_489703 ) ) ( not ( = ?auto_489695 ?auto_489704 ) ) ( not ( = ?auto_489695 ?auto_489705 ) ) ( not ( = ?auto_489695 ?auto_489706 ) ) ( not ( = ?auto_489696 ?auto_489697 ) ) ( not ( = ?auto_489696 ?auto_489698 ) ) ( not ( = ?auto_489696 ?auto_489699 ) ) ( not ( = ?auto_489696 ?auto_489700 ) ) ( not ( = ?auto_489696 ?auto_489701 ) ) ( not ( = ?auto_489696 ?auto_489702 ) ) ( not ( = ?auto_489696 ?auto_489703 ) ) ( not ( = ?auto_489696 ?auto_489704 ) ) ( not ( = ?auto_489696 ?auto_489705 ) ) ( not ( = ?auto_489696 ?auto_489706 ) ) ( not ( = ?auto_489697 ?auto_489698 ) ) ( not ( = ?auto_489697 ?auto_489699 ) ) ( not ( = ?auto_489697 ?auto_489700 ) ) ( not ( = ?auto_489697 ?auto_489701 ) ) ( not ( = ?auto_489697 ?auto_489702 ) ) ( not ( = ?auto_489697 ?auto_489703 ) ) ( not ( = ?auto_489697 ?auto_489704 ) ) ( not ( = ?auto_489697 ?auto_489705 ) ) ( not ( = ?auto_489697 ?auto_489706 ) ) ( not ( = ?auto_489698 ?auto_489699 ) ) ( not ( = ?auto_489698 ?auto_489700 ) ) ( not ( = ?auto_489698 ?auto_489701 ) ) ( not ( = ?auto_489698 ?auto_489702 ) ) ( not ( = ?auto_489698 ?auto_489703 ) ) ( not ( = ?auto_489698 ?auto_489704 ) ) ( not ( = ?auto_489698 ?auto_489705 ) ) ( not ( = ?auto_489698 ?auto_489706 ) ) ( not ( = ?auto_489699 ?auto_489700 ) ) ( not ( = ?auto_489699 ?auto_489701 ) ) ( not ( = ?auto_489699 ?auto_489702 ) ) ( not ( = ?auto_489699 ?auto_489703 ) ) ( not ( = ?auto_489699 ?auto_489704 ) ) ( not ( = ?auto_489699 ?auto_489705 ) ) ( not ( = ?auto_489699 ?auto_489706 ) ) ( not ( = ?auto_489700 ?auto_489701 ) ) ( not ( = ?auto_489700 ?auto_489702 ) ) ( not ( = ?auto_489700 ?auto_489703 ) ) ( not ( = ?auto_489700 ?auto_489704 ) ) ( not ( = ?auto_489700 ?auto_489705 ) ) ( not ( = ?auto_489700 ?auto_489706 ) ) ( not ( = ?auto_489701 ?auto_489702 ) ) ( not ( = ?auto_489701 ?auto_489703 ) ) ( not ( = ?auto_489701 ?auto_489704 ) ) ( not ( = ?auto_489701 ?auto_489705 ) ) ( not ( = ?auto_489701 ?auto_489706 ) ) ( not ( = ?auto_489702 ?auto_489703 ) ) ( not ( = ?auto_489702 ?auto_489704 ) ) ( not ( = ?auto_489702 ?auto_489705 ) ) ( not ( = ?auto_489702 ?auto_489706 ) ) ( not ( = ?auto_489703 ?auto_489704 ) ) ( not ( = ?auto_489703 ?auto_489705 ) ) ( not ( = ?auto_489703 ?auto_489706 ) ) ( not ( = ?auto_489704 ?auto_489705 ) ) ( not ( = ?auto_489704 ?auto_489706 ) ) ( not ( = ?auto_489705 ?auto_489706 ) ) ( ON ?auto_489704 ?auto_489705 ) ( ON ?auto_489703 ?auto_489704 ) ( ON ?auto_489702 ?auto_489703 ) ( ON ?auto_489701 ?auto_489702 ) ( ON ?auto_489700 ?auto_489701 ) ( ON ?auto_489699 ?auto_489700 ) ( ON ?auto_489698 ?auto_489699 ) ( ON ?auto_489697 ?auto_489698 ) ( ON ?auto_489696 ?auto_489697 ) ( ON ?auto_489695 ?auto_489696 ) ( CLEAR ?auto_489693 ) ( ON ?auto_489694 ?auto_489695 ) ( CLEAR ?auto_489694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_489690 ?auto_489691 ?auto_489692 ?auto_489693 ?auto_489694 )
      ( MAKE-16PILE ?auto_489690 ?auto_489691 ?auto_489692 ?auto_489693 ?auto_489694 ?auto_489695 ?auto_489696 ?auto_489697 ?auto_489698 ?auto_489699 ?auto_489700 ?auto_489701 ?auto_489702 ?auto_489703 ?auto_489704 ?auto_489705 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489723 - BLOCK
      ?auto_489724 - BLOCK
      ?auto_489725 - BLOCK
      ?auto_489726 - BLOCK
      ?auto_489727 - BLOCK
      ?auto_489728 - BLOCK
      ?auto_489729 - BLOCK
      ?auto_489730 - BLOCK
      ?auto_489731 - BLOCK
      ?auto_489732 - BLOCK
      ?auto_489733 - BLOCK
      ?auto_489734 - BLOCK
      ?auto_489735 - BLOCK
      ?auto_489736 - BLOCK
      ?auto_489737 - BLOCK
      ?auto_489738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489738 ) ( ON-TABLE ?auto_489723 ) ( ON ?auto_489724 ?auto_489723 ) ( ON ?auto_489725 ?auto_489724 ) ( ON ?auto_489726 ?auto_489725 ) ( not ( = ?auto_489723 ?auto_489724 ) ) ( not ( = ?auto_489723 ?auto_489725 ) ) ( not ( = ?auto_489723 ?auto_489726 ) ) ( not ( = ?auto_489723 ?auto_489727 ) ) ( not ( = ?auto_489723 ?auto_489728 ) ) ( not ( = ?auto_489723 ?auto_489729 ) ) ( not ( = ?auto_489723 ?auto_489730 ) ) ( not ( = ?auto_489723 ?auto_489731 ) ) ( not ( = ?auto_489723 ?auto_489732 ) ) ( not ( = ?auto_489723 ?auto_489733 ) ) ( not ( = ?auto_489723 ?auto_489734 ) ) ( not ( = ?auto_489723 ?auto_489735 ) ) ( not ( = ?auto_489723 ?auto_489736 ) ) ( not ( = ?auto_489723 ?auto_489737 ) ) ( not ( = ?auto_489723 ?auto_489738 ) ) ( not ( = ?auto_489724 ?auto_489725 ) ) ( not ( = ?auto_489724 ?auto_489726 ) ) ( not ( = ?auto_489724 ?auto_489727 ) ) ( not ( = ?auto_489724 ?auto_489728 ) ) ( not ( = ?auto_489724 ?auto_489729 ) ) ( not ( = ?auto_489724 ?auto_489730 ) ) ( not ( = ?auto_489724 ?auto_489731 ) ) ( not ( = ?auto_489724 ?auto_489732 ) ) ( not ( = ?auto_489724 ?auto_489733 ) ) ( not ( = ?auto_489724 ?auto_489734 ) ) ( not ( = ?auto_489724 ?auto_489735 ) ) ( not ( = ?auto_489724 ?auto_489736 ) ) ( not ( = ?auto_489724 ?auto_489737 ) ) ( not ( = ?auto_489724 ?auto_489738 ) ) ( not ( = ?auto_489725 ?auto_489726 ) ) ( not ( = ?auto_489725 ?auto_489727 ) ) ( not ( = ?auto_489725 ?auto_489728 ) ) ( not ( = ?auto_489725 ?auto_489729 ) ) ( not ( = ?auto_489725 ?auto_489730 ) ) ( not ( = ?auto_489725 ?auto_489731 ) ) ( not ( = ?auto_489725 ?auto_489732 ) ) ( not ( = ?auto_489725 ?auto_489733 ) ) ( not ( = ?auto_489725 ?auto_489734 ) ) ( not ( = ?auto_489725 ?auto_489735 ) ) ( not ( = ?auto_489725 ?auto_489736 ) ) ( not ( = ?auto_489725 ?auto_489737 ) ) ( not ( = ?auto_489725 ?auto_489738 ) ) ( not ( = ?auto_489726 ?auto_489727 ) ) ( not ( = ?auto_489726 ?auto_489728 ) ) ( not ( = ?auto_489726 ?auto_489729 ) ) ( not ( = ?auto_489726 ?auto_489730 ) ) ( not ( = ?auto_489726 ?auto_489731 ) ) ( not ( = ?auto_489726 ?auto_489732 ) ) ( not ( = ?auto_489726 ?auto_489733 ) ) ( not ( = ?auto_489726 ?auto_489734 ) ) ( not ( = ?auto_489726 ?auto_489735 ) ) ( not ( = ?auto_489726 ?auto_489736 ) ) ( not ( = ?auto_489726 ?auto_489737 ) ) ( not ( = ?auto_489726 ?auto_489738 ) ) ( not ( = ?auto_489727 ?auto_489728 ) ) ( not ( = ?auto_489727 ?auto_489729 ) ) ( not ( = ?auto_489727 ?auto_489730 ) ) ( not ( = ?auto_489727 ?auto_489731 ) ) ( not ( = ?auto_489727 ?auto_489732 ) ) ( not ( = ?auto_489727 ?auto_489733 ) ) ( not ( = ?auto_489727 ?auto_489734 ) ) ( not ( = ?auto_489727 ?auto_489735 ) ) ( not ( = ?auto_489727 ?auto_489736 ) ) ( not ( = ?auto_489727 ?auto_489737 ) ) ( not ( = ?auto_489727 ?auto_489738 ) ) ( not ( = ?auto_489728 ?auto_489729 ) ) ( not ( = ?auto_489728 ?auto_489730 ) ) ( not ( = ?auto_489728 ?auto_489731 ) ) ( not ( = ?auto_489728 ?auto_489732 ) ) ( not ( = ?auto_489728 ?auto_489733 ) ) ( not ( = ?auto_489728 ?auto_489734 ) ) ( not ( = ?auto_489728 ?auto_489735 ) ) ( not ( = ?auto_489728 ?auto_489736 ) ) ( not ( = ?auto_489728 ?auto_489737 ) ) ( not ( = ?auto_489728 ?auto_489738 ) ) ( not ( = ?auto_489729 ?auto_489730 ) ) ( not ( = ?auto_489729 ?auto_489731 ) ) ( not ( = ?auto_489729 ?auto_489732 ) ) ( not ( = ?auto_489729 ?auto_489733 ) ) ( not ( = ?auto_489729 ?auto_489734 ) ) ( not ( = ?auto_489729 ?auto_489735 ) ) ( not ( = ?auto_489729 ?auto_489736 ) ) ( not ( = ?auto_489729 ?auto_489737 ) ) ( not ( = ?auto_489729 ?auto_489738 ) ) ( not ( = ?auto_489730 ?auto_489731 ) ) ( not ( = ?auto_489730 ?auto_489732 ) ) ( not ( = ?auto_489730 ?auto_489733 ) ) ( not ( = ?auto_489730 ?auto_489734 ) ) ( not ( = ?auto_489730 ?auto_489735 ) ) ( not ( = ?auto_489730 ?auto_489736 ) ) ( not ( = ?auto_489730 ?auto_489737 ) ) ( not ( = ?auto_489730 ?auto_489738 ) ) ( not ( = ?auto_489731 ?auto_489732 ) ) ( not ( = ?auto_489731 ?auto_489733 ) ) ( not ( = ?auto_489731 ?auto_489734 ) ) ( not ( = ?auto_489731 ?auto_489735 ) ) ( not ( = ?auto_489731 ?auto_489736 ) ) ( not ( = ?auto_489731 ?auto_489737 ) ) ( not ( = ?auto_489731 ?auto_489738 ) ) ( not ( = ?auto_489732 ?auto_489733 ) ) ( not ( = ?auto_489732 ?auto_489734 ) ) ( not ( = ?auto_489732 ?auto_489735 ) ) ( not ( = ?auto_489732 ?auto_489736 ) ) ( not ( = ?auto_489732 ?auto_489737 ) ) ( not ( = ?auto_489732 ?auto_489738 ) ) ( not ( = ?auto_489733 ?auto_489734 ) ) ( not ( = ?auto_489733 ?auto_489735 ) ) ( not ( = ?auto_489733 ?auto_489736 ) ) ( not ( = ?auto_489733 ?auto_489737 ) ) ( not ( = ?auto_489733 ?auto_489738 ) ) ( not ( = ?auto_489734 ?auto_489735 ) ) ( not ( = ?auto_489734 ?auto_489736 ) ) ( not ( = ?auto_489734 ?auto_489737 ) ) ( not ( = ?auto_489734 ?auto_489738 ) ) ( not ( = ?auto_489735 ?auto_489736 ) ) ( not ( = ?auto_489735 ?auto_489737 ) ) ( not ( = ?auto_489735 ?auto_489738 ) ) ( not ( = ?auto_489736 ?auto_489737 ) ) ( not ( = ?auto_489736 ?auto_489738 ) ) ( not ( = ?auto_489737 ?auto_489738 ) ) ( ON ?auto_489737 ?auto_489738 ) ( ON ?auto_489736 ?auto_489737 ) ( ON ?auto_489735 ?auto_489736 ) ( ON ?auto_489734 ?auto_489735 ) ( ON ?auto_489733 ?auto_489734 ) ( ON ?auto_489732 ?auto_489733 ) ( ON ?auto_489731 ?auto_489732 ) ( ON ?auto_489730 ?auto_489731 ) ( ON ?auto_489729 ?auto_489730 ) ( ON ?auto_489728 ?auto_489729 ) ( CLEAR ?auto_489726 ) ( ON ?auto_489727 ?auto_489728 ) ( CLEAR ?auto_489727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_489723 ?auto_489724 ?auto_489725 ?auto_489726 ?auto_489727 )
      ( MAKE-16PILE ?auto_489723 ?auto_489724 ?auto_489725 ?auto_489726 ?auto_489727 ?auto_489728 ?auto_489729 ?auto_489730 ?auto_489731 ?auto_489732 ?auto_489733 ?auto_489734 ?auto_489735 ?auto_489736 ?auto_489737 ?auto_489738 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489755 - BLOCK
      ?auto_489756 - BLOCK
      ?auto_489757 - BLOCK
      ?auto_489758 - BLOCK
      ?auto_489759 - BLOCK
      ?auto_489760 - BLOCK
      ?auto_489761 - BLOCK
      ?auto_489762 - BLOCK
      ?auto_489763 - BLOCK
      ?auto_489764 - BLOCK
      ?auto_489765 - BLOCK
      ?auto_489766 - BLOCK
      ?auto_489767 - BLOCK
      ?auto_489768 - BLOCK
      ?auto_489769 - BLOCK
      ?auto_489770 - BLOCK
    )
    :vars
    (
      ?auto_489771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489770 ?auto_489771 ) ( ON-TABLE ?auto_489755 ) ( ON ?auto_489756 ?auto_489755 ) ( ON ?auto_489757 ?auto_489756 ) ( not ( = ?auto_489755 ?auto_489756 ) ) ( not ( = ?auto_489755 ?auto_489757 ) ) ( not ( = ?auto_489755 ?auto_489758 ) ) ( not ( = ?auto_489755 ?auto_489759 ) ) ( not ( = ?auto_489755 ?auto_489760 ) ) ( not ( = ?auto_489755 ?auto_489761 ) ) ( not ( = ?auto_489755 ?auto_489762 ) ) ( not ( = ?auto_489755 ?auto_489763 ) ) ( not ( = ?auto_489755 ?auto_489764 ) ) ( not ( = ?auto_489755 ?auto_489765 ) ) ( not ( = ?auto_489755 ?auto_489766 ) ) ( not ( = ?auto_489755 ?auto_489767 ) ) ( not ( = ?auto_489755 ?auto_489768 ) ) ( not ( = ?auto_489755 ?auto_489769 ) ) ( not ( = ?auto_489755 ?auto_489770 ) ) ( not ( = ?auto_489755 ?auto_489771 ) ) ( not ( = ?auto_489756 ?auto_489757 ) ) ( not ( = ?auto_489756 ?auto_489758 ) ) ( not ( = ?auto_489756 ?auto_489759 ) ) ( not ( = ?auto_489756 ?auto_489760 ) ) ( not ( = ?auto_489756 ?auto_489761 ) ) ( not ( = ?auto_489756 ?auto_489762 ) ) ( not ( = ?auto_489756 ?auto_489763 ) ) ( not ( = ?auto_489756 ?auto_489764 ) ) ( not ( = ?auto_489756 ?auto_489765 ) ) ( not ( = ?auto_489756 ?auto_489766 ) ) ( not ( = ?auto_489756 ?auto_489767 ) ) ( not ( = ?auto_489756 ?auto_489768 ) ) ( not ( = ?auto_489756 ?auto_489769 ) ) ( not ( = ?auto_489756 ?auto_489770 ) ) ( not ( = ?auto_489756 ?auto_489771 ) ) ( not ( = ?auto_489757 ?auto_489758 ) ) ( not ( = ?auto_489757 ?auto_489759 ) ) ( not ( = ?auto_489757 ?auto_489760 ) ) ( not ( = ?auto_489757 ?auto_489761 ) ) ( not ( = ?auto_489757 ?auto_489762 ) ) ( not ( = ?auto_489757 ?auto_489763 ) ) ( not ( = ?auto_489757 ?auto_489764 ) ) ( not ( = ?auto_489757 ?auto_489765 ) ) ( not ( = ?auto_489757 ?auto_489766 ) ) ( not ( = ?auto_489757 ?auto_489767 ) ) ( not ( = ?auto_489757 ?auto_489768 ) ) ( not ( = ?auto_489757 ?auto_489769 ) ) ( not ( = ?auto_489757 ?auto_489770 ) ) ( not ( = ?auto_489757 ?auto_489771 ) ) ( not ( = ?auto_489758 ?auto_489759 ) ) ( not ( = ?auto_489758 ?auto_489760 ) ) ( not ( = ?auto_489758 ?auto_489761 ) ) ( not ( = ?auto_489758 ?auto_489762 ) ) ( not ( = ?auto_489758 ?auto_489763 ) ) ( not ( = ?auto_489758 ?auto_489764 ) ) ( not ( = ?auto_489758 ?auto_489765 ) ) ( not ( = ?auto_489758 ?auto_489766 ) ) ( not ( = ?auto_489758 ?auto_489767 ) ) ( not ( = ?auto_489758 ?auto_489768 ) ) ( not ( = ?auto_489758 ?auto_489769 ) ) ( not ( = ?auto_489758 ?auto_489770 ) ) ( not ( = ?auto_489758 ?auto_489771 ) ) ( not ( = ?auto_489759 ?auto_489760 ) ) ( not ( = ?auto_489759 ?auto_489761 ) ) ( not ( = ?auto_489759 ?auto_489762 ) ) ( not ( = ?auto_489759 ?auto_489763 ) ) ( not ( = ?auto_489759 ?auto_489764 ) ) ( not ( = ?auto_489759 ?auto_489765 ) ) ( not ( = ?auto_489759 ?auto_489766 ) ) ( not ( = ?auto_489759 ?auto_489767 ) ) ( not ( = ?auto_489759 ?auto_489768 ) ) ( not ( = ?auto_489759 ?auto_489769 ) ) ( not ( = ?auto_489759 ?auto_489770 ) ) ( not ( = ?auto_489759 ?auto_489771 ) ) ( not ( = ?auto_489760 ?auto_489761 ) ) ( not ( = ?auto_489760 ?auto_489762 ) ) ( not ( = ?auto_489760 ?auto_489763 ) ) ( not ( = ?auto_489760 ?auto_489764 ) ) ( not ( = ?auto_489760 ?auto_489765 ) ) ( not ( = ?auto_489760 ?auto_489766 ) ) ( not ( = ?auto_489760 ?auto_489767 ) ) ( not ( = ?auto_489760 ?auto_489768 ) ) ( not ( = ?auto_489760 ?auto_489769 ) ) ( not ( = ?auto_489760 ?auto_489770 ) ) ( not ( = ?auto_489760 ?auto_489771 ) ) ( not ( = ?auto_489761 ?auto_489762 ) ) ( not ( = ?auto_489761 ?auto_489763 ) ) ( not ( = ?auto_489761 ?auto_489764 ) ) ( not ( = ?auto_489761 ?auto_489765 ) ) ( not ( = ?auto_489761 ?auto_489766 ) ) ( not ( = ?auto_489761 ?auto_489767 ) ) ( not ( = ?auto_489761 ?auto_489768 ) ) ( not ( = ?auto_489761 ?auto_489769 ) ) ( not ( = ?auto_489761 ?auto_489770 ) ) ( not ( = ?auto_489761 ?auto_489771 ) ) ( not ( = ?auto_489762 ?auto_489763 ) ) ( not ( = ?auto_489762 ?auto_489764 ) ) ( not ( = ?auto_489762 ?auto_489765 ) ) ( not ( = ?auto_489762 ?auto_489766 ) ) ( not ( = ?auto_489762 ?auto_489767 ) ) ( not ( = ?auto_489762 ?auto_489768 ) ) ( not ( = ?auto_489762 ?auto_489769 ) ) ( not ( = ?auto_489762 ?auto_489770 ) ) ( not ( = ?auto_489762 ?auto_489771 ) ) ( not ( = ?auto_489763 ?auto_489764 ) ) ( not ( = ?auto_489763 ?auto_489765 ) ) ( not ( = ?auto_489763 ?auto_489766 ) ) ( not ( = ?auto_489763 ?auto_489767 ) ) ( not ( = ?auto_489763 ?auto_489768 ) ) ( not ( = ?auto_489763 ?auto_489769 ) ) ( not ( = ?auto_489763 ?auto_489770 ) ) ( not ( = ?auto_489763 ?auto_489771 ) ) ( not ( = ?auto_489764 ?auto_489765 ) ) ( not ( = ?auto_489764 ?auto_489766 ) ) ( not ( = ?auto_489764 ?auto_489767 ) ) ( not ( = ?auto_489764 ?auto_489768 ) ) ( not ( = ?auto_489764 ?auto_489769 ) ) ( not ( = ?auto_489764 ?auto_489770 ) ) ( not ( = ?auto_489764 ?auto_489771 ) ) ( not ( = ?auto_489765 ?auto_489766 ) ) ( not ( = ?auto_489765 ?auto_489767 ) ) ( not ( = ?auto_489765 ?auto_489768 ) ) ( not ( = ?auto_489765 ?auto_489769 ) ) ( not ( = ?auto_489765 ?auto_489770 ) ) ( not ( = ?auto_489765 ?auto_489771 ) ) ( not ( = ?auto_489766 ?auto_489767 ) ) ( not ( = ?auto_489766 ?auto_489768 ) ) ( not ( = ?auto_489766 ?auto_489769 ) ) ( not ( = ?auto_489766 ?auto_489770 ) ) ( not ( = ?auto_489766 ?auto_489771 ) ) ( not ( = ?auto_489767 ?auto_489768 ) ) ( not ( = ?auto_489767 ?auto_489769 ) ) ( not ( = ?auto_489767 ?auto_489770 ) ) ( not ( = ?auto_489767 ?auto_489771 ) ) ( not ( = ?auto_489768 ?auto_489769 ) ) ( not ( = ?auto_489768 ?auto_489770 ) ) ( not ( = ?auto_489768 ?auto_489771 ) ) ( not ( = ?auto_489769 ?auto_489770 ) ) ( not ( = ?auto_489769 ?auto_489771 ) ) ( not ( = ?auto_489770 ?auto_489771 ) ) ( ON ?auto_489769 ?auto_489770 ) ( ON ?auto_489768 ?auto_489769 ) ( ON ?auto_489767 ?auto_489768 ) ( ON ?auto_489766 ?auto_489767 ) ( ON ?auto_489765 ?auto_489766 ) ( ON ?auto_489764 ?auto_489765 ) ( ON ?auto_489763 ?auto_489764 ) ( ON ?auto_489762 ?auto_489763 ) ( ON ?auto_489761 ?auto_489762 ) ( ON ?auto_489760 ?auto_489761 ) ( ON ?auto_489759 ?auto_489760 ) ( CLEAR ?auto_489757 ) ( ON ?auto_489758 ?auto_489759 ) ( CLEAR ?auto_489758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_489755 ?auto_489756 ?auto_489757 ?auto_489758 )
      ( MAKE-16PILE ?auto_489755 ?auto_489756 ?auto_489757 ?auto_489758 ?auto_489759 ?auto_489760 ?auto_489761 ?auto_489762 ?auto_489763 ?auto_489764 ?auto_489765 ?auto_489766 ?auto_489767 ?auto_489768 ?auto_489769 ?auto_489770 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489788 - BLOCK
      ?auto_489789 - BLOCK
      ?auto_489790 - BLOCK
      ?auto_489791 - BLOCK
      ?auto_489792 - BLOCK
      ?auto_489793 - BLOCK
      ?auto_489794 - BLOCK
      ?auto_489795 - BLOCK
      ?auto_489796 - BLOCK
      ?auto_489797 - BLOCK
      ?auto_489798 - BLOCK
      ?auto_489799 - BLOCK
      ?auto_489800 - BLOCK
      ?auto_489801 - BLOCK
      ?auto_489802 - BLOCK
      ?auto_489803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489803 ) ( ON-TABLE ?auto_489788 ) ( ON ?auto_489789 ?auto_489788 ) ( ON ?auto_489790 ?auto_489789 ) ( not ( = ?auto_489788 ?auto_489789 ) ) ( not ( = ?auto_489788 ?auto_489790 ) ) ( not ( = ?auto_489788 ?auto_489791 ) ) ( not ( = ?auto_489788 ?auto_489792 ) ) ( not ( = ?auto_489788 ?auto_489793 ) ) ( not ( = ?auto_489788 ?auto_489794 ) ) ( not ( = ?auto_489788 ?auto_489795 ) ) ( not ( = ?auto_489788 ?auto_489796 ) ) ( not ( = ?auto_489788 ?auto_489797 ) ) ( not ( = ?auto_489788 ?auto_489798 ) ) ( not ( = ?auto_489788 ?auto_489799 ) ) ( not ( = ?auto_489788 ?auto_489800 ) ) ( not ( = ?auto_489788 ?auto_489801 ) ) ( not ( = ?auto_489788 ?auto_489802 ) ) ( not ( = ?auto_489788 ?auto_489803 ) ) ( not ( = ?auto_489789 ?auto_489790 ) ) ( not ( = ?auto_489789 ?auto_489791 ) ) ( not ( = ?auto_489789 ?auto_489792 ) ) ( not ( = ?auto_489789 ?auto_489793 ) ) ( not ( = ?auto_489789 ?auto_489794 ) ) ( not ( = ?auto_489789 ?auto_489795 ) ) ( not ( = ?auto_489789 ?auto_489796 ) ) ( not ( = ?auto_489789 ?auto_489797 ) ) ( not ( = ?auto_489789 ?auto_489798 ) ) ( not ( = ?auto_489789 ?auto_489799 ) ) ( not ( = ?auto_489789 ?auto_489800 ) ) ( not ( = ?auto_489789 ?auto_489801 ) ) ( not ( = ?auto_489789 ?auto_489802 ) ) ( not ( = ?auto_489789 ?auto_489803 ) ) ( not ( = ?auto_489790 ?auto_489791 ) ) ( not ( = ?auto_489790 ?auto_489792 ) ) ( not ( = ?auto_489790 ?auto_489793 ) ) ( not ( = ?auto_489790 ?auto_489794 ) ) ( not ( = ?auto_489790 ?auto_489795 ) ) ( not ( = ?auto_489790 ?auto_489796 ) ) ( not ( = ?auto_489790 ?auto_489797 ) ) ( not ( = ?auto_489790 ?auto_489798 ) ) ( not ( = ?auto_489790 ?auto_489799 ) ) ( not ( = ?auto_489790 ?auto_489800 ) ) ( not ( = ?auto_489790 ?auto_489801 ) ) ( not ( = ?auto_489790 ?auto_489802 ) ) ( not ( = ?auto_489790 ?auto_489803 ) ) ( not ( = ?auto_489791 ?auto_489792 ) ) ( not ( = ?auto_489791 ?auto_489793 ) ) ( not ( = ?auto_489791 ?auto_489794 ) ) ( not ( = ?auto_489791 ?auto_489795 ) ) ( not ( = ?auto_489791 ?auto_489796 ) ) ( not ( = ?auto_489791 ?auto_489797 ) ) ( not ( = ?auto_489791 ?auto_489798 ) ) ( not ( = ?auto_489791 ?auto_489799 ) ) ( not ( = ?auto_489791 ?auto_489800 ) ) ( not ( = ?auto_489791 ?auto_489801 ) ) ( not ( = ?auto_489791 ?auto_489802 ) ) ( not ( = ?auto_489791 ?auto_489803 ) ) ( not ( = ?auto_489792 ?auto_489793 ) ) ( not ( = ?auto_489792 ?auto_489794 ) ) ( not ( = ?auto_489792 ?auto_489795 ) ) ( not ( = ?auto_489792 ?auto_489796 ) ) ( not ( = ?auto_489792 ?auto_489797 ) ) ( not ( = ?auto_489792 ?auto_489798 ) ) ( not ( = ?auto_489792 ?auto_489799 ) ) ( not ( = ?auto_489792 ?auto_489800 ) ) ( not ( = ?auto_489792 ?auto_489801 ) ) ( not ( = ?auto_489792 ?auto_489802 ) ) ( not ( = ?auto_489792 ?auto_489803 ) ) ( not ( = ?auto_489793 ?auto_489794 ) ) ( not ( = ?auto_489793 ?auto_489795 ) ) ( not ( = ?auto_489793 ?auto_489796 ) ) ( not ( = ?auto_489793 ?auto_489797 ) ) ( not ( = ?auto_489793 ?auto_489798 ) ) ( not ( = ?auto_489793 ?auto_489799 ) ) ( not ( = ?auto_489793 ?auto_489800 ) ) ( not ( = ?auto_489793 ?auto_489801 ) ) ( not ( = ?auto_489793 ?auto_489802 ) ) ( not ( = ?auto_489793 ?auto_489803 ) ) ( not ( = ?auto_489794 ?auto_489795 ) ) ( not ( = ?auto_489794 ?auto_489796 ) ) ( not ( = ?auto_489794 ?auto_489797 ) ) ( not ( = ?auto_489794 ?auto_489798 ) ) ( not ( = ?auto_489794 ?auto_489799 ) ) ( not ( = ?auto_489794 ?auto_489800 ) ) ( not ( = ?auto_489794 ?auto_489801 ) ) ( not ( = ?auto_489794 ?auto_489802 ) ) ( not ( = ?auto_489794 ?auto_489803 ) ) ( not ( = ?auto_489795 ?auto_489796 ) ) ( not ( = ?auto_489795 ?auto_489797 ) ) ( not ( = ?auto_489795 ?auto_489798 ) ) ( not ( = ?auto_489795 ?auto_489799 ) ) ( not ( = ?auto_489795 ?auto_489800 ) ) ( not ( = ?auto_489795 ?auto_489801 ) ) ( not ( = ?auto_489795 ?auto_489802 ) ) ( not ( = ?auto_489795 ?auto_489803 ) ) ( not ( = ?auto_489796 ?auto_489797 ) ) ( not ( = ?auto_489796 ?auto_489798 ) ) ( not ( = ?auto_489796 ?auto_489799 ) ) ( not ( = ?auto_489796 ?auto_489800 ) ) ( not ( = ?auto_489796 ?auto_489801 ) ) ( not ( = ?auto_489796 ?auto_489802 ) ) ( not ( = ?auto_489796 ?auto_489803 ) ) ( not ( = ?auto_489797 ?auto_489798 ) ) ( not ( = ?auto_489797 ?auto_489799 ) ) ( not ( = ?auto_489797 ?auto_489800 ) ) ( not ( = ?auto_489797 ?auto_489801 ) ) ( not ( = ?auto_489797 ?auto_489802 ) ) ( not ( = ?auto_489797 ?auto_489803 ) ) ( not ( = ?auto_489798 ?auto_489799 ) ) ( not ( = ?auto_489798 ?auto_489800 ) ) ( not ( = ?auto_489798 ?auto_489801 ) ) ( not ( = ?auto_489798 ?auto_489802 ) ) ( not ( = ?auto_489798 ?auto_489803 ) ) ( not ( = ?auto_489799 ?auto_489800 ) ) ( not ( = ?auto_489799 ?auto_489801 ) ) ( not ( = ?auto_489799 ?auto_489802 ) ) ( not ( = ?auto_489799 ?auto_489803 ) ) ( not ( = ?auto_489800 ?auto_489801 ) ) ( not ( = ?auto_489800 ?auto_489802 ) ) ( not ( = ?auto_489800 ?auto_489803 ) ) ( not ( = ?auto_489801 ?auto_489802 ) ) ( not ( = ?auto_489801 ?auto_489803 ) ) ( not ( = ?auto_489802 ?auto_489803 ) ) ( ON ?auto_489802 ?auto_489803 ) ( ON ?auto_489801 ?auto_489802 ) ( ON ?auto_489800 ?auto_489801 ) ( ON ?auto_489799 ?auto_489800 ) ( ON ?auto_489798 ?auto_489799 ) ( ON ?auto_489797 ?auto_489798 ) ( ON ?auto_489796 ?auto_489797 ) ( ON ?auto_489795 ?auto_489796 ) ( ON ?auto_489794 ?auto_489795 ) ( ON ?auto_489793 ?auto_489794 ) ( ON ?auto_489792 ?auto_489793 ) ( CLEAR ?auto_489790 ) ( ON ?auto_489791 ?auto_489792 ) ( CLEAR ?auto_489791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_489788 ?auto_489789 ?auto_489790 ?auto_489791 )
      ( MAKE-16PILE ?auto_489788 ?auto_489789 ?auto_489790 ?auto_489791 ?auto_489792 ?auto_489793 ?auto_489794 ?auto_489795 ?auto_489796 ?auto_489797 ?auto_489798 ?auto_489799 ?auto_489800 ?auto_489801 ?auto_489802 ?auto_489803 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489820 - BLOCK
      ?auto_489821 - BLOCK
      ?auto_489822 - BLOCK
      ?auto_489823 - BLOCK
      ?auto_489824 - BLOCK
      ?auto_489825 - BLOCK
      ?auto_489826 - BLOCK
      ?auto_489827 - BLOCK
      ?auto_489828 - BLOCK
      ?auto_489829 - BLOCK
      ?auto_489830 - BLOCK
      ?auto_489831 - BLOCK
      ?auto_489832 - BLOCK
      ?auto_489833 - BLOCK
      ?auto_489834 - BLOCK
      ?auto_489835 - BLOCK
    )
    :vars
    (
      ?auto_489836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489835 ?auto_489836 ) ( ON-TABLE ?auto_489820 ) ( ON ?auto_489821 ?auto_489820 ) ( not ( = ?auto_489820 ?auto_489821 ) ) ( not ( = ?auto_489820 ?auto_489822 ) ) ( not ( = ?auto_489820 ?auto_489823 ) ) ( not ( = ?auto_489820 ?auto_489824 ) ) ( not ( = ?auto_489820 ?auto_489825 ) ) ( not ( = ?auto_489820 ?auto_489826 ) ) ( not ( = ?auto_489820 ?auto_489827 ) ) ( not ( = ?auto_489820 ?auto_489828 ) ) ( not ( = ?auto_489820 ?auto_489829 ) ) ( not ( = ?auto_489820 ?auto_489830 ) ) ( not ( = ?auto_489820 ?auto_489831 ) ) ( not ( = ?auto_489820 ?auto_489832 ) ) ( not ( = ?auto_489820 ?auto_489833 ) ) ( not ( = ?auto_489820 ?auto_489834 ) ) ( not ( = ?auto_489820 ?auto_489835 ) ) ( not ( = ?auto_489820 ?auto_489836 ) ) ( not ( = ?auto_489821 ?auto_489822 ) ) ( not ( = ?auto_489821 ?auto_489823 ) ) ( not ( = ?auto_489821 ?auto_489824 ) ) ( not ( = ?auto_489821 ?auto_489825 ) ) ( not ( = ?auto_489821 ?auto_489826 ) ) ( not ( = ?auto_489821 ?auto_489827 ) ) ( not ( = ?auto_489821 ?auto_489828 ) ) ( not ( = ?auto_489821 ?auto_489829 ) ) ( not ( = ?auto_489821 ?auto_489830 ) ) ( not ( = ?auto_489821 ?auto_489831 ) ) ( not ( = ?auto_489821 ?auto_489832 ) ) ( not ( = ?auto_489821 ?auto_489833 ) ) ( not ( = ?auto_489821 ?auto_489834 ) ) ( not ( = ?auto_489821 ?auto_489835 ) ) ( not ( = ?auto_489821 ?auto_489836 ) ) ( not ( = ?auto_489822 ?auto_489823 ) ) ( not ( = ?auto_489822 ?auto_489824 ) ) ( not ( = ?auto_489822 ?auto_489825 ) ) ( not ( = ?auto_489822 ?auto_489826 ) ) ( not ( = ?auto_489822 ?auto_489827 ) ) ( not ( = ?auto_489822 ?auto_489828 ) ) ( not ( = ?auto_489822 ?auto_489829 ) ) ( not ( = ?auto_489822 ?auto_489830 ) ) ( not ( = ?auto_489822 ?auto_489831 ) ) ( not ( = ?auto_489822 ?auto_489832 ) ) ( not ( = ?auto_489822 ?auto_489833 ) ) ( not ( = ?auto_489822 ?auto_489834 ) ) ( not ( = ?auto_489822 ?auto_489835 ) ) ( not ( = ?auto_489822 ?auto_489836 ) ) ( not ( = ?auto_489823 ?auto_489824 ) ) ( not ( = ?auto_489823 ?auto_489825 ) ) ( not ( = ?auto_489823 ?auto_489826 ) ) ( not ( = ?auto_489823 ?auto_489827 ) ) ( not ( = ?auto_489823 ?auto_489828 ) ) ( not ( = ?auto_489823 ?auto_489829 ) ) ( not ( = ?auto_489823 ?auto_489830 ) ) ( not ( = ?auto_489823 ?auto_489831 ) ) ( not ( = ?auto_489823 ?auto_489832 ) ) ( not ( = ?auto_489823 ?auto_489833 ) ) ( not ( = ?auto_489823 ?auto_489834 ) ) ( not ( = ?auto_489823 ?auto_489835 ) ) ( not ( = ?auto_489823 ?auto_489836 ) ) ( not ( = ?auto_489824 ?auto_489825 ) ) ( not ( = ?auto_489824 ?auto_489826 ) ) ( not ( = ?auto_489824 ?auto_489827 ) ) ( not ( = ?auto_489824 ?auto_489828 ) ) ( not ( = ?auto_489824 ?auto_489829 ) ) ( not ( = ?auto_489824 ?auto_489830 ) ) ( not ( = ?auto_489824 ?auto_489831 ) ) ( not ( = ?auto_489824 ?auto_489832 ) ) ( not ( = ?auto_489824 ?auto_489833 ) ) ( not ( = ?auto_489824 ?auto_489834 ) ) ( not ( = ?auto_489824 ?auto_489835 ) ) ( not ( = ?auto_489824 ?auto_489836 ) ) ( not ( = ?auto_489825 ?auto_489826 ) ) ( not ( = ?auto_489825 ?auto_489827 ) ) ( not ( = ?auto_489825 ?auto_489828 ) ) ( not ( = ?auto_489825 ?auto_489829 ) ) ( not ( = ?auto_489825 ?auto_489830 ) ) ( not ( = ?auto_489825 ?auto_489831 ) ) ( not ( = ?auto_489825 ?auto_489832 ) ) ( not ( = ?auto_489825 ?auto_489833 ) ) ( not ( = ?auto_489825 ?auto_489834 ) ) ( not ( = ?auto_489825 ?auto_489835 ) ) ( not ( = ?auto_489825 ?auto_489836 ) ) ( not ( = ?auto_489826 ?auto_489827 ) ) ( not ( = ?auto_489826 ?auto_489828 ) ) ( not ( = ?auto_489826 ?auto_489829 ) ) ( not ( = ?auto_489826 ?auto_489830 ) ) ( not ( = ?auto_489826 ?auto_489831 ) ) ( not ( = ?auto_489826 ?auto_489832 ) ) ( not ( = ?auto_489826 ?auto_489833 ) ) ( not ( = ?auto_489826 ?auto_489834 ) ) ( not ( = ?auto_489826 ?auto_489835 ) ) ( not ( = ?auto_489826 ?auto_489836 ) ) ( not ( = ?auto_489827 ?auto_489828 ) ) ( not ( = ?auto_489827 ?auto_489829 ) ) ( not ( = ?auto_489827 ?auto_489830 ) ) ( not ( = ?auto_489827 ?auto_489831 ) ) ( not ( = ?auto_489827 ?auto_489832 ) ) ( not ( = ?auto_489827 ?auto_489833 ) ) ( not ( = ?auto_489827 ?auto_489834 ) ) ( not ( = ?auto_489827 ?auto_489835 ) ) ( not ( = ?auto_489827 ?auto_489836 ) ) ( not ( = ?auto_489828 ?auto_489829 ) ) ( not ( = ?auto_489828 ?auto_489830 ) ) ( not ( = ?auto_489828 ?auto_489831 ) ) ( not ( = ?auto_489828 ?auto_489832 ) ) ( not ( = ?auto_489828 ?auto_489833 ) ) ( not ( = ?auto_489828 ?auto_489834 ) ) ( not ( = ?auto_489828 ?auto_489835 ) ) ( not ( = ?auto_489828 ?auto_489836 ) ) ( not ( = ?auto_489829 ?auto_489830 ) ) ( not ( = ?auto_489829 ?auto_489831 ) ) ( not ( = ?auto_489829 ?auto_489832 ) ) ( not ( = ?auto_489829 ?auto_489833 ) ) ( not ( = ?auto_489829 ?auto_489834 ) ) ( not ( = ?auto_489829 ?auto_489835 ) ) ( not ( = ?auto_489829 ?auto_489836 ) ) ( not ( = ?auto_489830 ?auto_489831 ) ) ( not ( = ?auto_489830 ?auto_489832 ) ) ( not ( = ?auto_489830 ?auto_489833 ) ) ( not ( = ?auto_489830 ?auto_489834 ) ) ( not ( = ?auto_489830 ?auto_489835 ) ) ( not ( = ?auto_489830 ?auto_489836 ) ) ( not ( = ?auto_489831 ?auto_489832 ) ) ( not ( = ?auto_489831 ?auto_489833 ) ) ( not ( = ?auto_489831 ?auto_489834 ) ) ( not ( = ?auto_489831 ?auto_489835 ) ) ( not ( = ?auto_489831 ?auto_489836 ) ) ( not ( = ?auto_489832 ?auto_489833 ) ) ( not ( = ?auto_489832 ?auto_489834 ) ) ( not ( = ?auto_489832 ?auto_489835 ) ) ( not ( = ?auto_489832 ?auto_489836 ) ) ( not ( = ?auto_489833 ?auto_489834 ) ) ( not ( = ?auto_489833 ?auto_489835 ) ) ( not ( = ?auto_489833 ?auto_489836 ) ) ( not ( = ?auto_489834 ?auto_489835 ) ) ( not ( = ?auto_489834 ?auto_489836 ) ) ( not ( = ?auto_489835 ?auto_489836 ) ) ( ON ?auto_489834 ?auto_489835 ) ( ON ?auto_489833 ?auto_489834 ) ( ON ?auto_489832 ?auto_489833 ) ( ON ?auto_489831 ?auto_489832 ) ( ON ?auto_489830 ?auto_489831 ) ( ON ?auto_489829 ?auto_489830 ) ( ON ?auto_489828 ?auto_489829 ) ( ON ?auto_489827 ?auto_489828 ) ( ON ?auto_489826 ?auto_489827 ) ( ON ?auto_489825 ?auto_489826 ) ( ON ?auto_489824 ?auto_489825 ) ( ON ?auto_489823 ?auto_489824 ) ( CLEAR ?auto_489821 ) ( ON ?auto_489822 ?auto_489823 ) ( CLEAR ?auto_489822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_489820 ?auto_489821 ?auto_489822 )
      ( MAKE-16PILE ?auto_489820 ?auto_489821 ?auto_489822 ?auto_489823 ?auto_489824 ?auto_489825 ?auto_489826 ?auto_489827 ?auto_489828 ?auto_489829 ?auto_489830 ?auto_489831 ?auto_489832 ?auto_489833 ?auto_489834 ?auto_489835 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489853 - BLOCK
      ?auto_489854 - BLOCK
      ?auto_489855 - BLOCK
      ?auto_489856 - BLOCK
      ?auto_489857 - BLOCK
      ?auto_489858 - BLOCK
      ?auto_489859 - BLOCK
      ?auto_489860 - BLOCK
      ?auto_489861 - BLOCK
      ?auto_489862 - BLOCK
      ?auto_489863 - BLOCK
      ?auto_489864 - BLOCK
      ?auto_489865 - BLOCK
      ?auto_489866 - BLOCK
      ?auto_489867 - BLOCK
      ?auto_489868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489868 ) ( ON-TABLE ?auto_489853 ) ( ON ?auto_489854 ?auto_489853 ) ( not ( = ?auto_489853 ?auto_489854 ) ) ( not ( = ?auto_489853 ?auto_489855 ) ) ( not ( = ?auto_489853 ?auto_489856 ) ) ( not ( = ?auto_489853 ?auto_489857 ) ) ( not ( = ?auto_489853 ?auto_489858 ) ) ( not ( = ?auto_489853 ?auto_489859 ) ) ( not ( = ?auto_489853 ?auto_489860 ) ) ( not ( = ?auto_489853 ?auto_489861 ) ) ( not ( = ?auto_489853 ?auto_489862 ) ) ( not ( = ?auto_489853 ?auto_489863 ) ) ( not ( = ?auto_489853 ?auto_489864 ) ) ( not ( = ?auto_489853 ?auto_489865 ) ) ( not ( = ?auto_489853 ?auto_489866 ) ) ( not ( = ?auto_489853 ?auto_489867 ) ) ( not ( = ?auto_489853 ?auto_489868 ) ) ( not ( = ?auto_489854 ?auto_489855 ) ) ( not ( = ?auto_489854 ?auto_489856 ) ) ( not ( = ?auto_489854 ?auto_489857 ) ) ( not ( = ?auto_489854 ?auto_489858 ) ) ( not ( = ?auto_489854 ?auto_489859 ) ) ( not ( = ?auto_489854 ?auto_489860 ) ) ( not ( = ?auto_489854 ?auto_489861 ) ) ( not ( = ?auto_489854 ?auto_489862 ) ) ( not ( = ?auto_489854 ?auto_489863 ) ) ( not ( = ?auto_489854 ?auto_489864 ) ) ( not ( = ?auto_489854 ?auto_489865 ) ) ( not ( = ?auto_489854 ?auto_489866 ) ) ( not ( = ?auto_489854 ?auto_489867 ) ) ( not ( = ?auto_489854 ?auto_489868 ) ) ( not ( = ?auto_489855 ?auto_489856 ) ) ( not ( = ?auto_489855 ?auto_489857 ) ) ( not ( = ?auto_489855 ?auto_489858 ) ) ( not ( = ?auto_489855 ?auto_489859 ) ) ( not ( = ?auto_489855 ?auto_489860 ) ) ( not ( = ?auto_489855 ?auto_489861 ) ) ( not ( = ?auto_489855 ?auto_489862 ) ) ( not ( = ?auto_489855 ?auto_489863 ) ) ( not ( = ?auto_489855 ?auto_489864 ) ) ( not ( = ?auto_489855 ?auto_489865 ) ) ( not ( = ?auto_489855 ?auto_489866 ) ) ( not ( = ?auto_489855 ?auto_489867 ) ) ( not ( = ?auto_489855 ?auto_489868 ) ) ( not ( = ?auto_489856 ?auto_489857 ) ) ( not ( = ?auto_489856 ?auto_489858 ) ) ( not ( = ?auto_489856 ?auto_489859 ) ) ( not ( = ?auto_489856 ?auto_489860 ) ) ( not ( = ?auto_489856 ?auto_489861 ) ) ( not ( = ?auto_489856 ?auto_489862 ) ) ( not ( = ?auto_489856 ?auto_489863 ) ) ( not ( = ?auto_489856 ?auto_489864 ) ) ( not ( = ?auto_489856 ?auto_489865 ) ) ( not ( = ?auto_489856 ?auto_489866 ) ) ( not ( = ?auto_489856 ?auto_489867 ) ) ( not ( = ?auto_489856 ?auto_489868 ) ) ( not ( = ?auto_489857 ?auto_489858 ) ) ( not ( = ?auto_489857 ?auto_489859 ) ) ( not ( = ?auto_489857 ?auto_489860 ) ) ( not ( = ?auto_489857 ?auto_489861 ) ) ( not ( = ?auto_489857 ?auto_489862 ) ) ( not ( = ?auto_489857 ?auto_489863 ) ) ( not ( = ?auto_489857 ?auto_489864 ) ) ( not ( = ?auto_489857 ?auto_489865 ) ) ( not ( = ?auto_489857 ?auto_489866 ) ) ( not ( = ?auto_489857 ?auto_489867 ) ) ( not ( = ?auto_489857 ?auto_489868 ) ) ( not ( = ?auto_489858 ?auto_489859 ) ) ( not ( = ?auto_489858 ?auto_489860 ) ) ( not ( = ?auto_489858 ?auto_489861 ) ) ( not ( = ?auto_489858 ?auto_489862 ) ) ( not ( = ?auto_489858 ?auto_489863 ) ) ( not ( = ?auto_489858 ?auto_489864 ) ) ( not ( = ?auto_489858 ?auto_489865 ) ) ( not ( = ?auto_489858 ?auto_489866 ) ) ( not ( = ?auto_489858 ?auto_489867 ) ) ( not ( = ?auto_489858 ?auto_489868 ) ) ( not ( = ?auto_489859 ?auto_489860 ) ) ( not ( = ?auto_489859 ?auto_489861 ) ) ( not ( = ?auto_489859 ?auto_489862 ) ) ( not ( = ?auto_489859 ?auto_489863 ) ) ( not ( = ?auto_489859 ?auto_489864 ) ) ( not ( = ?auto_489859 ?auto_489865 ) ) ( not ( = ?auto_489859 ?auto_489866 ) ) ( not ( = ?auto_489859 ?auto_489867 ) ) ( not ( = ?auto_489859 ?auto_489868 ) ) ( not ( = ?auto_489860 ?auto_489861 ) ) ( not ( = ?auto_489860 ?auto_489862 ) ) ( not ( = ?auto_489860 ?auto_489863 ) ) ( not ( = ?auto_489860 ?auto_489864 ) ) ( not ( = ?auto_489860 ?auto_489865 ) ) ( not ( = ?auto_489860 ?auto_489866 ) ) ( not ( = ?auto_489860 ?auto_489867 ) ) ( not ( = ?auto_489860 ?auto_489868 ) ) ( not ( = ?auto_489861 ?auto_489862 ) ) ( not ( = ?auto_489861 ?auto_489863 ) ) ( not ( = ?auto_489861 ?auto_489864 ) ) ( not ( = ?auto_489861 ?auto_489865 ) ) ( not ( = ?auto_489861 ?auto_489866 ) ) ( not ( = ?auto_489861 ?auto_489867 ) ) ( not ( = ?auto_489861 ?auto_489868 ) ) ( not ( = ?auto_489862 ?auto_489863 ) ) ( not ( = ?auto_489862 ?auto_489864 ) ) ( not ( = ?auto_489862 ?auto_489865 ) ) ( not ( = ?auto_489862 ?auto_489866 ) ) ( not ( = ?auto_489862 ?auto_489867 ) ) ( not ( = ?auto_489862 ?auto_489868 ) ) ( not ( = ?auto_489863 ?auto_489864 ) ) ( not ( = ?auto_489863 ?auto_489865 ) ) ( not ( = ?auto_489863 ?auto_489866 ) ) ( not ( = ?auto_489863 ?auto_489867 ) ) ( not ( = ?auto_489863 ?auto_489868 ) ) ( not ( = ?auto_489864 ?auto_489865 ) ) ( not ( = ?auto_489864 ?auto_489866 ) ) ( not ( = ?auto_489864 ?auto_489867 ) ) ( not ( = ?auto_489864 ?auto_489868 ) ) ( not ( = ?auto_489865 ?auto_489866 ) ) ( not ( = ?auto_489865 ?auto_489867 ) ) ( not ( = ?auto_489865 ?auto_489868 ) ) ( not ( = ?auto_489866 ?auto_489867 ) ) ( not ( = ?auto_489866 ?auto_489868 ) ) ( not ( = ?auto_489867 ?auto_489868 ) ) ( ON ?auto_489867 ?auto_489868 ) ( ON ?auto_489866 ?auto_489867 ) ( ON ?auto_489865 ?auto_489866 ) ( ON ?auto_489864 ?auto_489865 ) ( ON ?auto_489863 ?auto_489864 ) ( ON ?auto_489862 ?auto_489863 ) ( ON ?auto_489861 ?auto_489862 ) ( ON ?auto_489860 ?auto_489861 ) ( ON ?auto_489859 ?auto_489860 ) ( ON ?auto_489858 ?auto_489859 ) ( ON ?auto_489857 ?auto_489858 ) ( ON ?auto_489856 ?auto_489857 ) ( CLEAR ?auto_489854 ) ( ON ?auto_489855 ?auto_489856 ) ( CLEAR ?auto_489855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_489853 ?auto_489854 ?auto_489855 )
      ( MAKE-16PILE ?auto_489853 ?auto_489854 ?auto_489855 ?auto_489856 ?auto_489857 ?auto_489858 ?auto_489859 ?auto_489860 ?auto_489861 ?auto_489862 ?auto_489863 ?auto_489864 ?auto_489865 ?auto_489866 ?auto_489867 ?auto_489868 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489885 - BLOCK
      ?auto_489886 - BLOCK
      ?auto_489887 - BLOCK
      ?auto_489888 - BLOCK
      ?auto_489889 - BLOCK
      ?auto_489890 - BLOCK
      ?auto_489891 - BLOCK
      ?auto_489892 - BLOCK
      ?auto_489893 - BLOCK
      ?auto_489894 - BLOCK
      ?auto_489895 - BLOCK
      ?auto_489896 - BLOCK
      ?auto_489897 - BLOCK
      ?auto_489898 - BLOCK
      ?auto_489899 - BLOCK
      ?auto_489900 - BLOCK
    )
    :vars
    (
      ?auto_489901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489900 ?auto_489901 ) ( ON-TABLE ?auto_489885 ) ( not ( = ?auto_489885 ?auto_489886 ) ) ( not ( = ?auto_489885 ?auto_489887 ) ) ( not ( = ?auto_489885 ?auto_489888 ) ) ( not ( = ?auto_489885 ?auto_489889 ) ) ( not ( = ?auto_489885 ?auto_489890 ) ) ( not ( = ?auto_489885 ?auto_489891 ) ) ( not ( = ?auto_489885 ?auto_489892 ) ) ( not ( = ?auto_489885 ?auto_489893 ) ) ( not ( = ?auto_489885 ?auto_489894 ) ) ( not ( = ?auto_489885 ?auto_489895 ) ) ( not ( = ?auto_489885 ?auto_489896 ) ) ( not ( = ?auto_489885 ?auto_489897 ) ) ( not ( = ?auto_489885 ?auto_489898 ) ) ( not ( = ?auto_489885 ?auto_489899 ) ) ( not ( = ?auto_489885 ?auto_489900 ) ) ( not ( = ?auto_489885 ?auto_489901 ) ) ( not ( = ?auto_489886 ?auto_489887 ) ) ( not ( = ?auto_489886 ?auto_489888 ) ) ( not ( = ?auto_489886 ?auto_489889 ) ) ( not ( = ?auto_489886 ?auto_489890 ) ) ( not ( = ?auto_489886 ?auto_489891 ) ) ( not ( = ?auto_489886 ?auto_489892 ) ) ( not ( = ?auto_489886 ?auto_489893 ) ) ( not ( = ?auto_489886 ?auto_489894 ) ) ( not ( = ?auto_489886 ?auto_489895 ) ) ( not ( = ?auto_489886 ?auto_489896 ) ) ( not ( = ?auto_489886 ?auto_489897 ) ) ( not ( = ?auto_489886 ?auto_489898 ) ) ( not ( = ?auto_489886 ?auto_489899 ) ) ( not ( = ?auto_489886 ?auto_489900 ) ) ( not ( = ?auto_489886 ?auto_489901 ) ) ( not ( = ?auto_489887 ?auto_489888 ) ) ( not ( = ?auto_489887 ?auto_489889 ) ) ( not ( = ?auto_489887 ?auto_489890 ) ) ( not ( = ?auto_489887 ?auto_489891 ) ) ( not ( = ?auto_489887 ?auto_489892 ) ) ( not ( = ?auto_489887 ?auto_489893 ) ) ( not ( = ?auto_489887 ?auto_489894 ) ) ( not ( = ?auto_489887 ?auto_489895 ) ) ( not ( = ?auto_489887 ?auto_489896 ) ) ( not ( = ?auto_489887 ?auto_489897 ) ) ( not ( = ?auto_489887 ?auto_489898 ) ) ( not ( = ?auto_489887 ?auto_489899 ) ) ( not ( = ?auto_489887 ?auto_489900 ) ) ( not ( = ?auto_489887 ?auto_489901 ) ) ( not ( = ?auto_489888 ?auto_489889 ) ) ( not ( = ?auto_489888 ?auto_489890 ) ) ( not ( = ?auto_489888 ?auto_489891 ) ) ( not ( = ?auto_489888 ?auto_489892 ) ) ( not ( = ?auto_489888 ?auto_489893 ) ) ( not ( = ?auto_489888 ?auto_489894 ) ) ( not ( = ?auto_489888 ?auto_489895 ) ) ( not ( = ?auto_489888 ?auto_489896 ) ) ( not ( = ?auto_489888 ?auto_489897 ) ) ( not ( = ?auto_489888 ?auto_489898 ) ) ( not ( = ?auto_489888 ?auto_489899 ) ) ( not ( = ?auto_489888 ?auto_489900 ) ) ( not ( = ?auto_489888 ?auto_489901 ) ) ( not ( = ?auto_489889 ?auto_489890 ) ) ( not ( = ?auto_489889 ?auto_489891 ) ) ( not ( = ?auto_489889 ?auto_489892 ) ) ( not ( = ?auto_489889 ?auto_489893 ) ) ( not ( = ?auto_489889 ?auto_489894 ) ) ( not ( = ?auto_489889 ?auto_489895 ) ) ( not ( = ?auto_489889 ?auto_489896 ) ) ( not ( = ?auto_489889 ?auto_489897 ) ) ( not ( = ?auto_489889 ?auto_489898 ) ) ( not ( = ?auto_489889 ?auto_489899 ) ) ( not ( = ?auto_489889 ?auto_489900 ) ) ( not ( = ?auto_489889 ?auto_489901 ) ) ( not ( = ?auto_489890 ?auto_489891 ) ) ( not ( = ?auto_489890 ?auto_489892 ) ) ( not ( = ?auto_489890 ?auto_489893 ) ) ( not ( = ?auto_489890 ?auto_489894 ) ) ( not ( = ?auto_489890 ?auto_489895 ) ) ( not ( = ?auto_489890 ?auto_489896 ) ) ( not ( = ?auto_489890 ?auto_489897 ) ) ( not ( = ?auto_489890 ?auto_489898 ) ) ( not ( = ?auto_489890 ?auto_489899 ) ) ( not ( = ?auto_489890 ?auto_489900 ) ) ( not ( = ?auto_489890 ?auto_489901 ) ) ( not ( = ?auto_489891 ?auto_489892 ) ) ( not ( = ?auto_489891 ?auto_489893 ) ) ( not ( = ?auto_489891 ?auto_489894 ) ) ( not ( = ?auto_489891 ?auto_489895 ) ) ( not ( = ?auto_489891 ?auto_489896 ) ) ( not ( = ?auto_489891 ?auto_489897 ) ) ( not ( = ?auto_489891 ?auto_489898 ) ) ( not ( = ?auto_489891 ?auto_489899 ) ) ( not ( = ?auto_489891 ?auto_489900 ) ) ( not ( = ?auto_489891 ?auto_489901 ) ) ( not ( = ?auto_489892 ?auto_489893 ) ) ( not ( = ?auto_489892 ?auto_489894 ) ) ( not ( = ?auto_489892 ?auto_489895 ) ) ( not ( = ?auto_489892 ?auto_489896 ) ) ( not ( = ?auto_489892 ?auto_489897 ) ) ( not ( = ?auto_489892 ?auto_489898 ) ) ( not ( = ?auto_489892 ?auto_489899 ) ) ( not ( = ?auto_489892 ?auto_489900 ) ) ( not ( = ?auto_489892 ?auto_489901 ) ) ( not ( = ?auto_489893 ?auto_489894 ) ) ( not ( = ?auto_489893 ?auto_489895 ) ) ( not ( = ?auto_489893 ?auto_489896 ) ) ( not ( = ?auto_489893 ?auto_489897 ) ) ( not ( = ?auto_489893 ?auto_489898 ) ) ( not ( = ?auto_489893 ?auto_489899 ) ) ( not ( = ?auto_489893 ?auto_489900 ) ) ( not ( = ?auto_489893 ?auto_489901 ) ) ( not ( = ?auto_489894 ?auto_489895 ) ) ( not ( = ?auto_489894 ?auto_489896 ) ) ( not ( = ?auto_489894 ?auto_489897 ) ) ( not ( = ?auto_489894 ?auto_489898 ) ) ( not ( = ?auto_489894 ?auto_489899 ) ) ( not ( = ?auto_489894 ?auto_489900 ) ) ( not ( = ?auto_489894 ?auto_489901 ) ) ( not ( = ?auto_489895 ?auto_489896 ) ) ( not ( = ?auto_489895 ?auto_489897 ) ) ( not ( = ?auto_489895 ?auto_489898 ) ) ( not ( = ?auto_489895 ?auto_489899 ) ) ( not ( = ?auto_489895 ?auto_489900 ) ) ( not ( = ?auto_489895 ?auto_489901 ) ) ( not ( = ?auto_489896 ?auto_489897 ) ) ( not ( = ?auto_489896 ?auto_489898 ) ) ( not ( = ?auto_489896 ?auto_489899 ) ) ( not ( = ?auto_489896 ?auto_489900 ) ) ( not ( = ?auto_489896 ?auto_489901 ) ) ( not ( = ?auto_489897 ?auto_489898 ) ) ( not ( = ?auto_489897 ?auto_489899 ) ) ( not ( = ?auto_489897 ?auto_489900 ) ) ( not ( = ?auto_489897 ?auto_489901 ) ) ( not ( = ?auto_489898 ?auto_489899 ) ) ( not ( = ?auto_489898 ?auto_489900 ) ) ( not ( = ?auto_489898 ?auto_489901 ) ) ( not ( = ?auto_489899 ?auto_489900 ) ) ( not ( = ?auto_489899 ?auto_489901 ) ) ( not ( = ?auto_489900 ?auto_489901 ) ) ( ON ?auto_489899 ?auto_489900 ) ( ON ?auto_489898 ?auto_489899 ) ( ON ?auto_489897 ?auto_489898 ) ( ON ?auto_489896 ?auto_489897 ) ( ON ?auto_489895 ?auto_489896 ) ( ON ?auto_489894 ?auto_489895 ) ( ON ?auto_489893 ?auto_489894 ) ( ON ?auto_489892 ?auto_489893 ) ( ON ?auto_489891 ?auto_489892 ) ( ON ?auto_489890 ?auto_489891 ) ( ON ?auto_489889 ?auto_489890 ) ( ON ?auto_489888 ?auto_489889 ) ( ON ?auto_489887 ?auto_489888 ) ( CLEAR ?auto_489885 ) ( ON ?auto_489886 ?auto_489887 ) ( CLEAR ?auto_489886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_489885 ?auto_489886 )
      ( MAKE-16PILE ?auto_489885 ?auto_489886 ?auto_489887 ?auto_489888 ?auto_489889 ?auto_489890 ?auto_489891 ?auto_489892 ?auto_489893 ?auto_489894 ?auto_489895 ?auto_489896 ?auto_489897 ?auto_489898 ?auto_489899 ?auto_489900 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489918 - BLOCK
      ?auto_489919 - BLOCK
      ?auto_489920 - BLOCK
      ?auto_489921 - BLOCK
      ?auto_489922 - BLOCK
      ?auto_489923 - BLOCK
      ?auto_489924 - BLOCK
      ?auto_489925 - BLOCK
      ?auto_489926 - BLOCK
      ?auto_489927 - BLOCK
      ?auto_489928 - BLOCK
      ?auto_489929 - BLOCK
      ?auto_489930 - BLOCK
      ?auto_489931 - BLOCK
      ?auto_489932 - BLOCK
      ?auto_489933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489933 ) ( ON-TABLE ?auto_489918 ) ( not ( = ?auto_489918 ?auto_489919 ) ) ( not ( = ?auto_489918 ?auto_489920 ) ) ( not ( = ?auto_489918 ?auto_489921 ) ) ( not ( = ?auto_489918 ?auto_489922 ) ) ( not ( = ?auto_489918 ?auto_489923 ) ) ( not ( = ?auto_489918 ?auto_489924 ) ) ( not ( = ?auto_489918 ?auto_489925 ) ) ( not ( = ?auto_489918 ?auto_489926 ) ) ( not ( = ?auto_489918 ?auto_489927 ) ) ( not ( = ?auto_489918 ?auto_489928 ) ) ( not ( = ?auto_489918 ?auto_489929 ) ) ( not ( = ?auto_489918 ?auto_489930 ) ) ( not ( = ?auto_489918 ?auto_489931 ) ) ( not ( = ?auto_489918 ?auto_489932 ) ) ( not ( = ?auto_489918 ?auto_489933 ) ) ( not ( = ?auto_489919 ?auto_489920 ) ) ( not ( = ?auto_489919 ?auto_489921 ) ) ( not ( = ?auto_489919 ?auto_489922 ) ) ( not ( = ?auto_489919 ?auto_489923 ) ) ( not ( = ?auto_489919 ?auto_489924 ) ) ( not ( = ?auto_489919 ?auto_489925 ) ) ( not ( = ?auto_489919 ?auto_489926 ) ) ( not ( = ?auto_489919 ?auto_489927 ) ) ( not ( = ?auto_489919 ?auto_489928 ) ) ( not ( = ?auto_489919 ?auto_489929 ) ) ( not ( = ?auto_489919 ?auto_489930 ) ) ( not ( = ?auto_489919 ?auto_489931 ) ) ( not ( = ?auto_489919 ?auto_489932 ) ) ( not ( = ?auto_489919 ?auto_489933 ) ) ( not ( = ?auto_489920 ?auto_489921 ) ) ( not ( = ?auto_489920 ?auto_489922 ) ) ( not ( = ?auto_489920 ?auto_489923 ) ) ( not ( = ?auto_489920 ?auto_489924 ) ) ( not ( = ?auto_489920 ?auto_489925 ) ) ( not ( = ?auto_489920 ?auto_489926 ) ) ( not ( = ?auto_489920 ?auto_489927 ) ) ( not ( = ?auto_489920 ?auto_489928 ) ) ( not ( = ?auto_489920 ?auto_489929 ) ) ( not ( = ?auto_489920 ?auto_489930 ) ) ( not ( = ?auto_489920 ?auto_489931 ) ) ( not ( = ?auto_489920 ?auto_489932 ) ) ( not ( = ?auto_489920 ?auto_489933 ) ) ( not ( = ?auto_489921 ?auto_489922 ) ) ( not ( = ?auto_489921 ?auto_489923 ) ) ( not ( = ?auto_489921 ?auto_489924 ) ) ( not ( = ?auto_489921 ?auto_489925 ) ) ( not ( = ?auto_489921 ?auto_489926 ) ) ( not ( = ?auto_489921 ?auto_489927 ) ) ( not ( = ?auto_489921 ?auto_489928 ) ) ( not ( = ?auto_489921 ?auto_489929 ) ) ( not ( = ?auto_489921 ?auto_489930 ) ) ( not ( = ?auto_489921 ?auto_489931 ) ) ( not ( = ?auto_489921 ?auto_489932 ) ) ( not ( = ?auto_489921 ?auto_489933 ) ) ( not ( = ?auto_489922 ?auto_489923 ) ) ( not ( = ?auto_489922 ?auto_489924 ) ) ( not ( = ?auto_489922 ?auto_489925 ) ) ( not ( = ?auto_489922 ?auto_489926 ) ) ( not ( = ?auto_489922 ?auto_489927 ) ) ( not ( = ?auto_489922 ?auto_489928 ) ) ( not ( = ?auto_489922 ?auto_489929 ) ) ( not ( = ?auto_489922 ?auto_489930 ) ) ( not ( = ?auto_489922 ?auto_489931 ) ) ( not ( = ?auto_489922 ?auto_489932 ) ) ( not ( = ?auto_489922 ?auto_489933 ) ) ( not ( = ?auto_489923 ?auto_489924 ) ) ( not ( = ?auto_489923 ?auto_489925 ) ) ( not ( = ?auto_489923 ?auto_489926 ) ) ( not ( = ?auto_489923 ?auto_489927 ) ) ( not ( = ?auto_489923 ?auto_489928 ) ) ( not ( = ?auto_489923 ?auto_489929 ) ) ( not ( = ?auto_489923 ?auto_489930 ) ) ( not ( = ?auto_489923 ?auto_489931 ) ) ( not ( = ?auto_489923 ?auto_489932 ) ) ( not ( = ?auto_489923 ?auto_489933 ) ) ( not ( = ?auto_489924 ?auto_489925 ) ) ( not ( = ?auto_489924 ?auto_489926 ) ) ( not ( = ?auto_489924 ?auto_489927 ) ) ( not ( = ?auto_489924 ?auto_489928 ) ) ( not ( = ?auto_489924 ?auto_489929 ) ) ( not ( = ?auto_489924 ?auto_489930 ) ) ( not ( = ?auto_489924 ?auto_489931 ) ) ( not ( = ?auto_489924 ?auto_489932 ) ) ( not ( = ?auto_489924 ?auto_489933 ) ) ( not ( = ?auto_489925 ?auto_489926 ) ) ( not ( = ?auto_489925 ?auto_489927 ) ) ( not ( = ?auto_489925 ?auto_489928 ) ) ( not ( = ?auto_489925 ?auto_489929 ) ) ( not ( = ?auto_489925 ?auto_489930 ) ) ( not ( = ?auto_489925 ?auto_489931 ) ) ( not ( = ?auto_489925 ?auto_489932 ) ) ( not ( = ?auto_489925 ?auto_489933 ) ) ( not ( = ?auto_489926 ?auto_489927 ) ) ( not ( = ?auto_489926 ?auto_489928 ) ) ( not ( = ?auto_489926 ?auto_489929 ) ) ( not ( = ?auto_489926 ?auto_489930 ) ) ( not ( = ?auto_489926 ?auto_489931 ) ) ( not ( = ?auto_489926 ?auto_489932 ) ) ( not ( = ?auto_489926 ?auto_489933 ) ) ( not ( = ?auto_489927 ?auto_489928 ) ) ( not ( = ?auto_489927 ?auto_489929 ) ) ( not ( = ?auto_489927 ?auto_489930 ) ) ( not ( = ?auto_489927 ?auto_489931 ) ) ( not ( = ?auto_489927 ?auto_489932 ) ) ( not ( = ?auto_489927 ?auto_489933 ) ) ( not ( = ?auto_489928 ?auto_489929 ) ) ( not ( = ?auto_489928 ?auto_489930 ) ) ( not ( = ?auto_489928 ?auto_489931 ) ) ( not ( = ?auto_489928 ?auto_489932 ) ) ( not ( = ?auto_489928 ?auto_489933 ) ) ( not ( = ?auto_489929 ?auto_489930 ) ) ( not ( = ?auto_489929 ?auto_489931 ) ) ( not ( = ?auto_489929 ?auto_489932 ) ) ( not ( = ?auto_489929 ?auto_489933 ) ) ( not ( = ?auto_489930 ?auto_489931 ) ) ( not ( = ?auto_489930 ?auto_489932 ) ) ( not ( = ?auto_489930 ?auto_489933 ) ) ( not ( = ?auto_489931 ?auto_489932 ) ) ( not ( = ?auto_489931 ?auto_489933 ) ) ( not ( = ?auto_489932 ?auto_489933 ) ) ( ON ?auto_489932 ?auto_489933 ) ( ON ?auto_489931 ?auto_489932 ) ( ON ?auto_489930 ?auto_489931 ) ( ON ?auto_489929 ?auto_489930 ) ( ON ?auto_489928 ?auto_489929 ) ( ON ?auto_489927 ?auto_489928 ) ( ON ?auto_489926 ?auto_489927 ) ( ON ?auto_489925 ?auto_489926 ) ( ON ?auto_489924 ?auto_489925 ) ( ON ?auto_489923 ?auto_489924 ) ( ON ?auto_489922 ?auto_489923 ) ( ON ?auto_489921 ?auto_489922 ) ( ON ?auto_489920 ?auto_489921 ) ( CLEAR ?auto_489918 ) ( ON ?auto_489919 ?auto_489920 ) ( CLEAR ?auto_489919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_489918 ?auto_489919 )
      ( MAKE-16PILE ?auto_489918 ?auto_489919 ?auto_489920 ?auto_489921 ?auto_489922 ?auto_489923 ?auto_489924 ?auto_489925 ?auto_489926 ?auto_489927 ?auto_489928 ?auto_489929 ?auto_489930 ?auto_489931 ?auto_489932 ?auto_489933 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489950 - BLOCK
      ?auto_489951 - BLOCK
      ?auto_489952 - BLOCK
      ?auto_489953 - BLOCK
      ?auto_489954 - BLOCK
      ?auto_489955 - BLOCK
      ?auto_489956 - BLOCK
      ?auto_489957 - BLOCK
      ?auto_489958 - BLOCK
      ?auto_489959 - BLOCK
      ?auto_489960 - BLOCK
      ?auto_489961 - BLOCK
      ?auto_489962 - BLOCK
      ?auto_489963 - BLOCK
      ?auto_489964 - BLOCK
      ?auto_489965 - BLOCK
    )
    :vars
    (
      ?auto_489966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_489965 ?auto_489966 ) ( not ( = ?auto_489950 ?auto_489951 ) ) ( not ( = ?auto_489950 ?auto_489952 ) ) ( not ( = ?auto_489950 ?auto_489953 ) ) ( not ( = ?auto_489950 ?auto_489954 ) ) ( not ( = ?auto_489950 ?auto_489955 ) ) ( not ( = ?auto_489950 ?auto_489956 ) ) ( not ( = ?auto_489950 ?auto_489957 ) ) ( not ( = ?auto_489950 ?auto_489958 ) ) ( not ( = ?auto_489950 ?auto_489959 ) ) ( not ( = ?auto_489950 ?auto_489960 ) ) ( not ( = ?auto_489950 ?auto_489961 ) ) ( not ( = ?auto_489950 ?auto_489962 ) ) ( not ( = ?auto_489950 ?auto_489963 ) ) ( not ( = ?auto_489950 ?auto_489964 ) ) ( not ( = ?auto_489950 ?auto_489965 ) ) ( not ( = ?auto_489950 ?auto_489966 ) ) ( not ( = ?auto_489951 ?auto_489952 ) ) ( not ( = ?auto_489951 ?auto_489953 ) ) ( not ( = ?auto_489951 ?auto_489954 ) ) ( not ( = ?auto_489951 ?auto_489955 ) ) ( not ( = ?auto_489951 ?auto_489956 ) ) ( not ( = ?auto_489951 ?auto_489957 ) ) ( not ( = ?auto_489951 ?auto_489958 ) ) ( not ( = ?auto_489951 ?auto_489959 ) ) ( not ( = ?auto_489951 ?auto_489960 ) ) ( not ( = ?auto_489951 ?auto_489961 ) ) ( not ( = ?auto_489951 ?auto_489962 ) ) ( not ( = ?auto_489951 ?auto_489963 ) ) ( not ( = ?auto_489951 ?auto_489964 ) ) ( not ( = ?auto_489951 ?auto_489965 ) ) ( not ( = ?auto_489951 ?auto_489966 ) ) ( not ( = ?auto_489952 ?auto_489953 ) ) ( not ( = ?auto_489952 ?auto_489954 ) ) ( not ( = ?auto_489952 ?auto_489955 ) ) ( not ( = ?auto_489952 ?auto_489956 ) ) ( not ( = ?auto_489952 ?auto_489957 ) ) ( not ( = ?auto_489952 ?auto_489958 ) ) ( not ( = ?auto_489952 ?auto_489959 ) ) ( not ( = ?auto_489952 ?auto_489960 ) ) ( not ( = ?auto_489952 ?auto_489961 ) ) ( not ( = ?auto_489952 ?auto_489962 ) ) ( not ( = ?auto_489952 ?auto_489963 ) ) ( not ( = ?auto_489952 ?auto_489964 ) ) ( not ( = ?auto_489952 ?auto_489965 ) ) ( not ( = ?auto_489952 ?auto_489966 ) ) ( not ( = ?auto_489953 ?auto_489954 ) ) ( not ( = ?auto_489953 ?auto_489955 ) ) ( not ( = ?auto_489953 ?auto_489956 ) ) ( not ( = ?auto_489953 ?auto_489957 ) ) ( not ( = ?auto_489953 ?auto_489958 ) ) ( not ( = ?auto_489953 ?auto_489959 ) ) ( not ( = ?auto_489953 ?auto_489960 ) ) ( not ( = ?auto_489953 ?auto_489961 ) ) ( not ( = ?auto_489953 ?auto_489962 ) ) ( not ( = ?auto_489953 ?auto_489963 ) ) ( not ( = ?auto_489953 ?auto_489964 ) ) ( not ( = ?auto_489953 ?auto_489965 ) ) ( not ( = ?auto_489953 ?auto_489966 ) ) ( not ( = ?auto_489954 ?auto_489955 ) ) ( not ( = ?auto_489954 ?auto_489956 ) ) ( not ( = ?auto_489954 ?auto_489957 ) ) ( not ( = ?auto_489954 ?auto_489958 ) ) ( not ( = ?auto_489954 ?auto_489959 ) ) ( not ( = ?auto_489954 ?auto_489960 ) ) ( not ( = ?auto_489954 ?auto_489961 ) ) ( not ( = ?auto_489954 ?auto_489962 ) ) ( not ( = ?auto_489954 ?auto_489963 ) ) ( not ( = ?auto_489954 ?auto_489964 ) ) ( not ( = ?auto_489954 ?auto_489965 ) ) ( not ( = ?auto_489954 ?auto_489966 ) ) ( not ( = ?auto_489955 ?auto_489956 ) ) ( not ( = ?auto_489955 ?auto_489957 ) ) ( not ( = ?auto_489955 ?auto_489958 ) ) ( not ( = ?auto_489955 ?auto_489959 ) ) ( not ( = ?auto_489955 ?auto_489960 ) ) ( not ( = ?auto_489955 ?auto_489961 ) ) ( not ( = ?auto_489955 ?auto_489962 ) ) ( not ( = ?auto_489955 ?auto_489963 ) ) ( not ( = ?auto_489955 ?auto_489964 ) ) ( not ( = ?auto_489955 ?auto_489965 ) ) ( not ( = ?auto_489955 ?auto_489966 ) ) ( not ( = ?auto_489956 ?auto_489957 ) ) ( not ( = ?auto_489956 ?auto_489958 ) ) ( not ( = ?auto_489956 ?auto_489959 ) ) ( not ( = ?auto_489956 ?auto_489960 ) ) ( not ( = ?auto_489956 ?auto_489961 ) ) ( not ( = ?auto_489956 ?auto_489962 ) ) ( not ( = ?auto_489956 ?auto_489963 ) ) ( not ( = ?auto_489956 ?auto_489964 ) ) ( not ( = ?auto_489956 ?auto_489965 ) ) ( not ( = ?auto_489956 ?auto_489966 ) ) ( not ( = ?auto_489957 ?auto_489958 ) ) ( not ( = ?auto_489957 ?auto_489959 ) ) ( not ( = ?auto_489957 ?auto_489960 ) ) ( not ( = ?auto_489957 ?auto_489961 ) ) ( not ( = ?auto_489957 ?auto_489962 ) ) ( not ( = ?auto_489957 ?auto_489963 ) ) ( not ( = ?auto_489957 ?auto_489964 ) ) ( not ( = ?auto_489957 ?auto_489965 ) ) ( not ( = ?auto_489957 ?auto_489966 ) ) ( not ( = ?auto_489958 ?auto_489959 ) ) ( not ( = ?auto_489958 ?auto_489960 ) ) ( not ( = ?auto_489958 ?auto_489961 ) ) ( not ( = ?auto_489958 ?auto_489962 ) ) ( not ( = ?auto_489958 ?auto_489963 ) ) ( not ( = ?auto_489958 ?auto_489964 ) ) ( not ( = ?auto_489958 ?auto_489965 ) ) ( not ( = ?auto_489958 ?auto_489966 ) ) ( not ( = ?auto_489959 ?auto_489960 ) ) ( not ( = ?auto_489959 ?auto_489961 ) ) ( not ( = ?auto_489959 ?auto_489962 ) ) ( not ( = ?auto_489959 ?auto_489963 ) ) ( not ( = ?auto_489959 ?auto_489964 ) ) ( not ( = ?auto_489959 ?auto_489965 ) ) ( not ( = ?auto_489959 ?auto_489966 ) ) ( not ( = ?auto_489960 ?auto_489961 ) ) ( not ( = ?auto_489960 ?auto_489962 ) ) ( not ( = ?auto_489960 ?auto_489963 ) ) ( not ( = ?auto_489960 ?auto_489964 ) ) ( not ( = ?auto_489960 ?auto_489965 ) ) ( not ( = ?auto_489960 ?auto_489966 ) ) ( not ( = ?auto_489961 ?auto_489962 ) ) ( not ( = ?auto_489961 ?auto_489963 ) ) ( not ( = ?auto_489961 ?auto_489964 ) ) ( not ( = ?auto_489961 ?auto_489965 ) ) ( not ( = ?auto_489961 ?auto_489966 ) ) ( not ( = ?auto_489962 ?auto_489963 ) ) ( not ( = ?auto_489962 ?auto_489964 ) ) ( not ( = ?auto_489962 ?auto_489965 ) ) ( not ( = ?auto_489962 ?auto_489966 ) ) ( not ( = ?auto_489963 ?auto_489964 ) ) ( not ( = ?auto_489963 ?auto_489965 ) ) ( not ( = ?auto_489963 ?auto_489966 ) ) ( not ( = ?auto_489964 ?auto_489965 ) ) ( not ( = ?auto_489964 ?auto_489966 ) ) ( not ( = ?auto_489965 ?auto_489966 ) ) ( ON ?auto_489964 ?auto_489965 ) ( ON ?auto_489963 ?auto_489964 ) ( ON ?auto_489962 ?auto_489963 ) ( ON ?auto_489961 ?auto_489962 ) ( ON ?auto_489960 ?auto_489961 ) ( ON ?auto_489959 ?auto_489960 ) ( ON ?auto_489958 ?auto_489959 ) ( ON ?auto_489957 ?auto_489958 ) ( ON ?auto_489956 ?auto_489957 ) ( ON ?auto_489955 ?auto_489956 ) ( ON ?auto_489954 ?auto_489955 ) ( ON ?auto_489953 ?auto_489954 ) ( ON ?auto_489952 ?auto_489953 ) ( ON ?auto_489951 ?auto_489952 ) ( ON ?auto_489950 ?auto_489951 ) ( CLEAR ?auto_489950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_489950 )
      ( MAKE-16PILE ?auto_489950 ?auto_489951 ?auto_489952 ?auto_489953 ?auto_489954 ?auto_489955 ?auto_489956 ?auto_489957 ?auto_489958 ?auto_489959 ?auto_489960 ?auto_489961 ?auto_489962 ?auto_489963 ?auto_489964 ?auto_489965 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_489983 - BLOCK
      ?auto_489984 - BLOCK
      ?auto_489985 - BLOCK
      ?auto_489986 - BLOCK
      ?auto_489987 - BLOCK
      ?auto_489988 - BLOCK
      ?auto_489989 - BLOCK
      ?auto_489990 - BLOCK
      ?auto_489991 - BLOCK
      ?auto_489992 - BLOCK
      ?auto_489993 - BLOCK
      ?auto_489994 - BLOCK
      ?auto_489995 - BLOCK
      ?auto_489996 - BLOCK
      ?auto_489997 - BLOCK
      ?auto_489998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_489998 ) ( not ( = ?auto_489983 ?auto_489984 ) ) ( not ( = ?auto_489983 ?auto_489985 ) ) ( not ( = ?auto_489983 ?auto_489986 ) ) ( not ( = ?auto_489983 ?auto_489987 ) ) ( not ( = ?auto_489983 ?auto_489988 ) ) ( not ( = ?auto_489983 ?auto_489989 ) ) ( not ( = ?auto_489983 ?auto_489990 ) ) ( not ( = ?auto_489983 ?auto_489991 ) ) ( not ( = ?auto_489983 ?auto_489992 ) ) ( not ( = ?auto_489983 ?auto_489993 ) ) ( not ( = ?auto_489983 ?auto_489994 ) ) ( not ( = ?auto_489983 ?auto_489995 ) ) ( not ( = ?auto_489983 ?auto_489996 ) ) ( not ( = ?auto_489983 ?auto_489997 ) ) ( not ( = ?auto_489983 ?auto_489998 ) ) ( not ( = ?auto_489984 ?auto_489985 ) ) ( not ( = ?auto_489984 ?auto_489986 ) ) ( not ( = ?auto_489984 ?auto_489987 ) ) ( not ( = ?auto_489984 ?auto_489988 ) ) ( not ( = ?auto_489984 ?auto_489989 ) ) ( not ( = ?auto_489984 ?auto_489990 ) ) ( not ( = ?auto_489984 ?auto_489991 ) ) ( not ( = ?auto_489984 ?auto_489992 ) ) ( not ( = ?auto_489984 ?auto_489993 ) ) ( not ( = ?auto_489984 ?auto_489994 ) ) ( not ( = ?auto_489984 ?auto_489995 ) ) ( not ( = ?auto_489984 ?auto_489996 ) ) ( not ( = ?auto_489984 ?auto_489997 ) ) ( not ( = ?auto_489984 ?auto_489998 ) ) ( not ( = ?auto_489985 ?auto_489986 ) ) ( not ( = ?auto_489985 ?auto_489987 ) ) ( not ( = ?auto_489985 ?auto_489988 ) ) ( not ( = ?auto_489985 ?auto_489989 ) ) ( not ( = ?auto_489985 ?auto_489990 ) ) ( not ( = ?auto_489985 ?auto_489991 ) ) ( not ( = ?auto_489985 ?auto_489992 ) ) ( not ( = ?auto_489985 ?auto_489993 ) ) ( not ( = ?auto_489985 ?auto_489994 ) ) ( not ( = ?auto_489985 ?auto_489995 ) ) ( not ( = ?auto_489985 ?auto_489996 ) ) ( not ( = ?auto_489985 ?auto_489997 ) ) ( not ( = ?auto_489985 ?auto_489998 ) ) ( not ( = ?auto_489986 ?auto_489987 ) ) ( not ( = ?auto_489986 ?auto_489988 ) ) ( not ( = ?auto_489986 ?auto_489989 ) ) ( not ( = ?auto_489986 ?auto_489990 ) ) ( not ( = ?auto_489986 ?auto_489991 ) ) ( not ( = ?auto_489986 ?auto_489992 ) ) ( not ( = ?auto_489986 ?auto_489993 ) ) ( not ( = ?auto_489986 ?auto_489994 ) ) ( not ( = ?auto_489986 ?auto_489995 ) ) ( not ( = ?auto_489986 ?auto_489996 ) ) ( not ( = ?auto_489986 ?auto_489997 ) ) ( not ( = ?auto_489986 ?auto_489998 ) ) ( not ( = ?auto_489987 ?auto_489988 ) ) ( not ( = ?auto_489987 ?auto_489989 ) ) ( not ( = ?auto_489987 ?auto_489990 ) ) ( not ( = ?auto_489987 ?auto_489991 ) ) ( not ( = ?auto_489987 ?auto_489992 ) ) ( not ( = ?auto_489987 ?auto_489993 ) ) ( not ( = ?auto_489987 ?auto_489994 ) ) ( not ( = ?auto_489987 ?auto_489995 ) ) ( not ( = ?auto_489987 ?auto_489996 ) ) ( not ( = ?auto_489987 ?auto_489997 ) ) ( not ( = ?auto_489987 ?auto_489998 ) ) ( not ( = ?auto_489988 ?auto_489989 ) ) ( not ( = ?auto_489988 ?auto_489990 ) ) ( not ( = ?auto_489988 ?auto_489991 ) ) ( not ( = ?auto_489988 ?auto_489992 ) ) ( not ( = ?auto_489988 ?auto_489993 ) ) ( not ( = ?auto_489988 ?auto_489994 ) ) ( not ( = ?auto_489988 ?auto_489995 ) ) ( not ( = ?auto_489988 ?auto_489996 ) ) ( not ( = ?auto_489988 ?auto_489997 ) ) ( not ( = ?auto_489988 ?auto_489998 ) ) ( not ( = ?auto_489989 ?auto_489990 ) ) ( not ( = ?auto_489989 ?auto_489991 ) ) ( not ( = ?auto_489989 ?auto_489992 ) ) ( not ( = ?auto_489989 ?auto_489993 ) ) ( not ( = ?auto_489989 ?auto_489994 ) ) ( not ( = ?auto_489989 ?auto_489995 ) ) ( not ( = ?auto_489989 ?auto_489996 ) ) ( not ( = ?auto_489989 ?auto_489997 ) ) ( not ( = ?auto_489989 ?auto_489998 ) ) ( not ( = ?auto_489990 ?auto_489991 ) ) ( not ( = ?auto_489990 ?auto_489992 ) ) ( not ( = ?auto_489990 ?auto_489993 ) ) ( not ( = ?auto_489990 ?auto_489994 ) ) ( not ( = ?auto_489990 ?auto_489995 ) ) ( not ( = ?auto_489990 ?auto_489996 ) ) ( not ( = ?auto_489990 ?auto_489997 ) ) ( not ( = ?auto_489990 ?auto_489998 ) ) ( not ( = ?auto_489991 ?auto_489992 ) ) ( not ( = ?auto_489991 ?auto_489993 ) ) ( not ( = ?auto_489991 ?auto_489994 ) ) ( not ( = ?auto_489991 ?auto_489995 ) ) ( not ( = ?auto_489991 ?auto_489996 ) ) ( not ( = ?auto_489991 ?auto_489997 ) ) ( not ( = ?auto_489991 ?auto_489998 ) ) ( not ( = ?auto_489992 ?auto_489993 ) ) ( not ( = ?auto_489992 ?auto_489994 ) ) ( not ( = ?auto_489992 ?auto_489995 ) ) ( not ( = ?auto_489992 ?auto_489996 ) ) ( not ( = ?auto_489992 ?auto_489997 ) ) ( not ( = ?auto_489992 ?auto_489998 ) ) ( not ( = ?auto_489993 ?auto_489994 ) ) ( not ( = ?auto_489993 ?auto_489995 ) ) ( not ( = ?auto_489993 ?auto_489996 ) ) ( not ( = ?auto_489993 ?auto_489997 ) ) ( not ( = ?auto_489993 ?auto_489998 ) ) ( not ( = ?auto_489994 ?auto_489995 ) ) ( not ( = ?auto_489994 ?auto_489996 ) ) ( not ( = ?auto_489994 ?auto_489997 ) ) ( not ( = ?auto_489994 ?auto_489998 ) ) ( not ( = ?auto_489995 ?auto_489996 ) ) ( not ( = ?auto_489995 ?auto_489997 ) ) ( not ( = ?auto_489995 ?auto_489998 ) ) ( not ( = ?auto_489996 ?auto_489997 ) ) ( not ( = ?auto_489996 ?auto_489998 ) ) ( not ( = ?auto_489997 ?auto_489998 ) ) ( ON ?auto_489997 ?auto_489998 ) ( ON ?auto_489996 ?auto_489997 ) ( ON ?auto_489995 ?auto_489996 ) ( ON ?auto_489994 ?auto_489995 ) ( ON ?auto_489993 ?auto_489994 ) ( ON ?auto_489992 ?auto_489993 ) ( ON ?auto_489991 ?auto_489992 ) ( ON ?auto_489990 ?auto_489991 ) ( ON ?auto_489989 ?auto_489990 ) ( ON ?auto_489988 ?auto_489989 ) ( ON ?auto_489987 ?auto_489988 ) ( ON ?auto_489986 ?auto_489987 ) ( ON ?auto_489985 ?auto_489986 ) ( ON ?auto_489984 ?auto_489985 ) ( ON ?auto_489983 ?auto_489984 ) ( CLEAR ?auto_489983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_489983 )
      ( MAKE-16PILE ?auto_489983 ?auto_489984 ?auto_489985 ?auto_489986 ?auto_489987 ?auto_489988 ?auto_489989 ?auto_489990 ?auto_489991 ?auto_489992 ?auto_489993 ?auto_489994 ?auto_489995 ?auto_489996 ?auto_489997 ?auto_489998 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_490015 - BLOCK
      ?auto_490016 - BLOCK
      ?auto_490017 - BLOCK
      ?auto_490018 - BLOCK
      ?auto_490019 - BLOCK
      ?auto_490020 - BLOCK
      ?auto_490021 - BLOCK
      ?auto_490022 - BLOCK
      ?auto_490023 - BLOCK
      ?auto_490024 - BLOCK
      ?auto_490025 - BLOCK
      ?auto_490026 - BLOCK
      ?auto_490027 - BLOCK
      ?auto_490028 - BLOCK
      ?auto_490029 - BLOCK
      ?auto_490030 - BLOCK
    )
    :vars
    (
      ?auto_490031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_490015 ?auto_490016 ) ) ( not ( = ?auto_490015 ?auto_490017 ) ) ( not ( = ?auto_490015 ?auto_490018 ) ) ( not ( = ?auto_490015 ?auto_490019 ) ) ( not ( = ?auto_490015 ?auto_490020 ) ) ( not ( = ?auto_490015 ?auto_490021 ) ) ( not ( = ?auto_490015 ?auto_490022 ) ) ( not ( = ?auto_490015 ?auto_490023 ) ) ( not ( = ?auto_490015 ?auto_490024 ) ) ( not ( = ?auto_490015 ?auto_490025 ) ) ( not ( = ?auto_490015 ?auto_490026 ) ) ( not ( = ?auto_490015 ?auto_490027 ) ) ( not ( = ?auto_490015 ?auto_490028 ) ) ( not ( = ?auto_490015 ?auto_490029 ) ) ( not ( = ?auto_490015 ?auto_490030 ) ) ( not ( = ?auto_490016 ?auto_490017 ) ) ( not ( = ?auto_490016 ?auto_490018 ) ) ( not ( = ?auto_490016 ?auto_490019 ) ) ( not ( = ?auto_490016 ?auto_490020 ) ) ( not ( = ?auto_490016 ?auto_490021 ) ) ( not ( = ?auto_490016 ?auto_490022 ) ) ( not ( = ?auto_490016 ?auto_490023 ) ) ( not ( = ?auto_490016 ?auto_490024 ) ) ( not ( = ?auto_490016 ?auto_490025 ) ) ( not ( = ?auto_490016 ?auto_490026 ) ) ( not ( = ?auto_490016 ?auto_490027 ) ) ( not ( = ?auto_490016 ?auto_490028 ) ) ( not ( = ?auto_490016 ?auto_490029 ) ) ( not ( = ?auto_490016 ?auto_490030 ) ) ( not ( = ?auto_490017 ?auto_490018 ) ) ( not ( = ?auto_490017 ?auto_490019 ) ) ( not ( = ?auto_490017 ?auto_490020 ) ) ( not ( = ?auto_490017 ?auto_490021 ) ) ( not ( = ?auto_490017 ?auto_490022 ) ) ( not ( = ?auto_490017 ?auto_490023 ) ) ( not ( = ?auto_490017 ?auto_490024 ) ) ( not ( = ?auto_490017 ?auto_490025 ) ) ( not ( = ?auto_490017 ?auto_490026 ) ) ( not ( = ?auto_490017 ?auto_490027 ) ) ( not ( = ?auto_490017 ?auto_490028 ) ) ( not ( = ?auto_490017 ?auto_490029 ) ) ( not ( = ?auto_490017 ?auto_490030 ) ) ( not ( = ?auto_490018 ?auto_490019 ) ) ( not ( = ?auto_490018 ?auto_490020 ) ) ( not ( = ?auto_490018 ?auto_490021 ) ) ( not ( = ?auto_490018 ?auto_490022 ) ) ( not ( = ?auto_490018 ?auto_490023 ) ) ( not ( = ?auto_490018 ?auto_490024 ) ) ( not ( = ?auto_490018 ?auto_490025 ) ) ( not ( = ?auto_490018 ?auto_490026 ) ) ( not ( = ?auto_490018 ?auto_490027 ) ) ( not ( = ?auto_490018 ?auto_490028 ) ) ( not ( = ?auto_490018 ?auto_490029 ) ) ( not ( = ?auto_490018 ?auto_490030 ) ) ( not ( = ?auto_490019 ?auto_490020 ) ) ( not ( = ?auto_490019 ?auto_490021 ) ) ( not ( = ?auto_490019 ?auto_490022 ) ) ( not ( = ?auto_490019 ?auto_490023 ) ) ( not ( = ?auto_490019 ?auto_490024 ) ) ( not ( = ?auto_490019 ?auto_490025 ) ) ( not ( = ?auto_490019 ?auto_490026 ) ) ( not ( = ?auto_490019 ?auto_490027 ) ) ( not ( = ?auto_490019 ?auto_490028 ) ) ( not ( = ?auto_490019 ?auto_490029 ) ) ( not ( = ?auto_490019 ?auto_490030 ) ) ( not ( = ?auto_490020 ?auto_490021 ) ) ( not ( = ?auto_490020 ?auto_490022 ) ) ( not ( = ?auto_490020 ?auto_490023 ) ) ( not ( = ?auto_490020 ?auto_490024 ) ) ( not ( = ?auto_490020 ?auto_490025 ) ) ( not ( = ?auto_490020 ?auto_490026 ) ) ( not ( = ?auto_490020 ?auto_490027 ) ) ( not ( = ?auto_490020 ?auto_490028 ) ) ( not ( = ?auto_490020 ?auto_490029 ) ) ( not ( = ?auto_490020 ?auto_490030 ) ) ( not ( = ?auto_490021 ?auto_490022 ) ) ( not ( = ?auto_490021 ?auto_490023 ) ) ( not ( = ?auto_490021 ?auto_490024 ) ) ( not ( = ?auto_490021 ?auto_490025 ) ) ( not ( = ?auto_490021 ?auto_490026 ) ) ( not ( = ?auto_490021 ?auto_490027 ) ) ( not ( = ?auto_490021 ?auto_490028 ) ) ( not ( = ?auto_490021 ?auto_490029 ) ) ( not ( = ?auto_490021 ?auto_490030 ) ) ( not ( = ?auto_490022 ?auto_490023 ) ) ( not ( = ?auto_490022 ?auto_490024 ) ) ( not ( = ?auto_490022 ?auto_490025 ) ) ( not ( = ?auto_490022 ?auto_490026 ) ) ( not ( = ?auto_490022 ?auto_490027 ) ) ( not ( = ?auto_490022 ?auto_490028 ) ) ( not ( = ?auto_490022 ?auto_490029 ) ) ( not ( = ?auto_490022 ?auto_490030 ) ) ( not ( = ?auto_490023 ?auto_490024 ) ) ( not ( = ?auto_490023 ?auto_490025 ) ) ( not ( = ?auto_490023 ?auto_490026 ) ) ( not ( = ?auto_490023 ?auto_490027 ) ) ( not ( = ?auto_490023 ?auto_490028 ) ) ( not ( = ?auto_490023 ?auto_490029 ) ) ( not ( = ?auto_490023 ?auto_490030 ) ) ( not ( = ?auto_490024 ?auto_490025 ) ) ( not ( = ?auto_490024 ?auto_490026 ) ) ( not ( = ?auto_490024 ?auto_490027 ) ) ( not ( = ?auto_490024 ?auto_490028 ) ) ( not ( = ?auto_490024 ?auto_490029 ) ) ( not ( = ?auto_490024 ?auto_490030 ) ) ( not ( = ?auto_490025 ?auto_490026 ) ) ( not ( = ?auto_490025 ?auto_490027 ) ) ( not ( = ?auto_490025 ?auto_490028 ) ) ( not ( = ?auto_490025 ?auto_490029 ) ) ( not ( = ?auto_490025 ?auto_490030 ) ) ( not ( = ?auto_490026 ?auto_490027 ) ) ( not ( = ?auto_490026 ?auto_490028 ) ) ( not ( = ?auto_490026 ?auto_490029 ) ) ( not ( = ?auto_490026 ?auto_490030 ) ) ( not ( = ?auto_490027 ?auto_490028 ) ) ( not ( = ?auto_490027 ?auto_490029 ) ) ( not ( = ?auto_490027 ?auto_490030 ) ) ( not ( = ?auto_490028 ?auto_490029 ) ) ( not ( = ?auto_490028 ?auto_490030 ) ) ( not ( = ?auto_490029 ?auto_490030 ) ) ( ON ?auto_490015 ?auto_490031 ) ( not ( = ?auto_490030 ?auto_490031 ) ) ( not ( = ?auto_490029 ?auto_490031 ) ) ( not ( = ?auto_490028 ?auto_490031 ) ) ( not ( = ?auto_490027 ?auto_490031 ) ) ( not ( = ?auto_490026 ?auto_490031 ) ) ( not ( = ?auto_490025 ?auto_490031 ) ) ( not ( = ?auto_490024 ?auto_490031 ) ) ( not ( = ?auto_490023 ?auto_490031 ) ) ( not ( = ?auto_490022 ?auto_490031 ) ) ( not ( = ?auto_490021 ?auto_490031 ) ) ( not ( = ?auto_490020 ?auto_490031 ) ) ( not ( = ?auto_490019 ?auto_490031 ) ) ( not ( = ?auto_490018 ?auto_490031 ) ) ( not ( = ?auto_490017 ?auto_490031 ) ) ( not ( = ?auto_490016 ?auto_490031 ) ) ( not ( = ?auto_490015 ?auto_490031 ) ) ( ON ?auto_490016 ?auto_490015 ) ( ON ?auto_490017 ?auto_490016 ) ( ON ?auto_490018 ?auto_490017 ) ( ON ?auto_490019 ?auto_490018 ) ( ON ?auto_490020 ?auto_490019 ) ( ON ?auto_490021 ?auto_490020 ) ( ON ?auto_490022 ?auto_490021 ) ( ON ?auto_490023 ?auto_490022 ) ( ON ?auto_490024 ?auto_490023 ) ( ON ?auto_490025 ?auto_490024 ) ( ON ?auto_490026 ?auto_490025 ) ( ON ?auto_490027 ?auto_490026 ) ( ON ?auto_490028 ?auto_490027 ) ( ON ?auto_490029 ?auto_490028 ) ( ON ?auto_490030 ?auto_490029 ) ( CLEAR ?auto_490030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_490030 ?auto_490029 ?auto_490028 ?auto_490027 ?auto_490026 ?auto_490025 ?auto_490024 ?auto_490023 ?auto_490022 ?auto_490021 ?auto_490020 ?auto_490019 ?auto_490018 ?auto_490017 ?auto_490016 ?auto_490015 )
      ( MAKE-16PILE ?auto_490015 ?auto_490016 ?auto_490017 ?auto_490018 ?auto_490019 ?auto_490020 ?auto_490021 ?auto_490022 ?auto_490023 ?auto_490024 ?auto_490025 ?auto_490026 ?auto_490027 ?auto_490028 ?auto_490029 ?auto_490030 ) )
  )

)

