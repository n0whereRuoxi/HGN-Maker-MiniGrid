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
      ?auto_47824 - BLOCK
    )
    :vars
    (
      ?auto_47825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47824 ?auto_47825 ) ( CLEAR ?auto_47824 ) ( HAND-EMPTY ) ( not ( = ?auto_47824 ?auto_47825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47824 ?auto_47825 )
      ( !PUTDOWN ?auto_47824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47831 - BLOCK
      ?auto_47832 - BLOCK
    )
    :vars
    (
      ?auto_47833 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47831 ) ( ON ?auto_47832 ?auto_47833 ) ( CLEAR ?auto_47832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47831 ) ( not ( = ?auto_47831 ?auto_47832 ) ) ( not ( = ?auto_47831 ?auto_47833 ) ) ( not ( = ?auto_47832 ?auto_47833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47832 ?auto_47833 )
      ( !STACK ?auto_47832 ?auto_47831 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47841 - BLOCK
      ?auto_47842 - BLOCK
    )
    :vars
    (
      ?auto_47843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47842 ?auto_47843 ) ( not ( = ?auto_47841 ?auto_47842 ) ) ( not ( = ?auto_47841 ?auto_47843 ) ) ( not ( = ?auto_47842 ?auto_47843 ) ) ( ON ?auto_47841 ?auto_47842 ) ( CLEAR ?auto_47841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47841 )
      ( MAKE-2PILE ?auto_47841 ?auto_47842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47852 - BLOCK
      ?auto_47853 - BLOCK
      ?auto_47854 - BLOCK
    )
    :vars
    (
      ?auto_47855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47853 ) ( ON ?auto_47854 ?auto_47855 ) ( CLEAR ?auto_47854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47852 ) ( ON ?auto_47853 ?auto_47852 ) ( not ( = ?auto_47852 ?auto_47853 ) ) ( not ( = ?auto_47852 ?auto_47854 ) ) ( not ( = ?auto_47852 ?auto_47855 ) ) ( not ( = ?auto_47853 ?auto_47854 ) ) ( not ( = ?auto_47853 ?auto_47855 ) ) ( not ( = ?auto_47854 ?auto_47855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47854 ?auto_47855 )
      ( !STACK ?auto_47854 ?auto_47853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47866 - BLOCK
      ?auto_47867 - BLOCK
      ?auto_47868 - BLOCK
    )
    :vars
    (
      ?auto_47869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47868 ?auto_47869 ) ( ON-TABLE ?auto_47866 ) ( not ( = ?auto_47866 ?auto_47867 ) ) ( not ( = ?auto_47866 ?auto_47868 ) ) ( not ( = ?auto_47866 ?auto_47869 ) ) ( not ( = ?auto_47867 ?auto_47868 ) ) ( not ( = ?auto_47867 ?auto_47869 ) ) ( not ( = ?auto_47868 ?auto_47869 ) ) ( CLEAR ?auto_47866 ) ( ON ?auto_47867 ?auto_47868 ) ( CLEAR ?auto_47867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47866 ?auto_47867 )
      ( MAKE-3PILE ?auto_47866 ?auto_47867 ?auto_47868 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47880 - BLOCK
      ?auto_47881 - BLOCK
      ?auto_47882 - BLOCK
    )
    :vars
    (
      ?auto_47883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47882 ?auto_47883 ) ( not ( = ?auto_47880 ?auto_47881 ) ) ( not ( = ?auto_47880 ?auto_47882 ) ) ( not ( = ?auto_47880 ?auto_47883 ) ) ( not ( = ?auto_47881 ?auto_47882 ) ) ( not ( = ?auto_47881 ?auto_47883 ) ) ( not ( = ?auto_47882 ?auto_47883 ) ) ( ON ?auto_47881 ?auto_47882 ) ( ON ?auto_47880 ?auto_47881 ) ( CLEAR ?auto_47880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47880 )
      ( MAKE-3PILE ?auto_47880 ?auto_47881 ?auto_47882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47895 - BLOCK
      ?auto_47896 - BLOCK
      ?auto_47897 - BLOCK
      ?auto_47898 - BLOCK
    )
    :vars
    (
      ?auto_47899 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47897 ) ( ON ?auto_47898 ?auto_47899 ) ( CLEAR ?auto_47898 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47895 ) ( ON ?auto_47896 ?auto_47895 ) ( ON ?auto_47897 ?auto_47896 ) ( not ( = ?auto_47895 ?auto_47896 ) ) ( not ( = ?auto_47895 ?auto_47897 ) ) ( not ( = ?auto_47895 ?auto_47898 ) ) ( not ( = ?auto_47895 ?auto_47899 ) ) ( not ( = ?auto_47896 ?auto_47897 ) ) ( not ( = ?auto_47896 ?auto_47898 ) ) ( not ( = ?auto_47896 ?auto_47899 ) ) ( not ( = ?auto_47897 ?auto_47898 ) ) ( not ( = ?auto_47897 ?auto_47899 ) ) ( not ( = ?auto_47898 ?auto_47899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47898 ?auto_47899 )
      ( !STACK ?auto_47898 ?auto_47897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47913 - BLOCK
      ?auto_47914 - BLOCK
      ?auto_47915 - BLOCK
      ?auto_47916 - BLOCK
    )
    :vars
    (
      ?auto_47917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47916 ?auto_47917 ) ( ON-TABLE ?auto_47913 ) ( ON ?auto_47914 ?auto_47913 ) ( not ( = ?auto_47913 ?auto_47914 ) ) ( not ( = ?auto_47913 ?auto_47915 ) ) ( not ( = ?auto_47913 ?auto_47916 ) ) ( not ( = ?auto_47913 ?auto_47917 ) ) ( not ( = ?auto_47914 ?auto_47915 ) ) ( not ( = ?auto_47914 ?auto_47916 ) ) ( not ( = ?auto_47914 ?auto_47917 ) ) ( not ( = ?auto_47915 ?auto_47916 ) ) ( not ( = ?auto_47915 ?auto_47917 ) ) ( not ( = ?auto_47916 ?auto_47917 ) ) ( CLEAR ?auto_47914 ) ( ON ?auto_47915 ?auto_47916 ) ( CLEAR ?auto_47915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47913 ?auto_47914 ?auto_47915 )
      ( MAKE-4PILE ?auto_47913 ?auto_47914 ?auto_47915 ?auto_47916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47931 - BLOCK
      ?auto_47932 - BLOCK
      ?auto_47933 - BLOCK
      ?auto_47934 - BLOCK
    )
    :vars
    (
      ?auto_47935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47934 ?auto_47935 ) ( ON-TABLE ?auto_47931 ) ( not ( = ?auto_47931 ?auto_47932 ) ) ( not ( = ?auto_47931 ?auto_47933 ) ) ( not ( = ?auto_47931 ?auto_47934 ) ) ( not ( = ?auto_47931 ?auto_47935 ) ) ( not ( = ?auto_47932 ?auto_47933 ) ) ( not ( = ?auto_47932 ?auto_47934 ) ) ( not ( = ?auto_47932 ?auto_47935 ) ) ( not ( = ?auto_47933 ?auto_47934 ) ) ( not ( = ?auto_47933 ?auto_47935 ) ) ( not ( = ?auto_47934 ?auto_47935 ) ) ( ON ?auto_47933 ?auto_47934 ) ( CLEAR ?auto_47931 ) ( ON ?auto_47932 ?auto_47933 ) ( CLEAR ?auto_47932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47931 ?auto_47932 )
      ( MAKE-4PILE ?auto_47931 ?auto_47932 ?auto_47933 ?auto_47934 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47949 - BLOCK
      ?auto_47950 - BLOCK
      ?auto_47951 - BLOCK
      ?auto_47952 - BLOCK
    )
    :vars
    (
      ?auto_47953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47952 ?auto_47953 ) ( not ( = ?auto_47949 ?auto_47950 ) ) ( not ( = ?auto_47949 ?auto_47951 ) ) ( not ( = ?auto_47949 ?auto_47952 ) ) ( not ( = ?auto_47949 ?auto_47953 ) ) ( not ( = ?auto_47950 ?auto_47951 ) ) ( not ( = ?auto_47950 ?auto_47952 ) ) ( not ( = ?auto_47950 ?auto_47953 ) ) ( not ( = ?auto_47951 ?auto_47952 ) ) ( not ( = ?auto_47951 ?auto_47953 ) ) ( not ( = ?auto_47952 ?auto_47953 ) ) ( ON ?auto_47951 ?auto_47952 ) ( ON ?auto_47950 ?auto_47951 ) ( ON ?auto_47949 ?auto_47950 ) ( CLEAR ?auto_47949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47949 )
      ( MAKE-4PILE ?auto_47949 ?auto_47950 ?auto_47951 ?auto_47952 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47968 - BLOCK
      ?auto_47969 - BLOCK
      ?auto_47970 - BLOCK
      ?auto_47971 - BLOCK
      ?auto_47972 - BLOCK
    )
    :vars
    (
      ?auto_47973 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47971 ) ( ON ?auto_47972 ?auto_47973 ) ( CLEAR ?auto_47972 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47968 ) ( ON ?auto_47969 ?auto_47968 ) ( ON ?auto_47970 ?auto_47969 ) ( ON ?auto_47971 ?auto_47970 ) ( not ( = ?auto_47968 ?auto_47969 ) ) ( not ( = ?auto_47968 ?auto_47970 ) ) ( not ( = ?auto_47968 ?auto_47971 ) ) ( not ( = ?auto_47968 ?auto_47972 ) ) ( not ( = ?auto_47968 ?auto_47973 ) ) ( not ( = ?auto_47969 ?auto_47970 ) ) ( not ( = ?auto_47969 ?auto_47971 ) ) ( not ( = ?auto_47969 ?auto_47972 ) ) ( not ( = ?auto_47969 ?auto_47973 ) ) ( not ( = ?auto_47970 ?auto_47971 ) ) ( not ( = ?auto_47970 ?auto_47972 ) ) ( not ( = ?auto_47970 ?auto_47973 ) ) ( not ( = ?auto_47971 ?auto_47972 ) ) ( not ( = ?auto_47971 ?auto_47973 ) ) ( not ( = ?auto_47972 ?auto_47973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47972 ?auto_47973 )
      ( !STACK ?auto_47972 ?auto_47971 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47990 - BLOCK
      ?auto_47991 - BLOCK
      ?auto_47992 - BLOCK
      ?auto_47993 - BLOCK
      ?auto_47994 - BLOCK
    )
    :vars
    (
      ?auto_47995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47994 ?auto_47995 ) ( ON-TABLE ?auto_47990 ) ( ON ?auto_47991 ?auto_47990 ) ( ON ?auto_47992 ?auto_47991 ) ( not ( = ?auto_47990 ?auto_47991 ) ) ( not ( = ?auto_47990 ?auto_47992 ) ) ( not ( = ?auto_47990 ?auto_47993 ) ) ( not ( = ?auto_47990 ?auto_47994 ) ) ( not ( = ?auto_47990 ?auto_47995 ) ) ( not ( = ?auto_47991 ?auto_47992 ) ) ( not ( = ?auto_47991 ?auto_47993 ) ) ( not ( = ?auto_47991 ?auto_47994 ) ) ( not ( = ?auto_47991 ?auto_47995 ) ) ( not ( = ?auto_47992 ?auto_47993 ) ) ( not ( = ?auto_47992 ?auto_47994 ) ) ( not ( = ?auto_47992 ?auto_47995 ) ) ( not ( = ?auto_47993 ?auto_47994 ) ) ( not ( = ?auto_47993 ?auto_47995 ) ) ( not ( = ?auto_47994 ?auto_47995 ) ) ( CLEAR ?auto_47992 ) ( ON ?auto_47993 ?auto_47994 ) ( CLEAR ?auto_47993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47990 ?auto_47991 ?auto_47992 ?auto_47993 )
      ( MAKE-5PILE ?auto_47990 ?auto_47991 ?auto_47992 ?auto_47993 ?auto_47994 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48012 - BLOCK
      ?auto_48013 - BLOCK
      ?auto_48014 - BLOCK
      ?auto_48015 - BLOCK
      ?auto_48016 - BLOCK
    )
    :vars
    (
      ?auto_48017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48016 ?auto_48017 ) ( ON-TABLE ?auto_48012 ) ( ON ?auto_48013 ?auto_48012 ) ( not ( = ?auto_48012 ?auto_48013 ) ) ( not ( = ?auto_48012 ?auto_48014 ) ) ( not ( = ?auto_48012 ?auto_48015 ) ) ( not ( = ?auto_48012 ?auto_48016 ) ) ( not ( = ?auto_48012 ?auto_48017 ) ) ( not ( = ?auto_48013 ?auto_48014 ) ) ( not ( = ?auto_48013 ?auto_48015 ) ) ( not ( = ?auto_48013 ?auto_48016 ) ) ( not ( = ?auto_48013 ?auto_48017 ) ) ( not ( = ?auto_48014 ?auto_48015 ) ) ( not ( = ?auto_48014 ?auto_48016 ) ) ( not ( = ?auto_48014 ?auto_48017 ) ) ( not ( = ?auto_48015 ?auto_48016 ) ) ( not ( = ?auto_48015 ?auto_48017 ) ) ( not ( = ?auto_48016 ?auto_48017 ) ) ( ON ?auto_48015 ?auto_48016 ) ( CLEAR ?auto_48013 ) ( ON ?auto_48014 ?auto_48015 ) ( CLEAR ?auto_48014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48012 ?auto_48013 ?auto_48014 )
      ( MAKE-5PILE ?auto_48012 ?auto_48013 ?auto_48014 ?auto_48015 ?auto_48016 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48034 - BLOCK
      ?auto_48035 - BLOCK
      ?auto_48036 - BLOCK
      ?auto_48037 - BLOCK
      ?auto_48038 - BLOCK
    )
    :vars
    (
      ?auto_48039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48038 ?auto_48039 ) ( ON-TABLE ?auto_48034 ) ( not ( = ?auto_48034 ?auto_48035 ) ) ( not ( = ?auto_48034 ?auto_48036 ) ) ( not ( = ?auto_48034 ?auto_48037 ) ) ( not ( = ?auto_48034 ?auto_48038 ) ) ( not ( = ?auto_48034 ?auto_48039 ) ) ( not ( = ?auto_48035 ?auto_48036 ) ) ( not ( = ?auto_48035 ?auto_48037 ) ) ( not ( = ?auto_48035 ?auto_48038 ) ) ( not ( = ?auto_48035 ?auto_48039 ) ) ( not ( = ?auto_48036 ?auto_48037 ) ) ( not ( = ?auto_48036 ?auto_48038 ) ) ( not ( = ?auto_48036 ?auto_48039 ) ) ( not ( = ?auto_48037 ?auto_48038 ) ) ( not ( = ?auto_48037 ?auto_48039 ) ) ( not ( = ?auto_48038 ?auto_48039 ) ) ( ON ?auto_48037 ?auto_48038 ) ( ON ?auto_48036 ?auto_48037 ) ( CLEAR ?auto_48034 ) ( ON ?auto_48035 ?auto_48036 ) ( CLEAR ?auto_48035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48034 ?auto_48035 )
      ( MAKE-5PILE ?auto_48034 ?auto_48035 ?auto_48036 ?auto_48037 ?auto_48038 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48056 - BLOCK
      ?auto_48057 - BLOCK
      ?auto_48058 - BLOCK
      ?auto_48059 - BLOCK
      ?auto_48060 - BLOCK
    )
    :vars
    (
      ?auto_48061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48060 ?auto_48061 ) ( not ( = ?auto_48056 ?auto_48057 ) ) ( not ( = ?auto_48056 ?auto_48058 ) ) ( not ( = ?auto_48056 ?auto_48059 ) ) ( not ( = ?auto_48056 ?auto_48060 ) ) ( not ( = ?auto_48056 ?auto_48061 ) ) ( not ( = ?auto_48057 ?auto_48058 ) ) ( not ( = ?auto_48057 ?auto_48059 ) ) ( not ( = ?auto_48057 ?auto_48060 ) ) ( not ( = ?auto_48057 ?auto_48061 ) ) ( not ( = ?auto_48058 ?auto_48059 ) ) ( not ( = ?auto_48058 ?auto_48060 ) ) ( not ( = ?auto_48058 ?auto_48061 ) ) ( not ( = ?auto_48059 ?auto_48060 ) ) ( not ( = ?auto_48059 ?auto_48061 ) ) ( not ( = ?auto_48060 ?auto_48061 ) ) ( ON ?auto_48059 ?auto_48060 ) ( ON ?auto_48058 ?auto_48059 ) ( ON ?auto_48057 ?auto_48058 ) ( ON ?auto_48056 ?auto_48057 ) ( CLEAR ?auto_48056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48056 )
      ( MAKE-5PILE ?auto_48056 ?auto_48057 ?auto_48058 ?auto_48059 ?auto_48060 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48079 - BLOCK
      ?auto_48080 - BLOCK
      ?auto_48081 - BLOCK
      ?auto_48082 - BLOCK
      ?auto_48083 - BLOCK
      ?auto_48084 - BLOCK
    )
    :vars
    (
      ?auto_48085 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48083 ) ( ON ?auto_48084 ?auto_48085 ) ( CLEAR ?auto_48084 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48079 ) ( ON ?auto_48080 ?auto_48079 ) ( ON ?auto_48081 ?auto_48080 ) ( ON ?auto_48082 ?auto_48081 ) ( ON ?auto_48083 ?auto_48082 ) ( not ( = ?auto_48079 ?auto_48080 ) ) ( not ( = ?auto_48079 ?auto_48081 ) ) ( not ( = ?auto_48079 ?auto_48082 ) ) ( not ( = ?auto_48079 ?auto_48083 ) ) ( not ( = ?auto_48079 ?auto_48084 ) ) ( not ( = ?auto_48079 ?auto_48085 ) ) ( not ( = ?auto_48080 ?auto_48081 ) ) ( not ( = ?auto_48080 ?auto_48082 ) ) ( not ( = ?auto_48080 ?auto_48083 ) ) ( not ( = ?auto_48080 ?auto_48084 ) ) ( not ( = ?auto_48080 ?auto_48085 ) ) ( not ( = ?auto_48081 ?auto_48082 ) ) ( not ( = ?auto_48081 ?auto_48083 ) ) ( not ( = ?auto_48081 ?auto_48084 ) ) ( not ( = ?auto_48081 ?auto_48085 ) ) ( not ( = ?auto_48082 ?auto_48083 ) ) ( not ( = ?auto_48082 ?auto_48084 ) ) ( not ( = ?auto_48082 ?auto_48085 ) ) ( not ( = ?auto_48083 ?auto_48084 ) ) ( not ( = ?auto_48083 ?auto_48085 ) ) ( not ( = ?auto_48084 ?auto_48085 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48084 ?auto_48085 )
      ( !STACK ?auto_48084 ?auto_48083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48105 - BLOCK
      ?auto_48106 - BLOCK
      ?auto_48107 - BLOCK
      ?auto_48108 - BLOCK
      ?auto_48109 - BLOCK
      ?auto_48110 - BLOCK
    )
    :vars
    (
      ?auto_48111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48110 ?auto_48111 ) ( ON-TABLE ?auto_48105 ) ( ON ?auto_48106 ?auto_48105 ) ( ON ?auto_48107 ?auto_48106 ) ( ON ?auto_48108 ?auto_48107 ) ( not ( = ?auto_48105 ?auto_48106 ) ) ( not ( = ?auto_48105 ?auto_48107 ) ) ( not ( = ?auto_48105 ?auto_48108 ) ) ( not ( = ?auto_48105 ?auto_48109 ) ) ( not ( = ?auto_48105 ?auto_48110 ) ) ( not ( = ?auto_48105 ?auto_48111 ) ) ( not ( = ?auto_48106 ?auto_48107 ) ) ( not ( = ?auto_48106 ?auto_48108 ) ) ( not ( = ?auto_48106 ?auto_48109 ) ) ( not ( = ?auto_48106 ?auto_48110 ) ) ( not ( = ?auto_48106 ?auto_48111 ) ) ( not ( = ?auto_48107 ?auto_48108 ) ) ( not ( = ?auto_48107 ?auto_48109 ) ) ( not ( = ?auto_48107 ?auto_48110 ) ) ( not ( = ?auto_48107 ?auto_48111 ) ) ( not ( = ?auto_48108 ?auto_48109 ) ) ( not ( = ?auto_48108 ?auto_48110 ) ) ( not ( = ?auto_48108 ?auto_48111 ) ) ( not ( = ?auto_48109 ?auto_48110 ) ) ( not ( = ?auto_48109 ?auto_48111 ) ) ( not ( = ?auto_48110 ?auto_48111 ) ) ( CLEAR ?auto_48108 ) ( ON ?auto_48109 ?auto_48110 ) ( CLEAR ?auto_48109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48105 ?auto_48106 ?auto_48107 ?auto_48108 ?auto_48109 )
      ( MAKE-6PILE ?auto_48105 ?auto_48106 ?auto_48107 ?auto_48108 ?auto_48109 ?auto_48110 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48131 - BLOCK
      ?auto_48132 - BLOCK
      ?auto_48133 - BLOCK
      ?auto_48134 - BLOCK
      ?auto_48135 - BLOCK
      ?auto_48136 - BLOCK
    )
    :vars
    (
      ?auto_48137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48136 ?auto_48137 ) ( ON-TABLE ?auto_48131 ) ( ON ?auto_48132 ?auto_48131 ) ( ON ?auto_48133 ?auto_48132 ) ( not ( = ?auto_48131 ?auto_48132 ) ) ( not ( = ?auto_48131 ?auto_48133 ) ) ( not ( = ?auto_48131 ?auto_48134 ) ) ( not ( = ?auto_48131 ?auto_48135 ) ) ( not ( = ?auto_48131 ?auto_48136 ) ) ( not ( = ?auto_48131 ?auto_48137 ) ) ( not ( = ?auto_48132 ?auto_48133 ) ) ( not ( = ?auto_48132 ?auto_48134 ) ) ( not ( = ?auto_48132 ?auto_48135 ) ) ( not ( = ?auto_48132 ?auto_48136 ) ) ( not ( = ?auto_48132 ?auto_48137 ) ) ( not ( = ?auto_48133 ?auto_48134 ) ) ( not ( = ?auto_48133 ?auto_48135 ) ) ( not ( = ?auto_48133 ?auto_48136 ) ) ( not ( = ?auto_48133 ?auto_48137 ) ) ( not ( = ?auto_48134 ?auto_48135 ) ) ( not ( = ?auto_48134 ?auto_48136 ) ) ( not ( = ?auto_48134 ?auto_48137 ) ) ( not ( = ?auto_48135 ?auto_48136 ) ) ( not ( = ?auto_48135 ?auto_48137 ) ) ( not ( = ?auto_48136 ?auto_48137 ) ) ( ON ?auto_48135 ?auto_48136 ) ( CLEAR ?auto_48133 ) ( ON ?auto_48134 ?auto_48135 ) ( CLEAR ?auto_48134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48131 ?auto_48132 ?auto_48133 ?auto_48134 )
      ( MAKE-6PILE ?auto_48131 ?auto_48132 ?auto_48133 ?auto_48134 ?auto_48135 ?auto_48136 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48157 - BLOCK
      ?auto_48158 - BLOCK
      ?auto_48159 - BLOCK
      ?auto_48160 - BLOCK
      ?auto_48161 - BLOCK
      ?auto_48162 - BLOCK
    )
    :vars
    (
      ?auto_48163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48162 ?auto_48163 ) ( ON-TABLE ?auto_48157 ) ( ON ?auto_48158 ?auto_48157 ) ( not ( = ?auto_48157 ?auto_48158 ) ) ( not ( = ?auto_48157 ?auto_48159 ) ) ( not ( = ?auto_48157 ?auto_48160 ) ) ( not ( = ?auto_48157 ?auto_48161 ) ) ( not ( = ?auto_48157 ?auto_48162 ) ) ( not ( = ?auto_48157 ?auto_48163 ) ) ( not ( = ?auto_48158 ?auto_48159 ) ) ( not ( = ?auto_48158 ?auto_48160 ) ) ( not ( = ?auto_48158 ?auto_48161 ) ) ( not ( = ?auto_48158 ?auto_48162 ) ) ( not ( = ?auto_48158 ?auto_48163 ) ) ( not ( = ?auto_48159 ?auto_48160 ) ) ( not ( = ?auto_48159 ?auto_48161 ) ) ( not ( = ?auto_48159 ?auto_48162 ) ) ( not ( = ?auto_48159 ?auto_48163 ) ) ( not ( = ?auto_48160 ?auto_48161 ) ) ( not ( = ?auto_48160 ?auto_48162 ) ) ( not ( = ?auto_48160 ?auto_48163 ) ) ( not ( = ?auto_48161 ?auto_48162 ) ) ( not ( = ?auto_48161 ?auto_48163 ) ) ( not ( = ?auto_48162 ?auto_48163 ) ) ( ON ?auto_48161 ?auto_48162 ) ( ON ?auto_48160 ?auto_48161 ) ( CLEAR ?auto_48158 ) ( ON ?auto_48159 ?auto_48160 ) ( CLEAR ?auto_48159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48157 ?auto_48158 ?auto_48159 )
      ( MAKE-6PILE ?auto_48157 ?auto_48158 ?auto_48159 ?auto_48160 ?auto_48161 ?auto_48162 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48183 - BLOCK
      ?auto_48184 - BLOCK
      ?auto_48185 - BLOCK
      ?auto_48186 - BLOCK
      ?auto_48187 - BLOCK
      ?auto_48188 - BLOCK
    )
    :vars
    (
      ?auto_48189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48188 ?auto_48189 ) ( ON-TABLE ?auto_48183 ) ( not ( = ?auto_48183 ?auto_48184 ) ) ( not ( = ?auto_48183 ?auto_48185 ) ) ( not ( = ?auto_48183 ?auto_48186 ) ) ( not ( = ?auto_48183 ?auto_48187 ) ) ( not ( = ?auto_48183 ?auto_48188 ) ) ( not ( = ?auto_48183 ?auto_48189 ) ) ( not ( = ?auto_48184 ?auto_48185 ) ) ( not ( = ?auto_48184 ?auto_48186 ) ) ( not ( = ?auto_48184 ?auto_48187 ) ) ( not ( = ?auto_48184 ?auto_48188 ) ) ( not ( = ?auto_48184 ?auto_48189 ) ) ( not ( = ?auto_48185 ?auto_48186 ) ) ( not ( = ?auto_48185 ?auto_48187 ) ) ( not ( = ?auto_48185 ?auto_48188 ) ) ( not ( = ?auto_48185 ?auto_48189 ) ) ( not ( = ?auto_48186 ?auto_48187 ) ) ( not ( = ?auto_48186 ?auto_48188 ) ) ( not ( = ?auto_48186 ?auto_48189 ) ) ( not ( = ?auto_48187 ?auto_48188 ) ) ( not ( = ?auto_48187 ?auto_48189 ) ) ( not ( = ?auto_48188 ?auto_48189 ) ) ( ON ?auto_48187 ?auto_48188 ) ( ON ?auto_48186 ?auto_48187 ) ( ON ?auto_48185 ?auto_48186 ) ( CLEAR ?auto_48183 ) ( ON ?auto_48184 ?auto_48185 ) ( CLEAR ?auto_48184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48183 ?auto_48184 )
      ( MAKE-6PILE ?auto_48183 ?auto_48184 ?auto_48185 ?auto_48186 ?auto_48187 ?auto_48188 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48209 - BLOCK
      ?auto_48210 - BLOCK
      ?auto_48211 - BLOCK
      ?auto_48212 - BLOCK
      ?auto_48213 - BLOCK
      ?auto_48214 - BLOCK
    )
    :vars
    (
      ?auto_48215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48214 ?auto_48215 ) ( not ( = ?auto_48209 ?auto_48210 ) ) ( not ( = ?auto_48209 ?auto_48211 ) ) ( not ( = ?auto_48209 ?auto_48212 ) ) ( not ( = ?auto_48209 ?auto_48213 ) ) ( not ( = ?auto_48209 ?auto_48214 ) ) ( not ( = ?auto_48209 ?auto_48215 ) ) ( not ( = ?auto_48210 ?auto_48211 ) ) ( not ( = ?auto_48210 ?auto_48212 ) ) ( not ( = ?auto_48210 ?auto_48213 ) ) ( not ( = ?auto_48210 ?auto_48214 ) ) ( not ( = ?auto_48210 ?auto_48215 ) ) ( not ( = ?auto_48211 ?auto_48212 ) ) ( not ( = ?auto_48211 ?auto_48213 ) ) ( not ( = ?auto_48211 ?auto_48214 ) ) ( not ( = ?auto_48211 ?auto_48215 ) ) ( not ( = ?auto_48212 ?auto_48213 ) ) ( not ( = ?auto_48212 ?auto_48214 ) ) ( not ( = ?auto_48212 ?auto_48215 ) ) ( not ( = ?auto_48213 ?auto_48214 ) ) ( not ( = ?auto_48213 ?auto_48215 ) ) ( not ( = ?auto_48214 ?auto_48215 ) ) ( ON ?auto_48213 ?auto_48214 ) ( ON ?auto_48212 ?auto_48213 ) ( ON ?auto_48211 ?auto_48212 ) ( ON ?auto_48210 ?auto_48211 ) ( ON ?auto_48209 ?auto_48210 ) ( CLEAR ?auto_48209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48209 )
      ( MAKE-6PILE ?auto_48209 ?auto_48210 ?auto_48211 ?auto_48212 ?auto_48213 ?auto_48214 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48236 - BLOCK
      ?auto_48237 - BLOCK
      ?auto_48238 - BLOCK
      ?auto_48239 - BLOCK
      ?auto_48240 - BLOCK
      ?auto_48241 - BLOCK
      ?auto_48242 - BLOCK
    )
    :vars
    (
      ?auto_48243 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48241 ) ( ON ?auto_48242 ?auto_48243 ) ( CLEAR ?auto_48242 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48236 ) ( ON ?auto_48237 ?auto_48236 ) ( ON ?auto_48238 ?auto_48237 ) ( ON ?auto_48239 ?auto_48238 ) ( ON ?auto_48240 ?auto_48239 ) ( ON ?auto_48241 ?auto_48240 ) ( not ( = ?auto_48236 ?auto_48237 ) ) ( not ( = ?auto_48236 ?auto_48238 ) ) ( not ( = ?auto_48236 ?auto_48239 ) ) ( not ( = ?auto_48236 ?auto_48240 ) ) ( not ( = ?auto_48236 ?auto_48241 ) ) ( not ( = ?auto_48236 ?auto_48242 ) ) ( not ( = ?auto_48236 ?auto_48243 ) ) ( not ( = ?auto_48237 ?auto_48238 ) ) ( not ( = ?auto_48237 ?auto_48239 ) ) ( not ( = ?auto_48237 ?auto_48240 ) ) ( not ( = ?auto_48237 ?auto_48241 ) ) ( not ( = ?auto_48237 ?auto_48242 ) ) ( not ( = ?auto_48237 ?auto_48243 ) ) ( not ( = ?auto_48238 ?auto_48239 ) ) ( not ( = ?auto_48238 ?auto_48240 ) ) ( not ( = ?auto_48238 ?auto_48241 ) ) ( not ( = ?auto_48238 ?auto_48242 ) ) ( not ( = ?auto_48238 ?auto_48243 ) ) ( not ( = ?auto_48239 ?auto_48240 ) ) ( not ( = ?auto_48239 ?auto_48241 ) ) ( not ( = ?auto_48239 ?auto_48242 ) ) ( not ( = ?auto_48239 ?auto_48243 ) ) ( not ( = ?auto_48240 ?auto_48241 ) ) ( not ( = ?auto_48240 ?auto_48242 ) ) ( not ( = ?auto_48240 ?auto_48243 ) ) ( not ( = ?auto_48241 ?auto_48242 ) ) ( not ( = ?auto_48241 ?auto_48243 ) ) ( not ( = ?auto_48242 ?auto_48243 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48242 ?auto_48243 )
      ( !STACK ?auto_48242 ?auto_48241 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48266 - BLOCK
      ?auto_48267 - BLOCK
      ?auto_48268 - BLOCK
      ?auto_48269 - BLOCK
      ?auto_48270 - BLOCK
      ?auto_48271 - BLOCK
      ?auto_48272 - BLOCK
    )
    :vars
    (
      ?auto_48273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48272 ?auto_48273 ) ( ON-TABLE ?auto_48266 ) ( ON ?auto_48267 ?auto_48266 ) ( ON ?auto_48268 ?auto_48267 ) ( ON ?auto_48269 ?auto_48268 ) ( ON ?auto_48270 ?auto_48269 ) ( not ( = ?auto_48266 ?auto_48267 ) ) ( not ( = ?auto_48266 ?auto_48268 ) ) ( not ( = ?auto_48266 ?auto_48269 ) ) ( not ( = ?auto_48266 ?auto_48270 ) ) ( not ( = ?auto_48266 ?auto_48271 ) ) ( not ( = ?auto_48266 ?auto_48272 ) ) ( not ( = ?auto_48266 ?auto_48273 ) ) ( not ( = ?auto_48267 ?auto_48268 ) ) ( not ( = ?auto_48267 ?auto_48269 ) ) ( not ( = ?auto_48267 ?auto_48270 ) ) ( not ( = ?auto_48267 ?auto_48271 ) ) ( not ( = ?auto_48267 ?auto_48272 ) ) ( not ( = ?auto_48267 ?auto_48273 ) ) ( not ( = ?auto_48268 ?auto_48269 ) ) ( not ( = ?auto_48268 ?auto_48270 ) ) ( not ( = ?auto_48268 ?auto_48271 ) ) ( not ( = ?auto_48268 ?auto_48272 ) ) ( not ( = ?auto_48268 ?auto_48273 ) ) ( not ( = ?auto_48269 ?auto_48270 ) ) ( not ( = ?auto_48269 ?auto_48271 ) ) ( not ( = ?auto_48269 ?auto_48272 ) ) ( not ( = ?auto_48269 ?auto_48273 ) ) ( not ( = ?auto_48270 ?auto_48271 ) ) ( not ( = ?auto_48270 ?auto_48272 ) ) ( not ( = ?auto_48270 ?auto_48273 ) ) ( not ( = ?auto_48271 ?auto_48272 ) ) ( not ( = ?auto_48271 ?auto_48273 ) ) ( not ( = ?auto_48272 ?auto_48273 ) ) ( CLEAR ?auto_48270 ) ( ON ?auto_48271 ?auto_48272 ) ( CLEAR ?auto_48271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48266 ?auto_48267 ?auto_48268 ?auto_48269 ?auto_48270 ?auto_48271 )
      ( MAKE-7PILE ?auto_48266 ?auto_48267 ?auto_48268 ?auto_48269 ?auto_48270 ?auto_48271 ?auto_48272 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48296 - BLOCK
      ?auto_48297 - BLOCK
      ?auto_48298 - BLOCK
      ?auto_48299 - BLOCK
      ?auto_48300 - BLOCK
      ?auto_48301 - BLOCK
      ?auto_48302 - BLOCK
    )
    :vars
    (
      ?auto_48303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48302 ?auto_48303 ) ( ON-TABLE ?auto_48296 ) ( ON ?auto_48297 ?auto_48296 ) ( ON ?auto_48298 ?auto_48297 ) ( ON ?auto_48299 ?auto_48298 ) ( not ( = ?auto_48296 ?auto_48297 ) ) ( not ( = ?auto_48296 ?auto_48298 ) ) ( not ( = ?auto_48296 ?auto_48299 ) ) ( not ( = ?auto_48296 ?auto_48300 ) ) ( not ( = ?auto_48296 ?auto_48301 ) ) ( not ( = ?auto_48296 ?auto_48302 ) ) ( not ( = ?auto_48296 ?auto_48303 ) ) ( not ( = ?auto_48297 ?auto_48298 ) ) ( not ( = ?auto_48297 ?auto_48299 ) ) ( not ( = ?auto_48297 ?auto_48300 ) ) ( not ( = ?auto_48297 ?auto_48301 ) ) ( not ( = ?auto_48297 ?auto_48302 ) ) ( not ( = ?auto_48297 ?auto_48303 ) ) ( not ( = ?auto_48298 ?auto_48299 ) ) ( not ( = ?auto_48298 ?auto_48300 ) ) ( not ( = ?auto_48298 ?auto_48301 ) ) ( not ( = ?auto_48298 ?auto_48302 ) ) ( not ( = ?auto_48298 ?auto_48303 ) ) ( not ( = ?auto_48299 ?auto_48300 ) ) ( not ( = ?auto_48299 ?auto_48301 ) ) ( not ( = ?auto_48299 ?auto_48302 ) ) ( not ( = ?auto_48299 ?auto_48303 ) ) ( not ( = ?auto_48300 ?auto_48301 ) ) ( not ( = ?auto_48300 ?auto_48302 ) ) ( not ( = ?auto_48300 ?auto_48303 ) ) ( not ( = ?auto_48301 ?auto_48302 ) ) ( not ( = ?auto_48301 ?auto_48303 ) ) ( not ( = ?auto_48302 ?auto_48303 ) ) ( ON ?auto_48301 ?auto_48302 ) ( CLEAR ?auto_48299 ) ( ON ?auto_48300 ?auto_48301 ) ( CLEAR ?auto_48300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48296 ?auto_48297 ?auto_48298 ?auto_48299 ?auto_48300 )
      ( MAKE-7PILE ?auto_48296 ?auto_48297 ?auto_48298 ?auto_48299 ?auto_48300 ?auto_48301 ?auto_48302 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48326 - BLOCK
      ?auto_48327 - BLOCK
      ?auto_48328 - BLOCK
      ?auto_48329 - BLOCK
      ?auto_48330 - BLOCK
      ?auto_48331 - BLOCK
      ?auto_48332 - BLOCK
    )
    :vars
    (
      ?auto_48333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48332 ?auto_48333 ) ( ON-TABLE ?auto_48326 ) ( ON ?auto_48327 ?auto_48326 ) ( ON ?auto_48328 ?auto_48327 ) ( not ( = ?auto_48326 ?auto_48327 ) ) ( not ( = ?auto_48326 ?auto_48328 ) ) ( not ( = ?auto_48326 ?auto_48329 ) ) ( not ( = ?auto_48326 ?auto_48330 ) ) ( not ( = ?auto_48326 ?auto_48331 ) ) ( not ( = ?auto_48326 ?auto_48332 ) ) ( not ( = ?auto_48326 ?auto_48333 ) ) ( not ( = ?auto_48327 ?auto_48328 ) ) ( not ( = ?auto_48327 ?auto_48329 ) ) ( not ( = ?auto_48327 ?auto_48330 ) ) ( not ( = ?auto_48327 ?auto_48331 ) ) ( not ( = ?auto_48327 ?auto_48332 ) ) ( not ( = ?auto_48327 ?auto_48333 ) ) ( not ( = ?auto_48328 ?auto_48329 ) ) ( not ( = ?auto_48328 ?auto_48330 ) ) ( not ( = ?auto_48328 ?auto_48331 ) ) ( not ( = ?auto_48328 ?auto_48332 ) ) ( not ( = ?auto_48328 ?auto_48333 ) ) ( not ( = ?auto_48329 ?auto_48330 ) ) ( not ( = ?auto_48329 ?auto_48331 ) ) ( not ( = ?auto_48329 ?auto_48332 ) ) ( not ( = ?auto_48329 ?auto_48333 ) ) ( not ( = ?auto_48330 ?auto_48331 ) ) ( not ( = ?auto_48330 ?auto_48332 ) ) ( not ( = ?auto_48330 ?auto_48333 ) ) ( not ( = ?auto_48331 ?auto_48332 ) ) ( not ( = ?auto_48331 ?auto_48333 ) ) ( not ( = ?auto_48332 ?auto_48333 ) ) ( ON ?auto_48331 ?auto_48332 ) ( ON ?auto_48330 ?auto_48331 ) ( CLEAR ?auto_48328 ) ( ON ?auto_48329 ?auto_48330 ) ( CLEAR ?auto_48329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48326 ?auto_48327 ?auto_48328 ?auto_48329 )
      ( MAKE-7PILE ?auto_48326 ?auto_48327 ?auto_48328 ?auto_48329 ?auto_48330 ?auto_48331 ?auto_48332 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48356 - BLOCK
      ?auto_48357 - BLOCK
      ?auto_48358 - BLOCK
      ?auto_48359 - BLOCK
      ?auto_48360 - BLOCK
      ?auto_48361 - BLOCK
      ?auto_48362 - BLOCK
    )
    :vars
    (
      ?auto_48363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48362 ?auto_48363 ) ( ON-TABLE ?auto_48356 ) ( ON ?auto_48357 ?auto_48356 ) ( not ( = ?auto_48356 ?auto_48357 ) ) ( not ( = ?auto_48356 ?auto_48358 ) ) ( not ( = ?auto_48356 ?auto_48359 ) ) ( not ( = ?auto_48356 ?auto_48360 ) ) ( not ( = ?auto_48356 ?auto_48361 ) ) ( not ( = ?auto_48356 ?auto_48362 ) ) ( not ( = ?auto_48356 ?auto_48363 ) ) ( not ( = ?auto_48357 ?auto_48358 ) ) ( not ( = ?auto_48357 ?auto_48359 ) ) ( not ( = ?auto_48357 ?auto_48360 ) ) ( not ( = ?auto_48357 ?auto_48361 ) ) ( not ( = ?auto_48357 ?auto_48362 ) ) ( not ( = ?auto_48357 ?auto_48363 ) ) ( not ( = ?auto_48358 ?auto_48359 ) ) ( not ( = ?auto_48358 ?auto_48360 ) ) ( not ( = ?auto_48358 ?auto_48361 ) ) ( not ( = ?auto_48358 ?auto_48362 ) ) ( not ( = ?auto_48358 ?auto_48363 ) ) ( not ( = ?auto_48359 ?auto_48360 ) ) ( not ( = ?auto_48359 ?auto_48361 ) ) ( not ( = ?auto_48359 ?auto_48362 ) ) ( not ( = ?auto_48359 ?auto_48363 ) ) ( not ( = ?auto_48360 ?auto_48361 ) ) ( not ( = ?auto_48360 ?auto_48362 ) ) ( not ( = ?auto_48360 ?auto_48363 ) ) ( not ( = ?auto_48361 ?auto_48362 ) ) ( not ( = ?auto_48361 ?auto_48363 ) ) ( not ( = ?auto_48362 ?auto_48363 ) ) ( ON ?auto_48361 ?auto_48362 ) ( ON ?auto_48360 ?auto_48361 ) ( ON ?auto_48359 ?auto_48360 ) ( CLEAR ?auto_48357 ) ( ON ?auto_48358 ?auto_48359 ) ( CLEAR ?auto_48358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48356 ?auto_48357 ?auto_48358 )
      ( MAKE-7PILE ?auto_48356 ?auto_48357 ?auto_48358 ?auto_48359 ?auto_48360 ?auto_48361 ?auto_48362 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48386 - BLOCK
      ?auto_48387 - BLOCK
      ?auto_48388 - BLOCK
      ?auto_48389 - BLOCK
      ?auto_48390 - BLOCK
      ?auto_48391 - BLOCK
      ?auto_48392 - BLOCK
    )
    :vars
    (
      ?auto_48393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48392 ?auto_48393 ) ( ON-TABLE ?auto_48386 ) ( not ( = ?auto_48386 ?auto_48387 ) ) ( not ( = ?auto_48386 ?auto_48388 ) ) ( not ( = ?auto_48386 ?auto_48389 ) ) ( not ( = ?auto_48386 ?auto_48390 ) ) ( not ( = ?auto_48386 ?auto_48391 ) ) ( not ( = ?auto_48386 ?auto_48392 ) ) ( not ( = ?auto_48386 ?auto_48393 ) ) ( not ( = ?auto_48387 ?auto_48388 ) ) ( not ( = ?auto_48387 ?auto_48389 ) ) ( not ( = ?auto_48387 ?auto_48390 ) ) ( not ( = ?auto_48387 ?auto_48391 ) ) ( not ( = ?auto_48387 ?auto_48392 ) ) ( not ( = ?auto_48387 ?auto_48393 ) ) ( not ( = ?auto_48388 ?auto_48389 ) ) ( not ( = ?auto_48388 ?auto_48390 ) ) ( not ( = ?auto_48388 ?auto_48391 ) ) ( not ( = ?auto_48388 ?auto_48392 ) ) ( not ( = ?auto_48388 ?auto_48393 ) ) ( not ( = ?auto_48389 ?auto_48390 ) ) ( not ( = ?auto_48389 ?auto_48391 ) ) ( not ( = ?auto_48389 ?auto_48392 ) ) ( not ( = ?auto_48389 ?auto_48393 ) ) ( not ( = ?auto_48390 ?auto_48391 ) ) ( not ( = ?auto_48390 ?auto_48392 ) ) ( not ( = ?auto_48390 ?auto_48393 ) ) ( not ( = ?auto_48391 ?auto_48392 ) ) ( not ( = ?auto_48391 ?auto_48393 ) ) ( not ( = ?auto_48392 ?auto_48393 ) ) ( ON ?auto_48391 ?auto_48392 ) ( ON ?auto_48390 ?auto_48391 ) ( ON ?auto_48389 ?auto_48390 ) ( ON ?auto_48388 ?auto_48389 ) ( CLEAR ?auto_48386 ) ( ON ?auto_48387 ?auto_48388 ) ( CLEAR ?auto_48387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48386 ?auto_48387 )
      ( MAKE-7PILE ?auto_48386 ?auto_48387 ?auto_48388 ?auto_48389 ?auto_48390 ?auto_48391 ?auto_48392 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_48416 - BLOCK
      ?auto_48417 - BLOCK
      ?auto_48418 - BLOCK
      ?auto_48419 - BLOCK
      ?auto_48420 - BLOCK
      ?auto_48421 - BLOCK
      ?auto_48422 - BLOCK
    )
    :vars
    (
      ?auto_48423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48422 ?auto_48423 ) ( not ( = ?auto_48416 ?auto_48417 ) ) ( not ( = ?auto_48416 ?auto_48418 ) ) ( not ( = ?auto_48416 ?auto_48419 ) ) ( not ( = ?auto_48416 ?auto_48420 ) ) ( not ( = ?auto_48416 ?auto_48421 ) ) ( not ( = ?auto_48416 ?auto_48422 ) ) ( not ( = ?auto_48416 ?auto_48423 ) ) ( not ( = ?auto_48417 ?auto_48418 ) ) ( not ( = ?auto_48417 ?auto_48419 ) ) ( not ( = ?auto_48417 ?auto_48420 ) ) ( not ( = ?auto_48417 ?auto_48421 ) ) ( not ( = ?auto_48417 ?auto_48422 ) ) ( not ( = ?auto_48417 ?auto_48423 ) ) ( not ( = ?auto_48418 ?auto_48419 ) ) ( not ( = ?auto_48418 ?auto_48420 ) ) ( not ( = ?auto_48418 ?auto_48421 ) ) ( not ( = ?auto_48418 ?auto_48422 ) ) ( not ( = ?auto_48418 ?auto_48423 ) ) ( not ( = ?auto_48419 ?auto_48420 ) ) ( not ( = ?auto_48419 ?auto_48421 ) ) ( not ( = ?auto_48419 ?auto_48422 ) ) ( not ( = ?auto_48419 ?auto_48423 ) ) ( not ( = ?auto_48420 ?auto_48421 ) ) ( not ( = ?auto_48420 ?auto_48422 ) ) ( not ( = ?auto_48420 ?auto_48423 ) ) ( not ( = ?auto_48421 ?auto_48422 ) ) ( not ( = ?auto_48421 ?auto_48423 ) ) ( not ( = ?auto_48422 ?auto_48423 ) ) ( ON ?auto_48421 ?auto_48422 ) ( ON ?auto_48420 ?auto_48421 ) ( ON ?auto_48419 ?auto_48420 ) ( ON ?auto_48418 ?auto_48419 ) ( ON ?auto_48417 ?auto_48418 ) ( ON ?auto_48416 ?auto_48417 ) ( CLEAR ?auto_48416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48416 )
      ( MAKE-7PILE ?auto_48416 ?auto_48417 ?auto_48418 ?auto_48419 ?auto_48420 ?auto_48421 ?auto_48422 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48447 - BLOCK
      ?auto_48448 - BLOCK
      ?auto_48449 - BLOCK
      ?auto_48450 - BLOCK
      ?auto_48451 - BLOCK
      ?auto_48452 - BLOCK
      ?auto_48453 - BLOCK
      ?auto_48454 - BLOCK
    )
    :vars
    (
      ?auto_48455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48453 ) ( ON ?auto_48454 ?auto_48455 ) ( CLEAR ?auto_48454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48447 ) ( ON ?auto_48448 ?auto_48447 ) ( ON ?auto_48449 ?auto_48448 ) ( ON ?auto_48450 ?auto_48449 ) ( ON ?auto_48451 ?auto_48450 ) ( ON ?auto_48452 ?auto_48451 ) ( ON ?auto_48453 ?auto_48452 ) ( not ( = ?auto_48447 ?auto_48448 ) ) ( not ( = ?auto_48447 ?auto_48449 ) ) ( not ( = ?auto_48447 ?auto_48450 ) ) ( not ( = ?auto_48447 ?auto_48451 ) ) ( not ( = ?auto_48447 ?auto_48452 ) ) ( not ( = ?auto_48447 ?auto_48453 ) ) ( not ( = ?auto_48447 ?auto_48454 ) ) ( not ( = ?auto_48447 ?auto_48455 ) ) ( not ( = ?auto_48448 ?auto_48449 ) ) ( not ( = ?auto_48448 ?auto_48450 ) ) ( not ( = ?auto_48448 ?auto_48451 ) ) ( not ( = ?auto_48448 ?auto_48452 ) ) ( not ( = ?auto_48448 ?auto_48453 ) ) ( not ( = ?auto_48448 ?auto_48454 ) ) ( not ( = ?auto_48448 ?auto_48455 ) ) ( not ( = ?auto_48449 ?auto_48450 ) ) ( not ( = ?auto_48449 ?auto_48451 ) ) ( not ( = ?auto_48449 ?auto_48452 ) ) ( not ( = ?auto_48449 ?auto_48453 ) ) ( not ( = ?auto_48449 ?auto_48454 ) ) ( not ( = ?auto_48449 ?auto_48455 ) ) ( not ( = ?auto_48450 ?auto_48451 ) ) ( not ( = ?auto_48450 ?auto_48452 ) ) ( not ( = ?auto_48450 ?auto_48453 ) ) ( not ( = ?auto_48450 ?auto_48454 ) ) ( not ( = ?auto_48450 ?auto_48455 ) ) ( not ( = ?auto_48451 ?auto_48452 ) ) ( not ( = ?auto_48451 ?auto_48453 ) ) ( not ( = ?auto_48451 ?auto_48454 ) ) ( not ( = ?auto_48451 ?auto_48455 ) ) ( not ( = ?auto_48452 ?auto_48453 ) ) ( not ( = ?auto_48452 ?auto_48454 ) ) ( not ( = ?auto_48452 ?auto_48455 ) ) ( not ( = ?auto_48453 ?auto_48454 ) ) ( not ( = ?auto_48453 ?auto_48455 ) ) ( not ( = ?auto_48454 ?auto_48455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48454 ?auto_48455 )
      ( !STACK ?auto_48454 ?auto_48453 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48464 - BLOCK
      ?auto_48465 - BLOCK
      ?auto_48466 - BLOCK
      ?auto_48467 - BLOCK
      ?auto_48468 - BLOCK
      ?auto_48469 - BLOCK
      ?auto_48470 - BLOCK
      ?auto_48471 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48470 ) ( ON-TABLE ?auto_48471 ) ( CLEAR ?auto_48471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48464 ) ( ON ?auto_48465 ?auto_48464 ) ( ON ?auto_48466 ?auto_48465 ) ( ON ?auto_48467 ?auto_48466 ) ( ON ?auto_48468 ?auto_48467 ) ( ON ?auto_48469 ?auto_48468 ) ( ON ?auto_48470 ?auto_48469 ) ( not ( = ?auto_48464 ?auto_48465 ) ) ( not ( = ?auto_48464 ?auto_48466 ) ) ( not ( = ?auto_48464 ?auto_48467 ) ) ( not ( = ?auto_48464 ?auto_48468 ) ) ( not ( = ?auto_48464 ?auto_48469 ) ) ( not ( = ?auto_48464 ?auto_48470 ) ) ( not ( = ?auto_48464 ?auto_48471 ) ) ( not ( = ?auto_48465 ?auto_48466 ) ) ( not ( = ?auto_48465 ?auto_48467 ) ) ( not ( = ?auto_48465 ?auto_48468 ) ) ( not ( = ?auto_48465 ?auto_48469 ) ) ( not ( = ?auto_48465 ?auto_48470 ) ) ( not ( = ?auto_48465 ?auto_48471 ) ) ( not ( = ?auto_48466 ?auto_48467 ) ) ( not ( = ?auto_48466 ?auto_48468 ) ) ( not ( = ?auto_48466 ?auto_48469 ) ) ( not ( = ?auto_48466 ?auto_48470 ) ) ( not ( = ?auto_48466 ?auto_48471 ) ) ( not ( = ?auto_48467 ?auto_48468 ) ) ( not ( = ?auto_48467 ?auto_48469 ) ) ( not ( = ?auto_48467 ?auto_48470 ) ) ( not ( = ?auto_48467 ?auto_48471 ) ) ( not ( = ?auto_48468 ?auto_48469 ) ) ( not ( = ?auto_48468 ?auto_48470 ) ) ( not ( = ?auto_48468 ?auto_48471 ) ) ( not ( = ?auto_48469 ?auto_48470 ) ) ( not ( = ?auto_48469 ?auto_48471 ) ) ( not ( = ?auto_48470 ?auto_48471 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_48471 )
      ( !STACK ?auto_48471 ?auto_48470 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48480 - BLOCK
      ?auto_48481 - BLOCK
      ?auto_48482 - BLOCK
      ?auto_48483 - BLOCK
      ?auto_48484 - BLOCK
      ?auto_48485 - BLOCK
      ?auto_48486 - BLOCK
      ?auto_48487 - BLOCK
    )
    :vars
    (
      ?auto_48488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48487 ?auto_48488 ) ( ON-TABLE ?auto_48480 ) ( ON ?auto_48481 ?auto_48480 ) ( ON ?auto_48482 ?auto_48481 ) ( ON ?auto_48483 ?auto_48482 ) ( ON ?auto_48484 ?auto_48483 ) ( ON ?auto_48485 ?auto_48484 ) ( not ( = ?auto_48480 ?auto_48481 ) ) ( not ( = ?auto_48480 ?auto_48482 ) ) ( not ( = ?auto_48480 ?auto_48483 ) ) ( not ( = ?auto_48480 ?auto_48484 ) ) ( not ( = ?auto_48480 ?auto_48485 ) ) ( not ( = ?auto_48480 ?auto_48486 ) ) ( not ( = ?auto_48480 ?auto_48487 ) ) ( not ( = ?auto_48480 ?auto_48488 ) ) ( not ( = ?auto_48481 ?auto_48482 ) ) ( not ( = ?auto_48481 ?auto_48483 ) ) ( not ( = ?auto_48481 ?auto_48484 ) ) ( not ( = ?auto_48481 ?auto_48485 ) ) ( not ( = ?auto_48481 ?auto_48486 ) ) ( not ( = ?auto_48481 ?auto_48487 ) ) ( not ( = ?auto_48481 ?auto_48488 ) ) ( not ( = ?auto_48482 ?auto_48483 ) ) ( not ( = ?auto_48482 ?auto_48484 ) ) ( not ( = ?auto_48482 ?auto_48485 ) ) ( not ( = ?auto_48482 ?auto_48486 ) ) ( not ( = ?auto_48482 ?auto_48487 ) ) ( not ( = ?auto_48482 ?auto_48488 ) ) ( not ( = ?auto_48483 ?auto_48484 ) ) ( not ( = ?auto_48483 ?auto_48485 ) ) ( not ( = ?auto_48483 ?auto_48486 ) ) ( not ( = ?auto_48483 ?auto_48487 ) ) ( not ( = ?auto_48483 ?auto_48488 ) ) ( not ( = ?auto_48484 ?auto_48485 ) ) ( not ( = ?auto_48484 ?auto_48486 ) ) ( not ( = ?auto_48484 ?auto_48487 ) ) ( not ( = ?auto_48484 ?auto_48488 ) ) ( not ( = ?auto_48485 ?auto_48486 ) ) ( not ( = ?auto_48485 ?auto_48487 ) ) ( not ( = ?auto_48485 ?auto_48488 ) ) ( not ( = ?auto_48486 ?auto_48487 ) ) ( not ( = ?auto_48486 ?auto_48488 ) ) ( not ( = ?auto_48487 ?auto_48488 ) ) ( CLEAR ?auto_48485 ) ( ON ?auto_48486 ?auto_48487 ) ( CLEAR ?auto_48486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_48480 ?auto_48481 ?auto_48482 ?auto_48483 ?auto_48484 ?auto_48485 ?auto_48486 )
      ( MAKE-8PILE ?auto_48480 ?auto_48481 ?auto_48482 ?auto_48483 ?auto_48484 ?auto_48485 ?auto_48486 ?auto_48487 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48497 - BLOCK
      ?auto_48498 - BLOCK
      ?auto_48499 - BLOCK
      ?auto_48500 - BLOCK
      ?auto_48501 - BLOCK
      ?auto_48502 - BLOCK
      ?auto_48503 - BLOCK
      ?auto_48504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48504 ) ( ON-TABLE ?auto_48497 ) ( ON ?auto_48498 ?auto_48497 ) ( ON ?auto_48499 ?auto_48498 ) ( ON ?auto_48500 ?auto_48499 ) ( ON ?auto_48501 ?auto_48500 ) ( ON ?auto_48502 ?auto_48501 ) ( not ( = ?auto_48497 ?auto_48498 ) ) ( not ( = ?auto_48497 ?auto_48499 ) ) ( not ( = ?auto_48497 ?auto_48500 ) ) ( not ( = ?auto_48497 ?auto_48501 ) ) ( not ( = ?auto_48497 ?auto_48502 ) ) ( not ( = ?auto_48497 ?auto_48503 ) ) ( not ( = ?auto_48497 ?auto_48504 ) ) ( not ( = ?auto_48498 ?auto_48499 ) ) ( not ( = ?auto_48498 ?auto_48500 ) ) ( not ( = ?auto_48498 ?auto_48501 ) ) ( not ( = ?auto_48498 ?auto_48502 ) ) ( not ( = ?auto_48498 ?auto_48503 ) ) ( not ( = ?auto_48498 ?auto_48504 ) ) ( not ( = ?auto_48499 ?auto_48500 ) ) ( not ( = ?auto_48499 ?auto_48501 ) ) ( not ( = ?auto_48499 ?auto_48502 ) ) ( not ( = ?auto_48499 ?auto_48503 ) ) ( not ( = ?auto_48499 ?auto_48504 ) ) ( not ( = ?auto_48500 ?auto_48501 ) ) ( not ( = ?auto_48500 ?auto_48502 ) ) ( not ( = ?auto_48500 ?auto_48503 ) ) ( not ( = ?auto_48500 ?auto_48504 ) ) ( not ( = ?auto_48501 ?auto_48502 ) ) ( not ( = ?auto_48501 ?auto_48503 ) ) ( not ( = ?auto_48501 ?auto_48504 ) ) ( not ( = ?auto_48502 ?auto_48503 ) ) ( not ( = ?auto_48502 ?auto_48504 ) ) ( not ( = ?auto_48503 ?auto_48504 ) ) ( CLEAR ?auto_48502 ) ( ON ?auto_48503 ?auto_48504 ) ( CLEAR ?auto_48503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_48497 ?auto_48498 ?auto_48499 ?auto_48500 ?auto_48501 ?auto_48502 ?auto_48503 )
      ( MAKE-8PILE ?auto_48497 ?auto_48498 ?auto_48499 ?auto_48500 ?auto_48501 ?auto_48502 ?auto_48503 ?auto_48504 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48513 - BLOCK
      ?auto_48514 - BLOCK
      ?auto_48515 - BLOCK
      ?auto_48516 - BLOCK
      ?auto_48517 - BLOCK
      ?auto_48518 - BLOCK
      ?auto_48519 - BLOCK
      ?auto_48520 - BLOCK
    )
    :vars
    (
      ?auto_48521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48520 ?auto_48521 ) ( ON-TABLE ?auto_48513 ) ( ON ?auto_48514 ?auto_48513 ) ( ON ?auto_48515 ?auto_48514 ) ( ON ?auto_48516 ?auto_48515 ) ( ON ?auto_48517 ?auto_48516 ) ( not ( = ?auto_48513 ?auto_48514 ) ) ( not ( = ?auto_48513 ?auto_48515 ) ) ( not ( = ?auto_48513 ?auto_48516 ) ) ( not ( = ?auto_48513 ?auto_48517 ) ) ( not ( = ?auto_48513 ?auto_48518 ) ) ( not ( = ?auto_48513 ?auto_48519 ) ) ( not ( = ?auto_48513 ?auto_48520 ) ) ( not ( = ?auto_48513 ?auto_48521 ) ) ( not ( = ?auto_48514 ?auto_48515 ) ) ( not ( = ?auto_48514 ?auto_48516 ) ) ( not ( = ?auto_48514 ?auto_48517 ) ) ( not ( = ?auto_48514 ?auto_48518 ) ) ( not ( = ?auto_48514 ?auto_48519 ) ) ( not ( = ?auto_48514 ?auto_48520 ) ) ( not ( = ?auto_48514 ?auto_48521 ) ) ( not ( = ?auto_48515 ?auto_48516 ) ) ( not ( = ?auto_48515 ?auto_48517 ) ) ( not ( = ?auto_48515 ?auto_48518 ) ) ( not ( = ?auto_48515 ?auto_48519 ) ) ( not ( = ?auto_48515 ?auto_48520 ) ) ( not ( = ?auto_48515 ?auto_48521 ) ) ( not ( = ?auto_48516 ?auto_48517 ) ) ( not ( = ?auto_48516 ?auto_48518 ) ) ( not ( = ?auto_48516 ?auto_48519 ) ) ( not ( = ?auto_48516 ?auto_48520 ) ) ( not ( = ?auto_48516 ?auto_48521 ) ) ( not ( = ?auto_48517 ?auto_48518 ) ) ( not ( = ?auto_48517 ?auto_48519 ) ) ( not ( = ?auto_48517 ?auto_48520 ) ) ( not ( = ?auto_48517 ?auto_48521 ) ) ( not ( = ?auto_48518 ?auto_48519 ) ) ( not ( = ?auto_48518 ?auto_48520 ) ) ( not ( = ?auto_48518 ?auto_48521 ) ) ( not ( = ?auto_48519 ?auto_48520 ) ) ( not ( = ?auto_48519 ?auto_48521 ) ) ( not ( = ?auto_48520 ?auto_48521 ) ) ( ON ?auto_48519 ?auto_48520 ) ( CLEAR ?auto_48517 ) ( ON ?auto_48518 ?auto_48519 ) ( CLEAR ?auto_48518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48513 ?auto_48514 ?auto_48515 ?auto_48516 ?auto_48517 ?auto_48518 )
      ( MAKE-8PILE ?auto_48513 ?auto_48514 ?auto_48515 ?auto_48516 ?auto_48517 ?auto_48518 ?auto_48519 ?auto_48520 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48530 - BLOCK
      ?auto_48531 - BLOCK
      ?auto_48532 - BLOCK
      ?auto_48533 - BLOCK
      ?auto_48534 - BLOCK
      ?auto_48535 - BLOCK
      ?auto_48536 - BLOCK
      ?auto_48537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48537 ) ( ON-TABLE ?auto_48530 ) ( ON ?auto_48531 ?auto_48530 ) ( ON ?auto_48532 ?auto_48531 ) ( ON ?auto_48533 ?auto_48532 ) ( ON ?auto_48534 ?auto_48533 ) ( not ( = ?auto_48530 ?auto_48531 ) ) ( not ( = ?auto_48530 ?auto_48532 ) ) ( not ( = ?auto_48530 ?auto_48533 ) ) ( not ( = ?auto_48530 ?auto_48534 ) ) ( not ( = ?auto_48530 ?auto_48535 ) ) ( not ( = ?auto_48530 ?auto_48536 ) ) ( not ( = ?auto_48530 ?auto_48537 ) ) ( not ( = ?auto_48531 ?auto_48532 ) ) ( not ( = ?auto_48531 ?auto_48533 ) ) ( not ( = ?auto_48531 ?auto_48534 ) ) ( not ( = ?auto_48531 ?auto_48535 ) ) ( not ( = ?auto_48531 ?auto_48536 ) ) ( not ( = ?auto_48531 ?auto_48537 ) ) ( not ( = ?auto_48532 ?auto_48533 ) ) ( not ( = ?auto_48532 ?auto_48534 ) ) ( not ( = ?auto_48532 ?auto_48535 ) ) ( not ( = ?auto_48532 ?auto_48536 ) ) ( not ( = ?auto_48532 ?auto_48537 ) ) ( not ( = ?auto_48533 ?auto_48534 ) ) ( not ( = ?auto_48533 ?auto_48535 ) ) ( not ( = ?auto_48533 ?auto_48536 ) ) ( not ( = ?auto_48533 ?auto_48537 ) ) ( not ( = ?auto_48534 ?auto_48535 ) ) ( not ( = ?auto_48534 ?auto_48536 ) ) ( not ( = ?auto_48534 ?auto_48537 ) ) ( not ( = ?auto_48535 ?auto_48536 ) ) ( not ( = ?auto_48535 ?auto_48537 ) ) ( not ( = ?auto_48536 ?auto_48537 ) ) ( ON ?auto_48536 ?auto_48537 ) ( CLEAR ?auto_48534 ) ( ON ?auto_48535 ?auto_48536 ) ( CLEAR ?auto_48535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48530 ?auto_48531 ?auto_48532 ?auto_48533 ?auto_48534 ?auto_48535 )
      ( MAKE-8PILE ?auto_48530 ?auto_48531 ?auto_48532 ?auto_48533 ?auto_48534 ?auto_48535 ?auto_48536 ?auto_48537 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48546 - BLOCK
      ?auto_48547 - BLOCK
      ?auto_48548 - BLOCK
      ?auto_48549 - BLOCK
      ?auto_48550 - BLOCK
      ?auto_48551 - BLOCK
      ?auto_48552 - BLOCK
      ?auto_48553 - BLOCK
    )
    :vars
    (
      ?auto_48554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48553 ?auto_48554 ) ( ON-TABLE ?auto_48546 ) ( ON ?auto_48547 ?auto_48546 ) ( ON ?auto_48548 ?auto_48547 ) ( ON ?auto_48549 ?auto_48548 ) ( not ( = ?auto_48546 ?auto_48547 ) ) ( not ( = ?auto_48546 ?auto_48548 ) ) ( not ( = ?auto_48546 ?auto_48549 ) ) ( not ( = ?auto_48546 ?auto_48550 ) ) ( not ( = ?auto_48546 ?auto_48551 ) ) ( not ( = ?auto_48546 ?auto_48552 ) ) ( not ( = ?auto_48546 ?auto_48553 ) ) ( not ( = ?auto_48546 ?auto_48554 ) ) ( not ( = ?auto_48547 ?auto_48548 ) ) ( not ( = ?auto_48547 ?auto_48549 ) ) ( not ( = ?auto_48547 ?auto_48550 ) ) ( not ( = ?auto_48547 ?auto_48551 ) ) ( not ( = ?auto_48547 ?auto_48552 ) ) ( not ( = ?auto_48547 ?auto_48553 ) ) ( not ( = ?auto_48547 ?auto_48554 ) ) ( not ( = ?auto_48548 ?auto_48549 ) ) ( not ( = ?auto_48548 ?auto_48550 ) ) ( not ( = ?auto_48548 ?auto_48551 ) ) ( not ( = ?auto_48548 ?auto_48552 ) ) ( not ( = ?auto_48548 ?auto_48553 ) ) ( not ( = ?auto_48548 ?auto_48554 ) ) ( not ( = ?auto_48549 ?auto_48550 ) ) ( not ( = ?auto_48549 ?auto_48551 ) ) ( not ( = ?auto_48549 ?auto_48552 ) ) ( not ( = ?auto_48549 ?auto_48553 ) ) ( not ( = ?auto_48549 ?auto_48554 ) ) ( not ( = ?auto_48550 ?auto_48551 ) ) ( not ( = ?auto_48550 ?auto_48552 ) ) ( not ( = ?auto_48550 ?auto_48553 ) ) ( not ( = ?auto_48550 ?auto_48554 ) ) ( not ( = ?auto_48551 ?auto_48552 ) ) ( not ( = ?auto_48551 ?auto_48553 ) ) ( not ( = ?auto_48551 ?auto_48554 ) ) ( not ( = ?auto_48552 ?auto_48553 ) ) ( not ( = ?auto_48552 ?auto_48554 ) ) ( not ( = ?auto_48553 ?auto_48554 ) ) ( ON ?auto_48552 ?auto_48553 ) ( ON ?auto_48551 ?auto_48552 ) ( CLEAR ?auto_48549 ) ( ON ?auto_48550 ?auto_48551 ) ( CLEAR ?auto_48550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48546 ?auto_48547 ?auto_48548 ?auto_48549 ?auto_48550 )
      ( MAKE-8PILE ?auto_48546 ?auto_48547 ?auto_48548 ?auto_48549 ?auto_48550 ?auto_48551 ?auto_48552 ?auto_48553 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48563 - BLOCK
      ?auto_48564 - BLOCK
      ?auto_48565 - BLOCK
      ?auto_48566 - BLOCK
      ?auto_48567 - BLOCK
      ?auto_48568 - BLOCK
      ?auto_48569 - BLOCK
      ?auto_48570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48570 ) ( ON-TABLE ?auto_48563 ) ( ON ?auto_48564 ?auto_48563 ) ( ON ?auto_48565 ?auto_48564 ) ( ON ?auto_48566 ?auto_48565 ) ( not ( = ?auto_48563 ?auto_48564 ) ) ( not ( = ?auto_48563 ?auto_48565 ) ) ( not ( = ?auto_48563 ?auto_48566 ) ) ( not ( = ?auto_48563 ?auto_48567 ) ) ( not ( = ?auto_48563 ?auto_48568 ) ) ( not ( = ?auto_48563 ?auto_48569 ) ) ( not ( = ?auto_48563 ?auto_48570 ) ) ( not ( = ?auto_48564 ?auto_48565 ) ) ( not ( = ?auto_48564 ?auto_48566 ) ) ( not ( = ?auto_48564 ?auto_48567 ) ) ( not ( = ?auto_48564 ?auto_48568 ) ) ( not ( = ?auto_48564 ?auto_48569 ) ) ( not ( = ?auto_48564 ?auto_48570 ) ) ( not ( = ?auto_48565 ?auto_48566 ) ) ( not ( = ?auto_48565 ?auto_48567 ) ) ( not ( = ?auto_48565 ?auto_48568 ) ) ( not ( = ?auto_48565 ?auto_48569 ) ) ( not ( = ?auto_48565 ?auto_48570 ) ) ( not ( = ?auto_48566 ?auto_48567 ) ) ( not ( = ?auto_48566 ?auto_48568 ) ) ( not ( = ?auto_48566 ?auto_48569 ) ) ( not ( = ?auto_48566 ?auto_48570 ) ) ( not ( = ?auto_48567 ?auto_48568 ) ) ( not ( = ?auto_48567 ?auto_48569 ) ) ( not ( = ?auto_48567 ?auto_48570 ) ) ( not ( = ?auto_48568 ?auto_48569 ) ) ( not ( = ?auto_48568 ?auto_48570 ) ) ( not ( = ?auto_48569 ?auto_48570 ) ) ( ON ?auto_48569 ?auto_48570 ) ( ON ?auto_48568 ?auto_48569 ) ( CLEAR ?auto_48566 ) ( ON ?auto_48567 ?auto_48568 ) ( CLEAR ?auto_48567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48563 ?auto_48564 ?auto_48565 ?auto_48566 ?auto_48567 )
      ( MAKE-8PILE ?auto_48563 ?auto_48564 ?auto_48565 ?auto_48566 ?auto_48567 ?auto_48568 ?auto_48569 ?auto_48570 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48579 - BLOCK
      ?auto_48580 - BLOCK
      ?auto_48581 - BLOCK
      ?auto_48582 - BLOCK
      ?auto_48583 - BLOCK
      ?auto_48584 - BLOCK
      ?auto_48585 - BLOCK
      ?auto_48586 - BLOCK
    )
    :vars
    (
      ?auto_48587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48586 ?auto_48587 ) ( ON-TABLE ?auto_48579 ) ( ON ?auto_48580 ?auto_48579 ) ( ON ?auto_48581 ?auto_48580 ) ( not ( = ?auto_48579 ?auto_48580 ) ) ( not ( = ?auto_48579 ?auto_48581 ) ) ( not ( = ?auto_48579 ?auto_48582 ) ) ( not ( = ?auto_48579 ?auto_48583 ) ) ( not ( = ?auto_48579 ?auto_48584 ) ) ( not ( = ?auto_48579 ?auto_48585 ) ) ( not ( = ?auto_48579 ?auto_48586 ) ) ( not ( = ?auto_48579 ?auto_48587 ) ) ( not ( = ?auto_48580 ?auto_48581 ) ) ( not ( = ?auto_48580 ?auto_48582 ) ) ( not ( = ?auto_48580 ?auto_48583 ) ) ( not ( = ?auto_48580 ?auto_48584 ) ) ( not ( = ?auto_48580 ?auto_48585 ) ) ( not ( = ?auto_48580 ?auto_48586 ) ) ( not ( = ?auto_48580 ?auto_48587 ) ) ( not ( = ?auto_48581 ?auto_48582 ) ) ( not ( = ?auto_48581 ?auto_48583 ) ) ( not ( = ?auto_48581 ?auto_48584 ) ) ( not ( = ?auto_48581 ?auto_48585 ) ) ( not ( = ?auto_48581 ?auto_48586 ) ) ( not ( = ?auto_48581 ?auto_48587 ) ) ( not ( = ?auto_48582 ?auto_48583 ) ) ( not ( = ?auto_48582 ?auto_48584 ) ) ( not ( = ?auto_48582 ?auto_48585 ) ) ( not ( = ?auto_48582 ?auto_48586 ) ) ( not ( = ?auto_48582 ?auto_48587 ) ) ( not ( = ?auto_48583 ?auto_48584 ) ) ( not ( = ?auto_48583 ?auto_48585 ) ) ( not ( = ?auto_48583 ?auto_48586 ) ) ( not ( = ?auto_48583 ?auto_48587 ) ) ( not ( = ?auto_48584 ?auto_48585 ) ) ( not ( = ?auto_48584 ?auto_48586 ) ) ( not ( = ?auto_48584 ?auto_48587 ) ) ( not ( = ?auto_48585 ?auto_48586 ) ) ( not ( = ?auto_48585 ?auto_48587 ) ) ( not ( = ?auto_48586 ?auto_48587 ) ) ( ON ?auto_48585 ?auto_48586 ) ( ON ?auto_48584 ?auto_48585 ) ( ON ?auto_48583 ?auto_48584 ) ( CLEAR ?auto_48581 ) ( ON ?auto_48582 ?auto_48583 ) ( CLEAR ?auto_48582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48579 ?auto_48580 ?auto_48581 ?auto_48582 )
      ( MAKE-8PILE ?auto_48579 ?auto_48580 ?auto_48581 ?auto_48582 ?auto_48583 ?auto_48584 ?auto_48585 ?auto_48586 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48596 - BLOCK
      ?auto_48597 - BLOCK
      ?auto_48598 - BLOCK
      ?auto_48599 - BLOCK
      ?auto_48600 - BLOCK
      ?auto_48601 - BLOCK
      ?auto_48602 - BLOCK
      ?auto_48603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48603 ) ( ON-TABLE ?auto_48596 ) ( ON ?auto_48597 ?auto_48596 ) ( ON ?auto_48598 ?auto_48597 ) ( not ( = ?auto_48596 ?auto_48597 ) ) ( not ( = ?auto_48596 ?auto_48598 ) ) ( not ( = ?auto_48596 ?auto_48599 ) ) ( not ( = ?auto_48596 ?auto_48600 ) ) ( not ( = ?auto_48596 ?auto_48601 ) ) ( not ( = ?auto_48596 ?auto_48602 ) ) ( not ( = ?auto_48596 ?auto_48603 ) ) ( not ( = ?auto_48597 ?auto_48598 ) ) ( not ( = ?auto_48597 ?auto_48599 ) ) ( not ( = ?auto_48597 ?auto_48600 ) ) ( not ( = ?auto_48597 ?auto_48601 ) ) ( not ( = ?auto_48597 ?auto_48602 ) ) ( not ( = ?auto_48597 ?auto_48603 ) ) ( not ( = ?auto_48598 ?auto_48599 ) ) ( not ( = ?auto_48598 ?auto_48600 ) ) ( not ( = ?auto_48598 ?auto_48601 ) ) ( not ( = ?auto_48598 ?auto_48602 ) ) ( not ( = ?auto_48598 ?auto_48603 ) ) ( not ( = ?auto_48599 ?auto_48600 ) ) ( not ( = ?auto_48599 ?auto_48601 ) ) ( not ( = ?auto_48599 ?auto_48602 ) ) ( not ( = ?auto_48599 ?auto_48603 ) ) ( not ( = ?auto_48600 ?auto_48601 ) ) ( not ( = ?auto_48600 ?auto_48602 ) ) ( not ( = ?auto_48600 ?auto_48603 ) ) ( not ( = ?auto_48601 ?auto_48602 ) ) ( not ( = ?auto_48601 ?auto_48603 ) ) ( not ( = ?auto_48602 ?auto_48603 ) ) ( ON ?auto_48602 ?auto_48603 ) ( ON ?auto_48601 ?auto_48602 ) ( ON ?auto_48600 ?auto_48601 ) ( CLEAR ?auto_48598 ) ( ON ?auto_48599 ?auto_48600 ) ( CLEAR ?auto_48599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48596 ?auto_48597 ?auto_48598 ?auto_48599 )
      ( MAKE-8PILE ?auto_48596 ?auto_48597 ?auto_48598 ?auto_48599 ?auto_48600 ?auto_48601 ?auto_48602 ?auto_48603 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48612 - BLOCK
      ?auto_48613 - BLOCK
      ?auto_48614 - BLOCK
      ?auto_48615 - BLOCK
      ?auto_48616 - BLOCK
      ?auto_48617 - BLOCK
      ?auto_48618 - BLOCK
      ?auto_48619 - BLOCK
    )
    :vars
    (
      ?auto_48620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48619 ?auto_48620 ) ( ON-TABLE ?auto_48612 ) ( ON ?auto_48613 ?auto_48612 ) ( not ( = ?auto_48612 ?auto_48613 ) ) ( not ( = ?auto_48612 ?auto_48614 ) ) ( not ( = ?auto_48612 ?auto_48615 ) ) ( not ( = ?auto_48612 ?auto_48616 ) ) ( not ( = ?auto_48612 ?auto_48617 ) ) ( not ( = ?auto_48612 ?auto_48618 ) ) ( not ( = ?auto_48612 ?auto_48619 ) ) ( not ( = ?auto_48612 ?auto_48620 ) ) ( not ( = ?auto_48613 ?auto_48614 ) ) ( not ( = ?auto_48613 ?auto_48615 ) ) ( not ( = ?auto_48613 ?auto_48616 ) ) ( not ( = ?auto_48613 ?auto_48617 ) ) ( not ( = ?auto_48613 ?auto_48618 ) ) ( not ( = ?auto_48613 ?auto_48619 ) ) ( not ( = ?auto_48613 ?auto_48620 ) ) ( not ( = ?auto_48614 ?auto_48615 ) ) ( not ( = ?auto_48614 ?auto_48616 ) ) ( not ( = ?auto_48614 ?auto_48617 ) ) ( not ( = ?auto_48614 ?auto_48618 ) ) ( not ( = ?auto_48614 ?auto_48619 ) ) ( not ( = ?auto_48614 ?auto_48620 ) ) ( not ( = ?auto_48615 ?auto_48616 ) ) ( not ( = ?auto_48615 ?auto_48617 ) ) ( not ( = ?auto_48615 ?auto_48618 ) ) ( not ( = ?auto_48615 ?auto_48619 ) ) ( not ( = ?auto_48615 ?auto_48620 ) ) ( not ( = ?auto_48616 ?auto_48617 ) ) ( not ( = ?auto_48616 ?auto_48618 ) ) ( not ( = ?auto_48616 ?auto_48619 ) ) ( not ( = ?auto_48616 ?auto_48620 ) ) ( not ( = ?auto_48617 ?auto_48618 ) ) ( not ( = ?auto_48617 ?auto_48619 ) ) ( not ( = ?auto_48617 ?auto_48620 ) ) ( not ( = ?auto_48618 ?auto_48619 ) ) ( not ( = ?auto_48618 ?auto_48620 ) ) ( not ( = ?auto_48619 ?auto_48620 ) ) ( ON ?auto_48618 ?auto_48619 ) ( ON ?auto_48617 ?auto_48618 ) ( ON ?auto_48616 ?auto_48617 ) ( ON ?auto_48615 ?auto_48616 ) ( CLEAR ?auto_48613 ) ( ON ?auto_48614 ?auto_48615 ) ( CLEAR ?auto_48614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48612 ?auto_48613 ?auto_48614 )
      ( MAKE-8PILE ?auto_48612 ?auto_48613 ?auto_48614 ?auto_48615 ?auto_48616 ?auto_48617 ?auto_48618 ?auto_48619 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48629 - BLOCK
      ?auto_48630 - BLOCK
      ?auto_48631 - BLOCK
      ?auto_48632 - BLOCK
      ?auto_48633 - BLOCK
      ?auto_48634 - BLOCK
      ?auto_48635 - BLOCK
      ?auto_48636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48636 ) ( ON-TABLE ?auto_48629 ) ( ON ?auto_48630 ?auto_48629 ) ( not ( = ?auto_48629 ?auto_48630 ) ) ( not ( = ?auto_48629 ?auto_48631 ) ) ( not ( = ?auto_48629 ?auto_48632 ) ) ( not ( = ?auto_48629 ?auto_48633 ) ) ( not ( = ?auto_48629 ?auto_48634 ) ) ( not ( = ?auto_48629 ?auto_48635 ) ) ( not ( = ?auto_48629 ?auto_48636 ) ) ( not ( = ?auto_48630 ?auto_48631 ) ) ( not ( = ?auto_48630 ?auto_48632 ) ) ( not ( = ?auto_48630 ?auto_48633 ) ) ( not ( = ?auto_48630 ?auto_48634 ) ) ( not ( = ?auto_48630 ?auto_48635 ) ) ( not ( = ?auto_48630 ?auto_48636 ) ) ( not ( = ?auto_48631 ?auto_48632 ) ) ( not ( = ?auto_48631 ?auto_48633 ) ) ( not ( = ?auto_48631 ?auto_48634 ) ) ( not ( = ?auto_48631 ?auto_48635 ) ) ( not ( = ?auto_48631 ?auto_48636 ) ) ( not ( = ?auto_48632 ?auto_48633 ) ) ( not ( = ?auto_48632 ?auto_48634 ) ) ( not ( = ?auto_48632 ?auto_48635 ) ) ( not ( = ?auto_48632 ?auto_48636 ) ) ( not ( = ?auto_48633 ?auto_48634 ) ) ( not ( = ?auto_48633 ?auto_48635 ) ) ( not ( = ?auto_48633 ?auto_48636 ) ) ( not ( = ?auto_48634 ?auto_48635 ) ) ( not ( = ?auto_48634 ?auto_48636 ) ) ( not ( = ?auto_48635 ?auto_48636 ) ) ( ON ?auto_48635 ?auto_48636 ) ( ON ?auto_48634 ?auto_48635 ) ( ON ?auto_48633 ?auto_48634 ) ( ON ?auto_48632 ?auto_48633 ) ( CLEAR ?auto_48630 ) ( ON ?auto_48631 ?auto_48632 ) ( CLEAR ?auto_48631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48629 ?auto_48630 ?auto_48631 )
      ( MAKE-8PILE ?auto_48629 ?auto_48630 ?auto_48631 ?auto_48632 ?auto_48633 ?auto_48634 ?auto_48635 ?auto_48636 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48645 - BLOCK
      ?auto_48646 - BLOCK
      ?auto_48647 - BLOCK
      ?auto_48648 - BLOCK
      ?auto_48649 - BLOCK
      ?auto_48650 - BLOCK
      ?auto_48651 - BLOCK
      ?auto_48652 - BLOCK
    )
    :vars
    (
      ?auto_48653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48652 ?auto_48653 ) ( ON-TABLE ?auto_48645 ) ( not ( = ?auto_48645 ?auto_48646 ) ) ( not ( = ?auto_48645 ?auto_48647 ) ) ( not ( = ?auto_48645 ?auto_48648 ) ) ( not ( = ?auto_48645 ?auto_48649 ) ) ( not ( = ?auto_48645 ?auto_48650 ) ) ( not ( = ?auto_48645 ?auto_48651 ) ) ( not ( = ?auto_48645 ?auto_48652 ) ) ( not ( = ?auto_48645 ?auto_48653 ) ) ( not ( = ?auto_48646 ?auto_48647 ) ) ( not ( = ?auto_48646 ?auto_48648 ) ) ( not ( = ?auto_48646 ?auto_48649 ) ) ( not ( = ?auto_48646 ?auto_48650 ) ) ( not ( = ?auto_48646 ?auto_48651 ) ) ( not ( = ?auto_48646 ?auto_48652 ) ) ( not ( = ?auto_48646 ?auto_48653 ) ) ( not ( = ?auto_48647 ?auto_48648 ) ) ( not ( = ?auto_48647 ?auto_48649 ) ) ( not ( = ?auto_48647 ?auto_48650 ) ) ( not ( = ?auto_48647 ?auto_48651 ) ) ( not ( = ?auto_48647 ?auto_48652 ) ) ( not ( = ?auto_48647 ?auto_48653 ) ) ( not ( = ?auto_48648 ?auto_48649 ) ) ( not ( = ?auto_48648 ?auto_48650 ) ) ( not ( = ?auto_48648 ?auto_48651 ) ) ( not ( = ?auto_48648 ?auto_48652 ) ) ( not ( = ?auto_48648 ?auto_48653 ) ) ( not ( = ?auto_48649 ?auto_48650 ) ) ( not ( = ?auto_48649 ?auto_48651 ) ) ( not ( = ?auto_48649 ?auto_48652 ) ) ( not ( = ?auto_48649 ?auto_48653 ) ) ( not ( = ?auto_48650 ?auto_48651 ) ) ( not ( = ?auto_48650 ?auto_48652 ) ) ( not ( = ?auto_48650 ?auto_48653 ) ) ( not ( = ?auto_48651 ?auto_48652 ) ) ( not ( = ?auto_48651 ?auto_48653 ) ) ( not ( = ?auto_48652 ?auto_48653 ) ) ( ON ?auto_48651 ?auto_48652 ) ( ON ?auto_48650 ?auto_48651 ) ( ON ?auto_48649 ?auto_48650 ) ( ON ?auto_48648 ?auto_48649 ) ( ON ?auto_48647 ?auto_48648 ) ( CLEAR ?auto_48645 ) ( ON ?auto_48646 ?auto_48647 ) ( CLEAR ?auto_48646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48645 ?auto_48646 )
      ( MAKE-8PILE ?auto_48645 ?auto_48646 ?auto_48647 ?auto_48648 ?auto_48649 ?auto_48650 ?auto_48651 ?auto_48652 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48662 - BLOCK
      ?auto_48663 - BLOCK
      ?auto_48664 - BLOCK
      ?auto_48665 - BLOCK
      ?auto_48666 - BLOCK
      ?auto_48667 - BLOCK
      ?auto_48668 - BLOCK
      ?auto_48669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48669 ) ( ON-TABLE ?auto_48662 ) ( not ( = ?auto_48662 ?auto_48663 ) ) ( not ( = ?auto_48662 ?auto_48664 ) ) ( not ( = ?auto_48662 ?auto_48665 ) ) ( not ( = ?auto_48662 ?auto_48666 ) ) ( not ( = ?auto_48662 ?auto_48667 ) ) ( not ( = ?auto_48662 ?auto_48668 ) ) ( not ( = ?auto_48662 ?auto_48669 ) ) ( not ( = ?auto_48663 ?auto_48664 ) ) ( not ( = ?auto_48663 ?auto_48665 ) ) ( not ( = ?auto_48663 ?auto_48666 ) ) ( not ( = ?auto_48663 ?auto_48667 ) ) ( not ( = ?auto_48663 ?auto_48668 ) ) ( not ( = ?auto_48663 ?auto_48669 ) ) ( not ( = ?auto_48664 ?auto_48665 ) ) ( not ( = ?auto_48664 ?auto_48666 ) ) ( not ( = ?auto_48664 ?auto_48667 ) ) ( not ( = ?auto_48664 ?auto_48668 ) ) ( not ( = ?auto_48664 ?auto_48669 ) ) ( not ( = ?auto_48665 ?auto_48666 ) ) ( not ( = ?auto_48665 ?auto_48667 ) ) ( not ( = ?auto_48665 ?auto_48668 ) ) ( not ( = ?auto_48665 ?auto_48669 ) ) ( not ( = ?auto_48666 ?auto_48667 ) ) ( not ( = ?auto_48666 ?auto_48668 ) ) ( not ( = ?auto_48666 ?auto_48669 ) ) ( not ( = ?auto_48667 ?auto_48668 ) ) ( not ( = ?auto_48667 ?auto_48669 ) ) ( not ( = ?auto_48668 ?auto_48669 ) ) ( ON ?auto_48668 ?auto_48669 ) ( ON ?auto_48667 ?auto_48668 ) ( ON ?auto_48666 ?auto_48667 ) ( ON ?auto_48665 ?auto_48666 ) ( ON ?auto_48664 ?auto_48665 ) ( CLEAR ?auto_48662 ) ( ON ?auto_48663 ?auto_48664 ) ( CLEAR ?auto_48663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48662 ?auto_48663 )
      ( MAKE-8PILE ?auto_48662 ?auto_48663 ?auto_48664 ?auto_48665 ?auto_48666 ?auto_48667 ?auto_48668 ?auto_48669 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48678 - BLOCK
      ?auto_48679 - BLOCK
      ?auto_48680 - BLOCK
      ?auto_48681 - BLOCK
      ?auto_48682 - BLOCK
      ?auto_48683 - BLOCK
      ?auto_48684 - BLOCK
      ?auto_48685 - BLOCK
    )
    :vars
    (
      ?auto_48686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48685 ?auto_48686 ) ( not ( = ?auto_48678 ?auto_48679 ) ) ( not ( = ?auto_48678 ?auto_48680 ) ) ( not ( = ?auto_48678 ?auto_48681 ) ) ( not ( = ?auto_48678 ?auto_48682 ) ) ( not ( = ?auto_48678 ?auto_48683 ) ) ( not ( = ?auto_48678 ?auto_48684 ) ) ( not ( = ?auto_48678 ?auto_48685 ) ) ( not ( = ?auto_48678 ?auto_48686 ) ) ( not ( = ?auto_48679 ?auto_48680 ) ) ( not ( = ?auto_48679 ?auto_48681 ) ) ( not ( = ?auto_48679 ?auto_48682 ) ) ( not ( = ?auto_48679 ?auto_48683 ) ) ( not ( = ?auto_48679 ?auto_48684 ) ) ( not ( = ?auto_48679 ?auto_48685 ) ) ( not ( = ?auto_48679 ?auto_48686 ) ) ( not ( = ?auto_48680 ?auto_48681 ) ) ( not ( = ?auto_48680 ?auto_48682 ) ) ( not ( = ?auto_48680 ?auto_48683 ) ) ( not ( = ?auto_48680 ?auto_48684 ) ) ( not ( = ?auto_48680 ?auto_48685 ) ) ( not ( = ?auto_48680 ?auto_48686 ) ) ( not ( = ?auto_48681 ?auto_48682 ) ) ( not ( = ?auto_48681 ?auto_48683 ) ) ( not ( = ?auto_48681 ?auto_48684 ) ) ( not ( = ?auto_48681 ?auto_48685 ) ) ( not ( = ?auto_48681 ?auto_48686 ) ) ( not ( = ?auto_48682 ?auto_48683 ) ) ( not ( = ?auto_48682 ?auto_48684 ) ) ( not ( = ?auto_48682 ?auto_48685 ) ) ( not ( = ?auto_48682 ?auto_48686 ) ) ( not ( = ?auto_48683 ?auto_48684 ) ) ( not ( = ?auto_48683 ?auto_48685 ) ) ( not ( = ?auto_48683 ?auto_48686 ) ) ( not ( = ?auto_48684 ?auto_48685 ) ) ( not ( = ?auto_48684 ?auto_48686 ) ) ( not ( = ?auto_48685 ?auto_48686 ) ) ( ON ?auto_48684 ?auto_48685 ) ( ON ?auto_48683 ?auto_48684 ) ( ON ?auto_48682 ?auto_48683 ) ( ON ?auto_48681 ?auto_48682 ) ( ON ?auto_48680 ?auto_48681 ) ( ON ?auto_48679 ?auto_48680 ) ( ON ?auto_48678 ?auto_48679 ) ( CLEAR ?auto_48678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48678 )
      ( MAKE-8PILE ?auto_48678 ?auto_48679 ?auto_48680 ?auto_48681 ?auto_48682 ?auto_48683 ?auto_48684 ?auto_48685 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48695 - BLOCK
      ?auto_48696 - BLOCK
      ?auto_48697 - BLOCK
      ?auto_48698 - BLOCK
      ?auto_48699 - BLOCK
      ?auto_48700 - BLOCK
      ?auto_48701 - BLOCK
      ?auto_48702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48702 ) ( not ( = ?auto_48695 ?auto_48696 ) ) ( not ( = ?auto_48695 ?auto_48697 ) ) ( not ( = ?auto_48695 ?auto_48698 ) ) ( not ( = ?auto_48695 ?auto_48699 ) ) ( not ( = ?auto_48695 ?auto_48700 ) ) ( not ( = ?auto_48695 ?auto_48701 ) ) ( not ( = ?auto_48695 ?auto_48702 ) ) ( not ( = ?auto_48696 ?auto_48697 ) ) ( not ( = ?auto_48696 ?auto_48698 ) ) ( not ( = ?auto_48696 ?auto_48699 ) ) ( not ( = ?auto_48696 ?auto_48700 ) ) ( not ( = ?auto_48696 ?auto_48701 ) ) ( not ( = ?auto_48696 ?auto_48702 ) ) ( not ( = ?auto_48697 ?auto_48698 ) ) ( not ( = ?auto_48697 ?auto_48699 ) ) ( not ( = ?auto_48697 ?auto_48700 ) ) ( not ( = ?auto_48697 ?auto_48701 ) ) ( not ( = ?auto_48697 ?auto_48702 ) ) ( not ( = ?auto_48698 ?auto_48699 ) ) ( not ( = ?auto_48698 ?auto_48700 ) ) ( not ( = ?auto_48698 ?auto_48701 ) ) ( not ( = ?auto_48698 ?auto_48702 ) ) ( not ( = ?auto_48699 ?auto_48700 ) ) ( not ( = ?auto_48699 ?auto_48701 ) ) ( not ( = ?auto_48699 ?auto_48702 ) ) ( not ( = ?auto_48700 ?auto_48701 ) ) ( not ( = ?auto_48700 ?auto_48702 ) ) ( not ( = ?auto_48701 ?auto_48702 ) ) ( ON ?auto_48701 ?auto_48702 ) ( ON ?auto_48700 ?auto_48701 ) ( ON ?auto_48699 ?auto_48700 ) ( ON ?auto_48698 ?auto_48699 ) ( ON ?auto_48697 ?auto_48698 ) ( ON ?auto_48696 ?auto_48697 ) ( ON ?auto_48695 ?auto_48696 ) ( CLEAR ?auto_48695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48695 )
      ( MAKE-8PILE ?auto_48695 ?auto_48696 ?auto_48697 ?auto_48698 ?auto_48699 ?auto_48700 ?auto_48701 ?auto_48702 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_48711 - BLOCK
      ?auto_48712 - BLOCK
      ?auto_48713 - BLOCK
      ?auto_48714 - BLOCK
      ?auto_48715 - BLOCK
      ?auto_48716 - BLOCK
      ?auto_48717 - BLOCK
      ?auto_48718 - BLOCK
    )
    :vars
    (
      ?auto_48719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48711 ?auto_48712 ) ) ( not ( = ?auto_48711 ?auto_48713 ) ) ( not ( = ?auto_48711 ?auto_48714 ) ) ( not ( = ?auto_48711 ?auto_48715 ) ) ( not ( = ?auto_48711 ?auto_48716 ) ) ( not ( = ?auto_48711 ?auto_48717 ) ) ( not ( = ?auto_48711 ?auto_48718 ) ) ( not ( = ?auto_48712 ?auto_48713 ) ) ( not ( = ?auto_48712 ?auto_48714 ) ) ( not ( = ?auto_48712 ?auto_48715 ) ) ( not ( = ?auto_48712 ?auto_48716 ) ) ( not ( = ?auto_48712 ?auto_48717 ) ) ( not ( = ?auto_48712 ?auto_48718 ) ) ( not ( = ?auto_48713 ?auto_48714 ) ) ( not ( = ?auto_48713 ?auto_48715 ) ) ( not ( = ?auto_48713 ?auto_48716 ) ) ( not ( = ?auto_48713 ?auto_48717 ) ) ( not ( = ?auto_48713 ?auto_48718 ) ) ( not ( = ?auto_48714 ?auto_48715 ) ) ( not ( = ?auto_48714 ?auto_48716 ) ) ( not ( = ?auto_48714 ?auto_48717 ) ) ( not ( = ?auto_48714 ?auto_48718 ) ) ( not ( = ?auto_48715 ?auto_48716 ) ) ( not ( = ?auto_48715 ?auto_48717 ) ) ( not ( = ?auto_48715 ?auto_48718 ) ) ( not ( = ?auto_48716 ?auto_48717 ) ) ( not ( = ?auto_48716 ?auto_48718 ) ) ( not ( = ?auto_48717 ?auto_48718 ) ) ( ON ?auto_48711 ?auto_48719 ) ( not ( = ?auto_48718 ?auto_48719 ) ) ( not ( = ?auto_48717 ?auto_48719 ) ) ( not ( = ?auto_48716 ?auto_48719 ) ) ( not ( = ?auto_48715 ?auto_48719 ) ) ( not ( = ?auto_48714 ?auto_48719 ) ) ( not ( = ?auto_48713 ?auto_48719 ) ) ( not ( = ?auto_48712 ?auto_48719 ) ) ( not ( = ?auto_48711 ?auto_48719 ) ) ( ON ?auto_48712 ?auto_48711 ) ( ON ?auto_48713 ?auto_48712 ) ( ON ?auto_48714 ?auto_48713 ) ( ON ?auto_48715 ?auto_48714 ) ( ON ?auto_48716 ?auto_48715 ) ( ON ?auto_48717 ?auto_48716 ) ( ON ?auto_48718 ?auto_48717 ) ( CLEAR ?auto_48718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_48718 ?auto_48717 ?auto_48716 ?auto_48715 ?auto_48714 ?auto_48713 ?auto_48712 ?auto_48711 )
      ( MAKE-8PILE ?auto_48711 ?auto_48712 ?auto_48713 ?auto_48714 ?auto_48715 ?auto_48716 ?auto_48717 ?auto_48718 ) )
  )

)

