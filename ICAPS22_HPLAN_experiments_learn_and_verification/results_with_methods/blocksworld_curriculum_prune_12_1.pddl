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
      ?auto_152870 - BLOCK
    )
    :vars
    (
      ?auto_152871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152870 ?auto_152871 ) ( CLEAR ?auto_152870 ) ( HAND-EMPTY ) ( not ( = ?auto_152870 ?auto_152871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152870 ?auto_152871 )
      ( !PUTDOWN ?auto_152870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152877 - BLOCK
      ?auto_152878 - BLOCK
    )
    :vars
    (
      ?auto_152879 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_152877 ) ( ON ?auto_152878 ?auto_152879 ) ( CLEAR ?auto_152878 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152877 ) ( not ( = ?auto_152877 ?auto_152878 ) ) ( not ( = ?auto_152877 ?auto_152879 ) ) ( not ( = ?auto_152878 ?auto_152879 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152878 ?auto_152879 )
      ( !STACK ?auto_152878 ?auto_152877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152887 - BLOCK
      ?auto_152888 - BLOCK
    )
    :vars
    (
      ?auto_152889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152888 ?auto_152889 ) ( not ( = ?auto_152887 ?auto_152888 ) ) ( not ( = ?auto_152887 ?auto_152889 ) ) ( not ( = ?auto_152888 ?auto_152889 ) ) ( ON ?auto_152887 ?auto_152888 ) ( CLEAR ?auto_152887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152887 )
      ( MAKE-2PILE ?auto_152887 ?auto_152888 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152898 - BLOCK
      ?auto_152899 - BLOCK
      ?auto_152900 - BLOCK
    )
    :vars
    (
      ?auto_152901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_152899 ) ( ON ?auto_152900 ?auto_152901 ) ( CLEAR ?auto_152900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152898 ) ( ON ?auto_152899 ?auto_152898 ) ( not ( = ?auto_152898 ?auto_152899 ) ) ( not ( = ?auto_152898 ?auto_152900 ) ) ( not ( = ?auto_152898 ?auto_152901 ) ) ( not ( = ?auto_152899 ?auto_152900 ) ) ( not ( = ?auto_152899 ?auto_152901 ) ) ( not ( = ?auto_152900 ?auto_152901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152900 ?auto_152901 )
      ( !STACK ?auto_152900 ?auto_152899 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152912 - BLOCK
      ?auto_152913 - BLOCK
      ?auto_152914 - BLOCK
    )
    :vars
    (
      ?auto_152915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152914 ?auto_152915 ) ( ON-TABLE ?auto_152912 ) ( not ( = ?auto_152912 ?auto_152913 ) ) ( not ( = ?auto_152912 ?auto_152914 ) ) ( not ( = ?auto_152912 ?auto_152915 ) ) ( not ( = ?auto_152913 ?auto_152914 ) ) ( not ( = ?auto_152913 ?auto_152915 ) ) ( not ( = ?auto_152914 ?auto_152915 ) ) ( CLEAR ?auto_152912 ) ( ON ?auto_152913 ?auto_152914 ) ( CLEAR ?auto_152913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152912 ?auto_152913 )
      ( MAKE-3PILE ?auto_152912 ?auto_152913 ?auto_152914 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152926 - BLOCK
      ?auto_152927 - BLOCK
      ?auto_152928 - BLOCK
    )
    :vars
    (
      ?auto_152929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152928 ?auto_152929 ) ( not ( = ?auto_152926 ?auto_152927 ) ) ( not ( = ?auto_152926 ?auto_152928 ) ) ( not ( = ?auto_152926 ?auto_152929 ) ) ( not ( = ?auto_152927 ?auto_152928 ) ) ( not ( = ?auto_152927 ?auto_152929 ) ) ( not ( = ?auto_152928 ?auto_152929 ) ) ( ON ?auto_152927 ?auto_152928 ) ( ON ?auto_152926 ?auto_152927 ) ( CLEAR ?auto_152926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152926 )
      ( MAKE-3PILE ?auto_152926 ?auto_152927 ?auto_152928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152941 - BLOCK
      ?auto_152942 - BLOCK
      ?auto_152943 - BLOCK
      ?auto_152944 - BLOCK
    )
    :vars
    (
      ?auto_152945 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_152943 ) ( ON ?auto_152944 ?auto_152945 ) ( CLEAR ?auto_152944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152941 ) ( ON ?auto_152942 ?auto_152941 ) ( ON ?auto_152943 ?auto_152942 ) ( not ( = ?auto_152941 ?auto_152942 ) ) ( not ( = ?auto_152941 ?auto_152943 ) ) ( not ( = ?auto_152941 ?auto_152944 ) ) ( not ( = ?auto_152941 ?auto_152945 ) ) ( not ( = ?auto_152942 ?auto_152943 ) ) ( not ( = ?auto_152942 ?auto_152944 ) ) ( not ( = ?auto_152942 ?auto_152945 ) ) ( not ( = ?auto_152943 ?auto_152944 ) ) ( not ( = ?auto_152943 ?auto_152945 ) ) ( not ( = ?auto_152944 ?auto_152945 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152944 ?auto_152945 )
      ( !STACK ?auto_152944 ?auto_152943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152959 - BLOCK
      ?auto_152960 - BLOCK
      ?auto_152961 - BLOCK
      ?auto_152962 - BLOCK
    )
    :vars
    (
      ?auto_152963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152962 ?auto_152963 ) ( ON-TABLE ?auto_152959 ) ( ON ?auto_152960 ?auto_152959 ) ( not ( = ?auto_152959 ?auto_152960 ) ) ( not ( = ?auto_152959 ?auto_152961 ) ) ( not ( = ?auto_152959 ?auto_152962 ) ) ( not ( = ?auto_152959 ?auto_152963 ) ) ( not ( = ?auto_152960 ?auto_152961 ) ) ( not ( = ?auto_152960 ?auto_152962 ) ) ( not ( = ?auto_152960 ?auto_152963 ) ) ( not ( = ?auto_152961 ?auto_152962 ) ) ( not ( = ?auto_152961 ?auto_152963 ) ) ( not ( = ?auto_152962 ?auto_152963 ) ) ( CLEAR ?auto_152960 ) ( ON ?auto_152961 ?auto_152962 ) ( CLEAR ?auto_152961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152959 ?auto_152960 ?auto_152961 )
      ( MAKE-4PILE ?auto_152959 ?auto_152960 ?auto_152961 ?auto_152962 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152977 - BLOCK
      ?auto_152978 - BLOCK
      ?auto_152979 - BLOCK
      ?auto_152980 - BLOCK
    )
    :vars
    (
      ?auto_152981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152980 ?auto_152981 ) ( ON-TABLE ?auto_152977 ) ( not ( = ?auto_152977 ?auto_152978 ) ) ( not ( = ?auto_152977 ?auto_152979 ) ) ( not ( = ?auto_152977 ?auto_152980 ) ) ( not ( = ?auto_152977 ?auto_152981 ) ) ( not ( = ?auto_152978 ?auto_152979 ) ) ( not ( = ?auto_152978 ?auto_152980 ) ) ( not ( = ?auto_152978 ?auto_152981 ) ) ( not ( = ?auto_152979 ?auto_152980 ) ) ( not ( = ?auto_152979 ?auto_152981 ) ) ( not ( = ?auto_152980 ?auto_152981 ) ) ( ON ?auto_152979 ?auto_152980 ) ( CLEAR ?auto_152977 ) ( ON ?auto_152978 ?auto_152979 ) ( CLEAR ?auto_152978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152977 ?auto_152978 )
      ( MAKE-4PILE ?auto_152977 ?auto_152978 ?auto_152979 ?auto_152980 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152995 - BLOCK
      ?auto_152996 - BLOCK
      ?auto_152997 - BLOCK
      ?auto_152998 - BLOCK
    )
    :vars
    (
      ?auto_152999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152998 ?auto_152999 ) ( not ( = ?auto_152995 ?auto_152996 ) ) ( not ( = ?auto_152995 ?auto_152997 ) ) ( not ( = ?auto_152995 ?auto_152998 ) ) ( not ( = ?auto_152995 ?auto_152999 ) ) ( not ( = ?auto_152996 ?auto_152997 ) ) ( not ( = ?auto_152996 ?auto_152998 ) ) ( not ( = ?auto_152996 ?auto_152999 ) ) ( not ( = ?auto_152997 ?auto_152998 ) ) ( not ( = ?auto_152997 ?auto_152999 ) ) ( not ( = ?auto_152998 ?auto_152999 ) ) ( ON ?auto_152997 ?auto_152998 ) ( ON ?auto_152996 ?auto_152997 ) ( ON ?auto_152995 ?auto_152996 ) ( CLEAR ?auto_152995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152995 )
      ( MAKE-4PILE ?auto_152995 ?auto_152996 ?auto_152997 ?auto_152998 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153014 - BLOCK
      ?auto_153015 - BLOCK
      ?auto_153016 - BLOCK
      ?auto_153017 - BLOCK
      ?auto_153018 - BLOCK
    )
    :vars
    (
      ?auto_153019 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_153017 ) ( ON ?auto_153018 ?auto_153019 ) ( CLEAR ?auto_153018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153014 ) ( ON ?auto_153015 ?auto_153014 ) ( ON ?auto_153016 ?auto_153015 ) ( ON ?auto_153017 ?auto_153016 ) ( not ( = ?auto_153014 ?auto_153015 ) ) ( not ( = ?auto_153014 ?auto_153016 ) ) ( not ( = ?auto_153014 ?auto_153017 ) ) ( not ( = ?auto_153014 ?auto_153018 ) ) ( not ( = ?auto_153014 ?auto_153019 ) ) ( not ( = ?auto_153015 ?auto_153016 ) ) ( not ( = ?auto_153015 ?auto_153017 ) ) ( not ( = ?auto_153015 ?auto_153018 ) ) ( not ( = ?auto_153015 ?auto_153019 ) ) ( not ( = ?auto_153016 ?auto_153017 ) ) ( not ( = ?auto_153016 ?auto_153018 ) ) ( not ( = ?auto_153016 ?auto_153019 ) ) ( not ( = ?auto_153017 ?auto_153018 ) ) ( not ( = ?auto_153017 ?auto_153019 ) ) ( not ( = ?auto_153018 ?auto_153019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153018 ?auto_153019 )
      ( !STACK ?auto_153018 ?auto_153017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153036 - BLOCK
      ?auto_153037 - BLOCK
      ?auto_153038 - BLOCK
      ?auto_153039 - BLOCK
      ?auto_153040 - BLOCK
    )
    :vars
    (
      ?auto_153041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153040 ?auto_153041 ) ( ON-TABLE ?auto_153036 ) ( ON ?auto_153037 ?auto_153036 ) ( ON ?auto_153038 ?auto_153037 ) ( not ( = ?auto_153036 ?auto_153037 ) ) ( not ( = ?auto_153036 ?auto_153038 ) ) ( not ( = ?auto_153036 ?auto_153039 ) ) ( not ( = ?auto_153036 ?auto_153040 ) ) ( not ( = ?auto_153036 ?auto_153041 ) ) ( not ( = ?auto_153037 ?auto_153038 ) ) ( not ( = ?auto_153037 ?auto_153039 ) ) ( not ( = ?auto_153037 ?auto_153040 ) ) ( not ( = ?auto_153037 ?auto_153041 ) ) ( not ( = ?auto_153038 ?auto_153039 ) ) ( not ( = ?auto_153038 ?auto_153040 ) ) ( not ( = ?auto_153038 ?auto_153041 ) ) ( not ( = ?auto_153039 ?auto_153040 ) ) ( not ( = ?auto_153039 ?auto_153041 ) ) ( not ( = ?auto_153040 ?auto_153041 ) ) ( CLEAR ?auto_153038 ) ( ON ?auto_153039 ?auto_153040 ) ( CLEAR ?auto_153039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153036 ?auto_153037 ?auto_153038 ?auto_153039 )
      ( MAKE-5PILE ?auto_153036 ?auto_153037 ?auto_153038 ?auto_153039 ?auto_153040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153058 - BLOCK
      ?auto_153059 - BLOCK
      ?auto_153060 - BLOCK
      ?auto_153061 - BLOCK
      ?auto_153062 - BLOCK
    )
    :vars
    (
      ?auto_153063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153062 ?auto_153063 ) ( ON-TABLE ?auto_153058 ) ( ON ?auto_153059 ?auto_153058 ) ( not ( = ?auto_153058 ?auto_153059 ) ) ( not ( = ?auto_153058 ?auto_153060 ) ) ( not ( = ?auto_153058 ?auto_153061 ) ) ( not ( = ?auto_153058 ?auto_153062 ) ) ( not ( = ?auto_153058 ?auto_153063 ) ) ( not ( = ?auto_153059 ?auto_153060 ) ) ( not ( = ?auto_153059 ?auto_153061 ) ) ( not ( = ?auto_153059 ?auto_153062 ) ) ( not ( = ?auto_153059 ?auto_153063 ) ) ( not ( = ?auto_153060 ?auto_153061 ) ) ( not ( = ?auto_153060 ?auto_153062 ) ) ( not ( = ?auto_153060 ?auto_153063 ) ) ( not ( = ?auto_153061 ?auto_153062 ) ) ( not ( = ?auto_153061 ?auto_153063 ) ) ( not ( = ?auto_153062 ?auto_153063 ) ) ( ON ?auto_153061 ?auto_153062 ) ( CLEAR ?auto_153059 ) ( ON ?auto_153060 ?auto_153061 ) ( CLEAR ?auto_153060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153058 ?auto_153059 ?auto_153060 )
      ( MAKE-5PILE ?auto_153058 ?auto_153059 ?auto_153060 ?auto_153061 ?auto_153062 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153080 - BLOCK
      ?auto_153081 - BLOCK
      ?auto_153082 - BLOCK
      ?auto_153083 - BLOCK
      ?auto_153084 - BLOCK
    )
    :vars
    (
      ?auto_153085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153084 ?auto_153085 ) ( ON-TABLE ?auto_153080 ) ( not ( = ?auto_153080 ?auto_153081 ) ) ( not ( = ?auto_153080 ?auto_153082 ) ) ( not ( = ?auto_153080 ?auto_153083 ) ) ( not ( = ?auto_153080 ?auto_153084 ) ) ( not ( = ?auto_153080 ?auto_153085 ) ) ( not ( = ?auto_153081 ?auto_153082 ) ) ( not ( = ?auto_153081 ?auto_153083 ) ) ( not ( = ?auto_153081 ?auto_153084 ) ) ( not ( = ?auto_153081 ?auto_153085 ) ) ( not ( = ?auto_153082 ?auto_153083 ) ) ( not ( = ?auto_153082 ?auto_153084 ) ) ( not ( = ?auto_153082 ?auto_153085 ) ) ( not ( = ?auto_153083 ?auto_153084 ) ) ( not ( = ?auto_153083 ?auto_153085 ) ) ( not ( = ?auto_153084 ?auto_153085 ) ) ( ON ?auto_153083 ?auto_153084 ) ( ON ?auto_153082 ?auto_153083 ) ( CLEAR ?auto_153080 ) ( ON ?auto_153081 ?auto_153082 ) ( CLEAR ?auto_153081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153080 ?auto_153081 )
      ( MAKE-5PILE ?auto_153080 ?auto_153081 ?auto_153082 ?auto_153083 ?auto_153084 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153102 - BLOCK
      ?auto_153103 - BLOCK
      ?auto_153104 - BLOCK
      ?auto_153105 - BLOCK
      ?auto_153106 - BLOCK
    )
    :vars
    (
      ?auto_153107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153106 ?auto_153107 ) ( not ( = ?auto_153102 ?auto_153103 ) ) ( not ( = ?auto_153102 ?auto_153104 ) ) ( not ( = ?auto_153102 ?auto_153105 ) ) ( not ( = ?auto_153102 ?auto_153106 ) ) ( not ( = ?auto_153102 ?auto_153107 ) ) ( not ( = ?auto_153103 ?auto_153104 ) ) ( not ( = ?auto_153103 ?auto_153105 ) ) ( not ( = ?auto_153103 ?auto_153106 ) ) ( not ( = ?auto_153103 ?auto_153107 ) ) ( not ( = ?auto_153104 ?auto_153105 ) ) ( not ( = ?auto_153104 ?auto_153106 ) ) ( not ( = ?auto_153104 ?auto_153107 ) ) ( not ( = ?auto_153105 ?auto_153106 ) ) ( not ( = ?auto_153105 ?auto_153107 ) ) ( not ( = ?auto_153106 ?auto_153107 ) ) ( ON ?auto_153105 ?auto_153106 ) ( ON ?auto_153104 ?auto_153105 ) ( ON ?auto_153103 ?auto_153104 ) ( ON ?auto_153102 ?auto_153103 ) ( CLEAR ?auto_153102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153102 )
      ( MAKE-5PILE ?auto_153102 ?auto_153103 ?auto_153104 ?auto_153105 ?auto_153106 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153125 - BLOCK
      ?auto_153126 - BLOCK
      ?auto_153127 - BLOCK
      ?auto_153128 - BLOCK
      ?auto_153129 - BLOCK
      ?auto_153130 - BLOCK
    )
    :vars
    (
      ?auto_153131 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_153129 ) ( ON ?auto_153130 ?auto_153131 ) ( CLEAR ?auto_153130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153125 ) ( ON ?auto_153126 ?auto_153125 ) ( ON ?auto_153127 ?auto_153126 ) ( ON ?auto_153128 ?auto_153127 ) ( ON ?auto_153129 ?auto_153128 ) ( not ( = ?auto_153125 ?auto_153126 ) ) ( not ( = ?auto_153125 ?auto_153127 ) ) ( not ( = ?auto_153125 ?auto_153128 ) ) ( not ( = ?auto_153125 ?auto_153129 ) ) ( not ( = ?auto_153125 ?auto_153130 ) ) ( not ( = ?auto_153125 ?auto_153131 ) ) ( not ( = ?auto_153126 ?auto_153127 ) ) ( not ( = ?auto_153126 ?auto_153128 ) ) ( not ( = ?auto_153126 ?auto_153129 ) ) ( not ( = ?auto_153126 ?auto_153130 ) ) ( not ( = ?auto_153126 ?auto_153131 ) ) ( not ( = ?auto_153127 ?auto_153128 ) ) ( not ( = ?auto_153127 ?auto_153129 ) ) ( not ( = ?auto_153127 ?auto_153130 ) ) ( not ( = ?auto_153127 ?auto_153131 ) ) ( not ( = ?auto_153128 ?auto_153129 ) ) ( not ( = ?auto_153128 ?auto_153130 ) ) ( not ( = ?auto_153128 ?auto_153131 ) ) ( not ( = ?auto_153129 ?auto_153130 ) ) ( not ( = ?auto_153129 ?auto_153131 ) ) ( not ( = ?auto_153130 ?auto_153131 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153130 ?auto_153131 )
      ( !STACK ?auto_153130 ?auto_153129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153151 - BLOCK
      ?auto_153152 - BLOCK
      ?auto_153153 - BLOCK
      ?auto_153154 - BLOCK
      ?auto_153155 - BLOCK
      ?auto_153156 - BLOCK
    )
    :vars
    (
      ?auto_153157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153156 ?auto_153157 ) ( ON-TABLE ?auto_153151 ) ( ON ?auto_153152 ?auto_153151 ) ( ON ?auto_153153 ?auto_153152 ) ( ON ?auto_153154 ?auto_153153 ) ( not ( = ?auto_153151 ?auto_153152 ) ) ( not ( = ?auto_153151 ?auto_153153 ) ) ( not ( = ?auto_153151 ?auto_153154 ) ) ( not ( = ?auto_153151 ?auto_153155 ) ) ( not ( = ?auto_153151 ?auto_153156 ) ) ( not ( = ?auto_153151 ?auto_153157 ) ) ( not ( = ?auto_153152 ?auto_153153 ) ) ( not ( = ?auto_153152 ?auto_153154 ) ) ( not ( = ?auto_153152 ?auto_153155 ) ) ( not ( = ?auto_153152 ?auto_153156 ) ) ( not ( = ?auto_153152 ?auto_153157 ) ) ( not ( = ?auto_153153 ?auto_153154 ) ) ( not ( = ?auto_153153 ?auto_153155 ) ) ( not ( = ?auto_153153 ?auto_153156 ) ) ( not ( = ?auto_153153 ?auto_153157 ) ) ( not ( = ?auto_153154 ?auto_153155 ) ) ( not ( = ?auto_153154 ?auto_153156 ) ) ( not ( = ?auto_153154 ?auto_153157 ) ) ( not ( = ?auto_153155 ?auto_153156 ) ) ( not ( = ?auto_153155 ?auto_153157 ) ) ( not ( = ?auto_153156 ?auto_153157 ) ) ( CLEAR ?auto_153154 ) ( ON ?auto_153155 ?auto_153156 ) ( CLEAR ?auto_153155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153151 ?auto_153152 ?auto_153153 ?auto_153154 ?auto_153155 )
      ( MAKE-6PILE ?auto_153151 ?auto_153152 ?auto_153153 ?auto_153154 ?auto_153155 ?auto_153156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153177 - BLOCK
      ?auto_153178 - BLOCK
      ?auto_153179 - BLOCK
      ?auto_153180 - BLOCK
      ?auto_153181 - BLOCK
      ?auto_153182 - BLOCK
    )
    :vars
    (
      ?auto_153183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153182 ?auto_153183 ) ( ON-TABLE ?auto_153177 ) ( ON ?auto_153178 ?auto_153177 ) ( ON ?auto_153179 ?auto_153178 ) ( not ( = ?auto_153177 ?auto_153178 ) ) ( not ( = ?auto_153177 ?auto_153179 ) ) ( not ( = ?auto_153177 ?auto_153180 ) ) ( not ( = ?auto_153177 ?auto_153181 ) ) ( not ( = ?auto_153177 ?auto_153182 ) ) ( not ( = ?auto_153177 ?auto_153183 ) ) ( not ( = ?auto_153178 ?auto_153179 ) ) ( not ( = ?auto_153178 ?auto_153180 ) ) ( not ( = ?auto_153178 ?auto_153181 ) ) ( not ( = ?auto_153178 ?auto_153182 ) ) ( not ( = ?auto_153178 ?auto_153183 ) ) ( not ( = ?auto_153179 ?auto_153180 ) ) ( not ( = ?auto_153179 ?auto_153181 ) ) ( not ( = ?auto_153179 ?auto_153182 ) ) ( not ( = ?auto_153179 ?auto_153183 ) ) ( not ( = ?auto_153180 ?auto_153181 ) ) ( not ( = ?auto_153180 ?auto_153182 ) ) ( not ( = ?auto_153180 ?auto_153183 ) ) ( not ( = ?auto_153181 ?auto_153182 ) ) ( not ( = ?auto_153181 ?auto_153183 ) ) ( not ( = ?auto_153182 ?auto_153183 ) ) ( ON ?auto_153181 ?auto_153182 ) ( CLEAR ?auto_153179 ) ( ON ?auto_153180 ?auto_153181 ) ( CLEAR ?auto_153180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153177 ?auto_153178 ?auto_153179 ?auto_153180 )
      ( MAKE-6PILE ?auto_153177 ?auto_153178 ?auto_153179 ?auto_153180 ?auto_153181 ?auto_153182 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153203 - BLOCK
      ?auto_153204 - BLOCK
      ?auto_153205 - BLOCK
      ?auto_153206 - BLOCK
      ?auto_153207 - BLOCK
      ?auto_153208 - BLOCK
    )
    :vars
    (
      ?auto_153209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153208 ?auto_153209 ) ( ON-TABLE ?auto_153203 ) ( ON ?auto_153204 ?auto_153203 ) ( not ( = ?auto_153203 ?auto_153204 ) ) ( not ( = ?auto_153203 ?auto_153205 ) ) ( not ( = ?auto_153203 ?auto_153206 ) ) ( not ( = ?auto_153203 ?auto_153207 ) ) ( not ( = ?auto_153203 ?auto_153208 ) ) ( not ( = ?auto_153203 ?auto_153209 ) ) ( not ( = ?auto_153204 ?auto_153205 ) ) ( not ( = ?auto_153204 ?auto_153206 ) ) ( not ( = ?auto_153204 ?auto_153207 ) ) ( not ( = ?auto_153204 ?auto_153208 ) ) ( not ( = ?auto_153204 ?auto_153209 ) ) ( not ( = ?auto_153205 ?auto_153206 ) ) ( not ( = ?auto_153205 ?auto_153207 ) ) ( not ( = ?auto_153205 ?auto_153208 ) ) ( not ( = ?auto_153205 ?auto_153209 ) ) ( not ( = ?auto_153206 ?auto_153207 ) ) ( not ( = ?auto_153206 ?auto_153208 ) ) ( not ( = ?auto_153206 ?auto_153209 ) ) ( not ( = ?auto_153207 ?auto_153208 ) ) ( not ( = ?auto_153207 ?auto_153209 ) ) ( not ( = ?auto_153208 ?auto_153209 ) ) ( ON ?auto_153207 ?auto_153208 ) ( ON ?auto_153206 ?auto_153207 ) ( CLEAR ?auto_153204 ) ( ON ?auto_153205 ?auto_153206 ) ( CLEAR ?auto_153205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153203 ?auto_153204 ?auto_153205 )
      ( MAKE-6PILE ?auto_153203 ?auto_153204 ?auto_153205 ?auto_153206 ?auto_153207 ?auto_153208 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153229 - BLOCK
      ?auto_153230 - BLOCK
      ?auto_153231 - BLOCK
      ?auto_153232 - BLOCK
      ?auto_153233 - BLOCK
      ?auto_153234 - BLOCK
    )
    :vars
    (
      ?auto_153235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153234 ?auto_153235 ) ( ON-TABLE ?auto_153229 ) ( not ( = ?auto_153229 ?auto_153230 ) ) ( not ( = ?auto_153229 ?auto_153231 ) ) ( not ( = ?auto_153229 ?auto_153232 ) ) ( not ( = ?auto_153229 ?auto_153233 ) ) ( not ( = ?auto_153229 ?auto_153234 ) ) ( not ( = ?auto_153229 ?auto_153235 ) ) ( not ( = ?auto_153230 ?auto_153231 ) ) ( not ( = ?auto_153230 ?auto_153232 ) ) ( not ( = ?auto_153230 ?auto_153233 ) ) ( not ( = ?auto_153230 ?auto_153234 ) ) ( not ( = ?auto_153230 ?auto_153235 ) ) ( not ( = ?auto_153231 ?auto_153232 ) ) ( not ( = ?auto_153231 ?auto_153233 ) ) ( not ( = ?auto_153231 ?auto_153234 ) ) ( not ( = ?auto_153231 ?auto_153235 ) ) ( not ( = ?auto_153232 ?auto_153233 ) ) ( not ( = ?auto_153232 ?auto_153234 ) ) ( not ( = ?auto_153232 ?auto_153235 ) ) ( not ( = ?auto_153233 ?auto_153234 ) ) ( not ( = ?auto_153233 ?auto_153235 ) ) ( not ( = ?auto_153234 ?auto_153235 ) ) ( ON ?auto_153233 ?auto_153234 ) ( ON ?auto_153232 ?auto_153233 ) ( ON ?auto_153231 ?auto_153232 ) ( CLEAR ?auto_153229 ) ( ON ?auto_153230 ?auto_153231 ) ( CLEAR ?auto_153230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153229 ?auto_153230 )
      ( MAKE-6PILE ?auto_153229 ?auto_153230 ?auto_153231 ?auto_153232 ?auto_153233 ?auto_153234 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153255 - BLOCK
      ?auto_153256 - BLOCK
      ?auto_153257 - BLOCK
      ?auto_153258 - BLOCK
      ?auto_153259 - BLOCK
      ?auto_153260 - BLOCK
    )
    :vars
    (
      ?auto_153261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153260 ?auto_153261 ) ( not ( = ?auto_153255 ?auto_153256 ) ) ( not ( = ?auto_153255 ?auto_153257 ) ) ( not ( = ?auto_153255 ?auto_153258 ) ) ( not ( = ?auto_153255 ?auto_153259 ) ) ( not ( = ?auto_153255 ?auto_153260 ) ) ( not ( = ?auto_153255 ?auto_153261 ) ) ( not ( = ?auto_153256 ?auto_153257 ) ) ( not ( = ?auto_153256 ?auto_153258 ) ) ( not ( = ?auto_153256 ?auto_153259 ) ) ( not ( = ?auto_153256 ?auto_153260 ) ) ( not ( = ?auto_153256 ?auto_153261 ) ) ( not ( = ?auto_153257 ?auto_153258 ) ) ( not ( = ?auto_153257 ?auto_153259 ) ) ( not ( = ?auto_153257 ?auto_153260 ) ) ( not ( = ?auto_153257 ?auto_153261 ) ) ( not ( = ?auto_153258 ?auto_153259 ) ) ( not ( = ?auto_153258 ?auto_153260 ) ) ( not ( = ?auto_153258 ?auto_153261 ) ) ( not ( = ?auto_153259 ?auto_153260 ) ) ( not ( = ?auto_153259 ?auto_153261 ) ) ( not ( = ?auto_153260 ?auto_153261 ) ) ( ON ?auto_153259 ?auto_153260 ) ( ON ?auto_153258 ?auto_153259 ) ( ON ?auto_153257 ?auto_153258 ) ( ON ?auto_153256 ?auto_153257 ) ( ON ?auto_153255 ?auto_153256 ) ( CLEAR ?auto_153255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153255 )
      ( MAKE-6PILE ?auto_153255 ?auto_153256 ?auto_153257 ?auto_153258 ?auto_153259 ?auto_153260 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153282 - BLOCK
      ?auto_153283 - BLOCK
      ?auto_153284 - BLOCK
      ?auto_153285 - BLOCK
      ?auto_153286 - BLOCK
      ?auto_153287 - BLOCK
      ?auto_153288 - BLOCK
    )
    :vars
    (
      ?auto_153289 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_153287 ) ( ON ?auto_153288 ?auto_153289 ) ( CLEAR ?auto_153288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153282 ) ( ON ?auto_153283 ?auto_153282 ) ( ON ?auto_153284 ?auto_153283 ) ( ON ?auto_153285 ?auto_153284 ) ( ON ?auto_153286 ?auto_153285 ) ( ON ?auto_153287 ?auto_153286 ) ( not ( = ?auto_153282 ?auto_153283 ) ) ( not ( = ?auto_153282 ?auto_153284 ) ) ( not ( = ?auto_153282 ?auto_153285 ) ) ( not ( = ?auto_153282 ?auto_153286 ) ) ( not ( = ?auto_153282 ?auto_153287 ) ) ( not ( = ?auto_153282 ?auto_153288 ) ) ( not ( = ?auto_153282 ?auto_153289 ) ) ( not ( = ?auto_153283 ?auto_153284 ) ) ( not ( = ?auto_153283 ?auto_153285 ) ) ( not ( = ?auto_153283 ?auto_153286 ) ) ( not ( = ?auto_153283 ?auto_153287 ) ) ( not ( = ?auto_153283 ?auto_153288 ) ) ( not ( = ?auto_153283 ?auto_153289 ) ) ( not ( = ?auto_153284 ?auto_153285 ) ) ( not ( = ?auto_153284 ?auto_153286 ) ) ( not ( = ?auto_153284 ?auto_153287 ) ) ( not ( = ?auto_153284 ?auto_153288 ) ) ( not ( = ?auto_153284 ?auto_153289 ) ) ( not ( = ?auto_153285 ?auto_153286 ) ) ( not ( = ?auto_153285 ?auto_153287 ) ) ( not ( = ?auto_153285 ?auto_153288 ) ) ( not ( = ?auto_153285 ?auto_153289 ) ) ( not ( = ?auto_153286 ?auto_153287 ) ) ( not ( = ?auto_153286 ?auto_153288 ) ) ( not ( = ?auto_153286 ?auto_153289 ) ) ( not ( = ?auto_153287 ?auto_153288 ) ) ( not ( = ?auto_153287 ?auto_153289 ) ) ( not ( = ?auto_153288 ?auto_153289 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153288 ?auto_153289 )
      ( !STACK ?auto_153288 ?auto_153287 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153312 - BLOCK
      ?auto_153313 - BLOCK
      ?auto_153314 - BLOCK
      ?auto_153315 - BLOCK
      ?auto_153316 - BLOCK
      ?auto_153317 - BLOCK
      ?auto_153318 - BLOCK
    )
    :vars
    (
      ?auto_153319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153318 ?auto_153319 ) ( ON-TABLE ?auto_153312 ) ( ON ?auto_153313 ?auto_153312 ) ( ON ?auto_153314 ?auto_153313 ) ( ON ?auto_153315 ?auto_153314 ) ( ON ?auto_153316 ?auto_153315 ) ( not ( = ?auto_153312 ?auto_153313 ) ) ( not ( = ?auto_153312 ?auto_153314 ) ) ( not ( = ?auto_153312 ?auto_153315 ) ) ( not ( = ?auto_153312 ?auto_153316 ) ) ( not ( = ?auto_153312 ?auto_153317 ) ) ( not ( = ?auto_153312 ?auto_153318 ) ) ( not ( = ?auto_153312 ?auto_153319 ) ) ( not ( = ?auto_153313 ?auto_153314 ) ) ( not ( = ?auto_153313 ?auto_153315 ) ) ( not ( = ?auto_153313 ?auto_153316 ) ) ( not ( = ?auto_153313 ?auto_153317 ) ) ( not ( = ?auto_153313 ?auto_153318 ) ) ( not ( = ?auto_153313 ?auto_153319 ) ) ( not ( = ?auto_153314 ?auto_153315 ) ) ( not ( = ?auto_153314 ?auto_153316 ) ) ( not ( = ?auto_153314 ?auto_153317 ) ) ( not ( = ?auto_153314 ?auto_153318 ) ) ( not ( = ?auto_153314 ?auto_153319 ) ) ( not ( = ?auto_153315 ?auto_153316 ) ) ( not ( = ?auto_153315 ?auto_153317 ) ) ( not ( = ?auto_153315 ?auto_153318 ) ) ( not ( = ?auto_153315 ?auto_153319 ) ) ( not ( = ?auto_153316 ?auto_153317 ) ) ( not ( = ?auto_153316 ?auto_153318 ) ) ( not ( = ?auto_153316 ?auto_153319 ) ) ( not ( = ?auto_153317 ?auto_153318 ) ) ( not ( = ?auto_153317 ?auto_153319 ) ) ( not ( = ?auto_153318 ?auto_153319 ) ) ( CLEAR ?auto_153316 ) ( ON ?auto_153317 ?auto_153318 ) ( CLEAR ?auto_153317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153312 ?auto_153313 ?auto_153314 ?auto_153315 ?auto_153316 ?auto_153317 )
      ( MAKE-7PILE ?auto_153312 ?auto_153313 ?auto_153314 ?auto_153315 ?auto_153316 ?auto_153317 ?auto_153318 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153342 - BLOCK
      ?auto_153343 - BLOCK
      ?auto_153344 - BLOCK
      ?auto_153345 - BLOCK
      ?auto_153346 - BLOCK
      ?auto_153347 - BLOCK
      ?auto_153348 - BLOCK
    )
    :vars
    (
      ?auto_153349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153348 ?auto_153349 ) ( ON-TABLE ?auto_153342 ) ( ON ?auto_153343 ?auto_153342 ) ( ON ?auto_153344 ?auto_153343 ) ( ON ?auto_153345 ?auto_153344 ) ( not ( = ?auto_153342 ?auto_153343 ) ) ( not ( = ?auto_153342 ?auto_153344 ) ) ( not ( = ?auto_153342 ?auto_153345 ) ) ( not ( = ?auto_153342 ?auto_153346 ) ) ( not ( = ?auto_153342 ?auto_153347 ) ) ( not ( = ?auto_153342 ?auto_153348 ) ) ( not ( = ?auto_153342 ?auto_153349 ) ) ( not ( = ?auto_153343 ?auto_153344 ) ) ( not ( = ?auto_153343 ?auto_153345 ) ) ( not ( = ?auto_153343 ?auto_153346 ) ) ( not ( = ?auto_153343 ?auto_153347 ) ) ( not ( = ?auto_153343 ?auto_153348 ) ) ( not ( = ?auto_153343 ?auto_153349 ) ) ( not ( = ?auto_153344 ?auto_153345 ) ) ( not ( = ?auto_153344 ?auto_153346 ) ) ( not ( = ?auto_153344 ?auto_153347 ) ) ( not ( = ?auto_153344 ?auto_153348 ) ) ( not ( = ?auto_153344 ?auto_153349 ) ) ( not ( = ?auto_153345 ?auto_153346 ) ) ( not ( = ?auto_153345 ?auto_153347 ) ) ( not ( = ?auto_153345 ?auto_153348 ) ) ( not ( = ?auto_153345 ?auto_153349 ) ) ( not ( = ?auto_153346 ?auto_153347 ) ) ( not ( = ?auto_153346 ?auto_153348 ) ) ( not ( = ?auto_153346 ?auto_153349 ) ) ( not ( = ?auto_153347 ?auto_153348 ) ) ( not ( = ?auto_153347 ?auto_153349 ) ) ( not ( = ?auto_153348 ?auto_153349 ) ) ( ON ?auto_153347 ?auto_153348 ) ( CLEAR ?auto_153345 ) ( ON ?auto_153346 ?auto_153347 ) ( CLEAR ?auto_153346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153342 ?auto_153343 ?auto_153344 ?auto_153345 ?auto_153346 )
      ( MAKE-7PILE ?auto_153342 ?auto_153343 ?auto_153344 ?auto_153345 ?auto_153346 ?auto_153347 ?auto_153348 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153372 - BLOCK
      ?auto_153373 - BLOCK
      ?auto_153374 - BLOCK
      ?auto_153375 - BLOCK
      ?auto_153376 - BLOCK
      ?auto_153377 - BLOCK
      ?auto_153378 - BLOCK
    )
    :vars
    (
      ?auto_153379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153378 ?auto_153379 ) ( ON-TABLE ?auto_153372 ) ( ON ?auto_153373 ?auto_153372 ) ( ON ?auto_153374 ?auto_153373 ) ( not ( = ?auto_153372 ?auto_153373 ) ) ( not ( = ?auto_153372 ?auto_153374 ) ) ( not ( = ?auto_153372 ?auto_153375 ) ) ( not ( = ?auto_153372 ?auto_153376 ) ) ( not ( = ?auto_153372 ?auto_153377 ) ) ( not ( = ?auto_153372 ?auto_153378 ) ) ( not ( = ?auto_153372 ?auto_153379 ) ) ( not ( = ?auto_153373 ?auto_153374 ) ) ( not ( = ?auto_153373 ?auto_153375 ) ) ( not ( = ?auto_153373 ?auto_153376 ) ) ( not ( = ?auto_153373 ?auto_153377 ) ) ( not ( = ?auto_153373 ?auto_153378 ) ) ( not ( = ?auto_153373 ?auto_153379 ) ) ( not ( = ?auto_153374 ?auto_153375 ) ) ( not ( = ?auto_153374 ?auto_153376 ) ) ( not ( = ?auto_153374 ?auto_153377 ) ) ( not ( = ?auto_153374 ?auto_153378 ) ) ( not ( = ?auto_153374 ?auto_153379 ) ) ( not ( = ?auto_153375 ?auto_153376 ) ) ( not ( = ?auto_153375 ?auto_153377 ) ) ( not ( = ?auto_153375 ?auto_153378 ) ) ( not ( = ?auto_153375 ?auto_153379 ) ) ( not ( = ?auto_153376 ?auto_153377 ) ) ( not ( = ?auto_153376 ?auto_153378 ) ) ( not ( = ?auto_153376 ?auto_153379 ) ) ( not ( = ?auto_153377 ?auto_153378 ) ) ( not ( = ?auto_153377 ?auto_153379 ) ) ( not ( = ?auto_153378 ?auto_153379 ) ) ( ON ?auto_153377 ?auto_153378 ) ( ON ?auto_153376 ?auto_153377 ) ( CLEAR ?auto_153374 ) ( ON ?auto_153375 ?auto_153376 ) ( CLEAR ?auto_153375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153372 ?auto_153373 ?auto_153374 ?auto_153375 )
      ( MAKE-7PILE ?auto_153372 ?auto_153373 ?auto_153374 ?auto_153375 ?auto_153376 ?auto_153377 ?auto_153378 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153402 - BLOCK
      ?auto_153403 - BLOCK
      ?auto_153404 - BLOCK
      ?auto_153405 - BLOCK
      ?auto_153406 - BLOCK
      ?auto_153407 - BLOCK
      ?auto_153408 - BLOCK
    )
    :vars
    (
      ?auto_153409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153408 ?auto_153409 ) ( ON-TABLE ?auto_153402 ) ( ON ?auto_153403 ?auto_153402 ) ( not ( = ?auto_153402 ?auto_153403 ) ) ( not ( = ?auto_153402 ?auto_153404 ) ) ( not ( = ?auto_153402 ?auto_153405 ) ) ( not ( = ?auto_153402 ?auto_153406 ) ) ( not ( = ?auto_153402 ?auto_153407 ) ) ( not ( = ?auto_153402 ?auto_153408 ) ) ( not ( = ?auto_153402 ?auto_153409 ) ) ( not ( = ?auto_153403 ?auto_153404 ) ) ( not ( = ?auto_153403 ?auto_153405 ) ) ( not ( = ?auto_153403 ?auto_153406 ) ) ( not ( = ?auto_153403 ?auto_153407 ) ) ( not ( = ?auto_153403 ?auto_153408 ) ) ( not ( = ?auto_153403 ?auto_153409 ) ) ( not ( = ?auto_153404 ?auto_153405 ) ) ( not ( = ?auto_153404 ?auto_153406 ) ) ( not ( = ?auto_153404 ?auto_153407 ) ) ( not ( = ?auto_153404 ?auto_153408 ) ) ( not ( = ?auto_153404 ?auto_153409 ) ) ( not ( = ?auto_153405 ?auto_153406 ) ) ( not ( = ?auto_153405 ?auto_153407 ) ) ( not ( = ?auto_153405 ?auto_153408 ) ) ( not ( = ?auto_153405 ?auto_153409 ) ) ( not ( = ?auto_153406 ?auto_153407 ) ) ( not ( = ?auto_153406 ?auto_153408 ) ) ( not ( = ?auto_153406 ?auto_153409 ) ) ( not ( = ?auto_153407 ?auto_153408 ) ) ( not ( = ?auto_153407 ?auto_153409 ) ) ( not ( = ?auto_153408 ?auto_153409 ) ) ( ON ?auto_153407 ?auto_153408 ) ( ON ?auto_153406 ?auto_153407 ) ( ON ?auto_153405 ?auto_153406 ) ( CLEAR ?auto_153403 ) ( ON ?auto_153404 ?auto_153405 ) ( CLEAR ?auto_153404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153402 ?auto_153403 ?auto_153404 )
      ( MAKE-7PILE ?auto_153402 ?auto_153403 ?auto_153404 ?auto_153405 ?auto_153406 ?auto_153407 ?auto_153408 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153432 - BLOCK
      ?auto_153433 - BLOCK
      ?auto_153434 - BLOCK
      ?auto_153435 - BLOCK
      ?auto_153436 - BLOCK
      ?auto_153437 - BLOCK
      ?auto_153438 - BLOCK
    )
    :vars
    (
      ?auto_153439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153438 ?auto_153439 ) ( ON-TABLE ?auto_153432 ) ( not ( = ?auto_153432 ?auto_153433 ) ) ( not ( = ?auto_153432 ?auto_153434 ) ) ( not ( = ?auto_153432 ?auto_153435 ) ) ( not ( = ?auto_153432 ?auto_153436 ) ) ( not ( = ?auto_153432 ?auto_153437 ) ) ( not ( = ?auto_153432 ?auto_153438 ) ) ( not ( = ?auto_153432 ?auto_153439 ) ) ( not ( = ?auto_153433 ?auto_153434 ) ) ( not ( = ?auto_153433 ?auto_153435 ) ) ( not ( = ?auto_153433 ?auto_153436 ) ) ( not ( = ?auto_153433 ?auto_153437 ) ) ( not ( = ?auto_153433 ?auto_153438 ) ) ( not ( = ?auto_153433 ?auto_153439 ) ) ( not ( = ?auto_153434 ?auto_153435 ) ) ( not ( = ?auto_153434 ?auto_153436 ) ) ( not ( = ?auto_153434 ?auto_153437 ) ) ( not ( = ?auto_153434 ?auto_153438 ) ) ( not ( = ?auto_153434 ?auto_153439 ) ) ( not ( = ?auto_153435 ?auto_153436 ) ) ( not ( = ?auto_153435 ?auto_153437 ) ) ( not ( = ?auto_153435 ?auto_153438 ) ) ( not ( = ?auto_153435 ?auto_153439 ) ) ( not ( = ?auto_153436 ?auto_153437 ) ) ( not ( = ?auto_153436 ?auto_153438 ) ) ( not ( = ?auto_153436 ?auto_153439 ) ) ( not ( = ?auto_153437 ?auto_153438 ) ) ( not ( = ?auto_153437 ?auto_153439 ) ) ( not ( = ?auto_153438 ?auto_153439 ) ) ( ON ?auto_153437 ?auto_153438 ) ( ON ?auto_153436 ?auto_153437 ) ( ON ?auto_153435 ?auto_153436 ) ( ON ?auto_153434 ?auto_153435 ) ( CLEAR ?auto_153432 ) ( ON ?auto_153433 ?auto_153434 ) ( CLEAR ?auto_153433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153432 ?auto_153433 )
      ( MAKE-7PILE ?auto_153432 ?auto_153433 ?auto_153434 ?auto_153435 ?auto_153436 ?auto_153437 ?auto_153438 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153462 - BLOCK
      ?auto_153463 - BLOCK
      ?auto_153464 - BLOCK
      ?auto_153465 - BLOCK
      ?auto_153466 - BLOCK
      ?auto_153467 - BLOCK
      ?auto_153468 - BLOCK
    )
    :vars
    (
      ?auto_153469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153468 ?auto_153469 ) ( not ( = ?auto_153462 ?auto_153463 ) ) ( not ( = ?auto_153462 ?auto_153464 ) ) ( not ( = ?auto_153462 ?auto_153465 ) ) ( not ( = ?auto_153462 ?auto_153466 ) ) ( not ( = ?auto_153462 ?auto_153467 ) ) ( not ( = ?auto_153462 ?auto_153468 ) ) ( not ( = ?auto_153462 ?auto_153469 ) ) ( not ( = ?auto_153463 ?auto_153464 ) ) ( not ( = ?auto_153463 ?auto_153465 ) ) ( not ( = ?auto_153463 ?auto_153466 ) ) ( not ( = ?auto_153463 ?auto_153467 ) ) ( not ( = ?auto_153463 ?auto_153468 ) ) ( not ( = ?auto_153463 ?auto_153469 ) ) ( not ( = ?auto_153464 ?auto_153465 ) ) ( not ( = ?auto_153464 ?auto_153466 ) ) ( not ( = ?auto_153464 ?auto_153467 ) ) ( not ( = ?auto_153464 ?auto_153468 ) ) ( not ( = ?auto_153464 ?auto_153469 ) ) ( not ( = ?auto_153465 ?auto_153466 ) ) ( not ( = ?auto_153465 ?auto_153467 ) ) ( not ( = ?auto_153465 ?auto_153468 ) ) ( not ( = ?auto_153465 ?auto_153469 ) ) ( not ( = ?auto_153466 ?auto_153467 ) ) ( not ( = ?auto_153466 ?auto_153468 ) ) ( not ( = ?auto_153466 ?auto_153469 ) ) ( not ( = ?auto_153467 ?auto_153468 ) ) ( not ( = ?auto_153467 ?auto_153469 ) ) ( not ( = ?auto_153468 ?auto_153469 ) ) ( ON ?auto_153467 ?auto_153468 ) ( ON ?auto_153466 ?auto_153467 ) ( ON ?auto_153465 ?auto_153466 ) ( ON ?auto_153464 ?auto_153465 ) ( ON ?auto_153463 ?auto_153464 ) ( ON ?auto_153462 ?auto_153463 ) ( CLEAR ?auto_153462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153462 )
      ( MAKE-7PILE ?auto_153462 ?auto_153463 ?auto_153464 ?auto_153465 ?auto_153466 ?auto_153467 ?auto_153468 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153493 - BLOCK
      ?auto_153494 - BLOCK
      ?auto_153495 - BLOCK
      ?auto_153496 - BLOCK
      ?auto_153497 - BLOCK
      ?auto_153498 - BLOCK
      ?auto_153499 - BLOCK
      ?auto_153500 - BLOCK
    )
    :vars
    (
      ?auto_153501 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_153499 ) ( ON ?auto_153500 ?auto_153501 ) ( CLEAR ?auto_153500 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153493 ) ( ON ?auto_153494 ?auto_153493 ) ( ON ?auto_153495 ?auto_153494 ) ( ON ?auto_153496 ?auto_153495 ) ( ON ?auto_153497 ?auto_153496 ) ( ON ?auto_153498 ?auto_153497 ) ( ON ?auto_153499 ?auto_153498 ) ( not ( = ?auto_153493 ?auto_153494 ) ) ( not ( = ?auto_153493 ?auto_153495 ) ) ( not ( = ?auto_153493 ?auto_153496 ) ) ( not ( = ?auto_153493 ?auto_153497 ) ) ( not ( = ?auto_153493 ?auto_153498 ) ) ( not ( = ?auto_153493 ?auto_153499 ) ) ( not ( = ?auto_153493 ?auto_153500 ) ) ( not ( = ?auto_153493 ?auto_153501 ) ) ( not ( = ?auto_153494 ?auto_153495 ) ) ( not ( = ?auto_153494 ?auto_153496 ) ) ( not ( = ?auto_153494 ?auto_153497 ) ) ( not ( = ?auto_153494 ?auto_153498 ) ) ( not ( = ?auto_153494 ?auto_153499 ) ) ( not ( = ?auto_153494 ?auto_153500 ) ) ( not ( = ?auto_153494 ?auto_153501 ) ) ( not ( = ?auto_153495 ?auto_153496 ) ) ( not ( = ?auto_153495 ?auto_153497 ) ) ( not ( = ?auto_153495 ?auto_153498 ) ) ( not ( = ?auto_153495 ?auto_153499 ) ) ( not ( = ?auto_153495 ?auto_153500 ) ) ( not ( = ?auto_153495 ?auto_153501 ) ) ( not ( = ?auto_153496 ?auto_153497 ) ) ( not ( = ?auto_153496 ?auto_153498 ) ) ( not ( = ?auto_153496 ?auto_153499 ) ) ( not ( = ?auto_153496 ?auto_153500 ) ) ( not ( = ?auto_153496 ?auto_153501 ) ) ( not ( = ?auto_153497 ?auto_153498 ) ) ( not ( = ?auto_153497 ?auto_153499 ) ) ( not ( = ?auto_153497 ?auto_153500 ) ) ( not ( = ?auto_153497 ?auto_153501 ) ) ( not ( = ?auto_153498 ?auto_153499 ) ) ( not ( = ?auto_153498 ?auto_153500 ) ) ( not ( = ?auto_153498 ?auto_153501 ) ) ( not ( = ?auto_153499 ?auto_153500 ) ) ( not ( = ?auto_153499 ?auto_153501 ) ) ( not ( = ?auto_153500 ?auto_153501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153500 ?auto_153501 )
      ( !STACK ?auto_153500 ?auto_153499 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153527 - BLOCK
      ?auto_153528 - BLOCK
      ?auto_153529 - BLOCK
      ?auto_153530 - BLOCK
      ?auto_153531 - BLOCK
      ?auto_153532 - BLOCK
      ?auto_153533 - BLOCK
      ?auto_153534 - BLOCK
    )
    :vars
    (
      ?auto_153535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153534 ?auto_153535 ) ( ON-TABLE ?auto_153527 ) ( ON ?auto_153528 ?auto_153527 ) ( ON ?auto_153529 ?auto_153528 ) ( ON ?auto_153530 ?auto_153529 ) ( ON ?auto_153531 ?auto_153530 ) ( ON ?auto_153532 ?auto_153531 ) ( not ( = ?auto_153527 ?auto_153528 ) ) ( not ( = ?auto_153527 ?auto_153529 ) ) ( not ( = ?auto_153527 ?auto_153530 ) ) ( not ( = ?auto_153527 ?auto_153531 ) ) ( not ( = ?auto_153527 ?auto_153532 ) ) ( not ( = ?auto_153527 ?auto_153533 ) ) ( not ( = ?auto_153527 ?auto_153534 ) ) ( not ( = ?auto_153527 ?auto_153535 ) ) ( not ( = ?auto_153528 ?auto_153529 ) ) ( not ( = ?auto_153528 ?auto_153530 ) ) ( not ( = ?auto_153528 ?auto_153531 ) ) ( not ( = ?auto_153528 ?auto_153532 ) ) ( not ( = ?auto_153528 ?auto_153533 ) ) ( not ( = ?auto_153528 ?auto_153534 ) ) ( not ( = ?auto_153528 ?auto_153535 ) ) ( not ( = ?auto_153529 ?auto_153530 ) ) ( not ( = ?auto_153529 ?auto_153531 ) ) ( not ( = ?auto_153529 ?auto_153532 ) ) ( not ( = ?auto_153529 ?auto_153533 ) ) ( not ( = ?auto_153529 ?auto_153534 ) ) ( not ( = ?auto_153529 ?auto_153535 ) ) ( not ( = ?auto_153530 ?auto_153531 ) ) ( not ( = ?auto_153530 ?auto_153532 ) ) ( not ( = ?auto_153530 ?auto_153533 ) ) ( not ( = ?auto_153530 ?auto_153534 ) ) ( not ( = ?auto_153530 ?auto_153535 ) ) ( not ( = ?auto_153531 ?auto_153532 ) ) ( not ( = ?auto_153531 ?auto_153533 ) ) ( not ( = ?auto_153531 ?auto_153534 ) ) ( not ( = ?auto_153531 ?auto_153535 ) ) ( not ( = ?auto_153532 ?auto_153533 ) ) ( not ( = ?auto_153532 ?auto_153534 ) ) ( not ( = ?auto_153532 ?auto_153535 ) ) ( not ( = ?auto_153533 ?auto_153534 ) ) ( not ( = ?auto_153533 ?auto_153535 ) ) ( not ( = ?auto_153534 ?auto_153535 ) ) ( CLEAR ?auto_153532 ) ( ON ?auto_153533 ?auto_153534 ) ( CLEAR ?auto_153533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153527 ?auto_153528 ?auto_153529 ?auto_153530 ?auto_153531 ?auto_153532 ?auto_153533 )
      ( MAKE-8PILE ?auto_153527 ?auto_153528 ?auto_153529 ?auto_153530 ?auto_153531 ?auto_153532 ?auto_153533 ?auto_153534 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153561 - BLOCK
      ?auto_153562 - BLOCK
      ?auto_153563 - BLOCK
      ?auto_153564 - BLOCK
      ?auto_153565 - BLOCK
      ?auto_153566 - BLOCK
      ?auto_153567 - BLOCK
      ?auto_153568 - BLOCK
    )
    :vars
    (
      ?auto_153569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153568 ?auto_153569 ) ( ON-TABLE ?auto_153561 ) ( ON ?auto_153562 ?auto_153561 ) ( ON ?auto_153563 ?auto_153562 ) ( ON ?auto_153564 ?auto_153563 ) ( ON ?auto_153565 ?auto_153564 ) ( not ( = ?auto_153561 ?auto_153562 ) ) ( not ( = ?auto_153561 ?auto_153563 ) ) ( not ( = ?auto_153561 ?auto_153564 ) ) ( not ( = ?auto_153561 ?auto_153565 ) ) ( not ( = ?auto_153561 ?auto_153566 ) ) ( not ( = ?auto_153561 ?auto_153567 ) ) ( not ( = ?auto_153561 ?auto_153568 ) ) ( not ( = ?auto_153561 ?auto_153569 ) ) ( not ( = ?auto_153562 ?auto_153563 ) ) ( not ( = ?auto_153562 ?auto_153564 ) ) ( not ( = ?auto_153562 ?auto_153565 ) ) ( not ( = ?auto_153562 ?auto_153566 ) ) ( not ( = ?auto_153562 ?auto_153567 ) ) ( not ( = ?auto_153562 ?auto_153568 ) ) ( not ( = ?auto_153562 ?auto_153569 ) ) ( not ( = ?auto_153563 ?auto_153564 ) ) ( not ( = ?auto_153563 ?auto_153565 ) ) ( not ( = ?auto_153563 ?auto_153566 ) ) ( not ( = ?auto_153563 ?auto_153567 ) ) ( not ( = ?auto_153563 ?auto_153568 ) ) ( not ( = ?auto_153563 ?auto_153569 ) ) ( not ( = ?auto_153564 ?auto_153565 ) ) ( not ( = ?auto_153564 ?auto_153566 ) ) ( not ( = ?auto_153564 ?auto_153567 ) ) ( not ( = ?auto_153564 ?auto_153568 ) ) ( not ( = ?auto_153564 ?auto_153569 ) ) ( not ( = ?auto_153565 ?auto_153566 ) ) ( not ( = ?auto_153565 ?auto_153567 ) ) ( not ( = ?auto_153565 ?auto_153568 ) ) ( not ( = ?auto_153565 ?auto_153569 ) ) ( not ( = ?auto_153566 ?auto_153567 ) ) ( not ( = ?auto_153566 ?auto_153568 ) ) ( not ( = ?auto_153566 ?auto_153569 ) ) ( not ( = ?auto_153567 ?auto_153568 ) ) ( not ( = ?auto_153567 ?auto_153569 ) ) ( not ( = ?auto_153568 ?auto_153569 ) ) ( ON ?auto_153567 ?auto_153568 ) ( CLEAR ?auto_153565 ) ( ON ?auto_153566 ?auto_153567 ) ( CLEAR ?auto_153566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153561 ?auto_153562 ?auto_153563 ?auto_153564 ?auto_153565 ?auto_153566 )
      ( MAKE-8PILE ?auto_153561 ?auto_153562 ?auto_153563 ?auto_153564 ?auto_153565 ?auto_153566 ?auto_153567 ?auto_153568 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153595 - BLOCK
      ?auto_153596 - BLOCK
      ?auto_153597 - BLOCK
      ?auto_153598 - BLOCK
      ?auto_153599 - BLOCK
      ?auto_153600 - BLOCK
      ?auto_153601 - BLOCK
      ?auto_153602 - BLOCK
    )
    :vars
    (
      ?auto_153603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153602 ?auto_153603 ) ( ON-TABLE ?auto_153595 ) ( ON ?auto_153596 ?auto_153595 ) ( ON ?auto_153597 ?auto_153596 ) ( ON ?auto_153598 ?auto_153597 ) ( not ( = ?auto_153595 ?auto_153596 ) ) ( not ( = ?auto_153595 ?auto_153597 ) ) ( not ( = ?auto_153595 ?auto_153598 ) ) ( not ( = ?auto_153595 ?auto_153599 ) ) ( not ( = ?auto_153595 ?auto_153600 ) ) ( not ( = ?auto_153595 ?auto_153601 ) ) ( not ( = ?auto_153595 ?auto_153602 ) ) ( not ( = ?auto_153595 ?auto_153603 ) ) ( not ( = ?auto_153596 ?auto_153597 ) ) ( not ( = ?auto_153596 ?auto_153598 ) ) ( not ( = ?auto_153596 ?auto_153599 ) ) ( not ( = ?auto_153596 ?auto_153600 ) ) ( not ( = ?auto_153596 ?auto_153601 ) ) ( not ( = ?auto_153596 ?auto_153602 ) ) ( not ( = ?auto_153596 ?auto_153603 ) ) ( not ( = ?auto_153597 ?auto_153598 ) ) ( not ( = ?auto_153597 ?auto_153599 ) ) ( not ( = ?auto_153597 ?auto_153600 ) ) ( not ( = ?auto_153597 ?auto_153601 ) ) ( not ( = ?auto_153597 ?auto_153602 ) ) ( not ( = ?auto_153597 ?auto_153603 ) ) ( not ( = ?auto_153598 ?auto_153599 ) ) ( not ( = ?auto_153598 ?auto_153600 ) ) ( not ( = ?auto_153598 ?auto_153601 ) ) ( not ( = ?auto_153598 ?auto_153602 ) ) ( not ( = ?auto_153598 ?auto_153603 ) ) ( not ( = ?auto_153599 ?auto_153600 ) ) ( not ( = ?auto_153599 ?auto_153601 ) ) ( not ( = ?auto_153599 ?auto_153602 ) ) ( not ( = ?auto_153599 ?auto_153603 ) ) ( not ( = ?auto_153600 ?auto_153601 ) ) ( not ( = ?auto_153600 ?auto_153602 ) ) ( not ( = ?auto_153600 ?auto_153603 ) ) ( not ( = ?auto_153601 ?auto_153602 ) ) ( not ( = ?auto_153601 ?auto_153603 ) ) ( not ( = ?auto_153602 ?auto_153603 ) ) ( ON ?auto_153601 ?auto_153602 ) ( ON ?auto_153600 ?auto_153601 ) ( CLEAR ?auto_153598 ) ( ON ?auto_153599 ?auto_153600 ) ( CLEAR ?auto_153599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153595 ?auto_153596 ?auto_153597 ?auto_153598 ?auto_153599 )
      ( MAKE-8PILE ?auto_153595 ?auto_153596 ?auto_153597 ?auto_153598 ?auto_153599 ?auto_153600 ?auto_153601 ?auto_153602 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153629 - BLOCK
      ?auto_153630 - BLOCK
      ?auto_153631 - BLOCK
      ?auto_153632 - BLOCK
      ?auto_153633 - BLOCK
      ?auto_153634 - BLOCK
      ?auto_153635 - BLOCK
      ?auto_153636 - BLOCK
    )
    :vars
    (
      ?auto_153637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153636 ?auto_153637 ) ( ON-TABLE ?auto_153629 ) ( ON ?auto_153630 ?auto_153629 ) ( ON ?auto_153631 ?auto_153630 ) ( not ( = ?auto_153629 ?auto_153630 ) ) ( not ( = ?auto_153629 ?auto_153631 ) ) ( not ( = ?auto_153629 ?auto_153632 ) ) ( not ( = ?auto_153629 ?auto_153633 ) ) ( not ( = ?auto_153629 ?auto_153634 ) ) ( not ( = ?auto_153629 ?auto_153635 ) ) ( not ( = ?auto_153629 ?auto_153636 ) ) ( not ( = ?auto_153629 ?auto_153637 ) ) ( not ( = ?auto_153630 ?auto_153631 ) ) ( not ( = ?auto_153630 ?auto_153632 ) ) ( not ( = ?auto_153630 ?auto_153633 ) ) ( not ( = ?auto_153630 ?auto_153634 ) ) ( not ( = ?auto_153630 ?auto_153635 ) ) ( not ( = ?auto_153630 ?auto_153636 ) ) ( not ( = ?auto_153630 ?auto_153637 ) ) ( not ( = ?auto_153631 ?auto_153632 ) ) ( not ( = ?auto_153631 ?auto_153633 ) ) ( not ( = ?auto_153631 ?auto_153634 ) ) ( not ( = ?auto_153631 ?auto_153635 ) ) ( not ( = ?auto_153631 ?auto_153636 ) ) ( not ( = ?auto_153631 ?auto_153637 ) ) ( not ( = ?auto_153632 ?auto_153633 ) ) ( not ( = ?auto_153632 ?auto_153634 ) ) ( not ( = ?auto_153632 ?auto_153635 ) ) ( not ( = ?auto_153632 ?auto_153636 ) ) ( not ( = ?auto_153632 ?auto_153637 ) ) ( not ( = ?auto_153633 ?auto_153634 ) ) ( not ( = ?auto_153633 ?auto_153635 ) ) ( not ( = ?auto_153633 ?auto_153636 ) ) ( not ( = ?auto_153633 ?auto_153637 ) ) ( not ( = ?auto_153634 ?auto_153635 ) ) ( not ( = ?auto_153634 ?auto_153636 ) ) ( not ( = ?auto_153634 ?auto_153637 ) ) ( not ( = ?auto_153635 ?auto_153636 ) ) ( not ( = ?auto_153635 ?auto_153637 ) ) ( not ( = ?auto_153636 ?auto_153637 ) ) ( ON ?auto_153635 ?auto_153636 ) ( ON ?auto_153634 ?auto_153635 ) ( ON ?auto_153633 ?auto_153634 ) ( CLEAR ?auto_153631 ) ( ON ?auto_153632 ?auto_153633 ) ( CLEAR ?auto_153632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153629 ?auto_153630 ?auto_153631 ?auto_153632 )
      ( MAKE-8PILE ?auto_153629 ?auto_153630 ?auto_153631 ?auto_153632 ?auto_153633 ?auto_153634 ?auto_153635 ?auto_153636 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153663 - BLOCK
      ?auto_153664 - BLOCK
      ?auto_153665 - BLOCK
      ?auto_153666 - BLOCK
      ?auto_153667 - BLOCK
      ?auto_153668 - BLOCK
      ?auto_153669 - BLOCK
      ?auto_153670 - BLOCK
    )
    :vars
    (
      ?auto_153671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153670 ?auto_153671 ) ( ON-TABLE ?auto_153663 ) ( ON ?auto_153664 ?auto_153663 ) ( not ( = ?auto_153663 ?auto_153664 ) ) ( not ( = ?auto_153663 ?auto_153665 ) ) ( not ( = ?auto_153663 ?auto_153666 ) ) ( not ( = ?auto_153663 ?auto_153667 ) ) ( not ( = ?auto_153663 ?auto_153668 ) ) ( not ( = ?auto_153663 ?auto_153669 ) ) ( not ( = ?auto_153663 ?auto_153670 ) ) ( not ( = ?auto_153663 ?auto_153671 ) ) ( not ( = ?auto_153664 ?auto_153665 ) ) ( not ( = ?auto_153664 ?auto_153666 ) ) ( not ( = ?auto_153664 ?auto_153667 ) ) ( not ( = ?auto_153664 ?auto_153668 ) ) ( not ( = ?auto_153664 ?auto_153669 ) ) ( not ( = ?auto_153664 ?auto_153670 ) ) ( not ( = ?auto_153664 ?auto_153671 ) ) ( not ( = ?auto_153665 ?auto_153666 ) ) ( not ( = ?auto_153665 ?auto_153667 ) ) ( not ( = ?auto_153665 ?auto_153668 ) ) ( not ( = ?auto_153665 ?auto_153669 ) ) ( not ( = ?auto_153665 ?auto_153670 ) ) ( not ( = ?auto_153665 ?auto_153671 ) ) ( not ( = ?auto_153666 ?auto_153667 ) ) ( not ( = ?auto_153666 ?auto_153668 ) ) ( not ( = ?auto_153666 ?auto_153669 ) ) ( not ( = ?auto_153666 ?auto_153670 ) ) ( not ( = ?auto_153666 ?auto_153671 ) ) ( not ( = ?auto_153667 ?auto_153668 ) ) ( not ( = ?auto_153667 ?auto_153669 ) ) ( not ( = ?auto_153667 ?auto_153670 ) ) ( not ( = ?auto_153667 ?auto_153671 ) ) ( not ( = ?auto_153668 ?auto_153669 ) ) ( not ( = ?auto_153668 ?auto_153670 ) ) ( not ( = ?auto_153668 ?auto_153671 ) ) ( not ( = ?auto_153669 ?auto_153670 ) ) ( not ( = ?auto_153669 ?auto_153671 ) ) ( not ( = ?auto_153670 ?auto_153671 ) ) ( ON ?auto_153669 ?auto_153670 ) ( ON ?auto_153668 ?auto_153669 ) ( ON ?auto_153667 ?auto_153668 ) ( ON ?auto_153666 ?auto_153667 ) ( CLEAR ?auto_153664 ) ( ON ?auto_153665 ?auto_153666 ) ( CLEAR ?auto_153665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153663 ?auto_153664 ?auto_153665 )
      ( MAKE-8PILE ?auto_153663 ?auto_153664 ?auto_153665 ?auto_153666 ?auto_153667 ?auto_153668 ?auto_153669 ?auto_153670 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153697 - BLOCK
      ?auto_153698 - BLOCK
      ?auto_153699 - BLOCK
      ?auto_153700 - BLOCK
      ?auto_153701 - BLOCK
      ?auto_153702 - BLOCK
      ?auto_153703 - BLOCK
      ?auto_153704 - BLOCK
    )
    :vars
    (
      ?auto_153705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153704 ?auto_153705 ) ( ON-TABLE ?auto_153697 ) ( not ( = ?auto_153697 ?auto_153698 ) ) ( not ( = ?auto_153697 ?auto_153699 ) ) ( not ( = ?auto_153697 ?auto_153700 ) ) ( not ( = ?auto_153697 ?auto_153701 ) ) ( not ( = ?auto_153697 ?auto_153702 ) ) ( not ( = ?auto_153697 ?auto_153703 ) ) ( not ( = ?auto_153697 ?auto_153704 ) ) ( not ( = ?auto_153697 ?auto_153705 ) ) ( not ( = ?auto_153698 ?auto_153699 ) ) ( not ( = ?auto_153698 ?auto_153700 ) ) ( not ( = ?auto_153698 ?auto_153701 ) ) ( not ( = ?auto_153698 ?auto_153702 ) ) ( not ( = ?auto_153698 ?auto_153703 ) ) ( not ( = ?auto_153698 ?auto_153704 ) ) ( not ( = ?auto_153698 ?auto_153705 ) ) ( not ( = ?auto_153699 ?auto_153700 ) ) ( not ( = ?auto_153699 ?auto_153701 ) ) ( not ( = ?auto_153699 ?auto_153702 ) ) ( not ( = ?auto_153699 ?auto_153703 ) ) ( not ( = ?auto_153699 ?auto_153704 ) ) ( not ( = ?auto_153699 ?auto_153705 ) ) ( not ( = ?auto_153700 ?auto_153701 ) ) ( not ( = ?auto_153700 ?auto_153702 ) ) ( not ( = ?auto_153700 ?auto_153703 ) ) ( not ( = ?auto_153700 ?auto_153704 ) ) ( not ( = ?auto_153700 ?auto_153705 ) ) ( not ( = ?auto_153701 ?auto_153702 ) ) ( not ( = ?auto_153701 ?auto_153703 ) ) ( not ( = ?auto_153701 ?auto_153704 ) ) ( not ( = ?auto_153701 ?auto_153705 ) ) ( not ( = ?auto_153702 ?auto_153703 ) ) ( not ( = ?auto_153702 ?auto_153704 ) ) ( not ( = ?auto_153702 ?auto_153705 ) ) ( not ( = ?auto_153703 ?auto_153704 ) ) ( not ( = ?auto_153703 ?auto_153705 ) ) ( not ( = ?auto_153704 ?auto_153705 ) ) ( ON ?auto_153703 ?auto_153704 ) ( ON ?auto_153702 ?auto_153703 ) ( ON ?auto_153701 ?auto_153702 ) ( ON ?auto_153700 ?auto_153701 ) ( ON ?auto_153699 ?auto_153700 ) ( CLEAR ?auto_153697 ) ( ON ?auto_153698 ?auto_153699 ) ( CLEAR ?auto_153698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153697 ?auto_153698 )
      ( MAKE-8PILE ?auto_153697 ?auto_153698 ?auto_153699 ?auto_153700 ?auto_153701 ?auto_153702 ?auto_153703 ?auto_153704 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_153731 - BLOCK
      ?auto_153732 - BLOCK
      ?auto_153733 - BLOCK
      ?auto_153734 - BLOCK
      ?auto_153735 - BLOCK
      ?auto_153736 - BLOCK
      ?auto_153737 - BLOCK
      ?auto_153738 - BLOCK
    )
    :vars
    (
      ?auto_153739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153738 ?auto_153739 ) ( not ( = ?auto_153731 ?auto_153732 ) ) ( not ( = ?auto_153731 ?auto_153733 ) ) ( not ( = ?auto_153731 ?auto_153734 ) ) ( not ( = ?auto_153731 ?auto_153735 ) ) ( not ( = ?auto_153731 ?auto_153736 ) ) ( not ( = ?auto_153731 ?auto_153737 ) ) ( not ( = ?auto_153731 ?auto_153738 ) ) ( not ( = ?auto_153731 ?auto_153739 ) ) ( not ( = ?auto_153732 ?auto_153733 ) ) ( not ( = ?auto_153732 ?auto_153734 ) ) ( not ( = ?auto_153732 ?auto_153735 ) ) ( not ( = ?auto_153732 ?auto_153736 ) ) ( not ( = ?auto_153732 ?auto_153737 ) ) ( not ( = ?auto_153732 ?auto_153738 ) ) ( not ( = ?auto_153732 ?auto_153739 ) ) ( not ( = ?auto_153733 ?auto_153734 ) ) ( not ( = ?auto_153733 ?auto_153735 ) ) ( not ( = ?auto_153733 ?auto_153736 ) ) ( not ( = ?auto_153733 ?auto_153737 ) ) ( not ( = ?auto_153733 ?auto_153738 ) ) ( not ( = ?auto_153733 ?auto_153739 ) ) ( not ( = ?auto_153734 ?auto_153735 ) ) ( not ( = ?auto_153734 ?auto_153736 ) ) ( not ( = ?auto_153734 ?auto_153737 ) ) ( not ( = ?auto_153734 ?auto_153738 ) ) ( not ( = ?auto_153734 ?auto_153739 ) ) ( not ( = ?auto_153735 ?auto_153736 ) ) ( not ( = ?auto_153735 ?auto_153737 ) ) ( not ( = ?auto_153735 ?auto_153738 ) ) ( not ( = ?auto_153735 ?auto_153739 ) ) ( not ( = ?auto_153736 ?auto_153737 ) ) ( not ( = ?auto_153736 ?auto_153738 ) ) ( not ( = ?auto_153736 ?auto_153739 ) ) ( not ( = ?auto_153737 ?auto_153738 ) ) ( not ( = ?auto_153737 ?auto_153739 ) ) ( not ( = ?auto_153738 ?auto_153739 ) ) ( ON ?auto_153737 ?auto_153738 ) ( ON ?auto_153736 ?auto_153737 ) ( ON ?auto_153735 ?auto_153736 ) ( ON ?auto_153734 ?auto_153735 ) ( ON ?auto_153733 ?auto_153734 ) ( ON ?auto_153732 ?auto_153733 ) ( ON ?auto_153731 ?auto_153732 ) ( CLEAR ?auto_153731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153731 )
      ( MAKE-8PILE ?auto_153731 ?auto_153732 ?auto_153733 ?auto_153734 ?auto_153735 ?auto_153736 ?auto_153737 ?auto_153738 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_153766 - BLOCK
      ?auto_153767 - BLOCK
      ?auto_153768 - BLOCK
      ?auto_153769 - BLOCK
      ?auto_153770 - BLOCK
      ?auto_153771 - BLOCK
      ?auto_153772 - BLOCK
      ?auto_153773 - BLOCK
      ?auto_153774 - BLOCK
    )
    :vars
    (
      ?auto_153775 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_153773 ) ( ON ?auto_153774 ?auto_153775 ) ( CLEAR ?auto_153774 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153766 ) ( ON ?auto_153767 ?auto_153766 ) ( ON ?auto_153768 ?auto_153767 ) ( ON ?auto_153769 ?auto_153768 ) ( ON ?auto_153770 ?auto_153769 ) ( ON ?auto_153771 ?auto_153770 ) ( ON ?auto_153772 ?auto_153771 ) ( ON ?auto_153773 ?auto_153772 ) ( not ( = ?auto_153766 ?auto_153767 ) ) ( not ( = ?auto_153766 ?auto_153768 ) ) ( not ( = ?auto_153766 ?auto_153769 ) ) ( not ( = ?auto_153766 ?auto_153770 ) ) ( not ( = ?auto_153766 ?auto_153771 ) ) ( not ( = ?auto_153766 ?auto_153772 ) ) ( not ( = ?auto_153766 ?auto_153773 ) ) ( not ( = ?auto_153766 ?auto_153774 ) ) ( not ( = ?auto_153766 ?auto_153775 ) ) ( not ( = ?auto_153767 ?auto_153768 ) ) ( not ( = ?auto_153767 ?auto_153769 ) ) ( not ( = ?auto_153767 ?auto_153770 ) ) ( not ( = ?auto_153767 ?auto_153771 ) ) ( not ( = ?auto_153767 ?auto_153772 ) ) ( not ( = ?auto_153767 ?auto_153773 ) ) ( not ( = ?auto_153767 ?auto_153774 ) ) ( not ( = ?auto_153767 ?auto_153775 ) ) ( not ( = ?auto_153768 ?auto_153769 ) ) ( not ( = ?auto_153768 ?auto_153770 ) ) ( not ( = ?auto_153768 ?auto_153771 ) ) ( not ( = ?auto_153768 ?auto_153772 ) ) ( not ( = ?auto_153768 ?auto_153773 ) ) ( not ( = ?auto_153768 ?auto_153774 ) ) ( not ( = ?auto_153768 ?auto_153775 ) ) ( not ( = ?auto_153769 ?auto_153770 ) ) ( not ( = ?auto_153769 ?auto_153771 ) ) ( not ( = ?auto_153769 ?auto_153772 ) ) ( not ( = ?auto_153769 ?auto_153773 ) ) ( not ( = ?auto_153769 ?auto_153774 ) ) ( not ( = ?auto_153769 ?auto_153775 ) ) ( not ( = ?auto_153770 ?auto_153771 ) ) ( not ( = ?auto_153770 ?auto_153772 ) ) ( not ( = ?auto_153770 ?auto_153773 ) ) ( not ( = ?auto_153770 ?auto_153774 ) ) ( not ( = ?auto_153770 ?auto_153775 ) ) ( not ( = ?auto_153771 ?auto_153772 ) ) ( not ( = ?auto_153771 ?auto_153773 ) ) ( not ( = ?auto_153771 ?auto_153774 ) ) ( not ( = ?auto_153771 ?auto_153775 ) ) ( not ( = ?auto_153772 ?auto_153773 ) ) ( not ( = ?auto_153772 ?auto_153774 ) ) ( not ( = ?auto_153772 ?auto_153775 ) ) ( not ( = ?auto_153773 ?auto_153774 ) ) ( not ( = ?auto_153773 ?auto_153775 ) ) ( not ( = ?auto_153774 ?auto_153775 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153774 ?auto_153775 )
      ( !STACK ?auto_153774 ?auto_153773 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_153804 - BLOCK
      ?auto_153805 - BLOCK
      ?auto_153806 - BLOCK
      ?auto_153807 - BLOCK
      ?auto_153808 - BLOCK
      ?auto_153809 - BLOCK
      ?auto_153810 - BLOCK
      ?auto_153811 - BLOCK
      ?auto_153812 - BLOCK
    )
    :vars
    (
      ?auto_153813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153812 ?auto_153813 ) ( ON-TABLE ?auto_153804 ) ( ON ?auto_153805 ?auto_153804 ) ( ON ?auto_153806 ?auto_153805 ) ( ON ?auto_153807 ?auto_153806 ) ( ON ?auto_153808 ?auto_153807 ) ( ON ?auto_153809 ?auto_153808 ) ( ON ?auto_153810 ?auto_153809 ) ( not ( = ?auto_153804 ?auto_153805 ) ) ( not ( = ?auto_153804 ?auto_153806 ) ) ( not ( = ?auto_153804 ?auto_153807 ) ) ( not ( = ?auto_153804 ?auto_153808 ) ) ( not ( = ?auto_153804 ?auto_153809 ) ) ( not ( = ?auto_153804 ?auto_153810 ) ) ( not ( = ?auto_153804 ?auto_153811 ) ) ( not ( = ?auto_153804 ?auto_153812 ) ) ( not ( = ?auto_153804 ?auto_153813 ) ) ( not ( = ?auto_153805 ?auto_153806 ) ) ( not ( = ?auto_153805 ?auto_153807 ) ) ( not ( = ?auto_153805 ?auto_153808 ) ) ( not ( = ?auto_153805 ?auto_153809 ) ) ( not ( = ?auto_153805 ?auto_153810 ) ) ( not ( = ?auto_153805 ?auto_153811 ) ) ( not ( = ?auto_153805 ?auto_153812 ) ) ( not ( = ?auto_153805 ?auto_153813 ) ) ( not ( = ?auto_153806 ?auto_153807 ) ) ( not ( = ?auto_153806 ?auto_153808 ) ) ( not ( = ?auto_153806 ?auto_153809 ) ) ( not ( = ?auto_153806 ?auto_153810 ) ) ( not ( = ?auto_153806 ?auto_153811 ) ) ( not ( = ?auto_153806 ?auto_153812 ) ) ( not ( = ?auto_153806 ?auto_153813 ) ) ( not ( = ?auto_153807 ?auto_153808 ) ) ( not ( = ?auto_153807 ?auto_153809 ) ) ( not ( = ?auto_153807 ?auto_153810 ) ) ( not ( = ?auto_153807 ?auto_153811 ) ) ( not ( = ?auto_153807 ?auto_153812 ) ) ( not ( = ?auto_153807 ?auto_153813 ) ) ( not ( = ?auto_153808 ?auto_153809 ) ) ( not ( = ?auto_153808 ?auto_153810 ) ) ( not ( = ?auto_153808 ?auto_153811 ) ) ( not ( = ?auto_153808 ?auto_153812 ) ) ( not ( = ?auto_153808 ?auto_153813 ) ) ( not ( = ?auto_153809 ?auto_153810 ) ) ( not ( = ?auto_153809 ?auto_153811 ) ) ( not ( = ?auto_153809 ?auto_153812 ) ) ( not ( = ?auto_153809 ?auto_153813 ) ) ( not ( = ?auto_153810 ?auto_153811 ) ) ( not ( = ?auto_153810 ?auto_153812 ) ) ( not ( = ?auto_153810 ?auto_153813 ) ) ( not ( = ?auto_153811 ?auto_153812 ) ) ( not ( = ?auto_153811 ?auto_153813 ) ) ( not ( = ?auto_153812 ?auto_153813 ) ) ( CLEAR ?auto_153810 ) ( ON ?auto_153811 ?auto_153812 ) ( CLEAR ?auto_153811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153804 ?auto_153805 ?auto_153806 ?auto_153807 ?auto_153808 ?auto_153809 ?auto_153810 ?auto_153811 )
      ( MAKE-9PILE ?auto_153804 ?auto_153805 ?auto_153806 ?auto_153807 ?auto_153808 ?auto_153809 ?auto_153810 ?auto_153811 ?auto_153812 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_153842 - BLOCK
      ?auto_153843 - BLOCK
      ?auto_153844 - BLOCK
      ?auto_153845 - BLOCK
      ?auto_153846 - BLOCK
      ?auto_153847 - BLOCK
      ?auto_153848 - BLOCK
      ?auto_153849 - BLOCK
      ?auto_153850 - BLOCK
    )
    :vars
    (
      ?auto_153851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153850 ?auto_153851 ) ( ON-TABLE ?auto_153842 ) ( ON ?auto_153843 ?auto_153842 ) ( ON ?auto_153844 ?auto_153843 ) ( ON ?auto_153845 ?auto_153844 ) ( ON ?auto_153846 ?auto_153845 ) ( ON ?auto_153847 ?auto_153846 ) ( not ( = ?auto_153842 ?auto_153843 ) ) ( not ( = ?auto_153842 ?auto_153844 ) ) ( not ( = ?auto_153842 ?auto_153845 ) ) ( not ( = ?auto_153842 ?auto_153846 ) ) ( not ( = ?auto_153842 ?auto_153847 ) ) ( not ( = ?auto_153842 ?auto_153848 ) ) ( not ( = ?auto_153842 ?auto_153849 ) ) ( not ( = ?auto_153842 ?auto_153850 ) ) ( not ( = ?auto_153842 ?auto_153851 ) ) ( not ( = ?auto_153843 ?auto_153844 ) ) ( not ( = ?auto_153843 ?auto_153845 ) ) ( not ( = ?auto_153843 ?auto_153846 ) ) ( not ( = ?auto_153843 ?auto_153847 ) ) ( not ( = ?auto_153843 ?auto_153848 ) ) ( not ( = ?auto_153843 ?auto_153849 ) ) ( not ( = ?auto_153843 ?auto_153850 ) ) ( not ( = ?auto_153843 ?auto_153851 ) ) ( not ( = ?auto_153844 ?auto_153845 ) ) ( not ( = ?auto_153844 ?auto_153846 ) ) ( not ( = ?auto_153844 ?auto_153847 ) ) ( not ( = ?auto_153844 ?auto_153848 ) ) ( not ( = ?auto_153844 ?auto_153849 ) ) ( not ( = ?auto_153844 ?auto_153850 ) ) ( not ( = ?auto_153844 ?auto_153851 ) ) ( not ( = ?auto_153845 ?auto_153846 ) ) ( not ( = ?auto_153845 ?auto_153847 ) ) ( not ( = ?auto_153845 ?auto_153848 ) ) ( not ( = ?auto_153845 ?auto_153849 ) ) ( not ( = ?auto_153845 ?auto_153850 ) ) ( not ( = ?auto_153845 ?auto_153851 ) ) ( not ( = ?auto_153846 ?auto_153847 ) ) ( not ( = ?auto_153846 ?auto_153848 ) ) ( not ( = ?auto_153846 ?auto_153849 ) ) ( not ( = ?auto_153846 ?auto_153850 ) ) ( not ( = ?auto_153846 ?auto_153851 ) ) ( not ( = ?auto_153847 ?auto_153848 ) ) ( not ( = ?auto_153847 ?auto_153849 ) ) ( not ( = ?auto_153847 ?auto_153850 ) ) ( not ( = ?auto_153847 ?auto_153851 ) ) ( not ( = ?auto_153848 ?auto_153849 ) ) ( not ( = ?auto_153848 ?auto_153850 ) ) ( not ( = ?auto_153848 ?auto_153851 ) ) ( not ( = ?auto_153849 ?auto_153850 ) ) ( not ( = ?auto_153849 ?auto_153851 ) ) ( not ( = ?auto_153850 ?auto_153851 ) ) ( ON ?auto_153849 ?auto_153850 ) ( CLEAR ?auto_153847 ) ( ON ?auto_153848 ?auto_153849 ) ( CLEAR ?auto_153848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153842 ?auto_153843 ?auto_153844 ?auto_153845 ?auto_153846 ?auto_153847 ?auto_153848 )
      ( MAKE-9PILE ?auto_153842 ?auto_153843 ?auto_153844 ?auto_153845 ?auto_153846 ?auto_153847 ?auto_153848 ?auto_153849 ?auto_153850 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_153880 - BLOCK
      ?auto_153881 - BLOCK
      ?auto_153882 - BLOCK
      ?auto_153883 - BLOCK
      ?auto_153884 - BLOCK
      ?auto_153885 - BLOCK
      ?auto_153886 - BLOCK
      ?auto_153887 - BLOCK
      ?auto_153888 - BLOCK
    )
    :vars
    (
      ?auto_153889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153888 ?auto_153889 ) ( ON-TABLE ?auto_153880 ) ( ON ?auto_153881 ?auto_153880 ) ( ON ?auto_153882 ?auto_153881 ) ( ON ?auto_153883 ?auto_153882 ) ( ON ?auto_153884 ?auto_153883 ) ( not ( = ?auto_153880 ?auto_153881 ) ) ( not ( = ?auto_153880 ?auto_153882 ) ) ( not ( = ?auto_153880 ?auto_153883 ) ) ( not ( = ?auto_153880 ?auto_153884 ) ) ( not ( = ?auto_153880 ?auto_153885 ) ) ( not ( = ?auto_153880 ?auto_153886 ) ) ( not ( = ?auto_153880 ?auto_153887 ) ) ( not ( = ?auto_153880 ?auto_153888 ) ) ( not ( = ?auto_153880 ?auto_153889 ) ) ( not ( = ?auto_153881 ?auto_153882 ) ) ( not ( = ?auto_153881 ?auto_153883 ) ) ( not ( = ?auto_153881 ?auto_153884 ) ) ( not ( = ?auto_153881 ?auto_153885 ) ) ( not ( = ?auto_153881 ?auto_153886 ) ) ( not ( = ?auto_153881 ?auto_153887 ) ) ( not ( = ?auto_153881 ?auto_153888 ) ) ( not ( = ?auto_153881 ?auto_153889 ) ) ( not ( = ?auto_153882 ?auto_153883 ) ) ( not ( = ?auto_153882 ?auto_153884 ) ) ( not ( = ?auto_153882 ?auto_153885 ) ) ( not ( = ?auto_153882 ?auto_153886 ) ) ( not ( = ?auto_153882 ?auto_153887 ) ) ( not ( = ?auto_153882 ?auto_153888 ) ) ( not ( = ?auto_153882 ?auto_153889 ) ) ( not ( = ?auto_153883 ?auto_153884 ) ) ( not ( = ?auto_153883 ?auto_153885 ) ) ( not ( = ?auto_153883 ?auto_153886 ) ) ( not ( = ?auto_153883 ?auto_153887 ) ) ( not ( = ?auto_153883 ?auto_153888 ) ) ( not ( = ?auto_153883 ?auto_153889 ) ) ( not ( = ?auto_153884 ?auto_153885 ) ) ( not ( = ?auto_153884 ?auto_153886 ) ) ( not ( = ?auto_153884 ?auto_153887 ) ) ( not ( = ?auto_153884 ?auto_153888 ) ) ( not ( = ?auto_153884 ?auto_153889 ) ) ( not ( = ?auto_153885 ?auto_153886 ) ) ( not ( = ?auto_153885 ?auto_153887 ) ) ( not ( = ?auto_153885 ?auto_153888 ) ) ( not ( = ?auto_153885 ?auto_153889 ) ) ( not ( = ?auto_153886 ?auto_153887 ) ) ( not ( = ?auto_153886 ?auto_153888 ) ) ( not ( = ?auto_153886 ?auto_153889 ) ) ( not ( = ?auto_153887 ?auto_153888 ) ) ( not ( = ?auto_153887 ?auto_153889 ) ) ( not ( = ?auto_153888 ?auto_153889 ) ) ( ON ?auto_153887 ?auto_153888 ) ( ON ?auto_153886 ?auto_153887 ) ( CLEAR ?auto_153884 ) ( ON ?auto_153885 ?auto_153886 ) ( CLEAR ?auto_153885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153880 ?auto_153881 ?auto_153882 ?auto_153883 ?auto_153884 ?auto_153885 )
      ( MAKE-9PILE ?auto_153880 ?auto_153881 ?auto_153882 ?auto_153883 ?auto_153884 ?auto_153885 ?auto_153886 ?auto_153887 ?auto_153888 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_153918 - BLOCK
      ?auto_153919 - BLOCK
      ?auto_153920 - BLOCK
      ?auto_153921 - BLOCK
      ?auto_153922 - BLOCK
      ?auto_153923 - BLOCK
      ?auto_153924 - BLOCK
      ?auto_153925 - BLOCK
      ?auto_153926 - BLOCK
    )
    :vars
    (
      ?auto_153927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153926 ?auto_153927 ) ( ON-TABLE ?auto_153918 ) ( ON ?auto_153919 ?auto_153918 ) ( ON ?auto_153920 ?auto_153919 ) ( ON ?auto_153921 ?auto_153920 ) ( not ( = ?auto_153918 ?auto_153919 ) ) ( not ( = ?auto_153918 ?auto_153920 ) ) ( not ( = ?auto_153918 ?auto_153921 ) ) ( not ( = ?auto_153918 ?auto_153922 ) ) ( not ( = ?auto_153918 ?auto_153923 ) ) ( not ( = ?auto_153918 ?auto_153924 ) ) ( not ( = ?auto_153918 ?auto_153925 ) ) ( not ( = ?auto_153918 ?auto_153926 ) ) ( not ( = ?auto_153918 ?auto_153927 ) ) ( not ( = ?auto_153919 ?auto_153920 ) ) ( not ( = ?auto_153919 ?auto_153921 ) ) ( not ( = ?auto_153919 ?auto_153922 ) ) ( not ( = ?auto_153919 ?auto_153923 ) ) ( not ( = ?auto_153919 ?auto_153924 ) ) ( not ( = ?auto_153919 ?auto_153925 ) ) ( not ( = ?auto_153919 ?auto_153926 ) ) ( not ( = ?auto_153919 ?auto_153927 ) ) ( not ( = ?auto_153920 ?auto_153921 ) ) ( not ( = ?auto_153920 ?auto_153922 ) ) ( not ( = ?auto_153920 ?auto_153923 ) ) ( not ( = ?auto_153920 ?auto_153924 ) ) ( not ( = ?auto_153920 ?auto_153925 ) ) ( not ( = ?auto_153920 ?auto_153926 ) ) ( not ( = ?auto_153920 ?auto_153927 ) ) ( not ( = ?auto_153921 ?auto_153922 ) ) ( not ( = ?auto_153921 ?auto_153923 ) ) ( not ( = ?auto_153921 ?auto_153924 ) ) ( not ( = ?auto_153921 ?auto_153925 ) ) ( not ( = ?auto_153921 ?auto_153926 ) ) ( not ( = ?auto_153921 ?auto_153927 ) ) ( not ( = ?auto_153922 ?auto_153923 ) ) ( not ( = ?auto_153922 ?auto_153924 ) ) ( not ( = ?auto_153922 ?auto_153925 ) ) ( not ( = ?auto_153922 ?auto_153926 ) ) ( not ( = ?auto_153922 ?auto_153927 ) ) ( not ( = ?auto_153923 ?auto_153924 ) ) ( not ( = ?auto_153923 ?auto_153925 ) ) ( not ( = ?auto_153923 ?auto_153926 ) ) ( not ( = ?auto_153923 ?auto_153927 ) ) ( not ( = ?auto_153924 ?auto_153925 ) ) ( not ( = ?auto_153924 ?auto_153926 ) ) ( not ( = ?auto_153924 ?auto_153927 ) ) ( not ( = ?auto_153925 ?auto_153926 ) ) ( not ( = ?auto_153925 ?auto_153927 ) ) ( not ( = ?auto_153926 ?auto_153927 ) ) ( ON ?auto_153925 ?auto_153926 ) ( ON ?auto_153924 ?auto_153925 ) ( ON ?auto_153923 ?auto_153924 ) ( CLEAR ?auto_153921 ) ( ON ?auto_153922 ?auto_153923 ) ( CLEAR ?auto_153922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153918 ?auto_153919 ?auto_153920 ?auto_153921 ?auto_153922 )
      ( MAKE-9PILE ?auto_153918 ?auto_153919 ?auto_153920 ?auto_153921 ?auto_153922 ?auto_153923 ?auto_153924 ?auto_153925 ?auto_153926 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_153956 - BLOCK
      ?auto_153957 - BLOCK
      ?auto_153958 - BLOCK
      ?auto_153959 - BLOCK
      ?auto_153960 - BLOCK
      ?auto_153961 - BLOCK
      ?auto_153962 - BLOCK
      ?auto_153963 - BLOCK
      ?auto_153964 - BLOCK
    )
    :vars
    (
      ?auto_153965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153964 ?auto_153965 ) ( ON-TABLE ?auto_153956 ) ( ON ?auto_153957 ?auto_153956 ) ( ON ?auto_153958 ?auto_153957 ) ( not ( = ?auto_153956 ?auto_153957 ) ) ( not ( = ?auto_153956 ?auto_153958 ) ) ( not ( = ?auto_153956 ?auto_153959 ) ) ( not ( = ?auto_153956 ?auto_153960 ) ) ( not ( = ?auto_153956 ?auto_153961 ) ) ( not ( = ?auto_153956 ?auto_153962 ) ) ( not ( = ?auto_153956 ?auto_153963 ) ) ( not ( = ?auto_153956 ?auto_153964 ) ) ( not ( = ?auto_153956 ?auto_153965 ) ) ( not ( = ?auto_153957 ?auto_153958 ) ) ( not ( = ?auto_153957 ?auto_153959 ) ) ( not ( = ?auto_153957 ?auto_153960 ) ) ( not ( = ?auto_153957 ?auto_153961 ) ) ( not ( = ?auto_153957 ?auto_153962 ) ) ( not ( = ?auto_153957 ?auto_153963 ) ) ( not ( = ?auto_153957 ?auto_153964 ) ) ( not ( = ?auto_153957 ?auto_153965 ) ) ( not ( = ?auto_153958 ?auto_153959 ) ) ( not ( = ?auto_153958 ?auto_153960 ) ) ( not ( = ?auto_153958 ?auto_153961 ) ) ( not ( = ?auto_153958 ?auto_153962 ) ) ( not ( = ?auto_153958 ?auto_153963 ) ) ( not ( = ?auto_153958 ?auto_153964 ) ) ( not ( = ?auto_153958 ?auto_153965 ) ) ( not ( = ?auto_153959 ?auto_153960 ) ) ( not ( = ?auto_153959 ?auto_153961 ) ) ( not ( = ?auto_153959 ?auto_153962 ) ) ( not ( = ?auto_153959 ?auto_153963 ) ) ( not ( = ?auto_153959 ?auto_153964 ) ) ( not ( = ?auto_153959 ?auto_153965 ) ) ( not ( = ?auto_153960 ?auto_153961 ) ) ( not ( = ?auto_153960 ?auto_153962 ) ) ( not ( = ?auto_153960 ?auto_153963 ) ) ( not ( = ?auto_153960 ?auto_153964 ) ) ( not ( = ?auto_153960 ?auto_153965 ) ) ( not ( = ?auto_153961 ?auto_153962 ) ) ( not ( = ?auto_153961 ?auto_153963 ) ) ( not ( = ?auto_153961 ?auto_153964 ) ) ( not ( = ?auto_153961 ?auto_153965 ) ) ( not ( = ?auto_153962 ?auto_153963 ) ) ( not ( = ?auto_153962 ?auto_153964 ) ) ( not ( = ?auto_153962 ?auto_153965 ) ) ( not ( = ?auto_153963 ?auto_153964 ) ) ( not ( = ?auto_153963 ?auto_153965 ) ) ( not ( = ?auto_153964 ?auto_153965 ) ) ( ON ?auto_153963 ?auto_153964 ) ( ON ?auto_153962 ?auto_153963 ) ( ON ?auto_153961 ?auto_153962 ) ( ON ?auto_153960 ?auto_153961 ) ( CLEAR ?auto_153958 ) ( ON ?auto_153959 ?auto_153960 ) ( CLEAR ?auto_153959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153956 ?auto_153957 ?auto_153958 ?auto_153959 )
      ( MAKE-9PILE ?auto_153956 ?auto_153957 ?auto_153958 ?auto_153959 ?auto_153960 ?auto_153961 ?auto_153962 ?auto_153963 ?auto_153964 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_153994 - BLOCK
      ?auto_153995 - BLOCK
      ?auto_153996 - BLOCK
      ?auto_153997 - BLOCK
      ?auto_153998 - BLOCK
      ?auto_153999 - BLOCK
      ?auto_154000 - BLOCK
      ?auto_154001 - BLOCK
      ?auto_154002 - BLOCK
    )
    :vars
    (
      ?auto_154003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154002 ?auto_154003 ) ( ON-TABLE ?auto_153994 ) ( ON ?auto_153995 ?auto_153994 ) ( not ( = ?auto_153994 ?auto_153995 ) ) ( not ( = ?auto_153994 ?auto_153996 ) ) ( not ( = ?auto_153994 ?auto_153997 ) ) ( not ( = ?auto_153994 ?auto_153998 ) ) ( not ( = ?auto_153994 ?auto_153999 ) ) ( not ( = ?auto_153994 ?auto_154000 ) ) ( not ( = ?auto_153994 ?auto_154001 ) ) ( not ( = ?auto_153994 ?auto_154002 ) ) ( not ( = ?auto_153994 ?auto_154003 ) ) ( not ( = ?auto_153995 ?auto_153996 ) ) ( not ( = ?auto_153995 ?auto_153997 ) ) ( not ( = ?auto_153995 ?auto_153998 ) ) ( not ( = ?auto_153995 ?auto_153999 ) ) ( not ( = ?auto_153995 ?auto_154000 ) ) ( not ( = ?auto_153995 ?auto_154001 ) ) ( not ( = ?auto_153995 ?auto_154002 ) ) ( not ( = ?auto_153995 ?auto_154003 ) ) ( not ( = ?auto_153996 ?auto_153997 ) ) ( not ( = ?auto_153996 ?auto_153998 ) ) ( not ( = ?auto_153996 ?auto_153999 ) ) ( not ( = ?auto_153996 ?auto_154000 ) ) ( not ( = ?auto_153996 ?auto_154001 ) ) ( not ( = ?auto_153996 ?auto_154002 ) ) ( not ( = ?auto_153996 ?auto_154003 ) ) ( not ( = ?auto_153997 ?auto_153998 ) ) ( not ( = ?auto_153997 ?auto_153999 ) ) ( not ( = ?auto_153997 ?auto_154000 ) ) ( not ( = ?auto_153997 ?auto_154001 ) ) ( not ( = ?auto_153997 ?auto_154002 ) ) ( not ( = ?auto_153997 ?auto_154003 ) ) ( not ( = ?auto_153998 ?auto_153999 ) ) ( not ( = ?auto_153998 ?auto_154000 ) ) ( not ( = ?auto_153998 ?auto_154001 ) ) ( not ( = ?auto_153998 ?auto_154002 ) ) ( not ( = ?auto_153998 ?auto_154003 ) ) ( not ( = ?auto_153999 ?auto_154000 ) ) ( not ( = ?auto_153999 ?auto_154001 ) ) ( not ( = ?auto_153999 ?auto_154002 ) ) ( not ( = ?auto_153999 ?auto_154003 ) ) ( not ( = ?auto_154000 ?auto_154001 ) ) ( not ( = ?auto_154000 ?auto_154002 ) ) ( not ( = ?auto_154000 ?auto_154003 ) ) ( not ( = ?auto_154001 ?auto_154002 ) ) ( not ( = ?auto_154001 ?auto_154003 ) ) ( not ( = ?auto_154002 ?auto_154003 ) ) ( ON ?auto_154001 ?auto_154002 ) ( ON ?auto_154000 ?auto_154001 ) ( ON ?auto_153999 ?auto_154000 ) ( ON ?auto_153998 ?auto_153999 ) ( ON ?auto_153997 ?auto_153998 ) ( CLEAR ?auto_153995 ) ( ON ?auto_153996 ?auto_153997 ) ( CLEAR ?auto_153996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153994 ?auto_153995 ?auto_153996 )
      ( MAKE-9PILE ?auto_153994 ?auto_153995 ?auto_153996 ?auto_153997 ?auto_153998 ?auto_153999 ?auto_154000 ?auto_154001 ?auto_154002 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_154032 - BLOCK
      ?auto_154033 - BLOCK
      ?auto_154034 - BLOCK
      ?auto_154035 - BLOCK
      ?auto_154036 - BLOCK
      ?auto_154037 - BLOCK
      ?auto_154038 - BLOCK
      ?auto_154039 - BLOCK
      ?auto_154040 - BLOCK
    )
    :vars
    (
      ?auto_154041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154040 ?auto_154041 ) ( ON-TABLE ?auto_154032 ) ( not ( = ?auto_154032 ?auto_154033 ) ) ( not ( = ?auto_154032 ?auto_154034 ) ) ( not ( = ?auto_154032 ?auto_154035 ) ) ( not ( = ?auto_154032 ?auto_154036 ) ) ( not ( = ?auto_154032 ?auto_154037 ) ) ( not ( = ?auto_154032 ?auto_154038 ) ) ( not ( = ?auto_154032 ?auto_154039 ) ) ( not ( = ?auto_154032 ?auto_154040 ) ) ( not ( = ?auto_154032 ?auto_154041 ) ) ( not ( = ?auto_154033 ?auto_154034 ) ) ( not ( = ?auto_154033 ?auto_154035 ) ) ( not ( = ?auto_154033 ?auto_154036 ) ) ( not ( = ?auto_154033 ?auto_154037 ) ) ( not ( = ?auto_154033 ?auto_154038 ) ) ( not ( = ?auto_154033 ?auto_154039 ) ) ( not ( = ?auto_154033 ?auto_154040 ) ) ( not ( = ?auto_154033 ?auto_154041 ) ) ( not ( = ?auto_154034 ?auto_154035 ) ) ( not ( = ?auto_154034 ?auto_154036 ) ) ( not ( = ?auto_154034 ?auto_154037 ) ) ( not ( = ?auto_154034 ?auto_154038 ) ) ( not ( = ?auto_154034 ?auto_154039 ) ) ( not ( = ?auto_154034 ?auto_154040 ) ) ( not ( = ?auto_154034 ?auto_154041 ) ) ( not ( = ?auto_154035 ?auto_154036 ) ) ( not ( = ?auto_154035 ?auto_154037 ) ) ( not ( = ?auto_154035 ?auto_154038 ) ) ( not ( = ?auto_154035 ?auto_154039 ) ) ( not ( = ?auto_154035 ?auto_154040 ) ) ( not ( = ?auto_154035 ?auto_154041 ) ) ( not ( = ?auto_154036 ?auto_154037 ) ) ( not ( = ?auto_154036 ?auto_154038 ) ) ( not ( = ?auto_154036 ?auto_154039 ) ) ( not ( = ?auto_154036 ?auto_154040 ) ) ( not ( = ?auto_154036 ?auto_154041 ) ) ( not ( = ?auto_154037 ?auto_154038 ) ) ( not ( = ?auto_154037 ?auto_154039 ) ) ( not ( = ?auto_154037 ?auto_154040 ) ) ( not ( = ?auto_154037 ?auto_154041 ) ) ( not ( = ?auto_154038 ?auto_154039 ) ) ( not ( = ?auto_154038 ?auto_154040 ) ) ( not ( = ?auto_154038 ?auto_154041 ) ) ( not ( = ?auto_154039 ?auto_154040 ) ) ( not ( = ?auto_154039 ?auto_154041 ) ) ( not ( = ?auto_154040 ?auto_154041 ) ) ( ON ?auto_154039 ?auto_154040 ) ( ON ?auto_154038 ?auto_154039 ) ( ON ?auto_154037 ?auto_154038 ) ( ON ?auto_154036 ?auto_154037 ) ( ON ?auto_154035 ?auto_154036 ) ( ON ?auto_154034 ?auto_154035 ) ( CLEAR ?auto_154032 ) ( ON ?auto_154033 ?auto_154034 ) ( CLEAR ?auto_154033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154032 ?auto_154033 )
      ( MAKE-9PILE ?auto_154032 ?auto_154033 ?auto_154034 ?auto_154035 ?auto_154036 ?auto_154037 ?auto_154038 ?auto_154039 ?auto_154040 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_154070 - BLOCK
      ?auto_154071 - BLOCK
      ?auto_154072 - BLOCK
      ?auto_154073 - BLOCK
      ?auto_154074 - BLOCK
      ?auto_154075 - BLOCK
      ?auto_154076 - BLOCK
      ?auto_154077 - BLOCK
      ?auto_154078 - BLOCK
    )
    :vars
    (
      ?auto_154079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154078 ?auto_154079 ) ( not ( = ?auto_154070 ?auto_154071 ) ) ( not ( = ?auto_154070 ?auto_154072 ) ) ( not ( = ?auto_154070 ?auto_154073 ) ) ( not ( = ?auto_154070 ?auto_154074 ) ) ( not ( = ?auto_154070 ?auto_154075 ) ) ( not ( = ?auto_154070 ?auto_154076 ) ) ( not ( = ?auto_154070 ?auto_154077 ) ) ( not ( = ?auto_154070 ?auto_154078 ) ) ( not ( = ?auto_154070 ?auto_154079 ) ) ( not ( = ?auto_154071 ?auto_154072 ) ) ( not ( = ?auto_154071 ?auto_154073 ) ) ( not ( = ?auto_154071 ?auto_154074 ) ) ( not ( = ?auto_154071 ?auto_154075 ) ) ( not ( = ?auto_154071 ?auto_154076 ) ) ( not ( = ?auto_154071 ?auto_154077 ) ) ( not ( = ?auto_154071 ?auto_154078 ) ) ( not ( = ?auto_154071 ?auto_154079 ) ) ( not ( = ?auto_154072 ?auto_154073 ) ) ( not ( = ?auto_154072 ?auto_154074 ) ) ( not ( = ?auto_154072 ?auto_154075 ) ) ( not ( = ?auto_154072 ?auto_154076 ) ) ( not ( = ?auto_154072 ?auto_154077 ) ) ( not ( = ?auto_154072 ?auto_154078 ) ) ( not ( = ?auto_154072 ?auto_154079 ) ) ( not ( = ?auto_154073 ?auto_154074 ) ) ( not ( = ?auto_154073 ?auto_154075 ) ) ( not ( = ?auto_154073 ?auto_154076 ) ) ( not ( = ?auto_154073 ?auto_154077 ) ) ( not ( = ?auto_154073 ?auto_154078 ) ) ( not ( = ?auto_154073 ?auto_154079 ) ) ( not ( = ?auto_154074 ?auto_154075 ) ) ( not ( = ?auto_154074 ?auto_154076 ) ) ( not ( = ?auto_154074 ?auto_154077 ) ) ( not ( = ?auto_154074 ?auto_154078 ) ) ( not ( = ?auto_154074 ?auto_154079 ) ) ( not ( = ?auto_154075 ?auto_154076 ) ) ( not ( = ?auto_154075 ?auto_154077 ) ) ( not ( = ?auto_154075 ?auto_154078 ) ) ( not ( = ?auto_154075 ?auto_154079 ) ) ( not ( = ?auto_154076 ?auto_154077 ) ) ( not ( = ?auto_154076 ?auto_154078 ) ) ( not ( = ?auto_154076 ?auto_154079 ) ) ( not ( = ?auto_154077 ?auto_154078 ) ) ( not ( = ?auto_154077 ?auto_154079 ) ) ( not ( = ?auto_154078 ?auto_154079 ) ) ( ON ?auto_154077 ?auto_154078 ) ( ON ?auto_154076 ?auto_154077 ) ( ON ?auto_154075 ?auto_154076 ) ( ON ?auto_154074 ?auto_154075 ) ( ON ?auto_154073 ?auto_154074 ) ( ON ?auto_154072 ?auto_154073 ) ( ON ?auto_154071 ?auto_154072 ) ( ON ?auto_154070 ?auto_154071 ) ( CLEAR ?auto_154070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154070 )
      ( MAKE-9PILE ?auto_154070 ?auto_154071 ?auto_154072 ?auto_154073 ?auto_154074 ?auto_154075 ?auto_154076 ?auto_154077 ?auto_154078 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_154109 - BLOCK
      ?auto_154110 - BLOCK
      ?auto_154111 - BLOCK
      ?auto_154112 - BLOCK
      ?auto_154113 - BLOCK
      ?auto_154114 - BLOCK
      ?auto_154115 - BLOCK
      ?auto_154116 - BLOCK
      ?auto_154117 - BLOCK
      ?auto_154118 - BLOCK
    )
    :vars
    (
      ?auto_154119 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154117 ) ( ON ?auto_154118 ?auto_154119 ) ( CLEAR ?auto_154118 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154109 ) ( ON ?auto_154110 ?auto_154109 ) ( ON ?auto_154111 ?auto_154110 ) ( ON ?auto_154112 ?auto_154111 ) ( ON ?auto_154113 ?auto_154112 ) ( ON ?auto_154114 ?auto_154113 ) ( ON ?auto_154115 ?auto_154114 ) ( ON ?auto_154116 ?auto_154115 ) ( ON ?auto_154117 ?auto_154116 ) ( not ( = ?auto_154109 ?auto_154110 ) ) ( not ( = ?auto_154109 ?auto_154111 ) ) ( not ( = ?auto_154109 ?auto_154112 ) ) ( not ( = ?auto_154109 ?auto_154113 ) ) ( not ( = ?auto_154109 ?auto_154114 ) ) ( not ( = ?auto_154109 ?auto_154115 ) ) ( not ( = ?auto_154109 ?auto_154116 ) ) ( not ( = ?auto_154109 ?auto_154117 ) ) ( not ( = ?auto_154109 ?auto_154118 ) ) ( not ( = ?auto_154109 ?auto_154119 ) ) ( not ( = ?auto_154110 ?auto_154111 ) ) ( not ( = ?auto_154110 ?auto_154112 ) ) ( not ( = ?auto_154110 ?auto_154113 ) ) ( not ( = ?auto_154110 ?auto_154114 ) ) ( not ( = ?auto_154110 ?auto_154115 ) ) ( not ( = ?auto_154110 ?auto_154116 ) ) ( not ( = ?auto_154110 ?auto_154117 ) ) ( not ( = ?auto_154110 ?auto_154118 ) ) ( not ( = ?auto_154110 ?auto_154119 ) ) ( not ( = ?auto_154111 ?auto_154112 ) ) ( not ( = ?auto_154111 ?auto_154113 ) ) ( not ( = ?auto_154111 ?auto_154114 ) ) ( not ( = ?auto_154111 ?auto_154115 ) ) ( not ( = ?auto_154111 ?auto_154116 ) ) ( not ( = ?auto_154111 ?auto_154117 ) ) ( not ( = ?auto_154111 ?auto_154118 ) ) ( not ( = ?auto_154111 ?auto_154119 ) ) ( not ( = ?auto_154112 ?auto_154113 ) ) ( not ( = ?auto_154112 ?auto_154114 ) ) ( not ( = ?auto_154112 ?auto_154115 ) ) ( not ( = ?auto_154112 ?auto_154116 ) ) ( not ( = ?auto_154112 ?auto_154117 ) ) ( not ( = ?auto_154112 ?auto_154118 ) ) ( not ( = ?auto_154112 ?auto_154119 ) ) ( not ( = ?auto_154113 ?auto_154114 ) ) ( not ( = ?auto_154113 ?auto_154115 ) ) ( not ( = ?auto_154113 ?auto_154116 ) ) ( not ( = ?auto_154113 ?auto_154117 ) ) ( not ( = ?auto_154113 ?auto_154118 ) ) ( not ( = ?auto_154113 ?auto_154119 ) ) ( not ( = ?auto_154114 ?auto_154115 ) ) ( not ( = ?auto_154114 ?auto_154116 ) ) ( not ( = ?auto_154114 ?auto_154117 ) ) ( not ( = ?auto_154114 ?auto_154118 ) ) ( not ( = ?auto_154114 ?auto_154119 ) ) ( not ( = ?auto_154115 ?auto_154116 ) ) ( not ( = ?auto_154115 ?auto_154117 ) ) ( not ( = ?auto_154115 ?auto_154118 ) ) ( not ( = ?auto_154115 ?auto_154119 ) ) ( not ( = ?auto_154116 ?auto_154117 ) ) ( not ( = ?auto_154116 ?auto_154118 ) ) ( not ( = ?auto_154116 ?auto_154119 ) ) ( not ( = ?auto_154117 ?auto_154118 ) ) ( not ( = ?auto_154117 ?auto_154119 ) ) ( not ( = ?auto_154118 ?auto_154119 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154118 ?auto_154119 )
      ( !STACK ?auto_154118 ?auto_154117 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_154151 - BLOCK
      ?auto_154152 - BLOCK
      ?auto_154153 - BLOCK
      ?auto_154154 - BLOCK
      ?auto_154155 - BLOCK
      ?auto_154156 - BLOCK
      ?auto_154157 - BLOCK
      ?auto_154158 - BLOCK
      ?auto_154159 - BLOCK
      ?auto_154160 - BLOCK
    )
    :vars
    (
      ?auto_154161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154160 ?auto_154161 ) ( ON-TABLE ?auto_154151 ) ( ON ?auto_154152 ?auto_154151 ) ( ON ?auto_154153 ?auto_154152 ) ( ON ?auto_154154 ?auto_154153 ) ( ON ?auto_154155 ?auto_154154 ) ( ON ?auto_154156 ?auto_154155 ) ( ON ?auto_154157 ?auto_154156 ) ( ON ?auto_154158 ?auto_154157 ) ( not ( = ?auto_154151 ?auto_154152 ) ) ( not ( = ?auto_154151 ?auto_154153 ) ) ( not ( = ?auto_154151 ?auto_154154 ) ) ( not ( = ?auto_154151 ?auto_154155 ) ) ( not ( = ?auto_154151 ?auto_154156 ) ) ( not ( = ?auto_154151 ?auto_154157 ) ) ( not ( = ?auto_154151 ?auto_154158 ) ) ( not ( = ?auto_154151 ?auto_154159 ) ) ( not ( = ?auto_154151 ?auto_154160 ) ) ( not ( = ?auto_154151 ?auto_154161 ) ) ( not ( = ?auto_154152 ?auto_154153 ) ) ( not ( = ?auto_154152 ?auto_154154 ) ) ( not ( = ?auto_154152 ?auto_154155 ) ) ( not ( = ?auto_154152 ?auto_154156 ) ) ( not ( = ?auto_154152 ?auto_154157 ) ) ( not ( = ?auto_154152 ?auto_154158 ) ) ( not ( = ?auto_154152 ?auto_154159 ) ) ( not ( = ?auto_154152 ?auto_154160 ) ) ( not ( = ?auto_154152 ?auto_154161 ) ) ( not ( = ?auto_154153 ?auto_154154 ) ) ( not ( = ?auto_154153 ?auto_154155 ) ) ( not ( = ?auto_154153 ?auto_154156 ) ) ( not ( = ?auto_154153 ?auto_154157 ) ) ( not ( = ?auto_154153 ?auto_154158 ) ) ( not ( = ?auto_154153 ?auto_154159 ) ) ( not ( = ?auto_154153 ?auto_154160 ) ) ( not ( = ?auto_154153 ?auto_154161 ) ) ( not ( = ?auto_154154 ?auto_154155 ) ) ( not ( = ?auto_154154 ?auto_154156 ) ) ( not ( = ?auto_154154 ?auto_154157 ) ) ( not ( = ?auto_154154 ?auto_154158 ) ) ( not ( = ?auto_154154 ?auto_154159 ) ) ( not ( = ?auto_154154 ?auto_154160 ) ) ( not ( = ?auto_154154 ?auto_154161 ) ) ( not ( = ?auto_154155 ?auto_154156 ) ) ( not ( = ?auto_154155 ?auto_154157 ) ) ( not ( = ?auto_154155 ?auto_154158 ) ) ( not ( = ?auto_154155 ?auto_154159 ) ) ( not ( = ?auto_154155 ?auto_154160 ) ) ( not ( = ?auto_154155 ?auto_154161 ) ) ( not ( = ?auto_154156 ?auto_154157 ) ) ( not ( = ?auto_154156 ?auto_154158 ) ) ( not ( = ?auto_154156 ?auto_154159 ) ) ( not ( = ?auto_154156 ?auto_154160 ) ) ( not ( = ?auto_154156 ?auto_154161 ) ) ( not ( = ?auto_154157 ?auto_154158 ) ) ( not ( = ?auto_154157 ?auto_154159 ) ) ( not ( = ?auto_154157 ?auto_154160 ) ) ( not ( = ?auto_154157 ?auto_154161 ) ) ( not ( = ?auto_154158 ?auto_154159 ) ) ( not ( = ?auto_154158 ?auto_154160 ) ) ( not ( = ?auto_154158 ?auto_154161 ) ) ( not ( = ?auto_154159 ?auto_154160 ) ) ( not ( = ?auto_154159 ?auto_154161 ) ) ( not ( = ?auto_154160 ?auto_154161 ) ) ( CLEAR ?auto_154158 ) ( ON ?auto_154159 ?auto_154160 ) ( CLEAR ?auto_154159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_154151 ?auto_154152 ?auto_154153 ?auto_154154 ?auto_154155 ?auto_154156 ?auto_154157 ?auto_154158 ?auto_154159 )
      ( MAKE-10PILE ?auto_154151 ?auto_154152 ?auto_154153 ?auto_154154 ?auto_154155 ?auto_154156 ?auto_154157 ?auto_154158 ?auto_154159 ?auto_154160 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_154193 - BLOCK
      ?auto_154194 - BLOCK
      ?auto_154195 - BLOCK
      ?auto_154196 - BLOCK
      ?auto_154197 - BLOCK
      ?auto_154198 - BLOCK
      ?auto_154199 - BLOCK
      ?auto_154200 - BLOCK
      ?auto_154201 - BLOCK
      ?auto_154202 - BLOCK
    )
    :vars
    (
      ?auto_154203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154202 ?auto_154203 ) ( ON-TABLE ?auto_154193 ) ( ON ?auto_154194 ?auto_154193 ) ( ON ?auto_154195 ?auto_154194 ) ( ON ?auto_154196 ?auto_154195 ) ( ON ?auto_154197 ?auto_154196 ) ( ON ?auto_154198 ?auto_154197 ) ( ON ?auto_154199 ?auto_154198 ) ( not ( = ?auto_154193 ?auto_154194 ) ) ( not ( = ?auto_154193 ?auto_154195 ) ) ( not ( = ?auto_154193 ?auto_154196 ) ) ( not ( = ?auto_154193 ?auto_154197 ) ) ( not ( = ?auto_154193 ?auto_154198 ) ) ( not ( = ?auto_154193 ?auto_154199 ) ) ( not ( = ?auto_154193 ?auto_154200 ) ) ( not ( = ?auto_154193 ?auto_154201 ) ) ( not ( = ?auto_154193 ?auto_154202 ) ) ( not ( = ?auto_154193 ?auto_154203 ) ) ( not ( = ?auto_154194 ?auto_154195 ) ) ( not ( = ?auto_154194 ?auto_154196 ) ) ( not ( = ?auto_154194 ?auto_154197 ) ) ( not ( = ?auto_154194 ?auto_154198 ) ) ( not ( = ?auto_154194 ?auto_154199 ) ) ( not ( = ?auto_154194 ?auto_154200 ) ) ( not ( = ?auto_154194 ?auto_154201 ) ) ( not ( = ?auto_154194 ?auto_154202 ) ) ( not ( = ?auto_154194 ?auto_154203 ) ) ( not ( = ?auto_154195 ?auto_154196 ) ) ( not ( = ?auto_154195 ?auto_154197 ) ) ( not ( = ?auto_154195 ?auto_154198 ) ) ( not ( = ?auto_154195 ?auto_154199 ) ) ( not ( = ?auto_154195 ?auto_154200 ) ) ( not ( = ?auto_154195 ?auto_154201 ) ) ( not ( = ?auto_154195 ?auto_154202 ) ) ( not ( = ?auto_154195 ?auto_154203 ) ) ( not ( = ?auto_154196 ?auto_154197 ) ) ( not ( = ?auto_154196 ?auto_154198 ) ) ( not ( = ?auto_154196 ?auto_154199 ) ) ( not ( = ?auto_154196 ?auto_154200 ) ) ( not ( = ?auto_154196 ?auto_154201 ) ) ( not ( = ?auto_154196 ?auto_154202 ) ) ( not ( = ?auto_154196 ?auto_154203 ) ) ( not ( = ?auto_154197 ?auto_154198 ) ) ( not ( = ?auto_154197 ?auto_154199 ) ) ( not ( = ?auto_154197 ?auto_154200 ) ) ( not ( = ?auto_154197 ?auto_154201 ) ) ( not ( = ?auto_154197 ?auto_154202 ) ) ( not ( = ?auto_154197 ?auto_154203 ) ) ( not ( = ?auto_154198 ?auto_154199 ) ) ( not ( = ?auto_154198 ?auto_154200 ) ) ( not ( = ?auto_154198 ?auto_154201 ) ) ( not ( = ?auto_154198 ?auto_154202 ) ) ( not ( = ?auto_154198 ?auto_154203 ) ) ( not ( = ?auto_154199 ?auto_154200 ) ) ( not ( = ?auto_154199 ?auto_154201 ) ) ( not ( = ?auto_154199 ?auto_154202 ) ) ( not ( = ?auto_154199 ?auto_154203 ) ) ( not ( = ?auto_154200 ?auto_154201 ) ) ( not ( = ?auto_154200 ?auto_154202 ) ) ( not ( = ?auto_154200 ?auto_154203 ) ) ( not ( = ?auto_154201 ?auto_154202 ) ) ( not ( = ?auto_154201 ?auto_154203 ) ) ( not ( = ?auto_154202 ?auto_154203 ) ) ( ON ?auto_154201 ?auto_154202 ) ( CLEAR ?auto_154199 ) ( ON ?auto_154200 ?auto_154201 ) ( CLEAR ?auto_154200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154193 ?auto_154194 ?auto_154195 ?auto_154196 ?auto_154197 ?auto_154198 ?auto_154199 ?auto_154200 )
      ( MAKE-10PILE ?auto_154193 ?auto_154194 ?auto_154195 ?auto_154196 ?auto_154197 ?auto_154198 ?auto_154199 ?auto_154200 ?auto_154201 ?auto_154202 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_154235 - BLOCK
      ?auto_154236 - BLOCK
      ?auto_154237 - BLOCK
      ?auto_154238 - BLOCK
      ?auto_154239 - BLOCK
      ?auto_154240 - BLOCK
      ?auto_154241 - BLOCK
      ?auto_154242 - BLOCK
      ?auto_154243 - BLOCK
      ?auto_154244 - BLOCK
    )
    :vars
    (
      ?auto_154245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154244 ?auto_154245 ) ( ON-TABLE ?auto_154235 ) ( ON ?auto_154236 ?auto_154235 ) ( ON ?auto_154237 ?auto_154236 ) ( ON ?auto_154238 ?auto_154237 ) ( ON ?auto_154239 ?auto_154238 ) ( ON ?auto_154240 ?auto_154239 ) ( not ( = ?auto_154235 ?auto_154236 ) ) ( not ( = ?auto_154235 ?auto_154237 ) ) ( not ( = ?auto_154235 ?auto_154238 ) ) ( not ( = ?auto_154235 ?auto_154239 ) ) ( not ( = ?auto_154235 ?auto_154240 ) ) ( not ( = ?auto_154235 ?auto_154241 ) ) ( not ( = ?auto_154235 ?auto_154242 ) ) ( not ( = ?auto_154235 ?auto_154243 ) ) ( not ( = ?auto_154235 ?auto_154244 ) ) ( not ( = ?auto_154235 ?auto_154245 ) ) ( not ( = ?auto_154236 ?auto_154237 ) ) ( not ( = ?auto_154236 ?auto_154238 ) ) ( not ( = ?auto_154236 ?auto_154239 ) ) ( not ( = ?auto_154236 ?auto_154240 ) ) ( not ( = ?auto_154236 ?auto_154241 ) ) ( not ( = ?auto_154236 ?auto_154242 ) ) ( not ( = ?auto_154236 ?auto_154243 ) ) ( not ( = ?auto_154236 ?auto_154244 ) ) ( not ( = ?auto_154236 ?auto_154245 ) ) ( not ( = ?auto_154237 ?auto_154238 ) ) ( not ( = ?auto_154237 ?auto_154239 ) ) ( not ( = ?auto_154237 ?auto_154240 ) ) ( not ( = ?auto_154237 ?auto_154241 ) ) ( not ( = ?auto_154237 ?auto_154242 ) ) ( not ( = ?auto_154237 ?auto_154243 ) ) ( not ( = ?auto_154237 ?auto_154244 ) ) ( not ( = ?auto_154237 ?auto_154245 ) ) ( not ( = ?auto_154238 ?auto_154239 ) ) ( not ( = ?auto_154238 ?auto_154240 ) ) ( not ( = ?auto_154238 ?auto_154241 ) ) ( not ( = ?auto_154238 ?auto_154242 ) ) ( not ( = ?auto_154238 ?auto_154243 ) ) ( not ( = ?auto_154238 ?auto_154244 ) ) ( not ( = ?auto_154238 ?auto_154245 ) ) ( not ( = ?auto_154239 ?auto_154240 ) ) ( not ( = ?auto_154239 ?auto_154241 ) ) ( not ( = ?auto_154239 ?auto_154242 ) ) ( not ( = ?auto_154239 ?auto_154243 ) ) ( not ( = ?auto_154239 ?auto_154244 ) ) ( not ( = ?auto_154239 ?auto_154245 ) ) ( not ( = ?auto_154240 ?auto_154241 ) ) ( not ( = ?auto_154240 ?auto_154242 ) ) ( not ( = ?auto_154240 ?auto_154243 ) ) ( not ( = ?auto_154240 ?auto_154244 ) ) ( not ( = ?auto_154240 ?auto_154245 ) ) ( not ( = ?auto_154241 ?auto_154242 ) ) ( not ( = ?auto_154241 ?auto_154243 ) ) ( not ( = ?auto_154241 ?auto_154244 ) ) ( not ( = ?auto_154241 ?auto_154245 ) ) ( not ( = ?auto_154242 ?auto_154243 ) ) ( not ( = ?auto_154242 ?auto_154244 ) ) ( not ( = ?auto_154242 ?auto_154245 ) ) ( not ( = ?auto_154243 ?auto_154244 ) ) ( not ( = ?auto_154243 ?auto_154245 ) ) ( not ( = ?auto_154244 ?auto_154245 ) ) ( ON ?auto_154243 ?auto_154244 ) ( ON ?auto_154242 ?auto_154243 ) ( CLEAR ?auto_154240 ) ( ON ?auto_154241 ?auto_154242 ) ( CLEAR ?auto_154241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154235 ?auto_154236 ?auto_154237 ?auto_154238 ?auto_154239 ?auto_154240 ?auto_154241 )
      ( MAKE-10PILE ?auto_154235 ?auto_154236 ?auto_154237 ?auto_154238 ?auto_154239 ?auto_154240 ?auto_154241 ?auto_154242 ?auto_154243 ?auto_154244 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_154277 - BLOCK
      ?auto_154278 - BLOCK
      ?auto_154279 - BLOCK
      ?auto_154280 - BLOCK
      ?auto_154281 - BLOCK
      ?auto_154282 - BLOCK
      ?auto_154283 - BLOCK
      ?auto_154284 - BLOCK
      ?auto_154285 - BLOCK
      ?auto_154286 - BLOCK
    )
    :vars
    (
      ?auto_154287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154286 ?auto_154287 ) ( ON-TABLE ?auto_154277 ) ( ON ?auto_154278 ?auto_154277 ) ( ON ?auto_154279 ?auto_154278 ) ( ON ?auto_154280 ?auto_154279 ) ( ON ?auto_154281 ?auto_154280 ) ( not ( = ?auto_154277 ?auto_154278 ) ) ( not ( = ?auto_154277 ?auto_154279 ) ) ( not ( = ?auto_154277 ?auto_154280 ) ) ( not ( = ?auto_154277 ?auto_154281 ) ) ( not ( = ?auto_154277 ?auto_154282 ) ) ( not ( = ?auto_154277 ?auto_154283 ) ) ( not ( = ?auto_154277 ?auto_154284 ) ) ( not ( = ?auto_154277 ?auto_154285 ) ) ( not ( = ?auto_154277 ?auto_154286 ) ) ( not ( = ?auto_154277 ?auto_154287 ) ) ( not ( = ?auto_154278 ?auto_154279 ) ) ( not ( = ?auto_154278 ?auto_154280 ) ) ( not ( = ?auto_154278 ?auto_154281 ) ) ( not ( = ?auto_154278 ?auto_154282 ) ) ( not ( = ?auto_154278 ?auto_154283 ) ) ( not ( = ?auto_154278 ?auto_154284 ) ) ( not ( = ?auto_154278 ?auto_154285 ) ) ( not ( = ?auto_154278 ?auto_154286 ) ) ( not ( = ?auto_154278 ?auto_154287 ) ) ( not ( = ?auto_154279 ?auto_154280 ) ) ( not ( = ?auto_154279 ?auto_154281 ) ) ( not ( = ?auto_154279 ?auto_154282 ) ) ( not ( = ?auto_154279 ?auto_154283 ) ) ( not ( = ?auto_154279 ?auto_154284 ) ) ( not ( = ?auto_154279 ?auto_154285 ) ) ( not ( = ?auto_154279 ?auto_154286 ) ) ( not ( = ?auto_154279 ?auto_154287 ) ) ( not ( = ?auto_154280 ?auto_154281 ) ) ( not ( = ?auto_154280 ?auto_154282 ) ) ( not ( = ?auto_154280 ?auto_154283 ) ) ( not ( = ?auto_154280 ?auto_154284 ) ) ( not ( = ?auto_154280 ?auto_154285 ) ) ( not ( = ?auto_154280 ?auto_154286 ) ) ( not ( = ?auto_154280 ?auto_154287 ) ) ( not ( = ?auto_154281 ?auto_154282 ) ) ( not ( = ?auto_154281 ?auto_154283 ) ) ( not ( = ?auto_154281 ?auto_154284 ) ) ( not ( = ?auto_154281 ?auto_154285 ) ) ( not ( = ?auto_154281 ?auto_154286 ) ) ( not ( = ?auto_154281 ?auto_154287 ) ) ( not ( = ?auto_154282 ?auto_154283 ) ) ( not ( = ?auto_154282 ?auto_154284 ) ) ( not ( = ?auto_154282 ?auto_154285 ) ) ( not ( = ?auto_154282 ?auto_154286 ) ) ( not ( = ?auto_154282 ?auto_154287 ) ) ( not ( = ?auto_154283 ?auto_154284 ) ) ( not ( = ?auto_154283 ?auto_154285 ) ) ( not ( = ?auto_154283 ?auto_154286 ) ) ( not ( = ?auto_154283 ?auto_154287 ) ) ( not ( = ?auto_154284 ?auto_154285 ) ) ( not ( = ?auto_154284 ?auto_154286 ) ) ( not ( = ?auto_154284 ?auto_154287 ) ) ( not ( = ?auto_154285 ?auto_154286 ) ) ( not ( = ?auto_154285 ?auto_154287 ) ) ( not ( = ?auto_154286 ?auto_154287 ) ) ( ON ?auto_154285 ?auto_154286 ) ( ON ?auto_154284 ?auto_154285 ) ( ON ?auto_154283 ?auto_154284 ) ( CLEAR ?auto_154281 ) ( ON ?auto_154282 ?auto_154283 ) ( CLEAR ?auto_154282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154277 ?auto_154278 ?auto_154279 ?auto_154280 ?auto_154281 ?auto_154282 )
      ( MAKE-10PILE ?auto_154277 ?auto_154278 ?auto_154279 ?auto_154280 ?auto_154281 ?auto_154282 ?auto_154283 ?auto_154284 ?auto_154285 ?auto_154286 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_154319 - BLOCK
      ?auto_154320 - BLOCK
      ?auto_154321 - BLOCK
      ?auto_154322 - BLOCK
      ?auto_154323 - BLOCK
      ?auto_154324 - BLOCK
      ?auto_154325 - BLOCK
      ?auto_154326 - BLOCK
      ?auto_154327 - BLOCK
      ?auto_154328 - BLOCK
    )
    :vars
    (
      ?auto_154329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154328 ?auto_154329 ) ( ON-TABLE ?auto_154319 ) ( ON ?auto_154320 ?auto_154319 ) ( ON ?auto_154321 ?auto_154320 ) ( ON ?auto_154322 ?auto_154321 ) ( not ( = ?auto_154319 ?auto_154320 ) ) ( not ( = ?auto_154319 ?auto_154321 ) ) ( not ( = ?auto_154319 ?auto_154322 ) ) ( not ( = ?auto_154319 ?auto_154323 ) ) ( not ( = ?auto_154319 ?auto_154324 ) ) ( not ( = ?auto_154319 ?auto_154325 ) ) ( not ( = ?auto_154319 ?auto_154326 ) ) ( not ( = ?auto_154319 ?auto_154327 ) ) ( not ( = ?auto_154319 ?auto_154328 ) ) ( not ( = ?auto_154319 ?auto_154329 ) ) ( not ( = ?auto_154320 ?auto_154321 ) ) ( not ( = ?auto_154320 ?auto_154322 ) ) ( not ( = ?auto_154320 ?auto_154323 ) ) ( not ( = ?auto_154320 ?auto_154324 ) ) ( not ( = ?auto_154320 ?auto_154325 ) ) ( not ( = ?auto_154320 ?auto_154326 ) ) ( not ( = ?auto_154320 ?auto_154327 ) ) ( not ( = ?auto_154320 ?auto_154328 ) ) ( not ( = ?auto_154320 ?auto_154329 ) ) ( not ( = ?auto_154321 ?auto_154322 ) ) ( not ( = ?auto_154321 ?auto_154323 ) ) ( not ( = ?auto_154321 ?auto_154324 ) ) ( not ( = ?auto_154321 ?auto_154325 ) ) ( not ( = ?auto_154321 ?auto_154326 ) ) ( not ( = ?auto_154321 ?auto_154327 ) ) ( not ( = ?auto_154321 ?auto_154328 ) ) ( not ( = ?auto_154321 ?auto_154329 ) ) ( not ( = ?auto_154322 ?auto_154323 ) ) ( not ( = ?auto_154322 ?auto_154324 ) ) ( not ( = ?auto_154322 ?auto_154325 ) ) ( not ( = ?auto_154322 ?auto_154326 ) ) ( not ( = ?auto_154322 ?auto_154327 ) ) ( not ( = ?auto_154322 ?auto_154328 ) ) ( not ( = ?auto_154322 ?auto_154329 ) ) ( not ( = ?auto_154323 ?auto_154324 ) ) ( not ( = ?auto_154323 ?auto_154325 ) ) ( not ( = ?auto_154323 ?auto_154326 ) ) ( not ( = ?auto_154323 ?auto_154327 ) ) ( not ( = ?auto_154323 ?auto_154328 ) ) ( not ( = ?auto_154323 ?auto_154329 ) ) ( not ( = ?auto_154324 ?auto_154325 ) ) ( not ( = ?auto_154324 ?auto_154326 ) ) ( not ( = ?auto_154324 ?auto_154327 ) ) ( not ( = ?auto_154324 ?auto_154328 ) ) ( not ( = ?auto_154324 ?auto_154329 ) ) ( not ( = ?auto_154325 ?auto_154326 ) ) ( not ( = ?auto_154325 ?auto_154327 ) ) ( not ( = ?auto_154325 ?auto_154328 ) ) ( not ( = ?auto_154325 ?auto_154329 ) ) ( not ( = ?auto_154326 ?auto_154327 ) ) ( not ( = ?auto_154326 ?auto_154328 ) ) ( not ( = ?auto_154326 ?auto_154329 ) ) ( not ( = ?auto_154327 ?auto_154328 ) ) ( not ( = ?auto_154327 ?auto_154329 ) ) ( not ( = ?auto_154328 ?auto_154329 ) ) ( ON ?auto_154327 ?auto_154328 ) ( ON ?auto_154326 ?auto_154327 ) ( ON ?auto_154325 ?auto_154326 ) ( ON ?auto_154324 ?auto_154325 ) ( CLEAR ?auto_154322 ) ( ON ?auto_154323 ?auto_154324 ) ( CLEAR ?auto_154323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154319 ?auto_154320 ?auto_154321 ?auto_154322 ?auto_154323 )
      ( MAKE-10PILE ?auto_154319 ?auto_154320 ?auto_154321 ?auto_154322 ?auto_154323 ?auto_154324 ?auto_154325 ?auto_154326 ?auto_154327 ?auto_154328 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_154361 - BLOCK
      ?auto_154362 - BLOCK
      ?auto_154363 - BLOCK
      ?auto_154364 - BLOCK
      ?auto_154365 - BLOCK
      ?auto_154366 - BLOCK
      ?auto_154367 - BLOCK
      ?auto_154368 - BLOCK
      ?auto_154369 - BLOCK
      ?auto_154370 - BLOCK
    )
    :vars
    (
      ?auto_154371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154370 ?auto_154371 ) ( ON-TABLE ?auto_154361 ) ( ON ?auto_154362 ?auto_154361 ) ( ON ?auto_154363 ?auto_154362 ) ( not ( = ?auto_154361 ?auto_154362 ) ) ( not ( = ?auto_154361 ?auto_154363 ) ) ( not ( = ?auto_154361 ?auto_154364 ) ) ( not ( = ?auto_154361 ?auto_154365 ) ) ( not ( = ?auto_154361 ?auto_154366 ) ) ( not ( = ?auto_154361 ?auto_154367 ) ) ( not ( = ?auto_154361 ?auto_154368 ) ) ( not ( = ?auto_154361 ?auto_154369 ) ) ( not ( = ?auto_154361 ?auto_154370 ) ) ( not ( = ?auto_154361 ?auto_154371 ) ) ( not ( = ?auto_154362 ?auto_154363 ) ) ( not ( = ?auto_154362 ?auto_154364 ) ) ( not ( = ?auto_154362 ?auto_154365 ) ) ( not ( = ?auto_154362 ?auto_154366 ) ) ( not ( = ?auto_154362 ?auto_154367 ) ) ( not ( = ?auto_154362 ?auto_154368 ) ) ( not ( = ?auto_154362 ?auto_154369 ) ) ( not ( = ?auto_154362 ?auto_154370 ) ) ( not ( = ?auto_154362 ?auto_154371 ) ) ( not ( = ?auto_154363 ?auto_154364 ) ) ( not ( = ?auto_154363 ?auto_154365 ) ) ( not ( = ?auto_154363 ?auto_154366 ) ) ( not ( = ?auto_154363 ?auto_154367 ) ) ( not ( = ?auto_154363 ?auto_154368 ) ) ( not ( = ?auto_154363 ?auto_154369 ) ) ( not ( = ?auto_154363 ?auto_154370 ) ) ( not ( = ?auto_154363 ?auto_154371 ) ) ( not ( = ?auto_154364 ?auto_154365 ) ) ( not ( = ?auto_154364 ?auto_154366 ) ) ( not ( = ?auto_154364 ?auto_154367 ) ) ( not ( = ?auto_154364 ?auto_154368 ) ) ( not ( = ?auto_154364 ?auto_154369 ) ) ( not ( = ?auto_154364 ?auto_154370 ) ) ( not ( = ?auto_154364 ?auto_154371 ) ) ( not ( = ?auto_154365 ?auto_154366 ) ) ( not ( = ?auto_154365 ?auto_154367 ) ) ( not ( = ?auto_154365 ?auto_154368 ) ) ( not ( = ?auto_154365 ?auto_154369 ) ) ( not ( = ?auto_154365 ?auto_154370 ) ) ( not ( = ?auto_154365 ?auto_154371 ) ) ( not ( = ?auto_154366 ?auto_154367 ) ) ( not ( = ?auto_154366 ?auto_154368 ) ) ( not ( = ?auto_154366 ?auto_154369 ) ) ( not ( = ?auto_154366 ?auto_154370 ) ) ( not ( = ?auto_154366 ?auto_154371 ) ) ( not ( = ?auto_154367 ?auto_154368 ) ) ( not ( = ?auto_154367 ?auto_154369 ) ) ( not ( = ?auto_154367 ?auto_154370 ) ) ( not ( = ?auto_154367 ?auto_154371 ) ) ( not ( = ?auto_154368 ?auto_154369 ) ) ( not ( = ?auto_154368 ?auto_154370 ) ) ( not ( = ?auto_154368 ?auto_154371 ) ) ( not ( = ?auto_154369 ?auto_154370 ) ) ( not ( = ?auto_154369 ?auto_154371 ) ) ( not ( = ?auto_154370 ?auto_154371 ) ) ( ON ?auto_154369 ?auto_154370 ) ( ON ?auto_154368 ?auto_154369 ) ( ON ?auto_154367 ?auto_154368 ) ( ON ?auto_154366 ?auto_154367 ) ( ON ?auto_154365 ?auto_154366 ) ( CLEAR ?auto_154363 ) ( ON ?auto_154364 ?auto_154365 ) ( CLEAR ?auto_154364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154361 ?auto_154362 ?auto_154363 ?auto_154364 )
      ( MAKE-10PILE ?auto_154361 ?auto_154362 ?auto_154363 ?auto_154364 ?auto_154365 ?auto_154366 ?auto_154367 ?auto_154368 ?auto_154369 ?auto_154370 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_154403 - BLOCK
      ?auto_154404 - BLOCK
      ?auto_154405 - BLOCK
      ?auto_154406 - BLOCK
      ?auto_154407 - BLOCK
      ?auto_154408 - BLOCK
      ?auto_154409 - BLOCK
      ?auto_154410 - BLOCK
      ?auto_154411 - BLOCK
      ?auto_154412 - BLOCK
    )
    :vars
    (
      ?auto_154413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154412 ?auto_154413 ) ( ON-TABLE ?auto_154403 ) ( ON ?auto_154404 ?auto_154403 ) ( not ( = ?auto_154403 ?auto_154404 ) ) ( not ( = ?auto_154403 ?auto_154405 ) ) ( not ( = ?auto_154403 ?auto_154406 ) ) ( not ( = ?auto_154403 ?auto_154407 ) ) ( not ( = ?auto_154403 ?auto_154408 ) ) ( not ( = ?auto_154403 ?auto_154409 ) ) ( not ( = ?auto_154403 ?auto_154410 ) ) ( not ( = ?auto_154403 ?auto_154411 ) ) ( not ( = ?auto_154403 ?auto_154412 ) ) ( not ( = ?auto_154403 ?auto_154413 ) ) ( not ( = ?auto_154404 ?auto_154405 ) ) ( not ( = ?auto_154404 ?auto_154406 ) ) ( not ( = ?auto_154404 ?auto_154407 ) ) ( not ( = ?auto_154404 ?auto_154408 ) ) ( not ( = ?auto_154404 ?auto_154409 ) ) ( not ( = ?auto_154404 ?auto_154410 ) ) ( not ( = ?auto_154404 ?auto_154411 ) ) ( not ( = ?auto_154404 ?auto_154412 ) ) ( not ( = ?auto_154404 ?auto_154413 ) ) ( not ( = ?auto_154405 ?auto_154406 ) ) ( not ( = ?auto_154405 ?auto_154407 ) ) ( not ( = ?auto_154405 ?auto_154408 ) ) ( not ( = ?auto_154405 ?auto_154409 ) ) ( not ( = ?auto_154405 ?auto_154410 ) ) ( not ( = ?auto_154405 ?auto_154411 ) ) ( not ( = ?auto_154405 ?auto_154412 ) ) ( not ( = ?auto_154405 ?auto_154413 ) ) ( not ( = ?auto_154406 ?auto_154407 ) ) ( not ( = ?auto_154406 ?auto_154408 ) ) ( not ( = ?auto_154406 ?auto_154409 ) ) ( not ( = ?auto_154406 ?auto_154410 ) ) ( not ( = ?auto_154406 ?auto_154411 ) ) ( not ( = ?auto_154406 ?auto_154412 ) ) ( not ( = ?auto_154406 ?auto_154413 ) ) ( not ( = ?auto_154407 ?auto_154408 ) ) ( not ( = ?auto_154407 ?auto_154409 ) ) ( not ( = ?auto_154407 ?auto_154410 ) ) ( not ( = ?auto_154407 ?auto_154411 ) ) ( not ( = ?auto_154407 ?auto_154412 ) ) ( not ( = ?auto_154407 ?auto_154413 ) ) ( not ( = ?auto_154408 ?auto_154409 ) ) ( not ( = ?auto_154408 ?auto_154410 ) ) ( not ( = ?auto_154408 ?auto_154411 ) ) ( not ( = ?auto_154408 ?auto_154412 ) ) ( not ( = ?auto_154408 ?auto_154413 ) ) ( not ( = ?auto_154409 ?auto_154410 ) ) ( not ( = ?auto_154409 ?auto_154411 ) ) ( not ( = ?auto_154409 ?auto_154412 ) ) ( not ( = ?auto_154409 ?auto_154413 ) ) ( not ( = ?auto_154410 ?auto_154411 ) ) ( not ( = ?auto_154410 ?auto_154412 ) ) ( not ( = ?auto_154410 ?auto_154413 ) ) ( not ( = ?auto_154411 ?auto_154412 ) ) ( not ( = ?auto_154411 ?auto_154413 ) ) ( not ( = ?auto_154412 ?auto_154413 ) ) ( ON ?auto_154411 ?auto_154412 ) ( ON ?auto_154410 ?auto_154411 ) ( ON ?auto_154409 ?auto_154410 ) ( ON ?auto_154408 ?auto_154409 ) ( ON ?auto_154407 ?auto_154408 ) ( ON ?auto_154406 ?auto_154407 ) ( CLEAR ?auto_154404 ) ( ON ?auto_154405 ?auto_154406 ) ( CLEAR ?auto_154405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154403 ?auto_154404 ?auto_154405 )
      ( MAKE-10PILE ?auto_154403 ?auto_154404 ?auto_154405 ?auto_154406 ?auto_154407 ?auto_154408 ?auto_154409 ?auto_154410 ?auto_154411 ?auto_154412 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_154445 - BLOCK
      ?auto_154446 - BLOCK
      ?auto_154447 - BLOCK
      ?auto_154448 - BLOCK
      ?auto_154449 - BLOCK
      ?auto_154450 - BLOCK
      ?auto_154451 - BLOCK
      ?auto_154452 - BLOCK
      ?auto_154453 - BLOCK
      ?auto_154454 - BLOCK
    )
    :vars
    (
      ?auto_154455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154454 ?auto_154455 ) ( ON-TABLE ?auto_154445 ) ( not ( = ?auto_154445 ?auto_154446 ) ) ( not ( = ?auto_154445 ?auto_154447 ) ) ( not ( = ?auto_154445 ?auto_154448 ) ) ( not ( = ?auto_154445 ?auto_154449 ) ) ( not ( = ?auto_154445 ?auto_154450 ) ) ( not ( = ?auto_154445 ?auto_154451 ) ) ( not ( = ?auto_154445 ?auto_154452 ) ) ( not ( = ?auto_154445 ?auto_154453 ) ) ( not ( = ?auto_154445 ?auto_154454 ) ) ( not ( = ?auto_154445 ?auto_154455 ) ) ( not ( = ?auto_154446 ?auto_154447 ) ) ( not ( = ?auto_154446 ?auto_154448 ) ) ( not ( = ?auto_154446 ?auto_154449 ) ) ( not ( = ?auto_154446 ?auto_154450 ) ) ( not ( = ?auto_154446 ?auto_154451 ) ) ( not ( = ?auto_154446 ?auto_154452 ) ) ( not ( = ?auto_154446 ?auto_154453 ) ) ( not ( = ?auto_154446 ?auto_154454 ) ) ( not ( = ?auto_154446 ?auto_154455 ) ) ( not ( = ?auto_154447 ?auto_154448 ) ) ( not ( = ?auto_154447 ?auto_154449 ) ) ( not ( = ?auto_154447 ?auto_154450 ) ) ( not ( = ?auto_154447 ?auto_154451 ) ) ( not ( = ?auto_154447 ?auto_154452 ) ) ( not ( = ?auto_154447 ?auto_154453 ) ) ( not ( = ?auto_154447 ?auto_154454 ) ) ( not ( = ?auto_154447 ?auto_154455 ) ) ( not ( = ?auto_154448 ?auto_154449 ) ) ( not ( = ?auto_154448 ?auto_154450 ) ) ( not ( = ?auto_154448 ?auto_154451 ) ) ( not ( = ?auto_154448 ?auto_154452 ) ) ( not ( = ?auto_154448 ?auto_154453 ) ) ( not ( = ?auto_154448 ?auto_154454 ) ) ( not ( = ?auto_154448 ?auto_154455 ) ) ( not ( = ?auto_154449 ?auto_154450 ) ) ( not ( = ?auto_154449 ?auto_154451 ) ) ( not ( = ?auto_154449 ?auto_154452 ) ) ( not ( = ?auto_154449 ?auto_154453 ) ) ( not ( = ?auto_154449 ?auto_154454 ) ) ( not ( = ?auto_154449 ?auto_154455 ) ) ( not ( = ?auto_154450 ?auto_154451 ) ) ( not ( = ?auto_154450 ?auto_154452 ) ) ( not ( = ?auto_154450 ?auto_154453 ) ) ( not ( = ?auto_154450 ?auto_154454 ) ) ( not ( = ?auto_154450 ?auto_154455 ) ) ( not ( = ?auto_154451 ?auto_154452 ) ) ( not ( = ?auto_154451 ?auto_154453 ) ) ( not ( = ?auto_154451 ?auto_154454 ) ) ( not ( = ?auto_154451 ?auto_154455 ) ) ( not ( = ?auto_154452 ?auto_154453 ) ) ( not ( = ?auto_154452 ?auto_154454 ) ) ( not ( = ?auto_154452 ?auto_154455 ) ) ( not ( = ?auto_154453 ?auto_154454 ) ) ( not ( = ?auto_154453 ?auto_154455 ) ) ( not ( = ?auto_154454 ?auto_154455 ) ) ( ON ?auto_154453 ?auto_154454 ) ( ON ?auto_154452 ?auto_154453 ) ( ON ?auto_154451 ?auto_154452 ) ( ON ?auto_154450 ?auto_154451 ) ( ON ?auto_154449 ?auto_154450 ) ( ON ?auto_154448 ?auto_154449 ) ( ON ?auto_154447 ?auto_154448 ) ( CLEAR ?auto_154445 ) ( ON ?auto_154446 ?auto_154447 ) ( CLEAR ?auto_154446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154445 ?auto_154446 )
      ( MAKE-10PILE ?auto_154445 ?auto_154446 ?auto_154447 ?auto_154448 ?auto_154449 ?auto_154450 ?auto_154451 ?auto_154452 ?auto_154453 ?auto_154454 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_154487 - BLOCK
      ?auto_154488 - BLOCK
      ?auto_154489 - BLOCK
      ?auto_154490 - BLOCK
      ?auto_154491 - BLOCK
      ?auto_154492 - BLOCK
      ?auto_154493 - BLOCK
      ?auto_154494 - BLOCK
      ?auto_154495 - BLOCK
      ?auto_154496 - BLOCK
    )
    :vars
    (
      ?auto_154497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154496 ?auto_154497 ) ( not ( = ?auto_154487 ?auto_154488 ) ) ( not ( = ?auto_154487 ?auto_154489 ) ) ( not ( = ?auto_154487 ?auto_154490 ) ) ( not ( = ?auto_154487 ?auto_154491 ) ) ( not ( = ?auto_154487 ?auto_154492 ) ) ( not ( = ?auto_154487 ?auto_154493 ) ) ( not ( = ?auto_154487 ?auto_154494 ) ) ( not ( = ?auto_154487 ?auto_154495 ) ) ( not ( = ?auto_154487 ?auto_154496 ) ) ( not ( = ?auto_154487 ?auto_154497 ) ) ( not ( = ?auto_154488 ?auto_154489 ) ) ( not ( = ?auto_154488 ?auto_154490 ) ) ( not ( = ?auto_154488 ?auto_154491 ) ) ( not ( = ?auto_154488 ?auto_154492 ) ) ( not ( = ?auto_154488 ?auto_154493 ) ) ( not ( = ?auto_154488 ?auto_154494 ) ) ( not ( = ?auto_154488 ?auto_154495 ) ) ( not ( = ?auto_154488 ?auto_154496 ) ) ( not ( = ?auto_154488 ?auto_154497 ) ) ( not ( = ?auto_154489 ?auto_154490 ) ) ( not ( = ?auto_154489 ?auto_154491 ) ) ( not ( = ?auto_154489 ?auto_154492 ) ) ( not ( = ?auto_154489 ?auto_154493 ) ) ( not ( = ?auto_154489 ?auto_154494 ) ) ( not ( = ?auto_154489 ?auto_154495 ) ) ( not ( = ?auto_154489 ?auto_154496 ) ) ( not ( = ?auto_154489 ?auto_154497 ) ) ( not ( = ?auto_154490 ?auto_154491 ) ) ( not ( = ?auto_154490 ?auto_154492 ) ) ( not ( = ?auto_154490 ?auto_154493 ) ) ( not ( = ?auto_154490 ?auto_154494 ) ) ( not ( = ?auto_154490 ?auto_154495 ) ) ( not ( = ?auto_154490 ?auto_154496 ) ) ( not ( = ?auto_154490 ?auto_154497 ) ) ( not ( = ?auto_154491 ?auto_154492 ) ) ( not ( = ?auto_154491 ?auto_154493 ) ) ( not ( = ?auto_154491 ?auto_154494 ) ) ( not ( = ?auto_154491 ?auto_154495 ) ) ( not ( = ?auto_154491 ?auto_154496 ) ) ( not ( = ?auto_154491 ?auto_154497 ) ) ( not ( = ?auto_154492 ?auto_154493 ) ) ( not ( = ?auto_154492 ?auto_154494 ) ) ( not ( = ?auto_154492 ?auto_154495 ) ) ( not ( = ?auto_154492 ?auto_154496 ) ) ( not ( = ?auto_154492 ?auto_154497 ) ) ( not ( = ?auto_154493 ?auto_154494 ) ) ( not ( = ?auto_154493 ?auto_154495 ) ) ( not ( = ?auto_154493 ?auto_154496 ) ) ( not ( = ?auto_154493 ?auto_154497 ) ) ( not ( = ?auto_154494 ?auto_154495 ) ) ( not ( = ?auto_154494 ?auto_154496 ) ) ( not ( = ?auto_154494 ?auto_154497 ) ) ( not ( = ?auto_154495 ?auto_154496 ) ) ( not ( = ?auto_154495 ?auto_154497 ) ) ( not ( = ?auto_154496 ?auto_154497 ) ) ( ON ?auto_154495 ?auto_154496 ) ( ON ?auto_154494 ?auto_154495 ) ( ON ?auto_154493 ?auto_154494 ) ( ON ?auto_154492 ?auto_154493 ) ( ON ?auto_154491 ?auto_154492 ) ( ON ?auto_154490 ?auto_154491 ) ( ON ?auto_154489 ?auto_154490 ) ( ON ?auto_154488 ?auto_154489 ) ( ON ?auto_154487 ?auto_154488 ) ( CLEAR ?auto_154487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154487 )
      ( MAKE-10PILE ?auto_154487 ?auto_154488 ?auto_154489 ?auto_154490 ?auto_154491 ?auto_154492 ?auto_154493 ?auto_154494 ?auto_154495 ?auto_154496 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_154530 - BLOCK
      ?auto_154531 - BLOCK
      ?auto_154532 - BLOCK
      ?auto_154533 - BLOCK
      ?auto_154534 - BLOCK
      ?auto_154535 - BLOCK
      ?auto_154536 - BLOCK
      ?auto_154537 - BLOCK
      ?auto_154538 - BLOCK
      ?auto_154539 - BLOCK
      ?auto_154540 - BLOCK
    )
    :vars
    (
      ?auto_154541 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154539 ) ( ON ?auto_154540 ?auto_154541 ) ( CLEAR ?auto_154540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154530 ) ( ON ?auto_154531 ?auto_154530 ) ( ON ?auto_154532 ?auto_154531 ) ( ON ?auto_154533 ?auto_154532 ) ( ON ?auto_154534 ?auto_154533 ) ( ON ?auto_154535 ?auto_154534 ) ( ON ?auto_154536 ?auto_154535 ) ( ON ?auto_154537 ?auto_154536 ) ( ON ?auto_154538 ?auto_154537 ) ( ON ?auto_154539 ?auto_154538 ) ( not ( = ?auto_154530 ?auto_154531 ) ) ( not ( = ?auto_154530 ?auto_154532 ) ) ( not ( = ?auto_154530 ?auto_154533 ) ) ( not ( = ?auto_154530 ?auto_154534 ) ) ( not ( = ?auto_154530 ?auto_154535 ) ) ( not ( = ?auto_154530 ?auto_154536 ) ) ( not ( = ?auto_154530 ?auto_154537 ) ) ( not ( = ?auto_154530 ?auto_154538 ) ) ( not ( = ?auto_154530 ?auto_154539 ) ) ( not ( = ?auto_154530 ?auto_154540 ) ) ( not ( = ?auto_154530 ?auto_154541 ) ) ( not ( = ?auto_154531 ?auto_154532 ) ) ( not ( = ?auto_154531 ?auto_154533 ) ) ( not ( = ?auto_154531 ?auto_154534 ) ) ( not ( = ?auto_154531 ?auto_154535 ) ) ( not ( = ?auto_154531 ?auto_154536 ) ) ( not ( = ?auto_154531 ?auto_154537 ) ) ( not ( = ?auto_154531 ?auto_154538 ) ) ( not ( = ?auto_154531 ?auto_154539 ) ) ( not ( = ?auto_154531 ?auto_154540 ) ) ( not ( = ?auto_154531 ?auto_154541 ) ) ( not ( = ?auto_154532 ?auto_154533 ) ) ( not ( = ?auto_154532 ?auto_154534 ) ) ( not ( = ?auto_154532 ?auto_154535 ) ) ( not ( = ?auto_154532 ?auto_154536 ) ) ( not ( = ?auto_154532 ?auto_154537 ) ) ( not ( = ?auto_154532 ?auto_154538 ) ) ( not ( = ?auto_154532 ?auto_154539 ) ) ( not ( = ?auto_154532 ?auto_154540 ) ) ( not ( = ?auto_154532 ?auto_154541 ) ) ( not ( = ?auto_154533 ?auto_154534 ) ) ( not ( = ?auto_154533 ?auto_154535 ) ) ( not ( = ?auto_154533 ?auto_154536 ) ) ( not ( = ?auto_154533 ?auto_154537 ) ) ( not ( = ?auto_154533 ?auto_154538 ) ) ( not ( = ?auto_154533 ?auto_154539 ) ) ( not ( = ?auto_154533 ?auto_154540 ) ) ( not ( = ?auto_154533 ?auto_154541 ) ) ( not ( = ?auto_154534 ?auto_154535 ) ) ( not ( = ?auto_154534 ?auto_154536 ) ) ( not ( = ?auto_154534 ?auto_154537 ) ) ( not ( = ?auto_154534 ?auto_154538 ) ) ( not ( = ?auto_154534 ?auto_154539 ) ) ( not ( = ?auto_154534 ?auto_154540 ) ) ( not ( = ?auto_154534 ?auto_154541 ) ) ( not ( = ?auto_154535 ?auto_154536 ) ) ( not ( = ?auto_154535 ?auto_154537 ) ) ( not ( = ?auto_154535 ?auto_154538 ) ) ( not ( = ?auto_154535 ?auto_154539 ) ) ( not ( = ?auto_154535 ?auto_154540 ) ) ( not ( = ?auto_154535 ?auto_154541 ) ) ( not ( = ?auto_154536 ?auto_154537 ) ) ( not ( = ?auto_154536 ?auto_154538 ) ) ( not ( = ?auto_154536 ?auto_154539 ) ) ( not ( = ?auto_154536 ?auto_154540 ) ) ( not ( = ?auto_154536 ?auto_154541 ) ) ( not ( = ?auto_154537 ?auto_154538 ) ) ( not ( = ?auto_154537 ?auto_154539 ) ) ( not ( = ?auto_154537 ?auto_154540 ) ) ( not ( = ?auto_154537 ?auto_154541 ) ) ( not ( = ?auto_154538 ?auto_154539 ) ) ( not ( = ?auto_154538 ?auto_154540 ) ) ( not ( = ?auto_154538 ?auto_154541 ) ) ( not ( = ?auto_154539 ?auto_154540 ) ) ( not ( = ?auto_154539 ?auto_154541 ) ) ( not ( = ?auto_154540 ?auto_154541 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154540 ?auto_154541 )
      ( !STACK ?auto_154540 ?auto_154539 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_154576 - BLOCK
      ?auto_154577 - BLOCK
      ?auto_154578 - BLOCK
      ?auto_154579 - BLOCK
      ?auto_154580 - BLOCK
      ?auto_154581 - BLOCK
      ?auto_154582 - BLOCK
      ?auto_154583 - BLOCK
      ?auto_154584 - BLOCK
      ?auto_154585 - BLOCK
      ?auto_154586 - BLOCK
    )
    :vars
    (
      ?auto_154587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154586 ?auto_154587 ) ( ON-TABLE ?auto_154576 ) ( ON ?auto_154577 ?auto_154576 ) ( ON ?auto_154578 ?auto_154577 ) ( ON ?auto_154579 ?auto_154578 ) ( ON ?auto_154580 ?auto_154579 ) ( ON ?auto_154581 ?auto_154580 ) ( ON ?auto_154582 ?auto_154581 ) ( ON ?auto_154583 ?auto_154582 ) ( ON ?auto_154584 ?auto_154583 ) ( not ( = ?auto_154576 ?auto_154577 ) ) ( not ( = ?auto_154576 ?auto_154578 ) ) ( not ( = ?auto_154576 ?auto_154579 ) ) ( not ( = ?auto_154576 ?auto_154580 ) ) ( not ( = ?auto_154576 ?auto_154581 ) ) ( not ( = ?auto_154576 ?auto_154582 ) ) ( not ( = ?auto_154576 ?auto_154583 ) ) ( not ( = ?auto_154576 ?auto_154584 ) ) ( not ( = ?auto_154576 ?auto_154585 ) ) ( not ( = ?auto_154576 ?auto_154586 ) ) ( not ( = ?auto_154576 ?auto_154587 ) ) ( not ( = ?auto_154577 ?auto_154578 ) ) ( not ( = ?auto_154577 ?auto_154579 ) ) ( not ( = ?auto_154577 ?auto_154580 ) ) ( not ( = ?auto_154577 ?auto_154581 ) ) ( not ( = ?auto_154577 ?auto_154582 ) ) ( not ( = ?auto_154577 ?auto_154583 ) ) ( not ( = ?auto_154577 ?auto_154584 ) ) ( not ( = ?auto_154577 ?auto_154585 ) ) ( not ( = ?auto_154577 ?auto_154586 ) ) ( not ( = ?auto_154577 ?auto_154587 ) ) ( not ( = ?auto_154578 ?auto_154579 ) ) ( not ( = ?auto_154578 ?auto_154580 ) ) ( not ( = ?auto_154578 ?auto_154581 ) ) ( not ( = ?auto_154578 ?auto_154582 ) ) ( not ( = ?auto_154578 ?auto_154583 ) ) ( not ( = ?auto_154578 ?auto_154584 ) ) ( not ( = ?auto_154578 ?auto_154585 ) ) ( not ( = ?auto_154578 ?auto_154586 ) ) ( not ( = ?auto_154578 ?auto_154587 ) ) ( not ( = ?auto_154579 ?auto_154580 ) ) ( not ( = ?auto_154579 ?auto_154581 ) ) ( not ( = ?auto_154579 ?auto_154582 ) ) ( not ( = ?auto_154579 ?auto_154583 ) ) ( not ( = ?auto_154579 ?auto_154584 ) ) ( not ( = ?auto_154579 ?auto_154585 ) ) ( not ( = ?auto_154579 ?auto_154586 ) ) ( not ( = ?auto_154579 ?auto_154587 ) ) ( not ( = ?auto_154580 ?auto_154581 ) ) ( not ( = ?auto_154580 ?auto_154582 ) ) ( not ( = ?auto_154580 ?auto_154583 ) ) ( not ( = ?auto_154580 ?auto_154584 ) ) ( not ( = ?auto_154580 ?auto_154585 ) ) ( not ( = ?auto_154580 ?auto_154586 ) ) ( not ( = ?auto_154580 ?auto_154587 ) ) ( not ( = ?auto_154581 ?auto_154582 ) ) ( not ( = ?auto_154581 ?auto_154583 ) ) ( not ( = ?auto_154581 ?auto_154584 ) ) ( not ( = ?auto_154581 ?auto_154585 ) ) ( not ( = ?auto_154581 ?auto_154586 ) ) ( not ( = ?auto_154581 ?auto_154587 ) ) ( not ( = ?auto_154582 ?auto_154583 ) ) ( not ( = ?auto_154582 ?auto_154584 ) ) ( not ( = ?auto_154582 ?auto_154585 ) ) ( not ( = ?auto_154582 ?auto_154586 ) ) ( not ( = ?auto_154582 ?auto_154587 ) ) ( not ( = ?auto_154583 ?auto_154584 ) ) ( not ( = ?auto_154583 ?auto_154585 ) ) ( not ( = ?auto_154583 ?auto_154586 ) ) ( not ( = ?auto_154583 ?auto_154587 ) ) ( not ( = ?auto_154584 ?auto_154585 ) ) ( not ( = ?auto_154584 ?auto_154586 ) ) ( not ( = ?auto_154584 ?auto_154587 ) ) ( not ( = ?auto_154585 ?auto_154586 ) ) ( not ( = ?auto_154585 ?auto_154587 ) ) ( not ( = ?auto_154586 ?auto_154587 ) ) ( CLEAR ?auto_154584 ) ( ON ?auto_154585 ?auto_154586 ) ( CLEAR ?auto_154585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_154576 ?auto_154577 ?auto_154578 ?auto_154579 ?auto_154580 ?auto_154581 ?auto_154582 ?auto_154583 ?auto_154584 ?auto_154585 )
      ( MAKE-11PILE ?auto_154576 ?auto_154577 ?auto_154578 ?auto_154579 ?auto_154580 ?auto_154581 ?auto_154582 ?auto_154583 ?auto_154584 ?auto_154585 ?auto_154586 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_154622 - BLOCK
      ?auto_154623 - BLOCK
      ?auto_154624 - BLOCK
      ?auto_154625 - BLOCK
      ?auto_154626 - BLOCK
      ?auto_154627 - BLOCK
      ?auto_154628 - BLOCK
      ?auto_154629 - BLOCK
      ?auto_154630 - BLOCK
      ?auto_154631 - BLOCK
      ?auto_154632 - BLOCK
    )
    :vars
    (
      ?auto_154633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154632 ?auto_154633 ) ( ON-TABLE ?auto_154622 ) ( ON ?auto_154623 ?auto_154622 ) ( ON ?auto_154624 ?auto_154623 ) ( ON ?auto_154625 ?auto_154624 ) ( ON ?auto_154626 ?auto_154625 ) ( ON ?auto_154627 ?auto_154626 ) ( ON ?auto_154628 ?auto_154627 ) ( ON ?auto_154629 ?auto_154628 ) ( not ( = ?auto_154622 ?auto_154623 ) ) ( not ( = ?auto_154622 ?auto_154624 ) ) ( not ( = ?auto_154622 ?auto_154625 ) ) ( not ( = ?auto_154622 ?auto_154626 ) ) ( not ( = ?auto_154622 ?auto_154627 ) ) ( not ( = ?auto_154622 ?auto_154628 ) ) ( not ( = ?auto_154622 ?auto_154629 ) ) ( not ( = ?auto_154622 ?auto_154630 ) ) ( not ( = ?auto_154622 ?auto_154631 ) ) ( not ( = ?auto_154622 ?auto_154632 ) ) ( not ( = ?auto_154622 ?auto_154633 ) ) ( not ( = ?auto_154623 ?auto_154624 ) ) ( not ( = ?auto_154623 ?auto_154625 ) ) ( not ( = ?auto_154623 ?auto_154626 ) ) ( not ( = ?auto_154623 ?auto_154627 ) ) ( not ( = ?auto_154623 ?auto_154628 ) ) ( not ( = ?auto_154623 ?auto_154629 ) ) ( not ( = ?auto_154623 ?auto_154630 ) ) ( not ( = ?auto_154623 ?auto_154631 ) ) ( not ( = ?auto_154623 ?auto_154632 ) ) ( not ( = ?auto_154623 ?auto_154633 ) ) ( not ( = ?auto_154624 ?auto_154625 ) ) ( not ( = ?auto_154624 ?auto_154626 ) ) ( not ( = ?auto_154624 ?auto_154627 ) ) ( not ( = ?auto_154624 ?auto_154628 ) ) ( not ( = ?auto_154624 ?auto_154629 ) ) ( not ( = ?auto_154624 ?auto_154630 ) ) ( not ( = ?auto_154624 ?auto_154631 ) ) ( not ( = ?auto_154624 ?auto_154632 ) ) ( not ( = ?auto_154624 ?auto_154633 ) ) ( not ( = ?auto_154625 ?auto_154626 ) ) ( not ( = ?auto_154625 ?auto_154627 ) ) ( not ( = ?auto_154625 ?auto_154628 ) ) ( not ( = ?auto_154625 ?auto_154629 ) ) ( not ( = ?auto_154625 ?auto_154630 ) ) ( not ( = ?auto_154625 ?auto_154631 ) ) ( not ( = ?auto_154625 ?auto_154632 ) ) ( not ( = ?auto_154625 ?auto_154633 ) ) ( not ( = ?auto_154626 ?auto_154627 ) ) ( not ( = ?auto_154626 ?auto_154628 ) ) ( not ( = ?auto_154626 ?auto_154629 ) ) ( not ( = ?auto_154626 ?auto_154630 ) ) ( not ( = ?auto_154626 ?auto_154631 ) ) ( not ( = ?auto_154626 ?auto_154632 ) ) ( not ( = ?auto_154626 ?auto_154633 ) ) ( not ( = ?auto_154627 ?auto_154628 ) ) ( not ( = ?auto_154627 ?auto_154629 ) ) ( not ( = ?auto_154627 ?auto_154630 ) ) ( not ( = ?auto_154627 ?auto_154631 ) ) ( not ( = ?auto_154627 ?auto_154632 ) ) ( not ( = ?auto_154627 ?auto_154633 ) ) ( not ( = ?auto_154628 ?auto_154629 ) ) ( not ( = ?auto_154628 ?auto_154630 ) ) ( not ( = ?auto_154628 ?auto_154631 ) ) ( not ( = ?auto_154628 ?auto_154632 ) ) ( not ( = ?auto_154628 ?auto_154633 ) ) ( not ( = ?auto_154629 ?auto_154630 ) ) ( not ( = ?auto_154629 ?auto_154631 ) ) ( not ( = ?auto_154629 ?auto_154632 ) ) ( not ( = ?auto_154629 ?auto_154633 ) ) ( not ( = ?auto_154630 ?auto_154631 ) ) ( not ( = ?auto_154630 ?auto_154632 ) ) ( not ( = ?auto_154630 ?auto_154633 ) ) ( not ( = ?auto_154631 ?auto_154632 ) ) ( not ( = ?auto_154631 ?auto_154633 ) ) ( not ( = ?auto_154632 ?auto_154633 ) ) ( ON ?auto_154631 ?auto_154632 ) ( CLEAR ?auto_154629 ) ( ON ?auto_154630 ?auto_154631 ) ( CLEAR ?auto_154630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_154622 ?auto_154623 ?auto_154624 ?auto_154625 ?auto_154626 ?auto_154627 ?auto_154628 ?auto_154629 ?auto_154630 )
      ( MAKE-11PILE ?auto_154622 ?auto_154623 ?auto_154624 ?auto_154625 ?auto_154626 ?auto_154627 ?auto_154628 ?auto_154629 ?auto_154630 ?auto_154631 ?auto_154632 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_154668 - BLOCK
      ?auto_154669 - BLOCK
      ?auto_154670 - BLOCK
      ?auto_154671 - BLOCK
      ?auto_154672 - BLOCK
      ?auto_154673 - BLOCK
      ?auto_154674 - BLOCK
      ?auto_154675 - BLOCK
      ?auto_154676 - BLOCK
      ?auto_154677 - BLOCK
      ?auto_154678 - BLOCK
    )
    :vars
    (
      ?auto_154679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154678 ?auto_154679 ) ( ON-TABLE ?auto_154668 ) ( ON ?auto_154669 ?auto_154668 ) ( ON ?auto_154670 ?auto_154669 ) ( ON ?auto_154671 ?auto_154670 ) ( ON ?auto_154672 ?auto_154671 ) ( ON ?auto_154673 ?auto_154672 ) ( ON ?auto_154674 ?auto_154673 ) ( not ( = ?auto_154668 ?auto_154669 ) ) ( not ( = ?auto_154668 ?auto_154670 ) ) ( not ( = ?auto_154668 ?auto_154671 ) ) ( not ( = ?auto_154668 ?auto_154672 ) ) ( not ( = ?auto_154668 ?auto_154673 ) ) ( not ( = ?auto_154668 ?auto_154674 ) ) ( not ( = ?auto_154668 ?auto_154675 ) ) ( not ( = ?auto_154668 ?auto_154676 ) ) ( not ( = ?auto_154668 ?auto_154677 ) ) ( not ( = ?auto_154668 ?auto_154678 ) ) ( not ( = ?auto_154668 ?auto_154679 ) ) ( not ( = ?auto_154669 ?auto_154670 ) ) ( not ( = ?auto_154669 ?auto_154671 ) ) ( not ( = ?auto_154669 ?auto_154672 ) ) ( not ( = ?auto_154669 ?auto_154673 ) ) ( not ( = ?auto_154669 ?auto_154674 ) ) ( not ( = ?auto_154669 ?auto_154675 ) ) ( not ( = ?auto_154669 ?auto_154676 ) ) ( not ( = ?auto_154669 ?auto_154677 ) ) ( not ( = ?auto_154669 ?auto_154678 ) ) ( not ( = ?auto_154669 ?auto_154679 ) ) ( not ( = ?auto_154670 ?auto_154671 ) ) ( not ( = ?auto_154670 ?auto_154672 ) ) ( not ( = ?auto_154670 ?auto_154673 ) ) ( not ( = ?auto_154670 ?auto_154674 ) ) ( not ( = ?auto_154670 ?auto_154675 ) ) ( not ( = ?auto_154670 ?auto_154676 ) ) ( not ( = ?auto_154670 ?auto_154677 ) ) ( not ( = ?auto_154670 ?auto_154678 ) ) ( not ( = ?auto_154670 ?auto_154679 ) ) ( not ( = ?auto_154671 ?auto_154672 ) ) ( not ( = ?auto_154671 ?auto_154673 ) ) ( not ( = ?auto_154671 ?auto_154674 ) ) ( not ( = ?auto_154671 ?auto_154675 ) ) ( not ( = ?auto_154671 ?auto_154676 ) ) ( not ( = ?auto_154671 ?auto_154677 ) ) ( not ( = ?auto_154671 ?auto_154678 ) ) ( not ( = ?auto_154671 ?auto_154679 ) ) ( not ( = ?auto_154672 ?auto_154673 ) ) ( not ( = ?auto_154672 ?auto_154674 ) ) ( not ( = ?auto_154672 ?auto_154675 ) ) ( not ( = ?auto_154672 ?auto_154676 ) ) ( not ( = ?auto_154672 ?auto_154677 ) ) ( not ( = ?auto_154672 ?auto_154678 ) ) ( not ( = ?auto_154672 ?auto_154679 ) ) ( not ( = ?auto_154673 ?auto_154674 ) ) ( not ( = ?auto_154673 ?auto_154675 ) ) ( not ( = ?auto_154673 ?auto_154676 ) ) ( not ( = ?auto_154673 ?auto_154677 ) ) ( not ( = ?auto_154673 ?auto_154678 ) ) ( not ( = ?auto_154673 ?auto_154679 ) ) ( not ( = ?auto_154674 ?auto_154675 ) ) ( not ( = ?auto_154674 ?auto_154676 ) ) ( not ( = ?auto_154674 ?auto_154677 ) ) ( not ( = ?auto_154674 ?auto_154678 ) ) ( not ( = ?auto_154674 ?auto_154679 ) ) ( not ( = ?auto_154675 ?auto_154676 ) ) ( not ( = ?auto_154675 ?auto_154677 ) ) ( not ( = ?auto_154675 ?auto_154678 ) ) ( not ( = ?auto_154675 ?auto_154679 ) ) ( not ( = ?auto_154676 ?auto_154677 ) ) ( not ( = ?auto_154676 ?auto_154678 ) ) ( not ( = ?auto_154676 ?auto_154679 ) ) ( not ( = ?auto_154677 ?auto_154678 ) ) ( not ( = ?auto_154677 ?auto_154679 ) ) ( not ( = ?auto_154678 ?auto_154679 ) ) ( ON ?auto_154677 ?auto_154678 ) ( ON ?auto_154676 ?auto_154677 ) ( CLEAR ?auto_154674 ) ( ON ?auto_154675 ?auto_154676 ) ( CLEAR ?auto_154675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154668 ?auto_154669 ?auto_154670 ?auto_154671 ?auto_154672 ?auto_154673 ?auto_154674 ?auto_154675 )
      ( MAKE-11PILE ?auto_154668 ?auto_154669 ?auto_154670 ?auto_154671 ?auto_154672 ?auto_154673 ?auto_154674 ?auto_154675 ?auto_154676 ?auto_154677 ?auto_154678 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_154714 - BLOCK
      ?auto_154715 - BLOCK
      ?auto_154716 - BLOCK
      ?auto_154717 - BLOCK
      ?auto_154718 - BLOCK
      ?auto_154719 - BLOCK
      ?auto_154720 - BLOCK
      ?auto_154721 - BLOCK
      ?auto_154722 - BLOCK
      ?auto_154723 - BLOCK
      ?auto_154724 - BLOCK
    )
    :vars
    (
      ?auto_154725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154724 ?auto_154725 ) ( ON-TABLE ?auto_154714 ) ( ON ?auto_154715 ?auto_154714 ) ( ON ?auto_154716 ?auto_154715 ) ( ON ?auto_154717 ?auto_154716 ) ( ON ?auto_154718 ?auto_154717 ) ( ON ?auto_154719 ?auto_154718 ) ( not ( = ?auto_154714 ?auto_154715 ) ) ( not ( = ?auto_154714 ?auto_154716 ) ) ( not ( = ?auto_154714 ?auto_154717 ) ) ( not ( = ?auto_154714 ?auto_154718 ) ) ( not ( = ?auto_154714 ?auto_154719 ) ) ( not ( = ?auto_154714 ?auto_154720 ) ) ( not ( = ?auto_154714 ?auto_154721 ) ) ( not ( = ?auto_154714 ?auto_154722 ) ) ( not ( = ?auto_154714 ?auto_154723 ) ) ( not ( = ?auto_154714 ?auto_154724 ) ) ( not ( = ?auto_154714 ?auto_154725 ) ) ( not ( = ?auto_154715 ?auto_154716 ) ) ( not ( = ?auto_154715 ?auto_154717 ) ) ( not ( = ?auto_154715 ?auto_154718 ) ) ( not ( = ?auto_154715 ?auto_154719 ) ) ( not ( = ?auto_154715 ?auto_154720 ) ) ( not ( = ?auto_154715 ?auto_154721 ) ) ( not ( = ?auto_154715 ?auto_154722 ) ) ( not ( = ?auto_154715 ?auto_154723 ) ) ( not ( = ?auto_154715 ?auto_154724 ) ) ( not ( = ?auto_154715 ?auto_154725 ) ) ( not ( = ?auto_154716 ?auto_154717 ) ) ( not ( = ?auto_154716 ?auto_154718 ) ) ( not ( = ?auto_154716 ?auto_154719 ) ) ( not ( = ?auto_154716 ?auto_154720 ) ) ( not ( = ?auto_154716 ?auto_154721 ) ) ( not ( = ?auto_154716 ?auto_154722 ) ) ( not ( = ?auto_154716 ?auto_154723 ) ) ( not ( = ?auto_154716 ?auto_154724 ) ) ( not ( = ?auto_154716 ?auto_154725 ) ) ( not ( = ?auto_154717 ?auto_154718 ) ) ( not ( = ?auto_154717 ?auto_154719 ) ) ( not ( = ?auto_154717 ?auto_154720 ) ) ( not ( = ?auto_154717 ?auto_154721 ) ) ( not ( = ?auto_154717 ?auto_154722 ) ) ( not ( = ?auto_154717 ?auto_154723 ) ) ( not ( = ?auto_154717 ?auto_154724 ) ) ( not ( = ?auto_154717 ?auto_154725 ) ) ( not ( = ?auto_154718 ?auto_154719 ) ) ( not ( = ?auto_154718 ?auto_154720 ) ) ( not ( = ?auto_154718 ?auto_154721 ) ) ( not ( = ?auto_154718 ?auto_154722 ) ) ( not ( = ?auto_154718 ?auto_154723 ) ) ( not ( = ?auto_154718 ?auto_154724 ) ) ( not ( = ?auto_154718 ?auto_154725 ) ) ( not ( = ?auto_154719 ?auto_154720 ) ) ( not ( = ?auto_154719 ?auto_154721 ) ) ( not ( = ?auto_154719 ?auto_154722 ) ) ( not ( = ?auto_154719 ?auto_154723 ) ) ( not ( = ?auto_154719 ?auto_154724 ) ) ( not ( = ?auto_154719 ?auto_154725 ) ) ( not ( = ?auto_154720 ?auto_154721 ) ) ( not ( = ?auto_154720 ?auto_154722 ) ) ( not ( = ?auto_154720 ?auto_154723 ) ) ( not ( = ?auto_154720 ?auto_154724 ) ) ( not ( = ?auto_154720 ?auto_154725 ) ) ( not ( = ?auto_154721 ?auto_154722 ) ) ( not ( = ?auto_154721 ?auto_154723 ) ) ( not ( = ?auto_154721 ?auto_154724 ) ) ( not ( = ?auto_154721 ?auto_154725 ) ) ( not ( = ?auto_154722 ?auto_154723 ) ) ( not ( = ?auto_154722 ?auto_154724 ) ) ( not ( = ?auto_154722 ?auto_154725 ) ) ( not ( = ?auto_154723 ?auto_154724 ) ) ( not ( = ?auto_154723 ?auto_154725 ) ) ( not ( = ?auto_154724 ?auto_154725 ) ) ( ON ?auto_154723 ?auto_154724 ) ( ON ?auto_154722 ?auto_154723 ) ( ON ?auto_154721 ?auto_154722 ) ( CLEAR ?auto_154719 ) ( ON ?auto_154720 ?auto_154721 ) ( CLEAR ?auto_154720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154714 ?auto_154715 ?auto_154716 ?auto_154717 ?auto_154718 ?auto_154719 ?auto_154720 )
      ( MAKE-11PILE ?auto_154714 ?auto_154715 ?auto_154716 ?auto_154717 ?auto_154718 ?auto_154719 ?auto_154720 ?auto_154721 ?auto_154722 ?auto_154723 ?auto_154724 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_154760 - BLOCK
      ?auto_154761 - BLOCK
      ?auto_154762 - BLOCK
      ?auto_154763 - BLOCK
      ?auto_154764 - BLOCK
      ?auto_154765 - BLOCK
      ?auto_154766 - BLOCK
      ?auto_154767 - BLOCK
      ?auto_154768 - BLOCK
      ?auto_154769 - BLOCK
      ?auto_154770 - BLOCK
    )
    :vars
    (
      ?auto_154771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154770 ?auto_154771 ) ( ON-TABLE ?auto_154760 ) ( ON ?auto_154761 ?auto_154760 ) ( ON ?auto_154762 ?auto_154761 ) ( ON ?auto_154763 ?auto_154762 ) ( ON ?auto_154764 ?auto_154763 ) ( not ( = ?auto_154760 ?auto_154761 ) ) ( not ( = ?auto_154760 ?auto_154762 ) ) ( not ( = ?auto_154760 ?auto_154763 ) ) ( not ( = ?auto_154760 ?auto_154764 ) ) ( not ( = ?auto_154760 ?auto_154765 ) ) ( not ( = ?auto_154760 ?auto_154766 ) ) ( not ( = ?auto_154760 ?auto_154767 ) ) ( not ( = ?auto_154760 ?auto_154768 ) ) ( not ( = ?auto_154760 ?auto_154769 ) ) ( not ( = ?auto_154760 ?auto_154770 ) ) ( not ( = ?auto_154760 ?auto_154771 ) ) ( not ( = ?auto_154761 ?auto_154762 ) ) ( not ( = ?auto_154761 ?auto_154763 ) ) ( not ( = ?auto_154761 ?auto_154764 ) ) ( not ( = ?auto_154761 ?auto_154765 ) ) ( not ( = ?auto_154761 ?auto_154766 ) ) ( not ( = ?auto_154761 ?auto_154767 ) ) ( not ( = ?auto_154761 ?auto_154768 ) ) ( not ( = ?auto_154761 ?auto_154769 ) ) ( not ( = ?auto_154761 ?auto_154770 ) ) ( not ( = ?auto_154761 ?auto_154771 ) ) ( not ( = ?auto_154762 ?auto_154763 ) ) ( not ( = ?auto_154762 ?auto_154764 ) ) ( not ( = ?auto_154762 ?auto_154765 ) ) ( not ( = ?auto_154762 ?auto_154766 ) ) ( not ( = ?auto_154762 ?auto_154767 ) ) ( not ( = ?auto_154762 ?auto_154768 ) ) ( not ( = ?auto_154762 ?auto_154769 ) ) ( not ( = ?auto_154762 ?auto_154770 ) ) ( not ( = ?auto_154762 ?auto_154771 ) ) ( not ( = ?auto_154763 ?auto_154764 ) ) ( not ( = ?auto_154763 ?auto_154765 ) ) ( not ( = ?auto_154763 ?auto_154766 ) ) ( not ( = ?auto_154763 ?auto_154767 ) ) ( not ( = ?auto_154763 ?auto_154768 ) ) ( not ( = ?auto_154763 ?auto_154769 ) ) ( not ( = ?auto_154763 ?auto_154770 ) ) ( not ( = ?auto_154763 ?auto_154771 ) ) ( not ( = ?auto_154764 ?auto_154765 ) ) ( not ( = ?auto_154764 ?auto_154766 ) ) ( not ( = ?auto_154764 ?auto_154767 ) ) ( not ( = ?auto_154764 ?auto_154768 ) ) ( not ( = ?auto_154764 ?auto_154769 ) ) ( not ( = ?auto_154764 ?auto_154770 ) ) ( not ( = ?auto_154764 ?auto_154771 ) ) ( not ( = ?auto_154765 ?auto_154766 ) ) ( not ( = ?auto_154765 ?auto_154767 ) ) ( not ( = ?auto_154765 ?auto_154768 ) ) ( not ( = ?auto_154765 ?auto_154769 ) ) ( not ( = ?auto_154765 ?auto_154770 ) ) ( not ( = ?auto_154765 ?auto_154771 ) ) ( not ( = ?auto_154766 ?auto_154767 ) ) ( not ( = ?auto_154766 ?auto_154768 ) ) ( not ( = ?auto_154766 ?auto_154769 ) ) ( not ( = ?auto_154766 ?auto_154770 ) ) ( not ( = ?auto_154766 ?auto_154771 ) ) ( not ( = ?auto_154767 ?auto_154768 ) ) ( not ( = ?auto_154767 ?auto_154769 ) ) ( not ( = ?auto_154767 ?auto_154770 ) ) ( not ( = ?auto_154767 ?auto_154771 ) ) ( not ( = ?auto_154768 ?auto_154769 ) ) ( not ( = ?auto_154768 ?auto_154770 ) ) ( not ( = ?auto_154768 ?auto_154771 ) ) ( not ( = ?auto_154769 ?auto_154770 ) ) ( not ( = ?auto_154769 ?auto_154771 ) ) ( not ( = ?auto_154770 ?auto_154771 ) ) ( ON ?auto_154769 ?auto_154770 ) ( ON ?auto_154768 ?auto_154769 ) ( ON ?auto_154767 ?auto_154768 ) ( ON ?auto_154766 ?auto_154767 ) ( CLEAR ?auto_154764 ) ( ON ?auto_154765 ?auto_154766 ) ( CLEAR ?auto_154765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154760 ?auto_154761 ?auto_154762 ?auto_154763 ?auto_154764 ?auto_154765 )
      ( MAKE-11PILE ?auto_154760 ?auto_154761 ?auto_154762 ?auto_154763 ?auto_154764 ?auto_154765 ?auto_154766 ?auto_154767 ?auto_154768 ?auto_154769 ?auto_154770 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_154806 - BLOCK
      ?auto_154807 - BLOCK
      ?auto_154808 - BLOCK
      ?auto_154809 - BLOCK
      ?auto_154810 - BLOCK
      ?auto_154811 - BLOCK
      ?auto_154812 - BLOCK
      ?auto_154813 - BLOCK
      ?auto_154814 - BLOCK
      ?auto_154815 - BLOCK
      ?auto_154816 - BLOCK
    )
    :vars
    (
      ?auto_154817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154816 ?auto_154817 ) ( ON-TABLE ?auto_154806 ) ( ON ?auto_154807 ?auto_154806 ) ( ON ?auto_154808 ?auto_154807 ) ( ON ?auto_154809 ?auto_154808 ) ( not ( = ?auto_154806 ?auto_154807 ) ) ( not ( = ?auto_154806 ?auto_154808 ) ) ( not ( = ?auto_154806 ?auto_154809 ) ) ( not ( = ?auto_154806 ?auto_154810 ) ) ( not ( = ?auto_154806 ?auto_154811 ) ) ( not ( = ?auto_154806 ?auto_154812 ) ) ( not ( = ?auto_154806 ?auto_154813 ) ) ( not ( = ?auto_154806 ?auto_154814 ) ) ( not ( = ?auto_154806 ?auto_154815 ) ) ( not ( = ?auto_154806 ?auto_154816 ) ) ( not ( = ?auto_154806 ?auto_154817 ) ) ( not ( = ?auto_154807 ?auto_154808 ) ) ( not ( = ?auto_154807 ?auto_154809 ) ) ( not ( = ?auto_154807 ?auto_154810 ) ) ( not ( = ?auto_154807 ?auto_154811 ) ) ( not ( = ?auto_154807 ?auto_154812 ) ) ( not ( = ?auto_154807 ?auto_154813 ) ) ( not ( = ?auto_154807 ?auto_154814 ) ) ( not ( = ?auto_154807 ?auto_154815 ) ) ( not ( = ?auto_154807 ?auto_154816 ) ) ( not ( = ?auto_154807 ?auto_154817 ) ) ( not ( = ?auto_154808 ?auto_154809 ) ) ( not ( = ?auto_154808 ?auto_154810 ) ) ( not ( = ?auto_154808 ?auto_154811 ) ) ( not ( = ?auto_154808 ?auto_154812 ) ) ( not ( = ?auto_154808 ?auto_154813 ) ) ( not ( = ?auto_154808 ?auto_154814 ) ) ( not ( = ?auto_154808 ?auto_154815 ) ) ( not ( = ?auto_154808 ?auto_154816 ) ) ( not ( = ?auto_154808 ?auto_154817 ) ) ( not ( = ?auto_154809 ?auto_154810 ) ) ( not ( = ?auto_154809 ?auto_154811 ) ) ( not ( = ?auto_154809 ?auto_154812 ) ) ( not ( = ?auto_154809 ?auto_154813 ) ) ( not ( = ?auto_154809 ?auto_154814 ) ) ( not ( = ?auto_154809 ?auto_154815 ) ) ( not ( = ?auto_154809 ?auto_154816 ) ) ( not ( = ?auto_154809 ?auto_154817 ) ) ( not ( = ?auto_154810 ?auto_154811 ) ) ( not ( = ?auto_154810 ?auto_154812 ) ) ( not ( = ?auto_154810 ?auto_154813 ) ) ( not ( = ?auto_154810 ?auto_154814 ) ) ( not ( = ?auto_154810 ?auto_154815 ) ) ( not ( = ?auto_154810 ?auto_154816 ) ) ( not ( = ?auto_154810 ?auto_154817 ) ) ( not ( = ?auto_154811 ?auto_154812 ) ) ( not ( = ?auto_154811 ?auto_154813 ) ) ( not ( = ?auto_154811 ?auto_154814 ) ) ( not ( = ?auto_154811 ?auto_154815 ) ) ( not ( = ?auto_154811 ?auto_154816 ) ) ( not ( = ?auto_154811 ?auto_154817 ) ) ( not ( = ?auto_154812 ?auto_154813 ) ) ( not ( = ?auto_154812 ?auto_154814 ) ) ( not ( = ?auto_154812 ?auto_154815 ) ) ( not ( = ?auto_154812 ?auto_154816 ) ) ( not ( = ?auto_154812 ?auto_154817 ) ) ( not ( = ?auto_154813 ?auto_154814 ) ) ( not ( = ?auto_154813 ?auto_154815 ) ) ( not ( = ?auto_154813 ?auto_154816 ) ) ( not ( = ?auto_154813 ?auto_154817 ) ) ( not ( = ?auto_154814 ?auto_154815 ) ) ( not ( = ?auto_154814 ?auto_154816 ) ) ( not ( = ?auto_154814 ?auto_154817 ) ) ( not ( = ?auto_154815 ?auto_154816 ) ) ( not ( = ?auto_154815 ?auto_154817 ) ) ( not ( = ?auto_154816 ?auto_154817 ) ) ( ON ?auto_154815 ?auto_154816 ) ( ON ?auto_154814 ?auto_154815 ) ( ON ?auto_154813 ?auto_154814 ) ( ON ?auto_154812 ?auto_154813 ) ( ON ?auto_154811 ?auto_154812 ) ( CLEAR ?auto_154809 ) ( ON ?auto_154810 ?auto_154811 ) ( CLEAR ?auto_154810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154806 ?auto_154807 ?auto_154808 ?auto_154809 ?auto_154810 )
      ( MAKE-11PILE ?auto_154806 ?auto_154807 ?auto_154808 ?auto_154809 ?auto_154810 ?auto_154811 ?auto_154812 ?auto_154813 ?auto_154814 ?auto_154815 ?auto_154816 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_154852 - BLOCK
      ?auto_154853 - BLOCK
      ?auto_154854 - BLOCK
      ?auto_154855 - BLOCK
      ?auto_154856 - BLOCK
      ?auto_154857 - BLOCK
      ?auto_154858 - BLOCK
      ?auto_154859 - BLOCK
      ?auto_154860 - BLOCK
      ?auto_154861 - BLOCK
      ?auto_154862 - BLOCK
    )
    :vars
    (
      ?auto_154863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154862 ?auto_154863 ) ( ON-TABLE ?auto_154852 ) ( ON ?auto_154853 ?auto_154852 ) ( ON ?auto_154854 ?auto_154853 ) ( not ( = ?auto_154852 ?auto_154853 ) ) ( not ( = ?auto_154852 ?auto_154854 ) ) ( not ( = ?auto_154852 ?auto_154855 ) ) ( not ( = ?auto_154852 ?auto_154856 ) ) ( not ( = ?auto_154852 ?auto_154857 ) ) ( not ( = ?auto_154852 ?auto_154858 ) ) ( not ( = ?auto_154852 ?auto_154859 ) ) ( not ( = ?auto_154852 ?auto_154860 ) ) ( not ( = ?auto_154852 ?auto_154861 ) ) ( not ( = ?auto_154852 ?auto_154862 ) ) ( not ( = ?auto_154852 ?auto_154863 ) ) ( not ( = ?auto_154853 ?auto_154854 ) ) ( not ( = ?auto_154853 ?auto_154855 ) ) ( not ( = ?auto_154853 ?auto_154856 ) ) ( not ( = ?auto_154853 ?auto_154857 ) ) ( not ( = ?auto_154853 ?auto_154858 ) ) ( not ( = ?auto_154853 ?auto_154859 ) ) ( not ( = ?auto_154853 ?auto_154860 ) ) ( not ( = ?auto_154853 ?auto_154861 ) ) ( not ( = ?auto_154853 ?auto_154862 ) ) ( not ( = ?auto_154853 ?auto_154863 ) ) ( not ( = ?auto_154854 ?auto_154855 ) ) ( not ( = ?auto_154854 ?auto_154856 ) ) ( not ( = ?auto_154854 ?auto_154857 ) ) ( not ( = ?auto_154854 ?auto_154858 ) ) ( not ( = ?auto_154854 ?auto_154859 ) ) ( not ( = ?auto_154854 ?auto_154860 ) ) ( not ( = ?auto_154854 ?auto_154861 ) ) ( not ( = ?auto_154854 ?auto_154862 ) ) ( not ( = ?auto_154854 ?auto_154863 ) ) ( not ( = ?auto_154855 ?auto_154856 ) ) ( not ( = ?auto_154855 ?auto_154857 ) ) ( not ( = ?auto_154855 ?auto_154858 ) ) ( not ( = ?auto_154855 ?auto_154859 ) ) ( not ( = ?auto_154855 ?auto_154860 ) ) ( not ( = ?auto_154855 ?auto_154861 ) ) ( not ( = ?auto_154855 ?auto_154862 ) ) ( not ( = ?auto_154855 ?auto_154863 ) ) ( not ( = ?auto_154856 ?auto_154857 ) ) ( not ( = ?auto_154856 ?auto_154858 ) ) ( not ( = ?auto_154856 ?auto_154859 ) ) ( not ( = ?auto_154856 ?auto_154860 ) ) ( not ( = ?auto_154856 ?auto_154861 ) ) ( not ( = ?auto_154856 ?auto_154862 ) ) ( not ( = ?auto_154856 ?auto_154863 ) ) ( not ( = ?auto_154857 ?auto_154858 ) ) ( not ( = ?auto_154857 ?auto_154859 ) ) ( not ( = ?auto_154857 ?auto_154860 ) ) ( not ( = ?auto_154857 ?auto_154861 ) ) ( not ( = ?auto_154857 ?auto_154862 ) ) ( not ( = ?auto_154857 ?auto_154863 ) ) ( not ( = ?auto_154858 ?auto_154859 ) ) ( not ( = ?auto_154858 ?auto_154860 ) ) ( not ( = ?auto_154858 ?auto_154861 ) ) ( not ( = ?auto_154858 ?auto_154862 ) ) ( not ( = ?auto_154858 ?auto_154863 ) ) ( not ( = ?auto_154859 ?auto_154860 ) ) ( not ( = ?auto_154859 ?auto_154861 ) ) ( not ( = ?auto_154859 ?auto_154862 ) ) ( not ( = ?auto_154859 ?auto_154863 ) ) ( not ( = ?auto_154860 ?auto_154861 ) ) ( not ( = ?auto_154860 ?auto_154862 ) ) ( not ( = ?auto_154860 ?auto_154863 ) ) ( not ( = ?auto_154861 ?auto_154862 ) ) ( not ( = ?auto_154861 ?auto_154863 ) ) ( not ( = ?auto_154862 ?auto_154863 ) ) ( ON ?auto_154861 ?auto_154862 ) ( ON ?auto_154860 ?auto_154861 ) ( ON ?auto_154859 ?auto_154860 ) ( ON ?auto_154858 ?auto_154859 ) ( ON ?auto_154857 ?auto_154858 ) ( ON ?auto_154856 ?auto_154857 ) ( CLEAR ?auto_154854 ) ( ON ?auto_154855 ?auto_154856 ) ( CLEAR ?auto_154855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154852 ?auto_154853 ?auto_154854 ?auto_154855 )
      ( MAKE-11PILE ?auto_154852 ?auto_154853 ?auto_154854 ?auto_154855 ?auto_154856 ?auto_154857 ?auto_154858 ?auto_154859 ?auto_154860 ?auto_154861 ?auto_154862 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_154898 - BLOCK
      ?auto_154899 - BLOCK
      ?auto_154900 - BLOCK
      ?auto_154901 - BLOCK
      ?auto_154902 - BLOCK
      ?auto_154903 - BLOCK
      ?auto_154904 - BLOCK
      ?auto_154905 - BLOCK
      ?auto_154906 - BLOCK
      ?auto_154907 - BLOCK
      ?auto_154908 - BLOCK
    )
    :vars
    (
      ?auto_154909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154908 ?auto_154909 ) ( ON-TABLE ?auto_154898 ) ( ON ?auto_154899 ?auto_154898 ) ( not ( = ?auto_154898 ?auto_154899 ) ) ( not ( = ?auto_154898 ?auto_154900 ) ) ( not ( = ?auto_154898 ?auto_154901 ) ) ( not ( = ?auto_154898 ?auto_154902 ) ) ( not ( = ?auto_154898 ?auto_154903 ) ) ( not ( = ?auto_154898 ?auto_154904 ) ) ( not ( = ?auto_154898 ?auto_154905 ) ) ( not ( = ?auto_154898 ?auto_154906 ) ) ( not ( = ?auto_154898 ?auto_154907 ) ) ( not ( = ?auto_154898 ?auto_154908 ) ) ( not ( = ?auto_154898 ?auto_154909 ) ) ( not ( = ?auto_154899 ?auto_154900 ) ) ( not ( = ?auto_154899 ?auto_154901 ) ) ( not ( = ?auto_154899 ?auto_154902 ) ) ( not ( = ?auto_154899 ?auto_154903 ) ) ( not ( = ?auto_154899 ?auto_154904 ) ) ( not ( = ?auto_154899 ?auto_154905 ) ) ( not ( = ?auto_154899 ?auto_154906 ) ) ( not ( = ?auto_154899 ?auto_154907 ) ) ( not ( = ?auto_154899 ?auto_154908 ) ) ( not ( = ?auto_154899 ?auto_154909 ) ) ( not ( = ?auto_154900 ?auto_154901 ) ) ( not ( = ?auto_154900 ?auto_154902 ) ) ( not ( = ?auto_154900 ?auto_154903 ) ) ( not ( = ?auto_154900 ?auto_154904 ) ) ( not ( = ?auto_154900 ?auto_154905 ) ) ( not ( = ?auto_154900 ?auto_154906 ) ) ( not ( = ?auto_154900 ?auto_154907 ) ) ( not ( = ?auto_154900 ?auto_154908 ) ) ( not ( = ?auto_154900 ?auto_154909 ) ) ( not ( = ?auto_154901 ?auto_154902 ) ) ( not ( = ?auto_154901 ?auto_154903 ) ) ( not ( = ?auto_154901 ?auto_154904 ) ) ( not ( = ?auto_154901 ?auto_154905 ) ) ( not ( = ?auto_154901 ?auto_154906 ) ) ( not ( = ?auto_154901 ?auto_154907 ) ) ( not ( = ?auto_154901 ?auto_154908 ) ) ( not ( = ?auto_154901 ?auto_154909 ) ) ( not ( = ?auto_154902 ?auto_154903 ) ) ( not ( = ?auto_154902 ?auto_154904 ) ) ( not ( = ?auto_154902 ?auto_154905 ) ) ( not ( = ?auto_154902 ?auto_154906 ) ) ( not ( = ?auto_154902 ?auto_154907 ) ) ( not ( = ?auto_154902 ?auto_154908 ) ) ( not ( = ?auto_154902 ?auto_154909 ) ) ( not ( = ?auto_154903 ?auto_154904 ) ) ( not ( = ?auto_154903 ?auto_154905 ) ) ( not ( = ?auto_154903 ?auto_154906 ) ) ( not ( = ?auto_154903 ?auto_154907 ) ) ( not ( = ?auto_154903 ?auto_154908 ) ) ( not ( = ?auto_154903 ?auto_154909 ) ) ( not ( = ?auto_154904 ?auto_154905 ) ) ( not ( = ?auto_154904 ?auto_154906 ) ) ( not ( = ?auto_154904 ?auto_154907 ) ) ( not ( = ?auto_154904 ?auto_154908 ) ) ( not ( = ?auto_154904 ?auto_154909 ) ) ( not ( = ?auto_154905 ?auto_154906 ) ) ( not ( = ?auto_154905 ?auto_154907 ) ) ( not ( = ?auto_154905 ?auto_154908 ) ) ( not ( = ?auto_154905 ?auto_154909 ) ) ( not ( = ?auto_154906 ?auto_154907 ) ) ( not ( = ?auto_154906 ?auto_154908 ) ) ( not ( = ?auto_154906 ?auto_154909 ) ) ( not ( = ?auto_154907 ?auto_154908 ) ) ( not ( = ?auto_154907 ?auto_154909 ) ) ( not ( = ?auto_154908 ?auto_154909 ) ) ( ON ?auto_154907 ?auto_154908 ) ( ON ?auto_154906 ?auto_154907 ) ( ON ?auto_154905 ?auto_154906 ) ( ON ?auto_154904 ?auto_154905 ) ( ON ?auto_154903 ?auto_154904 ) ( ON ?auto_154902 ?auto_154903 ) ( ON ?auto_154901 ?auto_154902 ) ( CLEAR ?auto_154899 ) ( ON ?auto_154900 ?auto_154901 ) ( CLEAR ?auto_154900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154898 ?auto_154899 ?auto_154900 )
      ( MAKE-11PILE ?auto_154898 ?auto_154899 ?auto_154900 ?auto_154901 ?auto_154902 ?auto_154903 ?auto_154904 ?auto_154905 ?auto_154906 ?auto_154907 ?auto_154908 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_154944 - BLOCK
      ?auto_154945 - BLOCK
      ?auto_154946 - BLOCK
      ?auto_154947 - BLOCK
      ?auto_154948 - BLOCK
      ?auto_154949 - BLOCK
      ?auto_154950 - BLOCK
      ?auto_154951 - BLOCK
      ?auto_154952 - BLOCK
      ?auto_154953 - BLOCK
      ?auto_154954 - BLOCK
    )
    :vars
    (
      ?auto_154955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_154954 ?auto_154955 ) ( ON-TABLE ?auto_154944 ) ( not ( = ?auto_154944 ?auto_154945 ) ) ( not ( = ?auto_154944 ?auto_154946 ) ) ( not ( = ?auto_154944 ?auto_154947 ) ) ( not ( = ?auto_154944 ?auto_154948 ) ) ( not ( = ?auto_154944 ?auto_154949 ) ) ( not ( = ?auto_154944 ?auto_154950 ) ) ( not ( = ?auto_154944 ?auto_154951 ) ) ( not ( = ?auto_154944 ?auto_154952 ) ) ( not ( = ?auto_154944 ?auto_154953 ) ) ( not ( = ?auto_154944 ?auto_154954 ) ) ( not ( = ?auto_154944 ?auto_154955 ) ) ( not ( = ?auto_154945 ?auto_154946 ) ) ( not ( = ?auto_154945 ?auto_154947 ) ) ( not ( = ?auto_154945 ?auto_154948 ) ) ( not ( = ?auto_154945 ?auto_154949 ) ) ( not ( = ?auto_154945 ?auto_154950 ) ) ( not ( = ?auto_154945 ?auto_154951 ) ) ( not ( = ?auto_154945 ?auto_154952 ) ) ( not ( = ?auto_154945 ?auto_154953 ) ) ( not ( = ?auto_154945 ?auto_154954 ) ) ( not ( = ?auto_154945 ?auto_154955 ) ) ( not ( = ?auto_154946 ?auto_154947 ) ) ( not ( = ?auto_154946 ?auto_154948 ) ) ( not ( = ?auto_154946 ?auto_154949 ) ) ( not ( = ?auto_154946 ?auto_154950 ) ) ( not ( = ?auto_154946 ?auto_154951 ) ) ( not ( = ?auto_154946 ?auto_154952 ) ) ( not ( = ?auto_154946 ?auto_154953 ) ) ( not ( = ?auto_154946 ?auto_154954 ) ) ( not ( = ?auto_154946 ?auto_154955 ) ) ( not ( = ?auto_154947 ?auto_154948 ) ) ( not ( = ?auto_154947 ?auto_154949 ) ) ( not ( = ?auto_154947 ?auto_154950 ) ) ( not ( = ?auto_154947 ?auto_154951 ) ) ( not ( = ?auto_154947 ?auto_154952 ) ) ( not ( = ?auto_154947 ?auto_154953 ) ) ( not ( = ?auto_154947 ?auto_154954 ) ) ( not ( = ?auto_154947 ?auto_154955 ) ) ( not ( = ?auto_154948 ?auto_154949 ) ) ( not ( = ?auto_154948 ?auto_154950 ) ) ( not ( = ?auto_154948 ?auto_154951 ) ) ( not ( = ?auto_154948 ?auto_154952 ) ) ( not ( = ?auto_154948 ?auto_154953 ) ) ( not ( = ?auto_154948 ?auto_154954 ) ) ( not ( = ?auto_154948 ?auto_154955 ) ) ( not ( = ?auto_154949 ?auto_154950 ) ) ( not ( = ?auto_154949 ?auto_154951 ) ) ( not ( = ?auto_154949 ?auto_154952 ) ) ( not ( = ?auto_154949 ?auto_154953 ) ) ( not ( = ?auto_154949 ?auto_154954 ) ) ( not ( = ?auto_154949 ?auto_154955 ) ) ( not ( = ?auto_154950 ?auto_154951 ) ) ( not ( = ?auto_154950 ?auto_154952 ) ) ( not ( = ?auto_154950 ?auto_154953 ) ) ( not ( = ?auto_154950 ?auto_154954 ) ) ( not ( = ?auto_154950 ?auto_154955 ) ) ( not ( = ?auto_154951 ?auto_154952 ) ) ( not ( = ?auto_154951 ?auto_154953 ) ) ( not ( = ?auto_154951 ?auto_154954 ) ) ( not ( = ?auto_154951 ?auto_154955 ) ) ( not ( = ?auto_154952 ?auto_154953 ) ) ( not ( = ?auto_154952 ?auto_154954 ) ) ( not ( = ?auto_154952 ?auto_154955 ) ) ( not ( = ?auto_154953 ?auto_154954 ) ) ( not ( = ?auto_154953 ?auto_154955 ) ) ( not ( = ?auto_154954 ?auto_154955 ) ) ( ON ?auto_154953 ?auto_154954 ) ( ON ?auto_154952 ?auto_154953 ) ( ON ?auto_154951 ?auto_154952 ) ( ON ?auto_154950 ?auto_154951 ) ( ON ?auto_154949 ?auto_154950 ) ( ON ?auto_154948 ?auto_154949 ) ( ON ?auto_154947 ?auto_154948 ) ( ON ?auto_154946 ?auto_154947 ) ( CLEAR ?auto_154944 ) ( ON ?auto_154945 ?auto_154946 ) ( CLEAR ?auto_154945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154944 ?auto_154945 )
      ( MAKE-11PILE ?auto_154944 ?auto_154945 ?auto_154946 ?auto_154947 ?auto_154948 ?auto_154949 ?auto_154950 ?auto_154951 ?auto_154952 ?auto_154953 ?auto_154954 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_154990 - BLOCK
      ?auto_154991 - BLOCK
      ?auto_154992 - BLOCK
      ?auto_154993 - BLOCK
      ?auto_154994 - BLOCK
      ?auto_154995 - BLOCK
      ?auto_154996 - BLOCK
      ?auto_154997 - BLOCK
      ?auto_154998 - BLOCK
      ?auto_154999 - BLOCK
      ?auto_155000 - BLOCK
    )
    :vars
    (
      ?auto_155001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155000 ?auto_155001 ) ( not ( = ?auto_154990 ?auto_154991 ) ) ( not ( = ?auto_154990 ?auto_154992 ) ) ( not ( = ?auto_154990 ?auto_154993 ) ) ( not ( = ?auto_154990 ?auto_154994 ) ) ( not ( = ?auto_154990 ?auto_154995 ) ) ( not ( = ?auto_154990 ?auto_154996 ) ) ( not ( = ?auto_154990 ?auto_154997 ) ) ( not ( = ?auto_154990 ?auto_154998 ) ) ( not ( = ?auto_154990 ?auto_154999 ) ) ( not ( = ?auto_154990 ?auto_155000 ) ) ( not ( = ?auto_154990 ?auto_155001 ) ) ( not ( = ?auto_154991 ?auto_154992 ) ) ( not ( = ?auto_154991 ?auto_154993 ) ) ( not ( = ?auto_154991 ?auto_154994 ) ) ( not ( = ?auto_154991 ?auto_154995 ) ) ( not ( = ?auto_154991 ?auto_154996 ) ) ( not ( = ?auto_154991 ?auto_154997 ) ) ( not ( = ?auto_154991 ?auto_154998 ) ) ( not ( = ?auto_154991 ?auto_154999 ) ) ( not ( = ?auto_154991 ?auto_155000 ) ) ( not ( = ?auto_154991 ?auto_155001 ) ) ( not ( = ?auto_154992 ?auto_154993 ) ) ( not ( = ?auto_154992 ?auto_154994 ) ) ( not ( = ?auto_154992 ?auto_154995 ) ) ( not ( = ?auto_154992 ?auto_154996 ) ) ( not ( = ?auto_154992 ?auto_154997 ) ) ( not ( = ?auto_154992 ?auto_154998 ) ) ( not ( = ?auto_154992 ?auto_154999 ) ) ( not ( = ?auto_154992 ?auto_155000 ) ) ( not ( = ?auto_154992 ?auto_155001 ) ) ( not ( = ?auto_154993 ?auto_154994 ) ) ( not ( = ?auto_154993 ?auto_154995 ) ) ( not ( = ?auto_154993 ?auto_154996 ) ) ( not ( = ?auto_154993 ?auto_154997 ) ) ( not ( = ?auto_154993 ?auto_154998 ) ) ( not ( = ?auto_154993 ?auto_154999 ) ) ( not ( = ?auto_154993 ?auto_155000 ) ) ( not ( = ?auto_154993 ?auto_155001 ) ) ( not ( = ?auto_154994 ?auto_154995 ) ) ( not ( = ?auto_154994 ?auto_154996 ) ) ( not ( = ?auto_154994 ?auto_154997 ) ) ( not ( = ?auto_154994 ?auto_154998 ) ) ( not ( = ?auto_154994 ?auto_154999 ) ) ( not ( = ?auto_154994 ?auto_155000 ) ) ( not ( = ?auto_154994 ?auto_155001 ) ) ( not ( = ?auto_154995 ?auto_154996 ) ) ( not ( = ?auto_154995 ?auto_154997 ) ) ( not ( = ?auto_154995 ?auto_154998 ) ) ( not ( = ?auto_154995 ?auto_154999 ) ) ( not ( = ?auto_154995 ?auto_155000 ) ) ( not ( = ?auto_154995 ?auto_155001 ) ) ( not ( = ?auto_154996 ?auto_154997 ) ) ( not ( = ?auto_154996 ?auto_154998 ) ) ( not ( = ?auto_154996 ?auto_154999 ) ) ( not ( = ?auto_154996 ?auto_155000 ) ) ( not ( = ?auto_154996 ?auto_155001 ) ) ( not ( = ?auto_154997 ?auto_154998 ) ) ( not ( = ?auto_154997 ?auto_154999 ) ) ( not ( = ?auto_154997 ?auto_155000 ) ) ( not ( = ?auto_154997 ?auto_155001 ) ) ( not ( = ?auto_154998 ?auto_154999 ) ) ( not ( = ?auto_154998 ?auto_155000 ) ) ( not ( = ?auto_154998 ?auto_155001 ) ) ( not ( = ?auto_154999 ?auto_155000 ) ) ( not ( = ?auto_154999 ?auto_155001 ) ) ( not ( = ?auto_155000 ?auto_155001 ) ) ( ON ?auto_154999 ?auto_155000 ) ( ON ?auto_154998 ?auto_154999 ) ( ON ?auto_154997 ?auto_154998 ) ( ON ?auto_154996 ?auto_154997 ) ( ON ?auto_154995 ?auto_154996 ) ( ON ?auto_154994 ?auto_154995 ) ( ON ?auto_154993 ?auto_154994 ) ( ON ?auto_154992 ?auto_154993 ) ( ON ?auto_154991 ?auto_154992 ) ( ON ?auto_154990 ?auto_154991 ) ( CLEAR ?auto_154990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154990 )
      ( MAKE-11PILE ?auto_154990 ?auto_154991 ?auto_154992 ?auto_154993 ?auto_154994 ?auto_154995 ?auto_154996 ?auto_154997 ?auto_154998 ?auto_154999 ?auto_155000 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155037 - BLOCK
      ?auto_155038 - BLOCK
      ?auto_155039 - BLOCK
      ?auto_155040 - BLOCK
      ?auto_155041 - BLOCK
      ?auto_155042 - BLOCK
      ?auto_155043 - BLOCK
      ?auto_155044 - BLOCK
      ?auto_155045 - BLOCK
      ?auto_155046 - BLOCK
      ?auto_155047 - BLOCK
      ?auto_155048 - BLOCK
    )
    :vars
    (
      ?auto_155049 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155047 ) ( ON ?auto_155048 ?auto_155049 ) ( CLEAR ?auto_155048 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155037 ) ( ON ?auto_155038 ?auto_155037 ) ( ON ?auto_155039 ?auto_155038 ) ( ON ?auto_155040 ?auto_155039 ) ( ON ?auto_155041 ?auto_155040 ) ( ON ?auto_155042 ?auto_155041 ) ( ON ?auto_155043 ?auto_155042 ) ( ON ?auto_155044 ?auto_155043 ) ( ON ?auto_155045 ?auto_155044 ) ( ON ?auto_155046 ?auto_155045 ) ( ON ?auto_155047 ?auto_155046 ) ( not ( = ?auto_155037 ?auto_155038 ) ) ( not ( = ?auto_155037 ?auto_155039 ) ) ( not ( = ?auto_155037 ?auto_155040 ) ) ( not ( = ?auto_155037 ?auto_155041 ) ) ( not ( = ?auto_155037 ?auto_155042 ) ) ( not ( = ?auto_155037 ?auto_155043 ) ) ( not ( = ?auto_155037 ?auto_155044 ) ) ( not ( = ?auto_155037 ?auto_155045 ) ) ( not ( = ?auto_155037 ?auto_155046 ) ) ( not ( = ?auto_155037 ?auto_155047 ) ) ( not ( = ?auto_155037 ?auto_155048 ) ) ( not ( = ?auto_155037 ?auto_155049 ) ) ( not ( = ?auto_155038 ?auto_155039 ) ) ( not ( = ?auto_155038 ?auto_155040 ) ) ( not ( = ?auto_155038 ?auto_155041 ) ) ( not ( = ?auto_155038 ?auto_155042 ) ) ( not ( = ?auto_155038 ?auto_155043 ) ) ( not ( = ?auto_155038 ?auto_155044 ) ) ( not ( = ?auto_155038 ?auto_155045 ) ) ( not ( = ?auto_155038 ?auto_155046 ) ) ( not ( = ?auto_155038 ?auto_155047 ) ) ( not ( = ?auto_155038 ?auto_155048 ) ) ( not ( = ?auto_155038 ?auto_155049 ) ) ( not ( = ?auto_155039 ?auto_155040 ) ) ( not ( = ?auto_155039 ?auto_155041 ) ) ( not ( = ?auto_155039 ?auto_155042 ) ) ( not ( = ?auto_155039 ?auto_155043 ) ) ( not ( = ?auto_155039 ?auto_155044 ) ) ( not ( = ?auto_155039 ?auto_155045 ) ) ( not ( = ?auto_155039 ?auto_155046 ) ) ( not ( = ?auto_155039 ?auto_155047 ) ) ( not ( = ?auto_155039 ?auto_155048 ) ) ( not ( = ?auto_155039 ?auto_155049 ) ) ( not ( = ?auto_155040 ?auto_155041 ) ) ( not ( = ?auto_155040 ?auto_155042 ) ) ( not ( = ?auto_155040 ?auto_155043 ) ) ( not ( = ?auto_155040 ?auto_155044 ) ) ( not ( = ?auto_155040 ?auto_155045 ) ) ( not ( = ?auto_155040 ?auto_155046 ) ) ( not ( = ?auto_155040 ?auto_155047 ) ) ( not ( = ?auto_155040 ?auto_155048 ) ) ( not ( = ?auto_155040 ?auto_155049 ) ) ( not ( = ?auto_155041 ?auto_155042 ) ) ( not ( = ?auto_155041 ?auto_155043 ) ) ( not ( = ?auto_155041 ?auto_155044 ) ) ( not ( = ?auto_155041 ?auto_155045 ) ) ( not ( = ?auto_155041 ?auto_155046 ) ) ( not ( = ?auto_155041 ?auto_155047 ) ) ( not ( = ?auto_155041 ?auto_155048 ) ) ( not ( = ?auto_155041 ?auto_155049 ) ) ( not ( = ?auto_155042 ?auto_155043 ) ) ( not ( = ?auto_155042 ?auto_155044 ) ) ( not ( = ?auto_155042 ?auto_155045 ) ) ( not ( = ?auto_155042 ?auto_155046 ) ) ( not ( = ?auto_155042 ?auto_155047 ) ) ( not ( = ?auto_155042 ?auto_155048 ) ) ( not ( = ?auto_155042 ?auto_155049 ) ) ( not ( = ?auto_155043 ?auto_155044 ) ) ( not ( = ?auto_155043 ?auto_155045 ) ) ( not ( = ?auto_155043 ?auto_155046 ) ) ( not ( = ?auto_155043 ?auto_155047 ) ) ( not ( = ?auto_155043 ?auto_155048 ) ) ( not ( = ?auto_155043 ?auto_155049 ) ) ( not ( = ?auto_155044 ?auto_155045 ) ) ( not ( = ?auto_155044 ?auto_155046 ) ) ( not ( = ?auto_155044 ?auto_155047 ) ) ( not ( = ?auto_155044 ?auto_155048 ) ) ( not ( = ?auto_155044 ?auto_155049 ) ) ( not ( = ?auto_155045 ?auto_155046 ) ) ( not ( = ?auto_155045 ?auto_155047 ) ) ( not ( = ?auto_155045 ?auto_155048 ) ) ( not ( = ?auto_155045 ?auto_155049 ) ) ( not ( = ?auto_155046 ?auto_155047 ) ) ( not ( = ?auto_155046 ?auto_155048 ) ) ( not ( = ?auto_155046 ?auto_155049 ) ) ( not ( = ?auto_155047 ?auto_155048 ) ) ( not ( = ?auto_155047 ?auto_155049 ) ) ( not ( = ?auto_155048 ?auto_155049 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_155048 ?auto_155049 )
      ( !STACK ?auto_155048 ?auto_155047 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155062 - BLOCK
      ?auto_155063 - BLOCK
      ?auto_155064 - BLOCK
      ?auto_155065 - BLOCK
      ?auto_155066 - BLOCK
      ?auto_155067 - BLOCK
      ?auto_155068 - BLOCK
      ?auto_155069 - BLOCK
      ?auto_155070 - BLOCK
      ?auto_155071 - BLOCK
      ?auto_155072 - BLOCK
      ?auto_155073 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_155072 ) ( ON-TABLE ?auto_155073 ) ( CLEAR ?auto_155073 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_155062 ) ( ON ?auto_155063 ?auto_155062 ) ( ON ?auto_155064 ?auto_155063 ) ( ON ?auto_155065 ?auto_155064 ) ( ON ?auto_155066 ?auto_155065 ) ( ON ?auto_155067 ?auto_155066 ) ( ON ?auto_155068 ?auto_155067 ) ( ON ?auto_155069 ?auto_155068 ) ( ON ?auto_155070 ?auto_155069 ) ( ON ?auto_155071 ?auto_155070 ) ( ON ?auto_155072 ?auto_155071 ) ( not ( = ?auto_155062 ?auto_155063 ) ) ( not ( = ?auto_155062 ?auto_155064 ) ) ( not ( = ?auto_155062 ?auto_155065 ) ) ( not ( = ?auto_155062 ?auto_155066 ) ) ( not ( = ?auto_155062 ?auto_155067 ) ) ( not ( = ?auto_155062 ?auto_155068 ) ) ( not ( = ?auto_155062 ?auto_155069 ) ) ( not ( = ?auto_155062 ?auto_155070 ) ) ( not ( = ?auto_155062 ?auto_155071 ) ) ( not ( = ?auto_155062 ?auto_155072 ) ) ( not ( = ?auto_155062 ?auto_155073 ) ) ( not ( = ?auto_155063 ?auto_155064 ) ) ( not ( = ?auto_155063 ?auto_155065 ) ) ( not ( = ?auto_155063 ?auto_155066 ) ) ( not ( = ?auto_155063 ?auto_155067 ) ) ( not ( = ?auto_155063 ?auto_155068 ) ) ( not ( = ?auto_155063 ?auto_155069 ) ) ( not ( = ?auto_155063 ?auto_155070 ) ) ( not ( = ?auto_155063 ?auto_155071 ) ) ( not ( = ?auto_155063 ?auto_155072 ) ) ( not ( = ?auto_155063 ?auto_155073 ) ) ( not ( = ?auto_155064 ?auto_155065 ) ) ( not ( = ?auto_155064 ?auto_155066 ) ) ( not ( = ?auto_155064 ?auto_155067 ) ) ( not ( = ?auto_155064 ?auto_155068 ) ) ( not ( = ?auto_155064 ?auto_155069 ) ) ( not ( = ?auto_155064 ?auto_155070 ) ) ( not ( = ?auto_155064 ?auto_155071 ) ) ( not ( = ?auto_155064 ?auto_155072 ) ) ( not ( = ?auto_155064 ?auto_155073 ) ) ( not ( = ?auto_155065 ?auto_155066 ) ) ( not ( = ?auto_155065 ?auto_155067 ) ) ( not ( = ?auto_155065 ?auto_155068 ) ) ( not ( = ?auto_155065 ?auto_155069 ) ) ( not ( = ?auto_155065 ?auto_155070 ) ) ( not ( = ?auto_155065 ?auto_155071 ) ) ( not ( = ?auto_155065 ?auto_155072 ) ) ( not ( = ?auto_155065 ?auto_155073 ) ) ( not ( = ?auto_155066 ?auto_155067 ) ) ( not ( = ?auto_155066 ?auto_155068 ) ) ( not ( = ?auto_155066 ?auto_155069 ) ) ( not ( = ?auto_155066 ?auto_155070 ) ) ( not ( = ?auto_155066 ?auto_155071 ) ) ( not ( = ?auto_155066 ?auto_155072 ) ) ( not ( = ?auto_155066 ?auto_155073 ) ) ( not ( = ?auto_155067 ?auto_155068 ) ) ( not ( = ?auto_155067 ?auto_155069 ) ) ( not ( = ?auto_155067 ?auto_155070 ) ) ( not ( = ?auto_155067 ?auto_155071 ) ) ( not ( = ?auto_155067 ?auto_155072 ) ) ( not ( = ?auto_155067 ?auto_155073 ) ) ( not ( = ?auto_155068 ?auto_155069 ) ) ( not ( = ?auto_155068 ?auto_155070 ) ) ( not ( = ?auto_155068 ?auto_155071 ) ) ( not ( = ?auto_155068 ?auto_155072 ) ) ( not ( = ?auto_155068 ?auto_155073 ) ) ( not ( = ?auto_155069 ?auto_155070 ) ) ( not ( = ?auto_155069 ?auto_155071 ) ) ( not ( = ?auto_155069 ?auto_155072 ) ) ( not ( = ?auto_155069 ?auto_155073 ) ) ( not ( = ?auto_155070 ?auto_155071 ) ) ( not ( = ?auto_155070 ?auto_155072 ) ) ( not ( = ?auto_155070 ?auto_155073 ) ) ( not ( = ?auto_155071 ?auto_155072 ) ) ( not ( = ?auto_155071 ?auto_155073 ) ) ( not ( = ?auto_155072 ?auto_155073 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_155073 )
      ( !STACK ?auto_155073 ?auto_155072 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155086 - BLOCK
      ?auto_155087 - BLOCK
      ?auto_155088 - BLOCK
      ?auto_155089 - BLOCK
      ?auto_155090 - BLOCK
      ?auto_155091 - BLOCK
      ?auto_155092 - BLOCK
      ?auto_155093 - BLOCK
      ?auto_155094 - BLOCK
      ?auto_155095 - BLOCK
      ?auto_155096 - BLOCK
      ?auto_155097 - BLOCK
    )
    :vars
    (
      ?auto_155098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155097 ?auto_155098 ) ( ON-TABLE ?auto_155086 ) ( ON ?auto_155087 ?auto_155086 ) ( ON ?auto_155088 ?auto_155087 ) ( ON ?auto_155089 ?auto_155088 ) ( ON ?auto_155090 ?auto_155089 ) ( ON ?auto_155091 ?auto_155090 ) ( ON ?auto_155092 ?auto_155091 ) ( ON ?auto_155093 ?auto_155092 ) ( ON ?auto_155094 ?auto_155093 ) ( ON ?auto_155095 ?auto_155094 ) ( not ( = ?auto_155086 ?auto_155087 ) ) ( not ( = ?auto_155086 ?auto_155088 ) ) ( not ( = ?auto_155086 ?auto_155089 ) ) ( not ( = ?auto_155086 ?auto_155090 ) ) ( not ( = ?auto_155086 ?auto_155091 ) ) ( not ( = ?auto_155086 ?auto_155092 ) ) ( not ( = ?auto_155086 ?auto_155093 ) ) ( not ( = ?auto_155086 ?auto_155094 ) ) ( not ( = ?auto_155086 ?auto_155095 ) ) ( not ( = ?auto_155086 ?auto_155096 ) ) ( not ( = ?auto_155086 ?auto_155097 ) ) ( not ( = ?auto_155086 ?auto_155098 ) ) ( not ( = ?auto_155087 ?auto_155088 ) ) ( not ( = ?auto_155087 ?auto_155089 ) ) ( not ( = ?auto_155087 ?auto_155090 ) ) ( not ( = ?auto_155087 ?auto_155091 ) ) ( not ( = ?auto_155087 ?auto_155092 ) ) ( not ( = ?auto_155087 ?auto_155093 ) ) ( not ( = ?auto_155087 ?auto_155094 ) ) ( not ( = ?auto_155087 ?auto_155095 ) ) ( not ( = ?auto_155087 ?auto_155096 ) ) ( not ( = ?auto_155087 ?auto_155097 ) ) ( not ( = ?auto_155087 ?auto_155098 ) ) ( not ( = ?auto_155088 ?auto_155089 ) ) ( not ( = ?auto_155088 ?auto_155090 ) ) ( not ( = ?auto_155088 ?auto_155091 ) ) ( not ( = ?auto_155088 ?auto_155092 ) ) ( not ( = ?auto_155088 ?auto_155093 ) ) ( not ( = ?auto_155088 ?auto_155094 ) ) ( not ( = ?auto_155088 ?auto_155095 ) ) ( not ( = ?auto_155088 ?auto_155096 ) ) ( not ( = ?auto_155088 ?auto_155097 ) ) ( not ( = ?auto_155088 ?auto_155098 ) ) ( not ( = ?auto_155089 ?auto_155090 ) ) ( not ( = ?auto_155089 ?auto_155091 ) ) ( not ( = ?auto_155089 ?auto_155092 ) ) ( not ( = ?auto_155089 ?auto_155093 ) ) ( not ( = ?auto_155089 ?auto_155094 ) ) ( not ( = ?auto_155089 ?auto_155095 ) ) ( not ( = ?auto_155089 ?auto_155096 ) ) ( not ( = ?auto_155089 ?auto_155097 ) ) ( not ( = ?auto_155089 ?auto_155098 ) ) ( not ( = ?auto_155090 ?auto_155091 ) ) ( not ( = ?auto_155090 ?auto_155092 ) ) ( not ( = ?auto_155090 ?auto_155093 ) ) ( not ( = ?auto_155090 ?auto_155094 ) ) ( not ( = ?auto_155090 ?auto_155095 ) ) ( not ( = ?auto_155090 ?auto_155096 ) ) ( not ( = ?auto_155090 ?auto_155097 ) ) ( not ( = ?auto_155090 ?auto_155098 ) ) ( not ( = ?auto_155091 ?auto_155092 ) ) ( not ( = ?auto_155091 ?auto_155093 ) ) ( not ( = ?auto_155091 ?auto_155094 ) ) ( not ( = ?auto_155091 ?auto_155095 ) ) ( not ( = ?auto_155091 ?auto_155096 ) ) ( not ( = ?auto_155091 ?auto_155097 ) ) ( not ( = ?auto_155091 ?auto_155098 ) ) ( not ( = ?auto_155092 ?auto_155093 ) ) ( not ( = ?auto_155092 ?auto_155094 ) ) ( not ( = ?auto_155092 ?auto_155095 ) ) ( not ( = ?auto_155092 ?auto_155096 ) ) ( not ( = ?auto_155092 ?auto_155097 ) ) ( not ( = ?auto_155092 ?auto_155098 ) ) ( not ( = ?auto_155093 ?auto_155094 ) ) ( not ( = ?auto_155093 ?auto_155095 ) ) ( not ( = ?auto_155093 ?auto_155096 ) ) ( not ( = ?auto_155093 ?auto_155097 ) ) ( not ( = ?auto_155093 ?auto_155098 ) ) ( not ( = ?auto_155094 ?auto_155095 ) ) ( not ( = ?auto_155094 ?auto_155096 ) ) ( not ( = ?auto_155094 ?auto_155097 ) ) ( not ( = ?auto_155094 ?auto_155098 ) ) ( not ( = ?auto_155095 ?auto_155096 ) ) ( not ( = ?auto_155095 ?auto_155097 ) ) ( not ( = ?auto_155095 ?auto_155098 ) ) ( not ( = ?auto_155096 ?auto_155097 ) ) ( not ( = ?auto_155096 ?auto_155098 ) ) ( not ( = ?auto_155097 ?auto_155098 ) ) ( CLEAR ?auto_155095 ) ( ON ?auto_155096 ?auto_155097 ) ( CLEAR ?auto_155096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_155086 ?auto_155087 ?auto_155088 ?auto_155089 ?auto_155090 ?auto_155091 ?auto_155092 ?auto_155093 ?auto_155094 ?auto_155095 ?auto_155096 )
      ( MAKE-12PILE ?auto_155086 ?auto_155087 ?auto_155088 ?auto_155089 ?auto_155090 ?auto_155091 ?auto_155092 ?auto_155093 ?auto_155094 ?auto_155095 ?auto_155096 ?auto_155097 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155111 - BLOCK
      ?auto_155112 - BLOCK
      ?auto_155113 - BLOCK
      ?auto_155114 - BLOCK
      ?auto_155115 - BLOCK
      ?auto_155116 - BLOCK
      ?auto_155117 - BLOCK
      ?auto_155118 - BLOCK
      ?auto_155119 - BLOCK
      ?auto_155120 - BLOCK
      ?auto_155121 - BLOCK
      ?auto_155122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155122 ) ( ON-TABLE ?auto_155111 ) ( ON ?auto_155112 ?auto_155111 ) ( ON ?auto_155113 ?auto_155112 ) ( ON ?auto_155114 ?auto_155113 ) ( ON ?auto_155115 ?auto_155114 ) ( ON ?auto_155116 ?auto_155115 ) ( ON ?auto_155117 ?auto_155116 ) ( ON ?auto_155118 ?auto_155117 ) ( ON ?auto_155119 ?auto_155118 ) ( ON ?auto_155120 ?auto_155119 ) ( not ( = ?auto_155111 ?auto_155112 ) ) ( not ( = ?auto_155111 ?auto_155113 ) ) ( not ( = ?auto_155111 ?auto_155114 ) ) ( not ( = ?auto_155111 ?auto_155115 ) ) ( not ( = ?auto_155111 ?auto_155116 ) ) ( not ( = ?auto_155111 ?auto_155117 ) ) ( not ( = ?auto_155111 ?auto_155118 ) ) ( not ( = ?auto_155111 ?auto_155119 ) ) ( not ( = ?auto_155111 ?auto_155120 ) ) ( not ( = ?auto_155111 ?auto_155121 ) ) ( not ( = ?auto_155111 ?auto_155122 ) ) ( not ( = ?auto_155112 ?auto_155113 ) ) ( not ( = ?auto_155112 ?auto_155114 ) ) ( not ( = ?auto_155112 ?auto_155115 ) ) ( not ( = ?auto_155112 ?auto_155116 ) ) ( not ( = ?auto_155112 ?auto_155117 ) ) ( not ( = ?auto_155112 ?auto_155118 ) ) ( not ( = ?auto_155112 ?auto_155119 ) ) ( not ( = ?auto_155112 ?auto_155120 ) ) ( not ( = ?auto_155112 ?auto_155121 ) ) ( not ( = ?auto_155112 ?auto_155122 ) ) ( not ( = ?auto_155113 ?auto_155114 ) ) ( not ( = ?auto_155113 ?auto_155115 ) ) ( not ( = ?auto_155113 ?auto_155116 ) ) ( not ( = ?auto_155113 ?auto_155117 ) ) ( not ( = ?auto_155113 ?auto_155118 ) ) ( not ( = ?auto_155113 ?auto_155119 ) ) ( not ( = ?auto_155113 ?auto_155120 ) ) ( not ( = ?auto_155113 ?auto_155121 ) ) ( not ( = ?auto_155113 ?auto_155122 ) ) ( not ( = ?auto_155114 ?auto_155115 ) ) ( not ( = ?auto_155114 ?auto_155116 ) ) ( not ( = ?auto_155114 ?auto_155117 ) ) ( not ( = ?auto_155114 ?auto_155118 ) ) ( not ( = ?auto_155114 ?auto_155119 ) ) ( not ( = ?auto_155114 ?auto_155120 ) ) ( not ( = ?auto_155114 ?auto_155121 ) ) ( not ( = ?auto_155114 ?auto_155122 ) ) ( not ( = ?auto_155115 ?auto_155116 ) ) ( not ( = ?auto_155115 ?auto_155117 ) ) ( not ( = ?auto_155115 ?auto_155118 ) ) ( not ( = ?auto_155115 ?auto_155119 ) ) ( not ( = ?auto_155115 ?auto_155120 ) ) ( not ( = ?auto_155115 ?auto_155121 ) ) ( not ( = ?auto_155115 ?auto_155122 ) ) ( not ( = ?auto_155116 ?auto_155117 ) ) ( not ( = ?auto_155116 ?auto_155118 ) ) ( not ( = ?auto_155116 ?auto_155119 ) ) ( not ( = ?auto_155116 ?auto_155120 ) ) ( not ( = ?auto_155116 ?auto_155121 ) ) ( not ( = ?auto_155116 ?auto_155122 ) ) ( not ( = ?auto_155117 ?auto_155118 ) ) ( not ( = ?auto_155117 ?auto_155119 ) ) ( not ( = ?auto_155117 ?auto_155120 ) ) ( not ( = ?auto_155117 ?auto_155121 ) ) ( not ( = ?auto_155117 ?auto_155122 ) ) ( not ( = ?auto_155118 ?auto_155119 ) ) ( not ( = ?auto_155118 ?auto_155120 ) ) ( not ( = ?auto_155118 ?auto_155121 ) ) ( not ( = ?auto_155118 ?auto_155122 ) ) ( not ( = ?auto_155119 ?auto_155120 ) ) ( not ( = ?auto_155119 ?auto_155121 ) ) ( not ( = ?auto_155119 ?auto_155122 ) ) ( not ( = ?auto_155120 ?auto_155121 ) ) ( not ( = ?auto_155120 ?auto_155122 ) ) ( not ( = ?auto_155121 ?auto_155122 ) ) ( CLEAR ?auto_155120 ) ( ON ?auto_155121 ?auto_155122 ) ( CLEAR ?auto_155121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_155111 ?auto_155112 ?auto_155113 ?auto_155114 ?auto_155115 ?auto_155116 ?auto_155117 ?auto_155118 ?auto_155119 ?auto_155120 ?auto_155121 )
      ( MAKE-12PILE ?auto_155111 ?auto_155112 ?auto_155113 ?auto_155114 ?auto_155115 ?auto_155116 ?auto_155117 ?auto_155118 ?auto_155119 ?auto_155120 ?auto_155121 ?auto_155122 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155135 - BLOCK
      ?auto_155136 - BLOCK
      ?auto_155137 - BLOCK
      ?auto_155138 - BLOCK
      ?auto_155139 - BLOCK
      ?auto_155140 - BLOCK
      ?auto_155141 - BLOCK
      ?auto_155142 - BLOCK
      ?auto_155143 - BLOCK
      ?auto_155144 - BLOCK
      ?auto_155145 - BLOCK
      ?auto_155146 - BLOCK
    )
    :vars
    (
      ?auto_155147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155146 ?auto_155147 ) ( ON-TABLE ?auto_155135 ) ( ON ?auto_155136 ?auto_155135 ) ( ON ?auto_155137 ?auto_155136 ) ( ON ?auto_155138 ?auto_155137 ) ( ON ?auto_155139 ?auto_155138 ) ( ON ?auto_155140 ?auto_155139 ) ( ON ?auto_155141 ?auto_155140 ) ( ON ?auto_155142 ?auto_155141 ) ( ON ?auto_155143 ?auto_155142 ) ( not ( = ?auto_155135 ?auto_155136 ) ) ( not ( = ?auto_155135 ?auto_155137 ) ) ( not ( = ?auto_155135 ?auto_155138 ) ) ( not ( = ?auto_155135 ?auto_155139 ) ) ( not ( = ?auto_155135 ?auto_155140 ) ) ( not ( = ?auto_155135 ?auto_155141 ) ) ( not ( = ?auto_155135 ?auto_155142 ) ) ( not ( = ?auto_155135 ?auto_155143 ) ) ( not ( = ?auto_155135 ?auto_155144 ) ) ( not ( = ?auto_155135 ?auto_155145 ) ) ( not ( = ?auto_155135 ?auto_155146 ) ) ( not ( = ?auto_155135 ?auto_155147 ) ) ( not ( = ?auto_155136 ?auto_155137 ) ) ( not ( = ?auto_155136 ?auto_155138 ) ) ( not ( = ?auto_155136 ?auto_155139 ) ) ( not ( = ?auto_155136 ?auto_155140 ) ) ( not ( = ?auto_155136 ?auto_155141 ) ) ( not ( = ?auto_155136 ?auto_155142 ) ) ( not ( = ?auto_155136 ?auto_155143 ) ) ( not ( = ?auto_155136 ?auto_155144 ) ) ( not ( = ?auto_155136 ?auto_155145 ) ) ( not ( = ?auto_155136 ?auto_155146 ) ) ( not ( = ?auto_155136 ?auto_155147 ) ) ( not ( = ?auto_155137 ?auto_155138 ) ) ( not ( = ?auto_155137 ?auto_155139 ) ) ( not ( = ?auto_155137 ?auto_155140 ) ) ( not ( = ?auto_155137 ?auto_155141 ) ) ( not ( = ?auto_155137 ?auto_155142 ) ) ( not ( = ?auto_155137 ?auto_155143 ) ) ( not ( = ?auto_155137 ?auto_155144 ) ) ( not ( = ?auto_155137 ?auto_155145 ) ) ( not ( = ?auto_155137 ?auto_155146 ) ) ( not ( = ?auto_155137 ?auto_155147 ) ) ( not ( = ?auto_155138 ?auto_155139 ) ) ( not ( = ?auto_155138 ?auto_155140 ) ) ( not ( = ?auto_155138 ?auto_155141 ) ) ( not ( = ?auto_155138 ?auto_155142 ) ) ( not ( = ?auto_155138 ?auto_155143 ) ) ( not ( = ?auto_155138 ?auto_155144 ) ) ( not ( = ?auto_155138 ?auto_155145 ) ) ( not ( = ?auto_155138 ?auto_155146 ) ) ( not ( = ?auto_155138 ?auto_155147 ) ) ( not ( = ?auto_155139 ?auto_155140 ) ) ( not ( = ?auto_155139 ?auto_155141 ) ) ( not ( = ?auto_155139 ?auto_155142 ) ) ( not ( = ?auto_155139 ?auto_155143 ) ) ( not ( = ?auto_155139 ?auto_155144 ) ) ( not ( = ?auto_155139 ?auto_155145 ) ) ( not ( = ?auto_155139 ?auto_155146 ) ) ( not ( = ?auto_155139 ?auto_155147 ) ) ( not ( = ?auto_155140 ?auto_155141 ) ) ( not ( = ?auto_155140 ?auto_155142 ) ) ( not ( = ?auto_155140 ?auto_155143 ) ) ( not ( = ?auto_155140 ?auto_155144 ) ) ( not ( = ?auto_155140 ?auto_155145 ) ) ( not ( = ?auto_155140 ?auto_155146 ) ) ( not ( = ?auto_155140 ?auto_155147 ) ) ( not ( = ?auto_155141 ?auto_155142 ) ) ( not ( = ?auto_155141 ?auto_155143 ) ) ( not ( = ?auto_155141 ?auto_155144 ) ) ( not ( = ?auto_155141 ?auto_155145 ) ) ( not ( = ?auto_155141 ?auto_155146 ) ) ( not ( = ?auto_155141 ?auto_155147 ) ) ( not ( = ?auto_155142 ?auto_155143 ) ) ( not ( = ?auto_155142 ?auto_155144 ) ) ( not ( = ?auto_155142 ?auto_155145 ) ) ( not ( = ?auto_155142 ?auto_155146 ) ) ( not ( = ?auto_155142 ?auto_155147 ) ) ( not ( = ?auto_155143 ?auto_155144 ) ) ( not ( = ?auto_155143 ?auto_155145 ) ) ( not ( = ?auto_155143 ?auto_155146 ) ) ( not ( = ?auto_155143 ?auto_155147 ) ) ( not ( = ?auto_155144 ?auto_155145 ) ) ( not ( = ?auto_155144 ?auto_155146 ) ) ( not ( = ?auto_155144 ?auto_155147 ) ) ( not ( = ?auto_155145 ?auto_155146 ) ) ( not ( = ?auto_155145 ?auto_155147 ) ) ( not ( = ?auto_155146 ?auto_155147 ) ) ( ON ?auto_155145 ?auto_155146 ) ( CLEAR ?auto_155143 ) ( ON ?auto_155144 ?auto_155145 ) ( CLEAR ?auto_155144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_155135 ?auto_155136 ?auto_155137 ?auto_155138 ?auto_155139 ?auto_155140 ?auto_155141 ?auto_155142 ?auto_155143 ?auto_155144 )
      ( MAKE-12PILE ?auto_155135 ?auto_155136 ?auto_155137 ?auto_155138 ?auto_155139 ?auto_155140 ?auto_155141 ?auto_155142 ?auto_155143 ?auto_155144 ?auto_155145 ?auto_155146 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155160 - BLOCK
      ?auto_155161 - BLOCK
      ?auto_155162 - BLOCK
      ?auto_155163 - BLOCK
      ?auto_155164 - BLOCK
      ?auto_155165 - BLOCK
      ?auto_155166 - BLOCK
      ?auto_155167 - BLOCK
      ?auto_155168 - BLOCK
      ?auto_155169 - BLOCK
      ?auto_155170 - BLOCK
      ?auto_155171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155171 ) ( ON-TABLE ?auto_155160 ) ( ON ?auto_155161 ?auto_155160 ) ( ON ?auto_155162 ?auto_155161 ) ( ON ?auto_155163 ?auto_155162 ) ( ON ?auto_155164 ?auto_155163 ) ( ON ?auto_155165 ?auto_155164 ) ( ON ?auto_155166 ?auto_155165 ) ( ON ?auto_155167 ?auto_155166 ) ( ON ?auto_155168 ?auto_155167 ) ( not ( = ?auto_155160 ?auto_155161 ) ) ( not ( = ?auto_155160 ?auto_155162 ) ) ( not ( = ?auto_155160 ?auto_155163 ) ) ( not ( = ?auto_155160 ?auto_155164 ) ) ( not ( = ?auto_155160 ?auto_155165 ) ) ( not ( = ?auto_155160 ?auto_155166 ) ) ( not ( = ?auto_155160 ?auto_155167 ) ) ( not ( = ?auto_155160 ?auto_155168 ) ) ( not ( = ?auto_155160 ?auto_155169 ) ) ( not ( = ?auto_155160 ?auto_155170 ) ) ( not ( = ?auto_155160 ?auto_155171 ) ) ( not ( = ?auto_155161 ?auto_155162 ) ) ( not ( = ?auto_155161 ?auto_155163 ) ) ( not ( = ?auto_155161 ?auto_155164 ) ) ( not ( = ?auto_155161 ?auto_155165 ) ) ( not ( = ?auto_155161 ?auto_155166 ) ) ( not ( = ?auto_155161 ?auto_155167 ) ) ( not ( = ?auto_155161 ?auto_155168 ) ) ( not ( = ?auto_155161 ?auto_155169 ) ) ( not ( = ?auto_155161 ?auto_155170 ) ) ( not ( = ?auto_155161 ?auto_155171 ) ) ( not ( = ?auto_155162 ?auto_155163 ) ) ( not ( = ?auto_155162 ?auto_155164 ) ) ( not ( = ?auto_155162 ?auto_155165 ) ) ( not ( = ?auto_155162 ?auto_155166 ) ) ( not ( = ?auto_155162 ?auto_155167 ) ) ( not ( = ?auto_155162 ?auto_155168 ) ) ( not ( = ?auto_155162 ?auto_155169 ) ) ( not ( = ?auto_155162 ?auto_155170 ) ) ( not ( = ?auto_155162 ?auto_155171 ) ) ( not ( = ?auto_155163 ?auto_155164 ) ) ( not ( = ?auto_155163 ?auto_155165 ) ) ( not ( = ?auto_155163 ?auto_155166 ) ) ( not ( = ?auto_155163 ?auto_155167 ) ) ( not ( = ?auto_155163 ?auto_155168 ) ) ( not ( = ?auto_155163 ?auto_155169 ) ) ( not ( = ?auto_155163 ?auto_155170 ) ) ( not ( = ?auto_155163 ?auto_155171 ) ) ( not ( = ?auto_155164 ?auto_155165 ) ) ( not ( = ?auto_155164 ?auto_155166 ) ) ( not ( = ?auto_155164 ?auto_155167 ) ) ( not ( = ?auto_155164 ?auto_155168 ) ) ( not ( = ?auto_155164 ?auto_155169 ) ) ( not ( = ?auto_155164 ?auto_155170 ) ) ( not ( = ?auto_155164 ?auto_155171 ) ) ( not ( = ?auto_155165 ?auto_155166 ) ) ( not ( = ?auto_155165 ?auto_155167 ) ) ( not ( = ?auto_155165 ?auto_155168 ) ) ( not ( = ?auto_155165 ?auto_155169 ) ) ( not ( = ?auto_155165 ?auto_155170 ) ) ( not ( = ?auto_155165 ?auto_155171 ) ) ( not ( = ?auto_155166 ?auto_155167 ) ) ( not ( = ?auto_155166 ?auto_155168 ) ) ( not ( = ?auto_155166 ?auto_155169 ) ) ( not ( = ?auto_155166 ?auto_155170 ) ) ( not ( = ?auto_155166 ?auto_155171 ) ) ( not ( = ?auto_155167 ?auto_155168 ) ) ( not ( = ?auto_155167 ?auto_155169 ) ) ( not ( = ?auto_155167 ?auto_155170 ) ) ( not ( = ?auto_155167 ?auto_155171 ) ) ( not ( = ?auto_155168 ?auto_155169 ) ) ( not ( = ?auto_155168 ?auto_155170 ) ) ( not ( = ?auto_155168 ?auto_155171 ) ) ( not ( = ?auto_155169 ?auto_155170 ) ) ( not ( = ?auto_155169 ?auto_155171 ) ) ( not ( = ?auto_155170 ?auto_155171 ) ) ( ON ?auto_155170 ?auto_155171 ) ( CLEAR ?auto_155168 ) ( ON ?auto_155169 ?auto_155170 ) ( CLEAR ?auto_155169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_155160 ?auto_155161 ?auto_155162 ?auto_155163 ?auto_155164 ?auto_155165 ?auto_155166 ?auto_155167 ?auto_155168 ?auto_155169 )
      ( MAKE-12PILE ?auto_155160 ?auto_155161 ?auto_155162 ?auto_155163 ?auto_155164 ?auto_155165 ?auto_155166 ?auto_155167 ?auto_155168 ?auto_155169 ?auto_155170 ?auto_155171 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155184 - BLOCK
      ?auto_155185 - BLOCK
      ?auto_155186 - BLOCK
      ?auto_155187 - BLOCK
      ?auto_155188 - BLOCK
      ?auto_155189 - BLOCK
      ?auto_155190 - BLOCK
      ?auto_155191 - BLOCK
      ?auto_155192 - BLOCK
      ?auto_155193 - BLOCK
      ?auto_155194 - BLOCK
      ?auto_155195 - BLOCK
    )
    :vars
    (
      ?auto_155196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155195 ?auto_155196 ) ( ON-TABLE ?auto_155184 ) ( ON ?auto_155185 ?auto_155184 ) ( ON ?auto_155186 ?auto_155185 ) ( ON ?auto_155187 ?auto_155186 ) ( ON ?auto_155188 ?auto_155187 ) ( ON ?auto_155189 ?auto_155188 ) ( ON ?auto_155190 ?auto_155189 ) ( ON ?auto_155191 ?auto_155190 ) ( not ( = ?auto_155184 ?auto_155185 ) ) ( not ( = ?auto_155184 ?auto_155186 ) ) ( not ( = ?auto_155184 ?auto_155187 ) ) ( not ( = ?auto_155184 ?auto_155188 ) ) ( not ( = ?auto_155184 ?auto_155189 ) ) ( not ( = ?auto_155184 ?auto_155190 ) ) ( not ( = ?auto_155184 ?auto_155191 ) ) ( not ( = ?auto_155184 ?auto_155192 ) ) ( not ( = ?auto_155184 ?auto_155193 ) ) ( not ( = ?auto_155184 ?auto_155194 ) ) ( not ( = ?auto_155184 ?auto_155195 ) ) ( not ( = ?auto_155184 ?auto_155196 ) ) ( not ( = ?auto_155185 ?auto_155186 ) ) ( not ( = ?auto_155185 ?auto_155187 ) ) ( not ( = ?auto_155185 ?auto_155188 ) ) ( not ( = ?auto_155185 ?auto_155189 ) ) ( not ( = ?auto_155185 ?auto_155190 ) ) ( not ( = ?auto_155185 ?auto_155191 ) ) ( not ( = ?auto_155185 ?auto_155192 ) ) ( not ( = ?auto_155185 ?auto_155193 ) ) ( not ( = ?auto_155185 ?auto_155194 ) ) ( not ( = ?auto_155185 ?auto_155195 ) ) ( not ( = ?auto_155185 ?auto_155196 ) ) ( not ( = ?auto_155186 ?auto_155187 ) ) ( not ( = ?auto_155186 ?auto_155188 ) ) ( not ( = ?auto_155186 ?auto_155189 ) ) ( not ( = ?auto_155186 ?auto_155190 ) ) ( not ( = ?auto_155186 ?auto_155191 ) ) ( not ( = ?auto_155186 ?auto_155192 ) ) ( not ( = ?auto_155186 ?auto_155193 ) ) ( not ( = ?auto_155186 ?auto_155194 ) ) ( not ( = ?auto_155186 ?auto_155195 ) ) ( not ( = ?auto_155186 ?auto_155196 ) ) ( not ( = ?auto_155187 ?auto_155188 ) ) ( not ( = ?auto_155187 ?auto_155189 ) ) ( not ( = ?auto_155187 ?auto_155190 ) ) ( not ( = ?auto_155187 ?auto_155191 ) ) ( not ( = ?auto_155187 ?auto_155192 ) ) ( not ( = ?auto_155187 ?auto_155193 ) ) ( not ( = ?auto_155187 ?auto_155194 ) ) ( not ( = ?auto_155187 ?auto_155195 ) ) ( not ( = ?auto_155187 ?auto_155196 ) ) ( not ( = ?auto_155188 ?auto_155189 ) ) ( not ( = ?auto_155188 ?auto_155190 ) ) ( not ( = ?auto_155188 ?auto_155191 ) ) ( not ( = ?auto_155188 ?auto_155192 ) ) ( not ( = ?auto_155188 ?auto_155193 ) ) ( not ( = ?auto_155188 ?auto_155194 ) ) ( not ( = ?auto_155188 ?auto_155195 ) ) ( not ( = ?auto_155188 ?auto_155196 ) ) ( not ( = ?auto_155189 ?auto_155190 ) ) ( not ( = ?auto_155189 ?auto_155191 ) ) ( not ( = ?auto_155189 ?auto_155192 ) ) ( not ( = ?auto_155189 ?auto_155193 ) ) ( not ( = ?auto_155189 ?auto_155194 ) ) ( not ( = ?auto_155189 ?auto_155195 ) ) ( not ( = ?auto_155189 ?auto_155196 ) ) ( not ( = ?auto_155190 ?auto_155191 ) ) ( not ( = ?auto_155190 ?auto_155192 ) ) ( not ( = ?auto_155190 ?auto_155193 ) ) ( not ( = ?auto_155190 ?auto_155194 ) ) ( not ( = ?auto_155190 ?auto_155195 ) ) ( not ( = ?auto_155190 ?auto_155196 ) ) ( not ( = ?auto_155191 ?auto_155192 ) ) ( not ( = ?auto_155191 ?auto_155193 ) ) ( not ( = ?auto_155191 ?auto_155194 ) ) ( not ( = ?auto_155191 ?auto_155195 ) ) ( not ( = ?auto_155191 ?auto_155196 ) ) ( not ( = ?auto_155192 ?auto_155193 ) ) ( not ( = ?auto_155192 ?auto_155194 ) ) ( not ( = ?auto_155192 ?auto_155195 ) ) ( not ( = ?auto_155192 ?auto_155196 ) ) ( not ( = ?auto_155193 ?auto_155194 ) ) ( not ( = ?auto_155193 ?auto_155195 ) ) ( not ( = ?auto_155193 ?auto_155196 ) ) ( not ( = ?auto_155194 ?auto_155195 ) ) ( not ( = ?auto_155194 ?auto_155196 ) ) ( not ( = ?auto_155195 ?auto_155196 ) ) ( ON ?auto_155194 ?auto_155195 ) ( ON ?auto_155193 ?auto_155194 ) ( CLEAR ?auto_155191 ) ( ON ?auto_155192 ?auto_155193 ) ( CLEAR ?auto_155192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_155184 ?auto_155185 ?auto_155186 ?auto_155187 ?auto_155188 ?auto_155189 ?auto_155190 ?auto_155191 ?auto_155192 )
      ( MAKE-12PILE ?auto_155184 ?auto_155185 ?auto_155186 ?auto_155187 ?auto_155188 ?auto_155189 ?auto_155190 ?auto_155191 ?auto_155192 ?auto_155193 ?auto_155194 ?auto_155195 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155209 - BLOCK
      ?auto_155210 - BLOCK
      ?auto_155211 - BLOCK
      ?auto_155212 - BLOCK
      ?auto_155213 - BLOCK
      ?auto_155214 - BLOCK
      ?auto_155215 - BLOCK
      ?auto_155216 - BLOCK
      ?auto_155217 - BLOCK
      ?auto_155218 - BLOCK
      ?auto_155219 - BLOCK
      ?auto_155220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155220 ) ( ON-TABLE ?auto_155209 ) ( ON ?auto_155210 ?auto_155209 ) ( ON ?auto_155211 ?auto_155210 ) ( ON ?auto_155212 ?auto_155211 ) ( ON ?auto_155213 ?auto_155212 ) ( ON ?auto_155214 ?auto_155213 ) ( ON ?auto_155215 ?auto_155214 ) ( ON ?auto_155216 ?auto_155215 ) ( not ( = ?auto_155209 ?auto_155210 ) ) ( not ( = ?auto_155209 ?auto_155211 ) ) ( not ( = ?auto_155209 ?auto_155212 ) ) ( not ( = ?auto_155209 ?auto_155213 ) ) ( not ( = ?auto_155209 ?auto_155214 ) ) ( not ( = ?auto_155209 ?auto_155215 ) ) ( not ( = ?auto_155209 ?auto_155216 ) ) ( not ( = ?auto_155209 ?auto_155217 ) ) ( not ( = ?auto_155209 ?auto_155218 ) ) ( not ( = ?auto_155209 ?auto_155219 ) ) ( not ( = ?auto_155209 ?auto_155220 ) ) ( not ( = ?auto_155210 ?auto_155211 ) ) ( not ( = ?auto_155210 ?auto_155212 ) ) ( not ( = ?auto_155210 ?auto_155213 ) ) ( not ( = ?auto_155210 ?auto_155214 ) ) ( not ( = ?auto_155210 ?auto_155215 ) ) ( not ( = ?auto_155210 ?auto_155216 ) ) ( not ( = ?auto_155210 ?auto_155217 ) ) ( not ( = ?auto_155210 ?auto_155218 ) ) ( not ( = ?auto_155210 ?auto_155219 ) ) ( not ( = ?auto_155210 ?auto_155220 ) ) ( not ( = ?auto_155211 ?auto_155212 ) ) ( not ( = ?auto_155211 ?auto_155213 ) ) ( not ( = ?auto_155211 ?auto_155214 ) ) ( not ( = ?auto_155211 ?auto_155215 ) ) ( not ( = ?auto_155211 ?auto_155216 ) ) ( not ( = ?auto_155211 ?auto_155217 ) ) ( not ( = ?auto_155211 ?auto_155218 ) ) ( not ( = ?auto_155211 ?auto_155219 ) ) ( not ( = ?auto_155211 ?auto_155220 ) ) ( not ( = ?auto_155212 ?auto_155213 ) ) ( not ( = ?auto_155212 ?auto_155214 ) ) ( not ( = ?auto_155212 ?auto_155215 ) ) ( not ( = ?auto_155212 ?auto_155216 ) ) ( not ( = ?auto_155212 ?auto_155217 ) ) ( not ( = ?auto_155212 ?auto_155218 ) ) ( not ( = ?auto_155212 ?auto_155219 ) ) ( not ( = ?auto_155212 ?auto_155220 ) ) ( not ( = ?auto_155213 ?auto_155214 ) ) ( not ( = ?auto_155213 ?auto_155215 ) ) ( not ( = ?auto_155213 ?auto_155216 ) ) ( not ( = ?auto_155213 ?auto_155217 ) ) ( not ( = ?auto_155213 ?auto_155218 ) ) ( not ( = ?auto_155213 ?auto_155219 ) ) ( not ( = ?auto_155213 ?auto_155220 ) ) ( not ( = ?auto_155214 ?auto_155215 ) ) ( not ( = ?auto_155214 ?auto_155216 ) ) ( not ( = ?auto_155214 ?auto_155217 ) ) ( not ( = ?auto_155214 ?auto_155218 ) ) ( not ( = ?auto_155214 ?auto_155219 ) ) ( not ( = ?auto_155214 ?auto_155220 ) ) ( not ( = ?auto_155215 ?auto_155216 ) ) ( not ( = ?auto_155215 ?auto_155217 ) ) ( not ( = ?auto_155215 ?auto_155218 ) ) ( not ( = ?auto_155215 ?auto_155219 ) ) ( not ( = ?auto_155215 ?auto_155220 ) ) ( not ( = ?auto_155216 ?auto_155217 ) ) ( not ( = ?auto_155216 ?auto_155218 ) ) ( not ( = ?auto_155216 ?auto_155219 ) ) ( not ( = ?auto_155216 ?auto_155220 ) ) ( not ( = ?auto_155217 ?auto_155218 ) ) ( not ( = ?auto_155217 ?auto_155219 ) ) ( not ( = ?auto_155217 ?auto_155220 ) ) ( not ( = ?auto_155218 ?auto_155219 ) ) ( not ( = ?auto_155218 ?auto_155220 ) ) ( not ( = ?auto_155219 ?auto_155220 ) ) ( ON ?auto_155219 ?auto_155220 ) ( ON ?auto_155218 ?auto_155219 ) ( CLEAR ?auto_155216 ) ( ON ?auto_155217 ?auto_155218 ) ( CLEAR ?auto_155217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_155209 ?auto_155210 ?auto_155211 ?auto_155212 ?auto_155213 ?auto_155214 ?auto_155215 ?auto_155216 ?auto_155217 )
      ( MAKE-12PILE ?auto_155209 ?auto_155210 ?auto_155211 ?auto_155212 ?auto_155213 ?auto_155214 ?auto_155215 ?auto_155216 ?auto_155217 ?auto_155218 ?auto_155219 ?auto_155220 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155233 - BLOCK
      ?auto_155234 - BLOCK
      ?auto_155235 - BLOCK
      ?auto_155236 - BLOCK
      ?auto_155237 - BLOCK
      ?auto_155238 - BLOCK
      ?auto_155239 - BLOCK
      ?auto_155240 - BLOCK
      ?auto_155241 - BLOCK
      ?auto_155242 - BLOCK
      ?auto_155243 - BLOCK
      ?auto_155244 - BLOCK
    )
    :vars
    (
      ?auto_155245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155244 ?auto_155245 ) ( ON-TABLE ?auto_155233 ) ( ON ?auto_155234 ?auto_155233 ) ( ON ?auto_155235 ?auto_155234 ) ( ON ?auto_155236 ?auto_155235 ) ( ON ?auto_155237 ?auto_155236 ) ( ON ?auto_155238 ?auto_155237 ) ( ON ?auto_155239 ?auto_155238 ) ( not ( = ?auto_155233 ?auto_155234 ) ) ( not ( = ?auto_155233 ?auto_155235 ) ) ( not ( = ?auto_155233 ?auto_155236 ) ) ( not ( = ?auto_155233 ?auto_155237 ) ) ( not ( = ?auto_155233 ?auto_155238 ) ) ( not ( = ?auto_155233 ?auto_155239 ) ) ( not ( = ?auto_155233 ?auto_155240 ) ) ( not ( = ?auto_155233 ?auto_155241 ) ) ( not ( = ?auto_155233 ?auto_155242 ) ) ( not ( = ?auto_155233 ?auto_155243 ) ) ( not ( = ?auto_155233 ?auto_155244 ) ) ( not ( = ?auto_155233 ?auto_155245 ) ) ( not ( = ?auto_155234 ?auto_155235 ) ) ( not ( = ?auto_155234 ?auto_155236 ) ) ( not ( = ?auto_155234 ?auto_155237 ) ) ( not ( = ?auto_155234 ?auto_155238 ) ) ( not ( = ?auto_155234 ?auto_155239 ) ) ( not ( = ?auto_155234 ?auto_155240 ) ) ( not ( = ?auto_155234 ?auto_155241 ) ) ( not ( = ?auto_155234 ?auto_155242 ) ) ( not ( = ?auto_155234 ?auto_155243 ) ) ( not ( = ?auto_155234 ?auto_155244 ) ) ( not ( = ?auto_155234 ?auto_155245 ) ) ( not ( = ?auto_155235 ?auto_155236 ) ) ( not ( = ?auto_155235 ?auto_155237 ) ) ( not ( = ?auto_155235 ?auto_155238 ) ) ( not ( = ?auto_155235 ?auto_155239 ) ) ( not ( = ?auto_155235 ?auto_155240 ) ) ( not ( = ?auto_155235 ?auto_155241 ) ) ( not ( = ?auto_155235 ?auto_155242 ) ) ( not ( = ?auto_155235 ?auto_155243 ) ) ( not ( = ?auto_155235 ?auto_155244 ) ) ( not ( = ?auto_155235 ?auto_155245 ) ) ( not ( = ?auto_155236 ?auto_155237 ) ) ( not ( = ?auto_155236 ?auto_155238 ) ) ( not ( = ?auto_155236 ?auto_155239 ) ) ( not ( = ?auto_155236 ?auto_155240 ) ) ( not ( = ?auto_155236 ?auto_155241 ) ) ( not ( = ?auto_155236 ?auto_155242 ) ) ( not ( = ?auto_155236 ?auto_155243 ) ) ( not ( = ?auto_155236 ?auto_155244 ) ) ( not ( = ?auto_155236 ?auto_155245 ) ) ( not ( = ?auto_155237 ?auto_155238 ) ) ( not ( = ?auto_155237 ?auto_155239 ) ) ( not ( = ?auto_155237 ?auto_155240 ) ) ( not ( = ?auto_155237 ?auto_155241 ) ) ( not ( = ?auto_155237 ?auto_155242 ) ) ( not ( = ?auto_155237 ?auto_155243 ) ) ( not ( = ?auto_155237 ?auto_155244 ) ) ( not ( = ?auto_155237 ?auto_155245 ) ) ( not ( = ?auto_155238 ?auto_155239 ) ) ( not ( = ?auto_155238 ?auto_155240 ) ) ( not ( = ?auto_155238 ?auto_155241 ) ) ( not ( = ?auto_155238 ?auto_155242 ) ) ( not ( = ?auto_155238 ?auto_155243 ) ) ( not ( = ?auto_155238 ?auto_155244 ) ) ( not ( = ?auto_155238 ?auto_155245 ) ) ( not ( = ?auto_155239 ?auto_155240 ) ) ( not ( = ?auto_155239 ?auto_155241 ) ) ( not ( = ?auto_155239 ?auto_155242 ) ) ( not ( = ?auto_155239 ?auto_155243 ) ) ( not ( = ?auto_155239 ?auto_155244 ) ) ( not ( = ?auto_155239 ?auto_155245 ) ) ( not ( = ?auto_155240 ?auto_155241 ) ) ( not ( = ?auto_155240 ?auto_155242 ) ) ( not ( = ?auto_155240 ?auto_155243 ) ) ( not ( = ?auto_155240 ?auto_155244 ) ) ( not ( = ?auto_155240 ?auto_155245 ) ) ( not ( = ?auto_155241 ?auto_155242 ) ) ( not ( = ?auto_155241 ?auto_155243 ) ) ( not ( = ?auto_155241 ?auto_155244 ) ) ( not ( = ?auto_155241 ?auto_155245 ) ) ( not ( = ?auto_155242 ?auto_155243 ) ) ( not ( = ?auto_155242 ?auto_155244 ) ) ( not ( = ?auto_155242 ?auto_155245 ) ) ( not ( = ?auto_155243 ?auto_155244 ) ) ( not ( = ?auto_155243 ?auto_155245 ) ) ( not ( = ?auto_155244 ?auto_155245 ) ) ( ON ?auto_155243 ?auto_155244 ) ( ON ?auto_155242 ?auto_155243 ) ( ON ?auto_155241 ?auto_155242 ) ( CLEAR ?auto_155239 ) ( ON ?auto_155240 ?auto_155241 ) ( CLEAR ?auto_155240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155233 ?auto_155234 ?auto_155235 ?auto_155236 ?auto_155237 ?auto_155238 ?auto_155239 ?auto_155240 )
      ( MAKE-12PILE ?auto_155233 ?auto_155234 ?auto_155235 ?auto_155236 ?auto_155237 ?auto_155238 ?auto_155239 ?auto_155240 ?auto_155241 ?auto_155242 ?auto_155243 ?auto_155244 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155258 - BLOCK
      ?auto_155259 - BLOCK
      ?auto_155260 - BLOCK
      ?auto_155261 - BLOCK
      ?auto_155262 - BLOCK
      ?auto_155263 - BLOCK
      ?auto_155264 - BLOCK
      ?auto_155265 - BLOCK
      ?auto_155266 - BLOCK
      ?auto_155267 - BLOCK
      ?auto_155268 - BLOCK
      ?auto_155269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155269 ) ( ON-TABLE ?auto_155258 ) ( ON ?auto_155259 ?auto_155258 ) ( ON ?auto_155260 ?auto_155259 ) ( ON ?auto_155261 ?auto_155260 ) ( ON ?auto_155262 ?auto_155261 ) ( ON ?auto_155263 ?auto_155262 ) ( ON ?auto_155264 ?auto_155263 ) ( not ( = ?auto_155258 ?auto_155259 ) ) ( not ( = ?auto_155258 ?auto_155260 ) ) ( not ( = ?auto_155258 ?auto_155261 ) ) ( not ( = ?auto_155258 ?auto_155262 ) ) ( not ( = ?auto_155258 ?auto_155263 ) ) ( not ( = ?auto_155258 ?auto_155264 ) ) ( not ( = ?auto_155258 ?auto_155265 ) ) ( not ( = ?auto_155258 ?auto_155266 ) ) ( not ( = ?auto_155258 ?auto_155267 ) ) ( not ( = ?auto_155258 ?auto_155268 ) ) ( not ( = ?auto_155258 ?auto_155269 ) ) ( not ( = ?auto_155259 ?auto_155260 ) ) ( not ( = ?auto_155259 ?auto_155261 ) ) ( not ( = ?auto_155259 ?auto_155262 ) ) ( not ( = ?auto_155259 ?auto_155263 ) ) ( not ( = ?auto_155259 ?auto_155264 ) ) ( not ( = ?auto_155259 ?auto_155265 ) ) ( not ( = ?auto_155259 ?auto_155266 ) ) ( not ( = ?auto_155259 ?auto_155267 ) ) ( not ( = ?auto_155259 ?auto_155268 ) ) ( not ( = ?auto_155259 ?auto_155269 ) ) ( not ( = ?auto_155260 ?auto_155261 ) ) ( not ( = ?auto_155260 ?auto_155262 ) ) ( not ( = ?auto_155260 ?auto_155263 ) ) ( not ( = ?auto_155260 ?auto_155264 ) ) ( not ( = ?auto_155260 ?auto_155265 ) ) ( not ( = ?auto_155260 ?auto_155266 ) ) ( not ( = ?auto_155260 ?auto_155267 ) ) ( not ( = ?auto_155260 ?auto_155268 ) ) ( not ( = ?auto_155260 ?auto_155269 ) ) ( not ( = ?auto_155261 ?auto_155262 ) ) ( not ( = ?auto_155261 ?auto_155263 ) ) ( not ( = ?auto_155261 ?auto_155264 ) ) ( not ( = ?auto_155261 ?auto_155265 ) ) ( not ( = ?auto_155261 ?auto_155266 ) ) ( not ( = ?auto_155261 ?auto_155267 ) ) ( not ( = ?auto_155261 ?auto_155268 ) ) ( not ( = ?auto_155261 ?auto_155269 ) ) ( not ( = ?auto_155262 ?auto_155263 ) ) ( not ( = ?auto_155262 ?auto_155264 ) ) ( not ( = ?auto_155262 ?auto_155265 ) ) ( not ( = ?auto_155262 ?auto_155266 ) ) ( not ( = ?auto_155262 ?auto_155267 ) ) ( not ( = ?auto_155262 ?auto_155268 ) ) ( not ( = ?auto_155262 ?auto_155269 ) ) ( not ( = ?auto_155263 ?auto_155264 ) ) ( not ( = ?auto_155263 ?auto_155265 ) ) ( not ( = ?auto_155263 ?auto_155266 ) ) ( not ( = ?auto_155263 ?auto_155267 ) ) ( not ( = ?auto_155263 ?auto_155268 ) ) ( not ( = ?auto_155263 ?auto_155269 ) ) ( not ( = ?auto_155264 ?auto_155265 ) ) ( not ( = ?auto_155264 ?auto_155266 ) ) ( not ( = ?auto_155264 ?auto_155267 ) ) ( not ( = ?auto_155264 ?auto_155268 ) ) ( not ( = ?auto_155264 ?auto_155269 ) ) ( not ( = ?auto_155265 ?auto_155266 ) ) ( not ( = ?auto_155265 ?auto_155267 ) ) ( not ( = ?auto_155265 ?auto_155268 ) ) ( not ( = ?auto_155265 ?auto_155269 ) ) ( not ( = ?auto_155266 ?auto_155267 ) ) ( not ( = ?auto_155266 ?auto_155268 ) ) ( not ( = ?auto_155266 ?auto_155269 ) ) ( not ( = ?auto_155267 ?auto_155268 ) ) ( not ( = ?auto_155267 ?auto_155269 ) ) ( not ( = ?auto_155268 ?auto_155269 ) ) ( ON ?auto_155268 ?auto_155269 ) ( ON ?auto_155267 ?auto_155268 ) ( ON ?auto_155266 ?auto_155267 ) ( CLEAR ?auto_155264 ) ( ON ?auto_155265 ?auto_155266 ) ( CLEAR ?auto_155265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_155258 ?auto_155259 ?auto_155260 ?auto_155261 ?auto_155262 ?auto_155263 ?auto_155264 ?auto_155265 )
      ( MAKE-12PILE ?auto_155258 ?auto_155259 ?auto_155260 ?auto_155261 ?auto_155262 ?auto_155263 ?auto_155264 ?auto_155265 ?auto_155266 ?auto_155267 ?auto_155268 ?auto_155269 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155282 - BLOCK
      ?auto_155283 - BLOCK
      ?auto_155284 - BLOCK
      ?auto_155285 - BLOCK
      ?auto_155286 - BLOCK
      ?auto_155287 - BLOCK
      ?auto_155288 - BLOCK
      ?auto_155289 - BLOCK
      ?auto_155290 - BLOCK
      ?auto_155291 - BLOCK
      ?auto_155292 - BLOCK
      ?auto_155293 - BLOCK
    )
    :vars
    (
      ?auto_155294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155293 ?auto_155294 ) ( ON-TABLE ?auto_155282 ) ( ON ?auto_155283 ?auto_155282 ) ( ON ?auto_155284 ?auto_155283 ) ( ON ?auto_155285 ?auto_155284 ) ( ON ?auto_155286 ?auto_155285 ) ( ON ?auto_155287 ?auto_155286 ) ( not ( = ?auto_155282 ?auto_155283 ) ) ( not ( = ?auto_155282 ?auto_155284 ) ) ( not ( = ?auto_155282 ?auto_155285 ) ) ( not ( = ?auto_155282 ?auto_155286 ) ) ( not ( = ?auto_155282 ?auto_155287 ) ) ( not ( = ?auto_155282 ?auto_155288 ) ) ( not ( = ?auto_155282 ?auto_155289 ) ) ( not ( = ?auto_155282 ?auto_155290 ) ) ( not ( = ?auto_155282 ?auto_155291 ) ) ( not ( = ?auto_155282 ?auto_155292 ) ) ( not ( = ?auto_155282 ?auto_155293 ) ) ( not ( = ?auto_155282 ?auto_155294 ) ) ( not ( = ?auto_155283 ?auto_155284 ) ) ( not ( = ?auto_155283 ?auto_155285 ) ) ( not ( = ?auto_155283 ?auto_155286 ) ) ( not ( = ?auto_155283 ?auto_155287 ) ) ( not ( = ?auto_155283 ?auto_155288 ) ) ( not ( = ?auto_155283 ?auto_155289 ) ) ( not ( = ?auto_155283 ?auto_155290 ) ) ( not ( = ?auto_155283 ?auto_155291 ) ) ( not ( = ?auto_155283 ?auto_155292 ) ) ( not ( = ?auto_155283 ?auto_155293 ) ) ( not ( = ?auto_155283 ?auto_155294 ) ) ( not ( = ?auto_155284 ?auto_155285 ) ) ( not ( = ?auto_155284 ?auto_155286 ) ) ( not ( = ?auto_155284 ?auto_155287 ) ) ( not ( = ?auto_155284 ?auto_155288 ) ) ( not ( = ?auto_155284 ?auto_155289 ) ) ( not ( = ?auto_155284 ?auto_155290 ) ) ( not ( = ?auto_155284 ?auto_155291 ) ) ( not ( = ?auto_155284 ?auto_155292 ) ) ( not ( = ?auto_155284 ?auto_155293 ) ) ( not ( = ?auto_155284 ?auto_155294 ) ) ( not ( = ?auto_155285 ?auto_155286 ) ) ( not ( = ?auto_155285 ?auto_155287 ) ) ( not ( = ?auto_155285 ?auto_155288 ) ) ( not ( = ?auto_155285 ?auto_155289 ) ) ( not ( = ?auto_155285 ?auto_155290 ) ) ( not ( = ?auto_155285 ?auto_155291 ) ) ( not ( = ?auto_155285 ?auto_155292 ) ) ( not ( = ?auto_155285 ?auto_155293 ) ) ( not ( = ?auto_155285 ?auto_155294 ) ) ( not ( = ?auto_155286 ?auto_155287 ) ) ( not ( = ?auto_155286 ?auto_155288 ) ) ( not ( = ?auto_155286 ?auto_155289 ) ) ( not ( = ?auto_155286 ?auto_155290 ) ) ( not ( = ?auto_155286 ?auto_155291 ) ) ( not ( = ?auto_155286 ?auto_155292 ) ) ( not ( = ?auto_155286 ?auto_155293 ) ) ( not ( = ?auto_155286 ?auto_155294 ) ) ( not ( = ?auto_155287 ?auto_155288 ) ) ( not ( = ?auto_155287 ?auto_155289 ) ) ( not ( = ?auto_155287 ?auto_155290 ) ) ( not ( = ?auto_155287 ?auto_155291 ) ) ( not ( = ?auto_155287 ?auto_155292 ) ) ( not ( = ?auto_155287 ?auto_155293 ) ) ( not ( = ?auto_155287 ?auto_155294 ) ) ( not ( = ?auto_155288 ?auto_155289 ) ) ( not ( = ?auto_155288 ?auto_155290 ) ) ( not ( = ?auto_155288 ?auto_155291 ) ) ( not ( = ?auto_155288 ?auto_155292 ) ) ( not ( = ?auto_155288 ?auto_155293 ) ) ( not ( = ?auto_155288 ?auto_155294 ) ) ( not ( = ?auto_155289 ?auto_155290 ) ) ( not ( = ?auto_155289 ?auto_155291 ) ) ( not ( = ?auto_155289 ?auto_155292 ) ) ( not ( = ?auto_155289 ?auto_155293 ) ) ( not ( = ?auto_155289 ?auto_155294 ) ) ( not ( = ?auto_155290 ?auto_155291 ) ) ( not ( = ?auto_155290 ?auto_155292 ) ) ( not ( = ?auto_155290 ?auto_155293 ) ) ( not ( = ?auto_155290 ?auto_155294 ) ) ( not ( = ?auto_155291 ?auto_155292 ) ) ( not ( = ?auto_155291 ?auto_155293 ) ) ( not ( = ?auto_155291 ?auto_155294 ) ) ( not ( = ?auto_155292 ?auto_155293 ) ) ( not ( = ?auto_155292 ?auto_155294 ) ) ( not ( = ?auto_155293 ?auto_155294 ) ) ( ON ?auto_155292 ?auto_155293 ) ( ON ?auto_155291 ?auto_155292 ) ( ON ?auto_155290 ?auto_155291 ) ( ON ?auto_155289 ?auto_155290 ) ( CLEAR ?auto_155287 ) ( ON ?auto_155288 ?auto_155289 ) ( CLEAR ?auto_155288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155282 ?auto_155283 ?auto_155284 ?auto_155285 ?auto_155286 ?auto_155287 ?auto_155288 )
      ( MAKE-12PILE ?auto_155282 ?auto_155283 ?auto_155284 ?auto_155285 ?auto_155286 ?auto_155287 ?auto_155288 ?auto_155289 ?auto_155290 ?auto_155291 ?auto_155292 ?auto_155293 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155307 - BLOCK
      ?auto_155308 - BLOCK
      ?auto_155309 - BLOCK
      ?auto_155310 - BLOCK
      ?auto_155311 - BLOCK
      ?auto_155312 - BLOCK
      ?auto_155313 - BLOCK
      ?auto_155314 - BLOCK
      ?auto_155315 - BLOCK
      ?auto_155316 - BLOCK
      ?auto_155317 - BLOCK
      ?auto_155318 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155318 ) ( ON-TABLE ?auto_155307 ) ( ON ?auto_155308 ?auto_155307 ) ( ON ?auto_155309 ?auto_155308 ) ( ON ?auto_155310 ?auto_155309 ) ( ON ?auto_155311 ?auto_155310 ) ( ON ?auto_155312 ?auto_155311 ) ( not ( = ?auto_155307 ?auto_155308 ) ) ( not ( = ?auto_155307 ?auto_155309 ) ) ( not ( = ?auto_155307 ?auto_155310 ) ) ( not ( = ?auto_155307 ?auto_155311 ) ) ( not ( = ?auto_155307 ?auto_155312 ) ) ( not ( = ?auto_155307 ?auto_155313 ) ) ( not ( = ?auto_155307 ?auto_155314 ) ) ( not ( = ?auto_155307 ?auto_155315 ) ) ( not ( = ?auto_155307 ?auto_155316 ) ) ( not ( = ?auto_155307 ?auto_155317 ) ) ( not ( = ?auto_155307 ?auto_155318 ) ) ( not ( = ?auto_155308 ?auto_155309 ) ) ( not ( = ?auto_155308 ?auto_155310 ) ) ( not ( = ?auto_155308 ?auto_155311 ) ) ( not ( = ?auto_155308 ?auto_155312 ) ) ( not ( = ?auto_155308 ?auto_155313 ) ) ( not ( = ?auto_155308 ?auto_155314 ) ) ( not ( = ?auto_155308 ?auto_155315 ) ) ( not ( = ?auto_155308 ?auto_155316 ) ) ( not ( = ?auto_155308 ?auto_155317 ) ) ( not ( = ?auto_155308 ?auto_155318 ) ) ( not ( = ?auto_155309 ?auto_155310 ) ) ( not ( = ?auto_155309 ?auto_155311 ) ) ( not ( = ?auto_155309 ?auto_155312 ) ) ( not ( = ?auto_155309 ?auto_155313 ) ) ( not ( = ?auto_155309 ?auto_155314 ) ) ( not ( = ?auto_155309 ?auto_155315 ) ) ( not ( = ?auto_155309 ?auto_155316 ) ) ( not ( = ?auto_155309 ?auto_155317 ) ) ( not ( = ?auto_155309 ?auto_155318 ) ) ( not ( = ?auto_155310 ?auto_155311 ) ) ( not ( = ?auto_155310 ?auto_155312 ) ) ( not ( = ?auto_155310 ?auto_155313 ) ) ( not ( = ?auto_155310 ?auto_155314 ) ) ( not ( = ?auto_155310 ?auto_155315 ) ) ( not ( = ?auto_155310 ?auto_155316 ) ) ( not ( = ?auto_155310 ?auto_155317 ) ) ( not ( = ?auto_155310 ?auto_155318 ) ) ( not ( = ?auto_155311 ?auto_155312 ) ) ( not ( = ?auto_155311 ?auto_155313 ) ) ( not ( = ?auto_155311 ?auto_155314 ) ) ( not ( = ?auto_155311 ?auto_155315 ) ) ( not ( = ?auto_155311 ?auto_155316 ) ) ( not ( = ?auto_155311 ?auto_155317 ) ) ( not ( = ?auto_155311 ?auto_155318 ) ) ( not ( = ?auto_155312 ?auto_155313 ) ) ( not ( = ?auto_155312 ?auto_155314 ) ) ( not ( = ?auto_155312 ?auto_155315 ) ) ( not ( = ?auto_155312 ?auto_155316 ) ) ( not ( = ?auto_155312 ?auto_155317 ) ) ( not ( = ?auto_155312 ?auto_155318 ) ) ( not ( = ?auto_155313 ?auto_155314 ) ) ( not ( = ?auto_155313 ?auto_155315 ) ) ( not ( = ?auto_155313 ?auto_155316 ) ) ( not ( = ?auto_155313 ?auto_155317 ) ) ( not ( = ?auto_155313 ?auto_155318 ) ) ( not ( = ?auto_155314 ?auto_155315 ) ) ( not ( = ?auto_155314 ?auto_155316 ) ) ( not ( = ?auto_155314 ?auto_155317 ) ) ( not ( = ?auto_155314 ?auto_155318 ) ) ( not ( = ?auto_155315 ?auto_155316 ) ) ( not ( = ?auto_155315 ?auto_155317 ) ) ( not ( = ?auto_155315 ?auto_155318 ) ) ( not ( = ?auto_155316 ?auto_155317 ) ) ( not ( = ?auto_155316 ?auto_155318 ) ) ( not ( = ?auto_155317 ?auto_155318 ) ) ( ON ?auto_155317 ?auto_155318 ) ( ON ?auto_155316 ?auto_155317 ) ( ON ?auto_155315 ?auto_155316 ) ( ON ?auto_155314 ?auto_155315 ) ( CLEAR ?auto_155312 ) ( ON ?auto_155313 ?auto_155314 ) ( CLEAR ?auto_155313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_155307 ?auto_155308 ?auto_155309 ?auto_155310 ?auto_155311 ?auto_155312 ?auto_155313 )
      ( MAKE-12PILE ?auto_155307 ?auto_155308 ?auto_155309 ?auto_155310 ?auto_155311 ?auto_155312 ?auto_155313 ?auto_155314 ?auto_155315 ?auto_155316 ?auto_155317 ?auto_155318 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155331 - BLOCK
      ?auto_155332 - BLOCK
      ?auto_155333 - BLOCK
      ?auto_155334 - BLOCK
      ?auto_155335 - BLOCK
      ?auto_155336 - BLOCK
      ?auto_155337 - BLOCK
      ?auto_155338 - BLOCK
      ?auto_155339 - BLOCK
      ?auto_155340 - BLOCK
      ?auto_155341 - BLOCK
      ?auto_155342 - BLOCK
    )
    :vars
    (
      ?auto_155343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155342 ?auto_155343 ) ( ON-TABLE ?auto_155331 ) ( ON ?auto_155332 ?auto_155331 ) ( ON ?auto_155333 ?auto_155332 ) ( ON ?auto_155334 ?auto_155333 ) ( ON ?auto_155335 ?auto_155334 ) ( not ( = ?auto_155331 ?auto_155332 ) ) ( not ( = ?auto_155331 ?auto_155333 ) ) ( not ( = ?auto_155331 ?auto_155334 ) ) ( not ( = ?auto_155331 ?auto_155335 ) ) ( not ( = ?auto_155331 ?auto_155336 ) ) ( not ( = ?auto_155331 ?auto_155337 ) ) ( not ( = ?auto_155331 ?auto_155338 ) ) ( not ( = ?auto_155331 ?auto_155339 ) ) ( not ( = ?auto_155331 ?auto_155340 ) ) ( not ( = ?auto_155331 ?auto_155341 ) ) ( not ( = ?auto_155331 ?auto_155342 ) ) ( not ( = ?auto_155331 ?auto_155343 ) ) ( not ( = ?auto_155332 ?auto_155333 ) ) ( not ( = ?auto_155332 ?auto_155334 ) ) ( not ( = ?auto_155332 ?auto_155335 ) ) ( not ( = ?auto_155332 ?auto_155336 ) ) ( not ( = ?auto_155332 ?auto_155337 ) ) ( not ( = ?auto_155332 ?auto_155338 ) ) ( not ( = ?auto_155332 ?auto_155339 ) ) ( not ( = ?auto_155332 ?auto_155340 ) ) ( not ( = ?auto_155332 ?auto_155341 ) ) ( not ( = ?auto_155332 ?auto_155342 ) ) ( not ( = ?auto_155332 ?auto_155343 ) ) ( not ( = ?auto_155333 ?auto_155334 ) ) ( not ( = ?auto_155333 ?auto_155335 ) ) ( not ( = ?auto_155333 ?auto_155336 ) ) ( not ( = ?auto_155333 ?auto_155337 ) ) ( not ( = ?auto_155333 ?auto_155338 ) ) ( not ( = ?auto_155333 ?auto_155339 ) ) ( not ( = ?auto_155333 ?auto_155340 ) ) ( not ( = ?auto_155333 ?auto_155341 ) ) ( not ( = ?auto_155333 ?auto_155342 ) ) ( not ( = ?auto_155333 ?auto_155343 ) ) ( not ( = ?auto_155334 ?auto_155335 ) ) ( not ( = ?auto_155334 ?auto_155336 ) ) ( not ( = ?auto_155334 ?auto_155337 ) ) ( not ( = ?auto_155334 ?auto_155338 ) ) ( not ( = ?auto_155334 ?auto_155339 ) ) ( not ( = ?auto_155334 ?auto_155340 ) ) ( not ( = ?auto_155334 ?auto_155341 ) ) ( not ( = ?auto_155334 ?auto_155342 ) ) ( not ( = ?auto_155334 ?auto_155343 ) ) ( not ( = ?auto_155335 ?auto_155336 ) ) ( not ( = ?auto_155335 ?auto_155337 ) ) ( not ( = ?auto_155335 ?auto_155338 ) ) ( not ( = ?auto_155335 ?auto_155339 ) ) ( not ( = ?auto_155335 ?auto_155340 ) ) ( not ( = ?auto_155335 ?auto_155341 ) ) ( not ( = ?auto_155335 ?auto_155342 ) ) ( not ( = ?auto_155335 ?auto_155343 ) ) ( not ( = ?auto_155336 ?auto_155337 ) ) ( not ( = ?auto_155336 ?auto_155338 ) ) ( not ( = ?auto_155336 ?auto_155339 ) ) ( not ( = ?auto_155336 ?auto_155340 ) ) ( not ( = ?auto_155336 ?auto_155341 ) ) ( not ( = ?auto_155336 ?auto_155342 ) ) ( not ( = ?auto_155336 ?auto_155343 ) ) ( not ( = ?auto_155337 ?auto_155338 ) ) ( not ( = ?auto_155337 ?auto_155339 ) ) ( not ( = ?auto_155337 ?auto_155340 ) ) ( not ( = ?auto_155337 ?auto_155341 ) ) ( not ( = ?auto_155337 ?auto_155342 ) ) ( not ( = ?auto_155337 ?auto_155343 ) ) ( not ( = ?auto_155338 ?auto_155339 ) ) ( not ( = ?auto_155338 ?auto_155340 ) ) ( not ( = ?auto_155338 ?auto_155341 ) ) ( not ( = ?auto_155338 ?auto_155342 ) ) ( not ( = ?auto_155338 ?auto_155343 ) ) ( not ( = ?auto_155339 ?auto_155340 ) ) ( not ( = ?auto_155339 ?auto_155341 ) ) ( not ( = ?auto_155339 ?auto_155342 ) ) ( not ( = ?auto_155339 ?auto_155343 ) ) ( not ( = ?auto_155340 ?auto_155341 ) ) ( not ( = ?auto_155340 ?auto_155342 ) ) ( not ( = ?auto_155340 ?auto_155343 ) ) ( not ( = ?auto_155341 ?auto_155342 ) ) ( not ( = ?auto_155341 ?auto_155343 ) ) ( not ( = ?auto_155342 ?auto_155343 ) ) ( ON ?auto_155341 ?auto_155342 ) ( ON ?auto_155340 ?auto_155341 ) ( ON ?auto_155339 ?auto_155340 ) ( ON ?auto_155338 ?auto_155339 ) ( ON ?auto_155337 ?auto_155338 ) ( CLEAR ?auto_155335 ) ( ON ?auto_155336 ?auto_155337 ) ( CLEAR ?auto_155336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155331 ?auto_155332 ?auto_155333 ?auto_155334 ?auto_155335 ?auto_155336 )
      ( MAKE-12PILE ?auto_155331 ?auto_155332 ?auto_155333 ?auto_155334 ?auto_155335 ?auto_155336 ?auto_155337 ?auto_155338 ?auto_155339 ?auto_155340 ?auto_155341 ?auto_155342 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155356 - BLOCK
      ?auto_155357 - BLOCK
      ?auto_155358 - BLOCK
      ?auto_155359 - BLOCK
      ?auto_155360 - BLOCK
      ?auto_155361 - BLOCK
      ?auto_155362 - BLOCK
      ?auto_155363 - BLOCK
      ?auto_155364 - BLOCK
      ?auto_155365 - BLOCK
      ?auto_155366 - BLOCK
      ?auto_155367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155367 ) ( ON-TABLE ?auto_155356 ) ( ON ?auto_155357 ?auto_155356 ) ( ON ?auto_155358 ?auto_155357 ) ( ON ?auto_155359 ?auto_155358 ) ( ON ?auto_155360 ?auto_155359 ) ( not ( = ?auto_155356 ?auto_155357 ) ) ( not ( = ?auto_155356 ?auto_155358 ) ) ( not ( = ?auto_155356 ?auto_155359 ) ) ( not ( = ?auto_155356 ?auto_155360 ) ) ( not ( = ?auto_155356 ?auto_155361 ) ) ( not ( = ?auto_155356 ?auto_155362 ) ) ( not ( = ?auto_155356 ?auto_155363 ) ) ( not ( = ?auto_155356 ?auto_155364 ) ) ( not ( = ?auto_155356 ?auto_155365 ) ) ( not ( = ?auto_155356 ?auto_155366 ) ) ( not ( = ?auto_155356 ?auto_155367 ) ) ( not ( = ?auto_155357 ?auto_155358 ) ) ( not ( = ?auto_155357 ?auto_155359 ) ) ( not ( = ?auto_155357 ?auto_155360 ) ) ( not ( = ?auto_155357 ?auto_155361 ) ) ( not ( = ?auto_155357 ?auto_155362 ) ) ( not ( = ?auto_155357 ?auto_155363 ) ) ( not ( = ?auto_155357 ?auto_155364 ) ) ( not ( = ?auto_155357 ?auto_155365 ) ) ( not ( = ?auto_155357 ?auto_155366 ) ) ( not ( = ?auto_155357 ?auto_155367 ) ) ( not ( = ?auto_155358 ?auto_155359 ) ) ( not ( = ?auto_155358 ?auto_155360 ) ) ( not ( = ?auto_155358 ?auto_155361 ) ) ( not ( = ?auto_155358 ?auto_155362 ) ) ( not ( = ?auto_155358 ?auto_155363 ) ) ( not ( = ?auto_155358 ?auto_155364 ) ) ( not ( = ?auto_155358 ?auto_155365 ) ) ( not ( = ?auto_155358 ?auto_155366 ) ) ( not ( = ?auto_155358 ?auto_155367 ) ) ( not ( = ?auto_155359 ?auto_155360 ) ) ( not ( = ?auto_155359 ?auto_155361 ) ) ( not ( = ?auto_155359 ?auto_155362 ) ) ( not ( = ?auto_155359 ?auto_155363 ) ) ( not ( = ?auto_155359 ?auto_155364 ) ) ( not ( = ?auto_155359 ?auto_155365 ) ) ( not ( = ?auto_155359 ?auto_155366 ) ) ( not ( = ?auto_155359 ?auto_155367 ) ) ( not ( = ?auto_155360 ?auto_155361 ) ) ( not ( = ?auto_155360 ?auto_155362 ) ) ( not ( = ?auto_155360 ?auto_155363 ) ) ( not ( = ?auto_155360 ?auto_155364 ) ) ( not ( = ?auto_155360 ?auto_155365 ) ) ( not ( = ?auto_155360 ?auto_155366 ) ) ( not ( = ?auto_155360 ?auto_155367 ) ) ( not ( = ?auto_155361 ?auto_155362 ) ) ( not ( = ?auto_155361 ?auto_155363 ) ) ( not ( = ?auto_155361 ?auto_155364 ) ) ( not ( = ?auto_155361 ?auto_155365 ) ) ( not ( = ?auto_155361 ?auto_155366 ) ) ( not ( = ?auto_155361 ?auto_155367 ) ) ( not ( = ?auto_155362 ?auto_155363 ) ) ( not ( = ?auto_155362 ?auto_155364 ) ) ( not ( = ?auto_155362 ?auto_155365 ) ) ( not ( = ?auto_155362 ?auto_155366 ) ) ( not ( = ?auto_155362 ?auto_155367 ) ) ( not ( = ?auto_155363 ?auto_155364 ) ) ( not ( = ?auto_155363 ?auto_155365 ) ) ( not ( = ?auto_155363 ?auto_155366 ) ) ( not ( = ?auto_155363 ?auto_155367 ) ) ( not ( = ?auto_155364 ?auto_155365 ) ) ( not ( = ?auto_155364 ?auto_155366 ) ) ( not ( = ?auto_155364 ?auto_155367 ) ) ( not ( = ?auto_155365 ?auto_155366 ) ) ( not ( = ?auto_155365 ?auto_155367 ) ) ( not ( = ?auto_155366 ?auto_155367 ) ) ( ON ?auto_155366 ?auto_155367 ) ( ON ?auto_155365 ?auto_155366 ) ( ON ?auto_155364 ?auto_155365 ) ( ON ?auto_155363 ?auto_155364 ) ( ON ?auto_155362 ?auto_155363 ) ( CLEAR ?auto_155360 ) ( ON ?auto_155361 ?auto_155362 ) ( CLEAR ?auto_155361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_155356 ?auto_155357 ?auto_155358 ?auto_155359 ?auto_155360 ?auto_155361 )
      ( MAKE-12PILE ?auto_155356 ?auto_155357 ?auto_155358 ?auto_155359 ?auto_155360 ?auto_155361 ?auto_155362 ?auto_155363 ?auto_155364 ?auto_155365 ?auto_155366 ?auto_155367 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155380 - BLOCK
      ?auto_155381 - BLOCK
      ?auto_155382 - BLOCK
      ?auto_155383 - BLOCK
      ?auto_155384 - BLOCK
      ?auto_155385 - BLOCK
      ?auto_155386 - BLOCK
      ?auto_155387 - BLOCK
      ?auto_155388 - BLOCK
      ?auto_155389 - BLOCK
      ?auto_155390 - BLOCK
      ?auto_155391 - BLOCK
    )
    :vars
    (
      ?auto_155392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155391 ?auto_155392 ) ( ON-TABLE ?auto_155380 ) ( ON ?auto_155381 ?auto_155380 ) ( ON ?auto_155382 ?auto_155381 ) ( ON ?auto_155383 ?auto_155382 ) ( not ( = ?auto_155380 ?auto_155381 ) ) ( not ( = ?auto_155380 ?auto_155382 ) ) ( not ( = ?auto_155380 ?auto_155383 ) ) ( not ( = ?auto_155380 ?auto_155384 ) ) ( not ( = ?auto_155380 ?auto_155385 ) ) ( not ( = ?auto_155380 ?auto_155386 ) ) ( not ( = ?auto_155380 ?auto_155387 ) ) ( not ( = ?auto_155380 ?auto_155388 ) ) ( not ( = ?auto_155380 ?auto_155389 ) ) ( not ( = ?auto_155380 ?auto_155390 ) ) ( not ( = ?auto_155380 ?auto_155391 ) ) ( not ( = ?auto_155380 ?auto_155392 ) ) ( not ( = ?auto_155381 ?auto_155382 ) ) ( not ( = ?auto_155381 ?auto_155383 ) ) ( not ( = ?auto_155381 ?auto_155384 ) ) ( not ( = ?auto_155381 ?auto_155385 ) ) ( not ( = ?auto_155381 ?auto_155386 ) ) ( not ( = ?auto_155381 ?auto_155387 ) ) ( not ( = ?auto_155381 ?auto_155388 ) ) ( not ( = ?auto_155381 ?auto_155389 ) ) ( not ( = ?auto_155381 ?auto_155390 ) ) ( not ( = ?auto_155381 ?auto_155391 ) ) ( not ( = ?auto_155381 ?auto_155392 ) ) ( not ( = ?auto_155382 ?auto_155383 ) ) ( not ( = ?auto_155382 ?auto_155384 ) ) ( not ( = ?auto_155382 ?auto_155385 ) ) ( not ( = ?auto_155382 ?auto_155386 ) ) ( not ( = ?auto_155382 ?auto_155387 ) ) ( not ( = ?auto_155382 ?auto_155388 ) ) ( not ( = ?auto_155382 ?auto_155389 ) ) ( not ( = ?auto_155382 ?auto_155390 ) ) ( not ( = ?auto_155382 ?auto_155391 ) ) ( not ( = ?auto_155382 ?auto_155392 ) ) ( not ( = ?auto_155383 ?auto_155384 ) ) ( not ( = ?auto_155383 ?auto_155385 ) ) ( not ( = ?auto_155383 ?auto_155386 ) ) ( not ( = ?auto_155383 ?auto_155387 ) ) ( not ( = ?auto_155383 ?auto_155388 ) ) ( not ( = ?auto_155383 ?auto_155389 ) ) ( not ( = ?auto_155383 ?auto_155390 ) ) ( not ( = ?auto_155383 ?auto_155391 ) ) ( not ( = ?auto_155383 ?auto_155392 ) ) ( not ( = ?auto_155384 ?auto_155385 ) ) ( not ( = ?auto_155384 ?auto_155386 ) ) ( not ( = ?auto_155384 ?auto_155387 ) ) ( not ( = ?auto_155384 ?auto_155388 ) ) ( not ( = ?auto_155384 ?auto_155389 ) ) ( not ( = ?auto_155384 ?auto_155390 ) ) ( not ( = ?auto_155384 ?auto_155391 ) ) ( not ( = ?auto_155384 ?auto_155392 ) ) ( not ( = ?auto_155385 ?auto_155386 ) ) ( not ( = ?auto_155385 ?auto_155387 ) ) ( not ( = ?auto_155385 ?auto_155388 ) ) ( not ( = ?auto_155385 ?auto_155389 ) ) ( not ( = ?auto_155385 ?auto_155390 ) ) ( not ( = ?auto_155385 ?auto_155391 ) ) ( not ( = ?auto_155385 ?auto_155392 ) ) ( not ( = ?auto_155386 ?auto_155387 ) ) ( not ( = ?auto_155386 ?auto_155388 ) ) ( not ( = ?auto_155386 ?auto_155389 ) ) ( not ( = ?auto_155386 ?auto_155390 ) ) ( not ( = ?auto_155386 ?auto_155391 ) ) ( not ( = ?auto_155386 ?auto_155392 ) ) ( not ( = ?auto_155387 ?auto_155388 ) ) ( not ( = ?auto_155387 ?auto_155389 ) ) ( not ( = ?auto_155387 ?auto_155390 ) ) ( not ( = ?auto_155387 ?auto_155391 ) ) ( not ( = ?auto_155387 ?auto_155392 ) ) ( not ( = ?auto_155388 ?auto_155389 ) ) ( not ( = ?auto_155388 ?auto_155390 ) ) ( not ( = ?auto_155388 ?auto_155391 ) ) ( not ( = ?auto_155388 ?auto_155392 ) ) ( not ( = ?auto_155389 ?auto_155390 ) ) ( not ( = ?auto_155389 ?auto_155391 ) ) ( not ( = ?auto_155389 ?auto_155392 ) ) ( not ( = ?auto_155390 ?auto_155391 ) ) ( not ( = ?auto_155390 ?auto_155392 ) ) ( not ( = ?auto_155391 ?auto_155392 ) ) ( ON ?auto_155390 ?auto_155391 ) ( ON ?auto_155389 ?auto_155390 ) ( ON ?auto_155388 ?auto_155389 ) ( ON ?auto_155387 ?auto_155388 ) ( ON ?auto_155386 ?auto_155387 ) ( ON ?auto_155385 ?auto_155386 ) ( CLEAR ?auto_155383 ) ( ON ?auto_155384 ?auto_155385 ) ( CLEAR ?auto_155384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155380 ?auto_155381 ?auto_155382 ?auto_155383 ?auto_155384 )
      ( MAKE-12PILE ?auto_155380 ?auto_155381 ?auto_155382 ?auto_155383 ?auto_155384 ?auto_155385 ?auto_155386 ?auto_155387 ?auto_155388 ?auto_155389 ?auto_155390 ?auto_155391 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155405 - BLOCK
      ?auto_155406 - BLOCK
      ?auto_155407 - BLOCK
      ?auto_155408 - BLOCK
      ?auto_155409 - BLOCK
      ?auto_155410 - BLOCK
      ?auto_155411 - BLOCK
      ?auto_155412 - BLOCK
      ?auto_155413 - BLOCK
      ?auto_155414 - BLOCK
      ?auto_155415 - BLOCK
      ?auto_155416 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155416 ) ( ON-TABLE ?auto_155405 ) ( ON ?auto_155406 ?auto_155405 ) ( ON ?auto_155407 ?auto_155406 ) ( ON ?auto_155408 ?auto_155407 ) ( not ( = ?auto_155405 ?auto_155406 ) ) ( not ( = ?auto_155405 ?auto_155407 ) ) ( not ( = ?auto_155405 ?auto_155408 ) ) ( not ( = ?auto_155405 ?auto_155409 ) ) ( not ( = ?auto_155405 ?auto_155410 ) ) ( not ( = ?auto_155405 ?auto_155411 ) ) ( not ( = ?auto_155405 ?auto_155412 ) ) ( not ( = ?auto_155405 ?auto_155413 ) ) ( not ( = ?auto_155405 ?auto_155414 ) ) ( not ( = ?auto_155405 ?auto_155415 ) ) ( not ( = ?auto_155405 ?auto_155416 ) ) ( not ( = ?auto_155406 ?auto_155407 ) ) ( not ( = ?auto_155406 ?auto_155408 ) ) ( not ( = ?auto_155406 ?auto_155409 ) ) ( not ( = ?auto_155406 ?auto_155410 ) ) ( not ( = ?auto_155406 ?auto_155411 ) ) ( not ( = ?auto_155406 ?auto_155412 ) ) ( not ( = ?auto_155406 ?auto_155413 ) ) ( not ( = ?auto_155406 ?auto_155414 ) ) ( not ( = ?auto_155406 ?auto_155415 ) ) ( not ( = ?auto_155406 ?auto_155416 ) ) ( not ( = ?auto_155407 ?auto_155408 ) ) ( not ( = ?auto_155407 ?auto_155409 ) ) ( not ( = ?auto_155407 ?auto_155410 ) ) ( not ( = ?auto_155407 ?auto_155411 ) ) ( not ( = ?auto_155407 ?auto_155412 ) ) ( not ( = ?auto_155407 ?auto_155413 ) ) ( not ( = ?auto_155407 ?auto_155414 ) ) ( not ( = ?auto_155407 ?auto_155415 ) ) ( not ( = ?auto_155407 ?auto_155416 ) ) ( not ( = ?auto_155408 ?auto_155409 ) ) ( not ( = ?auto_155408 ?auto_155410 ) ) ( not ( = ?auto_155408 ?auto_155411 ) ) ( not ( = ?auto_155408 ?auto_155412 ) ) ( not ( = ?auto_155408 ?auto_155413 ) ) ( not ( = ?auto_155408 ?auto_155414 ) ) ( not ( = ?auto_155408 ?auto_155415 ) ) ( not ( = ?auto_155408 ?auto_155416 ) ) ( not ( = ?auto_155409 ?auto_155410 ) ) ( not ( = ?auto_155409 ?auto_155411 ) ) ( not ( = ?auto_155409 ?auto_155412 ) ) ( not ( = ?auto_155409 ?auto_155413 ) ) ( not ( = ?auto_155409 ?auto_155414 ) ) ( not ( = ?auto_155409 ?auto_155415 ) ) ( not ( = ?auto_155409 ?auto_155416 ) ) ( not ( = ?auto_155410 ?auto_155411 ) ) ( not ( = ?auto_155410 ?auto_155412 ) ) ( not ( = ?auto_155410 ?auto_155413 ) ) ( not ( = ?auto_155410 ?auto_155414 ) ) ( not ( = ?auto_155410 ?auto_155415 ) ) ( not ( = ?auto_155410 ?auto_155416 ) ) ( not ( = ?auto_155411 ?auto_155412 ) ) ( not ( = ?auto_155411 ?auto_155413 ) ) ( not ( = ?auto_155411 ?auto_155414 ) ) ( not ( = ?auto_155411 ?auto_155415 ) ) ( not ( = ?auto_155411 ?auto_155416 ) ) ( not ( = ?auto_155412 ?auto_155413 ) ) ( not ( = ?auto_155412 ?auto_155414 ) ) ( not ( = ?auto_155412 ?auto_155415 ) ) ( not ( = ?auto_155412 ?auto_155416 ) ) ( not ( = ?auto_155413 ?auto_155414 ) ) ( not ( = ?auto_155413 ?auto_155415 ) ) ( not ( = ?auto_155413 ?auto_155416 ) ) ( not ( = ?auto_155414 ?auto_155415 ) ) ( not ( = ?auto_155414 ?auto_155416 ) ) ( not ( = ?auto_155415 ?auto_155416 ) ) ( ON ?auto_155415 ?auto_155416 ) ( ON ?auto_155414 ?auto_155415 ) ( ON ?auto_155413 ?auto_155414 ) ( ON ?auto_155412 ?auto_155413 ) ( ON ?auto_155411 ?auto_155412 ) ( ON ?auto_155410 ?auto_155411 ) ( CLEAR ?auto_155408 ) ( ON ?auto_155409 ?auto_155410 ) ( CLEAR ?auto_155409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_155405 ?auto_155406 ?auto_155407 ?auto_155408 ?auto_155409 )
      ( MAKE-12PILE ?auto_155405 ?auto_155406 ?auto_155407 ?auto_155408 ?auto_155409 ?auto_155410 ?auto_155411 ?auto_155412 ?auto_155413 ?auto_155414 ?auto_155415 ?auto_155416 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155429 - BLOCK
      ?auto_155430 - BLOCK
      ?auto_155431 - BLOCK
      ?auto_155432 - BLOCK
      ?auto_155433 - BLOCK
      ?auto_155434 - BLOCK
      ?auto_155435 - BLOCK
      ?auto_155436 - BLOCK
      ?auto_155437 - BLOCK
      ?auto_155438 - BLOCK
      ?auto_155439 - BLOCK
      ?auto_155440 - BLOCK
    )
    :vars
    (
      ?auto_155441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155440 ?auto_155441 ) ( ON-TABLE ?auto_155429 ) ( ON ?auto_155430 ?auto_155429 ) ( ON ?auto_155431 ?auto_155430 ) ( not ( = ?auto_155429 ?auto_155430 ) ) ( not ( = ?auto_155429 ?auto_155431 ) ) ( not ( = ?auto_155429 ?auto_155432 ) ) ( not ( = ?auto_155429 ?auto_155433 ) ) ( not ( = ?auto_155429 ?auto_155434 ) ) ( not ( = ?auto_155429 ?auto_155435 ) ) ( not ( = ?auto_155429 ?auto_155436 ) ) ( not ( = ?auto_155429 ?auto_155437 ) ) ( not ( = ?auto_155429 ?auto_155438 ) ) ( not ( = ?auto_155429 ?auto_155439 ) ) ( not ( = ?auto_155429 ?auto_155440 ) ) ( not ( = ?auto_155429 ?auto_155441 ) ) ( not ( = ?auto_155430 ?auto_155431 ) ) ( not ( = ?auto_155430 ?auto_155432 ) ) ( not ( = ?auto_155430 ?auto_155433 ) ) ( not ( = ?auto_155430 ?auto_155434 ) ) ( not ( = ?auto_155430 ?auto_155435 ) ) ( not ( = ?auto_155430 ?auto_155436 ) ) ( not ( = ?auto_155430 ?auto_155437 ) ) ( not ( = ?auto_155430 ?auto_155438 ) ) ( not ( = ?auto_155430 ?auto_155439 ) ) ( not ( = ?auto_155430 ?auto_155440 ) ) ( not ( = ?auto_155430 ?auto_155441 ) ) ( not ( = ?auto_155431 ?auto_155432 ) ) ( not ( = ?auto_155431 ?auto_155433 ) ) ( not ( = ?auto_155431 ?auto_155434 ) ) ( not ( = ?auto_155431 ?auto_155435 ) ) ( not ( = ?auto_155431 ?auto_155436 ) ) ( not ( = ?auto_155431 ?auto_155437 ) ) ( not ( = ?auto_155431 ?auto_155438 ) ) ( not ( = ?auto_155431 ?auto_155439 ) ) ( not ( = ?auto_155431 ?auto_155440 ) ) ( not ( = ?auto_155431 ?auto_155441 ) ) ( not ( = ?auto_155432 ?auto_155433 ) ) ( not ( = ?auto_155432 ?auto_155434 ) ) ( not ( = ?auto_155432 ?auto_155435 ) ) ( not ( = ?auto_155432 ?auto_155436 ) ) ( not ( = ?auto_155432 ?auto_155437 ) ) ( not ( = ?auto_155432 ?auto_155438 ) ) ( not ( = ?auto_155432 ?auto_155439 ) ) ( not ( = ?auto_155432 ?auto_155440 ) ) ( not ( = ?auto_155432 ?auto_155441 ) ) ( not ( = ?auto_155433 ?auto_155434 ) ) ( not ( = ?auto_155433 ?auto_155435 ) ) ( not ( = ?auto_155433 ?auto_155436 ) ) ( not ( = ?auto_155433 ?auto_155437 ) ) ( not ( = ?auto_155433 ?auto_155438 ) ) ( not ( = ?auto_155433 ?auto_155439 ) ) ( not ( = ?auto_155433 ?auto_155440 ) ) ( not ( = ?auto_155433 ?auto_155441 ) ) ( not ( = ?auto_155434 ?auto_155435 ) ) ( not ( = ?auto_155434 ?auto_155436 ) ) ( not ( = ?auto_155434 ?auto_155437 ) ) ( not ( = ?auto_155434 ?auto_155438 ) ) ( not ( = ?auto_155434 ?auto_155439 ) ) ( not ( = ?auto_155434 ?auto_155440 ) ) ( not ( = ?auto_155434 ?auto_155441 ) ) ( not ( = ?auto_155435 ?auto_155436 ) ) ( not ( = ?auto_155435 ?auto_155437 ) ) ( not ( = ?auto_155435 ?auto_155438 ) ) ( not ( = ?auto_155435 ?auto_155439 ) ) ( not ( = ?auto_155435 ?auto_155440 ) ) ( not ( = ?auto_155435 ?auto_155441 ) ) ( not ( = ?auto_155436 ?auto_155437 ) ) ( not ( = ?auto_155436 ?auto_155438 ) ) ( not ( = ?auto_155436 ?auto_155439 ) ) ( not ( = ?auto_155436 ?auto_155440 ) ) ( not ( = ?auto_155436 ?auto_155441 ) ) ( not ( = ?auto_155437 ?auto_155438 ) ) ( not ( = ?auto_155437 ?auto_155439 ) ) ( not ( = ?auto_155437 ?auto_155440 ) ) ( not ( = ?auto_155437 ?auto_155441 ) ) ( not ( = ?auto_155438 ?auto_155439 ) ) ( not ( = ?auto_155438 ?auto_155440 ) ) ( not ( = ?auto_155438 ?auto_155441 ) ) ( not ( = ?auto_155439 ?auto_155440 ) ) ( not ( = ?auto_155439 ?auto_155441 ) ) ( not ( = ?auto_155440 ?auto_155441 ) ) ( ON ?auto_155439 ?auto_155440 ) ( ON ?auto_155438 ?auto_155439 ) ( ON ?auto_155437 ?auto_155438 ) ( ON ?auto_155436 ?auto_155437 ) ( ON ?auto_155435 ?auto_155436 ) ( ON ?auto_155434 ?auto_155435 ) ( ON ?auto_155433 ?auto_155434 ) ( CLEAR ?auto_155431 ) ( ON ?auto_155432 ?auto_155433 ) ( CLEAR ?auto_155432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155429 ?auto_155430 ?auto_155431 ?auto_155432 )
      ( MAKE-12PILE ?auto_155429 ?auto_155430 ?auto_155431 ?auto_155432 ?auto_155433 ?auto_155434 ?auto_155435 ?auto_155436 ?auto_155437 ?auto_155438 ?auto_155439 ?auto_155440 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155454 - BLOCK
      ?auto_155455 - BLOCK
      ?auto_155456 - BLOCK
      ?auto_155457 - BLOCK
      ?auto_155458 - BLOCK
      ?auto_155459 - BLOCK
      ?auto_155460 - BLOCK
      ?auto_155461 - BLOCK
      ?auto_155462 - BLOCK
      ?auto_155463 - BLOCK
      ?auto_155464 - BLOCK
      ?auto_155465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155465 ) ( ON-TABLE ?auto_155454 ) ( ON ?auto_155455 ?auto_155454 ) ( ON ?auto_155456 ?auto_155455 ) ( not ( = ?auto_155454 ?auto_155455 ) ) ( not ( = ?auto_155454 ?auto_155456 ) ) ( not ( = ?auto_155454 ?auto_155457 ) ) ( not ( = ?auto_155454 ?auto_155458 ) ) ( not ( = ?auto_155454 ?auto_155459 ) ) ( not ( = ?auto_155454 ?auto_155460 ) ) ( not ( = ?auto_155454 ?auto_155461 ) ) ( not ( = ?auto_155454 ?auto_155462 ) ) ( not ( = ?auto_155454 ?auto_155463 ) ) ( not ( = ?auto_155454 ?auto_155464 ) ) ( not ( = ?auto_155454 ?auto_155465 ) ) ( not ( = ?auto_155455 ?auto_155456 ) ) ( not ( = ?auto_155455 ?auto_155457 ) ) ( not ( = ?auto_155455 ?auto_155458 ) ) ( not ( = ?auto_155455 ?auto_155459 ) ) ( not ( = ?auto_155455 ?auto_155460 ) ) ( not ( = ?auto_155455 ?auto_155461 ) ) ( not ( = ?auto_155455 ?auto_155462 ) ) ( not ( = ?auto_155455 ?auto_155463 ) ) ( not ( = ?auto_155455 ?auto_155464 ) ) ( not ( = ?auto_155455 ?auto_155465 ) ) ( not ( = ?auto_155456 ?auto_155457 ) ) ( not ( = ?auto_155456 ?auto_155458 ) ) ( not ( = ?auto_155456 ?auto_155459 ) ) ( not ( = ?auto_155456 ?auto_155460 ) ) ( not ( = ?auto_155456 ?auto_155461 ) ) ( not ( = ?auto_155456 ?auto_155462 ) ) ( not ( = ?auto_155456 ?auto_155463 ) ) ( not ( = ?auto_155456 ?auto_155464 ) ) ( not ( = ?auto_155456 ?auto_155465 ) ) ( not ( = ?auto_155457 ?auto_155458 ) ) ( not ( = ?auto_155457 ?auto_155459 ) ) ( not ( = ?auto_155457 ?auto_155460 ) ) ( not ( = ?auto_155457 ?auto_155461 ) ) ( not ( = ?auto_155457 ?auto_155462 ) ) ( not ( = ?auto_155457 ?auto_155463 ) ) ( not ( = ?auto_155457 ?auto_155464 ) ) ( not ( = ?auto_155457 ?auto_155465 ) ) ( not ( = ?auto_155458 ?auto_155459 ) ) ( not ( = ?auto_155458 ?auto_155460 ) ) ( not ( = ?auto_155458 ?auto_155461 ) ) ( not ( = ?auto_155458 ?auto_155462 ) ) ( not ( = ?auto_155458 ?auto_155463 ) ) ( not ( = ?auto_155458 ?auto_155464 ) ) ( not ( = ?auto_155458 ?auto_155465 ) ) ( not ( = ?auto_155459 ?auto_155460 ) ) ( not ( = ?auto_155459 ?auto_155461 ) ) ( not ( = ?auto_155459 ?auto_155462 ) ) ( not ( = ?auto_155459 ?auto_155463 ) ) ( not ( = ?auto_155459 ?auto_155464 ) ) ( not ( = ?auto_155459 ?auto_155465 ) ) ( not ( = ?auto_155460 ?auto_155461 ) ) ( not ( = ?auto_155460 ?auto_155462 ) ) ( not ( = ?auto_155460 ?auto_155463 ) ) ( not ( = ?auto_155460 ?auto_155464 ) ) ( not ( = ?auto_155460 ?auto_155465 ) ) ( not ( = ?auto_155461 ?auto_155462 ) ) ( not ( = ?auto_155461 ?auto_155463 ) ) ( not ( = ?auto_155461 ?auto_155464 ) ) ( not ( = ?auto_155461 ?auto_155465 ) ) ( not ( = ?auto_155462 ?auto_155463 ) ) ( not ( = ?auto_155462 ?auto_155464 ) ) ( not ( = ?auto_155462 ?auto_155465 ) ) ( not ( = ?auto_155463 ?auto_155464 ) ) ( not ( = ?auto_155463 ?auto_155465 ) ) ( not ( = ?auto_155464 ?auto_155465 ) ) ( ON ?auto_155464 ?auto_155465 ) ( ON ?auto_155463 ?auto_155464 ) ( ON ?auto_155462 ?auto_155463 ) ( ON ?auto_155461 ?auto_155462 ) ( ON ?auto_155460 ?auto_155461 ) ( ON ?auto_155459 ?auto_155460 ) ( ON ?auto_155458 ?auto_155459 ) ( CLEAR ?auto_155456 ) ( ON ?auto_155457 ?auto_155458 ) ( CLEAR ?auto_155457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_155454 ?auto_155455 ?auto_155456 ?auto_155457 )
      ( MAKE-12PILE ?auto_155454 ?auto_155455 ?auto_155456 ?auto_155457 ?auto_155458 ?auto_155459 ?auto_155460 ?auto_155461 ?auto_155462 ?auto_155463 ?auto_155464 ?auto_155465 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155478 - BLOCK
      ?auto_155479 - BLOCK
      ?auto_155480 - BLOCK
      ?auto_155481 - BLOCK
      ?auto_155482 - BLOCK
      ?auto_155483 - BLOCK
      ?auto_155484 - BLOCK
      ?auto_155485 - BLOCK
      ?auto_155486 - BLOCK
      ?auto_155487 - BLOCK
      ?auto_155488 - BLOCK
      ?auto_155489 - BLOCK
    )
    :vars
    (
      ?auto_155490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155489 ?auto_155490 ) ( ON-TABLE ?auto_155478 ) ( ON ?auto_155479 ?auto_155478 ) ( not ( = ?auto_155478 ?auto_155479 ) ) ( not ( = ?auto_155478 ?auto_155480 ) ) ( not ( = ?auto_155478 ?auto_155481 ) ) ( not ( = ?auto_155478 ?auto_155482 ) ) ( not ( = ?auto_155478 ?auto_155483 ) ) ( not ( = ?auto_155478 ?auto_155484 ) ) ( not ( = ?auto_155478 ?auto_155485 ) ) ( not ( = ?auto_155478 ?auto_155486 ) ) ( not ( = ?auto_155478 ?auto_155487 ) ) ( not ( = ?auto_155478 ?auto_155488 ) ) ( not ( = ?auto_155478 ?auto_155489 ) ) ( not ( = ?auto_155478 ?auto_155490 ) ) ( not ( = ?auto_155479 ?auto_155480 ) ) ( not ( = ?auto_155479 ?auto_155481 ) ) ( not ( = ?auto_155479 ?auto_155482 ) ) ( not ( = ?auto_155479 ?auto_155483 ) ) ( not ( = ?auto_155479 ?auto_155484 ) ) ( not ( = ?auto_155479 ?auto_155485 ) ) ( not ( = ?auto_155479 ?auto_155486 ) ) ( not ( = ?auto_155479 ?auto_155487 ) ) ( not ( = ?auto_155479 ?auto_155488 ) ) ( not ( = ?auto_155479 ?auto_155489 ) ) ( not ( = ?auto_155479 ?auto_155490 ) ) ( not ( = ?auto_155480 ?auto_155481 ) ) ( not ( = ?auto_155480 ?auto_155482 ) ) ( not ( = ?auto_155480 ?auto_155483 ) ) ( not ( = ?auto_155480 ?auto_155484 ) ) ( not ( = ?auto_155480 ?auto_155485 ) ) ( not ( = ?auto_155480 ?auto_155486 ) ) ( not ( = ?auto_155480 ?auto_155487 ) ) ( not ( = ?auto_155480 ?auto_155488 ) ) ( not ( = ?auto_155480 ?auto_155489 ) ) ( not ( = ?auto_155480 ?auto_155490 ) ) ( not ( = ?auto_155481 ?auto_155482 ) ) ( not ( = ?auto_155481 ?auto_155483 ) ) ( not ( = ?auto_155481 ?auto_155484 ) ) ( not ( = ?auto_155481 ?auto_155485 ) ) ( not ( = ?auto_155481 ?auto_155486 ) ) ( not ( = ?auto_155481 ?auto_155487 ) ) ( not ( = ?auto_155481 ?auto_155488 ) ) ( not ( = ?auto_155481 ?auto_155489 ) ) ( not ( = ?auto_155481 ?auto_155490 ) ) ( not ( = ?auto_155482 ?auto_155483 ) ) ( not ( = ?auto_155482 ?auto_155484 ) ) ( not ( = ?auto_155482 ?auto_155485 ) ) ( not ( = ?auto_155482 ?auto_155486 ) ) ( not ( = ?auto_155482 ?auto_155487 ) ) ( not ( = ?auto_155482 ?auto_155488 ) ) ( not ( = ?auto_155482 ?auto_155489 ) ) ( not ( = ?auto_155482 ?auto_155490 ) ) ( not ( = ?auto_155483 ?auto_155484 ) ) ( not ( = ?auto_155483 ?auto_155485 ) ) ( not ( = ?auto_155483 ?auto_155486 ) ) ( not ( = ?auto_155483 ?auto_155487 ) ) ( not ( = ?auto_155483 ?auto_155488 ) ) ( not ( = ?auto_155483 ?auto_155489 ) ) ( not ( = ?auto_155483 ?auto_155490 ) ) ( not ( = ?auto_155484 ?auto_155485 ) ) ( not ( = ?auto_155484 ?auto_155486 ) ) ( not ( = ?auto_155484 ?auto_155487 ) ) ( not ( = ?auto_155484 ?auto_155488 ) ) ( not ( = ?auto_155484 ?auto_155489 ) ) ( not ( = ?auto_155484 ?auto_155490 ) ) ( not ( = ?auto_155485 ?auto_155486 ) ) ( not ( = ?auto_155485 ?auto_155487 ) ) ( not ( = ?auto_155485 ?auto_155488 ) ) ( not ( = ?auto_155485 ?auto_155489 ) ) ( not ( = ?auto_155485 ?auto_155490 ) ) ( not ( = ?auto_155486 ?auto_155487 ) ) ( not ( = ?auto_155486 ?auto_155488 ) ) ( not ( = ?auto_155486 ?auto_155489 ) ) ( not ( = ?auto_155486 ?auto_155490 ) ) ( not ( = ?auto_155487 ?auto_155488 ) ) ( not ( = ?auto_155487 ?auto_155489 ) ) ( not ( = ?auto_155487 ?auto_155490 ) ) ( not ( = ?auto_155488 ?auto_155489 ) ) ( not ( = ?auto_155488 ?auto_155490 ) ) ( not ( = ?auto_155489 ?auto_155490 ) ) ( ON ?auto_155488 ?auto_155489 ) ( ON ?auto_155487 ?auto_155488 ) ( ON ?auto_155486 ?auto_155487 ) ( ON ?auto_155485 ?auto_155486 ) ( ON ?auto_155484 ?auto_155485 ) ( ON ?auto_155483 ?auto_155484 ) ( ON ?auto_155482 ?auto_155483 ) ( ON ?auto_155481 ?auto_155482 ) ( CLEAR ?auto_155479 ) ( ON ?auto_155480 ?auto_155481 ) ( CLEAR ?auto_155480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155478 ?auto_155479 ?auto_155480 )
      ( MAKE-12PILE ?auto_155478 ?auto_155479 ?auto_155480 ?auto_155481 ?auto_155482 ?auto_155483 ?auto_155484 ?auto_155485 ?auto_155486 ?auto_155487 ?auto_155488 ?auto_155489 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155503 - BLOCK
      ?auto_155504 - BLOCK
      ?auto_155505 - BLOCK
      ?auto_155506 - BLOCK
      ?auto_155507 - BLOCK
      ?auto_155508 - BLOCK
      ?auto_155509 - BLOCK
      ?auto_155510 - BLOCK
      ?auto_155511 - BLOCK
      ?auto_155512 - BLOCK
      ?auto_155513 - BLOCK
      ?auto_155514 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155514 ) ( ON-TABLE ?auto_155503 ) ( ON ?auto_155504 ?auto_155503 ) ( not ( = ?auto_155503 ?auto_155504 ) ) ( not ( = ?auto_155503 ?auto_155505 ) ) ( not ( = ?auto_155503 ?auto_155506 ) ) ( not ( = ?auto_155503 ?auto_155507 ) ) ( not ( = ?auto_155503 ?auto_155508 ) ) ( not ( = ?auto_155503 ?auto_155509 ) ) ( not ( = ?auto_155503 ?auto_155510 ) ) ( not ( = ?auto_155503 ?auto_155511 ) ) ( not ( = ?auto_155503 ?auto_155512 ) ) ( not ( = ?auto_155503 ?auto_155513 ) ) ( not ( = ?auto_155503 ?auto_155514 ) ) ( not ( = ?auto_155504 ?auto_155505 ) ) ( not ( = ?auto_155504 ?auto_155506 ) ) ( not ( = ?auto_155504 ?auto_155507 ) ) ( not ( = ?auto_155504 ?auto_155508 ) ) ( not ( = ?auto_155504 ?auto_155509 ) ) ( not ( = ?auto_155504 ?auto_155510 ) ) ( not ( = ?auto_155504 ?auto_155511 ) ) ( not ( = ?auto_155504 ?auto_155512 ) ) ( not ( = ?auto_155504 ?auto_155513 ) ) ( not ( = ?auto_155504 ?auto_155514 ) ) ( not ( = ?auto_155505 ?auto_155506 ) ) ( not ( = ?auto_155505 ?auto_155507 ) ) ( not ( = ?auto_155505 ?auto_155508 ) ) ( not ( = ?auto_155505 ?auto_155509 ) ) ( not ( = ?auto_155505 ?auto_155510 ) ) ( not ( = ?auto_155505 ?auto_155511 ) ) ( not ( = ?auto_155505 ?auto_155512 ) ) ( not ( = ?auto_155505 ?auto_155513 ) ) ( not ( = ?auto_155505 ?auto_155514 ) ) ( not ( = ?auto_155506 ?auto_155507 ) ) ( not ( = ?auto_155506 ?auto_155508 ) ) ( not ( = ?auto_155506 ?auto_155509 ) ) ( not ( = ?auto_155506 ?auto_155510 ) ) ( not ( = ?auto_155506 ?auto_155511 ) ) ( not ( = ?auto_155506 ?auto_155512 ) ) ( not ( = ?auto_155506 ?auto_155513 ) ) ( not ( = ?auto_155506 ?auto_155514 ) ) ( not ( = ?auto_155507 ?auto_155508 ) ) ( not ( = ?auto_155507 ?auto_155509 ) ) ( not ( = ?auto_155507 ?auto_155510 ) ) ( not ( = ?auto_155507 ?auto_155511 ) ) ( not ( = ?auto_155507 ?auto_155512 ) ) ( not ( = ?auto_155507 ?auto_155513 ) ) ( not ( = ?auto_155507 ?auto_155514 ) ) ( not ( = ?auto_155508 ?auto_155509 ) ) ( not ( = ?auto_155508 ?auto_155510 ) ) ( not ( = ?auto_155508 ?auto_155511 ) ) ( not ( = ?auto_155508 ?auto_155512 ) ) ( not ( = ?auto_155508 ?auto_155513 ) ) ( not ( = ?auto_155508 ?auto_155514 ) ) ( not ( = ?auto_155509 ?auto_155510 ) ) ( not ( = ?auto_155509 ?auto_155511 ) ) ( not ( = ?auto_155509 ?auto_155512 ) ) ( not ( = ?auto_155509 ?auto_155513 ) ) ( not ( = ?auto_155509 ?auto_155514 ) ) ( not ( = ?auto_155510 ?auto_155511 ) ) ( not ( = ?auto_155510 ?auto_155512 ) ) ( not ( = ?auto_155510 ?auto_155513 ) ) ( not ( = ?auto_155510 ?auto_155514 ) ) ( not ( = ?auto_155511 ?auto_155512 ) ) ( not ( = ?auto_155511 ?auto_155513 ) ) ( not ( = ?auto_155511 ?auto_155514 ) ) ( not ( = ?auto_155512 ?auto_155513 ) ) ( not ( = ?auto_155512 ?auto_155514 ) ) ( not ( = ?auto_155513 ?auto_155514 ) ) ( ON ?auto_155513 ?auto_155514 ) ( ON ?auto_155512 ?auto_155513 ) ( ON ?auto_155511 ?auto_155512 ) ( ON ?auto_155510 ?auto_155511 ) ( ON ?auto_155509 ?auto_155510 ) ( ON ?auto_155508 ?auto_155509 ) ( ON ?auto_155507 ?auto_155508 ) ( ON ?auto_155506 ?auto_155507 ) ( CLEAR ?auto_155504 ) ( ON ?auto_155505 ?auto_155506 ) ( CLEAR ?auto_155505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_155503 ?auto_155504 ?auto_155505 )
      ( MAKE-12PILE ?auto_155503 ?auto_155504 ?auto_155505 ?auto_155506 ?auto_155507 ?auto_155508 ?auto_155509 ?auto_155510 ?auto_155511 ?auto_155512 ?auto_155513 ?auto_155514 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155527 - BLOCK
      ?auto_155528 - BLOCK
      ?auto_155529 - BLOCK
      ?auto_155530 - BLOCK
      ?auto_155531 - BLOCK
      ?auto_155532 - BLOCK
      ?auto_155533 - BLOCK
      ?auto_155534 - BLOCK
      ?auto_155535 - BLOCK
      ?auto_155536 - BLOCK
      ?auto_155537 - BLOCK
      ?auto_155538 - BLOCK
    )
    :vars
    (
      ?auto_155539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155538 ?auto_155539 ) ( ON-TABLE ?auto_155527 ) ( not ( = ?auto_155527 ?auto_155528 ) ) ( not ( = ?auto_155527 ?auto_155529 ) ) ( not ( = ?auto_155527 ?auto_155530 ) ) ( not ( = ?auto_155527 ?auto_155531 ) ) ( not ( = ?auto_155527 ?auto_155532 ) ) ( not ( = ?auto_155527 ?auto_155533 ) ) ( not ( = ?auto_155527 ?auto_155534 ) ) ( not ( = ?auto_155527 ?auto_155535 ) ) ( not ( = ?auto_155527 ?auto_155536 ) ) ( not ( = ?auto_155527 ?auto_155537 ) ) ( not ( = ?auto_155527 ?auto_155538 ) ) ( not ( = ?auto_155527 ?auto_155539 ) ) ( not ( = ?auto_155528 ?auto_155529 ) ) ( not ( = ?auto_155528 ?auto_155530 ) ) ( not ( = ?auto_155528 ?auto_155531 ) ) ( not ( = ?auto_155528 ?auto_155532 ) ) ( not ( = ?auto_155528 ?auto_155533 ) ) ( not ( = ?auto_155528 ?auto_155534 ) ) ( not ( = ?auto_155528 ?auto_155535 ) ) ( not ( = ?auto_155528 ?auto_155536 ) ) ( not ( = ?auto_155528 ?auto_155537 ) ) ( not ( = ?auto_155528 ?auto_155538 ) ) ( not ( = ?auto_155528 ?auto_155539 ) ) ( not ( = ?auto_155529 ?auto_155530 ) ) ( not ( = ?auto_155529 ?auto_155531 ) ) ( not ( = ?auto_155529 ?auto_155532 ) ) ( not ( = ?auto_155529 ?auto_155533 ) ) ( not ( = ?auto_155529 ?auto_155534 ) ) ( not ( = ?auto_155529 ?auto_155535 ) ) ( not ( = ?auto_155529 ?auto_155536 ) ) ( not ( = ?auto_155529 ?auto_155537 ) ) ( not ( = ?auto_155529 ?auto_155538 ) ) ( not ( = ?auto_155529 ?auto_155539 ) ) ( not ( = ?auto_155530 ?auto_155531 ) ) ( not ( = ?auto_155530 ?auto_155532 ) ) ( not ( = ?auto_155530 ?auto_155533 ) ) ( not ( = ?auto_155530 ?auto_155534 ) ) ( not ( = ?auto_155530 ?auto_155535 ) ) ( not ( = ?auto_155530 ?auto_155536 ) ) ( not ( = ?auto_155530 ?auto_155537 ) ) ( not ( = ?auto_155530 ?auto_155538 ) ) ( not ( = ?auto_155530 ?auto_155539 ) ) ( not ( = ?auto_155531 ?auto_155532 ) ) ( not ( = ?auto_155531 ?auto_155533 ) ) ( not ( = ?auto_155531 ?auto_155534 ) ) ( not ( = ?auto_155531 ?auto_155535 ) ) ( not ( = ?auto_155531 ?auto_155536 ) ) ( not ( = ?auto_155531 ?auto_155537 ) ) ( not ( = ?auto_155531 ?auto_155538 ) ) ( not ( = ?auto_155531 ?auto_155539 ) ) ( not ( = ?auto_155532 ?auto_155533 ) ) ( not ( = ?auto_155532 ?auto_155534 ) ) ( not ( = ?auto_155532 ?auto_155535 ) ) ( not ( = ?auto_155532 ?auto_155536 ) ) ( not ( = ?auto_155532 ?auto_155537 ) ) ( not ( = ?auto_155532 ?auto_155538 ) ) ( not ( = ?auto_155532 ?auto_155539 ) ) ( not ( = ?auto_155533 ?auto_155534 ) ) ( not ( = ?auto_155533 ?auto_155535 ) ) ( not ( = ?auto_155533 ?auto_155536 ) ) ( not ( = ?auto_155533 ?auto_155537 ) ) ( not ( = ?auto_155533 ?auto_155538 ) ) ( not ( = ?auto_155533 ?auto_155539 ) ) ( not ( = ?auto_155534 ?auto_155535 ) ) ( not ( = ?auto_155534 ?auto_155536 ) ) ( not ( = ?auto_155534 ?auto_155537 ) ) ( not ( = ?auto_155534 ?auto_155538 ) ) ( not ( = ?auto_155534 ?auto_155539 ) ) ( not ( = ?auto_155535 ?auto_155536 ) ) ( not ( = ?auto_155535 ?auto_155537 ) ) ( not ( = ?auto_155535 ?auto_155538 ) ) ( not ( = ?auto_155535 ?auto_155539 ) ) ( not ( = ?auto_155536 ?auto_155537 ) ) ( not ( = ?auto_155536 ?auto_155538 ) ) ( not ( = ?auto_155536 ?auto_155539 ) ) ( not ( = ?auto_155537 ?auto_155538 ) ) ( not ( = ?auto_155537 ?auto_155539 ) ) ( not ( = ?auto_155538 ?auto_155539 ) ) ( ON ?auto_155537 ?auto_155538 ) ( ON ?auto_155536 ?auto_155537 ) ( ON ?auto_155535 ?auto_155536 ) ( ON ?auto_155534 ?auto_155535 ) ( ON ?auto_155533 ?auto_155534 ) ( ON ?auto_155532 ?auto_155533 ) ( ON ?auto_155531 ?auto_155532 ) ( ON ?auto_155530 ?auto_155531 ) ( ON ?auto_155529 ?auto_155530 ) ( CLEAR ?auto_155527 ) ( ON ?auto_155528 ?auto_155529 ) ( CLEAR ?auto_155528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155527 ?auto_155528 )
      ( MAKE-12PILE ?auto_155527 ?auto_155528 ?auto_155529 ?auto_155530 ?auto_155531 ?auto_155532 ?auto_155533 ?auto_155534 ?auto_155535 ?auto_155536 ?auto_155537 ?auto_155538 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155552 - BLOCK
      ?auto_155553 - BLOCK
      ?auto_155554 - BLOCK
      ?auto_155555 - BLOCK
      ?auto_155556 - BLOCK
      ?auto_155557 - BLOCK
      ?auto_155558 - BLOCK
      ?auto_155559 - BLOCK
      ?auto_155560 - BLOCK
      ?auto_155561 - BLOCK
      ?auto_155562 - BLOCK
      ?auto_155563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155563 ) ( ON-TABLE ?auto_155552 ) ( not ( = ?auto_155552 ?auto_155553 ) ) ( not ( = ?auto_155552 ?auto_155554 ) ) ( not ( = ?auto_155552 ?auto_155555 ) ) ( not ( = ?auto_155552 ?auto_155556 ) ) ( not ( = ?auto_155552 ?auto_155557 ) ) ( not ( = ?auto_155552 ?auto_155558 ) ) ( not ( = ?auto_155552 ?auto_155559 ) ) ( not ( = ?auto_155552 ?auto_155560 ) ) ( not ( = ?auto_155552 ?auto_155561 ) ) ( not ( = ?auto_155552 ?auto_155562 ) ) ( not ( = ?auto_155552 ?auto_155563 ) ) ( not ( = ?auto_155553 ?auto_155554 ) ) ( not ( = ?auto_155553 ?auto_155555 ) ) ( not ( = ?auto_155553 ?auto_155556 ) ) ( not ( = ?auto_155553 ?auto_155557 ) ) ( not ( = ?auto_155553 ?auto_155558 ) ) ( not ( = ?auto_155553 ?auto_155559 ) ) ( not ( = ?auto_155553 ?auto_155560 ) ) ( not ( = ?auto_155553 ?auto_155561 ) ) ( not ( = ?auto_155553 ?auto_155562 ) ) ( not ( = ?auto_155553 ?auto_155563 ) ) ( not ( = ?auto_155554 ?auto_155555 ) ) ( not ( = ?auto_155554 ?auto_155556 ) ) ( not ( = ?auto_155554 ?auto_155557 ) ) ( not ( = ?auto_155554 ?auto_155558 ) ) ( not ( = ?auto_155554 ?auto_155559 ) ) ( not ( = ?auto_155554 ?auto_155560 ) ) ( not ( = ?auto_155554 ?auto_155561 ) ) ( not ( = ?auto_155554 ?auto_155562 ) ) ( not ( = ?auto_155554 ?auto_155563 ) ) ( not ( = ?auto_155555 ?auto_155556 ) ) ( not ( = ?auto_155555 ?auto_155557 ) ) ( not ( = ?auto_155555 ?auto_155558 ) ) ( not ( = ?auto_155555 ?auto_155559 ) ) ( not ( = ?auto_155555 ?auto_155560 ) ) ( not ( = ?auto_155555 ?auto_155561 ) ) ( not ( = ?auto_155555 ?auto_155562 ) ) ( not ( = ?auto_155555 ?auto_155563 ) ) ( not ( = ?auto_155556 ?auto_155557 ) ) ( not ( = ?auto_155556 ?auto_155558 ) ) ( not ( = ?auto_155556 ?auto_155559 ) ) ( not ( = ?auto_155556 ?auto_155560 ) ) ( not ( = ?auto_155556 ?auto_155561 ) ) ( not ( = ?auto_155556 ?auto_155562 ) ) ( not ( = ?auto_155556 ?auto_155563 ) ) ( not ( = ?auto_155557 ?auto_155558 ) ) ( not ( = ?auto_155557 ?auto_155559 ) ) ( not ( = ?auto_155557 ?auto_155560 ) ) ( not ( = ?auto_155557 ?auto_155561 ) ) ( not ( = ?auto_155557 ?auto_155562 ) ) ( not ( = ?auto_155557 ?auto_155563 ) ) ( not ( = ?auto_155558 ?auto_155559 ) ) ( not ( = ?auto_155558 ?auto_155560 ) ) ( not ( = ?auto_155558 ?auto_155561 ) ) ( not ( = ?auto_155558 ?auto_155562 ) ) ( not ( = ?auto_155558 ?auto_155563 ) ) ( not ( = ?auto_155559 ?auto_155560 ) ) ( not ( = ?auto_155559 ?auto_155561 ) ) ( not ( = ?auto_155559 ?auto_155562 ) ) ( not ( = ?auto_155559 ?auto_155563 ) ) ( not ( = ?auto_155560 ?auto_155561 ) ) ( not ( = ?auto_155560 ?auto_155562 ) ) ( not ( = ?auto_155560 ?auto_155563 ) ) ( not ( = ?auto_155561 ?auto_155562 ) ) ( not ( = ?auto_155561 ?auto_155563 ) ) ( not ( = ?auto_155562 ?auto_155563 ) ) ( ON ?auto_155562 ?auto_155563 ) ( ON ?auto_155561 ?auto_155562 ) ( ON ?auto_155560 ?auto_155561 ) ( ON ?auto_155559 ?auto_155560 ) ( ON ?auto_155558 ?auto_155559 ) ( ON ?auto_155557 ?auto_155558 ) ( ON ?auto_155556 ?auto_155557 ) ( ON ?auto_155555 ?auto_155556 ) ( ON ?auto_155554 ?auto_155555 ) ( CLEAR ?auto_155552 ) ( ON ?auto_155553 ?auto_155554 ) ( CLEAR ?auto_155553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_155552 ?auto_155553 )
      ( MAKE-12PILE ?auto_155552 ?auto_155553 ?auto_155554 ?auto_155555 ?auto_155556 ?auto_155557 ?auto_155558 ?auto_155559 ?auto_155560 ?auto_155561 ?auto_155562 ?auto_155563 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155576 - BLOCK
      ?auto_155577 - BLOCK
      ?auto_155578 - BLOCK
      ?auto_155579 - BLOCK
      ?auto_155580 - BLOCK
      ?auto_155581 - BLOCK
      ?auto_155582 - BLOCK
      ?auto_155583 - BLOCK
      ?auto_155584 - BLOCK
      ?auto_155585 - BLOCK
      ?auto_155586 - BLOCK
      ?auto_155587 - BLOCK
    )
    :vars
    (
      ?auto_155588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_155587 ?auto_155588 ) ( not ( = ?auto_155576 ?auto_155577 ) ) ( not ( = ?auto_155576 ?auto_155578 ) ) ( not ( = ?auto_155576 ?auto_155579 ) ) ( not ( = ?auto_155576 ?auto_155580 ) ) ( not ( = ?auto_155576 ?auto_155581 ) ) ( not ( = ?auto_155576 ?auto_155582 ) ) ( not ( = ?auto_155576 ?auto_155583 ) ) ( not ( = ?auto_155576 ?auto_155584 ) ) ( not ( = ?auto_155576 ?auto_155585 ) ) ( not ( = ?auto_155576 ?auto_155586 ) ) ( not ( = ?auto_155576 ?auto_155587 ) ) ( not ( = ?auto_155576 ?auto_155588 ) ) ( not ( = ?auto_155577 ?auto_155578 ) ) ( not ( = ?auto_155577 ?auto_155579 ) ) ( not ( = ?auto_155577 ?auto_155580 ) ) ( not ( = ?auto_155577 ?auto_155581 ) ) ( not ( = ?auto_155577 ?auto_155582 ) ) ( not ( = ?auto_155577 ?auto_155583 ) ) ( not ( = ?auto_155577 ?auto_155584 ) ) ( not ( = ?auto_155577 ?auto_155585 ) ) ( not ( = ?auto_155577 ?auto_155586 ) ) ( not ( = ?auto_155577 ?auto_155587 ) ) ( not ( = ?auto_155577 ?auto_155588 ) ) ( not ( = ?auto_155578 ?auto_155579 ) ) ( not ( = ?auto_155578 ?auto_155580 ) ) ( not ( = ?auto_155578 ?auto_155581 ) ) ( not ( = ?auto_155578 ?auto_155582 ) ) ( not ( = ?auto_155578 ?auto_155583 ) ) ( not ( = ?auto_155578 ?auto_155584 ) ) ( not ( = ?auto_155578 ?auto_155585 ) ) ( not ( = ?auto_155578 ?auto_155586 ) ) ( not ( = ?auto_155578 ?auto_155587 ) ) ( not ( = ?auto_155578 ?auto_155588 ) ) ( not ( = ?auto_155579 ?auto_155580 ) ) ( not ( = ?auto_155579 ?auto_155581 ) ) ( not ( = ?auto_155579 ?auto_155582 ) ) ( not ( = ?auto_155579 ?auto_155583 ) ) ( not ( = ?auto_155579 ?auto_155584 ) ) ( not ( = ?auto_155579 ?auto_155585 ) ) ( not ( = ?auto_155579 ?auto_155586 ) ) ( not ( = ?auto_155579 ?auto_155587 ) ) ( not ( = ?auto_155579 ?auto_155588 ) ) ( not ( = ?auto_155580 ?auto_155581 ) ) ( not ( = ?auto_155580 ?auto_155582 ) ) ( not ( = ?auto_155580 ?auto_155583 ) ) ( not ( = ?auto_155580 ?auto_155584 ) ) ( not ( = ?auto_155580 ?auto_155585 ) ) ( not ( = ?auto_155580 ?auto_155586 ) ) ( not ( = ?auto_155580 ?auto_155587 ) ) ( not ( = ?auto_155580 ?auto_155588 ) ) ( not ( = ?auto_155581 ?auto_155582 ) ) ( not ( = ?auto_155581 ?auto_155583 ) ) ( not ( = ?auto_155581 ?auto_155584 ) ) ( not ( = ?auto_155581 ?auto_155585 ) ) ( not ( = ?auto_155581 ?auto_155586 ) ) ( not ( = ?auto_155581 ?auto_155587 ) ) ( not ( = ?auto_155581 ?auto_155588 ) ) ( not ( = ?auto_155582 ?auto_155583 ) ) ( not ( = ?auto_155582 ?auto_155584 ) ) ( not ( = ?auto_155582 ?auto_155585 ) ) ( not ( = ?auto_155582 ?auto_155586 ) ) ( not ( = ?auto_155582 ?auto_155587 ) ) ( not ( = ?auto_155582 ?auto_155588 ) ) ( not ( = ?auto_155583 ?auto_155584 ) ) ( not ( = ?auto_155583 ?auto_155585 ) ) ( not ( = ?auto_155583 ?auto_155586 ) ) ( not ( = ?auto_155583 ?auto_155587 ) ) ( not ( = ?auto_155583 ?auto_155588 ) ) ( not ( = ?auto_155584 ?auto_155585 ) ) ( not ( = ?auto_155584 ?auto_155586 ) ) ( not ( = ?auto_155584 ?auto_155587 ) ) ( not ( = ?auto_155584 ?auto_155588 ) ) ( not ( = ?auto_155585 ?auto_155586 ) ) ( not ( = ?auto_155585 ?auto_155587 ) ) ( not ( = ?auto_155585 ?auto_155588 ) ) ( not ( = ?auto_155586 ?auto_155587 ) ) ( not ( = ?auto_155586 ?auto_155588 ) ) ( not ( = ?auto_155587 ?auto_155588 ) ) ( ON ?auto_155586 ?auto_155587 ) ( ON ?auto_155585 ?auto_155586 ) ( ON ?auto_155584 ?auto_155585 ) ( ON ?auto_155583 ?auto_155584 ) ( ON ?auto_155582 ?auto_155583 ) ( ON ?auto_155581 ?auto_155582 ) ( ON ?auto_155580 ?auto_155581 ) ( ON ?auto_155579 ?auto_155580 ) ( ON ?auto_155578 ?auto_155579 ) ( ON ?auto_155577 ?auto_155578 ) ( ON ?auto_155576 ?auto_155577 ) ( CLEAR ?auto_155576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155576 )
      ( MAKE-12PILE ?auto_155576 ?auto_155577 ?auto_155578 ?auto_155579 ?auto_155580 ?auto_155581 ?auto_155582 ?auto_155583 ?auto_155584 ?auto_155585 ?auto_155586 ?auto_155587 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155601 - BLOCK
      ?auto_155602 - BLOCK
      ?auto_155603 - BLOCK
      ?auto_155604 - BLOCK
      ?auto_155605 - BLOCK
      ?auto_155606 - BLOCK
      ?auto_155607 - BLOCK
      ?auto_155608 - BLOCK
      ?auto_155609 - BLOCK
      ?auto_155610 - BLOCK
      ?auto_155611 - BLOCK
      ?auto_155612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_155612 ) ( not ( = ?auto_155601 ?auto_155602 ) ) ( not ( = ?auto_155601 ?auto_155603 ) ) ( not ( = ?auto_155601 ?auto_155604 ) ) ( not ( = ?auto_155601 ?auto_155605 ) ) ( not ( = ?auto_155601 ?auto_155606 ) ) ( not ( = ?auto_155601 ?auto_155607 ) ) ( not ( = ?auto_155601 ?auto_155608 ) ) ( not ( = ?auto_155601 ?auto_155609 ) ) ( not ( = ?auto_155601 ?auto_155610 ) ) ( not ( = ?auto_155601 ?auto_155611 ) ) ( not ( = ?auto_155601 ?auto_155612 ) ) ( not ( = ?auto_155602 ?auto_155603 ) ) ( not ( = ?auto_155602 ?auto_155604 ) ) ( not ( = ?auto_155602 ?auto_155605 ) ) ( not ( = ?auto_155602 ?auto_155606 ) ) ( not ( = ?auto_155602 ?auto_155607 ) ) ( not ( = ?auto_155602 ?auto_155608 ) ) ( not ( = ?auto_155602 ?auto_155609 ) ) ( not ( = ?auto_155602 ?auto_155610 ) ) ( not ( = ?auto_155602 ?auto_155611 ) ) ( not ( = ?auto_155602 ?auto_155612 ) ) ( not ( = ?auto_155603 ?auto_155604 ) ) ( not ( = ?auto_155603 ?auto_155605 ) ) ( not ( = ?auto_155603 ?auto_155606 ) ) ( not ( = ?auto_155603 ?auto_155607 ) ) ( not ( = ?auto_155603 ?auto_155608 ) ) ( not ( = ?auto_155603 ?auto_155609 ) ) ( not ( = ?auto_155603 ?auto_155610 ) ) ( not ( = ?auto_155603 ?auto_155611 ) ) ( not ( = ?auto_155603 ?auto_155612 ) ) ( not ( = ?auto_155604 ?auto_155605 ) ) ( not ( = ?auto_155604 ?auto_155606 ) ) ( not ( = ?auto_155604 ?auto_155607 ) ) ( not ( = ?auto_155604 ?auto_155608 ) ) ( not ( = ?auto_155604 ?auto_155609 ) ) ( not ( = ?auto_155604 ?auto_155610 ) ) ( not ( = ?auto_155604 ?auto_155611 ) ) ( not ( = ?auto_155604 ?auto_155612 ) ) ( not ( = ?auto_155605 ?auto_155606 ) ) ( not ( = ?auto_155605 ?auto_155607 ) ) ( not ( = ?auto_155605 ?auto_155608 ) ) ( not ( = ?auto_155605 ?auto_155609 ) ) ( not ( = ?auto_155605 ?auto_155610 ) ) ( not ( = ?auto_155605 ?auto_155611 ) ) ( not ( = ?auto_155605 ?auto_155612 ) ) ( not ( = ?auto_155606 ?auto_155607 ) ) ( not ( = ?auto_155606 ?auto_155608 ) ) ( not ( = ?auto_155606 ?auto_155609 ) ) ( not ( = ?auto_155606 ?auto_155610 ) ) ( not ( = ?auto_155606 ?auto_155611 ) ) ( not ( = ?auto_155606 ?auto_155612 ) ) ( not ( = ?auto_155607 ?auto_155608 ) ) ( not ( = ?auto_155607 ?auto_155609 ) ) ( not ( = ?auto_155607 ?auto_155610 ) ) ( not ( = ?auto_155607 ?auto_155611 ) ) ( not ( = ?auto_155607 ?auto_155612 ) ) ( not ( = ?auto_155608 ?auto_155609 ) ) ( not ( = ?auto_155608 ?auto_155610 ) ) ( not ( = ?auto_155608 ?auto_155611 ) ) ( not ( = ?auto_155608 ?auto_155612 ) ) ( not ( = ?auto_155609 ?auto_155610 ) ) ( not ( = ?auto_155609 ?auto_155611 ) ) ( not ( = ?auto_155609 ?auto_155612 ) ) ( not ( = ?auto_155610 ?auto_155611 ) ) ( not ( = ?auto_155610 ?auto_155612 ) ) ( not ( = ?auto_155611 ?auto_155612 ) ) ( ON ?auto_155611 ?auto_155612 ) ( ON ?auto_155610 ?auto_155611 ) ( ON ?auto_155609 ?auto_155610 ) ( ON ?auto_155608 ?auto_155609 ) ( ON ?auto_155607 ?auto_155608 ) ( ON ?auto_155606 ?auto_155607 ) ( ON ?auto_155605 ?auto_155606 ) ( ON ?auto_155604 ?auto_155605 ) ( ON ?auto_155603 ?auto_155604 ) ( ON ?auto_155602 ?auto_155603 ) ( ON ?auto_155601 ?auto_155602 ) ( CLEAR ?auto_155601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_155601 )
      ( MAKE-12PILE ?auto_155601 ?auto_155602 ?auto_155603 ?auto_155604 ?auto_155605 ?auto_155606 ?auto_155607 ?auto_155608 ?auto_155609 ?auto_155610 ?auto_155611 ?auto_155612 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_155625 - BLOCK
      ?auto_155626 - BLOCK
      ?auto_155627 - BLOCK
      ?auto_155628 - BLOCK
      ?auto_155629 - BLOCK
      ?auto_155630 - BLOCK
      ?auto_155631 - BLOCK
      ?auto_155632 - BLOCK
      ?auto_155633 - BLOCK
      ?auto_155634 - BLOCK
      ?auto_155635 - BLOCK
      ?auto_155636 - BLOCK
    )
    :vars
    (
      ?auto_155637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_155625 ?auto_155626 ) ) ( not ( = ?auto_155625 ?auto_155627 ) ) ( not ( = ?auto_155625 ?auto_155628 ) ) ( not ( = ?auto_155625 ?auto_155629 ) ) ( not ( = ?auto_155625 ?auto_155630 ) ) ( not ( = ?auto_155625 ?auto_155631 ) ) ( not ( = ?auto_155625 ?auto_155632 ) ) ( not ( = ?auto_155625 ?auto_155633 ) ) ( not ( = ?auto_155625 ?auto_155634 ) ) ( not ( = ?auto_155625 ?auto_155635 ) ) ( not ( = ?auto_155625 ?auto_155636 ) ) ( not ( = ?auto_155626 ?auto_155627 ) ) ( not ( = ?auto_155626 ?auto_155628 ) ) ( not ( = ?auto_155626 ?auto_155629 ) ) ( not ( = ?auto_155626 ?auto_155630 ) ) ( not ( = ?auto_155626 ?auto_155631 ) ) ( not ( = ?auto_155626 ?auto_155632 ) ) ( not ( = ?auto_155626 ?auto_155633 ) ) ( not ( = ?auto_155626 ?auto_155634 ) ) ( not ( = ?auto_155626 ?auto_155635 ) ) ( not ( = ?auto_155626 ?auto_155636 ) ) ( not ( = ?auto_155627 ?auto_155628 ) ) ( not ( = ?auto_155627 ?auto_155629 ) ) ( not ( = ?auto_155627 ?auto_155630 ) ) ( not ( = ?auto_155627 ?auto_155631 ) ) ( not ( = ?auto_155627 ?auto_155632 ) ) ( not ( = ?auto_155627 ?auto_155633 ) ) ( not ( = ?auto_155627 ?auto_155634 ) ) ( not ( = ?auto_155627 ?auto_155635 ) ) ( not ( = ?auto_155627 ?auto_155636 ) ) ( not ( = ?auto_155628 ?auto_155629 ) ) ( not ( = ?auto_155628 ?auto_155630 ) ) ( not ( = ?auto_155628 ?auto_155631 ) ) ( not ( = ?auto_155628 ?auto_155632 ) ) ( not ( = ?auto_155628 ?auto_155633 ) ) ( not ( = ?auto_155628 ?auto_155634 ) ) ( not ( = ?auto_155628 ?auto_155635 ) ) ( not ( = ?auto_155628 ?auto_155636 ) ) ( not ( = ?auto_155629 ?auto_155630 ) ) ( not ( = ?auto_155629 ?auto_155631 ) ) ( not ( = ?auto_155629 ?auto_155632 ) ) ( not ( = ?auto_155629 ?auto_155633 ) ) ( not ( = ?auto_155629 ?auto_155634 ) ) ( not ( = ?auto_155629 ?auto_155635 ) ) ( not ( = ?auto_155629 ?auto_155636 ) ) ( not ( = ?auto_155630 ?auto_155631 ) ) ( not ( = ?auto_155630 ?auto_155632 ) ) ( not ( = ?auto_155630 ?auto_155633 ) ) ( not ( = ?auto_155630 ?auto_155634 ) ) ( not ( = ?auto_155630 ?auto_155635 ) ) ( not ( = ?auto_155630 ?auto_155636 ) ) ( not ( = ?auto_155631 ?auto_155632 ) ) ( not ( = ?auto_155631 ?auto_155633 ) ) ( not ( = ?auto_155631 ?auto_155634 ) ) ( not ( = ?auto_155631 ?auto_155635 ) ) ( not ( = ?auto_155631 ?auto_155636 ) ) ( not ( = ?auto_155632 ?auto_155633 ) ) ( not ( = ?auto_155632 ?auto_155634 ) ) ( not ( = ?auto_155632 ?auto_155635 ) ) ( not ( = ?auto_155632 ?auto_155636 ) ) ( not ( = ?auto_155633 ?auto_155634 ) ) ( not ( = ?auto_155633 ?auto_155635 ) ) ( not ( = ?auto_155633 ?auto_155636 ) ) ( not ( = ?auto_155634 ?auto_155635 ) ) ( not ( = ?auto_155634 ?auto_155636 ) ) ( not ( = ?auto_155635 ?auto_155636 ) ) ( ON ?auto_155625 ?auto_155637 ) ( not ( = ?auto_155636 ?auto_155637 ) ) ( not ( = ?auto_155635 ?auto_155637 ) ) ( not ( = ?auto_155634 ?auto_155637 ) ) ( not ( = ?auto_155633 ?auto_155637 ) ) ( not ( = ?auto_155632 ?auto_155637 ) ) ( not ( = ?auto_155631 ?auto_155637 ) ) ( not ( = ?auto_155630 ?auto_155637 ) ) ( not ( = ?auto_155629 ?auto_155637 ) ) ( not ( = ?auto_155628 ?auto_155637 ) ) ( not ( = ?auto_155627 ?auto_155637 ) ) ( not ( = ?auto_155626 ?auto_155637 ) ) ( not ( = ?auto_155625 ?auto_155637 ) ) ( ON ?auto_155626 ?auto_155625 ) ( ON ?auto_155627 ?auto_155626 ) ( ON ?auto_155628 ?auto_155627 ) ( ON ?auto_155629 ?auto_155628 ) ( ON ?auto_155630 ?auto_155629 ) ( ON ?auto_155631 ?auto_155630 ) ( ON ?auto_155632 ?auto_155631 ) ( ON ?auto_155633 ?auto_155632 ) ( ON ?auto_155634 ?auto_155633 ) ( ON ?auto_155635 ?auto_155634 ) ( ON ?auto_155636 ?auto_155635 ) ( CLEAR ?auto_155636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_155636 ?auto_155635 ?auto_155634 ?auto_155633 ?auto_155632 ?auto_155631 ?auto_155630 ?auto_155629 ?auto_155628 ?auto_155627 ?auto_155626 ?auto_155625 )
      ( MAKE-12PILE ?auto_155625 ?auto_155626 ?auto_155627 ?auto_155628 ?auto_155629 ?auto_155630 ?auto_155631 ?auto_155632 ?auto_155633 ?auto_155634 ?auto_155635 ?auto_155636 ) )
  )

)

